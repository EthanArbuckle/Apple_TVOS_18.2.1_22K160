uint64_t textcat_Init()
{
  return 0LL;
}

const char *textcat_Classify(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int v3 = langid_identify(a2, a3);
  if ((v3 & 0x80000000) == 0) {
    return *(const char **)(_env + 8LL * v3 + 8);
  }
  if (v3 == -1) {
    return "--";
  }
  return 0LL;
}

const char *langid_languagecode(uint64_t *a1, int a2)
{
  v2 = &_env;
  if (a1) {
    v2 = a1;
  }
  unsigned int v3 = (_DWORD *)*v2;
  if (*v3 <= a2) {
    return 0LL;
  }
  if ((a2 & 0x80000000) == 0) {
    return *(const char **)&v3[2 * a2 + 2];
  }
  if (a2 == -1) {
    return "--";
  }
  return 0LL;
}

uint64_t langid_identify(uint64_t a1, unint64_t a2)
{
  v4 = _langid_create_with_datapath_internal(0LL, 0LL);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  v5 = v4;
  if (a2 >= 0x190) {
    uint64_t v6 = 400LL;
  }
  else {
    uint64_t v6 = a2;
  }
  v7 = langid_consume_string(v4, a1, a2, v6);
  uint64_t v8 = *(unsigned int *)*v5;
  if ((int)v8 < 1)
  {
    uint64_t v11 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v9 = 0LL;
    unsigned int v10 = 0;
    LODWORD(v11) = -1;
    do
    {
      unsigned int v12 = *((_DWORD *)v7 + v9);
      if (v12 <= v10) {
        uint64_t v11 = v11;
      }
      else {
        uint64_t v11 = v9;
      }
      if (v12 > v10) {
        unsigned int v10 = *((_DWORD *)v7 + v9);
      }
      ++v9;
    }

    while (v8 != v9);
  }

  _langid_dispose_internal(v5, 0LL);
  return v11;
}

uint64_t *langid_consume_string(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (a4 && a3)
  {
    uint64_t v4 = *a1;
    uint64_t v5 = *(void *)(*a1 + 312);
    unint64_t v6 = *(void *)(v5 + 24);
    uint64_t v7 = 2 * a3;
    do
    {
      if (2 * a3 && v6 >= 2)
      {
        uint64_t v8 = 0LL;
        unint64_t v9 = 0LL;
        uint64_t v10 = *(void *)(v5 + 8);
        LODWORD(v11) = *(_DWORD *)(v10 + 12);
        LODWORD(v12) = 1;
        do
        {
          int v13 = v12;
          uint64_t v12 = v11 + *(unsigned __int8 *)(a2 + v8) + 1;
          if (*(_DWORD *)(v10 + 8 * v12) != v13) {
            break;
          }
          uint64_t v11 = *(unsigned int *)(v10 + 8 * v12 + 4);
          if (*(_DWORD *)(v10 + 8 * v11) == (_DWORD)v12)
          {
            int v14 = *(_DWORD *)(v10 + 8 * v11 + 4);
            if (v14 <= 0)
            {
              v22[v9++] = -v14;
              if (v9 > 7) {
                goto LABEL_13;
              }
            }
          }

          ++v8;
        }

        while (v7 != v8);
        if (!v9) {
          goto LABEL_18;
        }
LABEL_13:
        uint64_t v15 = 0LL;
        uint64_t v16 = *(void *)(v4 + 296);
        int v17 = *(_DWORD *)v4;
        v18 = v22;
        do
        {
          if (v17 >= 1)
          {
            uint64_t v19 = 0LL;
            uint64_t v20 = v16 + *v18;
            do
            {
              *((_DWORD *)a1 + v19 + 2) += *(unsigned __int8 *)(v20 + v19);
              int v17 = *(_DWORD *)v4;
              ++v19;
            }

            while ((int)v19 < *(_DWORD *)v4);
          }

          ++v18;
          ++v15;
        }

        while (v15 != v9);
      }

LABEL_18:
      if (!--a4) {
        break;
      }
      a2 += 2LL;
      v7 -= 2LL;
      --a3;
    }

    while (a3);
  }

  return a1 + 1;
}

void *langid_create()
{
  return _langid_create_with_datapath_internal(0LL, 0LL);
}

