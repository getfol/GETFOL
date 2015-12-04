;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; FOL version 2.001
;; This file is an FOL source file: hgkmio.cl
;; Date: Wed Oct 20 14:42:16 MET 1993
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

;*****************************************************************
;*								 *
;* This file contains the basic  hgkm i/o for UNIX Common LISP.	 *
;*								 *
;* HGKM uses channels implemented on CL streams.                 *
;* TTY I-O is done using the std CL I-O bidirectional stream.    *
;* Two kinds of data can be exchanged via file I-O:
;*	- s-expressions                                          *
;*	- characters                                             *
;* 4 kinds of channels can be opened, combining the different    *
;* data and directions.                                          *
;*                                                               *
;*                                                               *
;*                                                               *
;* CHAN-LIST is an association list in which each file object    *
;* is associated with a list (DIRECTION DEVICE NAME)             * 
;* This is implemented as                                        *
;*    CAR = a monodirectional channel      	 		 *
;*    CDR = (DIRECTION DEVICE FNAME)                             *
;*								 *
;*								 *
;*****************************************************************
;



;*****************************************************************
;*                                                               *
;* PRIMITIVES FOR OPENING CHANNELS:                              *
;*                                                               *
;* HGKM-ISOPEN: INPUT SEXPRESSION DISC CHANNEL                   *
;*                                                               *
;* HGKM-ICOPEN: INPUT CHARACTER   DISC CHANNEL                   *
;*                                                               *
;* HGKM-OSOPEN: OUTPUT SEXPRESSION DISC CHANNEL                  *
;*                                                               *
;* HGKM-OCOPEN: OUTPUT CHARACTER   DISC CHANNEL                  *
;*                                                               *
;* TTY-IOPEN: INPUT TERMINAL CHANNEL                             *
;*                                                               *
;* TTY-OOPEN: OUTPUT TERMINAL CHANNEL                            *
;*                                                               *
;*                                                               *
;*****************************************************************

