uint64_t __bsd_iconv_open(const char *a1, uint64_t a2)
{
  return __bsd___iconv_open(a1, a2, 0LL);
}

uint64_t __bsd___iconv_open(const char *a1, uint64_t a2, uint64_t *a3)
{
  v12 = a3;
  int v4 = *__error();
  int v5 = _citrus_iconv_open((void **)&v12);
  if (v5)
  {
    if (v5 == 2) {
      int v6 = 22;
    }
    else {
      int v6 = v5;
    }
    *__error() = v6;
    return -1LL;
  }

  else
  {
    *__error() = v4;
    BOOL v8 = strcasestr(a1, "//IGNORE") != 0LL;
    uint64_t v9 = *v12;
    *(_BYTE *)(v9 + 72) = v8;
    *(_BYTE *)(v9 + 88) = 1;
    BOOL v10 = strcasestr(a1, "//TRANSLIT") != 0LL;
    uint64_t result = (uint64_t)v12;
    uint64_t v11 = *v12;
    *(_BYTE *)(v11 + 73) = v10;
    *(void *)(v11 + 80) = 0LL;
  }

  return result;
}

uint64_t __bsd_iconv_open_into(const char *a1, uint64_t a2, uint64_t *a3)
{
  if (__bsd___iconv_open(a1, a2, a3) == -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

uint64_t __bsd_iconv_close(uint64_t *a1)
{
  if ((unint64_t)a1 + 1 > 1)
  {
    _citrus_iconv_close(a1);
    return 0LL;
  }

  else
  {
    *__error() = 9;
    return 0xFFFFFFFFLL;
  }
}

uint64_t __bsd_iconv(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 1)
  {
    int v1 = (*(uint64_t (**)(void))(**(void **)a1 + 32LL))();
    if (!v1) {
      return v3;
    }
    *__error() = v1;
  }

  else
  {
    *__error() = 9;
  }

  return -1LL;
}

uint64_t __bsd___iconv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if ((unint64_t)(a1 + 1) > 1)
  {
    int v8 = (*(uint64_t (**)(void))(**(void **)a1 + 32LL))();
    if (a7) {
      *a7 = v10;
    }
    if (!v8) {
      return v10;
    }
    *__error() = v8;
  }

  else
  {
    *__error() = 9;
  }

  return -1LL;
}

uint64_t __bsd___iconv_get_list(void *a1, uint64_t *a2, char a3)
{
  uint64_t result = _citrus_esdb_get_list(a1, a2, a3);
  if ((_DWORD)result)
  {
    *__error() = result;
    return 0xFFFFFFFFLL;
  }

  return result;
}

void __bsd_iconvlist(void (*a1)(uint64_t, char **, uint64_t), uint64_t a2)
{
  int list = _citrus_esdb_get_list(&v27, (uint64_t *)&v26, 1);
  if (list)
  {
    *__error() = list;
  }

  else
  {
    qsort(v27, v26, 8uLL, (int (__cdecl *)(const void *, const void *))qsort_helper);
    unint64_t v5 = v26;
    if (v26)
    {
      uint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      do
      {
        int v8 = v27;
        uint64_t v9 = (const char *)*((void *)v27 + v6);
        uint64_t v10 = strchr(v9, 47);
        uint64_t v11 = (char **)malloc(8 * v5);
        if (!v11) {
          break;
        }
        v12 = v11;
        v13 = strndup(v9, v10 - v9);
        if (!v13)
        {
LABEL_25:
          free(v12);
          break;
        }

        v14 = v13;
        uint64_t *v12 = v13;
        if (v5 <= v7)
        {
          LODWORD(v16) = 1;
          a1(1LL, v12, a2);
        }

        else
        {
          unint64_t v15 = v7;
          uint64_t v16 = 1LL;
          while (1)
          {
            v17 = (const char *)v8[v15];
            size_t v18 = strlen(v14);
            if (strncmp(v14, v17, v18)) {
              break;
            }
            v19 = strchr(v17, 47) + 1;
            if (strcmp(v14, v19))
            {
              v20 = strdup(v19);
              if (!v20)
              {
                if ((_DWORD)v16)
                {
                  uint64_t v23 = v16;
                  v24 = (void **)v12;
                  do
                  {
                    v25 = *v24++;
                    free(v25);
                    --v23;
                  }

                  while (v23);
                }

                goto LABEL_25;
              }

              v12[v16] = v20;
              uint64_t v16 = (v16 + 1);
            }

            unint64_t v15 = (v7 + 1);
            unint64_t v7 = v15;
            if (v5 <= v15) {
              goto LABEL_17;
            }
          }

          unint64_t v15 = v7;
LABEL_17:
          a1(v16, v12, a2);
          unint64_t v7 = v15;
          if (!(_DWORD)v16) {
            goto LABEL_20;
          }
        }

        uint64_t v16 = v16;
        v21 = (void **)v12;
        do
        {
          v22 = *v21++;
          free(v22);
          --v16;
        }

        while (v16);
LABEL_20:
        free(v12);
        uint64_t v6 = v7;
        unint64_t v5 = v26;
      }

      while (v26 > v7);
    }

    if (v27) {
      _citrus_esdb_free_list((void **)v27, v26);
    }
  }

uint64_t qsort_helper(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

double __bsd_iconvctl(void *a1, int a2, __int128 *a3)
{
  if ((unint64_t)a1 + 1 > 1)
  {
    switch(a2)
    {
      case 0:
        int v8 = *(const char **)(*a1 + 64LL);
        uint64_t v9 = strchr(v8, 47);
        size_t v10 = v9 - v8;
        uint64_t v11 = v9 + 1;
        int v12 = v9 - v8 == strlen(v9 + 1) && memcmp(v8, v11, v10) == 0;
        goto LABEL_23;
      case 1:
        int v12 = *(unsigned __int8 *)(*a1 + 73LL);
        goto LABEL_23;
      case 2:
        *(_BYTE *)(*a1 + 73LL) = *(_DWORD *)a3 != 0;
        return *(double *)&v4;
      case 3:
        int v12 = *(unsigned __int8 *)(*a1 + 72LL);
        goto LABEL_23;
      case 4:
        *(_BYTE *)(*a1 + 72LL) = *(_DWORD *)a3 != 0;
        return *(double *)&v4;
      case 5:
        *(void *)(*a1 + 80LL) = a3;
        return *(double *)&v4;
      case 6:
        v13 = (void *)a1[2];
        if (a3)
        {
          if (v13 || (v13 = malloc(0x28uLL), (a1[2] = v13) != 0LL))
          {
            __int128 v4 = *a3;
            __int128 v14 = a3[1];
            v13[4] = *((void *)a3 + 4);
            *(_OWORD *)v13 = v4;
            *((_OWORD *)v13 + 1) = v14;
          }
        }

        else if (v13)
        {
          v13[4] = 0LL;
          *(void *)&__int128 v4 = 0LL;
          *(_OWORD *)v13 = 0u;
          *((_OWORD *)v13 + 1) = 0u;
        }

        return *(double *)&v4;
      default:
        if (a2 == 128)
        {
          int v12 = *(unsigned __int8 *)(*a1 + 88LL);
LABEL_23:
          *(_DWORD *)a3 = v12;
          return *(double *)&v4;
        }

        if (a2 == 129)
        {
          *(_BYTE *)(*a1 + 88LL) = *(_DWORD *)a3 != 0;
          return *(double *)&v4;
        }

        uint64_t v3 = __error();
        int v5 = 22;
        break;
    }
  }

  else
  {
    uint64_t v3 = __error();
    int v5 = 9;
  }

  *uint64_t v3 = v5;
  return *(double *)&v4;
}

int64_t _citrus_bcs_strtol(unsigned __int8 *a1, unsigned __int8 **a2, int a3)
{
  uint64_t v3 = a2;
  __int128 v4 = a1;
  int v5 = a1;
  if (a3)
  {
    int v5 = a1;
    if ((a3 - 37) < 0xFFFFFFDD)
    {
      uint64_t v6 = __error();
      int64_t result = 0LL;
      *uint64_t v6 = 22;
      if (v3) {
        goto LABEL_58;
      }
      return result;
    }
  }

  do
  {
    unsigned int v9 = *v5++;
    unsigned int v8 = v9;
    BOOL v10 = v9 == 11;
    uint64_t v11 = (1LL << v9) & 0x100003600LL;
  }

  while (v9 <= 0x20 && v11 != 0 || v10);
  if (v8 == 43 || v8 == 45)
  {
    unsigned __int8 v15 = *v5++;
    unsigned __int8 v14 = v15;
  }

  else
  {
    unsigned __int8 v14 = v8;
  }

  if ((a3 & 0xFFFFFFEF) != 0 || v14 != 48)
  {
    BOOL v17 = a3 == 0;
    if (v14 != 48)
    {
      int v16 = 10;
      goto LABEL_24;
    }

LABEL_23:
    int v16 = 8;
LABEL_24:
    if (!v17) {
      int v16 = a3;
    }
    goto LABEL_26;
  }

  if ((*v5 | 0x20) != 0x78)
  {
    BOOL v17 = a3 == 0;
    unsigned __int8 v14 = 48;
    goto LABEL_23;
  }

  unsigned __int8 v14 = v5[1];
  v5 += 2;
  int v16 = 16;
LABEL_26:
  int64_t result = 0LL;
  int v18 = 0;
  int64_t v19 = 0xFFFFFFFF80000000LL;
  if (v8 != 45) {
    int64_t v19 = 0x7FFFFFFFLL;
  }
  uint64_t v20 = v16;
  int64_t v21 = v19 / v16;
  int v22 = v19 % v16;
  if (v22 > 0)
  {
    BOOL v23 = v8 == 45;
  }

  else
  {
    int v16 = 0;
    BOOL v23 = 0LL;
  }

  int v24 = v16 - v22;
  int64_t v25 = v21 + v23;
  for (i = v5 - 1; ; ++i)
  {
    if ((v14 - 58) >= 0xF6u)
    {
      int v28 = v14 - 48;
    }

    else
    {
      int v27 = (v14 - 91) >= 0xE6u ? -55 : -87;
      int v28 = v27 + v14;
    }

    if (v18 < 0)
    {
      int v18 = -1;
      goto LABEL_54;
    }

    if (v8 == 45)
    {
      if (result < v25 || result == v25 && v28 > v24)
      {
        *__error() = 34;
        int v18 = -1;
        int64_t result = 0xFFFFFFFF80000000LL;
        goto LABEL_54;
      }

      int64_t result = result * v20 - v28;
    }

    else
    {
      if (result > v25 || result == v25 && v28 > v22)
      {
        *__error() = 34;
        int v18 = -1;
        int64_t result = 0x7FFFFFFFLL;
        goto LABEL_54;
      }

      int64_t result = result * v20 + v28;
    }

    int v18 = 1;
LABEL_54:
    unsigned __int8 v29 = i[1];
    unsigned __int8 v14 = v29;
  }

  uint64_t v3 = a2;
  if (a2)
  {
    if (v18) {
      __int128 v4 = i;
    }
LABEL_58:
    *uint64_t v3 = v4;
  }

  return result;
}

unint64_t _citrus_bcs_strtoul(unsigned __int8 *a1, unsigned __int8 **a2, int a3)
{
  int v5 = a1;
  if (a3)
  {
    int v5 = a1;
    if ((a3 - 37) < 0xFFFFFFDD)
    {
      uint64_t v6 = __error();
      unint64_t result = 0LL;
      *uint64_t v6 = 22;
      return result;
    }
  }

  do
  {
    unsigned int v9 = *v5++;
    unsigned int v8 = v9;
    BOOL v10 = v9 == 11;
    uint64_t v11 = (1LL << v9) & 0x100003600LL;
  }

  while (v9 <= 0x20 && v11 != 0 || v10);
  if (v8 == 43 || v8 == 45)
  {
    unsigned __int8 v15 = *v5++;
    unsigned __int8 v14 = v15;
  }

  else
  {
    unsigned __int8 v14 = v8;
  }

  if ((a3 & 0xFFFFFFEF) != 0 || v14 != 48)
  {
    BOOL v17 = a3 == 0;
    if (v14 != 48)
    {
      int v18 = 10;
      goto LABEL_23;
    }

LABEL_22:
    int v18 = 8;
LABEL_23:
    if (v17) {
      int v16 = v18;
    }
    else {
      int v16 = a3;
    }
    goto LABEL_26;
  }

  if ((*v5 | 0x20) != 0x78)
  {
    BOOL v17 = a3 == 0;
    unsigned __int8 v14 = 48;
    goto LABEL_22;
  }

  unsigned __int8 v14 = v5[1];
  v5 += 2;
  int v16 = 16;
LABEL_26:
  unint64_t v19 = 0LL;
  int v20 = 0;
  uint64_t v21 = v16;
  unint64_t v22 = 0xFFFFFFFFuLL / v16;
  int v23 = ~(v22 * v16);
  for (i = v5 - 1; ; ++i)
  {
    if ((v14 - 58) >= 0xF6u)
    {
      int v26 = v14 - 48;
    }

    else
    {
      int v25 = (v14 - 91) >= 0xE6u ? -55 : -87;
      int v26 = v25 + v14;
    }

    if (v20 < 0) {
      goto LABEL_40;
    }
    if (v19 > v22 || v19 == v22 && v26 > v23)
    {
      *__error() = 34;
      unint64_t v19 = 0xFFFFFFFFLL;
LABEL_40:
      int v20 = -1;
      goto LABEL_41;
    }

    unint64_t v19 = v19 * v21 + v26;
    int v20 = 1;
LABEL_41:
    unsigned __int8 v27 = i[1];
    unsigned __int8 v14 = v27;
  }

  if (v20 > 0 && v8 == 45) {
    unint64_t result = -(uint64_t)v19;
  }
  else {
    unint64_t result = v19;
  }
  if (a2)
  {
    if (v20) {
      unsigned __int8 v29 = i;
    }
    else {
      unsigned __int8 v29 = a1;
    }
    *a2 = v29;
  }

  return result;
}

uint64_t _citrus_bcs_strcasecmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  do
  {
    unsigned __int8 v3 = *a1++;
    unsigned __int8 v2 = v3;
    unsigned __int8 v4 = v3 - 32;
    unsigned __int8 v6 = *a2++;
    unsigned __int8 v5 = v6;
    unsigned __int8 v7 = v6 - 32;
    if (v2) {
      BOOL v8 = v5 == 0;
    }
    else {
      BOOL v8 = 1;
    }
  }

  while (!v8 && v2 == v5);
  BOOL v9 = v2 == v5;
  else {
    unsigned int v10 = -1;
  }
  if (v9) {
    return 0LL;
  }
  else {
    return v10;
  }
}

uint64_t _citrus_bcs_strncasecmp(char *a1, char *a2, uint64_t a3)
{
  unsigned int v3 = 1;
  unsigned int v4 = 1;
  do
  {
    BOOL v6 = a3-- != 0;
    if (v4 != v3 || !v6) {
      break;
    }
    char v7 = *a1++;
    LOBYTE(v4) = v7;
    char v8 = v7 - 32;
    unsigned int v4 = v4;
    char v9 = *a2++;
    LOBYTE(v3) = v9;
    char v10 = v9 - 32;
    unsigned int v3 = v3;
  }

  while ((_BYTE)v4 && v3 != 0);
  BOOL v12 = v4 == v3;
  if (v4 > v3) {
    unsigned int v13 = 1;
  }
  else {
    unsigned int v13 = -1;
  }
  if (v12) {
    return 0LL;
  }
  else {
    return v13;
  }
}

unsigned __int8 *_citrus_bcs_skip_ws(unsigned __int8 *result)
{
  while (1)
  {
    int v1 = *result;
    ++result;
  }

  return result;
}

unsigned __int8 *_citrus_bcs_skip_nonws(unsigned __int8 *result)
{
  while (1)
  {
    unsigned int v1 = *result;
    BOOL v2 = v1 > 0x20;
    uint64_t v3 = (1LL << v1) & 0x100003E01LL;
    if (!v2 && v3 != 0) {
      break;
    }
    ++result;
  }

  return result;
}

unsigned __int8 *_citrus_bcs_skip_ws_len(unsigned __int8 *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = &result[v2];
    uint64_t v4 = v2 - 1;
    while (1)
    {
      int v5 = *result;
      ++result;
      *a2 = v4--;
      if (v4 == -1) {
        return v3;
      }
    }
  }

  return result;
}

