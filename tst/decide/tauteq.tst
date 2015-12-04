RESET;
NAMECONTEXT INITIAL;
MAKECONTEXT TAUTEQ;
SWITCHCONTEXT TAUTEQ;

DECLARE SENTCONST A B C;
DECLARE PREDCONST P1 Q1 R1 1;
DECLARE PREDCONST P2 Q2 R2 2;
DECLARE INDVAR x y z w;
DECLARE INDCONST a b c;
DECLARE FUNCONST f g h 1;

ASSUME x=a a=f(a) g(b)=y y=z z=w f(y)=g(f(x)) g(f(x))=g(c);

TAUTEQ (P1(x) iff P1(f(a))) and (P2(a,y) iff P2(f(a),w)) and
       (P2(f(y),g(c)) iff P2(g(c),g(f(x)))) and
       g(b)=z and f(a)=a and f(y)=g(c) by ^7:^1;

TAUTEQ (P1(x) imp P1(f(a))) and (P2(a,y) imp P2(f(a),w)) and
       (P2(f(y),g(c)) imp P2(g(c),g(f(x)))) and
       g(b)=z and f(a)=a and f(y)=g(c) by ^8:^2;

TAUTEQ ( x=a and a=f(a) and g(b)=y and y=z and z=w and f(y)=g(f(x)) and g(f(x))=g(c)) imp
       ( (P1(x) iff P1(f(a))) and (P2(a,y) iff P2(f(a),w)) and
         (P2(f(y),g(c)) iff P2(g(c),g(f(x)))) and g(b)=z and f(a)=a and f(y)=g(c) );

TAUTEQ ( x=a and a=f(a) and g(b)=y and y=z and z=w and f(y)=g(f(x)) and g(f(x))=g(c)) imp
       ( (P1(x) iff P1(f(a))) and (P2(a,y) iff P2(f(a),w)) and
         (P2(f(y),g(c)) iff P2(g(c),g(f(x)))) and g(b)=z and f(a)=a and f(y)=g(c) );

TAUTEQ ( x=y and z=w and y=a and a=f(b) and w=f(z) ) imp
       (f(z)=z and f(b)=y and a=y);

TAUTEQ f(g(x)) = f(g(x));

TAUTEQ x=y imp y=x;

TAUTEQ (x=y and y=z) imp z=x;

TAUTEQ ( x=y and z=w and y=a and a=f(b) and w=f(z) ) imp
       ( P2(x,w) iff P2(f(b),f(z)) );

COMMENT |TAUTEQ ( x=y and z=w and y=a and a=f(b) and w=f(z) ) imp |
COMMENT |       (( P2(x,w) iff P2(f(b),f(z)) ) and (P1(y) iff P1(x)) and |
COMMENT |          (P1(x) iff P1(z))); |

TAUTEQ ( x=y and z=w and y=a and a=f(b) and w=f(z) ) imp
       (( P2(x,w) iff P2(f(b),f(z)) ) and (P1(y) iff P1(x)));

TAUTEQ x=y imp (P1(x) iff P1(y));

COMMENT | This last test has been added to fix the bug detected by Peck|
COMMENT | Bug fixed by Armando in function equiv_list-del (26-9-89)    |

MAKECONTEXT PECK\-BUG;
SWITCHCONTEXT PECK\-BUG;
declare predconst All 1;
declare funconst colorof 2;
declare indconst c g s1 s red green;

assume All(g) and colorof(g,s1)=red;
assume colorof(g,s)=c;
assume colorof(g,s1)=c;
axiom EXTCOLOR2: not red=green;
tauteq not colorof(g,s)=green by ^3:^1 EXTCOLOR2;


MAKECONTEXT PB\-EXTENSION;
SWITCHCONTEXT PB\-EXTENSION;

declare indconst a b;
declare predconst A B 1;

tauteq  (A(a) and (A(a) imp a=b)) imp A(b);
tauteq  (A(a) and (not A(a) or a=b)) imp A(b);
tauteq  ((A(a) and not A(a)) or (A(a) and a=b)) imp A(b);
tauteq  (FALSE or (A(a) and a=b)) imp A(b);
tauteq  (TRUE and (A(a) and a=b)) imp A(b);
tauteq  (A(a) and a=b) imp A(b);
tauteq  A(a) imp (a=b imp A(b));
tauteq  A(a) imp ((a=b and TRUE) imp (A(b) or FALSE));
