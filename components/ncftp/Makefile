
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

#
# Copyright (c) 2011, 2013, Oracle and/or its affiliates. All rights reserved.
#

include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		ncftp
COMPONENT_VERSION=	3.2.6
COMPONENT_PROJECT_URL=	http://www.ncftp.com/ncftp/
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC)-src.tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:129e5954850290da98af012559e6743de193de0012e972ff939df9b604f81c23
COMPONENT_ARCHIVE_URL=	ftp://ftp.ncftp.com/ncftp/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=	utility/ncftp-client

include ../../make-rules/prep.mk
include ../../make-rules/configure.mk
include ../../make-rules/ips.mk

COMPONENT_PRE_CONFIGURE_ACTION = \
	($(CLONEY) $(SOURCE_DIR) $(@D))

CONFIGURE_OPTIONS = --prefix=$(CONFIGURE_PREFIX)
CONFIGURE_OPTIONS += --srcdir=$(BUILD_DIR_32) 

ASLR_MODE = $(ASLR_ENABLE)

include ../../make-rules/shared-targets.mk

# common targets
build:		$(BUILD_32)

install:	$(INSTALL_32)

BUILD_PKG_DEPENDENCIES =	$(BUILD_TOOLS)

test:	$(NO_TESTS)

include ../../make-rules/depend.mk
