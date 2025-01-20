@interface CFBundleCopyLProjDirectoriesForURL
@end

@implementation CFBundleCopyLProjDirectoriesForURL

uint64_t ___CFBundleCopyLProjDirectoriesForURL_block_invoke(uint64_t a1, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  v5.length = *(void *)(a1 + 40);
  if (Length > v5.length)
  {
    CFIndex v6 = Length;
    v5.location = Length - v5.length;
    if (CFStringCompareWithOptions(theString, *(CFStringRef *)(a1 + 48), v5, 0LL) == kCFCompareEqualTo)
    {
      v10.length = v6 - *(void *)(a1 + 40);
      v10.location = 0LL;
      CFStringRef v7 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, theString, v10);
      v8 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      if (!v8)
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFArrayCreateMutable( *(CFAllocatorRef *)(a1 + 56),  0LL,  &kCFTypeArrayCallBacks);
        v8 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      }

      CFArrayAppendValue(v8, v7);
      CFRelease(v7);
    }
  }

  return 1LL;
}

@end