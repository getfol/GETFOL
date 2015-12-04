COMMENT | *************************************************************	|
COMMENT | * AUTHOR: F. Giunchiglia, R.W. Weyhrauch   DATE: around 1987	|
COMMENT | *								|
COMMENT | * SUBJECT: Proof of the following theorem:                    |
COMMENT | *   forall w c . (PTHEOREM(w,c) iff not Pconsist(mknot(w),c)) |
COMMENT | *								|
COMMENT | * NOTES: See related paper in book on reflection and          |
COMMENT | *        meta-level reasoning                                 |
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1989				|
COMMENT | *								|
COMMENT | *************************************************************	|
COMMENT | |
COMMENT | PROVING THE WAY -->|
COMMENT | forall w c . (PTHEOREM(w,c) imp not Pconsist(mknot(w),c)) |
COMMENT | |

PROBE ALL;

NAMECONTEXT PTHPCONSIST;

COMMENT | LANGUAGE DEFINITION |
COMMENT | SORTS DEFININITION |
DECLARE SORT CONTEXT WFF;
DECLARE SORT SETOFFACTS;

COMMENT | VARIABLES AND CONSTANTS DEFINITION |
DECLARE INDVAR   w [WFF];
DECLARE INDVAR   c [CONTEXT];

COMMENT | PREDICATES DEFINITION          |
DECLARE PREDCONST TAUT     2;
DECLARE PREDCONST PTHEOREM 2;
DECLARE PREDCONST Pconsist 2;

COMMENT | FUNCTIONS DEFINITION |
DECLARE FUNCONST mknot             (WFF)        =WFF;
DECLARE FUNCONST mkimp             (WFF,WFF)    =WFF;
DECLARE FUNCONST mkands            (SETOFFACTS) =WFF;
DECLARE FUNCONST setoffacts        (CONTEXT)    =SETOFFACTS;

COMMENT | AXIOMS DEFINITION | 
AXIOM AX6: forall w c.(Pconsist(w,c) iff not TAUT(mkimp (mkands (setoffacts(c)),mknot(w)),c));
AXIOM AX8: forall w c. (PTHEOREM(w,c) iff TAUT(mkimp (mkands (setoffacts(c)),w),c));
AXIOM I: forall w c . (PTHEOREM(w,c) iff PTHEOREM(mknot(mknot(w)),c));

NAMEPROOF PRF1;
ASSUME PTHEOREM(w,c);
ALLE I w c;
IFFE 2,1;
IMPE 1,3;
ALLE AX8 mknot(mknot(w)) c;
IFFE 5,1;
IMPE 4,6;
ALLE AX6 mknot(w) c;
TAUT not Pconsist(mknot(w),c) by 8,7;
IMPI 1,9;
ALLI 10 w c;

COMMENT | |
COMMENT | PROVING THE WAY <-- |
COMMENT | forall w c . (not Pconsist(mknot(w),c) imp PTHEOREM(w,c) |
COMMENT | |

MAKEPROOF PRF2;
SWITCHPROOF PRF2;
ASSUME not Pconsist(mknot(w),c);
ALLE AX6 mknot(w) c;
TAUT TAUT(mkimp (mkands (setoffacts(c)),mknot(mknot(w))),c) by 1,2;
ALLE AX8 mknot(mknot(w)) c;
IFFE 4,2;
IMPE 5,3;
ALLE I w c;
IFFE 7,2;
IMPE 8,6;
IMPI 1,9;
ALLI 10 w c;
