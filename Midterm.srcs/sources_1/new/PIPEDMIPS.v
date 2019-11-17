`timescale 1ns / 1ps

module PIPEDMIPS
(
    input clk, reset,
    output [31:0] PCF,
    input [31:0] instrF,
    output memwrite,
    output [31:0] aluout,
    output [31:0] writedata,
    input [31:0] ReadDataM,
    output [7:0] showreg,
    input [6:0] showaddr
);
    
   
    wire [31:0] SignimmD, rd1D, rd2D, rd1E, rd2E;
    wire [31:0] PCPlus4F, PCPlus4D, PCPlus4E, instrD;
    wire jump, pcsrc, zero, RegDstD, RegWriteD, BranchD, MemtoRegD, MemWriteD, ALUSrcD;
    wire RegWriteE, MemtoRegE, MemWriteE, BranchE, AlUSrcE, RegDstE, PCBranchE, WriteRegE, zeroE, ALUOutE;
    wire [2:0] ALUControlD, ALUControlE;
    wire [5:0] RtE, RdE;
    
    wire RegWriteM, MemtoRegM, MemWriteM, BranchM, PCBranchM, WriteRegM, zeroM, ALUOutM;
    wire RegWriteW, MemtoRegW, WriteRegW, ALUOutW;
    wire [31:0] ReadDataW;
    
    PIPEDCONTROL ctrl(instrD[31:26], instrD[5:0], zero, RegWriteD, BranchD, MemtoRegD, MemWriteD, ALUSrcD, ALUControlD, RegDstD);
    
    PIPEDDATAPATH dp(clk, reset, PCF, instrD, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUControlE, ALUSrcE, RegDstE, RtE, RdE, SignImmE, PCPlus4E, PCBranchE, PCBranchM,
                     WriteRegE, WriteRegM, RegWriteW, WriteRegW, ZeroE, ZeroM, BranchM, rd1D, rd2D, rd1E, rd2E, ALUOutE, ALUOutM, ALUOutW, MemtoRegW);
    
    ADDER pcadd1(PCF, 32'b100, PCPlus4F);
    SIGNEXT se(instrF[15:0], SignimmD);

    pipeFD fd(clk, reset, PCPlus4F, instrF, PCPlus4D, instrD);
    pipeDE de(clk, reset, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUControlD, ALUSrcD, RegDstD, PCPlus4D, instrD[20:16], instrD[15:11], SignimmD, rd1D, rd2D, RegWriteE, 
                MemtoRegE, MemWriteE, BranchE, ALUControlE, AlUSrcE, RegDstE, PCPlus4E, RtE, RdE, SignimmD, rd1E, rd2E);
    pipeEM em(clk, reset, RegWriteE, MemtoRegE, MemWriteE, BranchE, PCBranchE, WriteRegE, ZeroE, ALUOutE, RegWriteM, MemtoRegM, MemWriteM, BranchM, PCBranchM, WriteRegM, ZeroM, ALUOutM);
    pipeMW mw(clk, reset, RegWriteM, MemtoRegM, WriteRegM, ALUOutM, ReadDataM, RegWriteW, MemtoRegW, WriteRegW, ALUOutW, ReadDataW);

endmodule
