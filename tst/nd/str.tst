COMMENT|**********************************************************|
COMMENT|                                                          |
COMMENT| This is a file of tests for structural inference rules   |
COMMENT|            "weaken", "contract" and "cut"                |
COMMENT|                                                          |
COMMENT|**********************************************************|


COMMENT|**********************************************************|
COMMENT|****  Definition of language and additional facts     ****|
COMMENT|**********************************************************|

declare sentconst A B C D;

assume A A A A B B C D ;

AXIOM aa : A;
AXIOM bb : B;
AXIOM cc : C;

andi 7 8;





COMMENT|**********************************************************|
COMMENT|****  test for a correct use of structural commands   ****|
COMMENT|**********************************************************|



COMMENT| ************ WEAKEN *********** |

COMMENT |use of weaken with assumptions|
COMMENT | (facts 10 to 16) |
weaken 1 by 1;
weaken 9 by 4;
weaken 9 by 7;
weaken 9 by 1 2 3 4 5 6 6 5 5;
weaken 1 by 4;
weaken 1 by 5;
weaken 1 by 2 3 4 5 5 5 1 1 6 7 8;

COMMENT |use of weaken with axioms|
COMMENT | (facts 17 to 18) |
weaken 5 by aa;
weaken bb by 1;

COMMENT |use of weaken with assumptions, axioms and facts|
COMMENT | (facts 19 to 22) |
weaken 1 by 9;
weaken 1 by 9 9;
weaken 9  by 9;
weaken aa by 5 5 9 9 bb bb;



COMMENT | ********** CONTRACT ********** |

COMMENT |various uses of contract|
COMMENT | (facts 23 to 28) |
ctc 13 by 1 1 1 1;
ctc 13 by 1 2 3 4 5 6;
ctc 13 by 1 2 3 4 5 6 7 8;
ctc 13 by 8 7 6;
ctc 1 by 1;
ctc 13 by 1 5;
  



COMMENT | *************  CUT  ********** |

COMMENT |uses of cut with no dependencies to keep |
COMMENT | (facts 29 to 63) |
cut aa 13;
cut bb 13;
cut 1 13;
cut 5 13;
cut 8 13;
cut 9 13;
cut 13 13;
cut 16 13;
cut aa 16;
cut bb 16;
cut 1 16;
cut 5 16;
cut 8 16;
cut 9 16;
cut 13 16;
cut 16 16;
cut aa aa;
cut aa bb;
cut 1 aa ;
cut 16 aa;
cut aa 1;
cut bb 1;
cut 1 1;
cut 5 1;
cut 8 1;
cut 9 1;
cut 13 1;
cut 16 1;
cut 15 11;
cut 11 15;
cut 1 11;
cut aa 11;
cut 2 15;
cut 2 23;
cut bb 23;

COMMENT |uses of cut with some dependencies to keep |
COMMENT | (facts 64 to 71) |
cut aa 16 keep 1;
cut aa 16 keep 1 1;
cut aa 16 keep 4 3 2 1;
cut aa 16 keep 4  2 1 1 2 4 1;
cut aa 16 keep 1 2 3 4;
cut 1 16 keep 1;
cut 1 16 keep 1 2;
cut 1 16 keep 1 1 ;




COMMENT|**********************************************************|
COMMENT|****         tests for possible input errors          ****|
COMMENT|**********************************************************|

COMMENT| Here is a list of uncorrect commands with relative error messages |



COMMENT | *************  CUT  ********** |

COMMENT| cut aa 16 keep 1 16;|
COMMENT| All the dependencies to keep must be assumptions |

COMMENT| cut aa 16 keep 1 aa; |
COMMENT| All the dependencies to keep must be assumptions |

COMMENT| cut aa 16 keep 1 1 2 aa 16 1; |
COMMENT| All the dependencies to keep must be assumptions |

COMMENT| cut aa 11 keep 1 6 16; |
COMMENT| All the dependencies to keep must be assumptions |

COMMENT| cut aa 11 keep 1 5 6; |
COMMENT| The fact must depend on all the dependencies to keep |

COMMENT| cut aa 11 keep 5 6; |
COMMENT| The fact must depend on all the dependencies to keep |

COMMENT| cut aa 11 keep 6; |
COMMENT| The fact must depend on all the dependencies to keep |

COMMENT| cut aa 16 keep 1 2 8; |
COMMENT| The assumptions to keep must have the same wff of the fact |

COMMENT| cut aa 16 keep 1 5; |
COMMENT| The assumptions to keep must have the same wff of the fact |



COMMENT | *********  CONTRACT  ********* |


COMMENT| ctc 1 by 5; |
COMMENT| The fact must depend on all the dependencies to keep |

COMMENT| ctc 13 by 14; |
COMMENT| All the dependencies to keep must be assumptions |

COMMENT| ctc 1 by 5 14; |
COMMENT| All the dependencies to keep must be assumptions |

COMMENT| ctc aa by 1; |
COMMENT| The fact must depend on all the dependencies to keep |

COMMENT| ctc 1 by aa; |
COMMENT| All the dependencies to keep must be assumptions |

COMMENT| ctc 1 by bb; |
COMMENT| All the dependencies to keep must be assumptions |

