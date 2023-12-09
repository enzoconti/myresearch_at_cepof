`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:22:23 05/19/2023 
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



  wire[64:0] TEMP;

	assign TEMP[0] = in;

	

	 genvar i;

	 generate

       for(i = 0; i < 64;i=i+1) begin: genblock

		register ri(.in(TEMP[i]), .out(TEMP[i+1]), .clk(clk));

		end

    endgenerate

  assign out = TEMP[64];

endmodule
