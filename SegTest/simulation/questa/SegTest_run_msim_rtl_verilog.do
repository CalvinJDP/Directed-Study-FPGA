transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Calvin/OneDrive/Documents/FPGAProjects/SegTest {C:/Users/Calvin/OneDrive/Documents/FPGAProjects/SegTest/segtest.v}

