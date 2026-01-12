/*
4_to_1_mux.v
2-bit select, 4-to-1 multiplexer
Inputs: a, b, c, d (8 bits each)
Select lines: sel (2 bits)
Output: out (8 bits)
*/


module mux2 (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out
);

module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); 

    wire [7:0] mux1_out;
    wire [7:0] mux2_out;
    
    mux2 mux2_1 ( sel[0],    a,    b, mux1_out );
    mux2 mux2_2 ( sel[0],    c,    d, mux2_out );
    mux2 mux2_3 ( sel[1], mux1_out, mux2_out,  out );

endmodule
