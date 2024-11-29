`timescale 1ns / 1ps
module EUCLIDs_GCD #(parameter N = 32)(
    input [N-1:0] a,
    input [N-1:0] b,
    input clk, 
    input rst,
    output reg [N-1:0] out
);
    reg [N-1:0] temp_a, temp_b;
    reg [1:0] ps, ns;

    // State parameters
    parameter idle = 2'b00,
              compare = 2'b01,
              finish = 2'b10;

    // State transition logic (sequential)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ps <= idle;
            temp_a <= 0;
            temp_b <= 0;
            out <= 0;
        end else begin
            ps <= ns;
            // Update temp_a and temp_b only in the compare state
            if (ps == idle) begin
                temp_a <= a;
                temp_b <= b;
            end else if (ps == compare) begin
                if (temp_a > temp_b) begin
                    temp_a <= temp_a - temp_b;
                end else if (temp_a < temp_b) begin
                    temp_b <= temp_b - temp_a;
                end
            end else if (ps == finish) begin
                out <= (temp_a == 0) ? temp_b : temp_a;
            end
        end
    end

    // Next state logic (combinational)
    always @(*) begin
        case (ps)
            idle: ns = compare;
            compare: ns = (temp_a == temp_b) ? finish : compare;
            finish: ns = idle;
            default: ns = idle;
        endcase
    end
endmodule
