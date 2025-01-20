FILE **cqdb_writer(FILE *a1, int a2)
{
  FILE **v4;
  FILE **v5;
  int v6;
  uint64_t i;
  v4 = (FILE **)calloc(1uLL, 0x1028uLL);
  v5 = v4;
  if (v4)
  {
    bzero((char *)v4 + 4, 0x1024uLL);
    *(_DWORD *)v5 = a2;
    v5[1] = a1;
    v6 = MEMORY[0x1895A4CE4](a1);
    *((_DWORD *)v5 + 4) = v6;
    *((_DWORD *)v5 + 5) = 2072;
    for (i = 4LL; i != 516; i += 2LL)
      v5[i] = 0LL;
    *(_OWORD *)(v5 + 515) = 0u;
    if (fseek(v5[1], (v6 + 2072), 0))
    {
      free(v5);
      return 0LL;
    }
  }

  return v5;
}

uint64_t cqdb_writer_put(uint64_t a1, char *__s, unsigned int a3)
{
  int v6 = strlen(__s);
  unint64_t v7 = (v6 + 1);
  int v8 = hashlittle((unsigned __int8 *)__s, v7, 0);
  if ((a3 & 0x80000000) != 0)
  {
    uint64_t result = 4294966278LL;
    goto LABEL_5;
  }

  int v9 = v8;
  unsigned int __ptr = a3;
  fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
  int v23 = v6 + 1;
  fwrite(&v23, 1uLL, 4uLL, *(FILE **)(a1 + 8));
  fwrite(__s, v7, 1uLL, *(FILE **)(a1 + 8));
  if (!ferror(*(FILE **)(a1 + 8)))
  {
    v11 = (unsigned int *)(a1 + 16LL * v9 + 24);
    uint64_t v12 = a1 + 16LL * v9;
    unsigned int v13 = *(_DWORD *)(v12 + 28);
    unsigned int v14 = *v11;
    if (v13 <= *v11)
    {
      *(_DWORD *)(v12 + 28) = 2 * v13 + 2;
      v15 = (char *)realloc(*(void **)(v12 + 32), 8LL * (2 * v13 + 2));
      *(void *)(v12 + 32) = v15;
      if (!v15) {
        goto LABEL_21;
      }
      unsigned int v14 = *v11;
    }

    else
    {
      v15 = *(char **)(v12 + 32);
    }

    v16 = &v15[8 * v14];
    int v17 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)v16 = v9;
    *((_DWORD *)v16 + 1) = v17;
    unsigned int *v11 = v14 + 1;
    if ((*(_BYTE *)a1 & 1) != 0)
    {
LABEL_20:
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 20) = v6 + v17 + 9;
      return result;
    }

    unsigned int v18 = *(_DWORD *)(a1 + 4132);
    if (v18 > a3)
    {
LABEL_17:
      if (*(_DWORD *)(a1 + 4128) <= a3) {
        *(_DWORD *)(a1 + 4128) = a3 + 1;
      }
      *(_DWORD *)(*(void *)(a1 + 4120) + 4LL * a3) = *(_DWORD *)(a1 + 20);
      int v17 = *(_DWORD *)(a1 + 20);
      goto LABEL_20;
    }

    do
    {
      int v19 = 2 * v18;
      unsigned int v18 = 2 * v18 + 2;
    }

    while (v18 <= a3);
    v20 = (char *)realloc(*(void **)(a1 + 4120), 4LL * v18);
    *(void *)(a1 + 4120) = v20;
    if (v20)
    {
      uint64_t v21 = *(unsigned int *)(a1 + 4132);
      if (v21 < v18)
      {
        bzero(&v20[4 * v21], 4LL * (v19 - v21 + 1) + 4);
        *(_DWORD *)(a1 + 4132) = v18;
      }

      goto LABEL_17;
    }

LABEL_21:
    uint64_t result = 4294966274LL;
    goto LABEL_5;
  }

  uint64_t result = 4294966275LL;
LABEL_5:
  *(_DWORD *)a1 |= 0x10000u;
  return result;
}

        if (!v27) {
          goto LABEL_27;
        }
        v28 = 5LL;
        goto LABEL_25;
      }

        if (!v26) {
          goto LABEL_27;
        }
        v27 = 5LL;
        goto LABEL_25;
      }

size_t write_uint32(uint64_t a1, int a2)
{
  int __ptr = a2;
  return fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
}

uint64_t cqdb_writer_close(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 2) & 1) == 0)
  {
    uint64_t v2 = 0LL;
    int v32 = 1111773507;
    int v3 = *(_DWORD *)(a1 + 4128);
    int v37 = 0;
    int v35 = 1648644977;
    int v36 = v3;
    do
    {
      uint64_t v4 = a1 + 16 * v2;
      uint64_t v6 = *(void *)(v4 + 32);
      v5 = (void *)(v4 + 32);
      if (v6)
      {
        uint64_t v7 = (2 * *((_DWORD *)v5 - 2));
        int v8 = (int *)calloc((int)v7, 8uLL);
        if (!v8)
        {
          uint64_t v24 = 4294966274LL;
          goto LABEL_28;
        }

        int v9 = v8;
        uint64_t v10 = *((unsigned int *)v5 - 2);
        if ((_DWORD)v10)
        {
          uint64_t v11 = 0LL;
          uint64_t v12 = *v5;
          do
          {
            unsigned int v13 = *(_DWORD *)(v12 + 8 * v11);
            uint64_t v14 = (v13 >> 8) % v7;
            v15 = (char *)&v8[2 * v14];
            int v17 = *((_DWORD *)v15 + 1);
            v16 = v15 + 4;
            if (v17)
            {
              do
              {
                LODWORD(v14) = ((int)v14 + 1) % (int)v7;
                unsigned int v18 = (char *)&v8[2 * (int)v14];
                int v19 = *((_DWORD *)v18 + 1);
                v16 = v18 + 4;
              }

              while (v19);
              uint64_t v14 = (int)v14;
            }

            v8[2 * v14] = v13;
            _DWORD *v16 = *(_DWORD *)(v12 + 8 * v11++ + 4);
          }

          while (v11 != v10);
        }

        if ((int)v7 >= 1)
        {
          v20 = v8 + 1;
          do
          {
            int __ptr = *(v20 - 1);
            fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
            int v21 = *v20;
            v20 += 2;
            int __ptr = v21;
            fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
            --v7;
          }

          while (v7);
        }

        free(v9);
      }

      ++v2;
    }

    while (v2 != 256);
    if ((*(_BYTE *)a1 & 1) == 0)
    {
      if (*(_DWORD *)(a1 + 4132))
      {
        int v37 = MEMORY[0x1895A4CE4](*(void *)(a1 + 8)) - *(_DWORD *)(a1 + 16);
        if (*(_DWORD *)(a1 + 4128))
        {
          unint64_t v22 = 0LL;
          do
          {
            int __ptr = *(_DWORD *)(*(void *)(a1 + 4120) + 4 * v22);
            fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
            ++v22;
          }

          while (v22 < *(unsigned int *)(a1 + 4128));
        }
      }
    }

    int v23 = *(FILE **)(a1 + 8);
    if (ferror(v23))
    {
LABEL_22:
      uint64_t v24 = 4294966275LL;
LABEL_28:
      fseek(*(FILE **)(a1 + 8), *(unsigned int *)(a1 + 16), 0);
      cqdb_writer_delete((void **)a1);
      return v24;
    }

    uint64_t v25 = MEMORY[0x1895A4CE4](v23);
    if (v25 == -1)
    {
      uint64_t v24 = 4294966276LL;
      goto LABEL_28;
    }

    uint64_t v26 = v25;
    uint64_t v27 = *(unsigned int *)(a1 + 16);
    int v33 = v25 - v27;
    if (fseek(*(FILE **)(a1 + 8), v27, 0)) {
      goto LABEL_26;
    }
    fwrite(&v32, 4uLL, 1uLL, *(FILE **)(a1 + 8));
    write_uint32(a1, v33);
    write_uint32(a1, v34);
    write_uint32(a1, v35);
    write_uint32(a1, v36);
    write_uint32(a1, v37);
    for (uint64_t i = 24LL; i != 4120; i += 16LL)
    {
      int v29 = *(_DWORD *)(a1 + i);
      if (v29) {
        int v29 = *(_DWORD *)(a1 + 20);
      }
      int __ptr = v29;
      fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
      int __ptr = 2 * *(_DWORD *)(a1 + i);
      fwrite(&__ptr, 1uLL, 4uLL, *(FILE **)(a1 + 8));
      *(_DWORD *)(a1 + 20) += 16 * *(_DWORD *)(a1 + i);
    }

    v30 = *(FILE **)(a1 + 8);
    if (ferror(v30)) {
      goto LABEL_22;
    }
    if (fseek(v30, v26, 0))
    {
LABEL_26:
      uint64_t v24 = 4294966277LL;
      goto LABEL_28;
    }
  }

  cqdb_writer_delete((void **)a1);
  return 0LL;
}

void cqdb_writer_delete(void **a1)
{
  for (uint64_t i = 4LL; i != 516; i += 2LL)
    free(a1[i]);
  free(a1[515]);
  free(a1);
}

void *cqdb_reader(uint64_t a1, unint64_t a2)
{
  if (a2 < 0x818 || *(_DWORD *)a1 != 1111773507) {
    return 0LL;
  }
  uint64_t v4 = calloc(1uLL, 0x1038uLL);
  v5 = v4;
  if (v4)
  {
    *(void *)uint64_t v4 = a1;
    *((void *)v4 + 1) = a2;
    strncpy((char *)v4 + 16, (const char *)a1, 4uLL);
    unint64_t v6 = *(unsigned int *)(a1 + 4);
    *((_DWORD *)v5 + 5) = v6;
    *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 8);
    int v7 = *(_DWORD *)(a1 + 12);
    *((_DWORD *)v5 + 7) = v7;
    *((_DWORD *)v5 + 8) = *(_DWORD *)(a1 + 16);
    *((_DWORD *)v5 + 9) = *(_DWORD *)(a1 + 20);
    if (v7 != 1648644977 || v6 > a2)
    {
      free(v5);
      return 0LL;
    }

    LODWORD(v9) = 0;
    uint64_t v10 = 0LL;
    *((_DWORD *)v5 + 1036) = 0;
    uint64_t v11 = (unsigned int *)(a1 + 24);
    do
    {
      uint64_t v13 = *v11;
      uint64_t v12 = v11[1];
      if ((_DWORD)v13)
      {
        uint64_t v14 = *v5;
        v15 = (char *)calloc(v11[1], 8uLL);
        if ((_DWORD)v12)
        {
          v16 = (_DWORD *)(v14 + v13);
          int v17 = v15 + 4;
          uint64_t v18 = v12;
          do
          {
            *(v17 - 1) = *v16;
            *int v17 = v16[1];
            v17 += 2;
            v16 += 2;
            --v18;
          }

          while (v18);
        }

        int v19 = &v5[2 * v10];
        v19[6] = v15;
        *((_DWORD *)v19 + 10) = v12;
        LODWORD(v9) = *((_DWORD *)v5 + 1036);
      }

      else
      {
        v20 = &v5[2 * v10];
        v20[6] = 0LL;
        *((_DWORD *)v20 + 10) = 0;
      }

      v11 += 2;
      size_t v9 = v9 + (v12 >> 1);
      *((_DWORD *)v5 + 1036) = v9;
      ++v10;
    }

    while (v10 != 256);
    uint64_t v21 = *((unsigned int *)v5 + 9);
    if ((_DWORD)v21)
    {
      uint64_t v22 = *v5;
      int v23 = calloc(v9, 4uLL);
      if ((_DWORD)v9)
      {
        uint64_t v24 = (int *)(v22 + v21);
        uint64_t v25 = v23;
        do
        {
          int v26 = *v24++;
          *v25++ = v26;
          --v9;
        }

        while (v9);
      }

      v5[517] = v23;
    }

    else
    {
      v5[517] = 0LL;
    }
  }

  return v5;
}

void cqdb_delete(void **a1)
{
  if (a1)
  {
    for (uint64_t i = 6LL; i != 518; i += 2LL)
      free(a1[i]);
    free(a1[517]);
    free(a1);
  }
}

uint64_t cqdb_to_id(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  unsigned int v5 = hashlittle((unsigned __int8 *)__s, v4 + 1, 0);
  int v6 = a1[2 * v5 + 5];
  if (!v6) {
    return 4294966273LL;
  }
  uint64_t v7 = a1[2 * v5 + 6];
  if (!v7) {
    return 4294966273LL;
  }
  unsigned int v8 = v5;
  uint64_t v9 = (v5 >> 8) % v6;
  uint64_t v10 = *(unsigned int *)(v7 + 8LL * v9 + 4);
  if (!(_DWORD)v10) {
    return 4294966273LL;
  }
  int v11 = (v5 >> 8) % v6;
  while (1)
  {
    if (*(_DWORD *)(v7 + 8 * v9) == v8)
    {
      uint64_t v12 = (const char *)(*a1 + v10);
      if (!strcmp(__s, v12 + 8)) {
        break;
      }
    }

    int v11 = (v11 + 1) % v6;
    uint64_t v9 = v11;
    uint64_t v10 = *(unsigned int *)(v7 + 8LL * v11 + 4);
    if (!(_DWORD)v10) {
      return 4294966273LL;
    }
  }

  return *(unsigned int *)v12;
}

uint64_t cqdb_to_string(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 4136);
  else {
    return 0LL;
  }
}

uint64_t cqdb_num(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4144);
}

uint64_t hashword(_DWORD *a1, unint64_t a2, int a3)
{
  uint64_t v3 = (a3 + 4 * a2 - 559038737);
  if (a2 < 4)
  {
    int v5 = a3 + 4 * a2 - 559038737;
    int v4 = v5;
  }

  else
  {
    int v4 = a3 + 4 * a2 - 559038737;
    int v5 = v4;
    do
    {
      int v6 = a1[1] + v4;
      int v7 = a1[2] + v3;
      int v8 = (*a1 + v5 - v7) ^ __ROR4__(v7, 28);
      int v9 = v7 + v6;
      int v10 = (v6 - v8) ^ __ROR4__(v8, 26);
      int v11 = v8 + v9;
      int v12 = (v9 - v10) ^ __ROR4__(v10, 24);
      int v13 = v10 + v11;
      int v14 = (v11 - v12) ^ __ROR4__(v12, 16);
      int v15 = v12 + v13;
      int v16 = (v13 - v14) ^ __ROR4__(v14, 13);
      int v5 = v14 + v15;
      uint64_t v3 = (v15 - v16) ^ __ROR4__(v16, 28);
      int v4 = v16 + v5;
      a2 -= 3LL;
      a1 += 3;
    }

    while (a2 > 3);
  }

  switch(a2)
  {
    case 1uLL:
      goto LABEL_11;
    case 2uLL:
LABEL_10:
      v4 += a1[1];
LABEL_11:
      HIDWORD(v17) = v4;
      LODWORD(v17) = v4;
      int v18 = (v3 ^ v4) - (v17 >> 18);
      HIDWORD(v17) = v18;
      LODWORD(v17) = v18;
      int v19 = ((*a1 + v5) ^ v18) - (v17 >> 21);
      HIDWORD(v17) = v19;
      LODWORD(v17) = v19;
      int v20 = (v19 ^ v4) - (v17 >> 7);
      HIDWORD(v17) = v20;
      LODWORD(v17) = v20;
      int v21 = (v20 ^ v18) - (v17 >> 16);
      HIDWORD(v17) = v21;
      LODWORD(v17) = v21;
      HIDWORD(v17) = (v21 ^ v19) - (v17 >> 28);
      LODWORD(v17) = HIDWORD(v17);
      HIDWORD(v17) = (HIDWORD(v17) ^ v20) - (v17 >> 18);
      LODWORD(v17) = HIDWORD(v17);
      return (HIDWORD(v17) ^ v21) - (v17 >> 8);
    case 3uLL:
      LODWORD(v3) = a1[2] + v3;
      goto LABEL_10;
  }

  return v3;
}

_DWORD *hashword2(_DWORD *result, unint64_t a2, int *a3, _DWORD *a4)
{
  int v4 = *a3 + 4 * a2 - 559038737;
  int v5 = v4 + *a4;
  int v6 = v4;
  if (a2 >= 4)
  {
    do
    {
      int v7 = result[1] + v4;
      int v8 = result[2] + v5;
      int v9 = (*result + v6 - v8) ^ __ROR4__(v8, 28);
      int v10 = v8 + v7;
      int v11 = (v7 - v9) ^ __ROR4__(v9, 26);
      int v12 = v9 + v10;
      int v13 = (v10 - v11) ^ __ROR4__(v11, 24);
      int v14 = v11 + v12;
      int v15 = (v12 - v13) ^ __ROR4__(v13, 16);
      int v16 = v13 + v14;
      int v17 = (v14 - v15) ^ __ROR4__(v15, 13);
      int v6 = v15 + v16;
      int v5 = (v16 - v17) ^ __ROR4__(v17, 28);
      int v4 = v17 + v6;
      a2 -= 3LL;
      result += 3;
    }

    while (a2 > 3);
  }

  switch(a2)
  {
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
LABEL_7:
      v4 += result[1];
LABEL_8:
      HIDWORD(v18) = v4;
      LODWORD(v18) = v4;
      int v19 = (v5 ^ v4) - (v18 >> 18);
      HIDWORD(v18) = v19;
      LODWORD(v18) = v19;
      int v20 = ((*result + v6) ^ v19) - (v18 >> 21);
      HIDWORD(v18) = v20;
      LODWORD(v18) = v20;
      int v21 = (v20 ^ v4) - (v18 >> 7);
      HIDWORD(v18) = v21;
      LODWORD(v18) = v21;
      int v22 = (v21 ^ v19) - (v18 >> 16);
      HIDWORD(v18) = v22;
      LODWORD(v18) = v22;
      HIDWORD(v18) = (v22 ^ v20) - (v18 >> 28);
      LODWORD(v18) = HIDWORD(v18);
      int v4 = (HIDWORD(v18) ^ v21) - (v18 >> 18);
      HIDWORD(v18) = v4;
      LODWORD(v18) = v4;
      int v5 = (v4 ^ v22) - (v18 >> 8);
      break;
    case 3uLL:
      v5 += result[2];
      goto LABEL_7;
  }

  *a3 = v5;
  *a4 = v4;
  return result;
}

uint64_t hashlittle(unsigned __int8 *a1, unint64_t a2, int a3)
{
  uint64_t v3 = (a2 + a3 - 559038737);
  if (a2 < 0xD)
  {
    int v5 = a2 + a3 - 559038737;
    int v4 = v5;
  }

  else
  {
    int v4 = a2 + a3 - 559038737;
    int v5 = v4;
    do
    {
      int v6 = v4 + a1[4] + (a1[5] << 8) + (a1[6] << 16) + (a1[7] << 24);
      int v7 = v3 + a1[8] + (a1[9] << 8) + (a1[10] << 16) + (a1[11] << 24);
      int v8 = (v5 + *a1 + (a1[1] << 8) + (a1[2] << 16) + (a1[3] << 24) - v7) ^ __ROR4__(v7, 28);
      int v9 = v7 + v6;
      int v10 = (v6 - v8) ^ __ROR4__(v8, 26);
      int v11 = v8 + v9;
      int v12 = (v9 - v10) ^ __ROR4__(v10, 24);
      int v13 = v10 + v11;
      int v14 = (v11 - v12) ^ __ROR4__(v12, 16);
      int v15 = v12 + v13;
      int v16 = (v13 - v14) ^ __ROR4__(v14, 13);
      int v5 = v14 + v15;
      uint64_t v3 = (v15 - v16) ^ __ROR4__(v16, 28);
      int v4 = v16 + v5;
      a2 -= 12LL;
      a1 += 12;
    }

    while (a2 > 0xC);
  }

  switch(a2)
  {
    case 0uLL:
      return v3;
    case 1uLL:
      goto LABEL_18;
    case 2uLL:
      goto LABEL_17;
    case 3uLL:
      goto LABEL_16;
    case 4uLL:
      goto LABEL_15;
    case 5uLL:
      goto LABEL_14;
    case 6uLL:
      goto LABEL_13;
    case 7uLL:
      goto LABEL_12;
    case 8uLL:
      goto LABEL_11;
    case 9uLL:
      goto LABEL_10;
    case 0xAuLL:
      goto LABEL_9;
    case 0xBuLL:
      goto LABEL_8;
    case 0xCuLL:
      LODWORD(v3) = v3 + (a1[11] << 24);
LABEL_8:
      LODWORD(v3) = v3 + (a1[10] << 16);
LABEL_9:
      LODWORD(v3) = v3 + (a1[9] << 8);
LABEL_10:
      LODWORD(v3) = v3 + a1[8];
LABEL_11:
      v4 += a1[7] << 24;
LABEL_12:
      v4 += a1[6] << 16;
LABEL_13:
      v4 += a1[5] << 8;
LABEL_14:
      v4 += a1[4];
LABEL_15:
      v5 += a1[3] << 24;
LABEL_16:
      v5 += a1[2] << 16;
LABEL_17:
      v5 += a1[1] << 8;
LABEL_18:
      v5 += *a1;
      break;
    default:
      break;
  }

  HIDWORD(v17) = v4;
  LODWORD(v17) = v4;
  int v18 = (v3 ^ v4) - (v17 >> 18);
  HIDWORD(v17) = v18;
  LODWORD(v17) = v18;
  int v19 = (v18 ^ v5) - (v17 >> 21);
  HIDWORD(v17) = v19;
  LODWORD(v17) = v19;
  int v20 = (v19 ^ v4) - (v17 >> 7);
  HIDWORD(v17) = v20;
  LODWORD(v17) = v20;
  int v21 = (v20 ^ v18) - (v17 >> 16);
  HIDWORD(v17) = v21;
  LODWORD(v17) = v21;
  HIDWORD(v17) = (v21 ^ v19) - (v17 >> 28);
  LODWORD(v17) = HIDWORD(v17);
  HIDWORD(v17) = (HIDWORD(v17) ^ v20) - (v17 >> 18);
  LODWORD(v17) = HIDWORD(v17);
  return (HIDWORD(v17) ^ v21) - (v17 >> 8);
}

unsigned __int8 *hashlittle2(unsigned __int8 *result, unint64_t a2, int *a3, _DWORD *a4)
{
  int v4 = a2 - 559038737 + *a3;
  int v5 = v4 + *a4;
  int v6 = v4;
  if (a2 >= 0xD)
  {
    do
    {
      int v7 = v4 + result[4] + (result[5] << 8) + (result[6] << 16) + (result[7] << 24);
      int v8 = v5 + result[8] + (result[9] << 8) + (result[10] << 16) + (result[11] << 24);
      int v9 = (v6 + *result + (result[1] << 8) + (result[2] << 16) + (result[3] << 24) - v8) ^ __ROR4__(v8, 28);
      int v10 = v8 + v7;
      int v11 = (v7 - v9) ^ __ROR4__(v9, 26);
      int v12 = v9 + v10;
      int v13 = (v10 - v11) ^ __ROR4__(v11, 24);
      int v14 = v11 + v12;
      int v15 = (v12 - v13) ^ __ROR4__(v13, 16);
      int v16 = v13 + v14;
      int v17 = (v14 - v15) ^ __ROR4__(v15, 13);
      int v6 = v15 + v16;
      int v5 = (v16 - v17) ^ __ROR4__(v17, 28);
      int v4 = v17 + v6;
      a2 -= 12LL;
      result += 12;
    }

    while (a2 > 0xC);
  }

  switch(a2)
  {
    case 0uLL:
      goto LABEL_17;
    case 1uLL:
      goto LABEL_15;
    case 2uLL:
      goto LABEL_14;
    case 3uLL:
      goto LABEL_13;
    case 4uLL:
      goto LABEL_12;
    case 5uLL:
      goto LABEL_11;
    case 6uLL:
      goto LABEL_10;
    case 7uLL:
      goto LABEL_9;
    case 8uLL:
      goto LABEL_8;
    case 9uLL:
      goto LABEL_7;
    case 0xAuLL:
      goto LABEL_6;
    case 0xBuLL:
      goto LABEL_5;
    case 0xCuLL:
      v5 += result[11] << 24;
LABEL_5:
      v5 += result[10] << 16;
LABEL_6:
      v5 += result[9] << 8;
LABEL_7:
      v5 += result[8];
LABEL_8:
      v4 += result[7] << 24;
LABEL_9:
      v4 += result[6] << 16;
LABEL_10:
      v4 += result[5] << 8;
LABEL_11:
      v4 += result[4];
LABEL_12:
      v6 += result[3] << 24;
LABEL_13:
      v6 += result[2] << 16;
LABEL_14:
      v6 += result[1] << 8;
LABEL_15:
      v6 += *result;
      break;
    default:
      break;
  }

  HIDWORD(v18) = v4;
  LODWORD(v18) = v4;
  int v19 = (v5 ^ v4) - (v18 >> 18);
  HIDWORD(v18) = v19;
  LODWORD(v18) = v19;
  int v20 = (v19 ^ v6) - (v18 >> 21);
  HIDWORD(v18) = v20;
  LODWORD(v18) = v20;
  int v21 = (v20 ^ v4) - (v18 >> 7);
  HIDWORD(v18) = v21;
  LODWORD(v18) = v21;
  int v22 = (v21 ^ v19) - (v18 >> 16);
  HIDWORD(v18) = v22;
  LODWORD(v18) = v22;
  HIDWORD(v18) = (v22 ^ v20) - (v18 >> 28);
  LODWORD(v18) = HIDWORD(v18);
  int v4 = (HIDWORD(v18) ^ v21) - (v18 >> 18);
  HIDWORD(v18) = v4;
  LODWORD(v18) = v4;
  int v5 = (v4 ^ v22) - (v18 >> 8);
LABEL_17:
  *a3 = v5;
  *a4 = v4;
  return result;
}

uint64_t hashbig(unsigned __int8 *a1, unint64_t a2, int a3)
{
  uint64_t v3 = (a2 + a3 - 559038737);
  if (a2 < 0xD)
  {
    int v5 = a2 + a3 - 559038737;
    int v4 = v5;
  }

  else
  {
    int v4 = a2 + a3 - 559038737;
    int v5 = v4;
    do
    {
      int v6 = v4 + (a1[4] << 24) + (a1[5] << 16) + (a1[6] << 8) + a1[7];
      int v7 = v3 + (a1[8] << 24) + (a1[9] << 16) + (a1[10] << 8) + a1[11];
      int v8 = (v5 + (*a1 << 24) + (a1[1] << 16) + (a1[2] << 8) + a1[3] - v7) ^ __ROR4__(v7, 28);
      int v9 = v7 + v6;
      int v10 = (v6 - v8) ^ __ROR4__(v8, 26);
      int v11 = v8 + v9;
      int v12 = (v9 - v10) ^ __ROR4__(v10, 24);
      int v13 = v10 + v11;
      int v14 = (v11 - v12) ^ __ROR4__(v12, 16);
      int v15 = v12 + v13;
      int v16 = (v13 - v14) ^ __ROR4__(v14, 13);
      int v5 = v14 + v15;
      uint64_t v3 = (v15 - v16) ^ __ROR4__(v16, 28);
      int v4 = v16 + v5;
      a2 -= 12LL;
      a1 += 12;
    }

    while (a2 > 0xC);
  }

  switch(a2)
  {
    case 0uLL:
      return v3;
    case 1uLL:
      goto LABEL_18;
    case 2uLL:
      goto LABEL_17;
    case 3uLL:
      goto LABEL_16;
    case 4uLL:
      goto LABEL_15;
    case 5uLL:
      goto LABEL_14;
    case 6uLL:
      goto LABEL_13;
    case 7uLL:
      goto LABEL_12;
    case 8uLL:
      goto LABEL_11;
    case 9uLL:
      goto LABEL_10;
    case 0xAuLL:
      goto LABEL_9;
    case 0xBuLL:
      goto LABEL_8;
    case 0xCuLL:
      LODWORD(v3) = v3 + a1[11];
LABEL_8:
      LODWORD(v3) = v3 + (a1[10] << 8);
LABEL_9:
      LODWORD(v3) = v3 + (a1[9] << 16);
LABEL_10:
      LODWORD(v3) = v3 + (a1[8] << 24);
LABEL_11:
      v4 += a1[7];
LABEL_12:
      v4 += a1[6] << 8;
LABEL_13:
      v4 += a1[5] << 16;
LABEL_14:
      v4 += a1[4] << 24;
LABEL_15:
      v5 += a1[3];
LABEL_16:
      v5 += a1[2] << 8;
LABEL_17:
      v5 += a1[1] << 16;
LABEL_18:
      v5 += *a1 << 24;
      break;
    default:
      break;
  }

  HIDWORD(v17) = v4;
  LODWORD(v17) = v4;
  int v18 = (v3 ^ v4) - (v17 >> 18);
  HIDWORD(v17) = v18;
  LODWORD(v17) = v18;
  int v19 = (v18 ^ v5) - (v17 >> 21);
  HIDWORD(v17) = v19;
  LODWORD(v17) = v19;
  int v20 = (v19 ^ v4) - (v17 >> 7);
  HIDWORD(v17) = v20;
  LODWORD(v17) = v20;
  int v21 = (v20 ^ v18) - (v17 >> 16);
  HIDWORD(v17) = v21;
  LODWORD(v17) = v21;
  HIDWORD(v17) = (v21 ^ v19) - (v17 >> 28);
  LODWORD(v17) = HIDWORD(v17);
  HIDWORD(v17) = (HIDWORD(v17) ^ v20) - (v17 >> 18);
  LODWORD(v17) = HIDWORD(v17);
  return (HIDWORD(v17) ^ v21) - (v17 >> 8);
}

uint64_t crf1dc_new(int a1, int a2, int a3)
{
  int v6 = calloc(1uLL, 0x70uLL);
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    *int v6 = a1;
    v6[1] = a2;
    size_t v8 = (a2 * a2);
    int v9 = calloc(v8, 8uLL);
    *(void *)(v7 + 32) = v9;
    if (!v9) {
      goto LABEL_9;
    }
    if ((*(_BYTE *)v7 & 2) != 0)
    {
      int v10 = posix_memalign(&__memptr, 0x10uLL, 8LL * (v8 + 4));
      int v11 = __memptr;
      if (v10) {
        int v11 = 0LL;
      }
      *(void *)(v7 + 88) = v11;
      if (!v11) {
        goto LABEL_9;
      }
      int v12 = calloc(v8, 8uLL);
      *(void *)(v7 + 104) = v12;
      if (!v12) {
        goto LABEL_9;
      }
    }

    if (!crf1dc_set_num_items(v7, a3))
    {
      *(_DWORD *)(v7 + 8) = 0;
    }

    else
    {
LABEL_9:
      crf1dc_delete((void **)v7);
      return 0LL;
    }
  }

  return v7;
}

uint64_t crf1dc_set_num_items(uint64_t a1, int a2)
{
  size_t v2 = *(int *)(a1 + 4);
  *(_DWORD *)(a1 + 8) = a2;
  if (*(_DWORD *)(a1 + 12) >= a2) {
    return 0LL;
  }
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 24));
  free(*(void **)(a1 + 96));
  free(*(void **)(a1 + 80));
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 40));
  int v5 = calloc((int)v2 * (uint64_t)a2, 8uLL);
  *(void *)(a1 + 40) = v5;
  if (!v5) {
    return 2147483649LL;
  }
  int v6 = calloc((int)v2 * (uint64_t)a2, 8uLL);
  *(void *)(a1 + 48) = v6;
  if (!v6) {
    return 2147483649LL;
  }
  uint64_t v7 = calloc(a2, 8uLL);
  *(void *)(a1 + 56) = v7;
  if (!v7) {
    return 2147483649LL;
  }
  size_t v8 = calloc(v2, 8uLL);
  *(void *)(a1 + 64) = v8;
  if (!v8) {
    return 2147483649LL;
  }
  if ((*(_BYTE *)a1 & 1) != 0)
  {
    int v9 = calloc((int)v2 * (uint64_t)a2, 4uLL);
    *(void *)(a1 + 72) = v9;
    if (!v9) {
      return 2147483649LL;
    }
  }

  int v10 = calloc((int)v2 * (uint64_t)a2, 8uLL);
  *(void *)(a1 + 24) = v10;
  if (!v10) {
    return 2147483649LL;
  }
  if ((*(_BYTE *)a1 & 2) != 0)
  {
    int v11 = posix_memalign(&__memptr, 0x10uLL, 8LL * ((int)v2 * a2 + 4));
    int v12 = __memptr;
    if (v11) {
      int v12 = 0LL;
    }
    *(void *)(a1 + 80) = v12;
    if (!v12) {
      return 2147483649LL;
    }
    int v13 = calloc((int)v2 * (uint64_t)a2, 8uLL);
    *(void *)(a1 + 96) = v13;
    if (!v13) {
      return 2147483649LL;
    }
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 12) = a2;
  return result;
}

void crf1dc_delete(void **a1)
{
  if (a1)
  {
    free(a1[9]);
    free(a1[12]);
    free(a1[10]);
    free(a1[3]);
    free(a1[7]);
    free(a1[8]);
    free(a1[6]);
    free(a1[5]);
    free(a1[13]);
    free(a1[11]);
    free(a1[4]);
  }

  free(a1);
}

void crf1dc_reset(uint64_t a1, char a2)
{
  int v4 = *(_DWORD *)(a1 + 4);
  int v5 = *(_DWORD *)(a1 + 8);
  if ((a2 & 1) != 0) {
    bzero(*(void **)(a1 + 24), 8LL * v4 * v5);
  }
  if ((a2 & 2) != 0) {
    bzero(*(void **)(a1 + 32), 8LL * (v4 * v4));
  }
  if ((*(_BYTE *)a1 & 2) != 0)
  {
    bzero(*(void **)(a1 + 96), 8LL * v4 * v5);
    bzero(*(void **)(a1 + 104), 8LL * (v4 * v4));
    *(void *)(a1 + 16) = 0LL;
  }

void crf1dc_exp_state(uint64_t a1)
{
  uint64_t v2 = (*(_DWORD *)(a1 + 4) * *(_DWORD *)(a1 + 8));
  memcpy(*(void **)(a1 + 80), *(const void **)(a1 + 24), 8LL * (int)v2);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = *(double **)(a1 + 80);
    do
    {
      *uint64_t v3 = exp(*v3);
      ++v3;
      --v2;
    }

    while (v2);
  }

void crf1dc_exp_transition(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 4);
  uint64_t v3 = (v2 * v2);
  memcpy(*(void **)(a1 + 88), *(const void **)(a1 + 32), 8 * v3);
  if (v2)
  {
    int v4 = *(double **)(a1 + 88);
    do
    {
      *int v4 = exp(*v4);
      ++v4;
      --v3;
    }

    while (v3);
  }

double crf1dc_alpha_score(uint64_t a1)
{
  int v2 = *(double **)(a1 + 56);
  uint64_t v3 = *(unsigned int *)(a1 + 8);
  uint64_t v4 = *(int *)(a1 + 4);
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  int v6 = *(double **)(a1 + 40);
  uint64_t v41 = 8 * v4;
  memcpy(v6, *(const void **)(a1 + 80), 8 * v4);
  if ((int)v4 <= 0)
  {
    *int v2 = 1.0;
  }

  else
  {
    double v7 = 0.0;
    size_t v8 = v6;
    uint64_t v9 = v5;
    do
    {
      double v10 = *v8++;
      double v7 = v7 + v10;
      --v9;
    }

    while (v9);
    if (v7 == 0.0) {
      double v11 = 1.0;
    }
    else {
      double v11 = 1.0 / v7;
    }
    *int v2 = v11;
    uint64_t v12 = v5;
    do
    {
      *int v6 = v11 * *v6;
      ++v6;
      --v12;
    }

    while (v12);
  }

  if ((int)v3 > 1)
  {
    int v13 = 1;
    do
    {
      ++v2;
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = *(_DWORD *)(a1 + 4);
      int v16 = v15 * v13;
      unint64_t v17 = (double *)(v14 + 8LL * v15 * v13);
      uint64_t v18 = *(void *)(a1 + 80);
      bzero(v17, v41);
      if ((int)v5 < 1)
      {
        *int v2 = 1.0;
      }

      else
      {
        uint64_t v19 = 0LL;
        int v20 = *(double **)(a1 + 88);
        uint64_t v21 = 8LL * *(int *)(a1 + 4);
        do
        {
          double v22 = *(double *)(v14 + 8LL * v15 * (v13 - 1) + 8 * v19);
          int v23 = v20;
          uint64_t v24 = (double *)(v14 + 8LL * v16);
          uint64_t v25 = v5;
          do
          {
            double v26 = *v23++;
            *uint64_t v24 = *v24 + v22 * v26;
            ++v24;
            --v25;
          }

          while (v25);
          ++v19;
          int v20 = (double *)((char *)v20 + v21);
        }

        while (v19 != v5);
        uint64_t v27 = (double *)(v18 + 8LL * v16);
        v28 = (double *)(v14 + 8LL * v16);
        uint64_t v29 = v5;
        do
        {
          double v30 = *v27++;
          double *v28 = v30 * *v28;
          ++v28;
          --v29;
        }

        while (v29);
        double v31 = 0.0;
        int v32 = (double *)(v14 + 8LL * v16);
        uint64_t v33 = v5;
        do
        {
          double v34 = *v32++;
          double v31 = v31 + v34;
          --v33;
        }

        while (v33);
        if (v31 == 0.0) {
          double v35 = 1.0;
        }
        else {
          double v35 = 1.0 / v31;
        }
        *int v2 = v35;
        uint64_t v36 = v5;
        do
        {
          *unint64_t v17 = v35 * *v17;
          ++v17;
          --v36;
        }

        while (v36);
      }

      ++v13;
    }

    while (v13 != (_DWORD)v3);
  }

  if ((int)v3 < 1)
  {
    double v38 = 0.0;
  }

  else
  {
    int v37 = *(double **)(a1 + 56);
    double v38 = 0.0;
    do
    {
      double v39 = *v37++;
      double v38 = v38 + log(v39);
      --v3;
    }

    while (v3);
  }

  double result = -v38;
  *(double *)(a1 + 16) = -v38;
  return result;
}

unsigned int *crf1dc_beta_score(unsigned int *result)
{
  v1 = result;
  int v2 = result[2];
  uint64_t v3 = result[1];
  uint64_t v4 = (void *)*((void *)result + 8);
  int v5 = v2 - 1;
  int v6 = (double *)(*((void *)result + 7) + 8LL * (v2 - 1));
  uint64_t v32 = (int)result[1];
  if ((int)v32 >= 1)
  {
    double v7 = (double *)(*((void *)result + 6) + 8LL * (int)v32 * v5);
    double v8 = *v6;
    uint64_t v9 = result[1];
    do
    {
      *v7++ = v8;
      --v9;
    }

    while (v9);
  }

  if (v2 > 1)
  {
    int v10 = v2 - 2;
    do
    {
      --v6;
      uint64_t v11 = *((void *)v1 + 6);
      unsigned int v12 = v1[1];
      uint64_t v13 = *((void *)v1 + 10);
      double result = (unsigned int *)memcpy(v4, (const void *)(v11 + 8LL * (int)(v12 + v12 * v10)), 8 * v32);
      if ((int)v3 >= 1)
      {
        uint64_t v14 = (double *)(v11 + 8LL * (int)(v12 * v10));
        int v15 = (double *)(v13 + 8LL * (int)(v12 * v5));
        int v16 = (double *)v4;
        uint64_t v17 = v3;
        do
        {
          double v18 = *v15++;
          double *v16 = v18 * *v16;
          ++v16;
          --v17;
        }

        while (v17);
        if ((int)v32 >= 1)
        {
          uint64_t v19 = 0LL;
          int v20 = (double *)*((void *)v1 + 11);
          uint64_t v21 = 8LL * (int)v1[1];
          do
          {
            double v22 = 0.0;
            int v23 = v20;
            uint64_t v24 = (double *)v4;
            uint64_t v25 = v3;
            do
            {
              double v26 = *v23++;
              double v27 = v26;
              double v28 = *v24++;
              double v22 = v22 + v27 * v28;
              --v25;
            }

            while (v25);
            v14[v19++] = v22;
            int v20 = (double *)((char *)v20 + v21);
          }

          while (v19 != v3);
          double v29 = *v6;
          uint64_t v30 = v3;
          do
          {
            *uint64_t v14 = v29 * *v14;
            ++v14;
            --v30;
          }

          while (v30);
        }
      }

      --v5;
    }

    while (v10-- > 0);
  }

  return result;
}

unsigned int *crf1dc_marginals(unsigned int *result)
{
  uint64_t v1 = result[2];
  if ((int)v1 >= 1)
  {
    int v2 = result;
    uint64_t v3 = 0LL;
    uint64_t v4 = result[1];
    do
    {
      int v5 = v2[1] * v3;
      uint64_t v6 = *((void *)v2 + 6);
      double v7 = (double *)(*((void *)v2 + 12) + 8LL * v5);
      double result = (unsigned int *)memcpy(v7, (const void *)(*((void *)v2 + 5) + 8LL * v5), 8LL * (int)v4);
      if ((int)v4 >= 1)
      {
        double v8 = (double *)(v6 + 8LL * v5);
        uint64_t v9 = v7;
        uint64_t v10 = v4;
        do
        {
          double v11 = *v8++;
          *uint64_t v9 = v11 * *v9;
          ++v9;
          --v10;
        }

        while (v10);
        double v12 = 1.0 / *(double *)(*((void *)v2 + 7) + 8 * v3);
        uint64_t v13 = v4;
        do
        {
          *double v7 = v12 * *v7;
          ++v7;
          --v13;
        }

        while (v13);
      }

      ++v3;
    }

    while (v3 != v1);
    if ((int)v1 >= 2)
    {
      int v14 = 0;
      int v36 = v1 - 2;
      int v15 = 1;
      do
      {
        unsigned int v16 = v2[1];
        uint64_t v17 = *((void *)v2 + 10);
        uint64_t v18 = *((void *)v2 + 5);
        uint64_t v19 = (void *)*((void *)v2 + 8);
        double result = (unsigned int *)memcpy( v19,  (const void *)(*((void *)v2 + 6) + 8LL * (int)(v16 * (v14 + 1))),  8LL * (int)v4);
        if ((int)v4 >= 1)
        {
          int v20 = (double *)(v17 + 8LL * (int)(v16 * v15));
          uint64_t v21 = (double *)v19;
          uint64_t v22 = v4;
          do
          {
            double v23 = *v20++;
            *uint64_t v21 = v23 * *v21;
            ++v21;
            --v22;
          }

          while (v22);
          uint64_t v24 = 0LL;
          uint64_t v25 = (double *)*((void *)v2 + 11);
          double v26 = (double *)*((void *)v2 + 13);
          uint64_t v27 = 8LL * (int)v2[1];
          do
          {
            uint64_t v28 = v4;
            double v29 = v25;
            uint64_t v30 = (double *)v19;
            double v31 = v26;
            do
            {
              double v32 = *v29++;
              double v33 = v32;
              double v34 = *v30++;
              *double v31 = *v31 + *(double *)(v18 + 8LL * (int)(v16 * v14) + 8 * v24) * v33 * v34;
              ++v31;
              --v28;
            }

            while (v28);
            ++v24;
            double v26 = (double *)((char *)v26 + v27);
            uint64_t v25 = (double *)((char *)v25 + v27);
          }

          while (v24 != v4);
        }

        ++v15;
      }

      while (v14++ != v36);
    }
  }

  return result;
}

double crf1dc_marginal_point(uint64_t a1, int a2, int a3)
{
  return *(double *)(*(void *)(a1 + 40) + 8LL * *(_DWORD *)(a1 + 4) * a3 + 8LL * a2)
}

double crf1dc_marginal_path(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4 = *(int *)(a1 + 4);
  uint64_t v5 = *(int *)(a2 + 4LL * a3);
  uint64_t v6 = *(void *)(a1 + 56);
  double result = *(double *)(*(void *)(a1 + 40) + 8LL * (int)v4 * a3 + 8 * v5)
  if (a4 - 1 > a3)
  {
    double v8 = (double *)(v6 + 8LL * a3);
    uint64_t v9 = ~(uint64_t)a3 + a4;
    uint64_t v10 = (int *)(a2 + 4LL * a3 + 4);
    uint64_t v11 = *(void *)(a1 + 80) + 8 * (v4 + (int)v4 * (uint64_t)a3);
    do
    {
      int v12 = v5 * v4;
      uint64_t v13 = *v10++;
      LODWORD(v5) = v13;
      double v14 = *(double *)(*(void *)(a1 + 88) + 8LL * v12 + 8 * v13) * *(double *)(v11 + 8 * v13);
      double v15 = *v8++;
      double result = result * (v14 * v15);
      v11 += 8 * v4;
      --v9;
    }

    while (v9);
  }

  return result;
}

double crf1dc_score(uint64_t a1, int *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  uint64_t v3 = *a2;
  uint64_t v4 = *(void *)(a1 + 24);
  double result = *(double *)(v4 + 8 * v3);
  if ((int)v2 >= 2)
  {
    uint64_t v6 = *(int *)(a1 + 4);
    uint64_t v7 = v4 + 8 * v6;
    double v8 = a2 + 1;
    uint64_t v9 = v2 - 1;
    do
    {
      uint64_t v10 = *v8++;
      double result = result
      v7 += 8 * v6;
      LODWORD(v3) = v10;
      --v9;
    }

    while (v9);
  }

  return result;
}

double crf1dc_lognorm(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

uint64_t crf1dc_viterbi(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(result + 4);
  uint64_t v3 = *(int *)(result + 8);
  uint64_t v4 = *(void *)(result + 40);
  uint64_t v5 = *(void *)(result + 24);
  if ((int)v2 >= 1)
  {
    uint64_t v6 = *(unsigned int *)(result + 4);
    uint64_t v7 = *(uint64_t **)(result + 24);
    double v8 = *(void **)(result + 40);
    do
    {
      uint64_t v9 = *v7++;
      *v8++ = v9;
      --v6;
    }

    while (v6);
  }

  int v10 = v2;
  if ((int)v3 > 1)
  {
    int v11 = 0;
    uint64_t v12 = *(void *)(result + 72);
    int v13 = 1;
    do
    {
      if ((int)v2 >= 1)
      {
        uint64_t v14 = 0LL;
        int v15 = *(_DWORD *)(result + 4);
        uint64_t v16 = v4 + 8LL * v15 * v13;
        uint64_t v17 = v5 + 8LL * v15 * v13;
        uint64_t v18 = v12 + 4LL * v15 * v13;
        uint64_t v19 = *(void *)(result + 32);
        uint64_t v20 = v4 + 8LL * v15 * v11;
        do
        {
          uint64_t v21 = 0LL;
          double v22 = -1.79769313e308;
          do
          {
            double v23 = *(double *)(v20 + 8 * v21) + *(double *)(v19 + 8 * v14 + 8LL * *(_DWORD *)(result + 4) * (int)v21);
            if (v22 < v23)
            {
              *(_DWORD *)(v18 + 4 * v14) = v21;
              double v22 = v23;
            }

            ++v21;
          }

          while (v2 != v21);
          *(double *)(v16 + 8 * v14) = v22 + *(double *)(v17 + 8 * v14);
          ++v14;
        }

        while (v14 != v2);
      }

      ++v13;
      ++v11;
    }

    while (v13 != (_DWORD)v3);
    int v10 = *(_DWORD *)(result + 4);
  }

  if ((int)v2 >= 1)
  {
    uint64_t v24 = 0LL;
    uint64_t v25 = v4 + 8LL * v10 * ((int)v3 - 1);
    double v26 = -1.79769313e308;
    do
    {
      double v27 = *(double *)(v25 + 8 * v24);
      if (v26 < v27)
      {
        *(_DWORD *)(a2 + 4 * (v3 - 1)) = v24;
        double v26 = v27;
      }

      ++v24;
    }

    while (v2 != v24);
  }

  if ((int)v3 > 1)
  {
    uint64_t v28 = *(void *)(result + 72);
    uint64_t v29 = 4LL * (v3 - 2);
    int v30 = v3 - 1;
    do
    {
      *(_DWORD *)(a2 + v29) = *(_DWORD *)(v28 + 4LL * *(_DWORD *)(result + 4) * v30 + 4LL * *(int *)(a2 + v29 + 4));
      v29 -= 4LL;
      --v30;
    }

    while (v29 != -4);
  }

  return result;
}

uint64_t crf1dc_debug_context(FILE *a1)
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  uint64_t v2 = crf1dc_new(2, 3, 3);
  uint64_t v3 = *(void *)(v2 + 80);
  *(_OWORD *)uint64_t v3 = xmmword_18744C5A0;
  *(void *)(v3 + 16) = 0x3FB999999999999ALL;
  uint64_t v4 = *(int *)(v2 + 4);
  uint64_t v5 = v3 + 8 * v4;
  *(void *)uint64_t v5 = 0x3FD999999999999ALL;
  *(_OWORD *)(v5 + 8) = xmmword_18744C5B0;
  uint64_t v6 = v3 + 16 * v4;
  *(void *)uint64_t v6 = 0x3FD999999999999ALL;
  *(_OWORD *)(v6 + 8) = xmmword_18744C5B0;
  uint64_t v7 = *(void *)(v2 + 88);
  *(_OWORD *)uint64_t v7 = xmmword_18744C5C0;
  *(void *)(v7 + 16) = 0x3FD999999999999ALL;
  uint64_t v8 = v7 + 8 * v4;
  *(void *)uint64_t v8 = 0x3FE3333333333333LL;
  *(_OWORD *)(v8 + 8) = xmmword_18744C5D0;
  uint64_t v9 = v7 + 16 * v4;
  *(void *)uint64_t v9 = 0x3FE0000000000000LL;
  *(_OWORD *)(v9 + 8) = xmmword_18744C5D0;
  *(_DWORD *)(v2 + 8) = *(_DWORD *)(v2 + 12);
  crf1dc_alpha_score(v2);
  crf1dc_beta_score((unsigned int *)v2);
  uint64_t v10 = 0LL;
  uint64_t v11 = *(void *)(v2 + 80);
  uint64_t v12 = *(void *)(v2 + 88);
  uint64_t v13 = *(int *)(v2 + 4);
  uint64_t v14 = v88;
  do
  {
    uint64_t v15 = 0LL;
    double v16 = *(double *)(v11 + 8 * v10);
    uint64_t v17 = v14;
    uint64_t v18 = v12;
    do
    {
      uint64_t v19 = 0LL;
      double v20 = v16 * *(double *)(v12 + 8 * v10 * v13 + 8 * v15) * *(double *)(v11 + 8 * v13 + 8 * v15);
      do
      {
        *(double *)&v17[v19] = v20 * *(double *)(v18 + v19) * *(double *)(v11 + 16 * v13 + v19);
        v19 += 8LL;
      }

      while (v19 != 24);
      ++v15;
      v18 += 8 * v13;
      v17 += 24;
    }

    while (v15 != 3);
    ++v10;
    v14 += 72;
  }

  while (v10 != 3);
  uint64_t v21 = 0LL;
  double v22 = 0.0;
  double v23 = v88;
  do
  {
    uint64_t v24 = 0LL;
    uint64_t v25 = v23;
    do
    {
      for (uint64_t i = 0LL; i != 24; i += 8LL)
        double v22 = v22 + *(double *)&v25[i];
      ++v24;
      v25 += 24;
    }

    while (v24 != 3);
    ++v21;
    v23 += 72;
  }

  while (v21 != 3);
  fwrite("Check for the partition factor... ", 0x22uLL, 1uLL, a1);
  double v27 = exp(*(double *)(v2 + 16));
  check_values(a1, v27, v22);
  uint64_t v28 = 0LL;
  uint64_t v29 = v88;
  do
  {
    uint64_t v30 = 0LL;
    double v31 = v29;
    do
    {
      for (uint64_t j = 0LL; j != 3; ++j)
      {
        v87[0] = v28;
        v87[1] = v30;
        v87[2] = j;
        double v33 = crf1dc_score(v2, v87) - *(double *)(v2 + 16);
        fprintf(a1, "Check for the sequence %d-%d-%d... ", v28, v30, j);
        double v34 = exp(v33);
        check_values(a1, v34, *(double *)&v31[8 * j] / v22);
      }

      ++v30;
      v31 += 24;
    }

    while (v30 != 3);
    ++v28;
    v29 += 72;
  }

  while (v28 != 3);
  uint64_t v35 = 0LL;
  int v36 = v88;
  do
  {
    uint64_t v37 = 0LL;
    double v38 = 0.0;
    double v39 = v36;
    do
    {
      for (uint64_t k = 0LL; k != 24; k += 8LL)
        double v38 = v38 + *(double *)&v39[k];
      ++v37;
      v39 += 24;
    }

    while (v37 != 3);
    double v41 = *(double *)(*(void *)(v2 + 40) + 8 * v35);
    double v42 = *(double *)(*(void *)(v2 + 48) + 8 * v35);
    double v43 = 1.0 / **(double **)(v2 + 56);
    fprintf(a1, "Check for the marginal probability (0,%d)... ", v35);
    check_values(a1, v41 * v42 * v43, v38 / v22);
    ++v35;
    v36 += 72;
  }

  while (v35 != 3);
  uint64_t v44 = 0LL;
  v45 = v88;
  do
  {
    uint64_t v46 = 0LL;
    double v47 = 0.0;
    v48 = v45;
    do
    {
      for (uint64_t m = 0LL; m != 24; m += 8LL)
        double v47 = v47 + *(double *)&v48[m];
      ++v46;
      v48 += 72;
    }

    while (v46 != 3);
    uint64_t v50 = *(int *)(v2 + 4);
    double v51 = *(double *)(*(void *)(v2 + 40) + 8 * v50 + 8 * v44);
    double v52 = *(double *)(*(void *)(v2 + 48) + 8 * v50 + 8 * v44);
    double v53 = 1.0 / *(double *)(*(void *)(v2 + 56) + 8LL);
    fprintf(a1, "Check for the marginal probability (1,%d)... ", v44);
    check_values(a1, v51 * v52 * v53, v47 / v22);
    ++v44;
    v45 += 24;
  }

  while (v44 != 3);
  uint64_t v54 = 0LL;
  v55 = v88;
  do
  {
    uint64_t v56 = 0LL;
    double v57 = 0.0;
    v58 = v55;
    do
    {
      for (uint64_t n = 0LL; n != 72; n += 24LL)
        double v57 = v57 + *(double *)&v58[n];
      ++v56;
      v58 += 72;
    }

    while (v56 != 3);
    uint64_t v60 = *(int *)(v2 + 4);
    double v61 = *(double *)(*(void *)(v2 + 40) + 16 * v60 + 8 * v54);
    double v62 = *(double *)(*(void *)(v2 + 48) + 16 * v60 + 8 * v54);
    double v63 = 1.0 / *(double *)(*(void *)(v2 + 56) + 16LL);
    fprintf(a1, "Check for the marginal probability (2,%d)... ", v54);
    check_values(a1, v61 * v62 * v63, v57 / v22);
    ++v54;
    v55 += 8;
  }

  while (v54 != 3);
  uint64_t v64 = 0LL;
  v65 = v88;
  do
  {
    uint64_t v66 = 0LL;
    v67 = v65;
    do
    {
      uint64_t v68 = 0LL;
      double v69 = 0.0;
      do
      {
        double v69 = v69 + *(double *)&v67[v68];
        v68 += 8LL;
      }

      while (v68 != 24);
      uint64_t v70 = *(int *)(v2 + 4);
      double v71 = *(double *)(*(void *)(v2 + 40) + 8 * v64);
      double v72 = *(double *)(*(void *)(v2 + 48) + 8 * v70 + 8 * v66);
      double v73 = *(double *)(*(void *)(v2 + 80) + 8 * v70 + 8 * v66);
      double v74 = *(double *)(*(void *)(v2 + 88) + 8LL * (int)v70 * (int)v64 + 8 * v66);
      fprintf(a1, "Check for the marginal probability (0,%d)-(1,%d)... ", v64, v66);
      check_values(a1, v72 * (v73 * (v71 * v74)), v69 / v22);
      ++v66;
      v67 += 24;
    }

    while (v66 != 3);
    ++v64;
    v65 += 72;
  }

  while (v64 != 3);
  uint64_t v75 = 0LL;
  v76 = v88;
  do
  {
    uint64_t v77 = 0LL;
    v78 = v76;
    do
    {
      uint64_t v79 = 0LL;
      double v80 = 0.0;
      do
      {
        double v80 = v80 + *(double *)&v78[v79];
        v79 += 72LL;
      }

      while (v79 != 216);
      uint64_t v81 = *(int *)(v2 + 4);
      double v82 = *(double *)(*(void *)(v2 + 40) + 8 * v81 + 8 * v75);
      double v83 = *(double *)(*(void *)(v2 + 48) + 16 * v81 + 8 * v77);
      double v84 = *(double *)(*(void *)(v2 + 80) + 16 * v81 + 8 * v77);
      double v85 = *(double *)(*(void *)(v2 + 88) + 8LL * (int)v81 * (int)v75 + 8 * v77);
      fprintf(a1, "Check for the marginal probability (1,%d)-(2,%d)... ", v75, v77);
      uint64_t result = check_values(a1, v83 * (v84 * (v82 * v85)), v80 / v22);
      ++v77;
      v78 += 8;
    }

    while (v77 != 3);
    ++v75;
    v76 += 24;
  }

  while (v75 != 3);
  return result;
}

uint64_t check_values(FILE *a1, double a2, double a3)
{
  if (vabdd_f64(a2, a3) >= 0.000000001) {
    return fprintf(a1, "FAIL: %f (%f)\n");
  }
  else {
    return fprintf(a1, "OK (%f)\n");
  }
}

void *crf1d_create_encoder()
{
  v0 = calloc(1uLL, 0xA0uLL);
  if (v0)
  {
    uint64_t v1 = calloc(1uLL, 0x40uLL);
    if (v1)
    {
      v1[1] = 0u;
      v1[2] = 0u;
      _OWORD *v1 = 0u;
      v0[7] = encoder_exchange_options;
      v0[8] = encoder_initialize;
      v0[17] = encoder_save_model;
      v0[18] = encoder_save_model_to_file_pointer;
      v0[9] = encoder_objective_and_gradients_batch;
      v0[10] = encoder_features_on_path;
      v0[11] = encoder_set_weights;
      v0[12] = encoder_set_instance;
      v0[13] = encoder_score;
      v0[14] = encoder_viterbi;
      v0[15] = encoder_partition_factor;
      v0[16] = encoder_objective_and_gradients;
      void *v0 = v1;
      v0[19] = encoder_release;
    }
  }

  return v0;
}

uint64_t encoder_exchange_options(uint64_t *a1, uint64_t a2, int a3)
{
  uint64_t v4 = *a1;
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a2 + 96))(a2, "feature.minfreq", v4 + 48);
    (*(void (**)(uint64_t, const char *, uint64_t))(a2 + 88))(a2, "feature.possible_states", v4 + 56);
    (*(void (**)(uint64_t, const char *, uint64_t))(a2 + 88))(a2, "feature.possible_transitions", v4 + 60);
  }

  else if (a3)
  {
    (*(void (**)(uint64_t, const char *, double))(a2 + 72))(a2, "feature.minfreq", *(double *)(v4 + 48));
    (*(void (**)(uint64_t, const char *, void))(a2 + 64))( a2,  "feature.possible_states",  *(unsigned int *)(v4 + 56));
    (*(void (**)(uint64_t, const char *, void))(a2 + 64))( a2,  "feature.possible_transitions",  *(unsigned int *)(v4 + 60));
  }

  else
  {
    params_add_float((int **)a2, "feature.minfreq", "The minimum frequency of features.", 0.0);
    params_add_int((int **)a2, "feature.possible_states", 0, "Force to generate possible state features.");
    params_add_int((int **)a2, "feature.possible_transitions", 0, "Force to generate possible transition features.");
  }

  return 0LL;
}

uint64_t encoder_initialize(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a1;
  int v7 = *(_DWORD *)(a2 + 20);
  uint64_t v8 = *(unsigned int *)(a2 + 24);
  int v9 = *(_DWORD *)(a2 + 16);
  *(void *)(v6 + 40) = 0LL;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_DWORD *)uint64_t v6 = v7;
  *(_DWORD *)(v6 + 4) = v8;
  if (v9 < 1)
  {
    int v11 = 0;
  }

  else
  {
    int v10 = 0;
    int v11 = 0;
    do
    {
      int v12 = *(_DWORD *)dataset_get((void *)a2, v10);
      if (v11 <= v12) {
        int v11 = v12;
      }
      ++v10;
    }

    while (v9 != v10);
  }

  uint64_t v13 = crf1dc_new(3, v7, v11);
  *(void *)(v6 + 40) = v13;
  if (!v13) {
    goto LABEL_13;
  }
  logging(a3, (uint64_t)"Feature generation\n", v14, v15, v16, v17, v18, v19, v67);
  logging(a3, (uint64_t)"type: CRF1d\n", v20, v21, v22, v23, v24, v25, v68);
  logging(a3, (uint64_t)"feature.minfreq: %f\n", v26, v27, v28, v29, v30, v31, *(void *)(v6 + 48));
  logging(a3, (uint64_t)"feature.possible_states: %d\n", v32, v33, v34, v35, v36, v37, *(unsigned int *)(v6 + 56));
  logging(a3, (uint64_t)"feature.possible_transitions: %d\n", v38, v39, v40, v41, v42, v43, *(unsigned int *)(v6 + 60));
  clock_t v44 = clock();
  v45 = crf1df_generate( v6 + 12,  a2,  v7,  *(double *)(v6 + 48),  v8,  *(_DWORD *)(v6 + 56) != 0,  *(_DWORD *)(v6 + 60) != 0,  a3[1],  *a3);
  *(void *)(v6 + 16) = v45;
  if (!v45) {
    goto LABEL_13;
  }
  logging(a3, (uint64_t)"Number of features: %d\n", v46, v47, v48, v49, v50, v51, *(unsigned int *)(v6 + 12));
  clock_t v52 = clock();
  logging( a3,  (uint64_t)"Seconds required: %.3f\n",  v53,  v54,  v55,  v56,  v57,  v58,  COERCE__INT64((double)(v52 - v44) / 1000000.0));
  logging(a3, (uint64_t)"\n", v59, v60, v61, v62, v63, v64, v69);
  crf1df_init_references((void ***)(v6 + 24), (void ***)(v6 + 32), *(void *)(v6 + 16), *(_DWORD *)(v6 + 12), v8, v7);
  if (*(void *)(v6 + 24) && *(void *)(v6 + 32))
  {
    uint64_t result = 0LL;
  }

  else
  {
LABEL_13:
    crf1de_finish((int *)v6);
    uint64_t result = 2147483649LL;
  }

  a1[3] = a2;
  int v66 = *(_DWORD *)(*(void *)(v6 + 40) + 12LL);
  *((_DWORD *)a1 + 11) = *(_DWORD *)(v6 + 12);
  *((_DWORD *)a1 + 12) = v66;
  return result;
}

uint64_t encoder_objective_and_gradients_batch(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, uint64_t a5)
{
  int v9 = *(void **)a1;
  int v10 = *(_DWORD *)(a2 + 16);
  uint64_t v11 = *(unsigned int *)(*(void *)a1 + 12LL);
  if ((int)v11 >= 1)
  {
    int v12 = (double *)(v9[2] + 16LL);
    uint64_t v13 = (double *)a5;
    do
    {
      double v14 = *v12;
      v12 += 3;
      *v13++ = -v14;
      --v11;
    }

    while (v11);
  }

  crf1dc_reset(v9[5], 2);
  crf1de_transition_score(v9, a3);
  crf1dc_exp_transition(v9[5]);
  if (v10 < 1)
  {
    double v16 = 0.0;
  }

  else
  {
    int v15 = 0;
    double v16 = 0.0;
    do
    {
      uint64_t v17 = dataset_get((void *)a2, v15);
      crf1dc_set_num_items(v9[5], *(_DWORD *)v17);
      crf1dc_reset(v9[5], 1);
      crf1de_state_score(v9, (unsigned int *)v17, a3);
      crf1dc_exp_state(v9[5]);
      crf1dc_alpha_score(v9[5]);
      crf1dc_beta_score((unsigned int *)v9[5]);
      crf1dc_marginals((unsigned int *)v9[5]);
      double v18 = crf1dc_score(v9[5], *(int **)(v17 + 16));
      double v16 = v16 + v18 - crf1dc_lognorm(v9[5]);
      crf1de_model_expectation(v9, (unsigned int *)v17, a5, 1.0);
      ++v15;
    }

    while (v10 != v15);
  }

  *a4 = -v16;
  return 0LL;
}

uint64_t encoder_save_model(uint64_t a1, const char *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(unsigned int **)a1;
  uint64_t v7 = **(void **)(a1 + 24);
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v9 = *(void *)(v7 + 24);
  int v10 = crf1mmw(a2);
  if (!v10) {
    return 2147483652LL;
  }
  int v12 = (unsigned int *)v10;
  uint64_t v13 = crf1de_write_model(v6, v10, a3, v8, v9, a4, 0LL, v11);
  crf1dmw_close(v12);
  return v13;
}

uint64_t encoder_save_model_to_file_pointer( unsigned int **a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9 = *a1;
  uint64_t v10 = *(void *)a1[3];
  uint64_t v11 = *(void *)(v10 + 16);
  if ((a5 & 1) != 0)
  {
    if (v11)
    {
      fwrite( "Warning: attributes will not be stored, because crfsuite_training_do_not_store_attributes is specified.\n",  0x6AuLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
      uint64_t v10 = *(void *)a1[3];
    }
  }

  else if (!v11)
  {
    int v12 = (FILE *)*MEMORY[0x1895F89D0];
    uint64_t v13 = "Error: missing attribute dictionary.\n";
    size_t v14 = 37LL;
LABEL_15:
    fwrite(v13, v14, 1uLL, v12);
    return 2147483651LL;
  }

  uint64_t v16 = *(void *)(v10 + 24);
  if (!v16)
  {
    int v12 = (FILE *)*MEMORY[0x1895F89D0];
    uint64_t v13 = "Error: missing label dictionary.\n";
    size_t v14 = 33LL;
    goto LABEL_15;
  }

  if ((a5 & 0x14) == 0)
  {
    uint64_t v24 = *(void *)(v10 + 16);
    uint64_t v25 = (unsigned int *)crf1mmw_from_file_pointer(a2);
    if (v25)
    {
      uint64_t v27 = v25;
      uint64_t v28 = crf1de_write_model(v9, v25, a3, v24, v16, a4, a5, v26);
      crf1dmw_close(v27);
      return v28;
    }

    return 2147483652LL;
  }

  if ((~(_DWORD)a5 & 3) != 0)
  {
    int v12 = (FILE *)*MEMORY[0x1895F89D0];
    uint64_t v13 = "To use compact or quantized format, you must store attributes and labels out side of crfsuite model.\n";
    size_t v14 = 101LL;
    goto LABEL_15;
  }

  if ((a5 & 4) != 0) {
    compact_model_writer_from_file_pointer = create_compact_model_writer_from_file_pointer(a2);
  }
  else {
    compact_model_writer_from_file_pointer = create_quantized_model_writer_from_file_pointer(a2);
  }
  uint64_t v30 = (void (**)(void))compact_model_writer_from_file_pointer;
  logging(a4, (uint64_t)"Storing the model\n", v18, v19, v20, v21, v22, v23, v121);
  clock_t v31 = clock();
  logging(a4, (uint64_t)"Writing label features\n", v32, v33, v34, v35, v36, v37, v122);
  uint64_t v38 = calloc(8uLL, *v9 * *v9);
  uint64_t v39 = v38;
  uint64_t v40 = *v9;
  if ((int)v40 < 1)
  {
    uint64_t v42 = 0LL;
  }

  else
  {
    uint64_t v41 = 0LL;
    uint64_t v42 = 0LL;
    uint64_t v43 = *((void *)v9 + 4);
    do
    {
      uint64_t v44 = *(unsigned int *)(v43 + 16 * v41);
      if ((int)v44 >= 1)
      {
        v45 = *(int **)(v43 + 16 * v41 + 8);
        do
        {
          uint64_t v47 = *v45++;
          int v46 = v47;
          double v48 = *(double *)(a3 + 8 * v47);
          if (v48 != 0.0)
          {
            uint64_t v49 = *((void *)v9 + 2);
            if (*(_DWORD *)(v49 + 24LL * v46) != 1) {
              encoder_save_model_to_file_pointer_cold_1();
            }
            uint64_t v42 = (v42 + 1);
            *((double *)v38 + *(_DWORD *)(v49 + 24LL * v46 + 8) + (int)v40 * (int)v41) = v48;
          }

          --v44;
        }

        while (v44);
      }

      ++v41;
    }

    while (v41 != v40);
  }

  write_label_features((uint64_t)v30);
  free(v39);
  logging(a4, (uint64_t)"Writing attribute feature counts and offsets.\n", v50, v51, v52, v53, v54, v55, v123);
  uint64_t v56 = calloc(4uLL, (int)v9[1]);
  uint64_t v57 = calloc(4uLL, (int)v9[1]);
  uint64_t v58 = v57;
  clock_t v126 = v31;
  if ((int)v9[1] < 1)
  {
    uint64_t v60 = 0LL;
  }

  else
  {
    uint64_t v59 = 0LL;
    uint64_t v60 = 0LL;
    uint64_t v61 = *((void *)v9 + 3);
    do
    {
      *((_DWORD *)v57 + v59) = v60;
      uint64_t v62 = *(unsigned int *)(v61 + 16 * v59);
      if ((int)v62 < 1)
      {
        int v63 = 0;
      }

      else
      {
        int v63 = 0;
        uint64_t v64 = *(int **)(v61 + 16 * v59 + 8);
        do
        {
          uint64_t v65 = *v64++;
          double v66 = *(double *)(a3 + 8 * v65);
          if (v66 == 0.0) {
            uint64_t v60 = v60;
          }
          else {
            uint64_t v60 = (v60 + 1);
          }
          if (v66 != 0.0) {
            ++v63;
          }
          --v62;
        }

        while (v62);
      }

      v56[v59++] = v63;
    }

    while (v59 < (int)v9[1]);
  }

  write_attribute_feature_counts_and_offsets((uint64_t)v30);
  free(v56);
  free(v58);
  logging(a4, (uint64_t)"Writing attribute features.\n", v67, v68, v69, v70, v71, v72, v124);
  open_attribute_features((uint64_t)v30);
  uint64_t v79 = v9[1];
  if ((int)v79 >= 1)
  {
    uint64_t v80 = 0LL;
    do
    {
      uint64_t v81 = *((void *)v9 + 3) + 16 * v80;
      int v82 = *(_DWORD *)v81;
      if (*(int *)v81 >= 1)
      {
        uint64_t v83 = 0LL;
        do
        {
          if (*(double *)(a3 + 8LL * *(int *)(*(void *)(v81 + 8) + 4 * v83)) != 0.0)
          {
            write_attribute_feature((uint64_t)v30);
            int v82 = *(_DWORD *)v81;
          }

          ++v83;
        }

        while (v83 < v82);
        uint64_t v79 = v9[1];
      }

      ++v80;
    }

    while (v80 < (int)v79);
  }

  logging(a4, (uint64_t)"Number of attributes: %d\n", v73, v74, v75, v76, v77, v78, v79);
  logging(a4, (uint64_t)"Number of labels: %d\n", v84, v85, v86, v87, v88, v89, *v9);
  logging(a4, (uint64_t)"Number of features: %d\n", v90, v91, v92, v93, v94, v95, v9[3]);
  logging(a4, (uint64_t)"Number of active label features: %d\n", v96, v97, v98, v99, v100, v101, v42);
  logging(a4, (uint64_t)"Number of active attribute features: %d\n", v102, v103, v104, v105, v106, v107, v60);
  clock_t v108 = clock();
  logging( a4,  (uint64_t)"Seconds required: %.3f\n",  v109,  v110,  v111,  v112,  v113,  v114,  COERCE__INT64((double)(v108 - v126) / 1000000.0));
  logging(a4, (uint64_t)"\n", v115, v116, v117, v118, v119, v120, v125);
  close_writer(v30);
  return 0LL;
}

uint64_t encoder_features_on_path( void *a1, unsigned int *a2, uint64_t a3, void (*a4)(uint64_t, double), uint64_t a5)
{
  uint64_t v24 = *a2;
  if ((int)v24 >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = (void *)*a1;
    int v9 = -1;
    do
    {
      int v27 = v9;
      uint64_t v28 = v7;
      int v10 = *(_DWORD *)(a3 + 4 * v7);
      uint64_t v29 = *((void *)a2 + 1) + 16 * v7;
      int v11 = *(_DWORD *)v29;
      if (*(int *)v29 >= 1)
      {
        uint64_t v12 = 0LL;
        do
        {
          uint64_t v13 = (double *)(*(void *)(v29 + 8) + 16 * v12);
          uint64_t v14 = v8[3] + 16LL * *(int *)v13;
          int v15 = *(_DWORD *)v14;
          if (*(int *)v14 >= 1)
          {
            uint64_t v16 = 0LL;
            double v17 = v13[1];
            do
            {
              if (*(_DWORD *)(v8[2] + 24LL * *(int *)(*(void *)(v14 + 8) + 4 * v16) + 8) == v10)
              {
                a4(a5, v17);
                int v15 = *(_DWORD *)v14;
              }

              ++v16;
            }

            while (v16 < v15);
            int v11 = *(_DWORD *)v29;
          }

          ++v12;
        }

        while (v12 < v11);
      }

      if (v27 != -1)
      {
        uint64_t v18 = v8[4];
        uint64_t v19 = (int *)(v18 + 16LL * v27);
        int v20 = *v19;
        if (*v19 >= 1)
        {
          uint64_t v21 = 0LL;
          uint64_t v22 = (void *)(v18 + 16LL * v27 + 8);
          do
          {
            if (*(_DWORD *)(v8[2] + 24LL * *(int *)(*v22 + 4 * v21) + 8) == v10)
            {
              a4(a5, 1.0);
              int v20 = *v19;
            }

            ++v21;
          }

          while (v21 < v20);
        }
      }

      uint64_t v7 = v28 + 1;
      int v9 = v10;
    }

    while (v28 + 1 != v24);
  }

  return 0LL;
}

uint64_t encoder_set_weights(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(a1 + 8) = a2;
  *(double *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 40) = 0;
  set_level(a1, 1);
  return 0LL;
}

uint64_t encoder_set_instance(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = a2;
  *(_DWORD *)(a1 + 40) = 1;
  set_level(a1, 2);
  return 0LL;
}

uint64_t encoder_score(uint64_t a1, int *a2, double *a3)
{
  *a3 = crf1dc_score(*(void *)(*(void *)a1 + 40LL), a2);
  return 0LL;
}

uint64_t encoder_viterbi(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = v4;
  }
  return 0LL;
}

uint64_t encoder_partition_factor(uint64_t *a1, double *a2)
{
  uint64_t v3 = *a1;
  set_level((uint64_t)a1, 3);
  *a2 = crf1dc_lognorm(*(void *)(v3 + 40));
  return 0LL;
}

uint64_t encoder_objective_and_gradients(void *a1, double *a2, uint64_t a3, double a4)
{
  uint64_t v8 = (void *)*a1;
  set_level((uint64_t)a1, 4);
  int v9 = (unsigned int *)a1[4];
  uint64_t v10 = *v9;
  if ((int)v10 >= 1)
  {
    uint64_t v11 = 0LL;
    uint64_t v13 = *((void *)v9 + 1);
    uint64_t v12 = *((void *)v9 + 2);
    int v14 = -1;
    do
    {
      int v15 = *(_DWORD *)(v12 + 4 * v11);
      uint64_t v16 = *(unsigned int *)(v13 + 16 * v11);
      if ((int)v16 >= 1)
      {
        uint64_t v17 = 0LL;
        uint64_t v18 = *(void *)(v13 + 16 * v11 + 8);
        uint64_t v19 = v8[3];
        do
        {
          int v20 = (double *)(v18 + 16 * v17);
          uint64_t v21 = *(int *)v20;
          uint64_t v22 = *(unsigned int *)(v19 + 16 * v21);
          if ((int)v22 >= 1)
          {
            double v23 = v20[1];
            uint64_t v24 = *(int **)(v19 + 16 * v21 + 8);
            uint64_t v25 = v8[2];
            do
            {
              uint64_t v27 = *v24++;
              uint64_t v26 = v27;
              --v22;
            }

            while (v22);
          }

          ++v17;
        }

        while (v17 != v16);
      }

      if (v14 != -1)
      {
        uint64_t v28 = v8[4];
        uint64_t v29 = *(unsigned int *)(v28 + 16LL * v14);
        if ((int)v29 >= 1)
        {
          uint64_t v30 = *(int **)(v28 + 16LL * v14 + 8);
          uint64_t v31 = v8[2];
          do
          {
            uint64_t v33 = *v30++;
            uint64_t v32 = v33;
            --v29;
          }

          while (v29);
        }
      }

      ++v11;
      int v14 = v15;
    }

    while (v11 != v10);
  }

  crf1de_model_expectation(v8, v9, a3, -a4);
  double v34 = crf1dc_score(v8[5], *(int **)(a1[4] + 16LL));
  *a2 = crf1dc_lognorm(v8[5]) - v34;
  return 0LL;
}

void encoder_release(int **a1)
{
  uint64_t v2 = *a1;
  crf1de_finish(*a1);
  free(v2);
  free(a1);
}

void crf1de_finish(int *a1)
{
  uint64_t v2 = (void **)*((void *)a1 + 5);
  if (v2)
  {
    crf1dc_delete(v2);
    *((void *)a1 + 5) = 0LL;
  }

  uint64_t v3 = (void *)*((void *)a1 + 2);
  if (v3)
  {
    free(v3);
    *((void *)a1 + 2) = 0LL;
  }

  uint64_t v4 = (void *)*((void *)a1 + 3);
  if (v4)
  {
    if (a1[1] >= 1)
    {
      uint64_t v5 = 0LL;
      uint64_t v6 = 8LL;
      do
      {
        free(*(void **)(*((void *)a1 + 3) + v6));
        ++v5;
        v6 += 16LL;
      }

      while (v5 < a1[1]);
      uint64_t v4 = (void *)*((void *)a1 + 3);
    }

    free(v4);
    *((void *)a1 + 3) = 0LL;
  }

  uint64_t v7 = (void *)*((void *)a1 + 4);
  if (v7)
  {
    if (*a1 >= 1)
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = 8LL;
      do
      {
        free(*(void **)(*((void *)a1 + 4) + v9));
        ++v8;
        v9 += 16LL;
      }

      while (v8 < *a1);
      uint64_t v7 = (void *)*((void *)a1 + 4);
    }

    free(v7);
    *((void *)a1 + 4) = 0LL;
  }

void *crf1de_transition_score(void *result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)result;
  if ((int)v2 >= 1)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = result[4];
    uint64_t v5 = result[5];
    uint64_t v6 = *(void *)(v5 + 32);
    uint64_t v7 = *(int *)(v5 + 4);
    do
    {
      uint64_t v8 = *(unsigned int *)(v4 + 16 * v3);
      if ((int)v8 >= 1)
      {
        uint64_t v9 = *(int **)(v4 + 16 * v3 + 8);
        uint64_t v10 = result[2];
        do
        {
          uint64_t v11 = *v9++;
          *(void *)(v6 + 8 * v3 * v7 + 8LL * *(int *)(v10 + 24LL * (int)v11 + 8)) = *(void *)(a2 + 8 * v11);
          --v8;
        }

        while (v8);
      }

      ++v3;
    }

    while (v3 != v2);
  }

  return result;
}

void *crf1de_state_score(void *result, unsigned int *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = result[5];
    uint64_t v6 = *((void *)a2 + 1);
    uint64_t v7 = *(void *)(v5 + 24);
    uint64_t v8 = *(int *)(v5 + 4);
    do
    {
      uint64_t v9 = *(unsigned int *)(v6 + 16 * v4);
      if ((int)v9 >= 1)
      {
        uint64_t v10 = 0LL;
        uint64_t v11 = *(void *)(v6 + 16 * v4 + 8);
        uint64_t v12 = result[3];
        do
        {
          uint64_t v13 = (double *)(v11 + 16 * v10);
          uint64_t v14 = *(int *)v13;
          uint64_t v15 = *(unsigned int *)(v12 + 16 * v14);
          if ((int)v15 >= 1)
          {
            double v16 = v13[1];
            uint64_t v17 = *(int **)(v12 + 16 * v14 + 8);
            uint64_t v18 = result[2];
            do
            {
              uint64_t v19 = *v17++;
              uint64_t v20 = *(int *)(v18 + 24LL * (int)v19 + 8);
              --v15;
            }

            while (v15);
          }

          ++v10;
        }

        while (v10 != v9);
      }

      ++v4;
    }

    while (v4 != v3);
  }

  return result;
}

void *crf1de_model_expectation(void *result, unsigned int *a2, uint64_t a3, double a4)
{
  uint64_t v4 = result[5];
  uint64_t v5 = *a2;
  uint64_t v6 = *(unsigned int *)result;
  if ((int)v5 >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)(v4 + 96);
    uint64_t v9 = *(int *)(v4 + 4);
    uint64_t v10 = *((void *)a2 + 1);
    do
    {
      uint64_t v11 = *(unsigned int *)(v10 + 16 * v7);
      if ((int)v11 >= 1)
      {
        uint64_t v12 = 0LL;
        uint64_t v13 = *(void *)(v10 + 16 * v7 + 8);
        uint64_t v14 = result[3];
        do
        {
          uint64_t v15 = (double *)(v13 + 16 * v12);
          uint64_t v16 = *(int *)v15;
          uint64_t v17 = *(unsigned int *)(v14 + 16 * v16);
          if ((int)v17 >= 1)
          {
            double v18 = v15[1];
            uint64_t v19 = *(int **)(v14 + 16 * v16 + 8);
            uint64_t v20 = result[2];
            do
            {
              uint64_t v21 = *v19++;
              *(double *)(a3 + 8 * v21) = *(double *)(a3 + 8 * v21)
                                        + v18
              --v17;
            }

            while (v17);
          }

          ++v12;
        }

        while (v12 != v11);
      }

      ++v7;
    }

    while (v7 != v5);
  }

  if ((int)v6 >= 1)
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = *(void *)(v4 + 104);
    uint64_t v24 = *(int *)(v4 + 4);
    uint64_t v25 = result[4];
    do
    {
      uint64_t v26 = *(unsigned int *)(v25 + 16 * v22);
      if ((int)v26 >= 1)
      {
        uint64_t v27 = *(int **)(v25 + 16 * v22 + 8);
        uint64_t v28 = result[2];
        do
        {
          uint64_t v29 = *v27++;
          --v26;
        }

        while (v26);
      }

      ++v22;
    }

    while (v22 != v6);
  }

  return result;
}

uint64_t crf1de_write_model( unsigned int *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  char v112 = a7;
  uint64_t v10 = (double *)a3;
  uint64_t v13 = *a1;
  size_t v14 = (int)a1[1];
  size_t v15 = (int)a1[3];
  logging(a6, (uint64_t)"Storing the model\n", a3, a4, a5, (uint64_t)a6, a7, a8, v100);
  clock_t v16 = clock();
  uint64_t v17 = calloc(v15, 4uLL);
  if (v17)
  {
    double v18 = v17;
    uint64_t v110 = a4;
    uint64_t v19 = v15;
    uint64_t v20 = (int *)calloc(v14, 4uLL);
    if (!v20)
    {
      uint64_t v22 = 1LL;
LABEL_64:
      free(v18);
      return v22;
    }

    uint64_t v21 = v20;
    uint64_t v108 = v13;
    unsigned int v106 = v14;
    uint64_t v107 = v14;
    uint64_t v22 = crf1dmw_open_features(a2);
    if (!(_DWORD)v22)
    {
      clock_t v104 = v16;
      uint64_t v105 = a6;
      uint64_t v113 = a2;
      if ((int)v19 >= 1)
      {
        uint64_t v23 = 0LL;
        uint64_t v109 = 0LL;
        uint64_t v24 = 0LL;
        uint64_t v25 = (int *)v18;
        while (1)
        {
          double v26 = *v10;
          if (*v10 != 0.0)
          {
            uint64_t v27 = *((void *)a1 + 2);
            *uint64_t v25 = v24;
            uint64_t v29 = (int *)(v27 + v23 + 4);
            unsigned int v28 = *(_DWORD *)(v27 + v23);
            if (v28)
            {
              int v30 = v24;
            }

            else
            {
              uint64_t v31 = *v29;
              if (v21[v31] < 0)
              {
                v21[v31] = v109;
                uint64_t v31 = *v29;
                unsigned int v28 = *(_DWORD *)(v27 + v23);
                int v30 = *v25;
                uint64_t v109 = (v109 + 1);
              }

              else
              {
                unsigned int v28 = 0;
                int v30 = v24;
              }

              uint64_t v29 = &v21[v31];
            }

            __s = (char *)__PAIR64__(*v29, v28);
            int v115 = *(_DWORD *)(v27 + v23 + 8);
            double v116 = v26;
            uint64_t v32 = crf1dmw_put_feature((uint64_t)v113, v30, (uint64_t)&__s);
            if ((_DWORD)v32) {
              goto LABEL_62;
            }
            uint64_t v24 = (v24 + 1);
          }

          ++v25;
          ++v10;
          v23 += 24LL;
          if (24 * v19 == v23) {
            goto LABEL_24;
          }
        }
      }

      uint64_t v24 = 0LL;
      uint64_t v109 = 0LL;
LABEL_24:
      uint64_t v33 = v113;
      uint64_t v22 = crf1dmw_close_features(v113);
      if (!(_DWORD)v22)
      {
        logging(v105, (uint64_t)"Number of active features: %d (%d)\n", v34, v35, v36, v37, v38, v39, v24);
        logging(v105, (uint64_t)"Number of active attributes: %d (%d)\n", v40, v41, v42, v43, v44, v45, v109);
        logging(v105, (uint64_t)"Number of active labels: %d (%d)\n", v46, v47, v48, v49, v50, v51, v108);
        if ((v112 & 2) != 0)
        {
          crf1dmw_set_no_labels((uint64_t)v113, v108);
        }

        else
        {
          logging(v105, (uint64_t)"Writing labels\n", v52, v53, v54, v55, v56, v57, v108);
          uint64_t v22 = crf1dmw_open_labels((uint64_t)v113, v108);
          if ((_DWORD)v22) {
            goto LABEL_63;
          }
          int v58 = v108;
          if ((int)v108 >= 1)
          {
            uint64_t v59 = 0LL;
            do
            {
              __s = 0LL;
              (*(void (**)(uint64_t, uint64_t, char **))(a5 + 48))(a5, v59, &__s);
              if (__s)
              {
                uint64_t v32 = crf1dmw_put_label((uint64_t)v113, v59, __s);
                if ((_DWORD)v32) {
                  goto LABEL_62;
                }
                (*(void (**)(uint64_t, char *))(a5 + 64))(a5, __s);
                int v58 = v108;
              }

              uint64_t v59 = (v59 + 1);
            }

            while (v58 != (_DWORD)v59);
          }

          uint64_t v22 = crf1dmw_close_labels((uint64_t)v113);
          if ((_DWORD)v22) {
            goto LABEL_63;
          }
        }

        if ((v112 & 1) != 0)
        {
          crf1dmw_set_no_attributes((uint64_t)v113, v109);
        }

        else
        {
          logging(v105, (uint64_t)"Writing attributes\n", v60, v61, v62, v63, v64, v65, v101);
          uint64_t v22 = crf1dmw_open_attrs((uint64_t)v113, v109);
          if ((_DWORD)v22) {
            goto LABEL_63;
          }
          uint64_t v66 = v107;
          if ((int)v107 >= 1)
          {
            uint64_t v67 = 0LL;
            do
            {
              if ((v21[v67] & 0x80000000) == 0)
              {
                __s = 0LL;
                (*(void (**)(uint64_t, uint64_t, char **))(v110 + 48))(v110, v67, &__s);
                if (__s)
                {
                  uint64_t v32 = crf1dmw_put_attr((uint64_t)v113, v21[v67], __s);
                  if ((_DWORD)v32) {
                    goto LABEL_62;
                  }
                  (*(void (**)(uint64_t, char *))(v110 + 64))(v110, __s);
                  uint64_t v66 = v107;
                }
              }

              ++v67;
            }

            while (v66 != v67);
          }

          uint64_t v33 = v113;
          uint64_t v22 = crf1dmw_close_attrs((uint64_t)v113);
          if ((_DWORD)v22) {
            goto LABEL_63;
          }
        }

        logging(v105, (uint64_t)"Writing feature references for transitions\n", v68, v69, v70, v71, v72, v73, v101);
        uint64_t v22 = crf1dmw_open_labelrefs(v33, (int)v108 + 2);
        if (!(_DWORD)v22)
        {
          if ((int)v108 < 1)
          {
LABEL_53:
            uint64_t v22 = crf1dmw_close_labelrefs(v113);
            if ((_DWORD)v22) {
              goto LABEL_63;
            }
            logging(v105, (uint64_t)"Writing feature references for attributes\n", v76, v77, v78, v79, v80, v81, v102);
            uint64_t v22 = crf1dmw_open_attrrefs(v113, v109);
            if ((_DWORD)v22) {
              goto LABEL_63;
            }
            if ((int)v107 < 1)
            {
LABEL_60:
              uint64_t v22 = crf1dmw_close_attrrefs(v113);
              if (!(_DWORD)v22)
              {
                clock_t v86 = clock();
                logging( v105,  (uint64_t)"Seconds required: %.3f\n",  v87,  v88,  v89,  v90,  v91,  v92,  COERCE__INT64((double)(v86 - v104) / 1000000.0));
                logging(v105, (uint64_t)"\n", v93, v94, v95, v96, v97, v98, v103);
              }

              goto LABEL_63;
            }

            uint64_t v82 = 0LL;
            uint64_t v83 = v21;
            while (1)
            {
              int v85 = *v83++;
              int v84 = v85;
              if ((v85 & 0x80000000) == 0)
              {
                uint64_t v32 = crf1dmw_put_attrref(v113, v84, (unsigned int *)(*((void *)a1 + 3) + v82), (uint64_t)v18);
                if ((_DWORD)v32) {
                  break;
                }
              }

              v82 += 16LL;
              if (16LL * v106 == v82) {
                goto LABEL_60;
              }
            }
          }

          else
          {
            uint64_t v74 = 0LL;
            int v75 = 0;
            while (1)
            {
              uint64_t v32 = crf1dmw_put_labelref(v113, v75, (unsigned int *)(*((void *)a1 + 4) + v74), (uint64_t)v18);
              if ((_DWORD)v32) {
                break;
              }
              ++v75;
              v74 += 16LL;
              if (16 * v108 == v74) {
                goto LABEL_53;
              }
            }
          }

LABEL_62:
          uint64_t v22 = v32;
        }
      }
    }

  uint64_t v53 = 0;
LABEL_160:
  if (__p) {
    operator delete(__p);
  }
  if (!v53) {
    return 0LL;
  }
  --a1[515];
  return 1LL;
}

LABEL_63:
    free(v21);
    goto LABEL_64;
  }

  return 1LL;
}

void set_level(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 40);
  uint64_t v5 = *(void **)a1;
  if (v4 < 1)
  {
    crf1dc_reset(v5[5], 2);
    uint64_t v6 = *(void *)(a1 + 8);
    double v7 = *(double *)(a1 + 16);
    if (v7 == 1.0)
    {
      crf1de_transition_score(v5, v6);
    }

    else
    {
      uint64_t v8 = *(unsigned int *)v5;
      if ((int)v8 >= 1)
      {
        uint64_t v9 = 0LL;
        uint64_t v10 = v5[4];
        uint64_t v11 = v5[5];
        uint64_t v12 = *(void *)(v11 + 32);
        uint64_t v13 = *(int *)(v11 + 4);
        do
        {
          uint64_t v14 = *(unsigned int *)(v10 + 16 * v9);
          if ((int)v14 >= 1)
          {
            size_t v15 = *(int **)(v10 + 16 * v9 + 8);
            uint64_t v16 = v5[2];
            do
            {
              uint64_t v17 = *v15++;
              *(double *)(v12 + 8 * v9 * v13 + 8LL * *(int *)(v16 + 24LL * (int)v17 + 8)) = v7
                                                                                          * *(double *)(v6 + 8 * v17);
              --v14;
            }

            while (v14);
          }

          ++v9;
        }

        while (v9 != v8);
      }
    }
  }

  if (a2 > 1 && v4 < 2)
  {
    crf1dc_set_num_items(v5[5], **(_DWORD **)(a1 + 32));
    crf1dc_reset(v5[5], 1);
    double v18 = *(unsigned int **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 8);
    double v20 = *(double *)(a1 + 16);
    if (v20 == 1.0)
    {
      crf1de_state_score(v5, v18, v19);
    }

    else
    {
      uint64_t v21 = *v18;
      if ((int)v21 >= 1)
      {
        uint64_t v22 = 0LL;
        uint64_t v23 = v5[5];
        uint64_t v24 = *((void *)v18 + 1);
        uint64_t v25 = *(void *)(v23 + 24);
        uint64_t v26 = *(int *)(v23 + 4);
        do
        {
          uint64_t v27 = *(unsigned int *)(v24 + 16 * v22);
          if ((int)v27 >= 1)
          {
            uint64_t v28 = 0LL;
            uint64_t v29 = *(void *)(v24 + 16 * v22 + 8);
            uint64_t v30 = v5[3];
            do
            {
              uint64_t v31 = (double *)(v29 + 16 * v28);
              uint64_t v32 = *(int *)v31;
              uint64_t v33 = *(unsigned int *)(v30 + 16 * v32);
              if ((int)v33 >= 1)
              {
                double v34 = v20 * v31[1];
                uint64_t v35 = *(int **)(v30 + 16 * v32 + 8);
                uint64_t v36 = v5[2];
                do
                {
                  uint64_t v37 = *v35++;
                  uint64_t v38 = *(int *)(v36 + 24LL * (int)v37 + 8);
                  --v33;
                }

                while (v33);
              }

              ++v28;
            }

            while (v28 != v27);
          }

          ++v22;
        }

        while (v22 != v21);
      }
    }
  }

  if (a2 > 2 && v4 < 3)
  {
    crf1dc_exp_transition(v5[5]);
    crf1dc_exp_state(v5[5]);
    crf1dc_alpha_score(v5[5]);
    crf1dc_beta_score((unsigned int *)v5[5]);
  }

  if (a2 > 3 && v4 <= 3) {
    crf1dc_marginals((unsigned int *)v5[5]);
  }
  *(_DWORD *)(a1 + 40) = a2;
}

void ME_Efficient_Model_Trainer::regularized_func_grad( ME_Efficient_Model_Trainer *this, double a2, uint64_t **a3, double **a4)
{
  double v6 = ME_Efficient_Model_Trainer::FunctionGradient(this, a3, a4);
  double v7 = a3[1];
  uint64_t v8 = (char *)v7 - (char *)*a3;
  if (v7 != *a3)
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = v8 >> 3;
    if (v10 <= 1) {
      unint64_t v10 = 1LL;
    }
    do
    {
      double v6 = v6 + a2 * fabs(*(double *)((char *)*a3 + (v9 >> 29)));
      v9 += 0x100000000LL;
      --v10;
    }

    while (v10);
  }

double ME_Efficient_Model_Trainer::constrained_line_search( ME_Efficient_Model_Trainer *this, double a2, const Vec *a3, const Vec *a4, double a5, const Vec *a6, Vec *a7, double **a8)
{
  uint64_t v52 = 0LL;
  uint64_t v53 = 0LL;
  uint64_t v54 = 0LL;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( &v52,  *(const void **)a3,  *((void *)a3 + 1),  (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  uint64_t v16 = (double *)v52;
  if (v53 != v52)
  {
    uint64_t v17 = 0LL;
    unint64_t v18 = (v53 - (_BYTE *)v52) >> 3;
    uint64_t v19 = *(void *)a4;
    if (v18 <= 1) {
      unint64_t v18 = 1LL;
    }
    do
    {
      v17 += 0x100000000LL;
      --v18;
    }

    while (v18);
  }

  double v20 = 2.0;
  do
  {
    while (1)
    {
      Vec::Vec((Vec *)&v48, (uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 3, 0.0);
      double v20 = v20 * 0.5;
      uint64_t v21 = *(void *)a6;
      uint64_t v22 = *((void *)a6 + 1);
      uint64_t v23 = v22 - *(void *)a6;
      if (v22 != *(void *)a6)
      {
        uint64_t v24 = 0LL;
        unint64_t v25 = v23 >> 3;
        uint64_t v26 = (char *)v48;
        if (v25 <= 1) {
          unint64_t v25 = 1LL;
        }
        do
        {
          *(double *)&v26[v24 >> 29] = v20 * *(double *)(v21 + (v24 >> 29));
          v24 += 0x100000000LL;
          --v25;
        }

        while (v25);
      }

      Vec::Vec((Vec *)&__p, (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3, 0.0);
      uint64_t v27 = *(char **)a3;
      uint64_t v28 = (char *)*((void *)a3 + 1);
      unint64_t v29 = (uint64_t)&v28[-*(void *)a3] >> 3;
      uint64_t v30 = (char *)v48;
      if (v29 != (v49 - (_BYTE *)v48) >> 3) {
        __assert_rtn("operator+", "mathvec.h", 64, "a.Size() == b.Size()");
      }
      if (v28 != v27)
      {
        uint64_t v31 = 0LL;
        uint64_t v32 = (char *)__p;
        if (v29 <= 1) {
          unint64_t v29 = 1LL;
        }
        do
        {
          *(double *)&v32[v31 >> 29] = *(double *)&v27[v31 >> 29] + *(double *)&v30[v31 >> 29];
          v31 += 0x100000000LL;
          --v29;
        }

        while (v29);
      }

      uint64_t v33 = __p;
      if (&__p != (void **)a7)
      {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)a7,  (char *)__p,  (uint64_t)v51,  (v51 - (_BYTE *)__p) >> 3);
        uint64_t v33 = __p;
      }

      if (v33)
      {
        uint64_t v51 = v33;
        operator delete(v33);
      }

      if (v48)
      {
        uint64_t v49 = v48;
        operator delete(v48);
      }

      Vec::Project((uint64_t)a7, (uint64_t *)&v52);
      ME_Efficient_Model_Trainer::regularized_func_grad(this, a2, (uint64_t **)a7, a8);
      double v35 = v34;
      Vec::Vec((Vec *)&__p, (uint64_t)(*((void *)a7 + 1) - *(void *)a7) >> 3, 0.0);
      uint64_t v36 = *(void *)a7;
      uint64_t v37 = *((void *)a7 + 1);
      unint64_t v38 = (v37 - *(void *)a7) >> 3;
      uint64_t v39 = *(char **)a3;
      if (v37 != v36)
      {
        uint64_t v40 = 0LL;
        uint64_t v41 = (char *)__p;
        if (v38 <= 1) {
          unint64_t v38 = 1LL;
        }
        do
        {
          *(double *)&v41[v40 >> 29] = *(double *)(v36 + (v40 >> 29)) - *(double *)&v39[v40 >> 29];
          v40 += 0x100000000LL;
          --v38;
        }

        while (v38);
      }

      int64_t v42 = v51 - (_BYTE *)__p;
      if (v51 == __p) {
        break;
      }
      uint64_t v43 = 0LL;
      uint64_t v44 = v42 >> 3;
      double v45 = 0.0;
      do
      {
        double v45 = v45 + *(double *)((char *)__p + (v43 >> 29)) * *(double *)(*(void *)a4 + (v43 >> 29));
        v43 += 0x100000000LL;
        --v44;
      }

      while (v44);
      double v46 = a5 + v45 * 0.1;
      uint64_t v51 = __p;
      operator delete(__p);
      if (v35 <= v46) {
        goto LABEL_38;
      }
    }

    if (v51) {
      operator delete(v51);
    }
  }

  while (v35 > a5 + 0.0);
LABEL_38:
  if (v52)
  {
    uint64_t v53 = v52;
    operator delete(v52);
  }

  return v35;
}

void sub_18742068C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a10) {
    operator delete(a10);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Vec::Project(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *(double **)result;
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v4 = v3 - *(void *)result;
  if (v3 != *(void *)result)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = v4 >> 3;
    uint64_t v7 = *a2;
    if (v6 <= 1) {
      unint64_t v6 = 1LL;
    }
    do
    {
      ++v2;
      v5 += 0x100000000LL;
      --v6;
    }

    while (v6);
  }

  return result;
}

void ME_Efficient_Model_Trainer::perform_OWLQN( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>, double a4@<D0>)
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  uint64_t v7 = *(const void **)a2;
  uint64_t v8 = *(void *)(a2 + 8);
  unint64_t v10 = (v8 - (uint64_t)v7) >> 3;
  clock_t v86 = 0LL;
  uint64_t v87 = 0LL;
  uint64_t v88 = 0LL;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v86, v7, v8, v10);
  Vec::Vec((Vec *)&v84, v10, 0.0);
  Vec::Vec((Vec *)&v82, v10, 0.0);
  ME_Efficient_Model_Trainer::regularized_func_grad( (ME_Efficient_Model_Trainer *)a1,  a4,  (uint64_t **)&v86,  (double **)&v84);
  double v12 = v11;
  for (uint64_t i = 0LL; i != 240; i += 24LL)
    Vec::Vec((Vec *)&v91[i], 0LL, 0.0);
  uint64_t v72 = a3;
  for (uint64_t j = 0LL; j != 240; j += 24LL)
    Vec::Vec((Vec *)&v90[j], 0LL, 0.0);
  unsigned int v15 = 0;
  uint64_t v16 = (FILE **)MEMORY[0x1895F89D0];
  while (v15 != 300)
  {
    uint64_t v79 = 0LL;
    uint64_t v80 = 0LL;
    uint64_t v81 = 0LL;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( &v79,  v84,  (uint64_t)v85,  (v85 - (_BYTE *)v84) >> 3);
    uint64_t v17 = (char *)v86;
    if (v87 != v86)
    {
      uint64_t v18 = 0LL;
      unint64_t v19 = (v87 - (_BYTE *)v86) >> 3;
      double v20 = (double *)v84;
      uint64_t v21 = (double *)v79;
      if (v19 <= 1) {
        unint64_t v19 = 1LL;
      }
      do
      {
        uint64_t v22 = v18 >> 32;
        double v23 = *(double *)&v17[v18 >> 29];
        BOOL v24 = v23 <= 0.0;
        if (v23 == 0.0)
        {
          double v27 = v20[v22];
          if (v27 - a4 > 0.0)
          {
            v21[v22] = v27 - a4;
            goto LABEL_22;
          }

          double v26 = v27 + a4;
          if (v26 >= 0.0)
          {
            v21[v22] = 0.0;
            goto LABEL_22;
          }
        }

        else
        {
          if (v23 >= 0.0) {
            double v25 = 0.0;
          }
          else {
            double v25 = -1.0;
          }
          if (!v24) {
            double v25 = 1.0;
          }
          double v26 = v21[v22] + a4 * v25;
        }

        v21[v22] = v26;
LABEL_22:
        v18 += 0x100000000LL;
        --v19;
      }

      while (v19);
    }

    unsigned int v28 = v15 + 1;
    fprintf(*v16, "%3d  obj(err) = %f (%6.4f)", v15 + 1, -v12, *(double *)(a1 + 336));
    if (*(int *)(a1 + 352) >= 1)
    {
      double v29 = ME_Efficient_Model_Trainer::heldout_likelihood((ME_Efficient_Model_Trainer *)a1);
      fprintf(*v16, "  heldout_logl(err) = %f (%6.4f)", v29, *(double *)(a1 + 344));
    }

    fputc(10, *v16);
    uint64_t v30 = v79;
    if (v80 == v79)
    {
      double v33 = 0.0;
    }

    else
    {
      uint64_t v31 = 0LL;
      unint64_t v32 = (v80 - (_BYTE *)v79) >> 3;
      if (v32 <= 1) {
        unint64_t v32 = 1LL;
      }
      double v33 = 0.0;
      do
      {
        double v33 = v33 + *(double *)((char *)v79 + (v31 >> 29)) * *(double *)((char *)v79 + (v31 >> 29));
        v31 += 0x100000000LL;
        --v32;
      }

      while (v32);
    }

    double v34 = sqrt(v33);
    if (v34 >= 0.0001)
    {
      approximate_Hg((const Vec *)&v79, (const Vec *)v91, (const Vec *)v90, v89, v15, (double **)&v75);
      Vec::Vec((Vec *)&__p, (v76 - (_BYTE *)v75) >> 3, 0.0);
      double v35 = (char *)v75;
      if (v76 != v75)
      {
        uint64_t v36 = 0LL;
        unint64_t v37 = (v76 - (_BYTE *)v75) >> 3;
        unint64_t v38 = (char *)__p;
        if (v37 <= 1) {
          unint64_t v37 = 1LL;
        }
        do
        {
          *(double *)&v38[v36 >> 29] = -*(double *)&v35[v36 >> 29];
          v36 += 0x100000000LL;
          --v37;
        }

        while (v37);
      }

      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)&v82,  (char *)__p,  (uint64_t)v78,  (v78 - (_BYTE *)__p) >> 3);
      if (__p)
      {
        uint64_t v78 = __p;
        operator delete(__p);
      }

      if (v75)
      {
        uint64_t v76 = v75;
        operator delete(v75);
      }

      if (v83 == v82) {
        goto LABEL_47;
      }
      uint64_t v39 = 0LL;
      unint64_t v40 = (v83 - (_BYTE *)v82) >> 3;
      if (v40 <= 1) {
        unint64_t v40 = 1LL;
      }
      double v41 = 0.0;
      do
      {
        double v41 = v41 + *(double *)((char *)v82 + (v39 >> 29)) * *(double *)((char *)v79 + (v39 >> 29));
        v39 += 0x100000000LL;
        --v40;
      }

      while (v40);
      if (v41 >= 0.0)
      {
LABEL_47:
        Vec::Vec((Vec *)&__p, (v80 - (_BYTE *)v79) >> 3, 0.0);
        int64_t v42 = (char *)v79;
        if (v80 != v79)
        {
          uint64_t v43 = 0LL;
          unint64_t v44 = (v80 - (_BYTE *)v79) >> 3;
          double v45 = (char *)__p;
          if (v44 <= 1) {
            unint64_t v44 = 1LL;
          }
          do
          {
            *(double *)&v45[v43 >> 29] = -*(double *)&v42[v43 >> 29];
            v43 += 0x100000000LL;
            --v44;
          }

          while (v44);
        }

        double v46 = (double *)v82;
        uint64_t v47 = (char *)__p;
        if (v83 != v82)
        {
          uint64_t v48 = 0LL;
          unint64_t v49 = (v83 - (_BYTE *)v82) >> 3;
          if (v49 <= 1) {
            unint64_t v49 = 1LL;
          }
          do
          {
            v48 += 0x100000000LL;
            ++v46;
            --v49;
          }

          while (v49);
          uint64_t v47 = (char *)__p;
        }

        if (v47)
        {
          uint64_t v78 = v47;
          operator delete(v47);
        }
      }

      Vec::Vec((Vec *)&__p, v10, 0.0);
      Vec::Vec((Vec *)&v75, v10, 0.0);
      double v12 = ME_Efficient_Model_Trainer::constrained_line_search( (ME_Efficient_Model_Trainer *)a1,  a4,  (const Vec *)&v86,  (const Vec *)&v79,  v12,  (const Vec *)&v82,  (Vec *)&__p,  (double **)&v75);
      Vec::Vec((Vec *)&v73, (v78 - (_BYTE *)__p) >> 3, 0.0);
      uint64_t v50 = (char *)__p;
      unint64_t v51 = (v78 - (_BYTE *)__p) >> 3;
      uint64_t v52 = (char *)v86;
      if (v51 != (v87 - (_BYTE *)v86) >> 3) {
        __assert_rtn("operator-", "mathvec.h", 74, "a.Size() == b.Size()");
      }
      if (v78 != __p)
      {
        uint64_t v53 = 0LL;
        uint64_t v54 = (char *)v73;
        if (v51 <= 1) {
          unint64_t v51 = 1LL;
        }
        do
        {
          *(double *)&v54[v53 >> 29] = *(double *)&v50[v53 >> 29] - *(double *)&v52[v53 >> 29];
          v53 += 0x100000000LL;
          --v51;
        }

        while (v51);
      }

      uint64_t v55 = v15 % 0xA;
      uint64_t v56 = (void **)&v91[24 * v55];
      if (v56 != &v73) {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( &v91[24 * v55],  (char *)v73,  (uint64_t)v74,  (v74 - (_BYTE *)v73) >> 3);
      }
      if (v73)
      {
        uint64_t v74 = v73;
        operator delete(v73);
      }

      Vec::Vec((Vec *)&v73, (v76 - (_BYTE *)v75) >> 3, 0.0);
      uint64_t v57 = (char *)v75;
      unint64_t v58 = (v76 - (_BYTE *)v75) >> 3;
      uint64_t v59 = (char *)v84;
      if (v58 != (v85 - (_BYTE *)v84) >> 3) {
        __assert_rtn("operator-", "mathvec.h", 74, "a.Size() == b.Size()");
      }
      if (v76 != v75)
      {
        uint64_t v60 = 0LL;
        uint64_t v61 = (char *)v73;
        if (v58 <= 1) {
          unint64_t v58 = 1LL;
        }
        do
        {
          *(double *)&v61[v60 >> 29] = *(double *)&v57[v60 >> 29] - *(double *)&v59[v60 >> 29];
          v60 += 0x100000000LL;
          --v58;
        }

        while (v58);
      }

      uint64_t v62 = (void **)&v90[24 * v55];
      if (v62 != &v73) {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( &v90[24 * v55],  (char *)v73,  (uint64_t)v74,  (v74 - (_BYTE *)v73) >> 3);
      }
      if (v73)
      {
        uint64_t v74 = v73;
        operator delete(v73);
      }

      uint64_t v63 = v62[1];
      uint64_t v64 = v63 - (_BYTE *)*v62;
      if (v63 == *v62)
      {
        double v67 = 0.0;
      }

      else
      {
        uint64_t v65 = 0LL;
        uint64_t v66 = v64 >> 3;
        double v67 = 0.0;
        do
        {
          double v67 = v67 + *(double *)((char *)*v62 + (v65 >> 29)) * *(double *)((char *)*v56 + (v65 >> 29));
          v65 += 0x100000000LL;
          --v66;
        }

        while (v66);
      }

      v89[v55] = 1.0 / v67;
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)&v86,  (char *)__p,  (uint64_t)v78,  (v78 - (_BYTE *)__p) >> 3);
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)&v84,  (char *)v75,  (uint64_t)v76,  (v76 - (_BYTE *)v75) >> 3);
      if (v75)
      {
        uint64_t v76 = v75;
        operator delete(v75);
      }

      if (__p)
      {
        uint64_t v78 = __p;
        operator delete(__p);
      }

      uint64_t v30 = v79;
    }

    if (v30)
    {
      uint64_t v80 = v30;
      operator delete(v30);
    }

    unsigned int v15 = v28;
    if (v34 < 0.0001) {
      break;
    }
  }

  *uint64_t v72 = 0LL;
  v72[1] = 0LL;
  v72[2] = 0LL;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( v72,  v86,  (uint64_t)v87,  (v87 - (_BYTE *)v86) >> 3);
  for (uint64_t k = 0LL; k != -240; k -= 24LL)
  {
    uint64_t v69 = *(void **)&v90[k + 216];
    if (v69)
    {
      *(void *)&v90[k + 224] = v69;
      operator delete(v69);
    }
  }

  for (uint64_t m = 0LL; m != -240; m -= 24LL)
  {
    uint64_t v71 = *(void **)&v91[m + 216];
    if (v71)
    {
      *(void *)&v91[m + 224] = v71;
      operator delete(v71);
    }
  }

  if (v82)
  {
    uint64_t v83 = v82;
    operator delete(v82);
  }

  if (v84)
  {
    int v85 = v84;
    operator delete(v84);
  }

  if (v86)
  {
    uint64_t v87 = v86;
    operator delete(v86);
  }

void sub_187420EE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, uint64_t a25, void *__p, uint64_t a27, uint64_t a28, void *a29, uint64_t a30, uint64_t a31, void *a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
  uint64_t v46 = 0LL;
  while (1)
  {
    uint64_t v47 = *(void **)(&a45 + v46 + 216);
    if (v47)
    {
      *(void *)(&a45 + v46 + 224) = v47;
      operator delete(v47);
    }

    v46 -= 24LL;
    if (v46 == -240)
    {
      uint64_t v48 = 0LL;
      while (1)
      {
        unint64_t v49 = *(void **)((char *)&STACK[0x210] + v48 + 216);
        if (v49)
        {
          *(unint64_t *)((char *)&STACK[0x210] + v48 + 224) = (unint64_t)v49;
          operator delete(v49);
        }

        v48 -= 24LL;
        if (v48 == -240)
        {
          if (__p) {
            operator delete(__p);
          }
          if (a29) {
            operator delete(a29);
          }
          if (a32) {
            operator delete(a32);
          }
          _Unwind_Resume(a1);
        }
      }
    }
  }

char *std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0LL;
      *uint64_t v7 = 0LL;
      v7[1] = 0LL;
      v7[2] = 0LL;
    }

    if (a4 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<double>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    double v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      unint64_t v19 = __src;
      goto LABEL_18;
    }

    goto LABEL_19;
  }

  double v12 = (void **)(result + 8);
  uint64_t v14 = (_BYTE *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }

  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    unint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }

LABEL_19:
  *double v12 = &v9[v17];
  return result;
}

      unint64_t v11 = *(void *)v11;
      if (!v11) {
        return 0;
      }
    }
  }

  v35[1] = v35;
  v35[0] = *(void *)a2;
  a5.n128_u64[0] = *(void *)(a2 + 16);
  uint64_t v22 = *(float *)(a2 + 24);
  unint64_t v38 = a5;
  MEMORY[0x1895F8858]();
  BOOL v24 = (char *)v35 - v23;
  double v26 = *(unsigned int *)(a2 + 16);
  memcpy((char *)v35 - v23, (const void *)(v25 + 22), v26);
  double v27 = *(void *)a2 & 0xFFFFFFFFFFFFFFFCLL;
  if (v27)
  {
    unint64_t v37 = 0;
    unsigned int v28 = v26 + a4;
    uint64_t v36 = a4;
    do
    {
      double v29 = *(unsigned __int16 *)(v27 + 20);
      if (v28 <= v29 && !memcmp((const void *)(v27 + 22), v24, v26) && !memcmp((const void *)(v27 + 22 + v26), a3, v36))
      {
        if (v28 == v29)
        {
          *(void *)(a2 + 8) = v27 | 2;
          double v34 = *(_DWORD *)(v27 + 16);
          *(_DWORD *)(a2 + 24) = *(_DWORD *)(v27 + 12);
          *(_DWORD *)(a2 + 16) = v28;
          *(_DWORD *)(a2 + 20) = v34;
          return 1;
        }

        uint64_t v30 = v38;
        HIDWORD(v31) = 0;
        unint64_t v32 = v37;
        if (!v37)
        {
          uint64_t v8 = v27 | 2;
          uint64_t v22 = 0.0;
        }

        unint64_t v37 = 1;
        if (!v32)
        {
          LODWORD(v31) = v38.n128_u32[0] + a4;
          v30.n128_f64[0] = v31;
        }

        unint64_t v38 = v30;
      }

      double v27 = *(void *)v27;
    }

    while (v27);
  }

  else
  {
    unint64_t v37 = 0;
  }

  *(void *)a2 = v35[0];
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = v38.n128_u64[0];
  *(float *)(a2 + 24) = v22;
  return v37;
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exceptiouint64_t n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_18A04E310, MEMORY[0x1896141F8]);
}

void sub_187421264(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exceptiouint64_t n = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x189614700], MEMORY[0x189614270]);
}

void Vec::Vec(Vec *this, unint64_t a2, double a3)
{
  double v3 = a3;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  *(void *)this = 0LL;
  std::vector<double>::resize((uint64_t)this, a2, &v3);
}

void sub_187421300(_Unwind_Exception *exception_object)
{
  double v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    std::vector<double>::__append((void **)a1, a2 - v3, a3);
  }

void std::vector<double>::__append(void **a1, unint64_t a2, void *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      size_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8LL;
      }

      while (v16);
      uint64_t v9 = v17;
    }

    a1[1] = v9;
  }

  else
  {
    uint64_t v10 = (char *)v9 - (_BYTE *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      unint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v6, v14);
    }
    else {
      unint64_t v15 = 0LL;
    }
    uint64_t v18 = &v15[8 * v12];
    unint64_t v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    uint64_t v21 = v18;
    do
    {
      *(void *)uint64_t v21 = *a3;
      v21 += 8;
      v20 -= 8LL;
    }

    while (v20);
    uint64_t v22 = &v15[8 * v14];
    double v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 8)
    {
      uint64_t v25 = *((void *)i - 1);
      *((void *)v18 - 1) = v25;
      v18 -= 8;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23) {
      operator delete(v23);
    }
  }

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_1874214B8(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *crf1df_generate( uint64_t a1, uint64_t a2, int a3, double a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9)
{
  int v68 = *(_DWORD *)(a2 + 16);
  v71[0] = a9;
  v71[1] = a8;
  int v72 = 0;
  unint64_t v14 = (uint64_t **)calloc(1uLL, 0x10uLL);
  uint64_t v22 = v14;
  int v66 = a7;
  if (v14)
  {
    *((_DWORD *)v14 + 2) = 0;
    double v23 = rumavl_new((void *)0x18, (int (__cdecl *)(const void *, const void *, size_t))featureset_comp, 0LL, 0LL);
    *uint64_t v22 = v23;
    if (!v23)
    {
      free(v22);
      uint64_t v22 = 0LL;
    }
  }

  logging_progress_start((uint64_t)v71, v15, v16, v17, v18, v19, v20, v21, a1);
  if (v68 >= 1)
  {
    int v31 = 0;
    if (a6) {
      BOOL v32 = a3 < 1;
    }
    else {
      BOOL v32 = 1;
    }
    char v33 = v32;
    do
    {
      int v69 = v31;
      double v34 = (unsigned int *)dataset_get((void *)a2, v31);
      uint64_t v70 = *v34;
      if ((int)v70 >= 1)
      {
        double v41 = v34;
        uint64_t v42 = 0LL;
        int v43 = a3;
        do
        {
          uint64_t v44 = *((void *)v41 + 1);
          int v45 = *(_DWORD *)(*((void *)v41 + 2) + 4 * v42);
          if (v43 != a3)
          {
            LODWORD(v73) = 1;
            HIDWORD(v73) = v43;
            int v74 = v45;
            uint64_t v75 = 0x3FF0000000000000LL;
            featureset_add((uint64_t)v22, &v73);
          }

          uint64_t v46 = (int *)(v44 + 16 * v42);
          if (*v46 >= 1)
          {
            uint64_t v47 = 0LL;
            uint64_t v48 = (void *)(v44 + 16 * v42 + 8);
            do
            {
              LODWORD(v73) = 0;
              uint64_t v49 = *v48 + 16 * v47;
              HIDWORD(v73) = *(_DWORD *)v49;
              int v74 = v45;
              uint64_t v75 = *(void *)(v49 + 8);
              featureset_add((uint64_t)v22, &v73);
              if ((v33 & 1) == 0)
              {
                int v50 = 0;
                do
                {
                  LODWORD(v73) = 0;
                  HIDWORD(v73) = *(_DWORD *)(*v48 + 16 * v47);
                  int v74 = v50;
                  uint64_t v75 = 0LL;
                  featureset_add((uint64_t)v22, &v73);
                  ++v50;
                }

                while (a3 != v50);
              }

              ++v47;
            }

            while (v47 < *v46);
          }

          ++v42;
          int v43 = v45;
        }

        while (v42 != v70);
      }

      logging_progress(v71, 100 * v69 / v68, v35, v36, v37, v38, v39, v40);
      int v31 = v69 + 1;
    }

    while (v69 + 1 != v68);
  }

  logging_progress_end(v71, v24, v25, v26, v27, v28, v29, v30, v64);
  if (v66 && a3 >= 1)
  {
    int v51 = 0;
    do
    {
      int v52 = 0;
      do
      {
        LODWORD(v73) = 1;
        HIDWORD(v73) = v51;
        int v74 = v52;
        uint64_t v75 = 0LL;
        featureset_add((uint64_t)v22, &v73);
        ++v52;
      }

      while (a3 != v52);
      ++v51;
    }

    while (v51 != a3);
  }

  uint64_t v76 = 0LL;
  uint64_t v53 = rumavl_node_next(*v22, 0LL, 1, &v76);
  if (v53)
  {
    uint64_t v54 = v53;
    unsigned int v55 = 0;
    uint64_t v56 = v65;
    do
    {
      if (v76[2] >= a4) {
        ++v55;
      }
      uint64_t v54 = rumavl_node_next(*v22, v54, 1, &v76);
    }

    while (v54);
  }

  else
  {
    unsigned int v55 = 0;
    uint64_t v56 = v65;
  }

  uint64_t v57 = (char *)calloc(v55, 0x18uLL);
  if (v57)
  {
    uint64_t v58 = rumavl_node_next(*v22, 0LL, 1, &v76);
    if (v58)
    {
      uint64_t v59 = v58;
      int v60 = 0;
      do
      {
        if (v76[2] >= a4)
        {
          __int128 v61 = *(_OWORD *)v76;
          uint64_t v62 = &v57[24 * v60];
          *((double *)v62 + 2) = v76[2];
          *(_OWORD *)uint64_t v62 = v61;
          ++v60;
        }

        uint64_t v59 = rumavl_node_next(*v22, v59, 1, &v76);
      }

      while (v59);
    }
  }

  else
  {
    unsigned int v55 = 0;
  }

  *uint64_t v56 = v55;
  rumavl_destroy((uint64_t **)*v22);
  free(v22);
  return v57;
}

uint64_t featureset_add(uint64_t a1, double *a2)
{
  uint64_t result = rumavl_find(*(uint64_t **)a1, (uint64_t)a2);
  if (result)
  {
    *(double *)(result + 16) = a2[2] + *(double *)(result + 16);
  }

  else
  {
    uint64_t result = rumavl_insert(*(void *)a1, a2);
    ++*(_DWORD *)(a1 + 8);
  }

  return result;
}

uint64_t crf1df_init_references(void ***a1, void ***a2, uint64_t a3, int a4, int a5, int a6)
{
  LODWORD(v7) = a5;
  uint64_t v12 = (void **)calloc(a5, 0x10uLL);
  if (!v12) {
    goto LABEL_35;
  }
  uint64_t v13 = (void **)calloc(a6, 0x10uLL);
  unint64_t v14 = v13;
  if (!v13)
  {
LABEL_27:
    if ((int)v7 >= 1)
    {
      uint64_t v7 = v7;
      BOOL v32 = v12 + 1;
      do
      {
        char v33 = *v32;
        v32 += 2;
        free(v33);
        --v7;
      }

      while (v7);
    }

    free(v12);
    if (!v14)
    {
      uint64_t v12 = 0LL;
      goto LABEL_36;
    }

    if (a6 >= 1)
    {
      uint64_t v34 = a6;
      uint64_t v35 = v14 + 1;
      do
      {
        uint64_t v36 = *v35;
        v35 += 2;
        free(v36);
        --v34;
      }

      while (v34);
    }

    free(v14);
    uint64_t v12 = 0LL;
LABEL_35:
    unint64_t v14 = 0LL;
LABEL_36:
    uint64_t result = 0xFFFFFFFFLL;
    goto LABEL_37;
  }

  if (a4 >= 1)
  {
    uint64_t v15 = a4;
    uint64_t v16 = (int *)(a3 + 4);
    while (1)
    {
      int v17 = *(v16 - 1);
      uint64_t v18 = v12;
      if (!v17) {
        goto LABEL_8;
      }
      if (v17 == 1) {
        break;
      }
LABEL_9:
      v16 += 6;
      if (!--v15) {
        goto LABEL_10;
      }
    }

    uint64_t v18 = v13;
LABEL_8:
    ++LODWORD(v18[2 * *v16]);
    goto LABEL_9;
  }

LABEL_10:
  if ((int)v7 >= 1)
  {
    uint64_t v19 = v7;
    uint64_t v20 = v12;
    do
    {
      uint64_t v21 = calloc(*(int *)v20, 4uLL);
      v20[1] = v21;
      if (!v21) {
        goto LABEL_27;
      }
      *(_DWORD *)uint64_t v20 = 0;
      v20 += 2;
    }

    while (--v19);
  }

  if (a6 >= 1)
  {
    uint64_t v22 = a6;
    double v23 = v14;
    do
    {
      uint64_t v24 = calloc(*(int *)v23, 4uLL);
      v23[1] = v24;
      if (!v24) {
        goto LABEL_27;
      }
      *(_DWORD *)double v23 = 0;
      v23 += 2;
    }

    while (--v22);
  }

  if (a4 >= 1)
  {
    uint64_t v25 = 0LL;
    uint64_t v26 = (int *)(a3 + 4);
    while (1)
    {
      int v27 = *(v26 - 1);
      if (v27 == 1) {
        break;
      }
      if (!v27)
      {
        uint64_t v28 = &v12[2 * *v26];
LABEL_24:
        uint64_t v29 = v28[1];
        uint64_t v30 = *(int *)v28;
        *(_DWORD *)uint64_t v28 = v30 + 1;
        v29[v30] = v25;
      }

      v26 += 6;
      if (a4 == ++v25) {
        goto LABEL_26;
      }
    }

    uint64_t v28 = &v14[2 * *v26];
    goto LABEL_24;
  }

LABEL_26:
  uint64_t result = 0LL;
LABEL_37:
  *a1 = v12;
  *a2 = v14;
  return result;
}

      uint64_t v26 = v30;
LABEL_27:
      uint64_t v15 = v26 != 0;
      if (!v26)
      {
        uint64_t v21 = v22++ == 255;
        if (!v21) {
          continue;
        }
      }

      return v15;
    }

    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v31,  a7);
    uint64_t v26 = nlp::searchListRanked(v25 & 0xFFFFFFFFFFFFFFFCLL, a2, v23, a4 + 1, 0, a6, (uint64_t)v31);
    uint64_t v30 = v26;
    int v27 = v32;
    if (v32 != v31) {
      goto LABEL_21;
    }
    int v27 = v31;
LABEL_24:
    uint64_t v28 = 4LL;
LABEL_25:
    (*(void (**)(_BYTE *))(*(void *)v27 + 8 * v28))(v27);
    goto LABEL_26;
  }

  unint64_t v14 = *(void *)(a1 + 8LL * a2[a4] + 12);
  if ((v14 & 3) != 2)
  {
    if ((v14 & 3) == 1)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v37,  a7);
      uint64_t v15 = nlp::searchLevelRanked(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, v37);
      uint64_t v16 = v38;
      if (v38 == v37)
      {
        int v17 = 4LL;
        uint64_t v16 = v37;
LABEL_35:
        (*(void (**)(void))(*(void *)v16 + 8 * v17))();
        return v15;
      }

      goto LABEL_32;
    }

    return 0LL;
  }

  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v35,  a7);
  uint64_t v15 = nlp::searchListRanked(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, (uint64_t)v35);
  uint64_t v16 = v36;
  if (v36 == v35)
  {
    int v17 = 4LL;
    uint64_t v16 = v35;
    goto LABEL_35;
  }

      uint64_t v25 = v29;
LABEL_27:
      uint64_t v15 = v25 != 0;
      if (!v25)
      {
        uint64_t v20 = v21++ == 255;
        if (!v20) {
          continue;
        }
      }

      return v15;
    }

    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v30,  a7);
    uint64_t v25 = nlp::searchList(v24 & 0xFFFFFFFFFFFFFFFCLL, a2, v22, a4 + 1, 0, a6, (uint64_t)v30);
    uint64_t v29 = v25;
    uint64_t v26 = v31;
    if (v31 != v30) {
      goto LABEL_21;
    }
    uint64_t v26 = v30;
LABEL_24:
    int v27 = 4LL;
LABEL_25:
    (*(void (**)(_BYTE *))(*(void *)v26 + 8 * v27))(v26);
    goto LABEL_26;
  }

  unint64_t v14 = *(void *)&a1[2 * a2[a4] + 1];
  if ((v14 & 3) != 2)
  {
    if ((v14 & 3) == 1)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v36,  a7);
      uint64_t v15 = nlp::searchLevel(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, v36);
      uint64_t v16 = v37;
      if (v37 == v36)
      {
        int v17 = 4LL;
        uint64_t v16 = v36;
LABEL_35:
        (*(void (**)(void))(*(void *)v16 + 8 * v17))();
        return v15;
      }

      goto LABEL_32;
    }

    return 0LL;
  }

  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v34,  a7);
  uint64_t v15 = nlp::searchList(v14 & 0xFFFFFFFFFFFFFFFCLL, a2, a3, a4 + 1, a5, a6, (uint64_t)v34);
  uint64_t v16 = v35;
  if (v35 == v34)
  {
    int v17 = 4LL;
    uint64_t v16 = v34;
    goto LABEL_35;
  }

uint64_t featureset_comp(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2 = (*a1 > *a2) - (*a1 < *a2);
  if (!(_DWORD)v2)
  {
    int v3 = a1[1];
    int v4 = a2[1];
    BOOL v6 = __OFSUB__(v3, v4);
    BOOL v5 = v3 - v4 < 0;
    BOOL v7 = v3 > v4;
    int v8 = v5 ^ v6;
    uint64_t v2 = (v7 - v8);
    if (!(_DWORD)v2)
    {
      int v9 = a1[2];
      int v10 = a2[2];
      BOOL v6 = __OFSUB__(v9, v10);
      BOOL v5 = v9 - v10 < 0;
      BOOL v11 = v9 > v10;
      BOOL v12 = v5 != v6;
      return (v11 - v12);
    }
  }

  return v2;
}

uint64_t crf1mmw_get_offset_in_file(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 104) + a2;
}

uint64_t crf1mmw_get_offset_from_beginning_of_model(uint64_t a1)
{
  return MEMORY[0x1895A4CE4](*(void *)a1) - *(_DWORD *)(a1 + 104);
}

FILE *crf1mmw_close_file_pointer(FILE *result)
{
  if (LOBYTE(result->_ur))
  {
    uint64_t result = (FILE *)result->_p;
    if (result) {
      return (FILE *)fclose(result);
    }
  }

  return result;
}

uint64_t crf1mmw_initialize_header(uint64_t a1)
{
  *(_DWORD *)(a1 + 12) = 1179796332;
  *(void *)(a1 + 20) = 0x66434D4F46LL;
  *(_DWORD *)(a1 + 64) = 0;
  if (fseek(*(FILE **)a1, 48LL, 1)) {
    return 2147483651LL;
  }
  else {
    return 0LL;
  }
}

char *crf1mmw(const char *a1)
{
  uint64_t v2 = (char *)calloc(1uLL, 0x78uLL);
  if (v2)
  {
    int v3 = fopen(a1, "wb");
    *(void *)uint64_t v2 = v3;
    if (!v3
      || (v2[112] = 1,
          *((void *)v2 + 13) = 0LL,
          *((_DWORD *)v2 + 3) = 1179796332,
          *(void *)(v2 + 20) = 0x66434D4F46LL,
          *((_DWORD *)v2 + 16) = 0,
          fseek(v3, 48LL, 1)))
    {
      if (v2[112] && *(void *)v2) {
        fclose(*(FILE **)v2);
      }
      free(v2);
      return 0LL;
    }
  }

  return v2;
}

_BYTE *crf1mmw_from_file_pointer(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = calloc(1uLL, 0x78uLL);
  int v3 = v2;
  if (v2)
  {
    *(void *)uint64_t v2 = a1;
    v2[112] = 0;
    *((void *)v2 + 13) = MEMORY[0x1895A4CE4](a1);
    *((_DWORD *)v3 + 3) = 1179796332;
    *(void *)(v3 + 20) = 0x66434D4F46LL;
    *((_DWORD *)v3 + 16) = 0;
    if (fseek(*(FILE **)v3, 48LL, 1))
    {
      if (v3[112] && *(void *)v3) {
        fclose(*(FILE **)v3);
      }
      free(v3);
      return 0LL;
    }
  }

  return v3;
}

size_t write_header_to_file(FILE *a1, _DWORD *a2)
{
  int __ptr = a2[1];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  write_uint8_array(a1, (uint64_t)(a2 + 2));
  int __ptr = a2[3];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[4];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[5];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[6];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[7];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[8];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[9];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[10];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[11];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[12];
  fwrite(&__ptr, 4uLL, 1uLL, a1);
  int __ptr = a2[13];
  return fwrite(&__ptr, 4uLL, 1uLL, a1);
}

size_t write_uint8_array(FILE *__stream, uint64_t a2)
{
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    char __ptr = *(_BYTE *)(a2 + i);
    size_t result = fwrite(&__ptr, 1uLL, 1uLL, __stream);
  }

  return result;
}

uint64_t crf1dmw_close(unsigned int *a1)
{
  uint64_t v2 = *(FILE **)a1;
  int v3 = MEMORY[0x1895A4CE4](*(void *)a1);
  uint64_t v4 = *((void *)a1 + 13);
  a1[4] = v3 - v4;
  if (!fseek(v2, v4, 0))
  {
    write_header_to_file(v2, a1 + 3);
    if (!ferror(v2))
    {
      fseek(v2, *((void *)a1 + 13) + a1[4], 0);
      if (!*((_BYTE *)a1 + 112))
      {
        uint64_t v7 = 0LL;
        goto LABEL_7;
      }

      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
      BOOL v5 = *(FILE **)a1;
      if (!*(void *)a1) {
        goto LABEL_7;
      }
LABEL_5:
      fclose(v5);
      uint64_t v7 = v6;
      goto LABEL_7;
    }
  }

  if (!*((_BYTE *)a1 + 112))
  {
    uint64_t v7 = 1LL;
    goto LABEL_7;
  }

  BOOL v5 = *(FILE **)a1;
  uint64_t v6 = 1LL;
  uint64_t v7 = 1LL;
  if (*(void *)a1) {
    goto LABEL_5;
  }
LABEL_7:
  free(a1);
  return v7;
}

uint64_t crf1dmw_open_labels(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 8)) {
    return 1LL;
  }
  *(_DWORD *)(a1 + 44) = MEMORY[0x1895A4CE4](*(void *)a1) - *(_DWORD *)(a1 + 104);
  BOOL v5 = cqdb_writer(*(FILE **)a1, 0);
  *(void *)(a1 + 72) = v5;
  if (!v5)
  {
    *(_DWORD *)(a1 + 44) = 0;
    return 1LL;
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 8) = 1;
  *(_DWORD *)(a1 + 32) = a2;
  return result;
}

uint64_t crf1dmw_close_labels(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8) != 1) {
    return 1LL;
  }
  uint64_t result = cqdb_writer_close(*(void *)(a1 + 72));
  if ((_DWORD)result) {
    return 1LL;
  }
  *(void *)(a1 + 72) = 0LL;
  *(_DWORD *)(a1 + 8) = 0;
  return result;
}

BOOL crf1dmw_put_label(uint64_t a1, unsigned int a2, char *__s)
{
  return *(_DWORD *)(a1 + 8) != 1 || cqdb_writer_put(*(void *)(a1 + 72), __s, a2) != 0;
}

uint64_t crf1dmw_set_no_labels(uint64_t result, int a2)
{
  *(_DWORD *)(result + 32) = a2;
  *(_DWORD *)(result + 44) = 0;
  return result;
}

uint64_t crf1dmw_open_attrs(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 8)) {
    return 1LL;
  }
  *(_DWORD *)(a1 + 48) = MEMORY[0x1895A4CE4](*(void *)a1) - *(_DWORD *)(a1 + 104);
  BOOL v5 = cqdb_writer(*(FILE **)a1, 0);
  *(void *)(a1 + 72) = v5;
  if (!v5)
  {
    *(_DWORD *)(a1 + 48) = 0;
    return 1LL;
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 8) = 2;
  *(_DWORD *)(a1 + 36) = a2;
  return result;
}

uint64_t crf1dmw_close_attrs(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8) != 2) {
    return 1LL;
  }
  uint64_t result = cqdb_writer_close(*(void *)(a1 + 72));
  if ((_DWORD)result) {
    return 1LL;
  }
  *(void *)(a1 + 72) = 0LL;
  *(_DWORD *)(a1 + 8) = 0;
  return result;
}

BOOL crf1dmw_put_attr(uint64_t a1, unsigned int a2, char *__s)
{
  return *(_DWORD *)(a1 + 8) != 2 || cqdb_writer_put(*(void *)(a1 + 72), __s, a2) != 0;
}

uint64_t crf1dmw_open_labelrefs(void *a1, int a2)
{
  if (*((_DWORD *)a1 + 2)) {
    return 2147483652LL;
  }
  BOOL v5 = (FILE *)*a1;
  uint64_t v6 = 4LL * a2 + 12;
  uint64_t v7 = calloc(v6, 1uLL);
  if (!v7) {
    return 2147483649LL;
  }
  int v8 = v7;
  int v9 = MEMORY[0x1895A4CE4](v5);
  if ((v9 & 3) != 0)
  {
    int v10 = v9 + 1;
    do
    {
      char __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, v5);
    }

    while ((v10++ & 3) != 0);
  }

  *((_DWORD *)a1 + 14) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 26);
  fseek(v5, v6, 1);
  uint64_t result = 0LL;
  *(void *)int v8 = 1179797068LL;
  v8[2] = a2;
  a1[11] = v8;
  *((_DWORD *)a1 + 2) = 3;
  return result;
}

uint64_t crf1dmw_close_labelrefs(void *a1)
{
  if (*((_DWORD *)a1 + 2) != 3) {
    return 2147483652LL;
  }
  uint64_t v2 = (FILE *)*a1;
  int v3 = (_DWORD *)a1[11];
  uint64_t v4 = *((unsigned int *)a1 + 14);
  int v5 = MEMORY[0x1895A4CE4](*a1);
  uint64_t v6 = a1[13];
  unsigned int v7 = v5 - v6;
  v3[1] = v5 - v6 - v4;
  fseek(v2, v6 + v4, 0);
  write_uint8_array(v2, (uint64_t)v3);
  int __ptr = v3[1];
  fwrite(&__ptr, 4uLL, 1uLL, v2);
  int v11 = v3[2];
  fwrite(&v11, 4uLL, 1uLL, v2);
  if (v3[2])
  {
    unint64_t v8 = 0LL;
    do
    {
      int v12 = v3[v8 + 3];
      fwrite(&v12, 4uLL, 1uLL, v2);
      ++v8;
    }

    while (v8 < v3[2]);
  }

  fseek(v2, a1[13] + v7, 0);
  free(v3);
  uint64_t result = 0LL;
  a1[11] = 0LL;
  *((_DWORD *)a1 + 2) = 0;
  return result;
}

uint64_t crf1dmw_put_labelref(void *a1, int a2, unsigned int *a3, uint64_t a4)
{
  if (*((_DWORD *)a1 + 2) != 3) {
    return 2147483652LL;
  }
  uint64_t v6 = (FILE *)*a1;
  uint64_t v7 = a1[11];
  *(_DWORD *)(v7 + 4LL * a2 + 12) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 26);
  uint64_t v8 = *a3;
  if ((int)v8 < 1)
  {
    int v9 = 0;
  }

  else
  {
    int v9 = 0;
    int v10 = (int *)*((void *)a3 + 1);
    do
    {
      uint64_t v11 = *v10++;
      v9 += *(_DWORD *)(a4 + 4 * v11) >= 0;
      --v8;
    }

    while (v8);
  }

  int __ptr = v9;
  fwrite(&__ptr, 4uLL, 1uLL, v6);
  int v13 = *a3;
  if ((int)*a3 >= 1)
  {
    uint64_t v14 = 0LL;
    do
    {
      if ((*(_DWORD *)(a4 + 4LL * *(int *)(*((void *)a3 + 1) + 4 * v14)) & 0x80000000) == 0)
      {
        int v16 = *(_DWORD *)(a4 + 4LL * *(int *)(*((void *)a3 + 1) + 4 * v14));
        fwrite(&v16, 4uLL, 1uLL, v6);
        int v13 = *a3;
      }

      ++v14;
    }

    while (v14 < v13);
  }

  return 0LL;
}

uint64_t crf1dmw_open_attrrefs(void *a1, int a2)
{
  if (*((_DWORD *)a1 + 2)) {
    return 2147483652LL;
  }
  int v5 = (FILE *)*a1;
  uint64_t v6 = 4LL * a2 + 12;
  uint64_t v7 = calloc(v6, 1uLL);
  if (!v7) {
    return 2147483649LL;
  }
  uint64_t v8 = v7;
  int v9 = MEMORY[0x1895A4CE4](v5);
  if ((v9 & 3) != 0)
  {
    int v10 = v9 + 1;
    do
    {
      char __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, v5);
    }

    while ((v10++ & 3) != 0);
  }

  *((_DWORD *)a1 + 15) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 26);
  fseek(v5, v6, 1);
  uint64_t result = 0LL;
  *(void *)uint64_t v8 = 1179797057LL;
  v8[2] = a2;
  a1[11] = v8;
  *((_DWORD *)a1 + 2) = 4;
  return result;
}

uint64_t crf1dmw_close_attrrefs(void *a1)
{
  if (*((_DWORD *)a1 + 2) != 4) {
    return 2147483652LL;
  }
  uint64_t v2 = (FILE *)*a1;
  int v3 = (_DWORD *)a1[11];
  uint64_t v4 = *((unsigned int *)a1 + 15);
  int v5 = MEMORY[0x1895A4CE4](*a1);
  uint64_t v6 = a1[13];
  unsigned int v7 = v5 - v6;
  v3[1] = v5 - v6 - v4;
  fseek(v2, v6 + v4, 0);
  write_uint8_array(v2, (uint64_t)v3);
  int __ptr = v3[1];
  fwrite(&__ptr, 4uLL, 1uLL, v2);
  int v11 = v3[2];
  fwrite(&v11, 4uLL, 1uLL, v2);
  if (v3[2])
  {
    unint64_t v8 = 0LL;
    do
    {
      int v12 = v3[v8 + 3];
      fwrite(&v12, 4uLL, 1uLL, v2);
      ++v8;
    }

    while (v8 < v3[2]);
  }

  fseek(v2, a1[13] + v7, 0);
  free(v3);
  uint64_t result = 0LL;
  a1[11] = 0LL;
  *((_DWORD *)a1 + 2) = 0;
  return result;
}

uint64_t crf1dmw_put_attrref(void *a1, int a2, unsigned int *a3, uint64_t a4)
{
  if (*((_DWORD *)a1 + 2) != 4) {
    return 2147483652LL;
  }
  uint64_t v6 = (FILE *)*a1;
  uint64_t v7 = a1[11];
  *(_DWORD *)(v7 + 4LL * a2 + 12) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 26);
  uint64_t v8 = *a3;
  if ((int)v8 < 1)
  {
    int v9 = 0;
  }

  else
  {
    int v9 = 0;
    int v10 = (int *)*((void *)a3 + 1);
    do
    {
      uint64_t v11 = *v10++;
      v9 += *(_DWORD *)(a4 + 4 * v11) >= 0;
      --v8;
    }

    while (v8);
  }

  int __ptr = v9;
  fwrite(&__ptr, 4uLL, 1uLL, v6);
  int v13 = *a3;
  if ((int)*a3 >= 1)
  {
    uint64_t v14 = 0LL;
    do
    {
      if ((*(_DWORD *)(a4 + 4LL * *(int *)(*((void *)a3 + 1) + 4 * v14)) & 0x80000000) == 0)
      {
        int v16 = *(_DWORD *)(a4 + 4LL * *(int *)(*((void *)a3 + 1) + 4 * v14));
        fwrite(&v16, 4uLL, 1uLL, v6);
        int v13 = *a3;
      }

      ++v14;
    }

    while (v14 < v13);
  }

  return 0LL;
}

uint64_t crf1dmw_set_no_attributes(uint64_t result, int a2)
{
  *(_DWORD *)(result + 36) = a2;
  *(_DWORD *)(result + 48) = 0;
  return result;
}

uint64_t crf1dmw_open_features(void *a1)
{
  if (*((_DWORD *)a1 + 2)) {
    return 2147483652LL;
  }
  int v3 = (FILE *)*a1;
  uint64_t v4 = calloc(0xCuLL, 1uLL);
  if (!v4) {
    return 2147483649LL;
  }
  int v5 = v4;
  *((_DWORD *)a1 + 10) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 26);
  fseek(v3, 12LL, 1);
  uint64_t result = 0LL;
  _DWORD *v5 = 1413563718;
  a1[12] = v5;
  *((_DWORD *)a1 + 2) = 5;
  return result;
}

uint64_t crf1dmw_close_features(void *a1)
{
  if (*((_DWORD *)a1 + 2) != 5) {
    return 2147483652LL;
  }
  uint64_t v2 = *((unsigned int *)a1 + 10);
  int v3 = (_DWORD *)a1[12];
  uint64_t v4 = (FILE *)*a1;
  int v5 = MEMORY[0x1895A4CE4](*a1);
  uint64_t v6 = a1[13];
  unsigned int v7 = v5 - v6;
  v3[1] = v5 - v6 - v2;
  fseek(v4, v6 + v2, 0);
  write_uint8_array(v4, (uint64_t)v3);
  int __ptr = v3[1];
  fwrite(&__ptr, 4uLL, 1uLL, v4);
  int v10 = v3[2];
  fwrite(&v10, 4uLL, 1uLL, v4);
  fseek(v4, a1[13] + v7, 0);
  free(v3);
  uint64_t result = 0LL;
  a1[12] = 0LL;
  *((_DWORD *)a1 + 2) = 0;
  return result;
}

uint64_t crf1dmw_put_feature(uint64_t a1, int a2, uint64_t a3)
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t result = 2147483652LL;
  if (*(_DWORD *)(a1 + 8) == 5)
  {
    uint64_t v5 = *(void *)(a1 + 96);
    if (*(_DWORD *)(v5 + 8) == a2)
    {
      unsigned int v7 = *(FILE **)a1;
      LODWORD(v8[0]) = *(_DWORD *)a3;
      fwrite(v8, 4uLL, 1uLL, v7);
      LODWORD(v8[0]) = *(_DWORD *)(a3 + 4);
      fwrite(v8, 4uLL, 1uLL, v7);
      LODWORD(v8[0]) = *(_DWORD *)(a3 + 8);
      fwrite(v8, 4uLL, 1uLL, v7);
      v8[0] = *(void *)(a3 + 16);
      fwrite(v8, 1uLL, 8uLL, v7);
      uint64_t result = 0LL;
      ++*(_DWORD *)(v5 + 8);
    }
  }

  return result;
}

uint64_t read_attributes(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(*(void *)(a1 + 32) + 36LL);
  if (!(_DWORD)v2)
  {
    int v4 = 1;
    goto LABEL_5;
  }

  int v3 = cqdb_reader(*(void *)(a1 + 16) + v2, (*(_DWORD *)(a1 + 24) - v2));
  *(void *)(a1 + 64) = v3;
  if (v3)
  {
    int v4 = 0;
LABEL_5:
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 4) = v4;
    return result;
  }

  return 1LL;
}

void *create_buffer_from_file(FILE *a1, _DWORD *a2)
{
  if (!a1) {
    return 0LL;
  }
  fseek(a1, 0LL, 2);
  *a2 = MEMORY[0x1895A4CE4](a1);
  fseek(a1, 0LL, 0);
  size_t v4 = *a2;
  uint64_t v5 = malloc(v4);
  if (fread(v5, 1uLL, v4, a1) != *a2)
  {
    free(v5);
    return 0LL;
  }

  return v5;
}

BOOL read_header_from_buffer(_DWORD *a1, char *__s1)
{
  for (uint64_t i = 0LL; i != 4; ++i)
    __s1[i] = *((_BYTE *)a1 + i);
  int v5 = strncmp(__s1, "lCRF", 4uLL);
  if (!v5)
  {
    uint64_t v6 = 0LL;
    *((_DWORD *)__s1 + 1) = a1[1];
    do
    {
      __s1[v6 + 8] = *((_BYTE *)a1 + v6 + 8);
      ++v6;
    }

    while (v6 != 4);
    *((_DWORD *)__s1 + 3) = a1[3];
    *((_DWORD *)__s1 + 4) = a1[4];
    *((_DWORD *)__s1 + 5) = a1[5];
    *((_DWORD *)__s1 + 6) = a1[6];
    *((_DWORD *)__s1 + 7) = a1[7];
    *((_DWORD *)__s1 + 8) = a1[8];
    *((_DWORD *)__s1 + 9) = a1[9];
    *((_DWORD *)__s1 + 10) = a1[10];
    *((_DWORD *)__s1 + 11) = a1[11];
    *((_DWORD *)__s1 + 12) = a1[12];
    *((_DWORD *)__s1 + 13) = a1[13];
  }

  return v5 == 0;
}

uint64_t crf1dm_initialize_header(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24) < 0x10u) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  int v4 = *(_DWORD *)(v2 + 12);
  *(_DWORD *)a1 = v4;
  switch(v4)
  {
    case 210:
      *(void *)(a1 + 32) = 0LL;
      *(void *)(a1 + 40) = 0LL;
      uint64_t v6 = (char *)calloc(1uLL, 0x37uLL);
      *(void *)(a1 + 48) = v6;
      unsigned int v7 = *(__int128 **)(a1 + 16);
      __int128 v9 = v7[1];
      __int128 v8 = v7[2];
      __int128 v10 = *v7;
      *(void *)(v6 + 47) = *(void *)((char *)v7 + 47);
      *(_OWORD *)uint64_t v6 = v10;
      *((_OWORD *)v6 + 1) = v9;
      *((_OWORD *)v6 + 2) = v8;
      break;
    case 200:
      *(void *)(a1 + 32) = 0LL;
      *(void *)(a1 + 48) = 0LL;
      uint64_t v11 = calloc(1uLL, 0x30uLL);
      *(void *)(a1 + 40) = v11;
      int v12 = *(__int128 **)(a1 + 16);
      __int128 v13 = *v12;
      __int128 v14 = v12[2];
      v11[1] = v12[1];
      v11[2] = v14;
      _OWORD *v11 = v13;
      break;
    case 102:
      *(void *)(a1 + 40) = 0LL;
      *(void *)(a1 + 48) = 0LL;
      int v5 = (char *)calloc(1uLL, 0x38uLL);
      *(void *)(a1 + 32) = v5;
      if (!read_header_from_buffer(*(_DWORD **)(a1 + 16), v5)) {
        return 0LL;
      }
      break;
    default:
      return 0LL;
  }

  return 1LL;
}

uint64_t crf1dm_instantiate_internal(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 16))
    {
      uint64_t result = crf1dm_initialize_header(result);
      if ((_DWORD)result)
      {
        if (*(_DWORD *)v1 == 102)
        {
          uint64_t v2 = *(unsigned int *)(*(void *)(v1 + 32) + 32LL);
          *(void *)(v1 + 56) = cqdb_reader(*(void *)(v1 + 16) + v2, (*(_DWORD *)(v1 + 24) - v2));
          read_attributes(v1);
        }

        return 1LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

_DWORD *crf1dm_new(const char *a1)
{
  uint64_t v2 = calloc(1uLL, 0x58uLL);
  if (v2)
  {
    int v3 = fopen(a1, "rb");
    if (!v3
      || (int v4 = v3,
          buffer_from_file = create_buffer_from_file(v3, v2 + 6),
          *((void *)v2 + 1) = buffer_from_file,
          *((void *)v2 + 2) = buffer_from_file,
          *((_BYTE *)v2 + 80) = 1,
          fclose(v4),
          (crf1dm_instantiate_internal((uint64_t)v2) & 1) == 0))
    {
      crf1dm_close(v2);
      return 0LL;
    }
  }

  return v2;
}

void crf1dm_close(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void **)a1[7];
    if (v2) {
      cqdb_delete(v2);
    }
    int v3 = (void **)a1[8];
    if (v3 && !*((_DWORD *)a1 + 1)) {
      cqdb_delete(v3);
    }
    int v4 = (void *)a1[4];
    if (v4) {
      free(v4);
    }
    int v5 = (void *)a1[5];
    if (v5) {
      free(v5);
    }
    uint64_t v6 = (void *)a1[6];
    if (v6) {
      free(v6);
    }
    unsigned int v7 = (void *)a1[1];
    if (v7)
    {
      if (*((_BYTE *)a1 + 80)) {
        free(v7);
      }
    }

    free(a1);
  }

void *crf1dm_new_from_buffer(uint64_t a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  int v4 = calloc(1uLL, 0x58uLL);
  int v5 = v4;
  if (v4)
  {
    v4[1] = a1;
    v4[2] = a1;
    *((_DWORD *)v4 + 6) = a2;
    *((_BYTE *)v4 + 80) = 0;
    if ((crf1dm_instantiate_internal((uint64_t)v4) & 1) == 0)
    {
      crf1dm_close(v5);
      return 0LL;
    }
  }

  return v5;
}

uint64_t crf1dm_get_num_attrs@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v2 = *a1;
  if (*a1 == 210)
  {
    int v3 = (unsigned int *)(*((void *)a1 + 6) + 35LL);
    return *v3;
  }

  if (v2 == 200)
  {
    int v3 = (unsigned int *)(*((void *)a1 + 5) + 28LL);
    return *v3;
  }

  if (v2 == 102)
  {
    int v3 = (unsigned int *)(*((void *)a1 + 4) + 24LL);
    return *v3;
  }

  return a2;
}

uint64_t crf1dm_get_num_labels@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v2 = *a1;
  if (*a1 == 210) {
    return *(unsigned __int8 *)(*((void *)a1 + 6) + 34LL);
  }
  if (v2 == 200) {
    return *(unsigned int *)(*((void *)a1 + 5) + 24LL);
  }
  if (v2 == 102) {
    return *(unsigned int *)(*((void *)a1 + 4) + 20LL);
  }
  return a2;
}

uint64_t crf1dm_to_label(uint64_t a1, unsigned int a2)
{
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return cqdb_to_string(result, a2);
  }
  return result;
}

uint64_t crf1dm_to_lid(uint64_t a1, char *a2)
{
  int v2 = *(void **)(a1 + 56);
  if (v2) {
    return cqdb_to_id(v2, a2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t crf1dm_to_aid(uint64_t a1, char *a2)
{
  int v3 = *(void **)(a1 + 64);
  if (v3 && !*(_DWORD *)(a1 + 4)) {
    return cqdb_to_id(v3, a2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t crf1dm_to_attr(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3 && !*(_DWORD *)(a1 + 4)) {
    return cqdb_to_string(v3, a2);
  }
  else {
    return 0LL;
  }
}

uint64_t crf1dm_get_labelref(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = (_DWORD *)(*(void *)(a1 + 16)
                + *(unsigned int *)(*(void *)(a1 + 16) + *(unsigned int *)(*(void *)(a1 + 32) + 44LL) + 4LL * a2 + 12));
  *(_DWORD *)a3 = *v3;
  *(void *)(a3 + 8) = v3 + 1;
  return 0LL;
}

uint64_t crf1dm_get_attrref(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = (_DWORD *)(*(void *)(a1 + 16)
                + *(unsigned int *)(*(void *)(a1 + 16) + *(unsigned int *)(*(void *)(a1 + 32) + 48LL) + 4LL * a2 + 12));
  *(_DWORD *)a3 = *v3;
  *(void *)(a3 + 8) = v3 + 1;
  return 0LL;
}

uint64_t crf1dm_get_featureid(uint64_t a1, int a2)
{
  return *(unsigned int *)(*(void *)(a1 + 8) + 4LL * a2);
}

uint64_t crf1dm_get_feature(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16) + (*(_DWORD *)(*(void *)(a1 + 32) + 28LL) + 20 * a2 + 12);
  *(_DWORD *)a3 = *(_DWORD *)v3;
  *(_DWORD *)(a3 + 4) = *(_DWORD *)(v3 + 4);
  *(_DWORD *)(a3 + 8) = *(_DWORD *)(v3 + 8);
  *(void *)(a3 + 16) = *(void *)(v3 + 12);
  return 0LL;
}

uint64_t crf1dm_dump(uint64_t a1, FILE *__stream)
{
  int v4 = *(unsigned __int8 **)(a1 + 32);
  fwrite("FILEHEADER = {\n", 0xFuLL, 1uLL, __stream);
  fprintf(__stream, "  magic: %c%c%c%c\n", *v4, v4[1], v4[2], v4[3]);
  fprintf(__stream, "  size: %d\n", *((_DWORD *)v4 + 1));
  fprintf(__stream, "  type: %c%c%c%c\n", v4[8], v4[9], v4[10], v4[11]);
  fprintf(__stream, "  version: %d\n", *((_DWORD *)v4 + 3));
  fprintf(__stream, "  num_features: %d\n", *((_DWORD *)v4 + 4));
  fprintf(__stream, "  num_labels: %d\n", *((_DWORD *)v4 + 5));
  fprintf(__stream, "  num_attrs: %d\n", *((_DWORD *)v4 + 6));
  fprintf(__stream, "  off_features: 0x%X\n", *((_DWORD *)v4 + 7));
  fprintf(__stream, "  off_labels: 0x%X\n", *((_DWORD *)v4 + 8));
  fprintf(__stream, "  off_attrs: 0x%X\n", *((_DWORD *)v4 + 9));
  fprintf(__stream, "  off_labelrefs: 0x%X\n", *((_DWORD *)v4 + 11));
  fprintf(__stream, "  off_attrrefs: 0x%X\n", *((_DWORD *)v4 + 12));
  fwrite("}\n", 2uLL, 1uLL, __stream);
  fputc(10, __stream);
  fwrite("LABELS = {\n", 0xBuLL, 1uLL, __stream);
  if (*((_DWORD *)v4 + 5))
  {
    unsigned int v5 = 0;
    do
    {
      uint64_t v6 = *(const char **)(a1 + 56);
      if (v6) {
        uint64_t v6 = (const char *)cqdb_to_string((uint64_t)v6, v5);
      }
      fprintf(__stream, "  %5d: %s\n", v5++, v6);
    }

    while (v5 < *((_DWORD *)v4 + 5));
  }

  fwrite("}\n", 2uLL, 1uLL, __stream);
  fputc(10, __stream);
  fwrite("ATTRIBUTES = {\n", 0xFuLL, 1uLL, __stream);
  if (*((_DWORD *)v4 + 6))
  {
    unsigned int v7 = 0;
    do
    {
      __int128 v8 = *(const char **)(a1 + 64);
      if (v8)
      {
        if (*(_DWORD *)(a1 + 4)) {
          __int128 v8 = 0LL;
        }
        else {
          __int128 v8 = (const char *)cqdb_to_string((uint64_t)v8, v7);
        }
      }

      fprintf(__stream, "  %5d: %s\n", v7++, v8);
    }

    while (v7 < *((_DWORD *)v4 + 6));
  }

  fwrite("}\n", 2uLL, 1uLL, __stream);
  fputc(10, __stream);
  fwrite("TRANSITIONS = {\n", 0x10uLL, 1uLL, __stream);
  unsigned int v9 = *((_DWORD *)v4 + 5);
  if (v9)
  {
    for (unsigned int i = 0; i < v9; ++i)
    {
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(unsigned int *)(v11 + *(unsigned int *)(*(void *)(a1 + 32) + 44LL) + 4LL * (int)i + 12);
      __int128 v13 = (int *)(v11 + v12 + 4);
      uint64_t v14 = *(unsigned int *)(v11 + v12);
      if ((int)v14 >= 1)
      {
        do
        {
          int v15 = *v13++;
          crf1dm_get_feature(a1, v15, (uint64_t)&v29);
          int v16 = *(const char **)(a1 + 56);
          if (v16)
          {
            int v17 = (const char *)cqdb_to_string((uint64_t)v16, v30);
            int v16 = *(const char **)(a1 + 56);
            if (v16) {
              int v16 = (const char *)cqdb_to_string((uint64_t)v16, v31);
            }
          }

          else
          {
            int v17 = 0LL;
          }

          fprintf(__stream, "  (%d) %s --> %s: %f\n", v29, v17, v16, v32);
          --v14;
        }

        while (v14);
        unsigned int v9 = *((_DWORD *)v4 + 5);
      }
    }
  }

  fwrite("}\n", 2uLL, 1uLL, __stream);
  fputc(10, __stream);
  fwrite("STATE_FEATURES = {\n", 0x13uLL, 1uLL, __stream);
  unsigned int v18 = *((_DWORD *)v4 + 6);
  if (v18)
  {
    for (unsigned int j = 0; j < v18; ++j)
    {
      uint64_t v20 = *(void *)(a1 + 16);
      uint64_t v21 = *(unsigned int *)(v20 + *(unsigned int *)(*(void *)(a1 + 32) + 48LL) + 4LL * (int)j + 12);
      uint64_t v22 = (int *)(v20 + v21 + 4);
      uint64_t v23 = *(unsigned int *)(v20 + v21);
      if ((int)v23 >= 1)
      {
        do
        {
          int v24 = *v22++;
          crf1dm_get_feature(a1, v24, (uint64_t)&v29);
          uint64_t v25 = *(void *)(a1 + 64);
          if (v25 && !*(_DWORD *)(a1 + 4)) {
            uint64_t v26 = (const char *)cqdb_to_string(v25, v30);
          }
          else {
            uint64_t v26 = 0LL;
          }
          int v27 = *(const char **)(a1 + 56);
          if (v27) {
            int v27 = (const char *)cqdb_to_string((uint64_t)v27, v31);
          }
          fprintf(__stream, "  (%d) %s --> %s: %f\n", v29, v26, v27, v32);
          --v23;
        }

        while (v23);
        unsigned int v18 = *((_DWORD *)v4 + 6);
      }
    }
  }

  fwrite("}\n", 2uLL, 1uLL, __stream);
  return fputc(10, __stream);
}

uint64_t crf1dm_get_version(unsigned int *a1)
{
  return *a1;
}

uint64_t crf1dm_get_number_of_labels(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 20LL);
}

uint64_t crf1dm_get_number_of_attributes(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 24LL);
}

uint64_t crf1dm_initialize_transition_scores(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 210)
  {
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(unsigned __int8 *)(v16 + 34);
    if (*(_BYTE *)(v16 + 34))
    {
      uint64_t v18 = 0LL;
      uint64_t v19 = (char *)(*(void *)(a1 + 16) + *(unsigned int *)(v16 + 39));
      do
      {
        memcpy((void *)(*(void *)(a2 + 32) + 8LL * *(_DWORD *)(a2 + 4) * (int)v18++), v19, 8 * v17);
        v19 += 8 * v17;
      }

      while (v17 != v18);
    }
  }

  else if (v4 == 200)
  {
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(unsigned int *)(v20 + 24);
    if ((int)v21 >= 1)
    {
      uint64_t v22 = 0LL;
      uint64_t v23 = (char *)(*(void *)(a1 + 16) + *(unsigned int *)(v20 + 32));
      do
      {
        memcpy((void *)(*(void *)(a2 + 32) + 8 * v22 * *(int *)(a2 + 4)), v23, 8 * v21);
        ++v22;
        v23 += 8 * v21;
      }

      while (v21 != v22);
    }
  }

  else if (v4 == 102)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(unsigned int *)(v5 + 20);
    if ((int)v6 >= 1)
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = *(void *)(a2 + 32);
      uint64_t v9 = *(int *)(a2 + 4);
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v11 = v10 + *(unsigned int *)(v5 + 44) + 12;
      do
      {
        uint64_t v12 = *(unsigned int *)(v11 + 4 * v7);
        __int128 v13 = (int *)(v10 + v12 + 4);
        uint64_t v14 = *(unsigned int *)(v10 + v12);
        if ((int)v14 >= 1)
        {
          do
          {
            int v15 = *v13++;
            crf1dm_get_feature(a1, v15, (uint64_t)v25);
            *(void *)(v8 + 8 * v7 * v9 + 8LL * v26) = v27;
            --v14;
          }

          while (v14);
        }

        ++v7;
      }

      while (v7 != v6);
    }
  }

  return 0LL;
}

uint64_t get_quantized_weight(double a1, double a2, double a3, double a4)
{
  if (a1 <= a3) {
    return 0LL;
  }
  if (a1 >= a4) {
    return 0xFFFFLL;
  }
  return (int)rint((a1 - a3) / a2);
}

double get_unquantized_weight(unsigned int a1, double a2, double a3)
{
  return a3 + (double)a1 * a2;
}

uint64_t crf1dm_initialize_state_scores( uint64_t a1, uint64_t a2, unsigned int *a3, double a4, double a5, double a6)
{
  int v7 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 210)
  {
    uint64_t v20 = *(void *)(a1 + 48);
    if (!v20) {
      crf1dm_initialize_state_scores_cold_2();
    }
    uint64_t v21 = *a3;
    if ((int)v21 >= 1)
    {
      uint64_t v22 = 0LL;
      uint64_t v23 = *(void *)(a1 + 16);
      uint64_t v24 = v23 + *(unsigned int *)(v20 + 47);
      uint64_t v25 = v23 + *(unsigned int *)(v20 + 51);
      uint64_t v26 = *((void *)a3 + 1);
      uint64_t v27 = *(void *)(a2 + 24);
      uint64_t v28 = *(int *)(a2 + 4);
      uint64_t v29 = *(unsigned int *)(v20 + 43) + v23 + 2;
      do
      {
        uint64_t v30 = *(unsigned int *)(v26 + 16 * v22);
        if ((int)v30 >= 1)
        {
          uint64_t v31 = 0LL;
          uint64_t v32 = v27 + 8 * v22 * v28;
          uint64_t v33 = *(void *)(v26 + 16 * v22 + 8);
          do
          {
            uint64_t v34 = *(int *)(v33 + 16 * v31);
            uint64_t v35 = *(unsigned __int8 *)(v24 + v34);
            if (*(_BYTE *)(v24 + v34))
            {
              double v36 = *(float *)(v20 + 16);
              double v37 = *(float *)(v20 + 20);
              uint64_t v38 = (unsigned __int8 *)(v29 + 3LL * *(unsigned int *)(v25 + 4 * v34));
              do
              {
                LOWORD(a6) = *((_WORD *)v38 - 1);
                unsigned int v39 = *v38;
                v38 += 3;
                a6 = *(double *)(v32 + 8LL * v39) + v37 + (double)*(unint64_t *)&a6 * v36;
                *(double *)(v32 + 8LL * v39) = a6;
                --v35;
              }

              while (v35);
            }

            ++v31;
          }

          while (v31 != v30);
        }

        ++v22;
      }

      while (v22 != v21);
    }
  }

  else if (v7 == 200)
  {
    uint64_t v40 = *(unsigned int **)(a1 + 40);
    if (!v40) {
      crf1dm_initialize_state_scores_cold_1();
    }
    uint64_t v41 = *a3;
    if ((int)v41 >= 1)
    {
      uint64_t v42 = 0LL;
      uint64_t v43 = *(void *)(a1 + 16);
      uint64_t v44 = v40[9];
      uint64_t v45 = v43 + v40[10];
      uint64_t v46 = v43 + v40[11];
      uint64_t v47 = *((void *)a3 + 1);
      uint64_t v48 = *(void *)(a2 + 24);
      uint64_t v49 = *(int *)(a2 + 4);
      uint64_t v50 = v44 + v43 + 8;
      do
      {
        uint64_t v51 = *(unsigned int *)(v47 + 16 * v42);
        if ((int)v51 >= 1)
        {
          uint64_t v52 = 0LL;
          uint64_t v53 = *(void *)(v47 + 16 * v42 + 8);
          do
          {
            uint64_t v54 = (double *)(v53 + 16 * v52);
            uint64_t v55 = *(int *)v54;
            uint64_t v56 = *(unsigned int *)(v45 + 4 * v55);
            if ((_DWORD)v56)
            {
              double v57 = v54[1];
              uint64_t v58 = (double *)(v50 + 12LL * *(unsigned int *)(v46 + 4 * v55));
              do
              {
                *(double *)(v48 + 8 * v42 * v49 + 8LL * *(unsigned int *)v58) = *(double *)(v48
                                                                                          + 8 * v42 * v49
                uint64_t v58 = (double *)((char *)v58 + 12);
                --v56;
              }

              while (v56);
            }

            ++v52;
          }

          while (v52 != v51);
        }

        ++v42;
      }

      while (v42 != v41);
    }
  }

  else if (v7 == 102)
  {
    uint64_t v62 = *a3;
    if ((int)v62 >= 1)
    {
      uint64_t v8 = 0LL;
      uint64_t v63 = *((void *)a3 + 1);
      uint64_t v60 = *(int *)(a2 + 4);
      uint64_t v61 = *(void *)(a2 + 24);
      do
      {
        uint64_t v64 = v8;
        uint64_t v9 = *(unsigned int *)(v63 + 16 * v8);
        if ((int)v9 >= 1)
        {
          uint64_t v10 = 0LL;
          uint64_t v11 = *(void *)(a1 + 16);
          uint64_t v12 = *(void *)(a1 + 32);
          uint64_t v13 = *(void *)(v63 + 16 * v8 + 8);
          do
          {
            uint64_t v14 = (double *)(v13 + 16 * v10);
            uint64_t v15 = *(unsigned int *)(v11 + 12 + *(unsigned int *)(v12 + 48) + 4LL * *(int *)v14);
            uint64_t v17 = (int *)(v11 + v15 + 4);
            uint64_t v16 = *(unsigned int *)(v11 + v15);
            if ((int)v16 >= 1)
            {
              double v18 = v14[1];
              do
              {
                int v19 = *v17++;
                crf1dm_get_feature(a1, v19, (uint64_t)v65);
                *(double *)(v61 + 8 * v64 * v60 + 8LL * v66) = *(double *)(v61 + 8 * v64 * v60 + 8LL * v66) + v67 * v18;
                --v16;
              }

              while (v16);
            }

            ++v10;
          }

          while (v10 != v9);
        }

        uint64_t v8 = v64 + 1;
      }

      while (v64 + 1 != v62);
    }
  }

  return 0LL;
}

uint64_t cmw_initialize_header(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 1179796332;
  *(void *)(a1 + 16) = 0xC8434D4F46LL;
  if (fseek(*(FILE **)a1, 48LL, 1)) {
    return 2147483651LL;
  }
  else {
    return 0LL;
  }
}

uint64_t cmw_close(FILE **a1)
{
  int v2 = *a1;
  int v3 = MEMORY[0x1895A4CE4](*a1);
  int v4 = a1[7];
  *((_DWORD *)a1 + 3) = v3 - (_DWORD)v4;
  if (!fseek(v2, v4, 0))
  {
    fwrite(a1 + 1, 0x30uLL, 1uLL, v2);
    if (!ferror(v2))
    {
      fseek(v2, (*((_DWORD *)a1 + 3) + *((_DWORD *)a1 + 14)), 0);
      if (!*((_BYTE *)a1 + 64))
      {
        uint64_t v7 = 0LL;
        goto LABEL_7;
      }

      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
      uint64_t v5 = *a1;
      if (!*a1) {
        goto LABEL_7;
      }
LABEL_5:
      fclose(v5);
      uint64_t v7 = v6;
      goto LABEL_7;
    }
  }

  if (!*((_BYTE *)a1 + 64))
  {
    uint64_t v7 = 1LL;
    goto LABEL_7;
  }

  uint64_t v5 = *a1;
  uint64_t v6 = 1LL;
  uint64_t v7 = 1LL;
  if (*a1) {
    goto LABEL_5;
  }
LABEL_7:
  free(a1);
  return v7;
}

_BYTE *cmw_create_from_file_pointer(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  int v2 = calloc(1uLL, 0x48uLL);
  int v3 = v2;
  if (v2)
  {
    *(void *)int v2 = a1;
    v2[64] = 0;
    *((void *)v2 + 7) = MEMORY[0x1895A4CE4](a1);
    *((_DWORD *)v3 + 2) = 1179796332;
    *((void *)v3 + 2) = 0xC8434D4F46LL;
    if (fseek(*(FILE **)v3, 48LL, 1))
    {
      cmw_close((FILE **)v3);
      free(v3);
      return 0LL;
    }
  }

  return v3;
}

uint64_t cmw_write_label_features(void *a1, int a2, int a3, const void *a4)
{
  *((_DWORD *)a1 + 8) = a2;
  *((_DWORD *)a1 + 6) = a3;
  unsigned int v7 = MEMORY[0x1895A4CE4](*a1);
  if ((v7 & 3) != 0)
  {
    uint64_t v8 = v7 + 1LL;
    do
    {
      char __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }

    while ((v8++ & 3) != 0);
  }

  *((_DWORD *)a1 + 10) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 14);
  fwrite(a4, 8uLL, (a2 * a2), (FILE *)*a1);
  fseek((FILE *)*a1, 0LL, 2);
  return 0LL;
}

uint64_t cmw_write_attribute_feature_counts_and_offsets( void *a1, unsigned int a2, const void *a3, const void *a4)
{
  *((_DWORD *)a1 + 9) = a2;
  unsigned int v8 = MEMORY[0x1895A4CE4](*a1);
  if ((v8 & 3) != 0)
  {
    uint64_t v9 = v8 + 1LL;
    do
    {
      char __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }

    while ((v9++ & 3) != 0);
  }

  *((_DWORD *)a1 + 12) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 14);
  fwrite(a3, 4uLL, a2, (FILE *)*a1);
  *((_DWORD *)a1 + 13) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 14);
  fwrite(a4, 4uLL, a2, (FILE *)*a1);
  fseek((FILE *)*a1, 0LL, 2);
  return 0LL;
}

uint64_t cmw_open_attribute_features(void *a1, int a2)
{
  *((_DWORD *)a1 + 7) = a2;
  unsigned int v3 = MEMORY[0x1895A4CE4](*a1);
  if ((v3 & 3) != 0)
  {
    uint64_t v4 = v3 + 1LL;
    do
    {
      char __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }

    while ((v4++ & 3) != 0);
  }

  *((_DWORD *)a1 + 11) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 14);
  return 0LL;
}

uint64_t cmw_write_attribute_feature(FILE **a1, int a2, double a3)
{
  double v4 = a3;
  int v5 = a2;
  if (fwrite(&v4, 1uLL, 0xCuLL, *a1) != 12) {
    cmw_write_attribute_feature_cold_1();
  }
  return 0LL;
}

uint64_t qmw_initialize_header(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 1179796332;
  *(_DWORD *)(a1 + 32) = 1077936128;
  *(void *)(a1 + 16) = 0xD2434D4F46LL;
  *(void *)(a1 + 24) = 0xC040000038C000C0LL;
  if (fseek(*(FILE **)a1, 55LL, 1)) {
    return 2147483651LL;
  }
  else {
    return 0LL;
  }
}

uint64_t qmw_close(FILE **a1)
{
  int v2 = *a1;
  int v3 = MEMORY[0x1895A4CE4](*a1);
  double v4 = a1[8];
  *((_DWORD *)a1 + 3) = v3 - (_DWORD)v4;
  if (!fseek(v2, v4, 0))
  {
    fwrite(a1 + 1, 0x37uLL, 1uLL, v2);
    if (!ferror(v2))
    {
      fseek(v2, (*((_DWORD *)a1 + 3) + *((_DWORD *)a1 + 16)), 0);
      if (!*((_BYTE *)a1 + 72))
      {
        uint64_t v7 = 0LL;
        goto LABEL_7;
      }

      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
      int v5 = *a1;
      if (!*a1) {
        goto LABEL_7;
      }
LABEL_5:
      fclose(v5);
      uint64_t v7 = v6;
      goto LABEL_7;
    }
  }

  if (!*((_BYTE *)a1 + 72))
  {
    uint64_t v7 = 1LL;
    goto LABEL_7;
  }

  int v5 = *a1;
  uint64_t v6 = 1LL;
  uint64_t v7 = 1LL;
  if (*a1) {
    goto LABEL_5;
  }
LABEL_7:
  free(a1);
  return v7;
}

_BYTE *qmw_create_from_file_pointer(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  int v2 = calloc(1uLL, 0x48uLL);
  int v3 = v2;
  if (v2)
  {
    *(void *)int v2 = a1;
    v2[72] = 0;
    *((void *)v2 + 8) = MEMORY[0x1895A4CE4](a1);
    *((_DWORD *)v3 + 2) = 1179796332;
    *((_DWORD *)v3 + 8) = 1077936128;
    *((void *)v3 + 2) = 0xD2434D4F46LL;
    *((void *)v3 + 3) = 0xC040000038C000C0LL;
    if (fseek(*(FILE **)v3, 55LL, 1))
    {
      qmw_close((FILE **)v3);
      free(v3);
      return 0LL;
    }
  }

  return v3;
}

void *create_compact_model_writer_from_file_pointer(uint64_t a1)
{
  int v2 = calloc(1uLL, 0x30uLL);
  *int v2 = cmw_create_from_file_pointer(a1);
  v2[1] = cmw_write_label_features;
  v2[2] = cmw_write_attribute_feature_counts_and_offsets;
  v2[3] = cmw_open_attribute_features;
  v2[4] = cmw_write_attribute_feature;
  v2[5] = cmw_close;
  return v2;
}

uint64_t qmw_write_label_features(void *a1, unsigned int a2, __int16 a3, const void *a4)
{
  if (a2 >= 0x100) {
    qmw_write_label_features_cold_1();
  }
  *((_BYTE *)a1 + 42) = a2;
  *((_WORD *)a1 + 18) = a3;
  unsigned int v7 = MEMORY[0x1895A4CE4](*a1);
  if ((v7 & 3) != 0)
  {
    uint64_t v8 = v7 + 1LL;
    do
    {
      char __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }

    while ((v8++ & 3) != 0);
  }

  *(_DWORD *)((char *)a1 + 47) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 16);
  fwrite(a4, 8uLL, a2 * a2, (FILE *)*a1);
  fseek((FILE *)*a1, 0LL, 2);
  return 0LL;
}

uint64_t qmw_open_attribute_features(void *a1, int a2)
{
  *(_DWORD *)((char *)a1 + 38) = a2;
  unsigned int v3 = MEMORY[0x1895A4CE4](*a1);
  if ((v3 & 3) != 0)
  {
    uint64_t v4 = v3 + 1LL;
    do
    {
      char __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }

    while ((v4++ & 3) != 0);
  }

  *(_DWORD *)((char *)a1 + 51) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 16);
  return 0LL;
}

uint64_t qmw_write_attribute_feature_counts_and_offsets(void *a1, int a2, unsigned int *a3, const void *a4)
{
  LODWORD(v6) = a2;
  *(_DWORD *)((char *)a1 + 43) = a2;
  unsigned int v8 = MEMORY[0x1895A4CE4](*a1);
  if ((v8 & 3) != 0)
  {
    uint64_t v9 = v8 + 1LL;
    do
    {
      char __ptr = 0;
      fwrite(&__ptr, 1uLL, 1uLL, (FILE *)*a1);
    }

    while ((v9++ & 3) != 0);
  }

  *(_DWORD *)((char *)a1 + 55) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 16);
  if ((_DWORD)v6)
  {
    size_t v6 = v6;
    uint64_t v11 = v6;
    do
    {
      unsigned int v13 = *a3++;
      char v12 = v13;
      if (v13 >= 0x100) {
        qmw_write_attribute_feature_counts_and_offsets_cold_1();
      }
      char v15 = v12;
      fwrite(&v15, 1uLL, 1uLL, (FILE *)*a1);
      --v11;
    }

    while (v11);
  }

  else
  {
    size_t v6 = 0LL;
  }

  *(_DWORD *)((char *)a1 + 59) = MEMORY[0x1895A4CE4](*a1) - *((_DWORD *)a1 + 16);
  fwrite(a4, 4uLL, v6, (FILE *)*a1);
  fseek((FILE *)*a1, 0LL, 2);
  return 0LL;
}

uint64_t qmw_write_attribute_feature(uint64_t a1, unsigned int a2, double a3)
{
  if (a2 >= 0x100) {
    qmw_write_attribute_feature_cold_1();
  }
  double v3 = *(float *)(a1 + 28);
  if (v3 >= a3)
  {
    LOWORD(v4) = 0;
  }

  else if (*(float *)(a1 + 32) <= a3)
  {
    LOWORD(v4) = -1;
  }

  else
  {
    int v4 = (int)rint((a3 - v3) / *(float *)(a1 + 24));
  }

  __int16 __ptr = v4;
  char v7 = a2;
  if (fwrite(&__ptr, 1uLL, 3uLL, *(FILE **)a1) != 3) {
    qmw_write_attribute_feature_cold_2();
  }
  return 0LL;
}

void *create_quantized_model_writer_from_file_pointer(uint64_t a1)
{
  int v2 = calloc(1uLL, 0x30uLL);
  *int v2 = qmw_create_from_file_pointer(a1);
  v2[1] = qmw_write_label_features;
  v2[2] = qmw_write_attribute_feature_counts_and_offsets;
  v2[3] = qmw_open_attribute_features;
  v2[4] = qmw_write_attribute_feature;
  v2[5] = qmw_close;
  return v2;
}

uint64_t write_label_features(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))(*(void *)a1);
}

uint64_t write_attribute_feature_counts_and_offsets(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))(*(void *)a1);
}

uint64_t open_attribute_features(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))(*(void *)a1);
}

uint64_t write_attribute_feature(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)a1);
}

uint64_t close_writer(void (**a1)(void))
{
  return 0LL;
}

uint64_t crf1m_create_instance_from_file(const char *a1, void *a2)
{
  *a2 = 0LL;
  double v3 = crf1dm_new(a1);
  if (!v3) {
    return 2147483651LL;
  }
  int v4 = v3;
  uint64_t v5 = crf1m_model_initialize(v3, a2);
  if ((_DWORD)v5) {
    crf1dm_close(v4);
  }
  return v5;
}

uint64_t crf1m_create_instance_from_buffer(uint64_t a1, int a2, void *a3)
{
  *a3 = 0LL;
  int v4 = (int *)crf1dm_new_from_buffer(a1, a2);
  if (!v4) {
    return 2147483651LL;
  }
  uint64_t v5 = v4;
  uint64_t v6 = crf1m_model_initialize(v4, a3);
  if ((_DWORD)v6) {
    crf1dm_close(v5);
  }
  return v6;
}

uint64_t crf1m_model_initialize(int *a1, void *a2)
{
  char v4 = 1;
  uint64_t v6 = calloc(1uLL, 0x20uLL);
  if (!v6)
  {
    uint64_t v9 = 0LL;
LABEL_12:
    char v15 = 0LL;
    uint64_t v11 = 0LL;
LABEL_13:
    unsigned int v13 = 0LL;
    goto LABEL_14;
  }

  *((_DWORD *)v6 + 4) = crf1dm_get_num_labels(a1, v5);
  *((_DWORD *)v6 + 5) = crf1dm_get_num_attrs(a1, v7);
  *uint64_t v6 = a1;
  uint64_t v8 = crf1dc_new(3, *((_DWORD *)v6 + 4), 0);
  v6[1] = v8;
  if (!v8)
  {
    crf1dt_delete(v6);
    uint64_t v6 = 0LL;
    uint64_t v9 = 0LL;
    char v15 = 0LL;
    uint64_t v11 = 0LL;
    unsigned int v13 = 0LL;
    char v4 = 1;
    goto LABEL_14;
  }

  crf1dc_reset(v8, 2);
  crf1dm_initialize_transition_scores((uint64_t)a1, v6[1]);
  crf1dc_exp_transition(v6[1]);
  *((_DWORD *)v6 + 6) = 0;
  uint64_t v9 = calloc(1uLL, 0x30uLL);
  if (!v9)
  {
    char v4 = 0;
    goto LABEL_12;
  }

  uint64_t v10 = calloc(1uLL, 0x48uLL);
  uint64_t v11 = v10;
  if (!v10)
  {
    char v4 = 0;
    char v15 = 0LL;
    goto LABEL_13;
  }

  *((_DWORD *)v10 + 2) = 1;
  v10[2] = model_attrs_addref;
  v10[3] = model_attrs_release;
  v10[4] = model_attrs_get;
  v10[5] = model_attrs_to_id;
  *uint64_t v10 = a1;
  v10[6] = model_attrs_to_string;
  v10[7] = model_attrs_num;
  v10[8] = model_attrs_free;
  char v12 = calloc(1uLL, 0x48uLL);
  unsigned int v13 = v12;
  if (v12)
  {
    *char v12 = a1;
    v12[2] = model_labels_addref;
    v12[3] = model_labels_release;
    v12[4] = model_labels_get;
    v12[5] = model_labels_to_id;
    *((_DWORD *)v12 + 2) = 1;
    v12[6] = model_labels_to_string;
    v12[7] = model_labels_num;
    v12[8] = model_labels_free;
    uint64_t v14 = calloc(1uLL, 0x60uLL);
    char v15 = v14;
    if (v14)
    {
      *uint64_t v14 = v6;
      *((_DWORD *)v14 + 2) = 1;
      v14[2] = tagger_addref;
      v14[3] = tagger_release;
      v14[4] = tagger_set;
      v14[5] = tagger_length;
      v14[6] = tagger_viterbi;
      v14[7] = tagger_score;
      v14[8] = tagger_lognorm;
      v14[9] = tagger_marginal_point;
      v14[10] = tagger_marginal_path;
      v14[11] = tagger_tag_paragraph;
      *uint64_t v9 = a1;
      v9[1] = v11;
      v9[4] = v13;
      v9[5] = v14;
      uint64_t v16 = calloc(1uLL, 0x58uLL);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t result = 0LL;
        *(void *)uint64_t v17 = v9;
        v17[2] = 1;
        *((void *)v17 + 2) = model_addref;
        *((void *)v17 + 3) = model_release;
        *((void *)v17 + 4) = model_get_tagger;
        *((void *)v17 + 5) = model_get_labels;
        *((void *)v17 + 6) = model_get_attrs;
        *((void *)v17 + 7) = model_dump;
        *((void *)v17 + 8) = 0LL;
        *((void *)v17 + 9) = model_get_number_of_labels;
        *((void *)v17 + 10) = model_get_number_of_attributes;
        *a2 = v17;
        return result;
      }
    }

    char v4 = 0;
  }

  else
  {
    char v4 = 0;
    char v15 = 0LL;
  }

LABEL_14:
  free(v15);
  free(v13);
  free(v11);
  free(v9);
  if ((v4 & 1) == 0) {
    crf1dt_delete(v6);
  }
  return 2147483649LL;
}

uint64_t model_attrs_addref(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t model_attrs_release(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t model_attrs_get()
{
  return 2147483650LL;
}

uint64_t model_attrs_to_id(uint64_t *a1, char *a2)
{
  return crf1dm_to_aid(*a1, a2);
}

uint64_t model_attrs_to_string(uint64_t *a1, unsigned int a2, uint64_t *a3)
{
  *a3 = crf1dm_to_attr(*a1, a2);
  return 0LL;
}

uint64_t model_attrs_num@<X0>(int **a1@<X0>, uint64_t a2@<X8>)
{
  return crf1dm_get_num_attrs(*a1, a2);
}

uint64_t model_labels_addref(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t model_labels_release(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t model_labels_get()
{
  return 2147483650LL;
}

uint64_t model_labels_to_id(uint64_t *a1, char *a2)
{
  return crf1dm_to_lid(*a1, a2);
}

uint64_t model_labels_to_string(uint64_t *a1, unsigned int a2, uint64_t *a3)
{
  *a3 = crf1dm_to_label(*a1, a2);
  return 0LL;
}

uint64_t model_labels_num@<X0>(int **a1@<X0>, uint64_t a2@<X8>)
{
  return crf1dm_get_num_labels(*a1, a2);
}

uint64_t tagger_addref(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t tagger_release(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t tagger_set(uint64_t *a1, int *a2)
{
  uint64_t v3 = *a1;
  crf1dc_set_num_items(*(void *)(*a1 + 8), *a2);
  crf1dc_reset(*(void *)(v3 + 8), 1);
  crf1dm_initialize_state_scores(*(void *)v3, *(void *)(v3 + 8), (unsigned int *)a2, v4, v5, v6);
  *(_DWORD *)(v3 + 24) = 1;
  return 0LL;
}

uint64_t tagger_length(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(*(void *)a1 + 8LL) + 8LL);
}

uint64_t tagger_viterbi(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = v4;
  }
  return 0LL;
}

uint64_t tagger_score(uint64_t a1, int *a2, double *a3)
{
  double v4 = crf1dc_score(*(void *)(*(void *)a1 + 8LL), a2);
  if (a3) {
    *a3 = v4;
  }
  return 0LL;
}

uint64_t tagger_lognorm(unsigned int **a1, double *a2)
{
  uint64_t v3 = *a1;
  crf1dt_set_level(*a1);
  *a2 = crf1dc_lognorm(*((void *)v3 + 1));
  return 0LL;
}

uint64_t tagger_marginal_point(unsigned int **a1, int a2, int a3, double *a4)
{
  uint64_t v7 = *a1;
  crf1dt_set_level(*a1);
  *a4 = crf1dc_marginal_point(*((void *)v7 + 1), a2, a3);
  return 0LL;
}

uint64_t tagger_marginal_path(unsigned int **a1, uint64_t a2, int a3, int a4, double *a5)
{
  uint64_t v9 = *a1;
  crf1dt_set_level(*a1);
  *a5 = crf1dc_marginal_path(*((void *)v9 + 1), a2, a3, a4);
  return 0LL;
}

uint64_t tagger_tag_paragraph(uint64_t *a1, int *a2, unsigned int a3, void *a4)
{
  uint64_t v7 = *a1;
  uint64_t v8 = *(void *)(*a1 + 8);
  int item_count_for_sentence = crf_paragraph_get_item_count_for_sentence((uint64_t)a2, a3);
  uint64_t v24 = a4;
  crf_output_init_n(a4, item_count_for_sentence);
  crf1dc_set_num_items(v8, item_count_for_sentence);
  crf1dc_reset(*(void *)(v7 + 8), 1);
  uint64_t v11 = *(void *)v7;
  uint64_t v10 = *(void *)(v7 + 8);
  uint64_t v25 = v7;
  int v26 = crf_paragraph_get_item_count_for_sentence((uint64_t)a2, a3);
  if (v26 >= 1)
  {
    int v12 = 0;
    int v13 = *a2;
    uint64_t v14 = *(unsigned int *)(v7 + 16);
    do
    {
      uint64_t v15 = *(void *)(v10 + 24);
      uint64_t v16 = v15 + 8LL * *(_DWORD *)(v10 + 4) * v12;
      if (v13 >= 1)
      {
        for (int i = 0; i != v13; ++i)
        {
          int id = crf_paragraph_get_id((uint64_t)a2, a3, v12, i);
          if (id >= 1)
          {
            crf1dm_get_attrref(v11, id - 1, (uint64_t)v27);
            if (v27[0] >= 1)
            {
              int v19 = 0;
              do
              {
                featureint id = crf1dm_get_featureid((uint64_t)v27, v19);
                crf1dm_get_feature(v11, featureid, (uint64_t)v28);
                *(double *)(v16 + 8LL * v29) = v30 + *(double *)(v16 + 8LL * v29);
                ++v19;
              }

              while (v19 < v27[0]);
            }
          }
        }
      }

      ++v12;
    }

    while (v12 != v26);
  }

  *(_DWORD *)(v25 + 24) = 1;
  crf1dc_viterbi(*(void *)(*a1 + 8), v24[1]);
  v24[2] = v21;
  return 0LL;
}

uint64_t model_addref(uint64_t a1)
{
  return crfsuite_interlocked_increment((_DWORD *)(a1 + 8));
}

uint64_t model_release(_DWORD *a1)
{
  uint64_t v2 = crfsuite_interlocked_decrement(a1 + 2);
  if (!(_DWORD)v2)
  {
    uint64_t v3 = *(void ***)a1;
    crf1dt_delete(**(void ***)(*(void *)a1 + 40LL));
    free(v3[5]);
    free(v3[4]);
    free(v3[1]);
    crf1dm_close(*v3);
    free(v3);
    free(a1);
  }

  return v2;
}

uint64_t model_get_attrs(uint64_t a1, void *a2)
{
  *a2 = *(void *)(*(void *)a1 + 8LL);
  return 0LL;
}

uint64_t model_get_labels(uint64_t a1, void *a2)
{
  *a2 = *(void *)(*(void *)a1 + 32LL);
  return 0LL;
}

uint64_t model_get_tagger(uint64_t a1, void *a2)
{
  *a2 = *(void *)(*(void *)a1 + 40LL);
  return 0LL;
}

uint64_t model_dump(uint64_t **a1, FILE *a2)
{
  return 0LL;
}

uint64_t model_get_number_of_labels(int ***a1)
{
  return crf1dm_get_num_labels(**a1, (uint64_t)*a1);
}

uint64_t model_get_number_of_attributes(int ***a1)
{
  return crf1dm_get_num_attrs(**a1, (uint64_t)*a1);
}

void crf1dt_delete(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  if (v2) {
    crf1dc_delete(v2);
  }
  free(a1);
}

unsigned int *crf1dt_set_level(unsigned int *result)
{
  uint64_t v1 = result;
  if ((int)result[6] <= 1)
  {
    uint64_t v2 = (unsigned int *)*((void *)result + 1);
    crf1dc_exp_state((uint64_t)v2);
    crf1dc_alpha_score((uint64_t)v2);
    uint64_t result = crf1dc_beta_score(v2);
  }

  v1[6] = 2;
  return result;
}

uint64_t crf1de_create_instance(const char *a1, void *a2)
{
  if (strncmp(a1, "train/", 6uLL) || strncmp(a1 + 6, "crf1d/", 6uLL)) {
    return 1LL;
  }
  double v6 = a1 + 12;
  if (!strcmp(v6, "lbfgs"))
  {
    int v7 = 1;
  }

  else if (!strcmp(v6, "l2sgd"))
  {
    int v7 = 2;
  }

  else if (!strcmp(v6, "averaged-perceptron"))
  {
    int v7 = 3;
  }

  else if (!strcmp(v6, "passive-aggressive"))
  {
    int v7 = 4;
  }

  else
  {
    if (strcmp(v6, "arow")) {
      return 1LL;
    }
    int v7 = 5;
  }

  uint64_t v4 = 1LL;
  uint64_t v8 = calloc(1uLL, 0x40uLL);
  if (!v8) {
    return v4;
  }
  uint64_t v9 = v8;
  uint64_t v10 = crfsuite_train_new(v7);
  *(void *)uint64_t v9 = v10;
  if (v10)
  {
    uint64_t v4 = 0LL;
    v9[2] = 1;
    *((void *)v9 + 2) = crfsuite_train_addref;
    *((void *)v9 + 3) = crfsuite_train_release;
    *((void *)v9 + 4) = crfsuite_train_params;
    *((void *)v9 + 5) = crfsuite_train_set_message_callback;
    *((void *)v9 + 6) = crfsuite_train_to_file;
    *((void *)v9 + 7) = crfsuite_train_to_file_pointer;
    *a2 = v9;
    return v4;
  }

  free(v9);
  return 1LL;
}

void *crfsuite_train_new(int a1)
{
  uint64_t v2 = calloc(1uLL, 0x20uLL);
  if (v2)
  {
    v2[2] = calloc(1uLL, 0x18uLL);
    v2[1] = params_create_instance();
    *((_DWORD *)v2 + 6) = 1;
    *((_DWORD *)v2 + 7) = a1;
    encoder = crf1d_create_encoder();
    *uint64_t v2 = encoder;
    ((void (*)(void *, void, void))encoder[7])(encoder, v2[1], 0LL);
    switch(a1)
    {
      case 1:
        crfsuite_train_lbfgs_init(v2[1]);
        break;
      case 2:
        crfsuite_train_l2sgd_init(v2[1]);
        break;
      case 3:
        crfsuite_train_averaged_perceptron_init((int **)v2[1]);
        break;
      case 4:
        crfsuite_train_passive_aggressive_init(v2[1]);
        break;
      case 5:
        crfsuite_train_arow_init(v2[1]);
        break;
      default:
        return v2;
    }
  }

  return v2;
}

uint64_t crfsuite_train_addref(uint64_t a1)
{
  return crfsuite_interlocked_increment((_DWORD *)(a1 + 8));
}

uint64_t crfsuite_train_release(_DWORD *a1)
{
  uint64_t v2 = crfsuite_interlocked_decrement(a1 + 2);
  if (!(_DWORD)v2)
  {
    uint64_t v3 = *(void **)a1;
    if (*(void *)a1)
    {
      if (*(void *)v3) {
        (*(void (**)(void))(*(void *)v3 + 152LL))();
      }
      uint64_t v4 = *((void *)v3 + 1);
      if (v4) {
        (*(void (**)(void))(v4 + 24))();
      }
      free(*((void **)v3 + 2));
      free(v3);
    }

    free(a1);
  }

  return v2;
}

uint64_t crfsuite_train_params(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 8LL);
}

uint64_t crfsuite_train_set_message_callback(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(*(void *)result + 16LL);
  *uint64_t v3 = a2;
  v3[1] = a3;
  return result;
}

uint64_t crfsuite_train_to_file(uint64_t **a1, uint64_t a2, uint64_t a3, int a4)
{
  if (!a3) {
    return 2147483651LL;
  }
  int v7 = (*(uint64_t (**)(void))(*(void *)(a2 + 24) + 56LL))();
  int v8 = (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 56LL))();
  crfsuite_train_train(a1, (unsigned int *)a2, v7, v8, a4, (double **)&v11);
  if (!v11) {
    return 0LL;
  }
  uint64_t v9 = (*(uint64_t (**)(void))(**a1 + 136))();
  free(v11);
  return v9;
}

uint64_t crfsuite_train_to_file_pointer( uint64_t **a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, char a7)
{
  if (!a5) {
    return 2147483651LL;
  }
  uint64_t v13 = (*a1)[1];
  double v19 = 1.0;
  int v14 = (*(uint64_t (**)(void))(v13 + 96))();
  if ((a7 & 1) != 0 && !v14 && v19 > 1.0)
  {
    fwrite( "ERROR: crfsuite_training_do_not_store_attributes flag is not compatible with minimal frequency value that is g reater than 1!\n",  0x7FuLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
    return 2147483651LL;
  }

  if (a3 <= 0) {
    a3 = (*(uint64_t (**)(void))(*(void *)(a2 + 24) + 56LL))();
  }
  if (a4 <= 0) {
    a4 = (*(uint64_t (**)(void))(*(void *)(a2 + 24) + 56LL))(*(void *)(a2 + 16));
  }
  crfsuite_train_train(a1, (unsigned int *)a2, a3, a4, a6, (double **)&v18);
  if (!v18) {
    return 0LL;
  }
  uint64_t v16 = (*(uint64_t (**)(void))(**a1 + 144))();
  free(v18);
  return v16;
}

_DWORD *crf1de_create_trainer(int a1, unsigned int a2)
{
  uint64_t v2 = 0LL;
  if (!a1 && a2 <= 4)
  {
    uint64_t v2 = calloc(1uLL, 0x40uLL);
    if (v2)
    {
      uint64_t v4 = crfsuite_train_new(a2 + 1);
      *(void *)uint64_t v2 = v4;
      if (v4)
      {
        v2[2] = 1;
        *((void *)v2 + 2) = crfsuite_train_addref;
        *((void *)v2 + 3) = crfsuite_train_release;
        *((void *)v2 + 4) = crfsuite_train_params;
        *((void *)v2 + 5) = crfsuite_train_set_message_callback;
        *((void *)v2 + 6) = crfsuite_train_to_file;
        *((void *)v2 + 7) = crfsuite_train_to_file_pointer;
      }

      else
      {
        free(v2);
        return 0LL;
      }
    }
  }

  return v2;
}

void crfsuite_train_train(uint64_t **a1, unsigned int *a2, int a3, int a4, int a5, double **a6)
{
  uint64_t v11 = *a1;
  int v12 = (uint64_t *)(*a1)[2];
  uint64_t v13 = **a1;
  *a6 = 0LL;
  dataset_init_trainset((uint64_t)v33, a2, a3, a4, a5);
  if ((a5 & 0x80000000) == 0)
  {
    dataset_init_testset((uint64_t)v32, a2, a3, a4, a5);
    logging(v12, (uint64_t)"Holdout group: %d\n", v14, v15, v16, v17, v18, v19, (a5 + 1));
    logging(v12, (uint64_t)"\n", v20, v21, v22, v23, v24, v25, v31);
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 56))(v13, v11[1], 0xFFFFFFFFLL);
  (*(void (**)(uint64_t, _BYTE *, uint64_t *))(v13 + 64))(v13, v33, v12);
  switch(*((_DWORD *)v11 + 7))
  {
    case 1:
      if (a5 == -1) {
        int v26 = 0LL;
      }
      else {
        int v26 = v32;
      }
      crfsuite_train_lbfgs(v13, (uint64_t)v33, (uint64_t)v26, v11[1], v12, a6);
      if ((a5 & 0x80000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_25;
    case 2:
      if (a5 == -1) {
        uint64_t v27 = 0LL;
      }
      else {
        uint64_t v27 = v32;
      }
      crfsuite_train_l2sgd(v13, (uint64_t)v33, v27, v11[1], v12, a6);
      if ((a5 & 0x80000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_25;
    case 3:
      if (a5 == -1) {
        uint64_t v28 = 0LL;
      }
      else {
        uint64_t v28 = v32;
      }
      crfsuite_train_averaged_perceptron(v13, (uint64_t)v33, v28, v11[1], v12, a6);
      if ((a5 & 0x80000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_25;
    case 4:
      if (a5 == -1) {
        int v29 = 0LL;
      }
      else {
        int v29 = v32;
      }
      crfsuite_train_passive_aggressive(v13, (uint64_t)v33, v29, v11[1], v12, (char **)a6);
      goto LABEL_23;
    case 5:
      if (a5 == -1) {
        double v30 = 0LL;
      }
      else {
        double v30 = v32;
      }
      crfsuite_train_arow(v13, (uint64_t)v33, v30, v11[1], v12, a6);
      if (a5 < 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    default:
LABEL_23:
      if ((a5 & 0x80000000) == 0) {
LABEL_24:
      }
        dataset_finish((uint64_t)v32);
LABEL_25:
      dataset_finish((uint64_t)v33);
      return;
  }

BOOL crfsuite_create_instance(const char *a1, void *a2)
{
  return !crf1de_create_instance(a1, a2) || crfsuite_dictionary_create_instance(a1, a2) == 0;
}

void *crfsuite_attribute_init(void *result)
{
  *uint64_t result = 0LL;
  result[1] = 0x3FF0000000000000LL;
  return result;
}

uint64_t crfsuite_attribute_set(uint64_t result, int a2, double a3)
{
  *(void *)uint64_t result = 0LL;
  *(_DWORD *)uint64_t result = a2;
  *(double *)(result + 8) = a3;
  return result;
}

double crfsuite_attribute_copy(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  double result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

double crfsuite_attribute_swap(double *a1, double *a2)
{
  int v2 = *(_DWORD *)a1;
  double result = a1[1];
  *(_DWORD *)a1 = *(_DWORD *)a2;
  a1[1] = a2[1];
  *(_DWORD *)a2 = v2;
  a2[1] = result;
  return result;
}

void *crfsuite_item_init(void *result)
{
  *double result = 0LL;
  result[1] = 0LL;
  return result;
}

void *crfsuite_item_init_n(uint64_t a1, int a2)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a2;
  double result = calloc(a2, 0x10uLL);
  *(void *)(a1 + 8) = result;
  return result;
}

void *crfsuite_item_init_with_capacity(uint64_t a1, int a2)
{
  *(_DWORD *)a1 = 0;
  *(_DWORD *)(a1 + 4) = a2;
  double result = calloc(a2, 0x10uLL);
  *(void *)(a1 + 8) = result;
  return result;
}

void crfsuite_item_finish(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

double crfsuite_item_copy(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  double v5 = (char *)calloc((int)v4, 0x10uLL);
  a1[1] = (uint64_t)v5;
  uint64_t v7 = *(unsigned int *)a1;
  if ((int)v7 >= 1)
  {
    int v8 = (void *)(a2[1] + 8);
    uint64_t v9 = v5 + 8;
    do
    {
      *((_DWORD *)v9 - 2) = *((_DWORD *)v8 - 2);
      double v10 = *(double *)v8;
      v8 += 2;
      double result = v10;
      *(double *)uint64_t v9 = v10;
      v9 += 2;
      --v7;
    }

    while (v7);
  }

  return result;
}

double crfsuite_item_swap(double *a1, double *a2)
{
  uint64_t v2 = *((void *)a1 + 1);
  double result = *a2;
  a1[1] = a2[1];
  double v4 = *a1;
  *a1 = result;
  *a2 = v4;
  *((void *)a2 + 1) = v2;
  return result;
}

uint64_t crfsuite_item_append_attribute(int *a1, uint64_t a2)
{
  int v4 = *a1;
  int v5 = a1[1];
  if (v5 <= *a1)
  {
    int v7 = 2 * v5 + 2;
    a1[1] = v7;
    double v6 = (char *)realloc(*((void **)a1 + 1), 16LL * v7);
    *((void *)a1 + 1) = v6;
    int v4 = *a1;
  }

  else
  {
    double v6 = (char *)*((void *)a1 + 1);
  }

  *a1 = v4 + 1;
  int v8 = &v6[16 * v4];
  *(_DWORD *)int v8 = *(_DWORD *)a2;
  *((void *)v8 + 1) = *(void *)(a2 + 8);
  return 0LL;
}

BOOL crfsuite_item_empty(_DWORD *a1)
{
  return *a1 == 0;
}

double crfsuite_instance_init(_OWORD *a1)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void *crfsuite_instance_init_n(uint64_t a1, int a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a2;
  size_t v3 = a2;
  *(void *)(a1 + 8) = calloc(a2, 0x10uLL);
  double result = calloc(v3, 4uLL);
  *(void *)(a1 + 16) = result;
  return result;
}

double crfsuite_instance_finish(int *a1)
{
  if (*a1 >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
    do
    {
      uint64_t v4 = *((void *)a1 + 1) + v2;
      free(*(void **)(v4 + 8));
      *(void *)uint64_t v4 = 0LL;
      *(void *)(v4 + 8) = 0LL;
      ++v3;
      v2 += 16LL;
    }

    while (v3 < *a1);
  }

  free(*((void **)a1 + 2));
  free(*((void **)a1 + 1));
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

void crfsuite_instance_copy(int *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = calloc((int)v4, 0x10uLL);
  *((void *)a1 + 2) = calloc(*a1, 4uLL);
  a1[6] = *((_DWORD *)a2 + 6);
  if (*a1 >= 1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    do
    {
      crfsuite_item_copy((uint64_t *)(*((void *)a1 + 1) + v5), (uint64_t *)(a2[1] + v5));
      *(_DWORD *)(*((void *)a1 + 2) + 4 * v6) = *(_DWORD *)(a2[2] + 4 * v6);
      ++v6;
      v5 += 16LL;
    }

    while (v6 < *a1);
  }

__n128 crfsuite_instance_swap(uint64_t *a1, uint64_t *a2)
{
  int v2 = *((_DWORD *)a1 + 6);
  __int128 v3 = *(_OWORD *)(a2 + 1);
  uint64_t v4 = *a1;
  *a1 = *a2;
  *((_DWORD *)a1 + 6) = *((_DWORD *)a2 + 6);
  *a2 = v4;
  __n128 result = *(__n128 *)(a1 + 1);
  *(_OWORD *)(a1 + 1) = v3;
  *(__n128 *)(a2 + 1) = result;
  *((_DWORD *)a2 + 6) = v2;
  return result;
}

uint64_t crfsuite_instance_append(int *a1, uint64_t *a2, int a3)
{
  int v6 = *a1;
  int v7 = a1[1];
  if (v7 <= *a1)
  {
    int v8 = 2 * v7 + 2;
    a1[1] = v8;
    *((void *)a1 + 1) = realloc(*((void **)a1 + 1), 16LL * v8);
    *((void *)a1 + 2) = realloc(*((void **)a1 + 2), 4LL * a1[1]);
    int v6 = *a1;
  }

  crfsuite_item_copy((uint64_t *)(*((void *)a1 + 1) + 16LL * v6), a2);
  *(_DWORD *)(*((void *)a1 + 2) + 4LL * (*a1)++) = a3;
  return 0LL;
}

BOOL crfsuite_instance_empty(_DWORD *a1)
{
  return *a1 == 0;
}

double crfsuite_data_init(_OWORD *a1)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void *crfsuite_data_init_n(uint64_t a1, int a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a2;
  double result = calloc(a2, 0x20uLL);
  *(void *)(a1 + 8) = result;
  return result;
}

double crfsuite_data_finish(int *a1)
{
  if (*a1 >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
    do
    {
      crfsuite_instance_finish((int *)(*((void *)a1 + 1) + v2));
      ++v3;
      v2 += 32LL;
    }

    while (v3 < *a1);
  }

  free(*((void **)a1 + 1));
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

void crfsuite_data_copy(int *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = calloc((int)v4, 0x20uLL);
  if (*a1 >= 1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    do
    {
      crfsuite_instance_copy((int *)(*((void *)a1 + 1) + v5), (uint64_t *)(a2[1] + v5));
      ++v6;
      v5 += 32LL;
    }

    while (v6 < *a1);
  }

double crfsuite_data_swap(double *a1, double *a2)
{
  uint64_t v2 = *((void *)a1 + 1);
  double result = *a2;
  a1[1] = a2[1];
  double v4 = *a1;
  *a1 = result;
  *a2 = v4;
  *((void *)a2 + 1) = v2;
  return result;
}

uint64_t crfsuite_data_append(int *a1, uint64_t *a2)
{
  if (*(int *)a2 >= 1)
  {
    int v4 = *a1;
    int v5 = a1[1];
    if (v5 <= *a1)
    {
      int v7 = 2 * v5 + 2;
      a1[1] = v7;
      uint64_t v6 = (int *)realloc(*((void **)a1 + 1), 32LL * v7);
      *((void *)a1 + 1) = v6;
      int v4 = *a1;
    }

    else
    {
      uint64_t v6 = (int *)*((void *)a1 + 1);
    }

    *a1 = v4 + 1;
    crfsuite_instance_copy(&v6[8 * v4], a2);
  }

  return 0LL;
}

unint64_t crfsuite_data_maxlength(unint64_t result)
{
  uint64_t v1 = *(unsigned int *)result;
  unint64_t v2 = result;
  LODWORD(result) = 0;
  uint64_t v3 = *(int **)(v2 + 8);
  do
  {
    int v5 = *v3;
    v3 += 8;
    unsigned int v4 = v5;
    else {
      double result = result;
    }
    --v1;
  }

  while (v1);
  return result;
}

unint64_t crfsuite_data_totalitems(unint64_t result)
{
  uint64_t v1 = *(unsigned int *)result;
  unint64_t v2 = result;
  LODWORD(result) = 0;
  uint64_t v3 = *(int **)(v2 + 8);
  do
  {
    int v4 = *v3;
    v3 += 8;
    double result = (v4 + result);
    --v1;
  }

  while (v1);
  return result;
}

void *crfsuite_evaluation_init(uint64_t a1, int a2)
{
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  double result = calloc(a2 + 1, 0x28uLL);
  *(void *)(a1 + 8) = result;
  if (result) {
    *(_DWORD *)a1 = a2;
  }
  return result;
}

double crfsuite_evaluation_clear(int *a1)
{
  if ((*a1 & 0x80000000) == 0)
  {
    uint64_t v1 = 0LL;
    uint64_t v2 = -1LL;
    do
    {
      uint64_t v3 = *((void *)a1 + 1) + v1;
      *(void *)(v3 + 32) = 0LL;
      *(_OWORD *)uint64_t v3 = 0uLL;
      *(_OWORD *)(v3 + 16) = 0uLL;
      ++v2;
      v1 += 40LL;
    }

    while (v2 < *a1);
  }

  double result = 0.0;
  *((_OWORD *)a1 + 3) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  return result;
}

double crfsuite_evaluation_finish(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t crfsuite_evaluation_accmulate(int *a1, int *a2, int *a3, int a4)
{
  if (a4 < 1)
  {
    int v4 = 0;
LABEL_12:
    if (v4 == a4) {
      ++a1[10];
    }
    uint64_t v14 = 0LL;
    ++a1[11];
  }

  else
  {
    int v4 = 0;
    int v5 = *a1;
    uint64_t v6 = a4;
    while (1)
    {
      int v8 = *a2++;
      int v7 = v8;
      int v10 = *a3++;
      int v9 = v10;
      if (v5 <= v7 || v5 <= v9) {
        return 1LL;
      }
      int v12 = v9;
      uint64_t v13 = *((void *)a1 + 1);
      ++*(_DWORD *)(v13 + 40LL * v7 + 4);
      ++*(_DWORD *)(v13 + 40LL * v12 + 8);
      if (v7 == v12)
      {
        ++*(_DWORD *)(v13 + 40LL * v7);
        ++v4;
      }

      ++a1[5];
      if (!--v6) {
        goto LABEL_12;
      }
    }
  }

  return v14;
}

double crfsuite_evaluation_finalize(unsigned int *a1)
{
  int v1 = *a1;
  if ((*a1 & 0x80000000) == 0)
  {
    uint64_t v2 = (v1 + 1);
    uint64_t v3 = (void *)(*((void *)a1 + 1) + 16LL);
    uint64_t v4 = *a1;
    do
    {
      int v5 = *((_DWORD *)v3 - 3);
      if (v5)
      {
        int v6 = *((_DWORD *)v3 - 4);
        a1[4] += v6;
        int v7 = *((_DWORD *)v3 - 2);
        unsigned int v8 = a1[7] + v7;
        a1[6] += v5;
        a1[7] = v8;
        v3[1] = 0LL;
        v3[2] = 0LL;
        *uint64_t v3 = 0LL;
        double v9 = 0.0;
        double v10 = (double)v6;
        double v11 = 0.0;
        if (v7 >= 1)
        {
          double v11 = v10 / (double)v7;
          *(double *)uint64_t v3 = v11;
        }

        if (v5 >= 1)
        {
          double v9 = v10 / (double)v5;
          *((double *)v3 + 1) = v9;
        }

        double v12 = 0.0;
        if (v11 + v9 > 0.0)
        {
          double v12 = (v11 * v9 + v11 * v9) / (v11 + v9);
          *((double *)v3 + 2) = v12;
        }

        if (v4)
        {
          double v13 = *((double *)a1 + 8);
          *((double *)a1 + 7) = v11 + *((double *)a1 + 7);
          *((double *)a1 + 8) = v9 + v13;
          *((double *)a1 + 9) = v12 + *((double *)a1 + 9);
        }
      }

      --v4;
      v3 += 5;
      --v2;
    }

    while (v2);
  }

  *(float64x2_t *)(a1 + 14) = vdivq_f64( *(float64x2_t *)(a1 + 14),  (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v1), 0));
  double result = *((double *)a1 + 9) / (double)v1;
  *((double *)a1 + 9) = result;
  *((void *)a1 + 4) = 0LL;
  int v15 = a1[5];
  if (v15 >= 1)
  {
    double result = (double)(int)a1[4] / (double)v15;
    *((double *)a1 + 4) = result;
  }

  *((void *)a1 + 6) = 0LL;
  int v16 = a1[11];
  if (v16 >= 1)
  {
    double result = (double)(int)a1[10] / (double)v16;
    *((double *)a1 + 6) = result;
  }

  return result;
}

void *crfsuite_evaluation_output( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v41 = 0LL;
  v40[0] = a4;
  v40[1] = a3;
  logging( v40,  (uint64_t)"Performance by label (#match, #model, #ref) (precision, recall, F1):\n",  a3,  a4,  a5,  a6,  a7,  a8,  v39);
  if (*a1 >= 1)
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    do
    {
      uint64_t v18 = *((void *)a1 + 1);
      (*(void (**)(uint64_t, uint64_t, const char **))(a2 + 48))(a2, v17, &v41);
      uint64_t v25 = v41;
      if (!v41)
      {
        uint64_t v41 = "[UNKNOWN]";
        uint64_t v25 = "[UNKNOWN]";
      }

      if (*(_DWORD *)(v18 + v16 + 4)) {
        logging( v40,  (uint64_t)"    %s: (%d, %d, %d) (%1.4f, %1.4f, %1.4f)\n",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v25);
      }
      else {
        logging( v40,  (uint64_t)"    %s: (%d, %d, %d) (******, ******, ******)\n",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v25);
      }
      (*(void (**)(uint64_t, const char *))(a2 + 64))(a2, v41);
      ++v17;
      v16 += 40LL;
    }

    while (v17 < *a1);
  }

  logging( v40,  (uint64_t)"Macro-average precision, recall, F1: (%f, %f, %f)\n",  v10,  v11,  v12,  v13,  v14,  v15,  *((void *)a1 + 7));
  logging(v40, (uint64_t)"Item accuracy: %d / %d (%1.4f)\n", v26, v27, v28, v29, v30, v31, a1[4]);
  return logging( v40,  (uint64_t)"Instance accuracy: %d / %d (%1.4f)\n",  v32,  v33,  v34,  v35,  v36,  v37,  a1[10]);
}

uint64_t crfsuite_interlocked_increment(_DWORD *a1)
{
  uint64_t v1 = (*a1 + 1);
  *a1 = v1;
  return v1;
}

uint64_t crfsuite_interlocked_decrement(_DWORD *a1)
{
  uint64_t v1 = (*a1 - 1);
  *a1 = v1;
  return v1;
}

uint64_t crfsuite_model_create_from_file(const char *a1)
{
  else {
    return v2;
  }
}

uint64_t crfsuite_model_create_from_buffer(uint64_t a1, int a2)
{
  else {
    return v3;
  }
}

uint64_t crfsuite_model_addref(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t crfsuite_model_release(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t crfsuite_model_get_tagger(uint64_t a1)
{
  else {
    return v2;
  }
}

uint64_t crfsuite_model_get_labels(uint64_t a1)
{
  else {
    return v2;
  }
}

uint64_t crfsuite_model_get_attrs(uint64_t a1)
{
  else {
    return v2;
  }
}

uint64_t crfsuite_model_get_number_of_labels(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t crfsuite_model_get_number_of_attributes(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t crfsuite_model_dump(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t crfsuite_trainer_addref(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t crfsuite_trainer_release(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t crfsuite_trainer_get_params(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t crfsuite_trainer_set_message_callback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t crfsuite_trainer_train(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 48))();
}

uint64_t crfsuite_trainer_train_model_to_file_pointer(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t crfsuite_tagger_addref(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t crfsuite_tagger_release(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t crfsuite_tagger_set_instance(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t crfsuite_tagger_instance_length(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t crfsuite_tagger_viterbi(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 48))();
}

uint64_t crfsuite_tagger_score(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t crfsuite_tagger_lognorm(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 64))();
}

uint64_t crfsuite_tagger_marginal_point(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t crfsuite_tagger_marginal_path(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t crfsuite_tagger_tag_paragraph(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 88))();
}

uint64_t crfsuite_dictionary_create()
{
  else {
    return v1;
  }
}

uint64_t crfsuite_dictioanry_addref(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t crfsuite_dictionary_release(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t crfsuite_dictionary_get_id_for_string(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40LL;
  if (a3) {
    uint64_t v3 = 32LL;
  }
  return (*(uint64_t (**)(void))(a1 + v3))();
}

uint64_t crfsuite_dictionary_get_string_for_id(uint64_t a1, uint64_t a2)
{
  else {
    return v3;
  }
}

uint64_t crfsuite_dictionary_get_count(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t crfsuite_get_id_from_dictionary(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

FILE **crfsuite_create_tokenizer_from_feature_file(const char *a1)
{
  uint64_t v1 = fopen(a1, "r");
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (uint64_t)v1;
  uint64_t v3 = (FILE **)calloc(1uLL, 0x10uLL);
  *uint64_t v3 = (FILE *)v2;
  uint64_t v4 = iwa_reader(v2);
  v3[1] = (FILE *)v4;
  if (!v4)
  {
    fclose(*v3);
    free(v3);
    return 0LL;
  }

  return v3;
}

void crfsuite_delete_feature_tokenizer(FILE **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      fclose(v2);
    }
    uint64_t v3 = (void **)a1[1];
    if (v3) {
      iwa_delete(v3);
    }
    free(a1);
  }

uint64_t crfsuite_feature_tokenizer_get_next_token(uint64_t result)
{
  if (result) {
    return iwa_read(*(void *)(result + 8));
  }
  return result;
}

unsigned int *crfsuite_feature_token_get_type(unsigned int *result)
{
  if (result)
  {
    if (*result - 1 >= 4) {
      return 0LL;
    }
    else {
      return (unsigned int *)*result;
    }
  }

  return result;
}

uint64_t crfsuite_feature_token_get_attribute(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

uint64_t crfsuite_feature_token_get_value(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

_DWORD *dataset_init_trainset(uint64_t a1, unsigned int *a2, int a3, int a4, int a5)
{
  uint64_t v10 = *a2;
  if ((int)v10 < 1)
  {
    unsigned int v11 = 0;
  }

  else
  {
    unsigned int v11 = 0;
    uint64_t v12 = (int *)(*((void *)a2 + 1) + 24LL);
    uint64_t v13 = *a2;
    do
    {
      int v14 = *v12;
      v12 += 8;
      if (v14 != a5) {
        ++v11;
      }
      --v13;
    }

    while (v13);
  }

  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 16) = v11;
  double result = malloc(4LL * v11);
  *(void *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 20) = a3;
  *(_DWORD *)(a1 + 24) = a4;
  if ((int)v10 >= 1)
  {
    uint64_t v16 = 0LL;
    int v17 = 0;
    uint64_t v18 = (int *)(*((void *)a2 + 1) + 24LL);
    do
    {
      int v19 = *v18;
      v18 += 8;
      if (v19 != a5) {
        result[v17++] = v16;
      }
      ++v16;
    }

    while (v10 != v16);
  }

  return result;
}

_DWORD *dataset_init_testset(uint64_t a1, unsigned int *a2, int a3, int a4, int a5)
{
  uint64_t v10 = *a2;
  if ((int)v10 < 1)
  {
    unsigned int v11 = 0;
  }

  else
  {
    unsigned int v11 = 0;
    uint64_t v12 = (int *)(*((void *)a2 + 1) + 24LL);
    uint64_t v13 = *a2;
    do
    {
      int v14 = *v12;
      v12 += 8;
      if (v14 == a5) {
        ++v11;
      }
      --v13;
    }

    while (v13);
  }

  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 16) = v11;
  double result = malloc(4LL * v11);
  *(void *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 20) = a3;
  *(_DWORD *)(a1 + 24) = a4;
  if ((int)v10 >= 1)
  {
    uint64_t v16 = 0LL;
    int v17 = 0;
    uint64_t v18 = (int *)(*((void *)a2 + 1) + 24LL);
    do
    {
      int v19 = *v18;
      v18 += 8;
      if (v19 == a5) {
        result[v17++] = v16;
      }
      ++v16;
    }

    while (v10 != v16);
  }

  return result;
}

void dataset_finish(uint64_t a1)
{
}

uint64_t dataset_shuffle(uint64_t result)
{
  if (*(int *)(result + 16) >= 1)
  {
    uint64_t v1 = result;
    uint64_t v2 = 0LL;
    do
    {
      double result = rand();
      int v3 = (int)result % *(_DWORD *)(v1 + 16);
      uint64_t v4 = *(void *)(v1 + 8);
      int v5 = *(_DWORD *)(v4 + 4LL * v3);
      *(_DWORD *)(v4 + 4LL * v3) = *(_DWORD *)(v4 + 4 * v2);
      *(_DWORD *)(v4 + 4 * v2++) = v5;
    }

    while (v2 < *(int *)(v1 + 16));
  }

  return result;
}

uint64_t dataset_get(void *a1, int a2)
{
  return *(void *)(*a1 + 8LL) + 32LL * *(int *)(a1[1] + 4LL * a2);
}

uint64_t crfsuite_dictionary_create_instance(const char *a1, void *a2)
{
  if (strcmp(a1, "dictionary")) {
    return 1LL;
  }
  uint64_t v4 = calloc(1uLL, 0x48uLL);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  int v6 = quark_new();
  uint64_t result = 0LL;
  *(void *)int v5 = v6;
  v5[2] = 1;
  *((void *)v5 + 2) = dictionary_addref;
  *((void *)v5 + 3) = dictionary_release;
  *((void *)v5 + 4) = dictionary_get;
  *((void *)v5 + 5) = dictionary_to_id;
  *((void *)v5 + 6) = dictionary_to_string;
  *((void *)v5 + 7) = dictionary_num;
  *((void *)v5 + 8) = dictionary_free;
  *a2 = v5;
  return result;
}

uint64_t dictionary_addref(uint64_t a1)
{
  return crfsuite_interlocked_increment((_DWORD *)(a1 + 8));
}

uint64_t dictionary_release(uint64_t a1)
{
  uint64_t v2 = crfsuite_interlocked_decrement((_DWORD *)(a1 + 8));
  if (!(_DWORD)v2)
  {
    quark_delete(*(void *)a1);
    free((void *)a1);
  }

  return v2;
}

uint64_t dictionary_get(int **a1, const char *a2)
{
  return quark_get(*a1, a2);
}

uint64_t dictionary_to_id(uint64_t *a1, uint64_t a2)
{
  return quark_to_id(*a1, a2);
}

uint64_t dictionary_to_string(uint64_t *a1, int a2, char **a3)
{
  uint64_t v4 = (const char *)quark_to_string(*a1, a2);
  if (!v4) {
    return 1LL;
  }
  int v5 = v4;
  size_t v6 = strlen(v4);
  int v7 = (char *)malloc(v6 + 1);
  if (!v7) {
    return 1LL;
  }
  unsigned int v8 = v7;
  strcpy(v7, v5);
  uint64_t result = 0LL;
  *a3 = v8;
  return result;
}

uint64_t dictionary_num(unsigned int **a1)
{
  return crf1dm_get_version(*a1);
}

void dictionary_free(int a1, void *a2)
{
}

uint64_t ME_Efficient_Model_Trainer::perform_SGD(ME_Efficient_Model_Trainer *this)
{
  if (*((double *)this + 4) > 0.0)
  {
    uint64_t v88 = std::operator<<[abi:ne180100]<std::char_traits<char>>( MEMORY[0x189614538],  "error: L2 regularization is currently not supported in SGD mode.");
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v88);
    exit(1);
  }

  uint64_t v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"performing SGD",  14LL);
  std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)));
  int v3 = std::locale::use_facet((const std::locale *)&v101, MEMORY[0x189614558]);
  ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10LL);
  std::locale::~locale((std::locale *)&v101);
  std::ostream::put();
  std::ostream::flush();
  double v4 = *((double *)this + 3);
  uint64_t v5 = *((void *)this + 27) - *((void *)this + 26);
  std::vector<int>::vector( &v101,  0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 6) - *((void *)this + 5)) >> 4));
  begiuint64_t n = v101.__begin_;
  if (v101.__end_ != v101.__begin_)
  {
    uint64_t v7 = 0LL;
    unint64_t v8 = v101.__end_ - v101.__begin_;
    if (v8 <= 1) {
      unint64_t v8 = 1LL;
    }
    do
    {
      begin[v7] = v7;
      ++v7;
    }

    while (v8 != v7);
  }

  unint64_t v9 = (int)(v5 >> 2);
  std::vector<double>::vector(v100, v9);
  double v90 = *((double *)this + 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x189614538], (uint64_t)"eta0 = ", 7LL);
  uint64_t v10 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)" alpha = ", 9LL);
  unsigned int v11 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v11 + *(void *)(*v11 - 24LL)));
  uint64_t v12 = std::locale::use_facet(&v98, MEMORY[0x189614558]);
  ((void (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 10LL);
  std::locale::~locale(&v98);
  std::ostream::put();
  std::ostream::flush();
  v97.__begin_ = 0LL;
  std::vector<double>::vector(&v98, v9, &v97);
  __x[0] = 0;
  std::vector<int>::vector(&v97, v9, __x);
  *(void *)__x = 0LL;
  uint64_t v95 = 0LL;
  uint64_t v96 = 0LL;
  uint64_t v13 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v96, 1uLL);
  int v14 = *(double **)__x;
  uint64_t v15 = v95;
  int v17 = (double *)&v13[v16];
  *uint64_t v13 = 0LL;
  uint64_t v18 = (double *)(v13 + 1);
  while (v15 != v14)
  {
    uint64_t v19 = *((void *)v15-- - 1);
    *--uint64_t v13 = v19;
  }

  *(void *)__x = v13;
  uint64_t v95 = v18;
  uint64_t v96 = v17;
  if (v14) {
    operator delete(v14);
  }
  uint64_t v95 = v18;
  if (*((int *)this + 1) >= 1)
  {
    int v20 = 0;
    int v21 = 0;
    double v22 = 0.0;
    while (1)
    {
      std::random_shuffle[abi:ne180100]<std::__wrap_iter<int *>>((uint64_t)v101.__begin_, (uint64_t)v101.__end_);
      uint64_t v23 = *((void *)this + 5);
      if (*((void *)this + 6) != v23) {
        break;
      }
      LODWORD(v24) = 0;
      int v78 = 0;
      unint64_t v77 = 0LL;
      double v25 = 0.0;
LABEL_66:
      double v79 = v25 / (double)v77;
      uint64_t v80 = (FILE **)MEMORY[0x1895F89D0];
      if (v4 > 0.0)
      {
        uint64_t v81 = (double *)*((void *)this + 18);
        uint64_t v82 = *((void *)this + 19) - (void)v81;
        if (v82)
        {
          unint64_t v83 = v82 >> 3;
          if (v83 <= 1) {
            unint64_t v83 = 1LL;
          }
          double v84 = 0.0;
          do
          {
            double v85 = *v81++;
            double v84 = v84 + fabs(v85);
            --v83;
          }

          while (v83);
        }

        else
        {
          double v84 = 0.0;
        }

        double v79 = v79 + -v4 * v84;
      }

      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "%3d  obj(err) = %f (%6.4f)",  ++v21,  v79,  1.0 - (double)v78 / (double)(int)v24);
      if (*((int *)this + 88) >= 1)
      {
        double v86 = ME_Efficient_Model_Trainer::heldout_likelihood(this);
        fprintf(*v80, "  heldout_logl(err) = %f (%6.4f)", v86, *((double *)this + 43));
      }

      fputc(10, *v80);
      if (v21 >= *((_DWORD *)this + 1)) {
        goto LABEL_78;
      }
    }

    int v89 = v21;
    int v92 = 0;
    unint64_t v24 = 0LL;
    double v25 = 0.0;
LABEL_15:
    int v26 = v101.__begin_[v24];
    std::vector<double>::vector(__p, *((int *)this + 58));
    uint64_t v27 = (void *)(v23 + 80LL * v26);
    int v28 = ME_Efficient_Model_Trainer::conditional_probability((uint64_t)this, v27, (double **)__p);
    int v91 = v20;
    double v29 = v90
        * pow( *((double *)this + 2),  (double)v20 / (double)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 6) - *((void *)this + 5)) >> 4)));
    uint64_t v30 = v95;
    double v31 = *(v95 - 1) + v29 * v4;
    if (v95 >= v96)
    {
      uint64_t v33 = *(double **)__x;
      uint64_t v34 = ((uint64_t)v95 - *(void *)__x) >> 3;
      unint64_t v35 = v34 + 1;
      uint64_t v36 = (uint64_t)v96 - *(void *)__x;
      else {
        unint64_t v37 = v35;
      }
      if (v37)
      {
        uint64_t v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v96, v37);
        uint64_t v33 = *(double **)__x;
        uint64_t v30 = v95;
      }

      else
      {
        uint64_t v38 = 0LL;
      }

      uint64_t v39 = (double *)&v38[8 * v34];
      *uint64_t v39 = v31;
      uint64_t v32 = v39 + 1;
      while (v30 != v33)
      {
        uint64_t v40 = *((void *)v30-- - 1);
        *((void *)v39-- - 1) = v40;
      }

      *(void *)__x = v39;
      uint64_t v95 = v32;
      uint64_t v96 = (double *)&v38[8 * v37];
      if (v33) {
        operator delete(v33);
      }
    }

    else
    {
      *uint64_t v95 = v31;
      uint64_t v32 = v30 + 1;
    }

    double v22 = v22 + v29 * v4;
    uint64_t v95 = v32;
    uint64_t v41 = *(int *)v27;
    double v42 = log(*((double *)__p[0] + v41));
    int v43 = v92;
    if (v28 == (_DWORD)v41) {
      int v43 = v92 + 1;
    }
    int v92 = v43;
    uint64_t v44 = v23 + 80LL * v26;
    uint64_t v47 = *(int **)(v44 + 16);
    uint64_t v46 = (int **)(v44 + 16);
    uint64_t v45 = v47;
    uint64_t v48 = *(v46 - 1);
    double v49 = -v29;
    if (v48 == v47) {
      goto LABEL_47;
    }
    uint64_t v50 = *((void *)this + 36);
LABEL_35:
    uint64_t v51 = v50 + 24LL * *v48;
    uint64_t v52 = *(int **)v51;
    if (*(void *)v51 == *(void *)(v51 + 8)) {
      goto LABEL_46;
    }
    while (1)
    {
      unsigned __int8 v53 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature((ME_Efficient_Model_Trainer *)((char *)this + 168), *v52);
      double v54 = *((double *)__p[0] + v53);
      double v55 = *(_DWORD *)v27 == ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( (ME_Efficient_Model_Trainer *)((char *)this + 168),  *v52)
          ? 1.0
          : 0.0;
      uint64_t v56 = *v52;
      uint64_t v57 = *((void *)this + 18);
      double v58 = *(double *)(v57 + 8 * v56) + v49 * (v54 - v55);
      *(double *)(v57 + 8 * v56) = v58;
      locale = v98.__locale_;
      if (v58 > 0.0) {
        break;
      }
      double v60 = v58;
      if (v58 < 0.0)
      {
        double v60 = fmin(v58 + v22 - *((double *)v98.__locale_ + v56), 0.0);
        goto LABEL_43;
      }

LABEL_44:
      *((double *)locale + v56) = *((double *)locale + v56) + v60 - v58;
      ++v52;
      uint64_t v50 = *((void *)this + 36);
      if (v52 == *(int **)(v50 + 24LL * *v48 + 8))
      {
        uint64_t v45 = *v46;
LABEL_46:
        if (++v48 == v45)
        {
LABEL_47:
          uint64_t v61 = v23 + 80LL * v26;
          uint64_t v64 = *(int **)(v61 + 40);
          uint64_t v63 = (int **)(v61 + 40);
          uint64_t v62 = v64;
          uint64_t v65 = *(v63 - 1);
          if (v65 == v64) {
            goto LABEL_61;
          }
          uint64_t v66 = *((void *)this + 36);
          while (2)
          {
            uint64_t v67 = v66 + 24LL * *v65;
            int v68 = *(int **)v67;
            if (*(void *)v67 == *(void *)(v67 + 8)) {
              goto LABEL_60;
            }
            while (2)
            {
              unsigned __int8 v69 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( (ME_Efficient_Model_Trainer *)((char *)this + 168),  *v68);
              double v70 = *((double *)__p[0] + v69);
              if (*(_DWORD *)v27 == ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( (ME_Efficient_Model_Trainer *)((char *)this + 168),  *v68)) {
                double v71 = 1.0;
              }
              else {
                double v71 = 0.0;
              }
              uint64_t v72 = *v68;
              uint64_t v73 = *((void *)this + 18);
              double v74 = *(double *)(v73 + 8 * v72) + v49 * (*((double *)v65 + 1) * (v70 - v71));
              *(double *)(v73 + 8 * v72) = v74;
              uint64_t v75 = v98.__locale_;
              if (v74 > 0.0)
              {
                double v76 = fmax(v74 - (v22 + *((double *)v98.__locale_ + v72)), 0.0);
                goto LABEL_57;
              }

              double v76 = v74;
              if (v74 < 0.0)
              {
                double v76 = fmin(v74 + v22 - *((double *)v98.__locale_ + v72), 0.0);
LABEL_57:
                *(double *)(v73 + 8 * v72) = v76;
              }

              *((double *)v75 + v72) = *((double *)v75 + v72) + v76 - v74;
              ++v68;
              uint64_t v66 = *((void *)this + 36);
              break;
            }

            uint64_t v62 = *v63;
LABEL_60:
            v65 += 4;
            if (v65 != v62) {
              continue;
            }
            break;
          }

LABEL_61:
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }

          double v25 = v25 + v42;
          ++v24;
          int v20 = v91 + 1;
          uint64_t v23 = *((void *)this + 5);
          unint64_t v77 = 0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 6) - v23) >> 4);
          if (v24 >= v77)
          {
            int v21 = v89;
            int v78 = v92;
            goto LABEL_66;
          }

          goto LABEL_15;
        }

        goto LABEL_35;
      }
    }

    double v60 = fmax(v58 - (v22 + *((double *)v98.__locale_ + v56)), 0.0);
LABEL_43:
    *(double *)(v57 + 8 * v56) = v60;
    goto LABEL_44;
  }

LABEL_78:
  if (*(void *)__x)
  {
    uint64_t v95 = *(double **)__x;
    operator delete(*(void **)__x);
  }

  if (v97.__begin_)
  {
    v97.__end_ = v97.__begin_;
    operator delete(v97.__begin_);
  }

  if (v98.__locale_)
  {
    uint64_t v99 = v98.__locale_;
    operator delete(v98.__locale_);
  }

  if (v100[0])
  {
    v100[1] = v100[0];
    operator delete(v100[0]);
  }

  if (v101.__begin_)
  {
    v101.__end_ = v101.__begin_;
    operator delete(v101.__begin_);
  }

  return 0LL;
}

void sub_187426DEC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20, void *__p, uint64_t a22, uint64_t a23, void *a24, uint64_t a25, uint64_t a26, std::locale a27, uint64_t a28, uint64_t a29, void *a30, uint64_t a31)
{
  if (__p) {
    operator delete(__p);
  }
  if (a24) {
    operator delete(a24);
  }
  if (a27.__locale_) {
    operator delete(a27.__locale_);
  }
  if (a30) {
    operator delete(a30);
  }
  uint64_t v33 = *(void **)(v31 - 176);
  if (v33)
  {
    *(void *)(v31 - 168) = v33;
    operator delete(v33);
  }

  _Unwind_Resume(exception_object);
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

void *std::endl[abi:ne180100]<char,std::char_traits<char>>(void *a1)
{
  uint64_t v2 = std::locale::use_facet(&v4, MEMORY[0x189614558]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10LL);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_187426F70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t std::random_shuffle[abi:ne180100]<std::__wrap_iter<int *>>(uint64_t result, uint64_t a2)
{
  unint64_t v2 = a2 - result;
  if (a2 - result >= 5)
  {
    std::locale v4 = (int *)result;
    __int128 v11 = xmmword_18744C640;
    std::__rs_get();
    unint64_t v5 = a2 - 4;
    if (v5 > (unint64_t)v4)
    {
      uint64_t v6 = (v2 >> 2) - 1;
      do
      {
        v9[0] = 0LL;
        v9[1] = v6;
        uint64_t v7 = std::uniform_int_distribution<long>::operator()<std::__rs_default>((uint64_t)&v11, (uint64_t)&v10, v9);
        if (v7)
        {
          int v8 = *v4;
          *std::locale v4 = v4[v7];
          v4[v7] = v8;
        }

        ++v4;
        --v6;
      }

      while ((unint64_t)v4 < v5);
    }

    return MEMORY[0x1895A4A44](&v10);
  }

  return result;
}

uint64_t ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( ME_Efficient_Model_Trainer::ME_FeatureBag *this, int a2)
{
  return *(unsigned int *)(v2 + 4LL * a2);
}

void __clang_call_terminate(void *a1)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( void *a1, uint64_t a2, uint64_t a3)
{
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      char v10 = std::locale::use_facet(&v14, MEMORY[0x189614558]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }

    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  MEMORY[0x1895A4AB0](v13);
  return a1;
}

void sub_187427184( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_1874271CC(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0LL;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0LL;
      }
    }

    uint64_t v15 = a4 - a3;
    else {
      return 0LL;
    }
  }

  return v6;
}

void sub_187427300( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  this->__begin_ = 0LL;
  this->__end_ = 0LL;
  this->__end_cap_.__value_ = 0LL;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }

  return this;
}

void sub_187427430(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *std::vector<int>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void *std::vector<double>::vector(void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }

  return a1;
}

void sub_187427518(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void *std::vector<double>::vector(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v6 = (void *)a1[1];
    size_t v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8LL;
    }

    while (v8);
    a1[1] = v7;
  }

  return a1;
}

void sub_187427598(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

std::vector<int> *__cdecl std::vector<int>::vector( std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  this->__begin_ = 0LL;
  this->__end_ = 0LL;
  this->__end_cap_.__value_ = 0LL;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    size_t v7 = &end[__n];
    std::vector<int>::size_type v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4LL;
    }

    while (v8);
    this->__end_ = v7;
  }

  return this;
}

void sub_187427618(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t std::uniform_int_distribution<long>::operator()<std::__rs_default>( uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = a3[1];
  uint64_t v4 = result - *a3;
  if (result != *a3)
  {
    unint64_t v5 = v4 + 1;
    if (v4 == -1)
    {
      std::__independent_bits_engine<std::__rs_default,unsigned long>::__independent_bits_engine( (uint64_t)v10,  a2,  0x40uLL);
      return std::__independent_bits_engine<std::__rs_default,unsigned long>::__eval((uint64_t)v10);
    }

    else
    {
      unint64_t v7 = __clz(v5);
      uint64_t v8 = 63LL;
      if (((v5 << v7) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        uint64_t v8 = 64LL;
      }
      std::__independent_bits_engine<std::__rs_default,unsigned long>::__independent_bits_engine( (uint64_t)v10,  a2,  v8 - v7);
      do
        unint64_t v9 = std::__independent_bits_engine<std::__rs_default,unsigned long>::__eval((uint64_t)v10);
      while (v9 >= v5);
      return *a3 + v9;
    }
  }

  return result;
}

uint64_t std::__independent_bits_engine<std::__rs_default,unsigned long>::__independent_bits_engine( uint64_t result, uint64_t a2, unint64_t a3)
{
  *(void *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  if ((a3 & 0x1F) != 0) {
    unint64_t v3 = (a3 >> 5) + 1;
  }
  else {
    unint64_t v3 = a3 >> 5;
  }
  unint64_t v4 = a3 / v3;
  *(void *)(result + 16) = a3 / v3;
  *(void *)(result + 24) = v3;
  unint64_t v5 = (-1LL << (a3 / v3)) & 0x100000000LL;
  if (a3 / v3 >= 0x40) {
    unint64_t v5 = 0LL;
  }
  *(void *)(result + 40) = v5;
  if ((v5 ^ 0x100000000LL) > v5 / v3)
  {
    ++v3;
    unint64_t v4 = a3 / v3;
    *(void *)(result + 16) = a3 / v3;
    *(void *)(result + 24) = v3;
    if (a3 / v3 > 0x3F)
    {
      unint64_t v6 = 0LL;
      *(void *)(result + 32) = v3 + v4 * v3 - a3;
      *(void *)(result + 40) = 0LL;
      goto LABEL_13;
    }

    *(void *)(result + 40) = (-1LL << v4) & 0x100000000LL;
  }

  *(void *)(result + 32) = v3 + a3 / v3 * v3 - a3;
  if (v4 > 0x3E) {
    unint64_t v6 = 0LL;
  }
  else {
    unint64_t v6 = 0x80000000uLL >> v4 << (v4 + 1);
  }
LABEL_13:
  *(void *)(result + 48) = v6;
  unsigned int v7 = 0xFFFFFFFF >> -(char)v4;
  if (!v4) {
    unsigned int v7 = 0;
  }
  if (v4 >= 0x1F) {
    unsigned int v8 = -1;
  }
  else {
    unsigned int v8 = 0xFFFFFFFF >> ~(_BYTE)v4;
  }
  *(_DWORD *)(result + 56) = v7;
  *(_DWORD *)(result + 60) = v8;
  return result;
}

uint64_t std::__independent_bits_engine<std::__rs_default,unsigned long>::__eval(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = 0LL;
    unint64_t v3 = 0LL;
    do
    {
      do
        std::__rs_default::result_type v4 = std::__rs_default::operator()(*(std::__rs_default **)a1);
      while (*(void *)(a1 + 40) <= (unint64_t)v4);
      unint64_t v5 = *(void *)(a1 + 16);
      if (v5 >= 0x40) {
        uint64_t v6 = 0LL;
      }
      else {
        uint64_t v6 = v2 << v5;
      }
      uint64_t v2 = v6 + (*(_DWORD *)(a1 + 56) & v4);
      ++v3;
      unint64_t v7 = *(void *)(a1 + 32);
    }

    while (v3 < v7);
  }

  else
  {
    uint64_t v2 = 0LL;
    unint64_t v7 = 0LL;
  }

  for (; v7 < *(void *)(a1 + 24); ++v7)
  {
    do
      std::__rs_default::result_type v8 = std::__rs_default::operator()(*(std::__rs_default **)a1);
    while (*(void *)(a1 + 48) <= (unint64_t)v8);
    unint64_t v9 = *(void *)(a1 + 16);
    if (v9 >= 0x3F) {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v10 = v2 << (v9 + 1);
    }
    uint64_t v2 = v10 + (*(_DWORD *)(a1 + 60) & v8);
  }

  return v2;
}

void holdout_evaluation(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t *a4)
{
  int v8 = a2[4];
  int v9 = (*(uint64_t (**)(void))(*(void *)(*(void *)a2 + 24LL) + 56LL))();
  crfsuite_evaluation_init((uint64_t)v18, v9);
  (*(void (**)(uint64_t, uint64_t, double))(a1 + 88))(a1, a3, 1.0);
  if (v8 < 1)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    int v10 = 0;
    uint64_t v11 = 0LL;
    do
    {
      int64_t v12 = (int *)dataset_get(a2, v10);
      if (*v12 >= 1)
      {
        free(v11);
        uint64_t v11 = malloc(4LL * *v12);
      }

      (*(void (**)(uint64_t, int *))(a1 + 96))(a1, v12);
      (*(void (**)(uint64_t, void *, _BYTE *))(a1 + 112))(a1, v11, v17);
      crfsuite_evaluation_accmulate((int *)v18, *((int **)v12 + 2), (int *)v11, *v12);
      ++v10;
    }

    while (v8 != v10);
  }

  crfsuite_evaluation_finalize(v18);
  crfsuite_evaluation_output((int *)v18, *(void *)(*(void *)a2 + 24LL), a4[1], *a4, v13, v14, v15, v16);
  crfsuite_evaluation_finish((uint64_t)v18);
  if (v11) {
    free(v11);
  }
}

char *iwa_reader(uint64_t a1)
{
  uint64_t v2 = (char *)malloc(0x68uLL);
  unint64_t v3 = v2;
  if (!v2) {
    goto LABEL_4;
  }
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 8) = 0u;
  *(void *)uint64_t v2 = a1;
  std::__rs_default::result_type v4 = (char *)malloc(0x10000uLL);
  *((void *)v3 + 4) = v4;
  *((void *)v3 + 5) = v4 + 0x10000;
  *((void *)v3 + 6) = v4 + 0x10000;
  if (v4)
  {
    *((void *)v3 + 9) = calloc(0x1000uLL, 1uLL);
    *(_OWORD *)(v3 + 56) = xmmword_18744C650;
    *((void *)v3 + 12) = calloc(0x1000uLL, 1uLL);
    *((_OWORD *)v3 + 5) = xmmword_18744C650;
  }

  else
  {
LABEL_4:
    iwa_delete((void **)v3);
    return 0LL;
  }

  return v3;
}

void iwa_delete(void **a1)
{
  if (a1)
  {
    free(a1[12]);
    a1[10] = 0LL;
    a1[11] = 0LL;
    a1[12] = 0LL;
    free(a1[9]);
    a1[7] = 0LL;
    a1[8] = 0LL;
    a1[9] = 0LL;
    free(a1[4]);
  }

  free(a1);
}

uint64_t iwa_read(uint64_t a1)
{
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  bzero(*(void **)(a1 + 72), *(void *)(a1 + 56));
  *(void *)(a1 + 64) = 0LL;
  bzero(*(void **)(a1 + 96), *(void *)(a1 + 80));
  *(void *)(a1 + 88) = 0LL;
  int v2 = peek_char(a1);
  std::__rs_default::result_type v4 = (int *)(a1 + 8);
  int v3 = *(_DWORD *)(a1 + 8);
  if (v2 == -1)
  {
    uint64_t result = 0LL;
    switch(v3)
    {
      case 0:
      case 3:
        int v6 = 1;
        goto LABEL_22;
      case 1:
        return result;
      case 2:
        goto LABEL_15;
      case 4:
LABEL_11:
        while (1)
        {
          int v7 = peek_char(a1);
          if (v7 != 9) {
            break;
          }
        }

        if (v7 == 10)
        {
LABEL_15:
          int v6 = 3;
LABEL_22:
          *std::__rs_default::result_type v4 = v6;
        }

        else
        {
          read_field_unescaped(a1, (uint64_t *)(a1 + 56));
          if (peek_char(a1) == 58)
          {
            read_field_unescaped(a1, (uint64_t *)(a1 + 80));
            peek_char(a1);
          }

          *(_DWORD *)(a1 + 8) = 4;
          uint64_t v8 = *(void *)(a1 + 96);
          *(void *)(a1 + 16) = *(void *)(a1 + 72);
          *(void *)(a1 + 24) = v8;
        }

        break;
      default:
        return a1 + 8;
    }
  }

  else
  {
    switch(v3)
    {
      case 0:
      case 3:
        if (peek_char(a1) != 10)
        {
          int v6 = 2;
          goto LABEL_22;
        }

        *std::__rs_default::result_type v4 = 0;
        break;
      case 2:
      case 4:
        goto LABEL_11;
      default:
        return a1 + 8;
    }
  }

  return a1 + 8;
}

uint64_t peek_char(uint64_t a1)
{
  uint64_t v1 = *(char **)(a1 + 40);
  size_t v3 = fread(*(void **)(a1 + 32), 1uLL, 0x10000uLL, *(FILE **)a1);
  uint64_t v1 = *(char **)(a1 + 32);
  *(void *)(a1 + 40) = v1;
  *(void *)(a1 + 48) = &v1[v3];
  if (v3) {
    return *v1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t read_field_unescaped(uint64_t a1, uint64_t *a2)
{
  while (1)
  {
    uint64_t result = peek_char(a1);
    int v6 = result;
    if (v6 == 92)
    {
      int v7 = peek_char(a1);
      LOBYTE(v6) = v7;
      if (v7 == 92 || v7 == 58)
      {
      }

      else
      {
        LOBYTE(v6) = 92;
      }
    }

    uint64_t v8 = *a2;
    unint64_t v9 = a2[1];
    if (*a2 <= v9)
    {
      *a2 = 2 * v8;
      int v10 = realloc((void *)a2[2], 2 * v8);
      a2[2] = (uint64_t)v10;
      unint64_t v9 = a2[1];
      bzero(&v10[v9], *a2 - v9);
    }

    else
    {
      int v10 = (_BYTE *)a2[2];
    }

    a2[1] = v9 + 1;
    v10[v9] = v6;
  }

  return result;
}

void *logging( void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (result)
  {
    unint64_t v9 = (uint64_t (*)(void, uint64_t, uint64_t *))result[1];
    if (v9) {
      return (void *)v9(*result, a2, &a9);
    }
  }

  return result;
}

void *logging_timestamp(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  time(&v12);
  std::__rs_default::result_type v4 = gmtime(&v12);
  strftime(v13, 0x50uLL, "%Y-%m-%dT%H:%M:%SZ", v4);
  return logging(a1, a2, v5, v6, v7, v8, v9, v10, (uint64_t)v13);
}

void *logging_progress_start( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_DWORD *)(a1 + 16) = 0;
  return logging((void *)a1, (uint64_t)"0", a3, a4, a5, a6, a7, a8, a9);
}

void *logging_progress( void *result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *((_DWORD *)result + 4);
  if (v8 < a2)
  {
    uint64_t v10 = result;
    do
    {
      int v11 = v8 + 1;
      *((_DWORD *)v10 + 4) = v11;
      if ((v11 & 1) == 0)
      {
        if (v11 % 10)
        {
          time_t v12 = v10;
          uint64_t v13 = ".";
        }

        else
        {
          uint64_t v14 = (v11 / 10);
          time_t v12 = v10;
          uint64_t v13 = "%d";
        }

        uint64_t result = logging(v12, (uint64_t)v13, a3, a4, a5, a6, a7, a8, v14);
      }

      int v8 = *((_DWORD *)v10 + 4);
    }

    while (v8 < a2);
  }

  return result;
}

void *logging_progress_end( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return logging(a1, (uint64_t)"\n", v10, v11, v12, v13, v14, v15, a9);
}

_DWORD *params_create_instance()
{
  v0 = calloc(1uLL, 0x80uLL);
  if (v0)
  {
    uint64_t v1 = calloc(1uLL, 0x10uLL);
    *(void *)v0 = v1;
    if (v1)
    {
      v0[2] = 1;
      *((void *)v0 + 2) = params_addref;
      *((void *)v0 + 3) = params_release;
      *((void *)v0 + 4) = params_num;
      *((void *)v0 + 5) = params_name;
      *((void *)v0 + 6) = params_set;
      *((void *)v0 + 7) = params_get;
      *((void *)v0 + 8) = params_set_int;
      *((void *)v0 + 9) = params_set_float;
      *((void *)v0 + 10) = params_set_string;
      *((void *)v0 + 11) = params_get_int;
      *((void *)v0 + 12) = params_get_float;
      *((void *)v0 + 13) = params_get_string;
      *((void *)v0 + 14) = params_help;
      *((void *)v0 + 15) = params_free;
    }

    else
    {
      free(v0);
      return 0LL;
    }
  }

  return v0;
}

uint64_t params_addref(uint64_t a1)
{
  return crfsuite_interlocked_increment((_DWORD *)(a1 + 8));
}

uint64_t params_release(_DWORD *a1)
{
  uint64_t v2 = crfsuite_interlocked_decrement(a1 + 2);
  if (!(_DWORD)v2)
  {
    size_t v3 = *(void ***)a1;
    if (**(int **)a1 >= 1)
    {
      uint64_t v4 = 0LL;
      uint64_t v5 = 0LL;
      do
      {
        free(*(void **)((char *)v3[1] + v4));
        free(*(void **)((char *)v3[1] + v4 + 24));
        free(*(void **)((char *)v3[1] + v4 + 32));
        ++v5;
        v4 += 40LL;
      }

      while (v5 < *(int *)v3);
    }

    free(v3[1]);
    free(v3);
    free(a1);
  }

  return v2;
}

uint64_t params_num(unsigned int **a1)
{
  return **a1;
}

uint64_t params_name(uint64_t a1, int a2, char **a3)
{
  *a3 = mystrdup(*(const char **)(*(void *)(*(void *)a1 + 8LL) + 40LL * a2));
  return 0LL;
}

uint64_t params_set(unsigned int **a1, char *a2, const char *a3)
{
  parauint64_t m = find_param(*a1, a2);
  if (!param) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = param;
  int v6 = *((_DWORD *)param + 2);
  switch(v6)
  {
    case 3:
      free((void *)param[3]);
      if (a3) {
        uint64_t v9 = a3;
      }
      else {
        uint64_t v9 = "";
      }
      uint64_t v10 = mystrdup(v9);
      uint64_t result = 0LL;
      v5[3] = v10;
      break;
    case 2:
      if (a3) {
        double v11 = atof(a3);
      }
      else {
        double v11 = 0.0;
      }
      uint64_t result = 0LL;
      *((double *)v5 + 2) = v11;
      break;
    case 1:
      if (a3) {
        int v7 = atoi(a3);
      }
      else {
        int v7 = 0;
      }
      uint64_t result = 0LL;
      *((_DWORD *)v5 + 3) = v7;
      break;
    default:
      return 0LL;
  }

  return result;
}

uint64_t params_get(unsigned int **a1, char *a2, char **a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  parauint64_t m = find_param(*a1, a2);
  if (!param) {
    return 0xFFFFFFFFLL;
  }
  int v5 = *((_DWORD *)param + 2);
  switch(v5)
  {
    case 3:
      int v7 = (char *)param[3];
LABEL_10:
      int v8 = mystrdup(v7);
      uint64_t result = 0LL;
      *a3 = v8;
      return result;
    case 2:
      snprintf(__str, 0x3FFuLL, "%f");
      goto LABEL_9;
    case 1:
      snprintf(__str, 0x3FFuLL, "%d");
LABEL_9:
      int v7 = __str;
      goto LABEL_10;
  }

  return 0LL;
}

void params_free(int a1, void *a2)
{
}

uint64_t params_set_int(unsigned int **a1, char *a2, int a3)
{
  parauint64_t m = find_param(*a1, a2);
  if (!param) {
    return 0xFFFFFFFFLL;
  }
  int v5 = param;
  if (*((_DWORD *)param + 2) != 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *((_DWORD *)v5 + 3) = a3;
  return result;
}

uint64_t params_set_float(unsigned int **a1, char *a2, double a3)
{
  parauint64_t m = find_param(*a1, a2);
  if (!param) {
    return 0xFFFFFFFFLL;
  }
  int v5 = param;
  if (*((_DWORD *)param + 2) != 2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *((double *)v5 + 2) = a3;
  return result;
}

uint64_t params_set_string(unsigned int **a1, char *a2, const char *a3)
{
  parauint64_t m = find_param(*a1, a2);
  if (!param) {
    return 0xFFFFFFFFLL;
  }
  int v5 = param;
  if (*((_DWORD *)param + 2) != 3) {
    return 0xFFFFFFFFLL;
  }
  free((void *)param[3]);
  int v6 = mystrdup(a3);
  uint64_t result = 0LL;
  v5[3] = v6;
  return result;
}

uint64_t params_get_int(unsigned int **a1, char *a2, _DWORD *a3)
{
  parauint64_t m = find_param(*a1, a2);
  if (!param) {
    return 0xFFFFFFFFLL;
  }
  int v5 = param;
  if (*((_DWORD *)param + 2) != 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *a3 = *((_DWORD *)v5 + 3);
  return result;
}

uint64_t params_get_float(unsigned int **a1, char *a2, void *a3)
{
  parauint64_t m = find_param(*a1, a2);
  if (!param) {
    return 0xFFFFFFFFLL;
  }
  int v5 = param;
  if (*((_DWORD *)param + 2) != 2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *a3 = v5[2];
  return result;
}

uint64_t params_get_string(unsigned int **a1, char *a2, void *a3)
{
  parauint64_t m = find_param(*a1, a2);
  if (!param) {
    return 0xFFFFFFFFLL;
  }
  int v5 = param;
  if (*((_DWORD *)param + 2) != 3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *a3 = v5[3];
  return result;
}

uint64_t params_help(unsigned int **a1, char *a2, char **a3, char **a4)
{
  parauint64_t m = find_param(*a1, a2);
  if (!param) {
    return 0xFFFFFFFFLL;
  }
  int v7 = param;
  if (a3)
  {
    unsigned int v8 = *((_DWORD *)param + 2) - 1;
    if (v8 > 2) {
      uint64_t v9 = "unknown";
    }
    else {
      uint64_t v9 = off_18A04E5C8[v8];
    }
    *a3 = mystrdup(v9);
  }

  if (!a4) {
    return 0LL;
  }
  double v11 = mystrdup(v7[4]);
  uint64_t result = 0LL;
  *a4 = v11;
  return result;
}

uint64_t params_add_int(int **a1, const char *a2, int a3, const char *a4)
{
  uint64_t v7 = (uint64_t)*a1;
  unsigned int v8 = (char *)realloc(*((void **)*a1 + 1), 40LL * **a1 + 40);
  *(void *)(v7 + 8) = v8;
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  int v9 = (*(_DWORD *)v7)++;
  uint64_t v10 = &v8[40 * v9];
  *((void *)v10 + 4) = 0LL;
  *(_OWORD *)uint64_t v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *(void *)uint64_t v10 = mystrdup(a2);
  *((_DWORD *)v10 + 2) = 1;
  *((_DWORD *)v10 + 3) = a3;
  double v11 = mystrdup(a4);
  uint64_t result = 0LL;
  *((void *)v10 + 4) = v11;
  return result;
}

char *mystrdup(const char *a1)
{
  size_t v2 = strlen(a1);
  uint64_t result = (char *)malloc(v2 + 1);
  if (result) {
    return strcpy(result, a1);
  }
  return result;
}

uint64_t params_add_float(int **a1, const char *a2, const char *a3, double a4)
{
  uint64_t v7 = (uint64_t)*a1;
  unsigned int v8 = (char *)realloc(*((void **)*a1 + 1), 40LL * **a1 + 40);
  *(void *)(v7 + 8) = v8;
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  int v9 = (*(_DWORD *)v7)++;
  uint64_t v10 = &v8[40 * v9];
  *((void *)v10 + 4) = 0LL;
  *(_OWORD *)uint64_t v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *(void *)uint64_t v10 = mystrdup(a2);
  *((_DWORD *)v10 + 2) = 2;
  *((double *)v10 + 2) = a4;
  double v11 = mystrdup(a3);
  uint64_t result = 0LL;
  *((void *)v10 + 4) = v11;
  return result;
}

uint64_t params_add_string(int **a1, const char *a2, const char *a3, const char *a4)
{
  uint64_t v7 = (uint64_t)*a1;
  unsigned int v8 = (char *)realloc(*((void **)*a1 + 1), 40LL * **a1 + 40);
  *(void *)(v7 + 8) = v8;
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  int v9 = (*(_DWORD *)v7)++;
  uint64_t v10 = &v8[40 * v9];
  *((void *)v10 + 4) = 0LL;
  *(_OWORD *)uint64_t v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *(void *)uint64_t v10 = mystrdup(a2);
  *((_DWORD *)v10 + 2) = 3;
  *((void *)v10 + 3) = mystrdup(a3);
  double v11 = mystrdup(a4);
  uint64_t result = 0LL;
  *((void *)v10 + 4) = v11;
  return result;
}

const char **find_param(unsigned int *a1, char *__s2)
{
  uint64_t v2 = *a1;
  for (int i = (const char **)*((void *)a1 + 1); strcmp(*i, __s2); i += 5)
  {
    if (!--v2) {
      return 0LL;
    }
  }

  return i;
}

void *quark_new()
{
  v0 = malloc(0x18uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    void *v0 = 0LL;
    uint64_t v2 = rumavl_new((void *)0x10, (int (__cdecl *)(const void *, const void *, size_t))keycmp, 0LL, 0LL);
    v1[1] = v2;
    if (v2)
    {
      uint64_t v3 = (uint64_t)v2;
      *(void *)rumavl_delcb((uint64_t)v2) = delcb;
      *(void *)rumavl_owcb(v3) = owcb;
    }

    v1[2] = 0LL;
  }

  return v1;
}

uint64_t keycmp(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

uint64_t delcb(uint64_t a1, uint64_t a2, void **a3)
{
  return 0LL;
}

uint64_t owcb(uint64_t a1, uint64_t a2, void **a3)
{
  return 0LL;
}

void quark_delete(uint64_t a1)
{
  if (a1)
  {
    rumavl_destroy(*(uint64_t ***)(a1 + 8));
    free(*(void **)(a1 + 16));
    free((void *)a1);
  }

uint64_t quark_get(int *a1, const char *a2)
{
  uint64_t v14 = a2;
  uint64_t v4 = rumavl_find(*((uint64_t **)a1 + 1), (uint64_t)&v14);
  if (v4)
  {
    int v5 = (unsigned int *)(v4 + 8);
  }

  else
  {
    size_t v6 = strlen(a2);
    uint64_t v7 = (char *)malloc(v6 + 1);
    unsigned int v8 = v7;
    if (v7) {
      strcpy(v7, a2);
    }
    int v9 = *a1;
    int v10 = a1[1];
    if (v10 <= *a1)
    {
      int v12 = 2 * v10 + 2;
      a1[1] = v12;
      double v11 = realloc(*((void **)a1 + 2), 8LL * v12);
      *((void *)a1 + 2) = v11;
      int v9 = *a1;
    }

    else
    {
      double v11 = (void *)*((void *)a1 + 2);
    }

    v11[v9] = v8;
    uint64_t v14 = v8;
    int v5 = (unsigned int *)&v15;
    int v15 = v9;
    rumavl_insert(*((void *)a1 + 1), &v14);
    ++*a1;
  }

  return *v5;
}

uint64_t quark_to_id(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = rumavl_find(*(uint64_t **)(a1 + 8), (uint64_t)&v4);
  if (v2) {
    return *(unsigned int *)(v2 + 8);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t quark_to_string(uint64_t a1, int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    return 0LL;
  }
  else {
    return *(void *)(*(void *)(a1 + 16) + 8LL * a2);
  }
}

void *rumavl_new( void *result, int (__cdecl *a2)(const void *__s1, const void *__s2, size_t __n), uint64_t (*a3)(void, uint64_t, uint64_t), uint64_t a4)
{
  if (result)
  {
    uint64_t v7 = result;
    if (a3)
    {
      uint64_t result = (void *)a3(0LL, 56LL, a4);
      if (!result) {
        return result;
      }
    }

    else
    {
      uint64_t result = malloc(0x38uLL);
      if (!result) {
        return result;
      }
    }

    result[4] = 0LL;
    result[5] = a3;
    *uint64_t result = 0LL;
    result[1] = v7;
    result[6] = a4;
    unsigned int v8 = my_cmp;
    if (a2) {
      unsigned int v8 = a2;
    }
    result[2] = v8;
    result[3] = 0LL;
  }

  return result;
}

void rumavl_destroy(uint64_t **a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    while (!*((_BYTE *)v2 + 16))
      uint64_t v2 = (uint64_t *)*v2;
    do
    {
      int v4 = *((unsigned __int8 *)v2 + 17);
      if (v4 == 2)
      {
        int i = 0LL;
      }

      else if (v4 == 1)
      {
        int i = (uint64_t *)v2[1];
      }

      else
      {
      }

      int v5 = a1[4];
      if (v5) {
        ((void (*)(uint64_t **, uint64_t *, uint64_t, uint64_t *))v5)(a1, v2, v2[3], a1[6]);
      }
      node_destroy((uint64_t)a1, v2);
      uint64_t v2 = i;
    }

    while (i);
  }

  size_t v6 = a1[5];
  if (v6) {
    ((void (*)(uint64_t **, void, uint64_t *))v6)(a1, 0LL, a1[6]);
  }
  else {
    free(a1);
  }
}

uint64_t seq_next(uint64_t a1, int a2)
{
  uint64_t v2 = (a2 + 1) >> 1;
  int v3 = *(unsigned __int8 *)(a1 + v2 + 16);
  if (v3 == 2) {
    return 0LL;
  }
  if (v3 == 1) {
    return *(void *)(a1 + 8 * v2);
  }
  uint64_t v5 = v2 ^ 1;
  for (uint64_t result = *(void *)(a1 + 8 * v2); !*(_BYTE *)(result + v5 + 16); uint64_t result = *(void *)(result + 8 * v5))
    ;
  return result;
}

void node_destroy(uint64_t a1, void *a2)
{
  int v4 = (void *)a2[3];
  uint64_t v5 = *(void (**)(void *, void, void))(a1 + 40);
  if (v5) {
    v5(v4, 0LL, *(void *)(a1 + 48));
  }
  else {
    free(v4);
  }
  size_t v6 = *(void (**)(void *, void, void))(a1 + 40);
  if (v6) {
    v6(a2, 0LL, *(void *)(a1 + 48));
  }
  else {
    free(a2);
  }
}

uint64_t rumavl_udata(uint64_t a1)
{
  return a1 + 48;
}

uint64_t rumavl_owcb(uint64_t a1)
{
  return a1 + 24;
}

uint64_t rumavl_delcb(uint64_t a1)
{
  return a1 + 32;
}

uint64_t rumavl_set(uint64_t a1, const void *a2)
{
  size_t v4 = *(void *)a1;
  if (*(void *)a1)
  {
    int v20 = 0LL;
    int v5 = (*(uint64_t (**)(const void *, void, void, void))(a1 + 16))( a2,  *(void *)(v4 + 24),  *(void *)(a1 + 8),  *(void *)(a1 + 48));
    if (v5 < 0) {
      int v6 = -1;
    }
    else {
      int v6 = v5 != 0;
    }
    if (v6)
    {
      BOOL v7 = v5 >= 0;
      unsigned int v8 = (void *)a1;
      while (1)
      {
        BOOL v9 = v7;
        unsigned int v8 = (void *)(*v8 + 8 * v9);
        int v10 = (*(uint64_t (**)(const void *, void, void, void))(a1 + 16))( a2,  *(void *)(*v8 + 24LL),  *(void *)(a1 + 8),  *(void *)(a1 + 48));
        BOOL v7 = v10 >= 0;
        if (v10 < 0) {
          int v6 = -1;
        }
        else {
          int v6 = v10 != 0;
        }
        if (!v6)
        {
          double v11 = (void **)v20;
          goto LABEL_17;
        }
      }

      uint64_t v16 = node_new((size_t *)a1, a2);
      if (!v16)
      {
LABEL_25:
        stack_destroy(a1, (void **)v20);
        return 4294967294LL;
      }

      uint64_t v17 = *(void *)(*v8 + 8 * v9);
      *(void *)&v16[8 * v9] = v17;
      int v18 = *(unsigned __int8 *)(*v8 + v9 + 16LL);
      v16[v9 + 16] = v18;
      BOOL v19 = !v7;
      if (v18 == 2) {
        *(void *)(v17 + 8 * v19) = v16;
      }
      *(void *)&v16[8 * v19] = *v8;
      v16[v19 + 16] = 1;
      *(void *)(*v8 + 8 * v9) = v16;
      *(_BYTE *)(*v8 + v9 + 16LL) = 0;
      stack_update(a1, v20, 1);
      return 0LL;
    }

    double v11 = 0LL;
    unsigned int v8 = (void *)a1;
LABEL_17:
    stack_destroy(a1, v11);
    int v15 = *(uint64_t (**)(uint64_t, void, void, const void *, void))(a1 + 24);
    if (!v15 || (uint64_t result = v15(a1, *v8, *(void *)(*v8 + 24LL), a2, *(void *)(a1 + 48)), !(_DWORD)result))
    {
      memcpy(*(void **)(*v8 + 24LL), a2, *(void *)(a1 + 8));
      return 0LL;
    }
  }

  else
  {
    int v12 = node_new((size_t *)a1, a2);
    *(void *)a1 = v12;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t result = 0LL;
      *(void *)uint64_t v13 = v13;
      *(void *)(*(void *)a1 + 8LL) = *(void *)a1;
      *(_BYTE *)(*(void *)a1 + 16LL) = 2;
      *(_BYTE *)(*(void *)a1 + 17LL) = 2;
    }

    else
    {
      return 4294967294LL;
    }
  }

  return result;
}

char *node_new(size_t *a1, const void *a2)
{
  size_t v4 = (uint64_t (*)(void, uint64_t, size_t))a1[5];
  if (v4) {
    int v5 = (char *)v4(0LL, 32LL, a1[6]);
  }
  else {
    int v5 = (char *)malloc(0x20uLL);
  }
  int v6 = v5;
  if (v5)
  {
    BOOL v7 = mem_mgr((uint64_t)a1, 0LL, a1[1]);
    *((void *)v6 + 3) = v7;
    if (v7)
    {
      memcpy(v7, a2, a1[1]);
      *(void *)int v6 = 0LL;
      *((void *)v6 + 1) = 0LL;
      *(_DWORD *)(v6 + 15) = 0;
    }

    else
    {
      unsigned int v8 = (void (*)(char *, void, size_t))a1[5];
      if (v8) {
        v8(v6, 0LL, a1[6]);
      }
      else {
        free(v6);
      }
      return 0LL;
    }
  }

  return v6;
}

void stack_destroy(uint64_t a1, void **a2)
{
  if (a2)
  {
    do
    {
      int v3 = (void **)*a2;
      size_t v4 = *(void (**)(void **, void, void))(a1 + 40);
      if (v4) {
        v4(a2, 0LL, *(void *)(a1 + 48));
      }
      else {
        free(a2);
      }
      a2 = v3;
    }

    while (v3);
  }

uint64_t stack_push(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  BOOL v7 = *(uint64_t (**)(void, uint64_t, void))(a1 + 40);
  if (!v7)
  {
    unsigned int v8 = malloc(0x18uLL);
    if (v8) {
      goto LABEL_3;
    }
    return 0xFFFFFFFFLL;
  }

  unsigned int v8 = (void *)v7(0LL, 24LL, *(void *)(a1 + 48));
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
LABEL_3:
  uint64_t v9 = 0LL;
  *unsigned int v8 = *a2;
  *a2 = v8;
  v8[1] = a3;
  *((_DWORD *)v8 + 4) = a4;
  return v9;
}

void stack_update(uint64_t a1, void *a2, int a3)
{
  int v3 = a2;
  if (a2)
  {
    LOBYTE(v5) = a3;
    if (a3)
    {
      while (1)
      {
        int v6 = (uint64_t *)*((void *)v3 + 1);
        int v7 = *(char *)(*v6 + 18);
        int v8 = *((_DWORD *)v3 + 4);
        int v9 = (char)(*(_BYTE *)(*v6 + 18) + v5 * v8);
        *(_BYTE *)(*v6 + 18) += v5 * v8;
        if ((v5 & 0x80) != 0) {
          break;
        }
        if (v8 != -1 || (v9 & 0x80000000) == 0)
        {
          int v10 = v9 - (v7 & ~(v7 >> 31));
          if (v8 != 1 || v9 < 1) {
            int v5 = 0;
          }
          else {
            int v5 = v10;
          }
LABEL_23:
          while (v9 > 1)
          {
            v5 += balance(v6, -1);
            int v6 = (uint64_t *)*((void *)v3 + 1);
            int v9 = *(char *)(*v6 + 18);
          }

          goto LABEL_24;
        }

        int v5 = (v7 & (v7 >> 31)) - v9;
LABEL_24:
        if (v9 <= -2)
        {
          do
          {
            v5 += balance(v6, 1);
            int v6 = (uint64_t *)*((void *)v3 + 1);
          }

          while (*(char *)(*v6 + 18) < -1);
        }

        uint64_t v13 = *(void **)v3;
        uint64_t v14 = *(void (**)(void *, void, void))(a1 + 40);
        if (v14)
        {
          v14(v3, 0LL, *(void *)(a1 + 48));
          if (!v13) {
            goto LABEL_33;
          }
        }

        else
        {
          free(v3);
          if (!v13) {
            goto LABEL_33;
          }
        }

        int v3 = v13;
        if (!(_BYTE)v5) {
          goto LABEL_33;
        }
      }

      if (v8 == -1 && v7 < 0)
      {
        int v5 = v7 - (v9 & (v9 >> 31));
      }

      else if (v8 != 1 || v7 < 1)
      {
        int v5 = 0;
      }

      else
      {
        int v5 = (v9 & ~(v9 >> 31)) - v7;
      }

      goto LABEL_23;
    }
  }

  uint64_t v13 = a2;
LABEL_33:
  if (v13)
  {
    do
    {
      int v15 = (void *)*v13;
      uint64_t v16 = *(void (**)(void *, void, void))(a1 + 40);
      if (v16) {
        v16(v13, 0LL, *(void *)(a1 + 48));
      }
      else {
        free(v13);
      }
      uint64_t v13 = v15;
    }

    while (v15);
  }

uint64_t rumavl_insert(uint64_t a1, const void *a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = insert_cb;
  uint64_t result = rumavl_set(a1, a2);
  *(void *)(a1 + 24) = v3;
  return result;
}

uint64_t insert_cb()
{
  return 4294967290LL;
}

uint64_t rumavl_delete(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  if (!*(void *)a1) {
    return 4294967293LL;
  }
  uint64_t v40 = 0LL;
  int v5 = (*(uint64_t (**)(uint64_t, void, void, void))(a1 + 16))( a2,  *(void *)(v2 + 24),  *(void *)(a1 + 8),  *(void *)(a1 + 48));
  if (v5 < 0) {
    int v6 = -1;
  }
  else {
    int v6 = v5 != 0;
  }
  int v7 = (void **)a1;
  if (v6)
  {
    int v7 = (void **)a1;
    while (!stack_push(a1, &v40, (uint64_t)v7, v6))
    {
      uint64_t v8 = (v6 + 1) >> 1;
      if (*((char *)*v7 + v8 + 16) >= 1)
      {
        stack_destroy(a1, (void **)v40);
        return 4294967293LL;
      }

      int v7 = (void **)&(*v7)[v8];
      int v9 = (*(uint64_t (**)(uint64_t, void, void, void))(a1 + 16))( a2,  (*v7)[3],  *(void *)(a1 + 8),  *(void *)(a1 + 48));
      if (v9 < 0) {
        int v6 = -1;
      }
      else {
        int v6 = v9 != 0;
      }
      if (!v6) {
        goto LABEL_13;
      }
    }

    goto LABEL_45;
  }

LABEL_13:
  int v10 = *(uint64_t (**)(uint64_t, void, void, void))(a1 + 32);
  if (!v10 || (uint64_t v11 = v10(a1, *v7, (*v7)[3], *(void *)(a1 + 48)), !(_DWORD)v11))
  {
    uint64_t v13 = (void **)*v7;
    int v14 = *((char *)*v7 + 17);
    if (*((char *)*v7 + 16) >= 1)
    {
      if (v14 < 1)
      {
        *int v7 = v13[1];
        do
        {
          double v22 = v7;
          int v7 = (void **)*v7;
        }

        while (!*((_BYTE *)v7 + 16));
        *int v7 = *v13;
        *((_BYTE *)*v22 + 16) = *((_BYTE *)v13 + 16);
        uint64_t v23 = *v22;
        if (v23[16] == 2) {
          *(void *)(*(void *)v23 + 8LL) = v23;
        }
      }

      else
      {
        int v15 = (void **)v40;
        if (v40)
        {
          int v16 = *((_DWORD *)v40 + 4);
          if (v16 >= -1) {
            int v17 = v16 + 1;
          }
          else {
            int v17 = v16 + 2;
          }
          *(void *)(**((void **)v40 + 1) + 8LL * (v17 >> 1)) = v13[v17 >> 1];
          *(_BYTE *)(*v15[1] + (v17 >> 1) + 16LL) = *((_BYTE *)v13 + (v17 >> 1) + 16);
          uint64_t v18 = *v15[1];
          if (*(_BYTE *)(v18 + (v17 >> 1) + 16) == 2) {
            *(void *)(*(void *)(v18 + 8 * ((uint64_t)v17 >> 1)) + 8 * (((uint64_t)v17 >> 1) ^ 1)) = v18;
          }
        }

        else
        {
          *(void *)a1 = 0LL;
        }
      }

    uint64_t v8 = 0LL;
    uint64_t result = 0LL;
    if (!a4) {
      return result;
    }
    goto LABEL_14;
  }

  uint64_t result = seq_next(a2, v6);
  if (!result) {
    goto LABEL_13;
  }
LABEL_7:
  if (!a4) {
    return result;
  }
  uint64_t v8 = *(void *)(result + 24);
LABEL_14:
  *a4 = v8;
  return result;
}

LABEL_36:
      node_destroy(a1, v13);
LABEL_37:
      stack_update(a1, v40, -1);
      return 0LL;
    }

    if (v14 >= 1)
    {
      *int v7 = *v13;
      do
      {
        BOOL v19 = v7;
        int v20 = *((unsigned __int8 *)*v7 + 17);
        int v7 = (void **)(*v7 + 1);
      }

      while (!v20);
      *int v7 = v13[1];
      *((_BYTE *)*v19 + 17) = *((_BYTE *)v13 + 17);
      int v21 = *v19;
      if (v21[17] == 2) {
        **((void **)v21 + 1) = v21;
      }
      goto LABEL_36;
    }

    int v24 = *((char *)v13 + 18);
    BOOL v25 = v24 > 0;
    BOOL v26 = v24 < 1;
    if (v24 < 1) {
      int v27 = 1;
    }
    else {
      int v27 = -1;
    }
    if (v24 < 1) {
      int v28 = -1;
    }
    else {
      int v28 = 1;
    }
    if (stack_push(a1, &v40, (uint64_t)v7, v28))
    {
LABEL_45:
      stack_destroy(a1, (void **)v40);
      return 4294967294LL;
    }

    uint64_t v30 = &(*v7)[v25];
    uint64_t v31 = *v30;
    uint64_t v32 = *v30 + v26;
    int v34 = *(unsigned __int8 *)(v32 + 16);
    uint64_t v33 = (_BYTE *)(v32 + 16);
    if (v34)
    {
      *(void *)(v31 + 8 * v26) = (*v7)[v26];
      *uint64_t v33 = *((_BYTE *)*v7 + v26 + 16);
      unint64_t v35 = *v7;
      *(_BYTE *)(v31 + 18) = *((_BYTE *)*v7 + 18);
    }

    else
    {
      uint64_t v36 = v40;
      uint64_t v37 = v31;
      while (1)
      {
        uint64_t v38 = (uint64_t *)(v37 + 8 * v26);
        uint64_t v31 = *v38;
        if (*(_BYTE *)(*v38 + v26 + 16)) {
          break;
        }
        int v39 = stack_push(a1, &v40, (uint64_t)v38, v27);
        uint64_t v37 = v31;
        if (v39) {
          goto LABEL_45;
        }
      }

      if (*(_BYTE *)(v31 + v25 + 16)) {
        *(_BYTE *)(v37 + v26 + 16) = 1;
      }
      else {
        *uint64_t v38 = *(void *)(v31 + 8 * v25);
      }
      *(void *)uint64_t v31 = **v7;
      *(_BYTE *)(v31 + 16) = *((_BYTE *)*v7 + 16);
      *(void *)(v31 + 8) = (*v7)[1];
      *(_BYTE *)(v31 + 17) = *((_BYTE *)*v7 + 17);
      *(_BYTE *)(v31 + 18) = *((_BYTE *)*v7 + 18);
      v36[1] = v31 + 8 * v25;
      unint64_t v35 = *v7;
    }

    node_destroy(a1, v35);
    *int v7 = (void *)v31;
    *(void *)(seq_next(v31, v27) + 8 * v25) = v31;
    goto LABEL_37;
  }

  uint64_t v12 = v11;
  stack_destroy(a1, (void **)v40);
  return v12;
}

uint64_t rumavl_find(uint64_t *a1, uint64_t a2)
{
  return v3;
}

uint64_t rumavl_node_find(uint64_t *a1, uint64_t a2, void *a3)
{
  if (!a2 || (uint64_t v5 = *a1) == 0)
  {
LABEL_8:
    uint64_t v10 = 0LL;
    uint64_t v5 = 0LL;
    if (!a3) {
      return v5;
    }
    goto LABEL_12;
  }

  while (1)
  {
    int v7 = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))a1[2])(a2, *(void *)(v5 + 24), a1[1], a1[6]);
    int v8 = v7 != 0;
    if (v7 < 0) {
      int v8 = -1;
    }
    if (!v8) {
      break;
    }
    uint64_t v9 = (v8 + 1) >> 1;
    uint64_t v5 = *(void *)(v5 + 8 * v9);
  }

  if (a3)
  {
    uint64_t v10 = *(void *)(v5 + 24);
LABEL_12:
    *a3 = v10;
  }

  return v5;
}

uint64_t rumavl_alloc(uint64_t a1)
{
  return a1 + 40;
}

uint64_t rumavl_record_size(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t rumavl_node_next(uint64_t *a1, uint64_t a2, int a3, void *a4)
{
  if (!a3) {
    goto LABEL_13;
  }
  if (a3 < 1) {
    int v6 = -1;
  }
  else {
    int v6 = 1;
  }
  if (!a2)
  {
    uint64_t result = *a1;
    if (result)
    {
      goto LABEL_7;
    }

uint64_t rumavl_node_record(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t rumavl_foreach( uint64_t *a1, int a2, uint64_t (*a3)(uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = rumavl_node_next(a1, 0LL, a2, &v11);
  if (!v8) {
    return 4294967293LL;
  }
  uint64_t v9 = v8;
  do
  {
    uint64_t result = a3(a1, v11, a4);
    if ((_DWORD)result) {
      break;
    }
    uint64_t result = rumavl_node_next(a1, v9, a2, &v11);
    uint64_t v9 = result;
  }

  while (result);
  return result;
}

const char *rumavl_strerror(unsigned int a1)
{
  if (a1 != 0 && a1 < 0xFFFFFFFA) {
    return "UNKNOWN ERROR";
  }
  else {
    return off_18A04E5E0[a1 + 6];
  }
}

void *mem_mgr(uint64_t a1, void *__ptr, size_t __size)
{
  uint64_t v3 = *(uint64_t (**)(void *, size_t, void))(a1 + 40);
  if (v3) {
    return (void *)v3(__ptr, __size, *(void *)(a1 + 48));
  }
  if (__size) {
    return realloc(__ptr, __size);
  }
  free(__ptr);
  return 0LL;
}

uint64_t balance(uint64_t *a1, int a2)
{
  if (a1)
  {
    uint64_t v4 = *a1;
    if (*a1) {
      BOOL v5 = a2 * a2 == 1;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5 && (unsigned int v6 = (a2 + 1) >> 1, v7 = v6 ^ 1, *(char *)(v4 + v7 + 16) <= 0))
    {
      uint64_t v10 = (uint64_t *)(v4 + 8 * v7);
      else {
        char v11 = 0;
      }
      return (char)(rotate(a1, a2) + v11);
    }

    else
    {
      return 0;
    }
  }

  else
  {
    return 0;
  }

uint64_t rotate(uint64_t *a1, int a2)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1 && a2 * a2 == 1)
    {
      uint64_t v4 = (a2 + 1) >> 1;
      uint64_t v5 = v4 ^ 1;
      if (*(char *)(v2 + v5 + 16) <= 0)
      {
        if (a2 == -1)
        {
          int v10 = *(unsigned __int8 *)(v2 + 18);
          if (*(char *)(*(void *)(v2 + 8) + 18LL) < 1)
          {
LABEL_25:
            char v6 = 0;
LABEL_26:
            uint64_t v11 = *(void *)(v2 + 8 * v5);
            *a1 = v11;
            if (*(char *)(v11 + v4 + 16) < 1)
            {
              char v12 = 0;
              *(void *)(v2 + 8 * v5) = *(void *)(v11 + 8 * v4);
            }

            else
            {
              char v12 = 1;
            }

            *(_BYTE *)(v2 + v5 + 16) = v12;
            *(void *)(*a1 + 8 * v4) = v2;
            *(_BYTE *)(*a1 + v4 + 16) = 0;
            int v13 = *(char *)(v2 + 18);
            uint64_t v14 = *a1;
            int v15 = *(char *)(*a1 + 18);
            int v16 = v13 >> 7;
            if (v13 >= 1) {
              int v16 = 1;
            }
            int v17 = v15 >> 7;
            if (v15 >= 1) {
              LOBYTE(v17) = 1;
            }
            if (v16 + a2)
            {
              else {
                char v20 = v13 + a2;
              }
              *(_BYTE *)(v2 + 18) = v20;
              char v19 = v20 + a2 + *(_BYTE *)(v14 + 18);
              goto LABEL_43;
            }

            if (v17 == v16)
            {
              char v18 = a2 - v15 + v13;
              *(_BYTE *)(v2 + 18) = v18;
              if (v18 * a2 >= 1)
              {
                char v19 = v15 + a2 + v18;
LABEL_43:
                *(_BYTE *)(v14 + 18) = v19;
                return v6;
              }
            }

            else
            {
              *(_BYTE *)(v2 + 18) = v13 + a2;
            }

            char v19 = *(_BYTE *)(v14 + 18) + a2;
            goto LABEL_43;
          }
        }

        else
        {
          if (a2 == 1)
          {
            int v8 = *(unsigned __int8 *)(v2 + 18);
            if ((*(char *)(v2 + 18) & 0x80000000) == 0)
            {
LABEL_13:
              BOOL v9 = v8 == 255;
              goto LABEL_21;
            }

            if (v8 == 255) {
              goto LABEL_13;
            }
LABEL_19:
            char v6 = -1;
            goto LABEL_26;
          }

          int v10 = *(unsigned __int8 *)(v2 + 18);
        }

LABEL_20:
        BOOL v9 = v10 == 1;
LABEL_21:
        char v6 = !v9;
        goto LABEL_26;
      }
    }
  }

  return 0;
}

uint64_t crfsuite_train_arow_init(uint64_t a1)
{
  return exchange_options(a1, 0LL, 0);
}

uint64_t exchange_options(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "variance", a2);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "gamma", a2 + 8);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_iterations", a2 + 16);
    return (*(uint64_t (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "epsilon", a2 + 24);
  }

  else
  {
    params_add_float((int **)a1, "variance", "The initial variance of every feature weight.", 1.0);
    params_add_float((int **)a1, "gamma", "Tradeoff parameter.", 1.0);
    params_add_int((int **)a1, "max_iterations", 100, "The maximum number of iterations.");
    return params_add_float((int **)a1, "epsilon", "The stopping criterion (the mean loss).", 0.0);
  }

uint64_t crfsuite_train_arow(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, void *a5, double **a6)
{
  int v11 = *(_DWORD *)(a2 + 16);
  size_t v13 = *(int *)(a1 + 44);
  size_t v12 = *(int *)(a1 + 48);
  clock_t v14 = clock();
  __int128 v173 = 0u;
  __int128 v174 = 0u;
  __int128 v175 = 0u;
  int v15 = calloc(v13, 1uLL);
  *(void *)&__int128 v174 = v15;
  *(void *)&__int128 v175 = calloc(v13, 8uLL);
  DWORD2(v175) = v13;
  if ((void)v175) {
    BOOL v16 = v15 == 0LL;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    char v19 = 0LL;
    char v20 = 0LL;
    char v18 = 0LL;
    int v17 = 0LL;
LABEL_55:
    v155 = a6;
    free(v17);
    uint64_t v154 = 2147483649LL;
    int v17 = (char *)v20;
    char v20 = v19;
    char v19 = v18;
    char v18 = 0LL;
    goto LABEL_56;
  }

  int v170 = v11;
  clock_t v163 = v14;
  (*(void (**)(uint64_t, const char *, uint64_t *))(a4 + 96))(a4, "variance", &v176);
  (*(void (**)(uint64_t, const char *, double *))(a4 + 96))(a4, "gamma", &v177);
  (*(void (**)(uint64_t, const char *, int *))(a4 + 88))(a4, "max_iterations", &v178);
  (*(void (**)(uint64_t, const char *, double *))(a4 + 96))(a4, "epsilon", v179);
  char v18 = (double *)calloc(8uLL, v13);
  char v19 = (double *)calloc(8uLL, v13);
  int v167 = v13;
  char v20 = (double *)calloc(8uLL, v13);
  int v21 = (char *)calloc(4uLL, v12);
  int v17 = v21;
  if (!v18 || !v19 || !v20 || !v21) {
    goto LABEL_55;
  }
  if (v167 >= 1)
  {
    uint64_t v28 = v176;
    double v29 = (uint64_t *)v19;
    uint64_t v30 = v167;
    do
    {
      *v29++ = v28;
      --v30;
    }

    while (v30);
  }

  logging(a5, (uint64_t)"Adaptive Regularization of Weights (AROW)\n", v22, v23, v24, v25, v26, v27, v157);
  logging(a5, (uint64_t)"variance: %f\n", v31, v32, v33, v34, v35, v36, v176);
  logging(a5, (uint64_t)"gamma: %f\n", v37, v38, v39, v40, v41, v42, *(uint64_t *)&v177);
  logging(a5, (uint64_t)"max_iterations: %d\n", v43, v44, v45, v46, v47, v48, v178);
  logging(a5, (uint64_t)"epsilon: %f\n", v49, v50, v51, v52, v53, v54, *(uint64_t *)&v179[0]);
  logging(a5, (uint64_t)"\n", v55, v56, v57, v58, v59, v60, v158);
  LODWORD(v169) = 0;
  int v61 = v170;
  v165 = a3;
  v166 = a5;
  while ((int)v169 < v178)
  {
    clock_t v168 = clock();
    dataset_shuffle(a2);
    double v68 = 0.0;
    double v69 = 0.0;
    if (v61 >= 1)
    {
      for (int i = 0; i != v61; ++i)
      {
        double v71 = (unsigned int *)dataset_get((void *)a2, i);
        (*(void (**)(uint64_t, double *, double))(a1 + 88))(a1, v18, 1.0);
        (*(void (**)(uint64_t, unsigned int *))(a1 + 96))(a1, v71);
        (*(void (**)(uint64_t, char *, double *))(a1 + 112))(a1, v17, &v172);
        uint64_t v72 = *v71;
        if ((int)v72 >= 1)
        {
          uint64_t v73 = 0LL;
          int v74 = 0;
          uint64_t v75 = 4 * v72;
          do
          {
            if (*(_DWORD *)(*((void *)v71 + 2) + v73) != *(_DWORD *)&v17[v73]) {
              ++v74;
            }
            v73 += 4LL;
          }

          while (v75 != v73);
          if (v74)
          {
            (*(void (**)(uint64_t))(a1 + 104))(a1);
            double v76 = v172;
            uint64_t v77 = DWORD2(v173);
            if (SDWORD2(v173) >= 1)
            {
              int v78 = (int *)v173;
              uint64_t v79 = v175;
              do
              {
                uint64_t v80 = *v78++;
                *(void *)(v79 + 8 * v80) = 0LL;
                --v77;
              }

              while (v77);
            }

            double v81 = v76 - v171 + (double)v74;
            DWORD2(v173) = 0;
            *((void *)&v174 + 1) = 0x3FF0000000000000LL;
            (*(void (**)(uint64_t, unsigned int *, void, double (*)(uint64_t, int, double), __int128 *))(a1 + 80))( a1,  v71,  *((void *)v71 + 2),  delta_collect,  &v173);
            *((void *)&v174 + 1) = 0xBFF0000000000000LL;
            (*(void (**)(uint64_t, unsigned int *, char *, double (*)(uint64_t, int, double), __int128 *))(a1 + 80))( a1,  v71,  v17,  delta_collect,  &v173);
            int v82 = DWORD2(v173);
            if (SDWORD2(v173) < 1)
            {
              DWORD2(v173) = 0;
              int v61 = v170;
            }

            else
            {
              uint64_t v83 = 0LL;
              int v84 = 0;
              int v61 = v170;
              do
              {
                uint64_t v85 = v174;
                int v86 = *(_DWORD *)(v173 + 4 * v83);
                if (!*(_BYTE *)(v174 + v86))
                {
                  *(_DWORD *)(v173 + 4LL * v84++) = v86;
                  *(_BYTE *)(v85 + v86) = 1;
                  int v82 = DWORD2(v173);
                }

                ++v83;
              }

              while (v83 < v82);
              DWORD2(v173) = v84;
              if (v84 >= 1)
              {
                uint64_t v87 = 0LL;
                do
                  *(_BYTE *)(v174 + *(int *)(v173 + 4 * v87++)) = 0;
                while (v87 < SDWORD2(v173));
                uint64_t v88 = DWORD2(v173);
                if (SDWORD2(v173) >= 1)
                {
                  int v89 = (int *)v173;
                  uint64_t v90 = v175;
                  uint64_t v91 = DWORD2(v173);
                  do
                  {
                    uint64_t v92 = *v89++;
                    v20[v92] = *(double *)(v90 + 8 * v92) * *(double *)(v90 + 8 * v92);
                    --v91;
                  }

                  while (v91);
                  double v93 = v177;
                  uint64_t v94 = (int *)v173;
                  uint64_t v95 = v88;
                  do
                  {
                    uint64_t v96 = *v94++;
                    double v93 = v93 + v20[v96] * v19[v96];
                    --v95;
                  }

                  while (v95);
                  std::vector<int> v97 = (int *)v173;
                  uint64_t v98 = v175;
                  double v99 = v81 / v93;
                  do
                  {
                    uint64_t v100 = *v97++;
                    v18[v100] = v18[v100] + v99 * v19[v100] * *(double *)(v98 + 8 * v100);
                    v19[v100] = 1.0 / (1.0 / v19[v100] + v20[v100] / v177);
                    --v88;
                  }

                  while (v88);
                }
              }
            }

            double v69 = v69 + v81;
          }

          else
          {
            int v61 = v170;
          }
        }
      }
    }

    uint64_t v169 = (v169 + 1);
    a5 = v166;
    logging(v166, (uint64_t)"***** Iteration #%d *****\n", v62, v63, v64, v65, v66, v67, v169);
    logging(v166, (uint64_t)"Loss: %f\n", v101, v102, v103, v104, v105, v106, *(uint64_t *)&v69);
    if (v167 >= 1)
    {
      double v68 = 0.0;
      uint64_t v113 = v18;
      uint64_t v114 = v167;
      do
      {
        double v115 = *v113++;
        double v68 = v68 + v115 * v115;
        --v114;
      }

      while (v114);
    }

    logging(v166, (uint64_t)"Feature norm: %f\n", v107, v108, v109, v110, v111, v112, COERCE__INT64(sqrt(v68)));
    clock_t v116 = clock();
    logging( v166,  (uint64_t)"Seconds required for this iteration: %.3f\n",  v117,  v118,  v119,  v120,  v121,  v122,  COERCE__INT64((double)(v116 - v168) / 1000000.0));
    if (v165) {
      holdout_evaluation(a1, v165, (uint64_t)v18, v166);
    }
    logging(v166, (uint64_t)"\n", v123, v124, v125, v126, v127, v128, v159);
    if (v69 / (double)v170 <= v179[0])
    {
      logging(v166, (uint64_t)"Terminated with the stopping criterion\n", v129, v130, v131, v132, v133, v134, v160);
      logging(v166, (uint64_t)"\n", v135, v136, v137, v138, v139, v140, v161);
      break;
    }
  }

  clock_t v141 = clock();
  logging( a5,  (uint64_t)"Total seconds required for training: %.3f\n",  v142,  v143,  v144,  v145,  v146,  v147,  COERCE__INT64((double)(v141 - v163) / 1000000.0));
  logging(a5, (uint64_t)"\n", v148, v149, v150, v151, v152, v153, v162);
  uint64_t v154 = 0LL;
  v155 = a6;
LABEL_56:
  free(v17);
  free(v20);
  free(v19);
  *v155 = v18;
  delta_finish((void **)&v173);
  return v154;
}

double delta_collect(uint64_t a1, int a2, double a3)
{
  int v6 = *(_DWORD *)(a1 + 8);
  int v7 = *(_DWORD *)(a1 + 12);
  int v8 = *(void **)a1;
  if (v7 <= v6)
  {
    int v9 = 2 * v7 + 2;
    *(_DWORD *)(a1 + 12) = v9;
    int v8 = realloc(v8, 4LL * v9);
    *(void *)a1 = v8;
    int v6 = *(_DWORD *)(a1 + 8);
  }

  *(_DWORD *)(a1 + 8) = v6 + 1;
  *((_DWORD *)v8 + v6) = a2;
  uint64_t v10 = *(void *)(a1 + 32);
  double result = *(double *)(v10 + 8LL * a2) + *(double *)(a1 + 24) * a3;
  *(double *)(v10 + 8LL * a2) = result;
  return result;
}

double delta_finish(void **a1)
{
  double result = 0.0;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

void ME_Efficient_Model_Trainer::~ME_Efficient_Model_Trainer(ME_Efficient_Model_Trainer *this)
{
  uint64_t v2 = (char *)*((void *)this + 17);
  if (v2) {
    nlp::BurstTrieRelease(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 45);
  if (v3)
  {
    *((void *)this + 46) = v3;
    operator delete(v3);
  }

  int v8 = (void **)((char *)this + 312);
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100](&v8);
  int v8 = (void **)((char *)this + 288);
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v8);
  uint64_t v4 = (void *)*((void *)this + 33);
  if (v4)
  {
    *((void *)this + 34) = v4;
    operator delete(v4);
  }

  uint64_t v5 = (void *)*((void *)this + 30);
  if (v5)
  {
    *((void *)this + 31) = v5;
    operator delete(v5);
  }

  int v6 = (void *)*((void *)this + 26);
  if (v6)
  {
    *((void *)this + 27) = v6;
    operator delete(v6);
  }

  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)this + 168);
  int v7 = (void *)*((void *)this + 18);
  if (v7)
  {
    *((void *)this + 19) = v7;
    operator delete(v7);
  }

  int v8 = (void **)((char *)this + 112);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v8);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 72);
  int v8 = (void **)((char *)this + 40);
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100](&v8);
}

void ME_Efficient_Model_Trainer::ME_FeatureBag::~ME_FeatureBag( ME_Efficient_Model_Trainer::ME_FeatureBag *this)
{
  uint64_t v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    *((void *)this + 6) = v2;
    operator delete(v2);
  }

  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)this);
}

void ME_Efficient_Model_Trainer::StringBag::~StringBag(ME_Efficient_Model_Trainer::StringBag *this)
{
  uint64_t v2 = (void **)((char *)this + 48);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 8);
}

double ME_Efficient_Model_Trainer::FunctionGradient( ME_Efficient_Model_Trainer *this, uint64_t **a2, double **a3)
{
  unint64_t v3 = (int)((uint64_t)(*((void *)this + 27) - *((void *)this + 26)) >> 2);
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  if (v3 != v5 - *a2) {
    ME_Efficient_Model_Trainer::FunctionGradient();
  }
  if (v5 != v4)
  {
    int v9 = (void *)*((void *)this + 18);
    if (v3 <= 1) {
      unint64_t v3 = 1LL;
    }
    do
    {
      uint64_t v10 = *v4++;
      *v9++ = v10;
      --v3;
    }

    while (v3);
  }

  ME_Efficient_Model_Trainer::update_model_expectation(this);
  double v12 = *((double *)this + 4);
  clock_t v14 = *a2;
  size_t v13 = a2[1];
  if (v12 == 0.0)
  {
    uint64_t v15 = (char *)v13 - (char *)v14;
    if (v15)
    {
      unint64_t v16 = v15 >> 3;
      int v17 = (double *)*((void *)this + 30);
      char v18 = (double *)*((void *)this + 33);
      char v19 = *a3;
      if (v16 <= 1) {
        unint64_t v16 = 1LL;
      }
      do
      {
        double v20 = *v17++;
        double v21 = v20;
        double v22 = *v18++;
        *v19++ = -(v21 - v22);
        --v16;
      }

      while (v16);
    }
  }

  else
  {
    uint64_t v23 = (char *)v13 - (char *)v14;
    if (v23)
    {
      unint64_t v24 = v23 >> 3;
      uint64_t v25 = (double *)*((void *)this + 30);
      uint64_t v26 = (double *)*((void *)this + 33);
      uint64_t v27 = (double *)*((void *)this + 18);
      double v28 = v12 * -2.0;
      double v29 = *a3;
      if (v24 <= 1) {
        unint64_t v24 = 1LL;
      }
      do
      {
        double v30 = *v25++;
        double v31 = v30;
        double v32 = *v26++;
        double v33 = v31 - v32;
        double v34 = *v27++;
        *v29++ = -(v33 + v28 * v34);
        --v24;
      }

      while (v24);
    }
  }

  return -v11;
}

void ME_Efficient_Model_Trainer::update_model_expectation(ME_Efficient_Model_Trainer *this)
{
  uint64_t v2 = (void **)((char *)this + 264);
  std::vector<double>::resize( (uint64_t)this + 264,  (int)((uint64_t)(*((void *)this + 27) - *((void *)this + 26)) >> 2));
  unint64_t v3 = *((void *)this + 27) - *((void *)this + 26);
  unint64_t v4 = v3 >> 2;
  uint64_t v5 = *((void *)this + 5);
  if (v5 == *((void *)this + 6))
  {
    double v27 = 0.0;
    int v8 = (void *)*((void *)this + 5);
    double v7 = 0.0;
  }

  else
  {
    int v6 = 0;
    double v7 = 0.0;
    int v8 = (void *)*((void *)this + 5);
    do
    {
      std::vector<double>::vector(v36, *((int *)this + 58));
      int v9 = ME_Efficient_Model_Trainer::conditional_probability((uint64_t)this, v8, v36);
      uint64_t v10 = *(int *)v8;
      double v11 = v36[0];
      double v12 = log(v36[0][v10]);
      if (v9 == (_DWORD)v10) {
        ++v6;
      }
      clock_t v14 = (int *)v8[1];
      size_t v13 = (int *)v8[2];
      if (v14 != v13)
      {
        uint64_t v15 = *((void *)this + 36);
        do
        {
          uint64_t v16 = v15 + 24LL * *v14;
          int v17 = *(int **)v16;
          if (*(void *)v16 != *(void *)(v16 + 8))
          {
            do
            {
              unsigned __int8 v18 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( (ME_Efficient_Model_Trainer *)((char *)this + 168),  *v17);
              double v11 = v36[0];
              uint64_t v19 = *v17++;
              *(double *)(*((void *)this + 33) + 8 * v19) = v36[0][v18]
                                                            + *(double *)(*((void *)this + 33) + 8 * v19);
              uint64_t v15 = *((void *)this + 36);
            }

            while (v17 != *(int **)(v15 + 24LL * *v14 + 8));
            size_t v13 = (int *)v8[2];
          }

          ++v14;
        }

        while (v14 != v13);
      }

      double v21 = (double *)v8[4];
      double v20 = (int *)v8[5];
      if (v21 != (double *)v20)
      {
        uint64_t v22 = *((void *)this + 36);
        do
        {
          uint64_t v23 = v22 + 24LL * *(int *)v21;
          unint64_t v24 = *(int **)v23;
          if (*(void *)v23 != *(void *)(v23 + 8))
          {
            do
            {
              unsigned __int8 v25 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( (ME_Efficient_Model_Trainer *)((char *)this + 168),  *v24);
              double v11 = v36[0];
              uint64_t v26 = *v24++;
              uint64_t v22 = *((void *)this + 36);
            }

            while (v24 != *(int **)(v22 + 24LL * *(int *)v21 + 8));
            double v20 = (int *)v8[5];
          }

          v21 += 2;
        }

        while (v21 != (double *)v20);
      }

      if (v11)
      {
        v36[1] = v11;
        operator delete(v11);
      }

      double v7 = v7 + v12;
      v8 += 10;
    }

    while (v8 != *((void **)this + 6));
    uint64_t v5 = *((void *)this + 5);
    unint64_t v4 = (*((void *)this + 27) - *((void *)this + 26)) >> 2;
    double v27 = (double)v6;
  }

  double v28 = (double)(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v8 - v5) >> 4));
  uint64_t v29 = v4;
  if ((int)v4 >= 1)
  {
    double v30 = (double *)*v2;
    uint64_t v31 = v4;
    do
    {
      double *v30 = *v30 / v28;
      ++v30;
      --v31;
    }

    while (v31);
  }

  *((double *)this + 42) = 1.0 - v27 / v28;
  double v32 = v7 / v28;
  double v33 = *((double *)this + 4);
  if (v33 > 0.0 && (int)v4 >= 1)
  {
    double v34 = (double *)*((void *)this + 18);
    do
    {
      double v35 = *v34++;
      double v32 = v32 + -(v35 * v35) * v33;
      --v29;
    }

    while (v29);
  }

void sub_18742A734( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model_Trainer::perform_GIS(ME_Efficient_Model_Trainer *this)
{
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x189614538], (uint64_t)"C = ", 4LL);
  uint64_t v2 = (void *)std::ostream::operator<<();
  std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)));
  unint64_t v3 = std::locale::use_facet(&v33, MEMORY[0x189614558]);
  ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10LL);
  std::locale::~locale(&v33);
  std::ostream::put();
  std::ostream::flush();
  unint64_t v4 = (void *)MEMORY[0x189614538];
  uint64_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"performing AGIS",  15LL);
  std::ios_base::getloc((const std::ios_base *)((char *)v5 + *(void *)(*v5 - 24LL)));
  int v6 = std::locale::use_facet(&v33, MEMORY[0x189614558]);
  ((void (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10LL);
  std::locale::~locale(&v33);
  std::ostream::put();
  std::ostream::flush();
  uint64_t v7 = 0LL;
  v33.__locale_ = 0LL;
  locale = 0LL;
  int v8 = (std::locale *)((char *)this + 144);
  uint64_t v9 = 1LL;
  uint64_t v35 = 0LL;
  uint64_t v10 = "iter = %2d  C = %d  f = %10.7f  train_err = %7.5f";
  double v11 = (FILE **)MEMORY[0x1895F89D0];
  double v12 = -999999.0;
  do
  {
    ME_Efficient_Model_Trainer::update_model_expectation(this);
    double v14 = v13;
    fprintf(*v11, v10, v7, v9, *(void *)&v13, *((void *)this + 42));
    if (*((void *)this + 40) != *((void *)this + 39))
    {
      double v15 = ME_Efficient_Model_Trainer::heldout_likelihood(this);
      fprintf(*v11, "  heldout_logl(err) = %f (%6.4f)", v15, *((double *)this + 43));
    }

    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(*v4 - 24LL)));
    uint64_t v16 = std::locale::use_facet(&v36, MEMORY[0x189614558]);
    ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10LL);
    std::locale::~locale(&v36);
    std::ostream::put();
    std::ostream::flush();
    if (v14 >= v12)
    {
      HIDWORD(v17) = -858993459 * v7 + 429496728;
      LODWORD(v17) = HIDWORD(v17);
      BOOL v18 = (v17 >> 1) >= 0x19999999 || (int)v9 <= 1;
      int v19 = !v18;
      if (&v33 != v8) {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)&v33,  *((char **)this + 18),  *((void *)this + 19),  (uint64_t)(*((void *)this + 19) - *((void *)this + 18)) >> 3);
      }
      uint64_t v9 = (v9 - v19);
      unint64_t v20 = *((void *)this + 27) - *((void *)this + 26);
      if ((int)(v20 >> 2) < 1)
      {
        double v12 = v14;
      }

      else
      {
        double v21 = v8;
        uint64_t v22 = v11;
        uint64_t v23 = v10;
        unint64_t v24 = (double *)*((void *)this + 30);
        unsigned __int8 v25 = (double *)*((void *)this + 33);
        uint64_t v26 = (v20 >> 2);
        double v27 = (double *)*((void *)this + 18);
        do
        {
          double v28 = *v24++;
          double v29 = v28;
          double v30 = *v25++;
          *double v27 = *v27 + log(v29 / v30) / (double)(int)v9;
          ++v27;
          --v26;
        }

        while (v26);
        double v12 = v14;
        uint64_t v10 = v23;
        double v11 = v22;
        int v8 = v21;
        unint64_t v4 = (void *)MEMORY[0x189614538];
      }
    }

    else
    {
      if (&v33 != v8) {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)v8,  (char *)v33.__locale_,  (uint64_t)locale,  (locale - v33.__locale_) >> 3);
      }
      uint64_t v9 = (v9 + 1);
      LODWORD(v7) = v7 - 1;
    }

    BOOL v18 = (int)v7 < 199;
    uint64_t v7 = (v7 + 1);
  }

  while (v18);
  std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(*v4 - 24LL)));
  uint64_t v31 = std::locale::use_facet(&v36, MEMORY[0x189614558]);
  ((void (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 10LL);
  std::locale::~locale(&v36);
  std::ostream::put();
  std::ostream::flush();
  if (v33.__locale_)
  {
    locale = v33.__locale_;
    operator delete(v33.__locale_);
  }

  return 0LL;
}

void sub_18742AAE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, std::locale a16)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

double ME_Efficient_Model_Trainer::heldout_likelihood(ME_Efficient_Model_Trainer *this)
{
  uint64_t v2 = *((void *)this + 39);
  if (v2 == *((void *)this + 40))
  {
    double v9 = 0.0;
    double v4 = 0.0;
    uint64_t v5 = (void *)*((void *)this + 39);
  }

  else
  {
    int v3 = 0;
    double v4 = 0.0;
    uint64_t v5 = (void *)*((void *)this + 39);
    do
    {
      std::vector<double>::vector(v12, *((int *)this + 58));
      int v6 = ME_Efficient_Model_Trainer::classify((uint64_t)this, v5, (uint64_t)v12);
      uint64_t v7 = *(int *)v5;
      v5 += 10;
      int v8 = (void *)v12[0];
      double v4 = v4 + log(*(double *)(v12[0] + 8 * v7));
      if (v6 == (_DWORD)v7) {
        ++v3;
      }
      v12[1] = v8;
      operator delete(v8);
    }

    while (v5 != *((void **)this + 40));
    uint64_t v2 = *((void *)this + 39);
    double v9 = (double)v3;
  }

  double v10 = (double)(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v5 - v2) >> 4));
  *((double *)this + 43) = 1.0 - v9 / v10;
  return v4 / v10;
}

void sub_18742AC1C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model_Trainer::perform_QUASI_NEWTON(ME_Efficient_Model_Trainer *this)
{
  unint64_t v2 = *((void *)this + 27) - *((void *)this + 26);
  std::vector<double>::vector(v18, (int)((uint64_t)v2 >> 2));
  uint64_t v3 = (v2 >> 2);
  if ((int)(v2 >> 2) >= 1)
  {
    double v4 = (uint64_t *)*((void *)this + 18);
    uint64_t v5 = v18[0];
    uint64_t v6 = (v2 >> 2);
    do
    {
      uint64_t v7 = *v4++;
      *v5++ = v7;
      --v6;
    }

    while (v6);
  }

  if (*((double *)this + 3) <= 0.0)
  {
    double v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"performing LBFGS",  16LL);
    std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(void *)(*v10 - 24LL)));
    double v11 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x189614558]);
    ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10LL);
    std::locale::~locale((std::locale *)__p);
    std::ostream::put();
    std::ostream::flush();
    ME_Efficient_Model_Trainer::perform_LBFGS((uint64_t)this, (uint64_t)v18, __p);
  }

  else
  {
    int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"performing OWLQN",  16LL);
    std::ios_base::getloc((const std::ios_base *)((char *)v8 + *(void *)(*v8 - 24LL)));
    double v9 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x189614558]);
    ((void (*)(const std::locale::facet *, uint64_t))v9->__vftable[2].~facet_0)(v9, 10LL);
    std::locale::~locale((std::locale *)__p);
    std::ostream::put();
    std::ostream::flush();
    ME_Efficient_Model_Trainer::perform_OWLQN((uint64_t)this, (uint64_t)v18, __p, *((double *)this + 3));
  }

  double v12 = __p[0];
  if ((int)(v2 >> 2) < 1)
  {
    if (!__p[0]) {
      goto LABEL_13;
    }
  }

  else
  {
    double v13 = (void *)*((void *)this + 18);
    double v14 = (uint64_t *)__p[0];
    do
    {
      uint64_t v15 = *v14++;
      *v13++ = v15;
      --v3;
    }

    while (v3);
  }

  operator delete(v12);
LABEL_13:
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }

  return 0LL;
}

void sub_18742AE04( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model_Trainer::conditional_probability(uint64_t a1, void *a2, double **a3)
{
  unint64_t v6 = *(int *)(a1 + 232);
  uint64_t v44 = 0LL;
  std::vector<double>::vector(&v45, v6, &v44);
  int v8 = (int *)a2[1];
  uint64_t v7 = (int *)a2[2];
  if (v8 != v7)
  {
    uint64_t v9 = *(void *)(a1 + 288);
    do
    {
      double v10 = (int **)(v9 + 24LL * *v8);
      double v11 = *v10;
      if (*v10 != v10[1])
      {
        do
        {
          uint64_t v12 = *v11;
          double v13 = *(double *)(*(void *)(a1 + 144) + 8 * v12);
          unsigned __int8 v14 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( (ME_Efficient_Model_Trainer::ME_FeatureBag *)(a1 + 168),  v12);
          v45[v14] = v13 + v45[v14];
          ++v11;
          uint64_t v9 = *(void *)(a1 + 288);
        }

        while (v11 != *(int **)(v9 + 24LL * *v8 + 8));
        uint64_t v7 = (int *)a2[2];
      }

      ++v8;
    }

    while (v8 != v7);
  }

  uint64_t v16 = (double *)a2[4];
  uint64_t v15 = (int *)a2[5];
  if (v16 != (double *)v15)
  {
    uint64_t v17 = *(void *)(a1 + 288);
    do
    {
      BOOL v18 = (int **)(v17 + 24LL * *(int *)v16);
      int v19 = *v18;
      if (*v18 != v18[1])
      {
        do
        {
          uint64_t v20 = *v19;
          double v21 = *(double *)(*(void *)(a1 + 144) + 8 * v20);
          double v22 = v16[1];
          unsigned __int8 v23 = ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( (ME_Efficient_Model_Trainer::ME_FeatureBag *)(a1 + 168),  v20);
          v45[v23] = v45[v23] + v21 * v22;
          ++v19;
          uint64_t v17 = *(void *)(a1 + 288);
        }

        while (v19 != *(int **)(v17 + 24LL * *(int *)v16 + 8));
        uint64_t v15 = (int *)a2[5];
      }

      v16 += 2;
    }

    while (v16 != (double *)v15);
  }

  unint64_t v24 = v45;
  unsigned __int8 v25 = v45 + 1;
  BOOL v26 = v45 == v46 || v25 == v46;
  double v27 = v45;
  if (!v26)
  {
    double v28 = *v45;
    double v27 = v45;
    double v29 = v45 + 1;
    do
    {
      double v30 = *v29++;
      double v31 = v30;
      if (v28 < v30)
      {
        double v28 = v31;
        double v27 = v25;
      }

      unsigned __int8 v25 = v29;
    }

    while (v29 != v46);
  }

  uint64_t v32 = *(unsigned int *)(a1 + 232);
  if ((int)v32 < 1)
  {
    uint64_t v40 = 0LL;
    if (!v45) {
      return v40;
    }
    goto LABEL_32;
  }

  double v33 = 0.0;
  double v34 = fmax(*v27 + -700.0, 0.0);
  uint64_t v35 = *a3;
  uint64_t v36 = v32;
  uint64_t v37 = v45;
  do
  {
    double v38 = exp(*v37 - v34);
    if (v38 == 0.0) {
      __assert_rtn("conditional_probability", "efficient_maxent.cpp", 140, "prod != 0");
    }
    *v35++ = v38;
    double v33 = v33 + v38;
    ++v37;
    --v36;
  }

  while (v36);
  uint64_t v39 = 0LL;
  LODWORD(v40) = 0;
  uint64_t v41 = *a3;
  do
  {
    double v42 = v41[v39] / v33;
    v41[v39] = v42;
    else {
      uint64_t v40 = v39;
    }
    ++v39;
  }

  while (v32 != v39);
  if ((v40 & 0x80000000) != 0) {
    __assert_rtn("conditional_probability", "efficient_maxent.cpp", 148, "max_label >= 0");
  }
  if (v24)
  {
LABEL_32:
    uint64_t v46 = v24;
    operator delete(v24);
  }

  return v40;
}

void sub_18742B0D4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model_Trainer::classify(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v4 = *(void *)(a3 + 8) - *(void *)a3;
  uint64_t v5 = 0LL;
  LODWORD(result) = 0;
  uint64_t v7 = (v4 >> 3);
  double v8 = 0.0;
  do
  {
    double v9 = *(double *)(*(void *)a3 + 8 * v5);
    if (v9 <= v8) {
      uint64_t result = result;
    }
    else {
      uint64_t result = v5;
    }
    if (v9 > v8) {
      double v8 = *(double *)(*(void *)a3 + 8 * v5);
    }
    ++v5;
  }

  while (v7 != v5);
  return result;
}

uint64_t ME_Efficient_Model_Trainer::make_feature_bag(ME_Efficient_Model_Trainer *this, int a2)
{
  int v19 = 1065353216;
  if (a2 <= 0)
  {
    uint64_t i = *((void *)this + 6);
  }

  else
  {
    for (uint64_t i = *((void *)this + 5); i != *((void *)this + 6); i += 80LL)
    {
      for (unsigned int j = *(unsigned int **)(i + 8); j != *(unsigned int **)(i + 16); ++j)
      {
        ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v16, *(_DWORD *)i, *j);
        unsigned int v17 = v16;
        uint64_t v20 = &v17;
        unint64_t v6 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)v18,  &v17,  (uint64_t)&std::piecewise_construct,  &v20);
        ++*((_DWORD *)v6 + 5);
      }

      for (uint64_t k = *(unsigned int **)(i + 32); k != *(unsigned int **)(i + 40); k += 4)
      {
        ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v16, *(_DWORD *)i, *k);
        unsigned int v17 = v16;
        uint64_t v20 = &v17;
        double v8 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)v18,  &v17,  (uint64_t)&std::piecewise_construct,  &v20);
        ++*((_DWORD *)v8 + 5);
      }
    }
  }

  uint64_t v9 = *((void *)this + 5);
  if (v9 == i)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    LODWORD(v10) = 0;
    do
    {
      uint64_t v12 = *(unsigned int **)(v9 + 8);
      double v11 = *(unsigned int **)(v9 + 16);
      unint64_t v13 = (unint64_t)((char *)v11 - (char *)v12) >> 2;
      else {
        uint64_t v10 = v10;
      }
      if (v11 != v12)
      {
        do
        {
          ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v17, *(_DWORD *)v9, *v12);
          if (a2 < 1
            || (unsigned int v16 = v17,
                uint64_t v20 = &v16,
                *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)v18,  &v16,  (uint64_t)&std::piecewise_construct,  &v20)
                + 5) > a2))
          {
            ME_Efficient_Model_Trainer::ME_FeatureBag::Put( (ME_Efficient_Model_Trainer *)((char *)this + 168),  (const ME_Efficient_Model_Trainer::ME_Feature *)&v17);
          }

          ++v12;
        }

        while (v12 != *(unsigned int **)(v9 + 16));
      }

      for (uint64_t m = *(unsigned int **)(v9 + 32); m != *(unsigned int **)(v9 + 40); m += 4)
      {
        ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v17, *(_DWORD *)v9, *m);
        if (a2 >= 1)
        {
          unsigned int v16 = v17;
          uint64_t v20 = &v16;
          if (*((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)v18,  &v16,  (uint64_t)&std::piecewise_construct,  &v20)
               + 5) <= a2)
            continue;
        }

        ME_Efficient_Model_Trainer::ME_FeatureBag::Put( (ME_Efficient_Model_Trainer *)((char *)this + 168),  (const ME_Efficient_Model_Trainer::ME_Feature *)&v17);
      }

      v9 += 80LL;
    }

    while (v9 != *((void *)this + 6));
  }

  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear(v18);
  ME_Efficient_Model_Trainer::init_feature2mef(this);
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)v18);
  return v10;
}

void sub_18742B3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t ME_Efficient_Model_Trainer::ME_FeatureBag::Put( ME_Efficient_Model_Trainer::ME_FeatureBag *this, const ME_Efficient_Model_Trainer::ME_Feature *a2)
{
  LODWORD(v19) = *(_DWORD *)a2;
  unint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>( this,  (unsigned int *)&v19);
  if (v4) {
    return *((unsigned int *)v4 + 5);
  }
  unint64_t v6 = (char *)*((void *)this + 5);
  uint64_t v7 = (char *)*((void *)this + 6);
  uint64_t v5 = (v7 - v6) >> 2;
  unint64_t v8 = *((void *)this + 7);
  if ((unint64_t)v7 >= v8)
  {
    unint64_t v10 = v8 - (void)v6;
    unint64_t v11 = (uint64_t)(v8 - (void)v6) >> 1;
    if (v11 <= v5 + 1) {
      unint64_t v11 = v5 + 1;
    }
    if (v10 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12)
    {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 56, v12);
      unint64_t v6 = (char *)*((void *)this + 5);
      uint64_t v7 = (char *)*((void *)this + 6);
    }

    else
    {
      unint64_t v13 = 0LL;
    }

    unsigned __int8 v14 = &v13[4 * v5];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)unsigned __int8 v14 = *(_DWORD *)a2;
    uint64_t v9 = v14 + 4;
    while (v7 != v6)
    {
      int v16 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }

    *((void *)this + 5) = v14;
    *((void *)this + 6) = v9;
    *((void *)this + 7) = v15;
    if (v6) {
      operator delete(v6);
    }
  }

  else
  {
    *(_DWORD *)uint64_t v7 = *(_DWORD *)a2;
    uint64_t v9 = v7 + 4;
  }

  *((void *)this + 6) = v9;
  unsigned int v18 = *(_DWORD *)a2;
  int v19 = &v18;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)this,  &v18,  (uint64_t)&std::piecewise_construct,  &v19)
  + 5) = v5;
  return v5;
}

uint64_t ME_Efficient_Model_Trainer::init_feature2mef(ME_Efficient_Model_Trainer *this)
{
  unint64_t v2 = (uint64_t *)((char *)this + 288);
  std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)this + 36);
  uint64_t result = nlp::BurstTrieGetCount(*((void *)this + 17));
  if (result >= 1)
  {
    for (uint64_t i = 0LL; i < result; ++i)
    {
      __p = 0LL;
      double v22 = 0LL;
      unsigned __int8 v23 = 0LL;
      if (*((int *)this + 58) >= 1)
      {
        signed int v5 = 0;
        do
        {
          ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v20, v5, i);
          unsigned int v24 = v20;
          unint64_t v6 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>( (void *)this + 21,  &v24);
          if (v6)
          {
            int v7 = *((_DWORD *)v6 + 5);
            if ((v7 & 0x80000000) == 0)
            {
              unint64_t v8 = v22;
              if (v22 >= v23)
              {
                unint64_t v10 = (char *)__p;
                uint64_t v11 = (v22 - (_BYTE *)__p) >> 2;
                unint64_t v12 = v11 + 1;
                uint64_t v13 = v23 - (_BYTE *)__p;
                if ((v23 - (_BYTE *)__p) >> 1 > v12) {
                  unint64_t v12 = v13 >> 1;
                }
                else {
                  unint64_t v14 = v12;
                }
                if (v14)
                {
                  uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v23, v14);
                  unint64_t v10 = (char *)__p;
                  unint64_t v8 = v22;
                }

                else
                {
                  uint64_t v15 = 0LL;
                }

                int v16 = &v15[4 * v11];
                *(_DWORD *)int v16 = v7;
                uint64_t v9 = v16 + 4;
                while (v8 != v10)
                {
                  int v17 = *((_DWORD *)v8 - 1);
                  v8 -= 4;
                  *((_DWORD *)v16 - 1) = v17;
                  v16 -= 4;
                }

                __p = v16;
                double v22 = v9;
                unsigned __int8 v23 = &v15[4 * v14];
                if (v10) {
                  operator delete(v10);
                }
              }

              else
              {
                *(_DWORD *)double v22 = v7;
                uint64_t v9 = v8 + 4;
              }

              double v22 = v9;
            }
          }

          ++v5;
        }

        while (v5 < *((_DWORD *)this + 58));
      }

      unint64_t v18 = *((void *)this + 37);
      if (v18 >= *((void *)this + 38))
      {
        uint64_t v19 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(v2, (uint64_t)&__p);
      }

      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>( (uint64_t)v2,  (uint64_t)&__p);
        uint64_t v19 = v18 + 24;
      }

      *((void *)this + 37) = v19;
      if (__p)
      {
        double v22 = (char *)__p;
        operator delete(__p);
      }

      uint64_t result = nlp::BurstTrieGetCount(*((void *)this + 17));
    }
  }

  return result;
}

void sub_18742B72C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    std::vector<double>::__append((char **)a1, a2 - v2);
  }

void ME_Efficient_Model_Trainer::add_training_sample(ME_Efficient_Model_Trainer *this, const ME_Sample *a2)
{
  uint64_t v44 = 0LL;
  *(_OWORD *)uint64_t v43 = 0u;
  __int128 v42 = 0u;
  *(_OWORD *)uint64_t v41 = 0u;
  *(_OWORD *)__p = 0u;
  int v39 = ME_Efficient_Model_Trainer::StringBag::Put((void *)this + 8, (unsigned __int8 *)a2);
  if (v39 >= 256)
  {
    uint64_t v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"error: too many types of labels.",  32LL);
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v37);
    exit(1);
  }

  for (uint64_t i = *((void *)a2 + 3); i != *((void *)a2 + 4); i += 24LL)
  {
    int v38 = 0;
    signed int v5 = (const char *)i;
    size_t v6 = strlen(v5);
    int v7 = v6;
    if (!nlp::BurstTrieContains(*((nlp **)this + 17), v5, v6, &v38, 0LL))
    {
      int v38 = nlp::BurstTrieGetCount(*((void *)this + 17)) + 1;
      nlp::BurstTrieAdd(*((void *)this + 17), (uint64_t)v5, v7, v38);
    }

    int v8 = v38;
    uint64_t v9 = (char *)__p[1];
    if (__p[1] >= v41[0])
    {
      uint64_t v11 = (char *)__p[0];
      int64_t v12 = ((char *)__p[1] - (char *)__p[0]) >> 2;
      unint64_t v13 = v12 + 1;
      int64_t v14 = (char *)v41[0] - (char *)__p[0];
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        int v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v41, v15);
        uint64_t v11 = (char *)__p[0];
        uint64_t v9 = (char *)__p[1];
      }

      else
      {
        int v16 = 0LL;
      }

      int v17 = (int *)&v16[4 * v12];
      *int v17 = v8;
      unint64_t v10 = v17 + 1;
      while (v9 != v11)
      {
        int v18 = *((_DWORD *)v9 - 1);
        v9 -= 4;
        *--int v17 = v18;
      }

      __p[0] = v17;
      __p[1] = v10;
      v41[0] = &v16[4 * v15];
      if (v11) {
        operator delete(v11);
      }
    }

    else
    {
      *(_DWORD *)__p[1] = v38;
      unint64_t v10 = v9 + 4;
    }

    __p[1] = v10;
  }

  for (uint64_t j = *((void *)a2 + 6); j != *((void *)a2 + 7); j += 32LL)
  {
    int v38 = -1;
    unsigned int v20 = (const char *)j;
    size_t v21 = strlen(v20);
    int v22 = v21;
    if (!nlp::BurstTrieContains(*((nlp **)this + 17), v20, v21, &v38, 0LL))
    {
      int v38 = nlp::BurstTrieGetCount(*((void *)this + 17)) + 1;
      nlp::BurstTrieAdd(*((void *)this + 17), (uint64_t)v20, v22, v38);
    }

    int v23 = v38;
    uint64_t v24 = *(void *)(j + 24);
    unsigned __int8 v25 = (void *)v42;
    if ((unint64_t)v42 >= *((void *)&v42 + 1))
    {
      double v27 = v41[1];
      uint64_t v28 = (uint64_t)(v42 - (unint64_t)v41[1]) >> 4;
      unint64_t v29 = v28 + 1;
      int64_t v30 = *((void *)&v42 + 1) - (unint64_t)v41[1];
      else {
        unint64_t v31 = v29;
      }
      if (v31)
      {
        uint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>( (uint64_t)&v42 + 8,  v31);
        double v27 = v41[1];
        unsigned __int8 v25 = (void *)v42;
      }

      else
      {
        uint64_t v32 = 0LL;
      }

      double v33 = &v32[16 * v28];
      *(_DWORD *)double v33 = v23;
      *((void *)v33 + 1) = v24;
      double v34 = v33;
      if (v25 != v27)
      {
        do
        {
          *((_OWORD *)v34 - 1) = *((_OWORD *)v25 - 1);
          v34 -= 16;
          v25 -= 2;
        }

        while (v25 != v27);
        double v27 = v41[1];
      }

      BOOL v26 = v33 + 16;
      v41[1] = v34;
      *(void *)&__int128 v42 = v33 + 16;
      *((void *)&v42 + 1) = &v32[16 * v31];
      if (v27) {
        operator delete(v27);
      }
    }

    else
    {
      *(_DWORD *)__int128 v42 = v38;
      v25[1] = v24;
      BOOL v26 = (char *)(v25 + 2);
    }

    *(void *)&__int128 v42 = v26;
  }

  unint64_t v35 = *((void *)this + 6);
  if (v35 >= *((void *)this + 7))
  {
    uint64_t v36 = std::vector<ME_Efficient_Model_Trainer::Sample>::__push_back_slow_path<ME_Efficient_Model_Trainer::Sample const&>( (uint64_t *)this + 5,  (uint64_t)&v39);
  }

  else
  {
    std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample const&>( (uint64_t)this + 56,  *((void *)this + 6),  (uint64_t)&v39);
    uint64_t v36 = v35 + 80;
    *((void *)this + 6) = v35 + 80;
  }

  *((void *)this + 6) = v36;
  if (v43[0])
  {
    v43[1] = v43[0];
    operator delete(v43[0]);
  }

  if (v41[1])
  {
    *(void **)&__int128 v42 = v41[1];
    operator delete(v41[1]);
  }

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

void sub_18742BB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  *(void *)(v3 + 48) = v4;
  ME_Efficient_Model_Trainer::Sample::~Sample((ME_Efficient_Model_Trainer::Sample *)va);
  _Unwind_Resume(a1);
}

uint64_t ME_Efficient_Model_Trainer::StringBag::Put(void *a1, unsigned __int8 *a2)
{
  uint64_t v4 = (uint64_t)(a1 + 1);
  signed int v5 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>( a1 + 1,  a2);
  if (v5) {
    return *((unsigned int *)v5 + 10);
  }
  unint64_t v8 = a1[7];
  int v7 = a1 + 6;
  uint64_t v6 = -1431655765 * ((v8 - a1[6]) >> 3);
  if (v8 >= a1[8])
  {
    uint64_t v9 = std::vector<std::string>::__push_back_slow_path<std::string const&>(v7, (__int128 *)a2);
  }

  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v7, (__int128 *)a2);
    uint64_t v9 = v8 + 24;
  }

  a1[7] = v9;
  uint64_t v11 = a2;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>( v4,  a2,  (uint64_t)&std::piecewise_construct,  (__int128 **)&v11)
  + 10) = v6;
  return v6;
}

void ME_Efficient_Model_Trainer::Sample::~Sample(ME_Efficient_Model_Trainer::Sample *this)
{
  unint64_t v2 = (void *)*((void *)this + 7);
  if (v2)
  {
    *((void *)this + 8) = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
  }

  uint64_t v4 = (void *)*((void *)this + 1);
  if (v4)
  {
    *((void *)this + 2) = v4;
    operator delete(v4);
  }

uint64_t ME_Efficient_Model_Trainer::train(ME_Efficient_Model_Trainer *this)
{
  if (*((double *)this + 3) <= 0.0 || *((double *)this + 4) <= 0.0)
  {
    uint64_t v4 = (char *)*((void *)this + 5);
    signed int v5 = (char *)*((void *)this + 6);
    if (v5 == v4)
    {
      uint64_t v59 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"error: no training data.",  24LL);
      std::ios_base::getloc((const std::ios_base *)((char *)v59 + *(void *)(*v59 - 24LL)));
      uint64_t v60 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
      ((void (*)(const std::locale::facet *, uint64_t))v60->__vftable[2].~facet_0)(v60, 10LL);
    }

    else
    {
      int v6 = *((_DWORD *)this + 88);
      if (v6 >= (int)(-858993459 * ((unint64_t)(v5 - v4) >> 4)))
      {
        int v61 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"error: too much heldout data. no training data is available.",  60LL);
        std::ios_base::getloc((const std::ios_base *)((char *)v61 + *(void *)(*v61 - 24LL)));
        uint64_t v62 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
        ((void (*)(const std::locale::facet *, uint64_t))v62->__vftable[2].~facet_0)(v62, 10LL);
      }

      else
      {
        int v7 = 0;
        do
        {
          int v9 = *(_DWORD *)v4;
          v4 += 80;
          int v8 = v9;
          if (v7 <= v9) {
            int v7 = v8;
          }
        }

        while (v4 != v5);
        *((_DWORD *)this + 58) = v7 + 1;
        if (v7 + 1 != -1431655765 * ((*((void *)this + 15) - *((void *)this + 14)) >> 3))
        {
          unint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"warning: _num_class != _label_bag.Size()",  40LL);
          std::ios_base::getloc((const std::ios_base *)((char *)v10 + *(void *)(*v10 - 24LL)));
          uint64_t v11 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
          ((void (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 10LL);
          std::locale::~locale(&v71);
          std::ostream::put();
          std::ostream::flush();
          int v6 = *((_DWORD *)this + 88);
          signed int v5 = (char *)*((void *)this + 6);
        }

        if (v6 >= 1)
        {
          int v12 = 0;
          do
          {
            uint64_t v13 = (uint64_t)(v5 - 80);
            unint64_t v14 = *((void *)this + 40);
            if (v14 >= *((void *)this + 41))
            {
              uint64_t v15 = std::vector<ME_Efficient_Model_Trainer::Sample>::__push_back_slow_path<ME_Efficient_Model_Trainer::Sample const&>( (uint64_t *)this + 39,  v13);
            }

            else
            {
              std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample const&>( (uint64_t)this + 328,  *((void *)this + 40),  v13);
              uint64_t v15 = v14 + 80;
              *((void *)this + 40) = v14 + 80;
            }

            *((void *)this + 40) = v15;
            signed int v5 = (char *)(*((void *)this + 6) - 80LL);
            std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100]((uint64_t)this + 56, v5);
            *((void *)this + 6) = v5;
            ++v12;
          }

          while (v12 < *((_DWORD *)this + 88));
        }

        int v16 = (std::vector<int> *)*((void *)this + 5);
        unint64_t v17 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((v5 - (char *)v16) >> 4));
        else {
          uint64_t v18 = v17;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,false>( v16,  (int *)v5,  (uint64_t)&v71,  v18,  1);
        if (*((double *)this + 3) > 0.0)
        {
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"L1 regularizer = ",  17LL);
          uint64_t v19 = (void *)std::ostream::operator<<();
          std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(void *)(*v19 - 24LL)));
          unsigned int v20 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
          ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10LL);
          std::locale::~locale(&v71);
          std::ostream::put();
          std::ostream::flush();
        }

        double v21 = *((double *)this + 4);
        if (v21 > 0.0)
        {
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"L2 regularizer = ",  17LL);
          int v22 = (void *)std::ostream::operator<<();
          std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(void *)(*v22 - 24LL)));
          int v23 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
          ((void (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10LL);
          std::locale::~locale(&v71);
          std::ostream::put();
          std::ostream::flush();
          double v21 = *((double *)this + 4);
        }

        unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 6) - *((void *)this + 5)) >> 4);
        *((double *)this + 3) = *((double *)this + 3) / (double)v24;
        *((double *)this + 4) = v21 / (double)v24;
        unsigned __int8 v25 = (void *)MEMORY[0x189614538];
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"preparing for estimation...",  27LL);
        ME_Efficient_Model_Trainer::make_feature_bag(this, 0);
        BOOL v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"done", 4LL);
        std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(void *)(*v26 - 24LL)));
        double v27 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
        ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10LL);
        std::locale::~locale(&v71);
        std::ostream::put();
        std::ostream::flush();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"number of samples = ",  20LL);
        uint64_t v28 = (void *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v28 + *(void *)(*v28 - 24LL)));
        unint64_t v29 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
        ((void (*)(const std::locale::facet *, uint64_t))v29->__vftable[2].~facet_0)(v29, 10LL);
        std::locale::~locale(&v71);
        std::ostream::put();
        std::ostream::flush();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"number of features = ",  21LL);
        int64_t v30 = (void *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v30 + *(void *)(*v30 - 24LL)));
        unint64_t v31 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
        ((void (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 10LL);
        std::locale::~locale(&v71);
        std::ostream::put();
        std::ostream::flush();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"calculating empirical expectation...",  36LL);
        uint64_t v32 = (void **)((char *)this + 240);
        std::vector<double>::resize( (uint64_t)this + 240,  (int)((uint64_t)(*((void *)this + 27) - *((void *)this + 26)) >> 2));
        unint64_t v33 = *((void *)this + 27) - *((void *)this + 26);
        unint64_t v34 = v33 >> 2;
        uint64_t v35 = *((void *)this + 5);
        unint64_t v36 = 0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 6) - v35) >> 4);
        if ((int)v36 >= 1)
        {
          uint64_t v37 = 0LL;
          do
          {
            uint64_t v38 = v35 + 80 * v37;
            int v39 = *(int **)(v38 + 8);
            uint64_t v40 = *(int **)(v38 + 16);
            if (v39 != v40)
            {
              uint64_t v41 = *((void *)this + 36);
              do
              {
                uint64_t v42 = v41 + 24LL * *v39;
                uint64_t v43 = *(int **)v42;
                if (*(void *)v42 != *(void *)(v42 + 8))
                {
                  do
                  {
                    if (*(_DWORD *)v38 == ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( (ME_Efficient_Model_Trainer *)((char *)this + 168),  *v43)) {
                      *((double *)*v32 + *v43) = *((double *)*v32 + *v43) + 1.0;
                    }
                    ++v43;
                    uint64_t v41 = *((void *)this + 36);
                  }

                  while (v43 != *(int **)(v41 + 24LL * *v39 + 8));
                  uint64_t v40 = *(int **)(v38 + 16);
                }

                ++v39;
              }

              while (v39 != v40);
            }

            uint64_t v44 = v35 + 80 * v37;
            uint64_t v47 = *(int **)(v44 + 40);
            uint64_t v46 = (int **)(v44 + 40);
            uint64_t v45 = v47;
            uint64_t v48 = *(v46 - 1);
            if (v48 != v47)
            {
              uint64_t v49 = *((void *)this + 36);
              do
              {
                uint64_t v50 = v49 + 24LL * *v48;
                uint64_t v51 = *(int **)v50;
                if (*(void *)v50 != *(void *)(v50 + 8))
                {
                  do
                  {
                    if (*(_DWORD *)v38 == ME_Efficient_Model_Trainer::ME_FeatureBag::Feature( (ME_Efficient_Model_Trainer *)((char *)this + 168),  *v51)) {
                      *((double *)*v32 + *v51) = *((double *)v48 + 1) + *((double *)*v32 + *v51);
                    }
                    ++v51;
                    uint64_t v49 = *((void *)this + 36);
                  }

                  while (v51 != *(int **)(v49 + 24LL * *v48 + 8));
                  uint64_t v45 = *v46;
                }

                v48 += 4;
              }

              while (v48 != v45);
            }

            ++v37;
            uint64_t v35 = *((void *)this + 5);
            unint64_t v36 = 0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 6) - v35) >> 4);
          }

          while (v37 < (int)v36);
          unint64_t v34 = (*((void *)this + 27) - *((void *)this + 26)) >> 2;
        }

        if ((int)v34 >= 1)
        {
          double v52 = (double)v36;
          uint64_t v53 = (double *)*v32;
          uint64_t v54 = v34;
          do
          {
            *uint64_t v53 = *v53 / v52;
            ++v53;
            --v54;
          }

          while (v54);
        }

        uint64_t v55 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"done",  4LL);
        std::ios_base::getloc((const std::ios_base *)((char *)v55 + *(void *)(*v55 - 24LL)));
        uint64_t v56 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
        ((void (*)(const std::locale::facet *, uint64_t))v56->__vftable[2].~facet_0)(v56, 10LL);
        std::locale::~locale(&v71);
        std::ostream::put();
        std::ostream::flush();
        uint64_t v57 = (void **)((char *)this + 144);
        std::vector<double>::resize( (uint64_t)this + 144,  (int)((uint64_t)(*((void *)this + 27) - *((void *)this + 26)) >> 2));
        unint64_t v58 = *((void *)this + 27) - *((void *)this + 26);
        if (*(_DWORD *)this == 2) {
          ME_Efficient_Model_Trainer::perform_SGD(this);
        }
        else {
          ME_Efficient_Model_Trainer::perform_QUASI_NEWTON(this);
        }
        unint64_t v63 = *((void *)this + 27) - *((void *)this + 26);
        if ((int)(v63 >> 2) >= 1)
        {
          int v64 = 0;
          uint64_t v65 = (double *)*v57;
          uint64_t v66 = (v63 >> 2);
          do
          {
            double v67 = *v65++;
            if (v67 != 0.0) {
              ++v64;
            }
            --v66;
          }

          while (v66);
        }

        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"number of active features = ",  28LL);
        double v68 = (void *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v68 + *(void *)(*v68 - 24LL)));
        double v69 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
        ((void (*)(const std::locale::facet *, uint64_t))v69->__vftable[2].~facet_0)(v69, 10LL);
      }
    }
  }

  else
  {
    unint64_t v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"error: L1 and L2 regularizers cannot be used simultaneously.",  60LL);
    std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)));
    uint64_t v3 = std::locale::use_facet(&v71, MEMORY[0x189614558]);
    ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10LL);
  }

  std::locale::~locale(&v71);
  std::ostream::put();
  std::ostream::flush();
  return 0LL;
}

void sub_18742C5B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void ME_Efficient_Model_Trainer::get_labels(void *a1, std::vector<std::string> *a2)
{
  if ((int)(-1431655765 * ((a1[15] - a1[14]) >> 3)) >= 1)
  {
    signed int v4 = 0;
    signed int v5 = (ME_Efficient_Model_Trainer::StringBag *)(a1 + 8);
    p_end_cap = (std::allocator<std::string> *)&a2->__end_cap_;
    do
    {
      ME_Efficient_Model_Trainer::StringBag::Str(v5, v4, &__p);
      std::vector<std::string>::pointer end = a2->__end_;
      value = a2->__end_cap_.__value_;
      if (end >= value)
      {
        unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)a2->__begin_) >> 3);
        unint64_t v11 = v10 + 1;
        if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)a2->__begin_) >> 3);
        if (2 * v12 > v11) {
          unint64_t v11 = 2 * v12;
        }
        if (v12 >= 0x555555555555555LL) {
          unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v13 = v11;
        }
        __v.__end_cap_.__value_ = p_end_cap;
        if (v13) {
          unint64_t v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>( (uint64_t)p_end_cap,  v13);
        }
        else {
          unint64_t v14 = 0LL;
        }
        uint64_t v15 = v14 + v10;
        __v.__first_ = v14;
        __v.__begin_ = v15;
        __v.__end_cap_.__value_ = &v14[v13];
        __int128 v16 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        v15->__r_.__value_.__l.__cap_ = __p.__r_.__value_.__l.__cap_;
        *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
        memset(&__p, 0, sizeof(__p));
        __v.__end_ = v15 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(a2, &__v);
        unint64_t v17 = a2->__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
        int size = (char)__p.__r_.__value_.__s.__size_;
        a2->__end_ = v17;
        if (size < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }

      else
      {
        __int128 v9 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        end->__r_.__value_.__l.__cap_ = __p.__r_.__value_.__l.__cap_;
        *(_OWORD *)&end->__r_.__value_.__l.__data_ = v9;
        a2->__end_ = end + 1;
      }

      ++v4;
    }

    while (v4 < (int)(-1431655765 * ((a1[15] - a1[14]) >> 3)));
  }

void sub_18742C798( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::__split_buffer<std::string> *a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ME_Efficient_Model_Trainer::StringBag::Str( ME_Efficient_Model_Trainer::StringBag *this@<X0>, signed int a2@<W1>, std::string *a3@<X8>)
{
  if (a2 < 0
    || (uint64_t v3 = *((void *)this + 6), (int)(-1431655765 * ((unint64_t)(*((void *)this + 7) - v3) >> 3)) <= a2))
  {
    ME_Efficient_Model_Trainer::StringBag::Str();
  }

  signed int v4 = (__int128 *)(v3 + 24LL * a2);
  if (*((char *)v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)v4, *((void *)v4 + 1));
  }

  else
  {
    __int128 v5 = *v4;
    a3->__r_.__value_.__l.__cap_ = *((void *)v4 + 2);
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v5;
  }

uint64_t ME_Efficient_Model_Trainer::get_feature_id( ME_Efficient_Model_Trainer *this, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = (void *)((char *)this + 168);
  ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(&v6, a2, a3);
  unsigned int v7 = v6;
  signed int v4 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>( v3,  &v7);
  if (v4) {
    return *((unsigned int *)v4 + 5);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

BOOL ME_Efficient_Model_Trainer::ignore_feature(ME_Efficient_Model_Trainer *this, int a2, double a3)
{
  double v3 = *(double *)(*((void *)this + 18) + 8LL * a2);
  return fabs(v3) < a3 || v3 == 0.0;
}

double ME_Efficient_Model_Trainer::get_feature_weight(ME_Efficient_Model_Trainer *this, int a2)
{
  return *(double *)(*((void *)this + 18) + 8LL * a2);
}

void ME_Efficient_Model_Trainer::clear(ME_Efficient_Model_Trainer *this)
{
  *((void *)this + 19) = *((void *)this + 18);
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear((void *)this + 21);
  *((void *)this + 27) = *((void *)this + 26);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear((uint64_t)this + 72);
  std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 14);
  std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)this + 36);
  *((void *)this + 31) = *((void *)this + 30);
  *((void *)this + 34) = *((void *)this + 33);
  double v3 = (void *)*((void *)this + 5);
  for (uint64_t i = (void *)*((void *)this + 6);
        i != v3;
        std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100]((uint64_t)this + 56, i))
  {
    i -= 10;
  }

  *((void *)this + 6) = v3;
  __int128 v5 = (void *)*((void *)this + 39);
  for (uint64_t j = (void *)*((void *)this + 40);
        j != v5;
        std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100]((uint64_t)this + 328, j))
  {
    j -= 10;
  }

  *((void *)this + 40) = v5;
  nlp::BurstTrieRelease(*((char **)this + 17));
}

void prune(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 384);
  double v5 = *(double *)(a1 + 392);
  memset(&v28, 0, sizeof(v28));
  ME_Efficient_Model_Trainer::get_labels((void *)a1, &v28);
  Completiouint64_t n = (const std::string::value_type *)nlp::TrieCompletionGetCompletion(a2);
  unsigned int Payload = nlp::TrieCompletionGetPayload(a2);
  if (v28.__end_ != v28.__begin_)
  {
    unsigned int v8 = Payload;
    LODWORD(v9) = 0;
    do
    {
      feature_int id = ME_Efficient_Model_Trainer::get_feature_id((ME_Efficient_Model_Trainer *)a1, v9, v8);
      uint64_t v11 = feature_id;
      if ((feature_id & 0x80000000) != 0) {
        goto LABEL_25;
      }
      double v12 = *(double *)(*(void *)(a1 + 144) + 8LL * feature_id);
      double v13 = fabs(v12);
      if (v12 == 0.0 || v13 < v5) {
        goto LABEL_25;
      }
      std::to_string(&v24, v9);
      uint64_t v15 = std::string::append(&v24, "_");
      __int128 v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v25.__r_.__value_.__l.__cap_ = v15->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v16;
      v15->__r_.__value_.__l.__size_ = 0LL;
      v15->__r_.__value_.__l.__cap_ = 0LL;
      v15->__r_.__value_.__r.__words[0] = 0LL;
      unint64_t v17 = std::string::append(&v25, Completion);
      __int128 v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
      int64_t cap = v17->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v18;
      v17->__r_.__value_.__l.__size_ = 0LL;
      v17->__r_.__value_.__l.__cap_ = 0LL;
      v17->__r_.__value_.__r.__words[0] = 0LL;
      if (cap >= 0) {
        uint64_t v19 = __p;
      }
      else {
        uint64_t v19 = (void **)__p[0];
      }
      if (cap >= 0) {
        uint64_t v20 = HIBYTE(cap);
      }
      else {
        uint64_t v20 = LODWORD(__p[1]);
      }
      float v21 = v12;
      int64_t v30 = 0LL;
      nlp::BurstTrieAddWithScore(v4, (uint64_t)v19, v20, v11, 0LL, (uint64_t)v29, v21);
      int v22 = v30;
      if (v30 == v29)
      {
        int v22 = v29;
        uint64_t v23 = 4LL;
      }

      else
      {
        if (!v30) {
          goto LABEL_23;
        }
        uint64_t v23 = 5LL;
      }

      (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_23:
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
LABEL_25:
      unint64_t v9 = (v9 + 1);
    }

    while (0xAAAAAAAAAAAAAAABLL * (((char *)v28.__end_ - (char *)v28.__begin_) >> 3) > v9);
  }

  __p[0] = &v28;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
}

void sub_18742CB84( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, char *__p, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, char a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36)
{
  std::string __p = &a30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

BOOL ME_Efficient_Model_Trainer::save_to_file(ME_Efficient_Model_Trainer *a1, uint64_t a2, double a3)
{
  else {
    unsigned int v6 = *(const char **)a2;
  }
  uint64_t v7 = open(v6, 1538, 384LL);
  if ((v7 & 0x80000000) == 0) {
    return ME_Efficient_Model_Trainer::save_to_file_descriptor(a1, v7, a3);
  }
  unint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"error: cannot open ",  19LL);
  int v10 = *(char *)(a2 + 23);
  if (v10 >= 0) {
    uint64_t v11 = a2;
  }
  else {
    uint64_t v11 = *(void *)a2;
  }
  if (v10 >= 0) {
    uint64_t v12 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v12 = *(void *)(a2 + 8);
  }
  double v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  unint64_t v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"!", 1LL);
  std::ios_base::getloc((const std::ios_base *)((char *)v14 + *(void *)(*v14 - 24LL)));
  uint64_t v15 = std::locale::use_facet(&v16, MEMORY[0x189614558]);
  ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 10LL);
  std::locale::~locale(&v16);
  std::ostream::put();
  std::ostream::flush();
  return 0LL;
}

void sub_18742CD3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

BOOL ME_Efficient_Model_Trainer::save_to_file_descriptor( ME_Efficient_Model_Trainer *this, uint64_t __fd, double a3)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if ((__fd & 0x80000000) != 0) {
    return 0LL;
  }
  int v31 = 0;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  uint64_t __buf = 0x200C0FFEELL;
  ssize_t v6 = pwrite(__fd, &__buf, 0x3CuLL, 0LL);
  unsigned int v7 = -1431655765 * ((*((void *)this + 15) - *((void *)this + 14)) >> 3);
  *(void *)&__int128 v28 = __PAIR64__(v7, v6);
  if (v7)
  {
    unsigned int v8 = 0;
    do
    {
      ME_Efficient_Model_Trainer::StringBag::Str((ME_Efficient_Model_Trainer *)((char *)this + 64), v8, __p);
      if ((__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unint64_t v9 = __p;
      }
      else {
        unint64_t v9 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
      }
      if ((__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
        size_t size = __p[0].__r_.__value_.__s.__size_;
      }
      else {
        size_t size = __p[0].__r_.__value_.__l.__size_;
      }
      off_t v11 = pwrite(__fd, v9, size, v6) + v6;
      ssize_t v12 = pwrite(__fd, "\n", 1uLL, v11);
      ssize_t v6 = v12 + v11;
      ++v8;
    }

    while (v8 < DWORD1(v28));
  }

  nlp::BurstTrieCreateMutableWithOptions(64, 1);
  unint64_t v14 = v13;
  ME_Efficient_Model_Trainer::ME_Efficient_Model_Trainer((ME_Efficient_Model_Trainer *)__p, this);
  std::string v25 = v14;
  double v26 = a3;
  uint64_t v15 = (nlp *)*((void *)this + 17);
  v33[0] = off_18A04E9D8;
  v33[1] = prune;
  unint64_t v34 = v33;
  nlp::BurstTrieSearch(v15, "", 0LL, (uint64_t)__p, (uint64_t)v33, -1);
  std::locale v16 = v34;
  if (v34 == v33)
  {
    uint64_t v17 = 4LL;
    std::locale v16 = v33;
    goto LABEL_18;
  }

  if (v34)
  {
    uint64_t v17 = 5LL;
LABEL_18:
    (*(void (**)(void))(*v16 + 8 * v17))();
  }

  int v23 = 0;
  int v19 = nlp::BurstTrieWriteToFileDescriptor((uint64_t)v14, __fd, &v23);
  BOOL v18 = v19 != 0;
  if (v19)
  {
    LODWORD(v29) = v23;
    DWORD1(v29) = lseek(__fd, 0LL, 2);
    pwrite(__fd, &__buf, 0x3CuLL, 0LL);
    close(__fd);
    nlp::BurstTrieRelease(v14);
  }

  else
  {
    uint64_t v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"error: could not write out features!",  36LL);
    std::ios_base::getloc((const std::ios_base *)((char *)v20 + *(void *)(*v20 - 24LL)));
    float v21 = std::locale::use_facet(&v32, MEMORY[0x189614558]);
    ((void (*)(const std::locale::facet *, uint64_t))v21->__vftable[2].~facet_0)(v21, 10LL);
    std::locale::~locale(&v32);
    std::ostream::put();
    std::ostream::flush();
    nlp::BurstTrieRelease(v14);
    close(__fd);
  }

  ME_Efficient_Model_Trainer::~ME_Efficient_Model_Trainer((ME_Efficient_Model_Trainer *)__p);
  return v18;
}

void sub_18742D044( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

void ME_Efficient_Model::~ME_Efficient_Model(ME_Efficient_Model *this)
{
  unint64_t v2 = (char *)*((void *)this + 3);
  if (v2) {
    nlp::BurstTrieRelease(v2);
  }
  if (*((_BYTE *)this + 48))
  {
    size_t v4 = *((void *)this + 4);
    double v3 = (void *)*((void *)this + 5);
    if (v4 && v3) {
      munmap(v3, v4);
    }
    else {
      free(v3);
    }
  }

  double v5 = (void **)this;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v5);
}

uint64_t ME_Efficient_Model::num_classes(ME_Efficient_Model *this)
{
  uint64_t v1 = *((void *)this + 5);
  if (v1) {
    return *(unsigned int *)(v1 + 12);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

char *ME_Efficient_Model::get_class_label(ME_Efficient_Model *this, unsigned int a2)
{
  uint64_t result = 0LL;
  if ((a2 & 0x80000000) == 0)
  {
    double v5 = this;
    uint64_t v4 = *(void *)this;
    uint64_t v6 = *((void *)v5 + 1) - v4;
    if (v6)
    {
      if (0xAAAAAAAAAAAAAAABLL * (v6 >> 3) <= a2)
      {
        return 0LL;
      }

      else
      {
        uint64_t result = (char *)(v4 + 24LL * a2);
        if (result[23] < 0) {
          return *(char **)result;
        }
      }
    }
  }

  return result;
}

uint64_t ME_Efficient_Model::get_class_id(uint64_t *a1, unsigned __int8 **a2)
{
  return -1431655765
       * ((unint64_t)(std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>( *a1,  a1[1],  a2)
                                         - *a1) >> 3);
}

uint64_t ME_Efficient_Model::load_from_file(uint64_t a1, uint64_t a2, char a3)
{
  else {
    uint64_t v6 = *(const char **)a2;
  }
  if (!stat(v6, &v24))
  {
    else {
      uint64_t v16 = *(const char **)a2;
    }
    int v17 = open(v16, 0);
    if (v17 < 0)
    {
      unsigned int v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"error: cannot open ",  19LL);
      int v22 = *(char *)(a2 + 23);
      if (v22 >= 0) {
        uint64_t v9 = a2;
      }
      else {
        uint64_t v9 = *(void *)a2;
      }
      if (v22 >= 0) {
        uint64_t v10 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        uint64_t v10 = *(void *)(a2 + 8);
      }
      goto LABEL_11;
    }

    int v18 = v17;
    st_size_t size = v24.st_size;
    if ((a3 & 1) != 0)
    {
      *(void *)(a1 + 32) = v24.st_size;
      uint64_t v20 = (const char *)mmap(0LL, st_size, 1, 1, v17, 0LL);
      *(void *)(a1 + 40) = v20;
      if (!v20)
      {
LABEL_23:
        *(void *)(a1 + 32) = 0LL;
        *(void *)(a1 + 40) = 0LL;
LABEL_34:
        close(v18);
        return 0LL;
      }

      if (!ME_Efficient_Model::load_with_bytes((ME_Efficient_Model *)a1, v20))
      {
        float v21 = *(void **)(a1 + 40);
        if (v21) {
          munmap(v21, st_size);
        }
        goto LABEL_23;
      }
    }

    else
    {
      int v23 = malloc(v24.st_size);
      *(void *)(a1 + 40) = v23;
      if (st_size != read(v18, v23, st_size)
        || !ME_Efficient_Model::load_with_bytes((ME_Efficient_Model *)a1, *(const char **)(a1 + 40)))
      {
        free(*(void **)(a1 + 40));
        *(void *)(a1 + 40) = 0LL;
        goto LABEL_34;
      }
    }

    uint64_t v14 = 1LL;
    *(_BYTE *)(a1 + 48) = 1;
    close(v18);
    return v14;
  }

  unsigned int v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( MEMORY[0x189614538],  (uint64_t)"error: cannot open ",  19LL);
  int v8 = *(char *)(a2 + 23);
  if (v8 >= 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = *(void *)a2;
  }
  if (v8 >= 0) {
    uint64_t v10 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v10 = *(void *)(a2 + 8);
  }
LABEL_11:
  off_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, v9, v10);
  ssize_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"!", 1LL);
  std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(void *)(*v12 - 24LL)));
  double v13 = std::locale::use_facet(&v25, MEMORY[0x189614558]);
  ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10LL);
  std::locale::~locale(&v25);
  std::ostream::put();
  std::ostream::flush();
  return 0LL;
}

void sub_18742D434(_Unwind_Exception *a1)
{
}

BOOL ME_Efficient_Model::load_with_bytes(ME_Efficient_Model *this, const char *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  *((void *)this + 5) = a2;
  if (!a2 || *(_DWORD *)a2 != 12648430 || *((_DWORD *)a2 + 1) != 2) {
    return 0LL;
  }
  int v4 = 0;
  unsigned int v5 = 0;
  *((void *)this + 4) = *((unsigned int *)a2 + 7);
  do
  {
    if (v5 >= *((_DWORD *)a2 + 3)) {
      break;
    }
    uint64_t v6 = *((unsigned int *)a2 + 2);
    int v7 = v4;
    int v8 = a2[v6 + v4];
    if (v8 == 10)
    {
      LODWORD(v9) = 0;
    }

    else
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = &a2[v6 + 1 + v4];
      do
      {
        __s[v9] = v8;
        int v8 = v10[v9++];
      }

      while (v8 != 10);
      int v7 = v4 + v9;
    }

    int v4 = v7 + 1;
    __s[v9] = 0;
    std::string::basic_string[abi:ne180100]<0>(__p, __s);
    unint64_t v11 = *((void *)this + 1);
    if (v11 >= *((void *)this + 2))
    {
      uint64_t v13 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)this, (__int128 *)__p);
    }

    else
    {
      if (SHIBYTE(v19) < 0)
      {
        std::string::__init_copy_ctor_external( *((std::string **)this + 1),  (const std::string::value_type *)__p[0],  (std::string::size_type)__p[1]);
      }

      else
      {
        __int128 v12 = *(_OWORD *)__p;
        *(void *)(v11 + 16) = v19;
        *(_OWORD *)unint64_t v11 = v12;
      }

      uint64_t v13 = v11 + 24;
      *((void *)this + 1) = v11 + 24;
    }

    *((void *)this + 1) = v13;
    __s[0] = 0;
    unsigned int v14 = *((_DWORD *)a2 + 3);
    if (SHIBYTE(v19) < 0) {
      operator delete(__p[0]);
    }
    ++v5;
  }

  while (v5 < v14);
  uint64_t v15 = nlp::BurstTrieCreateWithBytes((nlp *)(*((void *)this + 5) + *((unsigned int *)a2 + 6)), a2);
  *((void *)this + 3) = v15;
  return *((void *)this + 1) != *(void *)this && v15 != 0LL;
}

void sub_18742D5F8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  *(void *)(v14 + 8) = v15;
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Efficient_Model::conditional_probability(uint64_t a1, double **a2, uint64_t *a3)
{
  unsigned int v5 = *a2;
  int v4 = a2[1];
  uint64_t v6 = (uint64_t)(*a2 + 1);
  BOOL v7 = *a2 == v4 || v6 == (void)v4;
  int v8 = *a2;
  if (!v7)
  {
    double v9 = *v5;
    int v8 = *a2;
    uint64_t v10 = *a2 + 1;
    do
    {
      double v11 = *v10++;
      double v12 = v11;
      if (v9 < v11)
      {
        double v9 = v12;
        int v8 = (double *)v6;
      }

      uint64_t v6 = (uint64_t)v10;
    }

    while (v10 != v4);
  }

  uint64_t v13 = 0LL;
  double v14 = 0.0;
  double v15 = fmax(*v8 + -700.0, 0.0);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *a3;
  if (!v16) {
    goto LABEL_11;
  }
LABEL_10:
  for (int i = *(_DWORD *)(v16 + 12); v13 < i; int i = -1)
  {
    double v19 = exp(v5[v13] - v15);
    if (v19 == 0.0) {
      ME_Efficient_Model::conditional_probability();
    }
    *(double *)(v17 + 8 * v13) = v19;
    double v14 = v14 + v19;
    ++v13;
    if (v16) {
      goto LABEL_10;
    }
LABEL_11:
    ;
  }

  uint64_t v20 = 0LL;
  uint64_t result = 0LL;
  uint64_t v22 = *a3;
  if (!v16) {
    goto LABEL_18;
  }
LABEL_17:
  for (int j = *(_DWORD *)(v16 + 12); v20 < j; int j = -1)
  {
    double v24 = *(double *)(v22 + 8 * v20) / v14;
    *(double *)(v22 + 8 * v20) = v24;
    else {
      uint64_t result = v20;
    }
    ++v20;
    if (v16) {
      goto LABEL_17;
    }
LABEL_18:
    ;
  }

  if ((result & 0x80000000) != 0) {
    ME_Efficient_Model::conditional_probability();
  }
  return result;
}

uint64_t ME_Efficient_Model::classify(uint64_t a1, double **a2, uint64_t *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    int v5 = *(_DWORD *)(v4 + 12);
  }
  else {
    int v5 = -1;
  }
  ME_Efficient_Model::conditional_probability(a1, a2, a3);
  unint64_t v6 = a3[1] - *a3;
  uint64_t v7 = 0LL;
  LODWORD(result) = 0;
  uint64_t v9 = (v6 >> 3);
  double v10 = 0.0;
  do
  {
    double v11 = *(double *)(*a3 + 8 * v7);
    if (v11 <= v10) {
      uint64_t result = result;
    }
    else {
      uint64_t result = v7;
    }
    if (v11 > v10) {
      double v10 = *(double *)(*a3 + 8 * v7);
    }
    ++v7;
  }

  while (v9 != v7);
  return result;
}

void ME_Efficient_Model::classify( ME_Efficient_Model *this@<X0>, ME_Sample *a2@<X1>, unsigned int *a3@<X2>, uint64_t *a4@<X8>)
{
  if (!*((void *)this + 3))
  {
    *a4 = 0LL;
    a4[1] = 0LL;
    a4[2] = 0LL;
    return;
  }

  uint64_t v8 = *((void *)this + 5);
  if (v8) {
    int v9 = *(_DWORD *)(v8 + 12);
  }
  else {
    int v9 = -1;
  }
  __p[0] = 0LL;
  std::vector<double>::vector(v44, v9, __p);
  for (uint64_t i = *((void *)a2 + 3); i != *((void *)a2 + 4); i += 24LL)
  {
    for (uint64_t j = 0LL; ; ++j)
    {
      uint64_t v12 = *((void *)this + 5);
      int v13 = v12 ? *(_DWORD *)(v12 + 12) : -1;
      if (j >= v13) {
        break;
      }
      std::to_string(&v40, j);
      double v14 = std::string::append(&v40, "_");
      __int128 v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
      v41.__r_.__value_.__l.__cap_ = v14->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v15;
      v14->__r_.__value_.__l.__size_ = 0LL;
      v14->__r_.__value_.__l.__cap_ = 0LL;
      v14->__r_.__value_.__r.__words[0] = 0LL;
      int v16 = *(char *)(i + 23);
      if (v16 >= 0) {
        uint64_t v17 = (const std::string::value_type *)i;
      }
      else {
        uint64_t v17 = *(const std::string::value_type **)i;
      }
      if (v16 >= 0) {
        std::string::size_type v18 = *(unsigned __int8 *)(i + 23);
      }
      else {
        std::string::size_type v18 = *(void *)(i + 8);
      }
      double v19 = std::string::append(&v41, v17, v18);
      __int128 v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
      int64_t cap = v19->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v20;
      v19->__r_.__value_.__l.__size_ = 0LL;
      v19->__r_.__value_.__l.__cap_ = 0LL;
      v19->__r_.__value_.__r.__words[0] = 0LL;
      LODWORD(v41.__r_.__value_.__l.__data_) = 0;
      LODWORD(v40.__r_.__value_.__l.__data_) = 0;
      if (cap >= 0) {
        uint64_t v21 = __p;
      }
      else {
        uint64_t v21 = (void **)__p[0];
      }
      if (cap >= 0) {
        uint64_t v22 = HIBYTE(cap);
      }
      else {
        uint64_t v22 = LODWORD(__p[1]);
      }
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
    }
  }

  uint64_t v23 = *((void *)a2 + 6);
  if (v23 != *((void *)a2 + 7))
  {
    do
    {
      for (uint64_t k = 0LL; ; ++k)
      {
        uint64_t v25 = *((void *)this + 5);
        int v26 = v25 ? *(_DWORD *)(v25 + 12) : -1;
        if (k >= v26) {
          break;
        }
        std::to_string(&v40, k);
        double v27 = std::string::append(&v40, "_");
        __int128 v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
        v41.__r_.__value_.__l.__cap_ = v27->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v28;
        v27->__r_.__value_.__l.__size_ = 0LL;
        v27->__r_.__value_.__l.__cap_ = 0LL;
        v27->__r_.__value_.__r.__words[0] = 0LL;
        int v29 = *(char *)(v23 + 23);
        if (v29 >= 0) {
          __int128 v30 = (const std::string::value_type *)v23;
        }
        else {
          __int128 v30 = *(const std::string::value_type **)v23;
        }
        if (v29 >= 0) {
          std::string::size_type v31 = *(unsigned __int8 *)(v23 + 23);
        }
        else {
          std::string::size_type v31 = *(void *)(v23 + 8);
        }
        std::locale v32 = std::string::append(&v41, v30, v31);
        __int128 v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
        int64_t cap = v32->__r_.__value_.__l.__cap_;
        *(_OWORD *)std::string __p = v33;
        v32->__r_.__value_.__l.__size_ = 0LL;
        v32->__r_.__value_.__l.__cap_ = 0LL;
        v32->__r_.__value_.__r.__words[0] = 0LL;
        LODWORD(v41.__r_.__value_.__l.__data_) = 0;
        LODWORD(v40.__r_.__value_.__l.__data_) = 0;
        if (cap >= 0) {
          unint64_t v34 = __p;
        }
        else {
          unint64_t v34 = (void **)__p[0];
        }
        if (cap >= 0) {
          uint64_t v35 = HIBYTE(cap);
        }
        else {
          uint64_t v35 = LODWORD(__p[1]);
        }
        if (nlp::BurstTrieContains(*((nlp **)this + 3), v34, v35, &v41, &v40)) {
          *((double *)v44[0] + k) = *(double *)(v23 + 24)
        }
                                  + *(float *)&v40.__r_.__value_.__l.__data_
                                  + *((double *)v44[0] + k);
        if (SHIBYTE(cap) < 0) {
          operator delete(__p[0]);
        }
      }

      v23 += 32LL;
    }

    while (v23 != *((void *)a2 + 7));
    if (v25) {
      goto LABEL_63;
    }
LABEL_65:
    unint64_t v36 = -1LL;
    goto LABEL_66;
  }

  uint64_t v25 = *((void *)this + 5);
  if (!v25) {
    goto LABEL_65;
  }
LABEL_63:
  unint64_t v36 = *(int *)(v25 + 12);
LABEL_66:
  std::vector<double>::vector(a4, v36);
  unsigned int v37 = ME_Efficient_Model::classify((uint64_t)this, (double **)v44, a4);
  if (a3) {
    *a3 = v37;
  }
  uint64_t v38 = 0LL;
  if ((v37 & 0x80000000) == 0)
  {
    uint64_t v39 = *((void *)this + 1) - *(void *)this;
    if (v39)
    {
      if (0xAAAAAAAAAAAAAAABLL * (v39 >> 3) <= v37)
      {
        uint64_t v38 = 0LL;
      }

      else
      {
        uint64_t v38 = *(void *)this + 24LL * v37;
      }
    }
  }

  MEMORY[0x1895A4A74](a2, v38);
  if (v44[0])
  {
    v44[1] = v44[0];
    operator delete(v44[0]);
  }

void sub_18742DB84( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, void *__p, uint64_t a30)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table( uint64_t a1)
{
  unint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node( int a1, void **__p)
{
  if (__p)
  {
    unint64_t v2 = __p;
    do
    {
      double v3 = (void **)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
    }

    while (v3);
  }

_DWORD *ME_Efficient_Model_Trainer::ME_Feature::ME_Feature(_DWORD *this, unsigned int a2, unsigned int a3)
{
  *this = a2 + (a3 << 8);
  if (a2 >= 0x100) {
    ME_Efficient_Model_Trainer::ME_Feature::ME_Feature();
  }
  if (HIBYTE(a3)) {
    ME_Efficient_Model_Trainer::ME_Feature::ME_Feature();
  }
  return this;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>( void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }

  unint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3) {
        return result;
      }
    }

    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }

      else
      {
        v8 &= *(void *)&v2 - 1LL;
      }

      if (v8 != v5) {
        return 0LL;
      }
    }
  }

  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>( void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  double v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  double v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }

        else
        {
          v13 &= *(void *)&v5 - 1LL;
        }

        if (v13 != v9) {
          return 0LL;
        }
      }

      double v11 = *(unsigned __int8 **)v11;
    }

    while (v11);
  }

  return v11;
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }

  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }

  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]( uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69LL
          * (v6 ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69LL * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297LL * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      uint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0LL);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273LL * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273LL * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64LL;
      }

      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297LL
          * ((0x9DDFEA08EB382D69LL
            * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69LL * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69LL
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297LL
                  * ((0x9DDFEA08EB382D69LL
                    * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69LL * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }

    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }

  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }

  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100]( _DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }

    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69LL * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }

  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL
            * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }

  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100]( void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273LL * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (v5 ^ (v4 - 0x3C5A37A36834CED9LL * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69LL
       * ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100]( void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9LL * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127LL * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1LL
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100]( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0LL;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1LL;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }

  while (v9 == v11 && v14);
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>( uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  uint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }

    BOOL v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }

          else
          {
            v16 &= v11 - 1;
          }

          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>( a1,  v10,  a4,  (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1LL;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>( a1,  v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }

  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *uint64_t v23 = v26[0];
  }

  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8LL);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }

      else
      {
        v24 &= v11 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }

  uint64_t i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_18742E628( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]( (uint64_t)&a13,  __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>( uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(void *)uint64_t v8 = 0LL;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }

  else
  {
    __int128 v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }

  *((_DWORD *)v8 + 10) = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_18742E6D8(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]( v3,  v2);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external( std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8LL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__l.__cap_ = v7 | 0x8000000000000000LL;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }

  else
  {
    this->__r_.__value_.__s.__size_ = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>( uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__do_rehash<true>( a1,  prime);
  }

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__do_rehash<true>( uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      __int128 v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            *uint64_t v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            __int128 v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          __int128 v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]( uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear( uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node( a1,  *(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0LL;
    }

    *(void *)(a1 + 24) = 0LL;
  }

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

void ME_Efficient_Model_Trainer::ME_Efficient_Model_Trainer( ME_Efficient_Model_Trainer *this, const ME_Efficient_Model_Trainer *a2)
{
  *((void *)this + 5) = 0LL;
  *((void *)this + 6) = 0LL;
  *((void *)this + 7) = 0LL;
  std::vector<ME_Efficient_Model_Trainer::Sample>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>( (void *)this + 5,  *((void *)a2 + 5),  *((void *)a2 + 6),  0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a2 + 6) - *((void *)a2 + 5)) >> 4));
  *((_DWORD *)this + 16) = *((_DWORD *)a2 + 16);
  std::unordered_map<std::string,int>::unordered_map((uint64_t)this + 72, (uint64_t)a2 + 72);
  *((void *)this + 14) = 0LL;
  *((void *)this + 15) = 0LL;
  *((void *)this + 16) = 0LL;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>( (std::string *)((char *)this + 112),  *((__int128 **)a2 + 14),  *((__int128 **)a2 + 15),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 15) - *((void *)a2 + 14)) >> 3));
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( (void *)this + 18,  *((const void **)a2 + 18),  *((void *)a2 + 19),  (uint64_t)(*((void *)a2 + 19) - *((void *)a2 + 18)) >> 3);
  std::unordered_map<unsigned int,int>::unordered_map((uint64_t)this + 168, (uint64_t)a2 + 168);
  *((void *)this + 26) = 0LL;
  *((void *)this + 27) = 0LL;
  *((void *)this + 28) = 0LL;
  std::vector<ME_Efficient_Model_Trainer::ME_Feature>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::ME_Feature*,ME_Efficient_Model_Trainer::ME_Feature*>( (void *)this + 26,  *((const void **)a2 + 26),  *((void *)a2 + 27),  (uint64_t)(*((void *)a2 + 27) - *((void *)a2 + 26)) >> 2);
  int v4 = *((_DWORD *)a2 + 58);
  *((void *)this + 30) = 0LL;
  *((_DWORD *)this + 58) = v4;
  *((void *)this + 31) = 0LL;
  *((void *)this + 32) = 0LL;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( (void *)this + 30,  *((const void **)a2 + 30),  *((void *)a2 + 31),  (uint64_t)(*((void *)a2 + 31) - *((void *)a2 + 30)) >> 3);
  *((void *)this + 33) = 0LL;
  *((void *)this + 34) = 0LL;
  *((void *)this + 35) = 0LL;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( (void *)this + 33,  *((const void **)a2 + 33),  *((void *)a2 + 34),  (uint64_t)(*((void *)a2 + 34) - *((void *)a2 + 33)) >> 3);
  *((void *)this + 36) = 0LL;
  *((void *)this + 37) = 0LL;
  *((void *)this + 38) = 0LL;
  std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>( (void *)this + 36,  *((void *)a2 + 36),  *((void *)a2 + 37),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 37) - *((void *)a2 + 36)) >> 3));
  *((void *)this + 39) = 0LL;
  *((void *)this + 40) = 0LL;
  *((void *)this + 41) = 0LL;
  std::vector<ME_Efficient_Model_Trainer::Sample>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>( (void *)this + 39,  *((void *)a2 + 39),  *((void *)a2 + 40),  0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a2 + 40) - *((void *)a2 + 39)) >> 4));
  *((_OWORD *)this + 21) = *((_OWORD *)a2 + 21);
  *((void *)this + 44) = *((void *)a2 + 44);
  *((void *)this + 46) = 0LL;
  *((void *)this + 47) = 0LL;
  *((void *)this + 45) = 0LL;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( (void *)this + 45,  *((const void **)a2 + 45),  *((void *)a2 + 46),  (uint64_t)(*((void *)a2 + 46) - *((void *)a2 + 45)) >> 3);
  *((void *)this + 17) = nlp::BurstTrieRetain(*((void *)a2 + 17));
}

void sub_18742EC90(_Unwind_Exception *a1, void **a2, ...)
{
  uint8x8_t v9 = *v4;
  if (*v4)
  {
    v2[46] = v9;
    operator delete(v9);
  }

  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  unint64_t v10 = *v7;
  if (*v7)
  {
    v2[34] = v10;
    operator delete(v10);
  }

  __int128 v11 = *v6;
  if (*v6)
  {
    v2[31] = v11;
    operator delete(v11);
  }

  ME_Efficient_Model_Trainer::ME_FeatureBag::~ME_FeatureBag(v5);
  unint64_t v12 = *a2;
  if (*a2)
  {
    v2[19] = v12;
    operator delete(v12);
  }

  ME_Efficient_Model_Trainer::StringBag::~StringBag(v3);
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void sub_18742ED5C()
{
}

void sub_18742ED6C()
{
}

void *std::vector<ME_Efficient_Model_Trainer::Sample>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>( void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<ME_Efficient_Model_Trainer::Sample>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>( (uint64_t)(v6 + 2),  a2,  a3,  v6[1]);
    v6[1] = result;
  }

  return result;
}

void sub_18742EDD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<ME_Efficient_Model_Trainer::Sample>::__vallocate[abi:ne180100]( void *a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334LL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>>( (uint64_t)(a1 + 2),  a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[80 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>>( uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334LL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(80 * a2);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*,ME_Efficient_Model_Trainer::Sample*>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v11 = a4;
  uint64_t v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  void v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample&>( a1,  v4,  v6);
      v6 += 80LL;
      uint64_t v4 = v12 + 80;
      v12 += 80LL;
    }

    while (v6 != a3);
  }

  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_18742EF20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample&>( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = *(_DWORD *)a3;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>( (void *)(a2 + 8),  *(const void **)(a3 + 8),  *(void *)(a3 + 16),  (uint64_t)(*(void *)(a3 + 16) - *(void *)(a3 + 8)) >> 2);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 48) = 0LL;
  std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>( (char *)(a2 + 32),  *(__int128 **)(a3 + 32),  *(__int128 **)(a3 + 40),  (uint64_t)(*(void *)(a3 + 40) - *(void *)(a3 + 32)) >> 4);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  return std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( (void *)(a2 + 56),  *(const void **)(a3 + 56),  *(void *)(a3 + 64),  (uint64_t)(*(void *)(a3 + 64) - *(void *)(a3 + 56)) >> 3);
}

void sub_18742EFC0(_Unwind_Exception *exception_object)
{
  unint64_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 40) = v5;
    operator delete(v5);
  }

  uint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v6;
    operator delete(v6);
  }

  _Unwind_Resume(exception_object);
}

void *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>( void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_18742F050(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>( char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<std::pair<int,double>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      __int128 v8 = *a2++;
      *v7++ = v8;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_18742F0C0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<int,double>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,ME_Efficient_Model_Trainer::Sample*>::operator()[abi:ne180100]( uint64_t *a1)
{
  uint64_t v2 = (void *)a1[1];
  uint64_t v1 = (void **)a1[2];
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)*v2;
  if (*v1 != (void *)*v2)
  {
    uint64_t v5 = *a1;
    do
    {
      v3 -= 10;
      std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100](v5, v3);
    }

    while (v3 != v4);
  }

void std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100](uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[7];
  if (v3)
  {
    a2[8] = v3;
    operator delete(v3);
  }

  uint64_t v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = v4;
    operator delete(v4);
  }

  uint64_t v5 = (void *)a2[1];
  if (v5)
  {
    a2[2] = v5;
    operator delete(v5);
  }

void std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 10;
        std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }

      while (v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

uint64_t std::unordered_map<std::string,int>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>( a1,  *(void *)(a2 + 8));
  for (uint64_t i = *(unsigned __int8 **)(a2 + 16); i; uint64_t i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,int> const&>( a1,  i + 16,  (uint64_t)(i + 16));
  return a1;
}

void sub_18742F308(_Unwind_Exception *a1)
{
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,int> const&>( uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }

    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }

    unint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }

          else
          {
            v15 &= v10 - 1;
          }

          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::pair<std::string const,int> const&>( a1,  v9,  a3,  (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1LL;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>( a1,  v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }

    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }

  size_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    *size_t v22 = v25[0];
  }

  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8LL);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }

      else
      {
        v23 &= v10 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }

  uint64_t i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_18742F578( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]( (uint64_t)&a11,  __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::pair<std::string const,int> const&>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0LL;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v8 + 4) = *(void *)(a3 + 16);
  }

  *((_DWORD *)v8 + 10) = *(_DWORD *)(a3 + 24);
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_18742F628(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]( v3,  v2);
  _Unwind_Resume(a1);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>( std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>( (uint64_t)&v6->__r_.__value_.__l.__cap_,  a2,  a3,  (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }

  return result;
}

void sub_18742F6A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>( uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  uint64_t v4 = this;
  uint8x8_t v11 = this;
  unint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  void v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }

      else
      {
        __int128 v7 = *v6;
        v4->__r_.__value_.__l.__cap_ = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }

      uint64_t v6 = (__int128 *)((char *)v6 + 24);
      unint64_t v12 = ++v4;
    }

    while (v6 != a3);
  }

  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_18742F804( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 24LL;
  }

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }

uint64_t std::unordered_map<unsigned int,int>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>( a1,  *(void *)(a2 + 8));
  for (uint64_t i = *(unsigned int **)(a2 + 16); i; uint64_t i = *(unsigned int **)i)
    std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,int> const&>( a1,  i + 4,  (void *)i + 2);
  return a1;
}

void sub_18742F92C(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,int> const&>( uint64_t a1, unsigned int *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }

    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      char v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          char v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  char v10 = operator new(0x18uLL);
  *char v10 = 0LL;
  v10[1] = v6;
  v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>( a1,  v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *char v10 = *v19;
LABEL_38:
    *unint64_t v19 = v10;
    goto LABEL_39;
  }

  *char v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

  ++*(void *)(a1 + 24);
  return v11;
}

void sub_18742FB4C(_Unwind_Exception *a1)
{
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *std::vector<ME_Efficient_Model_Trainer::ME_Feature>::__init_with_size[abi:ne180100]<ME_Efficient_Model_Trainer::ME_Feature*,ME_Efficient_Model_Trainer::ME_Feature*>( void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_18742FC04(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void *std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>( void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int>*,std::vector<int>*,std::vector<int>*>( (uint64_t)(v6 + 2),  a2,  a3,  (void *)v6[1]);
    v6[1] = result;
  }

  return result;
}

void sub_18742FC84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int>*,std::vector<int>*,std::vector<int>*>( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  unint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  void v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0LL;
      v4[1] = 0LL;
      v4[2] = 0LL;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>( v4,  *(const void **)v6,  *(void *)(v6 + 8),  (uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 2);
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 24LL;
    }

    while (v6 != a3);
  }

  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_18742FD40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      uint64_t v5 = *(void **)(v3 - 24);
      v3 -= 24LL;
      uint64_t v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 16) = v4;
        operator delete(v4);
      }

      uint64_t v1 = v3;
    }

    while (v3 != v2);
  }

void std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }

void std::vector<std::vector<int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24LL;
      uint64_t v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }

      uint64_t v2 = v4;
    }

    while (v4 != v3);
  }

  a1[1] = v3;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>( uint64_t a1, __int128 *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external( *(std::string **)(a1 + 8),  *(const std::string::value_type **)a2,  *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }

  *(void *)(a1 + 8) = v3 + 24;
}

void sub_18742FF6C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555LL) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    uint64_t v10 = 0LL;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }

  else
  {
    __int128 v12 = *a2;
    end->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }

  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_187430080( _Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer( std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  __v->__begin_ = v4;
  begiuint64_t n = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      __int128 v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 8) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      v7 -= 24LL;
      a3 -= 24LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }

  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 24LL;
  }

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

void *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }

    __int128 v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          unint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  unint64_t v11 = operator new(0x18uLL);
  void *v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>( a1,  v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    void *v20 = v11;
    goto LABEL_39;
  }

  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_1874304B0(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear( void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }

      while (v2);
    }

    v1[2] = 0LL;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0LL;
    }

    v1[3] = 0LL;
  }

  return result;
}

__n128 std::vector<double>::__move_assign(uint64_t a1, __n128 *a2)
{
  unint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0LL;
  a2->n128_u64[1] = 0LL;
  a2[1].n128_u64[0] = 0LL;
  return result;
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    unint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      float v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v13);
      unint64_t v8 = *a1;
      unint64_t v7 = a1[1];
    }

    else
    {
      float v14 = 0LL;
    }

    BOOL v15 = &v14[8 * v11];
    unint64_t v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    unint64_t v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }

    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8) {
      operator delete(v8);
    }
  }

void *std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  *uint64_t v3 = 0LL;
  v3[1] = 0LL;
  v3[2] = 0LL;
  __n128 result = std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>( v3,  *(const void **)a2,  *(void *)(a2 + 8),  (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  *(void *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_1874306C8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>( uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555LL) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  unint64_t v17 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    unint64_t v10 = 0LL;
  }
  uint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  BOOL v15 = v11;
  unint64_t v16 = &v10[24 * v9];
  *(void *)uint64_t v11 = 0LL;
  *((void *)v11 + 1) = 0LL;
  *((void *)v11 + 2) = 0LL;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>( v11,  *(const void **)a2,  *(void *)(a2 + 8),  (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<int>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_1874307D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t std::vector<std::vector<int>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>( (uint64_t)(a1 + 2),  a1[1],  (void *)a1[1],  *a1,  (void *)*a1,  a2[1],  a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v14 = a6;
  *((void *)&v14 + 1) = a7;
  __int128 v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }

  else
  {
    do
    {
      *(void *)(v7 - 24) = 0LL;
      *(void *)(v7 - 16) = 0LL;
      *(void *)(v7 - 8) = 0LL;
      __int128 v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0LL;
      a3[1] = 0LL;
      a3[2] = 0LL;
      uint64_t v7 = *((void *)&v14 + 1) - 24LL;
      *((void *)&v14 + 1) -= 24LL;
    }

    while (a3 != a5);
    uint64_t v9 = v14;
  }

  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }

    v1 += 24LL;
  }

uint64_t std::__split_buffer<std::vector<int>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<int>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }

    else
    {
      v2 -= 24LL;
    }
  }

uint64_t std::vector<ME_Efficient_Model_Trainer::Sample>::__push_back_slow_path<ME_Efficient_Model_Trainer::Sample const&>( uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 4);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x333333333333333LL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  if (0x999999999999999ALL * ((a1[2] - *a1) >> 4) > v4) {
    unint64_t v4 = 0x999999999999999ALL * ((a1[2] - *a1) >> 4);
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((a1[2] - *a1) >> 4) >= 0x199999999999999LL) {
    unint64_t v6 = 0x333333333333333LL;
  }
  else {
    unint64_t v6 = v4;
  }
  __int128 v14 = a1 + 2;
  if (v6) {
    uint64_t v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>>( (uint64_t)(a1 + 2),  v6);
  }
  else {
    uint64_t v7 = 0LL;
  }
  unint64_t v10 = v7;
  uint64_t v11 = &v7[80 * v3];
  __int128 v13 = &v7[80 * v6];
  std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample const&>( (uint64_t)(a1 + 2),  (uint64_t)v11,  a2);
  char v12 = v11 + 80;
  std::vector<ME_Efficient_Model_Trainer::Sample>::__swap_out_circular_buffer(a1, &v10);
  uint64_t v8 = a1[1];
  std::__split_buffer<ME_Efficient_Model_Trainer::Sample>::~__split_buffer(&v10);
  return v8;
}

void sub_187430AF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample const&>( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = *(_DWORD *)a3;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>( (void *)(a2 + 8),  *(const void **)(a3 + 8),  *(void *)(a3 + 16),  (uint64_t)(*(void *)(a3 + 16) - *(void *)(a3 + 8)) >> 2);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 48) = 0LL;
  std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>( (char *)(a2 + 32),  *(__int128 **)(a3 + 32),  *(__int128 **)(a3 + 40),  (uint64_t)(*(void *)(a3 + 40) - *(void *)(a3 + 32)) >> 4);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  return std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( (void *)(a2 + 56),  *(const void **)(a3 + 56),  *(void *)(a3 + 64),  (uint64_t)(*(void *)(a3 + 64) - *(void *)(a3 + 56)) >> 3);
}

void sub_187430B94(_Unwind_Exception *exception_object)
{
  uint64_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 40) = v5;
    operator delete(v5);
  }

  unint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v6;
    operator delete(v6);
  }

  _Unwind_Resume(exception_object);
}

uint64_t std::vector<ME_Efficient_Model_Trainer::Sample>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>( (uint64_t)(a1 + 2),  a1[1],  a1[1],  *a1,  *a1,  a2[1],  a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v16 = a6;
  *((void *)&v16 + 1) = a7;
  __int128 v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  char v14 = 0;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }

  else
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 80LL;
      std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample>( a1,  v7 - 80,  v9);
      uint64_t v7 = *((void *)&v16 + 1) - 80LL;
      *((void *)&v16 + 1) -= 80LL;
    }

    while (v9 != a5);
    uint64_t v11 = v16;
  }

  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

__n128 std::allocator<ME_Efficient_Model_Trainer::Sample>::construct[abi:ne180100]<ME_Efficient_Model_Trainer::Sample,ME_Efficient_Model_Trainer::Sample>( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = *(_DWORD *)a3;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a3 + 8);
  *(void *)(a2 + 24) = *(void *)(a3 + 24);
  *(void *)(a3 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  *(void *)(a3 + 24) = 0LL;
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 48) = 0LL;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a3 + 32);
  *(void *)(a2 + 48) = *(void *)(a3 + 48);
  *(void *)(a3 + 32) = 0LL;
  *(void *)(a3 + 40) = 0LL;
  *(void *)(a3 + 48) = 0LL;
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  __n128 result = *(__n128 *)(a3 + 56);
  *(__n128 *)(a2 + 56) = result;
  *(void *)(a2 + 72) = *(void *)(a3 + 72);
  *(void *)(a3 + 56) = 0LL;
  *(void *)(a3 + 64) = 0LL;
  *(void *)(a3 + 72) = 0LL;
  return result;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<ME_Efficient_Model_Trainer::Sample>,std::reverse_iterator<ME_Efficient_Model_Trainer::Sample*>>::operator()[abi:ne180100]( uint64_t *a1)
{
  uint64_t v1 = *(void **)(a1[2] + 8);
  uint64_t v2 = *(void **)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100](v3, v1);
      v1 += 10;
    }

    while (v1 != v2);
  }

void **std::__split_buffer<ME_Efficient_Model_Trainer::Sample>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<ME_Efficient_Model_Trainer::Sample>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 80;
    std::allocator<ME_Efficient_Model_Trainer::Sample>::destroy[abi:ne180100](v4, (void *)(i - 80));
  }

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,false>( std::vector<int> *a1, int *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  uint64_t v9 = a1;
LABEL_2:
  uint64_t v10 = 1 - a4;
  while (2)
  {
    a1 = v9;
    uint64_t v11 = v10;
    uint64_t v12 = (char *)a2 - (char *)v9;
    unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)v9) >> 4);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( v9,  (std::vector<int> *)((char *)v9 + 80),  (uint64_t)(a2 - 20));
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( v9,  (std::vector<int> *)((char *)v9 + 80),  (std::vector<int> *)((char *)v9 + 160),  (uint64_t)(a2 - 20));
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( v9,  (std::vector<int> *)((char *)v9 + 80),  (std::vector<int> *)((char *)v9 + 160),  v9 + 10,  (uint64_t)(a2 - 20));
        return;
      default:
        if (v12 <= 1919)
        {
          if ((a5 & 1) != 0) {
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (uint64_t)v9,  a2);
          }
          else {
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (uint64_t)v9,  (unsigned __int32 *)a2);
          }
          return;
        }

        if (v11 != 1)
        {
          unint64_t v14 = v13 >> 1;
          __int128 v15 = (std::vector<int> *)((char *)v9 + 80 * (v13 >> 1));
          if ((unint64_t)v12 < 0x2801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( v15,  v9,  (uint64_t)(a2 - 20));
            if ((a5 & 1) != 0) {
              goto LABEL_11;
            }
          }

          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( v9,  v15,  (uint64_t)(a2 - 20));
            uint64_t v16 = 5 * v14;
            unint64_t v17 = (std::vector<int> *)((char *)v9 + 80 * v14 - 80);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (std::vector<int> *)((char *)v9 + 80),  v17,  (uint64_t)(a2 - 40));
            uint64_t v18 = (std::vector<int> *)((char *)v9 + 160);
            uint64_t v19 = (std::vector<int> *)((char *)v9 + 16 * v16 + 80);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( v18,  v19,  (uint64_t)(a2 - 60));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( v17,  v15,  (uint64_t)v19);
            std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a1, (uint64_t)v15);
            if ((a5 & 1) != 0) {
              goto LABEL_11;
            }
          }

          if ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&a1[-4].__end_cap_, (uint64_t)a1) & 1) == 0)
          {
            uint64_t v9 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ME_Efficient_Model_Trainer::Sample *,std::__less<void,void> &>( (std::__compressed_pair<int *> *)a1,  (unint64_t)a2);
            goto LABEL_16;
          }

LABEL_11:
          unint64_t v20 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ME_Efficient_Model_Trainer::Sample *,std::__less<void,void> &>( (std::__compressed_pair<int *> *)a1,  (unint64_t)a2);
          if ((v21 & 1) == 0) {
            goto LABEL_14;
          }
          BOOL v22 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (uint64_t)a1,  (uint64_t)v20);
          uint64_t v9 = (std::vector<int> *)&v20[10];
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (uint64_t)&v20[10],  (uint64_t)a2))
          {
            uint64_t v10 = v11 + 1;
            if (v22) {
              continue;
            }
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,false>( a1,  v20,  a3,  -v11,  a5 & 1);
            uint64_t v9 = (std::vector<int> *)&v20[10];
LABEL_16:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }

          a4 = -v11;
          a2 = (int *)v20;
          if (v22) {
            return;
          }
          goto LABEL_1;
        }

        if (v9 != (std::vector<int> *)a2) {
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,ME_Efficient_Model_Trainer::Sample *>( (uint64_t)v9,  (uint64_t)a2,  (std::vector<int> *)a2,  a3);
        }
        return;
    }
  }

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( uint64_t a1, int *a2)
{
  if ((int *)a1 != a2)
  {
    uint64_t v34 = v2;
    uint64_t v35 = v3;
    uint64_t v6 = a1 + 80;
    if ((int *)(a1 + 80) != a2)
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = a1;
      do
      {
        uint64_t v9 = (int *)v6;
        if (ME_Efficient_Model_Trainer::Sample::operator<(v6, v8))
        {
          int v27 = *v9;
          *(_OWORD *)uint64_t v28 = *(_OWORD *)(v8 + 88);
          uint64_t v29 = *(void *)(v8 + 104);
          *(void *)(v8 + 88) = 0LL;
          *(void *)(v8 + 96) = 0LL;
          *(_OWORD *)std::string __p = *(_OWORD *)(v8 + 112);
          uint64_t v31 = *(void *)(v8 + 128);
          *(void *)(v8 + 104) = 0LL;
          *(void *)(v8 + 112) = 0LL;
          *(void *)(v8 + 120) = 0LL;
          *(void *)(v8 + 128) = 0LL;
          __int128 v32 = *(_OWORD *)(v8 + 136);
          uint64_t v33 = *(void *)(v8 + 152);
          *(void *)(v8 + 136) = 0LL;
          *(void *)(v8 + 144) = 0LL;
          uint64_t v10 = v7;
          *(void *)(v8 + 152) = 0LL;
          while (1)
          {
            uint64_t v11 = a1 + v10;
            *(_DWORD *)(a1 + v10 + 80) = *(_DWORD *)(a1 + v10);
            std::vector<double>::__move_assign(a1 + v10 + 88, (__n128 *)(a1 + v10 + 8));
            std::vector<double>::__move_assign(v11 + 112, (__n128 *)(v11 + 32));
            std::vector<double>::__move_assign(v11 + 136, (__n128 *)(v11 + 56));
            if (!v10) {
              break;
            }
            v10 -= 80LL;
            if ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&v27, v10 + a1) & 1) == 0)
            {
              uint64_t v12 = a1 + v10 + 80;
              goto LABEL_10;
            }
          }

          uint64_t v12 = a1;
LABEL_10:
          *(_DWORD *)uint64_t v12 = v27;
          __int128 v15 = *(void **)(v11 + 8);
          unint64_t v14 = (void *)(v11 + 8);
          unint64_t v13 = v15;
          if (v15)
          {
            *(void *)(v12 + 16) = v13;
            operator delete(v13);
            *unint64_t v14 = 0LL;
            v14[1] = 0LL;
            void v14[2] = 0LL;
          }

          uint64_t v16 = v14 + 3;
          unint64_t v17 = v28[1];
          *unint64_t v14 = v28[0];
          uint64_t v18 = v29;
          *(void *)(v12 + 16) = v17;
          *(void *)(v12 + 24) = v18;
          v28[1] = 0LL;
          uint64_t v29 = 0LL;
          v28[0] = 0LL;
          uint64_t v19 = (void *)v14[3];
          if (v19)
          {
            *(void *)(v12 + 40) = v19;
            operator delete(v19);
            void *v16 = 0LL;
            v14[4] = 0LL;
            v14[5] = 0LL;
          }

          unint64_t v20 = __p[1];
          void *v16 = __p[0];
          uint64_t v21 = v31;
          *(void *)(v12 + 40) = v20;
          *(void *)(v12 + 48) = v21;
          __p[1] = 0LL;
          uint64_t v31 = 0LL;
          __p[0] = 0LL;
          unint64_t v24 = (void *)v14[6];
          unint64_t v23 = v14 + 6;
          BOOL v22 = v24;
          if (v24)
          {
            *(void *)(v12 + 64) = v22;
            operator delete(v22);
            *unint64_t v23 = 0LL;
            v23[1] = 0LL;
            v23[2] = 0LL;
            BOOL v22 = __p[0];
          }

          uint64_t v25 = *((void *)&v32 + 1);
          *unint64_t v23 = v32;
          uint64_t v26 = v33;
          *(void *)(v12 + 64) = v25;
          *(void *)(v12 + 72) = v26;
          uint64_t v33 = 0LL;
          __int128 v32 = 0uLL;
          if (v22)
          {
            __p[1] = v22;
            operator delete(v22);
          }

          if (v28[0])
          {
            v28[1] = v28[0];
            operator delete(v28[0]);
          }
        }

        uint64_t v6 = (uint64_t)(v9 + 20);
        v7 += 80LL;
        uint64_t v8 = (uint64_t)v9;
      }

      while (v9 + 20 != a2);
    }
  }

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( uint64_t a1, unsigned __int32 *a2)
{
  if ((unsigned __int32 *)a1 != a2)
  {
    uint64_t v21 = v2;
    uint64_t v22 = v3;
    uint64_t v5 = a1;
    uint64_t v6 = a1 + 80;
    if ((unsigned __int32 *)(a1 + 80) != a2)
    {
      uint64_t v7 = (__n128 *)(a1 + 152);
      do
      {
        uint64_t v8 = (unsigned __int32 *)v6;
        if (ME_Efficient_Model_Trainer::Sample::operator<(v6, v5))
        {
          unsigned __int32 v14 = *v8;
          *(_OWORD *)__int128 v15 = *(_OWORD *)(v5 + 88);
          unint64_t v16 = *(void *)(v5 + 104);
          *(void *)(v5 + 88) = 0LL;
          *(void *)(v5 + 96) = 0LL;
          *(_OWORD *)std::string __p = *(_OWORD *)(v5 + 112);
          unint64_t v18 = *(void *)(v5 + 128);
          *(void *)(v5 + 104) = 0LL;
          *(void *)(v5 + 112) = 0LL;
          *(void *)(v5 + 120) = 0LL;
          *(void *)(v5 + 128) = 0LL;
          __n128 v19 = *(__n128 *)(v5 + 136);
          unint64_t v20 = *(void *)(v5 + 152);
          *(void *)(v5 + 136) = 0LL;
          *(void *)(v5 + 144) = 0LL;
          uint64_t v9 = v7;
          *(void *)(v5 + 152) = 0LL;
          do
          {
            v9[-5].n128_u32[2] = v9[-10].n128_u32[2];
            std::vector<double>::__move_assign((uint64_t)&v9[-4], v9 - 9);
            std::vector<double>::__move_assign((uint64_t)&v9[-3].n128_i64[1], (__n128 *)((char *)v9 - 120));
            std::vector<double>::__move_assign((uint64_t)&v9[-1], v9 - 6);
            char v10 = ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&v14, (uint64_t)&v9[-15].n128_i64[1]);
            v9 -= 5;
          }

          while ((v10 & 1) != 0);
          uint64_t v11 = (void *)v9[-4].n128_u64[0];
          v9[-5].n128_u32[2] = v14;
          if (v11)
          {
            v9[-4].n128_u64[1] = (unint64_t)v11;
            operator delete(v11);
            v9[-4].n128_u64[0] = 0LL;
            v9[-4].n128_u64[1] = 0LL;
            v9[-3].n128_u64[0] = 0LL;
          }

          v9[-4] = *(__n128 *)v15;
          v9[-3].n128_u64[0] = v16;
          v15[1] = 0LL;
          unint64_t v16 = 0LL;
          v15[0] = 0LL;
          uint64_t v12 = (void *)v9[-3].n128_u64[1];
          if (v12)
          {
            v9[-2].n128_u64[0] = (unint64_t)v12;
            operator delete(v12);
            v9[-3].n128_u64[1] = 0LL;
            v9[-2].n128_u64[0] = 0LL;
            v9[-2].n128_u64[1] = 0LL;
          }

          *(__n128 *)((char *)v9 - 40) = *(__n128 *)__p;
          v9[-2].n128_u64[1] = v18;
          __p[1] = 0LL;
          unint64_t v18 = 0LL;
          __p[0] = 0LL;
          unint64_t v13 = (void *)v9[-1].n128_u64[0];
          if (v13)
          {
            v9[-1].n128_u64[1] = (unint64_t)v13;
            operator delete(v13);
            v9[-1].n128_u64[0] = 0LL;
            v9[-1].n128_u64[1] = 0LL;
            v9->n128_u64[0] = 0LL;
            unint64_t v13 = __p[0];
          }

          v9[-1] = v19;
          v9->n128_u64[0] = v20;
          unint64_t v20 = 0LL;
          __n128 v19 = 0uLL;
          if (v13)
          {
            __p[1] = v13;
            operator delete(v13);
          }

          if (v15[0])
          {
            v15[1] = v15[0];
            operator delete(v15[0]);
          }
        }

        uint64_t v6 = (uint64_t)(v8 + 20);
        v7 += 5;
        uint64_t v5 = (uint64_t)v8;
      }

      while (v8 + 20 != a2);
    }
  }

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( std::vector<int> *a1, std::vector<int> *a2, uint64_t a3)
{
  char v6 = ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a2, (uint64_t)a1);
  uint64_t result = ME_Efficient_Model_Trainer::Sample::operator<(a3, (uint64_t)a2);
  if ((v6 & 1) == 0)
  {
    if (!(_DWORD)result) {
      return result;
    }
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a2, a3);
    uint64_t v8 = a1;
    uint64_t v9 = (uint64_t)a2;
    goto LABEL_9;
  }

  if (!(_DWORD)result)
  {
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a1, (uint64_t)a2);
    uint64_t v8 = a2;
    uint64_t v9 = a3;
LABEL_9:
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(v8, v9);
    return 2LL;
  }

  std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a1, a3);
  return 1LL;
}

std::vector<int> *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ME_Efficient_Model_Trainer::Sample *,std::__less<void,void> &>( std::__compressed_pair<int *> *a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int value = (int)a1->__value_;
  uint64_t v4 = (uint64_t)&a1[1];
  *(_OWORD *)__int128 v15 = *(_OWORD *)&a1[1].__value_;
  unint64_t v16 = a1[3].__value_;
  a1[1].__value_ = 0LL;
  a1[2].__value_ = 0LL;
  a1[3].__value_ = 0LL;
  uint64_t v5 = (uint64_t)&a1[4];
  *(_OWORD *)std::string __p = *(_OWORD *)&a1[4].__value_;
  unint64_t v18 = a1[6].__value_;
  a1[4].__value_ = 0LL;
  a1[5].__value_ = 0LL;
  a1[6].__value_ = 0LL;
  uint64_t v6 = (uint64_t)&a1[7];
  __int128 v19 = *(_OWORD *)&a1[7].__value_;
  unint64_t v20 = a1[9].__value_;
  a1[8].__value_ = 0LL;
  a1[9].__value_ = 0LL;
  a1[7].__value_ = 0LL;
  if ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, a2 - 80) & 1) != 0)
  {
    uint64_t v7 = (std::vector<int> *)a1;
    do
      uint64_t v7 = (std::vector<int> *)((char *)v7 + 80);
    while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, (uint64_t)v7) & 1) == 0);
  }

  else
  {
    p_std::__split_buffer<std::string>::pointer end = (unint64_t)&a1[10];
    do
    {
      uint64_t v7 = (std::vector<int> *)p_end;
      if (p_end >= v2) {
        break;
      }
      int v9 = ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, p_end);
      p_std::__split_buffer<std::string>::pointer end = (unint64_t)&v7[3].__end_;
    }

    while (!v9);
  }

  if ((unint64_t)v7 < v2)
  {
    do
      v2 -= 80LL;
    while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, v2) & 1) != 0);
  }

  while ((unint64_t)v7 < v2)
  {
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(v7, v2);
    do
      uint64_t v7 = (std::vector<int> *)((char *)v7 + 80);
    while (!ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, (uint64_t)v7));
    do
      v2 -= 80LL;
    while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&value, v2) & 1) != 0);
  }

  if (&v7[-4].__end_cap_ != a1)
  {
    LODWORD(a1->__value_) = v7[-4].__end_cap_.__value_;
    std::vector<double>::__move_assign(v4, (__n128 *)&v7[-3]);
    std::vector<double>::__move_assign(v5, (__n128 *)&v7[-2]);
    std::vector<double>::__move_assign(v6, (__n128 *)&v7[-1]);
  }

  begiuint64_t n = v7[-3].__begin_;
  LODWORD(v7[-4].__end_cap_.__value_) = value;
  if (begin)
  {
    v7[-3].__end_ = begin;
    operator delete(begin);
    v7[-3].__begin_ = 0LL;
    v7[-3].__end_ = 0LL;
    v7[-3].__end_cap_.__value_ = 0LL;
  }

  *(_OWORD *)&v7[-3].__begin_ = *(_OWORD *)v15;
  v7[-3].__end_cap_.__value_ = v16;
  v15[0] = 0LL;
  v15[1] = 0LL;
  unint64_t v16 = 0LL;
  uint64_t v11 = v7[-2].__begin_;
  if (v11)
  {
    v7[-2].__end_ = v11;
    operator delete(v11);
    v7[-2].__begin_ = 0LL;
    v7[-2].__end_ = 0LL;
    v7[-2].__end_cap_.__value_ = 0LL;
  }

  *(_OWORD *)&v7[-2].__begin_ = *(_OWORD *)__p;
  v7[-2].__end_cap_.__value_ = v18;
  __p[0] = 0LL;
  __p[1] = 0LL;
  unint64_t v18 = 0LL;
  uint64_t v12 = v7[-1].__begin_;
  if (v12)
  {
    v7[-1].__end_ = v12;
    operator delete(v12);
    v7[-1].__begin_ = 0LL;
    v7[-1].__end_ = 0LL;
    v7[-1].__end_cap_.__value_ = 0LL;
  }

  *(_OWORD *)&v7[-1].__begin_ = v19;
  v7[-1].__end_cap_.__value_ = v20;
  __int128 v19 = 0uLL;
  unint64_t v20 = 0LL;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (v15[0])
  {
    v15[1] = v15[0];
    operator delete(v15[0]);
  }

  return v7;
}

std::__compressed_pair<int *> *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ME_Efficient_Model_Trainer::Sample *,std::__less<void,void> &>( std::__compressed_pair<int *> *a1, unint64_t a2)
{
  uint64_t v4 = 0LL;
  int value = (int)a1->__value_;
  uint64_t v5 = (uint64_t)&a1[1];
  *(_OWORD *)unint64_t v16 = *(_OWORD *)&a1[1].__value_;
  unint64_t v17 = a1[3].__value_;
  a1[1].__value_ = 0LL;
  a1[2].__value_ = 0LL;
  a1[3].__value_ = 0LL;
  uint64_t v6 = (uint64_t)&a1[4];
  *(_OWORD *)std::string __p = *(_OWORD *)&a1[4].__value_;
  __int128 v19 = a1[6].__value_;
  a1[4].__value_ = 0LL;
  a1[5].__value_ = 0LL;
  a1[6].__value_ = 0LL;
  uint64_t v21 = a1[9].__value_;
  uint64_t v7 = (uint64_t)&a1[7];
  __int128 v20 = *(_OWORD *)&a1[7].__value_;
  a1[8].__value_ = 0LL;
  a1[9].__value_ = 0LL;
  a1[7].__value_ = 0LL;
  do
    v4 += 10LL;
  while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&a1[v4], (uint64_t)&value) & 1) != 0);
  unint64_t v8 = (unint64_t)&a1[v4];
  if (v4 == 10)
  {
    do
    {
      if (v8 >= a2) {
        break;
      }
      a2 -= 80LL;
    }

    while ((ME_Efficient_Model_Trainer::Sample::operator<(a2, (uint64_t)&value) & 1) == 0);
  }

  else
  {
    do
      a2 -= 80LL;
    while (!ME_Efficient_Model_Trainer::Sample::operator<(a2, (uint64_t)&value));
  }

  int v9 = (std::vector<int> *)&a1[v4];
  if (v8 < a2)
  {
    unint64_t v10 = a2;
    do
    {
      std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(v9, v10);
      do
        int v9 = (std::vector<int> *)((char *)v9 + 80);
      while ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)v9, (uint64_t)&value) & 1) != 0);
      do
        v10 -= 80LL;
      while (!ME_Efficient_Model_Trainer::Sample::operator<(v10, (uint64_t)&value));
    }

    while ((unint64_t)v9 < v10);
  }

  if (&v9[-4].__end_cap_ != a1)
  {
    LODWORD(a1->__value_) = v9[-4].__end_cap_.__value_;
    std::vector<double>::__move_assign(v5, (__n128 *)&v9[-3]);
    std::vector<double>::__move_assign(v6, (__n128 *)&v9[-2]);
    std::vector<double>::__move_assign(v7, (__n128 *)&v9[-1]);
  }

  begiuint64_t n = v9[-3].__begin_;
  LODWORD(v9[-4].__end_cap_.__value_) = value;
  if (begin)
  {
    v9[-3].__end_ = begin;
    operator delete(begin);
    v9[-3].__begin_ = 0LL;
    v9[-3].__end_ = 0LL;
    v9[-3].__end_cap_.__value_ = 0LL;
  }

  *(_OWORD *)&v9[-3].__begin_ = *(_OWORD *)v16;
  v9[-3].__end_cap_.__value_ = v17;
  v16[0] = 0LL;
  v16[1] = 0LL;
  unint64_t v17 = 0LL;
  uint64_t v12 = v9[-2].__begin_;
  if (v12)
  {
    v9[-2].__end_ = v12;
    operator delete(v12);
    v9[-2].__begin_ = 0LL;
    v9[-2].__end_ = 0LL;
    v9[-2].__end_cap_.__value_ = 0LL;
  }

  *(_OWORD *)&v9[-2].__begin_ = *(_OWORD *)__p;
  v9[-2].__end_cap_.__value_ = v19;
  __p[0] = 0LL;
  __p[1] = 0LL;
  __int128 v19 = 0LL;
  unint64_t v13 = v9[-1].__begin_;
  if (v13)
  {
    v9[-1].__end_ = v13;
    operator delete(v13);
    v9[-1].__begin_ = 0LL;
    v9[-1].__end_ = 0LL;
    v9[-1].__end_cap_.__value_ = 0LL;
  }

  *(_OWORD *)&v9[-1].__begin_ = v20;
  v9[-1].__end_cap_.__value_ = v21;
  __int128 v20 = 0uLL;
  uint64_t v21 = 0LL;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (v16[0])
  {
    v16[1] = v16[0];
    operator delete(v16[0]);
  }

  return &v9[-4].__end_cap_;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 4);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v6 = a2 - 80;
      return 1LL;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (std::vector<int> *)a1,  (std::vector<int> *)(a1 + 80),  a2 - 80);
      return 1LL;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (std::vector<int> *)a1,  (std::vector<int> *)(a1 + 80),  (std::vector<int> *)(a1 + 160),  a2 - 80);
      return 1LL;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (std::vector<int> *)a1,  (std::vector<int> *)(a1 + 80),  (std::vector<int> *)(a1 + 160),  (std::vector<int> *)(a1 + 240),  a2 - 80);
      return 1LL;
    default:
      uint64_t v7 = a1 + 160;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (std::vector<int> *)a1,  (std::vector<int> *)(a1 + 80),  a1 + 160);
      uint64_t v8 = a1 + 240;
      if (a1 + 240 == a2) {
        return 1LL;
      }
      uint64_t v9 = 0LL;
      int v10 = 0;
      break;
  }

  while (1)
  {
    if (ME_Efficient_Model_Trainer::Sample::operator<(v8, v7))
    {
      int v28 = *(_DWORD *)v8;
      *(_OWORD *)uint64_t v29 = *(_OWORD *)(v8 + 8);
      uint64_t v30 = *(void *)(v8 + 24);
      *(void *)(v8 + 8) = 0LL;
      *(void *)(v8 + 16) = 0LL;
      *(_OWORD *)std::string __p = *(_OWORD *)(v8 + 32);
      uint64_t v32 = *(void *)(v8 + 48);
      *(void *)(v8 + 24) = 0LL;
      *(void *)(v8 + 32) = 0LL;
      *(void *)(v8 + 40) = 0LL;
      *(void *)(v8 + 48) = 0LL;
      __int128 v33 = *(_OWORD *)(v8 + 56);
      uint64_t v34 = *(void *)(v8 + 72);
      *(void *)(v8 + 64) = 0LL;
      *(void *)(v8 + 72) = 0LL;
      uint64_t v11 = v9;
      *(void *)(v8 + 56) = 0LL;
      while (1)
      {
        uint64_t v12 = a1 + v11;
        *(_DWORD *)(a1 + v11 + 240) = *(_DWORD *)(a1 + v11 + 160);
        std::vector<double>::__move_assign(a1 + v11 + 248, (__n128 *)(a1 + v11 + 168));
        std::vector<double>::__move_assign(v12 + 272, (__n128 *)(v12 + 192));
        std::vector<double>::__move_assign(v12 + 296, (__n128 *)(v12 + 216));
        if (v11 == -160) {
          break;
        }
        v11 -= 80LL;
        if ((ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)&v28, v12 + 80) & 1) == 0)
        {
          uint64_t v13 = a1 + v11 + 240;
          goto LABEL_12;
        }
      }

      uint64_t v13 = a1;
LABEL_12:
      *(_DWORD *)uint64_t v13 = v28;
      unint64_t v16 = *(void **)(v12 + 168);
      __int128 v15 = (void *)(v12 + 168);
      unsigned __int32 v14 = v16;
      if (v16)
      {
        *(void *)(v13 + 16) = v14;
        operator delete(v14);
        void *v15 = 0LL;
        v15[1] = 0LL;
        v15[2] = 0LL;
      }

      unint64_t v17 = v15 + 3;
      unint64_t v18 = v29[1];
      void *v15 = v29[0];
      uint64_t v19 = v30;
      *(void *)(v13 + 16) = v18;
      *(void *)(v13 + 24) = v19;
      v29[1] = 0LL;
      uint64_t v30 = 0LL;
      v29[0] = 0LL;
      __int128 v20 = (void *)v15[3];
      if (v20)
      {
        *(void *)(v13 + 40) = v20;
        operator delete(v20);
        *unint64_t v17 = 0LL;
        v15[4] = 0LL;
        v15[5] = 0LL;
      }

      uint64_t v21 = __p[1];
      *unint64_t v17 = __p[0];
      uint64_t v22 = v32;
      *(void *)(v13 + 40) = v21;
      *(void *)(v13 + 48) = v22;
      __p[1] = 0LL;
      uint64_t v32 = 0LL;
      __p[0] = 0LL;
      uint64_t v25 = (void *)v15[6];
      unint64_t v24 = v15 + 6;
      unint64_t v23 = v25;
      if (v25)
      {
        *(void *)(v13 + 64) = v23;
        operator delete(v23);
        *unint64_t v24 = 0LL;
        v24[1] = 0LL;
        v24[2] = 0LL;
        unint64_t v23 = __p[0];
      }

      uint64_t v26 = *((void *)&v33 + 1);
      *unint64_t v24 = v33;
      uint64_t v27 = v34;
      *(void *)(v13 + 64) = v26;
      *(void *)(v13 + 72) = v27;
      uint64_t v34 = 0LL;
      __int128 v33 = 0uLL;
      if (v23)
      {
        __p[1] = v23;
        operator delete(v23);
      }

      if (v29[0])
      {
        v29[1] = v29[0];
        operator delete(v29[0]);
      }

      if (++v10 == 8) {
        return v8 + 80 == a2;
      }
    }

    uint64_t v7 = v8;
    v9 += 80LL;
    v8 += 80LL;
    if (v8 == a2) {
      return 1LL;
    }
  }

uint64_t ME_Efficient_Model_Trainer::Sample::operator<(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16) - v2;
  if (v3)
  {
    unint64_t v4 = 0LL;
    unint64_t v5 = v3 >> 2;
    uint64_t v6 = *(void *)(a2 + 8);
    unsigned int v7 = 1;
    while ((*(void *)(a2 + 16) - v6) >> 2 > v4)
    {
      int v8 = *(_DWORD *)(v2 + 4 * v4);
      int v9 = *(_DWORD *)(v6 + 4 * v4);
      if (v8 < v9) {
        return 1LL;
      }
      unint64_t v4 = v7++;
      if (v8 > v9 || v5 <= v4) {
        return 0LL;
      }
    }
  }

  return 0LL;
}

__n128 std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(std::vector<int> *this, uint64_t a2)
{
  begiuint64_t n = (int)this->__begin_;
  __int128 v4 = *(_OWORD *)&this->__end_;
  std::vector<int>::pointer v5 = this[1].__begin_;
  this->__end_ = 0LL;
  p_std::__split_buffer<std::string>::pointer end = &this[1].__end_;
  __int128 v14 = v4;
  __int128 v15 = *(_OWORD *)&this[1].__end_;
  this[1].__end_ = 0LL;
  this->__end_cap_.__value_ = 0LL;
  this[1].__begin_ = 0LL;
  std::vector<int>::pointer v7 = this[2].__begin_;
  this[1].__end_cap_.__value_ = 0LL;
  this[2].__begin_ = 0LL;
  int v8 = &this[2].__end_;
  __n128 v16 = *(__n128 *)&this[2].__end_;
  std::vector<int>::pointer v9 = this[3].__begin_;
  this[2].__end_ = 0LL;
  this[2].__end_cap_.__value_ = 0LL;
  this[3].__begin_ = 0LL;
  LODWORD(this->__begin_) = *(_DWORD *)a2;
  std::vector<double>::__move_assign((uint64_t)&this->__end_, (__n128 *)(a2 + 8));
  std::vector<double>::__move_assign((uint64_t)p_end, (__n128 *)(a2 + 32));
  std::vector<double>::__move_assign((uint64_t)v8, (__n128 *)(a2 + 56));
  *(_DWORD *)a2 = begin;
  int v10 = *(void **)(a2 + 8);
  if (v10)
  {
    *(void *)(a2 + 16) = v10;
    operator delete(v10);
  }

  *(_OWORD *)(a2 + 8) = v14;
  *(void *)(a2 + 24) = v5;
  uint64_t v11 = *(void **)(a2 + 32);
  if (v11)
  {
    *(void *)(a2 + 40) = v11;
    operator delete(v11);
  }

  *(_OWORD *)(a2 + 32) = v15;
  *(void *)(a2 + 48) = v7;
  uint64_t v12 = *(void **)(a2 + 56);
  if (v12)
  {
    *(void *)(a2 + 64) = v12;
    operator delete(v12);
  }

  __n128 result = v16;
  *(__n128 *)(a2 + 56) = v16;
  *(void *)(a2 + 72) = v9;
  return result;
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( std::vector<int> *a1, std::vector<int> *a2, std::vector<int> *a3, uint64_t a4)
{
  if (ME_Efficient_Model_Trainer::Sample::operator<(a4, (uint64_t)a3))
  {
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a3, a4);
    if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a3, (uint64_t)a2))
    {
      std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a2, (uint64_t)a3);
    }
  }

  return result;
}

double std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( std::vector<int> *a1, std::vector<int> *a2, std::vector<int> *a3, std::vector<int> *a4, uint64_t a5)
{
  if (ME_Efficient_Model_Trainer::Sample::operator<(a5, (uint64_t)a4))
  {
    std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a4, a5);
    if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a4, (uint64_t)a3))
    {
      std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a3, (uint64_t)a4);
      if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)a3, (uint64_t)a2))
      {
        std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(a2, (uint64_t)a3);
      }
    }
  }

  return result;
}

std::vector<int> *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *,ME_Efficient_Model_Trainer::Sample *>( uint64_t a1, uint64_t a2, std::vector<int> *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v6 = a2;
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) / 80;
    if (a2 - a1 >= 81)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = a1 + 80 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( a1,  a4,  v9,  v12);
        v12 -= 80LL;
        --v11;
      }

      while (v11);
    }

    uint64_t v13 = v6;
    if ((std::vector<int> *)v6 != a3)
    {
      __int128 v14 = (std::vector<int> *)v6;
      do
      {
        if (ME_Efficient_Model_Trainer::Sample::operator<((uint64_t)v14, a1))
        {
          std::swap[abi:ne180100]<ME_Efficient_Model_Trainer::Sample>(v14, a1);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( a1,  a4,  v9,  a1);
        }

        __int128 v14 = (std::vector<int> *)((char *)v14 + 80);
      }

      while (v14 != a3);
      uint64_t v13 = (uint64_t)a3;
    }

    if (v8 >= 81)
    {
      unint64_t v15 = v8 / 0x50uLL;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ME_Efficient_Model_Trainer::Sample *>( a1,  v6,  a4,  v15);
        v6 -= 80LL;
      }

      while (v15-- > 2);
    }

    return (std::vector<int> *)v13;
  }

  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v28 = v4;
    uint64_t v29 = v5;
    uint64_t v7 = a4;
    int64_t v20 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((a4 - a1) >> 4)))
    {
      int64_t v10 = (0x999999999999999ALL * ((a4 - a1) >> 4)) | 1;
      uint64_t v11 = a1 + 80 * v10;
      int64_t v12 = 0x999999999999999ALL * ((a4 - a1) >> 4) + 2;
      if (v12 < a3 && ME_Efficient_Model_Trainer::Sample::operator<(a1 + 80 * v10, v11 + 80))
      {
        v11 += 80LL;
        int64_t v10 = v12;
      }

      if ((ME_Efficient_Model_Trainer::Sample::operator<(v11, v7) & 1) == 0)
      {
        int v21 = *(_DWORD *)v7;
        *(_OWORD *)uint64_t v22 = *(_OWORD *)(v7 + 8);
        uint64_t v23 = *(void *)(v7 + 24);
        *(void *)(v7 + 8) = 0LL;
        *(void *)(v7 + 16) = 0LL;
        *(_OWORD *)std::string __p = *(_OWORD *)(v7 + 32);
        uint64_t v25 = *(void *)(v7 + 48);
        *(void *)(v7 + 24) = 0LL;
        *(void *)(v7 + 32) = 0LL;
        *(void *)(v7 + 40) = 0LL;
        *(void *)(v7 + 48) = 0LL;
        __int128 v26 = *(_OWORD *)(v7 + 56);
        uint64_t v27 = *(void *)(v7 + 72);
        *(void *)(v7 + 64) = 0LL;
        *(void *)(v7 + 72) = 0LL;
        *(void *)(v7 + 56) = 0LL;
        do
        {
          uint64_t v13 = v11;
          __int128 v14 = (void *)(v11 + 56);
          *(_DWORD *)uint64_t v7 = *(_DWORD *)v11;
          std::vector<double>::__move_assign(v7 + 8, (__n128 *)(v11 + 8));
          std::vector<double>::__move_assign(v7 + 32, (__n128 *)(v11 + 32));
          std::vector<double>::__move_assign(v7 + 56, (__n128 *)(v11 + 56));
          if (v20 < v10) {
            break;
          }
          uint64_t v15 = (2 * v10) | 1;
          uint64_t v11 = a1 + 80 * v15;
          uint64_t v16 = 2 * v10 + 2;
          if (v16 < a3 && ME_Efficient_Model_Trainer::Sample::operator<(a1 + 80 * v15, v11 + 80))
          {
            v11 += 80LL;
            uint64_t v15 = v16;
          }

          uint64_t v7 = v13;
          int64_t v10 = v15;
        }

        while (!ME_Efficient_Model_Trainer::Sample::operator<(v11, (uint64_t)&v21));
        *(_DWORD *)uint64_t v13 = v21;
        unint64_t v17 = *(void **)(v13 + 8);
        if (v17)
        {
          *(void *)(v13 + 16) = v17;
          operator delete(v17);
          *(void *)(v13 + 8) = 0LL;
          *(void *)(v13 + 16) = 0LL;
          *(void *)(v13 + 24) = 0LL;
        }

        *(_OWORD *)(v13 + 8) = *(_OWORD *)v22;
        *(void *)(v13 + 24) = v23;
        v22[0] = 0LL;
        v22[1] = 0LL;
        uint64_t v23 = 0LL;
        unint64_t v18 = *(void **)(v13 + 32);
        if (v18)
        {
          *(void *)(v13 + 40) = v18;
          operator delete(v18);
          *(void *)(v13 + 32) = 0LL;
          *(void *)(v13 + 40) = 0LL;
          *(void *)(v13 + 48) = 0LL;
        }

        *(_OWORD *)(v13 + 32) = *(_OWORD *)__p;
        *(void *)(v13 + 48) = v25;
        __p[0] = 0LL;
        __p[1] = 0LL;
        uint64_t v25 = 0LL;
        uint64_t v19 = *(void **)(v13 + 56);
        if (v19)
        {
          *(void *)(v13 + 64) = v19;
          operator delete(v19);
          *__int128 v14 = 0LL;
          v14[1] = 0LL;
          void v14[2] = 0LL;
          uint64_t v19 = __p[0];
        }

        *(_OWORD *)(v13 + 56) = v26;
        *(void *)(v13 + 72) = v27;
        __int128 v26 = 0uLL;
        uint64_t v27 = 0LL;
        if (v19)
        {
          __p[1] = v19;
          operator delete(v19);
        }

        if (v22[0])
        {
          v22[1] = v22[0];
          operator delete(v22[0]);
        }
      }
    }
  }

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ME_Efficient_Model_Trainer::Sample *>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    int v7 = *(_DWORD *)a1;
    uint64_t v8 = *(void *)(a1 + 16);
    uint64_t v25 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
    uint64_t v10 = *(void *)(a1 + 24);
    uint64_t v9 = *(void *)(a1 + 32);
    *(void *)(a1 + 24) = 0LL;
    *(void *)(a1 + 32) = 0LL;
    uint64_t v28 = v9;
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v27 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = 0LL;
    *(void *)(a1 + 48) = 0LL;
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 72);
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + 64) = 0LL;
    *(void *)(a1 + 72) = 0LL;
    uint64_t v14 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( (_DWORD *)a1,  a3,  a4);
    uint64_t v15 = (void *)v14;
    if (v14 == a2 - 80)
    {
      *(_DWORD *)uint64_t v14 = v7;
      int v21 = (void *)(v14 + 8);
      int64_t v20 = *(void **)(v14 + 8);
      if (v20)
      {
        v15[2] = v20;
        operator delete(v20);
        *int v21 = 0LL;
        v15[2] = 0LL;
        v15[3] = 0LL;
      }

      uint64_t v22 = (void *)v15[4];
      v15[1] = v25;
      v15[2] = v8;
      v15[3] = v10;
      if (v22)
      {
        v15[5] = v22;
        operator delete(v22);
        v15[4] = 0LL;
        v15[5] = 0LL;
        v15[6] = 0LL;
      }

      uint64_t v23 = (void *)v15[7];
      v15[4] = v28;
      v15[5] = v27;
      v15[6] = v26;
      if (v23)
      {
        v15[8] = v23;
        operator delete(v23);
        v15[7] = 0LL;
        v15[8] = 0LL;
        v15[9] = 0LL;
      }

      v15[7] = v11;
      v15[8] = v12;
      v15[9] = v13;
    }

    else
    {
      uint64_t v24 = v11;
      *(_DWORD *)uint64_t v14 = *(_DWORD *)(a2 - 80);
      uint64_t v16 = v14 + 80;
      std::vector<double>::__move_assign(v14 + 8, (__n128 *)(a2 - 72));
      std::vector<double>::__move_assign((uint64_t)(v15 + 4), (__n128 *)(a2 - 48));
      std::vector<double>::__move_assign((uint64_t)(v15 + 7), (__n128 *)(a2 - 24));
      *(_DWORD *)(a2 - 80) = v7;
      unint64_t v17 = *(void **)(a2 - 72);
      if (v17)
      {
        *(void *)(a2 - 64) = v17;
        operator delete(v17);
        *(void *)(a2 - 72) = 0LL;
        *(void *)(a2 - 64) = 0LL;
        *(void *)(a2 - 56) = 0LL;
      }

      *(void *)(a2 - 72) = v25;
      *(void *)(a2 - 64) = v8;
      *(void *)(a2 - 56) = v10;
      unint64_t v18 = *(void **)(a2 - 48);
      if (v18)
      {
        *(void *)(a2 - 40) = v18;
        operator delete(v18);
        *(void *)(a2 - 48) = 0LL;
        *(void *)(a2 - 40) = 0LL;
        *(void *)(a2 - 32) = 0LL;
      }

      *(void *)(a2 - 48) = v28;
      *(void *)(a2 - 40) = v27;
      *(void *)(a2 - 32) = v26;
      uint64_t v19 = *(void **)(a2 - 24);
      if (v19)
      {
        *(void *)(a2 - 16) = v19;
        operator delete(v19);
        *(void *)(a2 - 24) = 0LL;
        *(void *)(a2 - 16) = 0LL;
        *(void *)(a2 - 8) = 0LL;
      }

      *(void *)(a2 - 24) = v24;
      *(void *)(a2 - 16) = v12;
      *(void *)(a2 - 8) = v13;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( a1,  v16,  a3,  0xCCCCCCCCCCCCCCCDLL * ((v16 - a1) >> 4));
    }
  }

void sub_1874326F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( _DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = a3 - 2;
  if (a3 < 2) {
    uint64_t v6 = a3 - 1;
  }
  uint64_t v7 = v6 >> 1;
  do
  {
    uint64_t v8 = (uint64_t)&a1[20 * v5 + 20];
    uint64_t v9 = (2 * v5) | 1;
    uint64_t v10 = 2 * v5 + 2;
    if (v10 < a3
      && ME_Efficient_Model_Trainer::Sample::operator<( (uint64_t)&a1[20 * v5 + 20],  (uint64_t)&a1[20 * v5 + 40]))
    {
      v8 += 80LL;
      uint64_t v9 = v10;
    }

    *a1 = *(_DWORD *)v8;
    std::vector<double>::__move_assign((uint64_t)(a1 + 2), (__n128 *)(v8 + 8));
    std::vector<double>::__move_assign((uint64_t)(a1 + 8), (__n128 *)(v8 + 32));
    std::vector<double>::__move_assign((uint64_t)(a1 + 14), (__n128 *)(v8 + 56));
    a1 = (_DWORD *)v8;
    uint64_t v5 = v9;
  }

  while (v9 <= v7);
  return v8;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Efficient_Model_Trainer::Sample *>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v24 = v4;
    uint64_t v25 = v5;
    unint64_t v8 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v9 = a1 + 80 * v8;
    uint64_t v10 = (_DWORD *)(a2 - 80);
    if (ME_Efficient_Model_Trainer::Sample::operator<(v9, a2 - 80))
    {
      int v17 = *(_DWORD *)(a2 - 80);
      *(_OWORD *)unint64_t v18 = *(_OWORD *)(a2 - 72);
      uint64_t v19 = *(void *)(a2 - 56);
      *(void *)(a2 - 72) = 0LL;
      *(void *)(a2 - 64) = 0LL;
      *(_OWORD *)std::string __p = *(_OWORD *)(a2 - 48);
      uint64_t v21 = *(void *)(a2 - 32);
      *(void *)(a2 - 56) = 0LL;
      *(void *)(a2 - 48) = 0LL;
      *(void *)(a2 - 40) = 0LL;
      *(void *)(a2 - 32) = 0LL;
      __int128 v22 = *(_OWORD *)(a2 - 24);
      uint64_t v23 = *(void *)(a2 - 8);
      *(void *)(a2 - 16) = 0LL;
      *(void *)(a2 - 8) = 0LL;
      *(void *)(a2 - 24) = 0LL;
      do
      {
        uint64_t v11 = v9;
        uint64_t v12 = (void *)(v9 + 56);
        *uint64_t v10 = *(_DWORD *)v9;
        uint64_t v13 = (void *)(v9 + 8);
        std::vector<double>::__move_assign((uint64_t)(v10 + 2), (__n128 *)(v9 + 8));
        std::vector<double>::__move_assign((uint64_t)(v10 + 8), (__n128 *)(v9 + 32));
        std::vector<double>::__move_assign((uint64_t)(v10 + 14), (__n128 *)(v9 + 56));
        if (!v8) {
          break;
        }
        unint64_t v8 = (v8 - 1) >> 1;
        uint64_t v9 = a1 + 80 * v8;
        uint64_t v10 = (_DWORD *)v11;
      }

      while ((ME_Efficient_Model_Trainer::Sample::operator<(v9, (uint64_t)&v17) & 1) != 0);
      *(_DWORD *)uint64_t v11 = v17;
      uint64_t v14 = *(void **)(v11 + 8);
      if (v14)
      {
        *(void *)(v11 + 16) = v14;
        operator delete(v14);
        *uint64_t v13 = 0LL;
        *(void *)(v11 + 16) = 0LL;
        *(void *)(v11 + 24) = 0LL;
      }

      *(_OWORD *)(v11 + 8) = *(_OWORD *)v18;
      *(void *)(v11 + 24) = v19;
      v18[1] = 0LL;
      uint64_t v19 = 0LL;
      v18[0] = 0LL;
      uint64_t v15 = *(void **)(v11 + 32);
      if (v15)
      {
        *(void *)(v11 + 40) = v15;
        operator delete(v15);
        *(void *)(v11 + 32) = 0LL;
        *(void *)(v11 + 40) = 0LL;
        *(void *)(v11 + 48) = 0LL;
      }

      *(_OWORD *)(v11 + 32) = *(_OWORD *)__p;
      *(void *)(v11 + 48) = v21;
      __p[1] = 0LL;
      uint64_t v21 = 0LL;
      __p[0] = 0LL;
      uint64_t v16 = *(void **)(v11 + 56);
      if (v16)
      {
        *(void *)(v11 + 64) = v16;
        operator delete(v16);
        *uint64_t v12 = 0LL;
        v12[1] = 0LL;
        v12[2] = 0LL;
        uint64_t v16 = __p[0];
      }

      *(_OWORD *)(v11 + 56) = v22;
      *(void *)(v11 + 72) = v23;
      uint64_t v23 = 0LL;
      __int128 v22 = 0uLL;
      if (v16)
      {
        __p[1] = v16;
        operator delete(v16);
      }

      if (v18[0])
      {
        v18[1] = v18[0];
        operator delete(v18[0]);
      }
    }
  }

void *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::__clone( uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *double result = off_18A04E9D8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A04E9D8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()( uint64_t a1, void *a2, void *a3, void *a4)
{
  return (*(uint64_t (**)(void, void, void))(a1 + 8))(*a2, *a3, *a4);
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL *)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1LL;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0LL;
}

uint64_t std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>( uint64_t a1, uint64_t a2, unsigned __int8 **a3)
{
  uint64_t v3 = a1;
  if (a1 != a2)
  {
    char v5 = *((_BYTE *)a3 + 23);
    if (v5 >= 0) {
      uint64_t v6 = (unsigned __int8 *)*((unsigned __int8 *)a3 + 23);
    }
    else {
      uint64_t v6 = a3[1];
    }
    if (v5 >= 0) {
      uint64_t v7 = (unsigned __int8 *)a3;
    }
    else {
      uint64_t v7 = *a3;
    }
    do
    {
      uint64_t v8 = *(unsigned __int8 *)(v3 + 23);
      if ((v8 & 0x80u) == 0LL) {
        uint64_t v9 = (unsigned __int8 *)*(unsigned __int8 *)(v3 + 23);
      }
      else {
        uint64_t v9 = *(unsigned __int8 **)(v3 + 8);
      }
      if (v9 == v6)
      {
        if ((v8 & 0x80) != 0)
        {
        }

        else
        {
          if (!*(_BYTE *)(v3 + 23)) {
            return v3;
          }
          uint64_t v10 = 0LL;
          while (*(unsigned __int8 *)(v3 + v10) == v7[v10])
          {
            if (v8 == ++v10) {
              return v3;
            }
          }
        }
      }

      v3 += 24LL;
    }

    while (v3 != a2);
    return a2;
  }

  return v3;
}

void *maxent_model_create()
{
  uint64_t v0 = calloc(1uLL, 8uLL);
  if (v0)
  {
    uint64_t v1 = (ME_Efficient_Model_Trainer *)operator new(0x180uLL);
    ME_Efficient_Model_Trainer::ME_Efficient_Model_Trainer(v1);
    void *v0 = v1;
  }

  return v0;
}

void sub_187432BD8(_Unwind_Exception *a1)
{
}

void maxent_mutable_model_release(ME_Efficient_Model_Trainer **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      ME_Efficient_Model_Trainer::~ME_Efficient_Model_Trainer(v2);
      operator delete(v3);
    }

    free(a1);
  }

BOOL maxent_save_to_file(ME_Efficient_Model_Trainer **a1, char *a2)
{
  return maxent_save_to_file_with_threshold(a1, a2, 0.0);
}

BOOL maxent_save_to_file_with_threshold(ME_Efficient_Model_Trainer **a1, char *a2, double a3)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = *a1;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  BOOL v5 = ME_Efficient_Model_Trainer::save_to_file(v4, (uint64_t)__p, a3);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  return v5;
}

void sub_187432C98( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *maxent_set_heldout(uint64_t *result, int a2, int a3)
{
  if (result)
  {
    uint64_t v3 = *result;
    *(_DWORD *)(v3 + 352) = a2;
    *(_DWORD *)(v3 + 356) = a3;
  }

  return result;
}

double maxent_use_default_SGD(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v1 = *a1;
    *(void *)uint64_t v1 = 0x1E00000002LL;
    double result = 1.0;
    *(_OWORD *)(v1 + 8) = xmmword_18744C770;
  }

  return result;
}

uint64_t *maxent_use_SGD(uint64_t *result, int a2, double a3, double a4)
{
  if (result)
  {
    uint64_t v4 = *result;
    *(_DWORD *)uint64_t v4 = 2;
    *(_DWORD *)(v4 + 4) = a2;
    *(double *)(v4 + 8) = a3;
    *(double *)(v4 + 16) = a4;
  }

  return result;
}

uint64_t maxent_use_l1_regularizer(uint64_t result, double a2)
{
  if (result) {
    *(double *)(*(void *)result + 24LL) = a2;
  }
  return result;
}

uint64_t maxent_use_l2_regularizer(uint64_t result, double a2)
{
  if (result) {
    *(double *)(*(void *)result + 32LL) = a2;
  }
  return result;
}

void maxent_add_training_sample(ME_Efficient_Model_Trainer **a1, const ME_Sample **a2)
{
  if (a1)
  {
    if (a2) {
      ME_Efficient_Model_Trainer::add_training_sample(*a1, *a2);
    }
  }

ME_Efficient_Model_Trainer **maxent_train(ME_Efficient_Model_Trainer **result)
{
  if (result) {
    return (ME_Efficient_Model_Trainer **)ME_Efficient_Model_Trainer::train(*result);
  }
  return result;
}

_DWORD *maxent_load_from_file(char *a1, char a2)
{
  uint64_t v4 = calloc(1uLL, 0x10uLL);
  if (v4)
  {
    BOOL v5 = operator new(0x38uLL);
    _OWORD *v5 = 0u;
    v5[1] = 0u;
    v5[2] = 0u;
    *((_BYTE *)v5 + 48) = 0;
    *(void *)uint64_t v4 = v5;
    std::string::basic_string[abi:ne180100]<0>(__p, a1);
    ME_Efficient_Model::load_from_file((uint64_t)v5, (uint64_t)__p, a2);
    if (v8 < 0) {
      operator delete(__p[0]);
    }
    v4[2] = 1;
  }

  return v4;
}

void sub_187432DE8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

_DWORD *maxent_load_with_bytes(const char *a1)
{
  uint64_t v2 = calloc(1uLL, 0x10uLL);
  if (v2)
  {
    uint64_t v3 = operator new(0x38uLL);
    *uint64_t v3 = 0u;
    v3[1] = 0u;
    v3[2] = 0u;
    *((_BYTE *)v3 + 48) = 0;
    *(void *)uint64_t v2 = v3;
    ME_Efficient_Model::load_with_bytes((ME_Efficient_Model *)v3, a1);
    v2[2] = 1;
  }

  return v2;
}

uint64_t maxent_num_classes(ME_Efficient_Model **a1)
{
  if (a1) {
    return ME_Efficient_Model::num_classes(*a1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t maxent_classify(ME_Efficient_Model **a1, ME_Sample **a2, uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  int v13 = -1;
  if (a1 && a2)
  {
    ME_Efficient_Model::classify(*a1, *a2, (unsigned int *)&v13, (uint64_t *)&__p);
    uint64_t v6 = (char *)__p;
    if (a3)
    {
      char v10 = 0;
      uint64_t v7 = v12;
      if (__p != v12)
      {
        char v8 = (double *)((char *)__p + 8);
        do
        {
          (*(void (**)(uint64_t, char *, double))(a3 + 16))(a3, &v10, *(v8 - 1));
          if (v10) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v8 == (double *)v7;
          }
          ++v8;
        }

        while (!v9);
        uint64_t v6 = (char *)__p;
      }
    }

    if (v6)
    {
      uint64_t v12 = v6;
      operator delete(v6);
    }

    return v13;
  }

  return result;
}

void sub_187432F2C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *maxent_get_class_label(ME_Efficient_Model **a1, unsigned int a2)
{
  if (a1) {
    return ME_Efficient_Model::get_class_label(*a1, a2);
  }
  else {
    return "";
  }
}

uint64_t maxent_get_class_id(uint64_t **a1, char *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *a1;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  class_int id = ME_Efficient_Model::get_class_id(v2, (unsigned __int8 **)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  return class_id;
}

void sub_187432FBC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t maxent_model_retain(uint64_t result)
{
  if (result) {
    ++*(_DWORD *)(result + 8);
  }
  return result;
}

void maxent_model_release(_DWORD *a1)
{
  if (a1)
  {
    int v2 = a1[2] - 1;
    a1[2] = v2;
    if (!v2)
    {
      uint64_t v3 = *(ME_Efficient_Model **)a1;
      if (*(void *)a1)
      {
        ME_Efficient_Model::~ME_Efficient_Model(v3);
        operator delete(v4);
      }

      free(a1);
    }
  }

void *maxent_sample_create()
{
  uint64_t v0 = calloc(1uLL, 8uLL);
  if (v0)
  {
    uint64_t v1 = (char *)operator new(0x48uLL);
    std::string::basic_string[abi:ne180100]<0>(v1, "");
    *(_OWORD *)(v1 + 56) = 0u;
    *(_OWORD *)(v1 + 40) = 0u;
    *(_OWORD *)(v1 + 24) = 0u;
    void *v0 = v1;
  }

  return v0;
}

void sub_187433098(_Unwind_Exception *a1)
{
}

uint64_t maxent_sample_description(char **a1, void *a2, int a3)
{
  char v6 = *a1;
  if ((*a1)[23] >= 0) {
    size_t v7 = (*a1)[23];
  }
  else {
    size_t v7 = *((void *)*a1 + 1);
  }
  p_p = &__p;
  std::string::basic_string[abi:ne180100]((uint64_t)&__p, v7 + 1);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (v7)
  {
    if (v6[23] >= 0) {
      BOOL v9 = v6;
    }
    else {
      BOOL v9 = *(char **)v6;
    }
    memmove(p_p, v9, v7);
  }

  *(_WORD *)((char *)&p_p->__r_.__value_.__l.__data_ + v7) = 9;
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    char v10 = &__p;
  }
  else {
    char v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type size = __p.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::string::append(&__src, (const std::string::value_type *)v10, size);
  uint64_t v12 = (__int128 *)*((void *)*a1 + 3);
  for (i = (__int128 *)*((void *)*a1 + 4); v12 != i; uint64_t v12 = (__int128 *)((char *)v12 + 24))
  {
    if (*((char *)v12 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v12, *((void *)v12 + 1));
    }

    else
    {
      __int128 v14 = *v12;
      __p.__r_.__value_.__l.__cap_ = *((void *)v12 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v14;
    }

    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      size_t v15 = __p.__r_.__value_.__s.__size_;
    }
    else {
      size_t v15 = __p.__r_.__value_.__l.__size_;
    }
    std::string::basic_string[abi:ne180100]((uint64_t)v23, v15 + 1);
    if ((v24 & 0x80u) == 0) {
      uint64_t v16 = v23;
    }
    else {
      uint64_t v16 = (void **)v23[0];
    }
    if (v15)
    {
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v17 = &__p;
      }
      else {
        int v17 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      memmove(v16, v17, v15);
    }

    *(_WORD *)((char *)v16 + v15) = 32;
    if ((v24 & 0x80u) == 0) {
      unint64_t v18 = v23;
    }
    else {
      unint64_t v18 = (void **)v23[0];
    }
    if ((v24 & 0x80u) == 0) {
      std::string::size_type v19 = v24;
    }
    else {
      std::string::size_type v19 = (std::string::size_type)v23[1];
    }
    std::string::append(&__src, (const std::string::value_type *)v18, v19);
  }

  if ((char)__src.__r_.__value_.__s.__size_ < 0)
  {
    uint64_t v21 = (void *)__src.__r_.__value_.__r.__words[0];
    memcpy(a2, __src.__r_.__value_.__l.__data_, a3);
    uint64_t v20 = LODWORD(__src.__r_.__value_.__r.__words[1]);
    operator delete(v21);
  }

  else
  {
    uint64_t v20 = __src.__r_.__value_.__s.__size_;
    memcpy(a2, &__src, a3);
  }

  return v20;
}

void sub_1874332C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

void maxent_sample_set_label(std::string **a1, char *a2)
{
  if (a1)
  {
    int v2 = *a1;
    std::string::basic_string[abi:ne180100]<0>(&__str, a2);
    std::string::operator=(v2, &__str);
  }

void sub_187433364( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const char *maxent_sample_get_label(const char **a1)
{
  if (!a1) {
    return "";
  }
  uint64_t result = *a1;
  if (result[23] < 0) {
    return *(const char **)result;
  }
  return result;
}

void maxent_sample_add_feature(uint64_t **a1, char *a2)
{
  if (a1)
  {
    int v2 = *a1;
    std::string::basic_string[abi:ne180100]<0>(__p, a2);
    ME_Sample::add_feature(v2, (__int128 *)__p);
    if (v4 < 0) {
      operator delete(__p[0]);
    }
  }

void sub_1874333F4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Sample::add_feature(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = a1 + 3;
  unint64_t v4 = a1[4];
  if (v4 >= a1[5])
  {
    uint64_t result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }

  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    uint64_t result = v4 + 24;
  }

  a1[4] = result;
  return result;
}

void maxent_sample_add_feature_with_value(uint64_t **a1, char *a2, double a3)
{
  if (a1)
  {
    unint64_t v4 = *a1;
    std::string::basic_string[abi:ne180100]<0>(__p, a2);
    ME_Sample::add_feature(v4, (uint64_t)__p, a3);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
  }

void sub_1874334AC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ME_Sample::add_feature(uint64_t *a1, uint64_t a2, double a3)
{
  else {
    std::string __p = *(std::string *)a2;
  }
  double v20 = a3;
  unint64_t v5 = a1[8];
  unint64_t v6 = a1[7];
  if (v6 >= v5)
  {
    uint64_t v8 = a1[6];
    uint64_t v9 = (uint64_t)(v6 - v8) >> 5;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v5 - v8;
    if (v11 >> 4 > v10) {
      unint64_t v10 = v11 >> 4;
    }
    else {
      unint64_t v12 = v10;
    }
    v21[4] = a1 + 8;
    int v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>( (uint64_t)(a1 + 8),  v12);
    __int128 v14 = &v13[32 * v9];
    v21[0] = v13;
    v21[1] = v14;
    v21[3] = &v13[32 * v15];
    __int128 v16 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((void *)v14 + 2) = __p.__r_.__value_.__l.__cap_;
    *(_OWORD *)__int128 v14 = v16;
    memset(&__p, 0, sizeof(__p));
    *((double *)v14 + 3) = v20;
    v21[2] = v14 + 32;
    std::vector<std::pair<std::string,double>>::__swap_out_circular_buffer(a1 + 6, v21);
    uint64_t v17 = a1[7];
    std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v21);
    int size = (char)__p.__r_.__value_.__s.__size_;
    a1[7] = v17;
    if (size < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }

  else
  {
    __int128 v7 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(v6 + 16) = __p.__r_.__value_.__l.__cap_;
    *(_OWORD *)unint64_t v6 = v7;
    *(double *)(v6 + 24) = v20;
    a1[7] = v6 + 32;
  }

void sub_18743361C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void maxent_sample_clear(ME_Sample **a1)
{
  if (a1) {
    ME_Sample::clear(*a1);
  }
}

void ME_Sample::clear(ME_Sample *this)
{
}

void maxent_sample_release(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = (void **)(v2 + 48);
      std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&v3);
      uint64_t v3 = (void **)(v2 + 24);
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
      operator delete((void *)v2);
    }

    free(a1);
  }

ME_Efficient_Model_Trainer **maxent_copy_trained_model_data( ME_Efficient_Model_Trainer **a1, _DWORD *a2, double a3)
{
  uint64_t v3 = a1;
  if (a1)
  {
    unint64_t v6 = tmpfile();
    __int128 v7 = *v3;
    uint64_t v8 = fileno(v6);
    if (ME_Efficient_Model_Trainer::save_to_file_descriptor(v7, v8, a3))
    {
      fseek(v6, 0LL, 2);
      size_t v9 = MEMORY[0x1895A4CE4](v6);
      fseek(v6, 0LL, 0);
      uint64_t v3 = (ME_Efficient_Model_Trainer **)malloc(v9);
      fread(v3, v9, 1uLL, v6);
      if (a2) {
        *a2 = v9;
      }
    }

    else
    {
      uint64_t v3 = 0LL;
    }

    fclose(v6);
  }

  return v3;
}

uint64_t maxent_copy_loaded_model_data(uint64_t a1, _DWORD *a2)
{
  if (a1 && a2)
  {
    uint64_t v2 = *(void *)(*(void *)a1 + 32LL);
    if (*(void *)(*(void *)a1 + 40LL)) {
      BOOL v3 = v2 == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      *a2 = v2;
    }
  }

  return 0LL;
}

void ME_Efficient_Model_Trainer::ME_Efficient_Model_Trainer(ME_Efficient_Model_Trainer *this)
{
  *((void *)this + 5) = 0LL;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((void *)this + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
  *((void *)this + 7) = 0LL;
  *((_DWORD *)this + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
  *((_DWORD *)this + 2std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 1065353216;
  *((void *)this + 15) = 0LL;
  *((void *)this + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
  *((_OWORD *)this + 9) = 0u;
  *((void *)this + 14) = 0LL;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((void *)this + 24) = 0LL;
  *((_DWORD *)this + 50) = 1065353216;
  *((void *)this + 2std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
  *((void *)this + 27) = 0LL;
  *((void *)this + 28) = 0LL;
  *((_OWORD *)this + 15) = 0u;
  *(_DWORD *)this = 0;
  *((void *)this + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = 0LL;
  *((void *)this + 4) = 0LL;
  *((_OWORD *)this + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 2std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = 0u;
  nlp::BurstTrieCreateMutable(this);
  *((void *)this + 17) = v2;
}

void sub_1874338A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  __int128 v7 = (void *)v2[45];
  if (v7)
  {
    v2[46] = v7;
    operator delete(v7);
  }

  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  uint64_t v8 = (void *)v2[33];
  if (v8)
  {
    v2[34] = v8;
    operator delete(v8);
  }

  size_t v9 = *v5;
  if (*v5)
  {
    v2[31] = v9;
    operator delete(v9);
  }

  ME_Efficient_Model_Trainer::ME_FeatureBag::~ME_FeatureBag(v3);
  unint64_t v10 = *v4;
  if (*v4)
  {
    v2[19] = v10;
    operator delete(v10);
  }

  ME_Efficient_Model_Trainer::StringBag::~StringBag((ME_Efficient_Model_Trainer::StringBag *)(v2 + 8));
  std::vector<ME_Efficient_Model_Trainer::Sample>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<std::string,double>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>>( (uint64_t)(a1 + 2),  a1[1],  a1[1],  *a1,  *a1,  a2[1],  a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }

  else
  {
    uint64_t v8 = a7;
    do
    {
      __int128 v9 = *(_OWORD *)(a3 - 32);
      *(void *)(v8 - 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = *(void *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(void *)(a3 - 24) = 0LL;
      *(void *)(a3 - 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
      *(void *)(a3 - 32) = 0LL;
      *(void *)(v8 - 8) = *(void *)(a3 - 8);
      v8 -= 32LL;
      v7 -= 32LL;
      a3 -= 32LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }

  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 32LL;
  }

uint64_t std::__split_buffer<std::pair<std::string,double>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::pair<std::string,double>>::__destruct_at_end[abi:ne180100]( uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 4;
      *(void *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

void std::vector<std::pair<std::string,double>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32LL)
  {
  }

  a1[1] = v2;
}

void std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v5 | 0x8000000000000000LL;
    *(void *)a1 = v6;
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
    *(void *)a1 = 0LL;
    *(_BYTE *)(a1 + 2std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = a2;
  }

  return a1;
}

uint64_t crfsuite_train_averaged_perceptron_init(int **a1)
{
  return params_add_float(a1, "epsilon", "The stopping criterion (the ratio of incorrect label predictions).", 0.0);
}

uint64_t crfsuite_train_averaged_perceptron( uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, void *a5, double **a6)
{
  int v10 = *(_DWORD *)(a2 + 16);
  size_t v12 = *(int *)(a1 + 44);
  size_t v11 = *(int *)(a1 + 48);
  clock_t v123 = clock();
  unint64_t v134 = 0LL;
  double v135 = 0.0;
  (*(void (**)(uint64_t, const char *, int *))(a4 + 88))(a4, "max_iterations", &v136);
  (*(void (**)(uint64_t, const char *, double *))(a4 + 96))(a4, "epsilon", v137);
  char v13 = calloc(8uLL, v12);
  uint64_t v125 = (double *)calloc(8uLL, v12);
  size_t v129 = v12;
  __dst = (double *)calloc(8uLL, v12);
  __int128 v14 = (char *)calloc(4uLL, v11);
  uint64_t v21 = v14;
  if (v13 && v125 && __dst && v14)
  {
    logging(a5, (uint64_t)"Averaged perceptron\n", v15, v16, v17, v18, v19, v20, v117);
    logging(a5, (uint64_t)"max_iterations: %d\n", v22, v23, v24, v25, v26, v27, v136);
    logging(a5, (uint64_t)"epsilon: %f\n", v28, v29, v30, v31, v32, v33, *(uint64_t *)&v137[0]);
    logging(a5, (uint64_t)"\n", v34, v35, v36, v37, v38, v39, v118);
    LODWORD(v131) = 0;
    v133[0] = v13;
    v133[1] = v125;
    int v40 = 1;
    uint64_t v126 = a5;
    while ((int)v131 < v136)
    {
      clock_t v41 = clock();
      dataset_shuffle(a2);
      clock_t v128 = v41;
      if (v10 < 1)
      {
        double v43 = 0.0;
      }

      else
      {
        int v42 = 0;
        double v43 = 0.0;
        do
        {
          uint64_t v44 = (unsigned int *)dataset_get((void *)a2, v42);
          (*(void (**)(uint64_t, void *, double))(a1 + 88))(a1, v13, 1.0);
          (*(void (**)(uint64_t, unsigned int *))(a1 + 96))(a1, v44);
          (*(void (**)(uint64_t, char *, char *))(a1 + 112))(a1, v21, v132);
          uint64_t v45 = *v44;
          if ((int)v45 >= 1)
          {
            uint64_t v46 = 0LL;
            int v47 = 0;
            uint64_t v48 = 4 * v45;
            do
            {
              if (*(_DWORD *)(*((void *)v44 + 2) + v46) != *(_DWORD *)&v21[v46]) {
                ++v47;
              }
              v46 += 4LL;
            }

            while (v48 != v46);
            if (v47)
            {
              unint64_t v134 = 0x3FF0000000000000LL;
              double v135 = (double)v40;
              (*(void (**)(uint64_t, unsigned int *))(a1 + 80))(a1, v44);
              unint64_t v134 = 0xBFF0000000000000LL;
              double v135 = (double)-v40;
              (*(void (**)(uint64_t, unsigned int *, char *, double (*)(uint64_t, int, double), void *))(a1 + 80))( a1,  v44,  v21,  update_weights,  v133);
              double v43 = v43 + (double)v47 / (double)(int)*v44;
            }
          }

          ++v40;
          ++v42;
        }

        while (v42 != v10);
      }

      uint64_t v49 = __dst;
      memcpy(__dst, v13, 8 * v129);
      if ((int)v129 >= 1)
      {
        uint64_t v56 = v125;
        uint64_t v57 = v129;
        do
        {
          double v58 = *v56++;
          *uint64_t v49 = *v49 + -1.0 / (double)v40 * v58;
          ++v49;
          --v57;
        }

        while (v57);
      }

      uint64_t v131 = (v131 + 1);
      a5 = v126;
      logging(v126, (uint64_t)"***** Iteration #%d *****\n", v50, v51, v52, v53, v54, v55, v131);
      logging(v126, (uint64_t)"Loss: %f\n", v59, v60, v61, v62, v63, v64, *(uint64_t *)&v43);
      double v71 = 0.0;
      if ((int)v129 < 1)
      {
        int v74 = a3;
      }

      else
      {
        uint64_t v72 = __dst;
        int v74 = a3;
        uint64_t v73 = v129;
        do
        {
          double v75 = *v72++;
          double v71 = v71 + v75 * v75;
          --v73;
        }

        while (v73);
      }

      logging(v126, (uint64_t)"Feature norm: %f\n", v65, v66, v67, v68, v69, v70, COERCE__INT64(sqrt(v71)));
      clock_t v76 = clock();
      logging( v126,  (uint64_t)"Seconds required for this iteration: %.3f\n",  v77,  v78,  v79,  v80,  v81,  v82,  COERCE__INT64((double)(v76 - v128) / 1000000.0));
      if (v74) {
        holdout_evaluation(a1, v74, (uint64_t)__dst, v126);
      }
      logging(v126, (uint64_t)"\n", v83, v84, v85, v86, v87, v88, v119);
      if (v43 / (double)v10 < v137[0])
      {
        logging(v126, (uint64_t)"Terminated with the stopping criterion\n", v89, v90, v91, v92, v93, v94, v120);
        logging(v126, (uint64_t)"\n", v95, v96, v97, v98, v99, v100, v121);
        break;
      }
    }

    clock_t v101 = clock();
    logging( a5,  (uint64_t)"Total seconds required for training: %.3f\n",  v102,  v103,  v104,  v105,  v106,  v107,  COERCE__INT64((double)(v101 - v123) / 1000000.0));
    logging(a5, (uint64_t)"\n", v108, v109, v110, v111, v112, v113, v122);
    uint64_t v114 = 0LL;
    double v115 = __dst;
  }

  else
  {
    free(v14);
    uint64_t v114 = 2147483649LL;
    uint64_t v21 = (char *)__dst;
    double v115 = 0LL;
  }

  free(v21);
  free(v125);
  free(v13);
  *a6 = v115;
  return v114;
}

double update_weights(uint64_t a1, int a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  *(double *)(*(void *)a1 + 8LL * a2) = *(double *)(*(void *)a1 + 8LL * a2) + *(double *)(a1 + 16) * a3;
  double result = *(double *)(v3 + 8LL * a2) + *(double *)(a1 + 24) * a3;
  *(double *)(v3 + 8LL * a2) = result;
  return result;
}

uint64_t exchange_options_0(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "c2", a2);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_iterations", a2 + 24);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "period", a2 + 28);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "delta", a2 + 32);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "calibration.eta", a2 + 40);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "calibration.rate", a2 + 48);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "calibration.samples", a2 + 56);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "calibration.candidates", a2 + 60);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "calibration.max_trials", a2 + 64);
  }

  else if (a3)
  {
    (*(void (**)(uint64_t, const char *, double))(a1 + 72))(a1, "c2", *(double *)a2);
    (*(void (**)(uint64_t, const char *, void))(a1 + 64))(a1, "max_iterations", *(unsigned int *)(a2 + 24));
    (*(void (**)(uint64_t, const char *, void))(a1 + 64))(a1, "period", *(unsigned int *)(a2 + 28));
    (*(void (**)(uint64_t, const char *, double))(a1 + 72))(a1, "delta", *(double *)(a2 + 32));
    (*(void (**)(uint64_t, const char *, double))(a1 + 72))(a1, "calibration.eta", *(double *)(a2 + 40));
    (*(void (**)(uint64_t, const char *, double))(a1 + 72))(a1, "calibration.rate", *(double *)(a2 + 48));
    (*(void (**)(uint64_t, const char *, void))(a1 + 64))( a1,  "calibration.samples",  *(unsigned int *)(a2 + 56));
    (*(void (**)(uint64_t, const char *, void))(a1 + 64))( a1,  "calibration.candidates",  *(unsigned int *)(a2 + 60));
    (*(void (**)(uint64_t, const char *, void))(a1 + 64))( a1,  "calibration.max_trials",  *(unsigned int *)(a2 + 64));
  }

  else
  {
    params_add_float((int **)a1, "c2", "Coefficient for L2 regularization.", 1.0);
    params_add_int( (int **)a1,  "max_iterations",  1000,  "The maximum number of iterations (epochs) for SGD optimization.");
    params_add_int((int **)a1, "period", 10, "The duration of iterations to test the stopping criterion.");
    params_add_float( (int **)a1,  "delta",  "The threshold for the stopping criterion; an optimization process stops when\n"
      "the improvement of the log likelihood over the last ${period} iterations is no\n"
      "greater than this threshold.",
      0.000001);
    params_add_float( (int **)a1,  "calibration.eta",  "The initial value of learning rate (eta) used for calibration.",  0.1);
    params_add_float( (int **)a1,  "calibration.rate",  "The rate of increase/decrease of learning rate for calibration.",  2.0);
    params_add_int((int **)a1, "calibration.samples", 1000, "The number of instances used for calibration.");
    params_add_int((int **)a1, "calibration.candidates", 10, "The number of candidates of learning rate.");
    params_add_int( (int **)a1,  "calibration.max_trials",  20,  "The maximum number of trials of learning rates for calibration.");
  }

  return 0LL;
}

uint64_t crfsuite_train_l2sgd_init(uint64_t a1)
{
  return exchange_options_0(a1, 0LL, 0);
}

uint64_t crfsuite_train_l2sgd(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t *a5, double **a6)
{
  uint64_t v186 = 0LL;
  int v11 = *(_DWORD *)(a2 + 16);
  size_t v12 = *(int *)(a1 + 44);
  exchange_options_0(a4, (uint64_t)&v175, -1);
  char v13 = calloc(8uLL, v12);
  if (!v13) {
    return 2147483649LL;
  }
  uint64_t v20 = v13;
  __int128 v173 = a3;
  unsigned int v172 = v11;
  double v176 = (*(double *)&v175 + *(double *)&v175) / (double)v11;
  logging(a5, (uint64_t)"Stochastic Gradient Descent (SGD)\n", v14, v15, v16, v17, v18, v19, v165);
  logging(a5, (uint64_t)"c2: %f\n", v21, v22, v23, v24, v25, v26, v175);
  logging(a5, (uint64_t)"max_iterations: %d\n", v27, v28, v29, v30, v31, v32, v178);
  logging(a5, (uint64_t)"period: %d\n", v33, v34, v35, v36, v37, v38, v179);
  logging(a5, (uint64_t)"delta: %f\n", v39, v40, v41, v42, v43, v44, v180);
  logging(a5, (uint64_t)"\n", v45, v46, v47, v48, v49, v50, v166);
  clock_t v171 = clock();
  uint64_t v51 = v184;
  clock_t v170 = clock();
  v188[0] = 0.0;
  int v58 = *(_DWORD *)(a2 + 16);
  if (v58 >= v183) {
    uint64_t v59 = v183;
  }
  else {
    uint64_t v59 = v58;
  }
  uint64_t v60 = *(unsigned int *)(a1 + 44);
  uint64_t v61 = v181;
  uint64_t v62 = v182;
  double v63 = v176;
  logging(a5, (uint64_t)"Calibrating the learning rate (eta)\n", v52, v53, v54, v55, v56, v57, v167);
  logging(a5, (uint64_t)"calibration.eta: %f\n", v64, v65, v66, v67, v68, v69, v61);
  logging(a5, (uint64_t)"calibration.rate: %f\n", v70, v71, v72, v73, v74, v75, v62);
  logging(a5, (uint64_t)"calibration.samples: %d\n", v76, v77, v78, v79, v80, v81, v59);
  logging(a5, (uint64_t)"calibration.candidates: %d\n", v82, v83, v84, v85, v86, v87, v51);
  logging(a5, (uint64_t)"calibration.max_trials: %d\n", v88, v89, v90, v91, v92, v93, v185);
  dataset_shuffle(a2);
  __int128 v174 = (double *)v20;
  (*(void (**)(uint64_t, void *, double))(a1 + 88))(a1, v20, 1.0);
  double v100 = 0.0;
  double v101 = 0.0;
  if ((int)v59 >= 1)
  {
    int v102 = 0;
    do
    {
      uint64_t v103 = dataset_get((void *)a2, v102);
      (*(void (**)(uint64_t, uint64_t))(a1 + 96))(a1, v103);
      (*(void (**)(uint64_t, void, double *))(a1 + 104))(a1, *(void *)(v103 + 16), &v187);
      double v104 = v101 - v187;
      (*(void (**)(uint64_t, double *))(a1 + 120))(a1, &v187);
      double v101 = v104 + v187;
      ++v102;
    }

    while ((_DWORD)v59 != v102);
  }

  if ((int)v60 >= 1)
  {
    double v100 = 0.0;
    uint64_t v105 = v174;
    do
    {
      double v106 = *v105++;
      double v100 = v100 + v106 * v106;
      --v60;
    }

    while (v60);
  }

  double v107 = v101 + v63 * 0.5 * v100 * (double)v58;
  logging(a5, (uint64_t)"Initial loss: %f\n", v94, v95, v96, v97, v98, v99, *(uint64_t *)&v107);
  int v114 = 0;
  double v115 = 1.79769313e308;
  double v116 = *(double *)&v61;
  uint64_t v117 = 1LL;
  double v118 = *(double *)&v61 / *(double *)&v62;
  do
  {
    logging(a5, (uint64_t)"Trial #%d (eta = %f): ", v108, v109, v110, v111, v112, v113, v117);
    l2sgd(a1, (void *)a2, 0LL, v174, a5, v59, 1LL, 1LL, 1.0 / (v63 * v116), v63, 0.0, 1, v188);
    double v125 = fabs(v188[0]);
    BOOL v126 = v125 < INFINITY;
    if (v125 > INFINITY) {
      BOOL v126 = 1;
    }
    BOOL v127 = v188[0] < v107 && v126;
    if (v127)
    {
      logging(a5, (uint64_t)"%f\n", v119, v120, v121, v122, v123, v124, *(uint64_t *)&v188[0]);
      LODWORD(v51) = v51 - 1;
    }

    else
    {
      logging(a5, (uint64_t)"%f (worse)\n", v119, v120, v121, v122, v123, v124, *(uint64_t *)&v188[0]);
    }

    double v128 = fabs(v188[0]);
    BOOL v129 = v128 < INFINITY;
    if (v128 > INFINITY) {
      BOOL v129 = 1;
    }
    if (v129 && v188[0] < v115)
    {
      *(double *)&uint64_t v61 = v116;
      double v115 = v188[0];
    }

    if (v114)
    {
      int v114 = 1;
      double v116 = v116 / *(double *)&v62;
    }

    else if ((int)v51 > 0 && v127)
    {
      int v114 = 0;
      double v116 = *(double *)&v62 * v116;
    }

    else
    {
      int v114 = 1;
      LODWORD(v51) = v184;
      double v116 = v118;
    }

    uint64_t v117 = (v117 + 1);
  }

  while (v185 > (int)v117);
  logging(a5, (uint64_t)"Best learning rate (eta): %f\n", v108, v109, v110, v111, v112, v113, v61);
  clock_t v131 = clock();
  logging( a5,  (uint64_t)"Seconds required: %.3f\n",  v132,  v133,  v134,  v135,  v136,  v137,  COERCE__INT64((double)(v131 - v170) / 1000000.0));
  logging(a5, (uint64_t)"\n", v138, v139, v140, v141, v142, v143, v168);
  double v177 = 1.0 / (v63 * *(double *)&v61);
  uint64_t v144 = l2sgd(a1, (void *)a2, v173, v174, a5, v172, v178, 0LL, v177, v176, *(double *)&v180, v179, (double *)&v186);
  logging(a5, (uint64_t)"Loss: %f\n", v145, v146, v147, v148, v149, v150, v186);
  clock_t v151 = clock();
  logging( a5,  (uint64_t)"Total seconds required for training: %.3f\n",  v152,  v153,  v154,  v155,  v156,  v157,  COERCE__INT64((double)(v151 - v171) / 1000000.0));
  logging(a5, (uint64_t)"\n", v158, v159, v160, v161, v162, v163, v169);
  *a6 = v174;
  return v144;
}

uint64_t l2sgd( uint64_t a1, void *a2, _DWORD *a3, void *a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, int a12, double *a13)
{
  uint64_t v14 = a7;
  int v15 = a6;
  uint64_t v97 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = a13;
  int v24 = a12;
  v101[0] = 0.0;
  size_t v25 = *(int *)(a1 + 44);
  int v100 = a8;
  if (!(_DWORD)a8)
  {
    uint64_t v26 = (double *)malloc(8LL * a12);
    uint64_t v27 = calloc(v25, 8uLL);
    uint64_t v22 = v27;
    uint64_t v97 = v26;
    if (v26) {
      BOOL v28 = v27 == 0LL;
    }
    else {
      BOOL v28 = 1;
    }
    if (v28)
    {
      uint64_t v29 = 2147483649LL;
      double v30 = 0.0;
      goto LABEL_51;
    }

    int v24 = a12;
  }

  std::string __src = v22;
  size_t v92 = v25;
  uint64_t v31 = v25;
  if ((int)v14 >= 1)
  {
    int v95 = v24;
    int v91 = v14 + 1;
    uint64_t v32 = 1LL;
    double v33 = 0.0;
    double v98 = 1.79769313e308;
    while (1)
    {
      clock_t v99 = clock();
      if (!v100)
      {
        logging(a5, (uint64_t)"***** Epoch #%d *****\n", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v32);
        dataset_shuffle((uint64_t)a2);
      }

      uint64_t v34 = v14;
      if (v15 < 1)
      {
        double v37 = 1.0;
        double v36 = 0.0;
        double v39 = v101[0];
      }

      else
      {
        int v35 = 0;
        double v36 = 0.0;
        double v37 = 1.0;
        do
        {
          uint64_t v38 = dataset_get(a2, v35);
          double v13 = 1.0 / ((v33 + a9) * a10);
          double v37 = v37 * (1.0 - v13 * a10);
          (*(void (**)(uint64_t, void *, double))(a1 + 88))(a1, a4, v37);
          (*(void (**)(uint64_t, uint64_t))(a1 + 96))(a1, v38);
          (*(void (**)(uint64_t, double *, void *, double))(a1 + 128))(a1, v101, a4, v13 / v37);
          double v39 = v101[0];
          double v36 = v36 + v101[0];
          double v33 = v33 + 1.0;
          ++v35;
        }

        while (v15 != v35);
      }

      double v40 = fabs(v39);
      if (v40 >= INFINITY && v40 <= INFINITY)
      {
        logging(a5, (uint64_t)"ERROR: overflow loss\n", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v89);
        uint64_t v29 = 2147483653LL;
        double v30 = v101[0];
        uint64_t v23 = a13;
        uint64_t v22 = __src;
        goto LABEL_51;
      }

      if ((int)v31 < 1)
      {
        double v43 = 0.0;
        uint64_t v14 = v34;
      }

      else
      {
        uint64_t v41 = (double *)a4;
        uint64_t v42 = v31;
        do
        {
          *uint64_t v41 = v37 * *v41;
          ++v41;
          --v42;
        }

        while (v42);
        double v43 = 0.0;
        uint64_t v44 = (double *)a4;
        uint64_t v45 = v31;
        uint64_t v14 = v34;
        do
        {
          double v46 = *v44++;
          double v43 = v43 + v46 * v46;
          --v45;
        }

        while (v45);
      }

      double v30 = v36 + a10 * 0.5 * v43 * (double)v15;
      if (!v100)
      {
        if (v30 < v98)
        {
          memcpy(__src, a4, 8LL * (int)v31);
          double v98 = v36 + a10 * 0.5 * v43 * (double)v15;
        }

        uint64_t v47 = ((int)v32 - 1) % v95;
        if ((int)v32 <= v95)
        {
          v97[v47] = v30;
          logging(a5, (uint64_t)"Loss: %f\n", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, *(uint64_t *)&v30);
          double v48 = a11;
        }

        else
        {
          double v48 = (v97[v47] - v30) / v30;
          v97[v47] = v30;
          logging(a5, (uint64_t)"Loss: %f\n", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, *(uint64_t *)&v30);
          logging(a5, (uint64_t)"Improvement ratio: %f\n", v49, v50, v51, v52, v53, v54, *(uint64_t *)&v48);
        }

        logging(a5, (uint64_t)"Feature L2-norm: %f\n", v55, v56, v57, v58, v59, v60, COERCE__INT64(sqrt(v43)));
        logging(a5, (uint64_t)"Learning rate (eta): %f\n", v61, v62, v63, v64, v65, v66, *(uint64_t *)&v13);
        logging(a5, (uint64_t)"Total number of feature updates: %.0f\n", v67, v68, v69, v70, v71, v72, *(uint64_t *)&v33);
        clock_t v73 = clock();
        logging( a5,  (uint64_t)"Seconds required for this iteration: %.3f\n",  v74,  v75,  v76,  v77,  v78,  v79,  COERCE__INT64((double)(v73 - v99) / 1000000.0));
        if (a3) {
          holdout_evaluation(a1, a3, (uint64_t)a4, a5);
        }
        logging(a5, (uint64_t)"\n", v80, v81, v82, v83, v84, v85, v90);
        if (v48 < a11) {
          break;
        }
      }

      BOOL v28 = (_DWORD)v32 == (_DWORD)v14;
      uint64_t v32 = (v32 + 1);
      if (v28)
      {
        int v86 = v91;
        goto LABEL_42;
      }
    }

    uint64_t v23 = a13;
    uint64_t v22 = __src;
    goto LABEL_46;
  }

  int v86 = 1;
  double v30 = 0.0;
  double v98 = 1.79769313e308;
LABEL_42:
  LODWORD(v32) = v86;
  uint64_t v23 = a13;
  uint64_t v22 = __src;
  if (!v100)
  {
LABEL_46:
    else {
      uint64_t v87 = "SGD terminated with the stopping criteria\n";
    }
    logging(a5, (uint64_t)v87, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v89);
    if (!v22) {
      goto LABEL_50;
    }
LABEL_44:
    memcpy(a4, v22, 8 * v92);
    uint64_t v29 = 0LL;
    double v30 = v98;
    goto LABEL_51;
  }

  if (__src) {
    goto LABEL_44;
  }
LABEL_50:
  uint64_t v29 = 0LL;
LABEL_51:
  free(v22);
  free(v97);
  if (v23) {
    *uint64_t v23 = v30;
  }
  return v29;
}

void ME_Efficient_Model_Trainer::backtracking_line_search( ME_Efficient_Model_Trainer *this, const Vec *a2, const Vec *a3, double a4, const Vec *a5, Vec *a6, double **a7)
{
  uint64_t v15 = *(void *)a5;
  uint64_t v14 = *((void *)a5 + 1);
  double v16 = 2.0;
  do
  {
    double v16 = v16 * 0.5;
    Vec::Vec((Vec *)&v35, (v14 - v15) >> 3, 0.0);
    uint64_t v17 = *(void *)a5;
    uint64_t v18 = *((void *)a5 + 1);
    uint64_t v19 = v18 - *(void *)a5;
    if (v18 != *(void *)a5)
    {
      uint64_t v20 = 0LL;
      unint64_t v21 = v19 >> 3;
      uint64_t v22 = (char *)v35;
      if (v21 <= 1) {
        unint64_t v21 = 1LL;
      }
      do
      {
        *(double *)&v22[v20 >> 29] = v16 * *(double *)(v17 + (v20 >> 29));
        v20 += 0x100000000LL;
        --v21;
      }

      while (v21);
    }

    Vec::Vec((Vec *)&__p, (uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 3, 0.0);
    uint64_t v23 = *(void *)a2;
    uint64_t v24 = *((void *)a2 + 1);
    unint64_t v25 = (v24 - *(void *)a2) >> 3;
    uint64_t v26 = (char *)v35;
    if (v25 != (v36 - (_BYTE *)v35) >> 3) {
      __assert_rtn("operator+", "mathvec.h", 64, "a.Size() == b.Size()");
    }
    if (v24 != v23)
    {
      uint64_t v27 = 0LL;
      BOOL v28 = (char *)__p;
      if (v25 <= 1) {
        unint64_t v25 = 1LL;
      }
      do
      {
        *(double *)&v28[v27 >> 29] = *(double *)(v23 + (v27 >> 29)) + *(double *)&v26[v27 >> 29];
        v27 += 0x100000000LL;
        --v25;
      }

      while (v25);
    }

    uint64_t v29 = __p;
    if (&__p != (void **)a6)
    {
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)a6,  (char *)__p,  (uint64_t)v38,  (v38 - (_BYTE *)__p) >> 3);
      uint64_t v29 = __p;
    }

    if (v29)
    {
      uint64_t v38 = v29;
      operator delete(v29);
    }

    if (v35)
    {
      double v36 = v35;
      operator delete(v35);
    }

    double v30 = ME_Efficient_Model_Trainer::FunctionGradient(this, (uint64_t **)a6, a7);
    uint64_t v15 = *(void *)a5;
    uint64_t v14 = *((void *)a5 + 1);
    uint64_t v31 = v14 - *(void *)a5;
    if (v14 == *(void *)a5)
    {
      double v34 = 0.0;
    }

    else
    {
      uint64_t v32 = 0LL;
      uint64_t v33 = v31 >> 3;
      double v34 = 0.0;
      do
      {
        double v34 = v34 + *(double *)(v15 + (v32 >> 29)) * *(double *)(*(void *)a3 + (v32 >> 29));
        v32 += 0x100000000LL;
        --v33;
      }

      while (v33);
    }
  }

  while (v30 > a4 + v16 * 0.1 * v34);
}

void sub_187435088( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a9) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

void approximate_Hg( const Vec *a1@<X1>, const Vec *a2@<X2>, const Vec *a3@<X3>, const double *a4@<X4>, int a5@<W0>, double **a6@<X8>)
{
  v61[10] = *MEMORY[0x1895F89C0];
  unsigned int v56 = a5 - 1;
  if (a5 >= 11) {
    uint64_t v10 = 9LL;
  }
  else {
    uint64_t v10 = (a5 - 1);
  }
  if (a5 >= 11) {
    int v11 = a5 - 10;
  }
  else {
    int v11 = 0;
  }
  *a6 = 0LL;
  a6[1] = 0LL;
  a6[2] = 0LL;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( a6,  *(const void **)a1,  *((void *)a1 + 1),  (uint64_t)(*((void *)a1 + 1) - *(void *)a1) >> 3);
  int v58 = v10;
  if ((v10 & 0x80000000) == 0)
  {
    uint64_t v12 = v10;
    do
    {
      int v13 = (v11 + (int)v12) % 10;
      uint64_t v14 = *((void *)a2 + 3 * v13);
      uint64_t v15 = *((void *)a2 + 3 * v13 + 1);
      double v16 = 0.0;
      uint64_t v17 = v15 - v14;
      if (v15 != v14)
      {
        uint64_t v18 = 0LL;
        uint64_t v19 = v17 >> 3;
        do
        {
          double v16 = v16 + *(double *)(v14 + (v18 >> 29)) * *(double *)((char *)*a6 + (v18 >> 29));
          v18 += 0x100000000LL;
          --v19;
        }

        while (v19);
      }

      double v20 = a4[v13];
      *(double *)&v61[v12] = v20 * v16;
      unint64_t v21 = (uint64_t *)((char *)a3 + 24 * v13);
      Vec::Vec((Vec *)&__p, (v21[1] - *v21) >> 3, 0.0);
      uint64_t v22 = *v21;
      uint64_t v23 = v21[1];
      uint64_t v24 = v23 - *v21;
      if (v23 != *v21)
      {
        uint64_t v25 = 0LL;
        unint64_t v26 = v24 >> 3;
        uint64_t v27 = (char *)__p;
        if (v26 <= 1) {
          unint64_t v26 = 1LL;
        }
        do
        {
          *(double *)&v27[v25 >> 29] = *(double *)(v22 + (v25 >> 29)) * -(v20 * v16);
          v25 += 0x100000000LL;
          --v26;
        }

        while (v26);
      }

      Vec::operator+=(a6, (uint64_t *)&__p);
      if (__p)
      {
        uint64_t v60 = __p;
        operator delete(__p);
      }
    }

    while (v12-- > 0);
  }

  if (a5 > 0)
  {
    uint64_t v29 = *((void *)a3 + 3 * (v56 % 0xA));
    uint64_t v30 = *((void *)a3 + 3 * (v56 % 0xA) + 1);
    uint64_t v31 = v30 - v29;
    if (v30 == v29)
    {
      double v34 = 0.0;
    }

    else
    {
      uint64_t v32 = 0LL;
      unint64_t v33 = v31 >> 3;
      if (v33 <= 1) {
        unint64_t v33 = 1LL;
      }
      double v34 = 0.0;
      do
      {
        double v34 = v34 + *(double *)(v29 + (v32 >> 29)) * *(double *)(v29 + (v32 >> 29));
        v32 += 0x100000000LL;
        --v33;
      }

      while (v33);
    }

    int v35 = *a6;
    uint64_t v36 = (char *)a6[1] - (char *)*a6;
    if (v36)
    {
      double v37 = 1.0 / a4[v56 % 0xA] / v34;
      uint64_t v38 = v36 >> 3;
      do
      {
        *int v35 = v37 * *v35;
        ++v35;
        --v38;
      }

      while (v38);
    }
  }

  if ((v10 & 0x80000000) == 0)
  {
    uint64_t v39 = 0LL;
    do
    {
      int v40 = (v11 + (int)v39) % 10;
      uint64_t v41 = *((void *)a3 + 3 * v40);
      uint64_t v42 = *((void *)a3 + 3 * v40 + 1);
      double v43 = 0.0;
      uint64_t v44 = v42 - v41;
      if (v42 != v41)
      {
        uint64_t v45 = 0LL;
        uint64_t v46 = v44 >> 3;
        do
        {
          double v43 = v43 + *(double *)(v41 + (v45 >> 29)) * *(double *)((char *)*a6 + (v45 >> 29));
          v45 += 0x100000000LL;
          --v46;
        }

        while (v46);
      }

      double v47 = a4[v40];
      double v48 = (uint64_t *)((char *)a2 + 24 * v40);
      double v49 = *(double *)&v61[v39];
      Vec::Vec((Vec *)&__p, (v48[1] - *v48) >> 3, 0.0);
      uint64_t v50 = *v48;
      uint64_t v51 = v48[1];
      uint64_t v52 = v51 - *v48;
      if (v51 != *v48)
      {
        uint64_t v53 = 0LL;
        unint64_t v54 = v52 >> 3;
        uint64_t v55 = (char *)__p;
        if (v54 <= 1) {
          unint64_t v54 = 1LL;
        }
        do
        {
          *(double *)&v55[v53 >> 29] = (v49 - v47 * v43) * *(double *)(v50 + (v53 >> 29));
          v53 += 0x100000000LL;
          --v54;
        }

        while (v54);
      }

      Vec::operator+=(a6, (uint64_t *)&__p);
      if (__p)
      {
        uint64_t v60 = __p;
        operator delete(__p);
      }

      ++v39;
    }

    while (v39 != v58 + 1);
  }

void sub_187435468( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  uint64_t v15 = *(void **)v13;
  if (*(void *)v13)
  {
    *(void *)(v13 + 8) = v15;
    operator delete(v15);
  }

  _Unwind_Resume(exception_object);
}

double Vec::operator+=(double **a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = (a2[1] - *a2) >> 3;
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (v3 != v5 - *a1) {
    Vec::operator+=();
  }
  if (v5 != v4)
  {
    uint64_t v6 = 0LL;
    if (v3 <= 1) {
      unint64_t v3 = 1LL;
    }
    do
    {
      double result = *(double *)(v2 + (v6 >> 29)) + *v4;
      *v4++ = result;
      v6 += 0x100000000LL;
      --v3;
    }

    while (v3);
  }

  return result;
}

void ME_Efficient_Model_Trainer::perform_LBFGS(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(const void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v7 = (v5 - (uint64_t)v4) >> 3;
  uint64_t v55 = 0LL;
  unsigned int v56 = 0LL;
  uint64_t v57 = 0LL;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v55, v4, v5, v7);
  Vec::Vec((Vec *)&v53, v7, 0.0);
  Vec::Vec((Vec *)v52, v7, 0.0);
  double v8 = ME_Efficient_Model_Trainer::FunctionGradient((ME_Efficient_Model_Trainer *)a1, (uint64_t **)&v55, (double **)&v53);
  for (uint64_t i = 0LL; i != 240; i += 24LL)
    Vec::Vec((Vec *)&v60[i], 0LL, 0.0);
  for (uint64_t j = 0LL; j != 240; j += 24LL)
    Vec::Vec((Vec *)&v59[j], 0LL, 0.0);
  unsigned int v11 = 0;
  uint64_t v12 = (FILE **)MEMORY[0x1895F89D0];
  do
  {
    unsigned int v13 = v11 + 1;
    fprintf(*v12, "%3d  obj(err) = %f (%6.4f)", v11 + 1, -v8, *(double *)(a1 + 336));
    if (*(int *)(a1 + 352) >= 1)
    {
      double v14 = ME_Efficient_Model_Trainer::heldout_likelihood((ME_Efficient_Model_Trainer *)a1);
      fprintf(*v12, "  heldout_logl(err) = %f (%6.4f)", v14, *(double *)(a1 + 344));
    }

    fputc(10, *v12);
    if (v54 == v53)
    {
      double v17 = 0.0;
    }

    else
    {
      uint64_t v15 = 0LL;
      unint64_t v16 = (v54 - (_BYTE *)v53) >> 3;
      if (v16 <= 1) {
        unint64_t v16 = 1LL;
      }
      double v17 = 0.0;
      do
      {
        double v17 = v17 + *(double *)((char *)v53 + (v15 >> 29)) * *(double *)((char *)v53 + (v15 >> 29));
        v15 += 0x100000000LL;
        --v16;
      }

      while (v16);
    }

    if (sqrt(v17) < 0.0001) {
      break;
    }
    approximate_Hg((const Vec *)&v53, (const Vec *)v60, (const Vec *)v59, v58, v11, (double **)&v48);
    Vec::Vec((Vec *)&__p, (v49 - (_BYTE *)v48) >> 3, 0.0);
    uint64_t v18 = (char *)v48;
    if (v49 != v48)
    {
      uint64_t v19 = 0LL;
      unint64_t v20 = (v49 - (_BYTE *)v48) >> 3;
      unint64_t v21 = (char *)__p;
      if (v20 <= 1) {
        unint64_t v20 = 1LL;
      }
      do
      {
        *(double *)&v21[v19 >> 29] = -*(double *)&v18[v19 >> 29];
        v19 += 0x100000000LL;
        --v20;
      }

      while (v20);
    }

    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)v52,  (char *)__p,  (uint64_t)v51,  (v51 - (_BYTE *)__p) >> 3);
    if (__p)
    {
      uint64_t v51 = __p;
      operator delete(__p);
    }

    if (v48)
    {
      double v49 = v48;
      operator delete(v48);
    }

    Vec::Vec((Vec *)&__p, v7, 0.0);
    Vec::Vec((Vec *)&v48, v7, 0.0);
    ME_Efficient_Model_Trainer::backtracking_line_search( (ME_Efficient_Model_Trainer *)a1,  (const Vec *)&v55,  (const Vec *)&v53,  v8,  (const Vec *)v52,  (Vec *)&__p,  (double **)&v48);
    double v8 = v22;
    Vec::Vec((Vec *)&v46, (v51 - (_BYTE *)__p) >> 3, 0.0);
    uint64_t v23 = (char *)__p;
    unint64_t v24 = (v51 - (_BYTE *)__p) >> 3;
    uint64_t v25 = (char *)v55;
    if (v24 != (v56 - (_BYTE *)v55) >> 3) {
      __assert_rtn("operator-", "mathvec.h", 74, "a.Size() == b.Size()");
    }
    if (v51 != __p)
    {
      uint64_t v26 = 0LL;
      uint64_t v27 = (char *)v46;
      if (v24 <= 1) {
        unint64_t v24 = 1LL;
      }
      do
      {
        *(double *)&v27[v26 >> 29] = *(double *)&v23[v26 >> 29] - *(double *)&v25[v26 >> 29];
        v26 += 0x100000000LL;
        --v24;
      }

      while (v24);
    }

    uint64_t v28 = v11 % 0xA;
    uint64_t v29 = (void **)&v60[24 * v28];
    if (v29 != &v46) {
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( &v60[24 * v28],  (char *)v46,  (uint64_t)v47,  (v47 - (_BYTE *)v46) >> 3);
    }
    if (v46)
    {
      double v47 = v46;
      operator delete(v46);
    }

    Vec::Vec((Vec *)&v46, (v49 - (_BYTE *)v48) >> 3, 0.0);
    uint64_t v30 = (char *)v48;
    unint64_t v31 = (v49 - (_BYTE *)v48) >> 3;
    uint64_t v32 = (char *)v53;
    if (v31 != (v54 - (_BYTE *)v53) >> 3) {
      __assert_rtn("operator-", "mathvec.h", 74, "a.Size() == b.Size()");
    }
    if (v49 != v48)
    {
      uint64_t v33 = 0LL;
      double v34 = (char *)v46;
      if (v31 <= 1) {
        unint64_t v31 = 1LL;
      }
      do
      {
        *(double *)&v34[v33 >> 29] = *(double *)&v30[v33 >> 29] - *(double *)&v32[v33 >> 29];
        v33 += 0x100000000LL;
        --v31;
      }

      while (v31);
    }

    int v35 = (void **)&v59[24 * v28];
    if (v35 != &v46) {
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( &v59[24 * v28],  (char *)v46,  (uint64_t)v47,  (v47 - (_BYTE *)v46) >> 3);
    }
    if (v46)
    {
      double v47 = v46;
      operator delete(v46);
    }

    uint64_t v36 = v35[1];
    uint64_t v37 = v36 - (_BYTE *)*v35;
    if (v36 == *v35)
    {
      double v40 = 0.0;
    }

    else
    {
      uint64_t v38 = 0LL;
      uint64_t v39 = v37 >> 3;
      double v40 = 0.0;
      do
      {
        double v40 = v40 + *(double *)((char *)*v35 + (v38 >> 29)) * *(double *)((char *)*v29 + (v38 >> 29));
        v38 += 0x100000000LL;
        --v39;
      }

      while (v39);
    }

    v58[v28] = 1.0 / v40;
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)&v55,  (char *)__p,  (uint64_t)v51,  (v51 - (_BYTE *)__p) >> 3);
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>( (char *)&v53,  (char *)v48,  (uint64_t)v49,  (v49 - (_BYTE *)v48) >> 3);
    if (v48)
    {
      double v49 = v48;
      operator delete(v48);
    }

    if (__p)
    {
      uint64_t v51 = __p;
      operator delete(__p);
    }

    unsigned int v11 = v13;
  }

  while (v13 != 300);
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>( a3,  v55,  (uint64_t)v56,  (v56 - (_BYTE *)v55) >> 3);
  for (uint64_t k = 0LL; k != -240; k -= 24LL)
  {
    uint64_t v42 = *(void **)&v59[k + 216];
    if (v42)
    {
      *(void *)&v59[k + 224] = v42;
      operator delete(v42);
    }
  }

  for (uint64_t m = 0LL; m != -240; m -= 24LL)
  {
    uint64_t v44 = *(void **)&v60[m + 216];
    if (v44)
    {
      *(void *)&v60[m + 224] = v44;
      operator delete(v44);
    }
  }

  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }

  if (v53)
  {
    unint64_t v54 = v53;
    operator delete(v53);
  }

  if (v55)
  {
    unsigned int v56 = v55;
    operator delete(v55);
  }

void sub_187435AC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, void *__p, uint64_t a23, uint64_t a24, void *a25, uint64_t a26, uint64_t a27, void *a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v72 = 0LL;
  while (1)
  {
    clock_t v73 = *(void **)(&a41 + v72 + 216);
    if (v73)
    {
      *(void *)(&a41 + v72 + 224) = v73;
      operator delete(v73);
    }

    v72 -= 24LL;
    if (v72 == -240)
    {
      uint64_t v74 = 0LL;
      while (1)
      {
        uint64_t v75 = *(void **)(&a71 + v74 + 216);
        if (v75)
        {
          *(void *)(&a71 + v74 + 224) = v75;
          operator delete(v75);
        }

        v74 -= 24LL;
        if (v74 == -240)
        {
          if (__p) {
            operator delete(__p);
          }
          if (a25) {
            operator delete(a25);
          }
          if (a28) {
            operator delete(a28);
          }
          _Unwind_Resume(a1);
        }
      }
    }
  }

uint64_t crfsuite_train_lbfgs_init(uint64_t a1)
{
  return exchange_options_1(a1, 0LL, 0);
}

uint64_t exchange_options_1(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "c1", a2);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "c2", a2 + 8);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_iterations", a2 + 48);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "num_memories", a2 + 16);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "epsilon", a2 + 24);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "period", a2 + 32);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "delta", a2 + 40);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 104))(a1, "linesearch", a2 + 56);
    return (*(uint64_t (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_linesearch", a2 + 64);
  }

  else
  {
    params_add_float((int **)a1, "c1", "Coefficient for L1 regularization.", 0.0);
    params_add_float((int **)a1, "c2", "Coefficient for L2 regularization.", 1.0);
    params_add_int( (int **)a1,  "max_iterations",  0x7FFFFFFF,  "The maximum number of iterations for L-BFGS optimization.");
    params_add_int( (int **)a1,  "num_memories",  6,  "The number of limited memories for approximating the inverse hessian matrix.");
    params_add_float((int **)a1, "epsilon", "Epsilon for testing the convergence of the objective.", 0.00001);
    params_add_int((int **)a1, "period", 10, "The duration of iterations to test the stopping criterion.");
    params_add_float( (int **)a1,  "delta",  "The threshold for the stopping criterion; an L-BFGS iteration stops when the\n"
      "improvement of the log likelihood over the last ${period} iterations is no\n"
      "greater than this threshold.",
      0.00001);
    params_add_string( (int **)a1,  "linesearch",  "MoreThuente",  "The line search algorithm used in L-BFGS updates:\n {   'MoreThuente': More and Thuente's method,\n 'Backtracking': Backtracking method with regular Wolfe condition,\n 'StrongBacktracking': Backtracking method with strong Wolfe condition\n }\n");
    return params_add_int( (int **)a1,  "max_linesearch",  20,  "The maximum number of trials for the line search algorithm.");
  }

uint64_t crfsuite_train_lbfgs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, double **a6)
{
  clock_t v12 = clock();
  size_t v13 = *(int *)(a1 + 44);
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  clock_t v127 = 0LL;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  *(_OWORD *)__s1 = 0u;
  uint64_t v116 = 0LL;
  lbfgs_parameter_init(&v117);
  double v14 = (double *)calloc(8uLL, v13);
  if (!v14)
  {
    uint64_t v82 = 2147483649LL;
    uint64_t v83 = 0LL;
    goto LABEL_21;
  }

  *((void *)&v126 + 1) = calloc(8uLL, v13);
  if (!*((void *)&v126 + 1))
  {
    uint64_t v82 = 2147483649LL;
    uint64_t v83 = v14;
    double v14 = 0LL;
    goto LABEL_21;
  }

  exchange_options_1(a4, (uint64_t)&v112, -1);
  logging(a5, (uint64_t)"L-BFGS optimization\n", v15, v16, v17, v18, v19, v20, v108);
  logging(a5, (uint64_t)"c1: %f\n", v21, v22, v23, v24, v25, v26, v112);
  logging(a5, (uint64_t)"c2: %f\n", v27, v28, v29, v30, v31, v32, *((uint64_t *)&v112 + 1));
  logging(a5, (uint64_t)"num_memories: %d\n", v33, v34, v35, v36, v37, v38, v113);
  logging(a5, (uint64_t)"max_iterations: %d\n", v39, v40, v41, v42, v43, v44, LODWORD(__s1[0]));
  logging(a5, (uint64_t)"epsilon: %f\n", v45, v46, v47, v48, v49, v50, *((uint64_t *)&v113 + 1));
  logging(a5, (uint64_t)"stop: %d\n", v51, v52, v53, v54, v55, v56, v114);
  logging(a5, (uint64_t)"delta: %f\n", v57, v58, v59, v60, v61, v62, *((uint64_t *)&v114 + 1));
  logging(a5, (uint64_t)"linesearch: %s\n", v63, v64, v65, v66, v67, v68, (uint64_t)__s1[1]);
  logging(a5, (uint64_t)"linesearch.max_iterations: %d\n", v69, v70, v71, v72, v73, v74, v116);
  logging(a5, (uint64_t)"\n", v75, v76, v77, v78, v79, v80, v109);
  LODWORD(v117) = v113;
  *((void *)&v117 + 1) = *((void *)&v113 + 1);
  int v118 = v114;
  uint64_t v119 = *((void *)&v114 + 1);
  int v120 = (int)__s1[0];
  uint64_t v81 = __s1[1];
  if (!strcmp(__s1[1], "Backtracking"))
  {
    int v84 = 2;
LABEL_10:
    int v121 = v84;
    goto LABEL_11;
  }

  if (!strcmp(v81, "StrongBacktracking"))
  {
    int v84 = 3;
    goto LABEL_10;
  }

  int v121 = 0;
LABEL_11:
  int v122 = v116;
  uint64_t v85 = 0LL;
  if (*(double *)&v112 > 0.0)
  {
    int v121 = 2;
    uint64_t v85 = v112;
  }

  uint64_t v123 = v85;
  *(void *)&__int128 v124 = a1;
  *((void *)&v124 + 1) = a2;
  *(void *)&__int128 v126 = *((void *)&v112 + 1);
  *(void *)&__int128 v125 = a3;
  *((void *)&v125 + 1) = a5;
  clock_t v127 = clock();
  uint64_t v86 = lbfgs( v13,  v14,  0LL,  (double (*)(void, void, void, void, double))lbfgs_evaluate,  (uint64_t (*)(uint64_t, double *, uint64_t *, void, uint64_t, uint64_t, double, double, double, double))lbfgs_progress,  (uint64_t)&v124,  &v117);
  if ((_DWORD)v86 == -997)
  {
    uint64_t v93 = "L-BFGS terminated with the maximum number of iterations\n";
  }

  else if ((_DWORD)v86 == 1)
  {
    uint64_t v93 = "L-BFGS terminated with the stopping criteria\n";
  }

  else if ((_DWORD)v86)
  {
    uint64_t v110 = v86;
    uint64_t v93 = "L-BFGS terminated with error code (%d)\n";
  }

  else
  {
    uint64_t v93 = "L-BFGS resulted in convergence\n";
  }

  logging(a5, (uint64_t)v93, v87, v88, v89, v90, v91, v92, v110);
  memcpy(v14, *((const void **)&v126 + 1), 8 * v13);
  clock_t v94 = clock();
  logging( a5,  (uint64_t)"Total seconds required for training: %.3f\n",  v95,  v96,  v97,  v98,  v99,  v100,  COERCE__INT64((double)(v94 - v12) / 1000000.0));
  logging(a5, (uint64_t)"\n", v101, v102, v103, v104, v105, v106, v111);
  uint64_t v82 = 0LL;
  uint64_t v83 = (double *)*((void *)&v126 + 1);
LABEL_21:
  free(v83);
  *a6 = v14;
  return v82;
}

double lbfgs_evaluate(double *a1, double *a2, double *a3, int a4)
{
  double v8 = a1[4];
  if (v8 <= 0.0) {
    return v14;
  }
  if (a4 < 1)
  {
    double v11 = 0.0;
  }

  else
  {
    double v9 = v8 + v8;
    uint64_t v10 = a4;
    double v11 = 0.0;
    do
    {
      *a3 = *a3 + v9 * *a2;
      ++a3;
      double v12 = *a2++;
      double v11 = v11 + v12 * v12;
      --v10;
    }

    while (v10);
    double v8 = a1[4];
  }

  return v14 + v8 * v11;
}

uint64_t lbfgs_progress( uint64_t *a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  clock_t v19 = clock();
  uint64_t v26 = *a1;
  uint64_t v28 = (_DWORD *)a1[2];
  uint64_t v27 = (uint64_t *)a1[3];
  unint64_t v29 = v19 - a1[6];
  a1[6] = v19;
  if (a8 < 1)
  {
    uint64_t v30 = 0LL;
  }

  else
  {
    LODWORD(v30) = 0;
    uint64_t v31 = (void *)a1[5];
    uint64_t v32 = a8;
    uint64_t v33 = (double *)a2;
    do
    {
      *v31++ = *(void *)v33;
      double v34 = *v33++;
      if (v34 == 0.0) {
        uint64_t v30 = v30;
      }
      else {
        uint64_t v30 = (v30 + 1);
      }
      --v32;
    }

    while (v32);
  }

  logging(v27, (uint64_t)"***** Iteration #%d *****\n", v20, v21, v22, v23, v24, v25, a9);
  logging(v27, (uint64_t)"Loss: %f\n", v35, v36, v37, v38, v39, v40, *(uint64_t *)&a3);
  logging(v27, (uint64_t)"Feature norm: %f\n", v41, v42, v43, v44, v45, v46, *(uint64_t *)&a4);
  logging(v27, (uint64_t)"Error norm: %f\n", v47, v48, v49, v50, v51, v52, *(uint64_t *)&a5);
  logging(v27, (uint64_t)"Active features: %d\n", v53, v54, v55, v56, v57, v58, v30);
  logging(v27, (uint64_t)"Line search trials: %d\n", v59, v60, v61, v62, v63, v64, a10);
  logging(v27, (uint64_t)"Line search step: %f\n", v65, v66, v67, v68, v69, v70, *(uint64_t *)&a6);
  logging( v27,  (uint64_t)"Seconds required for this iteration: %.3f\n",  v71,  v72,  v73,  v74,  v75,  v76,  COERCE__INT64((double)v29 / 1000000.0));
  if (v28) {
    holdout_evaluation(v26, v28, a2, v27);
  }
  logging(v27, (uint64_t)"\n", v77, v78, v79, v80, v81, v82, v84);
  return 0LL;
}

uint64_t crfsuite_train_passive_aggressive_init(uint64_t a1)
{
  return exchange_options_2(a1, 0LL, 0);
}

uint64_t exchange_options_2(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 0)
  {
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "type", a2);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "c", a2 + 8);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "error_sensitive", a2 + 16);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "averaging", a2 + 20);
    (*(void (**)(uint64_t, const char *, uint64_t))(a1 + 88))(a1, "max_iterations", a2 + 24);
    return (*(uint64_t (**)(uint64_t, const char *, uint64_t))(a1 + 96))(a1, "epsilon", a2 + 32);
  }

  else
  {
    params_add_int( (int **)a1,  "type",  1,  "The strategy for updating feature weights: {\n 0: PA without slack variables,\n 1: PA type I,\n 2: PA type II\n }.\n");
    params_add_float((int **)a1, "c", "The aggressiveness parameter.", 1.0);
    params_add_int((int **)a1, "error_sensitive", 1, "Consider the number of incorrect labels to the cost function.");
    params_add_int( (int **)a1,  "averaging",  1,  "Compute the average of feature weights (similarly to Averaged Perceptron).");
    params_add_int((int **)a1, "max_iterations", 100, "The maximum number of iterations.");
    return params_add_float((int **)a1, "epsilon", "The stopping criterion (the mean loss).", 0.0);
  }

uint64_t crfsuite_train_passive_aggressive( uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, void *a5, char **a6)
{
  int v11 = *(_DWORD *)(a2 + 16);
  size_t v13 = *(int *)(a1 + 44);
  size_t v12 = *(int *)(a1 + 48);
  clock_t v14 = clock();
  __int128 v194 = 0u;
  __int128 v195 = 0u;
  __int128 v196 = 0u;
  uint64_t v15 = calloc(v13, 1uLL);
  *(void *)&__int128 v195 = v15;
  *(void *)&__int128 v196 = calloc(v13, 8uLL);
  DWORD2(v19std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v13;
  if ((void)v196) {
    BOOL v16 = v15 == 0LL;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    uint64_t v20 = 0LL;
    clock_t v19 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v17 = 0LL;
LABEL_64:
    unsigned int v172 = a6;
    free(v17);
    uint64_t v171 = 2147483649LL;
    uint64_t v17 = v20;
    uint64_t v20 = 0LL;
    goto LABEL_65;
  }

  int v191 = v11;
  int v183 = a3;
  clock_t v180 = v14;
  int v185 = a5;
  exchange_options_2(a4, (uint64_t)&v197, -1);
  uint64_t v18 = (double *)calloc(8uLL, v13);
  clock_t v19 = (double *)calloc(8uLL, v13);
  uint64_t v20 = (char *)calloc(8uLL, v13);
  uint64_t v21 = (char *)calloc(4uLL, v12);
  uint64_t v17 = v21;
  if (!v18 || !v19 || !v20 || !v21) {
    goto LABEL_64;
  }
  size_t v28 = v13;
  uint64_t v184 = v13;
  if (v199) {
    unint64_t v29 = cost_sensitive;
  }
  else {
    unint64_t v29 = (double (*)(double, double))cost_insensitive;
  }
  uint64_t v30 = (void (*)(uint64_t, double, __n128, double))tau0;
  if (v197 == 2) {
    uint64_t v30 = (void (*)(uint64_t, double, __n128, double))tau2;
  }
  if (v197 == 1) {
    uint64_t v30 = (void (*)(uint64_t, double, __n128, double))tau1;
  }
  v189 = v30;
  v190 = v29;
  uint64_t v31 = v185;
  logging(v185, (uint64_t)"Passive Aggressive\n", v22, v23, v24, v25, v26, v27, v174);
  logging(v185, (uint64_t)"type: %d\n", v32, v33, v34, v35, v36, v37, v197);
  logging(v185, (uint64_t)"c: %f\n", v38, v39, v40, v41, v42, v43, v198);
  logging(v185, (uint64_t)"error_sensitive: %d\n", v44, v45, v46, v47, v48, v49, v199);
  logging(v185, (uint64_t)"averaging: %d\n", v50, v51, v52, v53, v54, v55, v200);
  logging(v185, (uint64_t)"max_iterations: %d\n", v56, v57, v58, v59, v60, v61, v201);
  logging(v185, (uint64_t)"epsilon: %f\n", v62, v63, v64, v65, v66, v67, v202);
  logging(v185, (uint64_t)"\n", v68, v69, v70, v71, v72, v73, v175);
  LODWORD(v188) = 0;
  int v74 = v11;
  double v75 = (double)v11;
  int v186 = v28;
  __uint64_t n = 8 * v28;
  int v76 = 1;
  while ((int)v188 < v201)
  {
    clock_t v77 = clock();
    dataset_shuffle(a2);
    clock_t v187 = v77;
    if (v74 < 1)
    {
      double v79 = 0.0;
    }

    else
    {
      int v78 = 0;
      double v79 = 0.0;
      do
      {
        uint64_t v80 = (unsigned int *)dataset_get((void *)a2, v78);
        (*(void (**)(uint64_t, double *, double))(a1 + 88))(a1, v18, 1.0);
        (*(void (**)(uint64_t, unsigned int *))(a1 + 96))(a1, v80);
        (*(void (**)(uint64_t, char *, double *))(a1 + 112))(a1, v17, &v193);
        uint64_t v81 = *v80;
        if ((int)v81 >= 1)
        {
          uint64_t v82 = 0LL;
          int v83 = 0;
          uint64_t v84 = 4 * v81;
          do
          {
            if (*(_DWORD *)(*((void *)v80 + 2) + v82) != *(_DWORD *)&v17[v82]) {
              ++v83;
            }
            v82 += 4LL;
          }

          while (v84 != v82);
          if (v83)
          {
            (*(void (**)(uint64_t))(a1 + 104))(a1);
            double v85 = v190(v193 - v192, (double)v83);
            uint64_t v86 = DWORD2(v194);
            if (SDWORD2(v194) >= 1)
            {
              uint64_t v87 = (int *)v194;
              uint64_t v88 = v196;
              do
              {
                uint64_t v89 = *v87++;
                *(void *)(v88 + 8 * v89) = 0LL;
                --v86;
              }

              while (v86);
            }

            DWORD2(v194) = 0;
            *((void *)&v195 + 1) = 0x3FF0000000000000LL;
            (*(void (**)(uint64_t, unsigned int *, void, double (*)(uint64_t, int, double), __int128 *))(a1 + 80))( a1,  v80,  *((void *)v80 + 2),  delta_collect_0,  &v194);
            *((void *)&v195 + 1) = 0xBFF0000000000000LL;
            uint64_t v90 = (*(uint64_t (**)(uint64_t, unsigned int *, char *, double (*)(uint64_t, int, double), __int128 *))(a1 + 80))( a1,  v80,  v17,  delta_collect_0,  &v194);
            int v92 = DWORD2(v194);
            if (SDWORD2(v194) < 1)
            {
              DWORD2(v194) = 0;
              v91.n128_u64[0] = 0LL;
              int v74 = v191;
            }

            else
            {
              uint64_t v93 = 0LL;
              int v94 = 0;
              do
              {
                uint64_t v95 = v195;
                int v96 = *(_DWORD *)(v194 + 4 * v93);
                if (!*(_BYTE *)(v195 + v96))
                {
                  *(_DWORD *)(v194 + 4LL * v94++) = v96;
                  *(_BYTE *)(v95 + v9std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 1;
                  int v92 = DWORD2(v194);
                }

                ++v93;
              }

              while (v93 < v92);
              DWORD2(v194) = v94;
              v91.n128_u64[0] = 0LL;
              int v74 = v191;
              if (v94 >= 1)
              {
                uint64_t v97 = 0LL;
                do
                  *(_BYTE *)(v195 + *(int *)(v194 + 4 * v97++)) = 0;
                while (v97 < SDWORD2(v194));
                uint64_t v98 = DWORD2(v194);
                if (SDWORD2(v194) >= 1)
                {
                  v91.n128_u64[0] = 0LL;
                  uint64_t v99 = (int *)v194;
                  do
                  {
                    uint64_t v100 = *v99++;
                    v91.n128_f64[0] = v91.n128_f64[0] + *(double *)(v196 + 8 * v100) * *(double *)(v196 + 8 * v100);
                    --v98;
                  }

                  while (v98);
                }
              }
            }

            v189(v90, v85, v91, *(double *)&v198);
            uint64_t v102 = DWORD2(v194);
            if (SDWORD2(v194) >= 1)
            {
              uint64_t v103 = (int *)v194;
              uint64_t v104 = v196;
              do
              {
                uint64_t v105 = *v103++;
                v18[v105] = v18[v105] + v101 * *(double *)(v104 + 8 * v105);
                v19[v105] = v19[v105] + v101 * (double)v76 * *(double *)(v104 + 8 * v105);
                --v102;
              }

              while (v102);
            }

            double v79 = v79 + v85;
          }

          else
          {
            int v74 = v191;
          }
        }

        ++v76;
        ++v78;
      }

      while (v78 != v74);
    }

    unsigned int v106 = v200;
    memcpy(v20, v18, __n);
    if (v106 && v186 >= 1)
    {
      __int128 v113 = v19;
      __int128 v114 = (double *)v20;
      uint64_t v115 = v184;
      do
      {
        double v116 = *v113++;
        *__int128 v114 = *v114 + -1.0 / (double)v76 * v116;
        ++v114;
        --v115;
      }

      while (v115);
    }

    uint64_t v188 = (v188 + 1);
    uint64_t v31 = v185;
    logging(v185, (uint64_t)"***** Iteration #%d *****\n", v107, v108, v109, v110, v111, v112, v188);
    logging(v185, (uint64_t)"Loss: %f\n", v117, v118, v119, v120, v121, v122, *(uint64_t *)&v79);
    double v129 = 0.0;
    if (v186 >= 1)
    {
      uint64_t v130 = v18;
      uint64_t v131 = v184;
      do
      {
        double v132 = *v130++;
        double v129 = v129 + v132 * v132;
        --v131;
      }

      while (v131);
    }

    logging(v185, (uint64_t)"Feature norm: %f\n", v123, v124, v125, v126, v127, v128, COERCE__INT64(sqrt(v129)));
    clock_t v133 = clock();
    logging( v185,  (uint64_t)"Seconds required for this iteration: %.3f\n",  v134,  v135,  v136,  v137,  v138,  v139,  COERCE__INT64((double)(v133 - v187) / 1000000.0));
    if (v183) {
      holdout_evaluation(a1, v183, (uint64_t)v20, v185);
    }
    logging(v185, (uint64_t)"\n", v140, v141, v142, v143, v144, v145, v176);
    if (v79 / v75 < *(double *)&v202)
    {
      logging(v185, (uint64_t)"Terminated with the stopping criterion\n", v146, v147, v148, v149, v150, v151, v177);
      logging(v185, (uint64_t)"\n", v152, v153, v154, v155, v156, v157, v178);
      break;
    }
  }

  clock_t v158 = clock();
  logging( v31,  (uint64_t)"Total seconds required for training: %.3f\n",  v159,  v160,  v161,  v162,  v163,  v164,  COERCE__INT64((double)(v158 - v180) / 1000000.0));
  logging(v31, (uint64_t)"\n", v165, v166, v167, v168, v169, v170, v179);
  uint64_t v171 = 0LL;
  unsigned int v172 = a6;
LABEL_65:
  free(v17);
  free(v19);
  free(v18);
  *unsigned int v172 = v20;
  delta_finish((void **)&v194);
  return v171;
}

double cost_sensitive(double a1, double a2)
{
  return sqrt(a2) + a1;
}

double cost_insensitive(double a1)
{
  return a1 + 1.0;
}

double tau1(double a1, double a2, double a3)
{
  double result = a1 / a2;
  if (result > a3) {
    return a3;
  }
  return result;
}

double tau2(double a1, double a2, double a3)
{
  return a1 / (0.5 / a3 + a2);
}

double tau0(double a1, double a2)
{
  return a1 / a2;
}

double delta_collect_0(uint64_t a1, int a2, double a3)
{
  int v6 = *(_DWORD *)(a1 + 8);
  int v7 = *(_DWORD *)(a1 + 12);
  double v8 = *(void **)a1;
  if (v7 <= v6)
  {
    int v9 = 2 * v7 + 2;
    *(_DWORD *)(a1 + 12) = v9;
    double v8 = realloc(v8, 4LL * v9);
    *(void *)a1 = v8;
    int v6 = *(_DWORD *)(a1 + 8);
  }

  *(_DWORD *)(a1 + 8) = v6 + 1;
  *((_DWORD *)v8 + vstd::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = a2;
  uint64_t v10 = *(void *)(a1 + 32);
  double result = *(double *)(v10 + 8LL * a2) + *(double *)(a1 + 24) * a3;
  *(double *)(v10 + 8LL * a2) = result;
  return result;
}

void *lbfgs_malloc(int a1)
{
  size_t v1 = 8LL * a1;
  uint64_t v2 = malloc(v1);
  unint64_t v3 = v2;
  if (v2) {
    bzero(v2, v1);
  }
  return v3;
}

void *vecalloc(size_t a1)
{
  uint64_t v2 = malloc(a1);
  unint64_t v3 = v2;
  if (v2) {
    bzero(v2, a1);
  }
  return v3;
}

double lbfgs_parameter_init(_OWORD *a1)
{
  a1[4] = xmmword_18744C7E0;
  a1[5] = unk_18744C7F0;
  a1[6] = xmmword_18744C800;
  *a1 = _defparam;
  a1[1] = unk_18744C7B0;
  double result = dbl_18744C7D0[0];
  a1[2] = xmmword_18744C7C0;
  a1[3] = *(_OWORD *)dbl_18744C7D0;
  return result;
}

uint64_t lbfgs( uint64_t a1, double *a2, double *a3, double (*a4)(void, void, void, void, double), uint64_t (*a5)(uint64_t, double *, uint64_t *, void, uint64_t, uint64_t, double, double, double, double), uint64_t a6, __int128 *a7)
{
  if (a7)
  {
    __int128 v12 = a7[5];
    __int128 v176 = a7[4];
    __int128 v177 = v12;
    __int128 v178 = a7[6];
    __int128 v13 = a7[1];
    __int128 v172 = *a7;
    __int128 v173 = v13;
    __int128 v14 = a7[3];
    __int128 v174 = a7[2];
    __int128 v175 = v14;
    int v15 = v172;
  }

  else
  {
    __int128 v176 = xmmword_18744C7E0;
    __int128 v177 = unk_18744C7F0;
    __int128 v178 = xmmword_18744C800;
    __int128 v172 = _defparam;
    __int128 v173 = unk_18744C7B0;
    __int128 v174 = xmmword_18744C7C0;
    __int128 v175 = *(_OWORD *)dbl_18744C7D0;
    int v15 = 6;
  }

  uint64_t v170 = a5;
  double v171 = 0.0;
  unsigned int v167 = a1;
  uint64_t v168 = a6;
  uint64_t v169 = a4;
  uint64_t v17 = v173;
  if ((v173 & 0x80000000) != 0) {
    return 4294966280LL;
  }
  if ((DWORD1(v174) & 0xFFFFFFFE) != 2
    || (uint64_t v16 = 4294966286LL, *((double *)&v176 + 1) > *(double *)&v176) && *((double *)&v176 + 1) < 1.0)
  {
    if (SDWORD2(v174) < 1) {
      return 4294966289LL;
    }
    double v18 = *(double *)&v178;
    uint64_t v16 = 4294966291LL;
    if ((DWORD2(v178) & 0x80000000) == 0 && SDWORD2(v178) <= (int)a1)
    {
      int v20 = HIDWORD(v178);
      if ((HIDWORD(v178) & 0x80000000) != 0)
      {
        HIDWORD(v178) = a1;
        int v20 = a1;
      }

      else if (HIDWORD(v178) > a1)
      {
        return 4294966292LL;
      }

      if (*(double *)&v178 == 0.0)
      {
        int v156 = DWORD2(v178);
        int v157 = v20;
        if (DWORD1(v174) <= 3)
        {
          uint64_t v21 = off_18A04E670[SDWORD1(v174)];
          goto LABEL_41;
        }
      }

      else if (DWORD1(v174) == 2)
      {
        int v156 = DWORD2(v178);
        int v157 = v20;
        uint64_t v21 = (uint64_t (*)(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t))line_search_backtracking_owlqn;
LABEL_41:
        clock_t v158 = v21;
        uint64_t v164 = (double *)vecalloc(8LL * a1);
        uint64_t v22 = (uint64_t *)vecalloc(8LL * a1);
        uint64_t v161 = vecalloc(8LL * a1);
        uint64_t v162 = (double *)vecalloc(8LL * a1);
        uint64_t v160 = vecalloc(8LL * a1);
        uint64_t v165 = 0LL;
        uint64_t v16 = 4294966274LL;
        uint64_t v163 = v22;
        if (!v164 || !v22)
        {
          uint64_t v24 = 0LL;
          uint64_t v166 = 0LL;
          goto LABEL_65;
        }

        uint64_t v23 = v161;
        if (v161 && v162)
        {
          uint64_t v24 = 0LL;
          uint64_t v166 = 0LL;
          if (v160)
          {
            if (*(double *)&v178 == 0.0)
            {
              uint64_t v165 = 0LL;
            }

            else
            {
              uint64_t v24 = (double *)vecalloc(8LL * a1);
              uint64_t v165 = v24;
              if (!v24)
              {
                uint64_t v165 = 0LL;
LABEL_62:
                uint64_t v166 = 0LL;
LABEL_65:
                uint64_t v23 = v161;
                goto LABEL_174;
              }
            }

            uint64_t v24 = (double *)vecalloc(32LL * v15);
            uint64_t v166 = (void **)v24;
            if (v24)
            {
              if (v15 < 1)
              {
LABEL_60:
                else {
                  uint64_t v155 = (double *)vecalloc(8 * v17);
                }
                double v29 = 0.0;
                double v30 = a4(a6, a2, v163, a1, 0.0);
                double v171 = v30;
                if (v18 != 0.0)
                {
                  if (v156 < v157)
                  {
                    uint64_t v31 = v157 - (uint64_t)v156;
                    uint64_t v32 = &a2[v156];
                    do
                    {
                      double v33 = *v32++;
                      double v29 = v29 + fabs(v33);
                      --v31;
                    }

                    while (v31);
                  }

                  double v30 = v30 + v29 * v18;
                  double v171 = v30;
                  owlqn_pseudo_gradient(v165, (uint64_t)a2, v163, a1, v156, v157, v18);
                }

                uint64_t v34 = a1;
                if (v155)
                {
                  *uint64_t v155 = v30;
                  double v18 = *(double *)&v178;
                }

                if (v18 == 0.0)
                {
                  uint64_t v36 = v162;
                  uint64_t v35 = (double *)v163;
                  uint64_t v37 = a1;
                  do
                  {
                    double v38 = *v35++;
                    *v36++ = -v38;
                    --v37;
                  }

                  while (v37);
                }

                else
                {
                  uint64_t v39 = v165;
                  uint64_t v40 = v162;
                  uint64_t v41 = a1;
                  do
                  {
                    double v42 = *v39++;
                    *v40++ = -v42;
                    --v41;
                  }

                  while (v41);
                }

                uint64_t v43 = 0LL;
                double v44 = 0.0;
                do
                {
                  double v44 = v44 + a2[v43] * a2[v43];
                  ++v43;
                }

                while (a1 != v43);
                double v45 = sqrt(v44);
                double v46 = 0.0;
                if (*(double *)&v178 == 0.0)
                {
                  uint64_t v47 = (double *)v163;
                  uint64_t v48 = a1;
                  do
                  {
                    double v49 = *v47++;
                    double v46 = v46 + v49 * v49;
                    --v48;
                  }

                  while (v48);
                }

                else
                {
                  uint64_t v50 = v165;
                  uint64_t v51 = a1;
                  do
                  {
                    double v52 = *v50++;
                    double v46 = v46 + v52 * v52;
                    --v51;
                  }

                  while (v51);
                }

                double v53 = sqrt(v46);
                if (v45 < 1.0) {
                  double v45 = 1.0;
                }
                if (v53 / v45 <= *((double *)&v172 + 1))
                {
                  uint64_t v16 = 2LL;
                }

                else
                {
                  uint64_t v54 = 0LL;
                  double v55 = 0.0;
                  do
                  {
                    double v55 = v55 + v162[v54] * v162[v54];
                    ++v54;
                  }

                  while (a1 != v54);
                  int v159 = 0;
                  double v56 = 1.0 / sqrt(v55);
                  uint64_t v57 = 1LL;
                  while (1)
                  {
                    uint64_t v58 = 0LL;
                    int v59 = v15 >= (int)v57 ? v57 : v15;
                    int v60 = v59 <= 1 ? 1 : v59;
                    v179[0] = v56;
                    do
                    {
                      v164[v58] = a2[v58];
                      ++v58;
                    }

                    while (a1 != v58);
                    uint64_t v61 = 0LL;
                    do
                    {
                      *((void *)v161 + v61) = v163[v61];
                      ++v61;
                    }

                    while (a1 != v61);
                    if (*(double *)&v178 == 0.0)
                    {
                      uint64_t v16 = ((uint64_t (*)(uint64_t, double *, double *, uint64_t *, double *, double *, double *, double))v158)( a1,  a2,  &v171,  v163,  v162,  v179,  v164,  *(double *)&v178);
                    }

                    else
                    {
                      uint64_t v16 = ((uint64_t (*)(uint64_t, double *, double *, uint64_t *, double *, double *, double *, double *, double, void *, unsigned int *, __int128 *))v158)( a1,  a2,  &v171,  v163,  v162,  v179,  v164,  v165,  *(double *)&v178,  v160,  &v167,  &v172);
                      owlqn_pseudo_gradient( v165,  (uint64_t)a2,  v163,  a1,  SDWORD2(v178),  SHIDWORD(v178),  *(double *)&v178);
                    }

                    if ((v16 & 0x80000000) != 0) {
                      break;
                    }
                    uint64_t v62 = 0LL;
                    double v63 = 0.0;
                    do
                    {
                      double v63 = v63 + a2[v62] * a2[v62];
                      ++v62;
                    }

                    while (a1 != v62);
                    if (*(double *)&v178 == 0.0)
                    {
                      double v64 = 0.0;
                      uint64_t v65 = (double *)v163;
                      uint64_t v66 = a1;
                      do
                      {
                        double v67 = *v65++;
                        double v64 = v64 + v67 * v67;
                        --v66;
                      }

                      while (v66);
                    }

                    else
                    {
                      double v64 = 0.0;
                      uint64_t v68 = v165;
                      uint64_t v69 = a1;
                      do
                      {
                        double v70 = *v68++;
                        double v64 = v64 + v70 * v70;
                        --v69;
                      }

                      while (v69);
                    }

                    double v71 = sqrt(v63);
                    double v72 = sqrt(v64);
                    if (v170)
                    {
                      uint64_t v73 = v170(v168, a2, v163, v167, v57, v16, v171, v71, v72, v179[0]);
                      if ((_DWORD)v73)
                      {
                        uint64_t v16 = v73;
                        goto LABEL_173;
                      }
                    }

                    if (v71 >= 1.0) {
                      double v74 = v71;
                    }
                    else {
                      double v74 = 1.0;
                    }
                    if (v72 / v74 <= *((double *)&v172 + 1))
                    {
                      uint64_t v16 = 0LL;
                      goto LABEL_173;
                    }

                    uint64_t v24 = v155;
                    if (v155)
                    {
                      uint64_t v75 = ((int)v57 % (int)v173);
                      if ((int)v173 <= (int)v57 && (v155[v75] - v171) / v171 < *((double *)&v173 + 1))
                      {
                        uint64_t v16 = 1LL;
                        goto LABEL_65;
                      }

                      v155[v75] = v171;
                    }

                    if ((_DWORD)v174 && (int)v174 <= (int)v57)
                    {
                      uint64_t v16 = 4294966299LL;
                      goto LABEL_173;
                    }

                    int v76 = (double *)v166[4 * v159 + 1];
                    clock_t v77 = a2;
                    int v78 = v164;
                    double v79 = v76;
                    uint64_t v80 = a1;
                    do
                    {
                      double v81 = *v77++;
                      double v82 = v81;
                      double v83 = *v78++;
                      *v79++ = v82 - v83;
                      --v80;
                    }

                    while (v80);
                    uint64_t v84 = (double *)v166[4 * v159 + 2];
                    double v85 = v163;
                    uint64_t v86 = (double *)v161;
                    uint64_t v87 = v84;
                    uint64_t v88 = a1;
                    do
                    {
                      double v89 = *(double *)v85++;
                      double v90 = v89;
                      double v91 = *v86++;
                      *v87++ = v90 - v91;
                      --v88;
                    }

                    while (v88);
                    double v92 = 0.0;
                    uint64_t v93 = v84;
                    uint64_t v94 = a1;
                    do
                    {
                      double v95 = *v93++;
                      double v96 = v95;
                      double v97 = *v76++;
                      double v92 = v92 + v96 * v97;
                      --v94;
                    }

                    while (v94);
                    double v98 = 0.0;
                    uint64_t v99 = a1;
                    do
                    {
                      double v100 = *v84++;
                      double v98 = v98 + v100 * v100;
                      --v99;
                    }

                    while (v99);
                    *(double *)&v166[4 * v159 + 3] = v92;
                    double v101 = v165;
                    uint64_t v102 = v162;
                    uint64_t v103 = a1;
                    if (*(double *)&v178 == 0.0)
                    {
                      uint64_t v104 = (double *)v163;
                      uint64_t v105 = v162;
                      uint64_t v106 = a1;
                      do
                      {
                        double v107 = *v104++;
                        *v105++ = -v107;
                        --v106;
                      }

                      while (v106);
                    }

                    else
                    {
                      do
                      {
                        double v108 = *v101++;
                        *v102++ = -v108;
                        --v103;
                      }

                      while (v103);
                    }

                    int v109 = (v159 + 1) % v15;
                    int v159 = v109;
                    if (v15 >= 1)
                    {
                      for (int i = 0; i != v60; ++i)
                      {
                        int v109 = (v15 - 1 + v109) % v15;
                        uint64_t v111 = (double *)&v166[4 * v109];
                        uint64_t v112 = (double *)*((void *)v111 + 1);
                        *uint64_t v111 = 0.0;
                        double v113 = 0.0;
                        __int128 v114 = v162;
                        uint64_t v115 = a1;
                        do
                        {
                          double v116 = *v112++;
                          double v117 = v116;
                          double v118 = *v114++;
                          double v113 = v113 + v117 * v118;
                          *uint64_t v111 = v113;
                          --v115;
                        }

                        while (v115);
                        uint64_t v119 = (char *)&v166[4 * v109];
                        double v120 = v113 / *((double *)v119 + 3);
                        *uint64_t v111 = v120;
                        uint64_t v121 = (double *)*((void *)v119 + 2);
                        double v122 = -v120;
                        uint64_t v123 = v162;
                        uint64_t v124 = a1;
                        do
                        {
                          double v125 = *v121++;
                          *uint64_t v123 = *v123 + v122 * v125;
                          ++v123;
                          --v124;
                        }

                        while (v124);
                      }
                    }

                    uint64_t v57 = (v57 + 1);
                    uint64_t v126 = v162;
                    uint64_t v127 = a1;
                    double v128 = v92 / v98;
                    do
                    {
                      *uint64_t v126 = v128 * *v126;
                      ++v126;
                      --v127;
                    }

                    while (v127);
                    if (v15 >= 1)
                    {
                      for (int j = 0; j != v60; ++j)
                      {
                        uint64_t v130 = (double *)v166[4 * v109 + 2];
                        double v131 = 0.0;
                        double v132 = v162;
                        uint64_t v133 = a1;
                        do
                        {
                          double v134 = *v130++;
                          double v135 = v134;
                          double v136 = *v132++;
                          double v131 = v131 + v135 * v136;
                          --v133;
                        }

                        while (v133);
                        uint64_t v137 = (char *)&v166[4 * v109];
                        uint64_t v138 = (double *)*((void *)v137 + 1);
                        double v139 = *(double *)v137 - v131 / *((double *)v137 + 3);
                        uint64_t v140 = v162;
                        uint64_t v141 = a1;
                        do
                        {
                          double v142 = *v138++;
                          *uint64_t v140 = *v140 + v139 * v142;
                          ++v140;
                          --v141;
                        }

                        while (v141);
                        int v109 = (v109 + 1) % v15;
                      }
                    }

                    double v56 = 1.0;
                    if (*(double *)&v178 != 0.0 && SDWORD2(v178) < SHIDWORD(v178))
                    {
                      uint64_t v143 = &v162[SDWORD2(v178)];
                      uint64_t v144 = SHIDWORD(v178) - (uint64_t)SDWORD2(v178);
                      uint64_t v145 = &v165[SDWORD2(v178)];
                      do
                      {
                        if (*v143 * *v145 >= 0.0) {
                          *uint64_t v143 = 0.0;
                        }
                        ++v143;
                        ++v145;
                        --v144;
                      }

                      while (v144);
                    }
                  }

                  uint64_t v146 = v164;
                  uint64_t v147 = a1;
                  do
                  {
                    uint64_t v148 = *(void *)v146++;
                    *(void *)a2++ = v148;
                    --v147;
                  }

                  while (v147);
                  uint64_t v149 = (uint64_t *)v161;
                  uint64_t v150 = v163;
                  do
                  {
                    uint64_t v151 = *v149++;
                    *v150++ = v151;
                    --v34;
                  }

                  while (v34);
                }

LABEL_173:
                uint64_t v23 = v161;
                uint64_t v24 = v155;
                goto LABEL_174;
              }

              uint64_t v25 = 0LL;
              while (1)
              {
                uint64_t v26 = (char *)&v166[v25];
                *(void *)uint64_t v26 = 0LL;
                *((void *)v26 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = 0LL;
                *((void *)v26 + 1) = vecalloc(8LL * a1);
                uint64_t v27 = vecalloc(8LL * a1);
                *((void *)v26 + 2) = v27;
                if (!v166[v25 + 1] || v27 == 0LL) {
                  break;
                }
                v25 += 4LL;
              }

              uint64_t v24 = 0LL;
              uint64_t v16 = 4294966274LL;
              goto LABEL_65;
            }

            goto LABEL_62;
          }
        }

        else
        {
          uint64_t v24 = 0LL;
          uint64_t v166 = 0LL;
        }

LABEL_174:
        if (a3) {
          *a3 = v171;
        }
        free(v24);
        if (v166)
        {
          if (v15 >= 1)
          {
            uint64_t v152 = v15;
            uint64_t v153 = v166 + 2;
            do
            {
              free(*(v153 - 1));
              uint64_t v154 = *v153;
              v153 += 4;
              free(v154);
              --v152;
            }

            while (v152);
          }

          free(v166);
        }

        free(v165);
        free(v160);
        free(v162);
        free(v23);
        free(v163);
        free(v164);
        return v16;
      }

      return 4294966282LL;
    }
  }

  return v16;
}

uint64_t line_search_morethuente( int a1, void *a2, double *a3, double *a4, double *a5, double *a6, uint64_t *a7, __n128 a8, uint64_t a9, uint64_t a10, unsigned int *a11, uint64_t a12)
{
  if (*a6 <= 0.0) {
    return 4294966301LL;
  }
  uint64_t v15 = a1;
  double v16 = 0.0;
  if (a1 < 1) {
    goto LABEL_9;
  }
  uint64_t v17 = a4;
  double v18 = a5;
  uint64_t v19 = a1;
  do
  {
    double v20 = *v17++;
    double v21 = v20;
    double v22 = *v18++;
    double v16 = v16 + v21 * v22;
    --v19;
  }

  while (v19);
  if (v16 <= 0.0)
  {
LABEL_9:
    int v25 = 0;
    int updated = 0;
    LODWORD(v2std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = 0;
    v81[0] = 0;
    double v27 = *a3;
    double v28 = v16 * *(double *)(a12 + 64);
    double v29 = *(double *)(a12 + 56) - *(double *)(a12 + 48);
    double v63 = v29 + v29;
    double v76 = 0.0;
    double v79 = 0.0;
    double v74 = v16;
    double v75 = v27;
    double v77 = v16;
    double v78 = v27;
    int v67 = 1;
LABEL_10:
    double v31 = v29;
    while (1)
    {
      double v32 = v79;
      if (v25)
      {
        if (v79 > v76) {
          double v33 = v76;
        }
        else {
          double v33 = v79;
        }
        if (v79 < v76) {
          double v34 = v76;
        }
        else {
          double v34 = v79;
        }
        a8.n128_f64[0] = *a6;
      }

      else
      {
        a8.n128_f64[0] = *a6;
        double v34 = *a6 + (*a6 - v79) * 4.0;
        double v33 = v79;
      }

      double v35 = *(double *)(a12 + 48);
      if (a8.n128_f64[0] < v35)
      {
        *a6 = v35;
        a8.n128_f64[0] = v35;
      }

      double v36 = *(double *)(a12 + 56);
      if (v36 < a8.n128_f64[0])
      {
        *a6 = v36;
        a8.n128_f64[0] = v36;
      }

      if (v25)
      {
        BOOL v37 = a8.n128_f64[0] > v33 && v34 > a8.n128_f64[0];
        if (!v37 || *(_DWORD *)(a12 + 40) <= (int)v23 + 1 || updated || v34 - v33 <= v34 * *(double *)(a12 + 88))
        {
          *a6 = v32;
          a8.n128_f64[0] = v32;
        }
      }

      if (a1 >= 1)
      {
        double v38 = a7;
        uint64_t v39 = a2;
        uint64_t v40 = v15;
        do
        {
          uint64_t v41 = *v38++;
          *v39++ = v41;
          --v40;
        }

        while (v40);
        double v42 = *a6;
        uint64_t v43 = a5;
        double v44 = (double *)a2;
        uint64_t v45 = v15;
        do
        {
          double v46 = *v43++;
          *double v44 = *v44 + v42 * v46;
          ++v44;
          --v45;
        }

        while (v45);
        a8.n128_f64[0] = *a6;
      }

      double v47 = (*((double (**)(void, void *, double *, void, __n128))a11 + 2))( *((void *)a11 + 1),  a2,  a4,  *a11,  a8);
      *a3 = v47;
      double v80 = 0.0;
      double v48 = 0.0;
      if (a1 >= 1)
      {
        double v49 = a4;
        uint64_t v50 = a5;
        uint64_t v51 = v15;
        do
        {
          double v52 = *v49++;
          double v53 = v52;
          double v54 = *v50++;
          double v48 = v48 + v53 * v54;
          --v51;
        }

        while (v51);
        double v80 = v48;
      }

      double v55 = *a6;
      if (v25)
      {
        if (v55 <= v33) {
          return 4294966295LL;
        }
        if (v34 <= v55 || updated != 0) {
          return 4294966295LL;
        }
      }

      double v57 = v27 + v55 * v28;
      uint64_t v23 = (v23 + 1);
      if (v47 <= v57)
      {
        double v61 = *(double *)(a12 + 80);
        if (fabs(v48) <= v61 * -v16) {
          return v23;
        }
        if (!v67) {
          goto LABEL_69;
        }
        if (v16 * v61 <= v48)
        {
LABEL_69:
          int v67 = 0;
LABEL_83:
          int updated = update_trial_interval(&v79, &v78, &v77, &v76, &v75, &v74, a6, a3, v33, v34, &v80, v81);
          goto LABEL_84;
        }
      }

      else if (!v67)
      {
        goto LABEL_69;
      }

      if (v57 >= v47 || v47 > v78)
      {
        int v67 = 1;
        goto LABEL_83;
      }

      double v68 = v48 - v28;
      double v69 = v47 - v55 * v28;
      double v72 = v77 - v28;
      double v73 = v78 - v32 * v28;
      double v70 = v74 - v28;
      double v71 = v75 - v76 * v28;
      int updated = update_trial_interval(&v79, &v73, &v72, &v76, &v71, &v70, a6, &v69, v33, v34, &v68, v81);
      double v77 = v28 + v72;
      double v78 = v73 + v79 * v28;
      double v74 = v28 + v70;
      double v75 = v71 + v76 * v28;
      int v67 = 1;
LABEL_84:
      int v25 = v81[0];
      if (v81[0])
      {
        double v29 = vabdd_f64(v76, v79);
        int v25 = 1;
        BOOL v37 = v63 * 0.66 > v29;
        double v63 = v31;
        if (!v37)
        {
          *a6 = v79 + (v76 - v79) * 0.5;
          double v63 = v31;
        }

        goto LABEL_10;
      }
    }
  }

  return 4294966302LL;
}

uint64_t line_search_backtracking_owlqn( int a1, void *a2, double *a3, uint64_t a4, double *a5, double *a6, double *a7, double *a8, double *a9, unsigned int *a10, uint64_t a11)
{
  if (*a6 <= 0.0) {
    return 4294966301LL;
  }
  uint64_t v17 = a1;
  double v18 = *a3;
  if (a1 >= 1)
  {
    uint64_t v19 = a1;
    double v20 = a7;
    double v21 = a8;
    double v22 = a9;
    do
    {
      double v23 = *v20;
      if (*v20 == 0.0) {
        double v23 = -*v21;
      }
      *v22++ = v23;
      ++v21;
      ++v20;
      --v19;
    }

    while (v19);
  }

  LODWORD(v24) = 0;
  while (1)
  {
    if (a1 >= 1)
    {
      int v25 = a7;
      uint64_t v26 = a2;
      uint64_t v27 = v17;
      do
      {
        uint64_t v28 = *(void *)v25++;
        *v26++ = v28;
        --v27;
      }

      while (v27);
      double v29 = *a6;
      double v30 = a5;
      double v31 = (double *)a2;
      uint64_t v32 = v17;
      do
      {
        double v33 = *v30++;
        *double v31 = *v31 + v29 * v33;
        ++v31;
        --v32;
      }

      while (v32);
    }

    uint64_t v35 = *(int *)(a11 + 104);
    uint64_t v34 = *(int *)(a11 + 108);
    if ((int)v35 < (int)v34)
    {
      uint64_t v36 = v34 - v35;
      BOOL v37 = &a9[v35];
      double v38 = (double *)&a2[v35];
      do
      {
        if (*v38 * *v37 <= 0.0) {
          *double v38 = 0.0;
        }
        ++v37;
        ++v38;
        --v36;
      }

      while (v36);
    }

    double v39 = (*((double (**)(void, void *, uint64_t, void, double))a10 + 2))( *((void *)a10 + 1),  a2,  a4,  *a10,  *a6);
    *a3 = v39;
    uint64_t v41 = *(int *)(a11 + 104);
    uint64_t v40 = *(int *)(a11 + 108);
    double v42 = 0.0;
    double v43 = 0.0;
    if ((int)v41 < (int)v40)
    {
      uint64_t v44 = v40 - v41;
      uint64_t v45 = (double *)&a2[v41];
      do
      {
        double v46 = *v45++;
        double v43 = v43 + fabs(v46);
        --v44;
      }

      while (v44);
    }

    double v47 = v39 + v43 * *(double *)(a11 + 96);
    *a3 = v47;
    if (a1 >= 1)
    {
      double v42 = 0.0;
      uint64_t v48 = v17;
      double v49 = (double *)a2;
      uint64_t v50 = a7;
      uint64_t v51 = a8;
      do
      {
        double v52 = *v49++;
        double v53 = v52;
        double v54 = *v50++;
        double v55 = v53 - v54;
        double v56 = *v51++;
        double v42 = v42 + v55 * v56;
        --v48;
      }

      while (v48);
    }

    uint64_t v24 = (v24 + 1);
    double v57 = *a6;
    *a6 = v57 * 0.5;
  }

  return v24;
}

uint64_t line_search_backtracking( int a1, void *a2, double *a3, double *a4, double *a5, unint64_t *a6, uint64_t *a7, __n128 a8, uint64_t a9, uint64_t a10, unsigned int *a11, uint64_t a12)
{
  a8.n128_u64[0] = *a6;
  uint64_t v18 = a1;
  double v19 = 0.0;
  if (a1 < 1) {
    goto LABEL_9;
  }
  double v20 = a4;
  double v21 = a5;
  uint64_t v22 = a1;
  do
  {
    double v23 = *v20++;
    double v24 = v23;
    double v25 = *v21++;
    double v19 = v19 + v24 * v25;
    --v22;
  }

  while (v22);
  if (v19 > 0.0) {
    return 4294966302LL;
  }
LABEL_9:
  LODWORD(v2std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
  double v28 = *a3;
  double v29 = v19 * *(double *)(a12 + 64);
  while (1)
  {
    if (a1 >= 1)
    {
      double v30 = a7;
      double v31 = a2;
      uint64_t v32 = v18;
      do
      {
        uint64_t v33 = *v30++;
        *v31++ = v33;
        --v32;
      }

      while (v32);
      double v34 = *(double *)a6;
      uint64_t v35 = a5;
      uint64_t v36 = (double *)a2;
      uint64_t v37 = v18;
      do
      {
        double v38 = *v35++;
        *uint64_t v36 = *v36 + v34 * v38;
        ++v36;
        --v37;
      }

      while (v37);
      a8.n128_u64[0] = *a6;
    }

    a8.n128_f64[0] = (*((double (**)(void, void *, double *, void, __n128))a11 + 2))( *((void *)a11 + 1),  a2,  a4,  *a11,  a8);
    *a3 = a8.n128_f64[0];
    uint64_t v26 = (v26 + 1);
    double v39 = *(double *)a6;
    double v40 = 0.5;
    if (a8.n128_f64[0] <= v28 + *(double *)a6 * v29)
    {
      int v41 = *(_DWORD *)(a12 + 36);
      if (v41 == 1) {
        break;
      }
      double v42 = 0.0;
      if (a1 >= 1)
      {
        double v43 = a4;
        uint64_t v44 = a5;
        uint64_t v45 = v18;
        do
        {
          double v46 = *v43++;
          double v47 = v46;
          double v48 = *v44++;
          double v42 = v42 + v47 * v48;
          --v45;
        }

        while (v45);
      }

      double v49 = *(double *)(a12 + 72);
      double v40 = 2.1;
      if (v42 >= v19 * v49)
      {
        if (v41 == 2) {
          break;
        }
        double v40 = 0.5;
        if (v42 <= -(v49 * v19)) {
          break;
        }
      }
    }

    a8.n128_f64[0] = v39 * v40;
    *(double *)a6 = v39 * v40;
  }

  return v26;
}

double owlqn_pseudo_gradient(void *a1, uint64_t a2, uint64_t *a3, int a4, int a5, int a6, double result)
{
  if (a5 >= 1)
  {
    uint64_t v7 = a5;
    double v8 = a3;
    int v9 = a1;
    do
    {
      uint64_t v10 = *v8++;
      *v9++ = v10;
      --v7;
    }

    while (v7);
  }

  if (a5 < a6)
  {
    int v11 = (double *)&a1[a5];
    __int128 v12 = (double *)(a2 + 8LL * a5);
    __int128 v13 = (double *)&a3[a5];
    uint64_t v14 = a6 - (uint64_t)a5;
    do
    {
      if (*v12 >= 0.0)
      {
        double v16 = *v13;
        double v17 = *v13 - result;
        if (*v13 <= result) {
          double v17 = 0.0;
        }
        double v18 = v16 + result;
        if (v16 < -result) {
          double v19 = v16 + result;
        }
        else {
          double v19 = v17;
        }
        if (*v12 > 0.0) {
          double v15 = v18;
        }
        else {
          double v15 = v19;
        }
      }

      else
      {
        double v15 = *v13 - result;
      }

      *v11++ = v15;
      ++v12;
      ++v13;
      --v14;
    }

    while (v14);
  }

  if (a6 < a4)
  {
    double v20 = (double *)&a3[a6];
    double v21 = (double *)&a1[a6];
    uint64_t v22 = a4 - (uint64_t)a6;
    do
    {
      double v23 = *v20++;
      double result = v23;
      *v21++ = v23;
      --v22;
    }

    while (v22);
  }

  return result;
}

uint64_t update_trial_interval( double *a1, double *a2, double *a3, double *a4, double *a5, double *a6, double *a7, double *a8, double a9, double a10, double *a11, int *a12)
{
  double v12 = *a11;
  double v13 = *a3;
  int v14 = *a12;
  if (*a12)
  {
    double v15 = *a7;
    double v16 = *a1;
    double v17 = *a4;
    if (*a1 > *a4) {
      double v18 = *a4;
    }
    else {
      double v18 = *a1;
    }
    if (v15 <= v18) {
      return 4294966293LL;
    }
    if (v16 >= v17) {
      double v17 = *a1;
    }
    if (v17 <= v15) {
      return 4294966293LL;
    }
    if (v13 * (v15 - v16) >= 0.0) {
      return 4294966302LL;
    }
    if (a10 < a9) {
      return 4294966294LL;
    }
  }

  double v20 = fabs(v13);
  double v21 = *a2;
  double v22 = *a8;
  if (*a2 >= *a8)
  {
    if (v12 * (v13 / v20) >= 0.0)
    {
      double v48 = fabs(v12);
      double v47 = *a7;
      if (v48 >= v20)
      {
        int v37 = 0;
        if (v14)
        {
          double v63 = *a4 - v47;
          double v64 = v12 + (v22 - *a5) * 3.0 / v63;
          double v65 = *a6;
          double v66 = *a6 + v64;
          double v67 = fabs(v66);
          double v68 = fabs(*a6);
          if (v67 >= v48) {
            double v48 = v67;
          }
          if (v48 < v68) {
            double v48 = v68;
          }
          double v69 = v48 * sqrt(-v12 / v48 * (v65 / v48) + v66 / v48 * (v66 / v48));
          if (*a4 >= v47) {
            double v70 = v69;
          }
          else {
            double v70 = -v69;
          }
          double v32 = v47 + (v66 + v70 - v12) / (v65 + v70 + v70 - v12) * v63;
        }

        else if (*a1 >= v47)
        {
          double v32 = a9;
        }

        else
        {
          double v32 = a10;
        }
      }

      else
      {
        double v49 = *a1;
        double v50 = v47 - *a1;
        double v51 = v12 + v13 + (v21 - v22) * 3.0 / v50;
        double v52 = fabs(v51);
        if (v52 >= v20) {
          double v20 = v52;
        }
        if (v20 < v48) {
          double v20 = v48;
        }
        double v53 = v51 / v20;
        double v54 = -v13 / v20 * (v12 / v20) + v53 * v53;
        if (v54 <= 0.0) {
          double v54 = 0.0;
        }
        double v55 = v20 * sqrt(v54);
        double v56 = -v55;
        if (v49 >= v47) {
          double v56 = v55;
        }
        double v57 = (v51 + v56 - v12) / (v13 + v56 + v56 - v12);
        if (v53 >= 0.0) {
          double v58 = a9;
        }
        else {
          double v58 = a10;
        }
        BOOL v59 = v57 >= 0.0 || v56 == 0.0;
        double v60 = v47 - v57 * v50;
        if (v59) {
          double v60 = v58;
        }
        double v32 = v47 + v12 / (v12 - v13) * (v49 - v47);
        double v61 = vabdd_f64(v47, v60);
        double v62 = vabdd_f64(v47, v32);
        if (v14)
        {
          if (v61 < v62) {
            double v32 = v60;
          }
        }

        else if (v61 > v62)
        {
          double v32 = v60;
        }

        int v37 = 1;
      }
    }

    else
    {
      int v37 = 0;
      int v14 = 1;
      *a12 = 1;
      double v38 = *a7;
      double v39 = *a1;
      double v40 = *a7 - *a1;
      double v41 = v12 + v13 + (v21 - v22) * 3.0 / v40;
      double v42 = fabs(v41);
      double v43 = fabs(v12);
      if (v42 >= v20) {
        double v20 = v42;
      }
      if (v20 < v43) {
        double v20 = v43;
      }
      double v44 = v20 * sqrt(-v13 / v20 * (v12 / v20) + v41 / v20 * (v41 / v20));
      double v45 = -v44;
      if (v38 >= v39) {
        double v45 = v44;
      }
      double v46 = v39 + (v41 + v45 - v13) / (v12 + v45 + v45 - v13) * v40;
      double v32 = v38 + v12 / (v12 - v13) * (v39 - v38);
      if (vabdd_f64(v46, v38) > vabdd_f64(v32, v38)) {
        double v32 = v46;
      }
      *a4 = v39;
      *a5 = *a2;
      *a6 = *a3;
      double v47 = *a7;
    }

    *a1 = v47;
  }

  else
  {
    int v14 = 1;
    *a12 = 1;
    double v23 = *a7;
    double v24 = *a1;
    double v25 = *a7 - *a1;
    double v26 = v21 - v22;
    double v27 = v12 + v13 + v26 * 3.0 / v25;
    double v28 = fabs(v27);
    double v29 = fabs(v12);
    if (v28 >= v20) {
      double v20 = v28;
    }
    if (v20 < v29) {
      double v20 = v29;
    }
    double v30 = v20 * sqrt(-v13 / v20 * (v12 / v20) + v27 / v20 * (v27 / v20));
    double v31 = -v30;
    if (v23 >= v24) {
      double v31 = v30;
    }
    double v32 = v24 + (v27 + v31 - v13) / (v12 + v31 + v31 - v13) * v25;
    double v33 = v24 + v13 / (v13 + v26 / v25) * 0.5 * v25;
    double v34 = vabdd_f64(v32, v24);
    double v35 = vabdd_f64(v33, v24);
    double v36 = v32 + (v33 - v32) * 0.5;
    if (v34 >= v35) {
      double v32 = v36;
    }
    *a4 = v23;
    a2 = a5;
    a3 = a6;
    int v37 = 1;
  }

  *a2 = *a8;
  *a3 = *a11;
  if (v32 <= a10) {
    a10 = v32;
  }
  if (a10 >= a9) {
    a9 = a10;
  }
  if (v37 && v14)
  {
    double v71 = *a1 + (*a4 - *a1) * 0.66;
    if (*a1 < *a4)
    {
      if (v71 >= a9) {
        goto LABEL_83;
      }
      goto LABEL_82;
    }

    if (a9 < v71) {
LABEL_82:
    }
      a9 = *a1 + (*a4 - *a1) * 0.66;
  }

LABEL_83:
  uint64_t result = 0LL;
  *a7 = a9;
  return result;
}

void *crf_output_init(void *result)
{
  *uint64_t result = 0LL;
  result[1] = 0LL;
  result[2] = 0LL;
  return result;
}

void *crf_output_init_n(void *a1, int a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  uint64_t result = calloc(a2, 4uLL);
  a1[1] = result;
  if (result) {
    *(_DWORD *)a1 = a2;
  }
  return result;
}

void crf_output_finish(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
}

uint64_t crf_paragraph_get_item_count(uint64_t a1, unsigned int a2)
{
  else {
    return *(unsigned int *)(*(void *)(a1 + 24) + 4LL * a2);
  }
}

uint64_t crf_paragraph_get_item_count_for_sentence(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  int v2 = *(_DWORD *)(a1 + 12);
  uint64_t v3 = *(void *)(a1 + 24);
  if (a2 + 1 == v2) {
    uint64_t v4 = (_DWORD *)(a1 + 4);
  }
  else {
    uint64_t v4 = (_DWORD *)(v3 + 4LL * (a2 + 1));
  }
  return (*v4 - *(_DWORD *)(v3 + 4LL * a2));
}

uint64_t crf_paragraph_get_id(uint64_t a1, unsigned int a2, int a3, int a4)
{
  else {
    int v4 = *(_DWORD *)(*(void *)(a1 + 24) + 4LL * a2);
  }
  int v5 = a4 + (v4 + a3) * *(_DWORD *)a1;
  if (v5 < 0 || v5 >= *(_DWORD *)(a1 + 4) * *(_DWORD *)a1) {
    crf_paragraph_get_id_cold_1();
  }
  return *(unsigned int *)(*(void *)(a1 + 32) + 4LL * v5);
}

void crf_paragraph_set_id(int *a1, int a2, int a3, int a4, int a5)
{
  if (a1[3] == a2) {
    *(_DWORD *)(*((void *)a1 + 3) + 4LL * a2) = a1[1];
  }
  if (a2 < 0 || a1[3] < a2) {
    int v8 = -1;
  }
  else {
    int v8 = *(_DWORD *)(*((void *)a1 + 3) + 4LL * a2);
  }
  int v9 = v8 + a3;
  uint64_t v10 = *a1;
  unsigned int v11 = a4 + v9 * v10;
  if ((v11 & 0x80000000) != 0) {
    crf_paragraph_set_id_cold_1();
  }
  uint64_t v12 = a1[2];
  if ((int)(v11 + 1) >= (int)v12 * (int)v10)
  {
    uint64_t v13 = 4 * v10;
    uint64_t v14 = v13 * v12;
    int v15 = 2 * v12;
    a1[2] = v15;
    size_t v16 = v13 * v15;
    double v17 = (char *)realloc(*((void **)a1 + 4), v16);
    *((void *)a1 + 4) = v17;
    bzero(&v17[v14], v16 - v14);
  }

  uint64_t v18 = a1[4];
  if (a2 + 1 >= (int)v18)
  {
    a1[4] = 2 * v18;
    *((void *)a1 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = realloc(*((void **)a1 + 3), 8 * v18);
  }

  if (a1[3] == a2) {
    a1[3] = a2 + 1;
  }
  if (v9 == a1[1]) {
    a1[1] = v9 + 1;
  }
  *(_DWORD *)(*((void *)a1 + 4) + 4LL * v11) = a5;
}

double crf_data_init(_OWORD *a1)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

double crf_data_finish(int *a1)
{
  if (*a1 >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
    do
    {
      crf_sequence_finish((int *)(*((void *)a1 + 3) + v2));
      ++v3;
      v2 += 16LL;
    }

    while (v3 < *a1);
  }

  free(*((void **)a1 + 3));
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

void crf_sequence_finish(int *a1)
{
  if (*a1 >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
    do
    {
      uint64_t v4 = *((void *)a1 + 1) + v2;
      free(*(void **)(v4 + 8));
      *(void *)uint64_t v4 = 0LL;
      *(void *)(v4 + 8) = 0LL;
      *(void *)(v4 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
      ++v3;
      v2 += 24LL;
    }

    while (v3 < *a1);
  }

  free(*((void **)a1 + 1));
  *(void *)a1 = 0LL;
  *((void *)a1 + 1) = 0LL;
}

uint64_t crf_data_append(int *a1, uint64_t *a2)
{
  if (*(int *)a2 >= 1)
  {
    int v4 = *a1;
    int v5 = a1[1];
    if (v5 <= *a1)
    {
      int v7 = 2 * v5 + 2;
      a1[1] = v7;
      int v6 = (int *)realloc(*((void **)a1 + 3), 16LL * v7);
      *((void *)a1 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v6;
      int v4 = *a1;
    }

    else
    {
      int v6 = (int *)*((void *)a1 + 3);
    }

    *a1 = v4 + 1;
    crf_sequence_copy(&v6[4 * v4], a2);
  }

  return 0LL;
}

void crf_sequence_copy(int *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = calloc((int)v4, 0x18uLL);
  if (*a1 >= 1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    do
    {
      crf_item_copy((unsigned int *)(*((void *)a1 + 1) + v5), (uint64_t *)(a2[1] + v5));
      ++v6;
      v5 += 24LL;
    }

    while (v6 < *a1);
  }

unint64_t crf_data_maxlength(unint64_t result)
{
  uint64_t v1 = *(unsigned int *)result;
  unint64_t v2 = result;
  LODWORD(result) = 0;
  uint64_t v3 = *(int **)(v2 + 24);
  do
  {
    int v5 = *v3;
    v3 += 4;
    unsigned int v4 = v5;
    else {
      double result = result;
    }
    --v1;
  }

  while (v1);
  return result;
}

unint64_t crf_data_totalitems(unint64_t result)
{
  uint64_t v1 = *(unsigned int *)result;
  unint64_t v2 = result;
  LODWORD(result) = 0;
  uint64_t v3 = *(int **)(v2 + 24);
  do
  {
    int v4 = *v3;
    v3 += 4;
    double result = (v4 + result);
    --v1;
  }

  while (v1);
  return result;
}

void *crf_sequence_init(void *result)
{
  *double result = 0LL;
  result[1] = 0LL;
  return result;
}

void crf_item_finish(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
}

uint64_t crf_sequence_append(int *a1, uint64_t *a2, int a3)
{
  int v6 = *a1;
  int v7 = a1[1];
  if (v7 <= *a1)
  {
    int v9 = 2 * v7 + 2;
    a1[1] = v9;
    int v8 = (unsigned int *)realloc(*((void **)a1 + 1), 24LL * v9);
    *((void *)a1 + 1) = v8;
    int v6 = *a1;
  }

  else
  {
    int v8 = (unsigned int *)*((void *)a1 + 1);
  }

  crf_item_copy(&v8[6 * v6], a2);
  int v10 = *a1;
  *(_DWORD *)(*((void *)a1 + 1) + 24LL * v10 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = a3;
  *a1 = v10 + 1;
  return 0LL;
}

double crf_item_copy(unsigned int *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  a1[4] = *((_DWORD *)a2 + 4);
  int v5 = (char *)calloc((int)v4, 0x10uLL);
  *((void *)a1 + 1) = v5;
  uint64_t v7 = *a1;
  if ((int)v7 >= 1)
  {
    int v8 = (void *)(a2[1] + 8);
    int v9 = v5 + 8;
    do
    {
      *((_DWORD *)v9 - 2) = *((_DWORD *)v8 - 2);
      double v10 = *(double *)v8;
      v8 += 2;
      double result = v10;
      *(double *)int v9 = v10;
      v9 += 2;
      --v7;
    }

    while (v7);
  }

  return result;
}

void *crf_item_init(void *result)
{
  *double result = 0LL;
  result[1] = 0LL;
  result[2] = 0LL;
  return result;
}

double crf_content_copy(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  double result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

uint64_t crf_content_set(uint64_t result, int a2, double a3)
{
  *(void *)double result = 0LL;
  *(_DWORD *)double result = a2;
  *(double *)(result + 8) = a3;
  return result;
}

void *crf_content_init(void *result)
{
  *double result = 0LL;
  result[1] = 0x3FF0000000000000LL;
  return result;
}

uint64_t crf_item_append_content(int *a1, uint64_t a2)
{
  int v4 = *a1;
  int v5 = a1[1];
  if (v5 <= *a1)
  {
    int v7 = 2 * v5 + 2;
    a1[1] = v7;
    int v6 = (char *)realloc(*((void **)a1 + 1), 16LL * v7);
    *((void *)a1 + 1) = v6;
    int v4 = *a1;
  }

  else
  {
    int v6 = (char *)*((void *)a1 + 1);
  }

  *a1 = v4 + 1;
  int v8 = &v6[16 * v4];
  *(_DWORD *)int v8 = *(_DWORD *)a2;
  *((void *)v8 + 1) = *(void *)(a2 + 8);
  return 0LL;
}

void crf_paragraph_init_with_attrs(uint64_t a1, int a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0u;
  *(void *)(a1 + 32) = 0LL;
  *(_DWORD *)a1 = a2;
  *(_OWORD *)(a1 + 4) = xmmword_18744C810;
  int v4 = malloc(8uLL);
  *(void *)(a1 + 24) = v4;
  *int v4 = 0LL;
  size_t v5 = 20LL * a2;
  int v6 = malloc(v5);
  *(void *)(a1 + 32) = v6;
  bzero(v6, v5);
}

void crf_paragraph_finish(void *a1)
{
  unint64_t v2 = (void *)a1[3];
  if (v2) {
    free(v2);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3) {
    free(v3);
  }
  free(a1);
}

void Cache::Cache(Cache *this, int a2, uint64_t a3)
{
  *(_DWORD *)this = a2;
  *((void *)this + 1) = a3;
  int v4 = calloc(a2, 0x20uLL);
  uint64_t v5 = *(int *)this;
  uint64_t v6 = (*((void *)this + 1) >> 2) - 8 * (v5 & 0x7FFFFFFFFFFFFFFLL);
  BOOL v7 = v6 <= 2 * v5;
  uint64_t v8 = 2 * v5;
  if (v7) {
    uint64_t v6 = v8;
  }
  *((void *)this + 1) = v6;
  *((void *)this + 2) = v4;
  *((void *)this + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = (char *)this + 24;
  *((void *)this + 4) = (char *)this + 24;
}

void Cache::~Cache(Cache *this)
{
  unint64_t v2 = (char *)this + 24;
  free(*((void **)this + 2));
}

void Cache::lru_delete(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)(v2 + 8) = a2[1];
  *(void *)a2[1] = v2;
}

uint64_t Cache::lru_insert(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t result = a1 + 24;
  *a2 = v3;
  a2[1] = result;
  *(void *)(v3 + 8) = a2;
  *(void *)a2[1] = a2;
  return result;
}

uint64_t Cache::get_data(Cache *this, int a2, float **a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v7 = *((void *)this + 2);
  uint64_t v8 = a2;
  int v9 = (uint64_t *)(v7 + 32LL * a2);
  unsigned int v11 = v9 + 3;
  int v10 = *((_DWORD *)v9 + 6);
  if (v10)
  {
    uint64_t v12 = *v9;
    *(void *)(v12 + 8) = v9[1];
    *(void *)v9[1] = v12;
  }

  uint64_t v13 = (a4 - v10);
  if ((int)a4 <= v10)
  {
    double v19 = *(float **)(v7 + 32LL * a2 + 16);
  }

  else
  {
    if (*((void *)this + 1) < (uint64_t)v13)
    {
      do
      {
        uint64_t v14 = (uint64_t *)*((void *)this + 4);
        uint64_t v15 = *v14;
        *(void *)(v15 + 8) = v14[1];
        size_t v16 = (void *)v14[2];
        *(void *)v14[1] = v15;
        free(v16);
        uint64_t v17 = *((void *)this + 1) + *((int *)v14 + 6);
        *((void *)this + 1) = v17;
        void v14[2] = 0LL;
        *((_DWORD *)v14 + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
      }

      while (v17 < v13);
    }

    uint64_t v18 = v7 + 32 * v8;
    double v19 = (float *)realloc(*(void **)(v18 + 16), 4LL * (int)v4);
    *(void *)(v18 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v19;
    *((void *)this + 1) -= v13;
    uint64_t v20 = *v11;
    _DWORD *v11 = v4;
    uint64_t v4 = v20;
  }

  uint64_t v21 = v7 + 32 * v8;
  uint64_t v22 = *((void *)this + 3);
  *(void *)(v21 + 8) = (char *)this + 24;
  *int v9 = v22;
  *(void *)(v22 + 8) = v9;
  **(void **)(v21 + 8) = v9;
  *a3 = v19;
  return v4;
}

void Cache::swap_index(Cache *this, int a2, int a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = *((void *)this + 2);
    uint64_t v5 = (uint64_t *)(v4 + 32LL * a2);
    if (*((_DWORD *)v5 + 6))
    {
      uint64_t v6 = *v5;
      *(void *)(v6 + 8) = v5[1];
      *(void *)v5[1] = v6;
    }

    uint64_t v7 = (uint64_t *)(v4 + 32LL * a3);
    if (*((_DWORD *)v7 + 6))
    {
      uint64_t v8 = *v7;
      *(void *)(v8 + 8) = v7[1];
      *(void *)v7[1] = v8;
    }

    uint64_t v9 = v4 + 32LL * a2;
    uint64_t v10 = *(void *)(v9 + 16);
    *(void *)(v9 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v7[2];
    v7[2] = v10;
    uint64_t v11 = *((void *)this + 2);
    uint64_t v12 = v11 + 32LL * a2;
    uint64_t v13 = v11 + 32LL * a3;
    int v14 = *(_DWORD *)(v12 + 24);
    *(_DWORD *)(v12 + 24) = *(_DWORD *)(v13 + 24);
    *(_DWORD *)(v13 + 24) = v14;
    if (*(_DWORD *)(v12 + 24))
    {
      uint64_t v15 = *((void *)this + 3);
      *(void *)uint64_t v12 = v15;
      *(void *)(v12 + 8) = (char *)this + 24;
      *(void *)(v15 + 8) = v12;
      **(void **)(v12 + 8) = v12;
    }

    if (v14)
    {
      uint64_t v16 = *((void *)this + 3);
      uint64_t v17 = (void *)(v11 + 32LL * a3);
      *uint64_t v17 = v16;
      v17[1] = (char *)this + 24;
      *(void *)(v16 + 8) = v17;
      *(void *)v17[1] = v17;
    }

    if (a2 >= a3) {
      int v18 = a3;
    }
    else {
      int v18 = a2;
    }
    if (a2 <= a3) {
      int v19 = a3;
    }
    else {
      int v19 = a2;
    }
    uint64_t v20 = (char *)this + 24;
    uint64_t v21 = (char *)*((void *)this + 4);
    if (v21 != (char *)this + 24)
    {
      do
      {
        int v22 = *((_DWORD *)v21 + 6);
        if (v22 > v18)
        {
          if (v22 <= v19)
          {
            uint64_t v25 = *(void *)v21;
            *(void *)(v25 + 8) = *((void *)v21 + 1);
            double v26 = (void *)*((void *)v21 + 2);
            **((void **)v21 + 1) = v25;
            free(v26);
            *((void *)this + 1) += *((int *)v21 + 6);
            *((void *)v21 + 2) = 0LL;
            *((_DWORD *)v21 + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
          }

          else
          {
            uint64_t v23 = *((void *)v21 + 2);
            int v24 = *(_DWORD *)(v23 + 4LL * v18);
            *(_DWORD *)(v23 + 4LL * v18) = *(_DWORD *)(v23 + 4LL * v19);
            *(_DWORD *)(v23 + 4LL * v19) = v24;
          }
        }

        uint64_t v21 = (char *)*((void *)v21 + 1);
      }

      while (v21 != v20);
    }
  }

uint64_t Kernel::Kernel(uint64_t a1, int a2, const void *a3, uint64_t a4)
{
  *(void *)a1 = &unk_18A04E6A0;
  uint64_t v7 = *(void *)(a4 + 4);
  *(void *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a4 + 16);
  int v8 = v7;
  uint64_t v9 = Kernel::kernel_linear;
  switch((int)v7)
  {
    case 0:
      goto LABEL_6;
    case 1:
      uint64_t v9 = Kernel::kernel_poly;
      goto LABEL_6;
    case 2:
      uint64_t v9 = Kernel::kernel_rbf;
      goto LABEL_6;
    case 3:
      uint64_t v9 = Kernel::kernel_sigmoid;
      goto LABEL_6;
    case 4:
      uint64_t v9 = Kernel::kernel_precomputed;
LABEL_6:
      *(void *)(a1 + 8) = v9;
      *(void *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
      break;
    default:
      break;
  }

  if (a2 < 0) {
    size_t v10 = -1LL;
  }
  else {
    size_t v10 = 8LL * a2;
  }
  uint64_t v11 = operator new[](v10);
  *(void *)(a1 + 24) = v11;
  memcpy(v11, a3, 8LL * a2);
  if (v8 == 2)
  {
    uint64_t v12 = (double *)operator new[](v10);
    *(void *)(a1 + 32) = v12;
    if (a2 >= 1)
    {
      uint64_t v13 = 0LL;
      do
      {
        int v14 = (double *)*((void *)v11 + v13);
        int v15 = *(_DWORD *)v14;
        double v16 = 0.0;
        if (*(_DWORD *)v14 != -1)
        {
          uint64_t v17 = (double *)*((void *)v11 + v13);
          int v18 = *(_DWORD *)v14;
          do
          {
            if (v15 == v18)
            {
              double v16 = v16 + v14[1] * v17[1];
              v14 += 2;
              v17 += 2;
            }

            else if (v15 > v18)
            {
              v17 += 2;
            }

            else
            {
              v14 += 2;
            }

            int v15 = *(_DWORD *)v14;
            if (*(_DWORD *)v14 == -1) {
              break;
            }
            int v18 = *(_DWORD *)v17;
          }

          while (*(_DWORD *)v17 != -1);
        }

        v12[v13++] = v16;
      }

      while (v13 != a2);
    }
  }

  else
  {
    *(void *)(a1 + 32) = 0LL;
  }

  return a1;
}

double Kernel::kernel_linear(Kernel *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 3);
  uint64_t v4 = *(double **)(v3 + 8LL * a2);
  int v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 == -1) {
    return 0.0;
  }
  uint64_t v6 = *(double **)(v3 + 8LL * a3);
  double result = 0.0;
  do
  {
    int v8 = *(_DWORD *)v6;
    if (*(_DWORD *)v6 == -1) {
      break;
    }
    if (v5 == v8)
    {
      double result = result + v4[1] * v6[1];
      v4 += 2;
      v6 += 2;
    }

    else if (v5 > v8)
    {
      v6 += 2;
    }

    else
    {
      v4 += 2;
    }

    int v5 = *(_DWORD *)v4;
  }

  while (*(_DWORD *)v4 != -1);
  return result;
}

double Kernel::kernel_poly(Kernel *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 3);
  uint64_t v4 = *(double **)(v3 + 8LL * a2);
  int v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 == -1)
  {
    double v7 = 0.0;
  }

  else
  {
    uint64_t v6 = *(double **)(v3 + 8LL * a3);
    double v7 = 0.0;
    do
    {
      int v8 = *(_DWORD *)v6;
      if (*(_DWORD *)v6 == -1) {
        break;
      }
      if (v5 == v8)
      {
        double v7 = v7 + v4[1] * v6[1];
        v4 += 2;
        v6 += 2;
      }

      else if (v5 > v8)
      {
        v6 += 2;
      }

      else
      {
        v4 += 2;
      }

      int v5 = *(_DWORD *)v4;
    }

    while (*(_DWORD *)v4 != -1);
  }

  int v9 = *((_DWORD *)this + 11);
  if (v9 < 1) {
    return 1.0;
  }
  double v10 = *((double *)this + 7) + *((double *)this + 6) * v7;
  double result = 1.0;
  do
  {
    if ((v9 & 1) != 0) {
      double v12 = v10;
    }
    else {
      double v12 = 1.0;
    }
    double result = result * v12;
    double v10 = v10 * v10;
    BOOL v13 = v9 > 1;
    int v9 = v9 >> 1;
  }

  while (v13);
  return result;
}

double Kernel::kernel_rbf(Kernel *this, int a2, int a3)
{
  uint64_t v4 = *((void *)this + 3);
  uint64_t v3 = *((void *)this + 4);
  double v5 = *(double *)(v3 + 8LL * a2);
  double v6 = *(double *)(v3 + 8LL * a3);
  double v7 = *(double **)(v4 + 8LL * a2);
  int v8 = *(_DWORD *)v7;
  if (*(_DWORD *)v7 == -1)
  {
    double v10 = 0.0;
  }

  else
  {
    int v9 = *(double **)(v4 + 8LL * a3);
    double v10 = 0.0;
    do
    {
      int v11 = *(_DWORD *)v9;
      if (*(_DWORD *)v9 == -1) {
        break;
      }
      if (v8 == v11)
      {
        double v10 = v10 + v7[1] * v9[1];
        v7 += 2;
        v9 += 2;
      }

      else if (v8 > v11)
      {
        v9 += 2;
      }

      else
      {
        v7 += 2;
      }

      int v8 = *(_DWORD *)v7;
    }

    while (*(_DWORD *)v7 != -1);
  }

  return exp(-(*((double *)this + 6) * (v5 + v6 + v10 * -2.0)));
}

double Kernel::kernel_sigmoid(Kernel *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 3);
  uint64_t v4 = *(double **)(v3 + 8LL * a2);
  int v5 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 == -1)
  {
    double v7 = 0.0;
  }

  else
  {
    double v6 = *(double **)(v3 + 8LL * a3);
    double v7 = 0.0;
    do
    {
      int v8 = *(_DWORD *)v6;
      if (*(_DWORD *)v6 == -1) {
        break;
      }
      if (v5 == v8)
      {
        double v7 = v7 + v4[1] * v6[1];
        v4 += 2;
        v6 += 2;
      }

      else if (v5 > v8)
      {
        v6 += 2;
      }

      else
      {
        v4 += 2;
      }

      int v5 = *(_DWORD *)v4;
    }

    while (*(_DWORD *)v4 != -1);
  }

  return tanh(*((double *)this + 7) + *((double *)this + 6) * v7);
}

double Kernel::kernel_precomputed(Kernel *this, int a2, int a3)
{
  return *(double *)(*(void *)(*((void *)this + 3) + 8LL * a2)
}

double *Kernel::dot(double *result, double *a2)
{
  int v2 = *(_DWORD *)result;
  double v3 = 0.0;
  while (v2 != -1)
  {
    int v4 = *(_DWORD *)a2;
    if (*(_DWORD *)a2 == -1) {
      break;
    }
    if (v2 == v4)
    {
      double v3 = v3 + result[1] * a2[1];
      result += 2;
      a2 += 2;
    }

    else if (v2 > v4)
    {
      a2 += 2;
    }

    else
    {
      result += 2;
    }

    int v2 = *(_DWORD *)result;
  }

  return result;
}

void Kernel::~Kernel(Kernel *this)
{
  *(void *)this = &unk_18A04E6A0;
  int v2 = (void *)*((void *)this + 3);
  if (v2) {
    operator delete[](v2);
  }
  double v3 = (void *)*((void *)this + 4);
  if (v3) {
    operator delete[](v3);
  }
}

double Kernel::k_function(double *a1, double *a2, uint64_t a3)
{
  double result = 0.0;
  switch(*(_DWORD *)(a3 + 4))
  {
    case 0:
      while (1)
      {
        int v4 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 == -1) {
          break;
        }
        int v5 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1) {
          break;
        }
        if (v4 == v5)
        {
          double result = result + a1[1] * a2[1];
          a1 += 2;
          a2 += 2;
        }

        else if (v4 > v5)
        {
          a2 += 2;
        }

        else
        {
          a1 += 2;
        }
      }

      break;
    case 1:
      while (1)
      {
        int v6 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 == -1) {
          break;
        }
        int v7 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1) {
          break;
        }
        if (v6 == v7)
        {
          double result = result + a1[1] * a2[1];
          a1 += 2;
          a2 += 2;
        }

        else if (v6 > v7)
        {
          a2 += 2;
        }

        else
        {
          a1 += 2;
        }
      }

      int v14 = *(_DWORD *)(a3 + 8);
      if (v14 < 1)
      {
        double result = 1.0;
      }

      else
      {
        double v15 = *(double *)(a3 + 24) + *(double *)(a3 + 16) * result;
        double result = 1.0;
        do
        {
          if ((v14 & 1) != 0) {
            double v16 = v15;
          }
          else {
            double v16 = 1.0;
          }
          double result = result * v16;
          double v15 = v15 * v15;
          BOOL v17 = v14 >= 2;
          int v14 = v14 >> 1;
        }

        while (v17);
      }

      break;
    case 2:
      while (1)
      {
        int v8 = *(_DWORD *)a1;
        if (*(_DWORD *)a1 == -1) {
          break;
        }
        int v9 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1)
        {
          int v18 = a1 + 2;
          do
          {
            double result = result + *(v18 - 1) * *(v18 - 1);
            int v19 = *(_DWORD *)v18;
            v18 += 2;
          }

          while (v19 != -1);
          break;
        }

        if (v8 == v9)
        {
          double v10 = a1[1] - a2[1];
          double result = result + v10 * v10;
          a1 += 2;
          a2 += 2;
        }

        else if (v8 <= v9)
        {
          double result = result + a1[1] * a1[1];
          a1 += 2;
        }

        else
        {
          double result = result + a2[1] * a2[1];
          a2 += 2;
        }
      }

      if (*(_DWORD *)a2 != -1)
      {
        uint64_t v20 = a2 + 2;
        do
        {
          double result = result + *(v20 - 1) * *(v20 - 1);
          int v21 = *(_DWORD *)v20;
          v20 += 2;
        }

        while (v21 != -1);
      }

      double result = exp(-(*(double *)(a3 + 16) * result));
      break;
    case 3:
      int v11 = *(_DWORD *)a1;
      double v12 = 0.0;
      while (v11 != -1)
      {
        int v13 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 == -1) {
          break;
        }
        if (v11 == v13)
        {
          double v12 = v12 + a1[1] * a2[1];
          a1 += 2;
          a2 += 2;
        }

        else if (v11 > v13)
        {
          a2 += 2;
        }

        else
        {
          a1 += 2;
        }

        int v11 = *(_DWORD *)a1;
      }

      double result = tanh(*(double *)(a3 + 24) + *(double *)(a3 + 16) * v12);
      break;
    case 4:
      double result = a1[2 * (int)a2[1] + 1];
      break;
    default:
      return result;
  }

  return result;
}

double Solver::swap_index(Solver *this, int a2, int a3)
{
  uint64_t v6 = *((void *)this + 2);
  char v7 = *(_BYTE *)(v6 + a2);
  *(_BYTE *)(v6 + a2) = *(_BYTE *)(v6 + a3);
  *(_BYTE *)(v6 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v7;
  uint64_t v8 = *((void *)this + 3);
  uint64_t v9 = *((void *)this + 4);
  uint64_t v10 = *(void *)(v8 + 8LL * a2);
  *(void *)(v8 + 8LL * a2) = *(void *)(v8 + 8LL * a3);
  *(void *)(v8 + 8LL * astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v10;
  LOBYTE(v8) = *(_BYTE *)(v9 + a2);
  *(_BYTE *)(v9 + a2) = *(_BYTE *)(v9 + a3);
  *(_BYTE *)(v9 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v8;
  uint64_t v11 = *((void *)this + 5);
  uint64_t v12 = *(void *)(v11 + 8LL * a2);
  *(void *)(v11 + 8LL * a2) = *(void *)(v11 + 8LL * a3);
  *(void *)(v11 + 8LL * astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v12;
  uint64_t v13 = *((void *)this + 11);
  uint64_t v14 = *((void *)this + 12);
  uint64_t v15 = *(void *)(v13 + 8LL * a2);
  *(void *)(v13 + 8LL * a2) = *(void *)(v13 + 8LL * a3);
  *(void *)(v13 + 8LL * astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v15;
  LODWORD(v1std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = *(_DWORD *)(v14 + 4LL * a2);
  *(_DWORD *)(v14 + 4LL * a2) = *(_DWORD *)(v14 + 4LL * a3);
  *(_DWORD *)(v14 + 4LL * astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v13;
  uint64_t v16 = *((void *)this + 13);
  double result = *(double *)(v16 + 8LL * a2);
  *(void *)(v16 + 8LL * a2) = *(void *)(v16 + 8LL * a3);
  *(double *)(v16 + 8LL * astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = result;
  return result;
}

uint64_t Solver::reconstruct_gradient(uint64_t this)
{
  uint64_t v1 = *(unsigned int *)(this + 8);
  int v2 = *(_DWORD *)(this + 112);
  if ((_DWORD)v1 != v2)
  {
    uint64_t v3 = this;
    if ((int)v1 < v2)
    {
      int v4 = (double *)(*(void *)(this + 104) + 8LL * (int)v1);
      int v5 = (double *)(*(void *)(this + 88) + 8LL * (int)v1);
      uint64_t v6 = (double *)(*(void *)(this + 24) + 8LL * (int)v1);
      uint64_t v7 = v2 - (uint64_t)(int)v1;
      do
      {
        double v8 = *v4++;
        double v9 = v8;
        double v10 = *v5++;
        *v6++ = v9 + v10;
        --v7;
      }

      while (v7);
    }

    if ((int)v1 < 1)
    {
      int v11 = 0;
    }

    else
    {
      int v11 = 0;
      uint64_t v12 = *(unsigned __int8 **)(this + 32);
      uint64_t v13 = v1;
      do
      {
        int v14 = *v12++;
        if (v14 == 2) {
          ++v11;
        }
        --v13;
      }

      while (v13);
    }

    if ((int)v1 > 2 * v11)
    {
      this = info("\nWarning: using -h 0 may be faster\n");
      int v2 = *(_DWORD *)(v3 + 112);
      uint64_t v1 = *(unsigned int *)(v3 + 8);
    }

    if (v2 * v11 <= 2 * (int)v1 * (v2 - (int)v1))
    {
      if ((int)v1 >= 1)
      {
        uint64_t v19 = 0LL;
        do
        {
          if (*(_BYTE *)(*(void *)(v3 + 32) + v19) == 2)
          {
            this = (***(uint64_t (****)(void, uint64_t))(v3 + 48))(*(void *)(v3 + 48), v19);
            LODWORD(v1) = *(_DWORD *)(v3 + 8);
            int v20 = *(_DWORD *)(v3 + 112);
            if ((int)v1 < v20)
            {
              double v21 = *(double *)(*(void *)(v3 + 40) + 8 * v19);
              int v22 = (float *)(this + 4LL * (int)v1);
              uint64_t v23 = (double *)(*(void *)(v3 + 24) + 8LL * (int)v1);
              uint64_t v24 = v20 - (uint64_t)(int)v1;
              do
              {
                float v25 = *v22++;
                *uint64_t v23 = *v23 + v21 * v25;
                ++v23;
                --v24;
              }

              while (v24);
            }
          }

          ++v19;
        }

        while (v19 < (int)v1);
      }
    }

    else if (v2 > (int)v1)
    {
      uint64_t v15 = (int)v1;
      uint64_t v16 = v1;
      do
      {
        this = (***(uint64_t (****)(void, uint64_t, uint64_t))(v3 + 48))(*(void *)(v3 + 48), v15, v16);
        uint64_t v16 = *(unsigned int *)(v3 + 8);
        if ((int)v16 >= 1)
        {
          uint64_t v17 = 0LL;
          uint64_t v18 = *(void *)(v3 + 32);
          do
          {
            if (*(_BYTE *)(v18 + v17) == 2) {
              *(double *)(*(void *)(v3 + 24) + 8 * v15) = *(double *)(*(void *)(v3 + 24) + 8 * v15)
            }
            ++v17;
          }

          while (v16 != v17);
        }

        ++v15;
      }

      while (v15 < *(int *)(v3 + 112));
    }
  }

  return this;
}

uint64_t info(const char *a1, ...)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  vsprintf(v2, a1, va);
  return svm_print_string(v2);
}

void Solver::Solve( uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, const void *a5, const void *a6, uint64_t a7, int a8, double a9, double a10, double a11)
{
  *(_DWORD *)(a1 + 112) = a2;
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 5std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 8LL))(a3);
  else {
    size_t v20 = 8LL * (int)a2;
  }
  double v21 = operator new[](v20);
  *(void *)(a1 + 88) = v21;
  memcpy(v21, a4, 8LL * (int)a2);
  int v22 = operator new[]((int)a2);
  *(void *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v22;
  memcpy(v22, a5, (int)a2);
  uint64_t v23 = operator new[](v20);
  *(void *)(a1 + 40) = v23;
  memcpy(v23, a6, 8LL * (int)a2);
  *(double *)(a1 + 72) = a9;
  *(double *)(a1 + 80) = a10;
  *(double *)(a1 + 64) = a11;
  *(_BYTE *)(a1 + 11std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
  *(void *)(a1 + 32) = operator new[]((int)a2);
  uint64_t v24 = a2;
  if ((int)a2 >= 1)
  {
    uint64_t v25 = 0LL;
    do
    {
      double v26 = *(double *)(*(void *)(a1 + 40) + 8 * v25);
      else {
        uint64_t v27 = 72LL;
      }
      if (v26 >= *(double *)(a1 + v27))
      {
        *(_BYTE *)(*(void *)(a1 + 32) + v25) = 1;
      }

      else
      {
        uint64_t v28 = *(void *)(a1 + 32);
        if (v26 <= 0.0) {
          *(_BYTE *)(v28 + v25) = 0;
        }
        else {
          *(_BYTE *)(v28 + v25) = 2;
        }
      }

      ++v25;
    }

    while (a2 != v25);
  }

  else {
    size_t v29 = 4LL * (int)a2;
  }
  double v30 = operator new[](v29);
  *(void *)(a1 + 9std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v30;
  if ((int)a2 >= 1)
  {
    uint64_t v31 = 0LL;
    do
    {
      v30[v31] = v31;
      ++v31;
    }

    while (a2 != v31);
  }

  *(_DWORD *)(a1 + 8) = a2;
  double v32 = operator new[](v20);
  *(void *)(a1 + 24) = v32;
  double v33 = operator new[](v20);
  *(void *)(a1 + 104) = v33;
  if ((int)a2 >= 1)
  {
    double v34 = *(uint64_t **)(a1 + 88);
    uint64_t v35 = a2;
    do
    {
      uint64_t v36 = *v34++;
      *v32++ = v36;
      *v33++ = 0LL;
      --v35;
    }

    while (v35);
    uint64_t v37 = 0LL;
    uint64_t v38 = *(void *)(a1 + 32);
    do
    {
      if (*(_BYTE *)(v38 + v37))
      {
        double v39 = (float *)(**(uint64_t (***)(uint64_t, uint64_t, uint64_t))a3)(a3, v37, a2);
        double v40 = *(double *)(*(void *)(a1 + 40) + 8 * v37);
        double v41 = *(double **)(a1 + 24);
        uint64_t v42 = a2;
        double v43 = v39;
        do
        {
          float v44 = *v43++;
          *double v41 = *v41 + v40 * v44;
          ++v41;
          --v42;
        }

        while (v42);
        uint64_t v38 = *(void *)(a1 + 32);
        if (*(_BYTE *)(v38 + v37) == 1)
        {
          uint64_t v45 = *(void *)(a1 + 16);
          double v46 = *(double **)(a1 + 104);
          uint64_t v47 = a2;
          do
          {
            else {
              double v48 = (double *)(a1 + 72);
            }
            float v49 = *v39++;
            *double v46 = *v46 + *v48 * v49;
            ++v46;
            --v47;
          }

          while (v47);
        }
      }

      ++v37;
    }

    while (v37 != a2);
  }

  int v50 = 0;
  else {
    int v51 = a2;
  }
  int v137 = v51;
  int v52 = v51 + 1;
  while (1)
  {
    if (!--v52)
    {
      if (a8) {
        (*(void (**)(uint64_t))(*(void *)a1 + 32LL))(a1);
      }
      info(".");
      int v52 = v137;
    }

    if ((*(unsigned int (**)(uint64_t, unsigned int *, unsigned int *))(*(void *)a1 + 16LL))( a1,  &v140,  &v139))
    {
      break;
    }

LABEL_46:
    double v53 = (float *)(**(uint64_t (***)(uint64_t, void, void))a3)(a3, v140, *(unsigned int *)(a1 + 8));
    double v54 = (float *)(**(uint64_t (***)(uint64_t, void, void))a3)(a3, v139, *(unsigned int *)(a1 + 8));
    uint64_t v55 = (int)v140;
    uint64_t v56 = *(void *)(a1 + 16);
    double v57 = *(double **)(a1 + 24);
    int v58 = *(unsigned __int8 *)(v56 + (int)v140);
    else {
      uint64_t v59 = 72LL;
    }
    double v60 = *(double *)(a1 + v59);
    uint64_t v61 = (int)v139;
    int v62 = *(unsigned __int8 *)(v56 + (int)v139);
    else {
      uint64_t v63 = 72LL;
    }
    double v64 = *(double *)(a1 + v63);
    uint64_t v65 = *(void *)(a1 + 56);
    double v66 = *(double *)(v65 + 8LL * (int)v140);
    double v67 = *(double *)(v65 + 8LL * (int)v139);
    uint64_t v68 = *(void *)(a1 + 40);
    double v69 = *(double *)(v68 + 8LL * (int)v140);
    double v70 = *(double *)(v68 + 8LL * (int)v139);
    double v71 = v66 + v67;
    double v72 = (float)(v53[v139] + v53[v139]);
    double v73 = v57[v140];
    if (v58 == v62)
    {
      double v74 = v71 - v72;
      if (v74 <= 0.0) {
        double v74 = 1.0e-12;
      }
      double v75 = (v73 - v57[v139]) / v74;
      double v76 = v69 + v70;
      *(double *)(v68 + 8LL * (int)v140) = v69 - v75;
      double v77 = *(double *)(v68 + 8 * v61) + v75;
      *(double *)(v68 + 8 * v61) = v77;
      if (v69 + v70 <= v60)
      {
        if (v77 < 0.0)
        {
          *(void *)(v68 + 8 * v61) = 0LL;
          *(double *)(v68 + 8 * v55) = v76;
        }
      }

      else if (*(double *)(v68 + 8 * v55) > v60)
      {
        *(double *)(v68 + 8 * v55) = v60;
        *(double *)(v68 + 8 * v61) = v76 - v60;
      }

      if (v76 <= v64)
      {
        *(void *)(v68 + 8 * v55) = 0LL;
        goto LABEL_75;
      }

      *(double *)(v68 + 8 * v61) = v64;
      double v82 = v76 - v64;
      goto LABEL_78;
    }

    double v78 = v71 + v72;
    if (v78 <= 0.0) {
      double v78 = 1.0e-12;
    }
    double v79 = (-v73 - v57[v139]) / v78;
    double v80 = v69 - v70;
    *(double *)(v68 + 8LL * (int)v140) = v69 + v79;
    double v81 = *(double *)(v68 + 8 * v61) + v79;
    *(double *)(v68 + 8 * v61) = v81;
    if (v69 - v70 <= 0.0)
    {
      if (*(double *)(v68 + 8 * v55) < 0.0)
      {
        *(void *)(v68 + 8 * v55) = 0LL;
        *(double *)(v68 + 8 * v61) = -v80;
      }
    }

    else if (v81 < 0.0)
    {
      *(void *)(v68 + 8 * v61) = 0LL;
      *(double *)(v68 + 8 * v55) = v80;
    }

    if (v80 > v60 - v64)
    {
      *(double *)(v68 + 8 * v55) = v60;
      double v76 = v60 - v80;
LABEL_75:
      *(double *)(v68 + 8 * v61) = v76;
      goto LABEL_79;
    }

    if (*(double *)(v68 + 8 * v61) > v64)
    {
      *(double *)(v68 + 8 * v61) = v64;
      double v82 = v64 + v80;
LABEL_78:
      *(double *)(v68 + 8 * v55) = v82;
    }

LABEL_79:
    double v83 = *(double *)(v68 + 8 * v55);
    uint64_t v84 = *(unsigned int *)(a1 + 8);
    if ((int)v84 >= 1)
    {
      double v85 = v83 - v69;
      double v86 = *(double *)(v68 + 8 * v61) - v70;
      do
      {
        float v87 = *v53++;
        double v88 = v87;
        float v89 = *v54++;
        *double v57 = *v57 + v86 * v89 + v88 * v85;
        ++v57;
        --v84;
      }

      while (v84);
      double v83 = *(double *)(v68 + 8 * v55);
    }

    uint64_t v90 = *(void *)(a1 + 32);
    int v91 = *(unsigned __int8 *)(v90 + v55);
    int v92 = *(unsigned __int8 *)(v90 + v61);
    else {
      uint64_t v93 = 72LL;
    }
    double v94 = *(double *)(a1 + v93);
    char v95 = 2 * (v83 > 0.0);
    if (v83 >= v94) {
      char v95 = 1;
    }
    *(_BYTE *)(v90 + v55) = v95;
    double v96 = *(double *)(*(void *)(a1 + 40) + 8LL * (int)v139);
    else {
      uint64_t v97 = 72LL;
    }
    if (v96 >= *(double *)(a1 + v97))
    {
      uint64_t v98 = *(void *)(a1 + 32);
      char v99 = 1;
      goto LABEL_95;
    }

    uint64_t v98 = *(void *)(a1 + 32);
    if (v96 > 0.0)
    {
      char v99 = 2;
LABEL_95:
      *(_BYTE *)(v98 + (int)v139) = v99;
      goto LABEL_97;
    }

    *(_BYTE *)(v98 + (int)v139) = 0;
LABEL_97:
    if ((v91 == 1) != (*(_BYTE *)(*(void *)(a1 + 32) + (int)v140) == 1))
    {
      double v100 = (float *)(**(uint64_t (***)(uint64_t))a3)(a3);
      if (v91 == 1)
      {
        if ((int)a2 >= 1)
        {
          double v101 = *(double **)(a1 + 104);
          uint64_t v102 = a2;
          do
          {
            float v103 = *v100++;
            *double v101 = *v101 + -v60 * v103;
            ++v101;
            --v102;
          }

          while (v102);
        }
      }

      else if ((int)a2 >= 1)
      {
        uint64_t v104 = *(double **)(a1 + 104);
        uint64_t v105 = a2;
        do
        {
          float v106 = *v100++;
          *uint64_t v104 = *v104 + v60 * v106;
          ++v104;
          --v105;
        }

        while (v105);
      }
    }

    if ((v92 == 1) != (*(_BYTE *)(*(void *)(a1 + 32) + (int)v139) == 1))
    {
      double v107 = (float *)(**(uint64_t (***)(uint64_t))a3)(a3);
      if (v92 == 1)
      {
        if ((int)a2 >= 1)
        {
          double v108 = *(double **)(a1 + 104);
          uint64_t v109 = a2;
          do
          {
            float v110 = *v107++;
            *double v108 = *v108 + -v64 * v110;
            ++v108;
            --v109;
          }

          while (v109);
        }
      }

      else if ((int)a2 >= 1)
      {
        uint64_t v111 = *(double **)(a1 + 104);
        uint64_t v112 = a2;
        do
        {
          float v113 = *v107++;
          *uint64_t v111 = *v111 + v64 * v113;
          ++v111;
          --v112;
        }

        while (v112);
      }
    }

    ++v50;
  }

  Solver::reconstruct_gradient(a1);
  *(_DWORD *)(a1 + 8) = a2;
  info("*");
  if (!(*(unsigned int (**)(uint64_t, unsigned int *, unsigned int *))(*(void *)a1 + 16LL))( a1,  &v140,  &v139))
  {
    int v52 = 1;
    goto LABEL_46;
  }

  *(double *)(a7 + 8) = (*(double (**)(uint64_t))(*(void *)a1 + 24LL))(a1);
  if ((int)a2 <= 0)
  {
    *(void *)a7 = 0LL;
  }

  else
  {
    __int128 v114 = *(double **)(a1 + 40);
    uint64_t v115 = *(double **)(a1 + 24);
    double v116 = 0.0;
    uint64_t v117 = a2;
    double v118 = *(double **)(a1 + 88);
    do
    {
      double v119 = *v114++;
      double v120 = v119;
      double v121 = *v115++;
      double v122 = v121;
      double v123 = *v118++;
      double v116 = v116 + v120 * (v122 + v123);
      --v117;
    }

    while (v117);
    *(double *)a7 = v116 * 0.5;
    uint64_t v124 = *(uint64_t **)(a1 + 40);
    double v125 = *(int **)(a1 + 96);
    do
    {
      uint64_t v126 = *v124++;
      uint64_t v127 = v126;
      uint64_t v128 = *v125++;
      *((void *)a6 + v128) = v127;
      --v24;
    }

    while (v24);
  }

  *(double *)(a7 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = a9;
  *(double *)(a7 + 24) = a10;
  info("\noptimization finished, #iter = %d\n", v50);
  double v129 = *(void **)(a1 + 88);
  if (v129) {
    operator delete[](v129);
  }
  uint64_t v130 = *(void **)(a1 + 16);
  if (v130) {
    operator delete[](v130);
  }
  double v131 = *(void **)(a1 + 40);
  if (v131) {
    operator delete[](v131);
  }
  double v132 = *(void **)(a1 + 32);
  if (v132) {
    operator delete[](v132);
  }
  uint64_t v133 = *(void **)(a1 + 96);
  if (v133) {
    operator delete[](v133);
  }
  double v134 = *(void **)(a1 + 24);
  if (v134) {
    operator delete[](v134);
  }
  double v135 = *(void **)(a1 + 104);
  if (v135) {
    operator delete[](v135);
  }
}

uint64_t Solver::select_working_set(Solver *this, int *a2, int *a3)
{
  uint64_t v6 = *((unsigned int *)this + 2);
  if ((int)v6 < 1)
  {
    LODWORD(v8) = -1;
    double v9 = -INFINITY;
    int v12 = -1;
    double v13 = -INFINITY;
    goto LABEL_35;
  }

  uint64_t v7 = 0LL;
  uint64_t v8 = 0xFFFFFFFFLL;
  double v9 = -INFINITY;
  do
  {
    if (*(_BYTE *)(*((void *)this + 2) + v7) == 1)
    {
      if (*(_BYTE *)(*((void *)this + 4) + v7) != 1)
      {
        double v10 = -*(double *)(*((void *)this + 3) + 8 * v7);
        if (v9 <= v10) {
          goto LABEL_9;
        }
      }
    }

    else if (*(_BYTE *)(*((void *)this + 4) + v7))
    {
      double v10 = *(double *)(*((void *)this + 3) + 8 * v7);
      if (v10 >= v9)
      {
LABEL_9:
        uint64_t v8 = v7;
        double v9 = v10;
      }
    }

    ++v7;
  }

  while (v6 != v7);
  if ((_DWORD)v8 == -1)
  {
    uint64_t v11 = 0LL;
    LODWORD(v8) = -1;
  }

  else
  {
    uint64_t v11 = (***((uint64_t (****)(void, uint64_t))this + 6))(*((void *)this + 6), v8);
    LODWORD(vstd::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = *((_DWORD *)this + 2);
  }

  if ((int)v6 >= 1)
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = *((void *)this + 2);
    int v12 = -1;
    double v16 = INFINITY;
    double v13 = -INFINITY;
    while (1)
    {
      if (*(_BYTE *)(v15 + v14) == 1)
      {
        if (!*(_BYTE *)(*((void *)this + 4) + v14)) {
          goto LABEL_32;
        }
        uint64_t v17 = *((void *)this + 3);
        double v18 = *(double *)(v17 + 8 * v14);
        double v19 = v9 + v18;
        if (v18 >= v13) {
          double v13 = *(double *)(v17 + 8 * v14);
        }
        if (v19 <= 0.0) {
          goto LABEL_32;
        }
        double v20 = *(double *)(*((void *)this + 7) + 8LL * (int)v8) + *(double *)(*((void *)this + 7) + 8 * v14);
        double v21 = *(float *)(v11 + 4 * v14);
        double v22 = (double)*(char *)(v15 + (int)v8) * -2.0;
      }

      else
      {
        if (*(_BYTE *)(*((void *)this + 4) + v14) == 1) {
          goto LABEL_32;
        }
        double v23 = *(double *)(*((void *)this + 3) + 8 * v14);
        double v19 = v9 - v23;
        double v24 = -v23;
        if (v13 <= v24) {
          double v13 = v24;
        }
        if (v19 <= 0.0) {
          goto LABEL_32;
        }
        double v20 = *(double *)(*((void *)this + 7) + 8LL * (int)v8) + *(double *)(*((void *)this + 7) + 8 * v14);
        double v22 = (double)*(char *)(v15 + (int)v8) + (double)*(char *)(v15 + (int)v8);
        double v21 = *(float *)(v11 + 4 * v14);
      }

      double v25 = v20 + v22 * v21;
      double v26 = -(v19 * v19);
      if (v25 <= 0.0) {
        double v25 = 1.0e-12;
      }
      double v27 = v26 / v25;
      if (v27 <= v16)
      {
        double v16 = v27;
        int v12 = v14;
      }

LABEL_32:
    }
  }

  int v12 = -1;
  double v13 = -INFINITY;
LABEL_35:
  uint64_t result = 0LL;
  *a2 = v8;
  *a3 = v12;
  return result;
}

    double v20 = *(void *)v20;
    if (!v20) {
      goto LABEL_33;
    }
  }

  double v22 = (unsigned __int8 *)(v20 + 14);
  double v23 = (unsigned __int8 *)(v18 + 14);
  double v24 = v19;
  while (1)
  {
    double v26 = *v22++;
    double v25 = v26;
    double v27 = *v23++;
    if (v25 != v27) {
      break;
    }
    if (!--v24) {
      goto LABEL_20;
    }
  }

  if (v16)
  {
    uint64_t v17 = 5LL;
    goto LABEL_35;
  }

  return v15;
}

  if (v16)
  {
    uint64_t v17 = 5LL;
    goto LABEL_35;
  }

  return v15;
}

BOOL Solver::be_shrunk(Solver *this, int a2, double a3, double a4)
{
  if (*(_BYTE *)(*((void *)this + 4) + a2))
  {
    if (*(_BYTE *)(*((void *)this + 4) + a2) != 1) {
      return 0LL;
    }
    double v4 = -*(double *)(*((void *)this + 3) + 8LL * a2);
    if (*(_BYTE *)(*((void *)this + 2) + a2) != 1) {
      goto LABEL_4;
    }
  }

  else
  {
    double v4 = *(double *)(*((void *)this + 3) + 8LL * a2);
    if (*(_BYTE *)(*((void *)this + 2) + a2) == 1)
    {
LABEL_4:
      BOOL v5 = v4 <= a4;
      return !v5;
    }
  }

  BOOL v5 = v4 <= a3;
  return !v5;
}

void Solver::do_shrinking(Solver *this)
{
  int v2 = *((_DWORD *)this + 2);
  if (v2 < 1)
  {
    double v8 = -INFINITY;
    double v6 = -INFINITY;
  }

  else
  {
    double v4 = (double *)*((void *)this + 3);
    uint64_t v3 = (unsigned __int8 *)*((void *)this + 4);
    BOOL v5 = (unsigned __int8 *)*((void *)this + 2);
    double v6 = -INFINITY;
    uint64_t v7 = *((unsigned int *)this + 2);
    double v8 = -INFINITY;
    do
    {
      int v10 = *v5++;
      int v9 = v10;
      int v12 = *v3++;
      int v11 = v12;
      double v13 = *v4;
      if (v9 == 1)
      {
        if (v11 == 1) {
          goto LABEL_8;
        }
        if (v8 <= -v13) {
          double v8 = -v13;
        }
        if (v11)
        {
LABEL_8:
          if (v13 >= v6) {
            double v6 = *v4;
          }
        }
      }

      else
      {
        if (v11 == 1) {
          goto LABEL_15;
        }
        if (v6 <= -v13) {
          double v6 = -v13;
        }
        if (v11)
        {
LABEL_15:
          if (v13 >= v8) {
            double v8 = *v4;
          }
        }
      }

      ++v4;
      --v7;
    }

    while (v7);
  }

  if (!*((_BYTE *)this + 116) && v8 + v6 <= *((double *)this + 8) * 10.0)
  {
    *((_BYTE *)this + 11std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 1;
    Solver::reconstruct_gradient((uint64_t)this);
    *((_DWORD *)this + 2) = *((_DWORD *)this + 28);
    info("*");
    int v2 = *((_DWORD *)this + 2);
  }

  if (v2 >= 1)
  {
    for (int i = 0; i < v2; ++i)
    {
      if (Solver::be_shrunk(this, i, v8, v6))
      {
        while (1)
        {
          *((_DWORD *)this + 2) = --v2;
          if (v2 <= i) {
            break;
          }
          if (!Solver::be_shrunk(this, v2, v8, v6))
          {
            Solver::swap_index(this, i, v2);
            int v2 = *((_DWORD *)this + 2);
            break;
          }
        }
      }
    }
  }

double Solver::calculate_rho(Solver *this)
{
  uint64_t v1 = *((unsigned int *)this + 2);
  if ((int)v1 < 1)
  {
    double v7 = INFINITY;
    double v8 = -INFINITY;
  }

  else
  {
    int v2 = 0;
    uint64_t v3 = (unsigned __int8 *)*((void *)this + 2);
    double v4 = (double *)*((void *)this + 3);
    BOOL v5 = (unsigned __int8 *)*((void *)this + 4);
    double v6 = 0.0;
    double v7 = INFINITY;
    double v8 = -INFINITY;
    do
    {
      int v10 = *v3++;
      int v9 = v10;
      double v11 = (double)(char)v10;
      double v12 = *v4++;
      double v13 = v12 * v11;
      LODWORD(v12) = *v5++;
      int v14 = LODWORD(v12);
      if (v8 <= v13) {
        double v15 = v13;
      }
      else {
        double v15 = v8;
      }
      if (v7 >= v13) {
        double v16 = v13;
      }
      else {
        double v16 = v7;
      }
      if (v9 == 1) {
        double v15 = v8;
      }
      else {
        double v16 = v7;
      }
      double v17 = v6 + v13;
      if (v8 <= v13) {
        double v18 = v13;
      }
      else {
        double v18 = v8;
      }
      if (v7 < v13) {
        double v13 = v7;
      }
      if (v9 == 255) {
        double v18 = v8;
      }
      else {
        double v13 = v7;
      }
      if (v14 == 1) {
        int v19 = v2;
      }
      else {
        int v19 = v2 + 1;
      }
      if (v14 == 1)
      {
        double v7 = v13;
        double v8 = v18;
        double v20 = v6;
      }

      else
      {
        double v20 = v17;
      }

      if (v14)
      {
        int v2 = v19;
      }

      else
      {
        double v7 = v16;
        double v8 = v15;
      }

      if (v14) {
        double v6 = v20;
      }
      --v1;
    }

    while (v1);
    if (v2 > 0) {
      return v6 / (double)v2;
    }
  }

  return (v7 + v8) * 0.5;
}

uint64_t Solver_NU::select_working_set(Solver_NU *this, int *a2, int *a3)
{
  uint64_t v6 = *((unsigned int *)this + 2);
  if ((int)v6 < 1)
  {
    LODWORD(v8) = -1;
    double v9 = -INFINITY;
    double v10 = -INFINITY;
    LODWORD(v11) = -1;
    int v13 = -1;
    double v14 = -INFINITY;
    double v15 = -INFINITY;
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0xFFFFFFFFLL;
    double v9 = -INFINITY;
    double v10 = -INFINITY;
    uint64_t v11 = 0xFFFFFFFFLL;
    do
    {
      if (*(_BYTE *)(*((void *)this + 2) + v7) == 1)
      {
        if (*(_BYTE *)(*((void *)this + 4) + v7) != 1 && v9 <= -*(double *)(*((void *)this + 3) + 8 * v7))
        {
          uint64_t v8 = v7;
          double v9 = -*(double *)(*((void *)this + 3) + 8 * v7);
        }
      }

      else if (*(_BYTE *)(*((void *)this + 4) + v7) && *(double *)(*((void *)this + 3) + 8 * v7) >= v10)
      {
        uint64_t v11 = v7;
        double v10 = *(double *)(*((void *)this + 3) + 8 * v7);
      }

      ++v7;
    }

    while (v6 != v7);
    if ((_DWORD)v8 == -1)
    {
      uint64_t v12 = 0LL;
      LODWORD(v8) = -1;
    }

    else
    {
      uint64_t v12 = (***((uint64_t (****)(void, uint64_t))this + 6))(*((void *)this + 6), v8);
      uint64_t v6 = *((unsigned int *)this + 2);
    }

    if ((_DWORD)v11 == -1)
    {
      uint64_t v16 = 0LL;
      LODWORD(v11) = -1;
    }

    else
    {
      uint64_t v16 = (***((uint64_t (****)(void, uint64_t, uint64_t))this + 6))(*((void *)this + 6), v11, v6);
      LODWORD(vstd::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = *((_DWORD *)this + 2);
    }

    if ((int)v6 >= 1)
    {
      uint64_t v17 = 0LL;
      int v13 = -1;
      double v18 = INFINITY;
      double v15 = -INFINITY;
      double v14 = -INFINITY;
      while (1)
      {
        if (*(_BYTE *)(*((void *)this + 2) + v17) == 1)
        {
          if (!*(_BYTE *)(*((void *)this + 4) + v17)) {
            goto LABEL_35;
          }
          uint64_t v19 = *((void *)this + 3);
          double v20 = *(double *)(v19 + 8 * v17);
          double v21 = v9 + v20;
          if (v20 >= v15) {
            double v15 = *(double *)(v19 + 8 * v17);
          }
          if (v21 <= 0.0) {
            goto LABEL_35;
          }
          double v22 = *(double *)(*((void *)this + 7) + 8LL * (int)v8) + *(double *)(*((void *)this + 7) + 8 * v17);
          float v23 = *(float *)(v12 + 4 * v17);
        }

        else
        {
          if (*(_BYTE *)(*((void *)this + 4) + v17) == 1) {
            goto LABEL_35;
          }
          double v24 = *(double *)(*((void *)this + 3) + 8 * v17);
          double v21 = v10 - v24;
          double v25 = -v24;
          if (v14 <= v25) {
            double v14 = v25;
          }
          if (v21 <= 0.0) {
            goto LABEL_35;
          }
          double v22 = *(double *)(*((void *)this + 7) + 8LL * (int)v11) + *(double *)(*((void *)this + 7) + 8 * v17);
          float v23 = *(float *)(v16 + 4 * v17);
        }

        double v26 = v22 - (float)(v23 + v23);
        double v27 = -(v21 * v21);
        if (v26 <= 0.0) {
          double v26 = 1.0e-12;
        }
        double v28 = v27 / v26;
        if (v28 <= v18)
        {
          int v13 = v17;
          double v18 = v28;
        }

LABEL_35:
      }
    }

    int v13 = -1;
    double v14 = -INFINITY;
    double v15 = -INFINITY;
  }

LABEL_38:
  double v29 = v9 + v15;
  double v30 = v10 + v14;
  if (v29 > v30) {
    double v30 = v29;
  }
  uint64_t result = 0LL;
  if (*(_BYTE *)(*((void *)this + 2) + v13) == 1) {
    int v32 = v8;
  }
  else {
    int v32 = v11;
  }
  *a2 = v32;
  *a3 = v13;
  return result;
}

BOOL Solver_NU::be_shrunk(Solver_NU *this, int a2, double a3, double a4, double a5, double a6)
{
  if (*(_BYTE *)(*((void *)this + 4) + a2))
  {
    if (*(_BYTE *)(*((void *)this + 4) + a2) != 1) {
      return 0LL;
    }
    double v6 = -*(double *)(*((void *)this + 3) + 8LL * a2);
    if (*(_BYTE *)(*((void *)this + 2) + a2) == 1) {
      BOOL v7 = v6 <= a3;
    }
    else {
      BOOL v7 = v6 <= a6;
    }
  }

  else
  {
    double v8 = *(double *)(*((void *)this + 3) + 8LL * a2);
    if (*(_BYTE *)(*((void *)this + 2) + a2) == 1) {
      BOOL v7 = v8 <= a4;
    }
    else {
      BOOL v7 = v8 <= a5;
    }
  }

  return !v7;
}

void Solver_NU::do_shrinking(Solver_NU *this)
{
  uint64_t v2 = *((unsigned int *)this + 2);
  if ((int)v2 < 1)
  {
    double v7 = -INFINITY;
    double v6 = -INFINITY;
    double v5 = -INFINITY;
    double v4 = -INFINITY;
  }

  else
  {
    uint64_t v3 = 0LL;
    double v4 = -INFINITY;
    double v5 = -INFINITY;
    double v6 = -INFINITY;
    double v7 = -INFINITY;
    do
    {
      int v8 = *(unsigned __int8 *)(*((void *)this + 2) + v3);
      if (*(_BYTE *)(*((void *)this + 4) + v3) == 1) {
        goto LABEL_10;
      }
      double v9 = -*(double *)(*((void *)this + 3) + 8 * v3);
      if (v8 == 1)
      {
        if (v7 < v9) {
          double v7 = -*(double *)(*((void *)this + 3) + 8 * v3);
        }
      }

      else if (v4 < v9)
      {
        double v4 = -*(double *)(*((void *)this + 3) + 8 * v3);
      }

      if (*(_BYTE *)(*((void *)this + 4) + v3))
      {
LABEL_10:
        double v10 = *(double *)(*((void *)this + 3) + 8 * v3);
        if (v8 == 1)
        {
          if (v10 > v6) {
            double v6 = *(double *)(*((void *)this + 3) + 8 * v3);
          }
        }

        else if (v10 > v5)
        {
          double v5 = *(double *)(*((void *)this + 3) + 8 * v3);
        }
      }

      ++v3;
    }

    while (v2 != v3);
  }

  if (!*((_BYTE *)this + 116))
  {
    double v11 = v7 + v6;
    if (v7 + v6 <= v5 + v4) {
      double v11 = v5 + v4;
    }
    if (v11 <= *((double *)this + 8) * 10.0)
    {
      *((_BYTE *)this + 11std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 1;
      Solver::reconstruct_gradient((uint64_t)this);
      LODWORD(v2) = *((_DWORD *)this + 28);
      *((_DWORD *)this + 2) = v2;
    }
  }

  if ((int)v2 >= 1)
  {
    int v12 = 0;
    do
    {
      if (Solver_NU::be_shrunk(this, v12, v7, v6, v5, v4))
      {
        while (1)
        {
          LODWORD(v2) = v2 - 1;
          *((_DWORD *)this + 2) = v2;
          if (!Solver_NU::be_shrunk(this, v2, v7, v6, v5, v4))
          {
            Solver::swap_index(this, v12, v2);
            LODWORD(v2) = *((_DWORD *)this + 2);
            break;
          }
        }
      }

      ++v12;
    }

    while (v12 < (int)v2);
  }

double Solver_NU::calculate_rho(Solver_NU *this)
{
  uint64_t v1 = *((unsigned int *)this + 2);
  if ((int)v1 < 1)
  {
    int v3 = 0;
    double v5 = 0.0;
    double v6 = INFINITY;
    double v7 = -INFINITY;
    double v9 = -INFINITY;
    double v10 = INFINITY;
  }

  else
  {
    uint64_t v2 = 0LL;
    int v3 = 0;
    int v4 = 0;
    double v5 = 0.0;
    double v6 = INFINITY;
    double v7 = -INFINITY;
    double v8 = 0.0;
    double v9 = -INFINITY;
    double v10 = INFINITY;
    do
    {
      int v11 = *(unsigned __int8 *)(*((void *)this + 4) + v2);
      if (*(_BYTE *)(*((void *)this + 2) + v2) == 1)
      {
        if (*(_BYTE *)(*((void *)this + 4) + v2))
        {
          if (v11 == 1)
          {
          }

          else
          {
            ++v4;
            double v8 = v8 + *(double *)(*((void *)this + 3) + 8 * v2);
          }
        }

        else if (v10 >= *(double *)(*((void *)this + 3) + 8 * v2))
        {
          double v10 = *(double *)(*((void *)this + 3) + 8 * v2);
        }
      }

      else if (*(_BYTE *)(*((void *)this + 4) + v2))
      {
        if (v11 == 1)
        {
        }

        else
        {
          ++v3;
          double v5 = v5 + *(double *)(*((void *)this + 3) + 8 * v2);
        }
      }

      else if (v6 >= *(double *)(*((void *)this + 3) + 8 * v2))
      {
        double v6 = *(double *)(*((void *)this + 3) + 8 * v2);
      }

      ++v2;
    }

    while (v1 != v2);
    if (v4 > 0)
    {
      double v12 = v8 / (double)v4;
      goto LABEL_27;
    }
  }

  double v12 = (v10 + v9) * 0.5;
LABEL_27:
  if (v3 < 1) {
    double v13 = (v6 + v7) * 0.5;
  }
  else {
    double v13 = v5 / (double)v3;
  }
  *(double *)(*((void *)this + 15) + 32LL) = (v12 + v13) * 0.5;
  return (v12 - v13) * 0.5;
}

_OWORD *svm_train(int *a1, uint64_t a2)
{
  int v4 = malloc(0xB0uLL);
  double v5 = v4;
  __int128 v6 = *(_OWORD *)(a2 + 48);
  __int128 v7 = *(_OWORD *)(a2 + 80);
  v4[4] = *(_OWORD *)(a2 + 64);
  v4[5] = v7;
  __int128 v8 = *(_OWORD *)(a2 + 16);
  __int128 v9 = *(_OWORD *)(a2 + 32);
  *int v4 = *(_OWORD *)a2;
  v4[1] = v8;
  *((void *)v4 + 12) = *(void *)(a2 + 96);
  v4[2] = v9;
  v4[3] = v6;
  int v10 = *(_DWORD *)a2;
  unsigned int v11 = *(_DWORD *)a2 - 2;
  *((_DWORD *)v4 + 42) = 0;
  v273 = v4;
  if (v11 <= 2)
  {
    *((_DWORD *)v4 + 2std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 2;
    double v12 = malloc(8uLL);
    *(_OWORD *)((char *)v5 + 13std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0u;
    *(_OWORD *)((char *)v5 + 152) = 0u;
    *((void *)v5 + 15) = v12;
    if (*(_DWORD *)(a2 + 100) && (v10 - 3) <= 1)
    {
      double v13 = (double *)malloc(8uLL);
      *((void *)v5 + 17) = v13;
      double v14 = (double *)malloc(8LL * *a1);
      uint64_t v315 = *(void *)(a2 + 96);
      __int128 v15 = *(_OWORD *)(a2 + 64);
      __int128 v314 = *(_OWORD *)(a2 + 80);
      __int128 v16 = *(_OWORD *)(a2 + 16);
      __int128 v309 = *(_OWORD *)a2;
      __int128 v310 = v16;
      __int128 v17 = *(_OWORD *)(a2 + 32);
      __int128 v312 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)v313 = v15;
      __int128 v311 = v17;
      HIDWORD(v315) = 0;
      svm_cross_validation(a1, &v309, 5LL, (uint64_t)v14);
      uint64_t v18 = *a1;
      if ((int)v18 < 1)
      {
        int v25 = 0;
        double v27 = 0.0;
      }

      else
      {
        uint64_t v19 = (double *)*((void *)a1 + 1);
        double v20 = 0.0;
        uint64_t v21 = *a1;
        double v22 = v14;
        do
        {
          double v23 = *v19++;
          double v24 = *v22;
          *double v22 = v23 - *v22;
          ++v22;
          double v20 = v20 + vabdd_f64(v23, v24);
          --v21;
        }

        while (v21);
        int v25 = 0;
        double v26 = sqrt(v20 / (double)(int)v18 * (v20 / (double)(int)v18 + v20 / (double)(int)v18)) * 5.0;
        double v27 = 0.0;
        uint64_t v28 = v18;
        double v29 = v14;
        do
        {
          double v30 = *v29++;
          double v31 = fabs(v30);
          BOOL v32 = v31 <= v26;
          if (v31 > v26) {
            double v31 = -0.0;
          }
          double v27 = v27 + v31;
          if (!v32) {
            ++v25;
          }
          --v28;
        }

        while (v28);
      }

      double v246 = v27 / (double)((int)v18 - v25);
      info( "Prob. model for test data: target int value = predicted value + z,\n z: Laplace distribution e^(-|z|/sigma)/(2sigma),sigma= %g\n",  v246);
      free(v14);
      *double v13 = v246;
    }

    v247 = (double *)svm_train_one(a1, a2, 0.0, 0.0);
    uint64_t v249 = v248;
    v250 = malloc(8uLL);
    *((void *)v5 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v250;
    void *v250 = v249;
    uint64_t v251 = *a1;
    if ((int)v251 < 1)
    {
      unsigned int v252 = 0;
    }

    else
    {
      unsigned int v252 = 0;
      uint64_t v253 = *a1;
      v254 = v247;
      do
      {
        double v255 = *v254++;
        int v256 = v255 < 0.0;
        if (v255 > 0.0) {
          int v256 = 1;
        }
        v252 += v256;
        --v253;
      }

      while (v253);
    }

    *((_DWORD *)v5 + 27) = v252;
    v257 = v5;
    size_t v258 = 8LL * v252;
    v259 = malloc(v258);
    *((void *)v257 + 14) = v259;
    v260 = (double *)malloc(v258);
    *double v12 = v260;
    if ((int)v251 >= 1)
    {
      uint64_t v261 = 0LL;
      int v262 = 0;
      do
      {
        double v263 = v247[v261];
        if (v263 != 0.0)
        {
          v259[v262] = *(void *)(*((void *)a1 + 2) + v261 * 8);
          v260[v262++] = v263;
        }

        ++v261;
      }

      while (v251 != v261);
    }

    free(v247);
    return v273;
  }

  size_t v33 = *a1;
  size_t v34 = *a1;
  v306 = 0LL;
  v307 = 0LL;
  v305 = 0LL;
  uint64_t v35 = (int *)malloc(4 * v33);
  svm_group_classes(a1, (int *)&v308, &v307, &v306, &v305, (uint64_t)v35);
  uint64_t v36 = malloc(8 * v33);
  uint64_t v37 = v36;
  __int size = v33;
  if ((int)v33 >= 1)
  {
    uint64_t v38 = *((void *)a1 + 2);
    size_t v39 = v34;
    double v40 = v35;
    double v41 = v36;
    do
    {
      uint64_t v42 = *v40++;
      *v41++ = *(void *)(v38 + 8 * v42);
      --v39;
    }

    while (v39);
  }

  size_t v270 = v34;
  v265 = v35;
  uint64_t v43 = v308;
  v284 = malloc(8LL * (int)v308);
  int v44 = v43 - 1;
  if ((int)v43 >= 1)
  {
    uint64_t v45 = *(void *)(a2 + 48);
    uint64_t v46 = v43;
    uint64_t v47 = v284;
    do
    {
      *v47++ = v45;
      --v46;
    }

    while (v46);
  }

  int v48 = *(_DWORD *)(a2 + 56);
  if (v48 >= 1)
  {
    uint64_t v49 = 0LL;
    int v50 = v307;
    int v51 = (FILE **)MEMORY[0x1895F89D0];
    do
    {
      if ((int)v43 < 1)
      {
        LODWORD(v52) = 0;
      }

      else
      {
        uint64_t v52 = 0LL;
        while (*(_DWORD *)(*(void *)(a2 + 64) + 4 * v49) != v50[v52])
        {
          if (v43 == ++v52) {
            goto LABEL_29;
          }
        }
      }

      if ((_DWORD)v52 == (_DWORD)v43)
      {
LABEL_29:
        fprintf( *v51,  "warning: class label %d specified in weight is not found\n",  *(_DWORD *)(*(void *)(a2 + 64) + 4 * v49));
        int v48 = *(_DWORD *)(a2 + 56);
      }

      else
      {
      }

      ++v49;
    }

    while (v49 < v48);
  }

  double v53 = (char *)malloc(__size);
  double v54 = v53;
  int v266 = v43 - 1;
  int v271 = v44 * v43;
  uint64_t v55 = malloc(16LL * (v44 * (int)v43 / 2));
  uint64_t v267 = (uint64_t)(int)(v44 * v43 + (v44 * (int)v43 < 0)) >> 1;
  size_t v56 = 8 * v267;
  uint64_t v268 = 8 * v267;
  if (*(_DWORD *)(a2 + 100))
  {
    double v57 = malloc(v56);
    std::string __src = (double *)malloc(v56);
  }

  else
  {
    std::string __src = 0LL;
    double v57 = 0LL;
  }

  uint64_t v58 = (int)v43;
  v277 = v54;
  v278 = v37;
  v293 = v57;
  uint64_t v272 = (int)v43;
  uint64_t v59 = 0LL;
  LODWORD(v60) = 0;
  v280 = v305;
  v281 = v306;
  double v61 = 1.0;
  double v62 = -1.0;
  uint64_t v63 = 1LL;
  uint64_t v282 = v43;
  v276 = v55;
  uint64_t v290 = a2;
  do
  {
    uint64_t v64 = v59 + 1;
    if (v59 + 1 >= v58) {
      goto LABEL_160;
    }
    uint64_t v274 = v59 + 1;
    uint64_t v275 = v63;
    uint64_t v60 = (int)v60;
    double v65 = *(double *)&v284[v59];
    uint64_t v283 = v59;
    double v279 = v65;
    do
    {
      uint64_t v286 = v281[v59];
      uint64_t v288 = v281[v63];
      uint64_t v289 = v63;
      uint64_t v66 = (int)v280[v59];
      uint64_t v67 = v280[v59];
      uint64_t v68 = v280[v63];
      unsigned int v302 = v68 + v66;
      v304 = malloc(8LL * ((int)v68 + (int)v66));
      v303 = malloc(8LL * ((int)v68 + (int)v66));
      uint64_t v287 = v66;
      if ((int)v66 >= 1)
      {
        uint64_t v69 = 0LL;
        do
        {
          *(void *)((char *)v304 + v69 * 8) = v37[v286 + v69];
          *(void *)((char *)v303 + v69 * 8) = 0x3FF0000000000000LL;
          ++v69;
        }

        while (v67 != v69);
      }

      if ((int)v68 >= 1)
      {
        uint64_t v70 = 8 * v66;
        uint64_t v71 = v68;
        double v72 = &v37[v288];
        do
        {
          uint64_t v73 = *v72++;
          *(void *)((char *)v304 + v70) = v73;
          *(void *)((char *)v303 + v70) = 0xBFF0000000000000LL;
          v70 += 8LL;
          --v71;
        }

        while (v71);
      }

      double v74 = *(double *)&v284[v289];
      if (!*(_DWORD *)(a2 + 100)) {
        goto LABEL_146;
      }
      uint64_t v294 = v60;
      double v75 = (int *)malloc(4LL * ((int)v68 + (int)v66));
      double v76 = (double *)malloc(8LL * ((int)v68 + (int)v66));
      if ((int)v68 + (int)v66 >= 1)
      {
        uint64_t v77 = 0LL;
        do
        {
          v75[v77] = v77;
          ++v77;
        }

        while ((_DWORD)v68 + (_DWORD)v66 != v77);
        int v78 = 0;
        uint64_t v79 = 0LL;
        do
        {
          int v80 = rand();
          uint64_t v81 = (int)v302;
          uint64_t v82 = v79 + v80 % (int)(v78 + v302);
          int v83 = v75[v79];
          v75[v79] = v75[v82];
          v75[v82] = v83;
          ++v79;
          --v78;
        }

        while (v79 < v81);
      }

      int v84 = 0;
      do
      {
        uint64_t v85 = (int)v302;
        int v86 = v302 * v84;
        uint64_t v87 = ((int)(v302 * v84++) / 5);
        int v88 = (int)(v302 * v84) / 5;
        int v316 = v87 - v88 + v302;
        size_t v89 = 8LL * v316;
        v318 = malloc(v89);
        uint64_t v90 = (double *)malloc(v89);
        v317 = v90;
        if (v86 < 5)
        {
          LODWORD(v9std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = 0;
        }

        else
        {
          uint64_t v91 = 0LL;
          do
          {
            uint64_t v92 = v75[v91];
            v318[v91] = *((void *)v304 + v92);
            uint64_t v90 = v317;
            v317[v91++] = *((double *)v303 + v92);
          }

          while (v87 != v91);
          LODWORD(v9std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v86 / 5;
        }

        if (v88 < (int)v85)
        {
          double v94 = &v75[v88];
          uint64_t v95 = v93;
          uint64_t v96 = v85 - v88;
          do
          {
            uint64_t v97 = *v94++;
            v318[v95] = *((void *)v304 + v97);
            uint64_t v90 = v317;
            v317[v95++] = *((double *)v303 + v97);
            LODWORD(v9std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v93 + 1;
            --v96;
          }

          while (v96);
        }

        if ((_DWORD)v93)
        {
          int v98 = 0;
          int v99 = 0;
          uint64_t v93 = v93;
          do
          {
            double v100 = *v90++;
            if (v100 <= 0.0) {
              ++v98;
            }
            else {
              ++v99;
            }
            --v93;
          }

          while (v93);
        }

        else
        {
          int v99 = 0;
          int v98 = 0;
        }

        if (v99 | v98)
        {
          if (v99) {
            BOOL v104 = v98 == 0;
          }
          else {
            BOOL v104 = 0;
          }
          if (v104)
          {
            if ((int)v87 < v88)
            {
              uint64_t v117 = &v75[(int)v87];
              uint64_t v118 = v88 - (uint64_t)(int)v87;
              do
              {
                uint64_t v119 = *v117++;
                v76[v119] = 1.0;
                --v118;
              }

              while (v118);
            }
          }

          else
          {
            if (v99) {
              BOOL v105 = 1;
            }
            else {
              BOOL v105 = v98 == 0;
            }
            if (v105)
            {
              uint64_t v315 = *(void *)(v290 + 96);
              __int128 v106 = *(_OWORD *)(v290 + 64);
              __int128 v314 = *(_OWORD *)(v290 + 80);
              __int128 v107 = *(_OWORD *)(v290 + 16);
              __int128 v309 = *(_OWORD *)v290;
              __int128 v310 = v107;
              __int128 v108 = *(_OWORD *)(v290 + 32);
              HIDWORD(v312) = HIDWORD(*(_OWORD *)(v290 + 48));
              *(_OWORD *)v313 = v106;
              __int128 v311 = v108;
              HIDWORD(v315) = 0;
              *(void *)&__int128 v312 = 0x3FF0000000000000LL;
              DWORD2(v312) = 2;
              uint64_t v109 = malloc(8uLL);
              v313[0] = v109;
              float v110 = (double *)malloc(0x10uLL);
              v313[1] = v110;
              *uint64_t v109 = 0xFFFFFFFF00000001LL;
              *float v110 = v65;
              v110[1] = v74;
              uint64_t v111 = svm_train(&v316, &v309);
              uint64_t v112 = (int **)v111;
              if ((int)v87 >= v88)
              {
                if (v111) {
                  goto LABEL_97;
                }
              }

              else
              {
                uint64_t v113 = v88;
                __int128 v114 = &v75[(int)v87];
                uint64_t v115 = v113 - (int)v87;
                do
                {
                  uint64_t v116 = *v114++;
                  svm_predict_values((uint64_t)v112, *((double **)v304 + v116), &v76[v116]);
                  v76[v116] = v76[v116] * (double)*v112[19];
                  --v115;
                }

                while (v115);
LABEL_97:
                svm_free_model_content((uint64_t)v112);
                free(v112);
              }

              free(v313[0]);
              free(v313[1]);
              goto LABEL_99;
            }

            if ((int)v87 < v88)
            {
              double v120 = &v75[(int)v87];
              uint64_t v121 = v88 - (uint64_t)(int)v87;
              do
              {
                uint64_t v122 = *v120++;
                v76[v122] = -1.0;
                --v121;
              }

              while (v121);
            }
          }
        }

        else if ((int)v87 < v88)
        {
          double v101 = &v75[(int)v87];
          uint64_t v102 = v88 - (uint64_t)(int)v87;
          do
          {
            uint64_t v103 = *v101++;
            v76[v103] = 0.0;
            --v102;
          }

          while (v102);
        }

LABEL_99:
        free(v318);
        free(v317);
      }

      while (v84 != 5);
      double v285 = v74;
      uint64_t v123 = v302;
      uint64_t v124 = (double *)v303;
      int v292 = v302;
      if ((int)v302 < 1)
      {
        double v128 = 0.0;
        double v125 = 0.0;
      }

      else
      {
        double v125 = 0.0;
        uint64_t v126 = (double *)v303;
        uint64_t v127 = v302;
        double v128 = 0.0;
        do
        {
          double v129 = *v126++;
          if (v129 > 0.0) {
            double v125 = v125 + v61;
          }
          else {
            double v128 = v128 + v61;
          }
          --v127;
        }

        while (v127);
      }

      uint64_t v130 = (double *)malloc(8LL * (int)v302);
      v293[v294] = 0LL;
      double v131 = log((v128 + v61) / (v125 + v61));
      __src[v294] = v131;
      if ((int)v123 <= 0)
      {
        double v134 = 0.0;
      }

      else
      {
        double v132 = (v125 + v61) / (v125 + 2.0);
        double v133 = *(double *)&v293[v294];
        double v134 = 0.0;
        double v135 = v130;
        double v136 = v76;
        uint64_t v137 = v123;
        double v138 = v61 / (v128 + 2.0);
        do
        {
          double v139 = *v124++;
          if (v139 <= 0.0) {
            double v140 = v138;
          }
          else {
            double v140 = v132;
          }
          *v135++ = v140;
          double v141 = *v136++;
          double v142 = v131 + v141 * v133;
          double v143 = -v142;
          if (v142 >= 0.0)
          {
            double v144 = v140;
          }

          else
          {
            double v143 = v142;
            double v144 = v140 + v62;
          }

          double v145 = exp(v143);
          double v146 = log(v145 + v61) + v144 * v142;
          double v62 = -1.0;
          double v134 = v134 + v146;
          --v137;
        }

        while (v137);
      }

      int v147 = 0;
      while (1)
      {
        double v299 = v134;
        double v300 = v131;
        if (v292 < 1)
        {
          double v156 = 0.0;
          double v155 = 0.0;
          double v149 = 0.0;
          double v154 = 1.0e-12;
          double v153 = 1.0e-12;
        }

        else
        {
          double v148 = *(double *)&v293[v294];
          double v149 = 0.0;
          uint64_t v150 = v76;
          uint64_t v151 = v130;
          uint64_t v152 = v123;
          double v153 = 1.0e-12;
          double v154 = 1.0e-12;
          double v155 = 0.0;
          double v156 = 0.0;
          do
          {
            double v157 = *v150;
            double v158 = v300 + *v150 * v148;
            if (v158 >= 0.0)
            {
              double v162 = exp(-v158);
              double v160 = v162 / (v162 + v61);
              double v161 = v61 / (v162 + v61);
            }

            else
            {
              double v159 = exp(v158);
              double v160 = v61 / (v159 + v61);
              double v161 = v159 / (v159 + v61);
            }

            double v163 = v161 * v160;
            double v154 = v154 + v157 * v157 * v163;
            double v153 = v153 + v163;
            double v164 = *v151++;
            double v156 = v156 + v157 * v163;
            double v155 = v155 + v157 * (v164 - v160);
            double v149 = v149 + v164 - v160;
            ++v150;
            --v152;
          }

          while (v152);
        }

        if (fabs(v155) < 0.00001 && fabs(v149) < 0.00001) {
          break;
        }
        double v165 = v154 * v153 - v156 * v156;
        double v297 = -(v149 * v154 + -v156 * v155) / v165;
        double v298 = -(v153 * v155 - v156 * v149) / v165;
        double v295 = *(double *)&v293[v294];
        double v296 = v149 * v297 + v155 * v298;
        double v166 = 1.0;
        while (1)
        {
          double v167 = v295 + v166 * v298;
          double v131 = v300 + v166 * v297;
          double v168 = 0.0;
          if ((int)v123 >= 1)
          {
            uint64_t v169 = v76;
            uint64_t v170 = v130;
            uint64_t v171 = v123;
            do
            {
              double v172 = *v169++;
              double v173 = v172;
              double v174 = *v170++;
              double v175 = v174;
              double v176 = v131 + v173 * v167;
              double v177 = -v176;
              double v178 = v174 + -1.0;
              if (v176 >= 0.0)
              {
                double v179 = v175;
              }

              else
              {
                double v177 = v176;
                double v179 = v178;
              }

              double v180 = exp(v177);
              double v168 = v168 + log(v180 + 1.0) + v179 * v176;
              --v171;
            }

            while (v171);
          }

          if (v168 < v299 + v166 * 0.0001 * v296) {
            break;
          }
          double v166 = v166 * 0.5;
          if (v166 < 1.0e-10)
          {
            double v61 = 1.0;
            double v134 = v299;
            double v131 = v300;
            goto LABEL_141;
          }
        }

        *(double *)&v293[v294] = v167;
        __src[v294] = v131;
        double v134 = v168;
        double v61 = 1.0;
LABEL_141:
        if (v166 < 1.0e-10)
        {
          info("Line search fails in two-class probability estimates\n");
          break;
        }

        if (++v147 == 100)
        {
          info("Reaching maximal iterations in two-class probability estimates\n");
          break;
        }
      }

      free(v130);
      free(v76);
      free(v75);
      double v54 = v277;
      uint64_t v37 = v278;
      uint64_t v55 = v276;
      a2 = v290;
      uint64_t v60 = v294;
      double v62 = -1.0;
      double v65 = v279;
      double v74 = v285;
LABEL_146:
      uint64_t v181 = (double *)svm_train_one((int *)&v302, a2, v65, v74);
      uint64_t v182 = (double **)&v55[2 * v60];
      *uint64_t v182 = v181;
      v182[1] = v183;
      if ((int)v67 >= 1)
      {
        uint64_t v184 = &v54[v286];
        int v185 = v181;
        do
        {
          if (!*v184 && *v185 != 0.0) {
            *uint64_t v184 = 1;
          }
          ++v184;
          ++v185;
          --v67;
        }

        while (v67);
      }

      if ((int)v68 >= 1)
      {
        int v186 = &v181[v287];
        clock_t v187 = &v54[v288];
        do
        {
          if (!*v187 && *v186 != 0.0) {
            *clock_t v187 = 1;
          }
          ++v186;
          ++v187;
          --v68;
        }

        while (v68);
      }

      free(v304);
      free(v303);
      ++v60;
      uint64_t v63 = v289 + 1;
      uint64_t v43 = v282;
      uint64_t v59 = v283;
    }

    while (v289 + 1 != v282);
    uint64_t v58 = v272;
    double v5 = v273;
    uint64_t v64 = v274;
    uint64_t v63 = v275;
LABEL_160:
    ++v63;
    uint64_t v59 = v64;
  }

  while (v64 != v43);
LABEL_161:
  *((_DWORD *)v5 + 2std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v43;
  size_t v188 = 4 * v58;
  v189 = malloc(4 * v58);
  *((void *)v5 + 19) = v189;
  if ((int)v43 >= 1)
  {
    v190 = (int *)v307;
    uint64_t v191 = v43;
    do
    {
      int v192 = *v190++;
      *v189++ = v192;
      --v191;
    }

    while (v191);
  }

  double v193 = malloc(v268);
  *((void *)v5 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v193;
  if (v271 > 1)
  {
    uint64_t v194 = v267;
    __int128 v195 = v55 + 1;
    do
    {
      uint64_t v196 = *v195;
      v195 += 2;
      *v193++ = v196;
      --v194;
    }

    while (v194);
  }

  if (*(_DWORD *)(a2 + 100))
  {
    unsigned int v197 = malloc(v268);
    *((void *)v5 + 17) = v197;
    uint64_t v198 = malloc(v268);
    *((void *)v5 + 18) = v198;
    if (v271 > 1)
    {
      unsigned int v199 = v198;
      memcpy(v197, v293, 8LL * (v267 - 1) + 8);
      double v54 = v277;
      memcpy(v199, __src, 8LL * (v267 - 1) + 8);
    }
  }

  else
  {
    *((void *)v5 + 17) = 0LL;
    *((void *)v5 + 18) = 0LL;
  }

  unsigned int v200 = (int *)malloc(v188);
  int v201 = malloc(v188);
  *((void *)v5 + 20) = v201;
  if ((int)v43 < 1)
  {
    int v203 = 0;
    int v206 = v266;
  }

  else
  {
    uint64_t v202 = 0LL;
    int v203 = 0;
    v204 = v305;
    v205 = v306;
    int v206 = v266;
    do
    {
      uint64_t v207 = v204[v202];
      if ((int)v207 < 1)
      {
        int v208 = 0;
      }

      else
      {
        int v208 = 0;
        v209 = &v54[v205[v202]];
        do
        {
          int v210 = *v209++;
          v203 += v210;
          v208 += v210;
          --v207;
        }

        while (v207);
      }

      v201[v202] = v208;
      v200[v202++] = v208;
    }

    while (v202 != v43);
  }

  info("Total nSV = %d\n", v203);
  *((_DWORD *)v5 + 27) = v203;
  size_t v211 = 8LL * v203;
  v212 = malloc(v211);
  *((void *)v5 + 14) = v212;
  if ((int)v270 >= 1)
  {
    int v213 = 0;
    uint64_t v214 = __size;
    v215 = (unsigned __int8 *)v54;
    do
    {
      if (*v215++) {
        v212[v213++] = *v37;
      }
      ++v37;
      --v214;
    }

    while (v214);
  }

  v217 = malloc(v188);
  v218 = v217;
  _DWORD *v217 = 0;
  v301 = v200;
  if ((int)v43 <= 1)
  {
    v223 = malloc(8LL * v206);
    *((void *)v5 + 15) = v223;
  }

  else
  {
    int v219 = 0;
    v220 = v217 + 1;
    uint64_t v221 = v43 - 1;
    do
    {
      int v222 = *v200++;
      v219 += v222;
      *v220++ = v219;
      --v221;
    }

    while (v221);
    v223 = malloc(8LL * v206);
    uint64_t v224 = 0LL;
    *((void *)v5 + 15) = v223;
    do
      v223[v224++] = malloc(v211);
    while (v206 != v224);
    double v54 = v277;
  }

  v225 = v305;
  v226 = v306;
  if ((int)v43 >= 1)
  {
    uint64_t v227 = 0LL;
    LODWORD(v228) = 0;
    uint64_t v229 = 1LL;
    do
    {
      uint64_t v230 = v227 + 1;
      if (v227 + 1 < v272)
      {
        uint64_t v231 = v225[v227];
        int v232 = v218[v227];
        uint64_t v228 = (int)v228;
        v233 = &v54[v226[v227]];
        uint64_t v234 = v229;
        do
        {
          uint64_t v235 = v226[v234];
          uint64_t v236 = v225[v234];
          if ((int)v231 >= 1)
          {
            uint64_t v237 = 0LL;
            int v238 = v232;
            do
            {
              if (v233[v237]) {
                *(void *)(v223[v234 - 1] + 8LL * v238++) = *(void *)(v55[2 * v228] + 8 * v237);
              }
              ++v237;
            }

            while (v231 != v237);
          }

          if ((int)v236 >= 1)
          {
            int v239 = v218[v234];
            v240 = &v54[v235];
            uint64_t v241 = 8LL * (int)v231;
            do
            {
              if (*v240++) {
                *(void *)(v223[v227] + 8LL * v239++) = *(void *)(v55[2 * v228] + v241);
              }
              v241 += 8LL;
              --v236;
            }

            while (v236);
          }

          ++v228;
          ++v234;
        }

        while (v234 != v43);
      }

      ++v229;
      ++v227;
    }

    while (v230 != v43);
  }

  free(v307);
  free(v293);
  free(__src);
  free(v225);
  free(v265);
  free(v226);
  free(v278);
  free(v284);
  free(v54);
  if (v271 > 1)
  {
    uint64_t v243 = v267;
    v244 = (void **)v55;
    do
    {
      v245 = *v244;
      v244 += 2;
      free(v245);
      --v243;
    }

    while (v243);
  }

  free(v55);
  free(v301);
  free(v218);
  return v5;
}

void *svm_train_one(int *a1, uint64_t a2, double a3, double a4)
{
  size_t v8 = *a1;
  __int128 v9 = malloc(8 * v8);
  uint64_t v10 = v8;
  switch(*(_DWORD *)a2)
  {
    case 0:
      if ((v8 & 0x80000000) != 0LL) {
        size_t v11 = -1LL;
      }
      else {
        size_t v11 = 8 * v8;
      }
      double v12 = operator new[](v11);
      double v13 = (char *)operator new[](v8);
      double v14 = v13;
      if ((int)v8 >= 1)
      {
        __int128 v15 = (double *)*((void *)a1 + 1);
        __int128 v16 = v9;
        __int128 v17 = v12;
        uint64_t v18 = v13;
        uint64_t v19 = v8;
        do
        {
          *v16++ = 0LL;
          *v17++ = 0xBFF0000000000000LL;
          double v20 = *v15++;
          if (v20 > 0.0) {
            char v21 = 1;
          }
          else {
            char v21 = -1;
          }
          *v18++ = v21;
          --v19;
        }

        while (v19);
      }

      v106[0] = off_18A04E760;
      SVC_Q::SVC_Q(v105, a1, a2, v13);
      Solver::Solve( (uint64_t)v106,  v8,  (uint64_t)v105,  v12,  v14,  v9,  (uint64_t)&v101,  *(_DWORD *)(a2 + 96),  a3,  a4,  *(double *)(a2 + 40));
      SVC_Q::~SVC_Q((SVC_Q *)v105);
      double v22 = 0.0;
      if ((int)v8 >= 1)
      {
        double v23 = (double *)v9;
        uint64_t v24 = v8;
        do
        {
          double v25 = *v23++;
          double v22 = v22 + v25;
          --v24;
        }

        while (v24);
      }

      if (a3 == a4) {
        info("nu = %f\n", v22 / ((double)*a1 * a3));
      }
      if ((int)v8 >= 1)
      {
        double v26 = v14;
        double v27 = (double *)v9;
        do
        {
          int v28 = *v26++;
          *double v27 = *v27 * (double)v28;
          ++v27;
          --v10;
        }

        while (v10);
      }

      goto LABEL_85;
    case 1:
      double v66 = *(double *)(a2 + 80);
      uint64_t v67 = (char *)operator new[](v8);
      uint64_t v68 = v67;
      if ((int)v8 <= 0)
      {
        if ((_DWORD)v8) {
          size_t v84 = -1LL;
        }
        else {
          size_t v84 = 0LL;
        }
        int v83 = operator new[](v84);
      }

      else
      {
        uint64_t v69 = (double *)*((void *)a1 + 1);
        uint64_t v70 = v67;
        uint64_t v71 = v8;
        do
        {
          double v72 = *v69++;
          if (v72 > 0.0) {
            char v73 = 1;
          }
          else {
            char v73 = -1;
          }
          *v70++ = v73;
          --v71;
        }

        while (v71);
        double v74 = v66 * (double)(int)v8 * 0.5;
        double v75 = v67;
        double v76 = (double *)v9;
        uint64_t v77 = v8;
        double v78 = v74;
        do
        {
          int v80 = *v75++;
          int v79 = v80;
          if (v78 <= 1.0) {
            double v81 = v78;
          }
          else {
            double v81 = 1.0;
          }
          if (v74 <= 1.0) {
            double v82 = v74;
          }
          else {
            double v82 = 1.0;
          }
          if (v79 == 1) {
            double v81 = v82;
          }
          else {
            double v78 = v78 - v81;
          }
          if (v79 == 1) {
            double v74 = v74 - v82;
          }
          *v76++ = v81;
          --v77;
        }

        while (v77);
        int v83 = operator new[](8 * v8);
        bzero(v83, 8 * v10);
      }

      v106[0] = off_18A04E7A8;
      SVC_Q::SVC_Q(v105, a1, a2, v68);
      double v85 = *(double *)(a2 + 40);
      int v86 = *(_DWORD *)(a2 + 96);
      __int128 v107 = &v101;
      Solver::Solve((uint64_t)v106, v10, (uint64_t)v105, v83, v68, v9, (uint64_t)&v101, v86, 1.0, 1.0, v85);
      SVC_Q::~SVC_Q((SVC_Q *)v105);
      double v100 = v104;
      double v87 = 1.0 / v104;
      info("C = %f\n", 1.0 / v104);
      if ((int)v10 >= 1)
      {
        int v88 = v68;
        size_t v89 = (double *)v9;
        do
        {
          int v90 = *v88++;
          *size_t v89 = *v89 * ((double)v90 / v100);
          ++v89;
          --v10;
        }

        while (v10);
      }

      v91.f64[0] = v100 * v100;
      v91.f64[1] = v100;
      float64x2_t v101 = vdivq_f64(v101, v91);
      double v102 = v87;
      double v103 = v87;
      operator delete[](v68);
      double v65 = v83;
      goto LABEL_86;
    case 2:
      if ((v8 & 0x80000000) != 0LL) {
        size_t v29 = -1LL;
      }
      else {
        size_t v29 = 8 * v8;
      }
      double v12 = operator new[](v29);
      double v14 = (char *)operator new[](v8);
      double v30 = *(double *)(a2 + 80);
      double v31 = (double)(int)v8;
      int v32 = (int)(v30 * (double)(int)v8);
      if (v32 >= 1) {
        memset_pattern16(v9, &unk_18744C8C0, 8LL * v32);
      }
      if ((int)v10 >= 1)
      {
        bzero(v12, 8 * v10);
        memset(v14, 1, v10);
      }

      v106[0] = off_18A04E760;
      ONE_CLASS_Q::ONE_CLASS_Q(v105, a1, a2);
      Solver::Solve( (uint64_t)v106,  v10,  (uint64_t)v105,  v12,  v14,  v9,  (uint64_t)&v101,  *(_DWORD *)(a2 + 96),  1.0,  1.0,  *(double *)(a2 + 40));
      ONE_CLASS_Q::~ONE_CLASS_Q((ONE_CLASS_Q *)v105);
      goto LABEL_85;
    case 3:
      uint64_t v33 = 2 * v8;
      if ((v8 & 0x80000000) != 0LL) {
        size_t v34 = -1LL;
      }
      else {
        size_t v34 = 16 * v8;
      }
      uint64_t v35 = operator new[](v34);
      double v12 = operator new[](v34);
      uint64_t v36 = (char *)operator new[](v33);
      double v14 = v36;
      if ((int)v10 >= 1)
      {
        uint64_t v37 = 0LL;
        double v38 = *(double *)(a2 + 88);
        uint64_t v39 = *((void *)a1 + 1);
        uint64_t v40 = v10;
        uint64_t v41 = v10;
        do
        {
          v35[v37] = 0LL;
          double v42 = *(double *)(v39 + 8 * v37);
          *(double *)&v12[v37] = v38 - v42;
          v36[v37] = 1;
          v35[v40] = 0LL;
          *(double *)&v12[v40] = v38 + v42;
          v36[v40] = -1;
          ++v37;
          ++v40;
          --v41;
        }

        while (v41);
      }

      v105[0] = off_18A04E760;
      SVR_Q::SVR_Q((uint64_t)v106, (uint64_t)a1, a2);
      Solver::Solve( (uint64_t)v105,  v33,  (uint64_t)v106,  v12,  v14,  v35,  (uint64_t)&v101,  *(_DWORD *)(a2 + 96),  *(double *)(a2 + 48),  *(double *)(a2 + 48),  *(double *)(a2 + 40));
      SVR_Q::~SVR_Q((SVR_Q *)v106);
      if ((int)v10 < 1)
      {
        double v44 = 0.0;
      }

      else
      {
        uint64_t v43 = 0LL;
        double v44 = 0.0;
        do
        {
          double v45 = *(double *)&v35[v43];
          double v46 = *(double *)&v35[v10 + v43];
          *(double *)&v9[v43] = v45 - v46;
          double v44 = v44 + vabdd_f64(v45, v46);
          ++v43;
        }

        while (v10 != v43);
      }

      info("nu = %f\n", v44 / (*(double *)(a2 + 48) * (double)(int)v10));
      operator delete[](v35);
LABEL_85:
      operator delete[](v12);
      double v65 = v14;
      goto LABEL_86;
    case 4:
      double v47 = *(double *)(a2 + 48);
      int v48 = 2 * v8;
      if ((v8 & 0x80000000) != 0LL) {
        size_t v49 = -1LL;
      }
      else {
        size_t v49 = 8LL * v48;
      }
      int v50 = (double *)operator new[](v49);
      int v51 = (double *)operator new[](v49);
      uint64_t v52 = operator new[](v48);
      double v53 = v52;
      if ((int)v8 >= 1)
      {
        double v54 = v47 * *(double *)(a2 + 80) * (double)(int)v8 * 0.5;
        uint64_t v55 = (double *)*((void *)a1 + 1);
        size_t v56 = v50;
        double v57 = v51;
        uint64_t v58 = v52;
        uint64_t v59 = v8;
        do
        {
          if (v54 >= v47) {
            double v60 = v47;
          }
          else {
            double v60 = v54;
          }
          v56[v8] = v60;
          *v56++ = v60;
          double v61 = *v55++;
          *double v57 = -v61;
          _BYTE *v58 = 1;
          v57[v8] = v61;
          v58[v8] = -1;
          double v54 = v54 - v60;
          ++v58;
          ++v57;
          --v59;
        }

        while (v59);
      }

      v106[0] = off_18A04E7A8;
      SVR_Q::SVR_Q((uint64_t)v105, (uint64_t)a1, a2);
      double v62 = *(double *)(a2 + 40);
      int v63 = *(_DWORD *)(a2 + 96);
      __int128 v107 = &v101;
      Solver::Solve( (uint64_t)v106,  (2 * v8),  (uint64_t)v105,  v51,  v53,  v50,  (uint64_t)&v101,  v63,  v47,  v47,  v62);
      SVR_Q::~SVR_Q((SVR_Q *)v105);
      info("epsilouint64_t n = %f\n", -v104);
      if ((int)v8 >= 1)
      {
        uint64_t v64 = 0LL;
        do
        {
          *(double *)&v9[v64] = v50[v64] - v50[v8 + v64];
          ++v64;
        }

        while (v8 != v64);
      }

      operator delete[](v50);
      operator delete[](v51);
      double v65 = (void *)v53;
LABEL_86:
      operator delete[](v65);
      break;
    default:
      break;
  }

  info("obint j = %f, rho = %f\n", v101.f64[0], v101.f64[1]);
  uint64_t v92 = *a1;
  if ((int)v92 >= 1)
  {
    unint64_t v93 = 0LL;
    int v94 = 0;
    int v95 = 0;
    uint64_t v96 = 8 * v92;
    while (1)
    {
      double v97 = *(double *)&v9[v93 / 8];
      if (v97 != 0.0)
      {
        double v98 = fabs(v97);
        ++v95;
        if (*(double *)(*((void *)a1 + 1) + v93) > 0.0)
        {
          if (v98 < v102) {
            goto LABEL_95;
          }
LABEL_94:
          ++v94;
          goto LABEL_95;
        }

        if (v98 >= v103) {
          goto LABEL_94;
        }
      }

LABEL_95:
      v93 += 8LL;
      if (v96 == v93) {
        goto LABEL_98;
      }
    }
  }

  int v95 = 0;
  int v94 = 0;
LABEL_98:
  info("nSV = %d, nBSV = %d\n", v95, v94);
  return v9;
}

void sub_18743C790( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void svm_group_classes(int *a1, int *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v7 = *a1;
  uint64_t v8 = *a1;
  __int128 v9 = malloc(0x40uLL);
  uint64_t v10 = malloc(0x40uLL);
  size_t v11 = (int *)malloc(4 * v7);
  if ((int)v7 < 1)
  {
    int v13 = 0;
  }

  else
  {
    uint64_t v12 = 0LL;
    int v13 = 0;
    int v14 = 16;
    do
    {
      int v15 = (int)*(double *)(*((void *)a1 + 1) + 8 * v12);
      if (v13 < 1)
      {
        LODWORD(v1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
      }

      else
      {
        uint64_t v16 = 0LL;
        while (v9[v16] != v15)
        {
          if (v13 == ++v16)
          {
            v11[v12] = v13;
            goto LABEL_11;
          }
        }

        ++v10[v16];
      }

      v11[v12] = v16;
      if ((_DWORD)v16 == v13)
      {
LABEL_11:
        if (v13 == v14)
        {
          v14 *= 2;
          __int128 v9 = realloc(v9, 4LL * v14);
          uint64_t v10 = realloc(v10, 4LL * v14);
        }

        v9[v13] = v15;
        v10[v13++] = 1;
      }

      ++v12;
    }

    while (v12 != v8);
  }

  __int128 v17 = malloc(4LL * v13);
  *__int128 v17 = 0;
  if (v13 > 1)
  {
    int v18 = 0;
    uint64_t v19 = v17 + 1;
    uint64_t v20 = v13 - 1LL;
    char v21 = v10;
    do
    {
      int v22 = *v21++;
      v18 += v22;
      *v19++ = v18;
      --v20;
    }

    while (v20);
  }

  if ((int)v8 >= 1)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      uint64_t v24 = v11[i];
      uint64_t v25 = (int)v17[v24];
      *(_DWORD *)(a6 + 4 * v25) = i;
      v17[v24] = v25 + 1;
    }
  }

  *__int128 v17 = 0;
  if (v13 > 1)
  {
    int v26 = 0;
    double v27 = v17 + 1;
    uint64_t v28 = v13 - 1LL;
    size_t v29 = v10;
    do
    {
      int v30 = *v29++;
      v26 += v30;
      *v27++ = v26;
      --v28;
    }

    while (v28);
  }

  *a2 = v13;
  *a3 = v9;
  *a4 = v17;
  *a5 = v10;
  free(v11);
}

void svm_cross_validation(int *a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v95 = (a3 + 1);
  uint64_t v8 = malloc(4LL * (int)v95);
  uint64_t v9 = *a1;
  uint64_t v10 = *a1;
  size_t v11 = (int *)malloc(4 * v9);
  uint64_t v12 = v11;
  BOOL v13 = (int)v9 <= (int)v5 || *a2 >= 2u;
  double v98 = a2;
  uint64_t v109 = v8;
  uint64_t v101 = v9;
  float v110 = v11;
  int v100 = v10;
  if (!v13)
  {
    uint64_t v93 = a4;
    uint64_t v111 = 0LL;
    __int128 v114 = 0LL;
    uint64_t v115 = 0LL;
    svm_group_classes(a1, (int *)v116, &v115, &v111, &v114, (uint64_t)v11);
    int v94 = (int *)malloc(4LL * (int)v5);
    int v22 = (char *)malloc(4 * v9);
    double v23 = v22;
    uint64_t v24 = v116[0];
    if ((int)v116[0] >= 1)
    {
      uint64_t v25 = 0LL;
      int v26 = v114;
      double v27 = v111;
      do
      {
        if ((int)v26[v25] >= 1)
        {
          int v28 = 0;
          int v29 = 0;
          do
          {
            int v30 = rand();
            int v31 = v26[v25];
            int v32 = v29 + v27[v25];
            int v33 = v32 + v30 % (v28 + v31);
            int v34 = *(_DWORD *)&v23[4 * v33];
            *(_DWORD *)&v23[4 * v33] = *(_DWORD *)&v23[4 * v32];
            *(_DWORD *)&v23[4 * v32] = v34;
            ++v29;
            --v28;
          }

          while (v29 < v31);
        }

        ++v25;
      }

      while (v25 != v24);
    }

    uint64_t v35 = v5;
    double v104 = v23;
    if ((int)v5 <= 0)
    {
      *uint64_t v8 = 0;
      char v92 = 1;
    }

    else
    {
      uint64_t v36 = 0LL;
      uint64_t v37 = v114;
      do
      {
        v94[v36] = 0;
        uint64_t v38 = v36 + 1;
        if ((int)v24 >= 1)
        {
          int v39 = 0;
          uint64_t v40 = v24;
          uint64_t v41 = v37;
          do
          {
            int v42 = *v41++;
            v39 += v42 * (int)v38 / (int)v5 - v42 * (int)v36 / (int)v5;
            --v40;
          }

          while (v40);
          v94[v36] = v39;
        }

        ++v36;
      }

      while (v38 != v5);
      *uint64_t v8 = 0;
      int v43 = 0;
      double v44 = v8 + 1;
      uint64_t v45 = v95 - 1;
      double v46 = v94;
      do
      {
        int v47 = *v46++;
        v43 += v47;
        *v44++ = v43;
        --v45;
      }

      while (v45);
      char v92 = 0;
    }

    if ((int)v24 >= 1)
    {
      uint64_t v102 = 0LL;
      uint64_t v96 = v114;
      double v97 = v111;
      int64x2_t v103 = vdupq_n_s64(1uLL);
      uint64_t v99 = v24;
      do
      {
        if ((int)v5 >= 1)
        {
          uint64_t v48 = 0LL;
          int v49 = v97[v102];
          int v50 = v96[v102];
          int v106 = ~v49;
          int v107 = v49;
          int v105 = v49 + 1;
          do
          {
            int v51 = v50 * (int)v48 / (int)v5;
            uint64_t v52 = v48 + 1;
            int v53 = v50 * ((int)v48 + 1) / (int)v5;
            if (v51 < v53)
            {
              uint64_t v54 = v35;
              uint64_t v55 = a1;
              uint64_t v56 = v5;
              int v57 = v53 + v107;
              int v58 = v51 + v107;
              unint64_t v59 = (int)v8[v48];
              int v60 = v105 + v51;
              if (v105 + v51 <= v57) {
                int v60 = v57;
              }
              memcpy(&v110[v59], &v104[4 * v51 + 4 * v107], 4LL * (v60 + v106 - v51) + 4);
              uint64_t v61 = 0LL;
              if (v58 + 1LL > v57) {
                uint64_t v62 = v58 + 1LL;
              }
              else {
                uint64_t v62 = v57;
              }
              uint64_t v63 = v62 - v58;
              uint64x2_t v64 = (uint64x2_t)vdupq_n_s64(v63 - 1);
              int64x2_t v65 = (int64x2_t)v59;
              do
              {
                int8x16_t v66 = (int8x16_t)v65;
                int64x2_t v65 = vaddq_s64(v65, v103);
                v61 += 2LL;
              }

              while (((v63 + 1) & 0xFFFFFFFFFFFFFFFELL) != v61);
              uint64_t v8 = v109;
              v109[v48] = vaddvq_s64((int64x2_t)vbslq_s8( (int8x16_t)vcgtq_u64( (uint64x2_t)vorrq_s8( (int8x16_t)vdupq_n_s64(v61 - 2),  (int8x16_t)xmmword_18744C8B0),  v64),  v66,  (int8x16_t)v65));
              uint64_t v5 = v56;
              a1 = v55;
              uint64_t v35 = v54;
            }

            ++v48;
          }

          while (v52 != v35);
        }

        ++v102;
      }

      while (v102 != v99);
    }

    *uint64_t v8 = 0;
    a4 = v93;
    a2 = v98;
    if ((v92 & 1) == 0)
    {
      int v67 = 0;
      uint64_t v68 = v8 + 1;
      uint64_t v69 = v95 - 1;
      uint64_t v70 = v94;
      do
      {
        int v71 = *v70++;
        v67 += v71;
        *v68++ = v67;
        --v69;
      }

      while (v69);
    }

    free(v111);
    free(v115);
    free(v114);
    free(v104);
    free(v94);
    LODWORD(v9) = v101;
    uint64_t v12 = v110;
    goto LABEL_53;
  }

  uint64_t v14 = v95;
  if ((int)v10 >= 1)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = v10;
    do
    {
      v11[v15] = v15;
      ++v15;
    }

    while (v10 != v15);
    uint64_t v17 = 0LL;
    do
    {
      uint64_t v18 = v17 + rand() % (int)v16;
      int v19 = v12[v17];
      v12[v17] = v12[v18];
      v12[v18] = v19;
      ++v17;
      --v16;
    }

    while (v16);
  }

  if ((v5 & 0x80000000) == 0)
  {
    int v20 = 0;
    char v21 = v8;
    do
    {
      *v21++ = v20 / (int)v5;
      v20 += v9;
      --v14;
    }

    while (v14);
LABEL_53:
    if ((int)v5 >= 1)
    {
      uint64_t v72 = 0LL;
      uint64_t v108 = v5;
      int v73 = *v8;
      do
      {
        int v74 = v8[++v72];
        LODWORD(v111) = v73 - v74 + v9;
        size_t v75 = 8LL * (int)v111;
        uint64_t v113 = malloc(v75);
        uint64_t v112 = malloc(v75);
        if (v73 < 1)
        {
          unsigned int v78 = 0;
        }

        else
        {
          for (uint64_t i = 0LL; i != v73; v112[i++] = *(void *)(*((void *)a1 + 1) + 8 * v77))
          {
            uint64_t v77 = v12[i];
            v113[i] = *(void *)(*((void *)a1 + 2) + 8 * v77);
          }

          unsigned int v78 = v73;
        }

        if (v74 < v100)
        {
          uint64_t v79 = v101 - v74;
          uint64_t v80 = v78;
          double v81 = (char *)&v110[v74];
          do
          {
            uint64_t v82 = *(int *)v81;
            v81 += 4;
            v113[v80] = *(void *)(*((void *)a1 + 2) + 8 * v82);
            v112[v80++] = *(void *)(*((void *)a1 + 1) + 8 * v82);
            --v79;
          }

          while (v79);
        }

        uint64_t v83 = svm_train(&v111, a2);
        size_t v84 = (_DWORD *)v83;
        if (a2[25] && *a2 <= 1u)
        {
          double v85 = malloc(8LL * *(int *)(v83 + 104));
          if (v73 < v74)
          {
            int v86 = (char *)&v110[v73];
            int v87 = v74 - v73;
            do
            {
              uint64_t v88 = *(int *)v86;
              v86 += 4;
              *(double *)(a4 + 8 * v88) = svm_predict_probability( (uint64_t)v84,  *(double **)(*((void *)a1 + 2) + 8 * v88),  (uint64_t)v85);
              --v87;
            }

            while (v87);
          }

          free(v85);
          a2 = v98;
        }

        else if (v73 < v74)
        {
          size_t v89 = (char *)&v110[v73];
          int v90 = v74 - v73;
          do
          {
            uint64_t v91 = *(int *)v89;
            v89 += 4;
            *(double *)(a4 + 8 * v91) = svm_predict(v84, *(double **)(*((void *)a1 + 2) + 8 * v91));
            --v90;
          }

          while (v90);
        }

        if (v84)
        {
          svm_free_model_content((uint64_t)v84);
          free(v84);
        }

        free(v113);
        free(v112);
        int v73 = v74;
        uint64_t v8 = v109;
        LODWORD(v9) = v101;
        uint64_t v12 = v110;
      }

      while (v72 != v108);
    }
  }

  free(v8);
  free(v12);
}

uint64_t svm_get_nr_class(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

double svm_predict_probability(uint64_t a1, double *a2, uint64_t a3)
{
  int v4 = (void *)a1;
  if (*(_DWORD *)a1 > 1u || !*(void *)(a1 + 136) || !*(void *)(a1 + 144)) {
    return svm_predict((_DWORD *)a1, a2);
  }
  uint64_t v6 = *(int *)(a1 + 104);
  size_t v75 = (double *)malloc(8LL * (((int)v6 - 1) * (int)v6 / 2));
  svm_predict_values((uint64_t)v4, a2, v75);
  __int size = 8 * v6;
  uint64_t v7 = (char *)malloc(8 * v6);
  uint64_t v8 = v7;
  uint64_t v9 = v6;
  uint64_t v74 = v6;
  uint64_t v79 = v6;
  if ((int)v6 >= 1)
  {
    uint64_t v10 = v6;
    size_t v11 = (void **)v7;
    do
    {
      *v11++ = malloc(__size);
      --v10;
    }

    while (v10);
    int v12 = 0;
    BOOL v13 = v8 + 8;
    uint64_t v14 = v6 - 1LL;
    uint64_t v15 = 8LL;
    uint64_t v72 = v8;
    int v73 = v4;
    do
    {
      uint64_t v16 = v10 + 1;
      if (v10 + 1 < v6)
      {
        uint64_t v17 = 0LL;
        uint64_t v18 = v4[17];
        uint64_t v19 = v4[18];
        int v20 = &v75[v12];
        uint64_t v21 = v18 + 8LL * v12;
        int v76 = v12;
        uint64_t v22 = v19 + 8LL * v12;
        uint64_t v23 = *(void *)&v8[8 * v10] + v15;
        do
        {
          double v24 = *(double *)(v22 + 8 * v17) + v20[v17] * *(double *)(v21 + 8 * v17);
          if (v24 >= 0.0)
          {
            double v25 = exp(-v24);
            double v26 = v25;
          }

          else
          {
            double v25 = exp(v24);
            double v26 = 1.0;
          }

          double v27 = fmin(fmax(v26 / (v25 + 1.0), 0.0000001), 0.9999999);
          *(double *)(v23 + 8 * v17) = v27;
          *(double *)(*(void *)&v13[8 * v17++] + 8 * v10) = 1.0 - v27;
        }

        while (v14 != v17);
        int v12 = v76 + v17;
        uint64_t v8 = v72;
        int v4 = v73;
        uint64_t v6 = v74;
        uint64_t v9 = v79;
        uint64_t v16 = v10 + 1;
      }

      v13 += 8;
      v15 += 8LL;
      --v14;
      uint64_t v10 = v16;
    }

    while (v16 != v9);
  }

  else {
    int v28 = v6;
  }
  int v29 = (void **)malloc(__size);
  int v30 = (double *)malloc(__size);
  double v31 = (double)(int)v9;
  if ((int)v9 <= 0)
  {
    uint64_t v6 = v6;
  }

  else
  {
    int v77 = v28;
    uint64_t v32 = 0LL;
    int v33 = (uint64_t *)(v8 + 8);
    uint64_t v34 = 1LL;
    uint64_t v35 = 1LL;
    do
    {
      *(double *)(a3 + 8 * v32) = 1.0 / v31;
      uint64_t v36 = malloc(__size);
      v29[v32] = v36;
      v36[v32] = 0LL;
      if (v32)
      {
        for (uint64_t i = 0LL; i != v32; ++i)
        {
          double v38 = *(double *)(*(void *)&v8[8 * i] + 8 * v32);
          *(double *)&v36[v32] = *(double *)&v36[v32] + v38 * v38;
          v36[i] = *((void *)v29[i] + v32);
        }
      }

      uint64_t v39 = v32 + 1;
      if (v32 + 1 < v6)
      {
        uint64_t v40 = (double *)&v36[v35];
        uint64_t v41 = (double *)(*(void *)&v8[8 * v32] + v35 * 8);
        int v42 = v33;
        uint64_t v43 = v79;
        do
        {
          uint64_t v44 = *v42++;
          *(double *)&v36[v32] = *(double *)&v36[v32] + *(double *)(v44 + 8 * v32) * *(double *)(v44 + 8 * v32);
          double v45 = *(double *)(v44 + 8 * v32);
          double v46 = *v41++;
          *v40++ = -(v45 * v46);
          --v43;
        }

        while (v34 != v43);
      }

      ++v34;
      ++v35;
      ++v33;
      ++v32;
    }

    while (v39 != v79);
    LODWORD(v9) = v79;
    uint64_t v6 = v79;
    int v28 = v77;
  }

  int v48 = 0;
  double v49 = 0.005 / v31;
  do
  {
    if ((int)v9 < 1)
    {
      if (v49 > 0.0) {
        goto LABEL_53;
      }
    }

    else
    {
      uint64_t v50 = 0LL;
      double v51 = 0.0;
      do
      {
        uint64_t v52 = 0LL;
        double v53 = 0.0;
        do
        {
          double v53 = v53 + *((double *)v29[v50] + v52) * *(double *)(a3 + 8 * v52);
          ++v52;
        }

        while (v6 != v52);
        v30[v50] = v53;
        double v51 = v51 + *(double *)(a3 + 8 * v50++) * v53;
      }

      while (v50 != v6);
      uint64_t v54 = 0LL;
      double v55 = 0.0;
      do
      {
        double v56 = vabdd_f64(v30[v54], v51);
        if (v56 > v55) {
          double v55 = v56;
        }
        ++v54;
      }

      while (v6 != v54);
      if (v55 < v49) {
        goto LABEL_50;
      }
      uint64_t v57 = 0LL;
      do
      {
        uint64_t v58 = 0LL;
        double v59 = v30[v57];
        int v60 = (double *)v29[v57];
        double v61 = (v51 - v59) / v60[v57];
        *(double *)(a3 + 8 * v57) = *(double *)(a3 + 8 * v57) + v61;
        double v62 = v59 + v59 + v61 * v60[v57];
        double v63 = v61 + 1.0;
        do
        {
          v30[v58] = (v30[v58] + v61 * v60[v58]) / v63;
          *(double *)(a3 + 8 * v58) = *(double *)(a3 + 8 * v58) / v63;
          ++v58;
        }

        while (v6 != v58);
        double v51 = (v51 + v61 * v62) / v63 / v63;
        ++v57;
      }

      while (v57 != v6);
    }

    ++v48;
  }

  while (v48 != v28);
  info("Exceeds max_iter in multiclass_prob\n", 1.0);
LABEL_50:
  if ((int)v9 >= 1)
  {
    uint64x2_t v64 = v29;
    uint64_t v65 = v6;
    do
    {
      int8x16_t v66 = *v64++;
      free(v66);
      --v65;
    }

    while (v65);
  }

LABEL_53:
  free(v29);
  free(v30);
  if ((int)v9 <= 1)
  {
    uint64_t v69 = 0LL;
  }

  else
  {
    int v67 = 0;
    uint64_t v68 = 1LL;
    do
    {
      ++v68;
    }

    while (v6 != v68);
    uint64_t v69 = v67;
  }

  if ((int)v74 >= 1)
  {
    uint64_t v70 = (void **)v8;
    do
    {
      int v71 = *v70++;
      free(v71);
      --v6;
    }

    while (v6);
  }

  free(v75);
  free(v8);
  return (double)*(int *)(v4[19] + 4 * v69);
}

double svm_predict(_DWORD *a1, double *a2)
{
  else {
    size_t v4 = 8LL;
  }
  uint64_t v5 = (double *)malloc(v4);
  svm_predict_values((uint64_t)a1, a2, v5);
  double v7 = v6;
  free(v5);
  return v7;
}

void svm_free_and_destroy_model(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      svm_free_model_content((uint64_t)v2);
      free(*a1);
      *a1 = 0LL;
    }
  }

uint64_t svm_get_svm_type(unsigned int *a1)
{
  return *a1;
}

uint64_t svm_get_labels(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 152);
  if (v2 && *(int *)(result + 104) >= 1)
  {
    uint64_t v3 = 0LL;
    do
    {
      *(_DWORD *)(a2 + 4 * vstd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = *(_DWORD *)(v2 + 4 * v3);
      ++v3;
    }

    while (v3 < *(int *)(result + 104));
  }

  return result;
}

double svm_get_svr_probability(uint64_t a1)
{
  if ((*(_DWORD *)a1 - 3) <= 1)
  {
    uint64_t v1 = *(void *)(a1 + 136);
    if (v1) {
      return *(double *)v1;
    }
  }

  fwrite( "Model doesn't contain information for SVR probability inference\n",  0x40uLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
  return 0.0;
}

void svm_predict_values(uint64_t a1, double *a2, double *a3)
{
  if ((*(_DWORD *)a1 - 2) > 2)
  {
    uint64_t v14 = *(int *)(a1 + 104);
    uint64_t v13 = *(int *)(a1 + 108);
    uint64_t v15 = *(unsigned int *)(a1 + 104);
    uint64_t v16 = (double *)malloc(8 * v13);
    uint64_t v17 = v16;
    if ((int)v13 >= 1)
    {
      uint64_t v13 = v13;
      uint64_t v18 = *(double ***)(a1 + 112);
      uint64_t v19 = v16;
      do
      {
        int v20 = *v18++;
        *v19++ = Kernel::k_function(a2, v20, a1);
        --v13;
      }

      while (v13);
    }

    uint64_t v21 = (int *)malloc(4 * v14);
    uint64_t v22 = v21;
    *uint64_t v21 = 0;
    if ((int)v14 > 1)
    {
      int v23 = 0;
      double v24 = *(int **)(a1 + 160);
      double v25 = v21 + 1;
      uint64_t v26 = v15 - 1;
      do
      {
        int v27 = *v24++;
        v23 += v27;
        *v25++ = v23;
        --v26;
      }

      while (v26);
    }

    int v28 = malloc(4 * v14);
    int v29 = v28;
    if ((int)v15 >= 1)
    {
      bzero(v28, 4LL * v14);
      uint64_t v30 = 0LL;
      LODWORD(v31) = 0;
      uint64_t v32 = 1LL;
      do
      {
        uint64_t v33 = v30 + 1;
        if (v30 + 1 < v14)
        {
          uint64_t v34 = *(void *)(a1 + 160);
          uint64_t v35 = *(unsigned int *)(v34 + 4 * v30);
          uint64_t v36 = *(void *)(a1 + 120);
          uint64_t v37 = *(void *)(a1 + 128);
          uint64_t v38 = *(void *)(v36 + 8 * v30);
          uint64_t v31 = (int)v31;
          uint64_t v39 = v22[v30];
          uint64_t v40 = v32;
          do
          {
            if ((int)v35 < 1)
            {
              double v42 = 0.0;
            }

            else
            {
              uint64_t v41 = (double *)(*(void *)(v36 + 8 * v40 - 8) + v39 * 8);
              double v42 = 0.0;
              uint64_t v43 = v35;
              uint64_t v44 = &v17[v39];
              do
              {
                double v45 = *v41++;
                double v46 = v45;
                double v47 = *v44++;
                double v42 = v42 + v46 * v47;
                --v43;
              }

              while (v43);
            }

            uint64_t v48 = *(unsigned int *)(v34 + 4 * v40);
            if ((int)v48 >= 1)
            {
              uint64_t v49 = v22[v40];
              uint64_t v50 = (double *)(v38 + 8 * v49);
              double v51 = &v17[v49];
              do
              {
                double v52 = *v50++;
                double v53 = v52;
                double v54 = *v51++;
                double v42 = v42 + v53 * v54;
                --v48;
              }

              while (v48);
            }

            double v55 = v42 - *(double *)(v37 + 8 * v31);
            a3[v31] = v55;
            if (v55 <= 0.0) {
              uint64_t v56 = v40;
            }
            else {
              uint64_t v56 = v30;
            }
            ++v29[v56];
            ++v31;
            ++v40;
          }

          while (v40 != v14);
        }

        ++v32;
        ++v30;
      }

      while (v33 != v14);
      if ((int)v15 >= 2)
      {
        int v57 = 0;
        uint64_t v58 = 1LL;
        do
        {
          if (v29[v58] > v29[v57]) {
            int v57 = v58;
          }
          ++v58;
        }

        while (v14 != v58);
      }
    }

    free(v17);
    free(v22);
    free(v29);
  }

  else
  {
    uint64_t v6 = *(unsigned int *)(a1 + 108);
    if ((int)v6 < 1)
    {
      double v9 = 0.0;
    }

    else
    {
      double v7 = *(double ***)(a1 + 112);
      uint64_t v8 = **(double ***)(a1 + 120);
      double v9 = 0.0;
      do
      {
        double v10 = *v8++;
        double v11 = v10;
        int v12 = *v7++;
        double v9 = v9 + v11 * Kernel::k_function(a2, v12, a1);
        --v6;
      }

      while (v6);
    }

    *a3 = v9 - **(double **)(a1 + 128);
  }

uint64_t svm_save_model(const char *a1, double *a2)
{
  uint64_t v3 = fopen(a1, "w");
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  size_t v4 = v3;
  fprintf(v3, "svm_type %s\n", svm_type_table[*(int *)a2]);
  fprintf(v4, "kernel_type %s\n", kernel_type_table[*((int *)a2 + 1)]);
  int v5 = *((_DWORD *)a2 + 1);
  if (v5 == 1)
  {
    fprintf(v4, "degree %d\n", *((_DWORD *)a2 + 2));
    int v5 = *((_DWORD *)a2 + 1);
  }

  if ((v5 - 1) <= 2)
  {
    fprintf(v4, "gamma %g\n", a2[2]);
    int v5 = *((_DWORD *)a2 + 1);
  }

  if ((v5 | 2) == 3) {
    fprintf(v4, "coef0 %g\n", a2[3]);
  }
  uint64_t v7 = *((unsigned int *)a2 + 26);
  uint64_t v6 = *((unsigned int *)a2 + 27);
  fprintf(v4, "nr_class %d\n", *((_DWORD *)a2 + 26));
  fprintf(v4, "total_sv %d\n", v6);
  fwrite("rho", 3uLL, 1uLL, v4);
  int v8 = (v7 - 1) * v7;
  if (v8 >= 0) {
    int v9 = (v7 - 1) * v7;
  }
  else {
    int v9 = v8 + 1;
  }
  uint64_t v10 = (v9 >> 1);
  if (v8 >= 2)
  {
    uint64_t v11 = 0LL;
    do
      fprintf(v4, " %g", *(double *)(*((void *)a2 + 16) + 8 * v11++));
    while (v10 != v11);
  }

  fputc(10, v4);
  if (*((void *)a2 + 19))
  {
    fwrite("label", 5uLL, 1uLL, v4);
    if ((int)v7 >= 1)
    {
      uint64_t v12 = 0LL;
      do
      {
        fprintf(v4, " %d", *(_DWORD *)(*((void *)a2 + 19) + v12));
        v12 += 4LL;
      }

      while (4 * v7 != v12);
    }

    fputc(10, v4);
  }

  if (*((void *)a2 + 17))
  {
    fwrite("probA", 5uLL, 1uLL, v4);
    if (v8 >= 2)
    {
      uint64_t v13 = 0LL;
      do
        fprintf(v4, " %g", *(double *)(*((void *)a2 + 17) + 8 * v13++));
      while (v10 != v13);
    }

    fputc(10, v4);
  }

  if (*((void *)a2 + 18))
  {
    fwrite("probB", 5uLL, 1uLL, v4);
    if (v8 >= 2)
    {
      uint64_t v14 = 0LL;
      do
        fprintf(v4, " %g", *(double *)(*((void *)a2 + 18) + 8 * v14++));
      while (v10 != v14);
    }

    fputc(10, v4);
  }

  if (*((void *)a2 + 20))
  {
    fwrite("nr_sv", 5uLL, 1uLL, v4);
    if ((int)v7 >= 1)
    {
      uint64_t v15 = 0LL;
      do
      {
        fprintf(v4, " %d", *(_DWORD *)(*((void *)a2 + 20) + v15));
        v15 += 4LL;
      }

      while (4 * v7 != v15);
    }

    fputc(10, v4);
  }

  fwrite("SV\n", 3uLL, 1uLL, v4);
  if ((int)v6 >= 1)
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = *((void *)a2 + 14);
    uint64_t v18 = (uint64_t *)*((void *)a2 + 15);
    do
    {
      uint64_t v19 = (v7 - 1);
      int v20 = v18;
      if ((int)v7 >= 2)
      {
        do
        {
          uint64_t v21 = *v20++;
          fprintf(v4, "%.16g ", *(double *)(v21 + 8 * v16));
          --v19;
        }

        while (v19);
      }

      uint64_t v22 = *(double **)(v17 + 8 * v16);
      if (*((_DWORD *)a2 + 1) == 4)
      {
        fprintf(v4, "0:%d ", (int)v22[1]);
      }

      else
      {
        int v23 = *(_DWORD *)v22;
        if (*(_DWORD *)v22 != -1)
        {
          double v24 = v22 + 2;
          do
          {
            fprintf(v4, "%d:%.8g ", v23, *(v24 - 1));
            int v25 = *(_DWORD *)v24;
            v24 += 2;
            int v23 = v25;
          }

          while (v25 != -1);
        }
      }

      fputc(10, v4);
      ++v16;
    }

    while (v16 != v6);
  }

  if (ferror(v4)) {
    return 0xFFFFFFFFLL;
  }
  if (fclose(v4)) {
    return 0xFFFFFFFFLL;
  }
  return 0LL;
}

char *svm_load_model(const char *a1)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  uint64_t v1 = fopen(a1, "rb");
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = (char *)malloc(0xB0uLL);
  *((_OWORD *)v3 + 8) = 0u;
  size_t v4 = (void **)(v3 + 128);
  double v63 = v3 + 104;
  *((_OWORD *)v3 + 9) = 0u;
  *((void *)v3 + 20) = 0LL;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            while (1)
            {
              while (1)
              {
                while (1)
                {
LABEL_3:
                  fscanf(v2, "%80s", __s2);
                  if (!(*(void *)__s2 ^ 0x657079745F6D7673LL | v69))
                  {
                    fscanf(v2, "%80s", __s2);
                    for (uint64_t i = 0LL; i != 5; ++i)
                    {
                      if (!strcmp(svm_type_table[i], __s2))
                      {
                        *(_DWORD *)uint64_t v3 = i;
                        goto LABEL_3;
                      }
                    }

                    uint64_t v35 = (FILE *)*MEMORY[0x1895F89D0];
                    uint64_t v36 = "unknown svm type.\n";
                    size_t v37 = 18LL;
LABEL_86:
                    fwrite(v36, v37, 1uLL, v35);
                    goto LABEL_87;
                  }

                  if (*(void *)__s2 != 0x745F6C656E72656BLL || v69 != 6647929) {
                    break;
                  }
                  fscanf(v2, "%80s", __s2);
                  uint64_t v17 = 0LL;
                  while (strcmp(kernel_type_table[v17], __s2))
                  {
                    if (++v17 == 5)
                    {
                      uint64_t v35 = (FILE *)*MEMORY[0x1895F89D0];
                      uint64_t v36 = "unknown kernel function.\n";
                      size_t v37 = 25LL;
                      goto LABEL_86;
                    }
                  }

                  *((_DWORD *)v3 + 1) = v17;
                }

                if (*(_DWORD *)__s2 == 1919378788 && *(_DWORD *)&__s2[3] == 6645106)
                {
                  uint64_t v18 = v3 + 8;
                  goto LABEL_54;
                }

                if (*(_DWORD *)__s2 == 1835884903 && *(unsigned __int16 *)&__s2[4] == 97)
                {
                  uint64_t v19 = v3 + 16;
                  goto LABEL_58;
                }

                uint64_t v19 = v3 + 24;
LABEL_58:
                fscanf(v2, "%lf", v19);
              }

              if (!(*(void *)__s2 ^ 0x7373616C635F726ELL | v69))
              {
                uint64_t v18 = v3 + 104;
                goto LABEL_54;
              }

              uint64_t v18 = v3 + 108;
LABEL_54:
              fscanf(v2, "%d", v18);
            }

            if (*(_DWORD *)__s2 != 7301234) {
              break;
            }
            int v20 = (*v63 - 1) * *v63;
            if (v20 >= 0) {
              int v21 = (*v63 - 1) * *v63;
            }
            else {
              int v21 = v20 + 1;
            }
            uint64_t v22 = (v21 >> 1);
            *size_t v4 = malloc(8LL * (int)v22);
            if (v20 >= 2)
            {
              uint64_t v23 = 0LL;
              do
              {
                fscanf(v2, "%lf", (char *)*v4 + v23);
                v23 += 8LL;
                --v22;
              }

              while (v22);
            }
          }

          uint64_t v24 = *((int *)v3 + 26);
          *((void *)v3 + 19) = malloc(4 * v24);
          if ((int)v24 >= 1)
          {
            uint64_t v25 = 0LL;
            uint64_t v26 = 4LL * v24;
            do
            {
              fscanf(v2, "%d", *((void *)v3 + 19) + v25);
              v25 += 4LL;
            }

            while (v26 != v25);
          }
        }

        int v27 = (*((_DWORD *)v3 + 26) - 1) * *((_DWORD *)v3 + 26);
        if (v27 >= 0) {
          int v28 = (*((_DWORD *)v3 + 26) - 1) * *((_DWORD *)v3 + 26);
        }
        else {
          int v28 = v27 + 1;
        }
        uint64_t v29 = (v28 >> 1);
        *((void *)v3 + 17) = malloc(8LL * (int)v29);
        if (v27 >= 2)
        {
          uint64_t v30 = 0LL;
          do
          {
            fscanf(v2, "%lf", *((void *)v3 + 17) + v30);
            v30 += 8LL;
            --v29;
          }

          while (v29);
        }
      }

      int v31 = (*((_DWORD *)v3 + 26) - 1) * *((_DWORD *)v3 + 26);
      if (v31 >= 0) {
        int v32 = (*((_DWORD *)v3 + 26) - 1) * *((_DWORD *)v3 + 26);
      }
      else {
        int v32 = v31 + 1;
      }
      uint64_t v33 = (v32 >> 1);
      *((void *)v3 + 18) = malloc(8LL * (int)v33);
      if (v31 >= 2)
      {
        uint64_t v34 = 0LL;
        do
        {
          fscanf(v2, "%lf", *((void *)v3 + 18) + v34);
          v34 += 8LL;
          --v33;
        }

        while (v33);
      }
    }

    uint64_t v13 = *((int *)v3 + 26);
    *((void *)v3 + 20) = malloc(4 * v13);
    if ((int)v13 >= 1)
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = 4LL * v13;
      do
      {
        fscanf(v2, "%d", *((void *)v3 + 20) + v14);
        v14 += 4LL;
      }

      while (v15 != v14);
    }
  }

  if (*(unsigned __int16 *)__s2 ^ 0x5653 | __s2[2])
  {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "unknown text in model file: [%s]\n", __s2);
LABEL_87:
    free(*((void **)v3 + 16));
    free(*((void **)v3 + 19));
    free(*((void **)v3 + 20));
    free(v3);
    return 0LL;
  }

  do
    int v39 = getc(v2);
  while (v39 != -1 && v39 != 10);
  uint64_t v40 = MEMORY[0x1895A4CE4](v2);
  max_line_leuint64_t n = 1024;
  line = (uint64_t)malloc(0x400uLL);
  int v41 = 0;
  while (readline(v2))
  {
    strtok((char *)line, ":");
    --v41;
    do
      ++v41;
    while (strtok(0LL, ":"));
  }

  int v42 = *((_DWORD *)v3 + 27);
  fseek(v2, v40, 0);
  int v43 = *((_DWORD *)v3 + 26);
  uint64_t v44 = *((int *)v3 + 27);
  unsigned int v45 = v43 - 1;
  uint64_t v66 = *((unsigned int *)v3 + 27);
  *((void *)v3 + 15) = malloc(8LL * (v43 - 1));
  size_t v46 = 8 * v44;
  int v65 = v43;
  if (v43 > 1)
  {
    uint64_t v47 = 0LL;
    do
    {
      *(void *)(*((void *)v3 + 15) + v47) = malloc(v46);
      v47 += 8LL;
    }

    while (8LL * v45 != v47);
  }

  *((void *)v3 + 14) = malloc(v46);
  if ((int)v66 >= 1)
  {
    uint64_t v48 = (char *)malloc(16LL * (v42 + v41));
    uint64_t v49 = 0LL;
    int v50 = 0;
    uint64_t v51 = 8LL * v45;
    double v62 = v48 + 8;
    uint64x2_t v64 = v48;
    uint64_t v61 = v51;
    do
    {
      readline(v2);
      *(void *)(*((void *)v3 + 14) + 8 * v49) = &v48[16 * v50];
      double v52 = strtok((char *)line, " \t");
      *(double *)(**((void **)v3 + 15) + 8 * v49) = strtod(v52, &__endptr);
      if (v65 >= 3)
      {
        uint64_t v53 = 8LL;
        do
        {
          double v54 = strtok(0LL, " \t");
          *(double *)(*(void *)(*((void *)v3 + 15) + v53) + 8 * v49) = strtod(v54, &__endptr);
          v53 += 8LL;
        }

        while (v51 != v53);
      }

      uint64_t v55 = v50;
      uint64_t v56 = strtok(0LL, ":");
      int v57 = strtok(0LL, " \t");
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = (uint64_t)v50 << 32;
        int v60 = (double *)&v62[16 * v50];
        do
        {
          *((_DWORD *)v60 - 2) = strtol(v56, &__endptr, 10);
          *int v60 = strtod(v58, &__endptr);
          v60 += 2;
          uint64_t v56 = strtok(0LL, ":");
          uint64_t v58 = strtok(0LL, " \t");
          v59 += 0x100000000LL;
          ++v50;
        }

        while (v58);
        uint64_t v55 = v59 >> 32;
        uint64_t v51 = v61;
      }

      ++v50;
      uint64_t v48 = v64;
      *(_DWORD *)&v64[16 * v55] = -1;
      ++v49;
    }

    while (v49 != v66);
  }

  free((void *)line);
  if (!ferror(v2) && !fclose(v2))
  {
    *((_DWORD *)v3 + 42) = 1;
    return v3;
  }

  return 0LL;
}

void *readline(__sFILE *a1)
{
  while (1)
  {
    uint64_t v2 = (void *)line;
    uint64_t v3 = max_line_len;
    max_line_len *= 2;
    int v4 = max_line_len;
    line = (uint64_t)realloc(v2, 2 * v3);
    int v5 = strlen((const char *)line);
  }

  return v2;
}

void svm_free_model_content(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 168))
  {
    if (*(int *)(a1 + 108) >= 1)
    {
      uint64_t v2 = *(void ***)(a1 + 112);
      if (v2) {
        free(*v2);
      }
    }
  }

  if (*(void *)(a1 + 120) && *(int *)(a1 + 104) >= 2)
  {
    uint64_t v3 = 0LL;
    do
      free(*(void **)(*(void *)(a1 + 120) + 8 * v3++));
    while (v3 < *(int *)(a1 + 104) - 1LL);
  }

  free(*(void **)(a1 + 112));
  *(void *)(a1 + 112) = 0LL;
  free(*(void **)(a1 + 120));
  *(void *)(a1 + 120) = 0LL;
  free(*(void **)(a1 + 128));
  *(void *)(a1 + 128) = 0LL;
  free(*(void **)(a1 + 152));
  *(void *)(a1 + 152) = 0LL;
  free(*(void **)(a1 + 136));
  *(void *)(a1 + 13std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
  free(*(void **)(a1 + 144));
  *(void *)(a1 + 144) = 0LL;
  free(*(void **)(a1 + 160));
  *(void *)(a1 + 160) = 0LL;
}

void svm_destroy_param(uint64_t a1)
{
}

const char *svm_check_parameter(unsigned int *a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 > 4u) {
    return "unknown svm type";
  }
  if (*(_DWORD *)(a2 + 4) > 4u) {
    return "unknown kernel type";
  }
  if ((*(_DWORD *)(a2 + 8) & 0x80000000) != 0) {
    return "degree of polynomial kernel < 0";
  }
  if (v2 - 1 < 2) {
    goto LABEL_16;
  }
  if (v2 == 3)
  {
LABEL_19:
    goto LABEL_25;
  }

  if (v2 == 4)
  {
LABEL_16:
    double v6 = *(double *)(a2 + 80);
    uint64_t result = "nu <= 0 or nu > 1";
    if (v6 <= 0.0 || v6 > 1.0) {
      return result;
    }
    if (v2 == 3) {
      goto LABEL_19;
    }
  }

LABEL_25:
  if (*(_DWORD *)(a2 + 96) > 1u) {
    return "shrinking != 0 and shrinking != 1";
  }
  unsigned int v7 = *(_DWORD *)(a2 + 100);
  if (v7 > 1) {
    return "probability != 0 and probability != 1";
  }
  if (v7 == 1 && v2 == 2) {
    uint64_t result = "one-class SVM probability output not supported yet";
  }
  else {
    uint64_t result = 0LL;
  }
  if (v2 == 1)
  {
    uint64_t v9 = *a1;
    uint64_t v10 = malloc(0x40uLL);
    uint64_t v11 = malloc(0x40uLL);
    uint64_t v12 = 0LL;
    int v13 = 0;
    int v14 = 16;
    do
    {
      int v15 = (int)*(double *)(*((void *)a1 + 1) + 8 * v12);
      if (v13 < 1)
      {
        LODWORD(v1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
      }

      else
      {
        uint64_t v16 = 0LL;
        while (v10[v16] != v15)
        {
          if (v13 == ++v16) {
            goto LABEL_44;
          }
        }

        ++v11[v16];
      }

      if ((_DWORD)v16 == v13)
      {
LABEL_44:
        if (v13 == v14)
        {
          v14 *= 2;
          uint64_t v10 = realloc(v10, 4LL * v14);
          uint64_t v11 = realloc(v11, 4LL * v14);
        }

        v10[v13] = v15;
        v11[v13++] = 1;
      }

      ++v12;
    }

    while (v12 != v9);
    if (v13 < 1)
    {
LABEL_57:
      free(v10);
      free(v11);
      return 0LL;
    }

    else
    {
      uint64_t v17 = 0LL;
      uint64_t v18 = 1LL;
      while (1)
      {
        uint64_t v19 = v17 + 1;
LABEL_56:
        ++v18;
        uint64_t v17 = v19;
        if (v19 == v13) {
          goto LABEL_57;
        }
      }

      int v20 = v11[v17];
      uint64_t v21 = v18;
      while (1)
      {
        int v22 = v11[v21];
        double v23 = *(double *)(a2 + 80) * (double)(v22 + v20) * 0.5;
        if (v20 < v22) {
          int v22 = v20;
        }
        if (v13 == ++v21) {
          goto LABEL_56;
        }
      }

      free(v10);
      free(v11);
      return "specified nu is infeasible";
    }
  }

  return result;
}

BOOL svm_check_probability_model(uint64_t a1)
{
  if (*(_DWORD *)a1 > 1u)
  {
  }

  else if (*(void *)(a1 + 136) && *(void *)(a1 + 144))
  {
    return 1LL;
  }

  return 0LL;
}

uint64_t (*svm_set_print_string_function( uint64_t (*result)(const char *)))(const char *)
{
  uint64_t v1 = print_string_stdout;
  if (result) {
    uint64_t v1 = result;
  }
  svm_print_string = v1;
  return result;
}

uint64_t print_string_stdout(const char *a1)
{
  uint64_t v1 = (FILE **)MEMORY[0x1895F89E0];
  fputs(a1, (FILE *)*MEMORY[0x1895F89E0]);
  return fflush(*v1);
}

double Kernel::swap_index(Kernel *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 3);
  uint64_t v4 = *(void *)(v3 + 8LL * a2);
  *(void *)(v3 + 8LL * a2) = *(void *)(v3 + 8LL * a3);
  *(void *)(v3 + 8LL * astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v4;
  uint64_t v5 = *((void *)this + 4);
  if (v5)
  {
    double result = *(double *)(v5 + 8LL * a2);
    *(void *)(v5 + 8LL * a2) = *(void *)(v5 + 8LL * a3);
    *(double *)(v5 + 8LL * astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = result;
  }

  return result;
}

void *SVC_Q::SVC_Q(void *a1, int *a2, uint64_t a3, const void *a4)
{
  *(void *)Kernel::Kernel((uint64_t)a1, *a2, *((const void **)a2 + 2), astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = &unk_18A04E7F8;
  int v8 = *a2;
  uint64_t v9 = operator new[](*a2);
  a1[8] = v9;
  memcpy(v9, a4, v8);
  uint64_t v10 = (int *)operator new(0x38uLL);
  unint64_t v11 = vcvtd_n_s64_f64(*(double *)(a3 + 32), 0x14uLL);
  *uint64_t v10 = v8;
  *((void *)v10 + 1) = v11;
  uint64_t v12 = calloc(v8, 0x20uLL);
  uint64_t v13 = *v10;
  uint64_t v14 = (*((void *)v10 + 1) >> 2) - 8 * (v13 & 0x7FFFFFFFFFFFFFFLL);
  BOOL v15 = v14 <= 2 * v13;
  uint64_t v16 = 2 * v13;
  if (v15) {
    uint64_t v14 = v16;
  }
  *((void *)v10 + 1) = v14;
  *((void *)v10 + 2) = v12;
  *((void *)v10 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v10 + 6;
  *((void *)v10 + 4) = v10 + 6;
  a1[9] = v10;
  uint64_t v17 = *a2;
  else {
    size_t v18 = 8 * v17;
  }
  a1[10] = operator new[](v18);
  if ((int)v17 >= 1)
  {
    uint64_t v19 = 0LL;
    do
    {
      int v20 = (double (*)(void *, uint64_t, uint64_t))a1[1];
      uint64_t v21 = a1[2];
      int v22 = (void *)((char *)a1 + (v21 >> 1));
      if ((v21 & 1) != 0) {
        int v20 = *(double (**)(void *, uint64_t, uint64_t))(*v22 + v20);
      }
      *(double *)(a1[10] + 8 * v19) = v20(v22, v19, v19);
      ++v19;
    }

    while (v19 < *a2);
  }

  return a1;
}

void sub_18743ECB0(_Unwind_Exception *a1)
{
}

float *SVC_Q::get_Q(Cache **this, uint64_t a2, uint64_t a3)
{
  int v3 = a3;
  int data = Cache::get_data(this[9], a2, &v15, a3);
  unsigned int v7 = v15;
  if (data < v3)
  {
    uint64_t v8 = data;
    do
    {
      uint64_t v9 = this[1];
      uint64_t v10 = (uint64_t)this[2];
      unint64_t v11 = (Cache **)((char *)this + (v10 >> 1));
      if ((v10 & 1) != 0) {
        uint64_t v9 = *(Cache **)(*v11 + v9);
      }
      double v12 = (double)(*((char *)this[8] + v8) * *((char *)this[8] + (int)a2));
      float v13 = ((double (*)(void *, uint64_t, uint64_t))v9)(v11, a2, v8) * v12;
      v7[v8++] = v13;
    }

    while (v3 != (_DWORD)v8);
  }

  return v7;
}

uint64_t SVC_Q::get_QD(SVC_Q *this)
{
  return *((void *)this + 10);
}

double SVC_Q::swap_index(Cache **this, int a2, int a3)
{
  double v6 = this[3];
  uint64_t v7 = *((void *)v6 + a2);
  *((void *)v6 + a2) = *((void *)v6 + a3);
  *((void *)v6 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v7;
  uint64_t v8 = this[4];
  if (v8)
  {
    uint64_t v9 = *((void *)v8 + a2);
    *((void *)v8 + a2) = *((void *)v8 + a3);
    *((void *)v8 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v9;
  }

  uint64_t v10 = this[8];
  char v11 = *((_BYTE *)v10 + a2);
  *((_BYTE *)v10 + a2) = *((_BYTE *)v10 + a3);
  *((_BYTE *)v10 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v11;
  double v12 = this[10];
  double result = *((double *)v12 + a2);
  *((void *)v12 + a2) = *((void *)v12 + a3);
  *((double *)v12 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = result;
  return result;
}

void SVC_Q::~SVC_Q(SVC_Q *this)
{
}

{
  void *v2;
  Cache *v3;
  void *v4;
  void *v5;
  *(void *)this = &unk_18A04E7F8;
  unsigned int v2 = (void *)*((void *)this + 8);
  if (v2) {
    operator delete[](v2);
  }
  int v3 = (Cache *)*((void *)this + 9);
  if (v3)
  {
    Cache::~Cache(v3);
    operator delete(v4);
  }

  uint64_t v5 = (void *)*((void *)this + 10);
  if (v5) {
    operator delete[](v5);
  }
  Kernel::~Kernel(this);
}

void *ONE_CLASS_Q::ONE_CLASS_Q(void *a1, int *a2, uint64_t a3)
{
  *(void *)Kernel::Kernel((uint64_t)a1, *a2, *((const void **)a2 + 2), astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = &unk_18A04E848;
  double v6 = (int *)operator new(0x38uLL);
  size_t v7 = *a2;
  unint64_t v8 = vcvtd_n_s64_f64(*(double *)(a3 + 32), 0x14uLL);
  *double v6 = v7;
  *((void *)v6 + 1) = v8;
  uint64_t v9 = calloc(v7, 0x20uLL);
  uint64_t v10 = *v6;
  uint64_t v11 = (*((void *)v6 + 1) >> 2) - 8 * (v10 & 0x7FFFFFFFFFFFFFFLL);
  BOOL v12 = v11 <= 2 * v10;
  uint64_t v13 = 2 * v10;
  if (v12) {
    uint64_t v11 = v13;
  }
  *((void *)v6 + 1) = v11;
  *((void *)v6 + 2) = v9;
  *((void *)v6 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v6 + 6;
  *((void *)v6 + 4) = v6 + 6;
  a1[8] = v6;
  uint64_t v14 = *a2;
  else {
    size_t v15 = 8 * v14;
  }
  a1[9] = operator new[](v15);
  if ((int)v14 >= 1)
  {
    uint64_t v16 = 0LL;
    do
    {
      uint64_t v17 = (double (*)(void *, uint64_t, uint64_t))a1[1];
      uint64_t v18 = a1[2];
      uint64_t v19 = (void *)((char *)a1 + (v18 >> 1));
      if ((v18 & 1) != 0) {
        uint64_t v17 = *(double (**)(void *, uint64_t, uint64_t))(*v19 + v17);
      }
      *(double *)(a1[9] + 8 * v1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v17(v19, v16, v16);
      ++v16;
    }

    while (v16 < *a2);
  }

  return a1;
}

void sub_18743EF9C(_Unwind_Exception *a1)
{
}

float *ONE_CLASS_Q::get_Q(Cache **this, uint64_t a2, uint64_t a3)
{
  int v3 = a3;
  uint64_t data = Cache::get_data(this[8], a2, &v15, a3);
  size_t v7 = v15;
  if ((int)data < v3)
  {
    uint64_t v8 = data;
    uint64_t v9 = &v15[(int)data];
    do
    {
      uint64_t v10 = this[1];
      uint64_t v11 = (uint64_t)this[2];
      BOOL v12 = (Cache **)((char *)this + (v11 >> 1));
      if ((v11 & 1) != 0) {
        uint64_t v10 = *(Cache **)(*v12 + v10);
      }
      float v13 = ((double (*)(void *, uint64_t, uint64_t))v10)(v12, a2, v8);
      *v9++ = v13;
      uint64_t v8 = (v8 + 1);
    }

    while (v3 != (_DWORD)v8);
  }

  return v7;
}

uint64_t ONE_CLASS_Q::get_QD(ONE_CLASS_Q *this)
{
  return *((void *)this + 9);
}

double ONE_CLASS_Q::swap_index(Cache **this, int a2, int a3)
{
  double v6 = this[3];
  uint64_t v7 = *((void *)v6 + a2);
  *((void *)v6 + a2) = *((void *)v6 + a3);
  *((void *)v6 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v7;
  uint64_t v8 = this[4];
  if (v8)
  {
    uint64_t v9 = *((void *)v8 + a2);
    *((void *)v8 + a2) = *((void *)v8 + a3);
    *((void *)v8 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v9;
  }

  uint64_t v10 = this[9];
  double result = *((double *)v10 + a2);
  *((void *)v10 + a2) = *((void *)v10 + a3);
  *((double *)v10 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = result;
  return result;
}

void ONE_CLASS_Q::~ONE_CLASS_Q(ONE_CLASS_Q *this)
{
}

{
  Cache *v2;
  void *v3;
  void *v4;
  *(void *)this = &unk_18A04E848;
  unsigned int v2 = (Cache *)*((void *)this + 8);
  if (v2)
  {
    Cache::~Cache(v2);
    operator delete(v3);
  }

  uint64_t v4 = (void *)*((void *)this + 9);
  if (v4) {
    operator delete[](v4);
  }
  Kernel::~Kernel(this);
}

uint64_t SVR_Q::SVR_Q(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = Kernel::Kernel(a1, *(_DWORD *)a2, *(const void **)(a2 + 16), a3);
  *(void *)uint64_t v6 = &unk_18A04E898;
  int v7 = *(_DWORD *)a2;
  *(_DWORD *)(v6 + 64) = *(_DWORD *)a2;
  uint64_t v8 = (int *)operator new(0x38uLL);
  unint64_t v9 = vcvtd_n_s64_f64(*(double *)(a3 + 32), 0x14uLL);
  *uint64_t v8 = v7;
  *((void *)v8 + 1) = v9;
  uint64_t v10 = calloc(v7, 0x20uLL);
  uint64_t v11 = *v8;
  uint64_t v12 = (*((void *)v8 + 1) >> 2) - 8 * (v11 & 0x7FFFFFFFFFFFFFFLL);
  BOOL v13 = v12 <= 2 * v11;
  uint64_t v14 = 2 * v11;
  if (v13) {
    uint64_t v12 = v14;
  }
  *((void *)v8 + 1) = v12;
  *((void *)v8 + 2) = v10;
  *((void *)v8 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v8 + 6;
  *((void *)v8 + 4) = v8 + 6;
  *(void *)(a1 + 72) = v8;
  uint64_t v15 = *(int *)(a1 + 64);
  else {
    size_t v16 = 16 * v15;
  }
  *(void *)(a1 + 120) = operator new[](v16);
  *(void *)(a1 + 80) = operator new[](2 * v15);
  size_t v17 = 8 * v15;
  else {
    size_t v18 = 8 * v15;
  }
  *(void *)(a1 + 88) = operator new[](v18);
  if ((int)v15 >= 1)
  {
    uint64_t v19 = 0LL;
    do
    {
      *(_BYTE *)(*(void *)(a1 + 80) + v19) = 1;
      *(_BYTE *)(*(void *)(a1 + 80) + *(int *)(a1 + 64) + v19) = -1;
      uint64_t v20 = *(void *)(a1 + 88);
      *(_DWORD *)(v20 + 4 * v19) = v19;
      *(_DWORD *)(v20 + 4 * (v19 + *(int *)(a1 + 64))) = v19;
      uint64_t v21 = *(double (**)(void *, uint64_t, uint64_t))(a1 + 8);
      uint64_t v22 = *(void *)(a1 + 16);
      double v23 = (void *)(a1 + (v22 >> 1));
      if ((v22 & 1) != 0) {
        uint64_t v21 = *(double (**)(void *, uint64_t, uint64_t))(*v23 + v21);
      }
      double v24 = v21(v23, v19, v19);
      uint64_t v25 = *(void *)(a1 + 120);
      *(double *)(v25 + 8 * v19) = v24;
      int v26 = *(_DWORD *)(a1 + 64);
      *(double *)(v25 + 8 * (v19 + v2(*(void (**)(void))(**((void **)this + 6) + 16LL))(*((void *)this + 6)) = v24;
      ++v19;
    }

    while (v19 < v26);
    size_t v17 = 8LL * v26;
    LODWORD(v15) = v26;
  }

  *(void *)(a1 + 104) = operator new[](v17);
  *(void *)(a1 + 112) = operator new[](v17);
  *(_DWORD *)(a1 + 9std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
  return a1;
}

void sub_18743F2E0(_Unwind_Exception *a1)
{
}

float *SVR_Q::get_Q(SVR_Q *this, int a2, int a3)
{
  uint64_t v6 = *((void *)this + 11);
  uint64_t v7 = *(unsigned int *)(v6 + 4LL * a2);
  int data = Cache::get_data(*((Cache **)this + 9), *(_DWORD *)(v6 + 4LL * a2), &v28, *((unsigned int *)this + 16));
  int v9 = *((_DWORD *)this + 16);
  if (data < v9 && v9 >= 1)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = v28;
    do
    {
      BOOL v13 = (double (*)(void *, uint64_t, uint64_t))*((void *)this + 1);
      uint64_t v14 = *((void *)this + 2);
      uint64_t v15 = (void *)((char *)this + (v14 >> 1));
      if ((v14 & 1) != 0) {
        BOOL v13 = *(double (**)(void *, uint64_t, uint64_t))(*v15 + v13);
      }
      float v16 = v13(v15, v7, v11);
      v12[v11++] = v16;
    }

    while (v11 < *((int *)this + 16));
  }

  uint64_t v17 = *((int *)this + 24);
  double result = (float *)*((void *)this + v17 + 13);
  *((_DWORD *)this + 24) = 1 - v17;
  if (a3 >= 1)
  {
    uint64_t v19 = (char *)*((void *)this + 10);
    uint64_t v20 = (int *)*((void *)this + 11);
    float v21 = (float)v19[a2];
    uint64_t v22 = v28;
    uint64_t v23 = a3;
    double v24 = result;
    do
    {
      int v25 = *v19++;
      float v26 = v21 * (float)v25;
      uint64_t v27 = *v20++;
      *v24++ = v26 * v22[v27];
      --v23;
    }

    while (v23);
  }

  return result;
}

uint64_t SVR_Q::get_QD(SVR_Q *this)
{
  return *((void *)this + 15);
}

double SVR_Q::swap_index(SVR_Q *this, int a2, int a3)
{
  uint64_t v3 = *((void *)this + 10);
  char v4 = *(_BYTE *)(v3 + a2);
  *(_BYTE *)(v3 + a2) = *(_BYTE *)(v3 + a3);
  *(_BYTE *)(v3 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v4;
  uint64_t v5 = *((void *)this + 11);
  int v6 = *(_DWORD *)(v5 + 4LL * a2);
  *(_DWORD *)(v5 + 4LL * a2) = *(_DWORD *)(v5 + 4LL * a3);
  *(_DWORD *)(v5 + 4LL * astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v6;
  uint64_t v7 = *((void *)this + 15);
  double result = *(double *)(v7 + 8LL * a2);
  *(void *)(v7 + 8LL * a2) = *(void *)(v7 + 8LL * a3);
  *(double *)(v7 + 8LL * astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = result;
  return result;
}

void SVR_Q::~SVR_Q(SVR_Q *this)
{
}

{
  Cache *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  *(void *)this = &unk_18A04E898;
  unsigned int v2 = (Cache *)*((void *)this + 9);
  if (v2)
  {
    Cache::~Cache(v2);
    operator delete(v3);
  }

  char v4 = (void *)*((void *)this + 10);
  if (v4) {
    operator delete[](v4);
  }
  uint64_t v5 = (void *)*((void *)this + 11);
  if (v5) {
    operator delete[](v5);
  }
  int v6 = (void *)*((void *)this + 13);
  if (v6) {
    operator delete[](v6);
  }
  uint64_t v7 = (void *)*((void *)this + 14);
  if (v7) {
    operator delete[](v7);
  }
  uint64_t v8 = (void *)*((void *)this + 15);
  if (v8) {
    operator delete[](v8);
  }
  Kernel::~Kernel(this);
}

BOOL nlp::traverseCallback(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    a2 += 20LL;
    int v3 = *(_DWORD *)(v2 + 16);
    int v4 = *(_DWORD *)(v2 + 8);
  }

  else
  {
    int v3 = 0;
    int v4 = 0;
  }

  return nlp::BurstTrieAdd(a1, a2, v3, v4);
}

BOOL nlp::BurstTrieAdd(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (*(void *)(a1 + 2080) || (*(_BYTE *)(a1 + 2064) & 1) != 0) {
    return 0LL;
  }
  int v5 = 0;
  int v22 = 0;
  int v6 = a3 - 1;
  if ((a3 - 1) <= 0x3FE && a4)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = (int *)a1;
    while (1)
    {
      uint64_t v11 = *(void *)&v10[2 * *(unsigned __int8 *)(a2 + v9) + 1];
      if ((v11 & 3) != 1) {
        break;
      }
      uint64_t v10 = (int *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
      if (a3 == ++v9)
      {
        int v12 = *v10;
        *uint64_t v10 = a4;
        if (!v12) {
          goto LABEL_17;
        }
LABEL_18:
        int v5 = 1;
        return v5 != 0;
      }
    }

    if ((v11 & 3) != 2)
    {
      uint64_t v17 = (unsigned __int8 *)(a2 + v9);
      size_t v18 = (const void *)(a2 + v9 + 1);
      unsigned int v19 = v6 - v9;
      size_t v20 = (v6 - v9);
      unint64_t v21 = (unint64_t)calloc(1uLL, v20 + 15);
      memcpy((void *)(v21 + 14), v18, v20);
      *(_BYTE *)(v21 + 14 + v19) = 0;
      *(_WORD *)(v21 + 12) = v19;
      *(_DWORD *)(v21 + 8) = a4;
      *(void *)unint64_t v21 = 0LL;
      *(void *)&v10[2 * *v17 + 1] = v21 | 2;
      goto LABEL_17;
    }

    uint64_t v23 = (_DWORD *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
    unsigned int v14 = nlp::addListNode(a1, &v23, a2, a3, (int)v9 + 1, a4, &v22);
    unint64_t v15 = (unint64_t)v23;
    if (v14 >= *(_DWORD *)(a1 + 2088))
    {
      unint64_t v15 = (unint64_t)nlp::burstLevel(a1, v23, &v22);
      uint64_t v16 = 1LL;
    }

    else
    {
      uint64_t v16 = 2LL;
    }

    int v5 = v22;
    *(void *)&v10[2 * *(unsigned __int8 *)(a2 + v9) + 1] = v16 | v15;
    if (v5 == 2)
    {
LABEL_17:
      ++*(_DWORD *)(a1 + 2060);
      goto LABEL_18;
    }
  }

  return v5 != 0;
}

uint64_t nlp::TrieCompletionGetCompletion(uint64_t a1)
{
  if (a1) {
    return a1 + 20;
  }
  else {
    return 0LL;
  }
}

uint64_t nlp::TrieCompletionGetLength(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t nlp::TrieCompletionGetPayload(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

void *nlp::rankedTraverseCallback(uint64_t a1, float *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (a2) {
    uint64_t v3 = (uint64_t)(a2 + 5);
  }
  else {
    uint64_t v3 = 0LL;
  }
  if (a2)
  {
    uint64_t v4 = *((unsigned int *)a2 + 4);
    uint64_t v5 = *((unsigned int *)a2 + 2);
    float v6 = *a2;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v4 = 0LL;
    float v6 = 0.0;
  }

  uint64_t v10 = 0LL;
  nlp::BurstTrieAddWithScore(a1, v3, v4, v5, 0LL, (uint64_t)v9, v6);
  double result = v10;
  if (v10 == v9)
  {
    uint64_t v8 = 4LL;
    double result = v9;
  }

  else
  {
    if (!v10) {
      return result;
    }
    uint64_t v8 = 5LL;
  }

  return (void *)(*(uint64_t (**)(void))(*result + 8 * v8))();
}

void sub_18743F794( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  unsigned int v14 = a13;
  if (a13 == &a10)
  {
    uint64_t v15 = 4LL;
    unsigned int v14 = &a10;
  }

  else
  {
    if (!a13) {
      goto LABEL_6;
    }
    uint64_t v15 = 5LL;
  }

  (*(void (**)(void))(*(void *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL nlp::BurstTrieAddWithScore( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, float a7)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 2080) || (*(_BYTE *)(a1 + 2064) & 1) == 0) {
    return 0LL;
  }
  BOOL result = 0LL;
  int v18 = 0;
  if ((a3 - 1) <= 0x3FE && (_DWORD)a4)
  {
    int v17 = 0;
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v19,  a6);
    nlp::addLevelRanked((unsigned __int16 *)a1, a1, a2, a3, 0, a4, (float *)&v17, &v18, a7, a5, (uint64_t)v19);
    unsigned int v14 = v20;
    if (v20 == v19)
    {
      uint64_t v15 = 4LL;
      unsigned int v14 = v19;
    }

    else
    {
      if (!v20)
      {
LABEL_12:
        int v16 = v18;
        if (v18 == 2) {
          ++*(_DWORD *)(a1 + 2060);
        }
        return v16 != 0;
      }

      uint64_t v15 = 5LL;
    }

    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_12;
  }

  return result;
}

void sub_18743F90C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  int v16 = a15;
  if (a15 == &a12)
  {
    uint64_t v17 = 4LL;
    int v16 = &a12;
  }

  else
  {
    if (!a15) {
      goto LABEL_6;
    }
    uint64_t v17 = 5LL;
  }

  (*(void (**)(void))(*(void *)v16 + 8 * v17))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

float nlp::TrieCompletionGetScore(uint64_t a1)
{
  if (a1) {
    return *(float *)a1;
  }
  else {
    return 0.0;
  }
}

double nlp::BurstTrieCreateMutable(nlp *this)
{
  uint64_t v1 = (char *)calloc(1uLL, 0x838uLL);
  if (v1)
  {
    *(_OWORD *)(v1 + 2060) = 0u;
    *((_DWORD *)v1 + 519) = 1;
    *((void *)v1 + 260) = 0LL;
    *((_DWORD *)v1 + 524) = 2;
    *(void *)&double result = 64LL;
    *((void *)v1 + 261) = 64LL;
  }

  return result;
}

double nlp::BurstTrieCreateMutableWithOptions(int a1, int a2)
{
  uint64_t v4 = (char *)calloc(1uLL, 0x838uLL);
  if (v4)
  {
    double result = 0.0;
    *(_OWORD *)(v4 + 2060) = 0u;
    *((_DWORD *)v4 + 519) = 1;
    *((void *)v4 + 260) = 0LL;
    *(void *)(v4 + 2092) = 0x200000000LL;
    *((_DWORD *)v4 + 51std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = a2;
    *((_DWORD *)v4 + 522) = a1;
  }

  return result;
}

char *nlp::BurstTrieCreateFromFile(char *this, const __CFString *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (this)
  {
    uint64_t v2 = (const __CFString *)this;
    usedBufLeuint64_t n = 0LL;
    v10.length = CFStringGetLength((CFStringRef)this);
    v10.locatiouint64_t n = 0LL;
    CFStringGetBytes(v2, v10, 0x8000100u, 0x2Du, 0, buffer, 1024LL, &usedBufLen);
    buffer[usedBufLen] = 0;
    if (stat((const char *)buffer, &v7))
    {
      int v3 = -1;
LABEL_4:
      close(v3);
      return 0LL;
    }

    int v3 = open((const char *)buffer, 0);
    if (v3 < 0) {
      goto LABEL_4;
    }
    uint64_t v4 = (char *)mmap(0LL, v7.st_size, 1, 1, v3, 0LL);
    if (!v4)
    {
LABEL_11:
      if (!v3) {
        return 0LL;
      }
      goto LABEL_4;
    }

    uint64_t v5 = v4;
    this = nlp::burstTrieCreateWithBytes(v4, (const char *)1);
    if (!this)
    {
      munmap(v5, v7.st_size);
      goto LABEL_11;
    }
  }

  return this;
}

char *nlp::burstTrieCreateWithBytes(char *this, const char *a2)
{
  if (this)
  {
    uint64_t v2 = this;
    if (*(_DWORD *)this == 12648430 || *(_DWORD *)this == -900339842)
    {
      int v4 = (int)a2;
      this = (char *)calloc(1uLL, 0x838uLL);
      *((void *)this + 260) = v2;
      int v5 = v2[3];
      *(void *)(this + 2068) = v2[2];
      *((_DWORD *)this + 515) = v5;
      int v6 = v2[4];
      *((_DWORD *)this + 51std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v6;
      if (*v2 == -900339842) {
        *((_DWORD *)this + 51std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v6 | 1;
      }
      *((_DWORD *)this + 522) = v2[5];
      *((_DWORD *)this + 52std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v4;
      *((_DWORD *)this + 524) = 2;
      *((_DWORD *)this + 519) = 1;
    }

    else
    {
      return 0LL;
    }
  }

  return this;
}

void nlp::BurstTrieRelease(char *a1)
{
  if (a1)
  {
    int v2 = *((_DWORD *)a1 + 519) - 1;
    *((_DWORD *)a1 + 519) = v2;
    if (!v2)
    {
      int v3 = (void *)*((void *)a1 + 260);
      if (v3)
      {
        if (*((_DWORD *)a1 + 523)) {
          munmap(v3, *(void *)(a1 + 2068));
        }
      }

      else if ((a1[2064] & 1) != 0)
      {
        nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>((uint64_t)a1);
      }

      else
      {
        nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>((uint64_t)a1);
      }

      free(a1);
    }
  }

char *nlp::BurstTrieCreateWithBytes(nlp *this, const char *a2)
{
  return nlp::burstTrieCreateWithBytes((char *)this, 0LL);
}

uint64_t nlp::BurstTrieGetCount(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 2060);
  }
  return result;
}

char *nlp::BurstTrieCreateMutableCopy(nlp *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  int v2 = *((_DWORD *)a1 + 522);
  int v3 = *((_DWORD *)a1 + 516);
  int v4 = (char *)calloc(1uLL, 0x838uLL);
  int v5 = v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 2060) = 0u;
    *((_DWORD *)v4 + 519) = 1;
    *((void *)v4 + 260) = 0LL;
    *(void *)(v4 + 2092) = 0x200000000LL;
    *((_DWORD *)v4 + 51std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v3;
    *((_DWORD *)v4 + 522) = v2;
  }

  if ((*((_BYTE *)a1 + 2064) & 1) != 0)
  {
    v11[0] = off_18A04E9D8;
    v11[1] = nlp::rankedTraverseCallback;
    int v12 = v11;
    nlp::BurstTrieSearch(a1, 0LL, 0LL, (uint64_t)v4, (uint64_t)v11, -1);
    int v6 = v12;
    if (v12 == v11)
    {
      uint64_t v7 = 4LL;
      int v6 = v11;
      goto LABEL_12;
    }
  }

  else
  {
    v9[0] = off_18A04E9D8;
    v9[1] = nlp::traverseCallback;
    CFRange v10 = v9;
    nlp::BurstTrieSearch(a1, 0LL, 0LL, (uint64_t)v4, (uint64_t)v9, -1);
    int v6 = v10;
    if (v10 == v9)
    {
      uint64_t v7 = 4LL;
      int v6 = v9;
LABEL_12:
      (*(void (**)(void))(*v6 + 8 * v7))();
      return v5;
    }
  }

  if (v6)
  {
    uint64_t v7 = 5LL;
    goto LABEL_12;
  }

  return v5;
}

void sub_18743FDE4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  unsigned int v19 = a17;
  if (a17 == v17)
  {
    uint64_t v20 = 4LL;
    unsigned int v19 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_6;
    }
    uint64_t v20 = 5LL;
  }

  (*(void (**)(void))(*(void *)v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlp::BurstTrieSearch(nlp *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if ((a6 & 0x80000000) == 0)
  {
    CursorWithBytes = (nlp *)nlp::BurstTrieCreateCursorWithBytes((uint64_t)a1, a2, a3);
    if (!CursorWithBytes) {
      return;
    }
    int v12 = CursorWithBytes;
    uint64_t v13 = operator new(0x20uLL);
    *uint64_t v13 = off_18A04EC40;
    v13[1] = a2;
    *((_DWORD *)v13 + 4) = a3;
    void v13[3] = a5;
    unsigned int v19 = v13;
    nlp::BurstTrieTraverseFromCursor(v12, 0LL, (uint64_t)v18, a6);
    unsigned int v14 = v19;
    if (v19 == v18)
    {
      uint64_t v15 = 4LL;
      unsigned int v14 = v18;
    }

    else
    {
      if (!v19)
      {
LABEL_11:
        free(v12);
        return;
      }

      uint64_t v15 = 5LL;
    }

    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_11;
  }

  unint64_t v20 = 0xFFFFFFFF00000003LL;
  int v21 = 0;
  uint64_t v22 = a4;
  int v16 = v23;
  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v23,  a5);
  nlp::searchWithContext(a1, a2, a3, 0LL, (uint64_t)&v20);
  if (v24 == v23)
  {
    uint64_t v17 = 4LL;
  }

  else
  {
    if (!v24) {
      return;
    }
    uint64_t v17 = 5LL;
    int v16 = v24;
  }

  (*(void (**)(void *))(*v16 + 8 * v17))(v16);
}

void sub_18743FFA4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  unint64_t v20 = v19;
  if (a19 == v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = 4LL;
  }

  else
  {
    if (!a19) {
      goto LABEL_6;
    }
    uint64_t v23 = 5LL;
    uint64_t v22 = a19;
  }

  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::BurstTrieRetain(uint64_t result)
{
  if (result) {
    ++*(_DWORD *)(result + 2076);
  }
  return result;
}

unsigned __int16 *nlp::addLevelRanked( unsigned __int16 *result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, float *a7, int *a8, float a9, uint64_t a10, uint64_t a11)
{
  float v13 = a9;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (a5 >= a4)
  {
    *a8 = 2;
    if (*(_DWORD *)(a2 + 8))
    {
      *a8 = 1;
      if (*(void *)(a11 + 24))
      {
        double result = (unsigned __int16 *)std::function<float ()(void *,float,float)>::operator()( a11,  a10,  *(float *)(a2 + 4),  a9);
        float v13 = v22;
      }
    }

    *(float *)(a2 + 4) = v13;
    *(_DWORD *)(a2 + 8) = a6;
    *a7 = v13;
    goto LABEL_24;
  }

  uint64_t v19 = (uint64_t)result;
  int v31 = (unsigned __int8 *)(a3 + a5);
  uint64_t v20 = *(void *)(a2 + 8LL * *v31 + 12);
  if ((v20 & 3) == 2)
  {
    int v32 = (unsigned __int16 *)(v20 & 0xFFFFFFFFFFFFFFFCLL);
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v33,  a11);
    unsigned int v23 = nlp::addListNodeRanked(v19, (uint64_t **)&v32, a3, a4, a5 + 1, a6, a7, a8, v13, a10, (uint64_t)v33);
    double result = v34;
    if (v34 == (unsigned __int16 *)v33)
    {
      uint64_t v24 = 4LL;
      double result = (unsigned __int16 *)v33;
    }

    else
    {
      if (!v34)
      {
LABEL_19:
        uint64_t v29 = v32;
        if (v23 >= *(_DWORD *)(v19 + 2088))
        {
          double result = (unsigned __int16 *)nlp::burstLevelRanked(v19, v32, a7, a8);
          uint64_t v29 = result;
          uint64_t v30 = 1LL;
        }

        else
        {
          uint64_t v30 = 2LL;
        }

        uint64_t v28 = v30 | (unint64_t)v29;
        uint64_t v25 = v31;
        goto LABEL_23;
      }

      uint64_t v24 = 5LL;
    }

    double result = (unsigned __int16 *)(*(uint64_t (**)(void))(*(void *)result + 8 * v24))();
    goto LABEL_19;
  }

  if ((v20 & 3) != 1)
  {
    *a7 = a9;
    uint64_t v25 = (unsigned __int8 *)(a3 + a5);
    size_t v26 = ~a5 + a4;
    unint64_t v27 = (unint64_t)calloc(1uLL, v26 + 23);
    double result = (unsigned __int16 *)memcpy((void *)(v27 + 22), v31 + 1, v26);
    *(_BYTE *)(v27 + 22 + v2std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
    *(_WORD *)(v27 + 20) = v26;
    *(_DWORD *)(v27 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = a6;
    *(float *)(v27 + 8) = v13;
    *(float *)(v27 + 12) = v13;
    *(void *)unint64_t v27 = 0LL;
    uint64_t v28 = v27 | 2;
    *a8 = 2;
LABEL_23:
    *(void *)(a2 + 8LL * *v25 + 12) = v28;
    goto LABEL_24;
  }

  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v35,  a11);
  nlp::addLevelRanked(v19, v20 & 0xFFFFFFFFFFFFFFFCLL, a3, a4, a5 + 1, a6, a7, a8, v13, a10, v35);
  double result = v36;
  if (v36 == (unsigned __int16 *)v35)
  {
    uint64_t v21 = 4LL;
    double result = (unsigned __int16 *)v35;
  }

  else
  {
    if (!v36) {
      goto LABEL_24;
    }
    uint64_t v21 = 5LL;
  }

  double result = (unsigned __int16 *)(*(uint64_t (**)(void))(*(void *)result + 8 * v21))();
LABEL_24:
  return result;
}

void sub_1874402D0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  float v22 = a17;
  if (a17 == &a14)
  {
    uint64_t v23 = 4LL;
    float v22 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_6;
    }
    uint64_t v23 = 5LL;
  }

  (*(void (**)(void))(*(void *)v22 + 8 * v23))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::BurstTrieRemove(_DWORD *a1, char *a2, int a3)
{
  uint64_t result = 0LL;
  uint64_t v131 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return result;
  }
  int v5 = a2;
  if (!a2 || !a3) {
    return result;
  }
  if ((a1[516] & 1) != 0)
  {
    uint64_t v23 = (unint64_t *)operator new(8uLL);
    uint64_t v24 = 0LL;
    *uint64_t v23 = (unint64_t)a1;
    uint64_t v25 = v23 + 1;
    uint64_t v117 = (char *)(v23 + 1);
    std::string __p = v23;
    uint64_t v116 = v23 + 1;
    unint64_t v26 = (unint64_t)a1;
    while (1)
    {
      unint64_t v27 = v26 + 8LL * v5[v24];
      uint64_t v30 = *(void *)(v27 + 12);
      uint64_t v29 = (uint64_t *)(v27 + 12);
      uint64_t v28 = v30;
      uint64_t v31 = v30 & 3;
      if ((v30 & 3) == 0) {
        goto LABEL_62;
      }
      if (v31 == 2) {
        break;
      }
      unint64_t v26 = v28 & 0xFFFFFFFFFFFFFFFCLL;
      if (v25 >= (unint64_t *)v117)
      {
        uint64_t v32 = v25 - __p;
        unint64_t v33 = (v117 - (char *)__p) >> 2;
        if (v33 <= v32 + 1) {
          unint64_t v33 = v32 + 1;
        }
        else {
          unint64_t v34 = v33;
        }
        if (v34) {
          uint64_t v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v117, v34);
        }
        else {
          uint64_t v35 = 0LL;
        }
        uint64_t v36 = (unint64_t *)&v35[8 * v32];
        *uint64_t v36 = v26;
        uint64_t v25 = v36 + 1;
        uint64_t v37 = v116;
        if (v116 != __p)
        {
          do
          {
            unint64_t v38 = *--v37;
            *--uint64_t v36 = v38;
          }

          while (v37 != __p);
          uint64_t v37 = __p;
        }

        std::string __p = v36;
        uint64_t v117 = &v35[8 * v34];
        if (v37) {
          operator delete(v37);
        }
      }

      else
      {
        *v25++ = v26;
      }

      uint64_t v116 = v25;
      if (++v24 == a3)
      {
        if (!*(_DWORD *)(v26 + 8)) {
          goto LABEL_62;
        }
        *(_DWORD *)(v26 + 8) = 0;
        goto LABEL_84;
      }
    }

    size_t v46 = &v5[v24 + 1];
    int v47 = ~(_DWORD)v24 + a3;
    uint64_t v48 = (uint64_t *)(v28 & 0xFFFFFFFFFFFFFFFCLL);
    size_t v49 = *(unsigned __int16 *)((v28 & 0xFFFFFFFFFFFFFFFCLL) + 20);
    if (v47 == (_DWORD)v49 && !memcmp(v46, (char *)v48 + 22, v49))
    {
      uint64_t v56 = *v48;
      free(v48);
      uint64_t v57 = v56 | 2;
      if (!v56) {
        uint64_t v57 = 0LL;
      }
      *uint64_t v29 = v57;
    }

    else
    {
      uint64_t v50 = *v48;
      if (!*v48) {
        goto LABEL_62;
      }
      while (1)
      {
        uint64_t v51 = (uint64_t *)v50;
        size_t v52 = *(unsigned __int16 *)(v50 + 20);
        uint64_t v50 = *v51;
        uint64_t v48 = v51;
        if (!*v51) {
          goto LABEL_62;
        }
      }

      uint64_t *v48 = *v51;
      free(v51);
    }

LABEL_84:
    uint64_t v65 = v116 - __p;
    unsigned int v121 = 0;
    uint64_t v66 = v65 - 1;
    if (v65 == 1) {
      goto LABEL_159;
    }
    LOBYTE(v67) = 0;
    unint64_t v68 = a1[522];
    while (1)
    {
      int v69 = (nlp *)nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>((uint64_t)a1, __p[v66]);
      unsigned int v121 = 0;
      double v128 = off_18A04EA30;
      double v129 = &v121;
      uint64_t v130 = &v128;
      nlp::BurstTrieTraverseFromCursor(v69, 0LL, (uint64_t)&v128, -1);
      uint64_t v70 = v130;
      if (v130 == &v128)
      {
        uint64_t v70 = &v128;
        uint64_t v71 = 4LL;
      }

      else
      {
        if (!v130) {
          goto LABEL_92;
        }
        uint64_t v71 = 5LL;
      }

      (*v70)[v71]();
LABEL_92:
      if (v69) {
        free(v69);
      }
      if (v121 >= v68)
      {
        if ((v67 & 1) == 0) {
          goto LABEL_159;
        }
        uint64_t v67 = v66 + 1;
LABEL_104:
        uint64_t v118 = 0LL;
        uint64_t v119 = 0LL;
        uint64_t v120 = 0LL;
        std::vector<std::tuple<std::string,unsigned int,float>>::reserve(&v118, v68);
        uint64_t v76 = __p[v67];
        int v77 = (nlp *)nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>((uint64_t)a1, v76);
        double v125 = off_18A04EAC0;
        uint64_t v126 = &v118;
        uint64_t v127 = &v125;
        nlp::BurstTrieTraverseFromCursor(v77, 0LL, (uint64_t)&v125, -1);
        unsigned int v78 = v127;
        if (v127 == &v125)
        {
          uint64_t v79 = 4LL;
          unsigned int v78 = &v125;
LABEL_134:
          (*v78)[v79]();
        }

        else if (v127)
        {
          uint64_t v79 = 5LL;
          goto LABEL_134;
        }

        if (v68 <= (v119 - v118) >> 5) {
          __assert_rtn("reverseBurst", "BurstTrie.cpp", 965, "items.size() < sizeThreshold");
        }
        if (v77) {
          free(v77);
        }
        nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(v76);
        a1[515] -= (unint64_t)(v119 - v118) >> 5;
        *(void *)(__p[v66] + 8LL * v5[v66] + 12) = 0LL;
        double v98 = nlp::sharedBuffer(v97);
        uint64_t v99 = (uint64_t)v98;
        if (v67)
        {
          int v100 = v98;
          uint64_t v101 = v67;
          do
          {
            char v102 = *v5++;
            *v100++ = v102;
            --v101;
          }

          while (v101);
        }

        uint64_t v103 = v118;
        uint64_t v104 = v119;
        if (v118 == v119) {
          goto LABEL_158;
        }
        int v105 = a1[516];
        while (2)
        {
          if (*(char *)(v103 + 23) < 0)
          {
            int v107 = *(const void **)v103;
            size_t v106 = *(void *)(v103 + 8);
          }

          else
          {
            size_t v106 = *(unsigned __int8 *)(v103 + 23);
            int v107 = (const void *)v103;
          }

          uint64_t v108 = *(unsigned int *)(v103 + 24);
          float v109 = *(float *)(v103 + 28);
          memcpy((void *)(v99 + v67), v107, v106);
          else {
            LODWORD(v110) = *(unsigned __int8 *)(v103 + 23);
          }
          uint64_t v111 = (v110 + v67);
          if ((v105 & 1) == 0)
          {
            nlp::BurstTrieAdd((uint64_t)a1, v99, v111, v108);
            goto LABEL_157;
          }

          uint64_t v124 = 0LL;
          nlp::BurstTrieAddWithScore((uint64_t)a1, v99, v111, v108, 0LL, (uint64_t)v123, v109);
          uint64_t v112 = v124;
          if (v124 == v123)
          {
            uint64_t v112 = v123;
            uint64_t v113 = 4LL;
LABEL_156:
            (*(void (**)(void))(*v112 + 8 * v113))();
          }

          else if (v124)
          {
            uint64_t v113 = 5LL;
            goto LABEL_156;
          }

LABEL_157:
          v103 += 32LL;
          if (v103 == v104) {
            goto LABEL_158;
          }
          continue;
        }
      }

      uint64_t v67 = 1LL;
      if (!--v66) {
        goto LABEL_104;
      }
    }
  }

  uint64_t v7 = operator new(8uLL);
  uint64_t v8 = 0LL;
  *uint64_t v7 = a1;
  uint64_t v9 = (char *)(v7 + 1);
  uint64_t v117 = (char *)(v7 + 1);
  std::string __p = v7;
  uint64_t v115 = (char *)(v7 + 1);
  CFRange v10 = a1;
  do
  {
    uint64_t v11 = &v10[2 * v5[v8]];
    uint64_t v14 = *(void *)(v11 + 1);
    float v13 = (uint64_t *)(v11 + 1);
    uint64_t v12 = v14;
    uint64_t v15 = v14 & 3;
    if ((v14 & 3) == 0) {
      goto LABEL_62;
    }
    if (v15 == 2)
    {
      int v39 = &v5[v8 + 1];
      int v40 = ~(_DWORD)v8 + a3;
      int v41 = (uint64_t *)(v12 & 0xFFFFFFFFFFFFFFFCLL);
      size_t v42 = *(unsigned __int16 *)((v12 & 0xFFFFFFFFFFFFFFFCLL) + 12);
      if (v40 == (_DWORD)v42 && !memcmp(v39, (char *)v41 + 14, v42))
      {
        uint64_t v54 = *v41;
        free(v41);
        uint64_t v55 = v54 | 2;
        if (!v54) {
          uint64_t v55 = 0LL;
        }
        *float v13 = v55;
      }

      else
      {
        uint64_t v43 = *v41;
        if (!*v41) {
          goto LABEL_62;
        }
        while (1)
        {
          uint64_t v44 = (uint64_t *)v43;
          size_t v45 = *(unsigned __int16 *)(v43 + 12);
          uint64_t v43 = *v44;
          int v41 = v44;
          if (!*v44) {
            goto LABEL_62;
          }
        }

        *int v41 = *v44;
        free(v44);
      }

LABEL_70:
      uint64_t v58 = (v115 - (char *)__p) >> 3;
      unsigned int v121 = 0;
      uint64_t v59 = v58 - 1;
      if (v58 == 1) {
        goto LABEL_159;
      }
      LOBYTE(v60) = 0;
      unint64_t v61 = a1[522];
      while (1)
      {
        double v62 = (nlp *)nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_TrieLevel *>((uint64_t)a1, __p[v59]);
        unsigned int v121 = 0;
        double v128 = off_18A04EB40;
        double v129 = &v121;
        uint64_t v130 = &v128;
        nlp::BurstTrieTraverseFromCursor(v62, 0LL, (uint64_t)&v128, -1);
        double v63 = v130;
        if (v130 == &v128)
        {
          double v63 = &v128;
          uint64_t v64 = 4LL;
        }

        else
        {
          if (!v130) {
            goto LABEL_78;
          }
          uint64_t v64 = 5LL;
        }

        (*v63)[v64]();
LABEL_78:
        if (v62) {
          free(v62);
        }
        if (v121 >= v61)
        {
          if ((v60 & 1) != 0)
          {
            uint64_t v60 = v59 + 1;
LABEL_99:
            uint64_t v118 = 0LL;
            uint64_t v119 = 0LL;
            uint64_t v120 = 0LL;
            std::vector<std::tuple<std::string,unsigned int,float>>::reserve(&v118, v61);
            unint64_t v72 = __p[v60];
            int v73 = (nlp *)nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_TrieLevel *>((uint64_t)a1, v72);
            double v125 = off_18A04EBC0;
            uint64_t v126 = &v118;
            uint64_t v127 = &v125;
            nlp::BurstTrieTraverseFromCursor(v73, 0LL, (uint64_t)&v125, -1);
            uint64_t v74 = v127;
            if (v127 == &v125)
            {
              uint64_t v75 = 4LL;
              uint64_t v74 = &v125;
LABEL_108:
              (*v74)[v75]();
            }

            else if (v127)
            {
              uint64_t v75 = 5LL;
              goto LABEL_108;
            }

            if (v61 <= (v119 - v118) >> 5) {
              __assert_rtn("reverseBurst", "BurstTrie.cpp", 965, "items.size() < sizeThreshold");
            }
            if (v73) {
              free(v73);
            }
            nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(v72);
            a1[515] -= (unint64_t)(v119 - v118) >> 5;
            *(void *)(__p[v59] + 8LL * v5[v59] + 4) = 0LL;
            double v81 = nlp::sharedBuffer(v80);
            uint64_t v82 = (uint64_t)v81;
            if (v60)
            {
              uint64_t v83 = v81;
              uint64_t v84 = v60;
              do
              {
                char v85 = *v5++;
                *v83++ = v85;
                --v84;
              }

              while (v84);
            }

            uint64_t v86 = v118;
            uint64_t v87 = v119;
            if (v118 != v119)
            {
              int v88 = a1[516];
              do
              {
                if (*(char *)(v86 + 23) < 0)
                {
                  int v90 = *(const void **)v86;
                  size_t v89 = *(void *)(v86 + 8);
                }

                else
                {
                  size_t v89 = *(unsigned __int8 *)(v86 + 23);
                  int v90 = (const void *)v86;
                }

                uint64_t v91 = *(unsigned int *)(v86 + 24);
                float v92 = *(float *)(v86 + 28);
                memcpy((void *)(v82 + v60), v90, v89);
                else {
                  LODWORD(v9std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = *(unsigned __int8 *)(v86 + 23);
                }
                uint64_t v94 = (v93 + v60);
                if ((v88 & 1) != 0)
                {
                  uint64_t v124 = 0LL;
                  nlp::BurstTrieAddWithScore((uint64_t)a1, v82, v94, v91, 0LL, (uint64_t)v123, v92);
                  uint64_t v95 = v124;
                  if (v124 == v123)
                  {
                    uint64_t v95 = v123;
                    uint64_t v96 = 4LL;
                    goto LABEL_130;
                  }

                  if (v124)
                  {
                    uint64_t v96 = 5LL;
LABEL_130:
                    (*(void (**)(void))(*v95 + 8 * v96))();
                  }
                }

                else
                {
                  nlp::BurstTrieAdd((uint64_t)a1, v82, v94, v91);
                }

                v86 += 32LL;
              }

              while (v86 != v87);
            }

LABEL_158:
            uint64_t v122 = (void **)&v118;
            std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&v122);
          }

LABEL_159:
          int v53 = 1;
          goto LABEL_160;
        }

        uint64_t v60 = 1LL;
        if (!--v59) {
          goto LABEL_99;
        }
      }
    }

    CFRange v10 = (_DWORD *)(v12 & 0xFFFFFFFFFFFFFFFCLL);
    if (v9 >= v117)
    {
      uint64_t v16 = (v9 - (char *)__p) >> 3;
      unint64_t v17 = (v117 - (char *)__p) >> 2;
      if (v17 <= v16 + 1) {
        unint64_t v17 = v16 + 1;
      }
      else {
        unint64_t v18 = v17;
      }
      if (v18) {
        uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v117, v18);
      }
      else {
        uint64_t v19 = 0LL;
      }
      uint64_t v20 = &v19[8 * v16];
      *(void *)uint64_t v20 = v10;
      uint64_t v9 = v20 + 8;
      uint64_t v21 = v115;
      if (v115 != (char *)__p)
      {
        do
        {
          uint64_t v22 = *((void *)v21 - 1);
          v21 -= 8;
          *((void *)v20 - 1) = v22;
          v20 -= 8;
        }

        while (v21 != (char *)__p);
        uint64_t v21 = (char *)__p;
      }

      std::string __p = (unint64_t *)v20;
      uint64_t v117 = &v19[8 * v18];
      if (v21) {
        operator delete(v21);
      }
    }

    else
    {
      *(void *)uint64_t v9 = v10;
      v9 += 8;
    }

    uint64_t v115 = v9;
    ++v8;
  }

  while (v8 != a3);
  if (*v10)
  {
    *CFRange v10 = 0;
    goto LABEL_70;
  }

void sub_187440D38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char *a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28)
{
  a16 = &a12;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a16);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t nlp::TrieCompletionRetain(uint64_t result)
{
  if (result) {
    ++*(_DWORD *)(result + 12);
  }
  return result;
}

const __CFAllocator *nlp::trieCompletionRetain(nlp *this, const __CFAllocator *a2, const void *a3)
{
  uint64_t result = a2;
  if (a2) {
    ++*((_DWORD *)a2 + 3);
  }
  return result;
}

void nlp::TrieCompletionRelease(void *a1)
{
  if (a1)
  {
    int v1 = *((_DWORD *)a1 + 3) - 1;
    *((_DWORD *)a1 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v1;
    if (!v1) {
      free(a1);
    }
  }

void nlp::trieCompletionRelease(nlp *this, const __CFAllocator *a2, const void *a3)
{
  if (a2)
  {
    int v3 = *((_DWORD *)a2 + 3) - 1;
    *((_DWORD *)a2 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v3;
    if (!v3) {
      free(a2);
    }
  }

uint64_t nlp::BurstTrieContains(nlp *a1, const void *a2, uint64_t a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!(_DWORD)a3) {
    return 0LL;
  }
  unint64_t v11 = 0xFFFFFFFF00000000LL;
  int v12 = 0;
  uint64_t v7 = v14;
  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
  nlp::searchWithContext(a1, a2, a3, 1LL, (uint64_t)&v11);
  if ((v11 & 0x8000000000000000LL) != 0)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    if (a4) {
      *a4 = HIDWORD(v11);
    }
    if (a5) {
      *a5 = v12;
    }
    uint64_t v8 = 1LL;
  }

  if (v15 == v14)
  {
    uint64_t v9 = 4LL;
    goto LABEL_14;
  }

  if (v15)
  {
    uint64_t v9 = 5LL;
    uint64_t v7 = v15;
LABEL_14:
    (*(void (**)(void *))(*v7 + 8 * v9))(v7);
  }

  return v8;
}

void sub_187440F90( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  if (a15 == v15)
  {
    uint64_t v17 = 4LL;
  }

  else
  {
    if (!a15) {
      goto LABEL_6;
    }
    uint64_t v17 = 5LL;
    uint64_t v15 = a15;
  }

  (*(void (**)(void *))(*v15 + 8 * v17))(v15);
LABEL_6:
  _Unwind_Resume(exception_object);
}

nlp *nlp::searchWithContext(nlp *result, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (a3 <= 0x3FF)
  {
    uint64_t v9 = (uint64_t)result;
    CFRange v10 = nlp::sharedBuffer(result);
    memcpy(v10, a2, a3);
    *((_BYTE *)v10 + astd::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = 0;
    uint64_t v11 = *(void *)(v9 + 2080);
    int v12 = *(_DWORD *)(v9 + 2064);
    if (v11)
    {
      uint64_t v13 = (*(_DWORD *)(v11 + 4) & 0xFFFFFFFC) + v11;
      if ((v12 & 1) != 0)
      {
        v21[0] = off_18A04E928;
        v21[1] = nlp::containsKey;
        uint64_t v22 = (nlp *)v21;
        nlp::searchDiskLevelRanked(v9, v13, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v21);
        uint64_t result = v22;
        if (v22 == (nlp *)v21)
        {
          uint64_t v14 = 4LL;
          uint64_t result = (nlp *)v21;
          return (nlp *)(*(uint64_t (**)(void))(*(void *)result + 8 * v14))();
        }
      }

      else
      {
        v19[0] = off_18A04E928;
        v19[1] = nlp::containsKey;
        uint64_t v20 = (nlp *)v19;
        nlp::searchDiskLevel(v9, v13, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v19);
        uint64_t result = v20;
        if (v20 == (nlp *)v19)
        {
          uint64_t v14 = 4LL;
          uint64_t result = (nlp *)v19;
          return (nlp *)(*(uint64_t (**)(void))(*(void *)result + 8 * v14))();
        }
      }
    }

    else if ((v12 & 1) != 0)
    {
      v17[0] = off_18A04E928;
      v17[1] = nlp::containsKey;
      unint64_t v18 = (nlp *)v17;
      nlp::searchLevelRanked(v9, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v17);
      uint64_t result = v18;
      if (v18 == (nlp *)v17)
      {
        uint64_t v14 = 4LL;
        uint64_t result = (nlp *)v17;
        return (nlp *)(*(uint64_t (**)(void))(*(void *)result + 8 * v14))();
      }
    }

    else
    {
      v15[0] = off_18A04E928;
      v15[1] = nlp::containsKey;
      uint64_t v16 = (nlp *)v15;
      nlp::searchLevel((int *)v9, (unsigned __int8 *)v10, a3, 0, a4, a5, (uint64_t)v15);
      uint64_t result = v16;
      if (v16 == (nlp *)v15)
      {
        uint64_t v14 = 4LL;
        uint64_t result = (nlp *)v15;
        return (nlp *)(*(uint64_t (**)(void))(*(void *)result + 8 * v14))();
      }
    }

    if (!result) {
      return result;
    }
    uint64_t v14 = 5LL;
    return (nlp *)(*(uint64_t (**)(void))(*(void *)result + 8 * v14))();
  }

  return result;
}

void sub_1874411E0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  uint64_t v23 = a17;
  if (a17 == v21)
  {
    uint64_t v24 = 4LL;
    uint64_t v23 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_6;
    }
    uint64_t v24 = 5LL;
  }

  (*(void (**)(void))(*(void *)v23 + 8 * v24))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *nlp::BurstTrieCreateCursorWithBytes(uint64_t a1, unsigned __int8 *a2, unsigned int a3)
{
  int v6 = calloc(0x28uLL, 1uLL);
  nlp::BurstTrieSetCursorWithBytes(a1, (uint64_t)v6, a2, a3);
  if (!v7 && v6)
  {
    free(v6);
    return 0LL;
  }

  return v6;
}

nlp *nlp::BurstTrieTraverseFromCursor(nlp *result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (result)
  {
    int v7 = result;
    uint64_t result = (nlp *)nlp::sharedBuffer(result);
    uint64_t v8 = (uint64_t)result;
    char v19 = 0;
    int v9 = *((_DWORD *)v7 + 7);
    if (v9)
    {
      if (v9 != 1) {
        return result;
      }
      __int128 v16 = *(_OWORD *)v7;
      uint64_t v17 = *((void *)v7 + 2);
      uint64_t v10 = *((void *)v7 + 4);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v22,  a3);
      nlp::traverseFromCompactMapCursor(v10, (uint64_t)&v16);
      uint64_t result = v23;
      if (v23 == (nlp *)v22)
      {
        uint64_t v14 = 4LL;
        uint64_t result = (nlp *)v22;
        return (nlp *)(*(uint64_t (**)(nlp *, uint64_t, uint64_t, uint64_t))(*(void *)result + 8 * v14))( result,  v11,  v12,  v13);
      }
    }

    else
    {
      __int128 v16 = *(_OWORD *)v7;
      uint64_t v17 = *((void *)v7 + 2);
      int v18 = *((_DWORD *)v7 + 6);
      uint64_t v15 = (void *)*((void *)v7 + 4);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v20,  a3);
      nlp::traverseFromMapCursor(v15, (uint64_t)&v16, v8, 0, &v19, a4, a2, (uint64_t)v20);
      uint64_t result = v21;
      if (v21 == (nlp *)v20)
      {
        uint64_t v14 = 4LL;
        uint64_t result = (nlp *)v20;
        return (nlp *)(*(uint64_t (**)(nlp *, uint64_t, uint64_t, uint64_t))(*(void *)result + 8 * v14))( result,  v11,  v12,  v13);
      }
    }

    if (!result) {
      return result;
    }
    uint64_t v14 = 5LL;
    return (nlp *)(*(uint64_t (**)(nlp *, uint64_t, uint64_t, uint64_t))(*(void *)result + 8 * v14))( result,  v11,  v12,  v13);
  }

  return result;
}

void sub_18744144C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  uint64_t v23 = a17;
  if (a17 == v21)
  {
    uint64_t v24 = 4LL;
    uint64_t v23 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_6;
    }
    uint64_t v24 = 5LL;
  }

  (*(void (**)(void))(*(void *)v23 + 8 * v24))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlp::BurstTrieCursorRelease(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t nlp::enumerateListNode<nlp::_ListNode *>( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( a6,  a5,  a2,  a3,  *(_DWORD *)(a1 + 8),  a4,  0.0);
}

uint64_t std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, float a7)
{
  uint64_t v13 = a3;
  uint64_t v14 = a2;
  int v12 = a4;
  int v11 = a5;
  float v10 = a7;
  uint64_t v9 = a6;
  uint64_t v7 = *(void *)(a1 + 24);
  if (!v7) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, int *, int *, float *, uint64_t *))(*(void *)v7 + 48LL))( v7,  &v14,  &v13,  &v12,  &v11,  &v10,  &v9);
}

void nlp::traverseFromCompactMapCursor(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

void sub_1874415A4(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  if (a2 == *(_DWORD *)(*(void *)(v6 + 2080) + 4LL))
  {
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v11,  a1);
    nlp::traverseFromCompactMapCursorMappedLevel((_BYTE *)v6, v4, v3, v7, v5, v2, v10, (uint64_t)v11);
    uint64_t v8 = v12;
    if (v12 == v11)
    {
      uint64_t v9 = 4LL;
      uint64_t v8 = v11;
    }

    else
    {
      if (!v12) {
        return;
      }
      uint64_t v9 = 5LL;
    }

    (*(void (**)(void))(*v8 + 8 * v9))();
  }

void sub_187441D10( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char *a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  uint64_t v28 = a14;
  if (a14 == v26)
  {
    uint64_t v29 = 4LL;
    uint64_t v28 = &a11;
  }

  else
  {
    if (!a14) {
      goto LABEL_6;
    }
    uint64_t v29 = 5LL;
  }

  (*(void (**)(void))(*(void *)v28 + 8 * v29))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_BYTE *nlp::traverseFromCompactMapCursorMappedLevel( _BYTE *result, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, _BYTE *a6, uint64_t a7, uint64_t a8)
{
  int v11 = result;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  unint64_t v12 = (*(void *)a2 & 0xFFFFFFFFFFFFFFFCLL) + *((void *)result + 260);
  if ((result[2064] & 1) == 0)
  {
    if (*(_DWORD *)(v12 + 1024))
    {
      *(_BYTE *)(a3 + a5) = 0;
      uint64_t result = (_BYTE *)std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( a8,  a7,  a3,  0,  *(_DWORD *)(v12 + 1024),  (uint64_t)a6,  0.0);
      if (a5 >= a4 || *a6) {
        return result;
      }
    }

    else if (a5 >= a4)
    {
      return result;
    }

    uint64_t v13 = 0LL;
    while (1)
    {
      *(_BYTE *)(a3 + a5) = v13;
      *(void *)a2 = *(unsigned int *)(v12 + 4 * v13);
      *(void *)(a2 + 8) = 0LL;
      *(_DWORD *)(a2 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
      if (v13) {
        uint64_t v14 = a5 + 1;
      }
      else {
        uint64_t v14 = a5;
      }
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v24,  a8);
      nlp::traverseFromCompactMapCursor(v11, a2, a3, a4 - (v13 != 0), v14, a6, a7, v24);
      uint64_t result = v25;
      if (v25 == v24)
      {
        uint64_t result = v24;
        uint64_t v15 = 4LL;
      }

      else
      {
        if (!v25) {
          goto LABEL_20;
        }
        uint64_t v15 = 5LL;
      }

      uint64_t result = (_BYTE *)(*(uint64_t (**)(void))(*(void *)result + 8 * v15))();
LABEL_20:
      if (!*a6)
      {
        BOOL v16 = v13++ == 255;
        if (!v16) {
          continue;
        }
      }

      return result;
    }
  }

  if (!*(_DWORD *)(v12 + 1024))
  {
    if (a5 >= a4) {
      return result;
    }
    goto LABEL_25;
  }

  *(_BYTE *)(a3 + a5) = 0;
  uint64_t result = (_BYTE *)std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( a8,  a7,  a3,  0,  *(_DWORD *)(v12 + 1024),  (uint64_t)a6,  *(float *)(v12 + 1032));
  if (a5 < a4 && !*a6)
  {
LABEL_25:
    uint64_t v17 = 0LL;
    while (1)
    {
      *(_BYTE *)(a3 + a5) = v17;
      *(void *)a2 = *(unsigned int *)(v12 + 4 * v17);
      if (v17) {
        uint64_t v18 = a5 + 1;
      }
      else {
        uint64_t v18 = a5;
      }
      *(void *)(a2 + 8) = 0LL;
      *(void *)(a2 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v26,  a8);
      nlp::traverseFromCompactMapCursor(v11, a2, a3, a4 - (v17 != 0), v18, a6, a7, v26);
      uint64_t result = v27;
      if (v27 == v26)
      {
        uint64_t result = v26;
        uint64_t v19 = 4LL;
      }

      else
      {
        if (!v27) {
          goto LABEL_34;
        }
        uint64_t v19 = 5LL;
      }

      uint64_t result = (_BYTE *)(*(uint64_t (**)(void))(*(void *)result + 8 * v19))();
LABEL_34:
      if (!*a6)
      {
        BOOL v16 = v17++ == 255;
        if (!v16) {
          continue;
        }
      }

      return result;
    }
  }

  return result;
}

void sub_1874420C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19)
{
  uint64_t v20 = a19;
  if (a19 == &a16)
  {
    uint64_t v21 = 4LL;
    uint64_t v20 = &a16;
  }

  else
  {
    if (!a19) {
      goto LABEL_6;
    }
    uint64_t v21 = 5LL;
  }

  (*(void (**)(void))(*(void *)v20 + 8 * v21))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void nlp::BurstTrieSetCursorWithBytes(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4)
{
  if (a1 && a2)
  {
  }

uint64_t nlp::burstTrieSetCursor(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  *(void *)(a2 + 32) = a1;
  int v2 = *(_DWORD **)(a1 + 2080);
  if (v2)
  {
    if (*v2 == -900339842 || *v2 == 12648430 && v2[7] == 2)
    {
      uint64_t result = 1LL;
      *(_DWORD *)(a2 + 28) = 1;
      uint64_t v4 = v2[1];
      *(void *)(a2 + 8) = 0LL;
      *(void *)(a2 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
      *(void *)a2 = v4;
      return result;
    }

    return 0LL;
  }

  *(_DWORD *)(a2 + 28) = 0;
  *(void *)(a2 + 8) = a1 | 1;
  *(void *)(a2 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
  return 1LL;
}

void nlp::BurstTrieCursorAdvanceWithBytes(uint64_t a1, unsigned __int8 *a2, unsigned int a3, __n128 a4)
{
  if (a1)
  {
    int v5 = *(_DWORD *)(a1 + 28);
    if (v5)
    {
      if (v5 == 1)
      {
        uint64_t v6 = *(void *)a1;
        uint64_t v7 = *(void *)(a1 + 8);
        int v8 = *(_DWORD *)(a1 + 16);
        int v9 = *(_DWORD *)(a1 + 20);
        nlp::advanceCompactMapCursor(*(void *)(a1 + 32), a1);
        if (!v10)
        {
          *(void *)a1 = v6;
          *(void *)(a1 + 8) = v7;
          *(_DWORD *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v8;
          *(_DWORD *)(a1 + 20) = v9;
        }
      }
    }

    else
    {
      uint64_t v12 = *(void *)a1;
      uint64_t v11 = *(void *)(a1 + 8);
      uint64_t v13 = *(void *)(a1 + 16);
      int v14 = *(_DWORD *)(a1 + 24);
      if (!nlp::advanceMapCursor(*(void *)(a1 + 32), a1, a2, a3, a4))
      {
        *(void *)a1 = v12;
        *(void *)(a1 + 8) = v11;
        *(void *)(a1 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v13;
        *(_DWORD *)(a1 + 24) = v14;
      }
    }
  }

void nlp::advanceCompactMapCursor(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

BOOL sub_18744230C@<W0>(uint64_t a1@<X8>)
{
  return a1 == *(_DWORD *)(*(void *)(v4 + 2080) + 4LL)
      && nlp::advanceCompactMapCursorMappedLevel(v4, v1, v3, v2) != 0;
}

uint64_t nlp::advanceMapCursor(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, __n128 a5)
{
  uint64_t v9 = *(void *)(a2 + 8);
  if ((v9 & 3) == 2)
  {
    int v12 = nlp::advanceMapCursorTrieList(a1, a2, a3, a4, a5);
    return v12 != 0;
  }

  if ((v9 & 3) != 1) {
    return 0LL;
  }
  int v10 = (_DWORD *)(v9 & 0xFFFFFFFFFFFFFFFCLL);
  if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
  {
    if (a4)
    {
      uint64_t v11 = (uint64_t *)&v10[2 * *a3 + 3];
      goto LABEL_10;
    }

    *(_DWORD *)(a2 + 20) = v10[2];
    *(_DWORD *)(a2 + 24) = v10[1];
  }

  else
  {
    if (a4)
    {
      uint64_t v11 = (uint64_t *)&v10[2 * *a3 + 1];
LABEL_10:
      nlp::updateMapCursorPointer(a1, a2, *v11);
      int v12 = nlp::advanceMapCursor(a1, a2, a3 + 1, a4 - 1);
      return v12 != 0;
    }

    *(_DWORD *)(a2 + 20) = *v10;
  }

  return 1LL;
}

void *nlp::sharedBuffer(nlp *this)
{
  {
    pthread_key_t v4 = 0LL;
    pthread_key_create(&v4, (void (__cdecl *)(void *))MEMORY[0x1895FB398]);
    nlp::sharedBuffer(void)::key = v4;
  }

  int v2 = pthread_getspecific(nlp::sharedBuffer(void)::key);
  if (!v2)
  {
    int v2 = malloc(0x1000uLL);
    pthread_setspecific(nlp::sharedBuffer(void)::key, v2);
  }

  return v2;
}

void sub_18744292C(_Unwind_Exception *a1)
{
}

void *nlp::traverseFromMapCursor( void *result, uint64_t a2, uint64_t a3, unsigned int a4, _BYTE *a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  int v13 = *((_DWORD *)result + 516);
  uint64_t v14 = *(void *)(a2 + 8) & 3LL;
  if (v14 != 2)
  {
    if (v14 != 1) {
      return result;
    }
    uint64_t v15 = (uint64_t)result;
    if ((v13 & 1) == 0)
    {
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v64,  a8);
      BOOL v16 = (int *)(*(void *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL);
      if (*v16)
      {
        std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( (uint64_t)v64,  a7,  a3,  a4,  *v16,  (uint64_t)a5,  *(float *)(a2 + 24));
        if (!a6 || *a5) {
          goto LABEL_85;
        }
      }

      else if (!a6)
      {
        goto LABEL_85;
      }

      uint64_t v48 = 0LL;
      uint64_t v49 = (a6 - 1);
      while (1)
      {
        *(_BYTE *)(a3 + a4) = v48;
        nlp::updateMapCursorPointer(v15, a2, *(void *)&v16[2 * v48 + 1]);
        uint64_t v50 = (uint64_t)v65;
        if (!v65) {
          goto LABEL_59;
        }
        if (v65 != v64) {
          break;
        }
        int v69 = v68;
        (*(void (**)(void *, _BYTE *))(v64[0] + 24LL))(v64, v68);
LABEL_61:
        nlp::traverseFromMapCursor(v15, a2, a3, a4 + 1, a5, v49, a7, v68);
        uint64_t v51 = v69;
        if (v69 == v68)
        {
          uint64_t v51 = v68;
          uint64_t v52 = 4LL;
        }

        else
        {
          if (!v69) {
            goto LABEL_66;
          }
          uint64_t v52 = 5LL;
        }

        (*(void (**)(void))(*v51 + 8 * v52))();
LABEL_66:
        if (!*a5)
        {
          BOOL v53 = v48++ == 255;
          if (!v53) {
            continue;
          }
        }

        goto LABEL_85;
      }

      uint64_t v50 = (*(uint64_t (**)(void))(*v65 + 16LL))();
LABEL_59:
      int v69 = (_BYTE *)v50;
      goto LABEL_61;
    }

    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v66,  a8);
    unint64_t v33 = *(void *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
    int v34 = *(_DWORD *)(v33 + 8);
    if (v34)
    {
      std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( (uint64_t)v66,  a7,  a3,  a4,  v34,  (uint64_t)a5,  *(float *)(a2 + 24));
      if (!a6 || *a5)
      {
LABEL_85:
        if ((v13 & 1) != 0)
        {
          uint64_t result = v67;
          if (v67 != v66) {
            goto LABEL_89;
          }
          uint64_t v47 = 4LL;
          uint64_t result = v66;
        }

        else
        {
          uint64_t result = v65;
          if (v65 != v64) {
            goto LABEL_89;
          }
          uint64_t v47 = 4LL;
          uint64_t result = v64;
        }

        return (void *)(*(uint64_t (**)(void))(*result + 8 * v47))();
      }
    }

    else if (!a6)
    {
      goto LABEL_85;
    }

    uint64_t v54 = 0LL;
    uint64_t v55 = (a6 - 1);
    while (1)
    {
      *(_BYTE *)(a3 + a4) = v54;
      nlp::updateMapCursorPointer(v15, a2, *(void *)(v33 + 12 + 8 * v54));
      uint64_t v56 = (uint64_t)v67;
      if (!v67) {
        goto LABEL_75;
      }
      if (v67 != v66) {
        break;
      }
      int v69 = v68;
      (*(void (**)(void *, _BYTE *))(v66[0] + 24LL))(v66, v68);
LABEL_77:
      nlp::traverseFromMapCursor(v15, a2, a3, a4 + 1, a5, v55, a7, v68);
      uint64_t v57 = v69;
      if (v69 == v68)
      {
        uint64_t v57 = v68;
        uint64_t v58 = 4LL;
      }

      else
      {
        if (!v69) {
          goto LABEL_82;
        }
        uint64_t v58 = 5LL;
      }

      (*(void (**)(void))(*v57 + 8 * v58))();
LABEL_82:
      if (!*a5)
      {
        BOOL v53 = v54++ == 255;
        if (!v53) {
          continue;
        }
      }

      goto LABEL_85;
    }

    uint64_t v56 = (*(uint64_t (**)(void))(*v67 + 16LL))();
LABEL_75:
    int v69 = (_BYTE *)v56;
    goto LABEL_77;
  }

  if ((v13 & 1) != 0)
  {
    std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v62,  a8);
    unint64_t v35 = *(void *)a2 & 0xFFFFFFFFFFFFFFFCLL;
    if (v35)
    {
      uint64_t v36 = (unsigned __int8 *)(v35 + 22);
      uint64_t v37 = *(unsigned int *)(a2 + 16);
      while (1)
      {
        uint64_t v38 = *(unsigned __int16 *)(v35 + 20);
        if (v38 >= v37)
        {
          size_t v39 = v38 - (int)v37;
          if (a6 < 0 || (int)v39 <= a6)
          {
            if ((_DWORD)v37)
            {
              int v40 = (unsigned __int8 *)(v35 + 22);
              int v41 = v36;
              uint64_t v42 = v37;
              while (1)
              {
                int v44 = *v40++;
                int v43 = v44;
                int v45 = *v41++;
                if (v43 != v45) {
                  break;
                }
                if (!--v42) {
                  goto LABEL_47;
                }
              }
            }

            else
            {
LABEL_47:
              unsigned int v46 = v39 + a4;
              memcpy((void *)(a3 + a4), (const void *)(v35 + v37 + 22), v39);
              *(_BYTE *)(a3 + v4std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
              std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( (uint64_t)v62,  a7,  a3,  v46,  *(_DWORD *)(v35 + 16),  (uint64_t)a5,  *(float *)(v35 + 12));
            }
          }
        }

        unint64_t v35 = *(void *)v35;
        if (!v35) {
          goto LABEL_49;
        }
      }
    }

    goto LABEL_52;
  }

  std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v60,  a8);
  char v17 = v13;
  unint64_t v18 = *(void *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v19 = *(unsigned int *)(a2 + 16);
  if (!v18) {
    goto LABEL_33;
  }
  unint64_t v20 = *(void *)(a2 + 8) & 0xFFFFFFFFFFFFFFFCLL;
  while (1)
  {
    if (v20 == v18)
    {
      unsigned int v21 = *(unsigned __int16 *)(v18 + 12);
      goto LABEL_20;
    }

    unsigned int v21 = *(unsigned __int16 *)(v20 + 12);
    if ((_DWORD)v19) {
      break;
    }
LABEL_20:
    int v28 = v21 - v19;
    if ((a6 & 0x80000000) == 0 && v28 > a6) {
      goto LABEL_32;
    }
    unsigned int v29 = v28 + a4;
    memcpy((void *)(a3 + a4), (const void *)(v20 + v19 + 14), v28);
    *(_BYTE *)(a3 + v29) = 0;
    uint64_t v30 = (uint64_t)v61;
    if (!v61) {
      goto LABEL_25;
    }
    if (v61 != v60)
    {
      uint64_t v30 = (*(uint64_t (**)(void))(*v61 + 16LL))();
LABEL_25:
      int v69 = (_BYTE *)v30;
      goto LABEL_27;
    }

    int v69 = v68;
    (*(void (**)(void *, _BYTE *))(v60[0] + 24LL))(v60, v68);
LABEL_27:
    std::function<void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( (uint64_t)v68,  a7,  a3,  v29,  *(_DWORD *)(v20 + 8),  (uint64_t)a5,  0.0);
    uint64_t v31 = v69;
    if (v69 == v68)
    {
      uint64_t v31 = v68;
      uint64_t v32 = 4LL;
      goto LABEL_31;
    }

    if (v69)
    {
      uint64_t v32 = 5LL;
LABEL_31:
      (*(void (**)(void))(*v31 + 8 * v32))();
    }

LABEL_33:
  LOBYTE(v1std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v17;
LABEL_49:
  if ((v13 & 1) != 0)
  {
LABEL_52:
    uint64_t result = v63;
    if (v63 != v62) {
      goto LABEL_89;
    }
    uint64_t v47 = 4LL;
    uint64_t result = v62;
    return (void *)(*(uint64_t (**)(void))(*result + 8 * v47))();
  }

  uint64_t result = v61;
  if (v61 == v60)
  {
    uint64_t v47 = 4LL;
    uint64_t result = v60;
    return (void *)(*(uint64_t (**)(void))(*result + 8 * v47))();
  }

LABEL_89:
  if (result)
  {
    uint64_t v47 = 5LL;
    return (void *)(*(uint64_t (**)(void))(*result + 8 * v47))();
  }

  return result;
}

void sub_187442F08( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, char *a28)
{
  unsigned int v29 = a28;
  if (a28 == &a25)
  {
    uint64_t v30 = 4LL;
    unsigned int v29 = &a25;
  }

  else
  {
    if (!a28) {
      goto LABEL_6;
    }
    uint64_t v30 = 5LL;
  }

  (*(void (**)(void))(*(void *)v29 + 8 * v30))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *nlp::BurstTrieCursorCreateCopy(void *result)
{
  if (result)
  {
    unsigned __int8 v1 = result;
    uint64_t result = calloc(0x28uLL, 1uLL);
    int v2 = *((_DWORD *)v1 + 7);
    if (v2)
    {
      if (v2 == 1)
      {
        *uint64_t result = *v1;
        result[1] = v1[1];
        *((_DWORD *)result + 4) = *((_DWORD *)v1 + 4);
        *((_DWORD *)result + 5) = *((_DWORD *)v1 + 5);
      }
    }

    else
    {
      *(_OWORD *)uint64_t result = *(_OWORD *)v1;
      result[2] = v1[2];
      *((_DWORD *)result + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = *((_DWORD *)v1 + 6);
    }

    *((_DWORD *)result + 7) = v2;
    result[4] = v1[4];
  }

  return result;
}

BOOL nlp::BurstTrieCursorIsEqual(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) != *(void *)(a2 + 32)) {
    return 0LL;
  }
  int v2 = *(_DWORD *)(a1 + 28);
  if (v2 != *(_DWORD *)(a2 + 28)) {
    return 0LL;
  }
  if (v2)
  {
    if (v2 == 1 && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8) && *(_DWORD *)(a1 + 12) == *(_DWORD *)(a2 + 12)) {
      return *(void *)a1 == *(void *)a2;
    }
    return 0LL;
  }

  if (*(void *)(a1 + 8) != *(void *)(a2 + 8)) {
    return 0LL;
  }
  return *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t nlp::BurstTrieCursorGetPayload(_DWORD *a1, _DWORD *a2)
{
  int v2 = a1[7];
  if (v2)
  {
    if (v2 != 1) {
      return 0LL;
    }
    int v3 = a1[4];
    if (!v3) {
      return 0LL;
    }
  }

  else
  {
    int v3 = a1[5];
    if (!v3) {
      return 0LL;
    }
  }

  if (a2) {
    *a2 = v3;
  }
  return 1LL;
}

CFBinaryHeapRef nlp::TrieCursorQueueCreate(nlp *this)
{
  callBacks.retaiuint64_t n = (const void *(__cdecl *)(CFAllocatorRef, const void *))nlp::TrieCursorRetain;
  callBacks.release = (void (__cdecl *)(CFAllocatorRef, const void *))nlp::TrieCursorRelease;
  callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))nlp::TrieCursorCompare;
  return CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks, 0LL);
}

const __CFAllocator *nlp::TrieCursorRetain(nlp *this, const __CFAllocator *a2, const void *a3)
{
  uint64_t result = a2;
  if (a2) {
    ++*((_DWORD *)a2 + 5);
  }
  return result;
}

void nlp::TrieCursorRelease(nlp *this, const __CFAllocator *a2, const void *a3)
{
  if (a2)
  {
    int v3 = *((_DWORD *)a2 + 5) - 1;
    *((_DWORD *)a2 + 5) = v3;
    if (!v3) {
      free(a2);
    }
  }

uint64_t nlp::TrieCursorCompare(nlp *this, float *a2, const void *a3, void *a4)
{
  float v4 = *((float *)this + 4);
  float v5 = a2[4];
  if (v4 == v5)
  {
    size_t v6 = *((unsigned int *)this + 6);
    int v7 = *((_DWORD *)a2 + 6);
    if ((_DWORD)v6 == v7) {
      int v8 = memcmp((char *)this + 28, a2 + 7, v6);
    }
    else {
      int v8 = v6 - v7;
    }
    uint64_t v10 = -1LL;
    if (v8 <= 0) {
      uint64_t v10 = 1LL;
    }
    if (v8) {
      return v10;
    }
    else {
      return 0LL;
    }
  }

  else if (v4 <= v5)
  {
    return 1LL;
  }

  else
  {
    return -1LL;
  }

void nlp::TrieCursorQueueRelease(CFTypeRef this, __CFBinaryHeap *a2)
{
  if (this) {
    CFRelease(this);
  }
}

CFBinaryHeapRef nlp::TrieCompletionQueueCreate(nlp *this)
{
  callBacks.retaiuint64_t n = (const void *(__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRetain;
  callBacks.release = (void (__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRelease;
  callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))nlp::trieCompletionCompareScore;
  return CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks, 0LL);
}

uint64_t nlp::trieCompletionCompareScore(nlp *this, float *a2, const void *a3, void *a4)
{
  if (*(float *)this != *a2)
  {
    else {
      return -1LL;
    }
  }

  size_t v4 = *((unsigned int *)this + 4);
  int v5 = *((_DWORD *)a2 + 4);
  if ((_DWORD)v4 != v5)
  {
    int v6 = v4 - v5;
LABEL_13:
    if (v6 > 0) {
      return -1LL;
    }
    else {
      return 1LL;
    }
  }

  int v6 = *((_DWORD *)this + 2) - *((_DWORD *)a2 + 2);
  if (v6) {
    goto LABEL_13;
  }
  int v7 = memcmp((char *)this + 20, a2 + 5, v4);
  uint64_t v8 = -1LL;
  if (v7 <= 0) {
    uint64_t v8 = 1LL;
  }
  if (v7) {
    return v8;
  }
  else {
    return 0LL;
  }
}

void nlp::BurstTrieRankedSearchWithSelection( unint64_t a1, void *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7)
{
  if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
  {
    callBacks.retaiuint64_t n = (const void *(__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRetain;
    callBacks.release = (void (__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRelease;
    callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))nlp::trieCompletionInternalCompareScore;
    uint64_t v14 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks, 0LL);
    if (v14)
    {
      uint64_t v15 = v14;
      BOOL v16 = *(_DWORD **)(a1 + 2080);
      if (v16)
      {
        if (*v16 != -900339842 && v16[7] != 2) {
          return;
        }
        nlp::rankSearchDiskLevel((nlp *)a1, (uint64_t)v16 + (v16[1] & 0xFFFFFFFC), a3, a4, 0, a6, v14, a5, a2);
      }

      else
      {
        nlp::rankSearchLevel((nlp *)a1, a1, a3, a4, 0, a6, v14, a5, a2);
      }

      while (CFBinaryHeapGetCount(v15))
      {
        Minimuuint64_t m = CFBinaryHeapGetMinimum(v15);
        CFBinaryHeapAddValue(a7, Minimum);
        CFBinaryHeapRemoveMinimumValue(v15);
      }

      CFRelease(v15);
    }
  }

uint64_t nlp::trieCompletionInternalCompareScore(nlp *this, float *a2, const void *a3, void *a4)
{
  if (*(float *)this != *a2)
  {
    else {
      return -1LL;
    }
  }

  size_t v4 = *((unsigned int *)this + 4);
  int v5 = *((_DWORD *)a2 + 4);
  if ((_DWORD)v4 != v5)
  {
    int v6 = v4 - v5;
LABEL_13:
    if (v6 < 0) {
      return -1LL;
    }
    else {
      return 1LL;
    }
  }

  int v6 = *((_DWORD *)this + 2) - *((_DWORD *)a2 + 2);
  if (v6) {
    goto LABEL_13;
  }
  int v7 = memcmp((char *)this + 20, a2 + 5, v4);
  uint64_t v8 = -1LL;
  if (v7 >= 0) {
    uint64_t v8 = 1LL;
  }
  if (v7) {
    return v8;
  }
  else {
    return 0LL;
  }
}

uint64_t nlp::rankSearchDiskLevel( nlp *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7, uint64_t a8, void *a9)
{
  unsigned int v10 = a4;
  if (a5 >= a4)
  {
LABEL_5:
    unint64_t v18 = nlp::sharedBuffer(a1);
    if ((int)(v10 + 1) <= 1023)
    {
      uint64_t v19 = v18;
      memcpy(v18, a3, v10);
      uint64_t v20 = 0LL;
      v19[v10 + 1] = 0;
      do
      {
        uint64_t v21 = *(unsigned int *)(a2 + 4 * v20);
        v19[v10] = v20;
        nlp::rankSearchGetCursor((uint64_t)a1, v21, v19, v10 + 1, a6);
        ++v20;
      }

      while (v20 != 256);
    }

    int v22 = *(_DWORD *)(a2 + 1024);
    if (!v22) {
      goto LABEL_11;
    }
    int v23 = *(_DWORD *)(a2 + 1032);
    uint64_t v24 = malloc(v10 + 21LL);
    v24[4] = v10;
    *((_BYTE *)v24 + v10 + 20) = 0;
    memcpy(v24 + 5, a3, v10);
    *uint64_t v24 = v23;
    v24[2] = v22;
    v24[3] = 1;
    BOOL updated = nlp::updateCompletions((float *)v24, a9, a6, a7, a8);
    BOOL v26 = updated;
    int v27 = v24[3] - 1;
    v24[3] = v27;
    if (v27)
    {
      if (updated)
      {
LABEL_11:
        nlp::rankSearchCursors(a1, a6, a7, a8, a9);
        return 1LL;
      }
    }

    else
    {
      free(v24);
      if (v26) {
        goto LABEL_11;
      }
    }

    return 0LL;
  }

  uint64_t v14 = a5;
  while (1)
  {
    int v15 = *(_DWORD *)(a2 + 4LL * a3[v14]);
    uint64_t v16 = v15 & 3;
    if (v16 != 1) {
      break;
    }
    a2 = (v15 & 0xFFFFFFFC) + *((void *)a1 + 260);
    if ((_DWORD)a4 == (_DWORD)++v14) {
      goto LABEL_5;
    }
  }

  if (v16 != 2)
  {
    if (v16 == 3) {
      return nlp::rankSearchCompactDiskLevel( (uint64_t)a1,  (int8x8_t *)((v15 & 0xFFFFFFFC) + *((void *)a1 + 260)),  a3,  a4,  (int)v14 + 1,  a6,  a7,  a8,  a9);
    }
    return 1LL;
  }

  return nlp::rankSearchDiskPage( a1,  (unsigned int *)((v15 & 0xFFFFFFFC) + *((void *)a1 + 260)),  (char *)a3,  a4,  v14 + 1,  a6,  a7,  a8,  a9);
}

uint64_t nlp::rankSearchLevel( nlp *a1, unint64_t a2, unsigned __int8 *a3, unsigned int a4, unsigned int a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7, unsigned int a8, void *a9)
{
  if (a5 >= a4)
  {
LABEL_5:
    uint64_t v16 = nlp::sharedBuffer(a1);
    memcpy(v16, a3, a4);
    uint64_t v17 = 0LL;
    *((_BYTE *)v16 + (int)(a4 + 1)) = 0;
    do
    {
      uint64_t v18 = *(void *)(a2 + 12 + 8 * v17);
      *((_BYTE *)v16 + a4) = v17;
      nlp::rankSearchGetCursor((uint64_t)a1, v18, v16, a4 + 1, a6);
      ++v17;
    }

    while (v17 != 256);
    int v19 = *(_DWORD *)(a2 + 8);
    if (!v19) {
      return nlp::rankSearchCursors((int)a1, a6);
    }
    int v20 = *(_DWORD *)(a2 + 4);
    uint64_t v21 = malloc(a4 + 21LL);
    v21[4] = a4;
    *((_BYTE *)v21 + a4 + 20) = 0;
    memcpy(v21 + 5, a3, a4);
    *uint64_t v21 = v20;
    v21[2] = v19;
    void v21[3] = 1;
    BOOL updated = nlp::updateCompletions((float *)v21, a9, a6, a7, a8);
    BOOL v23 = updated;
    int v24 = v21[3] - 1;
    void v21[3] = v24;
    if (v24)
    {
      if (updated) {
        return nlp::rankSearchCursors((int)a1, a6);
      }
    }

    else
    {
      free(v21);
      if (v23) {
        return nlp::rankSearchCursors((int)a1, a6);
      }
    }

    return 0LL;
  }

  uint64_t v14 = a5;
  while (1)
  {
    uint64_t v15 = *(void *)(a2 + 8LL * a3[v14] + 12);
    if ((v15 & 3) != 1) {
      break;
    }
    a2 = v15 & 0xFFFFFFFFFFFFFFFCLL;
    if (a4 == (_DWORD)++v14) {
      goto LABEL_5;
    }
  }

  return (v15 & 3) != 2
      || nlp::rankSearchList((nlp *)(v15 & 0xFFFFFFFFFFFFFFFCLL), (char *)a3, a4, v14 + 1, a6, a7, a8, a9);
}

void nlp::BurstTrieRankedSearch( unint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, __CFBinaryHeap *a5, __CFBinaryHeap *a6)
{
}

void nlp::BurstTrieContinueRankedSearch(nlp *a1, uint64_t a2, __CFBinaryHeap *a3, __CFBinaryHeap *a4)
{
  if ((*((_BYTE *)a1 + 2064) & 1) != 0)
  {
    callBacks.retaiuint64_t n = (const void *(__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRetain;
    callBacks.release = (void (__cdecl *)(CFAllocatorRef, const void *))nlp::trieCompletionRelease;
    callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))nlp::trieCompletionInternalCompareScore;
    CFBinaryHeapRef v8 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks, 0LL);
    if (v8)
    {
      uint64_t v9 = v8;
      while (CFBinaryHeapGetCount(a3))
      {
        nlp::rankSearchCursors(a1, a3, v9, a2, 0LL);
        while (CFBinaryHeapGetCount(v9))
        {
          Minimuuint64_t m = CFBinaryHeapGetMinimum(v9);
          CFBinaryHeapAddValue(a4, Minimum);
          CFBinaryHeapRemoveMinimumValue(v9);
        }
      }

      CFRelease(v9);
    }
  }

BOOL nlp::rankSearchCursors(nlp *a1, CFBinaryHeapRef heap, __CFBinaryHeap *a3, uint64_t a4, void *a5)
{
  while (1)
  {
    CFIndex Count = CFBinaryHeapGetCount(heap);
    if (!Count) {
      return Count == 0;
    }
    Minimuuint64_t m = (unsigned int *)CFBinaryHeapGetMinimum(heap);
    uint64_t v11 = Minimum;
    if (Minimum) {
      ++Minimum[5];
    }
    CFBinaryHeapRemoveMinimumValue(heap);
    unint64_t v12 = *((void *)v11 + 1);
    uint64_t v13 = v12 & 3;
    if ((v12 & 3) == 0)
    {
      unint64_t v18 = v12 >> 2;
      size_t v19 = v11[6];
      unsigned int v20 = v11[4];
      uint64_t v21 = malloc(v19 + 21);
      v21[4] = v19;
      *((_BYTE *)v21 + v19 + 20) = 0;
      memcpy(v21 + 5, v11 + 7, v19);
      *uint64_t v21 = v20;
      v21[2] = v18;
      void v21[3] = 1;
      BOOL updated = nlp::updateCompletions((float *)v21, a5, heap, a3, a4);
      int v23 = v21[3] - 1;
      void v21[3] = v23;
      if (!v23) {
        free(v21);
      }
      goto LABEL_18;
    }

    uint64_t v14 = *((void *)a1 + 260);
    if (v14)
    {
      uint64_t v15 = (int8x8_t *)((v12 & 0xFFFFFFFFFFFFFFFCLL) + v14);
      uint64_t v16 = (unsigned __int8 *)(v11 + 7);
      if (v13 == 3)
      {
        char v17 = nlp::rankSearchCompactDiskLevel((uint64_t)a1, v15, v16, v11[6], v11[6], heap, a3, a4, a5);
      }

      else if (v13 == 1)
      {
        char v17 = nlp::rankSearchDiskLevel(a1, v15, v16, v11[6], v11[6], heap);
      }

      else
      {
        char v17 = nlp::rankSearchDiskPage(a1, (unsigned int *)v15, (char *)v16, v11[6], v11[6], heap, a3, a4, a5);
      }
    }

    else if (v13 == 2)
    {
      char v17 = nlp::rankSearchList((nlp *)(v12 & 0xFFFFFFFFFFFFFFFCLL), (char *)v11 + 28, v11[6], v11[6], heap, a3, a4, a5);
    }

    else
    {
      if (v13 != 1)
      {
        BOOL updated = 1;
        goto LABEL_18;
      }

      char v17 = nlp::rankSearchLevel( a1,  v12 & 0xFFFFFFFFFFFFFFFCLL,  (unsigned __int8 *)v11 + 28,  v11[6],  v11[6],  heap,  a3,  a4,  a5);
    }

    BOOL updated = v17;
LABEL_18:
    int v24 = v11[5] - 1;
    v11[5] = v24;
    if (v24)
    {
      if (!updated) {
        return Count == 0;
      }
    }

    else
    {
      free(v11);
      if (!updated) {
        return Count == 0;
      }
    }
  }

uint64_t nlp::BurstTrieWriteToFileDescriptor(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 0LL;
  if ((a2 & 0x80000000) == 0 && !*(void *)(a1 + 2080))
  {
    uint64_t v7 = sysconf(29);
    off_t v8 = (v7 + lseek(a2, 0LL, 2) - 1) & -v7;
    *(void *)&__buf[1] = 12648430LL;
    __buf[3] = 0;
    uint64_t v12 = *(void *)(a1 + 2060);
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v14 = 0LL;
    int v17 = 0;
    int v13 = *(_DWORD *)(a1 + 2088);
    HIDWORD(v14) = 2;
    lseek(a2, v8, 0);
    write(a2, &__buf[1], 0x34uLL);
    if ((*(_BYTE *)(a1 + 2064) & 1) != 0) {
      nlp::serializeListsRanked(a1, a1, v8, a2);
    }
    else {
      nlp::serializeLists(a1, a1, v8, a2);
    }
    __buf[0] = lseek(a2, 0LL, 1) - v8;
    pwrite(a2, __buf, 4uLL, v8 + 4);
    if ((*(_BYTE *)(a1 + 2064) & 1) != 0) {
      nlp::serializeLevelsRanked((_DWORD *)a1, v8, a2, 0, 1, __buf);
    }
    else {
      nlp::serializeLevels((_DWORD *)a1, v8, a2, 0, 1, __buf);
    }
    pwrite(a2, __buf, 4uLL, v8 + 8);
    lseek(a2, __buf[0], 0);
    *(_DWORD *)(a1 + 2060) = 0;
    if ((*(_DWORD *)(a1 + 2064) & 1) != 0) {
      size_t v9 = 2060LL;
    }
    else {
      size_t v9 = 2052LL;
    }
    bzero((void *)a1, v9);
    unsigned int v10 = mmap(0LL, __buf[0], 1, 1, a2, v8);
    if (v10 == (void *)-1LL)
    {
      return 0LL;
    }

    else
    {
      *(void *)(a1 + 2080) = v10;
      if (a3) {
        *a3 = v8;
      }
      return 1LL;
    }
  }

  return result;
}

uint64_t nlp::BurstTrieWriteToFile(uint64_t a1, CFStringRef theString)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  usedBufLeuint64_t n = 0LL;
  v12.length = CFStringGetLength(theString);
  v12.locatiouint64_t n = 0LL;
  CFStringGetBytes(theString, v12, 0x8000100u, 0x2Du, 0, buffer, 1024LL, &usedBufLen);
  buffer[usedBufLen] = 0;
  uint64_t v4 = open((const char *)buffer, 1538, 384LL);
  if ((v4 & 0x80000000) != 0) {
    return 0LL;
  }
  int v5 = v4;
  int v8 = -1;
  uint64_t v6 = nlp::BurstTrieWriteToFileDescriptor(a1, v4, &v8);
  close(v5);
  return v6;
}

void nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 256; ++i)
  {
    uint64_t v3 = a1 + 8 * i;
    uint64_t v6 = *(void *)(v3 + 12);
    int v5 = (void *)(v3 + 12);
    uint64_t v4 = v6;
    uint64_t v7 = v6 & 3;
    if (v7 == 2)
    {
      int v8 = (void *)(v4 & 0xFFFFFFFFFFFFFFFCLL);
      do
      {
        size_t v9 = (void *)*v8;
        free(v8);
        int v8 = v9;
      }

      while (v9);
    }

    else if (v7 == 1)
    {
      nlp::finishLevel<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(v4 & 0xFFFFFFFFFFFFFFFCLL);
      free((void *)(*v5 & 0xFFFFFFFFFFFFFFFCLL));
    }
  }

void nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 256; ++i)
  {
    uint64_t v3 = a1 + 8 * i;
    uint64_t v6 = *(void *)(v3 + 4);
    int v5 = (void *)(v3 + 4);
    uint64_t v4 = v6;
    uint64_t v7 = v6 & 3;
    if (v7 == 2)
    {
      int v8 = (void *)(v4 & 0xFFFFFFFFFFFFFFFCLL);
      do
      {
        size_t v9 = (void *)*v8;
        free(v8);
        int v8 = v9;
      }

      while (v9);
    }

    else if (v7 == 1)
    {
      nlp::finishLevel<nlp::_TrieLevel *,nlp::_ListNode *>(v4 & 0xFFFFFFFFFFFFFFFCLL);
      free((void *)(*v5 & 0xFFFFFFFFFFFFFFFCLL));
    }
  }

uint64_t nlp::addListNode(uint64_t a1, void *a2, uint64_t a3, int a4, unsigned int a5, int a6, int *a7)
{
  CFRange v12 = a2;
  uint64_t v13 = a1;
  uint64_t v14 = (uint64_t *)*a2;
  uint64_t v15 = calloc(8uLL, (*(_DWORD *)(a1 + 2088) + 1));
  uint64_t v16 = (const void *)(a3 + a5);
  if (v14)
  {
    unint64_t v35 = v12;
    uint64_t v36 = v13;
    uint64_t v37 = a7;
    uint64_t v17 = 0LL;
    char v18 = 1;
LABEL_3:
    uint64_t v19 = 0LL;
    uint64_t v20 = v17;
    uint64_t v21 = &v15[v17];
    do
    {
      size_t v22 = *((unsigned __int16 *)v14 + 6);
      if ((_DWORD)v22 + a5 == a4 && !memcmp(v16, (char *)v14 + 14, v22))
      {
        char v18 = 0;
        *((_DWORD *)v14 + 2) = a6;
        uint64_t v17 = v20 + v19 + 1;
        v15[v20 + v19] = v14;
        uint64_t v14 = (uint64_t *)*v14;
        if (v14) {
          goto LABEL_3;
        }
        uint64_t v23 = (v20 + v19 + 1);
        int v24 = 1;
        goto LABEL_15;
      }

      v21[v19] = v14;
      uint64_t v14 = (uint64_t *)*v14;
      ++v19;
    }

    while (v14);
    uint64_t v25 = v20 + v19;
    if ((v18 & 1) != 0)
    {
      uint64_t v13 = v36;
      a7 = v37;
      CFRange v12 = v35;
      goto LABEL_13;
    }

    int v24 = 1;
    uint64_t v23 = v25;
LABEL_15:
    uint64_t v13 = v36;
    a7 = v37;
    CFRange v12 = v35;
  }

  else
  {
    LODWORD(v25) = 0;
LABEL_13:
    size_t v26 = a4 - a5;
    int v27 = (char *)calloc(1uLL, v26 + 15);
    memcpy(v27 + 14, v16, v26);
    v27[v26 + 14] = 0;
    *((_WORD *)v27 + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v26;
    *((_DWORD *)v27 + 2) = a6;
    uint64_t v23 = (v25 + 1);
    int v24 = 2;
    *(void *)int v27 = 0LL;
    v15[v25] = v27;
  }

  qsort(v15, (int)v23, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeStringCompare);
  int v28 = (void *)*v15;
  unsigned int v29 = (void *)*v15;
  if ((int)v23 >= 2)
  {
    uint64_t v30 = v15 + 1;
    uint64_t v31 = v23 - 1LL;
    uint64_t v32 = (void *)*v15;
    do
    {
      unint64_t v33 = (void *)*v30++;
      unsigned int v29 = v33;
      *uint64_t v32 = v33;
      uint64_t v32 = v33;
      --v31;
    }

    while (v31);
  }

  *unsigned int v29 = 0LL;
  *CFRange v12 = v28;
  free(v15);
  *a7 = v24;
  return v23;
}

_DWORD *nlp::burstLevel(uint64_t a1, _DWORD *a2, int *a3)
{
  uint64_t v6 = calloc(1uLL, 0x804uLL);
  if (a2)
  {
    do
    {
      int v7 = *((unsigned __int16 *)a2 + 6);
      int v8 = a2[2];
      if (*((_WORD *)a2 + 6))
      {
        uint64_t v9 = *(void *)&v6[2 * *((unsigned __int8 *)a2 + 14) + 1];
        if (v9)
        {
          unint64_t v19 = v9 & 0xFFFFFFFFFFFFFFFCLL;
          unsigned int v10 = nlp::addListNode(a1, &v19, (uint64_t)a2 + 14, v7, 1u, v8, a3);
          uint64_t v11 = v19;
          if (v10 >= *(_DWORD *)(a1 + 2088))
          {
            uint64_t v11 = nlp::burstLevel(a1, v19, a3);
            uint64_t v12 = 1LL;
          }

          else
          {
            uint64_t v12 = 2LL;
          }

          uint64_t v15 = v12 | v11;
          uint64_t v16 = *((unsigned __int8 *)a2 + 14);
        }

        else
        {
          size_t v13 = (v7 - 1);
          unint64_t v14 = (unint64_t)calloc(1uLL, v13 + 15);
          memcpy((void *)(v14 + 14), (char *)a2 + 15, v13);
          *(_BYTE *)(v14 + 14 + v1std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = 0;
          *(_WORD *)(v14 + 12) = v13;
          *(_DWORD *)(v14 + 8) = v8;
          *(void *)unint64_t v14 = 0LL;
          uint64_t v15 = v14 | 2;
          uint64_t v16 = *((unsigned __int8 *)a2 + 14);
        }

        *(void *)&v6[2 * v16 + 1] = v15;
      }

      else
      {
        *uint64_t v6 = v8;
      }

      uint64_t v17 = *(_DWORD **)a2;
      free(a2);
      a2 = v17;
    }

    while (v17);
  }

  return v6;
}

uint64_t nlp::nodeStringCompare(nlp *this, void *a2, const void *a3)
{
  uint64_t v3 = *(void *)this;
  uint64_t v4 = *a2;
  int v5 = (const void *)(*(void *)this + 14LL);
  uint64_t v6 = (const void *)(*a2 + 14LL);
  unsigned int v7 = *(unsigned __int16 *)(v3 + 12);
  unsigned int v8 = *(unsigned __int16 *)(v4 + 12);
  unsigned int v9 = v7 - v8;
  else {
    size_t v10 = v7;
  }
  LODWORD(result) = memcmp(v5, v6, v10);
  if ((_DWORD)result) {
    return result;
  }
  else {
    return v9;
  }
}

uint64_t nlp::addListNodeRanked( uint64_t a1, uint64_t **a2, uint64_t a3, int a4, unsigned int a5, int a6, float *a7, int *a8, float a9, uint64_t a10, uint64_t a11)
{
  char v18 = *a2;
  unint64_t v19 = (uint64_t *)calloc(8uLL, (*(_DWORD *)(a1 + 2088) + 1));
  uint64_t v20 = (const void *)(a3 + a5);
  if (v18)
  {
    size_t v39 = a8;
    uint64_t v21 = 0LL;
    int v22 = 0;
    float v23 = 0.0;
    do
    {
      uint64_t v24 = v21;
      size_t v25 = *((unsigned __int16 *)v18 + 10);
      if ((_DWORD)v25 + a5 == a4 && !memcmp(v20, (char *)v18 + 22, v25))
      {
        *((_DWORD *)v18 + 4) = a6;
        float v26 = *((float *)v18 + 3);
        if (*(void *)(a11 + 24)) {
          std::function<float ()(void *,float,float)>::operator()(a11, a10, v26, a9);
        }
        else {
          float v27 = v26 + a9;
        }
        *((float *)v18 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = v27;
        int v22 = 1;
      }

      ++v21;
      v19[v24] = (uint64_t)v18;
      char v18 = (uint64_t *)*v18;
    }

    while (v18);
    if (v22)
    {
      int v28 = 1;
      uint64_t v29 = v24 + 1;
      a8 = v39;
      goto LABEL_19;
    }

    a8 = v39;
  }

  else
  {
    LODWORD(v21) = 0;
    float v23 = 0.0;
  }

  if (v23 < a9) {
    float v23 = a9;
  }
  size_t v30 = a4 - a5;
  uint64_t v31 = (char *)calloc(1uLL, v30 + 23);
  memcpy(v31 + 22, v20, v30);
  v31[v30 + 22] = 0;
  *((_WORD *)v31 + 10) = v30;
  *((_DWORD *)v31 + 4) = a6;
  *((float *)v31 + 2) = v23;
  *((float *)v31 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = a9;
  uint64_t v29 = (v21 + 1);
  int v28 = 2;
  *(void *)uint64_t v31 = 0LL;
  v19[v21] = (uint64_t)v31;
LABEL_19:
  qsort(v19, (int)v29, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeScoreCompare);
  uint64_t v32 = (void *)*v19;
  *a7 = v23;
  unint64_t v33 = v32;
  if ((int)v29 >= 2)
  {
    uint64_t v34 = (v29 - 1);
    unint64_t v35 = v19 + 1;
    uint64_t v36 = v32;
    do
    {
      uint64_t v37 = *v35++;
      unint64_t v33 = (void *)v37;
      *uint64_t v36 = v37;
      *(float *)(v37 + 8) = *a7;
      uint64_t v36 = (void *)v37;
      --v34;
    }

    while (v34);
  }

  *unint64_t v33 = 0LL;
  *a2 = v32;
  free(v19);
  *a8 = v28;
  return v29;
}

float *nlp::burstLevelRanked(uint64_t a1, unsigned __int16 *a2, float *a3, int *a4)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  unsigned int v8 = (float *)calloc(1uLL, 0x80CuLL);
  *a3 = 0.0;
  if (!a2)
  {
    float v26 = 0.0;
    goto LABEL_26;
  }

  do
  {
    float v28 = 0.0;
    int v9 = a2[10];
    int v10 = *((_DWORD *)a2 + 4);
    float v11 = *((float *)a2 + 3);
    uint64_t v31 = 0LL;
    if (!v9)
    {
      v8[1] = v11;
      *((_DWORD *)v8 + 2) = v10;
      float v28 = v11;
      goto LABEL_16;
    }

    uint64_t v12 = *(void *)&v8[2 * *((unsigned __int8 *)a2 + 22) + 3];
    if (v12)
    {
      uint64_t v29 = (uint64_t *)(v12 & 0xFFFFFFFFFFFFFFFCLL);
      unint64_t v33 = 0LL;
      unsigned int v13 = nlp::addListNodeRanked(a1, &v29, (uint64_t)(a2 + 11), v9, 1u, v10, &v28, a4, v11, 0LL, (uint64_t)v32);
      unint64_t v14 = v33;
      if (v33 == v32)
      {
        unint64_t v14 = v32;
        uint64_t v15 = 4LL;
      }

      else
      {
        if (!v33)
        {
LABEL_11:
          uint64_t v20 = (uint64_t)v29;
          if (v13 >= *(_DWORD *)(a1 + 2088))
          {
            uint64_t v20 = nlp::burstLevelRanked(a1, v29, &v28, a4);
            uint64_t v21 = 1LL;
          }

          else
          {
            uint64_t v21 = 2LL;
          }

          uint64_t v18 = v21 | v20;
          uint64_t v19 = *((unsigned __int8 *)a2 + 22);
          goto LABEL_15;
        }

        uint64_t v15 = 5LL;
      }

      (*(void (**)(void))(*v14 + 8 * v15))();
      goto LABEL_11;
    }

    size_t v16 = (v9 - 1);
    unint64_t v17 = (unint64_t)calloc(1uLL, v16 + 23);
    memcpy((void *)(v17 + 22), (char *)a2 + 23, v16);
    *(_BYTE *)(v17 + 22 + v1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
    *(_WORD *)(v17 + 20) = v16;
    *(_DWORD *)(v17 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v10;
    *(float *)(v17 + 8) = v11;
    *(float *)(v17 + 12) = v11;
    *(void *)unint64_t v17 = 0LL;
    float v28 = v11;
    uint64_t v18 = v17 | 2;
    uint64_t v19 = *((unsigned __int8 *)a2 + 22);
LABEL_15:
    *(void *)&v8[2 * v19 + 3] = v18;
LABEL_16:
    int v22 = v31;
    if (v31 == v30)
    {
      int v22 = v30;
      uint64_t v23 = 4LL;
    }

    else
    {
      if (!v31) {
        goto LABEL_21;
      }
      uint64_t v23 = 5LL;
    }

    (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_21:
    float v24 = v28;
    if (v28 <= *a3) {
      float v24 = *a3;
    }
    *a3 = v24;
    size_t v25 = *(unsigned __int16 **)a2;
    free(a2);
    a2 = v25;
  }

  while (v25);
  float v26 = *a3;
LABEL_26:
  *unsigned int v8 = v26;
  return v8;
}

void sub_18744488C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17, char a18, uint64_t a19, uint64_t a20, char *a21)
{
  int v22 = a21;
  if (a21 == &a18)
  {
    uint64_t v23 = 4LL;
    int v22 = &a18;
  }

  else
  {
    if (!a21) {
      goto LABEL_6;
    }
    uint64_t v23 = 5LL;
  }

  (*(void (**)(void))(*(void *)v22 + 8 * v23))();
LABEL_6:
  float v24 = a17;
  if (a17 == &a14)
  {
    uint64_t v25 = 4LL;
    float v24 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_11;
    }
    uint64_t v25 = 5LL;
  }

  (*(void (**)(void))(*(void *)v24 + 8 * v25))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

uint64_t std::function<float ()(void *,float,float)>::operator()(uint64_t a1, uint64_t a2, float a3, float a4)
{
  uint64_t v8 = a2;
  float v6 = a4;
  float v7 = a3;
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, float *, float *))(*(void *)v4 + 48LL))(v4, &v8, &v7, &v6);
}

uint64_t nlp::nodeScoreCompare(nlp *this, const void *a2, const void *a3)
{
  float v3 = *(float *)(*(void *)this + 12LL);
  float v4 = *(float *)(*(void *)a2 + 12LL);
  if (v3 == v4)
  {
    unsigned int v5 = *(_DWORD *)(*(void *)this + 16LL);
    unsigned int v6 = *(_DWORD *)(*(void *)a2 + 16LL);
    BOOL v7 = v5 == v6;
    if (v5 > v6) {
      unsigned int v8 = -1;
    }
    else {
      unsigned int v8 = 1;
    }
    if (v7) {
      return 0LL;
    }
    else {
      return v8;
    }
  }

  else if ((float)(v3 - v4) <= 0.0)
  {
    return 1LL;
  }

  else
  {
    return 0xFFFFFFFFLL;
  }

void std::__throw_bad_function_call[abi:ne180100]()
{
  exceptiouint64_t n = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
}

uint64_t nlp::searchDiskLevelRanked( uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  unsigned __int8 v38 = 0;
  if (a5 >= a4)
  {
    int v20 = *(_DWORD *)(a2 + 1024);
    if (v20)
    {
      int v21 = *(_DWORD *)(a2 + 1032);
      int v22 = malloc(a4 + 21LL);
      v22[4] = a4;
      *((_BYTE *)v22 + a4 + 20) = 0;
      memcpy(v22 + 5, a3, a4);
      v22[2] = v20;
      *int v22 = v21;
      v22[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a8,  a7,  (uint64_t)v22,  1,  (uint64_t)&v38);
      if (v22[3]-- == 1) {
        free(v22);
      }
      if (v38) {
        return 1LL;
      }
    }

    if ((a6 & 1) != 0) {
      return v38 != 0;
    }
    uint64_t v25 = 0LL;
    uint64_t v26 = (a4 + 1);
    while (1)
    {
      int v27 = *(_DWORD *)(a2 + 4 * v25);
      a3[a5] = v25;
      uint64_t v28 = v27 & 3;
      switch(v28)
      {
        case 3LL:
          uint64_t v32 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v41,  a8);
          int v30 = nlp::searchCompactDiskLevelRanked( a1,  (int8x8_t *)((v27 & 0xFFFFFFFC) + v32),  a3,  v26,  a5 + 1,  0LL,  a7,  (uint64_t)v41);
          unsigned __int8 v38 = v30;
          uint64_t v31 = v42;
          if (v42 == v41)
          {
            uint64_t v31 = v41;
LABEL_26:
            uint64_t v34 = 4LL;
            goto LABEL_27;
          }

          break;
        case 2LL:
          uint64_t v33 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v39,  a8);
          int v30 = nlp::searchDiskPageRanked( (unsigned int *)((v27 & 0xFFFFFFFC) + v33),  a3,  v26,  a5 + 1,  0,  a7,  (uint64_t)v39);
          unsigned __int8 v38 = v30;
          uint64_t v31 = v40;
          if (v40 == v39)
          {
            uint64_t v31 = v39;
            goto LABEL_26;
          }

          break;
        case 1LL:
          uint64_t v29 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v43,  a8);
          int v30 = nlp::searchDiskLevelRanked(a1, (v27 & 0xFFFFFFFC) + v29, a3, v26, a5 + 1, 0LL, a7, v43);
          unsigned __int8 v38 = v30;
          uint64_t v31 = v44;
          if (v44 == v43)
          {
            uint64_t v31 = v43;
            goto LABEL_26;
          }

          break;
        default:
          goto LABEL_28;
      }

      if (v31)
      {
        uint64_t v34 = 5LL;
LABEL_27:
        (*(void (**)(_BYTE *))(*(void *)v31 + 8 * v34))(v31);
LABEL_28:
        int v30 = v38;
      }

      if (v30) {
        return 1LL;
      }
      if (++v25 == 256) {
        return v38 != 0;
      }
    }
  }

  int v15 = *(_DWORD *)(a2 + 4LL * a3[a5]);
  uint64_t v16 = v15 & 3;
  switch(v16)
  {
    case 3LL:
      uint64_t v35 = *(void *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v47,  a8);
      unsigned __int8 v38 = nlp::searchCompactDiskLevelRanked( a1,  (int8x8_t *)((v15 & 0xFFFFFFFC) + v35),  a3,  a4,  a5 + 1,  a6,  a7,  (uint64_t)v47);
      uint64_t v18 = v48;
      if (v48 == v47)
      {
        uint64_t v19 = 4LL;
        uint64_t v18 = v47;
        goto LABEL_38;
      }

      break;
    case 2LL:
      uint64_t v36 = *(void *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v45,  a8);
      unsigned __int8 v38 = nlp::searchDiskPageRanked((unsigned int *)((v15 & 0xFFFFFFFC) + v36), a3, a4, a5 + 1, a6, a7, (uint64_t)v45);
      uint64_t v18 = v46;
      if (v46 == v45)
      {
        uint64_t v19 = 4LL;
        uint64_t v18 = v45;
        goto LABEL_38;
      }

      break;
    case 1LL:
      uint64_t v17 = *(void *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v49,  a8);
      unsigned __int8 v38 = nlp::searchDiskLevelRanked(a1, (v15 & 0xFFFFFFFC) + v17, a3, a4, a5 + 1, a6, a7, v49);
      uint64_t v18 = v50;
      if (v50 == v49)
      {
        uint64_t v19 = 4LL;
        uint64_t v18 = v49;
LABEL_38:
        (*(void (**)(void))(*(void *)v18 + 8 * v19))();
        return v38 != 0;
      }

      break;
    default:
      return v38 != 0;
  }

  if (v18)
  {
    uint64_t v19 = 5LL;
    goto LABEL_38;
  }

  return v38 != 0;
}

void sub_187444DB0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
  uint64_t v31 = *(void **)(v28 + 56);
  if (v31 == v27)
  {
    uint64_t v32 = 4LL;
    uint64_t v31 = (void *)(v29 - 144);
  }

  else
  {
    if (!v31) {
      goto LABEL_6;
    }
    uint64_t v32 = 5LL;
  }

  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::containsKey(uint64_t result, _DWORD *a2, int a3, _BYTE *a4)
{
  if (result)
  {
    if (*(_DWORD *)result == 1)
    {
LABEL_5:
      *(_DWORD *)(result + 4) = a2[2];
      *(_DWORD *)(result + 8) = *a2;
LABEL_8:
      *a4 = 1;
      return result;
    }

    if (!*(_DWORD *)result)
    {
      if (!a3) {
        return result;
      }
      goto LABEL_5;
    }

    char v5 = 0;
    if (*(void *)(result + 48))
    {
      uint64_t result = std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()( result + 24,  *(void *)(result + 16),  (uint64_t)a2,  (uint64_t)&v5);
      if (v5) {
        goto LABEL_8;
      }
    }
  }

  return result;
}

uint64_t nlp::searchDiskLevel( uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  unsigned __int8 v37 = 0;
  if (a5 >= a4)
  {
    int v20 = *(_DWORD *)(a2 + 1024);
    if (v20)
    {
      int v21 = malloc(a4 + 21LL);
      v21[4] = a4;
      *((_BYTE *)v21 + a4 + 20) = 0;
      memcpy(v21 + 5, a3, a4);
      v21[2] = v20;
      *int v21 = 0;
      void v21[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a8,  a7,  (uint64_t)v21,  1,  (uint64_t)&v37);
      if (v21[3]-- == 1) {
        free(v21);
      }
      if (v37) {
        return 1LL;
      }
    }

    if ((a6 & 1) != 0) {
      return v37 != 0;
    }
    uint64_t v24 = 0LL;
    uint64_t v25 = (a4 + 1);
    while (1)
    {
      int v26 = *(_DWORD *)(a2 + 4 * v24);
      a3[a5] = v24;
      uint64_t v27 = v26 & 3;
      switch(v27)
      {
        case 3LL:
          uint64_t v31 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v40,  a8);
          int v29 = nlp::searchCompactDiskLevel( a1,  (int8x8_t *)((v26 & 0xFFFFFFFC) + v31),  a3,  v25,  a5 + 1,  0LL,  a7,  (uint64_t)v40);
          unsigned __int8 v37 = v29;
          int v30 = v41;
          if (v41 == v40)
          {
            int v30 = v40;
LABEL_26:
            uint64_t v33 = 4LL;
            goto LABEL_27;
          }

          break;
        case 2LL:
          uint64_t v32 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v38,  a8);
          int v29 = nlp::searchDiskPage( a1,  (unsigned int *)((v26 & 0xFFFFFFFC) + v32),  (char *)a3,  v25,  a5 + 1,  0,  a7,  (uint64_t)v38);
          unsigned __int8 v37 = v29;
          int v30 = v39;
          if (v39 == v38)
          {
            int v30 = v38;
            goto LABEL_26;
          }

          break;
        case 1LL:
          uint64_t v28 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v42,  a8);
          int v29 = nlp::searchDiskLevel(a1, (v26 & 0xFFFFFFFC) + v28, a3, v25, a5 + 1, 0LL, a7, v42);
          unsigned __int8 v37 = v29;
          int v30 = v43;
          if (v43 == v42)
          {
            int v30 = v42;
            goto LABEL_26;
          }

          break;
        default:
          goto LABEL_28;
      }

      if (v30)
      {
        uint64_t v33 = 5LL;
LABEL_27:
        (*(void (**)(void))(*(void *)v30 + 8 * v33))();
LABEL_28:
        int v29 = v37;
      }

      if (v29) {
        return 1LL;
      }
      if (++v24 == 256) {
        return v37 != 0;
      }
    }
  }

  int v15 = *(_DWORD *)(a2 + 4LL * a3[a5]);
  uint64_t v16 = v15 & 3;
  switch(v16)
  {
    case 3LL:
      uint64_t v34 = *(void *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v46,  a8);
      unsigned __int8 v37 = nlp::searchCompactDiskLevel( a1,  (int8x8_t *)((v15 & 0xFFFFFFFC) + v34),  a3,  a4,  a5 + 1,  a6,  a7,  (uint64_t)v46);
      uint64_t v18 = v47;
      if (v47 == v46)
      {
        uint64_t v19 = 4LL;
        uint64_t v18 = v46;
        goto LABEL_38;
      }

      break;
    case 2LL:
      uint64_t v35 = *(void *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v44,  a8);
      unsigned __int8 v37 = nlp::searchDiskPage( a1,  (unsigned int *)((v15 & 0xFFFFFFFC) + v35),  (char *)a3,  a4,  a5 + 1,  a6,  a7,  (uint64_t)v44);
      uint64_t v18 = v45;
      if (v45 == v44)
      {
        uint64_t v19 = 4LL;
        uint64_t v18 = v44;
        goto LABEL_38;
      }

      break;
    case 1LL:
      uint64_t v17 = *(void *)(a1 + 2080);
      std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v48,  a8);
      unsigned __int8 v37 = nlp::searchDiskLevel(a1, (v15 & 0xFFFFFFFC) + v17, a3, a4, a5 + 1, a6, a7, v48);
      uint64_t v18 = v49;
      if (v49 == v48)
      {
        uint64_t v19 = 4LL;
        uint64_t v18 = v48;
LABEL_38:
        (*(void (**)(void))(*(void *)v18 + 8 * v19))();
        return v37 != 0;
      }

      break;
    default:
      return v37 != 0;
  }

  if (v18)
  {
    uint64_t v19 = 5LL;
    goto LABEL_38;
  }

  return v37 != 0;
}

void sub_1874452EC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
  uint64_t v31 = *(void **)(v28 + 56);
  if (v31 == v27)
  {
    uint64_t v32 = 4LL;
    uint64_t v31 = (void *)(v29 - 128);
  }

  else
  {
    if (!v31) {
      goto LABEL_6;
    }
    uint64_t v32 = 5LL;
  }

  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchLevelRanked( uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  unsigned __int8 v30 = 0;
  if (a4 >= a3)
  {
    int v18 = *(_DWORD *)(a1 + 8);
    if (v18)
    {
      int v19 = *(_DWORD *)(a1 + 4);
      int v20 = malloc(a4 + 21LL);
      v20[4] = a4;
      *((_BYTE *)v20 + a4 + 20) = 0;
      memcpy(v20 + 5, a2, a4);
      v20[2] = v18;
      _DWORD *v20 = v19;
      v20[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a7,  a6,  (uint64_t)v20,  1,  (uint64_t)&v30);
      BOOL v21 = v20[3]-- == 1;
      if (v21) {
        free(v20);
      }
      uint64_t v15 = v30 != 0;
      if (v30 || (a5 & 1) != 0) {
        return v15;
      }
    }

    else if ((a5 & 1) != 0)
    {
      return 0LL;
    }

    uint64_t v22 = 0LL;
    uint64_t v23 = (a3 + 1);
    uint64_t v24 = a1 + 12;
    while (1)
    {
      uint64_t v25 = *(void *)(v24 + 8 * v22);
      a2[a4] = v22;
      if ((v25 & 3) == 2) {
        break;
      }
      if ((v25 & 3) == 1)
      {
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v33,  a7);
        int v26 = nlp::searchLevelRanked(v25 & 0xFFFFFFFFFFFFFFFCLL, a2, v23, a4 + 1, 0LL, a6, v33);
        unsigned __int8 v30 = v26;
        uint64_t v27 = v34;
        if (v34 == v33)
        {
          uint64_t v27 = v33;
          goto LABEL_24;
        }

void sub_1874456CC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, char *a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  uint64_t v28 = a22;
  if (a22 == v26)
  {
    uint64_t v29 = 4LL;
    uint64_t v28 = &a19;
  }

  else
  {
    if (!a22) {
      goto LABEL_6;
    }
    uint64_t v29 = 5LL;
  }

  (*(void (**)(void))(*(void *)v28 + 8 * v29))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchLevel( int *a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  unsigned __int8 v29 = 0;
  if (a4 >= a3)
  {
    int v18 = *a1;
    if (*a1)
    {
      int v19 = malloc(a4 + 21LL);
      v19[4] = a4;
      *((_BYTE *)v19 + a4 + 20) = 0;
      memcpy(v19 + 5, a2, a4);
      v19[2] = v18;
      *int v19 = 0;
      void v19[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a7,  a6,  (uint64_t)v19,  1,  (uint64_t)&v29);
      BOOL v20 = v19[3]-- == 1;
      if (v20) {
        free(v19);
      }
      uint64_t v15 = v29 != 0;
      if (v29 || (a5 & 1) != 0) {
        return v15;
      }
    }

    else if ((a5 & 1) != 0)
    {
      return 0LL;
    }

    uint64_t v21 = 0LL;
    uint64_t v22 = (a3 + 1);
    uint64_t v23 = a1 + 1;
    while (1)
    {
      uint64_t v24 = *(void *)&v23[2 * v21];
      a2[a4] = v21;
      if ((v24 & 3) == 2) {
        break;
      }
      if ((v24 & 3) == 1)
      {
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v32,  a7);
        int v25 = nlp::searchLevel(v24 & 0xFFFFFFFFFFFFFFFCLL, a2, v22, a4 + 1, 0LL, a6, v32);
        unsigned __int8 v29 = v25;
        int v26 = v33;
        if (v33 == v32)
        {
          int v26 = v32;
          goto LABEL_24;
        }

void sub_187445A64( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, char *a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  uint64_t v27 = a21;
  if (a21 == v25)
  {
    uint64_t v28 = 4LL;
    uint64_t v27 = &a18;
  }

  else
  {
    if (!a21) {
      goto LABEL_6;
    }
    uint64_t v28 = 5LL;
  }

  (*(void (**)(void))(*(void *)v27 + 8 * v28))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchCompactDiskLevelRanked( uint64_t a1, int8x8_t *a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  unsigned __int8 v54 = 0;
  if (a5 >= a4)
  {
    __int32 v20 = a2[5].i32[0];
    if (v20)
    {
      __int32 v21 = a2[4].i32[1];
      uint64_t v22 = malloc(a4 + 21LL);
      v22[4] = a4;
      *((_BYTE *)v22 + a4 + 20) = 0;
      memcpy(v22 + 5, a3, a4);
      v22[2] = v20;
      *uint64_t v22 = v21;
      v22[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a8,  a7,  (uint64_t)v22,  1,  (uint64_t)&v54);
      if (v22[3]-- == 1) {
        free(v22);
      }
      if (v54) {
        return 1LL;
      }
    }

    if ((a6 & 1) != 0) {
      return v54 != 0;
    }
    unint64_t v25 = 0LL;
    unsigned int v52 = a4 + 1;
    while (1)
    {
      if (v25 >> 6 <= 1) {
        uint64_t v26 = 1LL;
      }
      else {
        uint64_t v26 = v25 >> 6;
      }
      int8x8_t v27 = a2[v25 >> 6];
      if ((*(void *)&v27 & (1LL << v25)) == 0) {
        goto LABEL_34;
      }
      if (v25 >= 0x40)
      {
        int v28 = 0;
        unsigned __int8 v29 = a2;
        do
        {
          int8x8_t v30 = *v29++;
          uint8x8_t v31 = (uint8x8_t)vcnt_s8(v30);
          v31.i16[0] = vaddlv_u8(v31);
          v28 += v31.i32[0];
          --v26;
        }

        while (v26);
      }

      else
      {
        int v28 = 0;
      }

      uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v27 & ((1LL << v25) - 1)));
      v32.i16[0] = vaddlv_u8(v32);
      __int32 v33 = a2[5].i32[v28 + v32.i32[0] + 1];
      a3[a5] = v25;
      int v34 = v33 & 3;
      switch(v34)
      {
        case 1:
          uint64_t v38 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v59,  a8);
          int v36 = nlp::searchDiskLevelRanked(a1, v38 + (v33 & 0xFFFFFFFC), a3, v52, a5 + 1, 0LL, a7, v59);
          unsigned __int8 v54 = v36;
          unsigned __int8 v37 = v60;
          if (v60 == v59)
          {
            unsigned __int8 v37 = v59;
LABEL_32:
            uint64_t v40 = 4LL;
            goto LABEL_33;
          }

          break;
        case 2:
          uint64_t v39 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v55,  a8);
          int v36 = nlp::searchDiskPageRanked( (unsigned int *)(v39 + (v33 & 0xFFFFFFFC)),  a3,  v52,  a5 + 1,  0,  a7,  (uint64_t)v55);
          unsigned __int8 v54 = v36;
          unsigned __int8 v37 = v56;
          if (v56 == v55)
          {
            unsigned __int8 v37 = v55;
            goto LABEL_32;
          }

          break;
        case 3:
          uint64_t v35 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v57,  a8);
          int v36 = nlp::searchCompactDiskLevelRanked(a1, v35 + (v33 & 0xFFFFFFFC), a3, v52, a5 + 1, 0LL, a7, v57);
          unsigned __int8 v54 = v36;
          unsigned __int8 v37 = v58;
          if (v58 == v57)
          {
            unsigned __int8 v37 = v57;
            goto LABEL_32;
          }

          break;
        default:
          goto LABEL_34;
      }

      if (v37)
      {
        uint64_t v40 = 5LL;
LABEL_33:
        (*(void (**)(_BYTE *))(*(void *)v37 + 8 * v40))(v37);
LABEL_34:
        int v36 = v54;
      }

      if (v36) {
        return 1LL;
      }
      if ((_DWORD)++v25 == 256) {
        return v54 != 0;
      }
    }
  }

  unint64_t v15 = a3[a5];
  uint64_t v16 = v15 >> 6;
  int8x8_t v17 = a2[v15 >> 6];
  uint64_t v18 = 1LL << v15;
  if (((1LL << v15) & *(void *)&v17) != 0)
  {
    if (v15 >= 0x40)
    {
      int v19 = 0;
      else {
        uint64_t v16 = v16;
      }
      int v41 = a2;
      do
      {
        int8x8_t v42 = *v41++;
        uint8x8_t v43 = (uint8x8_t)vcnt_s8(v42);
        v43.i16[0] = vaddlv_u8(v43);
        v19 += v43.i32[0];
        --v16;
      }

      while (v16);
    }

    else
    {
      int v19 = 0;
    }

    uint8x8_t v44 = (uint8x8_t)vcnt_s8((int8x8_t)((v18 - 1) & *(void *)&v17));
    v44.i16[0] = vaddlv_u8(v44);
    __int32 v45 = a2[5].i32[v19 + v44.i32[0] + 1];
    int v46 = v45 & 3;
    switch(v46)
    {
      case 1:
        uint64_t v50 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v65,  a8);
        unsigned __int8 v54 = nlp::searchDiskLevelRanked(a1, (v45 & 0xFFFFFFFC) + v50, a3, a4, a5 + 1, a6, a7, v65);
        uint64_t v48 = v66;
        if (v66 == v65)
        {
          uint64_t v49 = 4LL;
          uint64_t v48 = v65;
          goto LABEL_54;
        }

        break;
      case 2:
        uint64_t v51 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v61,  a8);
        unsigned __int8 v54 = nlp::searchDiskPageRanked( (unsigned int *)((v45 & 0xFFFFFFFC) + v51),  a3,  a4,  a5 + 1,  a6,  a7,  (uint64_t)v61);
        uint64_t v48 = v62;
        if (v62 == v61)
        {
          uint64_t v49 = 4LL;
          uint64_t v48 = v61;
          goto LABEL_54;
        }

        break;
      case 3:
        uint64_t v47 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v63,  a8);
        unsigned __int8 v54 = nlp::searchCompactDiskLevelRanked(a1, (v45 & 0xFFFFFFFC) + v47, a3, a4, a5 + 1, a6, a7, v63);
        uint64_t v48 = v64;
        if (v64 == v63)
        {
          uint64_t v49 = 4LL;
          uint64_t v48 = v63;
LABEL_54:
          (*(void (**)(void))(*(void *)v48 + 8 * v49))();
          return v54 != 0;
        }

        break;
      default:
        return v54 != 0;
    }

    if (v48)
    {
      uint64_t v49 = 5LL;
      goto LABEL_54;
    }
  }

  return v54 != 0;
}

void sub_187445FC8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
  uint8x8_t v32 = *(char **)(v30 + 24);
  if (v32 == v29)
  {
    uint64_t v33 = 4LL;
    uint8x8_t v32 = &a29;
  }

  else
  {
    if (!v32) {
      goto LABEL_6;
    }
    uint64_t v33 = 5LL;
  }

  (*(void (**)(void))(*(void *)v32 + 8 * v33))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchDiskPageRanked( unsigned int *a1, _BYTE *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  char v37 = 0;
  unsigned int v7 = *a1;
  if (!*a1) {
    return 0LL;
  }
  int v8 = a4;
  int v9 = a3;
  unsigned int v11 = 0;
  uint64_t v12 = &a2[a4];
  int v13 = a3 - a4;
  __uint64_t n = (int)(a3 - a4);
  unsigned __int8 v29 = v12;
  __dst = &a2[a3];
  size_t v28 = a3;
  while (1)
  {
    uint64_t v14 = (char *)a1 + v11;
    uint64_t v15 = *((unsigned __int16 *)v14 + 8);
    uint64_t v16 = v14 + 8;
    int8x8_t v17 = v14 + 18;
    if (memcmp(v14 + 18, v12, __n)) {
      goto LABEL_14;
    }
    char v18 = a5;
    if (v13 == (_DWORD)v15) {
      char v18 = 0;
    }
    if ((v18 & 1) != 0) {
      goto LABEL_14;
    }
    size_t v19 = (v15 + v8);
    size_t v20 = (v19 - v9);
    size_t v21 = v28;
    if ((int)v20 >= 1)
    {
      memcpy(__dst, &v17[v15 - (int)v20], v20);
      size_t v21 = v19;
      int v9 = v19;
    }

    a2[v21] = 0;
    int v22 = *((_DWORD *)v16 + 1);
    int v23 = *(_DWORD *)v16;
    uint64_t v24 = malloc(v21 + 21);
    v24[4] = v9;
    *((_BYTE *)v24 + v21 + 20) = 0;
    memcpy(v24 + 5, a2, v21);
    *uint64_t v24 = v23;
    v24[2] = v22;
    v24[3] = 1;
    std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a7,  a6,  (uint64_t)v24,  v13 == (_DWORD)v15,  (uint64_t)&v37);
    int v25 = v24[3] - 1;
    v24[3] = v25;
    if (!v25) {
      free(v24);
    }
    int v9 = a3;
    int v8 = a4;
    uint64_t v12 = v29;
    if (v37) {
      return 1LL;
    }
    LODWORD(v15) = *((unsigned __int16 *)v16 + 4);
LABEL_14:
    v11 += v15 + 10;
    if (v11 >= v7) {
      return 0LL;
    }
  }

uint64_t std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10 = a2;
  uint64_t v9 = a3;
  char v8 = a4;
  uint64_t v7 = a5;
  uint64_t v5 = *(void *)(a1 + 24);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, char *, uint64_t *))(*(void *)v5 + 48LL))( v5,  &v10,  &v9,  &v8,  &v7);
}

uint64_t std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24LL))(*(void *)(a2 + 24), a1);
    }

    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    }
  }

  else
  {
    *(void *)(a1 + 24) = 0LL;
  }

  return a1;
}

uint64_t std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = a2;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *, uint64_t *))(*(void *)v4 + 48LL))(v4, &v8, &v7, &v6);
}

void *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_18A04E928;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A04E928;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( uint64_t a1, void *a2, void *a3, unsigned __int8 *a4, void *a5)
{
  return (*(uint64_t (**)(void, void, void, void))(a1 + 8))(*a2, *a3, *a4, *a5);
}

uint64_t std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *),std::allocator<void (*)(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>,void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::target_type()
{
}

uint64_t nlp::searchCompactDiskLevel( uint64_t a1, int8x8_t *a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  unsigned __int8 v53 = 0;
  if (a5 >= a4)
  {
    __int32 v20 = a2[4].i32[0];
    if (v20)
    {
      size_t v21 = malloc(a4 + 21LL);
      v21[4] = a4;
      *((_BYTE *)v21 + a4 + 20) = 0;
      memcpy(v21 + 5, a3, a4);
      v21[2] = v20;
      *size_t v21 = 0;
      void v21[3] = 1;
      std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a8,  a7,  (uint64_t)v21,  1,  (uint64_t)&v53);
      if (v21[3]-- == 1) {
        free(v21);
      }
      if (v53) {
        return 1LL;
      }
    }

    if ((a6 & 1) != 0) {
      return v53 != 0;
    }
    unint64_t v24 = 0LL;
    unsigned int v51 = a4 + 1;
    while (1)
    {
      if (v24 >> 6 <= 1) {
        uint64_t v25 = 1LL;
      }
      else {
        uint64_t v25 = v24 >> 6;
      }
      int8x8_t v26 = a2[v24 >> 6];
      if ((*(void *)&v26 & (1LL << v24)) == 0) {
        goto LABEL_34;
      }
      if (v24 >= 0x40)
      {
        int v27 = 0;
        size_t v28 = a2;
        do
        {
          int8x8_t v29 = *v28++;
          uint8x8_t v30 = (uint8x8_t)vcnt_s8(v29);
          v30.i16[0] = vaddlv_u8(v30);
          v27 += v30.i32[0];
          --v25;
        }

        while (v25);
      }

      else
      {
        int v27 = 0;
      }

      uint8x8_t v31 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v26 & ((1LL << v24) - 1)));
      v31.i16[0] = vaddlv_u8(v31);
      __int32 v32 = a2[4].i32[v27 + v31.i32[0] + 1];
      a3[a5] = v24;
      int v33 = v32 & 3;
      switch(v33)
      {
        case 1:
          uint64_t v37 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v58,  a8);
          int v35 = nlp::searchDiskLevel(a1, v37 + (v32 & 0xFFFFFFFC), a3, v51, a5 + 1, 0LL, a7, v58);
          unsigned __int8 v53 = v35;
          int v36 = v59;
          if (v59 == v58)
          {
            int v36 = v58;
LABEL_32:
            uint64_t v39 = 4LL;
            goto LABEL_33;
          }

          break;
        case 2:
          uint64_t v38 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v54,  a8);
          int v35 = nlp::searchDiskPage( a1,  (unsigned int *)(v38 + (v32 & 0xFFFFFFFC)),  (char *)a3,  v51,  a5 + 1,  0,  a7,  (uint64_t)v54);
          unsigned __int8 v53 = v35;
          int v36 = v55;
          if (v55 == v54)
          {
            int v36 = v54;
            goto LABEL_32;
          }

          break;
        case 3:
          uint64_t v34 = *(void *)(a1 + 2080);
          std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v56,  a8);
          int v35 = nlp::searchCompactDiskLevel(a1, v34 + (v32 & 0xFFFFFFFC), a3, v51, a5 + 1, 0LL, a7, v56);
          unsigned __int8 v53 = v35;
          int v36 = v57;
          if (v57 == v56)
          {
            int v36 = v56;
            goto LABEL_32;
          }

          break;
        default:
          goto LABEL_34;
      }

      if (v36)
      {
        uint64_t v39 = 5LL;
LABEL_33:
        (*(void (**)(void))(*(void *)v36 + 8 * v39))();
LABEL_34:
        int v35 = v53;
      }

      if (v35) {
        return 1LL;
      }
      if ((_DWORD)++v24 == 256) {
        return v53 != 0;
      }
    }
  }

  unint64_t v15 = a3[a5];
  uint64_t v16 = v15 >> 6;
  int8x8_t v17 = a2[v15 >> 6];
  uint64_t v18 = 1LL << v15;
  if (((1LL << v15) & *(void *)&v17) != 0)
  {
    if (v15 >= 0x40)
    {
      int v19 = 0;
      else {
        uint64_t v16 = v16;
      }
      uint64_t v40 = a2;
      do
      {
        int8x8_t v41 = *v40++;
        uint8x8_t v42 = (uint8x8_t)vcnt_s8(v41);
        v42.i16[0] = vaddlv_u8(v42);
        v19 += v42.i32[0];
        --v16;
      }

      while (v16);
    }

    else
    {
      int v19 = 0;
    }

    uint8x8_t v43 = (uint8x8_t)vcnt_s8((int8x8_t)((v18 - 1) & *(void *)&v17));
    v43.i16[0] = vaddlv_u8(v43);
    __int32 v44 = a2[4].i32[v19 + v43.i32[0] + 1];
    int v45 = v44 & 3;
    switch(v45)
    {
      case 1:
        uint64_t v49 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v64,  a8);
        unsigned __int8 v53 = nlp::searchDiskLevel(a1, (v44 & 0xFFFFFFFC) + v49, a3, a4, a5 + 1, a6, a7, v64);
        uint64_t v47 = v65;
        if (v65 == v64)
        {
          uint64_t v48 = 4LL;
          uint64_t v47 = v64;
          goto LABEL_54;
        }

        break;
      case 2:
        uint64_t v50 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v60,  a8);
        unsigned __int8 v53 = nlp::searchDiskPage( a1,  (unsigned int *)((v44 & 0xFFFFFFFC) + v50),  (char *)a3,  a4,  a5 + 1,  a6,  a7,  (uint64_t)v60);
        uint64_t v47 = v61;
        if (v61 == v60)
        {
          uint64_t v48 = 4LL;
          uint64_t v47 = v60;
          goto LABEL_54;
        }

        break;
      case 3:
        uint64_t v46 = *(void *)(a1 + 2080);
        std::__function::__value_func<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::__value_func[abi:ne180100]( (uint64_t)v62,  a8);
        unsigned __int8 v53 = nlp::searchCompactDiskLevel(a1, (v44 & 0xFFFFFFFC) + v46, a3, a4, a5 + 1, a6, a7, v62);
        uint64_t v47 = v63;
        if (v63 == v62)
        {
          uint64_t v48 = 4LL;
          uint64_t v47 = v62;
LABEL_54:
          (*(void (**)(void))(*(void *)v47 + 8 * v48))();
          return v53 != 0;
        }

        break;
      default:
        return v53 != 0;
    }

    if (v47)
    {
      uint64_t v48 = 5LL;
      goto LABEL_54;
    }
  }

  return v53 != 0;
}

void sub_1874468C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
  __int32 v32 = *(char **)(v30 + 24);
  if (v32 == v29)
  {
    uint64_t v33 = 4LL;
    __int32 v32 = &a29;
  }

  else
  {
    if (!v32) {
      goto LABEL_6;
    }
    uint64_t v33 = 5LL;
  }

  (*(void (**)(void))(*(void *)v32 + 8 * v33))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t nlp::searchDiskPage( uint64_t a1, unsigned int *a2, char *a3, unsigned int a4, int a5, char a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  unsigned int v9 = a4;
  uint64_t v66 = *MEMORY[0x1895F89C0];
  char v64 = 0;
  int v11 = a4 - a5;
  unsigned int v12 = *a2;
  if ((*(_BYTE *)(a1 + 2064) & 4) != 0)
  {
    memset(__s1, 0, sizeof(__s1));
    if (v12)
    {
      unsigned int v28 = 0;
      int8x8_t v29 = 0LL;
      int v52 = a5 - a4;
      __s2a = &a3[a5];
      unsigned int v51 = &a3[a4];
      do
      {
        uint64_t v30 = (char *)a2 + v28;
        uint64_t v31 = v30[10];
        if (v29)
        {
          uint64_t v32 = v29[6];
        }

        int8x8_t v29 = v30 + 4;
        unsigned int v33 = *((unsigned __int16 *)v30 + 4);
        int v34 = v33 + v31;
        if ((int)(v33 + v31) >= v11)
        {
          if (v9 == v8 || ((int)v31 >= v11 ? (int v35 = v11) : (int v35 = v31), !memcmp(__s1, __s2a, v35)))
          {
            unsigned int v36 = v11 - v31;
            if (v11 - (int)v31 < 0
              || ((int)v33 >= (int)v36 ? (size_t v37 = v36) : (size_t v37 = v33), !memcmp(v29 + 7, &__s2a[v31], v37)))
            {
              char v38 = a6;
              if (v11 == v34) {
                char v38 = 0;
              }
              if ((v38 & 1) == 0)
              {
                unsigned int v39 = v9;
                unsigned int v40 = v31 + v8;
                size_t v41 = (_DWORD)v31 + v8 - v39;
                if ((int)v41 < 1)
                {
                  unsigned int v40 = v39;
                }

                else
                {
                  memcpy(v51, (char *)__s1 + v31 - (int)v41, v41);
                  unsigned int v33 = *((unsigned __int16 *)v29 + 2);
                  LODWORD(v31) = v29[6];
                }

                int v42 = v52 + v33 + v31;
                if (v42 < 1)
                {
                  __int32 v44 = a3;
                }

                else
                {
                  int v43 = v42 - (v41 & ~((int)v41 >> 31));
                  __int32 v44 = a3;
                  memcpy(&a3[v40], &v29[v33 - v43 + 7], v43);
                  v40 += v43;
                }

                char v54 = v11 == v34;
                v44[v40] = 0;
                int v45 = *(_DWORD *)v29;
                uint64_t v46 = malloc(v40 + 21LL);
                v46[4] = v40;
                *((_BYTE *)v46 + v40 + 20) = 0;
                memcpy(v46 + 5, v44, v40);
                *uint64_t v46 = 0;
                v46[2] = v45;
                v46[3] = 1;
                std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a8,  a7,  (uint64_t)v46,  v54,  (uint64_t)&v64);
                int v47 = v46[3] - 1;
                v46[3] = v47;
                if (!v47) {
                  free(v46);
                }
                unsigned int v9 = a4;
                if (v64) {
                  return 1LL;
                }
                unsigned int v33 = *((unsigned __int16 *)v29 + 2);
                int v8 = a5;
              }
            }
          }
        }

        v28 += v33 + 7;
      }

      while (v28 < v12);
    }
  }

  else if (v12)
  {
    unsigned int v13 = 0;
    uint64_t v14 = &a3[a5];
    size_t v15 = v11;
    __dst = &a3[a4];
    size_t v50 = a4;
    unsigned __int8 v53 = v14;
    do
    {
      uint64_t v16 = (char *)a2 + v13;
      uint64_t v17 = *((unsigned __int16 *)v16 + 4);
      if (v11 <= (int)v17)
      {
        uint64_t v18 = v16 + 4;
        int v19 = v16 + 10;
        if (!memcmp(v16 + 10, v14, v15))
        {
          char v20 = a6;
          if (v11 == (_DWORD)v17) {
            char v20 = 0;
          }
          if ((v20 & 1) == 0)
          {
            size_t v21 = (v17 + v8);
            int v22 = a4;
            size_t v23 = v21 - a4;
            size_t v24 = v50;
            if ((int)v23 >= 1)
            {
              memcpy(__dst, &v19[v17 - (int)v23], v23);
              size_t v24 = v21;
              int v22 = v21;
            }

            a3[v24] = 0;
            int v25 = *(_DWORD *)v18;
            int8x8_t v26 = malloc(v24 + 21);
            v26[4] = v22;
            *((_BYTE *)v26 + v24 + 20) = 0;
            memcpy(v26 + 5, a3, v24);
            *int8x8_t v26 = 0;
            v26[2] = v25;
            void v26[3] = 1;
            std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a8,  a7,  (uint64_t)v26,  v11 == (_DWORD)v17,  (uint64_t)&v64);
            int v27 = v26[3] - 1;
            void v26[3] = v27;
            if (!v27) {
              free(v26);
            }
            int v8 = a5;
            size_t v15 = v11;
            uint64_t v14 = v53;
            if (v64) {
              return 1LL;
            }
            LODWORD(v17) = *((unsigned __int16 *)v18 + 2);
          }
        }
      }

      v13 += v17 + 6;
    }

    while (v13 < v12);
  }

  return 0LL;
}

uint64_t nlp::searchListRanked( uint64_t result, _BYTE *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  char v30 = 0;
  if (result)
  {
    int v7 = a4;
    uint64_t v10 = result;
    int v11 = &a2[a4];
    size_t v12 = (int)(a3 - a4);
    size_t v26 = a3;
    char v13 = a5;
    __dst = &a2[a3];
    while (1)
    {
      uint64_t v14 = *(unsigned __int16 *)(v10 + 20);
      if ((int)v12 <= (int)v14 && !memcmp((const void *)(v10 + 22), v11, v12))
      {
        char v15 = (_DWORD)v12 == (_DWORD)v14 ? 0 : v13;
        if ((v15 & 1) == 0)
        {
          size_t v16 = (v14 + v7);
          size_t v17 = v16 - a3;
          size_t v18 = v26;
          int v19 = a3;
          if ((int)v17 >= 1)
          {
            memcpy(__dst, (const void *)(v10 + 22 + v14 - (int)v17), v17);
            size_t v18 = v16;
            int v19 = v16;
          }

          a2[v18] = 0;
          int v20 = *(_DWORD *)(v10 + 16);
          int v21 = *(_DWORD *)(v10 + 12);
          int v22 = malloc(v18 + 21);
          v22[4] = v19;
          *((_BYTE *)v22 + v18 + 20) = 0;
          memcpy(v22 + 5, a2, v18);
          *int v22 = v21;
          v22[2] = v20;
          v22[3] = 1;
          std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a7,  a6,  (uint64_t)v22,  (_DWORD)v12 == (_DWORD)v14,  (uint64_t)&v30);
          int v23 = v22[3] - 1;
          v22[3] = v23;
          if (!v23) {
            free(v22);
          }
          int v7 = a4;
          char v13 = a5;
          if (v30) {
            break;
          }
        }
      }

      uint64_t v10 = *(void *)v10;
      if (!v10) {
        return 0LL;
      }
    }

    return 1LL;
  }

  return result;
}

uint64_t nlp::searchList(uint64_t result, _BYTE *a2, unsigned int a3, int a4, char a5, uint64_t a6, uint64_t a7)
{
  char v29 = 0;
  if (result)
  {
    int v7 = a4;
    uint64_t v10 = result;
    int v11 = &a2[a4];
    size_t v12 = (int)(a3 - a4);
    size_t v25 = a3;
    char v13 = a5;
    __dst = &a2[a3];
    while (1)
    {
      uint64_t v14 = *(unsigned __int16 *)(v10 + 12);
      if ((int)v12 <= (int)v14 && !memcmp((const void *)(v10 + 14), v11, v12))
      {
        char v15 = (_DWORD)v12 == (_DWORD)v14 ? 0 : v13;
        if ((v15 & 1) == 0)
        {
          size_t v16 = (v14 + v7);
          size_t v17 = v16 - a3;
          size_t v18 = v25;
          int v19 = a3;
          if ((int)v17 >= 1)
          {
            memcpy(__dst, (const void *)(v10 + 14 + v14 - (int)v17), v17);
            size_t v18 = v16;
            int v19 = v16;
          }

          a2[v18] = 0;
          int v20 = *(_DWORD *)(v10 + 8);
          int v21 = malloc(v18 + 21);
          v21[4] = v19;
          *((_BYTE *)v21 + v18 + 20) = 0;
          memcpy(v21 + 5, a2, v18);
          *int v21 = 0;
          v21[2] = v20;
          void v21[3] = 1;
          std::function<void ()(void *,nlp::_TrieCompletion *,BOOL,BOOL *)>::operator()( a7,  a6,  (uint64_t)v21,  (_DWORD)v12 == (_DWORD)v14,  (uint64_t)&v29);
          int v22 = v21[3] - 1;
          void v21[3] = v22;
          if (!v22) {
            free(v21);
          }
          int v7 = a4;
          char v13 = a5;
          if (v29) {
            break;
          }
        }
      }

      uint64_t v10 = *(void *)v10;
      if (!v10) {
        return 0LL;
      }
    }

    return 1LL;
  }

  return result;
}

uint64_t nlp::advanceCompactMapCursorMappedLevel(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4)
{
  unint64_t v8 = (*(void *)a2 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(a1 + 2080);
  if ((*(_BYTE *)(a1 + 2064) & 1) != 0)
  {
    if (!a4)
    {
      *(_DWORD *)(a2 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = *(_DWORD *)(v8 + 1024);
      *(_DWORD *)(a2 + 20) = *(_DWORD *)(v8 + 1032);
      return 1LL;
    }

LABEL_5:
    nlp::updateCompactMapCursorPointer(a1, (void *)a2, *(unsigned int *)(v8 + 4LL * *a3));
    return nlp::advanceCompactMapCursor(a1, a2, a3 + 1, (a4 - 1));
  }

  if (a4) {
    goto LABEL_5;
  }
  *(_DWORD *)(a2 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = *(_DWORD *)(v8 + 1024);
  return 1LL;
}

  if (!CFBinaryHeapContainsValue(heap, value))
  {
    if (a2)
    {
      if (((unsigned int (*)(void, void, float *, CFBinaryHeapRef, uint64_t))a2[3])( a2[1],  *a2,  value,  heap,  a5))
      {
        ((void (*)(void, void, float *, CFBinaryHeapRef, uint64_t))a2[4])(a2[1], *a2, value, heap, a5);
LABEL_27:
        CFBinaryHeapAddValue(heap, value);
      }
    }

    else
    {
      size_t v16 = (float *)CFBinaryHeapGetMinimum(heap);
      size_t v17 = 0.0;
      size_t v18 = 0.0;
      if (v16) {
        size_t v18 = *v16;
      }
      if (value) {
        size_t v17 = *value;
      }
      if (v18 < v17)
      {
        int v19 = (4 * *((_DWORD *)v16 + 2));
        int v20 = v16 + 5;
        int v21 = *((unsigned int *)v16 + 4);
        int v22 = *v16;
        int v23 = (float *)malloc(v21 + 4125);
        *((void *)v23 + 1) = v19;
        v23[4] = v22;
        *((_DWORD *)v23 + 5) = 1;
        *((_DWORD *)v23 + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v21;
        *((_BYTE *)v23 + v21 + 28) = 0;
        memcpy(v23 + 7, v20, v21);
        CFBinaryHeapAddValue(a3, v23);
        size_t v24 = *((_DWORD *)v23 + 5) - 1;
        *((_DWORD *)v23 + 5) = v24;
        if (!v24) {
          free(v23);
        }
        CFBinaryHeapRemoveMinimumValue(heap);
        goto LABEL_27;
      }

      size_t v26 = (4 * *((_DWORD *)value + 2));
      int v27 = (char *)(value + 5);
      unsigned int v28 = *((unsigned int *)value + 4);
      char v29 = *value;
      char v30 = (float *)malloc(v28 + 4125);
      *((void *)v30 + 1) = v26;
      v30[4] = v29;
      *((_DWORD *)v30 + 5) = 1;
      *((_DWORD *)v30 + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v28;
      *((_BYTE *)v30 + v28 + 28) = 0;
      memcpy(v30 + 7, v27, v28);
      CFBinaryHeapAddValue(a3, v30);
      uint64_t v31 = *((_DWORD *)v30 + 5) - 1;
      *((_DWORD *)v30 + 5) = v31;
      if (!v31) {
        free(v30);
      }
    }
  }

  return v10;
}

uint64_t nlp::updateCompactMapCursorPointer(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 != a3) {
    return ((uint64_t (*)(void))((char *)&loc_18744714C + 4 * byte_18744C8F0[a3 & 3]))();
  }
  return result;
}

uint64_t nlp::advanceMapCursorTrieList( uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned int a4, __n128 a5)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 2064) & 1) == 0)
  {
    unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v10 = *(unsigned int *)(a2 + 16);
    if (!v9) {
      return 0;
    }
    unint64_t v11 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    while (1)
    {
      unsigned int v12 = *(unsigned __int16 *)((v8 & 0xFFFFFFFFFFFFFFFCLL) + 12);
      if (v11 != v9)
      {
        unsigned int v12 = *(unsigned __int16 *)(v11 + 12);
        if ((_DWORD)v10)
        {
          char v13 = (unsigned __int8 *)(v11 + 14);
          uint64_t v14 = *(unsigned int *)(a2 + 16);
          char v15 = (unsigned __int8 *)(v9 + 14);
          do
          {
            int v17 = *v13++;
            int v16 = v17;
            int v18 = *v15++;
            if (v16 != v18) {
              goto LABEL_19;
            }
          }

          while (--v14);
        }
      }

      LODWORD(v19) = 0;
      int v20 = *(_DWORD *)(a2 + 16);
      if (v10 < v12 && a4)
      {
        unint64_t v19 = 0LL;
        do
        {
          if (++v19 + v10 >= v12) {
            break;
          }
        }

        while (v19 < a4);
        int v20 = v10 + v19;
      }

      if ((_DWORD)v19 == a4)
      {
        *(void *)(a2 + 8) = v11 | 2;
        if (v20 == v12)
        {
          *(_DWORD *)(a2 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v12;
          *(_DWORD *)(a2 + 20) = *(_DWORD *)(v11 + 8);
        }

        else
        {
          *(void *)(a2 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v10 + a4;
        }

        return 1;
      }

uint64_t nlp::updateMapCursorPointer(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a2 + 8) != a3)
  {
    uint64_t v3 = a3 & 3;
    if ((a3 & 3) != 0)
    {
      if (v3 == 2)
      {
        unint64_t v6 = a3 & 0xFFFFFFFFFFFFFFFCLL;
        if ((*(_BYTE *)(result + 2064) & 1) == 0)
        {
          if (*(_WORD *)(v6 + 12)) {
            int v5 = 0;
          }
          else {
            int v5 = *(_DWORD *)(v6 + 8);
          }
          goto LABEL_14;
        }

        *(_DWORD *)(a2 + 20) = *(_DWORD *)(v6 + 16);
        *(_DWORD *)(a2 + 24) = *(_DWORD *)(v6 + 12);
        *(void *)a2 = a3;
      }

      else if (v3 == 1)
      {
        uint64_t v4 = (int *)(a3 & 0xFFFFFFFFFFFFFFFCLL);
        if ((*(_BYTE *)(result + 2064) & 1) == 0)
        {
          int v5 = *v4;
LABEL_14:
          *(_DWORD *)(a2 + 20) = v5;
          goto LABEL_15;
        }

        *(_DWORD *)(a2 + 20) = v4[2];
        *(_DWORD *)(a2 + 24) = v4[1];
      }
    }

    else
    {
      *(void *)(a2 + 20) = 0LL;
    }

LABEL_15:
    *(void *)(a2 + 8) = a3;
    *(_DWORD *)(a2 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0;
  }

  return result;
}

uint64_t nlp::rankSearchCompactDiskLevel( uint64_t result, int8x8_t *a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7, unsigned int a8, void *a9)
{
  unsigned int v10 = a4;
  char v13 = (nlp *)result;
  if (a5 >= a4)
  {
LABEL_12:
    uint64_t v25 = nlp::sharedBuffer((nlp *)result);
    if ((int)(v10 + 1) <= 1023)
    {
      size_t v26 = v25;
      memcpy(v25, a3, v10);
      unint64_t v27 = 0LL;
      v26[v10 + 1] = 0;
      do
      {
        if (v27 >> 6 <= 1) {
          uint64_t v28 = 1LL;
        }
        else {
          uint64_t v28 = v27 >> 6;
        }
        int8x8_t v29 = a2[v27 >> 6];
        if (((1LL << v27) & *(void *)&v29) != 0)
        {
          if (v27 >= 0x40)
          {
            int v30 = 0;
            double v31 = a2;
            do
            {
              int8x8_t v32 = *v31++;
              uint8x8_t v33 = (uint8x8_t)vcnt_s8(v32);
              v33.i16[0] = vaddlv_u8(v33);
              v30 += v33.i32[0];
              --v28;
            }

            while (v28);
          }

          else
          {
            int v30 = 0;
          }

          uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)(((1LL << v27) - 1) & *(void *)&v29));
          v34.i16[0] = vaddlv_u8(v34);
          uint64_t v35 = a2[5].u32[v30 + v34.i32[0] + 1];
          v26[v10] = v27;
          nlp::rankSearchGetCursor((uint64_t)v13, v35, v26, v10 + 1, a6);
        }

        ++v27;
      }

      while ((_DWORD)v27 != 256);
    }

    __int32 v36 = a2[5].i32[0];
    if (!v36) {
      return nlp::rankSearchCursors((int)v13, a6);
    }
    __int32 v37 = a2[4].i32[1];
    __n128 v38 = malloc(v10 + 21LL);
    v38[4] = v10;
    *((_BYTE *)v38 + v10 + 20) = 0;
    memcpy(v38 + 5, a3, v10);
    *__n128 v38 = v37;
    v38[2] = v36;
    v38[3] = 1;
    BOOL updated = nlp::updateCompletions((float *)v38, a9, a6, a7, a8);
    BOOL v40 = updated;
    int v41 = v38[3] - 1;
    v38[3] = v41;
    if (v41)
    {
      if (updated) {
        return nlp::rankSearchCursors((int)v13, a6);
      }
    }

    else
    {
      free(v38);
      if (v40) {
        return nlp::rankSearchCursors((int)v13, a6);
      }
    }

    return 0LL;
  }

  while (1)
  {
    unint64_t v14 = a3[a5];
    uint64_t v15 = v14 >> 6;
    int8x8_t v16 = a2[v14 >> 6];
    uint64_t result = 1LL;
    uint64_t v17 = 1LL << v14;
    if (((1LL << v14) & *(void *)&v16) == 0) {
      return result;
    }
    if (v14 >= 0x40)
    {
      int v18 = 0;
      else {
        uint64_t v15 = v15;
      }
      unint64_t v19 = a2;
      do
      {
        int8x8_t v20 = *v19++;
        uint8x8_t v21 = (uint8x8_t)vcnt_s8(v20);
        v21.i16[0] = vaddlv_u8(v21);
        v18 += v21.i32[0];
        --v15;
      }

      while (v15);
    }

    else
    {
      int v18 = 0;
    }

    uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)((v17 - 1) & *(void *)&v16));
    v22.i16[0] = vaddlv_u8(v22);
    __int32 v23 = a2[5].i32[v18 + v22.i32[0] + 1];
    int v24 = v23 & 3;
    if (v24 != 3)
    {
      if (v24 == 1) {
        return nlp::rankSearchDiskLevel(v13, (v23 & 0xFFFFFFFC) + *((void *)v13 + 260), a3, a4, a5 + 1, a6);
      }
      if (v24 == 2) {
        return nlp::rankSearchDiskPage( v13,  (unsigned int *)((v23 & 0xFFFFFFFC) + *((void *)v13 + 260)),  (char *)a3,  a4,  a5 + 1,  a6,  a7,  a8,  a9);
      }
      return 1LL;
    }

    a2 = (int8x8_t *)((v23 & 0xFFFFFFFC) + *((void *)v13 + 260));
    if (++a5 == (_DWORD)a4) {
      goto LABEL_12;
    }
  }

BOOL nlp::rankSearchDiskPage( nlp *a1, unsigned int *a2, char *a3, unsigned int a4, unsigned int a5, __CFBinaryHeap *a6, __CFBinaryHeap *a7, unsigned int a8, void *a9)
{
  unsigned int v10 = a4;
  unsigned int v12 = a2;
  uint64_t v61 = *MEMORY[0x1895F89C0];
  int v14 = a4 - a5;
  uint64_t v15 = *a2;
  int8x8_t v16 = (char *)nlp::sharedBuffer(a1);
  uint64_t v17 = v16;
  std::string __src = v16;
  if ((*((_BYTE *)a1 + 2064) & 4) != 0)
  {
    if (v10 <= 0x3FF)
    {
      memcpy(v16, a3, v10);
      __dst = &v17[v10];
      char *__dst = 0;
      memset(__s1, 0, sizeof(__s1));
      if ((_DWORD)v15)
      {
        unsigned int v29 = 0;
        int v30 = 0LL;
        unsigned int v51 = a5 - v10;
        __s2a = &a3[a5];
        unsigned int v53 = v10;
        size_t v50 = v12;
        while (1)
        {
          double v31 = (char *)v12 + v29;
          uint64_t v32 = v31[18];
          if (v30)
          {
            uint64_t v33 = v30[10];
          }

          int v30 = v31 + 8;
          int v34 = *((unsigned __int16 *)v31 + 8);
          if (v34 + (int)v32 >= v14)
          {
            if (v10 == a5 || ((int)v32 >= v14 ? (int v35 = v14) : (int v35 = v32), !memcmp(__s1, __s2a, v35)))
            {
              int v36 = v14 - v32;
              if (v14 == (_DWORD)v32) {
                goto LABEL_29;
              }
              if (v34 < v36) {
                int v36 = v34;
              }
              if (!memcmp(v31 + 19, &__s2a[v32], v36))
              {
LABEL_29:
                unsigned int v37 = v10;
                unsigned int v38 = v32 + a5;
                size_t v39 = (_DWORD)v32 + a5 - v37;
                if ((int)v39 < 1)
                {
                  unsigned int v38 = v37;
                }

                else
                {
                  memcpy(__dst, (char *)__s1 + v32 - (int)v39, v39);
                  int v34 = *((unsigned __int16 *)v30 + 4);
                  LODWORD(v32) = v30[10];
                }

                int v40 = v51 + v34 + v32;
                if (v40 < 1)
                {
                  int v42 = __src;
                }

                else
                {
                  int v41 = v40 - (v39 & ~((int)v39 >> 31));
                  int v42 = __src;
                  memcpy(&__src[v38], &v30[v34 - v41 + 11], v41);
                  v38 += v41;
                }

                v42[v38] = 0;
                int v43 = *((_DWORD *)v30 + 1);
                int v44 = *(_DWORD *)v30;
                int v45 = malloc(v38 + 21LL);
                v45[4] = v38;
                *((_BYTE *)v45 + v38 + 20) = 0;
                memcpy(v45 + 5, v42, v38);
                _DWORD *v45 = v44;
                v45[2] = v43;
                v45[3] = 1;
                BOOL updated = nlp::updateCompletions((float *)v45, a9, a6, a7, a8);
                int v47 = v45[3] - 1;
                v45[3] = v47;
                if (!v47) {
                  free(v45);
                }
                unsigned int v12 = v50;
                unsigned int v10 = v53;
                if (!updated) {
                  return 0;
                }
                int v34 = *((unsigned __int16 *)v30 + 4);
              }
            }
          }

          v29 += v34 + 11;
        }
      }

      return 1;
    }

    return 0;
  }

  if (a5 > 0x3FF) {
    return 0;
  }
  memcpy(v16, a3, a5);
  int v18 = &v17[a5];
  *int v18 = 0;
  if (!(_DWORD)v15) {
    return 1;
  }
  unsigned int v19 = 0;
  int v52 = &a3[a5];
  BOOL __s2 = 1;
  do
  {
    uint64_t v20 = v15;
    uint8x8_t v21 = (char *)v12 + v19;
    uint8x8_t v22 = v21 + 8;
    memcpy(v18, v21 + 18, *((unsigned __int16 *)v21 + 8));
    size_t v23 = *((unsigned __int16 *)v21 + 8) + (unint64_t)a5;
    __src[v23] = 0;
    if (v14 <= *((unsigned __int16 *)v21 + 8))
    {
      int v24 = memcmp(v21 + 18, v52, v14);
      uint64_t v15 = v20;
      if (!v24)
      {
        int v25 = *((_DWORD *)v22 + 1);
        int v26 = *(_DWORD *)v22;
        unint64_t v27 = malloc(v23 + 21);
        _DWORD v27[4] = v23;
        *((_BYTE *)v27 + v23 + 20) = 0;
        memcpy(v27 + 5, __src, v23);
        *unint64_t v27 = v26;
        v27[2] = v25;
        v27[3] = 1;
        BOOL __s2 = nlp::updateCompletions((float *)v27, a9, a6, a7, a8);
        int v28 = v27[3] - 1;
        v27[3] = v28;
        if (!v28) {
          free(v27);
        }
      }
    }

    else
    {
      uint64_t v15 = v20;
    }

    v19 += *((unsigned __int16 *)v22 + 4) + 10;
  }

  while (v19 < v15);
  return __s2;
}

BOOL nlp::updateCompletions(float *value, void *a2, __CFBinaryHeap *a3, CFBinaryHeapRef heap, uint64_t a5)
{
  if (CFBinaryHeapContainsValue(heap, value))
  {
LABEL_2:
    BOOL v10 = 1LL;
    goto LABEL_5;
  }

  if (a2)
  {
    BOOL v10 = ((unsigned int (*)(void, void, float *, CFBinaryHeapRef, uint64_t))a2[2])( a2[1],  *a2,  value,  heap,  a5) != 0;
  }

  else
  {
    Minimuuint64_t m = (float *)CFBinaryHeapGetMinimum(heap);
    unsigned int v12 = (float *)CFBinaryHeapGetMinimum(a3);
    float v13 = 0.0;
    float v14 = 0.0;
    if (value) {
      float v14 = *value;
    }
    if (Minimum) {
      float v13 = *Minimum;
    }
    if (v14 > v13) {
      goto LABEL_2;
    }
    if (v12)
    {
      float v15 = Minimum ? *Minimum : 0.0;
      if (v15 < v12[4]) {
        goto LABEL_2;
      }
    }

    BOOL v10 = 0LL;
  }

void nlp::rankSearchGetCursor(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4, __CFBinaryHeap *a5)
{
  uint64_t v9 = *(void *)(a1 + 2080);
  uint64_t v10 = a2 & 3;
  if (v9)
  {
    switch(v10)
    {
      case 3LL:
        int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + v9 + 32);
        break;
      case 2LL:
        int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + v9 + 4);
        break;
      case 1LL:
        int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + v9 + 1028);
        break;
      default:
        return;
    }
  }

  else if (v10 == 2)
  {
    int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFFFFFFFCLL) + 8);
  }

  else
  {
    if (v10 != 1) {
      return;
    }
    int v11 = *(_DWORD *)(a2 & 0xFFFFFFFFFFFFFFFCLL);
  }

  unsigned int v12 = malloc(a4 + 4125LL);
  v12[1] = a2;
  *((_DWORD *)v12 + 4) = v11;
  *((_DWORD *)v12 + 5) = 1;
  *((_DWORD *)v12 + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = a4;
  *((_BYTE *)v12 + a4 + 28) = 0;
  memcpy((char *)v12 + 28, a3, a4);
  CFBinaryHeapAddValue(a5, v12);
  int v13 = *((_DWORD *)v12 + 5) - 1;
  *((_DWORD *)v12 + 5) = v13;
  if (!v13) {
    free(v12);
  }
}

BOOL nlp::rankSearchList( nlp *a1, char *a2, int a3, unsigned int a4, __CFBinaryHeap *a5, __CFBinaryHeap *a6, unsigned int a7, void *a8)
{
  if (a4 <= 0x3FF)
  {
    unsigned int v12 = a1;
    int v13 = (char *)nlp::sharedBuffer(a1);
    memcpy(v13, a2, a4);
    v13[a4] = 0;
    if (v12)
    {
      int v14 = a3 - a4;
      float v15 = &a2[a4];
      BOOL updated = 1;
      do
      {
        memcpy(&v13[a4], (char *)v12 + 22, *((unsigned __int16 *)v12 + 10));
        size_t v16 = *((unsigned __int16 *)v12 + 10) + (unint64_t)a4;
        v13[v16] = 0;
        if (v14 <= *((unsigned __int16 *)v12 + 10) && !memcmp((char *)v12 + 22, v15, v14))
        {
          int v17 = *((_DWORD *)v12 + 4);
          int v18 = *((_DWORD *)v12 + 3);
          uint64_t v19 = malloc(v16 + 21);
          v19[4] = v16;
          *((_BYTE *)v19 + v16 + 20) = 0;
          memcpy(v19 + 5, v13, v16);
          *uint64_t v19 = v18;
          v19[2] = v17;
          void v19[3] = 1;
          BOOL updated = nlp::updateCompletions((float *)v19, a8, a5, a6, a7);
          int v20 = v19[3] - 1;
          void v19[3] = v20;
          if (!v20) {
            free(v19);
          }
        }

        unsigned int v12 = *(nlp **)v12;
      }

      while (v12);
    }

    else
    {
      return 1;
    }
  }

  else
  {
    return 0;
  }

  return updated;
}

void nlp::serializeListsRanked(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = 0LL;
  unsigned int __fd = a4;
  do
  {
    uint64_t v9 = v6 + 8 * v8;
    uint64_t v12 = *(void *)(v9 + 12);
    int v11 = (uint64_t *)(v9 + 12);
    uint64_t v10 = v12;
    uint64_t v13 = v12 & 3;
    if (v13 == 2)
    {
      int v14 = (_DWORD *)(v10 & 0xFFFFFFFFFFFFFFFCLL);
      int v15 = 1;
      int v36 = lseek(v4, 0LL, 1);
      unsigned int v16 = *(_DWORD *)(v7 + 2088);
      if (v16 <= 1) {
        unint64_t v17 = 1LL;
      }
      else {
        unint64_t v17 = v16;
      }
      int v18 = v14[2];
      uint64_t v19 = malloc(1035LL * v17 + 8);
      int v20 = malloc(8LL * v17);
      LODWORD(v21) = 0;
      float v22 = v14;
      do
      {
        unsigned int v23 = v15;
        if (v17 <= v21)
        {
          int v20 = realloc(v20, 16 * v17);
          v17 *= 2LL;
        }

        *((void *)v20 + v21) = v22;
        float v22 = (void *)*v22;
        size_t v21 = (v21 + 1);
        ++v15;
      }

      while (v22);
      qsort(v20, v21, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeScoreCompare);
      uint64_t v5 = a3;
      unsigned int v24 = 0;
      if ((_DWORD)v21)
      {
        uint64_t v25 = v23;
        uint64_t v26 = (uint64_t *)v20;
        do
        {
          uint64_t v27 = *v26++;
          size_t v28 = (char *)v19 + v24;
          size_t v29 = *(unsigned __int16 *)(v27 + 20);
          *((_WORD *)v28 + 8) = v29;
          *((_DWORD *)v28 + 2) = *(_DWORD *)(v27 + 12);
          *((_DWORD *)v28 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = *(_DWORD *)(v27 + 16);
          memcpy(v28 + 18, (const void *)(v27 + 22), v29);
          v24 += v29 + 10;
          --v25;
        }

        while (v25);
      }

      size_t v30 = (v24 + 11LL) & 0x1FFFFFFFCLL;
      *uint64_t v19 = v24;
      v19[1] = v18;
      uint64_t v4 = __fd;
      write(__fd, v19, v30);
      free(v20);
      free(v19);
      do
      {
        int v31 = *(_DWORD **)v14;
        free(v14);
        int v14 = v31;
      }

      while (v31);
      uint64_t *v11 = (v36 - a3) | 2LL;
      uint64_t v7 = a1;
      uint64_t v6 = a2;
    }

    else if (v13 == 1)
    {
      nlp::serializeListsRanked(v7, v10 & 0xFFFFFFFFFFFFFFFCLL, v5, v4);
    }

    ++v8;
  }

  while (v8 != 256);
}

void nlp::serializeLists(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v7 = 0LL;
  unsigned int __fd = a4;
  do
  {
    uint64_t v8 = v6 + 8 * v7;
    uint64_t v11 = *(void *)(v8 + 4);
    uint64_t v10 = (uint64_t *)(v8 + 4);
    uint64_t v9 = v11;
    uint64_t v12 = v11 & 3;
    if (v12 == 2)
    {
      uint64_t v13 = (void *)(v9 & 0xFFFFFFFFFFFFFFFCLL);
      int v41 = lseek(v4, 0LL, 1);
      unsigned int v14 = *(_DWORD *)(a1 + 2088);
      if (v14 <= 1) {
        unint64_t v15 = 1LL;
      }
      else {
        unint64_t v15 = v14;
      }
      unsigned int v16 = malloc(1031LL * v15 + 4);
      unint64_t v17 = malloc(8LL * v15);
      unsigned int v18 = 0;
      if (v13)
      {
        uint64_t v19 = v13;
        do
        {
          if (v15 <= v18)
          {
            unint64_t v17 = realloc(v17, 16 * v15);
            v15 *= 2LL;
          }

          *((void *)v17 + v18) = v19;
          uint64_t v19 = (void *)*v19;
          ++v18;
        }

        while (v19);
      }

      int v20 = *(_DWORD *)(a1 + 2064);
      if ((v20 & 4) != 0)
      {
        uint64_t v28 = v18;
        qsort(v17, v18, 8uLL, (int (__cdecl *)(const void *, const void *))nlp::nodeStringCompare);
        if (v18)
        {
          uint64_t v29 = 0LL;
          unsigned int v23 = 0;
          uint64_t v30 = 0LL;
          do
          {
            uint64_t v31 = v30;
            uint64_t v30 = *((void *)v17 + v29);
            if (v31)
            {
              uint64_t v32 = 0LL;
              uint64_t v33 = *(unsigned __int16 *)(v30 + 12);
              unsigned int v34 = *(_WORD *)(v30 + 12);
              while (v33 != v32)
              {
                if (*(unsigned __int16 *)(v31 + 12) <= (unsigned __int16)v32
                  || *(unsigned __int8 *)(v30 + 14 + v32) != *(unsigned __int8 *)(v31 + 14 + v32))
                {
                  unsigned int v34 = v32;
                  break;
                }

                if (++v32 == 255)
                {
                  unsigned int v34 = 255;
                  break;
                }
              }
            }

            else
            {
              unsigned int v34 = 0;
              LOWORD(v3std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = *(_WORD *)(v30 + 12);
            }

            int v35 = (char *)v16 + v23;
            unsigned __int16 v36 = v33 - v34;
            *((_WORD *)v35 + 4) = v36;
            *((_DWORD *)v35 + 1) = *(_DWORD *)(v30 + 8);
            v35[10] = v34;
            memcpy(v35 + 11, (const void *)(v30 + v34 + 14), v36);
            unsigned int v23 = v23 - v34 + *(unsigned __int16 *)(v30 + 12) + 7;
            ++v29;
          }

          while (v29 != v28);
        }

        else
        {
          unsigned int v23 = 0;
        }

        uint64_t v27 = 10LL;
      }

      else
      {
        uint64_t v21 = v18;
        if ((v20 & 1) != 0) {
          float v22 = (int (__cdecl *)(const void *, const void *))nlp::nodeScoreCompare;
        }
        else {
          float v22 = (int (__cdecl *)(const void *, const void *))nlp::nodeStringCompare;
        }
        qsort(v17, v18, 8uLL, v22);
        unsigned int v23 = 0;
        if (v18)
        {
          unsigned int v24 = (uint64_t *)v17;
          do
          {
            uint64_t v25 = *v24++;
            uint64_t v26 = (char *)v16 + v23;
            *((_WORD *)v26 + 4) = *(_WORD *)(v25 + 12);
            *((_DWORD *)v26 + 1) = *(_DWORD *)(v25 + 8);
            memcpy(v26 + 10, (const void *)(v25 + 14), *(unsigned __int16 *)(v25 + 12));
            v23 += *(unsigned __int16 *)(v25 + 12) + 6;
            --v21;
          }

          while (v21);
        }

        uint64_t v27 = 7LL;
      }

      uint64_t v4 = __fd;
      uint64_t v5 = a3;
      _DWORD *v16 = v23;
      write(__fd, v16, (v27 + v23) & 0x1FFFFFFFCLL);
      free(v17);
      free(v16);
      do
      {
        unsigned int v37 = (void *)*v13;
        free(v13);
        uint64_t v13 = v37;
      }

      while (v37);
      *uint64_t v10 = (v41 - a3) | 2LL;
      uint64_t v6 = a2;
    }

    else if (v12 == 1)
    {
      nlp::serializeLists(a1, v9 & 0xFFFFFFFFFFFFFFFCLL, v5, v4);
    }

    ++v7;
  }

  while (v7 != 256);
}

uint64_t nlp::serializeLevelsRanked(_DWORD *a1, uint64_t a2, uint64_t a3, int a4, int a5, int *a6)
{
  int v38 = a4;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  int32x4_t v10 = 0uLL;
  for (uint64_t i = 3LL; i != 515; i += 8LL)
    int32x4_t v10 = vsubq_s32( v10,  (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32( (int32x4_t)vceqzq_s64(*(int64x2_t *)&a1[i]),  (int32x4_t)vceqzq_s64(*(int64x2_t *)&a1[i + 4]))));
  unsigned int v12 = vaddvq_s32(v10);
  if (v12 > 0xC7) {
    a5 = 1;
  }
  unsigned int v37 = a5;
  if ((a5 & 1) != 0)
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = *a6;
    *a6 = v15 + 1036;
    do
    {
      uint64_t v16 = *(void *)&a1[2 * v14 + 3];
      if ((v16 & 3) == 1)
      {
        int v17 = *a6;
        else {
          int v18 = v17 | 3;
        }
        v39[v14] = v18;
      }

      else
      {
        v39[v14] = v16;
      }

      ++v14;
    }

    while (v14 != 256);
    v39[256] = a1[2];
    uint64_t v40 = *(void *)a1;
    off_t v19 = v15 + a2;
    int v20 = (int8x16_t *)v39;
    int v21 = a3;
    size_t v22 = 1036LL;
  }

  else
  {
    uint64_t v36 = v12;
    size_t v23 = 4LL * v12 + 44;
    uint64_t v24 = *a6;
    MEMORY[0x1895F8858]();
    uint64_t v26 = (int8x16_t *)((char *)&v34 - v25);
    bzero((char *)&v34 - v25, v23);
    uint64_t v27 = 0LL;
    int v28 = 0;
    uint64_t v34 = v24;
    size_t v35 = v23;
    *a6 = v24 + v23;
    do
    {
      uint64_t v29 = *(void *)&a1[2 * v27 + 3];
      if (v29)
      {
        v26->i64[v27 >> 6] |= 1LL << v27;
        uint64_t v30 = &v26->i8[4 * v28];
        if ((v29 & 3) == 1)
        {
          int v31 = *a6;
          else {
            int v32 = v31 | 3;
          }
          *((_DWORD *)v30 + 11) = v32;
        }

        else
        {
          *((_DWORD *)v30 + 11) = v29;
        }

        ++v28;
      }

      ++v27;
    }

    while (v27 != 256);
    if (vaddvq_s32( vuzp1q_s32( (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*v26)))),  (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(v26[1])))))) != (_DWORD)v36) {
      nlp::serializeLevelsRanked();
    }
    v26[2].i32[2] = a1[2];
    v26[2].i64[0] = *(void *)a1;
    size_t v22 = v35;
    off_t v19 = v34 + a2;
    int v21 = a3;
    int v20 = v26;
  }

  pwrite(v21, v20, v22, v19);
  if (v38) {
    free(a1);
  }
  return v37;
}

uint64_t nlp::serializeLevels(_DWORD *a1, uint64_t a2, uint64_t a3, int a4, int a5, int *a6)
{
  int v39 = a4;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  int32x4_t v10 = 0uLL;
  for (uint64_t i = 1LL; i != 513; i += 8LL)
    int32x4_t v10 = vsubq_s32( v10,  (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32( (int32x4_t)vceqzq_s64(*(int64x2_t *)&a1[i]),  (int32x4_t)vceqzq_s64(*(int64x2_t *)&a1[i + 4]))));
  unsigned int v12 = vaddvq_s32(v10);
  if (v12 > 0xC7) {
    a5 = 1;
  }
  unsigned int v38 = a5;
  if ((a5 & 1) != 0)
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = *a6;
    *a6 = v15 + 1028;
    do
    {
      uint64_t v16 = *(void *)&a1[2 * v14 + 1];
      if ((v16 & 3) == 1)
      {
        int v17 = *a6;
        else {
          int v18 = v17 | 3;
        }
        v40[v14] = v18;
      }

      else
      {
        v40[v14] = v16;
      }

      ++v14;
    }

    while (v14 != 256);
    v40[256] = *a1;
    off_t v19 = v15 + a2;
    int v20 = (int8x16_t *)v40;
    int v21 = a3;
    size_t v22 = 1028LL;
  }

  else
  {
    uint64_t v37 = v12;
    size_t v23 = 4LL * v12 + 36;
    uint64_t v24 = *a6;
    MEMORY[0x1895F8858]();
    uint64_t v26 = (int8x16_t *)((char *)&v34 - v25);
    bzero((char *)&v34 - v25, v23);
    uint64_t v27 = 0LL;
    int v28 = 0;
    uint64_t v35 = v24;
    size_t v36 = v23;
    *a6 = v24 + v23;
    do
    {
      uint64_t v29 = *(void *)&a1[2 * v27 + 1];
      if (v29)
      {
        v26->i64[v27 >> 6] |= 1LL << v27;
        uint64_t v30 = &v26->i8[4 * v28];
        if ((v29 & 3) == 1)
        {
          int v31 = *a6;
          else {
            int v32 = v31 | 3;
          }
          *((_DWORD *)v30 + 9) = v32;
        }

        else
        {
          *((_DWORD *)v30 + 9) = v29;
        }

        ++v28;
      }

      ++v27;
    }

    while (v27 != 256);
    if (vaddvq_s32( vuzp1q_s32( (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*v26)))),  (int32x4_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(v26[1])))))) != (_DWORD)v37) {
      nlp::serializeLevels();
    }
    v26[2].i32[0] = *a1;
    size_t v22 = v36;
    off_t v19 = v35 + a2;
    int v21 = a3;
    int v20 = v26;
  }

  pwrite(v21, v20, v22, v19);
  if (v39) {
    free(a1);
  }
  return v38;
}

void *nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 2080)) {
      nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>();
    }
    uint64_t v2 = calloc(0x28uLL, 1uLL);
    if (nlp::burstTrieSetCursor(a1, (uint64_t)v2))
    {
      v2[1] = a2 | 1;
      *((_DWORD *)v2 + 5) = *(_DWORD *)(a2 + 8);
      *((_DWORD *)v2 + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = *(_DWORD *)(a2 + 4);
    }

    else if (v2)
    {
      free(v2);
      return 0LL;
    }
  }

  return v2;
}

uint64_t std::vector<std::tuple<std::string,unsigned int,float>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 5)
  {
    if (a2 >> 59) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 32 * v6;
    std::vector<std::tuple<std::string,unsigned int,float>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v7);
  }

  return result;
}

void sub_187448CF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_18A04EA30;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A04EA30;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( uint64_t result)
{
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

uint64_t std::vector<std::tuple<std::string,unsigned int,float>>::__swap_out_circular_buffer( uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,float>>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>>( (uint64_t)(a1 + 2),  a1[1],  a1[1],  *a1,  *a1,  a2[1],  a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,float>>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }

  else
  {
    uint64_t v8 = a7;
    do
    {
      __int128 v9 = *(_OWORD *)(a3 - 32);
      *(void *)(v8 - 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = *(void *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(void *)(a3 - 24) = 0LL;
      *(void *)(a3 - 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = 0LL;
      *(void *)(a3 - 32) = 0LL;
      *(void *)(v8 - ++**(_DWORD **)(result + 8) = *(void *)(a3 - 8);
      v8 -= 32LL;
      v7 -= 32LL;
      a3 -= 32LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }

  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,float>>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,float>>,std::reverse_iterator<std::tuple<std::string,unsigned int,float>*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void *std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_18A04EAC0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A04EAC0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( uint64_t a1, uint64_t a2, void **a3, unsigned int *a4, int *a5, int *a6)
{
  int v6 = *a5;
  int v7 = *a6;
  uint64_t v8 = *(uint64_t **)(a1 + 8);
  std::string::basic_string[abi:ne180100](__p, *a3, *a4);
  unint64_t v9 = v8[1];
  unint64_t v10 = v8[2];
  if (v9 >= v10)
  {
    uint64_t v12 = (uint64_t)(v9 - *v8) >> 5;
    unint64_t v13 = v12 + 1;
    uint64_t v14 = v10 - *v8;
    if (v14 >> 4 > v13) {
      unint64_t v13 = v14 >> 4;
    }
    else {
      unint64_t v15 = v13;
    }
    v23[4] = v8 + 2;
    if (v15) {
      uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>( (uint64_t)(v8 + 2),  v15);
    }
    else {
      uint64_t v16 = 0LL;
    }
    int v17 = &v16[32 * v12];
    v23[0] = v16;
    v23[1] = v17;
    v23[3] = &v16[32 * v15];
    __int128 v18 = *(_OWORD *)__p;
    *((void *)v17 + 2) = v22;
    *(_OWORD *)int v17 = v18;
    __p[1] = 0LL;
    uint64_t v22 = 0LL;
    __p[0] = 0LL;
    *((_DWORD *)v17 + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v6;
    *((_DWORD *)v17 + 7) = v7;
    v23[2] = v17 + 32;
    std::vector<std::tuple<std::string,unsigned int,float>>::__swap_out_circular_buffer(v8, v23);
    uint64_t v19 = v8[1];
    std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v23);
    int v20 = SHIBYTE(v22);
    v8[1] = v19;
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    __int128 v11 = *(_OWORD *)__p;
    *(void *)(v9 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v22;
    *(_OWORD *)unint64_t v9 = v11;
    *(_DWORD *)(v9 + 24) = v6;
    *(_DWORD *)(v9 + 2++**(_DWORD **)(result + 8) = v7;
    v8[1] = v9 + 32;
  }

void sub_1874490AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_RankedTrieLevel *,nlp::_RankedListNode *>(nlp::_BurstTrie *,std::vector<nlp::_RankedTrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    int v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000LL;
    char *__dst = v6;
  }

  else
  {
    *((_BYTE *)__dst + 2std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = __len;
    int v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void *nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_TrieLevel *>(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 2080)) {
      nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>();
    }
    uint64_t v2 = calloc(0x28uLL, 1uLL);
    if (nlp::burstTrieSetCursor(a1, (uint64_t)v2))
    {
      v2[1] = a2 | 1;
      *((_DWORD *)v2 + 5) = *(_DWORD *)a2;
    }

    else if (v2)
    {
      free(v2);
      return 0LL;
    }
  }

  return v2;
}

void *std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_18A04EB40;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A04EB40;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( uint64_t result)
{
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#1}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

void *std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_18A04EBC0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A04EBC0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( uint64_t a1, uint64_t a2, void **a3, unsigned int *a4, int *a5, int *a6)
{
  int v6 = *a5;
  int v7 = *a6;
  size_t v8 = *(uint64_t **)(a1 + 8);
  std::string::basic_string[abi:ne180100](__p, *a3, *a4);
  unint64_t v9 = v8[1];
  unint64_t v10 = v8[2];
  if (v9 >= v10)
  {
    uint64_t v12 = (uint64_t)(v9 - *v8) >> 5;
    unint64_t v13 = v12 + 1;
    uint64_t v14 = v10 - *v8;
    if (v14 >> 4 > v13) {
      unint64_t v13 = v14 >> 4;
    }
    else {
      unint64_t v15 = v13;
    }
    v23[4] = v8 + 2;
    if (v15) {
      uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>( (uint64_t)(v8 + 2),  v15);
    }
    else {
      uint64_t v16 = 0LL;
    }
    int v17 = &v16[32 * v12];
    v23[0] = v16;
    v23[1] = v17;
    v23[3] = &v16[32 * v15];
    __int128 v18 = *(_OWORD *)__p;
    *((void *)v17 + 2) = v22;
    *(_OWORD *)int v17 = v18;
    __p[1] = 0LL;
    uint64_t v22 = 0LL;
    __p[0] = 0LL;
    *((_DWORD *)v17 + std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v6;
    *((_DWORD *)v17 + 7) = v7;
    v23[2] = v17 + 32;
    std::vector<std::tuple<std::string,unsigned int,float>>::__swap_out_circular_buffer(v8, v23);
    uint64_t v19 = v8[1];
    std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v23);
    int v20 = SHIBYTE(v22);
    v8[1] = v19;
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    __int128 v11 = *(_OWORD *)__p;
    *(void *)(v9 + 1std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)this + 6) = v22;
    *(_OWORD *)unint64_t v9 = v11;
    *(_DWORD *)(v9 + 24) = v6;
    *(_DWORD *)(v9 + 2++**(_DWORD **)(result + 8) = v7;
    v8[1] = v9 + 32;
  }

void sub_18744949C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2},std::allocator<void nlp::reverseBurst<nlp::_TrieLevel *,nlp::_ListNode *>(nlp::_BurstTrie *,std::vector<nlp::_TrieLevel *> const&,unsigned char const*,unsigned int)::{lambda(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)#2}>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

__n128 std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = off_18A04EC40;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + ++**(_DWORD **)(result + 8) = result;
  *((void *)v2 + std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::__clone( uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_18A04EC40;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + ++**(_DWORD **)(result + 8) = result;
  return result;
}

void std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::operator()( uint64_t a1, uint64_t a2, const void **a3, unsigned int *a4, int *a5, int *a6, uint64_t *a7)
{
  size_t v8 = *a3;
  size_t v9 = *a4;
  int v10 = *a5;
  int v11 = *a6;
  uint64_t v12 = *a7;
  size_t v13 = *(unsigned int *)(a1 + 16);
  size_t v14 = (v13 + v9);
  unint64_t v15 = (char *)operator new[]((int)v14);
  memcpy(v15, *(const void **)(a1 + 8), v13);
  memcpy(&v15[v13], v8, v9);
  v15[(int)v14] = 0;
  uint64_t v16 = malloc(v14 + 21);
  v16[4] = v14;
  *((_BYTE *)v16 + v14 + 20) = 0;
  memcpy(v16 + 5, v15, v14);
  _DWORD *v16 = v11;
  v16[2] = v10;
  v16[3] = 1;
  std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>::operator()(*(void *)(a1 + 24), 0LL, (uint64_t)v16, v12);
  int v17 = v16[3] - 1;
  v16[3] = v17;
  if (!v17) {
    free(v16);
  }
  operator delete[](v15);
}

uint64_t std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0,std::allocator<nlp::BurstTrieSearch(nlp::_BurstTrie const*,unsigned char const*,unsigned int,void *,std::function<void ()(void *,nlp::_TrieCompletion *,BOOL *)>,int)::$_0>,void ()(void *,unsigned char const*,unsigned int,unsigned int,float,BOOL *)>::target_type()
{
}

void encoder_save_model_to_file_pointer_cold_1()
{
  __assert_rtn("crf1de_write_external_attribute_model", "crf1d_encode.c", 694, "feature->type == FT_TRANS");
}

void crf1dm_initialize_state_scores_cold_1()
{
}

void crf1dm_initialize_state_scores_cold_2()
{
}

void cmw_write_attribute_feature_cold_1()
{
  __assert_rtn( "cmw_write_attribute_feature",  "crf1d_model.c",  1614,  "fwrite(&feature, 1, sizeof(compact_attribute_feature_t), concrete_writer->fp) == sizeof(compact_attribute_feature_t)");
}

void qmw_write_label_features_cold_1()
{
  __assert_rtn("qmw_write_label_features", "crf1d_model.c", 1724, "num_labels <= 255");
}

void qmw_write_attribute_feature_counts_and_offsets_cold_1()
{
  __assert_rtn("qmw_write_attribute_feature_counts_and_offsets", "crf1d_model.c", 1778, "feature_counts[i] <= 255");
}

void qmw_write_attribute_feature_cold_1()
{
  __assert_rtn("qmw_write_attribute_feature", "crf1d_model.c", 1792, "destination <= 255");
}

void qmw_write_attribute_feature_cold_2()
{
  __assert_rtn( "qmw_write_attribute_feature",  "crf1d_model.c",  1799,  "fwrite(&feature, 1, sizeof(quantized_attribute_feature_t), concrete_writer->fp) == sizeof(quantized_attribute_feature_t)");
}

void ME_Efficient_Model_Trainer::ME_FeatureBag::Feature()
{
  __assert_rtn("Feature", "efficient_maxent.h", 181, "id >= 0 && id < (int)id2mef.size()");
}

void ME_Efficient_Model_Trainer::FunctionGradient()
{
  __assert_rtn("FunctionGradient", "efficient_maxent.cpp", 36, "(int)_fb.Size() == x.size()");
}

void ME_Efficient_Model_Trainer::classify()
{
  __assert_rtn("classify", "efficient_maxent.cpp", 156, "_num_classes == (int)membp.size()");
}

void ME_Efficient_Model_Trainer::StringBag::Str()
{
  __assert_rtn("Str", "efficient_maxent.h", 235, "id >= 0 && id < (int)id2str.size()");
}

void ME_Efficient_Model::conditional_probability()
{
  __assert_rtn("conditional_probability", "efficient_maxent.cpp", 678, "prod != 0");
}

{
  __assert_rtn("conditional_probability", "efficient_maxent.cpp", 686, "max_label >= 0");
}

void ME_Efficient_Model::classify()
{
  __assert_rtn("classify", "efficient_maxent.cpp", 693, "num_classes() == (int)membp.size()");
}

void ME_Efficient_Model_Trainer::ME_Feature::ME_Feature()
{
  __assert_rtn("ME_Feature", "efficient_maxent.h", 147, "l >= 0 && l <= MAX_LABEL_TYPES");
}

{
  __assert_rtn("ME_Feature", "efficient_maxent.h", 148, "f >= 0 && f <= 0xffffff");
}

void Vec::operator+=()
{
  __assert_rtn("operator+=", "mathvec.h", 21, "b.Size() == _v.size()");
}

void crf_paragraph_get_id_cold_1()
{
  __assert_rtn( "crf_paragraph_get_id",  "backward_compatibility.c",  61,  "index >= 0 && index < paragraph->num_items*paragraph->num_attrs");
}

void crf_paragraph_set_id_cold_1()
{
  __assert_rtn("crf_paragraph_set_id", "backward_compatibility.c", 73, "index >= 0");
}

void nlp::addListNode()
{
  __assert_rtn("addListNode", "BurstTrie.cpp", 578, "listcount <= trie->reserved[ContainerSize]");
}

void nlp::addListNodeRanked()
{
  __assert_rtn("addListNodeRanked", "BurstTrie.cpp", 717, "listcount <= trie->reserved[ContainerSize]");
}

void nlp::advanceMapCursorTrieList()
{
  __assert_rtn("advanceMapCursorTrieList", "BurstTrie.cpp", 1855, "cursor->prfxlen <= head->restlen");
}

void nlp::serializeLevelsRanked()
{
  __assert_rtn("serializeLevelsRanked", "BurstTrie.cpp", 3661, "bitcount == count");
}

void nlp::serializeLevels()
{
  __assert_rtn("serializeLevels", "BurstTrie.cpp", 3522, "bitcount == count");
}

void nlp::burstTrieCreateCursorWithTrieLevelRef<nlp::_RankedTrieLevel *>()
{
  __assert_rtn("burstTrieCreateCursorWithTrieLevelRef", "BurstTrie.cpp", 2634, "nullptr == trie->mapbase");
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
}

Boolean CFBinaryHeapContainsValue(CFBinaryHeapRef heap, const void *value)
{
  return MEMORY[0x189602778](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate( CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x189602780](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x189602788](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x189602790](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1896142A0](__n);
}

void std::__rs_default::~__rs_default(std::__rs_default *this)
{
}

std::__rs_default::result_type std::__rs_default::operator()(std::__rs_default *this)
{
  return MEMORY[0x1896142B0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1896142D0](this, __s);
}

std::string *__cdecl std::string::append( std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142D8](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1896142F0](this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x189614358](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1896143B0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1896143B8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1896143C8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1896143D0]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1896143F0]();
}

{
  return MEMORY[0x189614400]();
}

{
  return MEMORY[0x189614418]();
}

void std::locale::~locale(std::locale *this)
{
}

uint64_t std::__rs_get()
{
  return MEMORY[0x189614600]();
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x189614650](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x189614658](retstr, *(void *)&__val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_18A04E338(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A04E340(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1896147F0](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double atof(const char *a1)
{
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

clock_t clock(void)
{
  return MEMORY[0x1895FA558]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void exit(int a1)
{
}

double exp(double a1)
{
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1895FB290](a1, *(void *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB410](a1, a2);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1895FB420](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1895FB470](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x1895FB518](a1);
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1895FB720](a1);
}

double log(double a1)
{
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int posix_memalign(void **__memptr, size_t __alignment, size_t __size)
{
  return MEMORY[0x1895FC7D8](__memptr, __alignment, __size);
}

double pow(double a1, double a2)
{
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FCBA0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int rand(void)
{
  return MEMORY[0x1895FCBE8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FD068](__dst, __src);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

double strtod(const char *a1, char **a2)
{
  return result;
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x1895FD170](__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FD2A8](*(void *)&a1);
}

double tanh(double a1)
{
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

FILE *tmpfile(void)
{
  return (FILE *)MEMORY[0x1895FD420]();
}

int vsprintf(char *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD618](a1, a2, a3);
}