module board( 
input btn1, btn2, btn3, btn4, clk, reset_n,
 output [4:0] led
 
    );
    
   wire N,M,EN;
   wire  j0, j1, j2, j3, k0, k1, k2, k3; //led0, led1, led2, led3, led4;
   
   wire a, c;
   or (a, btn1, btn2, btn3, btn4, reset_n);
   and (c, clk, a);
   
   assign N = (~btn1 & ~btn2& btn3 & ~ btn4) |  (~btn1 & ~btn2 & ~btn3 & btn4);
   assign M = (~btn1 & ~btn2& ~btn3 &  btn4) | (~btn1 & btn2 & ~btn3 & ~ btn4);
   and (j0, ~N, ~M);
   and (k0, N, ~M);
   and (j1, ~N, M);
   assign k1 = (N&M)  | (~N&~M);
   xor (j2, N, M);
   and (k2, ~N, ~M);
   and (j3, M, N);
   and (k3, N, ~M);
   edge_trigger_JKFF a1( reset_n, j0, k0, c, led[0]);
   edge_trigger_JKFF a2( reset_n, j1, k1, c, led[1]);
   edge_trigger_JKFF a3( reset_n, j2, k2, c, led[2]);
   edge_trigger_JKFF a4( reset_n, j3, k3, c, led[3]);
    
   assign led[4]= led[0]& led[1]& led[2]& led[3];
    
endmodule

module edge_trigger_JKFF(input reset_n, input j, input k, input clk, output reg q);  
    initial begin
      q = 0;
     // q_ = ~q;
    end
    
    always @(posedge clk) begin
        q = (~reset_n) & (j&~q | ~k&q);  // reset_n이 0일 때 동작. 1일 때 0으로 초기화.
       // q_ = ~reset_n | ~q;
    end

endmodule