module bcd
(
    input [3:0] in,
    output logic [6:0] out
);
always @ (in)
    case (in)
        4'b0 : out[6:0] = 7'b000_0001;
        4'd1 : out[6:0] = 7'b100_1111;
        4'd2 : out[6:0] = 7'b001_0010;
        4'd3 : out[6:0] = 7'b000_0110;
        4'd4 : out[6:0] = 7'b100_1100;
        4'd5 : out[6:0] = 7'b010_0100;
        4'd6 : out[6:0] = 7'b010_0000;
        4'd7 : out[6:0] = 7'b000_1111;
        4'd8 : out[6:0] = 7'b000_0000;
        4'd9 : out[6:0] = 7'b000_1100;
        default: out[6:0] = 7'b111_1111;
    endcase
    
endmodule
