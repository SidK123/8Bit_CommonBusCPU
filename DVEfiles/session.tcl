# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Wed Apr 17 03:41:00 2024
# Designs open: 1
#   Sim: /afs/andrew.cmu.edu/usr16/skuniset/private/Projects/8Bit_CommonBusCPU/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: testbench
#   Group count = 9
#   Group CPU signal count = 24
#   Group reg_sel signal count = 6
#   Group reg_file signal count = 10
#   Group pc signal count = 6
#   Group microcode signal count = 13
#   Group ir signal count = 6
#   Group alu_inst signal count = 5
#   Group ALU_src2 signal count = 6
#   Group ALU_src1 signal count = 5
# End_DVE_Session_Save_Info

# DVE version: K-2015.09_Full64
# DVE build date: Aug 25 2015 21:36:02


#<Session mode="Full" path="/afs/andrew.cmu.edu/usr16/skuniset/private/Projects/8Bit_CommonBusCPU/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{2 108} {1708 1074}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 105]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 105
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 105} {height 695} {dock_state left} {dock_on_new_line true} {child_hier_colhier 147} {child_hier_coltype 107} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 141]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 141
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 674
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 140} {height 695} {dock_state left} {dock_on_new_line true} {child_data_colvariable 144} {child_data_colvalue 100} {child_data_coltype 60} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 158]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 1650
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 158
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 1706} {height 157} {dock_state bottom} {dock_on_new_line true}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{}}
gui_set_env SIMSETUP::SIMEXE {./simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/afs/andrew.cmu.edu/usr16/skuniset/private/Projects/8Bit_CommonBusCPU/simv}] } {
gui_sim_run Ucli -exe simv -args { -ucligui} -dir /afs/andrew.cmu.edu/usr16/skuniset/private/Projects/8Bit_CommonBusCPU -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1s
gui_set_time_units 1s
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {testbench.CPU.ALU_src1}
gui_load_child_values {testbench.CPU.pc}
gui_load_child_values {testbench.CPU.ALU_src2}
gui_load_child_values {testbench.CPU.ir}
gui_load_child_values {testbench.CPU}
gui_load_child_values {testbench.CPU.microcode}
gui_load_child_values {testbench.CPU.reg_file}
gui_load_child_values {testbench.CPU.alu_inst}
gui_load_child_values {testbench.CPU.reg_sel}


set _session_group_1 CPU
gui_sg_create "$_session_group_1"
set CPU "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { testbench.CPU.alu_src1 testbench.CPU.alu_src2 testbench.CPU.program_counter testbench.CPU.rf_write_read testbench.CPU.alu_out testbench.CPU.clock testbench.CPU.imm_instruction testbench.CPU.sel_field_load_en testbench.CPU.output_reg testbench.CPU.reg_sel_field testbench.CPU.alu_op testbench.CPU.data_bus testbench.CPU.alu_src1_load_en testbench.CPU.instruction testbench.CPU.data_bus_sel testbench.CPU.reset_n testbench.CPU.instruction_register testbench.CPU.reg_val_or_pc testbench.CPU.register_value_or_pc testbench.CPU.reg_read_data testbench.CPU.alu_src2_load_en testbench.CPU.pc_load_en testbench.CPU.opcode testbench.CPU.ir_load_en }

set _session_group_2 reg_sel
gui_sg_create "$_session_group_2"
set reg_sel "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { testbench.CPU.reg_sel.clock testbench.CPU.reg_sel.reset_n testbench.CPU.reg_sel.load_en testbench.CPU.reg_sel.D testbench.CPU.reg_sel.Q {testbench.CPU.reg_sel.$unit} }

set _session_group_3 reg_file
gui_sg_create "$_session_group_3"
set reg_file "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { testbench.CPU.reg_file.clock testbench.CPU.reg_file.reset_n testbench.CPU.reg_file.rf_write_read testbench.CPU.reg_file.address testbench.CPU.reg_file.w_data testbench.CPU.reg_file.r_data testbench.CPU.reg_file.output_reg_val testbench.CPU.reg_file.reg_file testbench.CPU.reg_file.output_reg_addr {testbench.CPU.reg_file.$unit} }

set _session_group_4 pc
gui_sg_create "$_session_group_4"
set pc "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { testbench.CPU.pc.pc_load_en testbench.CPU.pc.clock testbench.CPU.pc.reset_n testbench.CPU.pc.pc_next testbench.CPU.pc.pc {testbench.CPU.pc.$unit} }

set _session_group_5 microcode
gui_sg_create "$_session_group_5"
set microcode "$_session_group_5"

gui_sg_addsignal -group "$_session_group_5" { testbench.CPU.microcode.clock testbench.CPU.microcode.reset_n testbench.CPU.microcode.imm_instruction testbench.CPU.microcode.data_bus_sel testbench.CPU.microcode.pc_load_en testbench.CPU.microcode.ir_load_en testbench.CPU.microcode.rf_write_read testbench.CPU.microcode.alu_src1_load_en testbench.CPU.microcode.alu_src2_load_en testbench.CPU.microcode.sel_field_load_en testbench.CPU.microcode.cState testbench.CPU.microcode.nState {testbench.CPU.microcode.$unit} }

set _session_group_6 ir
gui_sg_create "$_session_group_6"
set ir "$_session_group_6"

gui_sg_addsignal -group "$_session_group_6" { testbench.CPU.ir.ir_load_en testbench.CPU.ir.clock testbench.CPU.ir.reset_n testbench.CPU.ir.instruction testbench.CPU.ir.instruction_register {testbench.CPU.ir.$unit} }

set _session_group_7 alu_inst
gui_sg_create "$_session_group_7"
set alu_inst "$_session_group_7"

gui_sg_addsignal -group "$_session_group_7" { testbench.CPU.alu_inst.alu_src_1 testbench.CPU.alu_inst.alu_src_2 testbench.CPU.alu_inst.alu_op testbench.CPU.alu_inst.alu_out {testbench.CPU.alu_inst.$unit} }

set _session_group_8 ALU_src2
gui_sg_create "$_session_group_8"
set ALU_src2 "$_session_group_8"

gui_sg_addsignal -group "$_session_group_8" { testbench.CPU.ALU_src2.clock testbench.CPU.ALU_src2.reset_n testbench.CPU.ALU_src2.load_en testbench.CPU.ALU_src2.D testbench.CPU.ALU_src2.Q {testbench.CPU.ALU_src2.$unit} }

set _session_group_9 ALU_src1
gui_sg_create "$_session_group_9"
set ALU_src1 "$_session_group_9"

gui_sg_addsignal -group "$_session_group_9" { testbench.CPU.ALU_src1.clock testbench.CPU.ALU_src1.D testbench.CPU.ALU_src1.Q testbench.CPU.ALU_src1.reset_n testbench.CPU.ALU_src1.load_en }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 337



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} testbench}
catch {gui_list_select -id ${Hier.1} {testbench.CPU}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {testbench.CPU.ALU_src1}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active testbench /afs/andrew.cmu.edu/usr16/skuniset/private/Projects/8Bit_CommonBusCPU/testbench.sv
gui_view_scroll -id ${Source.1} -vertical -set 64
gui_src_set_reusable -id ${Source.1}
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${HSPane.1}
}
#</Session>