unsigned __int8 *_citrus_bcs_skip_nonws_len(unsigned __int8 *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = &result[v2];
    uint64_t v4 = v2 - 1;
    while (1)
    {
      unsigned int v5 = *result;
      BOOL v6 = v5 > 0x20;
      uint64_t v7 = (1LL << v5) & 0x100003E01LL;
      if (!v6 && v7 != 0) {
        break;
      }
      ++result;
      *a2 = v4--;
      if (v4 == -1) {
        return v3;
      }
    }
  }

  return result;
}

uint64_t _citrus_bcs_trunc_rws_len(uint64_t result, void *a2)
{
  if (*a2)
  {
    uint64_t v2 = *a2 - 1LL;
    do
    {
      int v3 = *(unsigned __int8 *)(result + v2);
      *a2 = v2--;
    }

    while (v2 != -1);
  }

  return result;
}

unsigned __int8 *_citrus_bcs_convert_to_lower(unsigned __int8 *result)
{
  unsigned __int8 v1 = *result;
  if (*result)
  {
    uint64_t v2 = result + 1;
    do
    {
      *(v2 - 1) = v1;
      int v3 = *v2++;
      unsigned __int8 v1 = v3;
    }

    while (v3);
  }

  return result;
}

unsigned __int8 *_citrus_bcs_convert_to_upper(unsigned __int8 *result)
{
  unsigned __int8 v1 = *result;
  if (*result)
  {
    uint64_t v2 = result + 1;
    do
    {
      *(v2 - 1) = v1;
      int v3 = *v2++;
      unsigned __int8 v1 = v3;
    }

    while (v3);
  }

  return result;
}

uint64_t _citrus_csmapper_open()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  char v6 = v5;
  char v8 = v7;
  char v10 = v9;
  uint64_t v11 = (void ***)v0;
  uint64_t v51 = *MEMORY[0x1895F89C0];
  uint64_t area = _citrus_mapper_create_area(&maparea, "/usr/share/i18n/csmapper");
  if ((_DWORD)area) {
    return area;
  }
  unsigned __int8 v14 = _citrus_lookup_simple("/usr/share/i18n/csmapper/charset.alias", (uint64_t)v10, v44, 0x400uLL, 1);
  if (v14) {
    char v10 = v14;
  }
  unsigned __int8 v15 = _citrus_lookup_simple("/usr/share/i18n/csmapper/charset.alias", (uint64_t)v8, v43, 0x400uLL, 1);
  if (v15) {
    char v8 = v15;
  }
  if (!strcmp(v10, v8))
  {
    uint64_t v17 = maparea;
    pthread_rwlock_wrlock(&ma_lock);
    uint64_t v18 = csm_none;
    if (!csm_none)
    {
      uint64_t area = _citrus_mapper_open_direct(v17, &csm_none, "mapper_none", &unk_1818FCB2E);
      if ((_DWORD)area) {
        goto LABEL_23;
      }
      _citrus_mapper_set_persistent(csm_none);
      uint64_t v18 = csm_none;
    }

    uint64_t area = 0LL;
    *uint64_t v11 = (void **)v18;
LABEL_23:
    pthread_rwlock_unlock(&ma_lock);
    if (!v4 || (_DWORD)area)
    {
      if ((_DWORD)area) {
        return area;
      }
    }

    else
    {
      *uint64_t v4 = 0LL;
    }

    uint64_t area = 0LL;
    *uint64_t v2 = 1;
    return area;
  }

  *uint64_t v2 = 0;
  snprintf(__str, 0x400uLL, "%s/%s", v10, v8);
  uint64_t v16 = _citrus_mapper_open(maparea, v11, __str);
  if ((_DWORD)v16 != 2)
  {
    uint64_t area = v16;
    if (!(_DWORD)v16)
    {
      uint64_t area = 0LL;
      if (v4) {
        *uint64_t v4 = 0LL;
      }
    }

    return area;
  }

  if ((v6 & 1) != 0) {
    return 2LL;
  }
  uint64_t v19 = _citrus_map_file(v49, "/usr/share/i18n/csmapper/charset.pivot.pvdb");
  if ((_DWORD)v19 == 2)
  {
    unint64_t v21 = 0LL;
LABEL_30:
    uint64_t v22 = _citrus_lookup_seq_open(&v37, "/usr/share/i18n/csmapper/charset.pivot", 1);
    if ((_DWORD)v22)
    {
      uint64_t area = v22;
    }

    else
    {
      uint64_t v23 = _citrus_lookup_seq_lookup((uint64_t)v37);
      if ((_DWORD)v23)
      {
        uint64_t area = v23;
        unint64_t v24 = -1LL;
      }

      else
      {
        unint64_t v24 = -1LL;
LABEL_37:
        uint64_t v26 = parse_line((uint64_t)v49, (uint64_t)v36);
        if ((_DWORD)v26
          || (uint64_t v26 = _citrus_lookup_seq_open(&v40, "/usr/share/i18n/csmapper/charset.pivot", 1), (_DWORD)v26))
        {
          uint64_t area = v26;
        }

        else
        {
          for (uint64_t i = _citrus_lookup_seq_lookup((uint64_t)v40); !(_DWORD)i; uint64_t i = _citrus_lookup_seq_next((uint64_t)v40))
          {
            uint64_t i = parse_line((uint64_t)v45, (uint64_t)&v38);
            if ((_DWORD)i) {
              break;
            }
            if (!strcmp(v8, v45))
            {
              v50 += v46;
              _citrus_lookup_seq_close((uint64_t)v40);
              unint64_t v28 = v50;
              if (v50 < v24)
              {
                __strlcpy_chk();
                unint64_t v24 = v28;
              }

              uint64_t area = _citrus_lookup_seq_next((uint64_t)v37);
              if (!(_DWORD)area) {
                goto LABEL_37;
              }
              goto LABEL_49;
            }
          }

          uint64_t area = i;
          _citrus_lookup_seq_close((uint64_t)v40);
        }
      }

LABEL_49:
      _citrus_lookup_seq_close((uint64_t)v37);
      if ((_DWORD)area == 2)
      {
        if (v24 == -1LL)
        {
          uint64_t area = 2LL;
        }

        else
        {
          __strlcpy_chk();
          uint64_t area = 0LL;
          unint64_t v21 = v24;
        }
      }
    }

LABEL_64:
    if (!(_DWORD)area) {
      goto LABEL_65;
    }
    return area;
  }

  uint64_t area = v19;
  if ((_DWORD)v19) {
    goto LABEL_19;
  }
  uint64_t v20 = _citrus_db_open(v36, (uint64_t)v49, "CSPIVOT", (uint64_t)_citrus_db_hash_std, 0LL);
  if ((_DWORD)v20)
  {
    uint64_t area = v20;
    _citrus_unmap_file((uint64_t)v49);
LABEL_19:
    unint64_t v21 = 0LL;
    goto LABEL_20;
  }

  uint64_t v25 = open_subdb(&v40, (uint64_t *)v36[0], v10);
  if ((_DWORD)v25)
  {
    uint64_t area = v25;
    unint64_t v21 = 0LL;
    goto LABEL_74;
  }

  int number_of_entries = _citrus_db_get_number_of_entries((uint64_t)v40);
  if (number_of_entries < 1)
  {
    uint64_t area = 0LL;
    unint64_t v21 = -1LL;
    goto LABEL_73;
  }

  int v30 = number_of_entries;
  unsigned int v31 = 0;
  unint64_t v21 = -1LL;
  while (1)
  {
    uint64_t entry = _citrus_db_get_entry((uint64_t *)v40, v31, &v47, &v38);
    if ((_DWORD)entry) {
      goto LABEL_69;
    }
    if (v39 != 4) {
      goto LABEL_72;
    }
    unsigned int v33 = *v38;
    snprintf(v45, 0x800uLL, "%.*s", v48, v47);
    uint64_t entry = open_subdb(&v37, (uint64_t *)v36[0], v45);
    if ((_DWORD)entry)
    {
LABEL_69:
      uint64_t area = entry;
      goto LABEL_73;
    }

LABEL_61:
    _citrus_db_close(v37);
    if (v30 == ++v31)
    {
      uint64_t area = 0LL;
      goto LABEL_73;
    }
  }

  if (v39 == 4)
  {
    unint64_t v34 = bswap32(*v38) + (unint64_t)bswap32(v33);
    if (v34 < v21)
    {
      __strlcpy_chk();
      unint64_t v21 = v34;
    }

    goto LABEL_61;
  }

  _citrus_db_close(v37);
LABEL_72:
  uint64_t area = 79LL;
LABEL_73:
  _citrus_db_close(v40);
LABEL_74:
  _citrus_db_close(v36[0]);
  _citrus_unmap_file((uint64_t)v49);
  if ((_DWORD)area)
  {
LABEL_20:
    if ((_DWORD)area != 102) {
      goto LABEL_64;
    }
    goto LABEL_30;
  }

  if (v21 == -1LL) {
    return 2LL;
  }
LABEL_65:
  uint64_t v35 = open_serial_mapper(maparea, (uint64_t)v11, v10, v41, v8);
  uint64_t area = v35;
  if (v4 && !(_DWORD)v35) {
    *uint64_t v4 = v21;
  }
  return area;
}

uint64_t open_serial_mapper(uint64_t a1, uint64_t a2, const char *a3, const char *a4, const char *a5)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x400uLL, "%s/%s,%s/%s", a3, a4, a4, a5);
  return _citrus_mapper_open_direct(a1, a2, "mapper_serial", __str);
}

uint64_t open_subdb(void *a1, uint64_t *a2, char *__s)
{
  uint64_t result = _citrus_db_lookup_by_string(a2, __s, v5, 0LL);
  if (!(_DWORD)result) {
    return _citrus_db_open(a1, (uint64_t)v5, "CSPIVSUB", (uint64_t)_citrus_db_hash_std, 0LL);
  }
  return result;
}

uint64_t parse_line(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v3 = *(unsigned __int8 **)a2;
  uint64_t v13 = *(void *)(a2 + 8);
  uint64_t v4 = _citrus_bcs_skip_ws_len(v3, &v13);
  if (!v13) {
    return 79LL;
  }
  char v5 = (const char *)v4;
  char v6 = _citrus_bcs_skip_nonws_len(v4, &v13);
  if (!v13) {
    return 79LL;
  }
  int v7 = (int)v6;
  char v8 = _citrus_bcs_skip_ws_len(v6, &v13);
  if (!v13) {
    return 79LL;
  }
  uint64_t v9 = (const char *)v8;
  unsigned int v10 = _citrus_bcs_skip_nonws_len(v8, &v13);
  snprintf((char *)a1, 0x400uLL, "%.*s", v7 - (_DWORD)v5, v5);
  snprintf(__str, 0x14uLL, "%.*s", v10 - (_DWORD)v9, v9);
  unint64_t v11 = _citrus_bcs_strtoul((unsigned __int8 *)__str, 0LL, 0);
  uint64_t result = 0LL;
  *(void *)(a1 + 1024) = v11;
  return result;
}

uint64_t _citrus_db_open(void *a1, uint64_t a2, char *__s2, uint64_t a4, uint64_t a5)
{
  char v5 = *(const char **)a2;
  unint64_t v6 = *(void *)(a2 + 8);
  if (v6 < 0x10 || v5 == 0LL) {
    return 79LL;
  }
  unint64_t v12 = bswap32(*((_DWORD *)v5 + 3));
  if (v6 <= v12) {
    return 79LL;
  }
  unint64_t v13 = 24 * bswap32(*((_DWORD *)v5 + 2));
  BOOL v14 = v6 >= v12;
  unint64_t v15 = v6 - v12;
  if (!v14) {
    unint64_t v15 = 0LL;
  }
  if (v15 < v13) {
    return 79LL;
  }
  uint64_t v17 = malloc(0x20uLL);
  if (!v17) {
    return *__error();
  }
  uint64_t v18 = v17;
  uint64_t result = 0LL;
  *(_OWORD *)uint64_t v18 = *(_OWORD *)a2;
  v18[2] = a4;
  v18[3] = a5;
  *a1 = v18;
  return result;
}

uint64_t _citrus_db_lookup(uint64_t *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (v5 >= 0x10) {
    uint64_t v6 = *a1;
  }
  else {
    uint64_t v6 = 0LL;
  }
  unsigned int v7 = *(_DWORD *)(v6 + 8);
  if (!v7) {
    return 2LL;
  }
  if (a4)
  {
    unint64_t v12 = *(void *)(a4 + 8);
    if (v12)
    {
      if (v12 < v5)
      {
        unsigned int v13 = *(_DWORD *)a4;
        goto LABEL_11;
      }

      return 2LL;
    }
  }

  unsigned int v13 = ((unsigned int (*)(uint64_t))a1[2])(a2) % bswap32(v7);
  unint64_t v12 = bswap32(*(_DWORD *)(v6 + 12)) + 24 * v13;
  if (a4) {
    *(_DWORD *)a4 = v13;
  }
LABEL_11:
  while (1)
  {
    uint64_t result = 79LL;
    if (v5 <= v12 || v12 + 24 > v5 || !v4) {
      break;
    }
    unint64_t v15 = (unsigned int *)(v4 + v12);
    unsigned int v16 = *(_DWORD *)(v4 + v12 + 4);
    unint64_t v12 = bswap32(v16);
    if (a4)
    {
      *(void *)(a4 + 8) = v12;
      if (!v16) {
        *(void *)(a4 + 8) = a1[1];
      }
    }

    if (bswap32(*v15) != v13) {
      return 2LL;
    }
    size_t v17 = bswap32(v15[3]);
    if (*(void *)(a2 + 8) == v17)
    {
      unint64_t v18 = bswap32(v15[2]);
      if (v5 <= v18 || v17 + v18 > v5) {
        return result;
      }
      if (!memcmp((const void *)(v4 + v18), *(const void **)a2, v17))
      {
        unint64_t v19 = bswap32(v15[4]);
        if (v5 <= v19) {
          return 79LL;
        }
        uint64_t v20 = bswap32(v15[5]);
        if (v20 + v19 > v5) {
          return 79LL;
        }
        uint64_t result = 0LL;
        if (a3)
        {
          *a3 = v4 + v19;
          a3[1] = v20;
        }

        return result;
      }
    }

    if (!v16) {
      return 2LL;
    }
  }

  return result;
}

