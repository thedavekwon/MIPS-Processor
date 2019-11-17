`timescale 1ns / 1ps

// 32 32bit registers
module RF
(
    input clk,                         
    input we3,                      // write enable
    input [4:0] ra1, ra2, wa3,      // 
    input [31:0] wd3,               //
    output [31:0] rd1, rd2,          // read data 1 and read data 2
    output [7:0] showreg,
    input [6:0] showaddr
);
   integer i;
   
   reg [31:0] rf [31:0];
   initial
   begin
       for (i = 0; i < 32; i=i+1)
       rf[i] = 0;
   end
   
   always @ (posedge clk)
       if (we3) rf[wa3] <= wd3;
   
   assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
   assign rd2 = (ra2 != 0) ? rf[ra2] : 0;
   assign showreg = rf[showaddr];
endmodule
