`timescale 1ns / 1ps

module ANY_MUX_GateLevel #(parameter N = 2, // Number of inputs
                           parameter P = $clog2(N)) // Number of select lines
   (
    input [N-1:0] I,       // Data inputs
    input [P-1:0] S,       // Select lines
    output Y               // Output
   );

   wire [N-1:0] and_out; // Outputs of AND gates

   // Generate AND gates for each input and select combination
   genvar i;
   generate
      for (i = 0; i < N; i = i + 1) begin : and_gates
         assign and_out[i] = (S == i) ? I[i] : 1'b0; // Simplified selection logic
      end
   endgenerate

   // OR gate to combine all AND gate outputs
   assign Y = |and_out; // OR all AND gate outputs

endmodule
