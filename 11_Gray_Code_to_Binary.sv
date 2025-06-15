module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] gray,
  output logic [DATA_WIDTH-1:0] bin
);
  //gray = binary ^ (binary >> 1);

  /* 
  Gray to Binary Formula:
  binary[i] = binary[i+1] ^ gray[i]

  Note: The MSB stays the same, since it's xor'd with 0;

  B3 = G3 ^ 0
  B2 = B3 ^ G2
  B1 = B2 ^ G1
  B0 = B1 ^ G0
  */

  //IE Data_width = 16
  // bin[15] = bin[16] ^ gray[15]

  int i;
  always_comb begin
    bin[DATA_WIDTH-1] = gray[DATA_WIDTH-1];

    for (i = 2; i <= DATA_WIDTH; i++) begin
      bin[DATA_WIDTH-i] = bin[DATA_WIDTH - i + 1] ^ gray[DATA_WIDTH - i];
    end
  end


  /* // A DIFFERENT APPROACH
  // Binary[i] = Gray[i] ^ Gray[i + 1] ^ Gray[i + 2] ^ .... ^ Gray[DATA_WIDTH-1]
    int i;
    always @(*) begin
        for(i=0; i<DATA_WIDTH; i++) begin
            bin[i] = ^(gray >> i);
        end
    end

*/

/*
For Example: 
Let gray = 1101

b0 = ^(gray >> 0) = ^(1101) = 1
b1 = ^(gray >> 1) = ^(110) = 0
b2 = ^(gray >> 2) = ^(11) = 0
b3 = ^(gray >> 3) = ^(1) = 1

binary = 1001

//gray = binary ^ (binary >> 1);

1001 ^ 0100 = 1101

gray = 1101


*/


endmodule