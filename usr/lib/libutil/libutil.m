uint64_t *ExtentManager::Init(ExtentManager *this, unsigned int a2, unsigned int a3, unint64_t a4)
{
  unint64_t v5;
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  if (a4 % a2) {
    v5 = a4 / a2 + 1;
  }
  else {
    v5 = a4 / a2;
  }
  *((void *)this + 2) = a4;
  *((void *)this + 3) = v5;
  ExtentManager::AddBlockRangeExtent((uint64_t *)this, 0LL, 0LL);
  return ExtentManager::AddBlockRangeExtent((uint64_t *)this, *((void *)this + 3), 0LL);
}

uint64_t *ExtentManager::AddBlockRangeExtent(uint64_t *this, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = this[3];
  if (v3 >= a2)
  {
    uint64_t v4 = a3 + a2;
    if (a3 + a2 >= 0)
    {
      v5 = this;
      if (a2 >= 0) {
        uint64_t v4 = a3;
      }
      uint64_t v6 = a2 & ~(a2 >> 63);
      if (v4 + v6 <= v3) {
        uint64_t v7 = v4;
      }
      else {
        uint64_t v7 = v3 - v6;
      }
      v8 = this + 4;
      v9 = (uint64_t *)this[5];
      if (v9 == this + 4)
      {
LABEL_13:
        v9 = this + 4;
      }

      else
      {
        uint64_t v10 = v7 + v6;
        while (1)
        {
          uint64_t v11 = v9[2];
          if (v10 < v11) {
            break;
          }
          uint64_t v12 = v9[3] + v11;
          if (v12 >= v6)
          {
            if (v11 >= v6) {
              uint64_t v11 = a2 & ~(a2 >> 63);
            }
            if (v10 <= v12) {
              uint64_t v10 = v12;
            }
            v9[2] = v11;
            v9[3] = v10 - v11;
            goto LABEL_20;
          }

          v9 = (uint64_t *)v9[1];
          if (v9 == v8) {
            goto LABEL_13;
          }
        }
      }

      v13 = (uint64_t *)operator new(0x20uLL);
      v13[2] = v6;
      v13[3] = v7;
      uint64_t v14 = *v9;
      *(void *)(v14 + 8) = v13;
      uint64_t *v13 = v14;
      uint64_t *v9 = (uint64_t)v13;
      v13[1] = (uint64_t)v9;
      ++v5[6];
      v9 = v13;
LABEL_20:
      this = (uint64_t *)v5[5];
      while (this != v8)
      {
        if (this == v9 || (uint64_t v15 = this[2], v16 = this[3] + v15, v17 = v9[2], v16 < v17))
        {
          this = (uint64_t *)this[1];
        }

        else
        {
          uint64_t v18 = v9[3] + v17;
          if (v18 < v15) {
            return this;
          }
          if (v17 < v15) {
            uint64_t v15 = v9[2];
          }
          if (v16 <= v18) {
            uint64_t v16 = v9[3] + v17;
          }
          v9[2] = v15;
          v9[3] = v16 - v15;
          uint64_t v19 = *this;
          v20 = (uint64_t *)this[1];
          *(void *)(v19 + 8) = v20;
          *(void *)this[1] = v19;
          --v5[6];
          operator delete(this);
          this = v20;
        }
      }
    }
  }

  return this;
}

uint64_t *ExtentManager::RemoveBlockRangeExtent(ExtentManager *this, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (char *)this + 32;
  result = (uint64_t *)*((void *)this + 5);
  if (result != (uint64_t *)v4)
  {
    uint64_t v7 = a3 + a2;
    while (1)
    {
      uint64_t v8 = result[2];
      uint64_t v9 = result[3] + v8;
      if (v9 < a2) {
        goto LABEL_11;
      }
      if (v7 < v8) {
        return result;
      }
      BOOL v10 = __OFSUB__(a2, v8);
      uint64_t v11 = a2 - v8;
      if ((v11 < 0) ^ v10 | (v11 == 0)) {
        break;
      }
      uint64_t v12 = v9 - v7;
      if (v9 <= v7) {
        goto LABEL_10;
      }
      result[3] = v11;
      v13 = (uint64_t *)result[1];
      uint64_t v14 = operator new(0x20uLL);
      v14[2] = v7;
      v14[3] = v12;
      uint64_t v15 = *v13;
      *(void *)(v15 + 8) = v14;
      *uint64_t v14 = v15;
      uint64_t *v13 = (uint64_t)v14;
      v14[1] = v13;
      ++*((void *)this + 6);
      result = (uint64_t *)v13[1];
LABEL_12:
    }

    uint64_t v11 = v9 - v7;
    if (v9 <= v7)
    {
      uint64_t v16 = *result;
      uint64_t v17 = (uint64_t *)result[1];
      *(void *)(v16 + 8) = v17;
      *(void *)result[1] = v16;
      --*((void *)this + 6);
      operator delete(result);
      result = v17;
      goto LABEL_12;
    }

    result[2] = v7;
LABEL_10:
    result[3] = v11;
LABEL_11:
    result = (uint64_t *)result[1];
    goto LABEL_12;
  }

  return result;
}

