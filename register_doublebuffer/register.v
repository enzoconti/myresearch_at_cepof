`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:47 04/27/2023 
// Design Name: 
// Module Name:    register 
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
module register(
    input in,
    input clk,
    output reg out
    );

	always@(posedge clk) begin
		out <= in;
	end

endmodule
