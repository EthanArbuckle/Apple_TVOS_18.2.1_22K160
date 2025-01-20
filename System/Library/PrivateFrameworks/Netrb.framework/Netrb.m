uint64_t netrbInitIfnetTrafficDescriptor(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  xpc_object_t value;
  void *v8;
  xpc_object_t v9;
  uint64_t v10;
  void *v11;
  xpc_object_t v12;
  void *v13;
  xpc_object_t v14;
  void *v15;
  uint64_t v16;
  xpc_object_t v17;
  void *v18;
  unsigned __int8 v19;
  int v20;
  xpc_object_t v21;
  uint64_t v22;
  void *v23;
  const char *string_ptr;
  xpc_object_t v25;
  void *v26;
  const char *v27;
  char v28;
  xpc_object_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  if (!a1) {
    goto LABEL_3;
  }
  v4 = MEMORY[0x1895B5770]();
  v5 = MEMORY[0x1895F9250];
  if (v4 != MEMORY[0x1895F9250]) {
    goto LABEL_3;
  }
  value = xpc_dictionary_get_value(a1, netrbClientLowLatencyFlowParam);
  if (!value) {
    goto LABEL_3;
  }
  v8 = value;
  if (MEMORY[0x1895B5770]() != v5) {
    goto LABEL_3;
  }
  v9 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorIpVersion);
  v10 = MEMORY[0x1895F92F0];
  if (v9 && (v11 = v9, MEMORY[0x1895B5770]() == v10))
  {
    v19 = xpc_uint64_get_value(v11);
    v20 = v19;
    if (v19 != 4 && v19 != 96) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 1u;
      *(_BYTE *)(a2 + 9) = v19;
    }

    v21 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorLocalIp);
    v22 = MEMORY[0x1895F92E8];
    if (v21 && (v23 = v21, MEMORY[0x1895B5770]() == v22))
    {
      string_ptr = xpc_string_get_string_ptr(v23);
      if (a2) {
        *(_BYTE *)(a2 + 8) |= 4u;
      }
    }

    else
    {
      NETRBInfoLog();
      string_ptr = 0LL;
    }

    v25 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorRemoteIp);
    if (v25 && (v26 = v25, MEMORY[0x1895B5770]() == v22))
    {
      v27 = xpc_string_get_string_ptr(v26);
      if (a2) {
        *(_BYTE *)(a2 + 8) |= 8u;
      }
    }

    else
    {
      NETRBInfoLog();
      v27 = 0LL;
    }

    if (v20 == 4)
    {
      if (string_ptr && inet_pton(2, string_ptr, (char *)&v34 + 12) != 1
        || v27 && inet_pton(2, v27, (char *)&v33 + 12) != 1)
      {
        goto LABEL_3;
      }

      if (a2)
      {
        *(_DWORD *)(a2 + 24) = HIDWORD(v34);
        *(_DWORD *)(a2 + 40) = HIDWORD(v33);
      }
    }

    else
    {
      if (string_ptr && inet_pton(30, string_ptr, &v34) != 1 || v27 && inet_pton(30, v27, &v33) != 1) {
        goto LABEL_3;
      }
      if (a2)
      {
        *(_OWORD *)(a2 + 12) = v34;
        *(_OWORD *)(a2 + 28) = v33;
      }
    }
  }

  else
  {
    NETRBErrorLog();
  }

  v12 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorIpProtocol);
  if (v12 && (v13 = v12, MEMORY[0x1895B5770]() == v10))
  {
    v28 = xpc_uint64_get_value(v13);
    if (v28 != 17 && v28 != 6) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 2u;
      *(_BYTE *)(a2 + 10) = v28;
    }
  }

  else
  {
    NETRBInfoLog();
  }

  v14 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorLocalPort);
  if (v14)
  {
    v15 = v14;
    if (MEMORY[0x1895B5770]() != v10) {
      goto LABEL_3;
    }
    v16 = xpc_uint64_get_value(v15);
    if (v16 - 0x10000 < 0xFFFFFFFFFFFF0001LL) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x10u;
      *(_WORD *)(a2 + 44) = bswap32(v16) >> 16;
    }
  }

  else
  {
    NETRBInfoLog();
  }

  v17 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorRemotePort);
  if (v17)
  {
    v18 = v17;
    if (MEMORY[0x1895B5770]() != v10) {
      goto LABEL_3;
    }
    v32 = xpc_uint64_get_value(v18);
    if (v32 - 0x10000 < 0xFFFFFFFFFFFF0001LL) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x20u;
      *(_WORD *)(a2 + 46) = bswap32(v32) >> 16;
    }
  }

  else
  {
    NETRBErrorLog();
  }

  v30 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout);
  if (v30)
  {
    v31 = v30;
    if (MEMORY[0x1895B5770]() != v10 || xpc_uint64_get_value(v31) >= 0x69781)
    {
LABEL_3:
      NETRBErrorLog();
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t NETRBLogCreate()
{
  if (NETRBLogCreate_predLog != -1) {
    dispatch_once(&NETRBLogCreate_predLog, &__block_literal_global);
  }
  if (NETRBLogCreate_error) {
    return 12LL;
  }
  else {
    return 0LL;
  }
}

void __NETRBLogCreate_block_invoke()
{
  __netrbLog = (uint64_t)os_log_create("com.apple.MobileInternetSharing", "framework.netrb");
  if (!__netrbLog)
  {
    NETRBLogCreate_error = 1;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __NETRBLogCreate_block_invoke_cold_1();
    }
  }
}

uint64_t NETRBErrorLog()
{
  return os_log_with_args();
}

uint64_t NETRBNoticeLog()
{
  return os_log_with_args();
}

uint64_t NETRBInfoLog()
{
  return os_log_with_args();
}

uint64_t NETRBDebugLog()
{
  return os_log_with_args();
}

uint64_t NETRBXPCEndPointCreate(dispatch_queue_t targetq)
{
  if (__netrbReceiverConnection)
  {
    NETRBDebugLog();
  }

  else
  {
    xpc_connection_t v2 = xpc_connection_create(0LL, targetq);
    __netrbReceiverConnection = (uint64_t)v2;
    if (!v2)
    {
      NETRBErrorLog();
      return 0LL;
    }

    v3 = v2;
    NETRBInfoLog();
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __NETRBXPCEndPointCreate_block_invoke;
    handler[3] = &__block_descriptor_tmp_61;
    handler[4] = v3;
    handler[5] = targetq;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_resume((xpc_connection_t)__netrbReceiverConnection);
  }

  return 1LL;
}

void __NETRBXPCEndPointCreate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1895B5770](a2);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && (v5 == __netrbReceiverConnection ? (BOOL v6 = v4 == MEMORY[0x1895F9268]) : (BOOL v6 = 0), v6))
  {
  }

  else if (v4 == MEMORY[0x1895F9238])
  {
    v7 = *(dispatch_queue_s **)(a1 + 40);
    NETRBInfoLog();
    if (__netrbNotificationConnection)
    {
      xpc_connection_cancel((xpc_connection_t)__netrbNotificationConnection);
      xpc_release((xpc_object_t)__netrbNotificationConnection);
      __netrbNotificationConnection = 0LL;
    }

    __netrbNotificationConnection = (uint64_t)xpc_retain(a2);
    xpc_connection_set_target_queue((xpc_connection_t)a2, v7);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = ____NETRBXPCNewNotificationConnection_block_invoke;
    handler[3] = &__block_descriptor_tmp_75;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }

