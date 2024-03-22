`default_nettype none


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
  input  logic [7:0]  next_ir,
  output logic [7:0]  ir
);

  always_ff @(posedge clock, negedge reset_n) begin
    if(~reset_n) begin
      ir <= 8'd0;
    end
    else if (ir_load_en) begin
      ir <= ir_next;
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
  input  logic [2:0]  alu_op,
  output logic [7:0]  alu_out
);

  always_comb begin
    case(alu_op)

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
  input  logic [1:0] address,
  input  logic [7:0] w_data,
  output logic [7:0] r_data,
  output logic [7:0] output_reg
);

  logic [1:0][7:0] reg_file;

  assign output_reg = reg_file[2'd4];

  always_ff @(posedge clock, negedge reset_n) begin
    if(~reset_n) begin
      reg_file <= 32'd0;
    end
    else if (rf_write_read) begin
      reg_file[address] <= w_data;
    end
    else begin
      r_data <= reg_file[address];
    end
  end

endmodule : Register_File

