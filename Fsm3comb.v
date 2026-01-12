/*
Fsm3comb.v
A Mealy finite state machine (FSM) with 4 states (A, B, C, D).
The FSM transitions between states based on the input 'in' and produces an output 'out'.
When the FSM is in state D, the output 'out' is high (1); otherwise, it is low (0).
*/

module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    always @(*) begin
        // State transition logic
        case(state)
            A: next_state = (in == 0) ? A : B;
            B: next_state = (in == 0) ? C : B;
            C: next_state = (in == 0) ? A : D;
            D: next_state = (in == 0) ? C : B;
        endcase
    end

    assign out = (state == D);
    
endmodule
