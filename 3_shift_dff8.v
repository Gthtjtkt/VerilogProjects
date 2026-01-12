/*
3_shift_dff8.v
Description: 8-bit 3-stage shift register with selectable output stage
*/

// module my_dff8 ( input clk, input [7:0] d, output [7:0] q );

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    
    wire [7:0] df1_q;
    wire [7:0] df2_q;
    wire [7:0] df3_q;

    my_dff8 df1 (.clk(clk), .d(d[7:0]), .q(df1_q[7:0]));
    
    my_dff8 df2 (.clk(clk), .d(df1_q[7:0]), .q(df2_q[7:0]));

    my_dff8 df3 (.clk(clk), .d(df2_q[7:0]), .q(df3_q[7:0]));
    
    always @(*) begin
        case (sel)
            2'd0: q = d;
            2'd1: q = df1_q[7:0];
            2'd2: q = df2_q[7:0];
            2'd3: q = df3_q[7:0];
        endcase
    end

endmodule
