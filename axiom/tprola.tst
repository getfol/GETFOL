COMMENT | *************************************************************	|
COMMENT | * AUTHOR: R.W. Weyhrauch      	DATE: around 1978       |
COMMENT | *								|
COMMENT | * SUBJECT: Peano/ Robinson arithmetic                         |
COMMENT | *								|
COMMENT | * NOTES: See Prolegomena paper in AI Journal 1980 (appendix A)|
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1989				|
COMMENT | *								|
COMMENT | *************************************************************	|

KNOW NATNUMS;

DECLARE INDVAR n m p q [NATNUMSORT];
DECLARE FUNCONST suc pred (NATNUMSORT) = NATNUMSORT;
DECLARE FUNCONST + * (NATNUMSORT,NATNUMSORT) = NATNUMSORT [INF];
DECLARE PREDCONST < 2 [INF];
DECLARE PREDPAR P 1;

AXIOM 	ONEONE: forall n m . (suc(n) = suc(m) imp n = m);
AXIOM	SUCC1:  forall n . (not 0 = suc (n));
AXIOM	SUCC2:  forall n . (not 0 = n imp exists m . (n = suc(m)));
THEORY	PLUS:   forall n . n + 0 = n,
		forall n m . n + suc(m) = suc(n+m);
THEORY	TIMES:	forall n . n * 0 = 0,
		forall n m . n * suc(m) = (m*n) + m;
AXIOM INDUCT: P(0) and forall n . (P(n) imp P(suc(n))) imp forall n . P(n);

ATTACH suc TO [NATNUMREP=NATNUMREP] ADD1;
ATTACH pred TO [NATNUMREP=NATNUMREP] SUB1;
ATTACH + TO [NATNUMREP,NATNUMREP=NATNUMREP] PLUS;
ATTACH * TO [NATNUMREP,NATNUMREP=NATNUMREP] TIMES;
ATTACH < TO [NATNUMREP,NATNUMREP] LT;

SIMPLIFY 2 + 3 < pred(7);
SIMPLIFY 4 * suc(2) + pred(3) < pred(pred(8));
SIMPLIFY n * 0 < 3;

