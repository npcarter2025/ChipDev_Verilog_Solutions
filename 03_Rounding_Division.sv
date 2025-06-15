module model #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);

  /* Step 1: Bit-shift input down and store it in a reg.            call it quotient
  * Then grab the MSB from the bits that were discarded -> should be     din[DIV_LOG2-1]
  * add the quotient and remainder and store it in another reg.     call it rounded
  * now check the overhanging bit of rounded. If it's 1, that means we overflowed.
  */

  logic [OUT_WIDTH:0] quotient;             // Make it 1 extra bit longer so that we can check it for overflow
  assign quotient = din >> DIV_LOG2;


  logic remainder;
  assign remainder = din[DIV_LOG2-1];        


  logic [OUT_WIDTH:0] rounded;               
  assign rounded = quotient + remainder;

  always_comb begin
    if (rounded[OUT_WIDTH]) begin
      dout = quotient[OUT_WIDTH:0];  // it should really be [OUT_WIDTH-1:0] but the synthesis tool will automatically truncate it
    end else begin
      dout = rounded[OUT_WIDTH:0];
    end
  end

endmodule