module alu
(
    input [3:0] a,
    input [3:0] b,
    input [1:0] mode,
    output [3:0] result
);

logic [3:0] sum;
logic [3:0] and_gate;
logic [3:0] or_gate;
logic [3:0] not_gate;

assign sum = a[3:0] + b[3:0];
assign and_gate = a[3:0] & b[3:0];
assign or_gate = a[3:0] | b[3:0];
assign not_gate = ~a[3:0];

always @ *
    case(mode)
        2'b00 : result[3:0] = sum[3:0];
        2'b01 : result[3:0] = and_gate[3:0];
        2'b10 : result[3:0] = or_gate[3:0];
        2'b11 : result[3:0] = not_gate[3:0];
        default: result[3:0] = 4'b0000;
    endcase

endmodule

