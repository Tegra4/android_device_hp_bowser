LOCAL_PATH := $(call my-dir)

# Camera

include $(CLEAR_VARS)

LOCAL_SRC_FILES := camera.cpp
LOCAL_SHARED_LIBRARIES := libui
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# ICU

include $(CLEAR_VARS)

LOCAL_SRC_FILES := icu51.c
LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE := libshim_icu
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


# NV OMX

include $(CLEAR_VARS)

LOCAL_SRC_FILES := nvomx.cpp
LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_MODULE := libshim_nvomx
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# Widevine

include $(CLEAR_VARS)

LOCAL_SRC_FILES := wvm.cpp
LOCAL_SHARED_LIBRARIES := libstagefright_foundation libmedia libnvrm
LOCAL_MODULE := libshim_wvm
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
