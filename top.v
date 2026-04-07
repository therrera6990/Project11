module top(
    input wire btnC, btnU, reset,
    output wire [6:0] led
   );


Modulo_Counter Modulo_Counter_inst (
    .clock(btnC),
    .reset(btnU),
    .count(led[5:3]),
    .out(led[6])
);

Ripple_Counter Ripple_Counter_inst (
    .clock(btnC),
    .reset(btnU),
    .count(led[2:0])
);
endmodule