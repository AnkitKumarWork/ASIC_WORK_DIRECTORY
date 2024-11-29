`timescale 1ns/1ps
module sipo_shift_reg #(parameter N = 4)(
    input serial_in,
    input clk,
    input en,
    output reg [N-1:0] parallel_out);

    always@(posedge clk) 
        begin
            if(en)
                begin
                    parallel_out <= {parallel_out[N-2:0],serial_in};
                end
            else
                parallel_out  <= 'b0000;
       end
     endmodule