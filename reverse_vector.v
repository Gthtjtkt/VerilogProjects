/*
reverse_vector.v
Reverses the order of bits in a 100-bit input vector.
*/

module top_module( 
    input [99:0] in,
    output [99:0] out
);

    always @(*) begin
        for (int i=0; i < $bits(out); i++)    // $bits is a system function that returns the number of bits
            out[i] = in[$bits(out) -i - 1];   // reversing the order of the bits
    end
    
endmodule
