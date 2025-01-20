@interface NSProcessInfoGetPowerState
@end

@implementation NSProcessInfoGetPowerState

uint64_t ___NSProcessInfoGetPowerState_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  qos_class_t v0 = qos_class_main();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v0, 2uLL);
  uint64_t result = notify_register_dispatch( "com.apple.system.lowpowermode",  &out_token,  global_queue,  &__block_literal_global_145);
  if (!(_DWORD)result)
  {
    +[_NSSwiftProcessInfo cancelPowerStateNotifyNotification]( &OBJC_CLASS____NSSwiftProcessInfo,  "cancelPowerStateNotifyNotification");
    return NSProcessInfoNotifyPowerState(out_token);
  }

  return result;
}

uint64_t ___NSProcessInfoGetPowerState_block_invoke_2(uint64_t a1, int a2)
{
  return NSProcessInfoNotifyPowerState(a2);
}

@end