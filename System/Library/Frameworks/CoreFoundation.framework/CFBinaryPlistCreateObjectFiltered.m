@interface CFBinaryPlistCreateObjectFiltered
@end

@implementation CFBinaryPlistCreateObjectFiltered

BOOL ____CFBinaryPlistCreateObjectFiltered_block_invoke( uint64_t a1,  int8x16_t *a2,  CFIndex a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  v9 = *(void **)(a1 + 32);
  if (v9) {
    void *v9 = 7LL;
  }
  if (!*(void *)(a1 + 40)) {
    return 1LL;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  v11 = *(const __CFAllocator **)(a1 + 64);
  if (v10 != 2 && *(void *)(a1 + 56) >> 31 == 0LL)
  {
    CFStringRef v17 = CFStringCreateWithBytes(v11, (const UInt8 *)a2, a3, 0x600u, 0);
    CFStringRef v14 = v17;
    if (v17)
    {
      if (*(void *)(a1 + 72))
      {
        if (malloc_size(v17))
        {
          uint64_t v18 = __NSCreateBPlistMappedString();
          if (v18)
          {
            v19 = (const __CFString *)v18;
            CFRelease(v14);
            CFStringRef v14 = v19;
          }
        }
      }

      v20 = *(__CFDictionary **)(a1 + 88);
      if (v20) {
        CFDictionarySetValue(v20, *(const void **)(a1 + 96), v14);
      }
    }
  }

  else
  {
    v13 = (const __CFString *)_CFStringCreateWithBytesNoCopyDisallowROM( (__objc2_class **)v11,  a2,  a3,  1536LL,  0,  (uint64_t)&__kCFAllocatorNull,  a7,  a8);
    CFStringRef v14 = v13;
    if (v10 == 2)
    {
      if (v13)
      {
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(*(CFAllocatorRef *)(a1 + 64), 0LL, v13);
        CFRelease(v14);
        CFStringRef v14 = MutableCopy;
      }
    }
  }

  **(void **)(a1 + 40) = v14;
  return v14 != 0LL;
}

BOOL ____CFBinaryPlistCreateObjectFiltered_block_invoke_2( uint64_t a1,  int8x16_t *a2,  CFIndex a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  v9 = *(void **)(a1 + 32);
  if (v9) {
    void *v9 = 7LL;
  }
  if (!*(void *)(a1 + 40)) {
    return 1LL;
  }
  if (a3)
  {
    if (a3 < 0) {
      return 0LL;
    }
    a3 *= 2LL;
  }

  uint64_t v10 = *(void *)(a1 + 48);
  v11 = *(const __CFAllocator **)(a1 + 64);
  if (v10 != 2 && *(void *)(a1 + 56) >> 31 == 0LL)
  {
    CFStringRef v17 = CFStringCreateWithBytes(v11, (const UInt8 *)a2, a3, 0x10000100u, 0);
    CFStringRef v14 = v17;
    if (v17)
    {
      if (*(void *)(a1 + 72))
      {
        if (malloc_size(v17))
        {
          uint64_t v18 = __NSCreateBPlistMappedString();
          if (v18)
          {
            v19 = (const __CFString *)v18;
            CFRelease(v14);
            CFStringRef v14 = v19;
          }
        }
      }

      v20 = *(__CFDictionary **)(a1 + 88);
      if (v20) {
        CFDictionarySetValue(v20, *(const void **)(a1 + 96), v14);
      }
    }
  }

  else
  {
    v13 = (const __CFString *)_CFStringCreateWithBytesNoCopyDisallowROM( (__objc2_class **)v11,  a2,  a3,  268435712LL,  0,  (uint64_t)&__kCFAllocatorNull,  a7,  a8);
    CFStringRef v14 = v13;
    if (v10 == 2)
    {
      if (v13)
      {
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(*(CFAllocatorRef *)(a1 + 64), 0LL, v13);
        CFRelease(v14);
        CFStringRef v14 = MutableCopy;
      }
    }
  }

  **(void **)(a1 + 40) = v14;
  return v14 != 0LL;
}

@end