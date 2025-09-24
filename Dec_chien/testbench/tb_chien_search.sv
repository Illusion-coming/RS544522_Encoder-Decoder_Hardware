`timescale 1ns/1ps

// =============================================================
// Testbench for module chien_search (RS 544,522)
// 版本：并行采集 + 最稳健采集法（跟随 busy 窗口）+ 看门狗
// 变更要点：
//   • 采集线程不再依赖事件/固定批次；而是：
//       wait(busy_o==1) → 在 busy 窗口内每拍采样 → busy 降后再额外采样 2 拍
//     这样可覆盖“LOAD/SCAN 边界 + 顶层额外一拍寄存”任意组合，不会漏采首末帧。
//   • 驱动仍在 negedge 推送激励；参考模型不变。
//   • 去重收集，避免重复计数（极端情况下同一 idx 被多拍标记）。
//   • 遵守：不在 function/task/initial 之后声明变量或例化模块；无动态切片打印。
// =============================================================

// `include "chien_consts_pkg.svh"

module tb_chien_search;
    // -------------------------------- Parameters --------------------------------
    import chien_consts_pkg::*;   // P=32, T=11, W=10（在 SVH 中定义）
    localparam int N          = 1023;      // GF(2^10) 乘法群阶
    localparam int n          = 544;       // 码长
    localparam int BATCH_MAX  = (n + P - 1) / P; // 544 → 17
    localparam int EXTRA_POST = 2;         // busy 下降后再额外采 2 拍，覆盖管线

    // -------------------------------- Clk & Rst ---------------------------------
    logic clk;
    logic rstn;
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        rstn = 0;
        #50 rstn = 1;
    end

    // -------------------------------- DUT I/O -----------------------------------
    logic [W-1:0]      sigma_low_i [0:T];
    logic              sigma_valid_i;
    logic              start_i;
    logic              busy_o;
    logic              done_o;
    logic [P-1:0]      hit_mask_o;
    logic [W-1:0]         u_vec_o   [P-1:0] [0:T];
    logic [$clog2(N)-1:0] pos_bus_o [0:P-1]; // cw_idx（高优先 r[543:0] 的数组下标）

    // -------------------------------- DUT Inst ----------------------------------
    chien_search #(
        .W(W), .T(T), .P(P), .N(N), .n(n)
    ) dut (
        .clk_i        (clk),
        .rst_ni       (rstn),
        .sigma_low_i  (sigma_low_i),
        .sigma_valid_i(sigma_valid_i),
        .start_i      (start_i),
        .busy_o       (busy_o),
        .done_o       (done_o),
        .hit_mask_o   (hit_mask_o),
        .u_vec_o      (u_vec_o),
        .pos_bus_o    (pos_bus_o)
    );

    // ----------------------------- GF(2^10) mul (ref) ---------------------------
    logic [9:0] gf_a, gf_b;
    wire  [9:0] gf_p;
    gf1024_mul_pb_k5_flat u_mul_ref (
        .A (gf_a),
        .B (gf_b),
        .P (gf_p)
    );

    task automatic gf_mul (
        input  logic [9:0] a,
        input  logic [9:0] b,
        output logic [9:0] p
    );
        begin
        gf_a = a;
        gf_b = b;
        #0;           // 组合模块给 1tu 取值
        p = gf_p;
        end
    endtask

    // -------------------------------- Small utils --------------------------------
    task automatic sort_int_array (
        input  int len,
        inout  int arr [0:10]
    );
        int i, j, tmp;
        begin
        for (i = 0; i < len; i++) begin
            for (j = i + 1; j < len; j++) begin
            if (arr[j] < arr[i]) begin
                tmp   = arr[i];
                arr[i]= arr[j];
                arr[j]= tmp;
            end
            end
        end
        end
    endtask

    // ------------------------------ Read Sigma from log --------------------------
    string log_path_primary  = "../hw_ribm_raw_data/V1_2err_dut.log";
    string log_path_fallback = "../hw_ribm_logs/V1_2err_dut.log";
    int    fd_in;
    string line;

    logic [W-1:0] sigma_low_from_log [0:T];
    int           sigma_deg;

    task automatic read_sigma_from_log;
        int idx, dec_dummy, hexval, got, parsed_cnt;
        bit in_block;
        int i;
        begin
        for (i = 0; i <= T; i++) sigma_low_from_log[i] = '0;
        sigma_deg  = 0;
        parsed_cnt = 0;
        in_block   = 0;

        fd_in = $fopen(log_path_primary, "r");
        if (fd_in == 0) begin
            $display("[TB] Open %s fail, try %s", log_path_primary, log_path_fallback);
            fd_in = $fopen(log_path_fallback, "r");
        end
        if (fd_in == 0) $fatal(1, "[TB] Cannot open log file");

        while (!$feof(fd_in)) begin
            got = $fgets(line, fd_in);
            idx = 0; dec_dummy = 0; hexval = 0;
            if ($sscanf(line, " [%d] = %d (0x%x)", idx, dec_dummy, hexval) == 3) begin
            in_block = 1;
            if (idx >= 0 && idx <= T) begin
                sigma_low_from_log[idx] = hexval[W-1:0];
                if (idx > sigma_deg && hexval != 0) sigma_deg = idx;
                parsed_cnt++;
            end
            end else if (in_block) begin
            break; // 退出 Sigma 块
            end
        end
        $fclose(fd_in);

        if (parsed_cnt == 0)
            $fatal(1, "[TB] No Sigma entries parsed: expect ' [i] = ddd (0xhhh)' lines");
        else
            $display("[TB] Sigma(low-first) deg=%0d loaded (%0d entries).", sigma_deg, parsed_cnt);
        end
    endtask

    // ------------------------------- Reference model -----------------------------
    logic [9:0] alpha;
    logic [9:0] pow_tab [0:N-1];

    int  j_ref  [0:10];
    int  cw_ref [0:10];
    int  num_j_ref;
    int  num_cw_ref;

    task automatic build_alpha_pow_table;
        int i;
        logic [9:0] t;
        begin
        alpha     = 10'h002;      // α = 2
        pow_tab[0]= 10'h001;      // α^0 = 1
        for (i = 1; i < N; i++) begin
            gf_mul(pow_tab[i-1], alpha, t);
            pow_tab[i] = t;
        end
        end
    endtask

    task automatic ref_chien_eval;
        int i, k;
        logic [9:0] x, acc, term, pwr;
        string sj, scw;
        begin
        num_j_ref  = 0;
        num_cw_ref = 0;
        for (i = 0; i < n; i++) begin
            // x = α^{-(i)} = α^{N - (i % N)}
            x   = pow_tab[(N - (i % N)) % N];
            acc = 10'h000;
            pwr = 10'h001; // x^0
            for (k = 0; k <= T; k++) begin
            gf_mul(sigma_low_from_log[k], pwr, term); // λ_k * x^k
            acc ^= term;
            gf_mul(pwr, x, pwr);                      // pwr *= x
            end
            if (acc == 10'h000) begin
            if (num_j_ref < 11) begin
                j_ref[num_j_ref]   = i;                 // 幂次 j
                cw_ref[num_cw_ref] = (n-1) - i;         // 码字数组索引（高优先）
                num_j_ref++;
                num_cw_ref++;
            end
            end
        end
        sort_int_array(num_j_ref , j_ref );
        sort_int_array(num_cw_ref, cw_ref);

        sj  = "";  scw = "";
        for (i = 0; i < num_j_ref;  i++) sj  = {sj , (i?", ":""), $sformatf("%0d", j_ref[i])};
        for (i = 0; i < num_cw_ref; i++) scw = {scw, (i?", ":""), $sformatf("%0d", cw_ref[i])};
        $display("[TB][REF] j_list=[%s]",  sj );
        $display("[TB][REF] cw_idx=[%s]", scw);
        end
    endtask

    // ------------------------------ Collect DUT outputs（最稳健） -----------------
    int  cw_dut     [0:10];
    int  num_cw_dut;

    // 去重检查（简单线性查找，最多 11 个元素）
    function automatic bit seen_cw (input int val);
        int i; begin
        seen_cw = 1'b0;
        for (i = 0; i < num_cw_dut; i++) if (cw_dut[i] == val) begin seen_cw = 1'b1; return; end
        end
    endfunction

    task automatic collect_dut_safest;
        int t;
        int post;
        string sdut;
        begin
        num_cw_dut = 0;

        // 1) 等待 busy 有效（进入 LOAD/SCAN 窗口）。
        wait (busy_o == 1'b1);

        // 2) 在 busy 窗口内，每个 posedge 都采样。
        //    这样可以覆盖“第一拍就是命中”的情况（无须再人为跳拍）。
        while (busy_o == 1'b1) begin
            @(posedge clk);
            for (t = 0; t < P; t++) begin
            if (hit_mask_o[t]) begin
                if (pos_bus_o[t] < n) begin
                if (!seen_cw(pos_bus_o[t])) begin
                    if (num_cw_dut < 11) begin cw_dut[num_cw_dut] = pos_bus_o[t]; num_cw_dut++; end
                end
                end
            end
            end
        end

        // 3) busy 下降后，再额外采样 EXTRA_POST 拍，覆盖顶层可能新增的寄存管线。
        for (post = 0; post < EXTRA_POST; post++) begin
            @(posedge clk);
            for (t = 0; t < P; t++) begin
            if (hit_mask_o[t]) begin
                if (pos_bus_o[t] < n) begin
                if (!seen_cw(pos_bus_o[t])) begin
                    if (num_cw_dut < 11) begin cw_dut[num_cw_dut] = pos_bus_o[t]; num_cw_dut++; end
                end
                end
            end
            end
        end

        sort_int_array(num_cw_dut, cw_dut);

        // 打印
        sdut = "";
        for (t = 0; t < num_cw_dut; t++) sdut = {sdut, (t?", ":""), $sformatf("%0d", cw_dut[t])};
        $display("[TB][DUT] cw_idx=[%s]", sdut);
        end
    endtask

    // -------------------------------- Write result log ---------------------------
    int fd_out;
    task automatic write_result_log;
        int    i;
        int    equal;
        string sref, sdut;
        begin
        fd_out = $fopen("../logs/chien_tb_result.log", "w");
        if (fd_out == 0) begin
            $display("[TB] WARN: cannot open ../logs/chien_tb_result.log for write");
        end else begin
            $fdisplay(fd_out, "Input log: %s", log_path_primary);
            $fdisplay(fd_out, "Sigma(low-first) (W=10, T=%0d):", T);
            for (i = 0; i <= T; i++)
            $fdisplay(fd_out, "  [%0d] = %0d (0x%0h)", i, sigma_low_from_log[i], sigma_low_from_log[i]);

            sref = ""; sdut = "";
            for (i = 0; i < num_cw_ref; i++) sref = {sref, (i?", ":""), $sformatf("%0d", cw_ref[i])};
            for (i = 0; i < num_cw_dut; i++) sdut = {sdut, (i?", ":""), $sformatf("%0d", cw_dut[i])};
            $fdisplay(fd_out, "\nResults (sorted)");
            $fdisplay(fd_out, "  REF cw_idx: [%s]", sref);
            $fdisplay(fd_out, "  DUT cw_idx: [%s]", sdut);

            equal = (num_cw_ref == num_cw_dut);
            if (equal) begin
            for (i = 0; i < num_cw_ref; i++) if (cw_ref[i] != cw_dut[i]) equal = 0;
            end
            $fdisplay(fd_out, "\nEqual? REF==DUT %s", equal?"TRUE":"FALSE");
            $fclose(fd_out);
        end
        end
    endtask

    // -------------------------------- fsdb ------------------------------
    initial begin
        $fsdbDumpfile("./dump.fsdb");
        $fsdbDumpvars("+all");
        $fsdbDumpMDA;
    end
        
    // -------------------------------- Main sequence ------------------------------
    integer ii;
    initial begin : MAIN
        // 默认输入
        for (ii = 0; ii <= T; ii++) sigma_low_i[ii] = '0;
        sigma_valid_i = 1'b0;
        start_i       = 1'b0;

        // 1) 读入 sigma(low-first)
        read_sigma_from_log();

        // 2) 在 **negedge** 上装载/触发，提供半拍建立时间
        wait (rstn == 1'b1);
        @(negedge clk);
        for (ii = 0; ii <= T; ii++) sigma_low_i[ii] = sigma_low_from_log[ii];
        sigma_valid_i = 1'b1;
        start_i       = 1'b1;
        @(negedge clk);
        sigma_valid_i = 1'b0;
        start_i       = 1'b0;

        // 3) 参考模型与采集（顺序执行亦可，互不影响）
        
        collect_dut_safest();
        build_alpha_pow_table();
        ref_chien_eval();

        // 4) 写日志 & 结束
        write_result_log();
        #50; $finish;
    end

    // -------------------------------- Watchdog ----------------------------------
    initial begin : WATCHDOG
        int wd;
        for (wd = 0; wd < 10000; wd++) @(posedge clk);
        $display("[TB][WATCHDOG] Timeout. Forcing finish.");
        #10; $finish;
    end


endmodule