uint64_t _citrus_db_lookup_by_string(uint64_t *a1, char *__s, void *a3, uint64_t a4)
{
  v8[0] = __s;
  v8[1] = strlen(__s);
  return _citrus_db_lookup(a1, (uint64_t)v8, a3, a4);
}

uint64_t _citrus_db_lookup8_by_string(uint64_t *a1, char *__s, _BYTE *a3, uint64_t a4)
{
  v9[0] = __s;
  v9[1] = strlen(__s);
  uint64_t result = _citrus_db_lookup(a1, (uint64_t)v9, v8, a4);
  if (!(_DWORD)result)
  {
    if (v8[1] == 1LL)
    {
      uint64_t result = 0LL;
      if (a3) {
        *a3 = *(_BYTE *)v8[0];
      }
    }

    else
    {
      return 79LL;
    }
  }

  return result;
}

uint64_t _citrus_db_lookup16_by_string(uint64_t *a1, char *__s, _WORD *a3, uint64_t a4)
{
  v9[0] = __s;
  v9[1] = strlen(__s);
  uint64_t result = _citrus_db_lookup(a1, (uint64_t)v9, v8, a4);
  if (!(_DWORD)result)
  {
    if (v8[1] == 2LL)
    {
      uint64_t result = 0LL;
      if (a3) {
        *a3 = bswap32(*(unsigned __int16 *)v8[0]) >> 16;
      }
    }

    else
    {
      return 79LL;
    }
  }

  return result;
}

uint64_t _citrus_db_lookup32_by_string(uint64_t *a1, char *__s, _DWORD *a3, uint64_t a4)
{
  v9[0] = __s;
  v9[1] = strlen(__s);
  uint64_t result = _citrus_db_lookup(a1, (uint64_t)v9, v8, a4);
  if (!(_DWORD)result)
  {
    if (v8[1] == 4LL)
    {
      uint64_t result = 0LL;
      if (a3) {
        *a3 = bswap32(*(_DWORD *)v8[0]);
      }
    }

    else
    {
      return 79LL;
    }
  }

  return result;
}

uint64_t _citrus_db_lookup_string_by_string(uint64_t *a1, char *__s, void *a3, uint64_t a4)
{
  v10[0] = __s;
  v10[1] = strlen(__s);
  uint64_t result = _citrus_db_lookup(a1, (uint64_t)v10, &v8, a4);
  if (!(_DWORD)result)
  {
    if (v9 && !*(_BYTE *)(v8 + v9 - 1))
    {
      uint64_t result = 0LL;
      if (a3) {
        *a3 = v8;
      }
    }

    else
    {
      return 79LL;
    }
  }

  return result;
}

uint64_t _citrus_db_get_number_of_entries(uint64_t a1)
{
  return bswap32(*(_DWORD *)(*(void *)a1 + 8LL));
}

uint64_t _citrus_db_get_entry(uint64_t *a1, unsigned int a2, void *a3, void *a4)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (v5 >= 0x10) {
    uint64_t v6 = *a1;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t result = 22LL;
  if ((a2 & 0x80000000) == 0 && bswap32(*(_DWORD *)(v6 + 8)) > a2)
  {
    unint64_t v8 = bswap32(*(_DWORD *)(v6 + 12)) + 24 * a2;
    if (v5 <= v8 || v8 + 24 > v5) {
      return 79LL;
    }
    if (!v4) {
      return 79LL;
    }
    unsigned int v10 = (unsigned int *)(v4 + v8);
    unint64_t v11 = bswap32(v10[2]);
    if (v5 <= v11) {
      return 79LL;
    }
    uint64_t v12 = bswap32(v10[3]);
    if (v12 + v11 > v5) {
      return 79LL;
    }
    if (a3)
    {
      *a3 = v4 + v11;
      a3[1] = v12;
    }

    unint64_t v13 = bswap32(v10[4]);
    if (v5 > v13 && (uint64_t v14 = bswap32(v10[5]), v14 + v13 <= v5))
    {
      uint64_t result = 0LL;
      if (a4)
      {
        *a4 = v4 + v13;
        a4[1] = v14;
      }
    }

    else
    {
      return 79LL;
    }
  }

  return result;
}

uint64_t _citrus_db_factory_create(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = malloc(0x38uLL);
  if (!v6) {
    return *__error();
  }
  unsigned int v7 = v6;
  uint64_t result = 0LL;
  *unsigned int v7 = 0LL;
  v7[1] = 0LL;
  v7[2] = v7 + 1;
  v7[3] = 0LL;
  v7[4] = 0LL;
  v7[5] = a2;
  v7[6] = a3;
  *a1 = v7;
  return result;
}

void _citrus_db_factory_free(void ***a1)
{
  int v3 = a1 + 1;
  uint64_t v2 = a1[1];
  if (v2)
  {
    do
    {
      uint64_t v4 = *v2;
      *int v3 = (void **)*v2;
      if (!v4) {
        a1[2] = (void **)v3;
      }
      if (*((_DWORD *)v2 + 10)) {
        free(v2[3]);
      }
      if (*((_DWORD *)v2 + 16)) {
        free(v2[6]);
      }
      free(v2);
      uint64_t v2 = *v3;
    }

    while (*v3);
  }

  free(a1);
}

uint64_t _citrus_db_factory_add(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  unsigned int v10 = malloc(0x48uLL);
  uint64_t v11 = 0xFFFFFFFFLL;
  if (v10)
  {
    uint64_t v12 = v10;
    v10[4] = (*(uint64_t (**)(uint64_t))(a1 + 40))(a2);
    *(_OWORD *)(v12 + 6) = *(_OWORD *)a2;
    v12[10] = a3;
    *((_OWORD *)v12 + 3) = *(_OWORD *)a4;
    v12[16] = a5;
    v12[17] = -1;
    *(void *)uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)(a1 + 24);
    **(void **)(a1 + 16) = v12;
    uint64_t v14 = v13 + *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v12;
    *(void *)(a1 + 24) = v14;
    *(void *)(a1 + 32) += (*(void *)(a4 + 8) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
    ++*(void *)a1;
    return 0LL;
  }

  return v11;
}

uint64_t _citrus_db_factory_add_by_string(uint64_t a1, char *__s1, uint64_t a3, int a4)
{
  unint64_t v8 = strdup(__s1);
  if (!v8) {
    return *__error();
  }
  v10[0] = v8;
  v10[1] = strlen(__s1);
  return _citrus_db_factory_add(a1, (uint64_t)v10, 1, a3, a4);
}

uint64_t _citrus_db_factory_add8_by_string(uint64_t a1, char *a2, char a3)
{
  uint64_t v6 = malloc(1uLL);
  if (!v6) {
    return *__error();
  }
  *uint64_t v6 = a3;
  v8[0] = v6;
  v8[1] = 1LL;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v8, 1);
}

uint64_t _citrus_db_factory_add16_by_string(uint64_t a1, char *a2, unsigned int a3)
{
  uint64_t v6 = malloc(2uLL);
  if (!v6) {
    return *__error();
  }
  *uint64_t v6 = __rev16(a3);
  v8[0] = v6;
  v8[1] = 2LL;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v8, 1);
}

uint64_t _citrus_db_factory_add32_by_string(uint64_t a1, char *a2, unsigned int a3)
{
  uint64_t v6 = malloc(4uLL);
  if (!v6) {
    return *__error();
  }
  *uint64_t v6 = bswap32(a3);
  v8[0] = v6;
  v8[1] = 4LL;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v8, 1);
}

uint64_t _citrus_db_factory_add_string_by_string(uint64_t a1, char *a2, char *__s1)
{
  unint64_t v5 = strdup(__s1);
  if (!v5) {
    return *__error();
  }
  v7[0] = v5;
  v7[1] = strlen(v5) + 1;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v7, 1);
}

unint64_t _citrus_db_factory_calc_size(void *a1)
{
  return a1[4] + ((a1[3] + 15LL) & 0xFFFFFFFFFFFFFFF0LL) + ((24LL * *a1 + 15) & 0xFFFFFFFFFFFFFFF0LL) + 16;
}

uint64_t _citrus_db_factory_serialize(size_t *a1, uint64_t a2, uint64_t a3)
{
  size_t v6 = *a1;
  if (v6)
  {
    unsigned int v7 = calloc(v6, 8uLL);
    if (v7)
    {
      unint64_t v8 = v7;
      size_t v9 = a1[1];
      if (v9)
      {
        size_t v10 = *a1;
        do
        {
          unint64_t v11 = *(unsigned int *)(v9 + 16) % v10;
          *(_DWORD *)(v9 + 16) = v11;
          *(_DWORD *)(v9 + 68) = -1;
          *(void *)(v9 + 8) = 0LL;
          if (!v7[v11])
          {
            v7[v11] = v9;
            *(_DWORD *)(v9 + 68) = v11;
          }

          size_t v9 = *(void *)v9;
        }

        while (v9);
        size_t v12 = a1[1];
        if (v12)
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(_DWORD *)(v12 + 68) == -1)
            {
              uint64_t v14 = v7[*(unsigned int *)(v12 + 16)];
              do
              {
                uint64_t v15 = v14;
                uint64_t v14 = *(void *)(v14 + 8);
              }

              while (v14);
              *(void *)(v15 + 8) = v12;
              while (v7[v13++])
                ;
              v7[--v13] = v12;
              *(_DWORD *)(v12 + 68) = v13;
            }

            size_t v12 = *(void *)v12;
          }

          while (v12);
        }
      }

      uint64_t v17 = 0LL;
      size_t v18 = *a1;
      unint64_t v19 = (24 * *a1 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      unint64_t v20 = (a1[3] + 15) & 0xFFFFFFFFFFFFFFF0LL;
      do
      {
        *(_BYTE *)(*(void *)a3 + v17) = *(_BYTE *)(a2 + v17);
        ++v17;
      }

      while (v17 != 8);
      if (HIDWORD(v18)) {
        _citrus_db_factory_serialize_cold_1();
      }
      unint64_t v21 = v19 + 16;
      *(_DWORD *)(*(void *)a3 + 8LL) = bswap32(v18);
      *(_DWORD *)(*(void *)a3 + 12LL) = 0x10000000;
      if (*a1)
      {
        size_t v22 = 0LL;
        unint64_t v23 = v21 + v20;
        uint64_t v24 = 16LL;
        do
        {
          uint64_t v25 = v8[v22];
          uint64_t v26 = *(void *)(v25 + 8);
          if (v26)
          {
            int v27 = *(_DWORD *)(v26 + 68);
            *(_DWORD *)(*(void *)a3 + v24) = bswap32(*(_DWORD *)(v25 + 16));
            if (v27 < 0) {
              _citrus_db_factory_serialize_cold_6();
            }
            LODWORD(v26) = 24 * v27 + 16;
          }

          else
          {
            *(_DWORD *)(*(void *)a3 + v24) = bswap32(*(_DWORD *)(v25 + 16));
          }

          *(_DWORD *)(*(void *)a3 + (v24 | 4)) = bswap32(v26);
          if (HIDWORD(v21)) {
            _citrus_db_factory_serialize_cold_2();
          }
          *(_DWORD *)(v24 + *(void *)a3 + 8) = bswap32(v21);
          unint64_t v28 = *(void *)(v25 + 32);
          if (HIDWORD(v28)) {
            _citrus_db_factory_serialize_cold_3();
          }
          *(_DWORD *)(v24 + *(void *)a3 + 12) = bswap32(v28);
          if (HIDWORD(v23)) {
            _citrus_db_factory_serialize_cold_4();
          }
          *(_DWORD *)(v24 + *(void *)a3 + 16) = bswap32(v23);
          unint64_t v29 = *(void *)(v25 + 56);
          if (HIDWORD(v29)) {
            _citrus_db_factory_serialize_cold_5();
          }
          *(_DWORD *)(v24 + *(void *)a3 + 20) = bswap32(v29);
          memcpy((void *)(*(void *)a3 + v21), *(const void **)(v25 + 24), *(void *)(v25 + 32));
          uint64_t v30 = *(void *)(v25 + 32);
          memcpy((void *)(*(void *)a3 + v23), *(const void **)(v25 + 48), *(void *)(v25 + 56));
          v23 += *(void *)(v25 + 56);
          unint64_t v31 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0LL;
          while (v31 != v23)
            *(_BYTE *)(*(void *)a3 + v23++) = 0;
          v24 += 24LL;
          v21 += v30;
          ++v22;
        }

        while (v22 < *a1);
      }

      else
      {
        uint64_t v24 = 16LL;
      }

      unint64_t v34 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      while (v34 != v24)
        *(_BYTE *)(*(void *)a3 + v24++) = 0;
      unint64_t v35 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      while (v35 != v21)
        *(_BYTE *)(*(void *)a3 + v21++) = 0;
      free(v8);
      return 0LL;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    for (uint64_t i = 0LL; i != 8; ++i)
      *(_BYTE *)(*(void *)a3 + i) = *(_BYTE *)(a2 + i);
    uint64_t result = 0LL;
    *(_DWORD *)(*(void *)a3 + 8LL) = 0;
    *(_DWORD *)(*(void *)a3 + 12LL) = 0x10000000;
  }

  return result;
}

uint64_t _citrus_db_hash_std(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (unsigned __int8 **)result;
  LODWORD(result) = 0;
  int v3 = *v2;
  do
  {
    unsigned __int8 v5 = *v3++;
    unsigned __int8 v4 = v5;
    unsigned __int8 v6 = v5 + 32;
    unsigned int v7 = 16 * result + v4;
    if ((v7 & 0xF0000000) != 0) {
      uint64_t result = v7 & 0xFFFFFFF ^ ((v7 & 0xF0000000) >> 24);
    }
    else {
      uint64_t result = v7;
    }
    --v1;
  }

  while (v1);
  return result;
}

char *_citrus_esdb_alias(uint64_t a1, char *a2, size_t a3)
{
  uint64_t result = _citrus_lookup_simple("/usr/share/i18n/esdb/esdb.alias", a1, a2, a3, 1);
  if (!result) {
    return (char *)a1;
  }
  return result;
}

