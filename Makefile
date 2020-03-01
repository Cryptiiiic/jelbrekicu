export ARCHS = armv7 arm64 arm64e
export TARGET = iphone:clang:12.1.1:8.0
DEBUG = 0
FINALPACKAGE = 1
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = JelbrekICU
JelbrekICU_FILES = Tweak.xm
JelbrekICU_LIBRARIES = jelbrekicu
JelbrekICU_EXTRA_FRAMEWORKS = Cephei
JelbrekICU_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

purge::
	@rm -Rf .theos packages
	@find . -name .DS_Store -delete
	$(ECHO_BEGIN)$(PRINT_FORMAT_RED) "Purging"$(ECHO_END); $(ECHO_PIPEFAIL)

SUBPROJECTS += jelbrekicuprefs
include $(THEOS_MAKE_PATH)/aggregate.mk