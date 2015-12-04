COMMENT | *************************************************************	|
COMMENT | *								|
COMMENT | * AUTHOR:	 Richard Weyhrauch       DATE:	around 1984     |
COMMENT | *								|
COMMENT | * SUBJECT: MINIMALIZATION SCHEMA				|
COMMENT | *								|
COMMENT | * GETFOL VERSION: November 1990				|
COMMENT | *								|
COMMENT | *************************************************************	|

PROBE ALL;

COMMENT |LOADING OF HGKM FUNCTIONS |
DEFLAM mkapplw1 (PREDSYM TERM) (appl1\-mak PREDSYM TERM);
DEFLAM mkapplt1 (FUNSYM  TERM) (appl1\-mak FUNSYM TERM );

DEFLAM minimasort (TERM) (QUOTE EXEXP);

COMMENT | Subst substitutes its first argument for its second argument|
DEFLAM isubstfree (FUNSYM1 FUNSYM2 TERM) (SUBST FUNSYM1 FUNSYM2 TERM);

COMMENT | CONTEXT CREATION |
NAMECONTEXT MTC;

DECLARE SORT ESEXP SEXP ENATNUM NATNUM;

MAKECONTEXT META;

COMMENT | SETUP OF META |
SWITCHCONTEXT META;

COMMENT |SORTS DECLARATION |
DECLARE SORT 
	FOLSYM
	QUANT
	INDSYM INDVAR
	FUNSYM FUNCONST
	PREDSYM PREDCONST
	EXPR TERM WFF
	FACT;

DECLARE PREDCONST THEOREM 1;

MOREGENERAL TERM <INDVAR>;

COMMENT |REPRESENTATIONS DECLARATION |
DECREP QUANT   WFF  PREDSYM TERM      EXPR   INDVAR;
DECREP METAREP FACT FUNSYM  PREDCONST FOLSYM INDSYM;

COMMENT | REPRESENTING SORTS |
REPRESENT { QUANT   } AS QUANT;
REPRESENT { WFF     } AS WFF;
REPRESENT { PREDSYM } AS PREDSYM;
REPRESENT { TERM    } AS TERM;
REPRESENT { EXPR    } AS EXPR;
REPRESENT { INDVAR  } AS INDVAR;
REPRESENT { FACT    } AS FACT;
REPRESENT {FUNSYM   } AS FUNSYM;
REPRESENT {PREDCONST} AS PREDCONST;
REPRESENT {FOLSYM   } AS FOLSYM ;
REPRESENT {INDSYM   } AS INDSYM;

COMMENT | DECLARATION OF THE LANGUAGE |
DECLARE INDCONST Forall [QUANT];
DECLARE INDCONST Equal  [PREDCONST];
DECLARE INDCONST Universal Esexp Sexp Enatnum Natnum [PREDCONST];
DECLARE INDCONST Mf [FUNSYM];
DECLARE INDCONST Mvl [FACT];

DECLARE INDVAR f g  [FUNSYM];	
DECLARE INDVAR i    [INDSYM];
DECLARE INDVAR x    [TERM];
DECLARE INDVAR t    [TERM];
DECLARE INDVAR w    [WFF];
DECLARE INDVAR vl vl1 vl2 [FACT];

DECLARE FUNCONST mkimp    (WFF,WFF)=WFF;
DECLARE FUNCONST mkand    (WFF,WFF)=WFF;
DECLARE FUNCONST mkquant  (QUANT,TERM,WFF)=WFF;
DECLARE FUNCONST mkapplt1 (FUNSYM,TERM)=TERM;
DECLARE FUNCONST mkapplw1 (PREDCONST,TERM)=WFF;
DECLARE FUNCONST minsubst (FUNSYM,FUNSYM,TERM)=TERM;
DECLARE FUNCONST wffof    (FACT)=WFF;
DECLARE FUNCONST mainsym  (EXPR)=FOLSYM;
DECLARE FUNCONST matrix   (WFF)=WFF;
DECLARE FUNCONST bvarof   (WFF)=TERM;
DECLARE FUNCONST lhs rhs  (WFF)=TERM;
DECLARE FUNCONST schema1  (FUNSYM,FUNSYM,TERM,TERM)=WFF;
DECLARE FUNCONST defsort1 (FUNSYM,TERM)=PREDCONST;
DECLARE FUNCONST sort     (TERM)=PREDCONST;

