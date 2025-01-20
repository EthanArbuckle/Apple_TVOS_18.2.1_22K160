@interface CFICUCreateVariableNameForStackPointerIfNeeded
@end

@implementation CFICUCreateVariableNameForStackPointerIfNeeded

void _____CFICUCreateVariableNameForStackPointerIfNeeded_block_invoke(uint64_t a1)
{
  v3 = *(const char **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  CFStringRef v4 = CFStringCreateWithCString(0LL, v3, 0x8000100u);
  if (v2 || (Value = CFDictionaryGetValue((CFDictionaryRef)lastStackPointerVariableNamesByPrefix, v4)) == 0LL)
  {
    v5 = 0LL;
  }

  else
  {
    v5 = (const __CFString *)CFRetain(Value);
    v7 = CFStringCreateWithCString(0LL, v3, 0x8000100u);
    if (!CFStringHasPrefix(v5, v7))
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)variableNamesByHeapPointer, 0LL);
      CFRelease(v5);
      v5 = 0LL;
    }

    CFRelease(v7);
  }

  CFRelease(v4);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = ___CFICUCreateVariableNameForStackPointerLocked( *(char **)(a1 + 40),  *(const void **)(a1 + 48));
    v8 = *(_BYTE **)(a1 + 56);
    if (v8) {
      _BYTE *v8 = 1;
    }
  }

@end