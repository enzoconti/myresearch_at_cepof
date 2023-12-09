`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:55:06 09/12/2023 
// Design Name: 
// Module Name:    PPS_generator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: generating a 1PPS signal with 20000clks 
// to count 0.2ms, and later 99980000 clks to count 999.8ms. To count the 100000000 clocks
// it is needed ceiling(log2(100000000)) = 27 bits. So, Nbits = 27
//////////////////////////////////////////////////////////////////////////////////
module PPS_generator(
    input clk,
    output reg PPS1_out,
	 output reg led
    );
	 parameter Nbits = 26;
	 parameter nclks_high = 10000;
	 parameter nclks_total = 50000000; // eq to clock frequency

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
			PPS1_out = 1;
			led = 1;
			end
		else begin
			PPS1_out = 0;
			led = 0;
		end
	end
endmodule
