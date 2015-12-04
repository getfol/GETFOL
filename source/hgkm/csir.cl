;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GETFOL version 2.001
;; Date: Tue Nov  9 19:00:22 MET 1993
;;
;; This    FOL file was modified in GETFOL version 2.001
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; FOL version 2.001
;; This file is an FOL source file: csir.cl
;; Date: Wed Oct 20 14:42:08 MET 1993
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

; ***************************************************************
; *                                                             *
; *               MAKE COMMONLISP CASE SENSITIVE                *  
; *                                                             *
; * This file contains the HGKM reader for identifiers which    *
; * makes HGKM case sensitive.                                  *
; *                                                             *
; * NOTE: the order of this Code must not be changed.           *
; *                                                             *
; * NOTE: interpreting this code can severely slow down the     *
; * HGKM. It should be always compiled, even when the rest      *
; * of the system is run interpretively.                        *
; *                                                             *
; ***************************************************************


; ***************************************************************
; *                                                             *
; * CHRTAB contains the information about the behaviour of all  *
; * the characters (i.e. whether they are identifiers or not).  *
; *                                                             *
; ***************************************************************

; CS-CHR is a variable containing the table of characters
; recognized by the reader.
;
(DEFVAR CS-CHR)

(DEFUN CHRTAB-INI (DIM VALS)
 (IF (NOT (= DIM (LENGTH VALS)))
  (BREAK "Mismatch between array dimensions and list length")
  (LET ((TAB (MAKE-ARRAY DIM)))
   (DO ((POS 0 (1+ POS))
        (ITEMS VALS (REST ITEMS)))
       ((NULL ITEMS))
       (SETF (AREF TAB POS) (FIRST ITEMS)))
   (SETQ CS-CHR TAB))))

(DEFMACRO CHRTAB-GET (POS) `(AREF CS-CHR ,POS))


; ***************************************************************
; *                                                             *
; * CSIR is the Case Sensitive Identifier Reader which is       *
; * activated to read symbols.                                  *
; *                                                             *
; ***************************************************************

(DEFCONSTANT    ID	  0)
(DEFCONSTANT NONID	  1)

(DEFMACRO SYM-MK (L)
 `(MULTIPLE-VALUE-BIND (SYM RES)
   (INTERN (MAKE-ARRAY (LENGTH ,L)
            :ELEMENT-TYPE 'STRING-CHAR
            :INITIAL-CONTENTS (MAPCAR (FUNCTION INT-CHAR) ,L)))
   SYM))


(DEFUN CSIR (STR CHR)
  (PROG (TOK END NEWEND CH)
    (SETQ TOK (LIST (CHAR-INT CHR)))
    (SETQ END TOK)
  L (SETQ CH (READ-CHAR STR NIL 'EOF-FLAG))
    (COND ((EQ CH 'EOF-FLAG)
           (RETURN (SYM-MK TOK)))
          ((= (CHRTAB-GET (CHAR-INT CH)) ID)
           (SETQ NEWEND (LIST (CHAR-INT CH)))
           (RPLACD END NEWEND)
           (SETQ END NEWEND)
           (GO L))
          (T
           (UNREAD-CHAR CH STR)
           (RETURN (SYM-MK TOK))))))

