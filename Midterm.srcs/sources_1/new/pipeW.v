`timescale 1ns / 1ps

module pipeMW
(
    input clk,
    input reset,
    input RegWriteM,
    input MemtoRegM,
    input WriteRegM,
    input ALUOutM,
    input ReadDataM,
    output RegWriteW,
    output MemtoRegW,
    output WriteRegW,
    output ALUOutW,
    output ReadDataW
);

    FLOPR#(1) regwrite(clk, reset, RegWriteM, RegWriteW);
    FLOPR#(1) memtoreg(clk, reset, MemtoRegM, MemtoRegW);
    FLOPR#(5) writereg(clk, reset, WriteRegM, WriteRegW);
    FLOPR#(32) aluout(clk, reset, ALUOutM, ALUOutW);
    FLOPR#(32) readata(clk, reset, ReadDataM, ReadDataW);
endmodule
