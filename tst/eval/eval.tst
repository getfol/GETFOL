COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Paolo Pecchiari      			        |
COMMENT | *								|
COMMENT | * SUBJECT: EVAL TEST 	                                        |
COMMENT | *								|
COMMENT | * GETFOL VERSION: September 1990				|
COMMENT | *								|
COMMENT | *************************************************************	|

namecontext one;

declare sentconst S T R;
attach S to NIL;
attach T to T;
attach R to UNDEF&;


eval S and T;
eval not S;
eval S imp T;
eval S iff T;
eval wffif S then T else R; 
eval S or T;


makecontext two;
switchcontext two;

declare sentconst S T R;
attach S to T;
attach T to T;
attach R to UNDEF&;


eval S and T;
eval not S;
eval S imp T;
eval S iff T;
eval wffif S then T else R; 
eval S or T;


makecontext three;
switchcontext three;

declare sentconst S T R;
attach S to T;
attach T to NIL;
attach R to UNDEF&;


eval S and T;
eval not S;
eval S imp T;
eval S iff T;
eval wffif S then T else R; 
eval S or T;

makecontext four;
switchcontext four;

declare sentconst S T R;
attach S to NIL;
attach T to NIL;
attach R to UNDEF&;


eval S and T;
eval not S;
eval S imp T;
eval S iff T;
eval wffif S then T else R; 
eval S or T;


makecontext five;
switchcontext five;

declare indconst a b c;


declare predconst p q 3;
declare indvar x y;
declare indpar par;
declare predpar P 1;
declare sentpar ST;
declare funconst f 2;
declare funpar F 1;

DECREP rep1, rep2, rep3;

attach a to [rep1]a;
attach b to [rep2]b;
attach c to [rep3]c;

attach p to [rep1,rep2,rep3]p;
deflam p(x y z)T;

attach q to [rep1,rep2,rep3]q;
deflam q(x y z)NIL;

eval p(a b c);
eval q(a b c);
eval forall x y.((P(f(x y)) imp ST) and (p(F(par),b, c) and q(a b c)));
eval exists x y.((P(f(x y)) imp ST) and (p(F(par),b, c) and q(a b c)));