BOOL NETRBXPCCreate(dispatch_queue_t targetq, uint64_t a2)
{
  if (__netrbConnection)
  {
    NETRBDebugLog();
    return 1LL;
  }

  __netrbConnection = (uint64_t)xpc_connection_create_mach_service((const char *)netrbXPCService, targetq, 2uLL);
  if (!__netrbConnection) {
    goto LABEL_7;
  }
  if (MEMORY[0x1895B5770]() != MEMORY[0x1895F9238])
  {
    if (__netrbConnection)
    {
      xpc_release((xpc_object_t)__netrbConnection);
LABEL_8:
      BOOL result = 0LL;
      __netrbConnection = 0LL;
      return result;
    }

LABEL_7:
    NETRBErrorLog();
    goto LABEL_8;
  }

  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 0x40000000LL;
  handler[2] = __NETRBXPCCreate_block_invoke;
  handler[3] = &__block_descriptor_tmp_66;
  handler[4] = __netrbConnection;
  void handler[5] = a2;
  xpc_connection_set_event_handler((xpc_connection_t)__netrbConnection, handler);
  NETRBInfoLog();
  xpc_connection_resume((xpc_connection_t)__netrbConnection);
  return __netrbConnection != 0;
}

void __NETRBXPCCreate_block_invoke(uint64_t a1, xpc_object_t object)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v4[2] = __NETRBXPCCreate_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_65;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = object;
  v4[5] = v3;
  xpc_retain(object);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v4);
}

void __NETRBXPCCreate_block_invoke_2(uint64_t a1)
{
  if (MEMORY[0x1895B5770](*(void *)(a1 + 32)) == MEMORY[0x1895F9268])
  {
    if (*(void *)(a1 + 40) == __netrbConnection)
    {
      xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x1895F91B0]);
      NETRBErrorLog();
      NETRBXPCCleanup();
    }
  }

  else
  {
    NETRBErrorLog();
  }

  xpc_release(*(xpc_object_t *)(a1 + 32));
}

BOOL NETRBXPCCleanup()
{
  uint64_t v0 = __netrbConnection;
  if (__netrbConnection)
  {
    NETRBInfoLog();
    xpc_connection_cancel((xpc_connection_t)__netrbConnection);
    xpc_release((xpc_object_t)__netrbConnection);
    __netrbConnection = 0LL;
  }

  return v0 != 0;
}

BOOL NETRBXPCSetupAndSend(dispatch_queue_s *a1, xpc_object_t xdict, uint64_t a3)
{
  if (xpc_dictionary_get_uint64(xdict, netrbXPCKey) == 1000)
  {
    if (!__netrbReceiverConnection) {
      return 0LL;
    }
    xpc_dictionary_set_connection(xdict, (const char *)netrbXPCClientComm, (xpc_connection_t)__netrbReceiverConnection);
  }

  if (a1)
  {
    BOOL v6 = __netrbConnection != 0;
    if (__netrbConnection)
    {
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 0x40000000LL;
      handler[2] = ____NETRBXPCSendMessage_block_invoke;
      handler[3] = &unk_18A1329B0;
      handler[4] = a3;
      xpc_connection_send_message_with_reply((xpc_connection_t)__netrbConnection, xdict, a1, handler);
    }

    else
    {
      NETRBDebugLog();
    }

    return v6;
  }

  if (!__netrbConnection)
  {
    NETRBDebugLog();
    return 0LL;
  }

  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)__netrbConnection, xdict);
  v8 = v7;
  uint64_t v9 = MEMORY[0x1895F9250];
  if (v7)
  {
    uint64_t v10 = MEMORY[0x1895B5770](v7);
    if (v10 != MEMORY[0x1895F9268])
    {
      uint64_t v11 = v10;
      if (v10 == v9)
      {
        if (xpc_dictionary_get_uint64(v8, netrbXPCResponse) == 2002)
        {
          NETRBErrorLog();
          NETRBXPCCleanup();
        }

        uint64_t v11 = MEMORY[0x1895F9250];
      }

      else
      {
        NETRBErrorLog();
        NETRBXPCCleanup();
      }

      goto LABEL_18;
    }

    xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x1895F91B0]);
    NETRBErrorLog();
    NETRBXPCCleanup();
  }

  else
  {
    NETRBXPCCleanup();
    NETRBErrorLog();
  }

  uint64_t v11 = MEMORY[0x1895F9268];
LABEL_18:
  if (v11 == v9) {
    v12 = v8;
  }
  else {
    v12 = 0LL;
  }
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v12);
  if (v8) {
    xpc_release(v8);
  }
  return 1LL;
}

BOOL NETRBEndPointCleanup()
{
  uint64_t v0 = __netrbReceiverConnection;
  if (__netrbReceiverConnection)
  {
    NETRBInfoLog();
    xpc_connection_cancel((xpc_connection_t)__netrbReceiverConnection);
    xpc_release((xpc_object_t)__netrbReceiverConnection);
    __netrbReceiverConnection = 0LL;
  }

  return v0 != 0;
}

