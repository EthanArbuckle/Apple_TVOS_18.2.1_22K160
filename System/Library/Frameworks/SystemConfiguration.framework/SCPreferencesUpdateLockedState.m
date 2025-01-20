@interface SCPreferencesUpdateLockedState
@end

@implementation SCPreferencesUpdateLockedState

uint64_t ____SCPreferencesUpdateLockedState_block_invoke()
{
  __SCPreferencesUpdateLockedState_lockedQueue = (uint64_t)dispatch_queue_create("SCPreferences locked state queue", 0LL);
  __SCPreferencesUpdateLockedState_lockedState = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, 0LL, MEMORY[0x189605250]);
  return os_state_add_handler();
}

_DWORD *____SCPreferencesUpdateLockedState_block_invoke_2()
{
  v18[1] = *(CFDataRef *)MEMORY[0x1895F89C0];
  v18[0] = 0LL;
  if (!CFDictionaryGetCount((CFDictionaryRef)__SCPreferencesUpdateLockedState_lockedState)) {
    return 0LL;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
  CFDictionaryApplyFunction( (CFDictionaryRef)__SCPreferencesUpdateLockedState_lockedState,  (CFDictionaryApplierFunction)appendLockedPreferences,  Mutable);
  BOOL v1 = _SCSerialize(Mutable, v18, 0LL, 0LL);
  CFRelease(Mutable);
  int64_t v2 = 0LL;
  size_t v3 = 200LL;
  if (v1 && v18[0])
  {
    CFIndex Length = CFDataGetLength(v18[0]);
    size_t v3 = Length + 200;
    if ((unint64_t)(Length + 200) > 0x8000)
    {
      v5 = (os_log_s *)__log_SCPreferences_log;
      if (!__log_SCPreferences_log)
      {
        v5 = os_log_create("com.apple.SystemConfiguration", "SCPreferences");
        __log_SCPreferences_log = (uint64_t)v5;
      }

      uint64_t v6 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v5, (os_log_type_t)v6))
      {
        uint64_t v7 = _os_log_pack_size();
        v8 = (char *)v18 - ((MEMORY[0x1895F8858](v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        __error();
        uint64_t v9 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v9 = 134218240;
        *(void *)(v9 + 4) = v3;
        *(_WORD *)(v9 + 12) = 2048;
        *(void *)(v9 + 14) = 0x8000LL;
        __SC_log_send(3, (uint64_t)v5, v6, v8);
      }

      goto LABEL_18;
    }

    int64_t v2 = Length;
  }

  v11 = calloc(1uLL, v3);
  if (v11)
  {
    v10 = v11;
    _DWORD *v11 = 1;
    v11[1] = v2;
    __strlcpy_chk();
    if (v2 >= 1)
    {
      BytePtr = CFDataGetBytePtr(v18[0]);
      memcpy(v10 + 50, BytePtr, v2);
    }

    goto LABEL_19;
  }

  v13 = (os_log_s *)__log_SCPreferences_log;
  if (!__log_SCPreferences_log)
  {
    v13 = os_log_create("com.apple.SystemConfiguration", "SCPreferences");
    __log_SCPreferences_log = (uint64_t)v13;
  }

  uint64_t v14 = _SC_syslog_os_log_mapping(3);
  if (__SC_log_enabled(3, v13, (os_log_type_t)v14))
  {
    uint64_t v15 = _os_log_pack_size();
    v16 = (char *)v18 - ((MEMORY[0x1895F8858](v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    __error();
    *(_WORD *)_os_log_pack_fill() = 0;
    __SC_log_send(3, (uint64_t)v13, v14, v16);
  }

void ____SCPreferencesUpdateLockedState_block_invoke_32(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
  {
    CFStringRef v2 = CFCopyDescription(*(CFTypeRef *)(a1 + 32));
    CFDictionarySetValue( (CFMutableDictionaryRef)__SCPreferencesUpdateLockedState_lockedState,  *(const void **)(a1 + 32),  v2);
    CFRelease(v2);
  }

  else
  {
    CFDictionaryRemoveValue( (CFMutableDictionaryRef)__SCPreferencesUpdateLockedState_lockedState,  *(const void **)(a1 + 32));
  }

@end