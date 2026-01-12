/*
    32-bit Adder using 16-bit Adders
    -------------------------------
    This module implements a 32-bit adder by utilizing three instances of a 16-bit adder module.
    The first 16-bit adder computes the sum of the lower 16 bits of the inputs.
    The second and third 16-bit adders compute the sum of the upper 16 bits with and without carry-in respectively.
    The final upper 16 bits of the sum are selected based on whether there was a carry from the lower 16-bit addition.
*/

// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire carry_a16_a;
    wire [15:0] sum_a16_2; 
    wire [15:0] sum_a16_3;
    
    add16 a16_1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(carry_a16_a)
    );
    
    add16 a16_2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_a16_2[15:0]),
        .cout()
    );

    add16 a16_3 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_a16_3[15:0]),
        .cout()
    );

    assign sum[31:16] = carry_a16_a ? sum_a16_3[15:0] : sum_a16_2[15:0];
    
    
endmodule
