 module tb_sipo_shift_reg;
    reg clk, en, serial_in;
    wire [3:0] parallel_out;
    sipo_shift_reg  uut (.clk(clk), .en(en), .serial_in(serial_in), .parallel_out(parallel_out));
    always #5 clk = ~clk;
    initial begin
        clk = 0; en = 0; serial_in = 0;
        #10 en = 1; serial_in = 1;
        #10 serial_in = 0; 
        #10 serial_in = 1; 
        #10 serial_in = 1;
        #10 en = 0;
        #20 $stop;
    end
 endmodule