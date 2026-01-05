// 16_bit_FF_with_mux_controller.v

// This module makes 16 flip flops, and takes in an enable signal to decide, which set of 8 bits to update
// The enable signal is 2 bits wide, where each bit corresponds to a byte (8 bits) of the 16-bit data input 'd'.

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);

    always @(posedge clk) begin
        if (!resetn) begin
            q <= 16'h0000; // synchronous reset
        end
        else begin
            if (byteena[0])         // if the first bit of the input signal, byteena, is 1, 
                q[7:0] <= d[7:0];   // assign the lower 8 bits of d to the lower 8 bits of q

            if (byteena[1])         // if the second bit of the input signal, byteena, is 1, 
                q[15:8] <= d[15:8]; // assign the upper 8 bits of d to the upper 8 bits of q
        end
    end
    
endmodule
