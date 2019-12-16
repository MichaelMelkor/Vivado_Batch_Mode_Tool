#-----------------------------------------------------------
# Vivado v2017.2 (64-bit)
# SW Build 1909853 on Thu Jun 15 18:39:10 MDT 2017
# IP Build 1909766 on Thu Jun 15 19:58:00 MDT 2017
# Start of session at: Fri Sep  6 14:34:47 2019
# Process ID: 3108
# Current directory: /home/isn/Documents/lab_document/switch_board_shematic/pcie3_7x_0_ex
# Command line: vivado
# Log file: /home/isn/Documents/lab_document/switch_board_shematic/pcie3_7x_0_ex/vivado.log
# Journal file: /home/isn/Documents/lab_document/switch_board_shematic/pcie3_7x_0_ex/vivado.jou
#-----------------------------------------------------------
set_param general.maxThreads 8
get_param  general.maxThreads

reset_run synth_1
launch_runs synth_1
wait_on_run synth_1
open_run synth_1 
reset_run impl_1
launch_runs impl_1 
wait_on_run impl_1
open_run impl_1
write_bitstream ./bitstream/[current_project].bit -force
write_debug_probes -no_partial_ltxfile -quiet -force ./bitstream/[current_project].ltx
