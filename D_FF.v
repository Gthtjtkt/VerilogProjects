// D Flip-Flop

module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//
	
    always @(posedge clk) begin // whenever the clock signal is on a rising edge
        q <= d; // Copy d into q
    end

endmodule
