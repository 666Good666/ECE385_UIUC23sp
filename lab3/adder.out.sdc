set_time_format -unit ns -decimal_places 3
create_clock -name {Clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {Clk}]
set_input_delay -add_delay -rise -clock [get_clocks {Clk}] 0.500 [get_ports {*key}]
set_input_delay -add_delay -rise -clock [get_clocks {Clk}] 0.000 [get_ports {Din*}]
set_output_delay -add_delay -rise -clock [get_clocks {Clk}] 0.000 [get_ports {LED*}]
set_output_delay -add_delay -rise -clock [get_clocks {Clk}] 0.000 [get_ports {HEX*}]
create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
set_input_delay -add_delay -rise -clock [get_clocks {Clk}] 0.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay -rise -clock [get_clocks {Clk}] 0.000 [get_ports {altera_reserved_tms}]
set_output_delay -add_delay -rise -clock [get_clocks {Clk}] 0.000 [get_ports {altera_reserved_tdo}]
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}]
set_false_path -from [get_ports {Din*}] -to [get_ports {LED*}]
set_false_path -from [get_ports {Din*}] -to [get_ports {HEX*}]
