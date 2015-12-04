COMMENT | *************************************************************	|
COMMENT | * AUTHOR: ?                    			        |
COMMENT | *								|
COMMENT | * SUBJECT: SIMPLIFY TEST                                      |
COMMENT | *								|
COMMENT | * GETFOL VERSION: September 199)				|
COMMENT | *								|
COMMENT | *************************************************************	|

DECLARE FUNCONST + *(NATNUM NATNUM)=NATNUM [INF];

declare indconst o oo ooo [NATNUM];
declare indconst u uu;
declare predconst ugu 2;
DECREP natnum nat;

attach o dar [natnum] 5;
attach oo dar [natnum] 10;
attach u dar [natnum] 1;
attach uu dar [nat] 1;
attach + to [natnum,natnum=natnum] PLUS;
attach = to [natnum,natnum] EQ;
attach ugu to [natnum,natnum] EQ;
attach * to [nat,natnum=nat] TIMES; 
attach * to [natnum,nat=natnum] TIMES;

simplify u*uu;
simplify uu*u;
simplify ugu(uu*u,u*uu);
simplify trmif ugu(o,o) then oo else o;
simplify trmif ugu(o,oo) then oo else o;
simplify trmif ugu(o,ooo) then oo else o+o;
simplify uu*u = u*uu;
simplify trmif o = o then oo else o;
simplify trmif o=oo then oo else o;
simplify trmif o=ooo then oo else o+o;
simplify trmif ugu(o,o) then trmif ugu(o,oo) then oo else o else o;
simplify trmif ugu(o,o) then trmif ugu(o,ooo) then oo else o else o;
simplify ugu(o,o) iff ugu(o,o);
simplify ugu(o,o) and ugu(o,o);
simplify ugu(o,o) or ugu(o,o);
simplify ugu(o,o) imp ugu(o,o);
simplify not ugu(o,o);
simplify not (ugu(o,o) and (ugu(u,uu*u) or ugu(o*u,o)));
