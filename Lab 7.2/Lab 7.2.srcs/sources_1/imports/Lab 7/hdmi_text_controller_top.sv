module TOP (
    input logic Clk,
    input logic reset_rtl_0,
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p
);
    
    // internal wires
    logic reset_ah;
    
    // assign block
    assign reset_ah = reset_rtl_0;
    
   // instantiate block design
  mb_hdmi_text mb_hdmi_text_0
       (.HDMI_0_tmds_clk_n(hdmi_tmds_clk_n),   //output
        .HDMI_0_tmds_clk_p(hdmi_tmds_clk_p),   //output
        .HDMI_0_tmds_data_n(hdmi_tmds_data_n), //output
        .HDMI_0_tmds_data_p(hdmi_tmds_data_p), //output
        .clk_100MHz(Clk), //input
        .reset_rtl_0(~reset_ah), //input
        .uart_rtl_0_rxd(uart_rtl_0_rxd),  //input
        .uart_rtl_0_txd(uart_rtl_0_txd)); //output

endmodule