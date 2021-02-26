module counter #(parameter N = 16, // min bit required to reach M
                           M = 47801) // (Clk_speed/desired_freq)/2
                (input logic clk, // Clk speed
                input logic reset, 
                output logic out); // Clk divided/ Desired frequency
// signal declaration
logic [N-1:0]count; 
logic rst;

assign rst = ~reset; // Active low reset

// syncronous reset flip flop
always_ff@(posedge clk, posedge rst)
begin
        // If reset is low out and count= 0
        if(rst) begin
            out<= 1'b0;
			count <= 0;
			end
        // if count is reached reset count and flip output
        else if (count == M-1)begin    
            count <= 1'b0 ;
			out <= ~out;
			end
        // if its still counting keep output value and continue counting
		else begin
			count <= count + 1;
			out <= out;
			end
end

endmodule