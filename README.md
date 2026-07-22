---------------------------------------------
gf180mcu_ocd_sc_rt12t3v3
---------------------------------------------

This is a standard cell library for the GF180MCU process and open PDK,
largely based on the Avalon Semiconductors 3.3V standard cell library
(https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3), but
with the nFET devices replaced with enclosed-drain devices (ELT, or
Enclosed Layout Transistor) to make them resistant to total dose
radiation.

The resulting library can be used to make digital circuits that can
be used in a high-radiation environment such as low-Earth orbit (LEO),
in conjunction with design techniques for mitigating the effects of
single-event upsets (SEUs), such as triple-voting registers and ECC
memory.

These cell designs use an "enclosed drain" transistor layout that
keeps the drain enclosed while minimizing the device width.  With a
short effective nFET width, the pFET devices are proportionally short
as well, and the cell can be made to fit in a 12-track height site
(there was a goal of having a 9-track height, but the DFFSR would
have blocked nearly all metal 2 routing, so the final track height
was increased to 12).

Note that the GF180MCU process is itself a poor choice for space
applications due to the thick oxide which exacerbates the problem of
susceptibility to total dose radiation, and is what necessitates the
use of techniques such as the ELTs to mitigate it.  However, the
larger feature size of the process means lower cost to get to silicon,
and so this library is provided especially for students, organizations,
and individuals looking to design custom ASICs for Cubesat projects.

---------------------------------

This repository was created on July 10, 2026 and is currently a work
in progress.  As long as this notice exists, the library is not in
a complete enough state to use for circuit synthesis.
