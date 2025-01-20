uint64_t _citrus_HZ_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v6;
  uint64_t **v7;
  uint64_t v8;
  v6 = (uint64_t **)calloc(1uLL, 0x30uLL);
  if (!v6) {
    return *__error();
  }
  v7 = v6;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[1] = (uint64_t *)v6;
  v6[3] = (uint64_t *)(v6 + 2);
  v8 = _citrus_prop_parse_variable();
  if ((_DWORD)v8)
  {
    _citrus_HZ_encoding_module_uninit(v7);
    free(v7);
  }

  else
  {
    *(void *)(a1 + 8) = v7;
    *(_OWORD *)a4 = xmmword_188BE8F00;
    *(void *)(a4 + 16) = 1LL;
  }

  return v8;
}

void _citrus_HZ_stdenc_uninit(uint64_t a1)
{
  if (a1)
  {
    v1 = *(uint64_t ***)(a1 + 8);
    _citrus_HZ_encoding_module_uninit(v1);
    free(v1);
  }
}

uint64_t _citrus_HZ_stdenc_init_state(uint64_t a1, void *a2)
{
  *a2 = **(void **)(a1 + 8);
  return 0LL;
}

uint64_t _citrus_HZ_stdenc_mbtocs( uint64_t a1, _DWORD *a2, unsigned int *a3, unsigned __int8 **a4, uint64_t a5, uint64_t *a6, uint64_t *a7, uint64_t a8)
{
  uint64_t v12 = _citrus_HZ_mbrtowc_priv(*(uint64_t **)(a1 + 8), &v17, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
    {
      int v14 = v17;
      int v15 = v17 & 0x80;
      unsigned int v16 = v17 & 0xFFFFFF7F;
      if ((v17 & 0xFFFFFF7F) > 0x7F)
      {
        if (v16 >> 7 > 0xFE)
        {
          *a2 = v17 & 0xFF000000;
          unsigned int v16 = v14 & 0xFFFF7F;
        }

        else
        {
          *a2 = v15 | 0x8000;
        }
      }

      else
      {
        *a2 = v15;
      }

      *a3 = v16;
    }

    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }

  return v12;
}

uint64_t _citrus_HZ_stdenc_cstomb( uint64_t a1, void *a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, size_t *a7)
{
  if (a4 <= 127)
  {
    if (a4 == -1)
    {
      a5 = 0;
      return _citrus_HZ_wcrtomb_priv(*(void **)(a1 + 8), a2, a3, a5, a6, a7);
    }

    if (a4) {
      goto LABEL_8;
    }
  }

  else
  {
    int v7 = 128;
    if (a4 == 128) {
      goto LABEL_9;
    }
    if (a4 != 0x8000)
    {
      if (a4 != 32896) {
LABEL_8:
      }
        int v7 = a4;
LABEL_9:
      a5 |= v7;
    }
  }

  return _citrus_HZ_wcrtomb_priv(*(void **)(a1 + 8), a2, a3, a5, a6, a7);
}

uint64_t _citrus_HZ_stdenc_mbtowc( uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, uint64_t *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_HZ_mbrtowc_priv(*(uint64_t **)(a1 + 8), a2, a3, a4, a5, a6);
  uint64_t v10 = v9;
  if (a7)
  {
    if (!(_DWORD)v9)
    {
      v11 = *(void (**)(void, void))(a7 + 8);
      if (v11) {
        v11(*a2, *(void *)(a7 + 16));
      }
    }
  }

  return v10;
}

