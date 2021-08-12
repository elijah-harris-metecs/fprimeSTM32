include $(BUILD_ROOT)/mk/configs/compiler/cubeide1.6.1-common.mk

CFLAGS := 	$(DEBUG) \
			$(OPT_SPEED) \
			\
			$(CUBEIDE_CFLAGS_COMMON) \
			$(CUBEIDE_M7_COMMON_FLAGS) \
			$(CUBEIDE_M7_COMMON_INCLUDES)

CXXFLAGS := $(DEBUG) \
			$(OPT_SPEED) \
			\
			$(CUBEIDE_CXXFLAGS_COMMON) \
			$(CUBEIDE_M7_COMMON_FLAGS) \
			$(CUBEIDE_M7_COMMON_INCLUDES)


COMPILER := stm32-debug-opt-cubeide1.6.1

