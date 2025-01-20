@interface SCDynamicStoreCreateInternal
@end

@implementation SCDynamicStoreCreateInternal

void ____SCDynamicStoreCreateInternal_block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1895F89C0];
  CFSetAddValue((CFMutableSetRef)_sc_store_sessions, *(const void **)(a1 + 40));
  CFIndex Count = CFSetGetCount((CFSetRef)_sc_store_sessions);
  if (Count > _sc_store_max && _sc_store_max >= 1)
  {
    CFIndex v4 = Count;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFSetApplyFunction((CFSetRef)_sc_store_sessions, (CFSetApplierFunction)addSessionReference, Mutable);
    v6 = (os_log_s *)__log_SCDynamicStore_log;
    if (!__log_SCDynamicStore_log)
    {
      v6 = os_log_create("com.apple.SystemConfiguration", "SCDynamicStore");
      __log_SCDynamicStore_log = (uint64_t)v6;
    }

    uint64_t v7 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v6, (os_log_type_t)v7))
    {
      uint64_t v8 = _os_log_pack_size();
      v9 = (char *)v14 - ((MEMORY[0x1895F8858](v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      __error();
      uint64_t v10 = _os_log_pack_fill();
      v11 = "now ";
      uint64_t v12 = _sc_store_max;
      if (v4 == 50) {
        v11 = "";
      }
      *(_DWORD *)uint64_t v10 = 136315394;
      *(void *)(v10 + 4) = v11;
      *(_WORD *)(v10 + 12) = 2048;
      *(void *)(v10 + 14) = v12;
      __SC_log_send(3, (uint64_t)v6, v7, v9);
    }

    CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)logSessionReference, 0LL);
    CFRelease(Mutable);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    if (_sc_store_max >= 5000) {
      uint64_t v13 = 0LL;
    }
    else {
      uint64_t v13 = 2 * _sc_store_max;
    }
    _sc_store_max = v13;
  }

@end