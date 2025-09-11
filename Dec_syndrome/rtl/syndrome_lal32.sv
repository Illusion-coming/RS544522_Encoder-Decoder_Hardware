// -----------------------------------------------------------------------------
// RS(544,522) Syndrome (M=32, forward weights)
// 端口语义：本拍 data_i[m] × α^{j·m}；第一帧 data_i[31]=codeword[543]（最高次）。
// 仅实现校正子计算，不含补零与其他译码步骤。
// 依赖：rs544_syndrome_consts_M32_forward.svh，gf1024_mul_pb_k5_flat（变量×变量）
// -----------------------------------------------------------------------------
// `include "rs544_syndrome_consts_M32_forward.svh"
// import rs544_syndrome_consts_M32_pkg::*; // 提供 J=22, M=32, WEIGHT_FWD[j][m], FEEDBACK[j]

// ---------------- 顶层：22 条并行通道 ----------------
module syndrome_lal32 #(
    parameter int J = 22,
    parameter int M = 32
    ) (
    input  logic                  clk_i,
    input  logic                  rst_ni,
    input  logic                  valid_i,
    input  logic                  start_i,
    input  logic                  last_i,
    input  logic [M-1:0][9:0]     data_i,    // 第一帧：data_i[31]=codeword[543]，…，data_i[0]=codeword[512]
    output logic                  s_valid_o,  // 帧尾（与本实现 0 级流水同拍）
    output logic [J-1:0][9:0]     s_o
    );
    logic [J-1:0] lane_valid;
    genvar j;
    generate
        for (j=1; j<=J; j++) begin : g_lane
            // 计算s_j   最终的s = s_j * x ^ j + ... + s_1 * x
            syndrome_lane_fwd #(.J(J), .M(M), .J_IDX(j)) u_lane (
                .clk_i      (clk_i),
                .rst_ni     (rst_ni),
                .valid_i    (valid_i),
                .start_i    (start_i),
                .last_i     (last_i),
                .data_i     (data_i),
                .s_valid_o  (lane_valid[j-1]),
                .s_o        (s_o       [j-1])
            );
        end
    endgenerate

    // 顶层有效：各 lane 同相位（本实现 0 级流水）
    assign s_valid_o = &lane_valid; // 等价于 (valid_i && last_i)
endmodule
