module Data_Action(input logic[31:0] R0, input logic[47:0] Sub_Key);
    // expand r0
    logic[47:0] R0_Expand;
    Expand_Data r0_expand(.input_data(R0), .output_data(R0_Expand));

    // first use r0 data do xor with key
    logic[47:0] Data_after_XOR;
    assign Data_after_XOR = R0_Expand ^ Sub_Key;

    // 
    logic[31:0] Data_after_S_BOX;
    S_BOX_MAP_WRAPPER s_box_mix(.input_data(Data_after_XOR), .output_data(Data_after_S_BOX));

    // 
    
    



endmodule