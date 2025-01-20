int64_t _xpc_interface_routine(uint64_t a1, xpc_object_t xdict, xpc_object_t *a3, int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  int64_t int64;
  uint64_t v14;
  xpc_object_t v15;
  uint64_t v16;
  uint64_t uint64;
  uint64_t v18;
  int v19;
  uint64_t self_audit_token;
  int v21;
  int v22;
  xpc_object_t xdicta;
  __int128 v24;
  __int128 v25;
  v10 = MEMORY[0x1895F8D60];
  if (*(void *)(MEMORY[0x1895F8D60] + 16LL) == -1LL) {
    v11 = *(void *)(MEMORY[0x1895F8D60] + 24LL);
  }
  else {
    v11 = _os_alloc_once();
  }
  if (*(_BYTE *)v11 || *(_BYTE *)(v11 + 4)) {
    return 141LL;
  }
  xdicta = 0LL;
  if (!*(_BYTE *)(v11 + 41)) {
    xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
  }
  v14 = 2LL;
  if (!*(_BYTE *)(v11 + 88)) {
    v14 = 6LL;
  }
  int64 = MEMORY[0x1895B7300](*(void *)(v11 + 24), a1, xdict, &xdicta, v14 | a5);
  if (xdicta && xpc_dictionary_get_string(xdicta, "xpc-fault")) {
    _XPC_MISUSE_FAULT();
  }
  v15 = xdicta;
  if ((_DWORD)int64 || (int64 = xpc_dictionary_get_int64(xdicta, "error"), v15 = xdicta, (_DWORD)int64))
  {
    if (v15) {
      xpc_release(v15);
    }
  }

  else
  {
    if (*(void *)(v10 + 16) == -1LL) {
      v16 = *(void *)(v10 + 24);
    }
    else {
      v16 = _os_alloc_once();
    }
    if (!*(_BYTE *)(v16 + 88))
    {
      v24 = 0u;
      v25 = 0u;
      xpc_dictionary_get_audit_token();
      if (DWORD1(v25) != 1) {
        _xpc_interface_routine_cold_6(SDWORD1(v25));
      }
      if (DWORD1(v24)) {
        _xpc_interface_routine_cold_5();
      }
      if (a4)
      {
        uint64 = xpc_dictionary_get_uint64(v15, "req_pid");
        v18 = xpc_dictionary_get_uint64(v15, "rec_execcnt");
        self_audit_token = _xpc_get_self_audit_token();
        v21 = *(_DWORD *)(self_audit_token + 20);
        if (!v21 || (v22 = *(_DWORD *)(self_audit_token + 28)) == 0) {
          _xpc_interface_routine_cold_2();
        }
        if (v22 != v19) {
          _xpc_interface_routine_cold_3();
        }
      }
    }

    int64 = 0LL;
    *a3 = xdicta;
  }

  return int64;
}

uint64_t _xpc_interface_routine_async(int a1, xpc_object_t xdict)
{
  if (*(void *)(MEMORY[0x1895F8D60] + 16LL) == -1LL) {
    v3 = *(_BYTE **)(MEMORY[0x1895F8D60] + 24LL);
  }
  else {
    v3 = (_BYTE *)_os_alloc_once();
  }
  if (!*v3 && !v3[4])
  {
    if (!v3[41]) {
      xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
    }
    JUMPOUT(0x1895B730CLL);
  }

  return 141LL;
}

int64_t _xpc_service_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

int64_t _xpc_domain_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

int64_t _launch_job_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

int64_t _launch_job_query_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

int64_t _launch_server_test_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

uint64_t _XPC_MISUSE_FAULT()
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  if ((_dyld_get_image_uuid() & 1) == 0)
  {
    v6 = 0LL;
    uint64_t v7 = 0LL;
  }

  if ((_dyld_get_shared_cache_uuid() & 1) != 0)
  {
    _dyld_get_shared_cache_range();
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
  }

  _os_log_simple();
  bzero(&v6, 0x400uLL);
  int v0 = backtrace(&v6, 128);
  v1 = backtrace_symbols(&v6, v0);
  if (v1)
  {
    v2 = v1;
    if (v0 >= 1)
    {
      uint64_t v3 = v0;
      v4 = v1;
      do
      {
        if (!*v4) {
          break;
        }
        uint64_t v8 = 0LL;
        uint64_t v9 = 0LL;
        if ((_dyld_get_image_uuid() & 1) == 0)
        {
          uint64_t v8 = 0LL;
          uint64_t v9 = 0LL;
        }

        if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
          _dyld_get_shared_cache_range();
        }
        ++v4;
        _os_log_simple();
        --v3;
      }

      while (v3);
    }

    free(v2);
  }

  uint64_t result = os_fault_with_payload();
  if ((_DWORD)result)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
    }

    if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
      _dyld_get_shared_cache_range();
    }
    __error();
    __error();
    xpc_strerror();
    return _os_log_simple();
  }

  return result;
}

