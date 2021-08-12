CUBEIDE_COMMON := --display_error_number --diag_warning=225 --diag_wrap=off

DEPEND_FILE := -ppa -ppd=
               
CUBEIDE_CFLAGS_COMMON := $(CUBEIDE_COMMON) --c99 

CUBEIDE_CXXFLAGS_COMMON := $(CUBEIDE_COMMON) --c++14 \
						--include_path=/usr/arm-linux-gnueabihf/include


# Special compiler flags to get around known AC warnings

AC_CC_FLAGS := 
AC_CXX_FLAGS :=
AC_HSM_FLAGS := 
AC_PARAMS_FLAGS := 

COMPILE_ONLY := --compile_only
COMPILE_TO := --output_file
LIBRARY_TO := 
LINK_BIN_TO := -o
INCLUDE_PATH := --include_path=

CUBEIDE_INCLUDES_COMMON := $(INCLUDE_PATH)$(BUILD_ROOT)/Fw/Types/StdIntInc


# Some warning override variables. These will go in individual modules where the warning-as-error needs to be overridden

NO_STRICT_ALIASING := -fno-strict-aliasing
NO_WARNINGS := -w

DEBUG := -g

OPT_SPEED := -O2 --opt_for_speed=5

OPT_SIZE := -O4 --opt_for_speed=0

OPT_NONE := -On

SYMBOL_CHECK := $(PYTHON_BIN) $(BUILD_ROOT)/mk/bin/empty.py