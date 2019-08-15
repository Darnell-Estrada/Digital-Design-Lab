`timescale 1ns / 1ps

module Bin_to_BCD(
	input wire [7:0] Bin,
	output reg [15:0] BCD
   );

	reg [3:0] thousands;
	reg [3:0] hundreds;
	reg [3:0] tens;
	reg [3:0] ones;
	reg [3:0] shiftcnt;
	reg [7:0] Bin_tmp;

	always@(thousands,hundreds,tens,ones,Bin) begin
		shiftcnt =  4'b0;
		thousands = 4'b0;
		hundreds =  4'b0;
		tens =      4'b0;
		ones =      4'b0;
		Bin_tmp =   Bin;
		
		while (shiftcnt < 8) begin
			if (thousands > 4'b0100)		
				thousands = thousands + 4'b0011;
			if (hundreds > 4'b0100)
				hundreds = hundreds + 4'b0011;
			if (tens > 4'b0100)
				tens = tens + 4'b0011;
			if (ones > 4'b0100)
				ones = ones + 4'b0011;
				
			thousands = thousands << 1;
			thousands[0] = hundreds[3];
			
			hundreds = hundreds << 1;
			hundreds[0] = tens[3];
			
			tens = tens << 1;
			tens[0] = ones[3];
			
			ones = ones << 1;
			ones[0] = Bin_tmp[7];
			
			Bin_tmp = Bin_tmp << 1;
			
			// Increment shift count by 1
			shiftcnt = shiftcnt + 1'b1;
		end
		
		// Supply the output upon the completion of the "while" loop
		BCD = {thousands, hundreds, tens, ones};
	end
		
endmodule
