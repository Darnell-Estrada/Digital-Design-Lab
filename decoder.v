`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:44 10/05/2013 
// Design Name: 
// Module Name:    decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module decoder(
	input wire [2:0] S,
	output reg [7:0] Out
    );

	always@(S) begin
		case (S)
			<???>: Out <= <???>;
			<???>: Out <= <???>;
			<???>: Out <= <???>;
			<???>: Out <= <???>;
			<???>: Out <= <???>;
			<???>: Out <= <???>;
			<???>: Out <= <???>;
			<???>: Out <= <???>;
			default: Out <= <???>;
		endcase
	end

endmodule
