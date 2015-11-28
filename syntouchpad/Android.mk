LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := syntouchpad
LOCAL_SRC_FILES := syntouchpad.c
LOCAL_CPPFLAGS := -Wall

include $(BUILD_EXECUTABLE)

ifeq ($(TW_INCLUDE_SYNTOUCHPAD), true)

include $(CLEAR_VARS)

LOCAL_MODULE := syntouchpad_recovery
LOCAL_MODULE_STEM := syntouchpad
LOCAL_SRC_FILES := syntouchpad.c
LOCAL_CPPFLAGS := -Wall
LOCAL_LDFLAGS := -Wl,-dynamic-linker,/sbin/linker
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin

include $(BUILD_EXECUTABLE)

endif
