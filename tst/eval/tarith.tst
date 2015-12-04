COMMENT | *******************************************************|
COMMENT | * AUTHOR:Richard Weyhrauch   DATE:around 1984     	 |
COMMENT | *							 |
COMMENT | * SUBJECT: this file basicly refers to the examples of | 
COMMENT | * the FOL manual					 |
COMMENT | *							 |
COMMENT | * GETFOL VERSION: October 1989			 |
COMMENT | *							 |
COMMENT | *******************************************************|

know natnums;

COMMENT | NATNUMSORT is a sort for <NATNUMSORT> |
COMMENT | x y z are individual variables for NATNUMSORT |

DECLARE INDVAR x y z [NATNUMSORT];

DECLARE FUNCONST s p (NATNUMSORT)=NATNUMSORT;

DECLARE FUNCONST + * (NATNUMSORT NATNUMSORT)=NATNUMSORT [INF];

DECLARE PREDCONST < 2 [INF];

DECLARE PREDPAR PHI 1;

COMMENT |Assiomi di Robinson|

AXIOM oneone:forall x y. s(x) = s(y) imp x = y;

AXIOM succ1:forall x. (not 0=s(x));
AXIOM succ2:forall x. not x = 0 imp (exists y. s(y) = x);
AXIOM succ3:forall x. not s(x) = x;

AXIOM plus1:forall x. x + 0 = x;
AXIOm plus2: forall x y. x + s(y) = s(x + y);

AXIOM times1: forall x. x * 0 = 0;
AXIOM times2: forall x y. x * s(y) = (x * y) + x;

AXIOM induct:
PHI(0) and (forall x. (PHI(x) imp PHI(s(x)))) imp (forall x. PHI(x));

DEFLAM s (x) (+ x 1);
ATTACH s TO [NATNUMREP=NATNUMREP]s;

DEFLAM p (x)
 (IF (> x 0) 
  (- x 1)
  0);
ATTACH p TO [NATNUMREP=NATNUMREP]p;
                                
DEFLAM plus (x y) (+ x y);
ATTACH + TO [NATNUMREP,NATNUMREP=NATNUMREP]plus;

DEFLAM times (x y) (* x y);
ATTACH * TO [NATNUMREP,NATNUMREP=NATNUMREP]times;

DEFLAM less (x y) (< x y);
ATTACH < TO [NATNUMREP,NATNUMREP]less;

DECLARE FUNCONST fact(NATNUMSORT)=NATNUMSORT;

AXIOM FACT:forall x. fact(x)= trmif x = 0 then 1 else x *fact(p(x));

setbasicsimp S at facts {FACT};

eval fact(5) by S uni LARGIFTREE;

eval (3 * 8);

eval (4 + 5);
