`timescale 1ns/1ps
`default_nettype none

// ============================================================================
// Testbench: tb_ribm_solver_3t (FIXED)
//  - 修复：reference 模型 task `ribm_ref_solve` 改为 **端口按 ref 传递**，
//          避免部分仿真器/版本因作用域解析导致的 sigma_ref/v_ref 维持 X。
//  - 其他功能、时序、日志输出与既有版本保持不变。
//  - 语法与缩进保持 SystemVerilog 规范；不在 function/task/initial 之后新增声明/例化。
// ============================================================================

module tb_ribm_solver_3t;
    // ---------------- 参数 ----------------
    localparam int T  = 11;      // RS(544,522): t=11
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

    // ---------------- 路径/文件句柄（统一声明在模块顶层） ----------------
    string SYN_PATH     = "../hw_syndromes_logs/codeword_from_spec_543_to_0V1_2err_dut.log";
    string LOG_DIR      = "../logs";  // 需要提前创建目录
    string F_SYN_PARSED = "../logs/syndromes_parsed.log";
    string F_SIGMA_DUT  = "../logs/ribm_sigma_dut.log";
    string F_SIGMA_REF  = "../logs/ribm_sigma_ref.log";
    string F_V_DUT      = "../logs/ribm_v_dut.log";
    string F_V_REF      = "../logs/ribm_v_ref.log";
    string F_COMPARE    = "../logs/ribm_compare.log";

    integer fd_in;               // 输入文件句柄
    integer fd_syn_parsed;       // 输出：解析到的 syndromes
    integer fd_sigma_dut, fd_sigma_ref;
    integer fd_v_dut,     fd_v_ref;
    integer fd_compare;

    // ---------------- 解析/参考模型/落盘共享变量（全部顶层声明） ----------------
    string  line;  integer j_idx; integer val_dec; integer val_hex; integer got [0:TW]; integer rd_ok;
    integer miss;
    integer i_loop, r_loop;
    bit     cond_b;
    string  arg_path;            // plusargs 覆盖

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

    // 参考模型输出缓存（注意：将作为 task 端口按 ref 传递）
    logic [W-1:0] sigma_ref [0:T];
    logic [W-1:0] v_ref     [0:T-1];
    logic [W-1:0] sigma_ref_q [0:T];
    logic [W-1:0] v_ref_q     [0:T-1];

    // DUT 输出缓存
    logic [W-1:0] sigma_dut [0:T];
    logic [W-1:0] v_dut     [0:T-1];
    integer       mis;

    // dump 辅助索引
    integer kk_t;
    integer ii_t;
    integer idx_t;

    // ---------------- GF(2^10) 运算辅助 ----------------
    task  gf_mul_t(input  logic [W-1:0] a,
                            input  logic [W-1:0] b,
                            output logic [W-1:0] p);
        begin
        mulA = a; mulB = b; #0; p = mulP; // 组合传播等待 1time
        end
    endtask

    function  logic [W-1:0] gf_add(input logic [W-1:0] x, input logic [W-1:0] y);
        gf_add = x ^ y; // GF(2^m) 加/减 = XOR
    endfunction

    // ---------------- 解析 syndromes 日志（j=1..22: DEC,0xHEX） ----------------
    task  parse_syndromes_from_log(input string path);
        begin
            // 清零
            for (idx_t=0; idx_t<=TW; idx_t++) begin syn_i[idx_t] = '0; got[idx_t] = 0; end
            fd_in = $fopen(path, "r");
            if (fd_in == 0) begin $fatal(1, "[TB] Cannot open syndromes log: %s", path); end

            // 把解析结果也落盘，便于核对（十进制 + 十六进制）
            fd_syn_parsed = $fopen(F_SYN_PARSED, "w");
            if (fd_syn_parsed == 0) $display("[TB][WARN] cannot open %s", F_SYN_PARSED);

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
            miss = 0;
            for (idx_t=1; idx_t<=TW; idx_t++) if (!got[idx_t]) miss++;
            if (miss>0) $fatal(1, "[TB] syndromes missing %0d entries in %s", miss, path);

            if (fd_syn_parsed!=0) $fclose(fd_syn_parsed);

            // syn_i[0] 约定为 0（日志无常数项）
            syn_i[0] = '0;
        end
    endtask

    // ---------------- 参考模型：riBM（低阶在前；以 **ref 端口**返回结果） ----------------
    task  ribm_ref_solve(
        input  logic [W-1:0] syn_arg [0:TW],
        output logic [W-1:0] sigma_ref [0:T],
        output logic [W-1:0] v_ref     [0:T-1]
        );begin
        // init
            for (ii_t=0; ii_t<=T;  ii_t++) begin 
                lam_ref[ii_t]='0;
                b_ref[ii_t]='0; 
            end
            lam_ref[0] = 'd1; b_ref[0] = 'd1;
            for (ii_t=0; ii_t<TW; ii_t++) begin 
                delta_ref[ii_t]=syn_arg[ii_t+1]; 
                theta_ref[ii_t]=syn_arg[ii_t+1]; 
            end
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
                    if (ii_t==0) begin 
                        t2_ref='0; 
                    end
                    else begin 
                        gf_mul_t(dp0_ref, b_ref[ii_t-1], t2_ref); 
                    end
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

            // 以 **ref 端口**回传：sigma（低阶在前）与 v（delta 低阶 t 项）
            for (ii_t=0; ii_t<=T; ii_t++)  sigma_ref[ii_t] = lam_ref[ii_t];
            for (ii_t=0; ii_t<T;  ii_t++)  v_ref[ii_t]     = delta_ref[ii_t];
        end
    endtask

    // ---------------- 把数组以 “十进制 + 十六进制” 打印到文件 ----------------
    task  dump_dec_hex_array(input integer fd, input string name,
                                        input logic [W-1:0] arr0 [], input int lo, input int hi);
        begin
            if (fd != 0) begin
                $fdisplay(fd, "%s:", name);
                for (kk_t=lo; kk_t<=hi; kk_t++) $fdisplay(fd, "  [%0d] = %0d (0x%0h)", kk_t, arr0[kk_t], arr0[kk_t]);
            end
        end
    endtask

    // 建议统一用 FSDB（Verdi 友好）
    initial begin
        $fsdbDumpfile("./dump.fsdb");
        $fsdbDumpvars(0, tb_ribm_solver_3t);  // 整个 TB 层级
        $fsdbDumpMDA;                         // 关键：开启多维数组转储
    end


    // ---------------- 主过程 ----------------
    initial begin
        // plusargs 覆盖路径
        if ($value$plusargs("SYN_PATH=%s", arg_path)) SYN_PATH = arg_path;

        // 复位
        syn_valid_i = 1'b0; start_i = 1'b0;
        for (i_loop=0; i_loop<=TW; i_loop++) syn_i[i_loop] = '0;
        // for (i_loop=0; i_loop<=T;  i_loop++) sigma_ref[i_loop] = 'x; // 先标记 X，便于确认被 task 覆盖
        // for (i_loop=0; i_loop<T;   i_loop++) v_ref[i_loop]     = 'x;
        repeat (4) @(posedge clk_i); rst_ni = 1'b1;

        // 解析 syndromes 日志 → syn_i
        parse_syndromes_from_log(SYN_PATH);

        // 启动 DUT（syn_valid 与 start 同拍）
        @(posedge clk_i); syn_valid_i <= 1'b1; start_i <= 1'b1;
        @(posedge clk_i); syn_valid_i <= 1'b0; start_i <= 1'b0;

        // 等待完成
        wait (done_o && result_valid_o);

        // 采集 DUT 输出到本地数组（为落盘与对比做准备）
        for (i_loop=0; i_loop<=T; i_loop++) sigma_dut[i_loop] = sigma_bus_o[i_loop];
        for (i_loop=0; i_loop<T;  i_loop++) v_dut[i_loop]     = v_bus_o[i_loop];

        // 计算参考结果（通过 **ref 端口**回写 sigma_ref/v_ref）
        ribm_ref_solve(syn_i, sigma_ref, v_ref);


        // 打开输出文件
        fd_sigma_dut = $fopen(F_SIGMA_DUT, "w");
        fd_sigma_ref = $fopen(F_SIGMA_REF, "w");
        fd_v_dut     = $fopen(F_V_DUT,     "w");
        fd_v_ref     = $fopen(F_V_REF,     "w");
        fd_compare   = $fopen(F_COMPARE,   "w");

        // 落盘：DUT 与 REF 各自结果（十进制 + 十六进制）
        dump_dec_hex_array(fd_sigma_dut, "sigma_dut (low-first)",       sigma_dut, 0, T);
        dump_dec_hex_array(fd_sigma_ref, "sigma_ref (low-first)",       sigma_ref, 0, T);
        dump_dec_hex_array(fd_v_dut,     "v_dut (low-first, t terms)",  v_dut, 0, T-1);
        dump_dec_hex_array(fd_v_ref,     "v_ref (low-first, t terms)",  v_ref, 0, T-1);

        // 对比并写结论（十进制 + 十六进制）
        mis = 0;
        if (fd_compare!=0) $fdisplay(fd_compare, "Compare σ (low-first):");
        for (i_loop=0; i_loop<=T; i_loop++) begin
            if (sigma_dut[i_loop] !== sigma_ref[i_loop]) begin
                mis++;
                if (fd_compare!=0) $fdisplay(fd_compare, "[MIS] sigma[%0d] dut=%0d(0x%0h) ref=%0d(0x%0h)",
                                            i_loop, sigma_dut[i_loop], sigma_dut[i_loop],
                                            sigma_ref[i_loop], sigma_ref[i_loop]);
            end else if (fd_compare!=0) begin
                $fdisplay(fd_compare, "[OK ] sigma[%0d] dut=%0d(0x%0h) == ref=%0d(0x%0h)",
                        i_loop, sigma_dut[i_loop], sigma_dut[i_loop],
                        sigma_ref[i_loop], sigma_ref[i_loop]);
            end
        end

        if (fd_compare!=0) $fdisplay(fd_compare, "\nCompare v (low-first, t terms):");
        for (i_loop=0; i_loop<T; i_loop++) begin
            if (v_dut[i_loop] !== v_ref[i_loop]) begin
                mis++;
                if (fd_compare!=0) $fdisplay(fd_compare, "[MIS] v[%0d] dut=%0d(0x%0h) ref=%0d(0x%0h)",
                                            i_loop, v_dut[i_loop], v_dut[i_loop],
                                            v_ref[i_loop], v_ref[i_loop]);
            end else if (fd_compare!=0) begin
                $fdisplay(fd_compare, "[OK ] v[%0d] dut=%0d(0x%0h) == ref=%0d(0x%0h)",
                        i_loop, v_dut[i_loop], v_dut[i_loop],
                        v_ref[i_loop], v_ref[i_loop]);
            end
        end

        if (fd_compare!=0) begin
            if (mis==0) $fdisplay(fd_compare, "\n[PASS] DUT matches REF (sigma & v)");
            else        $fdisplay(fd_compare, "\n[FAIL] %0d mismatches", mis);
            $fclose(fd_compare);
        end

        if (fd_sigma_dut!=0) $fclose(fd_sigma_dut);
        if (fd_sigma_ref!=0) $fclose(fd_sigma_ref);
        if (fd_v_dut    !=0) $fclose(fd_v_dut);
        if (fd_v_ref    !=0) $fclose(fd_v_ref);

        // 控制台提示
        if (mis==0) $display("[PASS] ribm_solver_3t matches SV reference model. (sigma & v)");
        else        $error  ("[FAIL] %0d mismatches.", mis);

        #10; $finish;
    end

endmodule

`default_nettype wire
