module Tripple_DES(input logic[63:0] Key0,
                    input logic[63:0] Key1,
                    input logic[63:0] Key2,
                    input logic[63:0] Data_Input,
                    output logic[63:0] Data_Output);

    logic [63:0] Data_Pass_0, Data_Pass_1;

    Encrypt_Top En_0(.Key(Key0), .Data(Data_Input), .Encrypt_Data(Data_Pass_0));
    Decrypt_Top De_1(.Key(Key1), .Data(Data_Pass_0), .Decrypt_Data(Data_Pass_1));
    Encrypt_Top En_2(.Key(Key2), .Data(Data_Pass_1), .Encrypt_Data(Data_Output));

endmodule