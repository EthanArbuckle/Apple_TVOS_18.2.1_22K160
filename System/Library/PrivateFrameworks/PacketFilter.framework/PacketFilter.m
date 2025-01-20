void *PFUserCreate(char *a1, char *a2, dispatch_object_s *a3)
{
  void *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  CFAllocatorRef v12;
  uint64_t Instance;
  CFMutableDictionaryRef v14;
  dispatch_queue_s *Queue;
  void block[9];
  CFDictionaryValueCallBacks valueCallBacks;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  v18 = 0LL;
  v19 = &v18;
  v20 = 0x2000000000LL;
  v21 = 0;
  v6 = 0LL;
  if (!a1 || !a2 || !a3)
  {
    PFManagerErrorLog();
LABEL_15:
    v6 = 0LL;
    goto LABEL_16;
  }

  v7 = kPFInternetSharing;
  v8 = kPFAirDrop;
  v9 = kPFServerFirewall;
  v10 = kPFThreadBR;
  if (kPFInternetSharing != a1
    && kPFNLC != a1
    && kPFVPN != a1
    && kPFFTPProxy != a1
    && kPFAirDrop != a1
    && kPFApplicationFirewall != a1
    && kPFServerFirewall != a1
    && kPFThreadBR != a1
    || (*((_BYTE *)v19 + 24) = 1, kPFBase != a2)
    && (v7 != a1 || kPFPortMapping != a2)
    && (v7 != a1 || kPFBase_v4 != a2)
    && (v7 != a1 || kPFBase_v6 != a2)
    && (v7 != a1 || kPFBase_nat64 != a2)
    && (v7 != a1 || kPFBase_nat66 != a2)
    && (v7 != a1 || kPFShared_v4 != a2)
    && (v7 != a1 || kPFShared_v6 != a2)
    && (v7 != a1 || kPFHost_v4 != a2)
    && (v7 != a1 || kPFHost_v6 != a2)
    && (v8 != a1 || kPFMDNS != a2)
    && (v9 != a1 || kPFDefaultFirewall != a2)
    && (v9 != a1 || kPFAdaptiveFirewall != a2)
    && (v9 != a1 || kPFCustomFirewall != a2)
    && (v10 != a1 || kPFThreadBR_nat64 != a2))
  {
    PFManagerErrorLog();
    v6 = 0LL;
    *((_BYTE *)v19 + 24) = 0;
    goto LABEL_16;
  }

  v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (!__pfUserTypeID) {
    pthread_once(&__pfUserTypeInit, (void (*)(void))__PFUserRegister);
  }
  Instance = _CFRuntimeCreateInstance();
  v6 = (void *)Instance;
  if (!Instance)
  {
    PFManagerErrorLog();
    goto LABEL_16;
  }

  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(void *)(Instance + 24) = a1;
  *(void *)(Instance + 32) = a2;
  *(void *)(Instance + 40) = a3;
  dispatch_retain(a3);
  *(_OWORD *)&valueCallBacks.version = xmmword_18A29B1E8;
  *(_OWORD *)&valueCallBacks.release = *(_OWORD *)&off_18A29B1F8;
  valueCallBacks.equal = 0LL;
  v14 = CFDictionaryCreateMutable(v12, 0LL, MEMORY[0x189605240], &valueCallBacks);
  v6[6] = v14;
  if (!v14 || (Queue = (dispatch_queue_s *)PFManagerGetQueue()) == 0LL)
  {
    PFManagerErrorLog();
    CFRelease(v6);
    goto LABEL_15;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __PFUserCreate_block_invoke;
  block[3] = &unk_18A29B218;
  block[4] = &v18;
  block[5] = v6;
  block[6] = a1;
  block[7] = a2;
  block[8] = Queue;
  dispatch_sync(Queue, block);
  if (!*((_BYTE *)v19 + 24)) {
    v6 = 0LL;
  }
LABEL_16:
  _Block_object_dispose(&v18, 8);
  return v6;
}

void __PFUserRuleDictionaryRelease(int a1, xpc_object_t object)
{
}

void __PFUserCreate_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 40) + 16LL) = PFManagerCreate();
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = v2[2];
  if (v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = PFManagerAddUser(v3, v2);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      PFManagerDebugLog();
      return;
    }

    PFManagerErrorLog();
    v4 = *(const void **)(a1 + 40);
  }

  else
  {
    PFManagerErrorLog();
    v4 = *(const void **)(a1 + 40);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

  CFRelease(v4);
}

uint64_t PFUserBeginRules(uint64_t a1)
{
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2000000000LL;
  char v14 = 0;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = -1LL;
  if (a1
    && (uint64_t Queue = PFManagerGetQueue()) != 0
    && (uint64_t v3 = (dispatch_queue_s *)Queue, (v4 = xpc_array_create(0LL, 0LL)) != 0LL))
  {
    v5 = v4;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __PFUserBeginRules_block_invoke;
    v8[3] = &unk_18A29B240;
    v8[6] = a1;
    v8[7] = v4;
    v8[4] = v13;
    v8[5] = &v9;
    dispatch_sync(v3, v8);
    xpc_release(v5);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
  return v6;
}

void __PFUserBeginRules_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    CFStringRef v2 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%lld", __pfDictIdentifier);
    if (v2)
    {
      CFStringRef v3 = v2;
      xpc_retain(*(xpc_object_t *)(a1 + 56));
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 48) + 48LL), v3, *(const void **)(a1 + 56));
      uint64_t v4 = __pfDictIdentifier;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = __pfDictIdentifier;
      __pfDictIdentifier = v4 + 1;
      CFRelease(v3);
    }
  }

  else
  {
    PFManagerErrorLog();
  }
}

uint64_t PFUserAddRule(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  char v17 = 0;
  if (a1
    && a3
    && MEMORY[0x1895CD824](a3) == MEMORY[0x1895F9250]
    && (a2 & 0x8000000000000000LL) == 0
    && (uint64_t Queue = PFManagerGetQueue()) != 0
    && (uint64_t v9 = (dispatch_queue_s *)Queue, (v10 = xpc_dictionary_create(0LL, 0LL, 0LL)) != 0LL))
  {
    uint64_t v11 = v10;
    char v12 = PFCheckRule(a3, v10);
    *((_BYTE *)v15 + 24) = v12;
    if ((v12 & 1) != 0)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __PFUserAddRule_block_invoke;
      block[3] = &unk_18A29B268;
      block[4] = &v14;
      block[5] = a1;
      block[6] = a2;
      block[7] = v11;
      dispatch_sync(v9, block);
    }

    else
    {
      PFManagerErrorLog();
    }

    xpc_release(v11);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v6 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v6;
}

void __PFUserAddRule_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 40));
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    TransArray = (void *)__PFUserGetTransArray(*(void *)(a1 + 40), *(void *)(a1 + 48));
    if (TransArray)
    {
      xpc_array_append_value(TransArray, *(xpc_object_t *)(a1 + 56));
    }

    else
    {
      PFManagerErrorLog();
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    }
  }

  else
  {
    PFManagerErrorLog();
  }

const void *__PFUserGetTransArray(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%lld", a2);
  if (v3)
  {
    CFStringRef v4 = v3;
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), v3);
    CFRelease(v4);
    return Value;
  }

  else
  {
    PFManagerErrorLog();
    return 0LL;
  }

uint64_t PFUserCommitRules(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  char v14 = 0;
  if (a1 && (a2 & 0x8000000000000000LL) == 0 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __PFUserCommitRules_block_invoke;
    block[3] = &unk_18A29B2B8;
    block[6] = a1;
    block[7] = a2;
    block[4] = a4;
    block[5] = &v11;
    dispatch_sync(Queue, block);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __PFUserCommitRules_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return PFManagerErrorLog();
  }
  TransArray = (void *)__PFUserGetTransArray(*(void *)(a1 + 48), *(void *)(a1 + 56));
  if (TransArray)
  {
    CFStringRef v3 = TransArray;
    PFManagerInfoLog();
    uint64_t v4 = *(void *)(a1 + 48);
    v5 = *(const char **)(v4 + 24);
    uint64_t v6 = *(const char **)(v4 + 32);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 0x40000000LL;
      v11[2] = __PFUserCommitRules_block_invoke_2;
      v11[3] = &unk_18A29B290;
      v11[4] = v7;
      v11[5] = v4;
      uint64_t v8 = v11;
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerSendMessage( v3,  v5,  v6,  0x3EBu,  0xFFFFFFFFuLL,  (uint64_t)v8);
    if (!*(void *)(a1 + 32) && *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      xpc_object_t v10 = (void *)PFXPCGetResponse();
      xpc_release(v10);
    }

    uint64_t result = __PFUserRemoveTransArray(*(void *)(a1 + 48), *(void *)(a1 + 56));
    if (*(void *)(a1 + 32))
    {
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
        return (uint64_t)CFRetain(*(CFTypeRef *)(a1 + 48));
      }
    }
  }

  else
  {
    uint64_t result = PFManagerErrorLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return result;
}

void __PFUserCommitRules_block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  CFStringRef v3 = *(void **)(a1 + 40);
  PFManagerInfoLog();
  v5 = (dispatch_queue_s *)v3[5];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____PFUserXPCCommitRulesResponseHandler_block_invoke;
  block[3] = &unk_18A29B6A0;
  block[4] = v4;
  char v7 = a2;
  dispatch_async(v5, block);
  CFRelease(v3);
}

BOOL __PFUserRemoveTransArray(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%lld", a2);
  if (v3)
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 48), v3);
    CFRelease(v3);
  }

  else
  {
    PFManagerErrorLog();
  }

  return v3 != 0LL;
}

uint64_t PFUserClearRules(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  char v11 = 0;
  if (a1 && (a2 & 0x8000000000000000LL) == 0 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __PFUserClearRules_block_invoke;
    block[3] = &unk_18A29B2E0;
    block[4] = &v8;
    void block[5] = a1;
    block[6] = a2;
    dispatch_sync(Queue, block);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __PFUserClearRules_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 40));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    return PFManagerErrorLog();
  }
  if (__PFUserGetTransArray(*(void *)(a1 + 40), *(void *)(a1 + 48)))
  {
    uint64_t result = __PFUserRemoveTransArray(*(void *)(a1 + 40), *(void *)(a1 + 48));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  else
  {
    uint64_t result = PFManagerErrorLog();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

  return result;
}

uint64_t PFUserDeleteRules(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  char v12 = 0;
  if (a1 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __PFUserDeleteRules_block_invoke;
    block[3] = &unk_18A29B330;
    void block[5] = &v9;
    block[6] = a1;
    block[4] = a3;
    dispatch_sync(Queue, block);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __PFUserDeleteRules_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    PFManagerErrorLog();
    return;
  }

  PFManagerInfoLog();
  uint64_t v2 = *(void *)(a1 + 48);
  CFStringRef v3 = *(const char **)(v2 + 24);
  uint64_t v4 = *(const char **)(v2 + 32);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = __PFUserDeleteRules_block_invoke_2;
    v9[3] = &unk_18A29B308;
    v9[4] = v5;
    v9[5] = v2;
    uint64_t v6 = v9;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerSendMessage( 0LL,  v3,  v4,  0x3ECu,  0xFFFFFFFFuLL,  (uint64_t)v6);
  uint64_t v7 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    goto LABEL_10;
  }
  if (*(_BYTE *)(*(void *)(v7 + 8) + 24LL))
  {
    uint64_t v8 = (void *)PFXPCGetResponse();
    xpc_release(v8);
    if (*(void *)(a1 + 32))
    {
      uint64_t v7 = *(void *)(a1 + 40);
LABEL_10:
      if (*(_BYTE *)(*(void *)(v7 + 8) + 24LL)) {
        CFRetain(*(CFTypeRef *)(a1 + 48));
      }
    }
  }

void __PFUserDeleteRules_block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  CFStringRef v3 = *(void **)(a1 + 40);
  PFManagerInfoLog();
  uint64_t v5 = (dispatch_queue_s *)v3[5];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____PFUserXPCDeleteRulesResponseHandler_block_invoke;
  block[3] = &unk_18A29B6C8;
  block[4] = v4;
  char v7 = a2;
  dispatch_async(v5, block);
  CFRelease(v3);
}

