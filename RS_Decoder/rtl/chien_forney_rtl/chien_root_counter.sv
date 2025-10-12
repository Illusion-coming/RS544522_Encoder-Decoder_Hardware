// -----------------------------------------------------------------------------
// chien_root_counter_simple.sv
// 需求：
// - 不做内部拍计数；
// - start_i 清零；
// - chien_busy 期间每拍累加 hit_mask_i 的 1 的个数；
// - 最后一拍（done_i=1）拉高 root_cnt_valid_o 一个周期；
// - 避免使用 function（直接在 always_comb 里 for 循环求和）；
// - 假设尾拍多余的 lanes 在上游已置 0（否则会被计入）。
// -----------------------------------------------------------------------------
module chien_root_counter #(
    parameter int P = 32                 // 并行度（每拍 lanes）
    )(
    input  logic                 clk_i,
    input  logic                 rst_ni,
    // 控制（来自钱搜索）
    input  logic                 sigma_start_i,   // 起始：清零计数器
    input  logic                 sigma_valid_i,   // 起始：清零计数器
    input  logic                 chien_busy,    // 扫描进行中
    input  logic                 chien_done,    // 最后一拍指示（与 chien_busy 同拍有效）
    // 每拍命中位图（来自钱搜索）
    input  logic [P-1:0]         hit_mask_i,
    // 输出：根总数与有效脉冲（仅在 chien_done 当拍为 1 个周期）
    output logic [3:0]           root_cnt_o,
    output logic                 root_cnt_valid_o
    );
    // 最多找到11个根
    localparam n = 11;

    // ---------------- 组合：每拍命中数（popcount），避免使用 function ----------------
    logic [$clog2(P+1)-1:0] addend_c;  // 本拍命中数（0..P）
    always @(*) begin
        addend_c = '0;
        for (int i = 0; i < P; i++) begin
            addend_c = addend_c + hit_mask_i[i];
        end
    end

    // ---------------- 时序：start 清零；busy 期间累加；done 当拍拉高 valid ----------------
    logic [3 : 0] root_cnt_q;
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            root_cnt_q       <= '0;
            root_cnt_valid_o <= 1'b0;
        end else begin
        if (sigma_start_i && sigma_valid_i) begin
            root_cnt_q       <= '0;
            root_cnt_valid_o <= 1'b0;
        end else if (chien_busy) begin
            root_cnt_q       <= root_cnt_q + addend_c;
            root_cnt_valid_o <= chien_done;           // 仅在最后一拍给一个脉冲
        end else begin
            root_cnt_valid_o <= 1'b0;
        end
        end
    end

    assign root_cnt_o = root_cnt_q;

    // ---------------- 可选：仿真期一致性提示（综合可关） ----------------
    // synopsys translate_off
    always @(posedge clk_i) begin
        if (chien_done && !chien_busy) begin
            $warning("[chien_root_counter] chien_done 高但 chien_busy 低（协议不一致）");
        end
        if (root_cnt_valid_o && (root_cnt_q > n)) begin
            $warning("[chien_root_counter] root_cnt_o=%0d 超过 n=%0d（输入尾拍掩码可能未屏蔽）", root_cnt_q, n);
        end
    end
    // synopsys translate_on

endmodule

// ---------------- 使用示例 ----------------
// chien_root_counter #(.P(32), .n(544)) u_root_cnt (
//   .clk_i            (clk_i),
//   .rst_ni           (rst_ni),
//   .start_i          (start_i),    // 钱搜索 start
//   .chien_busy           (busy_o),     // 钱搜索 busy
//   .chien_done           (done_o),     // 钱搜索 done
//   .hit_mask_i       (hit_mask_o), // 每拍命中位图
//   .root_cnt_o       (root_cnt_o),
//   .root_cnt_valid_o (root_cnt_valid_o)
// );
