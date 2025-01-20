@interface IOHIDLoadServicePluginBundles
@end

@implementation IOHIDLoadServicePluginBundles

void ___IOHIDLoadServicePluginBundles_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  __int128 v1 = xmmword_189C50900;
  v2 = @"/usr/appleinternal/lib/HIDPlugins/ServicePlugins";
  v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)&v1, 3LL, MEMORY[0x189605228]);
  __hidServicePluginBundles = (uint64_t)__IOHIDPlugInLoadBundles(v0);
  CFRelease(v0);
}

@end