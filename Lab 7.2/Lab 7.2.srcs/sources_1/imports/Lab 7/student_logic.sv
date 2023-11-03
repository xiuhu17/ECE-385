module CNTRL(input logic [9:0] drawX, drawY , 

            output logic [11:0] reg_col_addr,
            input logic [31:0] reg_col_data, // for individual byte info: ivn & idx_for_font, from hdmi_axi
            input logic [31:0] reg_control_data, //Swap for palette

            output logic [10:0] font_addr,
            input logic [7:0]   font_data,
            
            output logic [3:0] color_fg, color_bg,

            output logic [3:0] red, green, blue);

    parameter [9:0] Screen_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Screen_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Screen_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Screen_Y_Max=479;     // Bottommost point on the Y axis


    integer select_reg_col;
    logic [9:0] x_begin, x_off; 
    logic [9:0] y_begin, y_off;
    logic [15:0] reg_col_use;
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
            color_fg = 0;
            color_bg = 0;
            red = 0;
            green = 0;
            blue = 0;
            if (drawX <= Screen_X_Max && drawY <= Screen_Y_Max && drawX >= 0 && drawY >= 0)
                begin 
                    x_begin = ((drawX >> 3) << 3);
                    y_begin = ((drawY >> 4) << 4);
                    x_off = drawX - x_begin;
                    y_off = drawY - y_begin;
                    select_reg_col = ((drawX >> 3) & (10'b0000000001));

                    reg_col_addr = (drawY >> 4) * 80 + (drawX >> 3);                      // for vram to read data
                    reg_col_use = reg_col_data[(select_reg_col*16) +: 16];                // vram data

                    inv = reg_col_use[15];
                    font_addr = y_off + (16 * reg_col_use[14:8]);
                    color_fg = reg_col_use[7:4];
                    color_bg = reg_col_use[3:0];
                    
                    if (font_data[8-x_off] ^ inv == 1'b1) // f
                        begin 
                            red   = reg_control_data[27:24];
                            green = reg_control_data[23:20];
                            blue  = reg_control_data[19:16];
                        end 
                    else  // b
                        begin  
                            red   = reg_control_data[11:8];
                            green = reg_control_data[7:4];
                            blue  = reg_control_data[3:0];
                        end
                end 
        end
endmodule

// comment for this code:
// the drawX and drawY are pixel, they are indeex 800*480
// we have 600 register, per register is 32bit, 4 * bytes, 4 * char, that means, each register store 4 char infomation. 
// per char is 8bit, store [inv, index_of_char]
// we use (drawX >> 3) << 3 as the start horizontal-pixel for current char
// we use use (drawY >> 4) << 4 as start vertical-pixel for current char
// we use x_off as the current distance from the start horizontal-pixel 
// we use y_off as the current distance from the start vertical-pixel 
// (drawX >> 3) is the place of a char inside the register, and we use the least two bits(10'b11) of it to indicate its position inside the register(per register has four character)
// we uase (drawY >> 4) * 80 + (drawX >> 3) as the current index of char, the range is from [0-2399]
//      since per reg is four characters, we use reg_col_addr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] to choose which reg it belongs to (this is inside hdmi_text_controller_v1_0_AXI.sv file)
//  reg_col_use is what we get from hdmi_text_controller_v1_0_AXI.sv file, it is a register, 32 bits, so we only pick 8bit of it by using (drawX >> 3)
//  inv = reg_col_use[7]; indicates whether we invert the color or not
//  font_addr = y_off + (16 * reg_col_use[6:0]); use the index_of_char(pick the kind of char, total 128 kinds of char), and use y_offset to choose which line of the char we are drawing, we have 16 lines, refer font.sv
// finally we use font_addr to get the font_data from font.sv. Since this data is 8 bit, sayng the width of each character is 8 bit. we use x_offset to get the current bit
// now if inv = 1, we need to invert the color, otherwise, stick to the same
// here I use the simplified xor logic, as you can test yourself
// the color infomation is stored in the color register, which is the 601th register inside the vram
// the read from  hdmi_text_controller_v1_0_AXI for drawing is different from one using the handshake.