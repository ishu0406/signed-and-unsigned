module signed_unsigned_comparator (
    input  [3:0] A,
    input  [3:0] B,
    input        signed_mode,

    output reg   A_greater,
    output reg   A_less,
    output reg   A_equal
);

always @(*) begin

    A_greater = 1'b0;
    A_less    = 1'b0;
    A_equal   = 1'b0;

    if (signed_mode == 1'b0) begin
        if (A > B)
            A_greater = 1'b1;
        else if (A < B)
            A_less = 1'b1;
        else
            A_equal = 1'b1;
    end
    else begin
        if ($signed(A) > $signed(B))
            A_greater = 1'b1;
        else if ($signed(A) < $signed(B))
            A_less = 1'b1;
        else
            A_equal = 1'b1;
    end

end

endmodule