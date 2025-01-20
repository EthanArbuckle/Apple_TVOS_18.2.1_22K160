@interface LSGetProductNameSuffix
@end

@implementation LSGetProductNameSuffix

CFStringRef ___LSGetProductNameSuffix_block_invoke()
{
  uint64_t v0 = _LSGetProductName(void)::_cfBundlePlatform;
  int v1 = CFEqual((CFTypeRef)_LSGetProductName(void)::_cfBundlePlatform, @"ipod");
  v2 = @"iphone";
  if (!v1) {
    v2 = (const __CFString *)v0;
  }
  CFStringRef result = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, @"~%@", v2);
  _LSGetProductNameSuffix::suffix = (uint64_t)result;
  return result;
}

@end