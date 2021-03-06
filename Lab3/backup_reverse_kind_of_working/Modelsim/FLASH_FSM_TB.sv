
module FLASH_FSM_tb;
logic clk;
logic start;
logic reset_all;
logic [22:0]FSM_mem_address;
logic flash_mem_waitrequest;
logic [31:0] flash_mem_readdata;
logic flash_mem_readdatavalid;
logic  flash_mem_read;
logic  [22:0] flash_mem_address;
logic  [3:0] flash_mem_byteenable;
logic  finish;
logic [31:0] flash_mem_dataout;


FLASH_FSM DUT(  clk,
                start,
                reset_all,
                FSM_mem_address,
                flash_mem_waitrequest,
                flash_mem_readdata,
                flash_mem_readdatavalid,
                flash_mem_read,
                flash_mem_address, 
                flash_mem_byteenable,
		flash_mem_dataout,
                finish
                );


  initial begin
    clk = 0; #5; 
    forever begin
      clk = 1; #5;
      clk = 0; #5; 
    end
  end

  initial begin
    start = 1'b0;
    reset_all = 1'b0;
    FSM_mem_address = 23'b0 ;
    flash_mem_waitrequest = 1'b0;
    flash_mem_readdata = 32'hz;
    flash_mem_readdatavalid = 0;
#5
    start = 1'b0;
    reset_all = 1'b1;
    FSM_mem_address = 23'b0 ;
    flash_mem_waitrequest = 1'b0;
    flash_mem_readdata = 32'hz;
    flash_mem_readdatavalid = 0;
    #10
    start = 1'b1;
    reset_all = 1'b1;
    FSM_mem_address = 23'b0 ;
    flash_mem_waitrequest = 1'b0;
    flash_mem_readdata = 32'hz;
    flash_mem_readdatavalid = 0;
    #15
    start = 1'b0;
    reset_all = 1'b1;
     FSM_mem_address = 23'b0 ;
    flash_mem_waitrequest = 1'b1;
    flash_mem_readdata = 32'hz;
    flash_mem_readdatavalid = 0;   
    #30
    start = 1'b0;
    reset_all = 1'b1;
     FSM_mem_address = 23'b0 ;
    flash_mem_waitrequest = 1'b1;
    flash_mem_readdata = 32'h040503FE;
    flash_mem_readdatavalid = 1'b1;   
    #10
     flash_mem_readdatavalid = 1'b0;
     #10 
	flash_mem_waitrequest = 1'b0;
    #10
    start = 1'b0;
    reset_all = 1'b1;
     FSM_mem_address = 23'b0 ;
    flash_mem_waitrequest = 1'b0;
    flash_mem_readdata = 32'hz;
    flash_mem_readdatavalid = 1'b0;   
    #100;
    $stop;
  end
endmodule