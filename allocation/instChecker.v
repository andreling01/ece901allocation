module instChecker(/*autoarg*/);

   input [65:0] inst0_in,inst1_in,inst2_in,inst3_in;
   output [3:0] pr_need_inst_out;
   output [63:0] rcvr_pc_to_rob;
   output [3:0]  str_en_to_rob;
   output [3:0]  spec_brch_to_rob;
   output [3:0]  brch_mode_to_rob;
   output [3:0]  brch_pred_res_to_rob;
   output [3:0]  no_exe_to_rob;
   output [3:0]  inst_val_to_rob;
   output [3:0]  jr_to_rob;
   
   wire 	 pr_need[3:0];
   wire 	 brch_spec[3:0];
   wire 	 jr[3:0];
   
   
   assign pr_need[3] = inst3_in[16] ? 1:0;
   assign pr_need[2] = inst2_in[16] ? 1:0;
   assign pr_need[1] = inst1_in[16] ? 1:0;
   assign pr_need[0] = inst0_in[16] ? 1:0;

   assign pr_need_inst_out = {pr_need[3],pr_need[2],pr_need[1],pr_need[0]};
  
   assign rcvr_pc_to_rob = {inst3_in[15:0],inst2_in[15:0],inst1_in[15:0],inst0_in[15:0]};

   assign str_en_to_rob = {inst3_in[25],inst2_in[25],inst1_in[25],inst0_in[25]};

   assign brch_spec[3] = (inst3_in[16] == 2'b00) ? 0:1;
   assign brch_spec[2] = (inst2_in[16] == 2'b00) ? 0:1;
   assign brch_spec[1] = (inst1_in[16] == 2'b00) ? 0:1;
   assign brch_spec[0] = (inst0_in[16] == 2'b00) ? 0:1;

   assign spec_brch_to_rob = {brch_spec[3],brch_spec[2],brch_spec[1],brch_spec[0]};

   assign brch_mode_to_rob = {inst3_in[31:30],inst2_in[31:30],inst1_in[31:30],inst0_in[31:30]};

   assign brch_pred_res_to_rob = {inst3_in[16],inst2_in[16],inst1_in[16],inst0_in[16]};

   assign inst_val_to_rob = {inst3_in[65],inst2_in[65],inst1_in[65],inst0_in[65]};

   
   
   
   
   
endmodule // instChecker
