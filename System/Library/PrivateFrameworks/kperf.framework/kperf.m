void *kperf_kdebug_filter_create()
{
  return calloc(1uLL, 0x91uLL);
}

uint64_t kperf_kdebug_filter_add_class(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 0);
}

uint64_t kperf_kdebug_filter_add_internal(uint64_t a1, int a2, char a3)
{
  if (!a1) {
    kperf_kdebug_filter_add_internal_cold_1();
  }
  unint64_t v4 = *(unsigned __int8 *)(a1 + 144);
  if (v4 < 0x20)
  {
    uint64_t result = 0LL;
    *(_BYTE *)(a1 + (v4 >> 1)) = *(_BYTE *)(a1 + (v4 >> 1)) & ~(15 << (4 * (v4 & 1))) | ((a3 & 0xF) << (4 * (v4 & 1)));
    *(_DWORD *)(a1 + 4 * v4 + 16) = a2;
    *(_BYTE *)(a1 + 144) = v4 + 1;
  }

  else
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t kperf_kdebug_filter_add_class_fn(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 1);
}

uint64_t kperf_kdebug_filter_add_class_subclass(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 2);
}

uint64_t kperf_kdebug_filter_add_class_subclass_fn(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 3);
}

uint64_t kperf_kdebug_filter_add_debugid(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 4);
}

uint64_t kperf_kdebug_filter_add_debugid_fn(uint64_t a1, int a2)
{
  return kperf_kdebug_filter_add_internal(a1, a2, 5);
}

uint64_t kperf_kdebug_filter_get_n_filters(uint64_t a1)
{
  if (!a1) {
    kperf_kdebug_filter_add_internal_cold_1();
  }
  return *(unsigned __int8 *)(a1 + 144);
}

uint64_t kperf_kdebug_filter_get_filter(uint64_t a1, int a2, _DWORD *a3, int *a4)
{
  if (!a1) {
    kperf_kdebug_filter_add_internal_cold_1();
  }
  if (!a3) {
    kperf_kdebug_filter_add_internal_cold_1();
  }
  if (!a4) {
    kperf_kdebug_filter_add_internal_cold_1();
  }
  if (*(unsigned __int8 *)(a1 + 144) <= a2)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v4 = 0LL;
    *a3 = *(_DWORD *)(a1 + 4LL * a2 + 16);
    *a4 = (*(unsigned __int8 *)(a1 + ((unint64_t)a2 >> 1)) >> (4 * (a2 & 1))) & 0xF;
  }

  return v4;
}

uint64_t kperf_kdebug_filter_set(unsigned __int8 *a1)
{
  if (a1)
  {
    if (a1[144])
    {
      return sysctlbyname("kperf.kdebug.filter", 0LL, 0LL, a1, 4LL * a1[144] + 16);
    }

    else
    {
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    char v3 = 0;
    memset(v2, 0, sizeof(v2));
    return sysctlbyname("kperf.kdebug.filter", 0LL, 0LL, v2, 0x10uLL);
  }
}

_BYTE *kperf_kdebug_filter_get()
{
  size_t v4 = 145LL;
  v0 = calloc(1uLL, 0x91uLL);
  if (v0)
  {
    if (sysctlbyname("kperf.kdebug.filter", v0, &v4, 0LL, 0LL) == -1)
    {
      int v2 = *__error();
      goto LABEL_7;
    }

    size_t v1 = v4 - 16;
    if (v4 < 0x10 || (v4 -= 16LL, v0[144] = v1 >> 2, (v1 & 0x3FC) == 0))
    {
      int v2 = 22;
LABEL_7:
      free(v0);
      v0 = 0LL;
      *__error() = v2;
    }
  }

  return v0;
}

uint64_t kperf_kdebug_filter_add_desc(uint64_t a1, char *a2)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (!a1) {
    kperf_kdebug_filter_add_internal_cold_1();
  }
  int v2 = a2;
  if (!a2) {
    kperf_kdebug_filter_add_internal_cold_1();
  }
  do
  {
    int v4 = *v2;
    if (!*v2) {
      return 0LL;
    }
    switch(v4)
    {
      case 'S':
        char v5 = 2;
        char v6 = 16;
        unint64_t v7 = 0xFFFFLL;
        break;
      case 'D':
        char v6 = 0;
        char v5 = 4;
        unint64_t v7 = 0xFFFFFFFFLL;
        break;
      case 'C':
        char v5 = 0;
        char v6 = 24;
        unint64_t v7 = 255LL;
        break;
      default:
        *__error() = 22;
        v32 = (os_log_s *)kperf_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          kperf_kdebug_filter_add_desc_cold_3((uint64_t)v2, v32, v33, v34, v35, v36, v37, v38);
        }
        return 0xFFFFFFFFLL;
    }

    unint64_t v8 = strtoul(v2 + 1, &__endptr, 0);
    v9 = __endptr;
    if (__endptr == v2 + 1)
    {
      v18 = (os_log_s *)kperf_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        kperf_kdebug_filter_add_desc_cold_4((uint64_t)(v2 + 1), v18, v19, v20, v21, v22, v23, v24);
      }
      goto LABEL_36;
    }

    uint64_t v10 = v8;
    if (v8 > v7)
    {
      v25 = (os_log_s *)kperf_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        kperf_kdebug_filter_add_desc_cold_5(v10, v25, v26, v27, v28, v29, v30, v31);
      }
LABEL_36:
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }

    int v11 = (_DWORD)v8 << v6;
    unsigned int v12 = *__endptr;
    if (v12 <= 0x6D)
    {
      if (!*__endptr || v12 == 44) {
        goto LABEL_24;
      }
    }

    else
    {
      switch(v12)
      {
        case 'n':
          v9 = __endptr + 1;
          goto LABEL_23;
        case 'r':
          v9 = __endptr + 1;
          v11 |= 2u;
          goto LABEL_23;
        case 's':
          v9 = __endptr + 1;
          v11 |= 1u;
LABEL_23:
          v5 |= 1u;
          goto LABEL_24;
      }
    }

    v13 = (os_log_s *)kperf_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = *v9;
      *(_DWORD *)buf = 67109120;
      int v41 = v14;
      _os_log_error_impl(&dword_186B9D000, v13, OS_LOG_TYPE_ERROR, "unrecognized suffix '%c'", buf, 8u);
    }

LABEL_24:
    if (*v9 == 44) {
      int v2 = v9 + 1;
    }
    else {
      int v2 = v9;
    }
  }

  while (!kperf_kdebug_filter_add_internal(a1, v11, v5));
  int v15 = *__error();
  v16 = (os_log_s *)kperf_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    kperf_kdebug_filter_add_desc_cold_6(v11, v16);
  }
  *__error() = v15;
  return 0xFFFFFFFFLL;
}

char *kperf_kdebug_filter_create_desc(uint64_t a1)
{
  int n_filters = kperf_kdebug_filter_get_n_filters(a1);
  if (n_filters)
  {
    int v3 = n_filters;
    size_t v4 = (14 * n_filters) | 1u;
    char v5 = (char *)calloc(1uLL, v4);
    if (v5)
    {
      char v6 = v5;
      size_t v7 = 0LL;
      int v8 = 0;
      while (!kperf_kdebug_filter_get_filter(a1, v8, &v36, (int *)&v35))
      {
        BOOL v9 = v35 > 5 || ((1 << v35) & 0x2A) == 0;
        if (v9)
        {
          int v11 = "";
        }

        else
        {
          uint64_t v10 = "r";
          if ((v36 & 2) == 0) {
            uint64_t v10 = "n";
          }
          int v11 = "s";
          if ((v36 & 1) == 0) {
            int v11 = v10;
          }
        }

        if (v35 > 5)
        {
          uint64_t v28 = (os_log_s *)kperf_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            kperf_kdebug_filter_create_desc_cold_2((uint64_t)&v35, v28, v29, v30, v31, v32, v33, v34);
          }
          goto LABEL_35;
        }

        if (((1 << v35) & 3) != 0)
        {
          unsigned int v12 = HIBYTE(v36);
          v36 >>= 24;
          int v13 = 2;
          uint64_t v14 = 67LL;
        }

        else if (((1 << v35) & 0xC) != 0)
        {
          unsigned int v12 = HIWORD(v36);
          v36 >>= 16;
          int v13 = 4;
          uint64_t v14 = 83LL;
        }

        else
        {
          unsigned int v12 = v36 & 0xFFFFFFFC;
          v36 &= 0xFFFFFFFC;
          int v13 = 8;
          uint64_t v14 = 68LL;
        }

        if (v7) {
          int v15 = ",";
        }
        else {
          int v15 = "";
        }
        unsigned int v16 = snprintf(&v6[v7], v4 - v7, "%s%c0x%0*x%s", v15, v14, v13, v12, v11);
        if ((v16 & 0x80000000) != 0)
        {
          uint64_t v26 = (os_log_s *)kperf_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            kperf_kdebug_filter_create_desc_cold_3(v8, v26);
          }
          goto LABEL_35;
        }

        v7 += v16;
        if (v7 <= v4)
        {
          BOOL v9 = v3 - 1 == v8++;
          if (!v9) {
            continue;
          }
        }

        return v6;
      }

      uint64_t v24 = (os_log_s *)kperf_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        kperf_kdebug_filter_create_desc_cold_4(v8, v24, v25);
      }
