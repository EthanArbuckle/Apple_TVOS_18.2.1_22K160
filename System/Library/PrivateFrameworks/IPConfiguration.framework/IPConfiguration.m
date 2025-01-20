uint64_t DHCPv6PDServiceGetTypeID()
{
  pthread_once(&stru_18C4FF170, (void (*)(void))sub_1891D1008);
  return qword_18C4FF198;
}

uint64_t DHCPv6PDServiceCreate(const __CFString *a1, void *a2, unsigned int a3, uint64_t a4)
{
  keys[3] = *(void **)MEMORY[0x1895F89C0];
  CFNumberRef v23 = 0LL;
  uint64_t v24 = 0LL;
  CFStringRef v22 = 0LL;
  IPConfigurationServiceGetTypeID();
  v26[0] = 0;
  if (a2) {
    inet_ntop(30, a2, v26, 0x2Eu);
  }
  sub_1891D7908();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315906;
    *(void *)(v8 + 4) = "DHCPv6PDServiceCreate";
    *(_WORD *)(v8 + 12) = 2112;
    *(void *)(v8 + 14) = a1;
    *(_WORD *)(v8 + 22) = 2080;
    *(void *)(v8 + 24) = v26;
    *(_WORD *)(v8 + 32) = 1024;
    *(_DWORD *)(v8 + 34) = a3;
    __SC_log_send();
  }

  uint64_t Instance = 0LL;
  if (a3 > 0x80 || !a1 || a4) {
    return Instance;
  }
  keys[0] = *(void **)MEMORY[0x18960C738];
  values[0] = @"DHCPv6PD";
  if (!a2)
  {
    CFIndex v10 = 1LL;
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  CFStringRef v22 = sub_1891D7854(a2);
  keys[1] = @"RequestedPrefix";
  values[1] = (void *)v22;
  CFIndex v10 = 2LL;
  if (a3)
  {
LABEL_10:
    unsigned int valuePtr = a3;
    CFNumberRef v11 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
    CFNumberRef v23 = v11;
    keys[v10] = @"RequestedPrefixLength";
    values[v10++] = v11;
  }

LABEL_11:
  v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
  v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
  CFDictionaryRef v14 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  v10,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  sub_1891D7590((const void **)&v22);
  sub_1891D7590((const void **)&v23);
  keys[0] = @"IPv6Entity";
  values[0] = v14;
  v15 = CFDictionaryCreate(0LL, (const void **)keys, (const void **)values, 1LL, v12, v13);
  CFRelease(v14);
  uint64_t v16 = sub_1891D1C98(a1, v15);
  CFRelease(v15);
  if (!v16) {
    goto LABEL_19;
  }
  pthread_once(&stru_18C4FF170, (void (*)(void))sub_1891D1008);
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  uint64_t v24 = Instance;
  *(void *)(Instance + 16) = v16;
  dispatch_queue_t v17 = dispatch_queue_create("DHCPv6PDService", 0LL);
  *(void *)(Instance + 40) = v17;
  if (!v17)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136315138;
      *(void *)(v19 + 4) = "DHCPv6PDServiceCreate";
      __SC_log_send();
    }

    goto LABEL_19;
  }

  SCDynamicStoreRef v18 = sub_1891D19FC( Instance,  @"DHCPv6PDService",  0LL,  (void (__cdecl *)(SCDynamicStoreRef, CFArrayRef, void *))sub_1891D08E8,  0LL,  (void *)(Instance + 32));
  *(void *)(Instance + 24) = v18;
  if (!v18)
  {
LABEL_19:
    sub_1891D7590((const void **)&v24);
    return v24;
  }

  return Instance;
}

void sub_1891D08E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_1891D17E4(a3);
  if (v3)
  {
    v4 = (uint64_t *)v3;
    uint64_t v5 = *(void *)(v3 + 16);
    if (v5)
    {
      CFPropertyListRef v6 = IPConfigurationServiceCopyInformation(v5);
      if (v6) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = sub_1891D2FD8(v4[2]);
      }
      dispatch_queue_global_t global_queue = (dispatch_queue_global_t)v4[7];
      if (!global_queue) {
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      }
      uint64_t v9 = v4[6];
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = sub_1891D118C;
      block[3] = &unk_18A35EE48;
      block[4] = v9;
      block[5] = v6;
      BOOL v11 = v7;
      dispatch_async(global_queue, block);
    }
  }
}

void DHCPv6PDServiceSetQueueAndHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[7] = *MEMORY[0x1895F89C0];
  v4 = *(dispatch_queue_s **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = sub_1891D0AF0;
    block[3] = &unk_18A35ED80;
    block[5] = a1;
    void block[6] = a2;
    block[4] = a3;
    dispatch_sync(v4, block);
  }

  else
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v5 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v5 = 136315138;
      *(void *)(v5 + 4) = "DHCPv6PDServiceSetQueueAndHandler";
      __SC_log_send();
    }
  }

void sub_1891D0AF0(void *a1)
{
  uint64_t v2 = a1[5];
  v1 = (dispatch_object_s *)a1[6];
  uint64_t v3 = (const void *)a1[4];
  v4 = *(const void **)(v2 + 48);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(v2 + 48) = 0LL;
  }

  if (v3) {
    *(void *)(v2 + 48) = _Block_copy(v3);
  }
  uint64_t v5 = *(dispatch_object_s **)(v2 + 56);
  if (v5)
  {
    dispatch_release(v5);
    *(void *)(v2 + 56) = 0LL;
  }

  if (v1)
  {
    dispatch_retain(v1);
    *(void *)(v2 + 56) = v1;
  }

void DHCPv6PDServiceResume(uint64_t a1)
{
  block[5] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 40);
  if (v2 && *(void *)(a1 + 16))
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = sub_1891D0CB4;
    block[3] = &unk_18A35EDA0;
    block[4] = a1;
    dispatch_async(v2, block);
  }

  else
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v3 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v3 = 136315138;
      *(void *)(v3 + 4) = "DHCPv6PDServiceResume";
      __SC_log_send();
    }
  }

void sub_1891D0CB4(uint64_t a1)
{
}

void sub_1891D0CBC(uint64_t a1)
{
  values[1] = *(void **)MEMORY[0x1895F89C0];
  uint64_t v2 = a1 + 16;
  values[0] = (void *)IPConfigurationServiceGetNotificationKey(*(void *)(a1 + 16));
  uint64_t v3 = CFArrayCreate(0LL, (const void **)values, 1LL, MEMORY[0x189605228]);
  SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(v2 + 8), v3, 0LL);
  CFRelease(v3);
  if (SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(v2 + 8), *(dispatch_queue_t *)(v2 + 24)))
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
  }

  else
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_6:
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v4 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v4 = 136315138;
      *(void *)(v4 + 4) = "DHCPv6PDServiceResumeSync";
      __SC_log_send();
    }
  }

  uint64_t v6 = *(void *)(a1 + 48);
  dispatch_queue_global_t global_queue = *(dispatch_queue_global_t *)(a1 + 56);
  sub_1891D7590((const void **)v2);
  BOOL v7 = *(const __SCDynamicStore **)(a1 + 24);
  if (v7)
  {
    SCDynamicStoreSetDispatchQueue(v7, 0LL);
    SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(a1 + 24), 0LL, 0LL);
  }

  if (!global_queue) {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = sub_1891D12E0;
  block[3] = &unk_18A35EE70;
  block[4] = v6;
  dispatch_async(global_queue, block);
}

