#!../../bin/linux-x86_64/hyrel3d

#- You may have to change hyrel3d to something else
#- everywhere it appears in this file

< envPaths

## Location of stream protocol files
epicsEnvSet("ENGINEER",                 "kgofron x5283")
epicsEnvSet("LOCATION",                 "XF11ID-M3")
epicsEnvSet("STREAM_PROTOCOL_PATH",     "../../protocol")
#epicsEnvSet("STREAM_PROTOCOL_PATH",     "../../db")

epicsEnvSet("Sys",   			"XF:11ID-M3")
epicsEnvSet("Dev",   			"{Hyrel:1}")
epicsEnvSet("SYSPORT",  		"HYREL")
epicsEnvSet("CTSYS",			"XF:11ID-CT")
#epicsEnvSet("TSADR",			"192.168.1.52")
epicsEnvSet("TSADR",			"192.168.11.55")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", 	"NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",	"192.168.11.255")


## Register all support components
dbLoadDatabase("../../dbd/hyrel3d.dbd",0,0)
hyrel3d_registerRecordDeviceDriver(pdbbase) 

## Configure serial port for PS controller
#drvAsynIPPortConfigure("$(SYSPORT)","192.168.1.52:4001")
drvAsynIPPortConfigure("$(SYSPORT)","192.168.11.55:4001")

## Load record instances
#dbLoadRecords("../../db/devhyrel3d.db","P=$(Sys),R=$(Dev),PORT=$(SYSPORT),A=0")
dbLoadRecords("../../db/hyrel3d.db")
# 1 head (T12 = Krakatoa), N=1
#dbLoadRecords("../../db/hyrel3d_masterT.db","Sys=$(Sys),Dev=$(Dev),Yoke=1,Head=2,N=1,Heads='T12',PORT=$(SYSPORT),A=0")

# 1 head (T11 = MK1), N=1
dbLoadRecords("../../db/hyrel3d_masterT.db","Sys=$(Sys),Dev=$(Dev),Yoke=1,Head=1,N=1,Heads='T11',PORT=$(SYSPORT),A=0")

# 2 heads (T11=MK1,T12=Krakatoa), N=2
#dbLoadRecords("../../db/hyrel3d_masterT.db","Sys=$(Sys),Dev=$(Dev),Yoke=1,Head=1,N=2,Heads='T11,T12',PORT=$(SYSPORT),A=0")
# Fan control for MK1 is manually configured (previously in hyrel3D_masterT.db)
dbLoadRecords("../../db/hyrel3d_fan.db","Sys=$(Sys),Dev=$(Dev),Yoke=1,Head=1,PORT=$(SYSPORT),A=0")
dbLoadRecords("../../db/asynRecord.db")

#var streamDebug 1

iocInit()

## Start any sequence programs
#seq snchyrel3d,"user=kaz"
