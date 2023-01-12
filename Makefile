MODULES = jailed
include $(THEOS)/makefiles/common.mk
ARCHS = arm64
TWEAK_NAME = chimerafixv2
DISPLAY_NAME = chimerafixv2
BUNDLE_ID = com.mineek.chimerafixv2

chimerafixv2_FILES = Tweak.xm
chimerafixv2_IPA = /Users/mineek/Downloads/1.6.4-12.2-12.5.ipa
chimerafixv2_USE_FISHHOOK = 1

include $(THEOS_MAKE_PATH)/tweak.mk