const char *_xpc_get_embedded_crash_message(void)
{
  return (const char *)qword_18C6F51C8;
}

uint64_t _der_vm_context_to_xpc(__int128 *a1)
{
  __int128 v2 = a1[1];
  __int128 v5 = *a1;
  __int128 v6 = v2;
  __int128 v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 6);
  __int128 v3 = a1[1];
  __int128 v5 = *a1;
  __int128 v6 = v3;
  __int128 v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 6);
  return _objectForActiveContext((uint64_t *)&v5);
}

uint64_t _objectForActiveContext(uint64_t *a1)
{
  uint64_t v1 = *a1;
  switch(der_vm_CEType_from_context())
  {
    case 1u:
      xpc_object_t empty = xpc_dictionary_create_empty();
      goto LABEL_4;
    case 2u:
      xpc_object_t empty = xpc_array_create_empty();
LABEL_4:
      uint64_t v3 = (uint64_t)empty;
      der_vm_iterate();
      goto LABEL_10;
    case 3u:
      int64_t v4 = der_vm_integer_from_context();
      uint64_t no_copy = (uint64_t)xpc_int64_create(v4);
      goto LABEL_9;
    case 4u:
      string_for_context();
      uint64_t no_copy = xpc_string_create_no_copy();
      goto LABEL_9;
    case 5u:
      char v6 = der_vm_BOOL_from_context();
      uint64_t no_copy = (uint64_t)xpc_BOOL_create(v6);
      goto LABEL_9;
    case 6u:
      __int128 v7 = (const void *)der_vm_data_from_context();
      uint64_t no_copy = (uint64_t)xpc_data_create(v7, v8);
LABEL_9:
      uint64_t v3 = no_copy;
LABEL_10:
      uint64_t result = v3;
      break;
    default:
      uint64_t v10 = (*(uint64_t (**)(uint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "_objectForActiveContext",  "CoreEntitlements: unknown DER type");
      uint64_t result = xpc_create_from_ce_der(v10);
      break;
  }

  return result;
}

uint64_t xpc_create_from_ce_der()
{
  __int128 v11 = 0uLL;
  uint64_t v12 = 0LL;
  uint64_t v0 = CEValidate();
  uint64_t result = 0LL;
  __int128 v2 = (void *)MEMORY[0x1896135D8];
  if (v0 == *MEMORY[0x1896135D8])
  {
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v3 = v11;
    *(void *)&__int128 v4 = v12;
    if (CEAcquireUnmanagedContext() == *v2)
    {
      __int128 v3 = v7;
      __int128 v4 = v8;
      __int128 v5 = v9;
      uint64_t v6 = v10;
      return _der_vm_context_to_xpc(&v3);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t xpc_create_from_ce_der_with_key(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0uLL;
  size_t v18 = 0LL;
  uint64_t v4 = CEValidate();
  uint64_t result = 0LL;
  uint64_t v6 = (void *)MEMORY[0x1896135D8];
  if (v4 == *MEMORY[0x1896135D8])
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v19 = v17;
    size_t v20 = v18;
    if (CEAcquireUnmanagedContext() == *v6)
    {
      uint64_t v35 = 0LL;
      __int128 v34 = 0u;
      __int128 v33 = 0u;
      __int128 v32 = 0u;
      __int128 v31 = 0u;
      __int128 v30 = 0u;
      __int128 v29 = 0u;
      __int128 v28 = 0u;
      __int128 v27 = 0u;
      __int128 v26 = 0u;
      __int128 v25 = 0u;
      __int128 v24 = 0u;
      __int128 v23 = 0u;
      __int128 v22 = 0u;
      __int128 v21 = 0u;
      *(void *)&__int128 v19 = 0x4000000000000001LL;
      *((void *)&v19 + 1) = a3;
      size_t v20 = strlen(a3);
      uint64_t v12 = 0LL;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v9 = 0u;
      der_vm_execute_nocopy();
      memset(v7, 0, sizeof(v7));
      uint64_t v8 = 0LL;
      return _der_vm_context_to_xpc(v7);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t _manufacturingCallback(uint64_t *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 29);
  if (v3 == 2)
  {
    if (*((_DWORD *)a1 + 28) == 1)
    {
      __int128 v7 = (void *)a1[15];
      uint64_t v18 = 0LL;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v15 = 0u;
      memset((char *)v19 + 8, 0, 248);
      __int128 v8 = *(_OWORD *)(a1 + 9);
      v13[0] = *(_OWORD *)(a1 + 7);
      v13[1] = v8;
      v13[2] = *(_OWORD *)(a1 + 11);
      uint64_t v14 = a1[13];
      der_vm_execute();
      __int128 v9 = (char *)string_for_context();
      v19[0] = xmmword_187DB9A70;
      der_vm_execute();
      xpc_object_t active = (xpc_object_t)_objectForActiveContext(v13);
      xpc_dictionary_set_value(v7, v9, active);
      free(v9);
    }

    else
    {
      xpc_object_t active = xpc_array_create_empty();
      __int128 v11 = *(_OWORD *)(a1 + 9);
      v19[0] = *(_OWORD *)(a1 + 7);
      v19[1] = v11;
      v19[2] = *(_OWORD *)(a1 + 11);
      *(void *)&v19[3] = a1[13];
      if (der_vm_iterate() != *MEMORY[0x1896135D8])
      {
        (*(void (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_manufacturingCallback",  "CoreEntitlements: Couldn't iterate over DER entitlements\n");
        return (uint64_t)string_for_context();
      }

      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, active);
    }

    uint64_t v6 = active;
    goto LABEL_10;
  }

  if (v3)
  {
    if (*((_DWORD *)a1 + 28) == 2)
    {
      __int128 v4 = *(_OWORD *)(a1 + 9);
      v19[0] = *(_OWORD *)(a1 + 7);
      v19[1] = v4;
      v19[2] = *(_OWORD *)(a1 + 11);
      *(void *)&v19[3] = a1[13];
      __int128 v5 = (void *)_objectForActiveContext(v19);
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, v5);
      uint64_t v6 = v5;
LABEL_10:
      xpc_release(v6);
      return 1LL;
    }

    (*(void (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_manufacturingCallback",  "CoreEntitlements: not a sequence");
  }

  else
  {
    (*(void (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_manufacturingCallback",  "CoreEntitlements: unknown DER type");
  }

  return (uint64_t)string_for_context();
}

void *string_for_context()
{
  uint64_t v0 = (const void *)der_vm_string_from_context();
  size_t v2 = v1;
  int v3 = _xpc_alloc(v1 + 1);
  memcpy(v3, v0, v2);
  return v3;
}

void *_ce_malloc(int a1, size_t __size)
{
  return malloc(__size);
}

void _ce_free(int a1, void *a2)
{
}

void _ce_log( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void _ce_abort( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  qword_18C6F51C8 = (uint64_t)"Data corruption: CoreEntitlements has aborted due to an unrecoverable error";
  __break(1u);
}

void *_xpc_alloc(size_t __size)
{
  do
  {
    size_t v2 = calloc(1uLL, __size);
    if (v2) {
      break;
    }
    if (*__error() != 12 && *__error()) {
      _xpc_alloc_cold_1();
    }
  }

  while (_waiting4memory());
  return v2;
}

int64_t set_enabled_state(const char *a1, int a2)
{
  if (a2) {
    uint64_t v3 = 808LL;
  }
  else {
    uint64_t v3 = 809LL;
  }
  launchd_request = _create_launchd_request(7);
  xpc_object_t v5 = xpc_array_create(0LL, 0LL);
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, a1);
  xpc_dictionary_set_value(launchd_request, "names", v5);
  xpc_object_t v8 = 0LL;
  int64_t v6 = _xpc_domain_routine(v3, launchd_request, &v8);

  return v6;
}

void *_create_launchd_request(int a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v3 = v2;
  if (a1 == 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = 7LL;
  }
  xpc_dictionary_set_uint64(v2, "type", v4);
  xpc_dictionary_set_uint64(v3, "handle", 0LL);
  return v3;
}

BOOL get_enabled_state(int a1, const char *a2, _BYTE *a3)
{
  launchd_request = _create_launchd_request(a1);
  xpc_dictionary_set_string(launchd_request, "name", a2);
  xpc_object_t xdict = 0LL;
  if (_xpc_domain_routine(811LL, launchd_request, &xdict))
  {
    _os_assumes_log();
    BOOL v6 = 0LL;
  }

  else
  {
    BOOL v6 = xpc_dictionary_get_BOOL(xdict, "loaded");
    BOOL v7 = xpc_dictionary_get_BOOL(xdict, "enabled");
    if (v6 && v7)
    {
      BOOL v6 = 1LL;
      *a3 = 1;
    }

    else if (!v6 && !v7)
    {
      BOOL v6 = 0LL;
      *a3 = 1;
    }
  }

  return v6;
}

uint64_t submit_job(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2) {
    xpc_dictionary_set_BOOL(v3, "ForceEnableHack", 1);
  }
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_value(v5, "SubmitJob", v4);
  BOOL v6 = (_launch_data *)_launch_msg2();
  uint64_t errno = launch_data_get_errno(v6);
  xpc_release(v6);

  return errno;
}

int64_t remove_job(const char *a1, char a2)
{
  xpc_object_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v10 = 0LL;
  int64_t v3 = _xpc_domain_routine(801LL, v2, &v10);
  if (!(_DWORD)v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
    uint64_t v5 = (uint64_t)v10;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __remove_job_block_invoke;
    v8[3] = &unk_18A140198;
    dispatch_semaphore_t v9 = v4;
    BOOL v6 = v4;
    _remove_job_wait_for_completion(v5, v8);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }

  return v3;
}

id _remove_job_create_request(const char *a1, int a2, uint64_t a3, char a4)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", a2);
  xpc_dictionary_set_uint64(empty, "handle", a3);
  xpc_dictionary_set_string(empty, "name", a1);
  xpc_dictionary_set_BOOL(empty, "legacy-service-lookup", 1);
  if ((a4 & 1) != 0) {
    xpc_dictionary_set_BOOL(empty, "attempt-unload-protected", 1);
  }
  if ((a4 & 2) != 0) {
    xpc_dictionary_set_BOOL(empty, "wait", 1);
  }
  return empty;
}

void _remove_job_wait_for_completion(uint64_t a1, void *a2)
{
  xpc_object_t v2 = a2;
  unsigned int v3 = xpc_dictionary_copy_mach_send();
  if (v3 - 1 >= 0xFFFFFFFE)
  {
    v2[2](v2);
  }

  else
  {
    uintptr_t v4 = v3;
    dispatch_get_global_queue(0LL, 0LL);
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1895F8B48], v4, 1uLL, v5);

    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = ___remove_job_wait_for_completion_block_invoke;
    handler[3] = &unk_18A1401C0;
    dispatch_source_t v9 = v6;
    xpc_object_t v10 = v2;
    BOOL v7 = v6;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate(v7);
  }
}

uint64_t __remove_job_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ___remove_job_wait_for_completion_block_invoke(uint64_t a1)
{
}

uint64_t ___remove_job_wait_for_completion_block_invoke_2(uint64_t a1)
{
  uint64_t result = _xpc_mach_port_release(*(_DWORD *)(a1 + 32));
  if ((_DWORD)result) {
    return _os_assumes_log();
  }
  return result;
}

char *CFStringJustCopyTheUTF8String(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v4 = MaximumSizeForEncoding + 1;
  if (__OFADD__(MaximumSizeForEncoding, 1LL)) {
    return 0LL;
  }
  uint64_t v5 = (char *)_xpc_alloc(MaximumSizeForEncoding + 1);
  if (!CFStringGetCString(a1, v5, v4, 0x8000100u)) {
    CFStringJustCopyTheUTF8String_cold_1();
  }
  return v5;
}

CFNumberRef CFCreateFromLaunchData(_launch_data *a1)
{
  int v16 = 0;
  int v17 = -1;
  launch_data_type_t type = launch_data_get_type(a1);
  CFNumberRef result = 0LL;
  switch(type)
  {
    case LAUNCH_DATA_DICTIONARY:
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      launch_data_dict_iterate(a1, (launch_data_dict_iterator_t)_ldval2cf, Mutable);
      CFDictionaryRef Copy = CFDictionaryCreateCopy(0LL, Mutable);
      goto LABEL_9;
    case LAUNCH_DATA_ARRAY:
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228]);
      if (MEMORY[0x1895B748C](a1))
      {
        unint64_t v6 = 0LL;
        do
        {
          uint64_t v7 = MEMORY[0x1895B7498](a1, v6);
          xpc_object_t v8 = (const void *)CFCreateFromLaunchData(v7);
          if (v8)
          {
            dispatch_source_t v9 = v8;
            CFArrayAppendValue(Mutable, v8);
            CFRelease(v9);
          }

          ++v6;
        }

        while (v6 < MEMORY[0x1895B748C](a1));
      }

      CFDictionaryRef Copy = CFArrayCreateCopy(0LL, Mutable);
LABEL_9:
      CFDictionaryRef v10 = Copy;
      CFRelease(Mutable);
      return v10;
    case LAUNCH_DATA_FD:
      __int128 v11 = (uint64_t *)&v17;
      goto LABEL_18;
    case LAUNCH_DATA_INTEGER:
      uint64_t v18 = MEMORY[0x1895B74D4](a1);
      __int128 v11 = &v18;
      CFNumberType v12 = kCFNumberLongLongType;
      goto LABEL_19;
    case LAUNCH_DATA_REAL:
      uint64_t v18 = MEMORY[0x1895B74E0](a1);
      __int128 v11 = &v18;
      CFNumberType v12 = kCFNumberDoubleType;
      goto LABEL_19;
    case LAUNCH_DATA_BOOL:
      int v13 = MEMORY[0x1895B74BC](a1);
      uint64_t v14 = MEMORY[0x189604DE8];
      if (!v13) {
        uint64_t v14 = MEMORY[0x189604DE0];
      }
      return *(CFNumberRef *)v14;
    case LAUNCH_DATA_STRING:
      __int128 v15 = (const char *)MEMORY[0x1895B74EC](a1);
      return (CFNumberRef)CFStringCreateWithCString(0LL, v15, 0x8000100u);
    case LAUNCH_DATA_MACHPORT:
      __int128 v11 = (uint64_t *)&v16;
LABEL_18:
      CFNumberType v12 = kCFNumberIntType;
LABEL_19:
      CFNumberRef result = CFNumberCreate(0LL, v12, v11);
      break;
    default:
      return result;
  }

  return result;
}

CFArrayRef CFArrayCreateFromDictionaryValues(const __CFDictionary *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228]);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_add_array_value, Mutable);
  CFArrayRef Copy = CFArrayCreateCopy(0LL, Mutable);
  CFRelease(Mutable);
  return Copy;
}

void _add_array_value(int a1, const void *a2, CFMutableArrayRef theArray)
{
}

void _ldval2cf(uint64_t a1, const char *a2, __CFDictionary *a3)
{
  CFStringRef v5 = CFStringCreateWithCString(0LL, a2, 0x8000100u);
  unint64_t v6 = (const void *)CFCreateFromLaunchData(a1);
  if (v6)
  {
    uint64_t v7 = v6;
    CFDictionarySetValue(a3, v5, v6);
    CFRelease(v7);
  }

  CFRelease(v5);
}

uint64_t _waiting4memory()
{
  return 1LL;
}

char *_xpc_strdup(const char *a1)
{
  for (i = a1; ; a1 = i)
  {
    CFNumberRef result = strdup(a1);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        _xpc_strdup_cold_1();
      }
    }

    _waiting4memory();
  }

  return result;
}

char *_xpc_asprintf(char *a1, ...)
{
  unsigned int v3 = 0LL;
  while (1)
  {
    vasprintf(&v3, a1, va);
    CFNumberRef result = v3;
    if (v3) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        _xpc_strdup_cold_1();
      }
    }

    _waiting4memory();
  }

  return result;
}

