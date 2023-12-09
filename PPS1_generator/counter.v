`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:11 09/12/2023 
// Design Name: 
// Module Name:    counter 
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
module counter
#(parameter Nbits = 26,
  parameter nclks_total = 50000000)
(
    input clk,
    output reg [Nbits-1:0] counter_out
    );

	always @(posedge clk) begin
		if(counter_out == nclks_total-1) // reset if reached total of clks
			counter_out = 0;
		else									
			counter_out = counter_out + 1'b1;
	end

endmodule
