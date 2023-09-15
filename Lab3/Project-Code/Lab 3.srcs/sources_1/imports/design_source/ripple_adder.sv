    module single_cra(
        input logic A, B,
        input logic Ci,
        output logic Co,
        output logic S
    );

        assign S  = A ^ B ^ Ci;
        assign Co = (A & B) | (B & Ci) | (Ci & A);

    endmodule

    module four_cra (
        input logic [3:0] A, B,
        input logic Ci, 
        output logic Co,
        output logic [3:0]S
    );  
        logic [2:0] Ct;

        single_cra s0(.A(A[0]), .B(B[0]), .Ci(Ci), .Co(Ct[0]), .S(S[0]));
        single_cra s1(.A(A[1]), .B(B[1]), .Ci(Ct[0]), .Co(Ct[1]), .S(S[1]));
        single_cra s2(.A(A[2]), .B(B[2]), .Ci(Ct[1]), .Co(Ct[2]), .S(S[2]));
        single_cra s3(.A(A[3]), .B(B[3]), .Ci(Ct[2]), .Co(Co), .S(S[3]));

    endmodule

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
     
     four_cra f0(.A(A[3:0]), .B(B[3:0]), .Ci(cin), .Co(ct[0]), .S(S[3:0]));
     four_cra f1(.A(A[7:4]), .B(B[7:4]), .Ci(ct[0]), .Co(ct[1]), .S(S[7:4]));
     four_cra f2(.A(A[11:8]), .B(B[11:8]), .Ci(ct[1]), .Co(ct[2]), .S(S[11:8]));
     four_cra f3(.A(A[15:12]), .B(B[15:12]), .Ci(ct[2]), .Co(cout), .S(S[15:12]));


endmodule