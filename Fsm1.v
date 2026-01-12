/*
Fsm1.v
My first Finite State Machine
*/

module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        // read the contents of state, and act accordingly
        case(state)
            // If the state is X, and the input 'in' is 1, keep the current state, otherwise switch to the other state
            A: next_state = (in == 1) ? A : B;
            B: next_state = (in == 1) ? B : A;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // If the reset pin is high, put the FMS in state B
        if (areset) state <= B;
        
        // If Reset isn't on, put the state fron the next_state register into the state register
        else state <= next_state;
    end

    // Output logic
    // If the state is B, output 1 
    // If the state isn't B the state is A, in which case output 0,
    assign out = (state == B);

endmodule
