module sync_fifo_ram #(parameter ADDR_WIDTH = 4,
                       parameter DATA_WIDTH = 16)
                      (clk_i, rst_ni, wr_en, addr_in, data_in, addr_out,
                       data_out);
    input  wire clk_i;
    input  wire rst_ni;
    input  wire wr_en;
    input  wire [ADDR_WIDTH - 1 : 0] addr_in;
    input  wire [DATA_WIDTH - 1 : 0] data_in;
    input  wire [ADDR_WIDTH - 1 : 0] addr_out;
    output wire [DATA_WIDTH - 1 : 0] data_out;

    // ROM 存储体
    // (* rom_style = "block" *)
    
    logic  [DATA_WIDTH - 1 : 0] mem [0 : (1 << ADDR_WIDTH) - 1];

    // initial $readmemh("gf1024_inv_table.mem", rom); // 1024 行，每行 10bit hex

    integer  i;
    always @ (posedge clk_i or negedge rst_ni) begin
        if(!rst_ni) begin
            for(i = 0; i < (1 << ADDR_WIDTH); i = i + 1) begin : MEN_INITIAL
                mem[i] <= {(DATA_WIDTH){1'b0}};
            end
        end else if (wr_en) begin
            mem[addr_in] <= data_in;
        end 
    end

    assign data_out = mem[addr_out];

endmodule
