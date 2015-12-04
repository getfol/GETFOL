COMMENT | ************************************************************* |
COMMENT | * AUTHOR: Paolo Traverso                                      |
COMMENT | *                                                             |
COMMENT | * SUBJECT: WFFIF and TERMIF rules                             |
COMMENT | *                                                             |
COMMENT | * GETFOL VERSION: May 1991                                    |
COMMENT | *                                                             |
COMMENT | ************************************************************* |

COMMENT | Language declarations					|
declare sentconst A B C;
declare indpar a b c;
declare predconst P 1;
declare predconst Q 2;
declare funconst f g 1;


COMMENT | **************************************************************|
COMMENT | TERMIFI 							|
COMMENT | **************************************************************|

label fact Pif;
assume P(trmif A then a else b);

label fact fa;
assume A;

label fact Pa;
termife Pif fa trmif A then a else b;

label fact fna;
assume not A;

label fact Pb;
termifen Pif fna trmif A then a else b;

termifi Pa Pb  A a b;
COMMENT | Dependencies are in this way discharged			|
COMMENT | 6   P(trmif A then a else b)     (1)				| 

termifi Pa Pb not A  a b;
COMMENT | Dependencies are in this way not discharged                   |
COMMENT | 7   P(trmif (not A) then a else b)     (1 2 4)		|

termifi Pa Pb B  a b;
COMMENT | 7   P(trmif B then a else b)     (1 2 4)			|

COMMENT | TERMIFI with function symbols					|

label fact Piffun;
assume P(trmif A then f(a) else f(b));
label fact Pfa;
termife Piffun fa trmif A then f(a) else f(b);
label fact Pfb;
termifen Piffun fna trmif A then f(a) else f(b);
termifi Pfa Pfb  A a b;
termifi Pfa Pfb  A f(a) f(b);

COMMENT | TERMIFI over a termif itself                                  |

label fact Prec;
assume P(trmif A then (trmif A then f(a) else f(b)) 
                 else (trmif A then f(a) else f(b)));
label fact Preca;
termife Prec fa trmif A then f(a) else f(b);
label fact Precb;
termifen Prec fna trmif A then f(a) else f(b);
termifi Preca Precb  A a b;
termifi Preca Precb  A f(a) f(b);

COMMENT | **************************************************************|
COMMENT | TERMIFE 							|
COMMENT | **************************************************************|

termife Prec fa trmif A then f(a) else f(b) occ 1;
termife Prec fa trmif A then f(a) else f(b) occ 2;
termife Prec fa trmif A then f(a) else f(b) occ 1 2;
termife Prec fa trmif A then f(a) else f(b);

label fact PQ;
assume  P(trmif A then a else b) and 
        Q(trmif not A then a else b,trmif A then b else a);

termife PQ fa trmif A then a else b;
termife PQ fna trmif not A then a else b;

COMMENT | **************************************************************|
COMMENT | TERMIFEN 							|
COMMENT | **************************************************************|

termifen PQ fna trmif A then a else b;


COMMENT | **************************************************************|
COMMENT | WFFIFE and WFFIFEN						|
COMMENT | **************************************************************|

label fact wif;
assume wffif A then B else C;
wffife wif fa;
wffifen wif fna;

COMMENT | **************************************************************|
COMMENT | WFFIFI                                                        |
COMMENT | **************************************************************|

wffifi A fa fna;
wffifi A fna fa;
wffifi not A fna fa;
wffifi not A fa fna;
