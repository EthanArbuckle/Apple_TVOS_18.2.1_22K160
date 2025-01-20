void *ldap_connection_create_with_hostname(const __CFString *a1, int a2)
{
  char *v3;
  void *result;
  int v5;
  char *v6;
  char __str[256];
  uint64_t v8;
  v8 = *MEMORY[0x1895F89C0];
  _fill_cstring_from_cfstring(&v6, a1, 0LL);
  v3 = v6;
  snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.%s.%hu", v6, a2);
  result = _ldap_connection_create(__str);
  result[33] = v3;
  *((_WORD *)result + 136) = a2;
  if (a2 == 636) {
    v5 = 1026;
  }
  else {
    v5 = 1024;
  }
  *((_DWORD *)result + 72) |= v5;
  return result;
}

char *_fill_cstring_from_cfstring(char **a1, const __CFString *a2, char **a3)
{
  result = _cstr_from_cfstring(a2, &v7);
  if (!result)
  {
    *a1 = 0LL;
    if (!a3) {
      return result;
    }
    goto LABEL_7;
  }

  v6 = result;
  result = v7;
  if (!v7) {
    result = strdup(v6);
  }
  *a1 = result;
  if (a3)
  {
    result = (char *)strlen(v6);
LABEL_7:
    *a3 = result;
  }

  return result;
}

void *_ldap_connection_create(const char *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v2 = ldap_connection_obj_alloc(312LL);
  if (!v2) {
    _ldap_connection_create_cold_1();
  }
  v3 = v2;
  snprintf(__str, 0x80uLL, "%s.state", a1);
  v3[1] = dispatch_queue_create(__str, 0LL);
  snprintf(__str, 0x80uLL, "%s.ops", a1);
  v3[8] = dispatch_queue_create(__str, 0LL);
  snprintf(__str, 0x80uLL, "%s.accessor", a1);
  v3[26] = dispatch_queue_create(__str, 0LL);
  snprintf(__str, 0x80uLL, "%s.delivery", a1);
  v3[3] = dispatch_queue_create(__str, 0LL);
  v3[4] = dispatch_group_create();
  *((_DWORD *)v3 + 72) = 0;
  *((_BYTE *)v3 + 305) = 1;
  v3[2] = dispatch_group_create();
  v3[7] = dispatch_group_create();
  v3[9] = 0LL;
  v3[10] = v3 + 9;
  v3[11] = 0LL;
  v3[28] = 0LL;
  v3[12] = v3 + 11;
  v3[29] = v3 + 28;
  v3[20] = 0LL;
  return v3;
}

void *ldap_connection_create_with_socket(int a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  socklen_t v11 = 16;
  if (a1 == -1) {
    return 0LL;
  }
  if (getpeername(a1, &v25, &v11))
  {
    snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.sock#%d", a1);
    v2 = _ldap_connection_create(__str);
    *((_DWORD *)v2 + 69) = a1;
    *((_DWORD *)v2 + 72) |= 0x1000u;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__s1 = 134218240;
      v21 = v2;
      __int16 v22 = 1024;
      int v23 = a1;
      v3 = (os_log_s *)MEMORY[0x1895F8DA0];
      v4 = "connection: %p, socket: %d";
      v5 = (uint8_t *)__s1;
      uint32_t v6 = 18;
LABEL_12:
      _os_log_impl(&dword_188CD9000, v3, OS_LOG_TYPE_INFO, v4, v5, v6);
      return v2;
    }

    return v2;
  }

  if (v25.sa_family != 30)
  {
    if (v25.sa_family == 2)
    {
      v7 = &v25.sa_data[2];
      int v8 = 2;
      goto LABEL_10;
    }

    return 0LL;
  }

  v7 = &v25.sa_data[6];
  int v8 = 30;
LABEL_10:
  inet_ntop(v8, v7, __s1, 0x2Eu);
  __int16 v9 = *(_WORD *)v25.sa_data;
  snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.%s.%hu", __s1, *(unsigned __int16 *)v25.sa_data);
  v2 = _ldap_connection_create(__str);
  v2[33] = strdup(__s1);
  *((_WORD *)v2 + 136) = v9;
  *((_DWORD *)v2 + 69) = a1;
  *((_DWORD *)v2 + 72) |= 0x1000u;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    v13 = v2;
    __int16 v14 = 1024;
    int v15 = a1;
    __int16 v16 = 1040;
    socklen_t v17 = v11;
    __int16 v18 = 2098;
    v19 = &v25;
    v3 = (os_log_s *)MEMORY[0x1895F8DA0];
    v4 = "connection: %p, socket: %d, address: %{public,network:sockaddr}.*P";
    v5 = buf;
    uint32_t v6 = 34;
    goto LABEL_12;
  }

  return v2;
}

void *ldap_connection_create_with_socket_and_hostname(int a1, const __CFString *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  socklen_t v12 = 16;
  if (a1 == -1) {
    return 0LL;
  }
  _fill_cstring_from_cfstring(&v11, a2, 0LL);
  if (getpeername(a1, &v22, &v12))
  {
    snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.sock#%d", a1);
    v3 = _ldap_connection_create(__str);
    *((_DWORD *)v3 + 69) = a1;
    v4 = v11;
    v3[33] = v11;
    *((_DWORD *)v3 + 72) |= 0x1000u;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v14 = v3;
      __int16 v15 = 1024;
      int v16 = a1;
      __int16 v17 = 2082;
      *(void *)__int16 v18 = v4;
      v5 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint32_t v6 = "connection: %p, socket: %d, hostname: %{public}s";
      uint32_t v7 = 28;
LABEL_9:
      _os_log_impl(&dword_188CD9000, v5, OS_LOG_TYPE_INFO, v6, buf, v7);
      return v3;
    }

    return v3;
  }

  if (v22.sa_family != 30 && v22.sa_family != 2) {
    return 0LL;
  }
  __int16 v8 = *(_WORD *)v22.sa_data;
  __int16 v9 = v11;
  snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.%s.%hu", v11, *(unsigned __int16 *)v22.sa_data);
  v3 = _ldap_connection_create(__str);
  v3[33] = v9;
  *((_WORD *)v3 + 136) = v8;
  *((_DWORD *)v3 + 69) = a1;
  *((_DWORD *)v3 + 72) |= 0x1000u;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219010;
    __int16 v14 = v3;
    __int16 v15 = 1024;
    int v16 = a1;
    __int16 v17 = 1040;
    *(_DWORD *)__int16 v18 = v12;
    *(_WORD *)&v18[4] = 2098;
    *(void *)&v18[6] = &v22;
    __int16 v19 = 2082;
    v20 = v9;
    v5 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint32_t v6 = "connection: %p, socket: %d, address: %{public,network:sockaddr}.*P, hostname: %{public}s";
    uint32_t v7 = 44;
    goto LABEL_9;
  }

  return v3;
}

void *ldap_connection_create_with_url(const __CFURL *a1)
{
  CFStringRef v2 = CFURLCopyScheme(a1);
  v3 = CFURLCopyHostName(a1);
  SInt32 v4 = CFURLGetPortNumber(a1);
  if (CFEqual(v2, @"ldap"))
  {
    if (v4 == -1) {
      unsigned __int16 v5 = 389;
    }
    else {
      unsigned __int16 v5 = v4;
    }
    uint32_t v6 = ldap_connection_create_with_hostname(v3, v5);
    if (!v3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  if (CFEqual(v2, @"ldaps"))
  {
    if (v4 == -1) {
      unsigned __int16 v7 = 636;
    }
    else {
      unsigned __int16 v7 = v4;
    }
    uint32_t v6 = ldap_connection_create_with_hostname(v3, v7);
    *((_DWORD *)v6 + 72) |= 2u;
    if (!v3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  uint32_t v6 = 0LL;
  if (v3) {
LABEL_12:
  }
    CFRelease(v3);
LABEL_13:
  if (v2) {
    CFRelease(v2);
  }
  return v6;
}

void ldap_connection_start(void *a1, int a2, uint64_t a3)
{
  uint32_t v6 = (dispatch_queue_s *)a1[1];
  uint64_t v7 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ___state_set_block_invoke;
  block[3] = &__block_descriptor_tmp_50;
  block[4] = a1;
  char v15 = 2;
  dispatch_barrier_sync(v6, block);
  ldap_connection_retain(a1);
  if (a2)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v12[0] = v7;
    v12[1] = 0x40000000LL;
    v12[2] = __ldap_connection_start_block_invoke;
    v12[3] = &unk_18A2FBA28;
    int v13 = a2;
    v12[4] = a3;
    v12[5] = a1;
    dispatch_async(global_queue, v12);
  }

  else
  {
    __int16 v9 = (dispatch_group_s *)a1[2];
    dispatch_queue_global_t v10 = dispatch_get_global_queue(0LL, 0LL);
    v11[0] = v7;
    v11[1] = 0x40000000LL;
    v11[2] = __ldap_connection_start_block_invoke_2;
    v11[3] = &unk_18A2FBA50;
    v11[4] = a3;
    v11[5] = a1;
    dispatch_group_notify(v9, v10, v11);
  }
}

void __ldap_connection_start_block_invoke(uint64_t a1)
{
  CFStringRef v2 = *(dispatch_group_s **)(*(void *)(a1 + 40) + 16LL);
  dispatch_time_t v3 = dispatch_walltime(0LL, 1000000000LL * *(int *)(a1 + 48));
  uint64_t v4 = dispatch_group_wait(v2, v3);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = *(unsigned int *)(v5 + 292);
  }
  _report_connect_status(v5, *(void *)(a1 + 32), v6);
  ldap_connection_release(*(id *)(a1 + 40));
}

void _report_connect_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  uint64_t v10 = 0LL;
  socklen_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 0LL;
  if (!(_DWORD)a3)
  {
    uint64_t v7 = *(dispatch_queue_s **)(a1 + 8);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = ___report_connect_status_block_invoke;
    v9[3] = &unk_18A2FC108;
    v9[4] = &v10;
    v9[5] = a1;
    dispatch_sync(v7, v9);
    uint64_t v6 = v11[3];
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a1, v6, a3);
  __int16 v8 = (const void *)v11[3];
  if (v8)
  {
    CFRelease(v8);
    v11[3] = 0LL;
  }

  _Block_object_dispose(&v10, 8);
}

void __ldap_connection_start_block_invoke_2(uint64_t a1)
{
}

void ldap_connection_cancel_operations(dispatch_queue_t *context)
{
}

void _o_ldap_connection_cancel_all_operations(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    _o_ldap_connection_cancel_all_operations_cold_1();
  }
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    dispatch_time_t v3 = (unint64_t *)(a1 + 112);
    uint64_t v4 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v5 = *(void *)(v2 + 8);
      uint64_t v6 = *(void **)(v2 + 16);
      if (v5)
      {
        *(void *)(v5 + 16) = v6;
        uint64_t v6 = *(void **)(v2 + 16);
      }

      else
      {
        *(void *)(a1 + 80) = v6;
      }

      void *v6 = v5;
      uint64_t v7 = (unint64_t *)(v2 + 40);
      do
        unint64_t v8 = __ldaxr(v7);
      while (__stlxr(v8 | 2, v7));
      do
        unint64_t v9 = __ldaxr(v7);
      while (__stlxr(v9 & 0xFFFFFFFFFFFFFFF7LL, v7));
      do
        unint64_t v10 = __ldaxr(v3);
      while (__stlxr(v10 - 1, v3));
      if ((*(_BYTE *)(v2 + 41) & 8) != 0) {
        goto LABEL_16;
      }
      do
        unint64_t v11 = __ldaxr(v7);
      while (__stlxr(v11 | 1, v7));
      if ((v11 & 1) != 0)
      {
LABEL_16:
        ldap_operation_release((id)v2);
      }

      else
      {
        uint64_t v12 = *(void *)(v2 + 32);
        ldap_operation_retain((id)v2);
        uint64_t v13 = *(dispatch_group_s **)(v12 + 56);
        __int16 v14 = *(dispatch_queue_s **)(v12 + 64);
        v21[0] = v4;
        v21[1] = 0x40000000LL;
        v21[2] = ___ldap_async_operation_block_invoke;
        v21[3] = &__block_descriptor_tmp_104;
        v21[4] = _o_abandon_operation;
        v21[5] = v2;
        dispatch_group_async(v13, v14, v21);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
      uint64_t v2 = *(void *)(a1 + 72);
    }

    while (v2);
  }

  while (1)
  {
    v20 = *(unint64_t **)(a1 + 88);
    if (!v20) {
      break;
    }
    unint64_t v15 = v20[1];
    int v16 = (unint64_t *)v20[2];
    if (v15)
    {
      *(void *)(v15 + 16) = v16;
      int v16 = (unint64_t *)v20[2];
    }

    else
    {
      *(void *)(a1 + 96) = v16;
    }

    *int v16 = v15;
    __int16 v17 = v20 + 5;
    do
      unint64_t v18 = __ldaxr(v17);
    while (__stlxr(v18 | 2, v17));
    do
      unint64_t v19 = __ldaxr(v17);
    while (__stlxr(v19 & 0xFFFFFFFFFFFFFFF7LL, v17));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    ldap_operation_release(v20);
  }

void ldap_connection_disconnect(uint64_t a1)
{
  v1 = *(dispatch_queue_s **)(a1 + 8);
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 0x40000000LL;
  v2[2] = ___state_set_block_invoke;
  v2[3] = &__block_descriptor_tmp_50;
  v2[4] = a1;
  char v3 = 8;
  dispatch_barrier_sync(v1, v2);
}

uint64_t ldap_connection_set_no_cellular(uint64_t a1, char a2)
{
  uint64_t result = _ldap_validate_offline(a1);
  uint64_t v5 = (unsigned int *)(a1 + 288);
  if ((a2 & 1) != 0)
  {
    do
      unsigned int v6 = __ldaxr(v5);
    while (__stlxr(v6 | 0x200, v5));
  }

  else
  {
    do
      unsigned int v7 = __ldaxr(v5);
    while (__stlxr(v7 & 0xFFFFFDFF, v5));
  }

  return result;
}

uint64_t _ldap_validate_offline(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(result + 305) != 1)
  {
    int v2 = *(char *)(result + 305);
    uint64_t v1 = result;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v4 = v1;
      __int16 v5 = 1024;
      int v6 = v2;
      __int16 v7 = 1024;
      int v8 = 1;
      _os_log_error_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "connection: %p, invalid state: %{AppleLDAPTypes:state}hhd (expected %{AppleLDAPTypes:state}hhd)",  buf,  0x18u);
    }

    __break(1u);
  }

  return result;
}

void ldap_connection_set_source_application_by_bundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 208);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __ldap_connection_set_source_application_by_bundle_block_invoke;
  v5[3] = &__block_descriptor_tmp_29;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_barrier_sync(v4, v5);
}

char *__ldap_connection_set_source_application_by_bundle_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 40);
  if (v3)
  {
    free(v3);
    *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t result = strdup(*(const char **)(a1 + 40));
  *(void *)(v2 + 40) = result;
  return result;
}

void ldap_connection_set_account_identifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 208);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __ldap_connection_set_account_identifier_block_invoke;
  v5[3] = &__block_descriptor_tmp_30;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_barrier_sync(v4, v5);
}

char *__ldap_connection_set_account_identifier_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 48);
  if (v3)
  {
    free(v3);
    *(void *)(*(void *)(a1 + 32) + 48LL) = 0LL;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t result = strdup(*(const char **)(a1 + 40));
  *(void *)(v2 + 48) = result;
  return result;
}

void ldap_connection_set_tls(uint64_t a1, int a2, const void *a3)
{
  if (a2)
  {
    int v6 = (unsigned int *)(a1 + 288);
    do
      unsigned int v7 = __ldaxr(v6);
    while (__stlxr(v7 | 1, v6));
    int v8 = (v7 & 1) == 0;
    if (!a3) {
      goto LABEL_13;
    }
LABEL_11:
    unint64_t v11 = *(const void **)(a1 + 256);
    if (v11)
    {
      if (CFEqual(v11, a3)) {
        goto LABEL_13;
      }
      uint64_t v12 = *(const void **)(a1 + 256);
      if (v12)
      {
        CFRelease(v12);
        *(void *)(a1 + 256) = 0LL;
      }
    }

    *(void *)(a1 + 256) = CFRetain(a3);
    goto LABEL_18;
  }

  if (a3) {
    _os_assumes_log();
  }
  uint64_t v9 = (unsigned int *)(a1 + 288);
  do
    unsigned int v10 = __ldaxr(v9);
  while (__stlxr(v10 & 0xFFFFFFFE, v9));
  int v8 = v10 & 1;
  if (a3) {
    goto LABEL_11;
  }
LABEL_13:
  if (v8)
  {
LABEL_18:
    uint64_t v13 = *(dispatch_queue_s **)(a1 + 208);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __ldap_connection_set_tls_block_invoke;
    block[3] = &__block_descriptor_tmp_31;
    block[4] = a1;
    dispatch_barrier_sync(v13, block);
  }

_DWORD *__ldap_connection_set_tls_block_invoke(uint64_t a1)
{
  return _a_clear_failed_hosts(*(void *)(a1 + 32), 10003);
}

_DWORD *_a_clear_failed_hosts(uint64_t a1, int a2)
{
  uint64_t result = *(_DWORD **)(a1 + 224);
  if (result)
  {
    do
    {
      uint64_t v5 = *(void *)result;
      if (result[11] == a2)
      {
        int v6 = (void *)*((void *)result + 1);
        if (v5)
        {
          *(void *)(v5 + 8) = v6;
          int v6 = (void *)*((void *)result + 1);
        }

        else
        {
          *(void *)(a1 + 232) = v6;
        }

        void *v6 = v5;
        free(result);
      }

      uint64_t result = (_DWORD *)v5;
    }

    while (v5);
  }

  return result;
}

void ldap_connection_add_credential(uint64_t a1, const void *a2, const __CFDictionary *a3)
{
  if ((CFEqual(a2, @"simple") == 1 || CFEqual(a2, @"CRAM-MD5") == 1
                                          || CFEqual(a2, @"DIGEST-MD5") == 1)
    && ((Value = CFDictionaryGetValue(a3, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN),
         unsigned int v7 = CFDictionaryGetValue(a3, (const void *)LDAP_MECHANISM_OPTION_PASSWORD),
         Value)
      ? (BOOL v8 = v7 == 0LL)
      : (BOOL v8 = 1),
        v8))
  {
    _os_assumes_log();
  }

  else
  {
    uint64_t v9 = *(dispatch_queue_s **)(a1 + 208);
    uint64_t v10 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __ldap_connection_add_credential_block_invoke;
    block[3] = &__block_descriptor_tmp_32;
    block[4] = a1;
    void block[5] = a2;
    block[6] = a3;
    dispatch_barrier_sync(v9, block);
    unint64_t v11 = (unsigned int *)(a1 + 288);
    do
      unsigned int v12 = __ldaxr(v11);
    while (__stlxr(v12 | 4, v11));
    uint64_t v13 = *(dispatch_queue_s **)(a1 + 208);
    v14[0] = v10;
    v14[1] = 0x40000000LL;
    v14[2] = __ldap_connection_add_credential_block_invoke_2;
    v14[3] = &__block_descriptor_tmp_33;
    v14[4] = a1;
    dispatch_barrier_sync(v13, v14);
  }

void __ldap_connection_add_credential_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(__CFDictionary **)(*(void *)(a1 + 32) + 248LL);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 248LL) = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    uint64_t v2 = *(__CFDictionary **)(*(void *)(a1 + 32) + 248LL);
  }

  CFDictionarySetValue(v2, *(const void **)(a1 + 40), *(const void **)(a1 + 48));
}

_DWORD *__ldap_connection_add_credential_block_invoke_2(uint64_t a1)
{
  return _a_clear_failed_hosts(*(void *)(a1 + 32), 49);
}

void *ldap_connection_set_disconnect_handler(uint64_t a1, const void *a2)
{
  uint64_t v4 = *(const void **)(a1 + 280);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(a1 + 280) = 0LL;
  }

  uint64_t result = _Block_copy(a2);
  *(void *)(a1 + 280) = result;
  return result;
}

void *ldap_connection_retrieve_record( _DWORD *a1, int a2, const __CFString *a3, const __CFArray *a4, uint64_t a5)
{
  uint64_t v5 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2000000000LL;
  v25[3] = 0LL;
  int v6 = a1[72];
  if ((v6 & 0x100) == 0 && (v6 & 0xC0) != 0)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    DWORD2(v16) = 4;
    LODWORD(v18) = 0;
    DWORD2(v18) = 1;
    DWORD2(v19) = 8;
    uint64_t v20 = 11LL;
    v21 = strdup("objectClass");
    _ldap_set_attributes((uint64_t)&v16, a4);
    _fill_cstring_from_cfstring((char **)&v17 + 1, a3, (char **)&v17);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 0x40000000LL;
    v15[2] = __ldap_connection_retrieve_record_block_invoke;
    v15[3] = &unk_18A2FBB18;
    v15[4] = v25;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 0x40000000LL;
    v14[2] = __ldap_connection_retrieve_record_block_invoke_2;
    v14[3] = &unk_18A2FBB40;
    v14[4] = a5;
    void v14[5] = v25;
    unsigned int v12 = (char *)_ldap_operation_query_create(a1, &v16, a2, v15, v14);
    free_LDAPMessage();
    uint64_t v5 = _enqueue_operation((uint64_t)a1, v12);
  }

  _Block_object_dispose(v25, 8);
  return v5;
}

uint64_t _ldap_set_attributes(uint64_t result, CFArrayRef theArray)
{
  uint64_t v2 = result;
  if (!theArray)
  {
    LODWORD(v4) = 0;
    goto LABEL_7;
  }

  uint64_t result = CFArrayGetCount(theArray);
  uint64_t v4 = result;
  if (result < 1)
  {
LABEL_7:
    uint64_t v5 = 0LL;
    goto LABEL_8;
  }

  uint64_t v5 = (char **)calloc(result, 0x10uLL);
  CFIndex v6 = 0LL;
  unsigned int v7 = v5;
  do
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v6);
    uint64_t result = (uint64_t)_fill_cstring_from_cfstring(v7 + 1, ValueAtIndex, v7);
    ++v6;
    v7 += 2;
  }

  while (v4 != v6);
LABEL_8:
  *(void *)(v2 + 112) = v5;
  *(_DWORD *)(v2 + 104) = v4;
  return result;
}

uint64_t _ldap_operation_query_create(void *a1, _DWORD *a2, int a3, const void *a4, const void *a5)
{
  BOOL v8 = _ldap_base_operation_create(a1, 144LL, 1024LL, (uint64_t)_dispose_query, a5);
  uint64_t v9 = (uint64_t)v8;
  if (v8)
  {
    if (_ldap_operation_simple_init((uint64_t)v8, a2))
    {
      if (a4) {
        *(void *)(v9 + 104) = _Block_copy(a4);
      }
      if (a3) {
        _start_query_timer(v9, a3);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v9;
}

CFTypeRef __ldap_connection_retrieve_record_block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  CFTypeRef result = CFRetain(cf);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = cf;
  return result;
}

void __ldap_connection_retrieve_record_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  }

void *_enqueue_operation(uint64_t a1, char *a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    uint64_t v4 = (unint64_t *)(a2 + 40);
    do
      unint64_t v5 = __ldaxr(v4);
    while (__stlxr(v5 | 8, v4));
    if ((v5 & 8) != 0)
    {
      ldap_operation_release(a2);
      return 0LL;
    }

    else
    {
      do
        unint64_t v6 = __ldaxr(v4);
      while (__stlxr(v6 & 0xFFFFFFFFFFFFFFFDLL, v4));
      ldap_operation_retain(a2);
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
      v2[6] = voucher_copy();
      uint64_t v7 = v2[4];
      ldap_operation_retain(v2);
      BOOL v8 = *(dispatch_group_s **)(v7 + 56);
      uint64_t v9 = *(dispatch_queue_s **)(v7 + 64);
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 0x40000000LL;
      v11[2] = ___ldap_async_operation_block_invoke;
      v11[3] = &__block_descriptor_tmp_104;
      v11[4] = _o_ldap_queue_operation;
      v11[5] = v2;
      dispatch_group_async(v8, v9, v11);
    }
  }

  return v2;
}

