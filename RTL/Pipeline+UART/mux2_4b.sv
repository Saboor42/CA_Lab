module mux2_4b(
    input logic s,
    input logic [3:0] a0,a1,
    output logic [3:0] y
);
    always_comb begin
        case(s)
        1'h0:  y = a0;
        1'h1:  y = a1;
        endcase
    end 

endmodule