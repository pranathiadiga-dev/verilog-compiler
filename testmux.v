module mux2_1(a, b, sel, q);
input a, b, sel;
output reg q; 

always @(*)

    if (sel)
        q = b;
    else
        q= a;
end
endmodule
