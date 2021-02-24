module Top (clk, adc, pwm);

input clk;
input [7:0] adc;
output pwm;

PWM_Divider(clk, adc, pwm);

endmodule