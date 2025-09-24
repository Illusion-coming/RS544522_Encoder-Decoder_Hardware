// ================================================================
// round_robin.sv
// Hierarchical 32-lane round-robin wrapper (pure-comb wrapper)
// - Uses existing round_robin_core.sv (parent=4-way, child=8-way)
// - Wrapper itself contains no functions/tasks and adds no flops
// - For REQ_NB!=32, falls back to a single core instance
// Interface kept identical to your template
//   clk_i, rst_ni, srst, en, req[REQ_NB-1:0], grant[REQ_NB-1:0]
// ================================================================

module round_robin_32 #(
  parameter int unsigned REQ_NB = 32
) (
  input  wire                   clk_i,
  input  wire                   rst_ni,
  input  wire                   en,
  input  wire  [REQ_NB-1:0]     req,
  output logic [REQ_NB-1:0]     grant
);
    generate
        if (REQ_NB == 32) begin : g_rr32
            localparam int GROUPS = 4;
            localparam int GSIZE  = 8;

            // Split requests into 4 groups of 8
            logic [GSIZE-1:0] req_g [0:GROUPS-1];
            for (genvar g = 0; g < GROUPS; g++) begin : g_split
                for (genvar j = 0; j < GSIZE; j++) begin
                    assign req_g[g][j] = req[g*GSIZE + j];
                end
            end

            // Parent requests: whether any requester exists in the group
            logic [GROUPS-1:0] req_grp_any;
            for (genvar g = 0; g < GROUPS; g++) begin : g_any
                assign req_grp_any[g] = |req_g[g];
            end

            // Parent 4-way RR over groups (uses existing core)
            logic [GROUPS-1:0] grant_grp;
            round_robin_core #(.REQ_NB(GROUPS)) u_rr_grp (
                .clk_i   (clk_i),
                .rst_ni  (rst_ni),
                .en      (en),
                .req     (req_grp_any),
                .grant   (grant_grp)
            );

            // Child 8-way RR per group (enabled only when its group is granted)
            logic [GSIZE-1:0] grant_g [0:GROUPS-1];
            for (genvar g = 0; g < GROUPS; g++) begin : g_child
                round_robin_core #(.REQ_NB(GSIZE)) u_rr_child (
                .clk_i   (clk_i),
                .rst_ni  (rst_ni),
                .en      (en & grant_grp[g]),
                .req     (req_g[g]),
                .grant   (grant_g[g])
                );
            end

            // Combine grants to 32-bit one-hot (pure combinational)
            // 关键：对子组 grant 做父组掩码
            logic [GSIZE-1:0] grant0;
            logic [GSIZE-1:0] grant1;
            logic [GSIZE-1:0] grant2;
            logic [GSIZE-1:0] grant3;
            
            assign grant0 = ({GSIZE{grant_grp[0]}} & grant_g[0]);
            assign grant1 = ({GSIZE{grant_grp[1]}} & grant_g[1]);
            assign grant2 = ({GSIZE{grant_grp[2]}} & grant_g[2]);
            assign grant3 = ({GSIZE{grant_grp[3]}} & grant_g[3]);

            // 最终 32b one-hot {高位， 低位}
            assign grant = {grant3, grant2, grant1, grant0};


        end else begin : g_fallback
            // Generic single-core RR for other sizes
            round_robin_core #(.REQ_NB(REQ_NB)) u_rr (
                .clk_i   (clk_i),
                .rst_ni  (rst_ni),
                .en      (en),
                .req     (req),
                .grant   (grant)
            );
        end
        endgenerate
endmodule
