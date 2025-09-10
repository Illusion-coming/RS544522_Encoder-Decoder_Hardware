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
// -------------------------------------------------------------
// Top: rs544522_lal7_matix (L=7 lanes, no internal pipeline)
// -------------------------------------------------------------
module rs544522_lal7_matix #(
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
    // import package from mat_L7_consts_v2.svh
    import rs_mat_L7_consts_pkg::*;
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
    integer ri, rj;
    always @ (*) begin
        for (ri = 0; ri < R; ri = ri + 1) begin
            inj[ri] = '0;
            for (rj = 0; rj < L; rj = rj + 1) begin
                inj[ri] = inj[ri] ^ v_lane[rj][ri];
            end
        end
    end

    /*###########################等效写法################################
        // // ---------------------------------------------------------------
        // // 1) Procedural fold (simplest, inj is logic)
        // // ---------------------------------------------------------------
        // logic [W-1:0] inj [0:R-1];
        // always_comb begin
        // foreach (inj[i]) begin
        //     inj[i] = '0;
        //     for (int j = 0; j < L; j++) inj[i] ^= v_lane[j][i];
        // end
        // end

        // // ---------------------------------------------------------------
        // // 2) Structural accumulators (pure assign, inj can be wire)
        // // ---------------------------------------------------------------
        // wire  [W-1:0] inj_w [0:R-1];
        // wire  [W-1:0] acc   [0:L][0:R-1];

        // genvar gi, gj;
        // generate
        // for (gi=0; gi<R; gi++) begin: g_row
        //     assign acc[0][gi] = '0;
        //     for (gj=0; gj<L; gj++) begin: g_lane
        //     assign acc[gj+1][gi] = acc[gj][gi] ^ v_lane[gj][gi];
        //     end
        //     assign inj_w[gi] = acc[L][gi];
        // end
        // endgenerate
    */
    

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
            for (po = 0; po < R; po++) parity_o[po] <= 'b0;
        end else begin
            parity_valid_o <= (last_i & valid_i);
            if((last_i & valid_i)) begin
                for (po = 0; po < R; po++) parity_o[po] <= r_out[po];
            end
        end
    end


endmodule

