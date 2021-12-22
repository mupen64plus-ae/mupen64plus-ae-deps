JNI_LOCAL_PATH := $(call my-dir)

COMMON_CFLAGS :=                    \
    -O3                             \
    -ffast-math                     \
    -fno-strict-aliasing            \
    -fomit-frame-pointer            \
    -fvisibility=hidden

COMMON_CPPFLAGS :=                  \
    -fvisibility-inlines-hidden     \
    -O3                             \
    -ffast-math                     \

include $(JNI_LOCAL_PATH)/SDL2/Android.mk
include $(JNI_LOCAL_PATH)/SDL_net/Android.mk
include $(JNI_LOCAL_PATH)/soundtouch/source/Android-lib/jni/Android.mk
include $(JNI_LOCAL_PATH)/png.mk
include $(JNI_LOCAL_PATH)/freetype.mk
include $(JNI_LOCAL_PATH)/GL/GL/Android.mk
include $(JNI_LOCAL_PATH)/miniupnp-build/Android.mk
include $(JNI_LOCAL_PATH)/natpmp.mk
