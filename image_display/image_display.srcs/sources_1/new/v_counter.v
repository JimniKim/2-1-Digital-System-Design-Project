module v_counter(
    input clk,
    input en_V,
    output [10:0] V_Count_Value
    );
             
    wire [10:0]vdd;
    wire reset;
    wire A,B,C,D,E,F,G,H,I,J;
    assign A = V_Count_Value[9];
    assign B = V_Count_Value[8];
    assign C = V_Count_Value[7];
    assign D = V_Count_Value[6];
    assign E = V_Count_Value[5];
    assign F = V_Count_Value[4];
    assign G = V_Count_Value[3];
    assign H = V_Count_Value[2];
    assign I = V_Count_Value[1];
    assign J = V_Count_Value[0];
    assign reset = 1;
    assign vdd[0] = (~H&~J) | (~G&~J) | (~A&~J);
    assign vdd[1] = (~I&J) | (I&~J);
    assign vdd[2] = (~B&~C&~D&~E&~F&~G&H&~J) | (~B&~C&~D&~E&~F&~G&H&~I) | (~B&~C&~D&~E&~F&~H&I&J) | (~A&~H&I&J) | (~A&H&~J) | (~A&H&~I);
    assign vdd[3] = (~B&~C&~D&~E&~F&~G&H&I&J) | (~B&~C&~D&~E&~F&G&~H) | (~A&~G&H&I&J) | (~A&G&~J) | (~A&G&~I) | (~A&G&~H);
    assign vdd[4] = (~F&G&H&I&J) | (F&~J) | (F&~I) | (F&~H) | (F&~G);
    assign vdd[5]  = (~E&F&G&H&I&J)| E&~J | E&~I | E&~H | E&~G | E&~F;
    assign vdd[6] = ~D&E&F&G&H&I&J | D&~J | D&~I | D&~H | D&~G | D&~F | D&~E;
    assign vdd[7] = ~C&D&E&F&G&H&I&J | C&~J | C&~I | C&~H | C&~G | C&~F | C&~E | C&~D;
    assign vdd[8] = ~B&C&D&E&F&G&H&I&J | B&~J | B&~I | B&~H | B&~G | B&~F | B&~E| B&~D | B&~C;
    assign vdd[9] = ~A&B&C&D&E&F&G&H&I&J | A&~B&~C&~D&~E&~F&~H | A&~B&~C&~D&~E&~F&~G;
    assign vdd[10] = 0;
    
    wire [10:0] cash;
    zedge_trigger_D_FF s0(reset, vdd[0], clk & en_V, V_Count_Value[0], cash[0]); 
    zedge_trigger_D_FF s1(reset, vdd[1], clk & en_V, V_Count_Value[1], cash[1]); 
    zedge_trigger_D_FF s2(reset, vdd[2], clk & en_V, V_Count_Value[2], cash[2]); 
    zedge_trigger_D_FF s3(reset, vdd[3], clk & en_V, V_Count_Value[3], cash[3]); 
    zedge_trigger_D_FF s4(reset, vdd[4], clk & en_V, V_Count_Value[4], cash[4]); 
    zedge_trigger_D_FF s5(reset, vdd[5], clk & en_V, V_Count_Value[5], cash[5]); 
    zedge_trigger_D_FF s6(reset, vdd[6], clk & en_V, V_Count_Value[6], cash[6]); 
    zedge_trigger_D_FF s7(reset, vdd[7], clk & en_V, V_Count_Value[7], cash[7]);
    zedge_trigger_D_FF s8(reset, vdd[8], clk & en_V, V_Count_Value[8], cash[8]); 
    zedge_trigger_D_FF s9(reset, vdd[9], clk & en_V, V_Count_Value[9], cash[9]); 
    zedge_trigger_D_FF s10(reset, vdd[10], clk & en_V, V_Count_Value[10], cash[10]); 
    
endmodule  