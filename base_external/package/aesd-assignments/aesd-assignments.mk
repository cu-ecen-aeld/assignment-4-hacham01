
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 2623d01176cde316db71b19fab64635d39b04bce
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-hacham01
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    # Create directories
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/bin
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/finder-app/conf
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/bin

    # Install configuration files
    $(INSTALL) -m 0644 $(@D)/conf/* \
        $(TARGET_DIR)/etc/finder-app/conf/

    # Install assignment 4 test scripts (allowed)
    $(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* \
        $(TARGET_DIR)/bin

    # Install finder and writer utilities
    $(INSTALL) -m 0755 $(@D)/finder-app/writer \
        $(TARGET_DIR)/usr/bin/writer
    $(INSTALL) -m 0755 $(@D)/finder-app/finder.sh \
        $(TARGET_DIR)/usr/bin/finder.sh
    $(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh \
        $(TARGET_DIR)/usr/bin/finder-test.sh
endef


$(eval $(generic-package))
