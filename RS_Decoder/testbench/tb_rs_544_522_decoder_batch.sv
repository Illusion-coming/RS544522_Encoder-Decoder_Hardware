`timescale 1ns/1ps
`define FSDB
// =============================================================================
// Testbench: tb_rs_544_522_decoder_batch
// Purpose  : Batch test for RS_544_522_Decoder.sv
// Method   :
//   * 一次性遍历多个码字文件，逐个作为输入激励；
//   * 参考 tb_syndrome_lal32_ref_math_negedge.sv 的喂数方式（negedge 驱动，posedge 采样）；
//   * 参考 tb_chien_search_forney_cw_batch.sv 的日志输出风格：
//       - 控制台打印关键进度与统计；
//       - 每个码字一个独立 log 文件写入 ../logs/<stem>.log；
//       - 额外生成 ../logs/batch_summary.log 汇总每个用例结果；
//   * 参考码字：
//       - 若用例路径包含 "_0V1" 或以 "V1.txt" 结尾，则取 ../encoded_raw_data/codeword_from_spec_543_to_0V1.txt；
//       - 若包含 "_0V2" 或以 "V2.txt" 结尾，则取 ../encoded_raw_data/codeword_from_spec_543_to_0V2.txt。
//   * 文件解析复用单码字 TB 的读取逻辑；
//   * 严格保证 rst_ni 拉高之后才开始任何数据激励。
// Style    :
//   * cw_fix_q / n_corr_q 只在一个 always_ff 写，使用 load_fix 脉冲初始化，避免多驱动；
//   * 不在 function/task/initial 的可执行语句之后声明变量或再例化模块。
// =============================================================================

