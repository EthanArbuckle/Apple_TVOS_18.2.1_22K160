double _citrus_mapper_zone_mapper_init( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  int *v13;
  int *v14;
  _DWORD *v15;
  double result;
  int tok;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23[3];
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  if (a7 >= 0x18)
  {
    v26 = v7;
    v27 = v8;
    v13 = (int *)malloc(0x1CuLL);
    if (v13)
    {
      v14 = v13;
      *((void *)v13 + 1) = 0LL;
      v15 = v13 + 2;
      *(void *)v13 = 0LL;
      v13[6] = 0;
      *((void *)v13 + 2) = 0LL;
      v23[0] = a4;
      v23[1] = a5;
      v23[2] = 0LL;
      v24 = 0;
      if (parse_zone(v23, &v24, (unsigned int *)v13))
      {
LABEL_4:
        free(v14);
        return result;
      }

      tok = get_tok(v23, &v24);
      v18 = tok;
      if (tok == 47)
      {
        *((void *)v14 + 1) = *(void *)v14;
        v19 = v25;
        v14[6] = v25;
        if (v19 > 0x20) {
          goto LABEL_4;
        }
        tok = get_tok(v23, &v24);
      }

      else
      {
        v19 = 32;
        v14[6] = 32;
        *((void *)v14 + 1) = 0LL;
      }

      if (tok == 58)
      {
        v24 = 1;
        v20 = v25;
        v14[4] = v25;
        if (v18 == 47)
        {
          v14[5] = v20;
          v14[4] = v25;
        }

        else
        {
          v14[5] = 0;
        }

        tok = get_tok(v23, &v24);
      }

      if (tok != -1) {
        goto LABEL_4;
      }
      v21 = v19 == 32 ? 0 : 1 << v19;
      v22 = v19 ? 1 << -(char)v19 : 0;
      *(void *)(a2 + 8) = v14;
      *(void *)(a6 + 16) = 1LL;
      result = 0.0;
      *(_OWORD *)a6 = xmmword_188E5DF80;
    }

    else
    {
      __error();
    }
  }

  return result;
}

uint64_t _citrus_mapper_zone_mapper_convert(uint64_t a1, uint64_t *a2)
{
  v2 = (int *)a2[2];
  if (*v2 < 1) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  v4 = *(unsigned int **)(a1 + 8);
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  int v7 = *(_DWORD *)(a1 + 64);
  while (1)
  {
    unsigned int v8 = v4[6];
    unsigned int v9 = *(_DWORD *)(v6 + 4 * v3);
    if (v8 != 32) {
      break;
    }
    if (v9 < *v4 || v9 > v4[1]) {
      goto LABEL_14;
    }
    int v10 = v4[4] + v9;
LABEL_12:
    *(_DWORD *)(v5 + 4 * v3++) = v10;
    if (v3 >= *v2) {
      return 0LL;
    }
  }

  unsigned int v11 = v9 >> v8;
  if (v9 >> v8 >= v4[2] && v11 <= v4[3])
  {
    unsigned int v12 = v9 & ~(-1 << v8);
    if (v12 >= *v4 && v12 <= v4[1])
    {
      int v10 = ((v4[5] + v11) << v8) | (v4[4] + v12);
      goto LABEL_12;
    }
  }

LABEL_14:
  int *v2 = v3;
  return ((v7 & 3) << 29) | 1u;
}

uint64_t _citrus_mapper_zone_mapper_getops(_OWORD *a1)
{
  __int128 v1 = *(_OWORD *)&off_18C756E88;
  *a1 = _citrus_mapper_zone_mapper_ops;
  a1[1] = v1;
  return 0LL;
}

