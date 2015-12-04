COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Lorenzo Galvagni            DATE: january 1992      |
COMMENT | *						                |
COMMENT | * SUBJECT: REASON AND SHOWPREMISES TEST       	        |
COMMENT | *	        	        	        		|
COMMENT | * NOTES:                                                      |
COMMENT | *								|
COMMENT | *		                				|
COMMENT | * TECHNICAL NOTES:    	                		|
COMMENT | *				                        	|
COMMENT | * GETFOL VERSION: january 1992                                |
COMMENT | *								|
COMMENT | *************************************************************	|
probe all;

COMMENT | NATURAL DEDUCTION |
reset;
declare sentconst A;
assume A;
show premises 1;

reset;
declare sentconst A B C D E;
assume A B;
andi 1 2;
assume C D E;
andi 1 conj 2 3;
show premises 7;
andi 1 conj 2 3 conj 4;
show premises 8;
andi 1 conj 2 conj 3 4;
show premises 9;
andi 9 conj 4 8;
show premises 10;
show premises 10 2;
show premises 10 all;

reset;
declare sentconst A B C D;
assume A and ((B and C) and D);
ande 1 1;
show premises 2;

reset;
declare sentconst A;
assume A;
impi 1 1;
show premises 2;

reset;
declare sentconst A B;
assume A;
assume A imp B;
impe 1 2;
show premises 3;

reset;
declare sentconst A B;
assume A;
ori 1 B;
show premises 2;

reset;
declare sentconst A B C;
assume B imp A;
assume C imp A;
assume B;
assume C;
impe 3 1;
impe 4 2;
assume B or C;
ore 7 5 6;
show premises 8 all;

reset;
declare sentconst A;
assume not A not not A;
falsei 1 2;
note 3 not A;
impi 2 4;
show premises 5 all;

reset;
declare sentconst A;
assume FALSE;
falsee 1 A and not A;
show premises 2;

reset;
declare sentconst A;
assume A not A;
falsei 1 2;
noti 3 not A;
impi 1 4;
show premises 5 all;

reset;
declare sentconst A B;
assume A imp B B imp A;
iffi 1 2;
iffi 2 1;
show premises 3;
show premises 4;

reset;
declare sentconst A;
assume A iff not not A;
iffe 1 1;
iffe 1 2;
show premises 3;

reset;
declare predconst P 1;
declare indvar x;
declare indpar a;
assume P(a);
impi 1 1;
alli 2 a:x;
alli 2 x;
show premises 3 all;
show premises 4 all;

reset;
declare predconst P 2;
declare indvar x y;
declare indconst c1 c2;
assume forall x y. P(x,y);
alle 1 c1;
alle 1 x c1;
alle 1 c1 c2;
show premises 2;
show premises 3;
show premises 4;

reset;
declare predconst P 2;
declare indvar x y;
declare indconst c1 c2;
assume P(c1,c2);
existi 1 c1:x c2:y;
show premises 2;

reset;
declare indvar x y;
declare indpar a b;
declare predconst P 2;
assume exists y. P(a,y);
existe 1 b;
show premises 2;

reset;
declare sentconst A B;
declare sentpar alpha beta;
axiom axA: A;
impi axA axA;
axiom Hil1: alpha imp (beta imp alpha);
impe 1 Hil1 alpha: A imp A, beta: B;
show premises 2;

reset;
declare sentconst A B C;
theory hilbert :
	hilbert1: A imp (B imp C)
	hilbert2: (A imp (B imp C)) imp ((A imp B) imp (A imp C));
mp hilbert1 hilbert2;
andi hilbert hilbert;
theory tautologies:
 	IMP: A imp A
	OR: A or not A;
show premises 2;

COMMENT | EQUALITY RULES |
reset;
declare predconst P Q 2;
declare funconst f 1;
declare indvar x y;
assume P(x,y) imp Q(y,x);
assume x = f(x);
subst 1 2;
subst 3 2 right;
subst 1 2 occ 1;
show premises 4 all;
show premises 5;

