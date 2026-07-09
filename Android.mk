#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),le7n)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

include $(CLEAR_VARS)
LOCAL_MODULE := recovery_hal_symlinks
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := Android.mk
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_OUT)/root/vendor
LOCAL_POST_INSTALL_CMD := \
    mkdir -p $(TARGET_RECOVERY_OUT)/root/vendor/lib64/hw && \
    ln -sf /system/lib64/hw/android.hardware.boot@1.0-impl-1.1-mtkimpl.so $(TARGET_RECOVERY_OUT)/root/vendor/lib64/hw/android.hardware.boot@1.0-impl-1.1-mtkimpl.so && \
    ln -sf /system/lib64/hw/android.hardware.fastboot@1.0-impl-mock.so $(TARGET_RECOVERY_OUT)/root/vendor/lib64/hw/android.hardware.fastboot@1.0-impl-mock.so && \
    ln -sf /system/lib64/hw/android.hardware.health@2.0-impl-default.so $(TARGET_RECOVERY_OUT)/root/vendor/lib64/hw/android.hardware.health@2.0-impl-default.so
include $(BUILD_PREBUILT)

endif
