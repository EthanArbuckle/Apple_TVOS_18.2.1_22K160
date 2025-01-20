@interface CFBundleGetMostAppropriateLocTableDeviceAndPlatformSpecificVariants
@end

@implementation CFBundleGetMostAppropriateLocTableDeviceAndPlatformSpecificVariants

CFTypeRef ___CFBundleGetMostAppropriateLocTableDeviceAndPlatformSpecificVariants_block_invoke( uint64_t a1,  const __CFString *a2)
{
  cf[1] = *(CFTypeRef *)MEMORY[0x1895F89C0];
  cf[0] = 0LL;
  unsigned int v12 = 0;
  ProductNameSuffix = (const __CFString *)_CFBundleGetProductNameSuffix();
  PlatformNameSuffix = _CFBundleGetPlatformNameSuffix();
  _CFBundleSplitFileName(a2, (__CFString **)cf, 0LL, 0LL, ProductNameSuffix, (CFIndex)PlatformNameSuffix, 2LL, &v12);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  char valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  CFTypeRef result = (CFTypeRef)CFNumberGetValue(Value, kCFNumberSInt8Type, &valuePtr);
  char v8 = valuePtr;
  if ((valuePtr & 1) != 0 && v12 > *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    v9 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v9) {
      CFRelease(v9);
    }
    CFTypeRef result = CFRetain(a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v12;
    char v8 = valuePtr;
  }

  if ((v8 & 2) != 0 && v12 > *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    v10 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    if (v10) {
      CFRelease(v10);
    }
    CFTypeRef result = CFRetain(a2);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = result;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v12;
  }

  return result;
}

@end