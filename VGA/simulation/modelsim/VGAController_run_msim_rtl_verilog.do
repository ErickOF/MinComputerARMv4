transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/Work\ Files/Proyecto_Taller {D:/Work Files/Proyecto_Taller/vga_signal_test.sv}
vlog -sv -work work +incdir+D:/Work\ Files/Proyecto_Taller {D:/Work Files/Proyecto_Taller/vga_signal.sv}
vlog -sv -work work +incdir+D:/Work\ Files/Proyecto_Taller {D:/Work Files/Proyecto_Taller/counter.sv}
vlog -sv -work work +incdir+D:/Work\ Files/Proyecto_Taller {D:/Work Files/Proyecto_Taller/comparator.sv}

