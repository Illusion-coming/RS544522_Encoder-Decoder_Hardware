// =============================================================
// RS(544,522) Encoder — Matrix Method (L = 7, no internal pipe)
// Top:    rs544522_lal7_matix
// Subs:   matrix_cac_unit  (pr = P_L * r_in)
//         vector_cac_unit  (v  = K    * s)
// Notes:  - Style aligned with *_nopipe_*: 1-cycle state update, no func/task.
//         - Use proven gf1024_mul_pb_k5_flat.v as GF(2^10) multiplier.
//         - Constants P_L / K_VEC come from mat_L7_consts.svh (generated).
//         - rem[i] maps to x^i (i=0..21). Codeword[21:0] = rem[21:0].
// =============================================================
`timescale 1ns/1ps

// import mat_L7_consts_pkg::*;
// Include generated matrix constants (P_L[22][22], K_VEC[7][22])
// `include "mat_L7_consts.svh"

// (Option) include multiplier declaration if not already in compile scope
// `include "gf1024_mul_pb_k5_flat.v"

// -------------------------------------------------------------
// GF(2^10) constant multiply wrapper (module-based, no function)
// -------------------------------------------------------------
module gf1024_mul_const #(
    parameter int W = 10
    )(
    input  wire [W-1:0] a_const,  // constant (can be tied to param/array element)
    input  wire [W-1:0] b_var,    // variable operand
    output wire [W-1:0] p_out
    );
    // Reuse proven full multiplier; drive one side with constant
    gf1024_mul_pb_k5_flat u_mul (
        .A (a_const),
        .B (b_var),
        .P (p_out)
    );
endmodule



// -------------------------------------------------------------
// matrix_cac_unit: pr = P_L * r_in  (22x22 over GF(2^10))
// -------------------------------------------------------------
module matrix_cac_unit #(
    parameter int W = 10,
    parameter int R = 22
    )(
    input  wire                 clk_i,   // kept for symmetry; combinational datapath
    input  wire                 rst_ni,
    input  wire                 en_i,    // unused in nopipe; reserved for gated updates
    input  wire [W-1:0]         r_in   [0:R-1],   // rem[0..21]
    input  wire [W-1:0]         P_L_i  [0:R-1][0:R-1],
    output reg  [W-1:0]         pr_o   [0:R-1]
    );
    // Products: m[i][j] = P_L[i][j] * r_in[j]
    wire [W-1:0] m [0:R-1][0:R-1];
        genvar gi, gj;
        generate
            for (gi = 0; gi < R; gi++) begin: g_row
            for (gj = 0; gj < R; gj++) begin: g_col
                gf1024_mul_const #(.W(W)) u_mul_pl (
                .a_const (P_L_i[gi][gj]),
                .b_var   (r_in[gj]),
                .p_out   (m[gi][gj])
                );
            end
            end
        endgenerate

    integer i, j;
    always @(*) begin
        for (i = 0; i < R; i = i + 1) begin
            pr_o[i] = '0;
            for (j = 0; j < R; j = j + 1) begin
                pr_o[i] = pr_o[i] ^ m[i][j];
            end
        end
    end
endmodule



// -------------------------------------------------------------
// vector_cac_unit: v = K * s  (22x1 over GF(2^10))
// -------------------------------------------------------------
module vector_cac_unit #(
    parameter int W = 10,
    parameter int R = 22
    )(
    input  wire                 clk_i,   // kept for symmetry; combinational datapath
    input  wire                 rst_ni,
    input  wire                 en_i,    // unused in nopipe
    input  wire [W-1:0]         s_i,
    input  wire [W-1:0]         K_i   [0:R-1],    // 22 constants for this lane (one row of K_VEC)
    output wire [W-1:0]         v_o   [0:R-1]
    );
    genvar gi;
    generate
        for (gi = 0; gi < R; gi++) begin: g_vmul
        gf1024_mul_const #(.W(W)) u_mul_k (
            .a_const (K_i[gi]),
            .b_var   (s_i),
            .p_out   (v_o[gi])
        );
        end
    endgenerate
endmodule


