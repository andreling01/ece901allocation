module tb_freeList();
   reg clk,rst_n,stall;
   reg [2:0] free_pr_num;
   reg [3:0] pr_need_inst_in;
   reg 	     flush;
   reg [6:0] flush_pos;
   reg [5:0] free_pr_num_in0,free_pr_num_in1,free_pr_num_in2,free_pr_num_in3;


   wire [5:0] pr_num_out0,pr_num_out1,pr_num_out2,pr_num_out3;
   wire       list_empty;
   wire [6:0] curr_pos;
   
   
   freeList DUT(/*autoinst*/
		// Outputs
		.pr_num_out0		(pr_num_out0[5:0]),
		.pr_num_out1		(pr_num_out1[5:0]),
		.pr_num_out2		(pr_num_out2[5:0]),
		.pr_num_out3		(pr_num_out3[5:0]),
		.list_empty		(list_empty),
		.curr_pos		(curr_pos[6:0]),
		// Inputs
		.free_pr_num_in0	(free_pr_num_in0[5:0]),
		.free_pr_num_in1	(free_pr_num_in1[5:0]),
		.free_pr_num_in2	(free_pr_num_in2[5:0]),
		.free_pr_num_in3	(free_pr_num_in3[5:0]),
		.flush_pos		(flush_pos[6:0]),
		.flush			(flush),
		.pr_need_inst_in	(pr_need_inst_in[3:0]),
		.free_pr_num		(free_pr_num[2:0]),
		.clk			(clk),
		.rst_n			(rst_n),
		.stall			(stall));


   initial begin
      $wlfdumpvars(0,tb_freeList);
      
      clk = 0;
      forever #5 clk = ~clk;
   end

   initial begin
      rst_n = 1'b0;
      #7 rst_n = 1'b1;
   end

   initial begin
      pr_need_inst_in = 4'b1111;
   end

   initial begin
      free_pr_num = 3'h0;
      stall = 1'b0;
      flush = 1'b0;
   end

   always@(posedge clk)
     begin
	#0;
	$display("%t, preg0 is %d, preg1 is %d, preg2 is %d, preg3 is %d, list empty is %b, curr pos is %d\n", $time,pr_num_out0,pr_num_out1,pr_num_out2,pr_num_out3,list_empty,curr_pos[5:0]);
     end

   initial begin
      #2000;
      $finish;
   end
   
endmodule // tb_freeList

