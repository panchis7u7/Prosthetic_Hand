module Refresh_Counter(
	input clk,
	output reg [1:0] refresh_select = 0
);

always @(posedge clk) refresh_select <= refresh_select + 1'b1;

endmodule