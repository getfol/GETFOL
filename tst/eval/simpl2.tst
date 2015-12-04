COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Paolo Pecchiari      			        |
COMMENT | *								|
COMMENT | * SUBJECT: SIMPLIFY TEST                                      |
COMMENT | *								|
COMMENT | * GETFOL VERSION: September 1990				|
COMMENT | *								|
COMMENT | *************************************************************	|

declare indconst a b c;
DECREP rep1 rep2;
attach a to a;
attach b to[*] b;
attach c to [rep1]c;
hardware c dar c;


declare funconst f 2;
declare predconst p 2;
declare predconst pp 1;

attach pp to pp;


attach f to f;
attach f to [rep1 rep2 = *] l;
attach p to p;
attach p to [rep1 *] p;

declare sentconst S1,S2,S3;
attach S1 to T;
simplify S1;
simplify S1 and S1;
simplify S1 imp S1;

attach S2 to NIL;
simplify S2;

attach S3 to UNDEF&;
simplify S3;

declare predconst P 2;

attach P to P;

DEFLAM P(x y) T;
attach a to a;
attach b to b;
simplify P(a b);


DEFLAM fact(n) (IF (EQ n 0) 1 (* n (fact (- n 1))));

know natnums;

declare funconst fact 1;
attach fact to [NATNUMREP=NATNUMREP]fact;
simplify fact(3);

attach a to c;
DEFLAM P(a b) (IF (EQ a (QUOTE c))T NIL);
simplify P(a b);
simplify P(b a);



declare sort s;
DEFLAM s(x) T;
attach s to s;
simplify s(a);
declare sort t;
moregeneral t <s>;
simplify t(a);
