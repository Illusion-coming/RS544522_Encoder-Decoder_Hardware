`timescale 1ns/1ps
`default_nettype none
`define FSDB

// =============================================================================
// Testbench: tb_ribm_solver_3t_batch
//  - 从 ../hw_syndromes_logs/ 目录中的 26 个综合日志逐个读取 s1..s22
//  - 按帧连续地把 syn_i[0..22]（syn_i[0]=0）+ start_i 打给 DUT（无空隙或可选 1 拍空隙）
//  - SystemVerilog 参考模型（零时间 task）计算同一帧的 σ 与 v，逐帧比对 DUT 输出
//  - 每一帧把 DUT 与 REF 的 σ/v 写到各自的单独文件：
//      ../logs/<TAG>_dut.log,  ../logs/<TAG>_ref.log
//    其中 TAG 来自文件名转换：例如 codeword_from_spec_543_to_0V1_2err_dut.log → "V1_2err"
//  - 另为每一帧生成对比文件：../logs/<TAG>_compare.log
//  - 规范：不在 function/task/initial 之后声明变量或例化模块
// =============================================================================

module tb_ribm_solver_3t_batch;
    // ---------------- 参数 ----------------
    localparam int T  = 11;      // 纠错能力（RS(544,522): t=11）
    localparam int W  = 10;      // GF(2^10)
    localparam int TW = 2*T;     // 22

    // ---------------- 时钟/复位 ----------------
    logic clk_i = 1'b0;  always #5 clk_i = ~clk_i;  // 100 MHz
    logic rst_ni = 1'b0;

    // ---------------- DUT 端口信号 ----------------
    logic [W-1:0] syn_i       [0:TW];  // syn_i[0]=0，syn_i[1..22]=s1..s22（低阶在前映射）
    logic         syn_valid_i;
    logic         start_i;
    logic         busy_o, done_o, result_valid_o;
    logic [W-1:0] sigma_bus_o [0:T];
    logic [W-1:0] v_bus_o     [0:T-1];
    logic [W-1:0] omega_bus_o [0:T-1]; // 未使用

    // ---------------- DUT 实例 ----------------
    ribm_solver_3t #(.T(T), .W(W)) dut (
        .clk_i(clk_i), .rst_ni(rst_ni),
        .syn_i(syn_i), .syn_valid_i(syn_valid_i), .start_i(start_i),
        .busy_o(busy_o), .done_o(done_o),
        .sigma_bus_o(sigma_bus_o), .v_bus_o(v_bus_o), .omega_bus_o(omega_bus_o),
        .result_valid_o(result_valid_o)
    );

    // ---------------- 参考乘法原语（组合） ----------------
    logic [W-1:0] mulA, mulB;  wire [W-1:0] mulP;
    gf1024_mul_pb_k5_flat u_mul_ref (.A(mulA), .B(mulB), .P(mulP));

    // ---------------- 用例列表（26 组） ----------------
    localparam int NCASE = 26;
    string CASE_FILES   [0:NCASE-1] = '{
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_1err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_2err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_3err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_4err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_5err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_6err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_7err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_8err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_9err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_10err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_11err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_12err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_1err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_2err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_3err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_4err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_5err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_6err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_7err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_8err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_9err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_10err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_11err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_12err_dut.log",
        "../hw_syndromes_logs/codeword_from_spec_543_to_0V2_dut.log"
    };
    string CASE_TAGS    [0:NCASE-1] = '{
        "V1_1err","V1_2err","V1_3err","V1_4err","V1_5err","V1_6err",
        "V1_7err","V1_8err","V1_9err","V1_10err","V1_11err","V1_12err",
        "V1",
        "V2_1err","V2_2err","V2_3err","V2_4err","V2_5err","V2_6err",
        "V2_7err","V2_8err","V2_9err","V2_10err","V2_11err","V2_12err",
        "V2"
    };

    // ---------------- 路径/文件句柄（统一声明在模块顶层） ----------------
    string LOG_DIR = "../logs";  // 需要提前创建目录
    integer fd_in;               // 输入文件句柄（解析综合日志）
    integer fd_case_dut;         // 本帧 DUT 输出日志
    integer fd_case_ref;         // 本帧 REF 输出日志
    integer fd_case_cmp;         // 本帧 对比日志
    integer fd_syn_parsed;       // 本帧 解析出的 syndromes（可选）

    // ---------------- 解析/参考模型/落盘共享变量（全部顶层声明） ----------------
    string  line;  integer j_idx; integer val_dec; integer val_hex; integer got [0:TW]; integer rd_ok;
    integer miss;
    integer i_loop, r_loop, case_idx;
    bit     cond_b;

    // 参考模型数组/变量（低阶在前）
    logic [W-1:0] lam_ref       [0:T];
    logic [W-1:0] b_ref         [0:T];
    logic [W-1:0] delta_ref     [0:TW-1];
    logic [W-1:0] theta_ref     [0:TW-1];
    logic [W-1:0] lam_new_ref   [0:T];
    logic [W-1:0] delta_new_ref [0:TW-1];
    logic [W-1:0] lam_old_ref   [0:T];
    logic [W-1:0] delta_old_ref [0:TW-1];
    logic [W-1:0] gamma_ref, dp0_ref, t1_ref, t2_ref, di1_ref;
    integer        k_ref;

    // 参考模型输出缓存
    logic [W-1:0] sigma_ref [0:T];
    logic [W-1:0] v_ref     [0:T-1];

    // DUT 输出缓存
    logic [W-1:0] sigma_dut [0:T];
    logic [W-1:0] v_dut     [0:T-1];
    integer       mis;

    // dump 辅助索引
    integer kk_t;
    integer ii_t;
    integer idx_t;

    // ---------------- GF(2^10) 运算辅助 ----------------
    task automatic gf_mul_t(input  logic [W-1:0] a,
                            input  logic [W-1:0] b,
                            output logic [W-1:0] p);
        begin
        mulA = a; mulB = b; #1; p = mulP; // 组合传播等待 1time
        end
    endtask

    function automatic logic [W-1:0] gf_add(input logic [W-1:0] x, input logic [W-1:0] y);
        gf_add = x ^ y; // GF(2^m) 加/减 = XOR
    endfunction

    // ---------------- 解析 syndromes 日志（j=1..22: DEC,0xHEX） ----------------
    task automatic parse_syndromes_from_log(input string path);
        begin
        // 清零
        for (idx_t=0; idx_t<=TW; idx_t++) begin syn_i[idx_t] = '0; got[idx_t] = 0; end
        fd_in = $fopen(path, "r");
        if (fd_in == 0) begin $fatal(1, "[TB] Cannot open syndromes log: %s", path); end

        // 也把解析结果落盘（便于核对）
        fd_syn_parsed = $fopen({LOG_DIR, "/", "syn_", $sformatf("%0d", case_idx), "_parsed.log"}, "w");

        // 逐行解析，期望格式：" j=<d> : <dec>,0x<h>"
        while (!$feof(fd_in)) begin
            rd_ok = $fgets(line, fd_in);
            if (rd_ok == 0) break;
            j_idx = 0; val_dec = 0; val_hex = 0;
            if ($sscanf(line, " j=%0d : %0d,0x%h", j_idx, val_dec, val_hex) == 3) begin
            if (j_idx>=1 && j_idx<=TW) begin
                syn_i[j_idx] = val_hex[W-1:0]; got[j_idx] = 1;
                if (fd_syn_parsed!=0) $fdisplay(fd_syn_parsed, "s%0d = %0d (0x%0h)", j_idx, val_dec, val_hex[W-1:0]);
            end
            end
        end
        $fclose(fd_in);

        // 检查 22 项是否齐全
        miss = 0; for (idx_t=1; idx_t<=TW; idx_t++) if (!got[idx_t]) miss++;
        if (miss>0) $fatal(1, "[TB] syndromes missing %0d entries in %s", miss, path);
        if (fd_syn_parsed!=0) $fclose(fd_syn_parsed);

        syn_i[0] = '0; // 常数项按约定置 0
        end
    endtask

    // ---------------- 参考模型：riBM（低阶在前；与 Python 一致） ----------------
    task automatic ribm_ref_solve;
        begin
        // init
        for (ii_t=0; ii_t<=T;  ii_t++) begin lam_ref[ii_t]='0; b_ref[ii_t]='0; end
        lam_ref[0] = 'd1; b_ref[0] = 'd1;
        for (ii_t=0; ii_t<TW; ii_t++) begin delta_ref[ii_t]=syn_i[ii_t+1]; theta_ref[ii_t]=syn_i[ii_t+1]; end
        gamma_ref = 'd1; k_ref = 0;

        // main loop: 2t 次
        for (r_loop=0; r_loop<TW; r_loop++) begin
            // 快照
            for (ii_t=0; ii_t<=T;  ii_t++) lam_old_ref[ii_t]   = lam_ref[ii_t];
            for (ii_t=0; ii_t<TW; ii_t++) delta_old_ref[ii_t] = delta_ref[ii_t];
            dp0_ref = delta_old_ref[0];

            // λ 带：new = γ*lam − Δ*get(b,i-1)
            for (ii_t=0; ii_t<=T; ii_t++) begin
            gf_mul_t(gamma_ref, lam_ref[ii_t], t1_ref);
            if (ii_t==0) begin t2_ref='0; end
            else begin gf_mul_t(dp0_ref, b_ref[ii_t-1], t2_ref); end
            lam_new_ref[ii_t] = gf_add(t1_ref, t2_ref);
            end

            // δ 带：new = γ*get(delta,i+1) − Δ*theta[i]
            for (ii_t=0; ii_t<TW; ii_t++) begin
            di1_ref = (ii_t+1<TW) ? delta_ref[ii_t+1] : '0;
            gf_mul_t(gamma_ref, di1_ref, t1_ref);
            gf_mul_t(dp0_ref, theta_ref[ii_t], t2_ref);
            delta_new_ref[ii_t] = gf_add(t1_ref, t2_ref);
            end

            // 分支
            cond_b = (dp0_ref != '0) && (k_ref >= 0);
            // 写回
            for (ii_t=0; ii_t<=T;  ii_t++) lam_ref[ii_t]   = lam_new_ref[ii_t];
            for (ii_t=0; ii_t<TW; ii_t++) delta_ref[ii_t] = delta_new_ref[ii_t];
            if (cond_b) begin
            for (ii_t=0; ii_t<=T;  ii_t++) b_ref[ii_t] = lam_old_ref[ii_t];
            for (ii_t=0; ii_t<TW; ii_t++) theta_ref[ii_t] = (ii_t+1<TW) ? delta_old_ref[ii_t+1] : '0;
            gamma_ref = dp0_ref; k_ref = -k_ref - 1;
            end else begin
            // b ← x·b  —— 阻塞赋值场景，必须高→低复制
            for (ii_t=T; ii_t>0; ii_t--) b_ref[ii_t] = b_ref[ii_t-1];
            b_ref[0] = '0;
            k_ref = k_ref + 1;
            end
        end

        // 输出：sigma（低阶在前）与 v（delta 低阶 t 项）
        for (ii_t=0; ii_t<=T; ii_t++)  sigma_ref[ii_t] = lam_ref[ii_t];
        for (ii_t=0; ii_t<T;  ii_t++)  v_ref[ii_t]     = delta_ref[ii_t];
        end
    endtask

    // ---------------- 把数组以 “十进制 + 十六进制” 打印到文件 ----------------
    task automatic dump_dec_hex_array(input integer fd, input string name,
                                        input logic [W-1:0] arr0 [], input int lo, input int hi);
        begin
        if (fd != 0) begin
            $fdisplay(fd, "%s:", name);
            for (kk_t=lo; kk_t<=hi; kk_t++) $fdisplay(fd, "  [%0d] = %0d (0x%0h)", kk_t, arr0[kk_t], arr0[kk_t]);
        end
        end
    endtask

    // ---------------- 单帧执行：读取→驱动→等待→采集→参考→比对→落盘 ----------------
    task automatic run_one_case(input string syn_path, input string tag);
        begin
        // 解析综合日志
        parse_syndromes_from_log(syn_path);

        // 发起一帧（syn_valid 与 start 同拍）
        @(posedge clk_i); syn_valid_i <= 1'b1; start_i <= 1'b1;
        @(posedge clk_i); syn_valid_i <= 1'b0; start_i <= 1'b0;

        // 等待 DUT 完成
        wait (done_o && result_valid_o);

        // 采集 DUT 输出
        for (i_loop=0; i_loop<=T; i_loop++) sigma_dut[i_loop] = sigma_bus_o[i_loop];
        for (i_loop=0; i_loop<T;  i_loop++) v_dut[i_loop]     = v_bus_o[i_loop];

        // 参考结果
        ribm_ref_solve();

        // 打开本帧落盘文件
        fd_case_dut = $fopen({LOG_DIR, "/", tag, "_dut.log"}, "w");
        fd_case_ref = $fopen({LOG_DIR, "/", tag, "_ref.log"}, "w");
        fd_case_cmp = $fopen({LOG_DIR, "/", tag, "_compare.log"}, "w");

        // 落盘：DUT 与 REF（σ 与 v 合并进各自一个文件）
        dump_dec_hex_array(fd_case_dut, {"sigma_dut (low-first)"},       sigma_dut, 0, T);
        dump_dec_hex_array(fd_case_dut, {"v_dut (low-first, t terms)"},  v_dut, 0, T-1);
        dump_dec_hex_array(fd_case_ref, {"sigma_ref (low-first)"},       sigma_ref, 0, T);
        dump_dec_hex_array(fd_case_ref, {"v_ref (low-first, t terms)"},  v_ref, 0, T-1);

        // 比对并写结论
        mis = 0;
        if (fd_case_cmp!=0) $fdisplay(fd_case_cmp, "Compare σ (low-first):");
        for (i_loop=0; i_loop<=T; i_loop++) begin
            if (sigma_dut[i_loop] !== sigma_ref[i_loop]) begin
            mis++;
            if (fd_case_cmp!=0) $fdisplay(fd_case_cmp, "[MIS] sigma[%0d] dut=%0d(0x%0h) ref=%0d(0x%0h)",
                                            i_loop, sigma_dut[i_loop], sigma_dut[i_loop],
                                            sigma_ref[i_loop], sigma_ref[i_loop]);
            end else if (fd_case_cmp!=0) begin
            $fdisplay(fd_case_cmp, "[OK ] sigma[%0d] dut=%0d(0x%0h) == ref=%0d(0x%0h)",
                        i_loop, sigma_dut[i_loop], sigma_dut[i_loop],
                        sigma_ref[i_loop], sigma_ref[i_loop]);
            end
        end
        if (fd_case_cmp!=0) $fdisplay(fd_case_cmp, "\nCompare v (low-first, t terms):");
        for (i_loop=0; i_loop<T; i_loop++) begin
            if (v_dut[i_loop] !== v_ref[i_loop]) begin
            mis++;
            if (fd_case_cmp!=0) $fdisplay(fd_case_cmp, "[MIS] v[%0d] dut=%0d(0x%0h) ref=%0d(0x%0h)",
                                            i_loop, v_dut[i_loop], v_dut[i_loop],
                                            v_ref[i_loop], v_ref[i_loop]);
            end else if (fd_case_cmp!=0) begin
            $fdisplay(fd_case_cmp, "[OK ] v[%0d] dut=%0d(0x%0h) == ref=%0d(0x%0h)",
                        i_loop, v_dut[i_loop], v_dut[i_loop],
                        v_ref[i_loop], v_ref[i_loop]);
            end
        end
        if (fd_case_cmp!=0) begin
            if (mis==0) $fdisplay(fd_case_cmp, "\n[PASS] DUT matches REF (sigma & v)");
            else        $fdisplay(fd_case_cmp, "\n[FAIL] %0d mismatches", mis);
            $fclose(fd_case_cmp);
        end
        if (fd_case_dut!=0) $fclose(fd_case_dut);
        if (fd_case_ref!=0) $fclose(fd_case_ref);

        // 控制台提示
        if (mis==0) $display("[PASS][%s] DUT == REF (sigma & v)", tag);
        else        $error  ("[FAIL][%s] %0d mismatches.", tag, mis);

        // （可选）打一拍间隔再进入下一帧
        @(posedge clk_i);
        end
    endtask

    // ---------------- 主过程（变量均在模块顶层） ----------------
    initial begin
        // 推荐：转储 FSDB（含多维数组）方便回放
    `ifdef FSDB
        $fsdbDumpfile("./dump.fsdb");
        $fsdbDumpvars("+all");
        $fsdbDumpMDA;
    `endif

        // 复位
        syn_valid_i = 1'b0; start_i = 1'b0;
        for (i_loop=0; i_loop<=TW; i_loop++) syn_i[i_loop] = '0;
        repeat (4) @(posedge clk_i); rst_ni = 1'b1;

        // 逐帧回归
        for (case_idx=0; case_idx<NCASE; case_idx++) begin
        // 等待空闲（支持连续帧时序）
        wait (!busy_o);
        run_one_case(CASE_FILES[case_idx], CASE_TAGS[case_idx]);
        end

        $display("ALL %0d CASES DONE.", NCASE);
        #20; $finish;
    end

endmodule

`default_nettype wire
