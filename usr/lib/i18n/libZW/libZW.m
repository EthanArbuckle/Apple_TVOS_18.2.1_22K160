uint64_t _citrus_ZW_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  *(_OWORD *)a4 = xmmword_188B33F50;
  *(void *)(a4 + 16) = 1LL;
  return result;
}

void _citrus_ZW_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_ZW_stdenc_mbtocs( uint64_t a1, _DWORD *a2, int *a3, char **a4, uint64_t a5, int *a6, uint64_t *a7, uint64_t a8)
{
  uint64_t v12 = _citrus_ZW_mbrtowc_priv(&v15, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
    {
      int v13 = v15;
      *a2 = v15 > 127;
      *a3 = v13;
    }

    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }

  return v12;
}

uint64_t _citrus_ZW_stdenc_cstomb( uint64_t a1, void *a2, unint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, size_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }

  else if (a4 > 1)
  {
    return 22LL;
  }

  return _citrus_ZW_wcrtomb_priv(a2, a3, a5, a6, a7);
}

uint64_t _citrus_ZW_stdenc_mbtowc( uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_ZW_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_ZW_stdenc_wctomb( uint64_t a1, void *a2, unint64_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  return _citrus_ZW_wcrtomb_priv(a2, a3, a4, a5, a6);
}

uint64_t _citrus_ZW_stdenc_put_state_reset(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (*(_DWORD *)(a4 + 4)) {
    return 22LL;
  }
  if (*(_DWORD *)a4)
  {
    if (*(_DWORD *)a4 != 3) {
      return 22LL;
    }
    if (a3)
    {
      uint64_t result = 0LL;
      *(_BYTE *)(a4 + 8) = 10;
      *a5 = 1LL;
      *a2 = 10;
      *(void *)a4 = 0LL;
    }

    else
    {
      return 7LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *a5 = 0LL;
  }

  return result;
}

uint64_t _citrus_ZW_stdenc_get_state_desc(uint64_t a1, int *a2, int a3, int *a4)
{
  if (a3) {
    return 102LL;
  }
  int v5 = *a2;
  if ((*a2 - 2) < 2)
  {
    int v7 = a2[1];
    if (!v7)
    {
      int v6 = 2;
      goto LABEL_17;
    }

    if (v7 == 1)
    {
      if (*((_BYTE *)a2 + 8) == 35) {
        int v6 = 4;
      }
      else {
        int v6 = 3;
      }
      goto LABEL_17;
    }

    return 22LL;
  }

  if (v5 == 1)
  {
    if (!a2[1])
    {
      int v6 = 4;
      goto LABEL_17;
    }

    return 22LL;
  }

  if (v5 || a2[1]) {
    return 22LL;
  }
  int v6 = 1;
LABEL_17:
  uint64_t result = 0LL;
  *a4 = v6;
  return result;
}

uint64_t _citrus_ZW_stdenc_getops(uint64_t a1)
{
  __int128 v1 = *(_OWORD *)algn_18C73E218;
  *(_OWORD *)a1 = _citrus_ZW_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  __int128 v2 = xmmword_18C73E228;
  __int128 v3 = *(_OWORD *)&off_18C73E238;
  __int128 v4 = xmmword_18C73E248;
  *(void *)(a1 + 80) = qword_18C73E258;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0LL;
}

uint64_t _citrus_ZW_mbrtowc_priv(int *a1, char **a2, uint64_t a3, int *a4, uint64_t *a5)
{
  int v5 = *a2;
  if (!*a2)
  {
    uint64_t result = 0LL;
    a4[2] = 0;
    *(void *)a4 = 0LL;
    *a5 = 1LL;
    return result;
  }

  LODWORD(v6) = 0;
  int v7 = *a4;
  while (2)
  {
    switch(v7)
    {
      case 0:
        if (a4[1]) {
          return 22LL;
        }
        if (!a3) {
          goto LABEL_46;
        }
        int v9 = *v5++;
        int v8 = v9;
        char v10 = v9;
        LODWORD(v6) = v6 + 1;
        *((_BYTE *)a4 + 8) = v10;
        if (v8 == 122)
        {
          --a3;
          *(void *)a4 = 1LL;
          goto LABEL_11;
        }

        if (v8 && v8 != 10) {
          *a4 = 2;
        }
        goto LABEL_54;
      case 1:
        if (a4[1]) {
          return 22LL;
        }
LABEL_11:
        if (!a3) {
          goto LABEL_46;
        }
        int v12 = *v5++;
        int v11 = v12;
        if (v12 < 0) {
          goto LABEL_61;
        }
        LODWORD(v6) = v6 + 1;
        a4[1] = 1;
        *((_BYTE *)a4 + 8) = v11;
        if (v11 != 87)
        {
          *a4 = 2;
          int v8 = 122;
          goto LABEL_55;
        }

        --a3;
        *(void *)a4 = 3LL;
LABEL_17:
        if (!a3) {
          goto LABEL_46;
        }
        int v14 = *v5++;
        int v8 = v14;
        char v15 = v14;
        --a3;
        LODWORD(v6) = v6 + 1;
        a4[1] = 1;
        *((_BYTE *)a4 + 8) = v15;
        if (v8 == 10)
        {
          int v7 = 0;
          *(void *)a4 = 0LL;
          continue;
        }

        if (!v8) {
          goto LABEL_24;
        }
LABEL_29:
        if (!a3)
        {
LABEL_46:
          uint64_t result = 0LL;
          uint64_t v6 = -2LL;
          goto LABEL_60;
        }

        int v18 = *v5++;
        unsigned __int8 v17 = v18;
        if (v18 < 0) {
          goto LABEL_61;
        }
        int v8 = v17;
        LODWORD(v6) = v6 + 1;
        a4[1] = 2;
        *((_BYTE *)a4 + 9) = v17;
        int v19 = *((unsigned __int8 *)a4 + 8);
        if (v19 == 35)
        {
          if (v8 == 32) {
            goto LABEL_54;
          }
          if (v8 != 10)
          {
            goto LABEL_51;
          }

LABEL_24:
          *(void *)a4 = 0LL;
        }

        else
        {
          if (v19 != 32)
          {
LABEL_51:
            v8 |= v19 << 8;
          }

LABEL_54:
          a4[1] = 0;
        }

LABEL_55:
        if (a1) {
          *a1 = v8;
        }
        uint64_t result = 0LL;
        if (!v8) {
          LODWORD(v6) = 0;
        }
        uint64_t v6 = (int)v6;
LABEL_60:
        *a5 = v6;
        *a2 = v5;
        return result;
      case 2:
        int v20 = a4[1];
        if (v20 == 1)
        {
          int v23 = *((char *)a4 + 8);
          if (v23 < 0) {
            goto LABEL_61;
          }
        }

        else
        {
          if (v20) {
            return 22LL;
          }
          if (!a3) {
            goto LABEL_46;
          }
          if ((int)v6 > 6 || (v22 = *v5, ++v5, int v21 = v22, LOBYTE(v23) = v22, (char)v22 < 0))
          {
LABEL_61:
            *a5 = -1LL;
            return 92LL;
          }

          LODWORD(v6) = v6 + 1;
          *((_BYTE *)a4 + 8) = v23;
          if (v21 == 10 || !v21) {
            *a4 = 0;
          }
        }

        int v8 = v23;
        goto LABEL_54;
      case 3:
        int v13 = a4[1];
        if (!v13) {
          goto LABEL_17;
        }
        if (v13 == 1) {
          goto LABEL_29;
        }
        return 22LL;
      default:
        return 22LL;
    }
  }
}

uint64_t _citrus_ZW_wcrtomb_priv(void *a1, unint64_t a2, unsigned int a3, uint64_t a4, size_t *a5)
{
  if (*(_DWORD *)(a4 + 4)) {
    return 22LL;
  }
  if (a3 > 0x7F)
  {
    if (a3 <= 0x7E7E)
    {
      if (*(_DWORD *)a4 == 3)
      {
        unsigned int v10 = 0;
      }

      else
      {
        if (*(_DWORD *)a4) {
          return 22LL;
        }
        BOOL v9 = a2 >= 2;
        a2 -= 2LL;
        if (!v9) {
          return 7LL;
        }
        *(_WORD *)(a4 + 8) = 22394;
        *(void *)a4 = 0x200000003LL;
        unsigned int v10 = 2;
      }

      if (a2 < 2) {
        return 7LL;
      }
      if (BYTE1(a3) >= 0x21u)
      {
        *(_DWORD *)(a4 + 4) = v10 | 1;
        *(_BYTE *)(a4 + v10 + 8) = BYTE1(a3);
        if (a3 - 127 >= 0xFFFFFFA2)
        {
          size_t v8 = v10 + 2;
          *(_BYTE *)(a4 + (v10 | 1) + 8) = a3;
          goto LABEL_32;
        }
      }
    }

    *a5 = -1LL;
    return 92LL;
  }

  if (*(_DWORD *)a4 == 3)
  {
    if (a2 < 2) {
      return 7LL;
    }
    if (a3 == 10)
    {
      __int16 v11 = 2595;
    }

    else
    {
      if (a3)
      {
        *(_DWORD *)(a4 + 4) = 1;
        *(_BYTE *)(a4 + 8) = 32;
        *(_BYTE *)(a4 + 9) = a3;
        goto LABEL_29;
      }

      __int16 v11 = 10;
    }

    *(_WORD *)(a4 + 8) = v11;
    *(void *)a4 = 0x100000000LL;
LABEL_29:
    size_t v8 = 2LL;
    goto LABEL_32;
  }

  if (*(_DWORD *)a4) {
    return 22LL;
  }
  if (a3 != 10 && a3)
  {
    if (a2 >= 4)
    {
      *(_WORD *)(a4 + 8) = 22394;
      *(_BYTE *)(a4 + 10) = 32;
      *(_BYTE *)(a4 + 11) = a3;
      *(void *)a4 = 0x200000003LL;
      size_t v8 = 4LL;
      goto LABEL_32;
    }

    return 7LL;
  }

  *(_BYTE *)(a4 + 8) = a3;
  size_t v8 = 1LL;
LABEL_32:
  memcpy(a1, (const void *)(a4 + 8), v8);
  uint64_t result = 0LL;
  *a5 = v8;
  *(_DWORD *)(a4 + 4) = 0;
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