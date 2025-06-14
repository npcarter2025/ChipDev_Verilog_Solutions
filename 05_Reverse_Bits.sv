module model #(parameter
  DATA_WIDTH=32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

  int i;

  logic [DATA_WIDTH-1:0] shift_reg;

  always_comb begin
    for (i = 0; i < DATA_WIDTH; i++ ) begin
      shift_reg[DATA_WIDTH-1-i] = din[i];

    end
  end
  assign dout = shift_reg;


endmodule