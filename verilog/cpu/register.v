module register(clk, load, clr, in, out, count);

input clk, load, clr;
input  [3:0] in;
output [3:0] out;
output [3:0] count;

wire clk, load, clr;
wire [3:0] in;
wire [3:0] out;

reg [3:0] cache_in; // in 記憶
reg [3:0] count;    // 内部で使用するカウンタ

initial begin
    count = 4'b0;
end

always @(posedge clk)
begin
    if (clr == 1'b1) begin
        cache_in <= 4'b0;
        count <= 4'b0;

    end else if (load == 1'b1) begin
        cache_in <= in;

    end
end

assign out = cache_in;


always @(posedge clk)
begin
    if (clr == 1'b0) begin
        count <= count + 1'b1;
    end
end
endmodule
