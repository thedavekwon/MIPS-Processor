`timescale 1ns / 1ps

module pipeFD
(
    input clk, reset,
    input PCPlus4F,
    input readdata,
    output PCPlus4D,
    output instrD
);

    FLOPR#(32) pcplus(clk, reset, PCPlus4F, PCPlus4D);
    FLOPR#(32) instr(clk, reset, readdata, instrD);

endmodule
