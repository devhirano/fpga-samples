`include "decoder.v"

module tb_decoder();

reg [3:0] in_op;
wire out_s0;
wire out_s1;
wire out_r0;
wire out_r1;
wire out_r2;
wire out_r3;

decoder d (
    .in_op (in_op),
    .out_s0 (out_s0),
    .out_s1 (out_s1),
    .out_r0 (out_r0),
    .out_r1 (out_r1),
    .out_r2 (out_r2),
    .out_r3 (out_r3)
);

initial begin
    // ignore error
    $dumpfile("decoder.vcd");
    $dumpvars(0, d);
    $display ("time\t in out_s0 out_s1 out_r0 out_r1 out_r2 out_r3");
    $monitor ("%g\t %b %b", $time, in_op, out_s0, out_s1, out_r0, out_r1, out_r2, out_r3);
end

initial begin
    in_op = 4'b0;

    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;
    #1 in_op = in_op + 4'b1;

    #10 $finish;
end

endmodule
