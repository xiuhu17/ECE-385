// 00 for add, 01 for and, 10 for not
module Calc_ALU(    input logic [15:0] A, B,
                    input logic [1:0] ALUK, 
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

module Calc_ADDR(  input logic [15:0] ADDR2MUX_IN, ADDR1MUX_IN,
                    output logic [15:0] ADDR_OUT); 
        assign ADDR_OUT = (ADDR2MUX_IN + ADDR1MUX_IN);
endmodule
