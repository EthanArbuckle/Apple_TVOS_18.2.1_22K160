uint64_t _citrus_DECKanji_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t result;
  v6 = calloc(1uLL, 4uLL);
  if (!v6) {
    return *__error();
  }
  v7 = v6;
  result = 0LL;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)a4 = xmmword_188E36F70;
  *(void *)(a4 + 16) = 1LL;
  return result;
}

void _citrus_DECKanji_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_DECKanji_stdenc_mbtocs( uint64_t a1, int *a2, unsigned int *a3, char **a4, uint64_t a5, unint64_t *a6, void *a7, uint64_t a8)
{
  uint64_t v12 = _citrus_DECKanji_mbrtowc_priv(&v19, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2LL)
    {
      unsigned int v13 = v19;
      if ((v19 & 0x80) != 0) {
        int v14 = 2;
      }
      else {
        int v14 = 3;
      }
      if (v19 >= 0x100) {
        int v15 = v14;
      }
      else {
        int v15 = 1;
      }
      if (v19 >= 0x100) {
        int v16 = 32639;
      }
      else {
        int v16 = 127;
      }
      if (v19 >= 0x80)
      {
        int v17 = v16;
      }

      else
      {
        int v15 = 0;
        int v17 = 127;
      }

      *a2 = v15;
      *a3 = v17 & v13;
    }

    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }

  return v12;
}

uint64_t _citrus_DECKanji_stdenc_cstomb( uint64_t a1, void *a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, unint64_t *a7)
{
  unsigned int v7 = 0;
  int v8 = 0x8000;
  switch(a4)
  {
    case -1:
      goto LABEL_7;
    case 0:
      goto LABEL_3;
    case 1:
      a4 = 128;
LABEL_3:
      int v8 = a4;
      if (a5 > 0x7F) {
        goto LABEL_4;
      }
      goto LABEL_6;
    case 2:
      int v8 = 32896;
      goto LABEL_6;
    case 3:
LABEL_6:
      unsigned int v7 = v8 | a5;
LABEL_7:
      uint64_t result = _citrus_DECKanji_wcrtomb_priv(a2, a3, v7, a6, a7);
      break;
    default:
LABEL_4:
      uint64_t result = 92LL;
      break;
  }

  return result;
}

uint64_t _citrus_DECKanji_stdenc_mbtowc( uint64_t a1, unsigned int *a2, char **a3, uint64_t a4, unint64_t *a5, void *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_DECKanji_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_DECKanji_stdenc_wctomb( uint64_t a1, void *a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t *a6)
{
  return _citrus_DECKanji_wcrtomb_priv(a2, a3, a4, a5, a6);
}

uint64_t _citrus_DECKanji_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0LL;
  return 0LL;
}

uint64_t _citrus_DECKanji_stdenc_get_state_desc(uint64_t a1, void *a2, int a3, int *a4)
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

uint64_t _citrus_DECKanji_stdenc_getops(uint64_t a1)
{
  __int128 v1 = unk_18C756D50;
  *(_OWORD *)a1 = _citrus_DECKanji_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  __int128 v2 = xmmword_18C756D60;
  __int128 v3 = *(_OWORD *)&off_18C756D70;
  __int128 v4 = xmmword_18C756D80;
  *(void *)(a1 + 80) = qword_18C756D90;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0LL;
}

uint64_t _citrus_DECKanji_mbrtowc_priv( unsigned int *a1, char **a2, uint64_t a3, unint64_t *a4, void *a5)
{
  int v5 = *a2;
  if (!*a2)
  {
    uint64_t result = 0LL;
    *a4 = 0LL;
    *a5 = 0LL;
    return result;
  }

  unint64_t v6 = *a4;
  if (*a4 == 1)
  {
    char v7 = *((_BYTE *)a4 + 8);
  }

  else
  {
    if (v6) {
      return 22LL;
    }
    if (!a3) {
      goto LABEL_25;
    }
    --a3;
    char v8 = *v5++;
    char v7 = v8;
    *a4 = 1LL;
    *((_BYTE *)a4 + 8) = v8;
  }

  if (v7 >= 0) {
    unint64_t v10 = 1LL;
  }
  else {
    unint64_t v10 = 2LL;
  }
  if (v7 < 0)
  {
    uint64_t v13 = 1LL;
    while (a3)
    {
      --a3;
      char v14 = *v5++;
      *a4 = v13 + 1;
      *((_BYTE *)a4 + v13 + 8) = v14;
      uint64_t v13 = *a4;
      if (*a4 >= v10)
      {
        *a2 = v5;
        if ((v7 & 0x80) == 0) {
          goto LABEL_13;
        }
        unsigned int v11 = __rev16(*((unsigned __int16 *)a4 + 4));
        goto LABEL_14;
      }
    }

LABEL_25:
    uint64_t result = 0LL;
    *a5 = -2LL;
    *a2 = v5;
    return result;
  }

  *a2 = v5;
LABEL_13:
  unsigned int v11 = *((unsigned __int8 *)a4 + 8);
LABEL_14:
  *a4 = 0LL;
  if (a1) {
    *a1 = v11;
  }
  uint64_t result = 0LL;
  int v12 = v10 - v6;
  if (!v11) {
    int v12 = 0;
  }
  *a5 = v12;
  return result;
}

uint64_t _citrus_DECKanji_wcrtomb_priv( void *a1, unint64_t a2, unsigned int a3, uint64_t a4, unint64_t *a5)
{
  if (*(void *)a4) {
    return 22LL;
  }
  if (a3 >= 0x100)
  {
    if ((a3 & 0x8000) == 0)
    {
      *a5 = -1LL;
      return 92LL;
    }

    *(_BYTE *)(a4 + 8) = BYTE1(a3);
    unint64_t v8 = 1LL;
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  unint64_t v9 = v8 + 1;
  *(void *)a4 = v8 + 1;
  *(_BYTE *)(a4 + v8 + 8) = a3;
  if (v8 >= a2)
  {
    *a5 = -1LL;
    return 7LL;
  }

  else
  {
    memcpy(a1, (const void *)(a4 + 8), v8 + 1);
    uint64_t result = 0LL;
    *a5 = v9;
    *(void *)a4 = 0LL;
  }

  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void free(void *a1)
{
}