//synchronous counter
//design by structural model
// D-flip flop name: d_ff(clk, rst, in, out) : "dff" will cause error:conflict primitives
module counter_mod_8(clk, rst, out);

    input clk, rst;
    output [2:0]out;

    wire w1, w2, w3;
    wire w_U1;
    wire w4, w5, w6;
    wire w_U2;
    

   
    not (A_bar, out[0]);
    not (B_bar, out[1]);
    not (C_bar, out[2]);
    
    and AND_1(w1, out[2], A_bar);
    and AND_2(w2, out[2] , B_bar);
    and AND_3(w3, C_bar, out[1], out[0]);
    or OR_1(w_U1, w1, w2, w3);

    and AND_4(w4, out[1], A_bar);
    and AND_5(w5, B_bar, out[0]);
    or OR_2(w_U2, w5, w4);
   
   
    d_ff U1(.clk(clk), .rst(), .in(w_U1), .out(out[2]));
    d_ff U2(.clk(clk), .rst(), .in(w_U2), .out(out[1]));
    d_ff U3(.clk(clk), .rst(), .in(A_bar), .out(out[0]));
	
	
endmodule
