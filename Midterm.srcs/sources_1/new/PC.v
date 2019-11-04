`timescale 1ns / 1ps

module PC
(
    output reg [31:0] dout,
    input [31:0] din,
    input clk,
    input control
);

    always @ (posedge clk)
    begin
        dout <= dout + 1;
    end
    
    always @ (negedge clk)
    begin
        if (control == 1)
        begin
            dout <= din;
        end
    end;
    
    initial
    begin
        dout = 32'b11111111_11111111_11111111_11111111;
    end
endmodule
