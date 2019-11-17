`timescale 1ns / 1ps
module pipeEM
(
    input clk,
    input reset,
    input RegWriteE,
    input MemtoRegE,
    input MemWriteE,
    input BranchE,
    input PCBranchE,
    input WriteRegE,
    input ZeroE,
    input ALUOutE, 
    output RegWriteM,
    output MemtoRegM,
    output MemWriteM,
    output BranchM,
    output PCBranchM,
    output WriteRegM,
    output ZeroM,
    output ALUOutM
);

    FLOPR#(1) regwrite(clk, reset, RegWriteE, RegWriteM);
    FLOPR#(1) memtoreg(clk, reset, MemtoRegE, MemtoRegM);
    FLOPR#(1) memwrite(clk, reset, MemWriteE, MemWriteM);
    FLOPR#(1) branch(clk, reset, BranchE, BranchM);
    FLOPR#(1) pcbranch(clk, reset, PCBranchE, PCBranchM);
    FLOPR#(5) writereg(clk, reset, WriteRegE, WriteRegM);
    FLOPR#(1) zero(clk, reset, ZeroE, ZeroM);
    FLOPR#(32) aluout(clk, reset, ALUOutE, ALUOutM);
    
endmodule
