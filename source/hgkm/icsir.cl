;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; FOL version 2.001
;; This file is an FOL source file: icsir.cl
;; Date: Wed Oct 20 14:42:18 MET 1993
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
; *                           icsir.cl                          *
; *                                                             *
; * This file contains the initialization values for the HGKM   *
; * Case Sensitive Identifier Reader (CSIR), which makes HGKM   *
; * case sensitive.                                             *
; *                                                             *
; ***************************************************************

(CHRTAB-INI 256
 (LIST 
  NONID  ;  Code:   0;  Char: #\NULL
  NONID  ;  Code:   1;  Char: #\^A
  NONID  ;  Code:   2;  Char: #\^B
  NONID  ;  Code:   3;  Char: #\^C
  NONID  ;  Code:   4;  Char: #\^D
  NONID  ;  Code:   5;  Char: #\^E
  NONID  ;  Code:   6;  Char: #\^F
  NONID  ;  Code:   7;  Char: #\BELL
  NONID  ;  Code:   8;  Char: #\BACKSPACE
  NONID  ;  Code:   9;  Char: #\TAB
  NONID  ;  Code:  10;  Char: #\LINEFEED
  NONID  ;  Code:  11;  Char: #\^K
  NONID  ;  Code:  12;  Char: #\PAGE
  NONID  ;  Code:  13;  Char: #\RETURN
  NONID  ;  Code:  14;  Char: #\^N
  NONID  ;  Code:  15;  Char: #\^O
  NONID  ;  Code:  16;  Char: #\^P
  NONID  ;  Code:  17;  Char: #\^Q
  NONID  ;  Code:  18;  Char: #\^R
  NONID  ;  Code:  19;  Char: #\^S
  NONID  ;  Code:  20;  Char: #\^T
  NONID  ;  Code:  21;  Char: #\^U
  NONID  ;  Code:  22;  Char: #\^V
  NONID  ;  Code:  23;  Char: #\^W
  NONID  ;  Code:  24;  Char: #\^X
  NONID  ;  Code:  25;  Char: #\^Y
  NONID  ;  Code:  26;  Char: #\^Z
  NONID  ;  Code:  27;  Char: #\ESCAPE
  NONID  ;  Code:  28;  Char: #\^\
  NONID  ;  Code:  29;  Char: #\^]
  NONID  ;  Code:  30;  Char: #\^~
  NONID  ;  Code:  31;  Char: #\^?
  NONID  ;  Code:  32;  Char: #\SPACE
     ID  ;  Code:  33;  Char: #\!
  NONID  ;  Code:  34;  Char: #\"
     ID  ;  Code:  35;  Char: #\#
     ID  ;  Code:  36;  Char: #\$
     ID  ;  Code:  37;  Char: #\%
     ID  ;  Code:  38;  Char: #\&
  NONID  ;  Code:  39;  Char: #\'
  NONID  ;  Code:  40;  Char: #\(
  NONID  ;  Code:  41;  Char: #\)
     ID  ;  Code:  42;  Char: #\*
     ID  ;  Code:  43;  Char: #\+
  NONID  ;  Code:  44;  Char: #\,
     ID  ;  Code:  45;  Char: #\-
  NONID  ;  Code:  46;  Char: #\.
     ID  ;  Code:  47;  Char: #\/
     ID  ;  Code:  48;  Char: #\0
     ID  ;  Code:  49;  Char: #\1
     ID  ;  Code:  50;  Char: #\2
     ID  ;  Code:  51;  Char: #\3
     ID  ;  Code:  52;  Char: #\4
     ID  ;  Code:  53;  Char: #\5
     ID  ;  Code:  54;  Char: #\6
     ID  ;  Code:  55;  Char: #\7
     ID  ;  Code:  56;  Char: #\8
     ID  ;  Code:  57;  Char: #\9
     ID  ;  Code:  58;  Char: #\:
  NONID  ;  Code:  59;  Char: #\;
     ID  ;  Code:  60;  Char: #\<
     ID  ;  Code:  61;  Char: #\=
     ID  ;  Code:  62;  Char: #\>
     ID  ;  Code:  63;  Char: #\?
     ID  ;  Code:  64;  Char: #\@
     ID  ;  Code:  65;  Char: #\A
     ID  ;  Code:  66;  Char: #\B
     ID  ;  Code:  67;  Char: #\C
     ID  ;  Code:  68;  Char: #\D
     ID  ;  Code:  69;  Char: #\E
     ID  ;  Code:  70;  Char: #\F
     ID  ;  Code:  71;  Char: #\G
     ID  ;  Code:  72;  Char: #\H
     ID  ;  Code:  73;  Char: #\I
     ID  ;  Code:  74;  Char: #\J
     ID  ;  Code:  75;  Char: #\K
     ID  ;  Code:  76;  Char: #\L
     ID  ;  Code:  77;  Char: #\M
     ID  ;  Code:  78;  Char: #\N
     ID  ;  Code:  79;  Char: #\O
     ID  ;  Code:  80;  Char: #\P
     ID  ;  Code:  81;  Char: #\Q
     ID  ;  Code:  82;  Char: #\R
     ID  ;  Code:  83;  Char: #\S
     ID  ;  Code:  84;  Char: #\T
     ID  ;  Code:  85;  Char: #\U
     ID  ;  Code:  86;  Char: #\V
     ID  ;  Code:  87;  Char: #\W
     ID  ;  Code:  88;  Char: #\X
     ID  ;  Code:  89;  Char: #\Y
     ID  ;  Code:  90;  Char: #\Z
     ID  ;  Code:  91;  Char: #\[
     ID  ;  Code:  92;  Char: #\\
     ID  ;  Code:  93;  Char: #\]
     ID  ;  Code:  94;  Char: #\^
     ID  ;  Code:  95;  Char: #\_
  NONID  ;  Code:  96;  Char: #\`
     ID  ;  Code:  97;  Char: #\a
     ID  ;  Code:  98;  Char: #\b
     ID  ;  Code:  99;  Char: #\c
     ID  ;  Code: 100;  Char: #\d
     ID  ;  Code: 101;  Char: #\e
     ID  ;  Code: 102;  Char: #\f
     ID  ;  Code: 103;  Char: #\g
     ID  ;  Code: 104;  Char: #\h
     ID  ;  Code: 105;  Char: #\i
     ID  ;  Code: 106;  Char: #\j
     ID  ;  Code: 107;  Char: #\k
     ID  ;  Code: 108;  Char: #\l
     ID  ;  Code: 109;  Char: #\m
     ID  ;  Code: 110;  Char: #\n
     ID  ;  Code: 111;  Char: #\o
     ID  ;  Code: 112;  Char: #\p
     ID  ;  Code: 113;  Char: #\q
     ID  ;  Code: 114;  Char: #\r
     ID  ;  Code: 115;  Char: #\s
     ID  ;  Code: 116;  Char: #\t
     ID  ;  Code: 117;  Char: #\u
     ID  ;  Code: 118;  Char: #\v
     ID  ;  Code: 119;  Char: #\w
     ID  ;  Code: 120;  Char: #\x
     ID  ;  Code: 121;  Char: #\y
     ID  ;  Code: 122;  Char: #\z
     ID  ;  Code: 123;  Char: #\{
  NONID  ;  Code: 124;  Char: #\|
     ID  ;  Code: 125;  Char: #\}
     ID  ;  Code: 126;  Char: #\~
     ID  ;  Code: 127;  Char: #\RUBOUT
     ID  ;  Code: 128;  Char: #\
     ID  ;  Code: 129;  Char: #\
     ID  ;  Code: 130;  Char: #\
     ID  ;  Code: 131;  Char: #\
     ID  ;  Code: 132;  Char: #\IND
     ID  ;  Code: 133;  Char: #\NEL
     ID  ;  Code: 134;  Char: #\SSA
     ID  ;  Code: 135;  Char: #\ESA
     ID  ;  Code: 136;  Char: #\HTS
     ID  ;  Code: 137;  Char: #\HTJ
     ID  ;  Code: 138;  Char: #\VTS
     ID  ;  Code: 139;  Char: #\PLD
     ID  ;  Code: 140;  Char: #\PLU
     ID  ;  Code: 141;  Char: #\RI
     ID  ;  Code: 142;  Char: #\SS2
     ID  ;  Code: 143;  Char: #\SS3
     ID  ;  Code: 144;  Char: #\DCS
     ID  ;  Code: 145;  Char: #\PU1
     ID  ;  Code: 146;  Char: #\PU2
     ID  ;  Code: 147;  Char: #\STS
     ID  ;  Code: 148;  Char: #\CCH
     ID  ;  Code: 149;  Char: #\MW
     ID  ;  Code: 150;  Char: #\SPA
     ID  ;  Code: 151;  Char: #\EPA
     ID  ;  Code: 152;  Char: #\
     ID  ;  Code: 153;  Char: #\
     ID  ;  Code: 154;  Char: #\
     ID  ;  Code: 155;  Char: #\CSI
     ID  ;  Code: 156;  Char: #\ST
     ID  ;  Code: 157;  Char: #\OSC
     ID  ;  Code: 158;  Char: #\PM
     ID  ;  Code: 159;  Char: #\APC
     ID  ;  Code: 160;  Char: #\ 
     ID  ;  Code: 161;  Char: #\!
     ID  ;  Code: 162;  Char: #\"
     ID  ;  Code: 163;  Char: #\#
     ID  ;  Code: 164;  Char: #\$
     ID  ;  Code: 165;  Char: #\%
     ID  ;  Code: 166;  Char: #\&
     ID  ;  Code: 167;  Char: #\'
     ID  ;  Code: 168;  Char: #\(
     ID  ;  Code: 169;  Char: #\)
     ID  ;  Code: 170;  Char: #\*
     ID  ;  Code: 171;  Char: #\+
     ID  ;  Code: 172;  Char: #\,
     ID  ;  Code: 173;  Char: #\-
     ID  ;  Code: 174;  Char: #\.
     ID  ;  Code: 175;  Char: #\/
     ID  ;  Code: 176;  Char: #\0
     ID  ;  Code: 177;  Char: #\1
     ID  ;  Code: 178;  Char: #\2
     ID  ;  Code: 179;  Char: #\3
     ID  ;  Code: 180;  Char: #\4
     ID  ;  Code: 181;  Char: #\5
     ID  ;  Code: 182;  Char: #\6
     ID  ;  Code: 183;  Char: #\7
     ID  ;  Code: 184;  Char: #\8
     ID  ;  Code: 185;  Char: #\9
     ID  ;  Code: 186;  Char: #\:
     ID  ;  Code: 187;  Char: #\;
     ID  ;  Code: 188;  Char: #\<
     ID  ;  Code: 189;  Char: #\=
     ID  ;  Code: 190;  Char: #\>
     ID  ;  Code: 191;  Char: #\?
     ID  ;  Code: 192;  Char: #\@
     ID  ;  Code: 193;  Char: #\A
     ID  ;  Code: 194;  Char: #\B
     ID  ;  Code: 195;  Char: #\C
     ID  ;  Code: 196;  Char: #\D
     ID  ;  Code: 197;  Char: #\E
     ID  ;  Code: 198;  Char: #\F
     ID  ;  Code: 199;  Char: #\G
     ID  ;  Code: 200;  Char: #\H
     ID  ;  Code: 201;  Char: #\I
     ID  ;  Code: 202;  Char: #\J
     ID  ;  Code: 203;  Char: #\K
     ID  ;  Code: 204;  Char: #\L
     ID  ;  Code: 205;  Char: #\M
     ID  ;  Code: 206;  Char: #\N
     ID  ;  Code: 207;  Char: #\O
     ID  ;  Code: 208;  Char: #\P
     ID  ;  Code: 209;  Char: #\Q
     ID  ;  Code: 210;  Char: #\R
     ID  ;  Code: 211;  Char: #\S
     ID  ;  Code: 212;  Char: #\T
     ID  ;  Code: 213;  Char: #\U
     ID  ;  Code: 214;  Char: #\V
     ID  ;  Code: 215;  Char: #\W
     ID  ;  Code: 216;  Char: #\X
     ID  ;  Code: 217;  Char: #\Y
     ID  ;  Code: 218;  Char: #\Z
     ID  ;  Code: 219;  Char: #\[
     ID  ;  Code: 220;  Char: #\\
     ID  ;  Code: 221;  Char: #\]
     ID  ;  Code: 222;  Char: #\^
     ID  ;  Code: 223;  Char: #\_
     ID  ;  Code: 224;  Char: #\`
     ID  ;  Code: 225;  Char: #\a
     ID  ;  Code: 226;  Char: #\b
     ID  ;  Code: 227;  Char: #\c
     ID  ;  Code: 228;  Char: #\d
     ID  ;  Code: 229;  Char: #\e
     ID  ;  Code: 230;  Char: #\f
     ID  ;  Code: 231;  Char: #\g
     ID  ;  Code: 232;  Char: #\h
     ID  ;  Code: 233;  Char: #\i
     ID  ;  Code: 234;  Char: #\j
     ID  ;  Code: 235;  Char: #\k
     ID  ;  Code: 236;  Char: #\l
     ID  ;  Code: 237;  Char: #\m
     ID  ;  Code: 238;  Char: #\n
     ID  ;  Code: 239;  Char: #\o
     ID  ;  Code: 240;  Char: #\p
     ID  ;  Code: 241;  Char: #\q
     ID  ;  Code: 242;  Char: #\r
     ID  ;  Code: 243;  Char: #\s
     ID  ;  Code: 244;  Char: #\t
     ID  ;  Code: 245;  Char: #\u
     ID  ;  Code: 246;  Char: #\v
     ID  ;  Code: 247;  Char: #\w
     ID  ;  Code: 248;  Char: #\x
     ID  ;  Code: 249;  Char: #\y
     ID  ;  Code: 250;  Char: #\z
     ID  ;  Code: 251;  Char: #\{
     ID  ;  Code: 252;  Char: #\|
     ID  ;  Code: 253;  Char: #\}
     ID  ;  Code: 254;  Char: #\~
  NONID  ;  Code: 255;  Char: #\NEWLINE
))


;The following line is needed if the compiler is to work on preloaded
;functions (since it writes them to a disk file first.)
(SETQ *PRINT-CASE* :UPCASE)

(SET-MACRO-CHARACTER #\A (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\B (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\C (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\D (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\E (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\F (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\G (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\H (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\I (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\J (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\K (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\L (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\M (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\N (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\O (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\P (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\Q (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\R (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\S (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\T (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\U (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\V (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\W (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\X (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\Y (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\Z (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\a (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\b (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\c (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\d (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\e (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\f (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\g (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\h (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\i (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\j (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\k (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\l (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\m (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\n (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\o (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\p (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\q (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\r (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\s (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\t (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\u (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\v (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\w (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\x (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\y (FUNCTION CSIR) T)
(SET-MACRO-CHARACTER #\z (FUNCTION CSIR) T)
