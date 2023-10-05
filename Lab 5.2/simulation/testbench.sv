module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;

logic [15:0] SW;
logic Clk, Reset, Run, Continue;
logic [15:0] LED;
logic [7:0] hex_seg;
logic [3:0] hex_grid;
logic [7:0] hex_segB;
logic [3:0] hex_gridB;

integer ErrorCnt = 0;

// Instantiating the DUT
// Make sure the module and signal names match with those in your design
slc3_testtop slc3_testtop_(.*);	



// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 


initial begin: TEST_VECTORS


// ------------------------------------ IO test 1 ---------------------------- 
Reset = 1;
Run = 0;
Continue = 0;
SW = 16'h0;

#2 
Run = 1;
Reset = 0;
SW = 16'h0;
Continue = 0;


end
endmodule