include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = JelbrekICUPrefs

JelbrekICUPrefs_FILES = $(wildcard *.m)
JelbrekICUPrefs_INSTALL_PATH = /Library/PreferenceBundles
JelbrekICUPrefs_FRAMEWORKS = UIKit
JelbrekICUPrefs_PRIVATE_FRAMEWORKS = Preferences
JelbrekICUPrefs_LIBRARIES = jelbrekicu
JelbrekICUPrefs_EXTRA_FRAMEWORKS = CepheiPrefs Cephei
JelbrekICUPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/JelbrekICUPrefs.plist$(ECHO_END)