__n128 DHCPv6PDServiceInfoGetPrefix(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t DHCPv6PDServiceInfoGetPrefixLength(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t DHCPv6PDServiceInfoGetPrefixValidLifetime(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t DHCPv6PDServiceInfoGetPrefixPreferredLifetime(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

const void *DHCPv6PDServiceInfoGetOptionData(uint64_t a1, unsigned int a2)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"DHCPv6");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    CFArrayGetTypeID();
    return 0LL;
  }

  CFStringRef v5 = CFStringCreateWithFormat(0LL, 0LL, @"Option_%d", a2);
  uint64_t v6 = CFDictionaryGetValue((CFDictionaryRef)Value, v5);
  CFRelease(v5);
  CFTypeID v7 = CFArrayGetTypeID();
  if (!v6) {
    return 0LL;
  }
  if (CFGetTypeID(v6) == v7) {
    return v6;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1891D1008()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_18C4FF198 = result;
  return result;
}

void sub_1891D102C(uint64_t a1)
{
  uint64_t v2 = *(unsigned int **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(dispatch_queue_s **)(a1 + 40);
    if (v3)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = sub_1891D1180;
      block[3] = &unk_18A35EE20;
      block[4] = a1;
      dispatch_sync(v3, block);
      uint64_t v2 = *(unsigned int **)(a1 + 32);
    }

    sub_1891D1824(v2);
    *(void *)(a1 + 32) = 0LL;
  }

  uint64_t v4 = *(const __SCDynamicStore **)(a1 + 24);
  if (v4)
  {
    SCDynamicStoreSetDispatchQueue(v4, 0LL);
    sub_1891D7590((const void **)(a1 + 24));
  }

  sub_1891D7590((const void **)(a1 + 16));
  CFStringRef v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    _Block_release(v5);
    *(void *)(a1 + 48) = 0LL;
  }

  uint64_t v6 = *(dispatch_object_s **)(a1 + 56);
  if (v6)
  {
    dispatch_release(v6);
    *(void *)(a1 + 56) = 0LL;
  }

  CFTypeID v7 = *(dispatch_object_s **)(a1 + 40);
  if (v7)
  {
    dispatch_release(v7);
    *(void *)(a1 + 40) = 0LL;
  }

__CFString *sub_1891D10FC(void *a1)
{
  uint64_t v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<DHCPv6PDService %p [%p]> {", a1, v2);
  CFStringAppendFormat(Mutable, 0LL, @"service = %@", a1[2]);
  CFStringAppend(Mutable, @"}");
  return Mutable;
}

void *sub_1891D1180(uint64_t a1)
{
  return sub_1891D17EC(*(void **)(*(void *)(a1 + 32) + 32LL));
}

void sub_1891D118C(uint64_t a1)
{
  uint64_t v2 = *(const __CFDictionary **)(a1 + 40);
  if (v2)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    v11[1] = 0LL;
    uint64_t v12 = 0LL;
    v11[0] = 0LL;
    Value = (const __CFDictionary *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x18960C590]);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        CFStringRef v5 = (const __CFString *)CFDictionaryGetValue(Value, @"DelegatedPrefix");
        CFTypeID v6 = CFStringGetTypeID();
        if (v5)
        {
          if (CFGetTypeID(v5) == v6)
          {
            if (sub_1891D7644(v5, v11))
            {
              CFTypeID v7 = (const __CFString *)CFDictionaryGetValue(Value, @"DelegatedPrefixLength");
              if (sub_1891D7794(v7, &v15))
              {
                LOBYTE(v12) = v15;
                uint64_t v8 = (const __CFString *)CFDictionaryGetValue(Value, @"DelegatedPrefixValidLifetime");
                if (sub_1891D7794(v8, &v15))
                {
                  HIDWORD(v12) = v15;
                  uint64_t v9 = (const __CFString *)CFDictionaryGetValue(Value, @"DelegatedPrefixPreferredLifetime");
                  if ((sub_1891D7794(v9, &v15) & 1) != 0)
                  {
                    LODWORD(v13) = v15;
                    uint64_t v14 = *(void *)(a1 + 40);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  (*(void (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 48));
  CFIndex v10 = *(const void **)(a1 + 40);
  if (v10) {
    CFRelease(v10);
  }
}

uint64_t sub_1891D12E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t IPConfigurationForgetNetwork(const __CFString *a1, void *a2)
{
  kern_return_t v4;
  mach_error_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  CFDictionaryRef v10;
  CFDataRef Data;
  const UInt8 *BytePtr;
  int Length;
  mach_error_t v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  mach_port_t sp;
  void *values;
  void *keys;
  __int128 v24;
  uint64_t v25;
  v25 = *MEMORY[0x1895F89C0];
  sp = 0;
  sub_1891D1970((uint64_t)"Library");
  if (!a1 || !a2)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!(_DWORD)result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = "IPConfigurationForgetNetwork";
    goto LABEL_11;
  }

  uint64_t v4 = bootstrap_look_up(*MEMORY[0x1895F9630], "com.apple.network.IPConfiguration", &sp);
  if (v4)
  {
    CFStringRef v5 = v4;
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!(_DWORD)result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    CFTypeID v7 = _os_log_pack_fill();
    uint64_t v8 = mach_error_string(v5);
    *(_DWORD *)CFTypeID v7 = 136315138;
    *(void *)(v7 + 4) = v8;
    goto LABEL_11;
  }

  uint64_t v24 = 0uLL;
  sub_1891D75C0(a1, (UInt8 *)&v24, 16, 0);
  values = a2;
  keys = @"SSID";
  CFIndex v10 = CFDictionaryCreate( 0LL,  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  Data = CFPropertyListCreateData(0LL, v10, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  CFRelease(v10);
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(Data);
  uint64_t v14 = sub_1891D721C(sp, &v24, (uint64_t)BytePtr, Length, (int *)&keys);
  CFRelease(Data);
  if (v14)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!(_DWORD)result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    int v15 = _os_log_pack_fill();
    uint64_t v16 = mach_error_string(v14);
    *(_DWORD *)int v15 = 136315394;
    *(void *)(v15 + 4) = &v24;
    *(_WORD *)(v15 + 12) = 2080;
    *(void *)(v15 + 14) = v16;
    goto LABEL_11;
  }

  dispatch_queue_t v17 = (int)keys;
  sub_1891D7908();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if (v17)
  {
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      SCDynamicStoreRef v18 = _os_log_pack_fill();
      else {
        uint64_t v19 = "<unknown>";
      }
      *(_DWORD *)SCDynamicStoreRef v18 = 136315394;
      *(void *)(v18 + 4) = &v24;
      *(_WORD *)(v18 + 12) = 2080;
      *(void *)(v18 + 14) = v19;
LABEL_11:
      __SC_log_send();
      return 0LL;
    }
  }

  else
  {
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      v20 = _os_log_pack_fill();
      *(_DWORD *)v20 = 136315138;
      *(void *)(v20 + 4) = &v24;
      __SC_log_send();
    }

    return 1LL;
  }

  return result;
}

uint64_t sub_1891D17CC(uint64_t result)
{
  v1 = (unsigned int *)(result + 8);
  do
    unsigned int v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return result;
}

uint64_t sub_1891D17E4(uint64_t a1)
{
  return *(void *)a1;
}

void *sub_1891D17EC(void *result)
{
  *uint64_t result = 0LL;
  return result;
}

_DWORD *sub_1891D17F4(uint64_t a1)
{
  uint64_t result = malloc(0x10uLL);
  *(void *)uint64_t result = a1;
  result[2] = 1;
  return result;
}

void sub_1891D1824(unsigned int *a1)
{
  v1 = a1 + 2;
  do
    int v2 = __ldxr(v1);
  while (__stxr(v2 - 1, v1));
  if (v2 == 1)
  {
    free(a1);
  }

  else if (v2 <= 0)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      *(_WORD *)_os_log_pack_fill() = 0;
      __SC_log_send();
    }

    abort();
  }

void sub_1891D1970(uint64_t a1)
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = sub_1891D19DC;
  block[3] = &unk_18A35EF40;
  block[4] = a1;
  if (qword_18C4FF190 != -1) {
    dispatch_once(&qword_18C4FF190, block);
  }
}

uint64_t sub_1891D19DC(uint64_t a1)
{
  os_log_t v1 = os_log_create("com.apple.IPConfiguration", *(const char **)(a1 + 32));
  return sub_1891D78FC((uint64_t)v1);
}

SCDynamicStoreRef sub_1891D19FC( uint64_t a1, const __CFString *a2, dispatch_queue_s *a3, void (__cdecl *a4)(SCDynamicStoreRef, CFArrayRef, void *), uint64_t a5, void *a6)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  context.version = 0LL;
  *(_OWORD *)&context.retain = *(_OWORD *)off_18A35EFC0;
  context.copyDescription = 0LL;
  BOOL v11 = sub_1891D17F4(a1);
  context.info = v11;
  SCDynamicStoreRef v12 = SCDynamicStoreCreate(0LL, a2, a4, &context);
  SCDynamicStoreRef v16 = v12;
  if (!v12)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    goto LABEL_11;
  }

  uint64_t v13 = v12;
  if (a5 && !SCDynamicStoreSetDisconnectCallBack())
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    goto LABEL_11;
  }

  if (!a3 || SCDynamicStoreSetDispatchQueue(v13, a3)) {
    goto LABEL_14;
  }
  sub_1891D7908();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
LABEL_11:
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 138412290;
    *(void *)(v14 + 4) = a2;
    __SC_log_send();
  }

LABEL_12:
  sub_1891D7590((const void **)&v16);
  if (v11)
  {
    sub_1891D1824(v11);
    BOOL v11 = 0LL;
  }

LABEL_14:
  *a6 = v11;
  return v16;
}