DECLARE PREDCONST ISFUNDEF1 2;
DECLARE FUNCONST pred2apply (PREDCONST TERM TERM)=WFF;

HARDWARE Forall   dar [QUANT] Uniquant;
MATTACH Equal     dar [PREDCONST] MTC::PREDCONST:=;
MATTACH Universal dar [PREDCONST] MTC::PREDCONST:UNIVERSAL;
MATTACH Esexp     dar [PREDCONST] MTC::PREDCONST:ESEXP;
MATTACH Sexp      dar [PREDCONST] MTC::PREDCONST:SEXP;
MATTACH Enatnum   dar [PREDCONST] MTC::PREDCONST:ENATNUM;
MATTACH Natnum    dar [PREDCONST] MTC::PREDCONST:NATNUM;

ATTACH mkimp    TO  [WFF,WFF=WFF] mkimp;
ATTACH mkand    TO  [WFF,WFF=WFF] mkand;
ATTACH mkquant  TO  [QUANT,TERM,WFF=WFF] mkquant; 
ATTACH pred2apply  TO  [PREDCONST,TERM,TERM=WFF] predappl2\-mak;
ATTACH mkapplw1 TO [PREDCONST,TERM=WFF] mkapplw1; 
ATTACH mkapplt1 TO [FUNSYM,TERM=TERM] mkapplt1;
ATTACH minsubst TO [FUNSYM,FUNSYM,TERM=TERM] isubstfree;
ATTACH wffof	TO [FACT=WFF] fact\-get\-wff;
ATTACH mainsym	TO [EXPR=FOLSYM] mainsym;
ATTACH matrix	TO [WFF=WFF] matrix;
ATTACH bvarof	TO [WFF=TERM] bvarof;
ATTACH lhs	TO [WFF=TERM] lhs;
ATTACH rhs	TO [WFF=TERM] rhs;
ATTACH sort	TO [TERM=PREDCONST] minimasort;

AXIOM DEF1:
 forall f g x t. (schema1(f,g,x,t) =
   mkimp(
    mkquant(Forall,x,
     mkimp(
      mkapplw1(defsort1(f,x),minsubst(g,f,t)),
      pred2apply (Equal mkapplt1(g,x),minsubst(g,f,t)))),
    mkquant(Forall,x,
     mkimp(
      mkapplw1(defsort1(f,x),mkapplt1(f,x)),
      pred2apply (Equal mkapplt1(g,x),mkapplt1(f,x)) )) ) );

AXIOM DEF2:    
 forall f x . defsort1(f,x) =
          trmif sort(mkapplt1(f,x)) = Esexp 
            then Sexp 
            else trmif sort(mkapplt1(f,x)) = Enatnum 
                   then Natnum 
		   else Universal;
		 

AXIOM JMCMIN:
forall vl f g.(ISFUNDEF1(f,vl)   imp  
         THEOREM(schema1(f,g,bvarof(wffof(vl)),rhs(matrix(wffof(vl))))));

AXIOM FUNDEF: forall vl f.ISFUNDEF1(f,vl);

COMMENT | THE PROOF |

COMMENT | SETUP OF THE CONTEXT MTC |
SWITCHCONTEXT MTC;

DECLARE INDCONST BOT [ESEXP];
DECLARE INDVAR X; 
DECLARE INDVAR x y z [SEXP];
DECLARE FUNCONST f g (ESEXP)=ESEXP;

COMMENT | WORKING IN MTC |
ASSUME forall x . f(x)=f(x);
ASSUME forall x . g(x)=BOT;
ASSUME not SEXP(BOT);

COMMENT | WORKING IN META |

SWITCHCONTEXT META;

SETBASICSIMP meta\-axioms at facts {DEF1, DEF2, FUNDEF};
SETCOMPSIMP EVALSS AT meta\-axioms;

MATTACH Mf  DAR [FUNSYM] MTC::FUNSYM:f;
MATTACH Mvl DAR [FACT] MTC::FACT:1;

COMMENT | GOING BACK TO MTC |

SWITCHCONTEXT MTC;

REFLECT JMCMIN 1 f g;
setbasicsimp Bot at facts {2};
setbasicsimp Equterm at wffs {forall X.(X=X iff TRUE)};
eval 4 by Bot uni Equterm uni LQUANTREE uni LPROPTREE;
iffe 5 1;
impe 4 6;
alle 7,x;
tauteq  not SEXP(f(x)) BY ^1,3;
alli ^1 x;

