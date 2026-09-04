`timescale 1ns/1ps

module signed_unsigned_comparator_tb;

reg [3:0] A;
reg [3:0] B;
reg       signed_mode;

wire A_greater;
wire A_less;
wire A_equal;

signed_unsigned_comparator uut (
    .A(A),
    .B(B),
    .signed_mode(signed_mode),
    .A_greater(A_greater),
    .A_less(A_less),
    .A_equal(A_equal)
);

initial begin
    $dumpfile("comparator.vcd");
    $dumpvars(0, signed_unsigned_comparator_tb);
end

initial begin

    $monitor("Time=%0t A=%b B=%b Mode=%b | Greater=%b Less=%b Equal=%b",
             $time, A, B, signed_mode,
             A_greater, A_less, A_equal);

    A = 4'b1111;
    B = 4'b0001;
    signed_mode = 1'b0;
    #10;

    A = 4'b0010;
    B = 4'b1010;
    signed_mode = 1'b0;
    #10;

    A = 4'b0101;
    B = 4'b0101;
    signed_mode = 1'b0;
    #10;

    A = 4'b1111;
    B = 4'b0001;
    signed_mode = 1'b1;
    #10;

    A = 4'b1000;
    B = 4'b0111;
    signed_mode = 1'b1;
    #10;

    A = 4'b1110;
    B = 4'b1011;
    signed_mode = 1'b1;
    #10;

    A = 4'b1101;
    B = 4'b1101;
    signed_mode = 1'b1;
    #10;

    $finish;
end

endmodule