void *ldap_connection_query_create( void *a1, int a2, unsigned int a3, const __CFString *a4, const __CFString *a5, const __CFArray *a6, unsigned int a7, int a8, const void *a9, const void *a10)
{
  int v14 = a2;
  unint64_t v15 = a1;
  __int128 v17 = a9;
  __int128 v16 = a10;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  *(_OWORD *)v35 = 0u;
  if (a5) {
    __int128 v18 = a5;
  }
  else {
    __int128 v18 = @"(objectClass=*)";
  }
  memset(&v35[16], 0, 48);
  __int128 v36 = 0uLL;
  DWORD2(v32) = 4;
  if (a8)
  {
    uint64_t v20 = calloc(1uLL, 0x10uLL);
    v21 = calloc(1uLL, 0x20uLL);
    v37[1] = 0LL;
    v37[2] = 0LL;
    v37[0] = (char *)a7;
    v21[2] = 0LL;
    __int128 v22 = strdup("1.2.840.113556.1.4.319");
    void *v21 = 22LL;
    v21[1] = v22;
    v21[3] = calloc(1uLL, 0x10uLL);
    size_t v23 = length_PagedSearchControlValue();
    __int128 v24 = malloc(v23);
    *(void *)(v21[3] + 8LL) = v24;
    if (v24 && encode_PagedSearchControlValue())
    {
      free(*(void **)(v21[3] + 8LL));
      *(void *)(v21[3] + 8LL) = 0LL;
    }

    a7 = 0;
    *(_DWORD *)uint64_t v20 = 1;
    v20[1] = v21;
    *((void *)&v36 + 1) = v20;
    int v14 = a2;
    __int128 v16 = a10;
    __int128 v17 = a9;
    unint64_t v15 = a1;
  }

  *(void *)&__int128 v34 = a3;
  *(_DWORD *)v35 = 0;
  *((void *)&v34 + 1) = a7;
  _fill_cstring_from_cfstring((char **)&v33 + 1, a4, (char **)&v33);
  _ldap_set_attributes((uint64_t)&v32, a6);
  sockaddr v25 = _cstr_from_cfstring(v18, v37);
  memset(&v35[8], 0, 48);
  uint64_t v26 = v25;
  while (1)
  {
    int v27 = *v26;
    if (v27 > 39)
    {
      if (v27 == 40)
      {
        uint64_t started = _start_filter((int *)&v35[8], v26 + 1);
LABEL_18:
        uint64_t v26 = (char *)started;
        goto LABEL_19;
      }

      if (v27 == 41) {
        goto LABEL_20;
      }
LABEL_17:
      uint64_t started = _parse_simple_filter((uint64_t)&v35[8], v26, 0);
      goto LABEL_18;
    }

    if (v27 != 32) {
      break;
    }
LABEL_19:
    if (!++v26)
    {
LABEL_20:
      free_Filter();
      goto LABEL_21;
    }
  }

  if (*v26) {
    goto LABEL_17;
  }
  if (*(_DWORD *)&v35[8])
  {
    v29 = (char *)_ldap_operation_query_create(v15, &v32, v14, v17, v16);
    goto LABEL_24;
  }

LABEL_21:
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    ldap_connection_query_create_cold_1();
  }
  v29 = 0LL;
LABEL_24:
  free_LDAPMessage();
  if (v37[0]) {
    free(v37[0]);
  }
  return _enqueue_operation((uint64_t)v15, v29);
}

    _o_operation_complete(v16, v17, v15);
LABEL_22:
    __int128 v18 = *(const void **)(v9 + 64);
    if (v18)
    {
      *(void *)(v4 + 296) = v18;
      CFRetain(v18);
    }

    if (v72)
    {
      __int128 v19 = (void *)voucher_adopt();
      os_release(v19);
    }

char *_cstr_from_cfstring(const __CFString *a1, char **a2)
{
  *a2 = 0LL;
  if (!a1) {
    return 0LL;
  }
  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (!CStringPtr)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex v6 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v7 = (char *)malloc(v6);
    if (!v7) {
      _ldap_connection_create_cold_1();
    }
    CStringPtr = v7;
    if (!CFStringGetCString(a1, v7, v6, 0x8000100u))
    {
      free(CStringPtr);
      CStringPtr = 0LL;
    }

    *a2 = CStringPtr;
  }

  return CStringPtr;
}

uint64_t ldap_operation_query_remaining(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 41) & 4) != 0) {
    return *(unsigned int *)(a1 + 140);
  }
  else {
    return 0LL;
  }
}

uint64_t ldap_operation_query_page(uint64_t a1, int a2)
{
  char v3 = (unint64_t *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = 10013LL;
  if ((v2 & 0x400) != 0 && (*(void *)(a1 + 40) & 5LL) != 1)
  {
    if (*(void *)(a1 + 120))
    {
      if ((v2 & 8) != 0)
      {
        return 10011LL;
      }

      else
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (decode_LDAPMessage())
        {
          return 10013LL;
        }

        else
        {
          size_t v8 = *v19;
          if ((_DWORD)v8
            && (uint64_t v9 = *((void *)v19 + 1), !strncmp(*(const char **)(v9 + 8), "1.2.840.113556.1.4.319", v8)))
          {
            uint64_t v10 = *(void **)(*(void *)(v9 + 24) + 8LL);
            if (v10)
            {
              free(v10);
              *(void *)(*(void *)(*((void *)v19 + 1) + 24LL) + 8LL) = 0LL;
            }

            size_t v11 = length_PagedSearchControlValue();
            unsigned int v12 = malloc(v11);
            *(void *)(*(void *)(*((void *)v19 + 1) + 24LL) + 8LL) = v12;
            if (v12 && encode_PagedSearchControlValue())
            {
              free(*(void **)(*(void *)(*((void *)v19 + 1) + 24LL) + 8LL));
              *(void *)(*(void *)(*((void *)v19 + 1) + 24LL) + 8LL) = 0LL;
            }

            uint64_t v13 = *(void **)(a1 + 120);
            if (v13)
            {
              free(v13);
              *(void *)(a1 + 120) = 0LL;
            }

            *(_DWORD *)(a1 + 80) = _ldap_connection_next_messageID(v7);
            int v14 = *(void **)(a1 + 88);
            if (v14)
            {
              free(v14);
              *(void *)(a1 + 88) = 0LL;
            }

            size_t v15 = length_LDAPMessage();
            __int128 v16 = malloc(v15);
            *(void *)(a1 + 88) = v16;
            if (v16 && encode_LDAPMessage())
            {
              free(*(void **)(a1 + 88));
              *(void *)(a1 + 88) = 0LL;
            }

            do
              unint64_t v17 = __ldaxr(v3);
            while (__stlxr(v17 & 0xFFFFFFFFFFFFFFFALL, v3));
            if (a2) {
              _start_query_timer(a1, a2);
            }
            else {
              uint64_t v4 = 10013LL;
            }
          }

          else
          {
            uint64_t v4 = 10013LL;
          }

          free_LDAPMessage();
        }
      }
    }

    else
    {
      return 10012LL;
    }
  }

  return v4;
}

uint64_t _ldap_connection_next_messageID(uint64_t a1)
{
  uint64_t v5 = 0LL;
  CFIndex v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 208);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v4[2] = ___ldap_connection_next_messageID_block_invoke;
  v4[3] = &unk_18A2FC170;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void _start_query_timer(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(dispatch_object_s **)(a1 + 112);
  if (!v5)
  {
    CFIndex v6 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(v4 + 64));
    *(void *)(a1 + 112) = v6;
    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    _os_assumes_log();
    return;
  }

  dispatch_suspend(v5);
  CFIndex v6 = *(dispatch_source_s **)(a1 + 112);
  if (!v6) {
    goto LABEL_6;
  }
LABEL_3:
  dispatch_time_t v7 = dispatch_walltime(0LL, 1000000000LL * a2);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_set_context(*(dispatch_object_t *)(a1 + 112), (void *)a1);
  size_t v8 = *(dispatch_source_s **)(a1 + 112);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  v9[2] = ___start_query_timer_block_invoke;
  v9[3] = &__block_descriptor_tmp_107;
  v9[4] = v4;
  v9[5] = a1;
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume(*(dispatch_object_t *)(a1 + 112));
}

void *ldap_connection_read_rootdse(_DWORD *a1, int a2, const __CFArray *a3, uint64_t a4)
{
  return ldap_connection_retrieve_record(a1, a2, &stru_18A2FDA20, a3, a4);
}

BOOL ldap_connection_has_confidentiality(uint64_t a1)
{
  return (*(_WORD *)(a1 + 288) & 0x4023) != 0;
}

void ldap_operation_cancel(unint64_t *context)
{
  unint64_t v1 = context[4];
  uint64_t v2 = context + 5;
  do
    unint64_t v3 = __ldaxr(v2);
  while (__stlxr(v3 | 2, v2));
  if ((v3 & 2) == 0) {
    dispatch_barrier_sync_f( *(dispatch_queue_t *)(v1 + 64),  context,  (dispatch_function_t)_o_ldap_operation_cancel_internal);
  }
}

void _o_ldap_operation_cancel_internal(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 64));
  uint64_t v3 = *(void *)(v2 + 72);
  if (v3)
  {
    while (v3 != a1)
    {
      uint64_t v3 = *(void *)(v3 + 8);
      if (!v3) {
        goto LABEL_4;
      }
    }

    uint64_t v5 = *(void *)(a1 + 8);
    CFIndex v6 = *(void **)(a1 + 16);
    if (v5)
    {
      *(void *)(v5 + 16) = v6;
      CFIndex v6 = *(void **)(a1 + 16);
    }

    else
    {
      *(void *)(v2 + 80) = v6;
    }

    void *v6 = v5;
    uint64_t v9 = (unint64_t *)(a1 + 40);
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 & 0xFFFFFFFFFFFFFFF7LL, v9));
    if ((*(_BYTE *)(a1 + 41) & 8) == 0)
    {
      do
        unint64_t v11 = __ldaxr(v9);
      while (__stlxr(v11 | 1, v9));
      if ((v11 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
          _o_ldap_operation_cancel_internal_cold_1();
        }
        dispatch_barrier_sync_f(*(dispatch_queue_t *)(v2 + 64), (void *)a1, (dispatch_function_t)_o_abandon_operation);
      }
    }

    unsigned int v12 = (unint64_t *)(v2 + 112);
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    dispatch_group_leave(*(dispatch_group_t *)(v2 + 56));
    ldap_operation_release((id)a1);
  }

  else
  {
LABEL_4:
    uint64_t v4 = *(void *)(v2 + 88);
    if (v4)
    {
      while (v4 != a1)
      {
        uint64_t v4 = *(void *)(v4 + 8);
        if (!v4) {
          return;
        }
      }

      uint64_t v7 = *(void *)(a1 + 8);
      size_t v8 = *(void **)(a1 + 16);
      if (v7)
      {
        *(void *)(v7 + 16) = v8;
        size_t v8 = *(void **)(a1 + 16);
      }

      else
      {
        *(void *)(v2 + 96) = v8;
      }

      *size_t v8 = v7;
      int v14 = (unint64_t *)(a1 + 40);
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 & 0xFFFFFFFFFFFFFFF7LL, v14));
      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56LL));
      ldap_operation_release((id)a1);
    }
  }

void ldap_connection_dispose(gss_ctx_id_t *context_handle)
{
  uint64_t v2 = context_handle[16];
  if (v2)
  {
    SSLClose(v2);
    gss_ctx_id_t v3 = context_handle[16];
    if (v3)
    {
      CFRelease(v3);
      context_handle[16] = 0LL;
    }
  }

  if (context_handle[15])
  {
    tcp_connection_cancel();
    if (context_handle[15])
    {
      tcp_connection_release();
      context_handle[15] = 0LL;
    }
  }

  uint64_t v4 = (dispatch_object_s *)context_handle[1];
  if (v4)
  {
    dispatch_release(v4);
    context_handle[1] = 0LL;
  }

  uint64_t v5 = (dispatch_object_s *)context_handle[2];
  if (v5)
  {
    dispatch_release(v5);
    context_handle[2] = 0LL;
  }

  CFIndex v6 = (dispatch_object_s *)context_handle[3];
  if (v6)
  {
    dispatch_release(v6);
    context_handle[3] = 0LL;
  }

  uint64_t v7 = (dispatch_object_s *)context_handle[4];
  if (v7)
  {
    dispatch_release(v7);
    context_handle[4] = 0LL;
  }

  size_t v8 = (dispatch_object_s *)context_handle[7];
  if (v8)
  {
    dispatch_release(v8);
    context_handle[7] = 0LL;
  }

  uint64_t v9 = (dispatch_object_s *)context_handle[8];
  if (v9)
  {
    dispatch_release(v9);
    context_handle[8] = 0LL;
  }

  unint64_t v10 = (dispatch_object_s *)context_handle[13];
  if (v10)
  {
    dispatch_release(v10);
    context_handle[13] = 0LL;
  }

  gss_ctx_id_t v11 = context_handle[6];
  if (v11)
  {
    free(v11);
    context_handle[6] = 0LL;
  }

  gss_ctx_id_t v12 = context_handle[5];
  if (v12)
  {
    free(v12);
    context_handle[5] = 0LL;
  }

  gss_ctx_id_t v13 = context_handle[17];
  if (v13)
  {
    free(v13);
    context_handle[17] = 0LL;
  }

  gss_ctx_id_t v14 = context_handle[19];
  if (v14)
  {
    CFRelease(v14);
    context_handle[19] = 0LL;
  }

  gss_ctx_id_t v15 = context_handle[35];
  if (v15)
  {
    _Block_release(v15);
    context_handle[35] = 0LL;
  }

  __int128 v16 = (dispatch_object_s *)context_handle[22];
  if (v16)
  {
    dispatch_release(v16);
    context_handle[22] = 0LL;
  }

  if (context_handle[23])
  {
    gss_delete_sec_context(&minor_status, context_handle + 23, 0LL);
    context_handle[23] = 0LL;
  }

  unint64_t v17 = (dispatch_object_s *)context_handle[26];
  if (v17)
  {
    dispatch_release(v17);
    context_handle[26] = 0LL;
  }

  __int128 v18 = (dispatch_object_s *)context_handle[27];
  if (v18)
  {
    dispatch_release(v18);
    context_handle[27] = 0LL;
  }

  while (1)
  {
    gss_ctx_id_t v21 = context_handle[28];
    if (!v21) {
      break;
    }
    uint64_t v19 = *(void *)v21;
    uint64_t v20 = (gss_ctx_id_t_desc_struct *)*((void *)v21 + 1);
    if (*(void *)v21)
    {
      *(void *)(v19 + 8) = v20;
      uint64_t v20 = (gss_ctx_id_t_desc_struct *)*((void *)v21 + 1);
    }

    else
    {
      context_handle[29] = v20;
    }

    *(void *)uint64_t v20 = v19;
    free(v21);
  }

  while (1)
  {
    __int128 v22 = (gss_ctx_id_t *)context_handle[20];
    if (!v22) {
      break;
    }
    context_handle[20] = *v22;
    free(v22);
  }

  gss_ctx_id_t v23 = context_handle[31];
  if (v23)
  {
    CFRelease(v23);
    context_handle[31] = 0LL;
  }

  gss_ctx_id_t v24 = context_handle[32];
  if (v24)
  {
    CFRelease(v24);
    context_handle[32] = 0LL;
  }

  gss_ctx_id_t v25 = context_handle[37];
  if (v25)
  {
    CFRelease(v25);
    context_handle[37] = 0LL;
  }

  int v26 = *((_DWORD *)context_handle + 72);
  if ((v26 & 0x400) != 0 || (v26 & 0x4000) != 0 || (v26 & 0x800) != 0)
  {
    gss_ctx_id_t v28 = context_handle[33];
    if (!v28) {
      return;
    }
    free(v28);
    goto LABEL_62;
  }

  if ((v26 & 0x1000) != 0)
  {
    gss_ctx_id_t v29 = context_handle[33];
    if (v29)
    {
      free(v29);
      context_handle[33] = 0LL;
    }

    int v30 = *((_DWORD *)context_handle + 69);
    if (v30 != -1) {
      close(v30);
    }
  }

  else if ((v26 & 0x2000) != 0)
  {
    gss_ctx_id_t v27 = context_handle[33];
    if (v27)
    {
      CFRelease(v27);
LABEL_62:
      context_handle[33] = 0LL;
    }
  }

void ldap_operation_dispose(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    ldap_connection_release(v2);
    *(void *)(a1 + 32) = 0LL;
  }

  gss_ctx_id_t v3 = *(const void **)(a1 + 24);
  if (v3)
  {
    _Block_release(v3);
    *(void *)(a1 + 24) = 0LL;
  }

  uint64_t v4 = *(void (**)(uint64_t))(a1 + 72);
  if (v4) {
    v4(a1);
  }
  os_release(*(void **)(a1 + 48));
  *(void *)(a1 + 48) = 0LL;
  uint64_t v5 = *(const void **)(a1 + 64);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 64) = 0LL;
  }

const void *ldap_connection_copy_error_string(uint64_t a1)
{
  CFTypeRef result = *(const void **)(a1 + 296);
  if (result)
  {
    CFRetain(result);
    return *(const void **)(a1 + 296);
  }

  return result;
}

const void *ldap_operation_copy_error_string(uint64_t a1)
{
  CFTypeRef result = *(const void **)(a1 + 64);
  if (result)
  {
    CFRetain(result);
    return *(const void **)(a1 + 64);
  }

  return result;
}

void ___state_set_block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(char **)(a1 + 32);
  unsigned int v3 = v2[305];
  int v4 = *(char *)(a1 + 40);
  if (_valid_state(v3, v4) && (!v2[306] || _valid_state(v2[306], (char)v4)))
  {
    v2[306] = v4;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      int v5 = *(char *)(a1 + 40);
      *(_DWORD *)buf = 134218496;
      gss_ctx_id_t v12 = v2;
      __int16 v13 = 1024;
      unsigned int v14 = v3;
      __int16 v15 = 1024;
      int v16 = v5;
      _os_log_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "connection: %p, oldState: %{AppleLDAPTypes:state}hhd, newState: %{AppleLDAPTypes:state}hhd",  buf,  0x18u);
      uint64_t v2 = *(char **)(a1 + 32);
      int v6 = v2[305];
    }

    else
    {
      int v6 = v3;
    }

    if (v6 == 9)
    {
LABEL_10:
      _s_next_state((uint64_t)v2);
      return;
    }

    if ((char)v6 != 7)
    {
      goto LABEL_10;
    }

    ldap_connection_retain(v2);
    uint64_t v7 = *(void *)(a1 + 32);
    size_t v8 = *(dispatch_group_s **)(v7 + 56);
    uint64_t v9 = *(dispatch_queue_s **)(v7 + 8);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___state_set_block_invoke_48;
    block[3] = &__block_descriptor_tmp_49;
    block[4] = v7;
    dispatch_group_notify(v8, v9, block);
  }

uint64_t _valid_state(unsigned int a1, int a2)
{
  uint64_t result = 0LL;
  if (a2 && a1 != a2)
  {
    switch(a2)
    {
      case 1:
        if (a1 == 11) {
          goto LABEL_23;
        }
        goto LABEL_27;
      case 2:
        if (a1 != 1) {
          goto LABEL_27;
        }
        goto LABEL_23;
      case 3:
        if (a1 != 2) {
          goto LABEL_27;
        }
        goto LABEL_23;
      case 4:
        if (a1 != 3) {
          goto LABEL_27;
        }
        goto LABEL_23;
      case 5:
        goto LABEL_23;
      case 6:
        if (a1 != 5) {
          goto LABEL_27;
        }
        goto LABEL_23;
      case 7:
        if (a1 >= 7) {
          goto LABEL_27;
        }
        uint64_t result = (0x58u >> a1) & 1;
        break;
      case 8:
        if (a1 == 1 || a1 - 2 >= 6) {
          goto LABEL_27;
        }
        goto LABEL_23;
      case 9:
        if (a1 != 8) {
          goto LABEL_27;
        }
        goto LABEL_23;
      case 10:
        goto LABEL_27;
      case 11:
        if (a1 - 8 >= 3) {
          goto LABEL_27;
        }
LABEL_23:
        uint64_t result = 1LL;
        break;
      default:
LABEL_27:
        uint64_t result = 0LL;
        break;
    }
  }

  return result;
}

void _s_next_state(uint64_t a1)
{
  uint64_t v2 = (unsigned int *)(a1 + 288);
  while (1)
  {
    char v3 = *(_BYTE *)(a1 + 306);
    int v4 = *(char *)(a1 + 305);
    if (v3)
    {
      char valid = _valid_state(*(char *)(a1 + 305), v3);
      *(_BYTE *)(a1 + 306) = 0;
      if ((valid & 1) != 0) {
        goto LABEL_22;
      }
    }

    switch(v4)
    {
      case 2:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 3;
LABEL_50:
        if (!*(_DWORD *)(a1 + 292)) {
          *(_DWORD *)(a1 + 292) = 10001;
        }
        ldap_connection_retain((id)a1);
        int v16 = *(dispatch_group_s **)(a1 + 56);
        uint64_t v17 = *(dispatch_queue_s **)(a1 + 64);
        uint64_t v20 = MEMORY[0x1895F87A8];
        uint64_t v21 = 0x40000000LL;
        __int128 v22 = ___ldap_async_function_block_invoke;
        gss_ctx_id_t v23 = &__block_descriptor_tmp_51;
        __int128 v18 = _o_start_connection;
        goto LABEL_55;
      case 3:
        if (*(_DWORD *)(a1 + 292)) {
          char v3 = 11;
        }
        else {
          char v3 = 4;
        }
        goto LABEL_22;
      case 4:
        int v6 = *(_DWORD *)(a1 + 292);
        if (v6 == 10003)
        {
          unsigned int v7 = *v2;
          if ((*v2 & 3) == 0) {
            goto LABEL_19;
          }
        }

        else if (!v6)
        {
          unsigned int v7 = *v2;
LABEL_19:
          *(_DWORD *)(a1 + 292) = 0;
          if ((v7 & 4) != 0) {
            char v3 = 5;
          }
          else {
            char v3 = 7;
          }
LABEL_22:
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
          *(_BYTE *)(a1 + 305) = v3;
          *(_BYTE *)(a1 + 306) = 0;
          switch(v3)
          {
            case 1:
              goto LABEL_58;
            case 2:
              do
                unsigned int v8 = __ldaxr(v2);
              while (__stlxr(v8 | 0x40, v2));
              if ((v8 & 0x40) == 0)
              {
                ldap_connection_retain((id)a1);
                do
                  unsigned int v9 = __ldaxr(v2);
                while (__stlxr(v9 & 0xFFFFFEFF, v2));
                dispatch_group_enter(*(dispatch_group_t *)(a1 + 16));
              }

              continue;
            case 3:
              goto LABEL_50;
            case 4:
              if ((*(_BYTE *)v2 & 3) == 0) {
                continue;
              }
              *(_DWORD *)(a1 + 292) = 10003;
              ldap_connection_retain((id)a1);
              int v16 = *(dispatch_group_s **)(a1 + 56);
              uint64_t v17 = *(dispatch_queue_s **)(a1 + 64);
              uint64_t v20 = MEMORY[0x1895F87A8];
              uint64_t v21 = 0x40000000LL;
              __int128 v22 = ___ldap_async_function_block_invoke;
              gss_ctx_id_t v23 = &__block_descriptor_tmp_51;
              __int128 v18 = _o_initiate_tls_handshake;
              goto LABEL_55;
            case 5:
              ldap_connection_retain((id)a1);
              int v16 = *(dispatch_group_s **)(a1 + 56);
              uint64_t v17 = *(dispatch_queue_s **)(a1 + 64);
              uint64_t v20 = MEMORY[0x1895F87A8];
              uint64_t v21 = 0x40000000LL;
              __int128 v22 = ___ldap_async_function_block_invoke;
              gss_ctx_id_t v23 = &__block_descriptor_tmp_51;
              __int128 v18 = _o_read_rootdse;
              goto LABEL_55;
            case 6:
              *(void *)(a1 + 168) = 0LL;
              __int16 v15 = *(void **)(a1 + 136);
              if (v15)
              {
                free(v15);
                *(void *)(a1 + 136) = 0LL;
              }

              ldap_connection_retain((id)a1);
              int v16 = *(dispatch_group_s **)(a1 + 56);
              uint64_t v17 = *(dispatch_queue_s **)(a1 + 64);
              uint64_t v20 = MEMORY[0x1895F87A8];
              uint64_t v21 = 0x40000000LL;
              __int128 v22 = ___ldap_async_function_block_invoke;
              gss_ctx_id_t v23 = &__block_descriptor_tmp_51;
              __int128 v18 = _o_initiate_authentication;
              goto LABEL_55;
            case 7:
              do
                unsigned int v12 = __ldaxr(v2);
              while (__stlxr(v12 & 0xFFFFFFBF, v2));
              if ((v12 & 0x40) != 0)
              {
                do
                  unsigned int v13 = __ldaxr(v2);
                while (__stlxr(v13 | 0x80, v2));
                dispatch_group_leave(*(dispatch_group_t *)(a1 + 16));
              }

              return;
            case 8:
              if (!*(_DWORD *)(a1 + 292)) {
                *(_DWORD *)(a1 + 292) = 10002;
              }
              continue;
            case 9:
              goto LABEL_54;
            case 10:
              goto LABEL_28;
            case 11:
              goto LABEL_41;
            default:
              return;
          }
        }

        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 10;
        do
LABEL_28:
          unsigned int v10 = __ldaxr(v2);
        while (__stlxr(v10 | 0x100, v2));
        do
          unsigned int v11 = __ldaxr(v2);
        while (__stlxr(v11 & 0xFFFFFF7F, v2));
        if (!*(_DWORD *)(a1 + 292)) {
          *(_DWORD *)(a1 + 292) = 10001;
        }
        break;
      case 5:
        if (*(_DWORD *)(a1 + 292)) {
          char v3 = 10;
        }
        else {
          char v3 = 6;
        }
        goto LABEL_22;
      case 6:
        if (*(_DWORD *)(a1 + 292)) {
          char v3 = 10;
        }
        else {
          char v3 = 7;
        }
        goto LABEL_22;
      case 8:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 9;
LABEL_54:
        ldap_connection_retain((id)a1);
        int v16 = *(dispatch_group_s **)(a1 + 56);
        uint64_t v17 = *(dispatch_queue_s **)(a1 + 64);
        uint64_t v20 = MEMORY[0x1895F87A8];
        uint64_t v21 = 0x40000000LL;
        __int128 v22 = ___ldap_async_function_block_invoke;
        gss_ctx_id_t v23 = &__block_descriptor_tmp_51;
        __int128 v18 = _o_ldap_unbinding;
        goto LABEL_55;
      case 9:
      case 10:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 11;
        do
LABEL_41:
          unsigned int v14 = __ldaxr(v2);
        while (__stlxr(v14 & 0xFFFFFFBF, v2));
        if ((v14 & 0x40) != 0) {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 16));
        }
        ldap_connection_retain((id)a1);
        int v16 = *(dispatch_group_s **)(a1 + 56);
        uint64_t v17 = *(dispatch_queue_s **)(a1 + 64);
        uint64_t v20 = MEMORY[0x1895F87A8];
        uint64_t v21 = 0x40000000LL;
        __int128 v22 = ___ldap_async_function_block_invoke;
        gss_ctx_id_t v23 = &__block_descriptor_tmp_51;
        __int128 v18 = _o_ldap_cleanup;
LABEL_55:
        gss_ctx_id_t v24 = v18;
        uint64_t v25 = a1;
        dispatch_group_async(v16, v17, &v20);
        return;
      case 11:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 1;
LABEL_58:
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        dispatch_async_f(global_queue, (void *)a1, ldap_connection_release);
        return;
      default:
        return;
    }
  }