uint64_t _citrus_HZ_stdenc_wctomb( uint64_t a1, void *a2, unint64_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  return _citrus_HZ_wcrtomb_priv(*(void **)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t _citrus_HZ_stdenc_put_state_reset( uint64_t a1, _WORD *a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (*(_DWORD *)(a4 + 8) || !*(void *)a4) {
    return 22LL;
  }
  uint64_t v6 = **(void **)(a1 + 8);
  if (*(void *)a4 == v6)
  {
    if (a3)
    {
      uint64_t v8 = 0LL;
      goto LABEL_10;
    }
  }

  else if (a3 >= 2)
  {
    *(_BYTE *)(a4 + 12) = 126;
    int v7 = *(_DWORD *)(v6 + 40);
    *(_DWORD *)(a4 + 8) = 2;
    *(_BYTE *)(a4 + 13) = v7;
    if (a3 != 2)
    {
      *a2 = *(_WORD *)(a4 + 12);
      uint64_t v8 = 2LL;
LABEL_10:
      uint64_t result = 0LL;
      *a5 = v8;
      *(void *)a4 = v6;
      return result;
    }
  }

  return 7LL;
}

uint64_t _citrus_HZ_stdenc_get_state_desc(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  if (a3) {
    return 102LL;
  }
  int v5 = *(_DWORD *)(a2 + 8);
  if (v5 < 0 || !*(void *)a2) {
    return 22LL;
  }
  if (v5)
  {
    if (*(_BYTE *)(a2 + 12) == 126) {
      int v6 = 4;
    }
    else {
      int v6 = 3;
    }
  }

  else if (*(void *)a2 == **(void **)(a1 + 8))
  {
    int v6 = 1;
  }

  else
  {
    int v6 = 2;
  }

  uint64_t result = 0LL;
  *a4 = v6;
  return result;
}

uint64_t _citrus_HZ_stdenc_getops(uint64_t a1)
{
  __int128 v1 = *(_OWORD *)&off_18C740478;
  *(_OWORD *)a1 = _citrus_HZ_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  __int128 v2 = xmmword_18C740488;
  __int128 v3 = *(_OWORD *)&off_18C740498;
  __int128 v4 = xmmword_18C7404A8;
  *(void *)(a1 + 80) = qword_18C7404B8;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0LL;
}

void _citrus_HZ_encoding_module_uninit(uint64_t **a1)
{
  for (i = *a1; *a1; i = *a1)
  {
    uint64_t v3 = *i;
    __int128 v4 = (uint64_t *)i[1];
    if (*i)
    {
      *(void *)(v3 + 8) = v4;
      __int128 v4 = (uint64_t *)i[1];
    }

    else
    {
      a1[1] = v4;
    }

    *__int128 v4 = v3;
    free((void *)i[3]);
    free((void *)i[4]);
    free(i);
  }

  while (1)
  {
    int v7 = a1[2];
    if (!v7) {
      break;
    }
    uint64_t v5 = *v7;
    int v6 = (uint64_t *)v7[1];
    if (*v7)
    {
      *(void *)(v5 + 8) = v6;
      int v6 = (uint64_t *)v7[1];
    }

    else
    {
      a1[3] = v6;
    }

    *int v6 = v5;
    free((void *)v7[3]);
    free((void *)v7[4]);
    free(v7);
  }

uint64_t _citrus_HZ_parse_escape(uint64_t a1, const char *a2, const char *a3)
{
  int v6 = calloc(1uLL, 0x30uLL);
  if (!v6) {
    return 22LL;
  }
  int v7 = v6;
  if (!strcmp("0", a2))
  {
    v7[2] = a1;
    *int v7 = 0LL;
    uint64_t v9 = (void **)(a1 + 8);
  }

  else
  {
    if (strcmp("1", a2))
    {
      free(v7);
      return 22LL;
    }

    v7[2] = a1 + 16;
    *int v7 = 0LL;
    uint64_t v9 = (void **)(a1 + 24);
  }

  uint64_t v10 = *v9;
  v7[1] = *v9;
  *uint64_t v10 = v7;
  *uint64_t v9 = v7;
  strlen(a3);
  return _citrus_prop_parse_variable();
}

uint64_t _citrus_HZ_parse_char(uint64_t a1, uint64_t a2, char *a3)
{
  if (*(_DWORD *)(*(void *)a1 + 40LL)) {
    return 22LL;
  }
  int v4 = *a3;
  *(_DWORD *)(*(void *)a1 + 40LL) = v4;
  uint64_t result = 22LL;
  if (v4 != 126)
  {
    if (a3[1]) {
      return 22LL;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t _citrus_HZ_parse_graphic(uint64_t *a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  int v7 = calloc(1uLL, 0x18uLL);
  if (!v7) {
    return 12LL;
  }
  uint64_t v8 = v7;
  if (!strcmp("GL", a2))
  {
    uint64_t v9 = (void *)(v6 + 24);
    if (!*(void *)(v6 + 24)) {
      goto LABEL_5;
    }
LABEL_16:
    free(v8);
    return 22LL;
  }

  if (strcmp("GR", a2)) {
    goto LABEL_16;
  }
  uint64_t v9 = (void *)(v6 + 32);
  if (*(void *)(v6 + 32)) {
    goto LABEL_16;
  }
LABEL_5:
  *uint64_t v9 = v8;
  v8[1] = v6;
  if (!_citrus_bcs_strncasecmp())
  {
    if (!*(_BYTE *)(a3 + 5))
    {
      uint64_t result = 0LL;
      *(_DWORD *)uint64_t v8 = 1;
      v8[2] = 1LL;
      *(void *)(v5 + 32) = v8;
      return result;
    }

    return 22LL;
  }

  if (!_citrus_bcs_strncasecmp())
  {
    if (!*(_BYTE *)(a3 + 6))
    {
      uint64_t result = 0LL;
      *(_DWORD *)uint64_t v8 = 2;
      v8[2] = 2LL;
      *(void *)(v5 + 40) = v8;
      return result;
    }

    return 22LL;
  }

  int v10 = 3;
  int v10 = 4;
LABEL_10:
  *(_DWORD *)uint64_t v8 = v10;
  uint64_t result = 22LL;
  if ((*(char *)(a3 + 3) - 49) <= 2)
  {
    v8[2] = *(char *)(a3 + 3) - 48LL;
    if (*(_BYTE *)(a3 + 4)) {
      return 22LL;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t _citrus_HZ_mbrtowc_priv( uint64_t *a1, int *a2, unsigned __int8 **a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v6 = *a3;
  if (!*a3)
  {
    uint64_t v22 = 0LL;
    *a5 = *a1;
    a5[1] = 0LL;
    uint64_t v23 = 1LL;
    goto LABEL_66;
  }

  if ((a5[1] & 0x80000000) != 0 || !*a5) {
    return 22LL;
  }
  int v7 = 0LL;
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
  int v12 = 0;
  while (2)
  {
    while (2)
    {
      if (v11 > 6)
      {
LABEL_65:
        uint64_t v22 = 92LL;
        uint64_t v23 = -1LL;
        goto LABEL_66;
      }

      int v13 = *((_DWORD *)a5 + 2);
      while (v13 != v12)
      {
        int v14 = *((unsigned __int8 *)a5 + v12 + 12);
        if (!v12) {
          goto LABEL_37;
        }
LABEL_12:
        if (++v12 != 2 || *((_BYTE *)a5 + 12) != 126)
        {
          uint64_t v19 = *a5;
          if ((v14 & 0x80) != 0)
          {
            v14 &= 0x7Fu;
          }

          else if (v7 != *(unsigned int **)(v19 + 24))
          {
            goto LABEL_65;
          }

          goto LABEL_44;
        }

        if (v14 == 10)
        {
          if (*a5 != *a1) {
            goto LABEL_65;
          }
          goto LABEL_32;
        }

        if (v14 == 126)
        {
          ++v10;
          int v12 = 2;
          goto LABEL_44;
        }

        unsigned int v16 = (void *)*a1;
        if (*a5 == *a1)
        {
          v18 = (void *)a1[2];
          int v17 = (void *)v16[2];
          goto LABEL_23;
        }

        int v17 = *(void **)(*a5 + 16);
        if ((void *)*v17 != v16)
        {
          v18 = (void *)*a1;
LABEL_23:
          unsigned int v16 = v17;
          while (1)
          {
            unsigned int v16 = (void *)*v16;
            if (!v16) {
              break;
            }
            if (*((_DWORD *)v16 + 10) == v14) {
              goto LABEL_31;
            }
          }

          if (!v18) {
            goto LABEL_65;
          }
          unsigned int v16 = v18;
          if (*((_DWORD *)v18 + 10) != v14) {
            goto LABEL_65;
          }
          goto LABEL_31;
        }

        if (*((_DWORD *)v16 + 10) != v14) {
          goto LABEL_65;
        }
LABEL_31:
        *a5 = (uint64_t)v16;
LABEL_32:
        int v13 = 0;
        int v12 = 0;
        *((_DWORD *)a5 + 2) = 0;
        if (v11 >= 7) {
          goto LABEL_65;
        }
      }

      if (!a4)
      {
        uint64_t v22 = 0LL;
        *a3 = v6;
        uint64_t v23 = -2LL;
        goto LABEL_66;
      }

      int v15 = *v6++;
      int v14 = v15;
      --a4;
      *((_DWORD *)a5 + 2) = v13 + 1;
      *((_BYTE *)a5 + v13 + 12) = v15;
      ++v11;
      if (v12) {
        goto LABEL_12;
      }
LABEL_37:
      if ((v14 & 0x7Fu) <= 0x1F)
      {
        if (*a5 != *a1) {
          goto LABEL_65;
        }
        int v12 = 1;
        goto LABEL_56;
      }

      uint64_t v20 = *a5;
      if ((v14 & 0x80) != 0)
      {
        int v7 = *(unsigned int **)(v20 + 32);
        int v9 = 128;
        v14 &= 0x7Fu;
      }

      else
      {
        int v7 = *(unsigned int **)(v20 + 24);
        int v12 = 1;
        if (v14 == 126) {
          continue;
        }
        int v9 = 0;
      }

      break;
    }

    if (!v7) {
      goto LABEL_65;
    }
    int v12 = 1;
LABEL_44:
    unsigned int v21 = *v7;
    if (ranges[3 * *v7] > v14 || ranges[3 * v21 + 1] < v14) {
      goto LABEL_65;
    }
    int v8 = v14 | (v8 << 8);
    if (*((void *)v7 + 2) != v12 - v10) {
      continue;
    }
    break;
  }

  if (v21 >= 3) {
    v9 |= *(_DWORD *)(*a5 + 40) << 24;
  }
  int v14 = v9 | v8;
LABEL_56:
  if (v12 < *((_DWORD *)a5 + 2)) {
    return 22LL;
  }
  *a3 = v6;
  if (a2) {
    *a2 = v14;
  }
  uint64_t v22 = 0LL;
  *((_DWORD *)a5 + 2) = 0;
  if (v14) {
    LODWORD(v23) = v11;
  }
  else {
    LODWORD(v23) = 0;
  }
  uint64_t v23 = (int)v23;
LABEL_66:
  *a6 = v23;
  return v22;
}

uint64_t _citrus_HZ_wcrtomb_priv( void *a1, void *__dst, unint64_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  if (*(_DWORD *)(a5 + 8)) {
    return 22LL;
  }
  int v8 = *(void **)a5;
  if (!*(void *)a5) {
    return 22LL;
  }
  unsigned int v10 = a4 & 0xFFFFFF7F;
  if ((a4 & 0xFFFFFF7F) <= 0x1F)
  {
    int v11 = (void *)*a1;
    uint64_t v12 = 4LL;
    if ((a4 & 0x80) == 0) {
      uint64_t v12 = 3LL;
    }
    if (!v11[v12]) {
      goto LABEL_50;
    }
    int v13 = ranges;
    unint64_t v14 = 1LL;
LABEL_16:
    if (v8 == v11)
    {
LABEL_31:
      if (a3 < v14) {
        return 7LL;
      }
      if (!v14)
      {
LABEL_38:
        size_t v27 = *(int *)(a5 + 8);
        memcpy(__dst, (const void *)(a5 + 12), v27);
        uint64_t result = 0LL;
        *a6 = v27;
        *(_DWORD *)(a5 + 8) = 0;
        return result;
      }

      int v24 = *v13;
      char v25 = 8 * v14 - 8;
      while (v24 <= (v10 >> v25) && v13[1] >= (v10 >> v25))
      {
        uint64_t v26 = *(int *)(a5 + 8);
        *(_DWORD *)(a5 + 8) = v26 + 1;
        *(_BYTE *)(a5 + v26 + 12) = (v10 >> v25) | a4 & 0x80;
        v25 -= 8;
        if (!--v14) {
          goto LABEL_38;
        }
      }

      goto LABEL_50;
    }

    unsigned int v16 = (void *)v8[2];
    int v17 = (void *)v11[2];
    if (v16 == v17)
    {
      unsigned int v19 = 0;
      v18 = (void *)*a1;
      if (v11 == (void *)*a1 || v8 == v18 || (void *)*v16 != v18) {
        goto LABEL_28;
      }
    }

    else
    {
      v18 = (void *)*v17;
      if (v11 == (void *)*v17)
      {
LABEL_27:
        unsigned int v19 = 0;
LABEL_28:
        BOOL v20 = a3 >= 2;
        a3 -= 2LL;
        if (!v20) {
          return 7LL;
        }
        unsigned int v22 = v19 | 1;
        *(_BYTE *)(a5 + 12 + v19) = 126;
        int v23 = *((_DWORD *)v11 + 10);
        *(_DWORD *)(a5 + 8) = v22 + 1;
        *(_BYTE *)(a5 + 12 + v22) = v23;
        *(void *)a5 = v11;
        goto LABEL_31;
      }
    }

    if (v18)
    {
      BOOL v20 = a3 >= 2;
      a3 -= 2LL;
      if (!v20) {
        return 7LL;
      }
      *(_BYTE *)(a5 + 12) = 126;
      int v21 = *((_DWORD *)v18 + 10);
      unsigned int v19 = 2;
      *(_DWORD *)(a5 + 8) = 2;
      *(_BYTE *)(a5 + 13) = v21;
      goto LABEL_28;
    }

    goto LABEL_27;
  }

  if (v10 <= 0x7F)
  {
    int v15 = (unsigned int *)a1[4];
    if (!v15) {
      goto LABEL_50;
    }
    goto LABEL_14;
  }

  if (v10 >> 7 > 0xFE)
  {
    unsigned int v28 = HIBYTE(a4);
    int v11 = a1;
    do
    {
      int v11 = (void *)*v11;
      if (!v11)
      {
        int v11 = a1 + 2;
        while (1)
        {
          int v11 = (void *)*v11;
          if (!v11) {
            goto LABEL_50;
          }
          if (*((_DWORD *)v11 + 10) == v28) {
            goto LABEL_46;
          }
        }
      }
    }

    while (*((_DWORD *)v11 + 10) != v28);
LABEL_46:
    uint64_t v29 = 4LL;
    if ((a4 & 0x80) == 0) {
      uint64_t v29 = 3LL;
    }
    int v15 = (unsigned int *)v11[v29];
    if (v15)
    {
      unsigned int v10 = a4 & 0xFFFF7F;
      goto LABEL_15;
    }

    goto LABEL_50;
  }

  int v15 = (unsigned int *)a1[5];
  if (v15)
  {
LABEL_14:
    int v11 = (void *)*((void *)v15 + 1);
LABEL_15:
    int v13 = &ranges[3 * *v15];
    unint64_t v14 = *((void *)v15 + 2);
    goto LABEL_16;
  }

LABEL_50:
  *a6 = -1LL;
  return 92LL;
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _citrus_bcs_strncasecmp()
{
  return MEMORY[0x189615340]();
}

uint64_t _citrus_prop_parse_variable()
{
  return MEMORY[0x1896153C8]();
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void free(void *a1)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}