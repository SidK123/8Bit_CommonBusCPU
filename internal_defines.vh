`ifndef INTERNAL_DEFINES_VH_
`define INTERNAL_DEFINES_VH_

typedef enum logic [3:0] {
  ADD  = 4'd0,
  ADDI = 4'd1,
  SUB  = 4'd2,
  XOR  = 4'd3,
  NAND = 4'd4,
  SLL  = 4'd5,
  SRL  = 4'd6,
  SRA  = 4'd7,
  NOR  = 4'd8,
  BEQ  = 4'd9,
  BGE  = 4'd10,
  BLT  = 4'd11,
  BNE  = 4'd12
} opcode_t;

typedef enum logic [3:0] {
  PC,
  IR_OP,
  IR_R1,
  IR_R2,
  IR_RD,
  IR_IMM_ARITH,
  OUT_REG,
  ALU_BUS,
  RF,
  ZERO,
  PC_PLUS_4
} data_bus_t;

typedef enum logic [3:0] {
  NOP,
  A_PLUS_B,
  A_PLUS_4,
  A_MINUS_B,
  A_XOR_B,
  A_NAND_B,
  A_SLL_B,
  A_SRL_B,
  A_SRA_B,
  A_NOR_B,
  A_EQUALS_B,
  A_LT_B,
  A_GE_B
} alu_op_t;

`endif