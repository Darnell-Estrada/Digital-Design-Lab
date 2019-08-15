`timescale 1ns / 1ps

module BCD_to_Sseg_4Digits(
    input wire [15:0] BCD,
	 input wire AN3,
	 input wire AN2,
	 input wire AN1,
	 input wire AN0,
    output reg [7:0] Sseg_from_BCD
    );
	 
	 reg [3:0] digit;
	 
	 always@(BCD,AN3,AN2,AN1,AN0) begin
		if ({AN3,AN2,AN1,AN0} == 4'b1110)
		   digit = {BCD[3], BCD[2], BCD[1], BCD[0]};
		else if ({AN3,AN2,AN1,AN0} == 4'b1101)
		   digit = {BCD[7], BCD[6], BCD[5], BCD[4]};
		else if ({AN3,AN2,AN1,AN0} == 4'b1011)
		   digit = {BCD[11], BCD[10], BCD[9], BCD[8]};
		else if ({AN3,AN2,AN1,AN0} == 4'b0111)
		   digit = {BCD[15], BCD[14], BCD[13], BCD[12]};
		else
			digit = 4'b1111;    // default case in case structure
	 end
	
	 always@(digit) begin
			case (digit)
				4'b0000 : Sseg_from_BCD = 8'b11000000;
				4'b0001 : Sseg_from_BCD = 8'b11111001;
				4'b0010 : Sseg_from_BCD = 8'b10100100;
				4'b0011 : Sseg_from_BCD = 8'b10110000;
				4'b0100 : Sseg_from_BCD = 8'b10011001;
				4'b0101 : Sseg_from_BCD = 8'b10010010;
				4'b0110 : Sseg_from_BCD = 8'b10000010;
				4'b0111 : Sseg_from_BCD = 8'b11111000;
				4'b1000 : Sseg_from_BCD = 8'b10000000;
				4'b1001 : Sseg_from_BCD = 8'b10010000;
				default : Sseg_from_BCD = 8'b11111111;
			endcase
	 end
	
endmodule
