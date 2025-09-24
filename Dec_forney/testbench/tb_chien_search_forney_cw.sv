//------------------------------------------------------------------------------
// tb_chien_search_forney_cw.sv
// 基于 tb_chien_search_forney.sv：
// 1) 继续从 LOG_PATH 读取 RiBM 结果驱动 DUT（cfg_valid 拉高 1 个周期，40 周期内完成）；
// 2) 额外从 ../encoded_raw_data 读取：
//      - 错误码字:  codeword_from_spec_543_to_0V1_2err.txt （最高次到最低次 543->0）
//      - 正确码字:  codeword_from_spec_543_to_0V1.txt     （同上顺序）
// 3) 使用 DUT 的 forney_pos_o、forney_y_o 对错误码字进行 GF 加（10bit 按位异或）纠错；
// 4) 纠错后与正确码字对比，打印关键信息并输出日志 ../logs/tb_cw_fix_compare.log。
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tb_chien_search_forney_cw;
  // ---- 基本参数（与现有 DUT 保持一致） ----
  localparam int W      = 10;
  localparam int T      = 11;
  localparam int P      = 32;
  localparam int N      = 1023;
  localparam int n      = 544;                 // 码长
  localparam int POS_W  = $clog2(N);
  localparam int U_LEN  = T+1;
  localparam string MEM_PATH  = "../rtl/gf1024_inv_table.mem";
  localparam bit    DEBUG_EN  = 1'b1;

  // ---- 路径（按你的要求） ----
  localparam string LOG_PATH      = "../hw_ribm_raw_data/V1_11err_dut.log"; // RiBM 中间结果
  localparam string CW_ERR_PATH   = "../encoded_raw_data/codeword_from_spec_543_to_0V1_11err.txt"; // 错误码字
  localparam string CW_REF_PATH   = "../encoded_raw_data/codeword_from_spec_543_to_0V1.txt";       // 正确码字
  localparam string OUT_DIR       = "../logs";
  localparam string OUT_LOG       = "../logs/tb_cw_fix_compare.log";

  // ---- 运行节拍（与单 tb 一致） ----
  localparam int RUN_CYCLES = 40;   // cfg_valid 拉高后最多等 40 个周期收敛输出

  // ---- 时钟/复位 ----
  logic clk_i = 1'b0;  always #5 clk_i = ~clk_i; // 100MHz
  logic rst_ni;
  initial begin
    rst_ni = 1'b0;
    repeat (5) @(negedge clk_i);
    rst_ni = 1'b1;
  end

  // ---- DUT 端口（与单 tb 完全一致的时序绑法） ----
  logic                         cfg_valid;
  wire                          flush_i       = cfg_valid;   // 同拍：flush/sigma/ribm/start 全绑 cfg_valid
  logic [W-1:0]                 sigma_low_i [0:T];
  wire                          sigma_valid_i = cfg_valid;
  logic [W-1:0]                 v_bus_i     [0:T-1];
  wire                          ribm_valid_i  = cfg_valid;
  wire                          chien_start_i = cfg_valid;

  logic                         forney_s3_rdy_i;
  logic                         forney_vld_o;
  logic [POS_W-1:0]             forney_pos_o;
  logic [W-1:0]                 forney_y_o;
  logic                         forney_den_zero_o;

  // 可选调试口（实例化需要）
  logic [P-1:0]                 chien_dbg_hit_mask_o;
  logic [POS_W-1:0]             chien_dbg_pos_bus_o [0:P-1];
  logic [W-1:0]                 chien_dbg_u_vec_o   [0:P-1][0:U_LEN-1];

  // ---- DUT 实例 ----
  chien_search_forney #(
    .W(W), .T(T), .P(P), .N(N), .n(n), .MEM_PATH(MEM_PATH), .DEBUG_EN(DEBUG_EN)
  ) dut (
    .clk_i(clk_i), .rst_ni(rst_ni), .flush_i(flush_i),
    .sigma_low_i(sigma_low_i), .sigma_valid_i(sigma_valid_i),
    .v_bus_i(v_bus_i), .ribm_valid_i(ribm_valid_i),
    .chien_start_i(chien_start_i),
    .forney_s3_rdy_i(forney_s3_rdy_i), .forney_vld_o(forney_vld_o),
    .forney_pos_o(forney_pos_o), .forney_y_o(forney_y_o), .forney_den_zero_o(forney_den_zero_o),
    .chien_dbg_hit_mask_o(chien_dbg_hit_mask_o),
    .chien_dbg_pos_bus_o(chien_dbg_pos_bus_o),
    .chien_dbg_u_vec_o(chien_dbg_u_vec_o)
  );

  // ---- 本 tb 的数据结构 ----
  logic [W-1:0] cw_err [0:n-1];   // 错误码字（最高次优先：cw_err[0] = r_543）
  logic [W-1:0] cw_ref [0:n-1];   // 正确码字（cw_ref[0] = c_543）
  logic [W-1:0] cw_fix [0:n-1];   // 纠错后的码字（从 err 复制并叠加修复）

  // 统计
  bit   in_run;
  int   fd, cwfd, outfd;
  string line, tok;
  int   idx, val, hexv;
  int   state, cnt_sigma, cnt_v;
  int   i;

  int   n_before_diff, n_after_diff, n_corrections;

  // ---- 工具函数 ----
  function automatic string join2(input string a, input string b);
    string r; r = {a, "/", b}; return r;
  endfunction

  // 读取“最高次优先”的码字文本（每行一个十进制数，允许逗号后注释）
  task automatic read_codeword(input string path, output logic [W-1:0] cw [0:n-1]);
    int fd_local, got, k;
    string ln, dummy;
    int vdec;
    begin
      for (k=0;k<n;k++) cw[k] = '0;
      fd_local = $fopen(path, "r");
      if (fd_local == 0) begin
        $fatal(1, "[TB] Cannot open codeword file: %s", path);
      end
      k = 0;
      while (!$feof(fd_local) && k < n) begin
        ln = ""; void'($fgets(ln, fd_local));
        if ($sscanf(ln, "%d,%s", vdec, dummy) == 2) begin cw[k] = vdec[W-1:0]; k++; end
        else if ($sscanf(ln, "%d", vdec) == 1) begin cw[k] = vdec[W-1:0]; k++; end
        else begin /* ignore blank/comment */ end
      end
      $fclose(fd_local);
      if (k != n) $fatal(1, "[TB] Expect %0d symbols in %s, got %0d", n, path, k);
    end
  endtask

  // 读取 RiBM 的 σ 与 v（沿用单 tb 的解析方式）
  task automatic read_ribm_log(input string path);
    begin
      for (i=0;i<=T;i++) sigma_low_i[i] = '0;
      for (i=0;i< T;i++) v_bus_i[i]     = '0;
      state=0; cnt_sigma=0; cnt_v=0;

      fd = $fopen(path, "r");
      if (fd == 0) $fatal(1, "[TB] Cannot open RIBM log: %s", path);
      while (!$feof(fd)) begin
        void'($fgets(line, fd));
        void'($sscanf(line, "%s", tok));
        if (state==0 && (tok == "sigma_dut")) state=1;
        else if (state==1) begin
          if ($sscanf(line, " [%d] = %d (0x%x)", idx, val, hexv)==3) begin
            if (idx>=0 && idx<=T) begin sigma_low_i[idx] = val[W-1:0]; cnt_sigma++; end
            if (idx==T) state=2;
          end
        end else if (state==2 && (tok == "v_dut")) state=3;
        else if (state==3) begin
          if ($sscanf(line, " [%d] = %d (0x%x)", idx, val, hexv)==3) begin
            if (idx>=0 && idx<=T-1) begin v_bus_i[idx] = val[W-1:0]; cnt_v++; end
            if (idx==T-1) state=4;
          end
        end
      end
      $fclose(fd);
      $display("[TB] Loaded sigma=(%0d.0x%0h), v=(%0d.0x%0h) from %s", cnt_sigma, cnt_sigma, cnt_v, cnt_v, path);
    end
  endtask

  // 计数差异
  function automatic int count_diff(input logic [W-1:0] a [0:n-1], input logic [W-1:0] b [0:n-1]);
    int k, d; begin d=0; for (k=0;k<n;k++) if (a[k] !== b[k]) d++; return d; end
  endfunction

  // ---- 纠错（在 forney_vld_o 有效时应用） ----
  always @(posedge clk_i) begin
    if (rst_ni && in_run && forney_vld_o) begin
      // 直接把 y（错误值）GF 加到相应位置（10bit 异或）
      logic [POS_W-1:0] p; logic [W-1:0] y, old, neo;
      p   = forney_pos_o;
      y   = forney_y_o;
      old = cw_fix[p];
      neo = old ^ y;
      cw_fix[p] = neo;
      n_corrections++;
      if (forney_den_zero_o) begin
        $display("[TB][WARN] pos=%0d  y=%0d(0x%0h)  den_zero=1", p, y, y);
      end
      if (outfd) begin
        $fdisplay(outfd, "CORR pos=%0d(0x%0h)  y=%0d(0x%0h)  old=%0d(0x%0h)  new=%0d(0x%0h)  ref=%0d(0x%0h)",
                  p, p, y, y, old, old, neo, neo, cw_ref[p], cw_ref[p]);
      end
      $display("[TB][CORR] pos=%0d  y=%0d(0x%0h)  old=%0d(0x%0h) -> new=%0d(0x%0h)  ref=%0d(0x%0h)",
               p, y, y, old, old, neo, neo, cw_ref[p], cw_ref[p]);
    end
  end

  // ---- 主流程 ----
  initial begin : MAIN
    int shown;
    // 日志目录
    void'($system({"mkdir -p ", OUT_DIR}));

    // 读取码字（最高次优先）
    read_codeword(CW_ERR_PATH, cw_err);
    read_codeword(CW_REF_PATH, cw_ref);
    for (i=0;i<n;i++) cw_fix[i] = cw_err[i];  // 初始化 fix = err

    // 读取 RiBM σ/v
    read_ribm_log(LOG_PATH);

    // 打开输出日志
    outfd = $fopen(OUT_LOG, "w");
    if (outfd == 0) $fatal(1, "[TB] Cannot open output log: %s", OUT_LOG);
    $fdisplay(outfd, "# tb_chien_search_forney_cw.sv  compare log");
    $fdisplay(outfd, "# ERR = %s", CW_ERR_PATH);
    $fdisplay(outfd, "# REF = %s", CW_REF_PATH);
    $fdisplay(outfd, "# RIBM= %s", LOG_PATH);

    // 纠错前差异
    n_before_diff = count_diff(cw_err, cw_ref);
    $display("[TB] pre-diff = %0d", n_before_diff);
    $fdisplay(outfd, "PREDIFF %0d", n_before_diff);

    // 驱动启动：cfg_valid 在 negedge 拉高 1 周期（与单 tb 完全一致）
    forney_s3_rdy_i = 1'b1;
    cfg_valid = 1'b0; in_run = 1'b0; n_corrections = 0;

    @(negedge clk_i); wait(rst_ni);
    @(negedge clk_i); in_run = 1'b1; cfg_valid = 1'b1;
    @(negedge clk_i); cfg_valid = 1'b0;
    // 单 tb 里通常再留两拍空隙（可选，不影响 40 周期窗口）
    @(negedge clk_i); @(negedge clk_i);

    // 仅运行 RUN_CYCLES 周期收集输出
    for (int c=0; c<RUN_CYCLES; c++) @(negedge clk_i);
    in_run = 1'b0;

    // 纠错后差异
    n_after_diff = count_diff(cw_fix, cw_ref);

    // 汇总打印
    $display("[TB][SUM] corrections=%0d  prediff=%0d  postdiff=%0d  => %s",
             n_corrections, n_before_diff, n_after_diff,
             (n_after_diff==0)?"PASS":"FAIL");
    $fdisplay(outfd, "POSTDIFF %0d", n_after_diff);
    $fdisplay(outfd, "SUMMARY corrections=%0d prediff=%0d postdiff=%0d status=%s",
              n_corrections, n_before_diff, n_after_diff,
              (n_after_diff==0)?"PASS":"FAIL");

    // 如需，打印前/后与参考的首若干差异项
    shown = 0;
    for (i=0;i<n && shown<16;i++) begin
      if (cw_err[i] !== cw_ref[i]) begin
        $fdisplay(outfd, "DIFF: idx=%0d  err=%0d(0x%0h)  ref=%0d(0x%0h)  fix=%0d(0x%0h)",
                  i, cw_err[i], cw_err[i], cw_ref[i], cw_ref[i], cw_fix[i], cw_fix[i]);
        shown++;
      end
    end

    $fclose(outfd);
    $display("[TB] Compare log written: %s", OUT_LOG);
    $finish;
  end

  // ------------ 可选 FSDB（需要时用 +define+FSDB 打开） -------------
`ifdef FSDB
  initial begin
    $fsdbDumpfile("./dump.fsdb");
    $fsdbDumpvars(0, tb_chien_search_forney_cw);
    $fsdbDumpMDA;
  end
`endif

endmodule
