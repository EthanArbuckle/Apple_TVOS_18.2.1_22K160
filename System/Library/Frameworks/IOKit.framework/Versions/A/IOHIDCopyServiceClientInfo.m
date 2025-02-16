@interface IOHIDCopyServiceClientInfo
@end

@implementation IOHIDCopyServiceClientInfo

void ___IOHIDCopyServiceClientInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    v6 = Mutable;
    CFMutableDictionaryRef v7 = CFDictionaryCreateMutable(v4, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    if (v7)
    {
      v8 = v7;
      RegistryID = (const void *)IOHIDServiceGetRegistryID(a2);
      if (RegistryID) {
        CFDictionaryAddValue(v6, @"ServiceID", RegistryID);
      }
      CFTypeRef v10 = IOHIDServiceCopyProperty(a2, @"DeviceUsagePairs");
      if (v10)
      {
        v11 = v10;
        CFDictionaryAddValue(v8, @"DeviceUsagePairs", v10);
        CFRelease(v11);
      }

      CFTypeRef v12 = IOHIDServiceCopyProperty(a2, @"PrimaryUsagePage");
      if (v12)
      {
        v13 = v12;
        CFDictionaryAddValue(v8, @"PrimaryUsagePage", v12);
        CFRelease(v13);
      }

      CFTypeRef v14 = IOHIDServiceCopyProperty(a2, @"PrimaryUsage");
      if (v14)
      {
        v15 = v14;
        CFDictionaryAddValue(v8, @"PrimaryUsage", v14);
        CFRelease(v15);
      }

      CFDictionaryAddValue(v6, @"Properties", v8);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), v6);
      CFRelease(v8);
    }

    CFRelease(v6);
  }

@end