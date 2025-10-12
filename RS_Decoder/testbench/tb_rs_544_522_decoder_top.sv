`timescale 1ns/1ps
`define FSDB
// =============================================================================
// Testbench: tb_rs_544_522_decoder_top
// Purpose  : End-to-end TB for RS_544_522_Decoder.sv
// Key points:
//   * 输入激励复刻 tb_syndrome_lal32_ref_math_negedge.sv（negedge 准备，posedge 采样）。
//   * 结果采样复用 tb_chien_search_forney_cw_done.sv（forney_vld_o 逐事件、recorrect_done_o 帧完成）。
//   * 修复了“Illegal combination of drivers”问题：
//       - cw_fix_q 与 n_corr_q 只在一个 always_ff 中赋值；
//       - 初值与加载（从 cw_err 拷贝）通过 load_fix 在同一个 always_ff 中完成；
//       - 其它进程不再写这些变量。
//   * 遵循 SV 规范：不在可执行语句之后声明变量或再例化模块。
// =============================================================================

module tb_rs_544_522_decoder_top;
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
    // File paths
    // ---------------------------------
    string ERR_PATH = "../encoded_raw_data/codeword_from_spec_543_to_0V1_8err.txt"; // 输入：含8处错误
    string REF_PATH = "../encoded_raw_data/codeword_from_spec_543_to_0V1.txt";      // 参考：正确码字

    // ---------------------------------
    // DUT I/O signals
    // ---------------------------------
    logic                         clk_i;
    logic                         rst_ni;

    // syndrome front-end
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
    int unsigned cw_err   [0:n-1];  // 错误码字（最高次优先：cw_err[0] = r_543）
    int unsigned cw_ref   [0:n-1];  // 参考码字（最高次优先：cw_ref[0] = c_543）

    // 修复码字寄存器 & 计数器 —— 只在一个 always_ff 中赋值
    int unsigned cw_fix_q [0:n-1];
    int          n_corr_q;

    bit in_run;                     // 当前帧运行标志
    int prediff;                    // 修复前差异数
    int postdiff;                   // 修复后差异数
    int shown;                      // FAIL 时打印计数

    // 控制信号：触发把 cw_err 装载到 cw_fix_q
    logic load_fix;

    // Forney 采样用的临时寄存器
    int          temp_p;
    int unsigned temp_y;

    // 喂数循环内使用的临时变量（前置）
    int          idx_local;
    int unsigned sym_local;

    // 循环变量（前置，避免块内声明）
    int i_zero;
    int i_load;

    // ---------------------------------
    // Clock & Reset
    // ---------------------------------
    initial begin
        clk_i = 1'b0;
        // 100MHz 时钟
        forever #5 clk_i = ~clk_i;
    end

    initial begin
        // 复位与默认值
        rst_ni          = 1'b0;
        synd_valid_i    = 1'b0;
        synd_start_i    = 1'b0;
        synd_last_i     = 1'b0;
        synd_data_i     = '{default:'0};
        forney_s3_rdy_i = 1'b1;   // 保持后级就绪

        in_run          = 1'b0;
        prediff         = 0;
        postdiff        = 0;
        shown           = 0;
        load_fix        = 1'b0;

        // 复位保持若干拍
        repeat (10) @(negedge clk_i);
        rst_ni = 1'b1;
    end

    // ---------------------------------
    // File read helpers — 兼容 tb_syndrome_lal32_ref_math_negedge.sv
    // 支持：一行一个十进制；行内允许逗号后注释，如 "123, blah"
    // ---------------------------------
    function void read_codeword_file(string path, output int unsigned arr[0:n-1]);
        int fd; string line; int r; int idx; int tmp;
        fd = $fopen(path, "r");
        if (fd == 0) begin
        $error("[TB] Cannot open file: %s", path);
        $finish;
        end
        idx = 0;
        while (!$feof(fd) && idx < n) begin
        line = "";
        r = $fgets(line, fd);
        if (r == 0) begin
            break;
        end
        if ($sscanf(line, "%d", tmp) == 1) begin
            arr[idx] = tmp;
            idx++;
        end else if ($sscanf(line, "%d,", tmp) == 1) begin
            arr[idx] = tmp;
            idx++;
        end
        end
        $fclose(fd);
        if (idx != n) begin
        $error("[TB] File %s only provided %0d/%0d symbols", path, idx, n);
        $finish;
        end
    endfunction

    // 统计数组差异个数
    function int count_diff(input int unsigned a[0:n-1], input int unsigned b[0:n-1]);
        int d; // 顶部声明
        d = 0;
        for (int i = 0; i < n; i++) begin
        if (a[i] !== b[i]) d++;
        end
        return d;
    endfunction

    // ---------------------------------
    // Instantiate DUT — 端口完整对齐提供的定义
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
        // 时钟/复位
        .clk_i              (clk_i),
        .rst_ni             (rst_ni),

        // syndrome_lal32 输入与可观察帧尾
        .synd_valid_i       (synd_valid_i),
        .synd_start_i       (synd_start_i),
        .synd_last_i        (synd_last_i),
        .synd_data_i        (synd_data_i),
        .synd_s_valid_o     (synd_s_valid_o),

        // RIBM 状态
        .ribm_busy_o        (ribm_busy_o),
        .ribm_done_o        (ribm_done_o),
        .ribm_result_valid_o(ribm_result_valid_o),

        // Chien + Forney
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

        // Debug 直通
        .chien_dbg_hit_mask_o (chien_dbg_hit_mask_o),
        .chien_dbg_pos_bus_o  (chien_dbg_pos_bus_o),
        .chien_dbg_u_vec_o    (chien_dbg_u_vec_o)
    );

    // ---------------------------------
    // 修复寄存器与计数器：唯一写口（同步复位 + 加载 + 事件更改）
    // ---------------------------------
    always_ff @(posedge clk_i) begin
        if (!rst_ni) begin
        // 同步清零
        for (i_zero = 0; i_zero < n; i_zero++) begin
            cw_fix_q[i_zero] <= '0;
        end
        n_corr_q <= 0;
        end else begin
        // 需要时从 cw_err 初始化修复副本
        if (load_fix) begin
            for (i_load = 0; i_load < n; i_load++) begin
            cw_fix_q[i_load] <= cw_err[i_load];
            end
        end
        // Forney 事件：累加修复
        if (in_run && forney_vld_o) begin
            temp_p = forney_pos_o;
            temp_y = forney_y_o;
            if (temp_p >= 0 && temp_p < n) begin
            cw_fix_q[temp_p] <= (cw_fix_q[temp_p] ^ temp_y);
            n_corr_q         <= n_corr_q + 1;
            end
        end
        end
    end

    // ---------------------------------
    // Drive & Check sequence
    // ---------------------------------
    initial begin : main_seq
        // 0) 前置：装载文件（仅内存操作，不驱动 DUT 信号）
        read_codeword_file(ERR_PATH, cw_err);
        read_codeword_file(REF_PATH, cw_ref);

        prediff = count_diff(cw_err, cw_ref);
        $display("[TB] Input loaded. PREDIFF=%0d", prediff);

        // 1) 确保复位释放后再进行任何数据激励（防止复位期丢数据）
        @(posedge rst_ni);           // 等待 rst_ni 拉高
        @(negedge clk_i);            // 与 negedge 对齐，后续在 negedge 驱动

        // 2) 触发把 cw_err 复制到修复寄存器（在 always_ff 中完成）
        load_fix = 1'b1;
        @(negedge clk_i);
        load_fix = 1'b0;

        // 3) 进入运行态并喂入 17 拍并行数据（negedge 准备，posedge 采样）
        in_run = 1'b1;
        for (int c = 0; c < CYCLES; c++) begin
        @(negedge clk_i);
        // 准备数据：data[31-m] = cw_err[c*32 + m][9:0]
        for (int m_i = 0; m_i < M; m_i++) begin
            idx_local = c*M + m_i;
            sym_local = (idx_local < n) ? cw_err[idx_local] : 0;
            synd_data_i[M-1 - m_i] = sym_local[W-1:0];
        end
        synd_valid_i = 1'b1;
        synd_start_i = (c == 0);
        synd_last_i  = (c == CYCLES-1);
        end

        // 4) 最后一拍被采样后一个 negedge 清零输入
        @(negedge clk_i);
        synd_valid_i = 1'b0;
        synd_start_i = 1'b0;
        synd_last_i  = 1'b0;
        synd_data_i  = '{default:'0};

        // 5) 等待修复完成
        wait_done();

        // 6) 帧完成后对比
        postdiff = count_diff(cw_fix_q, cw_ref);
        $display("[TB] POSTDIFF=%0d", postdiff);

        if (postdiff == 0) begin
        $display("\n==================== PASS ====================");
        $display("RS_544_522_Decoder corrected all errors (prediff=%0d)\n", prediff);
        end else begin
        $display("\n==================== FAIL ====================");
        $display("Remain diffs = %0d (prediff=%0d)\n", postdiff, prediff);
        shown = 0;
        for (int i = 0; i < n && shown < 16; i++) begin
            if (cw_fix_q[i] !== cw_ref[i]) begin
            $display(" idx=%0d err=%0d fix=%0d ref=%0d", i, cw_err[i], cw_fix_q[i], cw_ref[i]);
            shown++;
            end
        end
        end

        #50; $finish;
    end

    // 等待 recorrect_done_o=1 的助手
    task wait_done();
        begin
        @(posedge clk_i);
        while (!recorrect_done_o) begin
            @(posedge clk_i);
        end
        // 让出一个 negedge 作为排空缓冲
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
