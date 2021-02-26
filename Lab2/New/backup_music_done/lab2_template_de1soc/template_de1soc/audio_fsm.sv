module Audio_fsm #(parameter M = 2273, N = 12)
                (  clk,
                    reset,
                    data,
                    start,
                    finish,
                    audio_signal);

input clk, reset, start;
input [31:0] data;
output finish;
output [7:0] audio_signal;

logic finish;
logic send_upp;
logic send_low;
logic wait_logic;
logic [7:0] lowerdata;
logic [7:0] upperdata;
logic [7:0] audio_data;
logic max_tick;
logic [N-1:0] count;

logic [3:0] state;

parameter idle            = 4'b0000;
parameter send_upper_data = 4'b0001;
parameter send_lower_data = 4'b0010;
parameter waiting         = 4'b0100;
parameter finished        = 4'b1000;

assign lowerdata = data[31:24];
assign upperdata = data[15:8];
assign audio_signal = audio_data;

assign send_upp = state[0];
assign send_low = state[1];
assign wait_logic = state[2];
assign finish = state[3];

logic Clock_22kHz;
logic done_count;


always_ff @( posedge clk or negedge reset ) 
begin 
    if(~reset)begin
        state<=idle;
    end
    else
        case(state)
        idle: begin
            if(start) state <= send_upper_data;
            else state <= idle;
        end

        send_upper_data: state <= waiting;
        
        waiting:begin
        if(done_count) state <= send_lower_data;  
        else state <= waiting;  
        end 

        send_lower_data: state <= finished;

        finished: state <= idle;
        default: state<=idle;
        endcase
end

always_ff @( posedge clk) begin
    if(!wait_logic) begin
        count <= 0;
        done_count <= 1'b0;
    end
    else if(count==M-1) begin 
        done_count <= 1'b1;
        count <= 0;
    end
    else begin
        done_count <= 1'b0;
        count <= count +1;
    end
    
end

always_ff @(posedge send_upp or posedge send_low or negedge reset)
begin
    if(~reset)
        audio_data <= 8'b0;
    else if (send_upp)
         audio_data = lowerdata;
    else if (send_low)
        audio_data = upperdata;
end
endmodule



