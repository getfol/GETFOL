COMMENT | *************************************************************	|
COMMENT | * AUTHOR: R.W. Weyhrauch      	DATE: around 1978       |
COMMENT | *								|
COMMENT | * SUBJECT: Peano/ Robinson arithmetic (with SS)               |
COMMENT | *								|
COMMENT | * NOTES: See Prolegomena paper in AI Journal 1980 (appendix A)|
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1989				|
COMMENT | *								|
COMMENT | *************************************************************	|
COMMENT | this is the example in the App. A of the Prolegomena |
COMMENT | |
PROBE ALL;

KNOW NATNUMS;

DECLARE INDCONST UNO DUE TRE DIECI [NATNUMSORT];
DECLARE INDVAR n m p q [NATNUMSORT];
DECLARE FUNCONST suc pred (NATNUMSORT) = NATNUMSORT;
DECLARE FUNCONST + * (NATNUMSORT,NATNUMSORT) = NATNUMSORT [INF];
DECLARE PREDCONST < 2 [INF];
DECLARE PREDPAR P 2;

AXIOM 	ONEONE: forall n m . (suc(n) = suc(m) imp n = m);
AXIOM	SUCC1:  forall n . (not 0 = suc (n));
AXIOM	SUCC2:  forall n . (not 0 = n imp exists m . (n = suc(m)));
THEORY	PLUS:   forall n . n + 0 = n,
		forall n m . n + suc(m) = suc(n+m);
THEORY	TIMES:	forall n . n * 0 = 0,
		forall n m . n * suc(m) = (m*n) + m;


ATTACH suc TO [NATNUMREP=NATNUMREP] ADD1;
ATTACH pred TO [NATNUMREP=NATNUMREP] SUB1;
ATTACH + TO[NATNUMREP,NATNUMREP=NATNUMREP] PLUS;
ATTACH * TO[NATNUMREP,NATNUMREP=NATNUMREP] TIMES;
ATTACH < TO [NATNUMREP,NATNUMREP] LT;
ATTACH UNO DAR [NATNUMREP] 1;
ATTACH TRE TO  [NATNUMREP] 1;

COMMENT | |
COMMENT | added by FAusto (July 1987) to prove the SIMPLIFY command |
COMMENT | It must prove "UNO = TRE " |
COMMENT | |
SIMPLIFY UNO = TRE;
