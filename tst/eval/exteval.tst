COMMENT | *************************************************************	 |
COMMENT | * AUTHOR: Paolo Pecchiari      			         |
COMMENT | *								 |
COMMENT | * SUBJECT: EVAL TEST USING EXTENSION INFORMATION OF A SORT     |
COMMENT | *								 |
COMMENT | * GETFOL VERSION: May 1991	        			 |
COMMENT | *								 |
COMMENT | *************************************************************	 |

declare sort s;
declare indconst a b c d e;
attach a to a;
attach b to b;
attach c to c;
attach d to d;
attach e to e;

extension s by {a b c d e};

declare indvar sort x [s];

declare predconst p 1;
DEFLAM p(x) (IF (EQ x (QUOTE a)) TRUE FALSE);
attach p to p;

eval exists x.p(x);
eval forall x.p(x);

declare predconst q 1;
DEFLAM q(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b)(QUOTE c) (QUOTE d)(QUOTE e))) TRUE 
 FALSE);
attach q to q;

eval exists x.q(x);
eval forall x.q(x);

								
declare predconst r 1;
DEFLAM r(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b))) TRUE
 (IF (MEMBER x (LIST (QUOTE c) (QUOTE d)(QUOTE e))) FALSE 
  %VALUE\-UNDEF%));
attach r to r;

eval exists x.r(x);
eval forall x.r(x);

declare predconst t 1;
DEFLAM t(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b))) %VALUE\-UNDEF%
 (IF (MEMBER x (LIST (QUOTE c) (QUOTE d)(QUOTE e))) FALSE 
  %VALUE\-UNDEF%));
attach t to t;

eval exists x.t(x);
eval forall x.t(x);

declare predconst u 1;
DEFLAM u(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b))) FALSE
  %VALUE\-UNDEF%);
attach u to u;

eval exists x.u(x);
eval forall x.u(x);

declare predconst l 1;
DEFLAM l(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b)(QUOTE c) (QUOTE d)(QUOTE e))) FALSE
 FALSE);
attach l to l;
eval exists x.l(x);
eval forall x.l(x);
