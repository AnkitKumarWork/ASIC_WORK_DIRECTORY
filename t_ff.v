 module t_flip_flop(input T, input clk, input reset, output reg Q);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else if (T)
            Q <= ~Q;
    end
 endmodule
