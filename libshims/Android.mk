LOCAL_PATH := $(call my-dir)

# Camera

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    gui/SensorManager.cpp \
    ui/GraphicBufferAllocator.cpp \
    ui/GraphicBuffer.cpp \
    ui/GraphicBufferMapper.cpp \
    surface-control.cpp

LOCAL_SHARED_LIBRARIES := liblog libcutils libhardware libui libgui libbinder libutils libsync
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)

# ICU

include $(CLEAR_VARS)

LOCAL_SRC_FILES := icu51.c
LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE := libshim_icu
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# Widevine

include $(CLEAR_VARS)

LOCAL_SRC_FILES := wvm.cpp
LOCAL_SHARED_LIBRARIES := libstagefright_foundation libmedia libnvrm
LOCAL_MODULE := libshim_wvm
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
