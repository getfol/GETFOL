reset;
declare indvar x,y,z,w;
declare indconst a,b,c,d;
declare predconst P,Q,R,S,T,U 1;
declare predconst F,G,H,I,J,K 2;
declare sentconst S1,S2,S3,S4;

ECHO | This is Pelletier's problem n. 1 - 2 points |

decide (S1 imp S2) iff (not S2 imp not S1) using ptaut;


ECHO |This is Pelletier's problem n. 2 - 2 points|
decide not not S1 iff S1
using ptaut;


ECHO |This is Pelletier's problem n. 3 - 1 point|
decide not (S1 imp S2) imp (S2 imp S1)
using ptaut;


ECHO |This is Pelletier's problem n. 4 - 2 points| 
decide (not S1 imp S2) iff (not S2 imp S1)
using nnf, ptaut;


ECHO |This is Pelletier's problem n. 5 - 4 points| 
decide ((S1 or S2) imp (S1 or S3)) imp (S1 or (S2 imp S3))
using  ptaut;


ECHO |This is Pelletier's problem n. 6 - 2 points| 
decide  (S1 or not S1) using  ptaut;


ECHO |This is Pelletier's problem n. 7 - 3 points|
decide (S1 or not not not S1) using ptaut;


ECHO |This is Pelletier's problem n. 8 - 5 points|
decide ((S1 imp S2) imp S1) imp S1 using ptaut;


ECHO |This is Pelletier's problem n. 9 - 6 points|
decide ((S1 or S2) and (not S1 or S2) and (S1 or not S2)) imp 
not (not S1 or not S2) using ptaut;

ECHO |This is Pelletier's problem n. 10 - 4 points|
assume S1 imp S3;
assume S3 imp (S1 and S2);
assume S1 imp (S2 or S3);
decide S1 iff S3 by ^3:^1 using ptaut;

ECHO |This is Pelletier's problem n. 11 - 1 point|
decide (S1 iff S1) using ptaut;

ECHO |This is Pelletier's problem n. 12 - 7 points|
decide ((S1 iff S2) iff S3) iff (S1 iff (S2 iff S3))
using ptaut;

ECHO | ... and now, Pelletier' problem n. 13  - 5 points|
decide (S1 or (S2 and S3)) iff ((S1 or S2) and (S1 or S3))
using ptaut;

ECHO |here's Pelletier's n. 14 !! -  6 points|
decide (S1 iff S2) iff ((S2 or not S1) and (not S2 or S1))
using ptaut;

ECHO |here's Pelletier's problem n. 15 - 5 points| 
decide (S1 imp S2) iff (not S1 or S2) using ptaut;

ECHO |This is Pelletier's problem n. 16 -  4 points|
decide (S1 imp  S2) or (S2 imp S1) using ptaut;

ECHO |This is Pelletier's problem n. 17 - 6 points|
decide ((S1 and (S2 imp S3)) imp S4) iff ((not S1 or S2 or S4) and 
 (not S1 or not S3 or S4)) using ptaut;


ECHO | Problem's from Pelletier's collection : |
ECHO | section two : Monadic Predicate Logic |


ECHO |Pelletier 18 1pt|
decide exists x.(forall y.(forall z.((P(y) imp Q(z)) imp (P(x) imp Q(x)))))
 using nnf, reduce, skolemize, phexp, ptaut; 

ECHO |Pelletier's problem n. 19 - 3 points|
ECHO | Note that this formula is not in the UE class |
ECHO | but it can be reduced using "reduce" ...      |

decide exists x.forall y.forall z.((P(y) imp Q(z) imp (P(x) imp Q(x))))
using nnf, reduce, skolemize, phexp, ptaut;


ECHO |Pelletier's problem n. 20 - 4 points|
decide (forall x,y.exists z.forall w.((P(x) and Q(y)) imp (R(x) and S(w)))
imp (exists x,y.(P(x) and Q(y)) imp exists z.R(z)))
using nnf, reduce, skolemize, phexp,  ptaut; 

ECHO |Pelletier's problem n. 21 - 5 points|
assume exists x.(S1 imp P(x)); 
assume exists x.(P(x) imp S1);
decide exists x.(S1 iff P(x)) by ^2:^1 
using nnf, reduce, skolemize, phexp,  ptaut;

ECHO |Pelletier's problem  22 - 3 points|
decide forall x.(S1 iff P(x)) imp (S1 iff forall x.P(x))
 using nnf, reduce, skolemize, phexp, tautren, ptaut; 

ECHO |This is Pelletier's problem n. 23 - 4 points|
decide forall x.(S1 or P(x)) iff (S1 or forall x.P(x))
using nnf, reduce, skolemize, phexp,ptaut;


