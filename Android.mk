LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

#ifeq ($(TARGET_ARCH),arm)
#	LOCAL_CFLAGS += -DOPENSSL_BN_ASM_MONT -DAES_ASM -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM
#	LOCAL_SRC_FILES:= 0.9.9-dev/bn/armv4-mont.s \
#	                  0.9.9-dev/aes/aes-armv4.s \
#	                  0.9.9-dev/sha/sha1-armv4-large.s \
#	                  0.9.9-dev/sha/sha256-armv4.s \
#	                  0.9.9-dev/sha/sha512-armv4.s
#else
#	LOCAL_SRC_FILES:= aes/aes_core.c
#endif

LOCAL_SRC_FILES:= \
	base64.c base64.h \
	basic.h \
	buffer.c buffer.h \
	circ_list.h \
	common.h \
	crypto.c crypto.h \
	dhcp.c dhcp.h \
	errlevel.h \
	error.c error.h \
	event.c event.h \
	fdmisc.c fdmisc.h \
        forward.c forward.h forward-inline.h \
	fragment.c fragment.h \
	gremlin.c gremlin.h \
	helper.c helper.h \
	lladdr.c lladdr.h \
	init.c init.h \
	integer.h \
        interval.c interval.h \
	list.c list.h \
	lzo.c lzo.h \
	manage.c manage.h \
	mbuf.c mbuf.h \
        memdbg.h \
	misc.c misc.h \
	mroute.c mroute.h \
	mss.c mss.h \
	mtcp.c mtcp.h \
	mtu.c mtu.h \
	mudp.c mudp.h \
	multi.c multi.h \
        ntlm.c ntlm.h \
	occ.c occ.h occ-inline.h \
	pkcs11.c pkcs11.h \
	openvpn.c openvpn.h \
	openvpn-plugin.h \
	options.c options.h \
	otime.c otime.h \
	packet_id.c packet_id.h \
	perf.c perf.h \
	pf.c pf.h pf-inline.h \
	ping.c ping.h ping-inline.h \
	plugin.c plugin.h \
	pool.c pool.h \
	proto.c proto.h \
	proxy.c proxy.h \
	ieproxy.h ieproxy.c \
        ps.c ps.h \
	push.c push.h \
	reliable.c reliable.h \
	route.c route.h \
	schedule.c schedule.h \
	session_id.c session_id.h \
	shaper.c shaper.h \
	sig.c sig.h \
	socket.c socket.h \
	socks.c socks.h \
	ssl.c ssl.h \
	status.c status.h \
	syshead.h \
	thread.c thread.h \
	tun.c tun.h \
	win32.h win32.c \
	cryptoapi.h cryptoapi.c\
	rsa_depr.c

#LOCAL_CFLAGS += -DNO_WINDOWS_BRAINDEATH 

#include $(LOCAL_PATH)/../android-config.mk

LOCAL_C_INCLUDES += \
	external/openssl \
	external/openssl/include \
	external/openssl/crypto \
	external/lzo/include

# LOCAL_SHARED_LIBRARIES += libengines
LOCAL_SHARED_LIBRARIES += libcrypto libssl liblzo

ifneq ($(TARGET_SIMULATOR),true)
	LOCAL_SHARED_LIBRARIES += libdl
endif

#LOCAL_LDLIBS += -ldl -lcrypto -lssl
LOCAL_LDLIBS += -ldl

LOCAL_MODULE:= openvpn
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

include $(BUILD_EXECUTABLE)
#include $(BUILD_SHARED_LIBRARY)