void *_NETRBClientCreateInternal(dispatch_object_s *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  char v20 = 0;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 2000LL;
  xpc_object_t v7 = 0LL;
  if (!NETRBLogCreate())
  {
    if (__NETRBClientGetTypeID_pred != -1) {
      dispatch_once(&__NETRBClientGetTypeID_pred, &__block_literal_global_0);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    xpc_object_t v7 = (void *)Instance;
    if (Instance)
    {
      bzero((void *)(Instance + 16), 0x218uLL);
      if (a1)
      {
        v7[2] = a1;
        dispatch_retain(a1);
        if (a2) {
          v7[3] = _Block_copy(a2);
        }
      }

      if (__NETRBClientGetQueue_predQueue != -1) {
        dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
      }
      uint64_t v10 = (dispatch_queue_s *)__NETRBClientGetQueue___netrbQueue;
      if (!__NETRBClientGetQueue___netrbQueue) {
        goto LABEL_19;
      }
      if (__NETRBClientGetXpcQueue_predXpc != -1) {
        dispatch_once(&__NETRBClientGetXpcQueue_predXpc, &__block_literal_global_177);
      }
      if (__NETRBClientGetXpcQueue___netrbXpcQueue)
      {
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 0x40000000LL;
        block[2] = ___NETRBClientCreateInternal_block_invoke;
        block[3] = &unk_18A132A00;
        block[6] = v7;
        block[7] = __NETRBClientGetXpcQueue___netrbXpcQueue;
        block[4] = &v17;
        block[5] = &v13;
        block[8] = v10;
        block[9] = a4;
        dispatch_sync(v10, block);
        if (*((_BYTE *)v18 + 24) && (v14[3] | 2) == 0x7D2) {
          *((_BYTE *)v18 + 24) = 0;
        }
      }

      else
      {
LABEL_19:
        NETRBErrorLog();
      }

      if (!*((_BYTE *)v18 + 24))
      {
        CFRelease(v7);
        xpc_object_t v7 = 0LL;
      }
    }

    else
    {
      uint64_t v11 = __error();
      strerror(*v11);
      NETRBErrorLog();
    }
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

LABEL_2:
  CFArrayAppendValue(v3, v2);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  uint64_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v4)
  {
    __NETRBClientRemoveFromList(*(const void **)(a1 + 48));
LABEL_12:
    NETRBErrorLog();
LABEL_16:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  uint64_t v5 = v4;
  xpc_dictionary_set_uint64(v4, netrbXPCKey, 0x3E8uLL);
  NETRBInfoLog();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  v9[2] = ___NETRBClientCreateInternal_block_invoke_2;
  v9[3] = &unk_18A1329D8;
  uint64_t v10 = *(_OWORD *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 72);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = NETRBXPCSetupAndSend(0LL, v5, (uint64_t)v9);
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    __NETRBClientRemoveFromList(*(const void **)(a1 + 48));
  }
  xpc_release(v5);
}

void __NETRBClientRemoveFromList(const void *a1)
{
  if (__netrbClientList && CFArrayGetCount((CFArrayRef)__netrbClientList) >= 1)
  {
    CFIndex v2 = 0LL;
    while (CFArrayGetValueAtIndex((CFArrayRef)__netrbClientList, v2) != a1)
    {
      if (++v2 >= CFArrayGetCount((CFArrayRef)__netrbClientList)) {
        return;
      }
    }

    CFArrayRemoveValueAtIndex((CFMutableArrayRef)__netrbClientList, v2);
    if (!CFArrayGetCount((CFArrayRef)__netrbClientList))
    {
      NETRBXPCCleanup();
      NETRBEndPointCleanup();
      CFRelease((CFTypeRef)__netrbClientList);
      __netrbClientList = 0LL;
    }
  }

void *_NETRBClientCreate(dispatch_object_s *a1, const void *a2, uint64_t a3)
{
  return _NETRBClientCreateInternal(a1, a2, a3, 0LL);
}

uint64_t _NETRBClientDestroy(uint64_t a1)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  char v12 = 0;
  uint64_t v5 = 0LL;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  uint64_t v8 = 2000LL;
  if (!a1) {
    goto LABEL_7;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientDestroy_block_invoke;
    block[3] = &unk_18A132A50;
    block[4] = &v9;
    block[5] = &v5;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v10 + 24)) {
      *((_BYTE *)v10 + 24) = v6[3] == 2001;
    }
  }

  else
  {
LABEL_7:
    NETRBErrorLog();
  }

  uint64_t v2 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

uint64_t __NETRBClientValidateClient(_BYTE *a1)
{
  if (!a1) {
    goto LABEL_9;
  }
  if (!a1[288]) {
    return 22LL;
  }
  if (!__netrbClientList || (Count = CFArrayGetCount((CFArrayRef)__netrbClientList)) == 0 || (CFIndex v3 = Count, Count < 1))
  {
LABEL_9:
    NETRBNoticeLog();
    return 22LL;
  }

  CFIndex v4 = 0LL;
  while (CFArrayGetValueAtIndex((CFArrayRef)__netrbClientList, v4) != a1)
  {
    if (v3 == ++v4) {
      goto LABEL_9;
    }
  }

  return 0LL;
}

uint64_t _NETRBClientStartService(uint64_t a1, char *__s1, int a3, int a4, void *a5)
{
  uint64_t v67 = 0LL;
  v68 = &v67;
  uint64_t v69 = 0x2000000000LL;
  char v70 = 0;
  if (!a1
    || (a3 - 205) <= 0xFFFFFFFA
    || (a4 - 304) <= 0xFFFFFFFB
    || __s1 && *__s1 && strncmp(__s1, (const char *)netrbClientAnyExternal, 0x10uLL) && !if_nametoindex(__s1)
    || (xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL)) == 0LL)
  {
    NETRBErrorLog();
    goto LABEL_22;
  }

  uint64_t v11 = v10;
  if (!a5) {
    goto LABEL_18;
  }
  uint64_t v12 = MEMORY[0x1895B5770](a5);
  uint64_t v13 = MEMORY[0x1895F9250];
  if (v12 != MEMORY[0x1895F9250]) {
    goto LABEL_18;
  }
  xpc_object_t value = xpc_dictionary_get_value(a5, (const char *)netrbClientDeviceType);
  if (!value) {
    goto LABEL_18;
  }
  uint64_t v15 = value;
  uint64_t v16 = MEMORY[0x1895B5770]();
  uint64_t v17 = MEMORY[0x1895F92F0];
  if (v16 != MEMORY[0x1895F92F0]) {
    goto LABEL_18;
  }
  uint64_t v18 = xpc_uint64_get_value(v15);
  if (v18 >= 7) {
    goto LABEL_18;
  }
  uint64_t v22 = v18;
  xpc_dictionary_set_uint64(v11, netrbXPCDeviceType, v18);
  if (v22 != 1)
  {
    xpc_object_t v25 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceName);
    if (!v25) {
      goto LABEL_18;
    }
    v26 = v25;
    if (MEMORY[0x1895B5770]() != MEMORY[0x1895F92E8]) {
      goto LABEL_18;
    }
    string_ptr = xpc_string_get_string_ptr(v26);
    if (!if_nametoindex(string_ptr)) {
      goto LABEL_18;
    }
    v32 = netrbXPCInterfaceName;
    v33 = xpc_string_get_string_ptr(v26);
    xpc_dictionary_set_string(v11, v32, v33);
  }

  xpc_object_t v23 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceMTU);
  if (v23)
  {
    v24 = v23;
    if (MEMORY[0x1895B5770]() != v17) {
      goto LABEL_18;
    }
    v27 = netrbXPCInterfaceMTU;
    uint64_t v28 = xpc_uint64_get_value(v24);
    xpc_dictionary_set_uint64(v11, v27, v28);
  }

  xpc_object_t v29 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceInstance);
  if (v29)
  {
    v30 = v29;
    if (MEMORY[0x1895B5770]() != v17) {
      goto LABEL_18;
    }
    v34 = netrbXPCInterfaceInstance;
    uint64_t v35 = xpc_uint64_get_value(v30);
    xpc_dictionary_set_uint64(v11, v34, v35);
  }

  xpc_object_t v36 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceStartAddress);
  if (v36)
  {
    v37 = v36;
    if (MEMORY[0x1895B5770]() != MEMORY[0x1895F92E8]) {
      goto LABEL_18;
    }
    v38 = netrbXPCStartAddress;
    v39 = xpc_string_get_string_ptr(v37);
    xpc_dictionary_set_string(v11, v38, v39);
  }

  xpc_object_t v40 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceEndAddress);
  if (v40)
  {
    v41 = v40;
    if (MEMORY[0x1895B5770]() != MEMORY[0x1895F92E8]) {
      goto LABEL_18;
    }
    v42 = netrbXPCEndAddress;
    v43 = xpc_string_get_string_ptr(v41);
    xpc_dictionary_set_string(v11, v42, v43);
  }

  xpc_object_t v44 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceNetworkMask);
  if (!v44) {
    goto LABEL_46;
  }
  v45 = v44;
  if (MEMORY[0x1895B5770]() != MEMORY[0x1895F92E8])
  {
LABEL_18:
    NETRBErrorLog();
LABEL_19:
    uint64_t v19 = v11;
LABEL_20:
    xpc_release(v19);
    goto LABEL_22;
  }

  v46 = netrbXPCNetworkMask;
  v47 = xpc_string_get_string_ptr(v45);
  xpc_dictionary_set_string(v11, v46, v47);
