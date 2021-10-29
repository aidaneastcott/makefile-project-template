
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

# Target binary name
TARGET ?= target

# Project root directory
PROJECT_DIR ?= .

# Common root directory
COMMON_DIR ?= ../Common

# Project directories
PROJECT_TARGET_DIR  := $(PROJECT_DIR)/$(TARGET_DIR)
PROJECT_BUILD_DIR   := $(PROJECT_DIR)/$(BUILD_DIR)
PROJECT_SOURCE_DIR  := $(PROJECT_DIR)/$(SOURCE_DIR)
PROJECT_INCLUDE_DIR := $(PROJECT_DIR)/$(INCLUDE_DIR)

# Common directories
COMMON_BUILD_DIR   := $(COMMON_DIR)/$(BUILD_DIR)
COMMON_SOURCE_DIR  := $(COMMON_DIR)/$(SOURCE_DIR)
COMMON_INCLUDE_DIR := $(COMMON_DIR)/$(INCLUDE_DIR)

# Retrieve project target filename
PROJECT_TARGET := $(PROJECT_TARGET_DIR)/$(TARGET)

# Retrieve project source, header, and object filenames
PROJECT_SOURCES := $(wildcard $(PROJECT_SOURCE_DIR)/*.$(SOURCE_EXT))
PROJECT_HEADERS := $(wildcard $(PROJECT_INCLUDE_DIR)/*.$(HEADER_EXT))
PROJECT_OBJECTS := $(patsubst $(PROJECT_SOURCE_DIR)/%,$(PROJECT_BUILD_DIR)/%,$(PROJECT_SOURCES:.$(SOURCE_EXT)=.$(OBJECT_EXT)))

# Retrieve common source, header, and object filenames
COMMON_SOURCES := $(wildcard $(COMMON_SOURCE_DIR)/*.$(SOURCE_EXT))
COMMON_HEADERS := $(wildcard $(COMMON_INCLUDE_DIR)/*.$(HEADER_EXT))
COMMON_OBJECTS := $(patsubst $(COMMON_SOURCE_DIR)/%,$(COMMON_BUILD_DIR)/%,$(COMMON_SOURCES:.$(SOURCE_EXT)=.$(OBJECT_EXT)))

# Retrieve include directory compiler flags
INCLUDE_DIR_FLAGS := $(foreach dir,$(PROJECT_INCLUDE_DIR),-I$(dir)) $(foreach dir,$(COMMON_INCLUDE_DIR),-I$(dir))

# Append include directory and library flags
CFLAGS += $(INCLUDE_DIR_FLAGS)

# Set phony targets
.PHONY: all release debug directories clean

# Make all
all: release

# Make release and debug compiler flags
release: CFLAGS += $(RELEASE_FLAGS)
debug:   CFLAGS += $(DEBUG_FLAGS) $(WARNING_FLAGS)

# Make release and debug
release debug: directories $(PROJECT_TARGET)

# Make project target
$(PROJECT_TARGET): $(PROJECT_OBJECTS)
	$(CC) $(CFLAGS) $(PROJECT_OBJECTS) $(COMMON_OBJECTS) -o $@

# Make project objects
$(PROJECT_BUILD_DIR)/%.$(OBJECT_EXT): $(PROJECT_SOURCE_DIR)/%.$(SOURCE_EXT) $(PROJECT_HEADERS) $(COMMON_HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Make directories
directories: $(PROJECT_TARGET_DIR) $(PROJECT_BUILD_DIR)

# Make project target and build directory
$(PROJECT_TARGET_DIR) $(PROJECT_BUILD_DIR):
	@ $(MAKE_DIR) $@

# Make clean
clean:
	$(REMOVE) $(BUILD_DIR)/*
	$(REMOVE) $(TARGET_DIR)/*
