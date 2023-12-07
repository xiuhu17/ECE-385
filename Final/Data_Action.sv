module Data_Action(input logic[63:0] Data, input logic[47:0] Sub_Key,
                    output logic[63:0] Data_After_Action);
    // expand r0
    logic[47:0] R0_Expand;
    Expand_Data r0_expand(.input_data(Data[31:0]), .expand_data(R0_Expand));

    // first use r0 data do xor with key
    logic[47:0] Data_after_XOR;
    assign Data_after_XOR = R0_Expand ^ Sub_Key;

    // 
    logic[31:0] Data_after_S_BOX;
    S_BOX_MAP_WRAPPER s_box_mix(.input_data(Data_after_XOR), .output_data(Data_after_S_BOX));

    // 
    logic[31:0] Data_after_P_Box;
    P_BOX_Permutate p_box_per(.input_data(Data_after_S_BOX), .output_data(Data_after_P_Box));

    //
    assign Data_After_Action = {{Data[31:0]}, {Data[63:32] ^ Data_after_P_Box}};
endmodule