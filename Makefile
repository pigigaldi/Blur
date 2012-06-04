include theos/makefiles/common.mk

TWEAK_NAME = Blur
Blur_FILES = Tweak.xm
Blur_FRAMEWORKS = UIKit QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk
