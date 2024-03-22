`default_nettype none

module 8BitCommonBusCPU (
  input  logic        clock, reset_n, reg_val_or_pc,
  input  logic [13:0] instruction,
  output logic [7:0]  register_value_or_pc,
);

  logic [13:0] instruction_register;
  opcode_t     opcode;

  logic [7:0]  data_bus;
  logic [1:0]  data_bus_sel;

  logic [7:0]  alu_src1, alu_src2;
  logic [7:0]  alu_out;
  logic [2:0]  alu_op;

  logic        pc_load_en, ir_load_en, rf_write_read, alu_src1_load_en, alu_src2_load_en, sel_field_load_en;

  logic [1:0]  reg_address;
  logic [1:0]  reg_sel_field;
  logic [7:0]  output_reg;

  Program_Counter      pc(.pc_load_en(pc_load_en),
                          .clock(clock),
                          .reset_n(reset_n),
                          .pc_next(data_bus),
                          .pc(progam_counter));

  Instruction_Register ir(.ir_load_en(ir_load_en),
                          .clock(clock),
                          .reset_n(reset_n),
                          .next_ir(data_bus),
                          .ir(instruction_register));

  Register       ALU_src1(.clock(clock),
                          .reset_n(reset_n),
                          .load_en(alu_src1_load_en),
                          .D(data_bus),
                          .Q(alu_src1));

  Register       ALU_src2(.clock(clock),
                          .reset_n(reset_n),
                          .load_en(alu_src2_load_en),
                          .D(data_bus),
                          .Q(alu_src2));

  Register       reg_sel (.clock(clock),
                          .reset_n(reset_n),
                          .load_en(sel_field_load_en),
                          .D(reg_address),
                          .Q(reg_sel_field));

  ALU            alu_inst(.alu_src1(alu_src1),
                          .alu_src2(alu_src2),
                          .alu_out(alu_out));

  Register_File reg_file(.clock(clock),
                         .reset_n(reset_n),
                         .rf_write_read(rf_write_read),
                         .address(reg_sel_field),
                         .r_data(reg_read_data),
                         .w_data(data_bus),
                         .output_reg(output_reg));

  always_comb begin
    case(data_bus_sel)
      2'b00: data_bus = program_counter;
      2'b01: data_bus = instruction_register;
      2'b10: data_bus = alu_out;
      2'b11: data_bus = reg_read_data;
    endcase
  end

  assign register_value_or_pc = reg_val_or_pc ? data_bus : pc

endmodule : 8BitCommonBusCPU