LABEL_35:
      free(v6);
    }

    else
    {
      v17 = (os_log_s *)kperf_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        kperf_kdebug_filter_create_desc_cold_1(v4, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }

  return 0LL;
}

uint64_t kperf_kdebug_action_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.kdebug.action", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_kdebug_action_get(void *a1)
{
  if (!a1) {
    kperf_kdebug_filter_add_internal_cold_1();
  }
  size_t v2 = 8LL;
  return sysctlbyname("kperf.kdebug.action", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_kdbg_callstacks_set(int a1)
{
  if (a1)
  {
    kperf_action_count_set(32);
    uint64_t v1 = kperf_action_samplers_set(0x20u, 8u);
    if (!(_DWORD)v1)
    {
      size_t v2 = (unsigned __int8 *)calloc(1uLL, 0x91uLL);
      if (v2)
      {
        int v3 = v2;
        if (kperf_kdebug_filter_add_internal((uint64_t)v2, 554303488, 2)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 67895298, 3)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 17432578, 3)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 17563650, 3)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 19922946, 3)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, 754974720, 0)
          || kperf_kdebug_filter_add_internal((uint64_t)v3, -16777214, 1))
        {
          uint64_t v1 = 0xFFFFFFFFLL;
        }

        else
        {
          uint64_t v1 = kperf_kdebug_filter_set(v3);
          if (!(_DWORD)v1)
          {
            LODWORD(v6[0]) = 32;
            uint64_t v1 = sysctlbyname("kperf.kdebug.action", 0LL, 0LL, v6, 4uLL);
          }
        }

        int v4 = *__error();
        free(v3);
        *__error() = v4;
      }

      else
      {
        return 0xFFFFFFFFLL;
      }
    }
  }

  else
  {
    char v7 = 0;
    memset(v6, 0, sizeof(v6));
    uint64_t v1 = sysctlbyname("kperf.kdebug.filter", 0LL, 0LL, v6, 0x10uLL);
    if (!(_DWORD)v1)
    {
      LODWORD(v6[0]) = 0;
      return sysctlbyname("kperf.kdebug.action", 0LL, 0LL, v6, 4uLL);
    }
  }

  return v1;
}

