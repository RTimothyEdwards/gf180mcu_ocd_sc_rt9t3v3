#!/bin/sh
#
# Run extraction and LVS on all standard cells
# (1) extracts the schematic into ../netlist/schematic/<cellname>.spice
# (2) extracts the layout into ../netlist/layout/<cellname>.spice
# (3) runs LVS and produces <cellname>_comp.out
#
echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=gf180mcuD} > /dev/null

for filename in ../magic/*.mag; do
    if [ -f "$filename" ]; then
	cellname=$(basename "$filename" .mag)
        echo "Running extraction on: ${cellname}.sch"
	xschem -n -s -r -x -q --tcl "set top_is_subckt 1" --rcfile ${PDK_ROOT}/${PDK}/libs.tech/xschem/xschemrc -o ../netlist/schematic/ -N ${cellname}.spice ../xschem/${cellname}.sch
        echo "Running extraction on: ${cellname}.mag"
	magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
	load ../magic/${cellname}
	extract do local
	extract all
	ext2spice lvs
	ext2spice -o ../netlist/layout/${cellname}.spice
EOF
	rm ${cellname}.ext
        echo "Running LVS on: $filename"
	netgen -noconsole << EOF
	lvs "../netlist/layout/${cellname}.spice ${cellname}" "../netlist/schematic/${cellname}.spice ${cellname}" ${PDK_ROOT}/${PDK}/libs.tech/netgen/${PDK}_setup.tcl ${cellname}_comp.out
EOF
    fi
done

