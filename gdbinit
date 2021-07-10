set remotetimeout unlimited
target extended-remote :3333
# file output/raspi4b
load output/raspi4b
break _start
set $pc=0x0
c
