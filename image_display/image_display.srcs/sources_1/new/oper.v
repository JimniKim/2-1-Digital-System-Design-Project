`timescale 1ns / 1ps 
 
module JKFF(input reset_n, input j, input k, input clk, output reg q, output reg q_);  
    initial begin
      q = 0;
      q_ = ~q;
    end
    
    always @(negedge clk) begin
        q = reset_n & (j&~q | ~k&q);
        q_ = ~reset_n | ~q;
    end

endmodule

module oJKFF(input reset_n, input j, input k, input clk, output reg q, output reg q_);  
    initial begin
      q = 1;
      q_ = ~q;
    end
    
    always @(posedge clk) begin
        q = reset_n & (j&~q | ~k&q);
        q_ = ~reset_n | ~q;
    end

endmodule

/* Implement negative edge triggered D flip-flop 
 * You must use edge_trigger_JKFF module */
module zedge_trigger_D_FF(input reset_n, input d, input clk, output q, output q_);   

    ////////////////////////
    JKFF ETJKFF(reset_n, d, ~d, clk, q, q_);
    ////////////////////////
 
endmodule


module edge_trigger_T_FF(input reset_n, input d, input clk, output q, output q_);   

    ////////////////////////
    JKFF ETJKFF(reset_n, d, d, clk, q, q_);
    ////////////////////////
 
endmodule

module lt10(
    input [10:0] a,
    input [10:0] b,
    output out
    );
    wire [10:0] c;
    wire [10:0] d;
    assign c[0] = ~a[0] & b[0];
    assign c[1] = ~a[1] & b[1];
    assign c[2] = ~a[2] & b[2];
    assign c[3] = ~a[3] & b[3];
    assign c[4] = ~a[4] & b[4];
    assign c[5] = ~a[5] & b[5];
    assign c[6] = ~a[6] & b[6];
    assign c[7] = ~a[7] & b[7];
    assign c[8] = ~a[8] & b[8];
    assign c[9] = ~a[9] & b[9];
    assign c[10] = ~a[10] & b[10];
    
    assign d[0] = a[0] ~^ b[0];
    assign d[1] = a[1] ~^ b[1];
    assign d[2] = a[2] ~^ b[2];
    assign d[3] = a[3] ~^ b[3];
    assign d[4] = a[4] ~^ b[4];
    assign d[5] = a[5] ~^ b[5];
    assign d[6] = a[6] ~^ b[6];
    assign d[7] = a[7] ~^ b[7];
    assign d[8] = a[8] ~^ b[8];
    assign d[9] = a[9] ~^ b[9];
    assign d[10] = a[10] ~^ b[10];
    
    wire [10:0]check;
    assign check[0] = c[10];
    assign check[1] = d[10] & c[9];
    assign check[2] = d[10] & d[9] & c[8];
    assign check[3] = d[10] & d[9] & d[8] & c[7];
    assign check[4] = d[10] & d[9] & d[8] & d[7] & c[6];
    assign check[5] = d[10] & d[9] & d[8] & d[7] & d[6] & c[5];
    assign check[6] = d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & c[4];
    assign check[7] = d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & d[4] & c[3];
    assign check[8] = d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & d[4] & d[3] & c[2]; 
    assign check[9] = d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & d[4] & d[3] & d[2] & c[1]; 
    assign check[10] =d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & d[4] & d[3] & d[2] & d[1] & c[0]; 
    
    assign out = check[0] | check[1] | check[2] | check[3] | check[4] | check[5] | check[6] | check[7] | check[8] | check[9] | check[10];
    
endmodule

module gt10(
    input [10:0] a,
    input [10:0] b,
    output out
    );
    wire [10:0] c;
    wire [10:0] d;
    assign c[0] = a[0] & ~b[0];
    assign c[1] = a[1] & ~b[1];
    assign c[2] = a[2] & ~b[2];
    assign c[3] = a[3] & ~b[3];
    assign c[4] = a[4] & ~b[4];
    assign c[5] = a[5] & ~b[5];
    assign c[6] = a[6] & ~b[6];
    assign c[7] = a[7] & ~b[7];
    assign c[8] = a[8] & ~b[8];
    assign c[9] = a[9] & ~b[9];
    assign c[10] = a[10] & ~b[10];
    
    assign d[0] = a[0] ~^ b[0];
    assign d[1] = a[1] ~^ b[1];
    assign d[2] = a[2] ~^ b[2];
    assign d[3] = a[3] ~^ b[3];
    assign d[4] = a[4] ~^ b[4];
    assign d[5] = a[5] ~^ b[5];
    assign d[6] = a[6] ~^ b[6];
    assign d[7] = a[7] ~^ b[7];
    assign d[8] = a[8] ~^ b[8];
    assign d[9] = a[9] ~^ b[9];
    assign d[10] = a[10] ~^ b[10];
    
    wire [10:0]check;
    assign check[0] = c[10];
    assign check[1] = d[10] & c[9];
    assign check[2] = d[10] & d[9] & c[8];
    assign check[3] = d[10] & d[9] & d[8] & c[7];
    assign check[4] = d[10] & d[9] & d[8] & d[7] & c[6];
    assign check[5] = d[10] & d[9] & d[8] & d[7] & d[6] & c[5];
    assign check[6] = d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & c[4];
    assign check[7] = d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & d[4] & c[3];
    assign check[8] = d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & d[4] & d[3] & c[2]; 
    assign check[9] = d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & d[4] & d[3] & d[2] & c[1]; 
    assign check[10] =d[10] & d[9] & d[8] & d[7] & d[6] & d[5] & d[4] & d[3] & d[2] & d[1] & c[0]; 
    
    assign out = check[0] | check[1] | check[2] | check[3] | check[4] | check[5] | check[6] | check[7] | check[8] | check[9] | check[10];
endmodule 

module mux2to1(
    input [1:0] in,
    input select,
    output out
    );
    
    wire a,b;
    assign a = in[0] & ~select;
    assign b = in[1] & select;
    assign out = a | b;
endmodule 