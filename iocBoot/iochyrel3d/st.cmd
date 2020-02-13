#!../../bin/linux-x86_64/hyrel3d

#- You may have to change hyrel3d to something else
#- everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/hyrel3d.dbd",0,0)
hyrel3d_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/hyrel3d.db","user=kaz")

iocInit()

## Start any sequence programs
#seq snchyrel3d,"user=kaz"
