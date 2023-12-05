module P_BOX_Permutate(input logic[31:0] input_data, 
                        output logic[31:0] output_data);
    always_comb
    begin
        output_data [ 31 ] = input_data [ 16 ]
        output_data [ 30 ] = input_data [ 25 ]
        output_data [ 29 ] = input_data [ 12 ]
        output_data [ 28 ] = input_data [ 11 ]
        output_data [ 27 ] = input_data [ 3 ]
        output_data [ 26 ] = input_data [ 20 ]
        output_data [ 25 ] = input_data [ 4 ]
        output_data [ 24 ] = input_data [ 15 ]
        output_data [ 23 ] = input_data [ 31 ]
        output_data [ 22 ] = input_data [ 17 ]
        output_data [ 21 ] = input_data [ 9 ]
        output_data [ 20 ] = input_data [ 6 ]
        output_data [ 19 ] = input_data [ 27 ]
        output_data [ 18 ] = input_data [ 14 ]
        output_data [ 17 ] = input_data [ 1 ]
        output_data [ 16 ] = input_data [ 22 ]
        output_data [ 15 ] = input_data [ 30 ]
        output_data [ 14 ] = input_data [ 24 ]
        output_data [ 13 ] = input_data [ 8 ]
        output_data [ 12 ] = input_data [ 18 ]
        output_data [ 11 ] = input_data [ 0 ]
        output_data [ 10 ] = input_data [ 5 ]
        output_data [ 9 ] = input_data [ 29 ]
        output_data [ 8 ] = input_data [ 23 ]
        output_data [ 7 ] = input_data [ 13 ]
        output_data [ 6 ] = input_data [ 19 ]
        output_data [ 5 ] = input_data [ 2 ]
        output_data [ 4 ] = input_data [ 26 ]
        output_data [ 3 ] = input_data [ 10 ]
        output_data [ 2 ] = input_data [ 21 ]
        output_data [ 1 ] = input_data [ 28 ]
        output_data [ 0 ] = input_data [ 7 ]
    end

endmodule