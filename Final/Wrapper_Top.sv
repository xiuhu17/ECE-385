module Tripple_DES(input logic[63:0] Key0,
                    input logic[63:0] Key1,
                    input logic[63:0] Key2,
                    input logic[63:0] Data_Input,
                    output logic[63:0] Data_After_Encrypt,
                    output logic[63:0] Data_After_Decrypt);

    logic [63:0] Data_After_En_0, Data_After_De_1, Data_After_En_2, Data_After_De_2, Data_After_En_1, Data_After_De_0;

    Encrypt_Decrypt_Top En_DE_0(.Key(Key0), .Data_For_Encrypt(Data_Input), .Data_For_Decrypt(Data_After_En_1), .Data_After_Encrypt(Data_After_En_0), .Data_After_Decrypt(Data_After_De_0));
    Encrypt_Decrypt_Top De_EN_1(.Key(Key1), .Data_For_Encrypt(Data_After_De_2), .Data_For_Decrypt(Data_After_En_0), .Data_After_Encrypt(Data_After_En_1), .Data_After_Decrypt(Data_After_De_1));
    Encrypt_Decrypt_Top En_DE_2(.Key(Key2), .Data_For_Encrypt(Data_After_De_1), .Data_For_Decrypt(Data_After_En_2), .Data_After_Encrypt(Data_After_En_2), .Data_After_Decrypt(Data_After_De_2));

    assign Data_After_Encrypt = Data_After_En_2;
    assign Data_After_Decrypt = Data_After_De_0;
endmodule