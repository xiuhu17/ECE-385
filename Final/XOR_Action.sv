module Action(input logic[47:0] R0_Expand, input logic[47:0] Key);
    // first use r0 data do xor with key
    logic[47:0] XOR_;
    assign XOR_ = R0_Expand ^ Key;

    // 

endmodule