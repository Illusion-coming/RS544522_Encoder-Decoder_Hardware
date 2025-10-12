// syndrome_lane_fwd 校正子计算单元，每个校正子计算单元计算一个校正子
// RS(544, 522)22个校正子系数需要22个校正子计算单元syndrome_lane_fwd 并行计算
// ---------------- GF 常量乘封装（参数 C 与输入 x 相乘） ----------------
module gf10_const_mul_by_param #(
    parameter logic [9:0] C = 10'd1
    ) (
    input  logic [9:0] x,
    output logic [9:0] y
    );
    gf1024_mul_pb_k5_flat u_mul ( .A(x), .B(C), .P(y) );
endmodule

// ---------------- 单通道：计算 s_J_IDX（前向权重版，精简无额外流水） ----------------
module syndrome_lane_fwd #(
    parameter int J       = 22,
    parameter int M       = 32,
    parameter int J_IDX   = 1   // 1..22
    ) (
    input  logic              clk_i,
    input  logic              rst_ni,
    input  logic              valid_i,
    input  logic              start_i,
    input  logic              last_i,
    input  logic [9:0]        data_i [0:M-1],     // 本拍：data_i[m] × α^{J_IDX·m}
    output reg                s_valid_o,  // 与 s_o 对齐（本实现为 0 级流水）
    output logic [9:0]        s_o         // s_J_IDX
    );
    import rs544_syndrome_consts_M32_pkg::*; // 提供 J=22, M=32, WEIGHT_FWD[j][m], FEEDBACK[j]
    // 常量（来自 forward 包）
    localparam logic [9:0] FEEDBACK_C = FEEDBACK[J - J_IDX]; // α^{J_IDX·32}

    // 拍内常量乘（m=0 直通，m=1..31 常量乘）
    logic [9:0] prod [M-1:0];
    assign prod[0] = data_i[0];
    genvar m;
    generate
        for (m=1; m<M; m++) begin : g_mul
        gf10_const_mul_by_param #(.C(WEIGHT_FWD[J - J_IDX][M - 1 - m])) u_mul_const (
            .x (data_i[m]),
            .y (prod[m])
        );
        end
    endgenerate

    // 拍内 XOR 归约
    logic [9:0] sum_j;
    integer k;
    always @(*) begin
        sum_j = '0;
        for (k=0; k<M; k++) begin
            sum_j ^= prod[k];
        end
    end

    // 反馈乘 + 累加（块级 Horner）
    reg   [9:0] s_d;    // 当前状态寄存器 s_k
    reg   [9:0] s_q;    // 当前状态寄存器 s_q
    logic [9:0] fb_p;   // s_k × α^{J_IDX·32}
    logic [9:0] s_n;    // 下一状态 s_{k+1}

    gf10_const_mul_by_param #(.C(FEEDBACK_C)) u_mul_fb (.x(s_d), .y(fb_p));
    
    assign s_n = (start_i) ? sum_j : (fb_p ^ sum_j);

    // 状态更新
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            s_d <= '0;
        end else if (valid_i) begin
            s_d <= s_n;
        end
    end

    // 输出（0 级流水：帧尾同拍有效）
    assign s_o = s_d;
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) s_valid_o <= 1'b0;
        else         s_valid_o <= (valid_i && last_i);
    end


endmodule