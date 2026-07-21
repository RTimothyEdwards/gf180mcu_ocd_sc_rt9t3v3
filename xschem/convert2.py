#!/usr/bin/env python3
#
# Convert the CDL file from 5V to 3.3V transistors
# This script isn't perfect but should be good enough for starters,
# and the rest will be hand-edited where necessary.  Not all devices
# are exactly scaled to 0.28/06, anyway, such as the moscaps.

import re
import sys
import glob

wrex = re.compile(r'.+W=([0-9]+.?[0-9]*e-[0-9]+)')
lrex = re.compile(r'.+L=([0-9]+.?[0-9]*e-[0-9]+)')

filelist = glob.glob('*.sch')

for file in filelist:

    with open(file, 'r') as ifile:
        ilines = ifile.read().splitlines()
        newlines = []
        linenum = 0
        for line in ilines:
            linenum += 1
            newline = line

            newline = re.sub('W=0.85u', 'W=1.02u', newline)
            newline = re.sub('W=1.7u', 'W=2.57u', newline)
            newline = re.sub('L=0.3u', 'L=0.28u', newline)

            newlines.append(newline)

    with open(file, 'w') as ofile:
        for line in newlines:
            print(line, file=ofile)

print('Done!')
