uint64_t _citrus_BIG5_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t result;
  v8 = calloc(1uLL, 0x410uLL);
  if (v8)
  {
    v9 = v8;
    bzero(v8, 0x410uLL);
    v9[1] = v9;
    if (a2 && a3 && *(_BYTE *)_citrus_bcs_skip_ws_len())
    {
      if (!_citrus_prop_parse_variable())
      {
LABEL_13:
        result = 0LL;
        *(void *)(a1 + 8) = v9;
        *(_OWORD *)a4 = xmmword_188BECF50;
        *(void *)(a4 + 16) = 1LL;
        return result;
      }

      _citrus_BIG5_encoding_module_uninit((uint64_t)v9);
      bzero(v9, 0x410uLL);
      v9[1] = v9;
    }

    for (i = 0LL; i != 376; i += 4LL)
      *(_DWORD *)((char *)v9 + i + 660) |= 1u;
    for (j = 0LL; j != 252; j += 4LL)
      *(_DWORD *)((char *)v9 + j + 272) |= 2u;
    for (k = 0LL; k != 376; k += 4LL)
      *(_DWORD *)((char *)v9 + k + 660) |= 2u;
    goto LABEL_13;
  }

  return *__error();
}

void _citrus_BIG5_stdenc_uninit(uint64_t a1)
{
  if (a1)
  {
    v1 = *(void **)(a1 + 8);
    _citrus_BIG5_encoding_module_uninit((uint64_t)v1);
    free(v1);
  }
}

uint64_t _citrus_BIG5_stdenc_mbtocs( uint64_t a1, _DWORD *a2, int *a3, uint64_t *a4, uint64_t a5, int *a6, uint64_t *a7, uint64_t a8)
{
  uint64_t v12 = _citrus_BIG5_mbrtowc_priv(*(void **)(a1 + 8), &v15, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
    {
      int v13 = v15;
      *a2 = v15 > 255;
      *a3 = v13;
    }

    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }

  return v12;
}

uint64_t _citrus_BIG5_stdenc_cstomb( uint64_t a1, _WORD *a2, unint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }

  else if (a4 > 1)
  {
    return 92LL;
  }

  return _citrus_BIG5_wcrtomb_priv(*(void **)(a1 + 8), a2, a3, a5, a7);
}

