COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Paolo Pecchiari      			        |
COMMENT | *								|
COMMENT | * SUBJECT: GRIWORLD REVISITED USING EXTENSION INFORMATION     |
COMMENT | *								|
COMMENT | * GETFOL VERSION: May 1991            			|
COMMENT | *								|
COMMENT | *************************************************************	|

DECLARE SORT GRID;
DECREP GRIDREP;
DECLARE SORT COLOR;
DECREP COLORREP;

DECLARE FUNCONST mkgrid(COLOR,COLOR,COLOR,COLOR)=GRID;
DEFLAM mkgrid(col1 col2 col3 col4)(LIST col1 col2 col3 col4);
ATTACH mkgrid to [COLORREP COLORREP COLORREP COLORREP=GRIDREP]  mkgrid;

DECLARE FUNCONST color11(GRID)=COLOR;
DEFLAM color11(grid)(FIRST GRID); 
ATTACH color11 to [GRIDREP=COLORREP]color11;

DECLARE FUNCONST color12(GRID)=COLOR;
DEFLAM color12(grid)(SECOND GRID); 
ATTACH color12 to [GRIDREP=COLORREP]color12;

DECLARE FUNCONST color21(GRID)=COLOR;
DEFLAM color21(grid)(THIRD GRID); 
ATTACH color21 to [GRIDREP=COLORREP]color21;

DECLARE FUNCONST color22(GRID)=COLOR;
DEFLAM color22(grid)(HGKM\-NTH 4 GRID); 
ATTACH color22 to [GRIDREP=COLORREP]color22;

DECLARE INDCONST red, green, yellow, blue [COLOR];

ATTACH red   DAR [COLORREP]red;
ATTACH green DAR [COLORREP]green;
ATTACH yellow DAR [COLORREP]yellow;
ATTACH blue   DAR [COLORREP]blue;

EXTENSION COLOR BY {red, green, yellow, blue};
DECLARE indvar col1,col2,col3,col4 [COLOR];

DECLARE PREDCONST alldiffcol 1;
DEFLAM alldiffcol(grid)
(IF (AND (NOT (EQ (FIRST grid)(SECOND grid)))
         (NOT (EQ (FIRST grid)(THIRD grid)))
         (NOT (EQ (FIRST grid)(HGKM\-NTH 4 grid)))
         (NOT (EQ (SECOND grid)(THIRD grid)))
         (NOT (EQ (SECOND grid)(HGKM\-NTH 4 grid)))
         (NOT (EQ (THIRD grid)(HGKM\-NTH 4 grid))))
 TRUE
 FALSE);

ATTACH alldiffcol to [GRIDREP] alldiffcol;

DECLARE PREDCONST allsuccdiffcol 1;
DEFLAM allsuccdiffcol(grid)
(IF (AND (NOT (EQ (FIRST grid)(SECOND grid)))
         (NOT (EQ (SECOND grid)(HGKM\-NTH 4 grid)))
         (NOT (EQ (HGKM\-NTH 4 grid)(THIRD grid)))
         (NOT (EQ (THIRD grid)(FIRST grid))))
 TRUE
 FALSE);

ATTACH allsuccdiffcol to [GRIDREP] allsuccdiffcol;


simplify forall col1 col2 col3 col4.
      (allsuccdiffcol(mkgrid(col1 col2 col3 col4)) imp
       alldiffcol(mkgrid(col1 col2 col3 col4)));
