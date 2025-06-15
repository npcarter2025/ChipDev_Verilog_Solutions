module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
  // COUNT TRAILING ZEROES

  int i;
  always_comb begin
    dout = 0;
    
    for (i = 0; i < DATA_WIDTH; i++ ) begin
      if (din[i] == 1'b1) begin
        break;
      end
      dout = dout + 1;      
    end
  end
endmodule