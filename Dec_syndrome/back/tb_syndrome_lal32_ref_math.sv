`timescale 1ns/1ps
// ----------------------------------------------------------------------------
// Testbench for syndrome_lal32 (M=32, forward weights)
// 参考模型改为“逐符号数学公式（Horner，高次→低次）”：
//   对每个 j=1..22： s ← s*α^j + r_i ，按最高次优先输入 544 个符号，544 个周期输出 s_j
// 注意：不在 function/task 内声明变量或例化模块（遵循约束）
// 依赖：
//   - rs544_syndrome_consts_M32_forward.svh（含 WEIGHT_FWD[j][m]、FEEDBACK[j]）
//   - gf1024_mul_pb_k5_flat（变量×变量的 GF(2^10) 乘法器）
//   - 被测 DUT：syndrome_lal32（M=32, forward 权重版）
// ----------------------------------------------------------------------------

// `include "rs544_syndrome_consts_M32_forward.svh"


// // ---------------- 参考模型：逐符号数学公式（Horner，544周期） ----------------
// // 输入顺序：最高次优先；每周期 1 个 10b 符号 data_i。
// // 递推：对每个 j=1..22， s_j ← s_j * α^j + data_i
// module ref_syndrome (
//     input  logic              clk_i,
//     input  logic              rst_ni,
//     input  logic              valid_i,
//     input  logic              start_i,   // 第一拍
//     input  logic              last_i,    // 第 544 拍（最后一拍）
//     input  logic [9:0]        data_i,    // 本周期 1 个符号（最高次优先）
//     output logic              s_valid_o,  // last_i 同拍（本实现 0 级流水）
//     output logic [J-1:0][9:0] s_o         // [s1..s22]
//     );
//     import rs544_syndrome_consts_M32_pkg::*; // J=22, M=32, WEIGHT_FWD, FEEDBACK
    
    
//     localparam int N      = 544;     // 码字长度
//     // 22 路状态寄存器
//     logic [J-1:0][9:0] s_q, s_n;
//     // 22 路常量乘输出：s_q * α^j，其中 α^j = WEIGHT_FWD[j-1][1]
//     logic [J-1:0][9:0] s_mul;

//     genvar j;
//     generate
//         for (j=0; j<J; j++) begin : g_lane
//         // 乘以 α^j（这里 j 的数学索引为 j+1）
//         gf10_const_mul_by_param #(
//             .C(WEIGHT_FWD[j][M - 1]) // α^{(j+1)*1} = α^{j+1}
//         ) u_mul_ax (
//             .x (s_q[j]),
//             .y (s_mul[j])
//         );

//         // Horner：s ← s*α^j + data
//         always_comb begin
//             if (start_i)  s_n[j] = data_i;      // 首拍：s ← r_543
//             else          s_n[j] = s_mul[j] ^ data_i;
//         end
//         end
//     endgenerate

//     // 状态更新与有效信号
//     integer qi;
//     always_ff @(posedge clk_i or negedge rst_ni) begin
//         if (!rst_ni) begin
//             for (qi=0; qi<J; qi++) s_q[qi] <= '0;
//             s_o       <= '{default:'0};
//             s_valid_o <= 1'b0;
//         end else begin
//             if (valid_i) begin
//                 for (qi=0; qi<J; qi++) s_q[qi] <= s_n[qi];
//                 s_o       <= s_n;          // 0 级流水：与 last_i 同拍出最终值
//                 s_valid_o <= last_i;       // 第 544 拍拉高
//             end else begin
//                 s_valid_o <= 1'b0;
//             end
//         end
//     end
// endmodule

// ---------------- 被测 DUT（M=32） ----------------
// 需与之前提供的 syndrome_lal32（forward 权重版）一并编译

