module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
  int i;
  logic [$clog2(DATA_WIDTH):0] result;

  always_comb begin
    result = 0;
    for (i = 0; i < DATA_WIDTH; i++ ) begin
      result = result + din[i];
    end
  end
  assign dout = result;

endmodule