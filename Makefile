TARGET := iphone:clang:latest:12.0


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = chimerafix

chimerafix_FILES = Tweak.xm
chimerafix_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk