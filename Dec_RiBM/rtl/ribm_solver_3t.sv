// ----------------------------------------------------------------------------
// ribm_solver_3t.sv
// RS(544,522), GF(2^10), t=11 默认；3t 个 PE（可选 3t+1 等构）
// 与 Python: RSCoderRiBM_parallel_systolic3t 的逐拍算法一致。
// ----------------------------------------------------------------------------

// =============== 子模块：GF(2^10) 乘法封装 ================================
// 外部已提供：gf1024_mul_pb_k5_flat
// parameter REGISTERED = 1'b0 , wire直接输出；REGISTERED = 1'b1 , 寄存器延迟一拍输出；
module gf1024_mul #(
    parameter int W = 10,
    parameter bit REGISTERED = 1'b0
    ) (
    input  logic [W-1:0] A,
    input  logic [W-1:0] B,
    output logic [W-1:0] P,
    input  logic         clk_i,
    input  logic         rst_ni
    );
    wire [W-1:0] p_w;
    gf1024_mul_pb_k5_flat u_mul (.A(A), .B(B), .P(p_w));
    generate if (REGISTERED) begin
        always @(posedge clk_i or negedge rst_ni)  begin
            if(!rst_ni) begin
                P <= 'b0;
            end else begin
                P <= p_w;
            end
        end
    end else begin
        assign P = p_w;
    end endgenerate
endmodule

// =============== 子模块：PE（两乘一加） ====================================
// Y = gamma*A - Delta*B  （GF(2^m) 加法 = XOR，减法等价）
// parameter REG_OUT = 1'b0 , wire直接输出; REG_OUT = 1'b1 , 寄存器延迟一拍输出；
module ribm_pe_2mul #(
    parameter int W = 10,
    parameter bit REG_OUT = 1'b0
    ) (
    input  logic [W-1:0] gamma_i,
    input  logic [W-1:0] Delta_i,
    input  logic [W-1:0] A_i,
    input  logic [W-1:0] B_i,
    output logic [W-1:0] Y_o,
    input  logic         clk_i,
    input  logic         rst_ni
    );
    logic [W-1:0] gA, dB, y_w;
    gf1024_mul #(.W(W), .REGISTERED(1'b0)) u_mul0 (.A(gamma_i), .B(A_i), .P(gA), .clk_i(clk_i), .rst_ni(rst_ni) );
    gf1024_mul #(.W(W), .REGISTERED(1'b0)) u_mul1 (.A(Delta_i), .B(B_i), .P(dB), .clk_i(clk_i), .rst_ni(rst_ni) );
    assign y_w = gA ^ dB;
    generate if (REG_OUT) begin
        always @(posedge clk_i or negedge rst_ni) begin
            if(!rst_ni) begin
                Y_o <= 'b0;
            end else begin
                Y_o <= y_w;
            end
        end
    end else begin
        assign Y_o = y_w;
    end endgenerate
endmodule

// =============== 子模块：控制模块 ==========================================
// cond = (dp0 != 0) && (k >= 0)
// cond=1:  b<-lam, theta<-x*delta, gamma<-dp0, k<- -k-1
// cond=0:  b<-x*b, theta<-theta     , gamma<-gamma, k<- k+1
module ctrl_mc #(
    parameter int W  = 10,
    parameter int KW = 6
    ) (
    input  logic [W-1:0]        dp0_i,
    input  logic signed [KW-1:0] k_i,
    input  logic [W-1:0]        gamma_i,
    output logic                cond_o,
    output logic                b_sel_lam_o,
    output logic                theta_sel_xd_o,
    output logic [W-1:0]        gamma_next_o,
    output logic signed [KW-1:0] k_next_o
    );
    assign cond_o         = (dp0_i != '0) && (k_i >= 0);
    assign b_sel_lam_o    = cond_o;
    assign theta_sel_xd_o = cond_o;
    assign gamma_next_o   = cond_o ? dp0_i : gamma_i;
    assign k_next_o       = cond_o ? (-k_i - 1) : (k_i + 1);
endmodule

// =============== 顶层：riBM 3t-PE 求解器 ====================================
module ribm_solver_3t #(
    parameter int T               = 11,       // 纠错能力
    parameter int W               = 10,       // GF 位宽
    parameter bit INCLUDE_LAM0_PE = 1'b0,     // 0: 精确 3t 个 PE；1: 3t+1 等构
    parameter bit OUTPUT_OMEGA    = 1'b0,     // 0: 不输出 ω；1: 另行后处理输出 ω
    parameter int KW              = 6         // k 计数位宽（t=11 时 6 足够）
    ) (
    input  logic              clk_i,
    input  logic              rst_ni,
    // 一拍装载校正子 s[0..2t]（若 s0 固定为 0 也保持带入）
    input  logic [W-1:0]      syn_i       [0:2*T],
    input  logic              syn_valid_i,
    // 触发
    input  logic              start_i,
    // 状态与完成
    output logic              busy_o,
    output logic              done_o,
    // 并行输出（低阶在前）
    output logic [W-1:0]      sigma_bus_o [0:T],
    output logic [W-1:0]      v_bus_o     [0:T-1],
    output logic [W-1:0]      omega_bus_o [0:T-1],
    output logic              result_valid_o
    );
    // -------------------- 常量 --------------------
    localparam logic [W-1:0] GF_ZERO = '0;
    localparam logic [W-1:0] GF_ONE  = {{W-1{1'b0}}, 1'b1};

    // -------------------- 寄存器（低阶在前） --------------------
    logic [W-1:0] lam_reg   [0:T];          //λ lam_reg[0]  = 1
    logic [W-1:0] b_reg     [0:T];          //b b_reg[0]    = 1
    logic [W-1:0] delta_reg [0:2*T-1];      //δ delta_reg[0]= 0
    logic [W-1:0] theta_reg [0:2*T-1];      //θ theta_reg[0]= 0
    logic [W-1:0] gamma_reg;                //γ
    logic signed [KW-1:0] k_reg;
    logic [KW-1:0]        r_cnt;
    logic                 busy;
    assign busy_o = busy;

    // -------------------- 广播信号 --------------------
    wire [W-1:0] dp0_w = delta_reg[0];

    // -------------------- 控制模块实例 --------------------
    wire cond_w, b_sel_lam_w, theta_sel_xd_w;
    wire [W-1:0]        gamma_next_w;
    wire signed [KW-1:0] k_next_w;
    ctrl_mc #(.W(W), .KW(KW)) u_ctrl (
        .dp0_i(dp0_w), .k_i(k_reg), .gamma_i(gamma_reg),
        .cond_o(cond_w), .b_sel_lam_o(b_sel_lam_w), .theta_sel_xd_o(theta_sel_xd_w),
        .gamma_next_o(gamma_next_w), .k_next_o(k_next_w)
    );

    // -------------------- λ 带 PEs --------------------
    wire [W-1:0] lam_pe_y [0:T];

    generate
        if (INCLUDE_LAM0_PE) begin : G_LAM0_PE
            ribm_pe_2mul #(.W(W), .REG_OUT(1'b0)) u_lam0 (
                .gamma_i(gamma_reg), .Delta_i(dp0_w), .A_i(lam_reg[0]), .B_i(GF_ZERO), .Y_o(lam_pe_y[0]), .clk_i(clk_i), .rst_ni(rst_ni) );
        end else begin : G_LAM0_MUL
            // 边界位 i=0：Y = γ*λ[0]
            gf1024_mul #(.W(W), .REGISTERED(1'b0)) u_lam0_mul (
                .A(gamma_reg), .B(lam_reg[0]), .P(lam_pe_y[0]), .clk_i(clk_i), .rst_ni(rst_ni) );
        end
        genvar i;
        for (i = 1; i <= T; i++) begin : G_LAM_PES
            ribm_pe_2mul #(.W(W), .REG_OUT(1'b0)) u_lam (
                .gamma_i(gamma_reg), .Delta_i(dp0_w), .A_i(lam_reg[i]), .B_i(b_reg[i-1]), .Y_o(lam_pe_y[i]), .clk_i(clk_i), .rst_ni(rst_ni) );
        end
    endgenerate

    // -------------------- δ 带 PEs --------------------
    wire [W-1:0] delta_pe_y [0:2*T-1];
    generate
        genvar j;
        for (j = 0; j < 2*T; j++) begin : G_DELTA_PES
            wire [W-1:0] A_j = (j+1 < 2*T) ? delta_reg[j+1] : GF_ZERO; // (x·delta)_j
            ribm_pe_2mul #(.W(W), .REG_OUT(1'b0)) u_delta (
                .gamma_i(gamma_reg), .Delta_i(dp0_w), .A_i(A_j), .B_i(theta_reg[j]), .Y_o(delta_pe_y[j]), .clk_i(clk_i), .rst_ni(rst_ni) );
        end
    endgenerate


    // -------------------- flag信号的rst与更新 --------------------
    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            // clear regs
            busy <= 1'b0; 
            done_o <= 1'b0; 
            result_valid_o <= 1'b0;
        end else begin
            done_o <= 1'b0; 
            result_valid_o <= 1'b0;
            if (start_i && syn_valid_i && !busy) begin
                busy <= 1'b1;
            end else if(r_cnt == 2*T-1)  begin
                busy <= 1'b0;
                done_o <= 1'b1;
                result_valid_o <= 1'b1;
            end
        end
    end

    //--------------------- r_cnt 计数 ------------------------------
    always @ (posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            r_cnt <= 'b0;
        end else if (start_i && syn_valid_i && !busy) begin 
            //下一次计算重新装配
            r_cnt <= 'b0;
        end else if(busy) begin
            r_cnt <= r_cnt + 1'b1;
        end
    end

    // -------------------- 迭代与输出时序 --------------------
    integer p, q;
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            // clear regs
            gamma_reg <= GF_ONE; 
            k_reg <= '0;
            lam_reg[0] <= GF_ONE;
             b_reg[0] <= GF_ONE;
            for (p = 1; p <= T; p++) begin 
                lam_reg[p] <= GF_ZERO; b_reg[p] <= GF_ZERO; 
            end
            for (q = 0; q < 2*T; q++) begin 
                delta_reg[q] <= GF_ZERO; theta_reg[q] <= GF_ZERO; 
            end
        end else begin
            // 装载启动
            if (start_i && syn_valid_i && !busy) begin
                for (q = 0; q < 2*T; q++) begin
                    delta_reg[q] <= syn_i[q+1]; // δ0[i] = s[i+1]
                    theta_reg[q] <= syn_i[q+1]; // θ0 = δ0
                end
                for (p = 0; p <= T; p++) begin 
                    lam_reg[p] <= GF_ZERO; b_reg[p] <= GF_ZERO; 
                end
                lam_reg[0] <= GF_ONE; b_reg[0] <= GF_ONE;
                gamma_reg <= GF_ONE; k_reg <= '0;
            end else if (busy) begin
                // 写回 λ 与 δ（来自 PE 输出）
                for (p = 0; p <= T; p++) begin
                    lam_reg[p] <= lam_pe_y[p];
                end
                for (q = 0; q < 2*T; q++) begin
                    delta_reg[q] <= delta_pe_y[q];
                end
                // b, theta 的分支写回 非阻塞性赋值，写会的仍然是上个周期的存储的lamba λ, delta δ, theta θ
                if (b_sel_lam_w) begin
                    for (p = 0; p <= T; p++) b_reg[p] <= lam_reg[p];
                end else begin
                    b_reg[0] <= GF_ZERO;
                    for (p = 1; p <= T; p++) b_reg[p] <= b_reg[p-1]; // x·b
                end
                
                if (theta_sel_xd_w) begin
                    for (q = 0; q < 2*T; q++) 
                        theta_reg[q] <= (q+1 < 2*T) ? delta_reg[q+1] : GF_ZERO; // x·δ
                end else begin
                    for (q = 0; q < 2*T; q++) 
                        theta_reg[q] <= theta_reg[q];
                end
                // 标量与计数
                gamma_reg <= gamma_next_w;
                k_reg     <= k_next_w;
            end
        end
    end

    //--------------------- output ------------------------------
    always @ (posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            // outputs
            for (p = 0; p <= T; p++) sigma_bus_o[p] <= GF_ZERO;
            for (q = 0; q < T; q++)  v_bus_o[q]     <= GF_ZERO;
            for (q = 0; q < T; q++)  omega_bus_o[q] <= GF_ZERO;
            
        end else if(busy && (r_cnt == 2*T-1)) begin
            // 结束判定
            // 一拍并行输出（低阶在前）
            // for (p = 0; p <= T; p++) sigma_bus_o[p] <= lam_reg[p];
            // for (q = 0; q < T; q++)  v_bus_o[q]     <= delta_reg[q];
            for (p = 0; p <= T; p++) sigma_bus_o[p] <= lam_pe_y[p];
            for (q = 0; q < T; q++)  v_bus_o[q]     <= delta_pe_y[q];
            if (OUTPUT_OMEGA) begin
                // 留空：建议使用另一个后处理模块计算 ω 的低阶 T 项
                for (q = 0; q < T; q++) omega_bus_o[q] <= '0;
            end else begin
                for (q = 0; q < T; q++) omega_bus_o[q] <= '0;
            end
        end
    end


endmodule

