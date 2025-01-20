__CFArray *DHCPSDHCPLeaseListCreate()
{
  __CFArray *Mutable;
  unsigned int *v1;
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  uint64_t v4;
  unint64_t v5;
  __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v11;
  BOOL v12;
  double Current;
  int Count;
  CFIndex v15;
  __darwin_time_t tv_sec;
  uint64_t v17;
  CFDictionaryRef ValueAtIndex;
  CFStringRef Value;
  CFStringRef v20;
  uint64_t v21;
  CFDateRef v22;
  timeval v24;
  CFIndex usedBufLen;
  UInt8 buffer[8];
  uint64_t v27;
  CFRange v28;
  v27 = *MEMORY[0x1895F89C0];
  sub_188957464(buffer);
  sub_188957478((uint64_t)buffer, 104857600);
  Mutable = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228]);
  v1 = *(unsigned int **)buffer;
  if (!*(void *)buffer) {
    goto LABEL_24;
  }
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
  do
  {
    if (!*v1) {
      goto LABEL_23;
    }
    v4 = 0LL;
    v5 = 0LL;
    v6 = 0LL;
    do
    {
      v7 = *((void *)v1 + 1);
      if (!*(_DWORD *)(v7 + v4 + 8)) {
        goto LABEL_17;
      }
      if (!v6) {
        v6 = CFDictionaryCreateMutable(0LL, 0LL, v2, v3);
      }
      v8 = v7 + v4;
      v9 = sub_18895739C(*(char **)(v7 + v4));
      v10 = sub_18895739C(**(char ***)(v8 + 16));
      v11 = v10;
      if (v9) {
        v12 = v10 == 0LL;
      }
      else {
        v12 = 1;
      }
      if (v12)
      {
        if (!v9)
        {
          if (!v10) {
            goto LABEL_17;
          }
LABEL_16:
          CFRelease(v11);
          goto LABEL_17;
        }
      }

      else
      {
        CFDictionarySetValue(v6, v9, v10);
      }

      CFRelease(v9);
      if (v11) {
        goto LABEL_16;
      }
LABEL_17:
      ++v5;
      v4 += 24LL;
    }

    while (v5 < *v1);
    if (v6)
    {
      CFArrayAppendValue(Mutable, v6);
      CFRelease(v6);
    }

LABEL_23:
    v1 = (unsigned int *)*((void *)v1 + 4);
  }

  while (v1);
LABEL_24:
  if (!CFArrayGetCount(Mutable))
  {
    CFRelease(Mutable);
    sub_188957500((uint64_t *)buffer);
    return 0LL;
  }

  sub_188957500((uint64_t *)buffer);
  if (Mutable)
  {
    gettimeofday(&v24, 0LL);
    Current = CFAbsoluteTimeGetCurrent();
    Count = CFArrayGetCount(Mutable);
    if (Count >= 1)
    {
      v15 = 0LL;
      tv_sec = v24.tv_sec;
      v17 = Count;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v15);
        Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"lease");
        if (Value)
        {
          v20 = Value;
          v28.length = CFStringGetLength(Value);
          v28.location = 0LL;
          CFStringGetBytes(v20, v28, 0, 0, 0, buffer, 128LL, &usedBufLen);
          buffer[usedBufLen] = 0;
          v21 = strtol((const char *)buffer, 0LL, 0);
          v22 = CFDateCreate(0LL, Current + (double)(v21 - tv_sec));
          CFDictionarySetValue(ValueAtIndex, @"lease", v22);
          CFRelease(v22);
        }

        ++v15;
      }

      while (v17 != v15);
    }
  }

  return Mutable;
}

const void *DHCPSCopyDisabledInterfaces()
{
  v0 = (const __CFDictionary *)SCDynamicStoreCopyValue(0LL, @"com.apple.bootpd.DHCPServer");
  if (!v0) {
    return 0LL;
  }
  v1 = v0;
  Value = CFDictionaryGetValue(v0, @"DisabledInterfaces");
  v3 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v1);
  return v3;
}

CFStringRef sub_18895739C(char *cStr)
{
  CFStringRef result = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (!result) {
    return CFStringCreateWithCString(0LL, cStr, 0);
  }
  return result;
}

void *sub_1889573E4(unsigned int a1, uint64_t a2)
{
  v4 = malloc(0x30uLL);
  if (v4)
  {
    void *v4 = sub_188957A68(a1, a2);
    v4[1] = v5;
    v4[4] = 0LL;
    v4[5] = 0LL;
  }

  return v4;
}

void sub_188957434(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  free((void *)a1);
}

void *sub_188957464(void *result)
{
  result[1] = 0LL;
  result[2] = 0LL;
  *CFStringRef result = 0LL;
  *((_DWORD *)result + 4) = 256;
  return result;
}