uint64_t sub_1891D1C98(const __CFString *a1, const __CFDictionary *a2)
{
  keys[2] = *(void **)MEMORY[0x1895F89C0];
  uint64_t v53 = 0LL;
  pthread_once(&stru_18C4FF180, (void (*)(void))sub_1891D4444);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  v59 = 0LL;
  if (!a2)
  {
    int v7 = 1;
    goto LABEL_6;
  }

  Value = CFDictionaryGetValue(a2, @"NoPublish");
  *(void *)&__int128 v54 = Value;
  if (Value)
  {
    CFStringRef v5 = Value;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (CFGetTypeID(v5) != TypeID)
    {
      sub_1891D7908();
      _SC_syslog_os_log_mapping();
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v26 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v26 = 138412290;
      *(void *)(v26 + 4) = @"NoPublish";
LABEL_51:
      __SC_log_send();
      goto LABEL_52;
    }

    int v7 = CFBooleanGetValue((CFBooleanRef)v5);
  }

  else
  {
    int v7 = 1;
  }

  SCDynamicStoreRef v16 = @"MTU";
  dispatch_queue_t v17 = CFDictionaryGetValue(a2, @"MTU");
  *((void *)&v54 + 1) = v17;
  if (v17)
  {
    uint64_t v18 = v17;
    CFTypeID v19 = CFNumberGetTypeID();
    if (CFGetTypeID(v18) != v19)
    {
      sub_1891D7908();
      _SC_syslog_os_log_mapping();
      goto LABEL_50;
    }
  }

  SCDynamicStoreRef v16 = @"APNName";
  v20 = CFDictionaryGetValue(a2, @"APNName");
  *(void *)&__int128 v55 = v20;
  if (v20)
  {
    v21 = v20;
    CFTypeID v22 = CFStringGetTypeID();
    if (CFGetTypeID(v21) != v22)
    {
      sub_1891D7908();
      _SC_syslog_os_log_mapping();
      goto LABEL_50;
    }
  }

  SCDynamicStoreRef v16 = @"ClearState";
  CFNumberRef v23 = CFDictionaryGetValue(a2, @"ClearState");
  *((void *)&v55 + 1) = v23;
  if (v23)
  {
    uint64_t v24 = v23;
    CFTypeID v25 = CFBooleanGetTypeID();
    if (CFGetTypeID(v24) != v25)
    {
      sub_1891D7908();
      _SC_syslog_os_log_mapping();
LABEL_50:
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v42 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v42 = 138412290;
      *(void *)(v42 + 4) = v16;
      goto LABEL_51;
    }
  }

  if (CFDictionaryContainsKey(a2, @"IPv4Entity"))
  {
  }

  else
  {
    LOBYTE(v56) = 1;
  }

LABEL_6:
  pthread_once(&stru_18C4FF180, (void (*)(void))sub_1891D4444);
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  uint64_t v9 = (UInt8 *)(Instance + 16);
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 176) = 0u;
  *(_OWORD *)(Instance + 192) = 0u;
  *(_OWORD *)(Instance + 208) = 0u;
  uint64_t v53 = Instance;
  if (!Instance) {
    goto LABEL_52;
  }
  uint64_t v10 = Instance;
  *(void *)uint64_t v9 = 0LL;
  *(void *)(Instance + 24) = 0LL;
  sub_1891D75C0(a1, v9, 16, 0);
  CFStringRef v11 = sub_1891D78BC(0LL);
  SCDynamicStoreRef v12 = (const void **)MEMORY[0x189604DE8];
  *(void *)(v10 + 184) = v11;
  uint64_t v13 = (__CFDictionary *)*v12;
  uint64_t v14 = (__CFDictionary *)v54;
  if (!(void)v54) {
    uint64_t v14 = v13;
  }
  v63 = @"MonitorPID";
  v64 = @"NoPublish";
  CFDictionaryRef v60 = v13;
  v61 = v14;
  if (*((void *)&v54 + 1))
  {
    v65 = @"MTU";
    uint64_t v62 = *((void *)&v54 + 1);
    unsigned int v15 = 3;
  }

  else
  {
    unsigned int v15 = 2;
  }

  *(&v63 + v15) = @"ServiceID";
  *(&v60 + v15) = (CFDictionaryRef)v11;
  unsigned int v27 = v15 + 1;
  v28 = (const __CFDictionary *)v55;
  if (*((void *)&v55 + 1)) {
    uint64_t v13 = (__CFDictionary *)*((void *)&v55 + 1);
  }
  *(&v63 + v27) = @"ClearState";
  *(&v60 + v27) = v13;
  unsigned int v29 = v15 + 2;
  if (v28)
  {
    *(&v63 + v29) = @"APNName";
    *(&v60 + v29) = v28;
    unsigned int v29 = v15 + 3;
  }

  int v30 = v56;
  if ((_BYTE)v56)
  {
    v31 = (const __CFDictionary *)v57;
    if ((void)v57)
    {
      *(&v63 + v29) = @"PerformNUD";
      *(&v60 + v29++) = v31;
    }

    v32 = (const __CFDictionary *)v58;
    if ((void)v58)
    {
      *(&v63 + v29) = @"EnableDAD";
      *(&v60 + v29++) = v32;
    }

    v33 = (const __CFDictionary *)*((void *)&v58 + 1);
    if (*((void *)&v58 + 1))
    {
      *(&v63 + v29) = @"EnableCLAT46";
      *(&v60 + v29++) = v33;
    }

    v34 = v59;
    if (v59)
    {
      *(&v63 + v29) = @"EnableDHCPv6";
      *(&v60 + v29++) = v34;
    }

    CFDictionaryRef v35 = CFDictionaryCreate( 0LL,  (const void **)&v63,  (const void **)&v60,  v29,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    v36 = (const __CFDictionary *)*((void *)&v56 + 1);
    if (*((void *)&v56 + 1))
    {
      v37 = (const void *)*((void *)&v57 + 1);
      if (*((void *)&v57 + 1))
      {
        v38 = (const void *)*MEMORY[0x18960C758];
        if (!CFDictionaryContainsKey(*((CFDictionaryRef *)&v56 + 1), (const void *)*MEMORY[0x18960C758]))
        {
          MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v36);
          CFDictionarySetValue(MutableCopy, v38, v37);
LABEL_62:
          v45 = (const __CFString **)MEMORY[0x18960C590];
          goto LABEL_63;
        }
      }

      v39 = (__CFDictionary *)CFRetain(v36);
    }

    else
    {
      keys[0] = *(void **)MEMORY[0x18960C738];
      values[0] = *(void **)MEMORY[0x18960CB20];
      if (*((void *)&v57 + 1))
      {
        keys[1] = *(void **)MEMORY[0x18960C758];
        values[1] = *((void **)&v57 + 1);
        CFIndex v41 = 2LL;
      }

      else
      {
        CFIndex v41 = 1LL;
      }

      v39 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  v41,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    }

    MutableCopy = v39;
    goto LABEL_62;
  }

  CFDictionaryRef v35 = CFDictionaryCreate(0LL, (const void **)&v63, (const void **)&v60, v29, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (*((void *)&v56 + 1)) {
    v40 = (__CFDictionary *)CFRetain(*((CFTypeRef *)&v56 + 1));
  }
  else {
    v40 = CFDictionaryCreate( 0LL,  MEMORY[0x18960C6D0],  MEMORY[0x18960CB00],  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  }
  MutableCopy = v40;
  v45 = (const __CFString **)MEMORY[0x18960C588];
LABEL_63:
  v46 = *v45;
  v63 = @"__IPConfigurationServiceOptions";
  v64 = v46;
  CFDictionaryRef v60 = v35;
  v61 = MutableCopy;
  CFDictionaryRef v47 = CFDictionaryCreate(0LL, (const void **)&v63, (const void **)&v60, 2LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFRelease(v35);
  CFRelease(MutableCopy);
  *(void *)(v10 + 208) = v47;
  *(_BYTE *)(v10 + 216) = v30;
  if (v7)
  {
    CFStringRef NetworkServiceEntity = CFStringCreateWithFormat( 0LL,  0LL,  @"Plugin:IPConfigurationService:%@",  *(void *)(v10 + 184));
  }

  else
  {
    v49 = (CFStringRef *)MEMORY[0x18960C590];
    if (!v30) {
      v49 = (CFStringRef *)MEMORY[0x18960C588];
    }
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( 0LL,  (CFStringRef)*MEMORY[0x18960C548],  *(CFStringRef *)(v10 + 184),  *v49);
  }

  *(_OWORD *)(v10 + 56) = 0u;
  *(void *)(v10 + 192) = NetworkServiceEntity;
  v50 = *(const __CFString **)(v10 + 184);
  *(_OWORD *)(v10 + 72) = 0u;
  *(_OWORD *)(v10 + 88) = 0u;
  *(_OWORD *)(v10 + 104) = 0u;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_OWORD *)(v10 + 136) = 0u;
  *(_OWORD *)(v10 + 152) = 0u;
  *(_OWORD *)(v10 + 168) = 0u;
  sub_1891D75C0(v50, (UInt8 *)(v10 + 56), 128, 0);
  v51 = dispatch_queue_create("IPConfigurationService", 0LL);
  *(void *)(v10 + 48) = v51;
  if (v51)
  {
    SCDynamicStoreRef v52 = sub_1891D19FC( v10,  @"IPConfigurationService",  v51,  (void (__cdecl *)(SCDynamicStoreRef, CFArrayRef, void *))nullsub_1,  (uint64_t)sub_1891D2978,  (void *)(v10 + 200));
    *(void *)(v10 + 40) = v52;
    if (v52) {
      return v10;
    }
    goto LABEL_52;
  }

  sub_1891D7908();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    *(_WORD *)_os_log_pack_fill() = 0;
    goto LABEL_51;
  }

LABEL_52:
  sub_1891D7590((const void **)&v53);
  return v53;
}

uint64_t IPConfigurationServiceGetTypeID()
{
  return qword_18C4FF1A0;
}

uint64_t sub_1891D25E0(const __CFDictionary *a1, const __CFDictionary **a2)
{
  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"IPv4Entity");
  if (!Value) {
    return 1LL;
  }
  uint64_t v4 = Value;
  if (sub_1891D35DC(Value))
  {
    *a2 = v4;
    return 1LL;
  }

  sub_1891D7908();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if ((_DWORD)result)
  {
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 138412290;
    *(void *)(v6 + 4) = @"IPv4Entity";
    __SC_log_send();
    return 0LL;
  }

  return result;
}

