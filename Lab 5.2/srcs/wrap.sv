module WRAP (   // general part
                input logic Clk, Reset, 
                input logic [15:0] BUS_IN,
                // for memory part
                input logic [15:0] Data_to_CPU_IN, 
                output logic [15:0] Gate_MDR_OUT, Data_From_CPU_OUT, MDR_OUT_Q, // MDR_OUT_Q
                output logic [15:0] MAR_OUT_Q, // -> MAR -> ADDR
                // for ALU part
                output logic[15:0] GATE_ALU_OUT,
                // for PC part
                output logic[15:0] GATE_PC_OUT,
                // for GATEMARMUX
                output logic[15:0] GATE_MAR_MUX_OUT,
                // for input signal part
                input logic GatePC, GateMDR, GateALU, GateMARMUX,
                input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
                input logic SR2MUX, ADDR1MUX,
                input logic MIO_EN, DRMUX, SR1MUX,
                input logic PCMUX, ADDR2MUX, ALUK, 
                // for output signal part
                output logic BEN,
                // output the signal
                output logic [15:0] IR_OUT_Q
                );














endmodule


