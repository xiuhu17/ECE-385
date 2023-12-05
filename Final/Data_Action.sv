module Data_Action(input logic[47:0] R0_Expand, input logic[47:0] Key);
    // first use r0 data do xor with key
    logic[47:0] Data_after_XOR;
    assign Data_after_XOR = R0_Expand ^ Key;

    // 
    logic[31:0] Data_after_S_BOX;
    S_BOX_MAP(.input_data(Data_after_XOR), .output_data(Data_after_S_BOX));

    


endmodule