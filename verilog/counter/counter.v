/*
*
* clock     _________
* -------> |         |
* reset    |         | couner_out
* -------> | counter | ----/---->
* enable   |         |
* -------> |_________|
*
*/

// module declare
module counter(clock, reset, enable, counter_out);


// in/out direction and bandwidth declare
input clock, reset, enable;
output [3:0] counter_out;


// data type
wire clock, reset, enable;
reg counter_out;


// code start
always @(posedge clock)
begin : COUNTER
    if (reset == 1'b1) begin
        counter_out <= #1 4'b0000;
    end

    else if (enable == 1'b1) begin
        counter_out <= #1 counter_out + 1;
    end
end

endmodule

