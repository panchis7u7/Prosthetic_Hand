module Cathode_Controller(
	input [1:0] refresh_counter,
	output reg [3:0] cathode = 0
);

always @(refresh_counter)
begin
	case(refresh_counter)
		2'b00: cathode = 4'b1110;	//Digit 1 is on.
		2'b01: cathode = 4'b1101;	//Digit 1 is on.
		2'b10: cathode = 4'b1011;	//Digit 1 is on.
		2'b11: cathode = 4'b0111;	//Digit 1 is on.
	endcase
end

endmodule