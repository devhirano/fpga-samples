module decoder(in_op, in_carry, out_s0, out_s1, out_r0, out_r1, out_r2, out_r3);

input [3:0] in_op;
input in_carry;
output out_s0, out_s1;
output out_r0, out_r1, out_r2, out_r3;
wire [5:0] out;

assign out = func_decoder(in_op, in_carry);
assign out_s0 = out[5];
assign out_s1 = out[4];
assign out_r0 = out[3];
assign out_r1 = out[2];
assign out_r2 = out[1];
assign out_r3 = out[0];

// in_op : オペレーションコード
// out_s0-1: selector in_s
// out_r0-3: reg load

function [5:0] func_decoder;
    input [3:0] in_op;
    input in_carry;

    // address 0000 : add A im
    if (in_op == 4'b0000) begin
        func_decoder = 6'b001000;

    // address 0001 : add B im
    end else if (in_op == 4'b0001) begin
        func_decoder = 6'b010100;

    // address 0010 : mov A im
    end else if (in_op == 4'b0010) begin
        func_decoder = 6'b111000;

    // address 0011 : mov B im
    end else if (in_op == 4'b0011) begin
        func_decoder = 6'b110100;

    // address 0100 : mov A b
    end else if (in_op == 4'b0100) begin
        func_decoder = 6'b011000;

    // address 0101 : mov B A
    end else if (in_op == 4'b0101) begin
        func_decoder = 6'b000100;

    // address 0110 : in A
    end else if (in_op == 4'b0110) begin
        func_decoder = 6'b101000;

    // address 0111 : in B
    end else if (in_op == 4'b0111) begin
        func_decoder = 6'b100100;

    // address 1000 : out A
    end else if (in_op == 4'b1000) begin
        func_decoder = 6'b000010;

    // address 1001 : out B
    end else if (in_op == 4'b1001) begin
        func_decoder = 6'b010010;

    // address 1010 : out im
    end else if (in_op == 4'b1010) begin
        func_decoder = 6'b110010;

    // address 1011 : --
    end else if (in_op == 4'b1011) begin
        // not impl
        func_decoder = 6'b000000;

    // address 1100 : --
    end else if (in_op == 4'b1100) begin
        // not impl
        func_decoder = 6'b000000;

    // address 1101 : --
    end else if (in_op == 4'b1101) begin
        // not impl
        func_decoder = 6'b000000;

    // address 1110 : jnc im
    end else if (in_op == 4'b1110) begin
        // carry が 0 なら jmp する
        if (in_carry == 1'b0) begin
            func_decoder = 6'b110001;
        // carry が 1 なら何も load しない
        end else begin
            func_decoder = 6'b000000;
        end

    // address 1111 : jmp im
    end else if (in_op == 4'b1111) begin
        func_decoder = 6'b110001;
    end

endfunction

endmodule
