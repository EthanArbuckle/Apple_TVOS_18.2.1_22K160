@interface IOHIDLoadSessionFilterBundles
@end

@implementation IOHIDLoadSessionFilterBundles

void ___IOHIDLoadSessionFilterBundles_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = xmmword_189C50840;
  v1[1] = *(_OWORD *)off_189C50850;
  v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)v1, 4LL, MEMORY[0x189605228]);
  __hidSessionFilterBundles = (uint64_t)__IOHIDPlugInLoadBundles(v0);
  CFRelease(v0);
}

@end