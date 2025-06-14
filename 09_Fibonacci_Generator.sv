module model #(parameter
  DATA_WIDTH=32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);
  logic [DATA_WIDTH-1:0] F0, F1;


  always_ff @ (posedge clk) begin
    if (~resetn) begin
      F0 <= 1;
      F1 <= 0;
      out <= 1;
    end else begin
      F0 <= F0 + F1;
      F1 <= F0;
    end
  end
  assign out = F0;
endmodule
