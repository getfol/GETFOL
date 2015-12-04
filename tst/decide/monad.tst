RESET;
NAMECONTEXT MONAD;

declare indvar x z y;
declare indconst a b c;
declare funconst g h 2;
declare funconst f 3;
declare predconst P R Q 1;
declare predconst S T V 2;

COMMENT | GENERAL THEOREMS |
monad forall y. exists x. (P(y) or not P(x));
monad forall y. P(y) imp exists x. P(x);

COMMENT | ABOUT WFF-PUSH-NEGATION |
monad forall x. exists y.
 wffif P(trmif P(y) then x else y)
  then P(trmif P(y) then trmif P(y) then x else trmif P(y) then x else y else y) or TRUE
   else P(y) or TRUE;

monad forall x. exists y. wffif P(x) then P(y) else not P(y);


COMMENT | ABOUT PUSHV |

monad forall y. exists x. (P(f(a,b,x)) or not P(f(a,b,y)));
monad exists z. forall y. exists x. (P(f(z,b,x)) or not P(f(x,b,z)));
monad exists z. forall y. exists x. (P(f(z,b,x)) or not P(f(x,b,y)));

COMMENT | monad exists z. forall y. exists x. (P(f(z,b,x)) and not P(f(x,b,y))); |
COMMENT | This wff is not reducible to a (forall-exists) prenex form |





