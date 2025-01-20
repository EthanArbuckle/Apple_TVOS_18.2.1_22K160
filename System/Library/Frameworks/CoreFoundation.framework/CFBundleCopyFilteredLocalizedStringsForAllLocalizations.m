@interface CFBundleCopyFilteredLocalizedStringsForAllLocalizations
@end

@implementation CFBundleCopyFilteredLocalizedStringsForAllLocalizations

void ___CFBundleCopyFilteredLocalizedStringsForAllLocalizations_block_invoke(uint64_t a1, void *a2)
{
  values[1] = *(void **)MEMORY[0x1895F89C0];
  values[0] = a2;
  v3 = CFArrayCreate(0LL, (const void **)values, 1LL, &kCFTypeArrayCallBacks);
  CFDictionaryRef v4 = _copyStringTable(*(void *)(a1 + 32), *(__CFString **)(a1 + 40), *(CFTypeRef *)(a1 + 48), v3, 0, 0LL);
  CFRelease(v3);
  CFIndex Count = CFSetGetCount(*(CFSetRef *)(a1 + 48));
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  Count,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  v7 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = ___CFBundleCopyFilteredLocalizedStringsForAllLocalizations_block_invoke_2;
  v8[3] = &__block_descriptor_48_e13_v24__0r_v8_16l;
  v8[4] = v4;
  v8[5] = Mutable;
  CFSetApply(v7, (uint64_t)v8);
  if (CFDictionaryGetCount(Mutable) >= 1) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 56), values[0], Mutable);
  }
  CFRelease(v4);
  CFRelease(Mutable);
}

void ___CFBundleCopyFilteredLocalizedStringsForAllLocalizations_block_invoke_2(uint64_t a1, const void *a2)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  if (Value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, Value);
  }
}

@end