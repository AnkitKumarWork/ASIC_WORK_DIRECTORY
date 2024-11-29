`timescale 1ns / 1ps
module sequence_detector( // Moore machine
    input clk,
    input rst,
    input data_in,
    output reg detected_bit,
    output reg sequence_detected // 1 detected, 0 not detected
);
    reg [2:0] ps, ns;

    parameter s0 = 3'b000,
              s1 = 3'b001,
              s2 = 3'b010,
              s3 = 3'b011,
              s4 = 3'b100;

    // Sequential block for state transition
    always @(posedge clk or posedge rst) begin
        if (rst) 
            ps <= s0;
        else
            ps <= ns;
    end

    // Combinational block for next state logic
    always @(*) begin
        case (ps)
            s0: ns = (data_in == 1'b1) ? s1 : s0;
            s1: ns = (data_in == 1'b0) ? s2 : s1;
            s2: ns = (data_in == 1'b1) ? s3 : s1;
            s3: ns = (data_in == 1'b0) ? s4 : s1;
            s4: ns = s0;
            default: ns = s0;
        endcase
    end

    // Combinational block for output logic
    always @(ps) begin
        detected_bit = 1'b0;
        sequence_detected = 1'b0;
        case (ps)
            s0: detected_bit = 1'b1;
            s1: detected_bit = 1'b0;
            s2: detected_bit = 1'b1;
            s3: detected_bit = 1'b0;
            s4: sequence_detected = 1'b1;
        endcase
    end
endmodule
