MARK begin;
COMMENT | *************************************************************	|
COMMENT | * AUTHOR: Alex Simpson		DATE: 30/10/89	      *	|
COMMENT | *							      * |
COMMENT | * SUBJECT: The Diagonalisation Lemma			      *	|
COMMENT | *							      *	|
COMMENT | * NOTES: Based on the original version by Fausto.	      * |
COMMENT | *	   Would be nicer with reflection up and a mechanism  * |
COMMENT | *	   fof definitions.				      * |
COMMENT | *							      * |
COMMENT | * TECHNICAL NOTES: Requires diaglemma2.hgk                  * |
COMMENT | *							      *	|
COMMENT | * GETFOL VERSION: getfol-ott89			      *	|
COMMENT | *							      *	|
COMMENT | *************************************************************	|

COMMENT | ***************************************************************** |
COMMENT | ***************************************************************** |
COMMENT | *                                                               * |
COMMENT | *                   THE UNFORMALISED THEOREM                    * |
COMMENT | *                                                               * |
COMMENT | ***************************************************************** |
COMMENT | ***************************************************************** |

COMMENT | The diagonalisation lemma is a major step in the proof of many |
COMMENT | important metamathematical results such as Godel's two theorems. |
COMMENT | Although not explicitly formulated by Godel the result is just |
COMMENT | an application of the methods which he developed in his proof. |

COMMENT | In its usual form the lemma applies to any first order theory  |
COMMENT | with enough expressive power to represent all primitive |
COMMENT | recursive functions. The proper proof of the lemma requires |
COMMENT | a laborious encoding of the expressions of the language |
COMMENT | as objects of the theory (Godel numbering). Due to the |
COMMENT | expressive power of the theory meta-theoretical operations |
COMMENT | on expressions of the language (in particular substitution) are |
COMMENT | representable in the theory as functions operating on the codes of |
COMMENT | those expressions. Once the relevant substitution function is |
COMMENT | established the interesting part of the proof, the diagonal |
COMMENT | construction, is possible. |
COMMENT |  |
COMMENT | The theorem states that for any wff PSI with one free variable |
COMMENT | there is a sentence PHI such that: |

COMMENT |             !--  PHI <--> PSI[~PHI~]                    (DIAG) |

COMMENT | Here ~.~ represents the code of its argument, PSI[t] represents |
COMMENT | the wff PHI with each occurence of its free variable replaced by |
COMMENT | the term t, and !-- is the provability turnstile. |

COMMENT | The GETFOL proof will start with the assumption that the relevant |
COMMENT | substitution function exists. An encoding of the language into |
COMMENT | the theory is thus assumed (it is necessary for a substitution |
COMMENT | function to be possible) but the details of the encoding need not |
COMMENT | be made explicit. The only requirement is that the following |
COMMENT | holds for each wff W, variable v and code n: |

COMMENT | !--  subst(~W~,~v~,n) = ~W[n/v]~                            (*) |

COMMENT | Here W[n/v] represents the wff W with all free occurrences of v |
COMMENT | replaced by n. |

COMMENT | The stipulation that n be a code in (*) is crucial. The basic |
COMMENT | substitution function, subst', satisfies: |

COMMENT | !--  subst'(~W~,~v~,~t~) = ~W[t/v]~                        (**) |

COMMENT | where t is an arbitrary term. However this substitution is not |
COMMENT | sufficient for diagonalisation because the proof requires the |
COMMENT | third argument itself to be substituted, rather than what it |
COMMENT | encodes. |

COMMENT | It is obviously impossible to have a function subst'' satisfying: |

COMMENT | !--  subst''(~W~,~v~,t) = ~W[t/v]~ |

COMMENT | because different terms representing the same object evaluate |
COMMENT | equally on the left and differently on the right. The problem is |
COMMENT | solved in Peano Arithmetic, for example, because only natural |
COMMENT | numbers are dealt with. Each  natural number is canonically |
COMMENT | represented by its numeral and so the existence of subst satisfying |
COMMENT | (*) (where n represents a numeral) follows from subst' satisfying |
COMMENT | (**) because the encoding  of the numerals is primitive recursive |
COMMENT | and thus representable in the theory. |

COMMENT | To make the setting of the diagonalisation lemma as general as |
COMMENT | possible only the existence of a coding and substitution function |
COMMENT | satisfying (*) are assumed. Perhaps a more elegant way would |
COMMENT | be to have a substitution satisfying (**) and a function which |
COMMENT | encodes a code and then to define: |

COMMENT | subst(x,y,n) = subst'(x,y,encode(n))                            |


