@interface MAPreferencesCopyValue
@end

@implementation MAPreferencesCopyValue

void ___MAPreferencesCopyValue_block_invoke(uint64_t a1)
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(*(CFStringRef *)(a1 + 32), @"com.apple.MobileAsset");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end