@interface IOHIDServiceCopyEventLog
@end

@implementation IOHIDServiceCopyEventLog

void ___IOHIDServiceCopyEventLog_block_invoke(uint64_t a1, uint64_t a2, void *cf)
{
  v6 = CFGetAllocator(cf);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 4LL, MEMORY[0x189605240], MEMORY[0x189605250]);
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

    unint64_t v12 = *(void *)(a2 + 24);
    if (!v12) {
      goto LABEL_17;
    }
    if (*(_DWORD *)a2 == 1)
    {
      _IOHIDDictionaryAddSInt32(v8, @"UsagePage", WORD1(v12));
      _IOHIDDictionaryAddSInt32(v8, @"Usage", (unsigned __int16)v12);
      v16 = @"Length";
      v17 = v8;
      unint64_t v15 = HIDWORD(v12);
    }

    else
    {
      if (*(_DWORD *)a2 != 3) {
        goto LABEL_17;
      }
      _IOHIDDictionaryAddSInt32(v8, @"Down", v12 & 1);
      _IOHIDDictionaryAddSInt32(v8, @"PressCount", (v12 >> 2));
      _IOHIDDictionaryAddSInt32(v8, @"LongPress", (v12 >> 1) & 1);
      v13 = @"ended";
      if ((v12 & 0x1000) == 0) {
        v13 = &stru_189C527D8;
      }
      v14 = (v12 & 0x400) != 0 ? @"begin" : (__CFString *)v13;
      CFDictionaryAddValue(v8, @"Phase", v14);
      if ((v12 & 0x3FFFC000000LL) == 0) {
        goto LABEL_17;
      }
      _IOHIDDictionaryAddSInt32(v8, @"Usage", (unsigned __int16)(v12 >> 26));
      LODWORD(v15) = (unsigned __int16)(v12 >> 42);
      v16 = @"UsagePage";
      v17 = v8;
    }

    _IOHIDDictionaryAddSInt32(v17, v16, v15);
LABEL_17:
    CFArrayAppendValue((CFMutableArrayRef)cf, v8);
    CFRelease(v8);
  }

@end