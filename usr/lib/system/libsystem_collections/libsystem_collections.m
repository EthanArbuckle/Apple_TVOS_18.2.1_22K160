void *os_set_str_ptr_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  void *result;
  uint64_t v6;
  uint64_t v7;
  if (a2)
  {
    v4 = *(_DWORD *)(a2 + 8);
    if (v4 <= 0x20) {
      v4 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 18) = 0;
    if (v4 == -1) {
      os_set_str_ptr_init_cold_2(a1, a2, a3);
    }
  }

  else
  {
    *(void *)(a1 + 8) = 0x2000000000LL;
    *(_WORD *)(a1 + 18) = 0;
    v4 = 32;
  }

  result = calloc(v4, 8uLL);
  if (!result) {
    os_set_str_ptr_init_cold_1(0LL, v6, v7);
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_set_str_ptr_destroy(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 12) = 0;
}

uint64_t os_set_str_ptr_insert(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2) {
    os_set_str_ptr_insert_cold_1(a1, 0LL, a3);
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_set_str_ptr_rehash(a1, 1LL, a3);
  }
  return _os_set_str_ptr_insert_no_rehash(a1, a2, (uint64_t)a2);
}

const char **os_set_str_ptr_find(uint64_t a1, char *__s1, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 8))
  {
    unsigned int v4 = *(_DWORD *)(a1 + 12);
    int v5 = *__s1;
    if (*__s1)
    {
      unsigned int v6 = 0;
      v7 = __s1 + 1;
      do
      {
        unsigned int v6 = (1025 * (v6 + v5)) ^ ((1025 * (v6 + v5)) >> 6);
        int v8 = *v7++;
        int v5 = v8;
      }

      while (v8);
      unsigned int v9 = 9 * v6;
      if (!v4) {
LABEL_17:
      }
        os_set_str_ptr_find_cold_1(a1, (uint64_t)__s1, a3);
    }

    else
    {
      unsigned int v9 = 0;
      if (!v4) {
        goto LABEL_17;
      }
    }

    int v10 = 0;
    uint64_t v11 = *(void *)a1;
    unsigned int v12 = 32769 * (v9 ^ (v9 >> 11)) % v4;
    int v13 = *(unsigned __int16 *)(a1 + 18) + 1;
    while (v13 != v10)
    {
      v14 = *(const char ***)(v11 + 8LL * v12);
      if (!v14) {
        return v14;
      }
      if (*v14 == __s1) {
        return v14;
      }
      a1 = strcmp(__s1, *v14);
      if (!(_DWORD)a1) {
        return v14;
      }
      if (v12 + 1 < v4) {
        ++v12;
      }
      else {
        unsigned int v12 = 0;
      }
      if (v4 == ++v10) {
        goto LABEL_17;
      }
    }
  }

  return 0LL;
}

const char **os_set_str_ptr_delete(uint64_t a1, char *__s1, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 8);
  if (v3)
  {
    uint64_t v5 = a1;
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    int v7 = *__s1;
    if (*__s1)
    {
      unsigned int v8 = 0;
      unsigned int v9 = __s1 + 1;
      do
      {
        unsigned int v8 = (1025 * (v8 + v7)) ^ ((1025 * (v8 + v7)) >> 6);
        int v10 = *v9++;
        int v7 = v10;
      }

      while (v10);
      unsigned int v11 = 9 * v8;
      if (!v6) {
LABEL_17:
      }
        os_set_str_ptr_find_cold_1(a1, (uint64_t)__s1, a3);
    }

    else
    {
      unsigned int v11 = 0;
      if (!v6) {
        goto LABEL_17;
      }
    }

    int v12 = 0;
    uint64_t v13 = *(void *)a1;
    unsigned int v14 = 32769 * (v11 ^ (v11 >> 11)) % v6;
    int v15 = *(unsigned __int16 *)(a1 + 18) + 1;
    while (v15 != v12)
    {
      v16 = *(const char ***)(v13 + 8LL * v14);
      if (!v16) {
        return v16;
      }
      if (*v16 == __s1 || (a1 = strcmp(__s1, *v16), !(_DWORD)a1))
      {
        if (v14 + 1 < v6) {
          unsigned int v17 = v14 + 1;
        }
        else {
          unsigned int v17 = 0;
        }
        v18 = *(void **)(v13 + 8LL * v17);
        if (v18)
        {
          while (1)
          {
            unsigned int v19 = v17;
            int v20 = *(unsigned __int8 *)*v18;
            if (*(_BYTE *)*v18)
            {
              unsigned int v21 = 0;
              v22 = (unsigned __int8 *)(*v18 + 1LL);
              do
              {
                unsigned int v21 = (1025 * (v21 + v20)) ^ ((1025 * (v21 + v20)) >> 6);
                int v23 = *v22++;
                int v20 = v23;
              }

              while (v23);
              unsigned int v24 = 9 * v21;
            }

            else
            {
              unsigned int v24 = 0;
            }

            if (32769 * (v24 ^ (v24 >> 11)) % v6 == v19) {
              break;
            }
            *(void *)(v13 + 8LL * v14) = v18;
            if (v19 + 1 < v6) {
              unsigned int v17 = v19 + 1;
            }
            else {
              unsigned int v17 = 0;
            }
            v18 = *(void **)(v13 + 8LL * v17);
            unsigned int v14 = v19;
            if (!v18) {
              goto LABEL_36;
            }
          }

          unsigned int v19 = v14;
LABEL_36:
          uint64_t v25 = v19;
        }

        else
        {
          uint64_t v25 = v14;
        }

        *(void *)(v13 + 8 * v25) = 0LL;
        *(_DWORD *)(v5 + 8) = v3 - 1;
        if (v6 >= 0x40 && v3 - 1 < v6 >> 3) {
          _os_set_str_ptr_rehash(v5, 0xFFFFFFFFLL, a3);
        }
        return v16;
      }

      if (v14 + 1 < v6) {
        ++v14;
      }
      else {
        unsigned int v14 = 0;
      }
      if (v6 == ++v12) {
        goto LABEL_17;
      }
    }
  }

  return 0LL;
}

void os_set_str_ptr_clear(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v13[0] = MEMORY[0x1895FED80];
    v13[1] = 0x40000000LL;
    unsigned int v14 = __os_set_str_ptr_clear_block_invoke;
    int v15 = &unk_18A313A30;
    uint64_t v16 = a2;
    int v3 = *(void **)a1;
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000LL;
    uint64_t v5 = calloc(0x20uLL, 8uLL);
    if (!v5) {
      os_set_str_ptr_init_cold_1(0LL, v6, v7);
    }
    *(void *)a1 = v5;
    *(_WORD *)(a1 + 16) = 5;
    if ((_DWORD)v4)
    {
      unsigned int v8 = v3;
      do
      {
        if (*v8) {
          ((void (*)(void *, void, void))v14)(v13, *v8, *v8);
        }
        ++v8;
        --v4;
      }

      while (v4);
    }

    free(v3);
  }

  else
  {
    unsigned int v9 = *(void **)a1;
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000LL;
    int v10 = calloc(0x20uLL, 8uLL);
    if (!v10) {
      os_set_str_ptr_init_cold_1(0LL, v11, v12);
    }
    *(void *)a1 = v10;
    *(_WORD *)(a1 + 16) = 5;
    free(v9);
  }
}

uint64_t __os_set_str_ptr_clear_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t os_set_str_ptr_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_set_str_ptr_foreach(uint64_t result, uint64_t a2)
{
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  unsigned int v8 = __os_set_str_ptr_foreach_block_invoke;
  unsigned int v9 = &unk_18A313A58;
  uint64_t v10 = a2;
  unint64_t v2 = *(unsigned int *)(result + 12);
  if ((_DWORD)v2)
  {
    uint64_t v3 = result;
    unint64_t v4 = 0LL;
    uint64_t v5 = *(void *)result;
    do
    {
      uint64_t v6 = *(void *)(v5 + 8 * v4);
      if (v6)
      {
        result = ((uint64_t (*)(void *, uint64_t, void))v8)(v7, v6, *(void *)(v5 + 8 * v4));
        if (!(_DWORD)result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v3 + 12);
      }

      ++v4;
    }

    while (v4 < v2);
  }

  return result;
}

uint64_t __os_set_str_ptr_foreach_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void *os_set_32_ptr_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unsigned int v4 = *(_DWORD *)(a2 + 8);
    if (v4 <= 0x20) {
      unsigned int v4 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 18) = 0;
    if (v4 == -1) {
      os_set_32_ptr_init_cold_2(a1, a2, a3);
    }
  }

  else
  {
    *(void *)(a1 + 8) = 0x2000000000LL;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v4 = 32;
  }

  result = calloc(v4, 8uLL);
  if (!result) {
    os_set_32_ptr_init_cold_1(0LL, v6, v7);
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_set_32_ptr_destroy(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 12) = 0;
}

uint64_t os_set_32_ptr_insert(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (!a2) {
    os_set_32_ptr_insert_cold_1(a1, 0LL, a3);
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_set_32_ptr_rehash(a1, 1LL, a3);
  }
  return _os_set_32_ptr_insert_no_rehash(a1, a2, (uint64_t)a2);
}

uint64_t os_set_32_ptr_find(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 8))
  {
    unsigned int v3 = *(_DWORD *)(result + 12);
    if (!v3) {
LABEL_11:
    }
      os_set_32_ptr_find_cold_1(result, a2, a3);
    int v4 = 0;
    uint64_t v5 = *(void *)result;
    unsigned int v6 = 73244475 * ((73244475 * (a2 ^ WORD1(a2))) ^ ((73244475 * (a2 ^ WORD1(a2))) >> 16));
    unsigned int v7 = (v6 ^ HIWORD(v6)) % v3;
    int v8 = *(unsigned __int16 *)(result + 18) + 1;
    while (v8 != v4)
    {
      result = *(void *)(v5 + 8LL * v7);
      if (!result || *(_DWORD *)result == (_DWORD)a2) {
        return result;
      }
      if (v7 + 1 < v3) {
        ++v7;
      }
      else {
        unsigned int v7 = 0;
      }
      if (v3 == ++v4) {
        goto LABEL_11;
      }
    }
  }

  return 0LL;
}

