DECLARE INDVAR x y;
DECLARE INDPAR a;
DECLARE INDCONST alpha;
DECLARE PREDCONST P 1 [pre];
DECLARE PREDCONST R 2;
DECLARE FUNCONST f 1;
DECLARE FUNCONST f1 1 [pre = 500];
DECLARE FUNCONST g 2;
DECLARE FUNCONST g1 2 [inf = 400 405];
DECLARE FUNCONST g2 2 [inf = 605 600];

TERM g(f(x),y);
TERM a g1 f1 x g2 f1 y g1 alpha;

AWFF x = y;
AWFF P g(f(x),y);
AWFF R(g(f(x),y), a g1 f1 x g2 f1 y g1 alpha);

WFF P g(f(x),y) and x = y;
WFF exists x y . (P g(f(x),y) and x = y);

TERM trmif x = y then f(x) else f(y);

AWFF P trmif x = y then f(x) else f(y);

WFF forall x y. wffif P trmif x = y then f(x) else f(y)
                then R(x,y)
                else R(y,x);