LABEL_46:
  xpc_object_t v48 = xpc_dictionary_get_value(a5, (const char *)netrbClientNatType);
  if (!v48)
  {
    if (a3 != 201)
    {
      xpc_dictionary_set_uint64(v11, netrbXPCNatType, 0x1F5uLL);
LABEL_56:
      v52 = 0LL;
      goto LABEL_57;
    }

    xpc_dictionary_set_uint64(v11, netrbXPCNatType, 0x1F4uLL);
LABEL_51:
    goto LABEL_56;
  }

  v49 = v48;
  if (MEMORY[0x1895B5770]() != v17) {
    goto LABEL_18;
  }
  unsigned int v50 = xpc_uint64_get_value(v49);
  unsigned int v51 = v50;
  if (v50 - 503 <= 0xFFFFFFFC) {
    goto LABEL_18;
  }
  xpc_dictionary_set_uint64(v11, netrbXPCNatType, v50);
  if (v51 == 500) {
    goto LABEL_51;
  }
  if (v51 != 502) {
    goto LABEL_56;
  }
  xpc_object_t v53 = xpc_dictionary_get_value(a5, (const char *)netrbClientNat64Param);
  if (!v53) {
    goto LABEL_56;
  }
  v54 = v53;
  if (MEMORY[0x1895B5770]() != v13) {
    goto LABEL_18;
  }
  xpc_object_t v55 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v55) {
    goto LABEL_18;
  }
  v52 = v55;
  xpc_object_t v56 = xpc_dictionary_get_value(v54, (const char *)netrbClientDns64Prefix);
  if (v56)
  {
    v57 = v56;
    if (MEMORY[0x1895B5770]() != MEMORY[0x1895F92E8]) {
      goto LABEL_76;
    }
    v58 = netrbXPCDns64Prefix;
    v59 = xpc_string_get_string_ptr(v57);
    xpc_dictionary_set_string(v52, v58, v59);
  }

  xpc_object_t v60 = xpc_dictionary_get_value(v54, (const char *)netrbClientRaPrefix);
  if (v60)
  {
    v61 = v60;
    if (MEMORY[0x1895B5770]() != MEMORY[0x1895F92E8])
    {
LABEL_76:
      NETRBErrorLog();
      xpc_release(v11);
LABEL_63:
      uint64_t v19 = v52;
      goto LABEL_20;
    }

    v62 = netrbXPCRaPrefix;
    v63 = xpc_string_get_string_ptr(v61);
    xpc_dictionary_set_string(v52, v62, v63);
  }

  xpc_dictionary_set_value(v11, netrbXPCNat64Param, v52);
LABEL_57:
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientStartService_block_invoke;
    block[3] = &unk_18A132A98;
    block[4] = &v67;
    block[5] = a1;
    int v65 = a3;
    int v66 = a4;
    block[6] = v11;
    void block[7] = __s1;
    block[8] = __NETRBClientGetQueue___netrbQueue;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  }

  else
  {
    NETRBErrorLog();
  }

  xpc_release(v11);
  if (v52) {
    goto LABEL_63;
  }
LABEL_22:
  uint64_t v20 = *((unsigned __int8 *)v68 + 24);
  _Block_object_dispose(&v67, 8);
  return v20;
}

uint64_t insert_nat66_params(void *a1, void *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, (const char *)netrbClientNat66Param);
  if (value)
  {
    CFIndex v4 = value;
    if (MEMORY[0x1895B5770]() != MEMORY[0x1895F9250]
      || (string = xpc_dictionary_get_string(v4, (const char *)netrbClientRaPrefix)) == 0LL)
    {
      NETRBErrorLog();
      return 0LL;
    }

    uint64_t v7 = string;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v8, netrbXPCRaPrefix, v7);
    xpc_dictionary_set_value(a2, netrbXPCNat66Param, v8);
  }

  return 1LL;
}

void __NETRBClientResponseHandler(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  if (!a3)
  {
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v8)
    {
LABEL_12:
      xpc_object_t v10 = (const char *)netrbClientNotificationKey;
      uint64_t v11 = v8;
      uint64_t v12 = 5003LL;
LABEL_13:
      xpc_dictionary_set_uint64(v11, v10, v12);
      goto LABEL_14;
    }

LABEL_15:
    NETRBErrorLog();
    goto LABEL_7;
  }

  if (xpc_dictionary_get_uint64(a3, netrbXPCResponse) == 2003)
  {
LABEL_6:
    NETRBDebugLog();
LABEL_7:
    CFRelease((CFTypeRef)a1);
    return;
  }

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v9) {
    goto LABEL_15;
  }
  xpc_object_t v8 = v9;
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, netrbXPCResponse);
  else {
    uint64_t v15 = 5003LL;
  }
  xpc_dictionary_set_uint64(v8, (const char *)netrbClientNotificationKey, v15);
  if (a2 != 1014 || uint64 != 2000)
  {
    goto LABEL_14;
  }

  uint64_t v16 = xpc_dictionary_get_uint64(a3, netrbXPCErrorCode);
  if (v16)
  {
    uint64_t v12 = v16;
    xpc_object_t v10 = (const char *)netrbClientErrorCode;
    uint64_t v11 = v8;
    goto LABEL_13;
  }