_DWORD *os_set_32_ptr_delete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 8);
  if (v3)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 12);
    if (!v4) {
LABEL_11:
    }
      os_set_32_ptr_find_cold_1(a1, a2, a3);
    int v5 = 0;
    uint64_t v6 = *(void *)a1;
    unsigned int v7 = 73244475 * ((73244475 * (a2 ^ WORD1(a2))) ^ ((73244475 * (a2 ^ WORD1(a2))) >> 16));
    unsigned int v8 = (v7 ^ HIWORD(v7)) % v4;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v5)
    {
      unsigned int v9 = *(_DWORD **)(v6 + 8LL * v8);
      if (!v9) {
        return v9;
      }
      if (v8 + 1 < v4) {
        unsigned int v10 = v8 + 1;
      }
      else {
        unsigned int v10 = 0;
      }
      if (*v9 == (_DWORD)a2)
      {
        uint64_t v12 = *(_DWORD **)(v6 + 8LL * v10);
        if (v12)
        {
          while (1)
          {
            unsigned int v13 = v10;
            unsigned int v14 = 73244475 * (*v12 ^ HIWORD(*v12));
            if (((73244475 * (v14 ^ HIWORD(v14))) ^ ((73244475 * (v14 ^ HIWORD(v14))) >> 16)) % v4 == v13) {
              break;
            }
            *(void *)(v6 + 8LL * v8) = v12;
            if (v13 + 1 < v4) {
              unsigned int v10 = v13 + 1;
            }
            else {
              unsigned int v10 = 0;
            }
            uint64_t v12 = *(_DWORD **)(v6 + 8LL * v10);
            unsigned int v8 = v13;
            if (!v12) {
              goto LABEL_23;
            }
          }

          unsigned int v13 = v8;
LABEL_23:
          uint64_t v15 = v13;
        }

        else
        {
          uint64_t v15 = v8;
        }

        *(void *)(v6 + 8 * v15) = 0LL;
        unsigned int v16 = v3 - 1;
        *(_DWORD *)(a1 + 8) = v16;
        if (v4 >= 0x40 && v16 < v4 >> 3) {
          _os_set_32_ptr_rehash(a1, 0xFFFFFFFFLL, a3);
        }
        return v9;
      }

      ++v5;
      unsigned int v8 = v10;
      if (v4 == v5) {
        goto LABEL_11;
      }
    }
  }

  return 0LL;
}

void os_set_32_ptr_clear(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v13[0] = MEMORY[0x1895FED80];
    v13[1] = 0x40000000LL;
    unsigned int v14 = __os_set_32_ptr_clear_block_invoke;
    uint64_t v15 = &unk_18A313A80;
    uint64_t v16 = a2;
    int v3 = *(void **)a1;
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000LL;
    int v5 = calloc(0x20uLL, 8uLL);
    if (!v5) {
      os_set_32_ptr_init_cold_1(0LL, v6, v7);
    }
    *(void *)a1 = v5;
    *(_WORD *)(a1 + 16) = 5;
    if ((_DWORD)v4)
    {
      unsigned int v8 = v3;
      do
      {
        if (*v8) {
          ((void (*)(void *, void, void))v14)(v13, *v8, *v8);
        }
        ++v8;
        --v4;
      }

      while (v4);
    }

    free(v3);
  }

  else
  {
    unsigned int v9 = *(void **)a1;
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000LL;
    unsigned int v10 = calloc(0x20uLL, 8uLL);
    if (!v10) {
      os_set_32_ptr_init_cold_1(0LL, v11, v12);
    }
    *(void *)a1 = v10;
    *(_WORD *)(a1 + 16) = 5;
    free(v9);
  }

uint64_t __os_set_32_ptr_clear_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t os_set_32_ptr_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_set_32_ptr_foreach(uint64_t result, uint64_t a2)
{
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  unsigned int v8 = __os_set_32_ptr_foreach_block_invoke;
  unsigned int v9 = &unk_18A313AA8;
  uint64_t v10 = a2;
  unint64_t v2 = *(unsigned int *)(result + 12);
  if ((_DWORD)v2)
  {
    uint64_t v3 = result;
    unint64_t v4 = 0LL;
    uint64_t v5 = *(void *)result;
    do
    {
      uint64_t v6 = *(void *)(v5 + 8 * v4);
      if (v6)
      {
        result = ((uint64_t (*)(void *, uint64_t, void))v8)(v7, v6, *(void *)(v5 + 8 * v4));
        if (!(_DWORD)result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v3 + 12);
      }

      ++v4;
    }

    while (v4 < v2);
  }

  return result;
}

uint64_t __os_set_32_ptr_foreach_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void *os_set_64_ptr_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unsigned int v4 = *(_DWORD *)(a2 + 8);
    if (v4 <= 0x20) {
      unsigned int v4 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 18) = 0;
    if (v4 == -1) {
      os_set_64_ptr_init_cold_2(a1, a2, a3);
    }
  }

  else
  {
    *(void *)(a1 + 8) = 0x2000000000LL;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v4 = 32;
  }

  result = calloc(v4, 8uLL);
  if (!result) {
    os_set_64_ptr_init_cold_1(0LL, v6, v7);
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_set_64_ptr_destroy(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 12) = 0;
}

uint64_t os_set_64_ptr_insert(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (!a2) {
    os_set_64_ptr_insert_cold_1(a1, 0LL, a3);
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_set_64_ptr_rehash(a1, 1LL, a3);
  }
  return _os_set_64_ptr_insert_no_rehash(a1, a2, (uint64_t)a2);
}

uint64_t os_set_64_ptr_find(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 8))
  {
    unsigned int v3 = *(_DWORD *)(result + 12);
    if (!v3) {
LABEL_11:
    }
      os_set_64_ptr_find_cold_1(result, a2, a3);
    int v4 = 0;
    uint64_t v5 = *(void *)result;
    unsigned int v6 = 73244475 * ((73244475 * (a2 ^ WORD1(a2))) ^ ((73244475 * (a2 ^ WORD1(a2))) >> 16));
    unsigned int v7 = (v6 ^ HIWORD(v6)) % v3;
    int v8 = *(unsigned __int16 *)(result + 18) + 1;
    while (v8 != v4)
    {
      result = *(void *)(v5 + 8LL * v7);
      if (!result || *(void *)result == a2) {
        return result;
      }
      if (v7 + 1 < v3) {
        ++v7;
      }
      else {
        unsigned int v7 = 0;
      }
      if (v3 == ++v4) {
        goto LABEL_11;
      }
    }
  }

  return 0LL;
}

void *os_set_64_ptr_delete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 8);
  if (v3)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 12);
    if (!v4) {
LABEL_11:
    }
      os_set_64_ptr_find_cold_1(a1, a2, a3);
    int v5 = 0;
    uint64_t v6 = *(void *)a1;
    unsigned int v7 = 73244475 * ((73244475 * (a2 ^ WORD1(a2))) ^ ((73244475 * (a2 ^ WORD1(a2))) >> 16));
    unsigned int v8 = (v7 ^ HIWORD(v7)) % v4;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v5)
    {
      unsigned int v9 = *(void **)(v6 + 8LL * v8);
      if (!v9) {
        return v9;
      }
      if (v8 + 1 < v4) {
        unsigned int v10 = v8 + 1;
      }
      else {
        unsigned int v10 = 0;
      }
      if (*v9 == a2)
      {
        uint64_t v12 = *(_DWORD **)(v6 + 8LL * v10);
        if (v12)
        {
          while (1)
          {
            unsigned int v13 = v10;
            unsigned int v14 = 73244475 * (*v12 ^ HIWORD(*v12));
            if (((73244475 * (v14 ^ HIWORD(v14))) ^ ((73244475 * (v14 ^ HIWORD(v14))) >> 16)) % v4 == v13) {
              break;
            }
            *(void *)(v6 + 8LL * v8) = v12;
            if (v13 + 1 < v4) {
              unsigned int v10 = v13 + 1;
            }
            else {
              unsigned int v10 = 0;
            }
            uint64_t v12 = *(_DWORD **)(v6 + 8LL * v10);
            unsigned int v8 = v13;
            if (!v12) {
              goto LABEL_23;
            }
          }

          unsigned int v13 = v8;
LABEL_23:
          uint64_t v15 = v13;
        }

        else
        {
          uint64_t v15 = v8;
        }

        *(void *)(v6 + 8 * v15) = 0LL;
        unsigned int v16 = v3 - 1;
        *(_DWORD *)(a1 + 8) = v16;
        if (v4 >= 0x40 && v16 < v4 >> 3) {
          _os_set_64_ptr_rehash(a1, 0xFFFFFFFFLL, a3);
        }
        return v9;
      }

      ++v5;
      unsigned int v8 = v10;
      if (v4 == v5) {
        goto LABEL_11;
      }
    }
  }

  return 0LL;
}

void os_set_64_ptr_clear(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v13[0] = MEMORY[0x1895FED80];
    v13[1] = 0x40000000LL;
    unsigned int v14 = __os_set_64_ptr_clear_block_invoke;
    uint64_t v15 = &unk_18A313AD0;
    uint64_t v16 = a2;
    int v3 = *(void **)a1;
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000LL;
    int v5 = calloc(0x20uLL, 8uLL);
    if (!v5) {
      os_set_64_ptr_init_cold_1(0LL, v6, v7);
    }
    *(void *)a1 = v5;
    *(_WORD *)(a1 + 16) = 5;
    if ((_DWORD)v4)
    {
      unsigned int v8 = v3;
      do
      {
        if (*v8) {
          ((void (*)(void *, void, void))v14)(v13, *v8, *v8);
        }
        ++v8;
        --v4;
      }

      while (v4);
    }

    free(v3);
  }

  else
  {
    unsigned int v9 = *(void **)a1;
    *(_WORD *)(a1 + 18) = 0;
    *(void *)(a1 + 8) = 0x2000000000LL;
    unsigned int v10 = calloc(0x20uLL, 8uLL);
    if (!v10) {
      os_set_64_ptr_init_cold_1(0LL, v11, v12);
    }
    *(void *)a1 = v10;
    *(_WORD *)(a1 + 16) = 5;
    free(v9);
  }

