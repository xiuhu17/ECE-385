module CNTRL(input logic [9:0] drawX, drawY , 

            output logic [11:0] addr_hdmi_col,
            input logic [31:0] reg_col, // for individual byte info: ivn & idx_for_font, from hdmi_axi
            input logic [31:0] reg_control,

            output logic [10:0] font_addr,
            input logic [7:0]   font_data,
            
            output logic [3:0] red, green, blue);

    parameter [9:0] Font_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Font_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Font_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Font_Y_Max=479;     // Bottommost point on the Y axis


    integer select_reg_col;
    logic [9:0] x_begin, x_off; 
    logic [9:0] y_begin, y_off;
    logic [7:0] reg_col_use;

    assign x_begin = ((drawX >> 3) << 3);
    assign y_begin = ((drawY >> 4) << 4);
    assign x_off = drawX - x_begin;
    assign y_off = drawY - y_begin;
    select_reg_col = ((drawX >> 3) & (10'b0000000011));

    assign addr_hdmi_col = y_begin * 80 + x_begin;                      // for vram to read data
    assign reg_col_use = reg_col[(select_reg_col*8) +: 8];              // vram data

    
    

endmodule