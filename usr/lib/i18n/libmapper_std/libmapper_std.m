uint64_t _citrus_mapper_std_mapper_init( uint64_t a1, uint64_t a2, const char *a3, const char *a4, int a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;
  void *v12;
  void *v13;
  unsigned int v14;
  char __str[1024];
  uint64_t v17;
  v17 = *MEMORY[0x1895F89C0];
  if (a7 < 0x18) {
    return 22LL;
  }
  *(void *)(a6 + 16) = 1LL;
  *(_OWORD *)a6 = xmmword_188F2EED0;
  v12 = malloc(0x70uLL);
  if (!v12) {
    return *__error();
  }
  v13 = v12;
  snprintf(__str, 0x400uLL, "%s/%.*s", a3, a5, a4);
  v7 = _citrus_map_file();
  if (!(_DWORD)v7)
  {
    v7 = _citrus_db_open();
    if (!(_DWORD)v7)
    {
      v14 = _citrus_db_lookup_string_by_string();
      if (v14)
      {
        if (v14 == 2) {
          v7 = 79LL;
        }
        else {
          v7 = v14;
        }
      }

      else if (_citrus_bcs_strcasecmp())
      {
        v7 = 0LL;
      }

      else
      {
        v7 = rowcol_init((uint64_t)v13);
        if (!(_DWORD)v7)
        {
          *(void *)(a2 + 8) = v13;
          return v7;
        }
      }

      MEMORY[0x1895DA5D0](v13[2]);
    }

    _citrus_unmap_file();
  }

  free(v13);
  return v7;
}

void _citrus_mapper_std_mapper_uninit(uint64_t a1)
{
  v1 = *(void **)(a1 + 8);
  v2 = (void (*)(void))v1[4];
  if (v2) {
    v2(*(void *)(a1 + 8));
  }
  MEMORY[0x1895DA5D0](v1[2]);
  _citrus_unmap_file();
  free(v1);
}

uint64_t _citrus_mapper_std_mapper_convert(uint64_t a1, uint64_t *a2)
{
  v2 = (int *)a2[2];
  if (*v2 < 1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[3];
  uint64_t v8 = *(void *)(a1 + 8);
  while (1)
  {
    int v9 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void))(v8 + 24))( v8,  v5,  *(unsigned int *)(v6 + 4 * v4),  v7,  0LL);
    if (v9) {
      break;
    }
    ++v4;
    v5 += 4LL;
    if (v4 >= *v2) {
      return 0LL;
    }
  }

  if ((v9 & 0x60000000) != 0) {
    _citrus_mapper_std_mapper_convert_cold_1();
  }
  if (v9 == 1)
  {
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v8 + 24))( v8,  v5,  *(unsigned int *)(v6 + 4 * v4),  v7,  1LL);
    BOOL v12 = v11 == 0;
    if (v11) {
      int v9 = 1;
    }
    else {
      int v9 = 6;
    }
    if (v12) {
      LODWORD(v4) = v4 + 1;
    }
  }

  int *v2 = v4;
  return ((*(_DWORD *)(a1 + 64) & 3) << 29) | v9;
}

uint64_t _citrus_mapper_std_mapper_getops(_OWORD *a1)
{
  __int128 v1 = *(_OWORD *)&off_18C75A660;
  *a1 = _citrus_mapper_std_mapper_ops;
  a1[1] = v1;
  return 0LL;
}

