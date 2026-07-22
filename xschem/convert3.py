#!/usr/bin/env python3
#
# Convert names in this directory from "9t" to "12t", which is the
# final cell height.

import os
import re
import sys
import glob

celllist = glob.glob('*.sch')

for cellfile in celllist:
    newcellfile = re.sub('rt9t3v3', 'rt12t3v3', cellfile)
    if cellfile != newcellfile:
        os.rename(cellfile, newcellfile)

print('Done!')
sys.exit(0)
