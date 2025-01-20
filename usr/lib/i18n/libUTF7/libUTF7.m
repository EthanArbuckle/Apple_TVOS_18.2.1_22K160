uint64_t _citrus_UTF7_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OWORD *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  v6 = calloc(1uLL, 0x100uLL);
  if (!v6) {
    return *__error();
  }
  v7 = 0LL;
  v6[14] = 0u;
  v6[15] = 0u;
  v6[12] = 0u;
  v6[13] = 0u;
  v6[10] = 0u;
  v6[11] = 0u;
  v6[8] = 0u;
  v6[9] = 0u;
  v6[6] = 0u;
  v6[7] = 0u;
  v6[4] = 0u;
  v6[5] = 0u;
  v6[2] = 0u;
  v6[3] = 0u;
  v8 = 65;
  *v6 = 0u;
  v6[1] = 0u;
  do
  {
    *((_WORD *)v6 + (v8 & 0x7F)) |= (_WORD)v7 + 1;
    v8 = base64[++v7];
  }

  while (v7 != 64);
  v9 = 65;
  v10 = 1u;
  do
  {
    *((_WORD *)v6 + (v9 & 0x7F)) |= 0x100u;
    v9 = direct[v10++];
  }

  while (v10 != 72);
  v11 = 33;
  v12 = 1u;
  do
  {
    *((_WORD *)v6 + (v11 & 0x7F)) |= 0x200u;
    v11 = option[v12++];
  }

  while (v12 != 21);
  v13 = 0LL;
  v14 = 32;
  do
  {
    *((_WORD *)v6 + (v14 & 0x7F)) |= 0x400u;
    v14 = spaces[++v13];
  }

  while (v13 != 4);
  v15 = 0LL;
  *(void *)(a1 + 8) = v6;
  *(_OWORD *)a4 = xmmword_18896FEB0;
  *(void *)(a4 + 16) = 1LL;
  return v15;
}

void _citrus_UTF7_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_UTF7_stdenc_mbtocs( uint64_t a1, _DWORD *a2, int *a3, unsigned __int8 **a4, uint64_t a5, unsigned int *a6, unint64_t *a7, uint64_t a8)
{
  uint64_t v12 = _citrus_UTF7_mbrtowc_priv(*(void *)(a1 + 8), &v15, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2LL)
    {
      int v13 = v15;
      *a2 = 0;
      *a3 = v13;
    }

    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }

  return v12;
}

uint64_t _citrus_UTF7_stdenc_cstomb( uint64_t a1, char *a2, uint64_t a3, int a4, unsigned int a5, unsigned int *a6, uint64_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }

  else if (a4)
  {
    return 92LL;
  }

  return _citrus_UTF7_wcrtomb_priv(*(void *)(a1 + 8), a2, a5, a6, a7);
}