uint64_t kperf_kdbg_callstacks_get(BOOL *a1)
{
  uint64_t result = kperf_action_count_get(&v5);
  if (!(_DWORD)result)
  {
    if (v5 != 32) {
      goto LABEL_7;
    }
    uint64_t result = kperf_action_samplers_get(0x20u, &v4);
    if ((_DWORD)result) {
      return result;
    }
    if (v4 == 8)
    {
      size_t v7 = 8LL;
      uint64_t result = sysctlbyname("kperf.kdebug.action", &v6, &v7, 0LL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
      BOOL v3 = v6 == 32;
    }

    else
    {
LABEL_7:
      BOOL v3 = 0;
    }

    uint64_t result = 0LL;
    *a1 = v3;
  }

  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t kpc_pmu_version()
{
  unsigned int v1 = 0;
  size_t v2 = 4LL;
  if (sysctlbyname("kpc.pmu_version", &v1, &v2, 0LL, 0LL)) {
    return 0LL;
  }
  else {
    return v1;
  }
}

uint64_t kpc_cpu_string(char *a1, size_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    size_t v5 = 32LL;
    if (sysctlbyname("hw.cputype", &v9, &v5, 0LL, 0LL)
      || sysctlbyname("hw.cpusubtype", &v8, &v5, 0LL, 0LL)
      || sysctlbyname("hw.cpufamily", &v7, &v5, 0LL, 0LL))
    {
      return 0xFFFFFFFFLL;
    }

    else if (sysctlbyname("machdep.cpu.model", &v6, &v5, 0LL, 0LL))
    {
      return snprintf(a1, a2, "cpu_%x_%x_%x");
    }

    else
    {
      return snprintf(a1, a2, "cpu_%x_%x_%x_%x");
    }
  }

  return result;
}

uint64_t kpc_set_counting(int a1)
{
  int v2 = a1;
  return sysctlbyname("kpc.counting", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kpc_get_counting()
{
  size_t v2 = 4LL;
  if (sysctlbyname("kpc.counting", &v1, &v2, 0LL, 0LL)) {
    return 0LL;
  }
  else {
    return v1;
  }
}

uint64_t kpc_set_thread_counting(int a1)
{
  int v2 = a1;
  return sysctlbyname("kpc.thread_counting", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kpc_get_thread_counting()
{
  size_t v2 = 4LL;
  if (sysctlbyname("kpc.thread_counting", &v1, &v2, 0LL, 0LL)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v1;
  }
}

uint64_t kpc_get_config(unsigned int a1, void *a2)
{
  uint64_t v6 = a1;
  unsigned int v9 = a1;
  size_t v8 = 4LL;
  int v3 = sysctlbyname("kpc.config_count", &v7, &v8, &v9, 4uLL);
  unsigned int v4 = v7;
  if (v3 < 0) {
    unsigned int v4 = 0;
  }
  size_t v8 = 8LL * v4;
  return sysctlbyname("kpc.config", a2, &v8, &v6, 8uLL);
}

uint64_t kpc_get_config_count(int a1)
{
  int v4 = a1;
  size_t v3 = 4LL;
  if (sysctlbyname("kpc.config_count", &v2, &v3, &v4, 4uLL) >= 0) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t kpc_get_counter_count(int a1)
{
  int v4 = a1;
  size_t v3 = 4LL;
  if (sysctlbyname("kpc.counter_count", &v2, &v3, &v4, 4uLL) >= 0) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t kpc_set_config(unsigned int a1, const void *a2)
{
  unsigned int v11 = a1;
  size_t v10 = 4LL;
  uint64_t v4 = 0xFFFFFFFFLL;
  if ((sysctlbyname("kpc.config_count", &v9, &v10, &v11, 4uLL) & 0x80000000) == 0 && v9)
  {
    size_t v5 = (8 * v9);
    uint64_t v6 = malloc((v5 + 8));
    if (v6)
    {
      unsigned int v7 = v6;
      *uint64_t v6 = a1;
      memcpy(v6 + 1, a2, v5);
      uint64_t v4 = sysctlbyname("kpc.config", 0LL, 0LL, v7, (v5 + 8));
      free(v7);
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return v4;
}

uint64_t kpc_get_cpu_counters(int a1, unsigned int a2, _DWORD *a3, void *a4)
{
  uint64_t v15 = a2;
  int v16 = 1;
  if (a1)
  {
    uint64_t v15 = a2 | 0x80000000LL;
    int v7 = 8 * v16;
  }

  else
  {
    int v7 = 8;
  }

  unsigned int v19 = a2;
  size_t v18 = 4LL;
  int v8 = sysctlbyname("kpc.counter_count", &v17, &v18, &v19, 4uLL);
  int v9 = v17;
  if (v8 < 0) {
    int v9 = 0;
  }
  size_t v10 = (v7 * v9);
  size_t v18 = v10 + 8;
  unsigned int v11 = malloc(v10 + 8);
  if (!v11) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v12 = v11;
  bzero(v11, v10 + 8);
  uint64_t v13 = sysctlbyname("kpc.counters", v12, &v18, &v15, 8uLL);
  if (a3) {
    *a3 = *v12;
  }
  memcpy(a4, v12 + 1, v10);
  free(v12);
  return v13;
}

uint64_t kpc_cpu_count(int *a1)
{
  int v2 = kpc_cpu_count_ncpus;
  if (kpc_cpu_count_ncpus) {
    goto LABEL_2;
  }
  if (!sysctlbyname("hw.ncpu", &kpc_cpu_count_ncpus, &kpc_cpu_count_ncpus_size, 0LL, 0LL))
  {
    int v2 = kpc_cpu_count_ncpus;
LABEL_2:
    uint64_t result = 0LL;
    *a1 = v2;
    return result;
  }

  return 0xFFFFFFFFLL;
}

uint64_t kpc_get_thread_counters(int a1, unsigned int a2, void *a3)
{
  int v5 = a1;
  size_t v4 = 8LL * a2;
  return sysctlbyname("kpc.thread_counters", a3, &v4, &v5, 4uLL);
}

void *kpc_counterbuf_alloc()
{
  int v3 = 0;
  int v6 = 3;
  size_t v5 = 4LL;
  if (sysctlbyname("kpc.counter_count", &v4, &v5, &v6, 4uLL) >= 0) {
    int v0 = v4;
  }
  else {
    int v0 = 0;
  }
  int v1 = kpc_cpu_count(&v3);
  uint64_t result = 0LL;
  if (!v1 && v0 >= 1) {
    return calloc(v3 * (uint64_t)v0 + 1, 8uLL);
  }
  return result;
}

uint64_t kpc_set_period(unsigned int a1, const void *a2)
{
  unsigned int v11 = a1;
  size_t v10 = 4LL;
  if (sysctlbyname("kpc.counter_count", &v9, &v10, &v11, 4uLL) >= 0) {
    size_t v4 = (8 * v9);
  }
  else {
    size_t v4 = 0LL;
  }
  size_t v5 = malloc((v4 + 8));
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  *size_t v5 = a1;
  memcpy(v5 + 1, a2, v4);
  uint64_t v7 = sysctlbyname("kpc.period", 0LL, 0LL, v6, (v4 + 8));
  free(v6);
  return v7;
}

uint64_t kpc_get_period(unsigned int a1, void *a2)
{
  uint64_t v6 = a1;
  unsigned int v9 = a1;
  size_t v8 = 4LL;
  int v3 = sysctlbyname("kpc.counter_count", &v7, &v8, &v9, 4uLL);
  unsigned int v4 = v7;
  if (v3 < 0) {
    unsigned int v4 = 0;
  }
  size_t v8 = 8LL * v4;
  return sysctlbyname("kpc.period", a2, &v8, &v6, 8uLL);
}

uint64_t kpc_set_actionid(unsigned int a1, const void *a2)
{
  unsigned int v11 = a1;
  size_t v10 = 4LL;
  if (sysctlbyname("kpc.counter_count", &v9, &v10, &v11, 4uLL) >= 0) {
    size_t v4 = (4 * v9);
  }
  else {
    size_t v4 = 0LL;
  }
  size_t v5 = malloc((v4 + 8));
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  *size_t v5 = a1;
  memcpy(v5 + 1, a2, v4);
  uint64_t v7 = sysctlbyname("kpc.actionid", 0LL, 0LL, v6, (v4 + 8));
  free(v6);
  return v7;
}

uint64_t kpc_get_actionid(unsigned int a1, void *a2)
{
  uint64_t v6 = a1;
  unsigned int v9 = a1;
  size_t v8 = 4LL;
  int v3 = sysctlbyname("kpc.counter_count", &v7, &v8, &v9, 4uLL);
  unsigned int v4 = v7;
  if (v3 < 0) {
    unsigned int v4 = 0;
  }
  size_t v8 = 4LL * v4;
  return sysctlbyname("kpc.actionid", a2, &v8, &v6, 8uLL);
}

uint64_t kpc_sw_inc(int a1)
{
  int v2 = a1;
  return sysctlbyname("kpc.sw_inc", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kpc_force_all_ctrs_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kpc.force_all_ctrs", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kpc_force_all_ctrs_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kpc.force_all_ctrs", a1, &v2, 0LL, 0LL);
}

uint64_t trace_clear()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  *__error() = 0;
  *(_OWORD *)int v3 = xmmword_186BA27F0;
  uint64_t v4 = 0LL;
  int v0 = sysctl(v3, 3u, 0LL, &v2, 0LL, 0LL);
  uint64_t result = 0LL;
  if (v0 < 0) {
    return *__error();
  }
  return result;
}

uint64_t trace_bufinit(int a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *__error() = 0;
  *(void *)&__int128 v4 = 0x1800000001LL;
  DWORD2(v4) = 4;
  HIDWORD(v4) = a1;
  uint64_t v5 = 0LL;
  __int128 v4 = xmmword_186BA2800;
  uint64_t v5 = 0LL;
  int v2 = sysctl((int *)&v4, 3u, 0LL, 0LL, 0LL, 0LL);
  uint64_t result = 0LL;
  if (v2 < 0) {
    return *__error();
  }
  return result;
}

uint64_t trace_rnginit()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = 0x40000LL;
  int v3 = -1;
  size_t v4 = 20LL;
  *(_OWORD *)uint64_t v5 = xmmword_186BA2810;
  uint64_t v6 = 0LL;
  if (sysctl(v5, 3u, &v2, &v4, 0LL, 0LL) < 0) {
    return *__error();
  }
  *(_OWORD *)uint64_t v5 = xmmword_186BA2800;
  uint64_t v6 = 0LL;
  int v0 = sysctl(v5, 3u, 0LL, 0LL, 0LL, 0LL);
  uint64_t result = 0LL;
  if (v0 < 0) {
    return *__error();
  }
  return result;
}

uint64_t trace_enable(int a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v3 = 0x1800000001LL;
  int v4 = 3;
  int v5 = a1;
  uint64_t v6 = 0LL;
  int v1 = sysctl((int *)&v3, 4u, 0LL, 0LL, 0LL, 0LL);
  uint64_t result = 0LL;
  if (v1 < 0) {
    return *__error();
  }
  return result;
}

uint64_t trace_perf_filter()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = 0x2500010000LL;
  int v3 = 38;
  size_t v4 = 20LL;
  *(_OWORD *)int v5 = xmmword_186BA2810;
  uint64_t v6 = 0LL;
  int v0 = sysctl(v5, 3u, &v2, &v4, 0LL, 0LL);
  uint64_t result = 0LL;
  if (v0 < 0) {
    return *__error();
  }
  return result;
}

uint64_t trace_read(void *a1, size_t *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  __int128 v4 = xmmword_186BA2820;
  uint64_t v5 = 0LL;
  int v2 = sysctl((int *)&v4, 3u, a1, a2, 0LL, 0LL);
  uint64_t result = 0LL;
  if (v2 < 0) {
    return *__error();
  }
  return result;
}

uint64_t trace_set_nowrap()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  size_t v1 = 1LL;
  *(_OWORD *)int v2 = xmmword_186BA2830;
  uint64_t v3 = 0LL;
  return sysctl(v2, 4u, 0LL, &v1, 0LL, 0LL) >> 31;
}

uint64_t trace_get_bufinfo(void *a1, size_t a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v5 = 5;
  size_t v3 = a2;
  *(void *)uint64_t v4 = 0x1800000001LL;
  return sysctl(v4, 3u, a1, &v3, 0LL, 0LL);
}

uint64_t trace_read_threadmap(void *a1, size_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  size_t v4 = a2;
  *(_OWORD *)int v5 = xmmword_186BA2840;
  uint64_t v6 = 0LL;
  int v2 = sysctl(v5, 3u, a1, &v4, 0LL, 0LL);
  return v2 & (v2 >> 31);
}

uint64_t trace_block(unint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  size_t v4 = a1 / 0xF4240;
  *(_OWORD *)int v5 = xmmword_186BA2850;
  uint64_t v6 = 0LL;
  LODWORD(result) = sysctl(v5, 3u, 0LL, &v4, 0LL, 0LL);
  if ((_DWORD)result || !v4)
  {
    if (v4) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = (_DWORD)result == 0;
    }
    if (v2) {
      return 35LL;
    }
    else {
      return result;
    }
  }

  else
  {
    if (v4 == 1) {
      return 0LL;
    }
    size_t v3 = (os_log_s *)kperf_log();
    uint64_t result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      trace_block_cold_1((uint64_t *)&v4, v3);
      return 0LL;
    }
  }

  return result;
}

uint64_t trace_config_default(int a1)
{
  uint64_t v2 = trace_clear();
  if ((_DWORD)v2)
  {
    uint64_t v4 = v2;
    uint64_t v6 = "trace_clear";
LABEL_8:
    perror(v6);
    return v4;
  }

  uint64_t v3 = trace_bufinit(a1);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    uint64_t v6 = "trace_bufinit";
    goto LABEL_8;
  }

  uint64_t v4 = trace_rnginit();
  if ((_DWORD)v4)
  {
    uint64_t v6 = "trace_rnginit";
    goto LABEL_8;
  }

  return v4;
}

uint64_t trace_start()
{
  uint64_t v0 = trace_perf_filter();
  if (!(_DWORD)v0) {
    return trace_enable(1);
  }
  uint64_t v2 = v0;
  perror("trace_perf_filter");
  return v2;
}

uint64_t trace_stop()
{
  return trace_enable(0);
}

uint64_t trace_set_typefilter(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  size_t v3 = 0x2000LL;
  *(_OWORD *)uint64_t v4 = xmmword_186BA2860;
  uint64_t v5 = 0LL;
  int v1 = sysctl(v4, 3u, a1, &v3, 0LL, 0LL);
  return v1 & (v1 >> 31);
}

_DWORD *kperf_buffer_create_live()
{
  uint64_t v0 = calloc(1uLL, 0xCF8uLL);
  int v1 = v0;
  if (v0)
  {
    _DWORD *v0 = 1;
    uint64_t v2 = malloc(0x100000uLL);
    *((void *)v1 + 3) = v2;
    if (v2)
    {
      *((void *)v1 + 4) = 0x100000LL;
      *((void *)v1 + 9) = v1;
      *((void *)v1 + 11) = 0LL;
      *((void *)v1 + 413) = 0LL;
      *((void *)v1 + 23) = 0LL;
      *((void *)v1 + 24) = 0LL;
      v1[828] = -1;
    }

    else
    {
      free(v1);
      return 0LL;
    }
  }

  return v1;
}

void *kperf_buffer_create_chunked()
{
  uint64_t result = calloc(1uLL, 0xCF8uLL);
  if (result)
  {
    *(_DWORD *)uint64_t result = 0;
    result[9] = result;
    result[11] = 0LL;
    result[413] = 0LL;
    *((_DWORD *)result + 828) = -1;
  }

  return result;
}

uint64_t kperf_buffer_wait(_DWORD *a1, unint64_t a2)
{
  if (*a1 == 1) {
    return trace_block(a2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t kperf_buffer_readdata(uint64_t a1)
{
  return kperf_buffer_readdata_withmore(a1, 0LL);
}

uint64_t kperf_buffer_readdata_withmore(uint64_t a1, _BYTE *a2)
{
  if (a2) {
    *a2 = 0;
  }
  if (*(_DWORD *)a1 != 1) {
    return 0xFFFFFFFFLL;
  }
  if (!*(_BYTE *)(a1 + 176) && !*(void *)(a1 + 96))
  {
    int is_64bit = kperf_kern_is_64bit();
    if (is_64bit) {
      int v11 = 2;
    }
    else {
      int v11 = 1;
    }
    *(_DWORD *)(a1 + 4) = v11;
    int32x2_t v12 = vdup_n_s32(is_64bit == 0);
    v13.i64[0] = v12.u32[0];
    v13.i64[1] = v12.u32[1];
    *(int8x16_t *)(a1 + 8) = vbslq_s8( (int8x16_t)vcltzq_s64(vshlq_n_s64(v13, 0x3FuLL)),  (int8x16_t)xmmword_186BA28B0,  (int8x16_t)xmmword_186BA28A0);
    int v16 = v34;
    size_t v17 = *(void *)(a1 + 16) * v34;
    unint64_t v18 = ((v17 + 288) & 0xFFF) != 0 ? (v17 + 4384) & 0xFFFFFFFFFFFFF000LL : v17 + 288;
    if (v18 > *(void *)(a1 + 32)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v19 = *(void *)(a1 + 24);
    *(_DWORD *)uint64_t v19 = 1437204992;
    *(_DWORD *)(v19 + 4) = v16;
    *(void *)(v19 + 8) = 0LL;
    *(_DWORD *)(v19 + 16) = 0;
    *(void *)(v19 + 24) = kperf_tick_frequency(v14, v15);
    if (is_64bit) {
      *(_DWORD *)(v19 + 20) |= 1u;
    }
    *(void *)(a1 + 96) = v19 + 288;
    *(void *)(a1 + 104) = v17 + v19 + 288;
    *(void *)(a1 + 40) = v18;
    *(void *)(a1 + 48) = v18;
  }

  uint64_t v4 = (void *)(a1 + 24);
  unint64_t v5 = *(void *)(a1 + 32);
  size_t v6 = *(void *)(a1 + 48);
  size_t v7 = v5 - v6;
  if (*(void *)(a1 + 3288))
  {
    if (*(void *)(a1 + 8) * (*(_DWORD *)(a1 + 3296) / 4 + 3) > v7) {
      return 0xFFFFFFFFLL;
    }
    size_t v8 = inject_kd(a1, (void *)(a1 + 24));
    int v9 = *(_DWORD *)(a1 + 4);
    if (v9 == 1) {
      *((_DWORD *)v8 + 7) = 620756993;
    }
    else {
      *((_DWORD *)v8 + 12) = 620756993;
    }
    if ((*(_DWORD *)(a1 + 3296) & 0x80000000) == 0)
    {
      uint64_t v20 = -1LL;
      int v21 = v9;
      int v22 = v9;
      while (1)
      {
        int v23 = ((_BYTE)v20 + 1) & 3;
        if ((((_BYTE)v20 + 1) & 3) == 0) {
          break;
        }
        uint64_t v24 = *(void *)(*(void *)(a1 + 3288) + 8 * v20);
        switch(v23)
        {
          case 1:
            if (v21 != 1)
            {
              v8[2] = v24;
              int v22 = v21;
              break;
            }

            *((_DWORD *)v8 + 3) = v24;
            goto LABEL_44;
          case 2:
            if (v22 == 1) {
              *((_DWORD *)v8 + 4) = v24;
            }
            else {
              v8[3] = v24;
            }
            break;
          case 3:
            if (v9 != 1)
            {
              v8[4] = v24;
              goto LABEL_47;
            }

            *((_DWORD *)v8 + 5) = v24;
            goto LABEL_43;
        }

LABEL_50:
      }

      size_t v8 = inject_kd(a1, (void *)(a1 + 24));
      int v9 = *(_DWORD *)(a1 + 4);
      if (v9 == 1) {
        *((_DWORD *)v8 + 7) = 630784000;
      }
      else {
        *((_DWORD *)v8 + 12) = 630784000;
      }
      if (v20 == -1) {
        uint64_t v25 = *(int *)(a1 + 3296);
      }
      else {
        uint64_t v25 = *(void *)(*(void *)(a1 + 3288) + 8 * v20);
      }
      if (v9 != 1)
      {
        v8[1] = v25;
LABEL_47:
        int v21 = v9;
        int v22 = v9;
        goto LABEL_50;
      }

      *((_DWORD *)v8 + 2) = v25;
LABEL_43:
      int v21 = 1;
LABEL_44:
      int v22 = 1;
      goto LABEL_50;
    }

LABEL_51:
    uint64_t v26 = inject_kd(a1, (void *)(a1 + 24));
    if (*(_DWORD *)(a1 + 4) == 1) {
      *((_DWORD *)v26 + 7) = 620756994;
    }
    else {
      *((_DWORD *)v26 + 12) = 620756994;
    }
    *(_DWORD *)(a1 + 3296) = 0;
    free(*(void **)(a1 + 3288));
    *(void *)(a1 + 3288) = 0LL;
    unint64_t v5 = *(void *)(a1 + 32);
    size_t v6 = *(void *)(a1 + 48);
    size_t v7 = v5 - v6;
  }

  if (v7 >> 16) {
    goto LABEL_61;
  }
  if (!*v4)
  {
    uint64_t v28 = malloc(0x100000uLL);
    *uint64_t v4 = v28;
    if (v28)
    {
      size_t v6 = 0LL;
      *(void *)(a1 + 40) = 0LL;
      *(void *)(a1 + 48) = 0LL;
      size_t v7 = 0x100000LL;
      *(void *)(a1 + 32) = 0x100000LL;
      goto LABEL_61;
    }

    return 0xFFFFFFFFLL;
  }

  size_t v6 = 0LL;
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  size_t v7 = v5;
  if (v5 < 0x10000) {
    return 1LL;
  }
LABEL_61:
  LODWORD(v27) = 0;
  do
  {
    size_t v33 = v7;
    uint64_t v29 = trace_read((void *)(*v4 + v6), &v33);
    if ((_DWORD)v29) {
      return v29;
    }
    size_t v30 = v33 * *(void *)(a1 + 8);
    size_t v33 = v30;
    uint64_t v27 = (v27 + v30);
    size_t v6 = *(void *)(a1 + 48) + v30;
    *(void *)(a1 + 48) = v6;
    *(void *)(a1 + 56) = v6;
    v7 -= v30;
  }

  while (v30 >= 0x401 && v7 != 0);
  if (a2 && *(void *)(a1 + 32) - v6 <= 0x3FF) {
    *a2 = 1;
  }
  return v27;
}

uint64_t kperf_buffer_set_config(uint64_t a1, int a2, const void *a3)
{
  if (*(_DWORD *)a1 != 1) {
    return 0xFFFFFFFFLL;
  }
  size_t v6 = 8LL * a2;
  size_t v7 = malloc(v6);
  if (!v7) {
    return 4294967294LL;
  }
  size_t v8 = v7;
  memcpy(v7, a3, v6);
  uint64_t result = 0LL;
  *(void *)(a1 + 3288) = v8;
  *(_DWORD *)(a1 + 3296) = a2;
  return result;
}

uint64_t kperf_buffer_getbuf(uint64_t a1, void *a2, void *a3)
{
  if (*(_DWORD *)a1 != 1) {
    return 0xFFFFFFFFLL;
  }
  size_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    dbglog_log(a1, *(void **)(a1 + 24), v6);
    uint64_t result = 0LL;
    *a2 = *(void *)(a1 + 24);
    *a3 = *(void *)(a1 + 56);
    *(void *)(a1 + 88) = 0LL;
    *(void *)(a1 + 96) = 0LL;
    *(void *)(a1 + 104) = 0LL;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(void *)(a1 + 56) = 0LL;
    *(_BYTE *)(a1 + 176) = 1;
  }

  else
  {
    uint64_t result = 0LL;
    *a2 = 0LL;
    *a3 = 0LL;
  }

  return result;
}

ssize_t dbglog_log(uint64_t a1, void *__buf, size_t __nbyte)
{
  size_t v6 = *(const char **)(a1 + 3304);
  if (v6)
  {
    if ((*(_DWORD *)(a1 + 3312) & 0x80000000) != 0)
    {
      int v7 = open(v6, 1537, 384LL);
      *(_DWORD *)(a1 + 3312) = v7;
      if (v7 < 0)
      {
        free(*(void **)(a1 + 3304));
        *(void *)(a1 + 3304) = 0LL;
      }
    }
  }

  ssize_t result = *(unsigned int *)(a1 + 3312);
  if ((result & 0x80000000) == 0) {
    return write(result, __buf, __nbyte);
  }
  return result;
}

uint64_t kperf_buffer_returnbuf(void *a1)
{
  return 0LL;
}

char *kperf_buffer_set_debug_log(char *result, char *__s1)
{
  if (!*((void *)result + 413))
  {
    uint64_t v2 = result;
    ssize_t result = strdup(__s1);
    *((void *)v2 + 413) = result;
  }

  return result;
}

void kperf_buffer_free(void *a1)
{
  if (*(_DWORD *)a1 == 1)
  {
    uint64_t v2 = (void *)a1[3];
    if (v2) {
      free(v2);
    }
  }

  int v3 = *((_DWORD *)a1 + 828);
  if (v3) {
    close(v3);
  }
  free(a1);
}

uint64_t kperf_buffer_setchunk(uint64_t a1, void *a2, size_t a3)
{
  if (*(_DWORD *)a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)(a1 + 24)) {
    return 4294967294LL;
  }
  dbglog_log(a1, a2, a3);
  uint64_t result = 0LL;
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 88) = a2;
  return result;
}

double kperf_buffer_clearchunk(uint64_t a1)
{
  if (!*(_DWORD *)a1)
  {
    if (*(void *)(a1 + 24))
    {
      *(void *)(a1 + 88) = 0LL;
      *(void *)(a1 + 96) = 0LL;
      *(void *)(a1 + 104) = 0LL;
      double result = 0.0;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_BYTE *)(a1 + 176) = 1;
    }
  }

  return result;
}

unint64_t *_kperf_buffer_next_kevent(uint64_t a1)
{
  if (*(_DWORD *)a1 == 1)
  {
    *(_DWORD *)(a1 + 64) = 1;
    if (!*(_BYTE *)(a1 + 176))
    {
      size_t v6 = *(unsigned int **)(a1 + 96);
      unint64_t v7 = *(void *)(a1 + 104);
      if ((unint64_t)v6 < v7)
      {
        uint64_t v3 = *(unsigned int *)(a1 + 4);
        do
        {
          uint64_t v8 = (_DWORD)v3 == 1 ? 4LL : 8LL;
          size_t v6 = (unsigned int *)((char *)v6 + *(void *)(a1 + 16));
          *(void *)(a1 + 96) = v6;
        }

        while (v7 > (unint64_t)v6);
      }

      *(_BYTE *)(a1 + 176) = 1;
    }

    int v9 = (uint64_t *)(a1 + 88);
    uint64_t v10 = *(void *)(a1 + 88);
    int v11 = *(void **)(a1 + 80);
    if (v10)
    {
      uint64_t v12 = *(void *)(a1 + 8);
      if ((unint64_t)(v10 - *v11 + v12) < v11[3])
      {
        *(void *)(a1 + 88) = v12 + v10;
        return kd32_promote(a1, (unint64_t *)(v12 + v10));
      }

      uint64_t v14 = 0LL;
      uint64_t *v9 = 0LL;
      *(void *)(a1 + 96) = 0LL;
      *(void *)(a1 + 104) = 0LL;
      *(_BYTE *)(a1 + 176) = 1;
      *(void *)(a1 + 40) = 0LL;
      *(void *)(a1 + 48) = 0LL;
      return (unint64_t *)v14;
    }

    if (!v11)
    {
      int v11 = (void *)(a1 + 24);
      *(void *)(a1 + 80) = a1 + 24;
    }

    if (v11[3])
    {
      uint64_t v14 = *v11 + v11[2];
      uint64_t *v9 = v14;
      return (unint64_t *)v14;
    }

    return 0LL;
  }

  if (*(_DWORD *)a1) {
    return 0LL;
  }
  uint64_t v2 = *(_DWORD **)(a1 + 24);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = *(unsigned int *)(a1 + 4);
  if (!(_DWORD)v3)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0x120)
    {
      if (*v2 == 1437204992)
      {
        int v15 = v2[5];
        uint64_t v3 = 1LL;
        if ((v15 & 1) != 0) {
          int v16 = 2;
        }
        else {
          int v16 = 1;
        }
        *(_DWORD *)(a1 + 4) = v16;
        uint64_t v5 = 72LL;
        if ((v15 & 1) == 0)
        {
          uint64_t v17 = 28LL;
          uint64_t v18 = 32LL;
LABEL_33:
          *(void *)(a1 + 8) = v18;
          *(void *)(a1 + 16) = v17;
          int v19 = v2[1];
          unint64_t v20 = (v5 * 4 + (int)v17 * (uint64_t)v19 + 4095) & 0xFFFFFFFFFFFFF000LL;
          *(_DWORD *)(a1 + 64) = 1;
          unint64_t v21 = v20 | v18;
          int v22 = (char *)v2 + v20;
          if (v4 >= v21) {
            int v23 = v22;
          }
          else {
            int v23 = 0LL;
          }
          *(void *)(a1 + 80) = a1 + 24;
          *(void *)(a1 + 88) = v23;
          uint64_t v24 = &v2[v5];
          *(void *)(a1 + 96) = v24;
          *(void *)(a1 + 104) = (char *)v24 + (int)v17 * (uint64_t)v19;
          goto LABEL_37;
        }

LABEL_32:
        uint64_t v3 = 2LL;
        uint64_t v17 = 32LL;
        uint64_t v18 = 64LL;
        goto LABEL_33;
      }

      if (*v2 == 1437204737)
      {
        *(_DWORD *)(a1 + 4) = 2;
        uint64_t v5 = 6LL;
        goto LABEL_32;
      }
    }

    uint64_t v3 = 0LL;
  }

LABEL_37:
  if (!*(_DWORD *)(a1 + 64)) {
    return 0LL;
  }
  if (!*(_BYTE *)(a1 + 176))
  {
    size_t v6 = *(unsigned int **)(a1 + 96);
    if (v6)
    {
      unint64_t v25 = *(void *)(a1 + 104);
      if ((unint64_t)v6 < v25)
      {
        while (1)
        {
          uint64_t v26 = (_DWORD)v3 == 1 ? 4LL : 8LL;
          size_t v6 = (unsigned int *)((char *)v6 + *(void *)(a1 + 16));
          *(void *)(a1 + 96) = v6;
        }

LABEL_53:
        uint64_t v14 = a1 + 112;
        tdmap2kd(v3, a1 + 112, v6);
        *(void *)(a1 + 96) += *(void *)(a1 + 16);
        return (unint64_t *)v14;
      }

LABEL_46:
      *(_BYTE *)(a1 + 176) = 1;
    }
  }

  uint64_t v27 = *(unint64_t **)(a1 + 88);
  if (!v27) {
    return 0LL;
  }
  double result = kd32_promote(a1, v27);
  unint64_t v28 = *(void *)(a1 + 8) + *(void *)(a1 + 88);
  if (**(void **)(a1 + 80) + *(void *)(*(void *)(a1 + 80) + 24LL) <= v28) {
    unint64_t v28 = 0LL;
  }
  *(void *)(a1 + 88) = v28;
  return result;
}

