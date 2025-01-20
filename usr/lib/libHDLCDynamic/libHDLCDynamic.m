double HDLCFrameFree(uint64_t a1)
{
  void *v2;
  double result;
  v2 = *(void **)(a1 + 24);
  if (v2) {
    free(v2);
  }
  if (*(void *)a1) {
    free(*(void **)a1);
  }
  *(void *)(a1 + 32) = 0LL;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t HDLCFrameCreateDownlink( uint64_t a1, uint64_t a2, int a3, _DWORD *a4, uint64_t a5, unsigned int a6, int a7, char a8)
{
  *(void *)(a1 + 32) = 0LL;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *a4 = 0;
  if (!a3) {
    return 0LL;
  }
  uint64_t v12 = 0LL;
  while (1)
  {
    int v13 = *(unsigned __int8 *)(a2 + v12);
    if (v13 != 126) {
      break;
    }
    *a4 = ++v12;
    if (a3 == (_DWORD)v12) {
      return 0LL;
    }
  }

  uint64_t v14 = 0LL;
  LODWORD(v15) = 0;
  v16 = (char *)(a2 + v12);
  int v17 = 1;
  do
  {
    if (a3 - (_DWORD)v12 == v17) {
      return 0LL;
    }
    if (v13 == 125) {
      size_t v15 = v15;
    }
    else {
      size_t v15 = (v15 + 1);
    }
    int v13 = *(unsigned __int8 *)(a2 + v14 + v12 + 1);
    ++v17;
    ++v14;
  }

  while (v13 != 126);
  *a4 = v12 + v14 + 1;
  uint64_t result = (uint64_t)malloc(v15);
  *(void *)a1 = result;
  if (!result) {
    return result;
  }
  BOOL v19 = 0;
  int v20 = -(int)v14;
  int v21 = v15;
  do
  {
    if (!v21)
    {
      *(_DWORD *)(a1 + 8) = 0;
LABEL_31:
      HDLCFrameFree(a1);
      return 0LL;
    }

    int v22 = *v16;
    if (v22 != 125)
    {
      if (v19) {
        char v23 = v22 | 0x20;
      }
      else {
        char v23 = *v16;
      }
      *(_BYTE *)result++ = v23;
      --v21;
    }

    ++v16;
    BOOL v19 = v22 == 125;
  }

  while (!__CFADD__(v20++, 1));
  unsigned int v25 = v15 - v21;
  *(_DWORD *)(a1 + 8) = v15 - v21;
  if (v21) {
    goto LABEL_31;
  }
  unsigned int v26 = v25 - 2;
  if (v25 < 2) {
    goto LABEL_31;
  }
  v27 = *(unsigned __int8 **)a1;
  do
  {
    int v28 = *v27++;
    a6 = FCSTable[v28 ^ a6] ^ (a6 >> 8);
    --v25;
  }

  while (v25);
  *(_WORD *)(a1 + 16) = a6;
  uint64_t result = 1LL;
  *(_DWORD *)(a1 + 8) = v26;
  *(_DWORD *)(a1 + 12) = v15;
  if ((a8 & 1) != 0 && a6 != a7) {
    goto LABEL_31;
  }
  return result;
}

BOOL HDLCFrameCreateDownlinkFake(uint64_t a1, const void *a2, size_t __size)
{
  int v3 = __size;
  *(void *)(a1 + 32) = 0LL;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  size_t v6 = __size;
  v7 = malloc(__size);
  v8 = v7;
  *(void *)a1 = v7;
  if (v7)
  {
    *(_WORD *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 8) = v3;
    *(_DWORD *)(a1 + 12) = v3;
    memcpy(v7, a2, v6);
  }

  return v8 != 0LL;
}

BOOL HDLCFrameCreateUplink(uint64_t a1, size_t __size, __int16 a3)
{
  int v4 = __size;
  *(void *)(a1 + 32) = 0LL;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  size_t v6 = malloc(__size);
  *(void *)a1 = v6;
  if (v6)
  {
    *(_DWORD *)(a1 + 12) = v4;
    *(_WORD *)(a1 + 16) = a3;
  }

  return v6 != 0LL;
}

BOOL HDLCFrameInject(uint64_t a1, char *a2, size_t __n)
{
  unsigned int v3 = __n;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  unsigned int v5 = *(_DWORD *)(a1 + 12) - v4;
  if (v5 >= __n)
  {
    LOWORD(v7) = *(_WORD *)(a1 + 16);
    if ((_DWORD)__n)
    {
      v8 = a2;
      int v9 = __n;
      do
      {
        char v10 = *v8++;
        int v7 = FCSTable[(v10 ^ v7)] ^ ((unsigned __int16)(v7 & 0xFF00) >> 8);
        --v9;
      }

      while (v9);
    }

    *(_WORD *)(a1 + 16) = v7;
    memcpy((void *)(*(void *)a1 + v4), a2, __n);
    *(_DWORD *)(a1 + 8) += v3;
  }

  return v5 >= v3;
}

uint64_t HDLCFrameGetFreeSpace(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 12) - *(_DWORD *)(a1 + 8));
}

