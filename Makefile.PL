#!/usr/bin/env perl
# $File: //member/autrijus/RTx-Attribute/Makefile.PL $ $Author: autrijus $
# $Revision: #1 $ $Change: 8032 $ $DateTime: 2003/09/10 09:37:30 $

use 5.006;
use inc::Module::Install;

include_deps   ('Test::More', 5.006);
build_requires ('Test::More', 0);

warn << '.';
### PLEASE NOTE ##############################################

This is *PRE-ALPHA* code.  Using this module for anything
(except for learning purporses) is strongly discouraged.

##############################################################
.

# XXX - figure out how to install po/ and html/

WriteMakefile (
    AUTHOR	    => 'Autrijus Tang (autrijus@autrijus.org)',
    NAME	    => 'RTx::Attribute',
    ABSTRACT	    => 'RT Attribute Extension',
    VERSION_FROM    => 'lib/RTx/Attribute.pm',
);

