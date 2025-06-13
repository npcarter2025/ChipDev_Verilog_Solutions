module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

  parameter IDLE=0, A=1, B=2, C=3, D=4;
  logic [2:0] state, next_state;

  always_comb begin
    case (state)
      IDLE:   next_state = din ? A : IDLE;
      A:      next_state = ~din ? B : A;
      B:      next_state = din ? C : IDLE;
      C:      next_state = ~din ? D : A;
      D:      next_state = din ? C : IDLE;
      default:next_state = IDLE;
    endcase
  end

  always_ff @ (posedge clk) begin
    if(~resetn) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

  always_comb begin
    case (state)
      D: dout = 1;
      default: dout = 0;
    endcase
  end


  //assign dout = (state == D);
  
endmodule