uint64_t PFUserRelease(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  char v11 = 0;
  if (a1 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __PFUserRelease_block_invoke;
    block[3] = &unk_18A29B358;
    void block[5] = &v8;
    block[6] = a1;
    block[4] = a2;
    dispatch_sync(Queue, block);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __PFUserRelease_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    uint64_t v2 = *(const void **)(a1 + 32);
    if (v2)
    {
      CFStringRef v3 = _Block_copy(v2);
      uint64_t v4 = *(uint64_t **)(a1 + 48);
      v4[7] = (uint64_t)v3;
    }

    else
    {
      uint64_t v4 = *(uint64_t **)(a1 + 48);
    }

    char v5 = PFManagerReleaseUser(v4[2], v4);
    uint64_t v6 = *(const void **)(a1 + 48);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
    CFRelease(v6);
  }

  else
  {
    PFManagerErrorLog();
  }

uint64_t PFUserInsertRule(uint64_t a1, void *a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  char v20 = 0;
  if (a1
    && a2
    && MEMORY[0x1895CD824](a2) == MEMORY[0x1895F9250]
    && a5
    && (xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL)) != 0LL)
  {
    char v12 = v11;
    char v13 = PFCheckRule(a2, v11);
    *((_BYTE *)v18 + 24) = v13;
    if ((v13 & 1) != 0 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __PFUserInsertRule_block_invoke;
      block[3] = &unk_18A29B3A8;
      block[6] = a1;
      void block[7] = v12;
      __int16 v16 = a3;
      block[4] = a5;
      void block[5] = &v17;
      dispatch_sync(Queue, block);
    }

    else
    {
      PFManagerErrorLog();
    }

    xpc_release(v12);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v9 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v9;
}

CFTypeRef __PFUserInsertRule_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return (CFTypeRef)PFManagerErrorLog();
  }
  PFManagerInfoLog();
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v2 = *(void **)(a1 + 56);
  uint64_t v4 = *(const char **)(v3 + 24);
  char v5 = *(const char **)(v3 + 32);
  uint64_t v6 = *(unsigned __int16 *)(a1 + 64);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 0x40000000LL;
  v8[2] = __PFUserInsertRule_block_invoke_2;
  v8[3] = &unk_18A29B380;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = v3;
  CFTypeRef result = (CFTypeRef)PFManagerSendMessage(v2, v4, v5, 0x3E9u, v6, (uint64_t)v8);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return CFRetain(*(CFTypeRef *)(a1 + 48));
  }
  return result;
}

void __PFUserInsertRule_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  char v5 = *(void **)(a1 + 40);
  PFManagerInfoLog();
  if (a3) {
    xpc_retain(a3);
  }
  char v7 = (dispatch_queue_s *)v5[5];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____PFUserXPCInsertRuleResponseHandler_block_invoke;
  block[3] = &unk_18A29B6F0;
  char v9 = a2;
  block[4] = v6;
  void block[5] = a3;
  dispatch_async(v7, block);
  CFRelease(v5);
}

uint64_t PFUserInsertRule_S(uint64_t a1, void *a2, __int16 a3)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 0;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  if (a1 && a2 && MEMORY[0x1895CD824](a2) == MEMORY[0x1895F9250] && (xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL)) != 0LL)
  {
    char v9 = v8;
    char v10 = PFCheckRule(a2, v8);
    *((_BYTE *)v19 + 24) = v10;
    if ((v10 & 1) != 0 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __PFUserInsertRule_S_block_invoke;
      block[3] = &unk_18A29B3D0;
      void block[6] = a1;
      void block[7] = v9;
      __int16 v13 = a3;
      block[4] = &v18;
      void block[5] = &v14;
      dispatch_sync(Queue, block);
    }

    else
    {
      PFManagerErrorLog();
    }

    xpc_release(v9);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v6 = v15[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v6;
}

uint64_t PFUserDeleteRule(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  xpc_object_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  char v13 = 0;
  if (a1 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = __PFUserDeleteRule_block_invoke;
    v9[3] = &unk_18A29B420;
    void v9[6] = a1;
    v9[7] = a2;
    v9[4] = a3;
    v9[5] = &v10;
    dispatch_sync(Queue, v9);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v7 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __PFUserDeleteRule_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    PFManagerErrorLog();
    return;
  }

  PFManagerInfoLog();
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v4 = *(const char **)(v3 + 24);
  char v5 = *(const char **)(v3 + 32);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __PFUserDeleteRule_block_invoke_2;
    v10[3] = &unk_18A29B3F8;
    v10[4] = v6;
    v10[5] = v3;
    uint64_t v7 = v10;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerSendMessage( 0LL,  v4,  v5,  0x3EAu,  v2,  (uint64_t)v7);
  uint64_t v8 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    goto LABEL_10;
  }
  if (*(_BYTE *)(*(void *)(v8 + 8) + 24LL))
  {
    char v9 = (void *)PFXPCGetResponse();
    xpc_release(v9);
    if (*(void *)(a1 + 32))
    {
      uint64_t v8 = *(void *)(a1 + 40);
LABEL_10:
      if (*(_BYTE *)(*(void *)(v8 + 8) + 24LL)) {
        CFRetain(*(CFTypeRef *)(a1 + 48));
      }
    }
  }

void __PFUserDeleteRule_block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  PFManagerInfoLog();
  char v5 = (dispatch_queue_s *)v3[5];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____PFUserXPCDeleteRuleResponseHandler_block_invoke;
  block[3] = &unk_18A29B718;
  block[4] = v4;
  char v7 = a2;
  dispatch_async(v5, block);
  CFRelease(v3);
}

uint64_t PFUserGetRules(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0LL;
  char v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  char v11 = 0;
  if (a1 && a2 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __PFUserGetRules_block_invoke;
    block[3] = &unk_18A29B470;
    void block[5] = &v8;
    void block[6] = a1;
    block[4] = a2;
    dispatch_sync(Queue, block);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

CFTypeRef __PFUserGetRules_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return (CFTypeRef)PFManagerErrorLog();
  }
  PFManagerInfoLog();
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(const char **)(v2 + 24);
  uint64_t v4 = *(const char **)(v2 + 32);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 0x40000000LL;
  v6[2] = __PFUserGetRules_block_invoke_2;
  v6[3] = &unk_18A29B448;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v2;
  CFTypeRef result = (CFTypeRef)PFManagerSendMessage(0LL, v3, v4, 0x3EDu, 0xFFFFFFFFuLL, (uint64_t)v6);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return CFRetain(*(CFTypeRef *)(a1 + 48));
  }
  return result;
}

void __PFUserGetRules_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  PFManagerInfoLog();
  if (a3) {
    xpc_retain(a3);
  }
  char v7 = (dispatch_queue_s *)v5[5];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____PFUserXPCGetRulesResponseHandler_block_invoke;
  block[3] = &unk_18A29B740;
  char v9 = a2;
  block[4] = v6;
  void block[5] = a3;
  dispatch_async(v7, block);
  CFRelease(v5);
}

uint64_t PFUserCopyRules_S(uint64_t a1)
{
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x2000000000LL;
  char v11 = 0;
  uint64_t v6 = 0LL;
  char v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 0LL;
  if (a1 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __PFUserCopyRules_S_block_invoke;
    block[3] = &unk_18A29B498;
    block[4] = v10;
    void block[5] = &v6;
    void block[6] = a1;
    dispatch_sync(Queue, block);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v3;
}

uint64_t PFUserClearStates(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  char v11 = 0;
  if (a1 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __PFUserClearStates_block_invoke;
    block[3] = &unk_18A29B4E8;
    void block[5] = &v8;
    void block[6] = a1;
    block[4] = a2;
    dispatch_sync(Queue, block);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __PFUserClearStates_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    PFManagerErrorLog();
    return;
  }

  PFManagerInfoLog();
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(const char **)(v2 + 24);
  uint64_t v4 = *(const char **)(v2 + 32);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = __PFUserClearStates_block_invoke_2;
    v9[3] = &unk_18A29B4C0;
    v9[4] = v5;
    v9[5] = v2;
    uint64_t v6 = v9;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = PFManagerSendMessage( 0LL,  v3,  v4,  0x3EFu,  0xFFFFFFFFuLL,  (uint64_t)v6);
  uint64_t v7 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    goto LABEL_10;
  }
  if (*(_BYTE *)(*(void *)(v7 + 8) + 24LL))
  {
    uint64_t v8 = (void *)PFXPCGetResponse();
    xpc_release(v8);
    if (*(void *)(a1 + 32))
    {
      uint64_t v7 = *(void *)(a1 + 40);
LABEL_10:
      if (*(_BYTE *)(*(void *)(v7 + 8) + 24LL)) {
        CFRetain(*(CFTypeRef *)(a1 + 48));
      }
    }
  }

void __PFUserClearStates_block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  PFManagerInfoLog();
  uint64_t v5 = (dispatch_queue_s *)v3[5];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____PFUserXPCClearStatesResponseHandler_block_invoke;
  block[3] = &unk_18A29B768;
  block[4] = v4;
  char v7 = a2;
  dispatch_async(v5, block);
  CFRelease(v3);
}

uint64_t PFUserNATLook(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  char v16 = 0;
  if (a1
    && a3
    && a2
    && (uint64_t Queue = PFManagerGetQueue()) != 0
    && (uint64_t v6 = (dispatch_queue_s *)Queue, (v7 = xpc_dictionary_create(0LL, 0LL, 0LL)) != 0LL)
    && (v8 = v7, BOOL v9 = PFCheckNATRule(a2, v7), (*((_BYTE *)v14 + 24) = v9) != 0))
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __PFUserNATLook_block_invoke;
    v12[3] = &unk_18A29B530;
    v12[4] = &v13;
    v12[5] = a1;
    v12[6] = v8;
    v12[7] = a2;
    dispatch_sync(v6, v12);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v10 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

CFTypeRef __PFUserNATLook_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = PFManagerCheckUserExists(*(const void **)(a1 + 40));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    return (CFTypeRef)PFManagerErrorLog();
  }
  PFManagerInfoLog();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v4 = *(const char **)(v3 + 24);
  uint64_t v5 = *(const char **)(v3 + 32);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 0x40000000LL;
  v7[2] = __PFUserNATLook_block_invoke_2;
  v7[3] = &__block_descriptor_tmp_52;
  v7[4] = *(void *)(a1 + 56);
  v7[5] = v3;
  CFTypeRef result = (CFTypeRef)PFManagerSendMessage(v2, v4, v5, 0x3EEu, 0xFFFFFFFFuLL, (uint64_t)v7);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_BYTE)result;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    return CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  return result;
}

