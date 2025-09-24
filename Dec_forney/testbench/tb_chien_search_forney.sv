//------------------------------------------------------------------------------
// tb_chien_search_forney_ref.sv
// 目的：基于“软件法”的参考实现（SV task）对 DUT: chien_search_forney 做对照验证
// 这版改为：用 **task 实现的 ref Chien** 作为 **ref Forney** 的输入，不再依赖 DUT 的 debug 导出。
// 要点：
//   1) 从 ../hw_ribm_raw_data/V1_2err_dut.log 读取 σ、v（低阶在前），在 negedge 驱动给 DUT；
//   2) ref Chien（task）：build_alpha_pow_table() + ref_chien_eval() → 输出命中位置与每个命中的 u^0..u^T；
//   3) ref Forney（task）：对每个 ref Chien 命中，计算 y = (v(u)/σ'(u)) * u^22；
//   4) 生成期望表 exp_y_by_pos[]，DUT forney_vld_o 时按 pos 对照；
//   5) 提供 write_result_log() 输出对照日志；
// 规范：不在 function/task/initial 内 **声明变量或例化模块**（所有变量、实例在模块作用域）。
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tb_chien_search_forney_ref;
  // ---------------- 参数 ----------------
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
  localparam bit    DEBUG_EN  = 1'b1;  // 不再使用 DUT debug 作为参考，默认关闭
  localparam string LOG_PATH  = "../hw_ribm_raw_data/V1_4err_dut.log";
  localparam string OUT_LOG   = "../logs/tb_fornery_ref_result.log";

  // ---------------- 时钟/复位 ----------------
  logic clk_i;  logic rst_ni;
  // 时钟
  initial clk_i = 1'b0;
  always  #5 clk_i = ~clk_i;   // 100MHz
  // 复位
  initial begin
    rst_ni = 1'b0;
    repeat (5) @(negedge clk_i);
    rst_ni = 1'b1;
  end

  // ---------------- DUT 端口 ----------------
  logic                         cfg_valid;
  wire                          flush_i       = cfg_valid;
  logic [W-1:0]                 sigma_low_i [0:T];
  wire                          sigma_valid_i = cfg_valid;
  logic [W-1:0]                 v_bus_i     [0:T-1];
  wire                          ribm_valid_i  = cfg_valid;

  wire                          chien_start_i = cfg_valid;
  logic                         chien_busy_o;
  logic                         chien_done_o;

  logic                         forney_s3_rdy_i;
  logic                         forney_vld_o;
  logic [POS_W-1:0]             forney_pos_o;
  logic [W-1:0]                 forney_y_o;
  logic                         forney_den_zero_o;

  // Debug 导出（保持端口连线，但 DEBUG_EN=0）
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

  // ---------------- GF 乘法器（供 ref 任务复用；不可在 task 内例化） ----------------
  logic [9:0] gfmul_a, gfmul_b;  wire [9:0] gfmul_p;
  gf1024_mul_pb_k5_flat u_gf_mul_ref (.A(gfmul_a), .B(gfmul_b), .P(gfmul_p));

  // ---------------- 参考数据结构与全局变量 ----------------
  // 逆元表（与 DUT S2 同源）
  logic [W-1:0] inv_tab [0:(1<<W)-1];
  // α 及其幂表 α^i，i=0..N-1
  logic [W-1:0] alpha_elem;
  logic [W-1:0] alpha_pow [0:N-1];
  // ref Chien 结果（最多 T 个根）
  int            ref_hit_cnt;
  logic [POS_W-1:0] ref_hit_pos   [0:T-1];
  logic [W-1:0]     ref_hit_uvec  [0:T-1][0:U_LEN-1]; // 每个根的 u^0..u^T
  // 期望 Forney 结果（按 pos 建表）
  logic [W-1:0] exp_y_by_pos [0:N-1];
  bit           exp_denz_by_pos[0:N-1];
  bit           exp_has_by_pos[0:N-1];
  // 统计/日志/状态
  int  fd_log, fd;
  string line; string token;
  int  idx, decv, hexv;
  int  state, count_sigma, count_v;
  int  i, j, k, p_idx, cyc;
  // 参考运算暂存
  logic [W-1:0] acc_ref, tmp_ref, num_ref, den_ref, phase_ref, y_ref;
  logic [W-1:0] u_cur, u_pow;
  bit           den_is_zero_ref;
  // 其它循环变量
  int  ii_ref, kk_ref, hh_ref;

  // ---------------- 参考 GF 运算 Task/Function ----------------
  task automatic gf_mul(input logic [W-1:0] a, input logic [W-1:0] b, output logic [W-1:0] p);
    begin
      gfmul_a = a; gfmul_b = b; #0; p = gfmul_p; // 组合模块，#0 取值
    end
  endtask

  function automatic logic [W-1:0] gf_inv(input logic [W-1:0] a);
    return inv_tab[a];
  endfunction

  // ---------------- 构建 α 幂表：alpha=‘x’=2（多项式基） ----------------
  task automatic build_alpha_pow_table();
    begin
      alpha_elem = 10'b0000000010; // x
      alpha_pow[0] = 10'b0000000001; // 1
      for (ii_ref = 1; ii_ref < N; ii_ref++) begin
        gf_mul(alpha_pow[ii_ref-1], alpha_elem, alpha_pow[ii_ref]);
      end
    end
  endtask

  // ---------------- ref Forney：给定 {u_vec, σ, v} 计算 y ----------------
  task automatic ref_fornery_compute(
      input  logic [W-1:0] u_vec [0:U_LEN-1],  // u^0..u^11
      input  logic [W-1:0] sigma [0:T],        // σ0..σ11（低阶在前）
      input  logic [W-1:0] vbus  [0:T-1],      // v0..v10（低阶在前）
      output logic [W-1:0] y_out,
      output bit           den_is_zero
    );
    begin
      // num = v(u) = v0 ⊕ Σ_{k=1..10} v[k]·u^k
      num_ref = vbus[0];
      for (kk_ref = 1; kk_ref <= 10; kk_ref++) begin
        gf_mul(vbus[kk_ref], u_vec[kk_ref], tmp_ref);
        num_ref ^= tmp_ref;
      end
      // den = σ′(u)（与最终 RTL 对齐）：
      //   σ11·u^5 ⊕ σ9·u^4 ⊕ σ7·u^3 ⊕ σ5·u^2 ⊕ σ3·u^1 ⊕ σ1·u^0
      //  → 5 次乘法 + 1 次异或（σ1 直接异或，不乘）
      den_ref = sigma[1];                    // σ1·u^0
      gf_mul(sigma[11], u_vec[10], tmp_ref);  den_ref ^= tmp_ref;
      gf_mul(sigma[9],  u_vec[8], tmp_ref);  den_ref ^= tmp_ref;
      gf_mul(sigma[7],  u_vec[6], tmp_ref);  den_ref ^= tmp_ref;
      gf_mul(sigma[5],  u_vec[4], tmp_ref);  den_ref ^= tmp_ref;
      gf_mul(sigma[3],  u_vec[2], tmp_ref);  den_ref ^= tmp_ref;
      den_is_zero = (den_ref == '0);
      // phase = (u^11)^2 = u^22
      gf_mul(u_vec[11], u_vec[11], phase_ref);
      if (den_is_zero) begin
        y_out = '0;
      end else begin
        gf_mul(num_ref, gf_inv(den_ref), tmp_ref); // core = num/den
        gf_mul(tmp_ref, phase_ref, y_out);         // y = core * phase
      end
    end
  endtask

  // ---------------- ref Chien：扫描 0..n-1，找到根并构造 u^0..u^T ----------------
  task automatic ref_chien_eval();
    begin
      ref_hit_cnt = 0;
      for (ii_ref = 0; ii_ref < n; ii_ref++) begin
        // 按参考 TB 约定：x = α^{-(i)} = α^{N - (i % N)}
        u_cur = alpha_pow[(N - (ii_ref % N)) % N]; // 作为 u^1
        // 构造 u^0..u^T，其中 u^0=1，后续乘以 x
        ref_hit_uvec[ref_hit_cnt][0] = 10'b0000000001; // u^0
        for (kk_ref = 1; kk_ref <= T; kk_ref++) begin
          if (kk_ref == 1) ref_hit_uvec[ref_hit_cnt][kk_ref] = u_cur; // u^1 = x
          else begin
            gf_mul(ref_hit_uvec[ref_hit_cnt][kk_ref-1], u_cur, ref_hit_uvec[ref_hit_cnt][kk_ref]); // u^k = u^(k-1)*x
          end
        end
        // σ(u) = Σ σ_k·u^k
        acc_ref = sigma_low_i[0];
        for (kk_ref = 1; kk_ref <= T; kk_ref++) begin
          gf_mul(sigma_low_i[kk_ref], ref_hit_uvec[ref_hit_cnt][kk_ref], tmp_ref);
          acc_ref ^= tmp_ref;
        end
        if (acc_ref == '0) begin
          // cw_idx 映射：cw = (n-1) - i
          ref_hit_pos[ref_hit_cnt] = (n-1 - ii_ref);
          ref_hit_cnt = ref_hit_cnt + 1;
          if (ref_hit_cnt == T) disable ref_chien_eval; // 最多 T 个根
        end
      end
    end
  endtask

  // ---------------- 结果日志 ----------------
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
          $fdisplay(fd_log, "%0d.0x%0h   %0d.0x%0h   %0d.0x%0h", p_idx, p_idx, exp_y_by_pos[p_idx], exp_y_by_pos[p_idx], exp_denz_by_pos[p_idx], exp_denz_by_pos[p_idx]);
        end
      end
      $fclose(fd_log);
      $display("[TB] Result log written: %s", path);
    end
  endtask

  // ---------------- 刺激与主流程（无局部声明） ----------------
  initial begin : STIM
    // 初值
    for (i=0;i<=T;i++) sigma_low_i[i] = '0;
    for (i=0;i<T;i++)  v_bus_i[i]     = '0;
    cfg_valid = 1'b0;
     forney_s3_rdy_i = 1'b1;
    for (i=0;i<N;i++) begin exp_y_by_pos[i]='0; exp_denz_by_pos[i]=0; exp_has_by_pos[i]=0; end

    // 载入逆元表
    $readmemh(MEM_PATH, inv_tab);

    // 待复位
    @(negedge clk_i); wait(rst_ni);

    // 1) 读取 RiBM σ/v（低阶在前）
    fd = $fopen(LOG_PATH, "r");
    if (fd == 0) begin $error("[TB] open log fail: %s", LOG_PATH); $finish; end
    state=0; count_sigma=0; count_v=0;
    while (!$feof(fd)) begin
      void'($fgets(line, fd)); void'($sscanf(line, "%s", token));
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
    $display("[TB] Loaded sigma=(%0d.0x%0h), v=(%0d.0x%0h) from %s", count_sigma, count_sigma, count_v, count_v, LOG_PATH);

    // 2) ref Chien：建表 + 评估根（0..n-1）
    build_alpha_pow_table();
    ref_chien_eval();
    $display("[TB-REF] ref_chien: found (%0d.0x%0h) roots", ref_hit_cnt, ref_hit_cnt);

    // 3) ref Forney：对每个命中计算 y，并填充期望表（按 pos）
    for (hh_ref=0; hh_ref<ref_hit_cnt; hh_ref++) begin
      ref_fornery_compute(ref_hit_uvec[hh_ref], sigma_low_i, v_bus_i, y_ref, den_is_zero_ref);
      exp_y_by_pos[ref_hit_pos[hh_ref]]   = y_ref;
      exp_denz_by_pos[ref_hit_pos[hh_ref]]= den_is_zero_ref;
      exp_has_by_pos[ref_hit_pos[hh_ref]] = 1'b1;
      $display("[TB-REF] pos=(%0d.0x%0h)  y=(%0d.0x%0h)  denz=(%0d.0x%0h)", ref_hit_pos[hh_ref], ref_hit_pos[hh_ref], y_ref, y_ref, den_is_zero_ref, den_is_zero_ref);
    end

    // 4) 在 negedge 驱动 σ/v 有效脉冲；flush_i == ribm_valid_i；启动 Chien
    @(negedge clk_i);
    cfg_valid = 1'b1;
    @(negedge clk_i);
    cfg_valid = 1'b0;
    @(negedge clk_i); 
    @(negedge clk_i); 
  end

  // ---------------- DUT 输出对照 ----------------
  always @(posedge clk_i) begin
    if (rst_ni && forney_vld_o) begin
      if (!exp_has_by_pos[forney_pos_o]) begin
        $error("[TB] No expected y for pos=(%0d.0x%0h)", forney_pos_o, forney_pos_o);
        $fatal(1);
      end else begin
        if (forney_y_o !== exp_y_by_pos[forney_pos_o]) begin
          $error("[TB] y mismatch at pos=(%0d.0x%0h): dut=(%0d.0x%0h) ref=(%0d.0x%0h)", forney_pos_o, forney_pos_o, forney_y_o, forney_y_o, exp_y_by_pos[forney_pos_o], exp_y_by_pos[forney_pos_o]);
          // $fatal(1);
        end else begin
          $display("[TB] DUT match  pos=(%0d.0x%0h)  y=(%0d.0x%0h)  denz=(%0d.0x%0h)", forney_pos_o, forney_pos_o, forney_y_o, forney_y_o, forney_den_zero_o, forney_den_zero_o);
        end
      end
    end
  end

  // ---------------- 结束条件与日志输出 ----------------
  initial begin : FINISH_CTRL
    wait(rst_ni);
    cyc=0;
    while (cyc < 40 ) begin @(negedge clk_i); cyc++; end
    write_result_log(OUT_LOG);
    $display("[TB] Finish at cycle=(%0d.0x%0h)", cyc, cyc);
    $finish;
  end

      // -------------------------------- fsdb ------------------------------
    initial begin
        $fsdbDumpfile("./dump.fsdb");
        $fsdbDumpvars("+all");
        $fsdbDumpMDA;
    end

endmodule
