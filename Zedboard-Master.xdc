############################################
# CLOCK INPUT (100 MHz onboard clock)
############################################
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name sys_clk -period 10.000 [get_ports clk]

############################################
# RESET INPUT (BTNC push button)
############################################
set_property PACKAGE_PIN P16 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]

############################################
# PWM OUTPUT (JA1 on PMOD JA)
############################################
set_property PACKAGE_PIN Y11 [get_ports pwm_out]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_out]
