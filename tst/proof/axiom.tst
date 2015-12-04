COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Luciano Serafini (serafini)      			|
COMMENT | *								|
COMMENT | * SUBJECT: AXIOM SCHEMAS TEST                                 |
COMMENT | *								|
COMMENT | * GETFOL VERSION: june 1991         				|
COMMENT | *								|
COMMENT | *************************************************************	|

declare indvar x y z x1 x2 x3 y1 y2 y3 z1 z2 z3;
declare funconst f 1;
declare funconst g 2;
declare funconst h 3;
declare predconst p q 1;
declare predconst r s 2;

declare funpar PHI PHI1 PHI2 1;
declare funpar PSI PSI1 PSI2 2;
declare funpar CHI CHI1 CHI2 3;
declare predpar PI 1;
declare predpar RHO 2;
declare Predpar SIGMA 3;

axiom lin11: PHI1(PHI2(x)) = PHI2(PHI1(x));
axiom lin12: PHI(PSI(x y)) = PSI(PHI(x) PHI(y));
axiom lin13: PHI(CHI(x y z)) = CHI(PHI(x) PHI(y) PHI(z));
axiom lin21: PSI(PHI(x) PHI(y)) = PHI(PSI(x y));
axiom lin22: PSI1(PSI2(x1 y1) PSI2(x2 y2)) = PSI2(PSI1(x1 x2) PSI1(y1 y2));
axiom lin23: PSI(CHI(x1 y1 z1) CHI(x2 y2 z2)) = 
                          CHI(PSI(x1 x2) PSI(y1 y2) PSI(z1 z2));
axiom lin31: CHI(PHI(x) PHI(y) PHI(x)) = PHI(CHI(x y z));
axiom lin32: CHI(PSI(x1 y1) PSI(x2 y2) PSI(x3 y3)) = 
                          PSI(CHI(x1 y1 z1) CHI(x2 y2 z2));
axiom lin33: CHI1(CHI2(x1 y1 z1) CHI2(x2 y2 z2) CHI2(x3 y3 z3)) = 
                          CHI2(CHI1(x1 x2 x3) CHI1(y1 y2 y3) CHI1(z1 z2 z3));

axiom unary: PI(x) imp PI(f(x));
axiom binary: PI(x) and PI(y) imp PI(g(x y));
axiom ternary: PI(x) and PI(y) and PI(z) imp PI(h(x y z));

COMMENT |                                                               |
COMMENT | we prove:           forall x. f(x) = x                        |
COMMENT |                                                               |

eval x = x;
impe 1  unary PI:lambda y. x=y;
alli 2 x;

COMMENT |                                                               |
COMMENT | we prove:           forall x. g(x x) = x                      |
COMMENT |                                                               |

andi 1 1;
alli binary PI:lambda y. x=y y:y1;
alle ^1 x;
impe ^1 ^3;
alli ^1 x;

COMMENT |                                                               |
COMMENT | we prove:           forall x. h(x x x) = x                      |
COMMENT |                                                               |

andi 1 1;
andi ^1 1;
alli ternary PI:lambda y. x=y y:y1 z:z1;
alle ^1 x x;
impe ^1 ^3;
alli ^1 x;

COMMENT | we prove:                                                    |
COMMENT |                                                              |
COMMENT |      f(g(h(x1 y1 z1) h(x2 y2 z2))) =                         |
COMMENT |      h(g(f(x1) f(x2)) g(f(y1) f(y2)) g(f(z1) f(z2)))         |
COMMENT |                                                              |

eval f(g(h(x1 y1 z1) h(x2 y2 z2))) = f(g(h(x1 y1 z1) h(x2 y2 z2)));
alli lin12 PHI: lambda x. f(x) PSI: lambda x y. g(x y) x y;
alle ^1 h(x1 y1 z1) h(x2 y2 z2);
subst ^3 ^1 occ 2;
alli lin13 PHI: lambda x. f(x) CHI: lambda x y z. h(x y z) x y z;
alle ^1 x1 y1 z1;
subst ^3 ^1;
alle ^3 x2 y2 z2;
subst ^2 ^1;
alli lin23 PSI: lambda x y. g(x y) CHI: lambda x y z. h(x y z) x1 x2 y1 y2 z1 z2;
alle ^1 f(x1) f(x2) f(y1) f(y2) f(z1) f(z2);
subst ^3 ^1;









