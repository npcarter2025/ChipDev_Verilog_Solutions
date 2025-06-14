module model (
  input clk,
  input resetn,
  input [4:0] init,
  input din,
  output logic seen
);
  logic [4:0] left_shift;
  logic [2:0] count;
  logic [4:0] target;

  always_ff @ (posedge clk) begin
    if (~resetn) begin
      left_shift <= 5'b0;
      count <= 0;
    end else begin
      
      if (count < 5)
        count <= count + 1;
      left_shift <= {left_shift, din};
    end
  end
  
  assign seen = (left_shift == target) && (count == 5);
  assign target = (resetn & count == 0) ? init : target;
endmodule