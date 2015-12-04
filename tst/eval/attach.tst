COMMENT | *************************************************************	|
COMMENT | * AUTHOR: ?			      			        |
COMMENT | *								|
COMMENT | * SUBJECT: This is a simple example of how to make attachments|
COMMENT | *								|
COMMENT | * GETFOL VERSION: September 1990				|
COMMENT | *								|
COMMENT | *************************************************************	|

PROBE ALL;

DECLARE SORT PIPPO;
DECLARE INDCONST A B C D [PIPPO];
DECLARE FUNCONST AA BB (PIPPO) = PIPPO;
DECREP PIPPOREP;
ATTACH A DAR [PIPPOREP] a;
ATTACH C DAR [PIPPOREP] c;
DEFLAM ID (ARG) ARG;
DEFLAM B  (ARG) ARG;
ATTACH AA TO [PIPPOREP = PIPPOREP] ID;
ATTACH BB TO [PIPPOREP = PIPPOREP] B;
