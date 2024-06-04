`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:49 02/22/2024 
// Design Name: 
// Module Name:    seq_state_definer 
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

module seq_state_definer(
    input clk,
    input wire n_clks,
    input [3:0] state,
    output reg [3:0] next_state
    );
	always @(posedge clk) begin
	
		case(state)
		
		`Q0: begin
			if(n_clks >= 20000 - 2) next_state = `Q1;
			else					      next_state = `Q0;
		end
		`Q1: begin
			if(n_clks >= 50000 - 2) next_state = `Q2;
			else					      next_state = `Q1;
		end
		`Q2: begin
			if(n_clks >= 60000000 - 2) next_state = `Q3;
			else					      next_state = `Q2;
		end
		`Q3: begin
			if(n_clks >= 250000 - 2) next_state = `Q4;
			else					      next_state = `Q3;
		end
		`Q4: begin
			if(n_clks >= 30000000 - 2) next_state = `Q5;
			else					      next_state = `Q4;
		end
		`Q5: begin
			if(n_clks >= 630000 - 2) next_state = `Q6;
			else					      next_state = `Q5;
		end
		`Q6: begin
			if(n_clks >= 1840000 - 2) next_state = `Q7;
			else					      next_state = `Q6;
		end
		`Q7: begin
			if(n_clks >= 1890000 - 2) next_state = `Q8;
			else					      next_state = `Q7;
		end
		`Q8: begin
			if(n_clks >= 950000 - 2) next_state = `Q9;
			else					      next_state = `Q8;
		end
		`Q9: begin
			if(n_clks >= 1200000 - 2) next_state = `Q0;
			else					      next_state = `Q9;
		end
	endcase
	end

endmodule
