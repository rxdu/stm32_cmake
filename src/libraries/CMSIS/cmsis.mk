# CMSIS source path
CMSIS_DIR = $(LIB_DIR)/CMSIS

ifeq ($(PLATFORM), STM32F1)
	INCLUDES += -I$(CMSIS_DIR)/Core/Include
	INCLUDES += -I$(CMSIS_DIR)/Device/ST/STM32F1xx/Include
else ifeq ($(PLATFORM), STM32F4)
	INCLUDES += -I$(CMSIS_DIR)/Core/Include
	INCLUDES += -I$(CMSIS_DIR)/Device/ST/STM32F4xx/Include
else ifeq ($(PLATFORM), STM32F7)
	INCLUDES += -I$(CMSIS_DIR)/Core/Include
	INCLUDES += -I$(CMSIS_DIR)/Device/ST/STM32F7xx/Include
endif
