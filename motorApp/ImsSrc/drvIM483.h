/*
FILENAME...	drvIM483.h
USAGE... This file contains driver "include" information that is specific to
	Intelligent Motion Systems, Inc. IM483(I/IE).

Version:	1.1
Modified By:	sluiter
Last Modified:	2000/07/25 13:36:40
*/

/*
 *      Original Author: Ron Sluiter
 *      Date: 02/10/2000
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
 * .01	02/10/2000	rls     copied from drvMM4000.h
 */

#ifndef	INCdrvIM483h
#define	INCdrvIM483h 1

#include "motordrvCom.h"

#define GPIB_TIMEOUT	2000 /* Command timeout in msec */
#define SERIAL_TIMEOUT	2000 /* Command timeout in msec */


/* IM483 specific data is stored in this structure. */
struct IM483controller
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

#endif	/* INCdrvIM483h */

