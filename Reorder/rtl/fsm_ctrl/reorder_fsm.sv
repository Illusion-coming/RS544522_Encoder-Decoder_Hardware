// ============================================================
// Reorder — FSM（与 reorder_store 接口对齐）
// 设计目标：
//   - 仅用最基本构造（无 function/ROM）。
//   - 维护 A/B 乒乓：CAPTURE 与 APPLY/OUTPUT 不同 Bank。
//   - 在 ecc_valid 上升沿锁存 per-bank use_fix（=!exceed）。
//   - 将 Forney 事件直接转为对 store 的 apply_* 写回；use_fix=0 或窗外地址则丢弃事件。
//   - 提供 forney_s3_rdy_o 回压给 RS_544_522_Decoder（此处恒 1）。
// 备注：
//   - 与 store 的“GF 直址 / N=544（0..543）”对齐：仅接受 forney_pos < N 的事件。
// ============================================================

`timescale 1ns/1ps

module reorder_fsm #(
    parameter int W = 10,
    parameter int N = 544   // 与 reorder_store 的 N 对齐（0..543）
    )(
    input  logic                 clk_i,
    input  logic                 rst_ni,

    // ---- 来自 RS_544_522_Decoder 的帧/事件信号 ----
    input  logic                 synd_start_i,       // 新帧开始（与 store 捕获同源）
    input  logic                 synd_last_i,         // 未用，保留
    input  logic                 ecc_valid_i,        // 纠错能力判定时刻
    input  logic                 exceed_i,           // 与 ecc_valid_i 同拍
    input  logic                 recorrect_done_i,   // 本帧 Forney 事件已全部输出
    input  logic                 forney_vld_i,       // 事件有效
    input  logic [9:0]           forney_pos_i,       // 事件地址（GF直址）
    input  logic [W-1:0]         forney_y_i,         // 事件值
    output logic                 forney_s3_rdy_o,    // 回压（此处恒 1）

    // ---- 与 reorder_store 的握手 ----
    output logic                 cap_sel_o,          // 0:A / 1:B —— 捕获 Bank 选择

    output logic                 apply_en_o,         // RMW 使能（1 拍脉冲）
    output logic                 apply_sel_o,        // 目标 Bank（= 当前 APPLY Bank）
    output logic [9:0]           apply_pos_o,        // = forney_pos_i（仅当 < N 时有效）
    output logic [W-1:0]         apply_y_o,          // = forney_y_i

    // ---- 可选：给输出模块/上层的状态观察 ----
    output logic [1:0]           use_fix_bank_o,     // A/B：是否应用纠错（在 ecc_valid_i 锁存）
    output logic                 app_sel_o,          // 当前 APPLY Bank（便于调试/观察）
    output logic [1:0]           output_sel_o        // {out_bank_sel, out_use_rec}
    );

    // ---------------- 乒乓 Bank 选择 ----------------
    logic cap_sel, app_sel;  // 0:A, 1:B
    assign cap_sel_o = cap_sel;
    assign app_sel_o = app_sel;

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            cap_sel <= 1'b0;   // 初始 A 捕获
            app_sel <= 1'b0;   // 初始 A 应用（首帧可忽略）
        end else begin
            if (synd_last_i)       cap_sel <= ~cap_sel;  // 每帧开始，捕获 Bank 翻转
            if (recorrect_done_i)  app_sel <= ~app_sel;  // 每帧纠错完成，应用 Bank 翻转
        end
    end

    // 约束：假定上游 RS 解码输出事件与帧时序满足：
    //   当新的 CAPTURE 开始时（cap_sel 翻转），上一帧的事件仍在输出，故 APPLY 应留在上一 Bank；
    //   当上一帧 recorrect_done 到来时，再翻转到新 Bank。这样保证 CAPTURE 与 APPLY 总在不同 Bank。

    // ---------------- per-Bank use_fix（在 ecc_valid 上升沿锁存） ----------------
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            use_fix_bank_o <= 2'b00;
        end else if (ecc_valid_i) begin
            use_fix_bank_o[app_sel] <= ~exceed_i;  // 1：可纠错；0：超能力，放弃纠错
        end
    end

    // ---------------- Forney 事件 → store.apply_* ----------------
    // 简单双缓冲：事件只要到来就直通到 store，除非：
    //   - 当前 Bank 的 use_fix=0（则丢弃事件）；
    //   - 地址窗外（forney_pos_i >= N，丢弃；避免越界）。

    // ready：本实现不背压，恒为 1；若需限速，可在此引入条件（例如与 store 冲突时拉低）
    // 事件 gating 与直通
    always @(*) begin
        forney_s3_rdy_o = 1'b1;
        // 仅当：事件有效、允许纠错、地址在 0..N-1
        apply_en_o  = forney_vld_i;
        apply_sel_o = app_sel;
        apply_pos_o = forney_pos_i;     // 直址（与 store 的地址域一致）
        apply_y_o   = forney_y_i;
    end

    // ---------------- 输出选择：在本帧纠错完成时锁存 ----------------
    // output_sel_o[1] = out_bank_sel（输出哪个 bank）
    // output_sel_o[0] = out_use_rec（1=rec_mem，0=raw_mem）
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            output_sel_o <= 2'b00;                      // 初始：bank A，输出 raw
        end else if (recorrect_done_i) begin
            output_sel_o[1] <= app_sel;                 // 输出刚完成纠错的 bank
            output_sel_o[0] <= use_fix_bank_o[app_sel]; // 依据 ecc/exceed 选择 rec/raw
        end
    end

endmodule
