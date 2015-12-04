COMMENT | |
COMMENT | This is an example of the fact that PTAUT sometimes handles |
COMMENT | dependencies unsatisfactorily. Infact in this case the fact |
COMMENT | produced by PTAUT has the dependecnies (1 2) instead of no |
COMMENT | dependencies (as it should be using the standard ND rules |
COMMENT | |
RESET;
NAMECONTEXT INITIAL;
MAKECONTEXT PTAUT1;
SWITCHCONTEXT PTAUT1;
DECLARE SENTCONST P Q;
ASSUME P imp Q;
ASSUME P;
PTAUT Q BY 1,2;

COMMENT | This is Armando's Example. I think that it doesn't show the |
COMMENT | described situation. Better description examples seem to me |
COMMENT | the following. As we can see no discharge is performed.     |
COMMENT | Alessandro Cimatti, 15.1.90.                                |


MAKECONTEXT PTAUT11;
SWITCHCONTEXT PTAUT11;
DECLARE SENTCONST P Q;
ASSUME P;
ASSUME Q;
PTAUT P imp Q BY 1,2;
PTAUT P BY 1,2;


COMMENT | This is the second set of tests. |

MAKECONTEXT PTAUT2;
SWITCHCONTEXT PTAUT2;

DECLARE SENTCONST A B C;
DECLARE SENTCONST P Q;

PTAUT A imp A;
PTAUT A or not A;
PTAUT wffif A then TRUE else TRUE;
PTAUT wffif (wffif A then TRUE else TRUE) then TRUE else A;


COMMENT | first propositional axiom |
PTAUT A imp ( B imp A );

COMMENT | second propositional axiom |
PTAUT ( A imp ( B imp C ) ) imp ( ( A imp B ) imp ( A imp C ) ); 

COMMENT | third propositional axiom |
PTAUT ( (not B) imp (not A) ) imp ( ( (not B) imp A ) imp B );

PTAUT (wffif A then B else C) iff ((A and B) or (not A and C));

ASSUME A B C;

AXIOM AX1 : P;
AXIOM AX2 : Q;

PTAUT A and B and ( P or Q ) by 1:^1 AX1 AX2;

PTAUT P or Q by ^1;












