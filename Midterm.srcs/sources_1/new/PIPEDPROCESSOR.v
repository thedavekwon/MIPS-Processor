`timescale 1ns / 1ps

module PIPEDPROCESSOR
(
    input wire clk, reset,
    output wire [31:0] writedata,
    output wire [31:0] dataaddr,
    output wire memwrite,
    output wire [7:0] showreg,
    input wire [6:0] showaddr
);

    wire [31:0] PCF;
    wire [31:0] instrF;
    wire [31:0] ReadDataM;
    
    
    // MIPS
    PIPEDMIPS mips(clk, reset, PCF, instrF, memwrite, dataaddr, writedata, readdata, showreg, showaddr);
    // instruction memory
    IM imem(PCF[7:2], instrF);
    
    // data memory
    DM dmem(clk, memwrite, dataaddr, writedata, ReadDataM);

endmodule
