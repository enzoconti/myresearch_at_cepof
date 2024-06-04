`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:13 04/28/2023 
// Design Name: 
// Module Name:    on_signal 
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
module on_signal(
    input in_pin,
	 input clk,
	 output reg out_pin,
	 output reg out_led,
	 output high_led
    );

	always @(posedge clk) begin
        out_pin <= in_pin;
		  out_led <= in_pin;
   end
	assign high_led =1;
	
endmodule
