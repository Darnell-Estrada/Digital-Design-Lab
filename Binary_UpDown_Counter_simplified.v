`timescale 1ns / 1ps
`include "Bin_to_BCD.v"
`include "BCD_to_Sseg_4Digits.v"
`include "clock_gen.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:44 10/14/2013 
// Design Name: 
// Module Name:    Binary_UpDown_Counter 
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
module Binary_UpDown_Counter_simplified(
	input wire clk,			// Nexys3 internal clock for driving the AN3-AN0 signals
	input wire clk_user,	// user-generated clock for driving the counter
							// NOTE: in your .ucf file, you MUST insert the line: NET "clk_user" CLOCK_DEDICATED_ROUTE = FALSE;	
	input wire reset,
	input wire Up,
	output wire AN3,
	output wire AN2,
	output wire AN1,
	output wire AN0,
	output wire [7:0] Sseg
    );

	reg [3:0] state;
	reg [3:0] next_state;
	reg [7:0] Bin;
	wire [15:0] BCD;
	
	// set initial values for the reg data types
	initial begin	
		state = 4'b0;
		Bin = 8'b0;
	end
	
	// combinational block
	always@(state,Up) begin
		if (Up)
			// FILL CODE HERE to obtain next_state value given current state and "Up" input
		else
			// FILL CODE HERE to obtain next_state value given current state and "Up" input
	end
	
	// sequential block to update the current state
	always@(posedge clk_user or negedge reset) begin
		if (~reset)
			// FILL CODE HERE to reset the state
		else
			// FILL CODE HERE to update the current state with the next state
	end
	
	// FILL CODE HERE to display the counter output on 4 7-segment displays

	
endmodule
