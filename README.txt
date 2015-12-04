                 +-----------------------------------+
                 |  The GETFOL distribution package  |
                 +-----------------------------------+

* [0] INDEX
==========

       [1] OVERVIEW

       [2] OBTAINING THE GETFOL DISTRIBUTION PACKAGE
          [2.1] Anonymous FTP
          [2.2] IRST software package

       [3] CONTENTS OF THE GETFOL DISTRIBUTION PACKAGE

       [4] INSTALLATION OF THE SYSTEM
          [4.1] Retrieve the sources
          [4.2] Add directory information to install file
          [4.3] Make the system
          [4.4] Try it out
          [4.5] Testing the system
          [4.6] Make the command script
          [4.7] Make the documentation
          [4.8] Eliminate some files?

       [5] REGISTRATION OF USERS
          [5.1] Filling the registration form
          [5.2] Mailing lists
          [5.3] Bug reports and comments
          [5.4] General requests


Search for \[#\] to get to section number # quickly.

If you are familiar with Emacs, you may want to read this document using the 
"outline" major mode.



* [1] OVERVIEW
==============

The GETFOL system is an experimental program for embedding real world
knowledge into data structures that can be manipulated by computers.
The current implementation of GETFOL runs on top of a re-implementation of
the FOL system, designed and developed by Richard Weyhrauch at Stanford.
Dozens of people, over almost two decades, worked to its
implementation and used it to formalize and solve problems of
logic and artificial intelligence.

The GETFOL distribution package is now maintained by Fausto Giunchiglia,
and is made available for use by anyone interested in building autonomous
agents or using logic based representation theory for problem solving.

The GETFOL distribution package contains source files and documentation.
The system require Common Lisp to run. It has been tested on
Lucid [version 3.0.0] and Austin Kyoto Common Lisp [Version(1.623)] under UNIX
operating system [SunOS 4.1.1]. 

This guide gives an overview of the GETFOL distribution package: it
explains how to obtain the package, describes its contents, and the
procedures for installing and running GETFOL.



* [2] OBTAINING THE GETFOL DISTRIBUTION PACKAGE
===============================================				 

The official GETFOL distribution package is kept and distributed by Fausto
Giunchiglia.

In the following we describe how to obtain the GETFOL distribution
package. (We assume you are using a UNIX operating system, and that
`csh' is used as the command shell. If a different operating system
or shell is used, please change the commands accordingly.) 


** [2.1] ANONYMOUS FTP

The GETFOL distribution package is available via anonymous ftp from the
following Site(s):

      Site:               DIST, University of Genova, Genoa, Italy
      Network Address:    ftp.mrg.dist.unige.it  (130.251.7.2)
      Login:              ftp
      Password:           <your full e-mail address>
      Directory:          /pub/getfol/
      File:               GETFOL.tar.Z

In order to get the GETFOL distribution package,

      ftp to <Network Address>,

login as <Login> using <Password>,

      go to the <Directory>.

Then set the binary mode and get the file GETFOL.tar.Z.

      % ftp ftp.mrg.dist.unige.it
      ftp> cd /pub/getfol
      ftp> binary
      ftp> get GETFOL.tar.Z
      ftp> quit


The file GETFOL.tar.Z. contains the whole GETFOL distribution package.
This file is a compressed tar file of about 800K.
If your system does not support compress, you can also ftp the file 
<Directory>/compress.tar, a tar file containing the c sources for the
compress and uncompress programs.


** [2.2] IRST SOFTWARE PACKAGE

If it is not convenient for you to get the sources via the internet,
you can get a SUN cartridge tape or diskettes containing the GETFOL
distribution package from

                       Fausto Giunchiglia
                       Mechanized Reasoning Group
                       IRST, 38050 - Trento, ITALY.

This distribution comes in standard tar format, and includes a hard
copy of the documentation.

Send e-mail inquiries getfol@frege.mrg.dist.unige.it



* [3] CONTENTS OF THE GETFOL DISTRIBUTION PACKAGE
================================================

The GETFOL distribution package is divided in the following directories:

     README    :  this document.
     REGISTER  :  a registration form that should be filled and sent to the
                  specified address after the installation of the systems. 
     axiom     :  this directory contains interesting examples solved using
                  GETFOL.
     doc       :  this directory contains different forms of documentation,
                  like the installation guide, the user manual, the hgkm
                  manual.
     make      :  this directory contains the source code, and the
                  configurations files for the system.
     o         :  initially empty, is used to store the binary files produced
                  during the compilation of the systems
     source    :  this directory contains the source code of the system.
     tst       :  this directory contains files used to test the system.




* [4] INSTALLATION OF THE SYSTEM
================================

** [4.1] RETRIEVE THE SOURCES

If you have obtained the GETFOL distribution package as a tape or
cartridge, please refer to the enclosed instructions to retrieve the 
sources.

If you have obtained the file GETFOL.tar.Z by anonymous ftp, change to
the directory where you want to put the GETFOL package (from now on,
<getfol-dir>) and make sure the file GETFOL.tar.Z is in <getfol-dir>.
E.g.

	% mkdir <getfol-dir>
	% mv GETFOL.tar.Z <getfol-dir>
	% cd <getfol-dir>

Then type the following command

	% uncompress -c GETFOL.tar.Z | tar -xvf -
	....
	% ls -l
	-rw-r--r--  1 getfol      10628 Jul  1 11:35 README
	-rw-r--r--  1 getfol       1407 Jun 18 16:55 REGISTER
	drwxr-xr-x  2 getfol        512 Jul  1 11:32 axiom
	drwxr-xr-x  6 getfol        512 Jul  1 11:15 doc
	drwxr-xr-x  2 getfol        512 Jul  1 11:27 make
	drwxr-xr-x  2 getfol        512 Jul  1 10:41 o
	drwxr-xr-x 13 getfol        512 Jul  1 11:15 source
	drwxr-sr-x 10 getfol        512 Jul  1 10:34 tst

The size of the GETFOL distribution package is approximately 2.6 MB
(GETFOL.tar.Z excluded). The space required for the compilation and the
executable image of GETFOL may vary depending on your Common Lisp and
machine.


** [4.2] ADD DIRECTORY INFORMATION TO INSTALL FILES

After you have retrieved all the sources under <GETFOL-dir>, connect to
the make directory:

    % cd make 

Edit the file "host.lsp" and set the value of the variable:

    %HOME-DIR% 

to the absolute pathname of <getfol-dir>.


** [4.3] MAKE THE SYSTEM

Then run Common Lisp at your site, e.g.,

    % ibcl		; run your Common Lisp environment
    IBUKI Common Lisp Version 2 release 01.027.
    ...
    >

Call

    > (LOAD "install.lsp")

followed by:

    > (MAKE-GETFOL)

to start the automatic procedure to make GETFOL.
Should any problem arise during this phase, please refer to the
troubleshooting guide (file TROUBLES.DOC in the directory make) or
Installation Manual for further information.

The successful termination of the make procedure prints a message

    GETFOL Version 2.001, June 1994 *COMPILED*

Then type

    > (SYSTEM-SAVE "GETFOL")

at the LISP prompt to save the system as an executable file. You can
use another file name if you wish.

If you wish to build HGKM only (HGKM is the implementation language of
GETFOL, and it is implemented as a set of macros on top of Common Lisp),
follow the steps for building GETFOL by replacing the word "GETFOL" with
the word "HGKM", that is,

    % ibcl
    IBUKI Common Lisp Version 2 release 01.027.
    ...
    > (LOAD "install.lsp")
    ...
    > (MAKE-HGKM)
    ...
    > (SYSTEM-SAVE "HGKM")



** [4.4] TRY IT OUT

To try out GETFOL connect to the <getfol-dir>/make directory, i.e. 

    % pwd
    <getfol-dir>/make

and type 

    % ./GETFOL

    IBUKI Common Lisp Version 2 release 01.027.
 
    This software is provided by IBUKI pursuant to a written license ...
    and may be used, copied, transmitted and stored only in accorda ... 
    terms of such license. 
 
    ;; Copyright (c) 1991-86 IBUKI All rights reserved.
    ;; Copyright (c) 1986-84 T. Yuasa and M. Hagiya All rights reserved.
 
    For more information: (describe 'copyright) or (describe 'acknow...
 
    >

Then call the function SYSBOOT to run GETFOL:

	> (SYSBOOT)

	...

	GETFOL::

The system is now ready to accept the commands.


** [4.5] TESTING THE SYSTEM

In order to test the correct installation of the system, you should go to the
<getfol-dir>/tst directory, launch GETFOL, fetch the file LONGTEST and compare
the obtained output with the content of the file LONGOUTPUT.

Refer to the file <getfol-dir>/tst/README for a more detailed explanation of
the testing procedure.


** [4.6] MAKE THE COMMAND SCRIPT

In order to make the saved image available for all the users, you
should copy the file <getfol-dir>/make/GETFOL some place on users search
paths (e.g. /usr/local/bin). 


** [4.7] MAKE THE DOCUMENTATION

The documentation of the GETFOL system comes in LaTeX format.
To create ".dvi" files, go the <getfol-dir>/doc directory and run the script
MAKEDOCS, that is, type at the prompt:

    $ MAKEDOCS

The script will automatically create the ".dvi" files of the HGKM manual and
the installation manual and the ".ps" of the user manual.
Note that the script MAKEDOCS will not run if your system does not support
"latex" and "dvips"; read the file <getfol-dir>/doc/README for further
information.


** [4.8] ELIMINATE SOME FILES?

What to keep if you have no space! The only file ESSENTIAL to running
GETFOL once you have built the system are the executable saved image, i.e.

    <getfol-dir>/make/GETFOL

(or "/usr/local/bin/GETFOL") and the file

    <getfol-dir>/source/fix.gfl


Of course keeping documentation, sources, etc. is desirable.



* [5] REGISTRATION OF USERS
===========================


** [5.1] FILLING THE REGISTRATION FORM

After installing GETFOL, please fill out the registration form contained
in the REGISTER file and send it (possibly by e-mail) to the address below:

                        Fausto Giunchiglia
                        Mechanized Reasoning Group
                        IRST
                        38050 Trento - ITALY
                        e-mail:   getfol@irst.it
                        phone:    +39-461-314436
                        fax:      +39-461-314591
	
In this way you can be advised direct of any changes which are made to
the system. Furthermore, the copyright statement on the documents of
the package requires such registration as a condition for their local
distribution. 



** [5.2] MAILING LISTS

An informal mailing list for people interested in FOL and GETFOL can
be reached by sending e-mail to

                        getfol@frege.mrg.dist.unige.it


** [5.3] BUG REPORTS AND COMMENTS

If you find bugs, have questions, or wish to make suggestions for
changes or extensions to either system or the manuals, please send
e-mail to:

                        getfol@frege.mrg.dist.unige.it


** [5.4] GENERAL REQUESTS

Any other requests should be sent via e-mail to

                        getfol@frege.mrg.dist.unige.it

You can also send a letter or fax to one of the following address: 

                        Fausto Giunchiglia 
                        Mechanized Reasoning Group 
                        IRST 			 
                        38050 Povo - Trento (TN) 
                        ITALY 
 
                        Phone:  +39-461-314436
                        Fax:    +39-461-314591
                        E-mail: fausto@irst.it 
