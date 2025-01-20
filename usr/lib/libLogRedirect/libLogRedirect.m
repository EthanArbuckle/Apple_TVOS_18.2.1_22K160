char *resetDyldInsertLibraries(const char *a1)
{
  char *result;
  const char *v3;
  uint64_t v4;
  const char *v5;
  int v6;
  char *v7;
  size_t v8;
  int i;
  size_t v10;
  const char *v11;
  BOOL v12;
  BOOL v13;
  const char *v14;
  char *v15;
  const char *v16;
  uint64_t v17;
  result = getenv("DYLD_INSERT_LIBRARIES");
  if (result)
  {
    v3 = result;
    strlen(result);
    v4 = __chkstk_darwin();
    v5 = (char *)&v17 - ((v4 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    v6 = *(unsigned __int8 *)v3;
    if (!*v3) {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
    v7 = (char *)&v17 - ((v4 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    do
    {
      v8 = 0LL;
      for (i = v6; i; i = v3[++v8])
      {
        if (i == 58) {
          break;
        }
      }

      if (v8)
      {
        v10 = v8;
        while (v3[v10] != 47)
        {
          if (!--v10) {
            goto LABEL_11;
          }
        }

        v11 = &v3[v10];
        v6 = 47;
      }

      else
      {
LABEL_11:
        v11 = v3;
      }

      v12 = v6 == 47;
      v13 = v6 == 47;
      if (v12) {
        v14 = v11 + 1;
      }
      else {
        v14 = v11;
      }
      if (&v3[v8] != v14 && strncmp(v14, a1, v3 - v11 - v13 + v8))
      {
        v15 = (char *)v5;
        if (v7 != v5)
        {
          *v7 = 58;
          v15 = v7 + 1;
        }

        v7 = stpncpy(v15, v3, v8);
        i = v3[v8];
      }

      if (i == 58) {
        v16 = v3 + 1;
      }
      else {
        v16 = v3;
      }
      v3 = &v16[v8];
      v6 = v16[v8];
    }

    while (v6);
    if (v7 > v5)
    {
      *v7 = 0;
      return (char *)setenv("DYLD_INSERT_LIBRARIES", v5, 1);
    }

    else
    {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
  }

  return result;
}

uint64_t GetEnvMode(const char *a1, uint64_t a2, int a3)
{
  v5 = getenv(a1);
  if (v5)
  {
    if (*v5)
    {
      uint64_t v6 = strtol(v5, 0LL, 0);
    }
  }

  return a2;
}

uint64_t LogRedirect_init()
{
  unsigned int EnvMode = GetEnvMode("OS_LOG_TRANSLATE_PRINT_MODE", 0LL, 255);
  unsigned int v1 = EnvMode & 0xFFFFFFDF;
  if ((EnvMode & 0x10) == 0) {
    unsigned int v1 = EnvMode;
  }
  interceptionMode = v1;
  if ((v1 & 1) != 0)
  {
    redirectHandle_stdout = (uint64_t)os_log_create("com.apple.developer", "stdout");
    unsigned int v1 = interceptionMode;
  }

  if ((v1 & 2) != 0)
  {
    redirectHandle_stderr = (uint64_t)os_log_create("com.apple.developer", "stderr");
    unsigned int v1 = interceptionMode;
  }

  if ((v1 & 3) == 0)
  {
    v1 &= 0xFFFFFFCF;
    interceptionMode = v1;
  }

  if ((v1 & 0xC0) == 0xC0)
  {
    uint64_t v2 = 0LL;
    interceptionMode = v1 & 0xFFFFFF3F;
  }

  else
  {
    if ((v1 & 0x40) != 0) {
      int v3 = 1;
    }
    else {
      int v3 = 2;
    }
    if ((v1 & 0x40) != 0) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
    if ((v1 & 0xC0) != 0)
    {
      while (dup2(v4, v3) == -1)
      {
        if (*__error() != 4)
        {
          uint64_t v2 = *__error();
          goto LABEL_22;
        }
      }
    }

    uint64_t v2 = 0LL;
  }

LABEL_22:
  unsetenv("OS_LOG_TRANSLATE_PRINT_MODE");
  return v2;
}

int64_t __logredirect__write(uint64_t a1, uint64_t a2, int64_t a3)
{
  return LogRedirectWrite(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, int64_t))&_write);
}

int64_t LogRedirectWrite( uint64_t a1, uint64_t a2, int64_t a3, uint64_t (*a4)(uint64_t, uint64_t, int64_t))
{
  if ((a1 - 3) < 0xFFFFFFFE
    || !__PAIR64__(hookMode, interceptionMode)
    || (pthread_getspecific(logRedirectThreadLockFlagsKey) & 4) != 0)
  {
    goto LABEL_7;
  }

  if ((_DWORD)a1 == 2)
  {
    int v8 = interceptionMode & 8;
    char v9 = interceptionMode >> 1;
    goto LABEL_17;
  }

  if ((_DWORD)a1 != 1)
  {
LABEL_7:
    int v10 = 0;
    signed int v11 = 1;
    goto LABEL_8;
  }

  int v8 = interceptionMode & 4;
  char v9 = interceptionMode;
LABEL_17:
  int v10 = v9 & 1;
  if (!v8 || (v9 & 1) != 0)
  {
    signed int v11 = pthread_getspecific(logRedirectThreadLockFlagsKey);
    if ((v11 & 2) != 0)
    {
      int v13 = 4;
    }

    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&logRedirectLock);
      int v13 = 6;
    }

    pthread_setspecific(logRedirectThreadLockFlagsKey, (const void *)(v13 | v11));
    if (v8) {
      goto LABEL_24;
    }
LABEL_8:
    a3 = a4(a1, a2, a3);
    goto LABEL_9;
  }

  signed int v11 = 1;
LABEL_24:
  if ((unint64_t)a3 >> 31)
  {
    v14 = __error();
    int v15 = 22;
    goto LABEL_29;
  }

  if (!a2 && a3)
  {
    v14 = __error();
    int v15 = 14;
LABEL_29:
    int *v14 = v15;
    a3 = -1LL;
    if ((v11 & 1) != 0) {
      return a3;
    }
    goto LABEL_13;
  }

LABEL_9:
  if (v10 && a3 >= 1)
  {
    v16[0] = a2;
    v16[1] = a3;
    LogRedirectSendToOSLog(a1, (uint64_t)v16, 1, a3);
  }

  if ((v11 & 1) == 0)
  {
LABEL_13:
    pthread_setspecific(logRedirectThreadLockFlagsKey, (const void *)v11);
    if ((v11 & 2) == 0) {
      os_unfair_lock_unlock((os_unfair_lock_t)&logRedirectLock);
    }
  }

  return a3;
}

int64_t __logredirect__write_nocancel(uint64_t a1, uint64_t a2, int64_t a3)
{
  return LogRedirectWrite(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, int64_t))&__write_nocancel);
}

