# XO345
is a drop-in replacement for FT245 that eliminates USB in favor of a single SPI slave interface - making USB peripherals embedded peripherals without USB host and device driver. Initially developed on a MachXO2-7000HE board (hence XO245), then ported and tested with MachXO3L-1300E and MachXO3LF-6900C (renamed to XO345).

In its final implementation, a WLCSP MachXO3-1300E sits on a QFP-32 sized PCB with castellations and directly connects to the former FT245 pads. Its crystal is removed and additional signals are routed out on these pins.

PCB files will be uploaded here as well, for now please check out https://hackaday.io/project/9547-xo245 
