`timescale 1ns / 100ps

module seq_det_tb();

    logic clk;
    logic rstn;
    logic start;
    logic serial;
    
    seq_det seq_det_instance
    (
       .clk_i(clk),
       .rstn_i(rstn),
       .start_i(start),
       .serial_i(serial),
       .dectected_o(dectected)
    );

initial
    begin
        clk = 1'b0;
        rstn = 1'b0;
        #20 rstn =1'b1;
        #4 start = 1'b1;
        #1 serial = 1'b1;
        #4 serial = 1'b1;
        #4 serial = 1'b1;
        #4 serial = 1'b1;
        #4 serial = 1'b0;
        #4 serial = 1'b1;
        #4 serial = 1'b1;
        #4 serial = 1'b0;
        #4 serial = 1'b1;

    end

    always 
        #2 clk = ~clk;

endmodule