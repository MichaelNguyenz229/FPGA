module count_09
(
    input clk,
    input reset,
    output logic [3:0] counter
);
always @(posedge clk or posedge reset)
    begin
        if(reset)
            counter <= 4'b0000;
        else if (counter != 4'h9)
            counter[3:0] <= counter[3:0] + 4'b0001;
        else if(counter == 4'h9)
            counter <= 4'b0000;
    end
endmodule