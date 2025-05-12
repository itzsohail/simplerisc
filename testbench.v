`timescale 1ns / 1ps

module testbench;
    reg clk;
    reg rst;
top_module uut (clk,rst );
    initial
     begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial
     begin
        $display("Starting testbench...");
        rst = 1;
        #10;
        rst = 0;
        #200;
        $display("Testbench completed.");
        $finish;
    end
endmodule
