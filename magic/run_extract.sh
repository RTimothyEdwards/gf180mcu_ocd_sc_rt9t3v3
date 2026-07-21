#!/bin/sh
#
# Run extraction on all standard cell layouts
#     extracts the layout into ../netlist/layout/<cellname>.spice
#
echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=gf180mcuD} > /dev/null

for filename in ../magic/*.mag; do
    if [ -f "$filename" ]; then
	cellname=$(basename "$filename" .mag)
        echo "Running extraction on: ${cellname}.mag"
	magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
	load ../magic/${cellname}
	extract do local
	extract all
	ext2spice lvs
	ext2spice -o ../netlist/layout/${cellname}.spice
EOF
	rm ${cellname}.ext
    fi
done
echo "Done!"