uint64_t rowcol_init(uint64_t a1)
{
  *(void *)(a1 + 24) = rowcol_convert;
  *(void *)(a1 + 32) = rowcol_uninit;
  LODWORD(result) = _citrus_db_lookup_by_string();
  if ((_DWORD)result) {
    goto LABEL_5;
  }
  if (_citrus_db_lookup_by_string() == 2)
  {
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + 64) = 0LL;
  }

  LODWORD(result) = _citrus_db_lookup_by_string();
  if ((_DWORD)result)
  {
LABEL_5:
    if ((_DWORD)result == 2) {
      return 79LL;
    }
    else {
      return result;
    }
  }

  if (v24 != 48)
  {
    if (v24 != 32) {
      return 79LL;
    }
    unsigned int v3 = bswap32(v23->u32[1]);
    *(_DWORD *)(a1 + 96) = v3;
    *(_DWORD *)(a1 + 100) = bswap32(v23[3].u32[0]);
    unsigned int v4 = bswap32(v23->i32[0]);
    *(_DWORD *)(a1 + 88) = v4;
    *(_DWORD *)(a1 + 92) = 0xFFFFFFFF >> -(char)v4;
    uint64_t v5 = (int8x8_t *)malloc(0x18uLL);
    *(void *)(a1 + 80) = v5;
    if (v5)
    {
      unint64_t v6 = 1LL;
      *(void *)(a1 + 72) = 1LL;
      unsigned int v7 = bswap32(v23[1].u32[0]);
      unsigned int v8 = bswap32(v23[1].u32[1]);
      if (v7 + v8)
      {
        if (v8 < v7)
        {
LABEL_14:
          free(v5);
          *(void *)(a1 + 80) = 0LL;
          return 79LL;
        }

        v5->i32[0] = v7;
        v5->i32[1] = v8;
        v5[1].i32[0] = v8 - v7 + 1;
        unint64_t v6 = 2LL;
        *(void *)(a1 + 72) = 2LL;
        uint64_t v5 = (int8x8_t *)((char *)v5 + 12);
      }

      unsigned int v14 = bswap32(v23[2].u32[0]);
      unsigned int v15 = bswap32(v23[2].u32[1]);
      if (v15 < v14) {
        return 79LL;
      }
      v5->i32[0] = v14;
      v5->i32[1] = v15;
      v5[1].i32[0] = v15 - v14 + 1;
      goto LABEL_27;
    }

    return 12LL;
  }

  unsigned int v3 = bswap32(v23->u32[1]);
  *(_DWORD *)(a1 + 96) = v3;
  *(_DWORD *)(a1 + 100) = bswap32(v23[5].u32[0]);
  unsigned int v4 = bswap32(v23->i32[0]);
  *(_DWORD *)(a1 + 88) = v4;
  *(_DWORD *)(a1 + 92) = 0xFFFFFFFF >> -(char)v4;
  unsigned int v9 = v23[5].u32[1];
  unint64_t v6 = bswap32(v9);
  *(void *)(a1 + 72) = v6;
  uint64_t v5 = (int8x8_t *)malloc(12 * v6);
  *(void *)(a1 + 80) = v5;
  if (!v5) {
    return 12LL;
  }
  if (v9)
  {
    v10 = v23 + 1;
    unint64_t v11 = v6;
    BOOL v12 = v5;
    do
    {
      int8x8_t v13 = vrev32_s8(*v10);
      *BOOL v12 = v13;
      v12[1].i32[0] = v13.i32[1] - v13.i32[0] + 1;
      ++v10;
      BOOL v12 = (int8x8_t *)((char *)v12 + 12);
    }

    while (--v11);
  }

LABEL_27:
  uint64_t result = 79LL;
  if (v4 <= 0x20 && ((1LL << v4) & 0x100010100LL) != 0 && v6 <= 0x20u / v4)
  {
    *(_DWORD *)(a1 + 104) = 0;
    *(_DWORD *)(a1 + 108) = v3;
    uint64_t result = _citrus_db_lookup_by_string();
    if ((result & 0xFFFFFFFD) == 0)
    {
      if (!(_DWORD)result) {
        *(int8x8_t *)(a1 + 104) = vrev32_s8(*v23);
      }
      uint64_t v16 = *(void *)(a1 + 72);
      uint64_t v17 = *(void *)(a1 + 80);
      uint64_t v18 = v16 - 1;
      uint64_t v19 = *(unsigned int *)(v17 + 12 * (v16 - 1) + 8);
      if (v16 != 1)
      {
        v20 = (unsigned int *)(v17 + 12 * v16 - 16);
        do
        {
          unsigned int v21 = *v20;
          v20 -= 3;
          v19 *= v21;
          --v18;
        }

        while (v18);
      }

      unint64_t v22 = v19 * ((unint64_t)*(unsigned int *)(a1 + 100) >> 3);
      uint64_t result = 79LL;
      if (!HIDWORD(v22))
      {
        if (*(void *)(a1 + 48) >= v22) {
          return 0LL;
        }
        else {
          return 79LL;
        }
      }
    }
  }

  return result;
}

