#!/bin/bash
#
# Run klayout DRC on all of the standard cells

echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=gf180mcuD} > /dev/null

for filename in ../magic/*.mag; do
    if [ -f "$filename" ]; then
        cellname=$(basename "$filename" .mag)
        echo "Generating GDS for: ${cellname}.mag"
	magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
	load ../magic/${cellname}
	gds write ${cellname}
EOF
	mv ${cellname}.gds ../gds/
        echo "Running DRC on: ${cellname}.gds"
	klayout -b -zz -r ${PDK_ROOT}/${PDK}/libs.tech/klayout/tech/drc/gf180mcu.drc -rd input=../gds/${cellname}.gds -rd report=${cellname}_drc_klayout.lyrdb -rd feol=True -rd beol=True -rd conn_drc=True -rd wedge=True -rd run_mode=deep -rd thr=$(nproc) -rd topcell=${cellname}
    fi
done
echo "Done!"
exit 0
