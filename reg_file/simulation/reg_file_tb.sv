`timescale 1ns / 100ps

module reg_file_tb();

logic clk;
logic rstn;
logic [1:0] wr_addr;
logic [7:0] wr_data;
logic wren;
logic [1:0] rd_addr;
logic [7:0] rd_data;

reg_file reg_file_instance
(
    .clk_i(clk),
    .rstn_i(rstn),
    .wr_addr_i(wr_addr),
    .wr_data_i(wr_data),
    .wren_i(wren),
    .rd_addr_i(rd_addr),
    .rd_data_o(rd_data)
);

initial
    begin
        clk = 1'b0;
        rstn = 1'b1;
        wren = 1'b0;
        #11 rstn = 1'b0;
        #100 rstn = 1'b1;
        wren = 1'b1;  
        #16 wren = 1'b0;
        rd_addr = 2'b00;
        #4 rd_addr = 2'b01;
        #8 rd_addr = 2'b10;
        #12 rd_addr = 2'b11;

    end

always
    #2 clk = ~clk;

always @ (posedge clk or negedge rstn)
    if(~rstn)
        wr_addr <= 2'b00;
    else 
        wr_addr <= wr_addr + 2'b01;

always @ (posedge clk or negedge rstn)
    if(~rstn)
        wr_data <= 8'b0000_0000;
    else
        wr_data <= wr_data + 8'b0000_0001;



endmodule