uint64_t rowcol_convert(uint64_t a1, unsigned int *a2, unsigned int a3, uint64_t a4, int a5)
{
  if (a5)
  {
    if (!*(void *)(a1 + 64)) {
      return 1LL;
    }
    uint64_t v5 = (void *)(a1 + 56);
  }

  else
  {
    uint64_t v5 = (void *)(a1 + 40);
  }

  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(unsigned int *)(a1 + 88);
  unsigned int v8 = v6 * v7;
  if (v6 * v7)
  {
    unsigned int v8 = 0;
    unsigned int v9 = *(unsigned int **)(a1 + 80);
    uint64_t v10 = -(v6 * v7);
    char v11 = v7 * (v6 - 1);
    while (1)
    {
      unsigned int v12 = *(_DWORD *)(a1 + 92) & (a3 >> v11);
      if (v12 < *v9 || v12 > v9[1]) {
        break;
      }
      unsigned int v8 = v12 - *v9 + v9[2] * v8;
      v11 -= v7;
      v9 += 3;
      v10 += v7;
      if (!v10) {
        goto LABEL_10;
      }
    }

    int v15 = *(_DWORD *)(a1 + 104);
    if (v15 != 1)
    {
      if (!v15)
      {
        unsigned int v14 = *(_DWORD *)(a1 + 96);
LABEL_21:
        *a2 = v14;
        return 1LL;
      }

      return 5LL;
    }

    return 4LL;
  }

LABEL_10:
  int v13 = *(_DWORD *)(a1 + 100);
  switch(v13)
  {
    case 32:
      unsigned int v14 = bswap32(*(_DWORD *)(*v5 + 4 * v8));
      break;
    case 16:
      unsigned int v14 = bswap32(*(unsigned __int16 *)(*v5 + 2 * v8)) >> 16;
      break;
    case 8:
      unsigned int v14 = *(unsigned __int8 *)(*v5 + v8);
      break;
    default:
      return 5LL;
  }

  if (v14 == *(_DWORD *)(a1 + 96)) {
    goto LABEL_21;
  }
  if (v14 == *(_DWORD *)(a1 + 108)) {
    return 4LL;
  }
  uint64_t result = 0LL;
  *a2 = v14;
  return result;
}

void rowcol_uninit(uint64_t a1)
{
}

void _citrus_mapper_std_mapper_convert_cold_1()
{
  __assert_rtn("_citrus_mapper_std_mapper_convert", "citrus_mapper_std.c", 530, "_MAPPER_CONVERT_DIR(ret) == 0");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _citrus_bcs_strcasecmp()
{
  return MEMORY[0x189615338]();
}

uint64_t _citrus_db_close()
{
  return MEMORY[0x189615358]();
}

uint64_t _citrus_db_lookup_by_string()
{
  return MEMORY[0x189615368]();
}

uint64_t _citrus_db_lookup_string_by_string()
{
  return MEMORY[0x189615370]();
}

uint64_t _citrus_db_open()
{
  return MEMORY[0x189615378]();
}

uint64_t _citrus_map_file()
{
  return MEMORY[0x189615390]();
}

uint64_t _citrus_unmap_file()
{
  return MEMORY[0x1896153E0]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}