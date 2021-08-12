include $(BUILD_ROOT)/mk/configs/compiler/ccs7.0_r4_common.mk
# We dont want to include UT flags for the R5 b/c it will use the std library
#include $(BUILD_ROOT)/mk/configs/compiler/ut_flags.mk

CFLAGS := 	$(DEBUG) \
			$(OPT_SPEED) \
			\
			$(CUBEIDE_CFLAGS_COMMON) \
			$(CUBEIDE_M7_COMMON_FLAGS) \
			$(CUBEIDE_M7_COMMON_INCLUDES)
			#$(UT_FLAGS)


CXXFLAGS := $(DEBUG) \
			$(OPT_SPEED) \
			\
			$(CUBEIDE_CXXFLAGS_COMMON) \
			$(CUBEIDE_M7_COMMON_FLAGS) \
			$(CUBEIDE_M7_COMMON_INCLUDES)
			#$(UT_FLAGS)


COMPILER := stm32-debug-opt-cubeide1.6.1
