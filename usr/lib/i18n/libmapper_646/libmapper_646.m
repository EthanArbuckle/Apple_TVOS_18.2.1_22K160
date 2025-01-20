uint64_t _citrus_mapper_646_mapper_init( uint64_t a1, uint64_t a2, const char *a3, _BYTE *a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;
  _DWORD *v13;
  _DWORD *v14;
  const char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  int v21;
  char *v23;
  int v24;
  uint64_t v26;
  char *__endptr;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  char __str[1024];
  char v32[1024];
  uint64_t v33;
  v33 = *MEMORY[0x1895F89C0];
  if (a7 < 0x18) {
    return 22LL;
  }
  v13 = malloc(0x34uLL);
  if (!v13) {
    return *__error();
  }
  v14 = v13;
  v13[12] = 1;
  _citrus_memory_stream_skip_ws();
  v16 = 0LL;
  if (a5 && *a4 == 33)
  {
    v16 = 1LL;
    v14[12] = 0;
  }

  v17 = a5 - v16;
  if (a5 < v16) {
    v17 = 0LL;
  }
  if (v17 + v16 <= a5) {
    v15 = &a4[v16];
  }
  snprintf(__str, 0x400uLL, "%s/%.*s", a3, v17, v15);
  *(_BYTE *)_citrus_bcs_skip_nonws() = 0;
  v18 = _citrus_map_file();
  if ((_DWORD)v18)
  {
    v7 = v18;
LABEL_28:
    free(v14);
  }

  else
  {
    v19 = 0LL;
    v29 = v28;
    v30 = 0LL;
    while (1)
    {
      if (!_citrus_memory_stream_getln())
      {
LABEL_27:
        _citrus_unmap_file();
        v7 = 22LL;
        goto LABEL_28;
      }

      v20 = (const char *)_citrus_bcs_skip_ws_len();
      v21 = *(unsigned __int8 *)v20;
      if (v21 != 35 && v26 != 0)
      {
        v23 = (char *)v20;
        snprintf(v32, 0x400uLL, "%.*s", v26, v20);
        __endptr = v23;
        v14[v19] = strtoul(v32, &__endptr, 0);
        if (!*(_BYTE *)_citrus_bcs_skip_ws()) {
          goto LABEL_27;
        }
        if (++v19 == 12) {
          break;
        }
      }
    }

    _citrus_unmap_file();
    v7 = 0LL;
    if (v14[12]) {
      v24 = 2;
    }
    else {
      v24 = 1;
    }
    *(_DWORD *)(a2 + 64) = v24;
    *(void *)(a2 + 8) = v14;
    *(void *)(a6 + 16) = 1LL;
    *(_OWORD *)a6 = xmmword_188CEDF70;
  }

  return v7;
}

void _citrus_mapper_646_mapper_uninit(uint64_t a1)
{
  if (a1)
  {
    v1 = *(void **)(a1 + 8);
    if (v1) {
      free(v1);
    }
  }
}

