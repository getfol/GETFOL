COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Lorenzo Galvagni            DATE: january 1992      |
COMMENT | *						                |
COMMENT | * SUBJECT: COPYLEX TEST       	                        |
COMMENT | *	        	        	        		|
COMMENT | * NOTES:                                                      |
COMMENT | *								|
COMMENT | *		                				|
COMMENT | * TECHNICAL NOTES:    	                		|
COMMENT | *				                        	|
COMMENT | * GETFOL VERSION: january 1992                                |
COMMENT | *								|
COMMENT | *************************************************************	|

reset;

declare sort S1 S2 S3;
moregeneral S1 <S2>;

declare indconst a d [S1];
declare indconst b [S2];
declare indconst c [S3];
declare indvar x y z[S1];

extension S1 by {a b};

declare sentconst A B C;
declare indpar p1 p2 p3;

declare funconst f 2;
setfmap f (S1,S2)=S3;
setfmap f (S2,S3)=S1;
setfmap f (S2,S3)=S3;

declare predconst p 2;

mostgeneral S3;

namecontext C1;
makecontext C2;
switchcontext C2;

copylex C1;

assume A B;
andi 1 2;

attach a dar a;
attach b dar b;
attach c dar c;

attach f to f;
deflam f(x y) (IF (AND (EQ x (QUOTE a)) (EQ y (QUOTE b)))
		  (QUOTE c) (QUOTE b));

eval c = f(a,b);
eval f(c,b);
eval exists x y. f(x,y) = b;

wff A;
wff p(b,c);
