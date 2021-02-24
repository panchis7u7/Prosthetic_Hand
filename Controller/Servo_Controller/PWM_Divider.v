module PWM_Divider(clk, adc, pwm);

input clk;
input[7:0] adc;
output wire pwm;

reg[27:0] counter = 28'd0;
parameter DIVISOR = 28'd1000000;

always @(posedge clk)
begin
	counter <= counter + 28'd1;
	if(counter >= (DIVISOR-1))
		counter <= 28'd0;
end

assign pwm = (counter<=((273*adc)+49999)) ? 1:0;
endmodule
