module Top (
	input clk,
	input [7:0] input_adc,
	output adc_clk,
	output servo_divider_clk
);

reg [7:0] adc;

PWM_Divider #(.DIVISOR(28'd78))	//50MHz/640KHz.
adc_clk_divider (clk, adc_clk);

PWM_Divider #(.DUTY_CYCLE(7'd50))	// 100y = 4x + 100. => Map the value between 3 and 13.
servo_clk_divider (clk, servo_divider_clk);	//50Hz => default value.

endmodule