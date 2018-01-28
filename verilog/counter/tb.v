`include "counter.v"

module tb();

reg clock, reset, enable;
wire [3:0] counter_out;

// instantiate counter : dut?
counter u_counter(clock, reset, enable, counter_out);


initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, u_counter);
    $display ("time\t clock reset enable counter");
    $monitor ("%g\t %b %b %b %b" , $time, clock, reset, enable, counter_out);
end


initial begin
    clock = 1;
    reset = 0;
    enable = 0;
    #5 reset = 1;
    #15 reset = 0;
    #5 enable = 1;
    #100 enable = 0;
    #10 $finish;
end


// clock generator
always begin
    #5 clock = ~clock;
end

endmodule
