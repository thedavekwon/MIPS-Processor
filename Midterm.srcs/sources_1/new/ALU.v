`timescale 1ns / 1ps

module ALU
(
        input [31:0] srcA,
        input [31:0] srcB,
        input [2:0] alucontrol,
        output reg [31:0] aluresult,
        output reg zero
);
    
    always @ (srcA or srcB or alucontrol)
    begin
        zero <= 0;
        case(alucontrol) 
            3'b000 : aluresult <= srcA & srcB;
            3'b001 : aluresult <= srcA | srcB;
            3'b010 : aluresult <= srcA + srcB;
            3'b110 : aluresult <= srcA - srcB;
            3'b111 : if (srcA < srcB) zero<=1;
            default: aluresult <= 0;
        endcase
    end
endmodule