uint64_t __os_set_64_ptr_clear_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t os_set_64_ptr_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_set_64_ptr_foreach(uint64_t result, uint64_t a2)
{
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  unsigned int v8 = __os_set_64_ptr_foreach_block_invoke;
  unsigned int v9 = &unk_18A313AF8;
  uint64_t v10 = a2;
  unint64_t v2 = *(unsigned int *)(result + 12);
  if ((_DWORD)v2)
  {
    uint64_t v3 = result;
    unint64_t v4 = 0LL;
    uint64_t v5 = *(void *)result;
    do
    {
      uint64_t v6 = *(void *)(v5 + 8 * v4);
      if (v6)
      {
        result = ((uint64_t (*)(void *, uint64_t, void))v8)(v7, v6, *(void *)(v5 + 8 * v4));
        if (!(_DWORD)result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v3 + 12);
      }

      ++v4;
    }

    while (v4 < v2);
  }

  return result;
}

uint64_t __os_set_64_ptr_foreach_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void _os_set_str_ptr_rehash(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 12);
  if ((int)a2 < 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((a2 & 0x80000000) != 0)
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 16);
      if (v7 >= 6)
      {
        LOWORD(v7) = v7 - 1;
        *(_WORD *)(a1 + 16) = v7;
      }

      int v8 = 1 << v7;
      int v9 = v8 - 1;
      unsigned int v10 = v8 - ((v8 - 1) & (v4 >> 1));
      unsigned int v6 = v10 + (v4 >> 1);
      *(_DWORD *)(a1 + 12) = v6;
    }
  }

  else
  {
    __int16 v5 = *(_WORD *)(a1 + 16);
    unsigned int v6 = (1 << v5) + v4;
    *(_DWORD *)(a1 + 12) = v6;
    if (v6 == 8 << v5) {
      *(_WORD *)(a1 + 16) = v5 + 1;
    }
  }

  uint64_t v11 = *(uint64_t **)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v6 == -1) {
    os_set_str_ptr_init_cold_2(a1, a2, a3);
  }
  uint64_t v12 = calloc(v6, 8uLL);
  if (!v12) {
    os_set_str_ptr_init_cold_1(0LL, v13, v14);
  }
  *(void *)a1 = v12;
  if ((_DWORD)v4)
  {
    uint64_t v15 = v11;
    do
    {
      if (*v15) {
        _os_set_str_ptr_insert_no_rehash(a1, (void *)*v15, *v15);
      }
      ++v15;
      --v4;
    }

    while (v4);
  }

  free(v11);
}

uint64_t _os_set_str_ptr_insert_no_rehash(uint64_t result, void *a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(result + 12);
  unsigned int v4 = *(unsigned __int8 *)*a2;
  if (*(_BYTE *)*a2)
  {
    unsigned int v5 = 0;
    unsigned int v6 = (unsigned __int8 *)(*a2 + 1LL);
    do
    {
      unsigned int v5 = (1025 * (v5 + v4)) ^ ((1025 * (v5 + v4)) >> 6);
      unsigned int v7 = *v6++;
      unsigned int v4 = v7;
    }

    while (v7);
    unsigned int v4 = 9 * v5;
  }

  if (!v3) {
LABEL_27:
  }
    _os_set_str_ptr_insert_no_rehash_cold_1(result, (uint64_t)a2, a3);
  unsigned int v8 = 0;
  uint64_t v9 = *(void *)result;
  unsigned int v10 = 32769 * (v4 ^ (v4 >> 11)) % v3;
  int v11 = *(_DWORD *)(result + 12);
  while (1)
  {
    uint64_t v12 = *(void **)(v9 + 8LL * v10);
    if (!v12) {
      break;
    }
    if (!v8) {
      goto LABEL_22;
    }
    int v13 = *(unsigned __int8 *)*v12;
    if (*(_BYTE *)*v12)
    {
      unsigned int v14 = 0;
      uint64_t v15 = (unsigned __int8 *)(*v12 + 1LL);
      do
      {
        unsigned int v14 = (1025 * (v14 + v13)) ^ ((1025 * (v14 + v13)) >> 6);
        int v16 = *v15++;
        int v13 = v16;
      }

      while (v16);
      unsigned int v17 = 9 * v14;
    }

    else
    {
      unsigned int v17 = 0;
    }

    unsigned int v18 = 32769 * (v17 ^ (v17 >> 11)) % v3;
    BOOL v19 = v10 >= v18;
    unsigned int v20 = v10 - v18;
    unsigned int v21 = v19 ? 0 : v3;
    unsigned int v22 = v21 + v20;
    if (v8 > v22)
    {
      if (v8 > *(unsigned __int16 *)(result + 18))
      {
        if (v8 >= 0x10000) {
          _os_set_str_ptr_insert_no_rehash_cold_3(result, (uint64_t)a2, a3);
        }
        *(_WORD *)(result + 18) = v8;
      }

      *(void *)(v9 + 8LL * v10) = a3;
      unsigned int v8 = v22;
    }

    else
    {
LABEL_22:
      uint64_t v12 = (void *)a3;
    }

    ++v8;
    if (v10 + 1 < v3) {
      ++v10;
    }
    else {
      unsigned int v10 = 0;
    }
    a3 = (uint64_t)v12;
    if (!--v11) {
      goto LABEL_27;
    }
  }

  if (v8 > *(unsigned __int16 *)(result + 18))
  {
    if (v8 >= 0x10000) {
      _os_set_str_ptr_insert_no_rehash_cold_2(result, (uint64_t)a2, a3);
    }
    *(_WORD *)(result + 18) = v8;
  }

  *(void *)(v9 + 8LL * v10) = a3;
  ++*(_DWORD *)(result + 8);
  return result;
}

void _os_set_32_ptr_rehash(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 12);
  if ((int)a2 < 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((a2 & 0x80000000) != 0)
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 16);
      if (v7 >= 6)
      {
        LOWORD(v7) = v7 - 1;
        *(_WORD *)(a1 + 16) = v7;
      }

      int v8 = 1 << v7;
      int v9 = v8 - 1;
      unsigned int v10 = v8 - ((v8 - 1) & (v4 >> 1));
      unsigned int v6 = v10 + (v4 >> 1);
      *(_DWORD *)(a1 + 12) = v6;
    }
  }

  else
  {
    __int16 v5 = *(_WORD *)(a1 + 16);
    unsigned int v6 = (1 << v5) + v4;
    *(_DWORD *)(a1 + 12) = v6;
    if (v6 == 8 << v5) {
      *(_WORD *)(a1 + 16) = v5 + 1;
    }
  }

  int v11 = *(uint64_t **)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v6 == -1) {
    os_set_32_ptr_init_cold_2(a1, a2, a3);
  }
  uint64_t v12 = calloc(v6, 8uLL);
  if (!v12) {
    os_set_32_ptr_init_cold_1(0LL, v13, v14);
  }
  *(void *)a1 = v12;
  if ((_DWORD)v4)
  {
    uint64_t v15 = v11;
    do
    {
      if (*v15) {
        _os_set_32_ptr_insert_no_rehash(a1, (_DWORD *)*v15, *v15);
      }
      ++v15;
      --v4;
    }

    while (v4);
  }

  free(v11);
}

uint64_t _os_set_32_ptr_insert_no_rehash(uint64_t result, _DWORD *a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(result + 12);
  if (!v3) {
LABEL_18:
  }
    _os_set_32_ptr_insert_no_rehash_cold_1(result, (uint64_t)a2, a3);
  unsigned int v4 = 0;
  uint64_t v5 = *(void *)result;
  unsigned int v6 = 73244475 * (*a2 ^ HIWORD(*a2));
  unsigned int v7 = ((73244475 * (v6 ^ HIWORD(v6))) ^ ((73244475 * (v6 ^ HIWORD(v6))) >> 16)) % v3;
  int v8 = *(_DWORD *)(result + 12);
  while (1)
  {
    int v9 = *(_DWORD **)(v5 + 8LL * v7);
    if (!v9) {
      break;
    }
    if (v4
      && ((unsigned int v10 = 73244475 * (*v9 ^ HIWORD(*v9)),
           unsigned int v11 = ((73244475 * (v10 ^ HIWORD(v10))) ^ ((73244475 * (v10 ^ HIWORD(v10))) >> 16)) % v3,
           BOOL v12 = v7 >= v11,
           unsigned int v13 = v7 - v11,
           v12)
        ? (unsigned int v14 = 0)
        : (unsigned int v14 = v3),
          unsigned int v15 = v14 + v13,
          v4 > v15))
    {
      if (v4 > *(unsigned __int16 *)(result + 18))
      {
        if (v4 >= 0x10000) {
          _os_set_32_ptr_insert_no_rehash_cold_3(result, (uint64_t)a2, a3);
        }
        *(_WORD *)(result + 18) = v4;
      }

      *(void *)(v5 + 8LL * v7) = a3;
      unsigned int v4 = v15;
    }

    else
    {
      int v9 = (_DWORD *)a3;
    }

    ++v4;
    if (v7 + 1 < v3) {
      ++v7;
    }
    else {
      unsigned int v7 = 0;
    }
    a3 = (uint64_t)v9;
    if (!--v8) {
      goto LABEL_18;
    }
  }

  if (v4 > *(unsigned __int16 *)(result + 18))
  {
    if (v4 >= 0x10000) {
      _os_set_32_ptr_insert_no_rehash_cold_2(result, (uint64_t)a2, a3);
    }
    *(_WORD *)(result + 18) = v4;
  }

  *(void *)(v5 + 8LL * v7) = a3;
  ++*(_DWORD *)(result + 8);
  return result;
}

void _os_set_64_ptr_rehash(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 12);
  if ((int)a2 < 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((a2 & 0x80000000) != 0)
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 16);
      if (v7 >= 6)
      {
        LOWORD(v7) = v7 - 1;
        *(_WORD *)(a1 + 16) = v7;
      }

      int v8 = 1 << v7;
      int v9 = v8 - 1;
      unsigned int v10 = v8 - ((v8 - 1) & (v4 >> 1));
      unsigned int v6 = v10 + (v4 >> 1);
      *(_DWORD *)(a1 + 12) = v6;
    }
  }

  else
  {
    __int16 v5 = *(_WORD *)(a1 + 16);
    unsigned int v6 = (1 << v5) + v4;
    *(_DWORD *)(a1 + 12) = v6;
    if (v6 == 8 << v5) {
      *(_WORD *)(a1 + 16) = v5 + 1;
    }
  }

  unsigned int v11 = *(uint64_t **)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v6 == -1) {
    os_set_64_ptr_init_cold_2(a1, a2, a3);
  }
  BOOL v12 = calloc(v6, 8uLL);
  if (!v12) {
    os_set_64_ptr_init_cold_1(0LL, v13, v14);
  }
  *(void *)a1 = v12;
  if ((_DWORD)v4)
  {
    unsigned int v15 = v11;
    do
    {
      if (*v15) {
        _os_set_64_ptr_insert_no_rehash(a1, (_DWORD *)*v15, *v15);
      }
      ++v15;
      --v4;
    }

    while (v4);
  }

  free(v11);
}

