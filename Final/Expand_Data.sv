module Expand_Data(input logic[31:0] input_data, 
                    output logic[47:0] expand_data);
    always_comb
    begin 
        expand_data[ 47 ] = input_data [ 0 ];
        expand_data[ 46 ] = input_data [ 31 ];
        expand_data[ 45 ] = input_data [ 30 ];
        expand_data[ 44 ] = input_data [ 29 ];
        expand_data[ 43 ] = input_data [ 28 ];
        expand_data[ 42 ] = input_data [ 27 ];
        expand_data[ 41 ] = input_data [ 28 ];
        expand_data[ 40 ] = input_data [ 27 ];
        expand_data[ 39 ] = input_data [ 26 ];
        expand_data[ 38 ] = input_data [ 25 ];
        expand_data[ 37 ] = input_data [ 24 ];
        expand_data[ 36 ] = input_data [ 23 ];
        expand_data[ 35 ] = input_data [ 24 ];
        expand_data[ 34 ] = input_data [ 23 ];
        expand_data[ 33 ] = input_data [ 22 ];
        expand_data[ 32 ] = input_data [ 21 ];
        expand_data[ 31 ] = input_data [ 20 ];
        expand_data[ 30 ] = input_data [ 19 ];
        expand_data[ 29 ] = input_data [ 20 ];
        expand_data[ 28 ] = input_data [ 19 ];
        expand_data[ 27 ] = input_data [ 18 ];
        expand_data[ 26 ] = input_data [ 17 ];
        expand_data[ 25 ] = input_data [ 16 ];
        expand_data[ 24 ] = input_data [ 15 ];
        expand_data[ 23 ] = input_data [ 16 ];
        expand_data[ 22 ] = input_data [ 15 ];
        expand_data[ 21 ] = input_data [ 14 ];
        expand_data[ 20 ] = input_data [ 13 ];
        expand_data[ 19 ] = input_data [ 12 ];
        expand_data[ 18 ] = input_data [ 11 ];
        expand_data[ 17 ] = input_data [ 12 ];
        expand_data[ 16 ] = input_data [ 11 ];
        expand_data[ 15 ] = input_data [ 10 ];
        expand_data[ 14 ] = input_data [ 9 ];
        expand_data[ 13 ] = input_data [ 8 ];
        expand_data[ 12 ] = input_data [ 7 ];
        expand_data[ 11 ] = input_data [ 8 ];
        expand_data[ 10 ] = input_data [ 7 ];
        expand_data[ 9 ] = input_data [ 6 ];
        expand_data[ 8 ] = input_data [ 5 ];
        expand_data[ 7 ] = input_data [ 4 ];
        expand_data[ 6 ] = input_data [ 3 ];
        expand_data[ 5 ] = input_data [ 4 ];
        expand_data[ 4 ] = input_data [ 3 ];
        expand_data[ 3 ] = input_data [ 2 ];
        expand_data[ 2 ] = input_data [ 1 ];
        expand_data[ 1 ] = input_data [ 0 ];
        expand_data[ 0 ] = input_data [ 31 ];
    end     

endmodule