BOOL _xpc_has_suffix(const char *a1, const char *a2)
{
  CFIndex v4 = &a1[strlen(a1)];
  CFStringRef v5 = &v4[-strlen(a2)];
  return v5 >= a1 && strcmp(v5, a2) == 0;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

uint64_t _xpc_mach_port_release(mach_port_name_t name)
{
  return mach_port_deallocate(*MEMORY[0x1895FBBE0], name);
}

uint64_t _xpc_get_self_audit_token()
{
  if (*(void *)(MEMORY[0x1895F8D60] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895F8D60] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  if (*(_BYTE *)(v0 + 41))
  {
    if (*(void *)(v0 + 48) != -1LL) {
      dispatch_once_f((dispatch_once_t *)(v0 + 48), (void *)(v0 + 56), (dispatch_function_t)_fetch_self_token);
    }
  }

  else
  {
    _fetch_self_token((task_info_t)(v0 + 56));
  }

  return v0 + 56;
}

uint64_t _fetch_self_token(task_info_t task_info_out)
{
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1895FBBE0], 0xFu, task_info_out, &task_info_outCnt)) {
    _xpc_interface_routine_cold_2();
  }
  integer_t v2 = task_info_out[5];
  uint64_t result = getpid();
  if (v2 != (_DWORD)result || !task_info_out[7]) {
    _xpc_interface_routine_cold_2();
  }
  return result;
}

