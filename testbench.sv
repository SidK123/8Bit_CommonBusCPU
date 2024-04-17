`default_nettype none
`include "internal_defines.vh"


module testbench();

  logic         clock, reset_n;
  logic         reg_val_or_pc;
  logic [13:0]  instruction;
  logic [ 7:0]  register_value_or_pc;
  integer       fd; 
  integer       code;
  logic [3:0] cycle_count;

  EightBitCommonBusCPU CPU(.clock(clock),
                           .reset_n(reset_n),
                           .instruction(instruction),
                           .reg_val_or_pc(reg_val_or_pc),
                           .register_value_or_pc(register_value_or_pc));

  initial begin
    clock         = 1'd0;
    forever #5 clock = ~clock;
  end 

  task send_instructions; 
    string line;
    fd = $fopen ("asm.txt", "r");
    code = $fscanf(fd, "%b", instruction); 
    while(!$feof(fd)) begin
      reg_val_or_pc = 1'd0;
      cycle_count = ((instruction[3:0] == 4'd1) ? 4'd7 : 4'd9);
      for(int i = 0; i < cycle_count; i++) begin
        @(posedge clock);
      end
      code = $fscanf(fd, "%b", instruction); 
    end 
  endtask

  initial begin
    reset_n <= 1'd0;
    @(posedge clock);
    reset_n <= 1'd1;
    send_instructions();
    @(posedge clock);
    #2 $finish;
  end 

endmodule