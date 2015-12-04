COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Paolo Pecchiari      			        |
COMMENT | *								|
COMMENT | * SUBJECT: REWRITE TEST                                       |
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1990				|
COMMENT | *								|
COMMENT | *************************************************************	|

declare sentconst A B;
declare sort S T;
declare indvar s[S];
declare indconst d[S];
declare indvar t[T];
declare indvar x y z;
declare indconst a b c;
declare predconst p q 2;

assume forall x.p(x,x);
assume forall x y.(p(x y) iff q(x y));
assume forall s.S(s);
assume forall x y.p(x y) iff forall x y.q(x y);
assume forall x.(p(a a ) iff p(x  x));

setbasicsimp s1 at FACTS {1};
setbasicsimp s2 at FACTS {2};
setbasicsimp s3 at FACTS {3};
setbasicsimp s4 at FACTS {4};

rewrite p(a a) by s1;
rewrite p(a b) by s2;
rewrite p(x,x) by s2;
rewrite forall x.TRUE;
rewrite A and not A;
rewrite (A and A) iff (B and A);
rewrite S(d) by s3;
rewrite forall x.S(x) and forall x.S(x);
rewrite forall x.(forall x.TRUE);
rewrite p(y y) by s1;
rewrite p(t t) by s1;
rewrite p(a b) by s2;
rewrite forall y x.p(y x) by s4; 
