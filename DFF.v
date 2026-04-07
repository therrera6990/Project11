module DFF(
    input wire D, clk, reset,
    output reg Q,
    output wire qn
);

initial begin
    Q = 0;
end

always @(posedge clk, posedge reset) begin
    if (reset)
        Q <= 1'b0;
    else
        Q <= D;
end

assign qn = ~Q;

endmodule