uint64_t _citrus_esdb_open(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x400uLL, "%s/%s", "/usr/share/i18n/esdb", "esdb.alias");
  unsigned __int8 v4 = _citrus_lookup_simple(__str, a2, v31, 0x400uLL, 1);
  if (v4) {
    a2 = (uint64_t)v4;
  }
  snprintf(__str, 0x400uLL, "%s/%s", "/usr/share/i18n/esdb", "esdb.dir");
  unsigned __int8 v5 = _citrus_lookup_simple(__str, a2, v30, 0x400uLL, 1);
  if (!v5) {
    return 2LL;
  }
  snprintf(__str, 0x400uLL, "%s/%s", "/usr/share/i18n/esdb", v5);
  uint64_t v6 = _citrus_map_file(v22, __str);
  if (!(_DWORD)v6)
  {
    uint64_t v6 = _citrus_db_open(&v28, (uint64_t)v22, "ESDB", (uint64_t)_citrus_db_hash_std, 0LL);
    if (!(_DWORD)v6)
    {
      LODWORD(v6) = _citrus_db_lookup32_by_string((uint64_t *)v28, "version", &v23, 0LL);
      if ((_DWORD)v6) {
        goto LABEL_7;
      }
      if (v23 == 1)
      {
        LODWORD(v6) = _citrus_db_lookup_string_by_string((uint64_t *)v28, "encoding", &__s1, 0LL);
        if ((_DWORD)v6) {
          goto LABEL_7;
        }
        unint64_t v8 = strdup(__s1);
        *(void *)a1 = v8;
        if (!v8)
        {
          LODWORD(v6) = *__error();
          goto LABEL_7;
        }

        *(void *)(a1 + 8) = 0LL;
        *(void *)(a1 + 16) = 0LL;
        int v9 = _citrus_db_lookup_string_by_string((uint64_t *)v28, "variable", &__s1, 0LL);
        if (v9 != 2)
        {
          LODWORD(v6) = v9;
          if (v9)
          {
LABEL_27:
            free(*(void **)a1);
LABEL_7:
            _citrus_db_close(v28);
            if ((_DWORD)v6 == 2) {
              uint64_t v6 = 79LL;
            }
            else {
              uint64_t v6 = v6;
            }
            goto LABEL_10;
          }

          size_t v10 = __s1;
          *(void *)(a1 + 16) = strlen(__s1) + 1;
          unint64_t v11 = strdup(v10);
          *(void *)(a1 + 8) = v11;
          if (!v11)
          {
            LODWORD(v6) = *__error();
            goto LABEL_27;
          }
        }

        LODWORD(v6) = _citrus_db_lookup32_by_string((uint64_t *)v28, "num_charsets", &v25, 0LL);
        if ((_DWORD)v6)
        {
LABEL_20:
          free(*(void **)(a1 + 8));
          goto LABEL_27;
        }

        *(_DWORD *)(a1 + 24) = v25;
        int v12 = _citrus_db_lookup32_by_string((uint64_t *)v28, "invalid", &v24, 0LL);
        if (v12 == 2)
        {
          *(_DWORD *)(a1 + 40) = 0;
        }

        else
        {
          LODWORD(v6) = v12;
          if (v12) {
            goto LABEL_20;
          }
          int v13 = v24;
          *(_DWORD *)(a1 + 40) = 1;
          *(_DWORD *)(a1 + 44) = v13;
        }

        unsigned int v14 = v25;
        uint64_t v15 = malloc(16LL * v25);
        *(void *)(a1 + 32) = v15;
        if (!v15)
        {
          LODWORD(v6) = *__error();
          goto LABEL_20;
        }

        if (v14)
        {
          uint64_t v16 = 0LL;
          unint64_t v17 = 0LL;
          while (1)
          {
            snprintf(__s, 0x64uLL, "csid_%d", v17);
            int v18 = _citrus_db_lookup32_by_string((uint64_t *)v28, __s, &v26, 0LL);
            if (v18
              || (*(_DWORD *)(*(void *)(a1 + 32) + v16) = v26,
                  snprintf(__s, 0x64uLL, "csname_%d", v17),
                  (int v18 = _citrus_db_lookup_string_by_string((uint64_t *)v28, __s, &__s1, 0LL)) != 0))
            {
              LODWORD(v6) = v18;
              goto LABEL_40;
            }

            unint64_t v19 = strdup(__s1);
            *(void *)(*(void *)(a1 + 32) + v16 + 8) = v19;
            if (!v19) {
              break;
            }
            ++v17;
            v16 += 16LL;
            if (v17 >= v25) {
              goto LABEL_36;
            }
          }

          LODWORD(v6) = *__error();
LABEL_40:
          if ((_DWORD)v17)
          {
            unsigned int v20 = v17 - 1;
            do
            {
              uint64_t v21 = v20;
              free(*(void **)(*(void *)(a1 + 32) + 16LL * v20-- + 8));
            }

            while (v21);
          }

          free(*(void **)(a1 + 32));
          goto LABEL_20;
        }

LABEL_36:
        _citrus_db_close(v28);
        uint64_t v6 = 0LL;
      }

      else
      {
        _citrus_db_close(v28);
        uint64_t v6 = 79LL;
      }
    }

LABEL_10:
    _citrus_unmap_file((uint64_t)v22);
  }

  return v6;
}

void _citrus_esdb_close(uint64_t a1)
{
  if (*(int *)(a1 + 24) >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 8LL;
    do
    {
      free(*(void **)(*(void *)(a1 + 32) + v3));
      ++v2;
      v3 += 16LL;
    }

    while (v2 < *(int *)(a1 + 24));
  }

  *(_DWORD *)(a1 + 24) = 0;
  free(*(void **)(a1 + 32));
  *(void *)(a1 + 32) = 0LL;
  free(*(void **)a1);
  *(void *)a1 = 0LL;
  *(void *)(a1 + 16) = 0LL;
  free(*(void **)(a1 + 8));
  *(void *)(a1 + 8) = 0LL;
}

void _citrus_esdb_free_list(void **a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = a2;
    unsigned __int8 v4 = a1;
    do
    {
      unsigned __int8 v5 = *v4++;
      free(v5);
      --v3;
    }

    while (v3);
  }

  free(a1);
}

uint64_t _citrus_esdb_get_list(void *a1, uint64_t *a2, char a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v6 = _citrus_lookup_seq_open(&v25, "/usr/share/i18n/esdb/esdb.alias", 1);
  if ((_DWORD)v6) {
    return v6;
  }
  uint64_t v6 = _citrus_lookup_seq_open(&v24, "/usr/share/i18n/esdb/esdb.dir", 1);
  if ((_DWORD)v6) {
    goto LABEL_25;
  }
  int number_of_entries = _citrus_lookup_get_number_of_entries(v25);
  int v8 = _citrus_lookup_get_number_of_entries(v24) + number_of_entries;
  _citrus_lookup_seq_rewind(v25);
  _citrus_lookup_seq_rewind(v24);
  int v9 = malloc(8LL * v8);
  uint64_t v10 = 0LL;
  if (!v9)
  {
LABEL_21:
    uint64_t v6 = *__error();
LABEL_22:
    if (!(_DWORD)v6) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  while (1)
  {
    uint64_t v11 = _citrus_lookup_seq_next(v25);
    if ((_DWORD)v11) {
      break;
    }
    snprintf(__str, 0x400uLL, "%.*s/%.*s", v21, v20, v23, v22);
    _citrus_bcs_convert_to_upper((unsigned __int8 *)__str);
    int v12 = strdup(__str);
    v9[v10] = v12;
    if (!v12) {
      goto LABEL_21;
    }
    ++v10;
  }

  uint64_t v6 = v11;
  if ((_DWORD)v11 != 2) {
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v13 = _citrus_lookup_seq_next(v24);
    if ((_DWORD)v13) {
      break;
    }
    if ((a3 & 1) == 0)
    {
      snprintf(__str, 0x400uLL, "%.*s");
      goto LABEL_17;
    }

    snprintf(__s, 0x400uLL, "%.*s", v21, v20);
    unsigned int v14 = strchr(__s, 47);
    if (v14)
    {
      strlen(v14);
      __memmove_chk();
    }

    uint64_t v15 = strstr(__s, ".esdb");
    if (v15) {
      *uint64_t v15 = 0;
    }
    if (!strchr(__s, 64))
    {
      snprintf(__str, 0x400uLL, "%s/%.*s");
LABEL_17:
      _citrus_bcs_convert_to_upper((unsigned __int8 *)__str);
      uint64_t v16 = _citrus_lookup_seq_lookup(v25);
      if ((_DWORD)v16)
      {
        uint64_t v6 = v16;
        if ((_DWORD)v16 != 2) {
          goto LABEL_22;
        }
        unint64_t v17 = strdup(__str);
        v9[v10] = v17;
        if (!v17) {
          goto LABEL_21;
        }
        ++v10;
      }
    }
  }

  uint64_t v6 = v13;
  if ((_DWORD)v13 != 2) {
    goto LABEL_22;
  }
  unint64_t v19 = realloc(v9, 8 * v10);
  if (!v19)
  {
    uint64_t v6 = 12LL;
LABEL_23:
    _citrus_esdb_free_list((void **)v9, v10);
    goto LABEL_24;
  }

  uint64_t v6 = 0LL;
  *a1 = v19;
  *a2 = v10;
LABEL_24:
  _citrus_lookup_seq_close(v24);
LABEL_25:
  _citrus_lookup_seq_close(v25);
  return v6;
}

uint64_t _string_hash_func(const char *a1, unsigned int a2)
{
  v4[0] = a1;
  v4[1] = strlen(a1);
  return _citrus_db_hash_std((uint64_t)v4) % a2;
}

uint64_t _citrus_iconv_open(void **a1)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  pthread_rwlock_wrlock(&ci_lock);
  if ((isinit & 1) == 0)
  {
    bzero(&shared_pool, 0x328uLL);
    shared_unused = 0LL;
    qword_18C46BA68 = (uint64_t)&shared_unused;
    shared_max_reuse = -1;
    if (issetugid() || (unsigned int v7 = getenv("ICONV_MAX_REUSE")) == 0LL)
    {
      if ((shared_max_reuse & 0x80000000) == 0)
      {
LABEL_5:
        isinit = 1;
        goto LABEL_6;
      }
    }

    else
    {
      shared_max_reuse = atoi(v7);
      if ((shared_max_reuse & 0x80000000) == 0) {
        goto LABEL_5;
      }
    }

    shared_max_reuse = 5;
    goto LABEL_5;
  }

LABEL_6:
  pthread_rwlock_unlock(&ci_lock);
  __strlcpy_chk();
  uint64_t v2 = strstr(__big, "//");
  if (v2) {
    *uint64_t v2 = 0;
  }
  __strlcpy_chk();
  uint64_t v3 = strstr(__s, "//");
  if (v3) {
    *uint64_t v3 = 0;
  }
  if (!__big[0] || !strcasecmp(__big, "char"))
  {
    locale_charset();
    int v4 = 0;
LABEL_15:
    __strlcpy_chk();
    goto LABEL_16;
  }

  if (!strcasecmp(__big, "wchar_t"))
  {
    nl_langinfo(0);
    int v4 = 1;
    goto LABEL_15;
  }

  int v4 = 0;
LABEL_16:
  if (!__s[0] || !strcasecmp(__s, "char"))
  {
    locale_charset();
    goto LABEL_21;
  }

  if (!strcasecmp(__s, "wchar_t"))
  {
    v4 |= 2u;
    nl_langinfo(0);
LABEL_21:
    __strlcpy_chk();
  }

  if (strchr(__big, 47) || strchr(__s, 47)) {
    return 22LL;
  }
  snprintf(__str, 0x400uLL, "%s/%s", __big, __s);
  pthread_rwlock_wrlock(&ci_lock);
  int v8 = (uint64_t *)((char *)&shared_pool + 8 * (int)_string_hash_func(__str, 0x65u));
  uint64_t v9 = *v8;
  if (*v8)
  {
    while (strcmp(*(const char **)(v9 + 64), __str))
    {
      uint64_t v9 = *(void *)(v9 + 16);
      if (!v9) {
        goto LABEL_33;
      }
    }

    int v17 = *(_DWORD *)(v9 + 56);
    if (!v17)
    {
      uint64_t v18 = *(void *)(v9 + 32);
      unint64_t v19 = *(void **)(v9 + 40);
      if (v18)
      {
        *(void *)(v18 + 40) = v19;
        unint64_t v19 = *(void **)(v9 + 40);
      }

      else
      {
        qword_18C46BA68 = *(void *)(v9 + 40);
      }

      void *v19 = v18;
      --shared_num_unused;
    }

    int v21 = v17 + 1;
    goto LABEL_68;
  }

LABEL_33:
  if (v4 == 3) {
    uint64_t v10 = "iconv_none";
  }
  else {
    uint64_t v10 = "iconv_std";
  }
  size_t v11 = strlen(__str);
  int v12 = malloc(v11 + 97);
  if (v12)
  {
    uint64_t v9 = (uint64_t)v12;
    v12[6] = 0LL;
    uint64_t v13 = (void **)(v12 + 6);
    unsigned int v14 = v12 + 12;
    *(void *)uint64_t v9 = 0LL;
    *(void *)(v9 + 8) = 0LL;
    *(void *)(v9 + 64) = v14;
    memcpy(v14, __str, v11 + 1);
    uint64_t module = _citrus_load_module(v13, v10);
    if (!(_DWORD)module)
    {
      getops = (uint64_t (*)(void))_citrus_find_getops(*v13, v10, "iconv");
      if (getops)
      {
        int v23 = getops;
        uint64_t v24 = malloc(0x28uLL);
        *(void *)uint64_t v9 = v24;
        if (v24)
        {
          uint64_t module = v23();
          if (!(_DWORD)module)
          {
            uint64_t v25 = *(uint64_t (***)(uint64_t, char *, char *))v9;
            int v26 = **(uint64_t (***)(uint64_t, char *, char *))v9;
            if (v26 && v25[1] && v25[2] && v25[3] && v25[4])
            {
              uint64_t module = v26(v9, __big, __s);
              if (!(_DWORD)module) {
                goto LABEL_51;
              }
            }

            else
            {
              uint64_t module = 22LL;
            }
          }
        }

        else
        {
          uint64_t module = *__error();
        }
      }

      else
      {
        uint64_t module = 102LL;
      }
    }

    uint64_t v15 = *v13;
    if (*v13)
    {
      uint64_t v16 = *(uint64_t (***)(uint64_t, char *, char *))v9;
      if (*(void *)v9)
      {
        if (*(void *)(v9 + 8))
        {
          ((void (*)(uint64_t))v16[1])(v9);
          uint64_t v16 = *(uint64_t (***)(uint64_t, char *, char *))v9;
        }

        free(v16);
        uint64_t v15 = *v13;
      }

      _citrus_unload_module(v15);
    }

    free((void *)v9);
    if ((_DWORD)module) {
      goto LABEL_45;
    }
  }

  else
  {
    uint64_t module = *__error();
    if ((_DWORD)module)
    {
LABEL_45:
      pthread_rwlock_unlock(&ci_lock);
      return module;
    }
  }

  uint64_t v9 = 0LL;
LABEL_51:
  uint64_t v20 = *v8;
  *(void *)(v9 + 16) = *v8;
  if (v20) {
    *(void *)(v20 + 24) = v9 + 16;
  }
  *int v8 = v9;
  *(void *)(v9 + 24) = v8;
  int v21 = 1;
LABEL_68:
  *(_DWORD *)(v9 + 56) = v21;
  pthread_rwlock_unlock(&ci_lock);
  int v27 = *a1;
  if (*a1)
  {
    uint64_t v28 = 0LL;
  }

  else
  {
    unint64_t v29 = malloc(0x20uLL);
    if (!v29)
    {
      uint64_t module = *__error();
      release_shared(v9);
      return module;
    }

    int v27 = v29;
    *a1 = v29;
    uint64_t v28 = v29;
  }

  void *v27 = v9;
  uint64_t module = (*(uint64_t (**)(void *))(*(void *)v9 + 16LL))(v27);
  v27[2] = 0LL;
  *((_DWORD *)v27 + 6) = v4;
  if ((_DWORD)module)
  {
    release_shared(v9);
    free(v28);
  }

  return module;
}

