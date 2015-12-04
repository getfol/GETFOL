RESET;
NAMECONTEXT MONADEQ;

DECLARE PREDCONST P Q R 1;
DECLARE INDVAR x y z w;
DECLARE INDCONST a b c;

monadeq exists x. x=a;

monadeq forall y. exists x. x=y;

monadeq forall y. forall x. (x=y imp (P(y) or not P(x)));
