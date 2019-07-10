`timescale 1ns / 100ps

module bcd_disply_tb();

logic clk;
logic reset;
logic [6:0] bcd;


bcd_display bcd_display_instance
(
    .clk(clk),
    .reset(reset),
    .bcd(bcd)
);


initial begin
 clk = 1'b0;
 reset = 1;


 #40 reset = 0;

end

always 
    #2 clk = ~clk;

endmodule

