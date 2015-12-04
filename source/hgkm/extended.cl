;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GETFOL version 2.001
;; Date: Tue Nov  9 19:00:23 MET 1993
;;
;; This    FOL file was modified in GETFOL version 2.001
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; FOL version 2.001
;; This file is an FOL source file: extended.cl
;; Date: Wed Oct 20 14:42:10 MET 1993
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

; ************************************************************************
; *                                                                      *
; *  This file contains some useful HGKM functions defined in LISP.      *
; *  These function are part of extended HGKM, as defined in the manual  *
; *  "HGKM revised version".                                             *
; *                                                                      *
; *  All the definitions made here are macros on top of lisp.            *
; *  This has been done to speed up HGKM without losing readability      *
; *  and portability.                                                    *
; *                                                                      *
; ************************************************************************
;


;;;; Declaring global variables and constants
; *****************************************************************
; *                                                               *
; *  DEFVAR and DEFCONSTANT behave like the common lisp forms:    *
; *                                                               *
; *    (DEFVAR      <VARIABLE> [ <INITIAL-VALUE> ])               *
; *    (DEFCONSTANT <CONSTANT> <VALUE>)                           *
; *                                                               *
; *****************************************************************

(HGKM-DEF-PAS DEFVAR)
(HGKM-DEF-PAS DEFCONSTANT)
 

;;;; Extending the evaluation syntax: MAPCAR.
; *****************************************************************
; *                                                               *
; *  The following function has been defined to substitute the    *
; *  macro FOR-COLLECT which wasn't wroking correctly.            *
; *                                                               *
; *****************************************************************
;
(HGKM-DEF-PAS MAPCAR)
 

;;;;<characters>
; ************************************************************************
; *                                                                      *
; *  (ASCII ...)                                                         *
; *  (SYM-INTERN ...)                                                    *
; *  (MAKE-UNINTERNED ...)                                               *
; *  (SYM-GETCHRFIRST ...)                                               *
; *                                                                      *
; ************************************************************************
;
(HGKM-DEF-FUN ASCII (X) (SYM-INTERN (CHR2SYM (LIST X))))
(HGKM-DEF-FUN SYM-INTERN (X) (INTERN (PRINC-TO-STRING X)))
(HGKM-DEF-FUN MAKE-UNINTERNED (X) (MAKE-SYMBOL (CHR2STR (SYM2CHR X))))
(HGKM-DEF-MAC SYM-GETCHRFIRST (L) (LIST 'CAR (LIST 'EXPLODEN L)))
  

;;;;<functional truth values and additional connectives>
; ************************************************************************
; *                                                                      *
; *  (NOT ...)                                                           *
; *  (AND ...)                                                           *
; *  (OR ...)                                                            *
; *                                                                      *
; ************************************************************************
;
(DEFCONSTANT TVAL T)
(DEFCONSTANT FVAL NIL)

(HGKM-DEF-PAS NOT)
(HGKM-DEF-PAS AND)
(HGKM-DEF-PAS OR)