void ___state_set_block_invoke_48(uint64_t a1)
{
}

void _o_start_connection(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (*(void *)(a1 + 120))
  {
    tcp_connection_cancel();
    if (*(void *)(a1 + 120))
    {
      tcp_connection_release();
      *(void *)(a1 + 120) = 0LL;
    }
  }

  int v2 = *(_DWORD *)(a1 + 288);
  if ((v2 & 0x400) != 0) {
    goto LABEL_10;
  }
  if ((v2 & 0x800) != 0)
  {
LABEL_29:
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
    return;
  }

  if ((v2 & 0x1000) != 0)
  {
    if (*(_DWORD *)(a1 + 276) != -1)
    {
      uint64_t v5 = tcp_connection_create_with_connected_fd();
      *(void *)(a1 + 120) = v5;
      *(_DWORD *)(a1 + 276) = -1;
      goto LABEL_11;
    }

    if (!*(void *)(a1 + 264)) {
      goto LABEL_29;
    }
LABEL_10:
    uint64_t v5 = tcp_connection_create();
    *(void *)(a1 + 120) = v5;
LABEL_11:
    uint64_t v4 = v5;
    goto LABEL_12;
  }

  if ((*(_DWORD *)(a1 + 288) & 0x6000) != 0x4000) {
    goto LABEL_29;
  }
  int v3 = socket(1, 1, 0);
  int v7 = 1;
  v8.sa_family = 1;
  v8.sa_len = strlen(*(const char **)(a1 + 264)) + 98;
  __strlcpy_chk();
  setsockopt(v3, 0xFFFF, 4130, &v7, 4u);
  if (connect(v3, &v8, v8.sa_len)
    || ioctl(v3, 0x8004667EuLL, &v7) == -1
    || (v5 = tcp_connection_create_with_connected_fd(), *(void *)(a1 + 120) = v5, (uint64_t v4 = v5) == 0))
  {
    close(v3);
    uint64_t v4 = 0LL;
    uint64_t v5 = *(void *)(a1 + 120);
  }

LABEL_12:
  if (v5)
  {
    if ((*(_BYTE *)(a1 + 289) & 0x40) == 0)
    {
      tcp_connection_copy_parameters();
      nw_parameters_set_is_non_app_initiated();
    }

    tcp_connection_allow_client_socket_access();
  }

  if (!v4) {
    goto LABEL_29;
  }
  int v6 = *(_DWORD *)(a1 + 288);
  if ((v6 & 0x1000) == 0)
  {
    tcp_connection_set_indefinite();
    int v6 = *(_DWORD *)(a1 + 288);
  }

  if ((v6 & 0x200) != 0) {
    tcp_connection_set_no_cellular();
  }
  if (*(void *)(a1 + 48)) {
    tcp_connection_set_account_identifier();
  }
  if (*(void *)(a1 + 40)) {
    tcp_connection_set_source_application_by_bundle();
  }
  tcp_connection_set_event_handler();
  tcp_connection_start();
}

void _o_initiate_tls_handshake(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (*(_WORD *)(a1 + 272) == 636)
  {
    _o_negotiate_ssl(a1);
  }

  else
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v5 = 0u;
    DWORD2(v5) = 19;
    uint64_t v6 = 22LL;
    int v7 = strdup("1.3.6.1.4.1.1466.20037");
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = a1;
      _os_log_impl(&dword_188CD9000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "connection: %p, TLS: send EXOP", buf, 0xCu);
    }

    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 0x40000000LL;
    v4[2] = ___o_initiate_tls_handshake_block_invoke;
    v4[3] = &__block_descriptor_tmp_55;
    v4[4] = a1;
    int v2 = _ldap_base_operation_create((void *)a1, 104LL, 512LL, (uint64_t)_dispose_simple, v4);
    int v3 = (char *)_ldap_operation_simple_init((uint64_t)v2, &v5);
    if (!_enqueue_operation_with_release(a1, v3))
    {
      *(_DWORD *)(a1 + 292) = 10003;
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
    }

    free_LDAPMessage();
  }

void _o_read_rootdse(uint64_t a1)
{
  int v2 = CFArrayCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)&LDAP_SUPPORTED_SASL_MECHANISMS,  1LL,  MEMORY[0x189605228]);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v4[2] = ___o_read_rootdse_block_invoke;
  v4[3] = &__block_descriptor_tmp_73;
  v4[4] = a1;
  record = ldap_connection_retrieve_record((_DWORD *)a1, 10, &stru_18A2FDA20, v2, (uint64_t)v4);
  if (record) {
    ldap_operation_release(record);
  }
  if (v2) {
    CFRelease(v2);
  }
}

void _o_initiate_authentication(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 288) & 4) != 0)
  {
    if (*(void *)(a1 + 152))
    {
      for (uint64_t i = 0LL; i != 160; i += 32LL)
      {
        int v3 = (_OWORD *)((char *)&unk_18A2FBDD8 + i);
        uint64_t v4 = *(const void **)((char *)&unk_18A2FBDD8 + i + 8);
        if (CFSetContainsValue(*(CFSetRef *)(a1 + 152), v4))
        {
          Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 248), v4);
          if (Value)
          {
            uint64_t v6 = Value;
            int v7 = malloc(0x20uLL);
            if (v7)
            {
              __int128 v8 = v3[1];
              _OWORD *v7 = *v3;
              v7[1] = v8;
              *((void *)v7 + 2) = v6;
              *(void *)int v7 = *(void *)(a1 + 160);
              *(void *)(a1 + 160) = v7;
            }

            else
            {
              _os_assumes_log();
            }
          }
        }
      }
    }

    uint64_t v9 = *(void *)(a1 + 160);
    if (v9)
    {
      *(void *)(a1 + 168) = v9;
      (*(void (**)(uint64_t, void))(v9 + 24))(a1, *(void *)(v9 + 16));
    }

    else
    {
      *(_DWORD *)(a1 + 292) = 7;
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
    }
  }

  else
  {
    _o_ldap_basic_auth(a1, 0LL);
  }

void _o_ldap_unbinding(dispatch_queue_t *a1)
{
  DWORD2(v4[0]) = 3;
  dispatch_assert_queue_V2(a1[8]);
  int v2 = _ldap_base_operation_create(a1, 104LL, 512LL, (uint64_t)_dispose_simple, 0LL);
  int v3 = (char *)_ldap_operation_simple_init((uint64_t)v2, v4);
}

void _o_ldap_cleanup(uint64_t a1)
{
  if (*(void *)(a1 + 120))
  {
    tcp_connection_cancel();
    if (*(void *)(a1 + 120))
    {
      tcp_connection_release();
      *(void *)(a1 + 120) = 0LL;
    }
  }

  int v2 = (unsigned int *)(a1 + 288);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3 & 0xFFFFFF7F, v2));
  dispatch_barrier_sync(*(dispatch_queue_t *)(a1 + 208), &__block_literal_global);
  int v4 = *(_DWORD *)(a1 + 292);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  _o_disconnected(a1, a1 + 72, v4);
  _o_disconnected(a1, a1 + 88, v4);
  ldap_connection_retain((id)a1);
  __int128 v5 = *(dispatch_group_s **)(a1 + 32);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 0x40000000LL;
  v7[2] = ___o_disconnect_cleanup_block_invoke;
  v7[3] = &__block_descriptor_tmp_101;
  v7[4] = a1;
  int v8 = v4;
  dispatch_group_notify(v5, global_queue, v7);
  dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
}

void ___ldap_async_function_block_invoke(uint64_t a1)
{
}

void ___o_start_connection_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 208));
  if (a2 == 1)
  {
    *(_DWORD *)(v3 + 292) = 0;
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(v3 + 8), (void *)v3, (dispatch_function_t)_s_next_state);
  }

  else if (a2 == 3)
  {
    int v4 = *(dispatch_queue_s **)(v3 + 8);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    v5[2] = ___state_set_block_invoke;
    v5[3] = &__block_descriptor_tmp_50;
    v5[4] = v3;
    char v6 = 10;
    dispatch_barrier_sync(v4, v5);
  }

void ___o_initiate_tls_handshake_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      ___o_initiate_tls_handshake_block_invoke_cold_1();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)(v4 + 292) = 10003;
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(v4 + 8), (void *)v4, (dispatch_function_t)_s_next_state);
  }

  else
  {
    __int128 v5 = *(void **)(a1 + 32);
    ldap_connection_retain(v5);
    char v6 = (dispatch_group_s *)v5[7];
    int v7 = (dispatch_queue_s *)v5[8];
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = ___ldap_async_function_block_invoke;
    v8[3] = &__block_descriptor_tmp_51;
    v8[4] = _o_negotiate_ssl;
    v8[5] = v5;
    dispatch_group_async(v6, v7, v8);
  }

void _o_negotiate_ssl(uint64_t a1)
{
  int v2 = SSLCreateContext((CFAllocatorRef)*MEMORY[0x189604DB0], kSSLClientSide, kSSLStreamType);
  *(void *)(a1 + 128) = v2;
  if (v2)
  {
    SSLSetConnection(v2, (SSLConnectionRef)a1);
    if (SSLSetIOFuncs(*(SSLContextRef *)(a1 + 128), (SSLReadFunc)_secure_read, (SSLWriteFunc)_secure_write))
    {
LABEL_3:
      *(_DWORD *)(a1 + 292) = 10003;
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
      return;
    }

    uint64_t v3 = *(const __CFArray **)(a1 + 256);
    if (v3) {
      SSLSetCertificate(*(SSLContextRef *)(a1 + 128), v3);
    }
    int v4 = *(_DWORD *)(a1 + 288);
    if ((v4 & 0x400) != 0)
    {
      char v6 = *(SSLContext **)(a1 + 128);
      __int128 v5 = *(const char **)(a1 + 264);
    }

    else
    {
      if ((v4 & 0x1000) == 0)
      {
LABEL_13:
        SSLSetProtocolVersionMin(*(SSLContextRef *)(a1 + 128), kSSLProtocol3);
        ldap_connection_retain((id)a1);
        uint64_t v9 = *(dispatch_group_s **)(a1 + 16);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 0x40000000LL;
        block[2] = ___o_negotiate_ssl_block_invoke;
        block[3] = &__block_descriptor_tmp_56;
        block[4] = a1;
        dispatch_group_async(v9, global_queue, block);
        return;
      }

      __int128 v5 = *(const char **)(a1 + 264);
      char v6 = *(SSLContext **)(a1 + 128);
      if (!v5)
      {
        SSLClose(*(SSLContextRef *)(a1 + 128));
        int v7 = *(const void **)(a1 + 128);
        if (v7)
        {
          CFRelease(v7);
          *(void *)(a1 + 128) = 0LL;
        }

        goto LABEL_3;
      }
    }

    size_t v8 = strlen(v5);
    SSLSetPeerDomainName(v6, v5, v8);
    goto LABEL_13;
  }

BOOL _enqueue_operation_with_release(uint64_t a1, char *a2)
{
  int v2 = _enqueue_operation(a1, a2);
  uint64_t v3 = v2;
  if (v2) {
    ldap_operation_release(v2);
  }
  return v3 != 0LL;
}

void *_ldap_base_operation_create(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  uint64_t v9 = ldap_operation_obj_alloc(a2);
  if (!v9) {
    _ldap_connection_create_cold_1();
  }
  __int128 v10 = v9;
  v9[4] = ldap_connection_retain(a1);
  *((_DWORD *)v10 + 20) = _ldap_connection_next_messageID((uint64_t)a1);
  v10[9] = a4;
  v10[5] = a3;
  if (a5) {
    v10[3] = _Block_copy(a5);
  }
  return v10;
}

void _dispose_simple(uint64_t a1)
{
  int v2 = *(void **)(a1 + 88);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 88) = 0LL;
  }

void *_ldap_operation_simple_init(uint64_t a1, _DWORD *a2)
{
  int v2 = (void *)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  *a2 = *(_DWORD *)(a1 + 80);
  size_t v4 = length_LDAPMessage();
  __int128 v5 = malloc(v4);
  v2[11] = v5;
  char v6 = (void **)(v2 + 11);
  if (!v5) {
    goto LABEL_4;
  }
  int v7 = v2 + 12;
  if (encode_LDAPMessage())
  {
    free(*v6);
    SSLContext *v6 = 0LL;
LABEL_4:
    ldap_operation_release(v2);
    return 0LL;
  }

  if ((*(_BYTE *)(v3 + 288) & 3) == 0 && *(void *)(v3 + 184))
  {
    uint64_t v12 = v2[4];
    int v13 = (*(_DWORD *)(v12 + 288) >> 5) & 1;
    unsigned int v14 = (void *)v2[11];
    input_message_buffer.size_t length = v2[12];
    input_message_buffer.value = v14;
    if (gss_wrap( &minor_status,  *(gss_ctx_id_t *)(v12 + 184),  v13,  *(_DWORD *)(v12 + 192),  &input_message_buffer,  0LL,  &output_message_buffer))
    {
      SSLContext *v6 = 0LL;
      v2[12] = 0LL;
    }

    else
    {
      size_t length = output_message_buffer.length;
      unsigned int v16 = bswap32(output_message_buffer.length);
      size_t v17 = output_message_buffer.length + 4;
      size_t *v7 = output_message_buffer.length + 4;
      __int128 v18 = malloc(v17);
      SSLContext *v6 = v18;
      *__int128 v18 = v16;
      memcpy(v18 + 1, output_message_buffer.value, length);
      gss_release_buffer(&minor_status, &output_message_buffer);
    }

    gss_release_buffer(&minor_status, &input_message_buffer);
  }

  uint64_t v19 = *(void *)(v3 + 200);
  size_t length_low = *v7;
  if (v19)
  {
    output_message_buffer.size_t length = 0LL;
    LODWORD(input_message_buffer.length) = 0;
    srp_encode( v19,  (uint64_t)*v6,  length_low,  &output_message_buffer,  (unsigned int *)&input_message_buffer,  v8,  v9,  v10);
    free(*v6);
    size_t length_low = LODWORD(input_message_buffer.length);
    uint64_t v21 = malloc(LODWORD(input_message_buffer.length));
    SSLContext *v6 = v21;
    memcpy(v21, (const void *)output_message_buffer.length, length_low);
    size_t *v7 = length_low;
  }

  if (!length_low) {
    goto LABEL_4;
  }
  return v2;
}

uint64_t _secure_read(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  int v10 = -9803;
  if ((*(_BYTE *)(a1 + 289) & 1) != 0)
  {
    uint64_t v4 = 4294957490LL;
  }

  else
  {
    uint64_t v3 = *(dispatch_queue_s **)(a1 + 208);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = ___secure_read_block_invoke;
    v6[3] = &unk_18A2FBC28;
    v6[4] = &v7;
    v6[5] = a3;
    v6[6] = a1;
    v6[7] = a2;
    dispatch_barrier_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v8 + 6);
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t _secure_write(uint64_t a1, void *buffer, size_t *a3)
{
  if (!*(void *)(a1 + 120) || (*(_BYTE *)(a1 + 289) & 1) != 0) {
    return 4294957490LL;
  }
  dispatch_data_create(buffer, *a3, 0LL, 0LL);
  tcp_connection_write();
  return 0LL;
}

void ___o_negotiate_ssl_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  memset(v9, 0, sizeof(v9));
  int v10 = 0;
  do
  {
    OSStatus v3 = SSLHandshake(*(SSLContextRef *)(v2 + 128));
    usleep(0x3E8u);
  }

  while (v3 == -9803);
  if (v3)
  {
    _os_assumes_log();
    uint64_t v4 = MEMORY[0x1895F87A8];
    __int128 v5 = *(dispatch_queue_s **)(v2 + 208);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___tls_handshake_loop_block_invoke;
    block[3] = &__block_descriptor_tmp_69;
    block[4] = v2;
    dispatch_barrier_sync(v5, block);
    tcp_connection_get_remote();
    int v6 = *(_DWORD *)(v2 + 288);
    if ((v6 & 3) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = LOBYTE(v9[0]);
        *(_WORD *)&buf[18] = 2098;
        *(void *)&buf[20] = v9;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v3;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = v6;
        _os_log_error_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "connection: %p, address: %{public,network:sockaddr}.*P, error: %{AppleLDAPTypes:errSSL}d, flags: %{AppleLDAPTypes:flags}d",  buf,  0x28u);
      }

      uint64_t v7 = *(dispatch_queue_s **)(v2 + 208);
      *(void *)buf = v4;
      *(void *)&buf[8] = 0x40000000LL;
      *(void *)&buf[16] = ___fail_host_block_invoke;
      *(void *)&buf[24] = &__block_descriptor_tmp_70;
      *(void *)&buf[32] = v2;
      int v12 = 10003;
      dispatch_barrier_sync(v7, buf);
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = LOBYTE(v9[0]);
      *(_WORD *)&buf[18] = 2098;
      *(void *)&buf[20] = v9;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v3;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v6;
      _os_log_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "connection: %p, TLS: auto, address: %{public,network:sockaddr}.*P, error: %{AppleLDAPTypes:errSSL}d, flags: %{Ap pleLDAPTypes:flags}d",  buf,  0x28u);
    }
  }

  else
  {
    *(_DWORD *)(v2 + 292) = 0;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
    {
      tcp_connection_get_remote();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        ___o_negotiate_ssl_block_invoke_cold_1();
      }
    }
  }

  dispatch_barrier_sync_f(*(dispatch_queue_t *)(v2 + 8), (void *)v2, (dispatch_function_t)_s_next_state);
  ldap_connection_release(*(id *)(a1 + 32));
}

void ___secure_read_block_invoke(uint64_t a1)
{
  buffer_ptr = 0LL;
  uint64_t v2 = *(size_t **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  size_t v4 = *v2;
  size_t v8 = 0LL;
  if ((*(_DWORD *)(v3 + 292) - 10001) > 1)
  {
    __int128 v5 = *(dispatch_data_s **)(v3 + 216);
    if (v5)
    {
      int v6 = dispatch_data_create_map(v5, (const void **)&buffer_ptr, &v8);
      if (v4 <= v8)
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
        memmove(*(void **)(a1 + 56), buffer_ptr, v4);
        uint64_t v7 = *(dispatch_object_s **)(*(void *)(a1 + 48) + 216LL);
        if (v7)
        {
          dispatch_release(v7);
          *(void *)(*(void *)(a1 + 48) + 216LL) = 0LL;
        }

        if (v8 > v4) {
          *(void *)(*(void *)(a1 + 48) + 216LL) = dispatch_data_create_subrange(v6, v4, v8 - v4);
        }
      }

      else
      {
        **(void **)(a1 + 40) = 0LL;
      }

      if (v6) {
        dispatch_release(v6);
      }
    }

    else
    {
      size_t *v2 = 0LL;
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -9806;
  }

void ___secure_write_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 == 57)
    {
      uint64_t v3 = *(void *)(a1 + 32);
      size_t v4 = *(dispatch_queue_s **)(v3 + 8);
      v5[0] = MEMORY[0x1895F87A8];
      v5[1] = 0x40000000LL;
      v5[2] = ___state_set_block_invoke;
      v5[3] = &__block_descriptor_tmp_50;
      v5[4] = v3;
      char v6 = 11;
      dispatch_barrier_sync(v4, v5);
    }
  }

  else
  {
    _schedule_read(*(void *)(a1 + 32));
  }

  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

uint64_t _schedule_read(uint64_t result)
{
  if (result && (*(_BYTE *)(result + 288) & 0xC0) != 0)
  {
    unint64_t v1 = (unsigned int *)(result + 288);
    do
      unsigned int v2 = __ldaxr(v1);
    while (__stlxr(v2 | 8, v1));
    if ((v2 & 8) == 0) {
      return tcp_connection_read();
    }
  }

  return result;
}

void ___schedule_read_block_invoke(uint64_t a1, dispatch_data_s *concat, int a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 208));
  char v6 = (unsigned int *)(v5 + 288);
  do
    unsigned int v7 = __ldaxr(v6);
  while (__stlxr(v7 & 0xFFFFFFF7, v6));
  if (a3)
  {
    if (a3 == 57 || a3 == 54)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v14 = 134218240;
        *(void *)&v14[4] = v5;
        *(_WORD *)&v14[12] = 1024;
        *(_DWORD *)&v14[14] = a3;
        _os_log_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "connection: %p, error: %{errno}d",  v14,  0x12u);
      }

      size_t v8 = *(dispatch_queue_s **)(v5 + 8);
      *(void *)unsigned int v14 = MEMORY[0x1895F87A8];
      *(void *)&v14[8] = 0x40000000LL;
      *(void *)&v14[16] = ___state_set_block_invoke;
      uint64_t v15 = &__block_descriptor_tmp_50;
      unsigned int v16 = (void (*)(uint64_t))v5;
      char v9 = 11;
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        ___schedule_read_block_invoke_cold_1();
      }
      size_t v8 = *(dispatch_queue_s **)(v5 + 8);
      *(void *)unsigned int v14 = MEMORY[0x1895F87A8];
      *(void *)&v14[8] = 0x40000000LL;
      *(void *)&v14[16] = ___state_set_block_invoke;
      uint64_t v15 = &__block_descriptor_tmp_50;
      unsigned int v16 = (void (*)(uint64_t))v5;
      char v9 = 8;
    }

    LOBYTE(v17) = v9;
    dispatch_barrier_sync(v8, v14);
  }

  else
  {
    int v10 = *(dispatch_data_s **)(v5 + 216);
    if (v10)
    {
      concat = dispatch_data_create_concat(v10, concat);
      __int128 v11 = *(dispatch_object_s **)(v5 + 216);
      if (v11) {
        dispatch_release(v11);
      }
    }

    else
    {
      dispatch_retain(concat);
    }

    *(void *)(v5 + 216) = concat;
    _schedule_read(v5);
    ldap_connection_retain((id)v5);
    int v12 = *(dispatch_group_s **)(v5 + 56);
    uint64_t v13 = *(dispatch_queue_s **)(v5 + 64);
    *(void *)unsigned int v14 = MEMORY[0x1895F87A8];
    *(void *)&v14[8] = 0x40000000LL;
    *(void *)&v14[16] = ___ldap_async_function_block_invoke;
    uint64_t v15 = &__block_descriptor_tmp_51;
    unsigned int v16 = _o_process_buffer;
    uint64_t v17 = v5;
    dispatch_group_async(v12, v13, v14);
  }

