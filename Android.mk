LOCAL_PATH:= $(call my-dir)

#on a 32bit maschine run ./configure --enable-password-save --disable-pkcs11 --with-ifconfig-path=/system/bin/ifconfig --with-route-path=/system/bin/route
#from generated Makefile copy variable contents of openvpn_SOURCES to common_SRC_FILES
# append missing.c to the end of the list
# missing.c defines undefined functions.
# in tun.c replace /dev/net/tun with /dev/tun

common_SRC_FILES := $(call all-c-files-under, $(LOCAL_PATH) )

#common_CFLAGS += -DNO_WINDOWS_BRAINDEATH 

common_C_INCLUDES += \
	$(LOCAL_PATH)/../openssl \
	$(LOCAL_PATH)/../openssl/include \
	$(LOCAL_PATH)/../openssl/crypto \
	$(LOCAL_PATH)/../liblzo/include \
	$(LOCAL_PATH)

common_SHARED_LIBRARIES := 

ifneq ($(TARGET_SIMULATOR),true)
	common_SHARED_LIBRARIES += libdl
endif

# static linked binary
# =====================================================

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(common_SRC_FILES)
LOCAL_CFLAGS:= $(common_CFLAGS)
LOCAL_C_INCLUDES:= $(common_C_INCLUDES)

LOCAL_SHARED_LIBRARIES += $(common_SHARED_LIBRARIES)
LOCAL_STATIC_LIBRARIES:= libssl-static libcrypto-static libopenssl-static liblzo-static

#LOCAL_LDLIBS += -ldl
#LOCAL_PRELINK_MODULE:= false

LOCAL_MODULE:= openvpn-static
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
include $(BUILD_EXECUTABLE)

## dynamic linked binary
## =====================================================
#
#include $(CLEAR_VARS)
#LOCAL_SRC_FILES:= $(common_SRC_FILES)
#LOCAL_CFLAGS:= $(common_CFLAGS)
#LOCAL_C_INCLUDES:= $(common_C_INCLUDES)
#
#LOCAL_SHARED_LIBRARIES:= $(common_SHARED_LIBRARIES) libssl libcrypto liblzo
#
##LOCAL_LDLIBS += -ldl
##LOCAL_PRELINK_MODULE:= false
#
#LOCAL_MODULE:= openvpn
#LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
#include $(BUILD_EXECUTABLE)
