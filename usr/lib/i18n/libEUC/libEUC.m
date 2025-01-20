uint64_t _citrus_EUC_stdenc_init(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  uint64_t v11;
  unsigned int v12;
  unsigned __int8 *v13;
  BOOL v14;
  BOOL v15;
  int v17;
  int v20;
  uint64_t result;
  uint64_t v24;
  unsigned __int8 *v25;
  v7 = calloc(1uLL, 0x28uLL);
  if (!v7) {
    return *__error();
  }
  v8 = v7;
  if (a2)
  {
    while (1)
    {
      v9 = *a2;
      if (v9 != 32 && v9 != 9) {
        break;
      }
      ++a2;
    }

    v11 = 0LL;
    v7[9] = 1;
    while (1)
    {
      v12 = _citrus_bcs_strtol();
      v8[v11 + 5] = v12;
      v13 = v25;
      v14 = a2 == v25 || v25 == 0LL;
      v15 = v14 || v12 == 0;
      if (v15 || v12 > 4) {
        break;
      }
      if (v8[9] < v12) {
        v8[9] = v12;
      }
      while (1)
      {
        v17 = *v13;
        if (v17 != 32 && v17 != 9) {
          break;
        }
        ++v13;
      }

      v8[v11] = _citrus_bcs_strtol();
      a2 = v25;
      if (v13 == v25 || v25 == 0LL) {
        break;
      }
      while (1)
      {
        v20 = *a2;
        if (v20 != 32 && v20 != 9) {
          break;
        }
        ++a2;
      }

      if (++v11 == 4)
      {
        v8[4] = _citrus_bcs_strtol();
        if (a2 != v25 && v25 != 0LL)
        {
          result = 0LL;
          *(void *)(a1 + 8) = v8;
          v24 = v8[9];
          *a4 = 8LL;
          a4[1] = v24;
          a4[2] = 1LL;
          return result;
        }

        break;
      }
    }
  }

  free(v8);
  return 79LL;
}

void _citrus_EUC_stdenc_uninit(uint64_t a1)
{
  if (a1) {
    free(*(void **)(a1 + 8));
  }
}

uint64_t _citrus_EUC_stdenc_mbtocs( uint64_t a1, int *a2, int *a3, char **a4, uint64_t a5, int *a6, void *a7, uint64_t a8)
{
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = _citrus_EUC_mbrtowc_priv(v12, &v17, a4, a5, a6, a7);
  if (!(_DWORD)v13)
  {
    if (*a7 != -2LL)
    {
      int v14 = *(_DWORD *)(v12 + 16) & v17;
      int v15 = v14 ^ v17;
      *a2 = v14;
      *a3 = v15;
    }

    if (a8 && *(void *)a8) {
      (*(void (**)(void, void))a8)(*a3, *(void *)(a8 + 16));
    }
  }

  return v13;
}

uint64_t _citrus_EUC_stdenc_cstomb( uint64_t a1, char *a2, unint64_t a3, int a4, int a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v7 = *(void *)(a1 + 8);
  if (a4 == -1)
  {
    int v9 = 0;
  }

  else
  {
    if (a4 & ~*(_DWORD *)(v7 + 16) | *(_DWORD *)(v7 + 16) & a5) {
      return 22LL;
    }
    int v9 = a5 | a4;
  }

  return _citrus_EUC_wcrtomb_priv(v7, a2, a3, v9, a7);
}