uint64_t _citrus_BIG5_stdenc_mbtowc( uint64_t a1, _DWORD *a2, uint64_t *a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_BIG5_mbrtowc_priv(*(void **)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_BIG5_stdenc_wctomb( uint64_t a1, _WORD *a2, unint64_t a3, unsigned int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_BIG5_wcrtomb_priv(*(void **)(a1 + 8), a2, a3, a4, a6);
}

uint64_t _citrus_BIG5_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0LL;
  return 0LL;
}

uint64_t _citrus_BIG5_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
{
  if (a3) {
    return 102LL;
  }
  uint64_t result = 0LL;
  if (*a2) {
    int v5 = 3;
  }
  else {
    int v5 = 1;
  }
  *a4 = v5;
  return result;
}

uint64_t _citrus_BIG5_stdenc_getops(uint64_t a1)
{
  __int128 v1 = *(_OWORD *)algn_18C740508;
  *(_OWORD *)a1 = _citrus_BIG5_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  __int128 v2 = xmmword_18C740518;
  __int128 v3 = *(_OWORD *)&off_18C740528;
  __int128 v4 = xmmword_18C740538;
  *(void *)(a1 + 80) = qword_18C740548;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0LL;
}

uint64_t *_citrus_BIG5_encoding_module_uninit(uint64_t a1)
{
  uint64_t result = *(uint64_t **)a1;
  if (result)
  {
    do
    {
      uint64_t v3 = *result;
      __int128 v4 = (void *)result[1];
      if (*result)
      {
        *(void *)(v3 + 8) = v4;
        __int128 v4 = (void *)result[1];
      }

      else
      {
        *(void *)(a1 + 8) = v4;
      }

      *__int128 v4 = v3;
      free(result);
      uint64_t result = *(uint64_t **)a1;
    }

    while (*(void *)a1);
  }

  return result;
}

uint64_t _citrus_BIG5_fill_rowcol(uint64_t a1, const char *a2, unint64_t a3, unint64_t a4)
{
  if ((a4 | a3) > 0xFF) {
    return 22LL;
  }
  unint64_t v5 = a3;
  char v7 = strcmp("row", a2) != 0;
  if (v5 <= a4)
  {
    int v8 = 1 << v7;
    do
      *(_DWORD *)(a1 + 4LL * v5++ + 16) |= v8;
    while (a4 + 1 != v5);
  }

  return 0LL;
}

uint64_t _citrus_BIG5_fill_excludes(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if ((a4 | a3) >> 16) {
    return 22LL;
  }
  int v4 = a4;
  int v5 = a3;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = **(void **)(v7 + 8);
  uint64_t v9 = malloc(0x18uLL);
  if (!v9) {
    return 12LL;
  }
  uint64_t v10 = v9;
  uint64_t result = 0LL;
  v10[4] = v5;
  v10[5] = v4;
  *(void *)uint64_t v10 = 0LL;
  *((void *)v10 + 1) = v7;
  *(void *)uint64_t v7 = v10;
  *(void *)(a1 + 8) = v10;
  return result;
}

uint64_t _citrus_BIG5_mbrtowc_priv(void *a1, _DWORD *a2, uint64_t *a3, uint64_t a4, int *a5, uint64_t *a6)
{
  uint64_t v6 = *a3;
  if (!*a3)
  {
    uint64_t result = 0LL;
    *(void *)a5 = 0LL;
    goto LABEL_29;
  }

  int v7 = *a5;
  if (*a5)
  {
    if (v7 != 1)
    {
LABEL_27:
      *a5 = 0;
      uint64_t result = 92LL;
      uint64_t v6 = -1LL;
      goto LABEL_29;
    }

    unsigned int v8 = *((unsigned __int8 *)a5 + 4);
  }

  else
  {
    if (!a4)
    {
LABEL_28:
      uint64_t result = 0LL;
      *a3 = v6;
      uint64_t v6 = -2LL;
      goto LABEL_29;
    }

    unsigned int v10 = *(unsigned __int8 *)v6++;
    unsigned int v8 = v10;
    *((_BYTE *)a5 + 4) = v10;
    *a5 = 1;
    --a4;
  }

  int v11 = *((_DWORD *)a1 + v8 + 4);
  if ((v11 & 1) != 0) {
    int v12 = 2;
  }
  else {
    int v12 = 1;
  }
  if ((v11 & 1) != 0)
  {
    int v15 = 1;
    while (a4)
    {
      char v16 = *(_BYTE *)v6++;
      *((_BYTE *)a5 + v15 + 4) = v16;
      int v15 = *a5 + 1;
      *a5 = v15;
      --a4;
      if (v15 >= v12)
      {
        if ((v11 & 1) == 0) {
          goto LABEL_12;
        }
        uint64_t v17 = *((unsigned __int8 *)a5 + 5);
        if ((*((_DWORD *)a1 + v17 + 4) & 2) != 0)
        {
          int v13 = v17 | (*((unsigned __int8 *)a5 + 4) << 8);
          goto LABEL_13;
        }

        goto LABEL_27;
      }
    }

    goto LABEL_28;
  }

LABEL_12:
  int v13 = *((unsigned __int8 *)a5 + 4);
LABEL_13:
  v14 = (uint64_t *)*a1;
  if (*a1)
  {
    while (*((_DWORD *)v14 + 4) > v13 || *((_DWORD *)v14 + 5) < v13)
    {
      v14 = (uint64_t *)*v14;
      if (!v14) {
        goto LABEL_17;
      }
    }

    goto LABEL_27;
  }

    uint64_t result = 92LL;
LABEL_13:
    int v7 = -1LL;
    goto LABEL_14;
  }

  if (a4 > 0xFF) {
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_16:
    uint64_t result = 7LL;
    goto LABEL_13;
  }

  uint64_t result = 0LL;
  *(_BYTE *)a2 = a4;
  int v7 = 1LL;
LABEL_14:
  *a5 = v7;
  return result;
}

LABEL_17:
  *a3 = v6;
  *a5 = 0;
  if (a2) {
    *a2 = v13;
  }
  uint64_t result = 0LL;
  LODWORD(v6) = v12 - v7;
  if (!v13) {
    LODWORD(v6) = 0;
  }
  uint64_t v6 = (int)v6;
LABEL_29:
  *a6 = v6;
  return result;
}

uint64_t _citrus_BIG5_wcrtomb_priv(void *a1, _WORD *a2, unint64_t a3, unsigned int a4, uint64_t *a5)
{
  if (HIWORD(a4)) {
    goto LABEL_12;
  }
  int v5 = (uint64_t *)*a1;
  if (*a1)
  {
    while (*((_DWORD *)v5 + 4) > (signed int)a4 || *((_DWORD *)v5 + 5) < (signed int)a4)
    {
      int v5 = (uint64_t *)*v5;
      if (!v5) {
        goto LABEL_6;
      }
    }

    goto LABEL_12;
  }

LABEL_6:
  if ((a4 & 0x8000) != 0)
  {
    if ((*((_DWORD *)a1 + BYTE1(a4) + 4) & 1) != 0 && (*((_DWORD *)a1 + a4 + 4) & 2) != 0)
    {
      if (a3 >= 2)
      {
        uint64_t result = 0LL;
        *a2 = bswap32(a4) >> 16;
        uint64_t v7 = 2LL;
        goto LABEL_14;
      }

      goto LABEL_16;
    }

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _citrus_bcs_skip_ws_len()
{
  return MEMORY[0x189615330]();
}

uint64_t _citrus_prop_parse_variable()
{
  return MEMORY[0x1896153C8]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}