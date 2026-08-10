import re
import os

STOCK_PROP_CONTEXTS = "/home/user/android_dump_tecno_le7n/android_dump_tecno_le7n-RP1A.200720.011/selinux/decompiled_vendor/property_contexts"
LINEAGE_PROP_CONTEXTS = "/home/user/lineage/device/tecno/le7n/sepolicy/vendor/property_contexts"

with open(STOCK_PROP_CONTEXTS, 'r') as f:
    stock_props = f.readlines()

with open(LINEAGE_PROP_CONTEXTS, 'r') as f:
    lineage_props = f.readlines()

volte_props = [p for p in stock_props if re.search(r'(volte|epdg|wfca|imcb|vtservice)', p, re.IGNORECASE)]

new_props = []
for p in volte_props:
    if p not in lineage_props:
        new_props.append(p)

with open(LINEAGE_PROP_CONTEXTS, 'a') as f:
    for p in new_props:
        f.write(p)
print(f"Appended {len(new_props)} properties")
