MARK begin;

COMMENT | *************************************************************	|
COMMENT | * AUTHOR: F. Giunchiglia, R.W. Weyhrauch   DATE: around 1987	|
COMMENT | *								|
COMMENT | * SUBJECT: Non monotonic logic (new version)                  |
COMMENT | *								|
COMMENT | * NOTES: See related paper in book on reflection and          |
COMMENT | *        meta-level reasoning                                 |
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1989				|
COMMENT | *								|
COMMENT | *************************************************************	|
COMMENT | |

PROBE ALL;
NAMECONTEXT PSC;

COMMENT | LANGUAGE DEFINITION |
COMMENT | SORTS DEFININITION |
DECLARE SORT CONTEXT PROBLEM SETOFFACTS;
DECLARE SORT WFF;

MARK mark1;

COMMENT | VARIABLES AND CONSTANTS DEFINITION |
DECLARE INDCONST True                       [WFF];
DECLARE INDCONST Tnoon Tsunshining Teclipse [WFF];
DECLARE INDCONST C0 C1 C2                   [CONTEXT];
DECLARE INDCONST Emptycontext               [CONTEXT];
DECLARE INDCONST P                          [PROBLEM];
DECLARE INDVAR   w                          [WFF];
DECLARE INDVAR   c                          [CONTEXT];
DECLARE INDVAR   p                          [PROBLEM];

MARK mark2;

COMMENT | PREDICATES DEFINITION          |
COMMENT | CBB: CAN BE BELIEVED           |
COMMENT | IAC: IS AN APPROPRIATE CONTEXT |
DECLARE PREDCONST CBB      3;
DECLARE PREDCONST IAC      2;
DECLARE PREDCONST TAUT     2;
DECLARE PREDCONST PTHEOREM 2;
DECLARE PREDCONST Pconsist 2;
DECLARE PREDCONST PCONSIST 1;

MARK mark3;

COMMENT | FUNCTIONS DEFINITION |
DECLARE FUNCONST mknot             (WFF)        =WFF;
DECLARE FUNCONST mkimp             (WFF,WFF)    =WFF;
DECLARE FUNCONST assert            (WFF,CONTEXT)=CONTEXT;
DECLARE FUNCONST dclSentconst  (WFF,CONTEXT)=CONTEXT;
DECLARE FUNCONST mkands            (SETOFFACTS) =WFF;
DECLARE FUNCONST setoffacts        (CONTEXT)    =SETOFFACTS;

MARK mark4;

COMMENT |SIMULATION STRUCTURE DEFINITION|
COMMENT | DOMAINS OF THE INTERPRETATIONS DEFINITION|
DECREP WFF;
DECREP CONTEXT;
DECREP PROBLEM;
DECREP SETOFFACTS;

COMMENT | REPRESENTING SORTS IN THE MODEL |
REPRESENT {WFF}       AS WFF;
REPRESENT {CONTEXT}   AS CONTEXT;
REPRESENT {PROBLEM}   AS PROBLEM;
REPRESENT {SETOFFACTS}AS SETOFFACTS;

COMMENT | INTERPRETING THE CONSTANTS OF THE LANGUAGE |
ATTACH Tnoon             DAR [WFF] Noon;
ATTACH Tsunshining       DAR [WFF] Sunshining;
ATTACH Teclipse          DAR [WFF] Eclipse;
HARDWARE Emptycontext    DAR [CONTEXT] (cxtmakempty);

COMMENT |INTERPRETING THE APPLICATION SYMBOLS OF THE LANGUAGE |
ATTACH dclSentconst       TO [WFF,CONTEXT=CONTEXT] contextdeclsentconst;
ATTACH assert             TO [WFF,CONTEXT=CONTEXT] contextmakassert;
ATTACH mkimp              TO [WFF,WFF    =WFF]     mkimp;
ATTACH mknot              TO [WFF        =WFF]     mknot;
ATTACH TAUT               TO [WFF,CONTEXT]         CONTEXTTAUT;
ATTACH PCONSIST           TO [CONTEXT]             PCONSIST;
ATTACH setoffacts         TO [CONTEXT=SETOFFACTS]  getfacts;
ATTACH mkands             TO [SETOFFACTS=WFF]      andsbuilder;
ATTACH PTHEOREM           TO [WFF,CONTEXT ]        PTHEOREM;
ATTACH Pconsist           TO [WFF,CONTEXT ]        Pconsist;

MARK mark5;

COMMENT | AXIOMS DEFINITION | 
AXIOM AX1: forall w c p. (IAC(p,c) and CBB(w,c,p) imp IAC(p,assert(w,c)));
AXIOM AX2: forall w c p . (not Pconsist(w,c) imp not IAC(p,assert(w,c)));
AXIOM AX3: forall w p c.(PTHEOREM (w,c) imp CBB(w,c,p));
AXIOM AX4: forall w c p.(PTHEOREM (mknot(w),c) imp not(CBB(w,c,p)));

MARK mark6;

AXIOM AX5: forall p c. (CBB(Tnoon,c,p) and Pconsist(Tsunshining,c) imp CBB(Tsunshining,c,p));

MARK mark7;

AXIOM AX6: forall w c.(Pconsist(w,c) iff not TAUT(mkimp (mkands (setoffacts(c)),mknot(w)),c));
AXIOM AX7: forall c. (PCONSIST (c) iff Pconsist(True,c));
AXIOM AX8: forall w c. (PTHEOREM(w,c) iff TAUT(mkimp (mkands (setoffacts(c)),w),c));

MARK mark8;

COMMENT | EXTERNAL CONTEXTS BUILDING |
NAMEPROOF PRF1;
LET C0 TO [CONTEXT] 
           dclSentconst(Tnoon, 
              dclSentconst(Tsunshining, 
                 dclSentconst(Teclipse,Emptycontext) ) );
LET C1 TO  [CONTEXT] 
           assert(Tnoon, 
              assert(mkimp(Teclipse,mknot(Tsunshining)),C0));

MARK mark9;

ASSUME IAC(P,C1);
ALLE AX1 Tsunshining, C1, P;
ALLE AX5 P,C1;
EVAL PTHEOREM (Tnoon,C1);
ALLE AX3 Tnoon P C1;
IMPE 7, 6;
EVAL Pconsist(Tsunshining, C1);
ANDI 8, 9;
IMPE 10, 5;
ANDI 3, 11;
IMPE 4, 12;

MARK mark10;

COMMENT | SECOND HALF OF THE PROOF IN C2 |
MAKEPROOF PRF2;
SWITCHPROOF PRF2;
LET C2 TO [CONTEXT] assert(Teclipse,C1);
EVAL PTHEOREM (mknot (Tsunshining), C2);
ALLE  AX4 Tsunshining C2 P;
IMPE 2,3;

ALLE AX2 Tsunshining , C2 , P;
EVAL not Pconsist (Tsunshining, C2);
IMPE 5, 6;

MARK end;


