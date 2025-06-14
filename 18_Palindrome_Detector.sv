module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);
  int i;
  logic [DATA_WIDTH-1:0] reversed;
  always_comb begin
    for (i = 0; i < DATA_WIDTH; i++ ) begin
      reversed[DATA_WIDTH-1-i] = din[i];
    end
  end
  assign dout = (reversed == din);

endmodule