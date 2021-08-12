# Copied from CMU fork. 

include $(BUILD_ROOT)/mk/configs/compiler/include_common.mk
include $(BUILD_ROOT)/mk/configs/compiler/defines_common.mk
include $(BUILD_ROOT)/mk/configs/compiler/ccs7.0-common.mk
include $(BUILD_ROOT)/mk/configs/compiler/freertos_common.mk

#STM_CUBEIDE_DIR := /cygdrive/c/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.7.LTS
STM_CUBEIDE_DIR := /usr/bin

CUBEIDE_M7_COMMON_FLAGS :=  $(COMMON_DEFINES) \
                                $(CUBEIDE_FLAGS_COMMON) \
                                -mv7R4 \
                                --code_state=32 \
                                -me \
                                --abi=eabi --enum_type=packed \
                                $(FREERTOS_REAL_FLAGS_COMMON)



CUBEIDE_M7_COMMON_INCLUDES :=   $(COMMON_INCLUDES) \
                            $(CUBEIDE_INCLUDES_COMMON) \
                            $(INCLUDE_PATH)$(BUILD_ROOT)/R4/HAL/include \
                            $(FREERTOS_REAL_INCLUDES_COMMON)

COVERAGE :=

# TI compiles w/ armcl and archives w/ armar
CC :=  $(STM_CUBEIDE_DIR)/armcl
CXX := $(CC)

LINK_LIB := $(STM_CUBEIDE_DIR)/armar
LINK_LIB_FLAGS := r
POST_LINK_LIB := $(PYTHON_BIN) $(BUILD_ROOT)/mk/bin/empty.py	# Set to empty.py because we don't need any post library linking

LINK_LIBS :=    -l /usr/arm-linux-gnueabihf/lib/libc.a \
                $(BUILD_ROOT)/Os/FreeRTOS/FreeRTOS-Real/HAL/source/sys_link.cmd
                # -l$(BUILD_ROOT)/R4/R4FlashApi/F021_API_CortexR4_LE.lib 

LINK_BIN :=  $(CC)
LINK_BIN_FLAGS :=   -mv7R4 \
                    --code_state=32 \
                    --float_support=VFPv3D16 \
                    \
                    -g --c99 \
                    --display_error_number \
                    --diag_warning=225 \
                    --diag_wrap=off \
                    --abi=eabi \
                    --enum_type=packed \
                    -z \
                    -m"R4Bin.map" \
                    --heap_size=0x800 \
                    --stack_size=0x800 \
                    --generate_dead_funcs_list="R4Bin_dead_funcs.xml" \
                    --xml_link_info="R4Bin_linkInfo.xml" \
                    --rom_model \
                    --me \
                    --reread_libs \
                    --warn_sections \
                    --retain=resetEntry # Needed to populate .intvecs

# LINK_BIN_FLAGS :=   -mv7R5 \
#                     --code_state=32 \
#                     --float_support=VFPv3D16 \
#                     -g --c99 \
#                     --display_error_number \
#                     --diag_warning=225 \
#                     --diag_wrap=off \
#                     --abi=eabi \
#                     --enum_type=packed \
#                     -z -m"R5Bin.map" \
#                     --heap_size=0x600 \
#                     --stack_size=0x800 \
#                     --generate_dead_funcs_list="R5Bin_dead_funcs.xml" \
#                     --xml_link_info="R5Bin_linkInfo.xml" \
#                     --rom_model \
#                     --be32 \
#                     --reread_libs \
#                     --warn_sections \
#                     --retain=resetEntry # Needed to populate .intvecs

POST_LINK_BIN := $(BUILD_ROOT)/Bootloader/out2bin.sh
POST_LINK_POST_ARGS = $(subst .out,.bin,$@)

FILE_SIZE := $(LS) $(LS_SIZE)
LOAD_SIZE := $(SIZE)


DUMP = $(PYTHON_BIN) $(BUILD_ROOT)/mk/bin/empty.py
SYMBOL_SIZES = $(PYTHON_BIN) $(BUILD_ROOT)/mk/bin/empty.py
MUNCH := $(PYTHON_BIN) $(BUILD_ROOT)/mk/bin/empty.py

