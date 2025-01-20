@interface IOHIDServiceMatchObjcServicePlugin
@end

@implementation IOHIDServiceMatchObjcServicePlugin

CFTypeID ____IOHIDServiceMatchObjcServicePlugin_block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  CFTypeID v5 = CFGetTypeID(cf);
  CFTypeID result = CFDictionaryGetTypeID();
  if (v5 == result) {
    return IOServiceMatchPropertyTable( *(_DWORD *)(a1 + 40),  (CFDictionaryRef)cf,  (BOOLean_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  }
  return result;
}

@end