uint64_t _os_set_64_ptr_insert_no_rehash(uint64_t result, _DWORD *a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(result + 12);
  if (!v3) {
LABEL_18:
  }
    _os_set_64_ptr_insert_no_rehash_cold_1(result, (uint64_t)a2, a3);
  unsigned int v4 = 0;
  uint64_t v5 = *(void *)result;
  unsigned int v6 = 73244475 * (*a2 ^ HIWORD(*a2));
  unsigned int v7 = ((73244475 * (v6 ^ HIWORD(v6))) ^ ((73244475 * (v6 ^ HIWORD(v6))) >> 16)) % v3;
  int v8 = *(_DWORD *)(result + 12);
  while (1)
  {
    int v9 = *(_DWORD **)(v5 + 8LL * v7);
    if (!v9) {
      break;
    }
    if (v4
      && ((unsigned int v10 = 73244475 * (*v9 ^ HIWORD(*v9)),
           unsigned int v11 = ((73244475 * (v10 ^ HIWORD(v10))) ^ ((73244475 * (v10 ^ HIWORD(v10))) >> 16)) % v3,
           BOOL v12 = v7 >= v11,
           unsigned int v13 = v7 - v11,
           v12)
        ? (unsigned int v14 = 0)
        : (unsigned int v14 = v3),
          unsigned int v15 = v14 + v13,
          v4 > v15))
    {
      if (v4 > *(unsigned __int16 *)(result + 18))
      {
        if (v4 >= 0x10000) {
          _os_set_64_ptr_insert_no_rehash_cold_3(result, (uint64_t)a2, a3);
        }
        *(_WORD *)(result + 18) = v4;
      }

      *(void *)(v5 + 8LL * v7) = a3;
      unsigned int v4 = v15;
    }

    else
    {
      int v9 = (_DWORD *)a3;
    }

    ++v4;
    if (v7 + 1 < v3) {
      ++v7;
    }
    else {
      unsigned int v7 = 0;
    }
    a3 = (uint64_t)v9;
    if (!--v8) {
      goto LABEL_18;
    }
  }

  if (v4 > *(unsigned __int16 *)(result + 18))
  {
    if (v4 >= 0x10000) {
      _os_set_64_ptr_insert_no_rehash_cold_2(result, (uint64_t)a2, a3);
    }
    *(_WORD *)(result + 18) = v4;
  }

  *(void *)(v5 + 8LL * v7) = a3;
  ++*(_DWORD *)(result + 8);
  return result;
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_2(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_3(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_4(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_5(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_6(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void *os_map_str_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unsigned int v4 = *(_DWORD *)(a2 + 8);
    if (v4 <= 0x20) {
      unsigned int v4 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 18) = 0;
    if (v4 == -1) {
      os_map_str_init_cold_2(a1, a2, a3);
    }
  }

  else
  {
    *(void *)(a1 + 8) = 0x2000000000LL;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v4 = 32;
  }

  result = calloc(v4, 0x10uLL);
  if (!result) {
    os_map_str_init_cold_1(0LL, v6, v7);
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_map_str_destroy(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 12) = 0;
}

uint64_t os_map_str_insert(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  if (!a3) {
    os_map_str_insert_cold_1(a1, (uint64_t)a2, 0LL);
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_map_str_rehash(a1, 1LL, a3);
  }
  return _os_map_str_insert_no_rehash(a1, a2, a3);
}

uint64_t os_map_str_find(uint64_t a1, char *__s1, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    int v5 = *__s1;
    if (*__s1)
    {
      unsigned int v6 = 0;
      uint64_t v7 = __s1 + 1;
      do
      {
        unsigned int v6 = (1025 * (v6 + v5)) ^ ((1025 * (v6 + v5)) >> 6);
        int v8 = *v7++;
        int v5 = v8;
      }

      while (v8);
      unsigned int v9 = 9 * v6;
      if (!(_DWORD)v4) {
LABEL_17:
      }
        os_map_str_find_cold_1(a1, (uint64_t)__s1, a3);
    }

    else
    {
      unsigned int v9 = 0;
      if (!(_DWORD)v4) {
        goto LABEL_17;
      }
    }

    int v10 = 0;
    uint64_t v11 = *(void *)a1;
    uint64_t v12 = *(void *)a1 + 8 * v4;
    unsigned int v13 = 32769 * (v9 ^ (v9 >> 11)) % v4;
    int v14 = *(unsigned __int16 *)(a1 + 18) + 1;
    while (v14 != v10)
    {
      uint64_t v15 = *(void *)(v12 + 8LL * v13);
      if (!v15) {
        return v15;
      }
      int v16 = *(char **)(v11 + 8LL * v13);
      if (v16 == __s1) {
        return v15;
      }
      a1 = strcmp(__s1, v16);
      if (!(_DWORD)a1) {
        return v15;
      }
      else {
        unsigned int v13 = 0;
      }
      if ((_DWORD)v4 == ++v10) {
        goto LABEL_17;
      }
    }
  }

  return 0LL;
}

uint64_t os_map_str_delete(uint64_t a1, char *__s1, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v4 = a1;
    uint64_t v5 = *(unsigned int *)(a1 + 12);
    int v6 = *__s1;
    int v28 = *(_DWORD *)(a1 + 8);
    unsigned int v7 = 0;
    if (*__s1)
    {
      int v8 = __s1 + 1;
      do
      {
        unsigned int v7 = (1025 * (v7 + v6)) ^ ((1025 * (v7 + v6)) >> 6);
        int v9 = *v8++;
        int v6 = v9;
      }

      while (v9);
      v7 *= 9;
    }

    if (!(_DWORD)v5) {
LABEL_16:
    }
      os_map_str_find_cold_1(a1, (uint64_t)__s1, a3);
    int v10 = 0;
    uint64_t v11 = *(void *)a1;
    uint64_t v12 = *(void *)a1 + 8 * v5;
    unsigned int v13 = 32769 * (v7 ^ (v7 >> 11)) % v5;
    int v14 = *(unsigned __int16 *)(a1 + 18) + 1;
    while (v14 != v10)
    {
      uint64_t v15 = *(void *)(v12 + 8LL * v13);
      if (!v15) {
        return v15;
      }
      uint64_t v16 = v13;
      unsigned int v17 = *(char **)(v11 + 8LL * v13);
      if (v17 == __s1 || (a1 = strcmp(__s1, v17), !(_DWORD)a1))
      {
        else {
          uint64_t v18 = 0LL;
        }
        uint64_t v19 = *(void *)(v12 + 8LL * v18);
        if (v19)
        {
          while (1)
          {
            unsigned int v20 = v18;
            unsigned int v21 = *(_BYTE **)(v11 + 8 * v18);
            int v22 = *v21;
            if (*v21)
            {
              unsigned int v23 = 0;
              unsigned int v24 = v21 + 1;
              do
              {
                unsigned int v23 = (1025 * (v23 + v22)) ^ ((1025 * (v23 + v22)) >> 6);
                int v25 = *v24++;
                int v22 = v25;
              }

              while (v25);
              unsigned int v26 = 9 * v23;
            }

            else
            {
              unsigned int v26 = 0;
            }

            *(void *)(v11 + 8LL * v13) = v21;
            *(void *)(v12 + 8LL * v13) = v19;
            else {
              uint64_t v18 = 0LL;
            }
            uint64_t v19 = *(void *)(v12 + 8LL * v18);
            unsigned int v13 = v20;
            if (!v19) {
              goto LABEL_34;
            }
          }

          unsigned int v20 = v13;
LABEL_34:
          uint64_t v16 = v20;
        }

        *(void *)(v12 + 8 * v16) = 0LL;
        *(_DWORD *)(v4 + 8) = v28 - 1;
        return v15;
      }

      else {
        unsigned int v13 = 0;
      }
      if ((_DWORD)v5 == ++v10) {
        goto LABEL_16;
      }
    }
  }

  return 0LL;
}

void os_map_str_clear(char **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *((unsigned int *)a1 + 3);
  *((_WORD *)a1 + 9) = 0;
  a1[1] = (char *)0x2000000000LL;
  int v6 = (char *)calloc(0x20uLL, 0x10uLL);
  if (!v6) {
    os_map_str_init_cold_1(0LL, v7, v8);
  }
  *a1 = v6;
  *((_WORD *)a1 + 8) = 5;
  if (a2 && (_DWORD)v5)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 8 * v5;
    do
    {
      if (*(void *)&v4[v10 + v9]) {
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&v4[v9]);
      }
      v9 += 8LL;
    }

    while (v10 != v9);
  }

  free(v4);
}

uint64_t os_map_str_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_map_str_foreach(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 12);
  if ((_DWORD)v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)result;
    uint64_t v7 = *(void *)result + 8 * v2;
    do
    {
      if (*(void *)(v7 + 8 * v5))
      {
        result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(v6 + 8 * v5));
        if (!(_DWORD)result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v4 + 12);
      }

      ++v5;
    }

    while (v5 < v2);
  }

  return result;
}

char *os_map_str_entry(uint64_t a1, char *__s1, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    int v5 = *__s1;
    if (*__s1)
    {
      unsigned int v6 = 0;
      uint64_t v7 = __s1 + 1;
      do
      {
        unsigned int v6 = (1025 * (v6 + v5)) ^ ((1025 * (v6 + v5)) >> 6);
        int v8 = *v7++;
        int v5 = v8;
      }

      while (v8);
      unsigned int v9 = 9 * v6;
      if (!(_DWORD)v4) {
LABEL_17:
      }
        os_map_str_find_cold_1(a1, (uint64_t)__s1, a3);
    }

    else
    {
      unsigned int v9 = 0;
      if (!(_DWORD)v4) {
        goto LABEL_17;
      }
    }

    int v10 = 0;
    uint64_t v11 = *(void *)a1;
    uint64_t v12 = *(void *)a1 + 8 * v4;
    unsigned int v13 = 32769 * (v9 ^ (v9 >> 11)) % v4;
    int v14 = *(unsigned __int16 *)(a1 + 18) + 1;
    while (v14 != v10 && *(void *)(v12 + 8LL * v13))
    {
      uint64_t v15 = *(char **)(v11 + 8LL * v13);
      if (v15 == __s1) {
        return __s1;
      }
      a1 = strcmp(__s1, *(const char **)(v11 + 8LL * v13));
      if (!(_DWORD)a1) {
        return v15;
      }
      else {
        unsigned int v13 = 0;
      }
      if ((_DWORD)v4 == ++v10) {
        goto LABEL_17;
      }
    }
  }

  return 0LL;
}

