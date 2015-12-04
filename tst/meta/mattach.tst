COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Alessandro Cimatti          Date: july 1990         |
COMMENT | *								|
COMMENT | * SUBJECT: Use of MATTACH					|
COMMENT | *								|
COMMENT | * NOTES:							|
COMMENT | *  The syntax has been uniformed to the ATTACH's one.		|
COMMENT | *								|
COMMENT | * TECHNICAL NOTES:						|
COMMENT | *  Now it is possible to specify the representation for the   |
COMMENT | *  attachment being constructed.                              |
COMMENT | *								|
COMMENT | * GETFOL VERSION: july 1990, vers. 3                          |
COMMENT | *								|
COMMENT | *************************************************************	|


namecontext META;
nameproof P1;

declare indconst sc [SENTCONST];
declare indconst ic [INDCONST];
declare indconst vl [FACT];
declare indconst f1 [FACT];

DECREP  SENTCONST INDCONST FACT;

represent { SENTCONST } as SENTCONST;
represent { INDCONST } as INDCONST;
represent { FACT } as FACT;

makecontext C;
switchcontext C;
declare indconst c;
declare sentconst A;
nameproof P1;
assume c=c;

makeproof P2;
switchproof P2;
assume A imp A;
label fact ax = 1;

switchcontext META;
MATTACH sc TO  C::SENTCONST:A;
MATTACH ic DAR C:P2:INDCONST:c;
MATTACH vl DAR [SENTCONST] C:P1:FACT:1;
MATTACH f1 TO  C:P2:FACT:1;
MATTACH f1 DAR C:P2:FACT:ax;

