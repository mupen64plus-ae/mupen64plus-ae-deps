LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(TARGET_ARCH_ABI), armeabi-v7a)
    LOCAL_CFLAGS := -mfpu=neon -DPNG_ARM_NEON_OPT=2 -DPNG_ARM_NEON_API_SUPPORTED
else ifeq ($(TARGET_ARCH_ABI), x86)
    LOCAL_CFLAGS := -DPNG_INTEL_SSE_IMPLEMENTATION
endif

LOCAL_CFLAGS += -O3

LOCAL_C_INCLUDES := $(LOCAL_PATH)/png
LOCAL_MODULE    := libpng
LOCAL_SRC_FILES :=\
	png/png.c \
	png/pngerror.c \
	png/pngget.c \
	png/pngmem.c \
	png/pngpread.c \
	png/pngread.c \
	png/pngrio.c \
	png/pngrtran.c \
	png/pngrutil.c \
	png/pngset.c \
	png/pngtest.c \
	png/pngtrans.c \
	png/pngwio.c \
	png/pngwrite.c \
	png/pngwtran.c \
	png/pngwutil.c

ifeq ($(TARGET_ARCH_ABI), armeabi-v7a)
LOCAL_SRC_FILES +=\
	png/arm/arm_init.c \
	png/arm/filter_neon.S \
	png/arm/filter_neon_intrinsics.c
else ifeq ($(TARGET_ARCH_ABI), x86)
LOCAL_SRC_FILES +=\
	png/intel/intel_init.c \
	png/intel/filter_sse2_intrinsics.c
endif

#LOCAL_SHARED_LIBRARIES := -lz
LOCAL_EXPORT_LDLIBS := -lz
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/.

#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)
