@interface IOHIDDeviceCreate
@end

@implementation IOHIDDeviceCreate

__n128 __IOHIDDeviceCreate_block_invoke()
{
  __int128 v0 = *(_OWORD *)(MEMORY[0x189605258] + 32LL);
  xmmword_18C5B9D48 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
  *(_OWORD *)&qword_18C5B9D58 = v0;
  __n128 result = *(__n128 *)MEMORY[0x189605258];
  __callbackBaseSetCallbacks = *MEMORY[0x189605258];
  qword_18C5B9D58 = (uint64_t)__IOHIDDeviceCallbackBaseDataIsEqual;
  return result;
}

@end