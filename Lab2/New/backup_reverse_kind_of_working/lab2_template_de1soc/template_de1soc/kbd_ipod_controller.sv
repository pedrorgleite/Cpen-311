module kbd_ipod_controller (
                            clk,
                            kbd_received_ascii_code,
                            play_music,
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
output play_music;
output count_forward;
output reset_address;

logic temp_play=1'b0;
logic temp_count_forward=1'b1;
logic temp_reset_address = 1'b0;
logic reset_address_strob;
logic delay_reset;




logic play;
logic stop;
logic backword;
logic forward;
logic reset;

assign play = (kbd_received_ascii_code==character_E);
assign stop = (kbd_received_ascii_code==character_D);
assign backword = (kbd_received_ascii_code==character_B);
assign forward = (kbd_received_ascii_code==character_F);
assign reset = (kbd_received_ascii_code==character_R);


logic sync_play, sync_stop, sync_backword, sync_forward, sync_reset;

doublesync 
play_sync
(.indata(play),
.outdata(sync_play),
.clk(clk),
.reset(1'b1));

doublesync 
pause_sync
(.indata(stop),
.outdata(sync_stop),
.clk(clk),
.reset(1'b1));

doublesync 
backword0
(.indata(backword),
.outdata(sync_backword),
.clk(clk),
.reset(1'b1));

doublesync 
forward_doublsync
(.indata(forward),
.outdata(sync_forward),
.clk(clk),
.reset(1'b1));

doublesync 
reset_doublsync
(.indata(reset),
.outdata(sync_reset),
.clk(clk),
.reset(1'b1));

always_ff @(posedge clk)
begin
    case({sync_play, sync_stop, sync_backword, sync_forward, sync_reset})
        5'b10000: begin 
           temp_play <= 1'b0; 
           temp_count_forward <= temp_count_forward;
           temp_reset_address <= temp_reset_address;
        end 
        5'b01000: begin
            temp_play <= 1'b1;
            temp_count_forward <= temp_count_forward;
            temp_reset_address <= temp_reset_address;
        end 
        5'b00100: begin
            temp_play <= temp_play; 
            temp_count_forward <= 1'b0;
            temp_reset_address <= temp_reset_address;
           
        end 
        5'b00010: begin// so change it all?
            temp_play <= temp_play; 
            temp_count_forward <= 1'b1;
            temp_reset_address <= temp_reset_address;
            end
        5'b00001: begin
           temp_play <= temp_play; 
            temp_count_forward <= temp_count_forward;
            temp_reset_address <= 1'b1;         
        end
        default: begin
            temp_play <= temp_play; 
            temp_count_forward <= temp_count_forward;
            temp_reset_address <= temp_reset_address;   
        end

    endcase

end
always_ff @(posedge clk)begin
    delay_reset <= temp_reset_address;
end
assign reset_address = ~delay_reset && temp_reset_address;

always_ff @(posedge clk)begin
    play_music <= temp_play;
    count_forward <= temp_count_forward;
end
endmodule