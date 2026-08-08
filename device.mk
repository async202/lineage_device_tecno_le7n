#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

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

PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery \
    android.hardware.boot@1.1-mtkimpl \
    android.hardware.boot@1.1-mtkimpl.recovery \
    android.hardware.boot@1.1-service \
    recovery_hal_symlinks

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

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
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 30

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# MTK proprietary power HAL (HIDL, for libPowerHal and vpud)
PRODUCT_PACKAGES += \
    libmtkperf_client_vendor


# USB
PRODUCT_PACKAGES += \
    android.hardware.usb.gadget@1.1-service

# Camera / VT / WFD Shims
PRODUCT_PACKAGES += \
    libshim_camera_metadata \
    libshim_sink \
    libstagefright_hdcp

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.adb.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.adb.rc

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1 \
    persist.sys.disable_rescue=true \
    ro.surface_flinger.supports_background_blur=0 \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.nohdcp=1 \
    media.wfd.use-sw-encoder=1 \
    debug.stagefright.wfd.encoder=c2.android.avc.encoder \
    persist.sys.volte_support=1 \
    telephony.lteOnGsmDevice=1 \
    ro.telephony.default_network=22,22,22,22 \
    persist.sys.volte_icon=1 \
    persist.sys.show_volte_icon=1 \
    lineage.updater.uri=https://raw.githubusercontent.com/async202/lineageOTA/main/{device}.json

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.mtk_volte_support=1 \
    persist.vendor.mtk_wfc_support=1 \
    persist.vendor.volte_support=1 \
    persist.vendor.mtk.volte.enable=1 \
    persist.vendor.mtk_ct_volte_support=1 \
    persist.vendor.ims_support=1 \
    persist.vendor.mtk_dynamic_ims_switch=1 \
    persist.vendor.mims_support=2 \
    ro.vendor.md_auto_setup_ims=1 \
    persist.vendor.radio.volte_support=1 \
    persist.sys.volte_support=1 \
    persist.vendor.radio.mtk_dsbp_support=2 \
    persist.vendor.radio.fd.counter=15 \
    persist.vendor.operator.optr=OP18 \
    persist.vendor.operator.spec=SEGDEFAULT \
    persist.vendor.operator.seg=DEFAULT \
    persist.vendor.mtk_operator_id=OP18 \
    persist.sys.operator.optr=OP18 \
    ro.vendor.operator.optr=OP18 \
    ro.vendor.operator.spec=SEGDEFAULT \
    ro.vendor.operator.seg=DEFAULT \
    ro.vendor.mtk_operator_id=OP18 \
    persist.vendor.audio.volte.enable=1 \
    # persist.dbg.volte_avail_ovr=1 \
    # persist.dbg.vt_avail_ovr=1 \
    # persist.dbg.wfc_avail_ovr=1 \
    persist.vendor.radio.volte_reg_status=1 \
    persist.vendor.radio.ims_registered=1 \
    persist.sys.cust.lte_config=1 \
    persist.vendor.radio.volte_support2=1 \
    persist.vendor.radio.msimmode=dsds \
    persist.vendor.radio.mtk_ps1_rat=L/W/G \
    persist.vendor.radio.mtk_ps2_rat=L/W/G \
    persist.vendor.radio.smart.data.switch=1 \
    persist.vendor.radio.ims_act_state=1 \
    persist.vendor.mtk_ims_video_call=1 \
    persist.vendor.radio.ims.capability.volte=1 \
    persist.vendor.radio.ims.capability.vt=1 \
    persist.vendor.radio.volte_cap=1 \
    persist.vendor.radio.vilte_cap=1 \
    persist.vendor.radio.vowfi_cap=1 \
    persist.vendor.radio.ims.capability.wfc=1 \
    persist.vendor.volte.enable=1 \
    persist.vendor.radio.volte.enable=1 \
    ro.vendor.md_auto_setup_ims=1 \
    persist.vendor.ims_support=1 \
    persist.vendor.mtk_dynamic_ims_switch=1 \
    persist.vendor.mims_support=2 \
    persist.vendor.volte_support=1 \
    persist.vendor.mtk.volte.enable=1 \
    persist.vendor.mtk_wfc_support=1 \
    persist.vendor.radio.ims_video_precond=0 \
    persist.vendor.radio.ims_audio_precond=0 \
    persist.vendor.mtk_ims_precond_support=0 \
    persist.vendor.radio.disable_precond=1 \
    persist.vendor.radio.disable_prcd=1 \
    vendor.net.ims.name=ccmni-ims \
    vendor.net.ims.ccmni=ccmni0 \
    vendor.ril.volte.enable=1 \
    vendor.ril.volte.status=1 \
    persist.vendor.audio.speech.mic.mode=0 \
    ro.vendor.audio.single.mic.support=1 \
    persist.vendor.audio.single.mic.support=1 \
    persist.vendor.audio.evs.support=1 \
    persist.vendor.audio.speech.evs.support=1 \
    vendor.usb.acm_enable=0 \
    vendor.usb.acm_cnt=0 \
    vendor.usb.controller=musb-hdrc \
    ro.vendor.camera.sub_flash=1 \
    ro.camera.sub_flash=1 \
    persist.vendor.camera.sub_flash=1 \
    vendor.camera.sub_flash=1

