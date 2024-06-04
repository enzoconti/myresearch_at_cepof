`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:22 02/22/2024 
// Design Name: 
// Module Name:    top_counter 
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
module top_counter(
    input clk,
    output reg out_clk
    );
	 parameter Nbits = 4;
	 parameter nclks_high = 5;
	 parameter nclks_total = 10; // eq to clock frequency

	reg [Nbits-1:0] n_clocks =0 ;
	wire [Nbits-1:0] counter_output;
	counter #(.Nbits(Nbits), .nclks_total(nclks_total)) PPS_counter(.clk(clk), .counter_out(counter_output));
	
	// always block to keep conter_output on register
	always @(posedge clk) begin
		n_clocks <= counter_output;
	end
	
	// now the register can be used on if statements
	always @(posedge clk) begin
	
		if(n_clocks < nclks_high) begin
			out_clk = 1;
			end
		else begin
			out_clk = 0;
		end
	end


endmodule