// ---------------- Testbench ----------------
module tb_syndrome_lal32_ref_math;
    // 基本参数
    localparam int N      = 544;     // 码字长度
    localparam int CYCLES_DUT = (N + M - 1) / M; // 544/32=17

    // 时钟复位
    logic clk, rst_n;
    initial begin clk = 0; forever #5 clk = ~clk; end  // 100 MHz
    initial begin rst_n = 0; repeat (5) @(posedge clk); rst_n = 1; end

    // DUT 端口
    logic                  valid_i_dut, start_i_dut, last_i_dut;
    logic [M-1:0][9:0]     data_i_dut;
    logic                  s_valid_dut;
    logic [J-1:0][9:0]     s_dut;

    // REF 端口（逐符号）
    logic                  valid_i_ref, start_i_ref, last_i_ref;
    logic [9:0]            data_i_ref;
    logic                  s_valid_ref;
    logic [J-1:0][9:0]     s_ref;

    // 被测 DUT
    syndrome_lal32 #(.J(J), .M(M)) u_dut (
        .clk_i    (clk),
        .rst_ni   (rst_n),
        .valid_i  (valid_i_dut),
        .start_i  (start_i_dut),
        .last_i   (last_i_dut),
        .data_i   (data_i_dut),
        .s_valid_o(s_valid_dut),
        .s_o      (s_dut)
    );

    // 参考模型（数学公式，544 周期）
    ref_syndrome u_ref (
        .clk_i    (clk),
        .rst_ni   (rst_n),
        .valid_i  (valid_i_ref),
        .start_i  (start_i_ref),
        .last_i   (last_i_ref),
        .data_i   (data_i_ref),
        .s_valid_o(s_valid_ref),
        .s_o      (s_ref)
    );

    initial begin
        $fsdbDumpfile("dump.fsdb");  // 指定 FSDB 文件名
        $fsdbDumpvars("+all");     // Dump
    end

    // ---------------- 输入码字读取（最高次优先） ----------------
    string CODEWORD_FILE = "codeword_from_spec_543_to_0.txt";
    int    cw   [0:N-1];
    int fd, r, val, idx; string line, dummy;

    initial begin : load_codeword
        idx = 0;
        fd = $fopen(CODEWORD_FILE, "r");
        if (fd == 0) begin $error("Cannot open %s", CODEWORD_FILE); $finish; end
        while (!$feof(fd)) begin
        line = ""; r = $fgets(line, fd);
        if (r == 0) break;
        if (line.len() == 0) continue;
        // 优先抓逗号前的十进制；若无逗号，则抓整行十进制
        if ($sscanf(line, "%d,%s", val, dummy) == 2) begin
            cw[idx] = val; idx++;
        end else if ($sscanf(line, "%d", val) == 1) begin
            cw[idx] = val; idx++;
        end
        if (idx > N) begin $error("Too many samples in %s", CODEWORD_FILE); $finish; end
        end
        $fclose(fd);
        if (idx != N) begin $error("Expect %0d symbols, got %0d", N, idx); $finish; end
        $display("Loaded %0d symbols from %s", idx, CODEWORD_FILE);
    end

    // ---------------- 驱动 DUT：每拍 32 个（17 拍） ----------------
    initial begin : drive_dut
        valid_i_dut = 0; start_i_dut = 0; last_i_dut = 0; data_i_dut = '{default:'0};
        @(posedge rst_n); @(posedge clk);

        for (int c = 0; c < CYCLES_DUT; c++) begin
        for (int m_idx = 0; m_idx < M; m_idx++) begin
            data_i_dut[M-1-m_idx] = cw[c*M + m_idx][9:0];
        end
        valid_i_dut = 1'b1;
        start_i_dut = (c == 0);
        last_i_dut  = (c == CYCLES_DUT-1);
        @(posedge clk);
        end

        valid_i_dut = 1'b0; start_i_dut = 1'b0; last_i_dut = 1'b0; data_i_dut = '{default:'0};
    end

    // ---------------- 驱动 REF：逐符号（544 拍） ----------------
    initial begin : drive_ref
        valid_i_ref = 0; start_i_ref = 0; last_i_ref = 0; data_i_ref = '0;
        @(posedge rst_n); @(posedge clk);

        for (int i = 0; i < N; i++) begin
        data_i_ref = cw[i][9:0];
        valid_i_ref = 1'b1;
        start_i_ref = (i == 0);
        last_i_ref  = (i == N-1);
        @(posedge clk);
        end

        valid_i_ref = 1'b0; start_i_ref = 1'b0; last_i_ref = 1'b0; data_i_ref = '0;
    end

    // ---------------- 结果比较：等待两路均产生有效，再比对 ----------------
    logic                  got_dut, got_ref;
    logic [J-1:0][9:0]     s_dut_hold, s_ref_hold;

    initial begin : checker
        got_dut = 1'b0; got_ref = 1'b0; s_dut_hold = '{default:'0}; s_ref_hold = '{default:'0};
        wait(rst_n === 1'b1);
        @(posedge clk);
        forever begin
        @(posedge clk);
        if (s_valid_dut) begin
            s_dut_hold <= s_dut; got_dut <= 1'b1;
            $display("DUT syndromes captured @%t", $time);
        end
        if (s_valid_ref) begin
            s_ref_hold <= s_ref; got_ref <= 1'b1;
            $display("REF syndromes captured @%t", $time);
        end
        if (got_dut && got_ref) begin
            int err = 0;
            for (int jj=0; jj<J; jj++) begin
            if (s_dut_hold[jj] !== s_ref_hold[jj]) begin
                $error("Mismatch at s[%0d]: DUT=%0h REF=%0h", jj+1, s_dut_hold[jj], s_ref_hold[jj]);
                err++;
            end
            end
            if (err == 0) $display("[PASS] All %0d syndromes match.", J);
            else          $display("[FAIL] %0d mismatches detected.", err);
            #20 $finish;
        end
        end
    end
endmodule
