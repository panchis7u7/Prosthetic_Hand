module Top (
	input clk,
	input [7:0] input_adc,
	output wire [3:0] digit_trans_cathodes,	//PNP Transistors.
	output wire [7:0] digit_led_cathodes,
	output wire adc_clk,
	output wire servo_divider_clk
);

wire wire_refresh_clk;
wire [1:0] wire_refresh_counter;
wire [11:0] wire_bcd_adc_conversion;
wire [3:0] wire_data_selected_digit;

PWM_Divider #(.DIVISOR(28'd5000)) segment_clk_divider (
	.clk(clk), 
	.adc(8'd0), 
	.pwm(wire_refresh_clk)
);

PWM_Divider #(.DIVISOR(28'd78)) adc_clk_divider (	//50MHz/640KHz.
	.clk(clk), 
	.adc(8'd0), 
	.pwm(adc_clk)
);

// 100y = 4x + 100. => Map the value between 3 and 13.
PWM_Divider #(.DUTY_CYCLE(7'd50), .DYNAMIC(1'd1)) servo_clk_divider (	//50Hz => default value.
	.clk(clk), 
	.adc(input_adc), 
	.pwm(servo_divider_clk)
);

Byte_BCD_Converter bcd_converter (
	.byte(input_adc),
	.bcd(wire_bcd_adc_conversion)
);

Refresh_Counter refresh_counter (
	.clk(wire_refresh_clk),
	.refresh_select(wire_refresh_counter)
);

Cathode_Controller cathode_controller (
	.refresh_counter(wire_refresh_counter),
	.cathode(digit_trans_cathodes)
);

BCD_Controller bcd_controller (
	.data_digit1(wire_bcd_adc_conversion[3:0]),
	.data_digit2(wire_bcd_adc_conversion[7:4]),
	.data_digit3(wire_bcd_adc_conversion[11:8]),
	.data_digit4(4'd0),
	.refresh_counter(wire_refresh_counter),
	.data_selected_digit(wire_data_selected_digit)
);

BCD_Cathode_Controller bcd_cathode_controller (
	.selected_digit_data(wire_data_selected_digit),
	.digit(digit_led_cathodes)
);

endmodule