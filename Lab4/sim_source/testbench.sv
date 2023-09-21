module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic ClearA_LoadB, Run;
logic [7:0] SW;

logic [7:0] Aval, Bval;
logic Xval;

logic [7:0] hex_segA, hex_segB;
logic [3:0] hex_gridA, hex_gridB;
				
// A counter to count the instances where simulation results
// do no match with expected results
integer ErrorCnt = 0;
integer SEVEN = 8'b00000111;
integer SEVEN_ = 8'b11111001;
integer FN = 8'b00111011;
integer FN_ = 8'b11000101;
integer pos_right = 8'b10011101;
integer pos_left = 8'b00000001;
integer neg_right = 8'b01100011;
integer neg_left = 8'b11111110;
		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
Processor processor0(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// 7: 00000111
// -7: 11111001
// 59: 00111011
// -59: 11000101
// 413: 0000000110011101
// -413: 1111111001100011

// 7 59
initial begin: TEST_VECTORS

SW = SEVEN;
ClearA_LoadB = 1;
#2 ClearA_LoadB = 0;

#2 SW = FN;

#2 Run = 1;

#50 Run = 0;
    if (Aval != pos_left)
	 ErrorCnt++;
    if (Bval != pos_right)
	 ErrorCnt++;

#2 SW = SEVEN;
ClearA_LoadB = 1;
#2 ClearA_LoadB = 0;

#2 SW = FN_;

#2 Run = 1;
#50 Run = 0;
    if (Aval != neg_left)
	 ErrorCnt++;
    if (Bval != neg_right)
	 ErrorCnt++;


#2 SW = SEVEN_;
ClearA_LoadB = 1;
#2 ClearA_LoadB = 0;

#2 SW = FN;

#2 Run = 1;
#50 Run = 0;
    if (Aval != neg_left)
	 ErrorCnt++;
    if (Bval != neg_right)
	 ErrorCnt++;


#2 SW = SEVEN_;
ClearA_LoadB = 1;
#2 ClearA_LoadB = 0;

#2 SW = FN_;

#2 Run = 1;
#50 Run = 0;
    if (Aval != pos_left)
	 ErrorCnt++;
    if (Bval != pos_right)
	 ErrorCnt++;

if (ErrorCnt == 0)
	$display("Success!");  // Command line output in ModelSim
else
	$display("%d error(s) detected. Try again!", ErrorCnt);
end
endmodule