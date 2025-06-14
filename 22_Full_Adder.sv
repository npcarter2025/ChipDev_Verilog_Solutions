module model (
    input a,
    input b,
    input cin,
    output logic sum,
    output logic cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a | b));

endmodule