int64_t __logredirect__writev(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return LogRedirectWritev(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&_writev);
}

int64_t LogRedirectWritev( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  if ((a1 - 3) < 0xFFFFFFFE
    || !__PAIR64__(hookMode, interceptionMode)
    || (pthread_getspecific(logRedirectThreadLockFlagsKey) & 4) != 0)
  {
    goto LABEL_7;
  }

  if ((_DWORD)a1 != 2)
  {
    if ((_DWORD)a1 == 1)
    {
      int v8 = interceptionMode & 4;
      char v9 = interceptionMode;
      goto LABEL_17;
    }

LABEL_7:
    int v10 = 0;
    signed int v11 = 1;
    goto LABEL_8;
  }

  int v8 = interceptionMode & 8;
  char v9 = interceptionMode >> 1;
LABEL_17:
  int v10 = v9 & 1;
  if (v8 && (v9 & 1) == 0)
  {
    signed int v11 = 1;
    goto LABEL_24;
  }

  signed int v11 = pthread_getspecific(logRedirectThreadLockFlagsKey);
  if ((v11 & 2) != 0)
  {
    int v14 = 4;
  }

  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&logRedirectLock);
    int v14 = 6;
  }

  pthread_setspecific(logRedirectThreadLockFlagsKey, (const void *)(v14 | v11));
  if (v8)
  {
LABEL_24:
    if ((a3 - 1025) > 0xFFFFFBFF)
    {
      if (!a2)
      {
LABEL_35:
        int v15 = __error();
        int v16 = 14;
LABEL_36:
        *int v15 = v16;
        int64_t v12 = -1LL;
        if ((v11 & 1) != 0) {
          return v12;
        }
        goto LABEL_13;
      }

      unsigned __int8 v17 = 0;
      int64_t v12 = 0LL;
      v18 = (uint64_t *)(a2 + 8);
      uint64_t v19 = a3;
      while (1)
      {
        uint64_t v20 = *v18;
        BOOL v21 = __CFADD__(v20, v12);
        v12 += v20;
        if (v21 || v12 >= 0x80000000LL) {
          break;
        }
        if (v20) {
          v17 |= *(v18 - 1) == 0;
        }
        v18 += 2;
        if (!--v19)
        {
          if (((v12 > 0) & v17) != 1) {
            goto LABEL_9;
          }
          goto LABEL_35;
        }
      }
    }

    int v15 = __error();
    int v16 = 22;
    goto LABEL_36;
  }

