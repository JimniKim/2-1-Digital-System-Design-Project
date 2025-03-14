`timescale 1ns / 1ps

module clock_divider (
	input clk_in, 
	output clk_out
	); 
	 
	wire C1; 
	wire Q1; 
	wire Q2; 
	wire C2;
	 
	edge_trigger_T_FF DFF1(1,1,~clk_in,Q1,C1); 
	edge_trigger_T_FF DFF2(1,Q1,~clk_in,Q2,C2); 
	 
	assign clk_out = Q2; 
 
endmodule 
