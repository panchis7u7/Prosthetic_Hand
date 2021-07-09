module PWM_Divider
#(parameter DIVISOR = 28'd1000000, 
parameter DUTY_CYCLE = 7'd50) (
	input wire clk,
	output wire pwm
);

reg[27:0] counter = 28'd0;

always @(posedge clk)
begin
	counter <= counter + 28'd1;
	if(counter >= (DIVISOR-1))
		counter <= 28'd0;
end

assign pwm = (counter<=((DIVISOR*DUTY_CYCLE)/100)) ? 1:0;
//assign pwm = (counter<=((273*adc)+49999)) ? 1:0;
endmodule