uint64_t kperf_buffer_get_stats(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    if (*(_DWORD *)(a1 + 64)) {
      return *(int *)(a1 + 204);
    }
    return -1LL;
  }

  if (a2 || !*(_DWORD *)(a1 + 64)) {
    return -1LL;
  }
  uint64_t v2 = *(void *)(a1 + 184);
  if (v2) {
    return *(void *)(v2 + 2536);
  }
  else {
    return *(void *)(a1 + 8) * *(int *)(a1 + 200);
  }
}

uint64_t kperf_buffer_set_debug(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    return -1LL;
  }
  uint64_t result = *(unsigned __int8 *)(a1 + 3300);
  *(_BYTE *)(a1 + 3300) = a3 != 0;
  return result;
}

uint64_t *inject_kd(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = a2[3];
  unint64_t v4 = (uint64_t *)(*a2 + v3);
  size_t v5 = *(void *)(a1 + 8);
  a2[3] = v5 + v3;
  bzero(v4, v5);
  LODWORD(v2) = *(_DWORD *)(v2 + 4);
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFLL;
  if ((_DWORD)v2 != 1) {
    uint64_t v7 = v6;
  }
  *unint64_t v4 = v7;
  return v4;
}

unint64_t *kd32_promote(uint64_t a1, unint64_t *a2)
{
  if (*(_DWORD *)(a1 + 4) != 2)
  {
    unint64_t v2 = *a2;
    *(void *)(a1 + 112) = *a2 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v3 = a1 + 112;
    uint64_t v4 = a2[1];
    uint64_t v5 = a2[2];
    *(void *)&__int128 v6 = v4;
    *((void *)&v6 + 1) = HIDWORD(v4);
    *(_OWORD *)(v3 + 8) = v6;
    *(void *)&__int128 v6 = v5;
    *((void *)&v6 + 1) = HIDWORD(v5);
    *(_OWORD *)(v3 + 24) = v6;
    int v7 = *((_DWORD *)a2 + 7);
    *(void *)(v3 + 40) = *((unsigned int *)a2 + 6);
    *(_DWORD *)(v3 + 48) = v7;
    *(_DWORD *)(v3 + 52) = HIBYTE(v2);
    return (unint64_t *)v3;
  }

  return a2;
}

