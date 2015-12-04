COMMENT | this is the example of App. F  of the Prolegomena |

KNOW NATNUMS;

DECLARE INDVAR n m p q [NATNUMSORT];
DECLARE FUNCONST suc pred (NATNUMSORT) = NATNUMSORT;
DECLARE FUNCONST + * (NATNUMSORT,NATNUMSORT) = NATNUMSORT [INF];
DECLARE FUNCONST fact(NATNUMSORT) = NATNUMSORT;
DECLARE PREDCONST < 2 [INF];

AXIOM 	ONEONE: forall n m . (suc(n) = suc(m) imp n = m);
THEORY	SUCC:   forall n . (not 0 = suc (n)),
		forall n . (not 0 = n imp exists m . (n = suc(m)));
THEORY	PLUS:   forall n . n + 0 = n,
		forall n m . n + suc(m) = suc(n+m);
THEORY	TIMES:	forall n . n * 0 = 0,
		forall n m . n * suc(m) = (m*n) + m;
AXIOM	FACT:	
forall n . fact(n) = (if n = 0 then 1 else n * fact(pred(n)));


ATTACH suc to[NATNUMREP= NATNUMREP] ADD1;
ATTACH pred to[NATNUMREP= NATNUMREP] SUB1;
ATTACH + to [NATNUMREP,NATNUMREP = NATNUMREP]PLUS;
ATTACH * to [NATNUMREP,NATNUMREP = NATNUMREP]TIMES;
ATTACH < to [NATNUMREP,NATNUMREP] LT;

SETBASICSIMP AXS AT FACTS {ONEONE,SUCC1,SUCC2,PLUS1,PLUS2,TIMES1,TIMES2,FACT};
SHOW SIMPSET AXS;
SETCOMPSIMP ALL AT LOGICTREE uni AXS;
SHOW SIMPSET ALL;

EVAL fact(2);
EVAL fact(2) BY AXS;
EVAL fact(2) BY ALL;


