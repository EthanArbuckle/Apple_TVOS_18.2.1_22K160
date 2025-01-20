double sub_100002660(void *a1, uint64_t a2)
{
  void *v2;
  double result;
  v2 = sub_100002D84(a1, a2);
  *v2 = &off_1000041C8;
  result = 0.0;
  *(_OWORD *)(v2 + 3) = 0u;
  *(_OWORD *)(v2 + 5) = 0u;
  *(_OWORD *)(v2 + 7) = 0u;
  *(_OWORD *)(v2 + 9) = 0u;
  *(_OWORD *)(v2 + 11) = 0u;
  *(_OWORD *)(v2 + 13) = 0u;
  *(_OWORD *)(v2 + 15) = 0u;
  return result;
}

uint64_t sub_1000026A0(uint64_t a1)
{
  uint64_t v6 = 255LL;
  uint64_t v2 = sub_100002ED0(a1);
  if (!(_DWORD)v2)
  {
    sub_100003484(a1, &v6);
    v3 = &unk_100003B84;
    if (v6 == 1) {
      int v4 = 3;
    }
    else {
      int v4 = 2;
    }
    if (v6 == 1) {
      v3 = &unk_100003B78;
    }
    *(_DWORD *)(a1 + 124) = v4;
    *(void *)(a1 + 128) = v3;
  }

  return v2;
}

void sub_100002714(const char *a1, const char *a2, const char *a3, const void *a4, size_t a5)
{
  size_t v10 = strlen(a1);
  size_t v11 = v10 + strlen(a2) + 2;
  v12 = (char *)malloc(v11);
  snprintf(v12, v11, "%s/%s", a1, a2);
  printf("writing to file %s \n", v12);
  v13 = fopen(v12, a3);
  if (v13)
  {
    v14 = v13;
    fwrite(a4, a5, 1uLL, v13);
    fclose(v14);
  }

  else
  {
    puts("Error in opening output file for section data");
  }

  free(v12);
}

uint64_t sub_1000027EC(uint64_t a1)
{
  *(_DWORD *)(a1 + 120) = 0;
  if (!*(_DWORD *)(a1 + 124)) {
    return 0LL;
  }
  uint64_t v2 = 0LL;
  for (i = (uint64_t *)(a1 + 32); ; i += 4)
  {
    uint64_t v4 = sub_100003328(a1, *(unsigned int *)(*(void *)(a1 + 128) + 4 * v2), i, 1uLL);
    if ((_DWORD)v4) {
      break;
    }
    uint64_t v5 = *i;
    *(_DWORD *)(a1 + 120) += *i;
    int v6 = *(_DWORD *)(*(void *)(a1 + 128) + 4 * v2);
    *((_DWORD *)i - 2) = v6;
    printf("section %u size is %llu bytes\n", v6, v5);
  }

  uint64_t v7 = v4;
  fwrite("getSectionsSizes not responsive assuming retimer not active \n", 0x3DuLL, 1uLL, __stderrp);
  return v7;
}

uint64_t sub_1000028C4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 124);
  if (v1)
  {
    unint64_t v3 = 0LL;
    uint64_t v4 = (void **)(a1 + 48);
    do
    {
      if (*(v4 - 2))
      {
        uint64_t v5 = calloc(1uLL, (size_t)*(v4 - 1));
        *uint64_t v4 = v5;
        if (!v5) {
          return 5LL;
        }
        uint64_t v6 = sub_1000033B8(a1, *((unsigned int *)v4 - 6), v5, (size_t)*(v4 - 1), 1uLL);
        if ((_DWORD)v6)
        {
          uint64_t v9 = v6;
          fwrite("\t<ERROR: getSectionData\n", 0x18uLL, 1uLL, __stderrp);
          free(*v4);
          *uint64_t v4 = 0LL;
          return v9;
        }

        uint64_t v7 = sub_1000029C0(a1, *((_DWORD *)v4 - 6));
        CStringPtr = CFStringGetCStringPtr(v7, 0);
        printf("got data done filename is %s \n", CStringPtr);
        int v1 = *(_DWORD *)(a1 + 124);
      }

      ++v3;
      v4 += 4;
    }

    while (v3 < v1);
  }

  return 0LL;
}

CFStringRef sub_1000029C0(uint64_t a1, int a2)
{
  else {
    uint64_t v2 = off_100004210[a2 - 3];
  }
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@_%@.bin", v2, *(void *)(a1 + 8));
}