uint64_t tdmap2kd(uint64_t result, uint64_t a2, unsigned int *a3)
{
  *(void *)a2 = 0LL;
  *(void *)(a2 + 48) = 117506056LL;
  uint64_t v3 = (_OWORD *)(a2 + 8);
  if ((_DWORD)result == 1)
  {
    __int128 v4 = *(_OWORD *)(a3 + 2);
    *(_DWORD *)(a2 + 24) = a3[6];
    *uint64_t v3 = v4;
    uint64_t v5 = *a3;
  }

  else
  {
    __int128 v6 = *(_OWORD *)(a3 + 3);
    *(_DWORD *)(a2 + 24) = a3[7];
    *uint64_t v3 = v6;
    uint64_t v5 = *(void *)a3;
  }

  *(void *)(a2 + 40) = v5;
  return result;
}

uint64_t kperf_logging_start()
{
  uint64_t result = trace_config_default(logging_nbufs);
  if (!(_DWORD)result)
  {
    if (!wrap) {
      trace_set_nowrap();
    }
    if (kdebug)
    {
      int v1 = has_typefilter;
      unint64_t v2 = (os_log_s *)kperf_log();
      BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);
      if (v1 == 1)
      {
        if (v3) {
          kperf_logging_start_cold_2(v2, v4, v5, v6, v7, v8, v9, v10);
        }
        trace_set_typefilter(&typefilter);
      }

      else if (v3)
      {
        kperf_logging_start_cold_3(v2, v4, v5, v6, v7, v8, v9, v10);
      }
    }

    else
    {
      int v11 = (os_log_s *)kperf_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        kperf_logging_start_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      trace_perf_filter();
    }

    return trace_enable(1);
  }

  return result;
}

