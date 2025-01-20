@interface SCNetworkConnectionScheduleWithRunLoop
@end

@implementation SCNetworkConnectionScheduleWithRunLoop

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke(uint64_t a1)
{
  mach_msg_return_t v3;
  mach_msg_return_t v4;
  os_log_s *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _DWORD *v9;
  dispatch_queue_s *v10;
  uint64_t v11;
  void block[7];
  block[6] = *MEMORY[0x1895F89C0];
  v2 = (mach_msg_header_t *)malloc(0x7CuLL);
  v3 = mach_msg(v2, 2, 0, 0x7Cu, *(_DWORD *)(a1 + 48), 0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = (os_log_s *)__log_SCNetworkConnection_log;
    if (!__log_SCNetworkConnection_log)
    {
      v5 = os_log_create("com.apple.SystemConfiguration", "SCNetworkConnection");
      __log_SCNetworkConnection_log = (uint64_t)v5;
    }

    v6 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v5, (os_log_type_t)v6))
    {
      v7 = _os_log_pack_size();
      v8 = (char *)&block[-1] - ((MEMORY[0x1895F8858](v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      __error();
      v9 = (_DWORD *)_os_log_pack_fill();
      *v9 = 67109120;
      v9[1] = v4;
      __SC_log_send(5, (uint64_t)v5, v6, v8);
    }

    free(v2);
  }

  else
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_107;
    block[3] = &__block_descriptor_tmp_108;
    v11 = *(void *)(a1 + 32);
    v10 = *(dispatch_queue_s **)(a1 + 40);
    block[4] = v2;
    block[5] = v11;
    dispatch_async(v10, block);
  }

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_107(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_2(uint64_t a1)
{
}

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_3(uint64_t a1, int a2)
{
  block[5] = *MEMORY[0x1895F89C0];
  if (a2 == 2)
  {
    v5 = (os_log_s *)__log_SCNetworkConnection_log;
    if (!__log_SCNetworkConnection_log)
    {
      v5 = os_log_create("com.apple.SystemConfiguration", "SCNetworkConnection");
      __log_SCNetworkConnection_log = (uint64_t)v5;
    }

    uint64_t v6 = _SC_syslog_os_log_mapping(7);
    if (__SC_log_enabled(7, v5, (os_log_type_t)v6))
    {
      uint64_t v7 = _os_log_pack_size();
      v8 = (char *)block - ((MEMORY[0x1895F8858](v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      __error();
      uint64_t v9 = _os_log_pack_fill();
      uint64_t v10 = *(void *)(a1 + 40) + 88LL;
      *(_DWORD *)uint64_t v9 = 136315138;
      *(void *)(v9 + 4) = v10;
      __SC_log_send(7, (uint64_t)v5, v6, v8);
    }

    CFRelease(*(CFTypeRef *)(a1 + 32));
  }

  else if (a2 == 1)
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 40) + 16LL));
    uint64_t v3 = *(void *)(a1 + 40);
    v4 = *(__CFRunLoopSource **)(v3 + 224);
    if (v4)
    {
      CFRunLoopSourceSignal(v4);
      _SC_signalRunLoop( *(const void **)(a1 + 32),  *(__CFRunLoopSource **)(*(void *)(a1 + 40) + 224LL),  *(CFArrayRef *)(*(void *)(a1 + 40) + 280LL));
    }

    else if (*(void *)(v3 + 288))
    {
      CFRetain(*(CFTypeRef *)(a1 + 32));
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 288LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_4;
      block[3] = &__block_descriptor_tmp_111;
      block[4] = v11;
      dispatch_async(v12, block);
    }

    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 40) + 16LL));
  }

void ____SCNetworkConnectionScheduleWithRunLoop_block_invoke_4(uint64_t a1)
{
}

@end