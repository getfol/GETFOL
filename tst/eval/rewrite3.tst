COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Paolo Pecchiari      			        |
COMMENT | *								|
COMMENT | * SUBJECT: REWRITE WITH AXIOM'S SCHEMES                       |
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1990				|
COMMENT | *								|
COMMENT | *************************************************************	|

declare indvar x1 x2 x3;
declare indconst a1 a2 a3;
declare funconst f1 1;
declare funconst f2 2;
declare funconst f3 3;
declare funpar F1 1;
declare funpar F2 2;
declare funpar F3 3;
declare predconst p1 1;
declare predconst p2 2;
declare predconst p3 3;
declare predpar P1 1;
declare predpar P2 2;
declare predpar P3 3;

setbasicsimp simp1 at wffs 
{forall x1.F1(x1)=x1,
 forall x1 x2.F2(x1 x2)=x1,
 forall x1 x2 x3.F3(x1 x2 x3)=x1};

show simpset simp1;

rewrite f3(f2(f1(a1) a2) a2 a3) by simp1;

setbasicsimp simp2 at wffs 
{forall x1.P1(x1),forall x1 x2.P2(x1 x2),forall x1 x2 x3.P3(x1 x2 x3)};
show simpset simp2;

rewrite p1(a1) by simp2;
rewrite p2(a1 a2) by simp2;
rewrite p3(a1 a2 a3) by simp2;

setbasicsimp simp3 at wffs 
{forall x1.F1(F2(x1,x2))=F2(F1(x1),x2),
 P2(a1,a2) iff P2(a2,a1),
 P3(F1(a1),a2,a3) iff P3(a1,F1(a2),a3)};

rewrite f1(f2(a1,a2)) by simp3;
rewrite p2(a1,a2) by simp3;
rewrite p3(f1(a1),a2,a3) by simp3;
