include $(CLEAR_VARS)

LOCAL_PATH := $(JNI_LOCAL_PATH)

LOCAL_MODULE    := natpmp
LOCAL_ARM_MODE := arm

# Note: LOCAL_PATH is the directory this file is in.
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libnatpmp

LOCAL_SRC_FILES := \
    libnatpmp/natpmp.c \
    libnatpmp/natpmpc.c \
    libnatpmp/getgateway.c

LOCAL_CFLAGS := -O3 -fsigned-char -fno-strict-aliasing -Wall -Wno-multichar -D__STDC_CONSTANT_MACROS
LOCAL_CPPFLAGS := -fno-exceptions -std=gnu++11 -fno-rtti -Wno-reorder

ifeq ($(findstring armeabi-v7a,$(TARGET_ARCH_ABI)),armeabi-v7a)
LOCAL_CFLAGS := $(LOCAL_CFLAGS)
else ifeq ($(TARGET_ARCH_ABI),armeabi)
LOCAL_CFLAGS := $(LOCAL_CFLAGS) -march=armv6
else ifeq ($(TARGET_ARCH_ABI),x86)
LOCAL_CFLAGS := $(LOCAL_CFLAGS) -D_M_IX86
else ifeq ($(TARGET_ARCH_ABI),x86_64)
LOCAL_CFLAGS := $(LOCAL_CFLAGS) -D_M_X64
endif

include $(BUILD_SHARED_LIBRARY)
