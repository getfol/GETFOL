;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GETFOL version 2.001
;; Date: Tue Nov  9 19:52:35 MET 1993
;;
;; This    FOL file was modified in GETFOL version 2.001
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; FOL version 2.001
;; This file is an FOL source file: vlang.cl
;; Date: Wed Oct 20 10:46:20 MET 1993
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                          ;;
;;   Copyright (c) 1986-1987 by Richard Weyhrauch.  All rights reserved.    ;;
;;   Copyright (c) 1987-1988 by Fausto Giunchiglia.  All rights reserved.   ;;
;;                                                                          ;;
;;   This software is being provided to you, the LICENSEE, by Richard       ;;
;;   Weyhrauch and Fausto Giunchiglia, the AUTHORS, under certain rights    ;;
;;   and obligations.  By obtaining, using and/or copying this software,    ;;
;;   you indicate that you have read, understood, and will comply with      ;;
;;   the following terms and conditions:                                    ;;
;;                                                                          ;;
;;   THE AUTHORS MAKE NO REPRESENTATIONS OF WARRANTIES, EXPRESS OR          ;;
;;   IMPLIED.  By way of example, but not limitation, THE AUTHORS MAKE      ;;
;;   NO REPRESENTATIONS OR WARRANTIES OF MERCHANTABILITY OF FITNESS FOR     ;;
;;   ANY PARTICULAR PURPOSE OR THAT THE USE OF THE LICENSED SOFTWARE        ;;
;;   COMPONENTS OR DOCUMENTATION WILL NOT INFRINGE ANY PATENTS,             ;;
;;   COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS.                                ;;
;;                                                                          ;;
;;   The AUTHORS shall not be held liable for any direct, indirect or       ;;
;;   consequential damages with respect to any claim by LICENSEE or any     ;;
;;   third party on account of or arising from this Agreement or use of     ;;
;;   this software.  Permission to use, copy, modify and distribute this    ;;
;;   software and its documentation for any purpose and without fee or      ;;
;;   royalty is hereby granted, provided that the above copyright notice    ;;
;;   and disclaimer appears in and on ALL copies of the software and        ;;
;;   documentation, whether original to the AUTHORS or a modified           ;;
;;   version by LICENSEE.                                                   ;;
;;                                                                          ;;
;;   The name of the AUTHORS may not be used in advertising or publicity    ;;
;;   pertaining to distribution of the software without specific, written   ;;
;;   prior permission.  Notice must be given in supporting documentation    ;;
;;   that such distribution is by permission of the AUTHORS.  The AUTHORS   ;;
;;   make no representations about the suitability of this software for     ;;
;;   any purpose.  It is provided "AS IS" without express or implied        ;;
;;   warranty.  Title to copyright to this software and to any associated   ;;
;;   documentation shall at all times remain with the AUTHORS and LICENSEE  ;;
;;   agrees to preserve same.  LICENSEE agrees to place the appropriate     ;;
;;   copyright notice on any such copies.                                   ;;
;;                                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Language physical variables

(DEFVAR GETFOLSYM_COUNTER%)      ;system variable

; For the meaning of these variables please cfr symls.hgk
(DEFVAR CurSysSYMLS)                 ;The symls for shared symbols
(DEFVAR CurCxtSYMLS)                 ;The symls for context symbols

; Context dependent (switched)
(DEFVAR |Mostgeneral|)           ;The most general sort

; Shared between contexts
(DEFVAR TRUTHSORT)               ;The sort of Truth values
(DEFVAR |SysMostgeneral|)        ;The system most general sort
(DEFVAR |True|)                  ;The sentconst TRUE
(DEFVAR |False|)                 ;The sentconst FALSE
(DEFVAR |Negation|)              ;The connective not
(DEFVAR |Conjunction|)           ;The connective and
(DEFVAR |Disjunction|)           ;The connective or
(DEFVAR |Implication|)           ;The connective imp
(DEFVAR |Equivalence|)           ;The connective iff
(DEFVAR |Uniquant|)              ;The quantifier forall
(DEFVAR |Exiquant|)              ;The quantifier exists
(DEFVAR |Wffif|)                 ;The ifsym wffif
(DEFVAR |Trmif|)                 ;The ifsym trmif
(DEFVAR |Equality|)              ;The equality predicate