uint64_t *ExtentManager::AddByteRangeExtent(ExtentManager *this, unint64_t a2, uint64_t a3)
{
  return ExtentManager::AddBlockRangeExtent( (uint64_t *)this,  a2 / *(void *)this,  (a2 + a3 - 1) / *(void *)this - a2 / *(void *)this + 1);
}

uint64_t getmntoptstr(uint64_t a1, char *a2)
{
  uint64_t v3 = *(const char ***)(a1 + 8);
  uint64_t v4 = *v3;
  if (*v3)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = v3 + 3;
    while (strcasecmp(a2, v4))
    {
      uint64_t v4 = v7[v6];
      v6 += 3LL;
      if (!v4) {
        goto LABEL_5;
      }
    }

    return *(void *)(*(void *)(a1 + 24) + 0x5555555555555558LL * ((unint64_t)(v6 * 8) >> 3));
  }

  else
  {
LABEL_5:
    if (!getmnt_silent) {
      errx(1, "-o %s: option not supported", a2);
    }
    return 0LL;
  }
}

uint64_t getmntoptnum(uint64_t a1, char *a2)
{
  uint64_t v3 = getmntoptstr(a1, a2);
  if (!v3)
  {
    if (!getmnt_silent) {
      errx(1, "Missing %s argument", a2);
    }
    return -1LL;
  }

  uint64_t v4 = (const char *)v3;
  *__error() = 0;
  uint64_t v5 = strtol(v4, &__endptr, 0);
  int v6 = *__endptr;
  if (*__endptr) {
    uint64_t v7 = (void (*)(uint64_t, const char *, ...))MEMORY[0x1895FB140];
  }
  else {
    uint64_t v7 = 0LL;
  }
  BOOL v9 = *__error() != 34 || (unint64_t)(v5 + 0x7FFFFFFFFFFFFFFFLL) < 0xFFFFFFFFFFFFFFFELL;
  BOOL v10 = (void (*)(uint64_t, const char *, ...))MEMORY[0x1895FB138];
  if (v9) {
    BOOL v10 = v7;
  }
  if (!v9 || v6 != 0)
  {
    if (!getmnt_silent)
    {
      return v5;
    }

    return -1LL;
  }

  return v5;
}

void freemntopts(void **a1)
{
}

void *getmntopts(const char *a1, void *a2, int *a3, int *a4)
{
  __lasts = 0LL;
  if (*a2)
  {
    size_t v7 = 0LL;
    uint64_t v8 = a2 + 3;
    do
    {
      ++v7;
      uint64_t v9 = *v8;
      v8 += 3;
    }

    while (v9);
  }

  else
  {
    size_t v7 = 0LL;
  }

  BOOL v10 = malloc(0x20uLL);
  if (!v10) {
    return v10;
  }
  uint64_t v11 = strdup(a1);
  v10[2] = v11;
  if (!v11)
  {
LABEL_31:
    free(v10);
    return 0LL;
  }

  uint64_t v12 = v11;
  v13 = calloc(v7, 8uLL);
  v10[3] = v13;
  if (!v13)
  {
    free(v12);
    goto LABEL_31;
  }

  uint64_t v14 = v13;
  *BOOL v10 = a1;
  v10[1] = a2;
  uint64_t v15 = strtok_r(v12, ",", &__lasts);
  if (v15)
  {
    uint64_t v16 = v15;
    do
    {
      if (*v16 == 110)
      {
        int v17 = v16[1] == 111;
        v16 += 2 * (v16[1] == 111);
      }

      else
      {
        int v17 = 0;
      }

      uint64_t v18 = strchr(v16, 61);
      uint64_t v19 = v18;
      if (v18)
      {
        *uint64_t v18 = 0;
        uint64_t v19 = v18 + 1;
      }

      v20 = (const char *)*a2;
      if (*a2)
      {
        uint64_t v21 = 0LL;
        while (strcasecmp(v16, v20))
        {
          v20 = (const char *)a2[v21 + 3];
          v21 += 3LL;
          if (!v20) {
            goto LABEL_20;
          }
        }

        v14[0xAAAAAAAAAAAAAABLL * ((unint64_t)(v21 * 8) >> 3)] = v19;
        v22 = &a2[v21];
        v23 = a4;
        if (!LODWORD(a2[v21 + 2])) {
          v23 = a3;
        }
        int v25 = *((_DWORD *)v22 + 2);
        int v24 = *((_DWORD *)v22 + 3);
        if (v17 == v25) {
          int v26 = *v23 | v24;
        }
        else {
          int v26 = *v23 & ~v24;
        }
        int *v23 = v26;
      }

      else
      {
LABEL_20:
        if (!getmnt_silent) {
          errx(1, "-o %s: option not supported", v16);
        }
      }

      uint64_t v16 = strtok_r(0LL, ",", &__lasts);
    }

    while (v16);
  }

  return v10;
}

