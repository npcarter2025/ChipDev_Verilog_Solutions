module model (
    input [7:0] din,
    input clk,
    input resetn,
    output reg [17:0] dout,
    output reg run
);  
  
    logic [7:0] A [0:2];
    logic [7:0] B [0:1];

    logic [17:0] product;
    // Typedef for FSM states
    typedef enum logic [2:0] {
        A1 = 0,
        A2 = 1,
        A3 = 2,
        B1 = 3,
        B2 = 4,
        B3 = 5
    } state_t;

    state_t state, next_state;

    // Next state logic
    always_comb begin
        case (state)
            A1: next_state = A2;
            A2: next_state = A3;
            A3: next_state = B1;
            B1: next_state = B2;
            B2: next_state = B3;
            B3: next_state = A1;  // Loop back for next set
            default: next_state = A1;
        endcase
    end

    // Sequential logic 
    always_ff @(posedge clk) begin
        if (!resetn) begin
            state <= A1;
            A[0] <= 8'd0; 
            A[1] <= 8'd0; 
            A[2] <= 8'd0;
            B[0] <= 8'd0; 
            B[1] <= 8'd0; 
            product  <= 18'd0;
            dout <= 18'd0;
            run  <= 1'b1; // Assert run during reset
        end else begin
            state <= next_state;
            run <= 1'b0; 

            case (state)
                A1: A[0] <= din;
                A2: A[1] <= din;
                A3: A[2] <= din;
                B1: B[0] <= din;
                B2: B[1] <= din;
                B3: begin
                    
                    product <= A[0] * B[0] + A[1] * B[1] + A[2] * din;
                    dout <= A[0] * B[0] + A[1] * B[1] + A[2] * din;
                    run <= 1'b1;
                end
            endcase
        end
    end
endmodule

/*
module model (
    input [7:0] din,
    input clk,
    input resetn,
    output reg [17:0] dout,
    output reg run
);  
  

    logic [7:0] A [0:2];  // a1, a2, a3
    logic [7:0] B [0:1];  // b1, b2, b3

    logic [2:0] count;   

    logic [17:0] product;

    always_ff @(posedge clk) begin
        if (!resetn) begin
            count <= 0;
            A[0] <= 0; 
            A[1] <= 0; 
            A[2] <= 0;
            B[0] <= 0; 
            B[1] <= 0; 
            product <= 0;
            dout  <= 0;
            run   <= 1;  
        end else begin
            run <= 0; 

            case (count)
                0: A[0] <= din;
                1: A[1] <= din;
                2: A[2] <= din;
                3: B[0] <= din;
                4: B[1] <= din;
                5: begin
 
                    product <= A[0] * B[0] + A[1] * B[1] + A[2] * din;
                    dout <= A[0] * B[0] + A[1] * B[1] + A[2] * din;
                    run  <= 1;  // Signal valid output for 1 cycle
                end
            endcase

            // Increment or wrap counter
            if (count == 5)
                count <= 0;
            else
                count <= count + 1;
        end
    end
endmodule
*/