LABEL_14:
  uint64_t v13 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____NETRBClientResponseHandler_block_invoke;
  block[3] = &__block_descriptor_tmp_194;
  int v18 = a2;
  block[4] = a1;
  block[5] = a4;
  block[6] = v8;
  dispatch_async(v13, block);
}

uint64_t _NETRBClientStopService(uint64_t a1)
{
  uint64_t v5 = 0LL;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  char v8 = 0;
  if (!a1) {
    goto LABEL_6;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientStopService_block_invoke;
    block[3] = &unk_18A132AE0;
    block[4] = &v5;
    block[5] = a1;
    block[6] = __NETRBClientGetQueue___netrbQueue;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  }

  else
  {
LABEL_6:
    NETRBErrorLog();
  }

  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t _NETRBClientGetDynamicStoreKey(uint64_t a1, char *a2)
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  char v10 = 0;
  if (!a1 || !a2) {
    goto LABEL_8;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = ___NETRBClientGetDynamicStoreKey_block_invoke;
    v6[3] = &unk_18A132B08;
    v6[4] = &v7;
    v6[5] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v6);
    if (*((_BYTE *)v8 + 24)) {
      strcpy(a2, "com.apple.MobileInternetSharing");
    }
  }

  else
  {
LABEL_8:
    NETRBErrorLog();
  }

  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t _NETRBClientGetGlobalServiceState(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000LL;
  int v24 = 0;
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  int v20 = 0;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  char v16 = 0;
  uint64_t v9 = 0LL;
  char v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 2000LL;
  if (!a1 || !a2 || !a3) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1)
  {
    uint64_t v7 = a1;
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
    a1 = v7;
  }

  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientGetGlobalServiceState_block_invoke;
    block[3] = &unk_18A132B58;
    block[4] = &v13;
    block[5] = &v9;
    block[6] = &v21;
    void block[7] = &v17;
    block[8] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v14 + 24))
    {
      *((_BYTE *)v14 + 24) = v10[3] == 2001;
      *a2 = *((_DWORD *)v22 + 6);
      *a3 = *((_DWORD *)v18 + 6);
    }
  }

  else
  {
LABEL_9:
    NETRBErrorLog();
  }

  uint64_t v5 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v5;
}

uint64_t _NETRBClientSetGlobalServiceState(uint64_t a1, int a2)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  char v15 = 0;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  uint64_t v11 = 2000LL;
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientSetGlobalServiceState_block_invoke;
    block[3] = &unk_18A132BA8;
    int v7 = a2;
    block[4] = &v12;
    block[5] = &v8;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v13 + 24)) {
      *((_BYTE *)v13 + 24) = v9[3] == 2001;
    }
  }

  else
  {
LABEL_10:
    NETRBErrorLog();
  }

  uint64_t v4 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t _NETRBClientGetExtName(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  char v14 = 0;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  uint64_t v10 = 2000LL;
  if (!a1 || !a2) {
    goto LABEL_8;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = ___NETRBClientGetExtName_block_invoke;
    v6[3] = &unk_18A132BF8;
    v6[4] = &v11;
    v6[5] = &v7;
    void v6[6] = a1;
    v6[7] = a2;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v6);
    if (*((_BYTE *)v12 + 24)) {
      *((_BYTE *)v12 + 24) = v8[3] == 2001;
    }
  }

  else
  {
LABEL_8:
    NETRBErrorLog();
  }

  uint64_t v4 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

void *_NETRBClientCopyFixtureForwardedPorts(void *a1)
{
  v1 = a1;
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  __int16 v20 = 0;
  uint64_t v13 = 0LL;
  char v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  __int16 v16 = 0;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  char v12 = 0;
  uint64_t v5 = 0LL;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  uint64_t v8 = 2000LL;
  if (!a1)
  {
    NETRBErrorLog();
    goto LABEL_12;
  }

  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (!__NETRBClientGetQueue___netrbQueue)
  {
    NETRBErrorLog();
LABEL_11:
    v1 = 0LL;
    goto LABEL_12;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ___NETRBClientCopyFixtureForwardedPorts_block_invoke;
  block[3] = &unk_18A132C48;
  block[4] = &v9;
  block[5] = &v5;
  block[6] = &v17;
  void block[7] = &v13;
  block[8] = v1;
  dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  if (!*((_BYTE *)v10 + 24) || v6[3] != 2001) {
    goto LABEL_11;
  }
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  v1 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, (const char *)netrbClientForwardedLowPort, *((unsigned __int16 *)v18 + 12));
    xpc_dictionary_set_uint64(v1, (const char *)netrbClientForwardedHighPort, *((unsigned __int16 *)v14 + 12));
  }

  else
  {
    NETRBErrorLog();
    *((_BYTE *)v10 + 24) = 0;
  }

LABEL_12:
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v1;
}

uint64_t _NETRBClientSetFixtureForwardedPorts(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  char v14 = 0;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  uint64_t v10 = 2000LL;
  if (!a1 || !a2 || MEMORY[0x1895B5770](a2) != MEMORY[0x1895F9250]) {
    goto LABEL_4;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = ___NETRBClientSetFixtureForwardedPorts_block_invoke;
    v6[3] = &unk_18A132C98;
    void v6[6] = a1;
    v6[7] = a2;
    v6[4] = &v11;
    v6[5] = &v7;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v6);
    if (*((_BYTE *)v12 + 24)) {
      *((_BYTE *)v12 + 24) = v8[3] == 2001;
    }
  }

  else
  {
LABEL_4:
    NETRBErrorLog();
  }

  uint64_t v4 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t _NETRBClientIsAllowedMoreHost(uint64_t a1)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  char v12 = 0;
  uint64_t v5 = 0LL;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  uint64_t v8 = 2000LL;
  if (!a1) {
    goto LABEL_7;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientIsAllowedMoreHost_block_invoke;
    block[3] = &unk_18A132CE8;
    block[4] = &v9;
    block[5] = &v5;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v10 + 24)) {
      *((_BYTE *)v10 + 24) = v6[3] == 2001;
    }
  }

  else
  {
LABEL_7:
    NETRBErrorLog();
  }

  uint64_t v2 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

uint64_t _NETRBClientAddHost(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_dictionary_set_uint64(v4, (const char *)netrbClientHostIftype, a2);
    xpc_dictionary_set_uint64(v5, (const char *)netrbClientHostDeviceId, 0xFFFFFFFFuLL);
    uint64_t v6 = _NETRBClientAddHostExt(a1, v5);
    xpc_release(v5);
    return v6;
  }

  else
  {
    NETRBErrorLog();
    return 0LL;
  }

