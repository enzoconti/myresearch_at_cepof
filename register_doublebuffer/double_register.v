`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:12 04/27/2023 
// Design Name: 
// Module Name:    double_register 
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
module double_register(
    input clk,
    input A,
    output B
    );

	reg TEMP;
	
	always@(posedge clk) begin
		TEMP <= A;
	end
	
	always@(posedge clk) begin
		B <= A;
	end

endmodule
