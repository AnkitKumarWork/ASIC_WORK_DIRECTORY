`timescale 1ns / 1ps

module sequence_detector_tb;

    // Inputs
    reg clk;
    reg rst;
    reg data_in;

    // Outputs
    wire detected_bit;
    wire sequence_detected;

    // Instantiate the Unit Under Test (UUT)
    sequence_detector uut (
        .clk(clk), 
        .rst(rst), 
        .data_in(data_in), 
        .detected_bit(detected_bit), 
        .sequence_detected(sequence_detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        data_in = 0;

        // Wait for global reset
        #10;
        rst = 0;

        // Apply test vectors
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;

        // Add more test vectors as needed
        #100;
        $stop;
    end

    initial begin
        $monitor("Time = %0t, clk = %b, rst = %b, data_in = %b, detected_bit = %b, sequence_detected = %b", 
                 $time, clk, rst, data_in, detected_bit, sequence_detected);
    end
      
endmodule
