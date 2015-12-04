;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GETFOL version 2.001
;; Date: Mon Nov 22 19:23:57 MET 1993
;;
;; This    FOL file was modified in GETFOL version 2.001
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; fol version 2.001
;; This file is an FOL source file: install.lsp
;; Date: Tue Nov  9 17:39:18 MET 1993
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
;                             install.lsp                                 ;
;                                                                         ;
;*************************************************************************;
;*************************************************************************;
;                                                                         ;
;    This file contains the installation facilities necessary for         ;
;    building a your own favourite system.                                ;
;                                                                         ;
;   In order to install a system the following steps are to be performed: ;
;                                                                         ;
;     1. change the value of the global variables contained in the        ;
;        host.lsp file [or alternatively, execute step 3].                ;
;                                                                         ;
;     2. Load the install.lsp file into your Common Lisp environment.     ;
;                                                                         ;
;     3. [OPTIONAL] If you didn't change the value of the variables in    ;
;        host.lsp file, call the following form:                          ;
;                                                                         ;
;                               (configure)                               ;
;                                                                         ;
;        which interactively asks the user for the values of system-      ;
;        dependent variables.                                             ;
;                                                                         ;
;     4. Type one of the following four forms:                            ;
;                                                                         ;
;                               (make-hgkm)                               ;
;                               (make-getfol)                             ;
;                               (make-agetfol)                            ;
;                                                                         ;
;       if you want to install HGKM, FOL, GETFOL or AGETFOL respectively. ;
;                                                                         ;
;   The configuration files (<system>.cfg) for the previuos systems are   ;
;   provided in a standard form.                                          ;
;   If you need to alter the configuration of a system you are            ;
;   recommended to refer to the FOL/[A]GETFOL INSTALLATION MANUAL.        ;
;                                                                         ;
;*************************************************************************;

; select USER package if we are using LUCID
#+LUCID (IN-PACKAGE 'USER)

; loading the host configuration file
(LOAD "host.lsp")

