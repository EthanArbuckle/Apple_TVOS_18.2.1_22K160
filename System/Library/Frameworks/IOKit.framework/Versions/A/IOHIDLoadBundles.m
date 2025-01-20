@interface IOHIDLoadBundles
@end

@implementation IOHIDLoadBundles

CFMutableDictionaryRef ___IOHIDLoadBundles_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4[0] = xmmword_189C507E0;
  v4[1] = *(_OWORD *)off_189C507F0;
  v0 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  v1 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)v4, 4LL, MEMORY[0x189605228]);
  __hidPlugInBundles = (uint64_t)__IOHIDPlugInLoadBundles(v1);
  CFRelease(v1);
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)__hidPlugInBundles;
  if (__hidPlugInBundles)
  {
    int Count = CFArrayGetCount((CFArrayRef)__hidPlugInBundles);
    CFMutableDictionaryRef result = CFDictionaryCreateMutable(v0, Count, MEMORY[0x189605240], 0LL);
    __hidPlugInInstanceCache = (uint64_t)result;
  }

  return result;
}

@end