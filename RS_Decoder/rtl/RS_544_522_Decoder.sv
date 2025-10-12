//------------------------------------------------------------------------------
// RS544_522_Decoder.sv
// 将 3 个子模块按数据通道内连、控制口外露的方式组合：
//   1) syndrome_lal32  →  RIBM:  s_o  →  syn_i    （内部数据连线）
//   2) RIBM → Chien+Forney:  σ / v  →  sigma_low_i / v_bus_i （内部数据连线）
// 其余“控制信号”均在本顶层向外暴露。
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module RS_544_522_Decoder #(
    // RS(544,522) 缺省参数
    parameter int W   = 10,
    parameter int T   = 11,
    parameter int P   = 32,
    parameter int N   = 1023,
    parameter int n   = 544,
    // syndrome 参数
    parameter int M   = 32,                // 每拍 32 个 10-bit 符号
    parameter int J   = 2*T,               // 输出校正子个数（=2t）
    // forney 控制内部 FIFO 深度、逆元表路径、调试使能
    parameter int LANE_FIFO_AW = 4,
    parameter int EVT_FIFO_AW  = 4,
    parameter string MEM_PATH  = "../rtl/chien_forney_rtl/gf1024_inv_table.mem",
    parameter bit DEBUG_EN     = 1'b1
    ) (
    // ---------------- 时钟/复位（共享） ----------------
    input  logic                         clk_i,
    input  logic                         rst_ni,

    // ======================== syndrome_lal32 ========================
    // 输入码字并行流
    input  logic                         synd_valid_i,
    input  logic                         synd_start_i,
    input  logic                         synd_last_i,
    input  logic   [W-1:0]               synd_data_i [0:M-1],   // data_i[31]=cw[543] ... data_i[0]=cw[512]
    // syndrome 对外可观察的“帧尾有效”
    output logic                         synd_s_valid_o,

    // ======================== RIBM（外部控制可见） ========================
    output logic                         ribm_busy_o,
    output logic                         ribm_done_o,
    output logic                         ribm_result_valid_o,

    // ======================== Chien + Forney（外部控制/观测） ========================
    input  logic                         forney_s3_rdy_i,

    output logic                         forney_vld_o,
    output logic [$clog2(N)-1:0]         forney_pos_o,
    output logic [W-1:0]                 forney_y_o,
    output logic                         forney_den_zero_o,

    output logic                         exceed_o,
    output logic                         ecc_valid_o,
    output logic                         recorrect_done_o,
    output logic                         chien_busy_o,
    output logic                         chien_done_o,

    // ---------------- Debug 直通（来自 Chien+Forney） ----------------
    output logic [P-1:0]                 chien_dbg_hit_mask_o,
    output logic [$clog2(N)-1:0]         chien_dbg_pos_bus_o [0:P-1],
    output logic [W-1:0]                 chien_dbg_u_vec_o   [0:P-1][0:(T)]
    );

    // ============================================================================
    // 内部连线：仅用于跨模块“数据”传输（不向外暴露）
    // ============================================================================
    // syndrome → RIBM：校正子 s[0..2T]
    logic [W-1:0] syn_bus   [0:2*T];
    logic         ribm_start_i;
    // RIBM → CF：σ、v
    logic [W-1:0] sigma_bus [0:T];
    logic [W-1:0] v_bus     [0:T-1];
    // RIBM 的 ω（当前顶层不使用，但保留连线以便后续扩展/观测）
    logic [W-1:0] omega_bus [0:T-1];
    // input  -> chien&forney
    logic         cw_start_i;
    

    // ============================================================================
    // 内部连线：仅用于跨模块“数据”传输（不向外暴露）
    // ============================================================================
    // RiBM → Chien&forney：校正子 s[0..2T]
    logic                         flush_i;
    logic                         sigma_valid_i;
    logic                         ribm_valid_i;
    logic                         chien_start_i;

    // ============================================================================
    // syndrome_lal32 实例
    // ============================================================================
    // 由于 syndrome_lal32 的 s_o 端口声明为 [J-1:0][W-1:0]，与 RIBM 的 syn_i [0:2T] 维度方向不同，
    // 这里用一个中间向量做“等号连接”，SystemVerilog 允许相同元素个数的不同下标方向拼接。
    logic [W-1:0] s_vec [0:J-1];  // syndrome 原始输出（等价于 s[0..2T]）

    

    syndrome_lal32 #(
        .J(J), .M(M)
    ) u_syndrome (
        .clk_i     (clk_i),
        .rst_ni    (rst_ni),
        .valid_i   (synd_valid_i),
        .start_i   (synd_start_i),
        .last_i    (synd_last_i),
        .data_i    (synd_data_i),
        .s_valid_o (synd_s_valid_o),   // 同时对外可见
        .s_o       (s_vec)
    );

    // s_vec[J-1:0] → syn_bus[0:2T]
    assign      syn_bus[0] = 'b0;
    genvar gk;
    generate
        for (gk=1; gk<= 2*T; gk++) begin : G_SYN_MAP
            assign syn_bus[gk] = s_vec[gk-1];
        end
    endgenerate

    assign ribm_start_i = synd_s_valid_o;

    // ============================================================================
    // RIBM 实例（syn_bus/s_valid 内接；其余控制外露）
    // ============================================================================
    ribm_solver_3t #(
        .T(T), .W(W), .INCLUDE_LAM0_PE(1'b0), .OUTPUT_OMEGA(1'b0), .KW(6)
    ) u_ribm (
        .clk_i          (clk_i),
        .rst_ni         (rst_ni),
        .syn_i          (syn_bus),            // 内部数据
        .syn_valid_i    (synd_s_valid_o),     // 内部控制（帧尾即装载）
        .start_i        (ribm_start_i),       // 对外暴露
        .busy_o         (ribm_busy_o),        // 对外暴露
        .done_o         (ribm_done_o),        // 对外暴露
        .sigma_bus_o    (sigma_bus),          // 内部数据
        .v_bus_o        (v_bus),              // 内部数据
        .omega_bus_o    (omega_bus),          // 内部数据（当前未用）
        .result_valid_o (ribm_result_valid_o) // 对外暴露
    );

    // ============================================================================
    // Chien + Forney 实例（σ / v 内接；所有控制/状态对外）
    // ============================================================================
    assign cw_start_i    = synd_valid_i;
    
    assign flush_i       = ribm_result_valid_o;
    assign sigma_valid_i = ribm_result_valid_o;
    assign ribm_valid_i  = ribm_result_valid_o;
    assign chien_start_i = ribm_result_valid_o;

    chien_search_forney #(
        .W(W), .T(T), .P(P), .N(N), .n(n),
        .LANE_FIFO_AW(LANE_FIFO_AW), .EVT_FIFO_AW(EVT_FIFO_AW),
        .MEM_PATH(MEM_PATH), .DEBUG_EN(DEBUG_EN)
    ) u_cf (
        .clk_i              (clk_i),
        .rst_ni             (rst_ni),
        .flush_i            (flush_i),
        // RIBM → CF（内部数据通道）
        .sigma_low_i        (sigma_bus),
        .sigma_valid_i      (sigma_valid_i),   // 对外供控
        .v_bus_i            (v_bus),
        .ribm_valid_i       (ribm_valid_i),    // 对外供控
        // Chien 控制
        .chien_start_i      (chien_start_i),
        .chien_busy_o       (chien_busy_o),
        .chien_done_o       (chien_done_o),
        // Forney 输出/握手
        .forney_s3_rdy_i    (forney_s3_rdy_i),
        .forney_vld_o       (forney_vld_o),
        .forney_pos_o       (forney_pos_o),
        .forney_y_o         (forney_y_o),
        .forney_den_zero_o  (forney_den_zero_o),
        .exceed_o           (exceed_o),
        .ecc_valid_o        (ecc_valid_o),
        .cw_start_i         (cw_start_i),
        .recorrect_done_o   (recorrect_done_o),
        // Debug 直通
        .chien_dbg_hit_mask_o (chien_dbg_hit_mask_o),
        .chien_dbg_pos_bus_o  (chien_dbg_pos_bus_o),
        .chien_dbg_u_vec_o    (chien_dbg_u_vec_o)
    );

endmodule
