module control (input logic Clk,
                input logic Run,
                input logic ClearA_LoadB,
                input logic Reset,
                input logic M, 
                output logic ClearA, LoadA, ShiftA, Adder_en_A, 
                output logic ClearB, LoadB, ShiftB, Adder_en_B, 
                output logic ClearX, LoadX, ShiftX, Adder_en_X, 
                output logic Sub_Add                // 1 sub 0 Add
                );
    
    // enum to layout different stage
    // curr_state and next_state
    enum logic [4:0] {A, B, B_, C, C_, D,  D_, E, E_, F, F_, G, G_, H, H_, I, I_ ,J} curr_state, next_state; 


    // synchronize reset 
    // updates flip flop, current state is the only one
    // it always load the output next_state from combinational block into this sequential block 
    // update the curr_state base on previous cycle's next_state or reset, second part
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= A;
        else 
            curr_state <= next_state;
    end

    // combinational logic 
    always_comb
    begin                           // get the next_state, base on curr_state, for next cycle's curr_state, first part 
        next_state = curr_state;    // default action
        unique case (curr_state) 

            A :    if (Run)
                       next_state = B;
            // eight states for eight shifts
            B :    next_state = B_;
            B_:     next_state = C;
            C :    next_state = C_;
            C_:     next_state = D;
            D :    next_state = D_;
            D_:     next_state = E;
            E :    next_state = E_;
            E_:     next_state = F;
            F :    next_state = F_;
            F_:     next_state = G;
            G :    next_state = G_;
            G_:     next_state = H;
            H :    next_state = H_;
            H_:     next_state = I;
            I :    next_state = I_;
            I_:     next_state = J;
            J :    if (~Run)                // according to the Q/A, we need one Run per cycle, only Run is low, we go back to A
                       next_state = A;

        endcase 

        case (curr_state)                   // get the signal output, base on updated curr_state, third part
            A:  // clear A, Load B, clear X
                begin
                    ClearA = ClearA_LoadB;
                    LoadA = 1'b0;
                    ShiftA = 1'b0;
                    Adder_en_A = 1'b0;

                    ClearB = 1'b0;
                    LoadB = ClearA_LoadB;
                    ShiftB = 1'b0;
                    Adder_en_B = 1'b0;
                    
                    ClearX = ClearA_LoadB;
                    LoadX = 1'b0;
                    ShiftX = 1'b0;
                    Adder_en_X = 1'b0;
                end    
            B, C, D, E, F, G, H:  // Adder_en_A base on M, Adder_en_X base on M
                begin
                    ClearA = 1'b0;
                    LoadA = 1'b0;
                    ShiftA = 1'b0;

                    ClearB = 1'b0;
                    LoadB = 1'b0;
                    ShiftB = 1'b0;
                    Adder_en_B = 1'b0;

                    ClearX = 1'b0;
                    LoadX = 1'b0;
                    ShiftX = 1'b0;

                    if (M) begin
                        Sub_Add = 1'b0;         // Add
                        Adder_en_A = 1'b1;
                        Adder_en_X = 1'b1;
                    end else begin 
                        Adder_en_A = 1'b0;
                        Adder_en_X = 1'b0;
                    end 
                end
            I:  // for possible sub
                begin
                    ClearA = 1'b0;
                    LoadA = 1'b0;
                    ShiftA = 1'b0;

                    ClearB = 1'b0;
                    LoadB = 1'b0;
                    ShiftB = 1'b0;
                    Adder_en_B = 1'b0;

                    ClearX = 1'b0;
                    LoadX = 1'b0;
                    ShiftX = 1'b0;

                    if (M) begin
                        Sub_Add = 1'b1;         // Sub
                        Adder_en_A = 1'b1;
                        Adder_en_X = 1'b1;
                    end else begin 
                        Adder_en_A = 1'b0;
                        Adder_en_X = 1'b0;
                    end 
                end
            J:
                begin
                    ClearA = 1'b0;
                    LoadA = 1'b0;
                    ShiftA = 1'b0;
                    Adder_en_A = 1'b0;

                    ClearB = 1'b0;
                    LoadB = 1'b0;
                    ShiftB = 1'b0;
                    Adder_en_B = 1'b0;
                    
                    ClearX = 1'b0;
                    LoadX = 1'b0;
                    ShiftX = 1'b0;
                    Adder_en_X = 1'b0;
                end
            default:   // for shift 
                begin 
                    ClearA = 1'b0;
                    LoadA = 1'b0;
                    ShiftA = 1'b1;
                    Adder_en_A = 1'b0;

                    ClearB = 1'b0;
                    LoadB = 1'b0;
                    ShiftB = 1'b1;
                    Adder_en_B = 1'b0;
                    
                    ClearX = 1'b0;
                    LoadX = 1'b0;
                    ShiftX = 1'b1;
                    Adder_en_X = 1'b0;
                end

        endcase 
    end 

endmodule