COMMENT | CONDITIONAL RULES |
reset;
declare sentconst A;
assume A;
assume not A;
wffifi A 1 2;
show premises 3 all;

reset;
declare sentconst A B C;
assume A;
assume wffif A then B else C;
wffife 2 1;
show premises 3;

COMMENT | OTHER RULES |
reset;
declare sentconst A B C;
assume A A A B C;
axiom AAA: A;
ori 3 4;
ori 5 6;
wk 7 by 6 2 1 3;
show premises 8 all;

reset;
declare sentconst A B C D E F;
assume A A A A B B C D;
wk 8 by 1 2 3 4 5 6 7;
ctc 9 by 1 5;
show premises 10 all;

reset;
declare sentconst A B C;
axiom AAA: A;
assume A A A A B C;
wk 5 by 1 2 3 4;
wk AAA by 6;
cut 8 7;
show premises 9 all;

COMMENT | DECIDERS |
reset;
declare sentconst A B;
ptaut (A imp (B imp A));
show premises 1;

reset;
declare sentconst A B;
assume A B;
ptaut (A and B) by 1 2;
show premises 3;

reset;
declare sentconst A;
declare predconst P 1;
declare indconst c;
taut (A imp (P(c) imp A));
show premises 1;

reset;
declare indvar x y;
declare indvar z;
tauteq x=x;
tauteq x=y imp y=x;
show premises 2;

reset;
declare predconst P 1;
declare indvar x y;
monad forall x. exists y. (P(x) imp P(y));
monad exists y. forall x. (P(x) imp P(y));
andi 1 2;
show premises 3 all;

COMMENT | SEMANTIC SIMPLIFICATION |
reset;
declare indconst a b c;
declare funconst F 1;
decrep REP;
attach a dar [REP] a;
attach b dar [REP] b;
attach c dar [REP] c;
DEFLAM F(x) (IF (EQ x (QUOTE a)) (QUOTE b)
		(IF (EQ x (QUOTE b)) (QUOTE c)
		    (QUOTE UNDEF&)));
attach F to [REP=REP]F;
simplify F(a);
show premises 1;

COMMENT | SYNTACTIC SIMPLIFICATION |
reset;
declare indconst a b;
declare predconst q r 1;
declare indvar x;
setbasicsimp s1 at wffs {q(a), forall x. (q(x) iff r(x))};
assertsimp s1;
show premises 2 all;

reset;
declare indconst A;
declare indvar X Y;
declare funconst F 2;
axiom F3: forall X Y. F(X,Y) = Y;
setbasicsimp S6 at facts {F3};
rewrite F(A,A) by S6;
show premises 1;

COMMENT | SYNTACTIC AND SEMANTIC SIMPLIFICATION |
reset;
declare indconst a b c;
decrep REP;
attach a dar [REP]a;
attach b dar [REP]b;
attach c dar [REP]c;
declare funconst G 2;
declare indvar x y;
setbasicsimp S at wffs {forall x y.G(x,y)=x};
declare predconst P 1;
DEFLAM P(x) (IF(EQ x (QUOTE a))
	       TRUE
               (IF (EQ x (QUOTE b))
		   FALSE
		   (QUOTE UNDEF&)));
attach P to [REP]P;
eval P(G(a,G(b,c))) by S;
show premises 1;

reset;
declare indconst a b c;
attach b to b;
attach c to c;
declare funconst h 2;
DEFLAM h(x y) (QUOTE d);
attach h to h;
let a dar h(b c);
show premises 1;

COMMENT | METAREASONING |
reset;
namecontext META;
declare sort TERM WFF;
declare predconst THEOREM 1;
declare funconst mkequal (indvar, indvar) = wff;
declare indvar x [TERM];
axiom m1: forall x. THEOREM(mkequal(x,x));
decrep TERM;
decrep WFF;
represent {TERM} as TERM;
represent {WFF} as WFF;
attach mkequal to [TERM,TERM = WFF] mkequ;
makecontext obj;
switchcontext obj;
declare indconst c;
declare indvar x;
declare funconst f 2;
reflect m1 c;
reflect m1 f(x,f(c,c));
show premises 2;
