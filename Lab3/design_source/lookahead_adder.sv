module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
    module group(
        input logic  Cin,
        input  logic [3:0] P, G,
        output logic [3:0] C,
        output logic P_G, G_G
    );

        assign C[0] = Cin;
        assign C[1] = (Cin & P[0]) | (G[0]);
        assign C[2] = (Cin & P[0] & P[1]) | (G[0] & P[1]) | (G[1]);
        assign C[3] = (Cin & P[0] & P[1] & P[2]) | (G[0] & P[1] & P[2]) | (G[1] & P[2]) | (G[2]);

        assign P_G = P[0] & P[1] & P[2] & P[3];
        assign G_G = (G[3]) | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]);

    endmodule

    module single_cla (
        input   logic A, B,
        input   logic C,
        output  logic S,
        output  logic P, G
     );  

        assign P = A ^ B;
        assign G = A & B;
        assign S = A ^ B ^ C;

    endmodule 


    module four_cla (
        input logic [3:0] A, B,
        input  logic Cin,
        output logic P_G, G_G
        output logic [3:0] S,
    );
    
    logic [3:0] C, P, G;

    single_cla s0(.A(A[0]), .B(B[0]), .C(C[0]), .P(P[0]), .G(G[0]), .S(S[0]));
    single_cla s1(.A(A[1]), .B(B[1]), .C(C[1]), .P(P[1]), .G(G[1]), .S(S[1]));
    single_cla s2(.A(A[2]), .B(B[2]), .C(C[2]), .P(P[2]), .G(G[2]), .S(S[2]));
    single_cla s3(.A(A[3]), .B(B[3]), .C(C[3]), .P(P[3]), .G(G[3]), .S(S[3]));

    group gfour(.Cin(Cin), .P(P), .G(G), .C(C), .P_G(P_G), .G_G(G_G));
    
    endmodule

    logic [3:0] C16, P16, G16;

    four_cla f0(.A(A[3:0]), .B(B[3:0]), .Cin(C16[0]), .P_G(P16[0]), .G_G(G16[0]), .S(S[3:0]));
    four_cla f1(.A(A[7:4]), .B(B[7:4]), .Cin(C16[1]), .P_G(P16[1]), .G_G(G16[1]), .S(S[7:4]));
    four_cla f2(.A(A[11:8]), .B(B[11:8]), .Cin(C16[2]), .P_G(P16[2]), .G_G(G16[2]), .S(S[11:8]));
    four_cla f3(.A(A[15:12]), .B(B[15:12]), .Cin(C16[3]), .P_G(P16[3]), .G_G(G16[3]), .S(S[15:12]));

    group gsixteen(.Cin(cin), .P(P16), .G(G16), .C(C16));

    assign cout = (cin & P16[0] & P16[1] & P16[2] & P16[3]) | (G16[0] & P16[1] & P16[2] & P16[3]) | (G16[1] & P16[2] & P16[3]) | (G16[2] & P16[3]) | (G16[3]);

endmodule
