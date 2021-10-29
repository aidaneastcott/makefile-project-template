
# Delete file and make directory commands
export REMOVE   ?= rm -f
export MAKE_DIR ?= mkdir -p

# Compile command
export CC ?= cc

# Compiler warning flags
export WARNING_FLAGS ?= \
-Wall -Wextra -Wpedantic -Wfloat-equal -Wpointer-arith -Wshadow -Wstrict-prototypes \
-Wstrict-overflow=4 -Wwrite-strings -Waggregate-return -Wcast-qual -Wswitch-default \
-Wswitch-enum -Wconversion -Wunreachable-code -Wformat=2 -Winit-self -Wuninitialized \
-Wold-style-definition -Wmissing-prototypes

# Release and debug specific compiler flags
export RELEASE_FLAGS ?= -O2 -DNDEBUG -Werror
export DEBUG_FLAGS   ?= -Og -g

# File extensions
export SOURCE_EXT ?= c
export HEADER_EXT ?= h
export OBJECT_EXT ?= o

# Directory names
export TARGET_DIR  ?= bin
export BUILD_DIR   ?= obj
export SOURCE_DIR  ?= src
export INCLUDE_DIR ?= inc

# Project root directory
PROJECT_DIR ?= .

# Project names
COMMON      ?= Common
SUB_PROJECT ?= Project

# Project directories
COMMON_DIR      := $(PROJECT_DIR)/$(COMMON)
SUB_PROJECT_DIR := $(PROJECT_DIR)/$(SUB_PROJECT)

# Set phony targets
.PHONY: all release debug clean

# Make all
all: release

# Make release and debug
release debug:
	$(MAKE) -C $(COMMON_DIR) $@
	$(MAKE) -C $(SUB_PROJECT_DIR) $@ TARGET=$(SUB_PROJECT)

# Make clean
clean:
	$(MAKE) -C $(COMMON_DIR) $@
	$(MAKE) -C $(SUB_PROJECT_DIR) $@
