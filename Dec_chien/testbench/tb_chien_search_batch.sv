`timescale 1ns/1ps

// =============================================================
// Batch Testbench for module chien_search (RS 544,522)
// 功能：从 ../hw_ribm_raw_data/ 按顺序读入多份 RiBM 计算结果（Sigma low-first），
//       对 DUT 进行**连续**启动测试；每例完成后与参考模型比对，打印结果；
//       并把每例的 DUT / REF 结果分别写到 ../logs 下：
//         例：输入 V1_10err_dut.log → 输出 ../logs/V1_10err_dut.log 与 ../logs/V1_10err_ref.log
// 说明：
//   - 驱动仍采用 negedge 触发（提供半拍建立时间）；
//   - 采集按 busy_o 窗口逐拍采样，busy 下降后额外采两拍兜住管线；
//   - 为避免顺序误差，**不排序**，按 DUT 自然顺序记录；
//   - 参考模型在采集完成后运行（无 #1 延迟），避免占用窗口；
//   - 不在 function/task/initial 之后声明变量或例化模块；无 .find/.len 动态切片打印。
// =============================================================

// `include "chien_consts_pkg.svh"

module tb_chien_search_batch;
  import chien_consts_pkg::*;               // P=32, T=11, W=10
  localparam int N          = 1023;
  localparam int n          = 544;
  localparam int EXTRA_POST = 2;           // busy 下降后额外采样拍数

  // =============== 时钟/复位 ===============
  logic clk; logic rstn;
  initial begin clk=0; forever #5 clk=~clk; end
  initial begin rstn=0; #50 rstn=1; end

  // =============== DUT 端口 ===============
  logic [W-1:0]      sigma_low_i [0:T];
  logic              sigma_valid_i;
  logic              start_i;
  logic              busy_o;
  logic              done_o;
  logic [P-1:0]      hit_mask_o;
  logic [$clog2(N)-1:0] pos_bus_o [0:P-1]; // cw_idx

  // =============== DUT 实例 ===============
  chien_search #(.W(W), .T(T), .P(P), .N(N), .n(n)) dut (
    .clk_i        (clk),
    .rst_ni       (rstn),
    .sigma_low_i  (sigma_low_i),
    .sigma_valid_i(sigma_valid_i),
    .start_i      (start_i),
    .busy_o       (busy_o),
    .done_o       (done_o),
    .hit_mask_o   (hit_mask_o),
    .pos_bus_o    (pos_bus_o)
  );

  // =============================================================
  // 参考模型所需 GF 乘法器（去延迟）
  // =============================================================
  logic [9:0] gf_a, gf_b; wire [9:0] gf_p;
  gf1024_mul_pb_k5_flat u_mul_ref (.A(gf_a), .B(gf_b), .P(gf_p));
  // ⚠️ 重要：对组合 GF 乘法器取值需要一个 **delta 周期**，
  // 否则在同一时间步内反复调用时可能读到上一次的输出，导致 REF 全空。
  task automatic gf_mul(input logic [9:0] a,
                        input logic [9:0] b,
                        output logic [9:0] p);
    begin
      gf_a = a;
      gf_b = b;
      #0;           // 等一个 delta（不推进仿真时间），确保 gf_p 更新完成
      p = gf_p;
    end
  endtask

  // =============================================================
  // 文件列表（批量）
  // =============================================================
  string BASE_IN   = "../hw_ribm_raw_data/";
  string BASE_OUT  = "../logs/";

  // 由运行时扫描目录得到的文件队列与数量
  string FN_Q[$];
  int    NUM_FILES_RT;

  // =============================================================
  // 通用工具：字符串构造（ref 文件名：替换 _dut.log → _ref.log；若无则追加 _ref.log）
  // =============================================================
  function automatic string to_ref_name(input string in);
    string out; int L; int i; bit match; begin
      out = in;
      L   = in.len();
      if (L >= 8) begin
        // 检查尾部是否为 "_dut.log"
        match = 1'b1;
        // 手工比对 8 个字符
        match = match && (in.getc(L-8) == "_");
        match = match && (in.getc(L-7) == "d");
        match = match && (in.getc(L-6) == "u");
        match = match && (in.getc(L-5) == "t");
        match = match && (in.getc(L-4) == ".");
        match = match && (in.getc(L-3) == "l");
        match = match && (in.getc(L-2) == "o");
        match = match && (in.getc(L-1) == "g");
        if (match) begin
          // 构造：前缀 + _ref.log
          out = "";
          for (i=0; i<L-8; i++) out = {out, in.getc(i)};
          out = {out, "_ref.log"};
          return out;
        end
      end
      out = {in, "_ref.log"};
      return out;
    end
  endfunction

  // =============================================================
  // 文件扫描：构建批量文件列表（使用 $system("ls -1" )）
  string FILELIST_PATH = {BASE_OUT, "filelist.txt"};
  function automatic string rstrip(input string s);
    int L; begin
      L = s.len();
      // 去掉末尾的换行/回车（使用 ASCII 码，避免多行字符串引起的解析问题）
      while (L>0 && (s.getc(L-1) == 8'h0A || s.getc(L-1) == 8'h0D)) L = L - 1;
      if (L == 0) return "";
      return s.substr(0, L-1);
    end
  endfunction
  function automatic bit ends_with(input string s, input string suf);
    int L,M,i; begin
      L = s.len(); M = suf.len();
      if (M > L) return 1'b0;
      for (i=0;i<M;i++) if (s.getc(L-M+i) != suf.getc(i)) return 1'b0;
      return 1'b1;
    end
  endfunction
  task automatic build_file_list;
    int fd; string cmd; string f; begin
      void'($system({"mkdir -p ", BASE_OUT}));
      cmd = {"ls -1 ", BASE_IN, " > ", FILELIST_PATH};
      void'($system(cmd));
      fd = $fopen(FILELIST_PATH, "r");
      if (fd==0) $fatal(1, "[TB] Cannot open %s", FILELIST_PATH);
      FN_Q.delete();
      while (!$feof(fd)) begin
        void'($fgets(f, fd));
        f = rstrip(f);
        if (f.len()==0) continue;
        if (!ends_with(f, ".log")) continue;
        FN_Q.push_back(f);
      end
      $fclose(fd);
      NUM_FILES_RT = FN_Q.size();
      if (NUM_FILES_RT == 0) $fatal(1, "[TB] No .log files found in %s", BASE_IN);
    end
  endtask

  // =============================================================
  // 读入 Sigma(low-first)（与单例版相同，但带路径）
  // =============================================================
  int    fd_in; string line;

  // 手写子串匹配（避免 .find 带来的 XMR 报错）：返回 s 中是否包含 tag
  function automatic bit has_tag(input string s, input string tag);
    int L, M, i, j; bit ok; begin
      L = s.len(); M = tag.len();
      if (M == 0) return 1'b1;
      if (L < M)  return 1'b0;
      for (i = 0; i <= L - M; i++) begin
        ok = 1'b1;
        for (j = 0; j < M; j++) begin
          if (s.getc(i+j) != tag.getc(j)) begin ok = 1'b0; break; end
        end
        if (ok) return 1'b1;
      end
      return 1'b0;
    end
  endfunction
  task automatic read_sigma_from_file(input string path,
                                      output logic [W-1:0] sigma_low [0:T],
                                      output int sigma_deg);
    int idx, dec_dummy, hexval, got, parsed_cnt; 
    bit in_block, seen_header; 
    int i;
    begin
      for (i=0;i<=T;i++) sigma_low[i]='0; sigma_deg=0; parsed_cnt=0; in_block=0; seen_header=0;
      fd_in = $fopen(path, "r");
      if (fd_in==0) $fatal(1, "[TB] Cannot open log file: %s", path);
      while(!$feof(fd_in)) begin
        got=$fgets(line, fd_in); idx=0; dec_dummy=0; hexval=0;
        // 先寻找标题
        if (!seen_header) begin
          if (has_tag(line, "Sigma(low-first)") || has_tag(line, "sigma_dut")) begin
            seen_header = 1'b1; 
          end
          continue;
        end
        // 标题已找到，解析条目
        if ($sscanf(line, " [%d] = %d (0x%x)", idx, dec_dummy, hexval)==3) begin
          in_block=1; 
          if (idx>=0 && idx<=T) begin 
            sigma_low[idx]=hexval[W-1:0]; 
            if (idx>sigma_deg && hexval!=0) sigma_deg=idx; 
            parsed_cnt++;
          end
        end else if (in_block) begin 
          // 条目块结束
          break; 
        end
      end
      $fclose(fd_in);
      if (parsed_cnt==0) $fatal(1, "[TB] No Sigma entries parsed in %s", path);
    end
  endtask

  // =============================================================
  // 参考模型：逐点评估（不排序，按自然顺序写入）
  // =============================================================
  logic [9:0] alpha; logic [9:0] pow_tab[0:N-1];
  task automatic build_alpha_pow_table;
    int i; logic [9:0] t; begin
      alpha=10'h002; pow_tab[0]=10'h001; for (i=1;i<N;i++) begin gf_mul(pow_tab[i-1], alpha, t); pow_tab[i]=t; end
    end
  endtask

  task automatic ref_eval_one(input  logic [W-1:0] sigma_low [0:T],
                              output int cw_ref [0:10],
                              output int num_cw_ref,
                              output int j_list [0:10],
                              output int num_j);
    int i,k; logic [9:0] x,acc,term,pwr; begin
      num_cw_ref=0; num_j=0;
      for (i=0;i<n;i++) begin
        x=pow_tab[(N-(i%N))%N]; acc=10'h000; pwr=10'h001;
        for (k=0;k<=T;k++) begin gf_mul(sigma_low[k],pwr,term); acc^=term; gf_mul(pwr,x,pwr); end
        if (acc==10'h000) begin
          if (num_cw_ref<11) begin cw_ref[num_cw_ref]=(n-1)-i; num_cw_ref++; end
          if (num_j<11)     begin j_list[num_j]=i;           num_j++;      end
        end
      end
    end
  endtask

  // =============================================================
  // 驱动一个事务（negedge 置位 1 拍）
  // =============================================================
  task automatic drive_one_sigma(input logic [W-1:0] sigma_low [0:T]);
    int i; begin
      @(negedge clk);
      for (i=0;i<=T;i++) sigma_low_i[i]=sigma_low[i];
      sigma_valid_i=1'b1; start_i=1'b1;
      @(negedge clk);
      sigma_valid_i=1'b0; start_i=1'b0;
    end
  endtask

  // =============================================================
  // 采集一个事务（跟随 busy 窗口，不排序；busy 降后补采 EXTRA_POST 拍）
  // =============================================================
  task automatic collect_dut_one(output int cw_dut [0:10],
                                 output int num_cw_dut);
    int t, post; bit [n-1:0] seen_mask; begin
      num_cw_dut=0; seen_mask='0;
      wait (busy_o==1'b1);
      while (busy_o==1'b1) begin
        @(posedge clk);
        for (t=0;t<P;t++) if (hit_mask_o[t]) begin
          if (pos_bus_o[t] < n) begin
            if (!seen_mask[pos_bus_o[t]]) begin
              if (num_cw_dut<11) begin cw_dut[num_cw_dut]=pos_bus_o[t]; num_cw_dut++; end
              seen_mask[pos_bus_o[t]]=1'b1;
            end
          end
        end
      end
      for (post=0; post<EXTRA_POST; post++) begin
        @(posedge clk);
        for (t=0;t<P;t++) if (hit_mask_o[t]) begin
          if (pos_bus_o[t] < n) begin
            if (!seen_mask[pos_bus_o[t]]) begin
              if (num_cw_dut<11) begin cw_dut[num_cw_dut]=pos_bus_o[t]; num_cw_dut++; end
              seen_mask[pos_bus_o[t]]=1'b1;
            end
          end
        end
      end
    end
  endtask

  // =============================================================
  // 写单例日志：DUT/REF 各一份（文件名在 ../logs/ 下）
  // 追加：在 REF 日志中同时输出 j-list（幂次，0..n-1）
  // =============================================================
  int fd_out;
  task automatic write_logs_one(input string base_name,
                                input int cw_dut [0:10], input int num_cw_dut,
                                input int cw_ref [0:10], input int num_cw_ref,
                                input int j_ref  [0:10], input int num_j_ref);
    string path_dut, path_ref; int i; string s;
    begin
      path_dut = {BASE_OUT, base_name};
      path_ref = {BASE_OUT, to_ref_name(base_name)};

      // DUT 文件
      fd_out = $fopen(path_dut, "w");
      if (fd_out!=0) begin
        $fdisplay(fd_out, "Results (in-order)\n  DUT cw_idx:");
        s=""; for (i=0;i<num_cw_dut;i++) s={s,(i?", ":""),$sformatf("(%0dd , %03Xh)",cw_dut[i],cw_dut[i])};
        $fdisplay(fd_out, "  [%s]", s);
        $fclose(fd_out);
      end else $display("[TB] WARN: cannot open %s", path_dut);

      // REF 文件
      fd_out = $fopen(path_ref, "w");
      if (fd_out!=0) begin
        string s_j;
        $fdisplay(fd_out, "Results (in-order)\n  REF cw_idx:");
        s=""; for (i=0;i<num_cw_ref;i++) s={s,(i?", ":""),$sformatf("(%0dd , %03Xh)",cw_ref[i],cw_ref[i])};
        $fdisplay(fd_out, "  [%s]", s);
        // 追加 j 列表（幂次），与 Python 比对用
        $fdisplay(fd_out, "  REF j_list:");
        s_j=""; for (i=0;i<num_j_ref;i++) s_j={s_j,(i?", ":""),$sformatf("(%0dd , %03Xh)",j_ref[i],j_ref[i])};
        $fdisplay(fd_out, "  [%s]", s_j);
        $fclose(fd_out);
      end else $display("[TB] WARN: cannot open %s", path_ref);
    end
  endtask

  // =============================================================
  // 主流程：遍历文件 → 读 Sigma → 驱动 → 采集 → 参考 → 打印 & 写日志 → 下一个
  // 以及批量汇总日志 ../logs/batch_summary.log
  // =============================================================
  int   i_case;
  int   num_cw_dut, num_cw_ref, num_j_ref;
  int   cw_dut [0:10];
  int   cw_ref [0:10];
  int   j_ref  [0:10];
  logic [W-1:0] sigma_low_buf [0:T];
  int   sigma_deg_tmp;
  int   fd_sum; int pass_cnt; int fail_cnt; int num_files_rt;

  initial begin : MAIN
    // 初值
    for (i_case=0;i_case<=T;i_case++) sigma_low_i[i_case]='0;
    sigma_valid_i=0; start_i=0;

    // 预构建 α^k 表，供所有用例共享
    build_alpha_pow_table();

    // 等待复位
    wait (rstn==1'b1);

    // 构建文件列表
    build_file_list();
    num_files_rt = NUM_FILES_RT;

    // 打开批量汇总日志
    fd_sum = $fopen({BASE_OUT, "batch_summary.log"}, "w");
    if (fd_sum!=0) begin
      $fdisplay(fd_sum, "Batch summary: total files = %0d", num_files_rt);
    end else begin
      $display("[TB] WARN: cannot open batch summary log");
    end
    pass_cnt = 0; fail_cnt = 0;

    // 逐例测试
    for (i_case=0; i_case<num_files_rt; i_case++) begin : PER_CASE
      string in_path, fname;
      string sd, sr; int i; int equal;

      fname   = FN_Q[i_case];
      in_path = {BASE_IN, fname};

      // 1) 读入 sigma(low-first)
      read_sigma_from_file(in_path, sigma_low_buf, sigma_deg_tmp);
      $display("\n[TB][CASE %0d/%0d] %s : Sigma deg=%0d", i_case+1, num_files_rt,  fname, sigma_deg_tmp);

      // 2) 驱动（negedge 置位 1 拍）
      drive_one_sigma(sigma_low_buf);

      // 3) 采集 DUT
      collect_dut_one(cw_dut, num_cw_dut);

      // 4) 参考模型
      ref_eval_one(sigma_low_buf, cw_ref, num_cw_ref, j_ref, num_j_ref);

      // 5) 打印对比（不排序，按顺序）
      sd=""; sr="";
      for (i=0;i<num_cw_dut;i++) sd={sd,(i?", ":""),$sformatf("(%0dd , %03Xh)",cw_dut[i],cw_dut[i])};
      for (i=0;i<num_cw_ref;i++) sr={sr,(i?", ":""),$sformatf("(%0dd , %03Xh)",cw_ref[i],cw_ref[i])};
      $display("  DUT cw_idx: [%s]", sd);
      $display("  REF cw_idx: [%s]", sr);
      equal = (num_cw_dut==num_cw_ref);
      if (equal) begin for (i=0;i<num_cw_ref;i++) if (cw_ref[i]!=cw_dut[i]) equal=0; end
      $display("  Equal? %s", equal?"TRUE":"FALSE");

      // 写入汇总日志
      if (fd_sum!=0) begin
        $fdisplay(fd_sum, "CASE %0d/%0d %-20s : %s", i_case+1, num_files_rt, fname, equal?"PASS":"FAIL");
        $fdisplay(fd_sum, "  DUT: [%s]", sd);
        $fdisplay(fd_sum, "  REF: [%s]", sr);
      end
      if (equal) pass_cnt++; else fail_cnt++;

      // 6) 写每例日志（../logs/<dut>.log 与 ../logs/<ref>.log）
      write_logs_one(fname, cw_dut, num_cw_dut, cw_ref, num_cw_ref, j_ref, num_j_ref);

      // 7) 间隔半拍，立刻进入下一例，测试连续能力
      @(negedge clk);
    end

    // 结尾写入批量汇总
    if (fd_sum!=0) begin
      $fdisplay(fd_sum, "Summary: PASS=%0d, FAIL=%0d, TOTAL=%0d\n", pass_cnt, fail_cnt, num_files_rt);
      $fclose(fd_sum);
    end
    $display("[TB][BATCH] Summary: PASS=%0d, FAIL=%0d, TOTAL=%0d", pass_cnt, fail_cnt, num_files_rt);
    #50; $finish;
  end

  // 看门狗（极端情况下避免挂起）
  initial begin : WATCHDOG
    int wd; for (wd=0; wd<200000; wd++) @(posedge clk);
    $display("[TB][WATCHDOG] Timeout. Forcing finish.");
    #10; $finish;
  end

endmodule