uint64_t parse_zone(uint64_t *a1, _DWORD *a2, unsigned int *a3)
{
  *a3 = a2[1];
  unsigned int v6 = a2[1];
  a3[1] = v6;
  if (*a3 <= v6) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t get_tok(uint64_t *a1, _DWORD *a2)
{
  unint64_t v2 = a1[1];
  unint64_t v3 = a1[2];
  if (v3 >= v2)
  {
    BOOL v5 = 0;
    uint64_t v6 = 0xFFFFFFFFLL;
    goto LABEL_10;
  }

  uint64_t v4 = *a1;
  BOOL v5 = 1;
  while (1)
  {
    uint64_t v6 = *(unsigned __int8 *)(v4 + v3);
    a1[2] = ++v3;
    BOOL v5 = v3 < v2;
    if (v2 == v3)
    {
      BOOL v5 = 0;
      uint64_t v6 = 0xFFFFFFFFLL;
      unint64_t v3 = v2;
      goto LABEL_10;
    }
  }

  if (*(_BYTE *)(v4 + v3))
  {
LABEL_10:
    if (*a2 == 1)
    {
      if ((_DWORD)v6 == 47)
      {
        if (v5) {
          a1[2] = v3 + 1;
        }
        return 47LL;
      }
    }

    else if (!*a2)
    {
      if ((v6 - 48) >= 0xA)
      {
        uint64_t v7 = 256LL;
        if (v6 <= 0x3A && ((1LL << v6) & 0x400A00000000000LL) != 0)
        {
          if (v5) {
            a1[2] = v3 + 1;
          }
          return v6;
        }

        return v7;
      }

      return get_imm(a1, (uint64_t)a2);
    }

    return 256LL;
  }

  return 0xFFFFFFFFLL;
}

uint64_t check_rowcol(_DWORD *a1, int a2, unsigned int a3)
{
  if (a3)
  {
    unsigned int v3 = a1[1];
    BOOL v4 = a3 >= v3;
    unsigned int v5 = a3 - v3;
    if (v5 == 0 || !v4) {
      return 0xFFFFFFFFLL;
    }
    if (a2 <= 0) {
      goto LABEL_12;
    }
  }

  else
  {
    if (a2 <= 0)
    {
LABEL_12:
      return 0LL;
    }

    int v6 = a1[1];
    if (v6) {
      unsigned int v5 = -v6;
    }
    else {
      unsigned int v5 = -1;
    }
  }

  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return 0LL;
}

uint64_t get_imm(void *a1, uint64_t a2)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  unint64_t v5 = a1[1];
  unint64_t v6 = a1[2];
  while (1)
  {
    unint64_t v7 = v6;
    uint64_t v8 = v4;
LABEL_3:
    uint64_t v9 = v8;
    while (1)
    {
      if (v7 >= v5)
      {
        uint64_t v8 = 0xFFFFFFFFLL;
        if (v3)
        {
LABEL_15:
          if (v8 - 58 > 0xFFFFFFF5
            || (v8 & 0xDF) - 71 > 0xFFFFFFF9
            || v3 == 1 && (_DWORD)v8 == 120)
          {
            goto LABEL_19;
          }

          goto LABEL_23;
        }
      }

      else
      {
        uint64_t v8 = *(unsigned __int8 *)(*a1 + v7);
        if (v3) {
          goto LABEL_15;
        }
      }

      if ((_DWORD)v9 || (_DWORD)v8 != 45 && (_DWORD)v8 != 43) {
        break;
      }
      uint64_t v9 = v8;
      if (v7 < v5)
      {
        a1[2] = ++v7;
        goto LABEL_3;
      }
    }

    unint64_t v6 = v7;
    uint64_t v4 = v9;
LABEL_19:
    if (v7 >= v5)
    {
      char v10 = -1;
    }

    else
    {
      a1[2] = v6 + 1;
      char v10 = *(_BYTE *)(*a1 + v6++);
    }

    __str[v3++] = v10;
    if (v3 == 20)
    {
LABEL_23:
      LODWORD(v9) = v4;
      goto LABEL_25;
    }
  }

  LODWORD(v3) = 0;
LABEL_25:
  __str[v3] = 0;
  int v11 = strtoul(__str, &__endptr, 0);
  *(_DWORD *)(a2 + 4) = v11;
  if ((_DWORD)v9 == 45) {
    *(_DWORD *)(a2 + 4) = -v11;
  }
  return 257LL;
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}