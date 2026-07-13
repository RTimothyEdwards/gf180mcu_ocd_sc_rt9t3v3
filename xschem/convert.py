#!/usr/bin/env python3
#
# Convert all files from the OSU library name to the
# OCD rad-tolerant library name.

import os
import re
import sys
import glob

celllist = glob.glob('*.sch')

for cellfile in celllist:
    newcellfile = re.sub('osu_sc_gp9t3v3', 'ocd_sc_rt9t3v3', cellfile)
    os.rename(cellfile, newcellfile)

print('Done!')
sys.exit(0)
