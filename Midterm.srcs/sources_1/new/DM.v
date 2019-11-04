`timescale 1ns / 1ps

module DM
(
    input clk,
    input we,              // write enable
    input [4:0] addr,      // address  
    input [31:0] wd,       // write data
    output [31:0] rd       // read data
);

    reg [31:0] DATA_RAM[1023:0];
    assign rd = DATA_RAM[addr];

    always @ (posedge clk)
    begin
        if (we)
        begin
            DATA_RAM[addr] <= wd;
        end
    end

endmodule
