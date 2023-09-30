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
                output logic[15:0] GATE_PC_OUT, PC_OUT_Q, 
                // for GATEMARMUX
                output logic[15:0] GATE_MAR_MUX_OUT,
                // for input signal part
                input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
                input logic SR2MUX, ADDR1MUX,
                input logic MIO_EN, DRMUX, SR1MUX,
                input logic PCMUX, 
                input logic [1:0] ADDR2MUX, ALUK, 
                // for output signal part
                output logic BEN_OUT_Q,
                // output the signal
                output logic [15:0] IR_OUT_Q,
                // output the led
                output logic [15:0] LED_OUT_Q
                );

            // for mar
            reg_16 reg_16_mar(.Clk(Clk), .Reset(Reset), .Load_En(LD_MAR), .Data_In_D(BUS_IN), .Data_Out_Q(MAR_OUT_Q));

            // for mdr
            logic [15:0] MDR_IN_D;
            MUX_2_16 mux_mdrmux(.Select(MIO_EN), .Z_IN(BUS_IN), .O_IN(Data_to_CPU_IN), .OUT(MDR_IN_D));
            reg_16 reg_16_mdr(.Clk(Clk), .Reset(Reset), .Load_En(LD_MDR), .Data_In_D(MDR_IN_D), .Data_Out_Q(MDR_OUT_Q));
            assign Gate_MDR_OUT = MDR_OUT_Q; // once current cycle end, MDR_OUT_Q will be updated, and assign will update GATE_MDR_OUT and Data_From_CPU_OUT
            assign Data_From_CPU_OUT = MDR_OUT_Q; // MDR_OUT_Q, GATE_MDR_OUT and Data_From_CPU_OUT will be updated in one cycle
            
            // for ir 
            reg_16 reg_16_ir(.Clk(Clk), .Reset(Reset), .Load_En(LD_IR), .Data_In_D(BUS_IN), .Data_Out_Q(IR_OUT_Q));

            // for led, a cycle behind ir 
            logic [15:0] LED_IN_D;
            assign LED_IN_D = { { 4{ IR_OUT_Q[11] } }, IR_OUT_Q[11:0] };
            reg_16 reg_16_led(.Clk(Clk), .Reset(Reset), .Load_En(LD_LED), .Data_In_D(LED_IN_D), .Data_Out_Q(LED_OUT_Q));

            // for branch, only LDR, ADD, ADDI, AND, ANDI will change -> LD_CC
            logic [3:0] NZP_OUT_Q;
            reg_nzp reg_nzp_(.Clk(Clk), .Reset(Reset), .Load_En(LD_CC), .Data_In_D(BUS_IN), .Data_Out_Q(NZP_OUT_Q)); // contains logic inside

            // for ben
            logic BEN_IN_D;
            assign BEN_IN_D = (NZP_OUT_Q[2] & IR_OUT_Q[11]) | (NZP_OUT_Q[1] & IR_OUT_Q[10]) | (NZP_OUT_Q[0] & IR_OUT_Q[9]) ;
            reg_1 reg_1_ben(.Clk(Clk), .Reset(Reset), .Load_En(LD_BEN), .Data_In_D(BEN_IN_D), .Data_Out_Q(BEN_OUT_Q));

            // for sext
            logic [15:0] SEXT_11, SEXT_9, SEXT_6, SEXT_5, SEXT_ZERO;
            assign SEXT_11 = { { 5{ IR_OUT_Q[10] } }, IR_OUT_Q[10:0] };
            assign SEXT_9 = { { 7{ IR_OUT_Q[8] } }, IR_OUT_Q[8:0] };
            assign SEXT_6 = { { 10{ IR_OUT_Q[5] } }, IR_OUT_Q[5:0] };
            assign SEXT_5 = { { 11{ IR_OUT_Q[4] } }, IR_OUT_Q[4:0] };
            assign SEXT_ZERO = 16'h0;

            // for addr2mux, addr1mux, calc_addr
            logic [15:0] ADDR1MUX_OUT, ADDR2MUX_OUT, ADDR_OUT;
            MUX_4_16 mux_addr2mux(.Select(ADDR2MUX), .ZZ_IN(SEXT_11), .ZO_IN(SEXT_9), .OZ_IN(SEXT_6), .OO_IN(SEXT_ZERO), .OUT(ADDR2MUX_OUT));
            MUX_2_16 mux_addr1mux(.Select(ADDR1MUX), .Z_IN(SR1_OUT_Q), .O_IN(PC_OUT_Q), .OUT(ADDR1MUX_OUT));
            Calc_ADDR calc_addr_(.ADDR2MUX_IN(ADDR2MUX_OUT), .ADDR1MUX_IN(ADDR1MUX_OUT), .ADDR_OUT(ADDR_OUT));
            assign GATE_MAR_MUX_OUT = ADDR_OUT;

            // for pc
            logic [15:0] PC_NORMAL_NEXT;
            logic [15:0] PC_IN_D;
            assign PC_NORMAL_NEXT = (PC_OUT_Q + 16'h1);
            MUX_2_16 mux_pcmux(.Select(PCMUX), .Z_IN(ADDR_OUT), .O_IN(PC_NORMAL_NEXT), .OUT(PC_IN_D));
            reg_16 reg_16_pc(.Clk(Clk), .Reset(Reset), .Load_En(LD_PC), .Data_In_D(PC_IN_D), .Data_Out_Q(PC_OUT_Q));
            assign GATE_PC_OUT = PC_OUT_Q;

            // for regfile
            logic [15:0] DRMUX_OUT, SR1MUX_OUT;
            MUX_2_3 mux_drmux(.Select(DRMUX), .Z_IN(3'b111), .O_IN(IR_OUT_Q[11:9]), .OUT(DRMUX_OUT));
            MUX_2_3 mux_sr1mux(.Select(SR1MUX), .Z_IN(IR_OUT_Q[11:9]), .O_IN(IR_OUT_Q[8:6]), .OUT(SR1MUX_OUT));
            logic [15:0] SR1_OUT_Q, SR2_OUT_Q;
            REGFILE regfile_(.Clk(Clk), .Reset(Reset), .LD_REG(LD_REG), .DRMUX_IN(DRMUX_OUT), .SR1MUX_IN(SR1MUX_OUT), .SR2_IN(IR_OUT_Q[2:0]), .BUS_IN(BUS_IN), .SR1_OUT_Q(SR1_OUT_Q), .SR2_OUT_Q(SR2_OUT_Q));

            // for sr2mux, alu
            logic [15:0] SR2MUX_OUT;
            MUX_2_16 mux_sr2mux(.Select(SR2MUX), .Z_IN(SEXT_5), .O_IN(SR2_OUT_Q), .OUT(SR2MUX_OUT));
            Calc_ALU calc_alu_(.A(SR1_OUT_Q), .B(SR2MUX_OUT), .ALUK(ALUK), .OUT(GATE_ALU_OUT));

endmodule
