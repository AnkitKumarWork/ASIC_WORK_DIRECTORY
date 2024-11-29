`timescale 1ps/1ps
module parity_check #(parameter N = 4)
(
    input [N-1:0] data_in,
    output parity_out
);

assign parity_out = ~(^data_in); // XOR reduction operator

endmodule
