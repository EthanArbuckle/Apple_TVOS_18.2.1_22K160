@interface WiFiScanCallback
@end

@implementation WiFiScanCallback

void ___WiFiScanCallback_block_invoke(uint64_t a1)
{
  v1 = (void *)a1;
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v3 = (void (*)(uint64_t, __CFArray *, uint64_t))v1[5];
  uint64_t v4 = v1[6];
  if ((_DWORD)v2) {
    goto LABEL_42;
  }
  v5 = (const __CFArray *)v1[4];
  if (!v5)
  {
    uint64_t v2 = 4294960596LL;
LABEL_42:
    v3(v2, 0LL, v4);
    goto LABEL_36;
  }

  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228]);
  if (!Mutable)
  {
    uint64_t v2 = 4294960568LL;
    goto LABEL_42;
  }

  v7 = Mutable;
  CFIndex Count = CFArrayGetCount(v5);
  if (Count < 1)
  {
    v3(0LL, v7, v4);
    goto LABEL_35;
  }

  CFIndex v9 = Count;
  uint64_t v24 = v4;
  v25 = v3;
  v26 = v1;
  CFIndex v10 = 0LL;
  v11 = (const void *)*MEMORY[0x189604DE8];
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, v10);
    CFMutableDictionaryRef v13 = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    if (!v13) {
      break;
    }
    v14 = v13;
    __int16 v28 = 0;
    int v27 = 0;
    Property = (const __CFString *)WiFiNetworkGetProperty();
    CFGetHardwareAddress(Property, (char *)&v27, 6uLL, 0LL);
    CFDictionarySetHardwareAddress(v14, @"bssid", (unsigned __int8 *)&v27, 6LL);
    Channel = (const void *)WiFiNetworkGetChannel();
    if (Channel) {
      CFDictionarySetValue(v14, @"channel", Channel);
    }
    if (WiFiNetworkIsHotspot20())
    {
      uint64_t v17 = 2LL;
LABEL_21:
      CFDictionarySetInt64(v14, @"hotspot", v17);
      goto LABEL_22;
    }

    if (WiFiNetworkIsHotspot())
    {
      uint64_t v17 = 1LL;
      goto LABEL_21;
    }

@end