module Servo_Controller_Test_Bench ();

 reg clk;
 reg [7:0] adc;
 wire motor;
 
 Top uut (
  .clk(clk), 
  .adc(adc),
  .motor(motor)
 );
 
 initial begin
	clk = 0;
	adc = 8'd255;
	forever 
	begin
		#1000 clk = ~clk;
		#2000 adc = 8'd180;
	end
 end
      
endmodule