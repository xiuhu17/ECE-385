// two 16 bit input
module  MUX_2_16 (  input   logic   Select,
				    input	logic	[15:0] Z_IN,
				    input 	logic	[15:0] O_IN,
					output  logic   [15:0] OUT);
						
		always_comb
		begin   
                OUT = 16'h0; // avoid inferred latch
				case(Select)
						1'b0	:	OUT = Z_IN;
						1'b1	:	OUT = O_IN;
				endcase
		end
		
endmodule

// four 16 bit input
module  MUX_4_16 (  input   logic   [1:0] Select,
				    input	logic	[15:0] ZZ_IN,
				    input 	logic	[15:0] ZO_IN,
                    input	logic	[15:0] OZ_IN,
				    input 	logic	[15:0] OO_IN,
					output  logic   [15:0] OUT);
						
		always_comb
		begin   
                OUT = 16'h0; // avoid inferred latch
				case(Select)
						1'b00	:	OUT = ZZ_IN;
						1'b01	:	OUT = ZO_IN;
                        1'b10	:	OUT = OZ_IN;
						1'b11	:	OUT = OO_IN;
				endcase
		end
		
endmodule

// two 3 bit input
module  MUX_2_3 (   input    logic   Select,
				    input	logic	[2:0] Z_IN,
				    input 	logic	[2:0] O_IN,
					output  logic   [2:0] OUT);
						
		always_comb
		begin   
                OUT = 3'h0; // avoid inferred latch
				case(Select)
						1'b0	:	OUT = Z_IN;
						1'b1	:	OUT = O_IN;
				endcase
		end

endmodule		

// four 16 bit input
module MUX_4_16 (   input logic GatePC, GateMDR, GateALU, GateMARMUX,
                    input logic [16:0] GatePC_IN, GateMDR_IN, GateALU_IN, GateMARMUX_IN,
                    output logic [16:0] BUS_OUT);

        always_comb
		begin   
                BUS_OUT = 16'h0; // avoid inferred latch
                if (GatePC) begin
                    BUS_OUT = GatePC_IN;
                end else if (GateMDR) begin
                    BUS_OUT = GateMDR_IN;
                end else if (GateALU) begin
                    BUS_OUT = GateALU_IN;
                end else if (GateMARMUX) begin
                    BUS_OUT = GateMARMUX_IN;
                end
		end

endmodule