void _o_process_buffer(uint64_t a1)
{
  size_t processed = 0LL;
  buffer_ptr = 0LL;
  uint64_t v33 = 0LL;
  __int128 v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  uint64_t v36 = 0LL;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  unsigned int v2 = *(SSLContext **)(a1 + 128);
  if (v2)
  {
    output_message_buffer.size_t length = 0LL;
    output_message_buffer.value = &output_message_buffer;
    uint64_t v31 = 0x2000000000LL;
    uint64_t v32 = 0LL;
    if (SSLGetSessionState(v2, (SSLSessionState *)&state) || LODWORD(state.length) != 2)
    {
      _Block_object_dispose(&output_message_buffer, 8);
      goto LABEL_63;
    }

    uint64_t v3 = *(dispatch_queue_s **)(a1 + 208);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = ___o_process_buffer_block_invoke;
    block[3] = &unk_18A2FBC90;
    block[4] = &output_message_buffer;
    void block[5] = a1;
    dispatch_sync(v3, block);
    uint64_t v5 = (size_t *)((char *)output_message_buffer.value + 24);
    uint64_t v4 = *((void *)output_message_buffer.value + 3);
    if (v4)
    {
      char v6 = 0LL;
      size_t v7 = 0LL;
      do
      {
        char v6 = (char *)reallocf(v6, v4 + v7);
        size_t processed = 0LL;
        OSStatus v8 = SSLRead(*(SSLContextRef *)(a1 + 128), &v6[v7], *v5, &processed);
        char v9 = (size_t *)((char *)output_message_buffer.value + 24);
        if (processed)
        {
          v7 += processed;
          if (*v9 > processed) {
            *v9 -= processed;
          }
          else {
            *char v9 = 0LL;
          }
        }

        else
        {
          SSLGetBufferedReadSize(*(SSLContextRef *)(a1 + 128), v9);
        }

        if (v8) {
          BOOL v10 = v8 == -9803;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10) {
          break;
        }
        uint64_t v5 = (size_t *)((char *)output_message_buffer.value + 24);
        uint64_t v4 = *((void *)output_message_buffer.value + 3);
      }

      while (v4);
      if (v7)
      {
        dispatch_data_t v11 = dispatch_data_create(v6, v7, 0LL, (dispatch_block_t)*MEMORY[0x1895F8A88]);
        v34[3] = (uint64_t)v11;
      }

      else if (v6)
      {
        free(v6);
      }
    }

    _Block_object_dispose(&output_message_buffer, 8);
  }

  else
  {
    int v12 = *(dispatch_queue_s **)(a1 + 208);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 0x40000000LL;
    v28[2] = ___o_process_buffer_block_invoke_2;
    v28[3] = &unk_18A2FBCB8;
    v28[4] = &v33;
    v28[5] = a1;
    dispatch_barrier_sync(v12, v28);
  }

  concat = (dispatch_data_s *)v34[3];
  if (concat)
  {
    unsigned int v14 = *(dispatch_data_s **)(a1 + 104);
    if (!v14) {
      goto LABEL_31;
    }
    concat = dispatch_data_create_concat(v14, (dispatch_data_t)v34[3]);
    uint64_t v15 = *(dispatch_object_s **)(a1 + 104);
    if (v15)
    {
      dispatch_release(v15);
      *(void *)(a1 + 104) = 0LL;
    }

    unsigned int v16 = (dispatch_object_s *)v34[3];
    if (v16)
    {
      dispatch_release(v16);
      v34[3] = 0LL;
    }

    if (concat)
    {
LABEL_31:
      dispatch_data_t v17 = dispatch_data_create_map(concat, (const void **)&buffer_ptr, &processed);
      unint64_t v18 = 0LL;
      do
      {
        if ((*(_BYTE *)(a1 + 288) & 3) != 0 || (uint64_t v21 = *(gss_ctx_id_t_desc_struct **)(a1 + 184)) == 0LL)
        {
          uint64_t v19 = *(void *)(a1 + 200);
          if (v19)
          {
            LODWORD(state.length) = 0;
            output_message_buffer.size_t length = 0LL;
            if (srp_decode( v19,  (char *)buffer_ptr + v18,  (int)processed - (int)v18,  &output_message_buffer,  (unsigned int *)&state))
            {
              size_t v20 = processed;
            }

            else
            {
              size_t v20 = processed;
              if (LODWORD(state.length)) {
                _o_ldap_receive_messages(a1, output_message_buffer.length, LODWORD(state.length));
              }
            }

            unint64_t v24 = v20 - v18;
          }

          else
          {
            unint64_t v24 = _o_ldap_receive_messages(a1, (uint64_t)buffer_ptr + v18, processed - v18);
          }
        }

        else
        {
          __int128 v22 = (unsigned int *)((char *)buffer_ptr + v18);
          if (processed - v18 < 4) {
            size_t v23 = 0LL;
          }
          else {
            size_t v23 = bswap32(*v22);
          }
          unint64_t v24 = v23 + 4;
          if (v23 + 4 <= processed - v18)
          {
            state.size_t length = v23;
            state.value = v22 + 1;
            if (gss_unwrap(&minor_status, v21, &state, &output_message_buffer, 0LL, (gss_qop_t *)(a1 + 192)))
            {
              _os_assumes_log();
            }

            else if (output_message_buffer.length)
            {
              value = output_message_buffer.value;
              _o_ldap_receive_messages(a1, (uint64_t)output_message_buffer.value, output_message_buffer.length);
              if (value) {
                free(value);
              }
            }
          }

          else
          {
            unint64_t v24 = 0LL;
          }
        }

        v18 += v24;
        if (v24) {
          BOOL v25 = processed > v18;
        }
        else {
          BOOL v25 = 0;
        }
      }

      while (v25);
      if (processed <= v18)
      {
        if (v17) {
          dispatch_release(v17);
        }
        gss_ctx_id_t v27 = concat;
        goto LABEL_62;
      }

      *(void *)(a1 + 104) = dispatch_data_create_subrange(v17, v18, processed - v18);
      dispatch_release(concat);
      if (v17)
      {
        gss_ctx_id_t v27 = v17;
LABEL_62:
        dispatch_release(v27);
      }
    }
  }

LABEL_63:
  _Block_object_dispose(&v33, 8);
}

dispatch_data_s *___o_process_buffer_block_invoke(uint64_t a1)
{
  uint64_t result = *(dispatch_data_s **)(*(void *)(a1 + 40) + 216LL);
  if (result)
  {
    uint64_t result = (dispatch_data_s *)dispatch_data_get_size(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

uint64_t ___o_process_buffer_block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *(void *)(*(void *)(result + 40) + 216LL);
  *(void *)(*(void *)(result + 40) + 216LL) = 0LL;
  return result;
}

unint64_t _o_ldap_receive_messages(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v89 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  unint64_t v5 = 0LL;
  if (!a3) {
    return v5;
  }
  char v6 = @"dn";
  size_t v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  alloc = (const __CFAllocator *)*MEMORY[0x189604DB0];
  do
  {
    int v8 = decode_LDAPMessage();
    if (v8)
    {
      if (v8 != 1859794437 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        _o_ldap_receive_messages_cold_1();
      }
      return v5;
    }

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 64));
    if (!v75) {
      goto LABEL_27;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 64));
    uint64_t v9 = *(void *)(v4 + 72);
    if (!v9) {
      goto LABEL_27;
    }
    while (*(_DWORD *)(v9 + 80) != v75)
    {
      uint64_t v9 = *(void *)(v9 + 8);
      if (!v9) {
        goto LABEL_27;
      }
    }

    ldap_operation_retain((id)v9);
    BOOL v10 = *(const void **)(v9 + 64);
    if (v10)
    {
      CFRelease(v10);
      *(void *)(v9 + 64) = 0LL;
    }

    dispatch_data_t v11 = *(const void **)(v4 + 296);
    if (v11)
    {
      CFRelease(v11);
      *(void *)(v4 + 296) = 0LL;
    }

    if (!*(void *)(v9 + 24))
    {
      _o_operation_complete(v4, v9, 0);
      goto LABEL_26;
    }

    int v12 = *(void **)(v9 + 48);
    if (v12)
    {
      os_retain(v12);
      uint64_t v72 = voucher_adopt();
    }

    else
    {
      uint64_t v72 = 0LL;
    }

    switch(v76)
    {
      case 0:
      case 7:
      case 21:
        goto LABEL_22;
      case 2:
        size_t v20 = *(void **)(v4 + 136);
        if (v20)
        {
          free(v20);
          *(void *)(v4 + 136) = 0LL;
        }

        if (v82)
        {
          size_t v21 = *(void *)v82;
          *(void *)(v4 + 144) = *(void *)v82;
          __int128 v22 = v6;
          size_t v23 = malloc(v21 + 1);
          *(void *)(v4 + 136) = v23;
          memcpy(v23, *(const void **)(v82 + 8), v21);
          *((_BYTE *)v23 + v21) = 0;
          char v6 = v22;
        }

        CFIndex v14 = v80;
        uint64_t v13 = v81;
        size_t v7 = alloc;
        goto LABEL_20;
      case 5:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(v9 + 32) + 64LL));
        theDict = CFDictionaryCreateMutable(v7, v79, MEMORY[0x189605240], MEMORY[0x189605250]);
        if (!theDict) {
          _ldap_connection_create_cold_1();
        }
        CFStringRef v24 = CFStringCreateWithBytes(v7, v78, v77, 0x8000100u, 0);
        if (!v24) {
          _ldap_connection_create_cold_1();
        }
        CFStringRef v25 = v24;
        unint64_t v69 = v5;
        uint64_t v68 = v4;
        Mutable = CFArrayCreateMutable(v7, 1LL, MEMORY[0x189605228]);
        if (!Mutable) {
          _ldap_connection_create_cold_1();
        }
        gss_ctx_id_t v27 = Mutable;
        CFArrayAppendValue(Mutable, v25);
        CFDictionarySetValue(theDict, @"dn", v27);
        CFRelease(v25);
        CFRelease(v27);
        if (v79)
        {
          uint64_t v28 = 0LL;
          unint64_t v70 = a3;
          do
          {
            CFIndex v29 = v80 + 32 * v28;
            CFStringRef v30 = CFStringCreateWithBytes(v7, *(const UInt8 **)(v29 + 8), *(void *)v29, 0x8000100u, 0);
            if (v30)
            {
              CFStringRef v31 = v30;
              unsigned int v33 = *(_DWORD *)(v29 + 16);
              uint64_t v32 = (_DWORD *)(v29 + 16);
              CFMutableArrayRef v34 = CFArrayCreateMutable(v7, v33, MEMORY[0x189605228]);
              if (!v34) {
                _ldap_connection_create_cold_1();
              }
              uint64_t v35 = v34;
              CFStringRef key = v31;
              if (*v32)
              {
                uint64_t v36 = 0LL;
                unint64_t v37 = 0LL;
                v38 = (uint64_t *)(v80 + 32 * v28 + 24);
                do
                {
                  uint64_t v39 = *v38;
                  uint64_t v40 = *v38 + v36;
                  v41 = CFStringCreateWithBytes(alloc, *(const UInt8 **)(v40 + 8), *(void *)v40, 0x8000100u, 0);
                  if (v41 || (v41 = CFDataCreate(alloc, *(const UInt8 **)(v40 + 8), *(void *)(v39 + v36))) != 0LL)
                  {
                    CFArrayAppendValue(v35, v41);
                    CFRelease(v41);
                  }

                  else
                  {
                    _os_assumes_log();
                  }

                  ++v37;
                  v36 += 16LL;
                }

                while (v37 < *v32);
              }

              CFDictionarySetValue(theDict, key, v35);
              CFRelease(v35);
              CFRelease(key);
              a3 = v70;
              size_t v7 = alloc;
            }

            else
            {
              _os_assumes_log();
            }

            ++v28;
          }

          while (v28 != v79);
        }

        v49 = (unsigned int *)(v9 + 136);
        do
        {
          unsigned int v50 = __ldaxr(v49);
          signed int v51 = v50 + 1;
        }

        while (__stlxr(v51, v49));
        BOOL v52 = v51 == 50 || v51 % 100 == 0;
        uint64_t v4 = v68;
        unint64_t v5 = v69;
        char v6 = @"dn";
        if (v52 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v61 = *(void *)(v9 + 32);
          int v62 = *(_DWORD *)(v9 + 80);
          int v63 = *(_DWORD *)(v9 + 136);
          *(_DWORD *)block = 134218496;
          *(void *)&block[4] = v61;
          *(_WORD *)&block[12] = 1024;
          *(_DWORD *)&block[14] = v62;
          *(_WORD *)&block[18] = 1024;
          *(_DWORD *)&block[20] = v63;
          _os_log_debug_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "connection: %p, ldap msgid: %u, received results: %d - status",  block,  0x18u);
        }

        ldap_operation_retain((id)v9);
        uint64_t v53 = *(void *)(v9 + 32);
        v55 = *(dispatch_queue_s **)(v53 + 24);
        v54 = *(dispatch_group_s **)(v53 + 32);
        *(void *)block = MEMORY[0x1895F87A8];
        *(void *)&block[8] = 0x40000000LL;
        *(void *)&block[16] = ___o_query_result_block_invoke;
        v85 = &__block_descriptor_tmp_68;
        uint64_t v86 = v9;
        uint64_t v87 = v9;
        v88 = theDict;
        dispatch_group_async(v54, v55, block);
        goto LABEL_22;
      case 6:
        v42 = v83;
        if (!v83 || (_DWORD)v77) {
          goto LABEL_81;
        }
        v43 = *(void **)(v9 + 120);
        uint64_t v44 = v4;
        unint64_t v45 = v5;
        if (v43)
        {
          free(v43);
          *(void *)(v9 + 120) = 0LL;
          v42 = v83;
        }

        unint64_t v46 = *v42;
        if (!(_DWORD)v46) {
          goto LABEL_77;
        }
        uint64_t v47 = 0LL;
        unint64_t v48 = 0LL;
        break;
      case 9:
      case 11:
      case 13:
      case 15:
      case 17:
      case 20:
        CFIndex v14 = v80;
        uint64_t v13 = v81;
LABEL_20:
        *(void *)(v9 + 64) = CFStringCreateWithBytes(v7, v13, v14, 0x8000100u, 0);
        int v15 = v77;
        uint64_t v16 = v4;
        uint64_t v17 = v9;
        goto LABEL_21;
      default:
        _os_assumes_log();
        goto LABEL_22;
    }

    while (strncmp( *(const char **)(*((void *)v42 + 1) + v47 + 8),  "1.2.840.113556.1.4.319",  *(void *)(*((void *)v42 + 1) + v47)))
    {
LABEL_62:
      ++v48;
      v47 += 32LL;
      if (v48 >= v46) {
        goto LABEL_77;
      }
    }

    if (decode_PagedSearchControlValue())
    {
      v42 = v83;
      unint64_t v46 = *v83;
      goto LABEL_62;
    }

    v56 = v6;
    size_t v57 = *(void *)&block[8];
    if (*(void *)&block[8])
    {
      *(_DWORD *)(v9 + 140) = *(_DWORD *)block;
      v58 = malloc(v57);
      *(void *)(v9 + 120) = v58;
      *(void *)(v9 + 128) = v57;
      memcpy(v58, *(const void **)&block[16], v57);
    }

    free_PagedSearchControlValue();
    char v6 = v56;
LABEL_77:
    unint64_t v5 = v45;
    uint64_t v4 = v44;
    size_t v7 = alloc;
    if (*(void *)(v9 + 120))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
      {
        int v64 = *(_DWORD *)(v9 + 80);
        int v65 = *(_DWORD *)(v9 + 136);
        int v66 = *(_DWORD *)(v9 + 140);
        *(_DWORD *)block = 134218752;
        *(void *)&block[4] = v44;
        *(_WORD *)&block[12] = 1024;
        *(_DWORD *)&block[14] = v64;
        *(_WORD *)&block[18] = 1024;
        *(_DWORD *)&block[20] = v65;
        LOWORD(v85) = 1024;
        *(_DWORD *)((char *)&v85 + 2) = v66;
        _os_log_debug_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "connection: %p, ldap msgid: %u, delivered: %d, approx. remaining: %u",  block,  0x1Eu);
      }

      uint64_t v16 = v44;
      uint64_t v17 = v9;
      int v15 = 10010;
    }

    else
    {
LABEL_81:
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        int v59 = *(_DWORD *)(v9 + 80);
        int v60 = *(_DWORD *)(v9 + 136);
        *(_DWORD *)block = 134218496;
        *(void *)&block[4] = v4;
        *(_WORD *)&block[12] = 1024;
        *(_DWORD *)&block[14] = v59;
        *(_WORD *)&block[18] = 1024;
        *(_DWORD *)&block[20] = v60;
        _os_log_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "connection: %p, ldap msgid: %u, delivered: %d",  block,  0x18u);
      }

      uint64_t v16 = v4;
      uint64_t v17 = v9;
      int v15 = 0;
    }

LABEL_26:
    ldap_operation_release((id)v9);
LABEL_27:
    free_LDAPMessage();
  }

  while (v5 < a3);
  return v5;
}

void _o_operation_complete(uint64_t a1, uint64_t a2, int a3)
{
  char v6 = (unint64_t *)(a2 + 40);
  if (a3) {
    uint64_t v7 = 5LL;
  }
  else {
    uint64_t v7 = 1LL;
  }
  do
    unint64_t v8 = __ldaxr(v6);
  while (__stlxr(v8 | v7, v6));
  if ((v8 & 1) == 0)
  {
    do
      unint64_t v9 = __ldaxr(v6);
    while (__stlxr(v9 & 0xFFFFFFFFFFFFFFF7LL, v6));
    if ((*(_BYTE *)(a2 + 41) & 4) != 0)
    {
      BOOL v10 = *(dispatch_source_s **)(a2 + 112);
      if (v10)
      {
        dispatch_source_cancel(v10);
        dispatch_data_t v11 = *(dispatch_object_s **)(a2 + 112);
        if (v11)
        {
          dispatch_release(v11);
          *(void *)(a2 + 112) = 0LL;
        }
      }
    }

    if ((v9 & 8) != 0)
    {
      uint64_t v12 = *(void *)(a2 + 8);
      uint64_t v13 = *(void **)(a2 + 16);
      if (v12)
      {
        *(void *)(v12 + 16) = v13;
        uint64_t v13 = *(void **)(a2 + 16);
      }

      else
      {
        *(void *)(a1 + 80) = v13;
      }

      void *v13 = v12;
      if ((*(_BYTE *)(a2 + 41) & 1) == 0)
      {
        CFIndex v14 = (unint64_t *)(a1 + 112);
        do
          unint64_t v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
      }

      do
        unint64_t v16 = __ldaxr(v6);
      while (__stlxr(v16 | 2, v6));
      if ((v16 & 2) == 0)
      {
        if (*(void *)(a2 + 24))
        {
          uint64_t v17 = *(void **)(a2 + 48);
          if (v17)
          {
            os_retain(v17);
            uint64_t v18 = voucher_adopt();
          }

          else
          {
            uint64_t v18 = 0LL;
          }

          size_t v20 = *(dispatch_queue_s **)(a1 + 24);
          uint64_t v19 = *(dispatch_group_s **)(a1 + 32);
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 0x40000000LL;
          block[2] = ___o_operation_complete_block_invoke;
          block[3] = &__block_descriptor_tmp_64;
          int v23 = a3;
          block[4] = a1;
          void block[5] = a2;
          dispatch_group_async(v19, v20, block);
          if (v18)
          {
            size_t v21 = (void *)voucher_adopt();
            os_release(v21);
          }
        }

        else
        {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
          ldap_operation_release((id)a2);
        }
      }

      _o_ldap_wakeup(a1);
    }
  }

void ___o_operation_complete_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int v2 = *(_DWORD *)(a1 + 48);
  if (v2) {
    BOOL v3 = v2 == 10010;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(_DWORD *)(*(void *)(a1 + 40) + 80LL);
    int v6 = 134218496;
    uint64_t v7 = v4;
    __int16 v8 = 1024;
    int v9 = v5;
    __int16 v10 = 1024;
    int v11 = v2;
    _os_log_error_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "connection: %p, ldap msgid: %u, error: %{AppleLDAPTypes:ldap_error_t}d",  (uint8_t *)&v6,  0x18u);
  }

  (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 24LL) + 16LL))();
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56LL));
  ldap_operation_release(*(id *)(a1 + 40));
}

void _o_ldap_wakeup(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  int v2 = (unint64_t *)(a1 + 112);
  if (*(uint64_t *)(a1 + 112) <= 99)
  {
    uint64_t v3 = *(void *)(a1 + 88);
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 8);
      int v5 = *(void **)(v3 + 16);
      if (v4)
      {
        *(void *)(v4 + 16) = v5;
        int v5 = *(void **)(v3 + 16);
      }

      else
      {
        *(void *)(a1 + 96) = v5;
      }

      void *v5 = v4;
      *(void *)(v3 + 8) = 0LL;
      int v6 = *(void **)(a1 + 80);
      *(void *)(v3 + 16) = v6;
      void *v6 = v3;
      *(void *)(a1 + 80) = v3 + 8;
      do
        unint64_t v7 = __ldaxr(v2);
      while (__stlxr(v7 + 1, v2));
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        int v8 = *(_DWORD *)(v3 + 80);
        uint64_t v9 = *(void *)(v3 + 96);
        *(_DWORD *)buf = 134218496;
        uint64_t v18 = a1;
        __int16 v19 = 1024;
        int v20 = v8;
        __int16 v21 = 1024;
        int v22 = v9;
        _os_log_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "connection: %p, ldap msgid: %d, send data size: %d",  buf,  0x18u);
      }

      __int16 v10 = *(SSLContext **)(a1 + 128);
      if (v10)
      {
        uint64_t v11 = SSLWrite(v10, *(const void **)(v3 + 88), *(void *)(v3 + 96), &processed);
        if ((_DWORD)v11)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            int v15 = *(_DWORD *)(v3 + 80);
            *(_DWORD *)buf = 134218752;
            uint64_t v18 = a1;
            __int16 v19 = 1024;
            int v20 = v15;
            __int16 v21 = 1024;
            int v22 = processed;
            __int16 v23 = 1024;
            int v24 = v11;
            _os_log_error_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "connection: %p, ldap msgid: %d, SSL processed: %d, SSL error: %{AppleLDAPTypes:errSSL}d",  buf,  0x1Eu);
          }

          goto LABEL_14;
        }

        if (!*(void *)(v3 + 24))
        {
LABEL_14:
          uint64_t v12 = *(void *)(v3 + 32);
          uint64_t v13 = v3;
          uint64_t v14 = v11;
LABEL_20:
          _o_operation_complete(v12, v13, v14);
        }
      }

      else
      {
        if (!*(void *)(a1 + 120))
        {
          uint64_t v12 = a1;
          uint64_t v13 = v3;
          uint64_t v14 = 10001LL;
          goto LABEL_20;
        }

        ldap_operation_retain((id)v3);
        tcp_connection_write_buffer();
      }

      _schedule_read(a1);
    }
  }

void ___o_ldap_wakeup_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      ___o_ldap_wakeup_block_invoke_cold_1();
    }
    goto LABEL_4;
  }

  int v6 = *(void **)(a1 + 32);
  if (!v6[3])
  {
LABEL_4:
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(dispatch_queue_s **)(*(void *)(v4 + 32) + 64LL);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = ___o_ldap_wakeup_block_invoke_65;
    v7[3] = &__block_descriptor_tmp_66;
    v7[4] = v4;
    int v8 = a2;
    dispatch_barrier_async(v5, v7);
    return;
  }

  ldap_operation_release(v6);
}

void ___o_ldap_wakeup_block_invoke_65(uint64_t a1)
{
}

void ___o_query_result_block_invoke(uint64_t a1)
{
}

void ___tls_handshake_loop_block_invoke(uint64_t a1)
{
  int v2 = *(const void **)(*(void *)(a1 + 32) + 128LL);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 128LL) = 0LL;
  }

void ___fail_host_block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (*(void *)(*(void *)(a1 + 32) + 120LL) && tcp_connection_get_remote())
  {
    uint64_t v2 = *(void *)(a1 + 32) + 224LL;
    while (1)
    {
      uint64_t v2 = *(void *)v2;
      if (!v2) {
        break;
      }
      if (*(void *)(v2 + 16) == *(void *)v12
        && *(void *)(v2 + 24) == *(void *)&v12[8]
        && *(void *)(v2 + 32) == *(void *)&v12[16]
        && *(_DWORD *)(v2 + 40) == (unint64_t)*(unsigned int *)&v12[24])
      {
        *(_DWORD *)(v2 + 44) = *(_DWORD *)(a1 + 40);
        *(void *)(v2 + 48) = time(0LL) + 60;
        return;
      }
    }

    int v6 = (char *)calloc(1uLL, 0x38uLL);
    *((_DWORD *)v6 + 11) = *(_DWORD *)(a1 + 40);
    *((void *)v6 + 6) = time(0LL) + 60;
    *((_OWORD *)v6 + 1) = *(_OWORD *)v12;
    *(_OWORD *)(v6 + 28) = *(_OWORD *)&v12[12];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 224LL);
    *(void *)int v6 = v7;
    uint64_t v8 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v9 = (void *)(*(void *)(v8 + 224) + 8LL);
    }
    else {
      uint64_t v9 = (void *)(v8 + 232);
    }
    *uint64_t v9 = v6;
    *(void *)(*(void *)(a1 + 32) + 224LL) = v6;
    *((void *)v6 + 1) = *(void *)(a1 + 32) + 224LL;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v14 = v10;
      __int16 v15 = 1024;
      int v16 = v11;
      __int16 v17 = 1040;
      int v18 = v12[0];
      __int16 v19 = 2098;
      int v20 = v12;
      _os_log_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "failed connection: %p, error: %{AppleLDAPTypes:ldap_error_t}d, addres: %{public,network:sockaddr}.*P",  buf,  0x22u);
    }
  }

void ___o_read_rootdse_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(dispatch_queue_s **)(v6 + 208);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  v9[2] = ___o_read_rootdse_block_invoke_2;
  void v9[3] = &__block_descriptor_tmp_71;
  v9[4] = v6;
  v9[5] = a3;
  dispatch_barrier_sync(v7, v9);
  uint64_t v8 = *(void *)(a1 + 32);
  *(_DWORD *)(v8 + 292) = a4;
  dispatch_barrier_sync_f(*(dispatch_queue_t *)(v8 + 8), (void *)v8, (dispatch_function_t)_s_next_state);
}

