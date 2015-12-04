
DECLARE INDVAR x y z;
DECLARE INDCONST a b c;
DECLARE PREDCONST P 1;
DECLARE PREDCONST Q 1 [pre];
DECLARE PREDCONST R 2 [inf];
DECLARE FUNCONST f 1;
DECLARE FUNCONST f1 1 [pre = 500];
DECLARE FUNCONST g 2;
DECLARE FUNCONST g1 2 [inf = 400 405];
DECLARE FUNCONST g2 2 [inf = 605 600];

SIMPLIFY a g1 b g1 c =  g1(g1(a,b),c);
SIMPLIFY a g2 b g2 c =  g2(a,g2(b,c));
SIMPLIFY f1 a g1 b = g1(f1(a),b);
SIMPLIFY f1 a g2 b = f1(g2(a,b));

SIMPLIFY a g1 b g2 c = g1(a,g2(b,c));
SIMPLIFY (a g1 b) g2 c = g2(g1(a,b),c);

TAUT (forall x y. (exists z. (a g1 z R z g2 a and Q x g1 z g2 y) or
                   forall z. not Q z))
     iff
     (forall x. (forall y.
        (exists z. (R(g1(a,z),g2(z,a)) and Q(g1(x,g2(z,y))))
        or
        (forall z. (not (Q(z))) )) ));

AXIOM A1: P(g(f(x),f(y))) and forall z. R(g(f(x),f(y)), g(z,y));


ALLI A1 x;

COMMENT | ALLI A1 y:x;                              |
COMMENT | A free occurrence of x would become bound |

COMMENT | ALLI A1 y:z;                                        |
COMMENT | y occurs within the scope of a quantifier binding z |


EXISTI A1 f(x):x;

COMMENT | EXISTI A1 f(x):x OCC 2;                   |
COMMENT | A free occurrence of x would become bound |


COMMENT | EXISTI A1 f(x):z;                                      |
COMMENT | f(x) occurs within the scope of a quantifier binding z |

EXISTI A1 f(x):z OCC 1;

