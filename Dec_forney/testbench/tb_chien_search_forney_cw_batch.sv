//------------------------------------------------------------------------------
// tb_chien_search_forney_cw_batch.sv (VCS-safe: no .find/.itoa, declare-first)
// 批量读入：RiBM中间结果 + 错误码字 + 参考码字；对 DUT(Chien+Forney) 做纠错验证。
// 关键点：
//  - cfg_valid 脉冲 1 周期，同时驱动 flush_i/sigma_valid_i/ribm_valid_i/chien_start_i
//  - 每个用例运行 40 周期收集 Forney 输出
//  - 索引映射：数组高位在前 [x^543..x^0]，应用更正时 idx = (n-1) - pos
//  - VCS 兼容：不用 string.find()/int.itoa()，字符用 ASCII，所有局部变量先声明
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tb_chien_search_forney_cw_batch;

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
  localparam bit    DEBUG_EN  = 1'b1;
  localparam string RIBM_DIR  = "../hw_ribm_raw_data";
  localparam string ENCD_DIR  = "../encoded_raw_data";
  localparam string LOG_DIR   = "../logs";
  localparam int    RUN_CYCLES = 40;

  // ---------------- 文件列表 ----------------
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
  logic clk_i = 1'b0;  always #5 clk_i = ~clk_i; // 100MHz
  logic rst_ni;
  initial begin rst_ni = 1'b0; repeat (5) @(negedge clk_i); rst_ni = 1'b1; end

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

  // ---------------- GF mul（ref） ----------------
  logic [W-1:0] gfmul_a, gfmul_b;  wire [W-1:0] gfmul_p;  
  gf1024_mul_pb_k5_flat u_gf_mul_ref (.A(gfmul_a), .B(gfmul_b), .P(gfmul_p));

  // ---------------- 参考/工具变量 ----------------
  logic [W-1:0] inv_tab [0:(1<<W)-1];
  logic [W-1:0] alpha_elem;  logic [W-1:0] alpha_pow [0:N-1];

  logic [W-1:0] exp_y_by_pos [0:N-1];     bit exp_denz_by_pos[0:N-1]; bit exp_has_by_pos[0:N-1];
  logic [W-1:0] dut_y_by_pos [0:N-1];     bit dut_has_by_pos[0:N-1];

  // 统计/日志/状态
  int  fd_log, fd, summary_fd;
  string line; string token; string ribm_path, base, ref_log_path, dut_y_log_path, cw_fix_log_path;
  int  idx, decv, hexv;
  int  state, count_sigma, count_v;
  int  i, j, k, p_idx;

  // 参考运算暂存
  logic [W-1:0] acc_ref, tmp_ref, num_ref, den_ref, phase_ref, y_ref;
  logic [W-1:0] u_cur;  logic [W-1:0] u_pow [0:U_LEN-1];
  bit           den_is_zero_ref;

  int  ii_ref, kk_ref, roots;

  // codeword（高位在前）
  logic [W-1:0] cw_err_high [0:n-1];
  logic [W-1:0] cw_ref_high [0:n-1];
  logic [W-1:0] cw_fix_high [0:n-1];

  // scoreboard
  bit   in_run; bit seen_pos [0:N-1];
  int   dut_y_cnt, match_cnt, mismatch_cnt, unexpected_pos_cnt, denz_mis_cnt;

  // ---------------- 便捷函数 ----------------
  function automatic string join2(input string a, input string b);
    string out; out = {a, "/", b}; return out; endfunction

  function automatic string basename_noext(input string full);
    string name; int last_slash, last_dot, i0, L, out_end; last_slash=-1; last_dot=-1; L=full.len();
    for (i0=0; i0<L; i0++) begin
      if (full[i0]==8'd47) last_slash=i0; // '/'
      if (full[i0]==8'd46) last_dot=i0;   // '.'
    end
    if (last_slash>=0) name=full.substr(last_slash+1, L-1); else name=full;
    if (last_dot>last_slash) begin out_end=last_dot-1; if (last_slash>=0) name=full.substr(last_slash+1,out_end); else name=full.substr(0,out_end); end
    return name;
  endfunction

  // 解析 base 名称 → 组别(V1/V2) 与 err 编号（若有）
  function automatic void parse_group_err(
      input  string base_name,
      output int    group_v,
      output bit    has_err,
      output int    err_num);
    int L, i, us_idx, j0; int num_acc; bit dig;
    group_v = 1; has_err = 1'b0; err_num = 0; L = base_name.len();
    if (L>=2 && (base_name[0]==8'd86)) begin // 'V'
      if (base_name[1]==8'd49) group_v=1; else if (base_name[1]==8'd50) group_v=2; else group_v=1; // '1'/'2'
    end
    us_idx = -1; for (i=0; i<L; i++) if (base_name[i]==8'd95) begin us_idx=i; break; end // '_'
    if (us_idx>=0 && us_idx+1<L) begin
      j0 = us_idx+1; num_acc = 0; dig=0;
      while (j0<L && (base_name[j0]>=8'd48 && base_name[j0]<=8'd57)) begin // '0'..'9'
        num_acc = (num_acc*10) + (base_name[j0]-8'd48); j0++; dig=1;
      end
      if (dig && (j0+2<L) && (base_name[j0]==8'd101) && (base_name[j0+1]==8'd114) && (base_name[j0+2]==8'd114)) begin // 'e''r''r'
        has_err = 1'b1; err_num = num_acc;
      end
    end
  endfunction

  function automatic void map_ribm_to_cw(
      input  string base_name,
      output string cw_err_path,
      output string cw_ref_path);
    int grp; bit herr; int eno; string eno_str;
    cw_err_path = ""; cw_ref_path = "";
    parse_group_err(base_name, grp, herr, eno);
    if (grp==1) cw_ref_path = join2(ENCD_DIR, "codeword_from_spec_543_to_0V1.txt");
    else        cw_ref_path = join2(ENCD_DIR, "codeword_from_spec_543_to_0V2.txt");
    if (herr) begin
      eno_str = $sformatf("%0d", eno);
      if (grp==1) cw_err_path = {ENCD_DIR, "/codeword_from_spec_543_to_0V1_", eno_str, "err.txt"};
      else        cw_err_path = {ENCD_DIR, "/codeword_from_spec_543_to_0V2_", eno_str, "err.txt"};
    end else begin
      cw_err_path = cw_ref_path;
    end
  endfunction

  // ---------------- GF 工具 ----------------
  task automatic gf_mul(input logic [W-1:0] a, input logic [W-1:0] b, output logic [W-1:0] p);
    begin gfmul_a=a; gfmul_b=b; #0; p=gfmul_p; end
  endtask

  function automatic logic [W-1:0] gf_inv(input logic [W-1:0] a);
    logic [W-1:0] inv_v; inv_v = inv_tab[a]; return inv_v; endfunction

  task automatic build_alpha_pow_table();
    int ii; begin
      alpha_elem = 10'b0000000010; // x
      alpha_pow[0] = 10'b0000000001; // 1
      for (ii=1; ii<N; ii++) begin gf_mul(alpha_pow[ii-1], alpha_elem, alpha_pow[ii]); end
    end
  endtask

  // ref Forney
  task automatic ref_fornery_compute(
      input  logic [W-1:0] u_vec [0:U_LEN-1],
      input  logic [W-1:0] sigma [0:T],
      input  logic [W-1:0] vbus  [0:T-1],
      output logic [W-1:0] y_out,
      output bit           den_is_zero
    );
    int kk_local; logic [W-1:0] tmp_l, num_l, den_l, phase_l;
    begin
      num_l = vbus[0];
      for (kk_local=1; kk_local<=10; kk_local++) begin gf_mul(vbus[kk_local], u_vec[kk_local], tmp_l); num_l ^= tmp_l; end
      // σ′(u) = σ11·u^10 ⊕ σ9·u^8 ⊕ σ7·u^6 ⊕ σ5·u^4 ⊕ σ3·u^2 ⊕ σ1·u^0
      den_l = sigma[1];
      gf_mul(sigma[11], u_vec[10], tmp_l);  den_l ^= tmp_l;
      gf_mul(sigma[9],  u_vec[8],  tmp_l);  den_l ^= tmp_l;
      gf_mul(sigma[7],  u_vec[6],  tmp_l);  den_l ^= tmp_l;
      gf_mul(sigma[5],  u_vec[4],  tmp_l);  den_l ^= tmp_l;
      gf_mul(sigma[3],  u_vec[2],  tmp_l);  den_l ^= tmp_l;
      den_is_zero = (den_l=='0);
      gf_mul(u_vec[11], u_vec[11], phase_l); // u^22
      if (den_is_zero) y_out='0; else begin gf_mul(num_l, gf_inv(den_l), tmp_l); gf_mul(tmp_l, phase_l, y_out); end
    end
  endtask

  // ref Chien
  task automatic ref_chien_eval();
    int ii_local, kk_local; begin
      roots=0;
      for (ii_local=0; ii_local<n; ii_local++) begin
        u_cur = alpha_pow[(N - (ii_local % N)) % N];
        u_pow[0] = 'd1; u_pow[1] = u_cur;
        for (kk_local=2; kk_local<=11; kk_local++) begin gf_mul(u_pow[kk_local-1], u_cur, u_pow[kk_local]); end
        acc_ref = sigma_low_i[0];
        for (kk_local=1; kk_local<=T; kk_local++) begin gf_mul(sigma_low_i[kk_local], u_pow[kk_local], tmp_ref); acc_ref ^= tmp_ref; end
        if (acc_ref=='0) begin
          int pos; logic [W-1:0] ytmp; bit denz;
          pos = (n-1 - ii_local);
          ref_fornery_compute(u_pow, sigma_low_i, v_bus_i, ytmp, denz);
          exp_y_by_pos[pos]    = ytmp;
          exp_denz_by_pos[pos] = denz;
          exp_has_by_pos[pos]  = 1'b1; roots++;
        end
      end
    end
  endtask

  task automatic write_result_log(string path);
    int lfd; int p; begin
      lfd = $fopen(path, "w");
      if (lfd==0) begin $error("[TB] Cannot open result log: %s", path); disable write_result_log; end
      $fdisplay(lfd, "# pos(dec.hex)   y_exp(dec.hex)   denz_exp" );
      for (p=0; p<N; p++) begin
        if (exp_has_by_pos[p]) begin
          $fdisplay(lfd, "%0d.0x%0h   %0d.0x%0h   %0d", p, p, exp_y_by_pos[p], exp_y_by_pos[p], exp_denz_by_pos[p]);
        end
      end
      $fclose(lfd); $display("[TB] Ref-log written: %s", path);
    end
  endtask

  // 读取 codeword 文件（高位在前）
  task automatic load_codeword_file(input string path, output logic [W-1:0] cw [0:n-1]);
    int fd_cw; string s; int L; int ii; string tok; int v; int tmp[$]; int need, start;
    byte ch;
    begin
      for (ii=0; ii<n; ii++) cw[ii] = '0; tmp.delete(); tok="";
      fd_cw = $fopen(path, "r");
      if (fd_cw==0) begin $error("[TB] open codeword fail: %s", path); disable load_codeword_file; end
      while (!$feof(fd_cw)) begin
        void'($fgets(s, fd_cw)); L = s.len(); tok = "";
        for (ii=0; ii<L; ii++) begin
          ch = s[ii];
          if ((ch>=8'd48 && ch<=8'd57) || (ch>=8'd97 && ch<=8'd102) || (ch>=8'd65 && ch<=8'd70)) begin
            tok = {tok, ch};
          end else if (ch==8'd120 || ch==8'd88) begin
            // skip 'x'/'X'
          end else begin
            if (tok.len()>0) begin if ($sscanf(tok, "%x", v)==1) tmp.push_back(v & 'h3FF); tok = ""; end
          end
        end
        if (tok.len()>0) begin if ($sscanf(tok, "%x", v)==1) tmp.push_back(v & 'h3FF); tok=""; end
      end
      $fclose(fd_cw);
      if (tmp.size()<n) begin
        need = n - tmp.size();
        for (ii=0; ii<need; ii++) cw[ii] = '0;
        for (ii=0; ii<tmp.size(); ii++) cw[need+ii] = tmp[ii][W-1:0];
      end else begin
        start = tmp.size() - n;
        for (ii=0; ii<n; ii++) cw[ii] = tmp[start+ii][W-1:0];
      end
    end
  endtask

  task automatic apply_dut_corrections(
      input  logic [W-1:0] src [0:n-1],
      input  logic [W-1:0] y_by_pos [0:N-1], input bit has_by_pos[0:N-1],
      output logic [W-1:0] out [0:n-1]);
    int ii_local; int idx2; begin
      for (ii_local=0; ii_local<n; ii_local++) out[ii_local] = src[ii_local];
      for (ii_local=0; ii_local<n; ii_local++) begin
        int pos; pos = ii_local;
        if (has_by_pos[pos]) begin idx2 = (n-1) - pos; out[idx2] = (out[idx2] ^ y_by_pos[pos]); end
      end
    end
  endtask

  function automatic int compare_codeword(
      input logic [W-1:0] a [0:n-1], input logic [W-1:0] b [0:n-1]);
    int i2, mism; begin mism=0; for (i2=0; i2<n; i2++) if (a[i2]!==b[i2]) mism++; return mism; end
  endfunction

  // 捕获 DUT 输出
  always @(posedge clk_i) begin
    if (rst_ni && in_run && forney_vld_o) begin
      dut_y_cnt++;
      seen_pos[forney_pos_o] = 1'b1;
      dut_has_by_pos[forney_pos_o] = 1'b1;
      dut_y_by_pos[forney_pos_o]   = forney_y_o;
      if (!exp_has_by_pos[forney_pos_o]) begin
        unexpected_pos_cnt++;
        $display("[TB][UNEXP] pos=%0d  y_dut=%0d  denz_dut=%0d", forney_pos_o, forney_y_o, forney_den_zero_o);
      end else begin
        if (forney_y_o !== exp_y_by_pos[forney_pos_o]) begin
          mismatch_cnt++;
          $display("[TB][MISM]  pos=%0d  y_dut=%0d  y_exp=%0d", forney_pos_o, forney_y_o, exp_y_by_pos[forney_pos_o]);
        end else begin
          match_cnt++;
          $display("[TB][MATCH] pos=%0d  y=%0d  denz_dut=%0d", forney_pos_o, forney_y_o, forney_den_zero_o);
        end
        if (forney_den_zero_o !== exp_denz_by_pos[forney_pos_o]) begin
          denz_mis_cnt++;
          $display("[TB][DENZ]  pos=%0d  denz_dut=%0d  denz_exp=%0d", forney_pos_o, forney_den_zero_o, exp_denz_by_pos[forney_pos_o]);
        end
      end
    end
  end

  // ---------------- 主流程 ----------------
  initial begin : BATCH_CW
    int    fidx, cyc, missed_cnt, cw_mism;
    string ref_path, err_path;  
    int    dut_fd;

    forney_s3_rdy_i = 1'b1; cfg_valid = 1'b0;

    void'($system({ "mkdir -p ", LOG_DIR }));

    $readmemh(MEM_PATH, inv_tab);
    build_alpha_pow_table();

    summary_fd = $fopen(join2(LOG_DIR, "tb_cw_batch_summary.log"), "w");
    if (summary_fd==0) begin $error("[TB] Cannot open summary log!"); $finish; end
    $fdisplay(summary_fd, "# file, group, exp_roots, dut_y, match, mismatch, unexpected_pos, denz_mismatch, missed, cw_mism, status");

    @(negedge clk_i); wait(rst_ni);

    foreach (RIBM_FILES[fidx]) begin
      ribm_path = join2(RIBM_DIR, RIBM_FILES[fidx]);
      base      = basename_noext(ribm_path);
      ref_log_path    = join2(LOG_DIR, {base, "_ref_y.log"});
      dut_y_log_path  = join2(LOG_DIR, {base, "_dut_y.log"});
      cw_fix_log_path = join2(LOG_DIR, {base, "_cw_fix.log"});

      // 码字路径映射
      map_ribm_to_cw(base, err_path, ref_path);

      // 清空
      for (i=0;i<=T;i++) sigma_low_i[i]='0;
      for (i=0;i<T;i++)  v_bus_i[i]='0;
      for (i=0;i<N;i++) begin
        exp_y_by_pos[i]='0; exp_denz_by_pos[i]=0; exp_has_by_pos[i]=0;
        dut_y_by_pos[i]='0; dut_has_by_pos[i]=0; seen_pos[i]=0;
      end
      dut_y_cnt=0; match_cnt=0; mismatch_cnt=0; unexpected_pos_cnt=0; denz_mis_cnt=0; roots=0;

      // 1) 读 RiBM σ/v
      fd = $fopen(ribm_path, "r");
      if (fd==0) begin $display("[TB] [SKIP] open log fail: %s", ribm_path); continue; end
      state=0; count_sigma=0; count_v=0;
      while (!$feof(fd)) begin
        void'($fgets(line, fd)); void'($sscanf(line, "%s", token));
        if (state==0 && (token=="sigma_dut")) state=1;
        else if (state==1) begin
          if ($sscanf(line, " [%d] = %d (0x%x)", idx, decv, hexv)==3) begin
            if (idx>=0 && idx<=T) begin sigma_low_i[idx]=decv[W-1:0]; count_sigma++; end
            if (idx==T) state=2;
          end
        end else if (state==2 && (token=="v_dut")) state=3;
        else if (state==3) begin
          if ($sscanf(line, " [%d] = %d (0x%x)", idx, decv, hexv)==3) begin
            if (idx>=0 && idx<=T-1) begin v_bus_i[idx]=decv[W-1:0]; count_v++; end
            if (idx==T-1) state=4;
          end
        end
      end
      $fclose(fd);

      // 2) 读错误/正确码字
      load_codeword_file(err_path, cw_err_high);
      load_codeword_file(ref_path, cw_ref_high);
      for (i=0;i<n;i++) cw_fix_high[i] = cw_err_high[i];

      $display("\n[TB] ===== Case: %s =====\n  σ_cnt=%0d  v_cnt=%0d\n  ERR=%s\n  REF=%s", base, count_sigma, count_v, err_path, ref_path);

      // 3) ref 期望 y
      ref_chien_eval();
      write_result_log(ref_log_path);

      // 4) cfg_valid 脉冲 1 周期
      @(negedge clk_i); in_run = 1'b1; cfg_valid = 1'b1;
      @(negedge clk_i); cfg_valid = 1'b0;
      @(negedge clk_i); @(negedge clk_i);

      // 5) 运行/记录 DUT y
      dut_fd = $fopen(dut_y_log_path, "w"); if (dut_fd) $fdisplay(dut_fd, "# pos, y, denz");
      cyc = 0;
      while (cyc < RUN_CYCLES) begin @(negedge clk_i); cyc++; if (forney_vld_o) begin if (dut_fd) $fdisplay(dut_fd, "%0d,%0d,%0d", forney_pos_o, forney_y_o, forney_den_zero_o); end end
      if (dut_fd) $fclose(dut_fd);
      in_run = 1'b0;

      // 6) missed
      missed_cnt = 0; for (i=0;i<n;i++) if (exp_has_by_pos[i] && !seen_pos[i]) missed_cnt++;

      // 7) 应用更正并比对
      apply_dut_corrections(cw_err_high, dut_y_by_pos, dut_has_by_pos, cw_fix_high);
      cw_mism = compare_codeword(cw_fix_high, cw_ref_high);
      fd_log = $fopen(cw_fix_log_path, "w"); if (fd_log) begin $fdisplay(fd_log, "# corrected codeword (x^543..x^0), w=%0d", W); for (i=0;i<n; i++) $fdisplay(fd_log, "%0d,0x%0h", i, cw_fix_high[i]); $fclose(fd_log); end

      // 8) 汇总
      begin : SUMM
        string grp; string status; int exp_roots; int ii;
        if (base.len()>=2 && (base[0]==8'd86) && (base[1]==8'd49)) grp="V1"; else grp="V2";
        exp_roots = 0; for (ii=0; ii<n; ii++) if (exp_has_by_pos[ii]) exp_roots++;
        status = ((mismatch_cnt==0) && (unexpected_pos_cnt==0) && (denz_mis_cnt==0) && (missed_cnt==0) && (cw_mism==0)) ? "PASS" : "FAIL";
        $display("[TB][SUM] file=%s  group=%s  roots(exp)=%0d  dut_y=%0d  match=%0d  mism=%0d  unexp=%0d  denz_mis=%0d  missed=%0d  cw_mism=%0d  => %s",
                 base, grp, exp_roots, dut_y_cnt, match_cnt, mismatch_cnt, unexpected_pos_cnt, denz_mis_cnt, missed_cnt, cw_mism, status);
        $fdisplay(summary_fd, "%s, %s, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d, %s",
          base, grp, exp_roots, dut_y_cnt, match_cnt, mismatch_cnt, unexpected_pos_cnt, denz_mis_cnt, missed_cnt, cw_mism, status);
      end

      @(negedge clk_i);
    end

    $fclose(summary_fd);
    $display("\n[TB] CW-Batch finished. Summary: %s/tb_cw_batch_summary.log", LOG_DIR);
    $finish;
  end

  // ------------ 可选 FSDB -------------
`ifdef FSDB
  initial begin $fsdbDumpfile("./dump.fsdb"); $fsdbDumpvars(0, tb_chien_search_forney_cw_batch); $fsdbDumpMDA; end
`endif

endmodule
