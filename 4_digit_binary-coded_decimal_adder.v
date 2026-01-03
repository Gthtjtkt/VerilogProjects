// 4 digit binary-coded decimal adder

// module bcd_fadd (
//     input [3:0] a,
//    input [3:0] b,
//    input     cin,
//    output   cout,
//    output [3:0] sum );

module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [2:0] facout;
    
    // digit 1
    bcd_fadd fa1 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(sum[3:0]),
        .cout(facout[0])
    );
    
    // digit 2
    bcd_fadd fa2 (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(facout[0]),
        .sum(sum[7:4]),
        .cout(facout[1])
    );
	
    // digit 3
    bcd_fadd fa3 (
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(facout[1]),
        .sum(sum[11:8]),
        .cout(facout[2])
    );

    // digit 4
    bcd_fadd fa4 (
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(facout[2]),
        .sum(sum[15:12]),
        .cout(cout)
    );        

endmodule