uint64_t _citrus_mapper_646_mapper_convert(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  v4 = (int *)a2[2];
  v5 = *(int **)(a1 + 8);
  int v6 = *v4;
  if (v5[12])
  {
    if (v6 >= 1)
    {
      uint64_t v7 = 0LL;
      while (1)
      {
        int v8 = *(_DWORD *)(v3 + 4 * v7);
        if (v8 > 90)
        {
          switch(v8)
          {
            case '[':
              int v8 = v5[3];
              goto LABEL_14;
            case '\\':
              int v8 = v5[4];
              goto LABEL_14;
            case ']':
              int v8 = v5[5];
              goto LABEL_14;
            case '^':
              int v8 = v5[6];
              goto LABEL_14;
            case '_':
              goto LABEL_15;
              int v8 = v5[7];
              goto LABEL_14;
            default:
              switch(v8)
              {
                case '{':
                  int v8 = v5[8];
                  goto LABEL_14;
                case '|':
                  int v8 = v5[9];
                  goto LABEL_14;
                case '}':
                  int v8 = v5[10];
                  goto LABEL_14;
                case '~':
                  int v8 = v5[11];
                  goto LABEL_14;
                default:
                  goto LABEL_15;
              }
          }
        }

        if (v8 == 35) {
          break;
        }
        if (v8 == 36)
        {
          int v8 = v5[1];
LABEL_14:
          if (v8 == -1) {
            goto LABEL_83;
          }
          goto LABEL_15;
        }

        if (v8 == 64)
        {
          int v8 = v5[2];
          goto LABEL_14;
        }

LABEL_15:
        *(_DWORD *)(v2 + 4 * v7++) = v8;
        if (v7 >= *v4) {
          return 0LL;
        }
      }

      int v8 = *v5;
      goto LABEL_14;
    }

    return 0LL;
  }

  if (v6 < 1) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  while (1)
  {
    unsigned int v9 = *(_DWORD *)(v3 + 4 * v7);
    if (*v5 != -1 && v9 == *v5)
    {
      unsigned int v9 = 35;
      goto LABEL_43;
    }

    if (v9 == 35) {
      break;
    }
    int v11 = v5[1];
    if (v11 != -1 && v9 == v11)
    {
      unsigned int v9 = 36;
      goto LABEL_43;
    }

    if (v9 == 36) {
      break;
    }
    int v13 = v5[2];
    if (v13 != -1 && v9 == v13)
    {
      unsigned int v9 = 64;
      goto LABEL_43;
    }

    if (v9 == 64) {
      break;
    }
    int v14 = v5[3];
    if (v14 != -1 && v9 == v14)
    {
      unsigned int v9 = 91;
      goto LABEL_43;
    }

    if (v9 == 91) {
      break;
    }
    int v15 = v5[4];
    if (v15 != -1 && v9 == v15)
    {
      unsigned int v9 = 92;
      goto LABEL_43;
    }

    if (v9 == 92) {
      break;
    }
    int v16 = v5[5];
    if (v16 != -1 && v9 == v16)
    {
      unsigned int v9 = 93;
      goto LABEL_43;
    }

    if (v9 == 93) {
      break;
    }
    int v17 = v5[6];
    if (v17 != -1 && v9 == v17)
    {
      unsigned int v9 = 94;
      goto LABEL_43;
    }

    if (v9 == 94) {
      break;
    }
    int v18 = v5[7];
    if (v18 != -1 && v9 == v18)
    {
      unsigned int v9 = 96;
      goto LABEL_43;
    }

    if (v9 == 96) {
      break;
    }
    int v19 = v5[8];
    if (v19 != -1 && v9 == v19)
    {
      unsigned int v9 = 123;
      goto LABEL_43;
    }

    if (v9 == 123) {
      break;
    }
    int v20 = v5[9];
    if (v20 != -1 && v9 == v20)
    {
      unsigned int v9 = 124;
      goto LABEL_43;
    }

    if (v9 == 124) {
      break;
    }
    int v21 = v5[10];
    if (v21 != -1 && v9 == v21)
    {
      unsigned int v9 = 125;
      goto LABEL_43;
    }

    if (v9 == 125) {
      break;
    }
    int v22 = v5[11];
    if (v22 != -1 && v9 == v22)
    {
      unsigned int v9 = 126;
      goto LABEL_43;
    }

    if (v9 == 126) {
      break;
    }
    if (v9 > 0x7F)
    {
LABEL_83:
      int v23 = 1;
      goto LABEL_86;
    }

LABEL_43:
    *(_DWORD *)(v2 + 4 * v7++) = v9;
    if (v7 >= *v4) {
      return 0LL;
    }
  }

LABEL_85:
  int v23 = 4;
LABEL_86:
  int *v4 = v7;
  return v23 & 0x9FFFFFFF | ((*(_DWORD *)(a1 + 64) & 3) << 29);
}

uint64_t _citrus_mapper_646_mapper_getops(_OWORD *a1)
{
  __int128 v1 = *(_OWORD *)&off_18C749D70;
  *a1 = _citrus_mapper_646_mapper_ops;
  a1[1] = v1;
  return 0LL;
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _citrus_bcs_skip_nonws()
{
  return MEMORY[0x189615320]();
}

uint64_t _citrus_bcs_skip_ws()
{
  return MEMORY[0x189615328]();
}

uint64_t _citrus_bcs_skip_ws_len()
{
  return MEMORY[0x189615330]();
}

uint64_t _citrus_map_file()
{
  return MEMORY[0x189615390]();
}

uint64_t _citrus_memory_stream_getln()
{
  return MEMORY[0x1896153B8]();
}

uint64_t _citrus_memory_stream_skip_ws()
{
  return MEMORY[0x1896153C0]();
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}