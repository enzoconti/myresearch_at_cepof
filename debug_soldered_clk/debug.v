`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:36 11/07/2023 
// Design Name: 
// Module Name:    debug 
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
module debug(
    input clk,
	 input signal,
	 output led_clk,
	 output reg out_signal,
	 output led_signal
    );

	//assign clk = switch | button | jumper;
	assign led = clk;
	
	always @(posedge clk) begin
		jumper = signal;
	end
	
	always @(negedge clk) begin
		jumper = 0;
	end
	
	assign led_jumper = jumper;
endmodule
