import sys

text = """checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::IRadio/em1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::IRadio/em2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::IRadio/em3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::IRadio/imsAospSlot1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::IRadio/imsAospSlot2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::IRadio/imsAospSlot3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::IRadio/se1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::IRadio/se2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::IRadio/se3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::ISap/slot2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.2::ISap/slot3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.5::IRadio/em1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.5::IRadio/em2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.5::IRadio/em3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.5::IRadio/imsAospSlot1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.5::IRadio/imsAospSlot2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.5::IRadio/imsAospSlot3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.5::IRadio/se1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.5::IRadio/se2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     android.hardware.radio@1.5::IRadio/se3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.fpsensor.hardware.fpsensorhidlsvc@2.0::IFpsensorHidlSvc/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.aee@1.0::IAee/AEE
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.aee@1.0::IAee/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.atci@1.0::IAtcid/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.bluetooth.audio@2.1::IBluetoothAudioProvidersFactory/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.camera.bgservice@1.1::IBGService/internal/0
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.camera.isphal@1.0::IISPModule/internal/0
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.dfps@1.0::IFpsPolicyService/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.dplanner@2.0::IDPlanner/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.engineermode@1.3::IEmd/EmHidlServer
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.gpu@1.0::IGraphicExt/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.keymaster_attestation@1.1::IKeymasterDevice/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/AgpsDebugInterface
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/AgpsInterface
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_agps2framework
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_debugService2mnld
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_framework2agps
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_lbs_log_v2s
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_lppe_socket_agps
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_lppe_socket_bt
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_lppe_socket_ipaddr
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_lppe_socket_lbs
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_lppe_socket_network
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_lppe_socket_sensor
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_lppe_socket_wlan
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_meta2mnld
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_mnld2debugService
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_mnld2mtklogger
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_mnld2nlputils
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.lbs@1.0::ILbs/mtk_mtklogger2mnld
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.log@1.0::ILog/ATMWiFiHidlServer
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.log@1.0::ILog/ConnsysFWHidlServer
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.log@1.0::ILog/MobileLogHidlServer
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.log@1.0::ILog/ModemLogHidlServer
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mdmonitor@1.0::IMDMonitorService/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mms@1.5::IMms/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkcodecservice@1.1::IMtkCodecService/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkpower@1.1::IMtkPerf/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkpower@1.1::IMtkPower/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/imsSlot1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/imsSlot2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/imsSlot3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkAssist1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkAssist2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkAssist3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkCap1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkCap2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkCap3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkEm1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkEm2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkEm3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkRcs1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkRcs2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkRcs3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkSe1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkSe2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkSe3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkSlot1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkSlot2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkSlot3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkSmartRatSwitch1
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkSmartRatSwitch2
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.mtkradioex@2.0::IMtkRadioEx/mtkSmartRatSwitch3
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.netdagent@1.0::INetdagent/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.nvram@1.1::INvram/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.nwk_opt@1.0::INwkOpt/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.paytrigger@1.0::IPayTrigger/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.pq@2.6::IPictureQuality/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.tranHwInfo@1.0::ITranHwInfo/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.videotelephony@1.0::IVideoTelephony/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.mediatek.hardware.wifi.supplicant@2.0::ISupplicant/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.silead.hardware.fingerprintext@1.0::ISileadFingerprint/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.transsion.hardware.tne.tneengine@1.0::ITne/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.transsion.hardware.trancam.trancamserver@1.0::ITrancamserver/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.transsion.hardware.tranlog@1.0::ITranLog/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.transsion.hardware.tranlogconfig@1.0::ITranLogConfig/default
checkvintf E 07-22 16:07:34  2393  2393 check_vintf.cpp:554]     vendor.transsion.hardware.transtorage.storage@1.0::IStorage/default"""

import re

hals = {}

for line in text.strip().split('\n'):
    m = re.search(r'\s+([a-zA-Z0-9\._\-]+)@([0-9\.]+)::([a-zA-Z0-9]+)/([a-zA-Z0-9\._\-]+)', line)
    if m:
        pkg = m.group(1)
        ver = m.group(2)
        iface = m.group(3)
        inst = m.group(4)
        
        if pkg not in hals:
            hals[pkg] = {}
        if ver not in hals[pkg]:
            hals[pkg][ver] = {}
        if iface not in hals[pkg][ver]:
            hals[pkg][ver][iface] = set()
        hals[pkg][ver][iface].add(inst)

print("<compatibility-matrix version=\"1.0\" type=\"framework\">")
for pkg, vers in hals.items():
    for ver, ifaces in vers.items():
        print("    <hal format=\"hidl\" optional=\"true\">")
        print(f"        <name>{pkg}</name>")
        print(f"        <version>{ver}</version>")
        for iface, insts in ifaces.items():
            print(f"        <interface>")
            print(f"            <name>{iface}</name>")
            for inst in sorted(list(insts)):
                print(f"            <instance>{inst}</instance>")
            print(f"        </interface>")
        print("    </hal>")
print("</compatibility-matrix>")