uint64_t sub_1891D2718(const __CFDictionary *a1, const __CFDictionary **a2)
{
  void v11[2] = *MEMORY[0x1895F89C0];
  uint64_t result = sub_1891D3CC4(a1, @"PerformNUD", a2 + 1);
  if ((_DWORD)result)
  {
    uint64_t result = sub_1891D3CC4(a1, @"EnableDAD", a2 + 3);
    if ((_DWORD)result)
    {
      uint64_t result = sub_1891D3CC4(a1, @"EnableCLAT46", a2 + 4);
      if ((_DWORD)result)
      {
        uint64_t result = sub_1891D3CC4(a1, @"EnableDHCPv6", a2 + 5);
        if ((_DWORD)result)
        {
          CFStringRef v5 = @"IPv6Entity";
          Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"IPv6Entity");
          if (Value)
          {
            int v7 = Value;
            if (!sub_1891D3E08(Value))
            {
              sub_1891D7908();
              _SC_syslog_os_log_mapping();
              uint64_t result = __SC_log_enabled();
              if (!(_DWORD)result) {
                return result;
              }
              _os_log_pack_size();
              MEMORY[0x1895F8858]();
              __error();
              goto LABEL_18;
            }

            *a2 = v7;
          }

          CFStringRef v5 = @"IPv6LinkLocalAddress";
          uint64_t v8 = (const __CFString *)CFDictionaryGetValue(a1, @"IPv6LinkLocalAddress");
          if (!v8) {
            return 1LL;
          }
          uint64_t v9 = v8;
          if (sub_1891D7644(v8, v11) && LOBYTE(v11[0]) == 254 && (BYTE1(v11[0]) & 0xC0) == 0x80)
          {
            a2[2] = (const __CFDictionary *)v9;
            return 1LL;
          }

          sub_1891D7908();
          _SC_syslog_os_log_mapping();
          uint64_t result = __SC_log_enabled();
          if ((_DWORD)result)
          {
            _os_log_pack_size();
            MEMORY[0x1895F8858]();
            __error();
LABEL_18:
            uint64_t v10 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v10 = 138412290;
            *(void *)(v10 + 4) = v5;
            __SC_log_send();
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1891D2978(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1891D17E4(a2);
  if (result)
  {
    uint64_t v3 = result;
    if (*(_DWORD *)(result + 32))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue( *(CFDictionaryRef *)(result + 208),  @"__IPConfigurationServiceOptions");
      if (Value)
      {
        CFStringRef v5 = Value;
        if (CFDictionaryContainsKey(Value, @"ClearState"))
        {
          MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v5);
          CFDictionaryRemoveValue(MutableCopy, @"ClearState");
          int v7 = CFDictionaryCreateMutableCopy(0LL, 0LL, *(CFDictionaryRef *)(v3 + 208));
          CFDictionarySetValue(v7, @"__IPConfigurationServiceOptions", MutableCopy);
          CFRelease(MutableCopy);
          CFRelease(*(CFTypeRef *)(v3 + 208));
          *(void *)(v3 + 208) = v7;
        }
      }

      sub_1891D7908();
      _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        _os_log_pack_size();
        MEMORY[0x1895F8858]();
        __error();
        uint64_t v8 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v8 = 136315138;
        *(void *)(v8 + 4) = v3 + 16;
        __SC_log_send();
      }

      return sub_1891D2CE8(v3, *(_DWORD *)(v3 + 32));
    }

    else
    {
      *(_BYTE *)(result + 217) = 1;
    }
  }

  return result;
}

uint64_t sub_1891D2B30(uint64_t a1)
{
  kern_return_t v2;
  mach_error_t v3;
  uint64_t v4;
  char *v5;
  dispatch_queue_s *v7;
  void block[5];
  mach_port_t v9;
  mach_port_t sp;
  uint64_t v11;
  CFStringRef v11 = *MEMORY[0x1895F89C0];
  sp = 0;
  int v2 = bootstrap_look_up(*MEMORY[0x1895F9630], "com.apple.network.IPConfiguration", &sp);
  if (v2)
  {
    uint64_t v3 = v2;
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v4 = _os_log_pack_fill();
      CFStringRef v5 = mach_error_string(v3);
      *(_DWORD *)uint64_t v4 = 136315138;
      *(void *)(v4 + 4) = v5;
      __SC_log_send();
    }
  }

  else if (!sub_1891D2CE8(a1, sp))
  {
    int v7 = *(dispatch_queue_s **)(a1 + 48);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = sub_1891D2FB4;
    block[3] = &unk_18A35EFD8;
    block[4] = a1;
    uint64_t v9 = sp;
    dispatch_sync(v7, block);
    return 1LL;
  }

  if (sp) {
    mach_port_deallocate(*MEMORY[0x1895FBBE0], sp);
  }
  return 0LL;
}

uint64_t sub_1891D2CE8(uint64_t a1, mach_port_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unsigned int v17 = 0;
  Data = CFPropertyListCreateData(0LL, *(CFPropertyListRef *)(a1 + 208), kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  BytePtr = CFDataGetBytePtr(Data);
  int Length = CFDataGetLength(Data);
  int v7 = (__int128 *)(a1 + 16);
  uint64_t v8 = (_OWORD *)(a1 + 56);
  mach_error_t v9 = sub_1891D6B00(a2, (__int128 *)(a1 + 16), (uint64_t)BytePtr, Length, (_OWORD *)(a1 + 56), &v17);
  if (v9)
  {
LABEL_2:
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v10 = _os_log_pack_fill();
      CFStringRef v11 = mach_error_string(v9);
      *(_DWORD *)uint64_t v10 = 136315394;
      *(void *)(v10 + 4) = v7;
      *(_WORD *)(v10 + 12) = 2080;
      *(void *)(v10 + 14) = v11;
LABEL_4:
      __SC_log_send();
    }
  }

  else
  {
    int v13 = 0;
    while (v17)
    {
      if (((v17 == 15) & ~v13) == 0)
      {
        sub_1891D7908();
        _SC_syslog_os_log_mapping();
        _os_log_pack_size();
        MEMORY[0x1895F8858]();
        __error();
        uint64_t v15 = _os_log_pack_fill();
        if (v17 <= 0x15) {
          SCDynamicStoreRef v16 = off_18A35F0A0[v17];
        }
        else {
          SCDynamicStoreRef v16 = "<unknown>";
        }
        *(_DWORD *)uint64_t v15 = 136315394;
        *(void *)(v15 + 4) = v7;
        *(_WORD *)(v15 + 12) = 2080;
        *(void *)(v15 + 14) = v16;
        goto LABEL_4;
      }

      sub_1891D6CE4(a2, v7, (uint64_t)BytePtr, Length, (int *)&v17);
      mach_error_t v14 = sub_1891D6B00(a2, v7, (uint64_t)BytePtr, Length, v8, &v17);
      int v13 = 1;
      if (v14)
      {
        mach_error_t v9 = v14;
        goto LABEL_2;
      }
    }
  }

  CFRelease(Data);
  return v17;
}

uint64_t sub_1891D2FB4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  *(_DWORD *)(v1 + 32) = *(_DWORD *)(result + 40);
  if (*(_BYTE *)(v1 + 217)) {
    return sub_1891D2CE8(v1, *(_DWORD *)(result + 40));
  }
  return result;
}

BOOL sub_1891D2FD8(uint64_t a1)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  int v8 = 17;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 48);
  if (v1 && *(_DWORD *)(a1 + 32))
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 0x40000000LL;
    v4[2] = sub_1891D308C;
    v4[3] = &unk_18A35F000;
    v4[4] = &v5;
    v4[5] = a1;
    dispatch_sync(v1, v4);
    BOOL v2 = *((_DWORD *)v6 + 6) == 0;
  }

  else
  {
    BOOL v2 = 0LL;
  }

  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_1891D308C(uint64_t a1)
{
  uint64_t result = sub_1891D73CC( *(_DWORD *)(*(void *)(a1 + 40) + 32LL),  (__int128 *)(*(void *)(a1 + 40) + 16LL),  (__int128 *)(*(void *)(a1 + 40) + 56LL),  (_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  if ((_DWORD)result)
  {
    mach_error_t v3 = result;
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      __error();
      uint64_t v4 = _os_log_pack_fill();
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = v5 + 16;
      uint64_t v7 = v5 + 56;
      int v8 = mach_error_string(v3);
      *(_DWORD *)uint64_t v4 = 136315650;
      *(void *)(v4 + 4) = v6;
      *(_WORD *)(v4 + 12) = 2080;
      *(void *)(v4 + 14) = v7;
      *(_WORD *)(v4 + 22) = 2080;
      *(void *)(v4 + 24) = v8;
      return __SC_log_send();
    }
  }

  return result;
}

const void *IPConfigurationServiceCreate(const __CFString *a1, const __CFDictionary *a2)
{
  v8[1] = *(const void **)MEMORY[0x1895F89C0];
  sub_1891D7908();
  _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136315394;
    *(void *)(v4 + 4) = "IPConfigurationServiceCreate";
    *(_WORD *)(v4 + 12) = 2112;
    *(void *)(v4 + 14) = a1;
    __SC_log_send();
  }

  uint64_t v5 = (const void *)sub_1891D1C98(a1, a2);
  uint64_t v6 = v5;
  v8[0] = v5;
  if (v5 && !sub_1891D2B30((uint64_t)v5))
  {
    sub_1891D7590(v8);
    return v8[0];
  }

  return v6;
}

uint64_t IPConfigurationServiceGetNotificationKey(uint64_t a1)
{
  return *(void *)(a1 + 192);
}

CFPropertyListRef IPConfigurationServiceCopyInformation(uint64_t a1)
{
  CFPropertyListRef v1 = SCDynamicStoreCopyValue(*(SCDynamicStoreRef *)(a1 + 40), *(CFStringRef *)(a1 + 192));
  uint64_t v4 = v1;
  if (v1)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(v1) != TypeID)
    {
      sub_1891D7590(&v4);
      return v4;
    }
  }

  return v1;
}

uint64_t IPConfigurationServiceRefreshConfiguration(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v1 = a1 + 16;
  uint64_t v2 = a1 + 56;
  uint64_t result = sub_1891D7058(*(_DWORD *)(a1 + 32), (__int128 *)(a1 + 16), (__int128 *)(a1 + 56), &v9);
  if ((_DWORD)result)
  {
    mach_error_t v4 = result;
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!(_DWORD)result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v5 = _os_log_pack_fill();
    uint64_t v6 = mach_error_string(v4);
    *(_DWORD *)uint64_t v5 = 136315650;
    *(void *)(v5 + 4) = v1;
    *(_WORD *)(v5 + 12) = 2080;
    *(void *)(v5 + 14) = v2;
    *(_WORD *)(v5 + 22) = 2080;
    *(void *)(v5 + 24) = v6;
    return __SC_log_send();
  }

  if (v9)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v7 = _os_log_pack_fill();
      if (v9 <= 0x15) {
        int v8 = off_18A35F0A0[v9];
      }
      else {
        int v8 = "<unknown>";
      }
      *(_DWORD *)uint64_t v7 = 136315650;
      *(void *)(v7 + 4) = v1;
      *(_WORD *)(v7 + 12) = 2080;
      *(void *)(v7 + 14) = v2;
      *(_WORD *)(v7 + 22) = 2080;
      *(void *)(v7 + 24) = v8;
      return __SC_log_send();
    }
  }

  return result;
}

