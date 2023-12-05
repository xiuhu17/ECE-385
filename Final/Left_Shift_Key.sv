// 1, 2, 9, 16 
// 0, 1, 8, 15
module LeftShiftOne_Key( input logic [55:0] input_data,
            output logic [55:0] shift_data );

    assign shift_data = {input_data[54:28], input_data[55], input_data[26:0], input_data[27]};
endmodule 
// all others
module LeftShiftTwo_Key( input logic [55:0] input_data,
            output logic [55:0] shift_data );
    assign shift_data = {input_data[53:28], input_data[55], input_data[54], input_data[25:0], input_data[27], input_data[26]};
endmodule 

