`timescale 1ns/1ps
module tb_up_down_countet;
parameter N = 4;
reg rst,clk;
reg up_down;
wire [N-1:0] count;

up_down_counter #(.N(4)) uut (.clk(clk), .rst(rst), .up_down(up_down), .count(count));

always #10 clk = ~clk;
initial begin
rst= 1'b1;
clk = 1'b0;
#10
rst = 1'b0;
#10
up_down = 1'b0;
#100;
up_down = 1'b1;
#100;
rst=1'b1;
#10;
end
endmodule

