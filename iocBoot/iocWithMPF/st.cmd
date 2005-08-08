# The is the MPF example for communication to either a Newport MM4000/5 or an
# IMS483 controller.  The examples must be configured by including or omitting
# comment characters (i.e., #'s) from this file.

# The Newport example can be configured for either serial or GPIB communication
# by omitting/including comments (i.e., remove "# !SERIAL! #" or "# !GPIB!   #"
# for serial or GPIB communication, respectively.  The IMS example is serial
# communication only, in "single mode".

# The MPF option is either single or double CPU board configuration and is
# selected by deleting either the "# !MPF-1-CPU! #" for the "# !MPF-2-CPU! #"
# comments.

# "#!" marks lines that can be uncommented.

# The following must be added for many board support packages
#!cd "... IOC st.cmd complete directory path ... "

#!< ../nfsCommands
< cdCommands 
< ../MPFconfig.cmd

cd appbin

# If the VxWorks kernel was built using the project facility, the following must
# be added before any C++ code is loaded (see SPR #28980).
sysCplusEnable=1

ld < WithMPFLib

# !GPIB!   ## !MPF-1-CPU! #ld < GpibHideosLocal.o
# !GPIB!   ## !MPF-2-CPU! #ld < GpibHideosRemote.o

cd startup
dbLoadDatabase("../../dbd/WithMPFApp.dbd")
dbLoadRecords("../../db/WithMPF.db")

routerInit
MPF_Server_Location = 0
# !MPF-1-CPU! #localMessageRouterStart(MPF_Server_Location)
# !MPF-2-CPU! #tcpMessageRouterClientStart(MPF_Server_Location,9900,"164.54.53.78",1500,40)

# Configure the MPF server code. This MUST be configured too!
# !MPF-1-CPU! #< st_mpfserver.cmd

# Newport MM4000 driver setup parameters: 
#     (1) maximum number of controllers in system
#     (2) N/A
#     (3) motor task polling rate (min=1Hz,max=60Hz)
MM4000Setup(1, 0, 10)

# Newport MM4000 driver configuration parameters: 
#     (1) controller# being configured,
#     (2) port type: 0-GPIB_PORT or 1-RS232_PORT,
#     (3) GPIB link or MPF server location
#     (4) GPIB address or MPF serial server name
# !SERIAL! #MM4000Config(0, 1, MPF_Server_Location, "a-Serial[0]")
# !GPIB!   #GPIB_Link = 10
# !GPIB!   #GPIB_Addr = 1
# !GPIB!   #MM4000Config(0, 0, GPIB_Link, GPIB_Addr)

# Newport PM500 driver setup parameters:
#     (1) maximum number of controllers in system
#     (2) N/A
#     (3) motor task polling rate (min=1Hz,max=60Hz)
#!PM500Setup(1, 0, 10)

# Newport PM500 configuration parameters:
#     (1) controller# being configured,
#     (2) port type (0-GPIB_PORT, 1-RS232_PORT)
#     (3) GPIB link or MPF server location
#     (4) GPIB address or MPF serial server name
#!PM500Config(0, 1, MPF_Server_Location, "a-Serial[0]")

# IMS IM483 driver setup parameters:
#     (1) maximum number of controllers in system
#     (2) N/A
#     (3) motor task polling rate (min=1Hz,max=60Hz)
#  SM - single mode     PL - party mode
#!IM483SMSetup(1, 0, 1)
#!IM483PLSetup(1, 0, 5)

# IMS IM483 configuration parameters:
#     (1) controller# being configured,
#     (2) port type (1-RS232_PORT)
#     (3) MPF server location
#     (4) GPIB address or serial server task name
#  SM - single mode     PL - party mode
#!IM483SMConfig(0, 1, MPF_Server_Location, "a-Serial[0]")
#!IM483PLConfig(0, 1, MPF_Server_Location, "a-Serial[0]")

# MCB-4B driver setup parameters:
#     (1) maximum # of controllers,
#     (2) maximum # axis per controller
#     (3) motor task polling rate (min=1Hz, max=60Hz)
#!MCB4BSetup(1, 1, 10)