uint64_t _citrus_UTF7_stdenc_mbtowc( uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, unsigned int *a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_UTF7_mbrtowc_priv(*(void *)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_UTF7_stdenc_wctomb( uint64_t a1, char *a2, uint64_t a3, unsigned int a4, unsigned int *a5, uint64_t *a6)
{
  return _citrus_UTF7_wcrtomb_priv(*(void *)(a1 + 8), a2, a4, a5, a6);
}

uint64_t _citrus_UTF7_stdenc_put_state_reset(int a1, void *__dst, uint64_t a3, unsigned int *a4, void *a5)
{
  if (a4[1]) {
    return 22LL;
  }
  unsigned int v6 = *a4;
  unsigned int v7 = (*a4 >> 1) & 0xF;
  if (v7 > 6) {
    return 22LL;
  }
  if ((v6 & 1) != 0)
  {
    if (v7)
    {
      if (!a3) {
        return 7LL;
      }
      --a3;
      *((_BYTE *)a4 + 8) = base64[(v6 >> 5 << (6 - v7)) & 0x3FLL];
      unsigned int v7 = 2;
      a4[1] = 2;
      *((_BYTE *)a4 + 9) = 45;
      v6 &= 0xF8000001;
    }

    v6 &= ~1u;
    *a4 = v6;
  }

  else
  {
    unsigned int v7 = 0;
  }

  if ((v6 & 0x1E) != 0) {
    return 22LL;
  }
  if (!a3) {
    return 7LL;
  }
  *a5 = v7;
  if (!v7) {
    return 0LL;
  }
  memcpy(__dst, a4 + 2, v7);
  uint64_t result = 0LL;
  a4[1] = 0;
  return result;
}

uint64_t _citrus_UTF7_stdenc_get_state_desc(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  if (a3) {
    return 102LL;
  }
  uint64_t result = 0LL;
  if (*(_DWORD *)(a2 + 4)) {
    int v5 = 3;
  }
  else {
    int v5 = 1;
  }
  *a4 = v5;
  return result;
}

uint64_t _citrus_UTF7_stdenc_getops(uint64_t a1)
{
  __int128 v1 = *(_OWORD *)algn_18C72D8C8;
  *(_OWORD *)a1 = _citrus_UTF7_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  __int128 v2 = xmmword_18C72D8D8;
  __int128 v3 = *(_OWORD *)&off_18C72D8E8;
  __int128 v4 = xmmword_18C72D8F8;
  *(void *)(a1 + 80) = qword_18C72D908;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0LL;
}

uint64_t _citrus_UTF7_mbrtowc_priv( uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, unsigned int *a5, unint64_t *a6)
{
  if (!*a3)
  {
    uint64_t result = 0LL;
    a5[2] = 0;
    *(void *)a5 = 0LL;
    unint64_t v14 = 1LL;
    goto LABEL_5;
  }

  uint64_t result = _citrus_UTF7_mbtoutf16(a1, &v18, a3, a4, a5, (uint64_t *)&v16);
  unint64_t v13 = v16;
  if (v16 >= 0xFFFFFFFFFFFFFFFELL)
  {
    *a6 = v16;
    return result;
  }

  if (!(_DWORD)result)
  {
    int v15 = v18;
    if ((unsigned __int16)((unsigned __int16)(v18 + 9216) >> 10) < 0x3Fu)
    {
      if (v18) {
        goto LABEL_10;
      }
      a5[2] = 0;
      *(void *)a5 = 0LL;
      goto LABEL_18;
    }

    uint64_t result = _citrus_UTF7_mbtoutf16(a1, &v17, a3, a4 - v16, a5, (uint64_t *)&v16);
    unint64_t v14 = v16;
    if (v16 < 0xFFFFFFFFFFFFFFFELL)
    {
      if ((_DWORD)result) {
        return result;
      }
      if ((unsigned __int16)((unsigned __int16)(v17 + 0x2000) >> 10) > 0x3Eu)
      {
        int v15 = ((unsigned __int16)(v17 + 9216) | ((unsigned __int16)(v15 + 10240) << 10)) + 0x10000;
        v13 += v16;
LABEL_10:
        *a6 = v13;
        uint64_t result = 0LL;
        if (a2) {
          *a2 = v15;
        }
        return result;
      }

LABEL_18:
      *a6 = -1LL;
      return 92LL;
    }

    a5[1] = 1;
LABEL_5:
    *a6 = v14;
  }

  return result;
}

uint64_t _citrus_UTF7_mbtoutf16( uint64_t a1, _WORD *a2, unsigned __int8 **a3, uint64_t a4, unsigned int *a5, uint64_t *a6)
{
  int v6 = 0;
  *a6 = 0LL;
  unsigned int v7 = *a3;
  v8 = *a3;
  while (1)
  {
    if (v6 == a5[1])
    {
      if (!a4)
      {
        uint64_t v17 = 0LL;
        uint64_t v18 = -2LL;
        goto LABEL_37;
      }

      --a4;
      int v10 = *v8++;
      LODWORD(v9) = v10;
      a5[1] = v6 + 1;
      uint64_t v11 = v6;
      *((_BYTE *)a5 + v6 + 8) = v10;
      if ((v10 & 0x80) != 0) {
        goto LABEL_34;
      }
    }

    else
    {
      uint64_t v11 = v6;
      LODWORD(v9) = *((unsigned __int8 *)a5 + v6 + 8);
      if ((v9 & 0x80) != 0) {
        goto LABEL_34;
      }
    }

    unsigned int v12 = *a5;
    if ((*a5 & 1) == 0)
    {
      if ((v12 & 0x7FFFFFE) != 0) {
        return 22LL;
      }
      if ((_DWORD)v9 != 43)
      {
        goto LABEL_34;
      }

      *a5 = v12 | 1;
      goto LABEL_22;
    }

    if ((_DWORD)v9 == 45 && (v12 & 0x7FFFFE0) == 0)
    {
      *a5 = v12 & 0xFFFFFFFE;
      LOWORD(v9) = 43;
      goto LABEL_32;
    }

    int v14 = *(unsigned __int8 *)(a1 + 2LL * v9);
    if (v14) {
      break;
    }
    if ((*a5 & 0x1C) > 0xA) {
      return 22LL;
    }
    *a5 = v12 & 0xF8000000;
    uint64_t v9 = *((unsigned __int8 *)a5 + v11 + 8);
    if ((_DWORD)v9 != 45)
    {
      if ((v9 & 0x80) == 0 && ((_DWORD)v9 == 43 || (*(_WORD *)(a1 + 2 * v9) & 0x700) != 0)) {
        goto LABEL_32;
      }
LABEL_34:
      *a6 = -1LL;
      return 92LL;
    }

    --a5[1];
    --v6;
LABEL_22:
    ++v6;
  }

  unsigned int v15 = (v14 - 1) | (2 * v12) & 0x3FFFC0;
  *a5 = v12 & 0xF800001F | (32 * v15);
  int v16 = (v12 >> 1) & 0xF;
  uint64_t v17 = 22LL;
  if (v16 == 15) {
    return v17;
  }
  if (((1 << v16) & 0x155) != 0)
  {
    *a5 = v12 & 0xF8000001 | (32 * v15) | (2 * (((v12 + 12) >> 1) & 0xF));
    goto LABEL_22;
  }

  if (((1 << v16) & 0x5400) == 0) {
    return v17;
  }
  *a5 = v12 & 0xF8000001 | (32 * v15) | (v12 + 12) & 0x1E;
  LODWORD(v9) = v15 >> (((v12 + 12) >> 1) & 0xF);
LABEL_32:
  *a2 = v9;
  uint64_t v17 = 0LL;
  a5[1] = 0;
  uint64_t v18 = v8 - v7;
  if (!*a2) {
    uint64_t v18 = 0LL;
  }
LABEL_37:
  *a6 = v18;
  *a3 = v8;
  return v17;
}

uint64_t _citrus_UTF7_wcrtomb_priv(uint64_t a1, char *__dst, unsigned int a3, unsigned int *a4, uint64_t *a5)
{
  if (HIWORD(a3))
  {
    if (HIWORD(a3) > 0x10u)
    {
      uint64_t result = 92LL;
      uint64_t v9 = -1LL;
LABEL_33:
      *a5 = v9;
      return result;
    }

    v24 = a5;
    v26[0] = ((a3 + 67043328) >> 10) - 10240;
    v26[1] = a3 & 0x3FF | 0xDC00;
    uint64_t v7 = 2LL;
  }

  else
  {
    v24 = a5;
    v26[0] = a3;
    uint64_t v7 = 1LL;
  }

  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  BOOL v10 = a4[1] == 0;
  while (v10)
  {
    unsigned int v11 = *a4;
    unsigned int v12 = *a4 & 0x1E;
    if (v12 > 0xC) {
      break;
    }
    uint64_t v13 = (unsigned __int16)v26[v8];
    if (v13 <= 0x7F && ((_DWORD)v13 == 43 || (*(_WORD *)(a1 + 2 * v13) & 0x500) != 0))
    {
      if ((v11 & 1) != 0)
      {
        int v18 = (v11 >> 1) & 0xF;
        if (v18)
        {
          char v19 = base64[(v11 >> 5 << (6 - v18)) & 0x3FLL];
          a4[1] = 1;
          *((_BYTE *)a4 + 8) = v19;
          v11 &= 0xF8000001;
          uint64_t v14 = 1LL;
        }

        else
        {
          uint64_t v14 = 0LL;
        }

        if ((_DWORD)v13 == 45 || *(_BYTE *)(a1 + 2 * v13))
        {
          uint64_t v20 = (uint64_t)a4 + v14++;
          a4[1] = v14;
          *(_BYTE *)(v20 + 8) = 45;
        }

        v11 &= ~1u;
        *a4 = v11;
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      if ((v11 & 0x1E) != 0) {
        return 22LL;
      }
      a4[1] = v14 + 1;
      *((_BYTE *)a4 + v14 + 8) = v13;
      if ((_DWORD)v13 == 43)
      {
        uint64_t v21 = (int)a4[1];
        a4[1] = v21 + 1;
        *((_BYTE *)a4 + v21 + 8) = 45;
      }
    }

    else
    {
      if ((v11 & 1) == 0)
      {
        if (v12) {
          return 22LL;
        }
        a4[1] = 1;
        *((_BYTE *)a4 + 8) = 43;
        v11 |= 1u;
      }

      *a4 = v11 & 0xF8000001 | (32 * (v13 & 0xFFC0FFFF | (((v11 >> 5) & 0x3F) << 16))) | (2
                                                                                        * ((((v11 >> 1) & 0xF | 0x10)
                                                                                          - 6
                                                                                          * ((unsigned __int16)(43 * ((v11 >> 1) & 0xF | 0x10)) >> 8)) & 0x7F));
      unsigned int v15 = ((v11 >> 1) & 0xF) + 22;
      do
      {
        uint64_t v16 = (int)a4[1];
        char v17 = base64[(((*a4 >> 5) & 0x3FFFFF) >> (v15 - 12)) & 0x3FLL];
        a4[1] = v16 + 1;
        *((_BYTE *)a4 + v16 + 8) = v17;
        v15 -= 6;
      }

      while (v15 > 0xB);
    }

    size_t v22 = (int)a4[1];
    memcpy(__dst, a4 + 2, v22);
    a4[1] = 0;
    __dst += v22;
    v9 += v22;
    ++v8;
    BOOL v10 = 1;
    if (v8 == v7)
    {
      uint64_t result = 0LL;
      a5 = v24;
      goto LABEL_33;
    }
  }

  return 22LL;
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