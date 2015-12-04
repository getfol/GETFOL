
COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Alessandro Cimatti		DATE: around 1990	|
COMMENT | *								|
COMMENT | * SUBJECT: testing sorts in GETFOL				|
COMMENT | *								|
COMMENT | *************************************************************	|

Namecontext ini;
MAKECONTEXT DECL3;
SWITCHCONTEXT DECL3;

declare sort a b c d e f g h;
moregeneral a < b c d e f g h >;
moregeneral b < c d e f g h >;
moregeneral c < d e f g h >;
moregeneral d < e f g h >;
moregeneral e < f g h >;
moregeneral f < g h >;
moregeneral g < h >;
moregeneral h < a >;

