`timescale 1ps/1ps
module tb_parity_check;
    reg [3:0] data_in;
    wire parity_out;

    parity_check  #(.N(4)) uut(
        .data_in(data_in),
        .parity_out(parity_out)
    );

    initial begin
        // Test cases
        data_in = 4'b0000; #10;
        data_in = 4'b0001; #10;
        data_in = 4'b0011; #10;
        data_in = 4'b0111; #10;
        data_in = 4'b1111; #10;
        $finish;
    end
endmodule
