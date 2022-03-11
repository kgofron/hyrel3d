Hyrel 3D printer
===================

Author: Kazimierz Gofron  
Created: March 5, 2020  
Last Updated: March 5, 2020   
Copyright (c): 2019-2020 Brookhaven National Laboratory  


**An EPICS IOC for a Hyrel 3D printer**


# hyrel3d
HYREL3D printer

The initial configuration used FTDI USB->RS232 (38400 baud, 8/1/none) adapter, connected to MOXA.

* COM port
  * COM6 Apply PING {in Repetel}
  * XMT/RCV, Log (upper tab)
  * M104 T11 S50 {set temperature to 50C}

* COM external

Command to turn heat off on the 2nd head
M104 S0 T12\LF

Command to turn heat on on the 2nd head
M104 S50 T12\LF

Rapetrel v4.101_C was required to control from the external Com port.
The external Com does not have updates such as temperature, etc.

T12 - 2nd head
M104 - ??
S0 - set tempearture

### Head address
1-5: T11-T15
6-10: T21-25


## Extrusion commands
M723 S500 E65536 T12

S500 - Speed
E65535 - extrude pulses
M721 - Unprime, retract G-conde function
M722 - Prime
M723 - Run
P - do not perform the command, just store settings

M723 T[head] S[rate] E[quantity] P[store]


M722 T12 S1000 E6400
M723 S5000 E64000 T12
M721 S5000 E64000 P-300I0 T12
M723 S5000 E80000 T12

NOTE: Remember to install resistors for each head connector on Canbus.
The T12 (2nd head) uses 3.3kOhm, itd.

In few months, the migration to OPC Unified Architecture is expected. Thus controls might change.

### Unsolicitated commands
The internal com port provides update on Temperature and position
* Single head temperature reporting
```
RT :T12 28 0 0 0
PO:X0.00:Y0.00:Z0.00
```

* Multiple heads temperture reporting
```
>RT :T11 25 0 0 0 :T12 34 0 0 0
```


## Software and Firmware version
* Repetrel Ver. 42.024
* Connected to EngineHR_Hydra_4.100f
* Heads_Beds_103_4.004d


## COM Ports
* Internal COM -> Com4
* external Com -> Com7
* Baud -> 38400

## Heads
* Krakatoa (has UV)
* MK1 (has fan) On='M106 S30 T11', Off='M106 S0 T11'

## Motor with gearbox (Krakatoa head)
* 11H20-0674S-PG100

## Videos
http://hyrel3d.net/wiki/index.php/Videos

## Manual G-code M723 Set Flow
https://hyrel3d.com/wiki/index.php/Gcode#M723_Set_Manual_Flow

### Additional information:
* [Hyrel_ioc](https://github.com/kgofron/hyrel3d/blob/master/docs/hyrel3d/hyrel3d.rst)
* [Documentation](https://kgofron.github.io/master/hyrel3d/hyrel3d.html)
* [Release notes](RELEASE.md)
