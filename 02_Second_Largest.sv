module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);
  logic [DATA_WIDTH-1:0] largest, second;

  assign dout = second;

  always_ff @ (posedge clk) begin
    if (!resetn) begin
      second <= 0;
      largest <= 0;
    end else begin
      if (din >= largest && din > second) begin
        second <= largest;
        largest <= din;
      end else if (din > second) begin
        second <= din;
      end
    end
  end
endmodule