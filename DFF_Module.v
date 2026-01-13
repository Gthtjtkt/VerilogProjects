/*
DFF module
D flip-flop with clock and data inputs
*/

module dff (
    input clk,
    input d,
    output reg q
);
    always @(posedge clk) begin
        q <= d;
    end
    
endmodule

module top_module (
    input clk,
    input x,
    output z
); 

    wire dff1_d, dff1_q, dff2_d, dff2_q, dff3_d, dff3_q;
    
    assign dff1_d = x ^ dff1_q;
    assign dff2_d = x & ~dff2_q;
    assign dff3_d = x | ~dff3_q;
    assign z = ~(dff1_q | dff2_q | dff3_q);
    
    dff dff1 (
        .d(dff1_d),
        .q(dff1_q),
        .clk(clk)
    );
    
        dff dff2 (
        .d(dff2_d),
        .q(dff2_q),
        .clk(clk)
    );
    
    dff dff3 (
        .d(dff3_d),
        .q(dff3_q),
        .clk(clk)
    );

endmodule
