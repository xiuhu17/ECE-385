//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Given Code - SLC-3 core
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 06-09-2020
//	  Revised 03-02-2021
//    Xilinx vivado
//    Revised 07-25-2023 
//------------------------------------------------------------------------------


module slc3(
	input logic [15:0] SW,
	input logic	Clk, Reset, Run, Continue,
	output logic [15:0] LED,
	input logic [15:0] Data_from_SRAM,
	output logic OE, WE,
	output logic [7:0] hex_seg,
	output logic [3:0] hex_grid,
	output logic [7:0] hex_segB,
	output logic [3:0] hex_gridB,
	output logic [15:0] ADDR,
	output logic [15:0] Data_to_SRAM
);

// Internal connections
// no need for MARMUX
logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED;
logic GatePC, GateMDR, GateALU, GateMARMUX;
logic SR2MUX, ADDR1MUX, MARMUX;
logic BEN, MIO_EN, DRMUX, SR1MUX;
logic [1:0] PCMUX, ADDR2MUX, ALUK;
logic [15:0] MDR_In;
logic [15:0] MAR, MDR, IR;
logic [3:0] hex_4[3:0]; 

HexDrivertop HexA(  .clk(*), .reset(*), 
                    .in({hex_4[3][3:0], hex_4[2][3:0], hex_4[1][3:0], hex_4[0][3:0]}),  
                    .hex_seg(hex_seg),  .hex_grid(hex_grid));


// You may use the second (right) HEX driver to display additional debug information
// For example, Prof. Cheng's solution code has PC being displayed on the right HEX
HexDrivertop HexB(  .clk(*), .reset(*), 
                    .in(),  
                    .hex_seg(hex_segB), .hex_grid(hex_gridB));

// Connect MAR to ADDR, which is also connected as an input into MEM2IO
//	MEM2IO will determine what gets put onto Data_CPU (which serves as a potential
//	input into MDR)
assign ADDR = MAR; 
assign MIO_EN = OE;

// Instantiate the rest of your modules here according to the block diagram of the SLC-3
// including your register file, ALU, etc..


// Our I/O controller (note, this plugs into MDR/MAR)

Mem2IO memory_subsystem(
    .*, .Reset(Reset), .ADDR(ADDR), .Switches(SW),
    .HEX0(hex_4[0][3:0]), .HEX1(hex_4[1][3:0]), .HEX2(hex_4[2][3:0]), .HEX3(hex_4[3][3:0]), 
    .Data_from_CPU(MDR), .Data_to_CPU(MDR_In),
    .Data_from_SRAM(Data_from_SRAM), .Data_to_SRAM(Data_to_SRAM)
);

// State machine, you need to fill in the code here as well
ISDU state_controller(
	.*, .Reset(Reset), .Run(Run), .Continue(Continue),
	.Opcode(IR[15:12]), .IR_5(IR[5]), .IR_11(IR[11]),
   .Mem_OE(OE), .Mem_WE(WE)
);

// bus
logic [15:0] BUS_OUT;
MUX_BUS mux_muxbus(.GatePC(GatePC), .GateMDR(GateMDR), .GateALU(GateALU), .GateMARMUX(GateMARMUX), 
					.GatePC_IN(GATE_PC_OUT), .GateMDR_IN(Gate_MDR_OUT), .GateALU_IN(GATE_ALU_OUT), .GateMARMUX_IN(GATE_MAR_MUX_OUT),
					.BUS_OUT(BUS_OUT));

// wrap
logic [15:0] Gate_MDR_OUT, GATE_ALU_OUT, GATE_PC_OUT, GATE_MAR_MUX_OUT;
WRAP wrap_(		.Clk(Clk), .Reset(Reset), .BUS_IN(BUS_OUT), .Data_to_CPU_IN(MDR_In), 
				.Gate_MDR_OUT(Gate_MDR_OUT), .Data_From_CPU_OUT(MDR), 
				.MAR_OUT_Q(MAR),
				.GATE_ALU_OUT(GATE_ALU_OUT), 
				.GATE_PC_OUT(GATE_PC_OUT), 
				.GATE_MAR_MUX_OUT(GATE_MAR_MUX_OUT), 
				.LD_MAR(LD_MAR), .LD_MDR(LD_MDR), .LD_IR(LD_IR), .LD_BEN(LD_BEN), .LD_CC(LD_CC), .LD_REG(LD_REG), .LD_PC(LD_PC), .LD_LED(LD_LED),
				.SR2MUX(SR2MUX), .ADDR1MUX(ADDR1MUX), 
				.MIO_EN(MIO_EN), .DRMUX(DRMUX), .SR1MUX(SR1MUX), 
				.PCMUX(PCMUX), 
				.ADDR2MUX(ADDR2MUX), .ALUK(ALUK),
				.BEN_OUT_Q(BEN), 
				.IR_OUT_Q(IR), 
				.LED_OUT_Q(LED)
                );

endmodule