COMMENT | ***************************************************************** |
COMMENT | *                          The Proof                            * |
COMMENT | ***************************************************************** |

COMMENT | Given an arbitrary wff PSI with one free variable the construction |
COMMENT | of a sentence PHI which satisfies (DIAG) proceeds in the folowing |
COMMENT | way: |

COMMENT | First an arbitrary variable, say v0, is selected. It must have a |
COMMENT | code ~v0~ so it is possible to construct the wff: |
COMMENT |          |
COMMENT | THETA <==> PSI[subst(v0,~v0~,v0)]                           (1) |

COMMENT | Here the <==> means that THETA is defined to be this wff. THETA is |
COMMENT | not part of the language, it is meta-level abbreviation for |
COMMENT | the wff it represents. |

COMMENT | Putting W = THETA, v = v0, n = ~THETA~ in (*) gives: |

COMMENT | !--  subst(~THETA~,~v0~,~THETA~) = ~THETA[~THETA~/v0]~      (A) |

COMMENT | Using the definition of THETA the following holds: |

COMMENT | THETA[~THETA~/v0] == PSI[subst(~THETA~,~v0~,~THETA~)]       (B) |

COMMENT | Here the == means that the two sides are identical wffs, and the |
COMMENT | equivalence is derived by performing the substitution on the |
COMMENT | left hand side. |

COMMENT | Because the two sides of (B) are identical wffs their codes are |
COMMENT | identical, therefore substituting in (A) gives: |

COMMENT | !--  subst(~THETA~,~v0~,~THETA~) =  |
COMMENT |      ~PSI[subst(~THETA~,~v0~,~THETA~)]~                     (C) |

COMMENT | Defining PHI by |

COMMENT | PHI <==> PSI[subst(~THETA~,~v0~,~THETA~)]                   (2) |

COMMENT | gives: |

COMMENT | !--  subst(~THETA~,~v0~,~THETA~) = ~PHI~                    (D) |

COMMENT | which is just (C) rewriten using the definition. |

COMMENT | But trivially: |

COMMENT | !--  PHI <--> PSI[subst(~THETA~,~v0~,~THETA~)]              (E) |

COMMENT | because the left hand side is just an abbreviation for  |
COMMENT | the right. |

COMMENT | Now substituting via (D) in (E) shows that PHI is indeed the |
COMMENT | required wff. |

COMMENT | !-- PHI <--> PSI[~PHI~]                                  (DIAG) |



COMMENT | ***************************************************************** |
COMMENT | ***************************************************************** |
COMMENT | *                                                               * |
COMMENT | *                   THE GETFOL FORMALISATION                    * |
COMMENT | *                                                               * |
COMMENT | ***************************************************************** |
COMMENT | ***************************************************************** |

PROBE ALL;

COMMENT | ***************************************************************** |
COMMENT | *                     Basic Object theory                       * |
COMMENT | ***************************************************************** |

COMMENT | The object theory is a standard unsorted (ie. one sort only) first |
COMMENT | order theory. For now no assumptions are being made about the |
COMMENT | language. |

NAMECONTEXT OBJECT;
DECLARE SORT OBJ;



COMMENT | ***************************************************************** |
COMMENT | *                      Basic Meta Theory                        * |
COMMENT | ***************************************************************** |

COMMENT | The objects of the meta theory are the names of the object |
COMMENT | theory expressions - ie. a representation of the lexical |
COMMENT | forms of the expressions. |

MAKECONTEXT META;
SWITCHCONTEXT META;


COMMENT | *** Syntax *** |

DECLARE SORT WFF TERM INDVAR PREDCONST FUNCONST;
MOREGENERAL TERM <INDVAR>;

DECLARE INDVAR W [WFF];
DECLARE INDVAR v [INDVAR];

DECLARE PREDCONST THEOREM 1;

DECLARE INDCONST Equality   [PREDCONST];
DECLARE FUNCONST pred2apply (PREDCONST,TERM,TERM)=WFF;
DECLARE FUNCONST mkiff (WFF,WFF)=WFF;

DECLARE FUNCONST pred1apply (PREDCONST,TERM)=WFF;
DECLARE FUNCONST fun3appl (FUNCONST,TERM,TERM,TERM)=TERM;


COMMENT | *** Semantics *** |

MATTACH Equality dar OBJECT::PREDCONST:=;
ATTACH mkiff TO mkiff;

ATTACH pred1apply TO predappl1\-mak;
ATTACH pred2apply TO predappl2\-mak;
ATTACH fun3appl TO appl3\-mak;


COMMENT | *** Basic Axiom *** |

