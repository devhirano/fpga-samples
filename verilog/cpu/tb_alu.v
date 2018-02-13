`include "alu.v"

module tb_alu();

reg  [3:0] in1, in2;
wire [3:0] out;
wire carry;

alu aluA (
    .in1 (in1),
    .in2 (in2),
    .out (out),
    .carry (carry)
);

initial begin
    $dumpfile("aluA.vcd");
    $dumpvars(0, aluA);
    $display("time\t in1 in2 out carry");
    $monitor("%g\t %b %b %b %b", $time, in1, in2, out, carry);
end

initial begin
    in1 = 4'b0000;
    in2 = 4'b0000;
    $display("expect :           0000, carry=0");
    #1 in1 = 4'b0001;
       in2 = 4'b0000;
    $display("expect :           0001, carry=0");
    #1 in1 = 4'b0010;
       in2 = 4'b0000;
    $display("expect :           0010, carry=0");
    #1 in1 = 4'b0010;
       in2 = 4'b0001;
    $display("expect :           0011, carry=0");
    #1 in1 = 4'b0010;
       in2 = 4'b0101;
    $display("expect :           0111, carry=0");
    #1 in1 = 4'b1010;
       in2 = 4'b0101;
    $display("expect :           1111, carry=0");
    #1 in1 = 4'b1011;
       in2 = 4'b0101;
    $display("expect :           0000, carry=1");
    #1 in1 = 4'b1011;
       in2 = 4'b0111;
    $display("expect :           0010, carry=1");
    #1 in1 = 4'b1111;
       in2 = 4'b0111;
    $display("expect :           0110, carry=1");
    #1 in1 = 4'b1111;
       in2 = 4'b1111;
    $display("expect :           1110, carry=1");
end


endmodule
