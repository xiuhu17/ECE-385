    module single_cra(
        input logic A, B,
        input logic Control,
        input logic Ci,
        output logic Co,
        output logic S
    );
        assign B2 = B ^ Control;
        assign S  = A ^ B2 ^ Ci;
        assign Co = (A & B2) | (B2 & Ci) | (Ci & A);

    endmodule


module ripple_adder
(
	input  [8:0] A, B,
	input         cin,
	output [8:0] S,
	output        cout
);

     logic [7:0] ct;
     
     single_cra s0(.A(A[0]), .B(B[0]), .Ci(cin), .Control(cin), .Co(ct[0]), .S(S[0]));
     single_cra s0(.A(A[1]), .B(B[1]), .Ci(ct[0]), .Control(cin), .Co(ct[1]), .S(S[1]));
     single_cra s0(.A(A[2]), .B(B[2]), .Ci(ct[1]), .Control(cin), .Co(ct[2]), .S(S[2]));
     single_cra s0(.A(A[3]), .B(B[3]), .Ci(ct[2]), .Control(cin), .Co(ct[3]), .S(S[3]));
     single_cra s0(.A(A[4]), .B(B[4]), .Ci(ct[3]), .Control(cin), .Co(ct[4]), .S(S[4]));
     single_cra s0(.A(A[5]), .B(B[5]), .Ci(ct[4]), .Control(cin), .Co(ct[5]), .S(S[5]));
     single_cra s0(.A(A[6]), .B(B[6]), .Ci(ct[5]), .Control(cin), .Co(ct[6]), .S(S[6]));
     single_cra s0(.A(A[7]), .B(B[7]), .Ci(ct[6]), .Control(cin), .Co(ct[7]), .S(S[7]));
     single_cra s0(.A(A[8]), .B(B[8]), .Ci(ct[7]), .Control(cin), .Co(cout), .S(S[8]));

endmodule