uint64_t _citrus_EUC_stdenc_mbtowc( uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, void *a6, uint64_t a7)
{
  uint64_t v9 = _citrus_EUC_mbrtowc_priv(*(void *)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_EUC_stdenc_wctomb( uint64_t a1, char *a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_EUC_wcrtomb_priv(*(void *)(a1 + 8), a2, a3, a4, a6);
}

uint64_t _citrus_EUC_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0LL;
  return 0LL;
}

uint64_t _citrus_EUC_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_EUC_stdenc_getops(uint64_t a1)
{
  __int128 v1 = unk_18C7592A8;
  *(_OWORD *)a1 = _citrus_EUC_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  __int128 v2 = xmmword_18C7592B8;
  __int128 v3 = *(_OWORD *)&off_18C7592C8;
  __int128 v4 = xmmword_18C7592D8;
  *(void *)(a1 + 80) = qword_18C7592E8;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0LL;
}

uint64_t _citrus_EUC_mbrtowc_priv(uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, void *a6)
{
  v6 = *a3;
  if (!*a3)
  {
    uint64_t result = 0LL;
    *(void *)a5 = 0LL;
    *a6 = 0LL;
    return result;
  }

  int v7 = *a5;
  if ((*a5 - 1) >= 2)
  {
    if (v7)
    {
LABEL_20:
      *a5 = 0;
      *a6 = -1LL;
      return 92LL;
    }

    if (!a4)
    {
LABEL_30:
      uint64_t result = 0LL;
      *a6 = -2LL;
      *a3 = v6;
      return result;
    }

    char v10 = *v6++;
    *((_BYTE *)a5 + 4) = v10;
    int v8 = 1;
    *a5 = 1;
    --a4;
  }

  else
  {
    int v8 = *a5;
  }

  v11 = (unsigned __int8 *)(a5 + 1);
  if ((char)a5[1] < 0)
  {
    int v13 = *((unsigned __int8 *)a5 + 4);
    if (v13 == 142) {
      int v14 = 2;
    }
    else {
      int v14 = 1;
    }
    if (v13 == 143) {
      unsigned int v12 = 3;
    }
    else {
      unsigned int v12 = v14;
    }
  }

  else
  {
    unsigned int v12 = 0;
  }

  int v15 = *(_DWORD *)(a1 + 4LL * v12 + 20);
  if (!v15) {
    goto LABEL_20;
  }
  while (v8 < v15)
  {
    if (!a4) {
      goto LABEL_30;
    }
    char v16 = *v6++;
    *((_BYTE *)a5 + v8 + 4) = v16;
    int v8 = *a5 + 1;
    *a5 = v8;
    --a4;
  }

  uint64_t v17 = v12;
  *a3 = v6;
  BOOL v18 = v12 > 1;
  if (v12 <= 1) {
    int v19 = 0;
  }
  else {
    int v19 = -1;
  }
  if (v15 - v18 < 1)
  {
    int v20 = 0;
  }

  else
  {
    int v20 = 0;
    unsigned int v21 = v15 + v19 + 1;
    do
    {
      int v22 = *v11++;
      int v20 = v22 | (v20 << 8);
      --v21;
    }

    while (v21 > 1);
  }

  int v23 = v20 & ~*(_DWORD *)(a1 + 16) | *(_DWORD *)(a1 + 4 * v17);
  *a5 = 0;
  if (a2) {
    *a2 = v23;
  }
  uint64_t result = 0LL;
  int v24 = v15 - v7;
  if (!v23) {
    int v24 = 0;
  }
  *a6 = v24;
  return result;
}

uint64_t _citrus_EUC_wcrtomb_priv(uint64_t a1, char *a2, unint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v5 = 0LL;
  int v6 = *(_DWORD *)(a1 + 16) & a4;
  int v7 = v6 ^ a4;
  while (v6 != *(_DWORD *)(a1 + 4 * v5))
  {
    if (++v5 == 4)
    {
      unsigned int v8 = 1;
      goto LABEL_8;
    }
  }

  if ((_DWORD)v5 == 4) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = v5;
  }
LABEL_8:
  uint64_t v9 = a1 + 4LL * v8;
  int v12 = *(_DWORD *)(v9 + 20);
  char v10 = (unsigned int *)(v9 + 20);
  unsigned __int16 v11 = v12;
  if ((__int16)v12 > a3)
  {
    uint64_t result = 7LL;
    uint64_t v14 = -1LL;
    goto LABEL_23;
  }

  char v15 = v8 != 0;
  if (v8 == 2)
  {
    char v16 = -114;
    goto LABEL_14;
  }

  if (v8 == 3)
  {
    char v16 = -113;
LABEL_14:
    *a2++ = v16;
    --v11;
  }

  if ((__int16)v11 >= 1)
  {
    unint64_t v17 = 0LL;
    char v18 = v15 << 7;
    unsigned int v19 = v11;
    uint64x2_t v20 = (uint64x2_t)vdupq_n_s64((unint64_t)v11 - 1);
    uint64_t v21 = (v11 + 1) & 0x1FFFE;
    int32x2_t v22 = vadd_s32(vdup_n_s32(v19), (int32x2_t)0xFFFFFFFF00000000LL);
    do
    {
      int32x2_t v23 = vmovn_s64((int64x2_t)vcgeq_u64( v20,  (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v17), (int8x16_t)xmmword_188F12F80)));
      int32x2_t v24 = vadd_s32(v22, (int32x2_t)-1LL);
      if ((v23.i8[0] & 1) != 0) {
        a2[v17] = (v7 >> (8 * v24.i8[0])) | v18;
      }
      if ((v23.i8[4] & 1) != 0) {
        a2[v17 + 1] = (v7 >> (8 * v24.i8[4])) | v18;
      }
      v17 += 2LL;
      int32x2_t v22 = vadd_s32(v22, (int32x2_t)0x100000001LL);
    }

    while (v21 != v17);
  }

  uint64_t result = 0LL;
  uint64_t v14 = *v10;
LABEL_23:
  *a5 = v14;
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _citrus_bcs_strtol()
{
  return MEMORY[0x189615348]();
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}