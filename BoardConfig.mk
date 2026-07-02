#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/tecno/le7n

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    vbmeta_system \
    system \
    product \
    vbmeta_vendor \
    system_ext \
    vendor
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := TECNO-LE7n
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 480

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := le7n_defconfig
TARGET_KERNEL_SOURCE := kernel/tecno/le7n
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_MKBOOTIMG_ARGS += \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --second_offset $(BOARD_KERNEL_SECOND_OFFSET) \
    --dtb_offset $(BOARD_DTB_OFFSET)

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := tecno_dynamic_partitions
BOARD_TECNO_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system_ext \
    system \
    vendor \
    product
BOARD_TECNO_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata tranfs

# Platform
TARGET_BOARD_PLATFORM := mt6768

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6768
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-03-05

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/rootdir/etc/fstab.mt6768:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6768

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Vendor manifests
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/android.hardware.boot@1.1.xml \
    $(DEVICE_PATH)/vintf/android.hardware.cas@1.2-service.xml \
    $(DEVICE_PATH)/vintf/android.hardware.gpu@1.0-service.xml \
    $(DEVICE_PATH)/vintf/android.hardware.health@2.1.xml \
    $(DEVICE_PATH)/vintf/android.hardware.neuralnetworks@1.3-service-mtk-gpu.xml \
    $(DEVICE_PATH)/vintf/android.hardware.wifi.hostapd.xml \
    $(DEVICE_PATH)/vintf/android.hardware.wifi@1.0-service.xml \
    $(DEVICE_PATH)/vintf/lights-mtk-default.xml \
    $(DEVICE_PATH)/vintf/manifest.xml \
    $(DEVICE_PATH)/vintf/manifest_android.hardware.drm@1.3-service.clearkey.xml \
    $(DEVICE_PATH)/vintf/manifest_android.hardware.drm@1.3-service.widevine.xml \
    $(DEVICE_PATH)/vintf/manifest_storage.xml \
    $(DEVICE_PATH)/vintf/manifest_tneengine.xml \
    $(DEVICE_PATH)/vintf/power-default.xml \
    $(DEVICE_PATH)/vintf/vendor.mediatek.hardware.dplanner@2.0-service.xml \
    $(DEVICE_PATH)/vintf/vendor.mediatek.hardware.paytrigger@1.0-service.xml \
    $(DEVICE_PATH)/vintf/vendor.mediatek.hardware.tranHwInfo@1.0.xml \
    $(DEVICE_PATH)/vintf/vendor.transsion.hardware.trancam.trancamserver@1.0.xml \
    $(DEVICE_PATH)/vintf/vibrator-mtk-default.xml

# ODM manifests
ODM_MANIFEST_FILES += \
    $(DEVICE_PATH)/vintf/manifest_dsds.xml \
    $(DEVICE_PATH)/vintf/manifest_qsqs.xml \
    $(DEVICE_PATH)/vintf/manifest_ss.xml \
    $(DEVICE_PATH)/vintf/manifest_tsts.xml

# Inherit the proprietary files
include vendor/tecno/le7n/BoardConfigVendor.mk