void ___o_read_rootdse_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(const void **)(*(void *)(a1 + 32) + 152LL);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 152LL) = 0LL;
  }

  *(void *)(*(void *)(a1 + 32) + 152LL) = CFSetCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605258]);
  uint64_t v3 = *(const __CFDictionary **)(a1 + 40);
  if (v3)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(v3, (const void *)LDAP_SUPPORTED_SASL_MECHANISMS);
    if (Value)
    {
      int v5 = Value;
      CFIndex Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        for (CFIndex i = 0LL; i != v7; ++i)
        {
          uint64_t v9 = *(__CFSet **)(*(void *)(a1 + 32) + 152LL);
          ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
          CFSetAddValue(v9, ValueAtIndex);
        }
      }
    }
  }

  CFSetAddValue(*(CFMutableSetRef *)(*(void *)(a1 + 32) + 152LL), @"simple");
}

void _o_ldap_basic_auth(uint64_t a1, const __CFDictionary *a2)
{
  if (!_ldap_mechopts_has_valid_dn(a2))
  {
    int v8 = 34;
LABEL_13:
    *(_DWORD *)(a1 + 292) = v8;
    _ldap_next_authmechanism((void *)a1);
    return;
  }

  if ((*(_WORD *)(a1 + 288) & 0x4023) == 0)
  {
    int v8 = 8;
    goto LABEL_13;
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  memset(v13, 0, sizeof(v13));
  DWORD2(v10) = 1;
  LODWORD(v11) = 3;
  DWORD2(v12) = 1;
  if (a2)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a2, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
    if (Value) {
      _fill_cstring_from_cfstring((char **)&v12, Value, (char **)&v11 + 1);
    }
    int v5 = (const __CFString *)CFDictionaryGetValue(a2, (const void *)LDAP_MECHANISM_OPTION_PASSWORD);
    if (v5) {
      _fill_cstring_from_cfstring((char **)v13 + 1, v5, (char **)v13);
    }
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  v9[2] = ___o_ldap_basic_auth_block_invoke;
  void v9[3] = &__block_descriptor_tmp_76;
  v9[4] = a1;
  uint64_t v6 = _ldap_base_operation_create((void *)a1, 104LL, 512LL, (uint64_t)_dispose_simple, v9);
  CFIndex v7 = (char *)_ldap_operation_simple_init((uint64_t)v6, &v10);
  if (!_enqueue_operation_with_release(a1, v7)) {
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
  }
  free_LDAPMessage();
}

void _o_ldap_crammd5_auth(uint64_t a1, const __CFDictionary *a2)
{
  if (_ldap_mechopts_has_valid_dn(a2))
  {
    _ldap_sasl_fill((uint64_t)v7, @"CRAM-MD5", a2, 0LL);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = ___o_ldap_crammd5_auth_block_invoke;
    v6[3] = &__block_descriptor_tmp_81;
    v6[4] = a1;
    v6[5] = a2;
    uint64_t v4 = _ldap_base_operation_create((void *)a1, 104LL, 512LL, (uint64_t)_dispose_simple, v6);
    int v5 = (char *)_ldap_operation_simple_init((uint64_t)v4, v7);
    free_LDAPMessage();
    if (!_enqueue_operation_with_release(a1, v5)) {
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
    }
  }

  else
  {
    *(_DWORD *)(a1 + 292) = 34;
    _ldap_next_authmechanism((void *)a1);
  }

void _o_ldap_digestmd5_auth(uint64_t a1, const __CFDictionary *a2)
{
  if (_ldap_mechopts_has_valid_dn(a2))
  {
    _ldap_sasl_fill((uint64_t)v7, @"DIGEST-MD5", a2, 0LL);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = ___o_ldap_digestmd5_auth_block_invoke;
    v6[3] = &__block_descriptor_tmp_83;
    v6[4] = a1;
    v6[5] = a2;
    uint64_t v4 = _ldap_base_operation_create((void *)a1, 104LL, 512LL, (uint64_t)_dispose_simple, v6);
    int v5 = (char *)_ldap_operation_simple_init((uint64_t)v4, v7);
    free_LDAPMessage();
    if (!_enqueue_operation_with_release(a1, v5)) {
      _ldap_next_authmechanism((void *)a1);
    }
  }

  else
  {
    *(_DWORD *)(a1 + 292) = 34;
    _ldap_next_authmechanism((void *)a1);
  }

uint64_t _o_ldap_gssapi_auth(uint64_t a1, const void *a2)
{
  uint64_t v4 = malloc(0x28uLL);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  *(void *)uint64_t v4 = CFRetain(a2);
  Value = CFDictionaryGetValue((CFDictionaryRef)a2, (const void *)LDAP_MECHANISM_OPTION_GSSAPI_INITIATOR_CREDENTIAL);
  *((void *)v4 + 2) = 0LL;
  *((void *)v4 + 3) = Value;
  *((void *)v4 + 1) = 0LL;
  uint64_t v6 = CFDictionaryGetValue((CFDictionaryRef)a2, (const void *)LDAP_MECHANISM_OPTION_GSSAPI_TARGET_NAME);
  *((void *)v4 + 4) = v6;
  if (v6)
  {
    CFRetain(v6);
  }

  else if ((*(_BYTE *)(a1 + 289) & 4) != 0)
  {
    input_name_buffer.size_t length = asprintf((char **)&input_name_buffer.value, "ldap@%s", *(const char **)(a1 + 264));
    gss_import_name(&minor_status, &input_name_buffer, MEMORY[0x189607BE8], (gss_name_t *)v4 + 4);
    gss_release_buffer(&minor_status, &input_name_buffer);
  }

  return _o_ldap_gssapi_negotiate(a1, (CFDictionaryRef *)v4, 0LL);
}

void _o_ldap_srp_auth(uint64_t a1, const __CFDictionary *a2)
{
  if (_ldap_mechopts_has_valid_dn(a2))
  {
    _ldap_sasl_fill((uint64_t)v7, @"SRP", a2, 0LL);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = ___o_ldap_srp_auth_block_invoke;
    v6[3] = &__block_descriptor_tmp_99;
    v6[4] = a1;
    v6[5] = a2;
    void v6[6] = 0LL;
    uint64_t v4 = _ldap_base_operation_create((void *)a1, 104LL, 512LL, (uint64_t)_dispose_simple, v6);
    int v5 = (char *)_ldap_operation_simple_init((uint64_t)v4, v7);
    free_LDAPMessage();
    if (!_enqueue_operation_with_release(a1, v5)) {
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
    }
  }

  else
  {
    *(_DWORD *)(a1 + 292) = 34;
    _ldap_next_authmechanism((void *)a1);
  }

BOOL _ldap_mechopts_has_valid_dn(const __CFDictionary *a1)
{
  Value = (const __CFString *)CFDictionaryGetValue(a1, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
  if (!Value) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  uint64_t v2 = _cstr_from_cfstring(Value, (char **)&v6);
  uint64_t v3 = _short_username_from_dn(v2);
  BOOL v4 = v3 != 0LL;
  if (v3) {
    free(v3);
  }
  if (v6) {
    free(v6);
  }
  return v4;
}

void _ldap_next_authmechanism(void *context)
{
  uint64_t v2 = (uint64_t *)*((void *)context + 21);
  if (v2 && (uint64_t v3 = *v2) != 0)
  {
    *((void *)context + 21) = v3;
    ldap_connection_retain(context);
    BOOL v4 = (dispatch_queue_s *)*((void *)context + 8);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    v5[2] = ___ldap_next_authmechanism_block_invoke;
    v5[3] = &__block_descriptor_tmp_78;
    v5[4] = v3;
    void v5[5] = context;
    dispatch_barrier_async(v4, v5);
  }

  else
  {
    dispatch_barrier_sync_f(*((dispatch_queue_t *)context + 1), context, (dispatch_function_t)_s_next_state);
  }

void ___o_ldap_basic_auth_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  *(_DWORD *)(v3 + 292) = a3;
  dispatch_barrier_sync_f(*(dispatch_queue_t *)(v3 + 8), (void *)v3, (dispatch_function_t)_s_next_state);
}

char *_short_username_from_dn(const char *a1)
{
  size_t v2 = strlen(a1);
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x2000000000LL;
  uint64_t v3 = malloc(v2 + 1);
  uint64_t v44 = v3;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x2000000000LL;
  uint64_t v40 = 0LL;
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 0x40000000LL;
  unsigned int v33 = ___dn_normalize_block_invoke;
  CFMutableArrayRef v34 = &unk_18A2FBEA0;
  uint64_t v35 = &v37;
  uint64_t v36 = &v41;
  if (v2)
  {
    uint64_t v4 = 0LL;
    int v5 = 1;
    int v6 = 1;
    while (1)
    {
      int v7 = a1[v4];
      char v8 = a1[v4];
      if (v7 > 60)
      {
        if (v7 != 61)
        {
          if (v7 == 92)
          {
            char v11 = 92;
            if ((v5 & 1) != 0) {
              char v11 = __tolower(92);
            }
            uint64_t v12 = v42[3];
            uint64_t v13 = v38[3];
            v38[3] = v13 + 1;
            *(_BYTE *)(v12 + v13) = v11;
            if (++v4 < v2)
            {
              __darwin_ct_rune_t v14 = a1[v4];
              if ((v5 & 1) != 0) {
                LOBYTE(v14) = __tolower(v14);
              }
              uint64_t v19 = v42[3];
              uint64_t v20 = v38[3];
              v38[3] = v20 + 1;
              *(_BYTE *)(v19 + v20) = v14;
            }

            goto LABEL_20;
          }

LABEL_17:
          int v6 = 0;
LABEL_18:
          uint64_t v17 = v42[3];
          uint64_t v18 = v38[3];
          v38[3] = v18 + 1;
          *(_BYTE *)(v17 + v18) = v8;
          goto LABEL_20;
        }

        int v5 = 0;
        uint64_t v15 = v42[3];
        uint64_t v16 = v38[3];
        v38[3] = v16 + 1;
        *(_BYTE *)(v15 + v16) = v8;
        int v6 = 1;
      }

      else if (v7 == 32)
      {
        if (((v5 | v6) & 1) == 0)
        {
          int v6 = 0;
          int v5 = 0;
          goto LABEL_18;
        }
      }

      else
      {
        if (v7 != 44) {
          goto LABEL_17;
        }
        v33((uint64_t)v32);
        uint64_t v9 = v42[3];
        uint64_t v10 = v38[3];
        v38[3] = v10 + 1;
        *(_BYTE *)(v9 + v10) = v8;
        int v6 = 1;
        int v5 = 1;
      }

LABEL_20:
      if (++v4 >= v2)
      {
        uint64_t v3 = (_BYTE *)v42[3];
        uint64_t v21 = v38[3];
        goto LABEL_23;
      }
    }
  }

  uint64_t v21 = 0LL;
LABEL_23:
  v3[v21] = 0;
  int v22 = (_BYTE *)v42[3];
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  char v23 = *v22;
  if (!*v22) {
    goto LABEL_32;
  }
  int v24 = 0LL;
  uint64_t v25 = v22;
  while (1)
  {
    if (v23 == 61)
    {
      int v24 = v25 + 1;
      goto LABEL_31;
    }

    if (v23 == 92)
    {
      if (!*++v25) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }

    if (v23 == 44) {
      break;
    }
LABEL_31:
    int v27 = *++v25;
    char v23 = v27;
    if (!v27) {
      goto LABEL_32;
    }
  }

  if (v24)
  {
    CFStringRef v30 = &v25[~(unint64_t)v24];
    size_t v31 = (size_t)(v30 + 2);
    if (v30 != (_BYTE *)-2LL)
    {
      uint64_t v28 = (char *)malloc((size_t)(v30 + 2));
      strlcpy(v28, v24, v31);
      goto LABEL_33;
    }
  }

LABEL_32:
  uint64_t v28 = 0LL;
LABEL_33:
  free(v22);
  return v28;
}

  __darwin_ct_rune_t v14 = 2LL;
LABEL_33:
  *(_DWORD *)a1 = v15;
  v17[v11] = 0;
  return _parse_rh_exp(a1, &a2[v14], v17, v13, a3);
}

uint64_t ___dn_normalize_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8LL);
  uint64_t v2 = *(void *)(v1 + 24) - 1LL;
  while (v2)
  {
    int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) + v2--);
    if (v3 != 32)
    {
      *(void *)(v1 + 24) = v2 + 2;
      return result;
    }
  }

  return result;
}

void ___ldap_next_authmechanism_block_invoke(uint64_t a1)
{
}

char *_ldap_sasl_fill(uint64_t a1, const __CFString *a2, CFDictionaryRef theDict, uint64_t a4)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_DWORD *)(a1 + 8) = 1;
  *(_DWORD *)(a1 + 16) = 3;
  *(_DWORD *)(a1 + 40) = 2;
  *(void *)(a1 + 64) = a4;
  if (a2) {
    _fill_cstring_from_cfstring((char **)(a1 + 56), a2, (char **)(a1 + 48));
  }
  uint64_t result = (char *)CFDictionaryGetValue(theDict, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
  if (result) {
    return _fill_cstring_from_cfstring((char **)(a1 + 32), (const __CFString *)result, (char **)(a1 + 24));
  }
  return result;
}

void ___o_ldap_crammd5_auth_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    Value = (const __CFString *)CFDictionaryGetValue( *(CFDictionaryRef *)(a1 + 40),  (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
    int v5 = (const __CFString *)CFDictionaryGetValue( *(CFDictionaryRef *)(a1 + 40),  (const void *)LDAP_MECHANISM_OPTION_PASSWORD);
    _cstr_from_cfstring(v5, &v21);
    uint64_t v6 = heim_cram_md5_create();
    if (v6)
    {
      int v7 = (char *)v6;
      char v8 = _cstr_from_cfstring(Value, &v20);
      uint64_t v9 = _short_username_from_dn(v8);
      int v10 = asprintf(&v19, "%s %s", v9, v7);
      if (v10 == -1)
      {
        uint64_t v16 = 0LL;
      }

      else
      {
        uint64_t v11 = v10;
        uint64_t v12 = malloc(0x10uLL);
        uint64_t v13 = v19;
        *uint64_t v12 = v11;
        v12[1] = v13;
        _ldap_sasl_fill((uint64_t)v18, @"CRAM-MD5", *(CFDictionaryRef *)(a1 + 40), (uint64_t)v12);
        __darwin_ct_rune_t v14 = *(void **)(a1 + 32);
        v17[0] = MEMORY[0x1895F87A8];
        v17[1] = 0x40000000LL;
        v17[2] = ___o_ldap_crammd5_auth_block_invoke_2;
        v17[3] = &__block_descriptor_tmp_80;
        v17[4] = v14;
        uint64_t v15 = _ldap_base_operation_create(v14, 104LL, 512LL, (uint64_t)_dispose_simple, v17);
        uint64_t v16 = (char *)_ldap_operation_simple_init((uint64_t)v15, v18);
        free_LDAPMessage();
      }

      if (v20) {
        free(v20);
      }
      if (v9) {
        free(v9);
      }
      free(v7);
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    if (v21)
    {
      free(v21);
      uint64_t v21 = 0LL;
    }

    if (!_enqueue_operation_with_release(*(void *)(a1 + 32), v16)) {
      _ldap_next_authmechanism(*(void **)(a1 + 32));
    }
  }

BOOL _ldap_continue_sasl(void *context, int a2)
{
  BOOL v4 = a2 == 0;
  if (!a2)
  {
LABEL_8:
    *((_DWORD *)context + 73) = a2;
    dispatch_barrier_sync_f(*((dispatch_queue_t *)context + 1), context, (dispatch_function_t)_s_next_state);
    return v4;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    _ldap_continue_sasl_cold_1();
  }
  BOOL result = 0LL;
  if (a2 <= 47)
  {
    if (a2 != 7)
    {
      if (a2 != 14) {
        return result;
      }
      if (*((void *)context + 17)) {
        return 1LL;
      }
      _os_assumes_log();
    }
  }

  else if (a2 != 48)
  {
    if (a2 != 80)
    {
      if (a2 != 49) {
        return result;
      }
      goto LABEL_8;
    }

    *((_DWORD *)context + 73) = 49;
    dispatch_barrier_sync_f(*((dispatch_queue_t *)context + 1), context, (dispatch_function_t)_s_next_state);
    return 0LL;
  }

  *((_DWORD *)context + 73) = a2;
  _ldap_next_authmechanism(context);
  return 0LL;
}

BOOL ___o_ldap_crammd5_auth_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  return _ldap_continue_sasl(*(void **)(a1 + 32), a3);
}

void ___o_ldap_digestmd5_auth_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v4 = *(const __CFDictionary **)(a1 + 40);
    v17[0] = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v6 = (char *)heim_digest_create();
    if (v6)
    {
      Value = (const __CFString *)CFDictionaryGetValue(v4, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
      char v8 = (const __CFString *)CFDictionaryGetValue(v4, (const void *)LDAP_MECHANISM_OPTION_PASSWORD);
      if (heim_digest_parse_challenge())
      {
        uint64_t v9 = 0LL;
      }

      else
      {
        int v10 = _cstr_from_cfstring(Value, &v20);
        uint64_t v9 = _short_username_from_dn(v10);
        if ((*(_BYTE *)(v5 + 289) & 0x14) != 0 && *(void *)(v5 + 264)) {
          asprintf(v17, "ldap/%s", *(const char **)(v5 + 264));
        }
        heim_digest_set_key();
        heim_digest_set_key();
        _cstr_from_cfstring(v8, &v19);
        heim_digest_set_key();
        if (v19) {
          free(v19);
        }
      }

      if (v20) {
        free(v20);
      }
      if (v9) {
        free(v9);
      }
    }

    if (v17[0]) {
      free(v17[0]);
    }
    if (v6)
    {
      uint64_t response = heim_digest_create_response();
      if (response)
      {
        uint64_t v12 = (const char *)response;
        uint64_t v13 = malloc(0x10uLL);
        v13[1] = v12;
        void *v13 = strlen(v12);
        _ldap_sasl_fill((uint64_t)v17, @"DIGEST-MD5", *(CFDictionaryRef *)(a1 + 40), (uint64_t)v13);
        __darwin_ct_rune_t v14 = *(void **)(a1 + 32);
        v16[0] = MEMORY[0x1895F87A8];
        v16[1] = 0x40000000LL;
        v16[2] = ___o_ldap_digestmd5_auth_block_invoke_2;
        v16[3] = &__block_descriptor_tmp_82;
        v16[4] = v14;
        v16[5] = v18;
        v16[6] = v6;
        uint64_t v15 = _ldap_base_operation_create(v14, 104LL, 512LL, (uint64_t)_dispose_simple, v16);
        uint64_t v6 = (char *)_ldap_operation_simple_init((uint64_t)v15, v17);
        void *v13 = 0LL;
        v13[1] = 0LL;
        free_LDAPMessage();
      }

      else
      {
        heim_digest_release();
        uint64_t v6 = 0LL;
      }
    }

    if (!_enqueue_operation_with_release(*(void *)(a1 + 32), v6)) {
      _ldap_next_authmechanism(*(void **)(a1 + 32));
    }
  }

uint64_t ___o_ldap_digestmd5_auth_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    if (a3 == 49)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        ___o_ldap_digestmd5_auth_block_invoke_2_cold_2(a1);
      }
      uint64_t v5 = *(void ***)(a1 + 32);
      if (*v5[21])
      {
        int v6 = 7;
LABEL_13:
        _ldap_continue_sasl(v5, v6);
        return heim_digest_release();
      }
    }

    else
    {
      uint64_t v5 = *(void ***)(a1 + 32);
    }

    int v6 = a3;
    goto LABEL_13;
  }

  uint64_t v8 = *(void *)(a1 + 32);
  int v7 = (uint64_t *)(a1 + 32);
  if (!strcmp(*(const char **)(v8 + 136), *(const char **)(a1 + 40)))
  {
    *(_DWORD *)(v8 + 292) = 0;
    uint64_t v16 = *(dispatch_queue_s **)(v8 + 8);
    uint64_t v15 = v8;
  }

  else
  {
    tcp_connection_get_remote();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      ___o_ldap_digestmd5_auth_block_invoke_2_cold_1(a1 + 32, (uint64_t)v18, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v15 = *v7;
    *(_DWORD *)(v15 + 292) = 10004;
    uint64_t v16 = *(dispatch_queue_s **)(v15 + 8);
  }

  dispatch_barrier_sync_f(v16, (void *)v15, (dispatch_function_t)_s_next_state);
  return heim_digest_release();
}

uint64_t _o_ldap_gssapi_negotiate(uint64_t a1, CFDictionaryRef *a2, gss_buffer_desc_struct *a3)
{
  buffer.size_t length = 0LL;
  buffer.value = 0LL;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  OM_uint32 inited = gss_init_sec_context( &minor_status,  a2[3],  a2 + 1,  a2[4],  0LL,  6u,  0,  (gss_channel_bindings_t)a2[2],  a3,  0LL,  &buffer,  &v18,  &time_rec);
  if (inited)
  {
    if (inited == 1)
    {
      size_t length = buffer.length;
      if (buffer.length)
      {
        v16[0] = MEMORY[0x1895F87A8];
        v16[1] = 0x40000000LL;
        v16[2] = ___o_ldap_gssapi_negotiate_block_invoke;
        v16[3] = &__block_descriptor_tmp_91;
        v16[4] = a1;
        v16[5] = a2;
        uint64_t v8 = v16;
        goto LABEL_6;
      }
    }

    else
    {
      *(_DWORD *)(a1 + 292) = 7;
      _free_ldap_gss_context(a2);
      _ldap_next_authmechanism((void *)a1);
    }

    return gss_release_buffer(&minor_status, &buffer);
  }

  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 0x40000000LL;
  v15[2] = ___o_ldap_gssapi_negotiate_block_invoke_3;
  v15[3] = &__block_descriptor_tmp_93;
  v15[4] = a1;
  void v15[5] = a2;
  size_t length = buffer.length;
  uint64_t v8 = v15;
  if (!buffer.length)
  {
    uint64_t v9 = 0LL;
    goto LABEL_10;
  }

LABEL_6:
  uint64_t v9 = malloc(0x10uLL);
  value = buffer.value;
  *uint64_t v9 = length;
  v9[1] = value;
LABEL_10:
  _ldap_sasl_fill((uint64_t)v14, @"GSSAPI", *a2, (uint64_t)v9);
  uint64_t v12 = _ldap_base_operation_create((void *)a1, 104LL, 512LL, (uint64_t)_dispose_simple, v8);
  uint64_t v13 = (char *)_ldap_operation_simple_init((uint64_t)v12, v14);
  if (!_enqueue_operation_with_release(a1, v13))
  {
    *(_DWORD *)(a1 + 292) = 7;
    _free_ldap_gss_context(a2);
    _ldap_next_authmechanism((void *)a1);
  }

  return free_LDAPMessage();
}

void ___o_ldap_gssapi_negotiate_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 0x40000000LL;
    v4[2] = ___o_ldap_gssapi_negotiate_block_invoke_2;
    v4[3] = &__block_descriptor_tmp_90;
    dispatch_sync(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 64LL), v4);
  }

  else
  {
    _free_ldap_gss_context(*(void **)(a1 + 40));
  }

void _free_ldap_gss_context(void *a1)
{
  uint64_t v2 = *(const void **)a1;
  if (v2)
  {
    CFRelease(v2);
    *(void *)a1 = 0LL;
  }

  int v3 = (void *)*((void *)a1 + 2);
  if (v3)
  {
    free(v3);
    *((void *)a1 + 2) = 0LL;
  }

  if (*((void *)a1 + 1)) {
    gss_delete_sec_context(&minor_status, (gss_ctx_id_t *)a1 + 1, 0LL);
  }
  *((void *)a1 + 3) = 0LL;
  BOOL v4 = (const void *)*((void *)a1 + 4);
  if (v4) {
    CFRelease(v4);
  }
  free(a1);
}

uint64_t ___o_ldap_gssapi_negotiate_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 136);
  v5[0] = *(void *)(v2 + 144);
  v5[1] = v3;
  return _o_ldap_gssapi_negotiate(v2, v1, v5);
}

void ___o_ldap_gssapi_negotiate_block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 0x40000000LL;
    v4[2] = ___o_ldap_gssapi_negotiate_block_invoke_4;
    v4[3] = &__block_descriptor_tmp_92;
    dispatch_sync(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 64LL), v4);
  }

  else
  {
    _free_ldap_gss_context(*(void **)(a1 + 40));
  }

