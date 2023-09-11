module ripple_adder
(
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */

     logic [2:0] ct;
     
     four_cra f0(.A(A[3:0]), .B(B[3:0]), .Ci(cin), .Co(ct[0]), S[3:0]);
     four_cra f1(.A(A[7:4]), .B(B[7:4]), .Ci(ct[0]), .Co(ct[1]), S[7:4]);
     four_cra f2(.A(A[11:8]), .B(B[11:8]), .Ci(ct[1]), .Co(ct[2]), S[11:8]);
     four_cra f3(.A(A[15:12]), .B(B[15:12]), .Ci(ct[2]), .Co(cout), S[15:12]);

endmodule