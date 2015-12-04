COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Paolo Traverso (leaf)      			        |
COMMENT | *								|
COMMENT | * SUBJECT: THEOREM TEST                                       |
COMMENT | *								|
COMMENT | * GETFOL VERSION: December 1990				|
COMMENT | *								|
COMMENT | *************************************************************	|

declare sentconst A;
assume A;
impi 1 1;
theorem th1 2;
show axiom;
axiom ax1 : A or not A;
theorem ExcludedMiddle ax1;
show axiom;
declare predpar P 1;
declare predconst p 1;
declare indvar x;
axiom PI: P(x);
andi PI P:lambda x.p(x) PI P:lambda x.p(x);
theorem thPI PI;
andi thPI P:lambda x.p(x) thPI P:lambda x.p(x);