module tb_rs_544_522_decoder_batch;
    // ---------------------------------
    // Parameters (与 DUT 缺省保持一致)
    // ---------------------------------
    localparam int W        = 10;       // 符号位宽
    localparam int T        = 11;
    localparam int P        = 32;       // Chien/Forney 并行 lane
    localparam int N_GALOIS = 1023;     // DUT 的 N（GF 相关宽度）
    localparam int n        = 544;      // 码长
    localparam int M        = 32;       // 每拍并行 32 个符号
    localparam int J        = 2*T;      // syndrome 输出校正子个数
    localparam int CYCLES   = (n+M-1)/M; // 17
    localparam int POS_W    = $clog2(N_GALOIS);

    // ---------------------------------
    // Paths and test list
    // ---------------------------------
    string REF_V1 = "../encoded_raw_data/codeword_from_spec_543_to_0V1.txt";
    string REF_V2 = "../encoded_raw_data/codeword_from_spec_543_to_0V2.txt";

    // 按要求列出的所有输入文件（包含无错 V1/V2 自身，用于 sanity）
    string TESTS[$] = '{
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_1err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_2err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_3err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_4err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_5err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_6err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_7err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_8err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_9err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_10err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_11err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1_12err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V1.txt",

        "../encoded_raw_data/codeword_from_spec_543_to_0V2_1err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_2err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_3err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_4err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_5err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_6err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_7err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_8err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_9err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_10err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_11err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2_12err.txt",
        "../encoded_raw_data/codeword_from_spec_543_to_0V2.txt"
    };

    string LOG_DIR   = "../logs/";
    string SUM_PATH  = "../logs/batch_summary.log";

    // ---------------------------------
    // DUT I/O signals
    // ---------------------------------
    logic                         clk_i;
    logic                         rst_ni;

    // syndrome front-end（解包数组）
    logic                         synd_valid_i;
    logic                         synd_start_i;
    logic                         synd_last_i;
    logic [W-1:0]                 synd_data_i [0:M-1];
    logic                         synd_s_valid_o;

    // RIBM observable
    logic                         ribm_busy_o;
    logic                         ribm_done_o;
    logic                         ribm_result_valid_o;

    // Chien + Forney
    logic                         forney_s3_rdy_i;
    logic                         forney_vld_o;
    logic [POS_W-1:0]             forney_pos_o;
    logic [W-1:0]                 forney_y_o;
    logic                         forney_den_zero_o;

    logic                         exceed_o;
    logic                         ecc_valid_o;
    logic                         recorrect_done_o;
    logic                         chien_busy_o;
    logic                         chien_done_o;

    // Debug passthroughs
    logic [P-1:0]                 chien_dbg_hit_mask_o;
    logic [POS_W-1:0]             chien_dbg_pos_bus_o [0:P-1];
    logic [W-1:0]                 chien_dbg_u_vec_o   [0:P-1][0:(T)];

    // ---------------------------------
    // Storage & TB states（前置声明）
    // ---------------------------------
    int unsigned cw_err   [0:n-1];  // 输入码字
    int unsigned cw_ref   [0:n-1];  // 参考码字

    // 修复码字寄存器 & 计数器 —— 只在一个 always_ff 中赋值
    int unsigned cw_fix_q [0:n-1];
    int          n_corr_q;

    bit in_run;                     // 当前帧运行标志
    int prediff;                    // 修复前差异数
    int postdiff;                   // 修复后差异数

    // 控制信号：触发把 cw_err 装载到 cw_fix_q
    logic load_fix;

    // Forney 采样用的临时寄存器
    int          temp_p;
    int unsigned temp_y;

    // 喂数循环内使用的临时变量（前置）
    int          sym_idx;
    int          ti;
    int unsigned sym_local;

    // 循环变量（前置，避免块内声明）
    int k_init;
    int i_zero;
    int i_load;

    // 文件句柄（前置）
    int summary_fd;
    int case_fd;

    // ---------------------------------
    // Clock & Reset
    // ---------------------------------
    initial begin
        clk_i = 1'b0;
        forever #5 clk_i = ~clk_i; // 100MHz
    end

    initial begin
        // 复位与默认值
        rst_ni          = 1'b0;
        synd_valid_i    = 1'b0;
        synd_start_i    = 1'b0;
        synd_last_i     = 1'b0;
        for (k_init = 0; k_init < M; k_init++) synd_data_i[k_init] = '0;
        forney_s3_rdy_i = 1'b1;   // 保持后级就绪

        in_run          = 1'b0;
        prediff         = 0;
        postdiff        = 0;
        load_fix        = 1'b0;

        // 复位保持若干拍
        repeat (10) @(negedge clk_i);
        rst_ni = 1'b1;
    end

    // ---------------------------------
    // Helpers
    // ---------------------------------
    function int count_diff(input int unsigned a[0:n-1], input int unsigned b[0:n-1]);
        int d; d = 0;
        for (int i = 0; i < n; i++) if (a[i] !== b[i]) d++;
        return d;
    endfunction

    function void read_codeword_file(string path, output int unsigned arr[0:n-1]);
        int fd; string line; int r; int idx; int tmp;
        fd = $fopen(path, "r");
        if (fd == 0) begin $error("[TB] Cannot open file: %s", path); $finish; end
        idx = 0;
        while (!$feof(fd) && idx < n) begin
        line = ""; r = $fgets(line, fd);
        if (r == 0) break;
        if ($sscanf(line, "%d", tmp) == 1) begin arr[idx] = tmp; idx++; end
        else if ($sscanf(line, "%d,", tmp) == 1) begin arr[idx] = tmp; idx++; end
        end
        $fclose(fd);
        if (idx != n) begin $error("[TB] File %s only provided %0d/%0d symbols", path, idx, n); $finish; end
    endfunction

    // 查找最后一个字符 ch 出现位置（返回 -1 表示未找到）
    function int find_last(input string s, input byte ch);
        int L; int i; int c; L = s.len();
        for (i = L-1; i >= 0; i--) begin
        c = s.getc(i);
        if (c == ch) return i;
        end
        return -1;
    endfunction

    // 由输入路径生成 ../logs/<stem>.log
    function string build_log_path(input string in_path);
        int slash_pos; int dot_pos; string base; string stem; int L;
        L = in_path.len();
        slash_pos = find_last(in_path, "/");
        if (slash_pos < 0) base = in_path; else base = in_path.substr(slash_pos+1, L-1);
        dot_pos = find_last(base, ".");
        if (dot_pos < 0) stem = base; else stem = base.substr(0, dot_pos-1);
        return {LOG_DIR, stem, ".log"};
    endfunction

    // 判断是否选择 V1 参考码字
    function bit is_v1_case(input string in_path);
        int L; string tail; int i; int c0,c1,c2,c3;
        L = in_path.len();
        // 末尾是否是 "V1.txt"
        if (L >= 5) begin
        tail = in_path.substr(L-5, L-1);
        if (tail == "V1.txt") return 1'b1;
        end
        // 是否包含子串 "_0V1"
        for (i = 0; i+3 < L; i++) begin
        c0 = in_path.getc(i);
        c1 = in_path.getc(i+1);
        c2 = in_path.getc(i+2);
        c3 = in_path.getc(i+3);
        if ((c0 == "_") && (c1 == "0") && (c2 == "V") && (c3 == "1")) return 1'b1;
        end
        return 1'b0;
    endfunction

    // ---------------------------------
    // Instantiate DUT — 端口完整对齐
    // ---------------------------------
    RS_544_522_Decoder #(
        .W              (W),
        .T              (T),
        .P              (P),
        .N              (N_GALOIS),
        .n              (n),
        .M              (M),
        .J              (J),
        .LANE_FIFO_AW   (4),
        .EVT_FIFO_AW    (4),
        .MEM_PATH       ("../rtl/chien_forney_rtl/gf1024_inv_table.mem"),
        .DEBUG_EN       (1'b1)
    ) dut (
        .clk_i              (clk_i),
        .rst_ni             (rst_ni),
        .synd_valid_i       (synd_valid_i),
        .synd_start_i       (synd_start_i),
        .synd_last_i        (synd_last_i),
        .synd_data_i        (synd_data_i),
        .synd_s_valid_o     (synd_s_valid_o),
        .ribm_busy_o        (ribm_busy_o),
        .ribm_done_o        (ribm_done_o),
        .ribm_result_valid_o(ribm_result_valid_o),
        .forney_s3_rdy_i    (forney_s3_rdy_i),
        .forney_vld_o       (forney_vld_o),
        .forney_pos_o       (forney_pos_o),
        .forney_y_o         (forney_y_o),
        .forney_den_zero_o  (forney_den_zero_o),
        .exceed_o           (exceed_o),
        .ecc_valid_o        (ecc_valid_o),
        .recorrect_done_o   (recorrect_done_o),
        .chien_busy_o       (chien_busy_o),
        .chien_done_o       (chien_done_o),
        .chien_dbg_hit_mask_o (chien_dbg_hit_mask_o),
        .chien_dbg_pos_bus_o  (chien_dbg_pos_bus_o),
        .chien_dbg_u_vec_o    (chien_dbg_u_vec_o)
    );

    // ---------------------------------
    // 修复寄存器与计数器：唯一写口（同步复位 + 加载 + 事件更改）
    // ---------------------------------
    always_ff @(posedge clk_i) begin
        if (!rst_ni) begin
        for (i_zero = 0; i_zero < n; i_zero++) cw_fix_q[i_zero] <= '0;
        n_corr_q <= 0;
        end else begin
        if (load_fix) begin
            for (i_load = 0; i_load < n; i_load++) cw_fix_q[i_load] <= cw_err[i_load];
            n_corr_q <= 0; // 每个 case 重新计数
        end
        if (in_run && forney_vld_o) begin
            temp_p = forney_pos_o; temp_y = forney_y_o;
            if (temp_p >= 0 && temp_p < n) begin
            cw_fix_q[temp_p] <= (cw_fix_q[temp_p] ^ temp_y);
            n_corr_q         <= n_corr_q + 1;
            end
        end
        end
    end

    // ---------------------------------
    // Batch main sequence
    // ---------------------------------
    initial begin : batch_main
        string err_path; string ref_path; string case_log;

        // 确保存在 logs 目录（若仿真器支持，不存在也不会报错）
        $system("mkdir -p ../logs");

        // 清空/重建 summary
        summary_fd = $fopen(SUM_PATH, "w");
        if (summary_fd == 0) begin $error("[TB] Cannot open summary: %s", SUM_PATH); $finish; end
        $fdisplay(summary_fd, "# RS_544_522_Decoder batch summary");
        $fdisplay(summary_fd, "# fields: CASE, PREDIFF, POSTDIFF, N_CORR, STATUS");
        $fclose(summary_fd);

        // 等待复位释放
        @(posedge rst_ni);
        @(negedge clk_i);

        foreach (TESTS[ti]) begin
        err_path = TESTS[ti];
        ref_path = is_v1_case(err_path) ? REF_V1 : REF_V2;
        case_log = build_log_path(err_path);

        $display("\n[TB][CASE %0d/%0d] %s | ref=%s", ti+1, TESTS.size(), err_path, ref_path);

        // 打开 case 日志
        case_fd = $fopen(case_log, "w");
        if (case_fd == 0) begin $error("[TB] Cannot open case log: %s", case_log); $finish; end
        $fdisplay(case_fd, "# CASE=%s", err_path);
        $fdisplay(case_fd, "# REF =%s", ref_path);

        // 读取数据
        read_codeword_file(err_path, cw_err);
        read_codeword_file(ref_path, cw_ref);

        prediff = count_diff(cw_err, cw_ref);
        $display("[TB] PREDIFF=%0d", prediff);
        $fdisplay(case_fd, "PREDIFF=%0d", prediff);

        // load_fix -> 初始化修复副本
        load_fix = 1'b1; @(negedge clk_i); load_fix = 1'b0;

        // 运行并喂数
        in_run = 1'b1;
        for (int c = 0; c < CYCLES; c++) begin
            @(negedge clk_i);
            for (int m_i = 0; m_i < M; m_i++) begin
            sym_idx = c*M + m_i;
            sym_local = (sym_idx < n) ? cw_err[sym_idx] : 0;
            synd_data_i[M-1 - m_i] = sym_local[W-1:0];
            end
            synd_valid_i = 1'b1;
            synd_start_i = (c == 0);
            synd_last_i  = (c == CYCLES-1);
        end

        // 清空输入
        @(negedge clk_i);
        synd_valid_i = 1'b0; synd_start_i = 1'b0; synd_last_i = 1'b0;
        for (k_init = 0; k_init < M; k_init++) synd_data_i[k_init] = '0;

        // 等待结束
        wait_done();

        // 统计结果
        postdiff = count_diff(cw_fix_q, cw_ref);
        $display("[TB] POSTDIFF=%0d, N_CORR=%0d", postdiff, n_corr_q);
        $fdisplay(case_fd, "POSTDIFF=%0d", postdiff);
        $fdisplay(case_fd, "N_CORR=%0d", n_corr_q);

        if (postdiff == 0) begin
            $display("[TB] STATUS=PASS");
            $fdisplay(case_fd, "STATUS=PASS");
        end else begin
            $display("[TB] STATUS=FAIL");
            $fdisplay(case_fd, "STATUS=FAIL");
        end

        // 追加到 summary
        summary_fd = $fopen(SUM_PATH, "a");
        if (summary_fd == 0) begin $error("[TB] Cannot append summary: %s", SUM_PATH); $finish; end
        $fdisplay(summary_fd, "%s,%0d,%0d,%0d,%s", err_path, prediff, postdiff, n_corr_q, (postdiff==0)?"PASS":"FAIL");
        $fclose(summary_fd);

        $fclose(case_fd);

        // 为下一用例让两拍空闲
        @(negedge clk_i); @(negedge clk_i);
        end

        $display("\n[TB] Batch finished. Summary at %s", SUM_PATH);
        #50; $finish;
    end

    // 等待 recorrect_done_o=1 的助手
    task wait_done();
        begin
        @(posedge clk_i);
        while (!recorrect_done_o) @(posedge clk_i);
        @(negedge clk_i);
        in_run = 1'b0;
        $display("[TB] recorrect_done observed. n_corr=%0d", n_corr_q);
        end
    endtask

    // ------------ 可选 FSDB（需要时用 +define+FSDB 打开） -------------
    `ifdef FSDB
    initial begin
        $fsdbDumpfile("./dump.fsdb");
        $fsdbDumpvars("+all");
        $fsdbDumpMDA;
    end
    `endif

endmodule
