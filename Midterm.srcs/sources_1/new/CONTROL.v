`timescale 1ns / 1ps

module CONTROL
(
    input [5:0] opcode,
    input [5:0] funct,
    input zero,
    output memtoreg, memwrite,
    output pcsrc, alusrc,
    output regdst, regwrite,
    output jump,
    output [2:0] alucontrol
);

    reg [1:0] aluop;
    reg branch;
    
    MAINDEC md(opcode, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
    ALUDEC ad(funct, aluop, alucontrol);
    
    assign pcsrc = branch & zero;
endmodule
