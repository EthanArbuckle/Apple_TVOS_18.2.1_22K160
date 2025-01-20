@interface IOHIDEventSystemMatchNotifyFunction
@end

@implementation IOHIDEventSystemMatchNotifyFunction

uint64_t ____IOHIDEventSystemMatchNotifyFunction_block_invoke( uint64_t a1,  int a2,  CFTypeRef cf,  uint64_t a4,  const void *a5)
{
  if (cf) {
    uint64_t result = (uint64_t)CFRetain(cf);
  }
  else {
    uint64_t result = 0LL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL) = result;
  if (a5)
  {
    CFTypeID v8 = CFGetTypeID(a5);
    uint64_t result = IOHIDEventSystemConnectionGetTypeID();
    if (v8 == result) {
      v9 = a5;
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = v9;
  return result;
}

uint64_t ____IOHIDEventSystemMatchNotifyFunction_block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t (*a4)(uint64_t, uint64_t, void, void),  uint64_t a5,  uint64_t a6)
{
  if (a4) {
    return a4(a5, a6, **(void **)(result + 40), *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL));
  }
  return result;
}

@end