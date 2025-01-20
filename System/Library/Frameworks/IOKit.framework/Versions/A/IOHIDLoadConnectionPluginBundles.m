@interface IOHIDLoadConnectionPluginBundles
@end

@implementation IOHIDLoadConnectionPluginBundles

void ___IOHIDLoadConnectionPluginBundles_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  __int128 v1 = xmmword_189C50958;
  v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)&v1, 2LL, MEMORY[0x189605228]);
  __hidConnectionPluginBundles = (uint64_t)__IOHIDPlugInLoadBundles(v0);
  CFRelease(v0);
}

@end