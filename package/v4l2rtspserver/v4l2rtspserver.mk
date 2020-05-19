#############################################################
#
# v4l2rtspserver
#
#############################################################

V4L2RTSPSERVER_VERSION = 4940f1f98950793cc496bfd451af807abd991f41
V4L2RTSPSERVER_SITE = https://github.com/mpromonet/v4l2rtspserver.git
V4L2RTSPSERVER_SITE_METHOD = git
V4L2RTSPSERVER_LICENSE = UNLICENSE
V4L2RTSPSERVER_LICENSE_FILES = LICENSE
V4L2RTSPSERVER_INSTALL_TARGET = YES
V4L2RTSPSERVER_DEPENDENCIES = live555 v4l2cpp
V4L2RTSPSERVER_CFLAGS = $(TARGET_CFLAGS) -DVERSION=1

ifndef ($(BR2_ENABLE_LOCALE),y)
V4L2RTSPSERVER_CFLAGS += -DLOCALE_NOT_USED
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
V4L2RTSPSERVER_OPTS += "HAVE_ALSA=1"
endif

define V4L2RTSPSERVER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" EXTRA_CXXFLAGS="$(V4L2RTSPSERVER_CFLAGS)" PREFIX="$(STAGING_DIR)/usr" $(V4L2RTSPSERVER_OPTS) -C $(@D) all
endef

define V4L2RTSPSERVER_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)/usr/bin" -C $(@D) install
endef

$(eval $(generic-package))
