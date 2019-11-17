`timescale 1ns / 1ps

module testbench();

    reg clk;
    reg reset;
    reg [7:0] showreg;
    reg [6:0] showaddr;
    
    wire [31:0] writedata;
    wire [31:0] dataaddr;
    wire memwrite;
    
    PIPEDPROCESSOR processor(clk, reset, writedata, dataaddr, memwrite, showreg, showaddr);
    
    initial
    begin
        reset <= 1; 
        #22;
        reset <= 0;
    end
        
    always
    begin
        clk <= 1;
        #5;
        clk <= 0;
        #5;
    end
    
    always @(negedge clk)
    begin
        if (memwrite)
        begin
            if (dataaddr == 84 && writedata == 7)
            begin
                $display("Simulation Succeeded");
                $stop;
            end
            else if (dataaddr != 80)
            begin
                $display("Simulation Failed");
                $stop;
            end
        end
    end
endmodule
