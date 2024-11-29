`timescale 1ns/1ps
module up_down_counter #(parameter N = 4) ( 
    input clk,
    input rst,
    input up_down,
    output reg [N-1:0] count);
    
reg [N-1:0] temp_count;

always @(posedge rst or posedge clk ) 
    begin
        if (rst)
            count <= 'b0;
        else  begin
                    if(up_down)
                        count = count-1;
                    else 
                        count = count+1;
              end
    end
endmodule
            
            