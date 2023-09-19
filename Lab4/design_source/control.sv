module control (input logic Run,
                input logic ClearA_LoadB,
                input logic Reset,
                input logic [1:0] B, 
                output logic ClearA, LoadA, ShiftA, 
                output logic ClearB, LoadB, ShiftB, 
                output logic ClearX, LoadX, ShiftX,
                output logic Sub_Add                // 1 sub 0 Add
                );
    
    // enum to layout different stage
    // curr_state and next_state
    enum logic [3:0] {A, B, C, D,  E, F, G,  H, I, ,J} curr_state, next_state; 

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
            B :    next_state = C;
            C :     next_state = D;
            D :    next_state = E;
            E :    next_state = F;
            F :     next_state = G;
            G :    next_state = H;
            H :    next_state = I;
            I :    next_state = J;
            J :    if (~Run)        // according to the Q/A, we need one Run per cycle, only Run is low, we go back to A
                       next_state = A;

        endcase 

        case (curr_state)                   // get the signal output, base on updated curr_state, third part
            A : 
                begin
                    ClearA = ClearA_LoadB;
                    LoadA = 1'b0;
                    ShiftA = 1'b0;

                    ClearB = 1'b0;
                    LoadB = ClearA_LoadB;
                    ShiftB = 1'b0; 

                    ClearX = ClearA_LoadB;
                    LoadX  = 1'b0;     
                    ShiftX = 1'b0;

                    Sub_Add = 1'b0;         // this signal does not matter
                end 
            J :                             // wait and do nothing
                begin
                    ClearA = 1'b0;
                    LoadA = 1'b0;
                    ShiftA = 1'b0;

                    ClearB = 1'b0;
                    LoadB = 1'b0;
                    ShiftB = 1'b0; 

                    ClearX = 1'b0;
                    LoadX = 1'b0;
                    ShiftX = 1'b0;

                    Sub_Add = 1'b0;         // this signal does not matter
                end
            I :                    // last shift, we need to check whther it is SUB
                begin
                    ClearA = 1'b0;

                    ClearB = 1'b0;
                    LoadB = 1'b0;
                    ShiftB = 1'b1;

                    ClearX = 1'b0;

                    if (M) begin   
                        LoadA = 1'b1;
                        ShiftA = 1'b0; 
                        LoadX = 1'b1;
                        ShiftX = 1'b0;
                    end else begin
                        LoadA = 1'b0;
                        ShiftA = 1'b1; 
                        LoadX = 1'b0;
                        ShiftX = 1'b1;
                    end

                    Sub_Add = 1'b1;         // Sub
                end
            default: 
                begin
                    ClearA = 1'b0;

                    ClearB = 1'b0;
                    LoadB = 1'b0;
                    ShiftB = 1'b1;

                    ClearX = 1'b0;

                    if (M) begin   
                        LoadA = 1'b1;
                        ShiftA = 1'b0; 
                        LoadX = 1'b1;
                        ShiftX = 1'b0;
                    end else begin
                        LoadA = 1'b0;
                        ShiftA = 1'b1; 
                        LoadX = 1'b0;
                        ShiftX = 1'b1;
                    end

                    Sub_Add = 1'b0;         // Add
                end
        endcase 
    end 

endmodule