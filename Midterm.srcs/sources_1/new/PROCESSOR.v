`timescale 1ns / 1ps

module PROCESSOR
(
    input clk, reset,
    output [31:0] writedata,
    output [31:0] dataaddr,
    output memwrite    
);

    wire [31:0] pc;
    wire [31:0] instr;
    wire [31:0] readdata;
    
    
    // MIPS
    MIPS mips(clk, reset, pc, instr, memwrite, dataaddr, writedata, readdata);
    // instruction memory
    IM imem(pc[7:2], instr);
    // data memory
    DM dmem(clk, memwrite, dataaddr, writedata, readdata);

endmodule
