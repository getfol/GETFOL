namecontext INITDEC;
makecontext DECL1;
switchcontext DECL1;

mostgeneral MG;

declare sentconst sc1 sc2 sc3;
declare sentpar sp1 sp2 sp3;

wff sc1 and sc2 or sc3 imp sp1 and not sp2 iff sp3;

declare indconst ic1;
declare indpar ip1;
declare indvar iv1;
declare indconst ic2 ic3 ic4 [sic];
declare indpar ip2 ip3 ip4 [sip];
declare indvar iv2 iv3 iv4 [siv];

declare funconst fc4 4;
declare funconst fc1 (s1)=s2;
declare funconst fc2 fc3 (s1 *)=s2;

declare funconst fp0 2 [ INF =34 234];
declare funconst fp2 2 [inf];

declare funpar fpar f 2;
declare funpar f1  (ss2 s3)= s4;

declare predpar p1 3;

declare sort a s d gf hg;
declare sort a bb cc;

wff p1(ic1 ip1 iv1) and a(ic2) and s(ic3) and d(ic4);

mostgeneral MG1;

setfmap f (s1 s2) =s3;

declare sort s11 s12 s13 s14;
moregeneral s1 < s11 s12 s13 s14 >;
moregeneral s11 < s12 s13 s14 >;
moregeneral s12 < s13 s14 >;
moregeneral s13 < s14 >;
moregeneral s14 < s1 >;
declare funconst equ1 1;
declare funconst equ2 2;
declare funconst equ3 3;

declare funconst qqq1 1 [pre];
declare funconst qqq3 2 [inf];

declare predconst Pequ1 1;
declare predconst Pequ2 2;
declare predconst Pequ3 3;

declare predconst Pqqq1 1 [pre];
declare predconst Pqqq3 2 [inf];

show typ sentconst;
show typ sentpar;

show typ indconst;
show typ indvar;
show typ indpar;

show typ funconst;
show typ funpar;

show typ predconst;
show typ predpar;

show sort;

makecontext DECL2;
switchcontext DECL2;


switchcontext DECL1;

show typ sentconst;
show typ sentpar;

show typ indconst;
show typ indvar;
show typ indpar;

show typ funconst;
show typ funpar;

show typ predconst;
show typ predpar;

show sort;


