`timescale 1ns / 1ps

module MAINDEC
(
    input [5:0] opcode,
    output memtoreg, memwrite,
    output branch, alusrc,
    output regdst, regwrite,
    output jump,
    output [1:0] aluop
);
    
    reg [8:0] controls;
    assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop} = controls;
    
    always @ (*)
        case(opcode)
            6'b000000: controls <= 9'b110000010; // RTYPE   assign
            6'b100011: controls <= 9'b101001000; // LW      load word from memory to regsiter
            6'b101011: controls <= 9'b001010000; // SW      save word from register to memory
            6'b000100: controls <= 9'b000100001; // BEQ     branch if equal
            6'b001000: controls <= 9'b101000000; // ADDI    add immediate
            6'b000010: controls <= 9'b000000000; // J       load immediate to pc
            default:   controls <= 9'bxxxxxxxxx; // illegal
        endcase
endmodule
