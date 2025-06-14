module model (
  input clk,
  input resetn,
  output logic div2,
  output logic div4,
  output logic div6
);

  logic [2:0] counter;
  logic [2:0] count6;

  always @ (posedge clk) begin
    if (~resetn) begin
      counter <= 0;
    end else if (counter < 3) begin
      counter <= counter + 1;
    end else
      counter <= 0;
  end
  
  always @ (posedge clk) begin
    if (~resetn) begin
      count6 <= 0;
    end else if (count6 < 5) begin
      count6 <= count6 + 1;
    end else
      count6 <= 0;
  end
  
  assign div2 = counter[0];
  assign div4 = (counter == 1 || counter == 2);
  assign div6 = (count6 == 1 || count6 == 2 || count6 == 3);
endmodule