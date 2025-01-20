uint64_t _citrus_DECHanyu_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  *(_OWORD *)a4 = xmmword_188FF5F70;
  *(void *)(a4 + 16) = 1LL;
  return result;
}

void _citrus_DECHanyu_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_DECHanyu_stdenc_mbtocs( uint64_t a1, int *a2, unsigned int *a3, unsigned __int8 **a4, uint64_t a5, uint64_t *a6, void *a7, uint64_t a8)
{
  uint64_t result = _citrus_DECHanyu_mbrtowc_priv((int *)&v18, a4, a5, a6, a7);
  if ((_DWORD)result) {
    return result;
  }
  if (*a7 != -2LL)
  {
    unsigned int v13 = v18;
    if (v18 < 0x80)
    {
      int v15 = 0;
      int v16 = 127;
LABEL_8:
      *a2 = v15;
      *a3 = v16 & v13;
      goto LABEL_9;
    }

    if (v18 < 0x10000)
    {
      int v14 = 0;
    }

    else
    {
      if (HIWORD(v18) != 49867) {
        return 92LL;
      }
      int v14 = 2;
    }

    if (BYTE1(v18) - 161 <= 0x5D && (v18 & 0x7F) - 33 <= 0x5D)
    {
      if ((v18 & 0x80) != 0) {
        int v17 = 1;
      }
      else {
        int v17 = 2;
      }
      int v15 = v14 + v17;
      int v16 = 32639;
      goto LABEL_8;
    }

    return 92LL;
  }

LABEL_9:
  if (a8)
  {
    if (*(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }

  return 0LL;
}

uint64_t _citrus_DECHanyu_stdenc_cstomb( uint64_t a1, void *a2, unint64_t a3, unsigned int a4, unsigned int a5, uint64_t *a6, void *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
    return _citrus_DECHanyu_wcrtomb_priv(a2, a3, a5, a6, a7);
  }

  if (a4)
  {
    if (a4 <= 2) {
      int v8 = 0x8000;
    }
    else {
      int v8 = -1026850816;
    }
    a5 |= v8 & 0xFFFFFF7F | ((a4 & 1) << 7);
    return _citrus_DECHanyu_wcrtomb_priv(a2, a3, a5, a6, a7);
  }

  if (a5 <= 0x7F) {
    return _citrus_DECHanyu_wcrtomb_priv(a2, a3, a5, a6, a7);
  }
  return 92LL;
}

uint64_t _citrus_DECHanyu_stdenc_mbtowc( uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, uint64_t *a5, void *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_DECHanyu_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_DECHanyu_stdenc_wctomb( uint64_t a1, void *a2, unint64_t a3, unsigned int a4, uint64_t *a5, void *a6)
{
  return _citrus_DECHanyu_wcrtomb_priv(a2, a3, a4, a5, a6);
}

uint64_t _citrus_DECHanyu_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0LL;
  return 0LL;
}

uint64_t _citrus_DECHanyu_stdenc_get_state_desc(uint64_t a1, void *a2, int a3, int *a4)
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

uint64_t _citrus_DECHanyu_stdenc_getops(uint64_t a1)
{
  __int128 v1 = *(_OWORD *)algn_18C760CF8;
  *(_OWORD *)a1 = _citrus_DECHanyu_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  __int128 v2 = xmmword_18C760D08;
  __int128 v3 = *(_OWORD *)&off_18C760D18;
  __int128 v4 = xmmword_18C760D28;
  *(void *)(a1 + 80) = qword_18C760D38;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0LL;
}

uint64_t _citrus_DECHanyu_mbrtowc_priv(int *a1, unsigned __int8 **a2, uint64_t a3, uint64_t *a4, void *a5)
{
  int v5 = *a2;
  if (!*a2)
  {
    uint64_t result = 0LL;
    *a4 = 0LL;
    a4[1] = 0LL;
    *a5 = 0LL;
    return result;
  }

  uint64_t v6 = *a4;
  if ((unint64_t)(*a4 - 2) >= 2)
  {
    if (v6 == 1)
    {
      int v9 = *((unsigned __int8 *)a4 + 8);
      v7 = *a2;
      if ((v9 - 161) < 0x5E)
      {
LABEL_18:
        if (v9 != 194)
        {
          int v11 = 0;
          goto LABEL_34;
        }

        if (!a3)
        {
LABEL_40:
          int v5 = v7;
          goto LABEL_41;
        }

        if (*v7 == 203)
        {
          *a4 = 2LL;
          *((_BYTE *)a4 + 9) = -53;
          if (a3 == 1)
          {
            int v5 = v7 + 1;
            goto LABEL_41;
          }

          int v9 = v7[1];
          if ((v9 - 161) <= 0x5D)
          {
            a3 -= 2LL;
            v7 += 2;
            goto LABEL_33;
          }
        }

        goto LABEL_39;
      }
    }

    else if (!v6)
    {
      if (!a3)
      {
LABEL_41:
        uint64_t result = 0LL;
        *a5 = -2LL;
        *a2 = v5;
        return result;
      }

      v7 = v5 + 1;
      int v8 = (char)*v5;
      int v9 = *v5;
      if ((v8 & 0x80000000) == 0)
      {
        if (a1) {
          *a1 = v9;
        }
        uint64_t result = 0LL;
        *a5 = v8 != 0;
        *a2 = v7;
        return result;
      }

      --a3;
      *a4 = 1LL;
      *((_BYTE *)a4 + 8) = v8;
      goto LABEL_18;
    }

    return 22LL;
  }

  if (v6 == 2)
  {
    if (!a3) {
      goto LABEL_41;
    }
    int v9 = *v5;
    if ((v9 - 161) <= 0x5D)
    {
      --a3;
      v7 = v5 + 1;
LABEL_33:
      int v11 = -1026883584;
      *a4 = 3LL;
      *((_BYTE *)a4 + 10) = v9;
      goto LABEL_34;
    }

LABEL_39:
    *a5 = -1LL;
    return 92LL;
  }

  int v11 = -1026883584;
  if (v6 != 3)
  {
    int v9 = 203;
    v7 = *a2;
    goto LABEL_34;
  }

  int v9 = *((unsigned __int8 *)a4 + 10);
  v7 = *a2;
LABEL_34:
  if (!a3) {
    goto LABEL_40;
  }
  int v14 = *v7;
  v12 = v7 + 1;
  int v13 = v14;
  if ((v14 & 0x7Fu) - 33 > 0x5D) {
    goto LABEL_39;
  }
  if (a1) {
    *a1 = v11 | (v9 << 8) | v13;
  }
  uint64_t result = 0LL;
  *a5 = v12 - v5;
  *a2 = v12;
  *a4 = 0LL;
  return result;
}

uint64_t _citrus_DECHanyu_wcrtomb_priv( void *a1, unint64_t a2, unsigned int a3, uint64_t *a4, void *a5)
{
  if (*a4) {
    return 22LL;
  }
  if (a3 >= 0x80)
  {
    if (a3 < 0x10000)
    {
      uint64_t v10 = 0LL;
    }

    else
    {
      if (HIWORD(a3) != 49867) {
        goto LABEL_14;
      }
      *((_BYTE *)a4 + 8) = HIBYTE(a3);
      uint64_t v10 = 2LL;
      *a4 = 2LL;
      *((_BYTE *)a4 + 9) = BYTE2(a3);
      a3 = (unsigned __int16)a3;
    }

    if ((a3 >> 8) - 161 <= 0x5D)
    {
      uint64_t v8 = v10 | 1;
      *a4 = v10 | 1;
      *((_BYTE *)a4 + v10 + 8) = BYTE1(a3);
      if ((a3 & 0x7F) - 33 <= 0x5D) {
        goto LABEL_5;
      }
    }

LABEL_14:
    *a5 = -1LL;
    return 92LL;
  }

  uint64_t v8 = 0LL;
LABEL_5:
  *a4 = v8 + 1;
  *((_BYTE *)a4 + v8 + 8) = a3;
  uint64_t v9 = *a4;
  if (*a4 <= a2)
  {
    memcpy(a1, a4 + 1, *a4);
    uint64_t result = 0LL;
    *a5 = v9;
    *a4 = 0LL;
  }

  else
  {
    *a5 = -1LL;
    return 7LL;
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