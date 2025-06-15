module model #(parameter
  DATA_WIDTH = 4
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);
  // Gray = Binary ^ (Binary >> 1)
  /* STRATEGY: count in Binary, and then convert it to Gray Code */

  logic [DATA_WIDTH-1:0] counter;

  always_ff @ (posedge clk) begin
    if (~resetn) begin
      counter <= 0;
    end else begin
      counter <= counter + 1; // it'll wrap around automatically.
    end
  end
  assign out = counter ^ (counter >> 1);

endmodule