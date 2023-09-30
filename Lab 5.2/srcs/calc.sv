module Calc_ALU(    input logic [15:0] A, B,
                    input logic [1:0] ALUK, // 00 for add, 01 for and, 10 for not
                    output logic [15:0] ALU_OUT);

        always_comb
		begin   
                ALU_OUT = 16'h0; // avoid inferred latch
				case(ALUK)
						2'b00	:	ALU_OUT = (A + B);
						2'b01	:	ALU_OUT = (A & B);
                        2'b10	:	ALU_OUT = (~A);
				endcase
		end

endmodule

module Calc_SEXT_11(input logic [10:0] Data_IN, output logic [15:0] Data_OUT);

        assign Data_OUT =  { { 5{ Data_IN[10] } }, Data_IN };

endmodule

module Calc_SEXT_9(input logic [8:0] Data_IN, output logic [15:0] Data_OUT); 

        assign Data_OUT =  { { 7{ Data_IN[8] } }, Data_IN };

endmodule

module Calc_SEXT_6(input logic [5:0] Data_IN, output logic [15:0] Data_OUT); 

        assign Data_OUT = { { 9{ Data_IN[5] } }, Data_IN };

endmodule

module Calc_ADDER(  input logic [15:0] ADDER2MUX_IN, ADDER1MUX_IN,
                    output logic [15:0] ADDER_OUT); 
        assign ADDER_OUT = (ADDER2MUX_IN + ADDER1MUX_IN);
endmodule