void sub_188957478(uint64_t a1, int a2)
{
  if (a2 <= 10) {
    int v2 = 10;
  }
  else {
    int v2 = a2;
  }
  *(_DWORD *)(a1 + 16) = v2;
  int v3 = *(_DWORD *)(a1 + 20);
  int v4 = v3 - v2;
  if (v3 > v2)
  {
    if (v4 <= 0)
    {
      *(void *)(a1 + 8) = 0LL;
      v8 = (void *)a1;
    }

    else
    {
      uint64_t v6 = *(void *)(a1 + 8);
      do
      {
        uint64_t v7 = v6;
        uint64_t v6 = *(void *)(v6 + 40);
        sub_188957434(v7);
        --v4;
      }

      while (v4);
      *(void *)(a1 + 8) = v6;
      v8 = (void *)(v6 + 32);
      if (!v6) {
        v8 = (void *)a1;
      }
    }

    void *v8 = 0LL;
    *(_DWORD *)(a1 + 20) = *(_DWORD *)(a1 + 16);
  }
}

uint64_t sub_188957500(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    do
    {
      uint64_t v3 = *(void *)(result + 32);
      sub_188957434(result);
      uint64_t result = v3;
    }

    while (v3);
  }

  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  return result;
}

uint64_t sub_18895753C(uint64_t *a1, char *__filename)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v3 = fopen(__filename, "r");
  if (v3)
  {
    int v4 = v3;
    int v5 = 0;
    int v6 = 0;
LABEL_3:
    int v7 = v5;
    while (1)
    {
      int v8 = 1023;
      v9 = __s;
      do
      {
        int v10 = fgetc(v4);
        if (v8 >= 1)
        {
          *v9++ = v10;
          --v8;
        }
      }

      while (v10 != 10);
      if (v9 == __s) {
        break;
      }
      char *v9 = 0;
      ++v6;
      if (!(*(unsigned __int16 *)__s ^ 0xA7B | v33))
      {
        int v5 = 1;
        if (v7 && v7 != 3)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "unexpected '{' at line %d\n");
          goto LABEL_35;
        }

        goto LABEL_3;
      }

      if (!(*(unsigned __int16 *)__s ^ 0xA7D | v33))
      {
        if ((v7 - 3) <= 0xFFFFFFFD)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "unexpected '}' at line %d\n");
          goto LABEL_35;
        }

        int v5 = 3;
        if ((_DWORD)v24)
        {
          v17 = sub_1889573E4(v24, v25);
          if (v17)
          {
            uint64_t v19 = *a1;
            uint64_t v18 = a1[1];
            v17[4] = 0LL;
            v17[5] = v18;
            v20 = (void *)(v18 + 32);
            if (!v19) {
              v20 = a1;
            }
            void *v20 = v17;
            a1[1] = (uint64_t)v17;
            ++*((_DWORD *)a1 + 5);
          }

          sub_188957A00((unsigned int *)&v24);
          int v5 = 3;
        }

        goto LABEL_3;
      }

      bzero(v30, 0x300uLL);
      int v11 = strlen(__s);
      v12 = strchr(__s, 61);
      int v13 = strspn(__s, " \t\n");
      if (v13 != v11)
      {
        if (v12)
        {
          unsigned int v14 = (_DWORD)v12 - __s;
          int v15 = v14 - v13;
          if (v14 - v13 >= 0x80)
          {
            int v15 = 127;
            fprintf((FILE *)*MEMORY[0x1895F89D0], "property name truncated to %d bytes at line %d\n", 127, v6);
            unsigned int v14 = (_DWORD)v12 - __s;
          }

          unsigned int v16 = v11 - v14 - 2;
          if (v16 >= 0x300)
          {
            unsigned int v16 = 767;
            fprintf((FILE *)*MEMORY[0x1895F89D0], "value truncated to %d bytes at line %d\n", 767, v6);
          }

          __strncpy_chk();
          v31[v15] = 0;
          __strncpy_chk();
          v30[v16] = 0;
          *((void *)&v28 + 1) = 0LL;
          uint64_t v29 = 0LL;
          *(void *)&__int128 v28 = v31;
          sub_188957BB8((uint64_t)&v28 + 8, v30, 0LL);
        }

        else
        {
          unsigned int v21 = ~v13 + v11;
          if (v21 >= 0x80)
          {
            unsigned int v21 = 127;
            fprintf((FILE *)*MEMORY[0x1895F89D0], "property name truncated to %d bytes at line %d\n", 127, v6);
          }

          __strncpy_chk();
          v31[v21] = 0;
          *((void *)&v28 + 1) = 0LL;
          uint64_t v29 = 0LL;
          *(void *)&__int128 v28 = v31;
        }

        __int128 v26 = v28;
        uint64_t v27 = v29;
        sub_1889578EC((int *)&v24, (uint64_t)&v26, 0xFFFFFFFFFFFFFFFFLL);
        sub_188957B50((void *)&v28 + 1);
        int v5 = 2;
        goto LABEL_3;
      }
    }

LABEL_35:
    fclose(v4);
  }

  else
  {
    perror(__filename);
  }

  sub_188957A00((unsigned int *)&v24);
  return 1LL;
}

