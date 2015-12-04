COMMENT | ********************************************************************|
COMMENT | * AUTHOR:	 Richard Weyhrauch       DATE:	around 1984           |
COMMENT | *							 	      |
COMMENT | * SUBJECT: this file basicly refers to the examples of the	      |
COMMENT | * FOL manual							      |
COMMENT | *								      |
COMMENT | * GETFOL VERSION: December 1990				      |
COMMENT | *								      |
COMMENT | ********************************************************************|


declare indconst A,B;
declare indvar X,Y;
declare funconst F 2;
declare funconst G 1;
declare sentconst P;
assume forall X . F(X,A) = A;
assume forall X . F(X,X) = G(X);
assume forall X Y . F(X,Y) =Y;
axiom F1:forall X . F(X,A) = A;
axiom F2:forall X . F(X,X) = G(X);
axiom F3:forall X Y. F(X,Y) = Y;
setbasicsimp S1 at facts {1};
setbasicsimp S2 at facts {2};
setbasicsimp S3 at facts {3};
setbasicsimp S4 at facts {F1};
setbasicsimp S5 at facts {F2};
setbasicsimp S6 at facts {F3};
setbasicsimp SIMPEQ at wffs {forall X.(X=X iff TRUE)};

setcompsimp S7 at S1 uni S2 uni S3;

rewrite F(A,A) by S6;
rewrite F(A,A) by S5;
rewrite F(A,A) by S4;
rewrite F(A,A) by S1;
rewrite F(A,A) by S2;
rewrite F(A,A) by S3;
rewrite F(A,A) by S7;
rewrite F(B,B) by S1 uni S3;
rewrite F(B,B) by S1;
rewrite not TRUE by S1;
rewrite not TRUE;
rewrite TRUE imp (P imp X=X);
rewrite TRUE imp (P imp X=X) by SIMPEQ uni LOGICTREE;
rewrite F(A,A) by S7;
rewrite F(A,A)=A by S7;
rewrite F(A,A)=A by S7 uni SIMPEQ;
rewrite F(A,A)=G(A) by S7;
rewrite F(B,B) by S7;
rewrite F(B,B)=G(B) by S7 uni SIMPEQ;
rewrite F(B,B)=G(B) and F(A,A)=A by S7 uni SIMPEQ uni LOGICTREE;
rewrite F(A,A) by S7 dif S1 ;
rewrite F(A,A) by S7 dif (S1 uni S2);
rewrite F(A,A)=A by (S3 dif (S1 uni S2));
rewrite F(A,A)=A by S3 dif (S1 uni S2) uni SIMPEQ;
