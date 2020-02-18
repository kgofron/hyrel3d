# hyrel3d
HYREL3D printer

The initial configuration used FTDI USB->RS232 (38400 baud, 8/1/none) adapter, connected to MOXA.

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
M721 - retract G-conde function
M722 -
M723 -
P - do not perform the command, just store settings

M723 T[head] S[rate] E[quantity] P[store]

Try
M722 T12 S1000 E6400

H


NOTE: Remember to install resistors for each head connector.
The T12 (2nd head) uses 3.3kOhm, itd.

In few months, the migration to OPC Unified Architecture is expected. Thus controls might change.

### Unsolicitated commands
The internal com port provides update on Temperature and position

RT :T12 28 0 0 0
PO:X0.00:Y0.00:Z0.00