void *os_map_32_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unsigned int v4 = *(_DWORD *)(a2 + 8);
    if (v4 <= 0x20) {
      unsigned int v4 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 18) = 0;
    if (v4 == -1) {
      os_map_32_init_cold_2(a1, a2, a3);
    }
  }

  else
  {
    *(void *)(a1 + 8) = 0x2000000000LL;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v4 = 32;
  }

  result = calloc(v4, 0xCuLL);
  if (!result) {
    os_map_32_init_cold_1(0LL, v6, v7);
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_map_32_destroy(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 12) = 0;
}

uint64_t os_map_32_insert(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    os_map_32_insert_cold_1(a1, a2, 0LL);
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_map_32_rehash(a1, 1LL, a3);
  }
  return _os_map_32_insert_no_rehash(a1, a2, a3);
}

uint64_t os_map_32_find(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 8))
  {
    uint64_t v3 = *(unsigned int *)(result + 12);
    if (!(_DWORD)v3) {
LABEL_11:
    }
      os_map_32_find_cold_1(result, a2, a3);
    int v4 = 0;
    uint64_t v5 = *(void *)result;
    uint64_t v6 = *(void *)result + 4 * v3;
    unsigned int v7 = 73244475 * ((73244475 * (a2 ^ WORD1(a2))) ^ ((73244475 * (a2 ^ WORD1(a2))) >> 16));
    unsigned int v8 = (v7 ^ HIWORD(v7)) % v3;
    int v9 = *(unsigned __int16 *)(result + 18) + 1;
    while (v9 != v4)
    {
      result = *(void *)(v6 + 8LL * v8);
      if (!result || *(_DWORD *)(v5 + 4LL * v8) == (_DWORD)a2) {
        return result;
      }
      else {
        unsigned int v8 = 0;
      }
      if ((_DWORD)v3 == ++v4) {
        goto LABEL_11;
      }
    }
  }

  return 0LL;
}

uint64_t os_map_32_delete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v3 = *(unsigned int *)(a1 + 12);
    if (!(_DWORD)v3) {
LABEL_11:
    }
      os_map_32_find_cold_1(a1, a2, a3);
    int v4 = 0;
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = *(void *)a1 + 4 * v3;
    unsigned int v7 = 73244475 * ((73244475 * (a2 ^ WORD1(a2))) ^ ((73244475 * (a2 ^ WORD1(a2))) >> 16));
    unsigned int v8 = (v7 ^ HIWORD(v7)) % v3;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v4)
    {
      uint64_t v9 = *(void *)(v6 + 8LL * v8);
      if (!v9) {
        return v9;
      }
      else {
        uint64_t v10 = 0LL;
      }
      if (*(_DWORD *)(v5 + 4LL * v8) == (_DWORD)a2)
      {
        uint64_t v12 = *(void *)(v6 + 8LL * v10);
        if (v12)
        {
          while (1)
          {
            unsigned int v13 = v10;
            unsigned int v14 = *(_DWORD *)(v5 + 4 * v10);
            unsigned int v15 = 73244475 * ((73244475 * (v14 ^ HIWORD(v14))) ^ ((73244475 * (v14 ^ HIWORD(v14))) >> 16));
            if ((v15 ^ HIWORD(v15)) % *(_DWORD *)(a1 + 12) == v13) {
              break;
            }
            *(_DWORD *)(v5 + 4LL * v8) = v14;
            *(void *)(v6 + 8LL * v8) = v12;
            else {
              uint64_t v10 = 0LL;
            }
            uint64_t v12 = *(void *)(v6 + 8LL * v10);
            unsigned int v8 = v13;
            if (!v12)
            {
              LODWORD(v3) = *(_DWORD *)(a1 + 12);
              unsigned int v8 = v13;
              goto LABEL_22;
            }
          }

          LODWORD(v3) = *(_DWORD *)(a1 + 12);
        }

LABEL_22:
        *(void *)(v6 + 8LL * v8) = 0LL;
        unsigned int v16 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v16;
        return v9;
      }

      ++v4;
      unsigned int v8 = v10;
      if ((_DWORD)v3 == v4) {
        goto LABEL_11;
      }
    }
  }

  return 0LL;
}

void os_map_32_clear(char **a1, uint64_t a2)
{
  int v4 = *a1;
  uint64_t v5 = *((unsigned int *)a1 + 3);
  *((_WORD *)a1 + 9) = 0;
  a1[1] = (char *)0x2000000000LL;
  uint64_t v6 = (char *)calloc(0x20uLL, 0xCuLL);
  if (!v6) {
    os_map_32_init_cold_1(0LL, v7, v8);
  }
  *a1 = v6;
  *((_WORD *)a1 + 8) = 5;
  if (a2 && (_DWORD)v5)
  {
    uint64_t v9 = &v4[4 * v5];
    uint64_t v10 = (unsigned int *)v4;
    do
    {
      if (*(void *)v9) {
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *v10);
      }
      ++v10;
      v9 += 8;
      --v5;
    }

    while (v5);
  }

  free(v4);
}

uint64_t os_map_32_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_map_32_foreach(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 12);
  if ((_DWORD)v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)result;
    uint64_t v7 = *(void *)result + 4 * v2;
    do
    {
      if (*(void *)(v7 + 8 * v5))
      {
        result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(unsigned int *)(v6 + 4 * v5));
        if (!(_DWORD)result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v4 + 12);
      }

      ++v5;
    }

    while (v5 < v2);
  }

  return result;
}

void *os_map_64_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unsigned int v4 = *(_DWORD *)(a2 + 8);
    if (v4 <= 0x20) {
      unsigned int v4 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 18) = 0;
    if (v4 == -1) {
      os_map_64_init_cold_2(a1, a2, a3);
    }
  }

  else
  {
    *(void *)(a1 + 8) = 0x2000000000LL;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v4 = 32;
  }

  result = calloc(v4, 0x10uLL);
  if (!result) {
    os_map_64_init_cold_1(0LL, v6, v7);
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_map_64_destroy(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 12) = 0;
}

uint64_t os_map_64_insert(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    os_map_64_insert_cold_1(a1, a2, 0LL);
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_map_64_rehash(a1, 1LL, a3);
  }
  return _os_map_64_insert_no_rehash(a1, a2, a3);
}

uint64_t os_map_64_find(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 8))
  {
    uint64_t v3 = *(unsigned int *)(result + 12);
    if (!(_DWORD)v3) {
LABEL_11:
    }
      os_map_64_find_cold_1(result, a2, a3);
    int v4 = 0;
    uint64_t v5 = *(void *)result;
    unsigned int v6 = 73244475 * (HIDWORD(a2) ^ a2 ^ ((HIDWORD(a2) ^ a2) >> 16));
    unsigned int v7 = ((73244475 * (v6 ^ HIWORD(v6))) ^ ((73244475 * (v6 ^ HIWORD(v6))) >> 16)) % v3;
    uint64_t v8 = *(void *)result + 8 * v3;
    int v9 = *(unsigned __int16 *)(result + 18) + 1;
    while (v9 != v4)
    {
      result = *(void *)(v8 + 8LL * v7);
      if (!result || *(void *)(v5 + 8LL * v7) == a2) {
        return result;
      }
      else {
        unsigned int v7 = 0;
      }
      if ((_DWORD)v3 == ++v4) {
        goto LABEL_11;
      }
    }
  }

  return 0LL;
}

uint64_t os_map_64_delete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    if (!(_DWORD)v4) {
LABEL_11:
    }
      os_map_64_find_cold_1(a1, a2, a3);
    int v5 = 0;
    uint64_t v6 = *(void *)a1;
    uint64_t v7 = *(void *)a1 + 8 * v4;
    unsigned int v8 = 73244475 * (HIDWORD(a2) ^ a2 ^ ((HIDWORD(a2) ^ a2) >> 16));
    unsigned int v9 = ((73244475 * (v8 ^ HIWORD(v8))) ^ ((73244475 * (v8 ^ HIWORD(v8))) >> 16)) % v4;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v5)
    {
      uint64_t v10 = *(void *)(v7 + 8LL * v9);
      if (!v10) {
        return v10;
      }
      uint64_t v11 = v9;
      a3 = *(void *)(v6 + 8LL * v9);
      else {
        uint64_t v12 = 0LL;
      }
      if (a3 == a2)
      {
        uint64_t v14 = *(void *)(v7 + 8LL * v12);
        if (v14)
        {
          while (1)
          {
            unsigned int v15 = v12;
            uint64_t v16 = *(void *)(v6 + 8 * v12);
            unsigned int v17 = 73244475 * (HIDWORD(v16) ^ v16 ^ ((HIDWORD(v16) ^ v16) >> 16));
            *(void *)(v6 + 8LL * v9) = v16;
            *(void *)(v7 + 8LL * v9) = v14;
            else {
              uint64_t v12 = 0LL;
            }
            uint64_t v14 = *(void *)(v7 + 8LL * v12);
            unsigned int v9 = v15;
            if (!v14) {
              goto LABEL_22;
            }
          }

          unsigned int v15 = v9;
LABEL_22:
          uint64_t v11 = v15;
        }

        *(void *)(v7 + 8 * v11) = 0LL;
        unsigned int v18 = v3 - 1;
        *(_DWORD *)(a1 + 8) = v18;
        return v10;
      }

      ++v5;
      unsigned int v9 = v12;
      if ((_DWORD)v4 == v5) {
        goto LABEL_11;
      }
    }
  }

  return 0LL;
}

