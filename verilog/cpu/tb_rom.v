`include "rom.v"

module tb_rom();

reg [3:0] in;
wire [3:0] out_opcode;
wire [3:0] out_imdata;

rom r (
    .in (in),
    .out_imdata (out_imdata),
    .out_opcode (out_opcode)
);

initial begin
    // ignore error
    $dumpfile("rom.vcd");
    $dumpvars(0, r);
    $display ("time\t in out_opcode out_imdata");
    $monitor ("%g\t %b %b %b", $time, in, out_opcode, out_imdata);
end

initial begin
    in = 4'b0;

    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;
    #1 in = in + 4'b1;

    #10 $finish;
end

endmodule
