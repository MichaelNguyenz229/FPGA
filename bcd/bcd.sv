module bcd
(
    input [3:0] in,
    output [6:0] out
);
always @ *

    case (in)
        4'd0 : out[6:0] = 7'b111_1110;
        4'd1 : out[6:0] = 7'b011_0000;
        4'd2 : out[6:0] = 7'b110_0101;
        4'd3 : out[6:0] = 7'b111_1001;
        4'd4 : out[6:0] = 7'b011_0011;
        4'd5 : out[6:0] = 7'b101_1011;
        4'd6 : out[6:0] = 7'b101_1111;
        4'd7 : out[6:0] = 7'b111_0000;
        4'd8 : out[6:0] = 7'b111_1111;
        4'd9 : out[6:0] = 7'b111_0011;
        default: out[6:0] = 7'b000_0000;
    endcase
    
endmodule