uint64_t HDLCFrameEncode(uint64_t *a1, _BYTE *__b, unsigned int a3, size_t __len)
{
  uint64_t result = 0LL;
  unsigned int v6 = a3 - __len;
  uint64_t v7 = *a1;
  if (!*a1) {
    return result;
  }
  unsigned int v8 = __len;
  char v10 = __b;
  if ((_DWORD)__len)
  {
    memset(__b, 126, __len);
    v10 += v8;
    uint64_t v7 = *a1;
  }

  else
  {
    unsigned int v6 = a3;
  }

  unint64_t v11 = *((unsigned int *)a1 + 2);
  if (!(_DWORD)v11)
  {
    uint64_t v14 = v10;
LABEL_16:
    char v16 = 0;
    uint64_t v17 = 0LL;
    __int16 v21 = ~*((_WORD *)a1 + 8);
    do
    {
      char v18 = v16;
      int v19 = *((unsigned __int8 *)&v21 + v17);
      if ((v19 - 125) > 1)
      {
        unsigned int v20 = v6;
        if (!v6) {
          return 0LL;
        }
      }

      else
      {
        if (!v6) {
          return 0LL;
        }
        *v14++ = 125;
        LOBYTE(v19) = v19 & 0xDF;
        unsigned int v20 = v6 - 1;
        if (v6 == 1) {
          return 0LL;
        }
      }

      *v14++ = v19;
      unsigned int v6 = v20 - 1;
      char v16 = 1;
      uint64_t v17 = 1LL;
    }

    while ((v18 & 1) == 0);
    if (v20 != 1)
    {
      *uint64_t v14 = 126;
      return a3 - v20 + 2;
    }

    return 0LL;
  }

  uint64_t v12 = 0LL;
  BOOL v13 = 0;
  uint64_t v14 = v10;
  while (1)
  {
    int v15 = *(unsigned __int8 *)(v7 + v12);
    if ((v15 - 125) <= 1)
    {
      if (!v6) {
        break;
      }
      *v14++ = 125;
      LOBYTE(v15) = v15 & 0xDF;
      --v6;
    }

    if (!v6) {
      break;
    }
    *v14++ = v15;
    --v6;
    BOOL v13 = ++v12 >= v11;
    if (v11 == v12) {
      goto LABEL_16;
    }
  }

  unsigned int v6 = 0;
  uint64_t result = 0LL;
  uint64_t v14 = v10;
  if (v13) {
    goto LABEL_16;
  }
  return result;
}

uint64_t HDLCFrameGetMaxEncodedLength(unsigned __int8 **a1)
{
  int v1 = *((_DWORD *)a1 + 2);
  if (v1)
  {
    v2 = *a1;
    int v3 = 2;
    uint64_t v4 = *((unsigned int *)a1 + 2);
    do
    {
      int v5 = *v2++;
      --v4;
    }

    while (v4);
    int v6 = v3 + 4;
  }

  else
  {
    int v6 = 6;
  }

  return (v6 + v1);
}

uint64_t HDLCFrameEncodeAndCache(unsigned __int8 **a1, size_t a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  if (v4)
  {
    int v5 = *a1;
    int v6 = 2;
    uint64_t v7 = *((unsigned int *)a1 + 2);
    do
    {
      int v8 = *v5++;
      --v7;
    }

    while (v7);
    int v9 = v6 + 4;
  }

  else
  {
    int v9 = 6;
  }

  if (a1[3]) {
    return 0LL;
  }
  unsigned int v11 = v9 + v4;
  uint64_t result = (uint64_t)malloc((v9 + v4));
  a1[3] = (unsigned __int8 *)result;
  if (result)
  {
    *((_DWORD *)a1 + 8) = HDLCFrameEncode((uint64_t *)a1, (_BYTE *)result, v11, a2);
    return 1LL;
  }

  return result;
}

uint64_t HDLCFrameCloneDownlink(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (*(void *)a2 && *(_DWORD *)(a2 + 12) >= *(_DWORD *)(a2 + 8))
    {
      *(void *)(a1 + 32) = 0LL;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
      uint64_t result = (uint64_t)malloc(*(unsigned int *)(a2 + 12));
      *(void *)a1 = result;
      if (result)
      {
        memcpy((void *)result, *(const void **)a2, *(unsigned int *)(a2 + 8));
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

BOOL HDLCFrameInjectUnsignedInt(uint64_t a1, int a2)
{
  int v3 = a2;
  return HDLCFrameInject(a1, (char *)&v3, 4uLL);
}

BOOL HDLCFrameInjectUnsignedShort(uint64_t a1, __int16 a2)
{
  __int16 v3 = a2;
  return HDLCFrameInject(a1, (char *)&v3, 2uLL);
}

BOOL HDLCFrameInjectUnsignedChar(uint64_t a1, char a2)
{
  char v3 = a2;
  return HDLCFrameInject(a1, &v3, 1uLL);
}

uint64_t CRCCCITT(uint64_t result, char *a2, int a3)
{
  {
    char v3 = *a2++;
    LODWORD(result) = FCSTable[(v3 ^ result)] ^ ((unsigned __int16)(result & 0xFF00) >> 8);
  }

  return (unsigned __int16)result;
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