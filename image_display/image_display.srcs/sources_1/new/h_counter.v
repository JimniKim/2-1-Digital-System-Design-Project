module h_counter(
    input clk,
    output en_V,
    output [10:0] H_Count_Value
    );

    wire [10:0]vdd;
    wire reset;
    assign reset = 1;
    assign vdd[0] = ~H_Count_Value[0]; 
    assign vdd[1]  = (~H_Count_Value[1]&H_Count_Value[0]) |  (H_Count_Value[1]& ~H_Count_Value[0]); 
    assign vdd[2]  = (~H_Count_Value[2]&H_Count_Value[1]&H_Count_Value[0]) |  (H_Count_Value[2]& ~H_Count_Value[0]) |  (H_Count_Value[2] & ~H_Count_Value[1]); 
    assign vdd[3]  = (~H_Count_Value[3]&H_Count_Value[2]&H_Count_Value[1]&H_Count_Value[0]) |  (H_Count_Value[3]&~H_Count_Value[0]) | (H_Count_Value[3]&~H_Count_Value[1]) |  (H_Count_Value[3]&~H_Count_Value[2]); 
    assign vdd[4]  = (~H_Count_Value[4]&H_Count_Value[3]&H_Count_Value[2]&H_Count_Value[1]& H_Count_Value[0]) | (H_Count_Value[4]&~H_Count_Value[0]) |  (H_Count_Value[4]& ~H_Count_Value[1]) | (H_Count_Value[4]&~H_Count_Value[2]) | (H_Count_Value[4]& ~H_Count_Value[3]); 
    assign vdd[5]  = (~H_Count_Value[8]&~H_Count_Value[5]&H_Count_Value[4]&H_Count_Value[3]& H_Count_Value[2]&H_Count_Value[1]&H_Count_Value[0]) | (~H_Count_Value[9]&~H_Count_Value[5] &H_Count_Value[4]&H_Count_Value[3]&H_Count_Value[2]&H_Count_Value[1]&H_Count_Value[0]) | (H_Count_Value[5]&~H_Count_Value[0]) | (H_Count_Value[5]&~H_Count_Value[1]) | (H_Count_Value[5]&~H_Count_Value[2]) | (H_Count_Value[5]&~H_Count_Value[3]) |  (H_Count_Value[5]&~H_Count_Value[4]); 
    assign vdd[6]  = (~H_Count_Value[6]&H_Count_Value[5]&H_Count_Value[4]&H_Count_Value[3]& H_Count_Value[2]&H_Count_Value[1]&H_Count_Value[0]) | (H_Count_Value[6]&~H_Count_Value[0]) | (H_Count_Value[6]&~H_Count_Value[1]) | (H_Count_Value[6]&~H_Count_Value[2]) |  (H_Count_Value[6]&~H_Count_Value[3]) | (H_Count_Value[6]&~H_Count_Value[4]) |  (H_Count_Value[6]&~H_Count_Value[5]); 
    assign vdd[7]  =  (~H_Count_Value[7]&H_Count_Value[6]&H_Count_Value[5]&H_Count_Value[4]& H_Count_Value[3]&H_Count_Value[2]&H_Count_Value[1]&H_Count_Value[0]) | (H_Count_Value[7]& ~H_Count_Value[0]) | (H_Count_Value[7]&~H_Count_Value[1]) | (H_Count_Value[7]& ~H_Count_Value[2]) | (H_Count_Value[7]&~H_Count_Value[3]) | (H_Count_Value[7]& ~H_Count_Value[4]) | (H_Count_Value[7]&~H_Count_Value[5]) | (H_Count_Value[7]& ~H_Count_Value[6]); 
    assign vdd[8]  = ((~H_Count_Value[8]&H_Count_Value[7]&H_Count_Value[6]&H_Count_Value[5]&H_Count_Value[4]&H_Count_Value[3]&H_Count_Value[2]&H_Count_Value[1]&H_Count_Value[0])| (H_Count_Value[8]&~H_Count_Value[7]&~H_Count_Value[6]&~H_Count_Value[5]&~H_Count_Value[0])| (H_Count_Value[8]&~H_Count_Value[7]&~H_Count_Value[6]&~H_Count_Value[5]&~H_Count_Value[1])|(H_Count_Value[8]&~H_Count_Value[7]&~H_Count_Value[6]&~H_Count_Value[5]&~H_Count_Value[2])|(H_Count_Value[8]&~H_Count_Value[7]&~H_Count_Value[6]&~H_Count_Value[5]&~H_Count_Value[3])|(H_Count_Value[8]&~H_Count_Value[7]&~H_Count_Value[6]&~H_Count_Value[5]&~H_Count_Value[4])|(~H_Count_Value[9]&H_Count_Value[8]&~H_Count_Value[0])|(~H_Count_Value[9]&H_Count_Value[8]&~H_Count_Value[1])|(~H_Count_Value[9]&H_Count_Value[8]&~H_Count_Value[2])|(~H_Count_Value[9]&H_Count_Value[8]&~H_Count_Value[3])|(~H_Count_Value[9]&H_Count_Value[8]&~H_Count_Value[4])|(~H_Count_Value[9]&H_Count_Value[8]&~H_Count_Value[5]|~H_Count_Value[9]&H_Count_Value[8]&~H_Count_Value[6])|(~H_Count_Value[9]&H_Count_Value[8]&~H_Count_Value[7]));
    assign vdd[9]  =  (H_Count_Value[8]&H_Count_Value[7]&H_Count_Value[6]&H_Count_Value[5]& H_Count_Value[4]&H_Count_Value[3]&H_Count_Value[2]&H_Count_Value[1]&H_Count_Value[0]) |  (H_Count_Value[9]&~H_Count_Value[0]) | (H_Count_Value[9]&~H_Count_Value[1]) |  (H_Count_Value[9]&~H_Count_Value[2]) | (H_Count_Value[9]&~H_Count_Value[3]) |  (H_Count_Value[9]&~H_Count_Value[4]) | (H_Count_Value[9]&~H_Count_Value[8]); 
    assign vdd[10] = 0;
    
    wire [10:0] cash;
    zedge_trigger_D_FF s0(reset, vdd[0], clk, H_Count_Value[0], cash[0]); 
    zedge_trigger_D_FF s1(reset, vdd[1], clk, H_Count_Value[1], cash[1]); 
    zedge_trigger_D_FF s2(reset, vdd[2], clk, H_Count_Value[2], cash[2]); 
    zedge_trigger_D_FF s3(reset, vdd[3], clk, H_Count_Value[3], cash[3]); 
    zedge_trigger_D_FF s4(reset, vdd[4], clk, H_Count_Value[4], cash[4]); 
    zedge_trigger_D_FF s5(reset, vdd[5], clk, H_Count_Value[5], cash[5]); 
    zedge_trigger_D_FF s6(reset, vdd[6], clk, H_Count_Value[6], cash[6]); 
    zedge_trigger_D_FF s7(reset, vdd[7], clk, H_Count_Value[7], cash[7]);
    zedge_trigger_D_FF s8(reset, vdd[8], clk, H_Count_Value[8], cash[8]); 
    zedge_trigger_D_FF s9(reset, vdd[9], clk, H_Count_Value[9], cash[9]); 
    zedge_trigger_D_FF s10(reset, vdd[10], clk, H_Count_Value[10], cash[10]); 
    assign en_V = (H_Count_Value[0] & H_Count_Value[1] & H_Count_Value[2] & H_Count_Value[3] & H_Count_Value[4] & ~H_Count_Value[5] & ~H_Count_Value[6] & ~H_Count_Value[7] & H_Count_Value[8] & H_Count_Value[9]);          

endmodule  