 module tb_t_flip_flop;
   reg T, clk, reset;
   wire Q;
   t_flip_flop uut (.T(T), .clk(clk), .reset(reset), .Q(Q));
   always #5 clk = ~clk;
   initial begin
       clk = 0; reset = 1; T = 0;
       #10 reset = 0; T = 1; #10;
       T = 0; #10;
       T = 1; #10;
       $stop;
   end
endmodule