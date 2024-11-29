`timescale 1ns / 1ps

module ANY_MUX_GateLevel_tb;
   // Parameters
   parameter N = 2;
   parameter P = $clog2(N);

   // Testbench Signals
   reg [N-1:0] I; // Data inputs (2-bit)
   reg [P-1:0] S; // Select lines (1-bit)
   wire Y;        // Output

   // Instantiate the ANY_MUX_GateLevel module
   ANY_MUX_GateLevel #(N, P) uut (
      .I(I),
      .S(S),
      .Y(Y)
   );

   // Testbench Procedure
   initial begin
      // Test cases for 2-bit multiplexer
      I = 2'b00; S = 0; #10; // Expect Y = I[0] = 0
      I = 2'b00; S = 1; #10; // Expect Y = I[1] = 0

      I = 2'b10; S = 0; #10; // Expect Y = I[0] = 1
      I = 2'b10; S = 1; #10; // Expect Y = I[1] = 0

      I = 2'b01; S = 0; #10; // Expect Y = I[0] = 0
      I = 2'b01; S = 1; #10; // Expect Y = I[1] = 1

      I = 2'b11; S = 0; #10; // Expect Y = I[0] = 1
      I = 2'b11; S = 1; #10; // Expect Y = I[1] = 1

      $stop; // End simulation
   end
endmodule
