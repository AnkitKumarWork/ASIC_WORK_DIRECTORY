`timescale 1ns / 1ps
module ANY_MUX #(parameter N = 4,
                 parameter P = $clog2(N))
   (
    input [N-1 : 0] I,
    input [P-1 : 0] S,
    output reg Y
   );

   always @(*) begin
      case (S)
         0: Y = I[0];
         1: Y = I[1];
         2: Y = I[2];
         3: Y = I[3];
         // Extend case statements as needed for larger N
         // For example, if N = 8, you would add cases for 4, 5, 6, 7
         default: Y = I[0]; // Default case to handle unexpected values
      endcase
   end
endmodule
