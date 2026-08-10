/*
 * Copyright (C) 2023 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <media/AudioTrack.h>
#include <dlfcn.h>
#include <string>

using namespace android;

typedef void (*AudioTrack_C1_t)(
    void *thisptr, audio_stream_type_t streamType, uint32_t sampleRate,
    audio_format_t format, audio_channel_mask_t channelMask, size_t frameCount,
    audio_output_flags_t flags, AudioTrack::callback_t cbf, void *user,
    int32_t notificationFrames, audio_session_t sessionId,
    AudioTrack::transfer_type transferType,
    const audio_offload_info_t *offloadInfo, uid_t uid, pid_t pid,
    const audio_attributes_t *pAttributes, bool doNotReconnect,
    float maxRequiredSpeed, audio_port_handle_t selectedDeviceId,
    const std::string &opPackageName);

extern "C" {
void _ZN7android10AudioTrackC1E19audio_stream_type_tj14audio_format_tjj20audio_output_flags_tPFviPvS4_ES4_i15audio_session_tNS0_13transfer_typeEPK20audio_offload_info_tjiPK18audio_attributes_tbfi(
    void *thisptr, audio_stream_type_t streamType, uint32_t sampleRate,
    audio_format_t format, audio_channel_mask_t channelMask, size_t frameCount,
    audio_output_flags_t flags, AudioTrack::callback_t cbf, void *user,
    int32_t notificationFrames, audio_session_t sessionId,
    AudioTrack::transfer_type transferType,
    const audio_offload_info_t *offloadInfo, uid_t uid, pid_t pid,
    const audio_attributes_t *pAttributes, bool doNotReconnect,
    float maxRequiredSpeed, audio_port_handle_t selectedDeviceId) {
  
  static AudioTrack_C1_t real_C1 = (AudioTrack_C1_t)dlsym(
      RTLD_NEXT,
      "_ZN7android10AudioTrackC1E19audio_stream_type_tj14audio_format_tjj20audio_output_flags_tPFviPvS4_ES4_i15audio_session_tNS0_13transfer_typeEPK20audio_offload_info_tjiPK18audio_attributes_tbfRKNSt3__112basic_stringIcNSK_11char_traitsIcEENSK_9allocatorIcEEEE");

  std::string opPackageName = "";
  if (real_C1) {
    real_C1(thisptr, streamType, sampleRate, format, channelMask, frameCount, flags,
            cbf, user, notificationFrames, sessionId, transferType, offloadInfo, uid,
            pid, pAttributes, doNotReconnect, maxRequiredSpeed, selectedDeviceId,
            opPackageName);
  }
}
}
