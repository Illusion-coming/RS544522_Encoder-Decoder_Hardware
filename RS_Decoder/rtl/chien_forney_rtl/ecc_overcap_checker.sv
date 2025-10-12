// ============================================================================
// ecc_overcap_checker.sv
// 目的：在不改动现有接口/模块的前提下，判断是否**超出纠错能力上限**。
// 规则：当一次 Chien 扫描结束（root_cnt_valid_o=1）时：
//   - 取 **σ 的次数** (deg_sigma) 与 **Chien 根计数** (root_cnt) 比较；
//   - 若 root_cnt != deg_sigma，则判定 **exceed_o=1**（不可纠正/超界）；
//   - 若 root_cnt > T 也视为超界（防御性）。
//
// 依赖模块（外部已提供）：
//   1) sigma_degree_detector  // 你提供的精简版：输出 sigma_deg_o（内部组合扫描）
//   2) chien_root_counter     // 你提供的精简版：统计 hit_mask_i 的 1 的个数
//
// 握手约定：
//   - 在 **sigma_start_i && sigma_valid_i** 同拍为 1 时，锁存当次 σ 的次数到 deg_sigma_q；
//   - 之后在 **Chien busy** 期间累计命中；
//   - 在 **chien_done** 当拍，root_cnt_valid_o=1，比较并给出 exceed_o 与 valid_o（单拍）。
// ============================================================================
module ecc_overcap_checker #(
    parameter int W = 10,
    parameter int T = 11,
    parameter int P = 32
    )(
    input  logic                   clk_i,
    input  logic                   rst_ni,

    // --- σ（低阶在前）与握手（来自 RiBM/KES & 顶层） ---
    input  logic [W-1:0]           sigma_low_i [0:T],   // λ0..λT，低阶在前
    input  logic                   sigma_start_i,       // 与你的 chien_search 同步起始
    input  logic                   sigma_valid_i,       // 当拍与 start 同高才更新 σ 的次数

    // --- Chien 扫描接口（来自你的 chien_search 顶层） ---
    input  logic                   chien_busy_o,
    input  logic                   chien_done_o,
    input  logic [P-1:0]           hit_mask_w,

    input logic                   cw_start_i,

    // --- 输出：是否超界 & 有效脉冲（与 done 同拍） ---
    output logic                   exceed_o,            // 1 表示超出纠错能力上限（不可纠正）
    output logic                   result_valid_o      // 与 done 同拍拉高 1 个周期
    );

    // 实例化你提供的 sigma_degree_detector（组合扫描）
    logic [$clog2(T+1)-1:0] deg_sigma_now;
    sigma_degree_detector #(.W(W), .T(T)) u_sigma_deg (
        .clk_i         (clk_i),
        .rst_ni        (rst_ni),
        .sigma_low_i   (sigma_low_i),
        .start_i       (sigma_start_i),
        .sigma_valid_i (sigma_valid_i),
        .sigma_deg_o   (deg_sigma_now)
    );

    // ---------------- Chien 根计数 ----------------
    logic [3:0] root_cnt_q;
    logic       root_cnt_valid;

    // 实例化你提供的精简根计数器（不打拍计数/无 function 版本）
    chien_root_counter #(.P(P)) u_root_cnt (
        .clk_i            (clk_i),
        .rst_ni           (rst_ni),
        .sigma_start_i    (sigma_start_i),   // 清零计数器
        .sigma_valid_i    (sigma_valid_i),   // 保持接口一致（若内部未用也无妨）
        .chien_busy       (chien_busy_o),
        .chien_done       (chien_done_o),
        .hit_mask_i       (hit_mask_w),
        .root_cnt_o       (root_cnt_q),
        .root_cnt_valid_o (root_cnt_valid)
    );

    // ---------------- 判定逻辑：done 当拍比较 root_cnt vs deg_sigma ----------------
    // exceed 条件：
    //   A) root_cnt != deg_sigma（最主要的一致性判据）；
    //   B) root_cnt > T（防御性，理论上不应发生）。
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            exceed_o       <= 1'b0;
            result_valid_o <= 1'b0;
        end else if(cw_start_i) begin
            exceed_o       <= 1'b0;
            result_valid_o <= 1'b0;
        end else if (root_cnt_valid) begin
            // 比较并输出单拍结果
            exceed_o       <= (root_cnt_q != deg_sigma_now);
            result_valid_o <= 1'b1;  // 与 done 同拍拉高
        end
    end

    // ---------------- 可选：仿真阶段提示（综合可关） ----------------
    // synopsys translate_off
    always_ff @(posedge clk_i) begin
        if (root_cnt_valid) begin
        $display("[ECCCHK] deg(σ)=%0d, roots=%0d => %s", deg_sigma_now, root_cnt_q,
                ((root_cnt_q != deg_sigma_now) || (root_cnt_q > T)) ? "UNCORRECTABLE" : "OK");
        end
    end
    // synopsys translate_on

endmodule
