`timescale 1ns / 1ps

module tb_jk_flip_flop;
    reg J, K, clk, reset;
    wire Q, Q_bar;
    jk_flip_flop uut (.J(J), .K(K), .clk(clk), .reset(reset), .Q(Q), .Q_bar(Q_bar));
    always #5 clk = ~clk;
    initial begin
        clk = 0; reset = 1; J = 0; K = 0;
        #10 reset = 0; J = 1; K = 0; #10;
        J = 0; K = 1; #10;
        J = 1; K = 1; #10;
        $stop;
    end
 endmodule