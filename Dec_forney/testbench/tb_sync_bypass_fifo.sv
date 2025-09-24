`timescale 1ns/1ps
// ============================================================================
// Testbench: sync_bypass_fifo (with/without PASS_THRU) — adapted ports
//  - DUT ports per spec:
//      clk_i, rst_ni, flush, data_in, push, full, data_out, pull, empty
//  - 允许在 TB 使用 function/task（RTL 禁用）
//  - No variable declaration nor module instantiation inside initial blocks
//  - Single-writer discipline for each variable (fix ICPD errors)
//  - Bypass semantics (PASS_THRU=1): when empty & push & pull in same cycle,
//    data_out must equal data_in in that cycle (zero extra latency)
//  - Flush modeling added in monitors; allow a few cycles for empty to assert
// ============================================================================

module tb_sync_bypass_fifo;
  // -------------------------------------------------------------------------
  // Parameters
  // -------------------------------------------------------------------------
  localparam int AW = 4;                    // depth = 2**AW = 16
  localparam int DW = 128;                  // data width for stress (e.g., pos+u_vec)
  localparam int N_RANDOM = 400;
  localparam int FLUSH_EMPTY_WITHIN = 3;    // cycles allowed for empty after flush

  // -------------------------------------------------------------------------
  // Common clock/reset
  // -------------------------------------------------------------------------
  logic clk; initial clk = 1'b0; always #1.666 clk = ~clk; // ~300MHz
  logic rst_ni;                                            // async active-low reset

  // -------------------------------------------------------------------------
  // DUT #1: PASS_THRU = 1  (bypass enabled)
  // -------------------------------------------------------------------------
  logic                  flush_pt;
  logic [DW-1:0]         din_pt;
  logic                  push_pt;
  logic                  pull_pt;
  wire                   full_pt;
  wire [DW-1:0]          dout_pt;
  wire                   empty_pt;

  sync_bypass_fifo #(
    .PASS_THRU  (1),
    .ADDR_WIDTH (AW),
    .DATA_WIDTH (DW)
  ) dut_pt (
    .clk_i   (clk),
    .rst_ni  (rst_ni),
    .flush   (flush_pt),
    .data_in (din_pt),
    .push    (push_pt),
    .full    (full_pt),
    .data_out(dout_pt),
    .pull    (pull_pt),
    .empty   (empty_pt)
  );

  // -------------------------------------------------------------------------
  // DUT #2: PASS_THRU = 0  (baseline, no bypass)
  // -------------------------------------------------------------------------
  logic                  flush_np;
  logic [DW-1:0]         din_np;
  logic                  push_np;
  logic                  pull_np;
  wire                   full_np;
  wire [DW-1:0]          dout_np;
  wire                   empty_np;

  sync_bypass_fifo #(
    .PASS_THRU  (0),
    .ADDR_WIDTH (AW),
    .DATA_WIDTH (DW)
  ) dut_np (
    .clk_i   (clk),
    .rst_ni  (rst_ni),
    .flush   (flush_np),
    .data_in (din_np),
    .push    (push_np),
    .full    (full_np),
    .data_out(dout_np),
    .pull    (pull_np),
    .empty   (empty_np)
  );

  // -------------------------------------------------------------------------
  // Reference models / monitors (single-writer discipline)
  // -------------------------------------------------------------------------
  int      seed;               // shared seed

  // PT (PASS_THRU=1) model state
  logic [DW-1:0] q_pt[$];      // golden queue
  int            oc_pt;        // occupancy (debug)
  logic [DW-1:0] exp_dout_pt_q;  // registered expected data
  logic          exp_pop_pt_q;   // registered expected pop flag

  // NP (PASS_THRU=0) model state
  logic [DW-1:0] q_np[$];
  int            oc_np;
  logic [DW-1:0] exp_dout_np_q;
  logic          exp_pop_np_q;

  // error counters — NOTE: written only in their dedicated check blocks
  int err_order_pt_cnt;    // data order mismatches (PASS_THRU=1)
  int err_flags_pt_cnt;    // flag mismatches (PASS_THRU=1)
  int err_order_np_cnt;    // data order mismatches (PASS_THRU=0)
  int err_flags_np_cnt;    // flag mismatches (PASS_THRU=0)

  // helpers (no declaration in initial)
  int i_loop;
  int k;

  // -------------------------------------------------------------------------
  // Reset & defaults
  // -------------------------------------------------------------------------
  initial begin
    rst_ni = 1'b0; seed = 32'hf00d_beef;
    // defaults for PT
    flush_pt = 1'b0; din_pt = '0; push_pt = 1'b0; pull_pt = 1'b0;
    // defaults for NP
    flush_np = 1'b0; din_np = '0; push_np = 1'b0; pull_np = 1'b0;
    // release async reset after a few cycles
    repeat (5) @(posedge clk);
    rst_ni = 1'b1;
  end

  // -------------------------------------------------------------------------
  // MONITOR for PASS_THRU=1: compute expected behavior & register for check
  // (No timing controls inside always_ff)
  // -------------------------------------------------------------------------
  always_ff @(posedge clk) begin
    if (!rst_ni) begin
      q_pt.delete(); oc_pt <= 0; exp_pop_pt_q <= 1'b0; exp_dout_pt_q <= '0;
      err_flags_pt_cnt <= 0;
    end else begin
      // Handle FLUSH (synchronous): clear model queue/occupancy
      if (flush_pt) begin
        q_pt.delete();
        oc_pt <= 0;
      end

      // default
      exp_pop_pt_q  <= 1'b0;
      exp_dout_pt_q <= '0;

      // POP path (normal)
      if (!empty_pt && pull_pt) begin
        if (q_pt.size() == 0) begin
          $error("[PT] POP on non-empty but model queue empty at %0t", $time);
        end else begin
          exp_dout_pt_q <= q_pt.pop_front();
          exp_pop_pt_q  <= 1'b1;
          oc_pt         <= oc_pt - 1;
        end
      end
      // BYPASS path (empty && push && pull): same-cycle output must equal din
      else if (empty_pt && push_pt && pull_pt) begin
        exp_dout_pt_q <= din_pt;
        exp_pop_pt_q  <= 1'b1;
        // occupancy unchanged
      end

      // PUSH acceptance (avoid overflow in driver)
      if (push_pt && !full_pt && !(empty_pt && push_pt && pull_pt)) begin
        // normal push (not in bypass-pop case)
        q_pt.push_back(din_pt);
        oc_pt <= oc_pt + 1;
      end

      // flag checks (expected flags follow model queue)
      if ((q_pt.size() == 0) && !empty_pt) begin
        err_flags_pt_cnt <= err_flags_pt_cnt + 1;
        $error("[PT] empty flag mismatch: should be 1 at %0t", $time);
      end
      if ((q_pt.size() == (1<<AW)) && !full_pt) begin
        err_flags_pt_cnt <= err_flags_pt_cnt + 1;
        $error("[PT] full flag mismatch: should be 1 at %0t", $time);
      end
    end
  end

  // Delayed data check for PASS_THRU=1 — single writer of err_order_pt_cnt
  always @(posedge clk) begin
    if (!rst_ni) begin
      err_order_pt_cnt <= 0;
    end else begin
      #1ps; // allow small delta to settle comb outputs
      if (exp_pop_pt_q) begin
        if (dout_pt !== exp_dout_pt_q) begin
          err_order_pt_cnt <= err_order_pt_cnt + 1;
          $error("[PT] DATA mismatch: got=%h exp=%h at %0t", dout_pt, exp_dout_pt_q, $time);
        end
      end
    end
  end

  // -------------------------------------------------------------------------
  // MONITOR for PASS_THRU=0
  // -------------------------------------------------------------------------
  always_ff @(posedge clk) begin
    if (!rst_ni) begin
      q_np.delete(); oc_np <= 0; exp_pop_np_q <= 1'b0; exp_dout_np_q <= '0;
      err_flags_np_cnt <= 0;
    end else begin
      // Handle FLUSH (synchronous): clear model queue/occupancy
      if (flush_np) begin
        q_np.delete();
        oc_np <= 0;
      end

      // default
      exp_pop_np_q  <= 1'b0;
      exp_dout_np_q <= '0;

      // pop only when not empty and pull
      if (!empty_np && pull_np) begin
        if (q_np.size() == 0) begin
          $error("[NP] POP on non-empty but model queue empty at %0t", $time);
        end else begin
          exp_dout_np_q <= q_np.pop_front();
          exp_pop_np_q  <= 1'b1;
          oc_np         <= oc_np - 1;
        end
      end

      // push accepted when not full
      if (push_np && !full_np) begin
        q_np.push_back(din_np);
        oc_np <= oc_np + 1;
      end

      // flag checks
      if ((q_np.size() == 0) && !empty_np) begin
        err_flags_np_cnt <= err_flags_np_cnt + 1;
        $error("[NP] empty flag mismatch: should be 1 at %0t", $time);
      end
      if ((q_np.size() == (1<<AW)) && !full_np) begin
        err_flags_np_cnt <= err_flags_np_cnt + 1;
        $error("[NP] full flag mismatch: should be 1 at %0t", $time);
      end
    end
  end

  // Delayed data check for PASS_THRU=0 — single writer of err_order_np_cnt
  always @(posedge clk) begin
    if (!rst_ni) begin
      err_order_np_cnt <= 0;
    end else begin
      #1ps;
      if (exp_pop_np_q) begin
        if (dout_np !== exp_dout_np_q) begin
          err_order_np_cnt <= err_order_np_cnt + 1;
          $error("[NP] DATA mismatch: got=%h exp=%h at %0t", dout_np, exp_dout_np_q, $time);
        end
      end
    end
  end

  // -------------------------------------------------------------------------
  // Optional helper tasks (TB only, allowed): quiesce, do_flush_and_expect_empty
  task automatic quiesce_pt(); begin
    push_pt = 1'b0; pull_pt = 1'b0; din_pt = '0; end
  endtask
  task automatic quiesce_np(); begin
    push_np = 1'b0; pull_np = 1'b0; din_np = '0; end
  endtask
  task automatic flush_expect_empty_pt();
  int kk;
  bit ok;
  begin
    ok = 1'b0;
    quiesce_pt();
    @(negedge clk); flush_pt = 1'b1;
    @(posedge clk); flush_pt = 1'b0;
    for (kk = 0; kk < FLUSH_EMPTY_WITHIN; kk++) begin
      @(posedge clk);
      if (empty_pt) ok = 1'b1;
    end
    if (!ok) $error("[PT] not empty within %0d cycles after flush at %0t", FLUSH_EMPTY_WITHIN, $time);
  end
endtask
  task automatic flush_expect_empty_np();
  int kk;
  bit ok;
  begin
    ok = 1'b0;
    quiesce_np();
    @(negedge clk); flush_np = 1'b1;
    @(posedge clk); flush_np = 1'b0;
    for (kk = 0; kk < FLUSH_EMPTY_WITHIN; kk++) begin
      @(posedge clk);
      if (empty_np) ok = 1'b1;
    end
    if (!ok) $error("[NP] not empty within %0d cycles after flush at %0t", FLUSH_EMPTY_WITHIN, $time);
  end
endtask

  // STIMULUS for PASS_THRU=1 (directed + random + bypass)
  initial begin
    // wait reset deassert
    wait (rst_ni == 1'b1); @(posedge clk);

    // Phase A: fill some, then drain
    flush_pt = 1'b0; push_pt = 1'b0; pull_pt = 1'b0; din_pt = '0;
    // push 10 words
    for (i_loop = 0; i_loop < 10; i_loop++) begin
      @(negedge clk);
      push_pt = 1'b1; din_pt = {$urandom(seed), $urandom(seed), $urandom(seed), $urandom(seed)};
      if (full_pt) push_pt = 1'b0; // avoid overflow intentionally
      @(posedge clk);
      push_pt = 1'b0;
    end
    // drain 5 words
    repeat (5) begin @(negedge clk); pull_pt = 1'b1; @(posedge clk); pull_pt = 1'b0; end

    // Phase B: bypass on empty (single shot)
    // ensure empty
    while (!empty_pt) begin @(negedge clk); pull_pt = 1'b1; @(posedge clk); pull_pt = 1'b0; end
    // same cycle push+pull when empty -> data must pass through
    @(negedge clk);
    din_pt  = 128'hDEADBEEF_01234567_89ABCDEF_F00DBABE;
    push_pt = 1'b1; pull_pt = 1'b1;
    @(posedge clk);
    // turn off
    push_pt = 1'b0; pull_pt = 1'b0;

    // Phase C: random interleave
    repeat (N_RANDOM) begin
      @(negedge clk);
      // 50% push when not full; 50% pull when not empty
      push_pt = ($urandom(seed) & 1) && !full_pt;
      pull_pt = ($urandom(seed) & 1) && !empty_pt;
      din_pt  = {$urandom(seed), $urandom(seed), $urandom(seed), $urandom(seed)};
      @(posedge clk);
    end

    // Phase D: flush behavior via task (QUIESCE + VERIFY within window)
    flush_expect_empty_pt();

    // stop driving
    push_pt = 1'b0; pull_pt = 1'b0;
  end

  // -------------------------------------------------------------------------
  // STIMULUS for PASS_THRU=0 (directed + random; bypass should NOT occur)
  // -------------------------------------------------------------------------
  initial begin
    // wait reset deassert
    wait (rst_ni == 1'b1); @(posedge clk);

    // Phase A: fill to almost full
    flush_np = 1'b0; push_np = 1'b0; pull_np = 1'b0; din_np = '0;
    for (i_loop = 0; i_loop < ((1<<AW)-1); i_loop++) begin
      @(negedge clk);
      push_np = !full_np; din_np = {$urandom(seed), $urandom(seed), $urandom(seed), $urandom(seed)};
      @(posedge clk); push_np = 1'b0;
    end

    // Phase B: drain all
    while (!empty_np) begin @(negedge clk); pull_np = 1'b1; @(posedge clk); pull_np = 1'b0; end

    // Phase C: random interleave (prevent overflow/underflow)
    repeat (N_RANDOM) begin
      @(negedge clk);
      push_np = ($urandom(seed) & 1) && !full_np;
      pull_np = ($urandom(seed) & 1) && !empty_np;
      din_np  = {$urandom(seed), $urandom(seed), $urandom(seed), $urandom(seed)};
      @(posedge clk);
    end

    // Phase D: flush behavior via task (QUIESCE + VERIFY within window)
    flush_expect_empty_np();

    // stop driving
    push_np = 1'b0; pull_np = 1'b0;

    // End sim summary
    repeat (10) @(posedge clk);
    $display("[TB] Summary: PT err_order=%0d err_flags=%0d; NP err_order=%0d err_flags=%0d",
             err_order_pt_cnt, err_flags_pt_cnt, err_order_np_cnt, err_flags_np_cnt);
    $finish;
  end

      // -------------------------------- fsdb ------------------------------
    initial begin
        $fsdbDumpfile("./dump.fsdb");
        $fsdbDumpvars("+all");
        $fsdbDumpMDA;
    end

endmodule
