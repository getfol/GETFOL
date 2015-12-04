;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GETFOL version 2.001
;; Date: Tue Nov  9 19:00:19 MET 1993
;;
;; This    FOL file was modified in GETFOL version 2.001
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; FOL version 2.001
;; This file is an FOL source file: basic.cl
;; Date: Wed Oct 20 14:42:05 MET 1993
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

;************************************************************************;
;*                                                                      *;
;* This file builds HGKM on top of Common-Lisp as described             *;
;* in the HGKM Manual (version revised in Trento)                       *;
;*                                                                      *;
;* For informations about the following part's primitives and data      *;
;* structures refer to the manual "Trento HGKM", chapter 2.             *;
;*                                                                      *;
;************************************************************************;
;



;;;predicates and truth values
;************************************************************************;
;*                                                                      *;
;*                        PREDICATES                                    *;
;*                                                                      *;
;* In HGKM the boolean objects are TRUE and FALSE.                      *;
;*                                                                      *;
;************************************************************************;
;
(HGKM-DEF-CON TRUE  T)
(HGKM-DEF-CON FALSE NIL)
(HGKM-DEF-PAS EQ)




;;;
;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;*              H G K M    S Y M B O L S                                *;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
(HGKM-DEF-MAC SYMBOL? (L) (LIST 'SYMBOLP L))
(HGKM-DEF-MAC CHR2SYM (L)
   (LIST 'INTERN (LIST 'MAKE-ARRAY (LIST 'LENGTH L)
		       :ELEMENT-TYPE ''STRING-CHAR
		       :INITIAL-CONTENTS
		       (LIST 'MAPCAR '(FUNCTION INT-CHAR) L))))
(HGKM-DEF-MAC SETVAL (L M) (LIST 'SET L M))
(HGKM-DEF-MAC GETVAL (L) L)
(HGKM-DEF-MAC SETPROP (VAR VAL PROP) (LIST 'SETF (LIST 'GET VAR PROP) VAL))
(HGKM-DEF-MAC GETPROP (&REST L)
   (LIST 'IF (LIST 'SYMBOLP (CAR L)) (CONS 'GET L) NIL))
(HGKM-DEF-PAS REMPROP)


;;;
;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;*              H G K M    S T R I N G S                                *;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
(HGKM-DEF-MAC STRING? (L) (LIST 'STRINGP L))
(HGKM-DEF-MAC CHR2STR (L)
   (LIST 'MAKE-ARRAY (LIST 'LENGTH L)
	 :ELEMENT-TYPE ''STRING-CHAR
	 :INITIAL-CONTENTS (LIST 'MAPCAR '(FUNCTION INT-CHAR) L)))
;The following functions are not correctly defined yet.
(HGKM-DEF-MAC SETSTR (&REST L) (PRINC "SETSTR IS NOT DEFINED YET"))
(HGKM-DEF-MAC GETSTR (&REST L) (PRINC "GETSTR IS NOT DEFINED YET"))
(HGKM-DEF-MAC LENSTR (L) (LIST 'ARRAY-DIMENSION L 0)) 

;;;
;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;*              H G K M    N U M B E R S                                *;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
(HGKM-DEF-MAC INTEGER? (L) (LIST 'INTEGERP L))
(HGKM-DEF-MAC ZERO? (L) (LIST 'ZEROP L))
(HGKM-DEF-MAC POSITIVE? (L) (LIST '> L 0))
(HGKM-DEF-MAC NEGATIVE? (L) (LIST '< L 0))
(HGKM-DEF-MAC ADD1 (L) (LIST '1+ L))
(HGKM-DEF-MAC SUB1 (L) (LIST '1- L))
(HGKM-DEF-MAC CHR2INT (L) (LIST 'CVTCL2NUM L 0))

(HGKM-DEF-FUN CVTCL2NUM (L N)
  (IF (NULL L) N (CVTCL2NUM (CDR L) (+ (* 10 N) (- (CAR L) 48)))))



;;;
;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;*              H G K M    C H A R A C T E R S                          *;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
(HGKM-DEF-MAC CHARACTER? (L) (LIST 'NUMBERP L))
(HGKM-DEF-MAC SYM2CHR (L) (LIST 'EXPLODEN L))
(HGKM-DEF-MAC STR2CHR (L) (LIST 'EXPLODEN L))
(HGKM-DEF-MAC INT2CHR (L) (LIST 'EXPLODEN L))

(HGKM-DEF-FUN EXPLODEN (X)
  (PROG (S)
     (SETQ S (PRINC-TO-STRING X))
     (RETURN (EXPLODEN1 S NIL 0 (- (ARRAY-DIMENSION S 0) 1)))))

(HGKM-DEF-FUN EXPLODEN1 (X Y N LEN)
  (COND ((> N LEN) (REVERSE Y))
	(T (EXPLODEN1 X (CONS (CHAR-INT (CHAR X N)) Y) (+ 1 N) LEN))))


;;;
;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;*              H G K M    P A I R S                                    *;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
(HGKM-DEF-PAS CONS)
(HGKM-DEF-PAS CAR)
(HGKM-DEF-PAS CDR)
(HGKM-DEF-MAC PAIR? (L) (LIST 'LISTP L))
(HGKM-DEF-MAC ATOMIC? (L) (LIST 'ATOM L))
(HGKM-DEF-MAC SETCAR (L M) (LIST 'RPLACA L M))
(HGKM-DEF-MAC SETCDR (L M) (LIST 'RPLACD L M))


;;;
;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;*              H G K M    L I S T S                                    *;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
(HGKM-DEF-CON MTL NIL)
(HGKM-DEF-MAC MTL? (L) (LIST 'NULL L))
(HGKM-DEF-MAC LIST? (L) (LIST 'LISTP L))
(HGKM-DEF-MAC LCONS (L M) (LIST 'CONS L M))
(HGKM-DEF-PAS FIRST)
(HGKM-DEF-PAS REST)
(HGKM-DEF-MAC SETFIRST (L M) (LIST 'RPLACA L M))
(HGKM-DEF-MAC SETREST (L M) (LIST 'RPLACD L M))


;;;
;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;*              H G K M    E V A L U A T I N G   F O R M S              *;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
;Evaluating forms.
;
(HGKM-DEF-PAS QUOTE)
(HGKM-DEF-PAS IF)
(HGKM-DEF-PAS LET)
(HGKM-DEF-PAS SETQ)
(HGKM-DEF-PAS RETURN)
(HGKM-DEF-FUN NOP () (VALUES))
(HGKM-DEF-MAC IFN (A B C) (LIST 'IF A C B))
(HGKM-DEF-MAC SEQ (&REST L) (CONS 'PROGN L))
(HGKM-DEF-MAC PGM (&REST L) (APPEND (LIST 'PROG) L))
(HGKM-DEF-MAC BRT (L M) (LIST 'IF M (LIST 'GO L) 'NIL))
(HGKM-DEF-MAC BRF (L M) (LIST 'IFN M (LIST 'GO L) 'NIL))
(HGKM-DEF-MAC GOTO (L) (LIST 'GO L))

;;;
;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;*            F I R S T     L E V E L    C O N S T U C T O R S          *;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
;Constructors
;
;                           DEFLAM

;DEFLAM always allows to redefine a function.If the function has already
;been defined DEFLAM prints a warning message.

(EVAL-WHEN (EVAL LOAD COMPILE)
 (HGKM-DEF-MAC DEFLAM (NAME ARG BODY)
   (LIST 'EVAL-WHEN '(EVAL LOAD COMPILE)
      (LIST 'PROGN
       (LIST 'IF '(INFORMATION?)
        (LIST 'PROGN
         (LIST 'IF (LIST 'GET (LIST 'QUOTE NAME) ''LSP)
	    (LIST 'PROGN
		(LIST 'PRINC "Redefining  ")
		(LIST 'PRINC (LIST 'QUOTE NAME))
		(LIST 'TERPRI)
                (LIST 'SETF (LIST 'GET (LIST 'QUOTE NAME)''LSP) NIL)))
         (LIST 'SETF (LIST 'GET (LIST 'QUOTE NAME)''H-FUN)T)))
	(LIST 'DEFUN NAME ARG BODY)))))

;                           DEFMAC

;DEFMAC always allows to redefine a macro.If this macro has already
;been defined DEFMAC prints a warning message.

(EVAL-WHEN (EVAL LOAD COMPILE)
 (HGKM-DEF-MAC DEFMAC (NAME ARG BODY)
   (LIST 'EVAL-WHEN '(EVAL LOAD COMPILE)
      (LIST 'PROGN
       (LIST 'IF '(INFORMATION?)
        (LIST 'PROGN
         (LIST 'IF (LIST 'GET (LIST 'QUOTE NAME) ''LSP)
	    (LIST 'PROGN
		(LIST 'PRINC "Redefining  ")
		(LIST 'PRINC (LIST 'QUOTE NAME))
		(LIST 'TERPRI)
                (LIST 'SETF (LIST 'GET (LIST 'QUOTE NAME)''LSP) NIL)))
         (LIST 'SETF (LIST 'GET (LIST 'QUOTE NAME)''H-MAC)T)))
	(LIST 'DEFMACRO NAME ARG BODY)))))

;                           DEFSYS

;DEFSYS allows to redefine a function just if this function doesn't has already
;been defined using HGKM-DEF-* constructors. 

(EVAL-WHEN (EVAL LOAD COMPILE)
 (HGKM-DEF-MAC DEFSYS (NAME ARG BODY)
   (LIST 'EVAL-WHEN '(EVAL LOAD COMPILE)
    (LIST 'IF '(INFORMATION?)
     (LIST 'IF (LIST 'GET (LIST 'QUOTE NAME) ''LSP)
        (LIST 'PROGN
		(LIST 'PRINC "can not redefine ")
		(LIST 'PRINC (LIST 'QUOTE NAME))
		(LIST 'TERPRI))
	(LIST 'PROGN
                (LIST 'SETF (LIST 'GET (LIST 'QUOTE NAME)''H-FUN)T)
        	(LIST 'DEFUN NAME ARG BODY)))  
     (LIST 'DEFUN NAME ARG BODY)))))         

;                           DEFMACSYS

;DEFMACSYS allows to redefine a macro just if this macro doesn't has already
;been defined using HGKM-DEF-* constructors. 

(EVAL-WHEN (EVAL LOAD COMPILE)
 (HGKM-DEF-MAC DEFMACSYS (NAME ARG BODY)
   (LIST 'EVAL-WHEN '(EVAL LOAD COMPILE)
    (LIST 'IF '(INFORMATION?)
     (LIST 'IF (LIST 'GET (LIST 'QUOTE NAME) ''LSP)
        (LIST 'PROGN
		(LIST 'PRINC "can not redefine ")
		(LIST 'PRINC (LIST 'QUOTE NAME))
		(LIST 'TERPRI))
	(LIST 'PROGN
                (LIST 'SETF (LIST 'GET (LIST 'QUOTE NAME)''H-MAC)T)
	        (LIST 'DEFMACRO NAME ARG BODY)))    
     (LIST 'DEFMACRO NAME ARG BODY)))))  


;;;DEFSUB
;**************************************************************************
;*                                                                        *
;*     SYNTAX                                                             *
;*            DEFSUB ( NAME ARG BODY )                                    *
;*                                                                        * 
;*     DESCRIPTION                                                        *
;*            DEFSUB is a first level builder:it can work as a DEFLAM     *
;*            or as a DEFMAC.The behavior depends on the value of a       *
;*            global parameter (%DEBUG-MODE%).                            *
;*            Furthermore DEFSUB allows the subroutine being defined      *
;*            to be expanded as a macro during the                        *
;*            compilation and then declared as a function.                *
;*            This feature is active only when (DEBUG?) is NIL and        *
;*            (SUBR?) is true.                                            *
;*            The list of the names of the subroutines to be re-declared  *
;*            as functions at the end of the compilation is stored into   *
;*            the global variable %SUBR-LIST%. The argument list and the  *
;*            body of each of these subroutines are stored into the       *
;*            properties FUNARGS& and FUNBODY&, that are removed when the *
;*            subroutine is declared as function.                         *
;*                                                                        * 
;*                                                                        * 
;*     BUGS                                                               * 
;*            DEFSUB does not allow every option allowed by DEFLAM        * 
;*            or DEFMAC.                                                  *  
;*            ARG must contain only parameters and evenctually &REST      * 
;*            followed by a singol parameter (in this case it has the     * 
;*            same meaning as in DEFLAM).                                 * 
;*            DEFSUB does not allow recursion (you can think of the       * 
;*            conseguences in a macro expansion).                         * 
;*            DEFSUB works properly also with dotted pairs                * 
;*            (which must be quoted to be such).                          * 
;*                                                                        * 
;*     NOTES                                                              *
;*            When DEFSUB works as DEFMAC a DEFSUB-ed function cannot be  * 
;*            compiled (as we want). Guess why!!!!                        * 
;*                                                                        * 
;*            MACRO-BUILDER is a function that returns a macro which      *
;*            expands to the original function body                       * 
;*            This function has a kind of double                          *
;*            recursion:MAPCAR applies M_B. to every element of the       *
;*            list,and calls M_B if this element is a list too.           *
;*            If body is an atom M_B behavior depends on the function     *
;*            of this atom : if it is a parameter it needs not to         *
;*            be quoted;if it is the rest parameter it must be listed     *
;*            in this way (CONS 'LIST BODY);if it is a function name      *
;*            or a global variable it must be returned in this            *
;*            way (QUOTE BODY)                                            *
;*                                                                        * 
;*            Note that the order of loading and compiling fol's files    * 
;*            is important.When a function calls a macro that the         * 
;*            compiler has not founded yet,the macro will be always       * 
;*            interpreted.                                                * 
;*            We want all files containing DEFSUB definitions to be       * 
;*            loaded before than files calling functions DEFSUB-defined.  * 
;*                                                                        * 
;*            To fire the function definition at the end of the           *
;*            compilation the function SUBR-RESTORE to be called.         *
;*            If SUBR-RESTORE is called when (SUBR?) is not true the      *
;*            function signals this fact and does not perform any action. * 
;*                                                                        * 
;**************************************************************************




;                   DEFSUB

(EVAL-WHEN (EVAL LOAD COMPILE)
 (HGKM-DEF-MAC DEFSUB (NAME ARG BODY)
  (LIST 'EVAL-WHEN (LIST 'EVAL 'LOAD 'COMPILE)
   (LIST 'IF '(DEBUG?)
    (LIST 'DEFLAM NAME ARG BODY)
    (LIST 'IF '(SUBR?)
     (LIST 'IF (LIST 'MEMBER (LIST 'QUOTE NAME) '%SUBR-LIST%) '(NOP)
      (LIST 'PROGN
       (LIST 'SETQ '%SUBR-LIST% (LIST 'CONS (LIST 'QUOTE NAME) '%SUBR-LIST%))
       (LIST 'SETF (LIST 'GET (LIST 'QUOTE NAME) (LIST 'QUOTE 'FUNBODY&))
        (LIST 'QUOTE BODY))
       (LIST 'SETF (LIST 'GET (LIST 'QUOTE NAME) (LIST 'QUOTE 'FUNARGS&))
        (LIST 'QUOTE ARG))
       (LIST 'DEFMAC NAME ARG (MACRO-BUILDER ARG BODY))))
     (LIST 'DEFMAC NAME ARG (MACRO-BUILDER ARG BODY)))))))



;                          MACRO-BUILDER

(EVAL-WHEN (EVAL LOAD COMPILE)
 (HGKM-DEF-FUN MACRO-BUILDER (ARG BODY)
  (IF (LISTP BODY)
      (COND ((NULL BODY) NIL) 
  	  ((ATOM (CDR BODY)) (LIST 'QUOTE BODY))
            (T(CONS 'LIST (MAPCAR 'MACRO-BUILDER (MLIST ARG (LENGTH BODY))
  				BODY))))
      (IF (NOT (MEMBER BODY ARG))
  	(LIST 'QUOTE BODY) 
          (IF (NOT (EQUAL (CADR (MEMBER '&REST ARG)) BODY)) 
  	BODY
  	(LIST 'CONS ''LIST BODY))))))

;	        	   MLIST

(EVAL-WHEN (EVAL LOAD COMPILE)
   (HGKM-DEF-FUN MLIST (ELEM NR)
	(IF (ZEROP NR)  
	    NIL
	    (CONS ELEM (MLIST ELEM (- NR 1))))))


;                        SUBR-RESTORE

(EVAL-WHEN (EVAL LOAD COMPILE)
 (HGKM-DEF-FUN SUBR-RESTORE ()
  (PROGN
   (MAPCAR 'SUBR-RESTORE1 %SUBR-LIST%)
   (SETQ %SUBR-LIST% '()))))

;                        SUBR-RESTORE1

(EVAL-WHEN (EVAL LOAD COMPILE)
 (HGKM-DEF-FUN SUBR-RESTORE1 (NAME)
  (PROGN
   (EVAL (LIST 'DEFUN NAME (GET NAME 'FUNARGS&) (GET NAME 'FUNBODY&)))
   (REMPROP NAME 'FUNARGS&)
   (REMPROP NAME 'FUNBODY&)
   )))



;;;SET-FUN, 
;**************************************************************************
;*                                                                        *
;*     SYNTAX                                                             *
;*            SET-FUN         ( NAME ARG body )                           *
;*                                                                        * 
;*     DESCRIPTION                                                        *
;*            SET-FUN             are first level builders:they differ    *
;*            from DEFLAM and DEFMAC just because they evaluate their     *
;*            arguments.                                                  *
;*                                                                        * 
;*     BUGS                                                               * 
;*            SET-FUN does not work           properly at all:functions   * 
;*            and macros defined by them can not be compiled.             * 
;*            This is not a big problem because functions calling         * 
;*            these uncompiled forms can be compiled normally.            * 
;*                                                                        * 
;**************************************************************************

;			  SET-FUN


(EVAL-WHEN (EVAL LOAD COMPILE)
  (HGKM-DEF-FUN SET-FUN (L M N)
     (EVAL-WHEN (LOAD EVAL COMPILE)
       (PROGN
        (IF (INFORMATION?)
	   (PROGN (IF (GET L 'LSP)
                      (PROGN (PRINC "Redefining  ")
                             (PRINC L)
                             (TERPRI)
                             (SETF (GET L 'LSP) NIL)))
                  (SETF (GET L 'H-FUN) T)))
        (EVAL (LIST 'DEFUN L M N))))))


;;;
;************************************************************************;
;*                                                                      *;
;*                     F I R S T     L E V E L                          *;
;*                 A C C E S S    F U N C T I O N S                     *; 
;*                                                                      *;
;* ACCESS FUNCTIONS: the following 4 functions recognize  a function    *;
;* from a macro,and return the corresponding lambda-block.For details   *;
;* see the reference manual.                                            *
;*                                                                      *;
;* LSP is the property of HGKM-DEF-* defined functions and macros       *;
;* GET-FUN returns HOST and FUNCTION? T to them                         *;
;*                                                                      *;
;* H-FUN is the property of DEFLAM,DEFSYS and SET-FUN functions         *;
;* GET-FUN returns HGKM  and FUNCTION? T to them                        *;
;*                                                                      *;
;* H-MAC is the property of DEFMAC,DEFMACSYS                            *;
;* MACRO?  returns                  T to them                           *;
;* Note that we do not take into considerations definitions by          *;
;* HGKM-DEF-MAC. They are identical to definitions by lisp DEFMACRO     *;
;* (this does not happen with HGKM-DEF-FUN)                             *;
;*                                                                      *;
;* Note that FUNCTION? and MACRO? must be trapped if information is     *;
;* not available,to abort the execution if an error occurs.             *;
;*                                                                      *;
;************************************************************************;
;
;                           GET-FUN

(HGKM-DEF-FUN GET-FUN (L)
  (COND ((NOT (FBOUNDP L)) NIL)
	(T (PROG (DEF)
	     (SETQ DEF (SYMBOL-FUNCTION L))
	     (COND ((NOT (INFORMATION?)) (RETURN (LIST 'NO-INF L)))
	           ((COMPILED-FUNCTION-P DEF)
		    (RETURN (LIST 'HGKM L 'COMPILED DEF)))
		   ((GET L 'LSP) (RETURN (LIST 'HOST L)))
		   ((GET L 'H-FUN)
		    (RETURN (LIST 'HGKM L (CADDR DEF) (CADDDR DEF))))
		   (T (RETURN NIL)))))))

;                           FUNCTION?

(HGKM-DEF-FUN FUNCTION? (OBJ)
  (IF (INFORMATION?)
   (PROG (FUN)
    (SETQ FUN (GET-FUN OBJ))
    (COND ((EQ (CAR FUN) 'HGKM) (RETURN T))
	  ((EQ (CAR FUN) 'HOST) (RETURN T))
	  (T (RETURN NIL))))
;;;(PROGN
;;; (HGKM-PRINC "Information not available. Assuming that `")
;;; (HGKM-PRINC OBJ)
;;; (HGKM-PRINC "' is an HGKM function")
;;; (TERPRI) T)
T))

;                           MACRO?

(HGKM-DEF-FUN MACRO? (OBJ)
  (IF (INFORMATION?)
   (PROG (MAC)
      (SETQ MAC (GET-MAC OBJ))
      (COND ((EQ (CAR MAC) 'H-MAC) (RETURN T))
	    ((EQ (CAR MAC) 'HOST)  (RETURN T))
	    (T (RETURN NIL)))) 
;;;(PROGN
;;; (HGKM-PRINC "Information not available. Assuming that `")
;;; (HGKM-PRINC OBJ)
;;; (HGKM-PRINC "' is an HGKM macro") T)
T))

(HGKM-DEF-FUN GET-MAC (L)
  (COND ((NOT (FBOUNDP L)) (RETURN NIL))
    (T (PROG (DEF)
         (SETQ DEF (SYMBOL-FUNCTION L))
         (COND
           ((NOT (INFORMATION?)) (RETURN (LIST 'NO-INF L)))
           ((GET L 'LSP)  (RETURN (LIST 'HOST  L)))
           ((GET L 'H-MAC)(RETURN (LIST 'H-MAC L)))
           (T (RETURN NIL)) ) ) ) ) )

;
;Eval and apply
;
(HGKM-DEF-MAC HGKM-EVAL (L) (LIST 'EVAL L))
(HGKM-DEF-FUN HGKM-APPLY (L M) (APPLY (CADR L) M))



;;;
;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;*         E R R O R    H A N D L I N G                                 *;
;*                                                                      *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
; Error handling.
;

(HGKM-DEF-MAC TRAP (&REST FORM)
  (LIST (QUOTE PROG)
	(QUOTE (THROW-VALUE NO-ERROR FOL-VALUE))
	(LIST (QUOTE SETQ) (QUOTE THROW-VALUE)
	      (LIST (QUOTE CATCH) (QUOTE (QUOTE FOL-ERROR))
		    (QUOTE (SETQ NO-ERROR FALSE))
		    (LIST (QUOTE SETQ) (QUOTE FOL-VALUE) (CAR FORM))
		    (QUOTE (SETQ NO-ERROR TRUE))))
	(QUOTE (RETURN (IF NO-ERROR (LIST FOL-VALUE) THROW-VALUE)))))


(HGKM-DEF-MAC HGKM-ABORT (RESULT)
  (LIST 'THROW ''FOL-ERROR RESULT))

(HGKM-DEF-MAC ERROR-OCCURRED? (RESULT)
  (LIST 'ATOMIC? RESULT))

(HGKM-DEF-MAC TRAP-GET-RESULT (TRAP)
  (LIST 'CAR TRAP))
