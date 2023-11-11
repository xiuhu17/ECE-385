// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov  9 13:05:40 2023
// Host        : zhihaow6 running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/zhihaow6/Desktop/Vivado/ip_repo/hdmi_text_controller_1_0/src/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.9299 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "601" *) 
  (* C_READ_DEPTH_B = "601" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "601" *) 
  (* C_WRITE_DEPTH_B = "601" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29024)
`pragma protect data_block
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
Bhh+wqRAdk91U/s=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
