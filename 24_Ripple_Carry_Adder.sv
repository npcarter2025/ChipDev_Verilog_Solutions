`include "full_adder.sv"
module model #(parameter
    DATA_WIDTH=8
) (
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    output logic [DATA_WIDTH-0:0] sum,
    output logic [DATA_WIDTH-1:0] cout_int
);


    full_adder f0 ( .a(a[0]), .b(b[0]), .cin(1'b0), .cout(cout_int[0]), .sum(sum[0]) );

    genvar i;

    generate
        for (i = 1; i < DATA_WIDTH; i ++ ) begin : fadder 
            full_adder f ( .a(a[i]), .b(b[i]), .cin(cout_int[i-1]), .cout(cout_int[i]), .sum(sum[i]) );
        end 
    endgenerate

    assign sum[DATA_WIDTH] = cout_int[DATA_WIDTH-1];

endmodule