(HGKM-DEF-FUN HGKM-ISOPEN (FNAME)
 (PROG (CHANNEL)
  (SETQ CHANNEL
   (OPEN FNAME :DIRECTION :INPUT
               :IF-DOES-NOT-EXIST NIL
;;             :ELEMENT-TYPE :DEFAULT
))
  (COND 
   ((NULL CHANNEL) (HGKM-ABORT 'NO-SUCH-FILE)) 
   (T (PROGN
       (SETQ CHAN-LIST (CONS (LIST CHANNEL 'IN 'DSK 'SEXP FNAME) CHAN-LIST))
       (RETURN CHANNEL))))))

(HGKM-DEF-FUN HGKM-ICOPEN (FNAME)
 (PROG (CHANNEL)
  (SETQ CHANNEL
   (OPEN FNAME :DIRECTION :INPUT
               :IF-DOES-NOT-EXIST NIL
               :ELEMENT-TYPE 'STRING-CHAR))
  (COND 
   ((NULL CHANNEL) (HGKM-ABORT 'NO-SUCH-FILE)) 
   (T (PROGN
       (SETQ CHAN-LIST (CONS (LIST CHANNEL 'IN 'DSK 'CHR FNAME) CHAN-LIST))
       (RETURN CHANNEL))))))

(HGKM-DEF-FUN HGKM-OSOPEN (FNAME)
 (PROG (CHANNEL)
  (SETQ CHANNEL
   (OPEN FNAME :DIRECTION :OUTPUT
               :IF-EXISTS :NEW-VERSION
;;             :ELEMENT-TYPE :DEFAULT
   ))
  (COND 
   ((NULL CHANNEL) (HGKM-ABORT 'NO-SUCH-FILE)) 
   (T (PROGN
       (SETQ CHAN-LIST (CONS (LIST CHANNEL 'OUT 'DSK 'CHR FNAME) CHAN-LIST))
       (RETURN CHANNEL))))))

(HGKM-DEF-FUN HGKM-OCOPEN (FNAME)
 (PROG (CHANNEL)
  (SETQ CHANNEL
   (OPEN FNAME :DIRECTION :OUTPUT
               :IF-EXISTS :NEW-VERSION
               :ELEMENT-TYPE 'STRING-CHAR))
  (COND 
   ((NULL CHANNEL) (HGKM-ABORT 'NO-SUCH-FILE)) 
   (T (PROGN
       (SETQ CHAN-LIST (CONS (LIST CHANNEL 'OUT 'DSK 'CHR FNAME) CHAN-LIST))
       (RETURN CHANNEL))))))


(HGKM-DEF-FUN TTY-IOPEN () *TERMINAL-IO*)

(HGKM-DEF-FUN TTY-OOPEN () *TERMINAL-IO*)



;*****************************************************************
;*                                                               *
;* THE PRIMITIVE FOR CLOSING CHANNELS:                           *
;*                                                               *
;*                                                               *
;*****************************************************************
;This function must be called by a trap function
;
; NOTE that the selected channels are always restored to the standard
; ones. This might give problems (see hgkmio.hgk).

(HGKM-DEF-FUN HGKM-CLOSE (CHAN)
 (COND
  ((EQ CHAN *TERMINAL-IO*) NIL)
   (T (PROG (CHAN-STATUS)
       (SETQ CHAN-STATUS (ASSOC CHAN CHAN-LIST))
       (IF (NULL CHAN-STATUS)
        (HGKM-ABORT 'CLOSING-NON-EXISTING-CHANNEL) 
        (PROGN 
         (SETQ CHAN-LIST (SET-DIFFERENCE CHAN-LIST (LIST CHAN-STATUS))) 
         (CLOSE CHAN)
         (IF (EQ (CADR CHAN-STATUS) 'IN)
          (SETQ SELECTED-INPUT STANDARD-INPUT)
          (SETQ SELECTED-OUTPUT STANDARD-OUTPUT)))))))) 


;			CHANNEL-GET-FNAME
;
;CHANNEL-GET-FNAME returns the name of the file corresponding
;to the channel CHAN. 

(HGKM-DEF-FUN CHANNEL-GET-FNAME (CHAN) (CAR (LAST (ASSOC CHAN CHAN-LIST))))



;
;************************************************************************;
;*                                                                      *;
;* THE CONSTANT FOR THE END OF FILE IN HGKM                             *;
;*                                                                      *;
;************************************************************************;

(HGKM-DEF-CON $HGKM-EOF$ '$EOF$)

;************************************************************************;
;*                                                                      *;
;* READING AND WRITING OVER EXPLICITLY SPECIFIED CHANNELS               *;
;*                                                                      *;
;************************************************************************;

;			CHAN-CHI
;
;This function reads a byte from the specified (character) input.
;This function must be called by a trap function
;

(HGKM-DEF-FUN CHAN-CHI (CHAN)
 (LET ((CH (READ-CHAR CHAN NIL $HGKM-EOF$)))
  (IF (EQ CH $HGKM-EOF$) (HGKM-ABORT $HGKM-EOF$) (CHAR-INT CH))))


;			CHAN-CHO
;
;This function writes a byte on the selected (character) output.

(HGKM-DEF-FUN CHAN-CHO (CHAR CHAN) (WRITE-CHAR (INT-CHAR CHAR) CHAN))


;			CHAN-READ
;
;This function reads an s-expression from the specified (s-exp) channel
;
;This function must be called by a trap function

(HGKM-DEF-MAC CHAN-READ (CHAN)
 `(IF (EQ ,CHAN STANDARD-INPUT) 
   (READ) 
   (LET ((OBJ (READ ,CHAN NIL $HGKM-EOF$)))
    (IF (EQ OBJ $HGKM-EOF$) (HGKM-ABORT $HGKM-EOF$) OBJ))))


;			CHAN-PRINC
;
;This function prints an object on the specified (s-exp) channel
;No EOLN is added.

(HGKM-DEF-MAC CHAN-PRINC (OBJ CHAN) `(PRINC ,OBJ ,CHAN))


;			CHAN-CRLF
;
;This function appends a EOLN to the specified (s-exp) channel.

(HGKM-DEF-MAC CHAN-CRLF (CHAN) `(TERPRI ,CHAN))


;
;************************************************************************;
;*                                                                      *;
;* READING AND WRITING OVER SELECTED CHANNELS                           *;
;*                                                                      *;
;************************************************************************;


;			SELECT    
;Usage:
;     (SELECT CHANNEL).
; SELECT does not return a value; it updates the global variables 
; SELECTED-INPUT and SELECTED-OUTPUT, which are also used by the
; functions performing I-O without explicit specification of
; channels.

(HGKM-DEF-FUN SELECT (CHANNEL)
 (PROG (CHAN-STATUS)
  (SETQ CHAN-STATUS (ASSOC CHANNEL CHAN-LIST))
  (IF CHAN-STATUS 
   (IF (EQ (CADR (ASSOC CHANNEL CHAN-LIST)) 'OUT)
    (SETQ SELECTED-OUTPUT CHANNEL)
    (SETQ SELECTED-INPUT CHANNEL)))))  


;			HGKM-CHI
;
;This function reads a byte from the selected (char) input.
;
;This function must be called by a trap function

(HGKM-DEF-FUN HGKM-CHI ()
 (LET ((CH (READ-CHAR SELECTED-INPUT NIL $HGKM-EOF$)))
  (IF (EQ CH $HGKM-EOF$) (HGKM-ABORT $HGKM-EOF$) (CHAR-INT CH))))


;			HGKM-CHO
;
;This function writes a byte on the selected (char) output.

(HGKM-DEF-FUN HGKM-CHO (CH) (WRITE-CHAR (INT-CHAR CH) SELECTED-OUTPUT))


;			HGKM-READ
;
;If SELECTED-INPUT is EQ to STANDARD-INPUT there is no need of taking care of
;$EOF$ since STANDARD-INPUT is the keyboard
;This function must be called by a trap function

(HGKM-DEF-MAC HGKM-READ ()
 '(IF (EQ SELECTED-INPUT STANDARD-INPUT) 
   (READ) 
   (LET ((OBJ (READ SELECTED-INPUT NIL $HGKM-EOF$)))
    (IF (EQ OBJ $HGKM-EOF$) (HGKM-ABORT $HGKM-EOF$) OBJ))))


;			HGKM-PRINC

(HGKM-DEF-MAC HGKM-PRINC (OBJ) `(PRINC ,OBJ SELECTED-OUTPUT))


;			CRLF
;
;This function appends a EOLN to the selected output.

(HGKM-DEF-MAC CRLF () '(TERPRI SELECTED-OUTPUT))


;************************************************************************;
;*                                                                      *;
;*                                                                      *;
;*             INIT HGKM I/O                                            *;
;*                                                                      *;
;*                                                                      *;
;************************************************************************;
;
;Initialize I/O.
;
(HGKM-DEF-FUN HGKM-INITIO ()
 (SEQ
  (SETQ CHAN-LIST NIL)
  (SETQ STANDARD-INPUT  (TTY-IOPEN))
  (SETQ STANDARD-OUTPUT (TTY-OOPEN))
  (SETQ SELECTED-INPUT  STANDARD-INPUT)
  (SETQ SELECTED-OUTPUT STANDARD-OUTPUT)))


(HGKM-INITIO)
