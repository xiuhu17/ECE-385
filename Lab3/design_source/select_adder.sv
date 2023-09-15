module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
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

    module two_four_sel (
        input logic [3:0] A, B,
        input logic C_sel_in,
        output logic C_sel_out,
        output logic [3:0] S
    );  
        logic Co_0, Co_1;
        logic [3:0] S_0, S_1;

        four_cra f0(.A(A), .B(B), .Ci(1'b0), .Co(Co_0), .S(S_0));
        four_cra f1(.A(A), .B(B), .Ci(1'b1), .Co(Co_1), .S(S_1));

        always_comb
		begin
				unique case(C_sel_in)
						1'b0	:	S = S_0;
						1'b1	:	S = S_1;
				endcase
				C_sel_out = (C_sel_in & Co_1) | (Co_0);
		end

    endmodule

    logic [2:0] Ct;
    four_cra        ff0(.A(A[3:0]), .B(B[3:0]), .Ci(cin), .Co(Ct[0]), .S(S[3:0]));
    two_four_sel    tf1(.A(A[7:4]), .B(B[7:4]), .C_sel_in(Ct[0]), .C_sel_out(Ct[1]), .S(S[7:4]));
    two_four_sel    tf2(.A(A[11:8]), .B(B[11:8]), .C_sel_in(Ct[1]), .C_sel_out(Ct[2]), .S(S[11:8]));
    two_four_sel    tf3(.A(A[15:12]), .B(B[15:12]), .C_sel_in(Ct[2]), .C_sel_out(cout), .S(S[15:12]));

endmodule