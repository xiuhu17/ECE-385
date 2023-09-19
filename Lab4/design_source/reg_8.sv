module reg_8 (input  logic Clk, Reset, Shift_In, Clear, Load, Shift,
              input  logic [7:0]  D,
              output logic Shift_Out,
              output logic [7:0]  Data_Out);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= 8'h0;
		 else if (Clear)
		 	  Data_Out <= 8'b0;
		 else if (Load)
			  Data_Out <= D;
		 else if (Shift)
		 begin
			  //concatenate shifted in data to the previous left-most 7 bits
			  //note this works because we are in always_ff procedure block
			  Data_Out <= { Shift_In, Data_Out[7:1] }; 
	    end
    end
	
    assign Shift_Out = Data_Out[0]; // continuous monitor the change of dataout[0], once change, releft in the Shigt_Out

endmodule
