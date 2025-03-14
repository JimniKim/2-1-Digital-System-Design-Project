module top(
    input oclk,
    output Hsync,
    output Vsync,
    output [3:0] Red,
    output [3:0] Green,
    output [3:0] Blue,
    input btn1, btn2, btn3, btn4, reset_x,
    output [4:0] led
    
    );
   
    board b(btn1, btn2, btn3, btn4, oclk, reset_x, led);
    wire clk;
    clock_divider dd(oclk, clk);
    wire enV;
    wire [10:0] H_Count;
    wire [10:0] V_Count;
    wire reset = 0;
    wire [10:0] cash;
    h_counter hh(clk, enV, H_Count);
    v_counter vv(clk, enV, V_Count);
    
    
    wire check1, check2;
    wire [10:0] HCompare;
    wire [10:0] VCompare;
    wire [1:0] val;
    assign val[1] = 1;
    assign val[0] = 0;
    
    assign HCompare =10'b001100000;
    assign VCompare= 10'b000000010;
    lt10 hcheck(H_Count, HCompare, check1);
    lt10 vcheck(V_Count, VCompare, check2);
    mux2to1 hsn(val,check1,Hsync);
    mux2to1 vsn(val,check2,Vsync);
    
    //여기만 이미지 맞는 비트 할당 해주면 됨 rom에 알맞은 rgb 할당해놓으면 될 듯
    wire [10:0]HMAX;
    wire [10:0] HMIN;
    wire [10:0] VMAX;
    wire [10:0] VMIN;
    assign HMAX = 10'b1100010000;
    assign HMIN = 10'b10001111;
    assign VMAX = 10'b1000000011;
    assign VMIN = 10'b100011;
    wire gtHMIN, ltHMAX, gtVMIN, ltVMAX;
    lt10 HMAXCH(H_Count, HMAX, ltHMAX);
    lt10 VMAXCH(V_Count, VMAX, ltVMAX);
    gt10 HMINCH(H_Count, HMIN, gtHMIN);
    gt10 VMINCH(V_Count, VMIN, gtVMIN);
    
    wire [1:0] rcolor1;
    wire [1:0] rcolor2;
    wire [1:0] rcolor3;
    wire [1:0] rcolor0;
    wire [1:0] gcolor1;
    wire [1:0] gcolor2;
    wire [1:0] gcolor3;
    wire [1:0] gcolor0;
    wire [1:0] bcolor1;
    wire [1:0] bcolor2;
    wire [1:0] bcolor3;
    wire [1:0] bcolor0;
    assign rcolor0[0] = 0;
    assign rcolor0[1] = led[0];
    assign rcolor1[0] = 0;
    assign rcolor1[1] = led[1];
    assign rcolor2[0] = 0;
    assign rcolor2[1] = led[2];
    assign rcolor3[0] = 0;
    assign rcolor3[1] = led[3];
    assign gcolor0[0] = 0;
    assign gcolor0[1] = led[3];
    assign gcolor1[0] = 0;
    assign gcolor1[1] = led[2];
    assign gcolor2[0] = 0;
    assign gcolor2[1] = led[1];
    assign gcolor3[0] = 0;
    assign gcolor3[1] = led[0];
    assign bcolor0[0] = 0;
    assign bcolor0[1] = led[2];
    assign bcolor1[0] = 0;
    assign bcolor1[1] = led[1];
    assign bcolor2[0] = 0;
    assign bcolor2[1] = led[3];
    assign bcolor3[0] = 0;
    assign bcolor3[1] = led[0];
    
    mux2to1 r0(rcolor0, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Red[0]);
    mux2to1 g0(gcolor0, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Blue[0]);
    mux2to1 b0(bcolor0, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Green[0]);
    mux2to1 r1(rcolor1, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Red[1]);
    mux2to1 g1(gcolor1, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Blue[1]);
    mux2to1 b1(bcolor1, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Green[1]);
    mux2to1 r2(rcolor2, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Red[2]);
    mux2to1 g2(gcolor2, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Blue[2]);
    mux2to1 b2(bcolor2, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Green[2]);
    mux2to1 r3(rcolor3, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Red[3]);
    mux2to1 g3(gcolor3, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Blue[3]);
    mux2to1 b3(bcolor3, ltHMAX & ltVMAX & gtHMIN & gtVMIN, Green[3]);

endmodule     