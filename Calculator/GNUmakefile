#   GNUmakefile: makefile for Calculator.app
#
#   Copyright (C) 1999 Free Software Foundation, Inc.
#
#   Author:  Nicola Pero <n.pero@mi.flashnet.it>
#   Date: 1999
#   
#   This file is part of GNUstep.
#   
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#   
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA. */

ifeq ($(GNUSTEP_MAKEFILES),)
  GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
  ifeq ($(GNUSTEP_MAKEFILES),)
    $(error You need to set GNUSTEP_MAKEFILES before compiling!)
  endif
endif

include $(GNUSTEP_MAKEFILES)/common.make

APP_NAME = Calculator
ADDITIONAL_OBJCFLAGS = -fblocks -DDEBUG
Calculator_HEADERS = CalcBrain.h CalcFace.h CalculatorAppDelegate.h
Calculator_OBJC_FILES = main.m CalcBrain.m CalcFace.m CalculatorAppDelegate.m
#Calculator_RESOURCE_FILES = Calculator.app.tiff
ADDITIONAL_OBJC_LIBS = -lUIKit -lCoreGraphics

include $(GNUSTEP_MAKEFILES)/application.make


