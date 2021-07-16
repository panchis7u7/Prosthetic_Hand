module BCD_Cathode_Controller(
	input [3:0] selected_digit_data,
	output reg [7:0] digit
);

always @(selected_digit_data)
begin
	case(selected_digit_data)
		//|dp|g|f|e|d|c|b|a|
		4'd0: digit = 8'b11000000;	//Zero.
		4'd1: digit = 8'b11111001;	//One.
		4'd2: digit = 8'b10100100;	//Two.
		4'd3: digit = 8'b10110000;	//Three.
		4'd4: digit = 8'b10011001;	//Four.
		4'd5: digit = 8'b10010010;	//Five.
		4'd6: digit = 8'b10000010;	//Six.
		4'd7: digit = 8'b11111000;	//Seven.
		4'd8: digit = 8'b10000000;	//Eight.
		4'd9: digit = 8'b10010000;	//Nine.
		default: digit = 8'b11000000;	//Any other case.
	endcase
end

endmodule