uint64_t langid_highest_score(uint64_t *a1, uint64_t a2)
{
  v2 = &_env;
  if (a1) {
    v2 = a1;
  }
  uint64_t v3 = *(unsigned int *)*v2;
  uint64_t v4 = 0LL;
  unsigned int v5 = 0;
  LODWORD(result) = -1;
  do
  {
    unsigned int v7 = *(_DWORD *)(a2 + 4 * v4);
    if (v7 <= v5) {
      uint64_t result = result;
    }
    else {
      uint64_t result = v4;
    }
    if (v7 > v5) {
      unsigned int v5 = *(_DWORD *)(a2 + 4 * v4);
    }
    ++v4;
  }

  while (v3 != v4);
  return result;
}

uint64_t langid_dispose(void *a1)
{
  return _langid_dispose_internal(a1, 0LL);
}

uint64_t langid_identify_bufsize()
{
  return 152LL;
}

uint64_t langid_identify_withbuf(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = _langid_create_with_datapath_internal(0LL, a3);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v7 = v6;
  if (a2 >= 0x190) {
    uint64_t v8 = 400LL;
  }
  else {
    uint64_t v8 = a2;
  }
  unint64_t v9 = langid_consume_string(v6, a1, a2, v8);
  uint64_t v10 = *(unsigned int *)*v7;
  if ((int)v10 < 1)
  {
    uint64_t v13 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v11 = 0LL;
    unsigned int v12 = 0;
    LODWORD(v13) = -1;
    do
    {
      unsigned int v14 = *((_DWORD *)v9 + v11);
      if (v14 <= v12) {
        uint64_t v13 = v13;
      }
      else {
        uint64_t v13 = v11;
      }
      if (v14 > v12) {
        unsigned int v12 = *((_DWORD *)v9 + v11);
      }
      ++v11;
    }

    while (v10 != v11);
  }

  _langid_dispose_internal(v7, a3);
  return v13;
}

void *_langid_create_with_datapath_internal(const char *a1, uint64_t a2)
{
  if (a2)
  {
    *(void *)(a2 + 144) = 0LL;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 128) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    uint64_t v4 = (void *)a2;
    *(_OWORD *)a2 = 0u;
  }

  else
  {
    uint64_t v4 = calloc(0x98uLL, 1uLL);
    if (!v4) {
      return v4;
    }
  }

  pthread_mutex_lock(&_env_mutex);
  if (a1)
  {
    unsigned int v5 = _langid_env_create(a1);
  }

  else
  {
    unsigned int v5 = (int **)_env;
    if (_env) {
      goto LABEL_11;
    }
    unsigned int v7 = getenv("APPLE_FRAMEWORKS_ROOT");
    if (v7 && (uint64_t v8 = 0LL, asprintf(&v8, "%s/%s", v7, "/usr/share/langid/langid.inv"), v8))
    {
      _env = (uint64_t)_langid_env_create(v8);
      free(v8);
      unsigned int v5 = (int **)_env;
    }

    else
    {
      unsigned int v5 = _langid_env_create("/usr/share/langid/langid.inv");
      _env = (uint64_t)v5;
    }
  }

  if (v5)
  {
LABEL_11:
    v5[43] = (int *)((char *)v5[43] + 1);
    pthread_mutex_unlock(&_env_mutex);
    void *v4 = v5;
    return v4;
  }

  pthread_mutex_unlock(&_env_mutex);
  if (!a2) {
    free(v4);
  }
  return 0LL;
}

uint64_t _langid_dispose_internal(void *a1, uint64_t a2)
{
  v2 = *(void **)a1;
  if (!*(void *)(*(void *)a1 + 344LL)) {
    _langid_dispose_internal_cold_1();
  }
  if (!a2) {
    free(a1);
  }
  pthread_mutex_lock(&_env_mutex);
  uint64_t v3 = v2[43] - 1LL;
  v2[43] = v3;
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == (void *)_env;
  }
  if (!v4)
  {
    _langid_env_dispose(v2);
    if (v2 == (void *)_env) {
      _env = 0LL;
    }
  }

  return pthread_mutex_unlock(&_env_mutex);
}

double langid_reset(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  return result;
}

uint64_t langid_numlanguages(uint64_t *a1)
{
  v1 = &_env;
  if (a1) {
    v1 = a1;
  }
  return *(unsigned int *)*v1;
}

void *langid_create_with_datapath(const char *a1)
{
  return _langid_create_with_datapath_internal(a1, 0LL);
}

uint64_t langid_global_dispose()
{
  if (_env)
  {
    _langid_env_dispose((void *)_env);
    _env = 0LL;
  }

  return pthread_mutex_unlock(&_env_mutex);
}

