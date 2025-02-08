vsim -gui work.Main_Diagram

add wave *

force ResetBtn 0 @ 0, 1 @ 2
force Clock 0 @ 0, 1 @ 2 -r 4
force AlarmSwitch 0 @ 0
force IncMinBtn 1 @ 0, 0 @ 10
force IncHourBtn 1 @ 0, 0 @ 10

force UserMin 00000000 @ 0
force UserHr 00000001 @ 0

run 30000