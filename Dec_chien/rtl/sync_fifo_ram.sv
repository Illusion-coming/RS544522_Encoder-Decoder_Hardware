`timescale 1ps/1ps
`default_nettype none

module sync_fifo_ram #(parameter ADDR_WIDTH = 4,
                       parameter DATA_WIDTH = 16)
                      (aclk, aresetn, wr_en, addr_in, data_in, addr_out,
                       data_out);
    input  wire aclk;
    input  wire aresetn;
    input  wire wr_en;
    input  wire [ADDR_WIDTH - 1 : 0] addr_in;
    input  wire [DATA_WIDTH - 1 : 0] data_in;
    input  wire [ADDR_WIDTH - 1 : 0] addr_out;
    output wire [DATA_WIDTH - 1 : 0] data_out;

    logic  [DATA_WIDTH - 1 : 0] mem [0 : (1 << ADDR_WIDTH) - 1];


    integer  i;
    always @ (posedge aclk or negedge aresetn) begin
        if(!aresetn) begin
            for(i = 0; i < (1 << ADDR_WIDTH); i = i + 1) begin : MEN_INITIAL
                mem[i] <= {(DATA_WIDTH){1'b0}};
            end
        end else if (wr_en) begin
            mem[addr_in] <= data_in;
        end 
    end

    assign data_out = mem[addr_out];

endmodule

`resetall