uint64_t ___o_ldap_gssapi_negotiate_block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(CFDictionaryRef **)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 136);
  input_message_buffer.size_t length = *(void *)(v1 + 144);
  input_message_buffer.value = v3;
  output_message_buffer.size_t length = 0LL;
  output_message_buffer.value = 0LL;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 64));
  if (gss_unwrap(&minor_status, v2[1], &input_message_buffer, &output_message_buffer, 0LL, (gss_qop_t *)(v1 + 192))) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = output_message_buffer.length >= 4;
  }
  if (!v4) {
    goto LABEL_5;
  }
  Value = (const __CFBoolean *)CFDictionaryGetValue(*v2, (const void *)LDAP_MECHANISM_OPTION_GSSAPI_INTEGRITY);
  int v7 = (const __CFBoolean *)CFDictionaryGetValue(*v2, (const void *)LDAP_MECHANISM_OPTION_GSSAPI_CONFIDENTIALITY);
  uint64_t v8 = output_message_buffer.value;
  if (!v7)
  {
    uint64_t v11 = (unsigned int *)(v1 + 288);
    if ((*(_BYTE *)output_message_buffer.value & 4) != 0)
    {
      do
        unsigned int v13 = __ldaxr(v11);
      while (__stlxr(v13 | 0x20, v11));
      goto LABEL_16;
    }

    do
      unsigned int v12 = __ldaxr(v11);
    while (__stlxr(v12 & 0xFFFFFFDF, v11));
LABEL_24:
    int v15 = 0;
    char v16 = 1;
    char v14 = 2;
    if (!Value) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }

  if (CFBooleanGetValue(v7) != 1)
  {
    *v8 &= ~4u;
    uint64_t v20 = (unsigned int *)(v1 + 288);
    do
      unsigned int v21 = __ldaxr(v20);
    while (__stlxr(v21 & 0xFFFFFFDF, v20));
    goto LABEL_24;
  }

  uint64_t v9 = (unsigned int *)(v1 + 288);
  do
    unsigned int v10 = __ldaxr(v9);
  while (__stlxr(v10 | 0x20, v9));
  if ((*v8 & 4) == 0)
  {
LABEL_5:
    int v5 = 10004;
LABEL_34:
    *(_DWORD *)(v1 + 292) = v5;
    _free_ldap_gss_context(v2);
    _ldap_next_authmechanism((void *)v1);
    return gss_release_buffer(&minor_status, &output_message_buffer);
  }

LABEL_16:
  char v14 = 4;
  int v15 = 1;
  char v16 = 4;
  if (!Value)
  {
LABEL_17:
    uint64_t v17 = (unsigned int *)(v1 + 288);
    if ((*v8 & 2) == 0)
    {
      do
        unsigned int v18 = __ldaxr(v17);
      while (__stlxr(v18 & 0xFFFFFFEF, v17));
LABEL_30:
      char v14 = v16;
      goto LABEL_31;
    }

    do
      unsigned int v19 = __ldaxr(v17);
    while (__stlxr(v19 | 0x10, v17));
    goto LABEL_31;
  }

LABEL_25:
  int v22 = CFBooleanGetValue(Value);
  char v23 = (unsigned int *)(v1 + 288);
  if (v22 != 1)
  {
    do
      unsigned int v25 = __ldaxr(v23);
    while (__stlxr(v25 & 0xFFFFFFEF, v23));
    goto LABEL_30;
  }

  do
    unsigned int v24 = __ldaxr(v23);
  while (__stlxr(v24 | 0x10, v23));
  if ((*v8 & 2) == 0) {
    goto LABEL_5;
  }
LABEL_31:
  *uint64_t v8 = v14;
  if (gss_wrap(&minor_status, v2[1], v15, *(_DWORD *)(v1 + 192), &output_message_buffer, 0LL, &v34)) {
    goto LABEL_33;
  }
  int v26 = malloc(0x10uLL);
  int v27 = v34.value;
  *int v26 = v34.length;
  v26[1] = v27;
  _ldap_sasl_fill((uint64_t)v33, @"GSSAPI", *v2, (uint64_t)v26);
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 0x40000000LL;
  void v32[2] = ___o_ldap_gssapi_security_block_invoke;
  v32[3] = &__block_descriptor_tmp_95;
  v32[4] = v1;
  v32[5] = v2;
  uint64_t v28 = _ldap_base_operation_create((void *)v1, 104LL, 512LL, (uint64_t)_dispose_simple, v32);
  CFIndex v29 = (char *)_ldap_operation_simple_init((uint64_t)v28, v33);
  free_LDAPMessage();
  if (!_enqueue_operation_with_release(v1, v29))
  {
LABEL_33:
    int v5 = 7;
    goto LABEL_34;
  }

  return gss_release_buffer(&minor_status, &output_message_buffer);
}

void ___o_ldap_gssapi_security_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    int v5 = *(void **)(a1 + 40);
    *(_DWORD *)(v4 + 292) = 7;
    _free_ldap_gss_context(v5);
    _ldap_next_authmechanism((void *)v4);
  }

  else
  {
    if ((*(_BYTE *)(v4 + 288) & 0x30) != 0)
    {
      int v6 = *(dispatch_queue_s **)(v4 + 208);
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 0x40000000LL;
      v10[2] = ___o_ldap_gssapi_security_block_invoke_2;
      v10[3] = &__block_descriptor_tmp_94;
      uint64_t v7 = *(void *)(a1 + 40);
      v10[4] = v4;
      v10[5] = v7;
      dispatch_barrier_sync(v6, v10);
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v8;
      _os_log_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "connection: %p, GSSAPI: negotiated",  buf,  0xCu);
    }

    _free_ldap_gss_context(*(void **)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)(v9 + 292) = 0;
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(v9 + 8), (void *)v9, (dispatch_function_t)_s_next_state);
  }

uint64_t ___o_ldap_gssapi_security_block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 184LL) = *(void *)(*(void *)(result + 40) + 8LL);
  *(void *)(*(void *)(result + 40) + 8LL) = 0LL;
  return result;
}

void ___o_ldap_srp_auth_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    Value = (const __CFString *)CFDictionaryGetValue( *(CFDictionaryRef *)(a1 + 40),  (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
    int v5 = (const __CFString *)CFDictionaryGetValue( *(CFDictionaryRef *)(a1 + 40),  (const void *)LDAP_MECHANISM_OPTION_PASSWORD);
    uint64_t v25 = 0LL;
    unsigned int v24 = 0;
    int v6 = _cstr_from_cfstring(Value, &v26);
    uint64_t v7 = _short_username_from_dn(v6);
    uint64_t v8 = _cstr_from_cfstring(v5, &v27);
    unsigned int v9 = srp_client_mech_new((void *)(a1 + 48), v7, v7, v8);
    if (v9
      || (unsigned int v9 = srp_client_mech_step(*(void *)(a1 + 48), (unsigned int *)"", 0LL, &v25, &v24, v10, v11, v12), v9 > 1))
    {
      unsigned int v18 = *(_DWORD **)(a1 + 32);
      v18[73] = v9;
      _ldap_next_authmechanism(v18);
      uint64_t v17 = 0LL;
    }

    else
    {
      uint64_t v13 = malloc(0x10uLL);
      uint64_t v14 = v25;
      void *v13 = v24;
      v13[1] = v14;
      _ldap_sasl_fill((uint64_t)v21, @"SRP", *(CFDictionaryRef *)(a1 + 40), (uint64_t)v13);
      int v15 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 0x40000000LL;
      v19[2] = ___o_ldap_srp_auth_block_invoke_2;
      v19[3] = &__block_descriptor_tmp_98;
      v19[4] = v15;
      int8x16_t v20 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      char v16 = _ldap_base_operation_create(v15, 104LL, 512LL, (uint64_t)_dispose_simple, v19);
      uint64_t v17 = (char *)_ldap_operation_simple_init((uint64_t)v16, v21);
      if (v23)
      {
        free(v23);
        char v23 = 0LL;
      }

      if (v22) {
        free(v22);
      }
      free(v13);
    }

    if (v26) {
      free(v26);
    }
    if (v7) {
      free(v7);
    }
    if (v27) {
      free(v27);
    }
    if (!_enqueue_operation_with_release(*(void *)(a1 + 32), v17)) {
      _ldap_next_authmechanism(*(void **)(a1 + 32));
    }
  }

void ___o_ldap_srp_auth_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    uint64_t v4 = malloc(0x10uLL);
    unsigned int v15 = 0;
    unsigned int v8 = srp_client_mech_step( *(void *)(a1 + 40),  *(unsigned int **)(*(void *)(a1 + 32) + 136LL),  *(unsigned int *)(*(void *)(a1 + 32) + 144LL),  &v16,  &v15,  v5,  v6,  v7);
    if (v8 > 1)
    {
      uint64_t v12 = *(_DWORD **)(a1 + 32);
      v12[73] = v8;
      _ldap_next_authmechanism(v12);
      if (!v4) {
        return;
      }
    }

    else
    {
      unsigned int v9 = v16;
      void *v4 = v15;
      v4[1] = v9;
      _ldap_sasl_fill((uint64_t)v17, @"SRP", *(CFDictionaryRef *)(a1 + 48), (uint64_t)v4);
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 0x40000000LL;
      v13[2] = ___o_ldap_srp_auth_block_invoke_3;
      v13[3] = &__block_descriptor_tmp_97;
      __int128 v14 = *(_OWORD *)(a1 + 32);
      uint64_t v10 = _ldap_base_operation_create((void *)v14, 104LL, 512LL, (uint64_t)_dispose_simple, v13);
      uint64_t v11 = (char *)_ldap_operation_simple_init((uint64_t)v10, v17);
      if (!_enqueue_operation_with_release(*(void *)(a1 + 32), v11)) {
        _ldap_next_authmechanism(*(void **)(a1 + 32));
      }
      if (v16)
      {
        free(v16);
        char v16 = 0LL;
      }

      if (v19)
      {
        free(v19);
        unsigned int v19 = 0LL;
      }

      if (v18) {
        free(v18);
      }
    }

    free(v4);
  }

void ___o_ldap_srp_auth_block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v14 = 0LL;
  int v13 = 0;
  *(void *)(*(void *)(a1 + 32) + 200LL) = *(void *)(a1 + 40);
  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    unsigned int v7 = srp_client_mech_step( *(void *)(a1 + 40),  *(unsigned int **)(*(void *)(a1 + 32) + 136LL),  *(unsigned int *)(*(void *)(a1 + 32) + 144LL),  &v14,  &v13,  v4,  v5,  v6);
    if (v7 > 1)
    {
      uint64_t v12 = *(_DWORD **)(a1 + 32);
      v12[73] = v7;
      _ldap_next_authmechanism(v12);
    }

    else
    {
      if (srp_has_confidentiality(*(void *)(a1 + 40)))
      {
        unsigned int v8 = (unsigned int *)(*(void *)(a1 + 32) + 288LL);
        do
          unsigned int v9 = __ldaxr(v8);
        while (__stlxr(v9 | 0x20, v8));
      }

      if (srp_has_confidentiality(*(void *)(a1 + 40)))
      {
        uint64_t v10 = (unsigned int *)(*(void *)(a1 + 32) + 288LL);
        do
          unsigned int v11 = __ldaxr(v10);
        while (__stlxr(v11 | 0x10, v10));
      }
    }
  }

void _o_disconnected(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(unint64_t **)a2;
  if (*(void *)a2)
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    do
    {
      unsigned int v9 = (unint64_t *)v6[1];
      unsigned int v8 = (unint64_t **)v6[2];
      if (v9)
      {
        v9[2] = (unint64_t)v8;
        unsigned int v8 = (unint64_t **)v6[2];
      }

      else
      {
        *(void *)(a2 + 8) = v8;
      }

      *unsigned int v8 = v9;
      uint64_t v10 = v6 + 5;
      do
        unint64_t v11 = __ldaxr(v10);
      while (__stlxr(v11 & 0xFFFFFFFFFFFFFFF7LL, v10));
      if ((*(_BYTE *)v10 & 2) != 0 || !v6[3])
      {
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
        ldap_operation_release(v6);
      }

      else
      {
        int v13 = *(dispatch_queue_s **)(a1 + 24);
        uint64_t v12 = *(dispatch_group_s **)(a1 + 32);
        block[0] = v7;
        block[1] = 0x40000000LL;
        block[2] = ___o_disconnected_block_invoke;
        block[3] = &__block_descriptor_tmp_102;
        int v15 = a3;
        block[4] = v6;
        void block[5] = a1;
        dispatch_group_async(v12, v13, block);
      }

      uint64_t v6 = v9;
    }

    while (v9);
  }

void ___o_disconnect_cleanup_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[35];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v2 = *(void **)(a1 + 32);
  }

  ldap_connection_release(v2);
}

void ___o_disconnected_block_invoke(uint64_t a1)
{
}

void ___report_connect_status_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  __int128 v28 = 0u;
  memset(v29, 0, sizeof(v29));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v19 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  *(_OWORD *)cStr = 0u;
  __int128 v16 = 0u;
  if (tcp_connection_get_hostname()) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFStringCreateWithCString( (CFAllocatorRef)*MEMORY[0x189604DB0],  cStr,  0x8000100u);
  }
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    tcp_connection_get_remote();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      uint64_t v2 = *(void *)(a1 + 40);
      int v3 = *(_DWORD *)(v2 + 288);
      *(_DWORD *)buf = 134219010;
      uint64_t v6 = v2;
      __int16 v7 = 2082;
      unsigned int v8 = cStr;
      __int16 v9 = 1040;
      int v10 = v4;
      __int16 v11 = 2098;
      uint64_t v12 = &v4;
      __int16 v13 = 1024;
      int v14 = v3;
      _os_log_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "connection: %p, host: %{public}s, address: %{public,network:sockaddr}.*P, flags: %{AppleLDAPTypes:flags}d",  buf,  0x2Cu);
    }
  }

void _o_abandon_operation(uint64_t a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  int v2 = *(_DWORD *)(a1 + 80);
  DWORD2(v7) = 18;
  LODWORD(v8) = v2;
  int v3 = _ldap_base_operation_create(*(void **)(a1 + 32), 104LL, 512LL, (uint64_t)_dispose_simple, 0LL);
  unsigned __int8 v4 = (char *)_ldap_operation_simple_init((uint64_t)v3, &v7);
  uint64_t v5 = (unint64_t *)(v4 + 40);
  do
    unint64_t v6 = __ldaxr(v5);
  while (__stlxr(v6 | 0x800, v5));
  _enqueue_operation_with_release(*(void *)(a1 + 32), v4);
  ldap_operation_release((id)a1);
}

void ___ldap_async_operation_block_invoke(uint64_t a1)
{
}

void _dispose_query(void *a1)
{
  int v2 = (void *)a1[11];
  if (v2)
  {
    free(v2);
    a1[11] = 0LL;
  }

  int v3 = (const void *)a1[13];
  if (v3)
  {
    _Block_release(v3);
    a1[13] = 0LL;
  }

  unsigned __int8 v4 = (void *)a1[15];
  if (v4)
  {
    free(v4);
    a1[15] = 0LL;
  }

  uint64_t v5 = (dispatch_source_s *)a1[14];
  if (v5)
  {
    dispatch_source_cancel(v5);
    unint64_t v6 = (dispatch_object_s *)a1[14];
    if (v6)
    {
      dispatch_release(v6);
      a1[14] = 0LL;
    }
  }

void _o_ldap_queue_operation(void *a1)
{
  uint64_t v2 = a1[4];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 64));
  a1[1] = 0LL;
  int v3 = a1 + 1;
  if ((a1[5] & 0x100) != 0)
  {
    uint64_t v5 = *(void **)(v2 + 80);
    a1[2] = v5;
    void *v5 = a1;
    *(void *)(v2 + 80) = v3;
    uint64_t v6 = a1[4];
    ldap_operation_retain(a1);
    __int128 v7 = *(dispatch_group_s **)(v6 + 56);
    __int128 v8 = *(dispatch_queue_s **)(v6 + 64);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = ___ldap_async_operation_block_invoke;
    void v9[3] = &__block_descriptor_tmp_104;
    v9[4] = _o_ldap_chained_operation_next;
    void v9[5] = a1;
    dispatch_group_async(v7, v8, v9);
  }

  else
  {
    unsigned __int8 v4 = *(void **)(v2 + 96);
    a1[2] = v4;
    void *v4 = a1;
    *(void *)(v2 + 96) = v3;
    _o_ldap_wakeup(v2);
  }

void _o_ldap_chained_operation_next(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v2 = *(void *)(a1 + 104);
  *(void *)(a1 + 96) = v3 + 1;
  unsigned __int8 v4 = *(uint64_t (**)(uint64_t, void *))(v2 + 8 * v3);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 64LL));
  int v5 = *(_DWORD *)(a1 + 56);
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    __int128 v7 = *(void **)(a1 + 88);
    if (v7)
    {
      ldap_operation_release(v7);
      *(void *)(a1 + 88) = 0LL;
    }

    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = ___o_ldap_chained_operation_next_block_invoke;
    v8[3] = &__block_descriptor_tmp_105;
    v8[4] = a1;
    v8[5] = a1;
    *(void *)(a1 + 88) = v4(a1, v8);
  }

  else
  {
    _o_operation_complete(*(void *)(a1 + 32), a1, v5);
  }

void ___o_ldap_chained_operation_next_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  *(_DWORD *)(v4 + 56) = a3;
  int v5 = *(const void **)(a2 + 64);
  if (v5)
  {
    CFRetain(v5);
    uint64_t v7 = *(void *)(a2 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  *(void *)(v4 + 64) = v7;
  __int128 v8 = *(void **)(a1 + 40);
  uint64_t v9 = v8[4];
  ldap_operation_retain(v8);
  __int128 v10 = *(dispatch_group_s **)(v9 + 56);
  __int128 v11 = *(dispatch_queue_s **)(v9 + 64);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 0x40000000LL;
  v12[2] = ___ldap_async_operation_block_invoke;
  v12[3] = &__block_descriptor_tmp_104;
  v12[4] = _o_ldap_chained_operation_next;
  v12[5] = v8;
  dispatch_group_async(v10, v11, v12);
}

uint64_t _start_filter(int *a1, char *a2)
{
  uint64_t v2 = -1LL;
  switch(*a2)
  {
    case '!':
      int v3 = 3;
      goto LABEL_8;
    case '""':
    case '#':
    case '$':
    case '%':
    case '\'':
      return _parse_simple_filter((uint64_t)a1, a2, 1);
    case '&':
      int v3 = 1;
      goto LABEL_8;
    case '(':
      return v2;
    case ')':
      return (uint64_t)(a2 + 1);
    default:
      if (!*a2) {
        return v2;
      }
      if (*a2 != 124) {
        return _parse_simple_filter((uint64_t)a1, a2, 1);
      }
      int v3 = 2;
LABEL_8:
      *a1 = v3;
      return _parse_compound_filter((uint64_t)a1, a2 + 1);
  }

uint64_t _parse_simple_filter(uint64_t a1, char *a2, int a3)
{
  uint64_t v6 = 0LL;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  while (1)
  {
    while (1)
    {
      int v7 = *a2;
      if (v7 != 32) {
        break;
      }
      ++a2;
    }

    if (!*a2)
    {
      if ((a3 & 1) != 0) {
        return -1LL;
      }
      else {
        return (uint64_t)(a2 - 1);
      }
    }

    if (v7 == 41)
    {
      if (a3) {
        return (uint64_t)(a2 + 1);
      }
      else {
        return -1LL;
      }
    }

    if (v7 != 40) {
      break;
    }
    __int128 v8 = (char *)reallocf(*(void **)(a1 + 16), 48 * v6 + 48);
    *(void *)(a1 + 16) = v8;
    uint64_t v9 = &v8[48 * v6];
    *(_OWORD *)uint64_t v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((_OWORD *)v9 + 2) = 0u;
    uint64_t result = _start_filter();
    if (result == -1) {
      return result;
    }
    a2 = (char *)result;
    *(_DWORD *)(a1 + 8) = ++v6;
  }

  unint64_t v11 = 0LL;
  char v12 = *a2;
  int v13 = 1;
  while (v12 > 125)
  {
    if (v12 == 126)
    {
      if (a2[1] == 61)
      {
        int v13 = 0;
        int v15 = 9;
        goto LABEL_32;
      }
    }

    else
    {
LABEL_28:
      v17[v11++] = v12;
      if (v11 > 0x7F) {
        return -1LL;
      }
    }

LABEL_29:
    char v16 = *++a2;
    char v12 = v16;
  }

  uint64_t v14 = 1LL;
  int v15 = 4;
  switch(v12)
  {
    case ':':
      if (a2[1] != 61) {
        goto LABEL_29;
      }
      int v13 = 0;
      int v15 = 10;
      break;
    case '<':
      if (a2[1] != 61) {
        goto LABEL_29;
      }
      int v13 = 0;
      int v15 = 7;
      break;
    case '=':
      goto LABEL_33;
    case '>':
      if (a2[1] != 61) {
        goto LABEL_29;
      }
      int v13 = 0;
      int v15 = 6;
      break;
    default:
      goto LABEL_28;
  }

uint64_t _parse_compound_filter(uint64_t a1, char *a2)
{
  int v4 = 0;
  while (1)
  {
    int v5 = *a2;
    if (v5 != 32) {
      break;
    }
LABEL_7:
    ++a2;
  }

  if (v5 == 40)
  {
    uint64_t v6 = (char *)reallocf(*(void **)(a1 + 16), 48LL * (v4 + 1));
    *(void *)(a1 + 16) = v6;
    int v7 = &v6[48 * v4];
    *(_OWORD *)int v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    uint64_t result = _start_filter();
    if (result == -1) {
      return result;
    }
    a2 = (char *)result;
    *(_DWORD *)(a1 + 8) = ++v4;
    goto LABEL_7;
  }

  if (v5 == 41) {
    return (uint64_t)a2;
  }
  else {
    return -1LL;
  }
}

uint64_t _parse_rh_exp(uint64_t a1, char *__s, char *a3, int a4, int a5)
{
  int v7 = __s;
  size_t v9 = strlen(__s);
  __int128 v10 = calloc(v9, 1uLL);
  char v11 = 0;
  char v12 = 0;
  uint64_t v13 = 0LL;
  uint64_t v14 = MEMORY[0x1895F8770];
LABEL_2:
  for (CFIndex i = v7 + 2; ; ++i)
  {
    int v16 = (char)*(i - 2);
    if (v16 != 92) {
      break;
    }
    int v17 = (char)*(i - 1);
    if (!*(i - 1)) {
      goto LABEL_35;
    }
    if (v17 < 0)
    {
    }

    else if ((*(_DWORD *)(v14 + 4LL * v17 + 60) & 0x10000) == 0)
    {
      goto LABEL_13;
    }

    unsigned int v18 = (char)*i;
    if ((v18 & 0x80000000) != 0)
    {
      if (__maskrune(v18, 0x10000uLL))
      {
LABEL_25:
        char v19 = 16 * v17;
        if (v17 > 64) {
          char v19 = 16 * v17 - 112;
        }
        v10[v13] = v19;
        char v20 = *i - 48;
        v10[v13++] = v20 | v19;
LABEL_30:
        if (i != (_BYTE *)-1LL)
        {
          int v7 = i + 1;
          goto LABEL_2;
        }

        goto LABEL_35;
      }
    }

    else if ((*(_DWORD *)(v14 + 4LL * v18 + 60) & 0x10000) != 0)
    {
      goto LABEL_25;
    }

LABEL_13:
    v10[v13] = v17;
  }

  if (v16 > 40)
  {
    if (v16 != 41)
    {
      if (v16 == 42)
      {
        if (!a4) {
          goto LABEL_35;
        }
        i -= 2;
        v11 |= v13 == 0;
        v12 |= v13 != 0;
        goto LABEL_30;
      }

LABEL_23:
      v10[v13++] = v16;
LABEL_24:
      i -= 2;
      goto LABEL_30;
    }

    if (a5)
    {
      __int128 v21 = i - 2;
      _filter_finish(a1, a3, v10, v13, v11 & 1, v12 & 1);
      return (uint64_t)v21;
    }
  }

  else
  {
    if (*(i - 2))
    {
      if (v16 == 32 && !v13) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }

    if ((a5 & 1) == 0)
    {
      _filter_finish(a1, a3, v10, v13, v11 & 1, v12 & 1);
      return (uint64_t)(i - 3);
    }
  }

LABEL_35:
  if (v10) {
    free(v10);
  }
  return -1LL;
}

_DWORD *_filter_finish(uint64_t a1, char *__s1, _BYTE *a3, uint64_t a4, int a5, int a6)
{
  if ((a5 & 1) == 0 && !a6)
  {
    *(void *)(a1 + 16) = strdup(__s1);
    uint64_t result = (_DWORD *)strlen(__s1);
    *(void *)(a1 + 8) = result;
    *(void *)(a1 + 24) = a4;
    *(void *)(a1 + 32) = a3;
    return result;
  }

  if (!a3) {
    goto LABEL_10;
  }
  if (!*a3)
  {
    free(a3);
LABEL_10:
    *(_DWORD *)a1 = 8;
    *(void *)(a1 + 16) = strdup(__s1);
    uint64_t result = (_DWORD *)strlen(__s1);
    *(void *)(a1 + 8) = result;
    return result;
  }

  *(_DWORD *)a1 = 5;
  *(void *)(a1 + 16) = strdup(__s1);
  *(void *)(a1 + 8) = strlen(__s1);
  *(_DWORD *)(a1 + 24) = 1;
  uint64_t result = calloc(1uLL, 0x18uLL);
  *(void *)(a1 + 32) = result;
  if (a5 && a6)
  {
    int v13 = 2;
  }

  else if (a6)
  {
    int v13 = 1;
  }

  else
  {
    int v13 = 3;
  }

  _DWORD *result = v13;
  *(void *)(*(void *)(a1 + 32) + 16LL) = a3;
  *(void *)(*(void *)(a1 + 32) + 8LL) = a4;
  return result;
}

uint64_t ___ldap_connection_next_messageID_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  int v2 = *(_DWORD *)(v1 + 240);
  if (v2 >= -1) {
    int v3 = v2 + 1;
  }
  else {
    int v3 = 1;
  }
  *(_DWORD *)(v1 + 240) = v3;
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = v3;
  return result;
}

void ___start_query_timer_block_invoke(uint64_t a1)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_assert_log();
}

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_5( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t free_Filter()
{
  return _asn1_free_top();
}

uint64_t decode_LDAPMessage()
{
  return _asn1_decode_top();
}

uint64_t encode_LDAPMessage()
{
  return _asn1_encode();
}

uint64_t length_LDAPMessage()
{
  return _asn1_length();
}

uint64_t free_LDAPMessage()
{
  return _asn1_free_top();
}

uint64_t decode_pkts_input( uint64_t a1, char *__src, unsigned int a3, void **a4, _DWORD *a5, unsigned int *a6, uint64_t (*a7)(uint64_t, void, void, _DWORD *, _DWORD *), uint64_t a8)
{
  *a6 = 0;
  if (a3)
  {
    unsigned int v11 = a3;
    uint64_t v15 = a1 + 8;
    unsigned int v14 = *(_DWORD *)a1;
    do
    {
      if (v14)
      {
        if (v11 >= v14) {
          size_t v16 = v14;
        }
        else {
          size_t v16 = v11;
        }
        memcpy((void *)(v15 - v14), __src, v16);
        BOOL v17 = *(_DWORD *)a1 == (_DWORD)v16;
        *(_DWORD *)a1 -= v16;
        if (!v17) {
          return 0LL;
        }
        unsigned int v18 = *(_DWORD *)(a1 + 4);
        unsigned int v19 = bswap32(v18);
        *(_DWORD *)(a1 + 8) = v19;
        if (!v18) {
          return 0xFFFFFFFFLL;
        }
        size_t v20 = *(unsigned int *)(a1 + 28);
        if (v19 > v20)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "encoded packet size too big (%d > %d)", v19, v20);
          return 0xFFFFFFFFLL;
        }

        if (!*(void *)(a1 + 16))
        {
          __int128 v21 = malloc(v20);
          *(void *)(a1 + 16) = v21;
          if (!v21) {
            return 4294967294LL;
          }
        }

        unsigned int v22 = 0;
        unsigned int v23 = v11 - v16;
        __src += v16;
        *(_DWORD *)(a1 + 24) = 0;
      }

      else
      {
        unsigned int v19 = *(_DWORD *)(a1 + 8);
        unsigned int v22 = *(_DWORD *)(a1 + 24);
        unsigned int v23 = v11;
      }

      unsigned int v24 = v19 - v22;
      __int128 v25 = (void *)(*(void *)(a1 + 16) + v22);
      unsigned int v11 = v23 - (v19 - v22);
      if (v23 < v19 - v22)
      {
        memcpy(v25, __src, v23);
        uint64_t result = 0LL;
        *(_DWORD *)(a1 + 24) += v23;
        return result;
      }

      memcpy(v25, __src, v19 - v22);
      uint64_t result = a7(a8, *(void *)(a1 + 16), *(unsigned int *)(a1 + 8), &__n[1], __n);
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = conditional_realloc(a4, a5, *a6 + __n[0] + 1);
      if ((_DWORD)result) {
        return result;
      }
      __src += v24;
      memcpy((char *)*a4 + *a6, *(const void **)&__n[1], __n[0]);
      unsigned int v27 = *a6 + __n[0];
      *a6 = v27;
      *((_BYTE *)*a4 + v27) = 0;
      unsigned int v14 = 4;
      *(_DWORD *)a1 = 4;
    }

    while (v11);
  }

  return 0LL;
}

