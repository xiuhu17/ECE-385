// contain 8 * 16_reg
module REGFILE( input  logic Clk, Reset, LD_REG,
            input  logic [2:0] DRMUX_IN, // output of MUX was used as input data to the REG
            input  logic [2:0] SR1MUX_IN, SR2_IN,
            input  logic [16:0] BUS_IN, 
            output logic [16:0] SR1_OUT_Q, SR2_OUT_Q 
            );

    logic [16:0] Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7;

    // async update internal register
    always_ff @ (posedge Clk)
    begin
	 	if (Reset) 
                begin
                    Reg0 <= 16'h0; 
                    Reg1 <= 16'h0; 
                    Reg2 <= 16'h0; 
                    Reg3 <= 16'h0; 
                    Reg4 <= 16'h0; 
                    Reg5 <= 16'h0; 
                    Reg6 <= 16'h0; 
                    Reg7 <= 16'h0; 
                end 			
		else  if (LD_REG) 
                begin 
                    case (DRMUX_IN)
                        3'b000: 
                            Reg0 <= BUS_IN;
                        3'b001:
                            Reg1 <= BUS_IN;
                        3'b010:
                            Reg2 <= BUS_IN;
                        3'b011:
                            Reg3 <= BUS_IN;
                        3'b100:
                            Reg4 <= BUS_IN;
                        3'b101:
                            Reg5 <= BUS_IN;
                        3'b110:
                            Reg6 <= BUS_IN;
                        3'b111:
                            Reg7 <= BUS_IN;
                    endcase
                end
    end

    always_comb
    begin 
        SR1_OUT_Q = 16'h0; // avoid inferred latch
        case (SR1MUX_IN) // for SR1_OUT_Q
                3'b000: 
                    SR1_OUT_Q = Reg0;
                3'b001:
                    SR1_OUT_Q = Reg1;
                3'b010:
                    SR1_OUT_Q = Reg2;
                3'b011:
                    SR1_OUT_Q = Reg3;
                3'b100:
                    SR1_OUT_Q = Reg4;
                3'b101:
                    SR1_OUT_Q = Reg5;
                3'b110:
                    SR1_OUT_Q = Reg6;
                3'b111:
                    SR1_OUT_Q = Reg7;
        endcase  

        SR2_OUT_Q = 16'h0; // avoid inferred latch
        case (SR2_IN) // for SR2_OUT_Q
                3'b000: 
                    SR2_OUT_Q = Reg0;
                3'b001:
                    SR2_OUT_Q = Reg1;
                3'b010:
                    SR2_OUT_Q = Reg2;
                3'b011:
                    SR2_OUT_Q = Reg3;
                3'b100:
                    SR2_OUT_Q = Reg4;
                3'b101:
                    SR2_OUT_Q = Reg5;
                3'b110:
                    SR2_OUT_Q = Reg6;
                3'b111:
                    SR2_OUT_Q = Reg7;
        endcase 
    end

endmodule