`timescale 1ns / 1ps

module ANY_MUX_tb;
   // Parameters for the multiplexer
   parameter N = 4;
   parameter P = $clog2(N);

   // Inputs and output for the testbench
   reg [N-1:0] I;
   reg [P-1:0] S;
   wire Y;

   // Instantiate the ANY_MUX module
   ANY_MUX #(N, P) uut (
      .I(I),
      .S(S),
      .Y(Y)
   );


   initial begin
      // Initialize inputs
      I = 4'b0000; S = 0;
      #10; 

      // Test all possible select values
      I = 4'b1010; S = 0; #10; // Y should be I[0] = 1
      I = 4'b1010; S = 1; #10; // Y should be I[1] = 0
      I = 4'b1010; S = 2; #10; // Y should be I[2] = 1
      I = 4'b1010; S = 3; #10; // Y should be I[3] = 0
      $finish;
   end

   // Monitor changes to inputs and output
   initial begin
      $monitor("Time = %0t | I = %b | S = %b | Y = %b", $time, I, S, Y);
   end
endmodule
