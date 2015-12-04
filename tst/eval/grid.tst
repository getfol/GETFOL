COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Paolo Pecchiari      			        |
COMMENT | *								|
COMMENT | * SUBJECT: GRIWORLD 	                                        |
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1990				|
COMMENT | *								|
COMMENT | *************************************************************	|

DECLARE SORT GRID;
DECLARE SORT COLOR, SQUARE;
DECLARE PREDCONST alldiffcol 1;
DECLARE PREDCONST allsuccdiffcol 1;
DECLARE FUNCONST square11(GRID)=SQUARE;
DECLARE FUNCONST square12(GRID)=SQUARE;
DECLARE FUNCONST square21(GRID)=SQUARE;
DECLARE FUNCONST square22(GRID)=SQUARE;
DECLARE FUNCONST succ(SQUARE)=SQUARE;
DECLARE FUNCONST colof(SQUARE)=COLOR;
DECLARE INDCONST red, green, yellow, blue [COLOR];
DECLARE INDCONST mygrid [GRID];
DECLARE INDVAR grid[GRID];
AXIOM SQ_SUCC1:forall grid.succ(square11(grid))=square12(grid);
AXIOM SQ_SUCC2:forall grid.succ(square12(grid))=square22(grid);
AXIOM SQ_SUCC3:forall grid.succ(square22(grid))=square21(grid);
AXIOM SQ_SUCC4:forall grid.succ(square21(grid))=square11(grid);
AXIOM ALLDIFFCOL:
forall grid.(
alldiffcol(grid) iff (
not(colof(square11(grid))=colof(square12(grid))) and
not(colof(square11(grid))=colof(square21(grid))) and
not(colof(square11(grid))=colof(square22(grid))) and
not(colof(square12(grid))=colof(square21(grid))) and
not(colof(square12(grid))=colof(square22(grid))) and
not(colof(square21(grid))=colof(square22(grid))))); 
AXIOM ALLSUCCDIFF:
forall grid.(
allsuccdiffcol(grid) iff
(not(colof(square11(grid))=colof(succ(square11(grid)))) and
not(colof(square12(grid))=colof(succ(square12(grid)))) and
not(colof(square21(grid))=colof(succ(square21(grid)))) and
not(colof(square22(grid))=colof(succ(square22(grid))))) );

AXIOM COL_MYGRID1:colof(square11(mygrid))=red;
AXIOM COL_MYGRID2:colof(square12(mygrid))=blue;
AXIOM COL_MYGRID3:colof(square21(mygrid))=green;
AXIOM COL_MYGRID4:colof(square22(mygrid))=red;
DECREP COLORREP;
ATTACH red   DAR [COLORREP]red;
ATTACH green DAR [COLORREP]green;
ATTACH yellow DAR [COLORREP]yellow;
ATTACH blue   DAR [COLORREP]blue;
SETBASICSIMP mysimpset at FACTS 
{COL_MYGRID1,COL_MYGRID2,COL_MYGRID3,COL_MYGRID4,
ALLDIFFCOL,ALLSUCCDIFF,SQ_SUCC1,SQ_SUCC2,
SQ_SUCC3,SQ_SUCC4};
SETCOMPSIMP mysimpset1 at mysimpset uni LPROPTREE; 
eval allsuccdiffcol(mygrid) by mysimpset1;
eval alldiffcol(mygrid) by mysimpset1;
assume forall grid.(allsuccdiffcol(grid)imp alldiffcol(grid));
alle 3 mygrid;
impe 1 4;
falsei 2 5;
noti 6 3;
