#!../../bin/linux-x86_64/hyrel3d

#- You may have to change hyrel3d to something else
#- everywhere it appears in this file

< envPaths

## Location of stream protocol files
epicsEnvSet("ENGINEER",                 "kgofron x5283")
epicsEnvSet("LOCATION",                 "XF11ID-M3")
epicsEnvSet("STREAM_PROTOCOL_PATH",     "protocol")

epicsEnvSet("SYS",   			"XF:11ID-M3")
epicsEnvSet("SYSPORT",  		"HYREL")
epicsEnvSet("CTSYS",			"XF:11ID-CT")
epicsEnvSet("TSADR",			"192.168.1.51")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", 	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.1.255")


## Register all support components
dbLoadDatabase("../../dbd/hyrel3d.dbd",0,0)
hyrel3d_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/hyrel3d.db","user=kaz")

iocInit()

## Start any sequence programs
#seq snchyrel3d,"user=kaz"
