COMMENT | *************************************************************	|
COMMENT | * AUTHOR: R.W. Weyhrauch      	DATE: around 1978       |
COMMENT | *								|
COMMENT | * SUBJECT: An example of SELF REFLECTION of META into itself  |
COMMENT | *								|
COMMENT | * NOTES: See Prolegomena paper in AI Journal 1980     	|
COMMENT |          Worked out by F. Giunchiglia in this version in      |
COMMENT |          Edinburgh - Oct 20, 1987                             |
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1989				|
COMMENT | *								|
COMMENT | *************************************************************	|

COMMENT ! Note that the REFLECT in this case works as an ANDI !

PROBE ALL;

NAMECONTEXT META;

DECLARE SORT WFF FACT;

DECLARE INDVAR fact1 fact2 [FACT];
DECLARE FUNCONST wffof(FACT)=WFF;
DECLARE FUNCONST mkand(WFF,WFF)=WFF;
DECLARE PREDCONST THEOREM 1;

DECREP WFF;
DECREP FACT;
REPRESENT {WFF} AS WFF;
REPRESENT {FACT} AS FACT;
DEFLAM wffof (FACT) (fact\-get\-wff FACT);

ATTACH wffof TO [FACT=WFF] wffof;
ATTACH mkand TO [WFF,WFF=WFF] mkand;

AXIOM ANDI: forall fact1 fact2 . THEOREM(mkand(wffof(fact1), wffof(fact2)));

REFLECT ANDI ANDI ANDI;

