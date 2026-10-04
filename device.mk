#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# API levels
PRODUCT_SHIPPING_API_LEVEL := 30

# IMS
$(call inherit-product, vendor/mediatek/ims/ims.mk)

# A/B
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=$(BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=$(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# Boot control / fastbootd
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-mtkimpl \
    android.hardware.boot@1.1-mtkimpl.recovery \
    android.hardware.boot@1.1-service \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery \
    recovery_hal_symlinks

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.soundtrigger@2.3-impl \
    audio.bluetooth.default \
    libpcap

# Bluetooth (LDAC)
PRODUCT_PACKAGES += \
    libldacBT_abr \
    libldacBT_enc

# Camera / VT / WFD Shims
PRODUCT_PACKAGES += \
    libshim_camera_metadata \
    libshim_sink \
    libstagefright_hdcp

# Front Flashlight Tile & Hardware
PRODUCT_PACKAGES += \
    FrontFlash

# GPS
PRODUCT_PACKAGES += \
    libcurl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps_debug.conf

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# IMS Service Package
PRODUCT_PACKAGES += \
    ImsService \
    mediatek-ims-base \
    mediatek-ims-common

# Keymaster / Gatekeeper dependencies
PRODUCT_PACKAGES += \
    libkeymaster4.vendor \
    libkeymaster4support.vendor \
    libkeymaster_messages.vendor \
    libkeymaster_portable.vendor

# Media Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

# MTK proprietary power HAL (HIDL, for libPowerHal and vpud)
PRODUCT_PACKAGES += \
    libmtkperf_client_vendor

# NFC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-networkstack.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-networkstack.xml

PRODUCT_PACKAGES += \
    Camera2 \
    com.android.nfc_extras \
    FMRadio \
    NfcNci \
    SecureElement \
    Tag

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# RIL (disable AOSP rild)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.rc

# Rootdir
PRODUCT_PACKAGES += \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    fstab.mt6768 \
    init.aee.rc \
    init.ago.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6768.rc \
    init.mt6768.usb.rc \
    init.project.rc \
    init.recovery.mt6768.rc \
    init.sensor_1_0.rc \
    init.stnfc.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    multi_init.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6768:recovery/root/first_stage_ramdisk/fstab.mt6768 \
    $(LOCAL_PATH)/rootdir/etc/init.frontal_flash.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.frontal_flash.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb.gadget@1.1-service

# Legacy VNDK dependencies for Mediatek blobs
PRODUCT_PACKAGES += \
    libhidltransport.vendor \
    libhwbinder.vendor

# Vendor Logtags
include $(LOCAL_PATH)/vendor_logtag.mk

# Inherit the proprietary files
$(call inherit-product, vendor/tecno/le7n/le7n-vendor.mk)
