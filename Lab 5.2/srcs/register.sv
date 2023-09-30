module reg_16 (input  logic Clk, Reset, Load_En, 
              input  logic [15:0]  Data_In_D,
              output logic [15:0]  Data_Out_Q);

    always_ff @ (posedge Clk)
    begin
	 	if (Reset) 
                begin
                    Data_Out_Q <= 16'h0; // updated when gets to next clock cycle
                end 			
		else  if (Load_En) 
                begin 
                    Data_Out_Q <= Data_In_D; // updated when gets to next clock cycle
                end
    end
	
endmodule

module reg_nzp (input  logic Clk, Reset, Load_En, 
              input  logic [15:0]  Data_In_D,
              output logic [2:0]  Data_Out_Q);

    always_ff @ (posedge Clk)
    begin
	 	if (Reset) 
                begin
                    Data_Out_Q <= 3'h0; // updated when gets to next clock cycle
                end 			
		else  if (Load_En) 
                begin 
                    if (Data_In_D[15]) begin // neg
                        Data_Out_Q <= 3'b100;
                    end else if (Data_In_D == 16'h0) begin // zero
                        Data_Out_Q <= 3'b010;
                    end else begin // pos
                        Data_Out_Q <= 3'b001; 
                    end
                end  
    end
	
endmodule

module reg_1 (input  logic Clk, Reset, Load_En, 
              input  logic   Data_In_D,
              output logic   Data_Out_Q);

    always_ff @ (posedge Clk)
    begin
	 	if (Reset) 
                begin
                    Data_Out_Q <= 1'h0; // updated when gets to next clock cycle
                end 			
		else  if (Load_En) 
                begin 
                    Data_Out_Q <= Data_In_D; // updated when gets to next clock cycle
                end
    end
	
endmodule
