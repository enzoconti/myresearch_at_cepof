`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:57 04/27/2023 
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
	 
	 wire TEMP;
	 
	 register r1(.in(in), .out(TEMP), .clk(clk));
	 register r2(.in(TEMP), .out(out), .clk(clk));


endmodule
