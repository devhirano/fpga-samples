// 結合

`include "register.v"
`include "selector_d.v"
`include "alu.v"
`include "rom.v"
`include "decoder.v"

module system();

// global variables
reg clk;

////// instance variables //////
// register A
reg regA_clr;
wire [3:0] regA_out;
wire [3:0] regA_count;

// register B
reg regB_clr;
wire [3:0] regB_out;
wire [3:0] regB_count;

// register Input
reg regInput_clr;
reg regInput_load;
reg [3:0] regInput_in;
wire [3:0] regInput_out;
wire [3:0] regInput_count;

// register Output
reg regOutput_clr;
wire [3:0] regOutput_out;
wire [3:0] regOutput_count;

// register Zero
reg regZero_clr;
reg regZero_load;
reg [3:0] regZero_in;
wire [3:0] regZero_out;
wire [3:0] regZero_count;

// register Address Counter
reg regAddr_clr;
reg regAddr_load;
wire [3:0] regAddr_out;
wire [3:0] regAddr_count;

// selector
wire [3:0] sel_out;

// rom
wire [3:0] rom_out_opcode;
wire [3:0] rom_out_imdata;

// decoder
wire d_out_s0;
wire d_out_s1;
wire d_out_r0;
wire d_out_r1;
wire d_out_r2;
wire d_out_r3;

// ALU
wire [3:0] alu_out;
wire alu_carry;


////// instances //////
register regA (
    // connect regA clk and testbench clk
    .clk  (clk),
    .load (d_out_r0),
    .clr  (regA_clr),
    .in   (alu_out),
    .out  (regA_out),
    .count (regA_count)
);

register regB (
    // connect regB clk and testbench clk
    .clk  (clk),
    .load (d_out_r1),
    .clr  (regB_clr),
    .in   (alu_out),
    .out  (regB_out),
    .count (regB_count)
);

register regInput (
    .clk  (clk),
    .load (regInput_load),
    .clr  (regInput_clr),
    .in   (regInput_in),
    .out  (regInput_out),
    .count (regInput_count)
);

register regOutput (
    .clk  (clk),
    .load (d_out_r2),
    .clr  (regOutpt_clr),
    .in   (alu_out),
    .out  (regOutput_out),
    .count (regOutput_count)
);

register regZero (
    .clk  (clk),
    .load (regZero_load),
    .clr  (regZero_clr),
    .in   (regZero_in),
    .out  (regZero_out),
    .count (regZero_count)
);

register regAddr (
    .clk  (clk),
    .load (d_out_r3),
    .clr  (regAddr_clr),
    .in   (alu_out),
    .out  (regAddr_out),
    .count (regAddr_count)
);

selector_d sel (
    .s0 (d_out_s0),
    .s1 (d_out_s1),
    .in0 (regA_out),
    .in1 (regB_out),
    .in2 (regInput_out),
    .in3 (regZero_out),
    .out (sel_out)
);

rom r (
    .in (regAddr_count),
    .out_opcode (rom_out_opcode),
    .out_imdata (rom_out_imdata)
);

decoder d (
    .in_op (rom_out_opcode),
    .out_s0 (d_out_s0),
    .out_s1 (d_out_s1),
    .out_r0 (d_out_r0),
    .out_r1 (d_out_r1),
    .out_r2 (d_out_r2),
    .out_r3 (d_out_r3)
);

alu al (
    .in1 (sel_out),
    .in2 (rom_out_imdata),
    .out (alu_out),
    .carry (alu_carry)
);

initial begin
    // ignore error
    $dumpfile("tb_system.vcd");
    $dumpvars(0, regA);
    $dumpvars(1, regB);
    $dumpvars(2, regInput);
    $dumpvars(3, regOutput);
    $dumpvars(4, regZero);
    $dumpvars(5, regAddr);
    $dumpvars(6, r);
    $dumpvars(7, sel);
    $dumpvars(8, al);
    $display ("time\t clk output");
    $monitor ("%g\t %b %b" , $time, clk, regOutput_out);
end

// clock generator
always begin
    // 5 period で反転、 10 period で 1 周
    #5 clk = ~clk;
end

initial begin

// init values
    #5
    clk = 1;
    regA_clr = 1;
    regB_clr = 1;
    regAddr_clr = 1;
    regInput_clr = 1;
    regOutput_clr = 1;
    regZero_clr = 1;

    #10
    regA_clr = 0;
    regB_clr = 0;
    regAddr_clr = 0;
    regInput_clr = 0;
    regOutput_clr = 0;
    regZero_clr = 0;

    #5
    #10
    #10
    #10
    #10
    #10
    #10
    #10
    #10
    #10
    #10
    #10
    #10

    #10 $finish;
end

endmodule
