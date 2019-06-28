module alu
 #(
     parameter DATA_WIDTH = 100
 )   

(
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    input [1:0] mode,
    output logic [DATA_WIDTH-1:0] result
);

logic [DATA_WIDTH-1:0] sum;
logic [DATA_WIDTH-1:0] and_gate;
logic [DATA_WIDTH-1:0] or_gate;
logic [DATA_WIDTH-1:0] not_gate;
//logic [3:0] result;


assign sum = a[DATA_WIDTH-1:0] + b[DATA_WIDTH-1:0];
assign and_gate = a[DATA_WIDTH-1:0] & b[DATA_WIDTH-1:0];
assign or_gate = a[DATA_WIDTH-1:0] | b[DATA_WIDTH-1:0];
assign not_gate = ~a[DATA_WIDTH-1:0];

always @ *
    case(mode)
        2'b00 : result[DATA_WIDTH-1:0] <= sum[DATA_WIDTH-1:0];
        2'b01 : result[DATA_WIDTH-1:0] <= and_gate[DATA_WIDTH-1:0];
        2'b10 : result[DATA_WIDTH-1:0] <= or_gate[DATA_WIDTH-1:0];
        2'b11 : result[DATA_WIDTH-1:0] <= not_gate[DATA_WIDTH-1:0];
        default: result[DATA_WIDTH-1:0] <= {(DATA_WIDTH-1){1'b0}};
    endcase

endmodule