uint64_t _NETRBClientAddHostExt(uint64_t a1, void *a2)
{
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000LL;
  char v24 = 0;
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  uint64_t v20 = 2000LL;
  if (a2
    && MEMORY[0x1895B5770](a2) == MEMORY[0x1895F9250]
    && (xpc_object_t v6 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostIftype)) != 0LL
    && (uint64_t v7 = v6, v8 = MEMORY[0x1895B5770](), v9 = MEMORY[0x1895F92F0], v8 == MEMORY[0x1895F92F0])
    && (int v10 = xpc_uint64_get_value(v7),
        (xpc_object_t v11 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostDeviceId)) != 0LL)
    && (char v12 = v11, MEMORY[0x1895B5770]() == v9))
  {
    uint64_t value = xpc_uint64_get_value(v12);
    uint64_t v14 = value;
    if (__NETRBClientGetQueue_predQueue != -1) {
      dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
    }
    if (__NETRBClientGetQueue___netrbQueue)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = ___NETRBClientAddHostExt_block_invoke;
      block[3] = &unk_18A132D38;
      int v16 = v10;
      block[6] = a1;
      void block[7] = v14;
      block[4] = &v21;
      block[5] = &v17;
      dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
      if (*((_BYTE *)v22 + 24)) {
        *((_BYTE *)v22 + 24) = v18[3] == 2001;
      }
    }

    else
    {
LABEL_20:
      NETRBErrorLog();
    }
  }

  else
  {
    NETRBErrorLog();
    *((_BYTE *)v22 + 24) = 0;
  }

  uint64_t v4 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v4;
}

uint64_t _NETRBClientRemoveHostExt(uint64_t a1, void *a2)
{
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000LL;
  char v24 = 0;
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  uint64_t v20 = 2000LL;
  if (a2
    && MEMORY[0x1895B5770](a2) == MEMORY[0x1895F9250]
    && (xpc_object_t v6 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostIftype)) != 0LL
    && (uint64_t v7 = v6, v8 = MEMORY[0x1895B5770](), v9 = MEMORY[0x1895F92F0], v8 == MEMORY[0x1895F92F0])
    && (int v10 = xpc_uint64_get_value(v7),
        (xpc_object_t v11 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostDeviceId)) != 0LL)
    && (char v12 = v11, MEMORY[0x1895B5770]() == v9))
  {
    uint64_t value = xpc_uint64_get_value(v12);
    uint64_t v14 = value;
    if (__NETRBClientGetQueue_predQueue != -1) {
      dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
    }
    if (__NETRBClientGetQueue___netrbQueue)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = ___NETRBClientRemoveHostExt_block_invoke;
      block[3] = &unk_18A132D88;
      int v16 = v10;
      block[6] = a1;
      void block[7] = v14;
      block[4] = &v21;
      block[5] = &v17;
      dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
      if (*((_BYTE *)v22 + 24)) {
        *((_BYTE *)v22 + 24) = v18[3] == 2001;
      }
    }

    else
    {
LABEL_20:
      NETRBErrorLog();
    }
  }

  else
  {
    NETRBErrorLog();
    *((_BYTE *)v22 + 24) = 0;
  }

  uint64_t v4 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v4;
}

uint64_t _NETRBClientRemoveHost(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_dictionary_set_uint64(v4, (const char *)netrbClientHostIftype, a2);
    xpc_dictionary_set_uint64(v5, (const char *)netrbClientHostDeviceId, 0xFFFFFFFFuLL);
    uint64_t v6 = _NETRBClientRemoveHostExt(a1, v5);
    xpc_release(v5);
    return v6;
  }

  else
  {
    NETRBErrorLog();
    return 0LL;
  }

uint64_t _NETRBClientGetHostCount(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000LL;
  int v24 = 0;
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  int v20 = 0;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  char v16 = 0;
  uint64_t v9 = 0LL;
  int v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 2000LL;
  if (!a1 || !a2 || !a3) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1)
  {
    uint64_t v7 = a1;
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
    a1 = v7;
  }

  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientGetHostCount_block_invoke;
    block[3] = &unk_18A132DD8;
    block[4] = &v13;
    block[5] = &v9;
    block[6] = &v21;
    void block[7] = &v17;
    void block[8] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v14 + 24))
    {
      *((_BYTE *)v14 + 24) = v10[3] == 2001;
      *a2 = *((_DWORD *)v22 + 6);
      *a3 = *((_DWORD *)v18 + 6);
    }
  }

  else
  {
LABEL_9:
    NETRBErrorLog();
  }

  uint64_t v5 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v5;
}

uint64_t _NETRBClientSetHostCount(uint64_t a1, int a2, int a3)
{
  uint64_t v15 = 0LL;
  char v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  char v18 = 0;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  uint64_t v14 = 2000LL;
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientSetHostCount_block_invoke;
    block[3] = &unk_18A132E28;
    int v9 = a2;
    int v10 = a3;
    block[4] = &v15;
    block[5] = &v11;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v16 + 24)) {
      *((_BYTE *)v16 + 24) = v12[3] == 2001;
    }
  }

  else
  {
LABEL_10:
    NETRBErrorLog();
  }

  uint64_t v6 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

uint64_t _NETRBClientNewInterface(uint64_t a1, int a2, uint64_t a3, xpc_object_t xdict)
{
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x2000000000LL;
  char v51 = 0;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x2000000000LL;
  uint64_t v47 = 0LL;
  if (!a1) {
    goto LABEL_40;
  }
  if (xdict) {
    string = xpc_dictionary_get_string(xdict, (const char *)netrbClientExternalInterface);
  }
  else {
    string = 0LL;
  }
  if ((a2 - 201) >= 3)
  {
    if (a2 != 204 || !string || !*string) {
      goto LABEL_40;
    }
  }

  else
  {
    if (string) {
      goto LABEL_40;
    }
    if (xdict)
    {
      int uint64 = xpc_dictionary_get_uint64(xdict, (const char *)netrbClientInterfaceMTU);
      goto LABEL_17;
    }
  }

  int uint64 = 0;
LABEL_17:
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  int v10 = (dispatch_queue_s *)__NETRBClientGetQueue___netrbQueue;
  if (!__NETRBClientGetQueue___netrbQueue) {
    goto LABEL_40;
  }
  v45[3] = (uint64_t)xpc_dictionary_create(0LL, 0LL, 0LL);
  if (xdict)
  {
    else {
      BOOL v33 = 1;
    }
    else {
      BOOL v32 = 0;
    }
    else {
      BOOL v31 = 0;
    }
    uint64_t v35 = v10;
    else {
      BOOL v30 = 0;
    }
    BOOL v34 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientEnableMACNAT);
    char v16 = (void *)v45[3];
    uint64_t v17 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceStartAddress);
    char v18 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceEndAddress);
    uint64_t v19 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceNetworkMask);
    if (v17 && v18 && (int v20 = v19) != 0LL)
    {
      xpc_dictionary_set_string(v16, netrbXPCStartAddress, v17);
      xpc_dictionary_set_string(v16, netrbXPCEndAddress, v18);
      xpc_dictionary_set_string(v16, netrbXPCNetworkMask, v20);
    }

    else if ((unint64_t)v17 | (unint64_t)v18)
    {
      goto LABEL_40;
    }

    int v24 = (void *)v45[3];
    uuid = xpc_dictionary_get_uuid(xdict, (const char *)netrbClientNetworkIdentifier);
    if (!uuid) {
      goto LABEL_52;
    }
    xpc_dictionary_set_uuid(v24, netrbXPCNetworkIdentifier, uuid);
    v26 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceIPv4Address);
    v27 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceNetworkMask);
    uint64_t v28 = v27;
    if (v26 && v27)
    {
      xpc_dictionary_set_string(v24, netrbXPCInterfaceIPv4Address, v26);
      xpc_dictionary_set_string(v24, netrbXPCNetworkMask, v28);
      goto LABEL_50;
    }

    if (!((unint64_t)v26 | (unint64_t)v27))
    {
LABEL_50:
      xpc_object_t v29 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceIPv6Address);
      if (v29) {
        xpc_dictionary_set_string(v24, netrbXPCInterfaceIPv6Address, v29);
      }
