`timescale 1ns/1ps

module forney_control_tb;

  // ---------------------------------------------------------------------------
  // Params (mirror DUT defaults)
  // ---------------------------------------------------------------------------
  localparam int LANES        = 32;
  localparam int W            = 10;
  localparam int T            = 11;
  localparam int U_LEN        = T+1;   // 12
  localparam int POS_W        = 10;
  localparam int LANE_FIFO_AW = 4;
  localparam int EVT_FIFO_AW  = 4;

  // ---------------------------------------------------------------------------
  // Clk/Reset
  // ---------------------------------------------------------------------------
  logic clk_i;
  logic rst_ni;
  logic flush_i;

  // DUT inputs
  logic [LANES-1:0]                     hit_mask_i;
  logic [LANES-1:0][POS_W-1:0]          pos_bus_i;
  logic [LANES-1:0][0:U_LEN-1][W-1:0]   u_vec_i;     // u^0..u^T
  logic                                 s1_rdy_i;

  // DUT outputs
  logic                                 vld_o;
  logic [POS_W-1:0]                     pos_o;
  logic [0:U_LEN-1][W-1:0]              u_vec_o;     // u^T..u^0

  // ---------------------------------------------------------------------------
  // DUT instance (no instantiation inside initial/task/function)
  // ---------------------------------------------------------------------------
  forney_control #(
    .LANES        (LANES),
    .W            (W),
    .T            (T),
    .U_LEN        (U_LEN),
    .POS_W        (POS_W),
    .LANE_FIFO_AW (LANE_FIFO_AW),
    .EVT_FIFO_AW  (EVT_FIFO_AW)
  ) dut (
    .clk_i      (clk_i),
    .rst_ni     (rst_ni),
    .flush_i    (flush_i),
    .hit_mask_i (hit_mask_i),
    .pos_bus_i  (pos_bus_i),
    .u_vec_i    (u_vec_i),
    .s1_rdy_i   (s1_rdy_i),
    .vld_o      (vld_o),
    .pos_o      (pos_o),
    .u_vec_o    (u_vec_o)
  );

  // ---------------------------------------------------------------------------
  // Clock & cycle counter
  // ---------------------------------------------------------------------------
  localparam int CLK_HALF_NS = 2;  // 250 MHz for sim; frequency doesn't affect functional checks
  int cycle;
  initial clk_i = 1'b0;
  always #(CLK_HALF_NS) clk_i = ~clk_i;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) cycle <= 0;
    else         cycle <= cycle + 1;
  end

  // ---------------------------------------------------------------------------
  // Test constants & expected values
  // ---------------------------------------------------------------------------
  localparam int               TEST_LANE = 5;
  localparam logic [POS_W-1:0] TEST_POS  = 10'h155;

  logic [POS_W-1:0]        exp_pos;
  logic [0:U_LEN-1][W-1:0] exp_u_hi2lo;    // expected u^T..u^0

  // Distinct driver variables (avoid ICPD):
  //  - k_init only used in the initial block
  //  - k_chk  only used in the checker always block
  int i;
  int k_init;
  int k_chk;

  // Handshake flags
  bit test_armed;            // only written in initial, read in always
  int t_hit_cycle;           // only written in initial
  bit done_chk;              // only written in always, read in initial

  // ---------------------------------------------------------------------------
  // Initial stimulus (no variable declarations inside this block)
  // ---------------------------------------------------------------------------
  initial begin
    // defaults
    rst_ni     = 1'b0;
    flush_i    = 1'b0;
    s1_rdy_i   = 1'b1;   // downstream always ready
    hit_mask_i = '0;

    // clear input buses
    for (i = 0; i < LANES; i++) begin
      pos_bus_i[i] = '0;
      for (k_init = 0; k_init < U_LEN; k_init++) begin
        u_vec_i[i][k_init] = '0;
      end
    end

    test_armed = 1'b0;
    done_chk   = 1'b0;

    // release reset
    repeat (5) @(posedge clk_i);
    rst_ni = 1'b1;
    repeat (3) @(posedge clk_i);

    // prepare payload for TEST_LANE
    pos_bus_i[TEST_LANE] = TEST_POS;
    for (k_init = 0; k_init < U_LEN; k_init++) begin
      // define u^k = (k+1)
      u_vec_i[TEST_LANE][k_init] = (k_init+1) & ((1<<W)-1);
      // expected reversed output: u^T..u^0
      exp_u_hi2lo[k_init] = u_vec_i[TEST_LANE][U_LEN-1-k_init];
    end
    exp_pos = TEST_POS;

    // one-cycle hit pulse
    @(posedge clk_i);
    hit_mask_i = '0;
    hit_mask_i[TEST_LANE] = 1'b1;
    t_hit_cycle = cycle;
    test_armed  = 1'b1;

    @(posedge clk_i);
    hit_mask_i = '0;  // deassert after one cycle

    // wait until checker finishes
    wait (done_chk == 1'b1);
    $display("[TB] PASS: basic single-lane check done.");
    $finish;
  end

  // ---------------------------------------------------------------------------
  // Checker (edge-aligned to clk). Use 'always', and give k_chk its own driver.
  // ---------------------------------------------------------------------------
  always @(posedge clk_i) begin
    if (rst_ni && test_armed) begin
      // vld_o must NOT assert before expected cycle (t_hit+2)
      if (cycle < (t_hit_cycle + 2)) begin
        if (vld_o === 1'b1) begin
          $error("[TB] EARLY vld_o asserted at cycle %0d (expected at %0d)",
                 cycle, t_hit_cycle+2);
          $fatal;
        end
      end

      // At t_hit+2, vld_o should assert with correct payload
      if (cycle == (t_hit_cycle + 2)) begin
        if (vld_o !== 1'b1) begin
          $error("[TB] vld_o NOT asserted at cycle %0d (expected %0d)",
                 cycle, t_hit_cycle+2);
          $fatal;
        end
        if (pos_o !== exp_pos) begin
          $error("[TB] pos mismatch @%0d: got 0x%0h, exp 0x%0h",
                 cycle, pos_o, exp_pos);
          $fatal;
        end
        for (k_chk = 0; k_chk < U_LEN; k_chk++) begin
          if (u_vec_o[k_chk] !== exp_u_hi2lo[k_chk]) begin
            $error("[TB] u_vec_o[%0d] mismatch @%0d: got 0x%0h, exp 0x%0h",
                   k_chk, cycle, u_vec_o[k_chk], exp_u_hi2lo[k_chk]);
            $fatal;
          end
        end
        $display("[TB] OK @cycle %0d : vld_o=1, pos=0x%0h, u_vec reversed matched.",
                 cycle, pos_o);
        done_chk <= 1'b1;  // set completion flag (single driver: this block)
      end
    end
  end

      // -------------------------------- fsdb ------------------------------
    initial begin
        $fsdbDumpfile("./dump.fsdb");
        $fsdbDumpvars("+all");
        $fsdbDumpMDA;
    end

endmodule
