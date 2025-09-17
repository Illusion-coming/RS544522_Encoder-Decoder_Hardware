// =============================================================
// RS(544,522) Chien Search — 完整 RTL（按 SVH 常量直接适配）
// 层次：
//   - gf_mul10            ：GF(2^10) 乘法器薄封装（调用现有 gf1024_mul_pb_k5_flat）
//   - fifo_sclr           ：参数化同步 FIFO（单写单读），供控制模块复用
//   - chien_lane          ：单 lane，11 路乘法（j=1..T），装载 + 求和 + 逐拍递推
//   - root_collector      ：方案 B：将逐拍并行命中压缩成逐根流（内部仅做控制，FIFO 独立成子模块）
//   - chien_search (TOP)  ：顶层，例化 32 lanes，产生方案 A/B 输出
// 约束：
//   - 不使用 function / task
//   - 直接按 SVH 语义：负方向、且不含 l_start → j = idx = i*P + m
//   - CHIEN_INIT_W[m][0] == 1 → j=0 项装载直接赋 λ0，不占乘法器
// =============================================================

`timescale 1ns/1ps

// ---------------- GF(2^10) 乘法器薄封装 ----------------
module gf_mul10 (
    input  logic [9:0] a_i,
    input  logic [9:0] b_i,
    output logic [9:0] p_o
    );
    // 现有综合就绪的乘法器
    gf1024_mul_pb_k5_flat u_mul(.A(a_i), .B(b_i), .P(p_o));
endmodule

// ---------------- 单 lane：装载 + 求和 + 逐拍递推 ----------------
module chien_lane #(
    parameter int P = 32,
    parameter int W = 10,
    parameter int T = 11,
    parameter int M = 0      // 本 lane 的索引，用于索引 CHIEN_INIT_W[M][*]
    )(
    input  logic         clk_i,
    input  logic         rst_ni,
    // 装载（1 拍）：T_j <= λ_j * CHIEN_INIT_W[M][j]
    input  logic [W-1:0] lam_low_i [0:T], // 低阶在前：λ_0..λ_T
    input  logic         load_i,
    // 逐拍递推（每拍）：T_j<=T_j*CHIEN_GAMMA[j]（j=0 旁路）
    input  logic         step_i,
    // GF 求和值（异或累加）
    output logic [W-1:0] sum_o
    );
    import chien_consts_pkg::*; // 提供 CHIEN_GAMMA / CHIEN_INIT_W

    logic [W-1:0] Tj [0:T];       // 项寄存器

    // 11 路乘法（j=1..T），输入由“装载/递推”二选一复用
    logic [W-1:0] mul_a [1:T];
    logic [W-1:0] mul_b [1:T];
    logic [W-1:0] mul_p [1:T];

    logic [W-1:0] para_M;   
    assign para_M = M;


    genvar j;
    generate for (j=1; j<=T; j++) begin: g_mul
        gf_mul10 u_mul(.a_i(mul_a[j]), .b_i(mul_b[j]), .p_o(mul_p[j]));
    end endgenerate

    // 组合：求和（GF XOR）
    always @ (*) begin
        logic [W-1:0] acc;
        acc = Tj[0];
        for (int k=1; k<=T; k++) acc ^= Tj[k];
        sum_o = acc;
    end

    // 组合：乘法输入多路选择（装载 or 递推）
    // 注意verilog的索引规定
    // 在装载拍：mul_a=λ_j, mul_b=CHIEN_INIT_W[P-1-M][T - j]
    // 在递推拍：mul_a=Tj[j], mul_b=CHIEN_GAMMA[T - j]
    generate for (j=1; j<=T; j++) begin: g_mul_sel
        always @ (*) begin
            if (load_i) begin
                mul_a[j] = lam_low_i[j];
                mul_b[j] = CHIEN_INIT_W[P-1-M][T - j];
            end else begin
                // 默认进入递推相（当 step_i=1 时有效；step_i=0 该拍不会采样 mul_p）
                mul_a[j] = Tj[j];
                mul_b[j] = CHIEN_GAMMA[T - j];
            end
        end
    end endgenerate

    // 时序：装载 or 递推
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            for (int k=0; k<=T; k++) Tj[k] <= '0;
        end else if (load_i) begin
            // 首拍装载：j=0 直接赋值（CHIEN_INIT_W[M][0] == 1）
            Tj[0] <= lam_low_i[0];
            for (int k=1; k<=T; k++) begin
                Tj[k] <= mul_p[k]; // λ_k * CHIEN_INIT_W[M][k]
            end
        end else if (step_i) begin
            // 逐拍递推：Tj <= Tj * CHIEN_GAMMA（j=0 旁路保持）
            Tj[0] <= Tj[0];
            for (int k=1; k<=T; k++) begin
                Tj[k] <= mul_p[k]; // Tj[k] * CHIEN_GAMMA[k]
            end
        end
    end
endmodule

// ---------------- 顶层：32 lanes + 两类输出 ----------------
module chien_search #(
    parameter int W  = 10,
    parameter int T  = 11,
    parameter int P  = 32,
    parameter int N  = 1023,
    parameter int n  = 544
    )(
    input  logic              clk_i,
    input  logic              rst_ni,
    // 来自 RiBM：σ（低阶在前）与握手
    input  logic [W-1:0]      sigma_low_i [0:T], // 低阶在前：λ_0..λ_T（ribm_solver_3t.sigma_bus_o）
    input  logic              sigma_valid_i,     // ribm_solver_3t.result_valid_o
    input  logic              start_i,           // 触发开始扫描
    output logic              busy_o,
    output logic              done_o,

    // 方案 A：逐拍批量（与 32 lanes 对齐）
    output logic [P-1:0]         hit_mask_o,
    output logic [$clog2(N)-1:0] pos_bus_o [0:P-1]

    // // 方案 B：逐根流（来自子模块 root_collector）
    // output logic              root_v_o,
    // output logic [$clog2(N)-1:0] root_pos_o,
    // output logic              root_last_o,
    );
    import chien_consts_pkg::*; // 使用 CHIEN_GAMMA / CHIEN_INIT_W

    // 1) 锁存 σ（低阶在前）
    logic [W-1:0] lam_reg [0:T];
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            for (int k=0; k<=T; k++) lam_reg[k] <= '0;
        end else if (sigma_valid_i && start_i) begin
            for (int k=0; k<=T; k++) lam_reg[k] <= sigma_low_i[k];
        end
    end

    // 2) 例化 P 个 lane
    logic [W-1:0] sum_bus [0:P-1];
    logic         load_lane, step_lane;

    genvar m;
    generate for (m=0; m<P; m++) begin: g_lane
        chien_lane #(.P(P), .W(W), .T(T), .M(m)) u_lane (
        .clk_i   (clk_i),
        .rst_ni  (rst_ni),
        .lam_low_i(lam_reg),
        .load_i  (load_lane),
        .step_i  (step_lane),
        .sum_o   (sum_bus[m])
        );
    end endgenerate

    // 3) 控制 FSM（IDLE → LOAD → SCAN → DONE）
    localparam int BATCH_MAX = (n + P - 1) / P; // 544 → 17
    typedef enum logic [1:0] {S_IDLE, S_LOAD, S_SCAN, S_DONE} state_e;
    state_e state_next, state;

    logic [$clog2(BATCH_MAX)-1:0] batch_cnt, batch_cnt_next;
    logic working_q, working_next;
    logic done_pulse_d, done_pulse_q;

    // 组合：默认值
    always @ (*) begin
        state_next       = state;
        batch_cnt_next   = batch_cnt;
        working_next     = working_q;
        load_lane     = 1'b0;
        step_lane     = 1'b0;
        done_pulse_d  = 1'b0;

        case (state)
            S_IDLE: begin
                if (start_i && sigma_valid_i) begin
                    state_next     = S_LOAD;
                    working_next   = 1'b1;
                end
            end
            S_LOAD: begin
                // 1 拍装载
                load_lane   = 1'b1;
                batch_cnt_next = '0; // 下拍从 0 号批开始
                state_next     = S_SCAN;
            end
            S_SCAN: begin
                step_lane   = 1'b1;
                if (batch_cnt == (BATCH_MAX-1)) begin
                    state_next      = S_DONE;
                    done_pulse_d = 1'b1;
                end else begin
                    batch_cnt_next  = batch_cnt + 1'b1;
                end
            end
            S_DONE: begin
                working_next   = 1'b0;
                // 保持 1 拍 done 脉冲
                state_next     = S_IDLE;
            end
            default: state_next = S_IDLE;
        endcase
    end

    // 时序寄存
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            state      <= S_IDLE;
            batch_cnt  <= '0;
            working_q    <= 1'b0;
            done_pulse_q <= 1'b0;
        end else begin
            state      <= state_next;
            batch_cnt  <= batch_cnt_next;
            working_q    <= working_next;
            done_pulse_q <= done_pulse_d;
        end
    end

    assign busy_o = working_q;
    assign done_o = done_pulse_q;

    // 4) 命中与位置（方案 A）：按 SVH 直接适配 → j = idx = i*P + m
    //    为提升 Fmax，以下计算**组合产生**，并在末尾**统一寄存一拍**输出
    localparam int LP = $clog2(P);
    logic [$clog2(N)-1:0] idx_lane [0:P-1];
    logic [$clog2(N)-1:0] idx_cw   [0:P-1];
    logic [P - 1      :0] hit_mask;
    logic [$clog2(N)-1:0] pos_bus  [0:P-1];
    genvar t;
    generate for (t=0; t<P; t++) begin: g_pos
        // 组合：idx = i*P + t ；用移位代替乘法，**每个 lane 独立信号**
        assign idx_lane[t] = (batch_cnt << LP) + t[$clog2(P)-1:0];
        // 命中（最后一拍可能部分无效，保留通用判断）
        assign hit_mask[t] = (idx_lane[t] < n) && (sum_bus[t] == '0);
        // 镜像到接收码字高优先数组索引（r[543]..r[0]）
        assign idx_cw[t]   = (n-1) - idx_lane[t];
        assign pos_bus[t]  = idx_cw[t];
    end endgenerate


    integer o_i;
    // 延迟一排输出， 乘法和加减法一起算，关键路径过长
    always @ (posedge clk_i or negedge rst_ni ) begin
        if(!rst_ni) begin
            hit_mask_o <= 'b0;
            for(o_i = 0; o_i < P; o_i++) pos_bus_o[o_i] <= 'b0;
        end else if(step_lane)begin
            hit_mask_o <= hit_mask;
            for(o_i = 0; o_i < P; o_i++) pos_bus_o[o_i] <= pos_bus[o_i];
        end else begin
            hit_mask_o <= 'b0;
            for(o_i = 0; o_i < P; o_i++) pos_bus_o[o_i] <= 'b0;
        end
    end

    // // 5) 方案 B：根收集（逐根流）—— FIFO 作为独立子模块由 root_collector 例化调用
    // logic [$clog2(T+1)-1:0] rc_count;
    // root_collector #(.P(P), .Nw($clog2(N)), .T(T)) u_rc (
    //     .clk_i      (clk_i),
    //     .rst_ni     (rst_ni),
    //     .in_valid_i (step_lane), // 仅在 SCAN 拍有效
    //     // .hit_mask_i (hit_mask_o),
    //     // .pos_bus_i  (pos_bus_o),
    //     .hit_mask_i (hit_mask),
    //     .pos_bus_i  (pos_bus),
    //     .scan_done_i(done_pulse_q),
    //     .root_v_o   (root_v_o),
    //     .root_pos_o (root_pos_o),
    //     .root_last_o(root_last_o),
    //     .root_cnt_o (rc_count)
    // );

endmodule


// // ---------------- 根收集器：将逐拍并行命中压成逐根流（FIFO 外置） ----------------
// module root_collector #(
//     parameter int P  = 32,
//     parameter int Nw = 10,   // ⌈log2(1023)⌉
//     parameter int T  = 11    // 最多收集 T 个根
//     )(
//     input  logic           clk_i,
//     input  logic           rst_ni,
//     // 每拍批量输入（来自顶层 hit_mask/pos_bus）
//     input  logic           in_valid_i,              //step_lane
//     input  logic [P-1:0]   hit_mask_i,
//     input  logic [Nw-1:0]  pos_bus_i [0:P-1],
//     // 扫描完成指示（来自顶层 FSM 的 done 脉冲/标志）
//     input  logic           scan_done_i,
//     // 逐根输出（无 backpressure：每拍最多 1 根）
//     output logic           root_v_o,
//     output logic [Nw-1:0]  root_pos_o,
//     output logic           root_last_o,
//     // 可观察的 FIFO 计数（调试）
//     output logic [$clog2(T+1)-1:0] root_cnt_o
//     );
//     // 待序列化的待处理掩码/位置（累积 OR）
//     logic [P-1:0]   pend_mask;
//     logic [Nw-1:0]  pend_pos  [0:P-1];

//     // 选择器：从 pending 中取最低位 1
//     logic have_pending;
//     logic [$clog2(P)-1:0] sel_idx;
//     always @(*) begin
//         have_pending = 1'b0;
//         sel_idx      = '0;
//         for (int k=0; k<P; k++) begin
//             if (!have_pending && pend_mask[k]) begin
//                 have_pending = 1'b1;
//                 sel_idx      = k[$clog2(P)-1:0];
//             end
//         end
//     end

//     // 1) 累积并行命中到 pending
//     integer i;
//     always @(posedge clk_i or negedge rst_ni) begin
//         if (!rst_ni) begin
//             pend_mask <= '0;
//             for (i=0; i<P; i++) pend_pos[i] <= '0;
//         end else begin
//             if (in_valid_i) begin
//                 pend_mask <= pend_mask | hit_mask_i;
//                 for (i=0; i<P; i++) begin
//                     if (hit_mask_i[i]) pend_pos[i] <= pos_bus_i[i];
//                 end
//             end
//             // 清除被消费的 pending 位在 push 时进行（见下）
//         end
//     end

//     // 2) FIFO 子模块（深度 T，位宽 Nw）
//     logic                 fifo_push, fifo_pop;
//     logic [Nw-1:0]       fifo_din, fifo_dout;
//     logic                 fifo_empty, fifo_full;
//     logic [$clog2(T+1)-1:0] fifo_count;

//     assign fifo_push = have_pending && !fifo_full; // 每拍最多推 1 个
//     assign fifo_din  = pend_pos[sel_idx];
//     assign fifo_pop  = !fifo_empty;               // 无 backpressure：非空即弹出 1 个

//     // 选择到一个 pending 元素后，若成功 push，则清除此位
//     always @(posedge clk_i or negedge rst_ni) begin
//         if (!rst_ni) begin
//         // 已在上面的复位块清零
//         end else if (fifo_push) begin
//             pend_mask[sel_idx] <= 1'b0;
//         end
//     end

//     fifo_sclr #(.DW(Nw), .DEPTH(T)) u_fifo (
//         .clk_i  (clk_i),
//         .rst_ni (rst_ni),
//         .wr_en_i(fifo_push),
//         .din_i  (fifo_din),
//         .rd_en_i(fifo_pop),
//         .dout_o (fifo_dout),
//         .empty_o(fifo_empty),
//         .full_o (fifo_full),
//         .count_o(fifo_count)
//     );

//     // 3) 输出逐根流与 last 标志（当扫描完成且此拍弹出最后一个元素）
//     logic done_seen_q;
//     always_ff @(posedge clk_i or negedge rst_ni) begin
//         if (!rst_ni) begin
//         root_pos_o  <= '0;
//         root_v_o    <= 1'b0;
//         root_last_o <= 1'b0;
//         done_seen_q <= 1'b0;
//         end else begin
//         // 逐根输出：弹出则有效
//         if (fifo_pop) begin
//             root_pos_o <= fifo_dout;
//             root_v_o   <= 1'b1;
//         end else begin
//             root_v_o   <= 1'b0;
//         end
//         // 记录扫描完成事件
//         if (scan_done_i) begin
//             done_seen_q <= 1'b1;
//         end
//         // 当扫描完成且本拍将弹出最后一个元素（计数==1 且 pop），拉高 last
//         root_last_o <= (done_seen_q && fifo_pop && (fifo_count == 1));
//         end
//     end

//     assign root_cnt_o = fifo_count;
// endmodule


// // ---------------- 参数化同步 FIFO（单写单读） ----------------
// module fifo_sclr #(
//     parameter int DW = 10,        // 数据位宽
//     parameter int DEPTH = 16      // 深度（≥2）
//     )(
//     input  logic           clk_i,
//     input  logic           rst_ni,
//     input  logic           wr_en_i,
//     input  logic [DW-1:0]  din_i,
//     input  logic           rd_en_i,
//     output logic [DW-1:0]  dout_o,
//     output logic           empty_o,
//     output logic           full_o,
//     output logic [$clog2(DEPTH+1)-1:0] count_o
//     );
//     localparam int AW = (DEPTH<=2) ? 1 : $clog2(DEPTH);

//     logic [DW-1:0] mem [0:DEPTH-1];
//     logic [AW-1:0] wptr_q, wptr_d;
//     logic [AW-1:0] rptr_q, rptr_d;
//     logic [$clog2(DEPTH+1)-1:0] cnt_q, cnt_d;
//     logic [DW-1:0] dout_q;

//     // 写、读 许可（不覆盖/不欠读）
//     wire do_push = wr_en_i && (cnt_q < DEPTH);
//     wire do_pop  = rd_en_i && (cnt_q > 0);

//     // 写指针/读指针/计数更新
//     always_comb begin
//         wptr_d = wptr_q;
//         rptr_d = rptr_q;
//         cnt_d  = cnt_q;

//         if (do_push) begin
//         wptr_d = (wptr_q == DEPTH-1) ? '0 : (wptr_q + 1'b1);
//         cnt_d  = cnt_q + 1'b1;
//         end
//         if (do_pop) begin
//         rptr_d = (rptr_q == DEPTH-1) ? '0 : (rptr_q + 1'b1);
//         cnt_d  = cnt_d - 1'b1; // 注意：若 push 与 pop 同拍，同时 +1 和 -1，综合器会折算
//         end
//     end

//     // 存储体写
//     always_ff @(posedge clk_i) begin
//         if (do_push) begin
//         mem[wptr_q] <= din_i;
//         end
//     end

//     // 读数据寄存（弹出时取数）
//     always_ff @(posedge clk_i or negedge rst_ni) begin
//         if (!rst_ni) begin
//         dout_q <= '0;
//         end else if (do_pop) begin
//         dout_q <= mem[rptr_q];
//         end
//     end

//     // 指针/计数寄存
//     always_ff @(posedge clk_i or negedge rst_ni) begin
//         if (!rst_ni) begin
//         wptr_q <= '0;
//         rptr_q <= '0;
//         cnt_q  <= '0;
//         end else begin
//         wptr_q <= wptr_d;
//         rptr_q <= rptr_d;
//         cnt_q  <= cnt_d;
//         end
//     end

//     assign dout_o  = dout_q;
//     assign empty_o = (cnt_q == 0);
//     assign full_o  = (cnt_q == DEPTH);
//     assign count_o = cnt_q;
// endmodule
// // ---------------- 参数化同步 FIFO（单写单读） ----------------
// module fifo_sclr #(
//     parameter int DW = 10,        // 数据位宽
//     parameter int DEPTH = 16      // 深度（≥2）
//     )(
//     input  logic           clk_i,
//     input  logic           rst_ni,
//     input  logic           wr_en_i,
//     input  logic [DW-1:0]  din_i,
//     input  logic           rd_en_i,
//     output logic [DW-1:0]  dout_o,
//     output logic           empty_o,
//     output logic           full_o,
//     output logic [$clog2(DEPTH+1)-1:0] count_o
//     );
//     localparam int AW = (DEPTH<=2) ? 1 : $clog2(DEPTH);

//     logic [DW-1:0] mem [0:DEPTH-1];
//     logic [AW-1:0] wptr_q, wptr_d;
//     logic [AW-1:0] rptr_q, rptr_d;
//     logic [$clog2(DEPTH+1)-1:0] cnt_q, cnt_d;
//     logic [DW-1:0] dout_q;

//     // 写、读 许可（不覆盖/不欠读）
//     wire do_push = wr_en_i && (cnt_q < DEPTH);
//     wire do_pop  = rd_en_i && (cnt_q > 0);

//     // 写指针/读指针/计数更新
//     always_comb begin
//         wptr_d = wptr_q;
//         rptr_d = rptr_q;
//         cnt_d  = cnt_q;

//         if (do_push) begin
//         wptr_d = (wptr_q == DEPTH-1) ? '0 : (wptr_q + 1'b1);
//         cnt_d  = cnt_q + 1'b1;
//         end
//         if (do_pop) begin
//         rptr_d = (rptr_q == DEPTH-1) ? '0 : (rptr_q + 1'b1);
//         cnt_d  = cnt_d - 1'b1; // 注意：若 push 与 pop 同拍，同时 +1 和 -1，综合器会折算
//         end
//     end

//     // 存储体写
//     always_ff @(posedge clk_i) begin
//         if (do_push) begin
//         mem[wptr_q] <= din_i;
//         end
//     end

//     // 读数据寄存（弹出时取数）
//     always_ff @(posedge clk_i or negedge rst_ni) begin
//         if (!rst_ni) begin
//         dout_q <= '0;
//         end else if (do_pop) begin
//         dout_q <= mem[rptr_q];
//         end
//     end

//     // 指针/计数寄存
//     always_ff @(posedge clk_i or negedge rst_ni) begin
//         if (!rst_ni) begin
//         wptr_q <= '0;
//         rptr_q <= '0;
//         cnt_q  <= '0;
//         end else begin
//         wptr_q <= wptr_d;
//         rptr_q <= rptr_d;
//         cnt_q  <= cnt_d;
//         end
//     end

//     assign dout_o  = dout_q;
//     assign empty_o = (cnt_q == 0);
//     assign full_o  = (cnt_q == DEPTH);
//     assign count_o = cnt_q;
// endmodule
