

module seq_det
(
    input clk_i,
    input rstn_i,
    input start_i,
    input serial_i,
    output dectected_o
);

parameter IDLE = 3'b000;
parameter WAIT = 3'b001;
parameter STAGE1 = 3'b010;
parameter STAGE2 = 3'b011;
parameter STAGE3 = 3'b100;
parameter STAGE4 = 3'b101;

logic [2:0] cur_state;
logic [2:0] nxt_state;

// state register

always @(posedge clk_i or negedge rstn_i)
    if(~rstn_i)
        cur_state <= IDLE;
    else
        cur_state <= nxt_state;


// next state logic

always @ *
 begin
     case(cur_state)
        IDLE : 
            if(start_i)
                nxt_state = WAIT;
            else    
                nxt_state = IDLE;
        WAIT:
            if(serial_i)
                nxt_state = STAGE1;
            else
                nxt_state = WAIT;
        
        STAGE1:
            if(serial_i)
                nxt_state = WAIT;
            else    
                nxt_state = STAGE2;
        
        STAGE2:
            if(serial_i)
                nxt_state = STAGE3;
            else    
                nxt_state = WAIT;
        
        STAGE3:
            if(serial_i)
                nxt_state = STAGE4;
            else
                nxt_state = WAIT;
        
        STAGE4: nxt_state = IDLE;

        default: nxt_state = IDLE;

     endcase

 end

assign dectected_o = cur_state == STAGE4;

 endmodule
      