uint64_t humanize_number(char *a1, size_t a2, uint64_t a3, char *__s, unsigned int a5, int a6)
{
  char v6 = a6;
  if (a2) {
    *a1 = 0;
  }
  uint64_t v10 = 0xFFFFFFFFLL;
  if (!a1 || !__s || (a5 & 0x80000000) != 0 || a5 >= 7 && (a5 & 0xFFFFFFCF) != 0 || (~a6 & 0x18) == 0) {
    return v10;
  }
  if ((a6 & 0x10) != 0)
  {
    int v32 = 973;
    uint64_t v11 = 2LL;
    goto LABEL_13;
  }

  if ((a6 & 8) == 0)
  {
    int v32 = 973;
    uint64_t v11 = 1LL;
LABEL_13:
    uint64_t v33 = v11;
    unint64_t v12 = 1024LL;
    goto LABEL_15;
  }

  int v32 = 950;
  uint64_t v33 = 1LL;
  unint64_t v12 = 1000LL;
LABEL_15:
  if (a3 >= 0) {
    uint64_t v13 = a3;
  }
  else {
    uint64_t v13 = -a3;
  }
  if (a3 < 0) {
    int v14 = -1;
  }
  else {
    int v14 = 1;
  }
  int v31 = v14;
  if (a3 >= 0) {
    uint64_t v15 = 1LL;
  }
  else {
    uint64_t v15 = 2LL;
  }
  size_t v16 = strlen(__s);
  if ((v6 & 2) != 0) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v15 + 1;
  }
  size_t v18 = v17 + v33 + v16;
  if (v18 + 1 > a2) {
    return v10;
  }
  if ((a5 & 0x30) == 0)
  {
    if (a5)
    {
      int v23 = a5 - 1;
      if (a5 - 1 >= 5) {
        int v23 = 5;
      }
      LODWORD(v10) = v23 + 1;
      int v24 = v23 + 1;
      do
      {
        int v25 = v13;
        v13 /= v12;
        --v24;
      }

      while (v24);
      unint64_t v26 = (v25 - v13 * v12);
    }

    else
    {
      LODWORD(v10) = 0;
      unint64_t v26 = 0LL;
    }

    goto LABEL_54;
  }

  int v19 = a2 - v18;
  if (v19 < 1)
  {
    uint64_t v21 = 1LL;
  }

  else
  {
    unint64_t v20 = 1LL;
    do
    {
      uint64_t v21 = 10 * v20;
      --v19;
      BOOL v22 = v20 >= 0x147AE147AE147AFLL;
      v20 *= 10LL;
    }

    while (!v22);
  }

  uint64_t v10 = 0LL;
  unint64_t v26 = 0LL;
  while (1)
  {
    if (v13 < v21)
    {
      if (v13 != v21 - 1) {
        goto LABEL_53;
      }
    }

LABEL_50:
    unint64_t v26 = (v13 % v12);
    uint64_t v10 = (v10 + 1);
    v13 /= v12;
  }

  uint64_t v13 = v21 - 1;
LABEL_53:
  if ((a5 & 0x10) != 0) {
    return v10;
  }
LABEL_54:
  if (v13 == 9)
  {
    return snprintf(a1, a2, "%lld%s%s%s");
  }

  else
  {
    if (v13 > 8 || (_DWORD)v10 == 0) {
      return snprintf(a1, a2, "%lld%s%s%s");
    }
LABEL_66:
    if ((v6 & 1) == 0) {
      return snprintf(a1, a2, "%lld%s%s%s");
    }
    uint64_t v30 = v31 * (((10 * v26 + (v12 >> 1)) / v12 / 0xA) + v13);
    localeconv();
    return snprintf(a1, a2, "%d%s%d%s%s%s", v30);
  }

char *pidfile_open(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  char v6 = (char *)malloc(0x418uLL);
  if (v6)
  {
    if (a1)
    {
      __strlcpy_chk();
    }

    else
    {
      size_t v7 = getprogname();
      snprintf(v6 + 4, 0x401uLL, "/var/run/%s.pid", v7);
    }

    if (strlen(v6 + 4) == 1024)
    {
      free(v6);
      char v6 = 0LL;
      *__error() = 63;
    }

    else
    {
      int v8 = open(v6 + 4, 1573, a2);
      if (v8 == -1)
      {
        uint64_t v10 = __error();
        if (a3 && *v10 == 35)
        {
          int v11 = open(v6 + 4, 0);
          if (v11 == -1)
          {
            int v14 = *__error();
          }

          else
          {
            int v12 = v11;
            int v13 = read(v11, &v19, 0xFuLL);
            int v14 = *__error();
            close(v12);
            if (v13 != -1)
            {
              uint64_t v15 = (char *)&v19 + v13;
              *uint64_t v15 = 0;
              *a3 = strtol((const char *)&v19, &__endptr, 10);
              if (__endptr == v15) {
                int v14 = 0;
              }
              else {
                int v14 = 22;
              }
            }
          }

          *__error() = v14;
          if (!*__error()) {
            *__error() = 17;
          }
        }

        free(v6);
        return 0LL;
      }

      else
      {
        int v9 = v8;
        if (fstat(v8, &v19) == -1)
        {
          int v16 = *__error();
          unlink(v6 + 4);
          close(v9);
          free(v6);
          char v6 = 0LL;
          *__error() = v16;
        }

        else
        {
          *(_DWORD *)char v6 = v9;
          *((_DWORD *)v6 + 258) = v19.st_dev;
          *((void *)v6 + 130) = v19.st_ino;
        }
      }
    }
  }

  return v6;
}

