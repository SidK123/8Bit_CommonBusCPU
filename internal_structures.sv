`default_nettype none
`include "internal_defines.vh"


/*
Program counter module. Takes in a next program counter value, and in
the case of the load for the register being enabled, the program counter
takes on the value passed in as the next value.
*/
module Program_Counter (
  input  logic        pc_load_en, clock, reset_n,
  input  logic [7:0]  pc_next,
  output logic [7:0]  pc
);

  always_ff @(posedge clock, negedge reset_n) begin
    if(~reset_n) begin
      pc <= 8'd0;
    end
    else if (pc_load_en) begin
      pc <= pc_next;
    end
  end

endmodule : Program_Counter

/*
Instruction register module. Takes in the next instruction, and
in the case of the load for this register beign enabled, the instruction
register takes on the value of the next instruction to be processed.
 */
module Instruction_Register(
  input  logic        ir_load_en, clock, reset_n,
  input  logic [13:0] instruction,
  output logic [13:0] instruction_register 
);

  always_ff @(posedge clock, negedge reset_n) begin
    if(~reset_n) begin
      instruction_register <= 13'd0;
    end
    else if (ir_load_en) begin
      instruction_register <= instruction;
    end
  end

endmodule : Instruction_Register

/*
Arithmetic and logic unit module. Takes in two source values, along with
a three bit value specifying what the alu operation is, and outputs the result
of that operation on the two operands.
*/
module ALU(
  input  logic [7:0]  alu_src_1, alu_src_2,
  input  alu_op_t     alu_op,
  output logic [7:0]  alu_out
);

  always_comb begin
    case(alu_op)
      A_PLUS_B:  alu_out = alu_src_1 + alu_src_2;
      A_MINUS_B: alu_out = alu_src_1 - alu_src_2;
      A_XOR_B:   alu_out = alu_src_1 ^ alu_src_2;
      A_NAND_B:  alu_out = ~(alu_src_1 & alu_src_2);
      A_NOR_B:   alu_out = ~(alu_src_1 | alu_src_2);
      A_SLL_B:   alu_out = (alu_src_1 << alu_src_2);
      A_SRL_B:   alu_out = (alu_src_1 >> alu_src_2);
      A_SRA_B:   alu_out = (alu_src_1 >>> alu_src_2);
      default:   alu_out = alu_src_1 + alu_src_2;
    endcase
  end

endmodule : ALU

/*
Standard register module. Takes in a D input and propagates it to the Q
output on every positive edge of the clock.
*/
module Register(
  input  logic clock, reset_n, load_en,
  input  logic [7:0] D,
  output logic [7:0] Q
);

  always_ff @(posedge clock, negedge reset_n) begin
    if(~reset_n) begin
      Q <= 8'd0;
    end
    else if (load_en) begin
      Q <= D;
    end
  end

endmodule : Register

/*
Register File module. Takes in a bit specifying whether we are reading or writing
to the register in question, and we also provide an address specifying the register
number we would like to read from or write to, and we also provide the write value in
the case of a write. Also outputs the value that we are trying to read from. The registers
are 8 bit values.
*/
module Register_File(
  input  logic clock, reset_n,
  input  logic rf_write_read,
  input  logic [7:0] address,
  input  logic [7:0] w_data,
  output logic [7:0] r_data,
  output logic [7:0] output_reg_val
);

  logic [7:0] reg_0;
  logic [7:0] reg_1;
  logic [7:0] reg_2;
  logic [7:0] reg_3;
  logic [7:0] reg_4;
  logic [7:0] reg_5;
  logic [7:0] reg_6;
  logic [7:0] reg_7;

  assign output_reg_val = reg_7;

  always_ff @(posedge clock, negedge reset_n) begin
    if(~reset_n) begin
      reg_0 <= 8'd0;
      reg_1 <= 8'd0;
      reg_2 <= 8'd0;
      reg_3 <= 8'd0;
      reg_4 <= 8'd0;
      reg_5 <= 8'd0;
      reg_6 <= 8'd0;
      reg_7 <= 8'd0;
    end
    else if (rf_write_read) begin
      case(address)
        8'd0: reg_0 <= w_data;
        8'd1: reg_1 <= w_data;
        8'd2: reg_2 <= w_data;
        8'd3: reg_3 <= w_data;
        8'd4: reg_4 <= w_data;
        8'd5: reg_5 <= w_data;
        8'd6: reg_6 <= w_data;
        8'd7: reg_7 <= w_data;
        default: reg_0 <= w_data;
      endcase 
    end
  end

  always_comb begin
    case(address)
      8'd0: r_data = reg_0; 
      8'd1: r_data = reg_1; 
      8'd2: r_data = reg_2; 
      8'd3: r_data = reg_3; 
      8'd4: r_data = reg_4; 
      8'd5: r_data = reg_5; 
      8'd6: r_data = reg_6; 
      8'd7: r_data = reg_7;
      default: r_data = reg_0; 
    endcase
  end

endmodule : Register_File