LABEL_52:
      int v10 = v35;
      BOOL v13 = v32;
      char v15 = v33;
      BOOL v11 = v30;
      BOOL v12 = v31;
      BOOL v14 = v34;
      goto LABEL_53;
    }

LABEL_40:
    NETRBErrorLog();
    goto LABEL_41;
  }

  BOOL v11 = 0;
  BOOL v12 = 0;
  BOOL v13 = 0;
  BOOL v14 = 0;
  char v15 = 1;
LABEL_53:
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ___NETRBClientNewInterface_block_invoke;
  block[3] = &unk_18A132E70;
  char v39 = v15;
  block[6] = a1;
  void block[7] = a3;
  BOOL v40 = v13;
  BOOL v41 = v14;
  BOOL v42 = v12;
  BOOL v43 = v11;
  int v37 = a2;
  int v38 = uint64;
  block[4] = &v44;
  block[5] = &v48;
  void block[8] = string;
  void block[9] = v10;
  dispatch_sync(v10, block);
LABEL_41:
  uint64_t v21 = (void *)v45[3];
  if (v21) {
    xpc_release(v21);
  }
  uint64_t v22 = *((unsigned __int8 *)v49 + 24);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v22;
}

uint64_t _NETRBClientAddIPPortForwardingRule( CFTypeRef cf, char a2, __int16 a3, int a4, uint64_t a5, __int16 a6, uint64_t a7)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2000000000LL;
  char v25 = 0;
  if (!cf) {
    goto LABEL_9;
  }
  char v10 = a4;
  if (a4 != 2 && a4 != 30) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  BOOL v14 = (dispatch_queue_s *)__NETRBClientGetQueue___netrbQueue;
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientAddIPPortForwardingRule_block_invoke;
    block[3] = &unk_18A132EE8;
    char v20 = a2;
    __int16 v18 = a3;
    char v21 = v10;
    block[6] = cf;
    void block[7] = a5;
    __int16 v19 = a6;
    block[4] = a7;
    block[5] = &v22;
    void block[8] = __NETRBClientGetQueue___netrbQueue;
    CFRetain(cf);
    dispatch_sync(v14, block);
    if (!*((_BYTE *)v23 + 24)) {
      CFRelease(cf);
    }
  }

  else
  {
LABEL_9:
    NETRBErrorLog();
  }

  uint64_t v15 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v15;
}

void *netrbMakePortForwardingRuleDict( unsigned int a1, unsigned int a2, unsigned int a3, void *a4, unsigned int a5)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a3 != 30 && a3 != 2 || !a4 && a5 || a4 && !a5 || a4 && !inet_ntop(a3, a4, string, 0x2Eu)) {
    return 0LL;
  }
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  char v10 = v12;
  if (a1) {
    xpc_dictionary_set_uint64(v12, netrbXPCPortForwardingRuleProtocol, a1);
  }
  if (a2) {
    xpc_dictionary_set_uint64(v10, netrbXPCPortForwardingRuleExternalPort, a2);
  }
  xpc_dictionary_set_uint64(v10, netrbXPCPortForwardingRuleAddressFamily, a3);
  if (a5) {
    xpc_dictionary_set_uint64(v10, netrbXPCPortForwardingRuleInternalPort, a5);
  }
  if (a4) {
    xpc_dictionary_set_string(v10, netrbXPCPortForwardingRuleInternalAddress, string);
  }
  return v10;
}

uint64_t _NETRBClientRemoveIPPortForwardingRule(CFTypeRef cf, char a2, __int16 a3, int a4, uint64_t a5)
{
  uint64_t v17 = 0LL;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  char v20 = 0;
  if (!cf) {
    goto LABEL_9;
  }
  char v6 = a4;
  if (a4 != 2 && a4 != 30) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  char v10 = (dispatch_queue_s *)__NETRBClientGetQueue___netrbQueue;
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientRemoveIPPortForwardingRule_block_invoke;
    block[3] = &unk_18A132F60;
    char v15 = a2;
    __int16 v14 = a3;
    char v16 = v6;
    block[4] = a5;
    block[5] = &v17;
    block[6] = cf;
    void block[7] = __NETRBClientGetQueue___netrbQueue;
    CFRetain(cf);
    dispatch_sync(v10, block);
    if (!*((_BYTE *)v18 + 24)) {
      CFRelease(cf);
    }
  }

  else
  {
LABEL_9:
    NETRBErrorLog();
  }

  uint64_t v11 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t _NETRBClientGetIPPortForwardingRules(CFTypeRef cf, int a2, uint64_t a3)
{
  uint64_t v11 = 0LL;
  xpc_object_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  char v14 = 0;
  if (!cf) {
    goto LABEL_9;
  }
  char v4 = a2;
  if (a2 != 2 && a2 != 30) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  char v6 = (dispatch_queue_s *)__NETRBClientGetQueue___netrbQueue;
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___NETRBClientGetIPPortForwardingRules_block_invoke;
    block[3] = &unk_18A132FD8;
    char v10 = v4;
    block[4] = a3;
    block[5] = &v11;
    block[6] = cf;
    void block[7] = __NETRBClientGetQueue___netrbQueue;
    CFRetain(cf);
    dispatch_sync(v6, block);
    if (!*((_BYTE *)v12 + 24)) {
      CFRelease(cf);
    }
  }

  else
  {
LABEL_9:
    NETRBErrorLog();
  }

  uint64_t v7 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