ECHO |This is Pelletier's problem n. 24 - 6 points|
assume not exists x.(S(x) and Q(x));
assume forall x.(P(x) imp (Q(x) or R(x)));
assume (not exists x.P(x)) imp exists x.Q(x);
assume forall x.(Q(x) or R(x) imp S(x));
decide exists x.(P(x) and R(x)) by ^4:^1 using nnf, reduce, skolemize,
phexp, tautren,  ptaut;

ECHO |This is Pelletier's problem n. 25 - 7 points|
assume exists x.P(x);
assume forall x.(S(x) imp (not Q(x) and R(x)));
assume forall x.(P(x) imp (Q(x) and S(x)));
assume forall x.(P(x) imp T(x)) or exists x.(P(x) and R(x));
decide  exists  x.(T(x)  and   P(x))  by  ^4:^1  using  nnf,   reduce,
skolemize, phexp, ptaut; 

ECHO |This is Pelletier's problem n. 26 - 7 points|
assume exists x.P(x) iff exists x.Q(x);
assume forall x,y.((P(x) and Q(y)) imp (R(x) iff S(y)));
decide forall x.(P(x) imp R(x)) iff forall x.(Q(x) imp S(x)) by ^2:^1 using nnf, reduce, skolemize, phexp, ptaut;

ECHO |This is Pelletier's problem n. 27 - 6 points |
assume exists x.(P(x) and not Q(x));
assume forall x.(P(x) imp R(x));
assume forall x.((S(x) and T(x)) imp P(x));
assume exists x.(R(x) and not Q(x)) imp forall x.(T(x) imp not R(x));
decide   forall    x.(S(x)    imp   not    T(x))    by   ^4:^1   using
nnf,reduce,skolemize,phexp,ptaut;


ECHO |Pelletier's problem n. 28 - 8 points|
assume forall x.(P(x) imp forall x.Q(x));
assume forall x.(Q(x) or R(x)) imp exists x.(Q(x) and S(x));
assume exists x.S(x) imp forall x.(T(x) imp U(x));
decide forall x.((P(x) and T(x)) imp U(x)) by ^3:^1 using nnf, reduce,
skolemize, phexp, ptaut;

ECHO |Pelletier's problem n. 29 - 7 points|
assume exists x.P(x) and exists x.S(x);
decide (forall x.(P(x) imp R(x)) and forall x.(S(x) imp T(x))) iff forall x,y.((P(x) and S(y)) imp (R(x) and T(y))) by ^1 using nnf, reduce, skolemize, phexp, tautren, ptaut; 

ECHO |Pelletier's problem n. 30 - 6 points|
assume forall x.((P(x) or Q(x)) imp (not T(x)));
assume forall x.((Q(x) imp (not S(x))) imp (P(x)  and T(x)));
decide exists x.S(x) by ^2:^1 using nnf, reduce, skolemize, phexp, tautren, ptaut; 

ECHO |Pelletier's problem n. 31 - 5 points|
assume not (exists x.(P(x) and (R(x) or Q(x))));
assume exists x.(S(x) and P(x));
assume forall x.(not Q(x) imp T(x));
decide exists x.(S(x) and T(x)) by ^3:^1 
using nnf, reduce, skolemize, phexp, ptaut;

ECHO |Pelletier's problem n. 32 - 6 points|
assume forall x.((P(x) and (R(x) or Q(x))) imp S(x));
assume forall x.((S(x) and Q(x)) imp T(x));
assume forall x.(U(x) imp Q(x));
decide forall x.((P(x) and U(x)) imp T(x)) by ^3:^1
 using nnf, reduce, skolemize, phexp, ptaut;

ECHO |Pelletier's problem  n. 33 - 4 points|
decide forall x.(P(a) and (P(x) imp P(b)) imp P(c)) iff
forall x.((not P(a) or (P(x) or P(c))) and (not P(a) or (not P(b) or P(c))))
using nnf, reduce, skolemize, phexp, ptaut;

ECHO |Pelletier's problem n. 35 - 2 points|
decide exists x.exists y.(F(x,y) imp forall x.forall y.F(x,y)) using
nnf,reduce,skolemize,phexp,ptaut;

ECHO | Pelletier's problem n. 39 |
ECHO | Russell's paradox - 3 points |

decide   not   exists  x.forall  y.(F(x,y)   iff  not   F(y,y))  using
nnf,reduce,skolemize,phexp,ptaut;


ECHO  |This is Pelletier's problem n. 48 - 3 points|
assume a = b or c = d;
assume a = c or b = d;
decide a = d or b = c by ^2:^1 using ptauteq;

ECHO  |This is Pelletier's problem n. 49 - 5 points|
assume exists x.exists y.forall z.(z = x or z = y);
assume P(a) and P(b);
assume not (a = b);
decide forall x.P(x) by ^3:^1 using nnf,reduce,skolemize,phexp,ptauteq;

