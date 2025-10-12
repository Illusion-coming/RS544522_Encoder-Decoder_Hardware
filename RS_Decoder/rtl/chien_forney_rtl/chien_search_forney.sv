//------------------------------------------------------------------------------
// chien_search_forney.sv — 一体化顶层：Chien 搜索 + Forney（三拍）
//  · 端口名按用户最新定义
//  · 新增 DEBUG_EN 参数：导出 Chien 的批量结果，便于 TB 对照
//  · S2 逆元表路径可通过 MEM_PATH 配置（默认 ../rtl/gf1024_inv_table.mem）
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module chien_search_forney #(
    // ---------------- 通用参数 ----------------
    parameter int W   = 10,
    parameter int T   = 11,
    parameter int P   = 32,
    parameter int N   = 1023,
    parameter int n   = 544,
    localparam int U_LEN  = T+1,
    localparam int POS_W  = $clog2(N),
    // forney_control 内部 FIFO 深度（可按需覆写）
    parameter int LANE_FIFO_AW = 4,
    parameter int EVT_FIFO_AW  = 4,
    // S2 逆元表文件路径
    parameter string MEM_PATH   = "../rtl/chien_forney_rtl/gf1024_inv_table.mem",
    // Debug 开关（1：导出 Chien 批量结果）
    parameter bit DEBUG_EN      = 1'b0
    ) (
    input  logic                         clk_i,
    input  logic                         rst_ni,
    input  logic                         flush_i,

    // ---------------- RiBM → （Chien + Forney.S1） ----------------
    // σ 低阶在前：sigma_low_i[k] = σ_k, k=0..T
    input  logic [W-1:0]                 sigma_low_i [0:T],
    input  logic                         sigma_valid_i,  // 供 Chien 装载 σ
    // v（低阶在前，长度 T）与装载脉冲（仅 Forney.S1 使用）
    input  logic [W-1:0]                 v_bus_i     [0:T-1],
    input  logic                         ribm_valid_i,

    // ---------------- Chien 扫描控制 ----------------
    input  logic                         chien_start_i,
    output logic                         chien_busy_o,
    output logic                         chien_done_o,

    // ---------------- Forney 输出（到上游收集器/S3） ----------------
    input  logic                         forney_s3_rdy_i,
    output logic                         forney_vld_o,
    output logic [POS_W-1:0]             forney_pos_o,
    output logic [W-1:0]                 forney_y_o,
    output logic                         forney_den_zero_o,

    // --- 输出：是否超界 & 有效脉冲（与 done 同拍） ---
    output logic                         exceed_o,            // 1 表示超出纠错能力上限（不可纠正）
    output logic                         ecc_valid_o,      // 与 done 同拍拉高 1 个周期

    // 生成recorrect_done_o信号表明当前码字的错误值恢复完成
    input  logic                          cw_start_i,     //syndrome阶段码字输入
    output logic                          recorrect_done_o,

    // ---------------- Debug（可选导出 Chien 批量结果） ----------------
    output logic [P-1:0]                 chien_dbg_hit_mask_o,
    output logic [POS_W-1:0]             chien_dbg_pos_bus_o [0:P-1],
    output logic [W-1:0]                 chien_dbg_u_vec_o   [0:P-1][0:U_LEN-1]
    );

    // ---------------------------------------------------------------------------
    // 1) Chien 搜索：产生批量命中与每 lane 的 {pos, u^0..u^T}
    // ---------------------------------------------------------------------------
    logic [P-1:0]                      hit_mask_w;               // [P-1:0]
    logic [W-1:0]                      u_vec_bus_w   [0:P-1][0:U_LEN-1];
    logic [POS_W-1:0]                  pos_bus_w     [0:P-1];

    chien_search #(
        .W (W), .T (T), .P (P), .N (N), .n (n)
    ) u_chien (
        .clk_i         (clk_i),
        .rst_ni        (rst_ni),
        // RiBM: σ（低阶在前）与 Chien 控制
        .sigma_low_i   (sigma_low_i),
        .sigma_valid_i (sigma_valid_i),
        .start_i       (chien_start_i),
        .busy_o        (chien_busy_o),
        .done_o        (chien_done_o),
        // 批量输出（与 P lanes 对齐）
        .hit_mask_o    (hit_mask_w),
        .u_vec_o       (u_vec_bus_w),   // [0:P-1][0:T]
        .pos_bus_o     (pos_bus_w)
    );

    // Debug 导出：按 DEBUG_EN 选择真实信号或 0
    genvar di, dj;
    generate
        if (DEBUG_EN) begin : GEN_DBG_ON
        assign chien_dbg_hit_mask_o = hit_mask_w;
        for (di = 0; di < P; di++) begin : GEN_DBG_POS
            assign chien_dbg_pos_bus_o[di] = pos_bus_w[di];
            for (dj = 0; dj < U_LEN; dj++) begin : GEN_DBG_U
            assign chien_dbg_u_vec_o[di][dj] = u_vec_bus_w[di][dj];
            end
        end
        end else begin : GEN_DBG_OFF
        assign chien_dbg_hit_mask_o = '0;
        for (di = 0; di < P; di++) begin : GEN_DBG_POS0
            assign chien_dbg_pos_bus_o[di] = '0;
            for (dj = 0; dj < U_LEN; dj++) begin : GEN_DBG_U0
            assign chien_dbg_u_vec_o[di][dj] = '0;
            end
        end
        end
    endgenerate

    // ---------------------------------------------------------------------------
    // 2) Forney 顶层封装：S0(forney_control) + S1 + S2
    //     直接将 Chien 的批量结果作为 S0 的输入（方向保持 [P-1:0]）
    // ---------------------------------------------------------------------------
    forney #(
        .LANES        (P),
        .W            (W),
        .T            (T),
        .U_LEN        (U_LEN),
        .POS_W        (POS_W),
        .LANE_FIFO_AW (LANE_FIFO_AW),
        .EVT_FIFO_AW  (EVT_FIFO_AW),
        .MEM_PATH     (MEM_PATH)
    ) u_forney (
        .clk_i       (clk_i),
        .rst_ni      (rst_ni),
        .flush_i     (flush_i),
        // 来自 Chien 的批量信号（每拍至多 P 个 payload）
        .hit_mask_i  (hit_mask_w),
        .pos_bus_i   (pos_bus_w),
        .u_vec_bus_i (u_vec_bus_w),
        // RiBM → S1 的配置（与 Chien 复用 σ）
        .ribm_valid_i (ribm_valid_i),
        .sigma_bus_i  (sigma_low_i),     // 低阶在前：sigma[0..T]
        .v_bus_i      (v_bus_i),         // 低阶在前：v[0..T-1]
        // 下游握手与输出
        .s3_rdy_i     (forney_s3_rdy_i),
        .vld_o        (forney_vld_o),
        .pos_o        (forney_pos_o),
        .y_o          (forney_y_o),
        .den_zero_o   (forney_den_zero_o),
        .cw_start_i   (cw_start_i),
        .chien_done_o (chien_done_o),
        .recorrect_done_o(recorrect_done_o)
    );

    // ---------------------------------------------------------------------------
    //  ecc_overcap_checker 判断是否超出纠错能力上限
    // ---------------------------------------------------------------------------

    ecc_overcap_checker #(
        .W(W), 
        .T(T), 
        .P(P)
    ) u_eccchk (
        .clk_i(clk_i), 
        .rst_ni(rst_ni),
        .sigma_low_i(sigma_low_i),
        .sigma_start_i(chien_start_i), 
        .sigma_valid_i(sigma_valid_i),
        .chien_busy_o(chien_busy_o), 
        .chien_done_o(chien_done_o),
        .hit_mask_w(hit_mask_w),
        .cw_start_i(cw_start_i),
        .exceed_o(exceed_o), 
        .result_valid_o(ecc_valid_o)
    );


endmodule