void __PFUserNATLook_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  PFManagerInfoLog();
  if (a3) {
    xpc_retain(a3);
  }
  xpc_object_t v7 = (dispatch_queue_s *)v5[5];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ____PFUserXPCNatLookResponseHandler_block_invoke;
  block[3] = &unk_18A29B790;
  char v9 = a2;
  block[4] = v6;
  void block[5] = a3;
  dispatch_async(v7, block);
  CFRelease(v5);
}

uint64_t PFUserNATLook_S(uint64_t a1, void *a2)
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  char v19 = 0;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  if (a1
    && a2
    && (uint64_t Queue = PFManagerGetQueue()) != 0
    && (v5 = (dispatch_queue_s *)Queue, (xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL)) != 0LL)
    && (v7 = v6, BOOL v8 = PFCheckNATRule(a2, v6), (*((_BYTE *)v17 + 24) = v8) != 0))
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __PFUserNATLook_S_block_invoke;
    v11[3] = &unk_18A29B558;
    void v11[6] = a1;
    v11[7] = v7;
    v11[4] = &v16;
    v11[5] = &v12;
    dispatch_sync(v5, v11);
  }

  else
  {
    PFManagerErrorLog();
  }

  uint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t PFQueryGatewayAddrAndPortForDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  char v11 = 0;
  if (a2 && PFManagerCreate() && !PFManagerLogOpen())
  {
    if (a1 && (~*(unsigned __int8 *)(a1 + 8) & 0x14) == 0 && (uint64_t Queue = (dispatch_queue_s *)PFManagerGetQueue()) != 0LL)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __PFQueryGatewayAddrAndPortForDescriptor_block_invoke;
      block[3] = &unk_18A29B580;
      block[4] = &v8;
      void block[5] = a1;
      void block[6] = a2;
      dispatch_sync(Queue, block);
    }

    else
    {
      PFManagerErrorLog();
    }
  }

  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __PFQueryGatewayAddrAndPortForDescriptor_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_data(v4, (const char *)pfXPCLANAddress, (const void *)(v2 + 24), 4uLL);
  xpc_dictionary_set_uint64(v4, (const char *)pfXPCLANPort, *(unsigned __int16 *)(v2 + 44));
  char v5 = *(_BYTE *)(v2 + 8);
  if ((v5 & 8) != 0)
  {
    xpc_dictionary_set_data(v4, (const char *)pfXPCEXTLANAddress, (const void *)(v2 + 40), 4uLL);
    char v5 = *(_BYTE *)(v2 + 8);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)(v2 + 8) & 0x20) == 0)
  {
    goto LABEL_3;
  }

  xpc_dictionary_set_uint64(v4, (const char *)pfXPCEXTLANPort, *(unsigned __int16 *)(v2 + 46));
  if ((*(_BYTE *)(v2 + 8) & 2) != 0) {
LABEL_4:
  }
    xpc_dictionary_set_uint64(v4, (const char *)pfXPCIPProto, *(unsigned __int8 *)(v2 + 10));
LABEL_5:
  PFManagerInfoLog();
  int v6 = PFManagerSendMessage(v4, 0LL, 0LL, 0xBB9u, 0LL, 0LL);
  PFManagerDebugLog();
  if (!v6)
  {
    PFManagerNoticeLog();
    xpc_object_t v7 = 0LL;
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  xpc_object_t v7 = (void *)PFXPCGetResponse();
  size_t length = 0LL;
  data = xpc_dictionary_get_data(v7, (const char *)pfXPCResponseV4GatewayAddress, &length);
  if (data)
  {
    if (length == 4)
    {
      *(_DWORD *)uint64_t v3 = *data;
      uint64_t uint64 = xpc_dictionary_get_uint64(v7, (const char *)pfXPCResponseGatewayPort);
      if (uint64)
      {
        *(_WORD *)(v3 + 4) = uint64;
        if (!v4) {
          goto LABEL_16;
        }
LABEL_15:
        xpc_release(v4);
        goto LABEL_16;
      }
    }
  }

  PFManagerErrorLog();
  if (v4) {
    goto LABEL_15;
  }
LABEL_16:
  if (v7) {
    xpc_release(v7);
  }
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = v6;
}

uint64_t PFFindStatesByDescriptor(dispatch_object_s *a1, uint64_t a2, uint64_t a3)
{
  CFTypeRef v6 = PFManagerCreate();
  if (v6 && !PFManagerLogOpen())
  {
    if (a1)
    {
      if (MEMORY[0x1895CD824](a1) == MEMORY[0x1895F9250])
      {
        uint64_t Queue = PFManagerGetQueue();
        if (Queue)
        {
          uint64_t v9 = (dispatch_queue_s *)Queue;
          dispatch_retain(a1);
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 0x40000000LL;
          block[2] = __PFFindStatesByDescriptor_block_invoke;
          block[3] = &unk_18A29B5F8;
          void block[5] = a1;
          void block[6] = a2;
          block[4] = a3;
          dispatch_async(v9, block);
          return 1LL;
        }
      }
    }

    PFManagerErrorLog();
  }

  PFManagerRelease(v6);
  return 0LL;
}

void __PFFindStatesByDescriptor_block_invoke(uint64_t a1)
{
  CFTypeRef v2 = PFManagerCreate();
  if (v2)
  {
    uint64_t v3 = v2;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = __PFFindStatesByDescriptor_block_invoke_2;
    v6[3] = &unk_18A29B5D0;
    xpc_object_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v6[4] = *(void *)(a1 + 32);
    v6[5] = v5;
    PFManagerSendMessage(v4, 0LL, 0LL, 0xBB8u, 0LL, (uint64_t)v6);
    PFManagerRelease(v3);
  }

  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void __PFFindStatesByDescriptor_block_invoke_2(uint64_t a1, char a2, xpc_object_t object)
{
  if (object) {
    xpc_retain(object);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __PFFindStatesByDescriptor_block_invoke_3;
  block[3] = &unk_18A29B5A8;
  char v8 = a2;
  CFTypeRef v6 = *(dispatch_queue_s **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  void block[5] = object;
  dispatch_async(v6, block);
}

uint64_t __PFFindStatesByDescriptor_block_invoke_3(uint64_t a1)
{
  CFTypeRef v2 = *(void **)(a1 + 40);
  if (MEMORY[0x1895CD824](v2) == MEMORY[0x1895F9250])
  {
    xpc_object_t value = xpc_dictionary_get_value(v2, (const char *)pfXPCResponseArray);
    if (value)
    {
      uint64_t v5 = value;
      if (MEMORY[0x1895CD824]() == MEMORY[0x1895F9220])
      {
        xpc_retain(v5);
        goto LABEL_6;
      }
    }
  }

  else
  {
    uint64_t v3 = (const _xpc_type_s *)MEMORY[0x1895CD824](v2);
    xpc_type_get_name(v3);
  }

  PFManagerErrorLog();
LABEL_6:
  xpc_release(*(xpc_object_t *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t PFStateQueryAppendTrafficDescriptor(xpc_object_t *a1, const void *a2, const unsigned __int8 *a3)
{
  if (*a1)
  {
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
      goto LABEL_7;
    }
  }

  else
  {
    *a1 = xpc_dictionary_create(0LL, 0LL, 0LL);
    PFManagerInfoLog();
  }

  xpc_object_t value = xpc_dictionary_get_value(*a1, (const char *)pfXPCTrafficDescriptors);
  if (value)
  {
    xpc_object_t empty = value;
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9220])
    {
LABEL_7:
      PFManagerErrorLog();
      return 0LL;
    }
  }

  else
  {
    xpc_object_t empty = xpc_array_create_empty();
    xpc_dictionary_set_value(*a1, (const char *)pfXPCTrafficDescriptors, empty);
    PFManagerInfoLog();
    xpc_release(empty);
  }

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_data(v9, (const char *)pfXPCTrafficDescriptor, a2, 0x30uLL);
  xpc_dictionary_set_uuid(v9, (const char *)pfXPCTrafficDescriptorId, a3);
  xpc_array_append_value(empty, v9);
  xpc_release(v9);
  return 1LL;
}

uint64_t PFGetDescriptorStateDetails(void *a1, uint64_t a2, uint64_t a3)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
    goto LABEL_5;
  }
  if (a3 != 40) {
    goto LABEL_5;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, (const char *)pfXPCResponseDescriptorId);
  if (!value) {
    goto LABEL_5;
  }
  xpc_object_t v7 = value;
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92F8]) {
    goto LABEL_5;
  }
  bytes = xpc_uuid_get_bytes(v7);
  uuid_copy((unsigned __int8 *)(a2 + 16), bytes);
  xpc_object_t v10 = xpc_dictionary_get_value(a1, (const char *)pfXPCResponseStatesFound);
  if (!v10) {
    goto LABEL_5;
  }
  char v11 = v10;
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9228]) {
    goto LABEL_5;
  }
  *(_BYTE *)(a2 + 32) = xpc_BOOL_get_value(v11);
  xpc_object_t v12 = xpc_dictionary_get_value(a1, (const char *)pfXPCResponsePacketCountIn);
  if (!v12) {
    goto LABEL_5;
  }
  uint64_t v13 = v12;
  uint64_t v14 = MEMORY[0x1895CD824]();
  uint64_t v15 = MEMORY[0x1895F92F0];
  if (v14 == MEMORY[0x1895F92F0]
    && (*(void *)a2 = xpc_uint64_get_value(v13),
        (xpc_object_t v16 = xpc_dictionary_get_value(a1, (const char *)pfXPCResponsePacketCountOut)) != 0LL)
    && (uint64_t v17 = v16, MEMORY[0x1895CD824]() == v15))
  {
    *(void *)(a2 + 8) = xpc_uint64_get_value(v17);
    return 1LL;
  }

  else
  {
LABEL_5:
    PFManagerErrorLog();
    return 0LL;
  }

uint64_t __PFUserRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __pfUserTypeID = result;
  return result;
}

uint64_t __PFUserRelease(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    CFTypeRef v2 = *(dispatch_queue_s **)(a1 + 40);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ____PFUserRelease_block_invoke;
    block[3] = &__block_descriptor_tmp_75;
    block[4] = a1;
    dispatch_async(v2, block);
    _Block_release(*(const void **)(a1 + 56));
  }

  uint64_t v3 = *(dispatch_object_s **)(a1 + 40);
  if (v3)
  {
    dispatch_release(v3);
    *(void *)(a1 + 40) = 0LL;
  }

  xpc_object_t v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 48) = 0LL;
  }

  uint64_t v5 = *(const void **)(a1 + 16);
  if (v5)
  {
    PFManagerRelease(v5);
    *(void *)(a1 + 16) = 0LL;
  }

  return PFManagerInfoLog();
}

uint64_t PFManagerLogOpen()
{
  int v0 = __pfLogError;
  if (!__pfLog && (__pfLogError & 1) == 0)
  {
    do
    {
      pthread_once(&__pfLogInit, __PFManagerLogCreate);
      int v0 = __pfLogError;
      if (__pfLog) {
        BOOL v1 = 0;
      }
      else {
        BOOL v1 = __pfLogError == 0;
      }
    }

    while (v1);
  }

  if (v0) {
    return 22LL;
  }
  else {
    return 0LL;
  }
}

