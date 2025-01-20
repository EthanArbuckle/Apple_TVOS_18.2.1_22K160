uint64_t _sl_dlopen_audited(void *a1)
{
  return _sl_dlopen(a1, 0LL);
}

uint64_t _sl_dlopen(void *a1, char **a2)
{
  v3 = a1;
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v4 = a1;
  if (!*a1)
  {
LABEL_5:
    if (!a2) {
      return 0LL;
    }
    v7 = (void **)calloc(v4 - v3, 8uLL);
    v8 = v7;
    unint64_t v30 = v4 - v3;
    if (v4 == v3)
    {
      v20 = (char *)calloc(0LL, 1uLL);
      if (v20) {
        goto LABEL_24;
      }
    }

    else
    {
      v27 = a2;
      size_t v9 = 0LL;
      else {
        uint64_t v10 = v4 - v3;
      }
      v11 = (os_log_s *)MEMORY[0x1895F8DA0];
      v29 = v3;
      v12 = v3;
      v13 = (char **)v7;
      uint64_t v14 = v10;
      v28 = v7;
      do
      {
        uint64_t v15 = dlopen_from();
        if (v15)
        {
          uint64_t v22 = v15;
          v8 = v28;
          v3 = v29;
          goto LABEL_26;
        }

        v16 = dlerror();
        v17 = strdup(v16);
        *v13 = v17;
        size_t v18 = strlen(v17);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446210;
          v32 = v17;
          _os_log_impl( &dword_188E37000,  v11,  OS_LOG_TYPE_INFO,  "SoftLinking client failed to load dependency: %{public}s",  buf,  0xCu);
        }

        v9 += v18 + 1;
        ++v13;
        ++v12;
        --v14;
      }

      while (v14);
      v19 = (char *)calloc(v9, 1uLL);
      v8 = v28;
      v3 = v29;
      a2 = v27;
      if (v19)
      {
        v20 = v19;
        unint64_t v21 = 0LL;
        do
        {
          strlcat(v20, (const char *)v28[v21++], v9);
          if (v21 < v30) {
            strlcat(v20, "\n", v9);
          }
        }

        while (v10 != v21);
LABEL_24:
        uint64_t v22 = 0LL;
        *a2 = v20;
LABEL_26:
        if (v4 != v3)
        {
          if (v30 <= 1) {
            uint64_t v23 = 1LL;
          }
          else {
            uint64_t v23 = v30;
          }
          v24 = v8;
          do
          {
            v25 = *v24++;
            free(v25);
            --v23;
          }

          while (v23);
        }

        free(v8);
        return v22;
      }
    }

    _sl_dlopen_cold_1();
  }

  v4 = a1;
  while (1)
  {
    uint64_t v5 = dlopen_from();
    if (v5) {
      return v5;
    }
    uint64_t v6 = v4[1];
    ++v4;
    if (!v6) {
      goto LABEL_5;
    }
  }
}

void _sl_dlopen_cold_1()
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

uint64_t dlopen_from()
{
  return MEMORY[0x1895FAF68]();
}

void free(void *a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
}