uint64_t pidfile_write(int *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v2 = pidfile_verify((uint64_t)a1);
  *__error() = v2;
  if (!*__error())
  {
    int v3 = *a1;
    if (ftruncate(*a1, 0LL) != -1)
    {
      pid_t v4 = getpid();
      snprintf(__str, 0x10uLL, "%u", v4);
      size_t v5 = strlen(__str);
      ssize_t v6 = pwrite(v3, __str, v5, 0LL);
      if (v6 == strlen(__str)) {
        return 0LL;
      }
    }

    int v8 = *__error();
    _pidfile_remove((uint64_t)a1, 0);
    *__error() = v8;
  }

  return 0xFFFFFFFFLL;
}

uint64_t pidfile_verify(uint64_t a1)
{
  if (!a1) {
    return 22LL;
  }
  int v2 = *(_DWORD *)a1;
  if (v2 == -1) {
    return 22LL;
  }
  if (fstat(v2, &v4) == -1) {
    return *__error();
  }
  uint64_t result = 22LL;
  if (v4.st_dev == *(_DWORD *)(a1 + 1032))
  {
    if (v4.st_ino == *(void *)(a1 + 1040)) {
      return 0LL;
    }
    else {
      return 22LL;
    }
  }

  return result;
}

uint64_t _pidfile_remove(uint64_t a1, int a2)
{
  int v4 = pidfile_verify(a1);
  if (v4) {
    goto LABEL_16;
  }
  else {
    int v4 = 0;
  }
  if (flock(*(_DWORD *)a1, 8) == -1 && v4 == 0) {
    int v4 = *__error();
  }
  if (close(*(_DWORD *)a1) == -1 && !v4) {
    int v4 = *__error();
  }
  if (a2)
  {
    free((void *)a1);
    if (v4)
    {
LABEL_16:
      *__error() = v4;
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    *(_DWORD *)a1 = -1;
    if (v4) {
      goto LABEL_16;
    }
  }

  return 0LL;
}

uint64_t pidfile_close(_DWORD *a1)
{
  int v2 = pidfile_verify((uint64_t)a1);
  if (v2)
  {
    int v3 = v2;
LABEL_3:
    *__error() = v3;
    return 0xFFFFFFFFLL;
  }

  if (close(*a1) == -1)
  {
    int v3 = *__error();
    free(a1);
    if (v3) {
      goto LABEL_3;
    }
  }

  else
  {
    free(a1);
  }

  return 0LL;
}

uint64_t pidfile_remove(uint64_t a1)
{
  return _pidfile_remove(a1, 1);
}

uint64_t expand_number(const char *a1, uintmax_t *a2)
{
  int v4 = *__error();
  *__error() = 0;
  uintmax_t v5 = strtoumax(a1, &__endptr, 0);
  if (!*__error())
  {
    *__error() = v4;
    __darwin_ct_rune_t v6 = __tolower(*__endptr);
    char v7 = 60;
    switch(v6)
    {
      case 'b':
        goto LABEL_7;
      case 'c':
      case 'd':
      case 'f':
      case 'h':
      case 'i':
      case 'j':
      case 'l':
      case 'n':
      case 'o':
        goto LABEL_8;
      case 'e':
        goto LABEL_12;
      case 'g':
        char v7 = 30;
        goto LABEL_12;
      case 'k':
        char v7 = 10;
        goto LABEL_12;
      case 'm':
        char v7 = 20;
        goto LABEL_12;
      case 'p':
        char v7 = 50;
        goto LABEL_12;
      default:
        if (!v6)
        {
LABEL_7:
          uint64_t result = 0LL;
          *a2 = v5;
          return result;
        }

        if (v6 == 116)
        {
          char v7 = 40;
LABEL_12:
          if (v5 << v7 >> v7 == v5)
          {
            uint64_t result = 0LL;
            *a2 = v5 << v7;
            return result;
          }

          int v9 = __error();
          int v10 = 34;
        }

        else
        {
LABEL_8:
          int v9 = __error();
          int v10 = 22;
        }

        int *v9 = v10;
        break;
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t realhostname(char *a1, size_t a2, _DWORD *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 2LL;
  char v7 = gethostbyaddr(a3, 4u, 2);
  if (!v7) {
    goto LABEL_10;
  }
  p_h_name = (const char **)&v7->h_name;
  __strlcpy_chk();
  size_t v9 = strlen(__s);
  trimdomain((unint64_t)__s, v9);
  if (strlen(__s) > a2) {
    goto LABEL_10;
  }
  strncpy(__dst, *p_h_name, 0xFFuLL);
  __dst[255] = 0;
  int v10 = gethostbyname(__dst);
  if (!v10)
  {
    uint64_t v6 = 3LL;
    goto LABEL_10;
  }

  h_addr_list = v10->h_addr_list;
  int v12 = *h_addr_list;
  if (!*h_addr_list)
  {
LABEL_8:
    uint64_t v6 = 1LL;
LABEL_10:
    v15.s_addr = *a3;
    int v16 = inet_ntoa(v15);
    strncpy(a1, v16, a2);
    return v6;
  }

  int v13 = h_addr_list + 1;
  while (*(_DWORD *)v12 != *a3)
  {
    v10->h_addr_list = v13;
    int v14 = *v13++;
    int v12 = v14;
    if (!v14) {
      goto LABEL_8;
    }
  }

  strncpy(a1, __s, a2);
  return 0LL;
}

uint64_t realhostname_sa(char *a1, size_t a2, sockaddr *a3, socklen_t a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (getnameinfo(a3, a4, __src, 0x401u, 0LL, 0, 4))
  {
    uint64_t v8 = 2LL;
  }

  else
  {
    memset(&v16.ai_socktype, 0, 40);
    int sa_family = a3->sa_family;
    uint64_t v8 = 3LL;
    v16.ai_flags = 3;
    v16.ai_family = sa_family;
    v16.ai_socktype = 1;
    if (!getaddrinfo(__src, 0LL, &v16, &v15))
    {
      int v10 = v15;
      if (v15)
      {
        int v11 = v15;
        do
        {
          ai_addr = v11->ai_addr;
          if (!ai_addr) {
            break;
          }
          size_t sa_len = ai_addr->sa_len;
          if (__PAIR64__(ai_addr->sa_family, sa_len) == __PAIR64__(a3->sa_family, a4))
          {
            *(_WORD *)ai_addr->sa_data = *(_WORD *)a3->sa_data;
            if (!memcmp(ai_addr, a3, sa_len))
            {
              if (!v10->ai_canonname
                || (__strlcpy_chk(), trimdomain((unint64_t)__src, a2), strlen(__src) > a2) && a3->sa_family == 2)
              {
                freeaddrinfo(v10);
                uint64_t v8 = 0LL;
                goto LABEL_11;
              }

              strncpy(a1, __src, a2);
              freeaddrinfo(v10);
              return 0LL;
            }
          }

          int v11 = v11->ai_next;
          in_addr v15 = v11;
        }

        while (v11);
      }

      freeaddrinfo(v10);
      uint64_t v8 = 1LL;
    }
  }

LABEL_11:
  if (!getnameinfo(a3, a4, __src, 0x401u, 0LL, 0, 2)) {
    strncpy(a1, __src, a2);
  }
  return v8;
}

uint64_t reexec_to_match_kernel()
{
  if (getenv("REEXEC_TO_MATCH_KERNEL")) {
    return 0LL;
  }
  cpu_type_t v1 = current_kernel_arch();
  int v2 = _NSGetMachExecuteHeader();
  if (v1)
  {
    if (v1 == v2->cputype) {
      return 0LL;
    }
    return reexec(v1, "REEXEC_TO_MATCH_KERNEL");
  }

  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

uint64_t current_kernel_arch()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  mach_msg_type_number_t host_info_outCnt = 12;
  host_t v0 = MEMORY[0x186E24324]();
  if (host_info(v0, 1, host_info_out, &host_info_outCnt)) {
    return 0LL;
  }
  integer_t v2 = host_info_out[3];
  *(_OWORD *)uint64_t v8 = xmmword_183C49C30;
  size_t v3 = 648LL;
  if (sysctl(v8, 4u, v6, &v3, 0LL, 0LL) == -1) {
    return 0LL;
  }
  else {
    return (v7 << 22) & 0x1000000 | v2;
  }
}

uint64_t reexec(cpu_type_t a1, const char *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  cpu_type_t v18 = a1;
  size_t v16 = 0LL;
  size_t v3 = *_NSGetArgv();
  int v4 = _NSGetEnviron();
  uint64_t v5 = 0LL;
  uint64_t v6 = *v4;
  while (v6[v5++])
    ;
  uint64_t v8 = calloc((v5 + 1), 8uLL);
  uint64_t v9 = v8;
  int v10 = *v6;
  if (*v6)
  {
    uint64_t v11 = 0LL;
    do
    {
      v8[v11] = v10;
      int v10 = v6[++v11];
    }

    while (v10);
    uint64_t v12 = (v11 + 1);
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 1LL;
  }

  snprintf(__str, 0x20uLL, "%s=1", a2);
  v9[v11] = __str;
  v9[v12] = 0LL;
  uint32_t bufsize = 1025;
  if (_NSGetExecutablePath(buf, &bufsize)
    || posix_spawnattr_init(&v17)
    || posix_spawnattr_setflags(&v17, 64)
    || posix_spawnattr_setbinpref_np(&v17, 1uLL, &v18, &v16)
    || v16 != 1)
  {
    free(v9);
  }

  else
  {
    int v14 = posix_spawn(0LL, buf, 0LL, &v17, v3, (char *const *)v9);
    free(v9);
    if (!v14) {
      return 0LL;
    }
    *__error() = v14;
  }

  return 0xFFFFFFFFLL;
}

uint64_t reexec_to_match_lp64ness(int a1)
{
  if (getenv("REEXEC_TO_MATCH_LP64NESS")) {
    return 0LL;
  }
  cpu_type_t cputype = _NSGetMachExecuteHeader()->cputype;
  if (a1 == (cputype & 0x1000000u) >> 24) {
    return 0LL;
  }
  int v3 = current_kernel_arch();
  if (v3)
  {
    int v4 = v3;
    uint64_t result = 0LL;
    unsigned int v6 = v4 & 0xFEFFFFFF;
    if (a1) {
      int v7 = 0x1000000;
    }
    else {
      int v7 = 0;
    }
    cpu_type_t v8 = v6 | v7;
    if (v8 != cputype) {
      return reexec(v8, "REEXEC_TO_MATCH_LP64NESS");
    }
  }

  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

  return result;
}

unint64_t trimdomain(unint64_t __s, uint64_t a2)
{
  int v3 = (const void *)__s;
  if ((trimdomain_first & 1) == 0)
  {
    trimdomain_first = 1;
    if (gethostname(&trimdomain_domain, 0xFFuLL) || (int v4 = strchr(&trimdomain_domain, 46)) == 0LL)
    {
      trimdomain_domain = 0;
    }

    else
    {
      strlen(v4 + 1);
      __memmove_chk();
    }

    __s = strlen(&trimdomain_domain);
    trimdomain_dlen = __s;
  }

  if (trimdomain_domain)
  {
    uint64_t v5 = a2 + 1;
    __s = (unint64_t)memchr(v3, 46, a2 + 1);
    if (__s)
    {
      unsigned int v6 = (_BYTE *)__s;
      uint64_t v7 = trimdomain_dlen;
      __s = strncasecmp((const char *)(__s + 1), &trimdomain_domain, trimdomain_dlen);
      if (!(_DWORD)__s)
      {
        if (v6[v7 + 1] == 58)
        {
          cpu_type_t v8 = &v6[v7];
          uint64_t v9 = &v6[v7 + 2];
          __s = strspn(v9, "0123456789");
          if (__s)
          {
            if (!v9[__s] || v9[__s] == 46 && (int v10 = &v9[__s + 1], (__s = strspn(v10, "0123456789")) != 0) && !v10[__s])
            {
              __s = strlen(v8 + 1);
              if (__s < (_BYTE *)v3 + v5 - v6) {
                return (unint64_t)memmove(v6, v8 + 1, __s + 1);
              }
            }
          }
        }

        else if (!v6[v7 + 1])
        {
          *unsigned int v6 = 0;
        }
      }
    }
  }

  return __s;
}

uint64_t tzlink(const char *a1)
{
  if (!a1) {
    return 22LL;
  }
  mach_service = xpc_connection_create_mach_service("com.apple.tzlink", 0LL, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global);
  xpc_connection_resume(mach_service);
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v3, "tz", a1);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x186E244F8]() == MEMORY[0x1895F9250]) {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "error");
  }
  else {
    uint64_t uint64 = 5LL;
  }
  xpc_release(v4);
  xpc_release(v3);
  xpc_release(mach_service);
  return uint64;
}

