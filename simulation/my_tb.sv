`timescale 1ns / 1ps

module my_tb();
//instatiation of DUT

logic [31:0] tb_a;
logic [31:0] tb_b;
logic [31:0] tb_add_out;

 
first_practice DUT
(
     .a(tb_a),
     .b(tb_b),
     .add_out(tb_add_out)
  

);

initial begin /// force stimulus
       tb_a = 32'h0;
        tb_b = 32'h0;

    #10 tb_a = 32'ha;
        tb_b = 32'hc;
    
     #10 tb_a = 32'hb;
        tb_b = 32'h2;

  #10 tb_a = 32'h4;
        tb_b = 32'h1;

end



endmodule
