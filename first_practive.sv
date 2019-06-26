module my_and_gate
(
    input a,
    input b,
    output y,
    output x,
    output z,
    output g,
    output f
);

assign y = a & b;
assign x = a | b;
assign z = a ^ b;
assign f = ~(a & b);
endmodule

