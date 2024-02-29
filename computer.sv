`default_nettype none

module 8BitCommonBusCPU (
  input  logic       clock, reset_n,
  input  logic [9:0] instruction,
  output logic [7:0] register_value
);

  logic [7:0] data_bus;
  logic [7:0] program_counter, instruction_register, alu_src1, alu_src2;



endmodule : 8BitCommonBusCPU
