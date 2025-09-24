`timescale 1ns/1ps
// =============================================================================
// forney_control_idx_serial.sv
//  - 32-lane input buffering + **index-priority (MSB→LSB) serialization**
//  - No round-robin; selection is strictly by current mask high-index first
//  - Event FIFO records per-cycle hit_mask (arrival order). Data FIFOs hold
//    per-lane payload {pos, u^0..u^T}.
//  - Pipeline timing per requirement:
//      N   : combinational select sel_lane (MSB→LSB), assert pull[sel_lane]
//            (only if s1_rdy_i). Optionally decide to pop next event when
//            current mask becomes empty after this pop.
//      N+1 : fifo_dout[sel_lane] valid → S1 captures payload (pos+u)
//      N+2 : vld_o = 1 and map S1 payload to outputs.
//  - RTL style: **no function/task** used.
// =============================================================================

module forney_control #(
    parameter int LANES        = 32,
    parameter int W            = 10,      // GF(2^10) element width
    parameter int T            = 11,      // t = 11 → u vector length = T+1 = 12
    parameter int U_LEN        = T+1,
    parameter int POS_W        = 10,      // up to N<=1024
    parameter int LANE_FIFO_AW = 4,       // depth 16 per-lane
    parameter int EVT_FIFO_AW  = 4        // depth 16 event FIFO (mask queue)
    ) (
    input  logic                         clk_i,
    input  logic                         rst_ni,
    input  logic                         flush_i,

    // Chien inputs (batch per cycle)
    input  logic [LANES-1:0]             hit_mask_i,               // per-lane hit bits (1: has one payload this cycle)
    input  logic [POS_W-1:0]             pos_bus_i   [0:LANES-1],                // per-lane position
    input  logic [W-1:0]                 u_vec_i [0:LANES-1][0:U_LEN-1],      // per-lane u^0..u^T

    // Handshake to S1 capture stage
    input  logic                         s1_rdy_i,
    output logic                         vld_o,                    // asserted at N+2
    output logic [POS_W-1:0]             pos_o,
    output logic [W-1:0]                 u_vec_o [0:U_LEN-1]             // u^T..u^0 for convenience
    );

    // ---------------------------------------------------------------------------
    // Local constants and types
    // ---------------------------------------------------------------------------
    localparam int DATA_W = POS_W + U_LEN*W; // packed payload width

    // ---------------------------------------------------------------------------
    // Per-lane payload FIFOs (no bypass needed for N→N+2 timing)
    //   data_in  = {pos, u^0, u^1, ..., u^T}
    //   push     = hit_mask_i[lane]
    //   pull     = asserted only when lane selected (sel_onehot) and s1_rdy_i
    // ---------------------------------------------------------------------------
    logic [LANES-1:0]              lane_full, lane_empty;
    logic [LANES-1:0]              lane_push, lane_pull;
    logic [DATA_W-1:0]  lane_din [0:LANES-1];
    logic [DATA_W-1:0]  lane_dout [0:LANES-1];


    genvar gi;
    generate
        for (gi = 0; gi < LANES; gi = gi + 1) begin : g_lane
        // pack {pos, u^0..u^T}
        integer pk;
        always @(*) begin
            lane_din[gi] = '0;
            for (pk = 0; pk < U_LEN; pk = pk + 1) begin
                lane_din[gi][pk*W +: W] = u_vec_i[gi][pk];
            end
            lane_din[gi][U_LEN*W +: POS_W] = pos_bus_i[gi];
        end

        assign lane_push[gi] = hit_mask_i[gi] & ~lane_full[gi];

        // Each lane FIFO: PASS_THRU=0 (not needed for N→N+2)
        sync_bypass_fifo #(
            .PASS_THRU  (0),
            .ADDR_WIDTH (LANE_FIFO_AW),
            .DATA_WIDTH (DATA_W)
        ) u_lane_fifo (
            .clk_i   (clk_i),
            .rst_ni  (rst_ni),
            .flush   (flush_i),
            .data_in (lane_din[gi]),
            .push    (lane_push[gi]),
            .full    (lane_full[gi]),
            .data_out(lane_dout[gi]),
            .pull    (lane_pull[gi]),
            .empty   (lane_empty[gi])
        );
        end
    endgenerate

    // ---------------------------------------------------------------------------
    // Event FIFO: queue of masks in **arrival order** (one entry per cycle if any)
    //   Stores 32b mask; PASS_THRU=1 to avoid extra bubble when popping on empty
    // ---------------------------------------------------------------------------
    logic [31:0] evt_din, evt_dout;
    logic        evt_push, evt_pull, evt_full, evt_empty;

    assign evt_din  = hit_mask_i;
    assign evt_push = (hit_mask_i != '0) & ~evt_full; // drop if full

    sync_bypass_fifo #(
        .PASS_THRU  (0),
        .ADDR_WIDTH (EVT_FIFO_AW),
        .DATA_WIDTH (32)
    ) u_evt_fifo (
        .clk_i   (clk_i),
        .rst_ni  (rst_ni),
        .flush   (flush_i),
        .data_in (evt_din),
        .push    (evt_push),
        .full    (evt_full),
        .data_out(evt_dout),
        .pull    (evt_pull),
        .empty   (evt_empty)
    );

    // ---------------------------------------------------------------------------
    // Current pending mask (cur_mask_q): which lanes still to be emitted
    // Selection policy: **MSB→LSB** (lane31 .. lane0)
    // ---------------------------------------------------------------------------
    logic [LANES-1:0] cur_mask_q, cur_mask_d;

    // Descending-priority encoder (no function)
    logic [4:0]       sel_idx_d;
    logic [LANES-1:0] sel_onehot_d;
    logic             have_item;

    integer j;
    always @(*) begin
        have_item   = (cur_mask_q != '0);
        sel_onehot_d= '0;
        if (have_item) begin
            // find highest set bit
            bit found; found = 1'b0;
            // for (j = LANES-1; j >= 0; j = j - 1) begin
            for (j = 0; j <= LANES-1; j = j + 1) begin
                if (!found && cur_mask_q[j]) begin
                    sel_onehot_d    = '0; 
                    sel_onehot_d[j] = 1'b1;
                    found           = 1'b1;
                end
            end
        end
    end

    // Issue pull only if S1 ready this cycle
    logic do_issue_d;
    assign do_issue_d = have_item & s1_rdy_i;

    // Generate lane pulls (combinational this cycle N)
    genvar gp;
    generate
        for (gp = 0; gp < LANES; gp = gp + 1) begin : g_pull
            assign lane_pull[gp] = do_issue_d & sel_onehot_d[gp];
        end
    endgenerate

    // Decide event pop and next mask value
    //  - If have_item and we issue, clear the selected bit; if becomes zero and
    //    evt not empty, also pop to load next mask (arrival order).
    //  - If no current item, pop next mask if available and S1 ready (to avoid
    //    creating a bubble before starting a new batch).
    logic need_pop_evt_d;

    always @(*) begin
        cur_mask_d    = cur_mask_q;
        if(do_issue_d) begin
            // clear selected bit
            cur_mask_d = cur_mask_q & ~sel_onehot_d;
        end
    end

    always @(*) begin
        need_pop_evt_d= 1'b0;
        if(do_issue_d && !cur_mask_d) begin
            // batch drains; try fetch next mask
            need_pop_evt_d = ~evt_empty; // if empty, we'll sit at 0 until some arrives
        end else if(!have_item)begin
            // idle with no current batch; prepare to fetch
            need_pop_evt_d = ~evt_empty & s1_rdy_i;
        end
    end

    assign evt_pull = need_pop_evt_d; // pull at N so that at N+1 new mask can be used

    // Update cur_mask_q at posedge: either cleared mask, or new head from event
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            cur_mask_q <= '0;
        end else if (flush_i) begin
            cur_mask_q <= '0;
        end else begin
            if (do_issue_d) begin
                cur_mask_q <= cur_mask_q & ~sel_onehot_d; // cleared mask
            end
            if (need_pop_evt_d) begin
                // load popped head **in the same posedge** (evt_dout holds head)
                cur_mask_q <= evt_dout; // if evt_empty, evt_dout value is don't-care; guarded above
            end
        end
    end

    // N+1: data select (one-hot wide-OR), then register as S1 payload
    logic [DATA_W-1:0] sel_data_d;  // combinational one-hot mux result at N+1
    integer mx;
    always @(*) begin
        sel_data_d = '0;
        for (mx = 0; mx < LANES; mx = mx + 1) begin
            sel_data_d = sel_data_d | ({DATA_W{sel_onehot_d[mx]}} & lane_dout[mx]);
        end
    end

    // S1 register (captures at N+1)
    logic [POS_W-1:0]        pos_s1_q;
    logic [0:U_LEN-1][W-1:0] u_s1_q_hi2lo; // already reordered to hi..lo
    logic                    s1_vld_pipe_q;

    integer rk;
    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            pos_s1_q             <= '0;
            for (rk = 0; rk < U_LEN; rk = rk + 1) begin
                u_s1_q_hi2lo[rk] <= '0;
            end
        end else if (flush_i) begin
            pos_s1_q             <= '0;
            for (rk = 0; rk < U_LEN; rk = rk + 1) begin
                u_s1_q_hi2lo[rk] <= '0;
            end
        end else begin
            if (sel_onehot_d) begin
                // unpack and reorder u: stored as {pos, u^0..u^T} → output u^T..u^0
                pos_s1_q <= sel_data_d[U_LEN*W +: POS_W];
                for (rk = 0; rk < U_LEN; rk = rk + 1) begin
                u_s1_q_hi2lo[rk] <= sel_data_d[rk*W +: W];
                end
            end
        end
    end

    always @ (posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            s1_vld_pipe_q <= 'b0;
        end else if(flush_i) begin
            s1_vld_pipe_q <= 'b0;
        end else begin
            s1_vld_pipe_q <= |sel_data_d;
        end
    end

    // N+2: drive outputs
    assign vld_o        = s1_vld_pipe_q;
    assign pos_o        = pos_s1_q;
    genvar v_i;
    generate
        for(v_i = 0; v_i < U_LEN ; v_i = v_i + 1)
            assign u_vec_o[v_i]      = u_s1_q_hi2lo[v_i];
    endgenerate
    // ---------------------------------------------------------------------------
    // (Optional) simple assertions (simulation only)
    // ---------------------------------------------------------------------------
    // synopsys translate_off
    always @(posedge clk_i) begin
        if (rst_ni && !flush_i) begin
        // lane_pull must be one-hot or zero when issuing
        if (do_issue_d && ($countones(lane_pull) != 1)) begin
            $error("[forney_ctrl] lane_pull not one-hot at %0t: %h", $time, lane_pull);
        end
        end
    end
    // synopsys translate_on

endmodule
