@interface CFICUCopyVariableNameForHeapPointer
@end

@implementation CFICUCopyVariableNameForHeapPointer

void _____CFICUCopyVariableNameForHeapPointer_block_invoke(uint64_t a1)
{
  if (variableNamesByHeapPointer)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFDictionaryGetValue( (CFDictionaryRef)variableNamesByHeapPointer,  *(const void **)(a1 + 40));
    v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (v2)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFRetain(v2);
      v3 = CFStringCreateWithCString(0LL, *(const char **)(a1 + 48), 0x8000100u);
      if (!CFStringHasPrefix(*(CFStringRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), v3))
      {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)variableNamesByHeapPointer, *(const void **)(a1 + 40));
        CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
      }

      CFRelease(v3);
    }
  }

@end