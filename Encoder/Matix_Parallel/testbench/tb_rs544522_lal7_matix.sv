`timescale 1ns/1ps
// =====================================================================
// Testbench (front-pad=3, no tail zeros) for rs544522_lal7_nopipe_restruct
//  - 并行度 L=7；在 data_k[521] 之前**预置 3 个 0**，总步数 525=75×7
//  - 不再在末尾补 0，最后一拍 (blk=74) 也是满 7 个有效数据
//  - DUT 的 last_i 应当标记在 **最后一个数据拍**（即 blk=74）
//  - DUT 接口：不含 active_i（由外部已处理好无效 lane，此处全部有效）
//  - 串行检查器：送完 544 个 codeword 符号后，**再等待 1 个时钟**再检查余数
//  - 导出当前帧的 data_k（MSB-first）到 tb_out/data_k_tcX_msb_first.txt
// =====================================================================
// ---------------- GF 常量乘封装（参数 C 与输入 x 相乘） ----------------
module gf10_const_mul_by_param #(
  parameter logic [9:0] C = 10'd1
    )(
  input  logic [9:0] x,
  output logic [9:0] y
);
  // 若你的 gf1024_mul_pb_k5_flat 端口名不同，请在此调整连接
  gf1024_mul_pb_k5_flat u_mul ( .A(x), .B(C), .P(y) );
endmodule

// ------------------------ 单步 LFSR（22 阶）组合 ------------------------
// p'[0]   = g[0] * f
// p'[i]   = p[i-1] ^ g[i] * f   (i=1..21)
// 其中 f = p[21] ^ s
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

// ---------------- 串行 LFSR 检查器（每拍 1 符号；544 拍后余式应为 0） ----------------
module rs_serial_checker #(
  parameter int  W=10,
  parameter int  R=22,
  parameter logic [W-1:0] TAP0  = 10'd807,
  parameter logic [W-1:0] TAP1  = 10'd280,
  parameter logic [W-1:0] TAP2  = 10'd944,
  parameter logic [W-1:0] TAP3  = 10'd621,
  parameter logic [W-1:0] TAP4  = 10'd3,
  parameter logic [W-1:0] TAP5  = 10'd177,
  parameter logic [W-1:0] TAP6  = 10'd365,
  parameter logic [W-1:0] TAP7  = 10'd657,
  parameter logic [W-1:0] TAP8  = 10'd813,
  parameter logic [W-1:0] TAP9  = 10'd1010,
  parameter logic [W-1:0] TAP10 = 10'd712,
  parameter logic [W-1:0] TAP11 = 10'd466,
  parameter logic [W-1:0] TAP12 = 10'd374,
  parameter logic [W-1:0] TAP13 = 10'd544,
  parameter logic [W-1:0] TAP14 = 10'd374,
  parameter logic [W-1:0] TAP15 = 10'd482,
  parameter logic [W-1:0] TAP16 = 10'd555,
  parameter logic [W-1:0] TAP17 = 10'd976,
  parameter logic [W-1:0] TAP18 = 10'd452,
  parameter logic [W-1:0] TAP19 = 10'd899,
  parameter logic [W-1:0] TAP20 = 10'd783,
  parameter logic [W-1:0] TAP21 = 10'd513
)(
  input  logic                 clk_i,
  input  logic                 rst_ni,
  input  logic                 start_i,
  input  logic                 en_i,
  input  logic [W-1:0]         s_i,
  output logic [W-1:0]         rem_o [0:R-1]
);
  logic [W-1:0] rem_q [0:R-1];
  logic [W-1:0] rem_n [0:R-1];
  rs_lfsr22_step_const #(
    .TAP0(TAP0), .TAP1(TAP1), .TAP2(TAP2), .TAP3(TAP3), .TAP4(TAP4), .TAP5(TAP5), .TAP6(TAP6),
    .TAP7(TAP7), .TAP8(TAP8), .TAP9(TAP9), .TAP10(TAP10), .TAP11(TAP11), .TAP12(TAP12),
    .TAP13(TAP13), .TAP14(TAP14), .TAP15(TAP15), .TAP16(TAP16), .TAP17(TAP17), .TAP18(TAP18),
    .TAP19(TAP19), .TAP20(TAP20), .TAP21(TAP21)
  ) u_step (.rem_in(rem_q), .s_in(s_i), .rem_out(rem_n));
  integer i;
  always_ff @(posedge clk_i) begin
    if (!rst_ni) begin
      for (i=0;i<R;i++) rem_q[i] <= '0;
    end else begin
      if (start_i) begin
        for (i=0;i<R;i++) rem_q[i] <= '0;
      end else if (en_i) begin
        for (i=0;i<R;i++) rem_q[i] <= rem_n[i];
      end
    end
  end
  genvar gi; generate for (gi=0; gi<R; gi++) begin: G_EXP
    assign rem_o[gi] = rem_q[gi];
  end endgenerate
endmodule

// =====================================================================
// 真正的 Testbench 顶层（front-pad=3，末尾不补零 + 导出 data_k）
// =====================================================================
module tb_rs544522_lal7_matix;
    localparam int W=10, R=22, L=7, K=522, N=544;
    localparam int ZP=3;                 // 前置 3 个 0
    localparam int TOTAL_EXT = K + ZP;   // 525
    localparam int TOTAL_BLKS= TOTAL_EXT/ L; // 75（整除）

    // 时钟/复位
    logic clk, rst_ni; initial begin clk=0; forever #5 clk=~clk; end
    initial begin rst_ni=0; repeat (5) @(posedge clk); rst_ni=1; end

    // DUT 端口（不含 active_i）
    logic                 start_i, valid_i, last_i;
    logic [W-1:0]         s_blk_i [0:L-1];
    logic                 parity_valid_o;
    logic [W-1:0]         parity_o [0:R-1]; // DUT 输出 p[21..0]

    // === 被测设计：请确保名称/端口与工程一致 ===
    // 若你的模块名是 rs544522_lal7_nopipe，请自行替换实例名。
    rs544522_lal7_matix dut (
        .clk_i(clk), .rst_ni(rst_ni),
        .start_i(start_i), .valid_i(valid_i), .last_i(last_i),
        .s_blk_i(s_blk_i),
        .parity_valid_o(parity_valid_o), .parity_o(parity_o)
    );

    // 串行检查器
    logic                 chk_start, chk_en; logic [W-1:0] chk_s;
    logic [W-1:0]         chk_rem [0:R-1];
    rs_serial_checker u_chk (.clk_i(clk), .rst_ni(rst_ni), .start_i(chk_start), .en_i(chk_en), .s_i(chk_s), .rem_o(chk_rem));

    // 测试数据/缓冲
    logic [W-1:0] data_k   [0:K-1];   // data_k[521] = 最高项（x^521）
    logic [W-1:0] parity_c [0:R-1];   // p[21..0]
    logic [W-1:0] codeword [0:N-1];   // codeword[543]..[0]

    // 文件导出
    int fd_k; string fname_k;

    integer tc, i, b, j, pos_ext, pos;
    bit ok; 
    
    initial begin
        $fsdbDumpfile("dump.fsdb");  // 指定 FSDB 文件名
        $fsdbDumpvars("+all");     // Dump
    end
    
    
    initial begin
        void'($system("mkdir -p tb_out"));

        // 默认输入
        start_i=0; valid_i=0; last_i=0; for (j=0;j<L;j++) s_blk_i[j]='0;
        chk_start=0; chk_en=0; chk_s='0;

        @(posedge rst_ni);

        for (tc=0; tc<3; tc++) begin
        // 1) 生成一帧随机数据（10bit）
        for (i=0;i<K;i++) data_k[i] = $urandom(32'hF00D0000 ^ (tc<<16) ^ i) & 10'h3FF;

        // 1.1) 导出 data_k 帧（MSB-first：从 data_k[521] 到 data_k[0]）
        fname_k = $sformatf("tb_out/data_k_tc%0d_msb_first.txt", tc);
        fd_k = $fopen(fname_k, "w");
        if (fd_k == 0) $fatal(1, "[TC%0d] cannot open %s", tc, fname_k);
        $fwrite(fd_k, "# RS(544,522) data_k frame (MSB-first)\n");
        $fwrite(fd_k, "# Line i = data_k[521-i], fields: dec,0xHEX (10-bit)\n");
        for (i=K-1; i>=0; i--) $fwrite(fd_k, "%0d,0x%03h\n", data_k[i], data_k[i]);
        $fclose(fd_k);

        // 2) 前置 3 个 0 + 522 数据 → 75 拍驱动 DUT
        // 首拍（blk=0）：s[0]=s[1]=s[2]=0, s[3]=data_k[521], s[4]=data_k[520], ...
        @(posedge clk);
        start_i <= 1'b1; valid_i <= 1'b1; last_i <= 1'b0;
        for (j=0;j<L;j++) begin
            pos_ext = 0*L + j; // 0..6
            if (pos_ext < ZP) begin
            s_blk_i[j] <= '0; // 前导 0
            end else begin
            pos = pos_ext - ZP;         // 0..521（扩展索引去掉前导 0）
            s_blk_i[j] <= data_k[K-1 - pos];
            end
        end

        // 中间满拍（blk=1..73）
        for (b=1; b<TOTAL_BLKS-1; b++) begin // 1..73
            @(posedge clk);
            start_i <= 1'b0; valid_i <= 1'b1; last_i <= 1'b0;
            for (j=0;j<L;j++) begin
            pos_ext = b*L + j; // 7..517
            pos     = pos_ext - ZP; // >=4
            s_blk_i[j] <= data_k[K-1 - pos];
            end
        end

        // 最后一拍（blk=74，仍然是满 7 数据；last_i=1）
        @(posedge clk);
        start_i <= 1'b0; valid_i <= 1'b1; last_i <= 1'b1;
        b = TOTAL_BLKS-1; // 74
        for (j=0;j<L;j++) begin
            pos_ext = b*L + j;     // 518..524
            pos     = pos_ext - ZP; // 515..521
            s_blk_i[j] <= data_k[K-1 - pos]; // 包含 data_k[0] 在 j=6 处
        end

        // 输入结束
        @(posedge clk);
        start_i <= 1'b0; valid_i <= 1'b0; last_i <= 1'b0; for (j=0;j<L;j++) s_blk_i[j] <= '0;

        // 3) 采集 DUT parity（下一拍有效）
        wait (parity_valid_o===1'b1);
        for (i=0;i<R;i++) parity_c[i] = parity_o[i]; // p[21..0]
        @(posedge clk);

        // 4) 拼接码字：codeword[543:22]=data_k[521:0]；codeword[21:0]=p[21:0]
        for (i=0;i<K;i++) codeword[22+i] = data_k[i];
        for (i=0;i<R;i++) codeword[i]    = parity_c[i];

        // 5) 串行送入检查器：从 codeword[543] 到 codeword[0]
        @(posedge clk); chk_start <= 1'b1; chk_en <= 1'b0; chk_s <= '0;
        @(posedge clk); chk_start <= 1'b0;
        for (i=N-1; i>=0; i--) begin
            @(posedge clk); chk_en <= 1'b1; chk_s <= codeword[i];
        end
        // **关键**：全部输入后，再等 1 个时钟，让余式寄存器完成更新
        @(posedge clk); chk_en <= 1'b0; chk_s <= '0;
        @(posedge clk);

        // 6) 余式检查
        ok = 1'b1;
        for (i=0;i<R;i++) if (chk_rem[i] !== '0) ok = 1'b0;
        if (!ok) begin
            $display("[TC%0d] FAIL: remainder not zero!", tc);
            for (i=0;i<R;i++) $display("  rem[%0d]=%0d", i, chk_rem[i]);
            $fatal(1);
        end else begin
            $display("[TC%0d] PASS: codeword divisible by g(x).", tc);
            $display("           data_k exported to %s", fname_k);
        end

        @(posedge clk);
        end

        $display("All testcases passed.");
        $finish;
    end
endmodule
