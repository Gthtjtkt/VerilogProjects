/*
reduction_operators.v
- Use reduction operators to compute the AND, OR, and XOR of all 100 input bits.
- The outputs are as follows:
  - out_and should be 1 if all bits of in are 1, otherwise 0.
  - out_or should be 1 if any bit of in is 1, otherwise 0.
  - out_xor should be 1 if there is an odd number of 1s in in, otherwise 0.
*/

module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    
    assign out_and = &in[99:0];
    assign out_or  = |in[99:0];
    assign out_xor = ^in[99:0];

endmodule
