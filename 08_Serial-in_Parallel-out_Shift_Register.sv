module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);

  always_ff @ (posedge clk) begin
    if (~resetn)
      dout <= 0;
    else
      dout <= {dout[DATA_WIDTH-1:0], din};
  end


endmodule