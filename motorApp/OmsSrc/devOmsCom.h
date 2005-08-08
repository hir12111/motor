/*
FILENAME..	devOmsCom.h

USAGE... 	This file contains OMS device information that is
		common to all OMS device support modules.

Version:	1.2
Modified By:	sluiter
Last Modified:	2000/07/14 20:01:20
*/

/*
 *      Original Author: Ron Sluiter
 *      Date: 12/22/98
 *
 *      Experimental Physics and Industrial Control System (EPICS)
 *
 *      Copyright 1991, the University of Chicago Board of Governors.
 *
 *      This software was produced under  U.S. Government contract
 *      W-31-109-ENG-38 at Argonne National Laboratory.
 *
 *      Beamline Controls & Data Acquisition Group
 *      Experimental Facilities Division
 *      Advanced Photon Source
 *      Argonne National Laboratory
 *
 * Modification Log:
 * -----------------
 */

#ifndef	INCdevOmsComh
#define	INCdevOmsComh 1

#include "motordevCom.h"

extern long oms_build_trans(motor_cmnd, double *, struct motorRecord *);

#endif	/* INCdevOmsComh */
