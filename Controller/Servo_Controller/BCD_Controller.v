module BCD_Controller(
	input [3:0] data_digit1,
	input [3:0] data_digit2,
	input [3:0] data_digit3,
	input [3:0] data_digit4,
	input [1:0] refresh_counter,
	output reg [3:0] data_selected_digit
);

always @(posedge refresh_counter)
begin
	case(refresh_counter)
		2'd00: data_selected_digit = data_digit1;
		2'd01: data_selected_digit = data_digit2;
		2'd10: data_selected_digit = data_digit3;
		2'd11: data_selected_digit = data_digit4;
	endcase
end

endmodule