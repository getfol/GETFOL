COMMENT | *************************************************************	|
COMMENT | * AUTHOR: R.W. Weyhrauch      	DATE: around 1978       |
COMMENT | *								|
COMMENT | * SUBJECT: S- expressions                                     |
COMMENT | *								|
COMMENT | * NOTES: See Prolegomena paper in AI Journal 1980 (appendix B)|
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1989				|
COMMENT | *								|
COMMENT | *************************************************************	|

DECLARE SORT ATOM;
DECLARE INDVAR x y z [SEXP];
DECLARE INDVAR u v w [LIST];
DECLARE INDCONST nil [NULL];

DECLARE FUNCONST car cdr 1;
DECLARE FUNCONST cons(SEXP,LIST)=LIST;
DECLARE FUNCONST rev 1;
DECLARE FUNCONST @ 2 [INF];

MOREGENERAL SEXP <LIST,ATOM,NULL>;
MOREGENERAL LIST <NULL>;

DECREP SEXPREP;

AXIOM CAR:forall x y . car(cons(x,y)) = x;
AXIOM CDR:forall x y . cdr(cons(x,y)) = y;
AXIOM CONS:forall x y . (NULL(cons(x,y)) iff FALSE);
AXIOM REV: forall u . (rev(u) = 
		      if NULL(u) then u else rev(cdr(u)) @ cons(car(u),nil));
AXIOM APPEND: forall u v . (u @ v = 
			   if NULL(u) then v else cons(car(u),cdr(u) @ v));

AXIOM NU: NULL(nil);

SETBASICSIMP Basic at facts {CAR,CDR,CONS, NU};
SETBASICSIMP Funs at facts {REV,APPEND};

SETCOMPSIMP ALL at Basic uni Funs uni LARGIFTREE;

rewrite rev(cons(x,nil)) BY ALL;






