`include "selector_d.v"

module tb_selector_d();

reg s0, s1;
reg [3:0] in0, in1, in2, in3;
wire [3:0] out;

selector_d selA (
    // connect
    .s0 (s0),
    .s1 (s1),
    .in0 (in0),
    .in1 (in1),
    .in2 (in2),
    .in3 (in3),
    .out (out)
);

initial begin
    // ignore error
    $dumpfile("selector_d.vcd");
    $dumpvars(0, selA);
    $display ("time\t s0 s1 in0 in1 in2 in3 out");
    $monitor ("%g\t %b %b %b %b %b %b %b" , $time, s0, s1, in0, in1, in2, in3, out);
end

initial begin
    in0 = 4'b0001;
    in1 = 4'b1010;
    in2 = 4'b1100;
    in3 = 4'b1111;

    #1 s0 = 4'b0; // out=in0: 0001
       s1 = 4'b0;
    #1 s0 = 4'b1; // out=in1: 1010
       s1 = 4'b0;
    #1 s0 = 4'b0; // out=in2: 1100
       s1 = 4'b1;
    #1 s0 = 4'b1; // out=in3: 1111
       s1 = 4'b1;
    #10 $finish;
end

endmodule
