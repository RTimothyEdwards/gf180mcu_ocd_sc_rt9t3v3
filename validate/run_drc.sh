#!/bin/bash
#
# Run klayout DRC on the test inverter.
# GDS is gf180mcu_ocd_sc_rt9t3v3__inv_2.gds, top level cell name is
# gf180mcu_ocd_sc_rt9t3v3__inv_2
#
echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=gf180mcuD} > /dev/null
project=gf180mcu_ocd_sc_rt9t3v3__inv_2

klayout -b -zz -r ${PDK_ROOT}/${PDK}/libs.tech/klayout/tech/drc/gf180mcu.drc -rd input=../gds/${project}.gds -rd report=${project}_drc_klayout.lyrdb -rd feol=True -rd beol=True -rd conn_drc=True -rd wedge=True -rd run_mode=deep -rd thr=16 -rd topcell=${project}

echo "Done!"
exit 0
