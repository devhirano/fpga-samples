module selector(s0, s1, in1, in2, out1, out2);

// input :  output
// s1 s0
//  0  0 -> 101[0] 110[0]
//  0  1 -> 10[1]0 11[0]0
//  1  0 -> 1[0]10 1[1]00
//  1  1 -> [1]010 [1]100

input s0, s1;
input [3:0] in1, in2;
output out1, out2;

wire s0, s1;
wire [3:0] in1, in2;
wire out1, out2;

assign out1 = func_selector1(s0, s1, in1);
assign out2 = func_selector2(s0, s1, in2);

function func_selector1;
    input s0, s1;
    input [3:0] in1;

    if (s0 == 1'b0 && s1 == 1'b0) begin
        func_selector1 = in1[0];
    end else if (s0 == 1'b1 && s1 == 1'b0) begin
        func_selector1 = in1[1];
    end else if (s0 == 1'b0 && s1 == 1'b1) begin
        func_selector1 = in1[2];
    end else if (s0 == 1'b1 && s1 == 1'b1) begin
        func_selector1 = in1[3];
    end
endfunction

function func_selector2;
    input s0, s1;
    input [3:0] in2;

    if (s0 == 1'b0 && s1 == 1'b0) begin
        func_selector2 = in2[0];
    end else if (s0 == 1'b1 && s1 == 1'b0) begin
        func_selector2 = in2[1];
    end else if (s0 == 1'b0 && s1 == 1'b1) begin
        func_selector2 = in2[2];
    end else if (s0 == 1'b1 && s1 == 1'b1) begin
        func_selector2 = in2[3];
    end
endfunction

endmodule