void __PFManagerLogCreate()
{
  __pfLog = (uint64_t)os_log_create((const char *)pfLogSubsystem, "framework");
  if (!__pfLog)
  {
    __pfLogError = 1;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __PFManagerLogCreate_cold_1();
    }
  }

uint64_t PFManagerErrorLog()
{
  return os_log_with_args();
}

uint64_t PFManagerNoticeLog()
{
  return os_log_with_args();
}

uint64_t PFManagerInfoLog()
{
  return os_log_with_args();
}

uint64_t PFManagerDebugLog()
{
  return os_log_with_args();
}

uint64_t PFManagerGetQueue()
{
  uint64_t result = __pfQueue;
  if (!__pfQueue && (__pfQueueError & 1) == 0)
  {
    do
    {
      pthread_once(&__pfQueueInit, __PFManagerQueueCreate);
      uint64_t result = __pfQueue;
      if (__pfQueue) {
        break;
      }
      sleep(1u);
      uint64_t result = __pfQueue;
    }

    while (!__pfQueue && __pfQueueError == 0);
  }

  return result;
}

void __PFManagerQueueCreate()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x2AuLL, "com.apple.framework.pf.%p", &__pfManager);
  __str[41] = 0;
  __pfuint64_t Queue = (uint64_t)dispatch_queue_create(__str, 0LL);
  if (__pfQueue)
  {
    snprintf(label, 0x2EuLL, "com.apple.framework.pf.xpc.%p", &__pfManager);
    label[45] = 0;
    __pfXpcuint64_t Queue = (uint64_t)dispatch_queue_create(label, 0LL);
    if (__pfXpcQueue) {
      return;
    }
    dispatch_release((dispatch_object_t)__pfQueue);
    __pfuint64_t Queue = 0LL;
  }

  __pfQueueError = 1;
}

CFTypeRef PFManagerCreate()
{
  if (__pfManager) {
    return CFRetain((CFTypeRef)__pfManager);
  }
  BOOL v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (!__pfManagerTypeID) {
    pthread_once(&__pfManagerTypeInit, (void (*)(void))__PFManagerRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  __pfManager = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0LL;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(v1, 0LL, MEMORY[0x189605228]);
    CFTypeRef result = (CFTypeRef)__pfManager;
    *(void *)(__pfManager + 16) = Mutable;
    if (!Mutable)
    {
      PFManagerErrorLog();
      CFRelease((CFTypeRef)__pfManager);
      CFTypeRef result = 0LL;
      __pfManager = 0LL;
    }
  }

  else
  {
    PFManagerErrorLog();
    return (CFTypeRef)__pfManager;
  }

  return result;
}

uint64_t PFManagerAddUser(uint64_t a1, void *a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v5 = a2[3];
    uint64_t v6 = a2[4];
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
    if (Count < 1) {
      goto LABEL_9;
    }
    CFIndex v8 = Count;
    BOOL v9 = 0;
    for (i = 0LL; i != v8; BOOL v9 = i >= v8)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), i);
      if (ValueAtIndex[3] == v5 && ValueAtIndex[4] == v6) {
        break;
      }
      ++i;
    }

    if (v9)
    {
LABEL_9:
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 16), a2);
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

BOOL PFManagerCheckUserExists(const void *a1)
{
  BOOL result = 0LL;
  if (a1 && __pfManager)
  {
    if (CFArrayGetCount(*(CFArrayRef *)(__pfManager + 16)) < 1)
    {
      return 0LL;
    }

    else
    {
      uint64_t v3 = *(const __CFArray **)(__pfManager + 16);
      v4.size_t length = CFArrayGetCount(v3);
      v4.location = 0LL;
      return CFArrayContainsValue(v3, v4, a1) != 0;
    }
  }

  return result;
}

uint64_t PFManagerReleaseUser(uint64_t a1, const void *a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (CFArrayGetCount(*(CFArrayRef *)(a1 + 16)) < 1 || CFArrayGetCount(*(CFArrayRef *)(a1 + 16)) < 1)
    {
      return 0LL;
    }

    else
    {
      CFIndex v5 = 0LL;
      while (CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), v5) != a2)
      {
        if (++v5 >= CFArrayGetCount(*(CFArrayRef *)(a1 + 16))) {
          return 0LL;
        }
      }

      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 16), v5);
      PFManagerDebugLog();
      return 1LL;
    }
  }

  return result;
}

uint64_t PFManagerSendMessage( void *a1, const char *a2, const char *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  if (__pfManager) {
    return PFXPCSetupAndSend((dispatch_queue_s *)__pfQueue, (dispatch_queue_s *)__pfXpcQueue, a1, a2, a3, a4, a5, a6);
  }
  else {
    return 0LL;
  }
}

uint64_t PFManagerRelease(const void *a1)
{
  if (a1) {
    CFRelease(a1);
  }
  return 0LL;
}

uint64_t __PFManagerRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __pfManagerTypeID = result;
  return result;
}

uint64_t __PFManagerRelease(uint64_t a1)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 16))) {
    __PFManagerRelease_cold_1();
  }
  uint64_t v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 16) = 0LL;
  }

  PFXPCCleanup();
  uint64_t result = PFManagerDebugLog();
  __pfManager = 0LL;
  return result;
}

uint64_t PFCheckRule(void *a1, void *a2)
{
  int v57 = -1;
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFAction);
  if (!value) {
    goto LABEL_3;
  }
  CFIndex v5 = value;
  uint64_t v6 = MEMORY[0x1895CD824]();
  uint64_t v7 = MEMORY[0x1895F92F0];
  if (v6 != MEMORY[0x1895F92F0]) {
    goto LABEL_3;
  }
  uint64_t v9 = xpc_uint64_get_value(v5);
  unint64_t v10 = v9;
  if (v9 > 0xE || ((1LL << v9) & 0x7B3F) == 0) {
    goto LABEL_3;
  }
  xpc_dictionary_set_uint64(a2, kPFAction, v9);
  if (v10 > 0xE || ((1LL << v10) & 0x7B3F) == 0) {
    return 0LL;
  }
  unsigned __int8 uint64 = xpc_dictionary_get_uint64(a1, kPFAction);
  xpc_object_t v14 = xpc_dictionary_get_value(a1, kPFDirection);
  if (v14)
  {
    uint64_t result = __PFDirCheck(v14, a2);
    if (!(_DWORD)result) {
      return result;
    }
  }

  xpc_object_t v15 = xpc_dictionary_get_value(a1, kPFProtocol);
  if (v15)
  {
    uint64_t result = __PFProtocolCheck(v15, a2);
    if (!(_DWORD)result) {
      return result;
    }
  }

  xpc_object_t v16 = xpc_dictionary_get_value(a1, kPFFamily);
  if (v16)
  {
    uint64_t result = __PFFamilyCheck(v16, a2, &v57);
    if (!(_DWORD)result) {
      return result;
    }
  }

  xpc_object_t v17 = xpc_dictionary_get_value(a1, kPFReturnOptions);
  if (v17)
  {
    uint64_t v18 = v17;
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
      goto LABEL_3;
    }
    xpc_object_t v19 = xpc_dictionary_get_value(v18, kPFSubReturnType);
    if (!v19) {
      goto LABEL_3;
    }
    uint64_t v20 = v19;
    if (MEMORY[0x1895CD824]() != v7) {
      goto LABEL_3;
    }
    uint64_t v21 = xpc_uint64_get_value(v20);
    uint64_t v22 = v21;
    if (v21 >= 9) {
      goto LABEL_3;
    }
    xpc_dictionary_set_uint64(a2, kPFSubReturnType, v21);
    xpc_object_t v23 = xpc_dictionary_get_value(v18, kPFSubReturnTTL);
    if (v23)
    {
      v24 = v23;
      if (MEMORY[0x1895CD824]() != v7) {
        goto LABEL_3;
      }
      if (v22 != 1) {
        goto LABEL_3;
      }
      uint64_t v25 = xpc_uint64_get_value(v24);
      if (v25 > 0xFF) {
        goto LABEL_3;
      }
      xpc_dictionary_set_uint64(a2, kPFSubReturnTTL, v25);
    }

    xpc_object_t v26 = xpc_dictionary_get_value(v18, kPFSubReturnICMPCode);
    if (v26)
    {
      v27 = v26;
      if (MEMORY[0x1895CD824]() != v7) {
        goto LABEL_3;
      }
      if (v22 != 4) {
        goto LABEL_3;
      }
      uint64_t v28 = xpc_uint64_get_value(v27);
      if (v28 > 0xFF) {
        goto LABEL_3;
      }
      xpc_dictionary_set_uint64(a2, kPFSubReturnICMPCode, v28);
    }

    xpc_object_t v29 = xpc_dictionary_get_value(v18, kPFSubReturnICMP6Code);
    if (v29)
    {
      v30 = v29;
      if (MEMORY[0x1895CD824]() != v7) {
        goto LABEL_3;
      }
      if (v22 != 4) {
        goto LABEL_3;
      }
      uint64_t v31 = xpc_uint64_get_value(v30);
      if (v31 > 0xFF) {
        goto LABEL_3;
      }
      xpc_dictionary_set_uint64(a2, kPFSubReturnICMP6Code, v31);
    }
  }

  xpc_object_t v32 = xpc_dictionary_get_value(a1, kPFQuick);
  if (v32)
  {
    v33 = v32;
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9228]) {
      goto LABEL_3;
    }
    v34 = kPFQuick;
    BOOL v35 = xpc_BOOL_get_value(v33);
    xpc_dictionary_set_BOOL(a2, v34, v35);
  }

  xpc_object_t v36 = xpc_dictionary_get_value(a1, kPFInterface);
  if (!v36) {
    goto LABEL_56;
  }
  v37 = v36;
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92E8]
    || (string_ptr = xpc_string_get_string_ptr(v37), (__PFInterfaceExists(string_ptr) & 1) == 0))
  {
LABEL_3:
    PFManagerErrorLog();
    return 0LL;
  }

  xpc_dictionary_set_string(a2, kPFInterface, string_ptr);
LABEL_56:
  xpc_object_t v39 = xpc_dictionary_get_value(a1, kPFFrom);
  if (v39)
  {
    uint64_t result = __PFAddressCheck(v39, a2, kPFFrom, &v57);
    if (!(_DWORD)result) {
      return result;
    }
  }

  xpc_object_t v40 = xpc_dictionary_get_value(a1, kPFTo);
  if (v40)
  {
    uint64_t result = __PFAddressCheck(v40, a2, kPFTo, &v57);
    if (!(_DWORD)result) {
      return result;
    }
  }

  xpc_object_t v41 = xpc_dictionary_get_value(a1, kPFNATRDRAddress);
  if (!v41) {
    goto LABEL_66;
  }
  if (uint64 == 13LL)
  {
    int v57 = -1;
    uint64_t result = __PFAddressCheck(v41, a2, kPFNATRDRAddress, &v57);
    if (!(_DWORD)result) {
      return result;
    }
    goto LABEL_66;
  }

  if ((__PFAddressCheck(v41, a2, kPFNATRDRAddress, &v57) & 1) == 0) {
    return 0LL;
  }
