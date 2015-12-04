MARK begin;

COMMENT | *************************************************************	|
COMMENT | * AUTHOR:	 Richard Weyhrauch       DATE:	around 1984     |
COMMENT | *								|
COMMENT | * SUBJECT: Paper at CADE 5					|
COMMENT | *								|
COMMENT | * GETFOL VERSION: October 1989				|
COMMENT | *								|
COMMENT | *************************************************************	|

COMMENT | SUSBSIDIARY DEDUCTION RULES                    |
COMMENT |Implicational part of the propositional logic P1|

COMMENT | Context and proof naming |
PROBE ALL;
NAMECONTEXT INITIAL;

MAKECONTEXT META;
SWITCHCONTEXT META;
NAMEPROOF M1;

MARK mark1;

COMMENT |    Language definition |

COMMENT | SORT definition |
DECLARE SORT SENTCONST WFF;
DECLARE SORT IMP;
DECLARE SORT THEOREM;
DECLARE SORT FACT;
MOREGENERAL WFF <SENTCONST>;
MOREGENERAL WFF <IMP>;

COMMENT | INDVARs definition |
DECLARE INDVAR sentconst      [SENTCONST];
DECLARE INDVAR wff1 wff2 wff3 [WFF];
DECLARE INDVAR impl           [IMP];
DECLARE INDVAR fact vl1  vl2  [FACT];

COMMENT |FUNCONSTs definition |
DECLARE FUNCONST mkimp (WFF,WFF)=IMP;
DECLARE FUNCONST hypof (IMP)    =WFF;
DECLARE FUNCONST concl (IMP)    =WFF;
DECLARE FUNCONST wffof (FACT)   =WFF;

COMMENT | REPRESENTATIONs defintion |
DECREP WFF;
DECREP FACT;

COMMENT | representing SORTs in the (partial Model) |
REPRESENT {FACT} AS FACT;
REPRESENT {WFF}  AS WFF;

MARK mark2;

COMMENT | Attaching the theory to the model |
ATTACH mkimp TO [WFF,WFF=WFF] mkimp ;
ATTACH hypof TO [WFF=WFF]     hypot;
ATTACH concl TO [WFF=WFF]     concl;
ATTACH wffof TO [FACT=WFF]    fact\-get\-wff;
ATTACH IMP   TO [WFF]         IMP;

MARK mark3;

COMMENT |AXIOMs assertion |	
AXIOM WFF1: forall sentconst.WFF(sentconst);
AXIOM WFF2: forall wff1 wff2.WFF(mkimp(wff1,wff2));

COMMENT | the following axioms state the syntatic |
COMMENT | properties of implications |
AXIOM IMPL1: forall wff1 wff2.IMP(mkimp(wff1,wff2));
AXIOM IMPL2: forall wff1 wff2.hypof(mkimp(wff1,wff2))=wff1;
AXIOM IMPL3: forall wff1 wff2.concl(mkimp(wff1,wff2))=wff2;
AXIOM IMPL4: forall wff1.(IMP(wff1)imp wff1=mkimp(hypof(wff1),concl(wff1)));

MARK mark4;

COMMENT |  Axioms are Theorems                      |
COMMENT | (Metathoretic statement about any theory) |
COMMENT |  HILBERT1 states: A imp (B imp A)         |
AXIOM HILBERT1:                            
          forall wff1 wff2. THEOREM(mkimp(wff1,(mkimp(wff2,wff1))));

COMMENT | (A imp (B imp C) ) imp ((A imp B) imp (A imp C )) |
AXIOM HILBERT2:
          forall wff1 wff2 wff3.THEOREM(
                                    mkimp(
                                      mkimp(wff1,mkimp(wff2,wff3)),
                                         mkimp(mkimp(wff1,wff2),
                                      mkimp(wff1,wff3)) ) );
MARK mark5;

COMMENT | Modus Ponens |
AXIOM MODUSP:
       forall wff1 wff2.(THEOREM(mkimp (wff1,wff2))imp
                         (THEOREM(wff1)imp THEOREM(wff2)) );

MARK mark6;

COMMENT | We compute the WellFormedFormulaOF some FOL fact |
COMMENT | The following is true in P1                      |
AXIOM THM:forall fact.(THEOREM (wffof(fact)));