# MCB-4B driver configuration parameters:
#     (1) controller
#     (2) MPF card
#     (3) MPF server
# Example:
#   MCB4BConfig(0, 1, "a-Serial[0]")  MPF card 1, port 0 on IP slot A.
#!MCB4BConfig(0, MPF_Server_Location, "a-Serial[3]")

# Newport ESP300 driver setup parameters: 
#     (1) maximum number of controllers in system
#     (2) N/A
#     (3) motor task polling rate (min=1Hz,max=60Hz)
#!ESP300Setup(1, 0, 10)

# Newport ESP300 driver configuration parameters: 
#     (1) controller# being configured,
#     (2) port type: 0-GPIB_PORT or 1-RS232_PORT,
#     (3) MPF server location
#     (4) GPIB address or MPF serial server name
#!ESP300Config(0, 1, MPF_Server_Location, "a-Serial[0]")
#!drvESP300debug = 4

# MicroMo MVP2001 driver setup parameters: 
#
# NOTE: The 1st controller on each chain should have it's address = 1.
#       The rest of the controllers on a chain should follow sequentially.
#
#
# int MVP2001Setup(int num_cards, /* number of CHAINS of controllers */
#      int num_channels,          /* NOT Used. */
#      int scan_rate)             /* polling rate  (Min=1Hz, max=60Hz) */
#!MVP2001Setup(1, 0, 10)

# int MVP2001Config(int card,     /* CHAIN being configured */
#      int port_type,             /* 1:RS232_PORT */
#      int addr1,                 /* VME Card */
#      int addr2)                 /* Serial port name (SerialServer task) */
#!MVP2001Config(0, 1, MPF_Server_Location, "a-Serial[4]")

# PI C-844 driver setup parameters: 
#     (1) maximum number of controllers in system
#     (2) N/A
#     (3) motor task polling rate (min=1Hz,max=60Hz)
#!PIC844Setup(1, 0, 5)

# PI C-844 driver configuration parameters: 
#     (1) controller# being configured,
#     (2) port type: 0-GPIB_PORT or 1-RS232_PORT,
#     (3) GPIB link or MPF server location
#     (4) GPIB address or MPF serial server name
#!PIC844Config(0, 1, MPF_Server_Location, "a-Serial[0]")
#!drvPIC844debug = 4

# Micos MoCo driver setup parameters:
# Load MicosSetup once.
#     (1) max # of controller groups.  Controller groups are per serial
#         port.
#     (2) max # axes per controller group.  Maximum 16. (addr 0-15)
#     (3) motor task polling rate (min=1Hz, max=60Hz, 10Hz works well)
# Example:
#   MicosSetup(1, 2, 10) 1 group. 2 axes (controllers) in the group.
#                        10Hz poll.
#!MicosSetup(1, 2, 10)

# Micos MoCo driver configuration parameters:
# Load one MicosConfig for each group of Micos drivers.
#     (1) "Controller group" number
#     (2) MPF card
#     (3) MPF serial server
# Example:
#   MicosConfig(0, 1, "a-Serial[0]") Group 0, MPF card 1, port 0 on IP
#                                    slot A.
#!MicosConfig(0, MPF_Server_Location, "a-Serial[0]")

# IMS MDrive driver setup parameters: 
#     (1) maximum number of controllers in system
#     (2) N/A
#     (3) motor task polling rate (min=1Hz,max=60Hz)
#!MDriveSetup(1, 0, 1)

# IMS MDrive driver configuration parameters: 
#     (1) controller# being configured,
#     (2) port type: 0-GPIB_PORT or 1-RS232_PORT,
#     (3) GPIB link or MPF server location
#     (4) GPIB address or MPF serial server name
#!MDriveConfig(0, 1, MPF_Server_Location, "a-Serial[0]")
#!drvMDrivedebug = 4


# !GPIB!   ## !MPF-1-CPU! #Server_Mod_Name = GPIB_Module_Name
# !GPIB!   ## !MPF-2-CPU! #Server_Mod_Name = "GPIB0"
# !GPIB!   #HiDEOSGpibLinkConfig(GPIB_Link, GPIB_Addr, Server_Mod_Name)

iocInit
