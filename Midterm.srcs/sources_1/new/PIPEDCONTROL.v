`timescale 1ns / 1ps

module PIPEDCONTROL
(
    input [5:0] opcode,
    input [5:0] funct,
    input zero,
    output RegWriteD, BranchD,
    output MemtoRegD, MemWriteD,
    output ALUSrcD,
    output [2:0] ALUControlD,
    output RegDstD
);

    wire [1:0] aluop;
    
    MAINDEC md(opcode, MemtoRegD, MemWriteD, BranchD, ALUSrcD, RegDstD, RegWriteD, jump, aluop);
    ALUDEC ad(funct, aluop, ALUControlD);
endmodule
