`timescale 1ns / 1ps

module MIPS
(
    input clk, reset,
    output [31:0] pc,
    input [31:0] instr,
    output memwrite,
    output [31:0] aluout,
    output [31:0] writedata,
    input [31:0] readdata,
    output [7:0] showreg,
    input [6:0] showaddr
);

    wire memtoreg;
    wire alusrc, regdst, regwrite, jump, pcsrc, zero;
    wire [2:0] alucontrol;
    
    CONTROL ctrl(instr[31:26], instr[5:0], zero, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
    DATAPATH dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, zero, pc, instr, aluout, writedata, readdata, showreg, showaddr);

endmodule
