set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[0]}]
set_property PACKAGE_PIN F6 [get_ports {gpio_rtl_tri_io[0]}]
set_property PACKAGE_PIN G5 [get_ports {gpio_rtl_tri_io[1]}]
set_property PACKAGE_PIN A6 [get_ports {gpio_rtl_tri_io[2]}]
set_property PACKAGE_PIN A7 [get_ports {gpio_rtl_tri_io[3]}]
create_pblock pblock_RP_1
add_cells_to_pblock [get_pblocks pblock_RP_1] [get_cells -quiet [list design_1_i/RP_1]]
resize_pblock [get_pblocks pblock_RP_1] -add {CLOCKREGION_X1Y2:CLOCKREGION_X1Y2}
set_property SNAPPING_MODE ON [get_pblocks pblock_RP_1]
create_pblock pblock_RP_2
add_cells_to_pblock [get_pblocks pblock_RP_2] [get_cells -quiet [list design_1_i/RP_2]]
resize_pblock [get_pblocks pblock_RP_2] -add {CLOCKREGION_X1Y1:CLOCKREGION_X1Y1}
set_property SNAPPING_MODE ON [get_pblocks pblock_RP_2]
create_pblock pblock_RP_3
add_cells_to_pblock [get_pblocks pblock_RP_3] [get_cells -quiet [list design_1_i/RP_3]]
resize_pblock [get_pblocks pblock_RP_3] -add {CLOCKREGION_X1Y0:CLOCKREGION_X1Y0}
set_property SNAPPING_MODE ON [get_pblocks pblock_RP_3]