uint64_t release_shared(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56) - 1;
  *(_DWORD *)(a1 + 56) = v2;
  if (!v2)
  {
    int v3 = shared_num_unused;
    int v4 = ++shared_num_unused;
    *(void *)(a1 + 32) = 0LL;
    unsigned __int8 v5 = (void *)qword_18C46BA68;
    *(void *)(a1 + 40) = qword_18C46BA68;
    *unsigned __int8 v5 = a1;
    qword_18C46BA68 = a1 + 32;
    int v6 = shared_max_reuse;
    if (v3 >= shared_max_reuse)
    {
      do
      {
        unsigned int v7 = (void *)shared_unused;
        uint64_t v8 = *(void *)(shared_unused + 32);
        uint64_t v9 = *(void **)(shared_unused + 40);
        if (v8)
        {
          *(void *)(v8 + 40) = v9;
          uint64_t v9 = (void *)v7[5];
        }

        else
        {
          qword_18C46BA68 = *(void *)(shared_unused + 40);
        }

        *uint64_t v9 = v8;
        uint64_t v10 = v7[2];
        if (v10) {
          *(void *)(v10 + 24) = v7[3];
        }
        *(void *)v7[3] = v10;
        shared_num_unused = --v4;
        size_t v11 = (void *)v7[6];
        if (v11)
        {
          int v12 = (void (**)(void))*v7;
          if (*v7)
          {
            if (v7[1])
            {
              ((void (**)(void *))v12)[1](v7);
              int v12 = (void (**)(void))*v7;
            }

            free(v12);
            size_t v11 = (void *)v7[6];
          }

          _citrus_unload_module(v11);
          int v4 = shared_num_unused;
          int v6 = shared_max_reuse;
        }

        free(v7);
      }

      while (v4 > v6);
    }
  }

  return pthread_rwlock_unlock(&ci_lock);
}

void _citrus_iconv_close(uint64_t *a1)
{
  if (a1)
  {
    (*(void (**)(void))(*(void *)*a1 + 24LL))();
    release_shared(*a1);
    free(a1);
  }

char *_citrus_iconv_canonicalize(uint64_t a1)
{
  int v2 = (char *)calloc(0x400uLL, 1uLL);
  if (v2) {
    _citrus_esdb_alias(a1, v2, 0x400uLL);
  }
  return v2;
}

uint64_t _citrus_lookup_factory_convert()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  int v2 = v1;
  int v3 = (FILE *)v0;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v4 = _citrus_db_factory_create(&v18, (uint64_t)_citrus_db_hash_std, 0LL);
  if (!(_DWORD)v4)
  {
    while (1)
    {
      unsigned __int8 v5 = fgetln(v2, &__n);
      int v6 = (size_t *)v18;
      if (!v5) {
        break;
      }
      unsigned int v7 = (unsigned __int8 *)v5;
      size_t v19 = __n;
      uint64_t v8 = memchr(v5, 35, __n);
      if (v8) {
        size_t v19 = v8 - v7;
      }
      uint64_t v9 = _citrus_bcs_skip_ws_len(v7, (uint64_t *)&v19);
      if (v19)
      {
        uint64_t v10 = (const char *)v9;
        size_t v11 = _citrus_bcs_skip_nonws_len(v9, (uint64_t *)&v19);
        if (v11 != (unsigned __int8 *)v10)
        {
          int v12 = v11;
          snprintf(__str, 0x800uLL, "%.*s", (_DWORD)v11 - (_DWORD)v10, v10);
          _citrus_bcs_convert_to_lower((unsigned __int8 *)__str);
          uint64_t v13 = _citrus_bcs_skip_ws_len(v12, (uint64_t *)&v19);
          _citrus_bcs_trunc_rws_len((uint64_t)v13, &v19);
          snprintf((char *)&__ptr, 0x800uLL, "%.*s", v19, (const char *)v13);
          uint64_t v4 = _citrus_db_factory_add_string_by_string((uint64_t)v6, __str, (char *)&__ptr);
          if ((_DWORD)v4)
          {
            _citrus_db_factory_free((void ***)v18);
            return v4;
          }
        }
      }
    }

    size_t v14 = _citrus_db_factory_calc_size(v18);
    uint64_t v15 = malloc(v14);
    if (v15)
    {
      __ptr = v15;
      size_t __size = v14;
      uint64_t v4 = _citrus_db_factory_serialize(v6, (uint64_t)"LOOKUP", (uint64_t)&__ptr);
    }

    else
    {
      uint64_t v4 = *__error();
    }

    _citrus_db_factory_free((void ***)v18);
    if (!(_DWORD)v4)
    {
      if (fwrite(__ptr, __size, 1uLL, v3) == 1) {
        return 0LL;
      }
      else {
        return *__error();
      }
    }
  }

  return v4;
}

uint64_t _citrus_lookup_seq_open(void *a1, char *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v6 = malloc(0x68uLL);
  if (!v6) {
    return *__error();
  }
  unsigned int v7 = v6;
  v6[7] = 0LL;
  v6[8] = 0LL;
  *((_DWORD *)v6 + 12) = a3;
  snprintf(__str, 0x400uLL, "%s.db", a2);
  uint64_t v8 = _citrus_map_file(&v13, __str);
  if (!(_DWORD)v8)
  {
    uint64_t v9 = _citrus_db_open(v7, (uint64_t)&v13, "LOOKUP", (uint64_t)_citrus_db_hash_std, 0LL);
    if (!(_DWORD)v9)
    {
      *(_OWORD *)(v7 + 1) = v13;
      *((_DWORD *)v7 + 6) = _citrus_db_get_number_of_entries(*v7);
      *((_DWORD *)v7 + 7) = 0;
      *((_DWORD *)v7 + 13) = 1;
      v7[9] = seq_next_db;
      v7[10] = seq_lookup_db;
      uint64_t v10 = seq_get_num_entries_db;
      size_t v11 = seq_close_db;
      goto LABEL_11;
    }

    uint64_t v8 = v9;
    _citrus_unmap_file((uint64_t)&v13);
  }

  if ((_DWORD)v8 == 2)
  {
    uint64_t v8 = _citrus_map_file(v7, a2);
    if (!(_DWORD)v8)
    {
      *((_DWORD *)v7 + 13) = 1;
      v7[9] = seq_next_plain;
      v7[10] = seq_lookup_plain;
      uint64_t v10 = seq_get_num_entries_plain;
      size_t v11 = (void *(*)(void **))seq_close_plain;
LABEL_11:
      v7[11] = v10;
      v7[12] = v11;
      uint64_t v8 = 0LL;
      *a1 = v7;
      return v8;
    }
  }

  free(v7);
  return v8;
}

void _citrus_lookup_seq_rewind(uint64_t a1)
{
  *(_DWORD *)(a1 + 52) = 1;
  free(*(void **)(a1 + 56));
  *(void *)(a1 + 56) = 0LL;
  *(void *)(a1 + 64) = 0LL;
}

uint64_t _citrus_lookup_seq_next(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t _citrus_lookup_seq_lookup(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t _citrus_lookup_get_number_of_entries(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 88))();
}

void _citrus_lookup_seq_close(uint64_t a1)
{
}

char *_citrus_lookup_simple(char *a1, uint64_t a2, char *a3, size_t a4, int a5)
{
  uint64_t v8 = v12;
  else {
    snprintf(a3, a4, "%.*s", v11, v10);
  }
  free(*(void **)(v8 + 56));
  (*(void (**)(uint64_t))(v8 + 96))(v8);
  free((void *)v8);
  return a3;
}

uint64_t seq_lookup_db(uint64_t a1, const char *a2, void *a3)
{
  *(_DWORD *)(a1 + 52) = 0;
  free(*(void **)(a1 + 56));
  int v6 = (unsigned __int8 *)strdup(a2);
  unsigned int v7 = (char *)v6;
  *(void *)(a1 + 56) = v6;
  if (*(_DWORD *)(a1 + 48))
  {
    _citrus_bcs_convert_to_lower(v6);
    unsigned int v7 = *(char **)(a1 + 56);
  }

  *(void *)(a1 + 64) = strlen(v7);
  *(_DWORD *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0LL;
  return _citrus_db_lookup_by_string(*(uint64_t **)a1, v7, a3, a1 + 32);
}

uint64_t seq_next_db(uint64_t a1, char **a2, void *a3)
{
  int v6 = *(char **)(a1 + 56);
  if (v6)
  {
    if (a2)
    {
      unsigned int v7 = *(char **)(a1 + 64);
      *a2 = v6;
      a2[1] = v7;
    }

    return _citrus_db_lookup_by_string(*(uint64_t **)a1, v6, a3, a1 + 32);
  }

  else
  {
    if (*(_DWORD *)(a1 + 52))
    {
      signed int v9 = 0;
      *(_DWORD *)(a1 + 28) = 0;
    }

    else
    {
      signed int v9 = *(_DWORD *)(a1 + 28);
    }

    *(_DWORD *)(a1 + 52) = 0;
    if (v9 >= *(_DWORD *)(a1 + 24))
    {
      return 2LL;
    }

    else
    {
      uint64_t v10 = *(uint64_t **)a1;
      *(_DWORD *)(a1 + 28) = v9 + 1;
      return _citrus_db_get_entry(v10, v9, a2, a3);
    }
  }

uint64_t seq_get_num_entries_db(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

void *seq_close_db(void **a1)
{
  uint64_t v1 = (uint64_t)(a1 + 1);
  _citrus_db_close(*a1);
  return _citrus_unmap_file(v1);
}

uint64_t seq_next_plain(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  if (*(_DWORD *)(a1 + 52))
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)a1;
    *(void *)(a1 + 32) = 0LL;
  }

  *(_DWORD *)(a1 + 52) = 0;
  unint64_t v6 = _citrus_memory_stream_getln((void *)(a1 + 16), &__n);
  if (!v6) {
    return 2LL;
  }
  unsigned int v7 = (void *)v6;
  while (1)
  {
    uint64_t v8 = memchr(v7, 35, __n);
    if (v8) {
      size_t __n = v8 - (_BYTE *)v7;
    }
    _citrus_bcs_trunc_rws_len((uint64_t)v7, &__n);
    signed int v9 = _citrus_bcs_skip_ws_len((unsigned __int8 *)v7, (uint64_t *)&__n);
    uint64_t v10 = _citrus_bcs_skip_nonws_len(v9, (uint64_t *)&__n);
    if (v9 != v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(const void **)(a1 + 56);
      if (!v12 || v10 - v9 == *(void *)(a1 + 64) && !memcmp(v9, v12, v10 - v9)) {
        break;
      }
    }

    unsigned int v7 = (void *)_citrus_memory_stream_getln((void *)(a1 + 16), &__n);
    if (!v7) {
      return 2LL;
    }
  }

  if (a2)
  {
    *a2 = v9;
    a2[1] = (unsigned __int8 *)(v11 - v9);
  }

  size_t v14 = _citrus_bcs_skip_ws_len(v11, (uint64_t *)&__n);
  if (!a3) {
    return 0LL;
  }
  uint64_t v15 = v14;
  uint64_t result = 0LL;
  size_t v16 = __n;
  if (!__n) {
    uint64_t v15 = 0LL;
  }
  *a3 = v15;
  a3[1] = (unsigned __int8 *)v16;
  return result;
}

uint64_t seq_lookup_plain(uint64_t a1, const char *a2, void *a3)
{
  *(_DWORD *)(a1 + 52) = 0;
  free(*(void **)(a1 + 56));
  unint64_t v6 = (unsigned __int8 *)strdup(a2);
  unsigned int v7 = (char *)v6;
  *(void *)(a1 + 56) = v6;
  if (*(_DWORD *)(a1 + 48))
  {
    _citrus_bcs_convert_to_lower(v6);
    unsigned int v7 = *(char **)(a1 + 56);
  }

  *(void *)(a1 + 64) = strlen(v7);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a1;
  *(void *)(a1 + 32) = 0LL;
  uint64_t v8 = _citrus_memory_stream_matchline((void *)(a1 + 16), v7, &v12, 0);
  if (!v8) {
    return 2LL;
  }
  if (!a3) {
    return 0LL;
  }
  signed int v9 = v8;
  uint64_t result = 0LL;
  size_t v11 = v12;
  *a3 = v9;
  a3[1] = v11;
  return result;
}

uint64_t seq_get_num_entries_plain(uint64_t a1)
{
  LODWORD(v2) = -1;
  do
    uint64_t v2 = (v2 + 1);
  while (!seq_next_plain(a1, 0LL, 0LL));
  return v2;
}

uint64_t _citrus_mapper_create_area(void *a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  pthread_rwlock_wrlock(&cm_lock);
  if (*a1)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    snprintf(__str, 0x400uLL, "%s/%s", a2, "mapper.dir");
    uint64_t v4 = stat(__str, &v9);
    if (!(_DWORD)v4)
    {
      unint64_t v6 = malloc(0x330uLL);
      if (v6)
      {
        unsigned int v7 = v6;
        uint64_t v8 = strdup(a2);
        v7[101] = v8;
        if (v8)
        {
          bzero(v7, 0x328uLL);
          uint64_t v4 = 0LL;
          *a1 = v7;
        }

        else
        {
          uint64_t v4 = *__error();
          free(v7);
        }
      }

      else
      {
        uint64_t v4 = *__error();
      }
    }
  }

  pthread_rwlock_unlock(&cm_lock);
  return v4;
}

