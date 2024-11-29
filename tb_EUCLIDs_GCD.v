`timescale 1ns / 1ps
module tb_EUCLIDs_GCD;
    reg [31:0] a, b;
    reg clk, rst;
    wire [31:0] out;

    // Instantiate the GCD module
    EUCLIDs_GCD uut (
        .a(a),
        .b(b),
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Monitor the values
    initial begin
        $monitor("Time: %0t | a: %d, b: %d, temp_a: %d, temp_b: %d, out: %d, state: %b",
                 $time, a, b, uut.temp_a, uut.temp_b, out, uut.ps);
    end

    // Testbench procedure
    initial begin
        // Test case 1
        rst = 1; a = 0; b = 0; #10;
        rst = 0; a = 56; b = 98; #100;
        $display("Test case 1: a = %d, b = %d, GCD = %d", a, b, out);

        // Test case 2
        rst = 1; #10;
        rst = 0; a = 48; b = 18; #100;
        $display("Test case 2: a = %d, b = %d, GCD = %d", a, b, out);

        // Test case 3
        rst = 1; #10;
        rst = 0; a = 101; b = 103; #100;
        $display("Test case 3: a = %d, b = %d, GCD = %d", a, b, out);

        $finish; // End simulation
    end
endmodule
