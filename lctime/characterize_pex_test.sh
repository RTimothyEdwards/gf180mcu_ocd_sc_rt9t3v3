#!/bin/bash
#
# Extract the PEX netlist of a combinational cell and run lctime on it.
#
# Test version (one cell only)
# To do:  Get cellname from script arguments.
# Get output loads and slew times from arguments (optional).

echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=gf180mcuD} > /dev/null
libname=gf180mcu_ocd_sc_rt12t3v3
cellname=${libname}__inv_1

magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
extract path extfiles
extresist threshold 1000
extresist mindelay 0
extract do unique
extract do resistance
extract all
ext2spice lvs
ext2spice cthresh 0.1
ext2spice extresist on
ext2spice -p extfiles
EOF

lctime --liberty template_tt.lib \
--include "${PDK_ROOT}/${PDK}/libs.tech/ngspice/design.ngspice" \
--library "${PDK_ROOT}/${PDK}/libs.tech/ngspice/sm141064.ngspice typical" \
--output-loads "0.000500, 0.002000, 0.009000, 0.030000, 0.080000, 0.300000, 0.637000" \
--slew-times "0.010000, 0.023000, 0.053000, 0.122000, 0.280000, 0.650000, 1.500000" \
--spice ${cellname}.spice \
--cell ${cellname} \
--output ${cellname}.lib


