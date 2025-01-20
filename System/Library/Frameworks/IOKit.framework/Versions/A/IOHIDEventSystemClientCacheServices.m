@interface IOHIDEventSystemClientCacheServices
@end

@implementation IOHIDEventSystemClientCacheServices

uint64_t ____IOHIDEventSystemClientCacheServices_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  Value = CFDictionaryGetValue(theDict, @"ServiceID");
  v5 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"Properties");
  os_unfair_recursive_lock_lock_with_options();
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 96LL), Value))
  {
    v6 = _IOHIDServiceClientCreate( (const __CFAllocator *)*MEMORY[0x189604DB0],  Value,  v5,  *(__IOHIDEventSystemClient **)(a1 + 32));
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 32) + 96LL), Value, v6);
      CFRelease(v7);
    }
  }

  return os_unfair_recursive_lock_unlock();
}

@end