@interface NSProcessInfoGetThermalState
@end

@implementation NSProcessInfoGetThermalState

uint64_t ___NSProcessInfoGetThermalState_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v0 = (const char *)*MEMORY[0x1895FB8A0];
  qos_class_t v1 = qos_class_main();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v1, 2uLL);
  uint64_t result = notify_register_dispatch(v0, &out_token, global_queue, &__block_literal_global_142);
  if (!(_DWORD)result)
  {
    +[_NSSwiftProcessInfo cancelThermalStateNotifyNotification]( &OBJC_CLASS____NSSwiftProcessInfo,  "cancelThermalStateNotifyNotification");
    return NSProcessInfoNotifyThermalState(out_token);
  }

  return result;
}

uint64_t ___NSProcessInfoGetThermalState_block_invoke_2(uint64_t a1, int a2)
{
  return NSProcessInfoNotifyThermalState(a2);
}

@end