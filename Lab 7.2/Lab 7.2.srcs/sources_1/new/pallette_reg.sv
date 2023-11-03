`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE-Illinois
// Engineer: Laurenz Nava
// 
// Create Date: 11/02/2023 08:17:03 PM
// Design Name: 
// Module Name: palette_reg
// Project Name: ECE 385 - hdmi_text_controller
// Target Devices: 
// Tool Versions: 
// Description: 
// Registers for pallette
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module palette_reg(
    input  logic Clk, WE, //WE = 1, input - WE = 0, output
    input  logic [3:0] color_sel_1, color_sel_2, 
    input  logic [3:0] red_in, green_in, blue_in,
    output logic [3:0] red_out_1, green_out_1, blue_out_1, red_out_2, green_out_2, blue_out_2
    );
    
    logic [15:0] reg_color [16];
    
    always_ff @ (posedge Clk)
    begin
    if (WE) begin
        reg_color[color_sel_1] <= {4'b0000, red_in, green_in, blue_in};
    end
    end
    
    always_comb 
    begin
    red_out_1   = reg_color[color_sel_1][11:8];
    green_out_1 = reg_color[color_sel_1][7:4];
    blue_out_1  = reg_color[color_sel_1][3:0];
    
    red_out_2   = reg_color[color_sel_2][11:8];
    green_out_2 = reg_color[color_sel_2][7:4];
    blue_out_2  = reg_color[color_sel_2][3:0];
    end
    
endmodule
