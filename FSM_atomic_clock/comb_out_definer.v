`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:54 02/22/2024 
// Design Name: 
// Module Name:    comb_out_definer 
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
`define Q0 		4'b0000
`define Q1 		4'b0001
`define Q2 		4'b0010
`define Q3 		4'b0011
`define Q4 		4'b0100
`define Q5		4'b0101
`define Q6		4'b0110
`define Q7		4'b0111
`define Q8		4'b1000
`define Q9		4'b1001

module comb_out_definer(
		input clk,
		input [3:0] state,
		output reg [9:0] state_announcement
    );
	
	 always @(posedge clk) begin
		case(state)
		
		`Q0: begin
			state_announcement[0] = 1;
			state_announcement[9:1] = 0;
		end
		`Q1: begin
			state_announcement[0] = 0;
			state_announcement[1] = 1;
			state_announcement[9:2] = 0;
		end
		`Q2: begin
			state_announcement[1:0] = 0;
			state_announcement[2] = 1;
			state_announcement[9:3] = 0;
		end
		`Q3: begin
			state_announcement[2:0] = 0;
			state_announcement[3] = 1;
			state_announcement[9:4] = 0;
		end
		`Q4: begin
			state_announcement[3:0] = 0;
			state_announcement[4] = 1;
			state_announcement[9:5] = 0;
		end
		`Q5: begin
			state_announcement[4:0] = 0;
			state_announcement[5] = 1;
			state_announcement[9:6] = 0;
		end
		`Q6: begin
			state_announcement[5:0] = 0;
			state_announcement[6] = 1;
			state_announcement[9:7] = 0;
		end
		`Q7: begin
			state_announcement[6:0] = 0;
			state_announcement[7] = 1;
			state_announcement[9:8] = 0;
		end
		`Q8: begin
			state_announcement[7:0] = 0;
			state_announcement[8] = 1;
			state_announcement[9] = 0;
		end
		`Q9: begin
			state_announcement[8:0] = 0;
			state_announcement[9] = 1;
		end
	endcase
	end

endmodule
