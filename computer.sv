`default_nettype none
`include "internal_defines.vh"

/*module tt_um_EightBitCommonBusCPU (
    input  logic [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output logic [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  logic [7:0] uio_in,   // IOs: Bidirectional Input path
    output logic [7:0] uio_out,  // IOs: Bidirectional Output path
    output logic [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  logic       ena,      // will go high when the design is enabled
    input  logic       clk,      // clock
    input  logic       rst_n     // reset_n - low to reset);
);


  logic        clock, reset_n, reg_val_or_pc;
  logic [13:0] instruction;
  logic [7:0]  register_value_or_pc;
  assign clock = clk;
  assign reset_n = rst_n;
  assign instruction = {ui_in, uio_in[7:2]};
  assign uo_out = register_value_or_pc;
  assign reg_val_or_pc = uio_in[1];
  assign uio_oe = 8'h00;
  assign uio_out = 8'h00;*/

module tt_um_EightBitCommonBusCPU (
  input  logic        clock, reset_n, reg_val_or_pc,
  input  logic [13:0] instruction,
  output logic [7:0]  register_value_or_pc
);

  logic [13:0] instruction_register;
  logic        imm_instruction;
  logic [3:0]  opcode;
  assign       opcode = (instruction_register[3:0]);
  assign       imm_instruction = (opcode == ADDI);

  logic [7:0]  data_bus;
  data_bus_t   data_bus_sel;

  logic [7:0]  alu_src1, alu_src2;
  logic [7:0]  alu_out;
  alu_op_t     alu_op;

  logic        pc_load_en, ir_load_en, rf_write_read, alu_src1_load_en, alu_src2_load_en, sel_field_load_en;

  logic [7:0]  reg_sel_field;
  logic [7:0]  reg_read_data;
  logic [7:0]  output_reg;

  logic [7:0]  program_counter;

  Program_Counter      pc(.pc_load_en(pc_load_en),
                          .clock(clock),
                          .reset_n(reset_n),
                          .pc_next(data_bus),
                          .pc(program_counter));

  Instruction_Register ir(.ir_load_en(ir_load_en),
                          .clock(clock),
                          .reset_n(reset_n),
                          .instruction(instruction),
                          .instruction_register(instruction_register));

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
                          .D(data_bus),
                          .Q(reg_sel_field));


  always_comb begin
  case(opcode)
    ADD:  alu_op = A_PLUS_B;
    ADDI: alu_op = A_PLUS_B;
    SUB:  alu_op = A_MINUS_B;
    XOR:  alu_op = A_XOR_B;
    NAND: alu_op = A_NAND_B;
    SLL:  alu_op = A_SLL_B;
    SRL:  alu_op = A_SRL_B;
    SRA:  alu_op = A_SRA_B;
    NOR:  alu_op = A_NOR_B;
  endcase
  end 

  ALU            alu_inst(.alu_src_1(alu_src1),
                          .alu_src_2(alu_src2),
                          .alu_op  (alu_op),
                          .alu_out (alu_out));

  Register_File reg_file(.clock(clock),
                         .reset_n(reset_n),
                         .rf_write_read(rf_write_read),
                         .address(reg_sel_field),
                         .r_data(reg_read_data),
                         .w_data(data_bus),
                         .output_reg_val(output_reg));

  microcodes    microcode(.clock(clock),
                         .reset_n(reset_n),
                         .imm_instruction(imm_instruction),
                         .data_bus_sel(data_bus_sel),
                         .pc_load_en(pc_load_en),
                         .ir_load_en(ir_load_en),
                         .rf_write_read(rf_write_read),
                         .alu_src1_load_en(alu_src1_load_en),
                         .alu_src2_load_en(alu_src2_load_en),
                         .sel_field_load_en(sel_field_load_en));

    always_comb begin
      case(data_bus_sel)
        PC          : data_bus = program_counter;
        PC_PLUS_4   : data_bus = program_counter + 4;
        IR_OP       : data_bus = {4'd0, instruction_register[3:0]};
        IR_R1       : data_bus = {5'd0, instruction_register[9:7]};
        IR_R2       : data_bus = {5'd0, instruction_register[6:4]};
        IR_RD       : data_bus = {5'd0, instruction_register[12:10]};
        ALU         : data_bus = alu_out;
        RF          : data_bus = reg_read_data;
        NOP         : data_bus = 8'd0;
        default     : data_bus = 8'd0;
      endcase
    end

    assign register_value_or_pc = reg_val_or_pc ? output_reg : program_counter;

endmodule : tt_um_EightBitCommonBusCPU
