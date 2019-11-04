`timescale 1ns / 1ps

module processor
(
    input clk,
    input reset,
    output [31:0] pc,
    input [31:0] instr,
    output memwrite,
    output [31:0] aluout,
    output [31:0] writedata,
    input [31:0] readdata
);

    reg memtoreg, alusrc, regdst, regwrite, jump, pcsrc, zero;
    reg [2:0] alucontrol;
    
    controller ctrl(instr[31:25], instr[5:0], zero, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
    datapath dp(clk, reset, memtroreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, zero, pc, instr, aluout, writedata, readdata);

endmodule
