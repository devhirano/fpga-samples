module register(clk, load, clr, in, out);

input clk, load, clr;
input  [3:0] in;
output [3:0] out;

wire clk, load, clr;
wire [3:0] in;
reg  [3:0] out;

reg [3:0] cache_in;

always @(posedge clk)
begin
    if (load == 1'b1) begin
        cache_in <= in;
        out <= in;
    end else begin
        out <= cache_in;
    end
end

endmodule





