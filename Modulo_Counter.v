module Modulo_Counter(
    input clock,reset,
    output [2:0] count,
    output out
 );
    wire [2:0] add0;
    
    wire [1:0] CO;
    wire resetWire;
    wire restart;
    wire nothing;
    wire checker;
    
    full_adder add_bit0(
        .Bit1(count[0]),
        .Bit2(1'b1),
        .Cin(1'b0),
        .Y(add0[0]),
        .Cout(CO[0])
 );
 
    full_adder add_bit1(
        .Bit1(count[1]),
        .Bit2(CO[0]),
        .Cin(1'b0),
        .Y(add0[1]),
        .Cout(CO[1])
 );
    full_adder add_bit2(
        .Bit1(count[2]),
        .Bit2(CO[1]),
        .Cin(1'b0),
        .Y(add0[2]),
        .Cout(nothing)
 );
    DFF bit0(
        .D (add0[0]),
        .clk(clock),
        .reset(resetWire),
        .Q(count[0])
 );
    DFF bit1(
        .D (add0[1]),
        .clk(clock),
        .reset(resetWire),
        .Q(count[1])
 );
    DFF bit2(
        .D (add0[2]),
        .clk(clock),
        .reset(resetWire),
        .Q(count[2])
 );
    assign resetWire = reset | restart;
    assign restart = count[1] & count[2];
    assign checker = (count == 3'b101);
    
    DFF inst_1(
        .D(out ^ checker),
        .clk(clock),
        .reset(reset),
        .Q(out)
 );
 endmodule