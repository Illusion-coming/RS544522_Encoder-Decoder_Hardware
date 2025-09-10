// ============================================================================
// RS(544,522) Look-Ahead LFSR — 并行度 L=8，7 级流水（无气泡，1 拍/块吞吐）
// 目标：在 300MHz 下时序收敛；总延迟 = 66（输入拍数） + 7（流水深度）
//
// 约定：
//  * 单步规则（与标准/先 XOR 后乘 tap 一致）：
//      f = rem[21] ^ s;
//      rem'[0]   = g0 * f;
//      rem'[j]   = gj * f ^ rem[j-1]   (j=1..21)
//  * 本模块每拍处理 8 个单步（L=8），但在 8 级之间插入 7 级寄存器。
//    因此相当于“8 级流水”的展开结构：吞吐 1 块/拍，时延 8-1=7 拍。
//  * 输入侧应使用 **前缀 6 个 0** 的对齐方案（front-pad=6），66 拍输入完 522 符号。
//    不在尾部补 0。最后一拍与 valid_i 同时拉高 last_i。
//  * parity 输出时序：当“最后一块”令牌到达第 8 级（stage7）时，
//    同拍给出 parity_o（为该块的 22 个寄存器值，硬件顺序 rem[0..21]），
//    同拍拉高 parity_valid_o。—— 总延迟 = 66 + 7 拍。
//
// Author: generated per user's spec
// ============================================================================
`timescale 1ns/1ps

// ---------------- GF(2^10) 常量乘：封装现有乘法器 ----------------
module gf10_const_mul_by_param #(
    parameter logic [9:0] C = 10'd1
)(
    input  logic [9:0] x,
    output logic [9:0] y
);
    // 穷举验证过的 10bit 乘法器（用户提供）
    gf1024_mul_pb_k5_flat u_mul (
        .A(x), .B(C), .P(y)
    );
endmodule

// ---------------- 单步 LFSR（22 阶）组合：与规范一致 ----------------
module rs_lfsr22_step_const #(
    parameter logic [9:0] TAP0  = 10'd807,
    parameter logic [9:0] TAP1  = 10'd280,
    parameter logic [9:0] TAP2  = 10'd944,
    parameter logic [9:0] TAP3  = 10'd621,
    parameter logic [9:0] TAP4  = 10'd3,
    parameter logic [9:0] TAP5  = 10'd177,
    parameter logic [9:0] TAP6  = 10'd365,
    parameter logic [9:0] TAP7  = 10'd657,
    parameter logic [9:0] TAP8  = 10'd813,
    parameter logic [9:0] TAP9  = 10'd1010,
    parameter logic [9:0] TAP10 = 10'd712,
    parameter logic [9:0] TAP11 = 10'd466,
    parameter logic [9:0] TAP12 = 10'd374,
    parameter logic [9:0] TAP13 = 10'd544,
    parameter logic [9:0] TAP14 = 10'd374,
    parameter logic [9:0] TAP15 = 10'd482,
    parameter logic [9:0] TAP16 = 10'd555,
    parameter logic [9:0] TAP17 = 10'd976,
    parameter logic [9:0] TAP18 = 10'd452,
    parameter logic [9:0] TAP19 = 10'd899,
    parameter logic [9:0] TAP20 = 10'd783,
    parameter logic [9:0] TAP21 = 10'd513
)(
    input  logic [9:0] rem_in  [0:21],
    input  logic [9:0] s_in,
    output logic [9:0] rem_out [0:21]
);
    logic [9:0] f;
    logic [9:0] m [0:21];
    assign f = rem_in[21] ^ s_in;
    gf10_const_mul_by_param #(.C(TAP0 )) u_m0  (.x(f), .y(m[0] ));
    gf10_const_mul_by_param #(.C(TAP1 )) u_m1  (.x(f), .y(m[1] ));
    gf10_const_mul_by_param #(.C(TAP2 )) u_m2  (.x(f), .y(m[2] ));
    gf10_const_mul_by_param #(.C(TAP3 )) u_m3  (.x(f), .y(m[3] ));
    gf10_const_mul_by_param #(.C(TAP4 )) u_m4  (.x(f), .y(m[4] ));
    gf10_const_mul_by_param #(.C(TAP5 )) u_m5  (.x(f), .y(m[5] ));
    gf10_const_mul_by_param #(.C(TAP6 )) u_m6  (.x(f), .y(m[6] ));
    gf10_const_mul_by_param #(.C(TAP7 )) u_m7  (.x(f), .y(m[7] ));
    gf10_const_mul_by_param #(.C(TAP8 )) u_m8  (.x(f), .y(m[8] ));
    gf10_const_mul_by_param #(.C(TAP9 )) u_m9  (.x(f), .y(m[9] ));
    gf10_const_mul_by_param #(.C(TAP10)) u_m10 (.x(f), .y(m[10]));
    gf10_const_mul_by_param #(.C(TAP11)) u_m11 (.x(f), .y(m[11]));
    gf10_const_mul_by_param #(.C(TAP12)) u_m12 (.x(f), .y(m[12]));
    gf10_const_mul_by_param #(.C(TAP13)) u_m13 (.x(f), .y(m[13]));
    gf10_const_mul_by_param #(.C(TAP14)) u_m14 (.x(f), .y(m[14]));
    gf10_const_mul_by_param #(.C(TAP15)) u_m15 (.x(f), .y(m[15]));
    gf10_const_mul_by_param #(.C(TAP16)) u_m16 (.x(f), .y(m[16]));
    gf10_const_mul_by_param #(.C(TAP17)) u_m17 (.x(f), .y(m[17]));
    gf10_const_mul_by_param #(.C(TAP18)) u_m18 (.x(f), .y(m[18]));
    gf10_const_mul_by_param #(.C(TAP19)) u_m19 (.x(f), .y(m[19]));
    gf10_const_mul_by_param #(.C(TAP20)) u_m20 (.x(f), .y(m[20]));
    gf10_const_mul_by_param #(.C(TAP21)) u_m21 (.x(f), .y(m[21]));
    assign rem_out[0]  = m[0];
    assign rem_out[1]  = rem_in[0]  ^ m[1];
    assign rem_out[2]  = rem_in[1]  ^ m[2];
    assign rem_out[3]  = rem_in[2]  ^ m[3];
    assign rem_out[4]  = rem_in[3]  ^ m[4];
    assign rem_out[5]  = rem_in[4]  ^ m[5];
    assign rem_out[6]  = rem_in[5]  ^ m[6];
    assign rem_out[7]  = rem_in[6]  ^ m[7];
    assign rem_out[8]  = rem_in[7]  ^ m[8];
    assign rem_out[9]  = rem_in[8]  ^ m[9];
    assign rem_out[10] = rem_in[9]  ^ m[10];
    assign rem_out[11] = rem_in[10] ^ m[11];
    assign rem_out[12] = rem_in[11] ^ m[12];
    assign rem_out[13] = rem_in[12] ^ m[13];
    assign rem_out[14] = rem_in[13] ^ m[14];
    assign rem_out[15] = rem_in[14] ^ m[15];
    assign rem_out[16] = rem_in[15] ^ m[16];
    assign rem_out[17] = rem_in[16] ^ m[17];
    assign rem_out[18] = rem_in[17] ^ m[18];
    assign rem_out[19] = rem_in[18] ^ m[19];
    assign rem_out[20] = rem_in[19] ^ m[20];
    assign rem_out[21] = rem_in[20] ^ m[21];
endmodule

// ---------------- 8 级流水顶层（1 块/拍吞吐，时延 7 拍） ----------------
module rs544522_lal8_pipe_restruct #(
    // GF taps（与 Python 一致）
    parameter logic [9:0] TAP0  = 10'd807,
    parameter logic [9:0] TAP1  = 10'd280,
    parameter logic [9:0] TAP2  = 10'd944,
    parameter logic [9:0] TAP3  = 10'd621,
    parameter logic [9:0] TAP4  = 10'd3,
    parameter logic [9:0] TAP5  = 10'd177,
    parameter logic [9:0] TAP6  = 10'd365,
    parameter logic [9:0] TAP7  = 10'd657,
    parameter logic [9:0] TAP8  = 10'd813,
    parameter logic [9:0] TAP9  = 10'd1010,
    parameter logic [9:0] TAP10 = 10'd712,
    parameter logic [9:0] TAP11 = 10'd466,
    parameter logic [9:0] TAP12 = 10'd374,
    parameter logic [9:0] TAP13 = 10'd544,
    parameter logic [9:0] TAP14 = 10'd374,
    parameter logic [9:0] TAP15 = 10'd482,
    parameter logic [9:0] TAP16 = 10'd555,
    parameter logic [9:0] TAP17 = 10'd976,
    parameter logic [9:0] TAP18 = 10'd452,
    parameter logic [9:0] TAP19 = 10'd899,
    parameter logic [9:0] TAP20 = 10'd783,
    parameter logic [9:0] TAP21 = 10'd513,
    parameter int W=10, R=22, L=8,
    parameter bit DEBUG = 1'b0
)(
    input  logic                 clk_i,
    input  logic                 rst_ni,
    input  logic                 start_i,   // 与首拍 valid_i 对齐：该拍使用零态
    input  logic                 valid_i,   // 连续 66 拍为 1；其余为 0
    input  logic                 last_i,    // 在最后一个数据拍与 valid_i 同时为 1
    input  logic [W-1:0]         s_blk_i [0:L-1],
    output logic                 parity_valid_o,   // 同拍：最后块到达 stage7
    output logic [W-1:0]         parity_o [0:R-1] // 硬件顺序 rem[0..21]
);
    // -------------------- 管线状态 --------------------
    // rem：每级 22×W 寄存器
    logic [W-1:0] rem_q [0:7][0:R-1];   // stage0..stage7
    logic [W-1:0] rem_d [0:7][0:R-1];

    // s 向量：每级携带“当前块”剩余的 8 个符号，供下一阶段取 index 0
    logic [W-1:0] s_vec [0:7][0:L-1];

    // token：有效/末块标记沿管线推进
    logic v_d   [0:7];
    logic last_d[0:7];


    // -------------------- stage 0 组合 --------------------
    integer i, j;
    always_comb begin
        for (i=0;i<R;i++) rem_q[0][i]  = (start_i) ? 'b0 : rem_q[7][i];
        for (j=0;j<L;j++) s_vec[0][j]  = (valid_i) ? s_blk_i[j] :  'b0;
    end

    // 单步计算
    rs_lfsr22_step_const #(
        .TAP0(TAP0), .TAP1(TAP1), .TAP2(TAP2), .TAP3(TAP3), .TAP4(TAP4), .TAP5(TAP5), .TAP6(TAP6),
        .TAP7(TAP7), .TAP8(TAP8), .TAP9(TAP9), .TAP10(TAP10), .TAP11(TAP11), .TAP12(TAP12),
        .TAP13(TAP13), .TAP14(TAP14), .TAP15(TAP15), .TAP16(TAP16), .TAP17(TAP17), .TAP18(TAP18),
        .TAP19(TAP19), .TAP20(TAP20), .TAP21(TAP21)
    ) u_s0 (.rem_in(rem_q[0]), .s_in(s_vec[0][0]), .rem_out(rem_d[0]));

    // 仅当 valid_i=1 时应用单步，否则直通（泡沫不扰动）
    assign v_d[0]    = valid_i;
    assign last_d[0] = (valid_i && last_i);

    // -------------------- stage 1..7 组合 --------------------
    genvar st;
    generate
            for (st=1; st<8; st++) begin : G_ST
                rs_lfsr22_step_const #(
                    .TAP0(TAP0), .TAP1(TAP1), .TAP2(TAP2), .TAP3(TAP3), .TAP4(TAP4), .TAP5(TAP5), .TAP6(TAP6),
                    .TAP7(TAP7), .TAP8(TAP8), .TAP9(TAP9), .TAP10(TAP10), .TAP11(TAP11), .TAP12(TAP12),
                    .TAP13(TAP13), .TAP14(TAP14), .TAP15(TAP15), .TAP16(TAP16), .TAP17(TAP17), .TAP18(TAP18),
                    .TAP19(TAP19), .TAP20(TAP20), .TAP21(TAP21)
                ) u_si (.rem_in(rem_q[st]), .s_in(s_vec[st][st]), .rem_out(rem_d[st]));

                //流水线寄存器更新
                integer k;   
                always @ (posedge clk_i or negedge rst_ni) begin
                if(!rst_ni) begin
                    for (k=0;k<R;k++) rem_q[st][k] <= 'b0;
                    for (k=0;k<L;k++) s_vec[st][k] <= 'b0;
                end else if(v_d[st-1]) begin
                    for (k=0;k<R;k++) rem_q[st][k] <= rem_d[st - 1][k];
                    for (k=0;k<L;k++) s_vec[st][k] <= s_vec[st - 1][k];
                end
                end

                always @ (posedge clk_i or negedge rst_ni) begin
                    if(!rst_ni) begin
                        v_d[st]    <= 'b0;
                        last_d[st] <= 'b0;
                    end else begin
                        v_d[st]    <= v_d[st - 1] ;
                        last_d[st] <= last_d[st-1];
                    end
                end

            end
    endgenerate

    // -------------------- parity 输出（stage7） --------------------
    // 当“最后一块”令牌到达，即流水线最后一级stage7在运算最后一个数据（v_d[6] & last_d[6]）时，
    // 下一拍输出 parity
    integer pm;
    always_ff @(posedge clk_i) begin
        if (!rst_ni) begin
        parity_valid_o <= 1'b0;
        for (pm=0; pm<R; pm++) parity_o[pm] <= '0;
        end else begin
        parity_valid_o <= (v_d[6] & last_d[6]);
        if (v_d[6] & last_d[6]) begin
            for (pm=0; pm<R; pm++) parity_o[pm] <= rem_q[7][pm];
        end
        end
    end

    //   assign parity_valid_o = v_d[7] & last_d[7] ;

endmodule
