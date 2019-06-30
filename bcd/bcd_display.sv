module bcd_display
(
    input clk,
    input reset,
    input cnt_en,
    output [6:0] bcd
);

logic [3:0] counter;

count_09 counter_instance
(
    .clk(clk),
    .reset(reset),
    .cnt_en(cnt_en),
    .counter(counter)
);

bcd bcd_instance
(
    .in(in),
    .out(bcd)
);

endmodule