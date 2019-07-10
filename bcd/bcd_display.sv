module bcd_display
(
    input clk,
    input reset,
    output [6:0] bcd
);

logic [3:0] counter;
logic [23:0] prescale_counter;


always @(posedge clk or posedge reset)
  begin
    if(reset)
        prescale_counter[23:0] <= 24'h0;
    else
        prescale_counter[23:0] <= prescale_counter + 1'b1;
  end




count_09 counter_instance
(
    .clk(prescale_counter[23]),
    .reset(reset),
    .counter(counter)
);

bcd bcd_instance
(
    .in(counter),
    .out(bcd)
);

endmodule