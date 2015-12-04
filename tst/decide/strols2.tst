reset;
COMMENT | ************************************************************* |
COMMENT | * AUTHORS:  Andrea Parodi and Fulvio Rappa DATE: 25/9/1993    |
COMMENT | *                                                             |
COMMENT | * SUBJECT:  Sorted Steamroller (Modified)                     |
COMMENT | *                                                             |
COMMENT | * GETFOL VERSION:  October 1993                               |
COMMENT | *                                                             |
COMMENT | ************************************************************* |

COMMENT | Wolves, foxes, birds, caterpillars, are animals, and there are|
COMMENT | some of each of them. Caterpillars and snails drag.           |
COMMENT | Also there are some grains are plants.                        |
COMMENT | Every animal either likes to eat all plants or all animals    |
COMMENT | much smaller than itself that like to eat some plants.        |
COMMENT | Caterpillars and snail are much smaller than birds, which are |
COMMENT | much smaller than foxes, which in turn are much smaller than  |
COMMENT | wolves. Wolves do not like to eat foxes or grains, while birds|
COMMENT | like to eat caterpillar but not snail. Caterpillars and snails| 
COMMENT | like to eat some plants. Therefore there is an animal that    |
COMMENT | likes to eat a grain-eating animal.                           |

COMMENT | 1st CHANGE|
COMMENT | A new sort, DRAGGING, has been introduced.| 
COMMENT | ANIMAL is moregeneral than DRAGGING |
COMMENT | and DRAGGING is moregeneral than CATERPILLAR and SNAIL|
COMMENT | the sort DRAGGING has been introduced to simplify axioms |


COMMENT | SORT definition |
declare sort ANIMAL WOLF FOX BIRD CATERPILLAR SNAIL GRAIN PLANT DRAGGING;
moregeneral ANIMAL < WOLF FOX BIRD DRAGGING SNAIL >;
moregeneral DRAGGING < CATERPILLAR SNAIL >;
moregeneral GRAIN < PLANT >;


COMMENT | PREDCONSTs definition |
COMMENT | MUCHSMALLER(x,y) --> x is  Much smaller than y |
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
declare indvar d [DRAGGING];
declare indvar w [WOLF];

COMMENT | AXIOMs|

axiom aEsa&p : forall  a.(forall p.EAT(a,p) or  forall  a1.((MUCHSMALLER(a1,a)
and exists p.EAT(a1,p)) imp EAT(a,a1))) ;

COMMENT | 2nd CHANGE| 
COMMENT | the following axioms |
COMMENT | axiom forall c,b.MUCHSMALLER(c,b); |
COMMENT | axiom forall s,b.MUCHSMALLER(s,b); |

COMMENT | are substituted by |

axiom dMSb: forall d,b.MUCHSMALLER(d,b);

axiom bMSf : forall b,f.MUCHSMALLER(b,f);
axiom fMSw : forall f,w.MUCHSMALLER(f,w);
axiom wnEf : forall f,w.not EAT(w,f);
axiom wnEg : forall g,w.not EAT(w,g);
axiom bEc : forall b,c.EAT(b,c);
axiom bnEs : forall b,s.not EAT(b,s);

COMMENT | 3rd CHANGE| 
COMMENT | the following axioms |
COMMENT | axiom forall c. exists p.EAT(c,p) |
COMMENT | axiom forall s. exists p.EAT(s,p) |

COMMENT | are substituted by |

axiom dEp: forall d.exists p.EAT(d,p); 






COMMENT | CONCLUSION |

decide exists a.exists a1.exists g.(EAT(a,a1) and EAT(a1,g)) by 
aEsa&p dMSb bMSf fMSw wnEf wnEg bEc bnEs dEp using
nnf,reduce,skolemize,phexp ptaut;