uint64_t wipefs_alloc(int a1, uint64_t a2, void **a3)
{
  *(void *)&v25[1023] = *MEMORY[0x1895F89C0];
  off_t v23 = 0LL;
  unsigned int v22 = 0;
  memset(&v21, 0, sizeof(v21));
  *a3 = 0LL;
  fstat(a1, &v21);
  int v6 = v21.st_mode & 0xF000;
  if (v6 != 0x2000)
  {
    if (v6 == 0x8000)
    {
      uint64_t v12 = 0LL;
      unsigned int st_blksize = v21.st_blksize;
      unsigned int v22 = v21.st_blksize;
      off_t st_size = v21.st_size;
      off_t v23 = v21.st_size / v21.st_blksize;
      goto LABEL_23;
    }

    if (v6 != 24576)
    {
      uint64_t v13 = 0LL;
      *__error() = 22;
      return v13;
    }
  }

  if (ioctl(a1, 0x40046418uLL, &v22) < 0 || ioctl(a1, 0x40086419uLL, &v23) < 0)
  {
    uint64_t v13 = *__error();
    if (!(_DWORD)v13) {
      return v13;
    }
    goto LABEL_33;
  }

  off_t st_size = v23 * v22;
  if (fcntl(a1, 50, &__s) == -1) {
    goto LABEL_16;
  }
  cpu_type_t v8 = strrchr(&__s, 47);
  if (v8) {
    p_s = v8 + 1;
  }
  else {
    p_s = &__s;
  }
  int v10 = v8 + 2;
  if (!v8) {
    int v10 = v25;
  }
  uint64_t v11 = *p_s == 114 ? v10 : p_s;
  if (!strncmp(v11, "disk", 4uLL)) {
    uint64_t v12 = strdup(v11);
  }
  else {
LABEL_16:
  }
    uint64_t v12 = 0LL;
  unsigned int st_blksize = v22;
LABEL_23:
  if (a2) {
    uint64_t v15 = a2;
  }
  else {
    uint64_t v15 = st_blksize;
  }
  uint64_t v13 = 22LL;
  if (!v15 || !st_size)
  {
    if (v12) {
      free(v12);
    }
LABEL_33:
    wipefs_free(a3);
    return v13;
  }

  size_t v16 = operator new(0x48uLL);
  v16[1] = 0LL;
  posix_spawnattr_t v17 = (ExtentManager *)(v16 + 1);
  v16[3] = 0LL;
  cpu_type_t v18 = v16 + 3;
  v16[4] = 0LL;
  v16[5] = v16 + 5;
  v16[7] = 0LL;
  v16[8] = 0LL;
  v16[6] = v16 + 5;
  *a3 = v16;
  *(_DWORD *)size_t v16 = a1;
  ExtentManager::Init((ExtentManager *)(v16 + 1), v15, st_blksize, st_size);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 1), 0LL, 0x200000LL);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 1), v16[3] - 0x200000LL, 0x200000LL);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 1), 0LL, 1536LL);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 1), v16[3] - 1024LL, 1024LL);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 1), 0LL, 0x8000LL);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 1), 0LL, 0x8000LL);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 1), v16[3] - 0x8000LL, 0x8000LL);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 1), v16[3] / 2LL - 0x8000, 0x10000LL);
  uint64_t v19 = v16[4];
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 1), 0x8000uLL, 14336LL);
  ExtentManager::AddBlockRangeExtent(v16 + 1, 256LL, 1LL);
  ExtentManager::AddBlockRangeExtent(v16 + 1, 512LL, 1LL);
  ExtentManager::AddBlockRangeExtent(v16 + 1, v19 - 1, 1LL);
  ExtentManager::AddBlockRangeExtent(v16 + 1, v19 - 257, 1LL);
  if (v16[1] != 2048LL)
  {
    ExtentManager::AddByteRangeExtent(v17, 0x80000uLL, 2048LL);
    ExtentManager::AddByteRangeExtent(v17, 0x100000uLL, 2048LL);
    ExtentManager::AddByteRangeExtent(v17, *v18 - 2048LL, 2048LL);
    ExtentManager::AddByteRangeExtent(v17, *v18 - 0x80000LL, 2048LL);
  }

  ExtentManager::AddByteRangeExtent(v17, 0x2000uLL, 0x2000LL);
  ExtentManager::AddByteRangeExtent(v17, 0LL, 0x80000LL);
  ExtentManager::AddByteRangeExtent(v17, *v18 - 0x80000LL, 0x80000LL);
  ExtentManager::AddByteRangeExtent(v17, 0LL, 17408LL);
  ExtentManager::AddByteRangeExtent(v17, *v18 - 16896LL, 16896LL);
  ExtentManager::AddByteRangeExtent(v17, 0LL, 512LL);
  ExtentManager::AddByteRangeExtent(v17, *v18 - 512LL, 512LL);
  uint64_t v13 = 0LL;
  (*a3)[8] = v12;
  return v13;
}

