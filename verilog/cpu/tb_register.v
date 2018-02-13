`include "register.v"

// declare self
module tb_register();

reg clk, load, clr;
reg [3:0] in;
wire [3:0] out;
wire [3:0] count;


// instanticate register
register regA (
    // connect regA clk and testbench clk
    .clk  (clk),
    .load (load),
    .clr  (clr),
    .in   (in),
    .out  (out),
    .count (count)
);

initial begin
    // ignore error
    $dumpfile("regA.vcd");
    $dumpvars(0, regA);
    $display ("time\t clock load clear in out count");
    $monitor ("%g\t %b %b %b %b %b %b" , $time, clk, load, clr, in, out, count);
end

// clock generator
always begin
    #5 clk = ~clk;
end

initial begin
    clk = 1;
    load = 0;
    clr = 0;
    in = 4'b0;
    #10 in = 4'b1;       // 0001
        load = 1;
    #10 in = in + 4'b1;  // 0010 , load=1, out=0010
    #10 in = in + 4'b1;  // 0011 , load=0, out=0010
    #10 load = 0;
        in = in + 4'b1;  // 0100 , load=0, out=0010
    #10 in = in + 4'b1;  // 0101 , load=1, out=0101
    #10 load = 1;
        in = in + 4'b1;  // 0110 , load=1, out=0110
    #10 in = in + 4'b1;  // 0111 , load=1, out=0111
    #10 $finish;
end

endmodule
