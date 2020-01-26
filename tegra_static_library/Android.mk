LOCAL_PATH := $(call my-dir)

# Camera
include $(CLEAR_VARS)
LOCAL_MODULE := libnvcameradata
LOCAL_SRC_FILES := libnvcameradata.a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libnvcameraframedata
LOCAL_SRC_FILES := libnvcameraframedata.a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# HWC
include $(CLEAR_VARS)
LOCAL_MODULE := libnvglcomposer
LOCAL_SRC_FILES := libnvglcomposer.a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .a
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libnvfxmath
LOCAL_SRC_FILES := libnvfxmath.a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .a
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libnvgr2dcomposer
LOCAL_SRC_FILES := libnvgr2dcomposer.a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .a
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libnvviccomposer
LOCAL_SRC_FILES := libnvviccomposer.a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .a
include $(BUILD_PREBUILT)

# Multimedia
include $(CLEAR_VARS)
LOCAL_MODULE := libnvmmtransport
LOCAL_SRC_FILES := libnvmmtransport.a
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .a
include $(PREBUILT_STATIC_LIBRARY)