void *_xpc_copy_plist(const char *a1)
{
  size_t v1 = (int *)open(a1, 0);
  if ((_DWORD)v1 == -1) {
    return 0LL;
  }
  integer_t v2 = v1;
  memset(&v5, 0, sizeof(v5));
  else {
    unsigned int v3 = _copy_plist_from_fd((int)v2, (uint64_t)&v5, 0LL, 0LL);
  }
  _xpc_strict_close(v2);
  return v3;
}

void *_copy_plist_from_fd(int a1, uint64_t a2, void *a3, ssize_t *a4)
{
  xpc_object_t v8 = _xpc_alloc(*(void *)(a2 + 96));
  ssize_t v9 = read(a1, v8, *(void *)(a2 + 96));
  ssize_t v10 = v9;
  if (v9 != *(void *)(a2 + 96))
  {
    if (v9 && (v9 != -1 || *__error())) {
      _os_assumes_log();
    }
    goto LABEL_8;
  }

  uint64_t v11 = xpc_create_from_plist();
  CFNumberType v12 = (void *)v11;
  if (v11)
  {
    if (MEMORY[0x1895B7750](v11) != MEMORY[0x1895F9250])
    {
      xpc_release(v12);
LABEL_8:
      CFNumberType v12 = 0LL;
      goto LABEL_9;
    }

    if (a3 && a4)
    {
      *a4 = v10;
      *a3 = v8;
      return v12;
    }
  }

LABEL_9:
  free(v8);
  return v12;
}

