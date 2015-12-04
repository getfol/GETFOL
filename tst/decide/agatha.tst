reset;
COMMENT | Who killed Aunt Agatha ? ... a problem by Len Schubert  |

declare predconst L 1;

COMMENT | L(x) stands for : x lives in Dreadsbury Mansion ... |

declare predconst K 2;

COMMENT | K(x,y) stands for : x killed y ... |

declare predconst H 2;

COMMENT | H(x,y) stands for : x hates y |

declare predconst R 2;

COMMENT | R(x,y) stands for : x is richer than y |

declare indconst A,B,C;

COMMENT | starring |
COMMENT | A as Aunt Agatha |
COMMENT | B as The Butler  |
COMMENT | C as Charles     |

declare indvar x,y;

COMMENT | The facts :      |

assume exists x.(L(x) and K(x,A));

COMMENT  | someone who lives in Dreadsbury Mansion |
COMMENT  | killed  Aunt Agatha ...                 |

assume L(A) and L(B) and L(C);

COMMENT  | A.A., the butler and Charles live in D.M. |

assume forall x. (L(x) imp ((x = A) or (x = B) or (x = C))) ;

COMMENT  | No one else lives in Dreadsbury Mansion |

assume forall y,x. K(x,y) imp H(x,y);

COMMENT  | A killer always hates his victim ... |

assume forall x,y. (K(x,y) imp not R(x,y));

COMMENT  | A killer is never richer than his victim |
COMMENT  | ( is it true ? ) |

assume forall x. (H(A,x) imp not H(C,x));

COMMENT  | Charles hates no one that Aunt Agatha hates |

assume forall x. ((not (x = B)) imp H(A,x));

COMMENT  | Agatha hates everyone except the butler |

assume forall x. ((not R(x,A)) imp H(B,x));

COMMENT  | The butler hates everyone who is |
COMMENT  | not richer than Aunt Agatna      |

assume forall x.(H(A,x) imp H(B,x));

COMMENT  | The butler hates everyone Agatha hates |

assume forall x.exists y. not H(x,y);

COMMENT | No one hates everyone |

assume not (A = B);

COMMENT  | Agatha is not the butler ! |

COMMENT | The Conclusion ... (getfol running in sherlock-mode) |

decide  K(A,A)  by  ^11:^1  using nnf,reduce,skolemize,phexp,ptauteq;

COMMENT  | Aunt Agatha killed herself ! |
COMMENT  | (it was not so obvious, watson ...) |









