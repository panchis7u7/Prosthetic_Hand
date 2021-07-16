module Byte_BCD_Converter(
	input [7:0] byte,
	output reg [11:0] bcd
);

//reg [11:0] bcd;
reg [3:0] i;

//Double dabble algorithm.
always @(byte)
begin
	bcd = 0;
	for(i = 0; i < 8; i = i + 1)
	begin
		bcd = {bcd[10:0], byte[7-i]};	//Concatenation.
		if(i < 7 && bcd[3:0] > 4)
			bcd[3:0] = bcd[3:0] + 3;
		if(i < 7 && bcd[7:4] > 4)
			bcd[7:4] = bcd[7:4] + 3;
		if(i < 7 && bcd[11:8] > 4)
			bcd[11:8] = bcd[11:8] + 3;
	end
end

endmodule