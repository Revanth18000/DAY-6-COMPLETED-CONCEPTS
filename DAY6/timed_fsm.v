module timed_fsm(
    input clk,
    input reset,
    output reg [1:0] state
);

parameter RED = 2'b00;
parameter GREEN = 2'b01;
parameter YELLOW = 2'b10;

reg [2:0] count;   // small counter

always @(posedge clk) begin
    if (reset) begin
        state <= RED;
        count <= 0;
    end
    else begin
        case(state)
            RED: begin
                if (count == 3) begin
                    state <= GREEN;
                    count <= 0;
                end else
                    count <= count + 1;
            end

            GREEN: begin
                if (count == 2) begin
                    state <= YELLOW;
                    count <= 0;
                end else
                    count <= count + 1;
            end

            YELLOW: begin
                if (count == 1) begin
                    state <= RED;
                    count <= 0;
                end else
                    count <= count + 1;
            end
        endcase
    end
end

endmodule