uint64_t sub_100002A20(uint64_t result, unsigned int a2)
{
  if (*(_DWORD *)(result + 124))
  {
    uint64_t v2 = result;
    unint64_t v3 = 0LL;
    float v4 = (float)a2;
    uint64_t v5 = (unint64_t *)(result + 40);
    do
    {
      unint64_t v6 = (unint64_t)(float)((float)((float)*(v5 - 1) / (float)*(unsigned int *)(v2 + 120)) * v4) & 0xFFFFFFFFFFFFFFFCLL;
      *uint64_t v5 = v6;
      result = printf("size to read for section %u is %llu\n", *((_DWORD *)v5 - 4), v6);
      ++v3;
      v5 += 4;
    }

    while (v3 < *(int *)(v2 + 124));
  }

  return result;
}

void sub_100002AB8(uint64_t a1, const char *a2)
{
  if (*(_DWORD *)(a1 + 124))
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = (const void **)(a1 + 48);
    do
    {
      if (*(v5 - 2) && *v5)
      {
        unint64_t v6 = sub_1000029C0(a1, *((_DWORD *)v5 - 6));
        CStringPtr = CFStringGetCStringPtr(v6, 0);
        if (CStringPtr) {
          sub_100002714(a2, CStringPtr, "wb", *v5, (size_t)*(v5 - 1));
        }
      }

      ++v4;
      v5 += 4;
    }

    while (v4 < *(int *)(a1 + 124));
  }
}

void sub_100002B50(uint64_t a1, const char *a2)
{
  char v7 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  if (sub_10000343C(a1, outputStruct, 0x80uLL))
  {
    puts("Error in reading FW version");
  }

  else
  {
    unint64_t v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@_version.txt", *(void *)(a1 + 8));
    CStringPtr = CFStringGetCStringPtr(v4, 0);
    sub_100002714(a2, CStringPtr, "w", outputStruct, 0x80uLL);
  }

void sub_100002C24(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 124);
  if (v1)
  {
    unint64_t v3 = 0LL;
    unint64_t v4 = (void **)(a1 + 48);
    do
    {
      if (*v4)
      {
        free(*v4);
        *unint64_t v4 = 0LL;
        int v1 = *(_DWORD *)(a1 + 124);
      }

      ++v3;
      v4 += 4;
    }

    while (v3 < v1);
  }

uint64_t sub_100002C7C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 120);
}

char *sub_100002C84(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v3 = (char *)operator new(0x88uLL);
  sub_100002E6C((uint64_t)v3, a2);
  *(void *)unint64_t v3 = &off_1000041C8;
  *(_OWORD *)(v3 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(v3 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(v3 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(v3 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(v3 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a2 + 56);
  return v3;
}

void sub_100002D08(_Unwind_Exception *a1)
{
}

void sub_100002D1C(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = sub_100002DD8(a2);
    operator delete(v2);
  }

void *sub_100002D3C(void *a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  *a1 = &off_100004270;
  a1[1] = v3;
  a1[2] = 0LL;
  return a1;
}

void *sub_100002D84(void *result, uint64_t a2)
{
  *result = &off_100004270;
  result[1] = a2;
  result[2] = 0LL;
  return result;
}

uint64_t sub_100002D98(uint64_t a1, io_object_t object)
{
  *(void *)a1 = &off_100004270;
  IOObjectRetain(object);
  *(void *)(a1 + 8) = 0LL;
  *(_DWORD *)(a1 + 16) = object;
  *(_DWORD *)(a1 + 20) = 0;
  return a1;
}

void *sub_100002DD8(void *a1)
{
  *a1 = &off_100004270;
  sub_100002E1C((uint64_t)a1);
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  a1[1] = 0LL;
  return a1;
}

uint64_t sub_100002E1C(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2)
  {
    IOConnectRelease(v2);
    *(_DWORD *)(a1 + 20) = 0;
  }

  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 16) = 0;
  }

  return result;
}

void sub_100002E58(void *a1)
{
}

uint64_t sub_100002E6C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &off_100004270;
  *(void *)(a1 + 8) = CFStringCreateCopy(kCFAllocatorDefault, *(CFStringRef *)(a2 + 8));
  io_object_t v4 = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 16) = v4;
  IOObjectRetain(v4);
  io_connect_t v5 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 20) = v5;
  IOConnectAddRef(v5);
  return a1;
}

