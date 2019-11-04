`timescale 1ns / 1ps

//32 bit wide and 10 bit height instruction memory

module IM
(
    input [5:0] addr,      // address
    output [31:0] rd        // read data
);

    reg [31:0] INSTUCT_RAM [63:0];
    initial
        $readmemb ("INSTUCT_RAM.mem", INSTUCT_RAM, 0, 64);
    
    assign rd = INSTUCT_RAM[addr[9:0]];
endmodule
