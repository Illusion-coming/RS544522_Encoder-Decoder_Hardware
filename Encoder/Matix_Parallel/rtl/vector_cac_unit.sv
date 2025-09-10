
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