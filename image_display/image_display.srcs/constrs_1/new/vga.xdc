# Constraints for CLK
set_property PACKAGE_PIN W5 [get_ports oclk]
set_property IOSTANDARD LVCMOS33 [get_ports oclk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports oclk]

# Constraints for VS and HS
set_property PACKAGE_PIN R19 [get_ports {Vsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {Vsync}]
set_property PACKAGE_PIN P19 [get_ports {Hsync}]
set_property IOSTANDARD LVCMOS33 [get_ports {Hsync}]

# Constraints for RED
set_property PACKAGE_PIN G19 [get_ports {Red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Red[0]}]
set_property PACKAGE_PIN H19 [get_ports {Red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Red[1]}]
set_property PACKAGE_PIN J19 [get_ports {Red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Red[2]}]
set_property PACKAGE_PIN N19 [get_ports {Red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Red[3]}]

# Constraints for GRN
set_property PACKAGE_PIN J17 [get_ports {Green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Green[0]}]
set_property PACKAGE_PIN H17 [get_ports {Green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Green[1]}]
set_property PACKAGE_PIN G17 [get_ports {Green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Green[2]}]
set_property PACKAGE_PIN D17 [get_ports {Green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Green[3]}]

# Constraints for BLU
set_property PACKAGE_PIN N18 [get_ports {Blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Blue[0]}]
set_property PACKAGE_PIN L18 [get_ports {Blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Blue[1]}]
set_property PACKAGE_PIN K18 [get_ports {Blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Blue[2]}]
set_property PACKAGE_PIN J18 [get_ports {Blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Blue[3]}]

set_property PACKAGE_PIN A14 [get_ports {led[0]}]
set_property PACKAGE_PIN A16 [get_ports {led[1]}]
set_property PACKAGE_PIN B15 [get_ports {led[2]}]
set_property PACKAGE_PIN B16 [get_ports {led[3]}]
set_property PACKAGE_PIN A15 [get_ports {led[4]}]

set_property PACKAGE_PIN U18 [get_ports reset_x]

set_property PACKAGE_PIN K17 [get_ports btn1]
set_property PACKAGE_PIN M18 [get_ports btn2]
set_property PACKAGE_PIN N17 [get_ports btn3]
set_property PACKAGE_PIN P18 [get_ports btn4]

set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports reset_x]

set_property IOSTANDARD LVCMOS33 [get_ports btn1] 
set_property IOSTANDARD LVCMOS33 [get_ports btn2]
set_property IOSTANDARD LVCMOS33 [get_ports btn3]
set_property IOSTANDARD LVCMOS33 [get_ports btn4]

