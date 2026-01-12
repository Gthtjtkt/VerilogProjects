/*
32_bit_add_sub.v
A 32-bit adder/subtractor using two instances of a 16-bit adder module.
*/


// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire carry16;
    wire [31:0] b_xor;
    
    // Invert b if sub == 1
    // '(32{sub}}': Replication operator. Creates a vector 32 bits long with the value of sub
    assign b_xor = b ^ {32{sub}};
    
    add16 a16_1 (
        .a(a[15:0]),
        .b(b_xor[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(carry16)
    );

    add16 a16_2 (
        .a(a[31:16]),
        .b(b_xor[31:16]),
        .cin(carry16),
        .sum(sum[31:16]),
        .cout()
    );

endmodule
