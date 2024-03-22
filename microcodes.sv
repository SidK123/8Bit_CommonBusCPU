`default_nettype none

module microcodes(
  input  logic        clock, reset_n,
  input  logic [13:0] instruction,
  output logic [1:0]  data_bus_sel, reg_address,
  output logic        pc_load_en, ir_load_en, rf_write_read,
  output logic        alu_src1_load_en, alu_src2_load_en, sel_field_load_en
);`

  enum logic [5:0] {IDLE, ADD1, SUB1, ADDI1, XOR1, AND1, OR1, BEQ1, BGE1, BLT1, BNE1} cState, nState;

  always_ff @(posedge clock, negedge reset_n) begin
    if(reset_n) begin
      cState <= IDLE;
    end
    else begin
      cState <= nState;
    end
  end


endmodule : microcodes




