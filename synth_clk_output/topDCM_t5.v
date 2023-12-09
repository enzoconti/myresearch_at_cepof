`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:50:22 09/13/2023 
// Design Name: 
// Module Name:    topDCM_t5 
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
module topDCM_t5(
    input clkin,
    output clkout,
	 //output raw_clk_out,
	 output locked
	 //output [7:0] status
    );


	// with status: five_multiplier_DCM dcm (.CLKIN_IN(clkin),.CLKFX_OUT(clkout), .CLKIN_IBUFG_OUT(raw_clk_out), .LOCKED_OUT(locked), .STATUS_OUT(status));
	//five_multiplier_DCM dcm (.CLKIN_IN(clkin),.CLKFX_OUT(clkout), .CLKIN_IBUFG_OUT(raw_clk_out), .LOCKED_OUT(locked));
	five_multiplier_DCM dcm (.CLKIN_IN(clkin),.CLKFX_OUT(clkout), .LOCKED_OUT(locked));
	// this shows if missed CLKIN cycle
	//assign led_debug_status = status[1];
	
		
   

endmodule
