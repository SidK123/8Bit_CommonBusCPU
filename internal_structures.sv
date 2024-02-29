`default_nettype none

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

module Register_File(
  input  logic clock, reset_n,
  input  logic rf_write_read,
  input  logic [1:0] address,
  input  logic [7:0] w_data,
  output logic [7:0] r_data
);

  logic [3:0][7:0] reg_file;

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