uint64_t kperf_logging_stop()
{
  return trace_enable(0);
}

uint64_t kperf_logging_set_wrap(char a1)
{
  uint64_t v1 = wrap;
  wrap = a1;
  return v1;
}

uint64_t kperf_logging_set_kdebug(char a1)
{
  uint64_t v1 = kdebug;
  kdebug = a1;
  return v1;
}

void kperf_logging_set_typefilter(void *__src)
{
  if (__src)
  {
    memcpy(&typefilter, __src, 0x2000uLL);
    kperf_typefilter_enable_class((uint64_t)&typefilter, 0x25u);
  }

  else
  {
    bzero(&typefilter, 0x2000uLL);
  }

  has_typefilter = __src != 0LL;
}

uint64_t kperf_logging_query_size(uint64_t result)
{
  if ((_DWORD)result) {
    return result;
  }
  else {
    return 1000000LL;
  }
}

uint64_t kperf_logging_set_size(uint64_t result)
{
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 1000000LL;
  }
  logging_nbufs = result;
  return result;
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void kperf_typefilter_clear(void *a1)
{
}

int8x16_t kperf_typefilter_invert(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 0x2000; i += 16LL)
  {
    int8x16_t result = vmvnq_s8(*(int8x16_t *)(a1 + i));
    *(int8x16_t *)(a1 + i) = result;
  }

  return result;
}

double kperf_typefilter_disable_class(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = (_OWORD *)(a1 + 32LL * a2);
  double result = 0.0;
  *unint64_t v2 = 0u;
  v2[1] = 0u;
  return result;
}

__n128 kperf_typefilter_enable_class(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = (__n128 *)(a1 + 32LL * a2);
  result.n128_u64[0] = -1LL;
  result.n128_u64[1] = -1LL;
  *unint64_t v2 = result;
  v2[1] = result;
  return result;
}

uint64_t kperf_typefilter_enable_subclass(uint64_t result, unsigned int a2, unsigned int a3)
{
  unint64_t v3 = (a3 | ((unint64_t)a2 << 8)) >> 3;
  *(_BYTE *)(result + v3) |= 1 << (a3 & 7);
  return result;
}

uint64_t kperf_typefilter_disable_subclass(uint64_t result, unsigned int a2, unsigned int a3)
{
  unint64_t v3 = (a3 | ((unint64_t)a2 << 8)) >> 3;
  *(_BYTE *)(result + v3) &= ~(1 << (a3 & 7));
  return result;
}

