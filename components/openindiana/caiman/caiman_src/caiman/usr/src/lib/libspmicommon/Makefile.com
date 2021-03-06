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

#
# Copyright 2008 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#
#
# SPMI common library makefile
#

LIBRARY	= libspmicommon.a
VERS	= .1

OBJECTS	= \
	common_arch.o \
	common_boolean.o \
	common_client.o \
	common_linklist.o \
	common_misc.o \
	common_mmap.o \
	common_mount.o \
	common_pathcanon.o \
	common_post.o \
	common_proc.o \
	common_process_control.o \
	common_scriptwrite.o \
	common_strlist.o \
	common_url.o \
	common_util.o

SRCS =	$(OBJECTS:.o=.c)

include ../../Makefile.lib

SRCDIR		= ..
CPPFLAGS	+= -D${ARCH}
CFLAGS		+= $(DEBUG_CFLAGS) -Xa ${CPPFLAGS}
LDFLAGS		+=
SOFLAGS		+= -ldl -lwanboot

LINTERR		= lint_errors
LINTFILES	= ${SRCS:%.c=${ARCH}/%.ln}
LINTFLAGS	= -umx ${CPPFLAGS}

.KEEP_STATE:

all: $(HDRS) .WAIT static dynamic

static: $(LIBS)

dynamic: $(DYNLIB) $(DYNLIBLINK)

common_proc:	objs/$(ARCH)/$(LIBRARY)
		$(CC) -o objs/$(ARCH)/$@ -DMODULE_TEST $@.c \
			objs/$(ARCH)/common_proc.o \
			objs/$(ARCH)/$(LIBRARY)

lint:  ${SRCS} ${HDRS}
	${LINT.c} ${SRCS}

include ../../Makefile.targ