uint64_t sub_1891D35DC(const __CFDictionary *a1)
{
  v21[1] = *MEMORY[0x1895F89C0];
  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960C6D0]);
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0LL;
  }
  if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x18960CB10]))
  {
    if (CFEqual(Value, (CFTypeRef)*MEMORY[0x18960CB00]))
    {
      uint64_t v4 = *MEMORY[0x18960C6D8];
      SCDynamicStoreRef v16 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960C6D8]);
      if (v16)
      {
        unsigned int v17 = v16;
        CFTypeID v18 = CFStringGetTypeID();
        if (CFGetTypeID(v17) == v18)
        {
          uint64_t v10 = 2LL;
          goto LABEL_29;
        }

        sub_1891D7908();
        _SC_syslog_os_log_mapping();
        uint64_t result = __SC_log_enabled();
        if (!(_DWORD)result) {
          return result;
        }
LABEL_18:
        _os_log_pack_size();
        MEMORY[0x1895F8858]();
        __error();
        goto LABEL_19;
      }
    }

    else
    {
      uint64_t result = CFEqual(Value, (CFTypeRef)*MEMORY[0x18960CB08]);
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t v10 = 1LL;
    goto LABEL_29;
  }

  uint64_t v4 = *MEMORY[0x18960C6C0];
  uint64_t v5 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960C6C0]);
  CFTypeID v6 = CFArrayGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v6)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    goto LABEL_18;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)v5);
  if (!Count)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    goto LABEL_18;
  }

  uint64_t v8 = Count;
  if (!sub_1891D3AA0(a1, (const void *)*MEMORY[0x18960C720], Count, &v20)
    || !sub_1891D3AA0(a1, (const void *)*MEMORY[0x18960C6E0], v8, v21))
  {
    return 0LL;
  }

  uint64_t v9 = 2LL;
  if (v20) {
    uint64_t v9 = 3LL;
  }
  if (v21[0]) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v4 = *MEMORY[0x18960C718];
  CFStringRef v11 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960C718]);
  if (v11)
  {
    SCDynamicStoreRef v12 = v11;
    CFTypeID v13 = CFStringGetTypeID();
    if (CFGetTypeID(v12) == v13)
    {
      ++v10;
      goto LABEL_29;
    }

    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
LABEL_19:
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 138412290;
    *(void *)(v14 + 4) = v4;
LABEL_20:
    __SC_log_send();
    return 0LL;
  }

LABEL_29:
  if (v10 == CFDictionaryGetCount(a1)) {
    return 1LL;
  }
  sub_1891D7908();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if ((_DWORD)result)
  {
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 138412290;
    *(void *)(v19 + 4) = a1;
    goto LABEL_20;
  }

  return result;
}

  sub_1891D7908();
  uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
  int v30 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    CFDictionaryRef v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    uint64_t v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    CFIndex v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    aBlock = 0u;
    v37 = 0u;
    os_log_type_enabled((os_log_t)v14, v30);
    v31 = (__int128 *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v31 != &aBlock)
    {
      unsigned int v29 = v31;
      goto LABEL_32;
    }
  }

uint64_t sub_1891D3AA0(const __CFDictionary *a1, const void *a2, uint64_t a3, void *a4)
{
  *a4 = 0LL;
  Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    goto LABEL_4;
  }
  CFTypeID TypeID = CFArrayGetTypeID();
  if (CFGetTypeID(Value) != TypeID)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!(_DWORD)result) {
      return result;
    }
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 138412290;
    *(void *)(v11 + 4) = a2;
    __SC_log_send();
    return 0LL;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  if (Count == a3)
  {
LABEL_4:
    *a4 = Value;
    return 1LL;
  }

  CFIndex v12 = Count;
  sub_1891D7908();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if ((_DWORD)result)
  {
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 138412802;
    *(void *)(v13 + 4) = a2;
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = v12;
    *(_WORD *)(v13 + 22) = 2048;
    *(void *)(v13 + 24) = a3;
    __SC_log_send();
    return 0LL;
  }

  return result;
}

uint64_t sub_1891D3CC4(const __CFDictionary *a1, const void *a2, void *a3)
{
  *a3 = 0LL;
  Value = CFDictionaryGetValue(a1, a2);
  if (Value && (CFTypeID TypeID = CFBooleanGetTypeID(), CFGetTypeID(Value) != TypeID))
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if ((_DWORD)result)
    {
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 138412290;
      *(void *)(v8 + 4) = a2;
      __SC_log_send();
      return 0LL;
    }
  }

  else
  {
    *a3 = Value;
    return 1LL;
  }

  return result;
}

uint64_t sub_1891D3E08(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960C738]);
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID) {
    return 0LL;
  }
  if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x18960CB30]))
  {
    if (CFEqual(Value, (CFTypeRef)*MEMORY[0x18960CB20]) || CFEqual(Value, (CFTypeRef)*MEMORY[0x18960CB28]))
    {
      uint64_t v14 = 1LL;
    }

    else
    {
      uint64_t result = CFEqual(Value, @"DHCPv6PD");
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v4 = @"RequestedPrefix";
      CFTypeID v18 = CFDictionaryGetValue(a1, @"RequestedPrefix");
      if (v18)
      {
        uint64_t v19 = v18;
        CFTypeID v20 = CFStringGetTypeID();
        if (CFGetTypeID(v19) != v20)
        {
          sub_1891D7908();
          _SC_syslog_os_log_mapping();
          uint64_t result = __SC_log_enabled();
          if (!(_DWORD)result) {
            return result;
          }
          goto LABEL_40;
        }

        uint64_t v14 = 2LL;
      }

      else
      {
        uint64_t v14 = 1LL;
      }

      uint64_t v4 = @"RequestedPrefixLength";
      v21 = CFDictionaryGetValue(a1, @"RequestedPrefixLength");
      if (v21)
      {
        CFTypeID v22 = v21;
        CFTypeID v23 = CFNumberGetTypeID();
        if (CFGetTypeID(v22) != v23)
        {
          sub_1891D7908();
          _SC_syslog_os_log_mapping();
          uint64_t result = __SC_log_enabled();
          if (!(_DWORD)result) {
            return result;
          }
          goto LABEL_40;
        }

        ++v14;
      }
    }

    goto LABEL_18;
  }

  uint64_t v4 = (const __CFString *)*MEMORY[0x18960C730];
  uint64_t v5 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960C730]);
  uint64_t v6 = *MEMORY[0x18960C760];
  uint64_t v7 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960C760]);
  CFTypeID v8 = CFArrayGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v8 || (CFTypeID v9 = CFArrayGetTypeID(), !v7) || CFGetTypeID(v7) != v9)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!(_DWORD)result) {
      return result;
    }
LABEL_14:
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 138412546;
    *(void *)(v16 + 4) = v4;
    *(_WORD *)(v16 + 12) = 2112;
    *(void *)(v16 + 14) = v6;
LABEL_41:
    __SC_log_send();
    return 0LL;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)v5);
  if (!Count)
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!(_DWORD)result) {
      return result;
    }
    goto LABEL_40;
  }

  if (Count != CFArrayGetCount((CFArrayRef)v7))
  {
    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!(_DWORD)result) {
      return result;
    }
    goto LABEL_14;
  }

  uint64_t v4 = (const __CFString *)*MEMORY[0x18960C788];
  uint64_t v11 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x18960C788]);
  if (v11)
  {
    CFIndex v12 = v11;
    CFTypeID v13 = CFStringGetTypeID();
    if (CFGetTypeID(v12) == v13)
    {
      uint64_t v14 = 4LL;
      goto LABEL_18;
    }

    sub_1891D7908();
    _SC_syslog_os_log_mapping();
    uint64_t result = __SC_log_enabled();
    if (!(_DWORD)result) {
      return result;
    }
LABEL_40:
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v24 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v24 = 138412290;
    *(void *)(v24 + 4) = v4;
    goto LABEL_41;
  }

  uint64_t v14 = 3LL;
LABEL_18:
  if (CFDictionaryGetCount(a1) == v14) {
    return 1LL;
  }
  sub_1891D7908();
  _SC_syslog_os_log_mapping();
  uint64_t result = __SC_log_enabled();
  if ((_DWORD)result)
  {
    _os_log_pack_size();
    MEMORY[0x1895F8858]();
    __error();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 138412290;
    *(void *)(v17 + 4) = a1;
    goto LABEL_41;
  }

  return result;
}

uint64_t sub_1891D4444()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_18C4FF1A0 = result;
  return result;
}

void sub_1891D4474(uint64_t a1)
{
  void block[5] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(unsigned int **)(a1 + 200);
  if (v2)
  {
    mach_error_t v3 = *(dispatch_queue_s **)(a1 + 48);
    if (v3)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = sub_1891D47F4;
      block[3] = &unk_18A35F080;
      block[4] = a1;
      dispatch_sync(v3, block);
      uint64_t v2 = *(unsigned int **)(a1 + 200);
    }

    sub_1891D1824(v2);
    *(void *)(a1 + 200) = 0LL;
  }

  uint64_t v4 = *(const __SCDynamicStore **)(a1 + 40);
  if (v4)
  {
    SCDynamicStoreSetDispatchQueue(v4, 0LL);
    sub_1891D7590((const void **)(a1 + 40));
  }

  uint64_t v5 = *(dispatch_object_s **)(a1 + 48);
  if (v5)
  {
    dispatch_release(v5);
    *(void *)(a1 + 48) = 0LL;
  }

  mach_port_t v6 = *(_DWORD *)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = a1 + 16;
    uint64_t v8 = a1 + 56;
    mach_error_t v9 = sub_1891D6E94(v6, (__int128 *)(a1 + 16), (__int128 *)(a1 + 56), &v15);
    if (v9)
    {
      mach_error_t v10 = v9;
      sub_1891D7908();
      _SC_syslog_os_log_mapping();
      if (!__SC_log_enabled())
      {
LABEL_20:
        mach_port_deallocate(*MEMORY[0x1895FBBE0], *(_DWORD *)(a1 + 32));
        *(_DWORD *)(a1 + 32) = 0;
        goto LABEL_21;
      }

      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v11 = _os_log_pack_fill();
      CFIndex v12 = mach_error_string(v10);
      *(_DWORD *)uint64_t v11 = 136315650;
      *(void *)(v11 + 4) = v7;
      *(_WORD *)(v11 + 12) = 2080;
      *(void *)(v11 + 14) = v8;
      *(_WORD *)(v11 + 22) = 2080;
      *(void *)(v11 + 24) = v12;
    }

    else
    {
      if (!v15) {
        goto LABEL_20;
      }
      sub_1891D7908();
      _SC_syslog_os_log_mapping();
      _os_log_pack_size();
      MEMORY[0x1895F8858]();
      __error();
      uint64_t v13 = _os_log_pack_fill();
      if (v15 <= 0x15) {
        uint64_t v14 = off_18A35F0A0[v15];
      }
      else {
        uint64_t v14 = "<unknown>";
      }
      *(_DWORD *)uint64_t v13 = 136315650;
      *(void *)(v13 + 4) = v7;
      *(_WORD *)(v13 + 12) = 2080;
      *(void *)(v13 + 14) = v8;
      *(_WORD *)(v13 + 22) = 2080;
      *(void *)(v13 + 24) = v14;
    }

    __SC_log_send();
    goto LABEL_20;
  }

