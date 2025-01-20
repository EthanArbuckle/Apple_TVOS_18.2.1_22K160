uint64_t _citrus_VIQR_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unsigned __int8 *v13;
  size_t v14;
  int v15;
  _DWORD *v16;
  void *v17;
  int v18;
  unsigned __int8 *v19;
  int v20;
  _DWORD *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  v6 = calloc(1uLL, 0x18uLL);
  if (!v6) {
    return *__error();
  }
  v7 = v6;
  v6[2] = 1LL;
  *((_DWORD *)v6 + 2) = -1;
  v8 = malloc(0x30uLL);
  if (!v8)
  {
    v24 = 12LL;
    goto LABEL_29;
  }

  v9 = v8;
  v26 = a1;
  v27 = a4;
  v10 = 0LL;
  v8[5] = 0xFFFFFFFFLL;
  v8[3] = 0LL;
  v11 = v8 + 3;
  v8[2] = 0LL;
  v8[4] = v8 + 3;
  *v7 = v8;
  v12 = 1LL;
  while (1)
  {
    v13 = (unsigned __int8 *)*((void *)&mnemonic_rfc1456 + v10);
    if (v13) {
      break;
    }
LABEL_23:
    if (++v10 == 256)
    {
      v24 = 0LL;
      *(void *)(v26 + 8) = v7;
      *v27 = 12LL;
      v27[1] = v12;
      v27[2] = 1LL;
      return v24;
    }
  }

  v14 = strlen(*((const char **)&mnemonic_rfc1456 + v10));
  if (v12 < v14)
  {
    v7[2] = v14;
    v12 = v14;
  }

  v15 = *v13;
  if (*v13)
  {
    v16 = v11;
    while (1)
    {
      v16 = *(_DWORD **)v16;
      if (!v16) {
        break;
      }
      if (v16[11] == v15) {
        goto LABEL_14;
      }
    }

    v16 = malloc(0x30uLL);
    if (!v16)
    {
LABEL_26:
      v24 = 12LL;
      goto LABEL_27;
    }

    v16[10] = v15;
    v16[11] = v15;
    *((void *)v16 + 3) = 0LL;
    *((void *)v16 + 4) = v16 + 6;
    v17 = (void *)v9[4];
    *(void *)v16 = 0LL;
    *((void *)v16 + 1) = v17;
    *((void *)v16 + 2) = v9;
    *v17 = v16;
    v9[4] = v16;
LABEL_14:
    v20 = v13[1];
    v19 = v13 + 1;
    v18 = v20;
    if (!v20) {
      goto LABEL_31;
    }
    do
    {
      v21 = v16;
      v16 += 6;
      while (1)
      {
        v16 = *(_DWORD **)v16;
        if (!v16) {
          break;
        }
        if (v16[11] == v18) {
          goto LABEL_21;
        }
      }

      v16 = malloc(0x30uLL);
      if (!v16) {
        goto LABEL_26;
      }
      *((void *)v16 + 2) = v21;
      v16[10] = -1;
      v16[11] = v18;
      *((void *)v16 + 3) = 0LL;
      *((void *)v16 + 4) = v16 + 6;
      v22 = (void *)*((void *)v21 + 4);
      *(void *)v16 = 0LL;
      *((void *)v16 + 1) = v22;
      *v22 = v16;
      *((void *)v21 + 4) = v16;
LABEL_21:
      v23 = *++v19;
      v18 = v23;
    }

    while (v23);
    v16[10] = v10;
    goto LABEL_23;
  }

LABEL_31:
  v24 = 22LL;
LABEL_27:
  mnemonic_destroy(v9);
LABEL_29:
  free(v7);
  return v24;
}

void _citrus_VIQR_stdenc_uninit(uint64_t a1)
{
  if (a1)
  {
    v1 = *(void ***)(a1 + 8);
    mnemonic_destroy(*v1);
    free(v1);
  }
}

