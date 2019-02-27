# Basys3 Pin Assignments
## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
############################
# On-board Slide Switches  #
############################
set_property PACKAGE_PIN V17 [get_ports {number[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[0]}]
set_property PACKAGE_PIN V16 [get_ports {number[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[1]}]
set_property PACKAGE_PIN W16 [get_ports {number[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[2]}]
set_property PACKAGE_PIN W17 [get_ports {number[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[3]}]
set_property PACKAGE_PIN W15 [get_ports {number[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[4]}]
set_property PACKAGE_PIN V15 [get_ports {number[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[5]}]
set_property PACKAGE_PIN W14 [get_ports {number[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[6]}]
set_property PACKAGE_PIN W13 [get_ports {number[7]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[7]}]
set_property PACKAGE_PIN V2 [get_ports {number[8]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[8]}]
set_property PACKAGE_PIN T3 [get_ports {number[9]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[9]}]
set_property PACKAGE_PIN T2 [get_ports {number[10]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[10]}]
set_property PACKAGE_PIN R3 [get_ports {number[11]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[11]}]
set_property PACKAGE_PIN W2 [get_ports {number[12]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {number[12]}]
#set_property PACKAGE_PIN U1 [get_ports {D[1]}]					
#set_property IOSTANDARD LVCMOS33 [get_ports {D[1]}]
#set_property PACKAGE_PIN T1 [get_ports {D[2]}]					
#set_property IOSTANDARD LVCMOS33 [get_ports {D[2]}]
#set_property PACKAGE_PIN R2 [get_ports {D[3]}]					
#set_property IOSTANDARD LVCMOS33 [get_ports {D[3]}]


############################
# 7 segment display        #
############################
set_property PACKAGE_PIN W7 [get_ports {seg[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN W6 [get_ports {seg[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U8 [get_ports {seg[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V5 [get_ports {seg[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U7 [get_ports {seg[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN U2 [get_ports {anode[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {anode[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {anode[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]						
set_property IOSTANDARD LVCMOS33 [get_ports reset]

##Clock	
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets { clk }]; 

