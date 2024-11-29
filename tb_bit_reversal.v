 `timescale 1ns/1ps
 module tb_bit_reversal;
    reg [7:0] data_in;
    wire [7:0] data_out;
    bit_reversal uut (.data_in(data_in), .data_out(data_out));
    initial begin
        $monitor("Data = %b, Reversed = %b", data_in, data_out);
        data_in = 8'b10110011; #10;
        data_in= 8'b11111111; #10;
        data_in = 8'b00000001; #10;
        data_in = 8'b10000000; #10;
        $stop;
    end
 endmodule