int *_xpc_strict_close(int *result)
{
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = (int *)close((int)result);
    if ((_DWORD)result)
    {
      if (*__error()) {
        _os_assumes_log();
      }
      uint64_t result = __error();
      if (*result == 9) {
        _xpc_strict_close_cold_1();
      }
    }
  }

  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_assert_log();
}

BOOL SMJobIsEnabled(__CFString *a1, const __CFString *a2, _BYTE *a3)
{
  if (a1 == @"kSMDomainSystemLaunchd") {
    int v4 = 1;
  }
  else {
    int v4 = 7;
  }
  stat v5 = CFStringJustCopyTheUTF8String(a2);
  char v8 = 0;
  BOOL enabled_state = get_enabled_state(v4, v5, &v8);
  if (a3) {
    *a3 = v8;
  }
  free(v5);
  return enabled_state;
}

BOOL SMJobSetEnabled()
{
  size_t v1 = v0;
  int v3 = v2;
  int v5 = v4;
  v42[2] = *(char **)MEMORY[0x1895F89C0];
  uint64_t v7 = CFStringJustCopyTheUTF8String(v6);
  char v8 = v7;
  if (v3)
  {
    int v9 = set_enabled_state(v7, v5 != 0);
    if (v9)
    {
      int v10 = v9;
      uint64_t v11 = 0LL;
      CFNumberType v12 = 0LL;
      goto LABEL_41;
    }
  }

  os_variant_has_internal_content();
  bzero(v39, 0x400uLL);
  uint64_t started = sysdir_start_search_path_enumeration_private();
  uint64_t v14 = MEMORY[0x1895B7624](started, v39);
  if (!(_DWORD)v14)
  {
LABEL_12:
    v38 = v1;
    os_variant_has_internal_content();
    bzero(v41, 0x400uLL);
    uint64_t v19 = sysdir_start_search_path_enumeration_private();
    while (1)
    {
      uint64_t v20 = MEMORY[0x1895B7624](v19, v41);
      if (!(_DWORD)v20) {
        break;
      }
      uint64_t v19 = v20;
      bzero(__str, 0x800uLL);
      snprintf(__str, 0x800uLL, "%s/%s", v41, "LaunchDaemons");
      v42[0] = __str;
      v42[1] = 0LL;
      __int128 v21 = fts_open(v42, 92, 0LL);
      if (v21)
      {
        __int128 v22 = v21;
        uint64_t v23 = 0LL;
LABEL_16:
        uint64_t v24 = v23;
        while (1)
        {
          __int128 v25 = fts_read(v22);
          uint64_t v11 = (char *)v25;
          if (!v25) {
            break;
          }
          int fts_info = v25->fts_info;
          if (fts_info != 11)
          {
            switch(fts_info)
            {
              case 7:
                if (v25->fts_errno) {
                  _os_assumes_log();
                }
                break;
              case 6:
                --v23;
                break;
              case 1:
                uint64_t v23 = 1LL;
                if (v24)
                {
                  uint64_t v23 = v24 + 1;
                  fts_set(v22, v25, 4);
                }

                break;
            }

            goto LABEL_16;
          }

          if (_xpc_has_suffix(v25->fts_path, ".plist"))
          {
            __int128 v27 = _xpc_copy_plist(*((const char **)v11 + 6));
            if (!v27) {
              goto LABEL_16;
            }
            __int128 v28 = v27;
            if (MEMORY[0x1895B7750]() != MEMORY[0x1895F9250]
              || (string = xpc_dictionary_get_string(v28, "Label")) == 0LL
              || strcmp(string, v8))
            {
              xpc_release(v28);
              goto LABEL_16;
            }

            uint64_t v11 = _xpc_strdup(*((const char **)v11 + 6));
            xpc_release(v28);
            break;
          }
        }

        fts_close(v22);
        if (v11)
        {
          size_t v1 = v38;
          goto LABEL_37;
        }
      }

      else
      {
        int v30 = *__error();
        __int128 v31 = __error();
        __int128 v32 = strerror(*v31);
        syslog(4, "failed to fts_open(%s, 0x%x): %d: %s", __str, 92, v30, v32);
      }
    }

    uint64_t v11 = 0LL;
    CFNumberType v12 = 0LL;
    int v10 = 110;
    size_t v1 = v38;
    goto LABEL_41;
  }

  uint64_t v15 = v14;
  while (1)
  {
    bzero(__str, 0x800uLL);
    snprintf(__str, 0x800uLL, "%s/%s/%s.plist", v39, "LaunchDaemons", v8);
    int v16 = _xpc_copy_plist(__str);
    if (v16) {
      break;
    }
LABEL_11:
    uint64_t v15 = MEMORY[0x1895B7624](v15, v39);
    if (!(_DWORD)v15) {
      goto LABEL_12;
    }
  }

  int v17 = v16;
  if (MEMORY[0x1895B7750]() != MEMORY[0x1895F9250]
    || (uint64_t v18 = xpc_dictionary_get_string(v17, "Label")) == 0LL
    || strcmp(v8, v18))
  {
    xpc_release(v17);
    goto LABEL_11;
  }

  uint64_t v11 = _xpc_strdup(__str);
  xpc_release(v17);
  if (!v11) {
    goto LABEL_12;
  }
LABEL_37:
  __int128 v33 = _xpc_copy_plist(v11);
  CFNumberType v12 = v33;
  if (v33 && MEMORY[0x1895B7750](v33) == MEMORY[0x1895F9250])
  {
    if (v5)
    {
      int v10 = submit_job(v12, 1);
    }

    else
    {
      int v36 = remove_job(v8, 2);
      if ((v36 & 0xFFFFFFDF) == 3 || v36 == 37) {
        int v10 = 0;
      }
      else {
        int v10 = v36;
      }
    }
  }

  else
  {
    int v10 = 109;
  }

LABEL_41:
  if (v1 && v10)
  {
    CFErrorRef cferror_from_code = _create_cferror_from_code(v10);
    goto LABEL_46;
  }

  if (v1)
  {
    CFErrorRef cferror_from_code = 0LL;
LABEL_46:
    *size_t v1 = cferror_from_code;
  }

  if (v12) {
    xpc_release(v12);
  }
  free(v11);
  free(v8);
  return v10 == 0;
}