LABEL_8:
  int64_t v12 = a4(a1, a2, a3);
LABEL_9:
  if (v10 && v12 >= 1) {
    LogRedirectSendToOSLog(a1, a2, a3, v12);
  }
  if ((v11 & 1) == 0)
  {
LABEL_13:
    pthread_setspecific(logRedirectThreadLockFlagsKey, (const void *)v11);
    if ((v11 & 2) == 0) {
      os_unfair_lock_unlock((os_unfair_lock_t)&logRedirectLock);
    }
  }

  return v12;
}

int64_t __logredirect__writev_nocancel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return LogRedirectWritev(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&__writev_nocancel);
}

void LogRedirectSendToOSLog(int a1, uint64_t a2, int a3, unint64_t a4)
{
  if (a1 == 1) {
    os_log_type_t v4 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v4 = OS_LOG_TYPE_DEBUG;
  }
  v5 = &redirectHandle_stdout;
  if (a1 != 1) {
    v5 = &redirectHandle_stderr;
  }
  if (a3 >= 1)
  {
    uint64_t v7 = 0LL;
    int v8 = (os_log_s *)*v5;
    uint64_t v23 = a3;
    while (1)
    {
      uint64_t v9 = a2 + 16 * v7;
      unint64_t v10 = a4 >= *(void *)(v9 + 8) ? *(void *)(v9 + 8) : a4;
      if (v10)
      {
        signed int v11 = *(const char **)v9;
        unint64_t v12 = v10 - 1;
        int v13 = v11[v10 - 1];
        a4 -= v13 == 10;
        if (v13 != 10) {
          break;
        }
        --v10;
        if (v12) {
          break;
        }
      }

LABEL_36:
      if (++v7 == v23) {
        return;
      }
    }

    while (1)
    {
      if (v10 >= 0x3E8) {
        int v14 = 1000;
      }
      else {
        int v14 = v10;
      }
      if (v10 >= 0x3E9)
      {
        uint64_t v15 = 0LL;
        while (1)
        {
          unsigned int v16 = v11[(v14 + v15 - 1)];
          if ((v16 & 0xC0) != 0x80) {
            break;
          }
          if (--v15 == -4) {
            goto LABEL_27;
          }
        }

        if (v16 <= 0xBF) {
          int v17 = 0;
        }
        else {
          int v17 = -1;
        }
        v14 += v15 + v17;
      }

LABEL_27:
      if (os_log_type_enabled(v8, v4))
      {
        *(_DWORD *)buf = 68158210;
        int v26 = v14;
        __int16 v27 = 2096;
        v28 = v11;
        __int16 v29 = 1024;
        int v30 = v14;
        uint64_t v19 = v8;
        os_log_type_t v20 = v4;
        BOOL v21 = "__stdio__[%.*P](%u)";
        uint32_t v22 = 24;
LABEL_34:
        _os_log_impl(&dword_0, v19, v20, v21, buf, v22);
      }

LABEL_35:
      v10 -= v14;
      a4 -= v14;
      v11 += v14;
      if (!v10) {
        goto LABEL_36;
      }
    }

    int v18 = strnlen(v11, v14);
    if (v18 + 1 < v14) {
      int v14 = v18 + 1;
    }
    if (!os_log_type_enabled(v8, v4)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 68157954;
    int v26 = v14;
    __int16 v27 = 2080;
    v28 = v11;
    uint64_t v19 = v8;
    os_log_type_t v20 = v4;
    BOOL v21 = "%.*s";
    uint32_t v22 = 18;
    goto LABEL_34;
  }
}

uint64_t LogHook_init(uint64_t a1)
{
  if ((HookValidateParamsBuffersOnly((void *)a1) & 1) == 0)
  {
    hookMode = 0;
    uint64_t v11 = 14LL;
    goto LABEL_20;
  }

  uint64_t v2 = getenv("OS_LOG_DT_HOOK_PREFIX");
  int v8 = v2;
  if (!v2) {
    goto LABEL_8;
  }
  size_t v9 = strlen(v2);
  if (!v9)
  {
    int v8 = 0LL;
    goto LABEL_8;
  }

  if (v9 < 0x81)
  {
LABEL_8:
    uint64_t v11 = 0LL;
    int v10 = 1;
    goto LABEL_9;
  }

  int v8 = 0LL;
  int v10 = 0;
  hookMode = 0;
  uint64_t v11 = 7LL;
LABEL_9:
  unint64_t v12 = "libLogRedirect:";
  if (v8) {
    LOBYTE(v12) = (_BYTE)v8;
  }
  unint64_t v13 = HookBufferAppend((void *)a1, 0LL, "\n%s ", v3, v4, v5, v6, v7, (char)v12);
  *(void *)(a1 + 48) = v13;
  if (v10 && !v13)
  {
    hookMode = 0;
    uint64_t v11 = *__error();
  }

  if (!(_DWORD)v11)
  {
    int EnvMode = GetEnvMode("OS_LOG_DT_HOOK_MODE", 0LL, 1855);
    hookMode = EnvMode;
    if ((EnvMode & 1) != 0)
    {
      uint64_t v11 = 0LL;
      *(_BYTE *)(a1 + 68) = 1;
    }

    else if (EnvMode)
    {
      hookMode = 0;
      uint64_t v11 = 22LL;
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }

LABEL_20:
  unsetenv("OS_LOG_DT_HOOK_MODE");
  unsetenv("OS_LOG_DT_HOOK_PREFIX");
  return v11;
}

void *HookValidateParamsBuffersOnly(void *result)
{
  if (result)
  {
    if (*result && result[1] && result[2] && result[3] && result[4]) {
      return (void *)(result[5] != 0LL);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

unint64_t HookBufferAppend( void *a1, unint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!a1) {
    goto LABEL_9;
  }
  unint64_t v10 = a1[1];
  size_t v11 = v10 - a2;
  BOOL v12 = *a1 && v10 > a2;
  if (!v12 || v10 - a2 <= 1) {
    goto LABEL_9;
  }
  unsigned int v16 = vsnprintf((char *)(*a1 + a2), v11, a3, &a9);
  if ((v16 & 0x80000000) != 0) {
    return 0LL;
  }
  if (v11 <= v16)
  {
LABEL_9:
    int v14 = __error();
    unint64_t result = 0LL;
    int *v14 = 12;
    return result;
  }

  return v16 + a2;
}

void LibLogRedirect_InitComplete(int a1, int a2, uint64_t a3, int a4)
{
  if (pthread_key_create((pthread_key_t *)&logRedirectThreadLockFlagsKey, 0LL))
  {
    int v8 = *__error();
    interceptionMode = 0;
    hookMode = 0;
    signed int v9 = 1;
  }

  else
  {
    signed int v9 = pthread_getspecific(logRedirectThreadLockFlagsKey);
    if ((v9 & 2) != 0)
    {
      int v10 = 12;
    }

    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&logRedirectLock);
      int v10 = 14;
    }

    pthread_setspecific(logRedirectThreadLockFlagsKey, (const void *)(v10 | v9));
    int v8 = 0;
  }

  if (!HookValidateParamsBuffersOnly((void *)a3) || !*(void *)(a3 + 48))
  {
    *__error() = 14;
    interceptionMode = 0;
    hookMode = 0;
    if (!a3)
    {
      int v25 = 2;
LABEL_31:
      write(v25, "\nlibLogRedirect: 0 0 E 0 {errorCode:14}\tFailed to initialize\n", 0x3DuLL);
      goto LABEL_32;
    }

LABEL_28:
    else {
      int v25 = *(_DWORD *)(a3 + 64);
    }
    goto LABEL_31;
  }

  unint64_t v16 = HookBufferAppend((void *)(a3 + 16), 0LL, "%x %x ", v11, v12, v13, v14, v15, hookMode);
  *(void *)(a3 + 56) = v16;
  if (!v16)
  {
LABEL_27:
    interceptionMode = 0;
    hookMode = 0;
    goto LABEL_28;
  }

  if (a1)
  {
    uint32_t v22 = "Failed to initialize LogHook";
    uint64_t v23 = a3;
    int v24 = a1;
    goto LABEL_26;
  }

  if (a2)
  {
    uint32_t v22 = "Failed to initialize LogRedirect";
    uint64_t v23 = a3;
    int v24 = a2;
    goto LABEL_26;
  }

  if (v8)
  {
    uint32_t v22 = "Failed to initialize libLogRedirect";
    uint64_t v23 = a3;
    int v24 = v8;
    goto LABEL_26;
  }

  unint64_t v26 = HookBufferAppend((void *)(a3 + 16), v16, "%c 0 ", v17, v18, v19, v20, v21, 73);
  if (!v26)
  {
    hookMode = 0;
    *(void *)(a3 + 56) = HookBufferAppend( (void *)(a3 + 16),  0LL,  "0 %x ",  v27,  v28,  v29,  v30,  v31,  interceptionMode);
    int v24 = *__error();
    uint32_t v22 = "Failed to initialize LogHook flags";
LABEL_25:
    uint64_t v23 = a3;
LABEL_26:
    if ((HookWriteError(v23, v24, v22) & 0x80000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_27;
  }

  uint64_t v32 = v26;
  unint64_t v33 = HookBufferAppend((void *)(a3 + 32), 0LL, "{version:2}\t", v27, v28, v29, v30, v31, v39);
  if (!v33)
  {
    hookMode = 0;
    *(void *)(a3 + 56) = HookBufferAppend( (void *)(a3 + 16),  0LL,  "0 %x ",  v34,  v35,  v36,  v37,  v38,  interceptionMode);
    int v24 = *__error();
    uint32_t v22 = "Failed to initialize LogHook metadata";
    goto LABEL_25;
  }

LABEL_32:
  if ((v9 & 1) == 0)
  {
    pthread_setspecific(logRedirectThreadLockFlagsKey, (const void *)v9);
    if ((v9 & 2) == 0) {
      os_unfair_lock_unlock((os_unfair_lock_t)&logRedirectLock);
    }
  }

  if ((hookMode & 1) != 0)
  {
    if (a4)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 0x40000000LL;
      v40[2] = __LibLogRedirect_OSLogHook_block_invoke;
      v40[3] = &__block_descriptor_tmp;
      v40[4] = a3;
      LibLogRedirect_OSLogHook_prevLogHook = os_log_set_hook_with_params(2LL, 0x8000000000000000LL, v40);
    }
  }

uint64_t HookWriteError(uint64_t a1, int a2, char *a3)
{
  if (!HookValidateParamsBuffersOnly((void *)a1)
    || !*(void *)(a1 + 48)
    || (unint64_t v11 = *(void *)(a1 + 56)) == 0
    || !a3
    || (*(_DWORD *)(a1 + 64) & 0x80000000) != 0)
  {
    *__error() = 14;
    return 0xFFFFFFFFLL;
  }

  unint64_t v13 = HookBufferAppend((void *)(a1 + 16), v11, "%c %llx ", v6, v7, v8, v9, v10, 69);
  ++HookWriteError_errorSequenceNum;
  HookWriteError_lastErrorCode = a2;
  HookWriteError_lastStaticError = (uint64_t)a3;
  if (!v13) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v19 = v13;
  unint64_t v20 = HookBufferAppend((void *)(a1 + 32), 0LL, "{errorCode:%d", v14, v15, v16, v17, v18, a2);
  if (!v20) {
    return 0xFFFFFFFFLL;
  }
  unint64_t appended = HookBufferAppendMetadataEndWithLineCount((void *)(a1 + 32), v20, a3, v21, v22, v23, v24, v25, v27);
  if (!appended) {
    return 0xFFFFFFFFLL;
  }
  return HookWrite((uint64_t *)a1, v19, appended, a3);
}

uint64_t HookWrite(uint64_t *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  if (HookValidateParamsBuffersOnly(a1) && (uint64_t v8 = a1[6]) != 0 && a1[7] && a4 && (a1[8] & 0x80000000) == 0)
  {
    uint64_t v21 = *a1;
    v22[0] = v8;
    v22[1] = a1[2];
    v22[2] = a2;
    v22[3] = a1[4];
    v22[4] = a3;
    v22[5] = a4;
    size_t v9 = strlen(a4);
    int v10 = 0;
    v22[6] = v9;
    v22[7] = "\n";
    v22[8] = 1LL;
    do
    {
      ssize_t v11 = writev(*((_DWORD *)a1 + 16), (const iovec *)&v22[2 * v10 - 1], 5 - v10);
      if (v11 < 0)
      {
        if (*__error() != 4) {
          return 0xFFFFFFFFLL;
        }
      }

      else
      {
        uint64_t v12 = (uint64_t)v10 << 32;
        unint64_t v13 = &v22[2 * v10];
        uint64_t v14 = v10 - 5LL;
        while (1)
        {
          unint64_t v15 = *v13;
          v13 += 2;
          ssize_t v16 = v11 - v15;
          if (v11 < v15) {
            break;
          }
          v12 += 0x100000000LL;
          ++v10;
          ssize_t v11 = v16;
          if (__CFADD__(v14++, 1LL)) {
            return 0LL;
          }
        }

        if (v11 >= 1)
        {
          uint64_t v18 = (void *)((char *)&v22[-1] + (v12 >> 28));
          ssize_t v19 = v18[1] - v11;
          *v18 += v11;
          v18[1] = v19;
        }
      }
    }

    while (v10 < 5);
    return 0LL;
  }

  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

unint64_t HookBufferAppendMetadataEndWithLineCount( void *a1, unint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9 = 1;
  while (*a3 == 10)
  {
    ++v9;
LABEL_6:
    ++a3;
  }

  if (*a3) {
    goto LABEL_6;
  }
  if (v9 < 2) {
    return HookBufferAppend(a1, a2, "}\t", a4, a5, a6, a7, a8, a9);
  }
  else {
    return HookBufferAppend(a1, a2, ",lines:%d}\t", a4, a5, a6, a7, a8, v9);
  }
}

LABEL_98:
            if ((hookMode & 4) != 0)
            {
              v89 = (char *)getprogname();
              v92 = HookBufferAppendEscapedString( v122,  v73,  v120 & 1,  ",procName:",  v89,  (char *)HookBufferFillMetadata_last_9,  v90,  v91);
              if (!v92) {
                goto LABEL_143;
              }
              v73 = v92;
              if ((v121 & 0x100) != 0) {
                goto LABEL_154;
              }
              free((void *)HookBufferFillMetadata_last_9);
              v93 = (void *)getprogname();
              if (v93)
              {
                v94 = getprogname();
                v93 = strdup(v94);
              }

              HookBufferFillMetadata_last_9 = (uint64_t)v93;
              if ((v120 & 1) != 0 || (v95 = HookBufferFillMetadata_last_10, v95 != getpid()))
              {
LABEL_154:
                v96 = getpid();
                v102 = HookBufferAppend(v122, v73, ",pid:%d", v97, v98, v99, v100, v101, v96);
                if (!v102) {
                  goto LABEL_143;
                }
                v73 = v102;
                if ((v121 & 0x100) != 0) {
                  goto LABEL_118;
                }
                HookBufferFillMetadata_last_10 = getpid();
                if ((v120 & 1) != 0) {
                  goto LABEL_118;
                }
              }

              v103 = HookBufferFillMetadata_last_11;
              if (v103 != geteuid())
              {
LABEL_118:
                v104 = geteuid();
                v110 = HookBufferAppend(v122, v73, ",uid:%u", v105, v106, v107, v108, v109, v104);
                if (!v110) {
                  goto LABEL_143;
                }
                v73 = v110;
                if ((v121 & 0x100) == 0) {
                  HookBufferFillMetadata_last_11 = geteuid();
                }
              }
            }

            v86 = hookMode;
            if ((hookMode & 8) != 0)
            {
              v87 = HookBufferAppend(v122, v73, ",cTime:0x%llx", v68, v69, v70, v71, v72, *((void *)a3 + 1));
              if (!v87) {
                goto LABEL_143;
              }
              v73 = v87;
              v86 = hookMode;
            }

            if ((v86 & 0x10) != 0)
            {
              v88 = HookBufferAppendEscapedString( v122,  v73,  v120 & 1,  ",format:",  *((char **)a3 + 11),  (char *)HookBufferFillMetadata_last_12,  v71,  v72);
              if (!v88) {
                goto LABEL_143;
              }
              v73 = v88;
              if ((v121 & 0x100) != 0)
              {
                if ((hookMode & 0x20) == 0) {
                  goto LABEL_140;
                }
                v73 = HookBufferAppend(v122, v88, ",traceID:0x%llx", v68, v69, v70, v71, v72, *(void *)a3);
                if (!v73) {
                  goto LABEL_143;
                }
LABEL_129:
                identifier = os_activity_get_identifier((os_activity_t)&_os_activity_current, (os_activity_id_t *)&v126);
                if (v120 & 1 | (HookBufferFillMetadata_last_14 != identifier))
                {
                  v114 = identifier;
                  v115 = HookBufferAppend(v122, v73, ",act:0x%llx", v68, v69, v70, v71, v72, identifier);
                  if (!v115) {
                    goto LABEL_143;
                  }
                  v73 = v115;
                  if ((v121 & 0x100) != 0)
                  {
                    v73 = HookBufferAppend(v122, v115, ",parentAct:0x%llx", v68, v69, v70, v71, v72, v126.tm_sec);
                    if (!v73) {
                      goto LABEL_143;
                    }
                    goto LABEL_140;
                  }

                  HookBufferFillMetadata_last_14 = v114;
                }

                if (!(v120 & 1 | (HookBufferFillMetadata_last_15 != *(void *)&v126.tm_sec))) {
                  goto LABEL_140;
                }
                v116 = HookBufferAppend(v122, v73, ",parentAct:0x%llx", v68, v69, v70, v71, v72, v126.tm_sec);
                v73 = v116;
                if (v116 && (v121 & 0x100) == 0)
                {
                  HookBufferFillMetadata_last_15 = *(void *)&v126.tm_sec;
                  goto LABEL_140;
                }

                if (v116)
                {
LABEL_140:
                  v117 = HookBufferAppendMetadataEndWithLineCount(v122, v73, v17, v68, v69, v70, v71, v72, v118);
                  if (v117)
                  {
                    if ((HookWrite((uint64_t *)v16, v119, v117, v17) & 0x80000000) == 0)
                    {
                      HookHandleLogMessage_lastOutputSuccessful = 1;
LABEL_146:
                      if ((v18 & 1) == 0)
                      {
                        pthread_setspecific(logRedirectThreadLockFlagsKey, (const void *)v18);
                        if ((v18 & 2) == 0) {
                          os_unfair_lock_unlock((os_unfair_lock_t)&logRedirectLock);
                        }
                      }

                      free(v17);
                      return;
                    }

                    uint64_t v34 = *__error();
                    uint64_t v35 = "Failed to write log message";
                    goto LABEL_144;
                  }
                }

LABEL_143:
                uint64_t v34 = *__error();
                uint64_t v35 = "Failed to copy log message metadata";
                goto LABEL_144;
              }

              free((void *)HookBufferFillMetadata_last_12);
              v111 = (char *)*((void *)a3 + 11);
              if (v111) {
                v111 = strdup(v111);
              }
              HookBufferFillMetadata_last_12 = (uint64_t)v111;
              v86 = hookMode;
            }

            if ((v86 & 0x20) == 0) {
              goto LABEL_140;
            }
            if (v120 & 1 | (HookBufferFillMetadata_last_13 != *(void *)a3))
            {
              v112 = HookBufferAppend(v122, v73, ",traceID:0x%llx", v68, v69, v70, v71, v72, *(void *)a3);
              if (!v112) {
                goto LABEL_143;
              }
              v73 = v112;
              if ((v121 & 0x100) == 0) {
                HookBufferFillMetadata_last_13 = *(void *)a3;
              }
            }

            goto LABEL_129;
          }
        }

        v73 = HookBufferAppend(v122, v73, ",offset:0x%llx", v68, v69, v70, v71, v72, v75);
        if (!v73) {
          goto LABEL_143;
        }
        HookBufferFillMetadata_last_6 = *((void *)a3 + 8);
        goto LABEL_86;
      }

LABEL_58:
      v52 = *((void *)a3 + 2);
      if (HookBufferFillMetadata_last_2 == v52) {
        goto LABEL_62;
      }
      goto LABEL_59;
    }

LABEL_53:
    v50 = a3[15];
    if (HookBufferFillMetadata_last_1 == v50) {
      goto LABEL_58;
    }
    goto LABEL_54;
  }

  int v10 = 0LL;
  while (1)
  {
    ssize_t v11 = strlen(HookIsSystemFramework_SysPaths[v10]);
    if (!strncmp(v9, HookIsSystemFramework_SysPaths[v10], v11)) {
      break;
    }
    if (++v10 == 4) {
      goto LABEL_16;
    }
  }

