module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);
  logic [DATA_WIDTH-1:0] shift;
   
  always_ff @ (posedge clk) begin
    if (~resetn)
      shift <= 0;
    else if (din_en) begin
      shift <= din; 
    end else begin
      shift <= shift >> 1;
    end
  end

  assign dout = shift[0];
endmodule