void wipefs_free(void **a1)
{
  cpu_type_t v1 = *a1;
  if (*a1)
  {
    xpc_object_t v3 = (void *)v1[8];
    if (!v3 || (free(v3), (cpu_type_t v1 = *a1) != 0LL))
    {
      std::__list_imp<ExtentInfo>::clear(v1 + 5);
      operator delete(v1);
    }

    *a1 = 0LL;
  }

uint64_t wipefs_include_blocks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0LL;
}

void sub_183C4902C(void *a1)
{
}

uint64_t wipefs_except_blocks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0LL;
}

void sub_183C49058(void *a1)
{
}

uint64_t wipefs_wipe(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    int v26 = 0;
    uint64_t v33 = 0LL;
    strcpy(v34, "xartutil");
    strcpy((char *)v29, "--erase-disk");
    __argv = v34;
    int v31 = v29;
    uint64_t v32 = v2;
    if (posix_spawn_file_actions_init(&v27))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        wipefs_wipe_cold_7();
      }
    }

    else
    {
      posix_spawn_file_actions_addopen(&v27, 1, "/dev/null", 1, 0);
      posix_spawn_file_actions_addopen(&v27, 2, "/dev/null", 1, 0);
      if (posix_spawn(&v28, "/usr/sbin/xartutil", &v27, 0LL, &__argv, 0LL))
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          wipefs_wipe_cold_6();
        }
      }

      else
      {
        do
        {
          if (waitpid(v28, &v26, 0) != -1)
          {
            uint64_t v3 = v26;
            if ((v26 & 0x7F) == 0x7F)
            {
              BOOL v4 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
              if (v3 >> 8 == 19)
              {
                if (v4) {
                  wipefs_wipe_cold_4();
                }
              }

              else if (v4)
              {
                wipefs_wipe_cold_5(v3, v5, v6, v7, v8, v9, v10, v11);
              }
            }

            else if ((v26 & 0x7F) != 0)
            {
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                wipefs_wipe_cold_2();
              }
            }

            else if (BYTE1(v26) && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
            {
              wipefs_wipe_cold_3();
            }

            goto LABEL_24;
          }
        }

        while (*__error() == 4);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          wipefs_wipe_cold_1();
        }
      }