uint64_t kperf_timer_period_set(unsigned int a1, uint64_t a2)
{
  v3[2] = *MEMORY[0x1895F89C0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.timer.period", 0LL, 0LL, v3, 0x10uLL);
}

uint64_t kperf_timer_period_get(unsigned int a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a1;
  uint64_t v6 = 0LL;
  size_t v4 = 16LL;
  uint64_t result = sysctlbyname("kperf.timer.period", &v5, &v4, &v5, 0x10uLL);
  if (!(_DWORD)result) {
    *a2 = v6;
  }
  return result;
}

uint64_t kperf_timer_action_set(unsigned int a1, unsigned int a2)
{
  v3[2] = *MEMORY[0x1895F89C0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.timer.action", 0LL, 0LL, v3, 0x10uLL);
}

uint64_t kperf_timer_action_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.timer.action", a1, a2);
}

uint64_t kperf_sysctl_get_uint32(const char *a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v6 = a2;
  uint64_t v7 = 0LL;
  size_t v5 = 16LL;
  uint64_t result = sysctlbyname(a1, &v6, &v5, &v6, 0x10uLL);
  if (!(_DWORD)result) {
    *a3 = v7;
  }
  return result;
}

uint64_t kperf_timer_count_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.timer.count", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_timer_count_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kperf.timer.count", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_timer_pet_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.timer.pet_timer", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_timer_pet_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kperf.timer.pet_timer", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_timer_lightweight_pet_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.lightweight_pet", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_timer_lightweight_pet_get(BOOL *a1)
{
  size_t v3 = 4LL;
  uint64_t result = sysctlbyname("kperf.lightweight_pet", &v4, &v3, 0LL, 0LL);
  if (!(_DWORD)result) {
    *a1 = v4 == 1;
  }
  return result;
}

uint64_t kperf_action_samplers_set(unsigned int a1, unsigned int a2)
{
  v3[2] = *MEMORY[0x1895F89C0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.samplers", 0LL, 0LL, v3, 0x10uLL);
}

uint64_t kperf_action_samplers_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.samplers", a1, a2);
}

uint64_t kperf_action_userdata_set(unsigned int a1, unsigned int a2)
{
  v3[2] = *MEMORY[0x1895F89C0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.userdata", 0LL, 0LL, v3, 0x10uLL);
}

uint64_t kperf_action_userdata_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.userdata", a1, a2);
}

uint64_t kperf_action_filter_set_by_task(unsigned int a1, unsigned int a2)
{
  v3[2] = *MEMORY[0x1895F89C0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.filter_by_task", 0LL, 0LL, v3, 0x10uLL);
}

uint64_t kperf_action_filter_set_by_pid(unsigned int a1, int a2)
{
  v3[2] = *MEMORY[0x1895F89C0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.filter_by_pid", 0LL, 0LL, v3, 0x10uLL);
}

uint64_t kperf_action_filter_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.filter_by_pid", a1, a2);
}

uint64_t kperf_action_ucallstack_depth_set(unsigned int a1, unsigned int a2)
{
  v3[2] = *MEMORY[0x1895F89C0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.ucallstack_depth", 0LL, 0LL, v3, 0x10uLL);
}

uint64_t kperf_action_kcallstack_depth_set(unsigned int a1, unsigned int a2)
{
  v3[2] = *MEMORY[0x1895F89C0];
  v3[0] = a1;
  v3[1] = a2;
  return sysctlbyname("kperf.action.kcallstack_depth", 0LL, 0LL, v3, 0x10uLL);
}

uint64_t kperf_action_ucallstack_depth_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.ucallstack_depth", a1, a2);
}

uint64_t kperf_action_kcallstack_depth_get(unsigned int a1, _DWORD *a2)
{
  return kperf_sysctl_get_uint32("kperf.action.kcallstack_depth", a1, a2);
}

uint64_t kperf_action_count_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.action.count", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_action_count_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kperf.action.count", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_sample_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kperf.sampling", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_sample_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.sampling", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_sample_on()
{
  int v1 = 1;
  return sysctlbyname("kperf.sampling", 0LL, 0LL, &v1, 4uLL);
}

uint64_t kperf_sample_off()
{
  int v1 = 0;
  return sysctlbyname("kperf.sampling", 0LL, 0LL, &v1, 4uLL);
}

uint64_t kperf_bless_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.blessed_pid", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_bless_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kperf.blessed_pid", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_bless_allow_preemption(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.blessed_preempt", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_kdbg_cswitch_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.kdbg_cswitch", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_kdbg_cswitch_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kperf.kdbg_cswitch", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_kern_is_64bit()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  *(_OWORD *)int v4 = xmmword_186BA28C8;
  size_t v1 = 648LL;
  if (sysctl(v4, 4u, v2, &v1, 0LL, 0LL) == -1) {
    return 0LL;
  }
  else {
    return (v3 >> 2) & 1;
  }
}

uint64_t kperf_reset()
{
  int v1 = 1;
  return sysctlbyname("kperf.reset", 0LL, 0LL, &v1, 4uLL);
}

uint64_t kperf_lazy_wait_time_threshold_set(uint64_t a1)
{
  uint64_t v2 = a1;
  return sysctlbyname("kperf.lazy.wait_time_threshold", 0LL, 0LL, &v2, 8uLL);
}

uint64_t kperf_lazy_wait_time_threshold_get(void *a1)
{
  size_t v2 = 8LL;
  return sysctlbyname("kperf.lazy.wait_time_threshold", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_lazy_wait_action_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.lazy.wait_action", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_lazy_wait_action_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kperf.lazy.wait_action", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_lazy_cpu_time_threshold_set(uint64_t a1)
{
  uint64_t v2 = a1;
  return sysctlbyname("kperf.lazy.cpu_time_threshold", 0LL, 0LL, &v2, 8uLL);
}

uint64_t kperf_lazy_cpu_time_threshold_get(void *a1)
{
  size_t v2 = 8LL;
  return sysctlbyname("kperf.lazy.cpu_time_threshold", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_lazy_cpu_action_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.lazy.cpu_action", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_lazy_cpu_action_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kperf.lazy.cpu_action", a1, &v2, 0LL, 0LL);
}

uint64_t kperf_signpost_action_set(int a1)
{
  int v2 = a1;
  return sysctlbyname("kperf.signpost_action", 0LL, 0LL, &v2, 4uLL);
}

uint64_t kperf_signpost_action_get(void *a1)
{
  size_t v2 = 4LL;
  return sysctlbyname("kperf.signpost_action", a1, &v2, 0LL, 0LL);
}

void kperf_buffer_free_record(void *a1)
{
  size_t v2 = (void *)a1[311];
  if (v2) {
    free(v2);
  }
  free(a1);
}

uint64_t kperf_buffer_next_record(uint64_t a1, void *a2)
{
  while ((record_ready(a1) & 1) == 0)
  {
    kevent = _kperf_buffer_next_kevent(a1);
    if (!kevent) {
      break;
    }
    int v4 = kevent;
    uint64_t v5 = *(int *)(a1 + 200) + 1LL;
    *(_DWORD *)(a1 + 200) = v5;
    if (*kevent)
    {
      if (*((_DWORD *)kevent + 12) != 630784000)
      {
        uint64_t v6 = a1 + 8LL * *((int *)kevent + 13);
        unint64_t v7 = *(void *)(v6 + 2256) + 1LL;
        *(void *)(v6 + 2256) = v7;
        if (v7 > *(void *)(a1 + 3280)) {
          *(void *)(a1 + 3280) = v7;
        }
      }
    }

    uint64_t v8 = (int32x2_t *)malloc(0x9F0uLL);
    if (!v8) {
      return 2LL;
    }
    uint64_t v9 = v8;
    v8[313].i32[0] = 0;
    v8[3].i32[0] = 0;
    v8[1] = 0LL;
    v8[2] = 0LL;
    *uint64_t v8 = 0LL;
    v8[316] = (int32x2_t)0xFFFFFFFF00000000LL;
    v8[311] = 0LL;
    v8[271].i32[0] = 0;
    int32x2_t v10 = (int32x2_t)*v4;
    v8[1] = (int32x2_t)*v4;
    v8[317] = (int32x2_t)(*(void *)(a1 + 8) * v5);
    if (*(_BYTE *)(a1 + 3300))
    {
      *uint64_t v8 = (int32x2_t)23LL;
      unint64_t v11 = *((unsigned int *)v4 + 13);
      v8[6].i32[0] = *((_DWORD *)v4 + 12);
      v8[7] = (int32x2_t)v4[1];
      v8[8] = (int32x2_t)v4[2];
      v8[9] = (int32x2_t)v4[3];
      v8[10] = (int32x2_t)v4[4];
      v8[2] = (int32x2_t)v4[5];
      v8[3].i32[0] = v11;
      uint64_t v12 = 23LL;
    }

    else
    {
      uint64_t v12 = 0LL;
      unint64_t v11 = *((unsigned int *)v4 + 13);
    }

    if (v11 > 0x7F) {
      goto LABEL_12;
    }
    int v14 = *((_DWORD *)v4 + 12);
    if (v14 == 117571592)
    {
      v12 |= 0x10003uLL;
      v8[3].i32[0] = v11;
      *uint64_t v8 = (int32x2_t)v12;
      v8[1] = v10;
      uint64_t v15 = a1 + 8 * v11 + 72;
      uint64_t v18 = *(void *)(v15 + 136);
      uint64_t v16 = (void *)(v15 + 136);
      uint64_t v17 = v18;
      v8[312] = (int32x2_t)v16[128];
      v8[313].i32[0] = 1;
      v16[128] = v10;
      uint64_t v13 = 0LL;
      if (!v18) {
        goto LABEL_17;
      }
      *(void *)uint64_t v17 = 0x8000000000000000LL;
      *(_DWORD *)(v17 + 2504) = 1;
      void *v16 = 0LL;
      uint64_t v12 = (uint64_t)*v8;
      goto LABEL_16;
    }

    unint64_t v20 = (int32x2_t **)(a1 + 8 * v11 + 208);
    unint64_t v21 = *v20;
    *(int32x2_t *)(a1 + 8 * v11 + 1232) = v10;
    if (v14 == 620756993)
    {
      if (!v21)
      {
        uint64_t v13 = 0LL;
        *unint64_t v20 = v8;
        v12 |= 0x2007uLL;
        *uint64_t v8 = (int32x2_t)v12;
        v8[3].i32[0] = v11;
        v8[307] = vmovn_s64(*((int64x2_t *)v4 + 1));
        v8[2] = (int32x2_t)v4[5];
LABEL_17:
        if (*(void *)(a1 + 3280) <= 0x7FFuLL) {
          int32x2_t *v9 = (int32x2_t)(v12 | 0x20000);
        }
        ++*(_DWORD *)(a1 + 204);
        v9[314] = 0LL;
        uint64_t v19 = *(void *)(a1 + 192);
        if (v19) {
          *(void *)(v19 + 2512) = v9;
        }
        *(void *)(a1 + 192) = v9;
        if (!*(void *)(a1 + 184)) {
          *(void *)(a1 + 184) = v9;
        }
        goto LABEL_87;
      }

LABEL_12:
      uint64_t v13 = 2LL;
LABEL_16:
      if (v12) {
        goto LABEL_17;
      }
      goto LABEL_86;
    }

    uint64_t v13 = 0LL;
    if (v21)
    {
      if (v14 <= 620888083)
      {
        if (v14 <= 620822531)
        {
          if (v14 == 620756994)
          {
            uint64_t v13 = 0LL;
            v21[313].i32[0] = 1;
            *unint64_t v20 = 0LL;
          }
        }

        else
        {
          switch(v14)
          {
            case 620822532:
              uint64_t v13 = 0LL;
              *(void *)v21 |= 0x20uLL;
              unint64_t v33 = v4[1];
              v21[2] = (int32x2_t)v4[2];
              unint64_t v34 = v4[4];
              v21[12] = (int32x2_t)v4[3];
              v21[11].i32[0] = v33;
              v21[11].i32[1] = v34;
              break;
            case 620888076:
              if ((v21->i8[0] & 0x40) != 0)
              {
                uint64_t v13 = 0LL;
                uint64_t v35 = v21[315].i32[0];
                v21[v35 + 143] = (int32x2_t)v4[1];
                v21[(int)v35 + 144] = (int32x2_t)v4[2];
                v21[(int)v35 + 145] = (int32x2_t)v4[3];
                v21[(int)v35 + 146] = (int32x2_t)v4[4];
                v21[315].i32[0] = v35 + 4;
                break;
              }

              goto LABEL_78;
            case 620888080:
              uint64_t v13 = 0LL;
              uint64_t v25 = v21[315].i32[1];
              v21[v25 + 14] = (int32x2_t)v4[1];
              v21[(int)v25 + 15] = (int32x2_t)v4[2];
              v21[(int)v25 + 16] = (int32x2_t)v4[3];
              v21[(int)v25 + 17] = (int32x2_t)v4[4];
              v21[315].i32[1] = v25 + 4;
              break;
          }
        }
      }

      else
      {
        if (v14 > 621150223)
        {
          if (v14 == 621150224)
          {
            uint64_t v13 = 0LL;
            *(void *)v21 |= 0x800uLL;
            unsigned int v36 = (float *)&v21[304];
            v46.val[1] = (float32x2_t)vmovn_s64(*(int64x2_t *)(v4 + 3));
            v46.val[0] = (float32x2_t)vmovn_s64(*(int64x2_t *)(v4 + 1));
            vst2_f32(v36, v46);
            v21[271].i32[0] = 0;
            goto LABEL_84;
          }

          if (v14 != 621150232)
          {
            if (v14 != 630784000) {
              goto LABEL_84;
            }
            uint64_t v26 = (void *)v21[311];
            if (v26)
            {
              LODWORD(v27) = v21[310].i32[0];
              int v28 = v21[316].i32[1];
LABEL_51:
              int v29 = 0;
              while (v28 < (int)v27)
              {
                if (v29 | v28)
                {
                  size_t v30 = v4 + 1;
                  switch(v29)
                  {
                    case 0:
                      goto LABEL_58;
                    case 1:
                      size_t v30 = v4 + 2;
                      goto LABEL_58;
                    case 2:
                      size_t v30 = v4 + 3;
                      goto LABEL_58;
                    case 3:
                      size_t v30 = v4 + 4;
LABEL_58:
                      size_t v30 = (void *)*v30;
                      break;
                    default:
                      break;
                  }

                  v26[v28++] = v30;
                  v21[316].i32[1] = v28;
                }

                uint64_t v13 = 0LL;
                if (++v29 == 4) {
                  goto LABEL_84;
                }
              }
            }

            else if (v21[316].i32[1] == -1)
            {
              unint64_t v27 = v4[1];
              v21[310].i32[0] = v27;
              uint64_t v26 = malloc(8LL * (int)v27);
              v21[311] = (int32x2_t)v26;
              v21[316].i32[1] = 0;
              if (v26)
              {
                int v28 = 0;
                *(void *)v21 |= 0x8000uLL;
                goto LABEL_51;
              }
            }

LABEL_78:
            uint64_t v13 = 0LL;
            goto LABEL_84;
          }

          uint64_t v13 = 0LL;
          *(void *)v21 |= 0x400uLL;
          unint64_t v37 = v4[1];
          uint64_t v38 = *((unsigned int *)v4 + 4);
          uint64_t v39 = v21[316].i32[0];
          v21[(int)v39 + 273] = (int32x2_t)(*((unsigned int *)v4 + 8) | (v4[3] << 32));
          v21[v39 + 272] = (int32x2_t)(v38 | (v37 << 32));
          unsigned int v23 = v39 + 2;
          v21[316].i32[0] = v39 + 2;
        }

        else
        {
          if (v14 == 620888084)
          {
            unint64_t v31 = v4[2];
            if (v31 - 1001 >= 0xFFFFFFFFFFFFFC18LL)
            {
              uint64_t v13 = 0LL;
              *(void *)v21 |= 0x40uLL;
              v21[142].i32[0] = v4[1];
              v21[142].i32[1] = v31;
              v21[315].i32[0] = 0;
              goto LABEL_84;
            }

            goto LABEL_78;
          }

          if (v14 == 620888088)
          {
            unint64_t v32 = v4[2];
            if (v32 - 1001 >= 0xFFFFFFFFFFFFFC18LL)
            {
              uint64_t v13 = 0LL;
              *(void *)v21 |= 0x80uLL;
              v21[13].i32[0] = v4[1];
              v21[13].i32[1] = v32;
              v21[315].i32[1] = 0;
              goto LABEL_84;
            }

            goto LABEL_78;
          }

          if (v14 != 621150220) {
            goto LABEL_84;
          }
          *(void *)v21 |= 0x400uLL;
          if (v21[304].i32[1])
          {
            uint64_t v22 = v21[316].i32[0];
            v21[v22 + 272] = (int32x2_t)v4[1];
            v21[(int)v22 + 273] = (int32x2_t)v4[2];
            v21[(int)v22 + 274] = (int32x2_t)v4[3];
            v21[(int)v22 + 275] = (int32x2_t)v4[4];
            unsigned int v23 = v22 + 4;
          }

          else
          {
            uint64_t v40 = v21[316].i32[0];
            unint64_t v41 = v4[1];
            if ((_DWORD)v40)
            {
              uint64_t v42 = &v21[v40];
              v42[272] = (int32x2_t)v41;
              v42[273] = (int32x2_t)v4[2];
              v42[274] = (int32x2_t)v4[3];
              v42[275] = (int32x2_t)v4[4];
              unsigned int v23 = v40 + 4;
            }

            else
            {
              v21[271].i32[0] = v41;
              v21[272] = (int32x2_t)v4[2];
              v21[273] = (int32x2_t)v4[3];
              v21[274] = (int32x2_t)v4[4];
              unsigned int v23 = 3;
            }
          }

          v21[316].i32[0] = v23;
          uint64_t v13 = 0LL;
        }

        if (v23 >= v21[305].i32[0]) {
          unsigned int v23 = v21[305].u32[0];
        }
        v21[271].i32[0] = v23;
      }
    }

    else
    {
      if (v14 <= 620953608)
      {
        if (v14 == 117506056)
        {
          *uint64_t v8 = (int32x2_t)(v12 | 8);
          v8[2] = (int32x2_t)v4[5];
          v8[3].i32[0] = v11;
          strncpy((char *)&v8[3] + 4, (const char *)v4 + 8, 0x14uLL);
          v9[5].i8[7] = 0;
        }

        else
        {
          if (v14 != 620822548) {
            goto LABEL_84;
          }
          *uint64_t v8 = (int32x2_t)(v12 | 0x4000);
          unint64_t v24 = v4[2];
          v8[308] = (int32x2_t)v4[1];
          v8[309].i32[0] = v24;
        }

        goto LABEL_65;
      }

      if (v14 == 620953609 || v14 == 621150209)
      {
        *uint64_t v8 = (int32x2_t)(v12 | 0x100);
        v8[3].i32[0] = v11;
LABEL_65:
        uint64_t v13 = 0LL;
        v9[313].i32[0] = 1;
      }
    }

LABEL_84:
    uint64_t v12 = (uint64_t)*v9;
    if (*v9)
    {
      v9[313].i32[0] = 1;
      goto LABEL_17;
    }

LABEL_86:
    kperf_buffer_free_record(v9);
LABEL_87:
    if ((_DWORD)v13 == 2) {
      return v13;
    }
  }

  uint64_t v43 = *(void *)(a1 + 184);
  *a2 = v43;
  --*(_DWORD *)(a1 + 204);
  *(void *)(a1 + 184) = *(void *)(v43 + 2512);
  if (*(void *)(a1 + 192) == v43) {
    *(void *)(a1 + 192) = 0LL;
  }
  uint64_t v13 = 0LL;
  *(void *)(v43 + 2512) = 0LL;
  return v13;
}

uint64_t record_ready(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 64);
  if ((_DWORD)v1)
  {
    uint64_t v2 = *(void *)(a1 + 184);
    if (v2)
    {
      if (*(_DWORD *)(v2 + 2504)) {
        return 1LL;
      }
      if (*(int *)(a1 + 204) >= 10001)
      {
        *(void *)uint64_t v2 = 0x8000000000000000LL;
        uint64_t v1 = 1LL;
        *(_DWORD *)(v2 + 2504) = 1;
        *(void *)(a1 + 8LL * *(int *)(v2 + 24) + 208) = 0LL;
        return v1;
      }
    }

    return 0LL;
  }

  return v1;
}

unint64_t kperf_ns_to_ticks(uint64_t a1)
{
  unsigned int v2 = dword_18C4AEC1C;
  if (!dword_18C4AEC1C)
  {
    mach_timebase_info((mach_timebase_info_t)&timebase_info);
    unsigned int v2 = dword_18C4AEC1C;
  }

  return (unint64_t)v2 * a1 / timebase_info;
}

unint64_t kperf_ticks_to_ns(uint64_t a1)
{
  unsigned int v2 = dword_18C4AEC1C;
  if (!dword_18C4AEC1C)
  {
    mach_timebase_info((mach_timebase_info_t)&timebase_info);
    unsigned int v2 = dword_18C4AEC1C;
  }

  return (unint64_t)timebase_info * a1 / v2;
}

unint64_t kperf_tick_frequency(double a1, double a2)
{
  unsigned int v2 = dword_18C4AEC1C;
  if (!dword_18C4AEC1C)
  {
    mach_timebase_info((mach_timebase_info_t)&timebase_info);
    unsigned int v2 = dword_18C4AEC1C;
  }

  LODWORD(a2) = timebase_info;
  return (unint64_t)((double)v2 / (double)*(unint64_t *)&a2 * 1000000000.0);
}

uint64_t kperf_log()
{
  if (kperf_log_init_once != -1) {
    dispatch_once(&kperf_log_init_once, &__block_literal_global);
  }
  return kperf_log_log;
}

os_log_t __kperf_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libkperf", "log");
  kperf_log_log = (uint64_t)result;
  return result;
}

void kperf_kdebug_filter_add_internal_cold_1()
{
}

void kperf_kdebug_filter_add_desc_cold_3( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void kperf_kdebug_filter_add_desc_cold_4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void kperf_kdebug_filter_add_desc_cold_5( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void kperf_kdebug_filter_add_desc_cold_6(int a1, os_log_s *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v4 = *__error();
  v6[0] = 67109376;
  v6[1] = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  OUTLINED_FUNCTION_4(&dword_186B9D000, a2, v5, "cannot add filter 0x%08x to filter (%{errno}d)", (uint8_t *)v6);
}

void kperf_kdebug_filter_create_desc_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void kperf_kdebug_filter_create_desc_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void kperf_kdebug_filter_create_desc_cold_3(int a1, os_log_s *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int v4 = *__error();
  uint64_t v5 = __error();
  uint64_t v6 = strerror(*v5);
  v7[0] = 67109634;
  v7[1] = a1;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 2080;
  unint64_t v11 = v6;
  _os_log_error_impl( &dword_186B9D000,  a2,  OS_LOG_TYPE_ERROR,  "failed to write filter %u (%d: %s)",  (uint8_t *)v7,  0x18u);
}

void kperf_kdebug_filter_create_desc_cold_4(int a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = -1;
  OUTLINED_FUNCTION_4(&dword_186B9D000, a2, a3, "failed to get filter %u (%d)", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

void trace_block_cold_1(uint64_t *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a1;
  v3[0] = 67109376;
  v3[1] = 0;
  __int16 v4 = 2048;
  uint64_t v5 = v2;
  _os_log_error_impl( &dword_186B9D000,  a2,  OS_LOG_TYPE_ERROR,  "error: block returned unknown error (r = %d, delay = %zu)",  (uint8_t *)v3,  0x12u);
}

void kperf_logging_start_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void kperf_logging_start_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void kperf_logging_start_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void perror(const char *a1)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}