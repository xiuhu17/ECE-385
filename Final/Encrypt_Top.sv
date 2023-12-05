module Encrypt_Top(input logic[63:0] Key, input logic[63:0] Data
                    output logic[63:0] Encrypt_Data);
    // 
    logic [55:0] Key_After_PC1;
    PC1_Key pc1_key(.input_data(Key), .permutate_data(Key_After_PC1));

    // 
    logic [47:0] Key_0, Key_1, Key_2, Key_3, Key_4, Key_5, Key_6, Key_7, Key_8, Key_9, Key_10, Key_11, Key_12, Key_13, Key_14, Key_15;

    // 
    logic [55:0] Key_After_Shift_0;
    LeftShiftOne_Key shift_0(.input_data(Key_After_PC1), .shift_data(Key_After_Shift_0));
    PC2_Key per_0(.input_data(Key_After_Shift_0), .permutate_data(Key_0));

    // 
    logic [55:0] Key_After_Shift_1;
    LeftShiftOne_Key shift_1(.input_data(Key_After_Shift_0), .shift_data(Key_After_Shift_1));
    PC2_Key per_1(.input_data(Key_After_Shift_1), .permutate_data(Key_1));


    // 
    logic [55:0] Key_After_Shift_2;
    LeftShiftTwo_Key shift_2(.input_data(Key_After_Shift_1), .shift_data(Key_After_Shift_2));
    PC2_Key per_2(.input_data(Key_After_Shift_2), .permutate_data(Key_2));


    // 
    logic [55:0] Key_After_Shift_3;
    LeftShiftTwo_Key shift_3(.input_data(Key_After_Shift_2), .shift_data(Key_After_Shift_3));
    PC2_Key per_3(.input_data(Key_After_Shift_3), .permutate_data(Key_3));


    // 
    logic [55:0] Key_After_Shift_4;
    LeftShiftTwo_Key shift_4(.input_data(Key_After_Shift_3), .shift_data(Key_After_Shift_4));
    PC2_Key per_4(.input_data(Key_After_Shift_4), .permutate_data(Key_4));


    // 
    logic [55:0] Key_After_Shift_5;
    LeftShiftTwo_Key shift_5(.input_data(Key_After_Shift_4), .shift_data(Key_After_Shift_5));
    PC2_Key per_5(.input_data(Key_After_Shift_5), .permutate_data(Key_5));


    // 
    logic [55:0] Key_After_Shift_6;
    LeftShiftTwo_Key shift_6(.input_data(Key_After_Shift_5), .shift_data(Key_After_Shift_6));
    PC2_Key per_6(.input_data(Key_After_Shift_6), .permutate_data(Key_6));


    // 
    logic [55:0] Key_After_Shift_7;
    LeftShiftTwo_Key shift_7(.input_data(Key_After_Shift_6), .shift_data(Key_After_Shift_7));
    PC2_Key per_7(.input_data(Key_After_Shift_7), .permutate_data(Key_7));


    // 
    logic [55:0] Key_After_Shift_8;
    LeftShiftOne_Key shift_8(.input_data(Key_After_Shift_7), .shift_data(Key_After_Shift_8));
    PC2_Key per_8(.input_data(Key_After_Shift_8), .permutate_data(Key_8));


    // 
    logic [55:0] Key_After_Shift_9;
    LeftShiftTwo_Key shift_9(.input_data(Key_After_Shift_8), .shift_data(Key_After_Shift_9));
    PC2_Key per_9(.input_data(Key_After_Shift_9), .permutate_data(Key_9));


    // 
    logic [55:0] Key_After_Shift_10;
    LeftShiftTwo_Key shift_10(.input_data(Key_After_Shift_9), .shift_data(Key_After_Shift_10));
    PC2_Key per_10(.input_data(Key_After_Shift_10), .permutate_data(Key_10));


    // 
    logic [55:0] Key_After_Shift_11;
    LeftShiftTwo_Key shift_11(.input_data(Key_After_Shift_10), .shift_data(Key_After_Shift_11));
    PC2_Key per_11(.input_data(Key_After_Shift_11), .permutate_data(Key_11));


    // 
    logic [55:0] Key_After_Shift_12;
    LeftShiftTwo_Key shift_12(.input_data(Key_After_Shift_11), .shift_data(Key_After_Shift_12));
    PC2_Key per_12(.input_data(Key_After_Shift_12), .permutate_data(Key_12));


    // 
    logic [55:0] Key_After_Shift_13;
    LeftShiftTwo_Key shift_13(.input_data(Key_After_Shift_12), .shift_data(Key_After_Shift_13));
    PC2_Key per_13(.input_data(Key_After_Shift_13), .permutate_data(Key_13));


    // 
    logic [55:0] Key_After_Shift_14;
    LeftShiftTwo_Key shift_14(.input_data(Key_After_Shift_13), .shift_data(Key_After_Shift_14));
    PC2_Key per_14(.input_data(Key_After_Shift_14), .permutate_data(Key_14));


    // 
    logic [55:0] Key_After_Shift_15;
    LeftShiftOne_Key shift_15(.input_data(Key_After_Shift_14), .shift_data(Key_After_Shift_15));
    PC2_Key per_15(.input_data(Key_After_Shift_15), .permutate_data(Key_15));


    // Data Part
    logic [63:0] Data_0, Data_1, Data_2, Data_3, Data_4, Data_5, Data_6, Data_7, Data_8, Data_9, Data_10, Data_11, Data_12, Data_13, Data_14, Data_15, Data_Final;
    IP_Data ip_data(.input_data(Data), .permutate_data(Data_0));

    // 
    Data_Action data_action_0(.Data(Data_0), .Sub_Key(Key_0), .Data_After_Action(Data_1));

    Data_Action data_action_1(.Data(Data_1), .Sub_Key(Key_1), .Data_After_Action(Data_2));

    Data_Action data_action_2(.Data(Data_2), .Sub_Key(Key_2), .Data_After_Action(Data_3));

    Data_Action data_action_3(.Data(Data_3), .Sub_Key(Key_3), .Data_After_Action(Data_4));

    Data_Action data_action_4(.Data(Data_4), .Sub_Key(Key_4), .Data_After_Action(Data_5));

    Data_Action data_action_5(.Data(Data_5), .Sub_Key(Key_5), .Data_After_Action(Data_6));

    Data_Action data_action_6(.Data(Data_6), .Sub_Key(Key_6), .Data_After_Action(Data_7));

    Data_Action data_action_7(.Data(Data_7), .Sub_Key(Key_7), .Data_After_Action(Data_8));

    Data_Action data_action_8(.Data(Data_8), .Sub_Key(Key_8), .Data_After_Action(Data_9));

    Data_Action data_action_9(.Data(Data_9), .Sub_Key(Key_9), .Data_After_Action(Data_10));

    Data_Action data_action_10(.Data(Data_10), .Sub_Key(Key_10), .Data_After_Action(Data_11));

    Data_Action data_action_11(.Data(Data_11), .Sub_Key(Key_11), .Data_After_Action(Data_12));

    Data_Action data_action_12(.Data(Data_12), .Sub_Key(Key_12), .Data_After_Action(Data_13));

    Data_Action data_action_13(.Data(Data_13), .Sub_Key(Key_13), .Data_After_Action(Data_14));

    Data_Action data_action_14(.Data(Data_14), .Sub_Key(Key_14), .Data_After_Action(Data_15));

    Data_Action data_action_15(.Data(Data_15), .Sub_Key(Key_15), .Data_After_Action(Data_Final));

    //
    FP_Permutate fp_per(.input_data({{Data_Final[31:0]}, {Data_Final[63:32]}}), .output_data(Encrypt_Data))

endmodule