CFErrorRef _create_cferror_from_code(int a1)
{
  if (a1 <= 106)
  {
    if (a1 > 21)
    {
      if (a1 == 22)
      {
        CFIndex v1 = 3LL;
        return CFErrorCreate(0LL, @"CFErrorDomainLaunchd", v1, 0LL);
      }

      if (a1 == 32)
      {
        CFIndex v1 = 7LL;
        return CFErrorCreate(0LL, @"CFErrorDomainLaunchd", v1, 0LL);
      }

      if (a1 != 81) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }

    if (a1 == 1)
    {
LABEL_16:
      CFIndex v1 = 4LL;
      return CFErrorCreate(0LL, @"CFErrorDomainLaunchd", v1, 0LL);
    }

    if (a1 == 3)
    {
      CFIndex v1 = 6LL;
      return CFErrorCreate(0LL, @"CFErrorDomainLaunchd", v1, 0LL);
    }

LABEL_22:
    CFIndex v1 = 2LL;
    return CFErrorCreate(0LL, @"CFErrorDomainLaunchd", v1, 0LL);
  }

  if (a1 <= 109)
  {
    if (a1 == 107)
    {
      CFIndex v1 = 5LL;
      return CFErrorCreate(0LL, @"CFErrorDomainLaunchd", v1, 0LL);
    }

    if (a1 == 109)
    {
      CFIndex v1 = 8LL;
      return CFErrorCreate(0LL, @"CFErrorDomainLaunchd", v1, 0LL);
    }

    goto LABEL_22;
  }

  if ((a1 - 110) >= 2)
  {
    if (a1 == 119)
    {
      CFIndex v1 = 9LL;
      return CFErrorCreate(0LL, @"CFErrorDomainLaunchd", v1, 0LL);
    }

    goto LABEL_22;
  }

  CFIndex v1 = 10LL;
  return CFErrorCreate(0LL, @"CFErrorDomainLaunchd", v1, 0LL);
}

