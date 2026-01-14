/*
keybord_decoder.v

Decodes the 16-bit keyboard scancode into four direction signals:
- left  (scancode = 16'he06b)
- down  (scancode = 16'he072)
- right (scancode = 16'he074)
- up    (scancode = 16'he075)

This module has no latches because all outputs are assigned in every possible case.
*/

module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    
    always @(*) begin
        left = 0;
        down = 0;
        right = 0;
        up = 0;
        
        case(scancode)
            16'he06b: left <= 1;
			16'he072: down <= 1;
			16'he074: right <= 1;
			16'he075: up <= 1;
        endcase
    end

endmodule
