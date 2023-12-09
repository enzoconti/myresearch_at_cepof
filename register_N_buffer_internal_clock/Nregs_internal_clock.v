`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:37:58 08/24/2023 
// Design Name: 
// Module Name:    Nregs_internal_clock 
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
module Nregs_internal_clock(
    input in,
    input clk,
    output out
    //output wire [7:0] leds
    );
	parameter M =164; // M * N registers
	//assign leds = M;
	//assign leds[6:0] = out;
	//assign leds[7] = clk;
	
	wire[M:0] TEMP;
	
	
	assign TEMP[0] = in;

	 genvar i;

	 generate

       for(i = 0; i < M;i=i+1) begin: genblock
		
				Nreg_internal_clock #(.N(256)) mod(.in(TEMP[i]), .out(TEMP[i+1]), .clk(clk));

		end

    endgenerate

	assign out = TEMP[M];

endmodule
