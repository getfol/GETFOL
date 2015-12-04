COMMENT | |
COMMENT | This is an example of the fact that TAUT sometimes handles |
COMMENT | dependencies unsatisfactorily. Infact in this case the fact |
COMMENT | produced by TAUT has the dependecnies (1 2) instead of no |
COMMENT | dependencies (as it should be using the standard ND rules |
COMMENT | |
RESET;
NAMECONTEXT INITIAL;
MAKECONTEXT TAUT1;
SWITCHCONTEXT TAUT1;
DECLARE INDVAR X;
DECLARE FUNCONST F G 1;
DECLARE PREDCONST P Q 1;
ASSUME P(F(X)) imp Q(G(X));
ASSUME P(F(X));
TAUT Q(G(X)) BY 1,2;

COMMENT | This is Armando's Example. I think that it doesn't show the |
COMMENT | described situation. Better description examples seem to me |
COMMENT | the following. As we can see no discharge is performed.     |
COMMENT | Alessandro Cimatti, 15.1.90.                                |


MAKECONTEXT TAUT11;
SWITCHCONTEXT TAUT11;
DECLARE INDVAR X;
DECLARE FUNCONST F G 1;
DECLARE PREDCONST P Q 1;
ASSUME P(F(X));
ASSUME Q(G(X));
TAUT P(F(X)) imp Q(G(X)) BY 1,2;
TAUT P(F(X)) BY 1,2;


COMMENT | This is the second set of tests. |

MAKECONTEXT TAUT2;
SWITCHCONTEXT TAUT2;

DECLARE SENTCONST A B C;
DECLARE PREDCONST P1 Q1 R1 1;
DECLARE PREDCONST P2 Q2 R2 2;
DECLARE INDVAR x y z w;
DECLARE INDCONST a b c;
DECLARE FUNCONST f g h 1;

TAUT A imp A;
TAUT A or not A;
TAUT wffif A then TRUE else TRUE;
TAUT wffif (wffif A then TRUE else TRUE) then TRUE else A;


COMMENT | first propositional axiom |
TAUT A imp ( B imp A );

COMMENT | second propositional axiom |
TAUT ( A imp ( B imp C ) ) imp ( ( A imp B ) imp ( A imp C ) ); 

COMMENT | third propositional axiom |
TAUT ( (not B) imp (not A) ) imp ( ( (not B) imp A ) imp B );

COMMENT | yet another instance of third propositional axiom |
COMMENT | to test the renaming routine                      |
TAUT ( (not (forall x.(P1(x) and Q2(x,a)))) imp (not R1(f(z))) ) imp
     ( (not (forall y.(P1(y) and Q2(y,a))) imp R1(f(z)) ) imp
       (forall z.(P1(z) and Q2(z,a))) );

COMMENT | substituting the argument of the second occurrence |
COMMENT | of R1() with f(x) we have no more a tautology      |
COMMENT | TAUT ( (not (forall x.(P1(x) and Q2(x,a)))) imp (not R1(f(z))) ) imp |
COMMENT |      ( (not (forall y.(P1(y) and Q2(y,a))) imp R1(f(x)) ) imp |
COMMENT |        (forall z.(P1(z) and Q2(z,a))) ); |

COMMENT | a wff that need a complex renaming |
TAUT forall x.(P1(x) and exists y.(Q2(x,y) imp Q2(a,b))) imp
     forall x.(P1(x) and exists z.(Q2(x,z) imp Q2(a,b)));

COMMENT | a wff that need a complex renaming : NOT a TAUTOLOGY !!! |
COMMENT | TAUT forall x.(P1(x) and exists x.(Q2(x,x) imp Q2(a,b))) imp |
COMMENT |      forall x.(P1(x) and exists z.(Q2(x,z) imp Q2(a,b))); |

TAUT (wffif A then B else C) iff ((A and B) or (not A and C));

ASSUME A B C;

AXIOM AX1 : P1(a);
AXIOM AX2 : P1(b);

taut A and B and ( P1(a) or P1(b) ) by 1:^1 AX1 AX2;

taut P1(a) or P1(b) by ^1;







