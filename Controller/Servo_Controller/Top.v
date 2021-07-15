module Top (
	input clk,
	input [7:0] input_adc,
	output wire [3:0] digit_trans_cathodes,	//PNP Transistors.
	output wire [7:0] digit_led_cathodes,
	output wire adc_clk,
	output wire servo_divider_clk
);

wire refresh_clock;
wire [1:0] refresh_counter;

Byte_BCD_Converter converter (input_adc);

PWM_Divider #(.DIVISOR(28'd5000)) segment_clk_divider (
	.clk(clk), 
	.adc(8'd0), 
	.pwm(refresh_clock)
);

Cathode_Controller cathode_controller (
	.refresh_counter(refresh_counter),
	.cathode(digit_trans_cathodes)
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

endmodule