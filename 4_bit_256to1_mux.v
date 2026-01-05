// 256 to 1 mux, 4' wide

module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    // syntax [start +: width] -- take 'width' bits ending at 'start', counting upward
    //        [start -: width] -- take 'width' bits ending at 'start', counting down

    // ex: sel = 255
    // starting at bit 255*4, count up the next 4 bits and assign them to 'out'
    assign out = in[sel * 4 +: 4];
    
endmodule