;;;;<integers> 
; *****************************************************************
; *                                                               *
; * Note that INTEQ (the integer equality predicate) must be used *
; * insted of EQ (the object equality) when compiling because     *
; * some CL compiler substitute the variable n (where n goes from *
; * -1024 to 1023), which evaluates to the integer n, with its    *
; * actual value. This can create unexpected behaviours which are *
; * very difficult to detect and fix. Be careful!                 *
; *                                                               *
; *****************************************************************
;
(HGKM-DEF-MAC MINUS (L) (LIST '- 0 L))
(HGKM-DEF-MAC PLUS (&REST L) (CONS '+ L))
(HGKM-DEF-MAC DIFFERENCE (&REST L) (CONS '- L))
(HGKM-DEF-MAC TIMES (&REST L) (CONS '* L))
(HGKM-DEF-MAC QUOTIENT (A B) (LIST 'TRUNCATE A B))
(HGKM-DEF-MAC REMAINDER (A B) (LIST 'REM A B))
(HGKM-DEF-MAC INTEQ (A B) (LIST '= A B))
(HGKM-DEF-MAC LT (A B) (LIST '< A B))
(HGKM-DEF-MAC LE (A B) (LIST '<= A B))
(HGKM-DEF-MAC GT (A B) (LIST '> A B))
(HGKM-DEF-MAC GE (A B) (LIST '>= A B))
(HGKM-DEF-FUN NATNUM (X) (AND (INTEGER? X) (GE X 0) ))


;;;;<lisp-list>
; *********************************************************
; *                                                       *
; *  (LIST ....)                                          *
; *  (EQUAL ...)                                          *
; *  (COPY ....)                                          *
; *  (LENGTH [list])                                      *
; *    Returns the length of list.                        *
; *  (HGKM-MEMBER [obj][list])                            *
; *    Like the CL MEMBER; the equality test is EQUAL.    *
; *  (HGKM-MEMQ [obj][list])                                   *
; *    Like HGKM-MEMBER, but with EQ test.                *
; *      (HGKM-MEMQ '(C D) ((A B)(C D) E)) ==> FALSE           *
; *  (APPEND ...)                                         *
; *  (UNION ...)                                          *
; *  (REVERSE [list])                                     *
; *    Returns the reverse of the top level of list.      *
; *  (SUBST [obj1][obj2][obj3])                           *
; *    Substitutes obj1 to every EQUAL occurrence of obj2 *
; *    in obj3.                                           *
; *    (SUBST MTL MTL X) is useful for creating a copy of *
; *    the list X only in MACLISP, not in CL: in fact CL  *
; *    doesn't guarantee the S-expr to be copied.         *
; *                                                       *
; *  (CL-ASSOC ...)                                       *
; *    The usual Common Lisp ASSOC: it tests with EQ.     *
; *  (HGKM-ASSOC ...)                                     *
; *    The same as CL-ASSOC, but it tests with EQUAL.     *
; *                                                       *
; *  (SECOND [list])			                          *
; *    Returns the second element of list.                *
; *  (LAST [list])		                                  *
; *    As in common lisp: it returns the last cons        *
; *    of list.                                           *
; *  (HGKM-NTH [int][list])                               *
; *    HGKM-NTH returns the int-th element of list. Note  *
; *    that int must be positive, otherwise an error      *
; *    occurs.                                            *
; *  (NCONC ...)                                          *
; *                                                       *
; *********************************************************
;    
(HGKM-DEF-PAS LIST)
(HGKM-DEF-PAS EQUAL)
(HGKM-DEF-FUN COPY (X) (PROG (Y) (SETQ Y (GENSYM)) (RETURN (COPY-TREE X))))
(HGKM-DEF-PAS LENGTH)
(HGKM-DEF-MAC HGKM-MEMBER (A B) (LIST 'MEMBER A B :TEST '(FUNCTION EQUAL)))
(HGKM-DEF-MAC HGKM-MEMQ (A B) (LIST 'MEMBER A B :TEST '(FUNCTION EQ)))
(HGKM-DEF-PAS APPEND)
(HGKM-DEF-PAS UNION)
(HGKM-DEF-PAS REVERSE)
(HGKM-DEF-PAS SUBST)

(HGKM-DEF-MAC HGKM-ASSOC (A B) (LIST 'ASSOC A B :TEST '#'EQUAL))
(HGKM-DEF-MAC CL-ASSOC (A B) (LIST 'ASSOC A B :TEST '#'EQ)) 

(HGKM-DEF-PAS SECOND)
(HGKM-DEF-PAS LAST)
(HGKM-DEF-MAC HGKM-NTH (L M) (LIST 'NTH (LIST '- L 1) M))
(HGKM-DEF-PAS NCONC)


;;;;<arrays>
; *****************************************************************
; *                                                               *
; * The macro definition of arrays is uncomplete because a to     *
; * define a TUPLE as a LISP array you must define also a symbol  *
; * with the same name as the array and have it evaluated to the  *
; * actual array (ARRAYCALL ???).                                 *
; *                                                               *
; *  (TUPLE [name][len])                                          *
; *    Sets the value of the variable name to be an array of      *
; *    length len.                                                *
; *  (SETTUP [array][index][data])                                *
; *    Sets the index-th entry in array to data destroying        *
; *    the previous information.                                  *
; *  (GETTUP [array][index])                                      *
; *    Returns the data stored in array at the position indexed   *
; *    by index.                                                  *
; *                                                               *
; *****************************************************************
;
(HGKM-DEF-MAC TUPLE (L M) (LIST 'SETQ L (LIST 'MAKE-ARRAY M)))
(HGKM-DEF-MAC GETTUP (L M) (LIST 'AREF L M))
(HGKM-DEF-MAC SETTUP (L M N) (LIST 'SETF (LIST 'AREF L M) N))