LABEL_21:
  sub_1891D7590((const void **)(a1 + 208));
  sub_1891D7590((const void **)(a1 + 192));
  sub_1891D7590((const void **)(a1 + 184));
}

__CFString *sub_1891D476C(char *a1)
{
  uint64_t v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<IPConfigurationService %p [%p]> {", a1, v2);
  CFStringAppendFormat(Mutable, 0LL, @"ifname = %s, serviceID = %s", a1 + 16, a1 + 56);
  CFStringAppend(Mutable, @"}");
  return Mutable;
}

void *sub_1891D47F4(uint64_t a1)
{
  return sub_1891D17EC(*(void **)(*(void *)(a1 + 32) + 200LL));
}

uint64_t PvDInfoRequestCreate(const void *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (qword_18C4FF1A8 != -1) {
    dispatch_once(&qword_18C4FF1A8, &unk_18A35F200);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(void *)(Instance + 112) = 0LL;
  uint64_t v20 = Instance;
  if (Instance
    && (v9 = Instance, mach_error_t v10 = sub_1891D17F4(Instance), (*(void *)(v9 + 16) = v10) != 0LL)
    && (dispatch_queue_t v11 = dispatch_queue_create("PvDInfoRequestQueue", 0LL),
        CFIndex v12 = *(void **)(v9 + 24),
        *(void *)(v9 + 24) = v11,
        v12,
        *(void *)(v9 + 24)))
  {
    *(_BYTE *)(v9 + 40) = 0;
    uint64_t v13 = *(void **)(v9 + 56);
    *(void *)(v9 + 56) = 0LL;

    uint64_t v14 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = 0LL;

    unsigned int v15 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = 0LL;

    *(_DWORD *)(v9 + 104) = 0;
    *(void *)(v9 + 112) = 0LL;
    CFRetain(a1);
    if (a2) {
      CFRetain(a2);
    }
    *(void *)(v9 + 72) = a1;
    *(void *)(v9 + 80) = a2;
    *(void *)(v9 + 88) = a3;
    *(void *)(v9 + 96) = a4;
  }

  else
  {
    sub_1891D7908();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v21, 0, sizeof(v21));
      os_log_type_enabled(v16, v17);
      CFTypeID v18 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v18 != v21) {
        free(v18);
      }
    }

    sub_1891D7590((const void **)&v20);
    return v20;
  }

  return v9;
}

void PvDInfoRequestSetCompletionHandler(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(dispatch_queue_s **)(a1 + 24);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1891D4AF4;
  block[3] = &unk_18A35F158;
  id v12 = v5;
  uint64_t v13 = a1;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_sync(v7, block);
}

void sub_1891D4AF4(uint64_t a1)
{
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 16LL);
  id v4 = *(id *)(a1 + 40);
  id v5 = dispatch_source_create(MEMORY[0x1895F8B18], 0LL, 0LL, v2);
  if (v5)
  {
    sub_1891D17CC(v3);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = sub_1891D5E54;
    v9[3] = &unk_18A35F288;
    uint64_t v11 = v3;
    id v10 = v4;
    id v6 = _Block_copy(v9);
    dispatch_source_set_event_handler(v5, v6);
    dispatch_activate(v5);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v5;
}

BOOL sub_1891D4BDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    uint64_t v3 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0LL;

    sub_1891D1824(*(unsigned int **)(a1 + 16));
  }

  return v1 != 0;
}

void PvDInfoRequestCancel(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1891D4E04;
    block[3] = &unk_18A35F178;
    void block[4] = a1;
    dispatch_sync(v2, block);
    uint64_t v4 = *(void *)(a1 + 16);
    sub_1891D17CC(v4);
    id v5 = *(dispatch_queue_s **)(a1 + 24);
    v9[0] = v3;
    v9[1] = 3221225472LL;
    v9[2] = sub_1891D4E0C;
    v9[3] = &unk_18A35F178;
    void v9[4] = v4;
    dispatch_async(v5, v9);
  }

  else
  {
    sub_1891D7908();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v13, 0, sizeof(v13));
      os_log_type_enabled(v6, v7);
      int v11 = 136315138;
      id v12 = "PvDInfoRequestCancel";
      id v8 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v8 != v13) {
        free(v8);
      }
    }
  }

BOOL sub_1891D4E04(uint64_t a1)
{
  return sub_1891D4BDC(*(void *)(a1 + 32));
}

void sub_1891D4E0C(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = sub_1891D17E4(*(void *)(a1 + 32));
  sub_1891D1824(*(unsigned int **)(a1 + 32));
  if (v2)
  {
    sub_1891D4F88(v2);
    sub_1891D4FDC(v2);
    *(_DWORD *)(v2 + 104) = 0;
  }

  else
  {
    sub_1891D7908();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v6, 0, sizeof(v6));
      os_log_type_enabled(v3, v4);
      id v5 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v5 != v6) {
        free(v5);
      }
    }
  }

void sub_1891D4F88(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    [v2 cancelRequest];
    uint64_t v3 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0LL;
  }

  os_log_type_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    [v4 invalidate];
    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0LL;
  }

  *(_BYTE *)(a1 + 40) = 0;
}

double sub_1891D4FDC(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  return result;
}

void PvDInfoRequestResume(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 16);
    sub_1891D17CC(v2);
    uint64_t v3 = *(dispatch_queue_s **)(a1 + 24);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_1891D51D4;
    block[3] = &unk_18A35F198;
    void block[4] = a1;
    void block[5] = v2;
    dispatch_async(v3, block);
  }

  else
  {
    sub_1891D7908();
    os_log_type_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v10, 0, sizeof(v10));
      os_log_type_enabled(v4, v5);
      int v8 = 136315138;
      id v9 = "PvDInfoRequestResume";
      id v6 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v6 != v10) {
        free(v6);
      }
    }
  }

void sub_1891D51D4(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16LL);
  uint64_t v3 = sub_1891D17E4(v2);
  if (!v3)
  {
    sub_1891D7908();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v8 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 aBlock = 0u;
      __int128 v37 = 0u;
      os_log_type_enabled(v7, v8);
      id v9 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v9 != &aBlock) {
        free(v9);
      }
    }

    id v10 = 0LL;
    goto LABEL_29;
  }

  uint64_t v4 = v3;
  if (*(_BYTE *)(v3 + 40))
  {
    sub_1891D7908();
    os_log_type_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    goto LABEL_24;
  }

  if (*(_DWORD *)(v3 + 104))
  {
    sub_1891D7908();
    os_log_type_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_11:
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 aBlock = 0u;
      __int128 v37 = 0u;
      os_log_type_enabled(v5, v6);
      CFTypeID v25 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v25 != &aBlock) {
        free(v25);
      }
    }

LABEL_24:
    id v10 = 0LL;
    goto LABEL_25;
  }

  uint64_t v11 = [objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.IPConfiguration.IPConfigurationHelper"];
  if (!v11)
  {
    sub_1891D7908();
    os_log_type_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v6 = _SC_syslog_os_log_mapping();
    goto LABEL_24;
  }

  id v10 = (void *)v11;
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C781138];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setRemoteObjectInterface:v12];

  uint64_t v13 = [v10 remoteObjectProxyWithErrorHandler:&unk_18A35F2C8];
  if (v13)
  {
    id v14 = (id)v13;
    objc_storeStrong((id *)(v4 + 48), v10);
    objc_storeStrong((id *)(v4 + 56), v14);
    sub_1891D7908();
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v16 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 aBlock = 0u;
      __int128 v37 = 0u;
      os_log_type_enabled(v15, v16);
      os_log_type_t v17 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v17 != &aBlock) {
        free(v17);
      }
    }

    [*(id *)(v4 + 48) activate];
    *(_BYTE *)(v4 + 40) = 1;
    uint64_t v18 = sub_1891D17E4(v2);
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      uint64_t v20 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(v18 + 24));
      if (v20)
      {
        uint64_t v21 = v19[2];
        sub_1891D17CC(v21);
        *(void *)&__int128 aBlock = MEMORY[0x1895F87A8];
        *((void *)&aBlock + 1) = 3221225472LL;
        *(void *)&__int128 v37 = sub_1891D5FFC;
        *((void *)&v37 + 1) = &unk_18A35F178;
        *(void *)&__int128 v38 = v21;
        uint64_t v22 = _Block_copy(&aBlock);
        dispatch_source_set_event_handler(v20, v22);
        dispatch_time_t v23 = dispatch_time(0LL, 1000000LL * v19[12]);
        dispatch_source_set_timer(v20, v23, 0xFFFFFFFFFFFFFFFFLL, 0LL);
        dispatch_activate(v20);
      }

      else
      {
        sub_1891D7908();
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v34 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 aBlock = 0u;
          __int128 v37 = 0u;
          os_log_type_enabled((os_log_t)v22, v34);
          CFDictionaryRef v35 = (__int128 *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v35 != &aBlock) {
            free(v35);
          }
        }
      }

      uint64_t v24 = (os_log_s *)v19[8];
      v19[8] = v20;
    }

    else
    {
      sub_1891D7908();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v32 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 aBlock = 0u;
        __int128 v37 = 0u;
        os_log_type_enabled(v24, v32);
        v33 = (__int128 *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v33 != &aBlock) {
          free(v33);
        }
      }
    }

    goto LABEL_33;
  }

LABEL_25:
  if (*(void *)(v4 + 72))
  {
    sub_1891D7908();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    os_log_type_t v26 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 aBlock = 0u;
      __int128 v37 = 0u;
      os_log_type_enabled((os_log_t)v14, v26);
      unsigned int v27 = *(const __CFString **)(v4 + 72);
      id v14 = v14;
      CFStringGetCStringPtr(v27, 0x8000100u);
      v28 = (__int128 *)_os_log_send_and_compose_impl();

      __SC_log_send2();
      if (v28 != &aBlock)
      {
        unsigned int v29 = v28;
LABEL_32:
        free(v29);
        goto LABEL_33;
      }
    }

    goto LABEL_33;
  }