uint64_t mapper_open(uint64_t a1, void ***a2, const char *a3, const char *a4)
{
  uint64_t v8 = (void **)malloc(0x48uLL);
  if (!v8) {
    return *__error();
  }
  stat v9 = v8;
  *((_OWORD *)v8 + 1) = 0u;
  uint64_t v10 = v8 + 2;
  *((_DWORD *)v8 + 12) = 0;
  v8[7] = 0LL;
  *((_DWORD *)v8 + 16) = 0;
  *(_OWORD *)uint64_t v8 = 0u;
  uint64_t module = _citrus_load_module(v8 + 2, a3);
  if (!(_DWORD)module)
  {
    getops = (uint64_t (*)(void))_citrus_find_getops(*v10, a3, "mapper");
    if (!getops)
    {
      uint64_t module = 102LL;
      goto LABEL_3;
    }

    size_t v14 = getops;
    uint64_t v15 = malloc(0x20uLL);
    *stat v9 = v15;
    if (v15)
    {
      uint64_t module = v14();
      if ((_DWORD)module) {
        goto LABEL_3;
      }
      size_t v16 = *v9;
      int v17 = *(uint64_t (**)(uint64_t, void **, void, const char *, size_t, void *, uint64_t))*v9;
      if (!v17 || !v16[1] || !v16[2] || !v16[3])
      {
        uint64_t module = 22LL;
        goto LABEL_3;
      }

      uint64_t v18 = malloc(0x18uLL);
      v9[3] = v18;
      if (v18)
      {
        size_t v19 = v18;
        size_t v20 = strlen(a4);
        uint64_t module = v17(a1, v9, *(void *)(a1 + 808), a4, v20 + 1, v19, 24LL);
        if (!(_DWORD)module)
        {
          *a2 = v9;
          return module;
        }

        goto LABEL_3;
      }
    }

    uint64_t module = *__error();
  }

LABEL_3:
  mapper_close(v9);
  return module;
}

uint64_t _citrus_mapper_get_mapdir_from_key(const char *a1)
{
  if (!strncmp(a1, "UCS:", 4uLL) || !strncmp(a1, "UCS/", 4uLL)) {
    return 1LL;
  }
  uint64_t result = (uint64_t)strchr(a1, 47);
  if (result)
  {
    int v3 = (const char *)(result + 1);
    else {
      return 2 * (strncmp(v3, "UCS:", 4uLL) == 0);
    }
  }

  return result;
}

uint64_t _citrus_mapper_open(uint64_t a1, void ***a2, char *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  pthread_rwlock_wrlock(&cm_lock);
  unint64_t v6 = (void ***)(a1 + 8LL * (int)_string_hash_func(a3, 0x65u));
  unsigned int v7 = *v6;
  if (!*v6)
  {
LABEL_4:
    uint64_t v8 = *(const char **)(a1 + 808);
    int v21 = 0LL;
    snprintf(__str, 0x400uLL, "%s/%s", v8, "mapper.dir");
    uint64_t v9 = _citrus_map_file(&v25, __str);
    if ((_DWORD)v9)
    {
      uint64_t v10 = v9;
      goto LABEL_20;
    }

    __int128 v23 = v25;
    uint64_t v24 = 0LL;
    uint64_t v11 = (unsigned __int8 *)_citrus_memory_stream_matchline(&v23, a3, (size_t *)&v22, 0);
    if (v11)
    {
      if ((unint64_t)(v22 - 1024) > 0xFFFFFFFFFFFFFC00LL)
      {
        size_t v12 = v11;
        __int128 v13 = _citrus_bcs_skip_nonws_len(v11, &v22);
        uint64_t v14 = v13 - v12 + 1;
        __strlcpy_chk();
        uint64_t v15 = _citrus_bcs_skip_ws_len(v13, &v22);
        strlcpy(&v26[v14], (const char *)v15, v22 + 1);
        _citrus_unmap_file((uint64_t)&v25);
        pthread_rwlock_unlock(&cm_lock);
        uint64_t v10 = mapper_open(a1, &v21, v26, &v26[v14]);
        pthread_rwlock_wrlock(&cm_lock);
        if (!(_DWORD)v10)
        {
          size_t v16 = strdup(a3);
          int v17 = v21;
          v21[7] = v16;
          if (v16)
          {
            *((_DWORD *)v17 + 12) = 1;
            if (!*((_DWORD *)v17 + 16))
            {
              int mapdir_from_key = _citrus_mapper_get_mapdir_from_key(v16);
              *((_DWORD *)v17 + 16) = mapdir_from_key;
              if (((mapdir_from_key + 3) & mapdir_from_key) != 0) {
                _citrus_mapper_open_cold_1();
              }
            }

            size_t v19 = *v6;
            v17[4] = *v6;
            if (v19) {
              v19[5] = v17 + 4;
            }
            uint64_t v10 = 0LL;
            *unint64_t v6 = v17;
            v17[5] = v6;
            *a2 = v17;
          }

          else
          {
            uint64_t v10 = *__error();
            _citrus_mapper_close((uint64_t)v17);
          }
        }

        goto LABEL_20;
      }

      uint64_t v10 = 22LL;
    }

    else
    {
      uint64_t v10 = 2LL;
    }

    _citrus_unmap_file((uint64_t)&v25);
    goto LABEL_20;
  }

  while (strcmp((const char *)v7[7], a3))
  {
    unsigned int v7 = (void **)v7[4];
    if (!v7) {
      goto LABEL_4;
    }
  }

  uint64_t v10 = 0LL;
  ++*((_DWORD *)v7 + 12);
  *a2 = v7;
LABEL_20:
  pthread_rwlock_unlock(&cm_lock);
  return v10;
}

void _citrus_mapper_close(uint64_t a1)
{
  if (a1)
  {
    pthread_rwlock_wrlock(&cm_lock);
    int v2 = *(_DWORD *)(a1 + 48);
    if (v2 != -1)
    {
      BOOL v3 = __OFSUB__(v2, 1);
      int v4 = v2 - 1;
      if (v4 < 0 != v3)
      {
LABEL_8:
        pthread_rwlock_unlock(&cm_lock);
        mapper_close((void *)a1);
        return;
      }

      *(_DWORD *)(a1 + 48) = v4;
      if (!v4)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        if (v5) {
          *(void *)(v5 + 40) = *(void *)(a1 + 40);
        }
        **(void **)(a1 + 40) = v5;
        free(*(void **)(a1 + 56));
        goto LABEL_8;
      }
    }

    pthread_rwlock_unlock(&cm_lock);
  }

void mapper_close(void *a1)
{
  int v2 = (void *)*((void *)a1 + 2);
  if (v2)
  {
    BOOL v3 = *(void (***)(void))a1;
    if (*(void *)a1)
    {
      if (*((void *)a1 + 1))
      {
        ((void (**)(void *))v3)[1](a1);
        BOOL v3 = *(void (***)(void))a1;
      }

      free(v3);
      int v2 = (void *)*((void *)a1 + 2);
    }

    _citrus_unload_module(v2);
  }

  free(*((void **)a1 + 3));
  free(a1);
}

uint64_t _citrus_mapper_set_persistent(uint64_t a1)
{
  *(_DWORD *)(a1 + 48) = -1;
  return pthread_rwlock_unlock(&cm_lock);
}

unint64_t _citrus_memory_stream_getln(void *a1, unint64_t *a2)
{
  unint64_t v3 = a1[1];
  unint64_t v2 = a1[2];
  if (v3 <= v2) {
    return 0LL;
  }
  unint64_t v4 = *a1 + v2;
  unint64_t v5 = v3 - v2;
  if (v5)
  {
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = v6 + 1;
      int v8 = *(unsigned __int8 *)(v4 + v6);
      if (v8 == 10 || v8 == 13) {
        break;
      }
      unint64_t v6 = v7;
      if (v5 == v7) {
        goto LABEL_12;
      }
    }

    unint64_t v5 = v7;
  }

LABEL_12:
  a1[2] = v5 + v2;
  *a2 = v5;
  return v4;
}

void *_citrus_memory_stream_matchline(void *a1, char *__s, size_t *a3, int a4)
{
  size_t v8 = strlen(__s);
  uint64_t result = (void *)_citrus_memory_stream_getln(a1, &__n);
  if (result)
  {
    uint64_t v10 = result;
    do
    {
      uint64_t v11 = memchr(v10, 35, __n);
      if (v11) {
        size_t __n = v11 - (_BYTE *)v10;
      }
      _citrus_bcs_trunc_rws_len((uint64_t)v10, &__n);
      if (__n)
      {
        size_t v12 = _citrus_bcs_skip_ws_len((unsigned __int8 *)v10, (uint64_t *)&__n);
        __int128 v13 = _citrus_bcs_skip_nonws_len(v12, (uint64_t *)&__n);
        if (v13 - v12 == v8)
        {
          uint64_t v14 = v13;
          if (a4)
          {
            if (!memcmp(__s, v12, v8)) {
              goto LABEL_13;
            }
          }

          else if (!_citrus_bcs_strncasecmp(__s, (char *)v12, v8))
          {
LABEL_13:
            uint64_t result = _citrus_bcs_skip_ws_len(v14, (uint64_t *)&__n);
            *a3 = __n;
            return result;
          }
        }
      }

      uint64_t result = (void *)_citrus_memory_stream_getln(a1, &__n);
      uint64_t v10 = result;
    }

    while (result);
  }

  return result;
}

char *_citrus_memory_stream_chr(void *a1, unint64_t *a2, int __c)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[2];
  if (v4 >= v3) {
    return 0LL;
  }
  unint64_t v7 = *a1 + v4;
  BOOL v8 = v3 >= v4;
  size_t v9 = v3 - v4;
  if (v8) {
    size_t v10 = v9;
  }
  else {
    size_t v10 = 0LL;
  }
  uint64_t result = (char *)memchr((const void *)(*a1 + v4), __c, v10);
  *a2 = v7;
  if (result)
  {
    a2[1] = (unint64_t)&result[-v7];
    uint64_t v12 = (uint64_t)&result[v4 - v7 + 1];
  }

  else
  {
    a2[1] = v10;
    uint64_t v12 = a1[1];
  }

  a1[2] = v12;
  return result;
}

uint64_t *_citrus_memory_stream_skip_ws(uint64_t *result)
{
  unint64_t v1 = result[1];
  unint64_t v2 = result[2];
  if (v2 < v1)
  {
    uint64_t v3 = *result;
    do
    {
      int v4 = *(unsigned __int8 *)(v3 + v2);
      result[2] = ++v2;
    }

    while (v1 != v2);
  }

  return result;
}

uint64_t _citrus_map_file(void *a1, char *a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  int v3 = open(a2, 0x1000000);
  if (v3 != -1)
  {
    int v4 = v3;
    if (fstat(v3, &v9) == -1) {
      goto LABEL_7;
    }
    if ((v9.st_mode & 0xF000) != 0x8000)
    {
      uint64_t v6 = 102LL;
      goto LABEL_9;
    }

    unint64_t v5 = mmap(0LL, v9.st_size, 1, 2, v4, 0LL);
    if (v5 == (void *)-1LL)
    {
LABEL_7:
      uint64_t v6 = *__error();
    }

    else
    {
      uint64_t v6 = 0LL;
      off_t st_size = v9.st_size;
      *a1 = v5;
      a1[1] = st_size;
    }

LABEL_9:
    close(v4);
    return v6;
  }

  return *__error();
}

void *_citrus_unmap_file(uint64_t a1)
{
  uint64_t result = *(void **)a1;
  if (result)
  {
    uint64_t result = (void *)munmap(result, *(void *)(a1 + 8));
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
  }

  return result;
}

void *_citrus_find_getops(void *a1, const char *a2, const char *a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x400uLL, "_citrus_%s_%s_getops", a2, a3);
  return dlsym(a1, __str);
}

uint64_t _citrus_load_module(void *a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!_pathI18nModule)
  {
    int v4 = getenv("PATH_I18NMODULE");
    if (v4 && (unint64_t v5 = v4, !issetugid()))
    {
      _pathI18nModule = (uint64_t)strdup(v5);
      if (!_pathI18nModule) {
        return 12LL;
      }
    }

    else
    {
      _pathI18nModule = (uint64_t)"/usr/lib/i18n";
    }
  }

  snprintf(__str, 0x400uLL, "lib%s", a2);
  _findshlib_path = 0;
  unsigned int v6 = snprintf(&_findshlib_path, 0x400uLL, "%s/%s.dylib", (const char *)_pathI18nModule, __str);
  uint64_t result = 22LL;
  if (v6 <= 0x3FF && _findshlib_path)
  {
    BOOL v8 = dlopen(&_findshlib_path, 1);
    if (v8)
    {
      stat v9 = v8;
      uint64_t result = 0LL;
      *a1 = v9;
    }

    else
    {
      size_t v10 = dlerror();
      printf("%s", v10);
      return 22LL;
    }
  }

  return result;
}

void *_citrus_unload_module(void *result)
{
  if (result)
  {
    return (void *)dlclose(result);
  }

  return result;
}

uint64_t _citrus_NONE_stdenc_init(uint64_t a1, char *a2, unint64_t a3, uint64_t a4)
{
  BOOL v8 = calloc(1uLL, 4uLL);
  if (!v8) {
    return *__error();
  }
  for (uint64_t i = v8; a3; --a3)
  {
    char v10 = *a2;
    if (a3 >= 4 && v10 == 55 && !_citrus_bcs_strncasecmp(a2, "7bit", 4LL))
    {
      _DWORD *i = 2139062143;
      a2 += 4;
      a3 -= 4LL;
    }

    ++a2;
  }

  if (!*i) {
    _DWORD *i = -1;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 8) = i;
  *(void *)(a4 + 16) = 1LL;
  *(_OWORD *)a4 = xmmword_1818FCAA0;
  return result;
}

void _citrus_NONE_stdenc_uninit(uint64_t a1)
{
}

uint64_t _citrus_NONE_stdenc_mbtocs( uint64_t a1, _DWORD *a2, _DWORD *a3, void *a4, uint64_t a5, uint64_t a6, BOOL *a7, void (**a8)(void))
{
  if (a5)
  {
    *a2 = 0;
    BOOL v8 = (_BYTE *)(*a4)++;
    int v9 = *v8;
    BOOL v10 = *v8 != 0;
    *a3 = v9;
    *a7 = v10;
    if (a8 && *a8) {
      (*a8)();
    }
  }

  else
  {
    *a7 = -2LL;
  }

  return 0LL;
}

uint64_t _citrus_NONE_stdenc_cstomb( uint64_t a1, uint64_t a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  if (a4 != -1)
  {
    if (a4 || (a5 & ~**(_DWORD **)(a1 + 8)) != 0) {
      return 92LL;
    }
    if (a5 > 0xFF)
    {
      if (HIWORD(a5))
      {
        if (HIBYTE(a5))
        {
          if (a3 >= 4)
          {
            uint64_t result = 0LL;
            *(_DWORD *)a2 = a5;
            uint64_t v8 = 4LL;
            goto LABEL_6;
          }
        }

        else if (a3 >= 3)
        {
          uint64_t result = 0LL;
          *(_WORD *)a2 = a5;
          *(_BYTE *)(a2 + 2) = BYTE2(a5);
          uint64_t v8 = 3LL;
          goto LABEL_6;
        }
      }

      else if (a3 >= 2)
      {
        uint64_t result = 0LL;
        *(_WORD *)a2 = a5;
        uint64_t v8 = 2LL;
        goto LABEL_6;
      }
    }

    else if (a3)
    {
      uint64_t result = 0LL;
      *(_BYTE *)a2 = a5;
      uint64_t v8 = 1LL;
      goto LABEL_6;
    }

    uint64_t result = 7LL;
    uint64_t v8 = -1LL;
    goto LABEL_6;
  }

  uint64_t v8 = 0LL;
  uint64_t result = 0LL;
LABEL_6:
  *a7 = v8;
  return result;
}

