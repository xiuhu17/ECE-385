module reg_16 (input  logic Clk, Reset, Load_En, 
              input  logic [15:0]  Data_In_D,
              output logic [15:0]  Data_Out_Q);

    always_ff @ (posedge Clk)
    begin
	 	if (Reset) begin
            Data_Out_Q <= 16'h0; // updated when gets to next clock cycle
        end 			
		else begin 
            if (Load_En) begin 
                Data_Out_Q <= Data_In_D; // updated when gets to next clock cycle
            end
        end
    end
	
endmodule

module reg_3 (input  logic Clk, Reset, Load_En, 
              input  logic [2:0]  Data_In_D,
              output logic [2:0]  Data_Out_Q);

    always_ff @ (posedge Clk)
    begin
	 	if (Reset) begin
            Data_Out_Q <= 3'h0; // updated when gets to next clock cycle
        end 			
		else begin 
            if (Load_En) begin 
                Data_Out_Q <= Data_In_D; // updated when gets to next clock cycle
            end
        end
    end
	
endmodule

module reg_1 (input  logic Clk, Reset, Load_En, 
              input  logic   Data_In_D,
              output logic   Data_Out_Q);

    always_ff @ (posedge Clk)
    begin
	 	if (Reset) begin
            Data_Out_Q <= 1'h0; // updated when gets to next clock cycle
        end 			
		else begin 
            if (Load_En) begin 
                Data_Out_Q <= Data_In_D; // updated when gets to next clock cycle
            end
        end
    end
	
endmodule
