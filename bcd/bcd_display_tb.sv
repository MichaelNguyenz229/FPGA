`timescale 1ns / 100ps

module bcd_disply_tb();

logic clk;
logic reset;
logic cnt_en;
logic [6:0] bcd;


bcd_disply bcd_tb
(
    .clk(clk)
    .reset(reset)
    .cnt_en(cnt_en)
    .bcd(bcd)
);


initial begin
 clk = 1'b0;
 reset = 1;
 cnt_en = 1'b0;

 #5 reset = 0;
    cnt_en = 1'b1;
 #40 cnt_en = 1'b0;
 #20 cnt_en = 1'b1;
end

always 
    #2 clk = ~clk;

endmodule