uint64_t _citrus_VIQR_stdenc_mbtocs( uint64_t a1, _DWORD *a2, int *a3, unsigned __int8 **a4, uint64_t a5, int *a6, uint64_t *a7, uint64_t a8)
{
  uint64_t v12 = _citrus_VIQR_mbrtowc_priv(*(uint64_t **)(a1 + 8), &v15, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
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

uint64_t _citrus_VIQR_stdenc_cstomb( uint64_t a1, void *a2, uint64_t a3, int a4, unsigned int a5, char *__src, size_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }

  else if (a4)
  {
    return 92LL;
  }

  return _citrus_VIQR_wcrtomb_priv(*(uint64_t ***)(a1 + 8), a2, a3, a5, __src, a7);
}

uint64_t _citrus_VIQR_stdenc_mbtowc( uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_VIQR_mbrtowc_priv(*(uint64_t **)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_VIQR_stdenc_wctomb(uint64_t a1, void *a2, uint64_t a3, unsigned int a4, char *a5, size_t *a6)
{
  return _citrus_VIQR_wcrtomb_priv(*(uint64_t ***)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t _citrus_VIQR_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, void *a5)
{
  if (*a4 > 1u) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a5 = 0LL;
  *a4 = 0;
  return result;
}

uint64_t _citrus_VIQR_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_VIQR_stdenc_getops(uint64_t a1)
{
  __int128 v1 = *(_OWORD *)algn_18C73FEF8;
  *(_OWORD *)a1 = _citrus_VIQR_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  __int128 v2 = xmmword_18C73FF08;
  __int128 v3 = *(_OWORD *)&off_18C73FF18;
  __int128 v4 = xmmword_18C73FF28;
  *(void *)(a1 + 80) = qword_18C73FF38;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0LL;
}

void mnemonic_destroy(void *a1)
{
  __int128 v2 = (void *)a1[3];
  if (v2)
  {
    do
    {
      __int128 v3 = (void *)*v2;
      mnemonic_destroy();
      __int128 v2 = v3;
    }

    while (v3);
  }

  free(a1);
}

uint64_t _citrus_VIQR_mbrtowc_priv( uint64_t *a1, int *a2, unsigned __int8 **a3, uint64_t a4, int *a5, uint64_t *a6)
{
  v7 = *a3;
  if (*a3)
  {
    uint64_t v10 = 0LL;
    v11 = (uint64_t *)*a1;
    uint64_t v12 = (uint64_t *)*a1;
    int v13 = *a3;
LABEL_3:
    char v14 = 1;
    while (1)
    {
      uint64_t v15 = v10;
      uint64_t v16 = *a5;
      if (v15 == v16)
      {
        if (!a4)
        {
          uint64_t result = 0LL;
          *a3 = v13;
          uint64_t v21 = -2LL;
          goto LABEL_19;
        }

        if ((_DWORD)v16 == 6)
        {
          *a6 = -1LL;
          return 92LL;
        }

        --a4;
        int v18 = *v13++;
        int v17 = v18;
        *a5 = v16 + 1;
        *((_BYTE *)a5 + v15 + 4) = v18;
      }

      else
      {
        int v17 = *((unsigned __int8 *)a5 + v15 + 4);
      }

      if (v17 != 92) {
        break;
      }
      char v14 = 0;
      uint64_t v10 = v15 + 1;
      if (v12 != v11)
      {
        int v22 = 92;
        goto LABEL_22;
      }
    }

    if ((v14 & 1) != 0)
    {
      uint64_t v10 = v15 + 1;
      v19 = v12 + 3;
      while (1)
      {
        v19 = (uint64_t *)*v19;
        if (!v19) {
          break;
        }
        if (*((_DWORD *)v19 + 11) == v17)
        {
          uint64_t v12 = v19;
          goto LABEL_3;
        }
      }
    }

    int v22 = v17;
LABEL_22:
    if (v12 == v11)
    {
      BOOL v26 = 0;
      uint64_t v24 = v15 + 1;
    }

    else
    {
      int v23 = *((_DWORD *)a1 + 2);
      while (1)
      {
        uint64_t v24 = v15;
        int v25 = *((_DWORD *)v12 + 10);
        BOOL v26 = v25 != v23;
        if (v25 != v23) {
          break;
        }
        uint64_t v12 = (uint64_t *)v12[2];
        uint64_t v15 = v24 - 1;
        if (v12 == v11) {
          goto LABEL_29;
        }
      }

      v11 = v12;
    }

LABEL_29:
    BOOL v27 = v17 == 92 && v26;
    uint64_t v28 = v24 + v27;
    int v29 = *a5 - v28;
    *a5 = v29;
    memmove(a5 + 1, (char *)a5 + v28 + 4, v29);
    if (v26) {
      int v22 = *((_DWORD *)v11 + 10);
    }
    if (a2) {
      *a2 = v22;
    }
    uint64_t result = 0LL;
    v30 = (unsigned __int8 *)(v13 - v7);
    if (!v22) {
      v30 = 0LL;
    }
    *a6 = (uint64_t)v30;
    *a3 = v13;
  }

  else
  {
    uint64_t result = 0LL;
    a5[2] = 0;
    *(void *)a5 = 0LL;
    uint64_t v21 = 1LL;
LABEL_19:
    *a6 = v21;
  }

  return result;
}

uint64_t _citrus_VIQR_wcrtomb_priv( uint64_t **a1, void *__dst, uint64_t a3, unsigned int a4, char *__src, size_t *a6)
{
  int v6 = *(_DWORD *)__src;
  if (*(_DWORD *)__src > 1u) {
    return 22LL;
  }
  char v8 = a4;
  if (a4 > 0xFF)
  {
    *a6 = -1LL;
    return 92LL;
  }

  v11 = (_BYTE *)mnemonic_rfc1456[a4];
  if (!v11)
  {
    if (!a3)
    {
LABEL_21:
      *a6 = -1LL;
      return 7LL;
    }

    uint64_t v16 = *a1;
    if (!v6)
    {
LABEL_16:
      int v18 = v16 + 3;
      while (1)
      {
        int v18 = (uint64_t *)*v18;
        if (!v18) {
          break;
        }
        if (*((_DWORD *)v18 + 11) == a4) {
          goto LABEL_23;
        }
      }

      int v6 = 0;
      uint64_t v16 = 0LL;
LABEL_23:
      *(_DWORD *)__src = v6 + 1;
      __src[v6 + 4] = a4;
      goto LABEL_24;
    }

    v16 += 3;
    while (1)
    {
      uint64_t v16 = (uint64_t *)*v16;
      if (!v16) {
        return 22LL;
      }
      if (*((_DWORD *)v16 + 11) == __src[4])
      {
        __src[4] = 92;
        goto LABEL_16;
      }
    }
  }

  *(_DWORD *)__src = 0;
  char v12 = *v11;
  if (*v11)
  {
    int v13 = v11 + 1;
    while (a3)
    {
      --a3;
      uint64_t v14 = *(int *)__src;
      *(_DWORD *)__src = v14 + 1;
      __src[v14 + 4] = v12;
      int v15 = *v13++;
      char v12 = v15;
      if (!v15) {
        goto LABEL_8;
      }
    }

    goto LABEL_21;
  }

LABEL_8:
  uint64_t v16 = 0LL;
  char v8 = 0;
LABEL_24:
  size_t v19 = *(int *)__src;
  memcpy(__dst, __src + 4, v19);
  *a6 = v19;
  if (v16 == *a1)
  {
    __src[4] = v8;
    int v20 = 1;
  }

  else
  {
    int v20 = 0;
  }

  uint64_t result = 0LL;
  *(_DWORD *)__src = v20;
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

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}