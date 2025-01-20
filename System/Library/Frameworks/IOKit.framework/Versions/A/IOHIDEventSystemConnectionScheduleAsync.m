@interface IOHIDEventSystemConnectionScheduleAsync
@end

@implementation IOHIDEventSystemConnectionScheduleAsync

void ___IOHIDEventSystemConnectionScheduleAsync_block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 448))
  {
    int v2 = iohideventsystem_client_refresh(*(_DWORD *)(v1 + 40), 144);
    v3 = (os_log_s *)_IOHIDLogCategory(9u);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v1 + 168);
      int v5 = 136315394;
      uint64_t v6 = v4;
      __int16 v7 = 1024;
      int v8 = v2;
      _os_log_impl( &dword_182DAF000,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Sent client refresh msg, status:%#x",  (uint8_t *)&v5,  0x12u);
    }

    __IOHIDEventSystemConnectionCheckServerStatus(v2, v1);
  }

void ___IOHIDEventSystemConnectionScheduleAsync_block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 120LL) = 0LL;
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end