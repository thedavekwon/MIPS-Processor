`timescale 1ns / 1ps

//32 bit wide and 6 bit instruction memory array

module IM
(
    input [5:0] addr,      // address
    output [31:0] rd        // read data
);

    reg [31:0] INSTUCT_RAM [63:0];
    initial
        $readmemh ("instruction_mem.mem", INSTUCT_RAM);
    
    assign rd = INSTUCT_RAM[addr];
endmodule