LABEL_24:
      posix_spawn_file_actions_destroy(&v27);
    }
  }

  uint64_t v12 = *(void **)(a1 + 24);
  __argv = 0LL;
  int v31 = v12;
  v29[0] = &__argv;
  v29[1] = 0x100000001LL;
  ioctl(*(_DWORD *)a1, 0x8010641FuLL, v29);
  if (*(void *)(a1 + 16) <= 0x20000uLL) {
    size_t v13 = 0x20000LL;
  }
  else {
    size_t v13 = *(void *)(a1 + 16);
  }
  int v14 = operator new[](v13);
  bzero(v14, v13);
  uint64_t v15 = *(void **)(a1 + 48);
  if (v15 == (void *)(a1 + 40))
  {
LABEL_46:
    uint64_t v24 = 0LL;
  }

  else
  {
    uint64_t v16 = *(void *)(a1 + 8);
    int64_t v17 = *(void *)(a1 + 24);
    while (1)
    {
      unint64_t v18 = v15[2] * v16;
      unint64_t v19 = v15[3] * v16;
      unint64_t v20 = *(void *)(a1 + 16);
      if (v18 % v20 || v19 % v20)
      {
        off_t v21 = v18 - v18 % v20;
        unint64_t v19 = v19 + v20 - 1 + v18 % v20 - (v19 + v18 + v20 - 1) % v20;
      }

      else
      {
        off_t v21 = v15[2] * v16;
      }

      unint64_t v22 = (uint64_t)(v21 + v19) <= v17 ? v19 : v17 - v21;
      if (v22) {
        break;
      }
LABEL_42:
      uint64_t v15 = (void *)v15[1];
      if (v15 == (void *)(a1 + 40)) {
        goto LABEL_46;
      }
    }

    while (1)
    {
      size_t v23 = v13 >= v22 ? v22 : v13;
      if (pwrite(*(_DWORD *)a1, v14, v23, v21) != v23) {
        break;
      }
      v21 += v23;
      v22 -= v23;
      if (!v22) {
        goto LABEL_42;
      }
    }

    uint64_t v24 = *__error();
  }

  ioctl(*(_DWORD *)a1, 0x20006416uLL);
  operator delete[](v14);
  return v24;
}

