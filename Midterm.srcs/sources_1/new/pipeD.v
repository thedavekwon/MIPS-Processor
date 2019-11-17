`timescale 1ns / 1ps
module pipeDE
(
    input clk,
    input reset,
    input RegWriteD,
    input MemtoRegD,
    input MemWriteD,
    input BranchD,
    input ALUControlD,
    input ALUSrcD,
    input RegDstD,
    input PCPlus4D,
    input RsD,
    input RtD,
    input RdD,
    input SignImmD,
    input rd1D,
    input rd2D,
    output RegWriteE,
    output MemtoRegE,
    output MemWriteE,
    output BranchE,
    output ALUControlE,
    output AlUSrcE,
    output RegDstE,
    output PCPlus4E,
    output RtE,
    output RdE,
    output SignImmE,
    output rd1E,
    output rd2E
);

    FLOPR#(1) regwrite(clk, reset, RegWriteD, RegWriteE);
    FLOPR#(1) memtoreg(clk, reset, MemtoRegD, MemtoRegE);
    FLOPR#(1) memwrite(clk, reset, MemWriteD, MemWriteE);
    FLOPR#(1) branch(clk, reset, BranchD, BranchE);
    FLOPR#(2) alucontrol(clk, reset, ALUControlD, ALUControlE);
    FLOPR#(1) alusrc(clk, reset, ALUSrcD, AlUSrcE);
    FLOPR#(1) regdst(clk, reset, RegDstD, RegDstE);
    FLOPR#(5) rt(clk, reset, RtD, RtE);
    FLOPR#(5) rd(clk, reset, RdD, RdE);
    FLOPR#(32) sign(clk, reset, SignImmD, SignImmE);
    FLOPR#(32) plus4(clk, reset, PCPlus4D, PCPlus4E);
    FLOPR#(32) rd1(clk, reset, rd1D, rd1E);
    FLOPR#(32) rd2(clk, reset, rd2D, rd2E);
    
endmodule
