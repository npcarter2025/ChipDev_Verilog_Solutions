module model #(parameter
    DATA_WIDTH = 8
) (
    input [DATA_WIDTH-1:0] codeIn,
    output reg isThermometer
);

    //    assign themometerEncoding = (256'd1 << (bin + 1)) - 1;
    // basically need to check that codeIn[0] == 1 and that there is only 1 other transition

    logic [$clog2(DATA_WIDTH)-1:0] transitions;
    
    int i;
    always_comb begin
        transitions = 0;
        for (i = 0; i < DATA_WIDTH-1; i++) begin
            transitions = (codeIn[i] != codeIn[i+1]) ? transitions + 1'b1: transitions;
        end
    end

    assign isThermometer = (transitions == 1);

endmodule