LABEL_66:
  xpc_object_t v42 = xpc_dictionary_get_value(a1, kPFFlags);
  if (!v42 || (uint64_t result = __PFFlagsCheck(v42, a2), (_DWORD)result))
  {
    xpc_object_t v43 = xpc_dictionary_get_value(a1, kPFUser);
    if (!v43 || (uint64_t result = __PFUserCheck(v43, a2), (_DWORD)result))
    {
      xpc_object_t v44 = xpc_dictionary_get_value(a1, kPFGroup);
      if (!v44 || (uint64_t result = __PFGroupCheck(v44, a2), (_DWORD)result))
      {
        xpc_object_t v45 = xpc_dictionary_get_value(a1, kPFLog);
        if (!v45 || (uint64_t result = __PFLogCheck(v45, a2), (_DWORD)result))
        {
          xpc_object_t v46 = xpc_dictionary_get_value(a1, kPFICMP);
          if (!v46 || (uint64_t result = __PFICMPCheck(v46, a2), (_DWORD)result))
          {
            xpc_object_t v47 = xpc_dictionary_get_value(a1, kPFTagDict);
            if (!v47 || (uint64_t result = __PFTagCheck(v47, a2), (_DWORD)result))
            {
              xpc_object_t v48 = xpc_dictionary_get_value(a1, kPFScrubOptions);
              if (!v48 || (uint64_t result = __PFScrubOptionsCheck(v48, a2), (_DWORD)result))
              {
                xpc_object_t v49 = xpc_dictionary_get_value(a1, kPFKeepState);
                if (!v49 || (uint64_t result = __PFStateCheck(v49, a2), (_DWORD)result))
                {
                  xpc_object_t v50 = xpc_dictionary_get_value(a1, kPFAllowOpts);
                  if (!v50 || (uint64_t result = __PFAllowOptsCheck(v50, a2), (_DWORD)result))
                  {
                    xpc_object_t v51 = xpc_dictionary_get_value(a1, kPFExtFilter);
                    if (!v51 || (uint64_t result = __PFExtFilterCheck(v51, a2), (_DWORD)result))
                    {
                      xpc_object_t v52 = xpc_dictionary_get_value(a1, kPFExtMap);
                      if (!v52 || (uint64_t result = __PFExtMapCheck(v52, a2), (_DWORD)result))
                      {
                        xpc_object_t v53 = xpc_dictionary_get_value(a1, kPFRTableID);
                        if (!v53 || (uint64_t result = __PFRTableCheck(v53, a2), (_DWORD)result))
                        {
                          xpc_object_t v54 = xpc_dictionary_get_value(a1, kPFNATPass);
                          if (!v54 || (uint64_t result = __PFNatPassCheck(v54, a2), (_DWORD)result))
                          {
                            xpc_object_t v55 = xpc_dictionary_get_value(a1, kPFMaxStates);
                            if (!v55 || (uint64_t result = __PFMaxStatesCheck(v55, a2), (_DWORD)result))
                            {
                              xpc_object_t v56 = xpc_dictionary_get_value(a1, kPFDummyNet);
                              if (!v56 || (uint64_t result = __PFDummyNetCheck(v56, a2), (_DWORD)result))
                              {
                                if (uint64 > 0xCu
                                  || ((1 << uint64) & 0x1803) == 0
                                  || (uint64_t result = __PFFilterConsistencyCheck(a2), (_DWORD)result))
                                {
                                  if ((uint64 & 0xFE) != 8 || (uint64_t result = __PFRDRConsistencyCheck(a2), (_DWORD)result))
                                  {
                                    uint64_t result = __PFDummyNetConsistencyCheck(a2);
                                    if ((_DWORD)result) {
                                      return 1LL;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t __PFDirCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() == MEMORY[0x1895F92F0] && (uint64_t value = xpc_uint64_get_value(a1), value <= 2))
  {
    xpc_dictionary_set_uint64(a2, kPFDirection, value);
    return 1LL;
  }

  else
  {
    PFManagerErrorLog();
    return 0LL;
  }

uint64_t __PFProtocolCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() == MEMORY[0x1895F92E8])
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    CFIndex v5 = getprotobyname(string_ptr);
    if (!v5)
    {
LABEL_7:
      PFManagerErrorLog();
      return 0LL;
    }

    uint64_t v6 = kPFProtocol;
    uint64_t p_proto = v5->p_proto;
  }

  else
  {
    if (MEMORY[0x1895CD824](a1) != MEMORY[0x1895F92F0]) {
      goto LABEL_7;
    }
    uint64_t p_proto = xpc_uint64_get_value(a1);
    if (p_proto > 0xFF) {
      goto LABEL_7;
    }
    uint64_t v6 = kPFProtocol;
  }

  xpc_dictionary_set_uint64(a2, v6, p_proto);
  return 1LL;
}

BOOL __PFFamilyCheck(void *a1, void *a2, _DWORD *a3)
{
  if (MEMORY[0x1895CD824]() == MEMORY[0x1895F92F0])
  {
    uint64_t value = xpc_uint64_get_value(a1);
    int v8 = value;
    BOOL v6 = value == 30 || value == 2;
    if (value == 30 || value == 2)
    {
      xpc_dictionary_set_uint64(a2, kPFFamily, value);
      *a3 = v8;
    }

    else
    {
      PFManagerErrorLog();
    }
  }

  else
  {
    PFManagerErrorLog();
    return 0LL;
  }

  return v6;
}

uint64_t __PFAddressCheck(void *a1, void *a2, const char *a3, int *a4)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  int v45 = -1;
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
    goto LABEL_2;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFSubAddressLabel);
  if (!value)
  {
    xpc_object_t v11 = xpc_dictionary_get_value(a1, kPFSubAddress);
    if (v11)
    {
      xpc_object_t v12 = v11;
      if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92E8]) {
        goto LABEL_2;
      }
      string_ptr = xpc_string_get_string_ptr(v12);
      xpc_object_t v14 = strrchr(string_ptr, 47);
      if (v14)
      {
        xpc_object_t v15 = v14;
        xpc_object_t v16 = v14 + 1;
        int v17 = strtol(v14 + 1, &__endptr, 0);
        if (!__endptr) {
          goto LABEL_2;
        }
        BOOL v18 = __endptr != v16 && *__endptr == 0;
        if (!v18 || v17 >= 129) {
          goto LABEL_2;
        }
        size_t v19 = strlen(string_ptr);
        size_t v20 = v19 - strlen(v15) + 1;
        uint64_t v21 = (char *)malloc(v20);
        if (!v21)
        {
          xpc_object_t v44 = __error();
          strerror(*v44);
          goto LABEL_2;
        }

        uint64_t v22 = v21;
        strlcpy(v21, string_ptr, v20);
LABEL_38:
        if ((__PFIPAddressCheck(v22, &v45) & 1) != 0)
        {
          int v34 = v45;
          if (v45 != -1)
          {
            int v35 = *a4;
            if (*a4 != -1 && v45 != v35) {
              goto LABEL_56;
            }
            if (v35 == -1)
            {
              xpc_dictionary_set_uint64(a2, kPFFamily, v45);
              *a4 = v34;
            }
          }

          free(v22);
          v24 = &kPFSubAddress;
          goto LABEL_23;
        }

LABEL_56:
        PFManagerErrorLog();
        xpc_object_t v42 = v22;
        goto LABEL_69;
      }

      uint64_t v22 = strndup(string_ptr, 0x40uLL);
      if (v22) {
        goto LABEL_38;
      }
    }

    else
    {
      xpc_object_t v32 = xpc_dictionary_get_value(a1, kPFSubDynInterface);
      if (!v32) {
        goto LABEL_2;
      }
      v33 = v32;
      if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92E8]) {
        goto LABEL_2;
      }
      string_ptr = xpc_string_get_string_ptr(v33);
      xpc_object_t v36 = strndup(string_ptr, 0x40uLL);
      if (v36)
      {
        v37 = v36;
        v38 = strrchr(v36, 58);
        if (v38)
        {
          xpc_object_t v39 = v38;
          unsigned __int8 v40 = 0;
          while (1)
          {
            if (!strcmp(v39 + 1, "network"))
            {
              char v41 = 1;
            }

            else if (!strcmp(v39 + 1, "broadcast"))
            {
              char v41 = 2;
            }

            else if (!strcmp(v39 + 1, "peer"))
            {
              char v41 = 4;
            }

            else
            {
              if (strcmp(v39 + 1, "0"))
              {
                free(v37);
                goto LABEL_2;
              }

              char v41 = 8;
            }

            v40 |= v41;
            *xpc_object_t v39 = 0;
            xpc_object_t v39 = strrchr(v37, 58);
            if (!v39) {
              goto LABEL_61;
            }
          }
        }

        unsigned __int8 v40 = 0;
LABEL_61:
        if ((v40 & (v40 - 1) & 6) == 0 && (__PFInterfaceExists(v37) & 1) != 0)
        {
          free(v37);
          v24 = &kPFSubDynInterface;
          goto LABEL_23;
        }

        PFManagerErrorLog();
        xpc_object_t v42 = v37;
LABEL_69:
        free(v42);
        return 0LL;
      }
    }

    xpc_object_t v43 = __error();
    strerror(*v43);
    goto LABEL_2;
  }

  unint64_t v10 = value;
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92E8]) {
    goto LABEL_2;
  }
  string_ptr = xpc_string_get_string_ptr(v10);
  if (string_ptr)
  {
    size_t v23 = strlen(kPFAny);
    if (strncmp(string_ptr, kPFAny, v23)) {
      goto LABEL_2;
    }
  }

  v24 = &kPFSubAddressLabel;
LABEL_23:
  snprintf(__str, 0x40uLL, "%s%s", a3, *v24);
  xpc_dictionary_set_string(a2, __str, string_ptr);
  xpc_object_t v25 = xpc_dictionary_get_value(a1, kPFSubLowPort);
  if (v25)
  {
    xpc_object_t v26 = v25;
    snprintf(__str, 0x40uLL, "%s%s", a3, kPFSubLowPort);
    uint64_t result = __PFPortCheck(v26, a2, __str);
    if (!(_DWORD)result) {
      return result;
    }
    xpc_object_t v27 = xpc_dictionary_get_value(a1, kPFSubHighPort);
    if (v27)
    {
      snprintf(__str, 0x40uLL, "%s%s", a3, kPFSubHighPort);
      uint64_t result = __PFPortCheck(v27, a2, __str);
      if (!(_DWORD)result) {
        return result;
      }
    }

    xpc_object_t v28 = xpc_dictionary_get_value(a1, kPFSubPortOperator);
    if (v28)
    {
      xpc_object_t v29 = v28;
      snprintf(__str, 0x40uLL, "%s%s", a3, kPFSubPortOperator);
      if ((__PFOperatorCheck(v29, 1, v27 != 0LL, a2, __str) & 1) == 0) {
        return 0LL;
      }
      goto LABEL_29;
    }

LABEL_2:
    PFManagerErrorLog();
    return 0LL;
  }

    PFManagerErrorLog();
    return 0LL;
  }

  return 1LL;
}

    PFManagerErrorLog();
    return 0LL;
  }

  if (!v7) {
    goto LABEL_2;
  }
  return 1LL;
}

  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v15)
  {
LABEL_12:
    PFManagerErrorLog();
    return 0LL;
  }

  xpc_object_t v16 = v15;
  xpc_dictionary_set_uint64(v15, (const char *)pfXPCKeyType, a6);
  if (a4 && a5)
  {
    xpc_dictionary_set_string(v16, (const char *)pfXPCKeyAppType, a4);
    xpc_dictionary_set_string(v16, (const char *)pfXPCKeyAppSubType, a5);
  }

  switch(a6)
  {
    case 0x3E9u:
      xpc_dictionary_set_value(v16, (const char *)pfXPCKeyRule, a3);
      int v17 = (const char *)pfXPCKeyPriority;
      goto LABEL_19;
    case 0x3EAu:
      int v17 = (const char *)pfXPCKeyInsertID;
LABEL_19:
      xpc_dictionary_set_uint64(v16, v17, a7);
      goto LABEL_27;
    case 0x3EBu:
      size_t v19 = (const char *)pfXPCKeyRuleArray;
      goto LABEL_26;
    case 0x3ECu:
    case 0x3EDu:
      goto LABEL_27;
    case 0x3EEu:
      size_t v19 = (const char *)pfXPCKeyRule;
      goto LABEL_26;
    default:
      if (a6 == 3000)
      {
        if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9220]) {
          PFManagerErrorLog();
        }
        size_t v19 = (const char *)pfXPCKeyTrafficDescriptors;
      }

      else
      {
        if (a6 != 3001) {
          goto LABEL_27;
        }
        size_t v19 = (const char *)pfXPCKeyGatewayQuery;
      }

LABEL_29:
  xpc_object_t v30 = xpc_dictionary_get_value(a1, kPFSubNegated);
  if (!v30) {
    return 1LL;
  }
  uint64_t v31 = v30;
  snprintf(__str, 0x40uLL, "%s%s", a3, kPFSubNegated);
  uint64_t result = __PFNegatedCheck(v31, a2, __str);
  if ((_DWORD)result) {
    return 1LL;
  }
  return result;
}

