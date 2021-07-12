module PWM_Divider #(
	parameter DIVISOR = 28'd1000000, 
	parameter DUTY_CYCLE = 7'd50,
	parameter DYNAMIC = 1'd0) (
	input wire clk,
	input [7:0] adc,
	output reg pwm
);

reg [27:0] counter = 28'd0;

always @(posedge clk)
begin
	counter <= counter + 28'd1;
	if(DYNAMIC == 1'd1)
			pwm <= (counter<((273*adc)+49999)) ? 1:0;
		else
			pwm <= (counter<((DIVISOR*DUTY_CYCLE)/100)) ? 1:0;
	if(counter >= (DIVISOR-1))
		counter <= 28'd0;
end

//assign pwm = (counter<=((DIVISOR*DUTY_CYCLE)/100)) ? 1:0;

endmodule
