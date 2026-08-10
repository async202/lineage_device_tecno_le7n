import re

STOCK_HWSERVICE = "/home/user/android_dump_tecno_le7n/android_dump_tecno_le7n-RP1A.200720.011/selinux/decompiled_vendor/hwservice_contexts"
LINEAGE_HWSERVICE = "/home/user/lineage/device/tecno/le7n/sepolicy/vendor/hwservice_contexts"

with open(STOCK_HWSERVICE, 'r') as f:
    stock_hw = f.readlines()

with open(LINEAGE_HWSERVICE, 'r') as f:
    lineage_hw = f.readlines()

volte_hw = [h for h in stock_hw if re.search(r'(volte|imsa|presence|rcs)', h, re.IGNORECASE)]

new_hw = []
for h in volte_hw:
    if h not in lineage_hw:
        new_hw.append(h)

with open(LINEAGE_HWSERVICE, 'a') as f:
    for h in new_hw:
        f.write(h)
print(f"Appended {len(new_hw)} hwservices")
