#!/bin/sh
#
# Run schematic capture (netlist extraction) on all standard cells
#    extracts the schematic into ../netlist/schematic/<cellname>.spice
#
echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=gf180mcuD} > /dev/null

for filename in *.sch; do
    if [ -f "$filename" ]; then
	cellname=$(basename "$filename" .sch)
        echo "Running extraction on: ${cellname}.sch"
	xschem -n -s -r -x -q --tcl "set top_is_subckt 1" --rcfile ${PDK_ROOT}/${PDK}/libs.tech/xschem/xschemrc -o ../netlist/schematic/ -N ${cellname}.spice ../xschem/${cellname}.sch
    fi
done
echo "Done!"