LABEL_33:
  sub_1891D1824(*(unsigned int **)(a1 + 40));
}

uint64_t PvDInfoRequestGetCompletionStatus(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

uint64_t PvDInfoRequestCopyAdditionalInformation(uint64_t a1)
{
  uint64_t v5 = 0LL;
  os_log_type_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 24);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = sub_1891D5CD0;
  v4[3] = &unk_18A35F1C0;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

CFDictionaryRef sub_1891D5CD0(uint64_t a1)
{
  CFDictionaryRef result = CFDictionaryCreateCopy(0LL, *(CFDictionaryRef *)(*(void *)(a1 + 40) + 112LL));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_1891D5D08()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_18C4FF1B0 = result;
  return result;
}

void sub_1891D5D38(void *a1)
{
  uint64_t v2 = (unsigned int *)a1[2];
  if (v2)
  {
    uint64_t v3 = (dispatch_queue_s *)a1[3];
    if (v3)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1891D5E48;
      block[3] = &unk_18A35F178;
      void block[4] = a1;
      dispatch_sync(v3, block);
      uint64_t v2 = (unsigned int *)a1[2];
    }

    sub_1891D1824(v2);
    a1[2] = 0LL;
  }

  uint64_t v4 = (void *)a1[7];
  if (v4)
  {
    [v4 cancelRequest];
    uint64_t v5 = (void *)a1[7];
    a1[7] = 0LL;
  }

  os_log_type_t v6 = (void *)a1[6];
  if (v6)
  {
    [v6 invalidate];
    uint64_t v7 = (void *)a1[6];
    a1[6] = 0LL;
  }

  sub_1891D4FDC((uint64_t)a1);
  uint64_t v8 = (void *)a1[3];
  a1[3] = 0LL;
}

BOOL sub_1891D5E00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
    uint64_t v3 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0LL;

    sub_1891D1824(*(unsigned int **)(a1 + 16));
  }

  return v1 != 0;
}

void *sub_1891D5E48(uint64_t a1)
{
  return sub_1891D17EC(*(void **)(*(void *)(a1 + 32) + 16LL));
}

uint64_t sub_1891D5E54(uint64_t a1)
{
  uint64_t result = sub_1891D17E4(*(void *)(a1 + 40));
  if (result)
  {
    uint64_t result = sub_1891D4BDC(result);
    if ((_DWORD)result) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }

  return result;
}

void sub_1891D5E98(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  sub_1891D7908();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v4 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    memset(v6, 0, sizeof(v6));
    os_log_type_enabled(v3, v4);
    uint64_t v5 = (_OWORD *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v5 != v6) {
      free(v5);
    }
  }
}

void sub_1891D5FFC(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v1 = sub_1891D17E4(*(void *)(a1 + 32));
  if (v1)
  {
    uint64_t v2 = v1;
    if (sub_1891D5E00(v1))
    {
      id v3 = *(id *)(v2 + 72);
      id v4 = *(id *)(v2 + 80);
      [NSString stringWithCString:*(void *)(v2 + 88) encoding:4];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        uint64_t v6 = *(void *)(v2 + 16);
        sub_1891D17CC(v6);
        uint64_t v7 = *(void **)(v2 + 56);
        *(void *)&__int128 v14 = MEMORY[0x1895F87A8];
        *((void *)&v14 + 1) = 3221225472LL;
        *(void *)&__int128 v15 = sub_1891D6344;
        *((void *)&v15 + 1) = &unk_18A35F2E8;
        *(void *)&__int128 v16 = v6;
        [v7 fetchPvDAdditionalInformationWithPvDID:v3 prefixesArray:v4 bindToInterface:v5 andCompletionHandler:&v14];
        *(_DWORD *)(v2 + 104) = 1;
      }

      else
      {
        sub_1891D7908();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v9 = _SC_syslog_os_log_mapping();
        if (__SC_log_enabled())
        {
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          __int128 v14 = 0u;
          __int128 v15 = 0u;
          os_log_type_enabled(v8, v9);
          id v10 = (__int128 *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v10 != &v14) {
            free(v10);
          }
        }

        if (*(_DWORD *)(v2 + 104) != 1)
        {
          sub_1891D7908();
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_t v12 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            __int128 v28 = 0u;
            __int128 v29 = 0u;
            __int128 v26 = 0u;
            __int128 v27 = 0u;
            __int128 v24 = 0u;
            __int128 v25 = 0u;
            __int128 v22 = 0u;
            __int128 v23 = 0u;
            __int128 v20 = 0u;
            __int128 v21 = 0u;
            __int128 v18 = 0u;
            __int128 v19 = 0u;
            __int128 v16 = 0u;
            __int128 v17 = 0u;
            __int128 v14 = 0u;
            __int128 v15 = 0u;
            os_log_type_enabled(v11, v12);
            uint64_t v13 = (__int128 *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v13 != &v14) {
              free(v13);
            }
          }

          sub_1891D4F88(v2);
          sub_1891D4FDC(v2);
          *(_DWORD *)(v2 + 104) = 0;
        }
      }
    }
  }

void sub_1891D6344(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = (const void *)sub_1891D17E4(*(void *)(a1 + 32));
  __int128 v17 = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    CFRetain(v4);
    uint64_t v6 = [v3 valueForKey:@"valid_fetch"];
    [v3 valueForKey:@"additional_information"];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v6 == *MEMORY[0x189604DE8] && v7 != 0LL) {
      v5[14] = v7;
    }
    if (v5[3])
    {
      uint64_t v10 = v5[2];
      sub_1891D17CC(v10);
      uint64_t v11 = (dispatch_queue_s *)v5[3];
      *(void *)&__int128 block = MEMORY[0x1895F87A8];
      *((void *)&block + 1) = 3221225472LL;
      *(void *)&__int128 v21 = sub_1891D6698;
      *((void *)&v21 + 1) = &unk_18A35F198;
      *(void *)&__int128 v22 = v10;
      *((void *)&v22 + 1) = v6;
      dispatch_async(v11, &block);
    }

    else
    {
      sub_1891D7908();
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v15 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v27 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 block = 0u;
        os_log_type_enabled(v14, v15);
        int v18 = 136315138;
        __int128 v19 = "PvDInfoRequestCompletedCallback";
        __int128 v16 = (__int128 *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v16 != &block) {
          free(v16);
        }
      }
    }
  }

  else
  {
    sub_1891D7908();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v12 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v27 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 block = 0u;
      os_log_type_enabled(v8, v12);
      int v18 = 136315138;
      __int128 v19 = "PvDInfoRequestXPCCompletionHandler";
      uint64_t v13 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v13 != &block) {
        free(v13);
      }
    }
  }

  sub_1891D7590(&v17);
  sub_1891D1824(*(unsigned int **)(a1 + 32));
}

void sub_1891D6698(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v2 = sub_1891D17E4(*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = v2;
    if (*(void *)(a1 + 40) == *MEMORY[0x189604DE0])
    {
      sub_1891D7908();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = _SC_syslog_os_log_mapping();
      if (__SC_log_enabled())
      {
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        os_log_type_enabled(v5, v13);
        __int128 v14 = (__int128 *)_os_log_send_and_compose_impl();
        __SC_log_send2();
        if (v14 != &v17) {
          free(v14);
        }
      }

      int v8 = 3;
    }

    else
    {
      uint64_t v4 = *(void *)(v2 + 112);
      sub_1891D7908();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v6 = _SC_syslog_os_log_mapping();
      int v7 = __SC_log_enabled();
      if (v4)
      {
        int v8 = 2;
        if (v7)
        {
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          os_log_type_enabled(v5, v6);
          os_log_type_t v9 = (__int128 *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v9 != &v17) {
            free(v9);
          }
          int v8 = 2;
        }
      }

      else
      {
        if (v7)
        {
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          os_log_type_enabled(v5, v6);
          os_log_type_t v15 = (__int128 *)_os_log_send_and_compose_impl();
          __SC_log_send2();
          if (v15 != &v17) {
            free(v15);
          }
        }

        int v8 = 0;
      }
    }

    *(_DWORD *)(v3 + 104) = v8;
    sub_1891D4F88(v3);
    __int128 v16 = *(dispatch_source_s **)(v3 + 32);
    if (v16) {
      dispatch_source_merge_data(v16, 1uLL);
    }
  }

  else
  {
    sub_1891D7908();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_t v11 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      os_log_type_enabled(v10, v11);
      os_log_type_t v12 = (__int128 *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v12 != &v17) {
        free(v12);
      }
    }
  }

  sub_1891D1824(*(unsigned int **)(a1 + 32));
}

uint64_t sub_1891D6B00(mach_port_t a1, __int128 *a2, uint64_t a3, int a4, _OWORD *a5, _DWORD *a6)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  int v19 = 1;
  uint64_t v20 = a3;
  LODWORD(v21) = 16777472;
  DWORD1(v21) = a4;
  *((void *)&v21 + 1) = *MEMORY[0x1895F8468];
  __int128 v22 = *a2;
  LODWORD(v23) = a4;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4E2700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3, 0x48u, 0xB0u, reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v10)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v11;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v11 = 4294966988LL;
    }

    else if (msg.msgh_id == 20107)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 168)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v11 = HIDWORD(v20);
            if (!HIDWORD(v20))
            {
              __int128 v14 = v26;
              a5[4] = v25;
              a5[5] = v14;
              __int128 v15 = v28;
              a5[6] = v27;
              a5[7] = v15;
              __int128 v16 = v22;
              *a5 = v21;
              a5[1] = v16;
              __int128 v17 = v24;
              a5[2] = v23;
              a5[3] = v17;
              *a6 = v29;
              return v11;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v12 = 1;
          }
          else {
            BOOL v12 = HIDWORD(v20) == 0;
          }
          if (v12) {
            uint64_t v11 = 4294966996LL;
          }
          else {
            uint64_t v11 = HIDWORD(v20);
          }
          goto LABEL_23;
        }
      }

      uint64_t v11 = 4294966996LL;
    }

    else
    {
      uint64_t v11 = 4294966995LL;
    }

