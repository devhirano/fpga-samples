module rom(in, out, out_opcode, out_imdata);

// rom は一度定義したら基本変えないもの

input [3:0] in;
output [7:0] out;
output [3:0] out_opcode;
output [3:0] out_imdata;
wire [3:0] in;
wire [7:0] out;
wire [3:0] out_opcode;
wire [3:0] out_imdata;

assign out = func_rom(in);
assign out_opcode = out[7:4];
assign out_imdata = out[3:0];

function [7:0] func_rom;
    input [3:0] in;

    // add A 0001
    if (in == 4'b0000) begin
        func_rom = 8'b00000001;

    // out A (0001)
    end else if (in == 4'b0001) begin
        func_rom = 8'b10000000;

    // add A 0001
    end else if (in == 4'b0010) begin
        func_rom = 8'b00000001;

    // out A (0010)
    end else if (in == 4'b0011) begin
        func_rom = 8'b10000000;

    // add B 0100
    end else if (in == 4'b0100) begin
        func_rom = 8'b00010100;

    // out B (0100)
    end else if (in == 4'b0101) begin
        func_rom = 8'b10010100;

    // mov A 1000
    end else if (in == 4'b0110) begin
        func_rom = 8'b00101000;

    // out A (1000)
    end else if (in == 4'b0111) begin
        func_rom = 8'b10000000;

    // out B (0100)
    end else if (in == 4'b1000) begin
        func_rom = 8'b10010000;

    // mv B 0000
    end else if (in == 4'b1001) begin
        func_rom = 8'b00110000;

    // out B (0000)
    end else if (in == 4'b1010) begin
        func_rom = 8'b10010000;

    // address 1011
    end else if (in == 4'b1011) begin
        func_rom = 8'b00000000;

    // address 1100
    end else if (in == 4'b1100) begin
        func_rom = 8'b00000000;

    // address 1101
    end else if (in == 4'b1101) begin
        func_rom = 8'b00000000;

    // address 1110
    end else if (in == 4'b1110) begin
        func_rom = 8'b00000000;

    // address 1111
    end else if (in == 4'b1111) begin
        func_rom = 8'b00000000;

    end

endfunction

endmodule
