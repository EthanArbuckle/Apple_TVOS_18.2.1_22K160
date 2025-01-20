@interface SwapEnd
@end

@implementation SwapEnd

void __benchmark_SwapEnd_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    if (Mutable)
    {
      v4 = Mutable;
      uint64_t v5 = *(void *)(a1 + 40);
      if (!*(_DWORD *)(v5 + 1844))
      {
LABEL_10:
        (*(void (**)(void))(a1 + 32))();
        v9 = v4;
LABEL_14:
        CFRelease(v9);
        return;
      }

      unint64_t v6 = 0LL;
      while (1)
      {
        CFStringRef v7 = CFStringCreateWithCString(v2, *(const char **)(*(void *)(v5 + 1832) + 8 * v6), 0x600u);
        uint64_t valuePtr = 0LL;
        CFNumberRef v8 = CFNumberCreate(v2, kCFNumberLongLongType, &valuePtr);
        v9 = v8;
        if (!v7 || v8 == 0LL) {
          break;
        }
        CFDictionarySetValue(v4, v7, v8);
        CFRelease(v9);
        CFRelease(v7);
        ++v6;
        uint64_t v5 = *(void *)(a1 + 40);
      }

      CFRelease(v4);
      if (v7) {
        CFRelease(v7);
      }
      if (v9) {
        goto LABEL_14;
      }
    }
  }

@end