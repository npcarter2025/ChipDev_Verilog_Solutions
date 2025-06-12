module model (
  input clk,
  input resetn,
  input din,
  output dout
);

  logic [1:0] old;

  always_ff @ (posedge clk) begin
    if (~resetn) begin
      //dout <= 0;
      old <= 0;
    end else
      old <= {old[0], din};
    
  end

  assign dout = (old == 2'b01);

endmodule