COMMENT | We want to generate some particular facts in Theory .|
COMMENT | This is why we prove the following theorem in meta |
COMMENT | If we have two facts of theory and the first asserts |
COMMENT | an implication and the second asserts the formula |
COMMENT | which is the hypothesis of the first.Then we can |
COMMENT | state that the conclusion of the first fact is a theorem|

ASSUME IMP(wffof(vl1))and hypof(wffof(vl1))=wffof(vl2);
ALLE IMPL4 , wffof(vl1);
TAUT wffof(vl1)=mkimp(hypof(wffof(vl1)),concl(wffof(vl1))) BY 1,2;             
ALLE THM ,vl1;
SUBST 4 with 3;
ALLE THM ,vl2;
ANDE 1 2;
SUBST 6 with 7 right;

COMMENT | These steps have been added when the ND rules ALLE and EXISTI |
COMMENT | have been separated from the evaluator. They don't seem to be |
COMMENT | satisfactory yet, because the deduction of formulae that are  |
COMMENT | consequence of the sort information is still left to the eval-|
COMMENT | uator. Probably in the future a new inference rule will be set|
COMMENT | up: in this case this example has to be changed.              |

ANDE 1 1;
EVAL forall impl.WFF(hypof(impl));
ALLE 10 wffof(vl1);
IMPE 9 11;
EVAL forall impl.WFF(concl(impl));
ALLE 13 wffof(vl1);
IMPE 9 14;

ALLE MODUSP, hypof(wffof(vl1)) concl(wffof(vl1)) ;
TAUT THEOREM(concl(wffof(vl1))) BY 5,8,12,15,16;
IMPI 1,17;
ALLI 18, vl1 , vl2;
LABEL FACT MP=19;

MARK mark7;

COMMENT |The following commands and the previous proved theorem  |
COMMENT |will allow us to generate some facts in Theory using the|
COMMENT |Reflection Principle                                    |

COMMENT | Proof of 'A imp A' in Theory | 

COMMENT | we create a new context in which we will Reflect |
COMMENT | results found in Meta                            |
MAKECONTEXT THEORY;

COMMENT | Switching to THEORY and naming of the current proof |
SWITCHCONTEXT THEORY;
NAMEPROOF T1;

COMMENT | Sentconsts Declarations |
DECLARE SENTCONST A;
DECLARE SENTCONST B;

MARK mark8;

COMMENT | PROOF in the theory |
REFLECT HILBERT1 A , (A imp A);
REFLECT HILBERT2 A,A imp A,A;
REFLECT MP 2 ,1;
REFLECT HILBERT1 A ,A ;
REFLECT MP 3, 4;

MARK mark9;

COMMENT |We prove in Meta that 'A imp A' for every wff 'A' |
SWITCHCONTEXT META;
MAKEPROOF OBVIOUS1 ;
SWITCHPROOF OBVIOUS1;
ALLE HILBERT1,wff1,mkimp(wff1,wff1);
ALLE HILBERT2,wff1,mkimp(wff1,wff1),wff1;
ALLE MODUSP,
     mkimp (wff1,mkimp(mkimp(wff1,wff1),wff1)),
     mkimp(mkimp(wff1,mkimp(wff1,wff1)),mkimp(wff1,wff1));
TAUT THEOREM( mkimp(mkimp(wff1,mkimp(wff1,wff1)), mkimp(wff1,wff1))) BY 1,3, 2 ;
ALLE HILBERT1 wff1,wff1;
ALLE MODUSP,mkimp(wff1,mkimp(wff1,wff1)),mkimp(wff1,wff1);
TAUT THEOREM(mkimp(wff1,wff1)) BY 4,6,5;
ALLI 7 ,wff1;
LABEL FACT OBVIOUS =8;

MARK mark10;

COMMENT |We prove in Theory 'A imp A' B imp B' 'C imp C'|
COMMENT |using the metatheorem  that asserts that any wff |
COMMENT | implies itself |
SWITCHCONTEXT THEORY;
REFLECT OBVIOUS A;
REFLECT OBVIOUS B;
REFLECT OBVIOUS A imp B;

MARK end;

