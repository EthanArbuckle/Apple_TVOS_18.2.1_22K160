uint64_t tuklib_physmem()
{
  uint64_t v0;
  uint64_t v1;
  v0 = sysconf(29);
  v1 = sysconf(200);
  if (v1 == -1 || v0 == -1) {
    return 0LL;
  }
  else {
    return v1 * v0;
  }
}

uint64_t tuklib_cpucores()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *(void *)v6 = 0x300000006LL;
  size_t v4 = 4LL;
  int v0 = sysctl(v6, 2u, &v5, &v4, 0LL, 0LL);
  if (v5 <= 0 || v4 != 4 || v0 == -1) {
    return 0LL;
  }
  else {
    return v5;
  }
}

uint64_t lzma_version_number()
{
  return 50040032LL;
}

const char *lzma_version_string()
{
  return "5.4.3";
}

void *lzma_alloc(unint64_t a1, uint64_t a2)
{
  if (a1 <= 1) {
    size_t v2 = 1LL;
  }
  else {
    size_t v2 = a1;
  }
  if (a2 && *(void *)a2) {
    return (void *)(*(uint64_t (**)(void, uint64_t, size_t))a2)(*(void *)(a2 + 16), 1LL, v2);
  }
  else {
    return malloc(v2);
  }
}

void *lzma_alloc_zero(unint64_t a1, void *a2)
{
  if (a1 <= 1) {
    size_t v2 = 1LL;
  }
  else {
    size_t v2 = a1;
  }
  if (!a2 || !*a2) {
    return calloc(1uLL, v2);
  }
  v3 = (void *)((uint64_t (*)(void, uint64_t, size_t))*a2)(a2[2], 1LL, v2);
  size_t v4 = v3;
  if (v3) {
    bzero(v3, v2);
  }
  return v4;
}

void lzma_free(void *a1, uint64_t a2)
{
  else {
    free(a1);
  }
}

size_t lzma_bufcpy(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v8 = *a2;
  uint64_t v9 = *a5;
  else {
    size_t v10 = a3 - *a2;
  }
  if (v10) {
    memcpy((void *)(a4 + v9), (const void *)(a1 + v8), v10);
  }
  *a2 = v10 + v8;
  *a5 = v10 + v9;
  return v10;
}

uint64_t lzma_next_filter_init(uint64_t a1, uint64_t a2, void *a3, __n128 a4)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, __n128))a3[1];
  if (*(uint64_t (**)(uint64_t, uint64_t, void *, __n128))(a1 + 16) != v7)
  {
    a4.n128_f64[0] = lzma_next_end(a1, a2);
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, __n128))a3[1];
  }

  *(void *)(a1 + 8) = *a3;
  *(void *)(a1 + 16) = v7;
  if (v7) {
    return v7(a1, a2, a3, a4);
  }
  else {
    return 0LL;
  }
}

double lzma_next_end(uint64_t a1, uint64_t a2)
{
  size_t v2 = (_OWORD *)(a1 + 16);
  if (*(void *)(a1 + 16))
  {
    size_t v4 = *(void (**)(void *))(a1 + 32);
    if (v4)
    {
      int v5 = *(void **)a1;
    }

    else
    {
      if (!a2 || (size_t v4 = *(void (**)(void *))(a2 + 8)) == 0LL)
      {
        free(*(void **)a1);
        goto LABEL_9;
      }

      int v5 = *(void **)(a2 + 16);
    }

    v4(v5);
LABEL_9:
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = -1LL;
    double result = 0.0;
    *size_t v2 = 0u;
    v2[1] = 0u;
    v2[2] = 0u;
    v2[3] = 0u;
  }

  return result;
}

uint64_t lzma_next_filter_update(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != *(void *)(a1 + 8)) {
    return 11LL;
  }
  if (*a3 == -1LL) {
    return 0LL;
  }
  return (*(uint64_t (**)(void, uint64_t, void, void *))(a1 + 64))(*(void *)a1, a2, 0LL, a3);
}

uint64_t lzma_strm_init(void *a1)
{
  if (!a1) {
    return 11LL;
  }
  uint64_t v2 = a1[7];
  if (v2) {
    goto LABEL_10;
  }
  uint64_t v3 = a1[6];
  if (v3 && *(void *)v3) {
    size_t v4 = (void *)(*(uint64_t (**)(void, uint64_t, uint64_t))v3)(*(void *)(v3 + 16), 1LL, 104LL);
  }
  else {
    size_t v4 = malloc(0x68uLL);
  }
  a1[7] = v4;
  if (v4)
  {
    *size_t v4 = 0LL;
    v4[1] = -1LL;
    *((_OWORD *)v4 + 1) = 0u;
    *((_OWORD *)v4 + 2) = 0u;
    *((_OWORD *)v4 + 3) = 0u;
    *((_OWORD *)v4 + 4) = 0u;
    uint64_t v2 = a1[7];
LABEL_10:
    uint64_t result = 0LL;
    *(_BYTE *)(v2 + 100) = 0;
    *(_DWORD *)(v2 + 96) = 0;
    uint64_t v6 = a1[7];
    *(_DWORD *)(v6 + 80) = 0;
    *(_BYTE *)(v6 + 101) = 0;
    a1[2] = 0LL;
    a1[5] = 0LL;
    return result;
  }

  return 5LL;
}

uint64_t lzma_code(uint64_t a1, unsigned int a2)
{
  if (!*(void *)a1 && *(void *)(a1 + 8)) {
    return 11LL;
  }
  if (!*(void *)(a1 + 24) && *(void *)(a1 + 32)) {
    return 11LL;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3) {
    return 11LL;
  }
  uint64_t result = 11LL;
  if (a2 <= 4)
  {
    int v5 = *(uint64_t (**)(void, void))(v3 + 24);
    if (v5)
    {
      if (*(_BYTE *)(v3 + a2 + 96))
      {
        if (*(void *)(a1 + 64)) {
          return 8LL;
        }
        if (*(void *)(a1 + 72)) {
          return 8LL;
        }
        if (*(void *)(a1 + 80)) {
          return 8LL;
        }
        if (*(void *)(a1 + 88)) {
          return 8LL;
        }
        if (*(void *)(a1 + 104)) {
          return 8LL;
        }
        if (*(void *)(a1 + 112)) {
          return 8LL;
        }
        if (*(void *)(a1 + 120)) {
          return 8LL;
        }
        if (*(_DWORD *)(a1 + 128)) {
          return 8LL;
        }
        uint64_t v9 = a1;
        if (*(_DWORD *)(a1 + 132))
        {
          return 8LL;
        }

        else
        {
          uint64_t result = 1LL;
          switch(*(_DWORD *)(v3 + 80))
          {
            case 0:
              if (a2 - 1 < 4) {
                *(_DWORD *)(v3 + 80) = a2;
              }
              goto LABEL_33;
            case 1:
              if (a2 != 1) {
                return 11LL;
              }
              goto LABEL_32;
            case 2:
              if (a2 != 2) {
                return 11LL;
              }
              goto LABEL_32;
            case 3:
              if (a2 != 3) {
                return 11LL;
              }
              goto LABEL_32;
            case 4:
              if (a2 != 4) {
                return 11LL;
              }
LABEL_32:
              if (*(void *)(v3 + 88) != *(void *)(a1 + 8)) {
                return 11LL;
              }
LABEL_33:
              uint64_t result = v5(*(void *)v3, *(void *)(a1 + 48));
              uint64_t v6 = *(void *)(v9 + 56);
              *(void *)(v6 + 88) = *(void *)(v9 + 8);
              switch((int)result)
              {
                case 0:
                  if (*(_BYTE *)(v6 + 101)) {
                    return 10LL;
                  }
                  uint64_t result = 0LL;
                  *(_BYTE *)(v6 + 101) = 1;
                  return result;
                case 1:
                  int v7 = *(_DWORD *)(v6 + 80) - 1;
                  else {
                    int v8 = dword_18116B300[v7];
                  }
                  *(_DWORD *)(v6 + 80) = v8;
                  goto LABEL_46;
                case 2:
                case 3:
                case 4:
                case 6:
                  goto LABEL_46;
                case 5:
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                  goto LABEL_38;
                case 12:
                  *(_BYTE *)(v6 + 101) = 0;
                  if (*(_DWORD *)(v6 + 80) == 3) {
                    *(_DWORD *)(v6 + 80) = 0;
                  }
                  return 12LL;
                default:
                  if ((_DWORD)result == 101)
                  {
                    uint64_t result = 0LL;
LABEL_46:
                    *(_BYTE *)(v6 + 101) = 0;
                  }

                  else
                  {
LABEL_38:
                    *(_DWORD *)(v6 + 80) = 6;
                  }

                  break;
              }

              break;
            default:
              return result;
          }
        }
      }
    }
  }

  return result;
}

void lzma_end(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2)
    {
      double end = lzma_next_end(v2, *(void *)(a1 + 48));
      uint64_t v4 = *(void *)(a1 + 48);
      else {
        free(*(void **)(a1 + 56));
      }
      *(void *)(a1 + 56) = 0LL;
    }
  }
}

void *lzma_get_progress(void *result, void *a2, void *a3)
{
  uint64_t v3 = (void *)result[7];
  uint64_t v4 = (uint64_t (*)(void))v3[5];
  if (v4) {
    return (void *)v4(*v3);
  }
  *a2 = result[2];
  *a3 = result[5];
  return result;
}

uint64_t lzma_get_check(uint64_t a1)
{
  v1 = *(void **)(a1 + 56);
  uint64_t v2 = (uint64_t (*)(void))v1[6];
  if (v2) {
    return v2(*v1);
  }
  else {
    return 0LL;
  }
}

uint64_t lzma_memusage(uint64_t result)
{
  if (result)
  {
    v1 = *(void **)(result + 56);
    if (v1 && (uint64_t v2 = (unsigned int (*)(void, uint64_t *, uint64_t *, void))v1[7]) != 0LL)
    {
      if (v2(*v1, &v4, &v3, 0LL)) {
        return 0LL;
      }
      else {
        return v4;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t lzma_memlimit_get(uint64_t result)
{
  if (result)
  {
    v1 = *(void **)(result + 56);
    if (v1 && (uint64_t v2 = (unsigned int (*)(void, uint64_t *, uint64_t *, void))v1[7]) != 0LL)
    {
      if (v2(*v1, &v3, &v4, 0LL)) {
        return 0LL;
      }
      else {
        return v4;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t lzma_memlimit_set(uint64_t a1, unint64_t a2)
{
  if (!a1) {
    return 11LL;
  }
  uint64_t v2 = *(void **)(a1 + 56);
  if (!v2) {
    return 11LL;
  }
  uint64_t v3 = (uint64_t (*)(void, uint64_t *, _BYTE *, uint64_t))v2[7];
  if (!v3) {
    return 11LL;
  }
  if (a2 <= 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = a2;
  }
  return v3(*v2, &v6, v7, v4);
}

uint64_t lzma_block_compressed_size(uint64_t a1, unint64_t a2)
{
  if (!lzma_block_unpadded_size(a1)) {
    return 11LL;
  }
  int v4 = *(_DWORD *)(a1 + 4);
  unint64_t v5 = lzma_check_size(*(_DWORD *)(a1 + 8)) + v4;
  BOOL v6 = a2 >= v5;
  unint64_t v7 = a2 - v5;
  if (v7 == 0 || !v6) {
    return 9LL;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8 != -1 && v8 != v7) {
    return 9LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t lzma_block_unpadded_size(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)result > 1u) {
      return 0LL;
    }
    uint64_t v1 = *(unsigned int *)(result + 4);
    uint64_t v3 = *(void *)(result + 16);
    if (v3 < -1 || v3 == 0)
    {
      return 0LL;
    }

    else
    {
      unsigned int v5 = *(_DWORD *)(result + 8);
      if (v5 >= 0x10) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = -1LL;
      }
      if (v3 != -1 && v5 <= 0xF)
      {
        uint64_t v6 = v3 + v1;
        unsigned int v7 = lzma_check_size(v5);
        else {
          return 0LL;
        }
      }
    }
  }

  return result;
}

unint64_t lzma_block_total_size(uint64_t a1)
{
  uint64_t v1 = lzma_block_unpadded_size(a1);
  if (v1 == -1) {
    return -1LL;
  }
  else {
    return (v1 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  }
}

BOOL lzma_easy_preset(void *a1, int a2)
{
  uint64_t v3 = a1 + 10;
  int v4 = lzma_lzma_preset((uint64_t)(a1 + 10), a2);
  if (!v4)
  {
    *a1 = 33LL;
    a1[1] = v3;
    a1[2] = -1LL;
  }

  return v4 != 0;
}

uint64_t lzma_filters_copy(uint64_t *a1, void *__dst, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v3 = 11LL;
  if (!a1 || !__dst) {
    return v3;
  }
  uint64_t v6 = *a1;
  if (*a1 != -1)
  {
    uint64_t v8 = 0LL;
    while (v8 != 4)
    {
      __src[2 * v8] = v6;
      uint64_t v9 = &a1[2 * v8];
      uint64_t v11 = v9[1];
      size_t v10 = (const void **)(v9 + 1);
      if (v11)
      {
        if (v6 != 0x4000000000000001LL)
        {
          uint64_t v13 = 0LL;
          v14 = &qword_18116B328;
          while (v13 != -11)
          {
            uint64_t v15 = *v14;
            v14 += 3;
            --v13;
            if (v6 == v15)
            {
              uint64_t v12 = -v13;
              goto LABEL_14;
            }
          }

          uint64_t v3 = 8LL;
          if (!v8) {
            return v3;
          }
LABEL_24:
          v19 = (void **)&__src[2 * v8 - 1];
          do
          {
            --v8;
            v20 = *v19;
            v19 -= 2;
            lzma_free(v20, a3);
          }

          while (v8);
          return v3;
        }

        uint64_t v12 = 0LL;
LABEL_14:
        unint64_t v16 = features[3 * v12 + 1];
        v17 = lzma_alloc(v16, a3);
        __src[2 * v8 + 1] = v17;
        if (!v17)
        {
          uint64_t v3 = 5LL;
          if (!v8) {
            return v3;
          }
          goto LABEL_24;
        }

        memcpy(v17, *v10, v16);
      }

      else
      {
        __src[2 * v8 + 1] = 0LL;
      }

      ++v8;
      uint64_t v6 = a1[2 * v8];
      if (v6 == -1) {
        goto LABEL_21;
      }
    }

    uint64_t v3 = 8LL;
    goto LABEL_24;
  }

  uint64_t v8 = 0LL;
LABEL_21:
  v18 = &__src[2 * v8];
  void *v18 = -1LL;
  v18[1] = 0LL;
  memcpy(__dst, __src, 16 * v8 + 16);
  return 0LL;
}

void lzma_filters_free(void *a1, uint64_t a2)
{
  if (a1 && *a1 != -1LL)
  {
    uint64_t v4 = 0LL;
    do
    {
      unsigned int v5 = &a1[v4];
      lzma_free((void *)a1[v4 + 1], a2);
      *unsigned int v5 = -1LL;
      v5[1] = 0LL;
      if (v4 == 6) {
        break;
      }
      v4 += 2LL;
    }

    while (v5[2] != -1LL);
  }

uint64_t lzma_validate_chain(uint64_t *a1, unint64_t *a2)
{
  if (!a1) {
    return 11LL;
  }
  uint64_t v2 = *a1;
  if (*a1 == -1) {
    return 11LL;
  }
  unint64_t v3 = 0LL;
  unint64_t v4 = 0LL;
  BOOL v5 = 1;
  do
  {
    if (v2 != 0x4000000000000001LL)
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = &qword_18116B328;
      while (v7 != -11)
      {
        uint64_t v9 = *v8;
        v8 += 3;
        --v7;
        if (v2 == v9)
        {
          unint64_t v6 = -v7;
          if (!v5) {
            return 8LL;
          }
          goto LABEL_11;
        }
      }

      return 8LL;
    }

    unint64_t v6 = 0LL;
    if (!v5) {
      return 8LL;
    }
LABEL_11:
    if (v6 < 3) {
      ++v3;
    }
    BOOL v5 = v6 - 3 < 8;
    ++v4;
    uint64_t v2 = a1[2 * v4];
  }

  while (v2 != -1);
  uint64_t result = 8LL;
  if (v4 <= 4 && v6 <= 2 && v3 <= 3)
  {
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t lzma_raw_coder_init(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t), char a5)
{
  uint64_t v7 = a3;
  v29[13] = *MEMORY[0x1895F89C0];
  uint64_t filter_init = lzma_validate_chain(a3, &v27);
  if (!(_DWORD)filter_init)
  {
    unint64_t v12 = v27;
    if ((a5 & 1) != 0)
    {
      if (v27)
      {
        uint64_t v13 = &v28[3 * v27 - 1];
        unint64_t v14 = v27;
        do
        {
          uint64_t v15 = a4(*v7);
          if (!v15) {
            return 8LL;
          }
          uint64_t v16 = *(void *)(v15 + 8);
          if (!v16) {
            return 8LL;
          }
          uint64_t v17 = *v7;
          uint64_t v18 = v7[1];
          v7 += 2;
          *(v13 - 2) = v17;
          *(v13 - 1) = v16;
          *uint64_t v13 = v18;
          v13 -= 3;
        }

        while (--v14);
      }
    }

    else if (v27)
    {
      v19 = v29;
      unint64_t v20 = v27;
      do
      {
        uint64_t v21 = a4(*v7);
        if (!v21) {
          return 8LL;
        }
        uint64_t v22 = *(void *)(v21 + 8);
        if (!v22) {
          return 8LL;
        }
        uint64_t v23 = *v7;
        uint64_t v24 = v7[1];
        v7 += 2;
        *(v19 - 2) = v23;
        *(v19 - 1) = v22;
        uint64_t *v19 = v24;
        v19 += 3;
      }

      while (--v20);
    }

    v25 = &v28[3 * v12];
    void *v25 = -1LL;
    v25[1] = 0LL;
    uint64_t filter_init = lzma_next_filter_init(a1, a2, v28, v11);
    if ((_DWORD)filter_init) {
      lzma_next_end(a1, a2);
    }
  }

  return filter_init;
}

uint64_t lzma_raw_coder_memusage(uint64_t (*a1)(uint64_t), uint64_t *a2)
{
  if (!lzma_validate_chain(a2, &v12))
  {
    uint64_t v5 = 0LL;
    uint64_t v8 = *a2;
    uint64_t v7 = a2 + 2;
    uint64_t v6 = v8;
    while (1)
    {
      uint64_t v9 = a1(v6);
      if (!v9) {
        break;
      }
      size_t v10 = *(uint64_t (**)(void))(v9 + 16);
      if (v10)
      {
        uint64_t result = v10(*(v7 - 1));
        if (result == -1) {
          return result;
        }
        v5 += result;
      }

      else
      {
        v5 += 1024LL;
      }

      uint64_t v11 = *v7;
      v7 += 2;
      uint64_t v6 = v11;
      if (v11 == -1) {
        return v5 + 0x8000;
      }
    }
  }

  return -1LL;
}

void *lzma_index_init(uint64_t a1)
{
  uint64_t v2 = lzma_alloc(0x50uLL, a1);
  unint64_t v3 = v2;
  if (v2)
  {
    *uint64_t v2 = 0LL;
    v2[1] = 0LL;
    *((_DWORD *)v2 + 6) = 0;
    v2[2] = 0LL;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    v2[8] = 512LL;
    *((_DWORD *)v2 + 18) = 0;
    unint64_t v4 = lzma_alloc(0xA8uLL, a1);
    if (v4)
    {
      v4[4] = 0LL;
      *(_OWORD *)unint64_t v4 = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((_DWORD *)v4 + 10) = 1;
      v4[11] = 0LL;
      v4[12] = 0LL;
      *((_OWORD *)v4 + 3) = 0u;
      *((_OWORD *)v4 + 4) = 0u;
      *((_DWORD *)v4 + 20) = 0;
      *((_DWORD *)v4 + 26) = -1;
      v4[20] = 0LL;
      index_tree_append((uint64_t)v3, v4);
    }

    else
    {
      lzma_free(v3, a1);
      return 0LL;
    }
  }

  return v3;
}

uint64_t index_tree_append(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 16);
  a2[3] = 0LL;
  a2[4] = 0LL;
  a2[2] = v2;
  unsigned int v3 = *(_DWORD *)(result + 24) + 1;
  *(_DWORD *)(result + 24) = v3;
  if (*(void *)result)
  {
    *(void *)(v2 + 32) = a2;
    *(void *)(result + 16) = a2;
    if (v3 != 1 << (__clz(v3) ^ 0x1F))
    {
      unsigned int v4 = __clz(__rbit32(v3)) + 2;
      do
      {
        a2 = (void *)a2[2];
        --v4;
      }

      while (v4);
      uint64_t v5 = a2[4];
      uint64_t v6 = a2[2];
      uint64_t v7 = (void *)(v6 + 32);
      if (!v6) {
        uint64_t v7 = (void *)result;
      }
      *uint64_t v7 = v5;
      *(void *)(v5 + 16) = v6;
      uint64_t v8 = *(void *)(v5 + 24);
      a2[4] = v8;
      if (v8) {
        *(void *)(v8 + 16) = a2;
      }
      *(void *)(v5 + 24) = a2;
      a2[2] = v5;
    }
  }

  else
  {
    *(void *)uint64_t result = a2;
    *(void *)(result + 8) = a2;
    *(void *)(result + 16) = a2;
  }

  return result;
}

void lzma_index_end(uint64_t *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = *a1;
    if (v4) {
      index_tree_node_end(v4, a2, (uint64_t (*)(void, void))index_stream_end);
    }
    lzma_free(a1, a2);
  }

void index_stream_end(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[7];
  if (v4) {
    index_tree_node_end(v4, a2, (uint64_t (*)(void, void))lzma_free);
  }
  lzma_free(a1, a2);
}

uint64_t lzma_index_prealloc(uint64_t result, unint64_t a2)
{
  uint64_t v2 = 0xFFFFFFFFFFFFFFBLL;
  if (a2 < 0xFFFFFFFFFFFFFFBLL) {
    uint64_t v2 = a2;
  }
  *(void *)(result + 64) = v2;
  return result;
}

uint64_t lzma_index_memusage(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 8288 * ((a2 + 511) >> 9);
  BOOL v4 = -113 - 296 * a1 >= v2
    && a2 <= 0xFD08E5500FD0800LL
    && (unint64_t)(a1 - 0x100000000LL) >= 0xFFFFFFFF00000001LL;
  uint64_t v5 = 296 * a1 + v2 + 112;
  if (v4) {
    return v5;
  }
  else {
    return -1LL;
  }
}

uint64_t lzma_index_memused(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 24);
  unint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = 8288 * ((v2 + 511) >> 9);
  BOOL v5 = -113LL - 296 * (unint64_t)v1 < v3 || v2 > 0xFD08E5500FD0800LL || v1 == 0;
  uint64_t v6 = v3 + 296LL * v1 + 112;
  if (v5) {
    return -1LL;
  }
  else {
    return v6;
  }
}

uint64_t lzma_index_block_count(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t lzma_index_stream_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

unint64_t lzma_index_size(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  return (v1 + lzma_vli_size(*(void *)(a1 + 48)) + 1 + 7) & 0xFFFFFFFFFFFFFFFCLL;
}

uint64_t lzma_index_total_size(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

unint64_t lzma_index_stream_size(void *a1)
{
  uint64_t v1 = a1[5];
  uint64_t v2 = a1[7];
  return v1 + ((v2 + lzma_vli_size(a1[6]) + 1 + 7) & 0xFFFFFFFFFFFFFFFCLL) + 24;
}

uint64_t lzma_index_file_size(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  unint64_t v2 = v1[9];
  if (v2) {
    unint64_t v2 = (*(void *)(v2 + 16LL * *(void *)(v2 + 56) + 72) + 3LL) & 0xFFFFFFFFFFFFFFFCLL;
  }
  uint64_t v3 = v1[1] + v2 + v1[20] + 24;
  if (v3 < 0) {
    return -1LL;
  }
  uint64_t v4 = v1[12];
  int v5 = lzma_vli_size(v1[11]);
  else {
    return ((v4 + (v5 + 1) + 7) & 0xFFFFFFFFFFFFFFFCLL) + v3;
  }
}

uint64_t lzma_index_uncompressed_size(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t lzma_index_checks(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 16);
  if (*(_DWORD *)(v3 + 104) != -1) {
    return (1 << *(_DWORD *)(v3 + 120)) | result;
  }
  return result;
}

uint64_t lzma_index_padding_size(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56);
  return (3 - v1 - lzma_vli_size(*(void *)(a1 + 48))) & 3;
}

__n128 lzma_index_stream_flags(uint64_t a1, uint64_t a2)
{
  if (a1 && a2 && !lzma_stream_flags_compare(a2, a2))
  {
    uint64_t v5 = *(void *)(a1 + 16);
    __n128 result = *(__n128 *)a2;
    __int128 v6 = *(_OWORD *)(a2 + 16);
    __int128 v7 = *(_OWORD *)(a2 + 32);
    *(void *)(v5 + 152) = *(void *)(a2 + 48);
    *(_OWORD *)(v5 + 136) = v7;
    *(_OWORD *)(v5 + 120) = v6;
    *(__n128 *)(v5 + 104) = result;
  }

  return result;
}

uint64_t lzma_index_stream_padding(uint64_t a1, uint64_t a2)
{
  uint64_t result = 11LL;
  if (a1 && (a2 & 0x8000000000000003LL) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 16);
    uint64_t v6 = *(void *)(v5 + 160);
    *(void *)(v5 + 160) = 0LL;
    uint64_t v7 = lzma_index_file_size(a1);
    if (v7 + a2 >= 0) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = v6;
    }
    uint64_t result = ((v7 + a2) >> 63) & 9;
    *(void *)(v5 + 160) = v8;
  }

  return result;
}

uint64_t lzma_index_append(void *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result = 11LL;
  if ((a4 & 0x8000000000000000LL) == 0 && a1 && a3 - 0x7FFFFFFFFFFFFFFDLL >= 0x8000000000000008LL)
  {
    uint64_t v9 = (void *)a1[2];
    size_t v10 = (void *)v9[9];
    if (v10)
    {
      uint64_t v11 = &v10[2 * v10[7]];
      uint64_t v12 = v11[8];
      unint64_t v13 = (v11[9] + 3LL) & 0xFFFFFFFFFFFFFFFCLL;
    }

    else
    {
      unint64_t v13 = 0LL;
      uint64_t v12 = 0LL;
    }

    if ((uint64_t)(v12 + a4) >= 0)
    {
      uint64_t v34 = v12 + a4;
      int v14 = lzma_vli_size(a3);
      int v15 = lzma_vli_size(a4);
      int64_t v16 = ((v13 + a3 + 3) & 0xFFFFFFFFFFFFFFFCLL) + v9[1] + v9[20] + 24;
      if (v16 >= 0)
      {
        unint64_t v31 = v13;
        unint64_t v32 = v13 + a3;
        unint64_t v29 = v9[11] + 1LL;
        uint64_t v33 = (v15 + v14);
        uint64_t v30 = v9[12];
        if ((uint64_t)(((v33 + 7 + v30 + lzma_vli_size(v29) + 1) & 0xFFFFFFFFFFFFFFFCLL) + v16) >= 0)
        {
          uint64_t v17 = a1[7];
          unint64_t v18 = a1[6] + 1LL;
          if (((v33 + 7 + v17 + lzma_vli_size(v18) + 1) & 0xFFFFFFFFFFFFFFFCLL) <= 0x400000000LL)
          {
            if (v10 && (unint64_t v19 = v10[7] + 1LL, v19 < v10[6]))
            {
              v10[7] = v19;
              uint64_t v21 = v33;
              uint64_t v20 = v34;
              unint64_t v22 = v32;
              uint64_t v24 = v29;
              uint64_t v23 = v30;
            }

            else
            {
              v25 = lzma_alloc(16LL * a1[8] + 64, a2);
              if (!v25) {
                return 5LL;
              }
              size_t v10 = v25;
              v25[7] = 0LL;
              uint64_t v26 = a1[8];
              a1[8] = 512LL;
              void *v25 = v12;
              v25[1] = v31;
              v25[5] = v9[11] + 1LL;
              v25[6] = v26;
              index_tree_append((uint64_t)(v9 + 7), v25);
              unint64_t v19 = v10[7];
              uint64_t v23 = v9[12];
              uint64_t v17 = a1[7];
              uint64_t v24 = v9[11] + 1LL;
              unint64_t v18 = a1[6] + 1LL;
              uint64_t v21 = v33;
              uint64_t v20 = v34;
              unint64_t v22 = v32;
            }

            uint64_t result = 0LL;
            unint64_t v27 = &v10[2 * v19];
            v27[8] = v20;
            v27[9] = v22;
            v9[11] = v24;
            v9[12] = v23 + v21;
            unint64_t v28 = a1[5] + ((a3 + 3) & 0xFFFFFFFFFFFFFFFCLL);
            a1[4] += a4;
            a1[5] = v28;
            a1[6] = v18;
            a1[7] = v17 + v21;
            return result;
          }
        }
      }
    }

    return 9LL;
  }

  return result;
}

uint64_t lzma_index_cat(int64x2_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 11LL;
  if (a1 && a2)
  {
    uint64_t v7 = lzma_index_file_size((uint64_t)a1);
    if (lzma_index_file_size(a2) + v7 < 0) {
      return 9LL;
    }
    if (*(void *)(a2 + 32) + a1[2].i64[0] < 0) {
      return 9LL;
    }
    uint64_t v8 = a1[3].i64[1];
    uint64_t v9 = lzma_vli_size(a1[3].u64[0]) + 1;
    uint64_t v10 = *(void *)(a2 + 56);
    if (((v8 + v10 + v9 + lzma_vli_size(*(void *)(a2 + 48)) + 1 + 11) & 0xFFFFFFFFFFFFFFFCLL) > 0x400000000LL)
    {
      return 9LL;
    }

    else
    {
      uint64_t v11 = a1[1].i64[0];
      uint64_t v12 = *(void **)(v11 + 72);
      if (v12)
      {
        unint64_t v13 = v12[7] + 1LL;
        if (v13 < v12[6])
        {
          int v14 = lzma_alloc(16 * v13 + 64, a3);
          if (!v14) {
            return 5LL;
          }
          int v15 = v14;
          __int128 v16 = *(_OWORD *)v12;
          __int128 v17 = *((_OWORD *)v12 + 1);
          v14[4] = v12[4];
          *(_OWORD *)int v14 = v16;
          *((_OWORD *)v14 + 1) = v17;
          uint64_t v18 = v12[7];
          v14[6] = v18 + 1;
          v14[7] = v18;
          v14[5] = v12[5];
          memcpy(v14 + 8, v12 + 8, 16 * (v18 + 1));
          uint64_t v19 = v12[2];
          if (v19) {
            *(void *)(v19 + 32) = v15;
          }
          if (*(void **)(v11 + 64) == v12)
          {
            *(void *)(v11 + 56) = v15;
            *(void *)(v11 + 64) = v15;
          }

          *(void *)(v11 + 72) = v15;
          lzma_free(v12, a3);
          uint64_t v11 = a1[1].i64[0];
        }
      }

      __int32 v20 = a1[4].i32[2];
      if (*(_DWORD *)(v11 + 104) != -1) {
        v20 |= 1 << *(_DWORD *)(v11 + 120);
      }
      a1[4].i32[2] = v20;
      v22.i64[0] = a1[2].i64[0];
      v22.i64[1] = v7;
      uint64_t v23 = a1[3].i64[0];
      __int32 v24 = a1[1].i32[2];
      v25 = a1;
      index_cat_helper(&v22, *(int64x2_t **)a2);
      int64x2_t v21 = vaddq_s64(a1[3], *(int64x2_t *)(a2 + 48));
      a1[2] = vaddq_s64(a1[2], *(int64x2_t *)(a2 + 32));
      a1[3] = v21;
      a1[4].i32[2] |= *(_DWORD *)(a2 + 72);
      lzma_free((void *)a2, a3);
      return 0LL;
    }
  }

  return result;
}

uint64_t index_cat_helper(int64x2_t *a1, int64x2_t *a2)
{
  do
  {
    uint64_t v4 = (int64x2_t *)a2[2].i64[0];
    if (a2[1].i64[1]) {
      index_cat_helper(a1);
    }
    *a2 = vaddq_s64(*a2, *a1);
    a2[2].i32[2] += a1[1].i32[2];
    a2[3].i64[0] += a1[1].i64[0];
    uint64_t result = index_tree_append(a1[2].i64[0], a2);
    a2 = v4;
  }

  while (v4);
  return result;
}

uint64_t *lzma_index_dup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t *)lzma_alloc(0x50uLL, a2);
  uint64_t v5 = v4;
  if (v4)
  {
    *uint64_t v4 = 0LL;
    v4[1] = 0LL;
    *((_DWORD *)v4 + 6) = 0;
    v4[2] = 0LL;
    v4[8] = 512LL;
    *((_DWORD *)v4 + 18) = 0;
    __int128 v6 = *(_OWORD *)(a1 + 48);
    *((_OWORD *)v4 + 2) = *(_OWORD *)(a1 + 32);
    *((_OWORD *)v4 + 3) = v6;
    uint64_t v7 = *(uint64_t **)(a1 + 8);
    uint64_t v8 = v7 + 11;
    if ((unint64_t)v7[11] <= 0xFFFFFFFFFFFFFFBLL)
    {
      do
      {
        uint64_t v11 = *v7;
        uint64_t v10 = v7[1];
        int v12 = *((_DWORD *)v7 + 10);
        uint64_t v13 = v7[6];
        int v14 = (char *)lzma_alloc(0xA8uLL, a2);
        if (!v14) {
          break;
        }
        int v15 = v14;
        *(void *)int v14 = v11;
        *((void *)v14 + 1) = v10;
        *((void *)v14 + 3) = 0LL;
        *((void *)v14 + 4) = 0LL;
        *((void *)v14 + 2) = 0LL;
        *((_DWORD *)v14 + 10) = v12;
        *((void *)v14 + 6) = v13;
        *((void *)v14 + 7) = 0LL;
        uint64_t v16 = (uint64_t)(v14 + 56);
        *((void *)v14 + 8) = 0LL;
        *((void *)v14 + 9) = 0LL;
        *((_DWORD *)v14 + 20) = 0;
        uint64_t v17 = *v8;
        uint64_t v18 = v7[12];
        *((void *)v14 + 11) = *v8;
        *((void *)v14 + 12) = v18;
        __int128 v19 = *(_OWORD *)(v7 + 13);
        __int128 v20 = *(_OWORD *)(v7 + 15);
        __int128 v21 = *(_OWORD *)(v7 + 17);
        *((void *)v14 + 19) = v7[19];
        *(_OWORD *)(v14 + 136) = v21;
        *(_OWORD *)(v14 + 120) = v20;
        *(_OWORD *)(v14 + 104) = v19;
        *((void *)v14 + 20) = v7[20];
        if (v7[8])
        {
          int64x2_t v22 = lzma_alloc(16 * v17 + 64, a2);
          if (!v22)
          {
            index_stream_end(v15, a2);
            break;
          }

          uint64_t v23 = v22;
          uint64_t v24 = 0LL;
          *int64x2_t v22 = 0LL;
          v22[1] = 0LL;
          v22[5] = 1LL;
          uint64_t v25 = *v8 - 1;
          v22[6] = *v8;
          v22[7] = v25;
          uint64_t v26 = (void *)v7[8];
          unint64_t v27 = v22 + 8;
LABEL_9:
          while (1)
          {
            memcpy(&v27[2 * v24], v26 + 8, 16LL * v26[7] + 16);
            v24 += v26[7] + 1LL;
            unint64_t v28 = (void *)v26[4];
            unint64_t v29 = v26;
            if (!v28) {
              break;
            }
            do
            {
              uint64_t v26 = v28;
              unint64_t v28 = (void *)v28[3];
            }

            while (v28);
          }

          while (1)
          {
            uint64_t v26 = (void *)v29[2];
            if (!v26) {
              break;
            }
            BOOL v30 = v26[4] == (void)v29;
            unint64_t v29 = (void *)v29[2];
            if (!v30) {
              goto LABEL_9;
            }
          }

          index_tree_append(v16, v23);
        }

        index_tree_append((uint64_t)v5, v15);
        unint64_t v31 = (uint64_t *)v7[4];
        if (!v31)
        {
          while (1)
          {
            unint64_t v32 = (uint64_t *)v7[2];
            if (!v32) {
              return v5;
            }
            BOOL v30 = v32[4] == (void)v7;
            uint64_t v7 = (uint64_t *)v7[2];
            if (!v30) {
              goto LABEL_21;
            }
          }
        }

        do
        {
          unint64_t v32 = v31;
          unint64_t v31 = (uint64_t *)v31[3];
        }

        while (v31);
LABEL_21:
        uint64_t v8 = v32 + 11;
        uint64_t v7 = v32;
      }

      while ((unint64_t)v32[11] <= 0xFFFFFFFFFFFFFFBLL);
    }

    lzma_index_end(v5, a2);
    return 0LL;
  }

  return v5;
}

double lzma_index_iter_init(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 256) = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  return result;
}

double lzma_index_iter_rewind(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  return result;
}

uint64_t lzma_index_iter_next(uint64_t a1, unsigned int a2)
{
  if (a2 > 3) {
    return 1LL;
  }
  uint64_t v3 = *(void *)(a1 + 264);
  unint64_t v4 = *(void *)(a1 + 280);
  if (a2 == 1) {
    goto LABEL_8;
  }
  uint64_t v5 = *(void *)(a1 + 288);
  if (v5 == 2)
  {
    __int128 v6 = (void **)(v3 + 64);
    goto LABEL_10;
  }

  if (v5 != 1)
  {
    if (!v5)
    {
      __int128 v6 = (void **)(a1 + 272);
LABEL_10:
      uint64_t v7 = *v6;
      goto LABEL_16;
    }

LABEL_8:
    uint64_t v7 = 0LL;
    goto LABEL_16;
  }

  uint64_t v8 = *(void *)(a1 + 272);
  uint64_t v9 = *(void **)(v8 + 32);
  if (v9)
  {
    do
    {
      uint64_t v7 = v9;
      uint64_t v9 = (void *)v9[3];
    }

    while (v9);
  }

  else
  {
    do
    {
      uint64_t v7 = *(void **)(v8 + 16);
      if (!v7) {
        break;
      }
      BOOL v10 = v7[4] == v8;
      uint64_t v8 = *(void *)(v8 + 16);
    }

    while (v10);
  }

LABEL_16:
  while (v3)
  {
    if (!v7) {
      goto LABEL_34;
    }
    if (v4 >= v7[7])
    {
      unint64_t v4 = v7[4];
      if (!v4)
      {
        while (1)
        {
          uint64_t v13 = (void *)v7[2];
          if (!v13) {
            break;
          }
          BOOL v10 = v13[4] == (void)v7;
          uint64_t v7 = (void *)v7[2];
          if (!v10)
          {
            unint64_t v4 = 0LL;
            uint64_t v7 = v13;
            goto LABEL_42;
          }
        }

LABEL_34:
        while (1)
        {
          uint64_t v14 = *(void *)(v3 + 32);
          uint64_t v15 = v3;
          if (!v14) {
            break;
          }
          do
          {
            uint64_t v3 = v14;
            uint64_t v14 = *(void *)(v14 + 24);
          }

          while (v14);
LABEL_39:
          if (a2 < 2) {
            goto LABEL_49;
          }
          uint64_t v7 = *(void **)(v3 + 64);
          if (v7) {
            goto LABEL_41;
          }
        }

        while (1)
        {
          uint64_t v3 = *(void *)(v15 + 16);
          if (!v3) {
            return 1LL;
          }
          BOOL v10 = *(void *)(v3 + 32) == v15;
          uint64_t v15 = *(void *)(v15 + 16);
          if (!v10) {
            goto LABEL_39;
          }
        }
      }

      do
      {
        uint64_t v7 = (void *)v4;
        unint64_t v4 = *(void *)(v4 + 24);
      }

      while (v4);
    }

    else
    {
      ++v4;
    }

LABEL_42:
    if (a2 != 3) {
      goto LABEL_50;
    }
    if (v4)
    {
      if (v7[2 * v4 + 6] != v7[2 * v4 + 8]) {
        goto LABEL_50;
      }
    }

    else if (*v7 != v7[8])
    {
      unint64_t v4 = 0LL;
      goto LABEL_50;
    }
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 256) + 8LL);
  if (a2 >= 2)
  {
    while (1)
    {
LABEL_21:
      uint64_t v7 = *(void **)(v3 + 64);
      if (v7)
      {
LABEL_41:
        unint64_t v4 = 0LL;
        goto LABEL_42;
      }

      uint64_t v11 = *(void *)(v3 + 32);
      uint64_t v12 = v3;
      if (!v11) {
        break;
      }
      do
      {
        uint64_t v3 = v11;
        uint64_t v11 = *(void *)(v11 + 24);
      }

      while (v11);
    }

    while (1)
    {
      uint64_t v3 = *(void *)(v12 + 16);
      if (!v3) {
        return 1LL;
      }
      BOOL v10 = *(void *)(v3 + 32) == v12;
      uint64_t v12 = *(void *)(v12 + 16);
      if (!v10) {
        goto LABEL_21;
      }
    }
  }

LABEL_49:
  unint64_t v4 = 0LL;
  uint64_t v7 = *(void **)(v3 + 64);
LABEL_50:
  *(void *)(a1 + 264) = v3;
  *(void *)(a1 + 272) = v7;
  *(void *)(a1 + 280) = v4;
  iter_set_info((uint64_t **)a1);
  return 0LL;
}

      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          v40 = 0;
          v379 = 5;
          goto LABEL_634;
        }

        v18 <<= 8;
        v60 = *(unsigned __int8 *)(v39 + v13++);
        uint64_t v12 = v60 | (v12 << 8);
      }

      v61 = v25;
      v62 = *(unsigned __int16 *)(v23 + 2LL * v25);
      v63 = (v18 >> 11) * v62;
      v25 *= 2;
      if (v12 >= v63)
      {
        v18 -= v63;
        *(_WORD *)(v23 + 2 * v61) = v62 - (v62 >> 5);
        v25 |= 1u;
        v12 -= v63;
      }

      else
      {
        *(_WORD *)(v23 + 2 * v61) = v62 + ((2048 - v62) >> 5);
        uint64_t v18 = (v18 >> 11) * v62;
      }

uint64_t iter_set_info(uint64_t **a1)
{
  uint64_t v3 = a1[33];
  unint64_t v2 = a1[34];
  if (v2)
  {
    if ((uint64_t *)a1[32][2] == v3 && (uint64_t *)v3[9] == v2)
    {
      if ((uint64_t *)v3[8] == v2)
      {
        a1[36] = (uint64_t *)2;
        a1[34] = 0LL;
      }

      else
      {
        a1[36] = (uint64_t *)1;
        a1[34] = (uint64_t *)v2[2];
      }
    }

    else
    {
      a1[36] = 0LL;
    }
  }

  else
  {
    a1[36] = (uint64_t *)2;
  }

  unint64_t v4 = a1[35];
  unint64_t v5 = v3[11];
  a1[4] = (uint64_t *)*((unsigned int *)v3 + 10);
  a1[5] = (uint64_t *)v5;
  uint64_t v7 = (uint64_t *)*v3;
  __int128 v6 = (uint64_t *)v3[1];
  a1[6] = v6;
  a1[7] = v7;
  uint64_t v8 = v3 + 13;
  if (*((_DWORD *)v3 + 26) == -1) {
    uint64_t v8 = 0LL;
  }
  *a1 = v8;
  a1[10] = (uint64_t *)v3[20];
  uint64_t v9 = v3[9];
  if (v9)
  {
    uint64_t v10 = v3[12];
    uint64_t result = lzma_vli_size(v5);
    uint64_t v12 = *(uint64_t **)(v9 + 16LL * *(void *)(v9 + 56) + 64);
  }

  else
  {
    uint64_t result = lzma_vli_size(0LL);
    uint64_t v12 = 0LL;
    uint64_t v13 = ((result + 1) + 7LL) & 0x1FFFFFFFCLL;
  }

  a1[8] = (uint64_t *)(v13 + 24);
  a1[9] = v12;
  if (v2)
  {
    uint64_t v14 = (uint64_t *)((char *)v4 + v2[5]);
    a1[18] = v14;
    a1[15] = (uint64_t *)((char *)v14 + v3[6]);
    if (v4)
    {
      uint64_t v15 = (uint64_t)v4 - 1;
      unint64_t v16 = (v2[2 * ((void)v4 - 1) + 9] + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }

    else
    {
      unint64_t v16 = v2[1];
      uint64_t v15 = -1LL;
    }

    a1[19] = (uint64_t *)v16;
    uint64_t v17 = &v2[2 * v15 + 8];
    if (!v4) {
      uint64_t v17 = v2;
    }
    uint64_t v18 = (uint64_t *)*v17;
    __int128 v19 = &v2[2 * (void)v4 + 8];
    __int128 v20 = (uint64_t *)(*v19 - (void)v18);
    unint64_t v21 = v19[1] - v16;
    a1[21] = v20;
    a1[22] = (uint64_t *)v21;
    a1[23] = (uint64_t *)((v21 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    unint64_t v22 = v16 + 12;
    a1[19] = (uint64_t *)v22;
    a1[20] = v18;
    a1[16] = (uint64_t *)((char *)v6 + v22);
    a1[17] = (uint64_t *)((char *)v7 + (void)v18);
  }

  return result;
}

uint64_t lzma_index_iter_locate(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 256);
  if (*(void *)(v2 + 32) <= a2) {
    return 1LL;
  }
  uint64_t v3 = *(unint64_t **)v2;
  if (*(void *)v2)
  {
    unint64_t v4 = 0LL;
    do
    {
      if (*v3 > a2)
      {
        uint64_t v5 = 3LL;
      }

      else
      {
        unint64_t v4 = v3;
        uint64_t v5 = 4LL;
      }

      uint64_t v3 = (unint64_t *)v3[v5];
    }

    while (v3);
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  unint64_t v7 = a2 - *v4;
  uint64_t v8 = (unint64_t *)v4[7];
  if (v8)
  {
    uint64_t v9 = 0LL;
    do
    {
      if (*v8 > v7)
      {
        uint64_t v10 = 3LL;
      }

      else
      {
        uint64_t v9 = v8;
        uint64_t v10 = 4LL;
      }

      uint64_t v8 = (unint64_t *)v8[v10];
    }

    while (v8);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  unint64_t v11 = v9[7];
  if (v11)
  {
    unint64_t v12 = 0LL;
    do
    {
      unint64_t v13 = v12 + ((v11 - v12) >> 1);
      if (v9[2 * v13 + 8] > v7) {
        unint64_t v11 = v12 + ((v11 - v12) >> 1);
      }
      else {
        unint64_t v12 = v13 + 1;
      }
    }

    while (v12 < v11);
  }

  else
  {
    unint64_t v12 = 0LL;
  }

  *(void *)(a1 + 264) = v4;
  *(void *)(a1 + 272) = v9;
  *(void *)(a1 + 280) = v12;
  iter_set_info((uint64_t **)a1);
  return 0LL;
}

uint64_t index_tree_node_end(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void))
{
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v8 = a3;
  if (v5)
  {
    index_tree_node_end(v5, a2, a3);
    a3 = v8;
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    index_tree_node_end(v6, a2, v8);
    a3 = v8;
  }

  return a3(a1, a2);
}

uint64_t lzma_stream_flags_compare(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 || *(_DWORD *)a2) {
    return 8LL;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  if (v3 > 0xF) {
    return 11LL;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 16);
  if (v4 > 0xF) {
    return 11LL;
  }
  if (v3 != v4) {
    return 9LL;
  }
  uint64_t v5 = *(void *)(a1 + 8);
  if (v5 == -1) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(a2 + 8);
  if (v6 == -1) {
    return 0LL;
  }
  uint64_t result = 11LL;
  if ((unint64_t)(v5 - 4) < 0x3FFFFFFFDLL
    && (v5 & 3) == 0
    && (unint64_t)(v6 - 4) < 0x3FFFFFFFDLL
    && (v6 & 3) == 0)
  {
    if (v5 == v6) {
      return 0LL;
    }
    return 9LL;
  }

  return result;
}

uint64_t lzma_vli_size(unint64_t a1)
{
  uint64_t v1 = 0LL;
  if ((a1 & 0x8000000000000000LL) == 0)
  {
    do
    {
      uint64_t v1 = (v1 + 1);
      BOOL v2 = a1 > 0x7F;
      a1 >>= 7;
    }

    while (v2);
  }

  return v1;
}

uint64_t lzma_alone_encoder(void *a1, _DWORD *a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = alone_encoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }

  return v4;
}

uint64_t alone_encoder_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  v15[6] = *MEMORY[0x1895F89C0];
  *(void *)(a1 + 16) = alone_encoder_init;
  uint64_t v6 = *(void *)a1;
  if (!*(void *)a1)
  {
    unint64_t v7 = lzma_alloc(0x70uLL, a2);
    if (!v7) {
      return 5LL;
    }
    uint64_t v6 = (uint64_t)v7;
    *(void *)a1 = v7;
    *(void *)(a1 + 24) = alone_encode;
    *(void *)(a1 + 32) = alone_encoder_end;
    *unint64_t v7 = 0LL;
    v7[1] = -1LL;
    *((_OWORD *)v7 + 1) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    *((_OWORD *)v7 + 4) = 0u;
  }

  *(_DWORD *)(v6 + 80) = 0;
  *(void *)(v6 + 88) = 0LL;
  if ((lzma_lzma_lclppb_encode(a3, (_BYTE *)(v6 + 96)) & 1) != 0 || *a3 < 0x1000u) {
    return 8LL;
  }
  unsigned int v10 = (*a3 - 1) | ((*a3 - 1) >> 2) | (((*a3 - 1) | ((*a3 - 1) >> 2)) >> 3);
  unsigned int v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
  int v12 = v11 | HIWORD(v11);
  BOOL v13 = __CFADD__(v12, 1);
  int v14 = v12 + 1;
  if (v13) {
    int v14 = -1;
  }
  *(_DWORD *)(v6 + 97) = v14;
  *(void *)(v6 + 101) = -1LL;
  v15[0] = 0x4000000000000001LL;
  v15[1] = lzma_lzma_encoder_init;
  v15[2] = a3;
  memset(&v15[3], 0, 24);
  return lzma_next_filter_init(v6, a2, v15, v8);
}

uint64_t alone_encode( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8)
{
  if (*a7 >= a8) {
    return 0LL;
  }
  uint64_t v16 = a1 + 96;
  uint64_t v17 = (uint64_t *)(a1 + 88);
  int v18 = *(_DWORD *)(a1 + 80);
  while (!v18)
  {
    lzma_bufcpy(v16, v17, 13LL, a6, a7, a8);
    if ((unint64_t)*v17 >= 0xD)
    {
      int v18 = 1;
      *(_DWORD *)(a1 + 80) = 1;
      if (*a7 < a8) {
        continue;
      }
    }

    return 0LL;
  }

  if (v18 == 1) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, unint64_t))(a1 + 24))( *(void *)a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8);
  }
  else {
    return 11LL;
  }
}

void alone_encoder_end(void *a1, uint64_t a2)
{
}

unint64_t lzma_block_buffer_bound64(unint64_t a1)
{
  if (a1 <= 0x7FFFFFFFFFFFFBBCLL && (unint64_t v1 = 3 * ((a1 + 0xFFFF) >> 16), 0x7FFFFFFFFFFFFBBBLL - v1 >= a1)) {
    return ((a1 + v1 + 4) & 0xFFFFFFFFFFFFFFFCLL) + 92;
  }
  else {
    return 0LL;
  }
}

unint64_t lzma_block_buffer_bound(unint64_t a1)
{
  if (a1 <= 0x7FFFFFFFFFFFFBBCLL && (unint64_t v1 = 3 * ((a1 + 0xFFFF) >> 16), 0x7FFFFFFFFFFFFBBBLL - v1 >= a1)) {
    return ((a1 + v1 + 4) & 0xFFFFFFFFFFFFFFFCLL) + 92;
  }
  else {
    return 0LL;
  }
}

uint64_t lzma_block_buffer_encode( uint64_t a1, uint64_t a2, char *a3, unint64_t a4, uint64_t a5, uint64_t *a6, unint64_t a7)
{
  return block_buffer_encode(a1, a2, a3, a4, a5, a6, a7, 1);
}

uint64_t block_buffer_encode( uint64_t a1, uint64_t a2, char *a3, unint64_t a4, uint64_t a5, uint64_t *a6, unint64_t a7, int a8)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 11LL;
  }
  if (a4) {
    BOOL v11 = a3 == 0LL;
  }
  else {
    BOOL v11 = 0;
  }
  uint64_t result = 11LL;
  if (!v11)
  {
    if (a5)
    {
      if (a6)
      {
        uint64_t v16 = *a6;
        if (a7 >= *a6)
        {
          if (*(_DWORD *)a1 > 1u) {
            return 8LL;
          }
          unsigned int v17 = *(_DWORD *)(a1 + 8);
          if (v17 <= 0xF && (!a8 || *(void *)(a1 + 32)))
          {
            unint64_t v20 = a7 - (((_BYTE)a7 - (_BYTE)v16) & 3);
            unsigned int v21 = lzma_check_size(v17);
            if (v20 - v16 <= v21) {
              return 10LL;
            }
            *(void *)(a1 + 24) = a4;
            if (a4 > 0x7FFFFFFFFFFFFBBCLL || (unint64_t v22 = 3 * ((a4 + 0xFFFF) >> 16), 0x7FFFFFFFFFFFFBBBLL - v22 < a4))
            {
              *(void *)(a1 + 16) = 0LL;
              return 9LL;
            }

            size_t v23 = v21;
            uint64_t v24 = v20 - v21;
            *(void *)(a1 + 16) = a4 + v22 + 1;
            if (a8)
            {
              uint64_t result = block_encode_normal(a1, a2, (uint64_t)a3, a4, a5, a6, v24);
              if (!(_DWORD)result)
              {
LABEL_27:
                uint64_t v25 = *(void *)(a1 + 16);
                if ((v25 & 3) != 0)
                {
                  uint64_t v26 = v25 + 1;
                  do
                  {
                    uint64_t v27 = (*a6)++;
                    *(_BYTE *)(a5 + v27) = 0;
                    BOOL v11 = (v26++ & 3) == 0;
                  }

                  while (!v11);
                }

                if (!(_DWORD)v23) {
                  return 0LL;
                }
                lzma_check_init((uint64_t)__src, *(_DWORD *)(a1 + 8));
                lzma_check_update((uint64_t)__src, *(_DWORD *)(a1 + 8), a3, a4);
                lzma_check_finish((uint64_t)__src, *(_DWORD *)(a1 + 8));
                memcpy((void *)(a1 + 40), __src, v23);
                memcpy((void *)(a5 + *a6), __src, v23);
                uint64_t result = 0LL;
                *a6 += v23;
                return result;
              }

              if ((_DWORD)result != 10) {
                return result;
              }
            }

            uint64_t result = block_encode_uncompressed(a1, (uint64_t)a3, a4, a5, a6, v24);
            if ((_DWORD)result) {
              return result;
            }
            goto LABEL_27;
          }
        }
      }
    }
  }

  return result;
}

uint64_t lzma_block_uncomp_encode( uint64_t a1, char *a2, unint64_t a3, uint64_t a4, uint64_t *a5, unint64_t a6)
{
  return block_buffer_encode(a1, 0LL, a2, a3, a4, a5, a6, 0);
}

uint64_t block_encode_normal( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v14 = lzma_block_header_size(a1);
  if (!(_DWORD)v14)
  {
    uint64_t v15 = *a6;
    unint64_t v16 = *(unsigned int *)(a1 + 4);
    if (a7 - *a6 <= v16)
    {
      return 10LL;
    }

    else
    {
      uint64_t v17 = v15 + v16;
      *a6 = v15 + v16;
      unint64_t v20 = *(void *)(a1 + 16);
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      v22[0] = 0LL;
      v22[1] = -1LL;
      uint64_t v14 = lzma_raw_encoder_init((uint64_t)v22, a2, *(uint64_t **)(a1 + 32));
      if (!(_DWORD)v14)
      {
        if (a7 - v17 <= v20) {
          uint64_t v18 = a7;
        }
        else {
          uint64_t v18 = v20 + v17;
        }
        uint64_t v21 = 0LL;
        uint64_t v14 = (*((uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t, int))&v23
               + 1))( v22[0],  a2,  a3,  &v21,  a4,  a5,  a6,  v18,  3);
      }

      lzma_next_end((uint64_t)v22, a2);
      if ((_DWORD)v14)
      {
        if ((_DWORD)v14 == 1)
        {
          *(void *)(a1 + 16) = *a6 - (v15 + *(unsigned int *)(a1 + 4));
          uint64_t v14 = 11LL;
        }
      }

      else
      {
        uint64_t v14 = 10LL;
      }

      *a6 = v15;
    }
  }

  return v14;
}

uint64_t block_encode_uncompressed( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  v22[4] = *MEMORY[0x1895F89C0];
  memset(v21, 0, sizeof(v21));
  LODWORD(v21[0]) = 4096;
  v22[0] = 33LL;
  v22[1] = v21;
  void v22[2] = -1LL;
  uint64_t v12 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v22;
  if (lzma_block_header_size(a1))
  {
    *(void *)(a1 + 32) = v12;
    return 11LL;
  }

  if (a6 - *a5 >= *(void *)(a1 + 16) + (unint64_t)*(unsigned int *)(a1 + 4))
  {
    int v14 = lzma_block_header_encode(a1, (char *)(a4 + *a5));
    *(void *)(a1 + 32) = v12;
    if (v14) {
      return 11LL;
    }
    size_t v15 = *a5 + *(unsigned int *)(a1 + 4);
    if (a3)
    {
      unint64_t v16 = 0LL;
      char v17 = 1;
      do
      {
        *a5 = v15 + 1;
        *(_BYTE *)(a4 + v15) = v17;
        if (a3 - v16 >= 0x10000) {
          size_t v18 = 0x10000LL;
        }
        else {
          size_t v18 = a3 - v16;
        }
        uint64_t v19 = (*a5)++;
        *(_BYTE *)(a4 + v19) = (unsigned __int16)(v18 - 1) >> 8;
        uint64_t v20 = (*a5)++;
        *(_BYTE *)(a4 + v20) = v18 - 1;
        memcpy((void *)(a4 + *a5), (const void *)(a2 + v16), v18);
        v16 += v18;
        size_t v15 = *a5 + v18;
        *a5 = v15;
        char v17 = 2;
      }

      while (v16 < a3);
    }

    uint64_t result = 0LL;
    *a5 = v15 + 1;
    *(_BYTE *)(a4 + v15) = 0;
  }

  else
  {
    *(void *)(a1 + 32) = v12;
    return 10LL;
  }

  return result;
}

uint64_t lzma_block_encoder_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = lzma_block_encoder_init;
  if (!a3) {
    return 11LL;
  }
  if (*(_DWORD *)a3 > 1u) {
    return 8LL;
  }
  unsigned int v7 = *(_DWORD *)(a3 + 8);
  if (v7 > 0xF) {
    return 11LL;
  }
  uint64_t v8 = *(void *)a1;
  if (*(void *)a1)
  {
LABEL_12:
    *(_DWORD *)(v8 + 88) = 0;
    *(void *)(v8 + 80) = a3;
    *(void *)(v8 + 104) = 0LL;
    *(void *)(v8 + 112) = 0LL;
    *(void *)(v8 + 96) = 0LL;
    lzma_check_init(v8 + 120, v7);
    return lzma_raw_encoder_init(v8, a2, *(uint64_t **)(a3 + 32));
  }

  uint64_t v9 = lzma_alloc(0x120uLL, a2);
  if (v9)
  {
    uint64_t v8 = (uint64_t)v9;
    *(void *)a1 = v9;
    *(void *)(a1 + 24) = block_encode;
    *(void *)(a1 + 32) = block_encoder_end;
    *(void *)(a1 + 64) = block_encoder_update;
    *uint64_t v9 = 0LL;
    v9[1] = -1LL;
    *((_OWORD *)v9 + 1) = 0u;
    *((_OWORD *)v9 + 2) = 0u;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    unsigned int v7 = *(_DWORD *)(a3 + 8);
    goto LABEL_12;
  }

  return 5LL;
}

uint64_t block_encode( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8, int a9)
{
  uint64_t v9 = *a4;
  if ((*(void *)(a1 + 104) ^ 0x7FFFFFFFFFFFFFFFuLL) < a5 - *a4) {
    return 9LL;
  }
  int v15 = *(_DWORD *)(a1 + 88);
  if (v15)
  {
    if (v15 == 2) {
      goto LABEL_17;
    }
    if (v15 != 1) {
      return 11LL;
    }
    uint64_t v16 = *(void *)(a1 + 96);
LABEL_7:
    if ((v16 & 3) != 0)
    {
      uint64_t v17 = *a7;
      if (*a7 <= a8) {
        unint64_t v18 = a8;
      }
      else {
        unint64_t v18 = *a7;
      }
      uint64_t v19 = v16 + 1;
      while (v18 != v17)
      {
        *(_BYTE *)(a6 + v17++) = 0;
        *a7 = v17;
        *(void *)(a1 + 96) = v19;
        if ((v19++ & 3) == 0) {
          goto LABEL_15;
        }
      }

      return 0LL;
    }

LABEL_15:
    int v21 = *(_DWORD *)(*(void *)(a1 + 80) + 8LL);
    if (!v21) {
      return 1LL;
    }
    lzma_check_finish(a1 + 120, v21);
    *(_DWORD *)(a1 + 88) = 2;
LABEL_17:
    size_t v22 = lzma_check_size(*(_DWORD *)(*(void *)(a1 + 80) + 8LL));
    lzma_bufcpy(a1 + 120, (uint64_t *)(a1 + 112), v22, a6, a7, a8);
    if (*(void *)(a1 + 112) < v22) {
      return 0LL;
    }
    memcpy((void *)(*(void *)(a1 + 80) + 40LL), (const void *)(a1 + 120), v22);
    return 1LL;
  }

  uint64_t v25 = *a7;
  uint64_t v26 = (*(uint64_t (**)(void))(a1 + 24))(*(void *)a1);
  unint64_t v27 = *a7 - v25;
  uint64_t v28 = *(void *)(a1 + 96);
  if (0x7FFFFFFFFFFFFBBCLL - v28 < v27) {
    return 9LL;
  }
  uint64_t v10 = v26;
  uint64_t v29 = *a4;
  unint64_t v30 = *a4 - v9;
  uint64_t v31 = v28 + v27;
  unint64_t v32 = *(void *)(a1 + 104) + v30;
  *(void *)(a1 + 96) = v31;
  *(void *)(a1 + 104) = v32;
  if (v29 != v9) {
    lzma_check_update(a1 + 120, *(_DWORD *)(*(void *)(a1 + 80) + 8LL), (char *)(a3 + v9), v30);
  }
  if (a9 != 1 && (_DWORD)v10 == 1)
  {
    __int128 v33 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(*(void *)(a1 + 80) + 16LL) = v33;
    *(_DWORD *)(a1 + 88) = 1;
    uint64_t v16 = v33;
    goto LABEL_7;
  }

  return v10;
}

void block_encoder_end(void *a1, uint64_t a2)
{
}

uint64_t block_encoder_update(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (*(_DWORD *)(a1 + 88)) {
    return 11LL;
  }
  else {
    return lzma_next_filter_update(a1, a2, a4);
  }
}

uint64_t lzma_block_encoder(void *a1, uint64_t a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = lzma_block_encoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v5 = a1[7];
      *(_WORD *)(v5 + 96) = 257;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }

  return v4;
}

uint64_t lzma_block_header_size(uint64_t a1)
{
  if (*(_DWORD *)a1 > 1u) {
    return 8LL;
  }
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3 == -1)
  {
    int v5 = 6;
LABEL_8:
    unint64_t v6 = *(void *)(a1 + 24);
    if (v6 != -1LL)
    {
      int v7 = lzma_vli_size(v6);
      if (!v7) {
        return 11LL;
      }
      v5 += v7;
    }

    uint64_t v8 = *(uint64_t **)(a1 + 32);
    if (v8 && *v8 != -1)
    {
      uint64_t v9 = 0LL;
      for (uint64_t i = 16LL; i != 80; i += 16LL)
      {
        uint64_t result = lzma_filter_flags_size(&v13, v8);
        if ((_DWORD)result) {
          return result;
        }
        ++v9;
        v5 += v13;
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v8 = (uint64_t *)(v11 + 16 * v9);
        uint64_t v12 = *(void *)(v11 + i);
        if (v12 == -1)
        {
          uint64_t result = 0LL;
          *(_DWORD *)(a1 + 4) = (v5 + 3) & 0xFFFFFFFC;
          return result;
        }
      }
    }

    return 11LL;
  }

  int v4 = lzma_vli_size(*(void *)(a1 + 16));
  uint64_t result = 11LL;
  if (v3 && v4)
  {
    int v5 = v4 + 6;
    goto LABEL_8;
  }

  return result;
}

uint64_t lzma_block_header_encode(uint64_t a1, char *a2)
{
  if (lzma_block_unpadded_size(a1) && *(uint64_t *)(a1 + 24) >= -1)
  {
    unint64_t v4 = (*(_DWORD *)(a1 + 4) - 4);
    *a2 = v4 >> 2;
    a2[1] = 0;
    unint64_t v13 = 2LL;
    unint64_t v5 = *(void *)(a1 + 16);
    if (v5 != -1LL)
    {
      uint64_t result = lzma_vli_encode(v5, 0LL, (uint64_t)a2, &v13, v4);
      if ((_DWORD)result) {
        return result;
      }
      a2[1] |= 0x40u;
    }

    unint64_t v7 = *(void *)(a1 + 24);
    if (v7 != -1LL)
    {
      uint64_t result = lzma_vli_encode(v7, 0LL, (uint64_t)a2, &v13, v4);
      if ((_DWORD)result) {
        return result;
      }
      a2[1] |= 0x80u;
    }

    uint64_t v8 = *(void **)(a1 + 32);
    if (v8 && *v8 != -1LL)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = -1LL;
      while (v10 != 3)
      {
        uint64_t result = lzma_filter_flags_encode(&v8[v9], (uint64_t)a2, &v13, v4);
        if ((_DWORD)result) {
          return result;
        }
        uint64_t v8 = *(void **)(a1 + 32);
        uint64_t v11 = v8[v9 + 2];
        ++v10;
        v9 += 2LL;
        if (v11 == -1)
        {
          a2[1] |= v10;
          bzero(&a2[v13], v4 - v13);
          int v12 = lzma_crc32(a2, v4, 0);
          uint64_t result = 0LL;
          *(_DWORD *)&a2[v4] = v12;
          return result;
        }
      }
    }
  }

  return 11LL;
}

uint64_t lzma_easy_buffer_encode( int a1, unsigned int a2, uint64_t a3, char *a4, unint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8)
{
  if (lzma_easy_preset(v16, a1)) {
    return 8LL;
  }
  else {
    return lzma_stream_buffer_encode((unint64_t)v16, a2, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t lzma_easy_encoder(void *a1, int a2, int a3)
{
  if (lzma_easy_preset(v6, a2)) {
    return 8LL;
  }
  else {
    return lzma_stream_encoder(a1, v6, a3);
  }
}

uint64_t lzma_easy_encoder_memusage(int a1)
{
  if (lzma_easy_preset(v2, a1)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return lzma_raw_encoder_memusage(v2);
  }
}

uint64_t lzma_microlzma_encoder(void *a1, _DWORD *a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = microlzma_encoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4) {
      lzma_end((uint64_t)a1);
    }
    else {
      *(_BYTE *)(a1[7] + 99LL) = 1;
    }
  }

  return v4;
}

uint64_t microlzma_encoder_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  v10[6] = *MEMORY[0x1895F89C0];
  *(void *)(a1 + 16) = microlzma_encoder_init;
  uint64_t v6 = *(void *)a1;
  if (!*(void *)a1)
  {
    unint64_t v7 = lzma_alloc(0x58uLL, a2);
    if (!v7) {
      return 5LL;
    }
    uint64_t v6 = (uint64_t)v7;
    *(void *)a1 = v7;
    *(void *)(a1 + 24) = microlzma_encode;
    *(void *)(a1 + 32) = microlzma_encoder_end;
    *unint64_t v7 = 0LL;
    v7[1] = -1LL;
    *((_OWORD *)v7 + 1) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    *((_OWORD *)v7 + 4) = 0u;
  }

  if ((lzma_lzma_lclppb_encode(a3, (_BYTE *)(v6 + 80)) & 1) != 0) {
    return 8LL;
  }
  v10[0] = 0x4000000000000001LL;
  v10[1] = lzma_lzma_encoder_init;
  v10[2] = a3;
  memset(&v10[3], 0, 24);
  return lzma_next_filter_init(v6, a2, v10, v8);
}

uint64_t microlzma_encode( void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  uint64_t v17 = *a7;
  uint64_t v18 = *a4;
  uint64_t result = ((uint64_t (*)(void, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t, int))a1[3])( *a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9);
  if (!(_DWORD)result) {
    return 11LL;
  }
  if ((_DWORD)result == 1)
  {
    *(_BYTE *)(a6 + v17) = ~*((_BYTE *)a1 + 80);
    *a4 = v20 + v18;
  }

  return result;
}

void microlzma_encoder_end(void *a1, uint64_t a2)
{
}

uint64_t lzma_raw_buffer_encode( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, unint64_t a7)
{
  if (a4) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v10 = v8 || a5 == 0 || a6 == 0LL;
  if (v10 || *a6 > a7) {
    return 11LL;
  }
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v20[0] = 0LL;
  v20[1] = -1LL;
  uint64_t result = lzma_raw_encoder_init((uint64_t)v20, a2, a1);
  if (!(_DWORD)result)
  {
    unint64_t v17 = *a6;
    uint64_t v19 = 0LL;
    unsigned int v18 = (*((uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, unint64_t *, unint64_t, int))&v21
           + 1))( v20[0],  a2,  a3,  &v19,  a4,  a5,  a6,  a7,  3);
    lzma_next_end((uint64_t)v20, a2);
    if (v18 == 1)
    {
      return 0LL;
    }

    else
    {
      if (v18) {
        uint64_t result = v18;
      }
      else {
        uint64_t result = 10LL;
      }
      *a6 = v17;
    }
  }

  return result;
}

BOOL lzma_filter_encoder_is_supported(uint64_t a1)
{
  uint64_t v1 = 0LL;
  do
  {
    uint64_t v2 = encoders[v1];
    if (v2 == a1) {
      break;
    }
    BOOL v3 = v1 == 70;
    v1 += 7LL;
  }

  while (!v3);
  return v2 == a1;
}

uint64_t *encoder_find(uint64_t a1)
{
  uint64_t v1 = 0LL;
  while (encoders[v1] != a1)
  {
    v1 += 7LL;
    if (v1 == 77) {
      return 0LL;
    }
  }

  return &encoders[v1];
}

uint64_t lzma_filters_update(uint64_t a1, uint64_t *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!*(void *)(*(void *)(a1 + 56) + 64LL)) {
    return 11LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  do
  {
    uint64_t v6 = a2[v5 + 2];
    v5 += 2LL;
    ++v4;
  }

  while (v6 != -1);
  if (v4)
  {
    unint64_t v7 = &v11[v5 * 8 - 16];
    BOOL v8 = a2;
    do
    {
      __int128 v9 = *(_OWORD *)v8;
      v8 += 2;
      *v7-- = v9;
      --v4;
    }

    while (v4);
  }

  *(void *)&v11[v5 * 8] = -1LL;
  return (*(uint64_t (**)(void, void, uint64_t *, _BYTE *))(*(void *)(a1 + 56) + 64LL))( **(void **)(a1 + 56),  *(void *)(a1 + 48),  a2,  v11);
}

uint64_t lzma_raw_encoder_memusage(uint64_t *a1)
{
  return lzma_raw_coder_memusage((uint64_t (*)(uint64_t))encoder_find, a1);
}

uint64_t lzma_raw_encoder_init(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return lzma_raw_coder_init(a1, a2, a3, (uint64_t (*)(uint64_t))encoder_find, 1);
}

uint64_t lzma_raw_encoder(void *a1, uint64_t *a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = lzma_raw_coder_init(a1[7], a1[6], a2, (uint64_t (*)(uint64_t))encoder_find, 1);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v5 = a1[7];
      *(_WORD *)(v5 + 96) = 257;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }

  return v4;
}

unint64_t lzma_mt_block_size(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1 != -1)
  {
    unint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
    while (1)
    {
      if (v1 != 0x4000000000000001LL)
      {
        uint64_t v5 = -2LL;
        uint64_t v6 = &qword_189B57C10;
        do
        {
          uint64_t v7 = *v6;
          v6 += 7;
          ++v5;
        }

        while (v7 != v1);
        if (!v5)
        {
          unint64_t v8 = lzma_lzma2_block_size((unsigned int *)a1[2 * v4 + 1]);
          if (v8 > v3) {
            unint64_t v3 = v8;
          }
          if (!v8) {
            break;
          }
        }
      }

      ++v4;
      uint64_t v1 = a1[2 * v4];
      if (v1 == -1) {
        return v3;
      }
    }
  }

  return 0LL;
}

uint64_t lzma_properties_size(int *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = &dword_189B57C00;
  uint64_t v4 = 10LL;
  while (*((void *)v3 - 5) != v2)
  {
    v3 += 14;
    if (--v4 == -1)
    {
      if (v2 < 0) {
        return 11LL;
      }
      else {
        return 8LL;
      }
    }
  }

  if (v4 == 8 || (unint64_t)-v4 < 0xFFFFFFFFFFFFFFF8LL)
  {
    uint64_t v5 = 0LL;
    *a1 = *v3;
    return v5;
  }

  return (*((uint64_t (**)(int *, uint64_t))v3 - 1))(a1, a2[1]);
}

uint64_t lzma_properties_encode(void *a1)
{
  uint64_t v1 = 0LL;
  while (encoders[v1] != *a1)
  {
    v1 += 7LL;
    if (v1 == 77) {
      return 11LL;
    }
  }

  return ((uint64_t (*)(void))encoders[v1 + 6])(a1[1]);
}

uint64_t lzma_filter_flags_size(int *a1, uint64_t *a2)
{
  uint64_t result = lzma_properties_size(a1, a2);
  if (!(_DWORD)result)
  {
    int v5 = lzma_vli_size(*a2);
    int v6 = *a1;
    int v7 = lzma_vli_size(*a1);
    uint64_t result = 0LL;
    *a1 = v6 + v5 + v7;
  }

  return result;
}

uint64_t lzma_filter_flags_encode(uint64_t *a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v5 = *a1;
  if (v5 >> 62) {
    return 11LL;
  }
  uint64_t result = lzma_vli_encode(v5, 0LL, a2, a3, a4);
  if (!(_DWORD)result)
  {
    uint64_t result = lzma_properties_size((int *)&v10, a1);
    if (!(_DWORD)result)
    {
      uint64_t result = lzma_vli_encode(v10, 0LL, a2, a3, a4);
      if (!(_DWORD)result)
      {
        if (a4 - *a3 < v10) {
          return 11LL;
        }
        uint64_t result = lzma_properties_encode(a1);
        if (!(_DWORD)result) {
          *a3 += v10;
        }
      }
    }
  }

  return result;
}

uint64_t lzma_index_encoder_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = lzma_index_encoder_init;
  if (!a3) {
    return 11LL;
  }
  int v6 = *(void **)a1;
  if (*(void *)a1)
  {
LABEL_7:
    lzma_index_iter_init((uint64_t)(v6 + 2), a3);
    uint64_t result = 0LL;
    *(_DWORD *)int v6 = 0;
    v6[1] = a3;
    v6[40] = 0LL;
    *((_DWORD *)v6 + 82) = 0;
    return result;
  }

  int v7 = lzma_alloc(0x150uLL, a2);
  *(void *)a1 = v7;
  if (v7)
  {
    int v6 = v7;
    *(void *)(a1 + 24) = index_encode;
    *(void *)(a1 + 32) = index_encoder_end;
    goto LABEL_7;
  }

  return 5LL;
}

uint64_t index_encode( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8)
{
  unint64_t v8 = *a7;
  if (*a7 >= a8) {
    return 0LL;
  }
  unint64_t v13 = (uint64_t *)(a1 + 320);
  uint64_t v25 = a1 + 16;
  int v15 = (unint64_t *)(a1 + 192);
  int v14 = *(_DWORD *)a1;
  uint64_t v16 = (unint64_t *)(a1 + 184);
  int v17 = *(_DWORD *)a1;
  unint64_t v18 = *a7;
  while (2)
  {
    switch(v17)
    {
      case 0:
        *(_BYTE *)(a6 + v18) = 0;
        *a7 = v18 + 1;
        int v14 = 1;
        *(_DWORD *)a1 = 1;
        int v17 = 1;
        goto LABEL_18;
      case 1:
        unint64_t v20 = lzma_index_block_count(*(void *)(a1 + 8));
        uint64_t v21 = lzma_vli_encode(v20, v13, a6, a7, a8);
        if ((_DWORD)v21 != 1) {
          goto LABEL_20;
        }
        *(void *)(a1 + 320) = 0LL;
        int v14 = 4;
        *(_DWORD *)a1 = 4;
        int v17 = 4;
        goto LABEL_18;
      case 2:
      case 3:
        uint64_t v19 = v16;
        if (v14 != 2) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 4:
        if (lzma_index_iter_next(v25, 2u))
        {
          *(void *)(a1 + 320) = lzma_index_padding_size(*(void *)(a1 + 8));
          int v14 = 5;
          *(_DWORD *)a1 = 5;
          goto LABEL_13;
        }

        *(_DWORD *)a1 = 2;
LABEL_15:
        uint64_t v19 = v15;
LABEL_16:
        uint64_t v21 = lzma_vli_encode(*v19, v13, a6, a7, a8);
        if ((_DWORD)v21 != 1)
        {
LABEL_20:
          uint64_t v22 = v21;
          goto LABEL_21;
        }

        *(void *)(a1 + 320) = 0LL;
        int v14 = *(_DWORD *)a1 + 1;
        *(_DWORD *)a1 = v14;
        int v17 = v14;
        goto LABEL_18;
      case 5:
        if (!*v13)
        {
          *(_DWORD *)(a1 + 328) = lzma_crc32((char *)(a6 + v8), v18 - v8, *(_DWORD *)(a1 + 328));
          *(_DWORD *)a1 = 6;
LABEL_25:
          while (a8 != v18)
          {
            uint64_t v23 = *(void *)(a1 + 320);
            *(_BYTE *)(a6 + v18++) = *(_DWORD *)(a1 + 328) >> (8 * v23);
            *a7 = v18;
            *(void *)(a1 + 320) = v23 + 1;
          }

          return 0LL;
        }

        --*v13;
        *a7 = v18 + 1;
        *(_BYTE *)(a6 + v18) = 0;
LABEL_13:
        int v17 = 5;
LABEL_18:
        unint64_t v18 = *a7;
        if (*a7 < a8) {
          continue;
        }
        uint64_t v22 = 0LL;
LABEL_21:
        if (*a7 != v8) {
          *(_DWORD *)(a1 + 328) = lzma_crc32((char *)(a6 + v8), *a7 - v8, *(_DWORD *)(a1 + 328));
        }
        return v22;
      case 6:
        goto LABEL_25;
      default:
        return 11LL;
    }
  }

uint64_t lzma_index_encoder(void *a1, uint64_t a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = lzma_index_encoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }

  return v4;
}

uint64_t lzma_index_buffer_encode(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  uint64_t result = 11LL;
  if (a1 && a2 && a3 && a4 >= *a3)
  {
    unint64_t v9 = a4 - *a3;
    if (v9 >= lzma_index_size(a1))
    {
      lzma_index_iter_init((uint64_t)v18, a1);
      int v16 = 0;
      uint64_t v17 = a1;
      v18[38] = 0LL;
      int v19 = 0;
      unint64_t v10 = *a3;
      int v15 = index_encode((uint64_t)&v16, v11, v12, v13, v14, a2, a3, a4);
      uint64_t result = 0LL;
      if (v15 != 1)
      {
        *a3 = v10;
        return 11LL;
      }
    }

    else
    {
      return 10LL;
    }
  }

  return result;
}

int64_t lzma_stream_buffer_bound(unint64_t a1)
{
  int64_t v1 = lzma_block_buffer_bound(a1);
  if (v1 > 0x7FFFFFFFFFFFFFCFLL || v1 == 0) {
    return 0LL;
  }
  else {
    return v1 + 48;
  }
}

uint64_t lzma_stream_buffer_encode( unint64_t a1, unsigned int a2, uint64_t a3, char *a4, unint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 11LL;
  if (a1 && a2 <= 0xF)
  {
    BOOL v12 = a5 && a4 == 0LL;
    if (!v12 && a6 && a7)
    {
      uint64_t v16 = *a7;
      unint64_t v17 = a8 - *a7;
      if (a8 < *a7) {
        return 11LL;
      }
      if (v17 < 0x19) {
        return 10LL;
      }
      uint64_t v29 = 0LL;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v26 = 0u;
      LODWORD(v27) = a2;
      uint64_t v30 = v16 + 12;
      unint64_t v21 = a8 - 12;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v31 = 0u;
      DWORD2(v31) = a2;
      __int128 v33 = a1;
      if (a5)
      {
        uint64_t v8 = lzma_block_buffer_encode((uint64_t)&v31, a3, a4, a5, a6, &v30, v21);
        if ((_DWORD)v8) {
          return v8;
        }
        uint64_t v22 = (uint64_t *)lzma_index_init(a3);
        if (v22)
        {
          uint64_t v23 = v22;
          unint64_t v24 = lzma_block_unpadded_size((uint64_t)&v31);
          uint64_t v25 = lzma_index_append(v23, a3, v24, *((unint64_t *)&v32 + 1));
          if ((_DWORD)v25)
          {
            uint64_t v8 = v25;
            lzma_index_end(v23, a3);
            return v8;
          }

          goto LABEL_23;
        }
      }

      else
      {
        uint64_t v23 = (uint64_t *)lzma_index_init(a3);
        if (v23)
        {
LABEL_23:
          uint64_t v8 = lzma_index_buffer_encode((uint64_t)v23, a6, (unint64_t *)&v30, v21);
          *((void *)&v26 + 1) = lzma_index_size((uint64_t)v23);
          lzma_index_end(v23, a3);
          if ((_DWORD)v8) {
            return v8;
          }
          if (!lzma_stream_footer_encode((uint64_t)&v26, a6 + v30))
          {
            uint64_t v8 = 0LL;
            *a7 = v30 + 12;
            return v8;
          }

          return 11LL;
        }
      }

      return 5LL;
    }
  }

  return v8;
}

uint64_t lzma_stream_encoder(void *a1, uint64_t *a2, int a3)
{
  uint64_t v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    uint64_t v6 = stream_encoder_init(a1[7], a1[6], a2, a3);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v7 = a1[7];
      *(_BYTE *)(v7 + 100) = 1;
      *(_DWORD *)(v7 + 96) = 16843009;
    }
  }

  return v6;
}

uint64_t stream_encoder_init(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  *(void *)(a1 + 16) = stream_encoder_init;
  if (!a3) {
    return 11LL;
  }
  uint64_t v8 = *(void *)a1;
  if (*(void *)a1)
  {
    unint64_t v9 = *(uint64_t **)(v8 + 456);
  }

  else
  {
    uint64_t v11 = lzma_alloc(0x5E0uLL, a2);
    if (!v11) {
      return 5LL;
    }
    uint64_t v8 = (uint64_t)v11;
    unint64_t v9 = 0LL;
    *(void *)(a1 + 24) = stream_encode;
    *(void *)(a1 + 32) = stream_encoder_end;
    *(void *)(a1 + 64) = stream_encoder_update;
    *(void *)a1 = v8;
    *(void *)(v8 + 296) = -1LL;
    *(void *)(v8 + 8) = 0LL;
    *(void *)(v8 + 16) = -1LL;
    *(_OWORD *)(v8 + 24) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 56) = 0u;
    *(_OWORD *)(v8 + 72) = 0u;
    *(void *)(v8 + 376) = 0LL;
    *(void *)(v8 + 384) = -1LL;
    *(void *)(v8 + 456) = 0LL;
    *(_OWORD *)(v8 + 392) = 0u;
    *(_OWORD *)(v8 + 408) = 0u;
    *(_OWORD *)(v8 + 424) = 0u;
    *(_OWORD *)(v8 + 440) = 0u;
  }

  *(_DWORD *)uint64_t v8 = 0;
  *(_DWORD *)(v8 + 88) = 0;
  *(_DWORD *)(v8 + 96) = a4;
  lzma_index_end(v9, a2);
  BOOL v12 = lzma_index_init(a2);
  *(void *)(v8 + 456) = v12;
  if (!v12) {
    return 5LL;
  }
  uint64_t v16 = 0LL;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v13 = 0u;
  LODWORD(v14) = a4;
  uint64_t result = lzma_stream_header_encode(&v13, v8 + 480);
  if (!(_DWORD)result)
  {
    *(_OWORD *)(v8 + 464) = xmmword_18116B440;
    return stream_encoder_update(v8, a2, a3, 0LL);
  }

  return result;
}

uint64_t stream_encode( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8, int a9)
{
  if (*a7 >= a8) {
    return 0LL;
  }
  uint64_t v21 = a1 + 376;
  __int128 v14 = (char *)(a1 + 480);
  uint64_t v16 = a1 + 88;
  int v15 = *(_DWORD *)a1;
  unint64_t v17 = (uint64_t *)(a1 + 464);
  while (2)
  {
    switch(v15)
    {
      case 0:
      case 2:
      case 5:
        lzma_bufcpy((uint64_t)v14, v17, *(void *)(a1 + 472), a6, a7, a8);
        if (*(void *)(a1 + 464) < *(void *)(a1 + 472)) {
          return 0LL;
        }
        int v18 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 != 5)
        {
          *(void *)(a1 + 464) = 0LL;
          int v15 = v18 + 1;
          goto LABEL_22;
        }

        uint64_t result = 1LL;
        break;
      case 1:
        if (*a4 == a5)
        {
          if (a9 == 3)
          {
            uint64_t result = lzma_index_encoder_init(v21, a2, *(void *)(a1 + 456));
            if (!(_DWORD)result)
            {
              int v15 = 4;
              goto LABEL_22;
            }
          }

          else
          {
            uint64_t result = a9 != 0;
          }
        }

        else if (*(_BYTE *)(a1 + 4) || (uint64_t result = block_encoder_init(a1, a2), !(_DWORD)result))
        {
          *(_BYTE *)(a1 + 4) = 0;
          *(void *)(a1 + 472) = *(unsigned int *)(a1 + 92);
          int v15 = 2;
          goto LABEL_22;
        }

        break;
      case 3:
        uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t *, unint64_t, _DWORD))(a1 + 32))( *(void *)(a1 + 8),  a2,  a3,  a4,  a5,  a6,  a7,  a8,  stream_encode_convert[a9]);
        if (a9 != 1 && (_DWORD)result == 1)
        {
          unint64_t v20 = lzma_block_unpadded_size(v16);
          uint64_t result = lzma_index_append(*(void **)(a1 + 456), a2, v20, *(void *)(a1 + 112));
          if (!(_DWORD)result)
          {
            int v15 = 1;
            goto LABEL_22;
          }
        }

        break;
      case 4:
        uint64_t result = (*(uint64_t (**)(void, uint64_t, void, void, void, uint64_t, uint64_t *, unint64_t, _DWORD))(a1 + 400))( *(void *)(a1 + 376),  a2,  0LL,  0LL,  0LL,  a6,  a7,  a8,  0);
        if ((_DWORD)result == 1)
        {
          uint64_t v28 = 0LL;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v25 = 0u;
          *((void *)&v25 + 1) = lzma_index_size(*(void *)(a1 + 456));
          LODWORD(v26) = *(_DWORD *)(a1 + 96);
          *(void *)(a1 + 472) = 12LL;
          int v15 = 5;
LABEL_22:
          *(_DWORD *)a1 = v15;
          if (*a7 < a8) {
            continue;
          }
          return 0LL;
        }

        break;
      default:
LABEL_26:
        uint64_t result = 11LL;
        break;
    }

    return result;
  }

void stream_encoder_end(uint64_t a1, uint64_t a2)
{
}

uint64_t stream_encoder_update(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = lzma_filters_copy(a3, __dst, a2);
  if (!(_DWORD)v8)
  {
    if (*(_DWORD *)a1 > 1u)
    {
      if (*(_DWORD *)a1 > 3u)
      {
        uint64_t v8 = 11LL;
      }

      else
      {
        uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t *, uint64_t))(a1 + 72))(*(void *)(a1 + 8), a2, a3, a4);
        if (!(_DWORD)v8) {
          goto LABEL_7;
        }
      }
    }

    else
    {
      *(_BYTE *)(a1 + 4) = 0;
      *(void *)(a1 + 120) = __dst;
      uint64_t v8 = block_encoder_init(a1, a2);
      *(void *)(a1 + 120) = a1 + 296;
      if (!(_DWORD)v8)
      {
        *(_BYTE *)(a1 + 4) = 1;
LABEL_7:
        uint64_t v9 = a1 + 296;
        lzma_filters_free((void *)v9, a2);
        uint64_t v8 = 0LL;
        __int128 v10 = __dst[3];
        *(_OWORD *)(v9 + 32) = __dst[2];
        *(_OWORD *)(v9 + 48) = v10;
        *(_OWORD *)(v9 + 64) = __dst[4];
        __int128 v11 = __dst[1];
        *(_OWORD *)uint64_t v9 = __dst[0];
        *(_OWORD *)(v9 + 16) = v11;
        return v8;
      }
    }

    lzma_filters_free(__dst, a2);
  }

  return v8;
}

uint64_t block_encoder_init(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 88;
  *(void *)(a1 + 104) = -1LL;
  *(void *)(a1 + 112) = -1LL;
  uint64_t result = lzma_block_header_size(a1 + 88);
  if (!(_DWORD)result) {
    return lzma_block_encoder_init(a1 + 8, a2, v4);
  }
  return result;
}

uint64_t lzma_stream_header_encode(_DWORD *a1, uint64_t a2)
{
  if (*a1) {
    return 8LL;
  }
  *(_DWORD *)a2 = 1484404733;
  *(_WORD *)(a2 + 4) = 90;
  if (a1[4] > 0xFu) {
    return 11LL;
  }
  *(_BYTE *)(a2 + 6) = 0;
  uint64_t v3 = a2 + 6;
  *(_BYTE *)(a2 + 7) = a1[4];
  int v4 = lzma_crc32((char *)(a2 + 6), 2uLL, 0);
  uint64_t result = 0LL;
  *(_DWORD *)(v3 + 2) = v4;
  return result;
}

uint64_t lzma_stream_footer_encode(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1) {
    return 8LL;
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 - 4 > 0x3FFFFFFFCLL || (*(void *)(a1 + 8) & 3LL) != 0) {
    return 11LL;
  }
  *(_DWORD *)(a2 + 4) = (v3 >> 2) - 1;
  if (*(_DWORD *)(a1 + 16) > 0xFu) {
    return 11LL;
  }
  *(_BYTE *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 9) = *(_DWORD *)(a1 + 16);
  int v6 = lzma_crc32((char *)(a2 + 4), 6uLL, 0);
  uint64_t result = 0LL;
  *(_DWORD *)a2 = v6;
  *(_WORD *)(a2 + 10) = lzma_footer_magic;
  return result;
}

uint64_t lzma_vli_encode( unint64_t a1, uint64_t *a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  uint64_t v12 = 0LL;
  unint64_t v6 = *a4;
  uint64_t v7 = &v12;
  if (a2)
  {
    uint64_t v7 = a2;
    uint64_t result = 10LL;
  }

  else
  {
    uint64_t result = 11LL;
  }

  if (v6 < a5)
  {
    uint64_t result = 11LL;
    if ((a1 & 0x8000000000000000LL) == 0)
    {
      uint64_t v9 = *v7;
      if ((unint64_t)*v7 <= 8)
      {
        unint64_t v10 = a1 >> (7 * v9);
        uint64_t v11 = v9 + 1;
        do
        {
          if (v10 < 0x80)
          {
            *(_BYTE *)(a3 + v6) = v10;
            *a4 = v6 + 1;
            *uint64_t v7 = v11;
            return v7 != &v12;
          }

          *(_BYTE *)(a3 + v6) = v10 | 0x80;
          *uint64_t v7 = v11;
          v10 >>= 7;
          *a4 = ++v6;
          ++v11;
        }

        while (a5 != v6);
        if (v7 == &v12) {
          return 11LL;
        }
        else {
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t lzma_alone_decoder_init(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  *(void *)(a1 + 16) = lzma_alone_decoder_init;
  uint64_t v8 = *(void **)a1;
  if (!*(void *)a1)
  {
    uint64_t v8 = lzma_alloc(0xE8uLL, a2);
    if (!v8) {
      return 5LL;
    }
    *(void *)a1 = v8;
    *(void *)(a1 + 24) = alone_decode;
    *(void *)(a1 + 32) = alone_decoder_end;
    *(void *)(a1 + 56) = alone_decoder_memconfig;
    *uint64_t v8 = 0LL;
    v8[1] = -1LL;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
  }

  uint64_t v9 = 0LL;
  *((_DWORD *)v8 + 20) = 0;
  *((_BYTE *)v8 + 84) = a4;
  *((_DWORD *)v8 + 30) = 0;
  v8[16] = 0LL;
  *((_DWORD *)v8 + 34) = 0;
  if (a3 <= 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = a3;
  }
  v8[11] = 0LL;
  v8[12] = 0LL;
  v8[13] = v10;
  v8[14] = 0x8000LL;
  return v9;
}

uint64_t alone_decode( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8, __n128 a9, int a10)
{
  v28[6] = *MEMORY[0x1895F89C0];
  if (*a7 < a8)
  {
    int v17 = *(_DWORD *)(a1 + 80);
    if (v17 == 4) {
      return (*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))(a1 + 24))( *(void *)a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10);
    }
    while (1)
    {
      unint64_t v18 = *a4;
      if (*a4 >= a5) {
        return 0LL;
      }
      switch(v17)
      {
        case 0:
          int v17 = 1;
          goto LABEL_12;
        case 1:
          uint64_t v19 = *(void *)(a1 + 88);
          int v20 = *(_DWORD *)(a1 + 120) | ((unint64_t)*(unsigned __int8 *)(a3 + v18) << (8 * v19));
          *(_DWORD *)(a1 + 120) = v20;
          *(void *)(a1 + 88) = ++v19;
          if (v19 == 4)
          {
            if (*(_BYTE *)(a1 + 84))
            {
              if (v20 != -1)
              {
                unsigned int v21 = (v20 - 1) | ((v20 - 1) >> 2) | (((v20 - 1) | ((v20 - 1) >> 2)) >> 3);
                unsigned int v22 = v21 | (v21 >> 4) | ((v21 | (v21 >> 4)) >> 8);
                if ((v22 | HIWORD(v22)) + 1 != v20) {
                  return 7LL;
                }
              }
            }

            *(void *)(a1 + 88) = 0LL;
            int v17 = 2;
LABEL_12:
            *(_DWORD *)(a1 + 80) = v17;
          }

          else
          {
            int v17 = 1;
          }

          *a4 = v18 + 1;
          goto LABEL_24;
        case 2:
          unint64_t v23 = *(void *)(a1 + 88);
          unint64_t v24 = ((unint64_t)*(unsigned __int8 *)(a3 + v18) << (8 * v23)) | *(void *)(a1 + 96);
          *a4 = v18 + 1;
          *(void *)(a1 + 88) = ++v23;
          *(void *)(a1 + 96) = v24;
          if (v23 >= 8)
          {
            if (*(_BYTE *)(a1 + 84) && v24 - 0x4000000000LL < 0xFFFFFFBFFFFFFFFFLL) {
              return 7LL;
            }
            *(_DWORD *)(a1 + 168) = 1;
            *(void *)(a1 + 172) = v24;
            unint64_t v25 = lzma_lzma_decoder_memusage((unsigned int *)(a1 + 120)) + 0x8000;
            *(void *)(a1 + 112) = v25;
            *(void *)(a1 + 88) = 0LL;
            *(_DWORD *)(a1 + 80) = 3;
LABEL_21:
            if (v25 > *(void *)(a1 + 104)) {
              return 6LL;
            }
            v28[0] = 0x4000000000000002LL;
            v28[1] = lzma_lzma_decoder_init;
            void v28[2] = a1 + 120;
            memset(&v28[3], 0, 24);
            uint64_t result = lzma_next_filter_init(a1, a2, v28, a9);
            if ((_DWORD)result) {
              return result;
            }
            int v17 = 4;
            *(_DWORD *)(a1 + 80) = 4;
          }

          else
          {
            int v17 = 2;
          }

LABEL_24:
          if (v17 == 4) {
            return (*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))(a1 + 24))( *(void *)a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10);
          }
          break;
        case 3:
          unint64_t v25 = *(void *)(a1 + 112);
          goto LABEL_21;
        default:
          return 11LL;
      }
    }
  }

  return 0LL;
}

void alone_decoder_end(void *a1, uint64_t a2)
{
}

uint64_t alone_decoder_memconfig(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  *a2 = *(void *)(a1 + 112);
  *a3 = *(void *)(a1 + 104);
  if (!a4) {
    return 0LL;
  }
  if (*(void *)(a1 + 112) > a4) {
    return 6LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 104) = a4;
  return result;
}

uint64_t lzma_alone_decoder(void *a1, unint64_t a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = lzma_alone_decoder_init(a1[7], a1[6], a2, 0);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }

  return v4;
}

uint64_t lzma_auto_decoder(void *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    uint64_t v6 = auto_decoder_init(a1[7], a1[6], a2, a3);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v7 = a1[7];
      *(_BYTE *)(v7 + 96) = 1;
      *(_BYTE *)(v7 + 99) = 1;
    }
  }

  return v6;
}

uint64_t auto_decoder_init(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  *(void *)(a1 + 16) = auto_decoder_init;
  if (a4 > 0x3F) {
    return 8LL;
  }
  uint64_t v8 = *(void **)a1;
  if (!*(void *)a1)
  {
    uint64_t v8 = lzma_alloc(0x60uLL, a2);
    if (!v8) {
      return 5LL;
    }
    *(void *)a1 = v8;
    *(void *)(a1 + 24) = auto_decode;
    *(void *)(a1 + 32) = auto_decoder_end;
    *(void *)(a1 + 48) = auto_decoder_get_check;
    *(void *)(a1 + 56) = auto_decoder_memconfig;
    *uint64_t v8 = 0LL;
    v8[1] = -1LL;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
  }

  uint64_t v9 = 0LL;
  if (a3 <= 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = a3;
  }
  v8[10] = v10;
  *((_DWORD *)v8 + 22) = a4;
  *((_DWORD *)v8 + 23) = 0;
  return v9;
}

uint64_t auto_decode( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int16x8_t a9, int a10)
{
  int v12 = *(_DWORD *)(a1 + 92);
  if (v12 != 2)
  {
    if (v12 != 1)
    {
      if (v12) {
        return 11LL;
      }
      unint64_t v19 = *a4;
      if (*a4 >= a5) {
        return 0LL;
      }
      *(_DWORD *)(a1 + 92) = 1;
      int v20 = *(unsigned __int8 *)(a3 + v19);
      if (v20 == 76)
      {
        uint64_t result = lzma_lzip_decoder_init(a1, a2, *(void *)(a1 + 80), *(_DWORD *)(a1 + 88));
        if ((_DWORD)result) {
          return result;
        }
      }

      else if (v20 == 253)
      {
        uint64_t result = lzma_stream_decoder_init(a1, a2, *(void *)(a1 + 80), *(_DWORD *)(a1 + 88), a9);
        if ((_DWORD)result) {
          return result;
        }
      }

      else
      {
        uint64_t result = lzma_alone_decoder_init(a1, a2, *(void *)(a1 + 80), 1);
        if ((_DWORD)result) {
          return result;
        }
        int v22 = *(_DWORD *)(a1 + 88);
        if ((v22 & 1) != 0) {
          return 2LL;
        }
        if ((v22 & 4) != 0) {
          return 4LL;
        }
      }
    }

    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, uint64_t, uint64_t, int))(a1 + 24))( *(void *)a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10);
    if ((_DWORD)result != 1) {
      return result;
    }
    if ((*(_BYTE *)(a1 + 88) & 8) == 0) {
      return 1LL;
    }
    *(_DWORD *)(a1 + 92) = 2;
  }

  if (*a4 >= a5) {
    return a10 == 3;
  }
  else {
    return 9LL;
  }
}

void auto_decoder_end(void *a1, uint64_t a2)
{
}

uint64_t auto_decoder_get_check(void *a1)
{
  int64_t v1 = (uint64_t (*)(void))a1[6];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0LL;
  }
}

uint64_t auto_decoder_memconfig(void *a1, unint64_t *a2, void *a3, unint64_t a4)
{
  uint64_t v6 = (uint64_t (*)(void, unint64_t *, void *, unint64_t))a1[7];
  if (v6)
  {
    uint64_t result = v6(*a1, a2, a3, a4);
    if (!a4) {
      return result;
    }
  }

  else
  {
    *a2 = 0x8000LL;
    *a3 = a1[10];
    if (!a4) {
      return 0LL;
    }
    if (*a2 <= a4) {
      uint64_t result = 0LL;
    }
    else {
      uint64_t result = 6LL;
    }
  }

  if (!(_DWORD)result) {
    a1[10] = a4;
  }
  return result;
}

uint64_t lzma_block_buffer_decode( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8)
{
  if (!a4) {
    return 11LL;
  }
  unint64_t v15 = *a4;
  if (!a3 && v15 != a5) {
    return 11LL;
  }
  uint64_t v16 = 11LL;
  if (a7 && v15 <= a5)
  {
    BOOL v18 = *a7 != a8 && a6 == 0;
    if (!v18 && *a7 <= a8)
    {
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      v23[0] = 0LL;
      v23[1] = -1LL;
      uint64_t v16 = lzma_block_decoder_init((uint64_t)v23, a2, a1);
      if (!(_DWORD)v16)
      {
        unint64_t v20 = *a4;
        unint64_t v21 = *a7;
        uint64_t v22 = (*((uint64_t (**)(void, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))&v24
               + 1))( v23[0],  a2,  a3,  a4,  a5,  a6,  a7,  a8,  3);
        if ((_DWORD)v22 == 1)
        {
          uint64_t v16 = 0LL;
        }

        else
        {
          uint64_t v16 = v22;
          if (!(_DWORD)v22)
          {
            if (*a4 == a5) {
              uint64_t v16 = 9LL;
            }
            else {
              uint64_t v16 = 10LL;
            }
          }

          *a4 = v20;
          *a7 = v21;
        }
      }

      lzma_next_end((uint64_t)v23, a2);
    }
  }

  return v16;
}

uint64_t lzma_block_decoder_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = lzma_block_decoder_init;
  uint64_t v6 = *(char **)a1;
  if (!*(void *)a1)
  {
    uint64_t v7 = (char *)lzma_alloc(0x138uLL, a2);
    if (!v7) {
      return 5LL;
    }
    uint64_t v6 = v7;
    *(void *)a1 = v7;
    *(void *)(a1 + 24) = block_decode;
    *(void *)(a1 + 32) = block_decoder_end;
    *((void *)v7 + 1) = 0LL;
    *((void *)v7 + 2) = -1LL;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *(_OWORD *)(v7 + 72) = 0u;
  }

  *(_DWORD *)uint64_t v6 = 0;
  *((void *)v6 + 12) = 0LL;
  *((void *)v6 + 13) = 0LL;
  *((void *)v6 + 11) = a3;
  uint64_t v8 = *(void *)(a3 + 16);
  if (v8 == -1)
  {
    uint64_t v11 = *(unsigned int *)(a3 + 4);
    unsigned int v9 = *(_DWORD *)(a3 + 8);
    uint64_t v8 = 0x7FFFFFFFFFFFFFFCLL - (v11 + lzma_check_size(v9));
  }

  else
  {
    unsigned int v9 = *(_DWORD *)(a3 + 8);
  }

  uint64_t v12 = *(void *)(a3 + 24);
  if (v12 == -1) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *((void *)v6 + 14) = v8;
  *((void *)v6 + 15) = v12;
  *((void *)v6 + 16) = 0LL;
  lzma_check_init((uint64_t)(v6 + 136), v9);
  int v13 = *(_DWORD *)a3;
  if (*(_DWORD *)a3) {
    LOBYTE(v13) = *(_BYTE *)(a3 + 200) != 0;
  }
  v6[304] = v13;
  return lzma_raw_decoder_init((uint64_t)(v6 + 8), a2, *(uint64_t **)(a3 + 32));
}

uint64_t block_decode( int *a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8)
{
  int v12 = *a1;
  if (!*a1)
  {
    uint64_t v18 = *a4;
    unint64_t v19 = *a7;
    unint64_t v20 = *((void *)a1 + 14) - *((void *)a1 + 12);
    if (a5 - *a4 < v20) {
      unint64_t v20 = a5 - *a4;
    }
    uint64_t v21 = (*((uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t))a1 + 4))( *((void *)a1 + 1),  a2,  a3,  a4,  v20 + v18);
    unint64_t v22 = *a4;
    unint64_t v23 = *a7;
    unint64_t v24 = *a7 - v19;
    uint64_t v25 = *((void *)a1 + 12) + *a4 - v18;
    unint64_t v26 = *((void *)a1 + 13) + v24;
    *((void *)a1 + 12) = v25;
    *((void *)a1 + 13) = v26;
    if (!(_DWORD)v21)
    {
      uint64_t v27 = *((void *)a1 + 11);
      uint64_t v28 = *(void *)(v27 + 16);
      BOOL v29 = v26 == *(void *)(v27 + 24);
      char v30 = v23 < a8 || v29;
      char v31 = v25 == v28 ? v30 : 0;
      BOOL v32 = v22 < a5 && v29;
      uint64_t result = 9LL;
      if ((v31 & 1) != 0 || v32) {
        return result;
      }
    }

    if (!*((_BYTE *)a1 + 304) && v23 != v19) {
      lzma_check_update((uint64_t)(a1 + 34), *(_DWORD *)(*((void *)a1 + 11) + 8LL), (char *)(a6 + v19), v24);
    }
    uint64_t result = v21;
    if ((_DWORD)v21 != 1) {
      return result;
    }
    uint64_t v34 = *((void *)a1 + 11);
    uint64_t v13 = *((void *)a1 + 12);
    uint64_t v35 = *(void *)(v34 + 16);
    if (v35 != -1 && v35 != v13) {
      return 9LL;
    }
    uint64_t v36 = *((void *)a1 + 13);
    uint64_t v37 = *(void *)(v34 + 24);
    if (v37 != -1 && v37 != v36) {
      return 9LL;
    }
    *(void *)(v34 + 16) = v13;
    *(void *)(v34 + 24) = v36;
    *a1 = 1;
LABEL_5:
    while ((v13 & 3) != 0)
    {
      uint64_t v14 = *a4;
      if (*a4 >= a5) {
        return 0LL;
      }
      *((void *)a1 + 12) = ++v13;
      *a4 = v14 + 1;
      if (*(_BYTE *)(a3 + v14)) {
        return 9LL;
      }
    }

    int v38 = *(_DWORD *)(*((void *)a1 + 11) + 8LL);
    if (!v38) {
      return 1LL;
    }
    if (!*((_BYTE *)a1 + 304)) {
      lzma_check_finish((uint64_t)(a1 + 34), v38);
    }
    *a1 = 2;
LABEL_37:
    uint64_t v39 = *((void *)a1 + 11);
    size_t v40 = lzma_check_size(*(_DWORD *)(v39 + 8));
    lzma_bufcpy(a3, a4, a5, v39 + 40, (uint64_t *)a1 + 16, v40);
    if (*((void *)a1 + 16) < v40) {
      return 0LL;
    }
    if (!*((_BYTE *)a1 + 304))
    {
      uint64_t v41 = *((void *)a1 + 11);
      if (lzma_check_is_supported(*(_DWORD *)(v41 + 8)))
      {
      }
    }

    return 1LL;
  }

  if (v12 == 2) {
    goto LABEL_37;
  }
  if (v12 == 1)
  {
    uint64_t v13 = *((void *)a1 + 12);
    goto LABEL_5;
  }

  return 11LL;
}

void block_decoder_end(void *a1, uint64_t a2)
{
}

uint64_t lzma_block_decoder(void *a1, uint64_t a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = lzma_block_decoder_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }

  return v4;
}

uint64_t lzma_block_header_decode(uint64_t a1, uint64_t a2, char *a3)
{
  if (!a1) {
    return 11LL;
  }
  uint64_t v4 = 11LL;
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      for (uint64_t i = 0LL; i != 80; i += 16LL)
      {
        unsigned int v9 = (void *)(v6 + i);
        *unsigned int v9 = -1LL;
        v9[1] = 0LL;
      }

      if (*(_DWORD *)a1 > 1u) {
        *(_DWORD *)a1 = 1;
      }
      *(_BYTE *)(a1 + 200) = 0;
      unint64_t v10 = 4LL * *a3;
      if ((_DWORD)v10 + 4 != *(_DWORD *)(a1 + 4) || *(_DWORD *)(a1 + 8) > 0xFu) {
        return 11LL;
      }
      if (lzma_crc32(a3, 4LL * *a3, 0) == *(_DWORD *)&a3[v10])
      {
        char v12 = a3[1];
        if ((v12 & 0x3C) != 0) {
          return 8LL;
        }
        unint64_t v21 = 2LL;
        uint64_t v13 = (unint64_t *)(a1 + 16);
        if ((v12 & 0x40) == 0)
        {
          *uint64_t v13 = -1LL;
LABEL_19:
          uint64_t v14 = (unint64_t *)(a1 + 24);
          if (a3[1] < 0)
          {
            uint64_t v4 = lzma_vli_decode(v14, 0LL, (uint64_t)a3, &v21, v10);
            if ((_DWORD)v4) {
              return v4;
            }
          }

          else
          {
            unint64_t *v14 = -1LL;
          }

          uint64_t v15 = 0LL;
          uint64_t v16 = 16LL * (a3[1] & 3) + 16;
          while (1)
          {
            uint64_t v17 = lzma_filter_flags_decode((unint64_t *)(*(void *)(a1 + 32) + v15), a2, (uint64_t)a3, &v21, v10);
            if ((_DWORD)v17) {
              break;
            }
            v15 += 16LL;
            if (v16 == v15)
            {
              unint64_t v18 = v21;
              if (v21 <= v10) {
                unint64_t v19 = v10;
              }
              else {
                unint64_t v19 = v21;
              }
              while (v19 != v18)
              {
                int v20 = a3[v18++];
                unint64_t v21 = v18;
                if (v20)
                {
                  uint64_t v4 = 8LL;
                  goto LABEL_34;
                }
              }

              return 0LL;
            }
          }

          uint64_t v4 = v17;
LABEL_34:
          lzma_filters_free(*(void **)(a1 + 32), a2);
          return v4;
        }

        uint64_t v4 = lzma_vli_decode(v13, 0LL, (uint64_t)a3, &v21, v10);
        if ((_DWORD)v4) {
          return v4;
        }
        if (lzma_block_unpadded_size(a1)) {
          goto LABEL_19;
        }
      }

      return 9LL;
    }
  }

  return v4;
}

uint64_t lzma_easy_decoder_memusage(int a1)
{
  if (lzma_easy_preset(v2, a1)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return lzma_raw_decoder_memusage(v2);
  }
}

uint64_t lzma_raw_buffer_decode( uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8)
{
  uint64_t v9 = 11LL;
  if (a3)
  {
    if (a4)
    {
      if (a7)
      {
        if (a6)
        {
          if (*a4 <= a5 && *a7 <= a8)
          {
            __int128 v25 = 0u;
            __int128 v26 = 0u;
            __int128 v23 = 0u;
            __int128 v24 = 0u;
            v22[0] = 0LL;
            v22[1] = -1LL;
            uint64_t v9 = lzma_raw_decoder_init((uint64_t)v22, a2, a1);
            if (!(_DWORD)v9)
            {
              unint64_t v16 = *a4;
              unint64_t v17 = *a7;
              uint64_t v18 = (*((uint64_t (**)(void, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))&v23
                     + 1))( v22[0],  a2,  a3,  a4,  a5,  a6,  a7,  a8,  3);
              if ((_DWORD)v18 == 1)
              {
                uint64_t v9 = 0LL;
              }

              else
              {
                uint64_t v9 = v18;
                if (!(_DWORD)v18)
                {
                  if (*a4 == a5)
                  {
                    uint64_t v9 = 9LL;
                    if (*a7 == a8)
                    {
                      uint64_t v20 = 0LL;
                      (*((void (**)(void, uint64_t, uint64_t, unint64_t *, unint64_t, char *, uint64_t *, uint64_t, int))&v23
                       + 1))( v22[0],  a2,  a3,  a4,  a5,  &v21,  &v20,  1LL,  3);
                      if (v20 == 1) {
                        uint64_t v9 = 10LL;
                      }
                      else {
                        uint64_t v9 = 9LL;
                      }
                    }
                  }

                  else
                  {
                    uint64_t v9 = 10LL;
                  }
                }

                *a4 = v16;
                *a7 = v17;
              }

              lzma_next_end((uint64_t)v22, a2);
            }
          }
        }
      }
    }
  }

  return v9;
}

BOOL lzma_filter_decoder_is_supported(uint64_t a1)
{
  uint64_t v1 = 0LL;
  do
  {
    uint64_t v2 = decoders[v1];
    if (v2 == a1) {
      break;
    }
    BOOL v3 = v1 == 40;
    v1 += 4LL;
  }

  while (!v3);
  return v2 == a1;
}

uint64_t *decoder_find(uint64_t a1)
{
  uint64_t v1 = 0LL;
  while (decoders[v1] != a1)
  {
    v1 += 4LL;
    if (v1 == 44) {
      return 0LL;
    }
  }

  return &decoders[v1];
}

uint64_t lzma_raw_decoder_init(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return lzma_raw_coder_init(a1, a2, a3, (uint64_t (*)(uint64_t))decoder_find, 0);
}

uint64_t lzma_raw_decoder(void *a1, uint64_t *a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = lzma_raw_coder_init(a1[7], a1[6], a2, (uint64_t (*)(uint64_t))decoder_find, 0);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }

  return v4;
}

uint64_t lzma_raw_decoder_memusage(uint64_t *a1)
{
  return lzma_raw_coder_memusage((uint64_t (*)(uint64_t))decoder_find, a1);
}

uint64_t lzma_properties_decode(uint64_t *a1)
{
  uint64_t v1 = 0LL;
  uint64_t v2 = *a1;
  a1[1] = 0LL;
  BOOL v3 = a1 + 1;
  while (decoders[v1] != v2)
  {
    v1 += 4LL;
    if (v1 == 44) {
      return 8LL;
    }
  }

  return ((uint64_t (*)(void *))decoders[v1 + 3])(v3);
}

uint64_t lzma_filter_flags_decode( unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  a1[1] = 0LL;
  uint64_t result = lzma_vli_decode(a1, 0LL, a3, a4, a5);
  if (!(_DWORD)result)
  {
    if (*a1 >> 62) {
      return 9LL;
    }
    uint64_t result = lzma_vli_decode(&v10, 0LL, a3, a4, a5);
    if (!(_DWORD)result)
    {
      if (a5 - *a4 < v10) {
        return 9LL;
      }
      uint64_t result = lzma_properties_decode((uint64_t *)a1);
      *a4 += v10;
    }
  }

  return result;
}

uint64_t lzma_index_decoder_init(uint64_t a1, uint64_t a2, void *a3, unint64_t a4)
{
  *(void *)(a1 + 16) = lzma_index_decoder_init;
  if (!a3) {
    return 11LL;
  }
  uint64_t v8 = *(void **)a1;
  if (*(void *)a1)
  {
    lzma_index_end((uint64_t *)v8[2], a2);
  }

  else
  {
    unint64_t v10 = lzma_alloc(0x48uLL, a2);
    if (!v10) {
      return 5LL;
    }
    uint64_t v8 = v10;
    *(void *)a1 = v10;
    *(void *)(a1 + 24) = index_decode;
    *(void *)(a1 + 32) = index_decoder_end;
    *(void *)(a1 + 56) = index_decoder_memconfig;
    v10[2] = 0LL;
  }

  v8[3] = a3;
  *a3 = 0LL;
  uint64_t v11 = lzma_index_init(a2);
  v8[2] = v11;
  if (!v11) {
    return 5LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)uint64_t v8 = 0;
  if (a4 <= 1) {
    uint64_t v12 = 1LL;
  }
  else {
    uint64_t v12 = a4;
  }
  v8[1] = v12;
  v8[4] = 0LL;
  v8[7] = 0LL;
  *((_DWORD *)v8 + 16) = 0;
  return result;
}

uint64_t index_decode(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  unint64_t v5 = *a4;
  if (*a4 >= a5) {
    return 0LL;
  }
  unint64_t v10 = (char *)(a1 + 56);
  uint64_t v11 = (unint64_t *)(a1 + 40);
  uint64_t v28 = (unint64_t *)(a1 + 48);
  uint64_t v13 = (unint64_t *)(a1 + 32);
  int v12 = *(_DWORD *)a1;
  unint64_t v14 = *a4;
  while (2)
  {
    switch(v12)
    {
      case 0:
        *a4 = v14 + 1;
        if (*(_BYTE *)(a3 + v14)) {
          return 9LL;
        }
        int v12 = 1;
        goto LABEL_27;
      case 1:
        uint64_t v16 = lzma_vli_decode(v13, v10, a3, a4, a5);
        if ((_DWORD)v16 != 1) {
          goto LABEL_30;
        }
        *(void *)(a1 + 56) = 0LL;
        *(_DWORD *)a1 = 2;
LABEL_15:
        if ((unint64_t)lzma_index_memusage(1LL, *(void *)(a1 + 32)) > *(void *)(a1 + 8))
        {
          uint64_t v22 = 6LL;
          goto LABEL_32;
        }

        lzma_index_prealloc(*(void *)(a1 + 16), *(void *)(a1 + 32));
        BOOL v17 = *(void *)(a1 + 32) == 0LL;
        goto LABEL_24;
      case 2:
        goto LABEL_15;
      case 3:
      case 4:
        if (v12 == 3) {
          uint64_t v15 = v11;
        }
        else {
          uint64_t v15 = v28;
        }
        uint64_t v16 = lzma_vli_decode(v15, v10, a3, a4, a5);
        if ((_DWORD)v16 != 1)
        {
LABEL_30:
          uint64_t v22 = v16;
          goto LABEL_32;
        }

        *(void *)(a1 + 56) = 0LL;
        if (*(_DWORD *)a1 == 3)
        {
          if (*v11 - 0x7FFFFFFFFFFFFFFDLL < 0x8000000000000008LL) {
            return 9LL;
          }
          int v12 = 4;
        }

        else
        {
          uint64_t v21 = lzma_index_append(*(void **)(a1 + 16), a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
          if ((_DWORD)v21) {
            return v21;
          }
          BOOL v17 = (*v13)-- == 1;
LABEL_24:
          if (v17) {
            int v12 = 5;
          }
          else {
            int v12 = 3;
          }
        }

LABEL_27:
        *(_DWORD *)a1 = v12;
        goto LABEL_28;
      case 5:
        unsigned int v18 = lzma_index_padding_size(*(void *)(a1 + 16));
        uint64_t v19 = v18;
        *(void *)(a1 + 56) = v18;
        *(_DWORD *)a1 = 6;
        if (!v18) {
          goto LABEL_34;
        }
        goto LABEL_20;
      case 6:
        uint64_t v19 = *(void *)v10;
        if (!*(void *)v10)
        {
LABEL_34:
          unint64_t v14 = *a4;
          *(_DWORD *)(a1 + 64) = lzma_crc32((char *)(a3 + v5), *a4 - v5, *(_DWORD *)(a1 + 64));
          *(_DWORD *)a1 = 7;
LABEL_35:
          while (a5 != v14)
          {
            uint64_t v23 = *(void *)(a1 + 56);
            int v24 = *(_DWORD *)(a1 + 64) >> (8 * v23);
            *a4 = v14 + 1;
            unint64_t v25 = v23 + 1;
            *(void *)unint64_t v10 = v25;
            ++v14;
            if (v25 >= 4)
            {
              **(void **)(a1 + 24) = *(void *)(a1 + 16);
              *(void *)(a1 + 16) = 0LL;
              return 1LL;
            }
          }

          return 0LL;
        }

LABEL_20:
        *(void *)unint64_t v10 = v19 - 1;
        unint64_t v20 = (*a4)++;
        if (*(_BYTE *)(a3 + v20)) {
          return 9LL;
        }
        int v12 = 6;
LABEL_28:
        unint64_t v14 = *a4;
        if (*a4 < a5) {
          continue;
        }
        uint64_t v22 = 0LL;
LABEL_32:
        if (*a4 != v5) {
          *(_DWORD *)(a1 + 64) = lzma_crc32((char *)(a3 + v5), *a4 - v5, *(_DWORD *)(a1 + 64));
        }
        return v22;
      case 7:
        goto LABEL_35;
      default:
        return 11LL;
    }
  }

void index_decoder_end(uint64_t **a1, uint64_t a2)
{
}

uint64_t index_decoder_memconfig(uint64_t a1, uint64_t *a2, void *a3, unint64_t a4)
{
  *a2 = lzma_index_memusage(1LL, *(void *)(a1 + 32));
  *a3 = *(void *)(a1 + 8);
  if (!a4) {
    return 0LL;
  }
  if (*a2 > a4) {
    return 6LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 8) = a4;
  return result;
}

uint64_t lzma_index_decoder(void *a1, void *a2, unint64_t a3)
{
  uint64_t v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    uint64_t v6 = lzma_index_decoder_init(a1[7], a1[6], a2, a3);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v7 = a1[7];
      *(_BYTE *)(v7 + 96) = 1;
      *(_BYTE *)(v7 + 99) = 1;
    }
  }

  return v6;
}

uint64_t lzma_index_buffer_decode( void *a1, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t *a5, unint64_t a6)
{
  uint64_t result = 11LL;
  if (a1 && a2 && a4 && a5)
  {
    if (*a5 <= a6)
    {
      unint64_t v13 = *a2;
      unint64_t v20 = a1;
      *a1 = 0LL;
      uint64_t v19 = lzma_index_init(a3);
      if (v19)
      {
        int v17 = 0;
        if (v13 <= 1) {
          uint64_t v14 = 1LL;
        }
        else {
          uint64_t v14 = v13;
        }
        uint64_t v18 = v14;
        unint64_t v21 = 0LL;
        uint64_t v22 = 0LL;
        int v23 = 0;
        unint64_t v15 = *a5;
        uint64_t v16 = index_decode((uint64_t)&v17, a3, a4, a5, a6);
        uint64_t result = 0LL;
        if ((_DWORD)v16 != 1)
        {
          lzma_index_end((uint64_t *)v19, a3);
          *a5 = v15;
          if ((_DWORD)v16)
          {
            if ((_DWORD)v16 == 6)
            {
              *a2 = lzma_index_memusage(1LL, v21);
              return 6LL;
            }

            else
            {
              return v16;
            }
          }

          else
          {
            return 9LL;
          }
        }
      }

      else
      {
        return 5LL;
      }
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

_OWORD *lzma_index_hash_init(_OWORD *a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1 || (uint64_t v2 = lzma_alloc(0x1C0uLL, a2)) != 0LL)
  {
    *(_DWORD *)uint64_t v2 = 0;
    *(_OWORD *)((char *)v2 + 8) = 0u;
    *(_OWORD *)((char *)v2 + 24) = 0u;
    v2[13] = 0u;
    v2[14] = 0u;
    *((void *)v2 + 53) = 0LL;
    *((void *)v2 + 54) = 0LL;
    *((void *)v2 + 52) = 0LL;
    *((_DWORD *)v2 + 110) = 0;
    lzma_check_init((uint64_t)v2 + 40, 10);
    lzma_check_init((uint64_t)(v2 + 15), 10);
  }

  return v2;
}

unint64_t lzma_index_hash_size(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  return (v1 + lzma_vli_size(*(void *)(a1 + 24)) + 1 + 7) & 0xFFFFFFFFFFFFFFFCLL;
}

uint64_t lzma_index_hash_append(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a1) {
    return 11LL;
  }
  uint64_t result = 11LL;
  if ((a3 & 0x8000000000000000LL) == 0 && a2 - 0x7FFFFFFFFFFFFFFDLL >= 0x8000000000000008LL && !*(_DWORD *)a1)
  {
    hash_append((void *)(a1 + 8), a2, a3);
    uint64_t v5 = *(void *)(a1 + 8);
    if (v5 < 0 || (*(void *)(a1 + 16) & 0x8000000000000000LL) != 0)
    {
      return 9LL;
    }

    else
    {
      unint64_t v6 = *(void *)(a1 + 24);
      uint64_t v7 = *(void *)(a1 + 32);
      unint64_t v8 = (v7 + lzma_vli_size(v6) + 1 + 7) & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t result = 9LL;
      if (v8 <= 0x400000000LL) {
        return ((uint64_t)(v5 + v8 + 24) >> 63) & 9;
      }
    }
  }

  return result;
}

uint64_t hash_append(void *a1, unint64_t a2, unint64_t a3)
{
  data[2] = *MEMORY[0x1895F89C0];
  unint64_t v6 = a1[1] + a3;
  *a1 += (a2 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  a1[1] = v6;
  int v7 = lzma_vli_size(a2);
  uint64_t v8 = a1[3] + lzma_vli_size(a3) + v7;
  ++a1[2];
  a1[3] = v8;
  data[0] = a2;
  data[1] = a3;
  return lzma_check_update((uint64_t)(a1 + 4), 10, (char *)data, 0x10uLL);
}

uint64_t lzma_index_hash_decode(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4 = *a3;
  if (*a3 >= a4) {
    return 10LL;
  }
  uint64_t v9 = (char *)(a1 + 432);
  BOOL v29 = (unint64_t *)(a1 + 424);
  char v30 = (unint64_t *)(a1 + 416);
  uint64_t v11 = (void *)(a1 + 208);
  int v10 = *(_DWORD *)a1;
  int v12 = (unint64_t *)(a1 + 408);
  unint64_t v13 = *a3;
  while (2)
  {
    switch(v10)
    {
      case 0:
        *a3 = v13 + 1;
        if (*(_BYTE *)(a2 + v13)) {
          return 9LL;
        }
        int v10 = 1;
        goto LABEL_28;
      case 1:
        uint64_t v15 = lzma_vli_decode(v12, v9, a2, a3, a4);
        if ((_DWORD)v15 != 1) {
          goto LABEL_32;
        }
        uint64_t v17 = *(void *)(a1 + 408);
        if (v17 != *(void *)(a1 + 24)) {
          return 9LL;
        }
        *(void *)uint64_t v9 = 0LL;
        BOOL v18 = v17 == 0;
        goto LABEL_25;
      case 2:
      case 3:
        if (v10 == 2) {
          uint64_t v14 = v30;
        }
        else {
          uint64_t v14 = v29;
        }
        uint64_t v15 = lzma_vli_decode(v14, v9, a2, a3, a4);
        if ((_DWORD)v15 != 1)
        {
LABEL_32:
          uint64_t v23 = v15;
          goto LABEL_33;
        }

        *(void *)(a1 + 432) = 0LL;
        unint64_t v16 = *(void *)(a1 + 416);
        if (*(_DWORD *)a1 == 2)
        {
          if (v16 - 0x7FFFFFFFFFFFFFFDLL < 0x8000000000000008LL) {
            return 9LL;
          }
          int v10 = 3;
        }

        else
        {
          hash_append(v11, v16, *(void *)(a1 + 424));
          if (*(void *)(a1 + 8) < *(void *)(a1 + 208)
            || *(void *)(a1 + 16) < *(void *)(a1 + 216)
            || *(void *)(a1 + 32) < *(void *)(a1 + 232))
          {
            return 9LL;
          }

          BOOL v18 = (*v12)-- == 1;
LABEL_25:
          if (v18) {
            int v10 = 4;
          }
          else {
            int v10 = 2;
          }
        }

LABEL_28:
        *(_DWORD *)a1 = v10;
        goto LABEL_29;
      case 4:
        int v19 = *(_DWORD *)(a1 + 232);
        char v20 = lzma_vli_size(*(void *)(a1 + 224));
        uint64_t v21 = ~(v20 + (_BYTE)v19) & 3;
        *(void *)(a1 + 432) = v21;
        *(_DWORD *)a1 = 5;
        if ((~(v20 + (_BYTE)v19) & 3) == 0) {
          goto LABEL_35;
        }
        goto LABEL_19;
      case 5:
        uint64_t v21 = *(void *)v9;
        if (!*(void *)v9)
        {
LABEL_35:
          if (*(void *)(a1 + 8) != *(void *)(a1 + 208)) {
            return 9LL;
          }
          if (*(void *)(a1 + 16) != *(void *)(a1 + 216)) {
            return 9LL;
          }
          if (*(void *)(a1 + 32) != *(void *)(a1 + 232)) {
            return 9LL;
          }
          lzma_check_finish(a1 + 40, 10);
          lzma_check_finish(a1 + 240, 10);
          unsigned int v24 = lzma_check_size(0xAu);
          *(_DWORD *)(a1 + 440) = lzma_crc32((char *)(a2 + v4), *a3 - v4, *(_DWORD *)(a1 + 440));
          *(_DWORD *)a1 = 6;
LABEL_43:
          uint64_t v23 = 1LL;
          while (1)
          {
            unint64_t v26 = *a3;
            if (*a3 == a4) {
              break;
            }
            int v27 = *(_DWORD *)(a1 + 440) >> (8 * *(_BYTE *)(a1 + 432));
            *a3 = v26 + 1;
            unint64_t v28 = *(void *)v9 + 1LL;
            *(void *)uint64_t v9 = v28;
            if (v28 >= 4) {
              return v23;
            }
          }

          return 0LL;
        }

  int v27 = v22 + 1;
LABEL_29:
  BOOL v29 = *(_DWORD *)(a1 + 108);
  unint64_t v28 = *(_DWORD *)(a1 + 112);
  char v30 = v17 << !v21;
  *(_DWORD *)(a1 + 108) = v27;
  *(_DWORD *)(a1 + 112) = v30;
  if (v29 != v27 || v28 != v30)
  {
    lzma_free(*(void **)(a1 + 64), a2);
    *(void *)(a1 + 64) = 0LL;
    lzma_free(*(void **)(a1 + 72), a2);
    *(void *)(a1 + 72) = 0LL;
  }

  char v31 = *((_DWORD *)a3 + 11);
  *(_DWORD *)(a1 + 92) = v31;
  uint64_t result = 0LL;
  if (!v31)
  {
    if (v21) {
      BOOL v32 = 2;
    }
    else {
      BOOL v32 = 1;
    }
    if (v21) {
      __int128 v33 = 4;
    }
    else {
      __int128 v33 = 16;
    }
    *(_DWORD *)(a1 + 92) = (*(_DWORD *)(a1 + 96) >> v32) + v33;
  }

  return result;
}

LABEL_19:
        *(void *)uint64_t v9 = v21 - 1;
        unint64_t v22 = (*a3)++;
        if (*(_BYTE *)(a2 + v22)) {
          return 9LL;
        }
        int v10 = 5;
LABEL_29:
        unint64_t v13 = *a3;
        if (*a3 < a4) {
          continue;
        }
        uint64_t v23 = 0LL;
LABEL_33:
        if (*a3 != v4) {
          *(_DWORD *)(a1 + 440) = lzma_crc32((char *)(a2 + v4), *a3 - v4, *(_DWORD *)(a1 + 440));
        }
        return v23;
      case 6:
        goto LABEL_43;
      default:
        return 11LL;
    }
  }

    if (v22)
    {
      uint64_t result = copy_or_code(a1, a2, v28, v32, v33, a1 + 144, (uint64_t *)(a1 + 136), *(void *)(a1 + 112), a9);
      if ((_DWORD)result) {
        return result;
      }
      BOOL v29 = (*(uint64_t (**)(void, void, void, uint64_t, void))(a1 + 88))( *(void *)(a1 + 96),  *(unsigned int *)(a1 + 104),  *(unsigned __int8 *)(a1 + 81),  a1 + 144,  *(void *)(a1 + 136));
      *(_DWORD *)(a1 + 104) += v29;
      *(void *)(a1 + 128) = v29;
      if (*(_BYTE *)(a1 + 80))
      {
        BOOL v29 = *(void *)(a1 + 136);
        *(void *)(a1 + 128) = v29;
      }

      lzma_bufcpy(a1 + 144, v20, v29, v34, a7, a8);
    }

    return *(_BYTE *)(a1 + 80) && *v20 == *v21;
  }

  return result;
}

uint64_t lzma_stream_buffer_decode( unint64_t *a1, char a2, uint64_t a3, uint64_t a4, unint64_t *a5, unint64_t a6, uint64_t a7, unint64_t *a8, unint64_t a9)
{
  if (!a5) {
    return 11LL;
  }
  unint64_t v16 = *a5;
  if (!a4 && v16 != a6) {
    return 11LL;
  }
  uint64_t v17 = 11LL;
  if (a8)
  {
    if (v16 <= a6)
    {
      unint64_t v19 = *a8;
      if ((a7 || v19 == a9) && (a2 & 4) == 0 && v19 <= a9)
      {
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        v24[0] = 0LL;
        v24[1] = -1LL;
        uint64_t v17 = lzma_stream_decoder_init((uint64_t)v24, a3, *a1, a2, (int16x8_t)0);
        if (!(_DWORD)v17)
        {
          unint64_t v20 = *a5;
          unint64_t v22 = *a8;
          uint64_t v21 = (*((uint64_t (**)(void, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, unint64_t *, unint64_t, int))&v25
                 + 1))( v24[0],  a3,  a4,  a5,  a6,  a7,  a8,  a9,  3);
          if ((_DWORD)v21 == 1)
          {
            uint64_t v17 = 0LL;
          }

          else
          {
            uint64_t v17 = v21;
            *a5 = v20;
            *a8 = v22;
            if ((_DWORD)v21 == 6)
            {
              (*((void (**)(void, unint64_t *, _BYTE *, void))&v27 + 1))(v24[0], a1, v23, 0LL);
            }

            else if (!(_DWORD)v21)
            {
              if (*a5 == a6) {
                uint64_t v17 = 9LL;
              }
              else {
                uint64_t v17 = 10LL;
              }
            }
          }
        }

        lzma_next_end((uint64_t)v24, a3);
      }
    }
  }

  return v17;
}

uint64_t lzma_microlzma_decoder(void *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v10 = lzma_strm_init(a1);
  if (!(_DWORD)v10)
  {
    uint64_t v10 = microlzma_decoder_init(a1[7], a1[6], a2, a3, a4 != 0, a5);
    if ((_DWORD)v10)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v11 = a1[7];
      *(_BYTE *)(v11 + 96) = 1;
      *(_BYTE *)(v11 + 99) = 1;
    }
  }

  return v10;
}

uint64_t microlzma_decoder_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  *(void *)(a1 + 16) = microlzma_decoder_init;
  int v12 = *(void **)a1;
  if (!*(void *)a1)
  {
    int v12 = lzma_alloc(0x68uLL, a2);
    if (!v12) {
      return 5LL;
    }
    *(void *)a1 = v12;
    *(void *)(a1 + 24) = microlzma_decode;
    *(void *)(a1 + 32) = microlzma_decoder_end;
    *int v12 = 0LL;
    v12[1] = -1LL;
    *((_OWORD *)v12 + 1) = 0u;
    *((_OWORD *)v12 + 2) = 0u;
    *((_OWORD *)v12 + 3) = 0u;
    *((_OWORD *)v12 + 4) = 0u;
    if ((a4 & 0x8000000000000000LL) == 0) {
      goto LABEL_5;
    }
    return 8LL;
  }

  if (a4 < 0) {
    return 8LL;
  }
LABEL_5:
  uint64_t v13 = 0LL;
  v12[10] = a3;
  v12[11] = a4;
  *((_BYTE *)v12 + 100) = a5;
  *((_DWORD *)v12 + 24) = a6;
  *((_BYTE *)v12 + 101) = 0;
  return v13;
}

uint64_t microlzma_decode( void *a1, uint64_t a2, uint64_t a3, unint64_t *a4, unint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  uint64_t v9 = a8;
  v35[6] = *MEMORY[0x1895F89C0];
  unint64_t v16 = *a4;
  uint64_t v17 = *a7;
  unint64_t v18 = a1[10];
  if (a5 - *a4 <= v18) {
    unint64_t v19 = a5;
  }
  else {
    unint64_t v19 = v18 + *a4;
  }
  int v20 = *((unsigned __int8 *)a1 + 100);
  if (!*((_BYTE *)a1 + 100))
  {
    unint64_t v21 = a1[11];
    if (a8 - v17 > v21) {
      uint64_t v9 = v21 + v17;
    }
  }

  if (*((_BYTE *)a1 + 101))
  {
LABEL_8:
    LODWORD(result) = ((uint64_t (*)(void, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, uint64_t *, uint64_t, int))a1[3])( *a1,  a2,  a3,  a4,  v19,  a6,  a7,  v9,  a9);
    uint64_t v23 = v16 - *a4 + a1[10];
    a1[10] = v23;
    if (*((_BYTE *)a1 + 100))
    {
      if (v23) {
        unsigned int v24 = 9;
      }
      else {
        unsigned int v24 = 1;
      }
      if ((_DWORD)result == 1) {
        return v24;
      }
      else {
        return result;
      }
    }

    else
    {
      BOOL v26 = v17 - *a7 + a1[11] == 0;
      a1[11] += v17 - *a7;
      if (v26) {
        unsigned int v27 = 1;
      }
      else {
        unsigned int v27 = result;
      }
      if ((_DWORD)result == 1) {
        return 9LL;
      }
      else {
        return v27;
      }
    }
  }

  if (v16 >= v19) {
    return 0LL;
  }
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  memset(v30, 0, sizeof(v30));
  LODWORD(v30[0]) = *((_DWORD *)a1 + 24);
  *(void *)((char *)&v31 + 4) = -1LL;
  if (v20) {
    *(void *)((char *)&v31 + 4) = a1[11];
  }
  *a4 = v16 + 1;
  v35[0] = 0x4000000000000002LL;
  v35[1] = lzma_lzma_decoder_init;
  v35[2] = v30;
  memset(&v35[3], 0, 24);
  uint64_t result = lzma_next_filter_init((uint64_t)a1, a2, v35, v25);
  if (!(_DWORD)result)
  {
    char v29 = 0;
    uint64_t v28 = 0LL;
    if (((unsigned int (*)(void, uint64_t, char *, uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t, _DWORD))a1[3])( *a1,  a2,  &v29,  &v28,  1LL,  a6,  a7,  v9,  0))
    {
      return 11LL;
    }

    *((_BYTE *)a1 + 101) = 1;
    goto LABEL_8;
  }

  return result;
}

void microlzma_decoder_end(void *a1, uint64_t a2)
{
}

uint64_t lzma_stream_decoder_init(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4, int16x8_t a5)
{
  *(void *)(a1 + 16) = lzma_stream_decoder_init;
  if (a4 > 0x3F) {
    return 8LL;
  }
  uint64_t v9 = *(char **)a1;
  if (*(void *)a1)
  {
    uint64_t v10 = (_OWORD *)*((void *)v9 + 44);
  }

  else
  {
    int v12 = (char *)lzma_alloc(0x588uLL, a2);
    if (!v12) {
      return 5LL;
    }
    uint64_t v9 = v12;
    uint64_t v10 = 0LL;
    *(void *)(a1 + 24) = stream_decode;
    *(void *)(a1 + 32) = stream_decoder_end;
    *(void *)(a1 + 48) = stream_decoder_get_check;
    *(void *)(a1 + 56) = stream_decoder_memconfig;
    *(void *)a1 = v9;
    *((void *)v9 + 1) = 0LL;
    *((void *)v9 + 2) = -1LL;
    a5.i8[8] = 0;
    a5.i8[9] = 0;
    a5.i8[10] = 0;
    a5.i8[11] = 0;
    a5.i8[12] = 0;
    a5.i8[13] = 0;
    a5.i8[14] = 0;
    a5.i8[15] = 0;
    *(_OWORD *)(v9 + 24) = 0u;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *(_OWORD *)(v9 + 72) = 0u;
    *((void *)v9 + 44) = 0LL;
  }

  if (a3 <= 1) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = a3;
  }
  *((void *)v9 + 45) = v13;
  *((void *)v9 + 46) = 0x8000LL;
  v9[376] = a4 & 1;
  *(int16x4_t *)a5.i8 = vdup_n_s16(a4);
  a5.i32[0] &= 0xFF00FFu;
  a5.i16[2] = a5.u8[4];
  a5.i16[3] = a5.u8[6];
  *(uint16x4_t *)a5.i8 = vshl_u16(*(uint16x4_t *)a5.i8, (uint16x4_t)0xFFFDFFFCFFFEFFFFLL);
  a5.i32[0] &= 0xFF01FF01;
  a5.i16[2] &= 0xFF01u;
  a5.i16[3] &= 0xFF01u;
  *(_DWORD *)(v9 + 377) = vmovn_s16(a5).u32[0];
  v9[381] = 1;
  uint64_t v14 = lzma_index_hash_init(v10, a2);
  *((void *)v9 + 44) = v14;
  if (v14)
  {
    uint64_t result = 0LL;
    *(_DWORD *)uint64_t v9 = 0;
    *((void *)v9 + 48) = 0LL;
    return result;
  }

  return 5LL;
}

uint64_t stream_decode( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  v36[10] = *MEMORY[0x1895F89C0];
  uint64_t v14 = (char *)(a1 + 392);
  uint64_t v15 = (uint64_t *)(a1 + 384);
  uint64_t v32 = a1 + 296;
  uint64_t v16 = a1 + 88;
  uint64_t v18 = a1 + 8;
  int v17 = *(_DWORD *)a1;
  while (2)
  {
    switch(v17)
    {
      case 0:
        lzma_bufcpy(a3, a4, a5, (uint64_t)v14, v15, 12LL);
        *uint64_t v15 = 0LL;
        uint64_t v19 = lzma_stream_header_decode(v32, (uint64_t)v14);
        if ((_DWORD)v19)
        {
          uint64_t v28 = v19;
          if ((_DWORD)v19 == 7)
          {
            if (*(_BYTE *)(a1 + 381)) {
              return 7LL;
            }
            else {
              return 9LL;
            }
          }
        }

        else
        {
          *(_BYTE *)(a1 + 381) = 0;
          unsigned int v20 = *(_DWORD *)(a1 + 312);
          *(_DWORD *)(a1 + 96) = v20;
          *(_DWORD *)a1 = 1;
          if (*(_BYTE *)(a1 + 376) && !v20)
          {
            return 2LL;
          }

          else if (*(_BYTE *)(a1 + 377) && !lzma_check_is_supported(v20))
          {
            return 3LL;
          }

          else
          {
            if (!*(_BYTE *)(a1 + 378)) {
              goto LABEL_10;
            }
            return 4LL;
          }
        }

        return v28;
      case 1:
LABEL_10:
        if (*a4 >= a5) {
          return 0LL;
        }
        if (*v15)
        {
          unsigned int v21 = *(_DWORD *)(a1 + 92);
        }

        else
        {
          if (!*(_BYTE *)(a3 + *a4))
          {
            int v17 = 4;
            *(_DWORD *)a1 = 4;
            continue;
          }

          unsigned int v21 = 4 * *(unsigned __int8 *)(a3 + *a4) + 4;
          *(_DWORD *)(a1 + 92) = v21;
        }

        lzma_bufcpy(a3, a4, a5, (uint64_t)v14, v15, v21);
        *(void *)(a1 + 384) = 0LL;
        *(_DWORD *)a1 = 2;
        goto LABEL_33;
      case 2:
LABEL_33:
        *(_DWORD *)(a1 + 88) = 1;
        *(void *)(a1 + 120) = v36;
        uint64_t v22 = lzma_block_header_decode(v16, a2, v14);
        if ((_DWORD)v22) {
          return v22;
        }
        *(_BYTE *)(a1 + 288) = *(_BYTE *)(a1 + 379);
        unint64_t v27 = lzma_raw_decoder_memusage(v36);
        if (v27 == -1LL)
        {
          uint64_t v28 = 8LL;
LABEL_50:
          lzma_filters_free(v36, a2);
          *(void *)(a1 + 120) = 0LL;
          return v28;
        }

        *(void *)(a1 + 368) = v27;
        if (v27 > *(void *)(a1 + 360))
        {
          uint64_t v28 = 6LL;
          goto LABEL_50;
        }

        uint64_t v28 = lzma_block_decoder_init(v18, a2, v16);
        lzma_filters_free(v36, a2);
        *(void *)(a1 + 120) = 0LL;
        if ((_DWORD)v28) {
          return v28;
        }
        *(_DWORD *)a1 = 3;
LABEL_38:
        uint64_t v22 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t, uint64_t, uint64_t, uint64_t, int))(a1 + 32))( *(void *)(a1 + 8),  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9);
        if ((_DWORD)v22 != 1) {
          return v22;
        }
        uint64_t v29 = *(void *)(a1 + 352);
        unint64_t v30 = lzma_block_unpadded_size(v16);
        uint64_t v22 = lzma_index_hash_append(v29, v30, *(void *)(a1 + 112));
        if ((_DWORD)v22) {
          return v22;
        }
        int v17 = 1;
        *(_DWORD *)a1 = 1;
        continue;
      case 3:
        goto LABEL_38;
      case 4:
        if (*a4 >= a5) {
          return 0LL;
        }
        uint64_t v22 = lzma_index_hash_decode(*(void *)(a1 + 352), a3, (unint64_t *)a4, a5);
        if ((_DWORD)v22 != 1) {
          return v22;
        }
        *(_DWORD *)a1 = 5;
LABEL_16:
        lzma_bufcpy(a3, a4, a5, (uint64_t)v14, v15, 12LL);
        *uint64_t v15 = 0LL;
        unsigned int v23 = lzma_stream_footer_decode((uint64_t)v36, (uint64_t)v14);
        if (v23)
        {
          if (v23 == 7) {
            return 9LL;
          }
          else {
            return v23;
          }
        }

        unint64_t v24 = lzma_index_hash_size(*(void *)(a1 + 352));
        if (v24 != v36[1]) {
          return 9LL;
        }
        uint64_t v22 = lzma_stream_flags_compare(v32, (uint64_t)v36);
        if ((_DWORD)v22) {
          return v22;
        }
        if (!*(_BYTE *)(a1 + 380)) {
          return 1LL;
        }
        *(_DWORD *)a1 = 6;
LABEL_22:
        uint64_t v25 = *a4;
        if (*a4 >= a5)
        {
LABEL_42:
          if (a9 != 3) {
            return 0LL;
          }
          if (*v15) {
            return 9LL;
          }
          return 1LL;
        }

        while (!*(_BYTE *)(a3 + v25))
        {
          *a4 = ++v25;
          *uint64_t v15 = (*(_DWORD *)v15 + 1) & 3;
          if (a5 == v25) {
            goto LABEL_42;
          }
        }

        if (!*v15)
        {
          BOOL v26 = lzma_index_hash_init(*(_OWORD **)(a1 + 352), a2);
          *(void *)(a1 + 352) = v26;
          if (!v26) {
            return 5LL;
          }
          int v17 = 0;
          *(_DWORD *)a1 = 0;
          *(void *)(a1 + 384) = 0LL;
          continue;
        }

        *a4 = v25 + 1;
        return 9LL;
      case 5:
        goto LABEL_16;
      case 6:
        goto LABEL_22;
      default:
        return 11LL;
    }
  }

void stream_decoder_end(void *a1, uint64_t a2)
{
  double end = lzma_next_end((uint64_t)(a1 + 1), a2);
  lzma_index_hash_end(a1[44], a2, end);
  lzma_free(a1, a2);
}

uint64_t stream_decoder_get_check(uint64_t a1)
{
  return *(unsigned int *)(a1 + 312);
}

uint64_t stream_decoder_memconfig(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  *a2 = *(void *)(a1 + 368);
  *a3 = *(void *)(a1 + 360);
  if (!a4) {
    return 0LL;
  }
  if (*(void *)(a1 + 368) > a4) {
    return 6LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 360) = a4;
  return result;
}

uint64_t lzma_stream_decoder(void *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    uint64_t v6 = lzma_stream_decoder_init(a1[7], a1[6], a2, a3, v7);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v8 = a1[7];
      *(_BYTE *)(v8 + 96) = 1;
      *(_BYTE *)(v8 + 99) = 1;
    }
  }

  return v6;
}

uint64_t lzma_stream_header_decode(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 != 1484404733 || *(_WORD *)(a2 + 4) != 90) {
    return 7LL;
  }
  uint64_t v6 = (_BYTE *)(a2 + 6);
  uint64_t result = 0LL;
  *(_DWORD *)a1 = 0;
  *(_DWORD *)(a1 + 16) = *(_BYTE *)(a2 + 7) & 0xF;
  *(void *)(a1 + 8) = -1LL;
  return result;
}

uint64_t lzma_stream_footer_decode(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  *(_DWORD *)a1 = 0;
  *(_DWORD *)(a1 + 16) = *(_BYTE *)(a2 + 9) & 0xF;
  *(void *)(a1 + 8) = 4LL * *(unsigned int *)(a2 + 4) + 4;
  return result;
}

uint64_t lzma_vli_decode( unint64_t *a1, char *a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  if (a2)
  {
    unint64_t v5 = *(void *)a2;
    if (*(void *)a2)
    {
      if (v5 > 8) {
        return 11LL;
      }
      unint64_t v6 = *a1;
    }

    else
    {
      unint64_t v6 = 0LL;
      *a1 = 0LL;
    }

    unint64_t v7 = *a4;
    if (*a4 >= a5) {
      return 10LL;
    }
  }

  else
  {
    *a1 = 0LL;
    unint64_t v7 = *a4;
    if (*a4 >= a5) {
      return 9LL;
    }
    unint64_t v6 = 0LL;
    unint64_t v5 = 0LL;
    a2 = &v16;
  }

  uint64_t v9 = 0LL;
  if (a5 <= v7 + 1) {
    unint64_t v10 = v7 + 1;
  }
  else {
    unint64_t v10 = a5;
  }
  for (char i = 7 * v5; ; i += 7)
  {
    int v12 = *(unsigned __int8 *)(a3 + v7 + v9);
    v6 += (unint64_t)(v12 & 0x7F) << i;
    uint64_t v13 = v5 + v9;
    if ((v12 & 0x80) == 0) {
      break;
    }
    if (v13 == 8)
    {
      *a4 = v7 - v5 + 9;
      uint64_t v8 = 9LL;
      *(void *)a2 = 9LL;
      *a1 = v6;
      return v8;
    }

    ++v9;
    if (v7 + v9 >= a5)
    {
      *a4 = v10;
      *(void *)a2 = v5 + v9;
      *a1 = v6;
      if (a2 == &v16) {
        return 9LL;
      }
      else {
        return 0LL;
      }
    }
  }

  *a4 = v7 + v9 + 1;
  *(void *)a2 = v13 + 1;
  *a1 = v6;
  if (v12) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = (unint64_t)(v13 + 1) > 1;
  }
  if (v14) {
    return 9LL;
  }
  else {
    return a2 != &v16;
  }
}

uint64_t lzma_check_is_supported(unsigned int a1)
{
  if (a1 <= 0xF) {
    return lzma_check_is_supported_available_checks[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t lzma_check_size(unsigned int a1)
{
  if (a1 <= 0xF) {
    return lzma_check_size_check_sizes[a1];
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t lzma_check_init(uint64_t result, int a2)
{
  switch(a2)
  {
    case 10:
      return CC_SHA256_Init((CC_SHA256_CTX *)(result + 64));
    case 4:
      *(void *)(result + 64) = 0LL;
      break;
    case 1:
      *(_DWORD *)(result + 64) = 0;
      break;
  }

  return result;
}

uint64_t lzma_check_update(uint64_t result, int a2, char *data, unint64_t len)
{
  unint64_t v4 = len;
  unint64_t v5 = data;
  uint64_t v6 = result;
  switch(a2)
  {
    case 10:
      if (HIDWORD(len))
      {
        do
        {
          CC_SHA256_Update((CC_SHA256_CTX *)(v6 + 64), v5, 0xFFFFFFFF);
          v5 += 0xFFFFFFFFLL;
          v4 -= 0xFFFFFFFFLL;
        }

        while (HIDWORD(v4));
      }

      return CC_SHA256_Update((CC_SHA256_CTX *)(v6 + 64), v5, v4);
    case 4:
      uint64_t result = lzma_crc64((unint64_t)data, len, *(void *)(result + 64));
      *(void *)(v6 + 64) = result;
      break;
    case 1:
      uint64_t result = lzma_crc32(data, len, *(_DWORD *)(result + 64));
      *(_DWORD *)(v6 + 64) = result;
      break;
  }

  return result;
}

uint64_t lzma_check_finish(uint64_t result, int a2)
{
  switch(a2)
  {
    case 10:
      return CC_SHA256_Final((unsigned __int8 *)result, (CC_SHA256_CTX *)(result + 64));
    case 4:
      *(void *)uint64_t result = *(void *)(result + 64);
      break;
    case 1:
      *(_DWORD *)uint64_t result = *(_DWORD *)(result + 64);
      break;
  }

  return result;
}

uint64_t lzma_crc32(char *a1, unint64_t a2, int a3)
{
  unsigned int v3 = ~a3;
  if (a2 >= 9)
  {
    if ((a1 & 7) != 0)
    {
      unint64_t v4 = a1 + 1;
      unint64_t v5 = a1;
      do
      {
        int v6 = *v5++;
        unsigned int v3 = lzma_crc32_table[v3 ^ v6] ^ (v3 >> 8);
        --a2;
      }

      while ((v4++ & 7) != 0LL);
      a1 += 8LL - (a1 & 7);
    }

    int64_t v8 = a2 & 0xFFFFFFFFFFFFFFF8LL;
    a2 &= 7u;
    if (v8 >= 1)
    {
      uint64_t v9 = &a1[v8];
      do
      {
        int v10 = *(_DWORD *)a1;
        unint64_t v11 = *((unsigned int *)a1 + 1);
        a1 += 8;
        unsigned int v12 = v10 ^ v3;
        unsigned int v3 = lzma_crc32_table[BYTE1(v12) + 1536] ^ lzma_crc32_table[v12 + 1792] ^ lzma_crc32_table[BYTE2(v12) + 1280] ^ lzma_crc32_table[HIBYTE(v12) + 1024] ^ lzma_crc32_table[v11 + 768] ^ lzma_crc32_table[BYTE1(v11) + 512] ^ lzma_crc32_table[BYTE2(v11) + 256] ^ *(_DWORD *)((char *)lzma_crc32_table + ((v11 >> 22) & 0x3FC));
      }

      while (a1 < v9);
    }
  }

  for (; a2; --a2)
  {
    int v13 = *a1++;
    unsigned int v3 = lzma_crc32_table[v3 ^ v13] ^ (v3 >> 8);
  }

  return ~v3;
}

uint64_t lzma_crc64(unint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = ~a3;
  if (a2 >= 5)
  {
    if ((a1 & 3) != 0)
    {
      unint64_t v4 = a1 + 1;
      unint64_t v5 = (unsigned __int8 *)a1;
      do
      {
        unsigned int v6 = *v5++;
        unint64_t v3 = lzma_crc64_table[v3 ^ (unint64_t)v6] ^ (v3 >> 8);
        --a2;
      }

      while ((v4++ & 3) != 0);
      a1 = a1 - (a1 & 3) + 4;
    }

    int64_t v8 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    a2 &= 3u;
    if (v8 >= 1)
    {
      unint64_t v9 = a1 + v8;
      do
      {
        int v10 = *(_DWORD *)a1;
        a1 += 4LL;
      }

      while (a1 < v9);
    }
  }

  for (; a2; --a2)
  {
    unsigned int v11 = *(unsigned __int8 *)a1++;
    unint64_t v3 = lzma_crc64_table[v3 ^ (unint64_t)v11] ^ (v3 >> 8);
  }

  return ~v3;
}

uint64_t lzma_lzip_decoder_init(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  *(void *)(a1 + 16) = lzma_lzip_decoder_init;
  if (a4 > 0x3F) {
    return 8LL;
  }
  int64_t v8 = *(char **)a1;
  if (!*(void *)a1)
  {
    int64_t v8 = (char *)lzma_alloc(0x118uLL, a2);
    if (!v8) {
      return 5LL;
    }
    *(void *)a1 = v8;
    *(void *)(a1 + 24) = lzip_decode;
    *(void *)(a1 + 32) = lzip_decoder_end;
    *(void *)(a1 + 48) = lzip_decoder_get_check;
    *(void *)(a1 + 56) = lzip_decoder_memconfig;
    *((void *)v8 + 25) = 0LL;
    *((void *)v8 + 26) = -1LL;
    *(_OWORD *)(v8 + 216) = 0u;
    *(_OWORD *)(v8 + 232) = 0u;
    *(_OWORD *)(v8 + 248) = 0u;
    *(_OWORD *)(v8 + 264) = 0u;
  }

  uint64_t v9 = 0LL;
  if (a3 <= 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = a3;
  }
  *((void *)v8 + 4) = v10;
  *((void *)v8 + 5) = 0x8000LL;
  v8[48] = (a4 & 4) != 0;
  v8[49] = (a4 & 0x10) != 0;
  *(_DWORD *)int64_t v8 = 0;
  v8[50] = (a4 & 8) != 0;
  v8[51] = 1;
  *((void *)v8 + 7) = 0LL;
  return v9;
}

uint64_t lzip_decode( int *a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  v45[6] = *MEMORY[0x1895F89C0];
  int v14 = *a1;
  uint64_t v41 = (uint64_t)(a1 + 16);
  uint64_t v15 = (uint64_t *)(a1 + 14);
  __int128 v42 = (unsigned int *)(a1 + 22);
  uint64_t v39 = (uint64_t)(a1 + 50);
  __n128 v16 = (__n128)xmmword_18116F4B0;
  while (2)
  {
    switch(v14)
    {
      case 0:
        uint64_t v17 = *v15;
        uint64_t v18 = 0LL;
        uint64_t v19 = *a4;
        unint64_t v20 = a5 - *a4;
        if (a5 < *a4) {
          unint64_t v20 = 0LL;
        }
        while (2)
        {
          if (v20 == v18) {
            return a9 == 3 && *((_BYTE *)a1 + 51) == 0;
          }
          if (*(unsigned __int8 *)(a3 + v19 + v18) == aLzip[v17 + v18])
          {
            *a4 = v19 + v18 + 1;
            *uint64_t v15 = v17 + v18++ + 1;
            if (v17 + v18 == 4)
            {
LABEL_9:
              *((void *)a1 + 7) = 0LL;
              a1[2] = 0;
              *((_OWORD *)a1 + 1) = xmmword_18116F4B0;
              *a1 = 1;
              goto LABEL_10;
            }

            continue;
          }

          break;
        }

        if (*((_BYTE *)a1 + 51)) {
          return 7LL;
        }
        else {
          return 1LL;
        }
      case 1:
LABEL_10:
        uint64_t v21 = *a4;
        if (*a4 >= a5) {
          return 0LL;
        }
        unint64_t v22 = v21 + 1;
        *a4 = v21 + 1;
        unsigned int v23 = *(unsigned __int8 *)(a3 + v21);
        a1[1] = v23;
        if (v23 > 1) {
          return 8LL;
        }
        ++*((void *)a1 + 3);
        *a1 = 2;
        if (!*((_BYTE *)a1 + 48))
        {
LABEL_15:
          if (v22 >= a5) {
            return 0LL;
          }
          *a4 = v22 + 1;
          unsigned int v24 = *(unsigned __int8 *)(a3 + v22);
          ++*((void *)a1 + 3);
          int v25 = v24 & 0x1F;
          if (v24 >= 0x20 && v25 == 12) {
            return 9LL;
          }
          a1[22] = (1 << v25) - (v24 >> 5 << (v25 - 4));
          *((void *)a1 + 12) = 0LL;
          *(void *)(a1 + 27) = 3LL;
          a1[29] = 2;
          unint64_t v27 = lzma_lzma_decoder_memusage(v42) + 0x8000;
          *((void *)a1 + 5) = v27;
          *a1 = 3;
LABEL_23:
          if (v27 > *((void *)a1 + 4)) {
            return 6LL;
          }
          v45[0] = 0x4000000000000001LL;
          v45[1] = lzma_lzma_decoder_init;
          v45[2] = v42;
          memset(&v45[3], 0, 24);
          uint64_t filter_init = lzma_next_filter_init(v39, a2, v45, v16);
          if ((_DWORD)filter_init) {
            return filter_init;
          }
          a1[2] = 0;
          *a1 = 4;
LABEL_26:
          uint64_t v29 = *a4;
          uint64_t v30 = *a7;
          uint64_t v37 = (*((uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t, uint64_t, uint64_t *, uint64_t, int))a1
                 + 28))( *((void *)a1 + 25),  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9);
          uint64_t v31 = *a7;
          unint64_t v32 = *a7 - v30;
          uint64_t v33 = *a4 - v29 + *((void *)a1 + 3);
          *((void *)a1 + 2) += v32;
          *((void *)a1 + 3) = v33;
          if (!*((_BYTE *)a1 + 49) && v31 != v30) {
            a1[2] = lzma_crc32((char *)(a6 + v30), v32, a1[2]);
          }
          if ((_DWORD)v37 != 1) {
            return v37;
          }
          *a1 = 5;
LABEL_31:
          if (a1[1]) {
            unint64_t v34 = 20LL;
          }
          else {
            unint64_t v34 = 12LL;
          }
          lzma_bufcpy(a3, a4, a5, v41, v15, v34);
          if (*((void *)a1 + 7) < v34) {
            return 0LL;
          }
          *((void *)a1 + 7) = 0LL;
          unint64_t v35 = *((void *)a1 + 3) + v34;
          *((void *)a1 + 3) = v35;
          if (!*((_BYTE *)a1 + 49) && a1[2] != a1[16]
            || *((void *)a1 + 2) != *(void *)(a1 + 17)
            || a1[1] && v35 != *(void *)(a1 + 19))
          {
            return 9LL;
          }

          if (!*((_BYTE *)a1 + 50)) {
            return 1LL;
          }
          int v14 = 0;
          *((_BYTE *)a1 + 51) = 0;
          *a1 = 0;
          continue;
        }

        return 4LL;
      case 2:
        unint64_t v22 = *a4;
        goto LABEL_15;
      case 3:
        unint64_t v27 = *((void *)a1 + 5);
        goto LABEL_23;
      case 4:
        goto LABEL_26;
      case 5:
        goto LABEL_31;
      default:
        return 11LL;
    }
  }

void lzip_decoder_end(void *a1, uint64_t a2)
{
}

uint64_t lzip_decoder_get_check()
{
  return 1LL;
}

uint64_t lzip_decoder_memconfig(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  *a2 = *(void *)(a1 + 40);
  *a3 = *(void *)(a1 + 32);
  if (!a4) {
    return 0LL;
  }
  if (*(void *)(a1 + 40) > a4) {
    return 6LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 32) = a4;
  return result;
}

uint64_t lzma_lzip_decoder(void *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6 = lzma_strm_init(a1);
  if (!(_DWORD)v6)
  {
    uint64_t v6 = lzma_lzip_decoder_init(a1[7], a1[6], a2, a3);
    if ((_DWORD)v6)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v7 = a1[7];
      *(_BYTE *)(v7 + 96) = 1;
      *(_BYTE *)(v7 + 99) = 1;
    }
  }

  return v6;
}

unint64_t lzma_lz_encoder_memusage(uint64_t *a1)
{
  uint64_t v4 = 0LL;
  __int128 v3 = 0u;
  memset(v2, 0, sizeof(v2));
  else {
    return DWORD2(v2[0]) + 4 * (v4 + (unint64_t)HIDWORD(v3)) + 240;
  }
}

uint64_t lz_encoder_prepare(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3 = a3[1];
  if (v3 - 1610612737 < 0xFFFFFFFFA0000FFFLL) {
    return 1LL;
  }
  unint64_t v6 = a3[3];
  unint64_t v5 = a3[4];
  if (v5 > v6) {
    return 1LL;
  }
  uint64_t v10 = *a3;
  int v11 = *a3 + v3;
  unint64_t v12 = a3[2] + v6;
  *(_DWORD *)(a1 + 12) = v11;
  *(_DWORD *)(a1 + 16) = v12;
  unint64_t v13 = (v12 + v10) >> 1;
  int v14 = *(_DWORD *)(a1 + 8);
  int v15 = (v3 >> 1) + v11 + v12 + v13 + 0x80000;
  *(_DWORD *)(a1 + 8) = v15;
  __n128 v16 = *(void **)a1;
  if (v16 && v14 != v15)
  {
    lzma_free(v16, a2);
    *(void *)a1 = 0LL;
    unint64_t v6 = a3[3];
    unint64_t v5 = a3[4];
    unint64_t v3 = a3[1];
  }

  *(_DWORD *)(a1 + 96) = v5;
  *(_DWORD *)(a1 + 100) = v6;
  int v17 = v3 + 1;
  *(_DWORD *)(a1 + 84) = v3 + 1;
  int v18 = *((_DWORD *)a3 + 10);
  uint64_t result = 1LL;
  if (v18 <= 17)
  {
    if (v18 == 3)
    {
      uint64_t v19 = lzma_mf_hc3_skip;
      unint64_t v20 = lzma_mf_hc3_find;
    }

    else
    {
      if (v18 != 4) {
        return result;
      }
      uint64_t v19 = lzma_mf_hc4_skip;
      unint64_t v20 = lzma_mf_hc4_find;
    }
  }

  else
  {
    switch(v18)
    {
      case 18:
        BOOL v21 = 0;
        *(void *)(a1 + 48) = lzma_mf_bt2_find;
        *(void *)(a1 + 56) = lzma_mf_bt2_skip;
        unsigned int v22 = 0xFFFF;
        *(_DWORD *)(a1 + 88) = 0xFFFF;
        goto LABEL_28;
      case 19:
        uint64_t v19 = lzma_mf_bt3_skip;
        unint64_t v20 = lzma_mf_bt3_find;
        break;
      case 20:
        uint64_t v19 = lzma_mf_bt4_skip;
        unint64_t v20 = lzma_mf_bt4_find;
        break;
      default:
        return result;
    }
  }

  *(void *)(a1 + 48) = v20;
  *(void *)(a1 + 56) = v19;
  unsigned int v23 = v18 & 0xF;
  BOOL v21 = (v18 & 0x10) == 0;
  unsigned int v24 = (v3 - 1) | ((v3 - 1) >> 1) | ((((_DWORD)v3 - 1) | ((v3 - 1) >> 1)) >> 2);
  unsigned int v22 = ((v24 | (v24 >> 4)) >> 1) | ((v24 | (v24 >> 4)) >> 9) | 0xFFFF;
  int v25 = v22 >> 1;
  if (v23 == 3) {
    int v25 = 0xFFFFFF;
  }
  if (v22 > 0x1000000) {
    unsigned int v22 = v25;
  }
  *(_DWORD *)(a1 + 88) = v22;
  if (v23 > 2)
  {
    if (v23 == 3) {
      int v26 = 1025;
    }
    else {
      int v26 = 66561;
    }
    unsigned int v27 = v22 + v26;
    goto LABEL_29;
  }

uint64_t lzma_lz_encoder_init( void *a1, void *a2, void *a3, uint64_t (*a4)(void *, void *, void, void, uint64_t *))
{
  uint64_t v7 = (void *)*a1;
  if (!*a1)
  {
    uint64_t v9 = lzma_alloc(0xF0uLL, (uint64_t)a2);
    if (!v9) {
      return 5LL;
    }
    uint64_t v7 = v9;
    *a1 = v9;
    a1[3] = lz_encode;
    a1[4] = lz_encoder_end;
    a1[8] = lz_encoder_update;
    a1[9] = lz_encoder_set_out_limit;
    v9[5] = 0LL;
    *((_DWORD *)v9 + 12) = 0;
    *((_DWORD *)v9 + 37) = 0;
    *((_DWORD *)v9 + 38) = 0;
    v9[1] = 0LL;
    v9[2] = 0LL;
    *uint64_t v9 = 0LL;
    v9[13] = 0LL;
    v9[14] = 0LL;
    v9[20] = 0LL;
    v9[21] = -1LL;
    *((_OWORD *)v9 + 11) = 0u;
    *((_OWORD *)v9 + 12) = 0u;
    *((_OWORD *)v9 + 13) = 0u;
    *((_OWORD *)v9 + 14) = 0u;
  }

  uint64_t result = a4(v7, a2, *a3, a3[2], v21);
  if ((_DWORD)result) {
    return result;
  }
  if (!v7[5])
  {
    int v11 = (char *)lzma_alloc((*((_DWORD *)v7 + 12) + 4), (uint64_t)a2);
    v7[5] = v11;
    if (!v11) {
      return 5LL;
    }
    *(_DWORD *)&v11[*((unsigned int *)v7 + 12)] = 0;
  }

  *((_DWORD *)v7 + 15) = *((_DWORD *)v7 + 31);
  _BYTE v7[8] = 0LL;
  v7[9] = 0LL;
  *((_DWORD *)v7 + 20) = 0;
  unint64_t v12 = (void *)v7[13];
  uint64_t v13 = *((unsigned int *)v7 + 37);
  if (!v12)
  {
    v7[13] = lzma_alloc_zero(4 * v13, a2);
    int v15 = lzma_alloc(4LL * *((unsigned int *)v7 + 38), (uint64_t)a2);
    v7[14] = v15;
    __n128 v16 = (void *)v7[13];
    if (v16 && v15) {
      goto LABEL_14;
    }
    lzma_free(v16, (uint64_t)a2);
    v7[13] = 0LL;
    lzma_free((void *)v7[14], (uint64_t)a2);
    v7[14] = 0LL;
    return 5LL;
  }

  bzero(v12, 4 * v13);
LABEL_14:
  *((_DWORD *)v7 + 30) = 0;
  uint64_t v17 = v22;
  if (v22)
  {
    uint64_t v18 = v23;
    if (v23)
    {
      unsigned int v19 = *((_DWORD *)v7 + 12);
      if (v23 >= v19) {
        size_t v20 = v19;
      }
      else {
        size_t v20 = v23;
      }
      *((_DWORD *)v7 + 19) = v20;
      memcpy((void *)v7[5], (const void *)(v17 + v18 - v20), v20);
      *((_DWORD *)v7 + 36) = 1;
      v14.n128_f64[0] = ((double (*)(void *, void))v7[12])(v7 + 5, *((unsigned int *)v7 + 19));
    }
  }

  *((_DWORD *)v7 + 36) = 0;
  return lzma_next_filter_init((uint64_t)(v7 + 20), (uint64_t)a2, a3 + 3, v14);
}

uint64_t lz_encode( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, unint64_t *a7, unint64_t a8, int a9)
{
  uint64_t v16 = a1 + 40;
  while (*a7 < a8 && (a9 || *a4 < a5))
  {
    if (!*(_DWORD *)(a1 + 144))
    {
      unsigned int v17 = *(_DWORD *)(a1 + 64);
      if (v17 >= *(_DWORD *)(a1 + 72))
      {
        if (v17 >= *(_DWORD *)(a1 + 48) - *(_DWORD *)(a1 + 56))
        {
          uint64_t v19 = (v17 - *(_DWORD *)(a1 + 52)) & 0xFFFFFFF0;
          memmove( *(void **)(a1 + 40),  (const void *)(*(void *)(a1 + 40) + v19),  (*(_DWORD *)(a1 + 76) - v19));
          int v20 = *(_DWORD *)(a1 + 64) - v19;
          *(_DWORD *)(a1 + 60) += v19;
          *(_DWORD *)(a1 + 64) = v20;
          unsigned int v18 = *(_DWORD *)(a1 + 76) - v19;
          *(_DWORD *)(a1 + 72) -= v19;
          *(_DWORD *)(a1 + 76) = v18;
        }

        else
        {
          unsigned int v18 = *(_DWORD *)(a1 + 76);
        }

        uint64_t v33 = v18;
        BOOL v21 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t, void, uint64_t *, void, int))(a1 + 184);
        if (v21)
        {
          uint64_t v22 = v21(*(void *)(a1 + 160), a2, a3, a4, a5, *(void *)(a1 + 40), &v33, *(unsigned int *)(a1 + 48), a9);
        }

        else
        {
          lzma_bufcpy(a3, a4, a5, *(void *)(a1 + 40), &v33, *(unsigned int *)(a1 + 48));
          if (a9) {
            uint64_t v22 = *a4 == a5;
          }
          else {
            uint64_t v22 = 0LL;
          }
        }

        uint64_t v23 = v33;
        *(_DWORD *)(a1 + 76) = v33;
        *(_DWORD *)(*(void *)(a1 + 40) + v23) = 0;
        if ((_DWORD)v22 == 1)
        {
          uint64_t v22 = 0LL;
          *(_DWORD *)(a1 + 144) = a9;
          unsigned int v24 = *(_DWORD *)(a1 + 76);
          goto LABEL_19;
        }

        unsigned int v25 = *(_DWORD *)(a1 + 76);
        unsigned int v26 = *(_DWORD *)(a1 + 56);
        BOOL v27 = v25 >= v26;
        unsigned int v24 = v25 - v26;
        if (v24 != 0 && v27) {
LABEL_19:
        }
          *(_DWORD *)(a1 + 72) = v24;
        int v28 = *(_DWORD *)(a1 + 80);
        if (v28)
        {
          unsigned int v29 = *(_DWORD *)(a1 + 64);
          if (v29 < *(_DWORD *)(a1 + 72))
          {
            *(_DWORD *)(a1 + 80) = 0;
            *(_DWORD *)(a1 + 64) = v29 - v28;
            (*(void (**)(uint64_t))(a1 + 96))(v16);
          }
        }

        if ((_DWORD)v22) {
          return v22;
        }
      }
    }

    uint64_t v30 = (*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t *, unint64_t))(a1 + 8))( *(void *)a1,  v16,  a6,  a7,  a8);
    if ((_DWORD)v30)
    {
      uint64_t v22 = v30;
      *(_DWORD *)(a1 + 144) = 0;
      return v22;
    }
  }

  return 0LL;
}

void lz_encoder_end(void **a1, uint64_t a2)
{
  uint64_t v4 = (void (*)(void *, uint64_t))a1[2];
  unint64_t v5 = *a1;
  if (v4) {
    v4(v5, a2);
  }
  else {
    lzma_free(v5, a2);
  }
  lzma_free(a1, a2);
}

uint64_t lz_encoder_update(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (uint64_t (*)(void, uint64_t))a1[3];
  if (!v4) {
    return 11LL;
  }
  uint64_t result = v4(*a1, a4);
  if (!(_DWORD)result) {
    return lzma_next_filter_update((uint64_t)(a1 + 20), a2, (void *)(a4 + 16));
  }
  return result;
}

uint64_t lz_encoder_set_out_limit(void *a1)
{
  if (a1[23]) {
    return 8LL;
  }
  uint64_t v2 = (uint64_t (*)(void))a1[4];
  if (!v2) {
    return 8LL;
  }
  else {
    return v2(*a1);
  }
}

uint64_t lzma_mf_is_supported(unsigned int a1)
{
  if (a1 > 0x14) {
    return 0LL;
  }
  char v1 = a1;
  uint64_t result = 1LL;
  if (((1 << v1) & 0x1C0018) == 0) {
    return 0LL;
  }
  return result;
}

uint64_t lzma_mf_find(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 48))(a1, a3);
  if (v6)
  {
    uint64_t v7 = *(unsigned int *)(a3 + 8LL * (v6 - 1));
    if ((_DWORD)v7 == *(_DWORD *)(a1 + 96))
    {
      uint64_t v8 = *(unsigned int *)(a1 + 24);
      int v9 = *(_DWORD *)(a1 + 36) - v8;
      unsigned int v10 = *(_DWORD *)(a1 + 100);
      if (v9 + 1 < v10) {
        uint64_t v11 = (v9 + 1);
      }
      else {
        uint64_t v11 = v10;
      }
      if (v7 >= v11)
      {
LABEL_10:
        uint64_t v7 = v11;
      }

      else
      {
        uint64_t v12 = *(void *)a1 + v8 - 1;
        while (1)
        {
          int v13 = *(_DWORD *)(v12 + v7)
              - *(_DWORD *)(~(unint64_t)*(unsigned int *)(a3 + 8LL * (v6 - 1) + 4)
                          + v12
                          + v7);
          if (v13) {
            break;
          }
          LODWORD(v7) = v7 + 4;
        }

        if (*(_WORD *)(v12 + v7) == *(_WORD *)(~(unint64_t)*(unsigned int *)(a3
                                                                                                 + 8LL
                                                                                                 * (v6 - 1)
                                                                                                 + 4)
                                                            + v12
                                                            + v7))
        {
          LODWORD(v7) = v7 + 2;
          char v15 = BYTE2(v13);
        }

        else
        {
          char v15 = *(_BYTE *)(v12 + v7)
              - *(_BYTE *)(~(unint64_t)*(unsigned int *)(a3 + 8LL * (v6 - 1) + 4)
                         + v12
                         + v7);
        }

        if (!v15) {
          LODWORD(v7) = v7 + 1;
        }
        else {
          uint64_t v7 = v7;
        }
      }
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  *a2 = v6;
  ++*(_DWORD *)(a1 + 28);
  return v7;
}

uint64_t lzma_mf_hc3_find(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  uint64_t v5 = (*(_DWORD *)(a1 + 36) - v4);
  uint64_t v6 = *(unsigned int *)(a1 + 96);
  if (v6 <= v5 || (uint64_t v6 = v5, v5 > 2))
  {
    uint64_t v8 = (unsigned __int8 *)(*(void *)a1 + v4);
    int v9 = *(_DWORD *)(a1 + 20) + v4;
    int v10 = lzma_crc32_table[*v8] ^ v8[1];
    unsigned int v11 = v10 & 0x3FF;
    unsigned int v12 = (v10 ^ (v8[2] << 8)) & *(_DWORD *)(a1 + 88);
    uint64_t v13 = *(void *)(a1 + 64);
    unsigned int v14 = v9 - *(_DWORD *)(v13 + 4LL * (v10 & 0x3FF));
    v12 += 1024;
    int v15 = *(_DWORD *)(v13 + 4LL * v12);
    *(_DWORD *)(v13 + 4LL * v11) = v9;
    *(_DWORD *)(v13 + 4LL * v12) = v9;
    unsigned int v16 = *(_DWORD *)(a1 + 84);
    if (v14 < v16)
    {
      unsigned int v17 = &v8[-v14];
      if (*v17 == *v8)
      {
        if (v6 < 3)
        {
LABEL_10:
          *a2 = v6;
          a2[1] = v14 - 1;
        }

        else
        {
          unsigned int v18 = 2;
          while (1)
          {
            int v19 = *(_DWORD *)&v17[v18] - *(_DWORD *)&v8[v18];
            if (v19) {
              break;
            }
            v18 += 4;
          }

          unsigned int v23 = v18 + 2;
          if ((_WORD)v19)
          {
            unsigned int v23 = v18;
            char v24 = v19;
          }

          else
          {
            char v24 = BYTE2(v19);
          }

          unsigned int v25 = v23 | (v24 == 0);
          else {
            unsigned int v21 = v25;
          }
          *a2 = v21;
          a2[1] = v14 - 1;
          if (v6 > v25)
          {
            uint64_t v20 = 1LL;
            goto LABEL_13;
          }
        }

        *(_DWORD *)(*(void *)(a1 + 72) + 4LL * *(unsigned int *)(a1 + 80)) = v15;
        move_pos(a1);
        return 1LL;
      }
    }

    uint64_t v20 = 0LL;
    unsigned int v21 = 2;
LABEL_13:
    unint64_t v7 = (unint64_t)((char *)hc_find_func( v6,  v9,  v8,  v15,  *(_DWORD *)(a1 + 92),  *(void *)(a1 + 72),  *(_DWORD *)(a1 + 80),  v16,  &a2[2 * v20],  v21)
                          - (char *)a2) >> 3;
    move_pos(a1);
    return v7;
  }

  unint64_t v7 = 0LL;
  *(_DWORD *)(a1 + 24) = v4 + 1;
  ++*(_DWORD *)(a1 + 40);
  return v7;
}

uint64_t move_pos(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 80);
  if (v1 + 1 == *(_DWORD *)(result + 84)) {
    int v2 = 0;
  }
  else {
    int v2 = v1 + 1;
  }
  *(_DWORD *)(result + 80) = v2;
  int v3 = *(_DWORD *)(result + 20);
  int v4 = *(_DWORD *)(result + 24) + 1;
  *(_DWORD *)(result + 24) = v4;
  if (v3 + v4 == -1) {
    return normalize(result);
  }
  return result;
}

_DWORD *hc_find_func( uint64_t a1, int a2, unsigned __int8 *a3, int a4, int a5, uint64_t a6, unsigned int a7, unsigned int a8, _DWORD *a9, unsigned int a10)
{
  uint64_t result = a9;
  *(_DWORD *)(a6 + 4LL * a7) = a4;
  if (a5)
  {
    unsigned int v12 = a2 - a4;
    if (a2 - a4 < a8)
    {
      uint64_t v13 = a10;
      do
      {
        if (a7 >= v12) {
          unsigned int v14 = 0;
        }
        else {
          unsigned int v14 = a8;
        }
        int v15 = *(_DWORD *)(a6 + 4LL * (a7 - v12 + v14));
        unsigned int v16 = &a3[-v12];
        uint64_t v17 = a1;
        if (a1 >= 2)
        {
          LODWORD(v17) = 1;
          while (1)
          {
            int v18 = *(_DWORD *)&v16[v17] - *(_DWORD *)&a3[v17];
            if (v18) {
              break;
            }
            LODWORD(v17) = v17 + 4;
            if (v17 >= a1)
            {
              uint64_t v17 = a1;
              goto LABEL_22;
            }
          }

          if (*(_WORD *)&v16[v17] == *(_WORD *)&a3[v17])
          {
            LODWORD(v17) = v17 + 2;
            char v19 = BYTE2(v18);
          }

          else
          {
            char v19 = v16[v17] - a3[v17];
          }

          if (!v19) {
            LODWORD(v17) = v17 + 1;
          }
          else {
            uint64_t v17 = v17;
          }
        }

LABEL_22:
        if (v13 < v17)
        {
          *uint64_t result = v17;
          result[1] = v12 - 1;
          result += 2;
          if ((_DWORD)v17 == (_DWORD)a1) {
            return result;
          }
        }

        else
        {
LABEL_25:
          uint64_t v17 = v13;
        }

        if (!--a5) {
          break;
        }
        unsigned int v12 = a2 - v15;
        uint64_t v13 = v17;
      }

      while (a2 - v15 < a8);
    }
  }

  return result;
}

    if (a10 >= v21) {
      goto LABEL_25;
    }
    *uint64_t result = v21;
    result[1] = v14 - 1;
    result += 2;
    if (v21 == a1) {
      break;
    }
    a10 = v21;
LABEL_25:
    if (*(unsigned __int8 *)(v20 + v21) >= *(unsigned __int8 *)(a3 + v21))
    {
      *uint64_t v13 = a4;
      uint64_t v13 = v19;
      unsigned int v16 = v21;
    }

    else
    {
      *unsigned int v12 = a4;
      unsigned int v12 = v19 + 1;
      int v15 = v21;
      ++v19;
    }

    if (--a5)
    {
      a4 = *v19;
      unsigned int v14 = a2 - *v19;
      if (v14 < a8) {
        continue;
      }
    }

    goto LABEL_30;
  }

  *unsigned int v12 = *v19;
  *uint64_t v13 = v19[1];
  return result;
}

        if (v18 >= v8)
        {
          *a3 = v13;
          *a4 = v18;
          char v32 = v18 - 1;
          if (v18 == 1) {
            return result;
          }
          goto LABEL_51;
        }

        if (v18 > v14)
        {
          int v15 = v13;
          unsigned int v14 = v18;
        }
      }

      ++v13;
    }

    while (v13 != 4);
    if (v9 >= v8)
    {
      *a3 = *(_DWORD *)(v7 + 8LL * (v38 - 1) + 736) + 4;
      *a4 = v9;
      char v32 = v9 - 1;
      if (v9 == 1) {
        return result;
      }
      goto LABEL_51;
    }

    if (v9 < 2)
    {
      BOOL v27 = 0;
    }

    else
    {
      unsigned int v26 = v38;
      BOOL v27 = *(_DWORD *)(v7 + 8LL * (v38 - 1) + 736);
      if (v38 >= 2)
      {
        int v28 = (unsigned int *)(v7 + 8LL * v38 + 720);
        do
        {
          unsigned int v29 = *(v28 - 1);
          if (v9 != v29 + 1) {
            break;
          }
          uint64_t v30 = *v28;
          if (*v28 >= v27 >> 7) {
            break;
          }
          v28 -= 2;
          int v38 = --v26;
          BOOL v27 = v30;
          int v9 = v29;
        }

        while (v26 > 1);
      }

      if (v27 > 0x7F && v9 == 2) {
        int v9 = 1;
      }
    }

    if (v14 >= 2 && (v14 + 1 >= v9 || v14 + 2 >= v9 && v27 > 0x200 || v14 + 3 >= v9 && v27 > 0x8000))
    {
      *a3 = v15;
      *a4 = v14;
      char v32 = v14 - 1;
LABEL_51:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(a2, v32);
      *(_DWORD *)(a2 + 28) += v32;
      return result;
    }

    if (v12 >= 3)
    {
      LODWORD(v33) = v9 - 1;
      if (v9 > 1)
      {
        uint64_t result = lzma_mf_find(a2, (_DWORD *)(v7 + 2924), v7 + 732);
        *(_DWORD *)(v7 + 2928) = result;
        unint64_t v34 = *(_DWORD *)(v7 + 8LL * (*(_DWORD *)(v7 + 2924) - 1) + 736);
        if (result < v9 || v34 >= v27)
        {
          unint64_t v35 = (_DWORD)result == v9 + 1;
          if (v27 < v34 >> 7) {
            unint64_t v35 = 0;
          }
          if (result <= v9 + 1 && !v35 && (v9 < 3 || (int)result + 1 < v9 || v27 >> 7 <= v34))
          {
LABEL_64:
            uint64_t v36 = 0LL;
            else {
              uint64_t v33 = v33;
            }
            uint64_t v37 = v7 + 716;
            while (1)
            {
              uint64_t result = memcmp(v16, &v16[-*(unsigned int *)(v37 + v36) - 1], v33);
              if (!(_DWORD)result) {
                break;
              }
              v36 += 4LL;
              if (v36 == 16)
              {
                *a3 = v27 + 4;
                *a4 = v9;
                char v32 = v9 - 2;
                if (v9 != 2) {
                  goto LABEL_51;
                }
                return result;
              }
            }
          }
        }
      }
    }
  }

  *a3 = -1;
  *a4 = 1;
  return result;
}

uint64_t lzma_mf_hc3_skip(uint64_t result, int a2)
{
  uint64_t v3 = result;
  do
  {
    uint64_t v4 = *(unsigned int *)(v3 + 24);
    if ((*(_DWORD *)(v3 + 36) - v4) > 2)
    {
      uint64_t v5 = (unsigned __int8 *)(*(void *)v3 + v4);
      int v6 = *(_DWORD *)(v3 + 20) + v4;
      int v7 = lzma_crc32_table[*v5] ^ v5[1];
      unsigned int v8 = v7 & 0x3FF;
      LODWORD(v5) = ((v7 ^ (v5[2] << 8)) & *(_DWORD *)(v3 + 88)) + 1024;
      uint64_t v9 = *(void *)(v3 + 64);
      uint64_t v10 = *(void *)(v3 + 72);
      int v11 = *(_DWORD *)(v9 + 4LL * v5);
      *(_DWORD *)(v9 + 4LL * v8) = v6;
      *(_DWORD *)(v9 + 4LL * v5) = v6;
      *(_DWORD *)(v10 + 4LL * *(unsigned int *)(v3 + 80)) = v11;
      uint64_t result = move_pos(v3);
    }

    else
    {
      *(_DWORD *)(v3 + 24) = v4 + 1;
      ++*(_DWORD *)(v3 + 40);
    }

    --a2;
  }

  while (a2);
  return result;
}

unint64_t lzma_mf_hc4_find(uint64_t a1, char *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  uint64_t v5 = (*(_DWORD *)(a1 + 36) - v4);
  uint64_t v6 = *(unsigned int *)(a1 + 96);
  if (v6 <= v5 || (uint64_t v6 = v5, v5 > 3))
  {
    unsigned int v8 = (unsigned __int8 *)(*(void *)a1 + v4);
    int v9 = *(_DWORD *)(a1 + 20) + v4;
    int v10 = lzma_crc32_table[*v8] ^ v8[1];
    unsigned int v11 = v10 & 0x3FF;
    int v12 = v10 ^ (v8[2] << 8);
    uint64_t v13 = *(void *)(a1 + 64);
    int v14 = *(_DWORD *)(v13 + 4LL * v11);
    unsigned int v15 = v9 - v14;
    unsigned int v16 = (unsigned __int16)v12 + 1024;
    int v17 = *(_DWORD *)(v13 + 4LL * v16);
    unsigned int v18 = v9 - v17;
    unsigned int v19 = ((v12 ^ (32 * lzma_crc32_table[v8[3]])) & *(_DWORD *)(a1 + 88)) + 66560;
    int v20 = *(_DWORD *)(v13 + 4LL * v19);
    *(_DWORD *)(v13 + 4LL * v11) = v9;
    *(_DWORD *)(v13 + 4LL * v16) = v9;
    *(_DWORD *)(v13 + 4LL * v19) = v9;
    unsigned int v21 = *(_DWORD *)(a1 + 84);
    if (v9 - v14 < v21 && v8[-v15] == *v8)
    {
      char v22 = 0;
      unsigned int v23 = 2;
      *(_DWORD *)a2 = 2;
      *((_DWORD *)a2 + 1) = v15 - 1;
      unsigned int v24 = 1;
    }

    else
    {
      unsigned int v24 = 0;
      char v22 = 1;
      unsigned int v23 = 1;
    }

    BOOL v25 = v17 == v14 || v18 >= v21;
    if (v25 || v8[-v18] != *v8)
    {
      if ((v22 & 1) != 0)
      {
        LODWORD(v7) = 0;
LABEL_33:
        if (v23 <= 3) {
          unsigned int v23 = 3;
        }
        unint64_t v7 = (unint64_t)((char *)hc_find_func( v6,  v9,  v8,  v20,  *(_DWORD *)(a1 + 92),  *(void *)(a1 + 72),  *(_DWORD *)(a1 + 80),  v21,  &a2[8 * v7],  v23)
                              - a2) >> 3;
        goto LABEL_36;
      }

      uint64_t v26 = -(uint64_t)v15;
      unint64_t v7 = 1LL;
    }

    else
    {
      uint64_t v26 = -(uint64_t)v18;
      unint64_t v7 = v24 + 1;
      *(_DWORD *)&a2[8 * v24 + 4] = v18 - 1;
      unsigned int v23 = 3;
    }

    if (v23 >= v6)
    {
LABEL_21:
      *(_DWORD *)&a2[8 * (v7 - 1)] = v6;
    }

    else
    {
      BOOL v27 = &v8[v26];
      while (1)
      {
        int v28 = *(_DWORD *)&v27[v23] - *(_DWORD *)&v8[v23];
        if (v28) {
          break;
        }
        v23 += 4;
      }

      if (*(_WORD *)&v27[v23] == *(_WORD *)&v8[v23])
      {
        v23 += 2;
        char v29 = BYTE2(v28);
      }

      else
      {
        char v29 = v27[v23] - v8[v23];
      }

      if (v29) {
        unsigned int v30 = v23;
      }
      else {
        unsigned int v30 = v23 + 1;
      }
      else {
        unsigned int v23 = v30;
      }
      *(_DWORD *)&a2[8 * (v7 - 1)] = v23;
    }

    *(_DWORD *)(*(void *)(a1 + 72) + 4LL * *(unsigned int *)(a1 + 80)) = v20;
LABEL_36:
    move_pos(a1);
    return v7;
  }

  unint64_t v7 = 0LL;
  *(_DWORD *)(a1 + 24) = v4 + 1;
  ++*(_DWORD *)(a1 + 40);
  return v7;
}

uint64_t lzma_mf_hc4_skip(uint64_t result, int a2)
{
  uint64_t v3 = result;
  do
  {
    uint64_t v4 = *(unsigned int *)(v3 + 24);
    if ((*(_DWORD *)(v3 + 36) - v4) > 3)
    {
      uint64_t v5 = (unsigned __int8 *)(*(void *)v3 + v4);
      int v6 = *(_DWORD *)(v3 + 20) + v4;
      int v7 = lzma_crc32_table[*v5] ^ v5[1];
      unsigned int v8 = v7 & 0x3FF;
      int v9 = v7 ^ (v5[2] << 8);
      LODWORD(v5) = ((v9 ^ (32 * lzma_crc32_table[v5[3]])) & *(_DWORD *)(v3 + 88)) + 66560;
      uint64_t v10 = *(void *)(v3 + 64);
      uint64_t v11 = *(void *)(v3 + 72);
      int v12 = *(_DWORD *)(v10 + 4LL * v5);
      *(_DWORD *)(v10 + 4LL * v8) = v6;
      *(_DWORD *)(v10 + 4LL * ((unsigned __int16)v9 + 1024)) = v6;
      *(_DWORD *)(v10 + 4LL * v5) = v6;
      *(_DWORD *)(v11 + 4LL * *(unsigned int *)(v3 + 80)) = v12;
      uint64_t result = move_pos(v3);
    }

    else
    {
      *(_DWORD *)(v3 + 24) = v4 + 1;
      ++*(_DWORD *)(v3 + 40);
    }

    --a2;
  }

  while (a2);
  return result;
}

unint64_t lzma_mf_bt2_find(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  unsigned int v5 = *(_DWORD *)(a1 + 36) - v4;
  unsigned int v6 = *(_DWORD *)(a1 + 96);
  if (v6 > v5 && (v5 < 2 || (unsigned int v6 = v5, *(_DWORD *)(a1 + 104) == 1)))
  {
    unint64_t v7 = 0LL;
    *(_DWORD *)(a1 + 24) = v4 + 1;
    ++*(_DWORD *)(a1 + 40);
  }

  else
  {
    unsigned int v8 = (unsigned __int16 *)(*(void *)a1 + v4);
    uint64_t v9 = *v8;
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    int v12 = *(_DWORD *)(v11 + 4 * v9);
    int v13 = *(_DWORD *)(a1 + 20) + v4;
    *(_DWORD *)(v11 + 4 * v9) = v13;
    unint64_t v7 = (unint64_t)((char *)bt_find_func( v6,  v13,  (uint64_t)v8,  v12,  *(_DWORD *)(a1 + 92),  v10,  *(_DWORD *)(a1 + 80),  *(_DWORD *)(a1 + 84),  a2,  1u)
                          - (char *)a2) >> 3;
    move_pos(a1);
  }

  return v7;
}

unsigned int *bt_find_func( unsigned int a1, int a2, uint64_t a3, int a4, int a5, uint64_t a6, unsigned int a7, unsigned int a8, unsigned int *a9, unsigned int a10)
{
  uint64_t result = a9;
  int v12 = (_DWORD *)(a6 + 8LL * a7);
  int v13 = v12 + 1;
  if (!a5 || (unsigned int v14 = a2 - a4, a2 - a4 >= a8))
  {
LABEL_30:
    *int v13 = 0;
    *int v12 = 0;
    return result;
  }

  unsigned int v15 = 0;
  unsigned int v16 = 0;
  while (1)
  {
    if (a7 >= v14) {
      unsigned int v18 = 0;
    }
    else {
      unsigned int v18 = a8;
    }
    unsigned int v19 = (_DWORD *)(a6 + 8LL * (a7 - v14 + v18));
    uint64_t v20 = a3 - v14;
    if (v16 >= v15) {
      unsigned int v21 = v15;
    }
    else {
      unsigned int v21 = v16;
    }
    unsigned int v22 = v21 + 1;
    unsigned int v21 = a1;
    if (v22 < a1)
    {
      while (1)
      {
        int v23 = *(_DWORD *)(v20 + v22) - *(_DWORD *)(a3 + v22);
        if (v23) {
          break;
        }
        v22 += 4;
        if (v22 >= a1)
        {
          unsigned int v21 = a1;
          goto LABEL_22;
        }
      }

      if (*(_WORD *)(v20 + v22) == *(_WORD *)(a3 + v22))
      {
        v22 += 2;
        LOBYTE(v23) = BYTE2(v23);
      }

      if ((_BYTE)v23) {
        unsigned int v21 = v22;
      }
      else {
        unsigned int v21 = v22 + 1;
      }
      if (v21 >= a1) {
        unsigned int v21 = a1;
      }
    }

uint64_t lzma_mf_bt2_skip(uint64_t a1, int a2)
{
  do
  {
    uint64_t v4 = *(unsigned int *)(a1 + 24);
    unsigned int v5 = *(_DWORD *)(a1 + 36) - v4;
    uint64_t result = *(unsigned int *)(a1 + 96);
    if (result > v5
      && (v5 < 2 || (uint64_t result = (*(_DWORD *)(a1 + 36) - v4), *(_DWORD *)(a1 + 104) == 1)))
    {
      *(_DWORD *)(a1 + 24) = v4 + 1;
      ++*(_DWORD *)(a1 + 40);
    }

    else
    {
      unint64_t v7 = (unsigned __int16 *)(*(void *)a1 + v4);
      uint64_t v8 = *v7;
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v9 = *(void *)(a1 + 72);
      int v11 = *(_DWORD *)(v10 + 4 * v8);
      int v12 = *(_DWORD *)(a1 + 20) + v4;
      *(_DWORD *)(v10 + 4 * v8) = v12;
      bt_skip_func(result, v12, (uint64_t)v7, v11, *(_DWORD *)(a1 + 92), v9, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84));
      uint64_t result = move_pos(a1);
    }

    --a2;
  }

  while (a2);
  return result;
}

uint64_t bt_skip_func( uint64_t result, int a2, uint64_t a3, int a4, int a5, uint64_t a6, unsigned int a7, unsigned int a8)
{
  uint64_t v8 = (_DWORD *)(a6 + 8LL * a7);
  uint64_t v9 = v8 + 1;
  if (a5 && (unsigned int v10 = a2 - a4, a2 - a4 < a8))
  {
    unsigned int v11 = 0;
    unsigned int v12 = 0;
    while (1)
    {
      unsigned int v13 = a7 >= v10 ? 0 : a8;
      unsigned int v14 = (_DWORD *)(a6 + 8LL * (a7 - v10 + v13));
      uint64_t v15 = a3 - v10;
      unsigned int v16 = v12 >= v11 ? v11 : v12;
      unsigned int v17 = *(unsigned __int8 *)(v15 + v16);
      unsigned int v18 = *(unsigned __int8 *)(a3 + v16);
      if (v17 == v18) {
        break;
      }
LABEL_21:
      if (v17 >= v18)
      {
        *uint64_t v9 = a4;
        unsigned int v12 = v16;
        uint64_t v9 = v14;
      }

      else
      {
        *uint64_t v8 = a4;
        uint64_t v8 = v14 + 1;
        unsigned int v11 = v16;
        ++v14;
      }

      if (--a5)
      {
        a4 = *v14;
        unsigned int v10 = a2 - *v14;
        if (v10 < a8) {
          continue;
        }
      }

      goto LABEL_26;
    }

    ++v16;
    while (v16 < result)
    {
      int v19 = *(_DWORD *)(v15 + v16) - *(_DWORD *)(a3 + v16);
      if (v19)
      {
        if (*(_WORD *)(v15 + v16) == *(_WORD *)(a3 + v16))
        {
          v16 += 2;
          LOBYTE(v19) = BYTE2(v19);
        }

        if (!(_BYTE)v19) {
          ++v16;
        }
        if (v16 < result)
        {
          unsigned int v17 = *(unsigned __int8 *)(v15 + v16);
          unsigned int v18 = *(unsigned __int8 *)(a3 + v16);
          goto LABEL_21;
        }

        break;
      }

      v16 += 4;
    }

    *uint64_t v8 = *v14;
    *uint64_t v9 = v14[1];
  }

  else
  {
LABEL_26:
    *uint64_t v9 = 0;
    *uint64_t v8 = 0;
  }

  return result;
}

uint64_t lzma_mf_bt3_find(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  uint64_t v5 = (*(_DWORD *)(a1 + 36) - v4);
  uint64_t v6 = *(unsigned int *)(a1 + 96);
  if (v6 <= v5 || v5 >= 3 && (uint64_t v6 = v5, *(_DWORD *)(a1 + 104) != 1))
  {
    uint64_t v8 = (unsigned __int8 *)(*(void *)a1 + v4);
    int v9 = *(_DWORD *)(a1 + 20) + v4;
    int v10 = lzma_crc32_table[*v8] ^ v8[1];
    unsigned int v11 = v10 & 0x3FF;
    unsigned int v12 = (v10 ^ (v8[2] << 8)) & *(_DWORD *)(a1 + 88);
    uint64_t v13 = *(void *)(a1 + 64);
    unsigned int v14 = v9 - *(_DWORD *)(v13 + 4LL * (v10 & 0x3FF));
    v12 += 1024;
    int v15 = *(_DWORD *)(v13 + 4LL * v12);
    *(_DWORD *)(v13 + 4LL * v11) = v9;
    *(_DWORD *)(v13 + 4LL * v12) = v9;
    unsigned int v16 = *(_DWORD *)(a1 + 84);
    if (v14 < v16)
    {
      unsigned int v17 = &v8[-v14];
      if (*v17 == *v8)
      {
        if (v6 < 3)
        {
LABEL_11:
          *a2 = v6;
          a2[1] = v14 - 1;
        }

        else
        {
          unsigned int v18 = 2;
          while (1)
          {
            int v19 = *(_DWORD *)&v8[v18] - *(_DWORD *)&v17[v18];
            if (v19) {
              break;
            }
            v18 += 4;
          }

          unsigned int v23 = v18 + 2;
          if ((_WORD)v19)
          {
            unsigned int v23 = v18;
            char v24 = v19;
          }

          else
          {
            char v24 = BYTE2(v19);
          }

          unsigned int v25 = v23 | (v24 == 0);
          else {
            unsigned int v21 = v25;
          }
          *a2 = v21;
          a2[1] = v14 - 1;
          if (v6 > v25)
          {
            uint64_t v20 = 1LL;
            goto LABEL_14;
          }
        }

        bt_skip_func(v6, v9, (uint64_t)v8, v15, *(_DWORD *)(a1 + 92), *(void *)(a1 + 72), *(_DWORD *)(a1 + 80), v16);
        move_pos(a1);
        return 1LL;
      }
    }

    uint64_t v20 = 0LL;
    unsigned int v21 = 2;
LABEL_14:
    unint64_t v7 = (unint64_t)((char *)bt_find_func( v6,  v9,  (uint64_t)v8,  v15,  *(_DWORD *)(a1 + 92),  *(void *)(a1 + 72),  *(_DWORD *)(a1 + 80),  v16,  &a2[2 * v20],  v21)
                          - (char *)a2) >> 3;
    move_pos(a1);
    return v7;
  }

  unint64_t v7 = 0LL;
  *(_DWORD *)(a1 + 24) = v4 + 1;
  ++*(_DWORD *)(a1 + 40);
  return v7;
}

uint64_t lzma_mf_bt3_skip(uint64_t a1, int a2)
{
  do
  {
    uint64_t v4 = *(unsigned int *)(a1 + 24);
    unsigned int v5 = *(_DWORD *)(a1 + 36) - v4;
    uint64_t result = *(unsigned int *)(a1 + 96);
    if (result > v5
      && (v5 < 3 || (uint64_t result = (*(_DWORD *)(a1 + 36) - v4), *(_DWORD *)(a1 + 104) == 1)))
    {
      *(_DWORD *)(a1 + 24) = v4 + 1;
      ++*(_DWORD *)(a1 + 40);
    }

    else
    {
      unint64_t v7 = (unsigned __int8 *)(*(void *)a1 + v4);
      int v8 = *(_DWORD *)(a1 + 20) + v4;
      int v9 = lzma_crc32_table[*v7] ^ v7[1];
      unsigned int v10 = v9 & 0x3FF;
      unsigned int v11 = ((v9 ^ (v7[2] << 8)) & *(_DWORD *)(a1 + 88)) + 1024;
      uint64_t v13 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(a1 + 72);
      int v14 = *(_DWORD *)(v13 + 4LL * v11);
      *(_DWORD *)(v13 + 4LL * v10) = v8;
      *(_DWORD *)(v13 + 4LL * v11) = v8;
      bt_skip_func(result, v8, (uint64_t)v7, v14, *(_DWORD *)(a1 + 92), v12, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84));
      uint64_t result = move_pos(a1);
    }

    --a2;
  }

  while (a2);
  return result;
}

unint64_t lzma_mf_bt4_find(uint64_t a1, char *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  uint64_t v5 = (*(_DWORD *)(a1 + 36) - v4);
  uint64_t v6 = *(unsigned int *)(a1 + 96);
  if (v6 <= v5 || v5 >= 4 && (uint64_t v6 = v5, *(_DWORD *)(a1 + 104) != 1))
  {
    int v8 = (unsigned __int8 *)(*(void *)a1 + v4);
    int v9 = *(_DWORD *)(a1 + 20) + v4;
    int v10 = lzma_crc32_table[*v8] ^ v8[1];
    unsigned int v11 = v10 & 0x3FF;
    int v12 = v10 ^ (v8[2] << 8);
    uint64_t v13 = *(void *)(a1 + 64);
    int v14 = *(_DWORD *)(v13 + 4LL * v11);
    unsigned int v15 = v9 - v14;
    unsigned int v16 = (unsigned __int16)v12 + 1024;
    int v17 = *(_DWORD *)(v13 + 4LL * v16);
    unsigned int v18 = v9 - v17;
    unsigned int v19 = ((v12 ^ (32 * lzma_crc32_table[v8[3]])) & *(_DWORD *)(a1 + 88)) + 66560;
    int v20 = *(_DWORD *)(v13 + 4LL * v19);
    *(_DWORD *)(v13 + 4LL * v11) = v9;
    *(_DWORD *)(v13 + 4LL * v16) = v9;
    *(_DWORD *)(v13 + 4LL * v19) = v9;
    unsigned int v21 = *(_DWORD *)(a1 + 84);
    if (v9 - v14 < v21 && v8[-v15] == *v8)
    {
      char v22 = 0;
      unsigned int v23 = 2;
      *(_DWORD *)a2 = 2;
      *((_DWORD *)a2 + 1) = v15 - 1;
      unsigned int v24 = 1;
    }

    else
    {
      unsigned int v24 = 0;
      char v22 = 1;
      unsigned int v23 = 1;
    }

    BOOL v25 = v17 == v14 || v18 >= v21;
    if (v25 || v8[-v18] != *v8)
    {
      if ((v22 & 1) != 0)
      {
        LODWORD(v7) = 0;
        goto LABEL_17;
      }

      uint64_t v26 = -(uint64_t)v15;
      unint64_t v7 = 1LL;
    }

    else
    {
      uint64_t v26 = -(uint64_t)v18;
      unint64_t v7 = v24 + 1;
      *(_DWORD *)&a2[8 * v24 + 4] = v18 - 1;
      unsigned int v23 = 3;
    }

    if (v23 >= v6)
    {
LABEL_25:
      *(_DWORD *)&a2[8 * (v7 - 1)] = v6;
LABEL_26:
      bt_skip_func(v6, v9, (uint64_t)v8, v20, *(_DWORD *)(a1 + 92), *(void *)(a1 + 72), *(_DWORD *)(a1 + 80), v21);
LABEL_27:
      move_pos(a1);
      return v7;
    }

    BOOL v27 = &v8[v26];
    while (1)
    {
      int v28 = *(_DWORD *)&v8[v23] - *(_DWORD *)&v27[v23];
      if (v28) {
        break;
      }
      v23 += 4;
    }

    if (*(_WORD *)&v8[v23] == *(_WORD *)&v27[v23])
    {
      v23 += 2;
      char v30 = BYTE2(v28);
    }

    else
    {
      char v30 = v8[v23] - v27[v23];
    }

    if (v30) {
      unsigned int v31 = v23;
    }
    else {
      unsigned int v31 = v23 + 1;
    }
    else {
      unsigned int v23 = v31;
    }
    *(_DWORD *)&a2[8 * (v7 - 1)] = v23;
LABEL_17:
    if (v23 <= 3) {
      unsigned int v23 = 3;
    }
    unint64_t v7 = (unint64_t)((char *)bt_find_func( v6,  v9,  (uint64_t)v8,  v20,  *(_DWORD *)(a1 + 92),  *(void *)(a1 + 72),  *(_DWORD *)(a1 + 80),  v21,  (unsigned int *)&a2[8 * v7],  v23)
                          - a2) >> 3;
    goto LABEL_27;
  }

  unint64_t v7 = 0LL;
  *(_DWORD *)(a1 + 24) = v4 + 1;
  ++*(_DWORD *)(a1 + 40);
  return v7;
}

uint64_t lzma_mf_bt4_skip(uint64_t a1, int a2)
{
  do
  {
    uint64_t v4 = *(unsigned int *)(a1 + 24);
    unsigned int v5 = *(_DWORD *)(a1 + 36) - v4;
    uint64_t result = *(unsigned int *)(a1 + 96);
    if (result > v5
      && (v5 < 4 || (uint64_t result = (*(_DWORD *)(a1 + 36) - v4), *(_DWORD *)(a1 + 104) == 1)))
    {
      *(_DWORD *)(a1 + 24) = v4 + 1;
      ++*(_DWORD *)(a1 + 40);
    }

    else
    {
      unint64_t v7 = (unsigned __int8 *)(*(void *)a1 + v4);
      int v8 = *(_DWORD *)(a1 + 20) + v4;
      int v9 = lzma_crc32_table[*v7] ^ v7[1];
      unsigned int v10 = v9 & 0x3FF;
      int v11 = v9 ^ (v7[2] << 8);
      unsigned int v12 = ((v11 ^ (32 * lzma_crc32_table[v7[3]])) & *(_DWORD *)(a1 + 88)) + 66560;
      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 72);
      int v15 = *(_DWORD *)(v14 + 4LL * v12);
      *(_DWORD *)(v14 + 4LL * v10) = v8;
      *(_DWORD *)(v14 + 4LL * ((unsigned __int16)v11 + 1024)) = v8;
      *(_DWORD *)(v14 + 4LL * v12) = v8;
      bt_skip_func(result, v8, (uint64_t)v7, v15, *(_DWORD *)(a1 + 92), v13, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84));
      uint64_t result = move_pos(a1);
    }

    --a2;
  }

  while (a2);
  return result;
}

uint64_t normalize(uint64_t result)
{
  unsigned int v1 = ~*(_DWORD *)(result + 84);
  if (*(_DWORD *)(result + 108))
  {
    unint64_t v2 = 0LL;
    uint64_t v3 = *(void *)(result + 64);
    do
    {
      unsigned int v4 = *(_DWORD *)(v3 + 4 * v2);
      BOOL v5 = v4 >= v1;
      unsigned int v6 = v4 - v1;
      if (!v5) {
        unsigned int v6 = 0;
      }
      *(_DWORD *)(v3 + 4 * v2++) = v6;
    }

    while (v2 < *(unsigned int *)(result + 108));
  }

  if (*(_DWORD *)(result + 112))
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = *(void *)(result + 72);
    do
    {
      unsigned int v9 = *(_DWORD *)(v8 + 4 * v7);
      BOOL v5 = v9 >= v1;
      unsigned int v10 = v9 - v1;
      if (!v5) {
        unsigned int v10 = 0;
      }
      *(_DWORD *)(v8 + 4 * v7++) = v10;
    }

    while (v7 < *(unsigned int *)(result + 112));
  }

  *(_DWORD *)(result + 20) -= v1;
  return result;
}

const char *lzma_str_to_filters(uint64_t a1, int *a2, void *a3, unsigned int a4, void *a5)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  BOOL v5 = "Unexpected NULL pointer argument(s) to lzma_str_to_filters()";
  if (!a1 || !a3) {
    return v5;
  }
  char v7 = a4;
  if (a4 > 3) {
    return "Unsupported flags to lzma_str_to_filters()";
  }
  unsigned int v9 = a2;
  for (unint64_t i = a1 + 1; ; ++i)
  {
    int v12 = *(unsigned __int8 *)(i - 1);
    if (v12 != 32) {
      break;
    }
  }

  if (!*(_BYTE *)(i - 1))
  {
    v47 = (const char *)(i - 1);
    BOOL v5 = "Empty string is not allowed, try 6 if a default value is needed";
    goto LABEL_75;
  }

  uint64_t v13 = (unsigned __int8 *)(i - 1);
  v47 = (const char *)(i - 1);
  if ((v12 - 48) < 0xA)
  {
    --i;
    goto LABEL_12;
  }

  if (v12 == 45)
  {
    int v17 = *(unsigned __int8 *)i;
    if ((v17 - 48) <= 9)
    {
      v47 = (const char *)i;
      LOBYTE(v12) = v17;
LABEL_12:
      size_t v14 = strlen((const char *)i);
      int v15 = (const char *)memchr((const void *)i, 32, v14);
      if (v15)
      {
        for (uint64_t j = 1LL; v15[j] == 32; ++j)
          ;
        if (v15[j]) {
          goto LABEL_72;
        }
      }

      else
      {
        int v15 = (const char *)(i + v14);
      }

      int v36 = (char)v12 - 48;
      v47 = (const char *)(i + 1);
      if (i + 1 < (unint64_t)v15)
      {
        v36 |= 0x80000000;
        uint64_t v37 = &v15[~i];
        int v38 = (const char *)(i + 2);
        BOOL v5 = "Unsupported preset flag";
        while (*(v38 - 1) == 101)
        {
          v47 = v38++;
          if (!--v37) {
            goto LABEL_69;
          }
        }

        goto LABEL_75;
      }

LABEL_69:
      uint64_t v39 = lzma_alloc(0x70uLL, (uint64_t)a5);
      if (!v39)
      {
        BOOL v5 = "Memory allocation failed";
        goto LABEL_75;
      }

      size_t v40 = v39;
      if (!lzma_lzma_preset((uint64_t)v39, v36))
      {
        BOOL v5 = 0LL;
        *a3 = 33LL;
        a3[1] = v40;
        a3[2] = -1LL;
        a3[3] = 0LL;
        goto LABEL_75;
      }

      lzma_free(v40, (uint64_t)a5);
LABEL_72:
      BOOL v5 = "Unsupported preset";
      goto LABEL_75;
    }
  }

  uint64_t v18 = 0LL;
  BOOL v5 = "The maximum number of filters is four";
  do
  {
    if (v18 == 4)
    {
LABEL_61:
      unint64_t v34 = (void **)&__src[2 * v18 - 1];
      do
      {
        --v18;
        unint64_t v35 = *v34;
        v34 -= 2;
        lzma_free(v35, (uint64_t)a5);
      }

      while (v18);
      goto LABEL_63;
    }

    if (v12 == 45 && v13[1] == 45)
    {
      v13 += 2;
      v47 = (const char *)v13;
    }

    for (uint64_t k = 0LL; ; ++k)
    {
      int v20 = v13[k];
      if (v20 != 45) {
        break;
      }
      if (v13[k + 1] == 45) {
        goto LABEL_33;
      }
LABEL_32:
      ;
    }

    if (v13[k] && v20 != 32) {
      goto LABEL_32;
    }
LABEL_33:
    if (!k)
    {
      BOOL v5 = "Filter name is missing";
      goto LABEL_60;
    }

    unsigned int v21 = &v13[k];
    char v22 = &v13[k];
    if (v13 >= &v13[k])
    {
LABEL_39:
      uint64_t v25 = (uint64_t)&v13[k];
    }

    else
    {
      uint64_t v23 = 0LL;
      while (1)
      {
        int v24 = v13[v23];
        if (v24 == 61 || v24 == 58) {
          break;
        }
        if (k == ++v23) {
          goto LABEL_39;
        }
      }

      char v22 = &v13[v23];
      uint64_t v25 = (uint64_t)&v13[v23 + 1];
    }

    size_t v26 = v22 - v13;
    if ((unint64_t)(v22 - v13) > 0xB)
    {
LABEL_59:
      BOOL v5 = "Unknown filter name";
      goto LABEL_60;
    }

    uint64_t v44 = (const char *)v25;
    v45 = v21;
    unint64_t v27 = 0xFFFFFFFFFFFFFE20LL;
    while (memcmp(v13, &filter_name_map[v27 + 480], v26) || filter_name_map[v26 + 480 + v27])
    {
      v27 += 48LL;
      if (!v27) {
        goto LABEL_59;
      }
    }

    if ((v7 & 1) == 0 && v27 == -480LL)
    {
      BOOL v5 = "This filter cannot be used in the .xz format";
      goto LABEL_60;
    }

    int v28 = lzma_alloc_zero(*(unsigned int *)&filter_name_map[v27 + 492], a5);
    if (!v28)
    {
      BOOL v5 = "Memory allocation failed";
      goto LABEL_60;
    }

    char v29 = v28;
    v47 = v44;
    uint64_t v30 = (*(uint64_t (**)(const char **, unsigned __int8 *, void *))&filter_name_map[v27 + 504])( &v47,  v45,  v28);
    if (v30)
    {
      __int128 v43 = (const char *)v30;
      lzma_free(v29, (uint64_t)a5);
      BOOL v5 = v43;
LABEL_60:
      if (v18) {
        goto LABEL_61;
      }
      goto LABEL_63;
    }

    __src[2 * v18] = *(void *)&filter_name_map[v27 + 496];
    __src[2 * v18 + 1] = (uint64_t)v29;
    uint64_t v13 = (unsigned __int8 *)v47;
    int v12 = *(unsigned __int8 *)v47;
    if (v12 == 32)
    {
      unsigned int v31 = v47 + 1;
      do
      {
        v47 = v31;
        int v32 = *(unsigned __int8 *)v31++;
        int v12 = v32;
      }

      while (v32 == 32);
      uint64_t v13 = (unsigned __int8 *)(v31 - 1);
    }

    ++v18;
  }

  while (v12);
  uint64_t v33 = &__src[2 * v18];
  *uint64_t v33 = -1LL;
  v33[1] = 0LL;
  if ((v7 & 2) == 0 && lzma_validate_chain(__src, &v48))
  {
    BOOL v5 = "Invalid filter chain ('lzma2' missing at the end?)";
    goto LABEL_61;
  }

  memcpy(a3, __src, 16 * v18 + 16);
  BOOL v5 = 0LL;
LABEL_63:
  unsigned int v9 = a2;
LABEL_75:
  if (v9)
  {
    int v41 = (_DWORD)v47 - a1;
    *unsigned int v9 = v41;
  }

  return v5;
}

uint64_t lzma_str_from_filters(void *a1, uint64_t *a2, int a3, uint64_t a4)
{
  if (!a1) {
    return 11LL;
  }
  *a1 = 0LL;
  if (!a2) {
    return 11LL;
  }
  char v6 = a3;
  if ((a3 & 0xFFFFFF0F) != 0 || *a2 == -1) {
    return 8LL;
  }
  uint64_t v8 = a4;
  unsigned int v9 = lzma_alloc(0x320uLL, a4);
  v54 = v9;
  if (!v9) {
    return 5LL;
  }
  uint64_t v55 = 0LL;
  unsigned int v10 = ":";
  if ((v6 & 0x40) != 0) {
    unsigned int v10 = "=";
  }
  if (*a2 == -1)
  {
    v46 = v9;
LABEL_81:
    if (v55 == 799)
    {
      lzma_free(v46, v8);
      v46 = 0LL;
      uint64_t result = 11LL;
    }

    else
    {
      uint64_t result = 0LL;
      *((_BYTE *)v46 + v55) = 0;
    }

    *a1 = v46;
    return result;
  }

  __src = v10;
  uint64_t v11 = 0LL;
  int v12 = a2;
  while (1)
  {
    if (v11 == 4)
    {
LABEL_77:
      v47 = v54;
      uint64_t v48 = v8;
      goto LABEL_78;
    }

    if ((v6 & 0x80) == 0 && v11)
    {
      if (v55 == 799) {
        uint64_t v13 = 799LL;
      }
      else {
        uint64_t v13 = v55 + 1;
      }
      memcpy((char *)v54 + v55, " ", v55 != 799);
      uint64_t v55 = v13;
    }

    uint64_t v52 = v11;
    BOOL v15 = (v6 & 0x80) == 0 || v11 == 0;
    if ((v6 & 0x40) != 0 || !v15)
    {
      uint64_t v16 = v55;
      else {
        size_t v17 = 799 - v55;
      }
      memcpy((char *)v54 + v55, "--", v17);
      uint64_t v55 = v17 + v16;
    }

    uint64_t v18 = 0LL;
    uint64_t v19 = *v12;
    unint64_t v20 = -9LL;
    while (*(void *)&filter_name_map[v18 + 16] != v19)
    {
      ++v20;
      v18 += 48LL;
      if (v18 == 480) {
        goto LABEL_77;
      }
    }

    uint64_t v50 = v8;
    size_t v21 = strlen(&filter_name_map[v18]);
    uint64_t v23 = v54;
    uint64_t v22 = v55;
    size_t v24 = v21 >= 799 - v55 ? 799 - v55 : v21;
    memcpy((char *)v54 + v55, &filter_name_map[v18], v24);
    uint64_t v55 = v24 + v22;
    if ((v6 & 0x30) != 0)
    {
      uint64_t v53 = a2[2 * v52 + 1];
      if (v53)
      {
        uint64_t v25 = &filter_name_map[v18];
        uint64_t v26 = 40LL;
        if ((v6 & 0x10) == 0) {
          uint64_t v26 = 41LL;
        }
        uint64_t v27 = v25[v26];
        if (v25[v26])
        {
          uint64_t v28 = 0LL;
          uint64_t v29 = *((void *)v25 + 4);
          uint64_t v30 = __src;
          uint64_t v51 = v25[v26];
          do
          {
            if (*(_BYTE *)(v29 + 24 * v28 + 12) != 3)
            {
              unsigned int v31 = *(_DWORD *)(v53 + *(unsigned __int16 *)(v29 + 24 * v28 + 14));
              if (v31 || (*(_BYTE *)(v29 + 24 * v28 + 13) & 4) == 0)
              {
                int v32 = (char *)v54;
                if (v55 == 799) {
                  uint64_t v33 = 799LL;
                }
                else {
                  uint64_t v33 = v55 + 1;
                }
                memcpy((char *)v54 + v55, v30, v55 != 799);
                size_t v34 = strlen((const char *)(v29 + 24 * v28));
                if (v34 >= 799 - v33) {
                  size_t v35 = 799 - v33;
                }
                else {
                  size_t v35 = v34;
                }
                memcpy(&v32[v33], (const void *)(v29 + 24 * v28), v35);
                size_t v36 = v35 + v33 != 799;
                uint64_t v37 = &v32[v35 + v33];
                if (v35 + v33 == 799) {
                  uint64_t v38 = 799LL;
                }
                else {
                  uint64_t v38 = v35 + v33 + 1;
                }
                memcpy(v37, "=", v36);
                uint64_t v55 = v38;
                unsigned int v39 = *(unsigned __int8 *)(v29 + 24 * v28 + 13);
                if ((v39 & 1) != 0)
                {
                  uint64_t v40 = *(void *)(v29 + 24 * v28 + 16);
                  if (*(_BYTE *)v40)
                  {
                    while (*(_DWORD *)(v40 + 12) != v31)
                    {
                      int v41 = *(unsigned __int8 *)(v40 + 16);
                      v40 += 16LL;
                      if (!v41) {
                        goto LABEL_62;
                      }
                    }

                    size_t v45 = strlen((const char *)v40);
                    if (v45 >= 799 - v38) {
                      size_t v42 = 799 - v38;
                    }
                    else {
                      size_t v42 = v45;
                    }
                    __int128 v43 = &v32[v38];
                    uint64_t v44 = (const char *)v40;
                  }

                  else
                  {
LABEL_62:
                    else {
                      size_t v42 = 799 - v38;
                    }
                    __int128 v43 = &v32[v38];
                    uint64_t v44 = "UNKNOWN";
                  }

                  memcpy(v43, v44, v42);
                  uint64_t v55 = v42 + v38;
                }

                else
                {
                  str_append_u32(&v54, v31, (v39 >> 1) & 1);
                }

                uint64_t v30 = ",";
                uint64_t v27 = v51;
              }
            }

            ++v28;
          }

          while (v28 != v27);
        }

        goto LABEL_75;
      }

      if (v20 <= 0xFFFFFFFFFFFFFFF8LL) {
        break;
      }
    }

LABEL_75:
    uint64_t v11 = v52 + 1;
    int v12 = &a2[2 * v52 + 2];
    uint64_t v8 = v50;
    if (*v12 == -1)
    {
      v46 = v54;
      goto LABEL_81;
    }
  }

  v47 = v23;
  uint64_t v48 = v50;
LABEL_78:
  lzma_free(v47, v48);
  return 8LL;
}

void *str_append_str(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  uint64_t v5 = a1[1];
  if (v4 >= 799 - v5) {
    size_t v6 = 799 - v5;
  }
  else {
    size_t v6 = v4;
  }
  uint64_t result = memcpy((void *)(*a1 + v5), __s, v6);
  a1[1] += v6;
  return result;
}

uint64_t lzma_str_list_filters(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 11LL;
  }
  uint64_t v4 = a3;
  *a1 = 0LL;
  if ((a3 & 0xFFFFFF8E) != 0) {
    return 8LL;
  }
  unsigned int v9 = (char *)lzma_alloc(0x320uLL, a4);
  v58 = v9;
  if (!v9) {
    return 5LL;
  }
  unsigned int v10 = v9;
  uint64_t v51 = a1;
  uint64_t v11 = 0LL;
  char v12 = 0;
  uint64_t v13 = 0LL;
  int v55 = v4 & 0x30;
  size_t v14 = "\n";
  if ((v4 & 0x30) == 0) {
    size_t v14 = " ";
  }
  __src = v14;
  if ((v4 & 0x40) != 0) {
    BOOL v15 = "=";
  }
  else {
    BOOL v15 = ":";
  }
  uint64_t v52 = v15;
  uint64_t v16 = "lzma1";
  unsigned int v53 = v4;
  uint64_t v56 = a2;
  do
  {
    if (a2 == -1)
    {
      if ((v4 & 1) == 0 && !v13) {
        goto LABEL_68;
      }
    }

    else if (*(void *)&v16[48 * v13 + 16] != a2)
    {
      goto LABEL_68;
    }

    if ((v12 & 1) != 0)
    {
      size_t v17 = v11 != 799;
      uint64_t v18 = &v10[v11];
      if (v11 != 799) {
        ++v11;
      }
      memcpy(v18, __src, v17);
    }

    uint64_t v19 = v4;
    if ((v4 & 0x40) != 0)
    {
      else {
        size_t v20 = 799 - v11;
      }
      memcpy(&v10[v11], "--", v20);
      v11 += v20;
      uint64_t v16 = "lzma1";
    }

    size_t v21 = v16;
    uint64_t v22 = &v16[48 * v13];
    size_t v23 = strlen(v22);
    if (v23 >= 799 - v11) {
      size_t v24 = 799 - v11;
    }
    else {
      size_t v24 = v23;
    }
    memcpy(&v10[v11], v22, v24);
    v11 += v24;
    uint64_t v59 = v11;
    if (v55)
    {
      uint64_t v57 = v13;
      uint64_t v25 = &v21[48 * v13];
      uint64_t v26 = v25 + 40;
      if ((v19 & 0x10) == 0) {
        uint64_t v26 = v25 + 41;
      }
      uint64_t v27 = *v26;
      if (*v26)
      {
        uint64_t v28 = 0LL;
        uint64_t v29 = *((void *)v25 + 4);
        uint64_t v30 = v52;
        do
        {
          size_t v31 = v11 != 799;
          int v32 = &v10[v11];
          if (v11 != 799) {
            ++v11;
          }
          memcpy(v32, v30, v31);
          size_t v33 = strlen((const char *)(v29 + 24 * v28));
          if (v33 >= 799 - v11) {
            size_t v34 = 799 - v11;
          }
          else {
            size_t v34 = v33;
          }
          memcpy(&v10[v11], (const void *)(v29 + 24 * v28), v34);
          size_t v35 = v34 + v11;
          if (799 - v35 >= 2) {
            size_t v36 = 2LL;
          }
          else {
            size_t v36 = 799 - v35;
          }
          memcpy(&v10[v35], "=<", v36);
          uint64_t v11 = v36 + v35;
          uint64_t v59 = v11;
          if (*(_BYTE *)(v29 + 24 * v28 + 12) == 3)
          {
            else {
              size_t v37 = 799 - v11;
            }
            memcpy(&v10[v11], "0-9[e]", v37);
            v11 += v37;
          }

          else
          {
            unsigned int v38 = *(unsigned __int8 *)(v29 + 24 * v28 + 13);
            if ((v38 & 1) != 0)
            {
              uint64_t v42 = *(void *)(v29 + 24 * v28 + 16);
              if (*(_BYTE *)v42)
              {
                uint64_t v43 = 0LL;
                do
                {
                  if (v43)
                  {
                    size_t v44 = v11 != 799;
                    size_t v45 = &v10[v11];
                    if (v11 != 799) {
                      ++v11;
                    }
                    memcpy(v45, "|", v44);
                  }

                  size_t v46 = strlen((const char *)v42);
                  if (v46 >= 799 - v11) {
                    size_t v47 = 799 - v11;
                  }
                  else {
                    size_t v47 = v46;
                  }
                  memcpy(&v10[v11], (const void *)v42, v47);
                  v11 += v47;
                  int v48 = *(unsigned __int8 *)(v42 + 16);
                  v42 += 16LL;
                  --v43;
                }

                while (v48);
              }
            }

            else
            {
              int v39 = (v38 >> 1) & 1;
              uint64_t v40 = v29 + 24 * v28;
              str_append_u32(&v58, *(_DWORD *)(v40 + 16), v39);
              if (v59 == 799) {
                uint64_t v41 = 799LL;
              }
              else {
                uint64_t v41 = v59 + 1;
              }
              memcpy(&v58[v59], "-", v59 != 799);
              uint64_t v59 = v41;
              str_append_u32(&v58, *(_DWORD *)(v40 + 20), v39);
              unsigned int v10 = v58;
              uint64_t v11 = v59;
            }
          }

          size_t v49 = v11 != 799;
          uint64_t v50 = &v10[v11];
          if (v11 != 799) {
            ++v11;
          }
          memcpy(v50, ">", v49);
          uint64_t v59 = v11;
          ++v28;
          uint64_t v30 = ",";
        }

        while (v28 != v27);
        char v12 = 1;
        uint64_t v4 = v53;
        a2 = v56;
        uint64_t v13 = v57;
        uint64_t v16 = "lzma1";
      }

      else
      {
        uint64_t v4 = v19;
        uint64_t v16 = v21;
        char v12 = 1;
        a2 = v56;
        uint64_t v13 = v57;
      }
    }

    else
    {
      char v12 = 1;
      uint64_t v16 = v21;
      uint64_t v4 = v19;
      a2 = v56;
    }

LABEL_68:
    ++v13;
  }

  while (v13 != 10);
  if ((v12 & 1) == 0)
  {
    lzma_free(v10, a4);
    return 8LL;
  }

  if (v11 == 799)
  {
    lzma_free(v10, a4);
    unsigned int v10 = 0LL;
    uint64_t result = 11LL;
  }

  else
  {
    uint64_t result = 0LL;
    v10[v11] = 0;
  }

  *uint64_t v51 = v10;
  return result;
}

void *str_append_u32(void *a1, unsigned int a2, int a3)
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    unint64_t v4 = 0LL;
    if ((a2 & 0x3FF) == 0 && a3)
    {
      unint64_t v5 = 0LL;
      do
      {
        unsigned int v6 = a2;
        a2 >>= 10;
        unint64_t v4 = v5 + 1;
        if ((v6 & 0xFFC00) != 0) {
          break;
        }
      }

      while (v5++ < 2);
    }

    HIWORD(v12[0]) = 0;
    uint64_t v8 = (char *)v12 + 7;
    do
    {
      *--uint64_t v8 = (a2 % 0xA) | 0x30;
      BOOL v9 = a2 > 9;
      a2 /= 0xAu;
    }

    while (v9);
    str_append_str(a1, v8);
    unsigned int v10 = (char *)&str_append_u32_suffixes + 4 * v4;
  }

  else
  {
    unsigned int v10 = "0";
  }

  return str_append_str(a1, v10);
}

const char *parse_lzma12(uint64_t *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t result = parse_options(a1, a2, a3, (uint64_t)"preset", 9LL);
  if (!result)
  {
    else {
      return "The sum of lc and lp must not exceed 4";
    }
  }

  return result;
}

const char *parse_bcj(uint64_t *a1, _BYTE *a2, uint64_t a3)
{
  return parse_options(a1, a2, a3, (uint64_t)"start", 1LL);
}

const char *parse_delta(uint64_t *a1, _BYTE *a2, void *a3)
{
  *a3 = 0x100000000LL;
  return parse_options(a1, a2, (uint64_t)a3, (uint64_t)"dist", 1LL);
}

const char *parse_options(uint64_t *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  if (*a1 < (unint64_t)a2)
  {
    uint64_t v40 = "Invalid multiplier suffix (KiB, MiB, or GiB)";
    while (1)
    {
      for (uint64_t i = -v5; ; --i)
      {
        int v10 = *(unsigned __int8 *)v5;
        if (v10 != 44) {
          break;
        }
        *a1 = ++v5;
        if ((_BYTE *)v5 == a2) {
          return 0LL;
        }
      }

      if (!*(_BYTE *)v5) {
        break;
      }
      uint64_t v11 = memchr((const void *)v5, 44, (size_t)&a2[-v5]);
      if (v11) {
        unint64_t v12 = (unint64_t)v11;
      }
      else {
        unint64_t v12 = (unint64_t)a2;
      }
      unint64_t v13 = v12;
      size_t v14 = memchr((const void *)v5, 61, v12 - v5);
      if (v10 == 61 || v14 == 0LL) {
        return "Options must be 'name=value' pairs separated with commas";
      }
      uint64_t v16 = v14;
      size_t v17 = (size_t)&v14[-v5];
      uint64_t v19 = &v14[i];
      uint64_t v20 = a4;
      uint64_t v21 = a5;
      uint64_t v39 = v20;
      while (memcmp((const void *)v5, (const void *)v20, v17) || v19[v20])
      {
        v20 += 24LL;
        if (!--v21) {
          return "Unknown option name";
        }
      }

      uint64_t v22 = v16 + 1;
      *a1 = (uint64_t)(v16 + 1);
      size_t v23 = v13 - (void)(v16 + 1);
      if ((_BYTE *)v13 == v16 + 1) {
        return "Option value cannot be empty";
      }
      size_t v24 = (_BYTE *)v13;
      if (*(_BYTE *)(v20 + 12) == 3)
      {
        int v25 = (char)v16[1] - 48;
        *a1 = (uint64_t)(v16 + 2);
        a4 = v39;
        if ((unint64_t)(v16 + 2) < v13)
        {
          v25 |= 0x80000000;
          uint64_t v26 = v13 - (void)v16 - 2;
          uint64_t v27 = v16 + 3;
          while (*(v27 - 1) == 101)
          {
            *a1 = (uint64_t)v27++;
            if (!--v26) {
              goto LABEL_30;
            }
          }

          return "Unsupported preset flag";
        }

LABEL_30:
      }

      else
      {
        a4 = v39;
        if ((*(_BYTE *)(v20 + 13) & 1) != 0)
        {
          if (v23 > 0xB) {
            return "Invalid option value";
          }
          size_t v35 = *(_DWORD **)(v20 + 16);
          if (!*(_BYTE *)v35) {
            return "Invalid option value";
          }
          while (memcmp(v22, v35, v23) || *((_BYTE *)v35 + v23))
          {
            int v36 = *((unsigned __int8 *)v35 + 16);
            v35 += 4;
            uint64_t result = "Invalid option value";
            if (!v36) {
              return result;
            }
          }

          unsigned int v29 = v35[3];
          size_t v24 = (_BYTE *)v13;
        }

        else
        {
          unsigned __int8 v28 = *v22;
          unsigned int v29 = 0;
          uint64_t v30 = v16 + 3;
          do
          {
            if (v29 > 0x19999999) {
              return "Value out of range";
            }
            int v31 = 5 * v29;
            unsigned int v29 = 2 * v31 + v28 - 48;
            int v32 = (char)*(v30 - 1);
            unsigned __int8 v28 = *(v30++ - 1);
          }

          while ((v32 - 48) < 0xA);
          if ((*(_BYTE *)(v20 + 13) & 2) == 0)
          {
            uint64_t v40 = "This option does not support any integer suffixes";
LABEL_77:
            *a1 = (uint64_t)(v30 - 2);
            return v40;
          }

          char v33 = v32 - 71;
          if (((1LL << v33) & 0x100000001LL) != 0)
          {
            char v34 = 30;
          }

          else if (((1LL << v33) & 0x1000000010LL) != 0)
          {
            char v34 = 10;
          }

          else
          {
            if (((1LL << v33) & 0x4000000040LL) == 0) {
              goto LABEL_77;
            }
            char v34 = 20;
          }

          size_t v37 = v30 - 1;
          if (v29 > 0xFFFFFFFF >> v34) {
            return "Value out of range";
          }
          v29 <<= v34;
LABEL_63:
          if (v29 < *(_DWORD *)(v20 + 16) || v29 > *(_DWORD *)(v20 + 20)) {
            return "Value out of range";
          }
        }

        *(_DWORD *)(a3 + *(unsigned __int16 *)(v20 + 14)) = v29;
        *a1 = (uint64_t)v24;
      }

      uint64_t result = 0LL;
      uint64_t v5 = *a1;
    }
  }

  return 0LL;
}

      uint64_t v20 = *(void *)(a1 + 448);
      if (!v20) {
        goto LABEL_53;
      }
LABEL_31:
      int v31 = *(void *)(v20 + 8);
      *(void *)uint64_t v57 = *(void *)(v20 + 16);
      lzma_bufcpy(a3, a4, a5, v31, (uint64_t *)v57, *(void *)(a1 + 8));
      if (*(void *)v57 == *(void *)(a1 + 8))
      {
        int v32 = 1;
      }

      else
      {
        char v33 = a10 && *a4 == a5;
        int v32 = v33;
      }

      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 448) + 440LL));
      char v34 = *(void *)(a1 + 448);
      if (!*(_DWORD *)v34) {
        break;
      }
      *(void *)(v34 + 16) = *(void *)v57;
      if (v32)
      {
        *(_DWORD *)char v34 = 2;
        pthread_cond_signal((pthread_cond_t *)(v34 + 504));
        pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 448) + 440LL));
        *(void *)(a1 + 448) = 0LL;
      }

      else
      {
        pthread_cond_signal((pthread_cond_t *)(v34 + 504));
        pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 448) + 440LL));
      }
    }

    pthread_mutex_unlock((pthread_mutex_t *)(v34 + 440));
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
    size_t v17 = *(unsigned int *)(a1 + 420);
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 472));
LABEL_53:
    if ((_DWORD)v17) {
      goto LABEL_78;
    }
    uint64_t v19 = *a4;
LABEL_55:
    if (v19 == a5) {
      break;
    }
LABEL_61:
    if (*a7 == a8) {
      return 0LL;
    }
    unsigned int v38 = *(_DWORD *)(a1 + 416);
    if (v38 && !v48)
    {
      v53.tv_sec = v38 / 0x3E8uLL;
      v53.tv_nsec = 1000000 * (v38 % 0x3E8);
      clock_gettime(*(clockid_t *)(a1 + 584), (timespec *)v57);
      uint64_t v39 = vaddq_s64((int64x2_t)v53, *(int64x2_t *)v57);
      unsigned int v53 = (timespec)vbslq_s8( (int8x16_t)vdupq_lane_s64(vcgtq_s64(vdupq_laneq_s64(v39, 1), v47).i64[0], 0),  (int8x16_t)vaddq_s64(v39, (int64x2_t)xmmword_181171730),  (int8x16_t)v39);
      int v48 = 1;
    }

    pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
LABEL_66:
    for (uint64_t i = 0;
          (v19 >= a5 || !*(void *)(a1 + 440) || *(_DWORD *)(a1 + 392) >= *(_DWORD *)(a1 + 400))
       && !lzma_outq_is_readable((uint64_t *)(a1 + 344))
       && *(_DWORD *)(a1 + 420) == 0
       && !i;
          uint64_t i = pthread_cond_timedwait(v51, (pthread_mutex_t *)(a1 + 472), &v53) != 0)
    {
      if (!*(_DWORD *)(a1 + 416))
      {
        pthread_cond_wait(v51, (pthread_mutex_t *)(a1 + 472));
        goto LABEL_66;
      }
    }

    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 472));
    if (i) {
      return 101LL;
    }
  }

  if (!a10) {
    return 0LL;
  }
  if (a10 == 4) {
    return 1LL;
  }
  if (*(_DWORD *)(a1 + 392)) {
    goto LABEL_61;
  }
  if (a10 == 2) {
    return 1LL;
  }
  if (a10 != 3) {
    goto LABEL_61;
  }
  size_t v17 = lzma_index_encoder_init(a1 + 184, a2, *(void *)(a1 + 176));
  if (!(_DWORD)v17)
  {
    *(_DWORD *)a1 = 2;
    *(void *)(a1 + 464) += lzma_index_size(*(void *)(a1 + 176)) + 12;
LABEL_83:
    size_t v17 = (*(uint64_t (**)(void, uint64_t, void, void, void, uint64_t, uint64_t *, unint64_t, _DWORD))(a1 + 208))( *(void *)(a1 + 184),  a2,  0LL,  0LL,  0LL,  v12,  a7,  a8,  0);
    if ((_DWORD)v17 == 1)
    {
      *(void *)(a1 + 272) = lzma_index_size(*(void *)(a1 + 176));
      if (lzma_stream_footer_encode(a1 + 264, a1 + 320))
      {
        return 11LL;
      }

      else
      {
        *(_DWORD *)a1 = 3;
LABEL_87:
        lzma_bufcpy(a1 + 320, (uint64_t *)(a1 + 336), 12LL, v12, a7, a8);
        return *(void *)(a1 + 336) > 0xBuLL;
      }
    }
  }

  return v17;
}

uint64_t lzma_lz_decoder_init( char **a1, uint64_t a2, void *a3, uint64_t (*a4)(char *, uint64_t, void, void, unint64_t *))
{
  uint64_t v8 = *a1;
  if (!*a1)
  {
    BOOL v9 = (char *)lzma_alloc(0x10C0uLL, a2);
    if (!v9) {
      return 5LL;
    }
    uint64_t v8 = v9;
    *a1 = v9;
    a1[3] = (char *)lz_decode;
    a1[4] = (char *)lz_decoder_end;
    *(void *)BOOL v9 = 0LL;
    *((void *)v9 + 4) = 0LL;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    *((void *)v9 + 10) = 0LL;
    *((void *)v9 + 11) = 0LL;
    *((void *)v9 + 12) = -1LL;
    *(_OWORD *)(v9 + 104) = 0u;
    *(_OWORD *)(v9 + 120) = 0u;
    *(_OWORD *)(v9 + 136) = 0u;
    *(_OWORD *)(v9 + 152) = 0u;
  }

  uint64_t result = a4(v8 + 48, a2, *a3, a3[2], &v16);
  if ((_DWORD)result) {
    return result;
  }
  unint64_t v12 = v16;
  if (v16 >= 0x1000)
  {
    if (v16 > 0xFFFFFFFFFFFFFFF0LL) {
      return 5LL;
    }
  }

  else
  {
    unint64_t v12 = 4096LL;
  }

  unint64_t v16 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  if (*((void *)v8 + 4) == v16) {
    goto LABEL_11;
  }
  lzma_free(*(void **)v8, a2);
  unint64_t v13 = lzma_alloc(v16, a2);
  *(void *)uint64_t v8 = v13;
  if (!v13) {
    return 5LL;
  }
  *((void *)v8 + 4) = v16;
LABEL_11:
  size_t v14 = *a1;
  *((void *)v14 + 1) = 0LL;
  *((void *)v14 + 2) = 0LL;
  *(_BYTE *)(*((void *)v14 + 4) + *(void *)v14 - 1LL) = 0;
  v14[40] = 0;
  if (v17 && v18)
  {
    if (v18 >= v16) {
      size_t v15 = v16;
    }
    else {
      size_t v15 = v18;
    }
    memcpy(*(void **)v8, (const void *)(v17 + v18 - v15), v15);
    *((void *)v8 + 1) = v15;
    *((void *)v8 + 2) = v15;
  }

  *((_WORD *)v8 + 84) = 0;
  *((void *)v8 + 22) = 0LL;
  *((void *)v8 + 23) = 0LL;
  return lzma_next_filter_init((uint64_t)(v8 + 88), a2, a3 + 3, v11);
}

uint64_t lz_decode( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8, int a9)
{
  if (!*(void *)(a1 + 112)) {
    return decode_buffer(a1, a3, a4, a5, a6, a7, a8);
  }
  if (*a7 >= a8) {
    return 0LL;
  }
  HIDWORD(v21) = a9;
  unint64_t v16 = (void *)(a1 + 176);
  uint64_t v17 = (void *)(a1 + 184);
  while (1)
  {
    if (!*(_BYTE *)(a1 + 168) && *v16 == *v17)
    {
      *unint64_t v16 = 0LL;
      *(void *)(a1 + 184) = 0LL;
      LODWORD(v21) = HIDWORD(v21);
      uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 112))( *(void *)(a1 + 88),  a2,  a3,  a4,  a5,  a1 + 192,  a1 + 184,  4096LL,  v21);
      if ((_DWORD)result)
      {
        if ((_DWORD)result != 1) {
          return result;
        }
        *(_BYTE *)(a1 + 168) = 1;
      }

      else if (!*v17)
      {
        return 0LL;
      }
    }

    uint64_t v19 = *(void *)(a1 + 184);
    if (*(_BYTE *)(a1 + 169)) {
      break;
    }
    uint64_t result = decode_buffer(a1, a1 + 192, a1 + 176, v19, a6, a7, a8);
    if ((_DWORD)result)
    {
      if ((_DWORD)result != 1) {
        return result;
      }
      *(_BYTE *)(a1 + 169) = 1;
      unint64_t v20 = *a7;
    }

    else
    {
      unint64_t v20 = *a7;
      if (*(_BYTE *)(a1 + 168) && v20 < a8) {
        return 9LL;
      }
    }

    if (v20 >= a8) {
      return 0LL;
    }
  }

  if (v19) {
    return 9LL;
  }
  return *(unsigned __int8 *)(a1 + 168);
}

void lz_decoder_end(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void (**)(void *, uint64_t))(a1 + 80);
  uint64_t v5 = *(void **)(a1 + 48);
  if (v4) {
    v4(v5, a2);
  }
  else {
    lzma_free(v5, a2);
  }
  lzma_free((void *)a1, a2);
}

uint64_t lzma_lz_decoder_memusage(uint64_t a1)
{
  return a1 + 4288;
}

uint64_t decode_buffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  __n128 v11 = (void *)(a1 + 8);
  uint64_t v12 = *a6;
  while (1)
  {
    while (1)
    {
      uint64_t v13 = *(void *)(a1 + 8);
      uint64_t v14 = *(void *)(a1 + 32);
      if (v13 == v14)
      {
        uint64_t v13 = 0LL;
        *__n128 v11 = 0LL;
      }

      unint64_t v15 = v14 - v13;
      if (a7 - v12 < v15) {
        unint64_t v15 = a7 - v12;
      }
      *(void *)(a1 + 24) = v15 + v13;
      uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 56))( *(void *)(a1 + 48),  a1,  a2,  a3,  a4);
      unint64_t v17 = *(void *)(a1 + 8);
      if (v17 != v13) {
        memcpy((void *)(a5 + v12), (const void *)(*(void *)a1 + v13), v17 - v13);
      }
      v12 += v17 - v13;
      *a6 = v12;
      if (!*(_BYTE *)(a1 + 40)) {
        break;
      }
      *__n128 v11 = 0LL;
      v11[1] = 0LL;
      *(_BYTE *)(*(void *)(a1 + 32) + *(void *)a1 - 1LL) = 0;
      *(_BYTE *)(a1 + 40) = 0;
      if ((_DWORD)v16 || v12 == a7) {
        return v16;
      }
    }

    if ((_DWORD)v16 || v12 == a7) {
      break;
    }
    if (v17 < *(void *)(a1 + 32)) {
      return 0LL;
    }
  }

  return v16;
}

uint64_t lzma_lzma_encode( uint64_t a1, unsigned __int8 **a2, uint64_t a3, uint64_t *a4, uint64_t a5, unsigned int a6)
{
  if (!*(_BYTE *)(a1 + 2933))
  {
    if (*((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 8))
    {
      if (!*((_DWORD *)a2 + 26)) {
        return 0LL;
      }
    }

    else
    {
      unsigned int v12 = 1;
      ((void (*)(unsigned __int8 **, uint64_t))a2[7])(a2, 1LL);
      *((_DWORD *)a2 + 7) = 0;
      *(_DWORD *)(a1 + 4LL * *(void *)(a1 + 32) + 48) = 0;
      uint64_t v13 = *(void *)(a1 + 32);
      *(void *)(a1 + 8 * v13 + 264) = a1 + 27524;
      uint64_t v14 = v13 + 1;
      *(void *)(a1 + 32) = v13 + 1;
      unsigned int v15 = **a2;
      for (int i = 7; i != -1; --i)
      {
        *(_DWORD *)(a1 + 4 * v14 + 48) = (v15 >> i) & 1;
        uint64_t v17 = *(void *)(a1 + 32);
        *(void *)(a1 + 8 * v17 + 264) = a1 + 2948 + 2LL * v12;
        uint64_t v14 = v17 + 1;
        *(void *)(a1 + 32) = v14;
        int v18 = (v15 >> i) & 1 | (2 * v12);
        unsigned int v12 = v18;
      }

      ++*(void *)(a1 + 688);
    }

    *(_BYTE *)(a1 + 2933) = 1;
  }

  uint64_t result = 1LL;
  if (!*(_BYTE *)(a1 + 2934))
  {
    uint64_t v20 = a1 + 264;
    while (1)
    {
      unsigned int v21 = *((_DWORD *)a2 + 6);
      if (v21 >= *((_DWORD *)a2 + 8))
      {
        if (!*((_DWORD *)a2 + 26)) {
          return 0LL;
        }
        if (!*((_DWORD *)a2 + 7))
        {
LABEL_73:
          v77 = *(void **)(a1 + 704);
          if (v77) {
            void *v77 = *(void *)(a1 + 688);
          }
          if (*(_BYTE *)(a1 + 2935))
          {
            unsigned int v78 = *(_DWORD *)(a1 + 2936) & *(_DWORD *)(a1 + 688);
            uint64_t v79 = a1 + 32LL * *(unsigned int *)(a1 + 712) + 2LL * v78;
            *(_DWORD *)(a1 + 48 + 4LL * *(void *)(a1 + 32)) = 1;
            uint64_t v80 = *(void *)(a1 + 32);
            *(void *)(a1 + 264 + 8 * v80) = v79 + 27524;
            uint64_t v81 = v80 + 1;
            *(void *)(a1 + 32) = v80 + 1;
            uint64_t v82 = a1 + 2LL * *(unsigned int *)(a1 + 712);
            *(_DWORD *)(a1 + 48 + 4 * v81) = 0;
            uint64_t v83 = v82 + 27908;
            uint64_t v84 = *(void *)(a1 + 32);
            *(void *)(a1 + 264 + 8 * v84) = v83;
            *(void *)(a1 + 32) = v84 + 1;
            match(a1, v78, 0xFFFFFFFF, 2u);
          }

          uint64_t v85 = 5LL;
          do
          {
            uint64_t v86 = *(void *)(a1 + 32);
            *(void *)(a1 + 32) = v86 + 1;
            *(_DWORD *)(a1 + 4 * v86 + 48) = 4;
            --v85;
          }

          while (v85);
          int v87 = rc_encode((unint64_t *)a1, a3, a4, a5);
          uint64_t result = 1LL;
          if (v87)
          {
            *(_BYTE *)(a1 + 2934) = 1;
            return 0LL;
          }

          return result;
        }
      }

      if (*(_BYTE *)(a1 + 2932)) {
        lzma_lzma_optimum_fast(a1, (uint64_t)a2, &v88, &v89);
      }
      else {
        lzma_lzma_optimum_normal(a1, (uint64_t)a2, &v88, &v89, *(_DWORD *)(a1 + 688));
      }
      uint64_t v22 = v88;
      uint64_t v23 = v89;
      unsigned int v24 = *(_DWORD *)(a1 + 688);
      uint64_t v25 = *(_DWORD *)(a1 + 2936) & v24;
      uint64_t v26 = a1 + 32LL * *(unsigned int *)(a1 + 712) + 2LL * v25 + 27524;
      uint64_t v27 = (_DWORD *)(a1 + 4LL * *(void *)(a1 + 32) + 48);
      if (v88 == -1) {
        break;
      }
      *uint64_t v27 = 1;
      uint64_t v28 = *(void *)(a1 + 32);
      *(void *)(a1 + 8 * v28++ + 264) = v26;
      *(void *)(a1 + 32) = v28;
      uint64_t v29 = a1 + 2LL * *(unsigned int *)(a1 + 712) + 27908;
      uint64_t v30 = (_DWORD *)(a1 + 4 * v28 + 48);
      if (v22 <= 3)
      {
        *uint64_t v30 = 1;
        uint64_t v31 = *(void *)(a1 + 32);
        *(void *)(a1 + 8 * v31 + 264) = v29;
        uint64_t v32 = v31 + 1;
        *(void *)(a1 + 32) = v32;
        if ((_DWORD)v22)
        {
          int v33 = *(_DWORD *)(a1 + 4 * v22 + 716);
          uint64_t v34 = a1 + 2LL * *(unsigned int *)(a1 + 712) + 27932;
          *(_DWORD *)(a1 + 48 + 4 * v32) = 1;
          uint64_t v35 = *(void *)(a1 + 32);
          *(void *)(a1 + 8 * v35 + 264) = v34;
          uint64_t v36 = v35 + 1;
          *(void *)(a1 + 32) = v35 + 1;
          uint64_t v37 = a1 + 2LL * *(unsigned int *)(a1 + 712) + 27956;
          unsigned int v38 = (_DWORD *)(a1 + 48 + 4 * v36);
          if ((_DWORD)v22 == 1)
          {
            *unsigned int v38 = 0;
            uint64_t v39 = *(void *)(a1 + 32);
            *(void *)(a1 + 8 * v39 + 264) = v37;
            *(void *)(a1 + 32) = v39 + 1;
          }

          else
          {
            *unsigned int v38 = 1;
            uint64_t v64 = *(void *)(a1 + 32);
            *(void *)(a1 + 264 + 8 * v64) = v37;
            uint64_t v65 = v64 + 1;
            *(void *)(a1 + 32) = v64 + 1;
            uint64_t v66 = a1 + 2LL * *(unsigned int *)(a1 + 712) + 27980;
            *(_DWORD *)(a1 + 4 * v65 + 48) = v22 - 2;
            uint64_t v67 = *(void *)(a1 + 32);
            *(void *)(a1 + 264 + 8 * v67) = v66;
            *(void *)(a1 + 32) = v67 + 1;
            if ((_DWORD)v22 == 3) {
              *(_DWORD *)(a1 + 728) = *(_DWORD *)(a1 + 724);
            }
            *(_DWORD *)(a1 + 724) = *(_DWORD *)(a1 + 720);
          }

          *(_DWORD *)(a1 + 720) = *(_DWORD *)(a1 + 716);
          *(_DWORD *)(a1 + 716) = v33;
        }

        else
        {
          uint64_t v59 = a1 + 2LL * *(unsigned int *)(a1 + 712) + 27932;
          *(_DWORD *)(a1 + 48 + 4 * v32) = 0;
          uint64_t v60 = *(void *)(a1 + 32);
          *(void *)(a1 + 264 + 8 * v60) = v59;
          uint64_t v61 = v60 + 1;
          *(void *)(a1 + 32) = v60 + 1;
          uint64_t v62 = a1 + 32LL * *(unsigned int *)(a1 + 712) + 2 * v25;
          *(_DWORD *)(a1 + 48 + 4 * v61) = v23 != 1;
          uint64_t v63 = *(void *)(a1 + 32);
          *(void *)(a1 + 264 + 8 * v63) = v62 + 28004;
          *(void *)(a1 + 32) = v63 + 1;
        }

        if ((_DWORD)v23 == 1)
        {
          int v58 = 9;
        }

        else
        {
          length(a1, a1 + 47664, v25, v23, *(_BYTE *)(a1 + 2932));
          int v58 = 8;
        }

        if (*(_DWORD *)(a1 + 712) >= 7u) {
          int v58 = 11;
        }
LABEL_50:
        *(_DWORD *)(a1 + 712) = v58;
        goto LABEL_51;
      }

      *uint64_t v30 = 0;
      uint64_t v49 = *(void *)(a1 + 32);
      *(void *)(a1 + 8 * v49 + 264) = v29;
      *(void *)(a1 + 32) = v49 + 1;
      match(a1, v25, v22 - 4, v23);
LABEL_51:
      *((_DWORD *)a2 + 7) -= v23;
      uint64_t v68 = *(void *)(a1 + 696);
      if (v68)
      {
        unint64_t v69 = *(void *)a1;
        uint64_t v70 = *(void *)(a1 + 8);
        LODWORD(v71) = *(_DWORD *)(a1 + 16);
        uint64_t v72 = *(void *)(a1 + 24);
        for (uint64_t j = *(void *)(a1 + 40); ; ++j)
        {
          if (!BYTE3(v71))
          {
            if (v69 >> 24 != 255)
            {
              if (v68 - v72 <= (unint64_t)(v70 - 1))
              {
LABEL_72:
                *(void *)(a1 + 32) = 0LL;
                goto LABEL_73;
              }

              v72 += v70;
              uint64_t v70 = 0LL;
            }

            ++v70;
            unint64_t v69 = ((_DWORD)v69 << 8);
            LODWORD(v71) = (_DWORD)v71 << 8;
          }

          if (j == *(void *)(a1 + 32)) {
            break;
          }
          switch(*(_DWORD *)(v20 + 4 * j - 216))
          {
            case 0:
              LODWORD(v71) = (v71 >> 11) * **(unsigned __int16 **)(v20 + 8 * j);
              break;
            case 1:
              uint64_t v74 = (v71 >> 11) * **(unsigned __int16 **)(v20 + 8 * j);
              v69 += v74;
              LODWORD(v71) = v71 - v74;
              break;
            case 2:
              LODWORD(v71) = v71 >> 1;
              break;
            case 3:
              uint64_t v71 = v71 >> 1;
              v69 += v71;
              break;
            default:
              continue;
          }
        }

        uint64_t v75 = 5LL;
        do
        {
          if (v69 >> 24 != 255)
          {
            v72 += v70;
            uint64_t v70 = 0LL;
          }

          ++v70;
          unint64_t v69 = ((_DWORD)v69 << 8);
          --v75;
        }

        while (v75);
      }

      *(void *)(a1 + 688) += v23;
      char v76 = rc_encode((unint64_t *)a1, a3, a4, a5);
      uint64_t result = 0LL;
      if ((v76 & 1) != 0) {
        return result;
      }
    }

    *uint64_t v27 = 0;
    uint64_t v40 = *(void *)(a1 + 32);
    *(void *)(a1 + 8 * v40 + 264) = v26;
    uint64_t v41 = v40 + 1;
    *(void *)(a1 + 32) = v41;
    unsigned int v42 = *((_DWORD *)a2 + 6) - *((_DWORD *)a2 + 7);
    unsigned int v43 = (*a2)[v42];
    uint64_t v44 = a1
        + 1536LL
        * (((*a2)[v42 - 1] >> (8 - *(_DWORD *)(a1 + 2940))) + ((*(_DWORD *)(a1 + 2944) & v24) << *(_DWORD *)(a1 + 2940)))
        + 2948;
    if (*(_DWORD *)(a1 + 712) > 6u)
    {
      int v50 = (*a2)[v42 + ~*(_DWORD *)(a1 + 716)];
      unsigned int v51 = v43 | 0x100;
      int v52 = 256;
      do
      {
        *(_DWORD *)(a1 + 4 * v41 + 48) = (v51 >> 7) & 1;
        uint64_t v53 = *(void *)(a1 + 32);
        *(void *)(a1 + 8 * v53 + 264) = v44 + 2LL * (v52 + (v51 >> 8) + (v52 & (2 * v50)));
        int v54 = (2 * v51) ^ (2 * v50);
        v50 *= 2;
        uint64_t v41 = v53 + 1;
        *(void *)(a1 + 32) = v41;
        v52 &= ~v54;
        BOOL v55 = v51 >= 0x8000;
        v51 *= 2;
      }

      while (!v55);
    }

    else
    {
      unsigned int v45 = 1;
      for (int k = 7; k != -1; --k)
      {
        *(_DWORD *)(a1 + 4 * v41 + 48) = (v43 >> k) & 1;
        uint64_t v47 = *(void *)(a1 + 32);
        *(void *)(a1 + 8 * v47 + 264) = v44 + 2LL * v45;
        uint64_t v41 = v47 + 1;
        *(void *)(a1 + 32) = v41;
        int v48 = (v43 >> k) & 1 | (2 * v45);
        unsigned int v45 = v48;
      }
    }

    unsigned int v56 = *(_DWORD *)(a1 + 712);
    int v57 = v56 - 6;
    if (v56 <= 9) {
      int v57 = v56 - 3;
    }
    if (v56 >= 4) {
      int v58 = v57;
    }
    else {
      int v58 = 0;
    }
    goto LABEL_50;
  }

  return result;
}

uint64_t rc_encode(unint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  unint64_t v4 = a1[5];
  if (v4 < a1[4])
  {
    LODWORD(v5) = *((_DWORD *)a1 + 4);
    while (2)
    {
      if (!BYTE3(v5))
      {
        unint64_t v6 = *a1;
        if (*a1 >> 24 != 255)
        {
          uint64_t v8 = *a3;
          while (v8 != a4)
          {
            *(_BYTE *)(a2 + v8) = *((_BYTE *)a1 + 20) + *((_BYTE *)a1 + 4);
            uint64_t v8 = *a3 + 1;
            *a3 = v8;
            ++a1[3];
            *((_BYTE *)a1 + 20) = -1;
            uint64_t v9 = a1[1] - 1;
            a1[1] = v9;
            if (!v9)
            {
              unint64_t v6 = *a1;
              *((_BYTE *)a1 + 20) = BYTE3(*a1);
              LODWORD(v5) = *((_DWORD *)a1 + 4);
              unint64_t v4 = a1[5];
              uint64_t v7 = 1LL;
              goto LABEL_10;
            }
          }

          return 1LL;
        }

        uint64_t v7 = a1[1] + 1;
LABEL_10:
        *a1 = ((_DWORD)v6 << 8);
        a1[1] = v7;
        LODWORD(v5) = (_DWORD)v5 << 8;
        *((_DWORD *)a1 + 4) = v5;
      }

      switch(*((_DWORD *)a1 + v4 + 12))
      {
        case 0:
          int v10 = (_WORD *)a1[v4 + 33];
          int v11 = (unsigned __int16)*v10;
          LODWORD(v5) = (v5 >> 11) * v11;
          *((_DWORD *)a1 + 4) = v5;
          unsigned int v12 = v11 + ((2048 - v11) >> 5);
          goto LABEL_14;
        case 1:
          int v10 = (_WORD *)a1[v4 + 33];
          unsigned int v13 = (unsigned __int16)*v10;
          uint64_t v14 = (v5 >> 11) * v13;
          *a1 += v14;
          LODWORD(v5) = v5 - v14;
          *((_DWORD *)a1 + 4) = v5;
          unsigned int v12 = v13 - (v13 >> 5);
LABEL_14:
          *int v10 = v12;
          goto LABEL_17;
        case 2:
          LODWORD(v5) = v5 >> 1;
          *((_DWORD *)a1 + 4) = v5;
          goto LABEL_17;
        case 3:
          uint64_t v5 = v5 >> 1;
          *((_DWORD *)a1 + 4) = v5;
          *a1 += v5;
          goto LABEL_17;
        case 4:
          *((_DWORD *)a1 + 4) = -1;
          unint64_t v16 = *a1;
          break;
        default:
LABEL_17:
          a1[5] = ++v4;
          if (v4 >= a1[4]) {
            goto LABEL_18;
          }
          continue;
      }

      break;
    }

    while (v16 >> 24 == 255)
    {
      uint64_t v17 = a1[1] + 1;
LABEL_26:
      unint64_t v16 = ((_DWORD)v16 << 8);
      *a1 = v16;
      a1[1] = v17;
      a1[5] = ++v4;
      if (v4 >= a1[4])
      {
        uint64_t v15 = 0LL;
        *(_OWORD *)a1 = xmmword_18116F5C0;
        *((_DWORD *)a1 + 4) = -1;
        *((_BYTE *)a1 + 20) = 0;
        a1[4] = 0LL;
        a1[5] = 0LL;
        a1[3] = 0LL;
        return v15;
      }
    }

    uint64_t v18 = *a3;
    while (v18 != a4)
    {
      *(_BYTE *)(a2 + v18) = *((_BYTE *)a1 + 20) + *((_BYTE *)a1 + 4);
      uint64_t v18 = *a3 + 1;
      *a3 = v18;
      ++a1[3];
      *((_BYTE *)a1 + 20) = -1;
      uint64_t v19 = a1[1] - 1;
      a1[1] = v19;
      if (!v19)
      {
        unint64_t v16 = *a1;
        *((_BYTE *)a1 + 20) = BYTE3(*a1);
        unint64_t v4 = a1[5];
        uint64_t v17 = 1LL;
        goto LABEL_26;
      }
    }

    return 1LL;
  }

LABEL_18:
  uint64_t v15 = 0LL;
  a1[4] = 0LL;
  a1[5] = 0LL;
  return v15;
}

uint64_t lzma_lzma_encoder_reset(uint64_t a1, _DWORD *a2)
{
  if (!is_options_valid(a2)) {
    return 8LL;
  }
  int v4 = -1 << a2[7];
  *(_DWORD *)(a1 + 2936) = ~v4;
  int v5 = a2[6];
  *(_DWORD *)(a1 + 2940) = a2[5];
  *(_DWORD *)(a1 + 2944) = ~(-1 << v5);
  *(_OWORD *)a1 = xmmword_18116F5C0;
  *(_DWORD *)(a1 + 16) = -1;
  *(_BYTE *)(a1 + 20) = 0;
  *(void *)(a1 + 24) = 0LL;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 712) = 0u;
  *(_DWORD *)(a1 + 728) = 0;
  int v6 = a2[6] + a2[5];
  unsigned int v7 = 1;
  do
    memset_pattern16((void *)(a1 + 2948 + 1536LL * (v7 - 1)), &unk_18116F5E0, 0x600uLL);
  while (!(v7++ >> v6));
  uint64_t v9 = 0LL;
  int v10 = (_WORD *)(a1 + 27524);
  do
  {
    int v11 = v10;
    uint64_t v12 = -v4;
    do
    {
      *int v11 = 1024;
      v11[240] = 1024;
      ++v11;
      --v12;
    }

    while (v12);
    unsigned int v13 = (_WORD *)(a1 + 2 * v9);
    v13[13954] = 1024;
    v13[13966] = 1024;
    ++v9;
    v10 += 16;
    v13[13978] = 1024;
    v13[13990] = 1024;
  }

  while (v9 != 12);
  memset_pattern16((void *)(a1 + 28900), &unk_18116F5E0, 0xE4uLL);
  for (uint64_t i = 0LL; i != 512; i += 128LL)
    memset_pattern16((void *)(a1 + 28388 + i), &unk_18116F5E0, 0x80uLL);
  memset_pattern16((void *)(a1 + 29128), &unk_18116F5E0, 0x20uLL);
  length_encoder_reset((_DWORD *)(a1 + 29160), 1 << a2[7], *(_BYTE *)(a1 + 2932));
  length_encoder_reset((_DWORD *)(a1 + 47664), 1 << a2[7], *(_BYTE *)(a1 + 2932));
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 69244) = 0x7FFFFFFF;
  *(void *)(a1 + 69312) = 0x7FFFFFFFLL;
  *(_DWORD *)(a1 + 69320) = 0;
  return result;
}

BOOL is_options_valid(_DWORD *a1)
{
  unsigned int v1 = a1[5];
  if (v1 > 4) {
    return 0LL;
  }
  unsigned int v2 = a1[6];
  unsigned int v3 = v2 + v1;
  if (v2 <= 4)
  {
    BOOL v4 = v3 >= 4;
    BOOL v5 = v3 == 4;
  }

  else
  {
    BOOL v4 = 1;
    BOOL v5 = 0;
  }

  return (v5 || !v4) && a1[7] <= 4u && (a1[9] - 2) <= 0x10F && (a1[8] - 1) < 2;
}

void length_encoder_reset(_DWORD *a1, unsigned int a2, char a3)
{
  *a1 = 67109888;
  if (a2)
  {
    unint64_t v6 = 0LL;
    uint64_t v7 = 16LL * a2;
    do
    {
      memset_pattern16(&a1[v6 / 4 + 1], &unk_18116F5E0, 0x10uLL);
      memset_pattern16(&a1[v6 / 4 + 65], &unk_18116F5E0, 0x10uLL);
      v6 += 16LL;
    }

    while (v7 != v6);
    memset_pattern16(a1 + 129, &unk_18116F5E0, 0x200uLL);
    if ((a3 & 1) == 0)
    {
      unsigned int v8 = 0;
      do
        length_update_prices((uint64_t)a1, v8++);
      while (a2 != v8);
    }
  }

  else
  {
    memset_pattern16(a1 + 129, &unk_18116F5E0, 0x200uLL);
  }

uint64_t lzma_lzma_encoder_create(void **a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  uint64_t v9 = *a1;
  if (!v9)
  {
    uint64_t v9 = lzma_alloc(0x3CED0uLL, a2);
    *a1 = v9;
    if (!v9) {
      return 5LL;
    }
  }

  unsigned int v10 = a4[8];
  if (v10 == 2)
  {
    *((_BYTE *)v9 + 2932) = 0;
    if (*a4 > 0x60000000) {
      return 8LL;
    }
    int v11 = 0;
    int v12 = -2;
    do
    {
      unsigned int v13 = 1 << v11++;
      v12 += 2;
    }

    while (v13 < *a4);
    *((_DWORD *)v9 + 17310) = v12;
    unsigned int v14 = a4[10] & 0xF;
    if (v14 <= a4[9]) {
      unsigned int v14 = a4[9];
    }
    unsigned int v15 = v14 - 1;
    *((_DWORD *)v9 + 11899) = v15;
    *((_DWORD *)v9 + 16525) = v15;
  }

  else
  {
    if (v10 != 1) {
      return 8LL;
    }
    *((_BYTE *)v9 + 2932) = 1;
  }

  uint64_t v16 = *((void *)a4 + 1);
  if (v16) {
    BOOL v17 = a4[4] != 0;
  }
  else {
    BOOL v17 = 0;
  }
  *((_BYTE *)v9 + 2933) = v17;
  *((_BYTE *)v9 + 2934) = 0;
  *((void *)v9 + 86) = 0LL;
  *((void *)v9 + 88) = 0LL;
  *((void *)v9 + 87) = 0LL;
  *((_BYTE *)v9 + 2935) = a3 == 0x4000000000000001LL;
  if (a3 != 0x4000000000000002LL) {
    goto LABEL_18;
  }
  unsigned int v18 = a4[12];
  if (v18 > 1) {
    return 8LL;
  }
  *((_BYTE *)v9 + 2935) = v18;
LABEL_18:
  uint64_t v19 = *a4;
  *(void *)a5 = 4096LL;
  *(void *)(a5 + 8) = v19;
  *(_OWORD *)(a5 + 16) = xmmword_18116F5D0;
  LODWORD(v20) = a4[9];
  uint64_t v21 = *((void *)a4 + 5);
  *(void *)(a5 + 40) = v21;
  else {
    uint64_t v20 = v21 & 0xF;
  }
  *(void *)(a5 + 32) = v20;
  *(void *)(a5 + 48) = v16;
  *(_DWORD *)(a5 + 56) = a4[4];
  return lzma_lzma_encoder_reset((uint64_t)v9, a4);
}

uint64_t lzma_lzma_encoder_init(void *a1, void *a2, void *a3)
{
  return lzma_lz_encoder_init( a1,  a2,  a3,  (uint64_t (*)(void *, void *, void, void, uint64_t *))lzma_encoder_init);
}

uint64_t lzma_encoder_init(void **a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  a1[1] = lzma_encode;
  a1[4] = lzma_lzma_set_out_limit;
  return lzma_lzma_encoder_create(a1, a2, a3, a4, a5);
}

uint64_t lzma_lzma_encoder_memusage(unsigned int *a1)
{
  if (!is_options_valid(a1)) {
    return -1LL;
  }
  uint64_t v2 = *a1;
  v7[0] = 4096LL;
  v7[1] = v2;
  __int128 v8 = xmmword_18116F5D0;
  LODWORD(v3) = a1[9];
  uint64_t v10 = *((void *)a1 + 5);
  else {
    uint64_t v3 = v10 & 0xF;
  }
  uint64_t v4 = *((void *)a1 + 1);
  uint64_t v9 = v3;
  uint64_t v11 = v4;
  unsigned int v12 = a1[4];
  unint64_t v5 = lzma_lz_encoder_memusage(v7);
  if (v5 == -1LL) {
    return -1LL;
  }
  else {
    return v5 + 249552;
  }
}

uint64_t lzma_lzma_lclppb_encode(_DWORD *a1, _BYTE *a2)
{
  unsigned int v2 = a1[5];
  if (v2 > 4) {
    return 1LL;
  }
  unsigned int v3 = a1[6];
  if (v3 > 4 || v3 + v2 > 4) {
    return 1LL;
  }
  unsigned int v5 = a1[7];
  if (v5 > 4) {
    return 1LL;
  }
  uint64_t result = 0LL;
  *a2 = 9 * (5 * v5 + v3) + v2;
  return result;
}

uint64_t lzma_lzma_props_encode(_DWORD *a1, uint64_t a2)
{
  if (!a1) {
    return 11LL;
  }
  unsigned int v3 = a1[5];
  if (v3 > 4) {
    return 11LL;
  }
  unsigned int v4 = a1[6];
  if (v4 > 4 || v4 + v3 > 4) {
    return 11LL;
  }
  unsigned int v6 = a1[7];
  if (v6 > 4) {
    return 11LL;
  }
  uint64_t result = 0LL;
  *(_BYTE *)a2 = 9 * (5 * v6 + v4) + v3;
  *(_DWORD *)(a2 + 1) = *a1;
  return result;
}

BOOL lzma_mode_is_supported(int a1)
{
  return (a1 - 1) < 2;
}

double match(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v7 = (_DWORD *)(a1 + 69244);
  if (*(_DWORD *)(a1 + 712) >= 7u) {
    int v8 = 10;
  }
  else {
    int v8 = 7;
  }
  *(_DWORD *)(a1 + 712) = v8;
  length(a1, a1 + 29160, a2, a4, *(_BYTE *)(a1 + 2932));
  if (a3 >> 13)
  {
    if (a3 >> 25) {
      unsigned int v9 = lzma_fastpos[(unint64_t)a3 >> 24] + 48;
    }
    else {
      unsigned int v9 = lzma_fastpos[(unint64_t)a3 >> 12] + 24;
    }
  }

  else
  {
    unsigned int v9 = lzma_fastpos[a3];
  }

  uint64_t v10 = (double *)(a1 + 716);
  LODWORD(v11) = a4 - 2;
  if (a4 >= 6) {
    uint64_t v11 = 3LL;
  }
  else {
    uint64_t v11 = v11;
  }
  uint64_t v12 = a1 + (v11 << 7) + 28388;
  uint64_t v13 = *(void *)(a1 + 32);
  unsigned int v14 = 1;
  for (int i = 5; i != -1; --i)
  {
    *(_DWORD *)(a1 + 4 * v13 + 48) = (v9 >> i) & 1;
    uint64_t v16 = *(void *)(a1 + 32);
    *(void *)(a1 + 8 * v16 + 264) = v12 + 2LL * v14;
    uint64_t v13 = v16 + 1;
    *(void *)(a1 + 32) = v13;
    int v17 = (v9 >> i) & 1 | (2 * v14);
    unsigned int v14 = v17;
  }

  if (v9 >= 4)
  {
    int v18 = (v9 >> 1) - 1;
    unsigned int v19 = (v9 & 1 | 2) << ((v9 >> 1) - 1);
    unsigned int v20 = a3 - v19;
    if (v9 > 0xD)
    {
      int v24 = (v9 >> 1) - 6;
      do
      {
        uint64_t v25 = *(void *)(a1 + 32);
        *(void *)(a1 + 32) = v25 + 1;
        *(_DWORD *)(a1 + 4 * v25 + 48) = (v20 >> 4 >> v24--) & 1 | 2;
      }

      while (v24 != -1);
      unsigned int v26 = v20 & 0xF;
      uint64_t v27 = *(void *)(a1 + 32);
      unsigned int v28 = 1;
      int v29 = -4;
      do
      {
        *(_DWORD *)(a1 + 4 * v27 + 48) = v26 & 1;
        uint64_t v30 = *(void *)(a1 + 32);
        *(void *)(a1 + 8 * v30 + 264) = a1 + 29128 + 2LL * v28;
        uint64_t v27 = v30 + 1;
        *(void *)(a1 + 32) = v27;
        unsigned int v28 = v26 & 1 | (2 * v28);
        v26 >>= 1;
      }

      while (!__CFADD__(v29++, 1));
      ++v7[17];
    }

    else
    {
      uint64_t v21 = a1 + 2LL * v19 - 2LL * v9 + 28898;
      unsigned int v22 = 1;
      do
      {
        *(_DWORD *)(a1 + 4 * v13 + 48) = v20 & 1;
        uint64_t v23 = *(void *)(a1 + 32);
        *(void *)(a1 + 8 * v23 + 264) = v21 + 2LL * v22;
        uint64_t v13 = v23 + 1;
        *(void *)(a1 + 32) = v13;
        unsigned int v22 = v20 & 1 | (2 * v22);
        v20 >>= 1;
        --v18;
      }

      while (v18);
    }
  }

  *(_DWORD *)(a1 + 728) = *(_DWORD *)(a1 + 724);
  double result = *v10;
  *(double *)(a1 + 720) = *v10;
  *(_DWORD *)(a1 + 716) = a3;
  ++*v7;
  return result;
}

uint64_t length(uint64_t result, uint64_t a2, unsigned int a3, int a4, char a5)
{
  unsigned int v5 = a4 - 2;
  unsigned int v6 = (_DWORD *)(result + 4LL * *(void *)(result + 32) + 48);
  if ((a4 - 2) > 7)
  {
    unsigned int v13 = 1;
    *unsigned int v6 = 1;
    uint64_t v14 = *(void *)(result + 32);
    *(void *)(result + 8 * v14 + 264) = a2;
    uint64_t v15 = v14 + 1;
    *(void *)(result + 32) = v14 + 1;
    unsigned int v16 = a4 - 10;
    uint64_t v17 = a2 + 2;
    int v18 = (_DWORD *)(result + 4 * v15 + 48);
    if ((a4 - 10) > 7)
    {
      _DWORD *v18 = 1;
      uint64_t v25 = *(void *)(result + 32);
      *(void *)(result + 8 * v25 + 264) = v17;
      uint64_t v26 = v25 + 1;
      *(void *)(result + 32) = v25 + 1;
      unsigned int v27 = a4 - 18;
      for (int i = 7; i != -1; --i)
      {
        *(_DWORD *)(result + 4 * v26 + 48) = (v27 >> i) & 1;
        uint64_t v29 = *(void *)(result + 32);
        *(void *)(result + 8 * v29 + 264) = a2 + 516 + 2LL * v13;
        uint64_t v26 = v29 + 1;
        *(void *)(result + 32) = v26;
        int v30 = (v27 >> i) & 1 | (2 * v13);
        unsigned int v13 = v30;
      }
    }

    else
    {
      _DWORD *v18 = 0;
      uint64_t v19 = *(void *)(result + 32);
      *(void *)(result + 8 * v19 + 264) = v17;
      uint64_t v20 = v19 + 1;
      *(void *)(result + 32) = v19 + 1;
      unsigned int v21 = 1;
      for (int j = 2; j != -1; --j)
      {
        *(_DWORD *)(result + 4 * v20 + 48) = (v16 >> j) & 1;
        uint64_t v23 = *(void *)(result + 32);
        *(void *)(result + 8 * v23 + 264) = a2 + 16LL * a3 + 260 + 2LL * v21;
        uint64_t v20 = v23 + 1;
        *(void *)(result + 32) = v20;
        int v24 = (v16 >> j) & 1 | (2 * v21);
        unsigned int v21 = v24;
      }
    }
  }

  else
  {
    *unsigned int v6 = 0;
    uint64_t v7 = *(void *)(result + 32);
    *(void *)(result + 8 * v7 + 264) = a2;
    uint64_t v8 = v7 + 1;
    *(void *)(result + 32) = v7 + 1;
    unsigned int v9 = 1;
    for (int k = 2; k != -1; --k)
    {
      *(_DWORD *)(result + 4 * v8 + 48) = (v5 >> k) & 1;
      uint64_t v11 = *(void *)(result + 32);
      *(void *)(result + 8 * v11 + 264) = a2 + 16LL * a3 + 4 + 2LL * v9;
      uint64_t v8 = v11 + 1;
      *(void *)(result + 32) = v8;
      int v12 = (v5 >> k) & 1 | (2 * v9);
      unsigned int v9 = v12;
    }
  }

  if ((a5 & 1) == 0)
  {
    uint64_t v31 = a2 + 4LL * a3;
    int v32 = *(_DWORD *)(v31 + 18440) - 1;
    *(_DWORD *)(v31 + 18440) = v32;
    if (!v32) {
      return length_update_prices(a2, a3);
    }
  }

  return result;
}

uint64_t length_update_prices(uint64_t result, unsigned int a2)
{
  uint64_t v2 = *(unsigned int *)(result + 18436);
  *(_DWORD *)(result + 4LL * a2 + 18440) = v2;
  unint64_t v3 = (unint64_t)*(unsigned __int16 *)result >> 4;
  int v4 = lzma_rc_prices[v3 ^ 0x7F];
  unint64_t v5 = (unint64_t)*(unsigned __int16 *)(result + 2) >> 4;
  int v6 = lzma_rc_prices[v5];
  int v7 = lzma_rc_prices[v5 ^ 0x7F];
  uint64_t v8 = result + 1088LL * a2 + 1028;
  else {
    uint64_t v9 = v2;
  }
  if ((_DWORD)v9)
  {
    uint64_t v10 = 0LL;
    int v11 = lzma_rc_prices[v3];
    do
    {
      int v12 = 0;
      unsigned int v13 = v10 + 8;
      do
      {
        unsigned int v14 = v13 >> 1;
        if ((v13 & 1) != 0) {
          uint64_t v15 = 2032LL;
        }
        else {
          uint64_t v15 = 0LL;
        }
        v12 += lzma_rc_prices[(v15 ^ (unint64_t)*(unsigned __int16 *)(result + 16LL * a2 + 4 + 2 * v14)) >> 4];
        v13 >>= 1;
      }

      while (v14 != 1);
      *(_DWORD *)(v8 + 4 * v10++) = v12 + v11;
    }

    while (v10 != v9);
  }

  else {
    uint64_t v16 = v2;
  }
  if (v9 < v16)
  {
    int v17 = v6 + v4;
    uint64_t v18 = result + 16LL * a2 + 260;
    do
    {
      int v19 = 0;
      unsigned int v20 = v9;
      do
      {
        unsigned int v21 = v20 >> 1;
        if ((v20 & 1) != 0) {
          uint64_t v22 = 2032LL;
        }
        else {
          uint64_t v22 = 0LL;
        }
        v19 += lzma_rc_prices[(v22 ^ (unint64_t)*(unsigned __int16 *)(v18 + 2 * v21)) >> 4];
        v20 >>= 1;
      }

      while (v21 != 1);
      *(_DWORD *)(v8 + 4 * v9++) = v17 + v19;
    }

    while (v9 != v16);
    LODWORD(v9) = v16;
  }

  if (v9 < v2)
  {
    int v23 = v7 + v4;
    uint64_t v24 = result + 516;
    uint64_t v9 = v9;
    do
    {
      int v25 = 0;
      unsigned int v26 = v9 + 240;
      do
      {
        unsigned int v27 = v26 >> 1;
        if ((v26 & 1) != 0) {
          double result = 2032LL;
        }
        else {
          double result = 0LL;
        }
        v25 += lzma_rc_prices[(result ^ (unint64_t)*(unsigned __int16 *)(v24 + 2 * v27)) >> 4];
        v26 >>= 1;
      }

      while (v27 != 1);
      *(_DWORD *)(v8 + 4 * v9++) = v23 + v25;
    }

    while (v9 != v2);
  }

  return result;
}

uint64_t lzma_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (*(_DWORD *)(a2 + 104) == 1) {
    return 8LL;
  }
  else {
    return lzma_lzma_encode(a1, (unsigned __int8 **)a2, a3, a4, a5, 0xFFFFFFFF);
  }
}

uint64_t lzma_lzma_set_out_limit(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < 6) {
    return 10LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 696) = a3;
  *(void *)(a1 + 704) = a2;
  *(_BYTE *)(a1 + 2935) = 0;
  return result;
}

uint64_t lzma_lzma_preset(uint64_t a1, int a2)
{
  uint64_t v2 = a2 & 0x1F;
  uint64_t v3 = 1LL;
  if ((a2 & 0x1Fu) <= 9 && (a2 & 0x7FFFFFE0) == 0)
  {
    *(void *)(a1 + 8) = 0LL;
    *(_OWORD *)(a1 + 16) = xmmword_18116F600;
    *(_DWORD *)a1 = 1 << lzma_lzma_preset_dict_pow2[v2];
    if (v2 > 3)
    {
      int v7 = 0;
      if ((_DWORD)v2 == 5) {
        int v9 = 32;
      }
      else {
        int v9 = 64;
      }
      if ((_DWORD)v2 == 4) {
        int v6 = 16;
      }
      else {
        int v6 = v9;
      }
      int v5 = 20;
      int v8 = 2;
    }

    else
    {
      if ((a2 & 0x1F) != 0) {
        int v5 = 4;
      }
      else {
        int v5 = 3;
      }
      else {
        int v6 = 128;
      }
      int v7 = lzma_lzma_preset_depths[v2];
      int v8 = 1;
    }

    *(_DWORD *)(a1 + 32) = v8;
    *(_DWORD *)(a1 + 36) = v6;
    *(_DWORD *)(a1 + 40) = v5;
    *(_DWORD *)(a1 + 44) = v7;
    if (a2 < 0)
    {
      int v10 = 0;
      *(_DWORD *)(a1 + 32) = 2;
      *(_DWORD *)(a1 + 40) = 20;
      int v11 = 192;
      if ((_DWORD)v2 != 3 && (_DWORD)v2 != 5)
      {
        int v10 = 512;
        int v11 = 273;
      }

      uint64_t v3 = 0LL;
      *(_DWORD *)(a1 + 36) = v11;
      *(_DWORD *)(a1 + 44) = v10;
    }

    else
    {
      return 0LL;
    }
  }

  return v3;
}

uint64_t lzma_outq_memusage(unint64_t a1, unsigned int a2)
{
  if (a2 <= 0x4000 && HIWORD(a1) == 0) {
    return (a1 + 64) * 2 * a2;
  }
  else {
    return -1LL;
  }
}

uint64_t *lzma_outq_clear_cache(uint64_t a1, uint64_t a2)
{
  for (uint64_t result = *(uint64_t **)(a1 + 24); result; uint64_t result = *(uint64_t **)(a1 + 24))
  {
    uint64_t v5 = *result;
    --*(_DWORD *)(a1 + 52);
    uint64_t v6 = *(void *)(a1 + 32) - result[2] - 64;
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = v6;
    lzma_free(result, a2);
  }

  return result;
}

void lzma_outq_clear_cache2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(uint64_t **)(a1 + 24);
  if (v4)
  {
    while (1)
    {
      uint64_t v7 = *v4;
      if (!*v4) {
        break;
      }
      --*(_DWORD *)(a1 + 52);
      uint64_t v8 = *(void *)(a1 + 32) - v4[2] - 64;
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = v8;
      lzma_free(v4, a2);
      int v4 = *(uint64_t **)(a1 + 24);
    }

    uint64_t v9 = v4[2];
    if (v9 != a3)
    {
      --*(_DWORD *)(a1 + 52);
      uint64_t v10 = *(void *)(a1 + 32) - v9 - 64;
      *(void *)(a1 + 24) = 0LL;
      *(void *)(a1 + 32) = v10;
      lzma_free(v4, a2);
    }
  }

uint64_t lzma_outq_init(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 > 0x4000) {
    return 8LL;
  }
  unsigned int v6 = 2 * a3;
  while (*(void *)a1)
    move_head_to_cache((uint64_t *)a1, a2);
  while (1)
  {
    unsigned int v11 = *(_DWORD *)(a1 + 52);
    if (v6 >= v11) {
      break;
    }
    uint64_t v7 = *(uint64_t **)(a1 + 24);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *v7;
    *(_DWORD *)(a1 + 52) = v11 - 1;
    uint64_t v10 = v8 - v7[2] - 64;
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 32) = v10;
    lzma_free(v7, a2);
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 56) = v6;
  *(void *)(a1 + 16) = 0LL;
  return result;
}

uint64_t *move_head_to_cache(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v3 = (void *)*result;
  uint64_t v4 = *(void *)*result;
  *uint64_t result = v4;
  if (!v4) {
    result[1] = 0LL;
  }
  uint64_t v5 = result[3];
  if (v5 && *(void *)(v5 + 16) != v3[2])
  {
    uint64_t result = lzma_outq_clear_cache((uint64_t)result, a2);
    uint64_t v5 = v2[3];
  }

  void *v3 = v5;
  v2[3] = (uint64_t)v3;
  --*((_DWORD *)v2 + 12);
  v2[5] = v2[5] - v3[2] - 64;
  return result;
}

uint64_t *lzma_outq_end(uint64_t *a1, uint64_t a2)
{
  while (*a1)
    move_head_to_cache(a1, a2);
  return lzma_outq_clear_cache((uint64_t)a1, a2);
}

uint64_t lzma_outq_prealloc_buf(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 && *(void *)(v6 + 16) == a3) {
    return 0LL;
  }
  if (a3 > 0xFFFFFFFFFFFFFFBFLL) {
    return 5LL;
  }
  unint64_t v8 = a3 + 64;
  lzma_outq_clear_cache(a1, a2);
  uint64_t v9 = lzma_alloc(a3 + 64, a2);
  *(void *)(a1 + 24) = v9;
  if (!v9) {
    return 5LL;
  }
  uint64_t v10 = v9;
  uint64_t result = 0LL;
  *uint64_t v10 = 0LL;
  v10[2] = a3;
  ++*(_DWORD *)(a1 + 52);
  *(void *)(a1 + 32) += v8;
  return result;
}

uint64_t lzma_outq_get_buf(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)v2;
  *(void *)uint64_t v2 = 0LL;
  uint64_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    uint64_t v3 = (void *)a1;
  }
  void *v3 = v2;
  *(void *)(a1 + 8) = v2;
  *(void *)(v2 + 8) = a2;
  *(_BYTE *)(v2 + 40) = 0;
  *(_DWORD *)(v2 + 44) = 1;
  *(void *)(v2 + 24) = 0LL;
  *(void *)(v2 + 32) = 0LL;
  *(void *)(v2 + 48) = 0LL;
  *(void *)(v2 + 56) = 0LL;
  ++*(_DWORD *)(a1 + 48);
  *(void *)(a1 + 40) += *(void *)(v2 + 16) + 64LL;
  return v2;
}

BOOL lzma_outq_is_readable(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (!*a1) {
    return 0LL;
  }
  return 1LL;
}

uint64_t lzma_outq_read(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, void *a6, void *a7)
{
  if (!*((_DWORD *)a1 + 12)) {
    return 0LL;
  }
  unsigned int v11 = a1 + 2;
  uint64_t v12 = *a1;
  lzma_bufcpy(*a1 + 64, a1 + 2, *(void *)(*a1 + 24), a3, a4, a5);
  if (!*(_BYTE *)(v12 + 40) || *v11 < *(void *)(v12 + 24)) {
    return 0LL;
  }
  if (a6) {
    *a6 = *(void *)(v12 + 48);
  }
  if (a7) {
    *a7 = *(void *)(v12 + 56);
  }
  uint64_t v13 = *(unsigned int *)(v12 + 44);
  move_head_to_cache(a1, a2);
  a1[2] = 0LL;
  return v13;
}

void *lzma_outq_enable_partial_output(void *result, uint64_t (*a2)(void))
{
  uint64_t v2 = *result;
  if (*result && !*(_BYTE *)(v2 + 40))
  {
    uint64_t v3 = result;
    uint64_t result = *(void **)(v2 + 8);
    if (result)
    {
      uint64_t result = (void *)a2();
      *(void *)(*v3 + 8LL) = 0LL;
    }
  }

  return result;
}

uint64_t lzma_lzma_optimum_fast(uint64_t result, uint64_t a2, _DWORD *a3, unsigned int *a4)
{
  uint64_t v7 = result;
  unsigned int v8 = *(_DWORD *)(a2 + 96);
  if (*(_DWORD *)(a2 + 28))
  {
    unsigned int v9 = *(_DWORD *)(result + 2928);
    unsigned int v38 = *(_DWORD *)(result + 2924);
  }

  else
  {
    uint64_t result = lzma_mf_find(a2, &v38, result + 732);
    unsigned int v9 = result;
  }

  uint64_t v10 = *(unsigned int *)(a2 + 24);
  int v11 = *(_DWORD *)(a2 + 36) - v10;
  else {
    unint64_t v12 = 273LL;
  }
  if (v12 >= 2)
  {
    uint64_t v13 = 0LL;
    unsigned int v14 = 0;
    int v15 = 0;
    uint64_t v16 = (char *)(*(void *)a2 + v10);
    do
    {
      uint64_t v17 = *(unsigned int *)(v7 + 4 * v13 + 716);
      if (*(unsigned __int16 *)(v16 - 1) == *(unsigned __int16 *)&v16[-v17 - 2])
      {
        if ((_DWORD)v12 == 2)
        {
          unsigned int v18 = 2;
        }

        else
        {
          uint64_t v19 = 0LL;
          unsigned int v20 = &v16[-v17];
          while (1)
          {
            uint64_t result = *(unsigned int *)&v20[v19];
            unsigned int v21 = *(_DWORD *)&v16[v19 + 1] - result;
            if (v21) {
              break;
            }
            unint64_t v22 = v19 + 6;
            v19 += 4LL;
            if (v22 >= v12)
            {
              unsigned int v18 = v12;
              goto LABEL_22;
            }
          }

          int v23 = v19 + 2;
          int v24 = v19 + 4;
          uint64_t result = HIWORD(v21);
          if ((_WORD)v21)
          {
            int v24 = v23;
            char v25 = v21;
          }

          else
          {
            char v25 = BYTE2(v21);
          }

          unsigned int v18 = v24 | (v25 == 0);
        }

uint64_t lzma_lzma_optimum_normal(uint64_t result, uint64_t a2, unsigned int *a3, unsigned int *a4, int a5)
{
  uint64_t v5 = a3;
  uint64_t v6 = result;
  uint64_t v325 = *MEMORY[0x1895F89C0];
  uint64_t v7 = (unsigned int *)(result + 67208);
  unsigned int v8 = *(_DWORD *)(result + 69320);
  if (*(_DWORD *)(result + 69316) != v8)
  {
    int v13 = *(_DWORD *)(result + 44LL * v8 + 69344);
    unsigned int v12 = *(_DWORD *)(result + 44LL * v8 + 69348);
    *a4 = v13 - v8;
    *a3 = v12;
    *(_DWORD *)(result + 69320) = v13;
    return result;
  }

  if (*(_DWORD *)(a2 + 28))
  {
    unsigned int v10 = *(_DWORD *)(a2 + 96);
    unsigned int v11 = *(_DWORD *)(result + 2928);
    int v323 = *(_DWORD *)(result + 2924);
  }

  else
  {
    if (*(_DWORD *)(result + 69244) >= 0x80u)
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = result + 66224;
      do
      {
        uint64_t v16 = (_OWORD *)(v6 + (v14 << 8) + 66168);
        if (v7[508])
        {
          unint64_t v17 = 0LL;
          do
          {
            int v18 = 0;
            unsigned int v19 = v17 + 64;
            do
            {
              unsigned int v20 = v19 >> 1;
              if ((v19 & 1) != 0) {
                uint64_t v21 = 2032LL;
              }
              else {
                uint64_t v21 = 0LL;
              }
              v18 += lzma_rc_prices[(v21 ^ (unint64_t)*(unsigned __int16 *)(v6 + (v14 << 7) + 28388 + 2 * v20)) >> 4];
              v19 >>= 1;
            }

            while (v20 != 1);
            *((_DWORD *)v16 + v17++) = v18;
            unint64_t v22 = v7[508];
          }

          while (v17 < v22);
          if (v22 >= 0xF)
          {
            uint64_t v23 = 0LL;
            int v24 = 112;
            do
            {
              *(_DWORD *)(v15 + 4 * v23) = *(_DWORD *)(v15 + 4 * v23) + (v24 & 0xFFFFFFF0) - 80;
              unint64_t v25 = v23 + 15;
              ++v23;
              v24 += 8;
            }

            while (v25 < v7[508]);
          }
        }

        *(_OWORD *)(v6 + (v14++ << 9) + 67192) = *v16;
        v15 += 256LL;
      }

      while (v14 != 4);
      uint64_t v26 = 4u;
      unsigned int v27 = v7;
      do
      {
        int v28 = 0;
        uint64_t v29 = lzma_fastpos[v26];
        unsigned int v30 = (v29 >> 1) - 1;
        unsigned int v31 = (lzma_fastpos[v26] & 1 | 2) << ((lzma_fastpos[v26] >> 1) - 1);
        uint64_t v32 = v6 + 28900 + 2LL * v31 - 2 * v29 - 2;
        unsigned int v33 = v26 - v31;
        unsigned int v34 = 1;
        do
        {
          int v35 = v33 & 1;
          v33 >>= 1;
          if (v35) {
            uint64_t v36 = 2032LL;
          }
          else {
            uint64_t v36 = 0LL;
          }
          v28 += lzma_rc_prices[(v36 ^ (unint64_t)*(unsigned __int16 *)(v32 + 2LL * v34)) >> 4];
          unsigned int v34 = v35 | (2 * v34);
          --v30;
        }

        while (v30);
        uint64_t v37 = 0LL;
        uint64_t v38 = v6 + 66168 + 4 * v29;
        uint64_t v39 = v27;
        do
        {
          *uint64_t v39 = *(_DWORD *)(v38 + v37) + v28;
          v37 += 256LL;
          v39 += 128;
        }

        while (v37 != 1024);
        ++v26;
        ++v27;
      }

      while (v26 != 128);
      v7[509] = 0;
    }

    uint64_t v40 = v5;
    uint64_t v41 = a4;
    if (v7[526] >= 0x10)
    {
      for (uint64_t i = 0LL; i != 16; ++i)
      {
        int v43 = 0;
        unsigned int v44 = 1;
        int v45 = -4;
        unsigned int v46 = i;
        do
        {
          int v47 = v46 & 1;
          v46 >>= 1;
          if (v47) {
            uint64_t v48 = 2032LL;
          }
          else {
            uint64_t v48 = 0LL;
          }
          v43 += lzma_rc_prices[(v48 ^ (unint64_t)*(unsigned __int16 *)(v6 + 29128 + 2LL * v44)) >> 4];
          unsigned int v44 = v47 | (2 * v44);
          BOOL v49 = __CFADD__(v45++, 1);
        }

        while (!v49);
        *(_DWORD *)(v6 + 4 * i + 69248) = v43;
      }

      v7[526] = 0;
    }

    unsigned int v10 = *(_DWORD *)(a2 + 96);
    uint64_t result = lzma_mf_find(a2, &v323, v6 + 732);
    unsigned int v11 = result;
    a4 = v41;
    uint64_t v5 = v40;
  }

  uint64_t v50 = *(unsigned int *)(a2 + 24);
  unsigned int v51 = *(_DWORD *)(a2 + 36) - v50 + 1;
  if (v51 > 0x110)
  {
    unsigned int v51 = 273;
  }

  else if (v51 <= 1)
  {
LABEL_65:
    *uint64_t v5 = -1;
    *a4 = 1;
    return result;
  }

  uint64_t v52 = 0LL;
  unsigned int v53 = 0;
  uint64_t v54 = *(void *)a2 + v50;
  int v55 = *(unsigned __int16 *)(v54 - 1);
  unsigned int v56 = (unsigned __int8 *)(v54 - 2);
  do
  {
    uint64_t result = *(unsigned int *)(v6 + 4 * v52 + 716);
    if (v55 == *(unsigned __int16 *)&v56[-result])
    {
      unsigned int v57 = v51;
      if (v51 >= 3)
      {
        uint64_t v58 = 0LL;
        uint64_t v59 = v54 - result;
        while (1)
        {
          int v60 = *(_DWORD *)(v54 + 1 + v58) - *(_DWORD *)(v59 + v58);
          if (v60) {
            break;
          }
          unint64_t v61 = v58 + 6;
          v58 += 4LL;
          if (v61 >= v51)
          {
            unsigned int v57 = v51;
            goto LABEL_57;
          }
        }

        int v62 = v58 + 2;
        int v63 = v58 + 4;
        if ((_WORD)v60)
        {
          int v63 = v62;
          char v64 = v60;
        }

        else
        {
          char v64 = BYTE2(v60);
        }

        unsigned int v57 = v63 | (v64 == 0);
        if (v57 >= v51) {
          unsigned int v57 = v51;
        }
      }

LABEL_57:
      *((_DWORD *)&v324 + v52) = v57;
      uint64_t result = *((unsigned int *)&v324 + v53);
    }

    else
    {
      *((_DWORD *)&v324 + v52) = 0;
    }

    ++v52;
  }

  while (v52 != 4);
  unsigned int v65 = *((_DWORD *)&v324 + v53);
  if (v65 >= v10)
  {
    *uint64_t v5 = v53;
    *a4 = v65;
    uint64_t v67 = v65 - 1;
    if (v65 == 1) {
      return result;
    }
LABEL_69:
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(a2, v67);
    *(_DWORD *)(a2 + 28) += v67;
    return result;
  }

  if (v11 >= v10)
  {
    *uint64_t v5 = *(_DWORD *)(v6 + 8LL * (v323 - 1) + 736) + 4;
    *a4 = v11;
    uint64_t v67 = v11 - 1;
    if (v11 == 1) {
      return result;
    }
    goto LABEL_69;
  }

  int v66 = *(unsigned __int8 *)(~(unint64_t)*(unsigned int *)(v6 + 716) + v54 - 1);
  v274 = (unsigned int *)(v6 + 69344);
  v275 = v7;
  uint64_t v282 = a2;
  v276 = (int *)v5;
  v277 = a4;
  unint64_t v68 = *(unsigned int *)(v6 + 712);
  *(_DWORD *)(v6 + 69324) = v68;
  uint64_t v69 = *(_DWORD *)(v6 + 2936) & a5;
  unint64_t v320 = v6 + 32 * v68;
  unint64_t v70 = (unint64_t)*(unsigned __int16 *)(v320 + 2LL * v69 + 27524) >> 4;
  int v71 = lzma_rc_prices[v70];
  uint64_t result = get_literal_price(v6, a5, *v56, v68 > 6, v66, v55);
  *(_DWORD *)(v6 + 69384) = result + v71;
  int v72 = -1;
  *(_DWORD *)(v6 + 69392) = -1;
  *(_BYTE *)(v6 + 69372) = 0;
  int v73 = lzma_rc_prices[v70 ^ 0x7F];
  unint64_t v74 = v6 + 2 * v68;
  unint64_t v75 = (unint64_t)*(unsigned __int16 *)(v74 + 27908) >> 4;
  int v76 = lzma_rc_prices[v75 ^ 0x7F] + v73;
  if (v66 == v55)
  {
    unsigned int v77 = v76
        + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v74 + 27932) >> 4]
        + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v320 + 2 * v69 + 28004) >> 4];
    if (v77 >= (int)result + v71)
    {
      int v72 = -1;
    }

    else
    {
      int v72 = 0;
      *(_DWORD *)(v6 + 69384) = v77;
      *(_DWORD *)(v6 + 69392) = 0;
    }
  }

  if (v11 <= v65) {
    unsigned int v78 = v65;
  }
  else {
    unsigned int v78 = v11;
  }
  if (v78 <= 1)
  {
    int *v276 = v72;
    unsigned int *v277 = 1;
    return result;
  }

  *(_DWORD *)(v6 + 69388) = 0;
  *(_OWORD *)(v6 + 69352) = *(_OWORD *)(v6 + 716);
  uint64_t v79 = 44LL * v78 + 69340;
  unsigned int v80 = v78;
  do
  {
    *(_DWORD *)(v6 + v79) = 0x40000000;
    --v78;
    v79 -= 44LL;
  }

  while (v78 > 1);
  uint64_t v81 = 0LL;
  uint64_t v82 = (unsigned __int16 *)(v6 + 2 * v68);
  uint64_t v83 = v82 + 13966;
  uint64_t v84 = v82 + 13978;
  uint64_t v85 = v82 + 13990;
  uint64_t result = (uint64_t)&v324;
  do
  {
    unsigned int v86 = *((_DWORD *)&v324 + v81);
    if (v86 < 2) {
      goto LABEL_93;
    }
    unint64_t v87 = (unint64_t)*v83 >> 4;
    if (v81)
    {
      int v88 = lzma_rc_prices[v87 ^ 0x7FLL];
      unint64_t v89 = (unint64_t)*v84 >> 4;
      if (v81 != 1)
      {
        int v90 = lzma_rc_prices[v89 ^ 0x7FLL] + v88;
        int v88 = lzma_rc_prices[((2 - (_WORD)v81) & 0x7F0 ^ (unint64_t)*v85) >> 4];
        goto LABEL_89;
      }
    }

    else
    {
      int v88 = lzma_rc_prices[v87];
      unint64_t v89 = ((unint64_t)*(unsigned __int16 *)(v6 + 32 * v68 + 2 * v69 + 28004) >> 4) ^ 0x7F;
    }

    int v90 = lzma_rc_prices[v89];
LABEL_89:
    int v91 = v88 + v76 + v90;
    v92 = (int *)(v6 + 1088LL * v69 + 48692 + 4LL * (v86 - 2));
    do
    {
      int v93 = *v92--;
      int v94 = v91 + v93;
      unsigned int v95 = v86;
      v96 = (_DWORD *)(v6 + 44LL * v86 + 69340);
      if ((v91 + v93) < *v96)
      {
        _DWORD *v96 = v94;
        uint64_t v97 = v6 + 44LL * v95 + 69324;
        *(_DWORD *)(v97 + 20) = 0;
        *(_DWORD *)(v97 + 24) = v81;
        *(_BYTE *)(v97 + 4) = 0;
      }

      unsigned int v86 = v95 - 1;
    }

    while (v95 - 1 > 1);
LABEL_93:
    ++v81;
  }

  while (v81 != 4);
  else {
    unsigned int v98 = 2;
  }
  if (v98 <= v11)
  {
    int v251 = lzma_rc_prices[v75];
    unsigned int v252 = -1;
    do
      ++v252;
    while (v98 > *(_DWORD *)(v6 + 8LL * v252 + 732));
    int v253 = v251 + v73;
    int v254 = v323;
    uint64_t result = 69340LL;
    while (1)
    {
      uint64_t v255 = v6 + 8LL * v252;
      unint64_t v256 = *(unsigned int *)(v255 + 736);
      unsigned int v257 = v98 - 2;
      uint64_t v258 = v98 >= 6 ? 3LL : v257;
      if (v256 > 0x7F)
      {
        if ((v256 & 0x80000000) != 0LL) {
          char v260 = 30;
        }
        else {
          char v260 = 18;
        }
        if ((v256 & 0x80000000) != 0LL) {
          uint64_t v261 = 60LL;
        }
        else {
          uint64_t v261 = 36LL;
        }
        uint64_t v262 = lzma_fastpos[v256 >> v260];
        int v259 = *(_DWORD *)(v6 + 4 * (v256 & 0xF) + 69248) + *(_DWORD *)(v6 + (v258 << 8) + 4 * (v261 + v262) + 66168);
      }

      else
      {
        int v259 = *(_DWORD *)(v6 + (v258 << 9) + 4 * v256 + 67192);
      }

      unsigned int v263 = v253 + v259 + *(_DWORD *)(v6 + 1088LL * v69 + 4LL * v257 + 30188);
      v264 = (unsigned int *)(v6 + 44LL * v98 + 69340);
      if (v263 < *v264)
      {
        unsigned int *v264 = v263;
        uint64_t v265 = v6 + 44LL * v98 + 69324;
        *(_DWORD *)(v265 + 20) = 0;
        *(_DWORD *)(v265 + 24) = v256 + 4;
        *(_BYTE *)(v265 + 4) = 0;
      }

      if (v257 + 2 == *(_DWORD *)(v255 + 732) && ++v252 == v254) {
        break;
      }
      unsigned int v98 = v257 + 3;
    }
  }

  if (v80 != -1)
  {
    unsigned int v99 = v80;
    uint64_t v100 = 0LL;
    __int128 v324 = *(_OWORD *)(v6 + 716);
    uint64_t v278 = v6 + 69352;
    uint64_t v298 = v6 + 69384;
    int v286 = ~a5;
    unsigned int v285 = 4094;
    unint64_t v101 = 1LL;
    while (1)
    {
      unsigned int v316 = v99;
      uint64_t result = lzma_mf_find(v282, (_DWORD *)(v6 + 2924), v6 + 732);
      *(_DWORD *)(v6 + 2928) = result;
      if (result >= *(_DWORD *)(v282 + 96))
      {
        unsigned int v250 = v101;
        goto LABEL_356;
      }

      uint64_t v102 = *(void *)v282;
      uint64_t v103 = *(unsigned int *)(v282 + 24);
      int v104 = *(_DWORD *)(v282 + 36) - v103;
      unsigned int v281 = v104 + 1;
      else {
        unsigned int v105 = 4095 - v101;
      }
      unsigned int v311 = v105;
      unsigned int v305 = *(_DWORD *)(v6 + 2924);
      uint64_t v106 = *(unsigned int *)(v6 + 44 * v101 + 69344);
      uint64_t v307 = v100;
      unsigned int v294 = *(_DWORD *)(v282 + 96);
      unsigned int v283 = result;
      if (*(_BYTE *)(v6 + 44 * v101 + 69328))
      {
        if (*(_BYTE *)(v6 + 44 * v101 + 69329))
        {
          uint64_t v107 = v6 + 69324 + 44 * v101;
          unsigned int v108 = *(_DWORD *)(v107 + 8);
          unsigned int v109 = *(_DWORD *)(v107 + 12);
          if (*(_DWORD *)(v6 + 69324 + 44LL * v108) >= 7u) {
            int v110 = 11;
          }
          else {
            int v110 = 8;
          }
          if (*(_DWORD *)(v6 + 69324 + 44LL * v108) >= 7u) {
            int v111 = 10;
          }
          else {
            int v111 = 7;
          }
          if (*(_DWORD *)(v6 + 69324 + 44LL * v108) >= 7u) {
            int v112 = -6;
          }
          else {
            int v112 = -3;
          }
          if (v109 >= 4) {
            int v110 = v111;
          }
          unsigned int v113 = v110 + v112;
          if (v101 == v106)
          {
LABEL_124:
            if (*(_DWORD *)(v6 + 44 * v101 + 69348))
            {
              if (v113 >= 0xA) {
                int v115 = -6;
              }
              else {
                int v115 = -3;
              }
              unsigned int v116 = v115 + v113;
              if (v113 >= 4) {
                unsigned int v114 = v116;
              }
              else {
                unsigned int v114 = 0;
              }
            }

            else if (v113 >= 7)
            {
              unsigned int v114 = 11;
            }

            else
            {
              unsigned int v114 = 9;
            }

            goto LABEL_152;
          }

          if (v113 >= 7) {
            unsigned int v114 = 11;
          }
          else {
            unsigned int v114 = 8;
          }
          if (v109 > 3) {
            goto LABEL_151;
          }
          goto LABEL_142;
        }

        unsigned int v117 = *(_DWORD *)(v6 + 44LL * (v106 - 1) + 69324);
        if (v117 >= 0xA) {
          int v118 = -6;
        }
        else {
          int v118 = -3;
        }
        unsigned int v119 = v118 + v117;
        if (v117 >= 4) {
          unsigned int v113 = v119;
        }
        else {
          unsigned int v113 = 0;
        }
        BOOL v120 = v101 == v106;
        LODWORD(v106) = v106 - 1;
        if (v120) {
          goto LABEL_124;
        }
      }

      else
      {
        unsigned int v113 = *(_DWORD *)(v6 + 44LL * v106 + 69324);
        if (v101 - 1 == v106) {
          goto LABEL_124;
        }
      }

      unsigned int v109 = *(_DWORD *)(v6 + 44 * v101 + 69348);
      unsigned int v108 = v106;
      if (v109 > 3)
      {
        if (v113 >= 7) {
          unsigned int v114 = 10;
        }
        else {
          unsigned int v114 = 7;
        }
LABEL_151:
        LODWORD(v324) = v109 - 4;
        uint64_t v124 = v278 + 44LL * v108;
        *(void *)((char *)&v324 + 4) = *(void *)v124;
        HIDWORD(v324) = *(_DWORD *)(v124 + 8);
LABEL_152:
        uint64_t v123 = v307;
        goto LABEL_153;
      }

      if (v113 >= 7) {
        unsigned int v114 = 11;
      }
      else {
        unsigned int v114 = 8;
      }
LABEL_142:
      LODWORD(v324) = *(_DWORD *)(v6 + 44LL * v108 + 4LL * v109 + 69352);
      if (v109)
      {
        unsigned int v121 = v109 + 1;
        memcpy((char *)&v324 + 4, (const void *)(v278 + 44LL * v108), 4LL * (v109 + 1) - 4);
        BOOL v122 = v109 > 2;
        uint64_t v123 = v307;
        if (v122) {
          goto LABEL_153;
        }
      }

      else
      {
        unsigned int v121 = 1;
        uint64_t v123 = v307;
      }

      uint64_t v154 = v121;
      do
      {
        *((_DWORD *)&v324 + v154) = *(_DWORD *)(v278 + 44LL * v108 + 4 * v154);
        ++v154;
      }

      while ((_DWORD)v154 != 4);
LABEL_153:
      uint64_t v125 = v102 + v103 - 1;
      *(_DWORD *)(v6 + 44 * v101 + 69324) = v114;
      *(_OWORD *)(44 * v123 + 69340 + v6 + 56) = v324;
      v126 = (unsigned __int8 *)(v102 + v103 - 2);
      int v127 = *(_DWORD *)(v6 + 44 * v101 + 69340);
      v321 = (unsigned __int16 *)v125;
      v322 = v126;
      int v310 = *(_DWORD *)(v6 + 2936);
      uint64_t v288 = v114;
      uint64_t v319 = v310 & (v101 + a5);
      v313 = (unsigned __int8 *)(~(unint64_t)v324 + v125);
      int v128 = *v313;
      unint64_t v129 = (unint64_t)*(unsigned __int16 *)(v6 + 32LL * v114 + 2LL * v319 + 27524) >> 4;
      BOOL v122 = v114 > 6;
      int v131 = v126[1];
      char v132 = v122;
      int v291 = v101 + a5;
      int v130 = lzma_rc_prices[v129];
      unsigned int v133 = v127 + get_literal_price(v6, (int)v101 + a5, *v126, v132, v128, v126[1]) + v130;
      unint64_t v134 = v101 + 1;
      unsigned int v137 = *(_DWORD *)(v6 + 44 * v101 + 69384);
      v136 = (unsigned int *)(v6 + 44 * v101 + 69384);
      unsigned int v135 = v137;
      BOOL v138 = v133 < v137;
      if (v133 < v137)
      {
        unsigned int *v136 = v133;
        uint64_t v139 = v6 + 44 * v134 + 69324;
        *(_DWORD *)(v139 + 20) = v101;
        *(_DWORD *)(v139 + 24) = -1;
        *(_BYTE *)(v139 + 4) = 0;
        unsigned int v135 = v133;
      }

      int v140 = v127 + lzma_rc_prices[v129 ^ 0x7FLL];
      unint64_t v141 = (unint64_t)*(unsigned __int16 *)(v6 + 2 * v288 + 27908) >> 4;
      int v304 = v140 + lzma_rc_prices[v141 ^ 0x7F];
      unsigned int v99 = v316;
      uint64_t result = (uint64_t)lzma_fastpos;
      unsigned int v142 = v294;
      if (v128 == v131)
      {
        v143 = (_DWORD *)(v6 + 44 * v134 + 69344);
        uint64_t v144 = v310 & (v101 + a5);
        if (v101 <= *v143 || *(_DWORD *)(v6 + 44 * v134 + 69348))
        {
          unsigned int v145 = v304
               + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 2 * v288 + 27932) >> 4]
               + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 32 * v288 + 2 * v319 + 28004) >> 4];
          if (v145 <= v135)
          {
            unsigned int *v136 = v145;
            _DWORD *v143 = v101;
            uint64_t v146 = v6 + 44 * v134 + 69324;
            *(_DWORD *)(v146 + 24) = 0;
            *(_BYTE *)(v146 + 4) = 0;
            BOOL v138 = 1;
          }
        }
      }

      else
      {
        uint64_t v144 = v310 & (v101 + a5);
      }

      v147 = v321;
      unint64_t v284 = v101 + 1;
      if (v311 < 2) {
        goto LABEL_329;
      }
      unint64_t v280 = v141;
      int v279 = v140;
      int v148 = v131;
      if (v311 >= v294) {
        unsigned int v149 = v294;
      }
      else {
        unsigned int v149 = v311;
      }
      if (v128 == v148) {
        BOOL v138 = 1;
      }
      if (v138)
      {
        unsigned int v150 = v311;
      }

      else
      {
        if (v294 + 1 < v311) {
          unsigned int v151 = v294 + 1;
        }
        else {
          unsigned int v151 = v311;
        }
        unsigned int v150 = v311;
        if (v151 >= 2)
        {
          unsigned int v152 = 1;
          while (1)
          {
            int v153 = *(_DWORD *)((char *)v321 + v152) - *(_DWORD *)&v313[v152];
            if (v153) {
              break;
            }
            v152 += 4;
            if (v152 >= v151) {
              goto LABEL_190;
            }
          }

          if (*(unsigned __int16 *)((char *)v321 + v152) == *(_WORD *)&v313[v152])
          {
            v152 += 2;
            LOBYTE(v153) = BYTE2(v153);
          }

          if (!(_BYTE)v153) {
            ++v152;
          }
          if (v152 < v151) {
            unsigned int v151 = v152;
          }
        }

LABEL_190:
        unsigned int v155 = v151 - 3;
        if (v151 - 3 <= 0xFFFFFFFD)
        {
          else {
            int v156 = -3;
          }
          LODWORD(v157) = v156 + v288;
          else {
            uint64_t v157 = 0LL;
          }
          uint64_t v158 = v310 & (v291 + 1);
          unint64_t v159 = *(unsigned __int16 *)(v6 + 32 * v157 + 2LL * v158 + 27524);
          unint64_t v160 = *(unsigned __int16 *)(v6 + 2LL * v157 + 27908);
          uint64_t v161 = v151 + v101;
          if (v161 > v316)
          {
            uint64_t v162 = v161 - v316;
            v163 = (_DWORD *)(v298 + 44LL * v316);
            do
            {
              _DWORD *v163 = 0x40000000;
              v163 += 11;
              --v162;
            }

            while (v162);
            unsigned int v99 = v161;
          }

          unsigned int v164 = v133
               + lzma_rc_prices[(v159 >> 4) ^ 0x7F]
               + lzma_rc_prices[(v160 >> 4) ^ 0x7F]
               + *(_DWORD *)(v6 + 1088LL * v158 + 4LL * v155 + 48692)
               + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 2 * v157 + 27932) >> 4]
               + lzma_rc_prices[((unint64_t)*(unsigned __int16 *)(v6 + 32 * v157 + 2 * v158 + 28004) >> 4) ^ 0x7F];
          v165 = (unsigned int *)(v6 + 44LL * v161 + 69340);
          if (v164 < *v165)
          {
            unsigned int *v165 = v164;
            uint64_t v166 = v6 + 44LL * v161 + 69324;
            *(void *)(v166 + 20) = v134;
            *(_WORD *)(v166 + 4) = 1;
          }

          v147 = v321;
          unsigned int v142 = v294;
        }
      }

      uint64_t v167 = 0LL;
      v168 = (unsigned __int16 *)(v6 + 2 * v288);
      v303 = v168 + 13966;
      v292 = v168 + 13978;
      v287 = v168 + 13990;
      v289 = (unsigned __int16 *)(v6 + 32 * v288 + 2 * v144 + 28004);
      uint64_t v169 = 11LL;
      uint64_t v290 = v169;
      uint64_t v301 = 1088LL * v144 + 48692;
      unsigned int v170 = 2;
      unsigned int v299 = v149;
      do
      {
        v171 = &v322[-*((unsigned int *)&v324 + v167)];
        unsigned int v172 = v149;
        if (v149 >= 3)
        {
          unsigned int v173 = 2;
          while (1)
          {
            int v174 = *(_DWORD *)&v147[v173 / 2] - *(_DWORD *)&v171[v173];
            if (v174) {
              break;
            }
            v173 += 4;
            if (v173 >= v149)
            {
              unsigned int v172 = v149;
              goto LABEL_218;
            }
          }

          if (v147[v173 / 2] == *(_WORD *)&v171[v173])
          {
            v173 += 2;
            LOBYTE(v174) = BYTE2(v174);
          }

          unsigned int v175 = v173 | (v174 == 0);
          if (v175 >= v149) {
            unsigned int v172 = v149;
          }
          else {
            unsigned int v172 = v175;
          }
        }

LABEL_218:
        unsigned int v176 = v99;
        if (v99 < v172 + v101)
        {
          unint64_t v177 = v101 + v172 - (unint64_t)v99;
          v178 = (_DWORD *)(v298 + 44LL * v99);
          do
          {
            _DWORD *v178 = 0x40000000;
            v178 += 11;
            --v177;
          }

          while (v177);
          unsigned int v176 = v172 + v101;
        }

        unint64_t v179 = (unint64_t)*v303 >> 4;
        int v308 = v172 + v101;
        if (v167)
        {
          int v180 = lzma_rc_prices[v179 ^ 0x7FLL];
          unint64_t v181 = (unint64_t)*v292 >> 4;
          if (v167 != 1)
          {
            int v182 = lzma_rc_prices[v181 ^ 0x7FLL] + v180;
            int v180 = lzma_rc_prices[((2 - (_WORD)v167) & 0x7F0 ^ (unint64_t)*v287) >> 4];
            goto LABEL_227;
          }
        }

        else
        {
          int v180 = lzma_rc_prices[v179];
          unint64_t v181 = ((unint64_t)*v289 >> 4) ^ 0x7F;
        }

        int v182 = lzma_rc_prices[v181];
LABEL_227:
        int v183 = v180 + v304 + v182;
        uint64_t v184 = v301 + 4LL * (v172 - 2);
        unsigned int v185 = v172;
        do
        {
          unsigned int v186 = *(_DWORD *)(v6 + v184) + v183;
          v187 = (unsigned int *)(v6 + 44LL * (v101 + v185) + 69340);
          if (v186 < *v187)
          {
            unsigned int *v187 = v186;
            uint64_t v188 = v6 + 44LL * (v101 + v185) + 69324;
            *(_DWORD *)(v188 + 20) = v101;
            *(_DWORD *)(v188 + 24) = v167;
            *(_BYTE *)(v188 + 4) = 0;
          }

          --v185;
          v184 -= 4LL;
        }

        while (v185 > 1);
        unsigned int v189 = v172 + 1;
        if (!v167) {
          unsigned int v170 = v172 + 1;
        }
        if (v189 + v142 >= v150) {
          unsigned int v190 = v150;
        }
        else {
          unsigned int v190 = v189 + v142;
        }
        unsigned int v314 = v176;
        if (v189 >= v190)
        {
          unsigned int v190 = v172 + 1;
          v147 = v321;
        }

        else
        {
          unsigned int v191 = v172 + 1;
          v147 = v321;
          while (1)
          {
            int v192 = *(_DWORD *)((char *)v321 + v191) - *(_DWORD *)&v171[v191];
            if (v192) {
              break;
            }
            v191 += 4;
            if (v191 >= v190) {
              goto LABEL_248;
            }
          }

          if (*(unsigned __int16 *)((char *)v321 + v191) == *(_WORD *)&v171[v191])
          {
            v191 += 2;
            LOBYTE(v192) = BYTE2(v192);
          }

          v147 = v321;
          if (!(_BYTE)v192) {
            ++v191;
          }
          if (v191 < v190) {
            unsigned int v190 = v191;
          }
        }

LABEL_248:
        unsigned int v193 = v190 - v189;
        int v194 = v190 - v189 - 2;
        if (v193 < 2)
        {
          unsigned int v99 = v314;
          LODWORD(v144) = v310 & (v101 + a5);
        }

        else
        {
          unsigned int v297 = v194;
          unsigned int v312 = v170;
          unsigned int v317 = v99;
          int v296 = *(_DWORD *)(v6 + 1088LL * v319 + 4LL * (v172 - 2) + 48692);
          int v295 = lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6
                                                                      + 27524
                                                                      + 32 * v290
                                                                      + 2LL * ((v172 + v291) & v310)) >> 4];
          int literal_price = get_literal_price( v6,  v172 + v291,  *((unsigned __int8 *)v147 + v172 - 1),  1,  v171[v172],  *((unsigned __int8 *)v147 + v172));
          uint64_t v196 = (v172 + v291 + 1) & v310;
          unint64_t v197 = *(unsigned __int16 *)(v6 + 27524 + 2LL * v196 + 160);
          unint64_t v198 = *(unsigned __int16 *)(v6 + 27918);
          int v199 = v308 + 1;
          unsigned int v200 = v193 + v308 + 1;
          unsigned int v99 = v314;
          if (v314 >= v200)
          {
            uint64_t v123 = v307;
          }

          else
          {
            uint64_t v201 = v317;
            uint64_t v202 = v101 + v190 - v201;
            v203 = (_DWORD *)(v298 + 44LL * v201);
            do
            {
              _DWORD *v203 = 0x40000000;
              v203 += 11;
              --v202;
            }

            while (v202);
            unsigned int v99 = v193 + v199;
            uint64_t v123 = v307;
          }

          unsigned int v150 = v311;
          LODWORD(v144) = v310 & (v101 + a5);
          unsigned int v204 = v296
               + v183
               + v295
               + literal_price
               + lzma_rc_prices[(v197 >> 4) ^ 0x7F]
               + lzma_rc_prices[(v198 >> 4) ^ 0x7F]
               + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 27942) >> 4]
          v205 = (unsigned int *)(v6 + 44LL * v200 + 69340);
          if (v204 < *v205)
          {
            unsigned int *v205 = v204;
            uint64_t v206 = v6 + 44LL * v200 + 69324;
            *(_DWORD *)(v206 + 20) = v199;
            *(_DWORD *)(v206 + 24) = 0;
            *(_WORD *)(v206 + 4) = 257;
            *(_DWORD *)(v206 + 8) = v101;
            *(_DWORD *)(v206 + 12) = v167;
          }

          uint64_t result = (uint64_t)lzma_fastpos;
          v147 = v321;
          unsigned int v142 = v294;
          unsigned int v170 = v312;
        }

        unsigned int v149 = v299;
LABEL_261:
        ++v167;
      }

      while (v167 != 4);
      unsigned int v207 = v283;
      unsigned int v208 = v305;
      if (v283 > v149)
      {
        unsigned int v208 = 0;
        do
          uint64_t v209 = v6 + 8LL * v208++;
        while (v149 > *(_DWORD *)(v209 + 732));
        *(_DWORD *)(v209 + 732) = v149;
        unsigned int v207 = v149;
      }

      if (v207 >= v170)
      {
        unsigned int v210 = v207 + v101;
        if (v99 < v210)
        {
          unsigned int v211 = v208;
          if (v283 >= v142) {
            unsigned int v212 = v142;
          }
          else {
            unsigned int v212 = v283;
          }
          if (v212 >= v285) {
            unsigned int v212 = v285;
          }
          if (v212 >= v281) {
            unsigned int v212 = v281;
          }
          unint64_t v213 = v99 - (unint64_t)(v212 + v101);
          v214 = (_DWORD *)(v298 + 44LL * v99);
          do
          {
            _DWORD *v214 = 0x40000000;
            v214 += 11;
            BOOL v49 = __CFADD__(v213++, 1LL);
          }

          while (!v49);
          unsigned int v99 = v210;
          unsigned int v208 = v211;
        }

        unsigned int v215 = -1;
        do
          ++v215;
        while (v170 > *(_DWORD *)(v6 + 8LL * v215 + 732));
        int v216 = v279 + lzma_rc_prices[v280];
        uint64_t v217 = 7LL;
        uint64_t v300 = v217;
        unsigned int v315 = v142 + 1;
        unsigned int v306 = v208;
        do
        {
          uint64_t v218 = v6 + 8LL * v215;
          unint64_t v219 = *(unsigned int *)(v218 + 736);
          if ((v219 & 0x80000000) != 0LL) {
            char v220 = 30;
          }
          else {
            char v220 = 18;
          }
          uint64_t v221 = 60LL;
          if ((v219 & 0x80000000) == 0LL) {
            uint64_t v221 = 36LL;
          }
          else {
            char v222 = 6;
          }
          uint64_t v223 = 12LL;
          int v224 = *(_DWORD *)(v218 + 732);
          for (unsigned int j = v170; ; ++j)
          {
            unsigned int v226 = j - 2;
            if (j >= 6) {
              uint64_t v227 = 3LL;
            }
            else {
              uint64_t v227 = v226;
            }
            if (v219 > 0x7F) {
              int v228 = *(_DWORD *)(v6 + 4 * (v219 & 0xF) + 69248)
            }
                   + *(_DWORD *)(v6 + (v227 << 8) + 4 * (v223 + lzma_fastpos[v219 >> v222]) + 66168);
            else {
              int v228 = *(_DWORD *)(v6 + (v227 << 9) + 4 * v219 + 67192);
            }
            unsigned int v229 = v216 + v228 + *(_DWORD *)(v6 + 1088LL * v144 + 4LL * v226 + 30188);
            unsigned int v230 = v123 + j + 1;
            v231 = (unsigned int *)(v6 + 44LL * v230 + 69340);
            if (v229 < *v231)
            {
              unsigned int *v231 = v229;
              uint64_t v232 = v6 + 44LL * v230 + 69324;
              *(_DWORD *)(v232 + 20) = v101;
              *(_DWORD *)(v232 + 24) = v219 + 4;
              *(_BYTE *)(v232 + 4) = 0;
            }

            if (j == v224) {
              break;
            }
          }

          v233 = &v322[-v219];
          unsigned int v170 = j + 1;
          unsigned int v234 = v315 + j;
          if (v315 + j >= v311) {
            unsigned int v234 = v311;
          }
          unsigned int v235 = j + 1;
          if (v170 < v234)
          {
            unsigned int v235 = j + 1;
            while (1)
            {
              int v236 = *(_DWORD *)((char *)v321 + v235) - *(_DWORD *)&v233[v235];
              if (v236) {
                break;
              }
              v235 += 4;
              if (v235 >= v234)
              {
                unsigned int v235 = v234;
                goto LABEL_318;
              }
            }

            if (*(unsigned __int16 *)((char *)v321 + v235) == *(_WORD *)&v233[v235])
            {
              v235 += 2;
              LOBYTE(v236) = BYTE2(v236);
            }

            if (!(_BYTE)v236) {
              ++v235;
            }
            if (v235 >= v234) {
              unsigned int v235 = v234;
            }
          }

LABEL_318:
          unsigned int v237 = ~j + v235;
          if (v237 < 2)
          {
            LODWORD(v144) = v310 & (v101 + a5);
          }

          else
          {
            unsigned int v302 = v235;
            unsigned int v318 = v99;
            int v309 = lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6
                                                                        + 27524
                                                                        + 32 * v300
                                                                        + 2LL * ((j - v286) & v310)) >> 4];
            int v238 = get_literal_price( v6,  j - v286,  *((unsigned __int8 *)v321 + j - 1),  1,  v233[j],  *((unsigned __int8 *)v321 + j));
            unsigned int v99 = v318;
            uint64_t v239 = (((j - v286) & v310) + 1) & v310;
            uint64_t v123 = v307;
            unint64_t v240 = *(unsigned __int16 *)(v6 + 27524 + 2LL * v239 + 128);
            unint64_t v241 = *(unsigned __int16 *)(v6 + 27916);
            int v242 = v307 + j + 2;
            unsigned int v243 = v237 + v242;
            if (v318 >= v237 + v242)
            {
              LODWORD(v144) = v310 & (v101 + a5);
              unsigned int v244 = v302;
            }

            else
            {
              unsigned int v244 = v302;
              unint64_t v245 = v101 + v302 - (unint64_t)v318;
              v246 = (_DWORD *)(v298 + 44LL * v318);
              LODWORD(v144) = v310 & (v101 + a5);
              do
              {
                _DWORD *v246 = 0x40000000;
                v246 += 11;
                --v245;
              }

              while (v245);
              unsigned int v99 = v243;
            }

            unsigned int v247 = v229
                 + v309
                 + v238
                 + lzma_rc_prices[(v240 >> 4) ^ 0x7F]
                 + lzma_rc_prices[(v241 >> 4) ^ 0x7F]
                 + lzma_rc_prices[(unint64_t)*(unsigned __int16 *)(v6 + 27940) >> 4]
            v248 = (unsigned int *)(v6 + 44LL * v243 + 69340);
            if (v247 < *v248)
            {
              unsigned int *v248 = v247;
              uint64_t v249 = v6 + 44LL * v243 + 69324;
              *(_DWORD *)(v249 + 20) = v242;
              *(_DWORD *)(v249 + 24) = 0;
              *(_WORD *)(v249 + 4) = 257;
              *(_DWORD *)(v249 + 8) = v101;
              *(_DWORD *)(v249 + 12) = v219 + 4;
            }

            uint64_t result = (uint64_t)lzma_fastpos;
            unsigned int v170 = j + 1;
          }

          ++v215;
        }

        while (v215 != v306);
      }

LABEL_329:
      uint64_t v100 = v123 + 1;
      --v285;
      --v286;
      unsigned int v250 = ++v101;
      if (v284 >= v99)
      {
LABEL_356:
        v275[527] = v250;
        unsigned int v267 = *(_DWORD *)(v6 + 44LL * v250 + 69344);
        int v266 = *(_DWORD *)(v6 + 44LL * v250 + 69348);
        do
        {
          unsigned int v268 = v250;
          unsigned int v250 = v267;
          unsigned int v269 = v267;
          v270 = (int *)(v6 + 69324 + 44LL * v267 + 24);
          if (*(_BYTE *)(v6 + 69324 + 44LL * v268 + 4))
          {
            *(_BYTE *)(v6 + 69324 + 44LL * v267-- + 4) = 0;
            if (*(_BYTE *)(v6 + 69324 + 44LL * v268 + 5))
            {
              uint64_t result = v6 + 69324 + 44LL * v267;
              *(_BYTE *)(result + 4) = 0;
              *(void *)(result + 20) = *(void *)(v6 + 69324 + 44LL * v268 + 8);
            }

            int v271 = -1;
          }

          else
          {
            int v271 = *v270;
            unsigned int v267 = *(_DWORD *)(v6 + 44LL * v267 + 69344);
          }

          int *v270 = v266;
          *(_DWORD *)(v6 + 44LL * v269 + 69344) = v268;
          int v266 = v271;
        }

        while (v269);
        unsigned int v272 = *v274;
        int v273 = *(_DWORD *)(v6 + 69348);
        v275[528] = *v274;
        unsigned int *v277 = v272;
        int *v276 = v273;
        return result;
      }
    }
  }

  return result;
}

uint64_t get_literal_price(uint64_t result, int a2, unsigned int a3, char a4, int a5, int a6)
{
  uint64_t v6 = result
     + 1536LL
     * ((a3 >> (8 - *(_DWORD *)(result + 2940))) + ((*(_DWORD *)(result + 2944) & a2) << *(_DWORD *)(result + 2940)))
     + 2948;
  unsigned int v7 = a6 + 256;
  LODWORD(result) = 0;
  if ((a4 & 1) != 0)
  {
    int v8 = 256;
    do
    {
      int v9 = v8 & (2 * a5);
      unsigned int v10 = v8 + (v7 >> 8);
      BOOL v11 = (v7 & 0x80) == 0;
      v7 *= 2;
      int v12 = v7 ^ (2 * a5);
      a5 *= 2;
      unint64_t v13 = *(unsigned __int16 *)(v6 + 2LL * (v10 + v9));
      if (v11) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = 2032LL;
      }
      uint64_t result = result + lzma_rc_prices[(v14 ^ v13) >> 4];
      v8 &= ~v12;
    }

    while (v7 < 0x10000);
  }

  else
  {
    do
    {
      unsigned int v15 = v7 >> 1;
      if ((v7 & 1) != 0) {
        uint64_t v16 = 2032LL;
      }
      else {
        uint64_t v16 = 0LL;
      }
      uint64_t result = result + lzma_rc_prices[(v16 ^ (unint64_t)*(unsigned __int16 *)(v6 + 2 * v15)) >> 4];
      v7 >>= 1;
    }

    while (v15 != 1);
  }

  return result;
}

uint64_t lzma_file_info_decoder(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = lzma_strm_init(a1);
  if (!(_DWORD)v8)
  {
    uint64_t v8 = lzma_file_info_decoder_init(a1[7], a1[6], (uint64_t)(a1 + 12), a2, a3, a4);
    if ((_DWORD)v8)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v9 = a1[7];
      *(_BYTE *)(v9 + 96) = 1;
      *(_BYTE *)(v9 + 99) = 1;
    }
  }

  return v8;
}

uint64_t lzma_file_info_decoder_init( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  *(void *)(a1 + 16) = lzma_file_info_decoder_init;
  if (!a4) {
    return 11LL;
  }
  int v12 = *(void **)a1;
  if (*(void *)a1)
  {
    unint64_t v13 = (uint64_t *)*((void *)v12 + 15);
  }

  else
  {
    unsigned int v15 = lzma_alloc(0x2160uLL, a2);
    if (!v15) {
      return 5LL;
    }
    int v12 = v15;
    unint64_t v13 = 0LL;
    *(void *)(a1 + 24) = file_info_decode;
    *(void *)(a1 + 32) = file_info_decoder_end;
    *(void *)(a1 + 56) = file_info_decoder_memconfig;
    *(void *)a1 = v12;
    *((void *)v12 + 4) = 0LL;
    *((void *)v12 + 5) = -1LL;
    *((_OWORD *)v12 + 3) = 0u;
    *((_OWORD *)v12 + 4) = 0u;
    *((_OWORD *)v12 + 5) = 0u;
    *((_OWORD *)v12 + 6) = 0u;
    *((void *)v12 + 15) = 0LL;
    *((void *)v12 + 17) = 0LL;
  }

  *(_DWORD *)int v12 = 0;
  *((void *)v12 + 1) = 0LL;
  *((void *)v12 + 2) = 0LL;
  *((void *)v12 + 3) = a6;
  lzma_index_end(v13, a2);
  *((void *)v12 + 15) = 0LL;
  lzma_index_end(*((uint64_t **)v12 + 17), a2);
  uint64_t result = 0LL;
  *((void *)v12 + 16) = 0LL;
  *((void *)v12 + 17) = 0LL;
  *((void *)v12 + 18) = a4;
  *((void *)v12 + 19) = a3;
  if (a5 <= 1) {
    uint64_t v16 = 1LL;
  }
  else {
    uint64_t v16 = a5;
  }
  *((void *)v12 + 20) = v16;
  *((_OWORD *)v12 + 21) = xmmword_18116B440;
  return result;
}

uint64_t file_info_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  unint64_t v9 = *(void *)(a1 + 24) - *(void *)(a1 + 8);
  uint64_t v61 = *a4;
  if (v9 >= a5 - *a4) {
    uint64_t v10 = a5;
  }
  else {
    uint64_t v10 = v9 + v61;
  }
  uint64_t v11 = a1 + 352;
  int v12 = (uint64_t *)(a1 + 336);
  uint64_t v13 = a1 + 280;
  uint64_t v59 = a1 + 168;
  uint64_t v60 = a1 + 32;
  uint64_t v14 = (uint64_t *)(a1 + 120);
  uint64_t v62 = a1 + 224;
  int v15 = *(_DWORD *)a1;
  uint64_t v58 = a1 + 351;
  while (2)
  {
    switch(v15)
    {
      case 0:
        if (*(void *)(a1 + 24) < 0xCuLL)
        {
          uint64_t result = 7LL;
        }

        else
        {
          *(void *)(a1 + 8) += lzma_bufcpy(a3, a4, v10, v11, v12, *(void *)(a1 + 344));
          if (*(void *)(a1 + 336) < *(void *)(a1 + 344)) {
            goto LABEL_75;
          }
          uint64_t result = lzma_stream_header_decode(v59, v11);
          if (!(_DWORD)result)
          {
            uint64_t v17 = *(void *)(a1 + 24);
            if ((v17 & 0x8000000000000003LL) != 0) {
              goto LABEL_73;
            }
            *(void *)(a1 + 16) = v17;
            goto LABEL_11;
          }
        }

        break;
      case 1:
LABEL_11:
        *(_DWORD *)a1 = 2;
        uint64_t result = reverse_seek(a1, v61, a4, v10);
        if (!(_DWORD)result) {
          goto LABEL_12;
        }
        break;
      case 2:
LABEL_12:
        *(void *)(a1 + 8) += lzma_bufcpy(a3, a4, v10, v11, v12, *(void *)(a1 + 344));
        unint64_t v18 = *(void *)(a1 + 344);
        if (*(void *)(a1 + 336) < v18) {
          goto LABEL_75;
        }
        uint64_t v19 = 0LL;
        if (v18)
        {
          uint64_t v20 = v58;
          while (!*(_BYTE *)(v20 + v18))
          {
            --v20;
            if (v18 == ++v19)
            {
              uint64_t v19 = *(void *)(a1 + 344);
              break;
            }
          }
        }

        uint64_t v21 = *(void *)(a1 + 128) + v19;
        *(void *)(a1 + 128) = v21;
        *(void *)(a1 + 16) -= v19;
        unint64_t v22 = v18 - v19;
        if (!v22)
        {
          int v15 = 1;
          goto LABEL_72;
        }

        if ((v21 & 3) != 0) {
          goto LABEL_73;
        }
        *(_DWORD *)a1 = 3;
        *(void *)(a1 + 336) = v22;
        *(void *)(a1 + 344) = v22;
        if (v22 > 0xB) {
          goto LABEL_23;
        }
        uint64_t result = reverse_seek(a1, v61, a4, v10);
        if (!(_DWORD)result) {
          goto LABEL_23;
        }
        break;
      case 3:
LABEL_23:
        *(void *)(a1 + 8) += lzma_bufcpy(a3, a4, v10, v11, v12, *(void *)(a1 + 344));
        unint64_t v23 = *(void *)(a1 + 344);
        if (*(void *)(a1 + 336) < v23) {
          goto LABEL_75;
        }
        *(void *)(a1 + 16) -= 12LL;
        unint64_t v24 = v23 - 12;
        *(void *)(a1 + 344) = v24;
        LODWORD(result) = lzma_stream_footer_decode(v13, v11 + v24);
        if ((_DWORD)result == 7) {
          uint64_t result = 9LL;
        }
        else {
          uint64_t result = result;
        }
        if (!(_DWORD)result)
        {
          unint64_t v25 = *(void *)(a1 + 16);
          unint64_t v26 = *(void *)(a1 + 288);
          if (v25 < v26 + 12) {
            goto LABEL_73;
          }
          unint64_t v27 = v25 - v26;
          *(void *)(a1 + 16) = v27;
          *(_DWORD *)a1 = 4;
          unint64_t v28 = *(void *)(a1 + 344);
          BOOL v29 = v28 >= v26;
          uint64_t v30 = v28 - v26;
          if (v29)
          {
            *int v12 = v30;
            goto LABEL_34;
          }

          *int v12 = 0LL;
          v12[1] = 0LL;
          uint64_t v31 = *(void *)(a1 + 8);
          uint64_t v32 = *a4;
          if (v31 + v61 - *a4 <= v27 && v31 + v10 - v32 >= v27)
          {
            *a4 = v27 - v31 + v32;
            *(void *)(a1 + 8) = v27;
            goto LABEL_34;
          }

          **(void **)(a1 + 152) = v27;
          *a4 = v10;
          *(void *)(a1 + 8) = v27;
          uint64_t result = 12LL;
        }

        break;
      case 4:
LABEL_34:
        unint64_t v33 = *(void *)(a1 + 136);
        if (v33)
        {
          unint64_t v33 = lzma_index_memused(v33);
          unint64_t v34 = *(void *)(a1 + 160);
          if (v33 > v34) {
            goto LABEL_74;
          }
        }

        else
        {
          unint64_t v34 = *(void *)(a1 + 160);
        }

        uint64_t result = lzma_index_decoder_init(v60, a2, v14, v34 - v33);
        if (!(_DWORD)result)
        {
          *(void *)(a1 + 112) = *(void *)(a1 + 288);
          *(_DWORD *)a1 = 5;
          goto LABEL_40;
        }

        break;
      case 5:
LABEL_40:
        uint64_t v35 = v5;
        uint64_t v36 = v14;
        uint64_t v37 = *(void *)(a1 + 344);
        if (v37)
        {
          uint64_t v38 = *(void *)(a1 + 336);
          LODWORD(result) = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t, void, void, void, _DWORD))(a1 + 56))( *(void *)(a1 + 32),  a2,  v11,  v12,  v37,  0LL,  0LL,  0LL,  0);
          uint64_t v39 = v38 - *(void *)(a1 + 336) + *(void *)(a1 + 112);
          *(void *)(a1 + 112) = v39;
        }

        else
        {
          uint64_t v40 = *a4;
          unint64_t v41 = *(void *)(a1 + 112);
          if (v10 - *a4 <= v41) {
            uint64_t v42 = v10;
          }
          else {
            uint64_t v42 = v41 + *a4;
          }
          LODWORD(result) = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t, void, void, void, _DWORD))(a1 + 56))( *(void *)(a1 + 32),  a2,  a3,  a4,  v42,  0LL,  0LL,  0LL,  0);
          uint64_t v43 = *a4;
          uint64_t v39 = v40 - *a4 + *(void *)(a1 + 112);
          *(void *)(a1 + 112) = v39;
          *(void *)(a1 + 8) += v43 - v40;
        }

        if ((_DWORD)result == 1)
        {
          if (!v39
            && (unint64_t v44 = lzma_index_total_size(*(void *)(a1 + 120)) + 12,
                unint64_t v45 = *(void *)(a1 + 16),
                BOOL v29 = v45 >= v44,
                unint64_t v46 = v45 - v44,
                v29))
          {
            *(void *)(a1 + 16) = v46;
            if (!v46)
            {
              __int128 v47 = *(_OWORD *)(v59 + 16);
              *(_OWORD *)uint64_t v62 = *(_OWORD *)v59;
              *(_OWORD *)(v62 + 16) = v47;
              *(_OWORD *)(v62 + 32) = *(_OWORD *)(v59 + 32);
              *(void *)(v62 + 48) = *(void *)(v59 + 48);
              int v15 = 7;
              uint64_t v14 = v36;
              uint64_t v5 = v35;
              goto LABEL_72;
            }

            *(_DWORD *)a1 = 6;
            *(void *)(a1 + 16) = v46 + 12;
            uint64_t v48 = *(void *)(a1 + 344);
            if (v48)
            {
              unint64_t v49 = v48 - *(void *)(a1 + 288);
              BOOL v29 = v49 >= v44;
              unint64_t v50 = v49 - v44;
              if (v29)
              {
                unint64_t v51 = v50 + 12;
                *(void *)(a1 + 336) = v51;
                *(void *)(a1 + 344) = v51;
                uint64_t v14 = v36;
                uint64_t v5 = v35;
                goto LABEL_57;
              }
            }

            uint64_t result = reverse_seek(a1, v61, a4, v10);
            uint64_t v14 = v36;
            uint64_t v5 = v35;
            if (!(_DWORD)result) {
              goto LABEL_57;
            }
          }

          else
          {
LABEL_73:
            uint64_t result = 9LL;
          }
        }

        else
        {
          if (v39) {
            unsigned int v57 = 0;
          }
          else {
            unsigned int v57 = 9;
          }
          if ((_DWORD)result) {
            uint64_t result = result;
          }
          else {
            uint64_t result = v57;
          }
        }

        break;
      case 6:
LABEL_57:
        *(void *)(a1 + 8) += lzma_bufcpy(a3, a4, v10, v11, v12, *(void *)(a1 + 344));
        unint64_t v52 = *(void *)(a1 + 344);
        if (*(void *)(a1 + 336) < v52)
        {
LABEL_75:
          uint64_t result = 0LL;
        }

        else
        {
          *(void *)(a1 + 16) -= 12LL;
          unint64_t v53 = v52 - 12;
          *(void *)(a1 + 336) = v53;
          *(void *)(a1 + 344) = v53;
          LODWORD(result) = lzma_stream_header_decode(v62, v11 + v53);
          if ((_DWORD)result == 7) {
            uint64_t result = 9LL;
          }
          else {
            uint64_t result = result;
          }
          if (!(_DWORD)result)
          {
            *(_DWORD *)a1 = 7;
            goto LABEL_63;
          }
        }

        break;
      case 7:
LABEL_63:
        uint64_t result = lzma_stream_flags_compare(v62, v13);
        if (!(_DWORD)result)
        {
          lzma_index_stream_flags(*v14, v13);
          *(void *)(a1 + 128) = 0LL;
          uint64_t v55 = *(void *)(a1 + 136);
          if (!v55 || (uint64_t result = lzma_index_cat((int64x2_t *)*v14, v55, a2), !(_DWORD)result))
          {
            uint64_t v56 = *(void *)(a1 + 120);
            *(void *)(a1 + 136) = v56;
            *(void *)(a1 + 120) = 0LL;
            if (*(void *)(a1 + 16))
            {
              if (*(void *)(a1 + 344)) {
                int v15 = 2;
              }
              else {
                int v15 = 1;
              }
LABEL_72:
              *(_DWORD *)a1 = v15;
              continue;
            }

            **(void **)(a1 + 144) = v56;
            *(void *)(a1 + 136) = 0LL;
            *a4 = v10;
            uint64_t result = 1LL;
          }
        }

        break;
      default:
LABEL_74:
        uint64_t result = 11LL;
        break;
    }

    return result;
  }

void file_info_decoder_end(uint64_t **a1, uint64_t a2)
{
}

uint64_t file_info_decoder_memconfig(uint64_t a1, uint64_t *a2, void *a3, unint64_t a4)
{
  uint64_t v15 = 0LL;
  uint64_t v8 = *(void *)(a1 + 136);
  if (v8) {
    uint64_t v9 = lzma_index_memused(v8);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = *(void *)(a1 + 120);
  if (v10)
  {
    uint64_t v11 = lzma_index_memused(v10);
    uint64_t v15 = v11;
  }

  else if (*(_DWORD *)a1 == 5)
  {
    if ((*(unsigned int (**)(void, uint64_t *, char *, void))(a1 + 88))( *(void *)(a1 + 32),  &v15,  v14,  0LL))
    {
      return 11LL;
    }

    uint64_t v11 = v15;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  *a2 = v11 + v9;
  if (!(v11 + v9)) {
    *a2 = lzma_index_memusage(1LL, 0LL);
  }
  *a3 = *(void *)(a1 + 160);
  if (!a4) {
    return 0LL;
  }
  if (*a2 > a4) {
    return 6LL;
  }
  if (!*(void *)(a1 + 120)
    && *(_DWORD *)a1 == 5
    && (*(unsigned int (**)(void, char *, char *, unint64_t))(a1 + 88))( *(void *)(a1 + 32),  v14,  v13,  a4 - v9))
  {
    return 11LL;
  }

  uint64_t result = 0LL;
  *(void *)(a1 + 160) = a4;
  return result;
}

uint64_t reverse_seek(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a1 + 16);
  if (v4 < 0x18) {
    return 9LL;
  }
  uint64_t v6 = v4 - 12;
  if (v4 - 12 >= 0x2000) {
    uint64_t v6 = 0x2000LL;
  }
  *(void *)(a1 + 336) = 0LL;
  *(void *)(a1 + 344) = v6;
  unint64_t v7 = v4 - v6;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *a3;
  if (v8 + a2 - *a3 <= v7 && v8 + a4 - v9 >= v7)
  {
    uint64_t v5 = 0LL;
    a4 = v7 - v8 + v9;
  }

  else
  {
    **(void **)(a1 + 152) = v7;
    uint64_t v5 = 12LL;
  }

  *a3 = a4;
  *(void *)(a1 + 8) = v7;
  return v5;
}

uint64_t lzma_lzma_decoder_create(void *a1, uint64_t a2, unsigned int *a3, void *a4)
{
  if (*a1) {
    goto LABEL_4;
  }
  unint64_t v7 = lzma_alloc(0x6EC0uLL, a2);
  *a1 = v7;
  if (v7)
  {
    a1[1] = lzma_decode;
    a1[2] = lzma_decoder_reset;
    a1[3] = lzma_decoder_uncompressed;
LABEL_4:
    uint64_t result = 0LL;
    uint64_t v9 = *((void *)a3 + 1);
    *a4 = *a3;
    a4[1] = v9;
    a4[2] = a3[4];
    return result;
  }

  return 5LL;
}

double lzma_decode(uint64_t a1, const void **a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5 = a1;
  int v6 = *(_DWORD *)(a1 + 28276);
  if (v6)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = *a4;
    uint64_t v9 = a3 + *a4;
    uint64_t v10 = *a4 - a5;
    uint64_t v11 = 0xFFFFFFFFLL;
    do
    {
      if (!(v10 + v7) || v6 - 5 == (_DWORD)v7 && *(_BYTE *)(v9 + v7)) {
        return result;
      }
      unsigned int v12 = *(unsigned __int8 *)(v9 + v7) | (*(_DWORD *)(a1 + 28272) << 8);
      *a4 = v8 + v7 + 1;
      *(_DWORD *)(a1 + 28272) = v12;
      *(_DWORD *)(a1 + 28276) = v6 + v11;
      ++v7;
      --v11;
    }

    while (v6 != (_DWORD)v7);
    v387 = a4;
    uint64_t v13 = v8 + v7;
  }

  else
  {
    unsigned int v12 = *(_DWORD *)(a1 + 28272);
    v387 = a4;
    uint64_t v13 = *a4;
  }

  unint64_t v15 = (unint64_t)a2[1];
  unint64_t v14 = (unint64_t)a2[2];
  unint64_t v16 = v15;
  uint64_t v17 = (unsigned int *)(a1 + 28268);
  unsigned int v18 = *(_DWORD *)(a1 + 28268);
  unsigned int v19 = *(_DWORD *)(a1 + 28280);
  uint64_t v20 = *(unsigned int *)(a1 + 28284);
  uint64_t v22 = *(unsigned int *)(a1 + 28288);
  uint64_t v21 = *(unsigned int *)(a1 + 28292);
  unsigned int v402 = *(_DWORD *)(a1 + 28296);
  uint64_t v23 = *(void *)(a1 + 28328);
  unsigned int v25 = *(_DWORD *)(a1 + 28336);
  int v24 = *(_DWORD *)(a1 + 28340);
  uint64_t v26 = *(unsigned int *)(a1 + 28344);
  unsigned int v27 = *(_DWORD *)(a1 + 28348);
  unint64_t v28 = *(char **)(a1 + 28312);
  BOOL v29 = v28 == (char *)-1LL;
  BOOL v30 = v28 > (char *)a2[3] - v15 || v28 == (char *)-1LL;
  unint64_t v31 = (unint64_t)&v28[v15];
  if (v30) {
    unint64_t v32 = (unint64_t)a2[3];
  }
  else {
    unint64_t v32 = v31;
  }
  int v33 = *(_DWORD *)(a1 + 28324);
  char v384 = v29;
  BOOL v407 = v30;
  v401 = (unsigned __int16 *)(a1 + 27240);
  unint64_t v34 = (unsigned __int16 *)(a1 + 26212);
  uint64_t v35 = *a2;
  uint64_t v36 = a2[4];
  int v394 = *(_DWORD *)(a1 + 28304);
  uint64_t v395 = *(unsigned int *)(a1 + 28308);
  uint64_t v385 = a1 + 28268;
  int v406 = *(_DWORD *)(a1 + 28300);
  unsigned int v37 = v406 & v15;
  uint64_t v38 = a5;
  uint64_t v39 = a3;
  v404 = (unsigned __int16 *)(v5 + 26212);
  v408 = v36;
  v409 = v35;
  unint64_t v388 = v15;
  uint64_t v389 = v5;
  unint64_t v400 = v32;
  switch(v33)
  {
    case 0:
    case 1:
      goto LABEL_19;
    case 2:
      goto LABEL_31;
    case 3:
      goto LABEL_37;
    case 4:
      goto LABEL_43;
    case 5:
      goto LABEL_49;
    case 6:
      goto LABEL_55;
    case 7:
      goto LABEL_61;
    case 8:
      goto LABEL_67;
    case 9:
      goto LABEL_73;
    case 10:
      goto LABEL_502;
    case 11:
      goto LABEL_517;
    case 12:
      goto LABEL_532;
    case 13:
      goto LABEL_547;
    case 14:
      goto LABEL_562;
    case 15:
      goto LABEL_577;
    case 16:
      goto LABEL_592;
    case 17:
      goto LABEL_607;
    case 18:
      goto LABEL_614;
    case 19:
      goto LABEL_80;
    case 20:
      goto LABEL_88;
    case 21:
      goto LABEL_93;
    case 22:
      goto LABEL_166;
    case 23:
      goto LABEL_185;
    case 24:
      goto LABEL_127;
    case 25:
      goto LABEL_132;
    case 26:
      goto LABEL_144;
    case 27:
      goto LABEL_156;
    case 28:
      goto LABEL_138;
    case 29:
      goto LABEL_150;
    case 30:
      goto LABEL_179;
    case 31:
      goto LABEL_230;
    case 32:
      goto LABEL_247;
    case 33:
      goto LABEL_265;
    case 34:
      goto LABEL_290;
    case 35:
      goto LABEL_296;
    case 36:
      goto LABEL_309;
    case 37:
      goto LABEL_327;
    case 38:
      goto LABEL_345;
    case 39:
      goto LABEL_351;
    case 40:
      goto LABEL_363;
    case 41:
      goto LABEL_383;
    case 42:
      goto LABEL_395;
    case 43:
      goto LABEL_454;
    case 44:
      goto LABEL_459;
    case 45:
      goto LABEL_465;
    case 46:
      goto LABEL_471;
    case 47:
      goto LABEL_477;
    case 48:
      goto LABEL_625;
    case 49:
      goto LABEL_100;
    case 50:
      goto LABEL_113;
    case 51:
      goto LABEL_105;
    case 52:
      goto LABEL_121;
    case 53:
      goto LABEL_173;
    case 54:
      goto LABEL_200;
    case 55:
      goto LABEL_205;
    case 56:
      goto LABEL_211;
    case 57:
      goto LABEL_217;
    case 58:
      goto LABEL_236;
    case 59:
      goto LABEL_241;
    case 60:
      goto LABEL_259;
    case 61:
      goto LABEL_277;
    case 62:
      goto LABEL_253;
    case 63:
      goto LABEL_271;
    case 64:
      goto LABEL_315;
    case 65:
      goto LABEL_321;
    case 66:
      goto LABEL_333;
    case 67:
      goto LABEL_339;
    case 68:
      goto LABEL_357;
    case 69:
      goto LABEL_369;
    case 70:
      break;
    default:
      int v40 = 0;
      goto LABEL_636;
  }

LABEL_485:
  if (v32 - v16 >= v27) {
    size_t v318 = v27;
  }
  else {
    size_t v318 = (v32 - v16);
  }
  v27 -= v318;
  if (v318 <= v20)
  {
    unsigned int v396 = v27;
    uint64_t v397 = v23;
    unint64_t v399 = v14;
    unsigned int v398 = v21;
    if (v16 <= v20)
    {
      unsigned int v391 = v26;
      unsigned int v393 = v19;
      int v327 = v16 + ~(_DWORD)v20;
      v328 = &v35[v16];
      v329 = &v35[v327 + (_DWORD)v36];
      if (v318 <= -v327)
      {
        memmove(v328, v329, v318);
      }

      else
      {
        v330 = v35;
        memmove(v328, v329, -v327);
        v16 += -v327;
        size_t v318 = (v318 + v327);
        memcpy(&v330[v16], v330, v318);
      }

      unsigned int v27 = v396;
      v16 += v318;
      unint64_t v15 = v388;
      uint64_t v5 = v389;
      unint64_t v14 = v399;
      uint64_t v26 = v391;
      unsigned int v19 = v393;
      uint64_t v21 = v398;
      uint64_t v22 = v22;
      uint64_t v23 = v397;
      uint64_t v38 = a5;
      unint64_t v34 = v404;
      uint64_t v39 = a3;
      uint64_t v36 = v408;
      uint64_t v35 = v409;
    }

    else
    {
      unint64_t v320 = &v35[v16];
      v321 = &v35[v16 + ~(unint64_t)v20];
      unsigned int v322 = v19;
      unint64_t v392 = v16;
      uint64_t v323 = v5;
      unint64_t v324 = v15;
      unsigned int v390 = v20;
      uint64_t v325 = v26;
      memcpy(v320, v321, v318);
      uint64_t v36 = v408;
      uint64_t v35 = v409;
      unint64_t v34 = v404;
      uint64_t v39 = a3;
      uint64_t v26 = v325;
      uint64_t v20 = v390;
      uint64_t v21 = v398;
      unint64_t v15 = v324;
      uint64_t v5 = v323;
      unsigned int v19 = v322;
      unint64_t v14 = v399;
      unint64_t v16 = v392 + v318;
      uint64_t v23 = v397;
      unsigned int v27 = v396;
      uint64_t v38 = a5;
    }
  }

  else
  {
    do
    {
      else {
        uint64_t v319 = 0LL;
      }
      v35[v16] = v35[~(unint64_t)v20 + (void)v319 + v16];
      ++v16;
      LODWORD(v318) = v318 - 1;
    }

    while ((_DWORD)v318);
  }

  if (v14 <= v16) {
    unint64_t v14 = v16;
  }
  if (v27)
  {
    int v40 = 0;
    uint64_t v17 = (unsigned int *)v385;
    *(_DWORD *)(v385 + 56) = 70;
    goto LABEL_636;
  }

  unint64_t v32 = v400;
  while (1)
  {
    while (1)
    {
      unsigned int v37 = v406 & v16;
LABEL_19:
      char v41 = v407;
      if (v16 != v32) {
        char v41 = 1;
      }
      if ((v41 & 1) == 0)
      {
        if (!HIBYTE(v18))
        {
          if (v13 == v38)
          {
            int v40 = 0;
            uint64_t v17 = (unsigned int *)v385;
            *(_DWORD *)(v385 + 56) = 0;
            unint64_t v16 = v32;
            goto LABEL_635;
          }

          v18 <<= 8;
          int v382 = *(unsigned __int8 *)(v39 + v13++);
          unsigned int v12 = v382 | (v12 << 8);
        }

        if (!v12)
        {
          int v40 = 1;
LABEL_724:
          unint64_t v16 = v32;
          goto LABEL_632;
        }

        char v384 = 1;
        if (!*(_BYTE *)(v385 + 52))
        {
          int v40 = 9;
          goto LABEL_724;
        }
      }

      if (HIBYTE(v18))
      {
        unsigned int v42 = v18;
      }

      else
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 1;
          goto LABEL_634;
        }

        unsigned int v42 = v18 << 8;
        int v43 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v43 | (v12 << 8);
      }

      unint64_t v44 = (_WORD *)(v5 + 32LL * v19 + 2LL * v37 + 24576);
      int v45 = (unsigned __int16)*v44;
      unsigned int v18 = (v42 >> 11) * v45;
      unsigned int v46 = v12 - v18;
      if (v12 < v18) {
        break;
      }
      unsigned int v18 = v42 - v18;
      *v44 -= *v44 >> 5;
      unsigned int v12 = v46;
LABEL_80:
      uint64_t v80 = v21;
      uint64_t v21 = v22;
      if (!HIBYTE(v18))
      {
        if (v13 == a5)
        {
          int v40 = 0;
          uint64_t v17 = (unsigned int *)v385;
          *(_DWORD *)(v385 + 56) = 19;
          LODWORD(v21) = v80;
          uint64_t v13 = a5;
          goto LABEL_636;
        }

        v18 <<= 8;
        int v81 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v81 | (v12 << 8);
      }

      uint64_t v82 = (_WORD *)(v5 + 2LL * v19 + 24960);
      int v83 = (unsigned __int16)*v82;
      unsigned int v84 = (v18 >> 11) * v83;
      if (v12 < v84)
      {
        *uint64_t v82 = v83 + ((2048 - v83) >> 5);
        if (v19 >= 7) {
          unsigned int v19 = 10;
        }
        else {
          unsigned int v19 = 7;
        }
        unsigned int v25 = 1;
        uint64_t v22 = v20;
        unsigned int v402 = v80;
        unsigned int v18 = (v18 >> 11) * v83;
        uint64_t v38 = a5;
LABEL_88:
        if (!HIBYTE(v18))
        {
          if (v13 != v38)
          {
            v18 <<= 8;
            int v85 = *(unsigned __int8 *)(v39 + v13++);
            unsigned int v12 = v85 | (v12 << 8);
            goto LABEL_91;
          }

          int v40 = 0;
          int v379 = 20;
          goto LABEL_634;
        }

LABEL_91:
        int v86 = *v34;
        unsigned int v87 = (v18 >> 11) * v86;
        if (v12 >= v87)
        {
          v18 -= v87;
          *v34 -= *v34 >> 5;
          v12 -= v87;
LABEL_127:
          if (!HIBYTE(v18))
          {
            if (v13 == v38)
            {
              int v40 = 0;
              int v379 = 24;
              goto LABEL_634;
            }

            int v107 = *(unsigned __int8 *)(v39 + v13);
            v18 <<= 8;
            ++v13;
            unsigned int v12 = v107 | (v12 << 8);
          }

          int v108 = v34[1];
          unsigned int v109 = (v18 >> 11) * v108;
          if (v12 >= v109)
          {
            v18 -= v109;
            v34[1] -= v34[1] >> 5;
            v12 -= v109;
LABEL_138:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 28;
                goto LABEL_634;
              }

              int v114 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v114 | (v12 << 8);
            }

            int v115 = (_WORD *)(v5 + 2LL * v25 + 26728);
            int v116 = (unsigned __int16)*v115;
            unsigned int v117 = (v18 >> 11) * v116;
            v25 *= 2;
            if (v12 >= v117)
            {
              v18 -= v117;
              *v115 -= *v115 >> 5;
              v25 |= 1u;
              v12 -= v117;
            }

            else
            {
              *int v115 = v116 + ((2048 - v116) >> 5);
              unsigned int v18 = (v18 >> 11) * v116;
            }

LABEL_150:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 29;
                goto LABEL_634;
              }

              int v122 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v122 | (v12 << 8);
            }

            uint64_t v123 = (_WORD *)(v5 + 2LL * v25 + 26728);
            int v124 = (unsigned __int16)*v123;
            unsigned int v125 = (v18 >> 11) * v124;
            v25 *= 2;
            if (v12 >= v125)
            {
              v18 -= v125;
              *v123 -= *v123 >> 5;
              v25 |= 1u;
              v12 -= v125;
            }

            else
            {
              *uint64_t v123 = v124 + ((2048 - v124) >> 5);
              unsigned int v18 = (v18 >> 11) * v124;
            }

LABEL_179:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 30;
                goto LABEL_634;
              }

              int v141 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v141 | (v12 << 8);
            }

            unsigned int v142 = (_WORD *)(v5 + 2LL * v25 + 26728);
            int v143 = (unsigned __int16)*v142;
            unsigned int v144 = (v18 >> 11) * v143;
            v25 *= 2;
            if (v12 >= v144)
            {
              v18 -= v144;
              *v142 -= *v142 >> 5;
              v25 |= 1u;
              v12 -= v144;
            }

            else
            {
              *unsigned int v142 = v143 + ((2048 - v143) >> 5);
              unsigned int v18 = (v18 >> 11) * v143;
            }

LABEL_230:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 31;
                goto LABEL_634;
              }

              int v169 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v169 | (v12 << 8);
            }

            unsigned int v170 = (_WORD *)(v5 + 2LL * v25 + 26728);
            int v171 = (unsigned __int16)*v170;
            unsigned int v172 = (v18 >> 11) * v171;
            v25 *= 2;
            if (v12 >= v172)
            {
              v18 -= v172;
              *v170 -= *v170 >> 5;
              v25 |= 1u;
              v12 -= v172;
            }

            else
            {
              *unsigned int v170 = v171 + ((2048 - v171) >> 5);
              unsigned int v18 = (v18 >> 11) * v171;
            }

LABEL_247:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 32;
                goto LABEL_634;
              }

              int v180 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v180 | (v12 << 8);
            }

            unint64_t v181 = (_WORD *)(v5 + 2LL * v25 + 26728);
            int v182 = (unsigned __int16)*v181;
            unsigned int v183 = (v18 >> 11) * v182;
            v25 *= 2;
            if (v12 >= v183)
            {
              v18 -= v183;
              *v181 -= *v181 >> 5;
              v25 |= 1u;
              v12 -= v183;
            }

            else
            {
              *unint64_t v181 = v182 + ((2048 - v182) >> 5);
              unsigned int v18 = (v18 >> 11) * v182;
            }

LABEL_265:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 33;
                goto LABEL_634;
              }

              int v192 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v192 | (v12 << 8);
            }

            unsigned int v193 = (_WORD *)(v5 + 2LL * v25 + 26728);
            int v194 = (unsigned __int16)*v193;
            unsigned int v195 = (v18 >> 11) * v194;
            v25 *= 2;
            if (v12 >= v195)
            {
              v18 -= v195;
              *v193 -= *v193 >> 5;
              v25 |= 1u;
              v12 -= v195;
            }

            else
            {
              *unsigned int v193 = v194 + ((2048 - v194) >> 5);
              unsigned int v18 = (v18 >> 11) * v194;
            }

LABEL_290:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 34;
                goto LABEL_634;
              }

              int v206 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v206 | (v12 << 8);
            }

            unsigned int v207 = (_WORD *)(v5 + 2LL * v25 + 26728);
            int v208 = (unsigned __int16)*v207;
            unsigned int v209 = (v18 >> 11) * v208;
            v25 *= 2;
            if (v12 >= v209)
            {
              v18 -= v209;
              *v207 -= *v207 >> 5;
              v25 |= 1u;
              v12 -= v209;
            }

            else
            {
              *unsigned int v207 = v208 + ((2048 - v208) >> 5);
              unsigned int v18 = (v18 >> 11) * v208;
            }

LABEL_296:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 35;
                goto LABEL_634;
              }

              int v210 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v210 | (v12 << 8);
            }

            unsigned int v211 = (_WORD *)(v5 + 2LL * v25 + 26728);
            unsigned int v212 = (unsigned __int16)*v211;
            unsigned int v213 = (v18 >> 11) * v212;
            int v214 = 2 * v25;
            unsigned int v215 = v212 - (v212 >> 5);
            unsigned int v216 = v212 + ((2048 - v212) >> 5);
            if (v12 < v213)
            {
              unsigned int v18 = v213;
            }

            else
            {
              LOWORD(v216) = v215;
              int v214 = (2 * v25) | 1;
              v18 -= v213;
            }

            if (v12 >= v213) {
              v12 -= v213;
            }
            *unsigned int v211 = v216;
            unsigned int v27 = v214 - 238;
          }

          else
          {
            v34[1] = v108 + ((2048 - v108) >> 5);
            unsigned int v18 = (v18 >> 11) * v108;
LABEL_132:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 25;
                goto LABEL_634;
              }

              int v110 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v110 | (v12 << 8);
            }

            int v111 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 26472);
            int v112 = (unsigned __int16)*v111;
            unsigned int v113 = (v18 >> 11) * v112;
            v25 *= 2;
            if (v12 >= v113)
            {
              v18 -= v113;
              *v111 -= *v111 >> 5;
              v25 |= 1u;
              v12 -= v113;
            }

            else
            {
              *int v111 = v112 + ((2048 - v112) >> 5);
              unsigned int v18 = (v18 >> 11) * v112;
            }

LABEL_144:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 26;
                goto LABEL_634;
              }

              int v118 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v118 | (v12 << 8);
            }

            unsigned int v119 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 26472);
            int v120 = (unsigned __int16)*v119;
            unsigned int v121 = (v18 >> 11) * v120;
            v25 *= 2;
            if (v12 >= v121)
            {
              v18 -= v121;
              *v119 -= *v119 >> 5;
              v25 |= 1u;
              v12 -= v121;
            }

            else
            {
              *unsigned int v119 = v120 + ((2048 - v120) >> 5);
              unsigned int v18 = (v18 >> 11) * v120;
            }

LABEL_156:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 27;
                goto LABEL_634;
              }

              int v126 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v126 | (v12 << 8);
            }

            int v127 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 26472);
            unsigned int v128 = (unsigned __int16)*v127;
            unsigned int v129 = (v18 >> 11) * v128;
            int v130 = 2 * v25;
            unsigned int v131 = v128 - (v128 >> 5);
            unsigned int v132 = v128 + ((2048 - v128) >> 5);
            if (v12 < v129)
            {
              unsigned int v18 = v129;
            }

            else
            {
              LOWORD(v132) = v131;
              int v130 = (2 * v25) | 1;
              v18 -= v129;
            }

            if (v12 >= v129) {
              v12 -= v129;
            }
            *int v127 = v132;
            unsigned int v27 = v130 + 2;
          }
        }

        else
        {
          *unint64_t v34 = v86 + ((2048 - v86) >> 5);
          unsigned int v18 = (v18 >> 11) * v86;
LABEL_93:
          if (!HIBYTE(v18))
          {
            if (v13 == v38)
            {
              int v40 = 0;
              int v379 = 21;
              goto LABEL_634;
            }

            v18 <<= 8;
            int v88 = *(unsigned __int8 *)(v39 + v13++);
            unsigned int v12 = v88 | (v12 << 8);
          }

          unint64_t v89 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 26216);
          int v90 = (unsigned __int16)*v89;
          unsigned int v91 = (v18 >> 11) * v90;
          v25 *= 2;
          if (v12 >= v91)
          {
            v18 -= v91;
            *v89 -= *v89 >> 5;
            v25 |= 1u;
            v12 -= v91;
          }

          else
          {
            *unint64_t v89 = v90 + ((2048 - v90) >> 5);
            unsigned int v18 = (v18 >> 11) * v90;
          }

LABEL_166:
          if (!HIBYTE(v18))
          {
            if (v13 == v38)
            {
              int v40 = 0;
              int v379 = 22;
              goto LABEL_634;
            }

            int v133 = *(unsigned __int8 *)(v39 + v13);
            v18 <<= 8;
            ++v13;
            unsigned int v12 = v133 | (v12 << 8);
          }

          unint64_t v134 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 26216);
          int v135 = (unsigned __int16)*v134;
          unsigned int v136 = (v18 >> 11) * v135;
          v25 *= 2;
          if (v12 >= v136)
          {
            v18 -= v136;
            *v134 -= *v134 >> 5;
            v25 |= 1u;
            v12 -= v136;
          }

          else
          {
            *unint64_t v134 = v135 + ((2048 - v135) >> 5);
            unsigned int v18 = (v18 >> 11) * v135;
          }

LABEL_185:
          if (!HIBYTE(v18))
          {
            if (v13 == v38)
            {
              int v40 = 0;
              int v379 = 23;
              goto LABEL_634;
            }

            int v145 = *(unsigned __int8 *)(v39 + v13);
            v18 <<= 8;
            ++v13;
            unsigned int v12 = v145 | (v12 << 8);
          }

          uint64_t v146 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 26216);
          unsigned int v147 = (unsigned __int16)*v146;
          unsigned int v148 = (v18 >> 11) * v147;
          int v149 = 2 * v25;
          unsigned int v150 = v147 - (v147 >> 5);
          unsigned int v151 = v147 + ((2048 - v147) >> 5);
          if (v12 < v148)
          {
            unsigned int v18 = v148;
          }

          else
          {
            LOWORD(v151) = v150;
            int v149 = (2 * v25) | 1;
            v18 -= v148;
          }

          if (v12 >= v148) {
            v12 -= v148;
          }
          *uint64_t v146 = v151;
          unsigned int v27 = v149 - 6;
        }

        LODWORD(v217) = v27 - 2;
        if (v27 >= 6) {
          uint64_t v217 = 3LL;
        }
        else {
          uint64_t v217 = v217;
        }
        uint64_t v23 = v5 + (v217 << 7) + 25440;
        unsigned int v25 = 1;
LABEL_309:
        if (!HIBYTE(v18))
        {
          if (v13 == v38)
          {
            int v40 = 0;
            int v379 = 36;
            goto LABEL_634;
          }

          int v218 = *(unsigned __int8 *)(v39 + v13);
          v18 <<= 8;
          ++v13;
          unsigned int v12 = v218 | (v12 << 8);
        }

        uint64_t v219 = v25;
        unsigned int v220 = *(unsigned __int16 *)(v23 + 2LL * v25);
        unsigned int v221 = (v18 >> 11) * v220;
        v25 *= 2;
        if (v12 >= v221)
        {
          v18 -= v221;
          *(_WORD *)(v23 + 2 * v219) = v220 - (v220 >> 5);
          v25 |= 1u;
          v12 -= v221;
        }

        else
        {
          *(_WORD *)(v23 + 2 * v219) = v220 + ((2048 - v220) >> 5);
          unsigned int v18 = (v18 >> 11) * v220;
        }

LABEL_327:
        if (!HIBYTE(v18))
        {
          if (v13 == v38)
          {
            int v40 = 0;
            int v379 = 37;
            goto LABEL_634;
          }

          int v230 = *(unsigned __int8 *)(v39 + v13);
          v18 <<= 8;
          ++v13;
          unsigned int v12 = v230 | (v12 << 8);
        }

        uint64_t v231 = v25;
        unsigned int v232 = *(unsigned __int16 *)(v23 + 2LL * v25);
        unsigned int v233 = (v18 >> 11) * v232;
        v25 *= 2;
        if (v12 >= v233)
        {
          v18 -= v233;
          *(_WORD *)(v23 + 2 * v231) = v232 - (v232 >> 5);
          v25 |= 1u;
          v12 -= v233;
        }

        else
        {
          *(_WORD *)(v23 + 2 * v231) = v232 + ((2048 - v232) >> 5);
          unsigned int v18 = (v18 >> 11) * v232;
        }

LABEL_345:
        if (!HIBYTE(v18))
        {
          if (v13 == v38)
          {
            int v40 = 0;
            int v379 = 38;
            goto LABEL_634;
          }

          int v242 = *(unsigned __int8 *)(v39 + v13);
          v18 <<= 8;
          ++v13;
          unsigned int v12 = v242 | (v12 << 8);
        }

        uint64_t v243 = v25;
        unsigned int v244 = *(unsigned __int16 *)(v23 + 2LL * v25);
        unsigned int v245 = (v18 >> 11) * v244;
        v25 *= 2;
        if (v12 >= v245)
        {
          v18 -= v245;
          *(_WORD *)(v23 + 2 * v243) = v244 - (v244 >> 5);
          v25 |= 1u;
          v12 -= v245;
        }

        else
        {
          *(_WORD *)(v23 + 2 * v243) = v244 + ((2048 - v244) >> 5);
          unsigned int v18 = (v18 >> 11) * v244;
        }

LABEL_351:
        if (!HIBYTE(v18))
        {
          if (v13 == v38)
          {
            int v40 = 0;
            int v379 = 39;
            goto LABEL_634;
          }

          int v246 = *(unsigned __int8 *)(v39 + v13);
          v18 <<= 8;
          ++v13;
          unsigned int v12 = v246 | (v12 << 8);
        }

        uint64_t v247 = v25;
        unsigned int v248 = *(unsigned __int16 *)(v23 + 2LL * v25);
        unsigned int v249 = (v18 >> 11) * v248;
        v25 *= 2;
        if (v12 >= v249)
        {
          v18 -= v249;
          *(_WORD *)(v23 + 2 * v247) = v248 - (v248 >> 5);
          v25 |= 1u;
          v12 -= v249;
        }

        else
        {
          *(_WORD *)(v23 + 2 * v247) = v248 + ((2048 - v248) >> 5);
          unsigned int v18 = (v18 >> 11) * v248;
        }

LABEL_363:
        if (!HIBYTE(v18))
        {
          if (v13 == v38)
          {
            int v40 = 0;
            int v379 = 40;
            goto LABEL_634;
          }

          int v254 = *(unsigned __int8 *)(v39 + v13);
          v18 <<= 8;
          ++v13;
          unsigned int v12 = v254 | (v12 << 8);
        }

        uint64_t v255 = v25;
        unsigned int v256 = *(unsigned __int16 *)(v23 + 2LL * v25);
        unsigned int v257 = (v18 >> 11) * v256;
        v25 *= 2;
        if (v12 >= v257)
        {
          v18 -= v257;
          *(_WORD *)(v23 + 2 * v255) = v256 - (v256 >> 5);
          v25 |= 1u;
          v12 -= v257;
        }

        else
        {
          *(_WORD *)(v23 + 2 * v255) = v256 + ((2048 - v256) >> 5);
          unsigned int v18 = (v18 >> 11) * v256;
        }

LABEL_383:
        if (!HIBYTE(v18))
        {
          if (v13 == v38)
          {
            int v40 = 0;
            int v379 = 41;
            goto LABEL_634;
          }

          int v264 = *(unsigned __int8 *)(v39 + v13);
          v18 <<= 8;
          ++v13;
          unsigned int v12 = v264 | (v12 << 8);
        }

        unsigned int v265 = *(unsigned __int16 *)(v23 + 2LL * v25);
        unsigned int v266 = (v18 >> 11) * v265;
        int v267 = 2 * v25;
        unsigned int v268 = v265 - (v265 >> 5);
        unsigned int v269 = v265 + ((2048 - v265) >> 5);
        if (v12 < v266)
        {
          unsigned int v18 = v266;
        }

        else
        {
          LOWORD(v269) = v268;
          int v267 = (2 * v25) | 1;
          v18 -= v266;
        }

        if (v12 >= v266) {
          v12 -= v266;
        }
        *(_WORD *)(v23 + 2LL * v25) = v269;
        unsigned int v25 = v267 - 64;
        if ((v267 - 64) >= 4)
        {
          unsigned int v270 = v25 >> 1;
          LODWORD(v20) = v267 & 1 | 2;
          uint64_t v36 = v408;
          uint64_t v35 = v409;
          if (v25 > 0xD)
          {
            int v24 = v270 - 5;
            do
            {
LABEL_454:
              if (!HIBYTE(v18))
              {
                if (v13 == v38)
                {
                  int v40 = 0;
                  int v379 = 43;
                  goto LABEL_634;
                }

                v18 <<= 8;
                int v298 = *(unsigned __int8 *)(v39 + v13++);
                unsigned int v12 = v298 | (v12 << 8);
              }

              int v299 = v12 - (v18 >> 1);
              int v300 = (v299 >> 31) & (v18 >> 1);
              v18 >>= 1;
              unsigned int v12 = v300 + v299;
              LODWORD(v20) = (v299 >> 31) + 2 * v20 + 1;
              --v24;
            }

            while (v24);
            uint64_t v20 = (16 * v20);
            unsigned int v25 = 1;
LABEL_459:
            if (!HIBYTE(v18))
            {
              if (v13 != v38)
              {
                int v301 = *(unsigned __int8 *)(v39 + v13);
                v18 <<= 8;
                ++v13;
                unsigned int v12 = v301 | (v12 << 8);
                goto LABEL_462;
              }

              int v40 = 0;
              int v379 = 44;
              goto LABEL_634;
            }

LABEL_462:
            unsigned int v302 = (_WORD *)(v5 + 2LL * v25 + 26180);
            int v303 = (unsigned __int16)*v302;
            unsigned int v304 = (v18 >> 11) * v303;
            v25 *= 2;
            if (v12 >= v304)
            {
              v18 -= v304;
              *v302 -= *v302 >> 5;
              v25 |= 1u;
              uint64_t v20 = (v20 + 1);
              v12 -= v304;
            }

            else
            {
              *unsigned int v302 = v303 + ((2048 - v303) >> 5);
              unsigned int v18 = (v18 >> 11) * v303;
            }

LABEL_465:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 45;
                goto LABEL_634;
              }

              int v305 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v305 | (v12 << 8);
            }

            unsigned int v306 = (_WORD *)(v5 + 2LL * v25 + 26180);
            int v307 = (unsigned __int16)*v306;
            unsigned int v308 = (v18 >> 11) * v307;
            v25 *= 2;
            if (v12 >= v308)
            {
              v18 -= v308;
              *v306 -= *v306 >> 5;
              v25 |= 1u;
              uint64_t v20 = (v20 + 2);
              v12 -= v308;
            }

            else
            {
              *unsigned int v306 = v307 + ((2048 - v307) >> 5);
              unsigned int v18 = (v18 >> 11) * v307;
            }

LABEL_471:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 46;
                goto LABEL_634;
              }

              int v309 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v309 | (v12 << 8);
            }

            int v310 = (_WORD *)(v5 + 2LL * v25 + 26180);
            int v311 = (unsigned __int16)*v310;
            unsigned int v312 = (v18 >> 11) * v311;
            v25 *= 2;
            if (v12 >= v312)
            {
              v18 -= v312;
              *v310 -= *v310 >> 5;
              v25 |= 1u;
              uint64_t v20 = (v20 + 4);
              v12 -= v312;
            }

            else
            {
              *int v310 = v311 + ((2048 - v311) >> 5);
              unsigned int v18 = (v18 >> 11) * v311;
            }

LABEL_477:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 47;
                goto LABEL_634;
              }

              int v313 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v313 | (v12 << 8);
            }

            unsigned int v314 = (_WORD *)(v5 + 2LL * v25 + 26180);
            unsigned int v315 = (unsigned __int16)*v314;
            unsigned int v316 = (v18 >> 11) * v315;
            if (v12 >= v316)
            {
              v18 -= v316;
              unsigned int v317 = v315 - (v315 >> 5);
              uint64_t v20 = (v20 + 8);
              v12 -= v316;
            }

            else
            {
              unsigned int v317 = v315 + ((2048 - v315) >> 5);
              unsigned int v18 = v316;
            }

            *unsigned int v314 = v317;
            if ((_DWORD)v20 == -1)
            {
              if ((v384 & 1) != 0)
              {
LABEL_625:
                if (!HIBYTE(v18))
                {
                  if (v13 == v38)
                  {
                    int v40 = 0;
                    int v379 = 48;
                    goto LABEL_634;
                  }

                  int v378 = *(unsigned __int8 *)(v39 + v13);
                  v18 <<= 8;
                  ++v13;
                  unsigned int v12 = v378 | (v12 << 8);
                }

                if (v12) {
                  int v40 = 9;
                }
                else {
                  int v40 = 1;
                }
                goto LABEL_632;
              }

LABEL_631:
              int v40 = 9;
LABEL_632:
              uint64_t v17 = (unsigned int *)v385;
              goto LABEL_636;
            }
          }

          else
          {
            uint64_t v26 = 0LL;
            int v24 = v270 - 1;
            uint64_t v20 = ((_DWORD)v20 << (v270 - 1));
            uint64_t v23 = v5 + 2LL * v20 - 2LL * v25 + 25950;
            unsigned int v25 = 1;
LABEL_395:
            switch(v24)
            {
              case 1:
                goto LABEL_447;
              case 2:
                goto LABEL_432;
              case 3:
                goto LABEL_420;
              case 4:
                goto LABEL_408;
              case 5:
                if (HIBYTE(v18)) {
                  goto LABEL_399;
                }
                if (v13 == v38)
                {
                  int v40 = 0;
                  uint64_t v17 = (unsigned int *)v385;
                  *(_DWORD *)(v385 + 56) = 42;
                  int v24 = 5;
                  goto LABEL_635;
                }

                int v271 = *(unsigned __int8 *)(v39 + v13);
                v18 <<= 8;
                ++v13;
                unsigned int v12 = v271 | (v12 << 8);
LABEL_399:
                uint64_t v272 = v25;
                unsigned int v273 = *(unsigned __int16 *)(v23 + 2LL * v25);
                unsigned int v274 = (v18 >> 11) * v273;
                unsigned int v275 = v273 - (v273 >> 5);
                unsigned int v276 = v273 + ((2048 - v273) >> 5);
                if (v12 < v274)
                {
                  v25 *= 2;
                }

                else
                {
                  LOWORD(v276) = v275;
                  LODWORD(v20) = v20 + 1;
                  unsigned int v25 = (2 * v25) | 1;
                }

                if (v12 < v274) {
                  unsigned int v18 = v274;
                }
                else {
                  v18 -= v274;
                }
                if (v12 >= v274) {
                  v12 -= v274;
                }
                *(_WORD *)(v23 + 2 * v272) = v276;
                LODWORD(v26) = v26 + 1;
LABEL_408:
                if (HIBYTE(v18)) {
                  goto LABEL_411;
                }
                if (v13 == v38)
                {
                  int v40 = 0;
                  uint64_t v17 = (unsigned int *)v385;
                  *(_DWORD *)(v385 + 56) = 42;
                  int v24 = 4;
                  goto LABEL_635;
                }

                int v277 = *(unsigned __int8 *)(v39 + v13);
                v18 <<= 8;
                ++v13;
                unsigned int v12 = v277 | (v12 << 8);
LABEL_411:
                uint64_t v278 = v25;
                unsigned int v279 = *(unsigned __int16 *)(v23 + 2LL * v25);
                unsigned int v280 = (v18 >> 11) * v279;
                unsigned int v281 = v279 - (v279 >> 5);
                unsigned int v282 = v279 + ((2048 - v279) >> 5);
                if (v12 < v280)
                {
                  v25 *= 2;
                }

                else
                {
                  LOWORD(v282) = v281;
                  LODWORD(v20) = (1 << v26) + v20;
                  unsigned int v25 = (2 * v25) | 1;
                }

                if (v12 < v280) {
                  unsigned int v18 = v280;
                }
                else {
                  v18 -= v280;
                }
                if (v12 >= v280) {
                  v12 -= v280;
                }
                *(_WORD *)(v23 + 2 * v278) = v282;
                LODWORD(v26) = v26 + 1;
LABEL_420:
                if (HIBYTE(v18)) {
                  goto LABEL_423;
                }
                if (v13 == v38)
                {
                  int v40 = 0;
                  uint64_t v17 = (unsigned int *)v385;
                  *(_DWORD *)(v385 + 56) = 42;
                  int v24 = 3;
                  goto LABEL_635;
                }

                int v283 = *(unsigned __int8 *)(v39 + v13);
                v18 <<= 8;
                ++v13;
                unsigned int v12 = v283 | (v12 << 8);
LABEL_423:
                uint64_t v284 = v25;
                unsigned int v285 = *(unsigned __int16 *)(v23 + 2LL * v25);
                unsigned int v286 = (v18 >> 11) * v285;
                unsigned int v287 = v285 - (v285 >> 5);
                unsigned int v288 = v285 + ((2048 - v285) >> 5);
                if (v12 < v286)
                {
                  v25 *= 2;
                }

                else
                {
                  LOWORD(v288) = v287;
                  LODWORD(v20) = (1 << v26) + v20;
                  unsigned int v25 = (2 * v25) | 1;
                }

                if (v12 < v286) {
                  unsigned int v18 = v286;
                }
                else {
                  v18 -= v286;
                }
                if (v12 >= v286) {
                  v12 -= v286;
                }
                *(_WORD *)(v23 + 2 * v284) = v288;
                LODWORD(v26) = v26 + 1;
LABEL_432:
                if (HIBYTE(v18)) {
                  goto LABEL_435;
                }
                if (v13 == v38)
                {
                  int v40 = 0;
                  uint64_t v17 = (unsigned int *)v385;
                  *(_DWORD *)(v385 + 56) = 42;
                  int v24 = 2;
                  goto LABEL_635;
                }

                int v289 = *(unsigned __int8 *)(v39 + v13);
                v18 <<= 8;
                ++v13;
                unsigned int v12 = v289 | (v12 << 8);
LABEL_435:
                uint64_t v290 = v25;
                unsigned int v291 = *(unsigned __int16 *)(v23 + 2LL * v25);
                unsigned int v292 = (v18 >> 11) * v291;
                unsigned int v293 = v291 - (v291 >> 5);
                unsigned int v294 = v291 + ((2048 - v291) >> 5);
                if (v12 < v292)
                {
                  uint64_t v20 = v20;
                }

                else
                {
                  LOWORD(v294) = v293;
                  uint64_t v20 = ((1 << v26) + v20);
                }

                if (v12 < v292) {
                  v25 *= 2;
                }
                else {
                  unsigned int v25 = (2 * v25) | 1;
                }
                if (v12 < v292) {
                  unsigned int v18 = v292;
                }
                else {
                  v18 -= v292;
                }
                if (v12 >= v292) {
                  v12 -= v292;
                }
                *(_WORD *)(v23 + 2 * v290) = v294;
                uint64_t v26 = (v26 + 1);
                unint64_t v34 = v404;
                uint64_t v36 = v408;
                uint64_t v35 = v409;
LABEL_447:
                if (HIBYTE(v18)) {
                  goto LABEL_450;
                }
                if (v13 == v38)
                {
                  int v40 = 0;
                  uint64_t v17 = (unsigned int *)v385;
                  *(_DWORD *)(v385 + 56) = 42;
                  int v24 = 1;
                  goto LABEL_635;
                }

                int v295 = *(unsigned __int8 *)(v39 + v13);
                v18 <<= 8;
                ++v13;
                unsigned int v12 = v295 | (v12 << 8);
LABEL_450:
                unsigned int v296 = *(unsigned __int16 *)(v23 + 2LL * v25);
                unsigned int v297 = (v18 >> 11) * v296;
                if (v12 >= v297)
                {
                  *(_WORD *)(v23 + 2LL * v25) = v296 - (v296 >> 5);
                  v18 -= v297;
                  int v24 = 1;
                  uint64_t v20 = ((1 << v26) + v20);
                  v12 -= v297;
                }

                else
                {
                  *(_WORD *)(v23 + 2LL * v25) = v296 + ((2048 - v296) >> 5);
                  int v24 = 1;
                  unsigned int v18 = (v18 >> 11) * v296;
                }

                break;
              default:
                break;
            }
          }
        }

        else
        {
          uint64_t v20 = (v267 - 64);
          uint64_t v36 = v408;
          uint64_t v35 = v409;
        }

        goto LABEL_485;
      }

      v18 -= v84;
      *v82 -= *v82 >> 5;
      if (!v14)
      {
        int v40 = 9;
        LODWORD(v21) = v80;
        v12 -= v84;
        goto LABEL_632;
      }

      uint64_t v21 = v80;
      v12 -= v84;
      uint64_t v38 = a5;
LABEL_100:
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 49;
          goto LABEL_634;
        }

        int v92 = *(unsigned __int8 *)(v39 + v13);
        v18 <<= 8;
        ++v13;
        unsigned int v12 = v92 | (v12 << 8);
      }

      int v93 = (_WORD *)(v5 + 2LL * v19 + 24984);
      int v94 = (unsigned __int16)*v93;
      unsigned int v95 = (v18 >> 11) * v94;
      if (v12 >= v95)
      {
        v18 -= v95;
        *v93 -= *v93 >> 5;
        v12 -= v95;
LABEL_121:
        if (!HIBYTE(v18))
        {
          if (v13 != v38)
          {
            int v102 = *(unsigned __int8 *)(v39 + v13);
            v18 <<= 8;
            ++v13;
            unsigned int v12 = v102 | (v12 << 8);
            goto LABEL_124;
          }

          int v40 = 0;
          int v379 = 52;
LABEL_634:
          uint64_t v17 = (unsigned int *)v385;
          *(_DWORD *)(v385 + 56) = v379;
LABEL_635:
          uint64_t v13 = v38;
          goto LABEL_636;
        }

LABEL_124:
        uint64_t v103 = (_WORD *)(v5 + 2LL * v19 + 25008);
        int v104 = (unsigned __int16)*v103;
        unsigned int v105 = (v18 >> 11) * v104;
        if (v12 >= v105)
        {
          v18 -= v105;
          *v103 -= *v103 >> 5;
          v12 -= v105;
LABEL_173:
          if (!HIBYTE(v18))
          {
            if (v13 == v38)
            {
              int v40 = 0;
              int v379 = 53;
              goto LABEL_634;
            }

            int v137 = *(unsigned __int8 *)(v39 + v13);
            v18 <<= 8;
            ++v13;
            unsigned int v12 = v137 | (v12 << 8);
          }

          BOOL v138 = (_WORD *)(v5 + 2LL * v19 + 25032);
          int v139 = (unsigned __int16)*v138;
          unsigned int v140 = (v18 >> 11) * v139;
          unsigned int v100 = v12 - v140;
          if (v12 >= v140)
          {
            v18 -= v140;
            *v138 -= *v138 >> 5;
            uint64_t v106 = v402;
            unsigned int v402 = v21;
LABEL_195:
            unsigned int v12 = v100;
          }

          else
          {
            *BOOL v138 = v139 + ((2048 - v139) >> 5);
            uint64_t v106 = v21;
            unsigned int v18 = (v18 >> 11) * v139;
          }
        }

        else
        {
          *uint64_t v103 = v104 + ((2048 - v104) >> 5);
          uint64_t v106 = v22;
          uint64_t v22 = v21;
          unsigned int v18 = (v18 >> 11) * v104;
        }

        uint64_t v21 = v22;
        uint64_t v22 = v20;
        if (v19 >= 7) {
          unsigned int v19 = 11;
        }
        else {
          unsigned int v19 = 8;
        }
        unsigned int v25 = 1;
        uint64_t v20 = v106;
        uint64_t v39 = a3;
LABEL_200:
        if (!HIBYTE(v18))
        {
          if (v13 == v38)
          {
            int v40 = 0;
            int v379 = 54;
            goto LABEL_634;
          }

          int v152 = *(unsigned __int8 *)(v39 + v13);
          v18 <<= 8;
          ++v13;
          unsigned int v12 = v152 | (v12 << 8);
        }

        int v153 = *v401;
        unsigned int v154 = (v18 >> 11) * v153;
        if (v12 >= v154)
        {
          v18 -= v154;
          *v401 -= *v401 >> 5;
          v12 -= v154;
LABEL_236:
          if (!HIBYTE(v18))
          {
            if (v13 == v38)
            {
              int v40 = 0;
              int v379 = 58;
              goto LABEL_634;
            }

            int v173 = *(unsigned __int8 *)(v39 + v13);
            v18 <<= 8;
            ++v13;
            unsigned int v12 = v173 | (v12 << 8);
          }

          int v174 = v401[1];
          unsigned int v175 = (v18 >> 11) * v174;
          if (v12 >= v175)
          {
            v18 -= v175;
            v401[1] -= v401[1] >> 5;
            v12 -= v175;
LABEL_253:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 62;
                goto LABEL_634;
              }

              int v184 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v184 | (v12 << 8);
            }

            unsigned int v185 = (_WORD *)(v5 + 2LL * v25 + 27756);
            int v186 = (unsigned __int16)*v185;
            unsigned int v187 = (v18 >> 11) * v186;
            v25 *= 2;
            if (v12 >= v187)
            {
              v18 -= v187;
              *v185 -= *v185 >> 5;
              v25 |= 1u;
              v12 -= v187;
            }

            else
            {
              *unsigned int v185 = v186 + ((2048 - v186) >> 5);
              unsigned int v18 = (v18 >> 11) * v186;
            }

LABEL_271:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 63;
                goto LABEL_634;
              }

              int v196 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v196 | (v12 << 8);
            }

            unint64_t v197 = (_WORD *)(v5 + 2LL * v25 + 27756);
            int v198 = (unsigned __int16)*v197;
            unsigned int v199 = (v18 >> 11) * v198;
            v25 *= 2;
            if (v12 >= v199)
            {
              v18 -= v199;
              *v197 -= *v197 >> 5;
              v25 |= 1u;
              v12 -= v199;
            }

            else
            {
              *unint64_t v197 = v198 + ((2048 - v198) >> 5);
              unsigned int v18 = (v18 >> 11) * v198;
            }

LABEL_315:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 64;
                goto LABEL_634;
              }

              int v222 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v222 | (v12 << 8);
            }

            uint64_t v223 = (_WORD *)(v5 + 2LL * v25 + 27756);
            int v224 = (unsigned __int16)*v223;
            unsigned int v225 = (v18 >> 11) * v224;
            v25 *= 2;
            if (v12 >= v225)
            {
              v18 -= v225;
              *v223 -= *v223 >> 5;
              v25 |= 1u;
              v12 -= v225;
            }

            else
            {
              *uint64_t v223 = v224 + ((2048 - v224) >> 5);
              unsigned int v18 = (v18 >> 11) * v224;
            }

LABEL_321:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 65;
                goto LABEL_634;
              }

              int v226 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v226 | (v12 << 8);
            }

            uint64_t v227 = (_WORD *)(v5 + 2LL * v25 + 27756);
            int v228 = (unsigned __int16)*v227;
            unsigned int v229 = (v18 >> 11) * v228;
            v25 *= 2;
            if (v12 >= v229)
            {
              v18 -= v229;
              *v227 -= *v227 >> 5;
              v25 |= 1u;
              v12 -= v229;
            }

            else
            {
              *uint64_t v227 = v228 + ((2048 - v228) >> 5);
              unsigned int v18 = (v18 >> 11) * v228;
            }

LABEL_333:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 66;
                goto LABEL_634;
              }

              int v234 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v234 | (v12 << 8);
            }

            unsigned int v235 = (_WORD *)(v5 + 2LL * v25 + 27756);
            int v236 = (unsigned __int16)*v235;
            unsigned int v237 = (v18 >> 11) * v236;
            v25 *= 2;
            if (v12 >= v237)
            {
              v18 -= v237;
              *v235 -= *v235 >> 5;
              v25 |= 1u;
              v12 -= v237;
            }

            else
            {
              *unsigned int v235 = v236 + ((2048 - v236) >> 5);
              unsigned int v18 = (v18 >> 11) * v236;
            }

LABEL_339:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 67;
                goto LABEL_634;
              }

              int v238 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v238 | (v12 << 8);
            }

            uint64_t v239 = (_WORD *)(v5 + 2LL * v25 + 27756);
            int v240 = (unsigned __int16)*v239;
            unsigned int v241 = (v18 >> 11) * v240;
            v25 *= 2;
            if (v12 >= v241)
            {
              v18 -= v241;
              *v239 -= *v239 >> 5;
              v25 |= 1u;
              v12 -= v241;
            }

            else
            {
              *uint64_t v239 = v240 + ((2048 - v240) >> 5);
              unsigned int v18 = (v18 >> 11) * v240;
            }

LABEL_357:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 68;
                goto LABEL_634;
              }

              int v250 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v250 | (v12 << 8);
            }

            int v251 = (_WORD *)(v5 + 2LL * v25 + 27756);
            int v252 = (unsigned __int16)*v251;
            unsigned int v253 = (v18 >> 11) * v252;
            v25 *= 2;
            if (v12 >= v253)
            {
              v18 -= v253;
              *v251 -= *v251 >> 5;
              v25 |= 1u;
              v12 -= v253;
            }

            else
            {
              *int v251 = v252 + ((2048 - v252) >> 5);
              unsigned int v18 = (v18 >> 11) * v252;
            }

LABEL_369:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 69;
                goto LABEL_634;
              }

              int v258 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v258 | (v12 << 8);
            }

            int v259 = (_WORD *)(v5 + 2LL * v25 + 27756);
            unsigned int v260 = (unsigned __int16)*v259;
            unsigned int v261 = (v18 >> 11) * v260;
            unsigned int v262 = v260 - (v260 >> 5);
            unsigned int v263 = v260 + ((2048 - v260) >> 5);
            if (v12 < v261)
            {
              v25 *= 2;
            }

            else
            {
              LOWORD(v263) = v262;
              unsigned int v25 = (2 * v25) | 1;
            }

            if (v12 < v261) {
              unsigned int v18 = v261;
            }
            else {
              v18 -= v261;
            }
            if (v12 >= v261) {
              v12 -= v261;
            }
            *int v259 = v263;
            unsigned int v27 = v25 - 238;
          }

          else
          {
            v401[1] = v174 + ((2048 - v174) >> 5);
            unsigned int v18 = (v18 >> 11) * v174;
LABEL_241:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 59;
                goto LABEL_634;
              }

              int v176 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v176 | (v12 << 8);
            }

            unint64_t v177 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 27500);
            int v178 = (unsigned __int16)*v177;
            unsigned int v179 = (v18 >> 11) * v178;
            v25 *= 2;
            if (v12 >= v179)
            {
              v18 -= v179;
              *v177 -= *v177 >> 5;
              v25 |= 1u;
              v12 -= v179;
            }

            else
            {
              *unint64_t v177 = v178 + ((2048 - v178) >> 5);
              unsigned int v18 = (v18 >> 11) * v178;
            }

LABEL_259:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 60;
                goto LABEL_634;
              }

              int v188 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v188 | (v12 << 8);
            }

            unsigned int v189 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 27500);
            int v190 = (unsigned __int16)*v189;
            unsigned int v191 = (v18 >> 11) * v190;
            v25 *= 2;
            if (v12 >= v191)
            {
              v18 -= v191;
              *v189 -= *v189 >> 5;
              v25 |= 1u;
              v12 -= v191;
            }

            else
            {
              *unsigned int v189 = v190 + ((2048 - v190) >> 5);
              unsigned int v18 = (v18 >> 11) * v190;
            }

LABEL_277:
            if (!HIBYTE(v18))
            {
              if (v13 == v38)
              {
                int v40 = 0;
                int v379 = 61;
                goto LABEL_634;
              }

              int v200 = *(unsigned __int8 *)(v39 + v13);
              v18 <<= 8;
              ++v13;
              unsigned int v12 = v200 | (v12 << 8);
            }

            uint64_t v201 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 27500);
            unsigned int v202 = (unsigned __int16)*v201;
            unsigned int v203 = (v18 >> 11) * v202;
            unsigned int v204 = v202 - (v202 >> 5);
            unsigned int v205 = v202 + ((2048 - v202) >> 5);
            if (v12 < v203)
            {
              v25 *= 2;
            }

            else
            {
              LOWORD(v205) = v204;
              unsigned int v25 = (2 * v25) | 1;
            }

            if (v12 < v203) {
              unsigned int v18 = v203;
            }
            else {
              v18 -= v203;
            }
            if (v12 >= v203) {
              v12 -= v203;
            }
            *uint64_t v201 = v205;
            unsigned int v27 = v25 + 2;
          }
        }

        else
        {
          unsigned __int16 *v401 = v153 + ((2048 - v153) >> 5);
          unsigned int v18 = (v18 >> 11) * v153;
LABEL_205:
          if (!HIBYTE(v18))
          {
            if (v13 == v38)
            {
              int v40 = 0;
              int v379 = 55;
              goto LABEL_634;
            }

            int v155 = *(unsigned __int8 *)(v39 + v13);
            v18 <<= 8;
            ++v13;
            unsigned int v12 = v155 | (v12 << 8);
          }

          int v156 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 27244);
          int v157 = (unsigned __int16)*v156;
          unsigned int v158 = (v18 >> 11) * v157;
          v25 *= 2;
          if (v12 >= v158)
          {
            v18 -= v158;
            *v156 -= *v156 >> 5;
            v25 |= 1u;
            v12 -= v158;
          }

          else
          {
            *int v156 = v157 + ((2048 - v157) >> 5);
            unsigned int v18 = (v18 >> 11) * v157;
          }

LABEL_211:
          if (!HIBYTE(v18))
          {
            if (v13 == v38)
            {
              int v40 = 0;
              int v379 = 56;
              goto LABEL_634;
            }

            int v159 = *(unsigned __int8 *)(v39 + v13);
            v18 <<= 8;
            ++v13;
            unsigned int v12 = v159 | (v12 << 8);
          }

          unint64_t v160 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 27244);
          int v161 = (unsigned __int16)*v160;
          unsigned int v162 = (v18 >> 11) * v161;
          v25 *= 2;
          if (v12 >= v162)
          {
            v18 -= v162;
            *v160 -= *v160 >> 5;
            v25 |= 1u;
            v12 -= v162;
          }

          else
          {
            *unint64_t v160 = v161 + ((2048 - v161) >> 5);
            unsigned int v18 = (v18 >> 11) * v161;
          }

LABEL_217:
          if (!HIBYTE(v18))
          {
            if (v13 == v38)
            {
              int v40 = 0;
              int v379 = 57;
              goto LABEL_634;
            }

            int v163 = *(unsigned __int8 *)(v39 + v13);
            v18 <<= 8;
            ++v13;
            unsigned int v12 = v163 | (v12 << 8);
          }

          unsigned int v164 = (_WORD *)(v5 + 16LL * v37 + 2LL * v25 + 27244);
          unsigned int v165 = (unsigned __int16)*v164;
          unsigned int v166 = (v18 >> 11) * v165;
          unsigned int v167 = v165 - (v165 >> 5);
          unsigned int v168 = v165 + ((2048 - v165) >> 5);
          if (v12 < v166)
          {
            v25 *= 2;
          }

          else
          {
            LOWORD(v168) = v167;
            unsigned int v25 = (2 * v25) | 1;
          }

          if (v12 < v166) {
            unsigned int v18 = v166;
          }
          else {
            v18 -= v166;
          }
          if (v12 >= v166) {
            v12 -= v166;
          }
          *unsigned int v164 = v168;
          unsigned int v27 = v25 - 6;
        }

        uint64_t v36 = v408;
        uint64_t v35 = v409;
        goto LABEL_485;
      }

      *int v93 = v94 + ((2048 - v94) >> 5);
      unsigned int v18 = (v18 >> 11) * v94;
LABEL_105:
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 51;
          goto LABEL_634;
        }

        int v96 = *(unsigned __int8 *)(v39 + v13);
        v18 <<= 8;
        ++v13;
        unsigned int v12 = v96 | (v12 << 8);
      }

      uint64_t v97 = (_WORD *)(v5 + 32LL * v19 + 2LL * v37 + 25056);
      int v98 = (unsigned __int16)*v97;
      unsigned int v99 = (v18 >> 11) * v98;
      unsigned int v100 = v12 - v99;
      if (v12 >= v99)
      {
        v18 -= v99;
        *v97 -= *v97 >> 5;
        uint64_t v106 = v20;
        uint64_t v20 = v22;
        uint64_t v22 = v21;
        goto LABEL_195;
      }

      *uint64_t v97 = v98 + ((2048 - v98) >> 5);
      if (v19 >= 7) {
        unsigned int v19 = 11;
      }
      else {
        unsigned int v19 = 9;
      }
      unsigned int v18 = (v18 >> 11) * v98;
LABEL_113:
      if (v16 == v32)
      {
        int v40 = 0;
        int v383 = 50;
        goto LABEL_651;
      }

      else {
        unint64_t v101 = 0LL;
      }
      v35[v16] = v101[v16 + ~(unint64_t)v20 + (void)v35];
      if (v16 + 1 > v14) {
        unint64_t v14 = v16 + 1;
      }
      ++v16;
    }

    *unint64_t v44 = v45 + ((2048 - v45) >> 5);
    __int128 v47 = v16 ? 0LL : v36;
    uint64_t v23 = v5 + 1536 * (((v16 & v395) << v394) + (v35[v16 - 1 + (void)v47] >> (8 - v394)));
    unsigned int v25 = 1;
    if (v19 > 6)
    {
      else {
        v331 = 0LL;
      }
      unsigned int v27 = 2 * v331[v16 + ~(unint64_t)v20 + (void)v35];
      LODWORD(v26) = 256;
LABEL_502:
      uint64_t v332 = (_DWORD)v26 + v25 + (v26 & v27);
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 10;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v333 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v333 | (v12 << 8);
      }

      unsigned int v334 = *(unsigned __int16 *)(v23 + 2LL * v332);
      unsigned int v335 = (v18 >> 11) * v334;
      unsigned int v336 = v334 - (v334 >> 5);
      unsigned int v337 = v334 + ((2048 - v334) >> 5);
      if (v12 < v335)
      {
        v25 *= 2;
      }

      else
      {
        LOWORD(v337) = v336;
        unsigned int v25 = (2 * v25) | 1;
      }

      if (v12 < v335) {
        LODWORD(v26) = v26 & v27 ^ v26;
      }
      else {
        LODWORD(v26) = v26 & v27;
      }
      if (v12 < v335) {
        unsigned int v18 = v335;
      }
      else {
        v18 -= v335;
      }
      if (v12 >= v335) {
        v12 -= v335;
      }
      *(_WORD *)(v23 + 2 * v332) = v337;
      v27 *= 2;
LABEL_517:
      uint64_t v338 = (_DWORD)v26 + v25 + (v26 & v27);
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 11;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v339 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v339 | (v12 << 8);
      }

      unsigned int v340 = *(unsigned __int16 *)(v23 + 2LL * v338);
      unsigned int v341 = (v18 >> 11) * v340;
      unsigned int v342 = v340 - (v340 >> 5);
      unsigned int v343 = v340 + ((2048 - v340) >> 5);
      if (v12 < v341)
      {
        v25 *= 2;
      }

      else
      {
        LOWORD(v343) = v342;
        unsigned int v25 = (2 * v25) | 1;
      }

      if (v12 < v341) {
        LODWORD(v26) = v26 & v27 ^ v26;
      }
      else {
        LODWORD(v26) = v26 & v27;
      }
      if (v12 < v341) {
        unsigned int v18 = v341;
      }
      else {
        v18 -= v341;
      }
      if (v12 >= v341) {
        v12 -= v341;
      }
      *(_WORD *)(v23 + 2 * v338) = v343;
      v27 *= 2;
LABEL_532:
      uint64_t v344 = (_DWORD)v26 + v25 + (v26 & v27);
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 12;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v345 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v345 | (v12 << 8);
      }

      unsigned int v346 = *(unsigned __int16 *)(v23 + 2LL * v344);
      unsigned int v347 = (v18 >> 11) * v346;
      unsigned int v348 = v346 - (v346 >> 5);
      unsigned int v349 = v346 + ((2048 - v346) >> 5);
      if (v12 < v347)
      {
        v25 *= 2;
      }

      else
      {
        LOWORD(v349) = v348;
        unsigned int v25 = (2 * v25) | 1;
      }

      if (v12 < v347) {
        LODWORD(v26) = v26 & v27 ^ v26;
      }
      else {
        LODWORD(v26) = v26 & v27;
      }
      if (v12 < v347) {
        unsigned int v18 = v347;
      }
      else {
        v18 -= v347;
      }
      if (v12 >= v347) {
        v12 -= v347;
      }
      *(_WORD *)(v23 + 2 * v344) = v349;
      v27 *= 2;
LABEL_547:
      uint64_t v350 = (_DWORD)v26 + v25 + (v26 & v27);
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 13;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v351 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v351 | (v12 << 8);
      }

      unsigned int v352 = *(unsigned __int16 *)(v23 + 2LL * v350);
      unsigned int v353 = (v18 >> 11) * v352;
      unsigned int v354 = v352 - (v352 >> 5);
      unsigned int v355 = v352 + ((2048 - v352) >> 5);
      if (v12 < v353)
      {
        v25 *= 2;
      }

      else
      {
        LOWORD(v355) = v354;
        unsigned int v25 = (2 * v25) | 1;
      }

      if (v12 < v353) {
        LODWORD(v26) = v26 & v27 ^ v26;
      }
      else {
        LODWORD(v26) = v26 & v27;
      }
      if (v12 < v353) {
        unsigned int v18 = v353;
      }
      else {
        v18 -= v353;
      }
      if (v12 >= v353) {
        v12 -= v353;
      }
      *(_WORD *)(v23 + 2 * v350) = v355;
      v27 *= 2;
LABEL_562:
      uint64_t v356 = (_DWORD)v26 + v25 + (v26 & v27);
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 14;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v357 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v357 | (v12 << 8);
      }

      unsigned int v358 = *(unsigned __int16 *)(v23 + 2LL * v356);
      unsigned int v359 = (v18 >> 11) * v358;
      unsigned int v360 = v358 - (v358 >> 5);
      unsigned int v361 = v358 + ((2048 - v358) >> 5);
      if (v12 < v359)
      {
        v25 *= 2;
      }

      else
      {
        LOWORD(v361) = v360;
        unsigned int v25 = (2 * v25) | 1;
      }

      if (v12 < v359) {
        LODWORD(v26) = v26 & v27 ^ v26;
      }
      else {
        LODWORD(v26) = v26 & v27;
      }
      if (v12 < v359) {
        unsigned int v18 = v359;
      }
      else {
        v18 -= v359;
      }
      if (v12 >= v359) {
        v12 -= v359;
      }
      *(_WORD *)(v23 + 2 * v356) = v361;
      v27 *= 2;
LABEL_577:
      uint64_t v362 = (_DWORD)v26 + v25 + (v26 & v27);
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 15;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v363 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v363 | (v12 << 8);
      }

      unsigned int v364 = *(unsigned __int16 *)(v23 + 2LL * v362);
      unsigned int v365 = (v18 >> 11) * v364;
      unsigned int v366 = v364 - (v364 >> 5);
      unsigned int v367 = v364 + ((2048 - v364) >> 5);
      if (v12 < v365)
      {
        v25 *= 2;
      }

      else
      {
        LOWORD(v367) = v366;
        unsigned int v25 = (2 * v25) | 1;
      }

      if (v12 < v365) {
        LODWORD(v26) = v26 & v27 ^ v26;
      }
      else {
        LODWORD(v26) = v26 & v27;
      }
      if (v12 < v365) {
        unsigned int v18 = v365;
      }
      else {
        v18 -= v365;
      }
      if (v12 >= v365) {
        v12 -= v365;
      }
      *(_WORD *)(v23 + 2 * v362) = v367;
      v27 *= 2;
LABEL_592:
      uint64_t v368 = (_DWORD)v26 + v25 + (v26 & v27);
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 16;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v369 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v369 | (v12 << 8);
      }

      unsigned int v370 = *(unsigned __int16 *)(v23 + 2LL * v368);
      unsigned int v371 = (v18 >> 11) * v370;
      unsigned int v372 = v370 - (v370 >> 5);
      unsigned int v373 = v370 + ((2048 - v370) >> 5);
      if (v12 < v371)
      {
        v25 *= 2;
      }

      else
      {
        LOWORD(v373) = v372;
        unsigned int v25 = (2 * v25) | 1;
      }

      if (v12 < v371) {
        LODWORD(v26) = v26 & v27 ^ v26;
      }
      else {
        LODWORD(v26) = v26 & v27;
      }
      if (v12 < v371) {
        unsigned int v18 = v371;
      }
      else {
        v18 -= v371;
      }
      if (v12 >= v371) {
        v12 -= v371;
      }
      *(_WORD *)(v23 + 2 * v368) = v373;
      v27 *= 2;
      unint64_t v34 = v404;
      uint64_t v36 = v408;
      uint64_t v35 = v409;
LABEL_607:
      uint64_t v374 = (_DWORD)v26 + v25 + (v26 & v27);
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 17;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v375 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v375 | (v12 << 8);
      }

      unsigned int v376 = *(unsigned __int16 *)(v23 + 2LL * v374);
      unsigned int v377 = (v18 >> 11) * v376;
      v25 *= 2;
      if (v12 >= v377)
      {
        v18 -= v377;
        *(_WORD *)(v23 + 2 * v374) = v376 - (v376 >> 5);
        v25 |= 1u;
        uint64_t v26 = v26 & v27;
        v12 -= v377;
      }

      else
      {
        *(_WORD *)(v23 + 2 * v374) = v376 + ((2048 - v376) >> 5);
        uint64_t v26 = v26 & v27 ^ v26;
        unsigned int v18 = (v18 >> 11) * v376;
      }
    }

    else
    {
LABEL_31:
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 2;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v48 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v48 | (v12 << 8);
      }

      uint64_t v49 = v25;
      unsigned int v50 = *(unsigned __int16 *)(v23 + 2LL * v25);
      unsigned int v51 = (v18 >> 11) * v50;
      v25 *= 2;
      if (v12 >= v51)
      {
        v18 -= v51;
        *(_WORD *)(v23 + 2 * v49) = v50 - (v50 >> 5);
        v25 |= 1u;
        v12 -= v51;
      }

      else
      {
        *(_WORD *)(v23 + 2 * v49) = v50 + ((2048 - v50) >> 5);
        unsigned int v18 = (v18 >> 11) * v50;
      }

LABEL_37:
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 3;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v52 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v52 | (v12 << 8);
      }

      uint64_t v53 = v25;
      unsigned int v54 = *(unsigned __int16 *)(v23 + 2LL * v25);
      unsigned int v55 = (v18 >> 11) * v54;
      v25 *= 2;
      if (v12 >= v55)
      {
        v18 -= v55;
        *(_WORD *)(v23 + 2 * v53) = v54 - (v54 >> 5);
        v25 |= 1u;
        v12 -= v55;
      }

      else
      {
        *(_WORD *)(v23 + 2 * v53) = v54 + ((2048 - v54) >> 5);
        unsigned int v18 = (v18 >> 11) * v54;
      }

        unsigned int v25 = lzma_block_unpadded_size(v4);
        uint64_t v26 = *(void *)(a1 + 24);
        *(void *)(v26 + 48) = v25;
        *(void *)(v26 + 56) = *(void *)(a1 + 168);
        uint64_t v9 = 2;
      }

LABEL_43:
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 4;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v56 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v56 | (v12 << 8);
      }

      uint64_t v57 = v25;
      unsigned int v58 = *(unsigned __int16 *)(v23 + 2LL * v25);
      unsigned int v59 = (v18 >> 11) * v58;
      v25 *= 2;
      if (v12 >= v59)
      {
        v18 -= v59;
        *(_WORD *)(v23 + 2 * v57) = v58 - (v58 >> 5);
        v25 |= 1u;
        v12 -= v59;
      }

      else
      {
        *(_WORD *)(v23 + 2 * v57) = v58 + ((2048 - v58) >> 5);
        unsigned int v18 = (v18 >> 11) * v58;
      }

LABEL_55:
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 6;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v64 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v64 | (v12 << 8);
      }

      uint64_t v65 = v25;
      unsigned int v66 = *(unsigned __int16 *)(v23 + 2LL * v25);
      unsigned int v67 = (v18 >> 11) * v66;
      v25 *= 2;
      if (v12 >= v67)
      {
        v18 -= v67;
        *(_WORD *)(v23 + 2 * v65) = v66 - (v66 >> 5);
        v25 |= 1u;
        v12 -= v67;
      }

      else
      {
        *(_WORD *)(v23 + 2 * v65) = v66 + ((2048 - v66) >> 5);
        unsigned int v18 = (v18 >> 11) * v66;
      }

LABEL_61:
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 7;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v68 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v68 | (v12 << 8);
      }

      uint64_t v69 = v25;
      unsigned int v70 = *(unsigned __int16 *)(v23 + 2LL * v25);
      unsigned int v71 = (v18 >> 11) * v70;
      v25 *= 2;
      if (v12 >= v71)
      {
        v18 -= v71;
        *(_WORD *)(v23 + 2 * v69) = v70 - (v70 >> 5);
        v25 |= 1u;
        v12 -= v71;
      }

      else
      {
        *(_WORD *)(v23 + 2 * v69) = v70 + ((2048 - v70) >> 5);
        unsigned int v18 = (v18 >> 11) * v70;
      }

LABEL_67:
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 8;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v72 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v72 | (v12 << 8);
      }

      uint64_t v73 = v25;
      unsigned int v74 = *(unsigned __int16 *)(v23 + 2LL * v25);
      unsigned int v75 = (v18 >> 11) * v74;
      v25 *= 2;
      if (v12 >= v75)
      {
        v18 -= v75;
        *(_WORD *)(v23 + 2 * v73) = v74 - (v74 >> 5);
        v25 |= 1u;
        v12 -= v75;
      }

      else
      {
        *(_WORD *)(v23 + 2 * v73) = v74 + ((2048 - v74) >> 5);
        unsigned int v18 = (v18 >> 11) * v74;
      }

LABEL_73:
      if (!HIBYTE(v18))
      {
        if (v13 == v38)
        {
          int v40 = 0;
          int v379 = 9;
          goto LABEL_634;
        }

        v18 <<= 8;
        int v76 = *(unsigned __int8 *)(v39 + v13++);
        unsigned int v12 = v76 | (v12 << 8);
      }

      uint64_t v77 = v25;
      unsigned int v78 = *(unsigned __int16 *)(v23 + 2LL * v25);
      unsigned int v79 = (v18 >> 11) * v78;
      v25 *= 2;
      if (v12 >= v79)
      {
        v18 -= v79;
        *(_WORD *)(v23 + 2 * v77) = v78 - (v78 >> 5);
        v25 |= 1u;
        v12 -= v79;
      }

      else
      {
        *(_WORD *)(v23 + 2 * v77) = v78 + ((2048 - v78) >> 5);
        unsigned int v18 = (v18 >> 11) * v78;
      }
    }

    unsigned int v19 = lzma_decode_next_state[v19];
LABEL_614:
    if (v16 == v32) {
      break;
    }
    v35[v16] = v25;
    if (v16 + 1 > v14) {
      unint64_t v14 = v16 + 1;
    }
    ++v16;
  }

  int v40 = 0;
  int v383 = 18;
LABEL_651:
  uint64_t v17 = (unsigned int *)v385;
  *(_DWORD *)(v385 + 56) = v383;
  unint64_t v16 = v32;
LABEL_636:
  a2[1] = (const void *)v16;
  a2[2] = (const void *)v14;
  unsigned int *v17 = v18;
  v17[1] = v12;
  void *v387 = v13;
  v17[2] = 0;
  v17[3] = v19;
  v17[4] = v20;
  v17[5] = v22;
  v17[6] = v21;
  v17[7] = v402;
  *(void *)(v5 + 28328) = v23;
  v17[17] = v25;
  v17[18] = v24;
  v17[19] = v26;
  v17[20] = v27;
  uint64_t v380 = *(void *)(v5 + 28312);
  if (v380 == -1 || (uint64_t v381 = v380 + v15 - v16, (*(void *)(v5 + 28312) = v381) != 0LL) || v40)
  {
    if (v40 == 1)
    {
      *(void *)&double result = 0xFFFFFFFFLL;
      *(void *)uint64_t v17 = 0xFFFFFFFFLL;
      v17[2] = 5;
      v17[14] = 1;
    }
  }

  return result;
}

void lzma_decoder_reset(uint64_t a1, _DWORD *a2)
{
  uint64_t v17 = a1 + 28268;
  unint64_t v15 = (_DWORD *)(a1 + 27240);
  uint64_t v3 = (_DWORD *)(a1 + 26212);
  int v4 = a2[6];
  int v16 = a2[7];
  int v5 = a2[5];
  unsigned int v6 = 1;
  do
    memset_pattern16((void *)(a1 + 1536LL * (v6 - 1)), &unk_18116F5E0, 0x600uLL);
  while (!(v6++ >> (v4 + v5)));
  uint64_t v8 = 0LL;
  *(_DWORD *)(v17 + 36) = v5;
  *(_DWORD *)(v17 + 40) = ~(-1 << v4);
  *(_OWORD *)(a1 + 28280) = 0u;
  *(_DWORD *)(a1 + 28296) = 0;
  *(_DWORD *)(v17 + 32) = ~(-1 << v16);
  uint64_t v9 = (_WORD *)(a1 + 24576);
  *(void *)uint64_t v17 = 0xFFFFFFFFLL;
  *(_DWORD *)(v17 + 8) = 5;
  do
  {
    uint64_t v10 = -(-1 << v16);
    uint64_t v11 = v9;
    do
    {
      *uint64_t v11 = 1024;
      v11[240] = 1024;
      ++v11;
      --v10;
    }

    while (v10);
    unsigned int v12 = (_WORD *)(a1 + 2 * v8);
    v12[12480] = 1024;
    v12[12492] = 1024;
    ++v8;
    v9 += 16;
    v12[12504] = 1024;
    v12[12516] = 1024;
  }

  while (v8 != 12);
  for (uint64_t i = 0LL; i != 512; i += 128LL)
    memset_pattern16((void *)(a1 + 25440 + i), &unk_18116F5E0, 0x80uLL);
  memset_pattern16((void *)(a1 + 25952), &unk_18116F5E0, 0xE4uLL);
  memset_pattern16((void *)(a1 + 26180), &unk_18116F5E0, 0x20uLL);
  unsigned int v14 = 0;
  _DWORD *v3 = 67109888;
  *unint64_t v15 = 67109888;
  do
  {
    memset_pattern16((void *)(a1 + 26216 + 16LL * v14), &unk_18116F5E0, 0x10uLL);
    memset_pattern16((void *)(a1 + 26472 + 16LL * v14), &unk_18116F5E0, 0x10uLL);
    memset_pattern16((void *)(a1 + 27244 + 16LL * v14), &unk_18116F5E0, 0x10uLL);
    memset_pattern16((void *)(a1 + 27500 + 16LL * v14++), &unk_18116F5E0, 0x10uLL);
  }

  while (!(v14 >> v16));
  memset_pattern16((void *)(a1 + 26728), &unk_18116F5E0, 0x200uLL);
  memset_pattern16((void *)(a1 + 27756), &unk_18116F5E0, 0x200uLL);
  *(_DWORD *)(v17 + 56) = 1;
  *(void *)(a1 + 28328) = 0LL;
  *(void *)(a1 + 28344) = 0LL;
  *(void *)(a1 + 28336) = 0LL;
}

uint64_t lzma_decoder_uncompressed(uint64_t result, uint64_t a2, char a3)
{
  *(void *)(result + 28312) = a2;
  *(_BYTE *)(result + 28320) = a3;
  return result;
}

uint64_t lzma_lzma_decoder_init(char **a1, uint64_t a2, void *a3)
{
  return lzma_lz_decoder_init( a1,  a2,  a3,  (uint64_t (*)(char *, uint64_t, void, void, unint64_t *))lzma_decoder_init);
}

uint64_t lzma_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unsigned int v5 = *(_DWORD *)(a4 + 20);
  if (v5 > 4) {
    return 11LL;
  }
  unsigned int v7 = *(_DWORD *)(a4 + 24);
  unsigned int v8 = v7 + v5;
  BOOL v9 = v7 > 4 || v8 > 4;
  if (v9 || *(_DWORD *)(a4 + 28) > 4u) {
    return 11LL;
  }
  if (a3 == 0x4000000000000002LL)
  {
    unsigned int v11 = *(_DWORD *)(a4 + 48);
    if (v11 > 1) {
      return 8LL;
    }
    uint64_t v12 = *(void *)(a4 + 52);
    if (v11) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v12 == -1;
    }
    char v14 = v13;
  }

  else
  {
    uint64_t v12 = -1LL;
    char v14 = 1;
  }

  uint64_t result = lzma_lzma_decoder_create(a1, a2, (unsigned int *)a4, a5);
  if (!(_DWORD)result)
  {
    lzma_decoder_reset(*a1, (_DWORD *)a4);
    uint64_t result = 0LL;
    uint64_t v16 = *a1;
    *(void *)(v16 + 28312) = v12;
    *(_BYTE *)(v16 + 28320) = v14;
  }

  return result;
}

BOOL lzma_lzma_lclppb_decode(_DWORD *a1, unsigned int a2)
{
  if (a2 > 0xE0) {
    return 1LL;
  }
  unsigned int v3 = (((a2 - ((unsigned __int16)(109 * a2) >> 8)) >> 1) + ((109 * a2) >> 8)) >> 5;
  a1[7] = v3;
  int v4 = (a2 - 45 * v3);
  unsigned int v5 = 57 * v4;
  int v6 = v4 - 9 * ((57 * v4) >> 9);
  a1[5] = v6;
  a1[6] = v5 >> 9;
  return v6 + (v5 >> 9) > 4;
}

uint64_t lzma_lzma_decoder_memusage_nocheck(unsigned int *a1)
{
  return lzma_lz_decoder_memusage(*a1) + 28352;
}

uint64_t lzma_lzma_decoder_memusage(unsigned int *a1)
{
  unsigned int v1 = a1[5];
  if (v1 > 4) {
    return -1LL;
  }
  unsigned int v2 = a1[6];
  unsigned int v3 = v2 + v1;
  BOOL v4 = v2 > 4 || v3 > 4;
  if (v4 || a1[7] > 4) {
    return -1LL;
  }
  else {
    return lzma_lz_decoder_memusage(*a1) + 28352;
  }
}

uint64_t lzma_lzma_props_decode(void *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (a4 != 5) {
    return 8LL;
  }
  unsigned int v7 = lzma_alloc(0x70uLL, a2);
  if (!v7) {
    return 5LL;
  }
  unsigned int v8 = *a3;
  if (v8 <= 0xE0
    && (unsigned int v9 = (((v8 - ((unsigned __int16)(109 * v8) >> 8)) >> 1) + ((109 * v8) >> 8)) >> 5,
        v7[7] = v9,
        int v10 = (v8 - 45 * v9),
        unsigned int v11 = 57 * v10,
        int v12 = v10 - 9 * ((57 * v10) >> 9),
        v7[5] = v12,
        v7[6] = v11 >> 9,
        v12 + (v11 >> 9) <= 4))
  {
    uint64_t v13 = 0LL;
    *unsigned int v7 = *(_DWORD *)(a3 + 1);
    *((void *)v7 + 1) = 0LL;
    v7[4] = 0;
    *a1 = v7;
  }

  else
  {
    lzma_free(v7, a2);
    return 8LL;
  }

  return v13;
}

uint64_t lzma_lzma2_encoder_init(void *a1, void *a2, void *a3)
{
  return lzma_lz_encoder_init( a1,  a2,  a3,  (uint64_t (*)(void *, void *, void, void, uint64_t *))lzma2_encoder_init);
}

uint64_t lzma2_encoder_init(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, void *a5)
{
  if (!a4) {
    return 11LL;
  }
  unsigned int v9 = *(void **)a1;
  if (!v9)
  {
    unsigned int v9 = lzma_alloc(0x100A8uLL, a2);
    if (!v9) {
      return 5LL;
    }
    *(void *)a1 = v9;
    *(void *)(a1 + 8) = lzma2_encode;
    *(void *)(a1 + 16) = lzma2_encoder_end;
    *(void *)(a1 + 24) = lzma2_encoder_options_update;
    *((void *)v9 + 1) = 0LL;
  }

  __int128 v10 = *a4;
  __int128 v11 = a4[2];
  *((_OWORD *)v9 + 2) = a4[1];
  *((_OWORD *)v9 + 3) = v11;
  *((_OWORD *)v9 + 1) = v10;
  __int128 v12 = a4[3];
  __int128 v13 = a4[4];
  __int128 v14 = a4[6];
  *((_OWORD *)v9 + 6) = a4[5];
  *((_OWORD *)v9 + 7) = v14;
  *((_OWORD *)v9 + 4) = v12;
  *((_OWORD *)v9 + 5) = v13;
  *(_DWORD *)unsigned int v9 = 0;
  BOOL v15 = 1;
  *((_WORD *)v9 + 64) = 1;
  if (*((void *)v9 + 3)) {
    BOOL v15 = *((_DWORD *)v9 + 8) == 0;
  }
  *((_BYTE *)v9 + 130) = v15;
  uint64_t result = lzma_lzma_encoder_create((void **)v9 + 1, a2, 33LL, (unsigned int *)v9 + 4, (uint64_t)a5);
  if (!(_DWORD)result)
  {
    uint64_t v17 = a5[1];
    uint64_t result = 0LL;
  }

  return result;
}

uint64_t lzma_lzma2_encoder_memusage(unsigned int *a1)
{
  uint64_t v1 = lzma_lzma_encoder_memusage(a1);
  if (v1 == -1) {
    return -1LL;
  }
  else {
    return v1 + 65704;
  }
}

uint64_t lzma_lzma2_props_encode(_DWORD *a1, char *a2)
{
  if (!a1) {
    return 11LL;
  }
  if (*a1 <= 0x1000u) {
    unsigned int v2 = 4095;
  }
  else {
    unsigned int v2 = *a1 - 1;
  }
  unsigned int v3 = v2 | (v2 >> 2) | ((v2 | (v2 >> 2)) >> 3);
  unsigned int v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
  uint64_t v5 = v4 | HIWORD(v4);
  if ((_DWORD)v5 == -1)
  {
    char v9 = 40;
  }

  else
  {
    uint64_t v6 = v5 + 1;
    if (v5 > 0x1FFE)
    {
      else {
        char v7 = lzma_fastpos[(unint64_t)v6 >> 12] + 24;
      }
    }

    else
    {
      char v7 = lzma_fastpos[v6];
    }

    char v9 = v7 - 24;
  }

  uint64_t result = 0LL;
  *a2 = v9;
  return result;
}

uint64_t lzma_lzma2_block_size(unsigned int *a1)
{
  uint64_t v1 = *a1;
  else {
    return 3 * v1;
  }
}

uint64_t lzma2_encode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5)
{
  uint64_t v5 = *a4;
  if (*a4 < a5)
  {
    unint64_t v6 = a5;
    char v9 = (char *)(a1 + 160);
    unint64_t v44 = (uint64_t *)(a1 + 152);
    int v45 = (uint64_t *)(a1 + 136);
    __int128 v10 = (uint64_t *)(a1 + 144);
    int v11 = *(_DWORD *)a1;
    char v41 = (_DWORD *)(a1 + 16);
    uint64_t v42 = a1 + 166;
    int v43 = (char *)(a1 + 160);
    __int128 v12 = (size_t *)(a1 + 136);
    while (2)
    {
      switch(v11)
      {
        case 0:
          if (*(_DWORD *)(a2 + 36) - *(_DWORD *)(a2 + 24) + *(_DWORD *)(a2 + 28))
          {
            if (!*(_BYTE *)(a1 + 129) || (uint64_t result = lzma_lzma_encoder_reset(*(void *)(a1 + 8), v41), !(_DWORD)result))
            {
              LODWORD(v14) = 0;
              uint64_t *v45 = 0LL;
              v45[1] = 0LL;
              *(_DWORD *)a1 = 1;
              goto LABEL_9;
            }
          }

          else
          {
            int v40 = *(_DWORD *)(a2 + 104);
            if (v40 == 3)
            {
              *a4 = v5 + 1;
              *(_BYTE *)(a3 + v5) = 0;
            }

            return v40 != 0;
          }

          return result;
        case 1:
          uint64_t v14 = *v45;
LABEL_9:
          unsigned int v15 = 0x200000 - v14;
          unsigned int v16 = *(_DWORD *)(a2 + 100);
          int v17 = *(_DWORD *)(a2 + 24);
          int v18 = *(_DWORD *)(a2 + 28);
          if (v15 >= v16) {
            unsigned int v19 = v15 + v17 - (v16 + v18);
          }
          else {
            unsigned int v19 = 0;
          }
          int v20 = lzma_lzma_encode(*(void *)(a1 + 8), (unsigned __int8 **)a2, v42, v10, 0x10000LL, v19);
          uint64_t v21 = *(unsigned int *)(a2 + 28);
          unint64_t v22 = *(void *)(a1 + 136) + (v18 + *(_DWORD *)(a2 + 24) - (v17 + v21));
          *(void *)(a1 + 136) = v22;
          if (v20 != 1) {
            return 0LL;
          }
          uint64_t v23 = *v10;
          if (*v10 >= v22)
          {
            __int16 v34 = v22 + v21;
            *(void *)(a1 + 136) = v22 + v21;
            *(_DWORD *)(a2 + 28) = 0;
            if (*(_BYTE *)(a1 + 130)) {
              char v35 = 1;
            }
            else {
              char v35 = 2;
            }
            *(_BYTE *)(a1 + 160) = v35;
            __int16 v36 = v34 - 1;
            *(_BYTE *)(a1 + 161) = HIBYTE(v36);
            *(_BYTE *)(a1 + 162) = v36;
            *(void *)(a1 + 152) = 0LL;
            *(_WORD *)(a1 + 129) = 1;
            int v11 = 3;
            goto LABEL_40;
          }

          int v24 = *(unsigned __int8 *)(a1 + 128);
          if (*(_BYTE *)(a1 + 128))
          {
            uint64_t v25 = 0LL;
            if (*(_BYTE *)(a1 + 130)) {
              char v26 = -32;
            }
            else {
              char v26 = -64;
            }
            *char v9 = v26;
          }

          else
          {
            if (*(_BYTE *)(a1 + 129)) {
              char v37 = -96;
            }
            else {
              char v37 = 0x80;
            }
            *(_BYTE *)(a1 + 161) = v37;
            uint64_t v25 = 1LL;
          }

          *(void *)(a1 + 152) = v25;
          int v38 = v22 - 1;
          uint64_t v39 = (_BYTE *)(a1 + v25);
          v39[160] = *(_BYTE *)(a1 + v25 + 160) + BYTE2(v38);
          v39[161] = BYTE1(v38);
          v39[162] = v38;
          v39[163] = (unsigned __int16)(v23 - 1) >> 8;
          v39[164] = v23 - 1;
          if (v24)
          {
            lzma_lzma_lclppb_encode(v41, &v9[v25 + 5]);
            uint64_t v23 = *v10;
          }

          *(_WORD *)(a1 + 128) = 0;
          *(_BYTE *)(a1 + 130) = 0;
          uint64_t v27 = v23 + 6;
          *(void *)(a1 + 144) = v23 + 6;
          *(_DWORD *)a1 = 2;
          goto LABEL_39;
        case 2:
          uint64_t v27 = *v10;
LABEL_39:
          lzma_bufcpy((uint64_t)v9, v44, v27, a3, a4, v6);
          int v11 = 0;
          uint64_t result = 0LL;
          if (*v44 == *v10) {
            goto LABEL_40;
          }
          return result;
        case 3:
          lzma_bufcpy((uint64_t)v9, v44, 3LL, a3, a4, v6);
          if (*v44 != 3) {
            return 0LL;
          }
          *(_DWORD *)a1 = 4;
          uint64_t v5 = *a4;
          goto LABEL_20;
        case 4:
LABEL_20:
          size_t v28 = v6 - v5;
          unint64_t v29 = v6;
          BOOL v30 = v10;
          size_t v31 = *v12;
          if (v28 >= *v12) {
            size_t v32 = *v12;
          }
          else {
            size_t v32 = v28;
          }
          memcpy((void *)(a3 + v5), (const void *)(*(void *)a2 + *(unsigned int *)(a2 + 24) - v31), v32);
          int v11 = 0;
          uint64_t result = 0LL;
          *a4 = v32 + v5;
          *__int128 v12 = v31 - v32;
          BOOL v33 = v31 > v28;
          __int128 v10 = v30;
          unint64_t v6 = v29;
          char v9 = v43;
          if (v33) {
            return result;
          }
LABEL_40:
          *(_DWORD *)a1 = v11;
LABEL_41:
          uint64_t v5 = *a4;
          if (*a4 >= v6) {
            return 0LL;
          }
          continue;
        default:
          goto LABEL_41;
      }
    }
  }

  return 0LL;
}

void lzma2_encoder_end(void **a1, uint64_t a2)
{
}

uint64_t lzma2_encoder_options_update(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD **)(a2 + 8);
  if (!v2 || *(_DWORD *)a1) {
    return 11LL;
  }
  unsigned int v5 = v2[5];
  if (*(_DWORD *)(a1 + 36) == v5 && *(_DWORD *)(a1 + 40) == v2[6] && *(_DWORD *)(a1 + 44) == v2[7]) {
    return 0LL;
  }
  if (v5 > 4) {
    return 8LL;
  }
  unsigned int v6 = v2[6];
  if (v6 > 4 || v6 + v5 > 4) {
    return 8LL;
  }
  unsigned int v8 = v2[7];
  if (v8 > 4) {
    return 8LL;
  }
  uint64_t v3 = 0LL;
  *(_DWORD *)(a1 + 36) = v5;
  *(_DWORD *)(a1 + 40) = v6;
  *(_DWORD *)(a1 + 44) = v8;
  *(_WORD *)(a1 + 128) = 257;
  return v3;
}

uint64_t lzma_simple_arm64_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)arm64_code, 0LL, 4LL, 4, 1, a4);
}

uint64_t lzma_simple_arm64_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)arm64_code, 0LL, 4LL, 4, 0, a4);
}

uint64_t arm64_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  if (a5 >= 4)
  {
    for (uint64_t i = 0LL; ; i += 4LL)
    {
      unsigned int v7 = a2 + i;
      unsigned int v8 = *(_DWORD *)(a4 + i);
      if ((v8 & 0xFC000000) == 0x94000000)
      {
        int v9 = v7 >> 2;
        if (!a3) {
          int v9 = -v9;
        }
        unsigned int v10 = (v8 + v9) & 0x3FFFFFF | 0x94000000;
      }

      else
      {
        if ((v8 & 0x9F000000) != 0x90000000 || (((v8 >> 3) + 0x20000) & 0x1C0000) != 0) {
          goto LABEL_13;
        }
        int v13 = (v8 >> 3) & 0x1FFFFC | (v8 >> 29) & 3;
        unsigned int v14 = v8 & 0x9000001F;
        int v15 = v7 >> 12;
        if (!a3) {
          int v15 = -v15;
        }
        unsigned int v10 = (((v13 + v15) & 3) << 29) | v14 | (8 * (v13 + v15)) & 0x1FFFE0 | -((v13 + v15) & 0x20000) & 0xE00000;
      }

      *(_DWORD *)(a4 + i) = v10;
LABEL_13:
      uint64_t result = i + 4;
      unint64_t v12 = i + 8;
      if (v12 > a5) {
        return result;
      }
    }
  }

  return 0LL;
}

uint64_t lzma_lzma2_decoder_init(char **a1, uint64_t a2, void *a3)
{
  return lzma_lz_decoder_init( a1,  a2,  a3,  (uint64_t (*)(char *, uint64_t, void, void, unint64_t *))lzma2_decoder_init);
}

uint64_t lzma2_decoder_init(char **a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  int v9 = *a1;
  if (!v9)
  {
    int v9 = (char *)lzma_alloc(0xB8uLL, a2);
    if (!v9) {
      return 5LL;
    }
    *a1 = v9;
    a1[1] = (char *)lzma2_decode;
    a1[4] = (char *)lzma2_decoder_end;
    *(_OWORD *)(v9 + 8) = 0u;
    *(_OWORD *)(v9 + 24) = 0u;
    *((void *)v9 + 5) = 0LL;
  }

  *(_DWORD *)int v9 = 0;
  BOOL v10 = 1;
  v9[64] = 1;
  if (*(void *)(a4 + 8)) {
    BOOL v10 = *(_DWORD *)(a4 + 16) == 0;
  }
  v9[65] = v10;
  return lzma_lzma_decoder_create((void *)v9 + 1, a2, (unsigned int *)a4, a5);
}

uint64_t lzma_lzma2_decoder_memusage(unsigned int *a1)
{
  return lzma_lzma_decoder_memusage_nocheck(a1) + 184;
}

uint64_t lzma_lzma2_props_decode(void *a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  if (a4 != 1) {
    return 8LL;
  }
  unsigned int v7 = lzma_alloc(0x70uLL, a2);
  if (!v7) {
    return 5LL;
  }
  unsigned int v8 = v7;
  uint64_t result = 0LL;
  int v9 = *a3;
  BOOL v10 = v9 == 40;
  int v11 = (v9 & 1 | 2) << ((*a3 >> 1) + 11);
  if (v10) {
    int v11 = -1;
  }
  *(_DWORD *)unsigned int v8 = v11;
  v8[1] = 0LL;
  *((_DWORD *)v8 + 4) = 0;
  *a1 = v8;
  return result;
}

uint64_t lzma2_decode(int *a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5)
{
  BOOL v10 = (uint64_t *)(a2 + 8);
  int v11 = a1 + 18;
  while (1)
  {
    while (1)
    {
      uint64_t v12 = *a4;
      int v13 = *a1;
      if (a5 <= *a4) {
        break;
      }
      switch(v13)
      {
        case 0:
          unsigned int v14 = *(unsigned __int8 *)(a3 + v12);
          *a4 = v12 + 1;
          if (!v14) {
            return 1LL;
          }
          if (v14 > 0xDF || v14 == 1)
          {
            *((_WORD *)a1 + 32) = 257;
            int v16 = 1;
          }

          else
          {
            int v16 = *((unsigned __int8 *)a1 + 65);
            if (*((_BYTE *)a1 + 65)) {
              return 9LL;
            }
          }

          if ((v14 & 0x80) != 0)
          {
            *((void *)a1 + 6) = (unint64_t)(v14 & 0x1F) << 16;
            *a1 = 1;
            if (v14 < 0xC0)
            {
              if (*((_BYTE *)a1 + 64)) {
                return 9LL;
              }
              a1[1] = 6;
              if (v14 >= 0xA0)
              {
                (*((void (**)(void, _DWORD *))a1 + 3))(*((void *)a1 + 1), v11);
                int v16 = *((unsigned __int8 *)a1 + 65);
              }
            }

            else
            {
              *((_BYTE *)a1 + 64) = 0;
              a1[1] = 5;
            }
          }

          else
          {
            if (v14 > 2) {
              return 9LL;
            }
            *(void *)a1 = 0x700000003LL;
          }

          if (v16)
          {
            uint64_t result = 0LL;
            *((_BYTE *)a1 + 65) = 0;
            *(_BYTE *)(a2 + 40) = 1;
            return result;
          }

          break;
        case 1:
          *a4 = v12 + 1;
          *((void *)a1 + 6) += (unint64_t)*(unsigned __int8 *)(a3 + v12) << 8;
          *a1 = 2;
          continue;
        case 2:
          *a4 = v12 + 1;
          *((void *)a1 + 6) += *(unsigned __int8 *)(a3 + v12) + 1LL;
          *a1 = 3;
          (*((void (**)(void))a1 + 4))(*((void *)a1 + 1));
          continue;
        case 3:
          *a4 = v12 + 1;
          *((void *)a1 + 7) = (unint64_t)*(unsigned __int8 *)(a3 + v12) << 8;
          *a1 = 4;
          continue;
        case 4:
          *a4 = v12 + 1;
          *((void *)a1 + 7) += *(unsigned __int8 *)(a3 + v12) + 1LL;
          *a1 = a1[1];
          continue;
        case 5:
          *a4 = v12 + 1;
          (*((void (**)(void, _DWORD *))a1 + 3))(*((void *)a1 + 1), v11);
          *a1 = 6;
          continue;
        case 6:
          goto LABEL_12;
        case 7:
          unint64_t v20 = *((void *)a1 + 7);
          if (a5 - *a4 <= v20) {
            uint64_t v21 = a5;
          }
          else {
            uint64_t v21 = v20 + v12;
          }
          size_t v22 = lzma_bufcpy(a3, a4, v21, *(void *)a2, v10, *(void *)(a2 + 24));
          *((void *)a1 + 7) = v20 - v22;
          unint64_t v23 = *(void *)(a2 + 8);
          if (v23 > *(void *)(a2 + 16)) {
            *(void *)(a2 + 16) = v23;
          }
          if (v20 != v22) {
            return 0LL;
          }
          *a1 = 0;
          continue;
        default:
          return 11LL;
      }
    }

    if (v13 != 6) {
      return 0LL;
    }
LABEL_12:
    uint64_t result = (*((uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t))a1 + 2))( *((void *)a1 + 1),  a2,  a3,  a4,  a5);
    unint64_t v18 = *a4 - v12;
    unint64_t v19 = *((void *)a1 + 7);
    if (v19 < v18) {
      return 9LL;
    }
    *((void *)a1 + 7) = v19 - v18;
    if ((_DWORD)result != 1) {
      return result;
    }
    if (v19 != v18) {
      return 9LL;
    }
    *a1 = 0;
  }

void lzma2_decoder_end(void **a1, uint64_t a2)
{
}

uint64_t lzma_stream_decoder_mt(void *a1, int8x16_t *a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = stream_decoder_mt_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_BYTE *)(v5 + 99) = 1;
    }
  }

  return v4;
}

uint64_t stream_decoder_mt_init(uint64_t a1, uint64_t a2, int8x16_t *a3)
{
  *(void *)(a1 + 16) = stream_decoder_mt_init;
  unsigned int v6 = *(_DWORD **)a1;
  if (!*(void *)a1)
  {
    unsigned int v14 = (char *)lzma_alloc(0x700uLL, a2);
    if (v14)
    {
      unsigned int v6 = v14;
      *(void *)a1 = v14;
      int v15 = (pthread_mutex_t *)(v14 + 552);
      if (!pthread_mutex_init((pthread_mutex_t *)(v14 + 552), 0LL))
      {
        v6[166] = 0;
        if (!pthread_cond_init((pthread_cond_t *)(v6 + 154), 0LL))
        {
          *(void *)(a1 + 24) = stream_decode_mt;
          *(void *)(a1 + 32) = stream_decoder_mt_end;
          *(void *)(a1 + 48) = stream_decoder_mt_get_check;
          *(void *)(a1 + 56) = stream_decoder_mt_memconfig;
          *(void *)(a1 + 40) = stream_decoder_mt_get_progress;
          *((void *)v6 + 37) = -1LL;
          *(_OWORD *)(v6 + 122) = 0u;
          *(_OWORD *)(v6 + 126) = 0u;
          *(_OWORD *)(v6 + 130) = 0u;
          *(_OWORD *)(v6 + 134) = 0u;
          *((void *)v6 + 1) = 0LL;
          *((void *)v6 + 2) = -1LL;
          *(_OWORD *)(v6 + 6) = 0u;
          *(_OWORD *)(v6 + 10) = 0u;
          *(_OWORD *)(v6 + 14) = 0u;
          *(_OWORD *)(v6 + 18) = 0u;
          *((void *)v6 + 86) = 0LL;
          *((void *)v6 + 54) = 0LL;
          v6[114] = 0;
          *((void *)v6 + 58) = 0LL;
          *((void *)v6 + 59) = 0LL;
          goto LABEL_6;
        }

        pthread_mutex_destroy(v15);
      }

      lzma_free(v6, a2);
    }

    return 5LL;
  }

LABEL_6:
  lzma_filters_free((void *)v6 + 37, a2);
  threads_end((uint64_t)v6, a2);
  *unsigned int v6 = 0;
  *(void *)(v6 + 111) = 0LL;
  *((void *)v6 + 60) = 0LL;
  *(_OWORD *)(v6 + 174) = 0u;
  *((void *)v6 + 91) = 0LL;
  *((void *)v6 + 93) = 0LL;
  *((void *)v6 + 92) = 0LL;
  v6[110] = a3[1].i32[0];
  int8x16_t v7 = a3[4];
  int8x16_t v8 = (int8x16_t)vcgtq_u64((uint64x2_t)v7, (uint64x2_t)vdupq_n_s64(1uLL));
  int16x8_t v9 = (int16x8_t)vsubq_s64((int64x2_t)vandq_s8(v7, v8), (int64x2_t)vmvnq_s8(v8));
  *((int16x8_t *)v6 + 42) = v9;
  unsigned int v10 = a3->u8[0];
  *((_BYTE *)v6 + 752) = v10 & 1;
  v9.i64[0] = *(void *)&vshl_u16((uint16x4_t)vdup_n_s16(v10), (uint16x4_t)0xFFFDFFFCFFFEFFFFLL) & 0xFF01FF01FF01FF01LL;
  *(_DWORD *)((char *)v6 + 753) = vmovn_s16(v9).u32[0];
  *((_BYTE *)v6 + 757) = (v10 & 0x20) != 0;
  *((_WORD *)v6 + 379) = 1;
  *((void *)v6 + 95) = 0LL;
  unsigned int v11 = a3->u32[1];
  v6[113] = v11;
  uint64_t result = lzma_outq_init((uint64_t)(v6 + 122), a2, v11);
  if (!(_DWORD)result)
  {
    int v13 = lzma_index_hash_init(*((_OWORD **)v6 + 54), a2);
    *((void *)v6 + 54) = v13;
    if (v13)
    {
      uint64_t result = 0LL;
      *unsigned int v6 = 0;
      *((void *)v6 + 95) = 0LL;
      return result;
    }

    return 5LL;
  }

  return result;
}

uint64_t stream_decode_mt( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  char v89 = 0;
  int v83 = 1;
  if (a9 != 3) {
    int v83 = *a4 == a5 && *(_BYTE *)(a1 + 759) == 0;
  }
  int v15 = (char *)(a1 + 768);
  int v16 = (uint64_t *)(a1 + 760);
  *(_BYTE *)(a1 + 759) = 0;
  uint64_t v78 = a1 + 8;
  unsigned int v79 = (void *)(a1 + 488);
  uint64_t v81 = a1 + 376;
  uint64_t v82 = (_OWORD *)(a1 + 88);
  uint64_t v80 = (uint64_t *)(a1 + 296);
  uint64_t v77 = (pthread_mutex_t *)(a1 + 552);
  int v17 = *(_DWORD *)a1;
  unsigned int v84 = (uint64_t *)(a1 + 760);
  uint64_t v85 = a1 + 768;
  while (2)
  {
    switch(v17)
    {
      case 0:
        unint64_t v18 = v16;
        uint64_t v19 = *a4;
        lzma_bufcpy(a3, a4, a5, (uint64_t)v15, v18, 12LL);
        *(void *)(a1 + 736) += *a4 - v19;
        if (*(void *)(a1 + 760) < 0xCuLL) {
          return 0LL;
        }
        uint64_t *v18 = 0LL;
        uint64_t v20 = lzma_stream_header_decode(v81, (uint64_t)v15);
        if ((_DWORD)v20)
        {
          uint64_t v28 = v20;
          if ((_DWORD)v20 == 7)
          {
            if (*(_BYTE *)(a1 + 758)) {
              return 7LL;
            }
            else {
              return 9LL;
            }
          }
        }

        else
        {
          int v16 = v18;
          *(_BYTE *)(a1 + 758) = 0;
          unsigned int v21 = *(_DWORD *)(a1 + 392);
          *(_DWORD *)(a1 + 96) = v21;
          *(_DWORD *)a1 = 1;
          if (*(_BYTE *)(a1 + 752) && !v21)
          {
            return 2LL;
          }

          else if (*(_BYTE *)(a1 + 753) && !lzma_check_is_supported(v21))
          {
            return 3LL;
          }

          else
          {
            if (!*(_BYTE *)(a1 + 754)) {
              goto LABEL_14;
            }
            return 4LL;
          }
        }

        return v28;
      case 1:
LABEL_14:
        uint64_t v22 = *a4;
        if (*a4 >= a5)
        {
          uint64_t v39 = *a4;
LABEL_55:
          *(void *)(a1 + 736) += v39 - v22;
          if (a9 == 3 && *(_BYTE *)(a1 + 757)) {
            goto LABEL_128;
          }
          uint64_t v27 = read_output_and_wait(a1, a2, a6, a7, a8, 0LL, v83, &v90, &v89);
          if ((_DWORD)v27) {
            return v27;
          }
          if (!*(_DWORD *)(a1 + 448)) {
            return 0LL;
          }
          goto LABEL_101;
        }

        if (*v16)
        {
          unsigned int v23 = *(_DWORD *)(a1 + 92);
        }

        else
        {
          if (!*(_BYTE *)(a3 + v22)) {
            goto LABEL_63;
          }
          unsigned int v23 = 4 * *(unsigned __int8 *)(a3 + v22) + 4;
          *(_DWORD *)(a1 + 92) = v23;
        }

        lzma_bufcpy(a3, a4, a5, (uint64_t)v15, v16, v23);
        if (*(void *)(a1 + 760) < (unint64_t)*(unsigned int *)(a1 + 92))
        {
          uint64_t v39 = *a4;
          goto LABEL_55;
        }

        *(void *)(a1 + 760) = 0LL;
        *(_DWORD *)(a1 + 88) = 1;
        *(void *)(a1 + 120) = v80;
        int v40 = lzma_block_header_decode((uint64_t)v82, a2, v15);
        if (v40)
        {
          *(void *)(a1 + 736) += *a4 - v22;
          if (v40 != 1)
          {
            if (v40 == 102)
            {
LABEL_63:
              int v17 = 7;
              goto LABEL_102;
            }

            *(_DWORD *)(a1 + 448) = v40;
            goto LABEL_101;
          }
        }

        else
        {
          *(_BYTE *)(a1 + 288) = *(_BYTE *)(a1 + 755);
          *(void *)(a1 + 736) += *a4 - v22;
        }

        uint64_t v44 = lzma_raw_decoder_memusage(v80);
        *(void *)(a1 + 712) = v44;
        if (v44 == -1)
        {
          *(_DWORD *)(a1 + 448) = 8;
LABEL_101:
          int v17 = 11;
          goto LABEL_102;
        }

        unint64_t v24 = v44;
        *(_DWORD *)a1 = 2;
LABEL_18:
        if (v24 > *(void *)(a1 + 680))
        {
          uint64_t v28 = read_output_and_wait(a1, a2, a6, a7, a8, 0LL, 1, &v90, &v89);
          if (!(_DWORD)v28)
          {
            if (*(_DWORD *)(a1 + 536)) {
              return 0LL;
            }
            else {
              return 6LL;
            }
          }

          return v28;
        }

        unint64_t v25 = *(void *)(a1 + 104);
        if (v25 > 0x5555555555555555LL || (unint64_t v26 = *(void *)(a1 + 112), v26 >= 0x5555555555555556LL))
        {
          int v17 = 5;
          *(_DWORD *)a1 = 5;
          int v16 = v84;
          continue;
        }

        unint64_t v41 = ((v25 + 3) & 0xFFFFFFFFFFFFFFFCLL) + lzma_check_size(*(_DWORD *)(a1 + 392));
        *(void *)(a1 + 720) = v41;
        uint64_t v42 = v26 + v41 + 64;
        if (__CFADD__(v42, v24) || (unint64_t v43 = v42 + v24, *(void *)(a1 + 728) = v43, v43 > *(void *)(a1 + 672)))
        {
          int v17 = 5;
          *(_DWORD *)a1 = 5;
LABEL_29:
          int v16 = v84;
          int v15 = (char *)v85;
          continue;
        }

        lzma_next_end(v78, a2);
        *(void *)(a1 + 688) = 0LL;
        uint64_t v45 = *(void *)(a1 + 432);
        unint64_t v46 = lzma_block_unpadded_size((uint64_t)v82);
        int v47 = lzma_index_hash_append(v45, v46, *(void *)(a1 + 112));
        int v16 = v84;
        int v15 = (char *)v85;
        if (v47)
        {
          *(_DWORD *)(a1 + 448) = v47;
          int v17 = 11;
          *(_DWORD *)a1 = 11;
          continue;
        }

        *(_DWORD *)a1 = 3;
LABEL_75:
        LOBYTE(v88[0]) = 0;
        uint64_t v27 = read_output_and_wait(a1, a2, a6, a7, a8, v88, 1, &v90, &v89);
        if ((_DWORD)v27) {
          return v27;
        }
        if (*(_DWORD *)(a1 + 448)) {
          goto LABEL_101;
        }
        if (!LOBYTE(v88[0])) {
          return 0LL;
        }
        pthread_mutex_lock(v77);
        uint64_t v48 = *(void *)(a1 + 696);
        uint64_t v49 = *(void *)(a1 + 704);
        uint64_t v50 = *(void *)(a1 + 472);
        pthread_mutex_unlock(v77);
        unint64_t v51 = *(void *)(a1 + 672) - *(void *)(a1 + 728);
        uint64_t v52 = v48 + v49;
        if (*(void *)(a1 + 520) + v52 > v51) {
          lzma_outq_clear_cache2((uint64_t)v79, a2, *(void *)(a1 + 112));
        }
        if (v50 && *(void *)(a1 + 528) + v52 > v51)
        {
          int v16 = v84;
          if (*(void *)(v50 + 384) > *(void *)(a1 + 712) || (uint64_t v50 = *(void *)(v50 + 392)) != 0)
          {
            uint64_t v53 = 0LL;
            do
            {
              lzma_next_end(v50 + 96, a2);
              v53 += *(void *)(v50 + 384);
              *(void *)(v50 + 384) = 0LL;
              uint64_t v50 = *(void *)(v50 + 392);
            }

            while (v50);
          }

          else
          {
            uint64_t v53 = 0LL;
          }
        }

        else
        {
          uint64_t v53 = 0LL;
          int v16 = v84;
        }

        pthread_mutex_lock(v77);
        *(void *)(a1 + 704) -= v53;
        *(void *)(a1 + 696) += *(void *)(a1 + 712) + *(void *)(a1 + 720);
        pthread_mutex_unlock(v77);
        uint64_t thread = lzma_outq_prealloc_buf((uint64_t)v79, a2, *(void *)(a1 + 112));
        if ((_DWORD)thread || (uint64_t thread = get_thread(a1, a2), (_DWORD)thread))
        {
          uint64_t v28 = thread;
          goto LABEL_133;
        }

        uint64_t v55 = *(void *)(a1 + 480);
        *(void *)(v55 + 384) = *(void *)(a1 + 712);
        __int128 v56 = v82[5];
        __int128 v57 = v82[6];
        __int128 v58 = v82[8];
        *(_OWORD *)(v55 + 288) = v82[7];
        *(_OWORD *)(v55 + 304) = v58;
        *(_OWORD *)(v55 + 256) = v56;
        *(_OWORD *)(v55 + 272) = v57;
        __int128 v59 = v82[1];
        __int128 v60 = v82[2];
        __int128 v61 = v82[4];
        *(_OWORD *)(v55 + 224) = v82[3];
        *(_OWORD *)(v55 + 240) = v61;
        *(_OWORD *)(v55 + 192) = v59;
        *(_OWORD *)(v55 + 208) = v60;
        *(_OWORD *)(v55 + 176) = *v82;
        __int128 v62 = v82[9];
        __int128 v63 = v82[10];
        __int128 v64 = v82[12];
        *(_OWORD *)(v55 + 352) = v82[11];
        *(_OWORD *)(v55 + 368) = v64;
        *(_OWORD *)(v55 + 320) = v62;
        *(_OWORD *)(v55 + 336) = v63;
        int v65 = lzma_block_decoder_init(*(void *)(a1 + 480) + 96LL, a2, *(void *)(a1 + 480) + 176LL);
        lzma_filters_free(v80, a2);
        uint64_t v66 = *(void *)(a1 + 480);
        *(void *)(v66 + 208) = 0LL;
        if (v65)
        {
          *(_DWORD *)(a1 + 448) = v65;
          int v15 = (char *)v85;
          goto LABEL_101;
        }

        unint64_t v67 = *(void *)(a1 + 720);
        *(void *)(v66 + 16) = v67;
        int v68 = lzma_alloc(v67, a2);
        uint64_t v69 = *(void *)(a1 + 480);
        *(void *)(v69 + 8) = v68;
        if (v68)
        {
          uint64_t buf = lzma_outq_get_buf((uint64_t)v79, v69);
          uint64_t v71 = *(void *)(a1 + 480);
          *(void *)(v71 + 64) = buf;
          pthread_mutex_lock((pthread_mutex_t *)(v71 + 400));
          uint64_t v72 = *(void *)(a1 + 480);
          *(_DWORD *)uint64_t v72 = 1;
          pthread_cond_signal((pthread_cond_t *)(v72 + 464));
          pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 480) + 400LL));
          pthread_mutex_lock(v77);
          lzma_outq_enable_partial_output(v79, (uint64_t (*)(void))worker_enable_partial_update);
          pthread_mutex_unlock(v77);
          *(_DWORD *)a1 = 4;
          int v15 = (char *)v85;
LABEL_94:
          if (a9 == 3)
          {
            uint64_t v73 = *(uint64_t **)(a1 + 480);
            if (*(_BYTE *)(a1 + 757) && a5 - *a4 < v73[2] - v73[3])
            {
LABEL_128:
              threads_stop(a1);
              return 9LL;
            }
          }

          else
          {
            uint64_t v73 = *(uint64_t **)(a1 + 480);
          }

          uint64_t v74 = v73[2];
          v88[0] = v73[3];
          lzma_bufcpy(a3, a4, a5, v73[1], v88, v74);
          pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 480) + 400LL));
          uint64_t v75 = *(void *)(a1 + 480);
          *(void *)(v75 + 24) = v88[0];
          pthread_cond_signal((pthread_cond_t *)(v75 + 464));
          pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 480) + 400LL));
          uint64_t v28 = read_output_and_wait(a1, a2, a6, a7, a8, 0LL, v83, &v90, &v89);
          if ((_DWORD)v28) {
            return v28;
          }
          if (*(_DWORD *)(a1 + 448)) {
            goto LABEL_101;
          }
          if (*(void *)(*(void *)(a1 + 480) + 24LL) < *(void *)(*(void *)(a1 + 480) + 16LL)) {
            return v28;
          }
          *(void *)(a1 + 480) = 0LL;
          int v17 = 1;
LABEL_102:
          *(_DWORD *)a1 = v17;
          continue;
        }

        uint64_t v28 = 5LL;
LABEL_133:
        threads_stop(a1);
        return v28;
      case 2:
        unint64_t v24 = *(void *)(a1 + 712);
        goto LABEL_18;
      case 3:
        goto LABEL_75;
      case 4:
        goto LABEL_94;
      case 5:
        uint64_t v27 = read_output_and_wait(a1, a2, a6, a7, a8, 0LL, 1, &v90, &v89);
        if ((_DWORD)v27) {
          return v27;
        }
        if (*(_DWORD *)(a1 + 536)) {
          return 0LL;
        }
        lzma_outq_clear_cache((uint64_t)v79, a2);
        threads_end(a1, a2);
        uint64_t v28 = lzma_block_decoder_init(v78, a2, (uint64_t)v82);
        lzma_filters_free(v80, a2);
        *(void *)(a1 + 120) = 0LL;
        if ((_DWORD)v28) {
          return v28;
        }
        *(void *)(a1 + 688) = *(void *)(a1 + 712);
        *(_DWORD *)a1 = 6;
LABEL_26:
        uint64_t v29 = *a4;
        uint64_t v30 = *a7;
        uint64_t v27 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t))(a1 + 32))( *(void *)(a1 + 8),  a2,  a3,  a4,  a5);
        *(void *)(a1 + 736) += *a4 - v29;
        *(void *)(a1 + 744) += *a7 - v30;
        if ((_DWORD)v27 != 1) {
          return v27;
        }
        uint64_t v31 = *(void *)(a1 + 432);
        unint64_t v32 = lzma_block_unpadded_size((uint64_t)v82);
        uint64_t v27 = lzma_index_hash_append(v31, v32, *(void *)(a1 + 112));
        if ((_DWORD)v27) {
          return v27;
        }
        int v17 = 1;
        *(_DWORD *)a1 = 1;
        goto LABEL_29;
      case 6:
        goto LABEL_26;
      case 7:
        uint64_t v27 = read_output_and_wait(a1, a2, a6, a7, a8, 0LL, 1, &v90, &v89);
        if ((_DWORD)v27) {
          return v27;
        }
        if (*(_DWORD *)(a1 + 536)) {
          return 0LL;
        }
        *(_DWORD *)a1 = 8;
LABEL_33:
        uint64_t v33 = *a4;
        if (*a4 >= a5) {
          return 0LL;
        }
        uint64_t v27 = lzma_index_hash_decode(*(void *)(a1 + 432), a3, (unint64_t *)a4, a5);
        uint64_t v34 = *a4;
        *(void *)(a1 + 736) += *a4 - v33;
        if ((_DWORD)v27 != 1) {
          return v27;
        }
        *(_DWORD *)a1 = 9;
        int v16 = v84;
LABEL_37:
        lzma_bufcpy(a3, a4, a5, v85, v16, 12LL);
        *(void *)(a1 + 736) += *a4 - v34;
        if (*(void *)(a1 + 760) < 0xCuLL) {
          return 0LL;
        }
        *int v16 = 0LL;
        unsigned int v35 = lzma_stream_footer_decode((uint64_t)v88, v85);
        if (v35)
        {
          if (v35 == 7) {
            return 9LL;
          }
          else {
            return v35;
          }
        }

        int v15 = (char *)v85;
        unint64_t v36 = lzma_index_hash_size(*(void *)(a1 + 432));
        if (v36 != v88[1]) {
          return 9LL;
        }
        uint64_t v27 = lzma_stream_flags_compare(v81, (uint64_t)v88);
        if ((_DWORD)v27) {
          return v27;
        }
        if (!*(_BYTE *)(a1 + 756)) {
          return 1LL;
        }
        *(_DWORD *)a1 = 10;
LABEL_43:
        uint64_t v37 = *a4;
        if (*a4 >= a5)
        {
LABEL_106:
          if (a9 != 3) {
            return 0LL;
          }
          if (*v16) {
            return 9LL;
          }
          return 1LL;
        }

        while (!*(_BYTE *)(a3 + v37))
        {
          *a4 = ++v37;
          ++*(void *)(a1 + 736);
          *(void *)(a1 + 760) = (*(_DWORD *)(a1 + 760) + 1) & 3;
          if (a5 == v37) {
            goto LABEL_106;
          }
        }

        if (*v16)
        {
          *a4 = v37 + 1;
          ++*(void *)(a1 + 736);
          return 9LL;
        }

        int v38 = lzma_index_hash_init(*(_OWORD **)(a1 + 432), a2);
        *(void *)(a1 + 432) = v38;
        if (!v38) {
          return 5LL;
        }
        int v17 = 0;
        *(_DWORD *)a1 = 0;
        *(void *)(a1 + 760) = 0LL;
        continue;
      case 8:
        goto LABEL_33;
      case 9:
        uint64_t v34 = *a4;
        goto LABEL_37;
      case 10:
        goto LABEL_43;
      case 11:
        if (*(_BYTE *)(a1 + 757)) {
          return *(unsigned int *)(a1 + 448);
        }
        uint64_t v28 = read_output_and_wait(a1, a2, a6, a7, a8, 0LL, 1, &v90, &v89);
        if ((_DWORD)v28) {
          return v28;
        }
        if (*(_DWORD *)(a1 + 536)) {
          return 0LL;
        }
        return *(unsigned int *)(a1 + 448);
      default:
        return 11LL;
    }
  }

void stream_decoder_mt_end(uint64_t *a1, uint64_t a2)
{
}

uint64_t stream_decoder_mt_get_check(uint64_t a1)
{
  return *(unsigned int *)(a1 + 392);
}

uint64_t stream_decoder_mt_memconfig(uint64_t a1, unint64_t *a2, void *a3, unint64_t a4)
{
  int8x16_t v8 = (pthread_mutex_t *)(a1 + 552);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 552));
  *a2 = *(void *)(a1 + 696) + *(void *)(a1 + 688) + *(void *)(a1 + 704) + *(void *)(a1 + 520);
  pthread_mutex_unlock(v8);
  if (!(*a2 >> 15)) {
    *a2 = 0x8000LL;
  }
  *a3 = *(void *)(a1 + 680);
  if (!a4) {
    return 0LL;
  }
  if (*a2 > a4) {
    return 6LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 680) = a4;
  return result;
}

uint64_t stream_decoder_mt_get_progress(uint64_t a1, void *a2, void *a3)
{
  unsigned int v6 = (pthread_mutex_t *)(a1 + 552);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 552));
  *a2 = *(void *)(a1 + 736);
  *a3 = *(void *)(a1 + 744);
  if (*(_DWORD *)(a1 + 456))
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = 400LL;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 464) + v8));
      int16x8_t v9 = (pthread_mutex_t *)(*(void *)(a1 + 464) + v8);
      *a2 += *(void *)&v9[-6].__opaque[48];
      *a3 += v9[-5].__sig;
      pthread_mutex_unlock(v9);
      ++v7;
      v8 += 528LL;
    }

    while (v7 < *(unsigned int *)(a1 + 456));
  }

  return pthread_mutex_unlock(v6);
}

double threads_end(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 456))
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = 400LL;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 464) + v5));
      uint64_t v6 = *(void *)(a1 + 464) + v5;
      *(_DWORD *)(v6 - 400) = 3;
      pthread_cond_signal((pthread_cond_t *)(v6 + 64));
      pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 464) + v5));
      ++v4;
      unint64_t v7 = *(unsigned int *)(a1 + 456);
      v5 += 528LL;
    }

    while (v4 < v7);
    if ((_DWORD)v7)
    {
      unint64_t v8 = 0LL;
      uint64_t v9 = 520LL;
      do
      {
        pthread_join(*(pthread_t *)(*(void *)(a1 + 464) + v9), 0LL);
        ++v8;
        v9 += 528LL;
      }

      while (v8 < *(unsigned int *)(a1 + 456));
    }
  }

  lzma_free(*(void **)(a1 + 464), a2);
  *(_DWORD *)(a1 + 456) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 696) = 0u;
  return result;
}

uint64_t threads_stop(uint64_t result)
{
  if (*(_DWORD *)(result + 456))
  {
    uint64_t v1 = result;
    unint64_t v2 = 0LL;
    uint64_t v3 = 400LL;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(v1 + 464) + v3));
      uint64_t v4 = *(void *)(v1 + 464);
      uint64_t v5 = (_DWORD *)(v4 + v3 - 400);
      if (*v5)
      {
        *uint64_t v5 = 2;
        pthread_cond_signal((pthread_cond_t *)(v4 + v3 + 64));
        uint64_t v4 = *(void *)(v1 + 464);
      }

      double result = pthread_mutex_unlock((pthread_mutex_t *)(v4 + v3));
      ++v2;
      v3 += 528LL;
    }

    while (v2 < *(unsigned int *)(v1 + 456));
  }

  return result;
}

uint64_t read_output_and_wait( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, _BYTE *a6, int a7, int64x2_t *a8, _BYTE *a9)
{
  unsigned int v14 = (pthread_mutex_t *)(a1 + 552);
  int v15 = (uint64_t *)(a1 + 488);
  uint64_t v27 = (pthread_cond_t *)(a1 + 616);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 552));
  v16.i64[0] = 999999999LL;
  int64x2_t v25 = v16;
  while (1)
  {
    uint64_t v17 = *a4;
    while (1)
    {
      uint64_t v18 = lzma_outq_read(v15, a2, a3, a4, a5, 0LL, 0LL);
      if ((_DWORD)v18 != 1) {
        break;
      }
      lzma_outq_enable_partial_output(v15, (uint64_t (*)(void))worker_enable_partial_update);
    }

    uint64_t v19 = v18;
    if ((_DWORD)v18) {
      break;
    }
    if (*a4 == a5 && *a4 != v17) {
      *(_BYTE *)(a1 + 759) = 1;
    }
    uint64_t v19 = *(unsigned int *)(a1 + 444);
    if ((_DWORD)v19)
    {
      if (*(_BYTE *)(a1 + 757)) {
        break;
      }
      *(_DWORD *)(a1 + 448) = 11;
    }

    if (a6
      && *(void *)(a1 + 672) - (*(void *)(a1 + 696) + *(void *)(a1 + 528)) >= *(void *)(a1 + 728)
      && *(_DWORD *)(a1 + 536) < *(_DWORD *)(a1 + 544)
      && (*(_DWORD *)(a1 + 456) < *(_DWORD *)(a1 + 452) || *(void *)(a1 + 472)))
    {
      uint64_t v19 = 0LL;
      *a6 = 1;
      goto LABEL_35;
    }

    if (!a7
      || !*(_DWORD *)(a1 + 536)
      || lzma_outq_is_readable(v15)
      || (uint64_t v21 = *(void *)(a1 + 480)) != 0
      && *(_DWORD *)(v21 + 88)
      && *(void *)(*(void *)(v21 + 64) + 32LL) == *(void *)(v21 + 24))
    {
      uint64_t v19 = 0LL;
      goto LABEL_35;
    }

    unsigned int v22 = *(_DWORD *)(a1 + 440);
    if (v22)
    {
      if (!*a9)
      {
        *a9 = 1;
        a8->i64[0] = v22 / 0x3E8uLL;
        a8->i64[1] = 1000000 * (v22 % 0x3E8);
        clock_gettime(*(clockid_t *)(a1 + 664), &__tp);
        int64x2_t v23 = vaddq_s64(*a8, (int64x2_t)__tp);
        *(int8x16_t *)a8 = vbslq_s8( (int8x16_t)vdupq_lane_s64(vcgtq_s64(vdupq_laneq_s64(v23, 1), v25).i64[0], 0),  (int8x16_t)vaddq_s64(v23, (int64x2_t)xmmword_181171730),  (int8x16_t)v23);
      }

      if (pthread_cond_timedwait(v27, v14, (const timespec *)a8))
      {
        uint64_t v19 = 101LL;
LABEL_35:
        pthread_mutex_unlock(v14);
        return v19;
      }
    }

    else
    {
      pthread_cond_wait(v27, v14);
    }
  }

  pthread_mutex_unlock(v14);
  if ((_DWORD)v19 != 101) {
    threads_stop(a1);
  }
  return v19;
}

uint64_t get_thread(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 552);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 552));
  uint64_t v5 = *(void *)(a1 + 472);
  if (v5)
  {
    uint64_t v6 = *(void *)(v5 + 384);
    *(void *)(a1 + 472) = *(void *)(v5 + 392);
    *(void *)(a1 + 480) = v5;
    *(void *)(a1 + 704) -= v6;
  }

  pthread_mutex_unlock(v4);
  unint64_t v7 = *(char **)(a1 + 480);
  if (v7) {
    goto LABEL_4;
  }
  uint64_t v9 = *(char **)(a1 + 464);
  if (v9 || (uint64_t v9 = (char *)lzma_alloc(528LL * *(unsigned int *)(a1 + 452), a2), (*(void *)(a1 + 464) = v9) != 0LL))
  {
    int v10 = *(_DWORD *)(a1 + 456);
    unint64_t v7 = &v9[528 * v10];
    if (!pthread_mutex_init((pthread_mutex_t *)(v7 + 400), 0LL))
    {
      unsigned int v11 = &v9[528 * v10];
      uint64_t v12 = (pthread_cond_t *)(v11 + 464);
      *((_DWORD *)v11 + 128) = 0;
      if (!pthread_cond_init((pthread_cond_t *)(v11 + 464), 0LL))
      {
        *(_DWORD *)unint64_t v7 = 0;
        int v13 = &v9[528 * v10];
        *((void *)v13 + 1) = 0LL;
        *((void *)v13 + 2) = 0LL;
        *((void *)v13 + 6) = a1;
        *((void *)v13 + 7) = a2;
        *((void *)v13 + 8) = 0LL;
        *((void *)v13 + 12) = 0LL;
        *((void *)v13 + 13) = -1LL;
        *((_OWORD *)v13 + 7) = 0u;
        *((_OWORD *)v13 + 8) = 0u;
        *((_OWORD *)v13 + 9) = 0u;
        *((_OWORD *)v13 + 10) = 0u;
        *((void *)v13 + 48) = 0LL;
        unsigned int v14 = (pthread_t *)(v13 + 520);
        sigset_t v15 = -1;
        pthread_sigmask(3, &v15, &v16);
        LODWORD(v14) = pthread_create(v14, 0LL, (void *(__cdecl *)(void *))worker_decoder, &v9[528 * v10]);
        pthread_sigmask(3, &v16, 0LL);
        if (!(_DWORD)v14)
        {
          ++*(_DWORD *)(a1 + 456);
          *(void *)(a1 + 480) = v7;
LABEL_4:
          uint64_t result = 0LL;
          *((void *)v7 + 3) = 0LL;
          *((void *)v7 + 4) = 0LL;
          *((void *)v7 + 5) = 0LL;
          *((void *)v7 + 9) = 0LL;
          *((void *)v7 + 10) = 0LL;
          *((_DWORD *)v7 + 22) = 0;
          return result;
        }

        pthread_cond_destroy(v12);
      }

      pthread_mutex_destroy((pthread_mutex_t *)(v7 + 400));
    }
  }

  return 5LL;
}

uint64_t worker_enable_partial_update(uint64_t a1)
{
  unint64_t v2 = (pthread_mutex_t *)(a1 + 400);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 400));
  *(_DWORD *)(a1 + 88) = 1;
  pthread_cond_signal((pthread_cond_t *)(a1 + 464));
  return pthread_mutex_unlock(v2);
}

uint64_t worker_decoder(int *a1)
{
  unint64_t v2 = (pthread_mutex_t *)(a1 + 100);
  uint64_t v3 = (pthread_cond_t *)(a1 + 116);
  uint64_t v4 = a1 + 8;
  uint64_t v5 = a1 + 18;
  uint64_t v6 = a1 + 10;
  uint64_t v7 = (uint64_t)(a1 + 24);
LABEL_2:
  pthread_mutex_lock(v2);
  while (1)
  {
    int v8 = *a1;
    if (!*a1) {
      goto LABEL_10;
    }
    if (v8 == 2)
    {
      *a1 = 0;
      pthread_mutex_unlock(v2);
      pthread_mutex_lock((pthread_mutex_t *)(*((void *)a1 + 6) + 552LL));
      uint64_t v13 = *((void *)a1 + 2);
      uint64_t v14 = *((void *)a1 + 6);
      goto LABEL_22;
    }

    if (v8 == 3) {
      break;
    }
    __int128 v9 = *((_OWORD *)a1 + 2);
    *(_OWORD *)(a1 + 18) = v9;
    uint64_t v10 = *((void *)a1 + 3);
    int v11 = a1[22];
    if (v10 != (void)v9 || v11 == 1)
    {
      pthread_mutex_unlock(v2);
      uint64_t v15 = *((void *)a1 + 4);
      unint64_t v16 = v10 - v15;
      uint64_t v17 = v15 + 0x4000;
      if (v16 <= 0x4000) {
        uint64_t v18 = v10;
      }
      else {
        uint64_t v18 = v17;
      }
      int v19 = (*((uint64_t (**)(void, void, void, int *, uint64_t, uint64_t, int *, void, _DWORD))a1 + 15))( *((void *)a1 + 12),  *((void *)a1 + 7),  *((void *)a1 + 1),  v4,  v18,  *((void *)a1 + 8) + 64LL,  v6,  *(void *)(*((void *)a1 + 8) + 16LL),  0);
      if (v19)
      {
        int v20 = v19;
        lzma_free(*((void **)a1 + 1), *((void *)a1 + 7));
        *((void *)a1 + 1) = 0LL;
        pthread_mutex_lock(v2);
        if (*a1 != 3) {
          *a1 = 0;
        }
        pthread_mutex_unlock(v2);
        pthread_mutex_lock((pthread_mutex_t *)(*((void *)a1 + 6) + 552LL));
        int64x2_t v21 = *((int64x2_t *)a1 + 2);
        *(int64x2_t *)(*((void *)a1 + 6) + 736LL) = vaddq_s64(*(int64x2_t *)(*((void *)a1 + 6) + 736LL), v21);
        *uint64_t v5 = 0LL;
        v5[1] = 0LL;
        uint64_t v22 = *((void *)a1 + 8);
        *(void *)(v22 + 24) = v21.i64[1];
        *(void *)(v22 + 32) = *((void *)a1 + 4);
        *(_BYTE *)(v22 + 40) = 1;
        *(_DWORD *)(v22 + 44) = v20;
        *((void *)a1 + 8) = 0LL;
        uint64_t v14 = *((void *)a1 + 6);
        if (v20 != 1 && !*(_DWORD *)(v14 + 444)) {
          *(_DWORD *)(v14 + 444) = v20;
        }
        uint64_t v13 = *((void *)a1 + 2);
LABEL_22:
        uint64_t v23 = *(void *)(v14 + 696);
        *((void *)a1 + 2) = 0LL;
        uint64_t v24 = *((void *)a1 + 48);
        *(void *)(v14 + 696) = v23 - (v13 + v24);
        *(void *)(v14 + 704) += v24;
        *((void *)a1 + 49) = *(void *)(v14 + 472);
        *(void *)(v14 + 472) = a1;
LABEL_23:
        pthread_cond_signal((pthread_cond_t *)(v14 + 616));
        pthread_mutex_unlock((pthread_mutex_t *)(*((void *)a1 + 6) + 552LL));
        goto LABEL_2;
      }

      if (v11)
      {
        a1[22] = 2;
        pthread_mutex_lock((pthread_mutex_t *)(*((void *)a1 + 6) + 552LL));
        uint64_t v25 = *((void *)a1 + 8);
        uint64_t v14 = *((void *)a1 + 6);
        *(void *)(v25 + 24) = *((void *)a1 + 5);
        *(void *)(v25 + 32) = *((void *)a1 + 4);
        goto LABEL_23;
      }

      goto LABEL_2;
    }

LABEL_10:
    pthread_cond_wait(v3, v2);
  }

  pthread_mutex_unlock(v2);
  lzma_free(*((void **)a1 + 1), *((void *)a1 + 7));
  lzma_next_end(v7, *((void *)a1 + 7));
  pthread_mutex_destroy(v2);
  pthread_cond_destroy(v3);
  return 0LL;
}

uint64_t lzma_delta_coder_init(char **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  if (!v6)
  {
    uint64_t v6 = (char *)lzma_alloc(0x160uLL, a2);
    if (!v6) {
      return 5LL;
    }
    *a1 = v6;
    a1[4] = (char *)delta_coder_end;
    *(void *)uint64_t v6 = 0LL;
    *((void *)v6 + 1) = -1LL;
    *((_OWORD *)v6 + 1) = 0u;
    *((_OWORD *)v6 + 2) = 0u;
    *((_OWORD *)v6 + 3) = 0u;
    *((_OWORD *)v6 + 4) = 0u;
  }

  uint64_t v7 = *(_DWORD **)(a3 + 16);
  if (!v7) {
    return 8LL;
  }
  if (*v7) {
    return 8LL;
  }
  uint64_t v8 = v7[1];
  *((void *)v6 + 10) = v8;
  v6[88] = 0;
  *(_OWORD *)(v6 + 105) = 0u;
  *(_OWORD *)(v6 + 121) = 0u;
  *(_OWORD *)(v6 + 137) = 0u;
  *(_OWORD *)(v6 + 153) = 0u;
  *(_OWORD *)(v6 + 169) = 0u;
  *(_OWORD *)(v6 + 185) = 0u;
  *(_OWORD *)(v6 + 201) = 0u;
  *(_OWORD *)(v6 + 217) = 0u;
  *(_OWORD *)(v6 + 233) = 0u;
  *(_OWORD *)(v6 + 249) = 0u;
  *(_OWORD *)(v6 + 89) = 0u;
  *(_OWORD *)(v6 + 265) = 0u;
  *(_OWORD *)(v6 + 281) = 0u;
  *(_OWORD *)(v6 + 297) = 0u;
  *(_OWORD *)(v6 + 313) = 0u;
  *(_OWORD *)(v6 + 329) = 0u;
  return lzma_next_filter_init((uint64_t)v6, a2, (void *)(a3 + 24), (__n128)0);
}

void delta_coder_end(void *a1, uint64_t a2)
{
}

uint64_t lzma_delta_coder_memusage(_DWORD *a1)
{
  if (!a1 || *a1) {
    return -1LL;
  }
  return 352LL;
}

uint64_t lzma_delta_encoder_init(char **a1, uint64_t a2, uint64_t a3)
{
  a1[3] = (char *)delta_encode;
  a1[8] = (char *)delta_encoder_update;
  return lzma_delta_coder_init(a1, a2, a3);
}

uint64_t delta_encode( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  uint64_t v12 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t *))(a1 + 24);
  if (v12)
  {
    uint64_t v13 = *a7;
    uint64_t result = v12(*(void *)a1, a2, a3, a4, a5, a6, a7);
    uint64_t v15 = *a7 - v13;
    if (*a7 != v13)
    {
      unint64_t v16 = (char *)(a6 + v13);
      char v17 = *(_BYTE *)(a1 + 80);
      unsigned __int8 v18 = *(_BYTE *)(a1 + 88);
      do
      {
        char v19 = *(_BYTE *)(a1 + 89 + (v18 + v17));
        char v20 = *v16;
        uint64_t v21 = v18--;
        *(_BYTE *)(a1 + 89 + v21) = *v16;
        *v16++ = v20 - v19;
        --v15;
      }

      while (v15);
      *(_BYTE *)(a1 + 88) = v18;
    }
  }

  else
  {
    uint64_t v22 = *a4;
    unint64_t v23 = a5 - *a4;
    uint64_t v24 = *a7;
    if (v23 >= a8 - *a7) {
      unint64_t v23 = a8 - *a7;
    }
    if (v23)
    {
      uint64_t v25 = (char *)(a3 + v22);
      unint64_t v26 = (_BYTE *)(a6 + v24);
      char v27 = *(_BYTE *)(a1 + 80);
      unsigned __int8 v28 = *(_BYTE *)(a1 + 88);
      unint64_t v29 = v23;
      do
      {
        char v30 = *(_BYTE *)(a1 + 89 + (v28 + v27));
        char v31 = *v25++;
        uint64_t v32 = v28--;
        *(_BYTE *)(a1 + 89 + v32) = v31;
        *v26++ = v31 - v30;
        --v29;
      }

      while (v29);
      *(_BYTE *)(a1 + 88) = v28;
    }

    uint64_t v33 = v23 + v22;
    *a4 = v33;
    *a7 = v23 + v24;
    BOOL v34 = v33 == a5;
    return a9 && v34;
  }

  return result;
}

uint64_t delta_encoder_update(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return lzma_next_filter_update(a1, a2, (void *)(a4 + 16));
}

uint64_t lzma_delta_props_encode(uint64_t a1, _BYTE *a2)
{
  if (lzma_delta_coder_memusage((_DWORD *)a1) == -1) {
    return 11LL;
  }
  uint64_t result = 0LL;
  *a2 = *(_BYTE *)(a1 + 4) - 1;
  return result;
}

uint64_t lzma_delta_decoder_init(char **a1, uint64_t a2, uint64_t a3)
{
  a1[3] = (char *)delta_decode;
  return lzma_delta_coder_init(a1, a2, a3);
}

uint64_t delta_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v10 = *a7;
  uint64_t result = (*(uint64_t (**)(void))(a1 + 24))(*(void *)a1);
  uint64_t v12 = *a7 - v10;
  if (*a7 != v10)
  {
    uint64_t v13 = (_BYTE *)(a6 + v10);
    char v14 = *(_BYTE *)(a1 + 80);
    unsigned __int8 v15 = *(_BYTE *)(a1 + 88);
    do
    {
      char v16 = *v13 + *(_BYTE *)(a1 + 89 + (v15 + v14));
      *v13++ = v16;
      uint64_t v17 = v15--;
      *(_BYTE *)(a1 + 89 + v17) = v16;
      --v12;
    }

    while (v12);
    *(_BYTE *)(a1 + 88) = v15;
  }

  return result;
}

uint64_t lzma_delta_props_decode(void *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (a4 != 1) {
    return 8LL;
  }
  uint64_t v6 = lzma_alloc(0x28uLL, a2);
  if (!v6) {
    return 5LL;
  }
  uint64_t v7 = v6;
  uint64_t result = 0LL;
  int v9 = *a3 + 1;
  *uint64_t v7 = 0;
  v7[1] = v9;
  *a1 = v7;
  return result;
}

uint64_t lzma_simple_coder_init( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, char a8, __n128 a9)
{
  uint64_t v13 = *a1;
  if (*a1) {
    goto LABEL_2;
  }
  uint64_t v20 = 2 * a6;
  uint64_t v21 = lzma_alloc(2 * a6 + 144, a2);
  if (!v21) {
    return 5LL;
  }
  uint64_t v13 = (uint64_t)v21;
  a1[3] = (uint64_t)simple_code;
  a1[4] = (uint64_t)simple_coder_end;
  *a1 = (uint64_t)v21;
  a1[8] = (uint64_t)simple_coder_update;
  *uint64_t v21 = 0LL;
  v21[1] = -1LL;
  a9 = 0uLL;
  *((_OWORD *)v21 + 1) = 0u;
  *((_OWORD *)v21 + 2) = 0u;
  *((_OWORD *)v21 + 3) = 0u;
  *((_OWORD *)v21 + 4) = 0u;
  v21[11] = a4;
  v21[14] = v20;
  if (a5)
  {
    uint64_t v22 = lzma_alloc(a5, a2);
    *(void *)(v13 + 96) = v22;
    if (!v22) {
      return 5LL;
    }
  }

  else
  {
    v21[12] = 0LL;
  }

LABEL_2:
  char v14 = *(int **)(a3 + 16);
  if (v14)
  {
    int v15 = *v14;
    *(_DWORD *)(v13 + 104) = v15;
    if ((v15 & (a7 - 1)) != 0) {
      return 8LL;
    }
  }

  else
  {
    *(_DWORD *)(v13 + 104) = 0;
  }

  *(_BYTE *)(v13 + 81) = a8;
  *(_BYTE *)(v13 + 80) = 0;
  *(void *)(v13 + 128) = 0LL;
  *(void *)(v13 + 136) = 0LL;
  *(void *)(v13 + 120) = 0LL;
  return lzma_next_filter_init(v13, a2, (void *)(a3 + 24), a9);
}

uint64_t simple_code( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  if (a9 == 1) {
    return 8LL;
  }
  unint64_t v19 = *(void *)(a1 + 120);
  unint64_t v18 = *(void *)(a1 + 128);
  uint64_t v20 = (uint64_t *)(a1 + 120);
  if (v19 < v18)
  {
    lzma_bufcpy(a1 + 144, v20, v18, a6, a7, a8);
    unint64_t v19 = *(void *)(a1 + 120);
    if (v19 < *(void *)(a1 + 128)) {
      return 0LL;
    }
    if (*(_BYTE *)(a1 + 80)) {
      return 1LL;
    }
  }

  uint64_t v34 = a6;
  uint64_t v35 = a3;
  uint64_t v32 = a4;
  uint64_t v33 = a5;
  uint64_t v21 = (void *)(a1 + 136);
  size_t v22 = *(void *)(a1 + 136);
  *(void *)(a1 + 128) = 0LL;
  uint64_t v23 = *a7;
  size_t v24 = v22 - v19;
  if (v22 != v19 && a8 - *a7 <= v24)
  {
    if (v19)
    {
      memmove((void *)(a1 + 144), (const void *)(a1 + 144 + v19), v22 - v19);
      size_t v22 = *(void *)(a1 + 136) - *(void *)(a1 + 120);
      *(void *)(a1 + 136) = v22;
      *(void *)(a1 + 120) = 0LL;
    }

    uint64_t v28 = v35;
    goto LABEL_19;
  }

  if (v22 != v19) {
    memcpy((void *)(v34 + v23), (const void *)(a1 + v19 + 144), v24);
  }
  *a7 = v24 + v23;
  uint64_t result = copy_or_code(a1, a2, v35, v32, v33, v34, a7, a8, a9);
  if (!(_DWORD)result)
  {
    uint64_t v26 = *a7 - v23;
    if (*a7 == v23)
    {
      uint64_t v27 = 0LL;
    }

    else
    {
      uint64_t v30 = *a7 - v23;
      uint64_t v27 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(a1 + 88))( *(void *)(a1 + 96),  *(unsigned int *)(a1 + 104),  *(unsigned __int8 *)(a1 + 81),  v34 + v23,  v30);
      uint64_t v26 = v30;
      *(_DWORD *)(a1 + 104) += v27;
    }

    uint64_t v28 = v35;
    size_t v22 = v26 - v27;
    *(void *)(a1 + 120) = 0LL;
    *(void *)(a1 + 136) = v26 - v27;
    if (*(_BYTE *)(a1 + 80))
    {
      *uint64_t v21 = 0LL;
      return *(_BYTE *)(a1 + 80) && *v20 == *v21;
    }

    if (v26 != v27)
    {
      uint64_t v31 = *a7 - v22;
      *a7 = v31;
      memcpy((void *)(a1 + 144), (const void *)(v34 + v31), v22);
    }

void simple_coder_end(void **a1, uint64_t a2)
{
}

uint64_t simple_coder_update(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return lzma_next_filter_update(a1, a2, (void *)(a4 + 16));
}

uint64_t copy_or_code( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9)
{
  uint64_t v12 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t))(a1 + 24);
  if (v12)
  {
    uint64_t result = v12(*(void *)a1, a2, a3, a4, a5);
    if ((_DWORD)result)
    {
      if ((_DWORD)result != 1) {
        return result;
      }
      *(_BYTE *)(a1 + 80) = 1;
    }
  }

  else
  {
    lzma_bufcpy(a3, a4, a5, a6, a7, a8);
    BOOL v14 = a9 != 3 || *(_BYTE *)(a1 + 81) == 0;
    if (!v14 && *a4 == a5)
    {
      uint64_t result = 0LL;
      *(_BYTE *)(a1 + 80) = 1;
      return result;
    }
  }

  return 0LL;
}

uint64_t lzma_simple_props_size(int *a1, _DWORD *a2)
{
  if (a2) {
    int v2 = 4 * (*a2 != 0);
  }
  else {
    int v2 = 0;
  }
  *a1 = v2;
  return 0LL;
}

uint64_t lzma_simple_props_encode(_DWORD *a1, _DWORD *a2)
{
  if (a1 && *a1) {
    *a2 = *a1;
  }
  return 0LL;
}

uint64_t lzma_simple_props_decode(void *a1, uint64_t a2, int *a3, uint64_t a4)
{
  if (!a4) {
    return 0LL;
  }
  if (a4 != 4) {
    return 8LL;
  }
  uint64_t v7 = lzma_alloc(4uLL, a2);
  if (!v7) {
    return 5LL;
  }
  uint64_t v8 = v7;
  int v9 = *a3;
  *uint64_t v7 = *a3;
  if (v9)
  {
    uint64_t result = 0LL;
    *a1 = v8;
  }

  else
  {
    lzma_free(v7, a2);
    return 0LL;
  }

  return result;
}

double lzma_simple_x86_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return x86_coder_init(a1, a2, a3, 1, a4);
}

double x86_coder_init(uint64_t *a1, uint64_t a2, uint64_t a3, char a4, __n128 a5)
{
  if (!lzma_simple_coder_init(a1, a2, a3, (uint64_t)x86_code, 8uLL, 5LL, 1, a4, a5))
  {
    double result = NAN;
    **(void **)(*a1 + 96) = 0xFFFFFFFB00000000LL;
  }

  return result;
}

double lzma_simple_x86_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return x86_coder_init(a1, a2, a3, 0, a4);
}

unint64_t x86_code(unsigned int *a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  unint64_t v5 = a5 - 5;
  if (a5 < 5) {
    return 0LL;
  }
  unint64_t result = 0LL;
  unsigned int v8 = *a1;
  if (a2 - a1[1] <= 5) {
    unsigned int v9 = a1[1];
  }
  else {
    unsigned int v9 = a2 - 5;
  }
  do
  {
    if ((*(_BYTE *)(a4 + result) + 22) <= 0xFDu)
    {
      ++result;
      continue;
    }

    unsigned int v10 = result + a2;
    if ((_DWORD)result + a2 - v9 <= 5)
    {
      if (v10 != v9)
      {
        if (v10 - v9 <= 1) {
          int v11 = 1;
        }
        else {
          int v11 = v10 - v9;
        }
        do
        {
          unsigned int v8 = (2 * v8) & 0xEE;
          --v11;
        }

        while (v11);
      }
    }

    else
    {
      unsigned int v8 = 0;
    }

    int v12 = *(unsigned __int8 *)(a4 + result + 4);
    if ((v12 + 1) > 1u)
    {
      int v13 = 1;
LABEL_29:
      ++result;
      v8 |= v13;
      unsigned int v9 = v10;
      continue;
    }

    int v13 = 17;
    if (((0xE8uLL >> ((v8 >> 1) & 7)) & 1) != 0 || v8 > 0x1F) {
      goto LABEL_29;
    }
    unint64_t v14 = result + 1;
    unsigned int v15 = v10 + 5;
    if (!a3) {
      unsigned int v15 = -5 - v10;
    }
    if (v8)
    {
      char v17 = 8 * x86_code_MASK_TO_BIT_NUMBER[v8 >> 1];
      char v18 = 24 - v17;
      for (i = -1 << -v17; ; unsigned int v16 = v15 + (v16 ^ ~i))
      {
        int v20 = (v16 >> v18);
        if (v20 != 255 && v20 != 0) {
          break;
        }
      }
    }

    unsigned int v8 = 0;
    *(_BYTE *)(a4 + result + 4) = (int)(v16 << 7) >> 31;
    *(_BYTE *)(a4 + result + 3) = BYTE2(v16);
    *(_BYTE *)(a4 + result + 2) = BYTE1(v16);
    result += 5LL;
    unsigned int v9 = v10;
    *(_BYTE *)(a4 + v14) = v16;
  }

  while (result <= v5);
  *a1 = v8;
  a1[1] = v9;
  return result;
}

uint64_t lzma_simple_powerpc_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)powerpc_code, 0LL, 4LL, 4, 1, a4);
}

uint64_t lzma_simple_powerpc_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)powerpc_code, 0LL, 4LL, 4, 0, a4);
}

uint64_t powerpc_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  if (a5 < 4) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  int v7 = -a2;
  uint64_t v8 = a4 + 1;
  do
  {
    uint64_t v10 = v8 + v6;
    char v11 = *(_BYTE *)(a4 + v6);
    if ((v11 & 0xFC) == 0x48)
    {
      char v12 = *(_BYTE *)(v10 + 2);
      if ((v12 & 3) == 1)
      {
        int v13 = (v11 & 3) << 24;
        unint64_t v14 = (_BYTE *)(v8 + v6);
        int v15 = *(unsigned __int8 *)(v8 + v6 + 1);
        int v16 = v12 & 0xFC;
        int v17 = a2 + v6;
        if (!a3) {
          int v17 = v7;
        }
        int v18 = v13 + v17 + v16;
        int v19 = v18 + (*(unsigned __int8 *)(v8 + v6) << 16) + (v15 << 8);
        *(_BYTE *)(v10 - 1) = HIBYTE(v19) & 3 | 0x48;
        _BYTE *v14 = BYTE2(v19);
        v14[1] = (unsigned __int16)(v18 + ((_WORD)v15 << 8)) >> 8;
        *(_BYTE *)(v10 + 2) = v18 | 1;
      }
    }

    uint64_t result = v6 + 4;
    unint64_t v20 = v6 + 8;
    v7 -= 4;
    v6 += 4LL;
  }

  while (v20 <= a5);
  return result;
}

uint64_t lzma_simple_ia64_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)ia64_code, 0LL, 16LL, 16, 1, a4);
}

uint64_t lzma_simple_ia64_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)ia64_code, 0LL, 16LL, 16, 0, a4);
}

uint64_t ia64_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  if (a5 < 0x10) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v6 = a4 + 1;
  uint64_t v7 = 16LL;
  uint64x2_t v8 = (uint64x2_t)vdupq_n_s64(6uLL);
  int64x2_t v9 = vdupq_n_s64(2uLL);
  uint64_t v10 = a4;
  do
  {
    uint64_t v11 = 0LL;
    char v12 = *(_BYTE *)(a4 + result);
    unsigned int v13 = result + a2;
    uint64_t result = v7;
    unsigned int v14 = ia64_code_BRANCH_TABLE[v12 & 0x1F];
    if (a3) {
      unsigned int v15 = v13;
    }
    else {
      unsigned int v15 = -v13;
    }
    unsigned int v16 = v15 >> 4;
    unint64_t v17 = 5LL;
    do
    {
      if (((v14 >> v11) & 1) != 0)
      {
        uint64_t v18 = 0LL;
        unint64_t v19 = 0LL;
        unint64_t v20 = (_BYTE *)(v6 + (v17 >> 3));
        uint64_t v21 = (unsigned __int8 *)(v10 + (v17 >> 3));
        do
        {
          unsigned int v22 = *v21++;
          v19 += (unint64_t)v22 << v18;
          v18 += 8LL;
        }

        while (v18 != 48);
        unint64_t v23 = v19 >> (v17 & 7);
        if ((v23 & 0x1E000000E00LL) == 0xA000000000LL)
        {
          uint64_t v24 = 0LL;
          int v25 = v16 + ((v23 >> 13) & 0xFFFFF | (v23 >> 16) & 0x100000);
          unint64_t v26 = ((v23 & 0xFFFFFFEE00001FFFLL | ((unint64_t)(v25 & 0xFFFFF) << 13) & 0xFFFFFFEFFFFFFFFFLL | ((((unint64_t)(v25 & 0x100000) >> 20) & 1) << 36)) << (v17 & 7)) | v19 & ~(-1 << (v17 & 7));
          int64x2_t v27 = (int64x2_t)xmmword_18116F5C0;
          do
          {
            int64x2_t v27 = vaddq_s64(v27, v9);
            v24 += 16LL;
            v20 += 2;
          }

          while (v24 != 48);
        }
      }

      ++v11;
      v17 += 41LL;
    }

    while (v11 != 3);
    uint64_t v7 = result + 16;
    v10 += 16LL;
    v6 += 16LL;
  }

  while (result + 16 <= a5);
  return result;
}

uint64_t lzma_simple_arm_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)arm_code, 0LL, 4LL, 4, 1, a4);
}

uint64_t lzma_simple_arm_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)arm_code, 0LL, 4LL, 4, 0, a4);
}

uint64_t arm_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  if (a5 < 4) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  int v7 = -8 - a2;
  uint64_t v8 = a4 + 1;
  do
  {
    int64x2_t v9 = (unsigned __int8 *)(v8 + v6);
    if (*(unsigned __int8 *)(v8 + v6 + 2) == 235)
    {
      int v10 = 4 * ((v9[1] << 16) | (*v9 << 8) | *(v9 - 1));
      if (a3) {
        unsigned int v11 = a2 + 8 + v6 + v10;
      }
      else {
        unsigned int v11 = v7 + v10;
      }
      v9[1] = v11 >> 18;
      *(_BYTE *)(v8 + v6) = v11 >> 10;
      *(v9 - 1) = v11 >> 2;
    }

    uint64_t result = v6 + 4;
    unint64_t v12 = v6 + 8;
    v7 -= 4;
    v6 += 4LL;
  }

  while (v12 <= a5);
  return result;
}

uint64_t lzma_simple_armthumb_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)armthumb_code, 0LL, 4LL, 2, 1, a4);
}

uint64_t lzma_simple_armthumb_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)armthumb_code, 0LL, 4LL, 2, 0, a4);
}

uint64_t armthumb_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  if (a5 < 4) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  do
  {
    char v7 = *(_BYTE *)(a4 + v6 + 1);
    if ((v7 & 0xF8) == 0xF0)
    {
      int v8 = *(unsigned __int8 *)(a4 + v6 + 3);
      if ((~v8 & 0xF8) == 0)
      {
        int v9 = ((v7 & 7) << 19) | (*(unsigned __int8 *)(a4 + v6) << 11) | ((v8 & 7) << 8);
        uint64_t v10 = v6 + 2;
        int v11 = 2 * (v9 | *(unsigned __int8 *)(a4 + v6 + 2));
        if (a3) {
          unsigned int v12 = a2 + 4 + v6 + v11;
        }
        else {
          unsigned int v12 = v11 - (v6 + a2) - 4;
        }
        *(_BYTE *)(a4 + v6 + 1) = (v12 >> 20) & 7 | 0xF0;
        *(_BYTE *)(a4 + v6) = v12 >> 12;
        *(_BYTE *)(a4 + v6 + 3) = (v12 >> 9) | 0xF8;
        v6 += 2LL;
        *(_BYTE *)(a4 + v10) = v12 >> 1;
      }
    }

    uint64_t result = v6 + 2;
    unint64_t v13 = v6 + 6;
    v6 += 2LL;
  }

  while (v13 <= a5);
  return result;
}

uint64_t lzma_stream_encoder_mt(void *a1, _DWORD *a2)
{
  uint64_t v4 = lzma_strm_init(a1);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = stream_encoder_mt_init(a1[7], a1[6], a2);
    if ((_DWORD)v4)
    {
      lzma_end((uint64_t)a1);
    }

    else
    {
      uint64_t v5 = a1[7];
      *(_BYTE *)(v5 + 96) = 1;
      *(_WORD *)(v5 + 98) = 257;
      *(_BYTE *)(v5 + 100) = 1;
    }
  }

  return v4;
}

uint64_t stream_encoder_mt_init(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *(void *)(a1 + 16) = stream_encoder_mt_init;
  uint64_t result = get_options((uint64_t)a3, v18, (uint64_t **)v17, &v16, &v15);
  if (!(_DWORD)result)
  {
    unsigned int v7 = a3[8];
    if (v7 > 0xF) {
      return 11LL;
    }
    int v8 = *(char **)a1;
    if (*(void *)a1)
    {
      int v9 = *((_DWORD *)v8 + 108);
LABEL_12:
      *(_DWORD *)int v8 = 0;
      *((void *)v8 + 1) = v16;
      *((void *)v8 + 51) = v15;
      *((_DWORD *)v8 + 105) = 0;
      *((void *)v8 + 56) = 0LL;
      if (v9 == a3[1])
      {
        threads_stop_0((uint64_t)v8, 1);
        unsigned int v10 = a3[1];
      }

      else
      {
        threads_end_0((uint64_t)v8, a2);
        *((void *)v8 + 53) = 0LL;
        *((void *)v8 + 54) = 0LL;
        *((void *)v8 + 55) = 0LL;
        unint64_t v13 = lzma_alloc(568LL * a3[1], a2);
        *((void *)v8 + 53) = v13;
        if (!v13) {
          return 5LL;
        }
        unsigned int v10 = a3[1];
        *((_DWORD *)v8 + 108) = v10;
      }

      uint64_t result = lzma_outq_init((uint64_t)(v8 + 344), a2, v10);
      if ((_DWORD)result) {
        return result;
      }
      *((_DWORD *)v8 + 104) = a3[4];
      lzma_filters_free((void *)v8 + 2, a2);
      lzma_filters_free((void *)v8 + 12, a2);
      uint64_t result = lzma_filters_copy(*(uint64_t **)v17, v8 + 16, a2);
      if ((_DWORD)result) {
        return result;
      }
      lzma_index_end(*((uint64_t **)v8 + 22), a2);
      unsigned int v14 = lzma_index_init(a2);
      *((void *)v8 + 22) = v14;
      if (v14)
      {
        *((_DWORD *)v8 + 66) = 0;
        *((_DWORD *)v8 + 70) = a3[8];
        uint64_t result = lzma_stream_header_encode((_DWORD *)v8 + 66, (uint64_t)(v8 + 320));
        if (!(_DWORD)result)
        {
          *((void *)v8 + 42) = 0LL;
          *((void *)v8 + 57) = 0LL;
          *((void *)v8 + 58) = 12LL;
        }

        return result;
      }

      return 5LL;
    }

    int v11 = (char *)lzma_alloc(0x250uLL, a2);
    if (!v11) {
      return 5LL;
    }
    int v8 = v11;
    *(void *)a1 = v11;
    unsigned int v12 = (pthread_mutex_t *)(v11 + 472);
    if (!pthread_mutex_init((pthread_mutex_t *)(v11 + 472), 0LL))
    {
      *((_DWORD *)v8 + 146) = 0;
      if (!pthread_cond_init((pthread_cond_t *)(v8 + 536), 0LL))
      {
        int v9 = 0;
        *(void *)(a1 + 24) = stream_encode_mt;
        *(void *)(a1 + 32) = stream_encoder_mt_end;
        *(void *)(a1 + 40) = get_progress;
        *(void *)(a1 + 64) = stream_encoder_mt_update;
        *((void *)v8 + 2) = -1LL;
        *((void *)v8 + 12) = -1LL;
        *((void *)v8 + 24) = -1LL;
        *(_OWORD *)(v8 + 200) = 0u;
        *(_OWORD *)(v8 + 216) = 0u;
        *(_OWORD *)(v8 + 232) = 0u;
        *(_OWORD *)(v8 + 248) = 0u;
        *((_OWORD *)v8 + 11) = 0u;
        *(_OWORD *)(v8 + 344) = 0u;
        *(_OWORD *)(v8 + 360) = 0u;
        *(_OWORD *)(v8 + 376) = 0u;
        *(_OWORD *)(v8 + 392) = 0u;
        *(_OWORD *)(v8 + 424) = 0u;
        goto LABEL_12;
      }

      pthread_mutex_destroy(v12);
    }

    lzma_free(v8, a2);
    *(void *)a1 = 0LL;
    return 5LL;
  }

  return result;
}

uint64_t lzma_stream_encoder_mt_memusage(uint64_t a1)
{
  uint64_t v3 = *(unsigned int *)(a1 + 4);
  unint64_t v4 = v12;
  uint64_t result = lzma_raw_encoder_memusage(v13);
  if (result != -1)
  {
    uint64_t v5 = result;
    uint64_t result = lzma_outq_memusage(v11, v3);
    if (result != -1)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 4);
      uint64_t v7 = v4 * v3 + 568LL * v6 + 33360;
      if (__CFADD__(v7, v5 * v3)) {
        return -1LL;
      }
      uint64_t v8 = v7 + v5 * v3;
      BOOL v9 = __CFADD__(v8, result);
      uint64_t v10 = v8 + result;
      if (v9) {
        return -1LL;
      }
      else {
        return v10;
      }
    }
  }

  return result;
}

uint64_t get_options(uint64_t a1, uint64_t *a2, uint64_t **a3, unint64_t *a4, unint64_t *a5)
{
  if (!a1) {
    return 11LL;
  }
  if (*(_DWORD *)a1) {
    return 8LL;
  }
  uint64_t v10 = *(uint64_t **)(a1 + 24);
  if (!v10)
  {
    BOOL v12 = lzma_easy_preset(a2, *(_DWORD *)(a1 + 20));
    uint64_t v10 = a2;
    if (v12) {
      return 8LL;
    }
  }

  *a3 = v10;
  unint64_t v13 = *(void *)(a1 + 8);
  if (v13)
  {
    if (!(v13 >> 50))
    {
      *a4 = v13;
      goto LABEL_12;
    }

    return 8LL;
  }

  unint64_t v13 = lzma_mt_block_size(v10);
  *a4 = v13;
  if (!v13) {
    return 8LL;
  }
LABEL_12:
  unint64_t v14 = lzma_block_buffer_bound64(v13);
  *a5 = v14;
  if (v14) {
    return 0LL;
  }
  else {
    return 5LL;
  }
}

uint64_t stream_encode_mt( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5, uint64_t a6, uint64_t *a7, unint64_t a8, int64x2_t a9, int a10)
{
  uint64_t v12 = a6;
  switch(*(_DWORD *)a1)
  {
    case 0:
      lzma_bufcpy(a1 + 320, (uint64_t *)(a1 + 336), 12LL, a6, a7, a8);
      if (*(void *)(a1 + 336) < 0xCuLL) {
        return 0LL;
      }
      *(void *)(a1 + 336) = 0LL;
      *(_DWORD *)a1 = 1;
      goto LABEL_5;
    case 1:
LABEL_5:
      uint64_t v50 = v12;
      int v48 = 0;
      unint64_t v54 = 0LL;
      unint64_t v55 = 0LL;
      __dst = (_OWORD *)(a1 + 96);
      unint64_t v51 = (pthread_cond_t *)(a1 + 536);
      a9.i64[0] = 999999999LL;
      int64x2_t v47 = a9;
      break;
    case 2:
      goto LABEL_83;
    case 3:
      goto LABEL_87;
    default:
      return 11LL;
  }

  while (1)
  {
    uint64_t v12 = v50;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
      uint64_t v17 = *(unsigned int *)(a1 + 420);
      if (!(_DWORD)v17) {
        uint64_t v17 = lzma_outq_read((uint64_t *)(a1 + 344), a2, v50, a7, a8, &v55, &v54);
      }
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 472));
      if ((_DWORD)v17 != 1)
      {
        if (!(_DWORD)v17) {
          goto LABEL_14;
        }
        goto LABEL_78;
      }

      uint64_t v18 = lzma_index_append(*(void **)(a1 + 176), a2, v55, v54);
      if ((_DWORD)v18)
      {
        uint64_t v17 = v18;
LABEL_78:
        threads_stop_0(a1, 0);
        return v17;
      }
    }

    while (*a7 < a8);
    while (1)
    {
LABEL_14:
      unint64_t v19 = *a4;
      uint64_t v20 = *(void *)(a1 + 448);
      if (*a4 >= a5)
      {
        if (!a10 || !v20) {
          goto LABEL_55;
        }
        goto LABEL_31;
      }

      if (v20) {
        goto LABEL_31;
      }
      if (*(_DWORD *)(a1 + 392) >= *(_DWORD *)(a1 + 400)) {
        goto LABEL_29;
      }
      uint64_t v17 = lzma_outq_prealloc_buf(a1 + 344, a2, *(void *)(a1 + 408));
      if (!(_DWORD)v17)
      {
        if (*(void *)__dst != -1LL || (uint64_t v17 = lzma_filters_copy((uint64_t *)(a1 + 16), __dst, a2), !(_DWORD)v17))
        {
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
          uint64_t v21 = *(void *)(a1 + 440);
          if (v21)
          {
            *(void *)(a1 + 448) = v21;
            *(void *)(a1 + 440) = *(void *)(v21 + 432);
          }

          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 472));
          uint64_t v22 = *(void *)(a1 + 448);
          if (v22) {
            goto LABEL_22;
          }
          unsigned int v30 = *(_DWORD *)(a1 + 436);
          if (v30 == *(_DWORD *)(a1 + 432)) {
            goto LABEL_29;
          }
          uint64_t v44 = *(void *)(a1 + 424);
          unsigned int v45 = *(_DWORD *)(a1 + 436);
          uint64_t v22 = v44 + 568LL * v30;
          uint64_t v35 = lzma_alloc(*(void *)(a1 + 8), a2);
          *(void *)(v22 + 8) = v35;
          if (v35)
          {
            unint64_t v43 = (pthread_mutex_t *)(v44 + 568LL * v45 + 440);
            if (!pthread_mutex_init(v43, 0LL))
            {
              uint64_t v36 = v44 + 568LL * v45;
              *(_DWORD *)(v36 + 552) = 0;
              uint64_t v42 = (pthread_cond_t *)(v36 + 504);
              if (!pthread_cond_init((pthread_cond_t *)(v36 + 504), 0LL))
              {
                *(_DWORD *)uint64_t v22 = 0;
                uint64_t v37 = v44 + 568LL * v45;
                *(void *)(v37 + 32) = a1;
                *(void *)(v37 + 40) = a2;
                *(void *)(v37 + 48) = 0LL;
                *(void *)(v37 + 56) = 0LL;
                *(void *)(v37 + 64) = 0LL;
                *(void *)(v37 + 72) = -1LL;
                *(_OWORD *)(v37 + 80) = 0u;
                *(_OWORD *)(v37 + 96) = 0u;
                *(_OWORD *)(v37 + 112) = 0u;
                *(_OWORD *)(v37 + 128) = 0u;
                *(void *)(v37 + 352) = -1LL;
                unint64_t v46 = (pthread_t *)(v37 + 560);
                sigset_t v56 = -1;
                pthread_sigmask(3, &v56, v57);
                LODWORD(v46) = pthread_create(v46, 0LL, (void *(__cdecl *)(void *))worker_start, (void *)v22);
                pthread_sigmask(3, v57, 0LL);
                if (!(_DWORD)v46)
                {
                  ++*(_DWORD *)(a1 + 436);
                  *(void *)(a1 + 448) = v22;
LABEL_22:
                  pthread_mutex_lock((pthread_mutex_t *)(v22 + 440));
                  uint64_t v23 = *(void *)(a1 + 448);
                  *(_DWORD *)uint64_t v23 = 1;
                  *(void *)(v23 + 16) = 0LL;
                  uint64_t buf = lzma_outq_get_buf(a1 + 344, 0LL);
                  uint64_t v25 = *(void *)(a1 + 448);
                  *(void *)(v25 + 24) = buf;
                  lzma_filters_free((void *)(v25 + 352), a2);
                  unint64_t v26 = *(_OWORD **)(a1 + 448);
                  v26[22] = *__dst;
                  __int128 v27 = *(_OWORD *)(a1 + 112);
                  __int128 v28 = *(_OWORD *)(a1 + 128);
                  __int128 v29 = *(_OWORD *)(a1 + 160);
                  v26[25] = *(_OWORD *)(a1 + 144);
                  v26[26] = v29;
                  v26[23] = v27;
                  v26[24] = v28;
                  *(void *)(a1 + 96) = -1LL;
                  pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 448) + 504LL));
                  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 448) + 440LL));
LABEL_29:
                  uint64_t v17 = 0LL;
                  goto LABEL_30;
                }

                pthread_cond_destroy(v42);
              }

              pthread_mutex_destroy(v43);
            }

            lzma_free(*(void **)(v22 + 8), a2);
          }

          uint64_t v17 = 5LL;
        }
      }

void stream_encoder_mt_end(uint64_t a1, uint64_t a2)
{
}

uint64_t get_progress(uint64_t a1, void *a2, void *a3)
{
  unsigned int v6 = (pthread_mutex_t *)(a1 + 472);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 472));
  *a2 = *(void *)(a1 + 456);
  *a3 = *(void *)(a1 + 464);
  if (*(_DWORD *)(a1 + 436))
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = 440LL;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 424) + v8));
      BOOL v9 = (pthread_mutex_t *)(*(void *)(a1 + 424) + v8);
      *a2 += *(void *)&v9[-7].__opaque[48];
      *a3 += v9[-6].__sig;
      pthread_mutex_unlock(v9);
      ++v7;
      v8 += 568LL;
    }

    while (v7 < *(unsigned int *)(a1 + 436));
  }

  return pthread_mutex_unlock(v6);
}

uint64_t stream_encoder_mt_update(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (*(_DWORD *)a1 > 1u || *(void *)(a1 + 448)) {
    return 11LL;
  }
  if (lzma_raw_encoder_memusage(a3) == -1) {
    return 8LL;
  }
  uint64_t v4 = lzma_filters_copy(a3, __dst, a2);
  if (!(_DWORD)v4)
  {
    lzma_filters_free((void *)(a1 + 16), a2);
    lzma_filters_free((void *)(a1 + 96), a2);
    __int128 v8 = __dst[3];
    *(_OWORD *)(a1 + 48) = __dst[2];
    *(_OWORD *)(a1 + 64) = v8;
    *(_OWORD *)(a1 + 80) = __dst[4];
    __int128 v9 = __dst[1];
    *(_OWORD *)(a1 + 16) = __dst[0];
    *(_OWORD *)(a1 + 32) = v9;
  }

  return v4;
}

void threads_end_0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 436))
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = 440LL;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 424) + v5));
      uint64_t v6 = *(void *)(a1 + 424) + v5;
      *(_DWORD *)(v6 - 440) = 4;
      pthread_cond_signal((pthread_cond_t *)(v6 + 64));
      pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 424) + v5));
      ++v4;
      unint64_t v7 = *(unsigned int *)(a1 + 436);
      v5 += 568LL;
    }

    while (v4 < v7);
    if ((_DWORD)v7)
    {
      unint64_t v8 = 0LL;
      uint64_t v9 = 560LL;
      do
      {
        pthread_join(*(pthread_t *)(*(void *)(a1 + 424) + v9), 0LL);
        ++v8;
        v9 += 568LL;
      }

      while (v8 < *(unsigned int *)(a1 + 436));
    }
  }

  lzma_free(*(void **)(a1 + 424), a2);
}

uint64_t threads_stop_0(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 436))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0LL;
    uint64_t v5 = 440LL;
    do
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(v3 + 424) + v5));
      uint64_t v6 = *(void *)(v3 + 424) + v5;
      *(_DWORD *)(v6 - 440) = 3;
      pthread_cond_signal((pthread_cond_t *)(v6 + 64));
      uint64_t result = pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(v3 + 424) + v5));
      ++v4;
      unint64_t v7 = *(unsigned int *)(v3 + 436);
      v5 += 568LL;
    }

    while (v4 < v7);
    if ((_DWORD)v7 && a2)
    {
      unint64_t v8 = 0LL;
      do
      {
        uint64_t v9 = 568 * v8;
        pthread_mutex_lock((pthread_mutex_t *)(*(void *)(v3 + 424) + 568 * v8 + 440));
        while (1)
        {
          uint64_t v10 = *(void *)(v3 + 424);
          if (!*(_DWORD *)(v10 + v9)) {
            break;
          }
          uint64_t v9 = 568 * v8;
          pthread_cond_wait((pthread_cond_t *)(v10 + 568 * v8 + 504), (pthread_mutex_t *)(v10 + 568 * v8 + 440));
        }

        uint64_t result = pthread_mutex_unlock((pthread_mutex_t *)(v10 + 568 * v8++ + 440));
      }

      while (v8 < *(unsigned int *)(v3 + 436));
    }
  }

  return result;
}

uint64_t worker_start(uint64_t a1)
{
  int v2 = (pthread_mutex_t *)(a1 + 440);
  uint64_t v3 = (pthread_cond_t *)(a1 + 504);
  uint64_t v4 = a1 + 144;
  uint64_t v5 = (void *)(a1 + 352);
  uint64_t v6 = a1 + 184;
  uint64_t v7 = a1 + 64;
  unint64_t v8 = (void *)(a1 + 48);
  uint64_t v32 = a1 + 64;
  while (1)
  {
    pthread_mutex_lock(v2);
    while (1)
    {
      unsigned int v9 = *(_DWORD *)a1;
      if (*(_DWORD *)a1 == 3)
      {
        *(_DWORD *)a1 = 0;
        pthread_cond_signal(v3);
        unsigned int v9 = *(_DWORD *)a1;
      }

      if (v9) {
        break;
      }
      pthread_cond_wait(v3, v2);
    }

    pthread_mutex_unlock(v2);
    unint64_t v33 = 0LL;
    if (v9 < 3)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      unsigned int v11 = *(_DWORD *)(v10 + 280);
      uint64_t v12 = *(void *)(*(void *)(a1 + 24) + 16LL);
      uint64_t v13 = *(void *)(v10 + 8);
      *(void *)(a1 + 144) = 0LL;
      *(void *)(a1 + 152) = v11;
      *(void *)(a1 + 160) = v12;
      *(void *)(a1 + 168) = v13;
      *(void *)(a1 + 176) = v5;
      *(_OWORD *)uint64_t v6 = 0u;
      *(_OWORD *)(v6 + 16) = 0u;
      *(_OWORD *)(v6 + 32) = 0u;
      *(_OWORD *)(v6 + 48) = 0u;
      *(_OWORD *)(v6 + 64) = 0u;
      *(_OWORD *)(v6 + 80) = 0u;
      *(_OWORD *)(v6 + 96) = 0u;
      *(_OWORD *)(v6 + 112) = 0u;
      *(_OWORD *)(v6 + 128) = 0u;
      *(_OWORD *)(v6 + 144) = 0u;
      *(void *)(v6 + 160) = 0LL;
      int v14 = lzma_block_header_size(v4);
      if (v14 || (int v14 = lzma_block_encoder_init(v7, *(void *)(a1 + 40), v4)) != 0)
      {
        worker_error(a1, v14);
        unsigned int v9 = 3;
        goto LABEL_40;
      }

      uint64_t v15 = 0LL;
      unint64_t v33 = *(unsigned int *)(a1 + 148);
      uint64_t v34 = 0LL;
      unint64_t v16 = *(void *)(*(void *)(a1 + 24) + 16LL);
      do
      {
        pthread_mutex_lock(v2);
        unint64_t v17 = v33;
        *(void *)(a1 + 48) = v34;
        *(void *)(a1 + 56) = v17;
        while (v15 == *(void *)(a1 + 16))
        {
          unsigned int v9 = *(_DWORD *)a1;
          if (*(_DWORD *)a1 != 1) {
            goto LABEL_17;
          }
          pthread_cond_wait(v3, v2);
        }

        unsigned int v9 = *(_DWORD *)a1;
        uint64_t v15 = *(void *)(a1 + 16);
LABEL_17:
        pthread_mutex_unlock(v2);
        if (v9 > 2) {
          goto LABEL_38;
        }
        if (v9 == 2) {
          int v18 = 3;
        }
        else {
          int v18 = 0;
        }
        if ((unint64_t)(v15 - v34) <= 0x4000)
        {
          uint64_t v19 = v15;
        }

        else
        {
          int v18 = 0;
          uint64_t v19 = v34 + 0x4000;
        }

        int v20 = (*(uint64_t (**)(void, void, void, uint64_t *, uint64_t, uint64_t, unint64_t *, unint64_t, int))(a1 + 88))( *(void *)(a1 + 64),  *(void *)(a1 + 40),  *(void *)(a1 + 8),  &v34,  v19,  *(void *)(a1 + 24) + 64LL,  &v33,  v16,  v18);
        if (v20)
        {
          int v21 = v20;
          if (v20 == 1)
          {
            int v22 = lzma_block_header_encode(v4, (char *)(*(void *)(a1 + 24) + 64LL));
            if (!v22) {
              goto LABEL_37;
            }
            int v21 = v22;
          }

          uint64_t v23 = a1;
LABEL_33:
          worker_error(v23, v21);
          unsigned int v9 = 3;
          goto LABEL_38;
        }
      }

      while (v33 < v16);
      pthread_mutex_lock(v2);
      while (1)
      {
        unsigned int v9 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 != 1) {
          break;
        }
        pthread_cond_wait(v3, v2);
      }

      unint64_t v24 = *(void *)(a1 + 16);
      pthread_mutex_unlock(v2);
      if (v9 <= 2)
      {
        unint64_t v33 = 0LL;
        if (lzma_block_uncomp_encode( v4,  *(char **)(a1 + 8),  v24,  *(void *)(a1 + 24) + 64LL,  (uint64_t *)&v33,  v16))
        {
          uint64_t v23 = a1;
          int v21 = 11;
          goto LABEL_33;
        }

LABEL_38:
      uint64_t v7 = v32;
    }

    if (v9 == 4) {
      break;
    }
LABEL_40:
    pthread_mutex_lock(v2);
    if (*(_DWORD *)a1 != 4)
    {
      *(_DWORD *)a1 = 0;
      pthread_cond_signal(v3);
    }

    pthread_mutex_unlock(v2);
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 472LL));
    uint64_t v27 = *(void *)(a1 + 24);
    unint64_t v28 = v33;
    if (v9 == 2)
    {
      *(void *)(v27 + 24) = v33;
      *(_BYTE *)(v27 + 40) = 1;
    }

    uint64_t v29 = *(void *)(a1 + 32);
    uint64_t v30 = *(void *)(v29 + 464);
    *(void *)(v29 + 456) += *(void *)(v27 + 56);
    *(void *)(v29 + 464) = v30 + v28;
    *unint64_t v8 = 0LL;
    v8[1] = 0LL;
    *(void *)(a1 + 432) = *(void *)(v29 + 440);
    *(void *)(v29 + 440) = a1;
    pthread_cond_signal((pthread_cond_t *)(v29 + 536));
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 472LL));
  }

  lzma_filters_free(v5, *(void *)(a1 + 40));
  pthread_mutex_destroy(v2);
  pthread_cond_destroy(v3);
  lzma_next_end(v7, *(void *)(a1 + 40));
  lzma_free(*(void **)(a1 + 8), *(void *)(a1 + 40));
  return 0LL;
}

uint64_t worker_error(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v4 + 420)) {
    *(_DWORD *)(v4 + 420) = a2;
  }
  pthread_cond_signal((pthread_cond_t *)(v4 + 536));
  return pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 472LL));
}

uint64_t lzma_simple_sparc_encoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)sparc_code, 0LL, 4LL, 4, 1, a4);
}

uint64_t lzma_simple_sparc_decoder_init(uint64_t *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  return lzma_simple_coder_init(a1, a2, a3, (uint64_t)sparc_code, 0LL, 4LL, 4, 0, a4);
}

uint64_t sparc_code(uint64_t a1, int a2, int a3, uint64_t a4, unint64_t a5)
{
  if (a5 >= 4)
  {
    uint64_t v6 = 0LL;
    int v7 = -a2;
    uint64_t v8 = a4 + 1;
    while (1)
    {
      int v9 = *(unsigned __int8 *)(a4 + v6);
      if (v9 == 127)
      {
        unsigned int v10 = *(unsigned __int8 *)(v8 + v6);
        if (v10 >= 0xC0)
        {
          uint64_t v11 = v6 + 1;
          goto LABEL_10;
        }
      }

      else if (v9 == 64)
      {
        unsigned int v10 = *(unsigned __int8 *)(v8 + v6);
        if (v10 < 0x40)
        {
          uint64_t v11 = v6 | 1;
LABEL_10:
          int v12 = (v9 << 24) | (v10 << 16);
          uint64_t v13 = v8 + v6;
          int v14 = v12 | (*(unsigned __int8 *)(v8 + v6 + 1) << 8) | *(unsigned __int8 *)(v8 + v6 + 2);
          int v15 = a2 + v6;
          if (!a3) {
            int v15 = v7;
          }
          unsigned int v16 = v15 + 4 * v14;
          int v17 = (int)(v16 << 7) >> 9;
          *(_BYTE *)(a4 + v6) = HIBYTE(v17) & 0x3F | 0x40;
          *(_BYTE *)(a4 + v11) = (v17 & 0x3FC00000 | (v16 >> 2) & 0x3FFFFF) >> 16;
          *(_BYTE *)(v13 + 1) = v16 >> 10;
          *(_BYTE *)(v13 + 2) = v16 >> 2;
        }
      }

      uint64_t result = v6 + 4;
      unint64_t v18 = v6 + 8;
      v7 -= 4;
      v6 += 4LL;
      if (v18 > a5) {
        return result;
      }
    }
  }

  return 0LL;
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1895FA570](*(void *)&__clock_id, __tp);
}

void free(void *a1)
{
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9A0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9B0](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1895FC9B8](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1895FCA58](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1895FCB58](*(void *)&a1, a2, a3);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FD2A8](*(void *)&a1);
}