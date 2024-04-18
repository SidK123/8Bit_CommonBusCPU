`default_nettype none
`include "internal_defines.vh"

module microcodes(
  input  logic        clock, reset_n, imm_instruction,
  output data_bus_t   data_bus_sel,
  output logic        pc_load_en, ir_load_en, rf_write_read,
  output logic        alu_src1_load_en, alu_src2_load_en, sel_field_load_en
);

  enum logic [7:0] {IDLE, ARITH_OP_1, ARITH_OP_2, ARITH_OP_3, ARITH_OP_3A, ARITH_OP_4, ARITH_OP_5, ARITH_OP_6, ARITH_OP_7} cState, nState;

  always_ff @(posedge clock, negedge reset_n) begin
    if(~reset_n) begin
      cState <= IDLE;
    end
    else begin
      cState <= nState;
    end
  end

  always_comb begin
    case(cState)
      IDLE: begin
        nState            = ARITH_OP_1;
        data_bus_sel      = ZERO;
        pc_load_en        = 1'b0;
        ir_load_en        = 1'b1;
        rf_write_read     = 1'b0;
        alu_src1_load_en  = 1'b0;
        alu_src2_load_en  = 1'b0;
        sel_field_load_en = 1'b0;
      end
      ARITH_OP_1: begin
        nState            = ARITH_OP_2;
        data_bus_sel      = IR_R1;
        pc_load_en        = 1'b0;
        ir_load_en        = 1'b0;
        rf_write_read     = 1'b0;
        alu_src1_load_en  = 1'b0;
        alu_src2_load_en  = 1'b0;
        sel_field_load_en = 1'b1;
      end
      ARITH_OP_2: begin
        if(imm_instruction) begin
          nState = ARITH_OP_3A;
        end
        else begin
          nState = ARITH_OP_3;
        end
        data_bus_sel      = RF;
        pc_load_en        = 1'b0;
        ir_load_en        = 1'b0;
        rf_write_read     = 1'b0;
        alu_src1_load_en  = 1'b1;
        alu_src2_load_en  = 1'b0;
        sel_field_load_en = 1'b0;
      end
      ARITH_OP_3: begin
        nState            = ARITH_OP_4;
        data_bus_sel      = IR_R2;
        pc_load_en        = 1'b0;
        ir_load_en        = 1'b0;
        rf_write_read     = 1'b0;
        alu_src1_load_en  = 1'b0;
        alu_src2_load_en  = 1'b0;
        sel_field_load_en = 1'b1;
      end
      ARITH_OP_4: begin
        nState            = ARITH_OP_5;
        data_bus_sel      = RF;
        pc_load_en        = 1'b0;
        ir_load_en        = 1'b0;
        rf_write_read     = 1'b0;
        alu_src1_load_en  = 1'b0;
        alu_src2_load_en  = 1'b1;
        sel_field_load_en = 1'b0;
      end
      ARITH_OP_3A: begin
        nState            = ARITH_OP_5;
        data_bus_sel      = IR_R2;
        pc_load_en        = 1'b0;
        ir_load_en        = 1'b0;
        rf_write_read     = 1'b0;
        alu_src1_load_en  = 1'b0;
        alu_src2_load_en  = 1'b1;
        sel_field_load_en = 1'b0;
      end
      ARITH_OP_5: begin
        nState            = ARITH_OP_6;
        data_bus_sel      = IR_RD;
        pc_load_en        = 1'b0;
        ir_load_en        = 1'b0;
        rf_write_read     = 1'b0;
        alu_src1_load_en  = 1'b0;
        alu_src2_load_en  = 1'b0;
        sel_field_load_en = 1'b1;
      end
     ARITH_OP_6: begin
        nState            = ARITH_OP_7;
        data_bus_sel      = ALU_BUS;
        pc_load_en        = 1'b0;
        ir_load_en        = 1'b0;
        rf_write_read     = 1'b1;
        alu_src1_load_en  = 1'b0;
        alu_src2_load_en  = 1'b0;
        sel_field_load_en = 1'b0;
     end
     ARITH_OP_7: begin
        nState            = IDLE;
        data_bus_sel      = PC_PLUS_4;
        pc_load_en        = 1'b1;
        ir_load_en        = 1'b0;
        rf_write_read     = 1'b0;
        alu_src1_load_en  = 1'b0;
        alu_src2_load_en  = 1'b0;
        sel_field_load_en = 1'b0;
     end
     default: begin
        nState            = IDLE;
        data_bus_sel      = ZERO;
        pc_load_en        = 1'b0;
        ir_load_en        = 1'b0;
        rf_write_read     = 1'b0;
        alu_src1_load_en  = 1'b0;
        alu_src2_load_en  = 1'b0;
        sel_field_load_en = 1'b0;
     end
    endcase
  end

endmodule : microcodes
