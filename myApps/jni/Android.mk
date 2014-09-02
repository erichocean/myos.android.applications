
include $(CLEAR_VARS)
LOCAL_MODULE := MyApps
LOCAL_SRC_FILES := $(MY_APPLICATIONS_PATH)/MyApps/libMyApps.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := CoreFoundation
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libCoreFoundation.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := Foundation
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libFoundation.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := CoreGraphics
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libCoreGraphics.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NACoreGraphics
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libNACoreGraphics.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := CoreText
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libCoreText.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NACoreText
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libNACoreText.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := IOKit
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libIOKit.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NAIOKit
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libNAIOKit.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := OpenGLES
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libOpenGLES.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NAOpenGLES
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libNAOpenGLES.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := CoreAnimation
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libCoreAnimation.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NACoreAnimation
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libNACoreAnimation.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := UIKit
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libUIKit.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := NAUIKit
LOCAL_SRC_FILES := $(MY_FRAMEWORKS_PATH)/libs/libNAUIKit.so
include $(PREBUILT_SHARED_LIBRARY)