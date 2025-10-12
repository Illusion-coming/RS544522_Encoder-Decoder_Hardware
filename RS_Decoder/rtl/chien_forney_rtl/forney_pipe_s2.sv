//------------------------------------------------------------------------------
// forney_pipe_s2_split_handshake.sv
// S2 split into two micro-stages with an INTERNAL valid/ready handshake:
//   - S2a: synchronous inverse ROM lookup (addr=den_i) + one multiply pre=num*phase
//           • has its own output vld/rdy towards S2b
//   - S2b: multiply by inverse: y = pre * inv(den)
// External handshake remains S1<->S2 (s1_vld_i/s1_rdy_o) and S2<->S3 (s2_vld_o/s3_rdy_i).
// ROM indexing is identical to gen_gf1024_inv_table.py: address=a (10b poly-basis), data=a^{-1}.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

//------------------------------------------------------------------------------
// Inverse table ROM (1K×10b), synchronous 1-cycle read
//------------------------------------------------------------------------------
module gf1024_inv_rom_w #(
  parameter int W = 10,
  parameter string MEM_PATH = "../rtl/gf1024_inv_table.mem"
) (
  input  logic         clk_i,
  input  logic         rst_ni,
  input  logic [W-1:0] a_i,   // address = element a (10b)
  output logic [W-1:0] q_o    // q_o = inv(a); convention: inv(0)=0
);
  logic [W-1:0] rom [0:(1<<W)-1];
  initial begin
    $readmemh(MEM_PATH, rom);
  end
//   always @(posedge clk_i or negedge rst_ni) begin
//     if(!rst_ni) begin
//         q_o <= 'b0;
//     end else begin
//         q_o <= rom[a_i];
//     end
//   end

    assign q_o  = rom[a_i];
endmodule



//------------------------------------------------------------------------------
// Top: S2 with split micro-stages and INTERNAL handshake between S2a and S2b
//   - Provides true decoupling: S2a has its own vld/rdy towards S2b
//   - Accepts a new input when its internal 2-entry buffer (S2a in/out) is not full
//------------------------------------------------------------------------------
module forney_pipe_s2 #(
    parameter int W        = 10,
    parameter int POS_W    = 10,
    parameter string MEM_PATH = "../rtl/gf1024_inv_table.mem"
        ) (
    input  logic                   clk_i,
    input  logic                   rst_ni,

    // From S1
    input  logic                   s1_vld_i,
    output logic                   s1_rdy_o,
    input  logic [POS_W-1:0]       pos_i,
    input  logic [W-1:0]           num_i,
    input  logic [W-1:0]           den_i,
    input  logic [W-1:0]           phase_i,    

    // recorrect_done_o信号传递
    input  logic                     s1_recorrect_done_o,
    output logic                     s2_recorrect_done_o,

    // To downstream (S3 or collector)
    output logic                   s2_vld_o,
    input  logic                   s3_rdy_i,
    output logic [POS_W-1:0]       pos_o,
    output logic [W-1:0]           y_o,
    output logic                   den_zero_o
    );
    // ---------------------------------------------------------------------------
    // Internal S2a ↔ S2b handshake
    // ---------------------------------------------------------------------------
    logic        s2a_vld_o;   // S2a has a valid packet (pos/pre/denz/inv)
    logic        s2a_rdy_i;   // S2b ready to accept from S2a
    

    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            s2a_rdy_i <= 'b0;
        end else begin
            s2a_rdy_i <= s3_rdy_i;
        end
    end

    // ---------------------------------------------------------------------------
    // ROM: inverse lookup (sync 1-cycle)
    // ---------------------------------------------------------------------------
    logic [W-1:0] inv_q;      // ROM output of inv(den) (valid 1 cycle after address)
    gf1024_inv_rom_w #(.W(W), .MEM_PATH(MEM_PATH)) u_inv_rom (
        .clk_i (clk_i),
        .rst_ni (rst_ni),
        .a_i   (den_i),
        .q_o   (inv_q)
    );

    // ---------------------------------------------------------------------------
    // S2a: compute pre=num*phase; pair with inv(den) when it arrives; 2-deep elastic
    //       buffer (in_reg + out_reg) with proper alignment to the sync ROM
    // ---------------------------------------------------------------------------
    // pre = num*phase (combinational, captured on accept)
    logic [W-1:0] pre_mul;
    gf1024_mul_w #(.W(W)) u_mul_pre (
        .a (num_i),
        .b (phase_i),
        .p (pre_mul)
    );

    logic [POS_W-1:0]       s2a_pos;
    logic [W-1:0]           s2a_mul;
    logic [W-1:0]           s2a_inv;

    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            s2a_pos <= 'b0;
            s2a_mul <= 'b0;
            s2a_inv <= 'b0;
        end else if(s1_vld_i) begin
            s2a_pos <= pos_i;
            s2a_mul <= pre_mul;
            s2a_inv <= inv_q;
        end
    end

    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            s2a_vld_o <= 'b0;
        end else begin
            s2a_vld_o <= s1_vld_i;
        end
    end

    

    // ---------------------------------------------------------------------------
    // S2b: multiply by inverse, gate zero-den case, register outputs to S3
    // ---------------------------------------------------------------------------
    logic fire_b;
    assign fire_b = s2a_vld_o & s2a_rdy_i;   // S2a→S2b transfer

    logic [W-1:0] s2b_mul;                       // y = pre * inv(den)
    gf1024_mul_w #(.W(W)) u_mul_inv (
        .a (s2a_mul),
        .b (s2a_inv),
        .p (s2b_mul)
    );

    // Output regs (one-cycle)
    logic [POS_W-1:0] pos_q;
    logic [W-1:0]     y_q;
    logic             denz_q;
    logic             vld_q;

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            pos_q  <= '0;
            y_q    <= '0;
            denz_q <= 1'b0;
            vld_q  <= 1'b0;
        end else begin
            vld_q  <= fire_b;                // one-per-accept
            pos_q  <= s2a_pos;
            denz_q <= (s2a_inv == 0);
            y_q    <= (s2a_inv == 0) ? '0 : s2b_mul;   // force 0 if σ'(u)==0
        end
    end

    logic                     s2a_recorrect_done_o;
    logic                     s2b_recorrect_done_o;

    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            s2a_recorrect_done_o <= 'b1;
            s2b_recorrect_done_o <= 'b1;
        end else begin
            s2a_recorrect_done_o <= s1_recorrect_done_o;
            s2b_recorrect_done_o <= s2a_recorrect_done_o;
        end
    end
    
    assign s2_recorrect_done_o = s2b_recorrect_done_o;

    // External outputs
    assign pos_o      = pos_q;
    assign y_o        = y_q;
    assign den_zero_o = denz_q;
    assign s2_vld_o   = vld_q;
    assign s1_rdy_o   = s3_rdy_i;
endmodule
