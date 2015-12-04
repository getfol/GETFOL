reset;
COMMENT | ************************************************************* |
COMMENT | * AUTHOR:   Schubert                   DATE:  around 1978   * |
COMMENT | *                                                           * |
COMMENT | * SUBJECT:  Steamroller                                     * |
COMMENT | *                                                           * |
COMMENT | * GETFOL VERSION:  October 1993                             * |
COMMENT | *                                                           * |
COMMENT | ************************************************************* |

COMMENT | Wolves, foxes, birds, caterpillars, are animals, and there are|
COMMENT | some of each of them. Caterpillars and snail drag.            |
COMMENT | Also there are some grains are plants.                        |
COMMENT | Every animal either likes to eat all plants or all animals    |
COMMENT | much smaller than itself that like to eat some plants.        |
COMMENT | Caterpillars and snail are much smaller than birds, which are |
COMMENT | much smaller than foxes, which in turn are much smaller than  |
COMMENT | wolves. Wolves do not like to eat foxes or grains, while birds|
COMMENT | like to eat caterpillar but not snail. Caterpillars and snails| 
COMMENT | like to eat some plants. Therefore there is an animal that    |
COMMENT | likes to eat a grain-eating animal.                           |

declare predconst ANIMAL WOLF FOX BIRD CATERPILLAR SNAIL GRAIN PLANT 1;

COMMENT | PREDCONSTs definition |

COMMENT | MUCHSMALLER(x,y) --> x is Much smaller than y |
COMMENT | EAT(x,y) --> x Eats y |

declare predconst EAT MUCHSMALLER 2;

COMMENT | INDVARs definition |

declare indvar x y z ;

COMMENT | AXIOMs|
axiom wISa : forall x.(WOLF(x) imp ANIMAL(x)) and exists x.WOLF(x);
axiom fISa : forall x.(FOX(x) imp ANIMAL(x)) and exists x.FOX(x);
axiom bISa : forall x.(BIRD(x) imp ANIMAL(x)) and exists x.BIRD(x);
axiom cISa : forall x.(CATERPILLAR(x) imp ANIMAL(x)) and exists x.CATERPILLAR(x);
axiom sISa : forall x.(SNAIL(x) imp ANIMAL(x)) and exists x.SNAIL(x);
axiom gISp : exists x.GRAIN(x) and forall x.(GRAIN(x) imp PLANT(x));
axiom aEsa&p : forall x.(ANIMAL(x) imp (forall y.(PLANT(y) imp EAT(x,y)) or
       forall y.((ANIMAL(y) and MUCHSMALLER(y,x) and exists z.(PLANT(z) and
EAT(y,z))) imp EAT(x,y))));
axiom scMSb : forall x,y.((BIRD(y) and (SNAIL(x) or CATERPILLAR(x))) imp
MUCHSMALLER(x,y)); 
axiom bMSf: forall x,y.((BIRD(x) and FOX(y)) imp MUCHSMALLER(x,y));
axiom fMSw : forall x,y.((FOX(x) and WOLF(y)) imp MUCHSMALLER(x,y));
axiom  wnWfg : forall x,y.((WOLF(x) and (FOX(y) or GRAIN(y))) imp not EAT(x,y));
axiom bEc :  forall x,y.((BIRD(x) and CATERPILLAR(y)) imp EAT(x,y));
axiom bnEs : forall x,y.((BIRD(x) and SNAIL(y)) imp not EAT(x,y));

axiom c&sEp : forall x.((CATERPILLAR(x) or SNAIL(x)) imp exists y.(PLANT(y) and
EAT(x,y)));  

COMMENT | CONCLUSION |

decide exists x,y.(ANIMAL(x) and ANIMAL(y) and exists z.(GRAIN(z) and
EAT(y,z) and EAT(x,y))) 
by wISa fISa bISa cISa  sISa gISp aEsa&p scMSb bMSf fMSw wnWfg bEc bnEs
c&sEp  using nnf reduce skolemize phexp ptaut;








