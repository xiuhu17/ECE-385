module Processor (input logic   Clk,            
                                Reset,         
                                ClearA_LoadB,   
                                Run,  
                  input  logic [7:0]  SW,     // input data
                  output logic [7:0]  Aval, Bval,    // DEBUG
                  output logic Xval,
                  output logic [7:0] hex_seg, // Hex display control
                  output logic [3:0] hex_grid); // Hex display control
    

    logic Reset_sync, ClearA_LoadB_sync, Run_sync;
    logic [7:0] SW_syn;
    logic [7:0] A, B;
    logic Aout, Bout, Xout;
    logic X;
    logic ClearA, LoadA, ShiftA, Adder_en_A;
    logic ClearB, LoadB, ShiftB, Adder_en_B;
    logic ClearX, LoadX, ShiftX, Adder_en_X;
    logic Sub_Add;
    logic [7:0] Adder_Out;
    logic Adder_Out_X;
    
    // for debug
    assign Aval = A;
    assign Bval = B;
    assign Xval = X;

    // for register 
    reg_8 regA (
              .Clk(Clk), .Reset(Reset_syn), 
              .Clear(ClearA), .Load(LoadA), .Shift(ShiftA), .Adder_en(Adder_en_A),
              .Shift_In(Xout), .Adder_en_In(Adder_Out[7:0]), 
              .Shift_Out(Aout), .Data_Out(A)
    );

    reg_8 regB (
                .Clk(Clk), .Reset(Reset_syn), 
                .Clear(ClearB), .Load(LoadB), .Shift(ShiftB), .Adder_en(Adder_en_B),
                .Load_In(SW_syn),
                .Shift_In(Aout), 
                .Shigt_Out(Bout), .Data_Out(B)
    );
    
    // for flipflop 
    flipflop fliflopx (
                .Clk(Clk), .Reset(Reset_syn), 
                .Clear(ClearX), .Load(LoadX), .Shift(ShiftX), .Adder_en(Adder_en_X),
                .Adder_en_In(Adder_Out_X),
                .Shift_Out(Xout), .Data_Out(X)
    );


    // for control unit
    control ctrl(
                .Clk(Clk), .Run(Run_sync), .ClearA_LoadB(ClearA_LoadB_sync), .Reset(Reset_sync),
                .M(Bout),
                .ClearA(ClearA), .LoadA(LoadA), .ShiftA(ShiftA), .Adder_en_A(Adder_en_A),
                .ClearB(ClearB), .LoadB(LoadB), .ShiftB(ShiftB), .Adder_en_B(Adder_en_B),
                .ClearX(ClearX), .LoadX(LoadX), .ShiftX(ShiftX), .Adder_en_X(Adder_en_X),
                .Sub_Add(Sub_Add)
                );
    
    // for adder
    ripple_adder siftedadder (
        .A(A), .B(SW_syn), .cin(Sub_Add), .S(Adder_Out), .X(Adder_Out_X)
    );
    
    // for synchronize async input
    sync Din_sync[7:0] (Clk, SW, SW_syn);
	sync button_sync[2:0] (Clk, {Reset, ClearA_LoadB, Run}, {Reset_sync, ClearA_LoadB_sync, Run_sync});

endmodule
