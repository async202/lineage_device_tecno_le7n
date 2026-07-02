#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from le7n device
$(call inherit-product, device/tecno/le7n/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := le7n
PRODUCT_NAME := lineage_le7n
PRODUCT_BRAND := TECNO
PRODUCT_MANUFACTURER := tecno

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DESCRIPTION="sys_tssi_64_tecno-user 11 RP1A.200720.011 100645 release-keys" \
    BUILD_FINGERPRINT="TECNO/TSSI/le7n:11/RP1A.200720.011/210420V289:user/release-keys"
