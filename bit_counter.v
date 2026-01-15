/*
bit_counter.v
    Count the number of 1's in the input vector 'in' and output the count in 'out'.
    The input 'in' is 255 bits wide, and the output 'out' is 8 bits wide.
*/  

module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    always @(*) begin
        out = 0;
        for (int i = 0; i < $bits(in); i++) begin
            if (in[i])
                out += 8'b1;
        	else
                out += 8'b0;
        end
    end

endmodule