uint64_t _SMLoginItemSetEnabledWithURL()
{
  return 0LL;
}

uint64_t SMLoginItemSetUserAllowed_4BTM()
{
  return 0LL;
}

uint64_t SMLaunchdPlistSetUserAllowed_4BTM()
{
  return 0LL;
}

uint64_t SMCopyEnabledLoginItems_4BTM()
{
  return 0LL;
}

CFDictionaryRef SMJobCopyDictionary(CFStringRef domain, CFStringRef jobLabel)
{
  int v2 = CFStringJustCopyTheUTF8String(jobLabel);
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v3, "GetJob", v2);
  int v4 = (_launch_data *)_launch_msg2();
  int v5 = 0LL;
  if (launch_data_get_type(v4) == LAUNCH_DATA_DICTIONARY) {
    int v5 = CFCreateFromLaunchData(v4);
  }
  xpc_release(v4);
  xpc_release(v3);
  free(v2);
  return v5;
}

CFArrayRef SMCopyAllJobDictionaries(CFStringRef domain)
{
  xpc_object_t v1 = xpc_string_create("GetJobs");
  int v2 = (_launch_data *)_launch_msg2();
  if (launch_data_get_type(v2) == LAUNCH_DATA_DICTIONARY && (xpc_object_t v3 = CFCreateFromLaunchData(v2)) != 0LL)
  {
    int v4 = v3;
    int v5 = CFArrayCreateFromDictionaryValues(v3);
    CFRelease(v4);
  }

  else
  {
    int v5 = 0LL;
  }

  xpc_release(v2);
  xpc_release(v1);
  return v5;
}

Boolean SMJobSubmit(CFStringRef domain, CFDictionaryRef job, AuthorizationRef auth, CFErrorRef *outError)
{
  int v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  int v6 = submit_job(v5, 0);
  int v7 = v6;
  if (outError && v6)
  {
    CFErrorRef cferror_from_code = _create_cferror_from_code(v6);
  }

  else
  {
    if (!outError) {
      goto LABEL_7;
    }
    CFErrorRef cferror_from_code = 0LL;
  }

  *outError = cferror_from_code;
LABEL_7:
  if (v5) {
    xpc_release(v5);
  }
  return v7 == 0;
}