unint64_t HookBufferAppendEscapedString( uint64_t *a1, unint64_t a2, char a3, _BYTE *a4, char *__s1, char *__s2, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    goto LABEL_41;
  }
  if (!*a1) {
    goto LABEL_41;
  }
  unint64_t v9 = a2;
  if (a1[1] <= a2) {
    goto LABEL_41;
  }
  if (__s1)
  {
    uint64_t v12 = __s1;
    if (__s2)
    {
      uint64_t v12 = __s1;
      if ((a3 & 1) == 0)
      {
        int v13 = strcmp(__s1, __s2);
        uint64_t v12 = __s1;
        if (!v13) {
          return v9;
        }
      }
    }

LABEL_11:
    char v14 = *a4;
    if (*a4)
    {
      unint64_t v15 = a4 + 1;
      do
      {
        *(_BYTE *)(*a1 + v9++) = v14;
        if (v9 >= a1[1] - 1) {
          goto LABEL_41;
        }
        int v16 = *v15++;
        char v14 = v16;
      }

      while (v16);
    }

    if (!__s1 || (*(_BYTE *)(*a1 + v9) = 34, ++v9, v9 < a1[1] - 1))
    {
      unsigned int v17 = *(unsigned __int8 *)v12;
      if (*v12)
      {
        uint64_t v18 = (unsigned __int8 *)(v12 + 1);
        while (2)
        {
          switch(v17)
          {
            case 8u:
              LOBYTE(v17) = 98;
              goto LABEL_29;
            case 9u:
              LOBYTE(v17) = 116;
              goto LABEL_29;
            case 0xAu:
              LOBYTE(v17) = 110;
              goto LABEL_29;
            case 0xBu:
              goto LABEL_22;
            case 0xCu:
              LOBYTE(v17) = 102;
              goto LABEL_29;
            case 0xDu:
              LOBYTE(v17) = 114;
              goto LABEL_29;
            default:
              if (v17 == 92)
              {
LABEL_29:
                *(_BYTE *)(*a1 + v9++) = 92;
                if (v9 >= a1[1] - 1) {
                  goto LABEL_41;
                }
              }

              else
              {
LABEL_22:
                if (v17 < 0x20 || v17 == 34 || v17 == 127 || v17 == 125)
                {
                  unint64_t v9 = HookBufferAppend(a1, v9, "\\u%04X", (uint64_t)a4, (uint64_t)__s1, (uint64_t)__s2, a7, a8, v17);
                  if (!v9) {
                    return v9;
                  }
                  goto LABEL_31;
                }
              }

              *(_BYTE *)(*a1 + v9++) = v17;
              if (v9 >= a1[1] - 1) {
                goto LABEL_41;
              }
LABEL_31:
              unsigned int v19 = *v18++;
              unsigned int v17 = v19;
              if (!v19) {
                break;
              }
              continue;
          }

          break;
        }
      }

      uint64_t v20 = *a1;
      if (!__s1) {
        goto LABEL_40;
      }
      *(_BYTE *)(v20 + v9++) = 34;
      if (v9 < a1[1] - 1)
      {
        uint64_t v20 = *a1;
LABEL_40:
        *(_BYTE *)(v20 + v9) = 0;
        return v9;
      }
    }

LABEL_41:
    unint64_t v9 = 0LL;
    *__error() = 12;
    return v9;
  }

  uint64_t v12 = "null";
  if (__s2 || (a3 & 1) != 0) {
    goto LABEL_11;
  }
  return v9;
}

uint64_t __logredirect__fork()
{
  uint64_t result = __fork();
  if (!(_DWORD)result)
  {
    hookMode = 0;
    interceptionMode = 0;
  }

  return result;
}

void __library_initializer()
{
  int v0 = LogRedirect_init();
  int v1 = LogHook_init((uint64_t)&hookParams);
  LibLogRedirect_InitComplete(v1, v0, (uint64_t)&hookParams, 1);
}