LABEL_23:
    mach_msg_destroy(&msg);
    return v11;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v11;
}

    mach_msg_destroy(&v12);
    return v9;
  }

  mig_put_reply_port(v12.msgh_local_port);
  return v9;
}

    mach_msg_destroy(&msg);
    return v16;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v16;
}

    mach_msg_destroy(&msg);
    return v16;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v16;
}

    mach_msg_destroy(&v12);
    return v9;
  }

  mig_put_reply_port(v12.msgh_local_port);
  return v9;
}

    mach_msg_destroy(&msg);
    return v16;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v16;
}

uint64_t sub_1891D6CE4(mach_port_t a1, __int128 *a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v13 = 1;
  uint64_t v14 = a3;
  int v15 = 16777472;
  int v16 = a4;
  uint64_t v17 = *MEMORY[0x1895F8468];
  __int128 v18 = *a2;
  int v19 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = reply_port;
  v12.msgh_bits = -2147478253;
  *(void *)&v12.msgh_voucher_port = 0x4E2A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v12);
    mach_port_t reply_port = v12.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&v12, 3, 0x48u, 0x30u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v9;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v12.msgh_id == 20110)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 40)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = HIDWORD(v14) == 0;
          }
          if (v10) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = HIDWORD(v14);
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t sub_1891D6E94(mach_port_t a1, __int128 *a2, __int128 *a3, _DWORD *a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  __int128 v6 = *a2;
  __int128 v7 = a3[4];
  __int128 v8 = a3[6];
  __int128 v9 = a3[7];
  __int128 v27 = a3[5];
  __int128 v28 = v8;
  __int128 v29 = v9;
  __int128 v10 = *a3;
  __int128 v11 = a3[1];
  __int128 v21 = v6;
  __int128 v22 = v10;
  __int128 v12 = a3[2];
  __int128 v13 = a3[3];
  __int128 v23 = v11;
  __int128 v24 = v12;
  uint64_t v20 = *MEMORY[0x1895F8468];
  __int128 v26 = v7;
  __int128 v25 = v13;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4E2D00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v15 = mach_msg(&msg, 3, 0xB0u, 0x30u, reply_port, 0, 0);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v15)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v16;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v16 = 4294966988LL;
    }

    else if (msg.msgh_id == 20113)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v16 = v21;
            if (!(_DWORD)v21)
            {
              *a4 = DWORD1(v21);
              return v16;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = (_DWORD)v21 == 0;
          }
          if (v17) {
            uint64_t v16 = 4294966996LL;
          }
          else {
            uint64_t v16 = v21;
          }
          goto LABEL_23;
        }
      }

      uint64_t v16 = 4294966996LL;
    }

    else
    {
      uint64_t v16 = 4294966995LL;
    }

uint64_t sub_1891D7058(mach_port_t a1, __int128 *a2, __int128 *a3, _DWORD *a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  __int128 v6 = *a2;
  __int128 v7 = a3[4];
  __int128 v8 = a3[6];
  __int128 v9 = a3[7];
  __int128 v27 = a3[5];
  __int128 v28 = v8;
  __int128 v29 = v9;
  __int128 v10 = *a3;
  __int128 v11 = a3[1];
  __int128 v21 = v6;
  __int128 v22 = v10;
  __int128 v12 = a3[2];
  __int128 v13 = a3[3];
  __int128 v23 = v11;
  __int128 v24 = v12;
  uint64_t v20 = *MEMORY[0x1895F8468];
  __int128 v26 = v7;
  __int128 v25 = v13;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4E2E00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v15 = mach_msg(&msg, 3, 0xB0u, 0x30u, reply_port, 0, 0);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v15)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v16;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v16 = 4294966988LL;
    }

    else if (msg.msgh_id == 20114)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v16 = v21;
            if (!(_DWORD)v21)
            {
              *a4 = DWORD1(v21);
              return v16;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = (_DWORD)v21 == 0;
          }
          if (v17) {
            uint64_t v16 = 4294966996LL;
          }
          else {
            uint64_t v16 = v21;
          }
          goto LABEL_23;
        }
      }

      uint64_t v16 = 4294966996LL;
    }

    else
    {
      uint64_t v16 = 4294966995LL;
    }

uint64_t sub_1891D721C(mach_port_t a1, __int128 *a2, uint64_t a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v13 = 1;
  uint64_t v14 = a3;
  int v15 = 16777472;
  int v16 = a4;
  uint64_t v17 = *MEMORY[0x1895F8468];
  __int128 v18 = *a2;
  int v19 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = reply_port;
  v12.msgh_bits = -2147478253;
  *(void *)&v12.msgh_voucher_port = 0x4E2F00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v12);
    mach_port_t reply_port = v12.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&v12, 3, 0x48u, 0x30u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v9;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v12.msgh_id == 20115)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 40)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = HIDWORD(v14) == 0;
          }
          if (v10) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = HIDWORD(v14);
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t sub_1891D73CC(mach_port_t a1, __int128 *a2, __int128 *a3, _DWORD *a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  __int128 v6 = *a2;
  __int128 v7 = a3[4];
  __int128 v8 = a3[6];
  __int128 v9 = a3[7];
  __int128 v27 = a3[5];
  __int128 v28 = v8;
  __int128 v29 = v9;
  __int128 v10 = *a3;
  __int128 v11 = a3[1];
  __int128 v21 = v6;
  __int128 v22 = v10;
  __int128 v12 = a3[2];
  __int128 v13 = a3[3];
  __int128 v23 = v11;
  __int128 v24 = v12;
  uint64_t v20 = *MEMORY[0x1895F8468];
  __int128 v26 = v7;
  __int128 v25 = v13;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4E3500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v15 = mach_msg(&msg, 3, 0xB0u, 0x30u, reply_port, 0, 0);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v15)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v16;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v16 = 4294966988LL;
    }

    else if (msg.msgh_id == 20121)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v16 = v21;
            if (!(_DWORD)v21)
            {
              *a4 = DWORD1(v21);
              return v16;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = (_DWORD)v21 == 0;
          }
          if (v17) {
            uint64_t v16 = 4294966996LL;
          }
          else {
            uint64_t v16 = v21;
          }
          goto LABEL_23;
        }
      }

      uint64_t v16 = 4294966996LL;
    }

    else
    {
      uint64_t v16 = 4294966995LL;
    }

void sub_1891D7590(const void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0LL;
    }
  }

uint64_t sub_1891D75C0(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
{
  CFIndex usedBufLen = 0LL;
  v11.length = CFStringGetLength(a1);
  v11.location = 0LL;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, a4, a2, a3 - 1, &usedBufLen);
  int v8 = usedBufLen;
  if (a2) {
    a2[usedBufLen] = 0;
  }
  return (v8 + 1);
}

uint64_t sub_1891D7644(const __CFString *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *a2 = 0LL;
  a2[1] = 0LL;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0LL;
  }
  uint64_t result = CFStringGetCString(a1, buffer, 64LL, 0x600u);
  if ((_DWORD)result) {
    return inet_pton(30, buffer, a2) == 1;
  }
  return result;
}

uint64_t sub_1891D76F8(const __CFString *a1, _DWORD *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  sub_1891D75C0(a1, (UInt8 *)__str, 64, 0);
  unint64_t v3 = strtoul(__str, 0LL, 0);
  if (v3 == -1LL) {
    return 0LL;
  }
  int v4 = v3;
  if (*__error() == 34) {
    return 0LL;
  }
  *a2 = v4;
  return 1LL;
}

uint64_t sub_1891D7794(const __CFString *a1, _DWORD *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1)
  {
    CFBooleanGetTypeID();
    CFNumberGetTypeID();
    return 0LL;
  }

  if (CFGetTypeID(a1) == TypeID) {
    return (sub_1891D76F8(a1, a2) & 1) != 0;
  }
  CFTypeID v6 = CFBooleanGetTypeID();
  if (CFGetTypeID(a1) != v6)
  {
    CFTypeID v7 = CFNumberGetTypeID();
    if (CFGetTypeID(a1) == v7)
    {
      uint64_t result = CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, a2);
      if (!(_DWORD)result) {
        return result;
      }
      return 1LL;
    }

    return 0LL;
  }

  *a2 = CFBooleanGetValue((CFBooleanRef)a1);
  return 1LL;
}

CFStringRef sub_1891D7854(void *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t v1 = inet_ntop(30, a1, v3, 0x2Eu);
  return CFStringCreateWithCString(0LL, v1, 0x600u);
}

CFStringRef sub_1891D78BC(const __CFAllocator *a1)
{
  uint64_t v2 = CFUUIDCreate(a1);
  CFStringRef v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

uint64_t sub_1891D78FC(uint64_t result)
{
  qword_18C780E90 = result;
  return result;
}

uint64_t sub_1891D7908()
{
  return qword_18C780E90;
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x189603870](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x18960C1C0](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate( CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x18960C1C8](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity( CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x18960C1F8](allocator, domain, serviceID, entity);
}

uint64_t SCDynamicStoreSetDisconnectCallBack()
{
  return MEMORY[0x18960C200]();
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x18960C208](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x18960C218](store, keys, patterns);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x18960C4F8]();
}

uint64_t __SC_log_enabled()
{
  return MEMORY[0x18960C500]();
}

uint64_t __SC_log_send()
{
  return MEMORY[0x18960C508]();
}

uint64_t __SC_log_send2()
{
  return MEMORY[0x18960C510]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x1895F8DD0]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x1895F8DD8]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void abort(void)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1895F9618](*(void *)&bp, service_name, sp);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, unint64_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

void free(void *a1)
{
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FB838](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1895FB840](*(void *)&a1, a2, a3);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FBAE8]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1895FBE98]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_release(id a1)
{
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1895FD5F8](msg);
}

uint64_t objc_msgSend_fetchPvDAdditionalInformationWithPvDID_prefixesArray_bindToInterface_andCompletionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_fetchPvDAdditionalInformationWithPvDID_prefixesArray_bindToInterface_andCompletionHandler_);
}