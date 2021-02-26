module counter #(parameter N = 16,
                           M = 47801)
                (input logic clk,
                input logic reset,
			    output logic max_tick,
                output logic out);
    //signal declaration
    logic[N-1:0] l_log;
    logic[N-1:0] l_next;
    logic clk_div_next;
    logic clk_div;
    always_ff@(posedge clk, posedge reset)
        if(reset) 
            l_log<= 0;
        else      
            l_log <= l_next ;
    
    assign l_next = (l_log==(M-1)) ? 0 : l_log + 1;
    //output logic
    assign max_tick = (l_log==(M-1)) ? 1'b1 : 1'b0;

    always@(posedge max_tick, posedge reset) begin
        if(reset) begin
	    clk_div <= 0;
        end
	    else begin
	    clk_div <= clk_div_next;
        end 
    end
    
    assign clk_div_next = (clk_div) ? 1'b0 : 1'b1;
    assign out = clk_div;


endmodule