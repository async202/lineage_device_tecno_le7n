#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=le7n
VENDOR=tecno

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

function blob_fixup() {
    case "${1}" in
        vendor/etc/init/kpoc_charger.rc)
            sed -i 's|/system/bin/kpoc_charger|/vendor/bin/kpoc_charger|g' "${2}"
            ;;
    esac
}

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

if [ -f "${ANDROID_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary/priv-app/ImsService/ImsService.apk" ]; then
    echo "Re-signing ImsService.apk with platform keys (v1, v2, v3) to prevent sharedUserId signature mismatch..."
    java -jar "${ANDROID_ROOT}/prebuilts/sdk/tools/linux/lib/apksigner.jar" sign --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true --key "${ANDROID_ROOT}/build/target/product/security/platform.pk8" --cert "${ANDROID_ROOT}/build/target/product/security/platform.x509.pem" "${ANDROID_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary/priv-app/ImsService/ImsService.apk"
fi

"${MY_DIR}/setup-makefiles.sh"
