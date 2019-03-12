### TOP ###
MKFILE_PATH					= $(abspath $(lastword $(MAKEFILE_LIST)))
TOP_DIR							= $(shell dirname $(MKFILE_PATH))

### DIRECTORIES ###
SOURCE_DIR					= $(TOP_DIR)/src
OUTPUT_DIR					= $(TOP_DIR)/build

### COMPILATION ###
CC									= gcc
CFLAGS    					= -g -Wall
ARGS								?= 10
INT									?= 2
LOOP								?= 2

### WILDCARDS ###
SOURCE_SW						=	$(wildcard $(shell find $(SOURCE_DIR)/* -name "*.c"))
OUTPUT_SW						=	$(patsubst $(SOURCE_DIR)/%.c,$(OUTPUT_DIR)/%.o,$(SOURCE_SW))

### MAIN SCRIPT ###
SCRIPT							=	$(TOP_DIR)/run.sh

### RULES ###
all: compile run

compile: $(OUTPUT_SW)

run: $(OUTPUT_SW) $(SOURCE_SW) $(SCRIPT)
	$(SCRIPT) $(OUTPUT_SW) ${ARGS} ${INT} ${LOOP}

clean:
	rm -rf ./build/*.o

clean-all:
	rm -rf ./build

$(OUTPUT_SW): $(SOURCE_SW)
	@(mkdir -p $(OUTPUT_DIR))
	$(CC) $< $(CFLAGS) -o $@

.PHONY: all compile run clean clean-all