void os_map_64_clear(char **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *((unsigned int *)a1 + 3);
  *((_WORD *)a1 + 9) = 0;
  a1[1] = (char *)0x2000000000LL;
  uint64_t v6 = (char *)calloc(0x20uLL, 0x10uLL);
  if (!v6) {
    os_map_64_init_cold_1(0LL, v7, v8);
  }
  *a1 = v6;
  *((_WORD *)a1 + 8) = 5;
  if (a2 && (_DWORD)v5)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 8 * v5;
    do
    {
      if (*(void *)&v4[v10 + v9]) {
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&v4[v9]);
      }
      v9 += 8LL;
    }

    while (v10 != v9);
  }

  free(v4);
}

uint64_t os_map_64_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_map_64_foreach(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 12);
  if ((_DWORD)v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)result;
    uint64_t v7 = *(void *)result + 8 * v2;
    do
    {
      if (*(void *)(v7 + 8 * v5))
      {
        result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(v6 + 8 * v5));
        if (!(_DWORD)result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v4 + 12);
      }

      ++v5;
    }

    while (v5 < v2);
  }

  return result;
}

void *os_map_128_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unsigned int v4 = *(_DWORD *)(a2 + 8);
    if (v4 <= 0x20) {
      unsigned int v4 = 32;
    }
    *(_DWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 18) = 0;
    if (v4 == -1) {
      os_map_128_init_cold_2(a1, a2, a3);
    }
  }

  else
  {
    *(void *)(a1 + 8) = 0x2000000000LL;
    *(_WORD *)(a1 + 18) = 0;
    unsigned int v4 = 32;
  }

  result = calloc(v4, 0x18uLL);
  if (!result) {
    os_map_128_init_cold_1(0LL, v6, v7);
  }
  *(void *)a1 = result;
  *(_WORD *)(a1 + 16) = 5;
  return result;
}

void os_map_128_destroy(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 12) = 0;
}

uint64_t os_map_128_insert(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    os_map_128_insert_cold_1(a1, a2, a3);
  }
  if (*(_DWORD *)(a1 + 8) >= 4 * *(_DWORD *)(a1 + 12) / 5u) {
    _os_map_128_rehash(a1, 1LL, a3);
  }
  return _os_map_128_insert_no_rehash(a1, a2, a3, a4);
}

uint64_t os_map_128_find(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 8))
  {
    uint64_t v3 = *(unsigned int *)(result + 12);
    if (!(_DWORD)v3) {
LABEL_14:
    }
      os_map_128_find_cold_1(result, a2, a3);
    int v4 = 0;
    uint64_t v5 = *(void *)result;
    unsigned int v6 = 73244475
       * (((a2 ^ (unint64_t)a3) >> 32) ^ a2 ^ a3 ^ ((((a2 ^ (unint64_t)a3) >> 32) ^ a2 ^ a3) >> 16));
    unsigned int v7 = ((73244475 * (v6 ^ HIWORD(v6))) ^ ((73244475 * (v6 ^ HIWORD(v6))) >> 16)) % v3;
    uint64_t v8 = *(void *)result + 16 * v3;
    int v9 = *(unsigned __int16 *)(result + 18) + 1;
    while (v9 != v4)
    {
      result = *(void *)(v8 + 8LL * v7);
      if (!result) {
        return result;
      }
      uint64_t v10 = (uint64_t *)(v5 + 16LL * v7);
      uint64_t v12 = *v10;
      uint64_t v11 = v10[1];
      if (a2 == v12 && a3 == v11) {
        return result;
      }
      else {
        unsigned int v7 = 0;
      }
      if ((_DWORD)v3 == ++v4) {
        goto LABEL_14;
      }
    }
  }

  return 0LL;
}

uint64_t os_map_128_delete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 8))
  {
    uint64_t v3 = *(unsigned int *)(a1 + 12);
    if (!(_DWORD)v3) {
LABEL_14:
    }
      os_map_128_find_cold_1(a1, a2, a3);
    int v4 = 0;
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = *(void *)a1 + 16 * v3;
    unsigned int v7 = 73244475
       * (((a2 ^ (unint64_t)a3) >> 32) ^ a2 ^ a3 ^ ((((a2 ^ (unint64_t)a3) >> 32) ^ a2 ^ a3) >> 16));
    unsigned int v8 = ((73244475 * (v7 ^ HIWORD(v7))) ^ ((73244475 * (v7 ^ HIWORD(v7))) >> 16)) % v3;
    while (*(unsigned __int16 *)(a1 + 18) + 1 != v4)
    {
      uint64_t v9 = *(void *)(v6 + 8LL * v8);
      if (!v9) {
        return v9;
      }
      uint64_t v10 = (uint64_t *)(v5 + 16LL * v8);
      uint64_t v11 = *v10;
      uint64_t v12 = v10[1];
      else {
        uint64_t v13 = 0LL;
      }
      if (a2 == v11 && a3 == v12)
      {
        uint64_t v16 = *(void *)(v6 + 8LL * v13);
        if (v16)
        {
          while (1)
          {
            unsigned int v17 = v13;
            int64x2_t v18 = *(int64x2_t *)(v5 + 16 * v13);
            unint64_t v19 = veorq_s8((int8x16_t)vdupq_laneq_s64(v18, 1), (int8x16_t)v18).u64[0];
            unsigned int v20 = 73244475 * (HIDWORD(v19) ^ v19 ^ ((HIDWORD(v19) ^ v19) >> 16));
            if (((73244475 * (v20 ^ HIWORD(v20))) ^ ((73244475 * (v20 ^ HIWORD(v20))) >> 16)) % *(_DWORD *)(a1 + 12) == v17) {
              break;
            }
            *(int64x2_t *)(v5 + 16LL * v8) = v18;
            *(void *)(v6 + 8LL * v8) = v16;
            else {
              uint64_t v13 = 0LL;
            }
            uint64_t v16 = *(void *)(v6 + 8LL * v13);
            unsigned int v8 = v17;
            if (!v16)
            {
              LODWORD(v3) = *(_DWORD *)(a1 + 12);
              unsigned int v8 = v17;
              goto LABEL_25;
            }
          }

          LODWORD(v3) = *(_DWORD *)(a1 + 12);
        }

LABEL_25:
        *(void *)(v6 + 8LL * v8) = 0LL;
        unsigned int v21 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v21;
        return v9;
      }

      ++v4;
      unsigned int v8 = v13;
      if ((_DWORD)v3 == v4) {
        goto LABEL_14;
      }
    }
  }

  return 0LL;
}

void os_map_128_clear(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  uint64_t v5 = *(unsigned int *)(a1 + 12);
  *(_WORD *)(a1 + 18) = 0;
  *(void *)(a1 + 8) = 0x2000000000LL;
  uint64_t v6 = calloc(0x20uLL, 0x18uLL);
  if (!v6) {
    os_map_128_init_cold_1(0LL, v7, v8);
  }
  *(void *)a1 = v6;
  *(_WORD *)(a1 + 16) = 5;
  if (a2 && (_DWORD)v5)
  {
    uint64_t v9 = &v4[2 * v5];
    uint64_t v10 = v4 + 1;
    do
    {
      if (*v9) {
        (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, *(v10 - 1), *v10);
      }
      v10 += 2;
      ++v9;
      --v5;
    }

    while (v5);
  }

  free(v4);
}

uint64_t os_map_128_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t os_map_128_foreach(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 12);
  if ((_DWORD)v2)
  {
    uint64_t v4 = result;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)result + 16 * v2;
    uint64_t v7 = (void *)(*(void *)result + 8LL);
    do
    {
      if (*(void *)(v6 + 8 * v5))
      {
        result = (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(v7 - 1), *v7);
        if (!(_DWORD)result) {
          return result;
        }
        unint64_t v2 = *(unsigned int *)(v4 + 12);
      }

      ++v5;
      v7 += 2;
    }

    while (v5 < v2);
  }

  return result;
}

void _os_map_str_rehash(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 12);
  if ((int)a2 < 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((a2 & 0x80000000) != 0)
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 16);
      if (v7 >= 6)
      {
        LOWORD(v7) = v7 - 1;
        *(_WORD *)(a1 + 16) = v7;
      }

      int v8 = 1 << v7;
      int v9 = v8 - 1;
      unsigned int v10 = v8 - ((v8 - 1) & (v4 >> 1));
      unsigned int v6 = v10 + (v4 >> 1);
      *(_DWORD *)(a1 + 12) = v6;
    }
  }

  else
  {
    __int16 v5 = *(_WORD *)(a1 + 16);
    unsigned int v6 = (1 << v5) + v4;
    *(_DWORD *)(a1 + 12) = v6;
    if (v6 == 8 << v5) {
      *(_WORD *)(a1 + 16) = v5 + 1;
    }
  }

  uint64_t v11 = *(char **)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v6 == -1) {
    os_map_str_init_cold_2(a1, a2, a3);
  }
  uint64_t v12 = calloc(v6, 0x10uLL);
  if (!v12) {
    os_map_str_init_cold_1(0LL, v13, v14);
  }
  *(void *)a1 = v12;
  if ((_DWORD)v4)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = 8 * v4;
    do
    {
      uint64_t v17 = *(void *)&v11[v16 + v15];
      if (v17) {
        _os_map_str_insert_no_rehash(a1, *(_BYTE **)&v11[v15], v17);
      }
      v15 += 8LL;
    }

    while (v16 != v15);
  }

  free(v11);
}

