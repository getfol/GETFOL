COMMENT | *************************************************************	 |
COMMENT | * AUTHOR: Paolo Pecchiari      			         |
COMMENT | *								 |
COMMENT | * SUBJECT: SIMPLIFY TEST USING EXTENSION INFORMATION OF A SORT |
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

declare predconst p 1;
DEFLAM p(x) (IF (EQ x (QUOTE a)) TRUE FALSE);
attach p to p;

declare indvar sort x [s];
simplify exists x.p(x);
simplify forall x.p(x);

declare predconst q 1;
DEFLAM q(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b)(QUOTE c) (QUOTE d)(QUOTE e))) TRUE 
 FALSE);
attach q to q;

simplify exists x.q(x);
simplify forall x.q(x);

								
declare predconst r 1;
DEFLAM r(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b))) TRUE
 (IF (MEMBER x (LIST (QUOTE c) (QUOTE d)(QUOTE e))) FALSE 
  %VALUE\-UNDEF%));
attach r to r;

simplify exists x.r(x);
simplify forall x.r(x);

declare predconst t 1;
DEFLAM t(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b))) %VALUE\-UNDEF%
 (IF (MEMBER x (LIST (QUOTE c) (QUOTE d)(QUOTE e))) FALSE 
  %VALUE\-UNDEF%));
attach t to t;

simplify exists x.t(x);
simplify forall x.t(x);

declare predconst u 1;
DEFLAM u(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b))) FALSE
  %VALUE\-UNDEF%);
attach u to u;

simplify exists x.u(x);
simplify forall x.u(x);

declare predconst l 1;
DEFLAM l(x) 
(IF (MEMBER x (LIST (QUOTE a)(QUOTE b)(QUOTE c) (QUOTE d)(QUOTE e))) FALSE
 FALSE);
attach l to l;
simplify exists x.l(x);
simplify forall x.l(x);