uint64_t __PFFlagsCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92E8]) {
    goto LABEL_2;
  }
  string_ptr = xpc_string_get_string_ptr(a1);
  BOOL v6 = strndup(string_ptr, 0x40uLL);
  if (!v6)
  {
    uint64_t v13 = __error();
    strerror(*v13);
LABEL_2:
    PFManagerErrorLog();
    return 0LL;
  }

  uint64_t v7 = v6;
  int v8 = strrchr(v6, 47);
  if (!v8)
  {
LABEL_10:
    unsigned int v11 = __PFParseFlags(v7);
    if ((v11 & 0x80000000) == 0)
    {
      xpc_object_t v12 = &kPFFlags;
LABEL_15:
      xpc_dictionary_set_uint64(a2, *v12, v11);
      goto LABEL_16;
    }

    goto LABEL_17;
  }

  uint64_t v9 = v8;
  if (v8 == v7)
  {
    unsigned int v11 = __PFParseFlags(v7 + 1);
    if ((v11 & 0x80000000) == 0)
    {
      xpc_object_t v12 = &kPFFlagSet;
      goto LABEL_15;
    }

LABEL_17:
    PFManagerErrorLog();
    free(v7);
    return 0LL;
  }

  if (v8 > v7)
  {
    unsigned int v10 = __PFParseFlags(v8 + 1);
    if ((v10 & 0x80000000) != 0) {
      goto LABEL_17;
    }
    xpc_dictionary_set_uint64(a2, kPFFlagSet, v10);
    *uint64_t v9 = 0;
    goto LABEL_10;
  }

LABEL_16:
  free(v7);
  return 1LL;
}

uint64_t __PFUserCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
    goto LABEL_2;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFSubUserName);
  if (value)
  {
    uint64_t v7 = value;
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92E8])
    {
LABEL_2:
      PFManagerErrorLog();
      return 0LL;
    }

    string_ptr = xpc_string_get_string_ptr(v7);
    uint64_t v13 = getpwnam(string_ptr);
    if (v13)
    {
      uint64_t pw_uid = v13->pw_uid;
      xpc_object_t v15 = kPFUnknown;
    }

    else
    {
      xpc_object_t v15 = kPFUnknown;
      size_t v22 = strlen(kPFUnknown);
      if (strncmp(string_ptr, kPFUnknown, v22)) {
        goto LABEL_2;
      }
      uint64_t pw_uid = -1LL;
    }

    size_t v16 = strlen(v15);
    if (!strncmp(string_ptr, v15, v16))
    {
      int v17 = a2;
      uint64_t v18 = 0x7FFFFFFFLL;
    }

    else
    {
      int v17 = a2;
      uint64_t v18 = pw_uid;
    }

    xpc_dictionary_set_uint64(v17, kPFSubLowUserID, v18);
    LODWORD(v21) = 0;
  }

  else
  {
    xpc_object_t v8 = xpc_dictionary_get_value(a1, kPFSubLowUserID);
    if (!v8) {
      goto LABEL_2;
    }
    uint64_t v9 = v8;
    uint64_t v10 = MEMORY[0x1895CD824]();
    uint64_t v11 = MEMORY[0x1895F92F0];
    if (v10 != MEMORY[0x1895F92F0]) {
      goto LABEL_2;
    }
    uint64_t v19 = xpc_uint64_get_value(v9);
    if (v19 >= 0x7FFFFFFF) {
      goto LABEL_2;
    }
    xpc_dictionary_set_uint64(a2, kPFSubLowUserID, v19);
    xpc_object_t v20 = xpc_dictionary_get_value(a1, kPFSubHighUserID);
    uint64_t v21 = v20;
    if (v20)
    {
      if (MEMORY[0x1895CD824](v20) != v11) {
        goto LABEL_2;
      }
      uint64_t v24 = xpc_uint64_get_value(v21);
      if (v24 > 0x7FFFFFFE) {
        goto LABEL_2;
      }
      xpc_dictionary_set_uint64(a2, kPFSubHighUserID, v24);
      LODWORD(v21) = 1;
    }
  }

  xpc_object_t v23 = xpc_dictionary_get_value(a1, kPFSubUserOperator);
  if (!v23) {
    goto LABEL_2;
  }
  uint64_t v4 = 1LL;
  return v4;
}

uint64_t __PFGroupCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
    goto LABEL_2;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFSubGroupName);
  if (value)
  {
    uint64_t v7 = value;
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92E8])
    {
LABEL_2:
      PFManagerErrorLog();
      return 0LL;
    }

    string_ptr = xpc_string_get_string_ptr(v7);
    uint64_t v13 = getgrnam(string_ptr);
    if (v13)
    {
      uint64_t gr_gid = v13->gr_gid;
      xpc_object_t v15 = kPFUnknown;
    }

    else
    {
      xpc_object_t v15 = kPFUnknown;
      size_t v22 = strlen(kPFUnknown);
      if (strncmp(string_ptr, kPFUnknown, v22)) {
        goto LABEL_2;
      }
      uint64_t gr_gid = -1LL;
    }

    size_t v16 = strlen(v15);
    if (!strncmp(string_ptr, v15, v16))
    {
      int v17 = a2;
      uint64_t v18 = 0x7FFFFFFFLL;
    }

    else
    {
      int v17 = a2;
      uint64_t v18 = gr_gid;
    }

    xpc_dictionary_set_uint64(v17, kPFSubLowGroupID, v18);
    LODWORD(v21) = 0;
  }

  else
  {
    xpc_object_t v8 = xpc_dictionary_get_value(a1, kPFSubLowGroupID);
    if (!v8) {
      goto LABEL_2;
    }
    uint64_t v9 = v8;
    uint64_t v10 = MEMORY[0x1895CD824]();
    uint64_t v11 = MEMORY[0x1895F92F0];
    if (v10 != MEMORY[0x1895F92F0]) {
      goto LABEL_2;
    }
    uint64_t v19 = xpc_uint64_get_value(v9);
    if (v19 >= 0x7FFFFFFF) {
      goto LABEL_2;
    }
    xpc_dictionary_set_uint64(a2, kPFSubLowGroupID, v19);
    xpc_object_t v20 = xpc_dictionary_get_value(a1, kPFSubHighGroupID);
    uint64_t v21 = v20;
    if (v20)
    {
      if (MEMORY[0x1895CD824](v20) != v11) {
        goto LABEL_2;
      }
      uint64_t v24 = xpc_uint64_get_value(v21);
      if (v24 > 0x7FFFFFFE) {
        goto LABEL_2;
      }
      xpc_dictionary_set_uint64(a2, kPFSubHighGroupID, v24);
      LODWORD(v21) = 1;
    }
  }

  xpc_object_t v23 = xpc_dictionary_get_value(a1, kPFSubGroupOperator);
  if (!v23) {
    goto LABEL_2;
  }
  uint64_t v4 = 1LL;
  return v4;
}

uint64_t __PFLogCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
    goto LABEL_2;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFSubLogFlags);
  if (value)
  {
    BOOL v6 = value;
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92F0]) {
      goto LABEL_2;
    }
    uint64_t v8 = xpc_uint64_get_value(v6);
    if ((v8 & 7) == 0) {
      goto LABEL_2;
    }
    xpc_dictionary_set_uint64(a2, kPFSubLogFlags, v8);
    xpc_object_t v7 = xpc_dictionary_get_value(a1, kPFSubLogTo);
    if (!v7) {
      return 1LL;
    }
  }

  else
  {
    xpc_object_t v7 = xpc_dictionary_get_value(a1, kPFSubLogTo);
    if (!v7)
    {
LABEL_2:
      PFManagerErrorLog();
      return 0LL;
    }
  }

  if (MEMORY[0x1895CD824](v7) != MEMORY[0x1895F92E8]) {
    goto LABEL_2;
  }
  string_ptr = xpc_string_get_string_ptr(v7);
  if (strncmp(string_ptr, "pflog", 5uLL)) {
    goto LABEL_2;
  }
  uint64_t v11 = 0LL;
  unsigned __int8 v10 = __PFRuleStrToNum(string_ptr + 5, &v11);
  if (v11) {
    goto LABEL_2;
  }
  xpc_dictionary_set_uint64(a2, kPFSubLogTo, v10);
  return 1LL;
}

