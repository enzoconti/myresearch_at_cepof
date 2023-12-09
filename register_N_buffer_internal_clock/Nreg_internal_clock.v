`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:35:00 08/24/2023 
// Design Name: 
// Module Name:    Nreg_internal_clock 
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
module Nreg_internal_clock
#( parameter N=1)

(
    input in,
    input clk,
    output out
	 //output wire [7:0] leds
    );

	//assign leds = N;

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
