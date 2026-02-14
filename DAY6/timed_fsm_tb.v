module timed_fsm_tb;

reg clk;
reg reset;
wire [1:0] state;

timed_fsm uut (
    .clk(clk),
    .reset(reset),
    .state(state)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #10 reset = 0;
    #90 $finish;
end

endmodule