COMMENT | If there was reflection up this axiom would not be necessary. |

AXIOM A1: forall W. THEOREM(mkiff(W,W));



COMMENT | ***************************************************************** |
COMMENT | *                       The Encoding                            * |
COMMENT | ***************************************************************** |

COMMENT | The encoding is a mapping from the names of expressions onto the |
COMMENT | names of the canonical terms (codes) representing them in the |
COMMENT | object theory.It is thus an operation entirely at the meta level. |
COMMENT | It is necessary to have a new sort at the meta level containing |
COMMENT | the names of codes (it is therefore a subsort of the sort |
COMMENT | containing names of terms). |

COMMENT | Note, there cannot be a sort of codes at the object level because |
COMMENT | the codes are terms in a certain canonical form. Thus of two terms |
COMMENT | representing the same object one might be a code and the other |
COMMENT | not, but these two terms must necessarily have the same sort at |
COMMENT | the object level. |

DECLARE SORT CODE;
MOREGENERAL TERM <CODE>;

DECLARE INDVAR n [CODE];

DECLARE FUNCONST encodewff (WFF)=CODE;
DECLARE FUNCONST encodevar (INDVAR)=CODE;



COMMENT | ***************************************************************** |
COMMENT | *                 The Substitution Function                     * |
COMMENT | ***************************************************************** |


COMMENT | *** OBJECT THEORY *** |

SWITCHCONTEXT OBJECT;

COMMENT | The substitution function is a function of the object theory. |

DECLARE FUNCONST subst (OBJ,OBJ,OBJ)=OBJ;


COMMENT | *** META THEORETICAL DEFINITION  *** |

SWITCHCONTEXT META;

COMMENT | The only property required of subst is that it satisfies (*). |
COMMENT | It is necessary to express this property as an axiom at the meta |
COMMENT | level. |

COMMENT | The right hand side of (*) requires the computation of W[n/v] which |
COMMENT | is basically the substitution function for names of expressions. |
COMMENT | The function which performs this is provided by semantic attachment |
COMMENT | to a GETFOL substitution routine (via the function substfree |
COMMENT | contained in "diaglemma2.hgk"). |

DECLARE FUNCONST substfree (WFF,INDVAR,CODE)=WFF;
ATTACH substfree TO substfree;

COMMENT | To state the substitution axiom it is necessary to have a name |
COMMENT | for subst. |

DECLARE INDCONST "subst" [FUNCONST];
MATTACH "subst" TO OBJECT::FUNCONST:subst;

COMMENT | The axiom is a direct translation of (*). |

AXIOM AX_subst:
  forall W v n.
    THEOREM(
      pred2apply(Equality
                 fun3appl("subst",encodewff(W),encodevar(v),n),
                 encodewff(substfree(W,v,n)) ));

MARK M1;

COMMENT | ***************************************************************** |
COMMENT | *                           The Proof                           * |
COMMENT | ***************************************************************** |

COMMENT | The GETFOL formalisation of the proof is interesting because it |
COMMENT | enforces a separation between the meta-theoretic and |
COMMENT | object-theoretic steps. As a matter of fact practically all the |
COMMENT | proof is performed at the meta level, because that is the only |
COMMENT | level at which the intensional equivalence (ie. same name and |
COMMENT | therefore same code) can be expressed. |

COMMENT | *** THE OBJECT LANGUAGE *** |
COMMENT |  |
SWITCHCONTEXT OBJECT;

COMMENT | The informal proof starts with the wff PSI (which is to be |
COMMENT | diagonalised) and a selected variable. To simplify matters |
COMMENT | the formalised proof will be given for an arbitrary unary |
COMMENT | predicate instead of a wff with one free variable. |

DECLARE PREDCONST PSI 1;
DECLARE INDVAR v0 [OBJ];

COMMENT | The code of v0 exists at the object level. As the coding is |
COMMENT | purely hypothetical it is necessary to declare a constant to |
COMMENT | represent this code. |

DECLARE INDCONST ~v0~ [OBJ];


COMMENT | *** THE META REPRESENTATION *** |

SWITCHCONTEXT META;

COMMENT | The meta language must have names for the alphabet of the object |
COMMENT | language. |

DECLARE INDCONST "PSI" [PREDCONST];
DECLARE INDCONST "v0" [INDVAR];
DECLARE INDCONST "~v0~" [CODE];

MATTACH "PSI" TO OBJECT::PREDCONST:PSI;
MATTACH "v0" TO OBJECT::INDVAR:v0;
MATTACH "~v0~" TO OBJECT::INDCONST:~v0~;


COMMENT | ~v0~ is defined to be the code of v0 by an axiom. |