uint64_t sub_100002ED0(uint64_t a1)
{
  io_service_t MatchingService = *(_DWORD *)(a1 + 16);
  if (MatchingService) {
    return IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)(a1 + 20));
  }
  CFStringRef v3 = IOServiceMatching("AppleTypeCRetimer");
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"atcrt-name", *(const void **)(a1 + 8));
  CFDictionaryAddValue(v3, @"IOPropertyMatch", Mutable);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  *(_DWORD *)(a1 + 16) = MatchingService;
  if (MatchingService) {
    return IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)(a1 + 20));
  }
  else {
    return 56LL;
  }
}

uint64_t sub_100002F9C(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a2;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 0, &v4, 1u, 0LL, 0LL);
  }
  else {
    return 5LL;
  }
}

uint64_t sub_100003010(uint64_t a1, BOOL *a2)
{
  uint32_t outputCnt = 1;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (!v2) {
    return 5LL;
  }
  uint64_t result = IOConnectCallScalarMethod(v2, 1u, 0LL, 0, &output, &outputCnt);
  *a2 = output == 1;
  return result;
}

uint64_t sub_1000030A0(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a2;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 3u, &v4, 1u, 0LL, 0LL);
  }
  else {
    return 5LL;
  }
}

uint64_t sub_100003114(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 2u, &v4, 1u, 0LL, 0LL);
  }
  else {
    return 5LL;
  }
}

__CFArray *sub_100003184()
{
  v0 = IOServiceMatching("AppleTypeCRetimer");
  mach_error_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v0, &existing);
  if (MatchingServices)
  {
    mach_port_t v2 = __stderrp;
    CFStringRef v3 = mach_error_string(MatchingServices);
    fprintf(v2, "ERROR: failed to get matching services: %s\n", v3);
    return 0LL;
  }

  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      io_object_t v5 = IOIteratorNext(existing);
      if (v5)
      {
        io_registry_entry_t v6 = v5;
        do
        {
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v6, @"atcrt-name", kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            v8 = CFProperty;
            CFArrayAppendValue(Mutable, CFProperty);
            CFRelease(v8);
            IOObjectRelease(v6);
          }

          else
          {
            fprintf(__stderrp, "ERROR: failed to get %s property from a %s node\n", "atcrt-name", "AppleTypeCRetimer");
          }

          io_registry_entry_t v6 = IOIteratorNext(existing);
        }

        while (v6);
      }

      IOObjectRelease(existing);
      v11.length = CFArrayGetCount(Mutable);
      v11.location = 0LL;
      CFArraySortValues(Mutable, v11, (CFComparatorFunction)&CFStringCompare, 0LL);
    }

    else
    {
      fwrite("ERROR: failed to allocate an array\n", 0x23uLL, 1uLL, __stderrp);
    }
  }

  return Mutable;
}

uint64_t sub_100003328(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  input[0] = a2;
  input[1] = a4;
  uint32_t outputCnt = 1;
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  if (!v4) {
    return 5LL;
  }
  uint64_t result = IOConnectCallScalarMethod(v4, 4u, input, 2u, &output, &outputCnt);
  if (!(_DWORD)result) {
    *a3 = output;
  }
  return result;
}

uint64_t sub_1000033B8(uint64_t a1, uint64_t a2, void *outputStruct, size_t a4, uint64_t a5)
{
  input[0] = a2;
  input[1] = a5;
  size_t v7 = a4;
  mach_port_t v5 = *(_DWORD *)(a1 + 20);
  if (v5) {
    return IOConnectCallMethod(v5, 5u, input, 2u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v7);
  }
  else {
    return 5LL;
  }
}

uint64_t sub_10000343C(uint64_t a1, void *outputStruct, size_t a3)
{
  size_t v4 = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v4);
}

uint64_t sub_100003484(uint64_t a1, uint64_t *a2)
{
  uint32_t outputCnt = 1;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (!v2) {
    return 5LL;
  }
  uint64_t result = IOConnectCallScalarMethod(v2, 7u, 0LL, 0, &output, &outputCnt);
  *a2 = output;
  return result;
}

