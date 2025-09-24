`timescale 1ns/1ps
// ============================================================================
// Testbench for forney_control — s1_rdy_i fixed to 1, index-priority (MSB→LSB)
// Verifies: event order (FIFO), per-event MSB→LSB emission, N→N+2 visibility
// Constraints: no function/task usage; do NOT declare vars or instantiate
//              modules inside initial blocks.
// ============================================================================

module tb_forney_control;
  // -------------------------------------------------------------------------
  // Parameters (match DUT defaults)
  // -------------------------------------------------------------------------
  localparam int LANES        = 32;
  localparam int W            = 10;
  localparam int T            = 11;
  localparam int U_LEN        = T+1;
  localparam int POS_W        = 10;
  localparam int LANE_FIFO_AW = 4;
  localparam int EVT_FIFO_AW  = 4;

  localparam int DATA_W = POS_W + U_LEN*W; // packed: {pos, u^0..u^T}

  // -------------------------------------------------------------------------
  // Clock & Reset
  // -------------------------------------------------------------------------
  logic clk; initial clk = 1'b0; always #1.666 clk = ~clk; // ~300MHz
  logic rst_ni;

  // -------------------------------------------------------------------------
  // DUT I/O (exactly match the provided interface)
  // -------------------------------------------------------------------------
  logic                         flush_i;
  logic [LANES-1:0]             hit_mask_i;
  logic [LANES-1:0][POS_W-1:0]  pos_bus_i;
  logic [LANES-1:0][0:U_LEN-1][W-1:0] u_vec_i; // per-lane u^0..u^T

  logic                         s1_rdy_i;  // held 1'b1 in this TB
  wire                          vld_o;
  wire [POS_W-1:0]              pos_o;
  wire [0:U_LEN-1][W-1:0]       u_vec_o;   // DUT outputs u^T..u^0

  // -------------------------------------------------------------------------
  // Instantiate DUT (no parameter overrides necessary)
  // -------------------------------------------------------------------------
  forney_control #(
    .LANES        (LANES),
    .W            (W),
    .T            (T),
    .U_LEN        (U_LEN),
    .POS_W        (POS_W),
    .LANE_FIFO_AW (LANE_FIFO_AW),
    .EVT_FIFO_AW  (EVT_FIFO_AW)
  ) dut (
    .clk_i     (clk),
    .rst_ni    (rst_ni),
    .flush_i   (flush_i),
    .hit_mask_i(hit_mask_i),
    .pos_bus_i (pos_bus_i),
    .u_vec_i   (u_vec_i),
    .s1_rdy_i  (s1_rdy_i),
    .vld_o     (vld_o),
    .pos_o     (pos_o),
    .u_vec_o   (u_vec_o)
  );

  // -------------------------------------------------------------------------
  // TB state / scoreboard (module-scope only)
  // -------------------------------------------------------------------------
  integer i, j, k;
  integer cyc;

  // Expected queue (simple ring buffer) — stores packed payload in DUT output order (u^T..u^0)
  localparam int EXP_Q_DEPTH = 256;
  logic [DATA_W-1:0] exp_q [0:EXP_Q_DEPTH-1];
  integer exp_head, exp_tail, exp_count;

  // Temporary payload packer storage
  logic [DATA_W-1:0] tmp_pay;

  // Pack DUT outputs into a comparable word (DUT already outputs u^T..u^0)
  logic [DATA_W-1:0] got_pay;
  always @* begin
    got_pay = '0;
    // u_vec_o is [0:U_LEN-1][W-1:0] == u^T..u^0 by DUT contract
    for (k = 0; k < U_LEN; k = k + 1) begin
      got_pay[(k*W) +: W] = u_vec_o[k];
    end
    got_pay[(U_LEN*W) +: POS_W] = pos_o;
  end

  // Error counters
  integer err_cnt;

  // Wave dump
  initial begin
    $fsdbDumpfile("dump_tb_forney_control.fsdb");
    $fsdbDumpvars(0, tb_forney_control);
  end

  // -------------------------------------------------------------------------
  // Reset / defaults
  // -------------------------------------------------------------------------
  initial begin
    rst_ni     = 1'b0;
    flush_i    = 1'b0;
    s1_rdy_i   = 1'b1; // no backpressure
    hit_mask_i = '0;
    for (i = 0; i < LANES; i = i + 1) pos_bus_i[i] = '0;
    for (i = 0; i < LANES; i = i + 1) begin
      for (k = 0; k < U_LEN; k = k + 1) u_vec_i[i][k] = '0;
    end

    exp_head = 0; exp_tail = 0; exp_count = 0; err_cnt = 0; cyc = 0;

    // release reset
    repeat (5) @(posedge clk);
    rst_ni = 1'b1;
  end

  // -------------------------------------------------------------------------
  // Scoreboard pop on each valid output
  // -------------------------------------------------------------------------
  always @(posedge clk) begin
    if (rst_ni) begin
      if (vld_o) begin
        if (exp_count == 0) begin
          err_cnt = err_cnt + 1;
          $error("[SB] Unexpected output @%0t: got=%h (queue empty)", $time, got_pay);
        end else begin
          if (got_pay !== exp_q[exp_head]) begin
            err_cnt = err_cnt + 1;
            $error("[SB] Mismatch @%0t: got=%h exp=%h", $time, got_pay, exp_q[exp_head]);
          end
          exp_head = (exp_head + 1) % EXP_Q_DEPTH;
          exp_count = exp_count - 1;
        end
      end
    end
  end

  // -------------------------------------------------------------------------
  // Helper: push an event's expected items (MSB→LSB) into exp_q
  //  No function/task: do it inline in the driving block using module-scope tmp_pay
  // -------------------------------------------------------------------------

  // -------------------------------------------------------------------------
  // STIMULUS: three directed tests
  // -------------------------------------------------------------------------
  initial begin
    // Wait for reset deassert
    wait (rst_ni == 1'b1);
    @(posedge clk);

    // ============= TEST 1: single-lane event (lane 31) =============
    // Drive at N (at negedge for clean setup)
    @(negedge clk);
    hit_mask_i = '0; hit_mask_i[31] = 1'b1;
    pos_bus_i[31] = 10'h155;
    for (k = 0; k < U_LEN; k = k + 1) u_vec_i[31][k] = (10'h155 + k) & ((1<<W)-1);

    // Push expected for this event (MSB→LSB = only lane 31)
    tmp_pay = '0;
    // DUT outputs u^T..u^0 → pack in that order
    for (k = 0; k < U_LEN; k = k + 1) tmp_pay[(k*W) +: W] = u_vec_i[31][U_LEN-1-k];
    tmp_pay[(U_LEN*W) +: POS_W] = pos_bus_i[31];
    exp_q[exp_tail] = tmp_pay; exp_tail = (exp_tail + 1) % EXP_Q_DEPTH; exp_count = exp_count + 1;

    // Deassert hits next cycle
    @(negedge clk);
    hit_mask_i = '0;

    // Let output drain (N+2 latency) — observe via scoreboard
    repeat (4) @(posedge clk);

    // ============= TEST 2: two-lane simultaneous (lanes 28 & 3) =============
    @(negedge clk);
    hit_mask_i = '0; hit_mask_i[28] = 1'b1; hit_mask_i[3] = 1'b1;
    pos_bus_i[28] = 10'h2A0; pos_bus_i[3] = 10'h035;
    for (k = 0; k < U_LEN; k = k + 1) begin
      u_vec_i[28][k] = (10'h2A0 + 3*k) & ((1<<W)-1);
      u_vec_i[3][k]  = (10'h035 + 5*k) & ((1<<W)-1);
    end
    // Expected order: 28 first, then 3 (MSB→LSB)
    tmp_pay = '0; for (k = 0; k < U_LEN; k = k + 1) tmp_pay[(k*W)+:W] = u_vec_i[28][U_LEN-1-k];
    tmp_pay[(U_LEN*W)+:POS_W] = pos_bus_i[28]; exp_q[exp_tail] = tmp_pay; exp_tail = (exp_tail+1)%EXP_Q_DEPTH; exp_count = exp_count + 1;
    tmp_pay = '0; for (k = 0; k < U_LEN; k = k + 1) tmp_pay[(k*W)+:W] = u_vec_i[3][U_LEN-1-k];
    tmp_pay[(U_LEN*W)+:POS_W] = pos_bus_i[3];  exp_q[exp_tail] = tmp_pay; exp_tail = (exp_tail+1)%EXP_Q_DEPTH; exp_count = exp_count + 1;
    @(negedge clk);
    hit_mask_i = '0;

    // Allow enough cycles to see both outputs (expect at N+2 and N+3)
    repeat (6) @(posedge clk);

    // ============= TEST 3: two events back-to-back =============
    // Event A: lanes {5,2,1}
    @(negedge clk);
    hit_mask_i = '0; hit_mask_i[5]=1'b1; hit_mask_i[2]=1'b1; hit_mask_i[1]=1'b1;
    pos_bus_i[5]=10'h111; pos_bus_i[2]=10'h222; pos_bus_i[1]=10'h333;
    for (k = 0; k < U_LEN; k = k + 1) begin
      u_vec_i[5][k]=(10'h111 + k) & ((1<<W)-1);
      u_vec_i[2][k]=(10'h222 + 2*k) & ((1<<W)-1);
      u_vec_i[1][k]=(10'h333 + 3*k) & ((1<<W)-1);
    end
    // Expected A: 5, then 2, then 1
    tmp_pay='0; for (k=0;k<U_LEN;k=k+1) tmp_pay[(k*W)+:W]=u_vec_i[5][U_LEN-1-k]; tmp_pay[(U_LEN*W)+:POS_W]=pos_bus_i[5];
    exp_q[exp_tail]=tmp_pay; exp_tail=(exp_tail+1)%EXP_Q_DEPTH; exp_count=exp_count+1;
    tmp_pay='0; for (k=0;k<U_LEN;k=k+1) tmp_pay[(k*W)+:W]=u_vec_i[2][U_LEN-1-k]; tmp_pay[(U_LEN*W)+:POS_W]=pos_bus_i[2];
    exp_q[exp_tail]=tmp_pay; exp_tail=(exp_tail+1)%EXP_Q_DEPTH; exp_count=exp_count+1;
    tmp_pay='0; for (k=0;k<U_LEN;k=k+1) tmp_pay[(k*W)+:W]=u_vec_i[1][U_LEN-1-k]; tmp_pay[(U_LEN*W)+:POS_W]=pos_bus_i[1];
    exp_q[exp_tail]=tmp_pay; exp_tail=(exp_tail+1)%EXP_Q_DEPTH; exp_count=exp_count+1;

    // Event B (next cycle): lane {31}
    @(negedge clk);
    hit_mask_i = '0; hit_mask_i[31]=1'b1; pos_bus_i[31]=10'h3E7;
    for (k = 0; k < U_LEN; k = k + 1) u_vec_i[31][k] = (10'h3E7 + 7*k) & ((1<<W)-1);
    // Expected B: 31
    tmp_pay='0; for (k=0;k<U_LEN;k=k+1) tmp_pay[(k*W)+:W]=u_vec_i[31][U_LEN-1-k]; tmp_pay[(U_LEN*W)+:POS_W]=pos_bus_i[31];
    exp_q[exp_tail]=tmp_pay; exp_tail=(exp_tail+1)%EXP_Q_DEPTH; exp_count=exp_count+1;

    // Deassert
    @(negedge clk);
    hit_mask_i = '0;

    // Let outputs drain
    repeat (20) @(posedge clk);

    // Summary
    if (err_cnt==0 && exp_count==0) begin
      $display("[TB] PASS: all directed tests passed, queue drained.");
    end else begin
      $display("[TB] DONE: err_cnt=%0d (remaining exp_count=%0d)", err_cnt, exp_count);
    end
    $finish;
  end
    
    // -------------------------------- fsdb ------------------------------
    initial begin
        $fsdbDumpfile("./dump.fsdb");
        $fsdbDumpvars("+all");
        $fsdbDumpMDA;
    end


endmodule
