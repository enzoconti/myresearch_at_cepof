`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:44:54 02/22/2024 
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
#(parameter Nbits = 4,
  parameter nclks_total = 10)
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