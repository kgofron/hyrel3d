TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = hyrel3d
# hyrel3d.dbd will be created and installed
DBD += hyrel3d.dbd

# hyrel3d.dbd will be made up from these files:
hyrel3d_DBD += base.dbd
hyrel3d_DBD += asyn.dbd
hyrel3d_DBD += stream.dbd
hyrel3d_DBD += drvAsynSerialPort.dbd
hyrel3d_DBD += drvAsynIPPort.dbd
hyrel3d_DBD += system.dbd
hyrel3d_DBD += devIocStats.dbd
hyrel3d_DBD += asSupport.dbd
hyrel3d_DBD += caPutLog.dbd

#hyrel3d_DBD += aSubRecord.dbd

# Include dbd files from all support applications:
#hyrel3d_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#hyrel3d_LIBS += xxx

# hyrel3d_registerRecordDeviceDriver.cpp derives from hyrel3d.dbd
hyrel3d_SRCS += hyrel3d_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
hyrel3d_SRCS_DEFAULT += hyrel3dMain.cpp
hyrel3d_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#hyrel3d_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
hyrel3d_LIBS += asyn stream 
hyrel3d_LIBS += devIocStats autosave caPutLog

# Finally link to the EPICS Base libraries
hyrel3d_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

