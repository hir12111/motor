/*
FILENAME...	drvPI.h
USAGE... This file contains driver "include" information that is specific to
Physik Instrumente (PI) GmbH & Co. motor controller driver support.

Version:	1.1.2.1
Modified By:	sluiter
Last Modified:	2004/01/21 17:30:17
*/

/*
 *      Original Author: Ron Sluiter
 *      Date: 12/17/03
 *
 *      Experimental Physics and Industrial Control System (EPICS)
 *
 *      Copyright 1991, the Regents of the University of California,
 *      and the University of Chicago Board of Governors.
 *
 *      This software was produced under  U.S. Government contracts:
 *      (W-7405-ENG-36) at the Los Alamos National Laboratory,
 *      and (W-31-109-ENG-38) at Argonne National Laboratory.
 *
 *      Initial development by:
 *              The Controls and Automation Group (AT-8)
 *              Ground Test Accelerator
 *              Accelerator Technology Division
 *              Los Alamos National Laboratory
 *
 *      Co-developed with
 *              The Controls and Computing Group
 *              Accelerator Systems Division
 *              Advanced Photon Source
 *              Argonne National Laboratory
 *
 *
 *
 * Modification Log:
 * -----------------
 * .01 12/17/03 rls - copied from drvIM483.h
 */

#ifndef	INCdrvPIh
#define	INCdrvPIh 1

#include "motordrvCom.h"

#define GPIB_TIMEOUT	2000 /* Command timeout in msec */
#define SERIAL_TIMEOUT	5000 /* Command timeout in msec */


/* PIC844 specific data is stored in this structure. */
struct PIC844controller
{
    int port_type;		/* GPIB_PORT or RS232_PORT */
    struct serialInfo *serialInfo;  /* For RS-232 */
    int gpib_link;
    int gpib_address;
    struct gpibInfo *gpibInfo;  /* For GPIB */
    int serial_card;            /* Card on which Hideos is running */
    char serial_task[20];       /* Hideos task name for serial port */
    CommStatus status;		/* Controller communication status. */
};

/* Motion Condition register */

typedef union
{
    unsigned short All;
    struct
    {
	unsigned int axis4ML        :1;	/* Axis#4 Minus Limit Switch */
	unsigned int axis3ML        :1;	/* Axis#3 Minus Limit Switch */
	unsigned int axis2ML        :1;	/* Axis#2 Minus Limit Switch */
	unsigned int axis1ML        :1;	/* Axis#1 Minus Limit Switch */
	unsigned int axis4PL        :1;	/* Axis#4 Plus Limit Switch */
	unsigned int axis3PL        :1;	/* Axis#3 Plus Limit Switch */
	unsigned int axis2PL        :1;	/* Axis#2 Plus Limit Switch */
	unsigned int axis1PL        :1;	/* Axis#1 Plus Limit Switch */
	unsigned int axis4ME        :1;	/* Axis#4 Motion-Error */
	unsigned int axis3ME        :1; /* Axis#3 Motion-Error */
	unsigned int axis2ME        :1;	/* Axis#2 Motion-Error */
	unsigned int axis1ME        :1;	/* Axis#1 Motion-Error */
	unsigned int axis4IM        :1;	/* Axis#4 in motion */
	unsigned int axis3IM        :1;	/* Axis#3 in motion */
	unsigned int axis2IM        :1;	/* Axis#2 in motion */
	unsigned int axis1IM        :1;	/* Axis#1 in motion */
    } Bits;                                
} C844_Cond_Reg;

#endif	/* INCdrvPIh */

