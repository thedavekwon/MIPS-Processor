`timescale 1ns / 1ps
module PIPEDDATAPATH
(
    input clk, reset, PCF,
    input [31:0] instrD,
    input RegWriteE, MemtoRegE,
    input MemWriteE, BranchE,
    input ALUControlE,
    input ALUSrcE, RegDstE,
    input RtE, RdE,
    input SignImmE, PCPlus4E,
    output PCBranchE,
    input PCBranchM,
    input WriteRegE,
    output WriteRegM,
    input RegWriteW,
    input WriteRegW,
    output zeroE,
    input zeroM,
    input BranchM,
    output rd1D,
    output rd2D,
    input rd1E,
    input rd2E,
    output ALUOutE,
    input ALUOutM,
    input ALUOutW,
    input MemtoRegW
);
    // writereg : reg writing to at register file
    wire [4:0] Wree;
    
    // pcplus4  : current pc + 4
    // pcnext   : next pc
    // pcnextbr : pc selected from mux (real pc)
    // pcbranch : pcplus4 + signimm shfited
    wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
    
    // signimm   : sign extended from last 16 bit from instruction
    // signimmsh : signimm shifted
    wire [31:0] signimm, signimmsh;
    
    wire [31:0] SrcBE;
    
    // result : result writing to at register file
    wire [31:0] result;
    
    
    FLOPR#(32) pcreg(clk, reset, pcnext, PCF);

    SL2 immsh(signimm, signimmsh);
    ADDER pcadd2(PCPlus4E, signimmsh, PCBranchE);
    MUX2#(32) pcmux(PCPlus4F, PCBranchM, PCSrcM, pcnext);
    
    // register file logic
    and(PCSrcM, BranchM, ZeroM);
    and(ALUOutW, ReadDataW, MemtoRegW);
    
    RF rf(clk, RegWriteW, instrD[25:21], instrD[20:16], WriteRegW, ResultW, rd1D, rd2D, showreg, showaddr);
    MUX2#(5) wrmux(RtE, RdE, RegDstE, WriteRegE);
    MUX2#(32) resmux(aluout, readdata, memtoreg, result);
    
    // ALU
    // mux for immediate operation or not
    MUX2#(32) srcbmux(rd2E, SignImmE, ALUSrcE, SrcBE);
    ALU alu(rd1E, SrcBE, ALUControlE, ALUOutE, zeroE);
endmodule
