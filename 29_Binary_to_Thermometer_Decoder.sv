module model (
    input [7:0] din,
    output reg [255:0] dout
);
    // if N = 8:
    // 2 ** N- bit digital words.
    // m + N - m = 256


    //==== FIRST APPROACH========//
    // int i;

    // always @ (*) begin
        
    //     //dout = 256'b0;
    //     dout = 256'd1;
    //     for (i = 0; i < din; i++) begin
    //         dout[i+1] = 1;
    //     end
    // end


    //======ONE LINER ANSWER====
    assign dout = (256'd1 << (din + 1)) - 1;

/*
00 -> 0000 0001
01 -> 0000 0011
10 -> 0000 0111
*/

endmodule


