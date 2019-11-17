`timescale 1ns / 1ps

//32 bit wide and 6 bit instruction memory array

module DM
(
    input clk,
    input we,              // write enable
    input [31:0] addr,      // address  
    input [31:0] wd,       // write data
    output [31:0] rd       // read data
);
    integer i;
    reg [31:0] DATA_RAM[127:0];
    assign rd = DATA_RAM[addr[6:0]]; //[31:2]
    
    initial
    begin
       for (i = 0; i < 128; i=i+1)
       DATA_RAM[i] = 0;
    end
    
    always @ (posedge clk)
    begin
        if (we) DATA_RAM[addr] <= wd;
    end
    
endmodule
