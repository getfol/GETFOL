
COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Alessandro Cimatti		DATE: around 1990	|
COMMENT | *								|
COMMENT | * SUBJECT: testing sorts in GETFOL				|
COMMENT | *								|
COMMENT | *************************************************************	|

COMMENT ! To check SUPERSORT we have to : !
COMMENT !         - run getfol            !
COMMENT !         - fetch supersort.tst   !
COMMENT !         - go back to HGKM       !
COMMENT !         - load supersort.hgk    !


declare sort a b c d e f g h;
moregeneral a < b c d e f g h >;
moregeneral b < c d e f g h >;
moregeneral c < d e f g h >;
moregeneral d < e f g h >;
moregeneral e < f g h >;
moregeneral f < g h >;
moregeneral g < h >;

declare indconst a1 a2 a3 [a];
declare indconst b1 b2 b3 [b];
declare indconst c1 c2 c3 [c];
declare indconst d1 d2 d3 [d];
declare indconst e1 e2 e3 [e];
declare indconst f1 f2 f3 [f];
declare indconst g1 g2 g3 [g];
declare indconst h1 h2 h3 [h];

declare funconst F ( a)=a;
setfmap F (b)=b;
setfmap F (c)=c;
setfmap F (d)=d;
setfmap F (e)=e;
setfmap F (f)=f;
setfmap F (g)=g;
setfmap F (h)=h;

declare funconst G (a a)=a;
setfmap G (a b)=b;
setfmap G (b a)=a;
setfmap G (b b)=b;
setfmap G (c a)=a;
setfmap G (a c)=c;
setfmap G (c c)=c;
setfmap G (b c)=c;
setfmap G (c b)=b;
setfmap G (UNIVERSAL d)=d;
setfmap G (UNIVERSAL e)=e;
setfmap G (UNIVERSAL f)=f;
setfmap G (UNIVERSAL g)=g;
setfmap G (UNIVERSAL h)=h;


Axiom Uno: F(F(c1))=F(c2);

Axiom Due: F(F(c1))=G(F(F(c3)),G(F(a1),F(a2)));


