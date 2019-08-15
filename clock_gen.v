`timescale 1ns / 1ps

module clock_gen(
	input  wire clkin,
	output wire AN0,
	output wire AN1,	
	output wire AN2,
	output wire AN3,
	input  wire reset
   );

   reg [17:0] count;

	// FILL CODE HERE to implement an 18-bit counter
	always@(posedge clkin) begin
		if(count == 18'b111111111111111111)
			count <= 18'b0;
		else
			count <= count + 1'b1;
		if (reset == 1'b1)
			count <= 18'b0;
	end
		
	assign AN0 =    count[17] | count[16];
	assign AN1 =  ~(count[17] ^ count[16]) | ~count[16];
	assign AN2 =  ~(count[17] ^ count[16]) |  count[16];
   assign AN3 =  ~(count[17] & count[16]);

endmodule