uint64_t __PFICMPCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
    goto LABEL_2;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFSubICMPType);
  if (!value) {
    goto LABEL_2;
  }
  BOOL v6 = value;
  uint64_t v7 = MEMORY[0x1895CD824]();
  uint64_t v8 = MEMORY[0x1895F92F0];
  if (v7 != MEMORY[0x1895F92F0]) {
    goto LABEL_2;
  }
  uint64_t v9 = xpc_uint64_get_value(v6);
  if (v9 >= 0x100) {
    goto LABEL_2;
  }
  xpc_dictionary_set_uint64(a2, kPFSubICMPType, v9);
  xpc_object_t v10 = xpc_dictionary_get_value(a1, kPFSubICMPCode);
  if (v10)
  {
    uint64_t v11 = v10;
    if (MEMORY[0x1895CD824]() == v8)
    {
      uint64_t v12 = xpc_uint64_get_value(v11);
      if (v12 <= 0xFF)
      {
        xpc_dictionary_set_uint64(a2, kPFSubICMPCode, v12);
        return 1LL;
      }
    }

uint64_t __PFTagCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
    goto LABEL_2;
  }
  if (xpc_dictionary_get_value(a1, kPFSubTag))
  {
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92E8]) {
      goto LABEL_2;
    }
    string = xpc_dictionary_get_string(a1, kPFSubTag);
    if (strnlen(string, 0x41uLL) > 0x40) {
      goto LABEL_2;
    }
    xpc_dictionary_set_string(a2, kPFSubTag, string);
    int v5 = 1;
  }

  else
  {
    int v5 = 0;
  }

  if (xpc_dictionary_get_value(a1, kPFSubTagged))
  {
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92E8]) {
      goto LABEL_2;
    }
    uint64_t v7 = xpc_dictionary_get_string(a1, kPFSubTagged);
    if (strnlen(v7, 0x41uLL) > 0x40) {
      goto LABEL_2;
    }
    xpc_dictionary_set_string(a2, kPFSubTagged, v7);
    int v5 = 1;
  }

  xpc_object_t value = xpc_dictionary_get_value(a1, kPFSubNotTagged);
  if (value)
  {
    uint64_t v9 = value;
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9228])
    {
LABEL_2:
      PFManagerErrorLog();
      return 0LL;
    }

    xpc_object_t v10 = kPFSubNotTagged;
    BOOL v11 = xpc_BOOL_get_value(v9);
    xpc_dictionary_set_BOOL(a2, v10, v11);
  }

  else if (!v5)
  {
    goto LABEL_2;
  }

  return 1LL;
}

uint64_t __PFScrubOptionsCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
    goto LABEL_2;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFSubScrubFlags);
  if (value)
  {
    BOOL v6 = value;
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92F0]) {
      goto LABEL_2;
    }
    uint64_t v8 = xpc_uint64_get_value(v6) & 0x1F00;
    if (!v8) {
      goto LABEL_2;
    }
    xpc_dictionary_set_uint64(a2, kPFSubScrubFlags, v8);
    int v7 = 1;
  }

  else
  {
    int v7 = 0;
  }

  xpc_object_t v9 = xpc_dictionary_get_value(a1, kPFSubScrubMinTTL);
  if (v9)
  {
    xpc_object_t v10 = v9;
    if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92F0]) {
      goto LABEL_2;
    }
    uint64_t v11 = xpc_uint64_get_value(v10);
    if (v11 > 0xFF) {
      goto LABEL_2;
    }
    xpc_dictionary_set_uint64(a2, kPFSubScrubMinTTL, v11);
    int v7 = 1;
  }

  xpc_object_t v12 = xpc_dictionary_get_value(a1, kPFSubScrubMaxMSS);
  if (v12)
  {
    uint64_t v13 = v12;
    if (MEMORY[0x1895CD824]() == MEMORY[0x1895F92F0])
    {
      uint64_t v14 = xpc_uint64_get_value(v13);
      if (!(v14 >> 16))
      {
        xpc_dictionary_set_uint64(a2, kPFSubScrubMaxMSS, v14);
        return 1LL;
      }
    }

uint64_t __PFStateCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() == MEMORY[0x1895F92F0] && (uint64_t value = xpc_uint64_get_value(a1), value <= 3))
  {
    xpc_dictionary_set_uint64(a2, kPFKeepState, value);
    return 1LL;
  }

  else
  {
    PFManagerErrorLog();
    return 0LL;
  }

BOOL __PFAllowOptsCheck(void *a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1895CD824]();
  uint64_t v5 = MEMORY[0x1895F9228];
  if (v4 == MEMORY[0x1895F9228])
  {
    BOOL v6 = kPFAllowOpts;
    BOOL value = xpc_BOOL_get_value(a1);
    xpc_dictionary_set_BOOL(a2, v6, value);
  }

  else
  {
    PFManagerErrorLog();
  }

  return v4 == v5;
}

uint64_t __PFExtFilterCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() == MEMORY[0x1895F92F0] && (uint64_t value = xpc_uint64_get_value(a1), value - 1 <= 2))
  {
    xpc_dictionary_set_uint64(a2, kPFExtFilter, value);
    return 1LL;
  }

  else
  {
    PFManagerErrorLog();
    return 0LL;
  }

uint64_t __PFExtMapCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() == MEMORY[0x1895F92F0] && (uint64_t value = xpc_uint64_get_value(a1), value - 1 <= 2))
  {
    xpc_dictionary_set_uint64(a2, kPFExtMap, value);
    return 1LL;
  }

  else
  {
    PFManagerErrorLog();
    return 0LL;
  }

uint64_t __PFRTableCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() == MEMORY[0x1895F92F0])
  {
    uint64_t value = xpc_uint64_get_value(a1);
  }

  else
  {
    if (MEMORY[0x1895CD824](a1) != MEMORY[0x1895F92E8])
    {
      PFManagerErrorLog();
      return 0LL;
    }

    string_ptr = xpc_string_get_string_ptr(a1);
    uint64_t value = if_nametoindex(string_ptr);
  }

  xpc_dictionary_set_uint64(a2, kPFRTableID, value);
  return 1LL;
}

BOOL __PFNatPassCheck(void *a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1895CD824]();
  uint64_t v5 = MEMORY[0x1895F9228];
  if (v4 == MEMORY[0x1895F9228])
  {
    BOOL v6 = kPFNATPass;
    BOOL value = xpc_BOOL_get_value(a1);
    xpc_dictionary_set_BOOL(a2, v6, value);
  }

  else
  {
    PFManagerErrorLog();
  }

  return v4 == v5;
}

BOOL __PFMaxStatesCheck(void *a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1895CD824]();
  uint64_t v5 = MEMORY[0x1895F92F0];
  if (v4 == MEMORY[0x1895F92F0])
  {
    uint64_t value = xpc_uint64_get_value(a1);
    xpc_dictionary_set_uint64(a2, kPFMaxStates, value);
  }

  else
  {
    PFManagerErrorLog();
  }

  return v4 == v5;
}

uint64_t __PFDummyNetCheck(void *a1, void *a2)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F9250]) {
    goto LABEL_2;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFSubDummyNetPipe);
  BOOL v6 = value;
  if (value)
  {
    if (MEMORY[0x1895CD824](value) != MEMORY[0x1895F92F0]) {
      goto LABEL_2;
    }
    uint64_t v7 = xpc_uint64_get_value(v6);
    if (v7 - 1 > 0xFFFE) {
      goto LABEL_2;
    }
    xpc_dictionary_set_uint64(a2, kPFSubDummyNetPipe, v7);
  }

  xpc_object_t v8 = xpc_dictionary_get_value(a1, kPFSubDummyNetPipeType);
  if (!v8
    || (xpc_object_t v9 = v8, MEMORY[0x1895CD824]() != MEMORY[0x1895F92F0])
    || xpc_uint64_get_value(v9) != 0x4000
    || (xpc_dictionary_set_uint64(a2, kPFSubDummyNetPipeType, 0x4000uLL), !v6))
  {
LABEL_2:
    PFManagerErrorLog();
    return 0LL;
  }

  return 1LL;
}

uint64_t __PFFilterConsistencyCheck(void *a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (xpc_dictionary_get_value(a1, kPFAction)) {
    unsigned __int8 uint64 = xpc_dictionary_get_uint64(a1, kPFAction);
  }
  else {
    unsigned __int8 uint64 = 0;
  }
  if (xpc_dictionary_get_value(a1, kPFProtocol)) {
    char v3 = xpc_dictionary_get_uint64(a1, kPFProtocol);
  }
  else {
    char v3 = 0;
  }
  snprintf(__str, 0x40uLL, "%s%s", kPFFrom, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str)) {
    unsigned __int8 v4 = xpc_dictionary_get_uint64(a1, __str);
  }
  else {
    unsigned __int8 v4 = 0;
  }
  snprintf(__str, 0x40uLL, "%s%s", kPFTo, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str)) {
    unsigned __int8 v5 = xpc_dictionary_get_uint64(a1, __str);
  }
  else {
    unsigned __int8 v5 = 0;
  }
  if (xpc_dictionary_get_value(a1, kPFAllowOpts)) {
    BOOL v6 = xpc_dictionary_get_BOOL(a1, kPFAllowOpts);
  }
  else {
    BOOL v6 = 0;
  }
  if (xpc_dictionary_get_value(a1, kPFFamily)) {
    int v7 = xpc_dictionary_get_uint64(a1, kPFFamily);
  }
  else {
    int v7 = 0;
  }
  if (xpc_dictionary_get_value(a1, kPFKeepState)) {
    int v8 = xpc_dictionary_get_uint64(a1, kPFKeepState);
  }
  else {
    int v8 = 0;
  }
  if (xpc_dictionary_get_value(a1, kPFReturnOptions)) {
    int v9 = xpc_dictionary_get_uint64(a1, kPFReturnOptions);
  }
  else {
    int v9 = 0;
  }
  if (v3 != 6 && v3 != 17 && v4 | v5
    || v6 && (uint64 > 0xCu || ((1 << uint64) & 0x1801) == 0)
    || v3 == 1 && v7 == 30
    || v3 == 58 && v7 == 2
    || v3 != 1
    && v3 != 58
    && (xpc_dictionary_get_value(a1, kPFSubICMPType) || xpc_dictionary_get_value(a1, kPFSubICMPCode))
    || !v7 && (xpc_dictionary_get_value(a1, kPFSubICMPType) || xpc_dictionary_get_value(a1, kPFSubICMPCode))
    || uint64 == 1 && v8
    || v3 != 6 && v9 == 1
    || (uint64_t result = 1LL, v9) && uint64 != 1)
  {
    PFManagerErrorLog();
    return 0LL;
  }

  return result;
}

uint64_t __PFRDRConsistencyCheck(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (xpc_dictionary_get_value(a1, kPFProtocol)) {
    char uint64 = xpc_dictionary_get_uint64(a1, kPFProtocol);
  }
  else {
    char uint64 = 0;
  }
  snprintf(__str, 0x40uLL, "%s%s", kPFFrom, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str)) {
    int v3 = xpc_dictionary_get_uint64(a1, __str);
  }
  else {
    int v3 = 0;
  }
  snprintf(__str, 0x40uLL, "%s%s", kPFTo, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str)) {
    int v4 = xpc_dictionary_get_uint64(a1, __str);
  }
  else {
    int v4 = 0;
  }
  snprintf(__str, 0x40uLL, "%s%s", kPFNATRDRAddress, kPFSubPortOperator);
  if (xpc_dictionary_get_value(a1, __str)) {
    int v5 = xpc_dictionary_get_uint64(a1, __str);
  }
  else {
    int v5 = 0;
  }
  uint64_t result = 1LL;
  if (uint64 != 6 && uint64 != 17 && (v3 || v4 || v5))
  {
    PFManagerErrorLog();
    return 0LL;
  }

  return result;
}

