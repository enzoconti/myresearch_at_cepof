`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:22:12 05/19/2023 
// Design Name: 
// Module Name:    top_module 
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
module top_module(
    input in,
    input clk,
    output out
    );

	wire TEMP12;
	wire TEMP23;
	wire TEMP34;
	 
	 register r1(.in(in), .out(TEMP12), .clk(clk));
	 register r2(.in(TEMP12), .out(TEMP23), .clk(clk));
	 register r3(.in(TEMP23), .out(TEMP34), .clk(clk));
	 register r4(.in(TEMP34), .out(out), .clk(clk));
endmodule
