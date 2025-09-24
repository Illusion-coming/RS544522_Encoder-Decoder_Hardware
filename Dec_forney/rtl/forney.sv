//------------------------------------------------------------------------------
// forney.sv — Top-level wrapper
// 三级流水封装：
//   S0: forney_control      — 从 Chien 采集命中，输出 {pos, u_vec (u^T..u^0)}
//   S1: forney_pipe_s1      — 计算 {num=v(u), den=σ'(u), phase=(u^11)^2}
//   S2: forney_pipe_s2      — 查表逆元 + 两次乘法，输出误差幅度 y
// 注：S0→S1 的 u_vec 需要 **反序** 到 u^0..u^T，以匹配 S1 既定索引约定。
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module forney #(
    // ---- Shared / S0 params ----
    parameter int LANES        = 32,
    parameter int W            = 10,
    parameter int T            = 11,
    parameter int U_LEN        = T+1,
    parameter int POS_W        = 10,
    parameter int LANE_FIFO_AW = 4,
    parameter int EVT_FIFO_AW  = 4,
    // ---- S2 ROM file path ----
    parameter string MEM_PATH  = "../rtl/gf1024_inv_table.mem"
    ) (
    input  logic                         clk_i,
    input  logic                         rst_ni,
    input  logic                         flush_i,

    // ---------------- Chien inputs (batch per cycle) ----------------
    input  logic [LANES-1:0]                    hit_mask_i,
    input  logic [POS_W-1:0]                    pos_bus_i [0:LANES-1],
    // per-lane u^0..u^T（来自 Chien）
    input  logic [W-1:0]                        u_vec_bus_i[0:LANES-1][0:U_LEN-1],

    // ---------------- RiBM outputs → S1 配置 ----------------
    input  logic                          ribm_valid_i,           // 一拍装载 sigma/v
    input  logic [W-1:0]                  sigma_bus_i[0:T],            // sigma_0..sigma_T
    input  logic [W-1:0]                  v_bus_i[0:T-1],                // v_0..v_{T-1}

    // ---------------- Downstream handshake ----------------
    input  logic                          s3_rdy_i,

    // ---------------- Final outputs ----------------
    output logic                          vld_o,                  // = S2 s2_vld_o
    output logic [POS_W-1:0]              pos_o,
    output logic [W-1:0]                  y_o,
    output logic                          den_zero_o
    );

    // ---------------------------------------------------------------------------
    // S0: forney_control
    // ---------------------------------------------------------------------------
    logic                    s0_vld;
    logic                    s0_rdy;     // to S0 (as s1_rdy_i)
    logic [POS_W-1:0]        pos_s0;
    // 注意：S0 输出 u_vec_s0 的顺序为 **u^T..u^0**（高位在前）
    logic [W-1:0]           u_vec_s0[0:U_LEN-1];

    forney_control #(
        .LANES        (LANES),
        .W            (W),
        .T            (T),
        .U_LEN        (U_LEN),
        .POS_W        (POS_W),
        .LANE_FIFO_AW (LANE_FIFO_AW),
        .EVT_FIFO_AW  (EVT_FIFO_AW)
        ) u_s0 (
        .clk_i      (clk_i),
        .rst_ni     (rst_ni),
        .flush_i    (flush_i),
        .hit_mask_i (hit_mask_i),
        .pos_bus_i  (pos_bus_i),
        .u_vec_i    (u_vec_bus_i),
        // handshake to S1
        .s1_rdy_i   (s0_rdy),
        .vld_o      (s0_vld),
        .pos_o      (pos_s0),
        .u_vec_o    (u_vec_s0)     // u^T..u^0
    );

    // ---------------------------------------------------------------------------
    // S1: forney_pipe_s1
    // ---------------------------------------------------------------------------
    logic                    s1_vld;
    logic                    s2_rdy;      // from S2 towards S1
    logic [POS_W-1:0]        pos_s1;
    logic [W-1:0]            num_s1, den_s1, phase_s1;

    forney_pipe_s1 #(
        .W     (W),
        .T     (T),
        .U_LEN (U_LEN)
    ) u_s1 (
        .clk_i        (clk_i),
        .rst_ni       (rst_ni),
        // S0 → S1
        .s0_vld_i     (s0_vld),
        .s0_rdy_o     (s0_rdy),
        .pos_i        (pos_s0),
        .u_vec_i      (u_vec_s0),   // u^T..u^0
        // RiBM config
        .ribm_valid_i (ribm_valid_i),
        .sigma_bus_i  (sigma_bus_i),
        .v_bus_i      (v_bus_i),
        // S1 → S2
        .s1_vld_o     (s1_vld),
        .s2_rdy_i     (s2_rdy),
        .pos_o        (pos_s1),
        .num_o        (num_s1),
        .den_o        (den_s1),
        .phase_o      (phase_s1)
    );

    // ---------------------------------------------------------------------------
    // S2: forney_pipe_s2（两拍，ROM 查表 + 逆元乘法）
    // ---------------------------------------------------------------------------
    forney_pipe_s2 #(
        .W        (W),
        .POS_W    (POS_W),
        .MEM_PATH (MEM_PATH)
    ) u_s2 (
        .clk_i     (clk_i),
        .rst_ni    (rst_ni),
        // From S1
        .s1_vld_i  (s1_vld),
        .s1_rdy_o  (s2_rdy),
        .pos_i     (pos_s1),
        .num_i     (num_s1),
        .den_i     (den_s1),
        .phase_i   (phase_s1),
        // To S3
        .s2_vld_o  (vld_o),
        .s3_rdy_i  (s3_rdy_i),
        .pos_o     (pos_o),
        .y_o       (y_o),
        .den_zero_o(den_zero_o)
    );

endmodule