uint64_t _citrus_NONE_stdenc_mbtowc( uint64_t a1, _DWORD *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  if (*a3)
  {
    if (a4)
    {
      int v7 = *(unsigned __int8 *)*a3;
      if (a2) {
        *a2 = v7;
      }
      *a6 = v7 != 0;
      if (a7)
      {
        uint64_t v8 = *(void (**)(void, void))(a7 + 8);
        if (v8) {
          v8(*a2, *(void *)(a7 + 16));
        }
      }
    }

    else
    {
      *a6 = -2LL;
    }
  }

  else
  {
    *a6 = 0LL;
  }

  return 0LL;
}

uint64_t _citrus_NONE_stdenc_wctomb( uint64_t a1, _BYTE *a2, uint64_t a3, unsigned int a4, uint64_t a5, void *a6)
{
  if (a4 >= 0x100)
  {
    *a6 = -1LL;
    return 92LL;
  }

  else if (a3)
  {
    *a6 = 1LL;
    uint64_t result = 0LL;
    if (a2) {
      *a2 = a4;
    }
  }

  else
  {
    *a6 = -1LL;
    return 7LL;
  }

  return result;
}

uint64_t _citrus_NONE_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0LL;
  return 0LL;
}

uint64_t _citrus_NONE_stdenc_get_state_desc(uint64_t a1, uint64_t a2, int a3, _DWORD *a4)
{
  if (a3) {
    return 102LL;
  }
  uint64_t result = 0LL;
  *a4 = 1;
  return result;
}

uint64_t _citrus_pivot_factory_convert()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  unint64_t v2 = v1;
  int v3 = (FILE *)v0;
  v40[256] = *MEMORY[0x1895F89C0];
  uint64_t v33 = 0LL;
  unint64_t v34 = &v33;
  while (1)
  {
    int v4 = fgetln(v2, &__n);
    if (!v4) {
      break;
    }
    unint64_t v5 = (unsigned __int8 *)v4;
    size_t v36 = __n;
    unsigned int v6 = memchr(v4, 35, __n);
    if (v6) {
      size_t v36 = v6 - v5;
    }
    int v7 = _citrus_bcs_skip_ws_len(v5, (uint64_t *)&v36);
    if (v36)
    {
      uint64_t v8 = (const char *)v7;
      int v9 = _citrus_bcs_skip_nonws_len(v7, (uint64_t *)&v36);
      if (v9 != (unsigned __int8 *)v8)
      {
        BOOL v10 = v9;
        snprintf((char *)v40, 0x800uLL, "%.*s", (_DWORD)v9 - (_DWORD)v8, v8);
        uint64_t v11 = _citrus_bcs_skip_ws_len(v10, (uint64_t *)&v36);
        if (v36)
        {
          uint64_t v12 = (const char *)v11;
          __int128 v13 = _citrus_bcs_skip_nonws_len(v11, (uint64_t *)&v36);
          if (v13 != (unsigned __int8 *)v12)
          {
            uint64_t v14 = v13;
            snprintf(__str, 0x800uLL, "%.*s", (_DWORD)v13 - (_DWORD)v12, v12);
            uint64_t v15 = _citrus_bcs_skip_ws_len(v14, (uint64_t *)&v36);
            _citrus_bcs_trunc_rws_len((uint64_t)v15, &v36);
            snprintf((char *)v37, 0x800uLL, "%.*s", v36, (const char *)v15);
            unsigned int v16 = strtoul((const char *)v37, &__endptr, 0);
            if (*__endptr)
            {
              uint64_t v22 = 79LL;
              goto LABEL_35;
            }

            unsigned int v17 = v16;
            uint64_t v18 = v33;
            if (v33)
            {
              while (_citrus_bcs_strcasecmp(*(unsigned __int8 **)v18, (unsigned __int8 *)v40))
              {
                uint64_t v18 = *(void *)(v18 + 16);
                if (!v18) {
                  goto LABEL_13;
                }
              }
            }

            else
            {
LABEL_13:
              size_t v19 = malloc(0x18uLL);
              if (!v19)
              {
                uint64_t v22 = *__error();
                goto LABEL_35;
              }

              uint64_t v18 = (uint64_t)v19;
              size_t v20 = strdup((const char *)v40);
              *(void *)uint64_t v18 = v20;
              if (!v20)
              {
                uint64_t v22 = *__error();
                goto LABEL_34;
              }

              uint64_t v21 = _citrus_db_factory_create((void *)(v18 + 8), (uint64_t)_citrus_db_hash_std, 0LL);
              if ((_DWORD)v21)
              {
                uint64_t v22 = v21;
                free(*(void **)v18);
LABEL_34:
                free((void *)v18);
LABEL_35:
                free_src(&v33);
                return v22;
              }

              *(void *)(v18 + 16) = 0LL;
              *unint64_t v34 = v18;
              unint64_t v34 = (uint64_t *)(v18 + 16);
            }

            uint64_t v22 = _citrus_db_factory_add32_by_string(*(void *)(v18 + 8), __str, v17);
            if ((_DWORD)v22) {
              goto LABEL_35;
            }
          }
        }
      }
    }
  }

  uint64_t v23 = _citrus_db_factory_create(v37, (uint64_t)_citrus_db_hash_std, 0LL);
  if ((_DWORD)v23)
  {
    uint64_t v22 = v23;
    goto LABEL_35;
  }

  uint64_t v24 = v33;
  if (v33)
  {
    while (1)
    {
      size_t v25 = _citrus_db_factory_calc_size(*(void **)(v24 + 8));
      int v26 = malloc(v25);
      int v27 = v26;
      if (!v26) {
        break;
      }
      v40[0] = v26;
      v40[1] = v25;
      uint64_t v28 = _citrus_db_factory_serialize(*(size_t **)(v24 + 8), (uint64_t)"CSPIVSUB", (uint64_t)v40);
      if ((_DWORD)v28
        || (uint64_t v28 = _citrus_db_factory_add_by_string((uint64_t)v37[0], *(char **)v24, (uint64_t)v40, 1), (_DWORD)v28))
      {
        uint64_t v22 = v28;
        goto LABEL_39;
      }

      uint64_t v24 = *(void *)(v24 + 16);
      if (!v24) {
        goto LABEL_27;
      }
    }
  }

  else
  {
LABEL_27:
    size_t v29 = _citrus_db_factory_calc_size((void *)v37[0]);
    uint64_t v30 = malloc(v29);
    if (v30)
    {
      *(void *)__str = v30;
      size_t __size = v29;
      uint64_t v22 = _citrus_db_factory_serialize((size_t *)v37[0], (uint64_t)"CSPIVOT", (uint64_t)__str);
      int v27 = 0LL;
      goto LABEL_39;
    }

    int v27 = 0LL;
  }

  uint64_t v22 = 0LL;
LABEL_39:
  free(v27);
  _citrus_db_factory_free((void ***)v37[0]);
  free_src(&v33);
  if (!(_DWORD)v22)
  {
    else {
      return *__error();
    }
  }

  return v22;
}

void free_src(uint64_t *a1)
{
  for (uint64_t i = *a1; *a1; uint64_t i = *a1)
  {
    uint64_t v3 = *(void *)(i + 16);
    *a1 = v3;
    if (!v3) {
      a1[1] = (uint64_t)a1;
    }
    _citrus_db_factory_free(*(void ****)(i + 8));
    free(*(void **)i);
    free((void *)i);
  }

uint64_t _citrus_prop_parse_variable(unsigned __int8 **a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v25 = a3;
  unint64_t v26 = a4;
  unint64_t v27 = 0LL;
  _citrus_memory_stream_skip_ws(&v25);
  unint64_t v7 = v26;
  unint64_t v6 = v27;
  if (v27 >= v26) {
    return 0LL;
  }
  do
  {
    unint64_t v27 = v6 + 1;
    uint64_t v8 = v25;
    if (!*(_BYTE *)(v25 + v6)) {
      return 0LL;
    }
    uint64_t v9 = 0LL;
    unint64_t v27 = v6;
    do
    {
      if (v6 >= v7)
      {
        int v10 = -1;
      }

      else
      {
        unint64_t v27 = v6 + 1;
        int v10 = *(unsigned __int8 *)(v8 + v6++);
        if (v10 == 95) {
          goto LABEL_13;
        }
      }

LABEL_13:
      v32[v9++] = v10;
    }

    while (v9 != 256);
    if (v6 < v7)
    {
      unint64_t v27 = v6 + 1;
      int v10 = *(unsigned __int8 *)(v8 + v6);
      if (v10 != 95)
      {
        ++v6;
        goto LABEL_18;
      }

      return 22LL;
    }

    int v10 = -1;
LABEL_18:
    uint64_t v12 = 22LL;
    uint64_t v9 = 256LL;
LABEL_21:
    if (v10 != -1 && v6) {
      unint64_t v27 = v6 - 1;
    }
    v32[v9] = 0;
    __int128 v13 = *a1;
    if (!*a1) {
      return 22LL;
    }
    uint64_t v14 = a1 + 2;
    while (_citrus_bcs_strcasecmp(v32, v13))
    {
      __int128 v13 = v14[1];
      v14 += 3;
      if (!v13) {
        return 22LL;
      }
    }

    _citrus_memory_stream_skip_ws(&v25);
    unint64_t v15 = v27;
    if (v27 < v26)
    {
      ++v27;
      int v16 = *(unsigned __int8 *)(v25 + v15);
      if (v16 != 58 && v16 != 61) {
        unint64_t v27 = v15;
      }
    }

    uint64_t v17 = *((unsigned int *)v14 - 2);
    uint64_t v18 = (uint64_t (*)(uint64_t *, int *))*(&readers + v17);
    while (2)
    {
      int v30 = v17;
      unint64_t v31 = 0LL;
      int v28 = v17;
      size_t v29 = 0LL;
      uint64_t v19 = v18(&v25, &v30);
      if ((_DWORD)v19) {
        return v19;
      }
      _citrus_memory_stream_skip_ws(&v25);
      unint64_t v20 = v27;
      if (v27 >= v26) {
        goto LABEL_41;
      }
      ++v27;
      int v21 = *(unsigned __int8 *)(v25 + v20);
      if (v17 >= 2 && v21 == 45)
      {
        uint64_t v19 = v18(&v25, &v28);
        if ((_DWORD)v19) {
          return v19;
        }
        _citrus_memory_stream_skip_ws(&v25);
        unint64_t v22 = v27;
        if (v27 < v26)
        {
          ++v27;
          int v21 = *(unsigned __int8 *)(v25 + v22);
          goto LABEL_42;
        }

LABEL_41:
        int v21 = -1;
      }

LABEL_42:
      switch((int)v17)
      {
        case 0:
          uint64_t v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void))*v14)(a2, v13, v31);
          break;
        case 1:
          uint64_t v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void *))*v14)(a2, v13, v31);
          break;
        case 2:
          uint64_t v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void, void))*v14)( a2,  v13,  v31,  v29);
          break;
        case 3:
          uint64_t v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void *, void *))*v14)(a2, v13, v31, v29);
          break;
        default:
          abort();
      }

      uint64_t v12 = v23;
      if (v30 == 1) {
        free(v31);
      }
      if (v28 == 1) {
        free(v29);
      }
      if ((_DWORD)v12) {
        return v12;
      }
      if (v21 == 44) {
        continue;
      }
      break;
    }

    if (v21 != -1 && v21 != 59 && v27) {
      --v27;
    }
    _citrus_memory_stream_skip_ws(&v25);
    uint64_t v12 = 0LL;
    unint64_t v7 = v26;
    unint64_t v6 = v27;
  }

  while (v27 < v26);
  return v12;
}

uint64_t _citrus_prop_read_BOOL(uint64_t *a1, uint64_t a2)
{
  unint64_t v5 = a1[1];
  unint64_t v4 = a1[2];
  if (v4 >= v5)
  {
    char v6 = -1;
  }

  else
  {
    a1[2] = v4 + 1;
    char v6 = *(_BYTE *)(*a1 + v4++);
  }

  if (v6 == 102)
  {
    if (v4 >= v5)
    {
      char v8 = -1;
    }

    else
    {
      a1[2] = v4 + 1;
      char v8 = *(_BYTE *)(*a1 + v4++);
    }

    if (v8 == 97)
    {
      if (v4 >= v5)
      {
        char v10 = -1;
      }

      else
      {
        a1[2] = v4 + 1;
        char v10 = *(_BYTE *)(*a1 + v4++);
      }

      if (v10 == 108)
      {
        if (v4 >= v5)
        {
          char v12 = -1;
        }

        else
        {
          a1[2] = v4 + 1;
          char v12 = *(_BYTE *)(*a1 + v4++);
        }

        if (v12 == 115)
        {
          if (v4 >= v5)
          {
            char v14 = -1;
          }

          else
          {
            a1[2] = v4 + 1;
            char v14 = *(_BYTE *)(*a1 + v4);
          }

          if (v14 == 101)
          {
            char v13 = 0;
            goto LABEL_52;
          }
        }
      }
    }
  }

  else if (v6 == 116)
  {
    if (v4 >= v5)
    {
      char v7 = -1;
    }

    else
    {
      a1[2] = v4 + 1;
      char v7 = *(_BYTE *)(*a1 + v4++);
    }

    if (v7 == 114)
    {
      if (v4 >= v5)
      {
        char v9 = -1;
      }

      else
      {
        a1[2] = v4 + 1;
        char v9 = *(_BYTE *)(*a1 + v4++);
      }

      if (v9 == 117)
      {
        if (v4 >= v5)
        {
          char v11 = -1;
        }

        else
        {
          a1[2] = v4 + 1;
          char v11 = *(_BYTE *)(*a1 + v4);
        }

        if (v11 == 101)
        {
          char v13 = 1;
LABEL_52:
          uint64_t result = 0LL;
          *(_BYTE *)(a2 + 8) = v13;
          return result;
        }
      }
    }
  }

  return 22LL;
}

