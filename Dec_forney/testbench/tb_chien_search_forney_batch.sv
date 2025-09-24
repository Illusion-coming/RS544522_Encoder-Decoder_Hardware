//------------------------------------------------------------------------------
// tb_chien_search_forney_batch.sv
// 批量从 ../hw_ribm_raw_data/*.log 读取 σ/v，驱动 DUT: chien_search_forney，
// 以移植的 ref(Chien+Forney) 计算期望，并输出逐文件日志与总体汇总。
// 关键约束（按你的单例 tb 完全对齐）：
//   - 每次读入数据后，仅把 cfg_valid 拉高【一个完整周期】（negedge→negedge），
//     同时：flush_i = cfg_valid，sigma_valid_i = cfg_valid，ribm_valid_i = cfg_valid，
//     chien_start_i = cfg_valid（全部共用同一个脉冲）。
//   - 每个用例从拉高 cfg_valid 后【仅运行 40 个周期】收集输出（与单例 tb 等价）。
//   - 不依赖 busy/done；不做额外 flush；严格复用单例流程与时序。
// VCS 兼容：统一“先声明后使用”；basename_noext() 避免中途声明/字符比较。
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tb_chien_search_forney_batch;

  // ---------------- 参数（与现有 tb 保持一致） ----------------
  localparam int W      = 10;
  localparam int T      = 11;
  localparam int P      = 32;
  localparam int N      = 1023;
  localparam int n      = 544;
  localparam int U_LEN  = T+1;         // 12
  localparam int POS_W  = $clog2(N);
  localparam int LANE_FIFO_AW = 4;
  localparam int EVT_FIFO_AW  = 4;
  localparam string MEM_PATH  = "../rtl/gf1024_inv_table.mem";
  localparam bit    DEBUG_EN  = 1'b1;
  localparam string RIBM_DIR  = "../hw_ribm_raw_data";
  localparam string LOG_DIR   = "../logs";
  localparam int    RUN_CYCLES = 40;        // 每个激励最多运行 40 个周期

  // ---------------- 批量文件名列表（与你提供的一致） ----------------
  string RIBM_FILES[$] = '{
    "V1_10err_dut.log", "V1_11err_dut.log", "V1_12err_dut.log", "V1_1err_dut.log",
    "V1_2err_dut.log",  "V1_3err_dut.log",  "V1_4err_dut.log",  "V1_5err_dut.log",
    "V1_6err_dut.log",  "V1_7err_dut.log",  "V1_8err_dut.log",  "V1_9err_dut.log",
    "V1_dut.log",
    "V2_10err_dut.log", "V2_11err_dut.log", "V2_12err_dut.log", "V2_1err_dut.log",
    "V2_2err_dut.log",  "V2_3err_dut.log",  "V2_4err_dut.log",  "V2_5err_dut.log",
    "V2_6err_dut.log",  "V2_7err_dut.log",  "V2_8err_dut.log",  "V2_9err_dut.log",
    "V2_dut.log"
  };

  // ---------------- 时钟/复位 ----------------
  logic clk_i = 1'b0;
  always #5 clk_i = ~clk_i; // 100MHz

  logic rst_ni;
  initial begin
    rst_ni = 1'b0;
    repeat (5) @(negedge clk_i);
    rst_ni = 1'b1;
  end

  // ---------------- DUT 端口（严格按单例 tb 对齐） ----------------
  logic                         cfg_valid;
  wire                          flush_i       = cfg_valid;
  logic [W-1:0]                 sigma_low_i [0:T];
  wire                          sigma_valid_i = cfg_valid;
  logic [W-1:0]                 v_bus_i     [0:T-1];
  wire                          ribm_valid_i  = cfg_valid;
  wire                          chien_start_i = cfg_valid;

  logic                         chien_busy_o;     // 未使用，仅连线保留
  logic                         chien_done_o;     // 未使用，仅连线保留

  logic                         forney_s3_rdy_i;
  logic                         forney_vld_o;
  logic [POS_W-1:0]             forney_pos_o;
  logic [W-1:0]                 forney_y_o;
  logic                         forney_den_zero_o;

  // Debug 导出（保持端口连线）
  logic [P-1:0]                 chien_dbg_hit_mask_o;
  logic [POS_W-1:0]             chien_dbg_pos_bus_o [0:P-1];
  logic [W-1:0]                 chien_dbg_u_vec_o   [0:P-1][0:U_LEN-1];

  // ---------------- DUT 实例 ----------------
  chien_search_forney #(
    .W(W), .T(T), .P(P), .N(N), .n(n),
    .LANE_FIFO_AW(LANE_FIFO_AW), .EVT_FIFO_AW(EVT_FIFO_AW),
    .MEM_PATH(MEM_PATH), .DEBUG_EN(DEBUG_EN)
  ) dut (
    .clk_i(clk_i), .rst_ni(rst_ni), .flush_i(flush_i),
    .sigma_low_i(sigma_low_i), .sigma_valid_i(sigma_valid_i),
    .v_bus_i(v_bus_i), .ribm_valid_i(ribm_valid_i),
    .chien_start_i(chien_start_i), .chien_busy_o(chien_busy_o), .chien_done_o(chien_done_o),
    .forney_s3_rdy_i(forney_s3_rdy_i), .forney_vld_o(forney_vld_o),
    .forney_pos_o(forney_pos_o), .forney_y_o(forney_y_o), .forney_den_zero_o(forney_den_zero_o),
    .chien_dbg_hit_mask_o(chien_dbg_hit_mask_o),
    .chien_dbg_pos_bus_o(chien_dbg_pos_bus_o),
    .chien_dbg_u_vec_o(chien_dbg_u_vec_o)
  );

  // ---------------- GF 乘法器（供 ref 任务复用） ----------------
  logic [W-1:0] gfmul_a, gfmul_b;  wire [W-1:0] gfmul_p;
  gf1024_mul_pb_k5_flat u_gf_mul_ref (.A(gfmul_a), .B(gfmul_b), .P(gfmul_p));

  // ---------------- 参考数据结构与全局变量 ----------------
  logic [W-1:0] inv_tab [0:(1<<W)-1];
  logic [W-1:0] alpha_elem;
  logic [W-1:0] alpha_pow [0:N-1];

  int               ref_hit_cnt;
  logic [POS_W-1:0] ref_hit_pos   [0:T-1];
  logic [W-1:0]     ref_hit_uvec  [0:T-1][0:U_LEN-1];

  logic [W-1:0] exp_y_by_pos [0:N-1];
  bit           exp_denz_by_pos[0:N-1];
  bit           exp_has_by_pos[0:N-1];

  // 统计/日志/状态
  int  fd_log, fd, summary_fd;
  string line; string token;
  int  idx, decv, hexv;
  int  state, count_sigma, count_v;
  int  i, j, k, p_idx;

  // 参考运算暂存
  logic [W-1:0] acc_ref, tmp_ref, num_ref, den_ref, phase_ref, y_ref;
  logic [W-1:0] u_cur, u_pow;
  bit           den_is_zero_ref;

  // 其它循环变量
  int  ii_ref, kk_ref, hh_ref;

  // ---------------- 便捷函数：路径/文件名处理 ----------------
  function automatic string join2(input string a, input string b);
    string out;
    out = {a, "/", b};
    return out;
  endfunction

  // VCS 友好写法：声明在首；字符用 ASCII 数值
  function automatic string basename_noext(input string full);
    string name;
    int last_slash, last_dot, i, L, out_end;
    last_slash = -1;
    last_dot   = -1;
    L = full.len();
    for (i = 0; i < L; i++) begin
      if (full[i] == 8'd47) last_slash = i;  // '/' = 47
      if (full[i] == 8'd46) last_dot   = i;  // '.' = 46
    end
    if (last_slash >= 0) name = full.substr(last_slash+1, L-1);
    else                 name = full;
    if (last_dot > last_slash) begin
      out_end = last_dot - 1;
      if (last_slash >= 0) name = full.substr(last_slash+1, out_end);
      else                 name = full.substr(0, out_end);
    end
    return name;
  endfunction

  // ---------------- 参考 GF 运算（移植） ----------------
  task automatic gf_mul(input logic [W-1:0] a, input logic [W-1:0] b, output logic [W-1:0] p);
    begin
      gfmul_a = a; gfmul_b = b; #0; p = gfmul_p;
    end
  endtask

  function automatic logic [W-1:0] gf_inv(input logic [W-1:0] a);
    logic [W-1:0] inv_v;
    inv_v = inv_tab[a];
    return inv_v;
  endfunction

  // α 幂表
  task automatic build_alpha_pow_table();
    begin
      alpha_elem = 10'b0000000010; // x
      alpha_pow[0] = 10'b0000000001; // 1
      for (ii_ref = 1; ii_ref < N; ii_ref++) begin
        gf_mul(alpha_pow[ii_ref-1], alpha_elem, alpha_pow[ii_ref]);
      end
    end
  endtask

  // ref Forney：给定 {u_vec, σ, v} 计算 y
  task automatic ref_fornery_compute(
      input  logic [W-1:0] u_vec [0:U_LEN-1],  // u^0..u^11
      input  logic [W-1:0] sigma [0:T],        // σ0..σ11（低阶在前）
      input  logic [W-1:0] vbus  [0:T-1],      // v0..v10（低阶在前）
      output logic [W-1:0] y_out,
      output bit           den_is_zero
    );
    int kk_local;
    begin
      // num = v(u)
      num_ref = vbus[0];
      for (kk_local = 1; kk_local <= 10; kk_local++) begin
        gf_mul(vbus[kk_local], u_vec[kk_local], tmp_ref);
        num_ref ^= tmp_ref;
      end
      // den = σ′(u) = σ11·u^5 ⊕ σ9·u^4 ⊕ σ7·u^3 ⊕ σ5·u^2 ⊕ σ3·u^1 ⊕ σ1·u^0
      den_ref = sigma[1];
      gf_mul(sigma[11], u_vec[10], tmp_ref);  den_ref ^= tmp_ref;
      gf_mul(sigma[9],  u_vec[8], tmp_ref);  den_ref ^= tmp_ref;
      gf_mul(sigma[7],  u_vec[6], tmp_ref);  den_ref ^= tmp_ref;
      gf_mul(sigma[5],  u_vec[4], tmp_ref);  den_ref ^= tmp_ref;
      gf_mul(sigma[3],  u_vec[2], tmp_ref);  den_ref ^= tmp_ref;
      den_is_zero = (den_ref == '0);
      // phase = (u^11)^2 = u^22
      gf_mul(u_vec[11], u_vec[11], phase_ref);
      if (den_is_zero) y_out = '0;
      else begin
        gf_mul(num_ref, gf_inv(den_ref), tmp_ref); // core = num/den
        gf_mul(tmp_ref, phase_ref, y_out);         // y = core * phase
      end
    end
  endtask

  // ref Chien：扫描 0..n-1
  task automatic ref_chien_eval();
    int ii_local, kk_local;
    begin
      ref_hit_cnt = 0;
      for (ii_local = 0; ii_local < n; ii_local++) begin
        // 约定：x = α^{-(i)} = α^{N - (i % N)}
        u_cur = alpha_pow[(N - (ii_local % N)) % N]; // 作为 u^1
        // 构造 u^0..u^11
        ref_hit_uvec[ref_hit_cnt][0] = 'd1;
        ref_hit_uvec[ref_hit_cnt][1] = u_cur;
        for (kk_local=2; kk_local<=11; kk_local++) begin
          gf_mul(ref_hit_uvec[ref_hit_cnt][kk_local-1], u_cur, ref_hit_uvec[ref_hit_cnt][kk_local]);
        end
        // σ(u) = σ0 ⊕ Σ σ_k·u^k
        acc_ref = sigma_low_i[0];
        for (kk_local = 1; kk_local <= T; kk_local++) begin
          gf_mul(sigma_low_i[kk_local], ref_hit_uvec[ref_hit_cnt][kk_local], tmp_ref);
          acc_ref ^= tmp_ref;
        end
        if (acc_ref == '0) begin
          // cw_idx 映射：cw = (n-1) - i
          ref_hit_pos[ref_hit_cnt] = (n-1 - ii_local);
          ref_hit_cnt = ref_hit_cnt + 1;
          if (ref_hit_cnt == T) disable ref_chien_eval; // 最多 T 个根
        end
      end
    end
  endtask

  // 结果日志：把 exp_* 表按 pos 写出
  task automatic write_result_log(string path);
    begin
      fd_log = $fopen(path, "w");
      if (fd_log == 0) begin
        $error("[TB] Cannot open result log: %s", path);
        disable write_result_log;
      end
      $fdisplay(fd_log, "# pos(dec.hex)   y(dec.hex)   den_zero(dec.hex)");
      for (p_idx=0; p_idx<N; p_idx++) begin
        if (exp_has_by_pos[p_idx]) begin
          $fdisplay(fd_log, "%0d.0x%0h   %0d.0x%0h   %0d.0x%0h",
                    p_idx, p_idx, exp_y_by_pos[p_idx], exp_y_by_pos[p_idx],
                    exp_denz_by_pos[p_idx], exp_denz_by_pos[p_idx]);
        end
      end
      $fclose(fd_log);
      $display("[TB] Result log written: %s", path);
    end
  endtask

  // ---------------- Scoreboard/统计 ----------------
  bit   in_run;
  bit   seen_pos [0:N-1];
  int   dut_y_cnt, match_cnt, mismatch_cnt, unexpected_pos_cnt, denz_mis_cnt;

  always @(posedge clk_i) begin
    if (rst_ni && in_run && forney_vld_o) begin
      dut_y_cnt++;
      seen_pos[forney_pos_o] = 1'b1;

      if (!exp_has_by_pos[forney_pos_o]) begin
        unexpected_pos_cnt++;
        $display("[TB][UNEXP] pos=%0d(0x%0h)  y_dut=%0d(0x%0h)  denz_dut=%0d(0x%0h)",
                 forney_pos_o, forney_pos_o, forney_y_o, forney_y_o,
                 forney_den_zero_o, forney_den_zero_o);
      end else begin
        if (forney_y_o !== exp_y_by_pos[forney_pos_o]) begin
          mismatch_cnt++;
          $display("[TB][MISM]  pos=%0d(0x%0h)  y_dut=%0d(0x%0h)  y_exp=%0d(0x%0h)",
                   forney_pos_o, forney_pos_o, forney_y_o, forney_y_o,
                   exp_y_by_pos[forney_pos_o], exp_y_by_pos[forney_pos_o]);
        end else begin
          match_cnt++;
          $display("[TB][MATCH] pos=%0d(0x%0h)  y=%0d(0x%0h)  denz_dut=%0d(0x%0h)",
                   forney_pos_o, forney_pos_o, forney_y_o, forney_y_o,
                   forney_den_zero_o, forney_den_zero_o);
        end
        if (forney_den_zero_o !== exp_denz_by_pos[forney_pos_o]) begin
          denz_mis_cnt++;
          $display("[TB][DENZ]  pos=%0d(0x%0h)  denz_dut=%0d  denz_exp=%0d",
                   forney_pos_o, forney_pos_o, forney_den_zero_o, exp_denz_by_pos[forney_pos_o]);
        end
      end
    end
  end

  // ---------------- 批量驱动主流程（逐用例严格 40 周期） ----------------
  initial begin : BATCH_DRV
    string ribm_path, base, out_path, status;
    int    fidx, cyc, missed_cnt;

    forney_s3_rdy_i = 1'b1;
    cfg_valid = 1'b0;

    void'($system({ "mkdir -p ", LOG_DIR }));

    // 全局只需一次
    $readmemh(MEM_PATH, inv_tab);

    // 总体汇总文件
    summary_fd = $fopen(join2(LOG_DIR, "tb_batch_summary.log"), "w");
    if (summary_fd == 0) begin
      $error("[TB] Cannot open summary log!"); $finish;
    end
    $fdisplay(summary_fd, "# file, exp_roots, dut_y, match, mismatch, unexpected_pos, denz_mismatch, missed, status");

    // 先建 α 幂表
    build_alpha_pow_table();

    @(negedge clk_i); wait(rst_ni);

    foreach (RIBM_FILES[fidx]) begin
      ribm_path = join2(RIBM_DIR, RIBM_FILES[fidx]);
      base      = basename_noext(ribm_path);
      out_path  = join2(LOG_DIR, {base, "_ref_y.log"});

      // 清空 σ/v/期望表/scoreboard
      for (i=0;i<=T;i++) sigma_low_i[i]='0;
      for (i=0;i< T;i++) v_bus_i[i]='0;
      for (i=0;i<N;i++) begin
        exp_y_by_pos[i]='0; exp_denz_by_pos[i]=0; exp_has_by_pos[i]=0; seen_pos[i]=0;
      end
      dut_y_cnt=0; match_cnt=0; mismatch_cnt=0; unexpected_pos_cnt=0; denz_mis_cnt=0;

      // 1) 读取 RiBM σ/v（低阶在前）
      fd = $fopen(ribm_path, "r");
      if (fd == 0) begin
        $display("[TB] [SKIP] open log fail: %s", ribm_path);
        continue;
      end
      state=0; count_sigma=0; count_v=0;
      while (!$feof(fd)) begin
        void'($fgets(line, fd));
        void'($sscanf(line, "%s", token));
        if (state==0 && (token == "sigma_dut")) state=1;
        else if (state==1) begin
          if ($sscanf(line, " [%d] = %d (0x%x)", idx, decv, hexv)==3) begin
            if (idx>=0 && idx<=T) begin sigma_low_i[idx] = decv[W-1:0]; count_sigma++; end
            if (idx==T) state=2;
          end
        end else if (state==2 && (token == "v_dut")) state=3;
        else if (state==3) begin
          if ($sscanf(line, " [%d] = %d (0x%x)", idx, decv, hexv)==3) begin
            if (idx>=0 && idx<=T-1) begin v_bus_i[idx] = decv[W-1:0]; count_v++; end
            if (idx==T-1) state=4;
          end
        end
      end
      $fclose(fd);
      $display("\n[TB] ===== Case: %s  sigma_cnt=%0d  v_cnt=%0d =====", base, count_sigma, count_v);

      // 2) ref Chien + 3) ref Forney 生成期望表（与单例一致）
      ref_chien_eval();
      $display("[TB-REF] roots=%0d", ref_hit_cnt);
      for (hh_ref=0; hh_ref<ref_hit_cnt; hh_ref++) begin
        ref_fornery_compute(ref_hit_uvec[hh_ref], sigma_low_i, v_bus_i, y_ref, den_is_zero_ref);
        exp_y_by_pos[ref_hit_pos[hh_ref]]    = y_ref;
        exp_denz_by_pos[ref_hit_pos[hh_ref]] = den_is_zero_ref;
        exp_has_by_pos[ref_hit_pos[hh_ref]]  = 1'b1;
        $display("[TB-REF] pos=%0d  y=%0d(0x%0h)  denz=%0d",
                 ref_hit_pos[hh_ref], y_ref, y_ref, den_is_zero_ref);
      end

      // 4) 在 negedge 驱动 σ/v 有效脉冲；flush_i == ribm_valid_i；启动 Chien
      @(negedge clk_i); in_run = 1'b1; cfg_valid = 1'b1;
      @(negedge clk_i); cfg_valid = 1'b0;
      // 与单例 tb 一致：再给两个 negedge 空拍
      @(negedge clk_i); @(negedge clk_i);

      // 5) 仅运行 RUN_CYCLES 个周期收集输出
      cyc = 0;
      while (cyc < RUN_CYCLES) begin @(negedge clk_i); cyc++; end
      in_run = 1'b0;

      // 6) 统计 missed
      missed_cnt = 0;
      for (i=0;i<N;i++) if (exp_has_by_pos[i] && !seen_pos[i]) missed_cnt++;

      status = ((mismatch_cnt==0) && (unexpected_pos_cnt==0) && (denz_mis_cnt==0) && (missed_cnt==0)) ? "PASS" : "FAIL";
      $display("[TB][SUM] file=%s  exp=%0d  dut_y=%0d  match=%0d  mism=%0d  unexp=%0d  denz_mis=%0d  missed=%0d  => %s",
               base, ref_hit_cnt, dut_y_cnt, match_cnt, mismatch_cnt, unexpected_pos_cnt, denz_mis_cnt, missed_cnt, status);

      // 7) 写单文件 ref 结果日志
      write_result_log(out_path);

      // 8) 汇总写入总体 log
      $fdisplay(summary_fd, "%s, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %s",
        base, ref_hit_cnt, dut_y_cnt, match_cnt, mismatch_cnt, unexpected_pos_cnt, denz_mis_cnt, missed_cnt, status);

      // 9) 小间隔，避免日志粘连
      @(negedge clk_i);
    end

    $fclose(summary_fd);
    $display("\n[TB] Batch finished. Summary written to %s/tb_batch_summary.log", LOG_DIR);
    $finish;
  end

  // ------------ 可选 FSDB（需要时用 +define+FSDB 打开） -------------
`ifdef FSDB
  initial begin
    $fsdbDumpfile("./dump.fsdb");
    $fsdbDumpvars(0, tb_chien_search_forney_batch);
    $fsdbDumpMDA;
  end
`endif

endmodule