# System Properties
PRODUCT_SYSTEM_PROPERTIES += \
    sys.usb.controller=musb-hdrc \
    sys.usb.configfs=1

# IMS Service Package
PRODUCT_PACKAGES += \
    ImsService \
    mediatek-ims-base \
    mediatek-ims-common


# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \

PRODUCT_PACKAGES += \
    libkeymaster4.vendor \
    libkeymaster4support.vendor \
    libkeymaster_messages.vendor \
    libkeymaster_portable.vendor \
    fstab.mt6768 \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.ago.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6768.rc \
    init.mt6768.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    init.stnfc.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    multi_init.rc \
    init.recovery.mt6768.rc \

# PRODUCT_VENDOR_PROPERTIES += \


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6768:recovery/root/first_stage_ramdisk/fstab.mt6768

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Legacy VNDK dependencies for Mediatek blobs
PRODUCT_PACKAGES += \
    libhwbinder.vendor \
    libhidltransport.vendor

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    device/tecno/le7n/overlay

# Inherit the proprietary files
$(call inherit-product, vendor/tecno/le7n/le7n-vendor.mk)

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    audio.bluetooth.default
PRODUCT_PROPERTY_OVERRIDES += vendor.ril.mtk=1
PRODUCT_PROPERTY_OVERRIDES += ro.vendor.wlan.gen=gen4m
PRODUCT_PACKAGES += Camera2 libpcap

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    SecureElement \
    com.android.nfc_extras
-include device/tecno/le7n/vendor_prop.mk
-include device/tecno/le7n/config/properties/vendor_logtag.mk

# Media Codecs (Modified VP9 frame-rate limit)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Disable AOSP rild
PRODUCT_COPY_FILES += device/tecno/le7n/rootdir/etc/rild.rc:vendor/etc/init/rild.rc

# VNDK & Vendor libraries for mnld GNSS
PRODUCT_PACKAGES += \
    libcurl

PRODUCT_COPY_FILES += device/tecno/le7n/rootdir/etc/init.frontal_flash.rc:system/etc/init/init.frontal_flash.rc

# Graphics & Rendering optimizations (from phhuson GSI for MT6768 / Mali-G52)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.egl=mali \
    persist.vendor.tran_psi_adjust_kill_oom=false \
    vendor.mtk.vdec.waitkeyframeforplay=9 \
    ro.vendor.mtk_vdec_waitkeyframeforplay=9 \
    ro.vendor.mtk.vdec.waitkeyframeforplay=9 \
    ro.vendor.mtk_sec_video_path_support=1 \
    ro.vendor.pref_scale_enable_cfg=1 \
    media.stagefright.thumbnail.prefer_hw_codecs=true \
    vendor.camera.mdp.cz.enable=1 \
    vendor.camera.mdp.dre.enable=0 \
    ro.lmk.psi_complete_stall_ms=35 \
    ro.lmk.swap_free_low_percentage=10 \
    ro.lmk.psi_partial_stall_ms=35 \
    ro.lmk.thrashing_limit=10 \
    ro.lmk.thrashing_limit_decay=2 \
    ro.lmk.kill_timeout_ms=100 \
    persist.sys.mms.bg_apps_limit=64 \
    debug.sf.use_phase_offsets_as_durations=1 \
    debug.sf.late.sf.duration=30000000 \
    debug.sf.late.app.duration=24000000 \
    debug.sf.early.sf.duration=30000000 \
    debug.sf.early.app.duration=24000000 \
    debug.sf.earlyGl.sf.duration=30000000 \
    debug.sf.earlyGl.app.duration=24000000 \
    debug.sf.hwc.min.duration=23000000 \
    debug.sf.enable_gl_backpressure=0 \
    debug.hwui.renderer=skiagl \
    debug.renderengine.backend=skiagl \
    ro.hwui.use_vulkan=0