uint64_t _citrus_prop_read_str(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = malloc(0x200uLL);
  if (!v4) {
    return 12LL;
  }
  unint64_t v5 = v4;
  _citrus_memory_stream_skip_ws(a1);
  unint64_t v6 = a1[2];
  if (v6 >= a1[1])
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = 0LL;
    a1[2] = v6 + 1;
    int v8 = *(unsigned __int8 *)(*a1 + v6);
    uint64_t v9 = 512LL;
    if (v8 != 34 && v8 != 39)
    {
      if (v8 == 92)
      {
        uint64_t v7 = 0LL;
        a1[2] = v6;
        int v8 = -1;
        uint64_t v9 = 512LL;
      }

      else
      {
        *unint64_t v5 = v8;
        int v8 = -1;
        uint64_t v7 = 1LL;
        uint64_t v9 = 511LL;
      }
    }

    while (1)
    {
      unint64_t v11 = a1[2];
      if (v11 >= a1[1])
      {
        int v12 = -1;
      }

      else
      {
        a1[2] = v11 + 1;
        int v12 = *(unsigned __int8 *)(*a1 + v11++);
      }

      int v14 = v12;
      if (v12 != -1)
      {
        if (v11) {
          a1[2] = v11 - 1;
        }
      }

      _citrus_prop_read_character_common(a1, &v14);
      v5[v7++] = v14;
      if (!--v9)
      {
        char v10 = realloc(v5, v7 + 512);
        if (!v10)
        {
          free(v5);
          return 12LL;
        }

        unint64_t v5 = v10;
        uint64_t v9 = 512LL;
      }
    }
  }

  uint64_t result = 0LL;
  v5[v7] = 0;
  *(void *)(a2 + 8) = v5;
  return result;
}

uint64_t _citrus_prop_read_character(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = a1[2];
  if (v4 < a1[1])
  {
    a1[2] = v4 + 1;
    int v18 = *(unsigned __int8 *)(*a1 + v4);
    if (v18 == 39)
    {
      _citrus_prop_read_character_common(a1, &v18);
      *(_DWORD *)(a2 + 8) = v18;
      unint64_t v5 = a1[2];
      uint64_t result = 22LL;
      if (v5 < a1[1])
      {
        a1[2] = v5 + 1;
        if (*(_BYTE *)(*a1 + v5) == 39) {
          return 0LL;
        }
        else {
          return 22LL;
        }
      }

      return result;
    }

    a1[2] = v4;
  }

  _citrus_memory_stream_skip_ws(a1);
  unint64_t v7 = a1[1];
  unint64_t v8 = a1[2];
  if (v8 >= v7) {
    return 22LL;
  }
  int v9 = 0;
  unint64_t v10 = v8 + 1;
  a1[2] = v8 + 1;
  uint64_t v11 = *a1;
  int v12 = *(unsigned __int8 *)(*a1 + v8);
  if (v12 != 43)
  {
    if (v12 != 45) {
      goto LABEL_14;
    }
    int v9 = 1;
  }

  if (v10 >= v7) {
    return 22LL;
  }
  uint64_t v13 = v8 + 2;
  a1[2] = v13;
  int v12 = *(unsigned __int8 *)(v11 + v10);
  unint64_t v10 = v13;
LABEL_14:
  if (v12 != 48)
  {
    if ((v12 - 58) >= 0xFFFFFFF6)
    {
      unsigned int v17 = 10;
      unint64_t v14 = v10;
LABEL_31:
      a1[2] = v14 - 1;
      goto LABEL_32;
    }

    return 22LL;
  }

  if (v10 >= v7)
  {
    unsigned int v17 = 8;
    goto LABEL_32;
  }

  unint64_t v14 = v10 + 1;
  a1[2] = v10 + 1;
  if ((*(_BYTE *)(v11 + v10) & 0xDF) != 0x58)
  {
    unsigned int v17 = 8;
    goto LABEL_31;
  }

  if (v14 >= v7)
  {
    int v16 = -1;
  }

  else
  {
    unint64_t v15 = v10 + 2;
    a1[2] = v10 + 2;
    int v16 = *(unsigned __int8 *)(v11 + v14);
    unint64_t v14 = v15;
  }

  if (v16 - 58 > 0xFFFFFFF5 || (v16 & 0xDFu) - 71 > 0xFFFFFFF9)
  {
    unsigned int v17 = 16;
    if (v16 != -1) {
      goto LABEL_31;
    }
LABEL_32:
    _citrus_prop_read_chr_common(a1, (int *)(a2 + 8), v17, v9);
    return 0LL;
  }

  if (v16 != -1) {
    a1[2] = v14 - 1;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t _citrus_prop_read_num(uint64_t *a1, uint64_t a2)
{
  unint64_t v5 = a1[1];
  unint64_t v4 = a1[2];
  if (v4 >= v5) {
    return 22LL;
  }
  int v6 = 0;
  unint64_t v7 = v4 + 1;
  a1[2] = v4 + 1;
  uint64_t v8 = *a1;
  int v9 = *(unsigned __int8 *)(*a1 + v4);
  if (v9 != 43)
  {
    if (v9 != 45) {
      goto LABEL_7;
    }
    int v6 = 1;
  }

  if (v7 >= v5) {
    return 22LL;
  }
  uint64_t v10 = v4 + 2;
  a1[2] = v10;
  int v9 = *(unsigned __int8 *)(v8 + v7);
  unint64_t v7 = v10;
LABEL_7:
  if (v9 != 48)
  {
    if ((v9 - 58) >= 0xFFFFFFF6)
    {
      int v25 = v6;
      uint64_t v26 = a2;
      unsigned int v14 = 10;
LABEL_24:
      a1[2] = --v7;
      goto LABEL_25;
    }

    return 22LL;
  }

  uint64_t v26 = a2;
  int v25 = v6;
  if (v7 >= v5)
  {
    unsigned int v14 = 8;
    goto LABEL_25;
  }

  unint64_t v11 = v7 + 1;
  a1[2] = v7 + 1;
  if ((*(_BYTE *)(v8 + v7) & 0xDF) != 0x58)
  {
    unsigned int v14 = 8;
    ++v7;
    goto LABEL_24;
  }

  if (v11 >= v5)
  {
    int v12 = -1;
    ++v7;
  }

  else
  {
    v7 += 2LL;
    a1[2] = v7;
    int v12 = *(unsigned __int8 *)(v8 + v11);
  }

  if (v12 - 58 <= 0xFFFFFFF5 && (v12 & 0xDFu) - 71 <= 0xFFFFFFF9)
  {
    if (v12 != -1) {
      a1[2] = v7 - 1;
    }
    uint64_t result = 0LL;
    *(void *)(a2 + 8) = 0LL;
    return result;
  }

  unsigned int v14 = 16;
  if (v12 != -1) {
    goto LABEL_24;
  }
LABEL_25:
  unint64_t v15 = 0LL;
  uint64_t v16 = v14;
  unint64_t v17 = 0xFFFFFFFFFFFFFFFFLL / v14;
  int v18 = ~(v17 * v14);
  while (1)
  {
    if (v7 >= v5)
    {
      int v19 = -1;
    }

    else
    {
      int v19 = *(unsigned __int8 *)(v8 + v7++);
      a1[2] = v7;
    }

    unsigned __int8 v20 = v19 - 123 >= 0xFFFFFFE6 ? v19 - 32 : v19;
    int v21 = memchr("0123456789ABCDEF", v20, 0x11uLL);
    if (!v21) {
      break;
    }
    int v22 = (_DWORD)v21 - "0123456789ABCDEF";
    if (v15 == v17 && v22 > v18)
    {
      unint64_t v15 = v17;
      break;
    }

    unint64_t v15 = v15 * v16 + v22;
  }

  if (v19 != -1 && v7) {
    a1[2] = v7 - 1;
  }
  uint64_t result = 0LL;
  if (v25) {
    unint64_t v24 = -(uint64_t)v15;
  }
  else {
    unint64_t v24 = v15;
  }
  *(void *)(v26 + 8) = v24;
  return result;
}

uint64_t *_citrus_prop_read_character_common(uint64_t *result, int *a2)
{
  unint64_t v3 = result[1];
  unint64_t v2 = result[2];
  if (v2 >= v3)
  {
    int v6 = -1;
    goto LABEL_9;
  }

  unint64_t v4 = v2 + 1;
  result[2] = v2 + 1;
  uint64_t v5 = *result;
  int v6 = *(unsigned __int8 *)(*result + v2);
  if (v6 != 92)
  {
LABEL_9:
    *a2 = v6;
    return result;
  }

  if (v4 >= v3)
  {
    unsigned int v7 = -1;
LABEL_11:
    *a2 = v7;
    return result;
  }

  result[2] = v2 + 2;
  unsigned int v7 = *(unsigned __int8 *)(v5 + v4);
  if (v7 > 0x61)
  {
    unsigned int v8 = 16;
    switch(*(_BYTE *)(v5 + v4))
    {
      case 'n':
        unsigned int v7 = 10;
        goto LABEL_11;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
      case 'w':
        goto LABEL_11;
      case 'r':
        unsigned int v7 = 13;
        goto LABEL_11;
      case 't':
        unsigned int v7 = 9;
        goto LABEL_11;
      case 'v':
        unsigned int v7 = 11;
        goto LABEL_11;
      case 'x':
        return (uint64_t *)_citrus_prop_read_chr_common(result, a2, v8, 0);
      default:
        if (v7 == 98)
        {
          unsigned int v7 = 8;
        }

        else if (v7 == 102)
        {
          unsigned int v7 = 12;
        }

        goto LABEL_11;
    }
  }

  if (v7 - 48 >= 8)
  {
    if (v7 == 97) {
      unsigned int v7 = 7;
    }
    goto LABEL_11;
  }

  result[2] = v4;
  unsigned int v8 = 8;
  return (uint64_t *)_citrus_prop_read_chr_common(result, a2, v8, 0);
}

void *_citrus_prop_read_chr_common(void *a1, int *a2, unsigned int a3, int a4)
{
  signed int v7 = 0;
  signed int v8 = 0xFF / a3;
  signed int v9 = 0xFF % a3;
  unint64_t v11 = a1[1];
  unint64_t v10 = a1[2];
  while (1)
  {
    if (v10 >= v11)
    {
      int v12 = -1;
    }

    else
    {
      int v12 = *(unsigned __int8 *)(*a1 + v10++);
      a1[2] = v10;
    }

    unsigned __int8 v13 = v12 - 123 >= 0xFFFFFFE6 ? v12 - 32 : v12;
    uint64_t result = memchr("0123456789ABCDEF", v13, 0x11uLL);
    if (!result) {
      break;
    }
    signed int v15 = (_DWORD)result - "0123456789ABCDEF";
    if (v7 == v8 && v15 > v9)
    {
      signed int v7 = v8;
      break;
    }

    signed int v7 = v15 + v7 * a3;
  }

  if (v12 != -1 && v10) {
    a1[2] = v10 - 1;
  }
  if (a4) {
    int v17 = -v7;
  }
  else {
    int v17 = v7;
  }
  *a2 = v17;
  return result;
}

uint64_t _citrus_stdenc_open(__int128 **a1, char *__s1, uint64_t a3, uint64_t a4)
{
  int v8 = strcmp(__s1, "NONE");
  signed int v9 = (__int128 *)malloc(0x20uLL);
  unint64_t v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      __int128 v13 = unk_18C575B50;
      *signed int v9 = _citrus_stdenc_default;
      v9[1] = v13;
      goto LABEL_7;
    }

LABEL_21:
    uint64_t v12 = *__error();
    goto LABEL_22;
  }

  if (!v9) {
    goto LABEL_21;
  }
  *signed int v9 = 0u;
  v9[1] = 0u;
  uint64_t v11 = _citrus_load_module(&v21, __s1);
  if ((_DWORD)v11)
  {
LABEL_4:
    uint64_t v12 = v11;
LABEL_22:
    _citrus_stdenc_close(v10);
    return v12;
  }

  signed int v15 = v21;
  *((void *)v10 + 2) = v21;
  getops = (uint64_t (*)(void *, uint64_t))_citrus_find_getops(v15, __s1, "stdenc");
  if (!getops)
  {
LABEL_20:
    uint64_t v12 = 22LL;
    goto LABEL_22;
  }

  int v17 = getops;
  int v18 = malloc(0x58uLL);
  *(void *)unint64_t v10 = v18;
  if (!v18) {
    goto LABEL_21;
  }
  uint64_t v11 = v17(v18, 88LL);
  if ((_DWORD)v11) {
    goto LABEL_4;
  }
  int v19 = *(void **)v10;
  if (!**(void **)v10 || !v19[1] || !v19[3] || !v19[4] || !v19[5] || !v19[6] || !v19[8]) {
    goto LABEL_20;
  }
LABEL_7:
  unsigned int v14 = malloc(0x18uLL);
  *((void *)v10 + 3) = v14;
  if (!v14) {
    goto LABEL_21;
  }
  uint64_t v12 = (**(uint64_t (***)(__int128 *, uint64_t, uint64_t, void *))v10)(v10, a3, a4, v14);
  if ((_DWORD)v12) {
    goto LABEL_22;
  }
  *a1 = v10;
  return v12;
}

void _citrus_stdenc_close(__int128 *a1)
{
  if (a1 != &_citrus_stdenc_default)
  {
    uint64_t v2 = *((void *)a1 + 2);
    unint64_t v3 = *(void **)a1;
    if (v2)
    {
      if (v3)
      {
        if (*((void *)a1 + 1))
        {
          unint64_t v4 = (void (*)(__int128 *))v3[1];
          if (v4)
          {
            v4(a1);
            unint64_t v3 = *(void **)a1;
          }
        }

        free(v3);
      }

      free(*((void **)a1 + 3));
      _citrus_unload_module(*((void **)a1 + 2));
    }

    else
    {
      uint64_t v5 = *((void *)a1 + 1);
      if (v3)
      {
        if (v5)
        {
          int v6 = (void (*)(__int128 *))v3[1];
          if (v6) {
            v6(a1);
          }
        }

        free(*((void **)a1 + 3));
      }

      else if (v5)
      {
        _citrus_stdenc_close_cold_1();
      }
    }

    free(a1);
  }

void _citrus_db_factory_serialize_cold_1()
{
  __assert_rtn("dump_header", "citrus_db_factory.c", 270, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_2()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 339, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_3()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 340, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_4()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 341, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_5()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 342, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_6()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 338, "_v <= UINT_MAX");
}

void _citrus_mapper_open_cold_1()
{
  __assert_rtn("_citrus_mapper_open", "citrus_mapper.c", 428, "cm->cm_dir == 0 || powerof2(cm->cm_dir)");
}

void _citrus_unload_module_cold_1()
{
  __assert_rtn("_citrus_unload_module", "citrus_module.c", 390, "handle != RTLD_SELF");
}

void _citrus_stdenc_close_cold_1()
{
  __assert_rtn("_citrus_stdenc_close", "citrus_stdenc.c", 180, "ce->ce_closure == NULL");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void abort(void)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
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

int dlclose(void *__handle)
{
  return MEMORY[0x1895FAF50](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x1895FB288](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

int issetugid(void)
{
  return MEMORY[0x1895FB870]();
}

const char *locale_charset(void)
{
  return (const char *)MEMORY[0x189614990]();
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x1895FC178](*(void *)&a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB18](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD038](__big, __little);
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

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}