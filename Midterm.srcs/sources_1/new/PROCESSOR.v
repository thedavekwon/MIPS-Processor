`timescale 1ns / 1ps

module PROCESSOR
(
    input wire clk, reset,
    output wire [7:0] showreg,
    input wire [6:0] showaddr,
    output wire [31:0] writedata,
    output wire [31:0] dataaddr,
    output wire memwrite
);

    wire [31:0] pc;
    wire [31:0] instr;
    wire [31:0] readdata;
    
    // MIPS
    MIPS mips(clk, reset, pc, instr, memwrite, dataaddr, writedata, readdata, showreg, showaddr);
    // instruction memory
    IM imem(pc[8:2], instr);
    // data memory
    DM dmem(clk, memwrite, dataaddr, writedata, readdata);

endmodule
