@interface IOHIDServiceClientCreate
@end

@implementation IOHIDServiceClientCreate

CFSetRef ___IOHIDServiceClientCreate_block_invoke()
{
  CFSetRef result = CFSetCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)_servicePropertyCacheKeys,  17LL,  MEMORY[0x189605258]);
  __serviceKeysSet = (uint64_t)result;
  return result;
}

@end