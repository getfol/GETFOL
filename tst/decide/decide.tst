COMMENT | |
COMMENT | These are tests about "decide" command |
COMMENT | The same tests listed in ptaut.tst, taut.tst |
COMMENT | tauteq.tst, monad.tst, monadeq.tst           |
COMMENT | coverted to "decide" command syntax.         |
COMMENT | decide <wff> by  {<fact>} using OPT[ {<rewriter>}<decider>  |
COMMENT | <rewriter> :: nnf,skolemize,phexp,tautren,reduce       |
COMMENT |      <decider>      ::      ptaut      ,       ptauteq.|
COMMENT | Examples of a more "interactive" use of decide follows. |
COMMENT | |

reset;

ECHO | TESTS about using ptaut decider |

DECLARE SENTCONST A B C;
DECLARE SENTCONST P Q; 

ECHO | first propositional axiom |
decide A imp ( B imp A ) using ptaut;

ECHO | second propositional axiom |
decide ( A imp ( B imp C ) ) imp ( ( A imp B ) imp ( A imp C ) ) using ptaut;

ECHO | third propositional axiom |
decide ( (not B) imp (not A) ) imp ( ( (not B) imp A ) imp B ) using ptaut;

decide (wffif A then B else C) iff ((A and B) or (not A and C)) using ptaut;

reset;

DECLARE SENTCONST A B C;
DECLARE PREDCONST P1 Q1 R1 1;
DECLARE PREDCONST P2 Q2 R2 2;
DECLARE INDVAR x y z w;
DECLARE INDCONST a b c;
DECLARE FUNCONST f g h 1;

ECHO | TESTS about using tautren and ptaut   |

ECHO | a wff that need a complex renaming |

decide forall x.(P1(x) and exists y.(Q2(x,y) imp Q2(a,b))) imp
     forall x.(P1(x) and exists z.(Q2(x,z) imp Q2(a,b))) using tautren,ptaut;

decide ( (not (forall x.(P1(x) and Q2(x,a)))) imp (not R1(f(z))) ) imp
     ( (not (forall y.(P1(y) and Q2(y,a))) imp R1(f(z)) ) imp
       (forall z.(P1(z) and Q2(z,a))) ) using tautren,ptaut;

ECHO | TESTS about using tautren and ptauteq |

assume x=a a=f(a) g(b)=y y=z z=w f(y)=g(f(x)) g(f(x))=g(c);

decide (P1(x) iff P1(f(a))) and (P2(a,y) iff P2(f(a),w)) and
       (P2(f(y),g(c)) iff P2(g(c),g(f(x)))) and
       g(b)=z and f(a)=a and f(y)=g(c) by ^7:^1 using tautren,ptauteq;


decide ( x=y and z=w and y=a and a=f(b) and w=f(z) ) imp
       (f(z)=z and f(b)=y and a=y) using tautren,ptauteq;


decide f(g(x)) = f(g(x)) using ptaut;

decide f(g(x)) = f(g(x)) using ptauteq;

decide f(g(x)) = f(g(x)) using tautren,ptauteq;

ECHO | TESTING nnf+reduce+skolemize+phexp+ptaut |

reset;

declare indvar x z y;
declare indconst a b c;
declare funconst g h 2;
declare funconst f 3;
declare predconst P R Q 1;
declare predconst S T V 2;

decide forall x. exists y.
 wffif P(trmif P(y) then x else y)
  then P(trmif P(y) then trmif P(y) then x else trmif P(y) then x else y else y) or TRUE
   else P(y) or TRUE using nnf,reduce,skolemize,phexp,ptaut;

decide  forall x. exists y.  wffif  P(x) then P(y) else not P(y) using
nnf,reduce,skolemize,phexp,ptaut;


ECHO | TESTING nnf+reduce+skolemize+phexp+ptauteq |

reset;

DECLARE PREDCONST P Q R 1;
DECLARE INDVAR x y z w;
DECLARE INDCONST a b c;

decide forall y. forall x. (x=y imp (P(y) or not P(x))) using nnf,reduce,skolemize,phexp,ptauteq;
