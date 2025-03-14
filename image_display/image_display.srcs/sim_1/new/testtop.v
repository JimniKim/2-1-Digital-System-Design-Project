`timescale 1ns / 1ps

module testtop;

reg clk = 0;
wire Hsynq;
wire Vsynq;
wire [3:0] R;
wire [3:0] G;
wire [3:0] B;

top UUT(clk, Hsynq , Vsynq , R, G, B);

always #5 clk <= ~clk;

endmodule
