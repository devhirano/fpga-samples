module alu(
    in1,
    in2,
    carry,
    out
);

input  [3:0] in1, in2;
output [3:0] out;
output carry;

assign {carry, out} = in1 + in2;

endmodule
