#!/bin/bash
#
# Run lctime on the schematic-captured netlist of a combinational cell.
#
# Test version (one cell only)
# To do:  Get cellname from script arguments.
# Get output loads and slew times from arguments (optional).

echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=gf180mcuD} > /dev/null
libname=gf180mcu_ocd_sc_rt12t3v3
cellname=${libname}__inv_1

lctime --liberty template_tt.lib \
--include "${PDK_ROOT}/${PDK}/libs.tech/ngspice/design.ngspice" \
--library "${PDK_ROOT}/${PDK}/libs.tech/ngspice/sm141064.ngspice typical" \
--output-loads "0.000500, 0.002000, 0.009000, 0.030000, 0.080000, 0.300000, 0.637000" \
--slew-times "0.010000, 0.023000, 0.053000, 0.122000, 0.280000, 0.650000, 1.500000" \
--spice ../netlist/schematic/${cellname}.spice \
--cell ${cellname} \
--output ${cellname}.lib

