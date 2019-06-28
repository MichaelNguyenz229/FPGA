`timescale 1ns / 100ps

module alu_tb();

logic [3:0] tb_a;
logic [3:0] tb_b;
logic [1:0] tb_mode;
logic [3:0] tb_result;

alu alu_instance
(
    .a(tb_a),
    .b(tb_b),
    .mode(tb_mode),
    .result(tb_result)
);

initial
    begin

    #5  mode = 2'b10;
        tb_a = 4'ha;
        tb_b = 4'h3;

    #5  mode = 2'b01;
        tb_a = 4'hb;
        tb_b = 4'h2;

    #5  mode = 2'b11;
        tb_a = 4'hd;
        tb_b = 4'hc;

    #5  mode = 2'b00;
        tb_a = 4'hc;
        tb_b = 4'h3;
 
    end

endmodule