void _langid_env_dispose(void *a1)
{
  if (!a1) {
    _langid_env_dispose_cold_1();
  }
  uint64_t v2 = a1[39];
  if (v2)
  {
    if (*(_DWORD *)(v2 + 80) && *(void *)v2) {
      free(*(void **)v2);
    }
    free((void *)v2);
  }

  uint64_t v3 = (void *)a1[37];
  if (v3 && *((_WORD *)a1 + 176)) {
    munmap(v3, a1[38]);
  }
  free(a1);
}

int **_langid_env_create(const char *a1)
{
  uint64_t v2 = (int **)calloc(0x168uLL, 1uLL);
  if (!v2) {
    _langid_env_create_cold_1();
  }
  uint64_t v3 = v2;
  if (stat(a1, &v25)) {
    _langid_env_create_cold_6();
  }
  int v4 = open(a1, 0);
  if (v4 < 0)
  {
    uint64_t v19 = (FILE *)*MEMORY[0x1895F89D0];
    int v20 = *__error();
    v21 = __error();
    v22 = strerror(*v21);
    fprintf(v19, "LanguageIdentifier cannot open file: [%s], errno: %d error: [%s]\n", a1, v20, v22);
LABEL_19:
    free(v3);
    return 0LL;
  }

  int v5 = v4;
  size_t st_size = v25.st_size;
  *((_WORD *)v3 + 176) = 0;
  unsigned int v7 = mmap(0LL, st_size, 1, 1, v4, 0LL);
  *((_WORD *)v3 + 176) = 1;
  if (v7 == (_DWORD *)-1LL) {
    _langid_env_create_cold_2();
  }
  uint64_t v8 = v7;
  madvise(v7, st_size, 1);
  close(v5);
  off_t v9 = v25.st_size;
  v3[37] = v8;
  v3[38] = (int *)v9;
  if (!v8) {
    goto LABEL_19;
  }
  if (v8[1] != 1) {
    _langid_env_create_cold_5();
  }
  uint64_t v10 = (_DWORD *)((char *)v8 + v8[4]);
  v3[40] = v10;
  uint64_t v11 = (int *)v8[5];
  v3[41] = v11;
  *((_DWORD *)v3 + 84) = 1234;
  uint64_t v12 = v8[8];
  *(_DWORD *)uint64_t v3 = v12;
  uint64_t v13 = (unsigned __int8 *)(v8 + 9);
  v3[1] = v8 + 9;
  if ((int)v12 >= 2)
  {
    for (uint64_t i = 1LL; i != v12; ++i)
    {
      while (*v13++)
        ;
      v3[i + 1] = (int *)v13;
    }

    uint64_t v10 = v3[40];
  }

  uint64_t v16 = malloc(0x58uLL);
  if (!v16) {
    _langid_env_create_cold_4((uint64_t)v3);
  }
  v16[4] = 0LL;
  v16[5] = 0LL;
  *uint64_t v16 = v10;
  *((_DWORD *)v16 + 20) = 0;
  if (v11 >= 0x10 && v10)
  {
    int v17 = *v10;
    v16[1] = v10 + 4;
    if (v17 == 1953655141) {
      int v18 = v10[3];
    }
    else {
      int v18 = 0;
    }
    *((_DWORD *)v16 + 4) = v18;
    unint64_t v23 = (unint64_t)(v11 - 4) >> 3;
  }

  else
  {
    unint64_t v23 = 0LL;
    v16[1] = 0LL;
    *((_DWORD *)v16 + 4) = 0;
  }

  v16[3] = v23;
  v3[39] = (int *)v16;
  return v3;
}

void _langid_dispose_internal_cold_1()
{
}

void _langid_env_dispose_cold_1()
{
}

void _langid_env_create_cold_1()
{
}

void _langid_env_create_cold_2()
{
  __assert_rtn("_open_and_mmap_for_reading", "LanguageIdentifier.c", 657, "addr != MAP_FAILED");
}

void _langid_env_create_cold_3()
{
  __assert_rtn("_langid_env_create", "LanguageIdentifier.c", 478, "env->numLanguages<=kMaxVectorWidth");
}

void _langid_env_create_cold_4(uint64_t a1)
{
  *(void *)(a1 + 312) = 0LL;
  __assert_rtn("_langid_env_create", "LanguageIdentifier.c", 491, "env->trie");
}

void _langid_env_create_cold_5()
{
  __assert_rtn("_langid_env_create", "LanguageIdentifier.c", 463, "H(fileVersion)==1");
}

void _langid_env_create_cold_6()
{
  __assert_rtn("_open_and_mmap_for_reading", "LanguageIdentifier.c", 630, "stat(path, &stat_data) == 0");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FBC80](a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}