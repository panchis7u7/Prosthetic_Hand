module Top (
	input clk,
	input [7:0] input_adc,
	output adc_clk,
	output servo_divider_clk
);

Byte_BCD_Converter converter (input_adc);

PWM_Divider #(.DIVISOR(28'd78))	//50MHz/640KHz.
adc_clk_divider (clk, 8'd0, adc_clk);

PWM_Divider #(.DUTY_CYCLE(7'd50), .DYNAMIC(1'd1))	// 100y = 4x + 100. => Map the value between 3 and 13.
servo_clk_divider (clk, input_adc, servo_divider_clk);	//50Hz => default value.

endmodule