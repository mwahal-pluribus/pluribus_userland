#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright (c) 2013, Oracle and/or its affiliates. All rights reserved.
#
include ../../../make-rules/shared-macros.mk

# I want to override PERL_VERSION and PERL_ARCH because when building
# a new version of perl it probably isn't installed so shared-macros.mk
# can't call it.

COMPONENT_NAME=		perl
COMPONENT_VERSION=	5.22.2
COMPONENT_SUMMARY=	Perl 5.22
PERL_VERSION=		5.22
COMPONENT_PROJECT_URL=	http://www.perl.org/
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.xz
COMPONENT_ARCHIVE_HASH=	\
    sha256:b34dab1eabec056bec5a6682a57b55dab1bcf6afc60b098c9e2d99433dedc295
COMPONENT_ARCHIVE_URL=	http://www.cpan.org/src/5.0/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=	utility/perl
COMPONENT_FMRI=		runtime/perl-522
COMPONENT_CLASSIFICATION=	Development/Perl
COMPONENT_LICENSE=	Artistic
COMPONENT_LICENSE_FILE=	Artistic

include $(WS_TOP)/make-rules/prep.mk
include $(WS_TOP)/make-rules/configure.mk
include $(WS_TOP)/make-rules/ips.mk

LD_B_DIRECT=		""

COMPONENT_BUILD_ARGS =

CONFIGURE_SCRIPT = $(SOURCE_DIR)/Configure
CONFIGURE_ENV += MAKE=$(GMAKE)

CONFIGURE_OPTIONS.32 = \
			-de \
			-Dmksymlinks \
			-Ulocincpth= \
			-Uloclibpth= \
                        -Dbin=/usr/perl5/$(PERL_VERSION)/bin \
			-Dcc="$(CC) $(CC_BITS)" \
			-Dccflags="-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" \
			-Dcf_email="moinak.ghosh@pluribusnetworks.com" \
			-Dcf_by="perl-bugs" \
			-Dlibperl=libperl.so \
			-Dmyhostname="localhost" \
			-Dprefix=/usr/perl5/$(PERL_VERSION) \
                        -Dprivlib=/usr/perl5/$(PERL_VERSION)/lib \
			-Dsitelib=/usr/perl5/site_perl/$(PERL_VERSION) \
			-Dsiteprefix=/usr/perl5/$(PERL_VERSION) \
			-Dvendorlib=/usr/perl5/vendor_perl/$(PERL_VERSION) \
			-Dvendorprefix=/usr/perl5/$(PERL_VERSION) \
			-Duse64bitint \
			-Duseshrplib \
			-Dusedtrace \
			-Uuselargefiles 

CONFIGURE_OPTIONS.64 = \
			-de \
			-Dmksymlinks \
			-Ulocincpth= \
			-Uloclibpth= \
                        -Dbin=/usr/perl5/$(MACH64)/$(PERL_VERSION)/bin \
			-Dcc="$(CC) $(CC_BITS)" \
			-Dcf_email="moinak.ghosh@pluribusnetworks.com" \
			-Dcf_by="perl-bugs" \
			-Dlibperl=libperl.so \
			-Dmyhostname="localhost" \
			-Dprefix=/usr/perl5/$(MACH64)/$(PERL_VERSION) \
                        -Dprivlib=/usr/perl5/$(MACH64)/$(PERL_VERSION)/lib \
			-Dsitelib=/usr/perl5/$(MACH64)/site_perl/$(PERL_VERSION) \
			-Dsiteprefix=/usr/perl5/$(MACH64)/$(PERL_VERSION) \
			-Dvendorlib=/usr/perl5/$(MACH64)/vendor_perl/$(PERL_VERSION) \
			-Dvendorprefix=/usr/perl5/$(MACH64)/$(PERL_VERSION) \
			-Duse64bitint \
			-Duseshrplib \
			-Dusedtrace \
			-Uuselargefiles 

CONFIGURE_OPTIONS = $(CONFIGURE_OPTIONS.$(BITS))
COMPONENT_INSTALL_ENV	+=	DESTDIR="$(PROTO_DIR)"

#
# perl's install path for sparc is based off the value of the
# "arch" command.  So we must package that way also.
#
PKG_MACROS		+=	-D P_ARCH=$(shell arch)

#
# Getting 1 different result between sparc and x86.
#
COMPONENT_TEST_MASTER = $(COMPONENT_TEST_RESULTS_DIR)/results-$(MACH).master

#
# Throw out everything prior to test results.
# 2 x delete timings
#
COMPONENT_TEST_TRANSFORMS += \
	'-e "1,/runtests choose/d"' \
	'-e "/^u=/d" ' \
	'-e "/^Elapsed/d"'


build:		$(BUILD_32_and_64)

install:	$(INSTALL_32_and_64)

test:		$(TEST_32_and_64)

#
# Needs berkeledb-5 during build
#