uint64_t start(int a1, uint64_t a2)
{
  CFStringRef v3 = *(const char **)(a2 + 8);
  puts("atcrtcomm v0.1");
  if (a1 <= 1)
  {
    printf("Path not provided");
    return 1LL;
  }

  mach_port_t v5 = sub_100003184();
  CFIndex Count = CFArrayGetCount(v5);
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, (const CFArrayCallBacks *)&unk_1000041D0);
  if (Count)
  {
    for (CFIndex i = 0LL; i != Count; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v5, i);
      size_t v10 = operator new(0x88uLL);
      double v11 = sub_100002660(v10, (uint64_t)ValueAtIndex);
      if ((*(unsigned int (**)(void *, double))*v10)(v10, v11))
      {
        fwrite("\t<ERROR: in open interface>\n", 0x1CuLL, 1uLL, __stderrp);
      }

      else if (!sub_1000027EC((uint64_t)v10))
      {
        CFIndex Length = CFStringGetLength(ValueAtIndex);
        CFIndex v13 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
        v14 = (char *)malloc(v13);
        if (v14)
        {
          v15 = v14;
          if (CFStringGetCString(ValueAtIndex, v14, v13, 0x8000100u)) {
            printf("\t%s\n", v15);
          }
          else {
            fwrite("\t<ERROR: converting string>\n", 0x1CuLL, 1uLL, __stderrp);
          }
          free(v15);
        }

        else
        {
          fwrite("\t<ERROR: no memory for string malloc>\n", 0x26uLL, 1uLL, __stderrp);
        }

        CFArrayAppendValue(Mutable, v10);
      }

      v16 = sub_100002DD8(v10);
      operator delete(v16);
    }
  }

  if (v5) {
    CFRelease(v5);
  }
  if (!CFArrayGetCount(Mutable))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 1LL;
  }

  CFIndex v17 = CFArrayGetCount(Mutable);
  if (v17)
  {
    CFIndex v18 = v17;
    for (CFIndex j = 0LL; j != v18; ++j)
    {
      v20 = CFArrayGetValueAtIndex(Mutable, j);
      sub_100002B50((uint64_t)v20, v3);
    }
  }

  CFIndex v21 = CFArrayGetCount(Mutable);
  unsigned int v22 = 0;
  if (v21)
  {
    for (CFIndex k = 0LL; k != v21; ++k)
    {
      v24 = CFArrayGetValueAtIndex(Mutable, k);
      v22 += sub_100002C7C((uint64_t)v24);
    }
  }

  v25 = CFArrayGetValueAtIndex(Mutable, 0LL);
  uint64_t v43 = 255LL;
  sub_100003484((uint64_t)v25, &v43);
  if (v43 == 1) {
    int v26 = 27800;
  }
  else {
    int v26 = 0;
  }
  if (v43) {
    unsigned int v27 = v26;
  }
  else {
    unsigned int v27 = 10800;
  }
  unsigned int v28 = ((double)v27 * 4.49999999);
  printf("transfer_rate %d approx_total_size %d \n", v27, v28);
  if (v21)
  {
    for (CFIndex m = 0LL; m != v21; ++m)
    {
      v30 = CFArrayGetValueAtIndex(Mutable, m);
      unsigned int v31 = sub_100002C7C((uint64_t)v30);
      unsigned int v32 = v31;
      if (v22 > v28) {
        unsigned int v32 = (float)((float)((float)v31 / (float)v22) * (float)v28);
      }
      sub_100002A20((uint64_t)v30, v32);
    }
  }

  if (CFArrayGetCount(Mutable))
  {
    unint64_t v33 = 0LL;
    do
    {
      v34 = CFArrayGetValueAtIndex(Mutable, v33);
      ++v33;
    }

    while (v33 < CFArrayGetCount(Mutable));
  }

  CFIndex v35 = CFArrayGetCount(Mutable);
  if (v35)
  {
    CFIndex v36 = v35;
    for (CFIndex n = 0LL; n != v36; ++n)
    {
      v38 = CFArrayGetValueAtIndex(Mutable, n);
      sub_100002AB8((uint64_t)v38, v3);
    }
  }

  CFIndex v39 = CFArrayGetCount(Mutable);
  if (v39)
  {
    CFIndex v40 = v39;
    for (iCFIndex i = 0LL; ii != v40; ++ii)
    {
      v42 = CFArrayGetValueAtIndex(Mutable, ii);
      sub_100002C24((uint64_t)v42);
      sub_100002E1C((uint64_t)v42);
      puts("closed interface ");
    }
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  return 0LL;
}

void sub_10000390C(_Unwind_Exception *a1)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}