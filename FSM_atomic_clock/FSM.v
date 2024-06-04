`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:30:21 02/22/2024 
// Design Name: 
// Module Name:    FSM 
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

module FSM(
    input clk,
  	input reset,
  	//input reset_clkcounter_but,
    output reg [9:0] state_announcement,
	 output reg [3:0] state_bin
    );
	 parameter Nbits = 27;
	 parameter nclks_total = 96830000;
	 reg reset_clk;
  	 
  
	wire [Nbits-1:0] n_clks;
  counter #(.Nbits(Nbits), .nclks_total(nclks_total)) PPS_counter(.clk(clk), .counter_out(n_clks), .reset(reset_clk),.reset2(reset));
	
	
	// defining output
	wire [9:0] state_announcement_output;
  comb_out_definer state_announcer(.clk(clk), .state(state_bin),.state_announcement(state_announcement_output));
	
	// defining next_state
	reg [3:0] next_state;
  	initial begin
       reset_clk = 0;
       state_bin = `Q0;
       next_state = `Q0;
     end
  always @(posedge clk) begin
  // resets auxiliary flags/values
      if(reset == 1'b1) begin
        next_state = `Q0;
        reset_clk = 1;
      end
      else begin // else implements the FSM transitions
		case(state_bin)
		
		`Q0: begin
          if(n_clks >= 20000 - 2) begin
			next_state = `Q1;
			reset_clk = 1;
			end
			else	begin
              next_state = `Q0;
              reset_clk = 0;
            end
		end
		`Q1: begin
          if(n_clks >= 50000 - 2) begin
			next_state = `Q2;
			reset_clk = 1;
			end
			else					      begin
              next_state = `Q1;
              reset_clk = 0;
            end
		end
		`Q2: begin
          if(n_clks >= 60000000 - 2) begin
			next_state = `Q3;
			reset_clk = 1;
			end
			else					      begin
              next_state = `Q2;
              reset_clk = 0;
            end
		end
		`Q3: begin
          if(n_clks >= 250000 - 2) begin
			next_state = `Q4;
			reset_clk = 1;
			end
			else					      begin
              next_state = `Q3;
              reset_clk = 0;
            end
		end
		`Q4: begin
          if(n_clks >= 30000000 - 2) begin
			next_state = `Q5;
			reset_clk = 1;
			end
			else					     begin
              next_state = `Q4;
              reset_clk = 0;
            end
		end
		`Q5: begin
          if(n_clks >= 630000 - 2) begin
			next_state = `Q6;
			reset_clk = 1;
			end
			else					      begin
              next_state = `Q5;
              reset_clk =0;
            end
		end
		`Q6: begin
          if(n_clks >= 1840000 - 2) begin
			next_state = `Q7;
			reset_clk = 1;
			end
			else					      begin
              next_state = `Q6;
              reset_clk = 0;
            end
		end
		`Q7: begin
          if(n_clks >= 1890000 - 2) begin
			next_state = `Q8;
			reset_clk = 1;
			end
			else		begin
              next_state = `Q7;
              reset_clk = 0;
            end
		end
		`Q8: begin
          if(n_clks >= 950000 - 2) begin
			next_state = `Q9;
			reset_clk = 1;
			end
			else	begin
              next_state = `Q8;
              reset_clk = 0;
            end
		end
		`Q9: begin
			if(n_clks >= 1200000 - 2) begin
			next_state = `Q0;
			reset_clk = 1;
			end
			else			begin
              next_state = `Q9;
              reset_clk = 0;
            end
		end
	endcase
      end
	end
	
	// changes state and announces it
  always @(posedge clk) begin
      if(reset == 1'b1) state_bin <= `Q0;
		else state_bin <= next_state;
		state_announcement <= state_announcement_output;
	end
	
		
endmodule