; print start up message
#-HGKM
(FORMAT T

"

; -------------------------------------------------------------------------
;
; You have loaded the GETFOL distribution package INSTALLATION FACILITIES.
;
;   * (MAKE-HGKM) to make the HGKM interpreter
;
;   * (MAKE-GETFOL) to make the GETFOL system
;
;   *************************** ATTENTION ********************************
;   Before  trying to build the system  you must  change the  value of the
;   variable %HOME-DIR% in the file host.lsp.
;   **********************************************************************
;
;   WARNING: making either of these systems will make the
;   Common Lisp interpreter into case sensitive.
;
; -------------------------------------------------------------------------


")

#+HGKM
(FORMAT T

"

; -------------------------------------------------------------------------
;
;   You have loaded the GETFOL DISTRIBUTION PACKAGE installation facilities
;   in the HGKM system built on top of Common Lisp.
;
;   WARNING: the Common Lisp interpreter is now case sensitive.
;   All the Common Lisp built-in functions must be written with capital
;   letters (e.g. CAR).
;
;   Type:
;
;   * (MAKE-GETFOL) to make the GETFOL system
;
; -------------------------------------------------------------------------


")



;*************************************************************************;
;                                                                         ;
;   HIGH LEVEL INSTALLATION FUNCTIONS                                     ;
;                                                                         ;
;     These functions are the high level functions for the installation   ;
;     of HGKM and GETFOL.                                                 ;
;                                                                         ;
;          (MAKE-HGKM)                                                    ;
;          (MAKE-GETFOL)                                                  ;
;                                                                         ;
;                                                                         ;
;*************************************************************************;

(DEFUN MAKE-HGKM ()
 (PROGN
  (SYSMASTER-SET 'HGKM)
  (LOAD "host.lsp")
  (LOAD "hgkm.cfg")
  (MAKE-SYSTEM 'HGKM)
  (SUBR-RESTORE)
  (VALUES)))

(DEFUN MAKE-GETFOL ()
 (PROGN
  (SYSMASTER-SET 'GETFOL)
  (LOAD "host.lsp")
  (LOAD "hgkm.cfg")
  (MAKE-SYSTEM 'HGKM)
  (LOAD "getfol.cfg")
  (MAKE-SYSTEM 'GETFOL)
  (SUBR-RESTORE)
  (VALUES)))


;*************************************************************************;
;                                                                         ;
;                               SYSTEMS                                   ;
;                                                                         ;
; This files contains the primitives for installing systems.              ;
; A SYSTEM is an abstract datum used to facilitate the installation       ;
; procedure provided with the following slot of information:              ;
;                                                                         ;
;          NAME: a string containing the name of the system.              ;
;       VERSION: a string containing the month and the year.              ;
;       RELEASE: a string containing the release number of the system.    ;
;        BANNER: a string containing the starting message of the system   ;
;          MODE: one between the symbols 'COMPILED and 'INTERPRETED.      ;
;       MODULES: list of the modules of the system.                       ;
;       FIXFILE: the path name of the file containing the source code     ;
;                that has been modified since the system has been         ;
;                compiled.                                                ;
;                This file is loaded each time the system is run.         ;
;     DEBUGFILE: path name of the file containing the code that the user  ;
;                wants to be loaded each time the system is run.          ;
;                Useful for for debugging purpouse.                       ;
;     STARTFILE: path name of the file containing user commands to be     ;
;                loaded at start-up.                                      ;
;       DOCFILE: path name of the file containing the documentation       ;
;        SCRDIR: path name of the directory containing the source code    ;
;        OBJDIR: path name of the directory containing the object files   ;
;        DOCDIR: path name of the directory containing the documentation  ;
;                                                                         ;
;*************************************************************************;

(DEFUN SYS-INIT (SYS)
 (PROGN
  (SETF (GET SYS '%SYS-NAME%)      NIL)
  (SETF (GET SYS '%SYS-VERSION%)   NIL)
  (SETF (GET SYS '%SYS-RELEASE%)   NIL)
  (SETF (GET SYS '%SYS-BANNER%)    NIL)
  (SETF (GET SYS '%SYS-MODE%)      NIL)
  (SETF (GET SYS '%SYS-MODULES%)   NIL)
  (SETF (GET SYS '%SYS-FIXFILE%)   NIL)
  (SETF (GET SYS '%SYS-DEBUGFILE%) NIL)
  (SETF (GET SYS '%SYS-STARTFILE%) NIL)
  (SETF (GET SYS '%SYS-DOCFILE%)   NIL)
  (SETF (GET SYS '%SYS-SRCDIR%)    NIL)
  (SETF (GET SYS '%SYS-OBJDIR%)    NIL)
  (SETF (GET SYS '%SYS-DOCDIR%)    NIL)))

(DEFUN SYS-GET-NAME    (SYS)         (GET SYS '%SYS-NAME%))
(DEFUN SYS-SET-NAME    (SYS NAME)    (SETF (GET SYS '%SYS-NAME%) NAME))

(DEFUN SYS-GET-VERSION (SYS)         (GET SYS '%SYS-VERSION%))
(DEFUN SYS-SET-VERSION (SYS VERSION) (SETF (GET SYS '%SYS-VERSION%) VERSION))

(DEFUN SYS-GET-RELEASE (SYS)         (GET SYS '%SYS-RELEASE%))
(DEFUN SYS-SET-RELEASE (SYS RELEASE) (SETF (GET SYS '%SYS-RELEASE%) RELEASE))

(DEFUN SYS-GET-BANNER  (SYS)         (GET SYS '%SYS-BANNER%))
(DEFUN SYS-SET-BANNER  (SYS BANNER)  (SETF (GET SYS '%SYS-BANNER%) BANNER))

(DEFUN SYS-GET-MODE    (SYS)         (GET SYS '%SYS-MODE%))
(DEFUN SYS-SET-MODE    (SYS MODE)    (SETF (GET SYS '%SYS-MODE%) MODE))

(DEFUN SYS-GET-FIXFILE (SYS)         (GET SYS '%SYS-FIXFILE%))
(DEFUN SYS-SET-FIXFILE (SYS FIXFILE) (SETF (GET SYS '%SYS-FIXFILE%) FIXFILE))

(DEFUN SYS-GET-DOCFILE (SYS)         (GET SYS '%SYS-DOCFILE%))
(DEFUN SYS-SET-DOCFILE (SYS DOCFILE) (SETF (GET SYS '%SYS-DOCFILE%) DOCFILE))

(DEFUN SYS-GET-SRCDIR  (SYS)         (GET SYS '%SYS-SRCDIR%))
(DEFUN SYS-SET-SRCDIR  (SYS SRCDIR)  (SETF (GET SYS '%SYS-SRCDIR%) SRCDIR))

(DEFUN SYS-GET-OBJDIR  (SYS)         (GET SYS '%SYS-OBJDIR%))
(DEFUN SYS-SET-OBJDIR  (SYS OBJDIR)  (SETF (GET SYS '%SYS-OBJDIR%) OBJDIR))

(DEFUN SYS-GET-DOCDIR  (SYS)         (GET SYS '%SYS-DOCDIR%))
(DEFUN SYS-SET-DOCDIR  (SYS DOCDIR)  (SETF (GET SYS '%SYS-DOCDIR%) DOCDIR))

(DEFUN SYS-GET-DEBUGFILE (SYS) (GET SYS '%SYS-DEBUGFILE%))
(DEFUN SYS-SET-DEBUGFILE (SYS DEBUGFILE)
  (SETF
    (GET SYS '%SYS-DEBUGFILE%)
    DEBUGFILE))

(DEFUN SYS-GET-STARTFILE (SYS)           (GET SYS '%SYS-STARTFILE%))
(DEFUN SYS-SET-STARTFILE (SYS STARTFILE)
  (SETF
    (GET SYS '%SYS-STARTFILE%)
    STARTFILE))

(DEFUN SYS-ADD-MODULE (SYS MODULE)
  (SETF
    (GET SYS '%SYS-MODULES%)
    (APPEND (GET SYS '%SYS-MODULES%) (LIST MODULE))))

(DEFUN SYS-GET-MODULES (SYS) (GET SYS '%SYS-MODULES%))


;*************************************************************************;
;                                                                         ;
;                            MODULES                                      ;
;                                                                         ;
; A MODULE is an abstract datum provided with the following slots of      ;
; information:                                                            ;
;                                                                         ;
;          NAME: a string containing the name of the module.              ;
;          MODE: one between the symbols 'COMPILED and 'INTERPRETED.      ;
;         FILES: list S-expressions containing the information about the  ;
;                files of the modules.                                    ;
;                The S-expressions have the following format:             ;
;                        ( SRCFILE  OBJFILE  .  MODE )                    ;
;                Where SRCFILE and OBJFILE are the filenames of the       ;
;                source and object files respectively.                    ;
;                MODE is one between the symbols 'COMPILED and            ;
;                'INTERPRETED.                                            ;
;                The S-expressions are added to the existing FILES        ;
;                list by means of the action:                             ;
;                 (MODULE-ADD-FILE MODULE SRCFILE OBJFILE MODE)           ;
;                The module configuration file usually contains a         ;
;                sequence of such actions.                                ;
;        SRCDIR: the path name of the module home directory.              ;
;                The module home directory is supposed to contain         ;
;                the module configuration file.                           ;
;        OBJDIR: the path name of the directory containing the object     ;
;                files for the module.                                    ;
;          MODE: it may assume either the value INTERPRETED or COMPILED.  ;
;                If MODE is set to INTERPRETED then the all the source    ;
;                files of the module are loaded, ignoring the             ;
;                corresponding file mode flag.                            ;
;        DOCDIR: the path name of the directory containing the            ;
;                documentation of the module                              ;
;       DOCFILE: the path name of the file containing the documentation   ;
;                of the module                                            ;
;                                                                         ;
;*************************************************************************;

(DEFUN MODULE-INIT (MODULE)
 (PROGN
  (SETF (GET MODULE '%MOD-NAME%)    NIL)
  (SETF (GET MODULE '%MOD-SRCDIR%)  NIL)
  (SETF (GET MODULE '%MOD-OBJDIR%)  NIL)
  (SETF (GET MODULE '%MOD-MODE%)    NIL)
  (SETF (GET MODULE '%MOD-FILES%)   NIL)
  (SETF (GET MODULE '%MOD-DOCDIR%)  NIL)
  (SETF (GET MODULE '%MOD-DOCFILE%) NIL)))

(DEFUN MODULE-GET-NAME   (MODULE)      (GET MODULE '%MOD-NAME%))
(DEFUN MODULE-SET-NAME   (MODULE NAME) (SETF (GET MODULE '%MOD-NAME%) NAME))

(DEFUN MODULE-GET-SRCDIR (MODULE)      (GET MODULE '%MOD-SRCDIR%))
(DEFUN MODULE-SET-SRCDIR (MODU SRCDIR) (SETF (GET MODU '%MOD-SRCDIR%) SRCDIR))
 
(DEFUN MODULE-GET-OBJDIR (MODULE)      (GET MODULE '%MOD-OBJDIR%))
(DEFUN MODULE-SET-OBJDIR (MODU OBJDIR) (SETF (GET MODU '%MOD-OBJDIR%) OBJDIR))
 
(DEFUN MODULE-GET-MODE   (MODULE)      (GET MODULE '%MOD-MODE%))
(DEFUN MODULE-SET-MODE   (MODULE MODE) (SETF (GET MODULE '%MOD-MODE%) MODE))

(DEFUN MODULE-GET-DOCDIR (MODULE)      (GET MODULE '%MOD-DOCDIR%))
(DEFUN MODULE-SET-DOCDIR (MODU DOCDIR) (SETF (GET MODU '%MOD-DOCDIR%) DOCDIR))

(DEFUN MODULE-GET-DOCFILE (MODULE)     (GET MODULE '%MOD-DOCFILE%))
(DEFUN MODULE-SET-DOCFILE (MODULE DOCFILE)
  (SETF
	 (GET MODULE '%MOD-DOCFILE%)
	 DOCFILE))
 
(DEFUN MODULE-GET-FILES (MODULE) (GET MODULE '%MOD-FILES%))
(DEFUN MODULE-ADD-FILE  (MODULE SRCFILE OBJFILE MODE)
 (IF (NOT (OR (EQ MODE 'INTERPRETED) (EQ MODE 'COMPILED)))
  (BREAK "*** ERROR *** MODE FLAG must be set to 'INTERPRETED or 'COMPILED")
  (SETF
     (GET MODULE '%MOD-FILES%)
     (APPEND
        (GET MODULE '%MOD-FILES%)
        (LIST (CONS SRCFILE (CONS OBJFILE MODE)))))))



;*************************************************************************;
;                                                                         ;
;     MAKE-SYSTEM is a general purpose tool for compiling/interpreting    ;
;     a set of source files and loading them into the CL environment.     ;
;                                                                         ;
;        (MAKE-SYSTEM system)                                             ;
;                                                                         ;
;*************************************************************************;

(DEFUN MAKE-SYSTEM (system)   
 (PROGN
  (INSTALL-SYS system)
  (TERPRI)
  (TERPRI)
  (PRINC (SYS-GET-NAME system))
  (PRINC " Version ") (PRINC (SYS-GET-VERSION system))
  (PRINC ", ") (PRINC (SYS-GET-RELEASE system))
  (PRINC " *") (PRINC (SYS-GET-MODE system)) (PRINC "*")
  (TERPRI)
  (TERPRI)
))


;*************************************************************************;
;                                                                         ;
;                     INSTALLATION FACILITIES                             ;
;                                                                         ;
;*************************************************************************;

(DEFUN INSTALL-SYS (SYS)
  (INSTALL-MODULES (SYS-GET-MODULES SYS) (SYS-GET-MODE SYS)))

(DEFUN INSTALL-MODULES (MODULES MODE)
 (IF (NULL MODULES)
  NIL
  (PROGN
   (LET ( (FIRST-MODULE (CAR MODULES)) )
     (INSTALL-MODULE
       (MODULE-GET-FILES  FIRST-MODULE) 
       (MODULE-GET-SRCDIR FIRST-MODULE)
       (MODULE-GET-OBJDIR FIRST-MODULE)
       (IF (EQ (MODULE-GET-MODE FIRST-MODULE) 'INTERPRETED)
          'INTERPRETED
          MODE))
    (INSTALL-MODULES (CDR MODULES) MODE)))))
   
(DEFUN INSTALL-MODULE (FILES SRCDIR OBJDIR MODE)
 (IF (NULL FILES)
  NIL
  (PROGN
   (LET ( (ENTRY (CAR FILES)) )
    (LET ((SOURCE (PATH-CONCAT SRCDIR (CAR ENTRY)))
          (DEST (PATH-CONCAT OBJDIR
                    (CONCATENATE 'STRING (CADR ENTRY) %OBJFILE-SUFFIX%))))
      (IF (OR (EQ MODE 'INTERPRETED) (EQ (CDDR ENTRY) 'INTERPRETED))
       (IF (NOT (PROBE-FILE SOURCE))
        (PROGN
         (FORMAT T "~%FILE DOES NOT EXIST:~%~A~%" SOURCE)
         (BREAK))
        (PROGN
         (FORMAT T "~%LOADING INTERPRETED FILE:~%~A~%" SOURCE)
         (LOAD SOURCE)))
       (IF (EQ (CDDR ENTRY) 'COMPILED)
        (IF (OR (NOT (PROBE-FILE DEST))
                (< (FILE-WRITE-DATE DEST) (FILE-WRITE-DATE SOURCE)))
         (PROGN
          (FORMAT T "~%COMPILING SOURCE FILE:~%~A" SOURCE)
          (FORMAT T "~%OBJECT FILE:~%~A~%" DEST)
          (COMPILE-FILE SOURCE :OUTPUT-FILE DEST)
          (LOAD DEST))
         (PROGN
          (FORMAT T "~%OBJECT FILE UP TO DATE. LOADING:~%~A~%" DEST)
          (LOAD DEST)))))))
   (INSTALL-MODULE (CDR FILES) SRCDIR OBJDIR MODE))))


;*************************************************************************;
;                                                                         ;
;   MASTER system information                                             ;
;                                                                         ;
;*************************************************************************;

(DEFVAR %MASTER-SYSTEM%)
(DEFUN  SYSMASTER-GET ()     %MASTER-SYSTEM%)
(DEFUN  SYSMASTER-SET (NAME) (SETQ %MASTER-SYSTEM% NAME))
