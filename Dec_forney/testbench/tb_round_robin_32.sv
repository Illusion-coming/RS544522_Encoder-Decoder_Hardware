`timescale 1ns/1ps
// ================================================================
// Testbench for round_robin_32 (hierarchical 4x8+1x4, pure-comb wrapper)
// Constraints:
//  - No user-defined function/task
//  - Do not declare variables or instantiate modules inside initial blocks
//  - Drive directed + random scenarios; check one-hot, fairness, starvation,
//    and coarse glitch-free behavior (grant changes only near clk edge)
// ================================================================

module tb_round_robin_32;
  // --------------------------------------------------------------
  // Parameters / localparams
  // --------------------------------------------------------------
  localparam int REQ_NB        = 32;
  localparam int WARMUP_CYCLES = 4;
  localparam int PHASE1_WAIT   = 2;   // cycles to wait after setting req
  localparam int RANDOM_CYCLES = 200;
  localparam int FAIR_CYCLES   = 64;
  localparam int MAX_GAP       = 64;  // starvation guard window
  // Glitch window: allow grant to change within WINDOW_PS after clk edge
  localparam int WINDOW_PS     = 200; // 200 ps settle window

  // --------------------------------------------------------------
  // DUT I/O
  // --------------------------------------------------------------
  logic                   clk;
  logic                   rst_ni;
  logic                   srst;
  logic                   en;
  logic [REQ_NB-1:0]      req;
  wire  [REQ_NB-1:0]      grant;

  // --------------------------------------------------------------
  // Instantiate DUT (module name provided by user: round_robin_32)
  // --------------------------------------------------------------
  round_robin_32 dut (
    .clk_i   (clk),
    .rst_ni(rst_ni),
    .en     (en),
    .req    (req),
    .grant  (grant)
  );

  // --------------------------------------------------------------
  // Clock & reset
  // --------------------------------------------------------------
  initial clk = 1'b0;
  always #1.666 clk = ~clk;  // ~300 MHz (T ≈ 3.333 ns)

  // Keep declarations outside initial as requested
  int      cycle;
  int      i_init, j_init;         // used in initial block
  int      k_ff;                   // used in always_ff monitors only
  int      seed;
  int      grant_count [REQ_NB-1:0];
  int      idle_gap    [REQ_NB-1:0];
  time     last_clk_edge;
  time     dt_time;
  int      glitch_errs;
  logic    clear_counts;           // pulse to clear counters in monitors

  // --------------------------------------------------------------
  // Simple monitors / scoreboards (single writer: always_ff)
  // --------------------------------------------------------------
  // one-hot check, starvation guard, and grant counters
  always_ff @(posedge clk) begin
    if (!rst_ni || srst || clear_counts) begin
      for (k_ff = 0; k_ff < REQ_NB; k_ff++) begin
        grant_count[k_ff] <= 0;
        idle_gap[k_ff]    <= 0;
      end
    end else begin
      // one-hot (or zero) check
      if ($countones(grant) > 1) begin
        $error("[ONEHOT] grant is not one-hot: %h at time %0t", grant, $time);
      end
      // counters & starvation guard
      for (k_ff = 0; k_ff < REQ_NB; k_ff++) begin
        if (grant[k_ff]) begin
          grant_count[k_ff] <= grant_count[k_ff] + 1;
          idle_gap[k_ff]    <= 0;
        end else if (req[k_ff]) begin
          idle_gap[k_ff]    <= idle_gap[k_ff] + 1;
          if (idle_gap[k_ff] > MAX_GAP) begin
            $error("[STARVE] requester %0d not served within %0d cycles", k_ff, MAX_GAP);
            idle_gap[k_ff] <= 0;
          end
        end else begin
          idle_gap[k_ff] <= 0;
        end
      end
    end
  end

  // 2) coarse glitch monitor: grant should only toggle near clk posedge
  //    (acceptable within WINDOW_PS after clk rising edge)
  always @(posedge clk) begin
    last_clk_edge <= $time;
  end
  always @(grant) begin
    if (rst_ni && !srst) begin
      dt_time = $time - last_clk_edge;
      if (dt_time > WINDOW_PS) begin
        glitch_errs = glitch_errs + 1;
        $error("[GLITCH] grant changed %0t ps after clk edge (>%0d ps): %h", dt_time, WINDOW_PS, grant);
      end
    end
  end

  // --------------------------------------------------------------
  // Stimulus
  // --------------------------------------------------------------
  initial begin
    // defaults
    rst_ni      = 1'b0;
    srst         = 1'b0;
    en           = 1'b0;
    req          = '0;
    seed         = 32'hc001_cafe;
    glitch_errs  = 0;
    clear_counts = 1'b0;

    // reset sequence
    repeat (3) @(posedge clk);
    rst_ni = 1'b1;
    repeat (2) @(posedge clk);
    srst = 1'b1;  // synchronous reset pulse
    @(posedge clk);
    srst = 1'b0;
    en   = 1'b1;

    // warmup cycles
    repeat (WARMUP_CYCLES) @(posedge clk);

    // ------------------------------------------------------------
    // Phase 1: directed single-bit requests (walk through 32 reqs)
    // Expectation: after a small latency, grant equals the active bit
    // ------------------------------------------------------------
    for (i_init = 0; i_init < REQ_NB; i_init++) begin
      req = '0;
      req[i_init] = 1'b1;
      repeat (PHASE1_WAIT) @(posedge clk);
      if (!grant[i_init]) begin
        $display("[PH1] i=%0d: expect grant[%0d]=1, got %h at %0t", i_init, i_init, grant, $time);
      end
    end

    // return to idle
    req = '0; @(posedge clk);

    // ------------------------------------------------------------
    // Phase 2: two requesters in the same group (e.g., 3 & 6 in group0)
    // Check relative fairness over FAIR_CYCLES cycles
    // ------------------------------------------------------------
    clear_counts = 1'b1; @(posedge clk); clear_counts = 1'b0;
    req = '0; req[3] = 1'b1; req[6] = 1'b1; 
    for (cycle = 0; cycle < FAIR_CYCLES; cycle++) begin
      @(posedge clk);
    end
    // fairness: counts differ by at most 1
    if ((grant_count[3] - grant_count[6] > 1) || (grant_count[6] - grant_count[3] > 1)) begin
      $error("[PH2] fairness mismatch: g3=%0d g6=%0d", grant_count[3], grant_count[6]);
    end else begin
      $display("[PH2] fairness OK: g3=%0d g6=%0d", grant_count[3], grant_count[6]);
    end

    // ------------------------------------------------------------
    // Phase 3: four requesters across groups (2,12,20,28)
    // Check group-level fairness
    // ------------------------------------------------------------
    clear_counts = 1'b1; @(posedge clk); clear_counts = 1'b0;
    req = '0; req[2] = 1'b1; req[12] = 1'b1; req[20] = 1'b1; req[28] = 1'b1; 
    for (cycle = 0; cycle < FAIR_CYCLES; cycle++) begin
      @(posedge clk);
    end
    // Compare pairwise; allow ±1 tolerance
    if (((grant_count[2]-grant_count[12] > 1) || (grant_count[12]-grant_count[2] > 1)) ||
        ((grant_count[20]-grant_count[28] > 1) || (grant_count[28]-grant_count[20] > 1))) begin
      $error("[PH3] group fairness mismatch: g2=%0d g12=%0d g20=%0d g28=%0d",
             grant_count[2], grant_count[12], grant_count[20], grant_count[28]);
    end else begin
      $display("[PH3] group fairness OK: g2=%0d g12=%0d g20=%0d g28=%0d",
               grant_count[2], grant_count[12], grant_count[20], grant_count[28]);
    end

    // ------------------------------------------------------------
    // Phase 4: random traffic (25% activity ratio)
    // Check one-hot throughout
    // ------------------------------------------------------------
    req = '0;
    for (cycle = 0; cycle < RANDOM_CYCLES; cycle++) begin
      @(negedge clk);
      for (j_init = 0; j_init < REQ_NB; j_init++) begin
        // 25% active probability
        req[j_init] = ($urandom(seed) % 4 == 0) ? 1'b1 : 1'b0;
      end
      @(posedge clk);
    end

    // Report summary
    $display("[TB] Completed. Glitch errors = %0d", glitch_errs);
    $finish;
  end

  
    // -------------------------------- fsdb ------------------------------
    initial begin
        $fsdbDumpfile("./dump.fsdb");
        $fsdbDumpvars("+all");
        $fsdbDumpMDA;
    end

endmodule
