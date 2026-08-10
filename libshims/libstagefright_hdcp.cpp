/*
 * Copyright (C) 2023 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <media/hardware/HDCPAPI.h>
#include <cstring>

namespace android {

struct DummyHDCPModule : public HDCPModule {
    void *mCookie;
    ObserverFunc mObserver;

    DummyHDCPModule(void *cookie, ObserverFunc observerNotify)
        : HDCPModule(cookie, observerNotify),
          mCookie(cookie),
          mObserver(observerNotify) {}

    virtual ~DummyHDCPModule() {}

    virtual status_t initAsync(const char * /*addr*/, unsigned /*port*/) override {
        if (mObserver) {
            mObserver(mCookie, HDCP_INITIALIZATION_COMPLETE, 0, 0);
        }
        return OK;
    }

    virtual status_t shutdownAsync() override {
        if (mObserver) {
            mObserver(mCookie, HDCP_SHUTDOWN_COMPLETE, 0, 0);
        }
        return OK;
    }

    virtual uint32_t getCaps() override {
        return 0;
    }

    virtual status_t encrypt(
            const void *inData, size_t size, uint32_t /*streamCTR*/,
            uint64_t *outInputCTR, void *outData) override {
        memcpy(outData, inData, size);
        if (outInputCTR) *outInputCTR = 0;
        return OK;
    }

    virtual status_t encryptNative(
            buffer_handle_t /*buffer*/, size_t /*offset*/, size_t /*size*/,
            uint32_t /*streamCTR*/, uint64_t *outInputCTR, void * /*outData*/) override {
        if (outInputCTR) *outInputCTR = 0;
        return OK;
    }

    virtual status_t decrypt(
            const void *inData, size_t size,
            uint32_t /*streamCTR*/, uint64_t /*inputCTR*/, void *outData) override {
        memcpy(outData, inData, size);
        return OK;
    }
};

} // namespace android

extern "C" {

android::HDCPModule *createHDCPModule(
        void *cookie, android::HDCPModule::ObserverFunc observer) {
    return new android::DummyHDCPModule(cookie, observer);
}

android::HDCPModule *createHDCPModuleForDecryption(
        void *cookie, android::HDCPModule::ObserverFunc observer) {
    return new android::DummyHDCPModule(cookie, observer);
}

}
