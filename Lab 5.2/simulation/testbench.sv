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
// ------------------------------------ PASS ---------------------------------
// Reset = 1;
// Run = 0;
// Continue = 0;
// SW = 16'h3;

// #2 
// Run = 1;
// Reset = 0;
// SW = 16'h3;
// Continue = 0;

// #50
// SW = 16'h7;

// #50
// SW = 16'h9;
// ------------------------------------ IO test 1 -----------------------------

// ------------------------------------ IO test 2 -----------------------------
// ------------------------------------ PASS ----------------------------------
// Reset = 1;
// Run = 0;
// Continue = 0;
// SW = 16'h6;

// #2 
// Run = 1;
// Reset = 0;
// SW = 16'h6;
// Continue = 0;

// // pause wait long enough to ensure enter the PSE instruction
// #100
// SW = 16'h7;
// #5
// Continue = 1;
// #1
// Continue = 0;

// #100
// Continue = 1;
// #1
// Continue = 0;

// #100
// SW = 16'h9;
// #5
// Continue = 1;
// #1
// Continue = 0;

// #100
// Continue = 1;
// #1
// Continue = 0;

// #100
// SW = 16'hAAB;
// #5
// Continue = 1;
// #1
// Continue = 0;

// #100
// Continue = 1;
// #1
// Continue = 0;
// ------------------------------------ IO test 2 -----------------------------

// ------------------------------------ IO test 3 -----------------------------
// ------------------------------------ PASS ----------------------------------
// Reset = 1;
// Run = 0;
// Continue = 0;
// SW = 16'hb;

// // 16'hd801
// #2 
// Run = 1;
// Reset = 0;
// Continue = 0;
// SW = 16'hb;

// // pause wait long enough to ensure enter the PSE instruction
// // 16'hdc02 
// #200
// SW = 16'h0;
// #5
// Continue = 1;
// #1
// Continue = 0;


// // 16'hdc03 
// #200
// SW = 16'h1;
// #5
// Continue = 1;
// #1
// Continue = 0;

// // 16'hdc04 
// #200
// SW = 16'h2;
// #5
// Continue = 1;
// #1
// Continue = 0;
// ------------------------------------ IO test 3 -----------------------------

// ------------------------------------ IO test 4 -----------------------------
// ------------------------------------ PASS ----------------------------------
// Reset = 1;
// Run = 0;
// Continue = 0;
// SW = 16'h9c;

// #2 
// Run = 1;
// Reset = 0;
// Continue = 0;
// SW = 16'h9c;
// ------------------------------------ IO test 4 -----------------------------

// ------------------------------------ IO test 5 -----------------------------
// ------------------------------------ Pass ----------------------------------
// Reset = 1;
// Run = 0;
// Continue = 0;
// SW = 16'h14;

// // expect: d9
// #2 
// Run = 1;
// Reset = 0;
// Continue = 0;
// SW = 16'h14;

// #100
// SW = 16'b0000000001110010;
// #5
// Continue = 1;
// #1
// Continue = 0;

// #100
// SW = 16'b0000000010101011;
// #5
// Continue = 1;
// #1
// Continue = 0;

// #1000
// Continue = 1;
// #1
// Continue = 0;

// #1000
// Continue = 1;
// #1
// Continue = 0;

// // expect: 1
// #500
// SW = 16'h1;
// #5
// Continue = 1;
// #1
// Continue = 0;

// #200
// SW = 16'h0;
// #5
// Continue = 1;
// #1
// Continue = 0;

// #1000
// Continue = 1;
// #1
// Continue = 0;
// ------------------------------------ IO test 5 -----------------------------

// ------------------------------------ IO test 6 -----------------------------


end
endmodule