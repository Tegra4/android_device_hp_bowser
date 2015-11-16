LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
	LOCAL_CFLAGS += -DSAMPLE_RATE_48K
endif

ifeq ($(BOARD_VENDOR),hp)
	LOCAL_CFLAGS += -DHP_A2DP_ENHACEMENTS
endif

LOCAL_SRC_FILES := \
	audio_a2dp_hw.c

LOCAL_C_INCLUDES += \
	. \
	external/bluetooth/bluedroid/audio_a2dp_hw \
	external/bluetooth/bluedroid/utils/include

LOCAL_CFLAGS += -std=c99

LOCAL_MODULE := audio.a2dp.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SHARED_LIBRARIES := libcutils liblog

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
