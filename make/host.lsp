;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GETFOL version 2.001
;; Date: Mon Nov 22 19:23:56 MET 1993
;;
;; This    FOL file was modified in GETFOL version 2.001
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; fol version 2.001
;; This file is an FOL source file: host.lsp
;; Date: Tue Nov  9 17:39:20 MET 1993
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

;*************************************************************************;
;                                                                         ;
;                              host.lsp                                   ;
;                                                                         ;
;*************************************************************************;

; if lucid is being used, load this file in the package "USER"
#+LUCID (IN-PACKAGE 'USER)

;*************************************************************************;
;                                                                         ;
;    Change the value of the following global variables according the     ;
;    following criteria:                                                  ;
;                                                                         ;
;       %HOME-DIR% is to be set to the value of the absolute pathname     ;
;                  of the directory where the distribution package        ;
;                  has been downloaded.                                   ;
;                                                                         ;
;       %PATHNAME-SEPARATOR% is to be set to the character which is used  ;
;                  by the local operating system to build the pathname.   ;
;                  Default value is "/", the character used by unix.      ;
;                                                                         ;
;*************************************************************************;

; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; !!!!!!  THE VALUE OF THE FOLLOWING GLOBAL VARIABLES ARE THE ONLY  !!!!!!
; !!!!!!  THINGS THAT ARE TO BE CHANGED IN ORDER TO INSTALL GETFOL  !!!!!!
; !!!!!!                      ON YOUR SYSTEM                        !!!!!!
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(SETQ %HOME-DIR% "/home/tarski/staff/getfol/getfol-sep94")
(SETQ %PATHNAME-SEPARATOR% "/")

; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


;*************************************************************************;
;                                                                         ;
;   THE FUNCTION FOR BUILDING A PATH NAME                                 ;
;                                                                         ;
;     We assume that a path name is built by concatenating strings.       ;
;     Each string is separated by a path name separator, which is defined ;
;     in the variable %PATHNAME-SEPARATOR%                                ;
;                                                                         ;
;     The default definition of PATH-CONCAT can be used under             ;
;     unix operating system, DOS operating system and Macintosh operating ;
;     system                                                              ;
;                                                                         ;
;*************************************************************************;

(DEFUN PATH-CONCAT (&REST PNL) (PATH-CONCAT1 PNL))

(DEFUN PATH-CONCAT1 (PNL)
 (IF (NULL (CDR PNL))
  (CAR PNL)
  (CONCATENATE 'STRING (CAR PNL)
   (CONCATENATE 'STRING %PATHNAME-SEPARATOR% (PATH-CONCAT1 (CDR PNL))))))


;*************************************************************************;
;                                                                         ;
; LISP DEPENDENT FILE FORMAT SPECIFICATION                                ;
;                                                                         ;
;*************************************************************************;

#+IBCL  (SETQ %OBJFILE-SUFFIX% ".o")
#+KCL   (SETQ %OBJFILE-SUFFIX% ".o")
#+LUCID (SETQ %OBJFILE-SUFFIX% ".sbin")


;*****************************************************************************
;*                                                                           *
;*   The value of the following variables must be changed only if you rename *
;*   the subdirectories of the GETFOL package.                               *
;*                                                                           *
;*      %OBJ-DIR%   is to be set to the absolute pathname of the directory   *
;*                  in which the object files are to be stored.              *
;*      %SRC-DIR%   is to be set to the absolute pathname of the directory   *
;*                  in which the source file of GETFOL are stored.           *
;*      %DOC-DIR%   is to be set to the absolute pathname of the directory   *
;*                  containing the documentation.                            *
;*                                                                           *
;*   * CHANGE THE VALUE OF THESE VARIABLES ONLY IF YOU HAVE CHANGED THE *    *
;*   * NAME OF THE SUBDIRECTORIES OF THE GETFOL PACKAGE                 *    *
;*                                                                           *
;*****************************************************************************

(SETQ %OBJ-DIR% (PATH-CONCAT %HOME-DIR% "o"))
(SETQ %SRC-DIR% (PATH-CONCAT %HOME-DIR% "source"))
(SETQ %DOC-DIR% (PATH-CONCAT %HOME-DIR% "doc"))



;*****************************************************************************
;*                                                                           *
;* COMMON LISP COMPILER SPECIFICATIONS                                       *
;*   The values must be integers from 0 to 3, 0 meaning  irrelevant  and     *
;*   3 very important.                                                       *
;*                                                                           *
;*                                                                           *
;*  NOTE                                                                     *
;*    Change the following values only if you know what you are doing:       *
;*    changing these parameters may affect the size of the recursion-stack,  *
;*    thus causing unexpected crashes of GETFOL (this behavior has been      *
;*    observed, for instance, under akcl v. 1.615)                           *
;*                                                                           *
;*****************************************************************************

#+KCL
(PROCLAIM
 '(OPTIMIZE
   (SAFETY 0)            ; Run time error checking level
   (SPEED 3)             ; Speed of the compiled code
   (COMPILATION-SPEED 0) ; Speed of compilation
   (SPACE 0)             ; Space of both intermidiate files and object
))

#+LUCID
(PROCLAIM
 '(OPTIMIZE
   (SAFETY 0)            ; Run time error checking level
   (SPEED 3)             ; Speed of the compiled code
   (COMPILATION-SPEED 0) ; Speed of compilation
   (SPACE 0)             ; Space of both intermidiate files and object
))

#+IBCL
(PROCLAIM
 '(OPTIMIZE
   (SAFETY 0)            ; Run time error checking level
   (SPEED 3)             ; SPEED OF THE COMPILED CODE
;  (COMPILATION-SPEED 0) ; Speed of compilation (in IBCL = 3 - speed)
   (SPACE 0)             ; Space of both intermidiate files and object
))


;;; suppress warnings messages

#+KCL
(PROGN
  (SETQ *LOAD-VERBOSE*                         NIL)
  (SETQ COMPILER:*SUPPRESS-COMPILER-NOTES*     T)
  (SETQ COMPILER:*SUPPRESS-COMPILER-WARNINGS*  T))

#+LUCID
(PROGN
  (SETQ *REDEFINITION-ACTION*   NIL)
  (SETQ *LOAD-VERBOSE*          NIL)
  (SETQ *WARN-IF-NO-IN-PACKAGE* NIL)
  (COMPILER-OPTIONS
     :MESSAGES           NIL
     :WARNINGS           NIL
     :READ-SAFETY        NIL
     :WRITE-SAFETY       NIL
     :FILE-MESSAGES      NIL
     :SHOW-OPTIMIZATIONS NIL
     :BOUNDS-CHECK       NIL))



;*************************************************************************;
;                                                                         ;
;   THE FUNCTION FOR SAVING THE SYSTEM                                    ;
;                                                                         ;
;       SYSTEM-SAVE saves the current image of lisp workspace.            ;
;                                                                         ;
;       The default definition works with IBCL, KCL and LUCID             ;
;                                                                         ;
;*************************************************************************;

(DEFUN SYSTEM-SAVE (STR)
 (PROGN
  #+IBCL (GBC T)                 ;IBCL dependent total garbage collect
  #+KCL  (GBC T)                 ;KCL  dependent total garbage collect
  #+IBCL (SAVE STR)              ;saving
  #+KCL  (SAVE STR)              ;saving
  #+LUCID (DISKSAVE STR :gc T)   ;saving
  ))

