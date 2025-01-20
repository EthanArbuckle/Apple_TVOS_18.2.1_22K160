@interface CFBundleCopyLimitedInfoPlistKeys
@end

@implementation CFBundleCopyLimitedInfoPlistKeys

void ___CFBundleCopyLimitedInfoPlistKeys_block_invoke(uint64_t a1, void *value)
{
}

void ___CFBundleCopyLimitedInfoPlistKeys_block_invoke_2(CFDictionaryRef *a1, CFArrayRef theArray)
{
  if (CFArrayGetCount(theArray) >= 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0LL);
    Value = CFDictionaryGetValue(a1[4], ValueAtIndex);
    if (Value && (v6 = Value, !CFEqual(ValueAtIndex, Value)))
    {
      MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, theArray);
      CFArraySetValueAtIndex(MutableCopy, 0LL, v6);
      CFSetAddValue(a1[5], MutableCopy);
      CFRelease(MutableCopy);
    }

    else
    {
      CFSetAddValue(a1[5], theArray);
    }

    CFSetAddValue(a1[6], ValueAtIndex);
  }

@end