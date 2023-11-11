module CNTRL(input logic [9:0] drawX, drawY , 

            output logic [11:0] reg_col_addr,
            input logic [31:0] reg_col_data, // for individual byte info: ivn & idx_for_font, from hdmi_axi
            input logic [31:0] reg_control_data,

            output logic [10:0] font_addr,
            input logic [7:0]   font_data,

            output logic [3:0] red, green, blue);

    parameter [9:0] Screen_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Screen_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis


    integer select_reg_col;
    logic [9:0] x_begin, x_off; 
    logic [9:0] y_begin, y_off;
    logic [7:0] reg_col_use;
    logic inv;

    always_comb
        begin
            x_begin = 0;
            y_begin = 0;
            x_off = 0;
            y_off = 0;
            select_reg_col = 0;
            reg_col_addr = 0;
            reg_col_use = 0;
            inv = 0;
            font_addr = 0;
            red = 0;
            green = 0;
            blue = 0;
            if (drawX <= Screen_X_Max && drawY <= Screen_Y_Max && drawX >= 0 && drawY >= 0)
                begin 
                    x_begin = ((drawX >> 3) << 3);
                    y_begin = ((drawY >> 4) << 4);
                    x_off = drawX - x_begin;
                    y_off = drawY - y_begin;
                    select_reg_col = ((drawX >> 3) & (10'b0000000011));

                    reg_col_addr = (drawY >> 4) * 80 + (drawX >> 3);                      // for vram to read data
                    reg_col_use = reg_col_data[(select_reg_col*8) +: 8];              // vram data

                    inv = reg_col_use[7];
                    font_addr = y_off + (16 * reg_col_use[6:0]);
                    
                    if (font_data[8-x_off] ^ inv == 1'b1) // f
                        begin 
                            red = reg_control_data[24:21];
                            green = reg_control_data[20:17];
                            blue = reg_control_data[16:13];
                        end 
                    else  // b
                        begin  
                            red = reg_control_data[12:9];
                            green = reg_control_data[8:5];
                            blue = reg_control_data[4:1];
                        end
                end 
        end
endmodule