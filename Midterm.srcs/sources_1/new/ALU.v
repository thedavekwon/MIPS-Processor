`timescale 1ns / 1ps

module ALU
(
        input [31:0] srcA,
        input [31:0] srcB,
        input [2:0] alucontrol,
        output reg [31:0] aluout,
        output reg zero
);
    
    always @ (srcA or srcB or alucontrol)
    begin
        case(alucontrol) 
            3'b000 : aluout <= srcA & srcB;
            3'b001 : aluout <= srcA | srcB;
            3'b010 : aluout <= srcA + srcB;
            3'b110 : aluout <= srcA - srcB;
            3'b111 : if (srcA < srcB) 
                     begin
                        aluout <= 1;
                     end
                     else
                     begin
                        aluout <= 0;
                     end
            default: aluout <= 0;
        endcase
    end
    
    always @ (aluout) begin
        if (aluout == 0) begin
            zero <= 1;
        end else begin
            zero <= 0;
        end
    end
endmodule
