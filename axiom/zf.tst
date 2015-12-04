COMMENT | *************************************************************	|
COMMENT | * AUTHOR: R.W. Weyhrauch      	DATE: around 1978       |
COMMENT | *								|
COMMENT | * SUBJECT:  axioms for Zermelo-Fraenkel Set theory            |
COMMENT | *								|
COMMENT | * NOTES: published nowhere (as far as F.Giunchiglia knows)    |
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1989				|
COMMENT | *								|
COMMENT | *************************************************************	|

 COMMENT |x bei y  is 'x is an element of y' |
 DECLARE PREDCONST  bei 2[INF] ;	  
 COMMENT |set1(x) 'is the set of the x's' |
 DECLARE FUNCONST   set1 1;
 COMMENT |x sst y is 'x is a subset of y ' |
 DECLARE PREDCONST  sst 2[INF] ;
 DECLARE FUNCONST    U   2[INF];
 DECLARE INDVAR     r s t u v w x y z ;
 DECLARE PREDPAR    A 2;             
 DECLARE PREDPAR    B 1;
 DECLARE indconst emptyset;


COMMENT|Extensionality|
AXIOM EXT:  forall x  y.(forall z.(z bei x iff z bei y)iff x=y);
COMMENT|NULL SET | 
AXIOM EMT:  exists x. forall y. not y bei x;
COMMENT|UNORDERED PAIR|
AXIOM PAIR: forall x y. exists z. forall w.(w bei z iff w=x or w=y);
COMMENT|SUM SET |
AXIOM UNION: forall x. exists y.forall z.
                 (z bei y iff exists t.(z bei t and t bei x)) ;
COMMENT|INFINITY|
AXIOM INF:   exists x.(emptyset bei x and
                       forall y.(y bei x imp (y U set1(y)) bei x)) ;
COMMENT |REPLACEMENT|
AXIOM REPL:  forall x.exists y.forall z.(A(x,z)iff y=z) 
              imp forall u. exists v.(forall r.
                  (r bei v iff exists s.(s bei u and A(s,r))));
COMMENT |SEPARATION|
AXIOM SEP:    forall x.exists y.forall z.(z bei y iff z bei x and B(z));
COMMENT |POWER SET |
AXIOM POWER:  forall x. exists y.forall z.(z bei y iff z sst x);
 
COMMENT |REGULARITY |
AXIOM REG:    forall x. exists y.(x=emptyset or (y bei x
                       and forall z.(z bei x imp not z bei y)));


DECLARE PREDCONST FUN 1 ;
DECLARE PREDCONST INTO 2;
DECLARE PREDCONST PSUBSET 2 ;
DECLARE FUNCONST rng dom 1;
DECLARE FUNCONST set2 2 ;
DECLARE FUNCONST par 2;


AXIOM SUBSET:   forall x y.(x sst y iff forall z.(z bei x imp z bei y));
AXIOM PROPSUBSET : forall x y.(PSUBSET(x,y) iff x sst y and not x=y);
AXIOM PAIRFUN:  forall x y z.(z bei set2(x,y) iff z=x or z=y);
AXIOM UNITSETFUN: forall x.(set1(x)=set2(x,x)) ;
AXIOM OPAIRFUN: forall x y.(par(x,y)=set2(set1(x),set2(x,y))) ;

AXIOM FUNCTION:  forall w.(FUN(w) iff
               forall z.(z bei w imp exists x y.(z=par(x,y))) 
           and forall x y z.(par(x,y)bei w and par(x,z)bei w imp y=z)); 
AXIOM DOMAIN:  forall w x.(x bei dom(w) iff FUN(w)
                       and exists y z.(y bei w and y =par(x,z)));
AXIOM RANGE :  forall w x.(x bei rng(w)iff FUN(w)
                      and exists y z.(y bei w and   y=par(z,x)));
AXIOM INTO :forall w x.(INTO (w,x)iff rng(w) sst x);

COMMENT | This axom used to also be called UNION |
AXIOM UNION2 :forall x y z.(z bei x U y iff z bei x or z bei y);
