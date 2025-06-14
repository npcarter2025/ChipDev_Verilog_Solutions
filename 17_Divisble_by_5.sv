module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

  
  logic [2:0] state, next_state;

  parameter IDLE=0,
            MOD0=1,
            MOD1=2,
            MOD2=3,
            MOD3=4,
            MOD4=5;
  /* THINK: if you double the previous number and add 1, what is the new number % 5?
  * Secondly: If you double the prev number, what is the new number % 5?
  * Advice: just think in decimal base. 
  */
  always_comb begin
    case (state)
      IDLE: next_state = din ? MOD1 : MOD0;  
      MOD0: next_state = din ? MOD1 : MOD0; 
      MOD1: next_state = din ? MOD3 : MOD2;
      MOD2: next_state = din ? MOD0 : MOD4;
      MOD3: next_state = din ? MOD2 : MOD1;
      MOD4: next_state = din ? MOD4 : MOD3;
      default: next_state = IDLE;
    endcase
  end

  always_ff @(posedge clk) begin
      if (!resetn)
          state <= IDLE;
      else
          state <= next_state;
  end

  // Output is 1 when state == 0 (divisible by 5)
  assign dout = (state == MOD0);


endmodule