// -------------------------------------------------------------
// Top: rs544522_lal7_matix (L=7 lanes, no internal pipeline)
// -------------------------------------------------------------
module rs544522_lal7_matix #(
    parameter logic [9:0] P_L_7 [0:21][0:21] = '{
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd807, 10'd55, 10'd133, 10'd880, 10'd818, 10'd456, 10'd448 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd280, 10'd730, 10'd461, 10'd874, 10'd768, 10'd840, 10'd1015 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd944, 10'd427, 10'd451, 10'd751, 10'd436, 10'd187, 10'd1010 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd621, 10'd841, 10'd836, 10'd584, 10'd967, 10'd276, 10'd292 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd3, 10'd103, 10'd356, 10'd940, 10'd56, 10'd126, 10'd571 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd177, 10'd42, 10'd184, 10'd1012, 10'd215, 10'd900, 10'd956 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd365, 10'd723, 10'd799, 10'd729, 10'd681, 10'd736, 10'd897 },
    { 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd657, 10'd742, 10'd112, 10'd977, 10'd125, 10'd187, 10'd806 },
    { 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd813, 10'd641, 10'd662, 10'd368, 10'd472, 10'd49, 10'd907 },
    { 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1010, 10'd757, 10'd896, 10'd809, 10'd251, 10'd555, 10'd152 },
    { 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd712, 10'd876, 10'd303, 10'd626, 10'd780, 10'd239, 10'd415 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd466, 10'd178, 10'd17, 10'd718, 10'd550, 10'd337, 10'd578 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd374, 10'd462, 10'd230, 10'd465, 10'd583, 10'd607, 10'd821 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd544, 10'd724, 10'd946, 10'd696, 10'd14, 10'd1001, 10'd91 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd374, 10'd572, 10'd640, 10'd626, 10'd561, 10'd119, 10'd397 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd482, 10'd996, 10'd985, 10'd1018, 10'd359, 10'd898, 10'd70 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd555, 10'd102, 10'd881, 10'd943, 10'd718, 10'd989, 10'd404 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd0, 10'd976, 10'd840, 10'd582, 10'd364, 10'd1018, 10'd672, 10'd598 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd0, 10'd452, 10'd495, 10'd494, 10'd510, 10'd238, 10'd902, 10'd41 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd0, 10'd899, 10'd917, 10'd579, 10'd191, 10'd529, 10'd770, 10'd655 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd0, 10'd783, 10'd808, 10'd196, 10'd225, 10'd872, 10'd448, 10'd272 },
    { 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, 10'd1, 10'd513, 10'd540, 10'd88, 10'd464, 10'd656, 10'd738, 10'd457 }
    },

    parameter logic [9:0] K_VEC_7 [0:6][0:21] = '{
    { 10'd807, 10'd280, 10'd944, 10'd621, 10'd3, 10'd177, 10'd365, 10'd657, 10'd813, 10'd1010, 10'd712, 10'd466, 10'd374, 10'd544, 10'd374, 10'd482, 10'd555, 10'd976, 10'd452, 10'd899, 10'd783, 10'd513 },
    { 10'd55, 10'd730, 10'd427, 10'd841, 10'd103, 10'd42, 10'd723, 10'd742, 10'd641, 10'd757, 10'd876, 10'd178, 10'd462, 10'd724, 10'd572, 10'd996, 10'd102, 10'd840, 10'd495, 10'd917, 10'd808, 10'd540 },
    { 10'd133, 10'd461, 10'd451, 10'd836, 10'd356, 10'd184, 10'd799, 10'd112, 10'd662, 10'd896, 10'd303, 10'd17, 10'd230, 10'd946, 10'd640, 10'd985, 10'd881, 10'd582, 10'd494, 10'd579, 10'd196, 10'd88 },
    { 10'd880, 10'd874, 10'd751, 10'd584, 10'd940, 10'd1012, 10'd729, 10'd977, 10'd368, 10'd809, 10'd626, 10'd718, 10'd465, 10'd696, 10'd626, 10'd1018, 10'd943, 10'd364, 10'd510, 10'd191, 10'd225, 10'd464 },
    { 10'd818, 10'd768, 10'd436, 10'd967, 10'd56, 10'd215, 10'd681, 10'd125, 10'd472, 10'd251, 10'd780, 10'd550, 10'd583, 10'd14, 10'd561, 10'd359, 10'd718, 10'd1018, 10'd238, 10'd529, 10'd872, 10'd656 },
    { 10'd456, 10'd840, 10'd187, 10'd276, 10'd126, 10'd900, 10'd736, 10'd187, 10'd49, 10'd555, 10'd239, 10'd337, 10'd607, 10'd1001, 10'd119, 10'd898, 10'd989, 10'd672, 10'd902, 10'd770, 10'd448, 10'd738 },
    { 10'd448, 10'd1015, 10'd1010, 10'd292, 10'd571, 10'd956, 10'd897, 10'd806, 10'd907, 10'd152, 10'd415, 10'd578, 10'd821, 10'd91, 10'd397, 10'd70, 10'd404, 10'd598, 10'd41, 10'd655, 10'd272, 10'd457 }
    },

    parameter int W = 10,
    parameter int R = 22,
    parameter int L = 7
    )(
    input  wire                 clk_i,
    input  wire                 rst_ni,
    input  wire                 start_i,         // assert with first valid_i of a frame
    input  wire                 valid_i,         // asserted for 66 beats (MSB-first, first 3 lanes=0)
    input  wire                 last_i,          // asserted with valid_i on the last data beat
    input  wire [W-1:0]         s_blk_i [0:L-1], // 7-lane inputs per beat
    output reg                 parity_valid_o,  // 1 cycle after last_i & valid_i
    output reg  [W-1:0]         parity_o [0:R-1] // rem[0..21]
    );
    // ------------------------------------------------------------------
    // State register rem[0..21] (x^i coefficient); r_in -> r_out each beat
    // ------------------------------------------------------------------
    reg  [W-1:0] r_fb  [0:R-1];         //r_feedback
    wire [W-1:0] r_in  [0:R-1];
    wire [W-1:0] r_out [0:R-1];

    genvar si;
    generate
        for (si = 0; si < R; si = si + 1) begin
            assign r_in[si] = (start_i) ? '0 : r_fb[si];
        end
    endgenerate

    // --------------------------------------------------------------
    // Stage A: pr = P_L * r_in   (matrix_cac_unit)
    // --------------------------------------------------------------
    wire [W-1:0] pr [0:R-1];
    matrix_cac_unit #(.W(W), .R(R)) u_mat (
        .clk_i (clk_i),
        .rst_ni(rst_ni),
        .en_i  (valid_i),
        .r_in  (r_in),
        .P_L_i (P_L_7),
        .pr_o  (pr)
    );

    // --------------------------------------------------------------
    // Stage B: 7x vector_cac_unit  v_lane[j] = K_{6-j} * s_blk_i[j]
    //          inj = XOR_j v_lane[j]
    // --------------------------------------------------------------
    wire [W-1:0] v_lane [0:L-1][0:R-1];
    genvar lj;
    generate
        for (lj = 0; lj < L; lj++) begin: g_vec
            vector_cac_unit #(.W(W), .R(R)) u_vec (
                .clk_i (clk_i),
                .rst_ni(rst_ni),
                .en_i  (valid_i),
                .s_i   (s_blk_i[lj]),
                .K_i   (K_VEC_7[6-lj]), // lane j uses K_{6-j}
                .v_o   (v_lane[lj])
            );
        end
    endgenerate

    // inj[i] = XOR over lanes
    reg [W-1:0] inj [0:R-1];
    // genvar ri, rj;
    // generate
    //     for (ri = 0; ri < R; ri = ri + 1) begin
    //         for (rj = 0; rj < L; rj = rj + 1) begin
    //             assign inj[ri] = inj[ri] ^ v_lane[rj][ri];
    //         end
    //     end
    // endgenerate
    integer ri, rj;
    always @ (*) begin
        for (ri = 0; ri < R; ri = ri + 1) begin
            inj[ri] = '0;
            for (rj = 0; rj < L; rj = rj + 1) begin
                inj[ri] = inj[ri] ^ v_lane[rj][ri];
            end
        end
    end


    // --------------------------------------------------------------
    // Stage C: r_out = pr ^ inj  (registered at next cycle by r_in)
    // --------------------------------------------------------------
    genvar gi;
    generate
        for (gi = 0; gi < R; gi++) begin: g_merge
            assign r_out[gi] = pr[gi] ^ inj[gi];
        end
    endgenerate


    integer fb;
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            for (fb = 0; fb < R; fb = (fb + 1))     r_fb[fb] <= '0;
        end else if (valid_i) begin
            for (fb = 0; fb < R; fb = (fb + 1))     r_fb[fb] <= r_out[fb];
        end
    end

    // --------------------------------------------------------------
    // Outputs: parity_o = current state; parity_valid_o = delayed last
    // --------------------------------------------------------------
    integer po;
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            parity_valid_o <= 1'b0;
        end else begin
            parity_valid_o <= (last_i & valid_i);
            if((last_i & valid_i)) begin
                for (po = 0; po < R; po++) parity_o[po] <= r_out[po];
            end
        end
    end


endmodule

