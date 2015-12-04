RESET;

ECHO |Pelletier's problem n. 34|
ECHO |Andrew's Challenge - 10 points |
ECHO |Be patient, please ... |

declare predconst P Q 1;
declare indvar x y;

decide (exists x.forall y.(P(x) iff P(y)) iff (exists x.Q(x) iff forall y.Q(y))) iff (exists x.forall y.(Q(x) iff Q(y)) iff (exists x.P(x) iff forall y.P(y)))
 using nnf,reduce,skolemize,phexp,ptaut;