uint64_t sub_1889578EC(int *a1, uint64_t a2, unint64_t a3)
{
  int v6 = (void *)*((void *)a1 + 1);
  unsigned int v7 = *a1;
  unsigned int v8 = *a1 + 1;
  if (v6)
  {
    v9 = (char *)realloc(v6, 24LL * v8);
    unsigned int v7 = *a1;
  }

  else
  {
    v9 = (char *)malloc(24LL * v8);
  }

  *((void *)a1 + 1) = v9;
  unint64_t v10 = v7;
  if (v7 <= a3)
  {
    a3 = v7;
  }

  else
  {
    uint64_t v11 = 24LL * v7;
    do
    {
      uint64_t v12 = *((void *)a1 + 1) + v11;
      --v10;
      *(_OWORD *)uint64_t v12 = *(_OWORD *)(v12 - 24);
      *(void *)(v12 + 16) = *(void *)(v12 - 8);
      v11 -= 24LL;
    }

    while (v10 > a3);
    v9 = (char *)*((void *)a1 + 1);
  }

  int v13 = (char **)&v9[24 * a3];
  unsigned int v14 = *(const char **)a2;
  uint64_t v15 = *(void *)(a2 + 8);
  unsigned int v16 = *(const char ***)(a2 + 16);
  v17 = strdup(v14);
  uint64_t result = sub_188957AEC(v15, v16);
  *int v13 = v17;
  v13[1] = (char *)result;
  v13[2] = v19;
  ++*a1;
  return result;
}

void sub_1889579D0(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0LL;
  }

  sub_188957B50((void *)(a1 + 8));
}

void sub_188957A00(unsigned int *a1)
{
  int v2 = (void *)*((void *)a1 + 1);
  if (v2)
  {
    if (*a1)
    {
      uint64_t v3 = 0LL;
      unint64_t v4 = 0LL;
      do
      {
        sub_1889579D0(*((void *)a1 + 1) + v3);
        ++v4;
        v3 += 24LL;
      }

      while (v4 < *a1);
      int v2 = (void *)*((void *)a1 + 1);
    }

    free(v2);
    *(void *)a1 = 0LL;
    *((void *)a1 + 1) = 0LL;
  }

uint64_t sub_188957A68(unsigned int a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = (char *)malloc(24LL * a1);
  if (v3)
  {
    int v5 = v4 + 16;
    int v6 = (const char ***)(a2 + 16);
    uint64_t v7 = v3;
    do
    {
      *(v5 - 2) = strdup((const char *)*(v6 - 2));
      *(v5 - 1) = sub_188957AEC(*(v6 - 1), *v6);
      *int v5 = v8;
      v5 += 3;
      v6 += 3;
      --v7;
    }

    while (v7);
  }

  return v3;
}

uint64_t sub_188957AEC(unsigned int a1, const char **a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = (char **)malloc(8LL * a1);
  if (v3)
  {
    int v5 = v4;
    uint64_t v6 = v3;
    do
    {
      uint64_t v7 = *a2++;
      *v5++ = strdup(v7);
      --v6;
    }

    while (v6);
  }

  return v3;
}

void sub_188957B50(void *a1)
{
  int v2 = (void *)a1[1];
  if (v2)
  {
    unint64_t v3 = *(unsigned int *)a1;
    if ((_DWORD)v3)
    {
      for (unint64_t i = 0LL; i < v3; ++i)
      {
        uint64_t v5 = a1[1];
        uint64_t v6 = *(void **)(v5 + 8 * i);
        if (v6)
        {
          free(v6);
          *(void *)(v5 + 8 * i) = 0LL;
          unint64_t v3 = *(unsigned int *)a1;
        }
      }

      int v2 = (void *)a1[1];
    }

    free(v2);
    *a1 = 0LL;
    a1[1] = 0LL;
  }

char *sub_188957BB8(uint64_t a1, const char *a2, unint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 8);
  LODWORD(v7) = *(_DWORD *)a1;
  if (v6)
  {
    uint64_t v8 = realloc(v6, 8LL * (*(_DWORD *)a1 + 1));
    LODWORD(v7) = *(_DWORD *)a1;
  }

  else
  {
    uint64_t v8 = malloc(8LL * (v7 + 1));
  }

  *(void *)(a1 + 8) = v8;
  unint64_t v7 = v7;
  unint64_t v9 = v7;
  if (v7 > a3)
  {
    unint64_t v10 = v7;
    do
    {
      *(void *)(*(void *)(a1 + 8) + 8 * v10) = *(void *)(*(void *)(a1 + 8) + 8 * v10 - 8);
      --v10;
    }

    while (v10 > a3);
    uint64_t v8 = *(void **)(a1 + 8);
    unint64_t v9 = a3;
  }

  uint64_t result = strdup(a2);
  v8[v9] = result;
  *(_DWORD *)a1 = v7 + 1;
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x18960C1C0](store, key);
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1895F8A18]();
}

void bzero(void *a1, size_t a2)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x1895FB280](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void perror(const char *a1)
{
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD140](__s, __charset);
}