uint64_t conditional_realloc(void **a1, _DWORD *a2, size_t __size)
{
  uint64_t result = 4294967289LL;
  if (a1 && a2)
  {
    int v6 = __size;
    if (*a1)
    {
      LODWORD(v7) = *a2;
      if (*a2 < __size)
      {
        do
          size_t v7 = (2 * v7);
        while (v7 < __size);
        __int128 v8 = reallocf(*a1, v7);
        *a1 = v8;
        int v9 = v8 ? v7 : 0;
        *a2 = v9;
        if (!v8) {
          return 4294967294LL;
        }
      }
    }

    else
    {
      __int128 v10 = malloc(__size);
      *a1 = v10;
      if (!v10)
      {
        *a2 = 0;
        return 4294967294LL;
      }

      *a2 = v6;
    }

    return 0LL;
  }

  return result;
}

double srp_encode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a4 && a5)
  {
    unsigned int v11 = (void *)(a1 + 888);
    *a5 = 4;
    if ((*(_BYTE *)(a1 + 360) & 2) != 0)
    {
      *a5 += chacha20_poly1305_encrypt();
      if ((*(_BYTE *)(a1 + 360) & 2) != 0)
      {
        unsigned int v14 = *a5 + chacha20_poly1305_final();
        *a5 = v14;
        double result = *(double *)&v17;
        *(_OWORD *)(*v11 + v14) = v17;
        unsigned int v15 = *a5;
        *a5 += 16;
        *(_DWORD *)*unsigned int v11 = bswap32(v15 + 12);
        *a4 = *v11;
        return result;
      }
    }

    int v13 = "confidentiality integrity layer required";
  }

  else
  {
    int v13 = "Bad parameter";
  }

  SETERROR(a1, v13, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v16);
  return result;
}

uint64_t srp_decode(uint64_t a1, char *a2, unsigned int a3, void *a4, unsigned int *a5)
{
  uint64_t result = decode_pkts_input( a1 + 936,  a2,  a3,  (void **)(a1 + 896),  (_DWORD *)(a1 + 920),  a5,  (uint64_t (*)(uint64_t, void, void, _DWORD *, _DWORD *))srp_decode_packet,  a1);
  *a4 = *(void *)(a1 + 896);
  return result;
}

uint64_t srp_decode_packet(uint64_t a1, uint64_t a2, size_t a3, void *a4, _DWORD *a5)
{
  __int128 v8 = (void *)(a1 + 904);
  uint64_t result = conditional_realloc((void **)(a1 + 904), (_DWORD *)(a1 + 928), a3);
  if (!(_DWORD)result)
  {
    if ((*(_BYTE *)(a1 + 360) & 2) != 0)
    {
      *a5 = chacha20_poly1305_decrypt();
      int v16 = chacha20_poly1305_verify();
      uint64_t result = 0LL;
      *a5 += v16;
      *a4 = *v8;
    }

    else
    {
      SETERROR(a1, "confidentiality integrity layer required", v10, v11, v12, v13, v14, v15, v17);
      return 4294967289LL;
    }
  }

  return result;
}

uint64_t srp_common_context_init(void *a1)
{
  *(_DWORD *)a1 = 1;
  a1[3] = CCCreateBigNum();
  a1[4] = CCCreateBigNum();
  a1[6] = CCCreateBigNum();
  a1[7] = CCCreateBigNum();
  a1[8] = CCCreateBigNum();
  uint64_t result = ccrng();
  a1[2] = result;
  return result;
}

uint64_t cc_get_digestbyname(const char *a1)
{
  if (!strcmp(a1, "sha512")) {
    return ccsha512_di();
  }
  if (!strcmp(a1, "sha384")) {
    return ccsha384_di();
  }
  if (!strcmp(a1, "sha256")) {
    return ccsha256_di();
  }
  if (!strcmp(a1, "sha224")) {
    return ccsha224_di();
  }
  return 0LL;
}

void SETERROR( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = 0LL;
  vasprintf(&v11, a2, &a9);
  uint64_t v10 = *(void **)(a1 + 968);
  if (v10) {
    free(v10);
  }
  *(void *)(a1 + 968) = v11;
}

uint64_t srp_client_mech_new(void *a1, const char *a2, const char *a3, const char *a4)
{
  __int128 v8 = malloc(0x3D0uLL);
  if (!v8) {
    return 4294967294LL;
  }
  int v9 = v8;
  bzero(v8, 0x3D0uLL);
  srp_common_context_init(v9);
  v9[28] = strdup(a2);
  v9[27] = strdup(a3);
  uint64_t v10 = strdup(a4);
  uint64_t result = 0LL;
  v9[29] = v10;
  *a1 = v9;
  return result;
}

uint64_t srp_client_mech_step( uint64_t a1, unsigned int *a2, uint64_t a3, void *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  *a4 = 0LL;
  *a5 = 0;
  int v9 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 != 3)
  {
    if (v9 != 2)
    {
      if (v9 == 1)
      {
        if ((_DWORD)a3)
        {
          uint64_t v12 = "Invalid input to first step of SRP";
LABEL_6:
          SETERROR(a1, v12, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, derivedKeyLen);
          return 4294967291LL;
        }

        *(void *)derivedKey = 0LL;
        uint64_t Buffer = MakeBuffer( (void **)(a1 + 344),  (_DWORD *)(a1 + 352),  (int64_t *)derivedKey,  "%s%s%s%o",  (uint64_t)a5,  a6,  a7,  a8,  *(void *)(a1 + 216));
        *a5 = *(_DWORD *)derivedKey;
        if ((_DWORD)Buffer)
        {
LABEL_32:
          uint64_t v13 = Buffer;
          uint64_t v43 = (FILE *)*MEMORY[0x1895F89D0];
          uint64_t v44 = "Error making output buffer\n";
          size_t v45 = 27LL;
LABEL_33:
          fwrite(v44, v45, 1uLL, v43);
          return v13;
        }

        *a4 = *(void *)(a1 + 344);
        int v49 = 2;
LABEL_39:
        *(_DWORD *)a1 = v49;
        return 1LL;
      }

      fprintf((FILE *)*MEMORY[0x1895F89D0], "Invalid SRP client step %d\n", v9);
      return 0xFFFFFFFFLL;
    }

    uint64_t v22 = UnBuffer(a1, a2, a3, "%c%m%m%o%m%q%s", (uint64_t)a5, a6, a7, a8, (uint64_t)v79);
    if ((_DWORD)v22)
    {
      uint64_t v13 = v22;
      SETERROR(a1, "Error UnBuffering input in step 2", v23, v24, v25, v26, v27, v28, derivedKeyLen);
      return v13;
    }

    size_t v37 = ccz_write_uint_size();
    v38 = malloc(v37);
    ccz_write_uint();
    ccz_write_uint();
    uint64_t v39 = (char)v80;
    set_ccsrp_groups();
    uint64_t v40 = 0LL;
    while (v37 != (unint64_t)Ng_tab[v40] >> 3
         || memcmp(v38, (const void *)Ng_tab[v40 + 2], v37)
         || Ng_tab[v40 + 3] != v39)
    {
      v40 += 5LL;
      if (v40 == 20)
      {
        char v41 = 0;
        goto LABEL_25;
      }
    }

    *(void *)(a1 + 40) = Ng_tab[v40 + 4];
    char v41 = 1;
LABEL_25:
    if (v38) {
      free(v38);
    }
    if ((v41 & 1) != 0)
    {
      if ((int)ccz_cmpi() < 1 || (ccz_cmp() & 0x80000000) == 0)
      {
        uint64_t v12 = "Illegal value for 'B'";
        goto LABEL_6;
      }

      __int128 v77 = 0u;
      __int128 v78 = 0u;
      uint64_t v51 = ParseOptions(a1, *(char **)(a1 + 256), (int *)&v77, 0);
      if ((_DWORD)v51)
      {
        uint64_t v13 = v51;
        uint64_t v43 = (FILE *)*MEMORY[0x1895F89D0];
        uint64_t v44 = "Error parsing SRP server options\n";
        size_t v45 = 33LL;
        goto LABEL_33;
      }

      *(_OWORD *)(a1 + 264) = 0u;
      *(_OWORD *)(a1 + 280) = 0u;
      *(_BYTE *)(a1 + 268) = 1;
      *(_DWORD *)(a1 + 272) = 1;
      *(_DWORD *)(a1 + 264) = 1;
      uint64_t v52 = *((void *)&v78 + 1);
      if (*((void *)&v78 + 1) >= 0x7FFFFFFBuLL) {
        uint64_t v52 = 2147483643LL;
      }
      *(void *)(a1 + 288) = v52;
      *(_DWORD *)(a1 + 280) = 1;
      uint64_t v53 = OptionsToString((int *)(a1 + 264), (char **)(a1 + 248));
      if ((_DWORD)v53)
      {
        uint64_t v13 = v53;
        uint64_t v43 = (FILE *)*MEMORY[0x1895F89D0];
        uint64_t v44 = "Error converting client options to an option string\n";
        size_t v45 = 52LL;
        goto LABEL_33;
      }

      if (SetMDA((_DWORD *)(a1 + 264), a1))
      {
        uint64_t v36 = "Error setting MDA";
        goto LABEL_16;
      }

      uint64_t v54 = ccdh_ccn_size();
      *(void *)(a1 + 8) = malloc(48 * ((4 * (**(void **)(a1 + 336) + v54) + 95) / 0x30uLL));
      ccsrp_ctx_init();
      size_t v55 = 8 * MEMORY[0x1895D5BEC](*(void *)(*(void *)(a1 + 8) + 8LL));
      v56 = malloc(v55);
      bzero(v56, v55);
      int started = ccsrp_client_start_authentication();
      if (started)
      {
        SETERROR(a1, "ccsrp_client_start_authentication failed: %d", v58, v59, v60, v61, v62, v63, started);
        return 0xFFFFFFFFLL;
      }

      ccz_read_uint();
      free(v56);
      size_t v64 = 8 * MEMORY[0x1895D5BEC](*(void *)(*(void *)(a1 + 8) + 8LL));
      int v65 = malloc(v64);
      bzero(v65, v64);
      ccz_write_uint();
      size_t v66 = strlen(*(const char **)(a1 + 232));
      if (!CCKeyDerivationPBKDF( 2u,  *(const char **)(a1 + 232),  v66,  *(const uint8_t **)(a1 + 312),  *(void *)(a1 + 320),  5u,  *(_DWORD *)(a1 + 328),  derivedKey,  0x80uLL))
      {
        *(void *)(a1 + 208) = ccsrp_get_session_key_length();
        uint64_t v67 = ccsrp_client_process_challenge();
        uint64_t v68 = v65;
        uint64_t v13 = v67;
        free(v68);
        if ((_DWORD)v13)
        {
          uint64_t v43 = (FILE *)*MEMORY[0x1895F89D0];
          uint64_t v44 = "Error creating M1\n";
          size_t v45 = 18LL;
          goto LABEL_33;
        }

        CCRNGStatus Bytes = CCRandomGenerateBytes((void *)(a1 + 296), 0x10uLL);
        if (Bytes)
        {
          SETERROR(a1, "Error reading random bytes for cIV: %d", v70, v71, v72, v73, v74, v75, Bytes);
          return 4294967286LL;
        }

        v81 = 0LL;
        uint64_t Buffer = MakeBuffer( (void **)(a1 + 344),  (_DWORD *)(a1 + 352),  (int64_t *)&v81,  "%m%o%s%o",  v72,  v73,  v74,  v75,  *(void *)(a1 + 64));
        *a5 = (_DWORD)v81;
        if ((_DWORD)Buffer) {
          goto LABEL_32;
        }
        *a4 = *(void *)(a1 + 344);
        int v49 = 3;
        goto LABEL_39;
      }

      unint64_t v46 = (FILE *)*MEMORY[0x1895F89D0];
      uint64_t v47 = "Error hashing client password\n";
      size_t v48 = 30LL;
    }

    else
    {
LABEL_34:
      unint64_t v46 = (FILE *)*MEMORY[0x1895F89D0];
      uint64_t v47 = "Values of 'N' and 'g' are not recommended\n";
      size_t v48 = 42LL;
    }

    fwrite(v47, v48, 1uLL, v46);
    return 0xFFFFFFFFLL;
  }

  v81 = 0LL;
  *(void *)derivedKey = 0LL;
  *(void *)&__int128 v77 = 0LL;
  uint64_t v14 = UnBuffer(a1, a2, a3, "%-o%-o%s%u", (uint64_t)a5, a6, a7, a8, (uint64_t)&v80);
  if ((_DWORD)v14)
  {
    uint64_t v13 = v14;
    __int128 v21 = "Error UnBuffering input in step 3";
LABEL_41:
    SETERROR(a1, v21, v15, v16, v17, v18, v19, v20, derivedKeyLen);
    goto LABEL_42;
  }

  uint64_t v29 = v80;
  if (ccsrp_get_session_key_length() != v29)
  {
    uint64_t v13 = 4294967286LL;
    __int128 v21 = "SRP Server M2 length wrong";
    goto LABEL_41;
  }

  if (!ccsrp_client_verify_session())
  {
    uint64_t v13 = 4294967286LL;
    __int128 v21 = "SRP Server spoof detected. M2 incorrect";
    goto LABEL_41;
  }

  if (LayerInit(a1 + 264, a1))
  {
    uint64_t v36 = "Error initializing security layer";
LABEL_16:
    SETERROR(a1, v36, v30, v31, v32, v33, v34, v35, derivedKeyLen);
    return 0xFFFFFFFFLL;
  }

  uint64_t v13 = 0LL;
LABEL_42:
  if (v81) {
    free(v81);
  }
  return v13;
}

uint64_t srp_has_confidentiality(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 360) >> 1) & 1;
}

uint64_t UnBuffer( uint64_t a1, unsigned int *a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a2 || a3 <= 3)
  {
    char v36 = a3;
    uint64_t v34 = "Buffer is not big enough to be SRP buffer: %d\n";
    goto LABEL_56;
  }

  unsigned int v10 = bswap32(*a2);
  if (v10 != (_DWORD)a3 - 4)
  {
    uint64_t v34 = "SRP Buffer isn't of the right length\n";
    goto LABEL_56;
  }

  uint64_t v11 = a2 + 1;
  size_t v37 = (unsigned int **)&a9;
  uint64_t v12 = "Buffer is not big enough to be SRP MPI\n";
  uint64_t v13 = "Buffer is not big enough to be SRP os\n";
  while (2)
  {
    uint64_t result = *a4;
    if ((_DWORD)result != 37)
    {
      if (!*a4) {
        goto LABEL_54;
      }
      ++v11;
      --v10;
      goto LABEL_37;
    }

    int v15 = a4[1];
    if (v15 == 45) {
      uint64_t v16 = 2LL;
    }
    else {
      uint64_t v16 = 1LL;
    }
    if (v15 == 45) {
      uint64_t v17 = a4 + 2;
    }
    else {
      uint64_t v17 = a4 + 1;
    }
    HIDWORD(v18) = (char)a4[v16] - 99;
    LODWORD(v18) = HIDWORD(v18);
    switch((v18 >> 1))
    {
      case 0u:
        if (v10)
        {
          uint64_t v19 = v37++;
          *(_BYTE *)void *v19 = *v11;
          goto LABEL_19;
        }

        uint64_t v13 = "Buffer is not big enough to be SRP char\n";
        goto LABEL_44;
      case 5u:
        unsigned int v21 = v10 - 2;
        if (v10 < 2) {
          goto LABEL_52;
        }
        unsigned int v22 = bswap32(*(unsigned __int16 *)v11);
        if (v21 < HIWORD(v22))
        {
          uint64_t v12 = "Not enough data for this SRP MPI\n";
          goto LABEL_50;
        }

        LODWORD(v20) = HIWORD(v22);
        v11 += 2;
        ++v37;
        ccz_zero();
        ccz_read_uint();
        goto LABEL_36;
      case 6u:
        if (!v10)
        {
LABEL_44:
          uint64_t v35 = a1;
          uint64_t v34 = v13;
          goto LABEL_57;
        }

        unsigned int v23 = *v11++;
        size_t v20 = v23;
        unsigned int v21 = v10 - 1;
        if (v10 - 1 < v23)
        {
          uint64_t v12 = "Not enough data for this SRP os\n";
          goto LABEL_50;
        }

        **size_t v37 = v20;
        uint64_t v24 = (void **)(v37 + 1);
        v37 += 2;
        uint64_t v25 = *v24;
        if (v15 == 45)
        {
          *uint64_t v25 = v11;
        }

        else
        {
          uint64_t v33 = malloc(v20);
          *uint64_t v25 = v33;
          if (!v33)
          {
LABEL_42:
            uint64_t result = 4294967294LL;
            unsigned int v10 = v21;
            goto LABEL_54;
          }

          memcpy(v33, v11, v20);
        }

        goto LABEL_36;
      case 7u:
        if (v10 < 8)
        {
          uint64_t v12 = "Buffer is not big enough to be SRP uint64_t\n";
          goto LABEL_52;
        }

        uint64_t v26 = v37++;
        *(void *)*uint64_t v26 = bswap64(*(void *)v11);
        LODWORD(v20) = 8;
        goto LABEL_35;
      case 8u:
        unsigned int v21 = v10 - 2;
        if (v10 < 2)
        {
          uint64_t v12 = "Buffer is not big enough to be SRP UTF8\n";
          goto LABEL_52;
        }

        unsigned int v27 = *(unsigned __int16 *)v11;
        v11 += 2;
        unsigned int v28 = bswap32(v27);
        if (v21 >= HIWORD(v28))
        {
          size_t v20 = HIWORD(v28);
          uint64_t v29 = v37++;
          uint64_t v30 = *v29;
          uint64_t v31 = malloc((v20 + 1));
          *(void *)uint64_t v30 = v31;
          if (!v31) {
            goto LABEL_42;
          }
          memcpy(v31, v11, v20);
          *(_BYTE *)(*(void *)v30 + v20) = 0;
LABEL_36:
          v11 += v20;
          unsigned int v10 = v21 - v20;
          a4 = v17;
LABEL_37:
          ++a4;
          continue;
        }

        uint64_t v12 = "Not enough data for this SRP UTF8\n";
LABEL_50:
        unsigned int v10 = v21;
LABEL_52:
        SETERROR(a1, v12, a3, (uint64_t)a4, a5, a6, a7, a8, v36);
LABEL_53:
        uint64_t result = 4294967291LL;
LABEL_54:
        if (v10)
        {
          uint64_t v34 = "Extra data in SRP buffer\n";
LABEL_56:
          uint64_t v35 = a1;
LABEL_57:
          SETERROR(v35, v34, a3, (uint64_t)a4, a5, a6, a7, a8, v36);
          return 4294967291LL;
        }

        return result;
      case 9u:
        if (v10 < 4)
        {
          uint64_t v12 = "Buffer is not big enough to be SRP uint\n";
          goto LABEL_52;
        }

        uint64_t v32 = v37++;
        **uint64_t v32 = bswap32(*(unsigned __int16 *)v11) >> 16;
        LODWORD(v20) = 4;
LABEL_35:
        unsigned int v21 = v10;
        goto LABEL_36;
      default:
LABEL_19:
        LODWORD(v20) = 1;
        goto LABEL_35;
    }
  }

