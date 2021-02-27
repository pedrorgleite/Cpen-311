module kbd_ipod_controller (
                            clk,
                            kbd_received_ascii_code,
                            play,
                            count_forward,
                            reset_address
                            );

//Lowercase Letters


parameter character_B =8'h42;
parameter character_D =8'h44;
parameter character_E =8'h45;
parameter character_F =8'h46;
parameter character_R =8'h52;



input clk;
input [7:0] kbd_received_ascii_code;
output play;
output count_forward;
output reset_address;

logic temp_play = 1'b0;
logic temp_count_forward = 1'b1;
logic temp_reset_address = 1'b0;

assign end_addr = temp_end_addr;

assign play = temp_play;
assign count_forward = temp_count_forward;
assign reset_address = (kbd_received_ascii_code==character_R) ? 1'b1 : 1'b0;

always_ff @(posedge clk)
begin
    case(kbd_received_ascii_code)
        character_D: begin
            temp_play <= 1'b0;
            temp_count_forward <= temp_count_forward;
            temp_reset_address <= 1'b0;
        end
        character_E: begin
            temp_play <= 1'b1;
            temp_count_forward <= temp_count_forward;
            temp_reset_address <= 1'b0;
        end 
        character_B: begin
            temp_count_forward <= 1'b0;
            temp_play <= temp_play;
            temp_reset_address <= 1'b0;
        end 
        character_F: begin
            temp_count_forward <= 1'b1;
            temp_play <= temp_play;
            temp_reset_address <= 1'b0;
        end
        character_R: begin
            temp_count_forward <= 1'b1;
            temp_play <= temp_play;
            temp_reset_address <= 1'b1;
        end
        default: begin
            temp_count_forward <= 1'b0;
            temp_play <= 1'b0;
            temp_reset_address <= 1'b0;
        end

    endcase

end
always_ff @(posedge clk)begin
    delay_reset <= temp_reset_address;
end
assign reset_address = ~delay_reset && temp_reset_address;

endmodule