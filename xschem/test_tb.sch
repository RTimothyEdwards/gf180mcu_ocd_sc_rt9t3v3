v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Testbench for inverter:  current check} -350 -200 0 0 0.6 0.6 {}
N -380 60 -40 60 {lab=GND}
N -210 -30 -190 -30 {lab=in}
N -210 -110 -210 -30 {lab=in}
N -330 -10 -330 -0 {lab=vdd}
N -380 -30 -380 60 {lab=GND}
N -380 -110 -380 -90 {lab=in}
N 110 -30 150 -30 {lab=out}
N -380 -110 -210 -110 {lab=in}
N -190 10 -190 60 {lab=GND}
N -330 -10 -280 -10 {lab=vdd}
N -220 -10 -190 -10 {lab=#net1}
C {devices/gnd.sym} -40 60 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -380 -60 0 0 {name=V1 value="PWL(0.0 0 1u 0 1.01u 3.3)"}
C {devices/code_shown.sym} -380 210 0 0 {name=s2 only_toplevel=false value=".save all
.control
tran 1n 5u
plot V(in) V(out)
plot I(Vmeas)
.endc"}
C {devices/vsource.sym} -330 30 0 0 {name=V2 value=3.3}
C {code_shown.sym} -380 130 0 0 {name=s1 only_toplevel=false value=".include /usr/share/pdk/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.spice typical"}
C {lab_wire.sym} -330 -10 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -260 -110 0 0 {name=p3 sig_type=std_logic lab=in}
C {devices/opin.sym} 150 -30 0 0 {name=p6 lab=out}
C {gf180mcu_ocd_sc_rt9t3v3__inv_1.sym} -40 -10 0 0 {name=x1}
C {ammeter.sym} -250 -10 3 0 {name=Vmeas savecurrent=true spice_ignore=0}