Boolean SMJobRemove( CFStringRef domain, CFStringRef jobLabel, AuthorizationRef auth, Boolean wait, CFErrorRef *outError)
{
  int v6 = wait;
  int v7 = CFStringJustCopyTheUTF8String(jobLabel);
  char v8 = v7;
  if (v6) {
    char v9 = 3;
  }
  else {
    char v9 = 1;
  }
  int v10 = remove_job(v7, v9);
  if ((v10 & 0xFFFFFFFE) == 0x24 || v10 == 3 || v10 == 89) {
    int v13 = 0;
  }
  else {
    int v13 = v10;
  }
  free(v8);
  if (outError && v13)
  {
    CFErrorRef cferror_from_code = _create_cferror_from_code(v13);
LABEL_18:
    *outError = cferror_from_code;
    return v13 == 0;
  }

  if (outError)
  {
    CFErrorRef cferror_from_code = 0LL;
    goto LABEL_18;
  }

  return v13 == 0;
}

void _xpc_interface_routine_cold_1()
{
  qword_18C6F51C8 = (uint64_t)"Configuration error: unreasonably large PID or execcnt";
  __break(1u);
}

void _xpc_interface_routine_cold_2()
{
  qword_18C6F51C8 = (uint64_t)"Configuration error: failed to fetch our own audit token";
  __break(1u);
}

void _xpc_interface_routine_cold_3()
{
}

void _xpc_interface_routine_cold_4()
{
}

void _xpc_interface_routine_cold_5()
{
}

void _xpc_interface_routine_cold_6(int a1)
{
  _xpc_asprintf("bootstrap port must lead to PID 1 [actual pid = %d]", a1);
  _os_crash();
  __break(1u);
}

void _xpc_alloc_cold_1()
{
}

void CFStringJustCopyTheUTF8String_cold_1()
{
}

void _xpc_strdup_cold_1()
{
}

void _xpc_strict_close_cold_1()
{
}

uint64_t CEAcquireUnmanagedContext()
{
  return MEMORY[0x1896134C8]();
}

uint64_t CEValidate()
{
  return MEMORY[0x189613568]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1895F8C18]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1895F8C38]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1895F8C40]();
}

uint64_t _launch_msg2()
{
  return MEMORY[0x1895F8D30]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1895F8D58]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1895F8D70]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_log_simple()
{
  return MEMORY[0x1895F8DF0]();
}

uint64_t _xpc_pipe_interface_routine()
{
  return MEMORY[0x1895F91E0]();
}

uint64_t _xpc_pipe_interface_routine_async()
{
  return MEMORY[0x1895F91E8]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895F95D0](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1895F95E0](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uint64_t der_vm_CEType_from_context()
{
  return MEMORY[0x189613578]();
}

uint64_t der_vm_BOOL_from_context()
{
  return MEMORY[0x189613580]();
}

uint64_t der_vm_context_is_valid()
{
  return MEMORY[0x189613588]();
}

uint64_t der_vm_data_from_context()
{
  return MEMORY[0x189613590]();
}

uint64_t der_vm_execute()
{
  return MEMORY[0x189613598]();
}

uint64_t der_vm_execute_nocopy()
{
  return MEMORY[0x1896135A0]();
}

uint64_t der_vm_integer_from_context()
{
  return MEMORY[0x1896135A8]();
}

uint64_t der_vm_iterate()
{
  return MEMORY[0x1896135B0]();
}

uint64_t der_vm_string_from_context()
{
  return MEMORY[0x1896135C8]();
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x1895FAE98]();
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1895FB490](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1895FB498](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1895FB4A0](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1895FB4A8](a1, a2, *(void *)&a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

size_t launch_data_array_get_count(const launch_data_t larray)
{
  return MEMORY[0x1895FB940](larray);
}

launch_data_t launch_data_array_get_index(const launch_data_t larray, size_t idx)
{
  return (launch_data_t)MEMORY[0x1895FB948](larray, idx);
}

void launch_data_dict_iterate(const launch_data_t ldict, launch_data_dict_iterator_t iterator, void *ctx)
{
}

void launch_data_free(launch_data_t ld)
{
}

BOOL launch_data_get_BOOL(const launch_data_t ld)
{
  return MEMORY[0x1895FB960](ld);
}

int launch_data_get_errno(const launch_data_t ld)
{
  return MEMORY[0x1895FB968](ld);
}

uint64_t launch_data_get_integer(const launch_data_t ld)
{
  return MEMORY[0x1895FB970](ld);
}

double launch_data_get_real(const launch_data_t ld)
{
  return result;
}

const char *__cdecl launch_data_get_string(const launch_data_t ld)
{
  return (const char *)MEMORY[0x1895FB980](ld);
}

launch_data_type_t launch_data_get_type(const launch_data_t ld)
{
  return MEMORY[0x1895FB988](ld);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1895FC410]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
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

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration( sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x1895FD2C8](*(void *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x1895FD2D8]();
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
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

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1895FD8B0](value);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1895FDAE0]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1895FDB88]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1895FDBE0]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1895FDEB0](value);
}

void xpc_release(xpc_object_t object)
{
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}