AXIOM CODE_v0: "~v0~" = encodevar("v0");


COMMENT | *** DEFINITION OF THETA  *** |

COMMENT | There is no mechanism for making an abbreviating definition in |
COMMENT | GETFOL. Thus to force THETA to be the same wff as PSI(v0,~v0~,v0) |
COMMENT | it is necessary to define the name of THETA as equal to the name |
COMMENT | of PSI(v0,~v0~,v0). Thus THETA is defined at the meta level. |

DECLARE INDCONST "THETA" [WFF];

AXIOM DEF_THETA:
  "THETA" = pred1apply("PSI",
                      fun3appl("subst","v0","~v0~","v0"));

MARK M2;

COMMENT | It turns out that THETA is not needed at the object level, however |
COMMENT | its code is. |

SWITCHCONTEXT OBJECT;

DECLARE INDCONST ~THETA~ [OBJ];

SWITCHCONTEXT META;

DECLARE INDCONST "~THETA~" [CODE];

MATTACH "~THETA~" TO OBJECT::INDCONST:~THETA~;

AXIOM CODE_THETA: "~THETA~" = encodewff("THETA");


COMMENT | *** PROOF STEPS (A) - (C) *** |

COMMENT | (A) is obtained as an instance of (*) (ie. AX_subst) by doing |
COMMENT | forall elimination using "THETA", "v0" and "~THETA~", then |
COMMENT | substituting the occurrence of encodewff("THETA") with the |
COMMENT | identical "~THETA~", and the occurrence of encodevar("v0") |
COMMENT | with the identical "~v0~". |

ALLE AX_subst "THETA"
              "v0"
              "~THETA~";

SUBST ^1 with CODE_THETA right;

LABEL FACT A;
SUBST ^1 with CODE_v0 right;

MARK M3;

COMMENT | (B) is derived precisely by means of computing the substitution |
COMMENT | using the definition of THETA and the GETFOL substitution function |
COMMENT | which is attached to substfree. |

LABEL FACT B;
SETBASICSIMP DEF\-THETA at facts {DEF_THETA};
EVAL substfree("THETA","v0","~THETA~") =
pred1apply("PSI",fun3appl("subst","~THETA~","~v0~","~THETA~")) 
BY DEF\-THETA;

MARK M4;

COMMENT | (C) follows by a simple substitution. |

LABEL FACT C;
SUBST A with B;

MARK M5;

COMMENT | *** DEFINITION OF PHI *** |

COMMENT | PHI is defined by a meta level axiom in the same way as THETA. |
COMMENT | This time PHI is also required as a sentence at the object level. |
COMMENT | Note that actually PHI already exists at the object level in its |
COMMENT | expanded form, however it is nice to make things readable ... |

SWITCHCONTEXT OBJECT;

DECLARE SENTCONST PHI;
DECLARE INDCONST ~PHI~ [OBJ];

SWITCHCONTEXT META;

DECLARE INDCONST "PHI" [WFF];
DECLARE INDCONST "~PHI~" [CODE];

MATTACH "PHI" TO OBJECT::SENTCONST:PHI;
MATTACH "~PHI~" TO OBJECT::INDCONST:~PHI~;


AXIOM DEF_PHI:
   "PHI" = pred1apply("PSI",fun3appl("subst","~THETA~","~v0~","~THETA~"));

MARK M6;

AXIOM CODE_PHI:
   "~PHI~" = encodewff("PHI");


COMMENT | *** PROOF STEPS (D) & (E) *** |

COMMENT | (D) follows from the abbreviation of PHI in (C) and the |
COMMENT | substitution of encodewff("PHI") with the identical "~PHI~". |

SUBST C with DEF_PHI right;

LABEL FACT D;
SUBST ^1 with CODE_PHI right;

MARK M7;

COMMENT | (E) is an instance of the trivial (A1) after substitution of |
COMMENT | identities. |

ALLE A1 "PHI";

LABEL FACT E;
SUBST ^1 with DEF_PHI OCC 2;

MARK M8;

COMMENT | *** DEDUCING (DIAG) *** |

COMMENT | The last part of the proof is the only part at the object level. |
COMMENT | (D) and (E) are reflected into theorems at the object level. |
COMMENT | (DIAG) then follows by substitution of equals at the object level. |
COMMENT | Note this is an essentially object level step because the equality |
COMMENT | does not hold at the meta level. |

SWITCHCONTEXT OBJECT;

REFLECT D;

MARK M9;

REFLECT E;

MARK M10;

LABEL FACT DIAG;
SUBST ^1 with ^2;

MARK end;
