reset;
COMMENT | ************************************************************* |
COMMENT | * AUTHORS:   Andrea Parodi & Fulvio Rappa DATE: 25/9/1993     |
COMMENT | *                                                             |
COMMENT | * SUBJECT:  Sorted Steamroller                                |
COMMENT | *                                                             |
COMMENT | * GETFOL VERSION:  October 1993                               |
COMMENT | *                                                             |
COMMENT | ************************************************************* |

COMMENT | Wolves, foxes, birds, caterpillars, are animals, and there are|
COMMENT | some of each of them. Also there are some grains are plants.  |
COMMENT | Every animal either likes to eat all plants or all animals    |
COMMENT | much smaller than itself that like to eat some plants.        |
COMMENT | Caterpillars and snail are much smaller than birds,which are  |
COMMENT | much smaller than foxes, which in turn are much smaller than  |
COMMENT | wolves. Wolves do not like to eat foxes or grains, while birds|
COMMENT | like to eat caterpillar but not snail. Caterpillars and snails|
COMMENT | like to eat some plants. Therefore there is an animal that    |
COMMENT | likes to eat a grain-eating animal.                           |

COMMENT | SORT definition |

declare sort ANIMAL WOLF FOX BIRD CATERPILLAR SNAIL GRAIN PLANT; 
moregeneral ANIMAL < WOLF FOX BIRD SNAIL >;
moregeneral GRAIN < PLANT >;


COMMENT | PREDCONSTs definition |
COMMENT | MUCHSMALLER(x,y) --> x is Much smaller than y |
COMMENT | EAT(x,y) --> x Eats y |

declare predconst EAT MUCHSMALLER 2;

COMMENT | INDVARs definition |

declare indvar a a1 [ANIMAL];
declare indvar f [FOX];
declare indvar b [BIRD];
declare indvar c [CATERPILLAR];
declare indvar s [SNAIL];
declare indvar g [GRAIN];
declare indvar p [PLANT]; 
declare indvar w [WOLF];

COMMENT | AXIOMs|

axiom aEsa&p : forall  a.(forall p.EAT(a,p) or  forall  a1.((MUCHSMALLER(a1,a)
and exists p.EAT(a1,p)) imp EAT(a,a1))) ;

axiom cMSb : forall c,b.MUCHSMALLER(c,b);
axiom sMSb : forall s,b.MUCHSMALLER(s,b);
axiom bMSf : forall b,f.MUCHSMALLER(b,f);
axiom fMSw : forall f,w.MUCHSMALLER(f,w);
axiom wnEf : forall f,w.not EAT(w,f);
axiom wnEg : forall g,w.not EAT(w,g);
axiom bEc : forall b,c.EAT(b,c);
axiom bnEs : forall b,s.not EAT(b,s);


axiom cEp : forall c. exists p.EAT(c,p);
axiom sEp : forall s. exists p.EAT(s,p);


COMMENT | CONCLUSION |

decide exists a.exists a1.exists g.(EAT(a,a1) and EAT(a1,g)) by 
aEsa&p cMSb sMSb bMSf fMSw wnEf wnEg bEc bnEs cEp sEp  using
nnf,reduce,skolemize,phexp ptaut;




