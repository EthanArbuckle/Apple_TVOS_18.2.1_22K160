@interface CFBundleInfoPlistProcessInfoDictionary
@end

@implementation CFBundleInfoPlistProcessInfoDictionary

void ___CFBundleInfoPlistProcessInfoDictionary_block_invoke(CFMutableArrayRef *a1, const __CFString *cf)
{
  v41[6] = *MEMORY[0x1895F89C0];
  if (CFGetTypeID(cf) != 7)
  {
    CFArrayAppendValue(a1[4], cf);
    return;
  }

  if (cf)
  {
    CFRange v4 = CFStringFind(cf, @"#", 4uLL);
    if (v4.location > 0)
    {
      CFIndex Length = CFStringGetLength(cf);
      v42.uint64_t location = v4.location + v4.length;
      v42.length = Length - (v4.location + v4.length);
      CFStringRef v6 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v42);
      if (CFEqual(v6, @"CH"))
      {
        if (_isValidSpecialCase_onceToken != -1) {
          dispatch_once(&_isValidSpecialCase_onceToken, &__block_literal_global_47);
        }
        if (_isValidSpecialCase_useSpecialCase) {
          goto LABEL_8;
        }
      }

      else if (CFEqual(v6, @"override"))
      {
LABEL_8:
        v43.uint64_t location = 0LL;
        v43.length = v4.location;
        CFStringRef v7 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf, v43);
        v8 = a1[5];
        Value = CFDictionaryGetValue(a1[6], cf);
        CFDictionarySetValue(v8, v7, Value);
        CFArrayAppendValue(a1[4], cf);
        CFRelease(v7);
        if (v6) {
          CFRelease(v6);
        }
        return;
      }

      if (v6) {
        CFRelease(v6);
      }
    }

    CFRange v10 = CFStringFind(cf, @"-", 4uLL);
    uint64_t location = v10.location;
    CFRange v12 = CFStringFind(cf, @"~", 4uLL);
    if ((v10.location != -1 || v12.location != -1)
      && (v10.location == -1 || v12.location == -1 || v12.location > v10.location))
    {
      CFIndex v13 = CFStringGetLength(cf);
      CFIndex v14 = v12.location == -1 ? -1LL : v12.location + v12.length;
      CFIndex v15 = v12.location == -1 ? v13 : v12.location;
      CFIndex v16 = v12.location == -1 ? 0LL : v13 - (v12.location + v12.length);
      if (v10.location == -1)
      {
        uint64_t location = v12.location;
        CFIndex v17 = 0LL;
      }

      else
      {
        CFIndex v17 = v15 - (v10.location + v10.length);
      }

      CFIndex v18 = v10.location == -1 ? -1LL : v10.location + v10.length;
      if (location >= 1 && (v18 == -1 || v17 >= 1) && (v14 == -1 || v16 >= 1))
      {
        if (v18 != -1 || v14 == -1)
        {
          if (v18 == -1 || v14 != -1)
          {
            v46.uint64_t location = v14;
            v46.length = v16;
            int v22 = CFStringFindWithOptions(cf, @"appletv", v46, 8uLL, 0LL);
            if (v22)
            {
              v47.uint64_t location = v18;
              v47.length = v17;
              int v22 = CFStringFindWithOptions(cf, @"tvos", v47, 8uLL, 0LL) != 0;
            }

void ___CFBundleInfoPlistProcessInfoDictionary_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
}

@end