const char *_NETRBIPPortForwardingDictGetDetails( xpc_object_t xdict, _BYTE *a2, _WORD *a3, int a4, void *a5, _WORD *a6)
{
  if (!xdict || a4 != 2 && a4 != 30) {
    goto LABEL_10;
  }
  char uint64 = xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleProtocol);
  *a2 = uint64;
  __int16 v13 = xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleExternalPort);
  *a3 = v13;
  if (!v13) {
    return 0LL;
  }
  __int16 v14 = xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleInternalPort);
  *a6 = v14;
  if (!v14) {
    return 0LL;
  }
  if (xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleAddressFamily) != a4)
  {
LABEL_10:
    NETRBErrorLog();
    return 0LL;
  }

  BOOL result = xpc_dictionary_get_string(xdict, netrbXPCPortForwardingRuleInternalAddress);
  if (result) {
    return (const char *)(inet_pton(a4, result, a5) != 0);
  }
  return result;
}

uint64_t NETRBClientSendNotification(void *a1)
{
  if (__netrbClientList
    && (CFIndex Count = CFArrayGetCount((CFArrayRef)__netrbClientList)) != 0
    && (v3 = Count, (xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL)) != 0LL))
  {
    uint64_t v5 = v4;
    char v6 = (const char *)netrbClientNotificationKey;
    uint64_t uint64 = xpc_dictionary_get_uint64(a1, netrbXPCNotification);
    xpc_dictionary_set_uint64(v5, v6, uint64);
    if (v3 >= 1)
    {
      CFIndex v8 = 0LL;
      uint64_t v9 = MEMORY[0x1895F87A8];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)__netrbClientList, v8);
        if (ValueAtIndex)
        {
          uint64_t v11 = ValueAtIndex;
          if (ValueAtIndex[2])
          {
            if (ValueAtIndex[3])
            {
              xpc_retain(v5);
              CFRetain(v11);
              xpc_object_t v12 = (dispatch_queue_s *)v11[2];
              v14[0] = v9;
              v14[1] = 0x40000000LL;
              v14[2] = __NETRBClientSendNotification_block_invoke;
              v14[3] = &__block_descriptor_tmp_169;
              v14[4] = v11;
              v14[5] = v5;
              dispatch_async(v12, v14);
            }
          }
        }

        ++v8;
      }

      while (v3 != v8);
    }

    xpc_release(v5);
    return 1LL;
  }

  else
  {
    NETRBErrorLog();
    return 0LL;
  }

void __NETRBClientSendNotification_block_invoke(uint64_t a1)
{
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x2000000000LL;
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __NETRBClientSendNotification_block_invoke_2;
  block[3] = &unk_18A133000;
  block[4] = v4;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  xpc_release(*(xpc_object_t *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  _Block_object_dispose(v4, 8);
}

uint64_t __NETRBClientSendNotification_block_invoke_2(uint64_t a1)
{
  uint64_t result = __NETRBClientValidateClient(*(_BYTE **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 24LL) + 16LL))();
  }
  return result;
}

uint64_t _NETRBClientAddLowLatencyFlow(uint64_t a1, void *a2)
{
  return _NETRBClientModifyLowLatencyFlow(a1, a2, 0);
}

uint64_t _NETRBClientModifyLowLatencyFlow(uint64_t a1, void *a2, char a3)
{
  uint64_t v11 = 0LL;
  xpc_object_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  char v14 = 0;
  char inited = netrbInitIfnetTrafficDescriptor(a2, 0LL);
  *((_BYTE *)v12 + 24) = inited;
  if ((inited & 1) == 0) {
    goto LABEL_6;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = ___NETRBClientModifyLowLatencyFlow_block_invoke;
    v9[3] = &unk_18A1331D8;
    v9[4] = &v11;
    v9[5] = a1;
    v9[6] = a2;
    char v10 = a3;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v9);
  }

  else
  {
LABEL_6:
    NETRBErrorLog();
  }

  uint64_t v7 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t _NETRBClientRemoveLowLatencyFlow(uint64_t a1, void *a2)
{
  return _NETRBClientModifyLowLatencyFlow(a1, a2, 1);
}

uint64_t __NETRBClientRelease(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    _Block_release(v2);
    *(void *)(a1 + 24) = 0LL;
  }

  __int128 v3 = *(dispatch_object_s **)(a1 + 16);
  if (v3)
  {
    dispatch_release(v3);
    *(void *)(a1 + 16) = 0LL;
  }

  return NETRBInfoLog();
}

void notification_insert_keys(void *a1, xpc_object_t xdict)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  string = xpc_dictionary_get_string(xdict, netrbXPCMACAddress);
  if (string) {
    xpc_dictionary_set_string(a1, (const char *)netrbClientMACAddress, string);
  }
  uuid = xpc_dictionary_get_uuid(xdict, netrbXPCMACUUID);
  if (uuid)
  {
    *(_OWORD *)char v15 = *(_OWORD *)uuid;
    xpc_dictionary_set_uuid(a1, (const char *)netrbClientMACUUID, v15);
  }

  int v6 = xpc_dictionary_dup_fd(xdict, netrbXPCInterfaceSocket);
  if (v6 != -1) {
    xpc_dictionary_set_uint64(a1, (const char *)netrbClientSocketFD, v6);
  }
  uint64_t v7 = xpc_dictionary_get_string(xdict, netrbXPCStartAddress);
  CFIndex v8 = xpc_dictionary_get_string(xdict, netrbXPCEndAddress);
  uint64_t v9 = xpc_dictionary_get_string(xdict, netrbXPCNetworkMask);
  if (v7) {
    BOOL v10 = v8 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v9 != 0LL)
  {
    xpc_object_t v12 = v9;
    xpc_dictionary_set_string(a1, (const char *)netrbClientInterfaceStartAddress, v7);
    xpc_dictionary_set_string(a1, (const char *)netrbClientInterfaceEndAddress, v8);
    xpc_dictionary_set_string(a1, (const char *)netrbClientInterfaceNetworkMask, v12);
  }

  xpc_object_t value = xpc_dictionary_get_value(xdict, netrbXPCInterfaceMTU);
  if (value) {
    xpc_dictionary_set_value(a1, (const char *)netrbClientInterfaceMTU, value);
  }
  xpc_object_t v14 = xpc_dictionary_get_value(xdict, netrbXPCNat66Param);
  if (v14) {
    xpc_dictionary_set_value(a1, (const char *)netrbClientNat66Param, v14);
  }
}

void __NETRBLogCreate_block_invoke_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_187D43000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "Couldn't create os log object", v0, 2u);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
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

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1895FB7D8](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FB838](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1895FB840](*(void *)&a1, a2, a3);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x1895FC480]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1895FD948](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBB8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1895FDC58](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}