uint64_t __PFDummyNetConsistencyCheck(void *a1)
{
  if (xpc_dictionary_get_value(a1, kPFAction)) {
    int uint64 = xpc_dictionary_get_uint64(a1, kPFAction);
  }
  else {
    int uint64 = 0;
  }
  if (xpc_dictionary_get_value(a1, kPFDirection)) {
    int v3 = xpc_dictionary_get_uint64(a1, kPFDirection);
  }
  else {
    int v3 = 0;
  }
  if (xpc_dictionary_get_value(a1, kPFSubDummyNetPipe)) {
    int v4 = xpc_dictionary_get_uint64(a1, kPFSubDummyNetPipe);
  }
  else {
    int v4 = 0;
  }
  if (xpc_dictionary_get_value(a1, kPFKeepState) && xpc_dictionary_get_uint64(a1, kPFKeepState)
    || uint64 == 11 && (v4 - 0x10000) < 0xFFFF0001
    || uint64 == 11 && v4 && !v3
    || (uint64_t result = 1LL, uint64 == 12) && v4)
  {
    PFManagerErrorLog();
    return 0LL;
  }

  return result;
}

BOOL PFCheckNATRule(void *a1, void *a2)
{
  int v11 = -1;
  xpc_object_t value = xpc_dictionary_get_value(a1, kPFDirection);
  BOOL v5 = value != 0LL;
  xpc_object_t v6 = xpc_dictionary_get_value(a1, kPFProtocol);
  if (v6)
  {
    BOOL v5 = 1LL;
  }

  xpc_object_t v7 = xpc_dictionary_get_value(a1, kPFFamily);
  if (v7)
  {
    if (!__PFFamilyCheck(v7, a2, &v11)) {
      return 0LL;
    }
    BOOL v5 = 1LL;
  }

  xpc_object_t v8 = xpc_dictionary_get_value(a1, kPFFrom);
  if (v8)
  {
    BOOL v5 = 1LL;
  }

  xpc_object_t v9 = xpc_dictionary_get_value(a1, kPFTo);
  if (v9) {
    return __PFAddressCheck(v9, a2, kPFTo, &v11) != 0;
  }
  return v5;
}

uint64_t __PFInterfaceExists(const char *a1)
{
  BOOL v5 = 0LL;
  if (getifaddrs(&v5) < 0)
  {
    int v4 = __error();
    strerror(*v4);
    PFManagerErrorLog();
  }

  else
  {
    uint64_t v2 = &v5;
    while (1)
    {
      uint64_t v2 = (ifaddrs **)*v2;
      if (!v2) {
        break;
      }
      if (!strncmp((const char *)v2[1], a1, 0x10uLL))
      {
        MEMORY[0x1895CD5CC](v5);
        return 1LL;
      }
    }

    MEMORY[0x1895CD5CC](v5);
  }

  return 0LL;
}

uint64_t __PFIPAddressCheck(const char *a1, int *a2)
{
  xpc_object_t v8 = 0LL;
  memset(&v9, 0, sizeof(v9));
  v9.ai_flags = 4;
  if (getaddrinfo(a1, 0LL, &v9, &v8)) {
    return 0LL;
  }
  int v4 = v8;
  int ai_family = v8->ai_family;
  if (ai_family == 30 || ai_family == 2)
  {
    *a2 = ai_family;
    uint64_t v3 = 1LL;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  freeaddrinfo(v4);
  return v3;
}

uint64_t __PFPortCheck(void *a1, void *a2, const char *a3)
{
  if (MEMORY[0x1895CD824]() == MEMORY[0x1895F92E8])
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    xpc_object_t v7 = getservbyname(string_ptr, "tcp");
    if (v7 || (xpc_object_t v7 = getservbyname(string_ptr, "udp")) != 0LL)
    {
      uint64_t s_port = v7->s_port;
LABEL_8:
      xpc_dictionary_set_uint64(a2, a3, s_port);
      return 1LL;
    }
  }

  else if (MEMORY[0x1895CD824](a1) == MEMORY[0x1895F92F0])
  {
    uint64_t s_port = xpc_uint64_get_value(a1);
    if (!(s_port >> 16)) {
      goto LABEL_8;
    }
  }

  PFManagerErrorLog();
  return 0LL;
}

uint64_t __PFOperatorCheck(void *a1, int a2, int a3, void *a4, const char *a5)
{
  if (MEMORY[0x1895CD824]() != MEMORY[0x1895F92F0]) {
    goto LABEL_2;
  }
  uint64_t value = xpc_uint64_get_value(a1);
  if (value - 2 <= 5)
  {
    if (!a2 || a3) {
      goto LABEL_2;
    }
    goto LABEL_12;
  }

  if (value - 8 < 2)
  {
LABEL_10:
    if (!a2 || (a3 & 1) == 0) {
      goto LABEL_2;
    }
LABEL_12:
    xpc_dictionary_set_uint64(a4, a5, value);
    return 1LL;
  }

  if (value)
  {
    if (value != 1)
    {
LABEL_2:
      PFManagerErrorLog();
      return 0LL;
    }

    goto LABEL_10;
  }

  return 1LL;
}

BOOL __PFNegatedCheck(void *a1, void *a2, const char *a3)
{
  uint64_t v6 = MEMORY[0x1895CD824]();
  uint64_t v7 = MEMORY[0x1895F9228];
  if (v6 == MEMORY[0x1895F9228])
  {
    BOOL value = xpc_BOOL_get_value(a1);
    xpc_dictionary_set_BOOL(a2, a3, value);
  }

  else
  {
    PFManagerErrorLog();
  }

  return v6 == v7;
}

uint64_t __PFParseFlags(_BYTE *a1)
{
  char v1 = *a1;
  if (*a1)
  {
    LODWORD(v2) = 0;
    uint64_t v3 = a1 + 1;
    do
    {
      int v4 = memchr("FSRPAUEW", v1, 9uLL);
      if (!v4) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v2 = v2 | (1 << ((_BYTE)v4 - "FSRPAUEW"));
      int v5 = *v3++;
      char v1 = v5;
    }

    while (v5);
    if ((_DWORD)v2) {
      return v2;
    }
  }

  return 255LL;
}

unint64_t __PFRuleStrToNum(const char *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11[0] = xmmword_18A29B810;
  v11[1] = *(_OWORD *)&off_18A29B820;
  v11[2] = xmmword_18A29B830;
  v11[3] = *(_OWORD *)&off_18A29B840;
  DWORD2(v11[0]) = *__error();
  *__error() = 0;
  unint64_t v4 = strtoll(a1, &__endptr, 10);
  unint64_t v5 = v4;
  if (__endptr == a1 || *__endptr)
  {
    int v6 = 0;
    uint64_t v7 = 1LL;
    goto LABEL_4;
  }

  if (v4 == 0x8000000000000000LL)
  {
    __error();
LABEL_15:
    int v6 = 0;
    uint64_t v7 = 2LL;
    goto LABEL_4;
  }

  if ((v4 & 0x8000000000000000LL) != 0) {
    goto LABEL_15;
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __error();
LABEL_17:
    int v6 = 0;
    uint64_t v7 = 3LL;
    goto LABEL_4;
  }

  if (v4 >= 0x100) {
    goto LABEL_17;
  }
  uint64_t v7 = 0LL;
  int v6 = 1;
LABEL_4:
  if (a2) {
    *a2 = *(void *)&v11[v7];
  }
  int v8 = DWORD2(v11[v7]);
  *__error() = v8;
  if (v6) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t PFXPCGetResponse()
{
  return __pfresponse;
}

uint64_t PFXPCSetupAndSend( dispatch_queue_s *a1, dispatch_queue_s *a2, void *a3, const char *a4, const char *a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  if (!__pfconnection)
  {
    __pfconnection = (uint64_t)xpc_connection_create_mach_service((const char *)pfXPCService, a2, 2uLL);
    if (__pfconnection)
    {
      if (MEMORY[0x1895CD824]() == MEMORY[0x1895F9238])
      {
        xpc_connection_set_event_handler((xpc_connection_t)__pfconnection, &__block_literal_global);
        xpc_connection_resume((xpc_connection_t)__pfconnection);
        goto LABEL_2;
      }

      if (__pfconnection)
      {
        xpc_release((xpc_object_t)__pfconnection);
        uint64_t v18 = 0LL;
        __pfconnection = 0LL;
        return v18;
      }
    }

    return 0LL;
  }

LABEL_26:
      xpc_dictionary_set_value(v16, v19, a3);
LABEL_27:
      if (a8)
      {
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 0x40000000LL;
        handler[2] = ____PFXPCSendMessage_block_invoke;
        handler[3] = &unk_18A29B898;
        handler[4] = a8;
        xpc_connection_send_message_with_reply((xpc_connection_t)__pfconnection, v16, a1, handler);
        uint64_t v18 = 1LL;
      }

      else
      {
        xpc_object_t v20 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)__pfconnection, v16);
        uint64_t v18 = __PFXPCResponseHandler(v20, 0LL);
      }

      xpc_release(v16);
      break;
  }

  return v18;
}

BOOL PFXPCCleanup()
{
  uint64_t v0 = __pfconnection;
  if (__pfconnection)
  {
    xpc_connection_cancel((xpc_connection_t)__pfconnection);
    xpc_release((xpc_object_t)__pfconnection);
    __pfconnection = 0LL;
  }

  return v0 != 0;
}

uint64_t __PFXPCResponseHandler(void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    uint64_t v4 = MEMORY[0x1895CD824]();
    if (v4 == MEMORY[0x1895F9250])
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v3, (const char *)pfXPCKeyType);
      if (uint64 != 2000)
      {
        if (uint64 == 2001)
        {
          if (!a2)
          {
            __pfresponse = (uint64_t)v3;
            return 1LL;
          }

          uint64_t v5 = 1LL;
          goto LABEL_17;
        }

        if (uint64 != 2002)
        {
          uint64_t v5 = 0LL;
          if (!a2) {
            return v5;
          }
          goto LABEL_17;
        }

        PFManagerErrorLog();
        PFXPCCleanup();
      }

      if (a2)
      {
LABEL_16:
        uint64_t v5 = 0LL;
LABEL_17:
        (*(void (**)(uint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v3);
        return v5;
      }
    }

    else
    {
      if (v4 == MEMORY[0x1895F9268]) {
        xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F91B0]);
      }
      PFManagerErrorLog();
      PFXPCCleanup();
      if (a2)
      {
        uint64_t v3 = 0LL;
        goto LABEL_16;
      }
    }

    xpc_release(v3);
LABEL_20:
    uint64_t v5 = 0LL;
    __pfresponse = 0LL;
    return v5;
  }

  PFXPCCleanup();
  if (!a2)
  {
    PFManagerErrorLog();
    goto LABEL_20;
  }

  PFManagerErrorLog();
  (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0LL, 0LL);
  return 0LL;
}

void __PFManagerLogCreate_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_18883C000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "Couldn't create os log object", v0, 2u);
}

void __PFManagerRelease_cold_1()
{
  __assert_rtn("__PFManagerRelease", "PFManager.c", 92, "CFArrayGetCount(manager->clients) == 0");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
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

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1895FB4E0](a1, a2, a3, a4);
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x1895FB568](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1895FB5A0](a1);
}

protoent *__cdecl getprotobyname(const char *a1)
{
  return (protoent *)MEMORY[0x1895FB640](a1);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1895FB660](a1);
}

servent *__cdecl getservbyname(const char *a1, const char *a2)
{
  return (servent *)MEMORY[0x1895FB6B8](a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1895FB7D8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1A0](__str, __endptr, *(void *)&__base);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FD7E8]();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1895FD8C0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
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

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDA70](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
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

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1895FE0C0](type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}