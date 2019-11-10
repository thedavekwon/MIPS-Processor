`timescale 1ns / 1ps

module DATAPATH
(
    input clk, reset,
    input memtoreg, pcsrc,
    input alusrc, regdst,
    input regwrite, jump,
    input [2:0] alucontrol,
    output zero,
    output [31:0] pc,
    input [31:0] instr,
    output [31:0] aluout, writedata,
    input [31:0] readdata
);
    // writereg : reg writing to at register file
    wire [4:0] writereg;
    
    // pcplus4  : current pc + 4
    // pcnext   : next pc
    // pcnextbr : pc selected from mux (real pc)
    // pcbranch : pcplus4 + signimm shfited
    wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
    
    // signimm   : sign extended from last 16 bit from instruction
    // signimmsh : signimm shifted
    wire [31:0] signimm, signimmsh;
    
    wire [31:0] srca, srcb;
    
    // result : result writing to at register file
    wire [31:0] result;
    
    FLOPR#(32) pcreg(clk, reset, pcnext, pc);
    ADDER pcadd1(pc, 32'b100, pcplus4);
    SL2 immsh(signimm, signimmsh);
    ADDER pcadd2(pcplus4, signimmsh, pcbranch);
    MUX2#(32) pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
    MUX2#(32) pcmux(pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, jump, pcnext);
    
    // register file logic
    RF rf(clk, regwrite, instr[25:21], instr[20:16], writereg, result, srca, writedata);
    MUX2#(5) wrmux(instr[20:16], instr[15:11], regdst, writereg);
    MUX2#(32) resmux(aluout, readdata, memtoreg, result);
    SIGNEXT se(instr[15:0], signimm);
    
    // ALU
    // mux for immediate operation or not
    MUX2#(32) srcbmux(writedata, signimm, alusrc, srcb);
    ALU alu(srca, srcb, alucontrol, aluout, zero);
endmodule
