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

set device $env(part)
#set device xc7z020_1
set bitstream [current_project].bit
puts "device is $device"
puts "bitstream is $bitstream"

open_hw
connect_hw_server

set found 0

foreach { hw_target } [get_hw_targets] {
    current_hw_target $hw_target
    open_hw_target
    foreach { hw_device } [get_hw_devices] {
    if { [string first [get_property PART $hw_device] $device] == 0 } {
        puts "------Successfully Found Hardware Target with a ${device} device------ "
        current_hw_device $hw_device
        set found 1
    }
    }
    if {$found == 1} {break}
    close_hw_target
}   
if {$found == 0 } {
    puts "******ERROR : Did not find any Hardware Target with a ${device} device****** "
    exit 1
} 

set_property PROGRAM.FILE ./bitstream/$bitstream [current_hw_device]
program_hw_devices [current_hw_device]
disconnect_hw_server