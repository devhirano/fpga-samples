`include "selector.v"

module tb_selector();

reg s0, s1;
reg [3:0] in1, in2;
wire out1, out2;

selector selectorA (
    // connect
    .s0 (s0),
    .s1 (s1),
    .in1 (in1),
    .in2 (in2),
    .out1 (out1),
    .out2 (out2)
);

initial begin
    // ignore error
    $dumpfile("selector.vcd");
    $dumpvars(0, selectorA);
    $display ("time\t s0 s1 in1 out1 in2 out2");
    $monitor ("%g\t %b %b %b %b %b %b" , $time, s0, s1, in1, out1, in2, out2);
end

initial begin
    in1 = 4'b1010;
    in2 = 4'b1100;
    #1 s0 = 4'b0; // out1=0, out2=0
       s1 = 4'b0;
    #1 s0 = 4'b1; // out1=1, out2=0
       s1 = 4'b0;
    #1 s0 = 4'b0; // out1=0, out2=1
       s1 = 4'b1;
    #1 s0 = 4'b1; // out1=1, out2=1
       s1 = 4'b1;
    #10 $finish;
end

endmodule
