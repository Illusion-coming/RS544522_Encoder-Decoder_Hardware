// forney_pipe_s1.sv
// S1 of 3-stage Forney pipeline (RS(544,522), t=11)
// - Accepts u_vec, sigma, v from S0 / RiBM
// - Computes: num=v(u), den=sigma'(u) with odd terms, phase=(u^11)^2
// - Index convention (RTL fixed):
//   * u_vec_i[k]   == u^k         (k=0..11, high index → high power)
//   * sigma_bus_i[k] == sigma_k   (k=0..11)
//   * v_bus_i[k]   == v_k         (k=0..10)

`timescale 1ns/1ps

// -----------------------------------------------------------------------------
// GF(2^10) multiplier wrapper (polynomial basis)
// -----------------------------------------------------------------------------
module gf1024_mul_w #(parameter int W=10) (
    input  logic [W-1:0] a,
    input  logic [W-1:0] b,
    output logic [W-1:0] p
    );
    // synthesis translate_on
    gf1024_mul_pb_k5_flat u_mul (.A(a[9:0]), .B(b[9:0]), .P(p[9:0]));
endmodule

// -----------------------------------------------------------------------------
// GF(2^10) square wrapper (currently implemented as A*A; can be swapped to a
// dedicated squarer in the future without changing the S1 datapath)
// -----------------------------------------------------------------------------
module gf1024_square_w #(parameter int W=10) (
    input  logic [W-1:0] a,
    output logic [W-1:0] p
    );
    gf1024_mul_pb_k5_flat u_sq (.A(a[9:0]), .B(a[9:0]), .P(p[9:0]));
endmodule

// -----------------------------------------------------------------------------
// Derivative selector: picks odd-degree coefficients from sigma
//  - Inputs:  sigma_bus_i[k] = sigma_k, k=0..11
//  - Outputs: passthrough sigma1 (u^0 term), and 5 mul-coefs {sigma3..sigma11}
// -----------------------------------------------------------------------------
module sigma_deriv_sel #(parameter int W=10) (
    input  logic [W-1:0] sigma_bus_i[0:11],  // sigma_0..sigma_11 (low→high)
    output logic [W-1:0]       sd_passthru,  // = sigma_1 (multiplies u^0==1)
    output logic [W-1:0]  sd_mul_coef[1:5]   // = {sigma_3, sigma_5, sigma_7, sigma_9, sigma_11}
    );
    always_comb begin
        sd_passthru   = sigma_bus_i[1];   // σ1
        sd_mul_coef[1]= sigma_bus_i[3];   // σ3 · u^1
        sd_mul_coef[2]= sigma_bus_i[5];   // σ5 · u^2
        sd_mul_coef[3]= sigma_bus_i[7];   // σ7 · u^3
        sd_mul_coef[4]= sigma_bus_i[9];   // σ9 · u^4
        sd_mul_coef[5]= sigma_bus_i[11];  // σ11· u^5
    end
endmodule

// -----------------------------------------------------------------------------
// Top: S1 pipeline stage
// -----------------------------------------------------------------------------
module forney_pipe_s1 #(
    parameter int W      = 10,
    parameter int T      = 11,
    parameter int U_LEN  = T+1   // 12: u^0..u^11
    )(
    input  logic                     clk_i,
    input  logic                     rst_ni,

    // S0 → S1 handshake & payload
    input  logic                     s0_vld_i,
    output logic                     s0_rdy_o,
    input  logic [9:0]               pos_i,
    input  logic [W-1:0]             u_vec_i [0:U_LEN-1],      // u_vec_i[k] = u^k, k=0..11

    // RiBM configuration (one-shot load into local registers)
    input  logic                     ribm_valid_i,  // load pulse
    input  logic [W-1:0]             sigma_bus_i [0:T],   // sigma_0..sigma_11 (low→high)
    input  logic [W-1:0]             v_bus_i [0:T-1],       // v_0..v_10   (low→high)
    
    // recorrect_done_o信号传递
    input  logic                     s0_recorrect_done_o,
    output logic                     s1_recorrect_done_o,


    // S1 → S2 handshake & payload
    output logic                     s1_vld_o,
    input  logic                     s2_rdy_i,
    output logic [9:0]               pos_o,
    output logic [W-1:0]             num_o,         // v(u)
    output logic [W-1:0]             den_o,         // sigma'(u)
    output logic [W-1:0]             phase_o        // (u^11)^2 = u^22
    );
    // ---------------------------------------------------------------------------
    // Ready/valid: single-register stage
    // ---------------------------------------------------------------------------
    assign s0_rdy_o = s2_rdy_i;  // backpressure from S2
    logic fire_i;                 // accept new input this cycle
    assign fire_i = s0_vld_i & s2_rdy_i;

    // ---------------------------------------------------------------------------
    // Configuration registers (latched from RiBM on ribm_valid_i)
    // ---------------------------------------------------------------------------
    logic [W-1:0]   sigma_reg[0:T];  // sigma_0..sigma_11
    logic [W-1:0]   v_reg[0:T-1];      // v_0..v_10

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            sigma_reg <= '{default:'0};
            v_reg     <= '{default:'0};
        end else if (ribm_valid_i) begin
            sigma_reg <= sigma_bus_i;
            v_reg     <= v_bus_i;
        end
    end

    // ---------------------------------------------------------------------------
    // Derivative selection
    // ---------------------------------------------------------------------------
    logic [W-1:0]      sd_passthru;   // σ1 (u^0)
    logic [W-1:0] sd_mul_coef[1:5];   // {σ3,σ5,σ7,σ9,σ11}
    sigma_deriv_sel #(.W(W)) u_sd (
        .sigma_bus_i (sigma_reg),
        .sd_passthru (sd_passthru),
        .sd_mul_coef (sd_mul_coef)
    );

    // ---------------------------------------------------------------------------
    // v(u) datapath: num = v0 ⊕ Σ_{k=1..10} (v_k · u^k)
    // ---------------------------------------------------------------------------
    logic [W-1:0] v_mul_p[1:10];  // products for k=1..10
    genvar k;
    generate
        for (k = 1; k <= 10; k++) begin : GEN_V_MUL
            gf1024_mul_w #(.W(W)) u_mul_v (
                .a (v_reg[k]),
                .b (u_vec_i[k]), // u^k
                .p (v_mul_p[k])
            );
        end
    endgenerate

    // XOR reduce for v path
    logic [W-1:0] v_mul_xor;
    integer i_v;
    always @(*) begin
        v_mul_xor = '0;
        for (i_v = 1; i_v <= 10; i_v++) begin
            v_mul_xor = v_mul_xor ^ v_mul_p[i_v];
        end
    end

    logic [W-1:0] num_comb;
    assign num_comb = v_reg[0] ^ v_mul_xor;  // u^0==1 ⇒ passthrough v0

    // ---------------------------------------------------------------------------
    // sigma'(u) datapath (odd degrees):
    //   den = σ1 ⊕ (σ3·u^1) ⊕ (σ5·u^2) ⊕ (σ7·u^3) ⊕ (σ9·u^4) ⊕ (σ11·u^5)
    // ---------------------------------------------------------------------------
    logic [1:5][W-1:0] sd_mul_p;  // products for i=1..5 (u^1..u^5)
    genvar j;
    generate
        for (j = 1; j <= 5; j++) begin : GEN_SD_MUL
            gf1024_mul_w #(.W(W)) u_mul_sd (
                .a (sd_mul_coef[j]),     // σ(2j+1)
                .b (u_vec_i[2*j]),         // u^j (j=1..5)
                .p (sd_mul_p[j])
            );
        end
    endgenerate

    // XOR reduce for sigma' path
    logic [W-1:0] sd_mul_xor;
    integer i_sd;
    always @(*) begin
        sd_mul_xor = '0;
        for (i_sd = 1; i_sd <= 5; i_sd++) begin
            sd_mul_xor = sd_mul_xor ^ sd_mul_p[i_sd];
        end
    end
    logic [W-1:0] den_comb;
    assign den_comb = sd_passthru ^ sd_mul_xor; // σ1 passes through (u^0==1)

    // ---------------------------------------------------------------------------
    // phase = (u^11)^2
    // ---------------------------------------------------------------------------
    logic [W-1:0] phase_comb;
    gf1024_square_w #(.W(W)) u_square (
        .a (u_vec_i[11]),
        .p (phase_comb)
    );

    // ---------------------------------------------------------------------------
    // Output registers (S1 → S2)
    // ---------------------------------------------------------------------------
    logic [9:0]   pos_q;
    logic [W-1:0] num_q, den_q, phase_q;
    logic         vld_q;

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            pos_q   <= '0;
            num_q   <= '0;
            den_q   <= '0;
            phase_q <= '0;
            vld_q   <= 1'b0;
        end else begin
            if (fire_i) begin
                pos_q   <= pos_i;
                num_q   <= num_comb;
                den_q   <= den_comb;
                phase_q <= phase_comb;
                vld_q   <= 1'b1;
            end else begin
                vld_q   <= 1'b0; // produce 1-cycle vld when new input is accepted
            end
        end
    end

    always @(posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            s1_recorrect_done_o <= 'b1;
        end else begin
            s1_recorrect_done_o <= s0_recorrect_done_o;
        end
    end

    assign pos_o   = pos_q;
    assign num_o   = num_q;
    assign den_o   = den_q;
    assign phase_o = phase_q;
    assign s1_vld_o= vld_q;

endmodule
