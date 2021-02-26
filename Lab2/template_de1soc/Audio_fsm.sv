module Audio_fsm (  clk,
                    reset,
                    start,
                    finish,
                    audio_signal);
input clk, reset, start;
output finish;
output [7:0] audio_signal;

logic finish;
logic send_upp;
logic send_low;
logic wait_logic;

logic [3:0] state;

parameter idle            = 4'b0000;
parameter send_upper_data = 4'b0001;
parameter send_lower_data = 4'b0010;
parameter waiting         = 4'b0100;
parameter finished        = 4'b1000;

assign send_upp = state[0];
assign send_low = state[1];
assign wait_logic = state[2];
assign finished = state[3];

always_ff @( posedge clk or negedge reset ) 
begin 
    if(~reset)
        state<=idle;
    else
        case(state)
        idle: begin
            if(start) state <= send_upper_data;
            else state <= idle;
        end

        send_upper_data: state <= waiting;
        
        waiting: begin
            if(done_count) state <= send_lower_data;
            else state <= waiting;

        send_lower_data: state <= finished;

        finished: state <= idle;
        end
        endcase
    
end