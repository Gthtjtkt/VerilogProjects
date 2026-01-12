/*
Fsm2.v
A simple JK flip-flop based FSM with asynchronous reset.
The FSM has two states: OFF and ON.
- When in OFF state:
  - If j=0, stay in OFF.
  - If j=1, transition to ON.
- When in ON state:
  - If k=0, stay in ON.
  - If k=1, transition to OFF.
*/

module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            OFF: next_state = (j == 0) ? OFF : ON;
            ON : next_state = (k == 0) ? ON  : OFF;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset == 1) state <= OFF;
        
        else state <= next_state;
        
    end

    assign out = (state == ON);
           
endmodule