void *std::__list_imp<ExtentInfo>::clear(void *result)
{
  if (result[2])
  {
    cpu_type_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8LL);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0LL;
    if (result != v1)
    {
      do
      {
        BOOL v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }

      while (v4 != v1);
    }
  }

  return result;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void wipefs_wipe_cold_1()
{
}

void wipefs_wipe_cold_2()
{
}

void wipefs_wipe_cold_3()
{
  OUTLINED_FUNCTION_0( &dword_183C46000,  MEMORY[0x1895F8DA0],  v0,  "Warning, xartutil returned status %d",  v1,  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_1();
}

void wipefs_wipe_cold_4()
{
}

void wipefs_wipe_cold_5( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void wipefs_wipe_cold_6()
{
}

void wipefs_wipe_cold_7()
{
}

char ***_NSGetArgv(void)
{
  return (char ***)MEMORY[0x1895F87C0]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1895F87C8]();
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x1895F87D0](buf, bufsize);
}

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return (mach_header_64 *)MEMORY[0x1895F87D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete[](void *__p)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_189D3AEA0(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189D3AEA8(__sz);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_end_catch(void)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1895F8938]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
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

void errx(int a1, const char *a2, ...)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1895FB2F0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1895FB4E0](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

hostent *__cdecl gethostbyaddr(const void *a1, socklen_t a2, int a3)
{
  return (hostent *)MEMORY[0x1895FB580](a1, *(void *)&a2, *(void *)&a3);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x1895FB588](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1895FB590](a1, a2);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1895FB5D8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

kern_return_t host_info( host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1895FB780](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1895FB830](*(void *)&a1.s_addr);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1895FBA08]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int posix_spawn( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1895FC7E0](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return MEMORY[0x1895FC800](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC808](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC810](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x1895FC828](a1);
}

int posix_spawnattr_setbinpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  return MEMORY[0x1895FC838](a1, a2, a3, a4);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x1895FC840](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FCBA0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD140](__s, __charset);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1895FD178](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

uintmax_t strtoumax(const char *__nptr, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1D8](__nptr, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1895FD638](*(void *)&a1, a2, *(void *)&a3);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}