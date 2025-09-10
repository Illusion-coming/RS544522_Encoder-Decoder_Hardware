
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

    // wire b;
    // assign b = 0;
    // assign b = a + c;

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

