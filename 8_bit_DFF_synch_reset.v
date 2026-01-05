// 8-bit DFF with Synchronous Reset

module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    
    always @(posedge clk) begin
        if (reset)               // Synchronous -> only takes effect on the clock edge
            q <= 8'b0;
        else
            q <= d;
    end

endmodule