uint64_t _os_map_str_insert_no_rehash(uint64_t result, _BYTE *a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned int *)(result + 12);
  int v4 = *a2;
  if (*a2)
  {
    unsigned int v5 = 0;
    unsigned int v6 = a2 + 1;
    do
    {
      unsigned int v5 = (1025 * (v5 + v4)) ^ ((1025 * (v5 + v4)) >> 6);
      int v7 = *v6++;
      int v4 = v7;
    }

    while (v7);
    unsigned int v8 = 9 * v5;
    if (!(_DWORD)v3) {
LABEL_27:
    }
      _os_map_str_insert_no_rehash_cold_1(result, (uint64_t)a2, a3);
  }

  else
  {
    unsigned int v8 = 0;
    if (!(_DWORD)v3) {
      goto LABEL_27;
    }
  }

  unsigned int v9 = 0;
  uint64_t v10 = *(void *)result;
  uint64_t v11 = *(void *)result + 8 * v3;
  unsigned int v12 = 32769 * (v8 ^ (v8 >> 11)) % v3;
  int v13 = *(_DWORD *)(result + 12);
  while (1)
  {
    uint64_t v14 = *(void *)(v11 + 8LL * v12);
    if (!v14) {
      break;
    }
    if (v9)
    {
      uint64_t v15 = *(_BYTE **)(v10 + 8LL * v12);
      int v16 = *v15;
      if (*v15)
      {
        unsigned int v17 = 0;
        int64x2_t v18 = v15 + 1;
        do
        {
          unsigned int v17 = (1025 * (v17 + v16)) ^ ((1025 * (v17 + v16)) >> 6);
          int v19 = *v18++;
          int v16 = v19;
        }

        while (v19);
        unsigned int v20 = 9 * v17;
      }

      else
      {
        unsigned int v20 = 0;
      }

      unsigned int v21 = 32769 * (v20 ^ (v20 >> 11)) % v3;
      BOOL v22 = v12 >= v21;
      unsigned int v23 = v12 - v21;
      int v24 = v22 ? 0 : v3;
      unsigned int v25 = v24 + v23;
      if (v9 > v25)
      {
        if (v9 > *(unsigned __int16 *)(result + 18))
        {
          if (v9 >= 0x10000) {
            _os_map_str_insert_no_rehash_cold_3(result, (uint64_t)a2, a3);
          }
          *(_WORD *)(result + 18) = v9;
        }

        *(void *)(v10 + 8LL * v12) = a2;
        *(void *)(v11 + 8LL * v12) = a3;
        a3 = v14;
        a2 = v15;
        unsigned int v9 = v25;
      }
    }

    ++v9;
    else {
      unsigned int v12 = 0;
    }
    if (!--v13) {
      goto LABEL_27;
    }
  }

  if (v9 > *(unsigned __int16 *)(result + 18))
  {
    if (v9 >= 0x10000) {
      _os_map_str_insert_no_rehash_cold_2(result, (uint64_t)a2, a3);
    }
    *(_WORD *)(result + 18) = v9;
  }

  *(void *)(v10 + 8LL * v12) = a2;
  *(void *)(v11 + 8LL * v12) = a3;
  ++*(_DWORD *)(result + 8);
  return result;
}

void _os_map_32_rehash(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 12);
  if ((int)a2 < 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((a2 & 0x80000000) != 0)
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 16);
      if (v7 >= 6)
      {
        LOWORD(v7) = v7 - 1;
        *(_WORD *)(a1 + 16) = v7;
      }

      int v8 = 1 << v7;
      int v9 = v8 - 1;
      unsigned int v10 = v8 - ((v8 - 1) & (v4 >> 1));
      unsigned int v6 = v10 + (v4 >> 1);
      *(_DWORD *)(a1 + 12) = v6;
    }
  }

  else
  {
    __int16 v5 = *(_WORD *)(a1 + 16);
    unsigned int v6 = (1 << v5) + v4;
    *(_DWORD *)(a1 + 12) = v6;
    if (v6 == 8 << v5) {
      *(_WORD *)(a1 + 16) = v5 + 1;
    }
  }

  uint64_t v11 = *(char **)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v6 == -1) {
    os_map_32_init_cold_2(a1, a2, a3);
  }
  unsigned int v12 = calloc(v6, 0xCuLL);
  if (!v12) {
    os_map_32_init_cold_1(0LL, v13, v14);
  }
  *(void *)a1 = v12;
  if ((_DWORD)v4)
  {
    uint64_t v15 = (uint64_t *)&v11[4 * v4];
    int v16 = (unsigned int *)v11;
    do
    {
      if (*v15) {
        _os_map_32_insert_no_rehash(a1, *v16, *v15);
      }
      ++v15;
      ++v16;
      --v4;
    }

    while (v4);
  }

  free(v11);
}

uint64_t _os_map_32_insert_no_rehash(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned int *)(result + 12);
  if (!(_DWORD)v3) {
LABEL_17:
  }
    _os_map_32_insert_no_rehash_cold_1(result, a2, a3);
  unsigned int v4 = 0;
  uint64_t v5 = *(void *)result;
  uint64_t v6 = *(void *)result + 4 * v3;
  unsigned int v7 = 73244475 * ((73244475 * (a2 ^ WORD1(a2))) ^ ((73244475 * (a2 ^ WORD1(a2))) >> 16));
  unsigned int v8 = (v7 ^ HIWORD(v7)) % v3;
  int v9 = *(_DWORD *)(result + 12);
  while (1)
  {
    uint64_t v10 = *(void *)(v6 + 8LL * v8);
    if (!v10) {
      break;
    }
    if (v4)
    {
      uint64_t v11 = *(unsigned int *)(v5 + 4LL * v8);
      unsigned int v12 = 73244475 * ((73244475 * (v11 ^ WORD1(v11))) ^ ((73244475 * (v11 ^ WORD1(v11))) >> 16));
      unsigned int v13 = *(_DWORD *)(result + 12);
      unsigned int v14 = (v12 ^ HIWORD(v12)) % v13;
      BOOL v15 = v8 >= v14;
      unsigned int v16 = v8 - v14;
      if (v15) {
        unsigned int v13 = 0;
      }
      unsigned int v17 = v13 + v16;
      if (v4 > v17)
      {
        if (v4 > *(unsigned __int16 *)(result + 18))
        {
          if (v4 >= 0x10000) {
            _os_map_32_insert_no_rehash_cold_3(result, a2, a3);
          }
          *(_WORD *)(result + 18) = v4;
        }

        *(_DWORD *)(v5 + 4LL * v8) = a2;
        *(void *)(v6 + 8LL * v8) = a3;
        a3 = v10;
        a2 = v11;
        unsigned int v4 = v17;
      }
    }

    ++v4;
    else {
      unsigned int v8 = 0;
    }
    if (!--v9) {
      goto LABEL_17;
    }
  }

  if (v4 > *(unsigned __int16 *)(result + 18))
  {
    if (v4 >= 0x10000) {
      _os_map_32_insert_no_rehash_cold_2(result, a2, a3);
    }
    *(_WORD *)(result + 18) = v4;
  }

  *(_DWORD *)(v5 + 4LL * v8) = a2;
  *(void *)(v6 + 8LL * v8) = a3;
  ++*(_DWORD *)(result + 8);
  return result;
}

void _os_map_64_rehash(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 12);
  if ((int)a2 < 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((a2 & 0x80000000) != 0)
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 16);
      if (v7 >= 6)
      {
        LOWORD(v7) = v7 - 1;
        *(_WORD *)(a1 + 16) = v7;
      }

      int v8 = 1 << v7;
      int v9 = v8 - 1;
      unsigned int v10 = v8 - ((v8 - 1) & (v4 >> 1));
      unsigned int v6 = v10 + (v4 >> 1);
      *(_DWORD *)(a1 + 12) = v6;
    }
  }

  else
  {
    __int16 v5 = *(_WORD *)(a1 + 16);
    unsigned int v6 = (1 << v5) + v4;
    *(_DWORD *)(a1 + 12) = v6;
    if (v6 == 8 << v5) {
      *(_WORD *)(a1 + 16) = v5 + 1;
    }
  }

  uint64_t v11 = *(char **)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v6 == -1) {
    os_map_64_init_cold_2(a1, a2, a3);
  }
  unsigned int v12 = calloc(v6, 0x10uLL);
  if (!v12) {
    os_map_64_init_cold_1(0LL, v13, v14);
  }
  *(void *)a1 = v12;
  if ((_DWORD)v4)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = 8 * v4;
    do
    {
      uint64_t v17 = *(void *)&v11[v16 + v15];
      if (v17) {
        _os_map_64_insert_no_rehash(a1, *(void *)&v11[v15], v17);
      }
      v15 += 8LL;
    }

    while (v16 != v15);
  }

  free(v11);
}

uint64_t _os_map_64_insert_no_rehash(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned int *)(result + 12);
  if (!(_DWORD)v3) {
LABEL_17:
  }
    _os_map_64_insert_no_rehash_cold_1(result, a2, a3);
  unsigned int v4 = 0;
  uint64_t v5 = *(void *)result;
  uint64_t v6 = *(void *)result + 8 * v3;
  unsigned int v7 = 73244475 * (HIDWORD(a2) ^ a2 ^ ((HIDWORD(a2) ^ a2) >> 16));
  unsigned int v8 = ((73244475 * (v7 ^ HIWORD(v7))) ^ ((73244475 * (v7 ^ HIWORD(v7))) >> 16)) % v3;
  int v9 = *(_DWORD *)(result + 12);
  while (1)
  {
    uint64_t v10 = *(void *)(v6 + 8LL * v8);
    if (!v10) {
      break;
    }
    if (v4)
    {
      uint64_t v11 = *(void *)(v5 + 8LL * v8);
      unsigned int v12 = 73244475 * (HIDWORD(v11) ^ v11 ^ ((HIDWORD(v11) ^ v11) >> 16));
      unsigned int v13 = ((73244475 * (v12 ^ HIWORD(v12))) ^ ((73244475 * (v12 ^ HIWORD(v12))) >> 16)) % v3;
      BOOL v14 = v8 >= v13;
      unsigned int v15 = v8 - v13;
      int v16 = v14 ? 0 : v3;
      unsigned int v17 = v16 + v15;
      if (v4 > v17)
      {
        if (v4 > *(unsigned __int16 *)(result + 18))
        {
          if (v4 >= 0x10000) {
            _os_map_64_insert_no_rehash_cold_3(result, a2, a3);
          }
          *(_WORD *)(result + 18) = v4;
        }

        *(void *)(v5 + 8LL * v8) = a2;
        *(void *)(v6 + 8LL * v8) = a3;
        a3 = v10;
        a2 = v11;
        unsigned int v4 = v17;
      }
    }

    ++v4;
    else {
      unsigned int v8 = 0;
    }
    if (!--v9) {
      goto LABEL_17;
    }
  }

  if (v4 > *(unsigned __int16 *)(result + 18))
  {
    if (v4 >= 0x10000) {
      _os_map_64_insert_no_rehash_cold_2(result, a2, a3);
    }
    *(_WORD *)(result + 18) = v4;
  }

  *(void *)(v5 + 8LL * v8) = a2;
  *(void *)(v6 + 8LL * v8) = a3;
  ++*(_DWORD *)(result + 8);
  return result;
}

