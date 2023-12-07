module Real_Top(
    input logic Clk,
    input logic reset_rtl_0,
    
    //USB signals
    input logic [0:0] gpio_usb_int_tri_i,
    output logic gpio_usb_rst_tri_o,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_sclk,
    output logic usb_spi_ss,

    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd
);

    logic reset_ah;
    logic[31:0] Data_0, Data_1;
    logic[31:0] Data_After_Encrypt_0, Data_After_Encrypt_1, Data_After_Decrypt_0, Data_After_Decrypt_1;

    assign reset_ah = reset_rtl_0;

    TrippleDES_wrapper TrippleDES_wrapper_(
            .clk_100MHz(Clk),
            .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
            .gpio_usb_keycode_0_tri_o(Data_0),
            .gpio_usb_keycode_1_tri_o(Data_1),
            .read_decrypt_0_tri_i(Data_After_Decrypt_0),
            .read_decrypt_1_tri_i(Data_After_Decrypt_1),
            .read_encrypt_0_tri_i(Data_After_Encrypt_0),
            .read_encrypt_1_tri_i(Data_After_Encrypt_1),
            .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
            .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
            .uart_rtl_0_rxd(uart_rtl_0_rxd),
            .uart_rtl_0_txd(uart_rtl_0_txd),
            .usb_spi_miso(usb_spi_miso),
            .usb_spi_mosi(usb_spi_mosi),
            .usb_spi_sclk(usb_spi_sclk),
            .usb_spi_ss(usb_spi_ss)
    );

    // Data_0, Data_1
    Tripple_DES Tripple_DES_(
            .Data_Input({{Data_0}, {Data_1}}),
            .Data_After_Encrypt({{Data_After_Encrypt_0}, {Data_After_Encrypt_1}}), 
            .Data_After_Decrypt({{Data_After_Decrypt_0}, {Data_After_Decrypt_1}})
    );



endmodule