onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /couter_tb/clk
add wave -noupdate /couter_tb/reset
add wave -noupdate /couter_tb/q
add wave -noupdate /couter_tb/max_tick
add wave -noupdate /couter_tb/SW
add wave -noupdate {/couter_tb/SW[3]}
add wave -noupdate {/couter_tb/SW[2]}
add wave -noupdate {/couter_tb/SW[1]}
add wave -noupdate {/couter_tb/SW[0]}
add wave -noupdate /couter_tb/out
add wave -noupdate /couter_tb/dut/freq0/out
add wave -noupdate /couter_tb/dut/freq1/out
add wave -noupdate /couter_tb/dut/freq2/out
add wave -noupdate /couter_tb/dut/freq3/out
add wave -noupdate /couter_tb/dut/freq4/out
add wave -noupdate /couter_tb/dut/freq5/out
add wave -noupdate /couter_tb/dut/freq6/out
add wave -noupdate /couter_tb/dut/freq7/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7998019 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {16760832 ps}
