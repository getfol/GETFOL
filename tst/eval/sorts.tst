COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Alessandro Cimatti      			        |
COMMENT | *								|
COMMENT | * SUBJECT: EVAL TEST WITH SORT SYMBOLS                        |
COMMENT | *								|
COMMENT | * GETFOL VERSION: September 1990				|
COMMENT | *								|
COMMENT | *************************************************************	|

COMMENT | This example shows a case in which two sorts |
COMMENT | are forced to have a non-empty intersection. |
COMMENT | This is due to the definition of the fmaps   |
COMMENT | for the functional f.                        |

namecontext eval\-initial;

makecontext eval1;
switchcontext eval1;

declare sort s1 s2 s3 s4 s5 s6;

moregeneral s2 <s1>;
moregeneral s4 <s3>;

declare indconst c1 [s1];
declare indconst c2 [s2];
declare indconst c3 [s3];
declare indconst c4 [s4];

declare funconst f 2;
setfmap f (s1 s4)=s5;
setfmap f (s2 s3)=s6;

eval s5(f(c1 c3));
eval s6(f(c1 c3));

COMMENT | THE FOLLOWING EXAMPLE HAS TO PRODUCE A TEN-STEP PROOF. |

makecontext eval2;
switchcontext eval2;

declare sort s1 s2 s3 s4;

moregeneral s1 <s2 s3 s4>;
moregeneral s2 <s3 s4>;
moregeneral s3 <s4>;

declare indvar x;
declare indvar x1 [s1];
declare indvar x2 [s2];
declare indvar x3 [s3];
declare indvar x4 [s4];

eval s1(x4);
eval s1(x1);
eval s1(x2);
eval s1(x3);

eval s2(x2);
eval s2(x3);
eval s2(x4);

eval s3(x3);
eval s3(x4);

eval s4(x4);
