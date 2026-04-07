//module tff(
//    input wire T, clk, reset,
//    output wire Q, qn
//);

//wire d_internal;
//wire q_internal;
//wire qn_internal;


//assign d_internal = T ^ q_internal;


//DFF t_diff(

//.reset(reset),

//    .D(d_internal),
//    .clk(clk),
//    .Q(q_internal),
//    .qn(qn_internal)
//);
//assign Q = q_internal;
//assign qn = qn_internal;

//endmodule



module tff(
    input T, clk, reset,
    output reg Q, 
    output qn
    );
    
    initial begin
        Q <= 0;
    end
    
    always @ (posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
          else if (clk)
            Q <= Q ^ T;
          end
          
     assign qn = ~Q;

    endmodule  
