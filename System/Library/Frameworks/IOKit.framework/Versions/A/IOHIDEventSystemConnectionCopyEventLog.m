@interface IOHIDEventSystemConnectionCopyEventLog
@end

@implementation IOHIDEventSystemConnectionCopyEventLog

void ___IOHIDEventSystemConnectionCopyEventLog_block_invoke(uint64_t a1, uint64_t a2, void *cf)
{
  v6 = CFGetAllocator(cf);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 2LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (Mutable)
  {
    v8 = Mutable;
    _IOHIDDictionaryAddSInt32(Mutable, @"EventType", *(_DWORD *)a2);
    v9 = CFGetAllocator(*(CFTypeRef *)(a1 + 32));
    CFStringRef v10 = _IOHIDCreateTimeString(v9, (time_t *)(a2 + 8));
    if (v10)
    {
      CFStringRef v11 = v10;
      CFDictionaryAddValue(v8, @"EventTime", v10);
      CFRelease(v11);
    }

    CFArrayAppendValue((CFMutableArrayRef)cf, v8);
    CFRelease(v8);
  }

@end