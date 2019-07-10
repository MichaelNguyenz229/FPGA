module reg_file
(
    input clk_i,
    input rstn_i,
    input [1:0] wr_addr_i,
    input [7:0] wr_data_i,
    input wren_i,
    input [1:0] rd_addr_i,
    output logic [7:0] rd_data_o
);

logic [3:0] reg_hit;
logic [7:0] register [0:3];  // array of logic
logic [7:0] rd_data;

// decode the address for register write hit

always @ (wr_addr_i)
    case (wr_addr_i)
        2'b00: reg_hit[3:0] = 4'b0001;
        2'b01: reg_hit[3:0] = 4'b0010;
        2'b10: reg_hit[3:0] = 4'b0100;
        2'b11: reg_hit[3:0] = 4'b1000;
        default: reg_hit[3:0] = 4'b0000;

    endcase


/// register 1
always @(posedge clk_i or negedge rstn_i)
  begin
    if(~rstn_i)
        register[0] <= 8'h0;

    else if(reg_hit[0] == 1'b1 & wren_i == 1'b1)
        register[0] <= wr_data_i;
  end


 /// register 2

always @(posedge clk_i or negedge rstn_i)
  begin
    if(~rstn_i)
        register[1] <= 8'h0;

    else if(reg_hit[1] == 1'b1 & wren_i == 1'b1)
        register[1] <= wr_data_i;
  end


   /// register 3

always @(posedge clk_i or negedge rstn_i)
  begin
    if(~rstn_i)
        register[2] <= 8'h0;

    else if(reg_hit[2] == 1'b1 & wren_i == 1'b1)
        register[2] <= wr_data_i;
  end


   /// register 4

  always @(posedge clk_i or negedge rstn_i)
  begin
    if(~rstn_i)
        register[3] <= 8'h0;

    else if(reg_hit[3] == 1'b1 & wren_i == 1'b1)
        register[3] <= wr_data_i;
  end



//// reading register
/// mux select reg for reading
always @ *
    case (rd_addr_i)
        4'h0 : rd_data = register[0];
        4'h1 : rd_data = register[1];
        4'h2 : rd_data = register[2];
        4'h3 : rd_data = register[3];
        default: rd_data = 4'b0000;
endcase

always @(posedge clk_i)
    rd_data_o <= rd_data;

endmodule