void _os_map_128_rehash(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 12);
  if ((int)a2 < 1)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((a2 & 0x80000000) != 0)
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 16);
      if (v7 >= 6)
      {
        LOWORD(v7) = v7 - 1;
        *(_WORD *)(a1 + 16) = v7;
      }

      int v8 = 1 << v7;
      int v9 = v8 - 1;
      unsigned int v10 = v8 - ((v8 - 1) & (v4 >> 1));
      unsigned int v6 = v10 + (v4 >> 1);
      *(_DWORD *)(a1 + 12) = v6;
    }
  }

  else
  {
    __int16 v5 = *(_WORD *)(a1 + 16);
    unsigned int v6 = (1 << v5) + v4;
    *(_DWORD *)(a1 + 12) = v6;
    if (v6 == 8 << v5) {
      *(_WORD *)(a1 + 16) = v5 + 1;
    }
  }

  uint64_t v11 = *(uint64_t **)a1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 18) = 0;
  if (v6 == -1) {
    os_map_128_init_cold_2(a1, a2, a3);
  }
  unsigned int v12 = calloc(v6, 0x18uLL);
  if (!v12) {
    os_map_128_init_cold_1(0LL, v13, v14);
  }
  *(void *)a1 = v12;
  if ((_DWORD)v4)
  {
    unsigned int v15 = &v11[2 * v4];
    int v16 = v11 + 1;
    do
    {
      if (*v15) {
        _os_map_128_insert_no_rehash(a1, *(v16 - 1), *v16, *v15);
      }
      ++v15;
      v16 += 2;
      --v4;
    }

    while (v4);
  }

  free(v11);
}

uint64_t _os_map_128_insert_no_rehash(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(unsigned int *)(result + 12);
  if (!(_DWORD)v4) {
LABEL_17:
  }
    _os_map_128_insert_no_rehash_cold_1(result, a2, a3);
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)result;
  uint64_t v7 = *(void *)result + 16 * v4;
  unsigned int v8 = 73244475
     * (((a2 ^ (unint64_t)a3) >> 32) ^ a2 ^ a3 ^ ((((a2 ^ (unint64_t)a3) >> 32) ^ a2 ^ a3) >> 16));
  unsigned int v9 = ((73244475 * (v8 ^ HIWORD(v8))) ^ ((73244475 * (v8 ^ HIWORD(v8))) >> 16)) % v4;
  int v10 = *(_DWORD *)(result + 12);
  while (1)
  {
    uint64_t v11 = *(void *)(v7 + 8LL * v9);
    if (!v11) {
      break;
    }
    if (v5)
    {
      unsigned int v12 = (uint64_t *)(v6 + 16LL * v9);
      uint64_t v13 = *v12;
      uint64_t v14 = v12[1];
      unsigned int v15 = ((v14 ^ (unint64_t)*v12) >> 32) ^ v14 ^ *(_DWORD *)v12;
      unsigned int v16 = 73244475 * ((73244475 * (v15 ^ HIWORD(v15))) ^ ((73244475 * (v15 ^ HIWORD(v15))) >> 16));
      unsigned int v17 = *(_DWORD *)(result + 12);
      unsigned int v18 = (v16 ^ HIWORD(v16)) % v17;
      BOOL v19 = v9 >= v18;
      unsigned int v20 = v9 - v18;
      if (v19) {
        unsigned int v17 = 0;
      }
      unsigned int v21 = v17 + v20;
      if (v5 > v21)
      {
        if (v5 > *(unsigned __int16 *)(result + 18))
        {
          if (v5 >= 0x10000) {
            _os_map_128_insert_no_rehash_cold_3(result, a2, a3);
          }
          *(_WORD *)(result + 18) = v5;
        }

        *unsigned int v12 = a2;
        v12[1] = a3;
        *(void *)(v7 + 8LL * v9) = a4;
        a4 = v11;
        a2 = v13;
        a3 = v14;
        unsigned int v5 = v21;
      }
    }

    ++v5;
    else {
      unsigned int v9 = 0;
    }
    if (!--v10) {
      goto LABEL_17;
    }
  }

  if (v5 > *(unsigned __int16 *)(result + 18))
  {
    if (v5 >= 0x10000) {
      _os_map_128_insert_no_rehash_cold_2(result, a2, a3);
    }
    *(_WORD *)(result + 18) = v5;
  }

  BOOL v22 = (uint64_t *)(v6 + 16LL * v9);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v7 + 8LL * v9) = a4;
  ++*(_DWORD *)(result + 8);
  return result;
}

void OUTLINED_FUNCTION_0_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_2_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void os_set_str_ptr_init_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("_os_set_str_ptr_alloc_data", "collections_set.in.c", a3, "result != NULL");
}

void os_set_str_ptr_init_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void os_set_str_ptr_insert_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6("_common_os_set_str_ptr_insert", "collections_common.in.c", a3, "val != NULL");
}

void os_set_str_ptr_find_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2("_os_set_str_ptr_find_helper", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void os_set_32_ptr_init_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("_os_set_32_ptr_alloc_data", "collections_set.in.c", a3, "result != NULL");
}

void os_set_32_ptr_init_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void os_set_32_ptr_insert_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6("_common_os_set_32_ptr_insert", "collections_common.in.c", a3, "val != NULL");
}

void os_set_32_ptr_find_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2("_os_set_32_ptr_find_helper", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void os_set_64_ptr_init_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("_os_set_64_ptr_alloc_data", "collections_set.in.c", a3, "result != NULL");
}

void os_set_64_ptr_init_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void os_set_64_ptr_insert_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6("_common_os_set_64_ptr_insert", "collections_common.in.c", a3, "val != NULL");
}

void os_set_64_ptr_find_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2("_os_set_64_ptr_find_helper", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void _os_set_str_ptr_insert_no_rehash_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("_os_set_str_ptr_insert_no_rehash", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void _os_set_str_ptr_insert_no_rehash_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3("_os_set_str_ptr_insert_no_rehash", "collections_common.in.c", a3, "bucket_offset <= UINT16_MAX");
}

void _os_set_str_ptr_insert_no_rehash_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5("_os_set_str_ptr_swap_if_needed", "collections_common.in.c", a3, "*bucket_offset <= UINT16_MAX");
}

void _os_set_32_ptr_insert_no_rehash_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("_os_set_32_ptr_insert_no_rehash", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void _os_set_32_ptr_insert_no_rehash_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3("_os_set_32_ptr_insert_no_rehash", "collections_common.in.c", a3, "bucket_offset <= UINT16_MAX");
}

void _os_set_32_ptr_insert_no_rehash_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5("_os_set_32_ptr_swap_if_needed", "collections_common.in.c", a3, "*bucket_offset <= UINT16_MAX");
}

void _os_set_64_ptr_insert_no_rehash_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("_os_set_64_ptr_insert_no_rehash", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void _os_set_64_ptr_insert_no_rehash_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3("_os_set_64_ptr_insert_no_rehash", "collections_common.in.c", a3, "bucket_offset <= UINT16_MAX");
}

void _os_set_64_ptr_insert_no_rehash_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5("_os_set_64_ptr_swap_if_needed", "collections_common.in.c", a3, "*bucket_offset <= UINT16_MAX");
}

void os_map_str_init_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0("_os_map_str_alloc_data", "collections_map.in.c", a3, "result != NULL");
}

void os_map_str_init_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void os_map_str_insert_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6("_common_os_map_str_insert", "collections_common.in.c", a3, "val != NULL");
}

void os_map_str_find_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2("_os_map_str_find_helper", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void os_map_32_init_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0("_os_map_32_alloc_data", "collections_map.in.c", a3, "result != NULL");
}

void os_map_32_init_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void os_map_32_insert_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6("_common_os_map_32_insert", "collections_common.in.c", a3, "val != NULL");
}

void os_map_32_find_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2("_os_map_32_find_helper", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void os_map_64_init_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0("_os_map_64_alloc_data", "collections_map.in.c", a3, "result != NULL");
}

void os_map_64_init_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void os_map_64_insert_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6("_common_os_map_64_insert", "collections_common.in.c", a3, "val != NULL");
}

void os_map_64_find_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2("_os_map_64_find_helper", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void os_map_128_init_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0("_os_map_128_alloc_data", "collections_map.in.c", a3, "result != NULL");
}

void os_map_128_init_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void os_map_128_insert_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_6("_common_os_map_128_insert", "collections_common.in.c", a3, "val != NULL");
}

void os_map_128_find_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2("_os_map_128_find_helper", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void _os_map_str_insert_no_rehash_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("_os_map_str_insert_no_rehash", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void _os_map_str_insert_no_rehash_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3("_os_map_str_insert_no_rehash", "collections_common.in.c", a3, "bucket_offset <= UINT16_MAX");
}

void _os_map_str_insert_no_rehash_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5("_os_map_str_swap_if_needed", "collections_common.in.c", a3, "*bucket_offset <= UINT16_MAX");
}

void _os_map_32_insert_no_rehash_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("_os_map_32_insert_no_rehash", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void _os_map_32_insert_no_rehash_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3("_os_map_32_insert_no_rehash", "collections_common.in.c", a3, "bucket_offset <= UINT16_MAX");
}

void _os_map_32_insert_no_rehash_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5("_os_map_32_swap_if_needed", "collections_common.in.c", a3, "*bucket_offset <= UINT16_MAX");
}

void _os_map_64_insert_no_rehash_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("_os_map_64_insert_no_rehash", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void _os_map_64_insert_no_rehash_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3("_os_map_64_insert_no_rehash", "collections_common.in.c", a3, "bucket_offset <= UINT16_MAX");
}

void _os_map_64_insert_no_rehash_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5("_os_map_64_swap_if_needed", "collections_common.in.c", a3, "*bucket_offset <= UINT16_MAX");
}

void _os_map_128_insert_no_rehash_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("_os_map_128_insert_no_rehash", "collections_common.in.c", a3, "loop_limit-- != 0");
}

void _os_map_128_insert_no_rehash_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3("_os_map_128_insert_no_rehash", "collections_common.in.c", a3, "bucket_offset <= UINT16_MAX");
}

void _os_map_128_insert_no_rehash_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5("_os_map_128_swap_if_needed", "collections_common.in.c", a3, "*bucket_offset <= UINT16_MAX");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

void free(void *a1)
{
}