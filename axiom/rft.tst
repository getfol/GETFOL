COMMENT | *************************************************************	|
COMMENT | * AUTHOR: F. Giunchiglia      	DATE:  1988             |
COMMENT | *								|
COMMENT | * SUBJECT: Reflecting x=x       				|
COMMENT | *								|
COMMENT | * NOTES: See joint paper with Alan Smaill (Proc. Meta 1988)   |
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1989				|
COMMENT | *								|
COMMENT | *************************************************************	|
COMMENT | This is a simple example for the test of the reflection  |
COMMENT | principle. It states that any element is equal to itself |

COMMENT | setting all the probes |
PROBE ALL;

NAMECONTEXT C1;
DECLARE INDVAR Y;

MAKECONTEXT META;
SWITCHCONTEXT META;

DECLARE SORT INDVAR WFF;
DECLARE PREDCONST THEOREM 1;
DECLARE FUNCONST mkequal(INDVAR,INDVAR)=WFF;
DECLARE INDVAR x [INDVAR];

DECREP WF;
DECREP INDV;
REPRESENT {WFF} AS WF;
REPRESENT {INDVAR} AS INDV;

AXIOM  M1: forall x.THEOREM(mkequal(x,x));
ATTACH mkequal TO [INDV,INDV=WF] mkequ;

SWITCHCONTEXT C1;
REFLECT M1 Y;
