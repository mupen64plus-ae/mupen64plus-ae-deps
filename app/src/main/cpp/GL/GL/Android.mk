include $(CLEAR_VARS)
LOCAL_PATH := $(JNI_LOCAL_PATH)
SRCDIR := GL

LOCAL_ARM_MODE := arm
LOCAL_MODULE:= EGLLoader

LOCAL_C_INCLUDES +=   \
    $(LOCAL_PATH)/$(SRCDIR)

LOCAL_SRC_FILES:= \
	$(SRCDIR)/GL/EGLLoader.cpp

LOCAL_CFLAGS := -DEGL

LOCAL_LDLIBS := -lEGL

LOCAL_CPPFLAGS := $(COMMON_CPPFLAGS) -Wno-unused-value -std=c++11

include $(BUILD_STATIC_LIBRARY)

# This is only need because the NDK won't build a static library if it's not used, so it here
include $(CLEAR_VARS)
LOCAL_PATH := $(JNI_LOCAL_PATH)
SRCDIR := GL

LOCAL_ARM_MODE := arm
LOCAL_MODULE:= EGLLoaderDummy

LOCAL_C_INCLUDES +=   \
    $(LOCAL_PATH)/$(SRCDIR)

LOCAL_SRC_FILES:= \
	$(SRCDIR)/GL/EGLLoader.cpp

LOCAL_CFLAGS := -DEGL

LOCAL_LDLIBS := -lEGL

LOCAL_CPPFLAGS := $(COMMON_CPPFLAGS) -Wno-unused-value -std=c++11

LOCAL_SHARED_LIBRARIES := EGLLoader

include $(BUILD_SHARED_LIBRARY)