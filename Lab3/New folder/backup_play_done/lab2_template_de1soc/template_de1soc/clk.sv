module counter #(parameter N = 32)
                (input logic clk,
                input logic reset,
                input logic  [31:0]max_count,
                output logic out,
                output logic max_tick);

logic [N-1:0]count;
always_ff@(posedge clk or negedge reset)
begin
    if(~reset) begin
        out<= 1'b0;
        max_tick = 1'b0;
        count<= 0;
    end
    else if (count == max_count-32'd1)begin     
        count <= 1'b0 ;
        max_tick = 1'b1;
        out <= ~out;
        end
    else begin
        count <= count + 1;
        max_tick = 1'b0;
        out <= out;
        end
end

endmodule