uint64_t MakeBuffer( void **a1, _DWORD *a2, int64_t *a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9 = a4;
  unint64_t v13 = 0LL;
  v42 = (const char **)&a9;
  for (CFIndex i = a4; *i != 37; ++i)
  {
    if (!*i)
    {
      if (v13 < 0x7FFFFFFC)
      {
        uint64_t result = conditional_realloc(a1, a2, (v13 + 4));
        if (!(_DWORD)result)
        {
          unsigned int v22 = (char *)*a1 + 4;
          uint64_t v44 = &a9;
          while (1)
          {
            int v23 = *v9;
            if (v23 == 37)
            {
              int v25 = *++v9;
              LOBYTE(v23) = v25;
              HIDWORD(v26) = v25 - 99;
              LODWORD(v26) = v25 - 99;
              switch((v26 >> 1))
              {
                case 0u:
                  unsigned int v27 = (int *)v44++;
                  int v23 = *v27;
                  goto LABEL_22;
                case 5u:
                  ++v44;
                  uint64_t v28 = ccz_write_uint_size();
                  ccz_write_uint();
                  *(_WORD *)unsigned int v22 = bswap32(v28) >> 16;
                  uint64_t v24 = v28 + 2;
                  break;
                case 6u:
                  uint64_t v29 = v44;
                  size_t v30 = *(int *)v44;
                  v44 += 2;
                  uint64_t v31 = (const void *)v29[1];
                  *unsigned int v22 = v30;
                  memcpy(v22 + 1, v31, v30);
                  uint64_t v24 = v30 + 1;
                  break;
                case 7u:
                  uint64_t v32 = (unint64_t *)v44++;
                  *(void *)unsigned int v22 = bswap64(*v32);
                  uint64_t v24 = 8LL;
                  break;
                case 8u:
                  uint64_t v33 = (const char **)v44++;
                  uint64_t v34 = *v33;
                  size_t v35 = strlen(*v33);
                  *(_WORD *)unsigned int v22 = bswap32(v35) >> 16;
                  memcpy(v22 + 2, v34, v35);
                  uint64_t v24 = v35 + 2;
                  break;
                case 9u:
                  char v36 = (unsigned int *)v44++;
                  *(_DWORD *)unsigned int v22 = bswap32(*v36);
                  uint64_t v24 = 4LL;
                  break;
                default:
                  goto LABEL_22;
              }
            }

            else
            {
              if (!*v9)
              {
                uint64_t result = 0LL;
                goto LABEL_35;
              }

LABEL_22:
              *unsigned int v22 = v23;
              uint64_t v24 = 1LL;
            }

            v22 += v24;
            ++v9;
          }
        }
      }

      else
      {
        fwrite("String too long to create SRP buffer string\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
        return 0xFFFFFFFFLL;
      }

      return result;
    }

LABEL_4:
    ++v13;
LABEL_5:
    ;
  }

  int v15 = *++i;
  HIDWORD(v16) = v15 - 99;
  LODWORD(v16) = v15 - 99;
  switch((v16 >> 1))
  {
    case 0u:
      ++v42;
      goto LABEL_4;
    case 5u:
      ++v42;
      size_t v17 = ccz_write_uint_size();
      if (v17 < 0x10000) {
        goto LABEL_14;
      }
      size_t v37 = (FILE *)*MEMORY[0x1895F89D0];
      v38 = "String too long to create mpi string\n";
      size_t v39 = 37LL;
      goto LABEL_34;
    case 6u:
      unint64_t v18 = (unsigned int *)v42;
      uint64_t v43 = v42 + 1;
      unsigned int v19 = *v18;
      if (v19 < 0x100)
      {
        v13 += v19 + 1LL;
        v42 = (const char **)(v43 + 1);
        goto LABEL_5;
      }

      size_t v37 = (FILE *)*MEMORY[0x1895F89D0];
      v38 = "String too long to create os string\n";
      size_t v39 = 36LL;
LABEL_34:
      fwrite(v38, v39, 1uLL, v37);
      unsigned int v22 = 0LL;
      uint64_t result = 0xFFFFFFFFLL;
LABEL_35:
      uint64_t v40 = *a1;
      int64_t v41 = v22 - (_BYTE *)*a1;
      *a3 = v41;
      *uint64_t v40 = bswap32(v41 - 4);
      return result;
    case 7u:
      ++v42;
      v13 += 8LL;
      goto LABEL_5;
    case 8u:
      size_t v20 = v42++;
      size_t v17 = strlen(*v20);
      if (v17 >= 0x10000)
      {
        size_t v37 = (FILE *)*MEMORY[0x1895F89D0];
        v38 = "String too long to create utf8 string\n";
        size_t v39 = 38LL;
        goto LABEL_34;
      }

LABEL_14:
      v13 += v17 + 2;
      goto LABEL_5;
    case 9u:
      ++v42;
      v13 += 4LL;
      goto LABEL_5;
    default:
      goto LABEL_4;
  }

uint64_t set_ccsrp_groups()
{
  qword_18C749B80 = ccsrp_gp_rfc5054_1024();
  qword_18C749BA8 = ccsrp_gp_rfc5054_2048();
  qword_18C749BD0 = ccsrp_gp_rfc5054_4096();
  uint64_t result = ccsrp_gp_rfc5054_8192();
  qword_18C749BF8 = result;
  return result;
}

uint64_t OptionsToString(int *a1, char **a2)
{
  int v4 = (char *)malloc(1uLL);
  if (!v4) {
    return 4294967294LL;
  }
  int v5 = v4;
  char *v4 = 0;
  int v6 = *a1;
  BOOL v7 = (*a1 & 1) == 0;
  if ((*a1 & 1) != 0)
  {
    int v9 = (char *)reallocf(v4, 0xDuLL);
    if (!v9) {
      return 4294967294LL;
    }
    int v5 = v9;
    size_t v8 = 13LL;
    strlcat(v9, "mda=", 0xDuLL);
    strlcat(v5, "SHA-512", 0xDuLL);
  }

  else
  {
    size_t v8 = 1LL;
  }

  if (*((_BYTE *)a1 + 4))
  {
    v8 += 17LL;
    unsigned int v10 = (char *)reallocf(v5, v8);
    if (!v10) {
      return 4294967294LL;
    }
    int v5 = v10;
    if ((v6 & 1) != 0) {
      strlcat(v10, ",", v8);
    }
    strlcat(v5, "replay_detection", v8);
    BOOL v7 = 0;
  }

  if ((a1[2] & 1) != 0)
  {
    v8 += 44LL;
    uint64_t v11 = (char *)reallocf(v5, v8);
    if (!v11) {
      return 4294967294LL;
    }
    int v5 = v11;
    if (!v7) {
      strlcat(v11, ",", v8);
    }
    strlcat(v5, "confidentiality+integrity=", v8);
    strlcat(v5, "ChaCha20-Poly1305", v8);
    BOOL v7 = 0;
  }

  if ((a1[4] & 1) != 0)
  {
    v8 += 25LL;
    uint64_t v12 = (char *)reallocf(v5, v8);
    if (!v12) {
      return 4294967294LL;
    }
    int v5 = v12;
    if (!v7) {
      strlcat(v12, ",", v8);
    }
    strlcat(v5, "kdf=", v8);
    strlcat(v5, "SALTED-SHA512-PBKDF2", v8);
    BOOL v7 = 0;
  }

  if (a1[2] && *((void *)a1 + 3) <= 0x7FFFFFFAuLL)
  {
    v8 += 25LL;
    unint64_t v13 = (char *)reallocf(v5, v8);
    if (!v13) {
      return 4294967294LL;
    }
    int v5 = v13;
    if (!v7) {
      strlcat(v13, ",", v8);
    }
    strlcat(v5, "maxbuffersize=", v8);
    size_t v14 = strlen(v5);
    snprintf(&v5[v14], v8 - v14, "%lu", *((void *)a1 + 3));
    BOOL v7 = 0;
  }

  int v15 = a1[3];
  if ((v15 & 1) != 0)
  {
    v8 += 27LL;
    unint64_t v16 = (char *)reallocf(v5, v8);
    if (!v16) {
      return 4294967294LL;
    }
    int v5 = v16;
    if (!v7) {
      strlcat(v16, ",", v8);
    }
    strlcat(v5, "mandatory=", v8);
    strlcat(v5, "replay_detection", v8);
    BOOL v7 = 0;
    int v15 = a1[3];
  }

  if ((v15 & 2) == 0)
  {
LABEL_37:
    uint64_t result = 0LL;
    *a2 = v5;
    return result;
  }

  size_t v17 = (char *)reallocf(v5, v8 + 36);
  if (v17)
  {
    int v5 = v17;
    if (!v7) {
      strlcat(v17, ",", v8 + 36);
    }
    strlcat(v5, "mandatory=", v8 + 36);
    strlcat(v5, "confidentiality+integrity", v8 + 36);
    goto LABEL_37;
  }

  return 4294967294LL;
}

uint64_t ParseOptions(uint64_t a1, char *__s, int *a3, char a4)
{
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  *((void *)a3 + 3) = 2147483643LL;
  if (__s)
  {
    int v6 = __s;
    while (1)
    {
      size_t v7 = strlen(v6);
      if (!v7) {
        return 0LL;
      }
      size_t v8 = v7;
      int v9 = strchr(v6, 44);
      if (v9) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = (char *)&v6[v8];
      }
      unint64_t v11 = v10 - v6;
      uint64_t v12 = (char *)malloc(v10 - v6 + 1);
      if (!v12) {
        return 4294967294LL;
      }
      unint64_t v13 = v12;
      if (v10 != v6)
      {
        if (v11 <= 1) {
          uint64_t v14 = 1LL;
        }
        else {
          uint64_t v14 = v10 - v6;
        }
        int v15 = v12;
        do
        {
          __darwin_ct_rune_t v16 = *v6++;
          *v15++ = __tolower(v16);
          --v14;
        }

        while (v14);
      }

      v13[v11] = 0;
      int v6 = v10 + 1;
      uint64_t v17 = *v10;
      if (!strncasecmp(v13, "mda=", 4uLL))
      {
        int v32 = strcasecmp(v13 + 4, "SHA-512");
        if ((a4 & 1) != 0)
        {
          if (v32)
          {
            *a3 = 0;
            SETERROR(a1, "SRP MDA %s not supported", v18, v19, v20, v21, v22, v23, (_BYTE)v13 + 4);
            goto LABEL_57;
          }

          int v33 = *a3;
          if (*a3)
          {
            *a3 = 0;
            uint64_t v44 = "Multiple SRP MDAs given";
            goto LABEL_56;
          }
        }

        else
        {
          int v33 = *a3;
        }

        *a3 = v33 | (v32 == 0);
      }

      else if (!strcasecmp(v13, "replay_detection"))
      {
        if (*((_BYTE *)a3 + 4))
        {
          uint64_t v44 = "SRP Replay Detection option appears twice";
          goto LABEL_56;
        }

        *((_BYTE *)a3 + 4) = 1;
      }

      else if (!strncasecmp(v13, "confidentiality+integrity=", 0x1AuLL))
      {
        int v34 = strcasecmp(v13 + 26, "ChaCha20-Poly1305");
        if ((a4 & 1) != 0)
        {
          if (v34)
          {
            a3[2] = 0;
            SETERROR( a1,  "SRP Confidentiality+Integrity option %s not supported",  v25,  v26,  v27,  v28,  v29,  v30,  (_BYTE)v13 + 26);
            goto LABEL_60;
          }

          int v35 = a3[2];
          if (v35)
          {
            a3[2] = 0;
            size_t v45 = "Multiple SRP Confidentiality+Integrity options given";
LABEL_59:
            SETERROR(a1, v45, v25, v26, v27, v28, v29, v30, v47);
LABEL_60:
            uint64_t v17 = 0xFFFFFFFFLL;
            goto LABEL_61;
          }
        }

        else
        {
          int v35 = a3[2];
        }

        a3[2] = v35 | (v34 == 0);
      }

      else if ((a4 & 1) == 0 && !strncasecmp(v13, "mandatory=", 0xAuLL))
      {
        if (!strcasecmp(v13 + 10, "replay_detection"))
        {
          int v43 = a3[3] | 1;
        }

        else
        {
          if (strncasecmp(v13 + 10, "confidentiality+integrity", 0x19uLL))
          {
            char v47 = (_BYTE)v13 + 10;
            uint64_t v44 = "Mandatory SRP option %s not supported";
LABEL_56:
            SETERROR(a1, v44, v18, v19, v20, v21, v22, v23, v47);
LABEL_57:
            uint64_t v17 = 4294967291LL;
LABEL_61:
            free(v13);
            return v17;
          }

          int v43 = a3[3] | 2;
        }

        a3[3] = v43;
      }

      else if (!strncasecmp(v13, "maxbuffersize=", 0xEuLL))
      {
        unint64_t v36 = strtoul(v13 + 14, 0LL, 10);
        *((void *)a3 + 3) = v36;
        if (v36 > 0x7FFFFFFB)
        {
          SETERROR(a1, "SRP Maxbuffersize %lu too big (> %u)", v37, v38, v39, v40, v41, v42, v36);
          goto LABEL_57;
        }
      }

      else if (!strncasecmp(v13, "kdf=", 4uLL))
      {
        int v24 = strcasecmp(v13 + 4, "SALTED-SHA512-PBKDF2");
        if ((a4 & 1) != 0)
        {
          if (v24)
          {
            a3[4] = 0;
            SETERROR(a1, "SRP KDF option %s not supported", v25, v26, v27, v28, v29, v30, (_BYTE)v13 + 4);
            goto LABEL_60;
          }

          int v31 = a3[4];
          if (v31)
          {
            a3[4] = 0;
            size_t v45 = "Multiple SRP KDF options given";
            goto LABEL_59;
          }
        }

        else
        {
          int v31 = a3[4];
        }

        a3[4] = v31 | (v24 == 0);
      }

      free(v13);
      if (!(_DWORD)v17) {
        return v17;
      }
    }
  }

  return 0LL;
}

uint64_t SetMDA(_DWORD *a1, uint64_t a2)
{
  if (*a1 == 1)
  {
    uint64_t digestbyname = cc_get_digestbyname("sha512");
    uint64_t result = 0LL;
    *(void *)(a2 + 336) = digestbyname;
  }

  else
  {
    fwrite("Unable to find SRP MDA option now\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t LayerInit(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if (*(_BYTE *)(a1 + 4))
  {
    *(_DWORD *)(a2 + 360) |= 1u;
    int v5 = *(_DWORD *)(a1 + 8);
    if (!v5)
    {
      int v5 = 1;
      *(_DWORD *)(a1 + 8) = 1;
    }
  }

  else
  {
    int v5 = *(_DWORD *)(a1 + 8);
    if (!v5) {
      goto LABEL_10;
    }
  }

  *(_DWORD *)(a2 + 360) |= 2u;
  if (v5 == 1)
  {
    if (strcasecmp("ChaCha20-Poly1305", "ChaCha20-Poly1305"))
    {
      int v6 = (FILE *)*MEMORY[0x1895F89D0];
      size_t v7 = "Unsupported SRP confidentiality+integrity layer option, not ChaCha20-Poly1305\n";
LABEL_13:
      size_t v8 = 78LL;
      goto LABEL_14;
    }

    LODWORD(v4) = v4 - 16;
    chacha20_poly1305_init_64x64();
    chacha20_poly1305_init_64x64();
LABEL_10:
    if (*(_DWORD *)(a1 + 16) == 1)
    {
      uint64_t result = 0LL;
      *(_OWORD *)(a2 + 936) = 0u;
      *(_OWORD *)(a2 + 952) = 0u;
      *(_DWORD *)(a2 + 936) = 4;
      *(_DWORD *)(a2 + 964) = v4 - 4;
      return result;
    }

    int v6 = (FILE *)*MEMORY[0x1895F89D0];
    size_t v7 = "Unable to find SRP KDF layer option, kdf=SALTED-SHA512-PBKDF2 option required\n";
    goto LABEL_13;
  }

  int v6 = (FILE *)*MEMORY[0x1895F89D0];
  size_t v7 = "Unable to find SRP confidentiality+integrity layer option\n";
  size_t v8 = 58LL;
LABEL_14:
  fwrite(v7, v8, 1uLL, v6);
  return 0xFFFFFFFFLL;
}

id ldap_connection_obj_alloc(uint64_t a1)
{
  size_t v1 = a1 - 8;
  int v2 = (objc_class *)objc_opt_class();
  return class_createInstance(v2, v1);
}

id ldap_operation_obj_alloc(uint64_t a1)
{
  size_t v1 = a1 - 8;
  int v2 = (objc_class *)objc_opt_class();
  return class_createInstance(v2, v1);
}

uint64_t decode_PagedSearchControlValue()
{
  return _asn1_decode_top();
}

uint64_t encode_PagedSearchControlValue()
{
  return _asn1_encode();
}

uint64_t length_PagedSearchControlValue()
{
  return _asn1_length();
}

uint64_t free_PagedSearchControlValue()
{
  return _asn1_free_top();
}

void _ldap_connection_create_cold_1()
{
}

void _o_ldap_connection_cancel_all_operations_cold_1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  __int16 v2 = 2048;
  uint64_t v3 = v0;
  _os_log_debug_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "connection: %p, cancel operation count: %ld",  v1,  0x16u);
  OUTLINED_FUNCTION_0();
}

void ldap_connection_query_create_cold_1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  __int16 v2 = 2080;
  uint64_t v3 = v0;
  _os_log_error_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "connection: %p, invalid filter provided: %s",  v1,  0x16u);
  OUTLINED_FUNCTION_0();
}

void _o_ldap_operation_cancel_internal_cold_1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  __int16 v2 = 1024;
  int v3 = v0;
  _os_log_debug_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "abandon connection: %p, ldap msgid: %d",  v1,  0x12u);
  OUTLINED_FUNCTION_0();
}

void ___o_initiate_tls_handshake_block_invoke_cold_1()
{
}

void ___o_negotiate_ssl_block_invoke_cold_1()
{
  uint64_t v1 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "connection: %p, TLS: negotiated",  v0,  0xCu);
  OUTLINED_FUNCTION_0();
}

void ___schedule_read_block_invoke_cold_1()
{
}

void _o_ldap_receive_messages_cold_1()
{
}

void ___o_ldap_wakeup_block_invoke_cold_1()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6();
  int v4 = v0;
  __int16 v5 = v1;
  int v6 = v2;
  _os_log_error_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "connection: %p, ldap msgid: %d, tcp_connection error: %{errno}d",  v3,  0x18u);
  OUTLINED_FUNCTION_0();
}

void _ldap_continue_sasl_cold_1()
{
}

void ___o_ldap_digestmd5_auth_block_invoke_2_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___o_ldap_digestmd5_auth_block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = 134217984;
  uint64_t v3 = v1;
  _os_log_error_impl( &dword_188CD9000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "connection: %p, credentials: invalid",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_0();
}

uint64_t CCCreateBigNum()
{
  return MEMORY[0x1895F8088]();
}

int CCKeyDerivationPBKDF( CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x1895F81F8]( *(void *)&algorithm,  password,  passwordLen,  salt,  saltLen,  *(void *)&prf,  *(void *)&rounds,  derivedKey);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1895F8228](bytes, count);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
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

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
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

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1896036C8](anURL);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603718](anURL);
}

SInt32 CFURLGetPortNumber(CFURLRef anURL)
{
  return MEMORY[0x189603820](anURL);
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x18960B060](context);
}

SSLContextRef SSLCreateContext( CFAllocatorRef alloc, SSLProtocolSide protocolSide, SSLConnectionType connectionType)
{
  return (SSLContextRef)MEMORY[0x18960B080](alloc, *(void *)&protocolSide, *(void *)&connectionType);
}

OSStatus SSLGetBufferedReadSize(SSLContextRef context, size_t *bufSize)
{
  return MEMORY[0x18960B088](context, bufSize);
}

OSStatus SSLGetSessionState(SSLContextRef context, SSLSessionState *state)
{
  return MEMORY[0x18960B0E0](context, state);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x18960B0E8](context);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x18960B0F8](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x18960B118](context, certRefs);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x18960B128](context, connection);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x18960B140](context, readFunc, writeFunc);
}

OSStatus SSLSetPeerDomainName(SSLContextRef context, const char *peerName, size_t peerNameLen)
{
  return MEMORY[0x18960B168](context, peerName, peerNameLen);
}

OSStatus SSLSetProtocolVersionMin(SSLContextRef context, SSLProtocol minVersion)
{
  return MEMORY[0x18960B180](context, *(void *)&minVersion);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x18960B198](context, data, dataLength, processed);
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

uint64_t _asn1_decode_top()
{
  return MEMORY[0x1896151F0]();
}

uint64_t _asn1_encode()
{
  return MEMORY[0x1896151F8]();
}

uint64_t _asn1_free_top()
{
  return MEMORY[0x189615200]();
}

uint64_t _asn1_length()
{
  return MEMORY[0x189615208]();
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

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1895F9A28]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x1895F9A60]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA118]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1895FA270]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1895FA280]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1895FA298]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x1895FA328]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x1895FA330]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x1895FA338]();
}

uint64_t ccsrp_ctx_init()
{
  return MEMORY[0x1895FA340]();
}

uint64_t ccsrp_get_session_key_length()
{
  return MEMORY[0x1895FA370]();
}

uint64_t ccsrp_gp_rfc5054_1024()
{
  return MEMORY[0x1895FA378]();
}

uint64_t ccsrp_gp_rfc5054_2048()
{
  return MEMORY[0x1895FA380]();
}

uint64_t ccsrp_gp_rfc5054_4096()
{
  return MEMORY[0x1895FA390]();
}

uint64_t ccsrp_gp_rfc5054_8192()
{
  return MEMORY[0x1895FA398]();
}

uint64_t ccz_cmp()
{
  return MEMORY[0x1895FA480]();
}

uint64_t ccz_cmpi()
{
  return MEMORY[0x1895FA488]();
}

uint64_t ccz_read_uint()
{
  return MEMORY[0x1895FA490]();
}

uint64_t ccz_write_uint()
{
  return MEMORY[0x1895FA498]();
}

uint64_t ccz_write_uint_size()
{
  return MEMORY[0x1895FA4A0]();
}

uint64_t ccz_zero()
{
  return MEMORY[0x1895FA4A8]();
}

uint64_t chacha20_poly1305_decrypt()
{
  return MEMORY[0x18960EF98]();
}

uint64_t chacha20_poly1305_encrypt()
{
  return MEMORY[0x18960EFA0]();
}

uint64_t chacha20_poly1305_final()
{
  return MEMORY[0x18960EFA8]();
}

uint64_t chacha20_poly1305_init_64x64()
{
  return MEMORY[0x18960EFB0]();
}

uint64_t chacha20_poly1305_verify()
{
  return MEMORY[0x18960EFB8]();
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x189616498](cls, extraBytes);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895FA5F0](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1895FAC08](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1895FAC10](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1895FAC18](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FAC28](data);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
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

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1895FAEF0](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895FB610](*(void *)&a1, a2, a3);
}

OM_uint32 gss_delete_sec_context( OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_buffer_t output_token)
{
  return MEMORY[0x189607C00](minor_status, context_handle, output_token);
}

OM_uint32 gss_import_name( OM_uint32 *minor_status, gss_buffer_t input_name_buffer, gss_const_OID input_name_type, gss_name_t *output_name)
{
  return MEMORY[0x189607C20](minor_status, input_name_buffer, input_name_type, output_name);
}

OM_uint32 gss_init_sec_context( OM_uint32 *minor_status, gss_cred_id_t initiator_cred_handle, gss_ctx_id_t *context_handle, gss_name_t target_name, gss_OID input_mech_type, OM_uint32 req_flags, OM_uint32 time_req, gss_channel_bindings_t input_chan_bindings, gss_buffer_t input_token, gss_OID *actual_mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec)
{
  return MEMORY[0x189607C28]( minor_status,  initiator_cred_handle,  context_handle,  target_name,  input_mech_type,  *(void *)&req_flags,  *(void *)&time_req,  input_chan_bindings);
}

OM_uint32 gss_release_buffer(OM_uint32 *minor_status, gss_buffer_t buffer)
{
  return MEMORY[0x189607C40](minor_status, buffer);
}

OM_uint32 gss_unwrap( OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_buffer_t input_message_buffer, gss_buffer_t output_message_buffer, int *conf_state, gss_qop_t *qop_state)
{
  return MEMORY[0x189607C60]( minor_status,  context_handle,  input_message_buffer,  output_message_buffer,  conf_state,  qop_state);
}

OM_uint32 gss_wrap( OM_uint32 *minor_status, gss_ctx_id_t context_handle, int conf_req_flag, gss_qop_t qop_req, gss_buffer_t input_message_buffer, int *conf_state, gss_buffer_t output_message_buffer)
{
  return MEMORY[0x189607C68]( minor_status,  context_handle,  *(void *)&conf_req_flag,  *(void *)&qop_req,  input_message_buffer,  conf_state,  output_message_buffer);
}

uint64_t heim_cram_md5_create()
{
  return MEMORY[0x18960DA08]();
}

uint64_t heim_digest_create()
{
  return MEMORY[0x18960DA10]();
}

uint64_t heim_digest_create_response()
{
  return MEMORY[0x18960DA18]();
}

uint64_t heim_digest_parse_challenge()
{
  return MEMORY[0x18960DA20]();
}

uint64_t heim_digest_release()
{
  return MEMORY[0x18960DA28]();
}

uint64_t heim_digest_set_key()
{
  return MEMORY[0x18960DA30]();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FB838](*(void *)&a1, a2, a3, *(void *)&a4);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

uint64_t nw_parameters_set_is_non_app_initiated()
{
  return MEMORY[0x189609B90]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1895FC5F8](object);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1895FCEC8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCFA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FD0D0](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

uint64_t tcp_connection_allow_client_socket_access()
{
  return MEMORY[0x18960AC40]();
}

uint64_t tcp_connection_cancel()
{
  return MEMORY[0x18960AC48]();
}

uint64_t tcp_connection_copy_parameters()
{
  return MEMORY[0x18960AC68]();
}

uint64_t tcp_connection_create()
{
  return MEMORY[0x18960AC88]();
}

uint64_t tcp_connection_create_with_connected_fd()
{
  return MEMORY[0x18960AC90]();
}

uint64_t tcp_connection_get_hostname()
{
  return MEMORY[0x18960ACB8]();
}

uint64_t tcp_connection_get_remote()
{
  return MEMORY[0x18960ACC8]();
}

uint64_t tcp_connection_read()
{
  return MEMORY[0x18960AD38]();
}

uint64_t tcp_connection_release()
{
  return MEMORY[0x18960AD40]();
}

uint64_t tcp_connection_set_account_identifier()
{
  return MEMORY[0x18960AD58]();
}

uint64_t tcp_connection_set_event_handler()
{
  return MEMORY[0x18960AD80]();
}

uint64_t tcp_connection_set_indefinite()
{
  return MEMORY[0x18960AD98]();
}

uint64_t tcp_connection_set_no_cellular()
{
  return MEMORY[0x18960ADC0]();
}

uint64_t tcp_connection_set_source_application_by_bundle()
{
  return MEMORY[0x18960AE00]();
}

uint64_t tcp_connection_start()
{
  return MEMORY[0x18960AE20]();
}

uint64_t tcp_connection_write()
{
  return MEMORY[0x18960AE28]();
}

uint64_t tcp_connection_write_buffer()
{
  return MEMORY[0x18960AE30]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1895FD5B8]();
}