`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:26 09/12/2023 
// Design Name: 
// Module Name:    Nregs_external_clock 
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
module Nreg_external_clock
(
    input in,
    input clk,
    output out,
	 output wire [7:0] leds,
	 output raw_clk
    );
	 // change the parameter to the desired number of regs (<=256)
	 parameter N = 256 ;
	 assign raw_clk = clk;

	assign leds = N;

	 wire[N:0] TEMP;

	assign TEMP[0] = in;

	

	 genvar i;

	 generate

       for(i = 0; i < N;i=i+1) begin: genblock

		register ri(.in(TEMP[i]), .out(TEMP[i+1]), .clk(clk));

		end

    endgenerate

  assign out = TEMP[N];

endmodule

