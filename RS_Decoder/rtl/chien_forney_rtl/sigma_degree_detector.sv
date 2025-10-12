// -----------------------------------------------------------------------------
// sigma_degree_detector.sv
// 适配你的 chien_search 顶层接口：
//   - 输入：sigma_low_i[0:T]（低阶在前）, start_i, sigma_valid_i
//   - 输出：sigma_deg_o（σ 次数）, sigma_deg_valid_o（一次脉冲）
// 约定：只有当 start_i && sigma_valid_i 同周期为 1 时，更新 σ 的次数并拉高 valid。
// 说明：直接对低阶在前的系数做“最高非零系数优先编码”，得到 deg(σ)。
// -----------------------------------------------------------------------------
module sigma_degree_detector #(
    parameter int W = 10,   // GF 元位宽（GF(2^10) -> 10）
    parameter int T = 11    // 最大支持次数（σ_low[0..T]）
    )(
    input  logic                    clk_i,
    input  logic                    rst_ni,
    // 低阶在前：λ0..λT
    input  logic [W-1:0]            sigma_low_i [0:T],
    // 与钱搜索一致的握手：仅当两者同周期为 1 才更新次数
    input  logic                    start_i,
    input  logic                    sigma_valid_i,
    // 输出：σ 的次数（0..T）与有效脉冲（1 个 clk 宽）
    output logic [$clog2(T+1)-1:0]  sigma_deg_o
    );

    // ---------------- 组合：最高非零系数优先编码 ----------------
    logic [T:0] nz_mask;  // 每项是否非零（任意一位为 1 即非零）
    logic [$clog2(T+1)-1:0] deg_scan_c;
    logic found_c;

    always @(*) begin
        // 非零掩码
        for (int i = 0; i <= T; i++) begin
            nz_mask[i] = |sigma_low_i[i];
        end
    end

    always @(*) begin
        // 自高到低找第一个非零项的索引
        found_c    = 1'b0;
        deg_scan_c = '0;
        for (int i = T; i >= 0; i--) begin
            if (!found_c && nz_mask[i]) begin
                deg_scan_c = i[$clog2(T+1)-1:0];
                found_c    = 1'b1;
            end
        end
    end

    // ---------------- 时序：握手触发更新（同周期 start & valid 才更新） ----------------
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            sigma_deg_o        <= '0;
        end else if (start_i && sigma_valid_i) begin
            sigma_deg_o        <= deg_scan_c;
        end
    end

    // ---------------- 可选：仿真期提示（综合可关） ----------------
    // synopsys translate_off
    // λ0 理论上应非零（BM 初始化为 1），若为 0 提示检查 KES 实现/归一化
    always @(posedge clk_i) begin
        if (start_i && sigma_valid_i) begin
            if (~|sigma_low_i[0]) begin
                $display("[sigma_degree_detector] WARN: λ0 == 0（异常或未归一化）");
            end
        end
    end
    // synopsys translate_on

endmodule

// ---------------- 使用示例（嵌在你的 chien_search 顶层内） ----------------
// sigma_degree_detector #(.W(W), .T(T)) u_sigma_deg (
//   .clk_i            (clk_i),
//   .rst_ni           (rst_ni),
//   .sigma_low_i      (sigma_low_i),
//   .start_i          (start_i),
//   .sigma_valid_i    (sigma_valid_i),
//   .sigma_deg_o      (sigma_deg_o)          // 你可以把它接进日志/门限判据
// );
