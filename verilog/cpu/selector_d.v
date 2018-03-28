module selector_d(s0, s1, in0, in1, in2, in3, out);

// input :  output
// s1 s0
//  0  0 -> in0
//  0  1 -> in1
//  1  0 -> in2
//  1  1 -> in3

input s0, s1;
input [3:0] in0, in1, in2, in3;
output[3:0] out;

wire s0, s1;
wire [3:0] in0, in1, in2, in3;
wire [3:0] out;

assign out = func_selector(s0, s1, in0, in1, in2, in3);

function [3:0] func_selector;
    input s0, s1;
    input [3:0] in0, in1, in2, in3;

    if (s0 == 1'b0 && s1 == 1'b0) begin
        func_selector = in0;
    end else if (s0 == 1'b1 && s1 == 1'b0) begin
        func_selector = in1;
    end else if (s0 == 1'b0 && s1 == 1'b1) begin
        func_selector = in2;
    end else if (s0 == 1'b1 && s1 == 1'b1) begin
        func_selector = in3;
    end
endfunction

endmodule
