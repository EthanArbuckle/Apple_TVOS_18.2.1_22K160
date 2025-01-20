void *sub_1879B5FDC(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int64_t v4;
  void *result;
  int v6;
  v2 = *(void *)(a1 + 96);
  v3 = *(const void **)(a1 + 88);
  v4 = *(void *)(a1 + 104) - (void)v3;
  *(void *)(a1 + 912) = v4 >> 2;
  *(_DWORD *)(a1 + 920) = (unint64_t)(v2 - (void)v3) >> 2;
  result = memcpy(*(void **)(a1 + 928), v3, v4);
  v6 = *(_DWORD *)(a1 + 124);
  if (v6) {
    v6 = *(_DWORD *)(a1 + 128);
  }
  *(_DWORD *)(a1 + 992) = v6;
  *(_DWORD *)(a1 + 996) = *(_DWORD *)(a1 + 1000);
  *(void *)(a1 + 968) = *(void *)(a1 + 960);
  *(_BYTE *)(a1 + 984) = *(_BYTE *)(a1 + 137);
  *(_DWORD *)(a1 + 988) = *(_DWORD *)(a1 + 140);
  return result;
}

void *sub_1879B6050(uint64_t a1, const void *a2, int a3)
{
  result = memcpy(*(void **)(a1 + 936), a2, 4LL * a3);
  *(void *)(a1 + 944) = *(void *)(a1 + 936) + 4LL * a3;
  return result;
}

uint64_t sub_1879B6088(uint64_t result, int a2)
{
  uint64_t v2 = result;
  uint64_t v3 = a2;
  v4 = *(_DWORD **)(result + 104);
  if ((unint64_t)&v4[a2] >= *(void *)(result + 112))
  {
    result = sub_1879B60F8(result, a2);
    if (!(_DWORD)result) {
      return result;
    }
    v4 = *(_DWORD **)(v2 + 104);
  }

  unint64_t v5 = *(void *)(v2 + 96);
  if (v5 < (unint64_t)v4)
  {
    v6 = v4;
    do
    {
      v6[v3] = *v6;
      --v6;
    }

    while ((unint64_t)v6 >= v5);
  }

  *(void *)(v2 + 104) = &v4[v3];
  return result;
}

uint64_t sub_1879B60F8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 112);
  v4 = *(void **)(a1 + 88);
  uint64_t v5 = (v3 - (uint64_t)v4) >> 2;
  uint64_t v6 = v5 + 2;
  uint64_t v7 = 2 * (v5 + 2);
  if (v5 + 2 >= a2)
  {
    uint64_t v8 = 2 * (v5 + 2);
  }

  else
  {
    do
    {
      uint64_t v8 = v7;
      unint64_t v9 = v7 - v6;
      v7 *= 2LL;
    }

    while (v9 < a2);
  }

  uint64_t result = (uint64_t)realloc(v4, 4 * v8);
  if (result)
  {
    uint64_t v11 = result;
    bzero((void *)(result + 4 * v6), 4 * (v8 - v6));
    uint64_t v12 = *(void *)(a1 + 88);
    uint64_t v13 = v11 + *(void *)(a1 + 96) - v12;
    *(void *)(a1 + 88) = v11;
    *(void *)(a1 + 96) = v13;
    *(void *)(a1 + 104) = v11 + *(void *)(a1 + 104) - v12;
    *(void *)(a1 + 112) = v11 + 4 * v5;
    uint64_t result = (uint64_t)realloc(*(void **)(a1 + 936), 4 * v8);
    if (result)
    {
      uint64_t v14 = result;
      bzero((void *)(result + 4 * v6), 4 * (v8 - v6));
      uint64_t v15 = *(void *)(a1 + 936);
      *(void *)(a1 + 936) = v14;
      *(void *)(a1 + 944) = v14 + *(void *)(a1 + 944) - v15;
      *(void *)(a1 + 952) = *(void *)(a1 + 88) + *(void *)(a1 + 952) - v12;
      uint64_t result = (uint64_t)realloc(*(void **)(a1 + 928), 4 * v8);
      if (result)
      {
        uint64_t v16 = result;
        bzero((void *)(result + 4 * v6), 4 * (v8 - v6));
        *(void *)(a1 + 928) = v16;
        uint64_t result = (uint64_t)realloc(*(void **)(a1 + 960), 4 * v8);
        if (result)
        {
          uint64_t v17 = *(void *)(a1 + 960);
          *(void *)(a1 + 968) = result + *(void *)(a1 + 968) - v17;
          *(void *)(a1 + 976) = result + *(void *)(a1 + 976) - v17;
          *(void *)(a1 + 960) = result;
          uint64_t result = sub_1879BA1A0(a1, v5 + 2, v8);
          if ((_DWORD)result)
          {
            *(void *)(a1 + 112) = *(void *)(a1 + 88) + 4 * v8 - 8;
            v18 = *(void (**)(uint64_t, void))(a1 + 1032);
            if (v18) {
              v18(a1, *(void *)(a1 + 1040));
            }
            return 1LL;
          }
        }
      }
    }
  }

  return result;
}

void *sub_1879B6298(void *result, unsigned int a2)
{
  uint64_t v2 = result;
  uint64_t v3 = result[12];
  unint64_t v4 = result[13];
  unint64_t v5 = v3 + 4LL * (int)a2;
  unint64_t v6 = (v4 - v3) >> 2;
  if (v5 <= v4) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = v6;
  }
  if (result[133] != result[134])
  {
    sub_1879B5FDC((uint64_t)result);
    uint64_t result = memcpy((void *)v2[117], (const void *)v2[12], 4LL * (int)v7);
    v2[118] = v2[117] + 4LL * (int)v7;
  }

  if ((int)v7 >= 1)
  {
    unint64_t v9 = (_DWORD *)v2[12];
    unint64_t v8 = v2[13];
    while ((unint64_t)v9 <= v8)
    {
      *unint64_t v9 = v9[v7];
      ++v9;
    }

    v2[13] = v8 - 4 * v7;
  }

  return result;
}

uint64_t sub_1879B6328(uint64_t result)
{
  uint64_t v2 = *(_DWORD **)(result + 96);
  unint64_t v1 = *(void *)(result + 104);
  if ((unint64_t)v2 <= v1)
  {
    uint64_t v3 = *(_DWORD **)(result + 96);
    do
    {
      int v4 = v3[1];
      ++v3;
      *uint64_t v2 = v4;
      uint64_t v2 = v3;
    }

    while ((unint64_t)v3 <= v1);
  }

  *(void *)(result + 104) = v1 - 4;
  return result;
}

void *sub_1879B6358(void *result, unsigned int a2)
{
  uint64_t v2 = result;
  unint64_t v4 = result[11];
  uint64_t v3 = result[12];
  unint64_t v5 = v3 - 4LL * (int)a2;
  unint64_t v6 = (v3 - v4) >> 2;
  if (v5 >= v4) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = v6;
  }
  if (result[133] != result[134])
  {
    sub_1879B5FDC((uint64_t)result);
    uint64_t result = memcpy((void *)v2[117], (const void *)(v2[12] - 4LL * (int)v7), 4LL * (int)v7);
    v2[118] = v2[117] + 4LL * (int)v7;
  }

  if ((int)v7 >= 1)
  {
    unint64_t v8 = (_DWORD *)v2[12];
    unint64_t v9 = v2[13];
    if ((unint64_t)&v8[-v7] <= v9)
    {
      do
      {
        v8[-v7] = *v8;
        ++v8;
      }

      while ((unint64_t)&v8[-v7] <= v9);
    }

    v2[13] = v9 - 4LL * v7;
  }

  return result;
}

uint64_t sub_1879B6408(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 104);
  uint64_t v2 = (_DWORD *)(*(void *)(result + 96) - 4LL);
  if ((unint64_t)v2 <= v1)
  {
    unint64_t v3 = *(void *)(result + 96) - 4LL;
    do
    {
      int v4 = *(_DWORD *)(v3 + 4);
      v3 += 4LL;
      *uint64_t v2 = v4;
      uint64_t v2 = (_DWORD *)v3;
    }

    while (v3 <= v1);
  }

  *(void *)(result + 104) = v1 - 4;
  return result;
}

BOOL sub_1879B643C(unsigned int a1)
{
  if (a1 > 0x7F)
  {
    if (__maskrune(a1, 0x500uLL)) {
      return 1LL;
    }
  }

  else if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * a1 + 60) & 0x500) != 0)
  {
    return 1LL;
  }

  return wcschr(dword_1879CA7E0, a1) != 0LL;
}

uint64_t sub_1879B64AC(unsigned int a1)
{
  if (a1 > 0x7F)
  {
    if (__maskrune(a1, 0x500uLL)) {
      return 1LL;
    }
    int v3 = __maskrune(a1, 0x800uLL);
    return 2 * (v3 != 0);
  }

  uint64_t result = 1LL;
  if (a1 != 95 && (*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * a1 + 60) & 0x500) == 0)
  {
    int v3 = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * a1 + 60) & 0x800;
    return 2 * (v3 != 0);
  }

  return result;
}

BOOL sub_1879B6530(unsigned int a1)
{
  if (a1 > 0x7F) {
    int v1 = __maskrune(a1, 0x4000uLL);
  }
  else {
    int v1 = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * a1 + 60) & 0x4000;
  }
  return v1 == 0;
}

unsigned int *sub_1879B6570(uint64_t a1, unint64_t a2, int a3, unsigned int (*a4)(void))
{
  unint64_t v5 = (unsigned int *)(a1 - 4);
  if (a3)
  {
    int v7 = a3;
    do
    {
      --v7;
    }

    while (v7);
  }

  else {
    return (unsigned int *)a2;
  }
}

unsigned int *sub_1879B65EC( unsigned int *a1, unint64_t a2, int a3, unsigned int (*a4)(void))
{
  if (a3)
  {
    int v7 = a3;
    do
    {
      --v7;
    }

    while (v7);
  }

  else {
    return (unsigned int *)a2;
  }
}

unsigned int *sub_1879B6664( uint64_t a1, unsigned int *a2, unint64_t a3, int a4, uint64_t (*a5)(void))
{
  if (a4)
  {
    int v8 = a4;
    uint64_t v10 = MEMORY[0x1895F8770];
    while (1)
    {
      int v11 = a5(*a2);
      if ((unint64_t)a2 < a3)
      {
        int v12 = v11;
        do
        {
          ++a2;
        }

        while ((unint64_t)a2 < a3);
      }

      if (!--v8) {
        break;
      }
      while ((unint64_t)a2 < a3)
      {
LABEL_15:
        uint64_t v14 = *a2;
        if (v14 > 0x7F)
        {
          if (!__maskrune(v14, 0x4000uLL)) {
            break;
          }
        }

        else if ((*(_DWORD *)(v10 + 4 * v14 + 60) & 0x4000) == 0)
        {
          break;
        }

        ++a2;
      }

      if (!v8) {
        goto LABEL_20;
      }
    }
  }

LABEL_20:
  else {
    return (unsigned int *)a3;
  }
}

unsigned int *sub_1879B6744(uint64_t a1, unint64_t a2, int a3, uint64_t (*a4)(void))
{
  unint64_t v5 = (unsigned int *)(a1 - 4);
  if (a3)
  {
    int v7 = a3;
    uint64_t v8 = MEMORY[0x1895F8770];
    while (1)
    {
      uint64_t v9 = *v5;
      if (v9 > 0x7F)
      {
        if (!__maskrune(v9, 0x4000uLL)) {
          goto LABEL_8;
        }
LABEL_6:
        --v5;
      }

      else
      {
        if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000) != 0) {
          goto LABEL_6;
        }
LABEL_8:
        int v10 = a4(*v5);
        if ((unint64_t)v5 >= a2)
        {
          int v11 = v10;
          do
          {
            --v5;
          }

          while ((unint64_t)v5 >= a2);
        }

        if (!--v7) {
          break;
        }
      }
    }
  }

  else {
    return (unsigned int *)a2;
  }
}

uint64_t sub_1879B6804(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 1000);
  if ((v2 & 2) != 0) {
    *(void *)(result + 1064) = *(void *)(result + 1056);
  }
  int v3 = *(char **)(result + 1008);
  if (v3)
  {
    else {
      signed int v4 = (*(void *)(result + 96) - (void)v3) >> 2;
    }
    *(void *)(result + 96) = v3;
    if ((v2 & 4) != 0)
    {
      if (v4 < 1)
      {
        v3 += 4 * v4;
        signed int v4 = -v4;
      }

      uint64_t result = (uint64_t)memcpy(*(void **)(result + 936), v3, 4LL * v4);
      *(void *)(v1 + 944) = *(void *)(v1 + 936) + 4LL * v4;
    }

    else if (v4 < 1)
    {
      uint64_t result = (uint64_t)sub_1879B6358((void *)result, -v4);
      *(void *)(v1 + 96) += 4LL * v4;
    }

    else
    {
      sub_1879B6298((void *)result, v4);
      uint64_t result = sub_1879C1CAC(v1);
    }

    *(_DWORD *)(v1 + 1000) = 0;
  }

  return result;
}

unsigned int *sub_1879B68B8(uint64_t a1, unint64_t a2, int a3, uint64_t (*a4)(void))
{
  signed int v4 = (unsigned int *)(a1 + 4);
  if (a3)
  {
    int v6 = a3;
    uint64_t v8 = MEMORY[0x1895F8770];
    while (1)
    {
      uint64_t v9 = *v4;
      if (v9 > 0x7F)
      {
        if (!__maskrune(v9, 0x4000uLL)) {
          goto LABEL_8;
        }
LABEL_6:
        ++v4;
      }

      else
      {
        if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x4000) != 0) {
          goto LABEL_6;
        }
LABEL_8:
        int v10 = a4(*v4);
        if ((unint64_t)v4 < a2)
        {
          int v11 = v10;
          do
          {
            ++v4;
          }

          while ((unint64_t)v4 < a2);
        }

        if (!--v6) {
          return v4 - 1;
        }
      }
    }
  }

  return v4 - 1;
}

uint64_t sub_1879B6970(uint64_t a1)
{
  int v2 = (char *)malloc(0x1000uLL);
  *(void *)(a1 + 88) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = v2;
  bzero(v2, 0x1000uLL);
  *(void *)(a1 + 96) = v3;
  *(void *)(a1 + 104) = v3;
  *(void *)(a1 + 112) = v3 + 4088;
  signed int v4 = malloc(0x1000uLL);
  *(void *)(a1 + 928) = v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  bzero(v4, 0x1000uLL);
  *(void *)(a1 + 912) = -1LL;
  *(_DWORD *)(a1 + 920) = 0;
  unint64_t v5 = (char *)malloc(0x1000uLL);
  *(void *)(a1 + 960) = v5;
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 968) = v5;
  *(void *)(a1 + 976) = v5 + 4096;
  *(_BYTE *)(a1 + 984) = 34;
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 1008) = v3;
  int v6 = malloc(0x1000uLL);
  *(void *)(a1 + 936) = v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  int v7 = v6;
  bzero(v6, 0x1000uLL);
  *(void *)(a1 + 952) = v3;
  *(void *)(a1 + 944) = v7;
  *(void *)(a1 + 1040) = 0LL;
  *(void *)(a1 + 1032) = 0LL;
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  *(_OWORD *)(a1 + 120) = xmmword_1879CA7D0;
  *(_BYTE *)(a1 + 136) = 34;
  *(void *)(a1 + 1016) = 0xFFFFFFFFLL;
  uint64_t v8 = malloc(0x50uLL);
  *(void *)(a1 + 1024) = v8;
  if (v8) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_1879B6A74(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 88);
  *(void *)(a1 + 96) = v2;
  *(void *)(a1 + 104) = v2;
  *(void *)(a1 + 912) = -1LL;
  *(_DWORD *)(a1 + 920) = 0;
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 1008) = v2;
  *(void *)(a1 + 952) = v2;
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  *(_OWORD *)(a1 + 120) = xmmword_1879CA7D0;
  *(_BYTE *)(a1 + 136) = 34;
  *(_DWORD *)(a1 + 1176) = 0;
  if (a2)
  {
    while (1)
    {
      unsigned int v4 = *(_DWORD *)(a1 + 1016);
      if ((v4 & 0x80000000) != 0) {
        break;
      }
      uint64_t v5 = *(void *)(a1 + 1024);
      *(_DWORD *)(a1 + 1016) = v4 - 1;
      free(*(void **)(v5 + 8LL * v4));
    }
  }
}

void sub_1879B6AF4(uint64_t a1)
{
  *(void *)(a1 + 88) = 0LL;
  *(void *)(a1 + 112) = 0LL;
  free(*(void **)(a1 + 928));
  *(void *)(a1 + 928) = 0LL;
  free(*(void **)(a1 + 960));
  *(void *)(a1 + 968) = 0LL;
  *(void *)(a1 + 960) = 0LL;
  *(void *)(a1 + 976) = 0LL;
  *(_BYTE *)(a1 + 984) = 34;
  free(*(void **)(a1 + 936));
  *(void *)(a1 + 936) = 0LL;
  sub_1879B6A74(a1, 1);
  free(*(void **)(a1 + 1024));
  *(void *)(a1 + 1024) = 0LL;
}

int el_winsertstr(EditLine *a1, const __int32 *a2)
{
  if (!a2) {
    return -1;
  }
  size_t v4 = wcslen(a2);
  if (!v4) {
    return -1;
  }
  int v5 = v4;
  sub_1879B6088((uint64_t)a1, v5);
  __int32 v6 = *a2;
  if (!*a2) {
    return 0;
  }
  int v7 = (__int32 *)*((void *)a1 + 12);
  uint64_t v8 = a2 + 1;
  do
  {
    *v7++ = v6;
    __int32 v9 = *v8++;
    __int32 v6 = v9;
  }

  while (v9);
  int result = 0;
  *((void *)a1 + 12) = v7;
  return result;
}

void el_deletestr(EditLine *a1, int a2)
{
  if (a2 >= 1 && *((void *)a1 + 12) >= *((void *)a1 + 11) + 4 * (unint64_t)a2)
  {
    uint64_t v3 = a2;
    sub_1879B6358(a1, a2);
    unint64_t v4 = *((void *)a1 + 12) - 4 * v3;
    if (v4 < *((void *)a1 + 11)) {
      unint64_t v4 = *((void *)a1 + 11);
    }
    *((void *)a1 + 12) = v4;
  }

uint64_t sub_1879B6C64(uint64_t a1, uint64_t a2, __int32 *a3)
{
  int v5 = *(__int32 **)(a1 + 88);
  if (a3)
  {
    size_t v7 = wcslen(a3);
    memcpy(v5, a3, 4 * v7);
    v5 += v7;
  }

  *int v5 = 32;
  *(void *)(a1 + 96) = v5;
  *(void *)(a1 + 104) = v5 + 1;
  sub_1879C0FDC(a1);
  if (el_wgetc((EditLine *)a1, &v14) == 1)
  {
    uint64_t v8 = 0LL;
    do
    {
      __int32 v9 = v14;
      if (v14 <= 12)
      {
        if (v14 == 8)
        {
LABEL_13:
          if (!v8) {
            goto LABEL_23;
          }
          *(v5 - 1) = 32;
          *(void *)(a1 + 96) = v5 - 1;
          *(void *)(a1 + 104) = v5;
          sub_1879C0FDC(a1);
          int v11 = el_wgetc((EditLine *)a1, &v14);
          --v5;
          continue;
        }

        if (v14 == 10) {
          goto LABEL_24;
        }
      }

      else
      {
        if (v14 == 127) {
          goto LABEL_13;
        }
        if (v14 == 13 || v14 == 27)
        {
LABEL_24:
          *(_DWORD *)(a2 + 4 * v8) = v14;
          goto LABEL_25;
        }
      }

      if (v8 < 1008)
      {
        *(_DWORD *)(a2 + 4 * v8) = v14;
        *v5++ = v9;
        ++v8;
      }

      else
      {
        el_beep_0((EditLine *)a1);
      }

      *int v5 = 32;
      *(void *)(a1 + 96) = v5;
      *(void *)(a1 + 104) = v5 + 1;
      sub_1879C0FDC(a1);
      int v11 = el_wgetc((EditLine *)a1, &v14);
    }

    while (v11 == 1);
  }

  sub_1879B6E24(a1);
LABEL_23:
  uint64_t v8 = -1LL;
LABEL_25:
  int v12 = *(_DWORD **)(a1 + 88);
  *int v12 = 0;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v12;
  return v8;
}

uint64_t sub_1879B6DCC(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 88);
  uint64_t v1 = *(void *)(a1 + 96);
  if (v1 == v2) {
    return 0LL;
  }
  uint64_t v3 = -4LL;
  do
  {
    uint64_t v4 = v3;
    int v5 = (int *)(v1 + v3);
    int v6 = *v5;
    uint64_t v3 = v4 - 4;
  }

  while (v6 != 10);
  return ((unint64_t)-v4 >> 2) - 1;
}

uint64_t sub_1879B6E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 1032) = a2;
  *(void *)(a1 + 1040) = a3;
  return 0LL;
}

uint64_t sub_1879B6E24(uint64_t a1)
{
  **(_DWORD **)(a1 + 104) = 0;
  return 2LL;
}

uint64_t sub_1879B6E50(uint64_t a1, int a2)
{
  if (!a2) {
    return 6LL;
  }
  int v4 = *(_DWORD *)(a1 + 128);
  if ((unint64_t)(*(void *)(a1 + 104) + 4LL * v4) >= *(void *)(a1 + 112)
    && !sub_1879B60F8(a1, v4))
  {
    return 6LL;
  }

  int v5 = *(_DWORD *)(a1 + 120);
  if (v4 == 1)
  {
    if (!v5 || (int v6 = *(_DWORD **)(a1 + 96), (unint64_t)v6 >= *(void *)(a1 + 104)))
    {
      sub_1879B6088(a1, 1);
      int v6 = *(_DWORD **)(a1 + 96);
    }

    _DWORD *v6 = a2;
    *(void *)(a1 + 96) = v6 + 1;
    sub_1879C1E08(a1);
  }

  else
  {
    if (v5 != 2) {
      sub_1879B6088(a1, *(_DWORD *)(a1 + 128));
    }
    if (v4)
    {
      __int32 v9 = *(_DWORD **)(a1 + 96);
      unint64_t v8 = *(void *)(a1 + 104);
      do
      {
        *v9++ = a2;
        *(void *)(a1 + 96) = v9;
        --v4;
      }

      while (v4);
    }

    sub_1879C0FDC(a1);
  }

  if (*(_DWORD *)(a1 + 120) == 2) {
    return sub_1879C731C(a1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1879B6F4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 == v3) {
    return 6LL;
  }
  int v4 = sub_1879B6570(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_1879B643C);
  int v5 = v4;
  int v6 = *(_DWORD **)(a1 + 936);
  unint64_t v7 = *(void *)(a1 + 96);
  if ((unint64_t)v4 < v7)
  {
    unint64_t v8 = v4;
    do
    {
      int v9 = *v8++;
      *v6++ = v9;
    }

    while ((unint64_t)v8 < v7);
  }

  *(void *)(a1 + 944) = v6;
  sub_1879B6358((void *)a1, (v7 - (unint64_t)v4) >> 2);
  int v10 = *(unsigned int **)(a1 + 88);
  if (v5 >= v10) {
    int v10 = v5;
  }
  *(void *)(a1 + 96) = v10;
  return 4LL;
}

uint64_t sub_1879B6FE0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (v2 == *(void *)(a1 + 104))
  {
    if (*(_DWORD *)(a1 + 1096) != 1 || v2 == *(void *)(a1 + 88)) {
      return 6LL;
    }
    *(void *)(a1 + 96) = v2 - 4;
  }

  sub_1879B6298((void *)a1, *(_DWORD *)(a1 + 128));
  if (*(_DWORD *)(a1 + 1096) == 1)
  {
    unint64_t v4 = *(void *)(a1 + 96);
    unint64_t v3 = *(void *)(a1 + 104);
    if (v4 >= v3 && v4 > *(void *)(a1 + 88)) {
      *(void *)(a1 + 96) = v3 - 4;
    }
  }

  return 4LL;
}

uint64_t sub_1879B7070(void *a1)
{
  uint64_t v1 = (_DWORD *)a1[117];
  unint64_t v2 = a1[12];
  unint64_t v3 = a1[13];
  if (v2 < v3)
  {
    unint64_t v4 = (int *)a1[12];
    do
    {
      int v5 = *v4++;
      *v1++ = v5;
    }

    while ((unint64_t)v4 < v3);
  }

  a1[118] = v1;
  a1[13] = v2;
  return 4LL;
}

uint64_t sub_1879B70A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 104);
  *(void *)(a1 + 96) = v1;
  if (*(_DWORD *)(a1 + 1096) == 1)
  {
    if (*(_DWORD *)(a1 + 1000))
    {
      sub_1879B6804(a1);
      return 4LL;
    }

    *(void *)(a1 + 96) = v1 - 4;
  }

  return 5LL;
}

uint64_t sub_1879B70E8(uint64_t a1)
{
  uint64_t v1 = *(unsigned int **)(a1 + 88);
  *(void *)(a1 + 96) = v1;
  if (*(_DWORD *)(a1 + 1096) != 1) {
    return 5LL;
  }
  uint64_t v3 = MEMORY[0x1895F8770];
  while (1)
  {
    uint64_t v4 = *v1;
    if ((*(_DWORD *)(v3 + 4 * v4 + 60) & 0x4000) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v1 = (unsigned int *)(*(void *)(a1 + 96) + 4LL);
    *(void *)(a1 + 96) = v1;
  }

  if (__maskrune(v4, 0x4000uLL)) {
    goto LABEL_7;
  }
LABEL_8:
  if (*(_DWORD *)(a1 + 1000))
  {
    sub_1879B6804(a1);
    return 4LL;
  }

  return 5LL;
}

uint64_t sub_1879B7178(void *a1)
{
  unint64_t v1 = a1[12];
  unint64_t v2 = a1[13];
  uint64_t v3 = a1[11];
  if (v1 < v2)
  {
    if (v2 <= v3 + 4) {
      return 6LL;
    }
    v1 += 4LL;
    a1[12] = v1;
  }

  if (v1 > v3 + 4)
  {
    *(int32x2_t *)(v1 - 8) = vrev64_s32(*(int32x2_t *)(v1 - 8));
    return 4LL;
  }

  return 6LL;
}

uint64_t sub_1879B71C4(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 96);
  unint64_t v1 = *(void *)(a1 + 104);
  if (v2 >= v1) {
    return 6LL;
  }
  int v3 = *(_DWORD *)(a1 + 1096);
  if (v2 == v1 - 4)
  {
    if (v3 != 1)
    {
      unint64_t v7 = v2 + 4LL * *(int *)(a1 + 128);
      if (v7 <= v1) {
        unint64_t v1 = v7;
      }
      *(void *)(a1 + 96) = v1;
      return 5LL;
    }

    if (*(_DWORD *)(a1 + 1000))
    {
      unint64_t v5 = v2 + 4LL * *(int *)(a1 + 128);
      if (v5 <= v1) {
        unint64_t v1 = v5;
      }
      *(void *)(a1 + 96) = v1;
LABEL_12:
      if (*(_DWORD *)(a1 + 1000))
      {
        sub_1879B6804(a1);
        return 4LL;
      }

      return 5LL;
    }

    return 6LL;
  }

  unint64_t v4 = v2 + 4LL * *(int *)(a1 + 128);
  if (v4 <= v1) {
    unint64_t v1 = v4;
  }
  *(void *)(a1 + 96) = v1;
  if (v3 == 1) {
    goto LABEL_12;
  }
  return 5LL;
}

uint64_t sub_1879B7268(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 == v3) {
    return 6LL;
  }
  *(void *)(a1 + 96) = sub_1879B6570( v2,  v3,  *(_DWORD *)(a1 + 128),  (unsigned int (*)(void))sub_1879B643C);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879B72D8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 88);
  unint64_t v2 = *(void *)(a1 + 96);
  if (v2 <= v1) {
    return 6LL;
  }
  unint64_t v3 = v2 - 4LL * *(int *)(a1 + 128);
  if (v3 >= v1) {
    unint64_t v1 = v3;
  }
  *(void *)(a1 + 96) = v1;
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879B7334(uint64_t a1)
{
  int v2 = el_wgetc((EditLine *)a1, &v5);
  int v3 = v5;
  sub_1879C66BC(a1);
  if (v2 == 1) {
    return sub_1879B6E50(a1, v3);
  }
  sub_1879C1C0C(a1);
  **(_DWORD **)(a1 + 104) = 0;
  return 2LL;
}

uint64_t sub_1879B73AC(uint64_t a1, unsigned int a2)
{
  if (a2 > 0xFF || (*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * a2 + 60) & 0x400) == 0) {
    return 6LL;
  }
  if (!*(_DWORD *)(a1 + 124)) {
    return sub_1879B6E50(a1, a2);
  }
  if (*(_BYTE *)(a1 + 136) == 52)
  {
    int v3 = a2 - 48;
  }

  else
  {
    int v4 = *(_DWORD *)(a1 + 128);
    if (v4 > 1000000) {
      return 6LL;
    }
    int v3 = a2 + 10 * v4 - 48;
  }

  *(_DWORD *)(a1 + 128) = v3;
  return 3LL;
}

uint64_t sub_1879B741C(uint64_t a1, unsigned int a2)
{
  if (a2 > 0xFF || (*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * a2 + 60) & 0x400) == 0) {
    return 6LL;
  }
  if (*(_DWORD *)(a1 + 124))
  {
    int v2 = *(_DWORD *)(a1 + 128);
    if (v2 > 1000000) {
      return 6LL;
    }
    *(_DWORD *)(a1 + 128) = a2 + 10 * v2 - 48;
  }

  else
  {
    *(_DWORD *)(a1 + 124) = 1;
    *(_DWORD *)(a1 + 128) = a2 - 48;
  }

  return 3LL;
}

uint64_t sub_1879B7484()
{
  return 6LL;
}

uint64_t sub_1879B748C()
{
  return 0LL;
}

uint64_t sub_1879B7494()
{
  return 0LL;
}

uint64_t sub_1879B749C()
{
  return 0LL;
}

uint64_t sub_1879B74A4()
{
  return 0LL;
}

uint64_t sub_1879B74AC()
{
  return 0LL;
}

uint64_t sub_1879B74B4()
{
  return 0LL;
}

uint64_t sub_1879B74BC()
{
  return 0LL;
}

uint64_t sub_1879B74C4(uint64_t a1)
{
  int v2 = *(void **)(a1 + 104);
  *int v2 = 10LL;
  *(void *)(a1 + 104) = (char *)v2 + 4;
  return 1LL;
}

uint64_t sub_1879B74FC(uint64_t a1)
{
  if (*(void *)(a1 + 96) <= *(void *)(a1 + 88)) {
    return 6LL;
  }
  sub_1879B6358((void *)a1, *(_DWORD *)(a1 + 128));
  unint64_t v2 = *(void *)(a1 + 96) - 4LL * *(int *)(a1 + 128);
  if (v2 < *(void *)(a1 + 88)) {
    unint64_t v2 = *(void *)(a1 + 88);
  }
  *(void *)(a1 + 96) = v2;
  return 4LL;
}

uint64_t sub_1879B7550(void *a1)
{
  return 4LL;
}

uint64_t sub_1879B757C()
{
  return 8LL;
}

uint64_t sub_1879B7584(uint64_t a1)
{
  return 4LL;
}

uint64_t sub_1879B75A0()
{
  return 0LL;
}

uint64_t sub_1879B75A8(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1176);
  *(void *)(a1 + 912) = -1LL;
  **(_DWORD **)(a1 + 104) = 0;
  int v3 = *(_DWORD *)(a1 + 1176);
  if (!v3)
  {
    wcsncpy(*(__int32 **)(a1 + 1152), *(const __int32 **)(a1 + 88), 0x400uLL);
    *(void *)(a1 + 1168) = *(void *)(a1 + 1152) + *(void *)(a1 + 104) - *(void *)(a1 + 88);
    int v3 = *(_DWORD *)(a1 + 1176);
  }

  *(_DWORD *)(a1 + 1176) = v3 + *(_DWORD *)(a1 + 128);
  if (*(_DWORD *)(a1 + 1096) == 1) {
    *(_DWORD *)(a1 + 1176) = v2;
  }
  sub_1879B9DF0(a1);
  return 9LL;
}

uint64_t sub_1879B764C(uint64_t a1)
{
  *(void *)(a1 + 912) = -1LL;
  **(_DWORD **)(a1 + 104) = 0;
  int v1 = *(_DWORD *)(a1 + 128);
  int v2 = *(_DWORD *)(a1 + 1176);
  BOOL v3 = __OFSUB__(v2, v1);
  int v5 = v2 - v1;
  char v4 = (v5 < 0) ^ v3;
  int v6 = v5 & ~(v5 >> 31);
  if (v4) {
    unsigned int v7 = 9;
  }
  else {
    unsigned int v7 = 4;
  }
  *(_DWORD *)(a1 + 1176) = v6;
  LODWORD(result) = sub_1879B9DF0(a1);
  if ((_DWORD)result == 4) {
    return v7;
  }
  else {
    return result;
  }
}

uint64_t sub_1879B76A0(size_t a1)
{
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 912) = -1LL;
  **(_DWORD **)(a1 + 104) = 0;
  int v2 = *(_DWORD *)(a1 + 1176);
  if (v2 < 0)
  {
    *(_DWORD *)(a1 + 1176) = 0;
    return 6LL;
  }

  if (!v2)
  {
    wcsncpy(*(__int32 **)(a1 + 1152), *(const __int32 **)(a1 + 88), 0x400uLL);
    *(void *)(a1 + 1168) = *(void *)(a1 + 1152) + *(void *)(a1 + 104) - *(void *)(a1 + 88);
  }

  uint64_t v3 = *(void *)(a1 + 1184);
  if (!v3) {
    return 6LL;
  }
  if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
  {
    char v4 = sub_1879B9FB4(a1, 3LL);
    if (v4) {
      goto LABEL_12;
    }
    return 6LL;
  }

  char v4 = *(__int32 **)(a1 + 1208);
  if (!v4) {
    return 6LL;
  }
LABEL_12:
  sub_1879C22EC(a1);
  if (*(int *)(a1 + 1176) >= 1)
  {
    int v6 = 0;
    do
    {
      if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
      {
        char v4 = sub_1879B9FB4(a1, 6LL);
      }

      else if ((*(unsigned int (**)(void, size_t, uint64_t))(a1 + 1192))( *(void *)(a1 + 1184),  a1 + 1200,  6LL) == -1)
      {
        char v4 = 0LL;
      }

      else
      {
        char v4 = *(__int32 **)(a1 + 1208);
      }

      ++v6;
    }

    while (v6 < *(_DWORD *)(a1 + 1176));
    if (v4)
    {
      int v7 = v6 + 1;
      goto LABEL_23;
    }

    return 6LL;
  }

  int v7 = 1;
LABEL_23:
  while (!wcsncmp(v4, *(const __int32 **)(a1 + 88), (uint64_t)(*(void *)(a1 + 104) - *(void *)(a1 + 88)) >> 2)
       && !*(__int32 *)((char *)v4 + *(void *)(a1 + 104) - *(void *)(a1 + 88))
       || !sub_1879C22DC(a1, v4))
  {
    if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
    {
      char v4 = sub_1879B9FB4(a1, 6LL);
    }

    else
    {
      char v4 = *(__int32 **)(a1 + 1208);
    }

    ++v7;
    if (!v4) {
      return 6LL;
    }
  }

  *(_DWORD *)(a1 + 1176) = v7;
  return sub_1879B9DF0(a1);
}

uint64_t sub_1879B78A4(size_t a1)
{
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 912) = -1LL;
  **(_DWORD **)(a1 + 104) = 0;
  if (!*(_DWORD *)(a1 + 1176)) {
    return 6LL;
  }
  uint64_t v2 = *(void *)(a1 + 1184);
  if (!v2) {
    return 6LL;
  }
  if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
  {
    uint64_t v3 = sub_1879B9FB4(a1, 3LL);
    if (!v3) {
      return 6LL;
    }
  }

  else
  {
    uint64_t v3 = *(__int32 **)(a1 + 1208);
    if (!v3) {
      return 6LL;
    }
  }

  sub_1879C22EC(a1);
  if (*(int *)(a1 + 1176) >= 2)
  {
    int v4 = 0;
    int v5 = 2;
    do
    {
      if (wcsncmp(v3, *(const __int32 **)(a1 + 88), (uint64_t)(*(void *)(a1 + 104) - *(void *)(a1 + 88)) >> 2)
        || *(__int32 *)((char *)v3 + *(void *)(a1 + 104) - *(void *)(a1 + 88)))
      {
      }

      if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
      {
        uint64_t v3 = sub_1879B9FB4(a1, 6LL);
      }

      else
      {
        if ((*(unsigned int (**)(void, size_t, uint64_t))(a1 + 1192))( *(void *)(a1 + 1184),  a1 + 1200,  6LL) == -1) {
          break;
        }
        uint64_t v3 = *(__int32 **)(a1 + 1208);
      }

      if (v5 >= *(_DWORD *)(a1 + 1176)) {
        break;
      }
      ++v5;
    }

    while (v3);
    if (v4) {
      goto LABEL_23;
    }
  }

  if (sub_1879C22DC(a1, *(__int32 **)(a1 + 1152)))
  {
    int v4 = 0;
LABEL_23:
    *(_DWORD *)(a1 + 1176) = v4;
    return sub_1879B9DF0(a1);
  }

  return 6LL;
}

uint64_t sub_1879B7A40(uint64_t a1)
{
  int v2 = sub_1879B6DCC(a1);
  unint64_t v3 = *(void *)(a1 + 88);
  int v4 = *(_DWORD **)(a1 + 96);
  if (*v4 == 10) {
    uint64_t v5 = -1LL;
  }
  else {
    uint64_t v5 = 0LL;
  }
  for (i = &v4[v5]; (unint64_t)i >= v3; --i)
  {
    if (*i == 10)
    {
      int v7 = *(_DWORD *)(a1 + 128);
      *(_DWORD *)(a1 + 128) = v7 - 1;
      if (v7 < 2) {
        goto LABEL_11;
      }
    }
  }

LABEL_11:
  int v9 = i - 1;
  do
  {
    int v10 = v9;
    --v9;
  }

  while (*v10 != 10);
  int v11 = v10 + 1;
  do
  {
    int v12 = v11;
    BOOL v13 = __OFSUB__(v2--, 1);
    if (v2 < 0 != v13) {
      break;
    }
    ++v11;
  }

  while (*v12 != 10);
  *(void *)(a1 + 96) = v12;
  return 5LL;
}

  int v4 = 0LL;
  v8[0] = v2;
  v8[2] = 0;
  do
  {
    uint64_t v5 = *(unsigned __int8 *)(v3 + 128 + v4);
    if (v5 > 0x22 || ((1LL << v5) & 0x401000100LL) == 0)
    {
      v8[1] = v4;
      int v7 = (const __int32 **)sub_1879BB3AC(a1, v5);
      sub_1879BB4F4(a1, v8, v7, 0);
    }

    ++v4;
  }

  while (v4 != 128);
  *(_BYTE *)(v3 + v8[0]) = 24;
}

uint64_t sub_1879B7B0C(uint64_t a1)
{
  int v2 = sub_1879B6DCC(a1);
  int v4 = *(_DWORD **)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  while ((unint64_t)v4 < v3)
  {
    if (*v4 == 10)
    {
      int v5 = *(_DWORD *)(a1 + 128);
      *(_DWORD *)(a1 + 128) = v5 - 1;
      if (v5 < 2) {
        goto LABEL_8;
      }
    }

    ++v4;
  }

LABEL_8:
  int v7 = v4 + 1;
  do
  {
    unint64_t v8 = v7;
    BOOL v9 = __OFSUB__(v2--, 1);
    if (v2 < 0 != v9) {
      break;
    }
    ++v7;
  }

  while (*v8 != 10);
  *(void *)(a1 + 96) = v8;
  return 5LL;
}

        ++v1;
        *v4++ = v5;
      }
    }
  }

  return result;
}

uint64_t sub_1879B7BA4()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v1 = sub_1879B6C64(v0, (uint64_t)v3, dword_1879CA810);
  sub_1879C3A7C(v0, 0xAu);
  *(void *)(v0 + 1064) = *(void *)(v0 + 1056);
  sub_1879C1C74(v0);
  return 4LL;
}

EditLine *__cdecl el_init(const char *a1, FILE *a2, FILE *a3, FILE *a4)
{
  unint64_t v8 = malloc(0x548uLL);
  uint64_t v9 = (uint64_t)v8;
  if (!v8) {
    return (EditLine *)v9;
  }
  bzero(v8, 0x548uLL);
  *(void *)(v9 + 8) = a2;
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  *(_DWORD *)(v9 + 32) = fileno(a2);
  *(_DWORD *)(v9 + 36) = fileno(a3);
  *(_DWORD *)(v9 + 40) = fileno(a4);
  int v10 = sub_1879C7E88((__int32 *)a1, v9 + 1264);
  int v11 = sub_1879C8C44(v10);
  *(void *)uint64_t v9 = v11;
  if (!v11)
  {
LABEL_13:
    free((void *)v9);
    return 0LL;
  }

  *(_DWORD *)(v9 + 44) = 0;
  int v12 = setlocale(2, 0LL);
  if (v12 && (strcmp(v12, "C") || setlocale(2, (const char *)&unk_1879D0D1A)))
  {
    BOOL v13 = nl_langinfo(0);
    if (!strcmp(v13, "UTF-8")) {
      *(_DWORD *)(v9 + 44) |= 0x10u;
    }
  }

  if (sub_1879C3030((void *)v9) == -1)
  {
    free(*(void **)v9);
    goto LABEL_13;
  }

  sub_1879BB2D8(v9);
  sub_1879BBD24(v9);
  sub_1879B6970(v9);
  sub_1879C21C8(v9);
  sub_1879B9D68((void *)v9);
  sub_1879BCF04(v9);
  sub_1879C2D1C(v9);
  sub_1879BCFE4(v9);
  return (EditLine *)v9;
}

void el_end(EditLine *a1)
{
  if (a1)
  {
    sub_1879C6578((uint64_t)a1);
    sub_1879B6A74((uint64_t)a1, 0);
    sub_1879C34B4((uint64_t)a1);
    sub_1879BB348((uint64_t)a1);
    sub_1879BBEA0((uint64_t)a1);
    sub_1879C5EA4((uint64_t)a1);
    sub_1879B6AF4((uint64_t)a1);
    sub_1879C2218((uint64_t)a1);
    sub_1879B9DB8((uint64_t)a1);
    nullsub_1(a1);
    sub_1879C2DB0((uint64_t)a1);
    free(*(void **)a1);
    free(*((void **)a1 + 158));
    free(*((void **)a1 + 160));
    free(*((void **)a1 + 162));
    free(*((void **)a1 + 164));
    free(a1);
  }

void el_reset(EditLine *a1)
{
}

int el_wset(EditLine *a1, int a2, ...)
{
  v20 = va_arg(va1, char *);
  v21 = va_arg(va1, FILE *);
  uint64_t v22 = va_arg(va1, void);
  v19[20] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return -1;
  }
  va_copy(v18, va);
  int result = -1;
  switch(a2)
  {
    case 0:
    case 12:
      int v7 = (__int32 *)v20;
      unint64_t v8 = a1;
      int v9 = 0;
      return sub_1879BCF54((uint64_t)v8, v7, v9, a2, 1);
    case 1:
      return sub_1879C31CC((uint64_t)a1, v20);
    case 2:
      return sub_1879BC124((uint64_t)a1, (__int32 *)v20);
    case 3:
      int v10 = *((_DWORD *)a1 + 11);
      int result = 0;
      if ((_DWORD)v20) {
        unsigned int v11 = v10 | 1;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      goto LABEL_39;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      for (uint64_t i = 1LL; i != 20; ++i)
      {
        uint64_t v6 = va_arg(v18, void);
        v19[i] = v6;
        if (!v6) {
          break;
        }
      }

      switch(a2)
      {
        case 4:
          v19[0] = &unk_1879CA854;
          int result = sub_1879BC1C8();
          break;
        case 5:
          v19[0] = &unk_1879CA868;
          int result = sub_1879C4BF8((uint64_t)a1);
          break;
        case 6:
          v19[0] = &unk_1879CA884;
          int result = sub_1879C4DC0((uint64_t)a1, i, (uint64_t)v19);
          break;
        case 7:
          v19[0] = &unk_1879CA89C;
          int result = sub_1879C504C((uint64_t)a1, i, (uint64_t)v19);
          break;
        case 8:
          v19[0] = &unk_1879CA8B8;
          int result = sub_1879C671C((uint64_t)a1, i, (uint64_t)v19);
          break;
        default:
          abort();
      }

      return result;
    case 9:
      return sub_1879BC768((uint64_t)a1, (uint64_t)v20, (uint64_t)v21, v22);
    case 10:
      int result = sub_1879B9DE0((uint64_t)a1, (uint64_t)v20, (uint64_t)v21);
      unsigned int v11 = *((_DWORD *)a1 + 11) & 0xFFFFFFBF;
      goto LABEL_39;
    case 11:
      int v12 = *((_DWORD *)a1 + 11);
      int result = 0;
      if ((_DWORD)v20) {
        unsigned int v11 = v12 & 0xFFFFFFFB;
      }
      else {
        unsigned int v11 = v12 | 4;
      }
      goto LABEL_39;
    case 13:
      int result = sub_1879BD1DC((uint64_t)a1, (uint64_t (*)(uint64_t, __int32 *))v20);
      unsigned int v11 = *((_DWORD *)a1 + 11) & 0xFFFFFF7F;
LABEL_39:
      *((_DWORD *)a1 + 11) = v11;
      return result;
    case 14:
      int result = 0;
      *((void *)a1 + 10) = v20;
      return result;
    case 15:
      int v13 = *((_DWORD *)a1 + 11);
      if ((_DWORD)v20)
      {
        if ((v13 & 8) == 0)
        {
          *((_DWORD *)a1 + 11) = v13 | 8;
          sub_1879BD3B0((uint64_t)a1);
        }
      }

      else if ((v13 & 8) != 0)
      {
        *((_DWORD *)a1 + 11) = v13 & 0xFFFFFFF7;
        sub_1879BD434((uint64_t)a1);
      }

      return 0;
    case 16:
      if ((_DWORD)v20) {
        sub_1879C6088((uint64_t)a1);
      }
      else {
        sub_1879C6578((uint64_t)a1);
      }
      return 0;
    case 19:
      __int32 v14 = v21;
      if ((_DWORD)v20 == 2)
      {
        *((void *)a1 + 3) = v21;
        int v16 = fileno(v14);
        int result = 0;
        *((_DWORD *)a1 + 10) = v16;
      }

      else if ((_DWORD)v20 == 1)
      {
        *((void *)a1 + 2) = v21;
        int v17 = fileno(v14);
        int result = 0;
        *((_DWORD *)a1 + 9) = v17;
      }

      else
      {
        if ((_DWORD)v20) {
          return -1;
        }
        *((void *)a1 + 1) = v21;
        int v15 = fileno(v14);
        int result = 0;
        *((_DWORD *)a1 + 8) = v15;
      }

      break;
    case 20:
      sub_1879C1C74((uint64_t)a1);
      sub_1879C0FDC((uint64_t)a1);
      sub_1879C4B70((uint64_t)a1);
      return 0;
    case 21:
    case 22:
      int v7 = (__int32 *)v20;
      int v9 = (int)v21;
      unint64_t v8 = a1;
      return sub_1879BCF54((uint64_t)v8, v7, v9, a2, 1);
    case 23:
      return sub_1879B6E14((uint64_t)a1, (uint64_t)v20, (uint64_t)v21);
    default:
      return result;
  }

  return result;
}

int el_wget(EditLine *a1, int a2, ...)
{
  int v15 = va_arg(va1, void *);
  int v16 = va_arg(va1, uint64_t *);
  v14[20] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return -1;
  }
  va_copy(v13, va);
  int result = -1;
  switch(a2)
  {
    case 0:
    case 12:
      int v5 = v15;
      uint64_t v6 = a1;
      int v7 = 0LL;
      return sub_1879BCFA0((uint64_t)v6, v5, v7, a2);
    case 1:
      sub_1879C3FC8((uint64_t)a1, v15);
      return 0;
    case 2:
      return sub_1879BC18C((uint64_t)a1, v15);
    case 3:
      int result = 0;
      int v8 = *((_DWORD *)a1 + 11) & 1;
      goto LABEL_16;
    case 11:
      int result = 0;
      int v8 = ((*((_DWORD *)a1 + 11) >> 2) & 1) == 0;
      goto LABEL_16;
    case 13:
      uint64_t v9 = sub_1879BD1F8((uint64_t)a1);
      int result = 0;
      goto LABEL_13;
    case 14:
      int result = 0;
      uint64_t v9 = *((void *)a1 + 10);
LABEL_13:
      int v10 = v15;
      goto LABEL_14;
    case 15:
      int result = 0;
      int v8 = (*((_DWORD *)a1 + 11) >> 3) & 1;
LABEL_16:
      *(_DWORD *)int v15 = v8;
      return result;
    case 17:
      for (uint64_t i = 1LL; i != 20; ++i)
      {
        uint64_t v12 = va_arg(v13, void);
        v14[i] = v12;
        if (!v12) {
          break;
        }
      }

      v14[0] = aGettc;
      return sub_1879C4F38((uint64_t)a1, i, (uint64_t)v14);
    case 18:
      int v10 = v16;
      switch((_DWORD)v15)
      {
        case 2:
          int result = 0;
          uint64_t v9 = *((void *)a1 + 3);
          goto LABEL_14;
        case 1:
          int result = 0;
          uint64_t v9 = *((void *)a1 + 2);
          goto LABEL_14;
        case 0:
          int result = 0;
          uint64_t v9 = *((void *)a1 + 1);
LABEL_14:
          *int v10 = v9;
          return result;
      }

      break;
    case 21:
    case 22:
      int v5 = v15;
      int v7 = v16;
      uint64_t v6 = a1;
      return sub_1879BCFA0((uint64_t)v6, v5, v7, a2);
    default:
      return result;
  }

  return result;
}

const LineInfoW *__cdecl el_wline(EditLine *a1)
{
  return (const LineInfoW *)((char *)a1 + 88);
}

int el_source(EditLine *a1, const char *a2)
{
  if (a2)
  {
    unint64_t v3 = a2;
    uint64_t v4 = 0LL;
  }

  else
  {
    if (issetugid()) {
      return -1;
    }
    __int32 v14 = getenv("HOME");
    if (!v14) {
      return -1;
    }
    int v15 = v14;
    size_t v16 = strlen(v14) + 9;
    int v17 = (char *)malloc(v16);
    if (!v17) {
      return -1;
    }
    unint64_t v3 = v17;
    snprintf(v17, v16, "%s%s", v15, "/.editrc");
    uint64_t v4 = (char *)v3;
  }

  int v5 = fopen(v3, "r");
  if (!v5)
  {
    free(v4);
    return -1;
  }

  uint64_t v6 = v5;
  int v7 = 0;
  uint64_t v8 = MEMORY[0x1895F8770];
  while (1)
  {
    uint64_t v9 = (__int32 *)fgetln(v6, &v19);
    if (!v9) {
      break;
    }
    if (*(_BYTE *)v9 != 10)
    {
      int v10 = sub_1879C7E88(v9, (uint64_t)a1 + 1264);
      if (v10)
      {
        unsigned int v11 = v10;
        if (v19 && v10[v19 - 1] == 10) {
          --v19;
        }
        unsigned int v12 = *v10;
        if (v12)
        {
          while (v12 <= 0x7F)
          {
            if ((*(_DWORD *)(v8 + 4LL * v12 + 60) & 0x4000) == 0) {
              goto LABEL_19;
            }
LABEL_16:
            unsigned int v13 = v11[1];
            ++v11;
            unsigned int v12 = v13;
            if (!v13) {
              goto LABEL_17;
            }
          }

          if (__maskrune(v12, 0x4000uLL)) {
            goto LABEL_16;
          }
LABEL_19:
          if (*v11 != 35) {
            goto LABEL_17;
          }
        }

        else
        {
LABEL_17:
          int v7 = sub_1879BC97C(a1, v11);
          if (v7 == -1) {
            break;
          }
        }
      }
    }
  }

  free(v4);
  fclose(v6);
  return v7;
}

void el_resize(EditLine *a1)
{
  sigset_t v2 = 0x8000000;
  sigprocmask(1, &v2, &v3);
  sigprocmask(3, &v3, 0LL);
}

uint64_t sub_1879B8708(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 == 2)
  {
    if (a3)
    {
      int v5 = *(const __int32 **)(a3 + 8);
      if (v5)
      {
        if (!wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"o"))
        {
          *(_DWORD *)(a1 + 44) &= ~4u;
          sub_1879C6088(a1);
          return 0LL;
        }

        else if (!wcscmp(v5, (const __int32 *)"o"))
        {
          sub_1879C6578(a1);
          uint64_t result = 0LL;
          *(_DWORD *)(a1 + 44) |= 4u;
        }

        else
        {
          return 0xFFFFFFFFLL;
        }
      }
    }
  }

  return result;
}

uint64_t sub_1879B87BC(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 96);
  if (v3 == *(void *)(a1 + 104))
  {
    if (v3 == *(void *)(a1 + 88))
    {
      sub_1879C4B78(a1, a2);
      return 2LL;
    }

    else
    {
      el_beep_0((EditLine *)a1);
      return 6LL;
    }
  }

  else
  {
    if (*(_DWORD *)(a1 + 124)) {
      sub_1879B6298((void *)a1, *(_DWORD *)(a1 + 128));
    }
    else {
      sub_1879B6328(a1);
    }
    unint64_t v5 = *(void *)(a1 + 104);
    if (*(void *)(a1 + 96) > v5) {
      *(void *)(a1 + 96) = v5;
    }
    return 4LL;
  }

uint64_t sub_1879B8840(uint64_t a1)
{
  sigset_t v2 = *(unsigned int **)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  int v4 = sub_1879B65EC(v2, v3, *(_DWORD *)(a1 + 128), (unsigned int (*)(void))sub_1879B643C);
  unint64_t v5 = *(void *)(a1 + 96);
  uint64_t v6 = *(_DWORD **)(a1 + 936);
  if (v5 < (unint64_t)v4)
  {
    int v7 = *(unsigned int **)(a1 + 96);
    do
    {
      int v8 = *v7++;
      *v6++ = v8;
    }

    while (v7 < v4);
  }

  *(void *)(a1 + 944) = v6;
  sub_1879B6298((void *)a1, ((unint64_t)v4 - v5) >> 2);
  unint64_t v9 = *(void *)(a1 + 104);
  if (*(void *)(a1 + 96) > v9) {
    *(void *)(a1 + 96) = v9;
  }
  return 4LL;
}

uint64_t sub_1879B88D0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 944) - *(void *)(a1 + 936);
  if (!v1) {
    return 0LL;
  }
  if (*(void *)(a1 + 104) + v1 >= *(void *)(a1 + 112)) {
    return 6LL;
  }
  unint64_t v3 = *(_DWORD **)(a1 + 96);
  *(void *)(a1 + 952) = v3;
  sub_1879B6088(a1, v1 >> 2);
  int v4 = *(int **)(a1 + 936);
  unint64_t v5 = *(void *)(a1 + 944);
  while ((unint64_t)v4 < v5)
  {
    int v6 = *v4++;
    *v3++ = v6;
  }

  if (*(_DWORD *)(a1 + 128) == 1) {
    *(void *)(a1 + 96) = v3;
  }
  return 4LL;
}

uint64_t sub_1879B8960(void *a1)
{
  unint64_t v1 = a1[11];
  sigset_t v2 = (_DWORD *)a1[117];
  unint64_t v3 = a1[13];
  if (v1 < v3)
  {
    int v4 = (int *)a1[11];
    do
    {
      int v5 = *v4++;
      *v2++ = v5;
    }

    while ((unint64_t)v4 < v3);
  }

  a1[118] = v2;
  a1[12] = v1;
  a1[13] = v1;
  return 4LL;
}

uint64_t sub_1879B8998(void *a1)
{
  unint64_t v1 = a1[119];
  if (!v1) {
    return 6LL;
  }
  unint64_t v3 = a1[12];
  int v4 = (_DWORD *)a1[117];
  if (v1 <= v3)
  {
    int v7 = (int *)a1[119];
    if (v1 < v3)
    {
      do
      {
        int v8 = *v7++;
        *v4++ = v8;
      }

      while ((unint64_t)v7 < v3);
    }

    a1[118] = v4;
    sub_1879B6358(a1, ((unint64_t)v7 - v1) >> 2);
    a1[12] = a1[119];
  }

  else
  {
    uint64_t v5 = 0LL;
    do
    {
      v4[v5] = *(_DWORD *)(v3 + v5 * 4);
      ++v5;
    }

    while (v3 + v5 * 4 < v1);
    a1[118] = &v4[v5];
    sub_1879B6298(a1, (unint64_t)(v5 * 4) >> 2);
  }

  return 4LL;
}

uint64_t sub_1879B8A40(void *a1)
{
  unint64_t v1 = (int *)a1[119];
  if (!v1) {
    return 6LL;
  }
  sigset_t v2 = (int *)a1[12];
  unint64_t v3 = (_DWORD *)a1[117];
  if (v1 <= v2)
  {
    for (; v1 < v2; ++v3)
    {
      int v6 = *v1++;
      *unint64_t v3 = v6;
    }
  }

  else
  {
    do
    {
      int v4 = *v2++;
      *v3++ = v4;
    }

    while (v2 < v1);
  }

  uint64_t v5 = 0LL;
  a1[118] = v3;
  return v5;
}

uint64_t sub_1879B8A98(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 96);
  if (v1 <= *(void *)(a1 + 88) + 4LL) {
    return 6LL;
  }
  *(int32x2_t *)(v1 - 8) = vrev64_s32(*(int32x2_t *)(v1 - 8));
  return 4LL;
}

uint64_t sub_1879B8AC4(uint64_t a1)
{
  sigset_t v2 = *(unsigned int **)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  *(void *)(a1 + 96) = sub_1879B65EC( v2,  v3,  *(_DWORD *)(a1 + 128),  (unsigned int (*)(void))sub_1879B643C);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879B8B34(uint64_t a1)
{
  sigset_t v2 = sub_1879B65EC( *(unsigned int **)(a1 + 96),  *(void *)(a1 + 104),  *(_DWORD *)(a1 + 128),  (unsigned int (*)(void))sub_1879B643C);
  unint64_t v3 = *(__darwin_ct_rune_t **)(a1 + 96);
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    uint64_t v4 = MEMORY[0x1895F8770];
    while (1)
    {
      uint64_t v5 = *v3;
      if (__maskrune(v5, 0x1000uLL)) {
        goto LABEL_7;
      }
LABEL_8:
      if (++v3 >= (__darwin_ct_rune_t *)v2) {
        goto LABEL_9;
      }
    }

    if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x1000) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    *unint64_t v3 = __toupper(*v3);
    goto LABEL_8;
  }

LABEL_9:
  int v6 = *(unsigned int **)(a1 + 104);
  if (v2 <= v6) {
    int v6 = v2;
  }
  *(void *)(a1 + 96) = v6;
  return 4LL;
}

  int v6 = *(unsigned int **)(a1 + 104);
  if (v2 <= v6) {
    int v6 = v2;
  }
  *(void *)(a1 + 96) = v6;
  return 4LL;
}

    unsigned int v12 = a2[1];
    ++a2;
    unsigned int v11 = v12;
    a1 = (_DWORD *)*((void *)v9 + 2);
    if (!v12) {
      break;
    }
    if (!a1)
    {
      unsigned int v13 = malloc(0x20uLL);
      a1 = v13;
      if (v13)
      {
        *unsigned int v13 = v11;
        v13[1] = 2;
        *((void *)v13 + 2) = 0LL;
        *((void *)v13 + 3) = 0LL;
        *((void *)v13 + 1) = 0LL;
      }

      *((void *)v9 + 2) = v13;
    }
  }

  if (a1)
  {
    sub_1879BB3CC(*((void *)v9 + 2));
    *((void *)v9 + 2) = 0LL;
  }

  switch(v9[1])
  {
    case 0:
    case 2:
      goto LABEL_19;
    case 1:
    case 3:
      __int32 v14 = (void *)*((void *)v9 + 1);
      if (v14) {
        free(v14);
      }
LABEL_19:
      v9[1] = a4;
      if (a4 == 3 || a4 == 1)
      {
        *((void *)v9 + 1) = sub_1879C8C44(*a3);
      }

      else
      {
        if (a4) {
LABEL_24:
        }
          abort();
        *((void *)v9 + 1) = *a3;
      }

      return;
    default:
      goto LABEL_24;
  }
        }

uint64_t sub_1879B8BE0(uint64_t a1)
{
  sigset_t v2 = sub_1879B65EC( *(unsigned int **)(a1 + 96),  *(void *)(a1 + 104),  *(_DWORD *)(a1 + 128),  (unsigned int (*)(void))sub_1879B643C);
  unint64_t v3 = *(__darwin_ct_rune_t **)(a1 + 96);
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    uint64_t v4 = MEMORY[0x1895F8770];
    do
    {
      uint64_t v5 = *v3;
      if (v5 > 0x7F)
      {
        if (__maskrune(v5, 0x100uLL))
        {
LABEL_9:
          uint64_t v6 = *v3;
          if (v6 > 0x7F)
          {
            if (!__maskrune(v6, 0x1000uLL)) {
              goto LABEL_14;
            }
          }

          else if ((*(_DWORD *)(v4 + 4 * v6 + 60) & 0x1000) == 0)
          {
LABEL_14:
            ++v3;
            break;
          }

          *unint64_t v3 = __toupper(*v3);
          goto LABEL_14;
        }
      }

      else if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x100) != 0)
      {
        goto LABEL_9;
      }

      ++v3;
    }

    while (v3 < (__darwin_ct_rune_t *)v2);
  }

  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    uint64_t v7 = MEMORY[0x1895F8770];
    while (1)
    {
      uint64_t v8 = *v3;
      if (__maskrune(v8, 0x8000uLL)) {
        goto LABEL_21;
      }
LABEL_22:
      if (++v3 >= (__darwin_ct_rune_t *)v2) {
        goto LABEL_23;
      }
    }

    if ((*(_DWORD *)(v7 + 4 * v8 + 60) & 0x8000) == 0) {
      goto LABEL_22;
    }
LABEL_21:
    *unint64_t v3 = __tolower(*v3);
    goto LABEL_22;
  }

LABEL_23:
  unint64_t v9 = *(unsigned int **)(a1 + 104);
  if (v2 <= v9) {
    unint64_t v9 = v2;
  }
  *(void *)(a1 + 96) = v9;
  return 4LL;
}

uint64_t sub_1879B8D14(uint64_t a1)
{
  sigset_t v2 = sub_1879B65EC( *(unsigned int **)(a1 + 96),  *(void *)(a1 + 104),  *(_DWORD *)(a1 + 128),  (unsigned int (*)(void))sub_1879B643C);
  unint64_t v3 = *(__darwin_ct_rune_t **)(a1 + 96);
  if (v3 < (__darwin_ct_rune_t *)v2)
  {
    uint64_t v4 = MEMORY[0x1895F8770];
    while (1)
    {
      uint64_t v5 = *v3;
      if (__maskrune(v5, 0x8000uLL)) {
        goto LABEL_7;
      }
LABEL_8:
      if (++v3 >= (__darwin_ct_rune_t *)v2) {
        goto LABEL_9;
      }
    }

    if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x8000) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    *unint64_t v3 = __tolower(*v3);
    goto LABEL_8;
  }

uint64_t sub_1879B8DC0(uint64_t a1)
{
  *(void *)(a1 + 952) = *(void *)(a1 + 96);
  return 0LL;
}

uint64_t sub_1879B8DD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 96);
  *(void *)(a1 + 96) = *(void *)(a1 + 952);
  *(void *)(a1 + 952) = v1;
  return 5LL;
}

uint64_t sub_1879B8DE8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 128);
  if (v1 > 1000000) {
    return 6LL;
  }
  *(_DWORD *)(a1 + 124) = 1;
  *(_DWORD *)(a1 + 128) = 4 * v1;
  return 3LL;
}

uint64_t sub_1879B8E18(uint64_t a1)
{
  *(_DWORD *)(a1 + 132) = 1;
  return 3LL;
}

uint64_t sub_1879B8E28(uint64_t a1)
{
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a1 + 120) == 0;
  return 0LL;
}

uint64_t sub_1879B8E40(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 88);
  sigset_t v2 = *(unsigned int **)(a1 + 96);
  uint64_t v4 = sub_1879B6570( *(void *)(a1 + 96),  v1,  *(_DWORD *)(a1 + 128),  (unsigned int (*)(void))sub_1879B643C);
  sub_1879B6088(a1, (unint64_t)((char *)v2 - (char *)v4) >> 2);
  if (v2 <= v4)
  {
    uint64_t v6 = v2;
  }

  else
  {
    unint64_t v5 = *(void *)(a1 + 104);
    uint64_t v6 = v2;
    do
    {
      unsigned int v7 = *v4++;
      *v6++ = v7;
    }

    while (v4 < v2);
  }

  *(void *)(a1 + 96) = v6;
  return 4LL;
}

uint64_t sub_1879B8ED8(size_t a1)
{
  *(void *)(a1 + 1224) = 0LL;
  return sub_1879C2384(a1, 22LL);
}

uint64_t sub_1879B8EE4(size_t a1)
{
  *(void *)(a1 + 1224) = 0LL;
  return sub_1879C2384(a1, 23LL);
}

uint64_t sub_1879B8EF0(uint64_t a1)
{
  if (*(void *)(a1 + 96) <= *(void *)(a1 + 88)) {
    return 6LL;
  }
  if (*(_DWORD *)(a1 + 124)) {
    sub_1879B6358((void *)a1, *(_DWORD *)(a1 + 128));
  }
  else {
    sub_1879B6408(a1);
  }
  unint64_t v3 = *(void *)(a1 + 96) - 4LL * *(int *)(a1 + 128);
  if (v3 < *(void *)(a1 + 88)) {
    unint64_t v3 = *(void *)(a1 + 88);
  }
  *(void *)(a1 + 96) = v3;
  return 4LL;
}

char *__cdecl tilde_expand_0(char *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (*a1 != 126) {
    return strdup(a1);
  }
  sigset_t v2 = strchr(a1 + 1, 47);
  if (v2)
  {
    int64_t v3 = v2 - a1;
    size_t v4 = v2 - a1 + 1;
    unint64_t v5 = (char *)malloc(v4);
    if (v5)
    {
      uint64_t v6 = v5;
      strncpy(v5, a1 + 1, v3 - 1)[v3 - 1] = 0;
      goto LABEL_8;
    }

    return 0LL;
  }

  uint64_t v8 = strdup(a1 + 1);
  if (!v8) {
    return 0LL;
  }
  uint64_t v6 = v8;
  size_t v4 = 0LL;
LABEL_8:
  if (!*v6)
  {
    uid_t v10 = getuid();
    if (getpwuid_r(v10, &v18, v19, 0x400uLL, &v17)) {
      goto LABEL_10;
    }
LABEL_15:
    unsigned int v11 = v17;
    free(v6);
    if (v11)
    {
      unsigned int v12 = &a1[v4];
      pw_dir = v11->pw_dir;
      size_t v14 = strlen(pw_dir);
      size_t v15 = v14 + strlen(v12) + 2;
      size_t v16 = (char *)malloc(v15);
      unint64_t v9 = v16;
      if (v16) {
        snprintf(v16, v15, "%s/%s", pw_dir, v12);
      }
      return v9;
    }

    return strdup(a1);
  }

  if (!getpwnam_r(v6, &v18, v19, 0x400uLL, &v17)) {
    goto LABEL_15;
  }
LABEL_10:
  free(v6);
  return strdup(a1);
}

char *__cdecl filename_completion_function_0(const char *a1, int a2)
{
  int64_t v3 = (DIR *)qword_18C6E5140;
  if (a2 && qword_18C6E5140) {
    goto LABEL_3;
  }
  unint64_t v9 = strrchr(a1, 47);
  if (!v9)
  {
    free((void *)qword_18C6E5148);
    if (*a1)
    {
      qword_18C6E5148 = (uint64_t)strdup(a1);
      if (!qword_18C6E5148) {
        return 0LL;
      }
    }

    else
    {
      qword_18C6E5148 = 0LL;
    }

    free((void *)qword_18C6E5150);
    int v17 = 0LL;
    qword_18C6E5150 = 0LL;
    if (!v3) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  uid_t v10 = v9 + 1;
  unsigned int v11 = (void *)qword_18C6E5148;
  size_t v12 = strlen(v9 + 1);
  unsigned int v13 = (char *)realloc((void *)qword_18C6E5148, v12 + 1);
  if (!v13)
  {
    free(v11);
    uint64_t v8 = 0LL;
    qword_18C6E5148 = 0LL;
    return v8;
  }

  qword_18C6E5148 = (uint64_t)v13;
  strcpy(v13, v10);
  size_t v14 = v10 - a1;
  size_t v15 = (void *)qword_18C6E5150;
  size_t v16 = (char *)realloc((void *)qword_18C6E5150, v14 + 1);
  if (!v16)
  {
    free(v15);
    uint64_t v8 = 0LL;
    qword_18C6E5150 = 0LL;
    return v8;
  }

  int v17 = v16;
  qword_18C6E5150 = (uint64_t)v16;
  strncpy(v16, a1, v14)[v14] = 0;
  int64_t v3 = (DIR *)qword_18C6E5140;
  if (qword_18C6E5140)
  {
LABEL_29:
    closedir(v3);
    qword_18C6E5140 = 0LL;
    int v17 = (char *)qword_18C6E5150;
  }

LABEL_30:
  free((void *)qword_18C6E5158);
  qword_18C6E5158 = 0LL;
  if (!v17)
  {
    qword_18C6E5150 = (uint64_t)strdup((const char *)&unk_1879D0D1A);
    if (qword_18C6E5150)
    {
      v21 = "./";
      goto LABEL_35;
    }

    return 0LL;
  }

  v21 = v17;
  if (*v17 != 126)
  {
LABEL_35:
    uint64_t v22 = strdup(v21);
    goto LABEL_36;
  }

  uint64_t v22 = tilde_expand_0(v17);
LABEL_36:
  qword_18C6E5158 = (uint64_t)v22;
  if (!v22) {
    return 0LL;
  }
  v23 = opendir(v22);
  qword_18C6E5140 = (uint64_t)v23;
  if (!v23) {
    return 0LL;
  }
  int64_t v3 = v23;
  size_t v24 = qword_18C6E5148;
  if (qword_18C6E5148) {
    size_t v24 = strlen((const char *)qword_18C6E5148);
  }
  qword_18C6E5160 = v24;
LABEL_3:
  size_t v4 = readdir(v3);
  if (!v4)
  {
LABEL_13:
    closedir((DIR *)qword_18C6E5140);
    uint64_t v8 = 0LL;
    qword_18C6E5140 = 0LL;
    return v8;
  }

  while (1)
  {
    d_name = v4->d_name;
    int v5 = v4->d_name[0];
    if (v5 == 46 && (!v4->d_name[1] || v4->d_name[1] == 46 && !v4->d_name[2])) {
      goto LABEL_12;
    }
    if (!qword_18C6E5160) {
      break;
    }
    if (v5 == *(unsigned __int8 *)qword_18C6E5148)
    {
      unint64_t d_namlen = v4->d_namlen;
    }

LABEL_12:
    size_t v4 = readdir((DIR *)qword_18C6E5140);
    if (!v4) {
      goto LABEL_13;
    }
  }

  unint64_t d_namlen = v4->d_namlen;
LABEL_23:
  passwd v18 = (const char *)qword_18C6E5150;
  size_t v19 = d_namlen + strlen((const char *)qword_18C6E5150) + 1;
  uint64_t v20 = (char *)malloc(v19);
  uint64_t v8 = v20;
  if (v20) {
    snprintf(v20, v19, "%s%s", v18, d_name);
  }
  return v8;
}

        unsigned int v11 = v7;
LABEL_13:
        size_t v4 = (__int32 *)v2[v9++];
        unsigned int v7 = v11;
        if (!v4) {
          goto LABEL_14;
        }
        break;
    }
  }

  if (v5)
  {
    if (v6)
    {
      sub_1879C4AA4(v3, v4);
      return 0xFFFFFFFFLL;
    }

    v23 = (__int32 *)v2[v9];
    if (!v23)
    {
      passwd v18 = v3;
      size_t v19 = v4;
LABEL_23:
      sub_1879C4B00(v18, v19);
      return 0LL;
    }
  }

  else
  {
    v21 = sub_1879BCD20(v37, v4);
    if (!v21)
    {
      fprintf(*(FILE **)(v3 + 24), "%ls: Invalid \\ or ^ in instring.\n");
      return 0xFFFFFFFFLL;
    }

    size_t v4 = v21;
    if (v6)
    {
      if (v21[1] || (uint64_t v22 = *(unsigned __int8 *)v21, *(_BYTE *)(v8 + v22) == 24))
      {
        sub_1879BB74C(v3, v21);
        return 0LL;
      }

      uint64_t result = 0LL;
      v34 = 34;
      goto LABEL_59;
    }

    v23 = (__int32 *)v2[v9];
    if (!v23)
    {
      sub_1879BC654(v3, v8, (unsigned int *)v21);
      return 0LL;
    }
  }

  if ((_DWORD)v7)
  {
    v27 = sub_1879BCD20(v36, v23);
    if (!v27)
    {
      fprintf(*(FILE **)(v3 + 24), "%ls: Invalid \\ or ^ in outstring.\n");
      return 0xFFFFFFFFLL;
    }

    v28 = (const __int32 **)sub_1879BB3BC(v3, (uint64_t)v27);
    v29 = v3;
    v30 = v4;
    v31 = 1;
    if (v5)
    {
      sub_1879C4A34(v3, v4, v28, v7);
LABEL_58:
      uint64_t result = 0LL;
      uint64_t v22 = *(unsigned __int8 *)v4;
      v34 = 24;
LABEL_59:
      *(_BYTE *)(v8 + v22) = v34;
      return result;
    }

  v11[(int)v9] = 0LL;
  *(void *)(a1 + 64) = v11;
  size_t v14 = malloc(8LL * ((int)v9 + 1));
  if (v14)
  {
    unsigned int v11 = v14;
    if ((int)v9 < 1)
    {
LABEL_17:
      v11[(int)v9] = 0LL;
      *(void *)(a1 + 72) = v11;
      sub_1879C1C74(a1);
      return 0LL;
    }

    size_t v15 = 0LL;
    while (1)
    {
      size_t v16 = malloc(4LL * (v8 + 1));
      v11[v15] = v16;
      if (!v16) {
        break;
      }
    }

    if (v15)
    {
      size_t v19 = v15 + 1;
      do
        free((void *)v11[(v19-- - 2)]);
      while (v19 > 1);
    }

    goto LABEL_25;
  }

  return 0xFFFFFFFFLL;
}

char **__cdecl completion_matches(const char *a1, CPFunction *a2)
{
  uint64_t v4 = ((uint64_t (*)(const char *, void))a2)(a1, 0LL);
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0LL;
    unsigned int v7 = 0LL;
    unint64_t v8 = 1LL;
    do
    {
      unint64_t v9 = v6;
      if (v6 + 3 >= v8)
      {
        do
        {
          unint64_t v11 = v8;
          v8 *= 2LL;
        }

        while (v6 + 3 >= v11);
        uid_t v10 = realloc(v7, 8 * v11);
        if (!v10)
        {
          free(v7);
          return (char **)v10;
        }
      }

      else
      {
        uid_t v10 = v7;
        unint64_t v11 = v8;
      }

      ++v6;
      *((void *)v10 + v9 + 1) = v5;
      uint64_t v5 = ((uint64_t (*)(const char *, unint64_t))a2)(a1, v9 + 1);
      unint64_t v8 = v11;
      unsigned int v7 = v10;
    }

    while (v5);
    size_t v12 = (const char *)*((void *)v10 + 1);
    size_t v13 = strlen(v12);
    if (v6 >= 2)
    {
      for (unint64_t i = 2LL; i <= v6; ++i)
      {
        size_t v14 = 0LL;
        if (v13)
        {
          while (v12[v14] == *(unsigned __int8 *)(*((void *)v10 + i) + v14))
          {
            if (v13 == ++v14)
            {
              size_t v14 = v13;
              break;
            }
          }
        }

        size_t v13 = v14;
      }
    }

    else
    {
      size_t v14 = v13;
    }

    size_t v15 = (char *)malloc(v14 + 1);
    if (v15)
    {
      size_t v16 = strncpy(v15, v12, v14);
      v16[v14] = 0;
      *(void *)uid_t v10 = v16;
      *((void *)v10 + v9 + 2) = 0LL;
      return (char **)v10;
    }

    free(v10);
  }

  return 0LL;
}

void sub_1879B9518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = a4;
  unint64_t v6 = *(int *)(a1 + 152);
  uint64_t v7 = a2 + 8;
  unint64_t v8 = a3 - 1;
  if (a4 + 1 > v6) {
    unint64_t v9 = 1LL;
  }
  else {
    unint64_t v9 = v6 / (a4 + 1);
  }
  unint64_t v10 = a3 - 2 + v9;
  BOOL v11 = __CFADD__(a3 - 2, v9);
  qsort((void *)(a2 + 8), a3 - 1, 8uLL, (int (__cdecl *)(const void *, const void *))sub_1879B9630);
  if (!v11)
  {
    uint64_t v12 = 0LL;
    unint64_t v13 = v10 / v9;
    if (v13 <= 1) {
      uint64_t v14 = 1LL;
    }
    else {
      uint64_t v14 = v13;
    }
    uint64_t v20 = v14;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        unint64_t v16 = v12 + v15 * v13;
        if (v16 >= v8) {
          break;
        }
        uint64_t v17 = v15 + 1;
        BOOL v18 = v15 == 0;
        size_t v19 = " ";
        if (v18) {
          size_t v19 = (const char *)&unk_1879D0D1A;
        }
        fprintf(*(FILE **)(a1 + 16), "%s%-*s", v19, v4, *(const char **)(v7 + 8 * v16));
        uint64_t v15 = v17;
      }

      while (v9 != v17);
      fputc(10, *(FILE **)(a1 + 16));
      ++v12;
    }

    while (v12 != v20);
  }

uint64_t sub_1879B9630(const char **a1, const char **a2)
{
  return strcasecmp(*a1, *a2);
}

uint64_t sub_1879B963C( EditLine *a1, char *(__cdecl *a2)(const char *, int), uint64_t (*a3)(char *, void), const __int32 *a4, const __int32 *a5, const char *(*a6)(char *a1), unint64_t a7, int *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, uint64_t (*a12)(const __int32 *, const __int32 *), char *a13, uint64_t (*a14)(void))
{
  int v18 = *((unsigned __int8 *)a1 + 136);
  int v19 = *((unsigned __int8 *)a1 + 137);
  if (a8)
  {
    if (v18 == v19) {
      int v20 = 63;
    }
    else {
      int v20 = 9;
    }
    *a8 = v20;
  }

  int v60 = v19;
  int v61 = v18;
  if (a2) {
    v21 = a2;
  }
  else {
    v21 = filename_completion_function_0;
  }
  uint64_t v22 = sub_1879B9A20;
  if (a6) {
    uint64_t v22 = a6;
  }
  v58 = v22;
  v23 = el_wline(a1);
  size_t v24 = v23;
  if (a12)
  {
    unint64_t cursor = a12(v23->buffer, v23->cursor);
  }

  else
  {
    unint64_t cursor = (unint64_t)v23->cursor;
    if ((const __int32 *)cursor > v23->buffer)
    {
      v26 = v23->cursor;
      do
      {
        __int32 v27 = *--v26;
        if (wcschr(a4, v27) || a5 && wcschr(a5, *(_DWORD *)(cursor - 4))) {
          break;
        }
        unint64_t cursor = (unint64_t)v26;
      }

      while (v26 > v24->buffer);
    }
  }

  v28 = a13;
  v29 = el_line(a1);
  buffer = (unsigned int *)v24->buffer;
  if (v24->buffer >= (const __int32 *)cursor)
  {
    uint64_t v31 = 0LL;
  }

  else
  {
    uint64_t v31 = 0LL;
    do
    {
      unsigned int v32 = *buffer++;
      v31 += sub_1879C802C(v32);
    }

    while ((unint64_t)buffer < cursor);
  }

  size_t v33 = &v29->cursor[-v31] - v29->buffer;
  rl_line_buffer = (char *)v29->buffer;
  v34 = (char *)malloc(v33 + 1);
  strncpy(v34, &v29->buffer[v31], v33)[v33] = 0;
  if (!a13 || (v28 = (char *)((uint64_t (*)(char *))a13)(v34)) != 0LL)
  {
    if (a10) {
      *a10 = LODWORD(v29->cursor) - LODWORD(v29->buffer);
    }
    if (a11) {
      *a11 = LODWORD(v29->lastchar) - LODWORD(v29->buffer);
    }
    if (a3)
    {
      if (v28) {
        v35 = v28;
      }
      else {
        v35 = v34;
      }
      uint64_t v36 = a3(v35, (LODWORD(v29->cursor) - LODWORD(v29->buffer) - v33));
      v37 = (char **)v36;
      if (!a9) {
        goto LABEL_42;
      }
      if (*a9 || v36)
      {
LABEL_41:
        *a9 = 0;
        goto LABEL_42;
      }
    }

    if (v28) {
      v38 = v28;
    }
    else {
      v38 = v34;
    }
    v37 = completion_matches(v38, v21);
    if (a9) {
      goto LABEL_41;
    }
LABEL_42:
    if (!v37)
    {
      uint64_t v40 = 0LL;
LABEL_76:
      free(v28);
      free(v34);
      return v40;
    }

    if (**v37)
    {
      if (a14)
      {
        v39 = (char *)a14();
        if (!v39) {
          goto LABEL_71;
        }
      }

      else
      {
        v39 = 0LL;
      }

      el_deletestr(a1, ((unint64_t)v24->cursor - cursor) >> 2);
      v41 = v39;
      if (!v39) {
        v41 = *v37;
      }
      v42 = sub_1879C7E88((__int32 *)v41, (uint64_t)a1 + 1264);
      el_winsertstr(a1, v42);
      free(v39);
    }

    if (v61 != v60)
    {
      if (v37[2])
      {
        v49 = *v37;
      }

      else
      {
        v49 = *v37;
        v51 = v37[1];
        if (!v51 || !strcmp(*v37, v51))
        {
          v52 = (__int32 *)v58(v49);
          v53 = sub_1879C7E88(v52, (uint64_t)a1 + 1264);
          el_winsertstr(a1, v53);
LABEL_71:
          uint64_t v40 = 4LL;
          goto LABEL_72;
        }
      }

      BOOL v50 = *v49 != 0;
      el_beep(a1);
      uint64_t v40 = (4 * v50);
LABEL_72:
      v54 = *v37;
      if (*v37)
      {
        v55 = v37 + 1;
        do
        {
          free(v54);
          v56 = *v55++;
          v54 = v56;
        }

        while (v56);
      }

      free(v37);
      goto LABEL_76;
    }

    v43 = v37[1];
    if (v43)
    {
      uint64_t v44 = 0LL;
      unint64_t v45 = 0LL;
      do
      {
        size_t v46 = strlen(v43);
        if (v46 > v45) {
          unint64_t v45 = v46;
        }
        v43 = v37[v44++ + 2];
      }

      while (v43);
      uint64_t v47 = v44;
      fputc(10, *((FILE **)a1 + 2));
      if (v44 > a7)
      {
        fprintf(*((FILE **)a1 + 2), "Display all %zu possibilities? (y or n) ", v44);
        fflush(*((FILE **)a1 + 2));
        int v48 = getc((FILE *)*MEMORY[0x1895F89D8]);
        fputc(10, *((FILE **)a1 + 2));
        if (v48 != 121) {
          goto LABEL_67;
        }
      }
    }

    else
    {
      fputc(10, *((FILE **)a1 + 2));
      unint64_t v45 = 0LL;
      uint64_t v47 = 0LL;
    }

    sub_1879B9518((uint64_t)a1, (uint64_t)v37, v47 + 1, v45);
LABEL_67:
    uint64_t v40 = 8LL;
    goto LABEL_72;
  }

  return 0LL;
}

const char *sub_1879B9A20(char *a1)
{
  if (*a1 == 126) {
    sigset_t v2 = tilde_expand_0(a1);
  }
  else {
    sigset_t v2 = 0LL;
  }
  if (v2) {
    int64_t v3 = v2;
  }
  else {
    int64_t v3 = a1;
  }
  int v4 = stat(v3, &v8);
  mode_t st_mode = v8.st_mode;
  if (v2) {
    free(v2);
  }
  unint64_t v6 = "/";
  if ((st_mode & 0xF000) != 0x4000) {
    unint64_t v6 = " ";
  }
  if (v4 == -1) {
    return " ";
  }
  else {
    return v6;
  }
}

unsigned __int8 _el_fn_complete(EditLine *a1, int a2)
{
  return sub_1879B963C(a1, 0LL, 0LL, (const __int32 *)" ", 0LL, 0LL, 0x64uLL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

unsigned __int8 _el_fn_sh_complete(EditLine *a1, int a2)
{
  return sub_1879B963C( a1,  0LL,  0LL,  (const __int32 *)" ",  0LL,  0LL,  0x64uLL,  0LL,  0LL,  0LL,  0LL,  (uint64_t (*)(const __int32 *, const __int32 *))sub_1879B9B64,  (char *)sub_1879B9BD8,  (uint64_t (*)(void))sub_1879B9C6C);
}

__int32 *sub_1879B9B64(__int32 *a1, unint64_t a2)
{
  sigset_t v2 = a1;
  if ((unint64_t)a1 < a2)
  {
    int v4 = a1;
    do
    {
      if (*v4 == 92)
      {
        ++v4;
      }

      else if (wcschr((const __int32 *)" ", *v4))
      {
        sigset_t v2 = v4 + 1;
      }

      ++v4;
    }

    while ((unint64_t)v4 < a2);
  }

  return v2;
}

_WORD *sub_1879B9BD8(const char *a1)
{
  unint64_t v1 = a1;
  size_t v2 = strlen(a1);
  uint64_t result = malloc(v2 + 2);
  if (result)
  {
    if (*v1 == 92)
    {
      int v4 = result;
      if (v1[1] == 126)
      {
        _WORD *result = 12078;
        int v4 = result + 1;
        ++v1;
      }
    }

    else
    {
      int v4 = result;
    }

    while (1)
    {
      int v5 = *(unsigned __int8 *)v1;
      if (v5 == 92)
      {
        int v6 = *(unsigned __int8 *)++v1;
        LOBYTE(v5) = v6;
        if (v6) {
          goto LABEL_8;
        }
      }

      else
      {
        if (!*v1)
        {
          _BYTE *v4 = 0;
          return result;
        }

_BYTE *sub_1879B9C6C(_BYTE *a1)
{
  unint64_t v1 = a1;
  char v2 = *a1;
  if (*a1)
  {
    int v3 = 0;
    int v4 = a1 + 1;
    do
    {
      int v5 = *v4++;
      char v2 = v5;
    }

    while (v5);
  }

  else
  {
    int v3 = 0;
  }

  size_t v6 = strlen(v1);
  uint64_t v7 = malloc(v6 + v3 + 1);
  stat v8 = v7;
  if (v7)
  {
    char v9 = *v1;
    unint64_t v10 = v7;
    if (*v1)
    {
      unint64_t v10 = v7;
      do
      {
        *v10++ = *v1;
        int v11 = *(unsigned __int8 *)++v1;
        char v9 = v11;
      }

      while (v11);
    }

    *unint64_t v10 = 0;
  }

  return v8;
}

uint64_t sub_1879B9D68(void *a1)
{
  char v2 = malloc(0x1000uLL);
  a1[149] = 0LL;
  a1[148] = 0LL;
  a1[144] = v2;
  a1[145] = 1024LL;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = v2;
  uint64_t result = 0LL;
  a1[146] = v3;
  return result;
}

void sub_1879B9DB8(uint64_t a1)
{
  *(void *)(a1 + 1152) = 0LL;
}

uint64_t sub_1879B9DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 1184) = a3;
  *(void *)(a1 + 1192) = a2;
  return 0LL;
}

uint64_t sub_1879B9DF0(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 1176))
  {
    wcsncpy(*(__int32 **)(a1 + 88), *(const __int32 **)(a1 + 1152), *(void *)(a1 + 1160));
    int v4 = *(const __int32 **)(a1 + 88);
    int v5 = (char *)v4 + *(void *)(a1 + 1168) - *(void *)(a1 + 1152);
    *(void *)(a1 + 104) = v5;
    if (*(_DWORD *)(a1 + 1096) != 1)
    {
      *(void *)(a1 + 96) = v5;
      return 4LL;
    }

LABEL_26:
    *(void *)(a1 + 96) = v4;
    return 4LL;
  }

  uint64_t v2 = *(void *)(a1 + 1184);
  if (v2)
  {
    if ((*(_BYTE *)(a1 + 44) & 0x40) == 0)
    {
      int v3 = *(__int32 **)(a1 + 1208);
      if (!v3) {
        return 6LL;
      }
LABEL_10:
      if (*(int *)(a1 + 1176) >= 2)
      {
        int v6 = 1;
        while (1)
        {
          if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
          {
            int v3 = sub_1879B9FB4(a1, 6LL);
          }

          else
          {
            if ((*(unsigned int (**)(void, uint64_t, uint64_t))(a1 + 1192))( *(void *)(a1 + 1184),  a1 + 1200,  6LL) == -1) {
              break;
            }
            int v3 = *(__int32 **)(a1 + 1208);
          }

          if (!v3) {
            break;
          }
          if (++v6 >= *(_DWORD *)(a1 + 1176)) {
            goto LABEL_18;
          }
        }

        *(_DWORD *)(a1 + 1176) = v6;
        return 6LL;
      }

      if ((*(_BYTE *)(a1 + 44) & 0x20) == 0) {
        return v12;
      }
      int v5 = 0LL;
      if (v6 <= 1) {
        return v12;
      }
    }
  }

LABEL_18:
      wcsncpy(*(__int32 **)(a1 + 88), v3, (uint64_t)(*(void *)(a1 + 112) - *(void *)(a1 + 88)) >> 2);
      uint64_t v7 = *(const __int32 **)(a1 + 88);
      *(_DWORD *)(*(void *)(a1 + 112) - 4LL) = 0;
      int64_t v8 = wcslen(v7);
      int v4 = &v7[v8];
      *(void *)(a1 + 104) = v4;
      if (v8 >= 1 && *(v4 - 1) == 10) {
        *(void *)(a1 + 104) = --v4;
      }
      if (v4 > v7 && *(v4 - 1) == 32) {
        *(void *)(a1 + 104) = --v4;
      }
      if (*(_DWORD *)(a1 + 1096) == 1)
      {
        *(void *)(a1 + 96) = v7;
        return 4LL;
      }

      goto LABEL_26;
    }

    int v3 = sub_1879B9FB4(a1, 3LL);
    if (v3) {
      goto LABEL_10;
    }
  }

  return 6LL;
}

      uint64_t v14 = v13 - 1;
      if (v24[v13 - 1] != 10) {
        uint64_t v14 = v13;
      }
      uint64_t v15 = (int)v11;
      while (1)
      {
        if (v14 >= 1)
        {
          while (v24[v14 - 1] != 10 || --v4)
          {
            int v18 = v14-- <= 1;
            if (v18)
            {
              unint64_t v16 = &v24[-1];
              goto LABEL_28;
            }
          }

          int v18 = (unint64_t)v14 > 0xFFF;
          unint64_t v16 = &v24[v14];
          if (v18) {
            LODWORD(v15) = v15 + 1;
          }
          goto LABEL_38;
        }

        unint64_t v16 = &v24[v14 - 1];
LABEL_28:
        if (v4 < 1 || !v15) {
          break;
        }
        if (fseeko(v10, --v15 << 12, 0) < 0) {
          goto LABEL_46;
        }
        uint64_t v17 = fread(v24, 0x1000uLL, 1uLL, v10);
        uint64_t v14 = 4096LL;
        if (v17 != 1)
        {
          if (!ferror(v10))
          {
            uint64_t v12 = 35;
            goto LABEL_47;
          }

          goto LABEL_46;
        }
      }

      if (v4 > 0)
      {
        uint64_t v12 = 0;
        goto LABEL_47;
      }

__int32 *sub_1879B9FB4(uint64_t a1, uint64_t a2)
{
  else {
    return sub_1879C7E88((__int32 *)v5, a1 + 1264);
  }
}

uint64_t sub_1879BA010(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(void *)(a1 + 1184)) {
    return 0xFFFFFFFFLL;
  }
  if (a2 == 1 || !wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"l"))
  {
    if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
    {
      uint64_t result = (uint64_t)sub_1879B9FB4(a1, 4LL);
      while (result)
      {
LABEL_13:
        int64_t v8 = *(FILE **)(a1 + 16);
        int v9 = *(_DWORD *)(a1 + 1200);
        unint64_t v10 = sub_1879C7D54((unsigned __int32 *)result, a1 + 1264);
        fprintf(v8, "%d %s", v9, (const char *)v10);
        if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
        {
          uint64_t result = (uint64_t)sub_1879B9FB4(a1, 5LL);
        }

        else
        {
          if ((*(unsigned int (**)(void, uint64_t, uint64_t))(a1 + 1192))( *(void *)(a1 + 1184),  a1 + 1200,  5LL) == -1) {
            return 0LL;
          }
          uint64_t result = *(void *)(a1 + 1208);
        }
      }
    }

    else if ((*(unsigned int (**)(void, uint64_t, uint64_t))(a1 + 1192))( *(void *)(a1 + 1184),  a1 + 1200,  4LL) == -1)
    {
      return 0LL;
    }

    else
    {
      uint64_t result = *(void *)(a1 + 1208);
      if (result) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    if (a2 != 3) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v6 = wcstol(*(const __int32 **)(a3 + 16), 0LL, 0);
    if (!wcscmp(*(const __int32 **)(a3 + 8), (const __int32 *)"s"))
    {
      return history_w(*(HistoryW **)(a1 + 1184), &v11, 1, v6);
    }

    else
    {
      return history_w(*(HistoryW **)(a1 + 1184), &v11, 20, v6);
    }
  }

  return result;
}

uint64_t sub_1879BA1A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (uint64_t)realloc(*(void **)(a1 + 1152), 4 * a3);
  if (result)
  {
    uint64_t v7 = result;
    bzero((void *)(result + 4 * a2), 4 * (a3 - a2));
    *(void *)(a1 + 1168) = v7 + *(void *)(a1 + 1168) - *(void *)(a1 + 1152);
    *(void *)(a1 + 1152) = v7;
    *(void *)(a1 + 1160) = a3;
    return 1LL;
  }

  return result;
}

HistoryW *history_winit(void)
{
  uint64_t v0 = malloc(0x60uLL);
  unint64_t v1 = v0;
  if (v0)
  {
    if (sub_1879BA2C8(v0) == -1)
    {
      free(v1);
      return 0LL;
    }

    else
    {
      *((_DWORD *)v1 + 2) = -1;
      v1[2] = sub_1879BA378;
      v1[3] = sub_1879BA318;
      v1[4] = sub_1879BA3B4;
      v1[5] = sub_1879BA3F0;
      v1[6] = sub_1879BA46C;
      v1[7] = sub_1879BA4C4;
      v1[10] = sub_1879BA58C;
      v1[11] = sub_1879BA690;
      v1[8] = sub_1879BA78C;
      v1[9] = sub_1879BA548;
    }
  }

  return (HistoryW *)v1;
}

uint64_t sub_1879BA2C8(void *a1)
{
  uint64_t v2 = malloc(0x40uLL);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = v2;
  uint64_t result = 0LL;
  v3[3] = v3;
  v3[4] = v3;
  v3[1] = 0LL;
  *(_DWORD *)int v3 = 0;
  v3[5] = v3;
  v3[6] = 0LL;
  v3[7] = 0LL;
  *a1 = v3;
  return result;
}

uint64_t sub_1879BA318(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == a1)
  {
    *(_DWORD *)a2 = 5;
    uint64_t v6 = &unk_1879CAB04;
  }

  else
  {
    int v4 = *(_OWORD **)(v2 + 24);
    if (v4 != (_OWORD *)a1)
    {
      uint64_t result = 0LL;
      *(void *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }

    *(_DWORD *)a2 = 6;
    uint64_t v6 = &unk_1879CAB30;
  }

  *(void *)(a2 + 8) = v6;
  return 0xFFFFFFFFLL;
}

uint64_t sub_1879BA378(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 24);
  *(void *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 3;
    *(void *)(a2 + 8) = &unk_1879CAA58;
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t result = 0LL;
    *(_OWORD *)a2 = *v2;
  }

  return result;
}

uint64_t sub_1879BA3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 32);
  *(void *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 4;
    *(void *)(a2 + 8) = &unk_1879CAAB0;
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t result = 0LL;
    *(_OWORD *)a2 = *v2;
  }

  return result;
}

uint64_t sub_1879BA3F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == a1)
  {
    int v6 = *(_DWORD *)(a1 + 52);
    BOOL v7 = v6 <= 0;
    if (v6 <= 0) {
      int v8 = 5;
    }
    else {
      int v8 = 6;
    }
    *(_DWORD *)a2 = v8;
    uint64_t v9 = 40LL;
    if (!v7) {
      uint64_t v9 = 48LL;
    }
    unint64_t v10 = *(_UNKNOWN **)((char *)&off_18A0E9260 + v9);
  }

  else
  {
    int v4 = *(_OWORD **)(v3 + 32);
    if (v4 != (_OWORD *)a1)
    {
      uint64_t result = 0LL;
      *(void *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }

    *(_DWORD *)a2 = 7;
    unint64_t v10 = &unk_1879CAB68;
  }

  *(void *)(a2 + 8) = v10;
  return 0xFFFFFFFFLL;
}

uint64_t sub_1879BA46C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 40);
  if (v2 == (_OWORD *)a1)
  {
    int v4 = *(_DWORD *)(a1 + 52);
    BOOL v5 = v4 <= 0;
    if (v4 <= 0) {
      int v6 = 5;
    }
    else {
      int v6 = 8;
    }
    *(_DWORD *)a2 = v6;
    uint64_t v7 = 40LL;
    if (!v5) {
      uint64_t v7 = 64LL;
    }
    *(void *)(a2 + 8) = *(_UNKNOWN **)((char *)&off_18A0E9260 + v7);
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t result = 0LL;
    *(_OWORD *)a2 = *v2;
  }

  return result;
}

uint64_t sub_1879BA4C4(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 52))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3 == a1 || *(_DWORD *)v3 != a3)
    {
      uint64_t v3 = a1;
      while (1)
      {
        uint64_t v3 = *(void *)(v3 + 24);
        if (v3 == a1) {
          break;
        }
        if (*(_DWORD *)v3 == a3) {
          goto LABEL_10;
        }
      }

      uint64_t v3 = a1;
LABEL_10:
      *(void *)(a1 + 40) = v3;
    }

    if (v3 != a1) {
      return 0LL;
    }
    int v4 = &unk_1879CAC14;
    int v5 = 9;
  }

  else
  {
    int v4 = &unk_1879CAB04;
    int v5 = 5;
  }

  *(_DWORD *)a2 = v5;
  *(void *)(a2 + 8) = v4;
  return 0xFFFFFFFFLL;
}

void sub_1879BA548(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 32); i != a1; uint64_t i = *(void *)(a1 + 32))
    sub_1879BB258(a1, i);
  *(void *)(a1 + 40) = a1;
  *(_DWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 56) = 0;
}

uint64_t sub_1879BA58C(uint64_t a1, uint64_t a2, __int32 *a3)
{
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 24);
    if (v6 != a1)
    {
      uint64_t result = wcscmp(*(const __int32 **)(v6 + 8), a3);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  int v8 = malloc(0x28uLL);
  if (!v8)
  {
LABEL_15:
    *(_DWORD *)a2 = 2;
    *(void *)(a2 + 8) = &unk_1879CAA18;
    return 0xFFFFFFFFLL;
  }

  uint64_t v9 = v8;
  unint64_t v10 = sub_1879C8C44(a3);
  v9[1] = v10;
  if (!v10)
  {
    free(v9);
    goto LABEL_15;
  }

  uint64_t v11 = *(void *)(a1 + 24);
  v9[2] = 0LL;
  v9[3] = v11;
  v9[4] = a1;
  *(void *)(v11 + 32) = v9;
  int v12 = *(_DWORD *)(a1 + 52);
  LODWORD(v11) = *(_DWORD *)(a1 + 56) + 1;
  *(_DWORD *)uint64_t v9 = v11;
  *(void *)(a1 + 24) = v9;
  *(_DWORD *)(a1 + 52) = v12 + 1;
  *(_DWORD *)(a1 + 56) = v11;
  *(void *)(a1 + 40) = v9;
  *(_OWORD *)a2 = *(_OWORD *)v9;
  int v13 = *(_DWORD *)(a1 + 52);
  uint64_t result = 1LL;
  if (v13 >= 1 && v13 > *(_DWORD *)(a1 + 48))
  {
    do
    {
      sub_1879BB258(a1, *(void *)(a1 + 32));
      int v14 = *(_DWORD *)(a1 + 52);
    }

    while (v14 >= 1 && v14 > *(_DWORD *)(a1 + 48));
    return 1LL;
  }

  return result;
}

uint64_t sub_1879BA690(uint64_t a1, uint64_t a2, __int32 *a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == a1) {
    return sub_1879BA58C(a1, a2, a3);
  }
  uint64_t v7 = *(const __int32 **)(v6 + 8);
  size_t v8 = wcslen(v7);
  size_t v9 = wcslen(a3) + v8;
  unint64_t v10 = (__int32 *)malloc(4 * (v9 + 1));
  if (v10)
  {
    uint64_t v11 = v10;
    wcsncpy(v10, v7, v9 + 1);
    v11[v9] = 0;
    size_t v12 = wcslen(v11);
    wcsncat(v11, a3, v9 - v12);
    free(*(void **)(v6 + 8));
    uint64_t result = 0LL;
    *(void *)(v6 + 8) = v11;
    *(_OWORD *)a2 = *(_OWORD *)*(void *)(a1 + 40);
  }

  else
  {
    *(_DWORD *)a2 = 2;
    *(void *)(a2 + 8) = &unk_1879CAA18;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_1879BA78C(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)(a2 + 8) = sub_1879C8C44(*(const __int32 **)(*(void *)(a1 + 40) + 8LL));
  uint64_t v6 = *(_DWORD **)(a1 + 40);
  *(_DWORD *)a2 = *v6;
  sub_1879BB258(a1, (uint64_t)v6);
  return 0LL;
}

void history_wend(HistoryW *a1)
{
}

int history_w(HistoryW *a1, HistEventW *a2, int a3, ...)
{
  v81 = va_arg(va, const __int32 *);
  v82 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v83 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v84 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v85 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v86 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v87 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  v88 = va_arg(va, void (*)(uint64_t a1));
  v89 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, __int32 *a3));
  v90 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, __int32 *a3));
  v91 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  a2->num = 0;
  a2->str = (const __int32 *)&unk_1879CA9D4;
  switch(a3)
  {
    case 0:
      *((_DWORD *)a1 + 2) = -1;
      int v5 = v82;
      uint64_t v6 = v83;
      uint64_t v7 = v84;
      size_t v8 = v85;
      size_t v9 = v86;
      unint64_t v10 = v87;
      uint64_t v11 = v88;
      size_t v12 = v89;
      int v13 = v90;
      int v14 = v91;
      if (v82) {
        BOOL v15 = v83 == 0LL;
      }
      else {
        BOOL v15 = 1;
      }
      BOOL v24 = v15
         || v84 == 0LL
         || v85 == 0LL
         || v86 == 0LL
         || v87 == 0LL
         || v89 == 0LL
         || v90 == 0LL
         || v88 == 0LL
         || v91 == 0LL
         || v81 == 0LL;
      int v25 = v24;
      v26 = (uint64_t (*)(uint64_t, uint64_t))*((void *)a1 + 3);
      if (v24)
      {
        if (v26 == sub_1879BA318 || (int v27 = v25, sub_1879BA2C8(a1) == -1))
        {
LABEL_123:
          a2->num = 12;
          v28 = (const __int32 *)&unk_1879CAD18;
          goto LABEL_138;
        }

        int v25 = v27;
        int v14 = sub_1879BA78C;
        int v13 = sub_1879BA690;
        size_t v12 = sub_1879BA58C;
        uint64_t v11 = sub_1879BA548;
        unint64_t v10 = sub_1879BA4C4;
        size_t v9 = sub_1879BA46C;
        size_t v8 = sub_1879BA3F0;
        uint64_t v7 = sub_1879BA3B4;
        uint64_t v6 = sub_1879BA318;
        int v5 = sub_1879BA378;
      }

      else
      {
        if (v26 == sub_1879BA318)
        {
          int v76 = v25;
          sub_1879BA548(*(void *)a1);
          int v14 = v91;
          uint64_t v11 = v88;
          int v25 = v76;
        }

        *((_DWORD *)a1 + 2) = -1;
      }

      *((void *)a1 + 2) = v5;
      *((void *)a1 + 3) = v6;
      *((void *)a1 + 4) = v7;
      *((void *)a1 + 5) = v8;
      *((void *)a1 + 6) = v9;
      *((void *)a1 + 7) = v10;
      *((void *)a1 + 10) = v12;
      *((void *)a1 + 11) = v13;
      *((void *)a1 + 8) = v14;
      *((void *)a1 + 9) = v11;
      if (!v25) {
        return 0;
      }
      goto LABEL_123;
    case 1:
      if ((v81 & 0x80000000) == 0)
      {
        int v29 = 0;
        *(_DWORD *)(*(void *)a1 + 48LL) = (_DWORD)v81;
        return v29;
      }

      a2->num = 15;
      v28 = (const __int32 *)&unk_1879CAF04;
      goto LABEL_138;
    case 2:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_1879BA318)
      {
        v28 = (const __int32 *)&unk_1879CADFC;
        int v30 = 14;
        goto LABEL_137;
      }

      int v59 = *(_DWORD *)(*(void *)a1 + 52LL);
      a2->num = v59;
      if (v59 > -2) {
        return 0;
      }
      v28 = (const __int32 *)&unk_1879CADA4;
      int v30 = 13;
      goto LABEL_137;
    case 3:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 2))(*(void *)a1, a2);
    case 4:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 4))(*(void *)a1, a2);
    case 5:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 5))(*(void *)a1, a2);
    case 6:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 3))(*(void *)a1, a2);
    case 7:
      return (*((uint64_t (**)(void, HistEventW *, void))a1 + 7))(*(void *)a1, a2, v81);
    case 8:
      return (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
    case 9:
      return (*((uint64_t (**)(void, HistEventW *, const __int32 *))a1 + 11))(*(void *)a1, a2, v81);
    case 10:
      int v29 = (*((uint64_t (**)(void, HistEventW *, const __int32 *))a1 + 10))(*(void *)a1, a2, v81);
      if (v29 != -1) {
        *((_DWORD *)a1 + 2) = a2->num;
      }
      return v29;
    case 11:
      if ((*((unsigned int (**)(void, HistEventW *, void))a1 + 7))( *(void *)a1,  a2,  *((unsigned int *)a1 + 2)) == -1) {
        return -1;
      }
      return (*((uint64_t (**)(void, HistEventW *, const __int32 *))a1 + 11))(*(void *)a1, a2, v81);
    case 12:
      history_wend(a1);
      return 0;
    case 13:
      size_t v32 = wcslen(v81);
      int v33 = (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v33 == -1) {
          goto LABEL_103;
        }
        if (wcsncmp(v81, a2->str, v32))
        {
          int v33 = (*((uint64_t (**)(void, HistEventW *))a1 + 5))(*(void *)a1, a2);
          continue;
        }

        return 0;
      }

    case 14:
      size_t v34 = wcslen(v81);
      int v35 = (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v35 == -1) {
          goto LABEL_103;
        }
        if (wcsncmp(v81, a2->str, v34))
        {
          int v35 = (*((uint64_t (**)(void, HistEventW *))a1 + 3))(*(void *)a1, a2);
          continue;
        }

        return 0;
      }

    case 15:
      int v36 = (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v36 == -1) {
          goto LABEL_103;
        }
        if (a2->num != (_DWORD)v81)
        {
          int v36 = (*((uint64_t (**)(void, HistEventW *))a1 + 3))(*(void *)a1, a2);
          continue;
        }

        return 0;
      }

    case 16:
      int v37 = (*((uint64_t (**)(void, HistEventW *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v37 == -1) {
          goto LABEL_103;
        }
        if (a2->num != (_DWORD)v81)
        {
          int v37 = (*((uint64_t (**)(void, HistEventW *))a1 + 5))(*(void *)a1, a2);
          continue;
        }

        return 0;
      }

    case 17:
      v38 = fopen((const char *)v81, "r");
      if (!v38) {
        goto LABEL_80;
      }
      v39 = v38;
      uint64_t v40 = fgetln(v38, &__n);
      if (!v40 || strncmp(v40, "_HiStOrY_V2_\n", __n) || (v63 = malloc(0x400uLL)) == 0LL)
      {
        fclose(v39);
        goto LABEL_80;
      }

      v64 = v63;
      v65 = fgetln(v39, &__n);
      if (v65)
      {
        v66 = v65;
        int v29 = 0;
        size_t v67 = 1024LL;
        while (1)
        {
          size_t v68 = __n;
          if (__n && v66[__n - 1] == 10)
          {
            --__n;
            --v68;
          }

          if (v67 < v68)
          {
            size_t v67 = (v68 & 0xFFFFFFFFFFFFFC00LL) + 1024;
            v69 = realloc(v64, v67);
            if (!v69) {
              break;
            }
            size_t v68 = __n;
            v64 = v69;
          }

          int v78 = 0;
          v70 = (char *)v64;
          if (v68)
          {
            v70 = (char *)v64;
            do
            {
              --v68;
              int v72 = *v66++;
              int v71 = v72;
              while (1)
              {
                int v73 = unvis(v70, v71, &v78, 0);
                if (v73 != 2) {
                  break;
                }
                ++v70;
              }

              if (v73 && v73 != 3)
              {
                if (v73 != 1) {
                  goto LABEL_164;
                }
                ++v70;
              }
            }

            while (v68);
          }

          v74 = unvis(v70, 0, &v78, 2048) == 1 ? v70 + 1 : v70;
          char *v74 = 0;
LABEL_164:
          v75 = sub_1879C7E88((__int32 *)v64, (uint64_t)&unk_18C6E5168);
          if (!v75
            || (*((unsigned int (**)(void, _BYTE *, __int32 *))a1 + 10))(*(void *)a1, v79, v75) == -1)
          {
            break;
          }

          ++v29;
          v66 = fgetln(v39, &__n);
          if (!v66) {
            goto LABEL_177;
          }
        }

        int v29 = -1;
      }

      else
      {
        int v29 = 0;
      }

LABEL_177:
      free(v64);
      fclose(v39);
      if (v29 == -1)
      {
LABEL_80:
        a2->num = 10;
        v28 = (const __int32 *)&unk_1879CAC54;
        goto LABEL_138;
      }

      return v29;
    case 18:
      v41 = fopen((const char *)v81, "w");
      if (!v41) {
        goto LABEL_125;
      }
      v42 = v41;
      int v43 = fileno(v41);
      if (fchmod(v43, 0x180u) == -1 || fputs("_HiStOrY_V2_\n", v42) == -1 || (uint64_t v44 = malloc(0x400uLL)) == 0LL)
      {
        fclose(v42);
        goto LABEL_125;
      }

      unint64_t v45 = v44;
      if ((*((unsigned int (**)(void, _BYTE *))a1 + 4))(*(void *)a1, v79) == -1)
      {
        int v29 = 0;
        goto LABEL_174;
      }

      int v29 = 0;
      size_t v46 = 1024LL;
      while (2)
      {
        uint64_t v47 = sub_1879C7D54(v80, (uint64_t)&unk_18C6E5188);
        size_t v48 = 4 * strlen((const char *)v47);
        if (v48 < v46) {
          goto LABEL_90;
        }
        size_t v46 = (v48 & 0xFFFFFFFFFFFFFC00LL) + 1024;
        v49 = realloc(v45, v46);
        if (v49)
        {
          unint64_t v45 = v49;
LABEL_90:
          strvis((char *)v45, (const char *)v47, 28);
          fprintf(v42, "%s\n", (const char *)v45);
          ++v29;
          continue;
        }

        break;
      }

      int v29 = -1;
LABEL_174:
      free(v45);
      fclose(v42);
      if (v29 == -1)
      {
LABEL_125:
        a2->num = 11;
        v28 = (const __int32 *)&unk_1879CACC8;
        goto LABEL_138;
      }

      return v29;
    case 19:
      (*((void (**)(void, HistEventW *))a1 + 9))(*(void *)a1, a2);
      return 0;
    case 20:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_1879BA318)
      {
LABEL_94:
        a2->num = 14;
        v28 = (const __int32 *)&unk_1879CADFC;
        goto LABEL_138;
      }

      int v60 = *(_DWORD *)(*(void *)a1 + 60LL);
      int v29 = 0;
      if ((_DWORD)v81) {
        unsigned int v61 = v60 | 1;
      }
      else {
        unsigned int v61 = v60 & 0xFFFFFFFE;
      }
      *(_DWORD *)(*(void *)a1 + 60LL) = v61;
      return v29;
    case 21:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_1879BA318)
      {
        int v29 = 0;
        int v50 = *(_DWORD *)(*(void *)a1 + 60LL) & 1;
      }

      else
      {
        a2->str = (const __int32 *)&unk_1879CADFC;
        int v29 = -1;
        int v50 = 14;
      }

      a2->num = v50;
      return v29;
    case 22:
      return (*((uint64_t (**)(void, HistEventW *, void))a1 + 8))(*(void *)a1, a2, v81);
    case 23:
      int v51 = (_DWORD)v81 + 1;
      while (--v51 > 0)
      {
        if ((*((unsigned int (**)(void, HistEventW *))a1 + 5))(*(void *)a1, a2) == -1)
        {
LABEL_103:
          a2->num = 9;
          v28 = (const __int32 *)&unk_1879CAC14;
LABEL_138:
          a2->str = v28;
          return -1;
        }
      }

      if (!v82) {
        return 0;
      }
      int v29 = 0;
      *(void *)v82 = *(void *)(*(void *)(*(void *)a1 + 40LL) + 16LL);
      return v29;
    case 24:
      int v52 = (int)v81;
      uint64_t v53 = *(void *)a1;
      if (!*(_DWORD *)(*(void *)a1 + 52LL))
      {
        v28 = (const __int32 *)&unk_1879CAB04;
        int v30 = 5;
LABEL_137:
        a2->num = v30;
        goto LABEL_138;
      }

      uint64_t v54 = *(void *)a1;
      do
        uint64_t v54 = *(void *)(v54 + 32);
      while (v54 != v53 && v52-- > 0);
      *(void *)(v53 + 40) = v54;
      if (v54 == v53)
      {
        v28 = (const __int32 *)&unk_1879CAC14;
        int v30 = 9;
        goto LABEL_137;
      }

      if (v82 != (uint64_t (*)(uint64_t, uint64_t))-1LL)
      {
        a2->str = sub_1879C8C44(*(const __int32 **)(v54 + 8));
        uint64_t v56 = *(void *)(v53 + 40);
        a2->num = *(_DWORD *)v56;
        if (v82)
        {
          *(void *)v82 = *(void *)(v56 + 16);
          uint64_t v56 = *(void *)(v53 + 40);
        }

        sub_1879BB258(v53, v56);
      }

      return 0;
    case 25:
      if (!v81) {
        return -1;
      }
      v57 = sub_1879C8C44(v81);
      if (!v57) {
        return -1;
      }
      int v29 = 0;
      uint64_t v58 = *(void *)(*(void *)a1 + 40LL);
      *(void *)(v58 + 8) = v57;
      *(void *)(v58 + 16) = v82;
      return v29;
    default:
      a2->num = 1;
      v28 = (const __int32 *)&unk_1879CA9E0;
      goto LABEL_138;
  }

void sub_1879BB258(uint64_t a1, uint64_t a2)
{
  if (a2 == a1) {
    abort();
  }
  uint64_t v4 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 40) == a2)
  {
    *(void *)(a1 + 40) = v4;
    if (v4 == a1)
    {
      *(void *)(a1 + 40) = *(void *)(a2 + 24);
      uint64_t v4 = a1;
    }
  }

  *(void *)(v4 + 24) = *(void *)(a2 + 24);
  *(void *)(*(void *)(a2 + 24) + 32LL) = v4;
  free(*(void **)(a2 + 8));
  free((void *)a2);
  --*(_DWORD *)(a1 + 52);
}

uint64_t sub_1879BB2D8(uint64_t a1)
{
  uint64_t v2 = malloc(0x1000uLL);
  *(void *)(a1 + 1128) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 1136) = 0LL;
  sub_1879BB3CC(0LL);
  uint64_t result = 0LL;
  *(void *)(a1 + 1136) = 0LL;
  return result;
}

void sub_1879BB320(uint64_t a1)
{
  *(void *)(a1 + 1136) = 0LL;
}

void sub_1879BB348(uint64_t a1)
{
  *(void *)(a1 + 1128) = 0LL;
  sub_1879BB374(*(void **)(a1 + 1136));
}

void sub_1879BB374(void *a1)
{
  if (a1)
  {
    sub_1879BB374(a1[3]);
    sub_1879BB374(a1[2]);
    free(a1);
  }

uint64_t sub_1879BB3AC(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 1144) = a2;
  return a1 + 1144;
}

uint64_t sub_1879BB3BC(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 1144) = a2;
  return a1 + 1144;
}

void sub_1879BB3CC(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 16))
    {
      ((void (*)(void))sub_1879BB3CC)();
      *(void *)(a1 + 16) = 0LL;
    }

    sub_1879BB3CC(*(void *)(a1 + 24));
    switch(*(_DWORD *)(a1 + 4))
    {
      case 0:
      case 2:
        break;
      case 1:
      case 3:
        uint64_t v2 = *(void **)(a1 + 8);
        if (v2) {
          free(v2);
        }
        break;
      default:
        abort();
    }

    free((void *)a1);
  }

uint64_t sub_1879BB448(EditLine *a1, __int32 *a2, void *a3)
{
  uint64_t v6 = (uint64_t *)((char *)a1 + 1136);
  while (1)
  {
    uint64_t v7 = *v6;
    while (*(_DWORD *)v7 != *a2)
    {
      uint64_t v7 = *(void *)(v7 + 24);
      if (!v7)
      {
        *a3 = 0LL;
        return 1LL;
      }
    }

    uint64_t v6 = (uint64_t *)(v7 + 16);
    if (!*(void *)(v7 + 16)) {
      break;
    }
    if (el_wgetc(a1, a2) != 1)
    {
      uint64_t result = 0LL;
      *(_BYTE *)a3 = 7;
      return result;
    }
  }

  *a3 = *(void *)(v7 + 8);
  if (!*(_DWORD *)(v7 + 4)) {
    return 0LL;
  }
  *a2 = 0;
  return *(unsigned int *)(v7 + 4);
}

void sub_1879BB4F4(uint64_t a1, int *a2, const __int32 **a3, int a4)
{
  int v5 = *a2;
  if (!*a2)
  {
    size_t v9 = *(FILE **)(a1 + 24);
    unint64_t v10 = "keymacro_add: Null extended-key not allowed.\n";
    size_t v11 = 45LL;
    goto LABEL_11;
  }

  if (!a4 && *(_BYTE *)a3 == 24)
  {
    size_t v9 = *(FILE **)(a1 + 24);
    unint64_t v10 = "keymacro_add: sequence-lead-in command not allowed\n";
    size_t v11 = 51LL;
LABEL_11:
    fwrite(v10, v11, 1uLL, v9);
    return;
  }

  size_t v12 = *(_DWORD **)(a1 + 1136);
  if (!v12)
  {
    size_t v12 = malloc(0x20uLL);
    if (v12)
    {
      *size_t v12 = v5;
      v12[1] = 2;
      *((void *)v12 + 2) = 0LL;
      *((void *)v12 + 3) = 0LL;
      *((void *)v12 + 1) = 0LL;
    }

    *(void *)(a1 + 1136) = v12;
  }

  sub_1879BB5B4(v12, a2, a3, a4);
}

void sub_1879BB5B4(_DWORD *a1, int *a2, const __int32 **a3, int a4)
{
  while (1)
  {
    int v8 = *a2;
    if (*a1 == *a2)
    {
      size_t v9 = a1;
    }

    else
    {
      while (1)
      {
        size_t v9 = (_DWORD *)*((void *)a1 + 3);
        if (!v9) {
          break;
        }
        a1 = (_DWORD *)*((void *)a1 + 3);
        if (*v9 == v8) {
          goto LABEL_9;
        }
      }

      unint64_t v10 = malloc(0x20uLL);
      size_t v9 = v10;
      if (v10)
      {
        *unint64_t v10 = v8;
        v10[1] = 2;
        *((void *)v10 + 2) = 0LL;
        *((void *)v10 + 3) = 0LL;
        *((void *)v10 + 1) = 0LL;
      }

      *((void *)a1 + 3) = v10;
    }

uint64_t sub_1879BB6F4(uint64_t result, uint64_t a2, int *a3)
{
  if (*a3 <= 256)
  {
    uint64_t v3 = *a3;
    if (*(_BYTE *)(a2 + v3) == 24)
    {
      uint64_t v4 = *(void *)(result + 1056);
      uint64_t v5 = *(void *)(result + 1048);
      if (v4 == a2 && *(_BYTE *)(v5 + v3) != 24) {
        return sub_1879BB74C(result, a3);
      }
      if (v5 == a2 && *(_BYTE *)(v4 + v3) != 24) {
        return sub_1879BB74C(result, a3);
      }
    }
  }

  return result;
}

uint64_t sub_1879BB74C(uint64_t a1, _DWORD *a2)
{
  if (*a2)
  {
    if (*(void *)(a1 + 1136)) {
      sub_1879BB798((_DWORD **)(a1 + 1136), a2);
    }
    return 0LL;
  }

  else
  {
    fwrite("keymacro_delete: Null extended-key not allowed.\n", 0x30uLL, 1uLL, *(FILE **)(a1 + 24));
    return 0xFFFFFFFFLL;
  }

uint64_t sub_1879BB798(_DWORD **a1, _DWORD *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *a1;
  if (**a1 != *a2)
  {
    while (1)
    {
      uint64_t v6 = v3;
      uint64_t v3 = (_DWORD *)*((void *)v3 + 3);
      if (!v3) {
        return 0LL;
      }
      if (*v3 == *a2)
      {
        int v7 = a2[1];
        uint64_t v4 = a2 + 1;
        if (v7) {
          goto LABEL_7;
        }
        uint64_t v2 = v6 + 6;
        goto LABEL_12;
      }
    }
  }

  int v5 = a2[1];
  uint64_t v4 = a2 + 1;
  if (v5)
  {
    uint64_t v6 = 0LL;
LABEL_7:
    if (!*((void *)v3 + 2)) {
      return 0LL;
    }
    uint64_t result = sub_1879BB798(v3 + 4, v4);
    if (!(_DWORD)result) {
      return result;
    }
    if (*((void *)v3 + 2)) {
      return 0LL;
    }
    size_t v9 = v6 + 6;
    if (!v6) {
      size_t v9 = v2;
    }
    *size_t v9 = *((void *)v3 + 3);
  }

  else
  {
LABEL_12:
    *uint64_t v2 = *((void *)v3 + 3);
  }

  *((void *)v3 + 3) = 0LL;
  sub_1879BB3CC((uint64_t)v3);
  return 1LL;
}

uint64_t sub_1879BB85C(uint64_t result, _DWORD *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(unsigned int **)(result + 1136);
  if (v4 || *a2)
  {
    **(_DWORD **)(result + 1128) = 34;
    unint64_t v5 = 1LL;
    uint64_t v6 = a2;
    while (2)
    {
      int v7 = v4;
      while (1)
      {
        if (!v7) {
          return fprintf(*(FILE **)(v3 + 24), "Unbound extended key %ls\n", a2);
        }
        if (!v6) {
          return sub_1879BBC34(v3, v4, v5);
        }
        unint64_t v8 = *v6;
        if (!(_DWORD)v8)
        {
          uint64_t v4 = v7;
          return sub_1879BBC34(v3, v4, v5);
        }

        if (*v7 == (_DWORD)v8) {
          break;
        }
        int v7 = (unsigned int *)*((void *)v7 + 3);
        if (!v7) {
          return fprintf(*(FILE **)(v3 + 24), "Unbound extended key %ls\n", a2);
        }
      }

      uint64_t v9 = sub_1879C819C((_DWORD *)(*(void *)(v3 + 1128) + 4 * v5), 1024 - v5, v8);
      if (v9 == -1) {
        return fprintf(*(FILE **)(v3 + 24), "Unbound extended key %ls\n", a2);
      }
      uint64_t v4 = (unsigned int *)*((void *)v7 + 2);
      ++v6;
      if (v4)
      {
        v5 += v9;
        continue;
      }

      break;
    }

    if (*v6) {
      return fprintf(*(FILE **)(v3 + 24), "Unbound extended key %ls\n", a2);
    }
    unint64_t v10 = *(unsigned __int32 **)(v3 + 1128);
    *(void *)&v10[v9 + v5] = 34LL;
    return sub_1879BB990(v3, v10, (unsigned int **)v7 + 1, v7[1]);
  }

  return result;
}

uint64_t sub_1879BB990(uint64_t result, unsigned __int32 *a2, unsigned int **a3, int a4)
{
  uint64_t v5 = result;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (a4)
    {
      if (a4 != 3 && a4 != 1) {
        abort();
      }
      if (a4 == 1) {
        uint64_t v6 = "";
      }
      else {
        uint64_t v6 = "[]";
      }
      sub_1879BBAD0(*a3, v16, 1024LL, v6);
      goto LABEL_9;
    }

    uint64_t v11 = *(void *)(result + 1104);
    int v12 = *(const __int32 **)v11;
    if (*(void *)v11)
    {
      int v13 = *(unsigned __int8 *)a3;
      if (*(_DWORD *)(v11 + 8) == v13)
      {
LABEL_17:
        wcstombs(v16, v12, 0x400uLL);
        v16[1023] = 0;
LABEL_9:
        int v7 = *(FILE **)(v5 + 16);
        unint64_t v8 = sub_1879C7D54(a2, v5 + 1264);
        return fprintf(v7, "%-15s->  %s\n", (const char *)v8, v16);
      }

      int v14 = (_DWORD *)(v11 + 32);
      while (1)
      {
        int v12 = (const __int32 *)*((void *)v14 - 1);
        if (!v12) {
          break;
        }
        int v15 = *v14;
        v14 += 6;
        if (v15 == v13) {
          goto LABEL_17;
        }
      }
    }
  }

  else
  {
    uint64_t v9 = *(FILE **)(result + 16);
    unint64_t v10 = sub_1879C7D54(a2, result + 1264);
    return fprintf(v9, "%-15s->  %s\n", (const char *)v10, "no input");
  }

  return result;
}

unint64_t sub_1879BBAD0(unsigned int *a1, char *a2, uint64_t a3, char *a4)
{
  int v7 = a1;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  unint64_t v8 = a2;
  if (*a4)
  {
    unint64_t v8 = a2 + 1;
    if (a3 >= 1) {
      *a2 = *a4;
    }
  }

  uint64_t v9 = &a2[a3];
  unint64_t v10 = *a1;
  if ((_DWORD)v10)
  {
    do
    {
      uint64_t v11 = v20;
      uint64_t v12 = sub_1879C819C(v20, 8uLL, v10);
      int v13 = v8;
      while (1)
      {
        unint64_t v8 = v13;
        if (v12 <= 0) {
          break;
        }
        --v12;
        unsigned __int32 v14 = *v11++;
        uint64_t v15 = sub_1879C7E14(v13, v9 - v13, v14);
        int v13 = &v8[v15];
        if (v15 == -1) {
          goto LABEL_15;
        }
      }

      unsigned int v16 = v7[1];
      ++v7;
      unint64_t v10 = v16;
    }

    while (v16);
  }

  else
  {
    if (v8 < v9) {
      *unint64_t v8 = 94;
    }
    uint64_t v17 = v8 + 1;
    v8 += 2;
    if (v17 < v9) {
      *uint64_t v17 = 64;
    }
  }

LABEL_15:
  if (*a4 && a4[1])
  {
    int v18 = v8 + 1;
    if (v8 < v9) {
      *unint64_t v8 = a4[1];
    }
  }

  else
  {
    int v18 = v8;
  }

  if (v18 < v9) {
    *int v18 = 0;
  }
  unint64_t result = v18 - a2 + 1;
  if (result >= a3) {
    a2[a3 - 1] = 0;
  }
  return result;
}

uint64_t sub_1879BBC34(uint64_t a1, unsigned int *a2, unint64_t a3)
{
  if (a3 > 0x3FA)
  {
    *(void *)(*(void *)(a1 + 1128) + 4 * a3 + 4) = 34LL;
    fwrite("Some extended keys too long for internal print buffer", 0x35uLL, 1uLL, *(FILE **)(a1 + 24));
    return fprintf(*(FILE **)(a1 + 24), " %ls...\n", *(const void **)(a1 + 1128));
  }

  else
  {
    do
    {
      uint64_t v6 = sub_1879C819C((_DWORD *)(*(void *)(a1 + 1128) + 4 * a3), 1024 - a3, *a2);
      uint64_t v7 = *((void *)a2 + 2);
      if (v7)
      {
        uint64_t result = sub_1879BBC34(a1, v7, v6 + a3);
      }

      else
      {
        uint64_t v9 = *(unsigned __int32 **)(a1 + 1128);
        *(void *)&v9[v6 + a3] = 34LL;
        uint64_t result = sub_1879BB990(a1, v9, (unsigned int **)a2 + 1, a2[1]);
      }

      a2 = (unsigned int *)*((void *)a2 + 3);
    }

    while (a2);
  }

  return result;
}

uint64_t sub_1879BBD24(uint64_t a1)
{
  uint64_t v2 = malloc(0x100uLL);
  *(void *)(a1 + 1048) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = malloc(0x100uLL);
  *(void *)(a1 + 1056) = v3;
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 1072) = &unk_1879CAF7C;
  *(void *)(a1 + 1080) = &unk_1879CB07C;
  *(void *)(a1 + 1088) = &unk_1879CB17C;
  uint64_t v4 = malloc(0x990uLL);
  *(void *)(a1 + 1104) = v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_1879C7CC4();
  memcpy(v5, v6, 0x990uLL);
  uint64_t v7 = malloc(0x330uLL);
  *(void *)(a1 + 1112) = v7;
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v8 = v7;
  uint64_t v9 = sub_1879C7CB8();
  memcpy(v8, v9, 0x330uLL);
  *(_DWORD *)(a1 + 1120) = 102;
  sub_1879BBDF0(a1);
  return 0LL;
}

void sub_1879BBDF0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 1056);
  uint64_t v3 = *(void *)(a1 + 1048);
  uint64_t v4 = *(void *)(a1 + 1088);
  uint64_t v5 = *(void *)(a1 + 1080);
  *(_DWORD *)(a1 + 1096) = 1;
  *(void *)(a1 + 1064) = v2;
  sub_1879BB320(a1);
  for (uint64_t i = 0LL; i != 256; ++i)
  {
    *(_BYTE *)(v2 + i) = *(_BYTE *)(v4 + i);
    *(_BYTE *)(v3 + i) = *(_BYTE *)(v5 + i);
  }

  sub_1879BBEF8(a1);
  uint64_t v7 = *(void *)(a1 + 1056);
  for (uint64_t j = 128LL; j != 256; ++j)
  {
    if (__maskrune(j, 0x40000uLL)) {
      *(_BYTE *)(v7 + j) = 8;
    }
  }

  sub_1879C5F1C(a1, 1);
  sub_1879C4614(a1);
}

void sub_1879BBEA0(uint64_t a1)
{
  *(void *)(a1 + 1048) = 0LL;
  free(*(void **)(a1 + 1056));
  *(void *)(a1 + 1056) = 0LL;
  *(void *)(a1 + 1072) = 0LL;
  *(void *)(a1 + 1088) = 0LL;
  *(void *)(a1 + 1080) = 0LL;
  free(*(void **)(a1 + 1104));
  *(void *)(a1 + 1104) = 0LL;
  free(*(void **)(a1 + 1112));
  *(void *)(a1 + 1112) = 0LL;
}

void sub_1879BBEF8(uint64_t a1)
{
  uint64_t v2 = 0LL;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 1048);
  do
  {
    if (*(_BYTE *)(*(void *)(a1 + 1056) + v2) == 48)
    {
      uint64_t v3 = *(void *)(a1 + 1056);
      goto LABEL_11;
    }

    ++v2;
  }

  while (v2 != 256);
  uint64_t v2 = 0LL;
  while (*(_BYTE *)(v3 + v2) != 48)
  {
    if (++v2 == 256)
    {
      if (*(_DWORD *)(a1 + 1096) != 1) {
        uint64_t v3 = *(void *)(a1 + 1056);
      }
      LODWORD(v2) = 27;
      break;
    }
  }

void sub_1879BC020(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 1056);
  uint64_t v3 = *(void *)(a1 + 1048);
  uint64_t v4 = *(void *)(a1 + 1072);
  *(_DWORD *)(a1 + 1096) = 0;
  *(void *)(a1 + 1064) = v2;
  sub_1879BB320(a1);
  for (uint64_t i = 0LL; i != 256; ++i)
  {
    *(_BYTE *)(v2 + i) = *(_BYTE *)(v4 + i);
    *(_BYTE *)(v3 + i) = 34;
  }

  sub_1879BBEF8(a1);
  uint64_t v6 = *(void *)(a1 + 1056);
  for (uint64_t j = 128LL; j != 256; ++j)
  {
    if (__maskrune(j, 0x40000uLL)) {
      *(_BYTE *)(v6 + j) = 8;
    }
  }

  uint64_t v9 = 0x1800000018LL;
  int v10 = 0;
  unint64_t v8 = (const __int32 **)sub_1879BB3AC(a1, 41);
  sub_1879BB4F4(a1, (int *)&v9, v8, 0);
  sub_1879C5F1C(a1, 1);
  sub_1879C4614(a1);
}

uint64_t sub_1879BC124(uint64_t a1, __int32 *a2)
{
  if (!wcscmp(a2, dword_1879CB27C))
  {
    sub_1879BC020(a1);
  }

  else
  {
    if (wcscmp(a2, dword_1879CB294)) {
      return 0xFFFFFFFFLL;
    }
    sub_1879BBDF0(a1);
  }

  return 0LL;
}

uint64_t sub_1879BC18C(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  int v2 = *(_DWORD *)(a1 + 1096);
  if (!v2)
  {
    uint64_t v3 = &unk_1879CB27C;
    goto LABEL_7;
  }

  if (v2 != 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = &unk_1879CB294;
LABEL_7:
  uint64_t result = 0LL;
  *a2 = v3;
  return result;
}

uint64_t sub_1879BC1C8()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = (const void **)v1;
  uint64_t v3 = v0;
  uint64_t v4 = *(__int32 **)(v1 + 8);
  if (!v4)
  {
LABEL_14:
    fwrite("Standard key bindings\n", 0x16uLL, 1uLL, *(FILE **)(v3 + 16));
    uint64_t v12 = 0LL;
    signed int v13 = 0;
    do
    {
      uint64_t v14 = *(void *)(v3 + 1056);
      if (*(unsigned __int8 *)(v14 + v13) != *(unsigned __int8 *)(v14 + v12))
      {
        sub_1879BC820(v3, v14, v13, v12 - 1);
        signed int v13 = v12;
      }

      ++v12;
    }

    while (v12 != 256);
    sub_1879BC820(v3, *(void *)(v3 + 1056), v13, 0xFFu);
    fwrite("Alternative key bindings\n", 0x19uLL, 1uLL, *(FILE **)(v3 + 16));
    uint64_t v15 = 0LL;
    signed int v16 = 0;
    do
    {
      uint64_t v17 = *(void *)(v3 + 1048);
      if (*(unsigned __int8 *)(v17 + v16) != *(unsigned __int8 *)(v17 + v15))
      {
        sub_1879BC820(v3, v17, v16, v15 - 1);
        signed int v16 = v15;
      }

      ++v15;
    }

    while (v15 != 256);
    sub_1879BC820(v3, *(void *)(v3 + 1048), v16, 0xFFu);
    fwrite("Multi-character bindings\n", 0x19uLL, 1uLL, *(FILE **)(v3 + 16));
    sub_1879BB85C(v3, &dword_1879CB2A0);
    fwrite("Arrow key bindings\n", 0x13uLL, 1uLL, *(FILE **)(v3 + 16));
    uint64_t v18 = v3;
    int v19 = &dword_1879CB2A0;
    goto LABEL_23;
  }

  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = 0LL;
  uint64_t v8 = *(void *)(v0 + 1056);
  uint64_t v9 = 2LL;
  while (*v4 == 45)
  {
    uint64_t v10 = v4[1];
    uint64_t v11 = 1LL;
    switch((int)v10)
    {
      case 'k':
        int v5 = 1;
        goto LABEL_12;
      case 'l':
        int v24 = *(_DWORD *)(v3 + 1120);
        if (v24 < 1) {
          return 0LL;
        }
        int v25 = *(const void ***)(v3 + 1104);
        v26 = &v25[3 * v24];
        do
        {
          fprintf(*(FILE **)(v3 + 16), "%ls\n\t%ls\n", *v25, v25[2]);
          uint64_t result = 0LL;
          v25 += 3;
        }

        while (v25 < v26);
        return result;
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'q':
      case 't':
      case 'u':
        goto LABEL_9;
      case 'r':
        int v6 = 1;
        goto LABEL_12;
      case 's':
        goto LABEL_13;
      case 'v':
        sub_1879BBDF0(v3);
        return 0LL;
      default:
        if ((_DWORD)v10 == 97)
        {
          uint64_t v8 = *(void *)(v3 + 1048);
        }

        else
        {
          if ((_DWORD)v10 == 101)
          {
            sub_1879BC020(v3);
            return 0LL;
          }

LABEL_57:
    sub_1879BB4F4(v29, v30, v28, v31);
    goto LABEL_58;
  }

  int v32 = sub_1879BCDE8(v3, v23);
  if (v32 == -1)
  {
    return 0xFFFFFFFFLL;
  }

  if (v5)
  {
    int v33 = (void *)sub_1879BB3BC(v3, 0LL);
    sub_1879C4A34(v3, v4, v33, 0);
    return 0LL;
  }

  char v35 = v32;
  if (v4[1])
  {
    v28 = (const __int32 **)sub_1879BB3AC(v3, v32);
    uint64_t v29 = v3;
    int v30 = v4;
    int v31 = 0;
    goto LABEL_57;
  }

  sub_1879BB6F4(v3, v8, v4);
  uint64_t result = 0LL;
  *(_BYTE *)(v8 + *(unsigned __int8 *)v4) = v35;
  return result;
}

unint64_t sub_1879BC654(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (*a3 && a3[1]) {
    return sub_1879BB85C(a1, a3);
  }
  unint64_t result = sub_1879BBAD0(a3, v10, 1024LL, (char *)&unk_1879D0D1A);
  int v7 = *(_DWORD *)(a1 + 1120);
  if (v7 >= 1)
  {
    unint64_t v8 = *(void *)(a1 + 1104);
    unint64_t v9 = v8 + 24LL * v7;
    while (*(_DWORD *)(v8 + 8) != *(unsigned __int8 *)(a2 + *(unsigned __int8 *)a3))
    {
      v8 += 24LL;
      if (v8 >= v9) {
        return result;
      }
    }

    return fprintf(*(FILE **)(a1 + 16), "%s\t->\t%ls\n", v10, *(const void **)v8);
  }

  return result;
}

uint64_t sub_1879BC768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a3 && a4)
  {
    uint64_t v9 = *(int *)(a1 + 1120) + 1LL;
    uint64_t v10 = realloc(*(void **)(a1 + 1112), 8 * v9);
    if (v10 && (*(void *)(a1 + 1112) = v10, (uint64_t v11 = realloc(*(void **)(a1 + 1104), 24 * v9)) != 0LL))
    {
      uint64_t v12 = v11;
      uint64_t result = 0LL;
      *(void *)(a1 + 1104) = v12;
      uint64_t v13 = *(int *)(a1 + 1120);
      *(void *)(*(void *)(a1 + 1112) + 8 * v13) = a4;
      uint64_t v14 = *(void *)(a1 + 1104) + 24LL * (int)v13;
      *(void *)uint64_t v14 = a2;
      *(_DWORD *)(v14 + 8) = v13;
      *(void *)(v14 + 16) = a3;
      *(_DWORD *)(a1 + 1120) = v13 + 1;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t sub_1879BC820(uint64_t result, uint64_t a2, signed int a3, unsigned int a4)
{
  uint64_t v6 = result;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14[0] = a3;
  v14[1] = 0;
  v13[0] = a4;
  v13[1] = 0;
  int v7 = *(unsigned __int8 *)(a2 + a3);
  if (v7 == 34)
  {
    if (a3 == a4)
    {
      sub_1879BBAD0(v14, v12, 1024LL, "");
      return fprintf(*(FILE **)(v6 + 16), "%-15s->  is undefined\n");
    }
  }

  else
  {
    int v8 = *(_DWORD *)(result + 1120);
    if (v8 < 1) {
LABEL_8:
    }
      abort();
    unint64_t v9 = *(void *)(result + 1104);
    unint64_t v10 = v9 + 24LL * v8;
    while (*(_DWORD *)(v9 + 8) != v7)
    {
      v9 += 24LL;
      if (v9 >= v10) {
        goto LABEL_8;
      }
    }

    sub_1879BBAD0(v14, v12, 1024LL, "");
    if (a3 == a4)
    {
      return fprintf(*(FILE **)(v6 + 16), "%-15s->  %ls\n");
    }

    else
    {
      sub_1879BBAD0(v13, v11, 1024LL, "");
      return fprintf(*(FILE **)(v6 + 16), "%-4s to %-7s->  %ls\n");
    }
  }

  return result;
}

uint64_t sub_1879BC97C(EditLine *a1, const __int32 *a2)
{
  uint64_t v4 = tok_winit(0LL);
  tok_wstr(v4, a2, &v6, (const __int32 ***)&v7);
  int v6 = el_wparse(a1, v6, (const __int32 **)v7);
  tok_wend(v4);
  return v6;
}

int el_wparse(EditLine *a1, int a2, const __int32 **a3)
{
  if (a2 < 1)
  {
    LODWORD(v10) = -1;
    return (int)v10;
  }

  uint64_t v4 = *(void *)&a2;
  int v6 = wcschr(*a3, 58);
  int v7 = *a3;
  if (v6)
  {
    int v8 = v6;
    uint64_t v9 = (char *)v6 - (char *)v7;
    if (v6 == v7) {
      goto LABEL_12;
    }
    unint64_t v10 = (__int32 *)malloc((char *)v6 - (char *)v7);
    if (!v10) {
      return (int)v10;
    }
    uint64_t v11 = v10;
    size_t v12 = (v9 >> 2) - 1;
    wcsncpy(v10, v7, v12);
    v11[v12] = 0;
    int v13 = sub_1879C2240(*(__int32 **)a1, v11);
    free(v11);
    if (!v13)
    {
LABEL_12:
      LODWORD(v10) = 0;
      return (int)v10;
    }

    int v7 = v8 + 1;
  }

  uint64_t v14 = 0LL;
  uint64_t v15 = (const __int32 *)&unk_1879CB2F8;
  while (wcscmp(v15, v7))
  {
    uint64_t v15 = *(const __int32 **)((char *)&off_18A0E92E0 + v14 + 16);
    v14 += 16LL;
    if (v14 == 112)
    {
      LODWORD(v10) = -1;
      return (int)v10;
    }
  }

  LODWORD(v10) = -(*(int (**)(EditLine *, uint64_t, const __int32 **))((char *)&off_18A0E92E0 + v14 + 8))( a1,  v4,  a3);
  return (int)v10;
}

uint64_t sub_1879BCAFC(__int32 **a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *a1;
  uint64_t v3 = *a1 + 1;
  int v2 = *v3;
  if (!*v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = *v1;
  if ((_DWORD)v5 == 94)
  {
    if (v2 == 63) {
      uint64_t v5 = 127LL;
    }
    else {
      uint64_t v5 = v2 & 0x9F;
    }
    goto LABEL_14;
  }

  if ((_DWORD)v5 == 92)
  {
    if (v2 > 96)
    {
      uint64_t v5 = 7LL;
      switch(v2)
      {
        case 'a':
          goto LABEL_14;
        case 'b':
          uint64_t v5 = 8LL;
          break;
        case 'c':
        case 'd':
LABEL_40:
          uint64_t v5 = (*a1)[1];
          break;
        case 'e':
          uint64_t v5 = 27LL;
          break;
        case 'f':
          uint64_t v5 = 12LL;
          break;
        default:
          switch(v2)
          {
            case 'n':
              uint64_t v5 = 10LL;
              break;
            case 'r':
              uint64_t v5 = 13LL;
              break;
            case 't':
              uint64_t v5 = 9LL;
              break;
            case 'v':
              uint64_t v5 = 11LL;
              break;
            default:
              goto LABEL_40;
          }

          break;
      }

      goto LABEL_14;
    }

    if ((v2 - 48) >= 8)
    {
      uint64_t v5 = (*a1)[1];
      if (v2 != 85) {
        goto LABEL_14;
      }
      int v13 = 0;
      v12[0] = xmmword_1879CB2B4;
      v12[1] = unk_1879CB2C4;
      v12[2] = xmmword_1879CB2D4;
      v12[3] = unk_1879CB2E4;
      if (v1[2] == 43)
      {
        LODWORD(v5) = 0;
        uint64_t v3 = v1 + 3;
        int v9 = 5;
        while (1)
        {
          unint64_t v10 = wcschr((const __int32 *)v12, *v3);
          if (v9 != 1 && !v10) {
            break;
          }
          if (v10) {
            uint64_t v5 = ((unint64_t)((char *)v10 - (char *)v12) >> 2) | (16 * (_DWORD)v5);
          }
          else {
            uint64_t v5 = v5;
          }
          v3 += v10 != 0LL;
          if (!--v9)
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }

    else
    {
      uint64_t v5 = 0LL;
      int v6 = (unsigned int *)(v1 + 4);
      uint64_t v7 = 1LL;
      while (1)
      {
        unsigned int v8 = v1[v7];
        if (v8 - 56 < 0xFFFFFFF8) {
          break;
        }
        uint64_t v5 = (v8 - 48) | (8 * (_DWORD)v5);
        if ((_DWORD)(++v7 * 4) == 16) {
          goto LABEL_21;
        }
      }

      int v6 = (unsigned int *)&v1[v7];
LABEL_21:
      if (v5 < 0x100)
      {
        uint64_t v3 = (__int32 *)(v6 - 1);
        goto LABEL_14;
      }
    }

    return 0xFFFFFFFFLL;
  }

  uint64_t v3 = *a1;
LABEL_14:
  *a1 = v3 + 1;
  return v5;
}

__int32 *sub_1879BCD20(__int32 *a1, __int32 *a2)
{
  int v2 = a1;
  uint64_t v7 = a2;
  for (uint64_t i = a1; ; ++i)
  {
    __int32 v4 = *a2;
    if (*a2 <= 91) {
      break;
    }
    if (v4 != 92 && v4 != 94) {
      goto LABEL_12;
    }
    __int32 v5 = sub_1879BCAFC(&v7);
    if (v5 == -1) {
      return 0LL;
    }
    __int32 *i = v5;
    a2 = v7;
LABEL_13:
    ;
  }

  if (v4 == 77)
  {
    if (a2[1] == 45 && a2[2])
    {
      __int32 *i = 27;
      uint64_t v7 = a2 + 2;
      a2 += 2;
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  if (v4)
  {
LABEL_12:
    uint64_t v7 = ++a2;
    __int32 *i = v4;
    goto LABEL_13;
  }

  __int32 *i = 0;
  return v2;
}

uint64_t sub_1879BCDE8(uint64_t a1, __int32 *a2)
{
  if (!*(_DWORD *)(a1 + 1120)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = 0LL;
  for (uint64_t i = (const __int32 **)(*(void *)(a1 + 1104) + 8LL); wcscmp(*(i - 1), a2); i += 3)
  {
  }

  return *(unsigned int *)i;
}

double sub_1879BCE54(uint64_t a1, int a2)
{
  uint64_t v3 = 888LL;
  if (a2)
  {
    uint64_t v4 = a1 + 888;
  }

  else
  {
    uint64_t v3 = 864LL;
    uint64_t v4 = a1 + 864;
  }

  int v5 = *(_DWORD *)(v4 + 20);
  int v6 = (__int32 *)(*(uint64_t (**)(void))(a1 + v3))();
  if (!v5) {
    int v6 = sub_1879C7E88(v6, a1 + 1264);
  }
  unsigned __int32 v7 = *v6;
  if (*v6)
  {
    BOOL v8 = 0;
    int v9 = (unsigned __int32 *)(v6 + 1);
    do
    {
      if (*(_DWORD *)(v4 + 16) == v7)
      {
        BOOL v8 = !v8;
      }

      else if (v8)
      {
        sub_1879C3A7C(a1, v7);
        BOOL v8 = 1;
      }

      else
      {
        sub_1879C0E7C(a1, v7, 1);
        BOOL v8 = 0;
      }

      unsigned __int32 v10 = *v9++;
      unsigned __int32 v7 = v10;
    }

    while (v10);
  }

  double result = *(double *)(a1 + 848);
  *(double *)(v4 + 8) = result;
  return result;
}

uint64_t sub_1879BCF04(uint64_t a1)
{
  *(void *)(a1 + 864) = sub_1879BCF38;
  *(void *)(a1 + 872) = 0LL;
  *(_DWORD *)(a1 + 880) = 0;
  *(void *)(a1 + 888) = sub_1879BCF44;
  *(void *)(a1 + 896) = 0LL;
  *(_DWORD *)(a1 + 904) = 0;
  return 0LL;
}

char *sub_1879BCF38()
{
  return asc_18C6E50C0;
}

void *sub_1879BCF44()
{
  return &unk_18C6E51A8;
}

uint64_t sub_1879BCF54(uint64_t a1, void *a2, int a3, int a4, int a5)
{
  if (a4 != 21 && a4) {
    uint64_t v5 = a1 + 888;
  }
  else {
    uint64_t v5 = a1 + 864;
  }
  int v6 = sub_1879BCF44;
  if (a4) {
    BOOL v7 = a4 == 21;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    int v6 = sub_1879BCF38;
  }
  if (a2) {
    int v6 = a2;
  }
  *(void *)uint64_t v5 = v6;
  *(void *)(v5 + 8) = 0LL;
  *(_DWORD *)(v5 + 16) = a3;
  *(_DWORD *)(v5 + 20) = a5;
  return 0LL;
}

uint64_t sub_1879BCFA0(uint64_t a1, void *a2, _DWORD *a3, int a4)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = a1 + 864;
  uint64_t v5 = 888LL;
  if (a4) {
    uint64_t v4 = a1 + 888;
  }
  else {
    uint64_t v5 = 864LL;
  }
  *a2 = *(void *)(a1 + v5);
  uint64_t result = 0LL;
  if (a3) {
    *a3 = *(_DWORD *)(v4 + 16);
  }
  return result;
}

uint64_t sub_1879BCFE4(uint64_t a1)
{
  *(void *)(a1 + 1256) = sub_1879BCFF8;
  return 0LL;
}

uint64_t sub_1879BCFF8(uint64_t a1, __int32 *a2)
{
  int v4 = 0;
  unint64_t v5 = 0LL;
  int v6 = 0;
  while (1)
  {
LABEL_2:
    *(_DWORD *)(*(void *)(a1 + 1248) + 116LL) = 0;
    while (1)
    {
      ssize_t v7 = read(*(_DWORD *)(a1 + 32), &v17[v5], 1uLL);
      if (v7 != -1) {
        break;
      }
      int v8 = *__error();
      int v9 = *(_DWORD *)(*(void *)(a1 + 1248) + 116LL);
      if (v9 == 28) {
        goto LABEL_19;
      }
      if (v9 == 19)
      {
        el_wset((EditLine *)a1, 20);
LABEL_19:
        sub_1879C2DD8(a1);
        goto LABEL_2;
      }

      if (v4)
      {
LABEL_32:
        *__error() = v8;
LABEL_33:
        *a2 = 0;
        return 0xFFFFFFFFLL;
      }

      int v10 = *(_DWORD *)(a1 + 32);
      if (v8 == 35)
      {
LABEL_10:
        int v11 = fcntl(v10, 3, 0LL);
        if (v11 == -1) {
          goto LABEL_32;
        }
        int v4 = 1;
        if (fcntl(v10, 4, v11 & 0xFFFFFFFB) == -1) {
          goto LABEL_32;
        }
      }

      else
      {
        int v4 = 1;
        if (v8 != 4)
        {
          if (v8 != -1) {
            goto LABEL_32;
          }
          goto LABEL_10;
        }
      }
    }

    ssize_t v12 = v7;
    if (!v7) {
      return v12;
    }
    __int32 v13 = v17[0];
    if ((*(_BYTE *)(a1 + 44) & 0x10) == 0)
    {
      if (v17[0] < 0 && !v5)
      {
        int v14 = mbtowc(a2, v17, 1uLL);
        if (v14 == 1) {
          return v12;
        }
        int v6 = v14;
        __int32 v13 = v17[0];
      }

      *a2 = v13;
      goto LABEL_26;
    }

    if ((v17[0] & 0x80) == 0 || v17[0] - 245 >= 0xFFFFFFCD)
    {
      int v6 = mbtowc(a2, v17, v5 + 1);
      if (v6 == -1)
      {
        mbtowc(0LL, 0LL, 0LL);
        if (v5++ < 5) {
          continue;
        }
        *__error() = 92;
        goto LABEL_33;
      }

uint64_t sub_1879BD1DC(uint64_t a1, uint64_t (*a2)(uint64_t a1, __int32 *a2))
{
  int v2 = sub_1879BCFF8;
  if (a2) {
    int v2 = a2;
  }
  *(void *)(a1 + 1256) = v2;
  return 0LL;
}

uint64_t sub_1879BD1F8(uint64_t a1)
{
  else {
    return *(void *)(a1 + 1256);
  }
}

void el_wpush(EditLine *a1, const __int32 *a2)
{
  if (a2)
  {
    int v3 = *((_DWORD *)a1 + 254);
    if (v3 <= 8)
    {
      *((_DWORD *)a1 + 254) = v3 + 1;
      int v4 = sub_1879C8C44(a2);
      uint64_t v5 = *((int *)a1 + 254);
      *(void *)(*((void *)a1 + 128) + 8 * v5) = v4;
      if (v4) {
        return;
      }
      *((_DWORD *)a1 + 254) = v5 - 1;
    }
  }

  el_beep_0(a1);
  sub_1879C4B70((uint64_t)a1);
}

int el_wgetc(EditLine *a1, __int32 *a2)
{
  if ((*((_DWORD *)a1 + 254) & 0x80000000) != 0)
  {
LABEL_4:
    if ((sub_1879C6088((uint64_t)a1) & 0x80000000) != 0)
    {
      return 0;
    }

    else
    {
      int v6 = (*((uint64_t (**)(EditLine *, __int32 *))a1 + 157))(a1, a2);
      if (v6 < 0) {
        *((_DWORD *)a1 + 12) = *__error();
      }
      if ((*((_BYTE *)a1 + 44) & 0x80) != 0) {
        *a2 = *(char *)a2;
      }
    }
  }

  else
  {
    while (1)
    {
      uint64_t v4 = **((void **)a1 + 128);
      uint64_t v5 = *((int *)a1 + 255);
      if (*(_DWORD *)(v4 + 4 * v5)) {
        break;
      }
      sub_1879BD350((void ***)a1 + 127);
      if ((*((_DWORD *)a1 + 254) & 0x80000000) != 0) {
        goto LABEL_4;
      }
    }

    *((_DWORD *)a1 + 255) = v5 + 1;
    *a2 = *(_DWORD *)(v4 + 4 * v5);
    return 1;
  }

  return v6;
}

void sub_1879BD350(void ***a1)
{
  uint64_t v2 = *(unsigned int *)a1;
  if ((int)v2 >= 1)
  {
    for (uint64_t i = 0LL; i != v2; ++i)
      a1[1][i] = a1[1][i + 1];
  }

  *a1 = (void **)(v2 - 1);
}

uint64_t sub_1879BD3B0(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 44);
  if ((v2 & 1) != 0)
  {
    uint64_t result = sub_1879C2DD8(result);
    int v2 = *(_DWORD *)(v1 + 44);
  }

  if ((v2 & 2) == 0)
  {
    if ((v2 & 0xC) == 8) {
      sub_1879C6088(v1);
    }
    el_resize((EditLine *)v1);
    sub_1879C1C74(v1);
    sub_1879B6A74(v1, 0);
    uint64_t result = sub_1879C0FDC(v1);
    if ((*(_BYTE *)(v1 + 44) & 8) != 0) {
      return sub_1879C4B70(v1);
    }
  }

  return result;
}

uint64_t sub_1879BD434(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 44);
  if ((v2 & 8) == 0)
  {
    uint64_t result = sub_1879C6578(result);
    int v2 = *(_DWORD *)(v1 + 44);
  }

  if ((v2 & 1) != 0) {
    return sub_1879C2FA4(v1);
  }
  return result;
}

const __int32 *__cdecl el_wgets(EditLine *a1, int *a2)
{
  if (a2) {
    *a2 = 0;
  }
  int v4 = *((_DWORD *)a1 + 11);
  if ((v4 & 2) != 0)
  {
    uint64_t v17 = (int *)*((void *)a1 + 11);
    while (1)
    {
      int v18 = (*((uint64_t (**)(EditLine *, int *))a1 + 157))(a1, v17);
      if (v18 != 1) {
        goto LABEL_74;
      }
      if ((unint64_t)(v17 + 1) >= *((void *)a1 + 14))
      {
        uint64_t v20 = *((void *)a1 + 11);
        int v19 = (int *)((char *)v17 + *((void *)a1 + 11) - v20);
      }

      else
      {
        int v19 = v17;
      }

      uint64_t v17 = v19 + 1;
      if ((*((_BYTE *)a1 + 44) & 8) != 0)
      {
LABEL_84:
        LODWORD(v15) = 1;
        goto LABEL_90;
      }

      int v21 = *v19;
      LODWORD(v15) = 1;
      if (v21 == 10 || v21 == 13) {
        goto LABEL_90;
      }
    }
  }

  if ((v4 & 8) == 0)
  {
    sub_1879BD3B0((uint64_t)a1);
    int v4 = *((_DWORD *)a1 + 11);
  }

  if ((v4 & 4) != 0)
  {
    BOOL v22 = (v4 & 8) == 0;
    uint64_t v23 = 104LL;
    if (v22) {
      uint64_t v23 = 88LL;
    }
    uint64_t v17 = *(int **)((char *)a1 + v23);
    sub_1879C4B70((uint64_t)a1);
    while (1)
    {
      int v18 = (*((uint64_t (**)(EditLine *, int *))a1 + 157))(a1, v17);
      if (v18 != 1) {
        break;
      }
      if ((unint64_t)(v17 + 1) >= *((void *)a1 + 14))
      {
        uint64_t v25 = *((void *)a1 + 11);
        int v24 = (int *)((char *)v17 + *((void *)a1 + 11) - v25);
      }

      else
      {
        int v24 = v17;
      }

      uint64_t v17 = v24 + 1;
      if ((*((_DWORD *)a1 + 11) & 8) != 0) {
        goto LABEL_84;
      }
      int v26 = *v24;
      LODWORD(v15) = 1;
      if (v26 == 10 || v26 == 13) {
        goto LABEL_90;
      }
    }

LABEL_74:
    LODWORD(v15) = v18;
    if (v18 == -1)
    {
      if (*__error() == 4) {
        uint64_t v17 = (int *)*((void *)a1 + 11);
      }
      *((_DWORD *)a1 + 12) = *__error();
      LODWORD(v15) = -1;
    }

    else if (!v18)
    {
      *((_BYTE *)a1 + 137) = -1;
    }

LABEL_90:
    *((void *)a1 + 12) = v17;
    *((void *)a1 + 13) = v17;
    *uint64_t v17 = 0;
    unint64_t v27 = ((unint64_t)v17 - *((void *)a1 + 11)) >> 2;
LABEL_91:
    LODWORD(v28) = v27;
    if (!a2) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }

  uint64_t v5 = MEMORY[0x1895F8770];
  while (2)
  {
    while (2)
    {
      while (2)
      {
        *((_DWORD *)a1 + 12) = 0;
        do
        {
          int v6 = el_wgetc(a1, &v33);
          if (v6 != 1)
          {
            if (v6) {
              int v6 = *__error();
            }
            LODWORD(v15) = 0;
            *((_DWORD *)a1 + 12) = v6;
            *((_BYTE *)a1 + 137) = -1;
            goto LABEL_80;
          }

          if (*((_DWORD *)a1 + 33))
          {
            *((_DWORD *)a1 + 33) = 0;
            __int32 v7 = v33 | 0x80;
            v33 |= 0x80u;
          }

          else
          {
            __int32 v7 = v33;
          }

          if (v7 <= 255)
          {
            unsigned int v8 = *(unsigned __int8 *)(*((void *)a1 + 133) + v7);
            if (v8 == 24)
            {
              int v9 = sub_1879BB448(a1, &v33, &v34);
              if (v9 == 1)
              {
                el_wpush(a1, v34);
                unsigned int v8 = 24;
              }

              else
              {
                if (v9) {
                  abort();
                }
                unsigned int v8 = v34;
              }
            }
          }

          else
          {
            unsigned int v8 = 8;
          }

          if (!*((void *)a1 + 131)) {
            *((void *)a1 + 133) = *((void *)a1 + 132);
          }
        }

        while (v8 == 24);
        if (*((_DWORD *)a1 + 12) == 4)
        {
          int v32 = (_DWORD *)*((void *)a1 + 11);
          *int v32 = 0;
          *((void *)a1 + 12) = v32;
          *((void *)a1 + 13) = v32;
          LODWORD(v15) = -1;
          goto LABEL_80;
        }

        if (*((_DWORD *)a1 + 280) <= v8) {
          continue;
        }
        break;
      }

      *((_BYTE *)a1 + 137) = v8;
      __int32 v10 = v33;
      *((_DWORD *)a1 + 35) = v33;
      if (*((_DWORD *)a1 + 274) == 1 && *((void *)a1 + 133) == *((void *)a1 + 132))
      {
        int v11 = (__int32 *)*((void *)a1 + 121);
        if ((unint64_t)v11 < *((void *)a1 + 122))
        {
          if (v8 == 64 && v11 != *((__int32 **)a1 + 120))
          {
            uint64_t v12 = *(v11 - 1);
            else {
              int v13 = *(_DWORD *)(v5 + 4 * v12 + 60) & 0x40000;
            }
            if (v13)
            {
              *((void *)a1 + 121) -= 4LL;
              goto LABEL_37;
            }

            __int32 v10 = v33;
            int v11 = (__int32 *)*((void *)a1 + 121);
          }

          *int v11 = v10;
          *((void *)a1 + 121) = v11 + 1;
        }
      }

LABEL_37:
      int v14 = (*(uint64_t (**)(EditLine *, void))(*((void *)a1 + 139) + 8LL * v8))(a1, v33);
      *((_BYTE *)a1 + 136) = v8;
      LODWORD(v15) = -1;
      switch(v14)
      {
        case 0:
          goto LABEL_48;
        case 1:
          uint64_t v15 = (*((void *)a1 + 13) - *((void *)a1 + 11)) >> 2;
          goto LABEL_48;
        case 2:
          if ((*((_BYTE *)a1 + 44) & 8) != 0)
          {
            signed int v16 = (_DWORD *)*((void *)a1 + 13);
            *v16++ = 4;
            *((void *)a1 + 12) = v16;
            *((void *)a1 + 13) = v16;
            LODWORD(v15) = 1;
          }

          else
          {
            LODWORD(v15) = 0;
          }

          goto LABEL_48;
        case 3:
          continue;
        case 4:
          goto LABEL_45;
        case 5:
          sub_1879C1CAC((uint64_t)a1);
          goto LABEL_47;
        case 7:
          sub_1879C1C74((uint64_t)a1);
          sub_1879B6A74((uint64_t)a1, 1);
          goto LABEL_45;
        case 8:
          sub_1879C20BC((uint64_t)a1);
          sub_1879C1C74((uint64_t)a1);
LABEL_45:
          sub_1879C0FDC((uint64_t)a1);
          break;
        case 9:
          sub_1879C0FDC((uint64_t)a1);
          el_beep_0(a1);
          break;
        default:
          el_beep_0(a1);
          sub_1879C4B70((uint64_t)a1);
          break;
      }

      break;
    }

LABEL_47:
    LODWORD(v15) = -1;
LABEL_48:
    *(void *)((char *)a1 + 124) = 0x100000000LL;
    *((_DWORD *)a1 + 250) = 0;
    if ((*((_BYTE *)a1 + 44) & 8) == 0 && (_DWORD)v15 == -1) {
      continue;
    }
    break;
  }

LABEL_80:
  sub_1879C4B70((uint64_t)a1);
  if ((*((_BYTE *)a1 + 44) & 8) == 0)
  {
    sub_1879BD434((uint64_t)a1);
    if ((_DWORD)v15 == -1) {
      LODWORD(v27) = 0;
    }
    else {
      LODWORD(v27) = v15;
    }
    goto LABEL_91;
  }

  uint64_t v28 = (*((void *)a1 + 13) - *((void *)a1 + 11)) >> 2;
  LODWORD(v27) = v28;
  if (a2)
  {
LABEL_92:
    *a2 = v27;
    LODWORD(v28) = v27;
  }

LABEL_93:
  if ((_DWORD)v28)
  {
    uint64_t result = (const __int32 *)*((void *)a1 + 11);
    result[(int)v28] = 0;
  }

  else if ((_DWORD)v15 == -1)
  {
    if (a2) {
      *a2 = -1;
    }
    int v30 = *((_DWORD *)a1 + 12);
    int v31 = __error();
    uint64_t result = 0LL;
    *int v31 = v30;
  }

  else
  {
    return 0LL;
  }

  return result;
}

void rl_prep_terminal(int a1)
{
}

void rl_deprep_terminal(void)
{
}

int rl_set_prompt(const char *a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = (const char *)&unk_1879D0D1A;
  }
  int v2 = rl_prompt;
  if (rl_prompt)
  {
    LODWORD(i) = strcmp(rl_prompt, v1);
    if (!(_DWORD)i) {
      return (int)i;
    }
    free(v2);
  }

  int v4 = strdup(v1);
  rl_prompt = v4;
  if (v4)
  {
    for (uint64_t i = strchr(v4, 2); i; uint64_t i = strchr(rl_prompt, 2))
      char *i = 1;
  }

  else
  {
    LODWORD(i) = -1;
  }

  return (int)i;
}

int rl_initialize(void)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (qword_18C6E51B8) {
    el_end((EditLine *)qword_18C6E51B8);
  }
  if (qword_18C6E51C0) {
    history_end((History *)qword_18C6E51C0);
  }
  uint64_t v0 = rl_instream;
  if (!rl_instream)
  {
    uint64_t v0 = (FILE *)*MEMORY[0x1895F89D8];
    rl_instream = (FILE *)*MEMORY[0x1895F89D8];
  }

  if (!rl_outstream) {
    rl_outstream = (FILE *)*MEMORY[0x1895F89E0];
  }
  int v1 = fileno(v0);
  int v2 = tcgetattr(v1, &v11);
  uint64_t v3 = v11.c_lflag & 8;
  int v4 = el_init(rl_readline_name, rl_instream, rl_outstream, (FILE *)*MEMORY[0x1895F89D0]);
  qword_18C6E51B8 = (uint64_t)v4;
  if (v2 != -1 && v3 == 0) {
    el_set(v4, 11, 0LL);
  }
  int v6 = history_init();
  qword_18C6E51C0 = (uint64_t)v6;
  int result = -1;
  if (qword_18C6E51B8 && v6)
  {
    history(v6, &v10, 1, 0x7FFFFFFFLL);
    history_length = 0;
    max_input_history = 0x7FFFFFFF;
    el_set((EditLine *)qword_18C6E51B8, 10, history, qword_18C6E51C0);
    el_set((EditLine *)qword_18C6E51B8, 23, sub_1879BDDD0, &rl_line_buffer);
    if (rl_getc_function) {
      el_set((EditLine *)qword_18C6E51B8, 13, sub_1879BDDF8);
    }
    if (rl_set_prompt((const char *)&unk_1879D0D1A) == -1)
    {
      history_end((History *)qword_18C6E51C0);
      el_end((EditLine *)qword_18C6E51B8);
      return -1;
    }

    else
    {
      el_set((EditLine *)qword_18C6E51B8, 21, sub_1879BDE3C, 1LL);
      el_set((EditLine *)qword_18C6E51B8, 3, dword_18C6E5120);
      el_set((EditLine *)qword_18C6E51B8, 2, "emacs");
      if (rl_terminal_name) {
        el_set((EditLine *)qword_18C6E51B8, 1, rl_terminal_name);
      }
      else {
        el_get((EditLine *)qword_18C6E51B8, 1, &rl_terminal_name);
      }
      el_set((EditLine *)qword_18C6E51B8, 9, "rl_complete", "ReadLine compatible completion function", sub_1879BDE54);
      el_set((EditLine *)qword_18C6E51B8, 4, "^I", "rl_complete", 0LL);
      el_set((EditLine *)qword_18C6E51B8, 9, "rl_tstp", "ReadLine compatible suspend function", sub_1879BDE6C);
      el_set((EditLine *)qword_18C6E51B8, 4, "^Z", "rl_tstp", 0LL);
      el_set((EditLine *)qword_18C6E51B8, 4, "^W", "ed-delete-prev-word", 0LL);
      el_source((EditLine *)qword_18C6E51B8, 0LL);
      rl_line_int buffer = (char *)el_line((EditLine *)qword_18C6E51B8)->buffer;
      unsigned int v8 = el_line((EditLine *)qword_18C6E51B8);
      int buffer = (int)v8->buffer;
      rl_point = LODWORD(v8->cursor) - LODWORD(v8->buffer);
      rl_end = LODWORD(v8->lastchar) - buffer;
      if (rl_startup_hook) {
        rl_startup_hook(0LL, 0);
      }
      return 0;
    }
  }

  return result;
}

const LineInfo *sub_1879BDDD0(EditLine *a1, const char **a2)
{
  int result = el_line(a1);
  *a2 = result->buffer;
  return result;
}

uint64_t sub_1879BDDF8(uint64_t a1, _BYTE *a2)
{
  int v3 = rl_getc_function(0LL);
  if (v3 == -1) {
    return 0LL;
  }
  *a2 = v3;
  return 1LL;
}

char *sub_1879BDE3C()
{
  rl_already_prompted = 1;
  return rl_prompt;
}

uint64_t sub_1879BDE54(int a1, int a2)
{
  return rl_complete(a1, a2);
}

uint64_t sub_1879BDE6C()
{
  return 0LL;
}

char *__cdecl readline(const char *a1)
{
  int v9 = (char *)a1;
  if (qword_18C6E51B8) {
    BOOL v1 = qword_18C6E51C0 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    rl_initialize();
  }
  dword_18C6E5F88 = 0;
  setjmp(dword_18C6E51CC);
  if (rl_set_prompt(v9) == -1) {
    return 0LL;
  }
  if (rl_pre_input_hook) {
    rl_pre_input_hook(0LL, 0);
  }
  int v2 = (EditLine *)qword_18C6E51B8;
  if (!off_18C6E5F90
    || (*(_BYTE *)(qword_18C6E51B8 + 44) & 2) == 0
    && (el_set((EditLine *)qword_18C6E51B8, 13, sub_1879BE008),
        byte_18C6E51C8 = 1,
        int v2 = (EditLine *)qword_18C6E51B8,
        !off_18C6E5F90))
  {
    if (byte_18C6E51C8)
    {
      el_set(v2, 13, 0LL);
      byte_18C6E51C8 = 0;
      int v2 = (EditLine *)qword_18C6E51B8;
    }
  }

  rl_already_prompted = 0;
  int v4 = el_gets(v2, &v8);
  uint64_t v5 = 0LL;
  if (v4)
  {
    uint64_t v6 = (v8 - 1);
    if (v8 >= 1)
    {
      int result = strdup(v4);
      if (!result) {
        return result;
      }
      uint64_t v5 = result;
    }
  }

  __int32 v7 = v5;
  history((History *)qword_18C6E51C0, &v10, 2);
  history_length = v10.num;
  return v7;
}

uint64_t sub_1879BE008(uint64_t a1, _BYTE *a2)
{
  *a2 = 0;
  int v3 = (void (*)(void))off_18C6E5F90;
  if (off_18C6E5F90)
  {
    while (1)
    {
      while (1)
      {
        v3();
        if (ioctl(*(_DWORD *)(a1 + 32), 0x4004667FuLL, &v8) < 0) {
          return 0xFFFFFFFFLL;
        }
        if (v8) {
          break;
        }
        ssize_t v5 = 0LL;
LABEL_9:
        int v3 = (void (*)(void))off_18C6E5F90;
        if (v5 || !off_18C6E5F90)
        {
LABEL_11:
          if (v3) {
            return v5;
          }
          goto LABEL_14;
        }
      }

      ssize_t v5 = read(*(_DWORD *)(a1 + 32), a2, 1uLL);
      if ((v5 & 0x8000000000000000LL) == 0) {
        goto LABEL_9;
      }
      uint64_t v6 = __error();
      int v3 = (void (*)(void))off_18C6E5F90;
      if (*v6 != 35) {
        goto LABEL_11;
      }
      if (!off_18C6E5F90) {
        goto LABEL_14;
      }
    }
  }

  ssize_t v5 = 0LL;
LABEL_14:
  el_set((EditLine *)a1, 13, 0LL);
  return v5;
}

void using_history(void)
{
  if (qword_18C6E51C0) {
    BOOL v0 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0) {
    rl_initialize();
  }
}

const char *__cdecl get_history_event(const char *a1, int *a2, int a3)
{
  uint64_t v3 = *a2;
  int v4 = a1[v3];
  int v7 = a1[v3 + 1];
  if (v7 != v4 && v7 != 0)
  {
    if (v7 == 45) {
      int v11 = v3 + 2;
    }
    else {
      int v11 = v3 + 1;
    }
    int v12 = a1[v11];
    if ((v12 - 48) > 9)
    {
      size_t v18 = 0LL;
      if (v12 == 63) {
        int v19 = v11 + 1;
      }
      else {
        int v19 = v11;
      }
      uint64_t v20 = v19;
      int v21 = &a1[v19];
      while (1)
      {
        int v22 = v21[v18];
        unsigned int v23 = (char)v22;
        if (!v21[v18] || v22 == 10) {
          break;
        }
        if (v12 == 63 && (char)v22 == 63)
        {
          int v29 = v11 + 1 + v18;
          goto LABEL_51;
        }

        if (v12 != 63)
        {
          uint64_t v25 = (1LL << v22) & 0x400000100000200LL;
          BOOL v26 = v23 > 0x3A || v25 == 0;
          if (!v26 || v23 == a3)
          {
            int v29 = v11 + v18;
            v18 += v19 - (uint64_t)v11;
            uint64_t v20 = v11;
            goto LABEL_48;
          }
        }

        ++v18;
      }

      if (v12 == 63) {
        int v28 = v11 + 1;
      }
      else {
        int v28 = v11;
      }
      int v29 = v28 + v18;
      if (v12 != 63)
      {
LABEL_48:
        int v30 = v29;
        if (v11 == v29) {
          return 0LL;
        }
        goto LABEL_59;
      }

LABEL_51:
      else {
        int v30 = v29;
      }
      if (v19 == v29)
      {
        int v31 = (char *)qword_18C6E5290;
        if (qword_18C6E5290)
        {
          if (*(_BYTE *)qword_18C6E5290)
          {
            int v29 = v19;
            goto LABEL_61;
          }
        }
      }

      if (v19 == v29) {
        return 0LL;
      }
LABEL_59:
      int v32 = (char *)malloc(v18 + 1);
      if (!v32) {
        return 0LL;
      }
      int v31 = v32;
      strncpy(v32, &a1[v20], v18)[v18] = 0;
LABEL_61:
      if (!history((History *)qword_18C6E51C0, &v36, 8))
      {
        uint64_t num = v36.num;
        if (v12 == 63)
        {
          if (v31 != (char *)qword_18C6E5290)
          {
            if (qword_18C6E5290) {
              free((void *)qword_18C6E5290);
            }
            qword_18C6E5290 = (uint64_t)v31;
          }

          int v34 = history_search(v31, -1);
        }

        else
        {
          int v34 = history((History *)qword_18C6E51C0, &v37, 14, v31);
        }

        if (v34 != -1)
        {
          if (v12 == 63 && v29 != v19)
          {
            qword_18C6E5298 = (uint64_t)v31;
          }

          if (!history((History *)qword_18C6E51C0, &v36, 8))
          {
            *a2 = v30;
            str = v36.str;
            history((History *)qword_18C6E51C0, &v36, 7, num);
            return str;
          }

          return 0LL;
        }

        history((History *)qword_18C6E51C0, &v36, 3);
        fprintf(rl_outstream, "%s: Event not found\n", v31);
      }
    }

    else
    {
      int v13 = 0;
      int v14 = &a1[v11 + 1];
      do
      {
        int v13 = v12 + 10 * v13 - 48;
        int v15 = *(unsigned __int8 *)v14++;
        int v12 = v15;
        ++v11;
      }

      while ((v15 - 48) < 0xA);
      if (v7 == 45) {
        int v16 = history_length - v13 + 1;
      }
      else {
        int v16 = v13;
      }
      uint64_t v17 = history_get(v16);
      if (v17)
      {
        *a2 = v11;
        return v17->line;
      }
    }

    return 0LL;
  }

  if (history((History *)qword_18C6E51C0, &v36, 3)) {
    return 0LL;
  }
  if (a1[v3 + 1]) {
    int v9 = v3 + 2;
  }
  else {
    int v9 = v3 + 1;
  }
  *a2 = v9;
  return v36.str;
}

HIST_ENTRY *__cdecl history_get(int a1)
{
  if (qword_18C6E51C0) {
    BOOL v2 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    rl_initialize();
  }
  if (history_base > a1) {
    return 0LL;
  }
  if (history((History *)qword_18C6E51C0, &v6, 8)) {
    return 0LL;
  }
  uint64_t num = v6.num;
  if (history((History *)qword_18C6E51C0, &v6, 4)
    || history((History *)qword_18C6E51C0, &v6, 23, (a1 - history_base), &unk_18C6E52A8))
  {
    return 0LL;
  }

  int v4 = (HIST_ENTRY *)&qword_18C6E52A0;
  qword_18C6E52A0 = (uint64_t)v6.str;
  history((History *)qword_18C6E51C0, &v6, 7, num);
  return v4;
}

int history_search(const char *a1, int a2)
{
  if (history((History *)qword_18C6E51C0, &v9, 8)) {
    return -1;
  }
  uint64_t num = v9.num;
  if (a2 >= 0) {
    int v5 = 5;
  }
  else {
    int v5 = 6;
  }
  while (1)
  {
    int str = (int)v9.str;
    int v7 = strstr(v9.str, a1);
    if (v7) {
      break;
    }
    if (history((History *)qword_18C6E51C0, &v9, v5))
    {
      history((History *)qword_18C6E51C0, &v9, 7, num);
      return -1;
    }
  }

  return (_DWORD)v7 - str;
}

int history_search_prefix(const char *a1, int a2)
{
  if (a2 >= 0) {
    return history((History *)qword_18C6E51C0, &v3, 13, a1);
  }
  else {
    return history((History *)qword_18C6E51C0, &v3, 14, a1);
  }
}

int history_expand(char *a1, char **a2)
{
  if (qword_18C6E51C0) {
    BOOL v4 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    rl_initialize();
  }
  LODWORD(v5) = asc_18C6E50EC[0];
  if (!asc_18C6E50EC[0])
  {
    *a2 = strdup(a1);
    return (int)v5;
  }

  *a2 = 0LL;
  if (*a1 == asc_18C6E50EC[1])
  {
    size_t v6 = strlen(a1);
    int v7 = (char *)malloc(v6 + 5);
    *a2 = v7;
    if (!v7) {
      goto LABEL_241;
    }
    v7[1] = (char)v5;
    *int v7 = (char)v5;
    *((_WORD *)v7 + 1) = 29498;
    strcpy(v7 + 4, a1);
    a1 = *a2;
  }

  else
  {
    int v8 = strdup(a1);
    *a2 = v8;
    if (!v8) {
      goto LABEL_241;
    }
  }

  if (!*a1)
  {
    LODWORD(v5) = 0;
    v110 = 0LL;
    goto LABEL_238;
  }

  v113 = (void **)a2;
  size_t v9 = 0LL;
  __ptr = 0LL;
  size_t v122 = 0LL;
  size_t v10 = 0LL;
  int v11 = a1;
LABEL_15:
  int v12 = 0;
  char v13 = 0;
  size_t v14 = v10;
  __src = v11;
  char v15 = 1;
  size_t v16 = v10;
  size_t v127 = v10;
  while (1)
  {
    while (1)
    {
      size_t v10 = v14;
      int v11 = &a1[v14];
      uint64_t v17 = a1[v14];
      int v18 = (char)v17;
      if ((_DWORD)v17 != 92) {
        break;
      }
      ++v14;
      int v21 = &a1[v10 + 1];
      if (*(unsigned __int8 *)v21 == asc_18C6E50EC[0])
      {
        strcpy(v11, v21);
      }

      else
      {
        if ((v13 & 1) != 0) {
          goto LABEL_24;
        }
        LOBYTE(vkill(0, 18) = 92;
LABEL_31:
        if (asc_18C6E50EC[0] == v18)
        {
          size_t v14 = v10 + 1;
          if (!strchr((const char *)qword_18C6E50F8, a1[v10 + 1]))
          {
            if (!off_18C6E5FA0) {
              goto LABEL_36;
            }
            if (!off_18C6E5FA0(a1, v10))
            {
              LOBYTE(vkill(0, 18) = *v11;
              goto LABEL_36;
            }
          }
        }

        else
        {
          size_t v14 = v10 + 1;
        }
      }
    }

    if (!a1[v14]) {
      break;
    }
    if ((v13 & 1) == 0) {
      goto LABEL_31;
    }
    if ((char)v17 < 0)
    {
      int v19 = __maskrune(v17, 0x4000uLL);
      char v20 = *v11;
      goto LABEL_25;
    }

LABEL_24:
    int v19 = *(_DWORD *)(MEMORY[0x1895F8770] + 4 * v17 + 60) & 0x4000;
    char v20 = v18;
LABEL_25:
    BOOL v22 = v12 != v18 && v19 == 0;
    LOBYTE(vkill(0, 18) = v20;
    if (v22) {
      goto LABEL_31;
    }
LABEL_36:
    if (v10)
    {
      if (a1[v10 - 1] == 34) {
        int v12 = 34;
      }
      else {
        int v12 = 0;
      }
    }

    else
    {
      int v12 = 0;
    }

    char v15 = 0;
    if (a1[v10 + 1] == asc_18C6E50EC[0]) {
      size_t v14 = v10 + 2;
    }
    else {
      size_t v14 = v10 + 1;
    }
    char v13 = 1;
    size_t v16 = v10;
  }

  size_t v23 = v16 - v127;
  size_t v24 = v16 - v127 + v9;
  if (v24 + 1 <= v122)
  {
    int v5 = __ptr;
  }

  else
  {
    v122 += v23 + 1;
    int v5 = (char *)realloc(__ptr, v122);
    if (!v5)
    {
      free(*v113);
      return (int)v5;
    }
  }

  strncpy(&v5[v9], __src, v23);
  v5[v24] = 0;
  uint64_t v25 = &a1[v16];
  unint64_t v26 = v10 - v16;
  if (!a1[v16] || a1[v16] != asc_18C6E50EC[0])
  {
    v110 = v5;
    if (v26 + v24 + 1 <= v122)
    {
      a2 = (char **)v113;
    }

    else
    {
      v110 = (char *)realloc(v5, v26 + v122 + 1);
      a2 = (char **)v113;
      if (!v110)
      {
        v111 = *v113;
        goto LABEL_240;
      }
    }

    strncpy(&v110[v24], v25, v10 - v16);
    v110[v26 + v24] = 0;
    LODWORD(v5) = v127 != 0;
    goto LABEL_238;
  }

  __ptr = v5;
  int v131 = 0;
  char v27 = a1[v16 + 1];
  if (!memchr(":^*$", v27, 5uLL))
  {
    size_t v118 = v16 - v127 + v9;
    int v33 = v27;
    BOOL v34 = v27 != 35;
    if (v33 == 35)
    {
      HistEvent v36 = (char *)malloc(v16 + 1);
      if (v36)
      {
        int v128 = v34;
        history_event = strncpy(v36, a1, v16);
        int v30 = 0LL;
        history_event[v16] = 0;
        LODWORD(v32) = 1;
        int v131 = 1;
        int v31 = (char *)history_event;
        goto LABEL_67;
      }
    }

    else
    {
      if (v16)
      {
        if (a1[v16 - 1] == 34) {
          int v35 = 34;
        }
        else {
          int v35 = 0;
        }
      }

      else
      {
        int v35 = 0;
      }

      history_event = get_history_event(&a1[v16], &v131, v35);
      if (history_event)
      {
        int v128 = v34;
        int v31 = 0LL;
        LODWORD(v32) = v131;
        int v30 = history_event;
LABEL_67:
        if (a1[v16 + (int)v32] == 58)
        {
          uint64_t v32 = (int)v32;
          goto LABEL_69;
        }

        size_t v46 = v31;
        v42 = strdup(history_event);
        if (v33 == 35) {
          free(v46);
        }
        if (v42) {
          LODWORD(v5) = 1;
        }
        else {
          LODWORD(v5) = -1;
        }
LABEL_218:
        size_t v24 = v118;
        if ((int)v5 < 1 || !v42)
        {
          if (!v42) {
            goto LABEL_226;
          }
LABEL_224:
          v103 = v42;
          goto LABEL_225;
        }

        v105 = v42;
        size_t v106 = strlen(v42);
        size_t v107 = v106;
        size_t v108 = v106 + v118;
        if (v106 + v118 + 1 <= v122 || (v122 += v106 + 1, (__ptr = (char *)realloc(__ptr, v122)) != 0LL))
        {
          size_t v109 = v107;
          v42 = (char *)v105;
          strncpy(&__ptr[v118], v105, v109);
          __ptr[v108] = 0;
          size_t v24 = v108;
          goto LABEL_224;
        }

        free(*v113);
        v111 = (void *)v105;
LABEL_240:
        free(v111);
LABEL_241:
        LODWORD(v5) = 0;
        return (int)v5;
      }
    }

    LODWORD(v5) = -1;
    size_t v24 = v16 - v127 + v9;
    goto LABEL_226;
  }

  qmemcpy(v130, "!!0", 3);
  int v28 = get_history_event(v130, &v131, 0);
  int v29 = a1[v16 + 1];
  int v131 = v29 == 58;
  if (!v28)
  {
    LODWORD(v5) = -1;
    goto LABEL_226;
  }

  int v30 = v28;
  size_t v118 = v16 - v127 + v9;
  int v31 = 0LL;
  uint64_t v32 = v29 == 58;
  int v128 = 1;
LABEL_69:
  uint64_t v38 = &v25[v32];
  uint64_t v40 = (unsigned __int8 *)&v25[v32 + 1];
  int v39 = (char)*v40;
  __srca = v31;
  if (v39 == 37)
  {
    if (qword_18C6E5298) {
      v41 = (const char *)qword_18C6E5298;
    }
    else {
      v41 = (const char *)&unk_1879D0D1A;
    }
    v42 = strdup(v41);
    char v43 = v128;
    goto LABEL_110;
  }

  if (!memchr("^*$-0123456789", v39, 0xFuLL))
  {
    char v43 = v128;
    if (v128) {
      uint64_t v47 = v30;
    }
    else {
      uint64_t v47 = __srca;
    }
    v42 = strdup(v47);
    goto LABEL_110;
  }

  if (v39 > 0x2Cu)
  {
    if (v39 == 45)
    {
      int v45 = 0;
      size_t v48 = __srca;
      goto LABEL_94;
    }

    uint64_t v40 = (unsigned __int8 *)(v38 + 2);
    int v45 = 1;
    int v44 = 1;
    goto LABEL_105;
  }

  if (v39 == 36)
  {
    uint64_t v40 = (unsigned __int8 *)(v38 + 2);
LABEL_104:
    int v45 = -1;
    int v44 = -1;
LABEL_105:
    size_t v48 = __srca;
    goto LABEL_106;
  }

  if (v39 == 42)
  {
    uint64_t v40 = (unsigned __int8 *)(v38 + 2);
    int v44 = -1;
    int v45 = 1;
    goto LABEL_105;
  }

LABEL_98:
  size_t v48 = __srca;
  int v45 = 0;
  unsigned __int8 v52 = v39;
  do
  {
    int v54 = *++v40;
    int v53 = v54;
    int v45 = 10 * v45 + v52 - 48;
    unsigned __int8 v52 = v54;
  }

  while ((v54 - 48) < 0xA);
  if (v53 != 42)
  {
    int v44 = v45;
    if (v53 != 45) {
      goto LABEL_106;
    }
LABEL_94:
    v49 = (char *)(v40 + 1);
    int v50 = v40[1];
    if ((v50 - 48) > 9)
    {
      if (v50 == 36) {
        int v44 = -1;
      }
      else {
        int v44 = -2;
      }
      if (v50 == 36) {
        v40 += 2;
      }
      else {
        ++v40;
      }
    }

    else
    {
      int v44 = 0;
      do
      {
        int v44 = v50 + 10 * v44 - 48;
        int v51 = *++v49;
        int v50 = v51;
      }

      while ((v51 - 48) < 0xA);
      uint64_t v40 = (unsigned __int8 *)v49;
    }

    goto LABEL_106;
  }

  ++v40;
  int v44 = -1;
LABEL_106:
  char v43 = v128;
  if (v128) {
    v55 = v30;
  }
  else {
    v55 = v48;
  }
  v42 = history_arg_extract(v45, v44, v55);
  if (!v42)
  {
    fprintf(rl_outstream, "%s: Bad word specifier", &v25[v131]);
    LODWORD(v5) = -1;
    size_t v24 = v118;
    v103 = __srca;
    if ((v128 & 1) == 0) {
      goto LABEL_225;
    }
    goto LABEL_226;
  }

LABEL_110:
  if ((v43 & 1) == 0) {
    free(__srca);
  }
  int v56 = *v40;
  LODWORD(v5) = 1;
  int v115 = 0;
  int v129 = 0;
  while (2)
  {
    switch(v56)
    {
      case 'e':
        v57 = strrchr(v42, 46);
        if (v57) {
          goto LABEL_168;
        }
        goto LABEL_198;
      case 'f':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'q':
        goto LABEL_198;
      case 'g':
        int v129 = 2;
        goto LABEL_198;
      case 'h':
        uint64_t v58 = v42;
        int v59 = 47;
        goto LABEL_125;
      case 'p':
        int v115 = 1;
        goto LABEL_198;
      case 'r':
        uint64_t v58 = v42;
        int v59 = 46;
LABEL_125:
        int v60 = strrchr(v58, v59);
        if (v60) {
          *int v60 = 0;
        }
        goto LABEL_198;
      case 's':
        __srcb = v42;
        int v61 = v40[1];
        uint64_t v62 = qword_18C6E5AF0;
        v63 = realloc((void *)qword_18C6E5AF0, 0x10uLL);
        if (!v63)
        {
          v102 = (void *)v62;
LABEL_200:
          free(v102);
          LODWORD(v5) = 0;
          goto LABEL_214;
        }

        v64 = v63;
        uint64_t v65 = 0LL;
        int v68 = v40[2];
        size_t v67 = v40 + 2;
        int v66 = v68;
        if (v68 && v66 != v61)
        {
          uint64_t v69 = 0LL;
          size_t v70 = 16LL;
          do
          {
            if (v66 == 92)
            {
              LOBYTE(v66) = *v67;
            }

            uint64_t v65 = v69 + 1;
            v64[v69] = v66;
            if (v69 + 1 >= v70)
            {
              v70 *= 2LL;
              int v71 = realloc(v64, v70);
              if (!v71)
              {
                v102 = v64;
                goto LABEL_200;
              }

              v64 = v71;
            }

            int v72 = *++v67;
            int v66 = v72;
            if (v72) {
              BOOL v73 = v66 == v61;
            }
            else {
              BOOL v73 = 1;
            }
            uint64_t v69 = v65;
          }

          while (!v73);
        }

        v64[v65] = 0;
        qword_18C6E5AF0 = (uint64_t)v64;
        if (!*v64)
        {
          free(v64);
          qword_18C6E5AF0 = 0LL;
          goto LABEL_213;
        }

        int v74 = v67[1];
        uint64_t v40 = v67 + 1;
        if (!v74) {
          goto LABEL_196;
        }
        uint64_t v75 = qword_18C6E5AF8;
        int v76 = (char *)realloc((void *)qword_18C6E5AF8, 0x11uLL);
        if (v76)
        {
          v77 = v76;
          size_t v78 = strlen(v64);
          uint64_t v79 = 0LL;
          int v80 = *v40;
          if (!*v40 || v80 == v61)
          {
LABEL_165:
            v77[v79] = 0;
            qword_18C6E5AF8 = (uint64_t)v77;
            v42 = __srcb;
            v87 = v77;
LABEL_174:
            size_t v91 = strlen(v42);
            v117 = (char *)v87;
            size_t v92 = strlen(v87);
            size_t v93 = strlen(v64);
            int v94 = *v42;
            if (*v42)
            {
              size_t v95 = v93;
              size_t v114 = v92;
              size_t v120 = v92 - v93;
              int v96 = *v64;
              int v97 = *v42;
              __srcb = v42;
              while (1)
              {
                if (v97 == v96 && !strncmp(v42, v64, v95))
                {
                  v91 += v120;
                  uint64_t v98 = v95;
                  if (!v129)
                  {
LABEL_182:
                    v99 = __srcb;
                    v100 = (char *)malloc(v91 + 1);
                    v121 = v100;
                    if (v100)
                    {
                      while (1)
                      {
                        if (v94 == *v64 && !strncmp(v99, v64, v95))
                        {
                          strncpy(v100, v117, v114);
                          v100 += v114;
                          v99 += v95;
                          if (!v129)
                          {
                            strcpy(v100, v99);
                            v42 = __srcb;
                            v89 = v121;
LABEL_193:
                            if (v89)
                            {
                              free(v42);
                              int v129 = 0;
LABEL_169:
                              v42 = v89;
                            }

                            else
                            {
                              int v129 = 0;
                            }

                            goto LABEL_198;
                          }
                        }

                        else
                        {
                          ++v99;
                          *v100++ = v94;
                        }

                        int v94 = *(unsigned __int8 *)v99;
                        if (!*v99)
                        {
                          v42 = __srcb;
                          v89 = v121;
                          goto LABEL_192;
                        }
                      }
                    }

                    int v129 = 0;
LABEL_196:
                    v42 = __srcb;
                    goto LABEL_198;
                  }
                }

                else
                {
                  uint64_t v98 = 1LL;
                }

                v42 += v98;
                int v97 = *v42;
                if (!*v42) {
                  goto LABEL_182;
                }
              }
            }

            v89 = (char *)malloc(v91 + 1);
            v100 = v89;
            if (v89)
            {
LABEL_192:
              char *v100 = 0;
              goto LABEL_193;
            }

            int v129 = 0;
LABEL_198:
            int v101 = *++v40;
            int v56 = v101;
            continue;
          }

          size_t v81 = v78;
          uint64_t v79 = 0LL;
          size_t v119 = v78 + 1;
          v116 = (char *)qword_18C6E5AF0;
          unint64_t v82 = 16LL;
          while (1)
          {
            if (v79 + v81 + 1 >= v82)
            {
              v82 += v119;
              v83 = (char *)realloc(v77, v82 + 1);
              if (!v83)
              {
                v104 = v77;
                goto LABEL_204;
              }

              int v80 = *v40;
              v77 = v83;
            }

            if (v80 == 92)
            {
              int v84 = v40[1];
              if (v84 == 38 || v84 == v61) {
                ++v40;
              }
              LOBYTE(v80) = *v40;
            }

            else if (v80 == 38)
            {
              strcpy(&v77[v79], v116);
              v79 += v81;
              goto LABEL_162;
            }

            v77[v79++] = v80;
LABEL_162:
            int v86 = *++v40;
            int v80 = v86;
            if (!v86 || v80 == v61)
            {
              v64 = (_BYTE *)qword_18C6E5AF0;
              goto LABEL_165;
            }
          }
        }

        v104 = (void *)v75;
LABEL_204:
        free(v104);
LABEL_213:
        LODWORD(v5) = -1;
LABEL_214:
        v103 = __srcb;
        size_t v24 = v118;
LABEL_225:
        free(v103);
LABEL_226:
        size_t v9 = v24;
        if (*v11) {
          goto LABEL_15;
        }
        a2 = (char **)v113;
        v110 = __ptr;
        if ((_DWORD)v5 == 2) {
          add_history(__ptr);
        }
LABEL_238:
        free(*a2);
        *a2 = v110;
        return (int)v5;
      case 't':
        v88 = strrchr(v42, 47);
        if (!v88) {
          goto LABEL_198;
        }
        v57 = v88 + 1;
LABEL_168:
        v89 = strdup(v57);
        free(v42);
        goto LABEL_169;
      default:
        if (v56 != 38)
        {
          if (v56) {
            goto LABEL_198;
          }
          if (v115) {
            LODWORD(v5) = 2;
          }
          else {
            LODWORD(v5) = 1;
          }
          goto LABEL_218;
        }

        v64 = (_BYTE *)qword_18C6E5AF0;
        v87 = (const char *)qword_18C6E5AF8;
        if (qword_18C6E5AF0) {
          BOOL v90 = qword_18C6E5AF8 == 0;
        }
        else {
          BOOL v90 = 1;
        }
        if (v90) {
          goto LABEL_198;
        }
        goto LABEL_174;
    }
  }

int add_history(const char *a1)
{
  if (a1)
  {
    BOOL v1 = a1;
    BOOL v2 = (History *)qword_18C6E51C0;
    if (qword_18C6E51C0) {
      BOOL v3 = qword_18C6E51B8 == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      rl_initialize();
      BOOL v2 = (History *)qword_18C6E51C0;
    }

    history(v2, &v6, 10, v1);
    if (history((History *)qword_18C6E51C0, &v6, 2))
    {
      int num = history_length;
    }

    else
    {
      int num = v6.num;
      history_length = v6.num;
    }

    LODWORD(a1) = num < 1;
  }

  return (int)a1;
}

char *__cdecl history_arg_extract(int a1, int a2, const char *a3)
{
  int v5 = history_tokenize(a3);
  if (!v5) {
    return 0LL;
  }
  HistEvent v6 = v5;
  int v7 = *v5;
  if (*v5)
  {
    uint64_t v8 = 0LL;
    while (v5[v8++])
      ;
    unint64_t v10 = v8 - 2;
    if (a1 == 36) {
      int v11 = v8 - 2;
    }
    else {
      int v11 = a1;
    }
    if (a2 == 36) {
      int v12 = v8 - 2;
    }
    else {
      int v12 = a2;
    }
    unint64_t v13 = v12 + (((_DWORD)v8 - 1) & (v12 >> 31));
    if (v11 >= 0) {
      unint64_t v14 = v11;
    }
    else {
      unint64_t v14 = v13;
    }
    if (((v14 | v13) & 0x80000000) != 0 || v10 < v14)
    {
      char v15 = 0LL;
    }

    else
    {
      char v15 = 0LL;
      if (v10 >= v13 && v14 <= v13)
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = v13 - v14 + 1;
        int v21 = (const char **)&v5[v14];
        do
        {
          BOOL v22 = *v21++;
          v19 += strlen(v22) + 1;
          --v20;
        }

        while (v20);
        char v15 = (char *)malloc(v19 + 1);
        if (v15)
        {
          uint64_t v23 = 0LL;
          do
          {
            size_t v24 = v6[v14];
            strcpy(&v15[v23], v24);
            v23 += strlen(v24);
            if (v14 < v13) {
              v15[v23++] = 32;
            }
            ++v14;
          }

          while (v13 + 1 != v14);
          v15[v23] = 0;
        }
      }
    }

    if (v7)
    {
      size_t v16 = (void **)(v6 + 1);
      do
      {
        free(v7);
        uint64_t v17 = (char *)*v16++;
        int v7 = v17;
      }

      while (v17);
    }
  }

  else
  {
    char v15 = 0LL;
  }

  free(v6);
  return v15;
}

char **__cdecl history_tokenize(const char *a1)
{
  if (*a1)
  {
    uint64_t v2 = 0LL;
    char v3 = 0;
    BOOL v4 = 0LL;
    int v5 = 0;
    int v28 = 1;
    uint64_t v6 = MEMORY[0x1895F8770];
    while (1)
    {
      __ptr = v4;
      uint64_t v30 = v2;
      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v9 = v5;
      uint64_t v10 = ((uint64_t)v5 << 32) - 0x100000000LL;
      int v11 = &a1[v5];
      do
      {
        uint64_t v12 = v11[v7];
        if (v11[v7] < 0) {
          int v13 = __maskrune(v12, 0x4000uLL);
        }
        else {
          int v13 = *(_DWORD *)(v6 + 4 * v12 + 60) & 0x4000;
        }
        --v8;
        v10 += 0x100000000LL;
        ++v7;
      }

      while (v13);
      int v14 = v9 - 1 - v8;
      uint64_t v15 = v10 >> 32;
      size_t v16 = &a1[v10 >> 32];
      char v17 = *v16;
      if (*v16)
      {
        int v18 = v9 - 1 - v8;
        do
        {
          if (v17 == 92)
          {
            if (a1[v18 + 1]) {
              ++v18;
            }
          }

          else
          {
            int v19 = v17;
            if (v17 == v3)
            {
              char v3 = 0;
            }

            else if (!v3)
            {
              if (v17 < 0)
              {
              }

              else if ((*(_DWORD *)(v6 + 4LL * v17 + 60) & 0x4000) != 0)
              {
                goto LABEL_37;
              }

              if (memchr("()<>;&|$", v19, 9uLL))
              {
LABEL_37:
                char v3 = 0;
                int v14 = v18;
                break;
              }

              char v20 = *v16;
                char v3 = v20;
              else {
                char v3 = 0;
              }
            }
          }

          if (a1[v18]) {
            uint64_t v15 = v18 + 1LL;
          }
          else {
            uint64_t v15 = v18;
          }
          size_t v16 = &a1[v15];
          char v17 = a1[v15];
          int v18 = v15;
          int v14 = v15;
        }

        while (v17);
      }

      if ((int)v30 + 2 >= v28)
      {
        v28 *= 2;
        int v21 = __ptr;
        BOOL v22 = (char **)realloc(__ptr, 8LL * v28);
        if (!v22) {
          goto LABEL_43;
        }
        __ptr = v22;
      }

      uint64_t v23 = v15 - v9 + v8;
      size_t v24 = (char *)malloc(v23 + 2);
      if (!v24) {
        break;
      }
      uint64_t v25 = strncpy(v24, &a1[v9 + ~v8], v23 + 1);
      v25[v15 - v9 + 1 + v8] = 0;
      BOOL v4 = __ptr;
      __ptr[v30] = v25;
      uint64_t v2 = v30 + 1;
      __ptr[v30 + 1] = 0LL;
      if (*v16) {
        int v5 = v14 + 1;
      }
      else {
        int v5 = v14;
      }
      if (!a1[v5]) {
        return v4;
      }
    }

    if ((_DWORD)v30)
    {
      uint64_t v26 = 0LL;
      int v21 = __ptr;
      do
        free(__ptr[v26++]);
      while (v30 != v26);
    }

    else
    {
      int v21 = __ptr;
    }

LABEL_43:
    free(v21);
  }

  return 0LL;
}

void stifle_history(int a1)
{
  uint64_t v1 = *(void *)&a1;
  uint64_t v2 = (History *)qword_18C6E51C0;
  if (qword_18C6E51C0) {
    BOOL v3 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    rl_initialize();
    uint64_t v2 = (History *)qword_18C6E51C0;
  }

  if (!history(v2, &v4, 1, v1)) {
    max_input_history = v1;
  }
}

int unstifle_history(void)
{
  int result = max_input_history;
  max_input_history = 0x7FFFFFFF;
  return result;
}

int history_is_stifled(void)
{
  return max_input_history != 0x7FFFFFFF;
}

int history_truncate_file(const char *a1, int a2)
{
  uint64_t v2 = (char *)MEMORY[0x1895F8858](a1, *(void *)&a2);
  int v4 = v3;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (v2 || (uint64_t v2 = sub_1879BFB80()) != 0LL)
  {
    int v5 = fopen(v2, "r+");
    if (v5)
    {
      uint64_t v6 = v5;
      strcpy(v25, "/tmp/.historyXXXXXX");
      int v7 = mkstemp(v25);
      if (v7 == -1)
      {
        int v12 = *__error();
LABEL_49:
        fclose(v6);
        return v12;
      }

      int v8 = v7;
      uint64_t v9 = fdopen(v7, "r+");
      if (!v9)
      {
        close(v8);
        int v12 = *__error();
LABEL_48:
        unlink(v25);
        goto LABEL_49;
      }

      uint64_t v10 = v9;
      if (fread(v24, 0x1000uLL, 1uLL, v6) == 1)
      {
        unsigned int v11 = 0;
        while (fwrite(v24, 0x1000uLL, 1uLL, v10) == 1)
        {
          ++v11;
          if (fread(v24, 0x1000uLL, 1uLL, v6) != 1) {
            goto LABEL_15;
          }
        }

LABEL_16:
        size_t v13 = 0LL;
        goto LABEL_17;
      }

      unsigned int v11 = 0;
LABEL_15:
      size_t v13 = fread(v24, 1uLL, 0x1000uLL, v6);
      if (!ferror(v6))
      {
        if (!v13)
        {
          --v11;
          size_t v13 = 4096LL;
LABEL_59:
          fflush(v10);
          goto LABEL_18;
        }

        if (fwrite(v24, v13, 1uLL, v10) == 1) {
          goto LABEL_59;
        }
      }

LABEL_17:
      int v12 = *__error();
      if (v12)
      {
LABEL_47:
        fclose(v10);
        goto LABEL_48;
      }

  sub_1879C0FDC(v5);
  return 6LL;
}

LABEL_38:
      if (fseeko(v6, 0LL, 0) == -1
        || fseeko(v10, 0LL, 0) == -1
        || !fgets(v24, 4096, v10)
        || fputs(v24, v6) == -1
        || fseeko(v10, v16 - v24 + ((uint64_t)(int)v15 << 12), 0) == -1)
      {
LABEL_46:
        int v12 = *__error();
        goto LABEL_47;
      }

      while (1)
      {
        size_t v19 = fread(v24, 1uLL, 0x1000uLL, v10);
        if (!v19) {
          break;
        }
        if (fwrite(v24, v19, 1uLL, v6) != 1) {
          goto LABEL_61;
        }
      }

      if (ferror(v6))
      {
LABEL_61:
        int v12 = *__error();
        goto LABEL_62;
      }

      int v12 = 0;
LABEL_62:
      fflush(v6);
      off_t v21 = ftello(v6);
      if (v21 >= 1)
      {
        off_t v22 = v21;
        int v23 = fileno(v6);
        ftruncate(v23, v22);
      }

      goto LABEL_47;
    }
  }

  return *__error();
}

char *sub_1879BFB80()
{
  BOOL v0 = &byte_18C6E5B00;
  if (!byte_18C6E5B00)
  {
    uid_t v1 = getuid();
    uint64_t v2 = getpwuid(v1);
    if (v2) {
      snprintf(&byte_18C6E5B00, 0x400uLL, "%s/.history", v2->pw_dir);
    }
    else {
      return 0LL;
    }
  }

  return v0;
}

int read_history(const char *a1)
{
  if (qword_18C6E51C0) {
    BOOL v2 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    rl_initialize();
  }
  if (!a1)
  {
    a1 = sub_1879BFB80();
    if (!a1) {
      return *__error();
    }
  }

  if (history((History *)qword_18C6E51C0, &v5, 17, a1) == -1)
  {
    if (!*__error()) {
      return 22;
    }
    return *__error();
  }

  if (history((History *)qword_18C6E51C0, &v5, 2))
  {
    int num = history_length;
  }

  else
  {
    int num = v5.num;
    history_length = v5.num;
  }

  return num < 1;
}

int write_history(const char *a1)
{
  if (qword_18C6E51C0) {
    BOOL v2 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    rl_initialize();
  }
  if (!a1)
  {
    a1 = sub_1879BFB80();
    if (!a1) {
      return *__error();
    }
  }

  if (history((History *)qword_18C6E51C0, &v4, 18, a1) != -1) {
    return 0;
  }
  if (!*__error()) {
    return 22;
  }
  else {
    return *__error();
  }
}

HIST_ENTRY *__cdecl remove_history(int a1)
{
  uint64_t v1 = *(void *)&a1;
  if (qword_18C6E51C0) {
    BOOL v2 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    rl_initialize();
  }
  int v3 = (HIST_ENTRY *)malloc(0x10uLL);
  if (v3)
  {
    if (history((History *)qword_18C6E51C0, &v5, 24, v1, &v3->data))
    {
      free(v3);
      return 0LL;
    }

    else
    {
      v3->line = v5.str;
      if (!history((History *)qword_18C6E51C0, &v5, 2)) {
        history_length = v5.num;
      }
    }
  }

  return v3;
}

HIST_ENTRY *__cdecl replace_history_entry(int a1, const char *a2, histdata_t a3)
{
  uint64_t v5 = *(void *)&a1;
  uint64_t v6 = (History *)qword_18C6E51C0;
  if (qword_18C6E51C0) {
    BOOL v7 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    rl_initialize();
    uint64_t v6 = (History *)qword_18C6E51C0;
  }

  if (history(v6, &v12, 8)) {
    return 0LL;
  }
  uint64_t num = v12.num;
  if (history((History *)qword_18C6E51C0, &v12, 4)) {
    return 0LL;
  }
  uint64_t v9 = (HIST_ENTRY *)malloc(0x10uLL);
  if (v9)
  {
    if (history((History *)qword_18C6E51C0, &v12, 23, v5, &v9->data)
      || (unsigned int v11 = strdup(v12.str), (v9->line = v11) == 0LL)
      || history((History *)qword_18C6E51C0, &v12, 25, a2, a3)
      || history((History *)qword_18C6E51C0, &v12, 7, num))
    {
      free(v9);
      return 0LL;
    }
  }

  return v9;
}

void clear_history(void)
{
  history_length = 0;
}

int where_history(void)
{
  if (history((History *)qword_18C6E51C0, &v4, 8)) {
    return 0;
  }
  int num = v4.num;
  history((History *)qword_18C6E51C0, &v4, 3);
  int v3 = v4.num;
  int v0 = 1;
  while (v3 != num && !history((History *)qword_18C6E51C0, &v4, 6))
  {
    ++v0;
    int v3 = v4.num;
  }

  return v0;
}

HIST_ENTRY *current_history(void)
{
  if (history((History *)qword_18C6E51C0, &v1, 8)) {
    return 0LL;
  }
  int result = (HIST_ENTRY *)&qword_18C6E5F00;
  qword_18C6E5F00 = (uint64_t)v1.str;
  *(void *)algn_18C6E5F08 = 0LL;
  return result;
}

int history_total_bytes(void)
{
  if (history((History *)qword_18C6E51C0, &v3, 8))
  {
    LODWORD(v0) = -1;
  }

  else
  {
    uint64_t num = v3.num;
    history((History *)qword_18C6E51C0, &v3, 3);
    uint64_t v0 = 0LL;
    do
      v0 += strlen(v3.str);
    while (!history((History *)qword_18C6E51C0, &v3, 6));
    history((History *)qword_18C6E51C0, &v3, 16, num);
  }

  return v0;
}

int history_set_pos(int a1)
{
  uint64_t v1 = *(void *)&a1;
  int result = -1;
  if ((v1 & 0x80000000) == 0 && history_length > (int)v1)
  {
    history((History *)qword_18C6E51C0, &v4, 8);
    uint64_t num = v4.num;
    int result = history((History *)qword_18C6E51C0, &v4, 24, v1, -1LL);
    if (result)
    {
      history((History *)qword_18C6E51C0, &v4, 7, num);
      return -1;
    }
  }

  return result;
}

HIST_ENTRY *previous_history(void)
{
  if (history((History *)qword_18C6E51C0, &v1, 5)) {
    return 0LL;
  }
  int result = (HIST_ENTRY *)&qword_18C6E5F00;
  qword_18C6E5F00 = (uint64_t)v1.str;
  *(void *)algn_18C6E5F08 = 0LL;
  return result;
}

HIST_ENTRY *next_history(void)
{
  if (history((History *)qword_18C6E51C0, &v1, 6)) {
    return 0LL;
  }
  int result = (HIST_ENTRY *)&qword_18C6E5F00;
  qword_18C6E5F00 = (uint64_t)v1.str;
  *(void *)algn_18C6E5F08 = 0LL;
  return result;
}

int history_search_pos(const char *a1, int a2, int a3)
{
  if (a3 >= 0) {
    int v5 = a3;
  }
  else {
    int v5 = -a3;
  }
  if (history((History *)qword_18C6E51C0, &v9, 8)) {
    return -1;
  }
  uint64_t num = v9.num;
  if (history_set_pos(v5) || history((History *)qword_18C6E51C0, &v9, 8)) {
    return -1;
  }
  if (a3 < 1) {
    int v7 = 5;
  }
  else {
    int v7 = 6;
  }
  while (!strstr(v9.str, a1))
  {
    if (history((History *)qword_18C6E51C0, &v9, v7))
    {
      if (a3 < 1) {
        history((History *)qword_18C6E51C0, &v9, 15, num);
      }
      else {
        history((History *)qword_18C6E51C0, &v9, 16, num);
      }
      return -1;
    }
  }

  return v5;
}

char *__cdecl username_completion_function(const char *a1, int a2)
{
  if (*a1)
  {
    if (*a1 == 126) {
      BOOL v2 = a1 + 1;
    }
    else {
      BOOL v2 = a1;
    }
    if (!a2) {
      setpwent();
    }
    while (1)
    {
      HistEvent v3 = getpwent();
      if (!v3) {
        break;
      }
      pw_name = v3->pw_name;
    }

    endpwent();
  }

  return 0LL;
}

void rl_display_match_list(char **a1, int a2, int a3)
{
}

int rl_complete(int a1, int a2)
{
  char v2 = a2;
  if (qword_18C6E51C0) {
    BOOL v3 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    rl_initialize();
  }
  if (rl_inhibit_completion)
  {
    v12[0] = v2;
    v12[1] = 0;
    el_insertstr((EditLine *)qword_18C6E51B8, v12);
    return 4;
  }

  else
  {
    if (rl_completion_word_break_hook)
    {
      int v5 = (__int32 *)rl_completion_word_break_hook();
      uint64_t v6 = (__int32 *)rl_basic_word_break_characters;
    }

    else
    {
      uint64_t v6 = (__int32 *)rl_basic_word_break_characters;
      int v5 = (__int32 *)rl_basic_word_break_characters;
    }

    int v7 = (EditLine *)qword_18C6E51B8;
    int v8 = (char *(__cdecl *)(const char *, int))rl_completion_entry_function;
    HistEvent v9 = rl_attempted_completion_function;
    uint64_t v10 = sub_1879C7E88(v6, (uint64_t)&unk_18C6E52B0);
    unsigned int v11 = sub_1879C7E88(v5, (uint64_t)&unk_18C6E52D0);
    return sub_1879B963C( v7,  v8,  (uint64_t (*)(char *, void))v9,  v10,  v11,  (const char *(*)(char *))sub_1879C0454,  rl_completion_query_items,  &rl_completion_type,  &rl_attempted_completion_over,  &rl_point,  &rl_end,  0LL,  0LL,  0LL);
  }

char *sub_1879C0454()
{
  int result = &byte_18C6E5F10;
  byte_18C6E5F10 = rl_completion_append_character;
  byte_18C6E5F11 = 0;
  return result;
}

int rl_bind_key(int a1, rl_command_func_t *a2)
{
  if (qword_18C6E51C0) {
    BOOL v4 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    rl_initialize();
  }
  if (a2 != rl_insert) {
    return -1;
  }
  int result = 0;
  *(_BYTE *)(*(void *)(qword_18C6E51B8 + 1056) + a1) = 8;
  return result;
}

int rl_insert(int a1, int a2)
{
  char v2 = a2;
  if (qword_18C6E51C0) {
    BOOL v4 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    rl_initialize();
  }
  v7[0] = v2;
  v7[1] = 0;
  if (a1 >= 1)
  {
    unsigned int v5 = a1 + 1;
    do
    {
      el_push((EditLine *)qword_18C6E51B8, v7);
      --v5;
    }

    while (v5 > 1);
  }

  return 0;
}

int rl_read_key(void)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t v0 = (EditLine *)qword_18C6E51B8;
  if (qword_18C6E51B8) {
    BOOL v1 = qword_18C6E51C0 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    rl_initialize();
    uint64_t v0 = (EditLine *)qword_18C6E51B8;
  }

  return el_getc(v0, v3);
}

void rl_reset_terminal(const char *a1)
{
  BOOL v1 = (EditLine *)qword_18C6E51B8;
  if (qword_18C6E51C0) {
    BOOL v2 = qword_18C6E51B8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    rl_initialize();
    BOOL v1 = (EditLine *)qword_18C6E51B8;
  }

  el_reset(v1);
}

int rl_insert_text(const char *a1)
{
  if (a1)
  {
    BOOL v1 = a1;
    if (!*a1) {
      goto LABEL_11;
    }
    BOOL v2 = (EditLine *)qword_18C6E51B8;
    if (!qword_18C6E51C0 || qword_18C6E51B8 == 0)
    {
      rl_initialize();
      BOOL v2 = (EditLine *)qword_18C6E51B8;
    }

    if (el_insertstr(v2, v1) < 0) {
LABEL_11:
    }
      LODWORD(a1) = 0;
    else {
      LODWORD(a1) = strlen(v1);
    }
  }

  return (int)a1;
}

int rl_newline(int a1, int a2)
{
  return 0;
}

int rl_add_defun(const char *a1, Function *a2, int a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  qword_18C6E52F0[a3] = a2;
  el_set((EditLine *)qword_18C6E51B8, 9, a1, a1, sub_1879C0768);
  vis(v6, a3, 92, 0);
  el_set((EditLine *)qword_18C6E51B8, 4, v6, a1, 0LL);
  return 0;
}

uint64_t sub_1879C0768(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = el_line((EditLine *)qword_18C6E51B8);
  int buffer = (int)v4->buffer;
  rl_point = LODWORD(v4->cursor) - LODWORD(v4->buffer);
  rl_end = LODWORD(v4->lastchar) - buffer;
  ((void (*)(void, uint64_t))qword_18C6E52F0[v3])(0LL, a2);
  return 2 * (dword_18C6E5F88 != 0);
}

void rl_callback_read_char(void)
{
  int v9 = 0;
  uint64_t v0 = el_gets((EditLine *)qword_18C6E51B8, &v9);
  if (v0 && (v1 = v9, unsigned int v2 = v9 - 1, --v9, v1 > 0))
  {
    uint64_t v3 = v0;
    if (v2) {
      int v4 = 0;
    }
    else {
      int v4 = *v0 == *(unsigned __int8 *)(qword_18C6E51B8 + 510);
    }
    int v7 = v0[v2];
    if (v7 == 13 || v7 == 10) {
      int v4 = 2;
    }
    if (v4 && off_18C4CE738)
    {
      el_set((EditLine *)qword_18C6E51B8, 15, 0LL);
      uint64_t v6 = 0LL;
      if (v4 == 2)
      {
        uint64_t v6 = strdup(v3);
        if (v6) {
          v6[v9] = 0;
        }
      }

      unsigned int v5 = (void (*)(char *))off_18C4CE738;
      goto LABEL_21;
    }
  }

  else
  {
    unsigned int v5 = (void (*)(char *))off_18C4CE738;
    if (off_18C4CE738 && *(unsigned __int8 *)(qword_18C6E51B8 + 137) == 255)
    {
      uint64_t v6 = 0LL;
LABEL_21:
      v5(v6);
    }
  }

void rl_callback_handler_install(const char *a1, VCPFunction *a2)
{
  if (!qword_18C6E51B8) {
    rl_initialize();
  }
  rl_set_prompt(a1);
  off_18C4CE738 = a2;
  el_set((EditLine *)qword_18C6E51B8, 15, 1LL);
}

void rl_callback_handler_remove(void)
{
  off_18C4CE738 = 0LL;
}

void rl_redisplay(void)
{
  __int16 v0 = *(unsigned __int8 *)(qword_18C6E51B8 + 521);
  el_push((EditLine *)qword_18C6E51B8, (const char *)&v0);
}

int rl_get_previous_history(int a1, int a2)
{
  v4[0] = a2;
  v4[1] = 0;
  if (a1)
  {
    int v2 = a1;
    do
    {
      --v2;
      el_push((EditLine *)qword_18C6E51B8, v4);
    }

    while (v2);
  }

  return 0;
}

int rl_read_init_file(const char *a1)
{
  return el_source((EditLine *)qword_18C6E51B8, a1);
}

int rl_parse_and_bind(const char *a1)
{
  int v2 = tok_init(0LL);
  tok_str(v2, a1, &v4, (const char ***)&v5);
  int v4 = el_parse((EditLine *)qword_18C6E51B8, v4, (const char **)v5);
  tok_end(v2);
  return v4 != 0;
}

int rl_variable_bind(const char *a1, const char *a2)
{
  return el_set((EditLine *)qword_18C6E51B8, 4, &unk_1879D0D1A, a1, a2, 0LL) == -1;
}

void rl_stuff_char(int a1)
{
  v1[0] = a1;
  v1[1] = 0;
  el_insertstr((EditLine *)qword_18C6E51B8, v1);
}

void rl_get_screen_size(int *a1, int *a2)
{
  if (a1) {
    el_get((EditLine *)qword_18C6E51B8, 17, "li", a1, 0LL);
  }
  if (a2) {
    el_get((EditLine *)qword_18C6E51B8, 17, "co", a2, 0LL);
  }
}

void rl_set_screen_size(int a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x40uLL, "%d", a1);
  el_set((EditLine *)qword_18C6E51B8, 6, "li", __str, 0LL);
  snprintf(__str, 0x40uLL, "%d", a2);
  el_set((EditLine *)qword_18C6E51B8, 6, "co", __str, 0LL);
}

char **__cdecl rl_completion_matches(const char *a1, rl_compentry_func_t *a2)
{
  uint64_t v4 = (char *)malloc(0x50uLL);
  if (!v4) {
    return (char **)v4;
  }
  uint64_t v5 = ((uint64_t (*)(const char *, void))a2)(a1, 0LL);
  if (!v5) {
    goto LABEL_27;
  }
  size_t v6 = 0LL;
  uint64_t v7 = 10LL;
  do
  {
    *(void *)&v4[8 * v6 + 8] = v5;
    if (v6 + 2 == v7)
    {
      v7 += 10LL;
      int v8 = (char *)realloc(v4, 8 * v7);
      if (!v8) {
        goto LABEL_27;
      }
      uint64_t v4 = v8;
    }

    uint64_t v5 = ((uint64_t (*)(const char *, size_t))a2)(a1, ++v6);
  }

  while (v5);
  if (!v6) {
    goto LABEL_27;
  }
  *(void *)&v4[8 * v6 + 8] = 0LL;
  if (v6 == 1)
  {
    int v9 = (const char *)*((void *)v4 + 1);
    goto LABEL_11;
  }

  qsort(v4 + 8, v6, 8uLL, (int (__cdecl *)(const void *, const void *))sub_1879C0DC8);
  unsigned int v11 = (_BYTE *)*((void *)v4 + 1);
  size_t v12 = -1LL;
  uint64_t v13 = 1LL;
  uint64_t v14 = v11;
  do
  {
    uint64_t v15 = v14;
    ++v13;
    uint64_t v14 = *(_BYTE **)&v4[8 * v13];
    int v16 = *v15;
    if (*v15)
    {
      size_t v17 = 0LL;
      BOOL v18 = v15 + 1;
      while (v16 == v14[v17])
      {
        size_t v19 = v17 + 1;
        int v16 = v18[v17++];
        if (!v16) {
          goto LABEL_21;
        }
      }

      size_t v19 = v17;
    }

    else
    {
      size_t v19 = 0LL;
    }

LABEL_21:
    if (v12 >= v19) {
      size_t v12 = v19;
    }
  }

  while (v6 != v13);
  if (!v12)
  {
    if (*a1)
    {
      int v9 = a1;
LABEL_11:
      uint64_t v10 = strdup(v9);
      *(void *)uint64_t v4 = v10;
      if (!v10) {
        goto LABEL_27;
      }
      return (char **)v4;
    }

    size_t v12 = 0LL;
  }

  char v20 = malloc(v12 + 1);
  *(void *)uint64_t v4 = v20;
  if (!v20)
  {
LABEL_27:
    free(v4);
    return 0LL;
  }

  memcpy(v20, v11, v12);
  *(_BYTE *)(*(void *)v4 + v12) = 0;
  return (char **)v4;
}

      char v20 = *((_DWORD *)a1 + 16);
      *((_DWORD *)a1 + 17) &= ~2u;
      switch(v20)
      {
        case 0:
          off_t v21 = *v11;
          if (strchr(*(const char **)a1, *v11))
          {
            sub_1879CA130((uint64_t)a1);
            goto LABEL_35;
          }

          uint64_t v25 = v21;
          break;
        case 1:
        case 2:
          goto LABEL_33;
        case 3:
          goto LABEL_24;
        case 4:
          size_t v24 = (_BYTE *)*((void *)a1 + 4);
          *((void *)a1 + 4) = v24 + 1;
          *size_t v24 = 92;
          goto LABEL_32;
        default:
          return -1;
      }

uint64_t sub_1879C0DC8(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void rl_forced_update_display(void)
{
}

int _rl_abort_internal(void)
{
}

int _rl_qsort_string_compare(char **a1, char **a2)
{
  return strcoll(*a1, *a2);
}

HISTORY_STATE *history_get_history_state(void)
{
  int result = (HISTORY_STATE *)malloc(4uLL);
  if (result) {
    result->length = history_length;
  }
  return result;
}

int rl_kill_text(int a1, int a2)
{
  return 0;
}

Keymap rl_make_bare_keymap(void)
{
  return 0LL;
}

Keymap rl_get_keymap(void)
{
  return 0LL;
}

int rl_generic_bind(int a1, const char *a2, const char *a3, Keymap a4)
{
  return 0;
}

int rl_bind_key_in_map(int a1, rl_command_func_t *a2, Keymap a3)
{
  return 0;
}

int rl_on_new_line(void)
{
  return 0;
}

uint64_t sub_1879C0E7C(uint64_t a1, __int32 a2, int a3)
{
  uint64_t result = wcwidth(a2);
  else {
    uint64_t v7 = result;
  }
  if (a3)
  {
  }

  uint64_t v8 = *(void *)(a1 + 72);
  *(_DWORD *)(*(void *)(v8 + 8LL * *(int *)(a1 + 852)) + 4LL * *(int *)(a1 + 848)) = a2;
  if (v7 >= 2)
  {
    uint64_t v9 = -1LL;
    do
      *(_DWORD *)(*(void *)(v8 + 8LL * *(int *)(a1 + 852)) + 4 * (v7 + v9-- + *(int *)(a1 + 848))) = -1;
    while ((int)v7 + (int)v9 + 2 > 2);
  }

  if (a3)
  {
    int v10 = *(_DWORD *)(a1 + 848) + v7;
    *(_DWORD *)(a1 + 848) = v10;
    uint64_t v11 = *(int *)(a1 + 152);
    if (v10 >= (int)v11)
    {
      *(_DWORD *)(*(void *)(v8 + 8LL * *(int *)(a1 + 852)) + 4 * v1longjmp(dword_18C6E51CC, 1) = 0;
      return sub_1879C0F70(a1);
    }
  }

  return result;
}

uint64_t sub_1879C0F70(uint64_t result)
{
  *(_DWORD *)(result + 848) = 0;
  int v1 = *(_DWORD *)(result + 852) + 1;
  uint64_t v2 = *(unsigned int *)(result + 156);
  if (v1 >= (int)v2)
  {
    uint64_t v3 = *(_DWORD ***)(result + 72);
    uint64_t v4 = *v3;
    if ((int)v2 < 2)
    {
      uint64_t v5 = 0LL;
    }

    else
    {
      uint64_t v5 = 0LL;
      do
      {
        *(void *)(*(void *)(result + 72) + 8 * v5) = *(void *)(*(void *)(result + 72) + 8 * v5 + 8);
        ++v5;
      }

      while (v2 - 1 != v5);
      uint64_t v3 = *(_DWORD ***)(result + 72);
    }

    _DWORD *v4 = 0;
    v3[v5] = v4;
  }

  else
  {
    *(_DWORD *)(result + 852) = v1;
  }

  return result;
}

uint64_t sub_1879C0FDC(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v148 = *MEMORY[0x1895F89C0];
  *(void *)(a1 + 848) = 0LL;
  sub_1879BCE54(a1, 12);
  *(void *)(v1 + 848) = 0LL;
  unint64_t v2 = *(void *)(v1 + 104);
  if (*(void *)(v1 + 96) >= v2)
  {
    if (*(void *)(v1 + 1064) == *(void *)(v1 + 1048))
    {
      if (v2 == *(void *)(v1 + 88)) {
        uint64_t v3 = 0LL;
      }
      else {
        uint64_t v3 = -1LL;
      }
      v2 += 4 * v3;
    }

    *(void *)(v1 + 96) = v2;
  }

  sub_1879BCE54(v1, 0);
  uint64_t v4 = *(__int32 **)(v1 + 88);
  if ((unint64_t)v4 >= *(void *)(v1 + 104))
  {
    int v16 = *(_DWORD *)(v1 + 848);
  }

  else
  {
    int v5 = 0;
    int v6 = -1;
    do
    {
      if (v4 == *(__int32 **)(v1 + 96))
      {
        int v7 = wcwidth(*v4);
        unsigned int v8 = v7 <= 1 ? 1 : v7;
        int v6 = *(_DWORD *)(v1 + 848);
        int v5 = *(_DWORD *)(v1 + 852);
        if (v8 >= 2 && (signed int)(v6 + v8) > *(_DWORD *)(v1 + 152))
        {
          ++v5;
          int v6 = 0;
        }
      }

      unint64_t v9 = *v4;
      int v10 = sub_1879C8330(*v4);
      if (v10 == -3)
      {
        int v11 = *(_DWORD *)(v1 + 852);
        sub_1879C0E7C(v1, 0, 0);
        if (v11 == *(_DWORD *)(v1 + 852)) {
          sub_1879C0F70(v1);
        }
      }

      else if (v10)
      {
        if (v10 == -2)
        {
          do
            sub_1879C0E7C(v1, 32, 1);
          while ((*(_BYTE *)(v1 + 848) & 7) != 0);
        }

        else
        {
          uint64_t v12 = sub_1879C819C(v147, 8uLL, v9);
          if (v12 >= 1)
          {
            uint64_t v13 = v12;
            uint64_t v14 = v147;
            do
            {
              __int32 v15 = *v14++;
              sub_1879C0E7C(v1, v15, 1);
              --v13;
            }

            while (v13);
          }
        }
      }

      else
      {
        sub_1879C0E7C(v1, v9, 1);
      }

      ++v4;
    }

    while ((unint64_t)v4 < *(void *)(v1 + 104));
    int v16 = *(_DWORD *)(v1 + 848);
    if (v6 != -1) {
      goto LABEL_33;
    }
  }

  int v5 = *(_DWORD *)(v1 + 852);
  int v6 = v16;
LABEL_33:
  int v17 = *(_DWORD *)(v1 + 896);
  if (!v17 || *(_DWORD *)(v1 + 900) || *(_DWORD *)(v1 + 852) || (int v127 = *(_DWORD *)(v1 + 152) - (v16 + v17), v127 < 2))
  {
    *(void *)(v1 + 896) = 0LL;
  }

  else
  {
    unsigned int v128 = v127 + 1;
    do
    {
      sub_1879C0E7C(v1, 32, 1);
      --v128;
    }

    while (v128 > 2);
    sub_1879BCE54(v1, 12);
  }

  sub_1879C0E7C(v1, 0, 0);
  LODWORD(vkill(0, 18) = *(_DWORD *)(v1 + 852);
  *(_DWORD *)(v1 + 860) = v18;
  if ((v18 & 0x80000000) != 0)
  {
    LODWORD(vhistory((History *)qword_18C6E51C0, &v0, 19) = 0;
    goto LABEL_225;
  }

  int v129 = v6;
  int v130 = v5;
  uint64_t v19 = 0LL;
  uint64_t v144 = v1;
  do
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)(v1 + 72);
    off_t v22 = *(unsigned __int32 **)(*(void *)(v1 + 64) + 8 * v20);
    uint64_t v146 = v20;
    uint64_t v23 = *(void *)(v21 + 8 * v20);
    unsigned __int32 v24 = *v22;
    if (*v22)
    {
      uint64_t v25 = *(unsigned __int32 **)(*(void *)(v1 + 64) + 8 * v20);
      uint64_t v26 = *(unsigned __int32 **)(v21 + 8 * v20);
      do
      {
        if (v24 != *v26) {
          break;
        }
        unsigned __int32 v27 = v25[1];
        ++v25;
        unsigned __int32 v24 = v27;
        ++v26;
      }

      while (v27);
    }

    else
    {
      uint64_t v26 = *(unsigned __int32 **)(v21 + 8 * v20);
      uint64_t v25 = *(unsigned __int32 **)(*(void *)(v1 + 64) + 8 * v20);
    }

    int v28 = v25 - 1;
    uint64_t v29 = 4LL;
    do
    {
      uint64_t v30 = v29;
      unsigned __int32 v31 = v28[1];
      ++v28;
      v29 += 4LL;
    }

    while (v31);
    do
    {
      uint64_t v32 = v30;
      int v33 = (char *)v25 + v30;
      v30 -= 4LL;
    }

    while (*((_DWORD *)v33 - 2) == 32);
    *((_DWORD *)v33 - longjmp(dword_18C6E51CC, 1) = 0;
    BOOL v34 = v33 - 4;
    int v35 = v26 - 1;
    uint64_t v36 = 4LL;
    do
    {
      uint64_t v37 = v36;
      unsigned __int32 v38 = v35[1];
      ++v35;
      v36 += 4LL;
    }

    while (v38);
    do
    {
      uint64_t v39 = v37;
      uint64_t v40 = (char *)v26 + v37;
      v37 -= 4LL;
    }

    while (*((_DWORD *)v40 - 2) == 32);
    *((_DWORD *)v40 - longjmp(dword_18C6E51CC, 1) = 0;
    v41 = (unsigned __int32 *)(v40 - 4);
    unsigned __int32 v42 = *v25;
    if (!*v25 && !*v26) {
      goto LABEL_216;
    }
    unint64_t v43 = (unint64_t)v41;
    unint64_t v44 = (unint64_t)v34;
    do
    {
      int v46 = *(_DWORD *)(v44 - 4);
      v44 -= 4LL;
      int v45 = v46;
      int v47 = *(_DWORD *)(v43 - 4);
      v43 -= 4LL;
    }

    while (v45 == v47);
    unint64_t v48 = v44 + 4;
    unint64_t v49 = v43 + 4;
    uint64_t v143 = (uint64_t)v22;
    if (v42 && (unint64_t)v26 < v49)
    {
      int v50 = (unsigned __int32 *)(v43 + 4);
      int v51 = (unsigned __int32 *)(v43 + 4);
      unsigned __int8 v52 = (unsigned __int32 *)(v44 + 4);
      int v53 = (unsigned __int32 *)(v44 + 4);
      int v54 = v26;
      do
      {
        if (v42 == *v54)
        {
          v55 = v54;
          int v56 = v25;
          if ((unint64_t)v54 < v49)
          {
            v55 = v54;
            int v56 = v25;
            if ((unint64_t)v25 < v48)
            {
              uint64_t v57 = 0LL;
              while (1)
              {
                int v56 = &v25[v57];
                v55 = &v54[v57];
                if (v25[v57] != v54[v57]) {
                  break;
                }
                ++v57;
                if ((unint64_t)v56 >= v44 || (unint64_t)v55 >= v43)
                {
                  int v56 = &v25[v57];
                  v55 = &v54[v57];
                  break;
                }
              }
            }
          }

          int64_t v58 = (char *)v55 - (char *)v54;
          uint64_t v59 = ((char *)v55 - (char *)v54) >> 1;
          BOOL v60 = v59 <= v54 - v26;
          if (v59 > v54 - v26) {
            int v61 = v25;
          }
          else {
            int v61 = v53;
          }
          if (v60)
          {
            int v56 = v52;
            uint64_t v62 = v51;
          }

          else
          {
            uint64_t v62 = v54;
          }

          if (v60) {
            v55 = v50;
          }
          if ((char *)v50 - (char *)v51 < v58)
          {
            int v53 = v61;
            unsigned __int8 v52 = v56;
            int v51 = v62;
            int v50 = v55;
          }
        }

        BOOL v63 = (unint64_t)v54++ >= v43;
      }

      while (!v63);
    }

    else
    {
      int v53 = (unsigned __int32 *)(v44 + 4);
      unsigned __int8 v52 = (unsigned __int32 *)(v44 + 4);
      int v51 = (unsigned __int32 *)(v43 + 4);
      int v50 = (unsigned __int32 *)(v43 + 4);
    }

    if (*v26) {
      BOOL v63 = (unint64_t)v25 >= v48;
    }
    else {
      BOOL v63 = 1;
    }
    if (!v63)
    {
      v64 = v25;
      do
      {
        if (*v26 == *v64)
        {
          uint64_t v65 = (char *)v64;
          int v66 = v26;
          if ((unint64_t)v64 < v48)
          {
            uint64_t v65 = (char *)v64;
            int v66 = v26;
            if ((unint64_t)v26 < v49)
            {
              uint64_t v67 = 0LL;
              while (1)
              {
                int v66 = &v26[v67];
                uint64_t v65 = (char *)&v64[v67];
                if (v64[v67] != v26[v67]) {
                  break;
                }
                ++v67;
                if ((unint64_t)v66 >= v43 || (unint64_t)v65 >= v44)
                {
                  int v66 = &v26[v67];
                  uint64_t v65 = (char *)&v64[v67];
                  break;
                }
              }
            }
          }

          int64_t v68 = v65 - (char *)v64;
          uint64_t v69 = (v65 - (char *)v64) >> 1;
          BOOL v70 = v69 <= v64 - v25;
          if (v69 > v64 - v25) {
            int v71 = v64;
          }
          else {
            int v71 = v53;
          }
          if (v70)
          {
            uint64_t v65 = (char *)v52;
            int v72 = v51;
          }

          else
          {
            int v72 = v26;
          }

          if (v70) {
            int v66 = v50;
          }
          if ((char *)v52 - (char *)v53 < v68)
          {
            int v53 = v71;
            unsigned __int8 v52 = (unsigned __int32 *)v65;
            int v51 = v72;
            int v50 = v66;
          }
        }

        BOOL v63 = (unint64_t)v64++ >= v44;
      }

      while (!v63);
    }

    uint64_t v73 = (uint64_t)v25 + v32 - v44 - 8;
    if (v73 >= 16) {
      unint64_t v74 = v48;
    }
    else {
      unint64_t v74 = (unint64_t)v34;
    }
    if (v73 >= 16) {
      uint64_t v75 = (unsigned __int32 *)(v43 + 4);
    }
    else {
      uint64_t v75 = v41;
    }
    int v76 = ((unint64_t)((char *)v51 - (char *)v26) >> 2) - ((unint64_t)((char *)v53 - (char *)v25) >> 2);
    int v77 = ((unint64_t)((char *)v75 - (char *)v50) >> 2) - ((v74 - (unint64_t)v52) >> 2);
    int v78 = *(_DWORD *)(v1 + 160);
    if ((v78 & 1) == 0)
    {
      if (v76 >= 1)
      {
        int v53 = (unsigned __int32 *)v74;
        unsigned __int8 v52 = (unsigned __int32 *)v74;
        int v51 = v75;
        int v50 = v75;
      }

      if (v77 > 0)
      {
        unint64_t v74 = (unint64_t)v34;
        uint64_t v75 = v41;
      }

      if ((uint64_t)(v74 - (void)v25) < (char *)v75 - (char *)v26)
      {
        unint64_t v74 = (unint64_t)v34;
        uint64_t v75 = v41;
      }
    }

    uint64_t v140 = v23;
    if ((v78 & 2) == 0)
    {
      if (v76 < 0)
      {
        int v53 = (unsigned __int32 *)v74;
        unsigned __int8 v52 = (unsigned __int32 *)v74;
        int v51 = v75;
        int v50 = v75;
      }

      if (v77 >= 0) {
        unint64_t v79 = v74;
      }
      else {
        unint64_t v79 = (unint64_t)v34;
      }
      if (v77 < 0) {
        uint64_t v75 = v41;
      }
      else {
        unint64_t v74 = (unint64_t)v34;
      }
    }

    uint64_t v80 = (char *)v52 - (char *)v53;
    else {
      unint64_t v81 = v74;
    }
    else {
      unint64_t v82 = (char *)v74;
    }
    else {
      v83 = v75;
    }
    else {
      int v84 = v75;
    }
    int v131 = v82;
    unint64_t v133 = v81;
    v136 = v84;
    unint64_t v137 = v83 - v26;
    unint64_t v85 = v137 - ((v82 - (char *)v25) >> 2);
    v141 = (char *)v74;
    uint64_t v134 = v82 - (char *)v25;
    unint64_t v135 = v75 - v84;
    unint64_t v145 = v135 - ((v74 - v81) >> 2);
    sub_1879C359C(v144, v146);
    v142 = v83;
    int v139 = v85;
    if (v83 == v26 || (int)v85 < 1)
    {
      if ((v85 & 0x80000000) == 0) {
        goto LABEL_162;
      }
      unint64_t v96 = ((unint64_t)v25 - v143) >> 2;
      sub_1879C3750(v144, v96);
      int64_t v87 = v83 - v26;
      if (v34 != v131)
      {
        uint64_t v132 = -v139;
        sub_1879C3ADC((char *)v144, -v139);
        uint64_t v97 = *(int *)(v144 + 152);
        uint64_t v98 = (_DWORD *)(v143 + 4LL * (int)v96);
        if ((int)v96 - v139 >= (int)v97)
        {
          uint64_t v100 = v140;
        }

        else
        {
          unint64_t v99 = v143 + 4 * v97;
          uint64_t v100 = v140;
          if ((unint64_t)&v98[v132] < v99)
          {
            do
            {
              *uint64_t v98 = v98[v132];
              ++v98;
            }

            while ((unint64_t)&v98[v132] < v99);
          }

          uint64_t v98 = (_DWORD *)v99;
        }

        *uint64_t v98 = 0;
        sub_1879C3978(v144, v26, v137);
        int v90 = v139;
        uint64_t v89 = v100;
        if (v83 != v26)
        {
          uint64_t v119 = v83 - v26;
          size_t v120 = v26;
          v121 = v25;
          do
          {
            unsigned __int32 v122 = *v120;
            if (!*v120) {
              break;
            }
            ++v120;
            *v121++ = v122;
            --v119;
          }

          while (v119);
          int v90 = v139;
        }

        goto LABEL_163;
      }

      sub_1879C3978(v144, v26, v137);
      int v102 = (((unint64_t)v25 + v32 - v143 - 4) >> 2) - (((unint64_t)v26 + v39 - v140 - 4) >> 2);
      if ((v145 & 0x80000000) == 0LL) {
        unsigned int v103 = v145;
      }
      else {
        unsigned int v103 = -(int)v145;
      }
      if (-v139 > v102) {
        int v102 = -v139;
      }
      if (v103 <= v102) {
        int v104 = v102;
      }
      else {
        int v104 = v103;
      }
      sub_1879C3E18(v144, v104);
      uint64_t v1 = v144;
    }

    else
    {
      if (v80 >= 16) {
        int v86 = (char *)v52;
      }
      else {
        int v86 = v141;
      }
      if (v34 != v141) {
        int v86 = v34;
      }
      uint64_t v1 = v144;
      if (((uint64_t)&v86[-v143] >> 2) + v85 > *(int *)(v144 + 152))
      {
LABEL_162:
        int v90 = 0;
        uint64_t v89 = v140;
        int64_t v87 = v137;
LABEL_163:
        uint64_t v1 = v144;
        if ((v145 & 0x80000000) != 0)
        {
          uint64_t v94 = ((uint64_t)(v133 - v143) >> 2) + v90;
          if (v94 < *(int *)(v144 + 152))
          {
            uint64_t v95 = v89;
            int v138 = v90;
            sub_1879C3750(v144, v94);
            if (v34 == v141)
            {
              sub_1879C3978(v144, v136, v135);
              unsigned int v105 = (((unint64_t)v25 + v32 - v143 - 4) >> 2) - (((unint64_t)v26 + v39 - v95 - 4) >> 2);
              if (v138 >= 0) {
                int v106 = v138;
              }
              else {
                int v106 = -v138;
              }
              else {
                int v107 = v105;
              }
              sub_1879C3E18(v144, v107);
              uint64_t v89 = v95;
              int v90 = v138;
            }

            else
            {
              sub_1879C3ADC((char *)v144, -(int)v145);
              sub_1879C3978(v144, v136, v135);
              int v90 = v138;
              uint64_t v89 = v95;
            }
          }
        }

        if (v142 != v26 && v87 >= v134 >> 2 && !v90)
        {
          uint64_t v108 = v89;
          sub_1879C3750(v144, ((unint64_t)v26 - v89) >> 2);
          if (v41 == v142)
          {
            sub_1879C3978(v144, v26, v87);
            uint64_t v89 = v108;
            if (v39 != 4)
            {
              do
              {
                unsigned __int32 v115 = *v26;
                if (!*v26) {
                  break;
                }
                ++v26;
                *v25++ = v115;
                --v87;
              }

              while (v87);
            }
          }

          else
          {
            int v109 = v139;
            if (v139 >= 1)
            {
              sub_1879C3C20(v144, v26, v139);
              sub_1879C2144(v143, ((unint64_t)v25 - v143) >> 2, *(_DWORD *)(v144 + 152), (int *)v26, v139);
              int v109 = v139;
            }

            unint64_t v110 = v87 - v109;
            v111 = &v26[v109];
            sub_1879C3978(v144, v111, v110);
            uint64_t v89 = v108;
            if (v110)
            {
              v112 = &v25[v139];
              int64_t v113 = v139 - v87;
              do
              {
                unsigned __int32 v114 = *v111;
                if (!*v111) {
                  break;
                }
                ++v111;
                *v112++ = v114;
                BOOL v63 = __CFADD__(v113++, 1LL);
              }

              while (!v63);
            }
          }
        }

        if ((v145 & 0x80000000) == 0)
        {
          sub_1879C3750(v144, ((unint64_t)v136 - v89) >> 2);
          if (v34 == v141)
          {
            uint64_t v118 = v144;
            v116 = v136;
            unint64_t v117 = v135;
          }

          else
          {
            if ((_DWORD)v145) {
              sub_1879C3C20(v144, v136, v145);
            }
            v116 = &v136[v145];
            unint64_t v117 = v135 - v145;
            uint64_t v118 = v144;
          }

          sub_1879C3978(v118, v116, v117);
        }

        goto LABEL_216;
      }

      sub_1879C3750(v144, ((unint64_t)v26 - v140) >> 2);
      int64_t v87 = v137;
      if (v41 != v142)
      {
        sub_1879C3C20(v144, v26, v139);
        sub_1879C2144(v143, ((unint64_t)v25 - v143) >> 2, *(_DWORD *)(v144 + 152), (int *)v26, v139);
        v88 = &v26[v139];
        sub_1879C3978(v144, v88, v137 - v139);
        uint64_t v89 = v140;
        int v90 = v139;
        if (v137 != v139)
        {
          size_t v91 = &v25[v139];
          unint64_t v92 = v139 - v137;
          do
          {
            unsigned __int32 v93 = *v88;
            if (!*v88) {
              break;
            }
            ++v88;
            *v91++ = v93;
            BOOL v63 = __CFADD__(v92++, 1LL);
          }

          while (!v63);
          int v90 = v139;
        }

        goto LABEL_163;
      }

      sub_1879C3978(v144, v26, v137);
      if (v39 != 4)
      {
        do
        {
          unsigned __int32 v101 = *v26;
          if (!*v26) {
            break;
          }
          ++v26;
          *v25++ = v101;
          --v87;
        }

        while (v87);
      }
    }

LABEL_216:
    sub_1879C1BA8( *(char **)(*(void *)(v1 + 64) + 8 * v146),  *(void *)(*(void *)(v1 + 72) + 8 * v146),  *(int *)(v1 + 152));
    uint64_t v19 = v146 + 1;
    uint64_t v18 = *(int *)(v1 + 860);
  }

  while (v146 < v18);
  int v6 = v129;
  int v5 = v130;
LABEL_225:
  int v123 = *(_DWORD *)(v1 + 856);
  if (v123 > (int)v18 && (int)v19 <= v123)
  {
    uint64_t v124 = v19;
    do
    {
      sub_1879C359C(v1, v124);
      sub_1879C3750(v1, 0);
      int v125 = wcslen(*(const __int32 **)(*(void *)(v1 + 64) + 8 * v124));
      sub_1879C3E18(v1, v125);
      **(_DWORD **)(*(void *)(v1 + 64) + 8 * v124++) = 0;
    }

    while (*(_DWORD *)(v1 + 856) > (int)v124 - 1);
    LODWORD(vkill(0, 18) = *(_DWORD *)(v1 + 860);
  }

  *(_DWORD *)(v1 + 856) = v18;
  sub_1879C359C(v1, v5);
  return sub_1879C3750(v1, v6);
}

void sub_1879C1BA8(char *__b, uint64_t a2, unint64_t a3)
{
  unint64_t v4 = 0LL;
  if (a3)
  {
    while (1)
    {
      int v5 = *(_DWORD *)(a2 + 4 * v4);
      if (!v5) {
        break;
      }
      *(_DWORD *)__b = v5;
      __b += 4;
      if (a3 == ++v4) {
        goto LABEL_7;
      }
    }
  }

  unint64_t v6 = a3 - v4;
  if (a3 > v4)
  {
    memset_pattern16(__b, &unk_1879CB3D0, 4 * v6);
    __b += 4 * v6;
  }

LABEL_7:
  *(_DWORD *)__b = 0;
}

uint64_t sub_1879C1C0C(uint64_t a1)
{
  *(_DWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  if (*(int *)(a1 + 156) >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = *(void *)(a1 + 64);
    do
      **(_DWORD **)(v3 + 8 * v2++) = 0;
    while (v2 < *(int *)(a1 + 156));
  }

  *(_DWORD *)(a1 + 856) = 0;
  return sub_1879C4B70(a1);
}

uint64_t sub_1879C1C74(uint64_t result)
{
  *(_DWORD *)(result + 52) = 0;
  *(_DWORD *)(result + 56) = 0;
  if (*(int *)(result + 156) >= 1)
  {
    uint64_t v1 = 0LL;
    uint64_t v2 = *(void *)(result + 64);
    do
      **(_DWORD **)(v2 + 8 * v1++) = 0;
    while (v1 < *(int *)(result + 156));
  }

  *(_DWORD *)(result + 856) = 0;
  return result;
}

uint64_t sub_1879C1CAC(uint64_t a1)
{
  unint64_t v3 = *(void *)(a1 + 96);
  unint64_t v2 = *(void *)(a1 + 104);
  if (v3 >= v2)
  {
    unint64_t v3 = *(void *)(a1 + 104);
    if (*(void *)(a1 + 1064) == *(void *)(a1 + 1048))
    {
      if (v2 == *(void *)(a1 + 88)) {
        uint64_t v4 = 0LL;
      }
      else {
        uint64_t v4 = -1LL;
      }
      unint64_t v3 = v2 + 4 * v4;
    }

    *(void *)(a1 + 96) = v3;
  }

  int v5 = *(_DWORD *)(a1 + 872);
  int v6 = *(_DWORD *)(a1 + 876);
  int v7 = *(_DWORD *)(a1 + 152);
  unsigned int v8 = *(__darwin_ct_rune_t **)(a1 + 88);
  if ((unint64_t)v8 < v3)
  {
    do
    {
      int v9 = sub_1879C8330(*v8);
      if (v9 == -3)
      {
        signed int v10 = 0;
        ++v6;
      }

      else if (v9 == -2)
      {
        signed int v10 = v5 - (v5 | 0xFFFFFFF8);
      }

      else
      {
        int v11 = wcwidth(*v8);
        if (v11 <= 1) {
          unsigned int v12 = 1;
        }
        else {
          unsigned int v12 = v11;
        }
        int v13 = v12 > 1 && (int)(v12 + v5) > v7;
        if (v13) {
          int v5 = 0;
        }
        v6 += v13;
        signed int v10 = v5 + sub_1879C82BC(*v8);
      }

      if (v10 < v7) {
        int v14 = 0;
      }
      else {
        int v14 = v7;
      }
      if (v10 >= v7) {
        ++v6;
      }
      int v5 = v10 - v14;
      ++v8;
    }

    while ((unint64_t)v8 < *(void *)(a1 + 96));
    unint64_t v2 = *(void *)(a1 + 104);
  }

  if ((unint64_t)v8 < v2)
  {
    int v15 = wcwidth(*v8);
    if (v15 <= 1) {
      unsigned int v16 = 1;
    }
    else {
      unsigned int v16 = v15;
    }
    int v17 = v16 > 1 && (int)(v16 + v5) > v7;
    if (v17) {
      int v5 = 0;
    }
    v6 += v17;
  }

  sub_1879C359C(a1, v6);
  sub_1879C3750(a1, v5);
  return sub_1879C4B70(a1);
}

uint64_t sub_1879C1E08(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(unsigned int *)(v2 - 4);
  if ((_DWORD)v3 == 9 || v2 != *(void *)(a1 + 104)) {
    return sub_1879C0FDC(a1);
  }
  int v4 = *(_DWORD *)(a1 + 896);
  if (v4 && *(_DWORD *)(a1 + 152) - (*(_DWORD *)(a1 + 52) + v4) <= 2) {
    return sub_1879C0FDC(a1);
  }
  switch(sub_1879C8330(v3))
  {
    case 0xFFFFFFFC:
    case 0xFFFFFFFF:
      uint64_t v6 = sub_1879C819C(v11, 8uLL, v3);
      if (v6 >= 1)
      {
        uint64_t v7 = v6;
        unsigned int v8 = v11;
        do
        {
          unsigned __int32 v9 = *v8++;
          sub_1879C1F44(a1, v9);
          --v7;
        }

        while (v7);
      }

      break;
    case 0xFFFFFFFD:
    case 0u:
      sub_1879C1F44(a1, v3);
      break;
    default:
      return sub_1879C4B70(a1);
  }

  return sub_1879C4B70(a1);
}

uint64_t sub_1879C1F44(uint64_t a1, unsigned __int32 a2)
{
  int v4 = wcwidth(a2);
  if (v4 <= 1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = v4;
  }
  if (v5 >= 2)
  {
  }

  uint64_t result = sub_1879C3A7C(a1, a2);
  uint64_t v7 = *(_DWORD ***)(a1 + 64);
  uint64_t v8 = *(int *)(a1 + 52);
  unsigned __int32 v9 = v7[*(int *)(a1 + 56)];
  *(_DWORD *)(a1 + 52) = v8 + 1;
  v9[v8] = a2;
  if (v5 >= 2)
  {
    int v10 = v5 + 1;
    do
    {
      uint64_t v11 = *(int *)(a1 + 52);
      uint64_t v12 = v7[*(int *)(a1 + 56)];
      *(_DWORD *)(a1 + 52) = v11 + 1;
      v12[v11] = -1;
      --v10;
    }

    while (v10 > 2);
  }

  if (*(_DWORD *)(a1 + 52) >= *(_DWORD *)(a1 + 152))
  {
    *(_DWORD *)(a1 + 52) = 0;
    int v13 = *(_DWORD *)(a1 + 56) + 1;
    uint64_t v14 = *(unsigned int *)(a1 + 156);
    if (v13 >= (int)v14)
    {
      int v15 = *v7;
      if ((int)v14 < 2)
      {
        uint64_t v16 = 0LL;
      }

      else
      {
        uint64_t v16 = 0LL;
        do
        {
          *(void *)(*(void *)(a1 + 64) + 8 * v16) = *(void *)(*(void *)(a1 + 64) + 8 * v16 + 8);
          ++v16;
        }

        while (v14 - 1 != v16);
        uint64_t v7 = *(_DWORD ***)(a1 + 64);
      }

      *int v15 = 0;
      v7[v16] = v15;
    }

    else
    {
      *(_DWORD *)(a1 + 56) = v13;
      ++*(_DWORD *)(a1 + 856);
    }

    int v17 = *(_DWORD *)(a1 + 160);
    if ((v17 & 0x80) == 0)
    {
      unsigned __int32 v18 = 10;
      unsigned __int32 v19 = 13;
LABEL_24:
      sub_1879C3A7C(a1, v19);
      return sub_1879C3A7C(a1, v18);
    }

    if ((v17 & 0x100) != 0)
    {
      unsigned __int32 v18 = 8;
      unsigned __int32 v19 = 32;
      goto LABEL_24;
    }
  }

  return result;
}

uint64_t sub_1879C20BC(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 856);
  if ((*(_BYTE *)(result + 160) & 4) != 0)
  {
    if ((v2 & 0x80000000) == 0)
    {
      do
      {
        sub_1879C359C(v1, v2);
        sub_1879C3750(v1, 0);
        uint64_t result = sub_1879C3E18(v1, *(_DWORD *)(v1 + 152));
        --v2;
      }

      while (v2 != -1);
    }
  }

  else
  {
    sub_1879C359C(result, *(_DWORD *)(result + 856));
    sub_1879C3A7C(v1, 0xDu);
    return sub_1879C3A7C(v1, 0xAu);
  }

  return result;
}

uint64_t sub_1879C2144(uint64_t result, int a2, int a3, int *a4, unsigned int a5)
{
  LODWORD(v5) = a3 - a2;
  else {
    uint64_t v5 = v5;
  }
  if ((int)v5 >= 1)
  {
    uint64_t v6 = (_DWORD *)(result + 4LL * a3);
    uint64_t v7 = v6 - 1;
    unint64_t v8 = result + 4LL * a2;
    if ((unint64_t)&v6[-v5 - 1] >= v8)
    {
      do
      {
        *uint64_t v7 = v7[-v5];
        --v7;
      }

      while ((unint64_t)&v7[-v5] >= v8);
    }

    _DWORD *v6 = 0;
    if (a3 > a2)
    {
      unint64_t v9 = result + 4LL * a2 + 4;
      do
      {
        int v10 = *a4++;
        *(_DWORD *)(v9 - 4) = v10;
        v9 += 4LL;
        BOOL v11 = v5 > 1;
        LODWORD(v5) = v5 - 1;
      }

      while (v11);
    }
  }

  return result;
}

uint64_t sub_1879C21C8(uint64_t a1)
{
  int v2 = malloc(0x1000uLL);
  *(void *)(a1 + 1216) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 1224) = 0LL;
  *(_DWORD *)(a1 + 1240) = 0;
  *(void *)(a1 + 1232) = 0x1FFFFFFFFLL;
  *(_BYTE *)(a1 + 1244) = 0;
  return result;
}

void sub_1879C2218(uint64_t a1)
{
  *(void *)(a1 + 1216) = 0LL;
}

uint64_t sub_1879C2240(__int32 *a1, __int32 *a2)
{
  if (wcsstr(a1, a2)) {
    return 1LL;
  }
  uint64_t v5 = sub_1879C7D54((unsigned __int32 *)a2, (uint64_t)&unk_18C6E5F18);
  BOOL v4 = 0LL;
  if (!regcomp(&v8, (const char *)v5, 0))
  {
    uint64_t v6 = sub_1879C7D54((unsigned __int32 *)a1, (uint64_t)&unk_18C6E5F18);
    BOOL v4 = regexec(&v8, (const char *)v6, 0LL, 0LL, 0) == 0;
    MEMORY[0x1895B01F8](&v8);
  }

  return v4;
}

uint64_t sub_1879C22DC(uint64_t a1, __int32 *a2)
{
  return sub_1879C2240(a2, *(__int32 **)(a1 + 1216));
}

size_t sub_1879C22EC(size_t result)
{
  if ((*(_BYTE *)(result + 136) & 0xFE) != 0x16)
  {
    size_t v1 = result;
    BOOL v2 = *(_DWORD *)(result + 1096) == 1 && *(void *)(result + 1064) == *(void *)(result + 1048);
    unint64_t v3 = *(const __int32 **)(result + 88);
    uint64_t v4 = *(void *)(result + 96) + 4 * v2 - (void)v3;
    else {
      size_t v5 = 1023LL;
    }
    *(void *)(result + 1224) = v5;
    uint64_t v6 = *(__int32 **)(result + 1216);
    if (v5)
    {
      uint64_t result = (size_t)wcsncpy(v6, v3, v5);
      *(_DWORD *)(*(void *)(v1 + 1216) + 4LL * *(void *)(v1 + 1224)) = 0;
    }

    else
    {
      uint64_t result = wcslen(v6);
      *(void *)(v1 + 1224) = result;
    }
  }

  return result;
}

uint64_t sub_1879C2384(size_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 1224);
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v5 = -1LL;
  if ((_DWORD)a2 != 23) {
    uint64_t v5 = 1LL;
  }
  uint64_t v65 = v5;
  char v6 = byte_18C6E5F38;
  int v7 = *(_DWORD *)(a1 + 1176);
  if ((_DWORD)a2 == 23) {
    int v8 = 0;
  }
  else {
    int v8 = 0x7FFFFFFF;
  }
  int v64 = v8;
  uint64_t v9 = 88LL;
  if ((_DWORD)a2 == 23) {
    uint64_t v9 = 104LL;
  }
  uint64_t v63 = v9;
  int v66 = a2;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t v11 = *(void *)(a1 + 1224);
    if (!v11)
    {
      byte_18C6E5F38 = 0;
      uint64_t v12 = *(void **)(a1 + 1216);
      *(void *)(a1 + 1224) = 2LL;
      *uint64_t v12 = 0x2A0000002ELL;
      uint64_t v11 = 2LL;
    }

    int v13 = *(_DWORD **)(a1 + 104);
    *int v13 = 10;
    uint64_t v14 = v13 + 1;
    int v15 = (int *)&unk_1879CB400;
    if ((_DWORD)v10 != 23) {
      int v15 = (int *)&unk_1879CB3F0;
    }
    int v16 = *v15;
    if (*v15)
    {
      int v17 = v15 + 1;
      do
      {
        *v14++ = v16;
        int v18 = *v17++;
        int v16 = v18;
      }

      while (v18);
    }

    if (byte_18C6E5F38) {
      int v19 = 63;
    }
    else {
      int v19 = 58;
    }
    *uint64_t v14 = v19;
    uint64_t v20 = v14 + 1;
    *(void *)(a1 + 104) = v20;
    if (v11 >= 3)
    {
      uint64_t v21 = *(void *)(a1 + 1216);
      unint64_t v22 = v21 + 4 * v11;
      uint64_t v23 = (int *)(v21 + 8);
      do
      {
        int v24 = *v23++;
        *v20++ = v24;
      }

      while ((unint64_t)v23 < v22);
      *(void *)(a1 + 104) = v20;
    }

    _DWORD *v20 = 0;
    sub_1879C0FDC(a1);
    if (el_wgetc((EditLine *)a1, &v67) != 1) {
      return sub_1879B6E24(a1);
    }
    __int32 v25 = v67;
    unsigned int v26 = *(unsigned __int8 *)(*(void *)(a1 + 1064) + v67);
    if (v26 > 0x27)
    {
      if (v26 != 40)
      {
        if (v26 == 43)
        {
          uint64_t v31 = 0LL;
          int v32 = 0;
          char v33 = 1;
          uint64_t v10 = 22LL;
        }

        else
        {
          if (v26 != 44) {
            goto LABEL_42;
          }
          uint64_t v31 = 0LL;
          int v32 = 0;
          char v33 = 1;
          uint64_t v10 = 23LL;
        }

        goto LABEL_56;
      }
    }

    else if (v26 != 4)
    {
      if (v26 == 6 || v26 == 8)
      {
        unint64_t v28 = *(void *)(a1 + 1224);
        if (v28 >= 0x3FE)
        {
LABEL_54:
          el_beep_0((EditLine *)a1);
          goto LABEL_55;
        }

        uint64_t v29 = *(void *)(a1 + 1216);
        *(void *)(a1 + 1224) = v28 + 1;
        *(_DWORD *)(v29 + 4 * v28) = v25;
        uint64_t v30 = *(void **)(a1 + 104);
        *uint64_t v30 = v67;
        *(void *)(a1 + 104) = (char *)v30 + 4;
      }

      else
      {
LABEL_42:
        if (v67 == 7)
        {
          char v33 = 0;
          int v32 = 1;
          uint64_t v31 = 6LL;
          goto LABEL_56;
        }

        if (v67 == 27) {
          goto LABEL_107;
        }
        if (v67 != 23)
        {
          dword_18C6E5F3C[0] = v67;
          el_wpush((EditLine *)a1, dword_18C6E5F3C);
LABEL_107:
          char v33 = 0;
          int v32 = 1;
          uint64_t v31 = 4LL;
          goto LABEL_56;
        }

        uint64_t v34 = *(void *)(a1 + 1224);
        if (v34 >= 3)
        {
          uint64_t v35 = *(void *)(a1 + 1216);
          unint64_t v36 = v35 + 4 * v34;
          uint64_t v37 = (int *)(v35 + 8);
          while (!memchr("*[]?", *v37, 5uLL))
          {
          }

          goto LABEL_54;
        }

LABEL_49:
        unint64_t v38 = *(void *)(a1 + 104);
        uint64_t v39 = (unsigned int *)(*(void *)(a1 + 96) + 4 * v34 - 12);
        *(void *)(a1 + 96) = v39;
        uint64_t v40 = sub_1879B65EC(v39, v38, 1, (unsigned int (*)(void))sub_1879B643C);
        v41 = *(unsigned int **)(a1 + 96);
        while (v41 < v40)
        {
          unsigned int v42 = *v41;
          if (*v41 == 10) {
            break;
          }
          unint64_t v43 = *(void *)(a1 + 1224);
          if (v43 >= 0x3FE)
          {
            el_beep_0((EditLine *)a1);
            break;
          }

          uint64_t v44 = *(void *)(a1 + 1216);
          *(void *)(a1 + 1224) = v43 + 1;
          *(_DWORD *)(v44 + 4 * v43) = v42;
          int v45 = *v41++;
          int v46 = *(_DWORD **)(a1 + 104);
          *int v46 = v45;
          *(void *)(a1 + 96) = v41;
          *(void *)(a1 + 104) = v46 + 1;
        }

        *(void *)(a1 + 96) = v4;
        **(_DWORD **)(a1 + 104) = 0;
      }

      sub_1879C0FDC(a1);
LABEL_55:
      uint64_t v31 = 0LL;
      int v32 = 0;
      char v33 = 0;
      goto LABEL_56;
    }

    if (*(void *)(a1 + 1224) <= 2uLL) {
      goto LABEL_54;
    }
    uint64_t v31 = 0LL;
    char v33 = 0;
    int v32 = 1;
LABEL_56:
    unint64_t v47 = *(void *)(a1 + 88);
    _DWORD *i = 0;
    if ((v32 & 1) != 0) {
      goto LABEL_94;
    }
    uint64_t v49 = *(void *)(a1 + 1216);
    unint64_t v50 = *(void *)(a1 + 1224);
    __int32 v67 = 93;
    uint64_t v51 = v50 - 1;
    while (v51 >= 2)
    {
      __int32 v52 = *(_DWORD *)(v49 + 4 * v51);
      if (v52 != 93)
      {
        --v51;
        if (v52 != 91) {
          continue;
        }
      }

      __int32 v67 = v52;
      goto LABEL_67;
    }

    __int32 v52 = 93;
LABEL_67:
    if (v50 >= 3 && v52 != 91)
    {
      if ((_DWORD)v10 != v66) {
        char v33 = 0;
      }
      if ((v33 & 1) != 0)
      {
        if (byte_18C6E5F38 == 1)
        {
          *(_DWORD *)(a1 + 1176) = v64;
          unint64_t v53 = *(void *)(a1 + v63);
          *(void *)(a1 + 96) = v53;
          uint64_t v49 = *(void *)(a1 + 1216);
          unint64_t v50 = *(void *)(a1 + 1224);
          unint64_t v47 = *(void *)(a1 + 88);
        }

        else
        {
          unint64_t v53 = *(void *)(a1 + 96) + 4 * v65;
          *(void *)(a1 + 96) = v53;
        }
      }

      else
      {
        unint64_t v53 = *(void *)(a1 + 96);
      }

      uint64_t v54 = 4 * v50;
      unint64_t v55 = v50 + 2;
      *(void *)(a1 + 1224) = v55;
      *(void *)(v49 + v54) = 0x2A0000002ELL;
      *(_DWORD *)(v49 + 4 * v55) = 0;
      if (v53 < v47 || v53 > *(void *)(a1 + 104) || sub_1879C2960((void *)a1, v10) == 6)
      {
        *(_BYTE *)(a1 + 136) = v10;
        if ((_DWORD)v10 == 23) {
          int v56 = sub_1879B76A0(a1);
        }
        else {
          int v56 = sub_1879B78A4(a1);
        }
        if (v56 == 6)
        {
          uint64_t v57 = *(void *)(a1 + 1224) - 2LL;
          *(void *)(a1 + 1224) = v57;
          *(_DWORD *)(*(void *)(a1 + 1216) + 4 * v57) = 0;
          el_beep_0((EditLine *)a1);
          if (*(_DWORD *)(a1 + 1176) != v7)
          {
            *(_DWORD *)(a1 + 1176) = v7;
          }

          *(void *)(a1 + 96) = v4;
          char v58 = 1;
          goto LABEL_92;
        }

        uint64_t v59 = 88LL;
        if ((_DWORD)v10 == 23) {
          uint64_t v59 = 104LL;
        }
        *(void *)(a1 + 96) = *(void *)(a1 + v59);
        sub_1879C2960((void *)a1, v10);
      }

      char v58 = 0;
      uint64_t v60 = *(void *)(a1 + 1224) - 2LL;
      *(void *)(a1 + 1224) = v60;
      *(_DWORD *)(*(void *)(a1 + 1216) + 4 * v60) = 0;
LABEL_92:
      byte_18C6E5F38 = v58;
    }

    uint64_t v31 = sub_1879C2384(a1, v10);
    if (!(((_DWORD)v31 != 6 || (byte_18C6E5F38 & 1) == 0) | v6 & 1))
    {
      int v61 = 0;
      uint64_t v31 = 0LL;
      goto LABEL_100;
    }

    uint64_t result = sub_1879C5EC0(a1, 1, (termios *)(a1 + 680));
    if ((_DWORD)result != -1)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 840) = 1;
    }
  }

  return result;
}

LABEL_94:
    if ((_DWORD)v31)
    {
      if (v2 || (_DWORD)v31 != 6) {
        return v31;
      }
      int v61 = 1;
    }

    else
    {
      int v61 = 0;
    }

LABEL_100:
    byte_18C6E5F38 = v6;
    *(void *)(a1 + 1224) = v2;
    if (*(_DWORD *)(a1 + 1176) != v7)
    {
      *(_DWORD *)(a1 + 1176) = v7;
    }

    *(void *)(a1 + 96) = v4;
    if (v61) {
      break;
    }
    if (v32) {
      return v31;
    }
  }

  sub_1879C0FDC(a1);
  return 6LL;
}

uint64_t sub_1879C2960(void *a1, int a2)
{
  unint64_t v3 = (__int32 *)a1[12];
  uint64_t v4 = a1[152];
  __int32 v7 = *(_DWORD *)(v4 + 4);
  uint64_t v5 = (__int32 *)(v4 + 4);
  __int32 v6 = v7;
  *uint64_t v5 = 94;
  if (a2 == 23)
  {
    while ((unint64_t)v3 >= a1[11])
    {
      --v3;
    }
  }

  else if (*v3)
  {
    while ((unint64_t)v3 < a1[14])
    {
      if (sub_1879C2240(v3, v5))
      {
LABEL_10:
        uint64_t result = 0LL;
        *uint64_t v5 = v6;
        a1[12] = v3;
        return result;
      }

      __int32 v8 = v3[1];
      ++v3;
      if (!v8) {
        break;
      }
    }
  }

  *uint64_t v5 = v6;
  return 6LL;
}

uint64_t sub_1879C2A08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1895F8858](a1, a2);
  int v4 = v3;
  size_t v5 = v2;
  v22[511] = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v21 = 0x2A0000002ELL;
  *(_DWORD *)(v2 + 1232) = v3;
  if (v3 == 23) {
    __int32 v6 = (__int32 *)&unk_1879CB410;
  }
  else {
    __int32 v6 = (__int32 *)&unk_1879CB41C;
  }
  int v7 = sub_1879B6C64(v2, (uint64_t)v22, v6);
  if (v7 == -1) {
    return 4LL;
  }
  __int32 v8 = &v21[v7];
  __int32 v11 = v8[2];
  uint64_t v9 = v8 + 2;
  __int32 v10 = v11;
  *uint64_t v9 = 0;
  if (v7)
  {
    uint64_t v12 = v7 + 4LL;
    *(void *)uint64_t v9 = 0x2A0000002ELL;
    v21[v12] = 0;
    wcsncpy(*(__int32 **)(v5 + 1216), v21, 0x3FFuLL);
    *(void *)(v5 + 1224) = v12;
  }

  else
  {
    if (!*(void *)(v5 + 1224)) {
      goto LABEL_17;
    }
    int v16 = *(const __int32 **)(v5 + 1216);
    if ((*v16 | 4) != 0x2E)
    {
      wcsncpy(v21, v16, 0x3FFuLL);
      uint64_t v17 = *(void *)(v5 + 1216);
      *(void *)uint64_t v17 = 0x2A0000002ELL;
      wcsncpy((__int32 *)(v17 + 8), v21, 0x3FDuLL);
      uint64_t v18 = *(void *)(v5 + 1224);
      uint64_t v19 = *(void *)(v5 + 1216);
      uint64_t v20 = v19 + 4 * v18;
      v18 += 3LL;
      *(void *)(v5 + 1224) = v18;
      *(void *)(v20 + 4) = 0x2A0000002ELL;
      *(_DWORD *)(v19 + 4 * vkill(0, 18) = 0;
    }
  }

  *(_BYTE *)(v5 + 136) = v4;
  uint64_t v13 = *(void *)(v5 + 88);
  *(void *)(v5 + 96) = v13;
  *(void *)(v5 + 104) = v13;
  if (v4 == 23) {
    int v14 = sub_1879B76A0(v5);
  }
  else {
    int v14 = sub_1879B78A4(v5);
  }
  if (v14 != 6)
  {
    if (v10 == 27)
    {
      sub_1879C0FDC(v5);
      return sub_1879B74C4(v5);
    }

    return 4LL;
  }

uint64_t sub_1879C2BC4(size_t a1, int a2)
{
  *(_BYTE *)(a1 + 136) = a2;
  *(void *)(a1 + 104) = *(void *)(a1 + 88);
  if (a2 == 23) {
    return sub_1879B76A0(a1);
  }
  if (a2 == 22) {
    return sub_1879B78A4(a1);
  }
  return 6LL;
}

uint64_t sub_1879C2BF8(EditLine *a1, int a2, __int32 a3, int a4, int a5)
{
  if (!a3) {
    return 6LL;
  }
  if (a3 == -1)
  {
    if (el_wgetc(a1, &v16) != 1) {
      return sub_1879B6E24((uint64_t)a1);
    }
    a3 = v16;
  }

  *((_DWORD *)a1 + 3rl_insert(1, 10) = a3;
  *((_DWORD *)a1 + 309) = a2;
  *((_BYTE *)a1 + 1244) = a5;
  uint64_t v9 = (__int32 *)*((void *)a1 + 12);
  if (a4)
  {
    unint64_t v10 = *((void *)a1 + 13);
    __int32 v11 = *v9;
LABEL_7:
    if (v11 == a3) {
      uint64_t v12 = a2;
    }
    else {
      uint64_t v12 = 0LL;
    }
    v9 += v12;
    if ((unint64_t)v9 < v10)
    {
      --a4;
      while ((unint64_t)v9 >= *((void *)a1 + 11))
      {
        if (*v9 == a3)
        {
          __int32 v11 = a3;
          if (a4) {
            goto LABEL_7;
          }
          goto LABEL_17;
        }

        v9 += a2;
      }
    }

    return 6LL;
  }

  else
  {
LABEL_17:
    if (a5) {
      uint64_t v13 = -(uint64_t)a2;
    }
    else {
      uint64_t v13 = 0LL;
    }
    int v14 = &v9[v13];
    *((void *)a1 + 12) = v14;
    if (*((_DWORD *)a1 + 250))
    {
      if (a2 >= 1) {
        *((void *)a1 + 12) = v14 + 1;
      }
      sub_1879B6804((uint64_t)a1);
      return 4LL;
    }

    else
    {
      return 5LL;
    }
  }

uint64_t sub_1879C2D1C(uint64_t a1)
{
  uint64_t v2 = malloc(0x78uLL);
  *(void *)(a1 + 1248) = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  *((_DWORD *)v2 + 28) = 134627335;
  sigprocmask(1, (const sigset_t *)v2 + 28, &v6);
  uint64_t v3 = 0LL;
  uint64_t v4 = *(void *)(a1 + 1248);
  do
  {
    *(void *)(v4 + v3) = -1LL;
    uint64_t v4 = *(void *)(a1 + 1248);
    *(void *)(v4 + v3 + 8) = 0LL;
    v3 += 16LL;
  }

  while (v3 != 112);
  sigprocmask(3, &v6, 0LL);
  return 0LL;
}

void sub_1879C2DB0(uint64_t a1)
{
  *(void *)(a1 + 1248) = 0LL;
}

uint64_t sub_1879C2DD8(uint64_t a1)
{
  v7.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_1879C2E80;
  *(void *)&v7.sa_mask = 0LL;
  sigprocmask(1, (const sigset_t *)(*(void *)(a1 + 1248) + 112LL), &v9);
  uint64_t v2 = 0LL;
  qword_18C6E5F48 = a1;
  uint64_t v3 = dword_1879CB428;
  do
  {
    int v4 = *v3++;
    v2 += 16LL;
  }

  while (v2 != 112);
  return sigprocmask(3, &v9, 0LL);
}

uint64_t sub_1879C2E80(int a1)
{
  sigset_t v2 = 1 << (a1 - 1);
  if (a1 > 32) {
    sigset_t v2 = 0;
  }
  sigset_t v8 = v2;
  sigprocmask(1, &v8, &v7);
  uint64_t v3 = (EditLine *)qword_18C6E5F48;
  *(_DWORD *)(*(void *)(qword_18C6E5F48 + 1248) + 116LL) = a1;
  if (a1 == 28)
  {
    el_resize(v3);
  }

  else if (a1 == 19)
  {
    sub_1879C6088((uint64_t)v3);
    sub_1879C4B70(qword_18C6E5F48);
  }

  else
  {
    sub_1879C6578((uint64_t)v3);
  }

  for (uint64_t i = 0LL; i != 7; ++i)
  {
    if (dword_1879CB428[i] == a1) {
      break;
    }
  }

  sigaction(a1, (const sigaction *)(*(void *)(qword_18C6E5F48 + 1248) + 16 * i), 0LL);
  uint64_t v5 = qword_18C6E5F48;
  *(void *)(*(void *)(qword_18C6E5F48 + 1248) + 16 * i) = -1LL;
  *(void *)(*(void *)(v5 + 1248) + 16 * i + 8) = 0LL;
  sigprocmask(3, &v7, 0LL);
  return kill(0, a1);
}

uint64_t sub_1879C2FA4(uint64_t a1)
{
  uint64_t v2 = 0LL;
  int v3 = 2;
  int v4 = &dword_1879CB42C;
  do
  {
    uint64_t v5 = (const sigaction *)(*(void *)(a1 + 1248) + v2);
    int v6 = *v4++;
    int v3 = v6;
    v2 += 16LL;
  }

  while (v2 != 112);
  return sigprocmask(3, &v8, 0LL);
}

uint64_t sub_1879C3030(void *a1)
{
  uint64_t v2 = malloc(0x800uLL);
  a1[21] = v2;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = malloc(0x800uLL);
  a1[25] = v3;
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  int v4 = malloc(0xE0uLL);
  a1[26] = v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  a1[22] = 0LL;
  uint64_t v5 = malloc(0x138uLL);
  a1[23] = v5;
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  v5[38] = 0LL;
  *((_OWORD *)v5 + 17) = 0u;
  *((_OWORD *)v5 + kill(0, 18) = 0u;
  *((_OWORD *)v5 + 15) = 0u;
  *((_OWORD *)v5 + 16) = 0u;
  *((_OWORD *)v5 + 13) = 0u;
  *((_OWORD *)v5 + 14) = 0u;
  *((_OWORD *)v5 + 1longjmp(dword_18C6E51CC, 1) = 0u;
  *((_OWORD *)v5 + 12) = 0u;
  *((_OWORD *)v5 + 9) = 0u;
  *((_OWORD *)v5 + rl_insert(1, 10) = 0u;
  *((_OWORD *)v5 + 7) = 0u;
  *((_OWORD *)v5 + 8) = 0u;
  *((_OWORD *)v5 + 5) = 0u;
  *((_OWORD *)v5 + 6) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_OWORD *)v5 + longjmp(dword_18C6E51CC, 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *(_OWORD *)uint64_t v5 = 0u;
  int v6 = malloc(0x20uLL);
  a1[24] = v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  sub_1879C31CC((uint64_t)a1, 0LL);
  uint64_t result = 0LL;
  uint64_t v8 = a1[26];
  *(void *)uint64_t v8 = &unk_1879CB4FC;
  *(_DWORD *)(v8 + 8) = 16;
  *(_BYTE *)(v8 + 16) = 14;
  *(_DWORD *)(v8 + 24) = 0;
  *(void *)(v8 + 32) = &unk_1879CB510;
  *(_DWORD *)(v8 + 40) = 19;
  *(void *)(v8 + 64) = &unk_1879CB51C;
  *(_BYTE *)(v8 + 48) = 17;
  *(_DWORD *)(v8 + 56) = 0;
  *(_DWORD *)(v8 + 72) = 17;
  *(_BYTE *)(v8 + 80) = 16;
  *(_DWORD *)(v8 + 88) = 0;
  *(void *)(v8 + 96) = &unk_1879CB530;
  *(_DWORD *)(v8 + 104) = 18;
  *(_BYTE *)(v8 + 112) = 13;
  *(_DWORD *)(v8 + 1el_set((EditLine *)qword_18C6E51B8, 20) = 0;
  *(void *)(v8 + 128) = &unk_1879CB548;
  *(_DWORD *)(v8 + 136) = 36;
  *(_BYTE *)(v8 + 144) = 10;
  *(_DWORD *)(v8 + 152) = 0;
  *(void *)(v8 + 160) = &unk_1879CB55C;
  *(_DWORD *)(v8 + 168) = 37;
  *(_BYTE *)(v8 + 176) = 11;
  *(_DWORD *)(v8 + 184) = 0;
  *(void *)(v8 + 192) = &unk_1879CB56C;
  *(_DWORD *)(v8 + 200) = 38;
  *(_BYTE *)(v8 + 208) = 3;
  *(_DWORD *)(v8 + 216) = 0;
  return result;
}

uint64_t sub_1879C31CC(uint64_t a1, char *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  sigset_t v19 = 0x8000000;
  sigprocmask(1, &v19, &v20);
  uint64_t v21 = &v22;
  if (!a2 && (a2 = getenv("TERM")) == 0LL || !*a2) {
    a2 = "dumb";
  }
  if (!strcmp(a2, "emacs")) {
    *(_DWORD *)(a1 + 44) |= 4u;
  }
  bzero(*(void **)(a1 + 200), 0x800uLL);
  int v4 = tgetent(*(char **)(a1 + 200), a2);
  int v5 = v4;
  if (v4 <= 0)
  {
    if (v4)
    {
      if (v4 == -1) {
        fwrite("Cannot read termcap database;\n", 0x1EuLL, 1uLL, *(FILE **)(a1 + 24));
      }
    }

    else
    {
      fprintf(*(FILE **)(a1 + 24), "No entry for terminal type %s;\n", a2);
    }

    fwrite("using dumb terminal settings.\n", 0x1EuLL, 1uLL, *(FILE **)(a1 + 24));
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)(a1 + 192);
    *(_OWORD *)(v12 + 4) = xmmword_1879CB450;
    *(_DWORD *)(v12 + el_set((EditLine *)qword_18C6E51B8, 20) = *(_DWORD *)(v12 + 28);
    do
    {
      *(void *)(*(void *)(a1 + 184) + ((v11 * 8) >> 1)) = 0LL;
      uint64_t v13 = off_18A0E9360[v11 + 2];
      v11 += 2LL;
    }

    while (v13);
  }

  else
  {
    **(_DWORD **)(a1 + 192) = tgetflag("am");
    *(_DWORD *)(*(void *)(a1 + 192) + 24LL) = tgetflag("xn");
    *(_DWORD *)(*(void *)(a1 + 192) + 4LL) = tgetflag("pt");
    *(_DWORD *)(*(void *)(a1 + 192) + 2el_set((EditLine *)qword_18C6E51B8, 15, 0LL) = tgetflag("xt");
    *(_DWORD *)(*(void *)(a1 + 192) + 16LL) = tgetflag("km");
    *(_DWORD *)(*(void *)(a1 + 192) + 28LL) = tgetflag("MT");
    *(_DWORD *)(*(void *)(a1 + 192) + 12LL) = tgetnum("co");
    *(_DWORD *)(*(void *)(a1 + 192) + 8LL) = tgetnum("li");
    int v6 = off_18A0E9360;
    sigset_t v7 = "al";
    do
    {
      uint64_t v8 = strchr(v7, *v7);
      sigset_t v9 = tgetstr(v8, &v21);
      sub_1879C3FD4(a1, (uint64_t)v6, v9);
      unint64_t v10 = v6[2];
      v6 += 2;
      sigset_t v7 = v10;
    }

    while (v10);
  }

  uint64_t v14 = *(void *)(a1 + 192);
  int v15 = *(_DWORD *)(v14 + 12);
  if (v15 <= 1)
  {
    int v15 = 80;
    *(_DWORD *)(v14 + 12) = 80;
  }

  *(_DWORD *)(a1 + 156) = v15;
  *(_DWORD *)(a1 + 152) = *(_DWORD *)(v14 + 8);
  sub_1879C41D8(a1);
  sub_1879C43C8(a1, &v18, &v17);
  uint64_t result = sub_1879C44A8(a1, v18, v17);
  if ((_DWORD)result != -1)
  {
    sigprocmask(3, &v20, 0LL);
    sub_1879C4614(a1);
    *(void *)(a1 + 144) = a2;
    if (v5 >= 1) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

void sub_1879C34B4(uint64_t a1)
{
  *(void *)(a1 + 168) = 0LL;
  free(*(void **)(a1 + 200));
  *(void *)(a1 + 200) = 0LL;
  *(void *)(a1 + 176) = 0LL;
  free(*(void **)(a1 + 184));
  *(void *)(a1 + 184) = 0LL;
  free(*(void **)(a1 + 192));
  *(void *)(a1 + 192) = 0LL;
  free(*(void **)(a1 + 208));
  *(void *)(a1 + 208) = 0LL;
  sub_1879C3514(a1);
}

void sub_1879C3514(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 64);
  *(void *)(a1 + 64) = 0LL;
  if (v2)
  {
    int v3 = *v2;
    if (*v2)
    {
      int v4 = v2 + 1;
      do
      {
        free(v3);
        int v5 = *v4++;
        int v3 = v5;
      }

      while (v5);
    }

    free(v2);
  }

  int v6 = *(void ***)(a1 + 72);
  *(void *)(a1 + 72) = 0LL;
  if (v6)
  {
    sigset_t v7 = *v6;
    if (*v6)
    {
      uint64_t v8 = v6 + 1;
      do
      {
        free(v7);
        sigset_t v9 = *v8++;
        sigset_t v7 = v9;
      }

      while (v9);
    }

    free(v6);
  }

uint64_t sub_1879C359C(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 56);
  int v3 = v2 - a2;
  if (v2 != a2)
  {
    uint64_t v5 = result;
    if (*(_DWORD *)(result + 156) >= a2)
    {
      int v6 = a2 - v2;
      if (a2 - v2 < 1)
      {
        uint64_t v12 = *(void *)(result + 184);
        uint64_t result = *(void *)(v12 + 280);
        if (!result || !*(_BYTE *)result || v6 >= -1 && (uint64_t v13 = *(_BYTE **)(v12 + 208)) != 0LL && *v13)
        {
          uint64_t v14 = *(_BYTE **)(v12 + 208);
          if (v14 && v6 < 0 && *v14)
          {
            do
            {
              int v15 = *(const char **)(*(void *)(v5 + 184) + 208LL);
              qword_18C6E5F50 = *(void *)(v5 + 16);
              uint64_t result = tputs(v15, 1, (int (__cdecl *)(int))sub_1879C55B4);
              --v3;
            }

            while (v3);
          }

          goto LABEL_32;
        }

        int v6 = -v6;
      }

      else
      {
        unsigned int v7 = v6 + 1;
        while ((*(_BYTE *)(v5 + 160) & 0x80) != 0)
        {
          uint64_t v8 = *(_DWORD **)(*(void *)(v5 + 64) + 8LL * *(int *)(v5 + 56));
          if (!*v8) {
            break;
          }
          uint64_t v9 = *(int *)(v5 + 152);
          uint64_t v10 = v9 - 1;
          if ((_DWORD)v9 == 1)
          {
            LODWORD(vrl_insert(1, 10) = 0;
          }

          else
          {
            do
            {
              if (v8[v10] != -1) {
                break;
              }
              --v10;
            }

            while (v10);
          }

          sub_1879C3750(v5, v10);
          uint64_t result = sub_1879C3978( v5,  (unsigned __int32 *)(*(void *)(*(void *)(v5 + 64) + 8LL * *(int *)(v5 + 56))
                                        + 4LL * *(int *)(v5 + 52)),
                     *(int *)(v5 + 152) - (uint64_t)*(int *)(v5 + 52));
          --v7;
          BOOL v11 = __OFSUB__(v6--, 1);
          if ((v6 < 0) ^ v11 | (v6 == 0)) {
            goto LABEL_32;
          }
        }

        if (v6 < 2 || (uint64_t result = *(void *)(*(void *)(v5 + 184) + 248LL)) == 0 || !*(_BYTE *)result)
        {
          do
          {
            uint64_t result = sub_1879C3A7C(v5, 0xAu);
            --v7;
          }

          while (v7 > 1);
          *(_DWORD *)(v5 + 52) = 0;
          goto LABEL_32;
        }
      }

      __int32 v16 = tgoto((const char *)result, v6, v6);
      qword_18C6E5F50 = *(void *)(v5 + 16);
      uint64_t result = tputs(v16, v6, (int (__cdecl *)(int))sub_1879C55B4);
LABEL_32:
      *(_DWORD *)(v5 + 56) = a2;
    }
  }

  return result;
}

uint64_t sub_1879C3750(uint64_t result, int a2)
{
  signed int v2 = *(_DWORD *)(result + 52);
  if (v2 != a2)
  {
    uint64_t v4 = result;
    if (*(_DWORD *)(result + 152) >= a2)
    {
      unsigned int v5 = (a2 & 7) + (a2 >> 3);
      while (1)
      {
        if (!a2)
        {
          uint64_t result = sub_1879C3A7C(v4, 0xDu);
          goto LABEL_39;
        }

        int v6 = a2 - v2;
        if ((a2 - v2 - 5) <= 0xFFFFFFF6)
        {
          uint64_t result = *(void *)(*(void *)(v4 + 184) + 32LL);
          if (result)
          {
            if (*(_BYTE *)result)
            {
              uint64_t v9 = tgoto((const char *)result, a2, a2);
              qword_18C6E5F50 = *(void *)(v4 + 16);
              int v10 = a2;
              goto LABEL_36;
            }
          }
        }

        if (v6 >= 1) {
          break;
        }
        int v7 = v2 - a2;
        if (v6 <= -5)
        {
          uint64_t result = *(void *)(*(void *)(v4 + 184) + 264LL);
          if (result)
          {
            if (*(_BYTE *)result)
            {
              uint64_t v9 = tgoto((const char *)result, v2 - a2, v2 - a2);
              qword_18C6E5F50 = *(void *)(v4 + 16);
              int v10 = -v6;
              goto LABEL_36;
            }
          }
        }

        if ((*(_BYTE *)(v4 + 160) & 8) != 0)
        {
          if (v5 >= v7)
          {
LABEL_23:
            if (v6 < 0)
            {
              if (v7 <= 1) {
                int v11 = 1;
              }
              else {
                int v11 = v2 - a2;
              }
              do
              {
                uint64_t result = sub_1879C3A7C(v4, 8u);
                --v11;
              }

              while (v11);
            }

            goto LABEL_39;
          }
        }

        else if (v7 <= a2)
        {
          goto LABEL_23;
        }

        uint64_t result = sub_1879C3A7C(v4, 0xDu);
        signed int v2 = 0;
        *(_DWORD *)(v4 + 52) = 0;
        if (*(_DWORD *)(v4 + 152) < a2) {
          return result;
        }
      }

      if (v6 >= 5)
      {
        uint64_t v8 = *(const char **)(*(void *)(v4 + 184) + 272LL);
        if (v8)
        {
          if (*v8)
          {
            uint64_t v9 = tgoto(v8, a2 - v2, a2 - v2);
            qword_18C6E5F50 = *(void *)(v4 + 16);
            int v10 = v6;
LABEL_36:
            uint64_t result = tputs(v9, v10, (int (__cdecl *)(int))sub_1879C55B4);
            goto LABEL_39;
          }
        }
      }

      if ((*(_BYTE *)(v4 + 160) & 8) != 0)
      {
        int v12 = v2 & 0xF8;
        signed int v13 = a2 & 0xFFFFFFF8;
        if (v12 != (a2 & 0xFFFFFFF8)
          && *(_DWORD *)(*(void *)(*(void *)(v4 + 64) + 8LL * *(int *)(v4 + 56)) + 4LL
                                                                                     * (a2 & 0xF8)) != -1)
        {
          while (v12 < v13)
          {
            sub_1879C3A7C(v4, 9u);
            v12 += 8;
          }

          *(_DWORD *)(v4 + 52) = v13;
          int v6 = a2 & 7;
          signed int v2 = a2 & 0xFFFFFFF8;
        }
      }

      uint64_t result = sub_1879C3978( v4,  (unsigned __int32 *)(*(void *)(*(void *)(v4 + 64) + 8LL * *(int *)(v4 + 56)) + 4LL * v2),  v6);
LABEL_39:
      *(_DWORD *)(v4 + 52) = a2;
    }
  }

  return result;
}

uint64_t sub_1879C3978(uint64_t result, unsigned __int32 *a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = a3;
    uint64_t v4 = result;
    if (*(int *)(result + 152) >= a3)
    {
      do
      {
        unsigned __int32 v6 = *a2++;
        uint64_t result = sub_1879C3A7C(v4, v6);
        int v7 = *(_DWORD *)(v4 + 52) + 1;
        *(_DWORD *)(v4 + 52) = v7;
        --v3;
      }

      while (v3);
      int v8 = *(_DWORD *)(v4 + 152);
      if (v7 >= v8)
      {
        int v9 = *(_DWORD *)(v4 + 160);
        if ((v9 & 0x80) == 0)
        {
          int v10 = v8 - 1;
LABEL_7:
          *(_DWORD *)(v4 + 52) = v10;
          return result;
        }

        uint64_t v11 = *(int *)(v4 + 56) + 1LL;
        *(_DWORD *)(v4 + 52) = 0;
        *(_DWORD *)(v4 + 56) = v11;
        if ((v9 & 0x100) != 0)
        {
          int v17 = **(_DWORD **)(*(void *)(v4 + 64) + 8 * v11);
          if (!v17)
          {
            uint64_t result = sub_1879C3A7C(v4, 0x20u);
            int v10 = 1;
            goto LABEL_7;
          }

          uint64_t result = sub_1879C3978(v4, &v17, 1LL);
          uint64_t v12 = *(int *)(v4 + 52);
          uint64_t v13 = *(void *)(*(void *)(v4 + 64) + 8LL * *(int *)(v4 + 56));
          if (*(_DWORD *)(v13 + 4 * v12) == -1)
          {
            uint64_t v14 = (int *)(v13 + 4 * v12 + 4);
            int v15 = v12 + 1;
            do
            {
              *(_DWORD *)(v4 + 52) = v15;
              int v16 = *v14++;
              ++v15;
            }

            while (v16 == -1);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1879C3A7C(uint64_t a1, unsigned __int32 a2)
{
  if (a2 == -1) {
    return 0LL;
  }
  uint64_t v7 = v2;
  uint64_t v8 = v3;
  uint64_t result = sub_1879C7E14(v6, 6uLL, a2);
  if (result > 0)
  {
    v6[result] = 0;
    return fputs(v6, *(FILE **)(a1 + 16));
  }

  return result;
}

char *sub_1879C3ADC(char *result, int a2)
{
  if (a2 < 1) {
    return result;
  }
  uint64_t v2 = result;
  if ((result[160] & 2) == 0) {
    return result;
  }
  int v3 = a2;
  if (*((_DWORD *)result + 38) < a2) {
    return result;
  }
  uint64_t v4 = (void *)*((void *)result + 23);
  unsigned int v5 = (const char *)v4[30];
  if (v5)
  {
    if (*v5)
    {
      if (a2 > 1 || (unsigned __int32 v6 = (_BYTE *)v4[6]) == 0LL || !*v6)
      {
        uint64_t result = tgoto(v5, a2, a2);
        qword_18C6E5F50 = *((void *)v2 + 2);
        int v10 = v3;
        return (char *)tputs(result, v10, (int (__cdecl *)(int))sub_1879C55B4);
      }
    }
  }

  uint64_t v7 = (const char *)v4[8];
  if (v7 && *v7)
  {
    qword_18C6E5F50 = *((void *)v2 + 2);
    tputs(v7, 1, (int (__cdecl *)(int))sub_1879C55B4);
    uint64_t v4 = (void *)*((void *)v2 + 23);
  }

  uint64_t v8 = (_BYTE *)v4[6];
  if (v8 && *v8)
  {
    do
    {
      --v3;
      int v9 = *(const char **)(*((void *)v2 + 23) + 48LL);
      qword_18C6E5F50 = *((void *)v2 + 2);
      tputs(v9, 1, (int (__cdecl *)(int))sub_1879C55B4);
    }

    while (v3);
    uint64_t v4 = (void *)*((void *)v2 + 23);
  }

  uint64_t result = (char *)v4[9];
  if (result && *result)
  {
    qword_18C6E5F50 = *((void *)v2 + 2);
    int v10 = 1;
    return (char *)tputs(result, v10, (int (__cdecl *)(int))sub_1879C55B4);
  }

  return result;
}

uint64_t sub_1879C3C20(uint64_t result, unsigned __int32 *a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v3 = result;
    if ((*(_BYTE *)(result + 160) & 1) != 0)
    {
      unsigned int v4 = a3;
      if (*(_DWORD *)(result + 152) >= a3)
      {
        unsigned __int32 v6 = *(void **)(result + 184);
        uint64_t v7 = (const char *)v6[32];
        if (v7 && *v7 && (a3 > 1 || (uint64_t v8 = (_BYTE *)v6[13]) == 0LL || !*v8))
        {
          int v17 = tgoto(v7, a3, a3);
          qword_18C6E5F50 = *(void *)(v3 + 16);
          tputs(v17, v4, (int (__cdecl *)(int))sub_1879C55B4);
          return sub_1879C3978(v3, a2, v4);
        }

        else
        {
          int v9 = (const char *)v6[14];
          if (v9 && *v9 && (int v10 = (_BYTE *)v6[10]) != 0LL && *v10)
          {
            qword_18C6E5F50 = *(void *)(v3 + 16);
            tputs(v9, 1, (int (__cdecl *)(int))sub_1879C55B4);
            *(_DWORD *)(v3 + 52) += v4;
            do
            {
              unsigned __int32 v11 = *a2++;
              sub_1879C3A7C(v3, v11);
              --v4;
            }

            while (v4);
            uint64_t v12 = *(void *)(v3 + 184);
            uint64_t v13 = *(const char **)(v12 + 120);
            if (v13)
            {
              if (*v13)
              {
                qword_18C6E5F50 = *(void *)(v3 + 16);
                tputs(v13, 1, (int (__cdecl *)(int))sub_1879C55B4);
                uint64_t v12 = *(void *)(v3 + 184);
              }
            }

            uint64_t v14 = *(const char **)(v12 + 80);
            qword_18C6E5F50 = *(void *)(v3 + 16);
            return tputs(v14, 1, (int (__cdecl *)(int))sub_1879C55B4);
          }

          else
          {
            do
            {
              int v15 = *(const char **)(*(void *)(v3 + 184) + 104LL);
              if (v15 && *v15)
              {
                qword_18C6E5F50 = *(void *)(v3 + 16);
                tputs(v15, 1, (int (__cdecl *)(int))sub_1879C55B4);
              }

              unsigned __int32 v16 = *a2++;
              sub_1879C3A7C(v3, v16);
              ++*(_DWORD *)(v3 + 52);
              uint64_t result = *(void *)(*(void *)(v3 + 184) + 120LL);
              if (result && *(_BYTE *)result)
              {
                qword_18C6E5F50 = *(void *)(v3 + 16);
                uint64_t result = tputs((const char *)result, 1, (int (__cdecl *)(int))sub_1879C55B4);
              }

              --v4;
            }

            while (v4);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1879C3E18(uint64_t result, int a2)
{
  uint64_t v3 = result;
  if ((*(_BYTE *)(result + 160) & 4) != 0
    && (uint64_t result = *(void *)(*(void *)(result + 184) + 24LL)) != 0
    && *(_BYTE *)result)
  {
    qword_18C6E5F50 = *(void *)(v3 + 16);
    return tputs((const char *)result, 1, (int (__cdecl *)(int))sub_1879C55B4);
  }

  else
  {
    if (a2 >= 1)
    {
      int v4 = a2;
      do
      {
        uint64_t result = sub_1879C3A7C(v3, 0x20u);
        --v4;
      }

      while (v4);
    }

    *(_DWORD *)(v3 + 52) += a2;
  }

  return result;
}

uint64_t sub_1879C3EB0(void *a1)
{
  uint64_t v2 = (void *)a1[23];
  uint64_t v3 = (const char *)v2[5];
  if (v3 && *v3)
  {
    int v4 = *(_DWORD *)(a1[24] + 8LL);
    qword_18C6E5F50 = a1[2];
    return tputs(v3, v4, (int (__cdecl *)(int))sub_1879C55B4);
  }

  unsigned int v5 = (const char *)v2[12];
  if (v5)
  {
    if (*v5)
    {
      unsigned __int32 v6 = (_BYTE *)v2[2];
      if (v6)
      {
        if (*v6)
        {
          int v7 = *(_DWORD *)(a1[24] + 8LL);
          qword_18C6E5F50 = a1[2];
          tputs(v5, v7, (int (__cdecl *)(int))sub_1879C55B4);
          uint64_t v3 = *(const char **)(a1[23] + 16LL);
          int v4 = *(_DWORD *)(a1[24] + 8LL);
          qword_18C6E5F50 = a1[2];
          return tputs(v3, v4, (int (__cdecl *)(int))sub_1879C55B4);
        }
      }
    }
  }

  sub_1879C3A7C((uint64_t)a1, 0xDu);
  return sub_1879C3A7C((uint64_t)a1, 0xAu);
}

void el_beep_0(EditLine *a1)
{
  uint64_t v2 = *(const char **)(*((void *)a1 + 23) + 8LL);
  if (v2 && *v2)
  {
    qword_18C6E5F50 = *((void *)a1 + 2);
    tputs(v2, 1, (int (__cdecl *)(int))sub_1879C55B4);
  }

  else
  {
    sub_1879C3A7C((uint64_t)a1, 7u);
  }

uint64_t sub_1879C3FC8(uint64_t result, void *a2)
{
  *a2 = *(void *)(result + 144);
  return result;
}

void sub_1879C3FD4(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)(a1 + 184);
  uint64_t v6 = (a2 - (uint64_t)off_18A0E9360) >> 4;
  bzero(__src, 0x800uLL);
  if (!a3 || !*a3)
  {
    *(void *)(v5 + 8 * v6) = 0LL;
    return;
  }

  size_t v7 = strlen(a3);
  size_t v8 = v7;
  int v9 = *(char **)(v5 + 8 * v6);
  if (v9)
  {
    if (v7 <= strlen(*(const char **)(v5 + 8 * v6)))
    {
      strcpy(v9, a3);
      return;
    }
  }

  else if (!v7)
  {
    return;
  }

  uint64_t v10 = *(void *)(a1 + 176);
  if ((unint64_t)(v10 + 3) >= 0x800)
  {
    uint64_t v12 = 0LL;
    for (uint64_t i = 0LL; i != 39; ++i)
    {
      uint64_t v14 = *(char **)(v5 + 8 * i);
      if (v14) {
        BOOL v15 = v14 == v9;
      }
      else {
        BOOL v15 = 1;
      }
      if (!v15)
      {
        char v16 = *v14;
        if (*v14)
        {
          int v17 = (unsigned __int8 *)(v14 + 1);
          do
          {
            uint64_t v18 = v12 + 1;
            __src[v12] = v16;
            int v19 = *v17++;
            char v16 = v19;
            ++v12;
          }

          while (v19);
        }

        else
        {
          uint64_t v18 = v12;
        }

        uint64_t v12 = v18 + 1;
        __src[v18] = 0;
      }
    }

    memcpy(*(void **)(a1 + 168), __src, 0x800uLL);
    *(void *)(a1 + 176) = v12;
    if ((unint64_t)(v12 - 2045) <= 0xFFFFFFFFFFFFF7FFLL)
    {
      fwrite("Out of termcap string space.\n", 0x1DuLL, 1uLL, *(FILE **)(a1 + 24));
      return;
    }

    unsigned __int32 v11 = (char *)(*(void *)(a1 + 168) + v12);
  }

  else
  {
    unsigned __int32 v11 = (char *)(*(void *)(a1 + 168) + v10);
  }

  *(void *)(v5 + 8 * v6) = v11;
  strcpy(v11, a3);
  *(void *)(a1 + 176) += v8 + 1;
}

uint64_t sub_1879C41D8(uint64_t result)
{
  uint64_t v1 = result;
  *(_DWORD *)(result + 160) = 0;
  int v2 = *(_DWORD *)(result + 824);
  uint64_t v3 = *(_DWORD **)(result + 192);
  if (v2)
  {
    int v2 = v3[1];
    if (v2) {
      int v2 = 8 * (v3[5] == 0);
    }
    *(_DWORD *)(result + 160) = v2;
  }

  if (v3[4]) {
    int v4 = 64;
  }
  else {
    int v4 = (v3[7] != 0) << 6;
  }
  int v5 = v2 | v4;
  *(_DWORD *)(result + 160) = v5;
  uint64_t v6 = *(void *)(result + 184);
  size_t v7 = *(_BYTE **)(v6 + 24);
  if (v7) {
    LODWORD(v7) = 4 * (*v7 != 0);
  }
  unsigned int v8 = v7 | v5;
  *(_DWORD *)(result + 160) = v8;
  int v9 = *(_BYTE **)(v6 + 48);
  if (v9 && *v9)
  {
    LODWORD(vrl_insert(1, 10) = 2;
  }

  else
  {
    uint64_t v10 = *(_BYTE **)(v6 + 240);
    if (v10) {
      LODWORD(vrl_insert(1, 10) = 2 * (*v10 != 0);
    }
  }

  unsigned int v11 = v10 | v8;
  *(_DWORD *)(result + 160) = v11;
  uint64_t v12 = *(_BYTE **)(v6 + 112);
  if (v12 && *v12 || (uint64_t v13 = *(_BYTE **)(v6 + 104)) != 0LL && *v13)
  {
    LODWORD(v14) = 1;
  }

  else
  {
    uint64_t v14 = *(unsigned __int8 **)(v6 + 256);
    if (v14) {
      LODWORD(v14) = *v14 != 0;
    }
  }

  unsigned int v15 = v14 | v11;
  *(_DWORD *)(result + 160) = v15;
  char v16 = *(_BYTE **)(v6 + 208);
  if (v16 && *v16)
  {
    LODWORD(v17) = 32;
  }

  else
  {
    int v17 = *(_BYTE **)(v6 + 280);
    if (v17) {
      LODWORD(v17) = 32 * (*v17 != 0);
    }
  }

  unsigned int v18 = v17 | v15;
  *(_DWORD *)(result + 160) = v18;
  int v19 = v18 | ((*v3 != 0) << 7);
  *(_DWORD *)(result + 160) = v19;
  int v20 = v19 | ((v3[6] != 0) << 8);
  *(_DWORD *)(result + 160) = v20;
  uint64_t v21 = *(const char **)(v6 + 168);
  if (!v21)
  {
    unsigned int v25 = v20 & 0xFFFFFFEF;
    goto LABEL_38;
  }

  if (*v21 && (char v22 = *(const char **)(v6 + 224)) != 0LL && *v22)
  {
    uint64_t result = strcmp(*(const char **)(v6 + 168), v22);
    unsigned int v23 = v20 | (16 * ((_DWORD)result == 0));
  }

  else
  {
    unsigned int v23 = v20 & 0xFFFFFFEF;
  }

  *(_DWORD *)(v1 + 160) = v23;
  if (*v21)
  {
    int v24 = *(const char **)(v6 + 184);
    if (v24)
    {
      if (*v24)
      {
        uint64_t result = strcmp(v21, v24);
        unsigned int v25 = v23 | (16 * ((_DWORD)result == 0));
LABEL_38:
        *(_DWORD *)(v1 + 160) = v25;
      }
    }
  }

  return result;
}

BOOL sub_1879C43C8(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v6 = *(void *)(a1 + 192);
  *a3 = *(_DWORD *)(v6 + 12);
  *a2 = *(_DWORD *)(v6 + 8);
  if (ioctl(*(_DWORD *)(a1 + 32), 0x40087468uLL, &v9) != -1)
  {
    if (v10) {
      *a3 = v10;
    }
    if (v9) {
      *a2 = v9;
    }
  }

  if (ioctl(*(_DWORD *)(a1 + 32), 0x40087468uLL, &v9) != -1)
  {
    if (v10) {
      *a3 = v10;
    }
    if (v9) {
      *a2 = v9;
    }
  }

  uint64_t v7 = *(void *)(a1 + 192);
  return *(_DWORD *)(v7 + 12) != *a3 || *(_DWORD *)(v7 + 8) != *a2;
}

uint64_t sub_1879C44A8(uint64_t a1, int a2, int a3)
{
  if (a3 >= 2) {
    int v4 = a3;
  }
  else {
    int v4 = 80;
  }
  uint64_t v5 = *(void *)(a1 + 192);
  if (a2 >= 1) {
    int v6 = a2;
  }
  else {
    int v6 = 24;
  }
  *(_DWORD *)(v5 + 8) = v6;
  *(_DWORD *)(v5 + 12) = v4;
  sub_1879C3514(a1);
  uint64_t v7 = *(void *)(a1 + 192);
  int v8 = *(_DWORD *)(v7 + 12);
  *(_DWORD *)(a1 + 152) = v8;
  uint64_t v9 = *(unsigned int *)(v7 + 8);
  *(_DWORD *)(a1 + 156) = v9;
  unsigned __int16 v10 = malloc(8LL * ((int)v9 + 1));
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v11 = v10;
  if ((int)v9 >= 1)
  {
    uint64_t v12 = 0LL;
    while (1)
    {
      uint64_t v13 = malloc(4LL * (v8 + 1));
      v11[v12] = v13;
      if (!v13) {
        break;
      }
      if (v9 == ++v12) {
        goto LABEL_12;
      }
    }

    if (v12)
    {
      uint64_t v18 = v12 + 1;
      do
        free((void *)v11[(v18-- - 2)]);
      while (v18 > 1);
    }

LABEL_25:
    free(v11);
    return 0xFFFFFFFFLL;
  }

void sub_1879C4614(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 168))
  {
    uint64_t v2 = *(void *)(a1 + 1056);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 208);
      int v4 = *(_DWORD *)(a1 + 1096);
      if (v4 == 1) {
        uint64_t v2 = *(void *)(a1 + 1048);
      }
      BOOL v17 = v4 == 1;
      uint64_t v5 = 1072LL;
      if (v17) {
        uint64_t v5 = 1080LL;
      }
      uint64_t v6 = *(void *)(a1 + v5);
      sub_1879BB4F4(a1, &dword_1879CB588, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
      sub_1879BB4F4(a1, &dword_1879CB598, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
      sub_1879BB4F4(a1, &dword_1879CB5A8, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
      sub_1879BB4F4(a1, &dword_1879CB5B8, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
      sub_1879BB4F4(a1, &dword_1879CB5C8, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
      sub_1879BB4F4(a1, &dword_1879CB5D8, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
      sub_1879BB4F4(a1, &dword_1879CB5E8, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
      sub_1879BB4F4(a1, &dword_1879CB5F8, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
      sub_1879BB4F4(a1, &dword_1879CB608, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
      sub_1879BB4F4(a1, &dword_1879CB618, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
      sub_1879BB4F4(a1, &dword_1879CB628, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
      sub_1879BB4F4(a1, &dword_1879CB638, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
      if (*(_DWORD *)(a1 + 1096) == 1)
      {
        sub_1879BB4F4(a1, dword_1879CB58C, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
        sub_1879BB4F4(a1, dword_1879CB59C, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
        sub_1879BB4F4(a1, dword_1879CB5AC, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
        sub_1879BB4F4(a1, dword_1879CB5BC, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
        sub_1879BB4F4(a1, dword_1879CB5CC, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
        sub_1879BB4F4(a1, dword_1879CB5DC, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
        sub_1879BB4F4(a1, dword_1879CB5EC, (const __int32 **)(v3 + 48), *(_DWORD *)(v3 + 56));
        sub_1879BB4F4(a1, dword_1879CB5FC, (const __int32 **)(v3 + 16), *(_DWORD *)(v3 + 24));
        sub_1879BB4F4(a1, dword_1879CB60C, (const __int32 **)(v3 + 112), *(_DWORD *)(v3 + 120));
        sub_1879BB4F4(a1, dword_1879CB61C, (const __int32 **)(v3 + 80), *(_DWORD *)(v3 + 88));
        sub_1879BB4F4(a1, dword_1879CB62C, (const __int32 **)(v3 + 144), *(_DWORD *)(v3 + 152));
        sub_1879BB4F4(a1, dword_1879CB63C, (const __int32 **)(v3 + 176), *(_DWORD *)(v3 + 184));
      }

      for (uint64_t i = 0LL; i != 7; ++i)
      {
        int v8 = *(unsigned __int8 **)(*(void *)(a1 + 184) + 8LL * *(int *)(v3 + 32 * i + 8));
        if (!v8 || !*v8) {
          continue;
        }
        uint64_t v9 = 0LL;
        unint64_t v10 = 0LL;
        while (v8[v10])
        {
          v20[v9++] = (char)v8[v10++];
          if (v10 == 8) {
            goto LABEL_18;
          }
        }

        if (v10 <= 7) {
          bzero(&v20[v9], 32 - v9 * 4);
        }
LABEL_18:
        uint64_t v11 = v3 + 32 * i;
        int v14 = *(_DWORD *)(v11 + 24);
        uint64_t v13 = (int *)(v11 + 24);
        int v12 = v14;
        if (v14 == 2)
        {
          sub_1879BB6F4(a1, v2, v20);
        }

        else
        {
          uint64_t v15 = *v8;
          if (v8[1])
          {
            int v16 = *(unsigned __int8 *)(v2 + v15);
            BOOL v17 = *(unsigned __int8 *)(v6 + v15) == v16 || v16 == 24;
            if (v17)
            {
              sub_1879BB4F4(a1, v20, (const __int32 **)(v3 + 32 * i + 16), v12);
              char v18 = 24;
LABEL_32:
              *(_BYTE *)(v2 + v15) = v18;
              continue;
            }
          }

          else
          {
            int v16 = *(unsigned __int8 *)(v2 + v15);
          }

          if (v16 == 34)
          {
            sub_1879BB6F4(a1, v2, v20);
            uint64_t v19 = (const __int32 **)(v3 + 32 * i + 16);
            if (!*v13)
            {
              char v18 = *(_BYTE *)v19;
              goto LABEL_32;
            }

            sub_1879BB4F4(a1, v20, v19, *v13);
          }
        }
      }
    }
  }

uint64_t sub_1879C4A34(uint64_t a1, __int32 *a2, void *a3, int a4)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = *(void *)(a1 + 208);
  while (1)
  {
    uint64_t result = wcscmp(a2, *(const __int32 **)(v8 + v7));
    if (!(_DWORD)result) {
      break;
    }
    v7 += 32LL;
    if (v7 == 224) {
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t v10 = v8 + v7;
  *(void *)(v10 + 16) = *a3;
  *(_DWORD *)(v10 + 24) = a4;
  return result;
}

uint64_t sub_1879C4AA4(uint64_t a1, __int32 *a2)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = *(void *)(a1 + 208);
  while (1)
  {
    uint64_t result = wcscmp(a2, *(const __int32 **)(v4 + v3));
    if (!(_DWORD)result) {
      break;
    }
    v3 += 32LL;
    if (v3 == 224) {
      return 0xFFFFFFFFLL;
    }
  }

  *(_DWORD *)(v4 + v3 + 24) = 2;
  return result;
}

uint64_t sub_1879C4B00(uint64_t result, __int32 *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = 0LL;
  uint64_t v5 = *(void *)(result + 208);
  do
  {
    if (!*a2 || (uint64_t result = wcscmp(a2, *(const __int32 **)(v5 + v4)), !(_DWORD)result))
    {
      int v6 = *(_DWORD *)(v5 + v4 + 24);
      if (v6 != 2) {
        uint64_t result = sub_1879BB990(v3, *(unsigned __int32 **)(v5 + v4), (unsigned int **)(v5 + v4 + 16), v6);
      }
    }

    v4 += 32LL;
  }

  while (v4 != 224);
  return result;
}

uint64_t sub_1879C4B70(uint64_t a1)
{
  return fflush(*(FILE **)(a1 + 16));
}

uint64_t sub_1879C4B78(uint64_t a1, unint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v3 = sub_1879C819C(v6, 8uLL, a2);
  unint64_t v4 = v3 & ~(v3 >> 63);
  v6[v4] = 0;
  sub_1879C3978(a1, v6, v4);
  return fflush(*(FILE **)(a1 + 16));
}

uint64_t sub_1879C4BF8(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 160) & 0x40) != 0) {
    uint64_t v2 = "a";
  }
  else {
    uint64_t v2 = "no";
  }
  fprintf(*(FILE **)(a1 + 16), "\tIt has %s meta key\n", v2);
  if ((*(_DWORD *)(a1 + 160) & 8) != 0) {
    uint64_t v3 = " ";
  }
  else {
    uint64_t v3 = "not ";
  }
  fprintf(*(FILE **)(a1 + 16), "\tIt can%suse tabs\n", v3);
  if ((*(_DWORD *)(a1 + 160) & 0x80) != 0) {
    unint64_t v4 = "has";
  }
  else {
    unint64_t v4 = "does not have";
  }
  fprintf(*(FILE **)(a1 + 16), "\tIt %s automatic margins\n", v4);
  int v5 = *(_DWORD *)(a1 + 160);
  if ((v5 & 0x80) != 0)
  {
    if ((v5 & 0x100) != 0) {
      int v6 = "has";
    }
    else {
      int v6 = "does not have";
    }
    fprintf(*(FILE **)(a1 + 16), "\tIt %s magic margins\n", v6);
  }

  uint64_t v7 = *(__int32 ***)(a1 + 184);
  uint64_t v8 = "al";
  uint64_t v9 = off_18A0E9370;
  do
  {
    uint64_t v10 = *v7;
    if (*v7 && *(_BYTE *)v10)
    {
      uint64_t v11 = sub_1879C7E88(v10, a1 + 1264);
      int v12 = (unsigned __int32 *)sub_1879C8060((unsigned int *)v11);
      uint64_t v13 = (const char *)sub_1879C7D54(v12, a1 + 1264);
    }

    else
    {
      uint64_t v13 = "(empty)";
    }

    fprintf(*(FILE **)(a1 + 16), "\t%25s (%s) == %s\n", *(v9 - 1), v8, v13);
    ++v7;
    int v14 = *v9;
    v9 += 2;
    uint64_t v8 = v14;
  }

  while (v14);
  fputc(10, *(FILE **)(a1 + 16));
  return 0LL;
}

uint64_t sub_1879C4DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    int v5 = *(unsigned __int32 **)(a3 + 8);
    if (v5)
    {
      if (*(void *)(a3 + 16))
      {
        int v6 = sub_1879C7D54(v5, a1 + 1264);
        strncpy(__dst, (const char *)v6, 8uLL);
        __dst[7] = 0;
        uint64_t v7 = sub_1879C7D54(*(unsigned __int32 **)(a3 + 16), a1 + 1264);
        strncpy(__str, (const char *)v7, 8uLL);
        __str[7] = 0;
        uint64_t v8 = off_18A0E9360;
        uint64_t v9 = "al";
        do
        {
          if (!strcmp(v9, __dst))
          {
            sub_1879C3FD4(a1, (uint64_t)v8, __str);
            sub_1879C41D8(a1);
            return 0LL;
          }

          uint64_t v10 = v8[2];
          v8 += 2;
          uint64_t v9 = v10;
        }

        while (v10);
        uint64_t v11 = "am";
        int v12 = off_18A0E95F0;
        while (strcmp(v11, __dst))
        {
          uint64_t v13 = *v12;
          v12 += 2;
          uint64_t v11 = v13;
          if (!v13)
          {
            int v14 = strtol(__str, &__endptr, 10);
            if (*__endptr)
            {
              return 0xFFFFFFFFLL;
            }

            int v16 = v14;
            uint64_t result = 0LL;
            BOOL v17 = *(_DWORD **)(a1 + 192);
            v17[8] = v16;
            *(_DWORD *)(a1 + 156) = v17[3];
            *(_DWORD *)(a1 + 152) = v17[2];
            return result;
          }
        }
      }
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_1879C4F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(const char **)(a3 + 8);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v4 = *(_DWORD **)(a3 + 16);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = "al";
  do
  {
    uint64_t result = strcmp(v7, v3);
    if (!(_DWORD)result)
    {
      uint64_t v11 = *(void **)(*(void *)(a1 + 184) + ((v6 * 8) >> 1));
      goto LABEL_21;
    }

    uint64_t v7 = off_18A0E9360[v6 + 2];
    v6 += 2LL;
  }

  while (v7);
  uint64_t v9 = 0LL;
  uint64_t v10 = "am";
  while (strcmp(v10, v3))
  {
    uint64_t v10 = off_18A0E95E0[v9 + 2];
    v9 += 2LL;
    if (!v10) {
      return 0xFFFFFFFFLL;
    }
  }

  int v12 = *(_DWORD *)(*(void *)(a1 + 192) + ((v9 * 8) >> 2));
  if (v9 * 8 && v9 != 2 && v9 != 8 && v9 != 12)
  {
    uint64_t result = 0LL;
    _DWORD *v4 = v12;
    return result;
  }

  uint64_t result = 0LL;
  if (v12) {
    uint64_t v11 = &unk_18C6E5130;
  }
  else {
    uint64_t v11 = &unk_18C6E5134;
  }
LABEL_21:
  *(void *)unint64_t v4 = v11;
  return result;
}

uint64_t sub_1879C504C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  unsigned int v42 = &v44;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = a3 + 8;
  uint64_t result = *(void *)(a3 + 8);
  if (!result) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)result == 45)
  {
    int v6 = *(_DWORD *)(result + 4);
    BOOL v7 = v6 != 115 && v6 == 118;
    BOOL v8 = v6 == 115;
    uint64_t v10 = *(void *)(a3 + 16);
    uint64_t v9 = a3 + 16;
    uint64_t result = v10;
    if (!v10) {
      return result;
    }
    uint64_t v5 = v9;
    if (!*(_DWORD *)result) {
      return 0LL;
    }
  }

  else
  {
    BOOL v8 = 0;
    BOOL v7 = 0;
    if (!*(_DWORD *)result) {
      return 0LL;
    }
  }

  if (!wcscmp((const __int32 *)result, dword_1879CB468))
  {
    int v16 = *(FILE **)(a1 + 16);
LABEL_27:
    fprintf(v16, "%s\n");
    return 0LL;
  }

  if (!wcscmp(*(const __int32 **)v5, dword_1879CB47C))
  {
    int v16 = *(FILE **)(a1 + 16);
    goto LABEL_27;
  }

  if (!wcscmp(*(const __int32 **)v5, dword_1879CB490))
  {
    int v16 = *(FILE **)(a1 + 16);
    goto LABEL_27;
  }

  if (!wcscmp(*(const __int32 **)v5, dword_1879CB49C))
  {
    int v16 = *(FILE **)(a1 + 16);
    goto LABEL_27;
  }

  if (!wcscmp(*(const __int32 **)v5, dword_1879CB4A8))
  {
    BOOL v17 = *(FILE **)(a1 + 16);
    goto LABEL_31;
  }

  if (!wcscmp(*(const __int32 **)v5, dword_1879CB4BC) || !wcscmp(*(const __int32 **)v5, dword_1879CB4D0))
  {
    BOOL v17 = *(FILE **)(a1 + 16);
LABEL_31:
    fprintf(v17, "%d\n");
    return 0LL;
  }

  if (!wcscmp(*(const __int32 **)v5, dword_1879CB4E8))
  {
    BOOL v17 = *(FILE **)(a1 + 16);
    goto LABEL_31;
  }

  uint64_t v11 = 0LL;
  int v12 = "al";
  while (1)
  {
    uint64_t v13 = sub_1879C7D54(*(unsigned __int32 **)v5, a1 + 1264);
    int v12 = off_18A0E9360[v11 + 2];
    v11 += 2LL;
    if (!v12)
    {
      int v14 = sub_1879C7D54(*(unsigned __int32 **)v5, a1 + 1264);
      uint64_t v15 = tgetstr((char *)v14, &v42);
      goto LABEL_34;
    }
  }

  uint64_t v15 = *(char **)(*(void *)(a1 + 184) + ((v11 * 8) >> 1));
LABEL_34:
  if (!v15 || (int v18 = *v15, !*v15))
  {
    if (!v8) {
    return 0xFFFFFFFFLL;
    }
  }

  int v19 = 0;
  v41 = v15;
  int v20 = v15;
  while (v18 == 37)
  {
    unsigned int v22 = *++v20;
    uint64_t v21 = v22;
    char v23 = v22 - 37;
    if (v22 - 37 > 0x3F) {
      goto LABEL_44;
    }
    if (((1LL << v23) & 0x8000000000006240LL) != 0)
    {
      ++v19;
      goto LABEL_52;
    }

    if (((1LL << v23) & 0xA2000001LL) == 0)
    {
LABEL_44:
    }

LABEL_52:
    int v26 = *++v20;
    int v18 = v26;
  }

  if (v18) {
    goto LABEL_52;
  }
  if (v19 == 2)
  {
LABEL_71:
    int v32 = *(const __int32 **)(v5 + 8);
    if (v32 && *v32)
    {
      uint64_t v33 = wcstol(v32, &v43, 10);
      if (*v43 || (int v34 = v33, v33 < 0))
      {
        if (!v8) {
        return 0xFFFFFFFFLL;
        }
      }

      uint64_t v35 = *(const __int32 **)(v5 + 16);
      if (v35)
      {
        if (*v35)
        {
          uint64_t v36 = wcstol(v35, &v43, 10);
          if (!*v43 && (v36 & 0x8000000000000000LL) == 0)
          {
            int v37 = v36;
            unint64_t v38 = *(_DWORD **)(v5 + 24);
            if (!v38 || !*v38)
            {
              uint64_t v31 = tgoto(v41, v34, v36);
              qword_18C6E5F50 = *(void *)(a1 + 16);
              int v39 = v37;
              goto LABEL_86;
            }

            goto LABEL_60;
          }

          if (v8) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v40 = *(FILE **)(a1 + 24);
          goto LABEL_95;
        }
      }
    }

    goto LABEL_82;
  }

  if (v19 == 1)
  {
    unint64_t v28 = *(const __int32 **)(v5 + 8);
    if (v28 && *v28)
    {
      uint64_t v29 = wcstol(v28, &v43, 10);
      if (!*v43 && (v29 & 0x8000000000000000LL) == 0)
      {
        uint64_t v30 = *(_DWORD **)(v5 + 16);
        if (!v30 || !*v30)
        {
          uint64_t v31 = tgoto(v41, 0, v29);
          qword_18C6E5F50 = *(void *)(a1 + 16);
          goto LABEL_85;
        }

LABEL_60:
        if (!v8) {
        return 0xFFFFFFFFLL;
        }
      }

      if (v8) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v40 = *(FILE **)(a1 + 24);
LABEL_95:
      return 0xFFFFFFFFLL;
    }

LABEL_82:
    if (!v8) {
      fwrite("echotc: Warning: Missing argument.\n", 0x23uLL, 1uLL, *(FILE **)(a1 + 24));
    }
    return 0xFFFFFFFFLL;
  }

  if (v19)
  {
    if (v7) {
      fprintf(*(FILE **)(a1 + 24), "echotc: Warning: Too many required arguments (%d).\n", v19);
    }
    goto LABEL_71;
  }

  unsigned __int32 v27 = *(_DWORD **)(v5 + 8);
  if (v27 && *v27) {
    goto LABEL_60;
  }
  qword_18C6E5F50 = *(void *)(a1 + 16);
  uint64_t v31 = v41;
LABEL_85:
  int v39 = 1;
LABEL_86:
  tputs(v31, v39, (int (__cdecl *)(int))sub_1879C55B4);
  return 0LL;
}

uint64_t sub_1879C55B4(int a1)
{
  if (qword_18C6E5F50) {
    return fputc(a1, (FILE *)qword_18C6E5F50);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

TokenizerW *__cdecl tok_winit(const __int32 *a1)
{
  uint64_t v2 = (char *)malloc(0x48uLL);
  if (v2)
  {
    if (a1) {
      uint64_t v3 = a1;
    }
    else {
      uint64_t v3 = (const __int32 *)&unk_1879CB680;
    }
    unint64_t v4 = sub_1879C8C44(v3);
    *(void *)uint64_t v2 = v4;
    if (v4)
    {
      uint64_t v5 = v4;
      *(_OWORD *)(v2 + 8) = xmmword_1879CB650;
      int v6 = malloc(0x50uLL);
      *((void *)v2 + 3) = v6;
      if (v6)
      {
        BOOL v7 = v6;
        void *v6 = 0LL;
        BOOL v8 = (char *)malloc(0x50uLL);
        *((void *)v2 + 7) = v8;
        if (v8)
        {
          *((void *)v2 + 5) = v8 + 80;
          *((void *)v2 + 6) = v8;
          *((void *)v2 + 4) = v8;
          *((void *)v2 + 8) = 0LL;
          return (TokenizerW *)v2;
        }

        free(v7);
      }

      free(v5);
    }

    free(v2);
    return 0LL;
  }

  return (TokenizerW *)v2;
}

void tok_wreset(TokenizerW *a1)
{
  *((void *)a1 + longjmp(dword_18C6E51CC, 1) = 0LL;
  uint64_t v1 = *((void *)a1 + 7);
  *((void *)a1 + 6) = v1;
  *((void *)a1 + 4) = v1;
  *((void *)a1 + 8) = 0LL;
}

void tok_wend(TokenizerW *a1)
{
}

int tok_wline(TokenizerW *a1, const LineInfoW *a2, int *a3, const __int32 ***a4, int *a5, int *a6)
{
  int buffer = a2->buffer;
  LODWORD(v9) = -1;
  int v10 = -1;
  while (1)
  {
    else {
      uint64_t v11 = buffer;
    }
    if (v11 == a2->cursor)
    {
      int v10 = *((_DWORD *)a1 + 2);
      uint64_t v9 = (*((void *)a1 + 4) - *((void *)a1 + 6)) >> 2;
    }

    __int32 v12 = *v11;
    if (*v11 <= 33) {
      break;
    }
    if (v12 == 34)
    {
      int v17 = *((_DWORD *)a1 + 16);
      *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
      switch(v17)
      {
        case 0:
          goto LABEL_31;
        case 1:
          goto LABEL_27;
        case 2:
          goto LABEL_35;
        case 3:
LABEL_26:
          *((_DWORD *)a1 + 16) = 0;
          goto LABEL_27;
        case 4:
LABEL_25:
          *((_DWORD *)a1 + 16) = 2;
          goto LABEL_27;
        default:
          return -1;
      }
    }

    if (v12 != 92)
    {
      if (v12 == 39)
      {
        int v13 = *((_DWORD *)a1 + 16);
        *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
        switch(v13)
        {
          case 0:
            int v14 = 1;
            goto LABEL_33;
          case 1:
            goto LABEL_35;
          case 2:
            goto LABEL_27;
          case 3:
            goto LABEL_26;
          case 4:
            goto LABEL_25;
          default:
            return -1;
        }
      }

      goto LABEL_22;
    }

    int v18 = *((_DWORD *)a1 + 16);
    *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
    switch(v18)
    {
      case 0:
        int v14 = 3;
        break;
      case 1:
        goto LABEL_27;
      case 2:
        int v14 = 4;
        break;
      case 3:
        char v23 = (__int32 *)*((void *)a1 + 4);
        __int32 *v23 = *v11;
        *((void *)a1 + 4) = v23 + 1;
        goto LABEL_35;
      case 4:
        goto LABEL_25;
      default:
        return -1;
    }

LABEL_33:
    *((_DWORD *)a1 + 16) = v14;
LABEL_36:
    uint64_t v24 = *((void *)a1 + 5);
    if (*((void *)a1 + 4) >= (unint64_t)(v24 - 16))
    {
      unsigned int v25 = (void *)*((void *)a1 + 7);
      uint64_t v26 = ((v24 - (uint64_t)v25) >> 2) + 20;
      unsigned __int32 v27 = (char *)realloc(v25, 4 * v26);
      if (!v27) {
        return -1;
      }
      unint64_t v28 = (char *)*((void *)a1 + 7);
      if (v27 != v28)
      {
        uint64_t v29 = *((void *)a1 + 1);
        if (v29)
        {
          for (uint64_t i = 0LL; i != v29; ++i)
            *(void *)(*((void *)a1 + 3) + 8 * i) = &v27[*(void *)(*((void *)a1 + 3) + 8 * i)
                                                          - *((void *)a1 + 7)];
          unint64_t v28 = (char *)*((void *)a1 + 7);
        }

        *((void *)a1 + 4) = &v27[*((void *)a1 + 4) - (void)v28];
        *((void *)a1 + 6) = &v27[*((void *)a1 + 6) - (void)v28];
        *((void *)a1 + 7) = v27;
      }

      *((void *)a1 + 5) = &v27[4 * v26];
    }

    uint64_t v31 = *((void *)a1 + 2);
    if (*((void *)a1 + 1) >= (unint64_t)(v31 - 4))
    {
      uint64_t v32 = v31 + 10;
      *((void *)a1 + 2) = v32;
      uint64_t v33 = realloc(*((void **)a1 + 3), 8 * v32);
      if (!v33) {
        return -1;
      }
      *((void *)a1 + 3) = v33;
    }

    int buffer = v11 + 1;
  }

  if (!v12)
  {
    int result = *((_DWORD *)a1 + 16);
    switch(result)
    {
      case 0:
        int v36 = *((_DWORD *)a1 + 17);
        if ((v36 & 2) != 0)
        {
          *((_DWORD *)a1 + 17) = v36 & 0xFFFFFFFD;
          return 3;
        }

        else
        {
LABEL_53:
          if (v10 == -1)
          {
            unint64_t v38 = a4;
            int v37 = a3;
            uint64_t v40 = a5;
            int v39 = a6;
            if ((_DWORD)v9 == -1)
            {
              int v10 = *((_DWORD *)a1 + 2);
              uint64_t v9 = (*((void *)a1 + 4) - *((void *)a1 + 6)) >> 2;
            }
          }

          else
          {
            unint64_t v38 = a4;
            int v37 = a3;
            uint64_t v40 = a5;
            int v39 = a6;
          }

          if (v40) {
            *uint64_t v40 = v10;
          }
          if (v39) {
            int *v39 = v9;
          }
          sub_1879C5AC0((uint64_t)a1);
          int result = 0;
          _DWORD *v38 = (const __int32 **)*((void *)a1 + 3);
          *int v37 = *((void *)a1 + 1);
        }

        return result;
      case 1:
      case 2:
        return result;
      case 3:
        *((_DWORD *)a1 + 16) = 0;
        goto LABEL_29;
      case 4:
        *((_DWORD *)a1 + 16) = 2;
LABEL_29:
        unsigned int v22 = (_DWORD *)*((void *)a1 + 4);
        *unsigned int v22 = 0;
        *((void *)a1 + 4) = v22 + 1;
        break;
      default:
        return -1;
    }

    goto LABEL_36;
  }

  if (v12 != 10)
  {
LABEL_22:
    int v20 = *((_DWORD *)a1 + 16);
    *((_DWORD *)a1 + 17) &= ~2u;
    switch(v20)
    {
      case 0:
        sub_1879C5AC0((uint64_t)a1);
        break;
      case 1:
      case 2:
        goto LABEL_27;
      case 3:
        goto LABEL_26;
      case 4:
        int v34 = (_DWORD *)*((void *)a1 + 4);
        _DWORD *v34 = 92;
        *((_DWORD *)a1 + 16) = 2;
        __int32 v35 = *v11;
        *((void *)a1 + 4) = v34 + 2;
        v34[1] = v35;
        goto LABEL_36;
      default:
        return -1;
    }

    goto LABEL_36;
  }

  int v16 = *((_DWORD *)a1 + 16);
  int v15 = *((_DWORD *)a1 + 17);
  *((_DWORD *)a1 + 17) = v15 & 0xFFFFFFFD;
  switch(v16)
  {
    case 0:
      goto LABEL_53;
    case 1:
    case 2:
LABEL_27:
      uint64_t v21 = (__int32 *)*((void *)a1 + 4);
      __int32 *v21 = *v11;
      *((void *)a1 + 4) = v21 + 1;
      goto LABEL_36;
    case 3:
      *((_DWORD *)a1 + 17) = v15 | 2;
LABEL_35:
      *((_DWORD *)a1 + 16) = 0;
      goto LABEL_36;
    case 4:
      *((_DWORD *)a1 + 17) = v15 | 2;
LABEL_31:
      *((_DWORD *)a1 + 16) = 2;
      goto LABEL_36;
    default:
      int result = 0;
      break;
  }

  return result;
}

uint64_t sub_1879C5AC0(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)(result + 32);
  *uint64_t v1 = 0;
  int v2 = *(_DWORD *)(result + 68);
  uint64_t v3 = *(_DWORD **)(result + 48);
  if ((v2 & 1) != 0 || v1 != v3)
  {
    uint64_t v4 = *(void *)(result + 24);
    uint64_t v5 = *(void *)(result + 8);
    *(void *)(result + 8) = v5 + 1;
    *(void *)(v4 + 8 * v5) = v3;
    *(void *)(*(void *)(result + 24) + 8 * (v5 + 1)) = 0LL;
    uint64_t v6 = *(void *)(result + 32) + 4LL;
    *(void *)(result + 32) = v6;
    *(void *)(result + 48) = v6;
  }

  *(_DWORD *)(result + 68) = v2 & 0xFFFFFFFE;
  return result;
}

int tok_wstr(TokenizerW *a1, const __int32 *a2, int *a3, const __int32 ***a4)
{
  v8.int buffer = a2;
  v8.unint64_t cursor = wcschr(a2, 0);
  v8.lastchar = v8.cursor;
  return tok_wline(a1, &v8, a3, a4, 0LL, 0LL);
}

uint64_t sub_1879C5B78(uint64_t a1)
{
  uint64_t result = 0LL;
  *(_OWORD *)(a1 + 392) = *(_OWORD *)&off_18A0E9720;
  *(_OWORD *)(a1 + 408) = xmmword_18A0E9730;
  *(_OWORD *)(a1 + 424) = *(_OWORD *)&off_18A0E9740;
  *(_OWORD *)(a1 + 440) = xmmword_18A0E9750;
  *(_OWORD *)(a1 + 328) = *(_OWORD *)&off_18A0E96E0;
  *(_OWORD *)(a1 + 344) = xmmword_18A0E96F0;
  *(_OWORD *)(a1 + 360) = *(_OWORD *)&off_18A0E9700;
  *(_OWORD *)(a1 + 376) = xmmword_18A0E9710;
  *(_OWORD *)(a1 + 264) = *(_OWORD *)&off_18A0E96A0;
  *(_OWORD *)(a1 + 280) = xmmword_18A0E96B0;
  *(_OWORD *)(a1 + 296) = *(_OWORD *)&off_18A0E96C0;
  *(_OWORD *)(a1 + 312) = xmmword_18A0E96D0;
  *(_OWORD *)(a1 + 216) = xmmword_18A0E9670;
  *(_BYTE *)(a1 + 844) = -1;
  *(_OWORD *)(a1 + 232) = *(_OWORD *)&off_18A0E9680;
  *(_OWORD *)(a1 + 248) = xmmword_18A0E9690;
  *(_OWORD *)(a1 + 488) = xmmword_1879CB6B8;
  *(_OWORD *)(a1 + 504) = unk_1879CB6C8;
  *(_OWORD *)(a1 + 515) = unk_1879CB6D3;
  *(_DWORD *)(a1 + 840) = 0;
  *(_OWORD *)(a1 + 456) = xmmword_1879CB698;
  *(_OWORD *)(a1 + 472) = unk_1879CB6A8;
  if ((*(_BYTE *)(a1 + 44) & 4) == 0)
  {
    if (!isatty(*(_DWORD *)(a1 + 36))) {
      return 0xFFFFFFFFLL;
    }
    if (ioctl(*(_DWORD *)(a1 + 36), 0x40047477uLL, &v19) < 0)
    {
      int v3 = *__error();
      uint64_t result = 0xFFFFFFFFLL;
      if (v3 != 25) {
        return result;
      }
      int v19 = -1;
    }

    else if ((v19 & 0x80000000) == 0 && getpgrp() != v19)
    {
      return 0xFFFFFFFFLL;
    }

    uint64_t v4 = (__int128 *)(a1 + 536);
    uint64_t result = sub_1879C63FC(a1, (termios *)(a1 + 536));
    if ((_DWORD)result != -1)
    {
      __int128 v5 = *(_OWORD *)(a1 + 568);
      __int128 v6 = *(_OWORD *)(a1 + 584);
      *(_OWORD *)(a1 + 712) = v5;
      *(_OWORD *)(a1 + 728) = v6;
      uint64_t v7 = *(void *)(a1 + 600);
      *(void *)(a1 + 744) = v7;
      __int128 v9 = *v4;
      __int128 v8 = *(_OWORD *)(a1 + 552);
      *(_OWORD *)(a1 + 680) = *v4;
      *(_OWORD *)(a1 + 696) = v8;
      *(_OWORD *)(a1 + 640) = v5;
      *(_OWORD *)(a1 + 656) = v6;
      *(void *)(a1 + 672) = v7;
      *(_OWORD *)(a1 + 608) = v9;
      *(_OWORD *)(a1 + 624) = v8;
      *(_OWORD *)(a1 + 784) = v5;
      *(_OWORD *)(a1 + 800) = v6;
      *(_OWORD *)(a1 + 752) = v9;
      *(_OWORD *)(a1 + 768) = v8;
      *(void *)(a1 + 816) = v7;
      speed_t v10 = cfgetispeed((const termios *)(a1 + 608));
      if (!v10) {
        speed_t v10 = cfgetospeed((const termios *)(a1 + 608));
      }
      *(void *)(a1 + 832) = v10;
      uint64_t v11 = *(void *)(a1 + 616);
      *(_DWORD *)(a1 + 824) = (v11 & 4) == 0;
      uint64_t v12 = *(void *)(a1 + 624);
      *(_DWORD *)(a1 + 828) = (~*(_DWORD *)(a1 + 624) & 0x300LL) == 0;
      *(void *)(a1 + 608) = *(void *)(a1 + 608) & ~*(_DWORD *)(a1 + 228) | *(unsigned int *)(a1 + 224);
      *(void *)(a1 + 616) = v11 & ~*(_DWORD *)(a1 + 244) | (unint64_t)*(unsigned int *)(a1 + 240);
      *(void *)(a1 + 624) = v12 & ~*(_DWORD *)(a1 + 260) | (unint64_t)*(unsigned int *)(a1 + 256);
      *(void *)(a1 + 632) = *(void *)(a1 + 632) & ~*(_DWORD *)(a1 + 276) | *(unsigned int *)(a1 + 272);
      if ((*(_BYTE *)(a1 + 777) & 1) != 0)
      {
        sub_1879C6450((_BYTE *)(a1 + 752), (_BYTE *)(a1 + 506));
        for (uint64_t i = 0LL; i != 23; ++i)
        {
          uint64_t v14 = a1 + i;
          int v15 = *(unsigned __int8 *)(a1 + i + 506);
          int v16 = *(unsigned __int8 *)(a1 + 844);
        }

        for (uint64_t j = 0LL; j != 25; ++j)
        {
          int v18 = *(unsigned __int8 *)(a1 + j + 506);
        }
      }

      sub_1879C64E4((_BYTE *)(a1 + 608), (_BYTE *)(a1 + 456));
      uint64_t result = sub_1879C5EC0(a1, 1, (termios *)(a1 + 608));
      if ((_DWORD)result != -1)
      {
        *(void *)(a1 + 680) = *(void *)(a1 + 680) & ~*(_DWORD *)(a1 + 308) | *(unsigned int *)(a1 + 304);
        *(void *)(a1 + 688) = *(void *)(a1 + 688) & ~*(_DWORD *)(a1 + 324) | *(unsigned int *)(a1 + 320);
        *(void *)(a1 + 696) = *(void *)(a1 + 696) & ~*(_DWORD *)(a1 + 340) | *(unsigned int *)(a1 + 336);
        *(void *)(a1 + 704) = *(void *)(a1 + 704) & ~*(_DWORD *)(a1 + 356) | *(unsigned int *)(a1 + 352);
        sub_1879C64E4((_BYTE *)(a1 + 680), (_BYTE *)(a1 + 481));
        sub_1879C5F1C(a1, 1);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_1879C5EA4(uint64_t result)
{
  if ((*(_BYTE *)(result + 44) & 6) == 0) {
    return sub_1879C5EC0(result, 2, (termios *)(result + 536));
  }
  return result;
}

uint64_t sub_1879C5EC0(uint64_t a1, int a2, termios *a3)
{
  do
    uint64_t v6 = tcsetattr(*(_DWORD *)(a1 + 32), a2, a3);
  while ((_DWORD)v6 == -1 && *__error() == 4);
  return v6;
}

uint64_t sub_1879C5F1C(uint64_t result, int a2)
{
  uint64_t v3 = result;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v15[1] = 0;
  v16[1] = 0;
  uint64_t v4 = *(void *)(result + 1056);
  uint64_t v5 = *(void *)(result + 1048);
  if (*(_DWORD *)(result + 1096) == 1)
  {
    uint64_t v6 = (uint64_t *)(result + 1088);
    uint64_t v7 = *(void *)(result + 1080);
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v6 = (uint64_t *)(result + 1072);
  }

  uint64_t v8 = result + 712;
  uint64_t v9 = *v6;
  int v10 = 2;
  uint64_t v11 = &unk_1879CB6E4;
  do
  {
    int v12 = *(unsigned __int8 *)(v3 + 481 + v10);
    v16[0] = v12;
    int v13 = *(unsigned __int8 *)(v8 + *((int *)v11 + 1));
    v15[0] = v13;
    if (a2 || v12 != v13)
    {
      sub_1879BB6F4(v3, v4, v15);
      *(_BYTE *)(v4 + v15[0]) = *(_BYTE *)(v9 + v15[0]);
      uint64_t result = sub_1879BB6F4(v3, v4, v16);
      *(_BYTE *)(v4 + v16[0]) = v11[*(int *)(v3 + 1096) + 8];
      if (v7)
      {
        sub_1879BB6F4(v3, v5, v15);
        *(_BYTE *)(v5 + v15[0]) = *(_BYTE *)(v7 + v15[0]);
        uint64_t result = sub_1879BB6F4(v3, v5, v16);
        *(_BYTE *)(v5 + v16[0]) = v11[*(int *)(v3 + 1096) + 9];
      }
    }

    int v14 = *((_DWORD *)v11 + 3);
    v11 += 12;
    int v10 = v14;
  }

  while (v14 != -1);
  return result;
}

uint64_t sub_1879C6088(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(a1 + 752);
  uint64_t result = sub_1879C63FC(a1, (termios *)(a1 + 752));
  if ((_DWORD)result != -1)
  {
    *(_DWORD *)(a1 + 828) = (~*(_DWORD *)(a1 + 768) & 0x300LL) == 0;
    speed_t v4 = cfgetispeed((const termios *)(a1 + 752));
    if (!v4) {
      speed_t v4 = cfgetospeed((const termios *)(a1 + 752));
    }
    *(void *)(a1 + 832) = v4;
    speed_t v5 = cfgetispeed((const termios *)(a1 + 608));
    if (!v5) {
      speed_t v5 = cfgetospeed((const termios *)(a1 + 608));
    }
    speed_t v6 = *(void *)(a1 + 832);
    if (v5 != v6) {
      goto LABEL_14;
    }
    speed_t v7 = cfgetispeed((const termios *)(a1 + 680));
    if (!v7) {
      speed_t v7 = cfgetospeed((const termios *)(a1 + 680));
    }
    speed_t v6 = *(void *)(a1 + 832);
    if (v7 != v6)
    {
LABEL_14:
      cfsetispeed((termios *)(a1 + 608), v6);
      cfsetospeed((termios *)(a1 + 608), *(void *)(a1 + 832));
      cfsetispeed((termios *)(a1 + 680), *(void *)(a1 + 832));
      cfsetospeed((termios *)(a1 + 680), *(void *)(a1 + 832));
    }

    uint64_t v8 = *(void *)(a1 + 776);
    if ((v8 & 0x100) != 0)
    {
      uint64_t v9 = *(void *)(a1 + 768);
      if (v9 != *(void *)(a1 + 624))
      {
        *(void *)(a1 + 624) = v9 & ~*(_DWORD *)(a1 + 260) | (unint64_t)*(unsigned int *)(a1 + 256);
        *(void *)(a1 + 696) = v9 & ~*(_DWORD *)(a1 + 340) | (unint64_t)*(unsigned int *)(a1 + 336);
      }

      if (v8 != *(void *)(a1 + 632) && v8 != *(void *)(a1 + 704))
      {
        *(void *)(a1 + 632) = v8 & ~*(_DWORD *)(a1 + 276) | (unint64_t)*(unsigned int *)(a1 + 272);
        *(void *)(a1 + 704) = v8 & ~*(_DWORD *)(a1 + 356) | (unint64_t)*(unsigned int *)(a1 + 352);
      }

      uint64_t v10 = *v3;
      if (*v3 != *(void *)(a1 + 608) && v10 != *(void *)(a1 + 680))
      {
        *(void *)(a1 + 608) = v10 & ~*(_DWORD *)(a1 + 228) | (unint64_t)*(unsigned int *)(a1 + 224);
        *(void *)(a1 + 680) = v10 & ~*(_DWORD *)(a1 + 308) | (unint64_t)*(unsigned int *)(a1 + 304);
      }

      uint64_t v11 = *(void *)(a1 + 760);
      LOBYTE(v12) = v11;
      if (v11 != *(void *)(a1 + 616))
      {
        unint64_t v12 = *(void *)(a1 + 616);
        if (v11 != *(void *)(a1 + 688))
        {
          unint64_t v12 = v11 & ~*(_DWORD *)(a1 + 244) | (unint64_t)*(unsigned int *)(a1 + 240);
          *(void *)(a1 + 616) = v12;
          *(void *)(a1 + 688) = v11 & ~*(_DWORD *)(a1 + 324) | (unint64_t)*(unsigned int *)(a1 + 320);
        }
      }

      if ((v12 & 4) != 0) {
        int v13 = 0;
      }
      else {
        int v13 = (*(_DWORD *)(a1 + 160) >> 3) & 1;
      }
      *(_DWORD *)(a1 + 824) = v13;
      sub_1879C6450((_BYTE *)(a1 + 752), (_BYTE *)(a1 + 506));
      uint64_t v14 = 0LL;
      while (*(unsigned __int8 *)(a1 + v14 + 506) == *(unsigned __int8 *)(a1 + v14 + 456))
      {
        if (++v14 == 25) {
          goto LABEL_49;
        }
      }

      uint64_t v15 = 0LL;
      int v16 = *(_DWORD *)(a1 + 368);
      int v17 = *(_DWORD *)(a1 + 372);
      do
      {
        if ((v16 & (1 << v15)) == 0)
        {
          int v18 = *(unsigned __int8 *)(a1 + v15 + 506);
        }

        if ((v17 & (1 << v15)) != 0) {
          *(_BYTE *)(a1 + v15 + 48longjmp(dword_18C6E51CC, 1) = *(_BYTE *)(a1 + 844);
        }
        ++v15;
      }

      while (v15 != 25);
      sub_1879C5F1C(a1, 0);
      sub_1879C64E4((_BYTE *)(a1 + 680), (_BYTE *)(a1 + 481));
      uint64_t v19 = 0LL;
      int v20 = *(_DWORD *)(a1 + 288);
      int v21 = *(_DWORD *)(a1 + 292);
      do
      {
        if ((v20 & (1 << v19)) == 0)
        {
          int v22 = *(unsigned __int8 *)(a1 + v19 + 506);
        }

        if ((v21 & (1 << v19)) != 0) {
          *(_BYTE *)(a1 + v19 + 456) = *(_BYTE *)(a1 + 844);
        }
        ++v19;
      }

      while (v19 != 25);
      sub_1879C64E4((_BYTE *)(a1 + 608), (_BYTE *)(a1 + 456));
    }

uint64_t sub_1879C63FC(uint64_t a1, termios *a2)
{
  do
    uint64_t v4 = tcgetattr(*(_DWORD *)(a1 + 32), a2);
  while ((_DWORD)v4 == -1 && *__error() == 4);
  return v4;
}

_BYTE *sub_1879C6450(_BYTE *result, _BYTE *a2)
{
  *a2 = result[40];
  a2[1] = result[41];
  a2[2] = result[35];
  a2[3] = result[37];
  a2[4] = result[32];
  a2[5] = result[33];
  a2[6] = result[34];
  a2[10] = result[44];
  a2[11] = result[45];
  a2[12] = result[36];
  a2[13] = result[42];
  a2[14] = result[43];
  a2[15] = result[38];
  a2[16] = result[47];
  a2[17] = result[46];
  a2[18] = result[50];
  a2[23] = result[48];
  a2[24] = result[49];
  return result;
}

_BYTE *sub_1879C64E4(_BYTE *result, _BYTE *a2)
{
  result[40] = *a2;
  result[41] = a2[1];
  result[35] = a2[2];
  result[37] = a2[3];
  result[32] = a2[4];
  result[33] = a2[5];
  result[34] = a2[6];
  result[44] = a2[10];
  result[45] = a2[11];
  result[36] = a2[12];
  result[42] = a2[13];
  result[43] = a2[14];
  result[38] = a2[15];
  result[47] = a2[16];
  result[46] = a2[17];
  result[50] = a2[18];
  result[48] = a2[23];
  result[49] = a2[24];
  return result;
}

uint64_t sub_1879C6578(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 840) || (*(_BYTE *)(a1 + 44) & 6) != 0) {
    return 0LL;
  }
  uint64_t result = sub_1879C5EC0(a1, 1, (termios *)(a1 + 608));
  if ((_DWORD)result != -1)
  {
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 840) = 0;
  }

  return result;
}

uint64_t sub_1879C65D0(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 840) == 2 || (*(_BYTE *)(a1 + 44) & 6) != 0) {
    return 0LL;
  }
  *(void *)(a1 + 816) = *(void *)(a1 + 744);
  __int128 v3 = *(_OWORD *)(a1 + 696);
  *(_OWORD *)(a1 + 752) = *(_OWORD *)(a1 + 680);
  *(_OWORD *)(a1 + 768) = v3;
  __int128 v4 = *(_OWORD *)(a1 + 728);
  *(_OWORD *)(a1 + 784) = *(_OWORD *)(a1 + 712);
  *(_OWORD *)(a1 + 800) = v4;
  *(void *)(a1 + 752) = *(void *)(a1 + 752) & ~*(_DWORD *)(a1 + 388) | *(unsigned int *)(a1 + 384);
  *(void *)(a1 + 760) = *(void *)(a1 + 760) & ~*(_DWORD *)(a1 + 404) | *(unsigned int *)(a1 + 400);
  *(void *)(a1 + 768) = *(void *)(a1 + 768) & ~*(_DWORD *)(a1 + 420) | *(unsigned int *)(a1 + 416);
  *(void *)(a1 + 776) = *(void *)(a1 + 776) & ~*(_DWORD *)(a1 + 436) | *(unsigned int *)(a1 + 432);
  uint64_t result = sub_1879C5EC0(a1, 1, (termios *)(a1 + 752));
  if ((_DWORD)result != -1)
  {
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 840) = 2;
  }

  return result;
}

uint64_t sub_1879C66BC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 840) != 2 || (*(_BYTE *)(a1 + 44) & 6) != 0) {
    return 0LL;
  }
  uint64_t result = sub_1879C5EC0(a1, 1, (termios *)(a1 + 680));
  if ((_DWORD)result != -1)
  {
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 840) = 1;
  }

  return result;
}

uint64_t sub_1879C671C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)(a1 + 44) & 6) != 0) {
    return 0LL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v47 = a1 + 216;
  speed_t v6 = sub_1879C7D54(*(unsigned __int32 **)a3, a1 + 1264);
  strncpy(__dst, (const char *)v6, 0x400uLL);
  __dst[1023] = 0;
  uint64_t v9 = *(int **)(a3 + 8);
  speed_t v7 = (__int32 **)(a3 + 8);
  uint64_t v8 = v9;
  if (!v9)
  {
    int v11 = 0;
    unsigned int v10 = 0;
LABEL_52:
    size_t v28 = 0LL;
    size_t v29 = 0LL;
    int v30 = -1;
    uint64_t v31 = "ignbrk";
    uint64_t v32 = &off_18A0E9770;
    do
    {
      int v33 = *((_DWORD *)v32 - 1);
      if (v33 != v30)
      {
        int v34 = (const char *)&unk_1879D0D1A;
        if (v30 != -1) {
          int v34 = "\n";
        }
        uint64_t v35 = v47 + 80LL * v10;
        fprintf(*(FILE **)(a1 + 16), "%s%s", v34, *(const char **)(v35 + 16LL * v33));
        size_t v29 = strlen(*(const char **)(v35 + 16LL * v33));
        int v30 = v33;
        size_t v28 = v29;
      }

      if (v30 == -1)
      {
        int v41 = 0;
      }

      else
      {
        uint64_t v36 = v47 + 80LL * v10 + 16LL * v30;
        int v37 = *((_DWORD *)v32 - 2);
        int v39 = *(_DWORD *)(v36 + 8);
        int v38 = *(_DWORD *)(v36 + 12);
        if ((v37 & v39) != 0) {
          int v40 = 43;
        }
        else {
          int v40 = 0;
        }
        if ((v38 & v37) != 0) {
          int v41 = 45;
        }
        else {
          int v41 = v40;
        }
      }

      if (v41 | v11)
      {
        size_t v42 = strlen(v31);
        uint64_t v43 = 1LL;
        if (v41) {
          uint64_t v43 = 2LL;
        }
        size_t v44 = v43 + v42;
        v29 += v43 + v42;
        if (v29 >= *(int *)(a1 + 152))
        {
          fprintf(*(FILE **)(a1 + 16), "\n%*s", v28, (const char *)&unk_1879D0D1A);
          size_t v29 = v44 + v28;
        }

        uint64_t v45 = *(FILE **)(a1 + 16);
        if (v41) {
          fprintf(v45, "%c%s ");
        }
        else {
          fprintf(v45, "%s ");
        }
      }

      int v46 = *v32;
      v32 += 2;
      uint64_t v31 = v46;
    }

    while (v46);
    fputc(10, *(FILE **)(a1 + 16));
    return 0LL;
  }

  unsigned int v10 = 0;
  int v11 = 0;
  unint64_t v12 = (termios *)(a1 + 608);
  while (*v8 == 45 && !v8[2])
  {
    int v13 = v8[1];
    if (v13 > 112)
    {
      if (v13 == 113)
      {
        unsigned int v10 = 2;
        unint64_t v12 = (termios *)(a1 + 752);
      }

      else
      {
        if (v13 != 120)
        {
LABEL_75:
          return 0xFFFFFFFFLL;
        }

        unsigned int v10 = 0;
        unint64_t v12 = (termios *)(a1 + 608);
      }
    }

    else if (v13 == 97)
    {
      ++v11;
    }

    else
    {
      if (v13 != 100) {
        goto LABEL_75;
      }
      unsigned int v10 = 1;
      unint64_t v12 = (termios *)(a1 + 680);
    }

    uint64_t v14 = v7[1];
    ++v7;
    uint64_t v8 = v14;
    if (!v14) {
      goto LABEL_52;
    }
  }

  uint64_t v15 = "ignbrk";
  int v16 = &dword_18A0E9768;
  while (2)
  {
    int v17 = *v8;
    if (*v8 == 45 || v17 == 43) {
      ++v8;
    }
    else {
      LOBYTE(v17) = 0;
    }
    ++v7;
    int v18 = wcschr(v8, 61);
    unint64_t v48 = v18;
    while (1)
    {
      uint64_t v19 = sub_1879C7D54((unsigned __int32 *)v8, a1 + 1264);
      if (v18)
      {
      }

      else if (strcmp(v15, (const char *)v19))
      {
        goto LABEL_31;
      }

      if (!v48)
      {
        if (v17 == 45)
        {
          uint64_t v26 = v47 + 80LL * v10 + 16LL * v16[1];
          int v27 = *(_DWORD *)(v26 + 12) | *v16;
          *(_DWORD *)(v26 + 8) &= ~*v16;
          *(_DWORD *)(v26 + 12) = v27;
          uint64_t v15 = "ignbrk";
        }

        else
        {
          uint64_t v15 = "ignbrk";
          int v20 = (int8x8_t *)(v47 + 80LL * v10 + 16LL * v16[1]);
          if ((char)v17 == 43)
          {
            int v21 = v20[1].i32[1] & ~*v16;
            v20[1].i32[0] |= *v16;
            v20[1].i32[1] = v21;
          }

          else
          {
            v20[1] = vand_s8(v20[1], (int8x8_t)vdup_n_s32(~*v16));
          }
        }

        goto LABEL_45;
      }

      if (v16[1] == 4) {
        break;
      }
LABEL_31:
      uint64_t v15 = (const char *)*((void *)v16 + 1);
      if (!v15)
      {
        return 0xFFFFFFFFLL;
      }

      int v18 = v48;
      v16 += 4;
    }

    unsigned int v22 = *v16;
    __int32 v23 = v48[1];
    ++v48;
    if (v23) {
      cc_t v24 = sub_1879BCAFC(&v48);
    }
    else {
      cc_t v24 = *(_BYTE *)(a1 + 844);
    }
    uint64_t v15 = "ignbrk";
    if (!v22) {
      sub_1879CA1F8();
    }
    unsigned int v25 = __clz(__rbit32(v22));
    if (v25 >= 0x19 || ((0x187FC7Fu >> v25) & 1) == 0) {
      sub_1879CA220();
    }
    v12->c_cc[qword_1879CB738[v25]] = v24;
LABEL_45:
    int v16 = &dword_18A0E9768;
    uint64_t v8 = *v7;
    if (*v7) {
      continue;
    }
    break;
  }

  if (*(_DWORD *)(a1 + 840) != v10) {
    return 0LL;
  }
  uint64_t result = sub_1879C5EC0(a1, 1, v12);
  if ((_DWORD)result != -1) {
    return 0LL;
  }
  return result;
}

uint64_t sub_1879C6BFC(uint64_t a1)
{
  return sub_1879C6C04(a1, 0);
}

uint64_t sub_1879C6C04(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 944);
  uint64_t v3 = *(void *)(a1 + 936);
  if (v3) {
    BOOL v4 = v2 == v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 6LL;
  }
  size_t v7 = v2 - v3;
  uint64_t v8 = (v2 - v3) >> 2;
  sub_1879B5FDC(a1);
  if (!a2)
  {
    unint64_t v9 = *(void *)(a1 + 96);
    if (v9 < *(void *)(a1 + 104)) {
      *(void *)(a1 + 96) = v9 + 4;
    }
  }

  sub_1879B6088(a1, v7 >> 2);
  unsigned int v10 = *(void **)(a1 + 96);
  memcpy(v10, *(const void **)(a1 + 936), v7);
  return 4LL;
}

uint64_t sub_1879C6C98(uint64_t a1)
{
  return sub_1879C6C04(a1, 1);
}

uint64_t sub_1879C6CA0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 == v3) {
    return 6LL;
  }
  *(void *)(a1 + 96) = sub_1879B6744(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_1879B6530);
  if (!*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879C6D04(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 == v3) {
    return 6LL;
  }
  *(void *)(a1 + 96) = sub_1879B6744(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_1879B64AC);
  if (!*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879C6D68(uint64_t a1)
{
  uint64_t v1 = *(unsigned int **)(a1 + 96);
  unint64_t v2 = *(void *)(a1 + 104);
  *(void *)(a1 + 96) = sub_1879B6664(a1, v1, v2, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_1879B6530);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879C6DD8(uint64_t a1)
{
  uint64_t v1 = *(unsigned int **)(a1 + 96);
  unint64_t v2 = *(void *)(a1 + 104);
  *(void *)(a1 + 96) = sub_1879B6664(a1, v1, v2, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_1879B64AC);
  if (*(_DWORD *)(a1 + 1096) != 1 || !*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879C6E48(uint64_t a1)
{
  if (*(void *)(a1 + 96) >= *(void *)(a1 + 104)) {
    return 6LL;
  }
  sub_1879B5FDC(a1);
  int v2 = 0;
  uint64_t v3 = MEMORY[0x1895F8770];
  while (1)
  {
    BOOL v4 = *(__darwin_ct_rune_t **)(a1 + 96);
    uint64_t v5 = *v4;
    if (v5 > 0x7F)
    {
      if (__maskrune(*v4, 0x8000uLL))
      {
LABEL_9:
        __darwin_ct_rune_t v7 = __tolower(v5);
        goto LABEL_10;
      }

      if (__maskrune(v5, 0x1000uLL)) {
        goto LABEL_7;
      }
    }

    else
    {
      int v6 = *(_DWORD *)(v3 + 4 * v5 + 60);
      if ((v6 & 0x8000) != 0) {
        goto LABEL_9;
      }
      if ((v6 & 0x1000) != 0)
      {
LABEL_7:
        __darwin_ct_rune_t v7 = __toupper(v5);
LABEL_10:
        uint64_t v8 = *(__darwin_ct_rune_t **)(a1 + 96);
        *uint64_t v8 = v7;
        goto LABEL_11;
      }
    }

    uint64_t v8 = *(__darwin_ct_rune_t **)(a1 + 96);
LABEL_11:
    *(void *)(a1 + 96) = v8 + 1;
    sub_1879C1E08(a1);
    if (++v2 >= *(_DWORD *)(a1 + 128)) {
      return 0LL;
    }
  }

  *(void *)(a1 + 96) = v8;
  sub_1879C1E08(a1);
  return 0LL;
}

uint64_t sub_1879C6F44(uint64_t a1)
{
  return sub_1879C6F4C(a1, 3);
}

uint64_t sub_1879C6F4C(uint64_t a1, int a2)
{
  char v2 = a2;
  int v4 = *(_DWORD *)(a1 + 1000);
  if (v4)
  {
    if (v4 == a2)
    {
      if ((a2 & 4) == 0) {
        sub_1879B5FDC(a1);
      }
      sub_1879B6050(a1, *(const void **)(a1 + 88), (*(void *)(a1 + 104) - *(void *)(a1 + 88)) >> 2);
      *(_DWORD *)(a1 + 1000) = 0;
      *(void *)(a1 + 1008) = 0LL;
      if ((v2 & 4) == 0)
      {
        uint64_t v5 = *(void *)(a1 + 88);
        *(void *)(a1 + 96) = v5;
        *(void *)(a1 + 104) = v5;
      }

      if ((v2 & 2) != 0) {
        *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
      }
      return 4LL;
    }

    else
    {
      return 6LL;
    }
  }

  else
  {
    *(void *)(a1 + 1008) = *(void *)(a1 + 96);
    *(_DWORD *)(a1 + 1000) = a2;
    return 3LL;
  }

uint64_t sub_1879C6FE0(void *a1)
{
  a1[12] = a1[11];
  sub_1879B5FDC((uint64_t)a1);
  a1[133] = a1[132];
  return 5LL;
}

uint64_t sub_1879C7014(uint64_t a1)
{
  if (*(void *)(a1 + 96) >= *(void *)(a1 + 104)) {
    return 6LL;
  }
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  *(_DWORD *)(a1 + 1el_set((EditLine *)qword_18C6E51B8, 20) = 2;
  sub_1879B5FDC(a1);
  return 3LL;
}

uint64_t sub_1879C7050(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  *(_DWORD *)(a1 + 1el_set((EditLine *)qword_18C6E51B8, 20) = 1;
  sub_1879B5FDC(a1);
  return 0LL;
}

uint64_t sub_1879C7078(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  return 4LL;
}

uint64_t sub_1879C70A8(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  return 4LL;
}

uint64_t sub_1879C70F8(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  return 4LL;
}

uint64_t sub_1879C7144(uint64_t a1)
{
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  sub_1879B5FDC(a1);
  return 0LL;
}

uint64_t sub_1879C7164(void *a1)
{
  a1[133] = a1[132];
  unint64_t v2 = a1[12];
  unint64_t v1 = a1[13];
  if (v2 >= v1)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    unint64_t v3 = v2 + 4;
    if (v3 <= v1) {
      unint64_t v1 = v3;
    }
    a1[12] = v1;
    uint64_t v4 = 5LL;
  }

  sub_1879B5FDC((uint64_t)a1);
  return v4;
}

uint64_t sub_1879C71B4(void *a1)
{
  a1[133] = a1[132];
  a1[12] = a1[13];
  sub_1879B5FDC((uint64_t)a1);
  return 5LL;
}

uint64_t sub_1879C71DC(uint64_t a1)
{
  return sub_1879C6F4C(a1, 1);
}

uint64_t sub_1879C71E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  if (v2 == v3) {
    return 6LL;
  }
  uint64_t v4 = sub_1879B68B8(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_1879B6530);
  *(void *)(a1 + 96) = v4;
  if (!*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  *(void *)(a1 + 96) = v4 + 1;
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879C7250(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v3 = *(void *)(a1 + 104);
  if (v2 == v3) {
    return 6LL;
  }
  uint64_t v4 = sub_1879B68B8(v2, v3, *(_DWORD *)(a1 + 128), (uint64_t (*)(void))sub_1879B64AC);
  *(void *)(a1 + 96) = v4;
  if (!*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  *(void *)(a1 + 96) = v4 + 1;
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879C72BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 912);
  if (v1 == -1) {
    return 6LL;
  }
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 112);
  *(void *)(a1 + 912) = (*(void *)(a1 + 104) - v2) >> 2;
  uint64_t v5 = *(int *)(a1 + 920);
  *(_DWORD *)(a1 + 9el_set((EditLine *)qword_18C6E51B8, 20) = (unint64_t)(v3 - v2) >> 2;
  uint64_t v6 = *(void *)(a1 + 928);
  *(void *)(a1 + 928) = v2;
  *(void *)(a1 + 88) = v6;
  *(void *)(a1 + 96) = v6 + 4 * v5;
  *(void *)(a1 + 104) = v6 + 4 * v1;
  *(void *)(a1 + 112) = v6 + v4 - v2;
  return 4LL;
}

uint64_t sub_1879C731C(uint64_t a1)
{
  *(_DWORD *)(a1 + 1000) = 0;
  *(void *)(a1 + 1008) = 0LL;
  *(void *)(a1 + 1el_set((EditLine *)qword_18C6E51B8, 20) = 0LL;
  *(void *)(a1 + 1064) = *(void *)(a1 + 1048);
  unint64_t v1 = *(void *)(a1 + 96);
  if (v1 > *(void *)(a1 + 88)) {
    *(void *)(a1 + 96) = v1 - 4;
  }
  return 5LL;
}

uint64_t sub_1879C734C(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 124)) {
    return sub_1879B741C(a1, a2);
  }
  *(void *)(a1 + 96) = *(void *)(a1 + 88);
  if (!*(_DWORD *)(a1 + 1000)) {
    return 5LL;
  }
  sub_1879B6804(a1);
  return 4LL;
}

uint64_t sub_1879C738C(uint64_t a1)
{
  if (*(void *)(a1 + 96) <= *(void *)(a1 + 88)) {
    return 6LL;
  }
  sub_1879B6408(a1);
  *(void *)(a1 + 96) -= 4LL;
  return 4LL;
}

uint64_t sub_1879C73D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (v2 == *(void *)(a1 + 104) && v2 == *(void *)(a1 + 88))
  {
    sub_1879C4B78(a1, a2);
    return 2LL;
  }

  else
  {
    el_beep_0((EditLine *)a1);
    return 6LL;
  }

uint64_t sub_1879C740C(void *a1)
{
  uint64_t v2 = (_DWORD *)a1[117];
  unint64_t v3 = a1[11];
  unint64_t v4 = a1[12];
  if (v3 < v4)
  {
    uint64_t v5 = (int *)a1[11];
    do
    {
      int v6 = *v5++;
      *v2++ = v6;
    }

    while ((unint64_t)v5 < v4);
  }

  a1[118] = v2;
  sub_1879B6358(a1, (v4 - v3) >> 2);
  a1[12] = a1[11];
  return 4LL;
}

uint64_t sub_1879C746C(uint64_t a1)
{
  return sub_1879C2A08(a1, 23LL);
}

uint64_t sub_1879C7474(uint64_t a1)
{
  return sub_1879C2A08(a1, 22LL);
}

uint64_t sub_1879C747C(size_t a1)
{
  if (*(void *)(a1 + 1224)) {
    return sub_1879C2BC4(a1, *(_DWORD *)(a1 + 1232));
  }
  else {
    return 6LL;
  }
}

uint64_t sub_1879C7494(size_t a1)
{
  if (!*(void *)(a1 + 1224)) {
    return 6LL;
  }
  if (*(_DWORD *)(a1 + 1232) == 23) {
    int v1 = 22;
  }
  else {
    int v1 = 23;
  }
  return sub_1879C2BC4(a1, v1);
}

uint64_t sub_1879C74B8(uint64_t a1)
{
  return sub_1879C2BF8((EditLine *)a1, 1, -1, *(_DWORD *)(a1 + 128), 0);
}

uint64_t sub_1879C74CC(uint64_t a1)
{
  return sub_1879C2BF8((EditLine *)a1, -1, -1, *(_DWORD *)(a1 + 128), 0);
}

uint64_t sub_1879C74E0(uint64_t a1)
{
  return sub_1879C2BF8((EditLine *)a1, 1, -1, *(_DWORD *)(a1 + 128), 1);
}

uint64_t sub_1879C74F4(uint64_t a1)
{
  return sub_1879C2BF8((EditLine *)a1, -1, -1, *(_DWORD *)(a1 + 128), 1);
}

uint64_t sub_1879C7508(uint64_t a1)
{
  return sub_1879C2BF8( (EditLine *)a1,  *(_DWORD *)(a1 + 1236),  *(_DWORD *)(a1 + 1240),  *(_DWORD *)(a1 + 128),  *(char *)(a1 + 1244));
}

uint64_t sub_1879C751C(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1236);
  uint64_t result = sub_1879C2BF8((EditLine *)a1, -v2, *(_DWORD *)(a1 + 1240), *(_DWORD *)(a1 + 128), *(char *)(a1 + 1244));
  *(_DWORD *)(a1 + 1236) = v2;
  return result;
}

uint64_t sub_1879C7554(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  *(_OWORD *)int v16 = xmmword_1879CB800;
  *(_OWORD *)&v16[3] = *(__int128 *)((char *)&xmmword_1879CB800 + 12);
  **(_DWORD **)(a1 + 104) = 0;
  size_t v2 = wcscspn(*(const __int32 **)(a1 + 96), v16);
  __int32 v3 = *(_DWORD *)(*(void *)(a1 + 96) + 4 * v2);
  if (v3)
  {
    size_t v4 = v2;
    uint64_t v5 = wcschr(v16, v3);
    uint64_t v6 = *(void *)(a1 + 96) + 4 * v4 + 4;
    uint64_t v7 = ((unint64_t)((char *)v5 - (char *)v16) >> 2) & 1;
    uint64_t v8 = 4 - 8 * v7;
    uint64_t v9 = -8 * v7;
    uint64_t v10 = 1LL;
    while (1)
    {
      int v11 = (int *)(v6 + v9);
      int v12 = *v11;
      else {
        uint64_t v13 = 0LL;
      }
      if (v12 == v3) {
        uint64_t v14 = 1LL;
      }
      else {
        uint64_t v14 = v13;
      }
      v6 += v8;
      v10 += v14;
      if (!v10)
      {
        *(void *)(a1 + 96) = v6 - 4;
        if (!*(_DWORD *)(a1 + 1000)) {
          return 5LL;
        }
        *(void *)(a1 + 96) = v6;
        sub_1879B6804(a1);
        return 4LL;
      }
    }
  }

  return 6LL;
}

uint64_t sub_1879C7694(uint64_t a1)
{
  return sub_1879B9DF0(a1);
}

uint64_t sub_1879C76B8(uint64_t a1)
{
  *(void *)(a1 + 96) = *(void *)(a1 + 88);
  --*(_DWORD *)(a1 + 128);
  return sub_1879B71C4(a1);
}

uint64_t sub_1879C76D4(uint64_t a1)
{
  return 4LL;
}

uint64_t sub_1879C76F8(uint64_t a1)
{
  return sub_1879C6F4C(a1, 4);
}

uint64_t sub_1879C7700(uint64_t a1)
{
  *(void *)(a1 + 96) = *(void *)(a1 + 88);
  sub_1879B6088(a1, 1);
  **(_DWORD **)(a1 + 96) = 35;
  sub_1879C0FDC(a1);
  return sub_1879B74C4(a1);
}

uint64_t sub_1879C7748()
{
  return 6LL;
}

uint64_t sub_1879C7750(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1176);
  if (!v2)
  {
    wcsncpy(*(__int32 **)(a1 + 1152), *(const __int32 **)(a1 + 88), 0x400uLL);
    *(void *)(a1 + 1168) = *(void *)(a1 + 1152) + *(void *)(a1 + 104) - *(void *)(a1 + 88);
  }

  if (!*(_DWORD *)(a1 + 124))
  {
    *(_DWORD *)(a1 + 1176) = 0x7FFFFFFF;
    sub_1879B9DF0(a1);
    goto LABEL_8;
  }

  *(_DWORD *)(a1 + 1176) = 1;
  uint64_t result = sub_1879B9DF0(a1);
  if ((_DWORD)result == 6) {
    return result;
  }
  int v4 = *(_DWORD *)(a1 + 1200) - *(_DWORD *)(a1 + 128) + 1;
  *(_DWORD *)(a1 + 1176) = v4;
  if (v4 >= 0)
  {
LABEL_8:
    uint64_t result = sub_1879B9DF0(a1);
    if ((_DWORD)result != 6) {
      return result;
    }
  }

  *(_DWORD *)(a1 + 1176) = v2;
  return 6LL;
}

uint64_t sub_1879C7800(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  strcpy(v19, "/tmp/histedit.XXXXXXXXXX");
  if (*(_DWORD *)(a1 + 124))
  {
    uint64_t result = sub_1879C7750(a1);
    if ((_DWORD)result == 6) {
      return result;
    }
  }

  int v3 = mkstemp(v19);
  if (v3 < 0) {
    return 6LL;
  }
  int v4 = v3;
  uint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = *(const __int32 **)(a1 + 88);
  uint64_t v7 = malloc(0x1800uLL);
  if (!v7)
  {
    uint64_t v10 = 0LL;
LABEL_15:
    free(v10);
    free(v7);
    close(v4);
    unlink(v19);
    return 6LL;
  }

  uint64_t v8 = v5 - (void)v6;
  uint64_t v9 = (__int32 *)malloc(v5 - (void)v6 + 1);
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_15;
  }
  size_t v11 = v8 >> 2;
  wcsncpy(v9, v6, v11);
  v10[v11] = 0;
  wcstombs(v7, v10, 0x17FFuLL);
  v7[6143] = 0;
  size_t v12 = strlen(v7);
  write(v4, v7, v12);
  write(v4, "\n", 1uLL);
  pid_t v13 = fork();
  if (v13 == -1) {
    goto LABEL_15;
  }
  pid_t v14 = v13;
  if (!v13)
  {
    close(v4);
    execlp("vi", "vi", v19, 0LL);
    exit(0);
  }

  while (waitpid(v14, &v18, 0) != v14)
    ;
  lseek(v4, 0LL, 0);
  ssize_t v15 = read(v4, v7, 0x1800uLL);
  int v16 = *(__int32 **)(a1 + 88);
  if (v15 < 1)
  {
    size_t v17 = 0LL;
  }

  else
  {
    size_t v17 = mbstowcs(v16, v7, (uint64_t)(*(void *)(a1 + 104) - (void)v16) >> 2);
    int v16 = *(__int32 **)(a1 + 88);
    if (v17)
    {
      if (v16[v17 - 1] == 10) {
        --v17;
      }
    }
  }

  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = &v16[v17];
  free(v7);
  free(v10);
  close(v4);
  unlink(v19);
  return sub_1879B74C4(a1);
}

uint64_t sub_1879C7A44(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 44) & 0x40) != 0)
  {
    int v2 = sub_1879B9FB4(a1, 3LL);
    if (!v2) {
      return 6LL;
    }
  }

  else
  {
    int v2 = *(__int32 **)(a1 + 1208);
    if (!v2) {
      return 6LL;
    }
  }

  int v3 = 0LL;
  int v4 = 0LL;
  uint64_t v5 = MEMORY[0x1895F8770];
  while (1)
  {
    uint64_t v6 = v4;
    int v4 = (unsigned int *)(v2 - 1);
    do
    {
      uint64_t v7 = v2;
      uint64_t v8 = v4[1];
      else {
        int v9 = *(_DWORD *)(v5 + 4 * v8 + 60) & 0x4000;
      }
      int v2 = v7 + 1;
      ++v4;
    }

    while (v9);
    unsigned int v10 = *v4;
    if (!*v4)
    {
LABEL_22:
      if (!v6) {
        return 6LL;
      }
      goto LABEL_23;
    }

    int v3 = (__int32 *)v4;
    do
    {
      if (v10 > 0x7F)
      {
        if (__maskrune(v10, 0x4000uLL)) {
          break;
        }
      }

      else if ((*(_DWORD *)(v5 + 4LL * v10 + 60) & 0x4000) != 0)
      {
        break;
      }

      unsigned int v11 = v3[1];
      ++v3;
      unsigned int v10 = v11;
    }

    while (v11);
    if (*(_DWORD *)(a1 + 124))
    {
      int v12 = *(_DWORD *)(a1 + 128);
      *(_DWORD *)(a1 + 128) = v12 - 1;
      if (v12 < 2) {
        break;
      }
    }

    int v2 = v3;
    uint64_t v6 = v4;
    if (!*v3) {
      goto LABEL_22;
    }
  }

  uint64_t v6 = (unsigned int *)v7;
  if (!v7) {
    return 6LL;
  }
LABEL_23:
  if (*(_DWORD *)(a1 + 124) && *(_DWORD *)(a1 + 128)) {
    return 6LL;
  }
  sub_1879B5FDC(a1);
  unint64_t v13 = *(void *)(a1 + 96);
  if (v13 < *(void *)(a1 + 104)) {
    *(void *)(a1 + 96) = v13 + 4;
  }
  sub_1879B6088(a1, ((unint64_t)((char *)v3 - (char *)v6) >> 2) + 1);
  pid_t v14 = *(_DWORD **)(a1 + 96);
  unint64_t v15 = *(void *)(a1 + 112);
  if (v6 < (unsigned int *)v3 && (unint64_t)v14 < v15)
  {
    unint64_t v16 = (unint64_t)(v6 + 1);
    do
    {
      *v14++ = *(_DWORD *)(v16 - 4);
      v16 += 4LL;
    }

    while ((unint64_t)v14 < v15);
  }

  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 1064) = *(void *)(a1 + 1056);
  return 4LL;
}

uint64_t sub_1879C7C24(EditLine *a1)
{
  if (!*((_DWORD *)a1 + 31))
  {
    int v2 = *((_DWORD *)a1 + 248);
    if (v2)
    {
      *((_DWORD *)a1 + 3longjmp(dword_18C6E51CC, 1) = 1;
      *((_DWORD *)a1 + 32) = v2;
    }
  }

  *((void *)a1 + 126) = *((void *)a1 + 12);
  *((_DWORD *)a1 + 250) = *((_DWORD *)a1 + 249);
  int v3 = (const __int32 *)*((void *)a1 + 121);
  int v4 = (const __int32 *)*((void *)a1 + 120);
  if (v3 != v4)
  {
    unint64_t v5 = *((void *)a1 + 122);
    if ((unint64_t)(v3 + 1) > v5)
    {
      int v3 = (const __int32 *)(v5 - 4);
      *((void *)a1 + 12longjmp(dword_18C6E51CC, 1) = v5 - 4;
    }

    *int v3 = 0;
    el_wpush(a1, v4);
  }

  uint64_t v6 = *((unsigned __int8 *)a1 + 984);
  *((_BYTE *)a1 + 137) = v6;
  *((_DWORD *)a1 + 35) = *((_DWORD *)a1 + 247);
  return (*(uint64_t (**)(EditLine *))(*((void *)a1 + 139) + 8 * v6))(a1);
}

uint64_t (**sub_1879C7CB8())()
{
  return off_18A0E9C00;
}

_UNKNOWN **sub_1879C7CC4()
{
  return &off_18A0E9F30;
}

void **sub_1879C7CD0(void **result, size_t a2, unint64_t a3)
{
  int v4 = result;
  if ((unint64_t)result[1] < a2)
  {
    result[1] = (void *)a2;
    uint64_t result = (void **)realloc(*result, a2);
    if (!result)
    {
      v4[1] = 0LL;
      free(*v4);
      uint64_t result = 0LL;
    }

    const __int32 *v4 = result;
  }

  if ((unint64_t)v4[3] < a3)
  {
    v4[3] = (void *)a3;
    uint64_t result = (void **)realloc(v4[2], 4 * a3);
    if (!result)
    {
      v4[3] = 0LL;
      free(v4[2]);
      uint64_t result = 0LL;
    }

    char v4[2] = result;
  }

  return result;
}

unsigned __int32 *sub_1879C7D54(unsigned __int32 *result, uint64_t a2)
{
  if (result)
  {
    int v3 = result;
    int v4 = *(char **)a2;
    if (*(void *)a2 || (sub_1879C7CD0((void **)a2, 0x400uLL, 0LL), (int v4 = *(char **)a2) != 0LL))
    {
      unsigned __int32 v5 = *v3;
      if (*v3)
      {
        uint64_t v6 = v3 + 1;
        do
        {
          uint64_t v7 = *(void *)(a2 + 8);
          uint64_t v8 = &v4[-*(void *)a2];
          if (v7 - (uint64_t)v8 <= 4)
          {
            sub_1879C7CD0((void **)a2, v7 + 1024, 0LL);
            if (!*(void *)a2) {
              return 0LL;
            }
            int v4 = &v8[*(void *)a2];
            unsigned __int32 v5 = *(v6 - 1);
          }

          uint64_t v9 = sub_1879C7E14(v4, 5uLL, v5);
          if (v9 == -1) {
            abort();
          }
          v4 += v9;
          unsigned __int32 v10 = *v6++;
          unsigned __int32 v5 = v10;
        }

        while (v10);
      }

      char *v4 = 0;
      return *(unsigned __int32 **)a2;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1879C7E14(char *a1, unint64_t a2, unsigned __int32 a3)
{
  unint64_t v3 = 1LL;
  uint64_t v4 = 2LL;
  uint64_t v5 = 3LL;
  if (a3 >= 0x10000) {
    uint64_t v5 = 4LL * (a3 < 0x110000);
  }
  if (a3 >= 0x800) {
    uint64_t v4 = v5;
  }
  if (v3 > a2) {
    return -1LL;
  }
  LODWORD(result) = wctomb(a1, a3);
  if ((result & 0x80000000) == 0) {
    return result;
  }
  wctomb(0LL, 0);
  return 0LL;
}

__int32 *sub_1879C7E88(__int32 *result, uint64_t a2)
{
  if (result)
  {
    unint64_t v3 = (const char *)result;
    if ((*(void *)(a2 + 16) || (sub_1879C7CD0((void **)a2, 0LL, 0x400uLL), *(void *)(a2 + 16)))
      && (size_t v4 = mbstowcs(0LL, v3, 0LL), v4 != -1LL))
    {
      if (v4 > *(void *)(a2 + 24)) {
        sub_1879C7CD0((void **)a2, 0LL, v4 + 1);
      }
      uint64_t result = *(__int32 **)(a2 + 16);
      if (result)
      {
        mbstowcs(result, v3, *(void *)(a2 + 24));
        return *(__int32 **)(a2 + 16);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void *sub_1879C7F20(int a1, const char **a2, uint64_t a3)
{
  if (a1 < 1)
  {
    unint64_t v6 = 0LL;
  }

  else
  {
    unint64_t v6 = 0LL;
    uint64_t v7 = a1;
    uint64_t v8 = a2;
    do
    {
      if (*v8) {
        size_t v9 = strlen(*v8) + 1;
      }
      else {
        size_t v9 = 0LL;
      }
      v6 += v9;
      ++v8;
      --v7;
    }

    while (v7);
  }

  sub_1879C7CD0((void **)a3, 0LL, v6);
  if (!*(void *)(a3 + 24)) {
    return 0LL;
  }
  unsigned __int32 v10 = malloc(8LL * (a1 + 1));
  v10[a1] = 0LL;
  if (a1 >= 1)
  {
    unint64_t v11 = 0LL;
    int v12 = *(__int32 **)(a3 + 16);
    uint64_t v13 = 8LL * a1;
    do
    {
      pid_t v14 = a2[v11 / 8];
      if (v14)
      {
        v10[v11 / 8] = v12;
        size_t v15 = mbstowcs(v12, v14, v6);
        if (v15 == -1LL)
        {
          free(v10);
          return 0LL;
        }

        v6 -= v15 + 1;
        v12 += v15 + 1;
      }

      else
      {
        v10[v11 / 8] = 0LL;
      }

      v11 += 8LL;
    }

    while (v13 != v11);
  }

  return v10;
}

uint64_t sub_1879C802C(unsigned int a1)
{
  uint64_t v1 = 2LL;
  uint64_t v2 = 3LL;
  if (a1 >= 0x10000) {
    uint64_t v2 = 4LL * (a1 < 0x110000);
  }
  if (a1 >= 0x800) {
    uint64_t v1 = v2;
  }
  else {
    return 1LL;
  }
}

_BYTE *sub_1879C8060(unsigned int *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = a1;
  uint64_t v2 = (char *)qword_18C6E5F58;
  if (!qword_18C6E5F58)
  {
    qword_18C6E5F60 = 1024LL;
    uint64_t v2 = (char *)malloc(0x1000uLL);
    qword_18C6E5F58 = (uint64_t)v2;
  }

  unint64_t v3 = *v1;
  if ((_DWORD)v3)
  {
    while (2)
    {
      uint64_t v4 = qword_18C6E5F60;
      uint64_t v5 = (_BYTE *)qword_18C6E5F58;
      while (1)
      {
        uint64_t v6 = sub_1879C819C(v2, v4 - ((v2 - v5) >> 2), v3);
        if (v6 != -1) {
          break;
        }
        uint64_t v7 = qword_18C6E5F58;
        uint64_t v4 = qword_18C6E5F60 + 1024;
        qword_18C6E5F60 = v4;
        uint64_t v8 = realloc((void *)qword_18C6E5F58, 4 * v4);
        if (!v8)
        {
          uint64_t v5 = (_BYTE *)v7;
          goto LABEL_19;
        }

        uint64_t v5 = v8;
        qword_18C6E5F58 = (uint64_t)v8;
        uint64_t v2 = &v2[(void)v8 - v7];
        unint64_t v3 = *v1;
        if (!(_DWORD)v3) {
          goto LABEL_14;
        }
      }

      unsigned int v9 = v1[1];
      ++v1;
      unint64_t v3 = v9;
      v2 += 4 * v6;
      if (v9) {
        continue;
      }
      break;
    }

    uint64_t v5 = (_BYTE *)qword_18C6E5F58;
  }

  else
  {
    uint64_t v5 = v2;
  }

LABEL_14:
  uint64_t v10 = qword_18C6E5F60;
  if (v2 >= &v5[4 * qword_18C6E5F60])
  {
    uint64_t v11 = ++qword_18C6E5F60;
    int v12 = (char *)realloc(v5, 4 * (v10 + 1));
    if (!v12)
    {
LABEL_19:
      free(v5);
      uint64_t v5 = 0LL;
      qword_18C6E5F60 = 0LL;
      return v5;
    }

    qword_18C6E5F58 = (uint64_t)v12;
    uint64_t v2 = &v12[4 * v11 - 4];
    uint64_t v5 = v12;
  }

  *(_DWORD *)uint64_t v2 = 0;
  return v5;
}

uint64_t sub_1879C819C(_DWORD *a1, unint64_t a2, unint64_t a3)
{
  unsigned int v6 = sub_1879C8330(a3);
  if (v6 >= 0xFFFFFFFD)
  {
    if (a2 >= 2)
    {
      int v7 = a3 | 0x40;
      if ((_DWORD)a3 == 127) {
        int v7 = 63;
      }
      *a1 = 94;
      a1[1] = v7;
      return 2LL;
    }

    return -1LL;
  }

  if (v6 != -4)
  {
    if (v6) {
      return 0LL;
    }
    if (a2)
    {
      *a1 = a3;
      return 1LL;
    }

    return -1LL;
  }

  *(void *)a1 = 0x550000005CLL;
  a1[2] = 43;
  if ((int)a3 < 0x10000)
  {
    unsigned int v9 = a1 + 3;
    uint64_t result = 7LL;
  }

  else
  {
    unsigned int v9 = a1 + 4;
    a1[3] = a0123456789abcd[(a3 >> 16) & 0xF];
    uint64_t result = 8LL;
  }

  *unsigned int v9 = a0123456789abcd[(unsigned __int16)a3 >> 12];
  v9[1] = a0123456789abcd[(a3 >> 8) & 0xF];
  v9[2] = a0123456789abcd[a3 >> 4];
  v9[3] = a0123456789abcd[a3 & 0xF];
  return result;
}

uint64_t sub_1879C82BC(__darwin_ct_rune_t a1)
{
  int v2 = sub_1879C8330(a1) + 4;
  uint64_t result = 2LL;
  switch(v2)
  {
    case 0:
      if (a1 < 0x10000) {
        uint64_t result = 7LL;
      }
      else {
        uint64_t result = 8LL;
      }
      break;
    case 2:
      uint64_t result = 1LL;
      break;
    case 3:
      return result;
    case 4:
      uint64_t result = wcwidth(a1);
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t sub_1879C8330(__darwin_ct_rune_t a1)
{
  if (a1 == 9) {
    return 4294967294LL;
  }
  if (a1 == 10) {
    return 4294967293LL;
  }
  if (a1 <= 255)
  {
    if (a1 <= 0x7F)
    {
      int v3 = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * a1 + 60);
      if ((v3 & 0x200) == 0)
      {
        int v4 = v3 & 0x40000;
        goto LABEL_12;
      }

      return 0xFFFFFFFFLL;
    }

    if (__maskrune(a1, 0x200uLL)) {
      return 0xFFFFFFFFLL;
    }
  }

  int v4 = __maskrune(a1, 0x40000uLL);
LABEL_12:
  if (v4) {
    return 0LL;
  }
  else {
    return 4294967292LL;
  }
}

int el_getc(EditLine *a1, char *a2)
{
  __int32 v7 = 0;
  int v4 = *((_DWORD *)a1 + 11);
  if ((v4 & 0x10) == 0) {
    *((_DWORD *)a1 + 1longjmp(dword_18C6E51CC, 1) = v4 | 0x20;
  }
  int result = el_wgetc(a1, &v7);
  int v6 = *((_DWORD *)a1 + 11);
  if ((v6 & 0x10) == 0) {
    *((_DWORD *)a1 + 1longjmp(dword_18C6E51CC, 1) = v6 & 0xFFFFFFDF;
  }
  if (result >= 1) {
    *a2 = v7;
  }
  return result;
}

void el_push(EditLine *a1, const char *a2)
{
  int v3 = sub_1879C7E88((__int32 *)a2, (uint64_t)a1 + 1296);
  el_wpush(a1, v3);
}

const char *__cdecl el_gets(EditLine *a1, int *a2)
{
  int v4 = *((_DWORD *)a1 + 11);
  if ((v4 & 0x10) == 0) {
    *((_DWORD *)a1 + 1longjmp(dword_18C6E51CC, 1) = v4 | 0x20;
  }
  uint64_t v5 = (unsigned __int32 *)el_wgets(a1, a2);
  int v6 = *((_DWORD *)a1 + 11);
  if ((v6 & 0x10) == 0) {
    *((_DWORD *)a1 + 1longjmp(dword_18C6E51CC, 1) = v6 & 0xFFFFFFDF;
  }
  if (!v5) {
    return 0LL;
  }
  __int32 v7 = sub_1879C7D54(v5, (uint64_t)a1 + 1296);
  uint64_t v8 = (const char *)v7;
  if (v7) {
    *a2 = strlen((const char *)v7);
  }
  return v8;
}

int el_parse(EditLine *a1, int a2, const char **a3)
{
  uint64_t v5 = (const __int32 **)sub_1879C7F20(a2, a3, (uint64_t)a1 + 1296);
  if (!v5) {
    return -1;
  }
  int v6 = v5;
  int v7 = el_wparse(a1, a2, v5);
  free(v6);
  return v7;
}

int el_set(EditLine *a1, int a2, ...)
{
  uint64_t v26 = va_arg(va1, __int32 *);
  va_copy(va2, va1);
  int v27 = va_arg(va2, const char *);
  va_copy(va3, va2);
  uint64_t v28 = va_arg(va3, void);
  v25[20] = *(const char **)MEMORY[0x1895F89C0];
  if (!a1) {
    return -1;
  }
  va_copy(v24, va);
  int v3 = -1;
  switch(a2)
  {
    case 0:
    case 12:
      uint64_t v11 = v26;
      int v12 = 0;
      goto LABEL_13;
    case 1:
      int v10 = el_wset(a1, 1, v26, v23, va1);
      goto LABEL_14;
    case 2:
      unsigned int v22 = sub_1879C7E88(v26, (uint64_t)a1 + 1296);
      int v10 = el_wset(a1, 2, v22, v23, va1);
      goto LABEL_14;
    case 3:
    case 11:
    case 15:
    case 16:
      int v10 = el_wset(a1, a2, v26, v23, va1);
      goto LABEL_14;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      for (uint64_t i = 1LL; i != 20; ++i)
      {
        int v6 = va_arg(v24, const char *);
        v25[i] = v6;
        if (!v6) {
          break;
        }
      }

      v25[0] = 0LL;
      int v7 = (const __int32 **)sub_1879C7F20((int)i + 1, v25, (uint64_t)a1 + 1296);
      if (!v7) {
        return -1;
      }
      uint64_t v8 = v7;
      switch(a2)
      {
        case 4:
          *int v7 = (const __int32 *)&unk_1879D0C3C;
          int v9 = sub_1879BC1C8();
          goto LABEL_33;
        case 5:
          *int v7 = (const __int32 *)&unk_1879D0C50;
          int v9 = sub_1879C4BF8((uint64_t)a1);
          goto LABEL_33;
        case 6:
          *int v7 = (const __int32 *)&unk_1879D0C6C;
          int v9 = sub_1879C4DC0((uint64_t)a1, i, (uint64_t)v7);
          goto LABEL_33;
        case 7:
          *int v7 = (const __int32 *)&unk_1879D0C84;
          int v9 = sub_1879C504C((uint64_t)a1, i, (uint64_t)v7);
          goto LABEL_33;
        case 8:
          *int v7 = (const __int32 *)&unk_1879D0CA0;
          int v9 = sub_1879C671C((uint64_t)a1, i, (uint64_t)v7);
LABEL_33:
          int v3 = v9;
          break;
        default:
          int v3 = -1;
          break;
      }

      int v18 = v8;
      goto LABEL_35;
    case 9:
      v25[0] = (const char *)v26;
      v25[1] = v27;
      uint64_t v13 = v28;
      pid_t v14 = (const __int32 **)sub_1879C7F20(2, v25, (uint64_t)a1 + 1296);
      if (!v14) {
        return -1;
      }
      size_t v15 = v14;
      unint64_t v16 = sub_1879C8C44(*v14);
      size_t v17 = sub_1879C8C44(v15[1]);
      int v3 = sub_1879BC768((uint64_t)a1, (uint64_t)v16, (uint64_t)v17, v13);
      int v18 = v15;
LABEL_35:
      free(v18);
      return v3;
    case 10:
      int v3 = sub_1879B9DE0((uint64_t)a1, (uint64_t)v26, (uint64_t)v27);
      int v20 = *((_DWORD *)a1 + 11) | 0x40;
      goto LABEL_23;
    case 13:
      int v3 = el_wset(a1, 13, v26);
      int v20 = *((_DWORD *)a1 + 11) | 0x80;
LABEL_23:
      *((_DWORD *)a1 + 1longjmp(dword_18C6E51CC, 1) = v20;
      return v3;
    case 14:
      int v10 = el_wset(a1, 14, v26, v23, va1);
      goto LABEL_14;
    case 19:
      int v10 = el_wset(a1, 19, v26, v27, va2);
      goto LABEL_14;
    case 20:
      int v10 = el_wset(a1, 20, v21, v23, va);
      goto LABEL_14;
    case 21:
    case 22:
      uint64_t v11 = v26;
      int v12 = (char)v27;
LABEL_13:
      int v10 = sub_1879BCF54((uint64_t)a1, v11, v12, a2, 0);
      goto LABEL_14;
    case 23:
      int v10 = sub_1879B6E14((uint64_t)a1, (uint64_t)v26, (uint64_t)v27);
LABEL_14:
      int v3 = v10;
      break;
    default:
      return v3;
  }

  return v3;
}

int el_get(EditLine *a1, int a2, ...)
{
  size_t v15 = va_arg(va1, unsigned __int32 **);
  va_copy(va2, va1);
  unint64_t v16 = va_arg(va2, _BYTE *);
  v14[20] = *(unsigned __int32 **)MEMORY[0x1895F89C0];
  if (!a1) {
    return -1;
  }
  va_copy(v12, va);
  int result = -1;
  switch(a2)
  {
    case 0:
    case 12:
      return sub_1879BCFA0((uint64_t)a1, v15, 0LL, a2);
    case 1:
      va_copy(v13, va1);
      unint64_t v10 = (unint64_t)v15;
      int v4 = a1;
      a2 = 1;
      goto LABEL_4;
    case 2:
      int v6 = v15;
      int v7 = el_wget(a1, 2, v14);
      const char *v6 = sub_1879C7D54(v14[0], (uint64_t)a1 + 1296);
      if (*((void *)a1 + 163)) {
        return v7;
      }
      else {
        return -1;
      }
    case 3:
    case 11:
    case 15:
    case 16:
      va_copy(v13, va1);
      unint64_t v10 = (unint64_t)v15;
      int v4 = a1;
      goto LABEL_4;
    case 13:
      va_copy(v13, va1);
      unint64_t v10 = (unint64_t)v15;
      int v4 = a1;
      a2 = 13;
      goto LABEL_4;
    case 14:
      va_copy(v13, va1);
      unint64_t v10 = (unint64_t)v15;
      int v4 = a1;
      a2 = 14;
      goto LABEL_4;
    case 17:
      for (uint64_t i = 1LL; i != 20; ++i)
      {
        int v9 = va_arg(v12, unsigned __int32 *);
        v14[i] = v9;
        if (!v9) {
          break;
        }
      }

      v14[0] = (unsigned __int32 *)aGettc_0;
      return sub_1879C4F38((uint64_t)a1, i, (uint64_t)v14);
    case 18:
      va_copy(v13, va2);
      unint64_t v10 = v15;
      uint64_t v11 = v16;
      int v4 = a1;
      a2 = 18;
LABEL_4:
      int result = el_wget(v4, a2, v10, v11, v13);
      break;
    case 21:
    case 22:
      uint64_t v5 = v16;
      LODWORD(v14[0]) = 0;
      int result = sub_1879BCFA0((uint64_t)a1, v15, v14, a2);
      *uint64_t v5 = v14[0];
      break;
    default:
      return result;
  }

  return result;
}

const LineInfo *__cdecl el_line(EditLine *a1)
{
  int v2 = el_wline(a1);
  int v3 = (unsigned __int32 **)((char *)a1 + 1328);
  int v4 = sub_1879C7D54((unsigned __int32 *)v2->buffer, (uint64_t)a1 + 1296);
  *((void *)a1 + 166) = v4;
  int buffer = (unsigned int *)v2->buffer;
  if (v2->buffer >= v2->cursor)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = 0LL;
    do
    {
      unsigned int v7 = *buffer++;
      v6 += sub_1879C802C(v7);
    }

    while ((const __int32 *)buffer < v2->cursor);
    int v4 = *v3;
    int buffer = (unsigned int *)v2->buffer;
  }

  *((void *)a1 + 167) = (char *)v4 + v6;
  if ((const __int32 *)buffer >= v2->lastchar)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 0LL;
    do
    {
      unsigned int v9 = *buffer++;
      v8 += sub_1879C802C(v9);
    }

    while ((const __int32 *)buffer < v2->lastchar);
    int v4 = *v3;
  }

  *((void *)a1 + 168) = (char *)v4 + v8;
  return (const LineInfo *)((char *)a1 + 1328);
}

int el_insertstr(EditLine *a1, const char *a2)
{
  int v3 = sub_1879C7E88((__int32 *)a2, (uint64_t)a1 + 1296);
  return el_winsertstr(a1, v3);
}

__int32 *sub_1879C8C44(const __int32 *a1)
{
  size_t v2 = wcslen(a1) + 1;
  int result = (__int32 *)malloc(4 * v2);
  if (result) {
    return wmemcpy(result, a1, v2);
  }
  return result;
}

History *history_init(void)
{
  __int16 v0 = malloc(0x60uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    if (sub_1879BA2C8(v0) == -1)
    {
      free(v1);
      return 0LL;
    }

    else
    {
      *((_DWORD *)v1 + 2) = -1;
      char v1[2] = sub_1879C8DA0;
      v1[3] = sub_1879C8D40;
      v1[4] = sub_1879C8DDC;
      v1[5] = sub_1879C8E18;
      v1[6] = sub_1879C8E94;
      v1[7] = sub_1879C8EEC;
      v1[10] = sub_1879C8FB4;
      v1[11] = sub_1879C90B8;
      v1[8] = sub_1879C91B0;
      v1[9] = sub_1879C8F70;
    }
  }

  return (History *)v1;
}

uint64_t sub_1879C8D40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == a1)
  {
    *(_DWORD *)a2 = 5;
    uint64_t v6 = "empty list";
  }

  else
  {
    int v4 = *(_OWORD **)(v2 + 24);
    if (v4 != (_OWORD *)a1)
    {
      uint64_t result = 0LL;
      *(void *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }

    *(_DWORD *)a2 = 6;
    uint64_t v6 = "no next event";
  }

  *(void *)(a2 + 8) = v6;
  return 0xFFFFFFFFLL;
}

uint64_t sub_1879C8DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 24);
  *(void *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 3;
    *(void *)(a2 + 8) = "first event not found";
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t result = 0LL;
    *(_OWORD *)a2 = *v2;
  }

  return result;
}

uint64_t sub_1879C8DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 32);
  *(void *)(a1 + 40) = v2;
  if (v2 == (_OWORD *)a1)
  {
    *(_DWORD *)a2 = 4;
    *(void *)(a2 + 8) = "last event not found";
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t result = 0LL;
    *(_OWORD *)a2 = *v2;
  }

  return result;
}

uint64_t sub_1879C8E18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == a1)
  {
    int v6 = *(_DWORD *)(a1 + 52);
    BOOL v7 = v6 <= 0;
    if (v6 <= 0) {
      int v8 = 5;
    }
    else {
      int v8 = 6;
    }
    *(_DWORD *)a2 = v8;
    uint64_t v9 = 5LL;
    if (!v7) {
      uint64_t v9 = 6LL;
    }
    unint64_t v10 = (&off_18A0EA8C0)[v9];
  }

  else
  {
    int v4 = *(_OWORD **)(v3 + 32);
    if (v4 != (_OWORD *)a1)
    {
      uint64_t result = 0LL;
      *(void *)(a1 + 40) = v4;
      *(_OWORD *)a2 = *v4;
      return result;
    }

    *(_DWORD *)a2 = 7;
    unint64_t v10 = "no previous event";
  }

  *(void *)(a2 + 8) = v10;
  return 0xFFFFFFFFLL;
}

uint64_t sub_1879C8E94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_OWORD **)(a1 + 40);
  if (v2 == (_OWORD *)a1)
  {
    int v4 = *(_DWORD *)(a1 + 52);
    BOOL v5 = v4 <= 0;
    if (v4 <= 0) {
      int v6 = 5;
    }
    else {
      int v6 = 8;
    }
    *(_DWORD *)a2 = v6;
    uint64_t v7 = 5LL;
    if (!v5) {
      uint64_t v7 = 8LL;
    }
    *(void *)(a2 + 8) = (&off_18A0EA8C0)[v7];
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t result = 0LL;
    *(_OWORD *)a2 = *v2;
  }

  return result;
}

uint64_t sub_1879C8EEC(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 52))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3 == a1 || *(_DWORD *)v3 != a3)
    {
      uint64_t v3 = a1;
      while (1)
      {
        uint64_t v3 = *(void *)(v3 + 24);
        if (v3 == a1) {
          break;
        }
        if (*(_DWORD *)v3 == a3) {
          goto LABEL_10;
        }
      }

      uint64_t v3 = a1;
LABEL_10:
      *(void *)(a1 + 40) = v3;
    }

    if (v3 != a1) {
      return 0LL;
    }
    int v4 = "event not found";
    int v5 = 9;
  }

  else
  {
    int v4 = "empty list";
    int v5 = 5;
  }

  *(_DWORD *)a2 = v5;
  *(void *)(a2 + 8) = v4;
  return 0xFFFFFFFFLL;
}

void sub_1879C8F70(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 32); i != a1; uint64_t i = *(void *)(a1 + 32))
    sub_1879BB258(a1, i);
  *(void *)(a1 + 40) = a1;
  *(_DWORD *)(a1 + 52) = 0;
  *(_DWORD *)(a1 + 56) = 0;
}

uint64_t sub_1879C8FB4(uint64_t a1, uint64_t a2, char *__s2)
{
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 24);
    if (v6 != a1)
    {
      uint64_t result = strcmp(*(const char **)(v6 + 8), __s2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  int v8 = malloc(0x28uLL);
  if (!v8)
  {
LABEL_15:
    *(_DWORD *)a2 = 2;
    *(void *)(a2 + 8) = "malloc() failed";
    return 0xFFFFFFFFLL;
  }

  uint64_t v9 = v8;
  unint64_t v10 = strdup(__s2);
  v9[1] = v10;
  if (!v10)
  {
    free(v9);
    goto LABEL_15;
  }

  uint64_t v11 = *(void *)(a1 + 24);
  v9[2] = 0LL;
  v9[3] = v11;
  v9[4] = a1;
  *(void *)(v11 + 32) = v9;
  int v12 = *(_DWORD *)(a1 + 52);
  LODWORD(v1longjmp(dword_18C6E51CC, 1) = *(_DWORD *)(a1 + 56) + 1;
  *(_DWORD *)uint64_t v9 = v11;
  *(void *)(a1 + 24) = v9;
  *(_DWORD *)(a1 + 52) = v12 + 1;
  *(_DWORD *)(a1 + 56) = v11;
  *(void *)(a1 + 40) = v9;
  *(_OWORD *)a2 = *(_OWORD *)v9;
  int v13 = *(_DWORD *)(a1 + 52);
  uint64_t result = 1LL;
  if (v13 >= 1 && v13 > *(_DWORD *)(a1 + 48))
  {
    do
    {
      sub_1879BB258(a1, *(void *)(a1 + 32));
      int v14 = *(_DWORD *)(a1 + 52);
    }

    while (v14 >= 1 && v14 > *(_DWORD *)(a1 + 48));
    return 1LL;
  }

  return result;
}

uint64_t sub_1879C90B8(uint64_t a1, uint64_t a2, char *__s2)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == a1) {
    return sub_1879C8FB4(a1, a2, __s2);
  }
  uint64_t v7 = *(const char **)(v6 + 8);
  size_t v8 = strlen(v7);
  size_t v9 = strlen(__s2) + v8;
  unint64_t v10 = (char *)malloc(v9 + 1);
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = strncpy(v10, v7, v9 + 1);
    v12[v9] = 0;
    size_t v13 = strlen(v12);
    strncat(v11, __s2, v9 - v13);
    free(*(void **)(v6 + 8));
    uint64_t result = 0LL;
    *(void *)(v6 + 8) = v11;
    *(_OWORD *)a2 = *(_OWORD *)*(void *)(a1 + 40);
  }

  else
  {
    *(_DWORD *)a2 = 2;
    *(void *)(a2 + 8) = "malloc() failed";
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_1879C91B0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  *(void *)(a2 + 8) = strdup(*(const char **)(v6 + 8));
  *(_DWORD *)a2 = *(_DWORD *)v6;
  sub_1879BB258(a1, v6);
  return 0LL;
}

void history_end(History *a1)
{
}

int history(History *a1, HistEvent *a2, int a3, ...)
{
  unint64_t v79 = va_arg(va, const char *);
  uint64_t v80 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  unint64_t v81 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  unint64_t v82 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  v83 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  int v84 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2));
  unint64_t v85 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  int v86 = va_arg(va, void (*)(uint64_t a1));
  int64_t v87 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, char *__s2));
  v88 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, char *__s2));
  uint64_t v89 = va_arg(va, uint64_t (*)(uint64_t a1, uint64_t a2, int a3));
  a2->uint64_t num = 0;
  a2->int str = "OK";
  switch(a3)
  {
    case 0:
      *((_DWORD *)a1 + 2) = -1;
      int v5 = v80;
      uint64_t v6 = v81;
      uint64_t v7 = v82;
      size_t v8 = v83;
      size_t v9 = v84;
      unint64_t v10 = v85;
      uint64_t v11 = v86;
      int v12 = v87;
      size_t v13 = v88;
      int v14 = v89;
      if (v80) {
        BOOL v15 = v81 == 0LL;
      }
      else {
        BOOL v15 = 1;
      }
      BOOL v24 = v15
         || v82 == 0LL
         || v83 == 0LL
         || v84 == 0LL
         || v85 == 0LL
         || v87 == 0LL
         || v88 == 0LL
         || v86 == 0LL
         || v89 == 0LL
         || v79 == 0LL;
      int v25 = v24;
      uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t))*((void *)a1 + 3);
      if (v24)
      {
        if (v26 == sub_1879C8D40 || (int v27 = v25, sub_1879BA2C8(a1) == -1))
        {
LABEL_123:
          a2->uint64_t num = 12;
          uint64_t v28 = "required parameter(s) not supplied";
          goto LABEL_138;
        }

        int v25 = v27;
        int v14 = sub_1879C91B0;
        size_t v13 = sub_1879C90B8;
        int v12 = sub_1879C8FB4;
        uint64_t v11 = sub_1879C8F70;
        unint64_t v10 = sub_1879C8EEC;
        size_t v9 = sub_1879C8E94;
        size_t v8 = sub_1879C8E18;
        uint64_t v7 = sub_1879C8DDC;
        uint64_t v6 = sub_1879C8D40;
        int v5 = sub_1879C8DA0;
      }

      else
      {
        if (v26 == sub_1879C8D40)
        {
          int v74 = v25;
          sub_1879C8F70(*(void *)a1);
          int v14 = v89;
          uint64_t v11 = v86;
          int v25 = v74;
        }

        *((_DWORD *)a1 + 2) = -1;
      }

      *((void *)a1 + 2) = v5;
      *((void *)a1 + 3) = v6;
      *((void *)a1 + 4) = v7;
      *((void *)a1 + 5) = v8;
      *((void *)a1 + 6) = v9;
      *((void *)a1 + 7) = v10;
      *((void *)a1 + rl_insert(1, 10) = v12;
      *((void *)a1 + 1longjmp(dword_18C6E51CC, 1) = v13;
      *((void *)a1 + 8) = v14;
      *((void *)a1 + 9) = v11;
      if (!v25) {
        return 0;
      }
      goto LABEL_123;
    case 1:
      if ((v79 & 0x80000000) == 0)
      {
        int v29 = 0;
        *(_DWORD *)(*(void *)a1 + 48LL) = (_DWORD)v79;
        return v29;
      }

      a2->uint64_t num = 15;
      uint64_t v28 = "bad parameters";
      goto LABEL_138;
    case 2:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_1879C8D40)
      {
        uint64_t v28 = "function not allowed with other history-functions-set the default";
        int v30 = 14;
        goto LABEL_137;
      }

      int v58 = *(_DWORD *)(*(void *)a1 + 52LL);
      a2->uint64_t num = v58;
      if (v58 > -2) {
        return 0;
      }
      uint64_t v28 = "history size negative";
      int v30 = 13;
      goto LABEL_137;
    case 3:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 2))(*(void *)a1, a2);
    case 4:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 4))(*(void *)a1, a2);
    case 5:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 5))(*(void *)a1, a2);
    case 6:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 3))(*(void *)a1, a2);
    case 7:
      return (*((uint64_t (**)(void, HistEvent *, void))a1 + 7))(*(void *)a1, a2, v79);
    case 8:
      return (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
    case 9:
      return (*((uint64_t (**)(void, HistEvent *, const char *))a1 + 11))(*(void *)a1, a2, v79);
    case 10:
      int v29 = (*((uint64_t (**)(void, HistEvent *, const char *))a1 + 10))(*(void *)a1, a2, v79);
      if (v29 != -1) {
        *((_DWORD *)a1 + 2) = a2->num;
      }
      return v29;
    case 11:
      if ((*((unsigned int (**)(void, HistEvent *, void))a1 + 7))( *(void *)a1,  a2,  *((unsigned int *)a1 + 2)) == -1) {
        return -1;
      }
      return (*((uint64_t (**)(void, HistEvent *, const char *))a1 + 11))(*(void *)a1, a2, v79);
    case 12:
      history_end(a1);
      return 0;
    case 13:
      size_t v32 = strlen(v79);
      int v33 = (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v33 == -1) {
          goto LABEL_103;
        }
        if (strncmp(v79, a2->str, v32))
        {
          int v33 = (*((uint64_t (**)(void, HistEvent *))a1 + 5))(*(void *)a1, a2);
          continue;
        }

        return 0;
      }

    case 14:
      size_t v34 = strlen(v79);
      int v35 = (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v35 == -1) {
          goto LABEL_103;
        }
        if (strncmp(v79, a2->str, v34))
        {
          int v35 = (*((uint64_t (**)(void, HistEvent *))a1 + 3))(*(void *)a1, a2);
          continue;
        }

        return 0;
      }

    case 15:
      int v36 = (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v36 == -1) {
          goto LABEL_103;
        }
        if (a2->num != (_DWORD)v79)
        {
          int v36 = (*((uint64_t (**)(void, HistEvent *))a1 + 3))(*(void *)a1, a2);
          continue;
        }

        return 0;
      }

    case 16:
      int v37 = (*((uint64_t (**)(void, HistEvent *))a1 + 6))(*(void *)a1, a2);
      while (2)
      {
        if (v37 == -1) {
          goto LABEL_103;
        }
        if (a2->num != (_DWORD)v79)
        {
          int v37 = (*((uint64_t (**)(void, HistEvent *))a1 + 5))(*(void *)a1, a2);
          continue;
        }

        return 0;
      }

    case 17:
      int v38 = fopen(v79, "r");
      if (!v38) {
        goto LABEL_80;
      }
      int v39 = v38;
      int v40 = fgetln(v38, &__n);
      if (!v40 || strncmp(v40, "_HiStOrY_V2_\n", __n) || (uint64_t v62 = malloc(0x400uLL)) == 0LL)
      {
        fclose(v39);
        goto LABEL_80;
      }

      uint64_t v63 = v62;
      int v64 = fgetln(v39, &__n);
      if (v64)
      {
        uint64_t v65 = v64;
        int v29 = 0;
        size_t v66 = 1024LL;
        while (1)
        {
          size_t v67 = __n;
          if (__n && v65[__n - 1] == 10)
          {
            --__n;
            --v67;
          }

          if (v66 < v67)
          {
            size_t v66 = (v67 & 0xFFFFFFFFFFFFFC00LL) + 1024;
            int64_t v68 = realloc(v63, v66);
            if (!v68) {
              break;
            }
            size_t v67 = __n;
            uint64_t v63 = v68;
          }

          int v76 = 0;
          uint64_t v69 = (char *)v63;
          if (v67)
          {
            uint64_t v69 = (char *)v63;
            do
            {
              --v67;
              int v71 = *v65++;
              int v70 = v71;
              while (1)
              {
                int v72 = unvis(v69, v70, &v76, 0);
                if (v72 != 2) {
                  break;
                }
                ++v69;
              }

              if (v72 && v72 != 3)
              {
                if (v72 != 1) {
                  goto LABEL_164;
                }
                ++v69;
              }
            }

            while (v67);
          }

          uint64_t v73 = unvis(v69, 0, &v76, 2048) == 1 ? v69 + 1 : v69;
          *uint64_t v73 = 0;
LABEL_164:
          ++v29;
          uint64_t v65 = fgetln(v39, &__n);
          if (!v65) {
            goto LABEL_176;
          }
        }

        int v29 = -1;
      }

      else
      {
        int v29 = 0;
      }

LABEL_176:
      free(v63);
      fclose(v39);
      if (v29 == -1)
      {
LABEL_80:
        a2->uint64_t num = 10;
        uint64_t v28 = "can't read history from file";
        goto LABEL_138;
      }

      return v29;
    case 18:
      int v41 = fopen(v79, "w");
      if (!v41) {
        goto LABEL_125;
      }
      size_t v42 = v41;
      int v43 = fileno(v41);
      if (fchmod(v43, 0x180u) == -1 || fputs("_HiStOrY_V2_\n", v42) == -1 || (size_t v44 = malloc(0x400uLL)) == 0LL)
      {
        fclose(v42);
        goto LABEL_125;
      }

      uint64_t v45 = v44;
      if ((*((unsigned int (**)(void, _BYTE *))a1 + 4))(*(void *)a1, v77) == -1)
      {
        int v29 = 0;
        goto LABEL_172;
      }

      int v29 = 0;
      size_t v46 = 1024LL;
      while (2)
      {
        uint64_t v47 = __s;
        size_t v48 = 4 * strlen(__s);
        if (v48 < v46) {
          goto LABEL_90;
        }
        size_t v46 = (v48 & 0xFFFFFFFFFFFFFC00LL) + 1024;
        uint64_t v49 = realloc(v45, v46);
        if (v49)
        {
          uint64_t v45 = v49;
LABEL_90:
          strvis((char *)v45, v47, 28);
          fprintf(v42, "%s\n", (const char *)v45);
          ++v29;
          continue;
        }

        break;
      }

      int v29 = -1;
LABEL_172:
      free(v45);
      fclose(v42);
      if (v29 == -1)
      {
LABEL_125:
        a2->uint64_t num = 11;
        uint64_t v28 = "can't write history";
        goto LABEL_138;
      }

      return v29;
    case 19:
      (*((void (**)(void, HistEvent *))a1 + 9))(*(void *)a1, a2);
      return 0;
    case 20:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) != sub_1879C8D40)
      {
LABEL_94:
        a2->uint64_t num = 14;
        uint64_t v28 = "function not allowed with other history-functions-set the default";
        goto LABEL_138;
      }

      int v59 = *(_DWORD *)(*(void *)a1 + 60LL);
      int v29 = 0;
      if ((_DWORD)v79) {
        unsigned int v60 = v59 | 1;
      }
      else {
        unsigned int v60 = v59 & 0xFFFFFFFE;
      }
      *(_DWORD *)(*(void *)a1 + 6el_set((EditLine *)qword_18C6E51B8, 15, 0LL) = v60;
      return v29;
    case 21:
      if (*((uint64_t (**)(uint64_t, uint64_t))a1 + 3) == sub_1879C8D40)
      {
        int v29 = 0;
        int v50 = *(_DWORD *)(*(void *)a1 + 60LL) & 1;
      }

      else
      {
        a2->int str = "function not allowed with other history-functions-set the default";
        int v29 = -1;
        int v50 = 14;
      }

      a2->uint64_t num = v50;
      return v29;
    case 22:
      return (*((uint64_t (**)(void, HistEvent *, void))a1 + 8))(*(void *)a1, a2, v79);
    case 23:
      int v51 = (_DWORD)v79 + 1;
      while (--v51 > 0)
      {
        if ((*((unsigned int (**)(void, HistEvent *))a1 + 5))(*(void *)a1, a2) == -1)
        {
LABEL_103:
          a2->uint64_t num = 9;
          uint64_t v28 = "event not found";
LABEL_138:
          a2->int str = v28;
          return -1;
        }
      }

      if (!v80) {
        return 0;
      }
      int v29 = 0;
      *(void *)uint64_t v80 = *(void *)(*(void *)(*(void *)a1 + 40LL) + 16LL);
      return v29;
    case 24:
      int v52 = (int)v79;
      uint64_t v53 = *(void *)a1;
      if (!*(_DWORD *)(*(void *)a1 + 52LL))
      {
        uint64_t v28 = "empty list";
        int v30 = 5;
LABEL_137:
        a2->uint64_t num = v30;
        goto LABEL_138;
      }

      uint64_t v54 = *(void *)a1;
      do
        uint64_t v54 = *(void *)(v54 + 32);
      while (v54 != v53 && v52-- > 0);
      *(void *)(v53 + 40) = v54;
      if (v54 == v53)
      {
        uint64_t v28 = "event not found";
        int v30 = 9;
        goto LABEL_137;
      }

      if (v80 != (uint64_t (*)(uint64_t, uint64_t))-1LL)
      {
        a2->int str = strdup(*(const char **)(v54 + 8));
        a2->uint64_t num = *(_DWORD *)v54;
        if (v80)
        {
          *(void *)uint64_t v80 = *(void *)(v54 + 16);
          uint64_t v54 = *(void *)(v53 + 40);
        }

        sub_1879BB258(v53, v54);
      }

      return 0;
    case 25:
      if (!v79) {
        return -1;
      }
      int v56 = strdup(v79);
      if (!v56) {
        return -1;
      }
      int v29 = 0;
      uint64_t v57 = *(void *)(*(void *)a1 + 40LL);
      *(void *)(v57 + 8) = v56;
      *(void *)(v57 + 16) = v80;
      return v29;
    default:
      a2->uint64_t num = 1;
      uint64_t v28 = "unknown error";
      goto LABEL_138;
  }

Tokenizer *__cdecl tok_init(const char *a1)
{
  uint64_t v2 = (char *)malloc(0x48uLL);
  if (v2)
  {
    if (a1) {
      uint64_t v3 = a1;
    }
    else {
      uint64_t v3 = "\t \n";
    }
    int v4 = strdup(v3);
    *(void *)uint64_t v2 = v4;
    if (v4)
    {
      int v5 = v4;
      *(_OWORD *)(v2 + 8) = xmmword_1879CB650;
      uint64_t v6 = malloc(0x50uLL);
      *((void *)v2 + 3) = v6;
      if (v6)
      {
        uint64_t v7 = v6;
        void *v6 = 0LL;
        size_t v8 = (char *)malloc(0x14uLL);
        *((void *)v2 + 7) = v8;
        if (v8)
        {
          *((void *)v2 + 5) = v8 + 20;
          *((void *)v2 + 6) = v8;
          *((void *)v2 + 4) = v8;
          *((void *)v2 + 8) = 0LL;
          return (Tokenizer *)v2;
        }

        free(v7);
      }

      free(v5);
    }

    free(v2);
    return 0LL;
  }

  return (Tokenizer *)v2;
}

void tok_reset(Tokenizer *a1)
{
  *((void *)a1 + longjmp(dword_18C6E51CC, 1) = 0LL;
  uint64_t v1 = *((void *)a1 + 7);
  *((void *)a1 + 6) = v1;
  *((void *)a1 + 4) = v1;
  *((void *)a1 + 8) = 0LL;
}

void tok_end(Tokenizer *a1)
{
}

int tok_line(Tokenizer *a1, const LineInfo *a2, int *a3, const char ***a4, int *a5, int *a6)
{
  int buffer = a2->buffer;
  int v9 = -1;
  int v10 = -1;
  while (1)
  {
    else {
      uint64_t v11 = buffer;
    }
    if (v11 == a2->cursor)
    {
      int v10 = *((_DWORD *)a1 + 2);
      int v9 = *((_DWORD *)a1 + 8) - *((_DWORD *)a1 + 12);
    }

    int v12 = *v11;
    if (v12 <= 33) {
      break;
    }
    if (v12 == 34)
    {
      int v17 = *((_DWORD *)a1 + 16);
      *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
      switch(v17)
      {
        case 0:
          goto LABEL_26;
        case 1:
          goto LABEL_33;
        case 2:
          goto LABEL_30;
        case 3:
          goto LABEL_24;
        case 4:
          goto LABEL_32;
        default:
          return -1;
      }
    }

    if (v12 != 92)
    {
      if (v12 == 39)
      {
        int v13 = *((_DWORD *)a1 + 16);
        *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
        switch(v13)
        {
          case 0:
            int v14 = 1;
            goto LABEL_28;
          case 1:
            goto LABEL_30;
          case 2:
            goto LABEL_33;
          case 3:
            goto LABEL_24;
          case 4:
            goto LABEL_32;
          default:
            return -1;
        }
      }

LABEL_34:
      uint64_t v26 = (char *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v26 + 1;
      char *v26 = v25;
      goto LABEL_35;
    }

    int v18 = *((_DWORD *)a1 + 16);
    *((_DWORD *)a1 + 17) = *((_DWORD *)a1 + 17) & 0xFFFFFFFC | 1;
    switch(v18)
    {
      case 0:
        int v14 = 3;
        break;
      case 1:
        goto LABEL_33;
      case 2:
        int v14 = 4;
        break;
      case 3:
        char v22 = *v11;
        uint64_t v23 = (char *)*((void *)a1 + 4);
        *((void *)a1 + 4) = v23 + 1;
        char *v23 = v22;
        goto LABEL_30;
      case 4:
        goto LABEL_32;
      default:
        return -1;
    }

LABEL_28:
    *((_DWORD *)a1 + 16) = v14;
LABEL_35:
    uint64_t v27 = *((void *)a1 + 5);
    if (*((void *)a1 + 4) >= (unint64_t)(v27 - 4))
    {
      uint64_t v28 = (void *)*((void *)a1 + 7);
      size_t v29 = v27 - (void)v28 + 20;
      int v30 = (char *)realloc(v28, v29);
      if (!v30) {
        return -1;
      }
      uint64_t v31 = (char *)*((void *)a1 + 7);
      if (v30 != v31)
      {
        uint64_t v32 = *((void *)a1 + 1);
        if (v32)
        {
          for (uint64_t i = 0LL; i != v32; ++i)
            *(void *)(*((void *)a1 + 3) + 8 * i) = &v30[*(void *)(*((void *)a1 + 3) + 8 * i)
                                                          - *((void *)a1 + 7)];
          uint64_t v31 = (char *)*((void *)a1 + 7);
        }

        *((void *)a1 + 4) = &v30[*((void *)a1 + 4) - (void)v31];
        *((void *)a1 + 6) = &v30[*((void *)a1 + 6) - (void)v31];
        *((void *)a1 + 7) = v30;
      }

      *((void *)a1 + 5) = &v30[v29];
    }

    uint64_t v34 = *((void *)a1 + 2);
    if (*((void *)a1 + 1) >= (unint64_t)(v34 - 4))
    {
      uint64_t v35 = v34 + 10;
      *((void *)a1 + 2) = v35;
      int v36 = realloc(*((void **)a1 + 3), 8 * v35);
      if (!v36) {
        return -1;
      }
      *((void *)a1 + 3) = v36;
    }

    int buffer = v11 + 1;
  }

  if (!*v11)
  {
    int result = *((_DWORD *)a1 + 16);
    switch(result)
    {
      case 0:
        int v37 = *((_DWORD *)a1 + 17);
        if ((v37 & 2) != 0)
        {
          *((_DWORD *)a1 + 17) = v37 & 0xFFFFFFFD;
          return 3;
        }

        else
        {
LABEL_52:
          if (v10 == -1)
          {
            int v39 = a4;
            int v38 = a3;
            int v41 = a5;
            int v40 = a6;
            if (v9 == -1)
            {
              int v10 = *((_DWORD *)a1 + 2);
              int v9 = *((_DWORD *)a1 + 8) - *((_DWORD *)a1 + 12);
            }
          }

          else
          {
            int v39 = a4;
            int v38 = a3;
            int v41 = a5;
            int v40 = a6;
          }

          if (v41) {
            int *v41 = v10;
          }
          if (v40) {
            *int v40 = v9;
          }
          sub_1879CA130((uint64_t)a1);
          int result = 0;
          FILE *v39 = (const char **)*((void *)a1 + 3);
          int *v38 = *((void *)a1 + 1);
        }

        return result;
      case 1:
      case 2:
        return result;
      case 3:
LABEL_24:
        *((_DWORD *)a1 + 16) = 0;
        goto LABEL_33;
      case 4:
LABEL_32:
        *((_DWORD *)a1 + 16) = 2;
LABEL_33:
        char v25 = *v11;
        break;
      default:
        return -1;
    }

    goto LABEL_34;
  }

  if (v12 != 10) {
    goto LABEL_21;
  }
  int v16 = *((_DWORD *)a1 + 16);
  int v15 = *((_DWORD *)a1 + 17);
  *((_DWORD *)a1 + 17) = v15 & 0xFFFFFFFD;
  switch(v16)
  {
    case 0:
      goto LABEL_52;
    case 1:
    case 2:
      goto LABEL_33;
    case 3:
      *((_DWORD *)a1 + 17) = v15 | 2;
LABEL_30:
      *((_DWORD *)a1 + 16) = 0;
      goto LABEL_35;
    case 4:
      *((_DWORD *)a1 + 17) = v15 | 2;
LABEL_26:
      *((_DWORD *)a1 + 16) = 2;
      goto LABEL_35;
    default:
      int result = 0;
      break;
  }

  return result;
}

uint64_t sub_1879CA130(uint64_t result)
{
  **(_BYTE **)(result + 32) = 0;
  int v1 = *(_DWORD *)(result + 68);
  if ((v1 & 1) != 0)
  {
    uint64_t v2 = *(void *)(result + 48);
  }

  else
  {
    uint64_t v2 = *(void *)(result + 48);
    if (*(void *)(result + 32) == v2) {
      goto LABEL_6;
    }
  }

  uint64_t v3 = *(void *)(result + 24);
  uint64_t v4 = *(void *)(result + 8);
  *(void *)(result + 8) = v4 + 1;
  *(void *)(v3 + 8 * v4) = v2;
  *(void *)(*(void *)(result + 24) + 8 * (v4 + 1)) = 0LL;
  uint64_t v5 = *(void *)(result + 32) + 1LL;
  *(void *)(result + 32) = v5;
  *(void *)(result + 48) = v5;
LABEL_6:
  *(_DWORD *)(result + 68) = v1 & 0xFFFFFFFE;
  return result;
}

int tok_str(Tokenizer *a1, const char *a2, int *a3, const char ***a4)
{
  v8.int buffer = a2;
  v8.unint64_t cursor = &a2[strlen(a2)];
  v8.lastchar = v8.cursor;
  return tok_line(a1, &v8, a3, a4, 0LL, 0LL);
}

void sub_1879CA1F8()
{
  __assert_rtn("tty_stty", "tty.c", 1345, "c != 0");
}

void sub_1879CA220()
{
  __assert_rtn("tty_stty", "tty.c", 1348, "c != -1");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A30](*(void *)&a1);
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

speed_t cfgetispeed(const termios *a1)
{
  return MEMORY[0x1895FA4F0](a1);
}

speed_t cfgetospeed(const termios *a1)
{
  return MEMORY[0x1895FA4F8](a1);
}

int cfsetispeed(termios *a1, speed_t a2)
{
  return MEMORY[0x1895FA508](a1, a2);
}

int cfsetospeed(termios *a1, speed_t a2)
{
  return MEMORY[0x1895FA510](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

void endpwent(void)
{
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x1895FB180](__file, __arg0);
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x1895FB288](a1, a2);
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

pid_t fork(void)
{
  return MEMORY[0x1895FB350]();
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

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1895FB428](__stream, a2, *(void *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1895FB478](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x1895FB518](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

pid_t getpgrp(void)
{
  return MEMORY[0x1895FB620]();
}

passwd *getpwent(void)
{
  return (passwd *)MEMORY[0x1895FB658]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB668](a1, a2, a3, a4, a5);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FB670](*(void *)&a1);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB678](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1895FB870]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1895FB8E8](*(void *)&a1, *(void *)&a2);
}

void longjmp(jmp_buf a1, int a2)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t mbstowcs(__int32 *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FBDE8](a1, a2, a3);
}

int mbtowc(__int32 *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FBDF0](a1, a2, a3);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FBF38](a1);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x1895FC178](*(void *)&a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1895FCCC8](a1, a2, *(void *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1895FCCD8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x1895FCE88](a1);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x1895FCE98](*(void *)&a1, a2);
}

void setpwent(void)
{
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x1895FCF48](*(void *)&a1, a2, a3);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1895FCF60](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

int strcoll(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD058](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FD068](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x1895FD0E0](__s1, __s2, __n);
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

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

int strvis(char *a1, const char *a2, int a3)
{
  return MEMORY[0x1895FD1E8](a1, a2, *(void *)&a3);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x1895FD380](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x1895FD390](*(void *)&a1, *(void *)&a2, a3);
}

int tgetent(char *a1, const char *a2)
{
  return MEMORY[0x189616070](a1, a2);
}

int tgetflag(char *a1)
{
  return MEMORY[0x189616078](a1);
}

int tgetnum(char *a1)
{
  return MEMORY[0x189616080](a1);
}

char *__cdecl tgetstr(char *a1, char **a2)
{
  return (char *)MEMORY[0x189616088](a1, a2);
}

char *__cdecl tgoto(const char *a1, int a2, int a3)
{
  return (char *)MEMORY[0x189616090](a1, *(void *)&a2, *(void *)&a3);
}

int tputs(const char *a1, int a2, int (__cdecl *a3)(int))
{
  return MEMORY[0x189616098](a1, *(void *)&a2, a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int unvis(char *a1, int a2, int *a3, int a4)
{
  return MEMORY[0x1895FD488](a1, *(void *)&a2, a3, *(void *)&a4);
}

char *__cdecl vis(char *a1, int a2, int a3, int a4)
{
  return (char *)MEMORY[0x1895FD540](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1895FD638](*(void *)&a1, a2, *(void *)&a3);
}

__int32 *__cdecl wcschr(const __int32 *a1, __int32 a2)
{
  return (__int32 *)MEMORY[0x1895FD668](a1, *(void *)&a2);
}

int wcscmp(const __int32 *a1, const __int32 *a2)
{
  return MEMORY[0x1895FD670](a1, a2);
}

size_t wcscspn(const __int32 *a1, const __int32 *a2)
{
  return MEMORY[0x1895FD688](a1, a2);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x1895FD690](a1);
}

__int32 *__cdecl wcsncat(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x1895FD698](a1, a2, a3);
}

int wcsncmp(const __int32 *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x1895FD6A0](a1, a2, a3);
}

__int32 *__cdecl wcsncpy(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x1895FD6A8](a1, a2, a3);
}

__int32 *__cdecl wcsstr(const __int32 *a1, const __int32 *a2)
{
  return (__int32 *)MEMORY[0x1895FD6C0](a1, a2);
}

uint64_t wcstol(const __int32 *a1, __int32 **a2, int a3)
{
  return MEMORY[0x1895FD6D8](a1, a2, *(void *)&a3);
}

size_t wcstombs(char *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x1895FD6F0](a1, a2, a3);
}

int wctomb(char *a1, __int32 a2)
{
  return MEMORY[0x1895FD720](a1, *(void *)&a2);
}

int wcwidth(__int32 a1)
{
  return MEMORY[0x1895FD728](*(void *)&a1);
}

__int32 *__cdecl wmemcpy(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x1895FD740](a1, a2, a3);
}