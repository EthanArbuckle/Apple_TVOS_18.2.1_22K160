uint64_t DIHLDiskImageAttach()
{
  return 4294967246LL;
}

uint64_t DIGetBundleRef()
{
  if (pthread_mutex_lock(&stru_18C703418)) {
    return 0LL;
  }
  if (!qword_18C7034A8)
  {
    *__error() = 0;
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.DiskImagesFramework");
    qword_18C7034A8 = (uint64_t)BundleWithIdentifier;
    if (BundleWithIdentifier)
    {
      CFRetain(BundleWithIdentifier);
    }

    else if (dword_18C7034B0)
    {
      v1 = __error();
      sub_188263964("DIGetBundleRef returned NULL, error %d\n", *v1);
    }
  }

  if (pthread_mutex_unlock(&stru_18C703418)) {
    return 0LL;
  }
  else {
    return qword_18C7034A8;
  }
}

void sub_1882383F8(void *context, CFDictionaryRef theDict, unint64_t a3)
{
  if (a3 <= 2) {
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)off_18A20D6D8[a3], context);
  }
}

void sub_188238424(const void *a1, const void *a2, void *cf)
{
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID()) {
    CFDictionarySetValue((CFMutableDictionaryRef)cf, a1, a2);
  }
}

void DIAddPermission(__CFDictionary *a1, int a2)
{
  if (a1)
  {
    if (a2 == 3)
    {
      v2 = (const void **)MEMORY[0x189604DE8];
      goto LABEL_7;
    }

    if (a2 == 1)
    {
      v2 = (const void **)MEMORY[0x189604DE0];
LABEL_7:
      CFDictionarySetValue(a1, @"writeable", *v2);
      return;
    }

    CFDictionaryRemoveValue(a1, @"writeable");
  }
}

uint64_t DI_kextExists()
{
  mach_port_t v0 = *MEMORY[0x1896086B0];
  v1 = IOServiceMatching("IOHDIXController");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (!MatchingService) {
    return 3758097088LL;
  }
  IOObjectRelease(MatchingService);
  return 0LL;
}

uint64_t DIInitialize()
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (pthread_mutex_lock(&stru_18C7033D8)) {
    return *__error();
  }
  if ((byte_18C7034A0 & 1) != 0)
  {
LABEL_63:
    uint64_t result = pthread_mutex_unlock(&stru_18C7033D8);
    if (!(_DWORD)result) {
      return result;
    }
    return *__error();
  }

  *__error() = 0;
  if (DIGetBundleRef())
  {
    dword_18C7034A4 = getpid();
    int v32 = dword_18C7034A4;
    sysctlbyname("vfs.generic.noremotehang", 0LL, 0LL, &v32, 4uLL);
    v1 = (const __CFString *)sub_188238A30();
    if (!sub_188238A38(v1, 0))
    {
      if (v1) {
        CFRelease(v1);
      }
      v1 = (const __CFString *)sub_188238A30();
      sub_188238A38(v1, 0);
    }

    if (v1) {
      CFRelease(v1);
    }
    v2 = (const __CFString *)sub_188238A30();
    if (sub_188238A38(v2, 0))
    {
      int v3 = v32;
      v4 = getprogname();
      if (v4)
      {
        v5 = v4;
        if (snprintf(__str, 0x400uLL, "%s%s", "/tmp/", "DiskImages-debug/") <= 1023
          && (mkdir(__str, 0x3FFu) != -1 || *__error() == 17)
          && snprintf(v34, 0x400uLL, "%s%s.%d.txt", __str, v5, v3) <= 1023)
        {
          int v6 = open(v34, 2818, 384LL);
          if (v6 == -1)
          {
            sub_188267D34();
            if (!v2) {
              goto LABEL_23;
            }
            goto LABEL_22;
          }

          int v7 = v6;
          dup2(v6, 1);
          dup2(v7, 2);
          if (v7 >= 3) {
            close(v7);
          }
        }
      }
    }

    if (!v2)
    {
LABEL_23:
      if (qword_18C703460)
      {
        CFRelease((CFTypeRef)qword_18C703460);
        qword_18C703460 = 0LL;
      }

      qword_18C703460 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
      int v8 = sub_188238C54();
      if (v8 >= 1)
      {
        uint64_t v9 = v8;
        v10 = &off_18C703098;
        do
        {
          if (*v10)
          {
            v11 = (const void *)(*v10)();
            sub_188238D5C(v11);
            if (v11) {
              CFRelease(v11);
            }
          }

          v10 += 7;
          --v9;
        }

        while (v9);
      }

      int v12 = sub_188238EC4(1);
      if (v12 >= 1)
      {
        uint64_t v13 = v12;
        v14 = off_18C703140;
        do
        {
          if (*v14)
          {
            v15 = (const void *)(*v14)();
            sub_188238D5C(v15);
            if (v15) {
              CFRelease(v15);
            }
          }

          v14 += 7;
          --v13;
        }

        while (v13);
      }

      int v16 = sub_188238EC4(2);
      if (v16 >= 1)
      {
        uint64_t v17 = v16;
        v18 = &off_18C7031B0;
        do
        {
          if (*v18)
          {
            v19 = (const void *)(*v18)();
            sub_188238D5C(v19);
            if (v19) {
              CFRelease(v19);
            }
          }

          v18 += 7;
          --v17;
        }

        while (v17);
      }

      int v20 = sub_188238EC4(3);
      if (v20 >= 1)
      {
        uint64_t v21 = v20;
        v22 = (uint64_t (**)(void))&qword_18C703468;
        do
        {
          if (*v22)
          {
            v23 = (const void *)(*v22)();
            sub_188238D5C(v23);
            if (v23) {
              CFRelease(v23);
            }
          }

          v22 += 7;
          --v21;
        }

        while (v21);
      }

      int v24 = sub_1882391FC();
      if (v24 >= 1)
      {
        uint64_t v25 = v24;
        v26 = (uint64_t (**)(void))&qword_18C703220;
        do
        {
          if (*v26)
          {
            v27 = (const void *)(*v26)();
            sub_188238D5C(v27);
            if (v27) {
              CFRelease(v27);
            }
          }

          v26 += 11;
          --v25;
        }

        while (v25);
      }

      *__error() = 0;
      v28 = (const __CFString *)sub_188238A30();
      int v29 = sub_188238A38(v28, 0);
      byte_18C703458 = v29;
      if (getenv("DISKIMAGEOBJECTTRACKING")) {
        int v30 = 1;
      }
      else {
        int v30 = v29;
      }
      byte_18C703458 = v30;
      if (v28)
      {
        CFRelease(v28);
        int v30 = byte_18C703458;
      }

      if (v30)
      {
        printf("\x1B[7mDIInitialize: starting DiskImageObject tracking\n\x1B[0m");
        sub_18825B138();
      }

      int v32 = -v32;
      sysctlbyname("vfs.generic.noremotehang", 0LL, 0LL, &v32, 4uLL);
      byte_18C7034A0 = 1;
      goto LABEL_63;
    }

LABEL_22:
    CFRelease(v2);
    goto LABEL_23;
  }

  unsigned int v31 = *__error();
  pthread_mutex_unlock(&stru_18C7033D8);
  if (v31) {
    return v31;
  }
  else {
    return 119LL;
  }
}

    v11 = v5;
    uint64_t v13 = (const char *)DIStrError(v5);
    warnx("updateHeader failed - %s", v13);
    return v11;
  }

  v10 = *(void *)(a1 + 160) + *(void *)(a1 + 152);
  if (v10 <= *(void *)(a1 + 352) + *(void *)(a1 + 344)) {
    v10 = *(void *)(a1 + 352) + *(void *)(a1 + 344);
  }
  if (v10 <= *(void *)(a1 + 176) + *(void *)(a1 + 168)) {
    v10 = *(void *)(a1 + 176) + *(void *)(a1 + 168);
  }
  v14 = (v10 & ~(v10 >> 63)) + 512;
  v5 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 312LL))(v2);
  if ((_DWORD)v5) {
    goto LABEL_22;
  }
  int v6 = (*(uint64_t (**)(void, uint64_t *))(**(void **)(a1 + 112) + 296LL))(*(void *)(a1 + 112), &v14);
  if (!(_DWORD)v6)
  {
    int v7 = (const void *)(a1 + 128);
    int v8 = *(void *)(a1 + 112);
    uint64_t v9 = v14 - 512;
    return sub_188245FD0(v8, v7, v9);
  }

  return v6;
}

    CFRelease(v19);
    goto LABEL_23;
  }

  return v14;
}

uint64_t sub_1882389A4()
{
  if (pthread_mutex_lock(&stru_18C7033D8)) {
    return 0LL;
  }
  if (byte_18C7034A0 == 1)
  {
    if (dword_18C7034A4)
    {
      if (getpid() == dword_18C7034A4)
      {
        unsigned int v0 = 1;
        goto LABEL_9;
      }

      dword_18C7034A4 = 0;
    }

    unsigned int v0 = 0;
    byte_18C7034A0 = 0;
  }

  else
  {
    unsigned int v0 = 0;
  }

LABEL_9:
  if (pthread_mutex_unlock(&stru_18C7033D8)) {
    return 0LL;
  }
  else {
    return v0;
  }
}

  if (v4) {
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
  }
  return Mutable;
}

      int v7 = 0LL;
      goto LABEL_10;
    }

    if (((*(uint64_t (**)(uint64_t *))(v5 + 592))(a1) & 1) != 0)
    {
      Code = 4294967242LL;
      goto LABEL_8;
    }

    if (!*((_BYTE *)a1 + 778))
    {
      uint64_t v25 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
      Code = (*(uint64_t (**)(uint64_t, char **))(*(void *)v25 + 344LL))(v25, &v29);
      if (!(_DWORD)Code) {
        (*(void (**)(uint64_t *, char *))(*a1 + 648))(a1, v29);
      }
      goto LABEL_8;
    }

    uint64_t v9 = a1[57];
    if (!v9)
    {
      if (!a1[95] || !a1[96])
      {
        Code = 4294967257LL;
        goto LABEL_8;
      }

      goto LABEL_52;
    }

    error = 0LL;
    v10 = (UInt8 *)malloc(v9 + 1);
    if (!v10)
    {
      uint64_t v17 = 0LL;
      v19 = 0LL;
      v22 = 0LL;
      Code = *__error();
      goto LABEL_36;
    }

    v11 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
    int v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 272LL))(v11);
    if ((_DWORD)v12)
    {
      Code = v12;
    }

    else
    {
      uint64_t v13 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
      Code = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, UInt8 *))(*(void *)v13 + 328LL))( v13,  a1[56],  a1[57],  &v27,  v10);
      v14 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
      (*(void (**)(uint64_t, void))(*(void *)v14 + 280LL))(v14, 0LL);
      if (!(_DWORD)Code)
      {
        v15 = v27;
        v10[v27] = 0;
        int v16 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        uint64_t v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v10, v15 + 1);
        if (!v17)
        {
          v19 = 0LL;
          v22 = 0LL;
          goto LABEL_57;
        }

        v18 = (const __CFDictionary *)CFPropertyListCreateWithData(v16, v17, 0LL, &format, &error);
        if (v18)
        {
          v19 = v18;
          *((_BYTE *)a1 + 780) = format == kCFPropertyListBinaryFormat_v1_0;
          int v20 = CFGetTypeID(v18);
          if (v20 != CFDictionaryGetTypeID())
          {
            v22 = 0LL;
            Code = 107LL;
            goto LABEL_36;
          }

          Value = (__CFDictionary *)CFDictionaryGetValue(v19, @"resource-fork");
          v22 = Value;
          if (Value)
          {
            CFRetain(Value);
            v23 = sub_18823E548(v22, 1, &v29);
            if ((_DWORD)v23)
            {
              Code = v23;
            }

            else
            {
              int v24 = (*(uint64_t (**)(char *))(*(void *)v29 + 48LL))(v29);
              Code = v24;
              if ((_DWORD)v24 && v29)
              {
                DIDiskImageObjectRelease(v29);
                int v29 = 0LL;
              }

              else if (!(_DWORD)v24)
              {
                (*(void (**)(uint64_t *, char *))(*a1 + 648))(a1, v29);
                sub_18823ADA4(v29);
                *((_BYTE *)a1 + 779) = 1;
              }
            }

  if (*(_BYTE *)(a1 + 115))
  {
    Value = (const __CFData *)CFDictionaryGetValue(theDict, @"Data");
    if (!Value || (v10 = Value, v11 = CFGetTypeID(Value), v11 != CFDataGetTypeID()))
    {
      v14 = 4294967097LL;
      goto LABEL_15;
    }

    Length = CFDataGetLength(v10);
    sub_1882661D0(v18, Length);
    uint64_t v13 = sub_1882660D4();
    if ((_DWORD)v13)
    {
      v14 = v13;
      goto LABEL_15;
    }

    v19.location = 0LL;
    v19.length = Length;
    CFDataGetBytes(v10, v19, *(UInt8 **)v18);
    uint64_t v17 = 0;
    sub_1882661D4();
    nullsub_4(v18);
    sub_18823E874(theDict, @"ID", &v17);
    sub_1882660D4();
    nullsub_4(v18);
    int v16 = 0;
    sub_1882661D4();
    sub_18823E874(theDict, @"Attributes", &v16);
    nullsub_4(v18);
  }

  free(v11);
  return v17;
}

uint64_t sub_188238A30()
{
  return 0LL;
}

uint64_t sub_188238A38(const __CFString *a1, unsigned __int8 a2)
{
  unsigned __int8 v6 = a2;
  int v3 = sub_188238A78(a1, &v6);
  unsigned __int8 v4 = v6;
  if (!v3) {
    return a2;
  }
  return v4;
}

uint64_t sub_188238A78(const __CFString *a1, _BYTE *a2)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFBooleanGetTypeID())
  {
    CFTypeID v6 = CFGetTypeID(a1);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t v5 = 1LL;
      if (CFStringCompare(a1, @"YES", 1uLL) == kCFCompareEqualTo)
      {
        *a2 = 1;
        return v5;
      }

      uint64_t v5 = 1LL;
      if (CFStringCompare(a1, @"TRUE", 1uLL) == kCFCompareEqualTo
        || (uint64_t v5 = 1LL, CFStringCompare(a1, @"1", 1uLL) == kCFCompareEqualTo))
      {
        *a2 = 1;
        return v5;
      }

      if (CFStringCompare(a1, @"NO", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(a1, @"FALSE", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(a1, @"0", 1uLL) == kCFCompareEqualTo)
      {
        *a2 = 0;
        return 1LL;
      }
    }

    else
    {
      CFTypeID v7 = CFGetTypeID(a1);
      if (v7 == CFNumberGetTypeID() && CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &valuePtr))
      {
        *a2 = valuePtr != 0.0;
        return 1LL;
      }
    }

    return 0LL;
  }

  *a2 = CFBooleanGetValue((CFBooleanRef)a1);
  return 1LL;
}

uint64_t sub_188238BE8(char *bsdName)
{
  if (!bsdName) {
    return 0LL;
  }
  mach_port_t v1 = *MEMORY[0x1896086B0];
  v2 = IOBSDNameMatching(*MEMORY[0x1896086B0], 0, bsdName);
  if (!v2) {
    return 0LL;
  }
  int v3 = v2;
  CFDictionarySetValue(v2, @"IOProviderClass", @"IOMedia");
  return IOServiceGetMatchingService(v1, v3);
}

uint64_t sub_188238C54()
{
  if (!off_18C7030C0) {
    return 0LL;
  }
  LODWORD(result) = 0;
  mach_port_t v1 = &off_18C7030F8;
  do
  {
    uint64_t result = (result + 1);
    v2 = *v1;
    v1 += 7;
  }

  while (v2);
  return result;
}

__CFDictionary *sub_188238C84()
{
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  4LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    int v1 = DIGetBundleRef();
    CFTypeRef v2 = sub_1882660CC(v1, (int)@"BSD backing store", @"BSD backing store");
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CBackingStore");
    CFDictionaryAddValue(Mutable, @"plugin-type", @"builtin");
    CFDictionaryAddValue(Mutable, @"plugin-name", v2);
    CFDictionaryAddValue(Mutable, @"plugin-key", @"CBSDBackingStore");
    if (v2) {
      CFRelease(v2);
    }
  }

  return Mutable;
}

void sub_188238D5C(const void *a1)
{
  if (a1)
  {
    CFTypeID v2 = CFGetTypeID(a1);
    if (v2 == CFDictionaryGetTypeID())
    {
      CFArrayAppendValue((CFMutableArrayRef)qword_18C703460, a1);
    }

    else
    {
      CFTypeID v3 = CFGetTypeID(a1);
      if (v3 == CFArrayGetTypeID())
      {
        CFTypeID v4 = (__CFArray *)qword_18C703460;
        v5.length = CFArrayGetCount((CFArrayRef)a1);
        v5.location = 0LL;
        CFArrayAppendArray(v4, (CFArrayRef)a1, v5);
      }
    }
  }

__CFDictionary *sub_188238DEC()
{
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    int v1 = DIGetBundleRef();
    CFTypeRef v2 = sub_1882660CC(v1, (int)@"vectored backing store", @"vectored backing store");
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CBackingStore");
    CFDictionaryAddValue(Mutable, @"plugin-type", @"builtin");
    CFDictionaryAddValue(Mutable, @"plugin-name", v2);
    CFDictionaryAddValue(Mutable, @"plugin-key", @"CVectoredBackingStore");
    if (v2) {
      CFRelease(v2);
    }
  }

  return Mutable;
}

uint64_t sub_188238EC4(int a1)
{
  int v1 = off_18A20A8B8[a1 - 1];
  if (!v1[5]) {
    return 0LL;
  }
  LODWORD(result) = 0;
  CFTypeID v3 = (uint64_t *)(v1 + 12);
  do
  {
    uint64_t result = (result + 1);
    uint64_t v4 = *v3;
    v3 += 7;
  }

  while (v4);
  return result;
}

__CFArray *sub_188238F04()
{
  unsigned int v0 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  CFTypeRef v2 = CFDictionaryCreateMutable(v0, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  int v3 = DIGetBundleRef();
  CFTypeRef v4 = sub_1882660CC(v3, (int)@"128-bit AES encryption", @"128-bit AES encryption");
  CFDictionaryAddValue(v2, @"plugin-class", @"CFileEncoding");
  CFDictionaryAddValue(v2, @"plugin-type", @"builtin");
  CFDictionaryAddValue(v2, @"plugin-name", v4);
  CFDictionaryAddValue(v2, @"plugin-key", @"AES-128");
  CFRange v5 = (const void *)*MEMORY[0x189604DE8];
  CFDictionaryAddValue(v2, @"plugin-encryption", (const void *)*MEMORY[0x189604DE8]);
  if (v4) {
    CFRelease(v4);
  }
  CFArrayAppendValue(Mutable, v2);
  if (v2) {
    CFRelease(v2);
  }
  CFTypeID v6 = CFDictionaryCreateMutable(v0, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  int v7 = DIGetBundleRef();
  CFTypeRef v8 = sub_1882660CC( v7,  (int)@"256-bit AES encryption (recommended)",  @"256-bit AES encryption (recommended)");
  CFDictionaryAddValue(v6, @"plugin-class", @"CFileEncoding");
  CFDictionaryAddValue(v6, @"plugin-type", @"builtin");
  CFDictionaryAddValue(v6, @"plugin-name", v8);
  CFDictionaryAddValue(v6, @"plugin-key", @"AES-256");
  CFDictionaryAddValue(v6, @"plugin-encryption", v5);
  if (v8) {
    CFRelease(v8);
  }
  CFArrayAppendValue(Mutable, v6);
  if (v6) {
    CFRelease(v6);
  }
  return Mutable;
}

__CFDictionary *sub_188239108()
{
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    int v1 = DIGetBundleRef();
    CFTypeRef v2 = sub_1882660CC(v1, (int)@"UDIF encoding", @"UDIF encoding");
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CFileEncoding");
    CFDictionaryAddValue(Mutable, @"plugin-type", @"builtin");
    CFDictionaryAddValue(Mutable, @"plugin-name", v2);
    CFDictionaryAddValue(Mutable, @"plugin-key", @"CUDIFEncoding");
    CFDictionaryAddValue(Mutable, @"plugin-encryption", (const void *)*MEMORY[0x189604DE0]);
    if (v2) {
      CFRelease(v2);
    }
  }

  return Mutable;
}

uint64_t sub_1882391FC()
{
  if (!off_18C703268) {
    return 0LL;
  }
  LODWORD(result) = 0;
  int v1 = &off_18C7032C0;
  do
  {
    uint64_t result = (result + 1);
    CFTypeRef v2 = *v1;
    v1 += 11;
  }

  while (v2);
  return result;
}

__CFDictionary *sub_18823922C()
{
  unsigned int v0 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFTypeRef v2 = Mutable;
  if (Mutable)
  {
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CDiskImage");
    CFDictionaryAddValue(v2, @"plugin-type", @"builtin");
    int v3 = DIGetBundleRef();
    CFTypeRef v4 = sub_1882660CC(v3, (int)@"UDIF disk image", @"UDIF disk image");
    CFDictionaryAddValue(v2, @"plugin-name", v4);
    if (v4) {
      CFRelease(v4);
    }
    CFDictionaryAddValue(v2, @"plugin-key", @"CUDIFDiskImage");
    CFRange v5 = CFArrayCreateMutable(v0, 0LL, MEMORY[0x189605228]);
    CFTypeID v6 = (const void *)*MEMORY[0x189604DE0];
    sub_18825C624( v5,  @"read-only",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"read-only format",  @"UDRO",  @"dmg",  (const void *)*MEMORY[0x189604DE0]);
    int v7 = (const void *)*MEMORY[0x189604DE8];
    sub_18825C624( v5,  @"compressed (ADC)",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"compressed format with ADC",  @"UDCO",  @"dmg",  (const void *)*MEMORY[0x189604DE8]);
    sub_18825C624( v5,  @"compressed",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"compressed format with zlib",  @"UDZO",  @"dmg",  v6);
    sub_18825C624( v5,  @"compressed (lzfse)",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"compressed format with lzfse",  @"ULFO",  @"dmg",  v7);
    sub_18825C624( v5,  @"entire device",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"complete format",  @"UFBI",  @"dmg",  v7);
    sub_18825C624( v5,  @"iPod image",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"complete format",  @"IPOD",  @"ipodimage",  v7);
    CFDictionaryAddValue(v2, @"plugin-diskimage-convert", v5);
    if (v5) {
      CFRelease(v5);
    }
    CFTypeRef v8 = CFArrayCreateMutable(v0, 0LL, MEMORY[0x189605228]);
    sub_18825C884( v8,  @"CRC-32 image checksum",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"UDIF CRC-32 image checksum",  @"UDIF-CRC32",  v6);
    sub_18825C884( v8,  @"MD5 image checksum",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"UDIF MD5 image checksum",  @"UDIF-MD5",  v7);
    sub_18825C884( v8,  @"iPod image checksum",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"iPod image checksum",  @"IPOD",  v7);
    CFDictionaryAddValue(v2, @"plugin-diskimage-checksum", v8);
    if (v8) {
      CFRelease(v8);
    }
  }

  return v2;
}

__CFDictionary *sub_18823952C()
{
  unsigned int v0 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFTypeRef v2 = Mutable;
  if (Mutable)
  {
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CDiskImage");
    CFDictionaryAddValue(v2, @"plugin-type", @"builtin");
    int v3 = DIGetBundleRef();
    CFTypeRef v4 = sub_1882660CC(v3, (int)@"sparse disk image", @"sparse disk image");
    CFDictionaryAddValue(v2, @"plugin-name", v4);
    if (v4) {
      CFRelease(v4);
    }
    CFDictionaryAddValue(v2, @"plugin-key", @"CSparseDiskImage");
    CFRange v5 = CFArrayCreateMutable(v0, 0LL, MEMORY[0x189605228]);
    CFTypeID v6 = (const void *)*MEMORY[0x189604DE8];
    sub_18825C624( v5,  @"sparse",  (uint64_t)@"CSparseDiskImage",  (uint64_t)@"sparse format",  @"UDSP",  @"sparseimage",  (const void *)*MEMORY[0x189604DE8]);
    CFDictionaryAddValue(v2, @"plugin-diskimage-convert", v5);
    if (v5) {
      CFRelease(v5);
    }
    int v7 = CFArrayCreateMutable(v0, 0LL, MEMORY[0x189605228]);
    sub_18825C734( v7,  @"sparse disk image",  (uint64_t)@"CSparseDiskImage",  (uint64_t)@"name of disk image we create",  @"SPARSE",  @"sparseimage",  (const void *)*MEMORY[0x189604DE0],  v6,  0LL);
    CFDictionaryAddValue(v2, @"plugin-diskimage-create", v7);
    if (v7) {
      CFRelease(v7);
    }
  }

  return v2;
}

__CFDictionary *sub_188239704()
{
  unsigned int v0 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    int v2 = DIGetBundleRef();
    CFTypeRef v3 = sub_1882660CC(v2, (int)@"raw disk image", @"raw disk image");
    CFDictionaryAddValue(Mutable, @"plugin-class", @"CDiskImage");
    CFDictionaryAddValue(Mutable, @"plugin-type", @"builtin");
    CFDictionaryAddValue(Mutable, @"plugin-name", v3);
    CFDictionaryAddValue(Mutable, @"plugin-key", @"CRawDiskImage");
    if (v3) {
      CFRelease(v3);
    }
    CFTypeRef v4 = (const CFArrayCallBacks *)MEMORY[0x189605228];
    CFRange v5 = CFArrayCreateMutable(v0, 0LL, MEMORY[0x189605228]);
    CFTypeID v6 = (const void *)*MEMORY[0x189604DE0];
    sub_18825C624( v5,  @"read/write",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"type of disk image we create",  @"UDRW",  @"dmg",  (const void *)*MEMORY[0x189604DE0]);
    sub_18825C624( v5,  @"DVD/CD master",  (uint64_t)@"CUDIFDiskImage",  (uint64_t)@"type of disk image we create",  @"UDTO",  @"cdr",  v6);
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-convert", v5);
    int v7 = CFArrayCreateMutable(v0, 0LL, v4);
    CFTypeRef v8 = (const void *)*MEMORY[0x189604DE8];
    sub_18825C884( v7,  @"CRC-32",  (uint64_t)@"CRawDiskImage",  (uint64_t)@"raw CRC-32 checksum",  @"CRC32",  (const void *)*MEMORY[0x189604DE8]);
    sub_18825C884( v7,  @"MD5",  (uint64_t)@"CRawDiskImage",  (uint64_t)@"raw MD5 checksum",  @"MD5",  v8);
    sub_18825C884( v7,  @"SHA",  (uint64_t)@"CRawDiskImage",  (uint64_t)@"raw SHA checksum",  @"SHA",  v8);
    sub_18825C884( v7,  @"SHA-1",  (uint64_t)@"CRawDiskImage",  (uint64_t)@"raw SHA-1 checksum",  @"SHA1",  v8);
    sub_18825C884( v7,  @"SHA-256",  (uint64_t)@"CRawDiskImage",  (uint64_t)@"raw SHA-256 checksum",  @"SHA256",  v8);
    sub_18825C884( v7,  @"SHA-384",  (uint64_t)@"CRawDiskImage",  (uint64_t)@"raw SHA-384 checksum",  @"SHA384",  v8);
    sub_18825C884( v7,  @"SHA-512",  (uint64_t)@"CRawDiskImage",  (uint64_t)@"raw SHA-512 checksum",  @"SHA512",  v8);
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-checksum", v7);
    if (v7) {
      CFRelease(v7);
    }
    uint64_t v9 = CFArrayCreateMutable(v0, 0LL, MEMORY[0x189605228]);
    sub_18825C734( v9,  @"read/write disk image",  (uint64_t)@"CRawDiskImage",  (uint64_t)@"type of disk image we create",  @"UDIF",  @"dmg",  v6,  v6,  0LL);
    sub_18825C734( v9,  @"DVD/CD master",  (uint64_t)@"CRawDiskImage",  (uint64_t)@"type of disk image we create",  @"UDTO",  @"cdr",  v6,  v6,  0LL);
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-create", v9);
    if (v9) {
      CFRelease(v9);
    }
    v10 = CFArrayCreateMutable(v0, 0LL, MEMORY[0x189605228]);
    v11 = CFDictionaryCreateMutable(v0, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    int v12 = DIGetBundleRef();
    CFTypeRef v13 = sub_1882660CC(v12, (int)@"hybrid image (HFS+/ISO/UDF)", @"hybrid image (HFS+/ISO/UDF)");
    CFDictionaryAddValue(v11, @"plugin-diskimage-iff-name", v13);
    if (v13) {
      CFRelease(v13);
    }
    CFDictionaryAddValue(v11, @"plugin-diskimage-iff-key", @"UNIV");
    CFDictionaryAddValue(v11, @"plugin-diskimage-iff-extension", @"dmg");
    CFArrayAppendValue(v10, v11);
    if (v11) {
      CFRelease(v11);
    }
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-iff", v10);
    if (v10) {
      CFRelease(v10);
    }
  }

  return Mutable;
}

uint64_t DIResolveURLToBackingStore(uint64_t a1, uint64_t a2, unsigned int a3, void *a4, CFTypeRef *a5)
{
  CFStringRef appendedString = 0LL;
  uint64_t v17 = 0LL;
  v15 = 0LL;
  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = 0LL;
  }
  uint64_t v10 = 22LL;
  if (a1 && a4)
  {
    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
    if (!Mutable) {
      return 999LL;
    }
    int v12 = Mutable;
    uint64_t v10 = DIBackingStoreNewWithCFURL(a1, a2, (uint64_t)&v17, (uint64_t)&appendedString);
    if (appendedString) {
      CFStringAppend(v12, appendedString);
    }
    if (!(_DWORD)v10)
    {
      if (!a3)
      {
LABEL_34:
        uint64_t v10 = 0LL;
LABEL_35:
        if (appendedString)
        {
          CFRelease(appendedString);
          CFStringRef appendedString = 0LL;
        }

        *a4 = v17;
        if (a5)
        {
          *a5 = v12;
          if (!CFStringGetLength(v12) && *a5)
          {
            CFRelease(*a5);
            *a5 = 0LL;
          }
        }

        else
        {
          CFRelease(v12);
        }

        return v10;
      }

      unsigned int v13 = 0;
      while (1)
      {
        if (((a3 >> v13) & 1) != 0)
        {
          do
          {
            if (appendedString)
            {
              CFRelease(appendedString);
              CFStringRef appendedString = 0LL;
            }

            uint64_t v10 = sub_18823B7E4(v13, (uint64_t)v17, a2, (uint64_t)&v15, (uint64_t)&appendedString);
            if (appendedString) {
              CFStringAppend(v12, appendedString);
            }
            if ((_DWORD)v10 != 110)
            {
              if ((_DWORD)v10) {
                goto LABEL_30;
              }
              if (v17) {
                DIDiskImageObjectRelease(v17);
              }
              uint64_t v17 = v15;
            }
          }

          while (!(v10 | v13));
          uint64_t v10 = 0LL;
LABEL_30:
          if (appendedString)
          {
            CFRelease(appendedString);
            CFStringRef appendedString = 0LL;
          }

          if ((_DWORD)v10) {
            break;
          }
        }

        if (++v13 == 3) {
          goto LABEL_34;
        }
      }
    }

    if (v17)
    {
      DIDiskImageObjectRelease(v17);
      uint64_t v17 = 0LL;
    }

    goto LABEL_35;
  }

  return v10;
}

uint64_t DIBackingStoreNewWithCFURL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!off_18C7030C0) {
    return 110LL;
  }
  int v8 = 0;
  unsigned int v9 = 0;
  uint64_t v10 = &off_18C7030F8;
  unsigned int v11 = -1;
  do
  {
    int v12 = (uint64_t (*)(uint64_t, uint64_t))*(v10 - 11);
    if (v12)
    {
      int v13 = v12(a1, a2);
      if (v13 > v8)
      {
        int v8 = v13;
        unsigned int v11 = v9;
      }
    }

    ++v9;
    v14 = *v10;
    v10 += 7;
  }

  while (v14);
  if ((v11 & 0x80000000) != 0) {
    return 110LL;
  }
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))*(&off_18C703098 + 7 * v11 + 2);
  if (v15) {
    return v15(a1, a2, a3, a4);
  }
  else {
    return 78LL;
  }
}

uint64_t sub_188239E24(const __CFURL *a1, CFDictionaryRef theDict)
{
  if (!a1 || (sub_188239F2C(theDict, @"backingstore-class", @"CBSDBackingStore") & 0x80000000) != 0) {
    return 4294966296LL;
  }
  if (theDict
    && (CFDictionaryGetValueIfPresent(theDict, @"file-type", 0LL)
     || CFDictionaryGetValueIfPresent(theDict, @"file-creator", 0LL)))
  {
    return 4294966296LL;
  }

  CFRange v5 = CFURLCopyScheme(a1);
  if (!v5) {
    return 4294966296LL;
  }
  CFTypeID v6 = v5;
  if (CFStringCompare(v5, @"file", 0LL) || CFURLHasDirectoryPath(a1))
  {
    uint64_t v4 = 4294966296LL;
  }

  else if (sub_188239FFC(a1, &v8))
  {
    uint64_t v4 = 1LL;
  }

  else
  {
    uint64_t v4 = 100LL;
  }

  CFRelease(v6);
  return v4;
}

uint64_t sub_188239F2C(CFDictionaryRef theDict, const void *a2, const __CFString *a3)
{
  uint64_t result = 0LL;
  if (theDict)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t result = CFDictionaryGetValueIfPresent(theDict, a2, (const void **)&value);
        if ((_DWORD)result)
        {
          CFTypeID v6 = CFGetTypeID(value);
          if (v6 == CFStringGetTypeID())
          {
            if (CFStringCompare((CFStringRef)value, a3, 0LL)) {
              return 0xFFFFFFFFLL;
            }
            else {
              return 1LL;
            }
          }

          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_188239FB0(const __CFDictionary *a1, const void *a2, unsigned __int8 a3)
{
  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      unsigned __int8 v6 = a3;
    }
  }

  return a3;
}

uint64_t sub_188239FFC(const __CFURL *a1, stat *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  CFTypeRef v3 = (const char *)sub_18823A054(a1);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = (char *)v3;
  uint64_t v5 = stat(v3, a2);
  if ((v5 & 0x80000000) != 0) {
    uint64_t v5 = *__error();
  }
  free(v4);
  return v5;
}

CFStringRef sub_18823A054(const __CFURL *a1)
{
  uint64_t result = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (result)
  {
    int v2 = result;
    CFTypeRef v3 = sub_18823A098(result, 0x8000100u);
    CFRelease(v2);
    return (const __CFString *)v3;
  }

  return result;
}

void *sub_18823A098(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, a2) + 1;
  unsigned __int8 v6 = malloc(v5);
  if (v6 && !CFStringGetCString(a1, (char *)v6, v5, a2))
  {
    free(v6);
    return 0LL;
  }

  return v6;
}

uint64_t sub_18823A108(const __CFURL *a1, CFDictionaryRef theDict)
{
  if ((sub_188239F2C(theDict, @"backingstore-class", @"CVectoredBackingStore") & 0x80000000) != 0) {
    return 4294966296LL;
  }
  if (theDict
    && (CFDictionaryGetValueIfPresent(theDict, @"file-type", 0LL)
     || CFDictionaryGetValueIfPresent(theDict, @"file-creator", 0LL)))
  {
    return 4294966296LL;
  }

  unsigned __int8 v6 = CFURLCopyScheme(a1);
  uint64_t v4 = 4294966296LL;
  if (v6)
  {
    int v7 = v6;
    if (CFStringCompare(v6, @"vectored", 0LL)) {
      uint64_t v4 = 4294966296LL;
    }
    else {
      uint64_t v4 = 9999LL;
    }
    CFRelease(v7);
  }

  return v4;
}

uint64_t sub_18823A1E4(const __CFURL *a1, const __CFDictionary *a2, char **a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  if (!a1)
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 22LL;
LABEL_16:
    *a3 = v10;
    return v9;
  }

  uint64_t v7 = sub_188239FFC(a1, &v17);
  if ((_DWORD)v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = 0LL;
    goto LABEL_22;
  }

  int v8 = v17.st_mode & 0xF000;
  uint64_t v9 = 102LL;
  if (v8 != 4096 && v8 != 0x4000)
  {
    uint64_t v10 = (char *)operator new(0x178uLL);
    sub_18823A3C8(v10, a2);
    uint64_t v11 = (*(uint64_t (**)(char *, const __CFURL *))(*(void *)v10 + 736LL))(v10, a1);
    if (!(_DWORD)v11)
    {
      uint64_t v12 = sub_18823AC00((uint64_t)a2);
      int v13 = sub_188239FB0(a2, @"exclusive-open-locks-are-optional", 0);
      v14 = (void *)MEMORY[0x189604DE8];
      if (v13) {
        (*(void (**)(char *, const __CFString *, void))(*(void *)v10 + 32LL))( v10,  @"exclusive-open-locks-are-optional",  *MEMORY[0x189604DE8]);
      }
      if (sub_188239FB0(a2, @"skip-permissions-check", 0)
        || (uint64_t v11 = (*(uint64_t (**)(char *, uint64_t))(*(void *)v10 + 80LL))(v10, v12), !(_DWORD)v11))
      {
        if ((*(unsigned int (**)(char *))(*(void *)v10 + 760LL))(v10)) {
          (*(void (**)(char *, const __CFString *, void))(*(void *)v10 + 32LL))( v10,  @"bs-io-scheduling",  *v14);
        }
        sub_18823AC34((uint64_t)v10, a2);
        uint64_t v9 = 0LL;
        v10[369] = sub_188239FB0(a2, @"bs-no-follow", 0);
        goto LABEL_16;
      }
    }

    uint64_t v9 = v11;
LABEL_22:
    if ((v9 & 0x80000000) != 0)
    {
      unsigned int v16 = *__error();
      if (v16) {
        uint64_t v9 = v16;
      }
      else {
        uint64_t v9 = 999LL;
      }
    }

    if (v10)
    {
      sub_18823ADA4(v10);
      uint64_t v10 = 0LL;
    }

    goto LABEL_16;
  }

  return v9;
}

void sub_18823A3B4(_Unwind_Exception *a1)
{
}

void *sub_18823A3C8(void *a1, const __CFDictionary *a2)
{
  CFTypeRef v3 = sub_18823A450(a1, a2);
  *CFTypeRef v3 = off_18A20AC00;
  v3[42] = 0LL;
  v3[43] = 0LL;
  *((_DWORD *)v3 + 80) = -1;
  v3[35] = 0LL;
  *((_DWORD *)v3 + 72) = 0;
  v3[37] = 0LL;
  *((_BYTE *)v3 + 304) = 0;
  v3[41] = 0LL;
  v3[39] = 0LL;
  *((_BYTE *)v3 + 369) = 0;
  sub_18823A7AC((uint64_t)v3, @"thread-safe", (const void *)*MEMORY[0x189604DE8]);
  return a1;
}

void sub_18823A438(_Unwind_Exception *a1)
{
}

void *sub_18823A450(void *a1, const __CFDictionary *a2)
{
  void *v4 = off_18A20DEB0;
  size_t v5 = 0x100000LL;
  int v9 = 0x100000;
  int valuePtr = 4;
  v4[25] = 0LL;
  v4[26] = 0LL;
  if (a2)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, @"bs-cache-depth");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    }
    uint64_t v7 = (const __CFNumber *)CFDictionaryGetValue(a2, @"bs-cache-entry-size");
    if (v7)
    {
      CFNumberGetValue(v7, kCFNumberSInt32Type, &v9);
      size_t v5 = v9;
    }

    else
    {
      size_t v5 = 0x100000LL;
    }
  }

  sub_18823A668(a1, valuePtr, v5);
  return a1;
}

void sub_18823A4F8(_Unwind_Exception *a1)
{
}

double sub_18823A510(uint64_t a1)
{
  uint64_t v1 = sub_18823A554(a1);
  *(void *)uint64_t v1 = off_18A20A928;
  *(_DWORD *)(v1 + 104) = 0;
  *(void *)(v1 + 184) = 0LL;
  *(_BYTE *)(v1 + 192) = 0;
  *(void *)(v1 + 112) = 0LL;
  *(void *)(v1 + 120) = 0LL;
  *(_BYTE *)(v1 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(v1 + 136) = 0u;
  *(_OWORD *)(v1 + 152) = 0u;
  *(_OWORD *)(v1 + 164) = 0u;
  return result;
}

uint64_t sub_18823A554(uint64_t a1)
{
  *(void *)a1 = off_18A20AF30;
  *(void *)(a1 + 80) = 0LL;
  *(_DWORD *)(a1 + 8) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 16), 0LL);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  *(void *)(a1 + 88) = 0LL;
  *(void *)(a1 + 96) = Mutable;
  DIDiskImageObjectRetain_0((char *)a1);
  if (qword_18C7034B8) {
    CFArrayAppendValue((CFMutableArrayRef)qword_18C7034B8, (const void *)a1);
  }
  return a1;
}

uint64_t DIDiskImageObjectRetain_0(char *a1)
{
  int v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v3 = (*((_DWORD *)a1 + 2) + 1);
  *((_DWORD *)a1 + 2) = v3;
  if (qword_18C7034B8)
  {
    uint64_t v4 = (FILE *)*MEMORY[0x1895F89D0];
    size_t v5 = (const char *)(*(uint64_t (**)(char *))(*(void *)a1 + 16LL))(a1);
    fprintf(v4, "\x1B[34m\x1B[43mCDiskImageObject::retain: object %s %p refCount is %d.\x1B[0m\n", v5, a1, v3);
  }

  pthread_mutex_unlock(v2);
  return v3;
}

void *sub_18823A668(void *result, int a2, size_t a3)
{
  if (!result[26])
  {
    uint64_t v5 = (uint64_t)result;
    pthread_mutex_init((pthread_mutex_t *)(result + 27), 0LL);
    unsigned __int8 v6 = operator new(0x30uLL);
    double result = sub_18823A6E4(v6, v5, (uint64_t)sub_188246554, a2, a3);
    *(void *)(v5 + 208) = v6;
  }

  return result;
}

void sub_18823A6D0(_Unwind_Exception *a1)
{
}

void *sub_18823A6E4(void *a1, uint64_t a2, uint64_t a3, int a4, size_t a5)
{
  int v6 = a4;
  a1[4] = a2;
  a1[5] = a3;
  *a1 = off_18A20E198;
  a1[1] = a5;
  uint64_t v10 = calloc((2 * a4) | 1, 0x18uLL);
  a1[2] = 0LL;
  a1[3] = v10;
  if (v6 >= 1)
  {
    uint64_t v11 = 0LL;
    do
    {
      uint64_t v12 = operator new(0x50uLL);
      *uint64_t v12 = off_18A20E1B8;
      v12[6] = a2;
      v12[7] = a3;
      *((_BYTE *)v12 + 8) = 0;
      *((_BYTE *)v12 + 16) = 0;
      *((_DWORD *)v12 + 3) = 0;
      int v13 = malloc(a5);
      v12[3] = 0LL;
      v12[4] = 0LL;
      v12[5] = v13;
      v12[8] = a5;
      v12[9] = v11;
      uint64_t v11 = v12;
      a1[2] = v12;
      --v6;
    }

    while (v6);
  }

  return a1;
}

BOOL sub_18823A7AC(uint64_t a1, void *key, const void *a3)
{
  if (key)
  {
    uint64_t v4 = *(__CFDictionary **)(a1 + 96);
    if (a3) {
      CFDictionarySetValue(v4, key, a3);
    }
    else {
      CFDictionaryRemoveValue(v4, key);
    }
  }

  return key != 0LL;
}

uint64_t sub_18823A7EC(uint64_t a1, const __CFURL *a2)
{
  uint64_t v4 = sub_188239FFC(a2, &v10);
  if (!(_DWORD)v4)
  {
    __darwin_time_t tv_sec = v10.st_mtimespec.tv_sec;
    *(void *)(a1 + 280) = v10.st_ino;
    *(_DWORD *)(a1 + 288) = v10.st_dev;
    *(void *)(a1 + 200) = v10.st_size;
    CFStringRef v6 = CFStringCreateWithFormat(0LL, 0LL, @"%ld", tv_sec);
    if (v6) {
      (*(void (**)(uint64_t, const __CFString *, CFStringRef))(*(void *)a1 + 32LL))( a1,  @"bs-modtime",  v6);
    }
    uint64_t v7 = *(void **)(a1 + 296);
    if (v7)
    {
      free(v7);
      *(void *)(a1 + 296) = 0LL;
    }

    int v8 = sub_18823A054(a2);
    *(void *)(a1 + 296) = v8;
    if (!v8)
    {
      uint64_t v4 = 999LL;
      if (!v6) {
        return v4;
      }
      goto LABEL_8;
    }

    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 728LL))(a1);
    if (v6) {
LABEL_8:
    }
      CFRelease(v6);
  }

  return v4;
}

uint64_t sub_18823A8DC(void *a1, CFURLRef anURL)
{
  if (!anURL) {
    return 22LL;
  }
  CFURLRef v2 = anURL;
  CFStringRef v4 = CFURLCopyUserName(anURL);
  if (!v4) {
    goto LABEL_7;
  }
  CFStringRef v5 = v4;
  CFStringRef v6 = (const __CFURL *)sub_18824D9F0((uint64_t)v2, 0LL, 0LL);
  if (!v6)
  {
    CFRelease(v5);
LABEL_7:
    values = v2;
    CFRetain(v2);
    goto LABEL_8;
  }

  uint64_t v7 = v6;
  values = v6;
  CFRelease(v5);
  CFURLRef v2 = v7;
LABEL_8:
  int v9 = (const void *)a1[18];
  if (v9) {
    CFRelease(v9);
  }
  a1[18] = v2;
  CFStringRef v10 = CFURLCopyPath(v2);
  (*(void (**)(void *, CFStringRef))(*a1 + 512LL))(a1, v10);
  if (v10) {
    CFRelease(v10);
  }
  CFStringRef PathComponent = CFURLCopyLastPathComponent(v2);
  (*(void (**)(void *, CFStringRef))(*a1 + 520LL))(a1, PathComponent);
  if (PathComponent) {
    CFRelease(PathComponent);
  }
  CFStringRef v12 = CFURLCopyPathExtension(v2);
  (*(void (**)(void *, CFStringRef))(*a1 + 528LL))(a1, v12);
  if (v12) {
    CFRelease(v12);
  }
  CFArrayRef v13 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)&values, 1LL, MEMORY[0x189605228]);
  (*(void (**)(void *, CFArrayRef))(*a1 + 536LL))(a1, v13);
  if (v13) {
    CFRelease(v13);
  }
  return 0LL;
}

void sub_18823AA44(uint64_t a1, CFTypeRef cf)
{
  CFStringRef v4 = *(const void **)(a1 + 136);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 136) = cf;
  if (cf) {
    CFRetain(cf);
  }
}

void sub_18823AA88(uint64_t a1, CFTypeRef cf)
{
  CFStringRef v4 = *(const void **)(a1 + 112);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 112) = cf;
  if (cf) {
    CFRetain(cf);
  }
}

void sub_18823AACC(uint64_t a1, CFTypeRef cf)
{
  CFStringRef v4 = *(const void **)(a1 + 120);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 120) = cf;
  if (cf) {
    CFRetain(cf);
  }
}

void sub_18823AB10(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  CFStringRef v4 = *(const void **)(a1 + 152);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 152) = cf;
}

uint64_t sub_18823AB4C(uint64_t a1)
{
  CFStringRef v2 = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"d%d:i%llu",  *(unsigned int *)(a1 + 288),  *(void *)(a1 + 280));
  if (!v2) {
    return 999LL;
  }
  CFStringRef v3 = v2;
  (*(void (**)(uint64_t, CFStringRef))(*(void *)a1 + 552LL))(a1, v2);
  CFRelease(v3);
  return 0LL;
}

void sub_18823ABC8(uint64_t a1, CFTypeRef cf)
{
  CFStringRef v4 = *(const void **)(a1 + 160);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 160) = cf;
}

uint64_t sub_18823AC00(uint64_t result)
{
  if (result)
  {
    double result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, @"writeable");
    if (result)
    {
      if (CFBooleanGetValue((CFBooleanRef)result)) {
        return 3LL;
      }
      else {
        return 1LL;
      }
    }
  }

  return result;
}

uint64_t sub_18823AC34(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (sub_188239FB0(a2, @"di-bsd-log-io", 0))
  {
    CFStringRef v4 = basename(*(char **)(a1 + 296));
    pid_t v5 = getpid();
    snprintf(__str, 0x400uLL, "/tmp/%s-%d.log", v4, v5);
    syslog(5, "CBSDBackingStore: using log file: %s\n", __str);
    *(void *)(a1 + 328) = fopen(__str, "a");
  }

  else {
    sub_18823B0C4(a1);
  }
  return 0LL;
}

uint64_t sub_18823AD88(uint64_t a1)
{
  return *(void *)(a1 + 160);
}

uint64_t DIDiskImageObjectRelease(char *a1)
{
  return sub_18823ADA4(a1);
}

uint64_t sub_18823ADA4(char *a1)
{
  if (!a1) {
    return 0LL;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  int v2 = *((_DWORD *)a1 + 2);
  *((_DWORD *)a1 + 2) = v2 - 1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  if (!qword_18C7034B8)
  {
    if (v2 != 1) {
      return 0LL;
    }
LABEL_9:
    (*(void (**)(char *))(*(void *)a1 + 8LL))(a1);
    return 1LL;
  }

  if (v2 < 2)
  {
    CFStringRef v4 = (FILE *)*MEMORY[0x1895F89D0];
    pid_t v5 = (const char *)(*(uint64_t (**)(char *))(*(void *)a1 + 16LL))(a1);
    if (v2 != 1)
    {
      fprintf(v4, "\x1B[33m\x1B[44mCDiskImageObject::release: object %s %p \x1B[5m\x1B[7mrefCount is %d.\x1B[0m\n");
      return 0LL;
    }

    fprintf( v4,  "\x1B[33m\x1B[44mCDiskImageObject::release: object %s %p refCount is %d. \x1B[7mfreeing object.\x1B[0m\n",  v5,  a1,  0);
    goto LABEL_9;
  }

  CFStringRef v3 = (FILE *)*MEMORY[0x1895F89D0];
  (*(void (**)(char *))(*(void *)a1 + 16LL))(a1);
  fprintf(v3, "\x1B[33m\x1B[44mCDiskImageObject::release: object %s %p refCount is %d.\x1B[0m\n");
  return 0LL;
}

void sub_18823AEBC(void *a1)
{
}

void sub_18823AEE0(_Unwind_Exception *a1)
{
}

void *sub_18823AEF4(uint64_t a1)
{
  int v2 = off_18A20AC00;
  *(void *)a1 = off_18A20AC00;
  CFStringRef v3 = *(FILE **)(a1 + 328);
  if (v3)
  {
    fclose(v3);
    int v2 = *(uint64_t (***)())a1;
  }

  ((void (*)(uint64_t, uint64_t))v2[35])(a1, 1LL);
  *(void *)(a1 + 280) = 0LL;
  *(_DWORD *)(a1 + 288) = 0;
  *(void *)(a1 + 200) = 0LL;
  CFStringRef v4 = *(void **)(a1 + 296);
  if (v4)
  {
    free(v4);
    *(void *)(a1 + 296) = 0LL;
  }

  pid_t v5 = *(const void **)(a1 + 312);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 312) = 0LL;
  }

  return sub_18823B060(a1);
}

void sub_18823AF6C(_Unwind_Exception *a1)
{
}

uint64_t sub_18823AF84(uint64_t *a1)
{
  if (((*(uint64_t (**)(uint64_t *))(*a1 + 568))(a1) & 1) == 0 && *((_DWORD *)a1 + 80) != -1)
  {
    close(*((_DWORD *)a1 + 80));
    *((_DWORD *)a1 + 80) = -1;
  }

  return 0LL;
}

uint64_t sub_18823B02C(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 168);
  if (v2 > 0 || a2 != 0)
  {
    int v4 = v2 - 1;
    if (a2) {
      int v4 = 0;
    }
    *(_DWORD *)(result + 168) = v4;
  }

  return result;
}

BOOL sub_18823B050(uint64_t a1)
{
  return *(_DWORD *)(a1 + 168) > 0;
}

void *sub_18823B060(uint64_t a1)
{
  *(void *)a1 = off_18A20DEB0;
  uint64_t v2 = *(void *)(a1 + 208);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
    pthread_mutex_destroy((pthread_mutex_t *)(a1 + 216));
  }

  *(void *)(a1 + 208) = 0LL;
  return sub_18823B1C4(a1);
}

void sub_18823B0AC(_Unwind_Exception *a1)
{
}

uint64_t sub_18823B0C4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 208);
  if (result)
  {
    (*(void (**)(uint64_t))(*(void *)result + 8LL))(result);
    uint64_t result = pthread_mutex_destroy((pthread_mutex_t *)(a1 + 216));
  }

  *(void *)(a1 + 208) = 0LL;
  return result;
}

void sub_18823B100(void *a1)
{
}

void sub_18823B124(_Unwind_Exception *a1)
{
}

uint64_t sub_18823B138(uint64_t a1)
{
  *(void *)a1 = off_18A20E198;
  for (i = *(void **)(a1 + 16); i; i = *(void **)(a1 + 16))
  {
    *(void *)(a1 + 16) = i[9];
    (*(void (**)(void *))(*i + 8LL))(i);
  }

  free(*(void **)(a1 + 24));
  return a1;
}

void sub_18823B190(void **a1)
{
  *a1 = off_18A20E1B8;
  free(a1[5]);
  operator delete(a1);
}

void *sub_18823B1C4(uint64_t a1)
{
  *(void *)a1 = off_18A20A928;
  *(_DWORD *)(a1 + 104) = 0;
  uint64_t v2 = *(const void **)(a1 + 136);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 136) = 0LL;
  }

  stat v3 = *(const void **)(a1 + 112);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 112) = 0LL;
  }

  int v4 = *(const void **)(a1 + 120);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 120) = 0LL;
  }

  pid_t v5 = *(const void **)(a1 + 160);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 160) = 0LL;
  }

  CFStringRef v6 = *(const void **)(a1 + 144);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 144) = 0LL;
  }

  uint64_t v7 = *(const void **)(a1 + 152);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a1 + 152) = 0LL;
  }

  uint64_t v8 = *(char **)(a1 + 184);
  if (v8)
  {
    DIDiskImageObjectRelease(v8);
    *(void *)(a1 + 184) = 0LL;
  }

  return sub_18823B28C((void *)a1);
}

void sub_18823B264(_Unwind_Exception *a1)
{
}

BOOL sub_18823B27C(uint64_t a1)
{
  return *(_DWORD *)(a1 + 176) > 0;
}

void *sub_18823B28C(void *a1)
{
  *a1 = off_18A20AF30;
  uint64_t v2 = (pthread_mutex_t *)(a1 + 2);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 2));
  pthread_mutex_unlock(v2);
  stat v3 = (const __CFArray *)qword_18C7034B8;
  if (qword_18C7034B8)
  {
    v7.length = CFArrayGetCount((CFArrayRef)qword_18C7034B8);
    v7.location = 0LL;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v7, a1);
    if (FirstIndexOfValue != -1) {
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_18C7034B8, FirstIndexOfValue);
    }
  }

  pid_t v5 = (const void *)a1[12];
  if (v5)
  {
    CFRelease(v5);
    a1[12] = 0LL;
  }

  pthread_mutex_destroy(v2);
  return a1;
}

uint64_t DIResolveURLToDiskImage( uint64_t a1, const __CFDictionary *a2, unsigned int a3, void *a4, CFTypeRef *a5)
{
  v18 = 0LL;
  v19 = 0LL;
  CFStringRef appendedString = 0LL;
  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = 0LL;
  }
  uint64_t v10 = 22LL;
  if (a1 && a4)
  {
    if (sub_1882389A4())
    {
      uint64_t v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
      if (Mutable)
      {
        CFArrayRef v13 = Mutable;
        if (a2) {
          MutableCopy = CFDictionaryCreateMutableCopy(v11, 0LL, a2);
        }
        else {
          MutableCopy = CFDictionaryCreateMutable(v11, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        }
        v15 = MutableCopy;
        if (CFDictionaryGetValue(MutableCopy, @"shadow-file")) {
          DIAddPermission(v15, 1);
        }
        uint64_t v10 = DIResolveURLToBackingStore(a1, (uint64_t)v15, a3, &v19, (CFTypeRef *)&appendedString);
        if (appendedString) {
          CFStringAppend(v13, appendedString);
        }
        if (!(_DWORD)v10)
        {
          if (appendedString)
          {
            CFRelease(appendedString);
            CFStringRef appendedString = 0LL;
          }

          uint64_t v10 = sub_18823D144((uint64_t)v19, a2, &v18, (CFTypeRef *)&appendedString);
          if (appendedString) {
            CFStringAppend(v13, appendedString);
          }
          if ((_DWORD)v10 && v18)
          {
            DIDiskImageObjectRelease(v18);
            v18 = 0LL;
          }
        }

        if (v19)
        {
          DIDiskImageObjectRelease(v19);
          v19 = 0LL;
        }

        if (v15) {
          CFRelease(v15);
        }
        if (appendedString)
        {
          CFRelease(appendedString);
          CFStringRef appendedString = 0LL;
        }

        *a4 = v18;
        if (a5)
        {
          *a5 = v13;
          if (!CFStringGetLength(v13) && *a5)
          {
            CFRelease(*a5);
            *a5 = 0LL;
          }
        }

        else
        {
          CFRelease(v13);
        }
      }

      else
      {
        return 999LL;
      }
    }

    else
    {
      return 119LL;
    }
  }

  return v10;
}

uint64_t sub_18823B508(uint64_t a1, int a2)
{
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 568LL))(a1))
  {
    pid_t v5 = (const __CFString *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)a1 + 24LL))( a1,  @"exclusive-open-locks-are-optional");
    int v6 = sub_188238A38(v5, 0);
    *(_BYTE *)(a1 + 368) = v6;
    if (a2)
    {
      if (a2 == 3)
      {
        CFRange v7 = *(const char **)(a1 + 296);
        int v8 = 2;
      }

      else
      {
        if (a2 != 1) {
          return 22LL;
        }
        CFRange v7 = *(const char **)(a1 + 296);
        int v8 = 0;
      }

      int v9 = sub_18823B6E8(v7, v8, v6, 438LL);
      if ((v9 & 0x80000000) == 0) {
        goto LABEL_15;
      }
LABEL_21:
      uint64_t result = *__error();
      if ((_DWORD)result) {
        return result;
      }
      return sub_18823B7D8(a1, a2);
    }

    int v9 = sub_18823B6E8(*(const char **)(a1 + 296), 2, v6, 438LL);
    if (v9 < 0)
    {
      int v9 = sub_18823B6E8(*(const char **)(a1 + 296), 0, *(unsigned __int8 *)(a1 + 368), 438LL);
      if (v9 < 0)
      {
        a2 = 3;
        goto LABEL_21;
      }

      a2 = 1;
    }

    else
    {
      a2 = 3;
    }

LABEL_15:
    close(v9);
    return sub_18823B7D8(a1, a2);
  }

  if (!a2) {
    return 0LL;
  }
  return 13LL;
}

  pthread_mutex_unlock(v10);
  if (a4)
  {
    int v20 = v31;
LABEL_17:
    *a4 = v20;
  }

  return v11;
}

    if (v14 && v10)
    {
      CFRelease(v10);
      uint64_t v10 = 0LL;
    }

    if (!v13) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  uint64_t v10 = 0LL;
LABEL_20:
  if (v59)
  {
    CFRelease(v59);
    v59 = 0LL;
  }

  if (v9) {
    CFRelease(v9);
  }
  return v10;
}

const void *sub_18823B62C(void *a1, CFTypeRef cf1)
{
  if (!CFEqual(cf1, @"bs-persistentID")) {
    return sub_18823B6D4((uint64_t)a1, cf1);
  }
  if (!a1[39])
  {
    uint64_t v4 = (*(uint64_t (**)(void *))(*a1 + 752LL))(a1);
    if (v4)
    {
      pid_t v5 = (const void *)v4;
      a1[39] = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"i:%llu on %@", a1[35], v4);
      CFRelease(v5);
    }
  }

  return (const void *)a1[39];
}

const void *sub_18823B6D4(uint64_t a1, const void *a2)
{
  if (a2) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 96), a2);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_18823B6E8(const char *a1, int a2, int a3, uint64_t a4)
{
  if ((a2 & 3) == 2) {
    int v8 = 36;
  }
  else {
    int v8 = 20;
  }
  uint64_t v9 = open(a1, v8 | a2, a4);
  uint64_t v10 = v9;
  if ((v9 & 0x80000000) != 0)
  {
    int v12 = *__error();
    if (v12 == 45 || a3 && v12 == 35)
    {
      uint64_t v10 = open(a1, a2 & 0xFFFFFFCB, a4);
      if ((v10 & 0x80000000) != 0)
      {
        int v13 = *__error();
        *__error() = v13;
      }
    }

    else
    {
      *__error() = v12;
    }
  }

  else
  {
    int v11 = fcntl(v9, 3, 0LL);
    if ((v11 & 0x80000000) == 0) {
      fcntl(v10, 4, v11 & 0xFFFFFFFB);
    }
  }

  return v10;
}

uint64_t sub_18823B7D8(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 104) = a2;
  return 0LL;
}

uint64_t sub_18823B7E4(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 > 2) {
    return 110LL;
  }
  pid_t v5 = off_18A20A830[a1];
  if (!v5[5]) {
    return 110LL;
  }
  unsigned int v10 = 0;
  int v11 = 0;
  uint64_t v12 = (int)a1;
  int v13 = (uint64_t *)(v5 + 12);
  unsigned int v14 = -1;
  do
  {
    v15 = (uint64_t (*)(uint64_t, uint64_t))*(v13 - 11);
    if (v15)
    {
      int v16 = v15(a2, a3);
      if (v16 > v11)
      {
        int v11 = v16;
        unsigned int v14 = v10;
      }
    }

    ++v10;
    uint64_t v17 = *v13;
    v13 += 7;
  }

  while (v17);
  if ((v14 & 0x80000000) != 0) {
    return 110LL;
  }
  v18 = off_18A20A830[v12][7 * v14 + 2];
  if (v18) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v18)(a2, a3, a4, a5);
  }
  else {
    return 78LL;
  }
}

uint64_t sub_18823B8D8(_DWORD *a1)
{
  int v2 = a1[80];
  if (v2 != -1) {
    goto LABEL_13;
  }
  else {
    int v3 = 0;
  }
  if (*((_BYTE *)a1 + 192)) {
    v3 |= 0x80u;
  }
  if (*((_BYTE *)a1 + 369)) {
    int v4 = v3 | 0x100;
  }
  else {
    int v4 = v3;
  }
  int v5 = sub_18823B6E8(*((const char **)a1 + 37), v4, *((unsigned __int8 *)a1 + 368), 438LL);
  a1[80] = v5;
  if ((v5 & 0x80000000) == 0)
  {
    sub_18823B9C4();
    int v2 = a1[80];
LABEL_13:
    fcntl(v2, 48, 1LL);
LABEL_14:
    (*(void (**)(_DWORD *))(*(void *)a1 + 576LL))(a1);
    return 0LL;
  }

  a1[80] = -1;
  uint64_t result = *__error();
  if (!(_DWORD)result) {
    goto LABEL_14;
  }
  return result;
}

BOOL sub_18823B9B4(uint64_t a1)
{
  return *(_DWORD *)(a1 + 104) == 3;
}

uint64_t sub_18823B9C4()
{
  return 0LL;
}

uint64_t sub_18823B9CC(uint64_t result)
{
  return result;
}

uint64_t sub_18823B9DC(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, uint64_t a5)
{
  unsigned int v10 = *(FILE **)(a1 + 328);
  if (v10)
  {
    pid_t v11 = getpid();
    fprintf(v10, "read\t%d\t%016qX\t%08X\n", v11, a2, a3);
    fflush(*(FILE **)(a1 + 328));
  }

  return sub_18823BA60(a1, a2, a3, a4, a5);
}

uint64_t sub_18823BA60(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v31 = 0LL;
  unsigned int v10 = (pthread_mutex_t *)(a1 + 216);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 216));
  unint64_t v11 = 0LL;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 568LL))(a1))
  {
    uint64_t v12 = 9LL;
    goto LABEL_14;
  }

  uint64_t v12 = 22LL;
  if (!a4 || !a5)
  {
LABEL_14:
    pthread_mutex_unlock(v10);
    if (!a4) {
      return v12;
    }
    goto LABEL_18;
  }

  uint64_t v12 = 29LL;
  if ((a2 & 0x8000000000000000LL) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 200);
    if (v13 >= a2 && v13 - a2 >= a3)
    {
      uint64_t v14 = *(void *)(a1 + 208);
      if (v14)
      {
        int v15 = sub_18823BC90(v14, a2, a3, &v30, 0);
        if (v15 >= 1)
        {
          int v16 = v15;
          unint64_t v29 = a3;
          unint64_t v17 = 0LL;
          v18 = v30;
          int v19 = v15;
          int v20 = v30;
          do
          {
            memmove((void *)(a5 + *v20 - a2), (const void *)v20[2], v20[1]);
            v17 += v20[1];
            v20 += 3;
            --v19;
          }

          while (v19);
          unint64_t v21 = v29;
          if (v17 == v29)
          {
            uint64_t v12 = 0LL;
            goto LABEL_34;
          }

          uint64_t v26 = a2;
          while (1)
          {
            uint64_t v23 = *v18;
            uint64_t v24 = *v18 - v26;
            if (*v18 > v26)
            {
              uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 712LL))(a1);
              if ((_DWORD)v25)
              {
                uint64_t v12 = v25;
LABEL_33:
                unint64_t v21 = v17;
                goto LABEL_34;
              }

              v17 += v24;
              uint64_t v23 = *v18;
            }

            uint64_t v26 = v18[1] + v23;
            v18 += 3;
            if (!--v16) {
              goto LABEL_27;
            }
          }
        }

        unint64_t v17 = 0LL;
        if (!a3) {
          goto LABEL_32;
        }
        unint64_t v29 = a3;
        uint64_t v26 = a2;
LABEL_27:
        unint64_t v27 = v29 + a2 - v26;
        if (v29 + a2 <= v26)
        {
LABEL_32:
          uint64_t v12 = 0LL;
          goto LABEL_33;
        }

        uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 712LL))(a1);
        if ((_DWORD)v12) {
          unint64_t v28 = 0LL;
        }
        else {
          unint64_t v28 = v27;
        }
        unint64_t v21 = v17 + v28;
LABEL_34:
        unint64_t v11 = v21;
        goto LABEL_14;
      }

      uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, unint64_t *, uint64_t))(*(void *)a1 + 688LL))( a1,  a2,  a3,  &v31,  a5);
    }
  }

  pthread_mutex_unlock(v10);
  unint64_t v11 = v31;
LABEL_18:
  *a4 = v11;
  return v12;
}

uint64_t sub_18823BC90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t **a4, int a5)
{
  int v5 = *(uint64_t **)(a1 + 24);
  if (a4) {
    *a4 = v5;
  }
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  do
  {
    if (*(_BYTE *)(v7 + 8)) {
      ++*(_DWORD *)(v7 + 12);
    }
    uint64_t v7 = *(void *)(v7 + 72);
  }

  while (v7);
  uint64_t v8 = 0LL;
  do
  {
    if (*(_BYTE *)(v6 + 8))
    {
      uint64_t v9 = *(void *)(v6 + 32);
      if (v9 >= a2)
      {
        uint64_t v10 = *(void *)(v6 + 24);
        if (v10 < a3 + a2)
        {
          if (v10 <= a2) {
            uint64_t v11 = a2;
          }
          else {
            uint64_t v11 = *(void *)(v6 + 24);
          }
          if (v9 >= a3 + a2 - 1) {
            uint64_t v9 = a3 + a2 - 1;
          }
          if (a5) {
            *(_BYTE *)(v6 + 16) = 1;
          }
          *(_DWORD *)(v6 + 12) = 0;
          uint64_t *v5 = v11;
          v5[1] = v9 - v11 + 1;
          v5[2] = *(void *)(v6 + 40) + v11 - v10;
          uint64_t v8 = (v8 + 1);
          v5 += 3;
        }
      }
    }

    uint64_t v6 = *(void *)(v6 + 72);
  }

  while (v6);
  if ((_DWORD)v8) {
    qsort(*(void **)(a1 + 24), (int)v8, 0x18uLL, (int (__cdecl *)(const void *, const void *))sub_1882402BC);
  }
  return v8;
}

uint64_t sub_18823BD7C(void *a1, uint64_t a2, size_t a3, char *a4)
{
  int v4 = a4;
  size_t v5 = a3;
  uint64_t v6 = a2;
  size_t v8 = *(void *)(a1[26] + 8LL);
  if (v8 <= a3)
  {
    size_t v9 = a3 / v8 * v8;
    uint64_t result = (*(uint64_t (**)(void *, uint64_t, size_t, char *, char *))(*a1 + 688LL))(a1, a2, v9, v16, a4);
    if ((_DWORD)result) {
      return result;
    }
    v5 -= v9;
    v6 += v9;
    v4 += v9;
  }

  if (!v5) {
    return 0LL;
  }
  uint64_t v11 = sub_18823BEC8(a1[26]);
  uint64_t v12 = v11;
  if (!*(_BYTE *)(v11 + 8) || !*(_BYTE *)(v11 + 16) || (uint64_t result = sub_1882464CC(v11), !(_DWORD)result))
  {
    *(_BYTE *)(v12 + 8) = 0;
    *(_DWORD *)(v12 + 12) = 0;
    *(_BYTE *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0LL;
    *(void *)(v12 + 32) = 0LL;
    uint64_t v13 = a1[26];
    uint64_t v14 = sub_18823BF18(v13, v6, a1[25] - 1LL);
    if (!v14)
    {
      for (uint64_t i = *(void *)(v13 + 16); i; uint64_t i = *(void *)(i + 72))
        ;
    }

    uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t, char *, void))(*a1 + 688LL))( a1,  v6,  v14,  v16,  *(void *)(v12 + 40));
    if (!(_DWORD)result)
    {
      *(_DWORD *)(v12 + 12) = 0;
      *(void *)(v12 + 24) = v6;
      *(void *)(v12 + 32) = v6 + v14 - 1;
      *(_BYTE *)(v12 + 16) = 0;
      *(_BYTE *)(v12 + 8) = 1;
      memmove(v4, *(const void **)(v12 + 40), v5);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_18823BEC8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  int v3 = -1;
  while (*(_BYTE *)(v1 + 8))
  {
    int v4 = *(_DWORD *)(v1 + 12);
    if (*(_BYTE *)(v1 + 16)) {
      ++v4;
    }
    if (v4 > v3)
    {
      uint64_t result = v1;
      int v3 = v4;
    }

    uint64_t v1 = *(void *)(v1 + 72);
    if (!v1) {
      return result;
    }
  }

  return v1;
}

uint64_t sub_18823BF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  if (a3 - a2 >= v4) {
    uint64_t v5 = a2 + v4 - 1;
  }
  else {
    uint64_t v5 = a3;
  }
  for (; v3; uint64_t v3 = *(void *)(v3 + 72))
  {
    if (*(_BYTE *)(v3 + 8) && *(void *)(v3 + 32) >= a2)
    {
      uint64_t v6 = *(void *)(v3 + 24);
      if (v6 <= a2) {
        uint64_t v7 = a2;
      }
      else {
        uint64_t v7 = *(void *)(v3 + 24);
      }
      uint64_t v8 = v7 - 1;
      if (v6 <= v5) {
        uint64_t v5 = v8;
      }
    }
  }

  return v5 - a2 + 1;
}

uint64_t sub_18823BF74(uint64_t a1, off_t a2, size_t a3, ssize_t *a4, void *__buf)
{
  ssize_t v6 = pread(*(_DWORD *)(a1 + 320), __buf, a3, a2);
  if (v6 < 0) {
    return *__error();
  }
  ssize_t v7 = v6;
  uint64_t result = 0LL;
  *a4 = v7;
  return result;
}

uint64_t sub_18823BFC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_18823C014(a1, a2);
  if (!v2) {
    return 0LL;
  }
  while (1)
  {
    if (*(_BYTE *)(v2 + 8))
    {
      if (*(_BYTE *)(v2 + 16))
      {
        uint64_t result = sub_1882464CC(v2);
        if ((_DWORD)result) {
          break;
        }
      }
    }

    uint64_t v2 = *(void *)(v2 + 72);
    if (!v2) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_18823C014(uint64_t result, uint64_t a2)
{
  for (uint64_t i = *(void *)(result + 16); i; uint64_t i = *(void *)(i + 72))
  {
    if (*(_BYTE *)(i + 8))
    {
      if (*(void *)(i + 24) >= a2)
      {
        *(_BYTE *)(i + 8) = 0;
        *(_DWORD *)(i + 12) = 0;
        *(void *)(i + 24) = 0LL;
        *(void *)(i + 32) = 0LL;
        *(_BYTE *)(i + 16) = 0;
      }

      else if (*(void *)(i + 32) >= a2)
      {
        *(void *)(i + 32) = a2 - 1;
      }
    }
  }

  return result;
}

uint64_t sub_18823C068(uint64_t a1, const __CFDictionary *a2)
{
  if (sub_188239FB0(a2, @"DIIsPotentiallyValidDiskImage", 0)
    || (sub_188239F2C(a2, @"fileencoding-class", @"CEncryptedEncoding") & 0x80000000) != 0)
  {
    return 4294966296LL;
  }

  int v6 = sub_188239F2C(a2, @"fileencoding-class", @"CEncryptedEncoding");
  uint64_t v4 = 1000LL;
  if (v6 <= 0)
  {
    if (sub_18823C100(a1, 0LL)) {
      return 1000LL;
    }
    else {
      return 4294966296LL;
    }
  }

  return v4;
}

BOOL sub_18823C100(uint64_t a1, CFUUIDRef *a2)
{
  uint64_t v3 = sub_18823C178(a1);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = (const __CFString *)sub_18824911C(v3, @"uuid");
  BOOL v6 = v5 != 0LL;
  if (a2 && v5) {
    *a2 = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x189604DB0], v5);
  }
  CFRelease(v4);
  return v6;
}

__CFDictionary *sub_18823C178(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableStringRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (a1 && !(*(unsigned int (**)(uint64_t))(*(void *)a1 + 272LL))(a1))
  {
    if ((*(unsigned int (**)(uint64_t, unint64_t *))(*(void *)a1 + 296LL))(a1, &v44)
      || (v44 & 0x8000000000000000LL) != 0)
    {
      goto LABEL_5;
    }

    if (v44 >= 0x4FC)
    {
      if ((*(unsigned int (**)(uint64_t, unint64_t, uint64_t, _BYTE *, CFUUIDBytes *))(*(void *)a1 + 328LL))( a1,  v44 - 1276,  1276LL,  v43,  &v47))
      {
        goto LABEL_5;
      }

      if (!sub_18823C7C0((uint64_t)&v47) && v49[2] == 1701733234 && v49[1] == 1667527521 && v49[0] == 1)
      {
        CFNumberRef v7 = CFNumberCreate(v2, kCFNumberSInt32Type, v49);
        CFDictionarySetValue(Mutable, @"encrypted-file-version", v7);
        CFRelease(v7);
        uint64_t v8 = CFUUIDCreateFromUUIDBytes(v2, v47);
        CFStringRef v9 = CFUUIDCreateString(v2, v8);
        CFDictionarySetValue(Mutable, @"uuid", v9);
        if (v9) {
          CFRelease(v9);
        }
        if (v8) {
          CFRelease(v8);
        }
        CFNumberRef v10 = CFNumberCreate(v2, kCFNumberSInt32Type, &v48);
        CFDictionarySetValue(Mutable, @"blocksize", v10);
        if (v10) {
          CFRelease(v10);
        }
        goto LABEL_64;
      }
    }

    if (!(*(unsigned int (**)(uint64_t, void, uint64_t, _BYTE *, _DWORD *))(*(void *)a1 + 328LL))( a1,  0LL,  72LL,  v43,  v39)
      && !sub_18823C890((uint64_t)v39))
    {
      char v5 = 0;
      if (v39[0] != 1701733234 || v39[1] != 1667527521)
      {
LABEL_6:
        int v4 = 1;
        if ((v5 & 1) != 0) {
          goto LABEL_9;
        }
        goto LABEL_7;
      }

      CFNumberRef v11 = CFNumberCreate(v2, kCFNumberSInt32Type, &v40);
      CFDictionarySetValue(Mutable, @"version", v11);
      CFRelease(v11);
      uint64_t v12 = CFUUIDCreateFromUUIDBytes(v2, v41);
      CFStringRef v13 = CFUUIDCreateString(v2, v12);
      CFDictionarySetValue(Mutable, @"uuid", v13);
      if (v13) {
        CFRelease(v13);
      }
      if (v12) {
        CFRelease(v12);
      }
      CFNumberRef v14 = CFNumberCreate(v2, kCFNumberSInt32Type, v42);
      CFDictionarySetValue(Mutable, @"blocksize", v14);
      if (v14) {
        CFRelease(v14);
      }
      uint64_t v15 = *(void *)&v42[12];
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, _BYTE *, unsigned int *))(*(void *)a1 + 328LL))( a1,  72LL,  4LL,  v43,  &v38))
      {
        unsigned int v16 = bswap32(v38);
        unsigned int v38 = v16;
        if (v16 <= 0x800)
        {
          uint64_t v17 = 20LL * v16 + 4;
          v18 = (unsigned int *)malloc(v17);
          if (v18)
          {
            int v19 = v18;
            if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, _BYTE *, unsigned int *))(*(void *)a1 + 328LL))( a1,  72LL,  v17,  v43,  v18))
            {
              sub_18825810C(v19, v17);
              int v36 = 0;
              int valuePtr = 0;
              v33 = v19;
              theArray = CFArrayCreateMutable(v2, 0LL, MEMORY[0x189605228]);
              unint64_t v20 = *v19;
              if ((_DWORD)v20)
              {
                int v21 = 0;
                int v22 = 0;
                unint64_t v23 = 0LL;
                uint64_t v24 = v19 + 2;
                do
                {
                  int v25 = *((_DWORD *)v24 - 1);
                  if (v15 >= *v24) {
                    uint64_t v15 = *v24;
                  }
                  if (v25 == 2)
                  {
                    uint64_t v26 = v24[1];
                    ++v22;
                    int v35 = v21;
                    int v36 = v22;
                    if (v26 != 564) {
                      goto LABEL_62;
                    }
                    LODWORD(length[0]) = bswap32(length[0]);
                    int8x16_t v27 = vrev32q_s8(v46);
                    int8x16_t v46 = v27;
                    if (LODWORD(length[0]) > 0x20 || v27.i32[3] > 0x200u) {
                      goto LABEL_62;
                    }
                    unint64_t v28 = CFDictionaryCreateMutable(v2, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
                    CFDataRef v29 = CFDataCreate(v2, (const UInt8 *)length + 4, LODWORD(length[0]));
                    CFDictionarySetValue(v28, @"public-key-hash", v29);
                    CFRelease(v29);
                    CFArrayAppendValue(theArray, v28);
                    CFRelease(v28);
                    unint64_t v20 = *v33;
                    int v21 = v35;
                  }

                  else if (v25 == 1)
                  {
                    int valuePtr = ++v21;
                  }

                  ++v23;
                  uint64_t v24 = (void *)((char *)v24 + 20);
                }

                while (v23 < v20);
              }

              CFNumberRef v30 = CFNumberCreate(v2, kCFNumberSInt32Type, &valuePtr);
              CFDictionarySetValue(Mutable, @"passphrase-count", v30);
              if (v30) {
                CFRelease(v30);
              }
              CFNumberRef v31 = CFNumberCreate(v2, kCFNumberSInt32Type, &v36);
              CFDictionarySetValue(Mutable, @"private-key-count", v31);
              if (v31) {
                CFRelease(v31);
              }
              if (v36) {
                CFDictionarySetValue(Mutable, @"private-keys", theArray);
              }
              if (theArray) {
                CFRelease(theArray);
              }
              length[0] = (v15 - 76) / 0x14uLL;
              CFNumberRef v32 = CFNumberCreate(v2, kCFNumberSInt64Type, length);
              CFDictionarySetValue(Mutable, @"max-key-count", v32);
              if (v32) {
                CFRelease(v32);
              }
LABEL_62:
              int v19 = v33;
            }

            free(v19);
          }
        }
      }

LABEL_64:
      char v5 = 1;
      goto LABEL_6;
    }

LABEL_5:
    char v5 = 0;
    goto LABEL_6;
  }

  int v4 = 0;
LABEL_7:
  if (Mutable)
  {
    CFRelease(Mutable);
    CFMutableStringRef Mutable = 0LL;
  }

  uint64_t v3 = v6;
  if (v6) {
LABEL_6:
  }
    DIDiskImageObjectRelease(v3);
  return Copy;
}

uint64_t sub_18823C7A0(uint64_t a1, void *a2)
{
  if (!a2) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(void *)(a1 + 200);
  return result;
}

uint64_t sub_18823C7C0(uint64_t a1)
{
  int8x16_t v1 = vrev32q_s8(*(int8x16_t *)(a1 + 32));
  *(int8x16_t *)(a1 + 16) = vrev32q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)(a1 + 32) = v1;
  unsigned int v2 = bswap32(*(_DWORD *)(a1 + 52));
  *(_DWORD *)(a1 + 48) = bswap32(*(_DWORD *)(a1 + 48));
  *(_DWORD *)(a1 + 52) = v2;
  int8x16_t v3 = vrev32q_s8(*(int8x16_t *)(a1 + 88));
  *(int8x16_t *)(a1 + 88) = v3;
  unsigned int v4 = bswap32(*(_DWORD *)(a1 + 136));
  *(_DWORD *)(a1 + 136) = v4;
  *(int8x8_t *)(a1 + 396) = vrev32_s8(*(int8x8_t *)(a1 + 396));
  unsigned int v5 = bswap32(*(_DWORD *)(a1 + 436));
  *(_DWORD *)(a1 + 436) = v5;
  *(int8x8_t *)(a1 + 696) = vrev32_s8(*(int8x8_t *)(a1 + 696));
  unsigned int v6 = bswap32(*(_DWORD *)(a1 + 736));
  *(_DWORD *)(a1 + 736) = v6;
  unsigned int v7 = bswap32(*(_DWORD *)(a1 + 996));
  *(_DWORD *)(a1 + 996) = v7;
  *(void *)(a1 + 1256) = bswap64(*(void *)(a1 + 1256));
  *(int8x8_t *)(a1 + 1264) = vrev32_s8(*(int8x8_t *)(a1 + 1264));
  *(_DWORD *)(a1 + 1272) = bswap32(*(_DWORD *)(a1 + 1272));
  if (v7 > 0x100 || v6 > 0x100 || v5 > 0x100 || v4 > 0x100 || v3.i32[3] > 0x400u || v2 > 0x20) {
    return 107LL;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_18823C890(uint64_t a1)
{
  int8x16_t v1 = vrev32q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)a1 = vrev32q_s8(*(int8x16_t *)a1);
  *(int8x16_t *)(a1 + 16) = v1;
  unsigned int v2 = bswap32(*(_DWORD *)(a1 + 32));
  *(_DWORD *)(a1 + 32) = v2;
  *(_DWORD *)(a1 + 52) = bswap32(*(_DWORD *)(a1 + 52));
  *(int8x16_t *)(a1 + 56) = vrev64q_s8(*(int8x16_t *)(a1 + 56));
  if (v2 > 0x400 || v1.i32[2] > 0x400u) {
    return 107LL;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_18823C8E0(uint64_t a1, CFDictionaryRef theDict)
{
  if ((sub_188239F2C(theDict, @"fileencoding-class", @"CUDIFEncoding") & 0x80000000) != 0) {
    return 4294966296LL;
  }
  int v5 = sub_188239FB0(theDict, @"expandable", 0);
  uint64_t v4 = 4294966296LL;
  if (!v5)
  {
    else {
      return 4294966296LL;
    }
  }

  return v4;
}

uint64_t sub_18823C98C(uint64_t a1, _BYTE *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  if (!(*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)a1 + 296LL))(a1, &v6) && v6 >= 512)
  {
    if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 272LL))(a1))
    {
      if (sub_18823CADC(a1, &v7, v6 - 512))
      {
        uint64_t v4 = 0LL;
        goto LABEL_14;
      }

      if (v7 == 1802464377 && v8 == 4)
      {
        uint64_t v4 = 1LL;
        if (!a2)
        {
LABEL_14:
          (*(void (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
          return v4;
        }
      }

      else
      {
        uint64_t v4 = 0LL;
        if (!a2) {
          goto LABEL_10;
        }
        LOBYTE(v4) = 0;
      }

      *a2 = v4;
LABEL_10:
      uint64_t v4 = 1LL;
      goto LABEL_14;
    }

    return 0LL;
  }

  return v4;
}

uint64_t sub_18823CADC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272LL))(a1);
  if (!(_DWORD)v6)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, _BYTE *))(*(void *)a1 + 328LL))( a1,  a3,  512LL,  &v8,  __src);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
    if (!(_DWORD)v6)
    {
      sub_18823CBB0((uint64_t)__src);
      memcpy(a2, __src, 0x200uLL);
    }
  }

  return v6;
}

int8x8_t sub_18823CBB0(uint64_t a1)
{
  int8x16_t v1 = vrev64q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)a1 = vrev32q_s8(*(int8x16_t *)a1);
  *(int8x16_t *)(a1 + 16) = v1;
  *(int8x16_t *)(a1 + 32) = vrev64q_s8(*(int8x16_t *)(a1 + 32));
  *(void *)(a1 + 48) = bswap64(*(void *)(a1 + 48));
  *(int8x8_t *)(a1 + 56) = vrev32_s8(*(int8x8_t *)(a1 + 56));
  *(int8x8_t *)(a1 + 80) = vrev32_s8(*(int8x8_t *)(a1 + 80));
  *(int8x16_t *)(a1 + 216) = vrev64q_s8(*(int8x16_t *)(a1 + 216));
  *(int8x16_t *)(a1 + 296) = vrev64q_s8(*(int8x16_t *)(a1 + 296));
  int8x8_t result = vrev32_s8(*(int8x8_t *)(a1 + 352));
  *(int8x8_t *)(a1 + 352) = result;
  *(_DWORD *)(a1 + 488) = bswap32(*(_DWORD *)(a1 + 488));
  *(void *)(a1 + 492) = bswap64(*(void *)(a1 + 492));
  return result;
}

uint64_t sub_18823CC34(uint64_t a1, uint64_t a2, char **a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  if (!a1) {
    return 22LL;
  }
  uint64_t v6 = sub_18823AC00(a2);
  int v7 = (char *)operator new(0x310uLL);
  sub_18823CD14((uint64_t)v7);
  uint64_t v8 = (*(uint64_t (**)(char *, uint64_t))(*(void *)v7 + 696LL))(v7, a1);
  if ((_DWORD)v8 || (uint64_t v8 = (*(uint64_t (**)(char *, uint64_t))(*(void *)v7 + 80LL))(v7, v6), (_DWORD)v8))
  {
    DIDiskImageObjectRelease(v7);
    int v7 = 0LL;
  }

  *a3 = v7;
  return v8;
}

void sub_18823CD00(_Unwind_Exception *a1)
{
}

uint64_t sub_18823CD14(uint64_t a1)
{
  void *v2 = off_18A20D0B0;
  *(_BYTE *)(a1 + 779) = 0;
  bzero(v2 + 29, 0x220uLL);
  sub_18823A7AC(a1, @"thread-safe", (const void *)*MEMORY[0x189604DE8]);
  return a1;
}

void sub_18823CD6C(_Unwind_Exception *a1)
{
}

void sub_18823CD84(uint64_t a1)
{
  void *v1 = off_18A20CA58;
  v1[27] = 0LL;
  v1[28] = 0LL;
  v1[26] = 0LL;
}

void sub_18823CDAC(uint64_t a1)
{
  void *v1 = off_18A20C770;
  v1[25] = 0LL;
}

uint64_t sub_18823CDD0(uint64_t a1, char *a2)
{
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t))(*(void *)a2 + 80LL))(a2, 1LL);
  if ((_DWORD)v4) {
    return v4;
  }
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t *))(*(void *)a2 + 296LL))(a2, &v19);
  if ((_DWORD)v4) {
    return v4;
  }
  uint64_t v4 = (*(uint64_t (**)(char *))(*(void *)a2 + 272LL))(a2);
  if ((_DWORD)v4) {
    return v4;
  }
  int v5 = (_DWORD *)(a1 + 232);
  uint64_t v6 = sub_18823CADC((uint64_t)a2, (void *)(a1 + 232), v19 - 512);
  if ((_DWORD)v6) {
    goto LABEL_23;
  }
  if (*v5 == 1802464377 && *(_DWORD *)(a1 + 236) == 4)
  {
    char v7 = 0;
    char v8 = 1;
LABEL_12:
    *(_BYTE *)(a1 + 776) = v8;
    *(_BYTE *)(a1 + 777) = v7;
    uint64_t v10 = *(void *)(a1 + 256);
    uint64_t v9 = *(void *)(a1 + 264);
    *(void *)(a1 + 752) = v9;
    *(void *)(a1 + 744) = v10;
    sub_18823CFC4(a1, v9);
    int v11 = *(_DWORD *)(a1 + 244);
    *(_BYTE *)(a1 + 778) = v11 & 1;
    if ((v11 & 1) != 0)
    {
      uint64_t v14 = *(void *)(a1 + 272);
      uint64_t v12 = *(void *)(a1 + 280);
      *(void *)(a1 + 768) = v12;
      *(void *)(a1 + 760) = v14;
    }

    else
    {
      uint64_t v12 = 0LL;
      *(_OWORD *)(a1 + 760) = 0u;
    }

    sub_18823CFCC(a1, v12);
    if (*(_DWORD *)(a1 + 288) >= 2u) {
      int v15 = 1684371059;
    }
    else {
      int v15 = 1684371049;
    }
    sub_18823CFD4(a1, v15);
    uint64_t v16 = (*(uint64_t (**)(char *))(*(void *)a2 + 192LL))(a2);
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 520LL))(a1, v16);
    uint64_t v17 = (*(uint64_t (**)(char *))(*(void *)a2 + 208LL))(a2);
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 528LL))(a1, v17);
    sub_18823CFEC(a1, a2);
    uint64_t v13 = 0LL;
    goto LABEL_20;
  }

  uint64_t v6 = sub_18823CADC((uint64_t)a2, (void *)(a1 + 232), 0LL);
  if ((_DWORD)v6)
  {
LABEL_23:
    uint64_t v13 = v6;
  }

  else
  {
    if (*v5 == 1802464377 && *(_DWORD *)(a1 + 236) == 4)
    {
      char v8 = 0;
      char v7 = 1;
      goto LABEL_12;
    }

    uint64_t v13 = 107LL;
  }

LABEL_20:
  (*(void (**)(char *, void))(*(void *)a2 + 280LL))(a2, 0LL);
  return v13;
}

          Value = 0LL;
        }
      }

uint64_t sub_18823CFC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 216) = a2;
  return result;
}

uint64_t sub_18823CFCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 224) = a2;
  return result;
}

uint64_t sub_18823CFD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 208) = a2;
  return result;
}

uint64_t sub_18823CFDC(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t sub_18823CFE4(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

uint64_t sub_18823CFEC(uint64_t a1, char *a2)
{
  *(void *)(a1 + 200) = a2;
  return 0LL;
}

uint64_t sub_18823D024(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = 1LL;
  if (a2 < 2) {
    goto LABEL_10;
  }
  if (a2 != 3)
  {
    if (a2 != 1003) {
      return 22LL;
    }
    int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 568LL))(a1);
    if (v4) {
      (*(void (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
    uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 80LL))(v5, 3LL);
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)a1 + 272LL))(a1);
    }
    if (!(_DWORD)v3)
    {
      uint64_t v3 = 1003LL;
LABEL_10:
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 560LL))(a1, v3);
      return 0LL;
    }
  }

  return v3;
}

BOOL sub_18823D0F4(uint64_t a1)
{
  return *(_DWORD *)(a1 + 208) != 0;
}

uint64_t sub_18823D104(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 208);
  return 0LL;
}

BOOL sub_18823D114(uint64_t a1)
{
  return *(_DWORD *)(a1 + 212) != 0;
}

__n128 sub_18823D124(uint64_t a1, __n128 *a2)
{
  __n128 result = *(__n128 *)(a1 + 296);
  *a2 = result;
  return result;
}

uint64_t sub_18823D134(uint64_t a1)
{
  return *(unsigned int *)(a1 + 288);
}

uint64_t sub_18823D13C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 292);
}

uint64_t sub_18823D144(uint64_t a1, const __CFDictionary *a2, char **a3, CFTypeRef *a4)
{
  CFStringRef appendedString = 0LL;
  uint64_t v14 = 0LL;
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (!a3) {
    return 22LL;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  if (!Mutable) {
    return 999LL;
  }
  uint64_t v9 = Mutable;
  uint64_t v10 = sub_18823D268(a1, a2, (uint64_t)&v14, (uint64_t)&appendedString);
  if (appendedString) {
    CFStringAppend(v9, appendedString);
  }
  int v11 = v14;
  if ((_DWORD)v10 && v14)
  {
    DIDiskImageObjectRelease(v14);
    int v11 = 0LL;
    uint64_t v14 = 0LL;
  }

  if (appendedString)
  {
    CFRelease(appendedString);
    CFStringRef appendedString = 0LL;
    int v11 = v14;
  }

  *a3 = v11;
  if (a4)
  {
    *a4 = v9;
    if (!CFStringGetLength(v9) && *a4)
    {
      CFRelease(*a4);
      *a4 = 0LL;
    }
  }

  else
  {
    CFRelease(v9);
  }

  return v10;
}

uint64_t sub_18823D268(uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4)
{
  if (!off_18C703268) {
    return 110LL;
  }
  int v8 = 0;
  unsigned int v9 = 0;
  uint64_t v10 = &off_18C7032C0;
  unsigned int v11 = -1;
  do
  {
    uint64_t v12 = (uint64_t (*)(uint64_t, const __CFDictionary *))*(v10 - 19);
    if (v12)
    {
      int v13 = v12(a1, a2);
      if (v13 > v8)
      {
        int v8 = v13;
        unsigned int v11 = v9;
      }
    }

    ++v9;
    uint64_t v14 = *v10;
    v10 += 11;
  }

  while (v14);
  if ((v11 & 0x80000000) != 0) {
    return 110LL;
  }
  if (CFStringCompare((CFStringRef)qword_18C703220[11 * v11 + 9], @"CNotSupportedDiskImage", 0LL))
  {
    if (a2)
    {
      value = 0LL;
      if (CFDictionaryGetValueIfPresent(a2, @"udif-chunk-size", (const void **)&value))
      {
        CFTypeID v15 = CFGetTypeID(value);
        if (v15 == CFNumberGetTypeID()
          && CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v18)
          && (unint64_t)(v18 - 2097153) < 0xFFFFFFFFFFE001FFLL)
        {
          return 22LL;
        }
      }
    }

    uint64_t v17 = (uint64_t (*)(uint64_t, const __CFDictionary *, uint64_t, uint64_t))qword_18C703220[11 * v11 + 2];
    if (v17) {
      return v17(a1, a2, a3, a4);
    }
    return 110LL;
  }

  return 123LL;
}

uint64_t sub_18823D3CC(uint64_t a1, uint64_t a2)
{
  if (!off_18C703268) {
    return 0xFFFFFFFFLL;
  }
  int v4 = 0;
  unsigned int v5 = 0;
  uint64_t v6 = &off_18C7032C0;
  uint64_t v7 = 0xFFFFFFFFLL;
  do
  {
    int v8 = (uint64_t (*)(uint64_t, uint64_t))*(v6 - 19);
    if (v8)
    {
      int v9 = v8(a1, a2);
      if (v9 <= v4)
      {
        uint64_t v7 = v7;
      }

      else
      {
        int v4 = v9;
        uint64_t v7 = v5;
      }
    }

    ++v5;
    uint64_t v10 = *v6;
    v6 += 11;
  }

  while (v10);
  return v7;
}

uint64_t sub_18823D454(const void *a1, CFDictionaryRef theDict)
{
  if ((int)sub_188239F2C(theDict, @"diskimage-class", @"CUDIFDiskImage") > 0
    || (int)sub_188239F2C(theDict, @"diskimage-class", @"CRestrictedUDIFDiskImage") > 0)
  {
    return 9999LL;
  }

  if ((sub_188239F2C(theDict, @"diskimage-class", @"CUDIFDiskImage") & 0x80000000) == 0
    && a1
    && __dynamic_cast( a1,  (const struct __class_type_info *)&unk_18A20ABD8,  (const struct __class_type_info *)&unk_18A20D3D0,  0LL))
  {
    return 1000LL;
  }

  return 4294966296LL;
}

uint64_t sub_18823D508(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 208LL))(result);
  }
  return result;
}

uint64_t sub_18823D520(uint64_t a1, CFDictionaryRef theDict)
{
  if ((sub_188239F2C(theDict, @"diskimage-class", @"CSparseDiskImage") & 0x80000000) != 0) {
    return 4294967196LL;
  }
  unsigned int v5 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 208LL))(a1);
  if (v5 && CFStringCompare(v5, @"sparseimage", 1uLL) == kCFCompareEqualTo) {
    return 1000LL;
  }
  else {
    return sub_18823D624(a1);
  }
}

uint64_t sub_18823D5C8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 200);
  if (v1)
  {
    if (__dynamic_cast( *(const void **)(result + 200),  (const struct __class_type_info *)&unk_18A20ABD8,  (const struct __class_type_info *)&unk_18A20CA30,  0LL))
    {
      return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 488LL))(v1);
    }

    else
    {
      return v1;
    }
  }

  return result;
}

uint64_t sub_18823D624(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (sub_18823D738(a1, (uint64_t)v4, 64LL))
  {
    uint64_t v2 = 0LL;
  }

  else if (sub_18825E818((uint64_t)v4))
  {
    uint64_t v2 = 1000LL;
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  (*(void (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
  return v2;
}

uint64_t sub_18823D6D8(void *a1)
{
  else {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 272LL))(v2);
  }
  (*(void (**)(void *))(*a1 + 576LL))(a1);
  return v3;
}

uint64_t sub_18823D738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void, uint64_t, _BYTE *, uint64_t))(*(void *)a1 + 328LL))( a1,  0LL,  a3,  v7,  a2);
  if (!(_DWORD)v5) {
    sub_18823D848(a2, (unint64_t)(a3 + 0x3FFFFFFC0LL) >> 2);
  }
  return v5;
}

uint64_t sub_18823D7A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a5) {
    return 22LL;
  }
  unint64_t v8 = a1[94];
  uint64_t v12 = (*(uint64_t (**)(void *))(*a1 + 496LL))(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 328LL))( v12,  a1[93] + a2,  a3,  a4,  a5);
}

uint64_t sub_18823D840(uint64_t a1)
{
  return *(void *)(a1 + 200);
}

uint64_t sub_18823D848(uint64_t result, unsigned int a2)
{
  *(int8x16_t *)uint64_t result = vrev32q_s8(*(int8x16_t *)result);
  *(_DWORD *)(result + 16) = bswap32(*(_DWORD *)(result + 16));
  *(int8x16_t *)(result + 20) = vrev64q_s8(*(int8x16_t *)(result + 20));
  if (a2)
  {
    uint64_t v2 = a2;
    uint64_t v3 = (unsigned int *)(result + 64);
    do
    {
      *uint64_t v3 = bswap32(*v3);
      ++v3;
      --v2;
    }

    while (v2);
  }

  return result;
}

uint64_t sub_18823D890(void *a1)
{
  if (((*(uint64_t (**)(void *))(*a1 + 568LL))(a1) & 1) == 0)
  {
    uint64_t v2 = a1[25];
    if (v2) {
      (*(void (**)(uint64_t, void))(*(void *)v2 + 280LL))(v2, 0LL);
    }
  }

  return 0LL;
}

uint64_t sub_18823D8E8(const void *a1, CFDictionaryRef theDict)
{
  if ((sub_188239F2C(theDict, @"diskimage-class", @"CRawDiskImage") & 0x80000000) != 0) {
    return 4294966296LL;
  }
  uint64_t result = sub_18823D9BC((uint64_t)a1);
  if ((result & 0x80000000) == 0)
  {
    unsigned int v6 = 0;
    if (a1
      && __dynamic_cast( a1,  (const struct __class_type_info *)&unk_18A20ABD8,  (const struct __class_type_info *)&unk_18A20D3D0,  0LL))
    {
      return 4294966296LL;
    }

    int v5 = sub_18824E14C((uint64_t)a1, &v6);
    uint64_t result = v6;
    if (!v5 && (v6 & 0x80000000) == 0)
    {
      sub_18824E218((uint64_t)a1, &v6);
      return v6;
    }
  }

  return result;
}

uint64_t sub_18823D9BC(uint64_t a1)
{
  CFTypeID v15 = 0LL;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if ((*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)a1 + 296LL))(a1, &v18)
    || (v18 ? (BOOL v3 = (v18 & 0x1FF) == 0) : (BOOL v3 = 0),
        !v3
     || (CFDictionarySetValue(Mutable, @"writeable", (const void *)*MEMORY[0x189604DE0]),
         sub_18824DB74(a1, (uint64_t)Mutable, &v15, 0LL))))
  {
    int v4 = 0LL;
LABEL_9:
    uint64_t v5 = 4294967196LL;
    goto LABEL_10;
  }

  uint64_t v7 = sub_188249440(v15, 0LL);
  int v4 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  Value = (const __CFArray *)CFDictionaryGetValue(v7, @"partitions");
  if (!Value) {
    goto LABEL_9;
  }
  int v9 = Value;
  CFIndex Count = CFArrayGetCount(Value);
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, Count - 1);
  if (!ValueAtIndex) {
    goto LABEL_9;
  }
  uint64_t v12 = ValueAtIndex;
  int v13 = (const __CFNumber *)sub_188245490(ValueAtIndex, @"partition-start");
  if (!v13) {
    goto LABEL_9;
  }
  if (!CFNumberGetValue(v13, kCFNumberSInt64Type, &valuePtr)) {
    goto LABEL_9;
  }
  uint64_t v14 = (const __CFNumber *)sub_188245490(v12, @"partition-length");
  if (!v14) {
    goto LABEL_9;
  }
  uint64_t v5 = 4294967196LL;
  if (CFNumberGetValue(v14, kCFNumberSInt64Type, &v16))
  {
    if (v18 >= (v16 + valuePtr) << 9) {
      uint64_t v5 = 0LL;
    }
    else {
      uint64_t v5 = 4294967196LL;
    }
  }

LABEL_10:
  if (v15)
  {
    DIDiskImageObjectRelease(v15);
    CFTypeID v15 = 0LL;
  }

  if (v4) {
    CFRelease(v4);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v5;
}

  if (!a3)
  {
LABEL_32:
    uint64_t v14 = 0LL;
    int v13 = 0LL;
    goto LABEL_39;
  }

  uint64_t v14 = a3;
  uint64_t v26 = a4;
  int8x16_t v27 = a3;
  while (1)
  {
    CFTypeID v15 = a1[61];
    uint64_t v16 = a2 % v15;
    if (v14 < v15 || v16) {
      break;
    }
    if (v14 / v15 * v15 >= 32 * v15) {
      uint64_t v17 = 32 * v15;
    }
    else {
      uint64_t v17 = v14 / v15 * v15;
    }
    sub_18824F1FC((uint64_t)a1, a2 / v15, v17 / v15, (uint64_t)a5, v12);
    uint64_t v18 = (*(uint64_t (**)(uint64_t, int64_t, size_t, unint64_t *, uint64_t))(*(void *)v10
                                                                                                  + 336LL))( v10,  a1[63] + a2,  v17,  &v29,  v12);
    if ((_DWORD)v18)
    {
      int v13 = v18;
      unsigned int v11 = (pthread_rwlock_t *)(a1 + 26);
      goto LABEL_44;
    }

    uint64_t v19 = v29 == v17;
LABEL_29:
    unsigned int v11 = (pthread_rwlock_t *)(a1 + 26);
    if (!v19)
    {
      int v13 = 5LL;
LABEL_44:
      a3 = v27;
      goto LABEL_39;
    }

    a2 += v17;
    a5 += v17;
    v14 -= v17;
    a3 = v27;
    if (!v14) {
      goto LABEL_32;
    }
  }

  unint64_t v20 = a2 - v16;
  int v21 = a1[63];
  if ((int64_t)(a2 - v16 + v15 + v21) > a1[64])
  {
    int v22 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 312LL))(v10);
    if ((_DWORD)v22) {
      goto LABEL_42;
    }
    int v21 = a1[63];
    CFTypeID v15 = a1[61];
  }

  int v22 = (*(uint64_t (**)(uint64_t, unint64_t, size_t, unint64_t *, uint64_t))(*(void *)v10
                                                                                                  + 328LL))( v10,  v21 + v20,  v15,  &v29,  v12);
  if ((_DWORD)v22)
  {
LABEL_42:
    int v13 = v22;
    goto LABEL_46;
  }

  if (v29 == a1[61])
  {
    sub_18824F50C((uint64_t)a1, v20 / v29, 1LL, v12);
    if (a1[61] - v16 >= v14) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = a1[61] - v16;
    }
    memcpy((void *)(v12 + v16), a5, v17);
    sub_18824F1FC((uint64_t)a1, v20 / a1[61], 1LL, v12, v12);
    unint64_t v23 = (*(uint64_t (**)(uint64_t, unint64_t, void, uint64_t *, uint64_t))(*(void *)v10 + 336LL))( v10,  a1[63] + v20,  a1[61],  &v28,  v12);
    if ((_DWORD)v23)
    {
      int v13 = v23;
      a4 = v26;
      a3 = v27;
      goto LABEL_48;
    }

    uint64_t v19 = v28 == a1[61];
    a4 = v26;
    goto LABEL_29;
  }

  int v13 = 5LL;
LABEL_46:
  a4 = v26;
LABEL_48:
  unsigned int v11 = (pthread_rwlock_t *)(a1 + 26);
LABEL_39:
  pthread_rwlock_unlock(v11);
  if (a4) {
    *a4 = a3 - v14;
  }
  return v13;
}

    if (v1 == 1) {
      break;
    }
    unint64_t v8 = *(void *)(a1 + 80);
    int v9 = v8 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * (v1 - 2);
    uint64_t v10 = *(void *)(v9 + 12);
    *(void *)(v9 + 12) = 0LL;
    *(_DWORD *)(v9 + 8) |= 1u;
    unsigned int v11 = *(void **)(a1 + 80);
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
    int v13 = realloc(v11, v12 * (*(_DWORD *)(a1 + 32) - 1));
    if (!v13) {
      return 12LL;
    }
    *(void *)(a1 + 80) = v13;
    --*(_DWORD *)(a1 + 32);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t result = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 312LL))(*(void *)(a1 + 24), v10);
    if ((_DWORD)result) {
      return result;
    }
    *(void *)(a1 + 112) = v10;
    *(void *)(a1 + 120) = v10;
    (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472LL))(*(void *)(a1 + 24), 1LL);
    uint64_t v1 = v3;
    if (!(_DWORD)v3) {
      return 0LL;
    }
  }

  uint64_t v16 = *(void *)(a1 + 72);
  CFTypeID v15 = *(void **)(a1 + 80);
  uint64_t v17 = *(void *)(v16 + 20);
  *(_DWORD *)(v16 + 12) |= 1u;
  *(void *)(v16 + 20) = 0LL;
  if (v15)
  {
    free(v15);
    *(void *)(a1 + 80) = 0LL;
  }

  *(_DWORD *)(a1 + 32) = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
  if (!(_DWORD)result)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 312LL))(*(void *)(a1 + 24), v17);
    if (!(_DWORD)result)
    {
      *(void *)(a1 + 112) = v17;
      *(void *)(a1 + 120) = v17;
      (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472LL))(*(void *)(a1 + 24), 1LL);
      return 0LL;
    }
  }

  return result;
}

      uint64_t v17 = v36;
      goto LABEL_11;
    }

    uint64_t v7 = 0;
LABEL_11:
    if (v17 == 2)
    {
      int v21 = 0LL;
      int v22 = v7 == 4 && a6 == 1;
      unint64_t v23 = v35;
      if (v22) {
        unint64_t v23 = 0;
      }
      int v35 = v23;
      goto LABEL_37;
    }

    if (v17 == 1)
    {
      uint64_t v18 = v37;
      if (v12 > v37) {
        goto LABEL_53;
      }
      uint64_t v19 = v12;
      unint64_t v20 = v37 - v34;
      if (v37 - v34 < v35)
      {
        v13 += v20;
        int v21 = 0LL;
        if (v38)
        {
          v13 += v38;
          v34 = v38 + v37;
        }

        else
        {
          v34 = v37;
        }

        goto LABEL_36;
      }

      if (v13)
      {
        int v25 = sub_1882657C8(v32, v13, a4, a5);
        if ((_DWORD)v25)
        {
          int v21 = v25;
LABEL_36:
          uint64_t v12 = v19;
          goto LABEL_37;
        }

        v19 += v13;
      }

      int v21 = sub_1882657C8(v32, v20, 2, a5);
      if (!(_DWORD)v21)
      {
        uint64_t v12 = v19 + v20;
        int v13 = v38;
        v34 = v38 + v18;
        goto LABEL_37;
      }

      int v13 = 0LL;
      goto LABEL_36;
    }

    int v21 = 0LL;
LABEL_37:
    ++v11;
    if ((_DWORD)v21) {
      goto LABEL_57;
    }
  }

  if (v13)
  {
    uint64_t v26 = sub_1882657C8(v32, v13, a4, a5);
    if ((_DWORD)v26)
    {
      int v21 = v26;
      goto LABEL_57;
    }

    v12 += v13;
  }

  if (a3 < v12)
  {
LABEL_53:
    int v21 = 999LL;
    goto LABEL_57;
  }

  if (a3 == v12 || (int v21 = sub_1882657C8(v32, a3 - v12, 2, a5), !(_DWORD)v21))
  {
    int v21 = 0LL;
    uint64_t v12 = a3;
  }

uint64_t sub_18823DB4C(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 216);
  }
  return 0LL;
}

uint64_t sub_18823DB60(uint64_t a1, CFDictionaryRef theDict, char **a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  uint64_t v7 = 22LL;
  if (a1 && a3)
  {
    if (((int)sub_188239F2C(theDict, @"diskimage-class", @"CRestrictedUDIFDiskImage") > 0
       || sub_188239FB0(theDict, @"restricted-only", 0))
      && ((*(void (**)(uint64_t, void *))(*(void *)a1 + 704LL))(a1, v12), v13 >= 2))
    {
      unint64_t v8 = (char *)operator new(0x410uLL);
      sub_18823DD44((uint64_t)v8);
      *(void *)unint64_t v8 = off_18A20C438;
    }

    else
    {
      unint64_t v8 = (char *)operator new(0x410uLL);
      sub_18823DD44((uint64_t)v8);
    }

    if (theDict)
    {
      v12[0] = -1LL;
      if (CFDictionaryGetValueIfPresent(theDict, @"udif-chunk-size", (const void **)&v11))
      {
        if (!sub_18824D608(v11, kCFNumberSInt64Type, v12))
        {
          uint64_t v7 = 999LL;
LABEL_25:
          sub_18823ADA4(v8);
          unint64_t v8 = 0LL;
LABEL_26:
          *a3 = v8;
          return v7;
        }

        uint64_t v9 = v12[0];
        if (v12[0] < 0LL) {
          uint64_t v9 = 2048LL;
        }
      }

      else
      {
        uint64_t v9 = 2048LL;
      }

      *((void *)v8 + 115) = v9;
    }

    uint64_t v7 = (*(uint64_t (**)(char *, uint64_t, CFDictionaryRef))(*(void *)v8 + 568LL))(v8, a1, theDict);
    if (!(_DWORD)v7) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }

  return v7;
}

void sub_18823DD24(_Unwind_Exception *a1)
{
}

uint64_t sub_18823DD44(uint64_t a1)
{
  uint64_t v2 = sub_18823DDF4(a1);
  *(void *)uint64_t v2 = off_18A20C1A8;
  pthread_rwlock_init((pthread_rwlock_t *)(v2 + 160), 0LL);
  (*(void (**)(uint64_t, const __CFString *, void))(*(void *)a1 + 32LL))( a1,  @"thread-safe",  *MEMORY[0x189604DE8]);
  bzero((void *)(a1 + 360), 0x22EuLL);
  *(void *)(a1 + 920) = -1LL;
  *(_OWORD *)(a1 + 928) = 0u;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 944), 0LL);
  *(_DWORD *)(a1 + 1028) = 0;
  *(_BYTE *)(a1 + 1032) = 0;
  *(_OWORD *)(a1 + 1008) = 0u;
  *(_BYTE *)(a1 + 1024) = 0;
  return a1;
}

void sub_18823DDDC(_Unwind_Exception *a1)
{
}

uint64_t sub_18823DDF4(uint64_t a1)
{
  uint64_t result = sub_18823A554(a1);
  *(void *)uint64_t result = off_18A20B6C8;
  *(void *)(result + 136) = 0LL;
  *(_DWORD *)(result + 144) = 0;
  *(_BYTE *)(result + 148) = 0;
  *(void *)(result + 152) = 0LL;
  *(void *)(result + 112) = 0LL;
  *(void *)(result + 120) = 0LL;
  *(void *)(result + 104) = 0LL;
  *(_BYTE *)(result + 128) = 0;
  return result;
}

BOOL sub_18823DE30(uint64_t a1, __CFString *theString1, const __CFString *a3)
{
  if (CFStringCompare(theString1, @"cache enabled", 0LL)) {
    return sub_18823DF90(a1, theString1, a3);
  }
  if (!a3)
  {
    unsigned int valuePtr = 0;
    goto LABEL_11;
  }

  CFTypeID v7 = CFGetTypeID(a3);
  if (v7 == CFBooleanGetTypeID())
  {
    int Value = CFBooleanGetValue((CFBooleanRef)a3);
    uint64_t v9 = 5LL;
    if (Value) {
      int v10 = 5;
    }
    else {
      int v10 = 0;
    }
    unsigned int valuePtr = v10;
    if (!Value) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v13 = *(void *)(a1 + 368);
    if (v13)
    {
      (*(void (**)(uint64_t))(*(void *)v13 + 8LL))(v13);
      uint64_t v9 = valuePtr;
    }

    uint64_t v14 = operator new(0xE0uLL);
    sub_188244544(v14, v9);
    *(void *)(a1 + 368) = v14;
    return sub_18823A7AC(a1, theString1, a3);
  }

  CFTypeID v12 = CFGetTypeID(a3);
  if (v12 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, &valuePtr);
    uint64_t v9 = valuePtr;
    if (valuePtr) {
      goto LABEL_16;
    }
LABEL_11:
    uint64_t v11 = *(void *)(a1 + 368);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8LL))(v11);
    }
    *(void *)(a1 + 368) = 0LL;
    return sub_18823A7AC(a1, theString1, a3);
  }

  return 0LL;
}

void sub_18823DF7C(_Unwind_Exception *a1)
{
}

BOOL sub_18823DF90(uint64_t a1, __CFString *theString1, const __CFString *a3)
{
  if (!theString1 || CFStringCompare(theString1, @"cache enabled", 0LL) == kCFCompareEqualTo) {
    return 0LL;
  }
  if (CFStringCompare(theString1, @"on IO thread", 0LL) == kCFCompareEqualTo)
  {
    if (a3)
    {
      CFTypeID v6 = CFGetTypeID(a3);
      if (v6 != CFBooleanGetTypeID()) {
        return 0LL;
      }
      BOOL v7 = CFBooleanGetValue((CFBooleanRef)a3) != 0;
    }

    else
    {
      BOOL v7 = 0LL;
    }

    uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  }

  if (!CFEqual(theString1, @"di-valid-cached-checksum")) {
    return sub_18823A7AC(a1, theString1, a3);
  }
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  if (!v9) {
    return 0LL;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 488LL))(v9);
  if (!v10) {
    return 0LL;
  }
  uint64_t v11 = v10;
  int v12 = (*(uint64_t (**)(uint64_t, const __CFString *, void))(*(void *)v10 + 128LL))( v10,  @"com.apple.diskimages.recentcksum",  0LL);
  uint64_t v13 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 544LL))(a1);
  if (!v13) {
    return 0LL;
  }
  uint64_t v14 = v13;
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation( (CFAllocatorRef)*MEMORY[0x189604DB0],  v13,  0x8000100u,  0);
  if (!ExternalRepresentation)
  {
    CFRelease(v14);
    return 0LL;
  }

  CFDataRef v16 = ExternalRepresentation;
  BOOL v17 = (*(unsigned int (**)(uint64_t, const __CFString *, CFDataRef))(*(void *)v11 + 128LL))( v11,  @"com.apple.diskimages.recentcksum",  ExternalRepresentation) == 0;
  CFRelease(v14);
  CFRelease(v16);
  return v17;
}

uint64_t sub_18823E16C(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t sub_18823E174(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 72LL))(result);
  }
  return result;
}

uint64_t sub_18823E18C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 148) = a2;
  return result;
}

void *sub_18823E194(uint64_t a1, void *__dst)
{
  return memcpy(__dst, (const void *)(a1 + 232), 0x200uLL);
}

uint64_t sub_18823E1A8(uint64_t *a1, char **a2)
{
  CFDataRef v29 = 0LL;
  if (a2)
  {
    *a2 = 0LL;
    int v4 = (*(uint64_t (**)(uint64_t *))(*a1 + 616))(a1);
    uint64_t v5 = *a1;
    if (v4)
    {
      CFIndex Code = 0LL;
      CFDataRef v29 = (char *)(*(uint64_t (**)(uint64_t *))(v5 + 640))(a1);
      if (v29)
      {
LABEL_4:
        (*(void (**)(uint64_t *))(*a1 + 624))(a1);
        BOOL v7 = v29;
LABEL_10:
        *a2 = v7;
        return Code;
      }

LABEL_36:
            if (error)
            {
              CFRelease(error);
              CFErrorRef error = 0LL;
            }

            if (!v10)
            {
LABEL_42:
              if (v17) {
                CFRelease(v17);
              }
              if (v19) {
                CFRelease(v19);
              }
              if (v22) {
                CFRelease(v22);
              }
              if ((_DWORD)Code && a1[95] && a1[96])
              {
                fprintf( (FILE *)*MEMORY[0x1895F89D0],  "CUDIFEncoding::openResourceFile XML failed (contain non-XML embedded rsrc fork) - %d\n",  Code);
LABEL_52:
                CFIndex Code = 78LL;
              }

LABEL_8:
              if (v29) {
                goto LABEL_4;
              }
              goto LABEL_9;
            }

LABEL_41:
            free(v10);
            goto LABEL_42;
          }

LABEL_57:
          CFIndex Code = 4294962336LL;
          goto LABEL_36;
        }

        if (!error)
        {
          uint64_t v19 = 0LL;
          int v22 = 0LL;
          CFIndex Code = 4294962336LL;
          goto LABEL_41;
        }

        CFIndex Code = CFErrorGetCode(error);
LABEL_32:
        uint64_t v19 = 0LL;
        int v22 = 0LL;
        goto LABEL_36;
      }
    }

    BOOL v17 = 0LL;
    goto LABEL_32;
  }

  return 22LL;
}

  nullsub_4(v32);
  if (a7) {
    *a7 = v12;
  }
  return v21;
}

BOOL sub_18823E538(uint64_t a1)
{
  return *(_DWORD *)(a1 + 172) > 0;
}

uint64_t sub_18823E548(__CFDictionary *a1, int a2, void *a3)
{
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  CFTypeID v6 = operator new(0x78uLL);
  sub_18823E5B8((uint64_t)v6, a1, a2);
  uint64_t result = 0LL;
  *a3 = v6;
  return result;
}

void sub_18823E5A4(_Unwind_Exception *a1)
{
}

uint64_t sub_18823E5B8(uint64_t a1, CFMutableDictionaryRef Mutable, int a3)
{
  CFTypeID v6 = sub_18823E678(a1);
  *CFTypeID v6 = off_18A20D570;
  v6[13] = 0LL;
  *((_BYTE *)v6 + 114) = a3 == 3;
  *((_WORD *)v6 + 56) = 0;
  *((_BYTE *)v6 + 115) = 1;
  if (Mutable) {
    CFRetain(Mutable);
  }
  else {
    CFMutableStringRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  }
  sub_18823E698(a1, Mutable);
  CFRelease(Mutable);
  return a1;
}

void sub_18823E660(_Unwind_Exception *a1)
{
}

void *sub_18823E678(uint64_t a1)
{
  uint64_t result = (void *)sub_18823A554(a1);
  *uint64_t result = off_18A20D3F8;
  return result;
}

void sub_18823E698(uint64_t a1, CFPropertyListRef propertyList)
{
  if (*(void *)(a1 + 104))
  {
    sub_18823FD90(a1);
    int v4 = *(const void **)(a1 + 104);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 104) = 0LL;
    }
  }

  if (propertyList) {
    *(void *)(a1 + 104) = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x189604DB0], propertyList, 2uLL);
  }
}

uint64_t sub_18823E6F8(uint64_t a1)
{
  *(_WORD *)(a1 + 112) = 0;
  return 0LL;
}

void sub_18823E720(uint64_t a1)
{
  uint64_t v1 = *(const __CFDictionary **)(a1 + 104);
  if (v1)
  {
    size_t Count = CFDictionaryGetCount(v1);
    if (Count)
    {
      int64_t v3 = Count;
      int v4 = (const void **)calloc(Count, 8uLL);
      if (v4)
      {
        uint64_t v5 = v4;
        CFTypeID v6 = (const void **)calloc(v3, 8uLL);
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v5, v6);
        if (v3 >= 1)
        {
          for (uint64_t i = 0LL; i != v3; ++i)
          {
            uint64_t v8 = (const __CFArray *)v6[i];
            if (v8)
            {
              CFIndex v9 = CFArrayGetCount((CFArrayRef)v6[i]);
              if (v9 >= 1)
              {
                CFIndex v10 = v9;
                for (CFIndex j = 0LL; j != v10; ++j)
                {
                  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, j);
                  if (ValueAtIndex)
                  {
                    uint64_t v13 = ValueAtIndex;
                    int v17 = 0;
                    if (sub_18823E874(ValueAtIndex, @"Attributes", &v17))
                    {
                      if (sub_18823E874(v13, @"ID", (_WORD *)&v17 + 1) && (v17 & 4) != 0)
                      {
                        int v14 = sub_18823F52C((const __CFString *)v5[i]);
                        sub_18823EFD0(a1, v14, v13, &v16);
                      }
                    }
                  }
                }
              }
            }
          }
        }

        free(v5);
        if (v6) {
          free(v6);
        }
      }
    }
  }

uint64_t sub_18823E874(const __CFDictionary *a1, const void *a2, _WORD *a3)
{
  __int16 valuePtr = 0;
  if (!a1 || !a3)
  {
    if (!a3) {
      return 0LL;
    }
    goto LABEL_17;
  }

  int Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    goto LABEL_13;
  }
  uint64_t v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFStringGetTypeID())
  {
    CFTypeID v11 = CFGetTypeID(v5);
    if (v11 == CFNumberGetTypeID())
    {
      int v12 = CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt16Type, &valuePtr);
      __int16 v13 = valuePtr;
      if (v12)
      {
        *a3 = valuePtr;
        return 1LL;
      }

LABEL_14:
      uint64_t v10 = 0LL;
      *a3 = v13;
      return v10;
    }

  int v14 = 0LL;
LABEL_15:
  *a4 = v18;
  return v14;
}

    uint64_t v8 = 0LL;
LABEL_11:
    *a3 = v8;
    return result;
  }

  uint64_t result = 0LL;
  if (a3) {
    goto LABEL_14;
  }
  return result;
}

  DIDiskImageObjectRelease(v3);
  return v7;
}

        ++*(_WORD *)(a2 + 16);
        return;
      }

      BOOL v7 = *(void *)(a2 + 8);
      uint64_t v8 = *(unsigned int *)(a2 + 36);
      *(_DWORD *)(a2 + 36) = v8 + 1;
      *(_BYTE *)(v7 + v8) = (_BYTE)v3;
      *(_BYTE *)(a2 + (__int16)v5 + 48) = (_BYTE)v3;
      uint64_t v5 = (v5 + 1) & 0xFFF;
      ++v4;
LABEL_10:
      uint64_t v15 = *(_DWORD *)(a2 + 28);
      if (v4 > v15) {
        *(_DWORD *)(a2 + 28) = v15 + 16;
      }
      if (v4 >= *(_DWORD *)(a2 + 44)) {
        return;
      }
    }
  }

LABEL_13:
    __int16 v13 = 0;
    goto LABEL_14;
  }

  BOOL v7 = (const char *)sub_18823A098(v5, 0x600u);
  if (!v7)
  {
LABEL_17:
    uint64_t v10 = 0LL;
    *a3 = 0;
    return v10;
  }

  uint64_t v8 = (char *)v7;
  if (!*v7)
  {
    __int16 v9 = 0;
    goto LABEL_20;
  }

  __int16 v9 = strtol(v7, &v15, 0);
  if (*v15)
  {
LABEL_20:
    uint64_t v10 = 0LL;
    goto LABEL_9;
  }

  uint64_t v10 = 1LL;
LABEL_9:
  *a3 = v9;
  free(v8);
  return v10;
}

  *a2 = v8;
  if (a3) {
    goto LABEL_22;
  }
LABEL_23:
  if (v9) {
    DIDiskImageObjectRelease(v9);
  }
  return v10;
}

    BOOL v7 = 0LL;
  }

char *sub_18823E988(uint64_t a1, char *a2)
{
  if (a2) {
    DIDiskImageObjectRetain_0(a2);
  }
  uint64_t result = *(char **)(a1 + 184);
  if (result) {
    uint64_t result = (char *)DIDiskImageObjectRelease(result);
  }
  *(void *)(a1 + 184) = a2;
  return result;
}

uint64_t sub_18823E9C4(uint64_t result)
{
  return result;
}

uint64_t sub_18823E9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t result = sub_18823ECB0(a1, a2, &v26, &v25);
  if (!(_DWORD)result)
  {
    __int16 v5 = v25;
    __int16 v6 = v26;
    __int16 v7 = v25 - v26 + 1;
    *(_WORD *)(a1 + 912) = v7;
    *(_WORD *)(a1 + 914) = v6;
    *(_WORD *)(a1 + 916) = v5;
    size_t v8 = 8LL * v7;
    __int16 v9 = malloc(v8);
    *(void *)(a1 + 928) = v9;
    if (v9
      && (bzero(v9, v8),
          uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0],
          CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]),
          (*(void *)(a1 + 936) = Mutable) != 0LL))
    {
      if (*(__int16 *)(a1 + 912) >= 1)
      {
        uint64_t v12 = 0LL;
        for (__int16 i = v26; ; ++i)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t **))(*(void *)a2 + 120LL))( a2,  1651272568LL,  i,  &v24);
          if ((_DWORD)result) {
            return result;
          }
          if (*(_DWORD *)*v24 != 1752394093 || *(_DWORD *)(*v24 + 4) != 0x1000000) {
            return 107LL;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 320LL))(a2);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a2 + 248LL))(a2, v24);
          if ((_DWORD)result) {
            return result;
          }
          *(void *)(*(void *)(a1 + 928) + 8 * v12) = v24;
          if (cf) {
            break;
          }
          CFStringRef v17 = CFStringCreateWithPascalString(v10, pStr, 0);
          if (!v17)
          {
            if (i != -1)
            {
              int v20 = DIGetBundleRef();
              int v21 = (const __CFString *)sub_1882660CC(v20, (int)@"partition %d", @"partition %d");
              CFStringRef v16 = CFStringCreateWithFormat(v10, 0LL, v21, i);
              CFRelease(v21);
LABEL_17:
              CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v16);
              if (!v16) {
                goto LABEL_22;
              }
              goto LABEL_21;
            }

            int v22 = DIGetBundleRef();
            uint64_t v15 = (const __CFString *)sub_1882660CC( v22,  (int)@"Driver Descriptor Map",  @"Driver Descriptor Map");
LABEL_16:
            CFStringRef v16 = v15;
            goto LABEL_17;
          }

          CFStringRef v16 = v17;
          CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v17);
LABEL_21:
          CFRelease(v16);
LABEL_22:
          nullsub_4(v24);
          uint64_t v18 = *v24;
          unint64_t v19 = sub_1882661C8((uint64_t)v24);
          if (++v12 >= *(__int16 *)(a1 + 912))
          {
            if (*(_WORD *)(a1 + 912) != 3) {
              return 0LL;
            }
            if (*(void *)(**(void **)(*(void *)(a1 + 928) + 8LL) + 16LL)
               + *(void *)(**(void **)(*(void *)(a1 + 928) + 8LL) + 8LL) <= *(void *)(**(void **)(*(void *)(a1 + 928) + 16LL)
                                                                                            + 8LL))
              return 0LL;
            else {
              return 107LL;
            }
          }
        }

        uint64_t v15 = (const __CFString *)CFRetain(cf);
        goto LABEL_16;
      }

      return 0LL;
    }

    else
    {
      return 12LL;
    }
  }

  return result;
}

uint64_t sub_18823ECB0(uint64_t a1, uint64_t a2, __int16 *a3, _WORD *a4)
{
  __int16 v14 = 0;
  if (a3 && a4)
  {
    if (a2)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(*(void *)a2 + 96LL))(a2, 1651272568LL, &v14);
      if ((_DWORD)result)
      {
        __int16 v8 = 0;
        __int16 v13 = 0;
      }

      else
      {
        __int16 v8 = v14;
        if (v14)
        {
          int v9 = *(_DWORD *)(a1 + 880);
          __int16 v8 = v14 - 2;
          if (v9) {
            unsigned int v10 = 107;
          }
          else {
            unsigned int v10 = 0;
          }
          if (v9) {
            __int16 v11 = 0;
          }
          else {
            __int16 v11 = v14 - 1;
          }
          if (v9 == 1)
          {
            unsigned int v10 = 0;
            __int16 v12 = -1;
          }

          else
          {
            __int16 v8 = v11;
            __int16 v12 = 0;
          }

          if (v9 == 2) {
            uint64_t result = 0LL;
          }
          else {
            uint64_t result = v10;
          }
          if (v9 == 2)
          {
            __int16 v8 = v14 - 1;
            __int16 v13 = 0;
          }

          else
          {
            __int16 v13 = v12;
          }
        }

        else
        {
          __int16 v13 = 0;
          uint64_t result = 107LL;
        }
      }
    }

    else
    {
      __int16 v8 = 0;
      __int16 v13 = 0;
      uint64_t result = 999LL;
    }

    goto LABEL_21;
  }

  __int16 v8 = 0;
  __int16 v13 = 0;
  uint64_t result = 22LL;
  if (a3) {
LABEL_21:
  }
    *a3 = v13;
  if (a4) {
    *a4 = v8;
  }
  return result;
}

uint64_t sub_18823EDA8(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if (!a3) {
    return 4294967246LL;
  }
  uint64_t v4 = *(void *)(a1 + 104);
  if (v4)
  {
    uint64_t result = (uint64_t)sub_18823EE00(a1, a2);
    if (result)
    {
      LOWORD(v4) = CFArrayGetCount((CFArrayRef)result);
      uint64_t result = 0LL;
    }

    else
    {
      LOWORD(v4) = 0;
    }
  }

  else
  {
    uint64_t result = 4294967097LL;
  }

  *a3 = v4;
  return result;
}

const void *sub_18823EE00(uint64_t a1, unsigned int a2)
{
  if (!*(void *)(a1 + 104)) {
    return 0LL;
  }
  CFStringRef v3 = sub_18823EE58(a2);
  if (!v3) {
    return 0LL;
  }
  CFStringRef v4 = v3;
  int Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), v3);
  CFRelease(v4);
  return Value;
}

CFStringRef sub_18823EE58(unsigned int a1)
{
  *(_DWORD *)bytes = bswap32(a1);
  return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 4LL, 0, 0);
}

uint64_t sub_18823EE98(uint64_t a1, unsigned int a2, __int16 a3, void *a4)
{
  unsigned int v10 = 0LL;
  if (!a4) {
    return 4294967246LL;
  }
  __int16 v6 = *(void **)(a1 + 104);
  if (v6)
  {
    __int16 v8 = sub_18823EF20(a1, a2, a3);
    if (v8)
    {
      uint64_t result = sub_18823EFD0(a1, a2, v8, &v10);
      __int16 v6 = v10;
    }

    else
    {
      __int16 v6 = 0LL;
      uint64_t result = 4294967104LL;
    }
  }

  else
  {
    uint64_t result = 4294967097LL;
  }

  *a4 = v6;
  return result;
}

CFDictionaryRef sub_18823EF20(uint64_t a1, unsigned int a2, __int16 a3)
{
  __int16 v12 = 0;
  if (!*(void *)(a1 + 104)) {
    return 0LL;
  }
  CFStringRef v4 = (const __CFArray *)sub_18823EE00(a1, a2);
  if (!v4) {
    return 0LL;
  }
  __int16 v5 = v4;
  CFIndex Count = CFArrayGetCount(v4);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v7 = Count;
  CFIndex v8 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
    if (ValueAtIndex)
    {
      unsigned int v10 = ValueAtIndex;
      if (sub_18823E874(ValueAtIndex, @"ID", &v12))
      {
        if (v12 == a3) {
          break;
        }
      }
    }

    if (v7 == ++v8) {
      return 0LL;
    }
  }

  return v10;
}

uint64_t sub_18823EFD0(uint64_t a1, int a2, CFDictionaryRef theDict, void **a4)
{
  uint64_t v18 = 0LL;
  if (!theDict || !a4)
  {
    uint64_t v14 = 4294967246LL;
    if (!a4) {
      return v14;
    }
    goto LABEL_15;
  }

  if (sub_18823F1CC(a1, theDict, &v18))
  {
    if (*(void *)v18) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }

  uint64_t v18 = sub_188266130();
  uint64_t v7 = sub_1882660D4();
  CFIndex v8 = (void **)v18;
  if ((_DWORD)v7)
  {
    uint64_t v14 = v7;
LABEL_24:
    if ((_DWORD)v14 && v8)
    {
      sub_188266150(v8);
      uint64_t v18 = 0LL;
    }

    goto LABEL_15;
  }

  if (!v18)
  {
    uint64_t v14 = 4294967188LL;
    goto LABEL_15;
  }

  if ((sub_18823F274(0, theDict, (uint64_t)v18) & 1) == 0)
  {
    uint64_t v14 = 4294962336LL;
    CFIndex v8 = (void **)v18;
    goto LABEL_24;
  }

CFNumberRef sub_18823F1CC(int a1, CFDictionaryRef theDict, void *a3)
{
  uint64_t valuePtr = 0LL;
  if (theDict && a3)
  {
    uint64_t result = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Handle");
    if (result)
    {
      __int16 v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        int Value = CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
        uint64_t v8 = valuePtr;
        if (Value) {
          BOOL v9 = valuePtr == 0;
        }
        else {
          BOOL v9 = 1;
        }
        uint64_t result = (const __CFNumber *)!v9;
      }

      else
      {
        uint64_t v8 = 0LL;
        uint64_t result = 0LL;
      }

      goto LABEL_11;
    }

uint64_t sub_18823F274(int a1, CFMutableDictionaryRef theDict, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (!theDict) {
    return 0LL;
  }
  if (a3)
  {
    uint64_t result = (uint64_t)CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
    if (!result) {
      return result;
    }
    __int16 v5 = (const void *)result;
    CFDictionarySetValue(theDict, @"Handle", (const void *)result);
    CFRelease(v5);
  }

  else
  {
    CFDictionaryRemoveValue(theDict, @"Handle");
  }

  return 1LL;
}

uint64_t sub_18823F300(uint64_t a1, uint64_t a2, _WORD *a3, _DWORD *a4, unsigned __int8 *a5, void *a6)
{
  uint64_t result = 4294967246LL;
  if (a2 && a3 && a4 && a5 && a6)
  {
    if (!*(void *)(a1 + 104)) {
      return 4294967097LL;
    }
    CFTypeID v11 = sub_18823F3DC(a1, a2, a4);
    if (!v11) {
      return 4294967104LL;
    }
    __int16 v12 = v11;
    *a6 = 0LL;
    uint64_t result = (uint64_t)CFDictionaryGetValue(v12, @"CFName");
    if (result)
    {
      uint64_t v13 = (const void *)result;
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v13))
      {
        uint64_t result = 0LL;
        *a6 = v13;
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

CFDictionaryRef sub_18823F3DC(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a3) {
    *a3 = 0;
  }
  CFTypeID v6 = *(const __CFDictionary **)(a1 + 104);
  if (!v6) {
    return 0LL;
  }
  size_t Count = CFDictionaryGetCount(v6);
  if (!Count) {
    return 0LL;
  }
  int64_t v8 = Count;
  BOOL v9 = (const void **)calloc(Count, 8uLL);
  if (!v9) {
    return 0LL;
  }
  unsigned int v10 = v9;
  CFTypeID v11 = (const void **)calloc(v8, 8uLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v10, v11);
  if (v8 < 1)
  {
LABEL_17:
    ValueAtIndex = 0LL;
LABEL_18:
    if (!v11) {
      goto LABEL_20;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
    while (1)
    {
      int v20 = sub_18823F52C((const __CFString *)v10[v12]);
      uint64_t v13 = (const __CFArray *)v11[v12];
      CFIndex v14 = CFArrayGetCount(v13);
      if (v14 >= 1) {
        break;
      }
LABEL_16:
      if (++v12 == v8) {
        goto LABEL_17;
      }
    }

    CFIndex v15 = v14;
    CFIndex v16 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v16);
      unsigned int v18 = sub_18823F1CC((int)ValueAtIndex, ValueAtIndex, &v21) ^ 1;
      if (v21 != a2) {
        LOBYTE(v18) = 1;
      }
      if (a3 && (v18 & 1) == 0) {
        break;
      }
      if ((v18 & 1) == 0) {
        goto LABEL_18;
      }
      if (v15 == ++v16) {
        goto LABEL_16;
      }
    }

    *a3 = v20;
    if (!v11) {
      goto LABEL_20;
    }
  }

  free(v11);
LABEL_20:
  free(v10);
  return ValueAtIndex;
}

uint64_t sub_18823F52C(const __CFString *a1)
{
  uint64_t v1 = (unsigned int *)sub_18823A098(a1, 0);
  if (v1)
  {
    unsigned int v2 = *v1;
    free(v1);
  }

  else
  {
    unsigned int v2 = 0;
  }

  return bswap32(v2);
}

BOOL sub_18823F564(BOOL result, unsigned __int8 *a2)
{
  if (!a2) {
    return 0LL;
  }
  *a2 = 0;
  if (result)
  {
    int Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)result, @"Name");
    if (Value)
    {
      CFStringRef v4 = Value;
      CFTypeID v5 = CFGetTypeID(Value);
      return v5 == CFStringGetTypeID() && CFStringGetPascalString(v4, a2, 256LL, 0) != 0;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_18823F5F0(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 4294967246LL;
  }
  if (!*(void *)(a1 + 104)) {
    return 4294967097LL;
  }
  unsigned int v2 = sub_18823F3DC(a1, a2, 0LL);
  if (!v2) {
    return 4294967104LL;
  }
  CFStringRef v3 = v2;
  if ((v5 & 2) != 0) {
    return 4294967098LL;
  }
  CFDictionaryRemoveValue(v3, @"Handle");
  return 0LL;
}

uint64_t sub_18823F67C(uint64_t a1, unint64_t a2)
{
  if (a2 < 0xF4) {
    return 29LL;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 200);
  unsigned int v3 = bswap32(v2);
  if (v2)
  {
  }

  *(int8x8_t *)a1 = vrev32_s8(*(int8x8_t *)a1);
  *(int8x16_t *)(a1 + 8) = vrev64q_s8(*(int8x16_t *)(a1 + 8));
  *(void *)(a1 + 24) = bswap64(*(void *)(a1 + 24));
  *(int8x8_t *)(a1 + 32) = vrev32_s8(*(int8x8_t *)(a1 + 32));
  *(int8x8_t *)(a1 + 64) = vrev32_s8(*(int8x8_t *)(a1 + 64));
  *(_DWORD *)(a1 + 200) = v3;
  if (v2)
  {
    uint64_t v5 = a1 + 204;
    do
    {
      *(int8x8_t *)uint64_t v5 = vrev32_s8(*(int8x8_t *)v5);
      *(int8x16_t *)(v5 + 8) = vrev64q_s8(*(int8x16_t *)(v5 + 8));
      *(int8x16_t *)(v5 + 24) = vrev64q_s8(*(int8x16_t *)(v5 + 24));
      v5 += 40LL;
      --v3;
    }

    while (v3);
  }

  return 0LL;
}

uint64_t sub_18823F730(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  while (1)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 928) + 8 * v4);
    if (!v5 || !*v5) {
      return 999LL;
    }
  }

  return 107LL;
}

uint64_t sub_18823F7AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1882661C8(a1);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(unsigned int *)(*(void *)a1 + 200LL);
  uint64_t v8 = *(void *)(v5 + 24);
  unint64_t v9 = (v4 - 204) / 0x28uLL;
  BOOL v10 = v9 == v6 && v8 <= a2;
  unsigned int v13 = v10 && *(_DWORD *)(v5 + 4) == 1 && *(_DWORD *)v5 == 1835627368;
  if ((unint64_t)(v4 - 204) > 0x27)
  {
    int64_t v17 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = *(void *)(v5 + 16);
    int64_t v18 = v9 - 1;
    CFRange v19 = (void *)(v5 + 252);
    unsigned int v20 = 1;
    do
    {
      int v21 = *((_DWORD *)v19 - 12);
      uint64_t v22 = *(v19 - 2);
      uint64_t v23 = *(v19 - 5);
      uint64_t v24 = *(v19 - 4);
      if (v14 <= v23) {
        uint64_t v14 = *(v19 - 5);
      }
      if (v21 >= -2147483639)
      {
        if (v21 == 1) {
          unsigned int v13 = (v22 >= v24 << 9) & v13;
        }
      }

      else
      {
        unsigned int v13 = (v24 <= *(unsigned int *)(v5 + 32)) & v13;
      }

      uint64_t v27 = v24 + v23;
      BOOL v29 = v27 <= v15 && v23 <= v15;
      v13 &= v29;
      if (v21 != -1 && (v21 & 0xF0000000) != 0x70000000 && v18 > v17 && *v19 < v23) {
        unsigned int v13 = 0;
      }
      if (v18 > v17 && v27 != *v19) {
        unsigned int v13 = 0;
      }
      uint64_t v30 = *(v19 - 3) + v8;
      if (v30 + v22 > a2 || v30 > a2) {
        unsigned int v13 = 0;
      }
      int64_t v17 = v20;
      BOOL v10 = v9 > v20++;
      v19 += 5;
    }

    while (v10);
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = *(void *)(v5 + 16);
  }

  if (v14 == v15) {
    uint64_t v7 = v13;
  }
  else {
    uint64_t v7 = 0LL;
  }
  nullsub_4(a1);
  return v7;
}

uint64_t sub_18823F944(uint64_t a1)
{
  unsigned int v2 = (void **)sub_18826612C(204LL);
  if (!sub_1882660D4())
  {
    unsigned int v3 = *v2;
    *(void *)unsigned int v3 = 0x16D697368LL;
    v3[9] = -2;
    if (*(__int16 *)(a1 + 912) >= 1)
    {
      uint64_t v4 = 0LL;
      unsigned int v5 = 0;
      uint64_t v6 = 0LL;
      unsigned int v32 = 0;
      uint64_t v7 = 0LL;
      uint64_t v8 = 204LL;
      uint64_t v31 = a1;
      while (1)
      {
        unint64_t v9 = *(uint64_t **)(*(void *)(a1 + 928) + 8 * v4);
        uint64_t v10 = *v9;
        int v11 = *(_DWORD *)(*v9 + 200);
        uint64_t v12 = *(void *)(*v9 + 8);
        if (v12 > v6)
        {
          v8 += 40LL;
          sub_188266180((uint64_t)v2, v8);
          uint64_t v13 = (uint64_t)*v2 + 40 * v5++;
          *(_DWORD *)(v13 + 204) = 0;
          *(_DWORD *)(v13 + 208) = 0;
          *(void *)(v13 + 212) = v6;
          *(void *)(v13 + 220) = v12 - v6;
          *(void *)(v13 + 228) = v7;
          *(void *)(v13 + 236) = 0LL;
          uint64_t v10 = *v9;
          uint64_t v6 = v12;
        }

        int v14 = v11 - 1;
        unsigned int v15 = *(_DWORD *)(v10 + 32);
        unsigned int v16 = v32;
        if (v15 > v32) {
          unsigned int v16 = v15;
        }
        sub_188266180((uint64_t)v2, v8 + 40LL * v14);
        if (v14 >= 1)
        {
          uint64_t v17 = 0LL;
          uint64_t v18 = *v9;
          while (1)
          {
            uint64_t v19 = *(void *)(v18 + v17 + 204);
            uint64_t v20 = *(void *)(v18 + v17 + 212);
            uint64_t v21 = *(void *)(v18 + v17 + 220);
            __int128 v33 = *(_OWORD *)(v18 + v17 + 228);
            uint64_t v22 = *(void *)(v18 + 8) + v20;
            if (v22 >= v6) {
              goto LABEL_25;
            }
            if (v22 + v21 > v6) {
              break;
            }
LABEL_26:
            v17 += 40LL;
          }

          if ((int)v19 > 2147483645)
          {
            if ((_DWORD)v19 != 2147483646) {
              goto LABEL_23;
            }
          }

          else if (v19 >= 3)
          {
            if ((int)v19 < -2147483639 || (_DWORD)v19 == -1)
            {
LABEL_29:
              uint64_t v25 = 107LL;
              goto LABEL_30;
            }

LABEL_23:
            if ((v19 & 0x80000000) != 0) {
              goto LABEL_29;
            }
          }

          v21 += v20 - v6;
          uint64_t v20 = v6;
LABEL_25:
          uint64_t v24 = (uint64_t)*v2 + 40 * v5++;
          v8 += 40LL;
          *(void *)(v24 + 204) = v19;
          *(void *)(v24 + 212) = v20;
          *(void *)(v24 + 220) = v21;
          *(_OWORD *)(v24 + 228) = v33;
          uint64_t v18 = *v9;
          *(void *)(v24 + 212) = *(void *)(*v9 + 8) + v20;
          *(void *)(v24 + 228) += *(void *)(v18 + 24);
          v6 += v21;
          v7 += *(void *)(v24 + 236);
          goto LABEL_26;
        }

    if (v8 == ++v9) {
      goto LABEL_7;
    }
  }

  unsigned int v5 = 1LL;
  if (v3) {
LABEL_8:
  }
    CFRelease(v3);
LABEL_9:
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

      v12 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1) << 9;
      uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
      uint64_t v23 = v13 - 15;
      ++v13;
      uint64_t v4 = v18;
      if (v23 >= v22) {
        goto LABEL_26;
      }
    }
  }

  uint64_t v18 = v4;
LABEL_26:
  if (!*(_DWORD *)(a1 + 32)) {
    goto LABEL_56;
  }
  uint64_t v24 = 0LL;
  uint64_t v4 = v18;
  while (1)
  {
    uint64_t v25 = *(void *)(a1 + 80);
    uint64_t v26 = v25 ? v25 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * v24 : 0LL;
    v12 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
    v4 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
    uint64_t v40 = v24;
LABEL_49:
    ++v24;
  }

  uint64_t v27 = 0LL;
  uint64_t v28 = v26 + 56;
  while (1)
  {
    uint64_t v18 = v4;
    uint64_t v29 = *(_DWORD *)(v28 + 4 * v27);
    if (v29 == -1) {
      goto LABEL_39;
    }
    if (!v29) {
      break;
    }
    uint64_t v30 = *(_DWORD *)(a1 + 16);
    if (v29 > v30)
    {
      sub_18825E874( "\x1B[33mCSparseFile::generateSparseTable: #%u i-node %u-th slot (band %u) is out of bounds (should be <= %u).\x1B[0m",  v24,  v27,  *(_DWORD *)(v28 + 4 * v27),  v30);
      sub_18825E874("\x1B[33msparing %u-th slot.\x1B[0m", v27);
      uint64_t v29 = -1;
      *(_DWORD *)(v28 + 4 * v27) = -1;
      *(_DWORD *)(v26 + 8) |= 1u;
    }

LABEL_27:
        unsigned int v32 = v16;
        ++v4;
        a1 = v31;
      }

      uint64_t v25 = 12LL;
LABEL_30:
      a1 = v31;
      goto LABEL_31;
    }

    uint64_t v7 = 0LL;
    unsigned int v32 = 0;
    uint64_t v6 = 0LL;
    unsigned int v5 = 0;
    uint64_t v8 = 204LL;
LABEL_33:
    uint64_t v26 = *(void *)(a1 + 884);
    if (v26 <= v6) {
      goto LABEL_36;
    }
    v8 += 40LL;
    sub_188266180((uint64_t)v2, v8);
    if (!sub_1882660D4())
    {
      uint64_t v27 = (uint64_t)*v2 + 40 * v5++;
      *(_DWORD *)(v27 + 204) = 0;
      *(_DWORD *)(v27 + 208) = 0;
      *(void *)(v27 + 212) = v6;
      *(void *)(v27 + 220) = v26 - v6;
      *(void *)(v27 + 228) = v7;
      *(void *)(v27 + 236) = 0LL;
      uint64_t v6 = v26;
LABEL_36:
      sub_188266180((uint64_t)v2, v8 + 40);
      if (!sub_1882660D4())
      {
        uint64_t v25 = 0LL;
        uint64_t v28 = *v2;
        uint64_t v29 = (uint64_t)*v2 + 40 * v5;
        *(void *)(v29 + 204) = 0xFFFFFFFFLL;
        *(void *)(v29 + 212) = v6;
        *(void *)(v29 + 220) = 0LL;
        *(void *)(v29 + 228) = v7;
        *(void *)(v29 + 236) = 0LL;
        v28[2] = v6;
        *((_DWORD *)v28 + 8) = v32;
        *((_DWORD *)v28 + 50) = v5 + 1;
        goto LABEL_38;
      }
    }
  }

  uint64_t v25 = 12LL;
LABEL_31:
  sub_188266150(v2);
  unsigned int v2 = 0LL;
LABEL_38:
  *(void *)(a1 + 904) = v2;
  return v25;
}

  uint64_t result = 0LL;
LABEL_28:
  a4 = v24;
LABEL_34:
  *a3 = v12;
  *a4 = Mutable;
  return result;
}

  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
  if (!(_DWORD)result)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 312LL))(*(void *)(a1 + 24), v7);
    if (!(_DWORD)result)
    {
      *(void *)(a1 + 112) = v7;
      *(void *)(a1 + 120) = v7;
      (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472LL))(*(void *)(a1 + 24), 1LL);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_18823FC68(_BYTE *a1)
{
  uint64_t result = (*(uint64_t (**)(_BYTE *))(*(void *)a1 + 616LL))(a1);
  if ((result & 1) == 0)
  {
    if (!a1[778])
    {
      uint64_t v3 = (*(uint64_t (**)(_BYTE *))(*(void *)a1 + 496LL))(a1);
      (*(void (**)(uint64_t, void))(*(void *)v3 + 352LL))(v3, 0LL);
    }

    return (*(uint64_t (**)(_BYTE *, void))(*(void *)a1 + 648LL))(a1, 0LL);
  }

  return result;
}

uint64_t sub_18823FCE8(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 176);
  if (v2 > 0 || a2 != 0)
  {
    int v4 = v2 - 1;
    if (a2) {
      int v4 = 0;
    }
    *(_DWORD *)(result + ++*(_DWORD *)(result + 176) = v4;
  }

  return result;
}

void sub_18823FD0C(void *a1)
{
}

void sub_18823FD30(_Unwind_Exception *a1)
{
}

void *sub_18823FD44(void *a1)
{
  *a1 = off_18A20D570;
  sub_18823E698((uint64_t)a1, 0LL);
  return sub_18823FEB0(a1);
}

void sub_18823FD78(_Unwind_Exception *a1)
{
}

void sub_18823FD90(uint64_t a1)
{
  int v2 = *(const __CFDictionary **)(a1 + 104);
  if (v2)
  {
    size_t Count = CFDictionaryGetCount(v2);
    if (Count)
    {
      int64_t v4 = Count;
      unsigned int v5 = (const void **)calloc(Count, 8uLL);
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = (const void **)calloc(v4, 8uLL);
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v6, v7);
        if (v4 >= 1)
        {
          for (uint64_t i = 0LL; i != v4; ++i)
          {
            unint64_t v9 = (const __CFArray *)v7[i];
            if (v9)
            {
              CFIndex v10 = CFArrayGetCount((CFArrayRef)v7[i]);
              if (v10 >= 1)
              {
                CFIndex v11 = v10;
                for (CFIndex j = 0LL; j != v11; ++j)
                {
                  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, j);
                  if (ValueAtIndex)
                  {
                    int v14 = ValueAtIndex;
                    CFDictionaryRemoveValue(v14, @"Handle");
                  }
                }
              }
            }
          }
        }

        free(v6);
        if (v7) {
          free(v7);
        }
      }
    }
  }

uint64_t sub_18823FEB4(uint64_t a1)
{
  int v2 = *(void **)(a1 + 1008);
  if (v2) {
    free(v2);
  }
  *(void *)(a1 + 1008) = 0LL;
  uint64_t v3 = *(unsigned int *)(**(void **)(a1 + 904) + 32LL);
  if (!(_DWORD)v3) {
    return 0LL;
  }
  *(_BYTE *)(a1 + 1024) = 0;
  *(void *)(a1 + 1016) = v3 << 9;
  unsigned int v5 = malloc(v3 << 9);
  *(void *)(a1 + 1008) = v5;
  if (v5) {
    return 0LL;
  }
  else {
    return 12LL;
  }
}

char *sub_18823FF28(uint64_t a1, char *a2)
{
  if (a2) {
    DIDiskImageObjectRetain_0(a2);
  }
  uint64_t result = *(char **)(a1 + 136);
  if (result) {
    uint64_t result = (char *)DIDiskImageObjectRelease(result);
  }
  *(void *)(a1 + 136) = a2;
  return result;
}

uint64_t sub_18823FF68(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 136);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 432LL))(result);
  }
  return result;
}

uint64_t sub_18823FF80(uint64_t a1)
{
  CFTypeRef cf = 0LL;
  int v2 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1);
  values = v2;
  if (!v2)
  {
    uint64_t v5 = 0LL;
    goto LABEL_9;
  }

  CFArrayRef v3 = (CFArrayRef)v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFArrayGetTypeID()) {
    CFRetain(v3);
  }
  else {
    CFArrayRef v3 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)&values, 1LL, MEMORY[0x189605228]);
  }
  if (sub_188240130((CFArrayRef *)&cf) || !cf || (CFIndex Count = CFArrayGetCount((CFArrayRef)cf), Count < 1))
  {
LABEL_7:
    uint64_t v5 = 0LL;
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  CFIndex v8 = Count;
  CFIndex v9 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)cf, v9);
    if (!ValueAtIndex) {
      goto LABEL_23;
    }
    CFIndex v11 = ValueAtIndex;
    int Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"writeable-components");
    uint64_t v13 = (const __CFArray *)CFDictionaryGetValue(v11, @"readonly-components");
    if (Value)
    {
    }

    if (v13)
    {
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 72LL))(a1))
      {
        int v14 = sub_1882510B8(v13, v3);
      }

      else
      {
        int v14 = sub_18824DEE8(v13, v3);
        if (Value) {
          goto LABEL_23;
        }
      }

      if (v14) {
        break;
      }
    }

uint64_t sub_188240118(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 48LL))(result);
  }
  return result;
}

uint64_t sub_188240130(CFArrayRef *a1)
{
  io_iterator_t existing = 0;
  value = 0LL;
  if (!a1) {
    return 4LL;
  }
  *a1 = 0LL;
  mach_port_t v2 = *MEMORY[0x1896086B0];
  CFArrayRef v3 = IOServiceMatching("IOHDIXHDDrive");
  uint64_t MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  if ((_DWORD)MatchingServices)
  {
    uint64_t v5 = MatchingServices;
    CFMutableArrayRef Mutable = 0LL;
  }

  else
  {
    if (!IOIteratorIsValid(existing)) {
      MEMORY[0x1895BF69C](existing);
    }
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    if (Mutable)
    {
      io_object_t v7 = IOIteratorNext(existing);
      if (v7)
      {
        io_registry_entry_t v8 = v7;
        do
        {
          CFIndex v9 = sub_18824DE84(v8);
          if (v9)
          {
            CFIndex v10 = v9;
            CFRelease(v10);
          }

          IOObjectRelease(v8);
          io_registry_entry_t v8 = IOIteratorNext(existing);
        }

        while (v8);
      }

      uint64_t v5 = 0LL;
    }

    else
    {
      uint64_t v5 = 999LL;
    }
  }

  if (existing)
  {
    IOObjectRelease(existing);
    io_iterator_t existing = 0;
  }

  if ((_DWORD)v5) {
    BOOL v11 = Mutable == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    goto LABEL_28;
  }
  if (Mutable)
  {
    CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], Mutable);
    *a1 = Copy;
    if (Copy) {
      uint64_t v5 = v5;
    }
    else {
      uint64_t v5 = 999LL;
    }
LABEL_28:
    CFRelease(Mutable);
  }

  return v5;
}

uint64_t sub_1882402AC()
{
  return 0LL;
}

uint64_t sub_1882402B4()
{
  return 0LL;
}

uint64_t sub_1882402BC(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 > *a2;
  }
}

uint64_t DIDiskImageHasChecksum(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272LL))(a1);
}

uint64_t sub_1882402F0(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
  if (!v1) {
    return 0LL;
  }
  mach_port_t v2 = (char *)v1;
  uint64_t v3 = (*(unsigned int (**)(uint64_t))(*(void *)v1 + 80LL))(v1) ^ 1;
  DIDiskImageObjectRelease(v2);
  return v3;
}

void *sub_188240340(uint64_t a1)
{
  mach_port_t v2 = sub_1882403AC(*(_DWORD *)(a1 + 744));
  if (v2)
  {
    uint64_t v3 = v2;
    (*(void (**)(void *, uint64_t))(*(void *)v2 + 144LL))(v2, a1 + 752);
  }

  else
  {
    uint64_t v3 = operator new(0x80uLL);
    sub_18825B5EC(v3, 0LL);
  }

  return v3;
}

void sub_188240398(_Unwind_Exception *a1)
{
}

void *sub_1882403AC(int a1)
{
  uint64_t v1 = 0LL;
  switch(a1)
  {
    case 0:
    case 10:
    case 11:
    case 12:
    case 13:
      uint64_t v1 = operator new(0x80uLL);
      sub_18825B5EC(v1, a1 != 0);
      break;
    case 2:
      uint64_t v1 = operator new(0x78uLL);
      sub_1882404B0((uint64_t)v1);
      break;
    case 4:
      uint64_t v1 = operator new(0xA0uLL);
      sub_188257330();
      break;
    case 6:
      uint64_t v1 = operator new(0xA0uLL);
      sub_18825B69C();
      break;
    case 7:
      uint64_t v1 = operator new(0xA0uLL);
      sub_188264734();
      break;
    case 8:
      uint64_t v1 = operator new(0xA0uLL);
      sub_18826482C();
      break;
    case 9:
      uint64_t v1 = operator new(0xA0uLL);
      sub_188264924();
      break;
    default:
      return v1;
  }

  return v1;
}

void sub_188240484(_Unwind_Exception *a1)
{
}

uint64_t sub_1882404B0(uint64_t a1)
{
  uint64_t result = sub_1882404D4(a1);
  *(void *)uint64_t result = off_18A20B048;
  *(_DWORD *)(result + 112) = 0;
  return result;
}

uint64_t sub_1882404D4(uint64_t a1)
{
  *(void *)sub_18823A554(a1) = off_18A20AF80;
  *(void *)(a1 + 104) = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  return a1;
}

void sub_18824051C(_Unwind_Exception *a1)
{
}

uint64_t sub_188240534(uint64_t result, unsigned int *a2)
{
  *(_DWORD *)(result + 112) = bswap32(*a2);
  return result;
}

BOOL sub_188240544(uint64_t a1)
{
  return 1LL;
}

uint64_t sub_1882405B0()
{
  return 2LL;
}

uint64_t sub_1882405B8()
{
  return 32LL;
}

void sub_1882405C0(void *a1)
{
}

void sub_1882405E4(_Unwind_Exception *a1)
{
}

void *sub_1882405F8(void *a1)
{
  *a1 = off_18A20AF80;
  mach_port_t v2 = (const void *)a1[13];
  if (v2) {
    CFRelease(v2);
  }
  return sub_18823B28C(a1);
}

void sub_188240630(_Unwind_Exception *a1)
{
}

uint64_t DIDiskImageCopyImageChecksum(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
}

uint64_t DIDiskImageGetBackingStore(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
}

BOOL sub_188240660(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  return ((statfs(*(const char **)(a1 + 296), &v2) & 0x80000000) == 0 || !*__error()) && (v2.f_flags & 0x1000) == 0;
}

uint64_t sub_1882406DC(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  else {
    return v2.f_flags & 1;
  }
}

uint64_t sub_188240758(uint64_t result, uint64_t a2)
{
  *(void *)(result + 88) = a2;
  return result;
}

uint64_t sub_188240764(uint64_t result, uint64_t a2)
{
  *(void *)(result + 80) = a2;
  return result;
}

uint64_t DIDiskImageValidateChecksum(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 168LL))( a1,  a2,  a3,  a4,  0LL);
}

uint64_t sub_18824077C(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  CFIndex v10 = (const __CFString *)sub_188238A30();
  int v11 = sub_188238A38(v10, 0);
  if (v10) {
    CFRelease(v10);
  }
  if ((a5 & 1) == 0 && v11)
  {
    uint64_t v12 = (const __CFString *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)a1 + 24LL))( a1,  @"di-valid-cached-checksum");
    if (sub_188238A38(v12, 0))
    {
      if (a2) {
        *a2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
      }
      if (a3) {
        *a3 = 0LL;
      }
      if (a4) {
        *a4 = 0LL;
      }
      return 117LL;
    }

    goto LABEL_14;
  }

  if (v11) {
LABEL_14:
  }
    (*(void (**)(uint64_t, const __CFString *, void))(*(void *)a1 + 32LL))( a1,  @"di-valid-cached-checksum",  *MEMORY[0x189604DE0]);
  uint64_t result = (*(uint64_t (**)(uint64_t, void *, void *, void *))(*(void *)a1 + 160LL))(a1, a2, a3, a4);
  if ((a5 & 4) == 0 && a5 & 2 | v11 && !(_DWORD)result)
  {
    (*(void (**)(uint64_t, const __CFString *, void))(*(void *)a1 + 32LL))( a1,  @"di-valid-cached-checksum",  *MEMORY[0x189604DE8]);
    return 0LL;
  }

  return result;
}

__CFArray *sub_1882408CC(uint64_t a1, __CFString *theString1)
{
  if (CFStringCompare(theString1, @"udif-ordered-chunks", 0LL))
  {
    int HasPrefix = CFStringHasPrefix(theString1, @"data-run-info-");
    uint64_t v5 = sub_1882409B0(a1, theString1);
    uint64_t v6 = (const __CFString *)v5;
    if (HasPrefix && !v5)
    {
      sub_188260930(a1, theString1);
      return sub_1882409B0(a1, theString1);
    }
  }

  else
  {
    uint64_t v6 = (const __CFString *)sub_1882409B0(a1, theString1);
    if (!v6)
    {
      int v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 608LL))(a1);
      CFIndex v9 = (const __CFString **)MEMORY[0x189604DE8];
      if (!v8) {
        CFIndex v9 = (const __CFString **)MEMORY[0x189604DE0];
      }
      uint64_t v6 = *v9;
      sub_18823DF90(a1, theString1, *v9);
    }
  }

  return (__CFArray *)v6;
}

__CFArray *sub_1882409B0(uint64_t a1, CFTypeRef cf1)
{
  if (!cf1) {
    return 0LL;
  }
  if (CFEqual(cf1, @"di-valid-cached-checksum"))
  {
    int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 536LL))(a1);
    uint64_t v5 = MEMORY[0x189604DE8];
    if (!v4) {
      uint64_t v5 = MEMORY[0x189604DE0];
    }
    return *(__CFArray **)v5;
  }

  if (CFEqual(cf1, @"tiger-blkx"))
  {
    io_object_t v7 = (char *)a1;
    char v8 = 1;
    return sub_18825C418(v7, v8);
  }

  if (CFEqual(cf1, @"leopard-blkx"))
  {
    io_object_t v7 = (char *)a1;
    char v8 = 0;
    return sub_18825C418(v7, v8);
  }

  if (CFEqual(cf1, @"bs-io-scheduling")
    && (uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1)) != 0
    && (uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 488LL))(v9)) != 0)
  {
    return (__CFArray *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)v10 + 24LL))( v10,  @"bs-io-scheduling");
  }

  else
  {
    return (__CFArray *)sub_18823B6D4(a1, cf1);
  }

uint64_t sub_188240ACC(uint64_t a1)
{
  CFTypeRef cf = 0LL;
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  if (!v2) {
    goto LABEL_4;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 488LL))(v2);
  if (!v3
    || (*(unsigned int (**)(uint64_t, const __CFString *, CFTypeRef *))(*(void *)v3 + 120LL))( v3,  @"com.apple.diskimages.recentcksum",  &cf))
  {
    goto LABEL_4;
  }

  if (!cf) {
    return 0LL;
  }
  CFStringRef v6 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], (CFDataRef)cf, 0x8000100u);
  if (v6)
  {
    CFStringRef v7 = v6;
    char v8 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 544LL))(a1);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v4 = CFEqual(v7, v8);
      CFRelease(v7);
      CFStringRef v7 = v9;
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    CFRelease(v7);
  }

  else
  {
LABEL_4:
    uint64_t v4 = 0LL;
  }

  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

size_t sub_188240BC4(uint64_t a1, const __CFString *a2, CFDataRef *a3)
{
  uint64_t v5 = (const char *)sub_18823A098(a2, 0x8000100u);
  CFStringRef v6 = (char *)v5;
  if (a3 && v5)
  {
    ssize_t v7 = getxattr(*(const char **)(a1 + 296), v5, 0LL, 0LL, 0, 0);
    size_t v8 = v7;
    if ((v7 & 0x8000000000000000LL) == 0)
    {
      uint64_t v9 = (UInt8 *)malloc(v7);
      if (v9)
      {
        uint64_t v10 = v9;
        ssize_t v11 = getxattr(*(const char **)(a1 + 296), v6, v9, v8, 0, 0);
        size_t v8 = 999LL;
        if ((v11 & 0x8000000000000000LL) == 0)
        {
          CFDataRef v12 = CFDataCreate(0LL, v10, v11);
          *a3 = v12;
          if (v12) {
            size_t v8 = 0LL;
          }
          else {
            size_t v8 = 999LL;
          }
        }

        free(v10);
      }

      else
      {
        size_t v8 = 12LL;
      }
    }
  }

  else
  {
    size_t v8 = 999LL;
    if (!v5) {
      return v8;
    }
  }

  free(v6);
  return v8;
}

uint64_t sub_188240CAC(uint64_t a1, const __CFString *a2, const __CFData *a3)
{
  uint64_t v5 = (const char *)sub_18823A098(a2, 0x8000100u);
  if (!v5) {
    return 999LL;
  }
  CFStringRef v6 = (char *)v5;
  ssize_t v7 = *(const char **)(a1 + 296);
  if (a3)
  {
    BytePtr = CFDataGetBytePtr(a3);
    size_t Length = CFDataGetLength(a3);
    uint64_t v10 = setxattr(v7, v6, BytePtr, Length, 0, 0);
  }

  else
  {
    uint64_t v10 = removexattr(v7, v5, 0);
  }

  uint64_t v11 = v10;
  free(v6);
  return v11;
}

uint64_t sub_188240D50(uint64_t a1, char **a2, char **a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  *(_BYTE *)(a1 + 1032) = 1;
  uint64_t result = sub_188240D88(a1, a2, a3, a4);
  *(_BYTE *)(a1 + 1032) = 0;
  return result;
}

uint64_t sub_188240D88(uint64_t a1, char **a2, char **a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
  size_t v8 = (char *)v7;
  if (!v7)
  {
    if (a2)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = 999LL;
      goto LABEL_13;
    }

    uint64_t v10 = 999LL;
    if (!a3) {
      return v10;
    }
    uint64_t v9 = 0LL;
LABEL_22:
    *a3 = v9;
    return v10;
  }

  if ((*(unsigned int (**)(uint64_t))(*(void *)v7 + 80LL))(v7))
  {
    uint64_t v9 = (char *)operator new(0x80uLL);
    sub_18825B5EC(v9, 0LL);
    goto LABEL_12;
  }

  uint64_t v9 = (char *)sub_188240ECC((uint64_t)v8);
  if (!v9)
  {
LABEL_12:
    uint64_t v10 = 999LL;
    if (a2) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }

  uint64_t v11 = (*(uint64_t (**)(uint64_t, char *))(*(void *)a1 + 184LL))(a1, v9);
  if ((_DWORD)v11)
  {
    uint64_t v10 = v11;
    if (a2) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }

  else {
    uint64_t v10 = 116LL;
  }
  if (!a2)
  {
LABEL_21:
    DIDiskImageObjectRelease(v8);
    if (!a3) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

void sub_188240EB8(_Unwind_Exception *a1)
{
}

void *sub_188240ECC(uint64_t a1)
{
  int v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128LL))(a1);
  return sub_1882403AC(v1);
}

uint64_t sub_188240EE8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(unsigned __int8 *, uint64_t, void))(*(void *)a1 + 560LL))(a1, a2, a1[1032]);
}

uint64_t sub_188240EF8(uint64_t a1, uint64_t a2, int a3)
{
  v44[16] = *MEMORY[0x1895F89C0];
  (*(void (**)(uint64_t))(*(void *)a2 + 48LL))(a2);
  (*(void (**)(uint64_t, float))(*(void *)a1 + 344LL))(a1, 0.0);
  if (*(__int16 *)(a1 + 912) >= 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = *(unsigned __int16 *)(a1 + 912);
    uint64_t v8 = *(__int16 *)(a1 + 914);
    uint64_t v9 = (void **)(a1 + 904);
    alloc = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v10 = 8 * v8;
    v39 = (const __CFBoolean *)*MEMORY[0x189604DE8];
    while (1)
    {
      uint64_t v11 = v9;
      if (v8 + v6 != -2)
      {
        uint64_t v12 = *(__int16 *)(a1 + 914);
        if (v8 + v6 - v12 >= v7) {
          goto LABEL_44;
        }
        uint64_t v11 = (void **)(*(void *)(a1 + 928) - 8 * v12 + v10);
      }

      uint64_t v13 = *v11;
      if (!*v11
        || (int v14 = (const __CFString *)sub_188241424(a1, v8 + v6)) == 0LL
        || (v15 = v14, (unsigned int v16 = (char *)sub_1882403AC(*(_DWORD *)(*v13 + 64LL))) == 0LL))
      {
LABEL_44:
        uint64_t v21 = 999LL;
        goto LABEL_45;
      }

      uint64_t v17 = v16;
      int v38 = a3;
      v37 = v9;
      if (a3) {
        uint64_t v40 = (char *)sub_188241454((int *)(*v13 + 64LL));
      }
      else {
        uint64_t v40 = 0LL;
      }
      int v18 = DIGetBundleRef();
      uint64_t v19 = (const __CFString *)sub_1882660CC( v18,  (int)@"Checksumming %1$@\\U2026",  @"Checksumming %1$@\\U2026");
      CFStringRef v20 = CFStringCreateWithFormat(alloc, 0LL, v19, v15);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v20, 16LL);
      if (v20) {
        CFRelease(v20);
      }
      if (v19) {
        CFRelease(v19);
      }
      uint64_t v21 = sub_188241604((char *)a1, v13, v17);
      (*(void (**)(uint64_t, const __CFString *, uint64_t))(*(void *)a1 + 336LL))(a1, &stru_18A20E810, 16LL);
      if ((_DWORD)v21 == 111) {
        break;
      }
      if (!(_DWORD)v21)
      {
        uint64_t v22 = (*(uint64_t (**)(uint64_t, char *, char *))(*(void *)a1 + 376LL))(a1, v40, v17);
        int v23 = DIGetBundleRef();
        uint64_t v24 = (const __CFString *)sub_1882660CC(v23, (int)@"%1$@: %2$@", @"%1$@: %2$@");
        CFStringRef v25 = sub_1882434F4(v15, 36LL, v39);
        CFTypeRef cf = (CFTypeRef)v22;
        CFStringRef v26 = CFStringCreateWithFormat(alloc, 0LL, v24, v25, v22);
        (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v26, 8LL);
        if (v25) {
          CFRelease(v25);
        }
        if (v26) {
          CFRelease(v26);
        }
        if (v24) {
          CFRelease(v24);
        }
        a3 = v38;
        if (cf) {
          CFRelease(cf);
        }
        (*(void (**)(char *, char *))(*(void *)v17 + 136LL))(v17, v42);
        (*(void (**)(uint64_t, void *, unint64_t))(*(void *)a2 + 56LL))( a2,  v44,  (unint64_t)v43 >> 3);
        goto LABEL_39;
      }

      int v32 = DIGetBundleRef();
      uint64_t v28 = (const __CFString *)sub_1882660CC( v32,  (int)@"%1$@: checksum failed with error %2$ld.",  @"%1$@: checksum failed with error %2$ld.");
      CFStringRef v33 = sub_1882434F4(v15, 36LL, v39);
      CFStringRef v34 = CFStringCreateWithFormat(alloc, 0LL, v28, v33, v21);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v34, 8LL);
      if (v33) {
        CFRelease(v33);
      }
      if (v34)
      {
        CFStringRef v31 = v34;
LABEL_36:
        CFRelease(v31);
      }

LABEL_37:
      a3 = v38;
      if (v28) {
        CFRelease(v28);
      }
LABEL_39:
      DIDiskImageObjectRelease(v17);
      if (v40) {
        DIDiskImageObjectRelease(v40);
      }
      uint64_t v9 = v37;
      if ((_DWORD)v21) {
        goto LABEL_45;
      }
      ++v6;
      uint64_t v7 = *(__int16 *)(a1 + 912);
      v10 += 8LL;
      if (v6 >= v7) {
        goto LABEL_43;
      }
    }

    int v27 = DIGetBundleRef();
    uint64_t v28 = (const __CFString *)sub_1882660CC( v27,  (int)@"%1$@: checksum canceled.",  @"%1$@: checksum canceled.");
    CFStringRef v29 = sub_1882434F4(v15, 36LL, v39);
    CFStringRef v30 = CFStringCreateWithFormat(alloc, 0LL, v28, v29);
    (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v30, 8LL);
    if (v29) {
      CFRelease(v29);
    }
    if (!v30) {
      goto LABEL_37;
    }
    CFStringRef v31 = v30;
    goto LABEL_36;
  }

    a1[39] = v12;
    pthread_mutex_unlock((pthread_mutex_t *)a1 + 5);
    if (v5 >= a1[36] || v10 == 0)
    {
      uint64_t v3 = 0;
      goto LABEL_56;
    }

    if (!v8)
    {
      (*(void (**)(void, void *))(*(void *)*a1 + 16LL))(*a1, v29);
      uint64_t v24 = operator new(0x78uLL);
      sub_188241B44((uint64_t)v24);
      *uint64_t v24 = off_18A20C6B0;
      v24[12] = 0LL;
      v24[13] = 0LL;
      v24[11] = 0LL;
      uint64_t v28 = v10;
      CFStringRef v29 = v24;
      *((_BYTE *)v24 + 112) = v9;
      goto LABEL_46;
    }

    int v23 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, void))(*(void *)a1[2] + 48LL))( a1[2],  a1[37] + v5,  v10,  &v28,  v29[13]);
    if (v23)
    {
      uint64_t v3 = v23;
      goto LABEL_55;
    }

    if (v28 != v10) {
      break;
    }
    uint64_t v24 = v29;
LABEL_46:
    v24[11] = v5;
    v24[12] = v10;
    (*(void (**)(void, void *))(*(void *)a1[1] + 24LL))(a1[1], v24);
    CFStringRef v29 = 0LL;
    CFStringRef v25 = (*(uint64_t (**)(void, void **, void))(*(void *)*a1 + 32LL))(*a1, &v29, 0LL);
    if (v25) {
      CFStringRef v26 = 1;
    }
    else {
      CFStringRef v26 = v29 == 0LL;
    }
    if (v26)
    {
      uint64_t v3 = v25;
      goto LABEL_54;
    }
  }

  uint64_t v3 = 5;
LABEL_55:
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
  *((_BYTE *)a1 + 280) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
LABEL_56:
  if (v29) {
    (*(void (**)(void *))(*v29 + 8LL))(v29);
  }
  return v3;
}

LABEL_43:
  uint64_t v21 = 0LL;
LABEL_45:
  (*(void (**)(uint64_t))(*(void *)a2 + 72LL))(a2);
  (*(void (**)(uint64_t, float))(*(void *)a1 + 344LL))(a1, 100.0);
  return v21;
}

uLong sub_188241368(uint64_t a1)
{
  uLong result = crc32(0LL, 0LL, 0);
  *(_DWORD *)(a1 + 112) = result;
  return result;
}

uint64_t sub_188241398(uint64_t a1, float a2)
{
  float v6 = a2;
  uint64_t v3 = *(uint64_t (**)(uint64_t))(a1 + 112);
  if (v3) {
    return v3(a1);
  }
  uint64_t result = sub_188241410(a1);
  if (result)
  {
    uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, float *, void, void, void))sub_188241410(a1);
    return v5(1LL, a1, &v6, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t sub_188241410(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t sub_18824141C(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

const void *sub_188241424(uint64_t a1, uint64_t a2)
{
  if (a2 >= -1
    && (CFIndex v2 = a2 - *(__int16 *)(a1 + 914), v2 < *(__int16 *)(a1 + 912))
    && (uint64_t v3 = *(const __CFArray **)(a1 + 936)) != 0LL)
  {
    return CFArrayGetValueAtIndex(v3, v2);
  }

  else
  {
    return 0LL;
  }

void *sub_188241454(int *a1)
{
  int v1 = 0LL;
  int v2 = *a1;
  switch(*a1)
  {
    case 0:
    case 10:
    case 11:
    case 12:
    case 13:
      int v1 = operator new(0x80uLL);
      sub_18825B5EC(v1, v2 != 0);
      goto LABEL_3;
    case 2:
      int v1 = operator new(0x78uLL);
      sub_1882404B0((uint64_t)v1);
      goto LABEL_3;
    case 4:
      int v1 = operator new(0xA0uLL);
      sub_188257330();
      goto LABEL_3;
    case 6:
      int v1 = operator new(0xA0uLL);
      sub_18825B69C();
      goto LABEL_3;
    case 7:
    case 8:
      int v1 = operator new(0xA0uLL);
      sub_188264734();
      goto LABEL_3;
    case 9:
      int v1 = operator new(0xA0uLL);
      sub_188264924();
LABEL_3:
      (*(void (**)(void *, int *))(*(void *)v1 + 144LL))(v1, a1 + 2);
      break;
    default:
      return v1;
  }

  return v1;
}

void sub_188241548(_Unwind_Exception *a1)
{
}

uint64_t sub_188241574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 104);
  if (v6) {
    return v6(a1, a2, a3);
  }
  uint64_t result = sub_188241410(a1);
  if (result)
  {
    uint64_t v8 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, void, void))sub_188241410(a1);
    return v8(0LL, a1, a2, a3, 0LL, 0LL);
  }

  return result;
}

uint64_t sub_188241604(char *a1, void *a2, char *a3)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1);
  (*(void (**)(char *))(*(void *)a3 + 48LL))(a3);
  memset(&v38, 0, sizeof(v38));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v35 = 0u;
  memset(v34, 0, sizeof(v34));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  *(_OWORD *)CFStringRef v30 = 0u;
  __int128 v31 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  uint64_t v28 = a3;
  DIDiskImageObjectRetain_0(a3);
  int v27 = a1;
  DIDiskImageObjectRetain_0(a1);
  uint64_t v7 = *a2;
  uint64_t v8 = *a2 + 204LL;
  v39 = a2;
  uint64_t v40 = v8;
  *(void *)&__int128 v36 = *(void *)(v7 + 16);
  *((void *)&v36 + 1) = *(void *)(v7 + 8);
  pthread_mutex_init((pthread_mutex_t *)&v30[1], 0LL);
  pthread_cond_init((pthread_cond_t *)&v34[1], 0LL);
  pthread_mutex_init((pthread_mutex_t *)&v34[7], 0LL);
  pthread_cond_init((pthread_cond_t *)&v34[15], 0LL);
  BYTE8(v35) = 0;
  __int128 v37 = 0uLL;
  pthread_mutex_init(&v38, 0LL);
  uint64_t v9 = operator new(0x98uLL);
  sub_188241AF8((uint64_t)v9);
  *(void *)&__int128 v26 = v9;
  uint64_t v10 = operator new(0x98uLL);
  sub_188241AF8((uint64_t)v10);
  *((void *)&v26 + 1) = v10;
  *(void *)&__int128 v29 = 0x500000002LL;
  DWORD2(v29) = 2;
  v30[0] = calloc(2uLL, 8uLL);
  if (v30[0])
  {
    int v11 = 0;
    do
    {
      uint64_t v12 = operator new(0x78uLL);
      sub_188241B44((uint64_t)v12);
      *(void *)uint64_t v12 = off_18A20C6B0;
      v12[112] = 0;
      *((void *)v12 + 11) = 0LL;
      *((void *)v12 + 12) = 0LL;
      *((void *)v12 + 13) = malloc(0x100000uLL);
      (*(void (**)(void, _BYTE *))(*(void *)v26 + 16LL))(v26, v12);
      ++v11;
    }

    while (v11 < SDWORD1(v29));
    if ((int)v29 <= 1)
    {
      uint64_t v14 = 0LL;
    }

    else
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
      do
      {
        pthread_create((pthread_t *)((char *)v30[0] + v13), 0LL, (void *(__cdecl *)(void *))sub_188241C00, &v26);
        ++v14;
        v13 += 8LL;
      }

      while (v14 < (int)v29 - 1LL);
    }

    pthread_create((pthread_t *)v30[0] + v14, 0LL, (void *(__cdecl *)(void *))sub_188241F0C, &v26);
    pthread_mutex_lock((pthread_mutex_t *)&v30[1]);
    while (DWORD2(v29))
      pthread_cond_wait((pthread_cond_t *)&v34[1], (pthread_mutex_t *)&v30[1]);
    pthread_mutex_unlock((pthread_mutex_t *)&v30[1]);
    v24.__darwin_time_t tv_sec = time(0LL) + 1;
    v24.tv_nsec = 0LL;
    pthread_mutex_lock((pthread_mutex_t *)&v34[7]);
    while (1)
    {
      pthread_cond_timedwait((pthread_cond_t *)&v34[15], (pthread_mutex_t *)&v34[7], &v24);
      if (v6) {
        v16.n128_f32[0] = (float)((float)(uint64_t)(v37 + *((void *)&v36 + 1)) * 100.0) / (float)v6;
      }
      else {
        v16.n128_u32[0] = 1120403456;
      }
      (*(void (**)(char *, __n128))(*(void *)a1 + 344LL))(a1, v16);
      int v17 = (*(uint64_t (**)(char *))(*(void *)a1 + 352LL))(a1);
      int v18 = v17;
      int v19 = BYTE8(v35) ? 1 : v17;
      if (v19 == 1) {
        break;
      }
      ++v24.tv_sec;
    }

    BYTE8(v35) = 1;
    if ((int)v29 >= 1)
    {
      int v20 = 0;
      do
      {
        (*(void (**)(void))(**((void **)&v26 + 1) + 48LL))(*((void *)&v26 + 1));
        (*(void (**)(void))(*(void *)v26 + 48LL))(v26);
        ++v20;
      }

      while (v20 < (int)v29);
    }

    if (v18) {
      uint64_t v15 = 111LL;
    }
    else {
      uint64_t v15 = 0LL;
    }
    pthread_mutex_unlock((pthread_mutex_t *)&v34[7]);
    if ((int)v29 >= 1)
    {
      uint64_t v21 = 0LL;
      do
      {
        pthread_join(*((pthread_t *)v30[0] + v21), &v25);
        if ((_DWORD)v15) {
          BOOL v22 = 1;
        }
        else {
          BOOL v22 = v25 == 0LL;
        }
        if (v22) {
          uint64_t v15 = v15;
        }
        else {
          uint64_t v15 = v25;
        }
        ++v21;
      }

      while (v21 < (int)v29);
    }
  }

  else
  {
    uint64_t v15 = 12LL;
  }

  (*(void (**)(char *))(*(void *)a3 + 72LL))(a3);
  sub_18823ADA4(v28);
  uint64_t v28 = 0LL;
  sub_18823ADA4(v27);
  int v27 = 0LL;
  if ((void)v26) {
    (*(void (**)(void))(*(void *)v26 + 8LL))(v26);
  }
  if (*((void *)&v26 + 1)) {
    (*(void (**)(void))(**((void **)&v26 + 1) + 8LL))(*((void *)&v26 + 1));
  }
  pthread_mutex_destroy((pthread_mutex_t *)&v30[1]);
  pthread_cond_destroy((pthread_cond_t *)&v34[1]);
  pthread_mutex_destroy((pthread_mutex_t *)&v34[7]);
  pthread_cond_destroy((pthread_cond_t *)&v34[15]);
  pthread_mutex_destroy(&v38);
  if (v30[0]) {
    free(v30[0]);
  }
  return v15;
}

void sub_188241A9C(_Unwind_Exception *a1)
{
}

uint64_t sub_188241AC0(void **a1)
{
  uint64_t result = ((uint64_t (*)(void **))(*a1)[37])(a1);
  if (result) {
    return *(void *)(*a1[113] + 16LL);
  }
  return result;
}

uint64_t sub_188241AF8(uint64_t a1)
{
  *(void *)a1 = off_18A20E210;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 8), 0LL);
  pthread_cond_init((pthread_cond_t *)(a1 + 72), 0LL);
  *(_DWORD *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0LL;
  *(void *)(a1 + 136) = 0LL;
  *(_DWORD *)(a1 + 144) = 0;
  return a1;
}

uint64_t sub_188241B44(uint64_t a1)
{
  *(void *)a1 = off_18A20E260;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 8), 0LL);
  *(void *)(a1 + 72) = 0LL;
  return a1;
}

uint64_t sub_188241B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if (a2)
  {
    *(void *)(a2 + 72) = *(void *)(a1 + 128);
    *(void *)(a1 + 128) = a2;
    int v5 = *(_DWORD *)(a1 + 140);
    int v6 = *(_DWORD *)(a1 + 136) + 1;
    *(_DWORD *)(a1 + 136) = v6;
    if (v5) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "TAOQueue::push: _count is now %d\n", v6);
    }
  }

  pthread_cond_broadcast((pthread_cond_t *)(a1 + 72));
  return pthread_mutex_unlock(v4);
}

uint64_t sub_188241C00(void *a1)
{
  __int128 v29 = 0LL;
  int v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  int v3 = (*(uint64_t (**)(void, void **, void))(*(void *)*a1 + 32LL))(*a1, &v29, 0LL);
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v29 == 0LL;
  }
  if (v4)
  {
LABEL_54:
    if (v3) {
      goto LABEL_55;
    }
    goto LABEL_56;
  }

  while (1)
  {
    pthread_mutex_lock((pthread_mutex_t *)a1 + 5);
    uint64_t v5 = a1[39];
    int v6 = (int *)a1[49];
    int v7 = *v6;
    if (*v6 == -1)
    {
      uint64_t v10 = 0LL;
      LOBYTE(v9) = 0;
      int v8 = 0;
      uint64_t v12 = a1[39];
    }

    else
    {
      int v8 = 0;
      int v9 = 0;
      uint64_t v10 = 0LL;
      uint64_t v11 = 2048LL;
      uint64_t v12 = a1[39];
      while (1)
      {
        uint64_t v13 = *((void *)v6 + 2);
        if (!v13) {
          break;
        }
LABEL_12:
        BOOL v15 = (v7 - 2147483646) < 2 || v7 == 0;
        int v16 = !v15 && v7 != 2;
        int v17 = v15;
        if (v10)
        {
          if (v8 != v16 || v9 != v17) {
            goto LABEL_37;
          }
        }

        else
        {
          int v9 = v17;
          int v8 = v16;
        }

        uint64_t v18 = *((void *)v6 + 1) + v13;
        uint64_t v19 = v18 - v12;
        if (v8)
        {
          if (v19 >= v11) {
            uint64_t v20 = v11;
          }
          else {
            uint64_t v20 = v18 - v12;
          }
          v10 += v20;
          v12 += v20;
          if (v19 > v11)
          {
            int v8 = 1;
            goto LABEL_37;
          }

          v11 -= v20;
        }

        else
        {
          v10 += v19;
          uint64_t v12 = v18;
        }

        int v21 = v6[10];
        v6 += 10;
        int v7 = v21;
        a1[49] = v6;
        if (v21 == -1) {
          goto LABEL_37;
        }
      }

      uint64_t v14 = v6 + 10;
      while (1)
      {
        int v7 = *v14;
        if (*v14 == -1) {
          break;
        }
        uint64_t v13 = *((void *)v14 + 2);
        v14 += 10;
        if (v13)
        {
          int v6 = v14 - 10;
          a1[49] = v6;
          goto LABEL_12;
        }
      }

      a1[49] = v14;
    }

void sub_188241EF8(_Unwind_Exception *a1)
{
}

uint64_t sub_188241F0C(void *a1)
{
  uint64_t v11 = 0LL;
  int v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  uint64_t v10 = a1[38];
  if (v10 >= a1[36])
  {
LABEL_12:
    int v3 = 0;
  }

  else
  {
    while (1)
    {
      int v3 = (*(uint64_t (**)(void, BOOL (*)(uint64_t, void *), uint64_t *, void **))(*(void *)a1[1] + 40LL))( a1[1],  sub_188242E94,  &v10,  &v11);
      BOOL v4 = v11;
      if (v3 || v11 == 0LL) {
        break;
      }
      uint64_t v6 = v11[12];
      a1[38] += v6;
      uint64_t v7 = v4[13];
      if (v7)
      {
        (*(void (**)(void, uint64_t, uint64_t))(*(void *)a1[3] + 56LL))(a1[3], v7, v6 << 9);
        int v8 = v11;
        v11[11] = 0LL;
        v8[12] = 0LL;
        (*(void (**)(void))(*(void *)*a1 + 16LL))(*a1);
      }

      else if (!*((_BYTE *)v4 + 112) {
             || ((*(void (**)(void, void, uint64_t))(*(void *)a1[3] + 64LL))(a1[3], 0LL, v6 << 9),
      }
                 (BOOL v4 = v11) != 0LL))
      {
        (*(void (**)(void *))(*v4 + 8LL))(v4);
      }

      uint64_t v10 = a1[38];
      uint64_t v11 = 0LL;
      if (v10 >= a1[36]) {
        goto LABEL_12;
      }
    }
  }

  pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
  *((_BYTE *)a1 + 280) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
  if (v11) {
    (*(void (**)(void *))(*v11 + 8LL))(v11);
  }
  return v3;
}

uint64_t sub_188242080(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  *(void *)a2 = 0LL;
  if (*(_DWORD *)(a1 + 120)) {
    goto LABEL_12;
  }
  uint64_t v7 = (FILE **)MEMORY[0x1895F89D0];
  while (1)
  {
    if ((a3 & 1) == 0)
    {
      int v8 = *(_DWORD *)(a1 + 144);
      if (*(_DWORD *)(a1 + 136) < v8)
      {
        if (*(_DWORD *)(a1 + 140)) {
          fprintf(*v7, "TAOQueue::dequeue: stalled _count=%d _reservePool=%d\n", *(_DWORD *)(a1 + 136), v8);
        }
        goto LABEL_8;
      }
    }

    uint64_t v9 = *(void *)(a1 + 128);
    if (v9) {
      break;
    }
LABEL_8:
    pthread_cond_wait((pthread_cond_t *)(a1 + 72), v6);
    if (*(_DWORD *)(a1 + 120)) {
      goto LABEL_12;
    }
  }

  *(void *)a2 = v9;
  *(void *)(a1 + 128) = *(void *)(*(void *)(a1 + 128) + 72LL);
  *(void *)(*(void *)a2 + 72LL) = 0LL;
  int v10 = *(_DWORD *)(a1 + 140);
  int v11 = *(_DWORD *)(a1 + 136) - 1;
  *(_DWORD *)(a1 + 136) = v11;
  if (v10) {
    fprintf(*v7, "TAOQueue::dequeue: _count is now %d\n", v11);
  }
LABEL_12:
  pthread_mutex_unlock(v6);
  return 0LL;
}

uint64_t sub_188242188(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t), uint64_t a3, void *a4)
{
  if (!a2) {
    return (*(uint64_t (**)(uint64_t, void *, void))(*(void *)a1 + 32LL))(a1, a4, 0LL);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  *a4 = 0LL;
  if (*(_DWORD *)(a1 + 120)) {
    goto LABEL_17;
  }
  int v8 = (uint64_t *)(a1 + 128);
  while (1)
  {
    uint64_t v9 = *v8;
    if (*v8) {
      break;
    }
LABEL_9:
    pthread_cond_wait((pthread_cond_t *)(a1 + 72), (pthread_mutex_t *)(a1 + 8));
    if (*(_DWORD *)(a1 + 120)) {
      goto LABEL_17;
    }
  }

  if (a2(*v8, a3))
  {
    while (1)
    {
      uint64_t v10 = v9;
      uint64_t v9 = *(void *)(v9 + 72);
      if (!v9) {
        goto LABEL_9;
      }
      if (!a2(v9, a3)) {
        goto LABEL_13;
      }
    }
  }

  uint64_t v10 = 0LL;
LABEL_13:
  uint64_t v12 = (void *)(v10 + 72);
  if (!v10) {
    uint64_t v12 = (void *)(a1 + 128);
  }
  *uint64_t v12 = *(void *)(v9 + 72);
  *(void *)(v9 + 72) = 0LL;
  *a4 = v9;
  int v13 = *(_DWORD *)(a1 + 140);
  int v14 = *(_DWORD *)(a1 + 136) - 1;
  *(_DWORD *)(a1 + 136) = v14;
  if (v13) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "TAOQueue::dequeueWithFilter: _count is now %d\n", v14);
  }
LABEL_17:
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 72));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
  return 0LL;
}

size_t sub_1882422E0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char *a5)
{
  uint64_t v9 = (pthread_rwlock_t *)(a1 + 160);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 160));
  uint64_t v28 = v9;
  if (a5)
  {
    uint64_t v10 = 0LL;
    if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1))
    {
      size_t v11 = 22LL;
      if ((a3 & 0x8000000000000000LL) == 0)
      {
        uint64_t v12 = *(void *)(a1 + 360);
        if (v12 >= a2 && a3 + a2 <= v12)
        {
          uint64_t v10 = 0LL;
          if (a3)
          {
            CFStringRef v30 = (pthread_mutex_t *)(a1 + 944);
            do
            {
              uint64_t v13 = *(void *)(a1 + 368);
              if (v13)
              {
                sub_188244720(v13);
                if (sub_188244728(*(void *)(a1 + 368), a2, a3, &v39, (uint64_t *)&__src))
                {
                  memmove(a5, __src, v39 << 9);
                  sub_1882447BC(*(void *)(a1 + 368));
                  goto LABEL_25;
                }

                sub_1882447BC(*(void *)(a1 + 368));
              }

              sub_18824269C(a1, a2, &v37, &v38, &v35, &v34, &v33, &v32, &v36);
              uint64_t v15 = v34;
              uint64_t v14 = v35;
              uint64_t v16 = a2 - v35;
              if (v34 - (a2 - v35) >= a3) {
                uint64_t v17 = a3;
              }
              else {
                uint64_t v17 = v34 - (a2 - v35);
              }
              uint64_t v39 = v17;
              if (v38 >= -2147483639)
              {
                LODWORD(v11) = 999;
                switch(v38)
                {
                  case -1:
                    goto LABEL_43;
                  case 0:
                  case 2:
                    bzero(a5, v17 << 9);
                    goto LABEL_25;
                  case 1:
                    uint64_t v24 = v33 + (v16 << 9);
                    uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
                    int v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *))(*(void *)v25 + 328LL))( v25,  v24,  v17 << 9,  v40,  a5);
                    break;
                  default:
                    if (v38 == 2147483646) {
                      continue;
                    }
                    int v22 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t *, char *))(*(void *)a1 + 576LL))( a1,  v36,  a2,  v17,  &v39,  a5);
                    break;
                }

                LODWORD(v11) = v22;
                goto LABEL_43;
              }

              uint64_t v18 = *(void *)(a1 + 368);
              int v19 = pthread_mutex_trylock(v30);
              if (v18 || a2 != v14 || v17 != v15)
              {
                if (!v19)
                {
                  LODWORD(v11) = sub_1882447C4(a1, (uint64_t)v36, v37);
                  if (!(_DWORD)v11) {
                    memmove(a5, (const void *)(*(void *)(a1 + 1008) + (v16 << 9)), v39 << 9);
                  }
                  pthread_mutex_unlock(v30);
                  goto LABEL_43;
                }

                size_t v11 = *(void *)(a1 + 1016);
                uint64_t v20 = (char *)malloc(v11);
                if (!v20)
                {
LABEL_40:
                  LODWORD(v11) = 12;
                  goto LABEL_43;
                }

                int v21 = v20;
                LODWORD(v11) = sub_18824273C((uint64_t *)a1, v36, v20, (uint64_t)&v20[v11 - v32]);
                if (!(_DWORD)v11) {
                  memmove(a5, &v21[512 * v16], v39 << 9);
                }
                goto LABEL_39;
              }

              if (v19) {
                goto LABEL_36;
              }
              if (!*(_BYTE *)(a1 + 1024) || *(_DWORD *)(a1 + 1028) != v37)
              {
                pthread_mutex_unlock(v30);
LABEL_36:
                size_t v11 = (size_t)v36;
                int v23 = (char *)malloc(*((void *)v36 + 4));
                if (!v23) {
                  goto LABEL_40;
                }
                int v21 = v23;
                LODWORD(v11) = sub_18824273C((uint64_t *)a1, (_DWORD *)v11, a5, (uint64_t)v23);
                if ((_DWORD)v11) {
                  fprintf((FILE *)*MEMORY[0x1895F89D0], "__decompressChunk() error: %d", v11);
                }
LABEL_39:
                free(v21);
                goto LABEL_43;
              }

              memmove(a5, *(const void **)(a1 + 1008), v39 << 9);
              pthread_mutex_unlock(v30);
LABEL_25:
              LODWORD(v11) = 0;
LABEL_43:
              v10 += v39;
              if ((_DWORD)v11) {
                BOOL v26 = 0;
              }
              else {
                BOOL v26 = v39 == 0;
              }
              if (v26) {
                size_t v11 = 999LL;
              }
              else {
                size_t v11 = v11;
              }
              if ((_DWORD)v11) {
                goto LABEL_53;
              }
              a3 -= v39;
              a2 += v39;
              a5 += 512 * v39;
            }

            while (a3);
          }

          size_t v11 = 0LL;
        }
      }
    }

    else
    {
      size_t v11 = 999LL;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
    size_t v11 = 22LL;
  }

LABEL_53:
  if (a4) {
    *a4 = v10;
  }
  pthread_rwlock_unlock(v28);
  return v11;
}

uint64_t sub_18824269C( uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  int v9 = 0;
  uint64_t v10 = **(void **)(result + 904);
  unsigned int v11 = *(_DWORD *)(v10 + 200) >> 1;
  uint64_t v12 = v10 + 204;
  while (1)
  {
    uint64_t v13 = *(void *)(v12 + 8);
    if (v13 <= a2 && *(void *)(v12 + 16) + v13 > a2) {
      break;
    }
    BOOL v14 = v13 <= a2;
    if (v13 <= a2) {
      uint64_t v15 = v11;
    }
    else {
      uint64_t v15 = -(uint64_t)v11;
    }
    if (v14) {
      int v16 = v11;
    }
    else {
      int v16 = -v11;
    }
    v9 += v16;
    v12 += 40 * v15;
    v11 >>= v11 > 1;
  }

  *a4 = *(_DWORD *)v12;
  *a3 = v9;
  *a5 = v13;
  *a6 = *(void *)(v12 + 48) - *(void *)(v12 + 8);
  *a7 = *(void *)(v12 + 24);
  *a8 = *(void *)(v12 + 32);
  if (a9) {
    *a9 = v12;
  }
  return result;
}

uint64_t sub_18824273C(uint64_t *a1, _DWORD *a2, const void *a3, uint64_t a4)
{
  int v8 = sub_18824289C((uint64_t)a1, *a2);
  if (!v8) {
    return 999LL;
  }
  int v9 = v8;
  uint64_t v10 = (*(uint64_t (**)(uint64_t *))(*a1 + 296))(a1);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void, void, _BYTE *, uint64_t))(*(void *)v10 + 328LL))( v10,  *((void *)a2 + 3),  *((void *)a2 + 4),  v18,  a4);
  if ((_DWORD)v11)
  {
    uint64_t v12 = v11;
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "__decompressChunk: backing store read at offset %qd length %qd failed with error %d\n",  *((void *)a2 + 3),  *((void *)a2 + 4),  v11);
  }

  else
  {
    uint64_t v13 = (*(uint64_t (**)(void *, uint64_t, void, const void *, void))(*v9 + 48LL))( v9,  a4,  a2[8],  a3,  (a2[4] << 9));
    if ((_DWORD)v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = (FILE **)MEMORY[0x1895F89D0];
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "CUDIFDiskImage::__decompressChunk()__decompressChunk: decompressData failed with error %d\n",  v13);
      fprintf( *v15,  "chunk: %p\n->runType: %#x\n->sectorStart: %qd\n->sectorCount: %qd\n->compOffset: %qd\n->compLength: %qd\n",  a2,  *a2,  *((void *)a2 + 1),  *((void *)a2 + 2),  *((void *)a2 + 3),  *((void *)a2 + 4));
      sub_18825A74C(a2[8], a4);
      return v14;
    }

    else
    {
      uint64_t v16 = a1[46];
      if (v16)
      {
        sub_188244830(v16);
        sub_188244838(a1[46], *((void *)a2 + 1), *((void *)a2 + 2), a3);
        sub_1882447BC(a1[46]);
      }

      return 0LL;
    }
  }

  return v12;
}

void *sub_18824289C(uint64_t a1, int a2)
{
  int v2 = *(void **)(a1 + 376);
  if (!v2)
  {
    switch(a2)
    {
      case -2147483648:
      case -2147483644:
        int v2 = operator new(0xB0uLL);
        sub_1882546F0();
        goto LABEL_9;
      case -2147483647:
        int v2 = operator new(0xA8uLL);
        sub_1882576F4(v2, 10240LL);
        goto LABEL_9;
      case -2147483646:
        int v2 = operator new(0x68uLL);
        sub_18825B7DC((uint64_t)v2);
        goto LABEL_9;
      case -2147483645:
        int v2 = operator new(0x268uLL);
        sub_18825B908((uint64_t)v2);
        goto LABEL_9;
      case -2147483643:
        int v2 = operator new(0x68uLL);
        sub_1882429A0((uint64_t)v2);
        goto LABEL_9;
      case -2147483641:
        int v2 = operator new(0x68uLL);
        sub_1882429C0((uint64_t)v2);
        void *v2 = &unk_18A20C708;
LABEL_9:
        *(void *)(a1 + 376) = v2;
        break;
      default:
        return v2;
    }
  }

  return v2;
}

void sub_188242978(_Unwind_Exception *a1)
{
}

void *sub_1882429A0(uint64_t a1)
{
  uint64_t result = sub_1882429C0(a1);
  *uint64_t result = &off_18A20B668;
  return result;
}

void *sub_1882429C0(uint64_t a1)
{
  uint64_t result = (void *)sub_18823A554(a1);
  *uint64_t result = off_18A20B378;
  return result;
}

uint64_t sub_1882429E0(uint64_t a1, Bytef *a2, int a3, Bytef *a4, int a5)
{
  unint64_t v8 = a5;
  uint64_t v5 = a3;
  uint64_t v6 = sub_188242A4C(a4, &v8, a2, a3);
  if ((_DWORD)v6) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "decompression failed; compressed chunk size %ld\n", v5);
  }
  return v6;
}

uint64_t sub_188242A4C(Bytef *a1, unint64_t *a2, Bytef *a3, uint64_t a4)
{
  unint64_t v5 = *a2;
  memset(&strm, 0, sizeof(strm));
  if (a3 < a1)
  {
    if (&a3[a4 - 1] >= a1) {
      return 1000LL;
    }
    goto LABEL_7;
  }

  uint64_t v6 = &a1[v5];
  if (&a1[v5] <= a3)
  {
LABEL_7:
    strm.next_in = a3;
    strm.avail_in = a4;
    strm.next_out = a1;
    strm.avail_out = v5;
    *a2 = 0LL;
    if (inflateInit_(&strm, "1.2.12", 112)) {
      return 1000LL;
    }
    if (inflate(&strm, 4) != 1) {
      goto LABEL_38;
    }
    *a2 = strm.total_out;
    BOOL v8 = inflateEnd(&strm) == 0;
    unsigned int v9 = 1000;
LABEL_10:
    if (v8) {
      return 0LL;
    }
    else {
      return v9;
    }
  }

  strm.next_in = a3;
  strm.avail_in = a4;
  strm.next_out = a1;
  strm.avail_out = (_DWORD)a3 - (_DWORD)a1;
  if (inflateInit_(&strm, "1.2.12", 112)) {
    return 1001LL;
  }
  char v10 = 0;
  uint64_t v11 = 0LL;
  unint64_t v12 = 0LL;
  next_out = 0LL;
  uLong total_out = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v33 = a2;
  uint64_t v34 = v6 - 1;
  uInt v16 = LODWORD(strm.next_in) - LODWORD(strm.next_out);
  size_t v17 = v5 >> 4;
  int v18 = 2;
  while (1)
  {
    strm.avail_out = v16;
    if (v16 > 0x64) {
      goto LABEL_21;
    }
    if (v15) {
      break;
    }
    if ((v10 & 1) == 0)
    {
      if (v5 < 0x10) {
        goto LABEL_38;
      }
      __int128 v29 = (Bytef *)calloc(v17, 1uLL);
      if (!v29) {
        return 1001LL;
      }
      uint64_t v11 = v29;
      next_out = strm.next_out;
      uLong total_out = strm.total_out;
      strm.next_out = v29;
      strm.avail_out = v17;
      int v30 = inflate(&strm, v18);
      if (v30 == 1)
      {
        __int128 v31 = v33;
LABEL_44:
        memmove(next_out, v11, strm.total_out - total_out);
        free(v11);
LABEL_45:
        int v32 = inflateEnd(&strm);
        *__int128 v31 = strm.total_out;
        BOOL v8 = v32 == 0;
        unsigned int v9 = 1001;
        goto LABEL_10;
      }

      if (v30 | strm.avail_out) {
        goto LABEL_38;
      }
      uint64_t v15 = 0LL;
      unint64_t v12 = v17;
      goto LABEL_30;
    }

    uint64_t v19 = v34 - next_out;
    if (v34 - next_out >= v5) {
      goto LABEL_38;
    }
    int v20 = v19 + 1;
    if (v12 > v19 + 1) {
      goto LABEL_38;
    }
    uLong v21 = total_out;
    size_t v22 = v17;
    unint64_t v23 = v12;
    uLong v24 = strm.total_out;
    uint64_t v25 = (char *)calloc(v19 + 1, 1uLL);
    if (!v25) {
      return 1001LL;
    }
    uint64_t v15 = v25;
    size_t v26 = v24 - v21;
    memmove(v25, v11, v26);
    free(v11);
    char v10 = 0;
    strm.next_out = (Bytef *)&v15[v26];
    strm.avail_out = v20 - v26;
    int v18 = 4;
    unint64_t v12 = v23;
    size_t v17 = v22;
    uLong total_out = v21;
LABEL_21:
    int v27 = inflate(&strm, v18);
    if (v27 == 1)
    {
      if (v15)
      {
        memmove(next_out, v15, strm.total_out - total_out);
        free(v15);
        __int128 v31 = v33;
      }

      else
      {
        __int128 v31 = v33;
        if ((v10 & 1) != 0) {
          goto LABEL_44;
        }
      }

      goto LABEL_45;
    }

    if (v27 | strm.avail_out) {
      goto LABEL_38;
    }
    if ((v10 & 1) == 0)
    {
      int v28 = (int)strm.next_out;
      goto LABEL_32;
    }

LABEL_30:
    uInt v16 = 0;
    char v10 = 1;
    if (strm.next_in - next_out >= (int64_t)(strm.total_out - total_out))
    {
      memmove(next_out, v11, strm.total_out - total_out);
      free(v11);
      int v28 = (_DWORD)next_out + LODWORD(strm.total_out) - total_out;
      strm.next_out = &next_out[strm.total_out - total_out];
LABEL_32:
      char v10 = 0;
      uInt v16 = LODWORD(strm.next_in) - v28;
    }
  }

  if ((v10 & 1) != 0) {
    free(v11);
  }
  free(v15);
LABEL_38:
  inflateEnd(&strm);
  return 1000LL;
}

  if (a4) {
    *a4 = v13;
  }
  pthread_rwlock_unlock(v10);
  return v17;
}

    free(v10);
  }

  else
  {
    size_t v17 = 4294967188LL;
  }

  free(v8);
  return v17;
}

  if (!a8 || (v27 & 1) == 0)
  {
LABEL_32:
    if (Mutable)
    {
      CFRelease(Mutable);
      CFMutableArrayRef Mutable = 0LL;
    }
  }

  if (a6) {
    *a6 = v26;
  }
  if (v100) {
    *v100 = v25;
  }
  if (a5) {
    *a5 = v19;
  }
  if (a8) {
    *a8 = Mutable;
  }
  return v21;
}

uint64_t sub_188242D8C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if (a2)
  {
    unint64_t v5 = (void *)(a1 + 128);
    uint64_t v6 = *(void *)(a1 + 128);
    while (v6)
    {
      uint64_t v7 = v6;
      uint64_t v6 = *(void *)(v6 + 72);
      if (!v6)
      {
        unint64_t v5 = (void *)(v7 + 72);
        break;
      }
    }

    void *v5 = a2;
    int v8 = *(_DWORD *)(a1 + 140);
    int v9 = *(_DWORD *)(a1 + 136) + 1;
    *(_DWORD *)(a1 + 136) = v9;
    if (v8) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "TAOQueue::enqueue: _count is now %d\n", v9);
    }
  }

  pthread_cond_broadcast((pthread_cond_t *)(a1 + 72));
  return pthread_mutex_unlock(v4);
}

void sub_188242E24(void *a1)
{
}

void sub_188242E48(_Unwind_Exception *a1)
{
}

uint64_t sub_188242E5C(void *a1)
{
  *a1 = off_18A20C6B0;
  int v2 = (void *)a1[13];
  if (v2) {
    free(v2);
  }
  return sub_188242EA8((uint64_t)a1);
}

BOOL sub_188242E94(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 88) != *a2;
}

uint64_t sub_188242EA8(uint64_t a1)
{
  *(void *)a1 = off_18A20E260;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  return a1;
}

uLong sub_188242ED8(uint64_t a1, const Bytef *a2, uInt a3)
{
  uLong result = crc32(*(unsigned int *)(a1 + 112), a2, a3);
  *(_DWORD *)(a1 + 112) = result;
  return result;
}

uint64_t sub_188242F00(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 128)) {
    return 1LL;
  }
  int v3 = *(uint64_t (**)(uint64_t))(a1 + 120);
  if (v3)
  {
    int v4 = v3(a1);
  }

  else
  {
    uint64_t result = sub_188241410(a1);
    if (!result) {
      return result;
    }
    unint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, void, void, void, void))sub_188241410(a1);
    int v4 = v5(2LL, a1, 0LL, 0LL, 0LL, 0LL);
  }

  return v4 != 0;
}

uint64_t sub_188242F7C(_DWORD *a1)
{
  a1[30] = 1;
  return (*(uint64_t (**)(_DWORD *, void))(*(void *)a1 + 24LL))(a1, 0LL);
}

void sub_188242F98(void *a1)
{
}

void sub_188242FBC(_Unwind_Exception *a1)
{
}

uint64_t sub_188242FD0(uint64_t a1)
{
  *(void *)a1 = off_18A20E210;
  int v2 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  int v3 = *(void **)(a1 + 128);
  if (v3)
  {
    do
    {
      int v4 = (void *)v3[9];
      (*(void (**)(void *))(*v3 + 8LL))(v3);
      --*(_DWORD *)(a1 + 136);
      int v3 = v4;
    }

    while (v4);
  }

  *(void *)(a1 + 128) = 0LL;
  pthread_mutex_unlock(v2);
  pthread_mutex_destroy(v2);
  pthread_cond_destroy((pthread_cond_t *)(a1 + 72));
  return a1;
}

CFStringRef sub_18824305C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && a3)
  {
    int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 152LL))(a2, a3);
    int v6 = DIGetBundleRef();
    if (v5)
    {
      uint64_t v7 = @"verified   %1$@ %2$@";
LABEL_7:
      int v8 = (const __CFString *)sub_1882660CC(v6, (int)v7, v7);
      int v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104LL))(a2);
      uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120LL))(a2);
      CFStringRef v11 = CFStringCreateWithFormat(v9, 0LL, v8, v10, v21);
      goto LABEL_11;
    }

    int v8 = (const __CFString *)sub_1882660CC( v6,  (int)@"calculated %1$@ %2$@, expected   %3$@ %4$@",  @"calculated %1$@ %2$@, expected   %3$@ %4$@");
    unint64_t v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 104LL))(a3);
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 120LL))(a3);
    uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104LL))(a2);
    uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120LL))(a2);
    CFStringRef v11 = CFStringCreateWithFormat(v12, 0LL, v8, v13, v14, v15, v23);
  }

  else
  {
    if (a2)
    {
      int v6 = DIGetBundleRef();
      uint64_t v7 = @"expected   %1$@ %2$@";
      goto LABEL_7;
    }

    if (!a3) {
      return 0LL;
    }
    int v16 = DIGetBundleRef();
    int v8 = (const __CFString *)sub_1882660CC(v16, (int)@"calculated %1$@ %2$@", @"calculated %1$@ %2$@");
    size_t v17 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 104LL))(a3);
    uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 120LL))(a3);
    CFStringRef v11 = CFStringCreateWithFormat(v17, 0LL, v8, v18, v22);
  }

LABEL_11:
  CFStringRef v19 = v11;
  if (v8) {
    CFRelease(v8);
  }
  return v19;
}

  *(_DWORD *)(a1 + 16) = v6 + v2;
  return v7;
}

    CFRelease(v9);
    goto LABEL_12;
  }

  return v8;
}

    uint64_t result = 0LL;
    *a3 = v7;
  }

  return result;
}

uint64_t sub_188243230(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128LL))(a1);
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
  unsigned int v7 = v6 >> 3;
  if ((v6 & 7) != 0) {
    size_t v8 = v7 + 1;
  }
  else {
    size_t v8 = v7;
  }
  if (!(_DWORD)v8) {
    return 1LL;
  }
  uint64_t v9 = v6;
  uint64_t v10 = (char *)malloc(v8);
  CFStringRef v11 = (char *)malloc(v8);
  unint64_t v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)a1 + 96LL))(a1, v10, v9);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)a2 + 96LL))(a2, v12, v9);
    BOOL v16 = strncmp(v10, v12, v8) == 0;
LABEL_17:
    free(v10);
    BOOL v14 = v16;
    goto LABEL_18;
  }

  BOOL v16 = 0LL;
  BOOL v14 = 0LL;
  if (v10) {
    goto LABEL_17;
  }
LABEL_18:
  if (v12) {
    free(v12);
  }
  return v14;
}

void *sub_188243380(unsigned int *a1, void *a2, unsigned int a3)
{
  unsigned int v3 = a3;
  unsigned int __src = bswap32(a1[28]);
  unsigned int v6 = v3 >> 3;
  if ((v3 & 7) != 0) {
    size_t v7 = v6 + 1;
  }
  else {
    size_t v7 = v6;
  }
  return memcpy(a2, &__src, v7);
}

CFStringRef sub_188243400()
{
  return @"CRC32";
}

CFMutableStringRef sub_18824340C(CFMutableStringRef *a1)
{
  uint64_t v2 = ((uint64_t (*)(CFMutableStringRef *))(*a1)[2].length)(a1);
  unsigned int v3 = v2 >> 3;
  if ((v2 & 7) != 0) {
    size_t v4 = v3 + 1;
  }
  else {
    size_t v4 = v3;
  }
  CFStringReplaceAll(a1[13], &stru_18A20E810);
  if ((_DWORD)v2)
  {
    int v5 = (unsigned __int8 *)malloc(v4);
    if (v5)
    {
      unsigned int v6 = v5;
      CFStringAppend(a1[13], @"$");
      ((void (*)(CFMutableStringRef *, unsigned __int8 *, uint64_t))(*a1)[3].isa)(a1, v6, v2);
      if ((_DWORD)v4)
      {
        size_t v7 = v6;
        do
        {
          int v8 = *v7++;
          snprintf(__str, 3uLL, "%02hX", v8);
          CFStringAppendCString(a1[13], __str, 0x600u);
          LODWORD(v4) = v4 - 1;
        }

        while ((_DWORD)v4);
      }

      free(v6);
    }
  }

  return a1[13];
}

CFStringRef sub_1882434F4(const __CFString *a1, uint64_t a2, const __CFBoolean *a3)
{
  if (!a1 || !a2) {
    return 0LL;
  }
  if (a2 >= 0) {
    CFIndex v6 = a2;
  }
  else {
    CFIndex v6 = -a2;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v8 = v6 - Length;
  if (v6 > Length)
  {
    uint64_t v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], v6);
    if (Mutable)
    {
      CFStringRef v11 = Mutable;
      if (a2 < 0)
      {
        CFStringAppend(Mutable, a1);
        CFStringPad(v11, @" ", v6, 1LL);
      }

      else
      {
        CFStringPad(Mutable, @" ", v8, 1LL);
        CFStringAppend(v11, a1);
      }

      CFStringRef Copy = CFStringCreateCopy(v9, v11);
      CFRelease(v11);
      return Copy;
    }

    return 0LL;
  }

  CFIndex v13 = Length;
  int Value = CFBooleanGetValue(a3);
  uint64_t v15 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (!Value || v6 == v13) {
    return CFStringCreateCopy(v15, a1);
  }
  v17.location = 0LL;
  v17.length = v6;
  return CFStringCreateWithSubstring(v15, a1, v17);
}

void sub_188243638(uint64_t a1, _DWORD *a2)
{
  *a2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128LL))(a1);
  unsigned int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
  if (v4 >= 0x400) {
    int v5 = 1024;
  }
  else {
    int v5 = v4;
  }
  a2[1] = v5;
  (*(void (**)(uint64_t, _DWORD *, uint64_t))(*(void *)a1 + 96LL))(a1, a2 + 2, 1024LL);
  unsigned int v6 = a2[1] + 7;
  if (v6 <= 0x3FF) {
    bzero((char *)a2 + (v6 >> 3) + 8, 128LL - (v6 >> 3));
  }
}

CFStringRef sub_1882436E0(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
  if (!v2) {
    return 0LL;
  }
  unsigned int v3 = (char *)v2;
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 488LL))(v4);
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  CFStringRef v7 = (CFStringRef)(*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)v5 + 24LL))( v5,  @"bs-persistentID");
  if (v7)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v7))
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)v6 + 24LL))(v6, @"bs-modtime");
      if (v9)
      {
        uint64_t v10 = (const void *)v9;
        CFTypeID v11 = CFStringGetTypeID();
        if (v11 == CFGetTypeID(v10))
        {
          uint64_t v12 = (*(uint64_t (**)(char *))(*(void *)v3 + 104LL))(v3);
          if (v12)
          {
            CFIndex v13 = (const void *)v12;
            CFTypeID v14 = CFStringGetTypeID();
            if (v14 == CFGetTypeID(v13))
            {
              uint64_t v15 = (*(uint64_t (**)(char *))(*(void *)v3 + 120LL))(v3);
              if (v15)
              {
                BOOL v16 = (const void *)v15;
                CFTypeID v17 = CFStringGetTypeID();
                if (v17 == CFGetTypeID(v16))
                {
                  CFStringRef v7 = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"%@ @ %@ - %@:%@",  v7,  v10,  v13,  v16);
                  goto LABEL_14;
                }
              }
            }
          }
        }
      }
    }

uint64_t sub_188243860()
{
  return 0LL;
}

uint64_t DIDiskImageCopyChecksumReportString(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 376LL))(a1);
}

uint64_t DIDiskImageObjectGetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24LL))(a1);
}

uint64_t sub_188243880()
{
  return 0LL;
}

uint64_t DIDiskImageIsKernelCompatible(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
}

uint64_t sub_188243894(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 208LL))(a1);
  if ((_DWORD)result)
  {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
    return (*(uint64_t (**)(uint64_t))(*(void *)v3 + 96LL))(v3);
  }

  return result;
}

uint64_t sub_1882438E4(uint64_t a1)
{
  int v1 = *(uint64_t **)(a1 + 904);
  if (v1)
  {
    uint64_t v2 = *v1;
    int v3 = *(_DWORD *)(*v1 + 200);
    if (!v3) {
      return 1LL;
    }
    for (uint64_t i = (int *)(v2 + 204); *i >= -2147483639 || ((0x15Fu >> *i) & 1) == 0; i += 10)
    {
      if (!--v3) {
        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_188243938(void *a1)
{
  else {
    return 0LL;
  }
}

BOOL sub_188243984(uint64_t a1)
{
  return *(_BYTE *)(a1 + 778) && *(_BYTE *)(a1 + 779) && !*(_BYTE *)(a1 + 780) && *(void *)(a1 + 456) <= 0x400000LL;
}

uint64_t sub_1882439B4()
{
  return 1LL;
}

__CFDictionary *sub_1882439BC(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  int v3 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (v2 && (CFMutableArrayRef Mutable = (__CFDictionary *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 456LL))(v2)) != 0LL
    || (CFMutableArrayRef Mutable = CFDictionaryCreateMutable(*v3, 0LL, MEMORY[0x189605240], MEMORY[0x189605250])) != 0LL)
  {
    uint64_t v5 = sub_188243DE8();
    if (v5)
    {
      uint64_t v6 = v5;
      CFStringRef v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
      if (v7)
      {
        CFIndex v8 = v7;
        CFDataRef v9 = sub_188243DCC(v7, 0x8000100u);
        if (v9)
        {
          CFDataRef v10 = v9;
          CFDictionarySetValue(Mutable, @"icon-path", v9);
          CFRelease(v8);
          CFIndex v8 = (const __CFString *)v10;
        }

        CFRelease(v8);
      }

      CFRelease(v6);
    }

    uint64_t valuePtr = 512LL;
    CFTypeID v11 = *v3;
    CFNumberRef v12 = CFNumberCreate(*v3, kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(Mutable, @"blocksize", v12);
    if (v12) {
      CFRelease(v12);
    }
    CFIndex v13 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 72LL))(a1);
    if (v13)
    {
      CFTypeID v14 = v13;
      CFDictionarySetValue(Mutable, @"image-type", v13);
      CFRelease(v14);
    }

    int v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288LL))(a1);
    BOOL v16 = (const void *)*MEMORY[0x189604DE0];
    CFTypeID v17 = (const void *)*MEMORY[0x189604DE8];
    if (v15) {
      uint64_t v18 = (const void *)*MEMORY[0x189604DE0];
    }
    else {
      uint64_t v18 = (const void *)*MEMORY[0x189604DE8];
    }
    CFDictionarySetValue(Mutable, @"write-protected", v18);
    CFStringRef v19 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 280LL))(a1);
    if (v19) {
      CFDictionarySetValue(Mutable, @"backingstore-id", v19);
    }
    else {
      int v20 = v16;
    }
    CFDictionarySetValue(Mutable, @"image-encrypted", v20);
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 288LL))(a1))
    {
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 232LL))(a1);
      CFNumberRef v21 = CFNumberCreate(v11, kCFNumberLongLongType, &v23);
      CFDictionarySetValue(Mutable, @"virtual-band-size", v21);
      CFRelease(v21);
    }
  }

  return Mutable;
}

uint64_t sub_188243C00(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 456LL))(result);
  }
  return result;
}

__CFDictionary *sub_188243C18(uint64_t a1)
{
  CFMutableArrayRef Mutable = sub_188243CA0(a1);
  if (Mutable
    || (CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250])) != 0LL)
  {
    int v3 = (const void *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)a1 + 24LL))( a1,  @"bs-apple-quarantine-info");
    if (v3) {
      CFDictionarySetValue(Mutable, @"bs-apple-quarantine-info", v3);
    }
  }

  return Mutable;
}

__CFDictionary *sub_188243CA0(uint64_t a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable) {
    sub_18825ADC4(a1, Mutable);
  }
  return Mutable;
}

uint64_t sub_188243CF8(uint64_t a1)
{
  return *(void *)(a1 + 144);
}

CFURLRef sub_188243D00(CFURLRef relativeURL)
{
  int v1 = relativeURL;
  if (!relativeURL) {
    return v1;
  }
  CFURLRef v2 = CFURLCopyAbsoluteURL(relativeURL);
  CFURLRef v3 = v2;
  if (v2) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = v1;
  }
  uint64_t v5 = CFURLCopyScheme(v4);
  uint64_t v6 = v5;
  if (!v5 || CFStringCompare(v5, @"file", 0LL) == kCFCompareEqualTo)
  {
    CFStringRef Copy = CFURLCopyFileSystemPath(v4, kCFURLPOSIXPathStyle);
LABEL_10:
    int v1 = (const __CFURL *)Copy;
    if (!v3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  if (CFURLGetString(v1))
  {
    CFStringRef v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFIndex v8 = CFURLGetString(v1);
    CFStringRef Copy = CFStringCreateCopy(v7, v8);
    goto LABEL_10;
  }

  int v1 = 0LL;
  if (v3) {
LABEL_11:
  }
    CFRelease(v3);
LABEL_12:
  if (v6) {
    CFRelease(v6);
  }
  return v1;
}

CFDataRef sub_188243DCC(CFStringRef theString, CFStringEncoding encoding)
{
  return CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], theString, encoding, 0);
}

__CFBundle *sub_188243DE8()
{
  uint64_t result = (__CFBundle *)DIGetBundleRef();
  if (result) {
    return CFBundleCopyResourceURL(result, @"CDiskImage", @"icns", 0LL);
  }
  return result;
}

CFStringRef sub_188243E1C(uint64_t a1)
{
  int v1 = *(uint64_t **)(a1 + 904);
  if (!v1) {
    return @"UDIF read-only";
  }
  uint64_t v2 = *v1;
  int v3 = *(_DWORD *)(*v1 + 200);
  if (!v3) {
    return @"UDIF read-only";
  }
  uint64_t result = @"UDIF read-only compressed (bzip2)";
  for (uint64_t i = (int *)(v2 + 204); ; i += 10)
  {
    int v6 = *i;
    if (*i != -1) {
      break;
    }
LABEL_7:
    if (!--v3) {
      return @"UDIF read-only";
    }
  }

  switch(v6)
  {
    case -2147483644:
      uint64_t result = @"UDIF read-only compressed (ADC)";
      break;
    case -2147483643:
      uint64_t result = @"UDIF read-only compressed (zlib)";
      break;
    case -2147483642:
      return result;
    case -2147483641:
      uint64_t result = @"UDIF read-only compressed (lzfse)";
      break;
    case -2147483640:
      uint64_t result = @"UDIF read-only compressed (lzma)";
      break;
    default:
      if ((v6 & 0x80000000) == 0) {
        goto LABEL_7;
      }
      uint64_t result = @"UDIF read-only compressed";
      break;
  }

  return result;
}

uint64_t sub_188243EDC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 148);
}

uint64_t sub_188243EE4(void *a1)
{
  uint64_t result = a1[19];
  if (!result)
  {
    int v3 = (const void *)(*(uint64_t (**)(void *))(*a1 + 192LL))(a1);
    (*(void (**)(void *, const void *))(*a1 + 504LL))(a1, v3);
    if (v3) {
      CFRelease(v3);
    }
    return a1[19];
  }

  return result;
}

__CFDictionary *sub_188243F40(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  int v3 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 48LL))(v2);
  values = v3;
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = (const __CFArray *)v3;
  CFTypeID v5 = CFGetTypeID(v3);
  CFTypeID TypeID = CFArrayGetTypeID();
  CFStringRef v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFArrayRef v8 = v5 == TypeID
     ? CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v4)
     : CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)&values, 1LL, MEMORY[0x189605228]);
  CFArrayRef v9 = v8;
  if (!v8) {
    return 0LL;
  }
  int v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288LL))(a1);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v7, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFNumberRef v12 = Mutable;
  if (Mutable)
  {
    if (v10) {
      CFIndex v13 = @"writeable-components";
    }
    else {
      CFIndex v13 = @"readonly-components";
    }
    CFDictionarySetValue(Mutable, v13, v9);
  }

  CFRelease(v9);
  return v12;
}

void sub_188244064(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  uint64_t v4 = *(const void **)(a1 + 152);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 152) = cf;
}

uint64_t sub_1882440A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if (!v1) {
    return 0LL;
  }
  LOBYTE(v2) = 0;
  do
  {
    if ((_BYTE)v2) {
      uint64_t v2 = 1LL;
    }
    else {
      uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 104LL))(v1);
    }
    uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 496LL))(v1);
  }

  while (v1);
  return v2;
}

uint64_t sub_18824410C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 104LL))(result);
  }
  return result;
}

uint64_t sub_188244124()
{
  return 0LL;
}

uint64_t sub_18824412C()
{
  return 0LL;
}

__CFDictionary *sub_188244134(uint64_t a1)
{
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  int v3 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (v2 && (CFMutableArrayRef Mutable = (__CFDictionary *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 464LL))(v2)) != 0LL
    || (CFMutableArrayRef Mutable = CFDictionaryCreateMutable(*v3, 0LL, MEMORY[0x189605240], MEMORY[0x189605250])) != 0LL)
  {
    CFTypeID v5 = sub_188243DE8();
    if (v5)
    {
      int v6 = v5;
      CFStringRef v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
      if (v7)
      {
        CFArrayRef v8 = v7;
        CFDataRef v9 = sub_188243DCC(v7, 0x8000100u);
        if (v9)
        {
          CFDataRef v10 = v9;
          CFDictionarySetValue(Mutable, @"icon-path", v9);
          CFRelease(v8);
          CFArrayRef v8 = (const __CFString *)v10;
        }

        CFRelease(v8);
      }

      CFRelease(v6);
    }

    uint64_t valuePtr = 512LL;
    CFTypeID v11 = *v3;
    CFNumberRef v12 = CFNumberCreate(*v3, kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(Mutable, @"blocksize", v12);
    if (v12) {
      CFRelease(v12);
    }
    CFNumberRef v13 = CFNumberCreate(v11, kCFNumberSInt64Type, &v25);
    CFDictionarySetValue(Mutable, @"blockcount", v13);
    if (v13) {
      CFRelease(v13);
    }
    CFTypeID v14 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 72LL))(a1);
    if (v14)
    {
      int v15 = v14;
      CFDictionarySetValue(Mutable, @"image-type", v14);
      CFRelease(v15);
    }

    int v16 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
    if (v16 == 1430541391 || v16 == 1430538566)
    {
      CFTypeID v17 = (const void *)*MEMORY[0x189604DE8];
      CFDictionarySetValue(Mutable, @"image-format-read-only", (const void *)*MEMORY[0x189604DE8]);
      uint64_t v18 = (const void *)*MEMORY[0x189604DE0];
    }

    else
    {
      uint64_t v18 = (const void *)*MEMORY[0x189604DE0];
      CFDictionarySetValue(Mutable, @"image-format-read-only", (const void *)*MEMORY[0x189604DE0]);
      CFTypeID v17 = (const void *)*MEMORY[0x189604DE8];
    }

    else {
      CFStringRef v19 = v17;
    }
    CFDictionarySetValue(Mutable, @"write-protected", v19);
    int v20 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 280LL))(a1);
    if (v20) {
      CFDictionarySetValue(Mutable, @"backingstore-id", v20);
    }
    else {
      CFNumberRef v21 = v18;
    }
    CFDictionarySetValue(Mutable, @"image-encrypted", v21);
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 288LL))(a1))
    {
      uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 232LL))(a1);
      CFNumberRef v22 = CFNumberCreate(v11, kCFNumberLongLongType, &v24);
      CFDictionarySetValue(Mutable, @"virtual-band-size", v22);
      CFRelease(v22);
    }
  }

  return Mutable;
}

uint64_t sub_188244434(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 464LL))(result);
  }
  return result;
}

__CFDictionary *sub_18824444C(uint64_t a1)
{
  CFMutableArrayRef Mutable = sub_1882444EC(a1);
  if (Mutable
    || (CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250])) != 0LL)
  {
    CFDictionaryAddValue(Mutable, @"Physical Interconnect Location", @"File");
    int v3 = (const void *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)a1 + 24LL))( a1,  @"bs-apple-quarantine-info");
    if (v3) {
      CFDictionarySetValue(Mutable, @"bs-apple-quarantine-info", v3);
    }
  }

  return Mutable;
}

__CFDictionary *sub_1882444EC(uint64_t a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable) {
    sub_18825ADC4(a1, Mutable);
  }
  return Mutable;
}

uint64_t sub_188244548(uint64_t a1, int a2)
{
  *(void *)a1 = off_18A20D700;
  pthread_rwlock_init((pthread_rwlock_t *)(a1 + 8), 0LL);
  *(_DWORD *)(a1 + 208) = a2;
  *(void *)(a1 + 216) = calloc(a2, 8uLL);
  uint64_t v4 = *(unsigned int *)(a1 + 208);
  if ((int)v4 >= 1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 8 * v4;
    do
    {
      CFStringRef v7 = operator new(0x40uLL);
      v7[1] = 0LL;
      v7[2] = 0LL;
      *CFStringRef v7 = &off_18A20D720;
      *((_BYTE *)v7 + 24) = 0;
      CFArrayRef v8 = malloc(0LL);
      v7[4] = 0LL;
      v7[5] = 0LL;
      v7[6] = 0LL;
      v7[7] = v8;
      *(void *)(*(void *)(a1 + 216) + v5) = v7;
      v5 += 8LL;
    }

    while (v6 != v5);
  }

  return a1;
}

uint64_t sub_1882445FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 200);
  if (!v2) {
    return *(_BYTE *)(a1 + 192) != 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 664LL))(v2);
  *(_BYTE *)(a1 + 192) = result;
  return result;
}

uint64_t sub_188244640(_DWORD *a1, uint64_t a2)
{
  int v4 = a1[80];
  if (v4 < 0
    || (int v5 = fcntl(v4, 3, 0LL), v5 != -1)
    && (!(_DWORD)a2 ? (int v6 = 0) : (int v6 = 128), fcntl(a1[80], 4, v5 & 0xFFFFFF7F | v6) != -1))
  {
    sub_188244708((uint64_t)a1, a2);
    if ((*(unsigned int (**)(_DWORD *))(*(void *)a1 + 72LL))(a1))
    {
      if ((_DWORD)a2)
      {
        (*(void (**)(_DWORD *, uint64_t))(*(void *)a1 + 472LL))(a1, 1LL);
        sub_18823B0C4((uint64_t)a1);
      }

      else
      {
        sub_18823A668(a1, 4, 0x100000uLL);
      }
    }
  }

  return *((unsigned __int8 *)a1 + 192);
}

uint64_t sub_188244708(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 192) = a2;
  return a2;
}

uint64_t DIDiskImageReadSectors(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1);
}

uint64_t sub_188244720(uint64_t a1)
{
  return pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_188244728(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t *a5)
{
  uint64_t v5 = *(unsigned int *)(a1 + 208);
  if ((int)v5 < 1)
  {
    char v7 = 0;
  }

  else
  {
    uint64_t v6 = 0LL;
    char v7 = 0;
    uint64_t v8 = 8 * v5;
    do
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 216) + v6);
      if (v9 && *(_BYTE *)(v9 + 24))
      {
        uint64_t v10 = *(void *)(v9 + 32);
        uint64_t v11 = *(void *)(v9 + 40) + v10;
        ++*(void *)(v9 + 16);
        BOOL v12 = __OFSUB__(a2, v10);
        uint64_t v13 = a2 - v10;
        if (v13 < 0 == v12 && v11 > a2)
        {
          if (v11 - a2 >= a3) {
            uint64_t v15 = a3;
          }
          else {
            uint64_t v15 = v11 - a2;
          }
          uint64_t v16 = *(void *)(v9 + 56) + (v13 << 9);
          char v7 = 1;
          ++*(void *)(v9 + 8);
          *(void *)(v9 + 16) = 1LL;
          *a4 = v15;
          *a5 = v16;
        }
      }

      v6 += 8LL;
    }

    while (v8 != v6);
  }

  return v7 & 1;
}

uint64_t sub_1882447BC(uint64_t a1)
{
  return pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_1882447C4(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_BYTE *)(a1 + 1024) && *(_DWORD *)(a1 + 1028) == a3) {
    return 0LL;
  }
  *(_BYTE *)(a1 + 1024) = 0;
  uint64_t result = sub_18824273C( (uint64_t *)a1,  (_DWORD *)a2,  *(const void **)(a1 + 1008),  *(void *)(a1 + 1008) + *(void *)(a1 + 1016) - *(void *)(a2 + 32));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a1 + 1028) = a3;
    *(_BYTE *)(a1 + 1024) = 1;
  }

  return result;
}

uint64_t sub_188244830(uint64_t a1)
{
  return pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_188244838(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v8 = sub_1882448F0(a1, a3);
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v8;
  *(_BYTE *)(v8 + 24) = 0;
  *(int64x2_t *)(v8 + 8) = vdupq_n_s64(1uLL);
  *(void *)(v8 + 32) = a2;
  uint64_t v10 = sub_1882449F0(v8, a3);
  if ((_DWORD)v10)
  {
    fwrite("CUDIFCacheObject::cacheData: setLength failed\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    sub_1882639A0(a1);
  }

  else
  {
    memcpy(*(void **)(v9 + 56), a4, a3 << 9);
    *(_BYTE *)(v9 + 24) = 1;
  }

  return v10;
}

uint64_t sub_1882448F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 208);
  uint64_t v5 = 0LL;
  uint64_t v6 = *(void *)(a1 + 216);
  unsigned int v7 = -1;
  int64_t v8 = 0x8000000000000000LL;
  while (1)
  {
    uint64_t v9 = *(void *)(v6 + 8 * v5);
    if (v9) {
      break;
    }
LABEL_8:
    if (v2 == ++v5)
    {
      if ((v7 & 0x80000000) != 0) {
        return 0LL;
      }
      return *(void *)(*(void *)(a1 + 216) + 8LL * v7);
    }
  }

  if (*(_BYTE *)(v9 + 24) || *(void *)(v9 + 48) < a2)
  {
    uint64_t v10 = sub_188244998(v9);
    if (v10 > v8)
    {
      unsigned int v7 = v5;
      int64_t v8 = v10;
    }

    goto LABEL_8;
  }

  unsigned int v7 = v5;
  if ((v5 & 0x80000000) == 0) {
    return *(void *)(*(void *)(a1 + 216) + 8LL * v7);
  }
  return 0LL;
}

uint64_t sub_188244998(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    return *(void *)(a1 + 48) + 0x7FFFFFFFLL;
  }
  uint64_t v1 = 0LL;
  uint64_t v2 = 0LL;
  unint64_t v3 = *(void *)(a1 + 40);
  do
  {
    if ((v3 & 1) != 0) {
      uint64_t v2 = v1;
    }
    ++v1;
    v3 >>= 1;
  }

  while (v1 != 64);
  if (*(void *)(a1 + 16) - (v2 + 2LL * *(void *)(a1 + 8)) >= 0x7FFFFFFF) {
    return 0x7FFFFFFFLL;
  }
  else {
    return *(void *)(a1 + 16) - (v2 + 2LL * *(void *)(a1 + 8));
  }
}

uint64_t sub_1882449F0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48) >= a2)
  {
    uint64_t v6 = (void *)(a1 + 40);
    goto LABEL_7;
  }

  int v4 = *(void **)(a1 + 56);
  if (v4) {
    free(v4);
  }
  *(_BYTE *)(a1 + 24) = 0;
  uint64_t v5 = malloc(a2 << 9);
  *(void *)(a1 + 40) = 0LL;
  uint64_t v6 = (void *)(a1 + 40);
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  if (v5)
  {
    *(void *)(a1 + 48) = a2;
    *(void *)(a1 + 56) = v5;
LABEL_7:
    uint64_t result = 0LL;
    *uint64_t v6 = a2;
    return result;
  }

  return 12LL;
}

uint64_t sub_188244A60(io_object_t object, CFStringRef *a2)
{
  if (!a2) {
    return 22LL;
  }
  *a2 = 0LL;
  if (!object) {
    return 22LL;
  }
  if (!IOObjectConformsTo(object, "IOMedia")) {
    return 3758097090LL;
  }
  int v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(object, @"BSD Name", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  if (CFProperty)
  {
    uint64_t v6 = CFProperty;
    CFStringRef v7 = CFStringCreateWithFormat(v4, 0LL, @"/dev/%@", CFProperty);
    if (v7) {
      uint64_t v8 = 0LL;
    }
    else {
      uint64_t v8 = 4294962336LL;
    }
    *a2 = v7;
    CFRelease(v6);
  }

  else
  {
    uint64_t v8 = 0LL;
    *a2 = 0LL;
  }

  return v8;
}

uint64_t sub_188244B30(const void *a1, CFTypeRef *a2, _WORD *a3, void *a4)
{
  uint64_t v15 = 0LL;
  if (a2) {
    *a2 = 0LL;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (!a1) {
    return 22LL;
  }
  uint64_t v6 = 2LL;
  int v7 = getmntinfo(&v15, 2);
  if (v7 >= 1)
  {
    int v8 = v7;
    for (uint64_t i = v15; ; ++i)
    {
      uint64_t v10 = sub_188259D3C((uint64_t)i);
      if (v10)
      {
        uint64_t v11 = v10;
        if (CFEqual(v10, a1))
        {
          CFStringRef v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], i->f_mntonname, 0x8000100u);
          if (v12)
          {
            CFStringRef v13 = v12;
            if (a2) {
              *a2 = CFRetain(v12);
            }
            CFRelease(v11);
            uint64_t v6 = 0LL;
          }

          else
          {
            uint64_t v6 = 4294962336LL;
            CFStringRef v13 = v11;
          }

          CFRelease(v13);
          return v6;
        }

        CFRelease(v11);
      }

      if (!--v8) {
        return 2LL;
      }
    }
  }

  return v6;
}

void sub_188244C40(void *a1)
{
}

void sub_188244C64(_Unwind_Exception *a1)
{
}

void *sub_188244C78(uint64_t a1)
{
  *(void *)a1 = off_18A20C1A8;
  uint64_t v2 = *(void ***)(a1 + 904);
  if (v2) {
    sub_188266150(v2);
  }
  *(void *)(a1 + 904) = 0LL;
  sub_188244D14(a1);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 944));
  unint64_t v3 = *(void **)(a1 + 1008);
  if (v3) {
    free(v3);
  }
  uint64_t v4 = *(void *)(a1 + 368);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  uint64_t v5 = *(char **)(a1 + 376);
  if (v5)
  {
    DIDiskImageObjectRelease(v5);
    *(void *)(a1 + 376) = 0LL;
  }

  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 160));
  return sub_188244EB4((void *)a1);
}

void sub_188244CFC(_Unwind_Exception *a1)
{
}

void sub_188244D14(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 928);
  if (v2)
  {
    if (*(__int16 *)(a1 + 912) >= 1)
    {
      uint64_t v3 = 0LL;
      do
      {
        sub_188266150(*(void ***)(*(void *)(a1 + 928) + 8 * v3));
        *(void *)(*(void *)(a1 + 928) + 8 * v3++) = 0LL;
      }

      while (v3 < *(__int16 *)(a1 + 912));
      uint64_t v2 = *(void **)(a1 + 928);
    }

    free(v2);
  }

  *(void *)(a1 + 928) = 0LL;
  uint64_t v4 = *(const void **)(a1 + 936);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 936) = 0LL;
  }

  *(_DWORD *)(a1 + 912) = 0;
  *(_WORD *)(a1 + 916) = 0;
}

void sub_188244D90(void *a1)
{
}

void sub_188244DB4(_Unwind_Exception *a1)
{
}

uint64_t sub_188244DC8(uint64_t a1)
{
  *(void *)a1 = off_18A20D700;
  uint64_t v2 = *(void **)(a1 + 216);
  if (v2)
  {
    int v3 = *(_DWORD *)(a1 + 208);
    if (v3 >= 1)
    {
      for (uint64_t i = 0LL; i < v3; ++i)
      {
        uint64_t v5 = *(void *)(*(void *)(a1 + 216) + 8 * i);
        if (v5)
        {
          (*(void (**)(uint64_t))(*(void *)v5 + 8LL))(v5);
          int v3 = *(_DWORD *)(a1 + 208);
        }
      }

      uint64_t v2 = *(void **)(a1 + 216);
    }

    free(v2);
  }

  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 8));
  return a1;
}

void sub_188244E44(void *__p)
{
  *__p = &off_18A20D720;
  uint64_t v2 = (void *)__p[7];
  if (v2) {
    free(v2);
  }
  operator delete(__p);
}

void sub_188244E7C(void *a1)
{
}

void sub_188244EA0(_Unwind_Exception *a1)
{
}

void *sub_188244EB4(void *a1)
{
  *a1 = off_18A20B6C8;
  uint64_t v2 = (char *)a1[17];
  if (v2) {
    DIDiskImageObjectRelease(v2);
  }
  a1[17] = 0LL;
  int v3 = (const void *)a1[19];
  if (v3)
  {
    CFRelease(v3);
    a1[19] = 0LL;
  }

  return sub_18823B28C(a1);
}

void sub_188244F00(_Unwind_Exception *a1)
{
}

void sub_188244F18(void *a1)
{
}

void sub_188244F3C(_Unwind_Exception *a1)
{
}

uint64_t sub_188244F50(uint64_t a1)
{
  *(void *)a1 = off_18A20D0B0;
  if (sub_18823B050(a1)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 280LL))(a1, 1LL);
  }
  *(_OWORD *)(a1 + 744) = 0u;
  *(_OWORD *)(a1 + 760) = 0u;
  return sub_18824500C(a1);
}

void sub_188244FF4(_Unwind_Exception *a1)
{
}

void *sub_188245010(char **a1)
{
  *a1 = (char *)off_18A20C770;
  sub_18823ADA4(a1[25]);
  return sub_18823B1C4((uint64_t)a1);
}

void sub_1882450B0(_Unwind_Exception *a1)
{
}

uint64_t DIGetPluginPropertyDicts()
{
  return qword_18C703460;
}

uint64_t sub_1882450D8(const __CFURL *a1, CFDictionaryRef theDict)
{
  if ((sub_188239F2C(theDict, @"diskimage-class", @"CSparseDiskImage") & 0x80000000) != 0) {
    return 4294966296LL;
  }
  int Value = (const __CFString *)CFDictionaryGetValue(theDict, @"create-image-type");
  if (Value)
  {
    uint64_t v6 = Value;
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 == CFStringGetTypeID())
    {
      if (CFStringCompare(v6, @"SPARSE", 0LL)) {
        return 4294966296LL;
      }
      else {
        return 1000LL;
      }
    }

    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CFStringGetTypeID())
    {
      CFStringCompare(v6, @"SPARSEBUNDLE", 0LL);
      return 4294966296LL;
    }
  }

  uint64_t v10 = CFURLCopyPathExtension(a1);
  if (!v10) {
    return 1LL;
  }
  uint64_t v11 = v10;
  if (CFStringCompare(v10, @"sparseimage", 1uLL)) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = 1000LL;
  }
  CFRelease(v11);
  return v4;
}

uint64_t sub_188245208(const __CFURL *a1, CFDictionaryRef theDict)
{
  if ((sub_188239F2C(theDict, @"diskimage-class", @"CRawDiskImage") & 0x80000000) != 0) {
    return 4294966296LL;
  }
  int Value = (const __CFString *)CFDictionaryGetValue(theDict, @"create-image-type");
  if (Value && (uint64_t v6 = Value, v7 = CFGetTypeID(Value), v7 == CFStringGetTypeID()))
  {
    uint64_t v4 = 1000LL;
    if (CFStringCompare(v6, @"UDIF", 0LL))
    {
      if (CFStringCompare(v6, @"UDTO", 0LL)) {
        uint64_t v4 = 4294966296LL;
      }
      else {
        uint64_t v4 = 1000LL;
      }
    }

    if (CFStringCompare(v6, @"UNIV", 0LL) == kCFCompareEqualTo)
    {
      if (CFDictionaryGetValue(theDict, @"hybrid-image-source-array")) {
        return 9999LL;
      }
      else {
        return 4294966296LL;
      }
    }
  }

  else
  {
    CFTypeID v8 = CFURLCopyPathExtension(a1);
    if (v8)
    {
      uint64_t v9 = v8;
      if (CFStringCompare(v8, @"dmg", 1uLL) && CFStringCompare(v9, @"cdr", 1uLL)) {
        uint64_t v4 = 100LL;
      }
      else {
        uint64_t v4 = 1000LL;
      }
      CFRelease(v9);
    }

    else
    {
      return 100LL;
    }
  }

  return v4;
}

CFURLRef sub_188245378(CFURLRef url, const __CFString *a2, int a3)
{
  int v3 = url;
  if (url)
  {
    uint64_t v6 = CFURLCopyPathExtension(url);
    if (!v6) {
      return sub_18824D820(*MEMORY[0x189604DB0], v3, a2, a3);
    }
    CFTypeID v7 = v6;
    if (CFStringCompare(v6, a2, 1uLL))
    {
      int v3 = sub_18824D820(*MEMORY[0x189604DB0], v3, a2, a3);
    }

    else if (CFURLHasDirectoryPath(v3) == a3)
    {
      CFRetain(v3);
    }

    else
    {
      uint64_t v9 = *MEMORY[0x189604DB0];
      uint64_t v10 = CFURLCreateCopyDeletingPathExtension((CFAllocatorRef)*MEMORY[0x189604DB0], v3);
      if (v10)
      {
        uint64_t v11 = v10;
        int v3 = sub_18824D820(v9, v10, a2, a3);
        CFRelease(v11);
      }

      else
      {
        int v3 = 0LL;
      }
    }

    CFRelease(v7);
  }

  return v3;
}

const void *sub_188245490(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    int v3 = result;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1882454CC( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, void *a6, CFTypeRef *a7)
{
  CFTypeRef cf = 0LL;
  CFNumberRef v21 = 0LL;
  CFStringRef v19 = 0LL;
  if (a6) {
    *a6 = 0LL;
  }
  if (a7) {
    *a7 = 0LL;
  }
  uint64_t v14 = 22LL;
  if (a1 && a2 && a6)
  {
    if (sub_1882389A4())
    {
      CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
      if (Mutable)
      {
        uint64_t v16 = Mutable;
        unsigned int v17 = 2;
        while (1)
        {
          if (((a3 >> v17) & 1) != 0)
          {
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0LL;
            }

            uint64_t v14 = sub_188245698(v17, a1, a2, a4, a5, (uint64_t)&v19, (uint64_t)&cf);
            if (cf) {
              CFStringAppend(v16, (CFStringRef)cf);
            }
            if ((_DWORD)v14 != 110) {
              break;
            }
          }

          if (--v17 == -1)
          {
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0LL;
            }

            uint64_t v14 = sub_1882458EC(a1, a2, a4, a5, (uint64_t)&v21, (uint64_t)&cf);
            if (cf) {
              CFStringAppend(v16, (CFStringRef)cf);
            }
            if ((_DWORD)v14 && v21)
            {
              DIDiskImageObjectRelease(v21);
              CFNumberRef v21 = 0LL;
            }

            goto LABEL_29;
          }
        }

        if (!(_DWORD)v14) {
          CFNumberRef v21 = v19;
        }
LABEL_29:
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0LL;
        }

        *a6 = v21;
        if (a7)
        {
          *a7 = v16;
          if (!CFStringGetLength(v16) && *a7)
          {
            CFRelease(*a7);
            *a7 = 0LL;
          }
        }

        else
        {
          CFRelease(v16);
        }
      }

      else
      {
        return 999LL;
      }
    }

    else
    {
      return 119LL;
    }
  }

  return v14;
}

uint64_t sub_188245698( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1 > 2) {
    return 110LL;
  }
  CFTypeID v7 = off_18A20A830[a1];
  if (!v7[5]) {
    return 110LL;
  }
  unsigned int v14 = 0;
  int v15 = 0;
  uint64_t v23 = (int)a1;
  uint64_t v16 = (uint64_t *)(v7 + 12);
  unsigned int v17 = -1;
  do
  {
    uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))*(v16 - 9);
    if (v18)
    {
      int v19 = v18(a2, a3);
      if (v19 > v15)
      {
        int v15 = v19;
        unsigned int v17 = v14;
      }
    }

    ++v14;
    uint64_t v20 = *v16;
    v16 += 7;
  }

  while (v20);
  if ((v17 & 0x80000000) != 0) {
    return 110LL;
  }
  CFNumberRef v21 = off_18A20A830[v23][7 * v17 + 4];
  if (v21) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v21)(a2, a3, a4, a5, a6, a7);
  }
  else {
    return 78LL;
  }
}

uint64_t sub_1882457B8(int a1, CFDictionaryRef theDict)
{
  if ((sub_188239F2C(theDict, @"fileencoding-class", @"CEncryptedEncoding") & 0x80000000) != 0) {
    return 4294966296LL;
  }
  if (!theDict) {
    return 4294966296LL;
  }
  int Value = (const __CFString *)CFDictionaryGetValue(theDict, @"encryption-class");
  if (!Value) {
    return 4294966296LL;
  }
  uint64_t v5 = Value;
  if (sub_188238A78(Value, &v7))
  {
    if (v7) {
      return 1000LL;
    }
    else {
      return 4294966296LL;
    }
  }

  else
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v5))
    {
      if (CFStringCompare(v5, @"AES-128", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v5, @"CEncryptedEncoding", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v5, @"AES-256", 1uLL) == kCFCompareEqualTo)
      {
        return 1000LL;
      }

      if (CFStringCompare(v5, &stru_18A20E810, 1uLL)) {
        return 1LL;
      }
      else {
        return 4294966296LL;
      }
    }

    else
    {
      return 1LL;
    }
  }

uint64_t sub_1882458EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!off_18C7030C0) {
    return 110LL;
  }
  int v11 = 0;
  unsigned int v12 = 0;
  CFStringRef v13 = &off_18C7030F8;
  unsigned int v14 = -1;
  do
  {
    int v15 = (uint64_t (*)(uint64_t, uint64_t))*(v13 - 9);
    if (v15)
    {
      int v16 = v15(a1, a2);
      if (v16 > v11)
      {
        int v11 = v16;
        unsigned int v14 = v12;
      }
    }

    ++v12;
    unsigned int v17 = *v13;
    v13 += 7;
  }

  while (v17);
  if ((v14 & 0x80000000) != 0) {
    return 110LL;
  }
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_18C703098 + 7 * v14 + 4);
  if (v18) {
    return v18(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 78LL;
  }
}

uint64_t sub_1882459E8(const __CFURL *a1, CFDictionaryRef theDict)
{
  if ((sub_188239F2C(theDict, @"backingstore-class", @"CBSDBackingStore") & 0x80000000) != 0) {
    return 4294966296LL;
  }
  uint64_t v5 = CFURLCopyScheme(a1);
  if (!v5) {
    return 4294966296LL;
  }
  uint64_t v6 = v5;
  if (CFStringCompare(v5, @"file", 0LL) || CFURLHasDirectoryPath(a1))
  {
    uint64_t v4 = 4294966296LL;
  }

  else
  {
    uint64_t v4 = 100LL;
    if (theDict)
    {
      if (CFDictionaryGetValueIfPresent(theDict, @"file-type", 0LL)) {
        LODWORD(v4) = 200;
      }
      else {
        LODWORD(v4) = 100;
      }
      if (CFDictionaryGetValueIfPresent(theDict, @"file-creator", 0LL)) {
        uint64_t v4 = (v4 + 100);
      }
      else {
        uint64_t v4 = v4;
      }
    }
  }

  CFRelease(v6);
  return v4;
}

uint64_t sub_188245AE8(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (a1 && (int Value = (const __CFString *)CFDictionaryGetValue(a1, a2)) != 0LL) {
    return sub_188245B24(Value, a3);
  }
  else {
    return a3;
  }
}

uint64_t sub_188245B24(const __CFString *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unsigned int valuePtr = a2;
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFStringGetTypeID())
    {
      unsigned int v5 = sub_18823F52C(a1);
      if (v5) {
        return v5;
      }
      else {
        return v2;
      }
    }

    else
    {
      CFTypeID v6 = CFGetTypeID(a1);
      if (v6 == CFNumberGetTypeID())
      {
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, &valuePtr)) {
          return valuePtr;
        }
        else {
          return v2;
        }
      }
    }
  }

  return v2;
}

CFNumberRef sub_188245BBC(const char *a1, const __CFDictionary *a2)
{
  if (!a2) {
    return 0LL;
  }
  if (stat(a1, &v11) < 0) {
    return (const __CFNumber *)*__error();
  }
  uid_t st_uid = v11.st_uid;
  gid_t st_gid = v11.st_gid;
  CFTypeID v6 = (const __CFNumber *)sub_188245490(a2, @"uid");
  if (v6 && CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr)) {
    uid_t st_uid = valuePtr;
  }
  char v7 = (const __CFNumber *)sub_188245490(a2, @"gid");
  if (v7 && CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr)) {
    gid_t st_gid = valuePtr;
  }
  if ((st_uid != v11.st_uid || st_gid != v11.st_gid) && chown(a1, st_uid, st_gid) < 0) {
    return (const __CFNumber *)*__error();
  }
  uint64_t result = (const __CFNumber *)sub_188245490(a2, @"mode");
  if (result)
  {
    uint64_t result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    if ((_DWORD)result)
    {
      int v9 = valuePtr & 0xFFF;
      if (v9 == (v11.st_mode & 0xFFF) || (chmod(a1, v9) & 0x80000000) == 0) {
        return 0LL;
      }
      return (const __CFNumber *)*__error();
    }
  }

  return result;
}

uint64_t sub_188245CE4(const char *a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v8 = 0;
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (!a1) {
    return 22LL;
  }
  if (statfs(a1, &v12) < 0) {
    return *__error();
  }
  int v9 = 5;
  __int128 v10 = xmmword_18826CA90;
  int v11 = 0;
  uint64_t result = getattrlist(v12.f_mntonname, &v9, &v6, 0x24uLL, 0);
  if ((result & 0x80000000) != 0) {
    return *__error();
  }
  if ((BYTE8(v7) & 0x40) != 0 && a2 && (BYTE8(v6) & 0x40) != 0) {
    *a2 = 1;
  }
  if ((BYTE4(v7) & 0x40) != 0 && a3 && (BYTE4(v6) & 0x40) != 0) {
    *a3 = 1;
  }
  return result;
}

CFURLRef sub_188245DF0(char *__s)
{
  uint64_t v1 = __s;
  if (__s)
  {
    uint64_t v2 = strchr(__s, 58);
    int v3 = strstr(v1, "://");
    CFTypeID v4 = strchr(v1, 47);
    if (v2 && v4 && v3 && v2 < v4 && v2 == v3)
    {
      size_t v5 = strlen(v1);
      return CFURLCreateWithBytes((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)v1, v5, 0x8000100u, 0LL);
    }

    if (stat(v1, &v13)) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = (v13.st_mode & 0xF000) == 0x4000;
    }
    Boolean v8 = v7;
    size_t v9 = strlen(v1);
    __int128 v10 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)v1, v9, v8);
    uint64_t v1 = (const char *)v10;
    if (v10)
    {
      CFURLRef v11 = CFURLCopyAbsoluteURL(v10);
      if (v11)
      {
        CFURLRef v12 = v11;
        CFRelease(v1);
        return v12;
      }
    }
  }

  return (CFURLRef)v1;
}

void sub_188245F20(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  CFTypeID v4 = *(const void **)(a1 + 104);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 104) = cf;
}

uint64_t sub_188245F5C(_BYTE *a1, int a2)
{
  char v2 = a2;
  uint64_t result = 0LL;
  a1[128] = v2;
  return result;
}

BOOL sub_188245FA4(uint64_t a1)
{
  return (*(unsigned int (**)(uint64_t))(*(void *)a1 + 88LL))(a1) == 3;
}

uint64_t sub_188245FC8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

uint64_t sub_188245FD0(uint64_t a1, const void *a2, uint64_t a3)
{
  __dst[64] = *MEMORY[0x1895F89C0];
  memcpy(__dst, a2, 0x200uLL);
  __dst[37] = 0LL;
  __dst[38] = 0LL;
  *(int8x8_t *)&double v5 = sub_18823CBB0((uint64_t)__dst);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, double))(*(void *)a1 + 272LL))(a1, v5);
  if (!(_DWORD)v6)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, void *))(*(void *)a1 + 336LL))( a1,  a3,  512LL,  &v8,  __dst);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
  }

  return v6;
}

uint64_t sub_188246098(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  __int128 v10 = *(FILE **)(a1 + 328);
  if (v10)
  {
    pid_t v11 = getpid();
    fprintf(v10, "write\t%d\t%016qX\t%08X\n", v11, a2, a3);
    fflush(*(FILE **)(a1 + 328));
  }

  return sub_18824611C(a1, a2, a3, a4, a5);
}

uint64_t sub_18824611C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v31 = 0LL;
  __int128 v10 = (pthread_mutex_t *)(a1 + 216);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 216));
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 72LL))(a1))
  {
    uint64_t v11 = 1LL;
    goto LABEL_15;
  }

  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 568LL))(a1))
  {
    uint64_t v11 = 9LL;
    goto LABEL_15;
  }

  uint64_t v11 = 22LL;
  if (a4 && a5)
  {
    unint64_t v12 = a3 + a2;
    unint64_t v13 = *(void *)(a1 + 200);
    if (a3 + a2 <= v13 || ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 160LL))(a1) & 1) != 0)
    {
      uint64_t v14 = *(void *)(a1 + 208);
      if (!v14)
      {
        uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 696LL))( a1,  a2,  a3,  &v31,  a5);
        goto LABEL_35;
      }

      unint64_t v29 = v13;
      int v15 = sub_18823BC90(v14, a2, a3, &v30, 1);
      if (v15 < 1)
      {
        if (a3)
        {
          unint64_t v28 = a3 + a2;
          uint64_t v17 = 0LL;
          uint64_t v22 = a2;
LABEL_28:
          unint64_t v12 = v28;
          unint64_t v13 = v29;
          unint64_t v27 = v28 - v22;
          if (v28 <= v22)
          {
            uint64_t v11 = 0LL;
          }

          else
          {
            uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 720LL))(a1);
            if (!(_DWORD)v11) {
              uint64_t v31 = v17 + v27;
            }
          }
        }

        else
        {
          uint64_t v11 = 0LL;
        }

        goto LABEL_35;
      }

      int v16 = v15;
      unint64_t v28 = a3 + a2;
      uint64_t v17 = 0LL;
      uint64_t v18 = v30;
      int v19 = v15;
      do
      {
        memmove((void *)v18[2], (const void *)(a5 + *v18 - a2), v18[1]);
        v17 += v18[1];
        uint64_t v31 = v17;
        v18 += 3;
        --v19;
      }

      while (v19);
      if (v17 == a3)
      {
        uint64_t v11 = 0LL;
        goto LABEL_34;
      }

      uint64_t v23 = v30;
      uint64_t v22 = a2;
      while (1)
      {
        uint64_t v24 = *v23;
        uint64_t v25 = *v23 - v22;
        if (*v23 > v22)
        {
          uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 720LL))(a1);
          if ((_DWORD)v26)
          {
            uint64_t v11 = v26;
LABEL_34:
            unint64_t v12 = v28;
            unint64_t v13 = v29;
LABEL_35:
            if (v12 > v13 && !(_DWORD)v11)
            {
              uint64_t v11 = 0LL;
              if (v31 + a2 > *(void *)(a1 + 200)) {
                *(void *)(a1 + 200) = v31 + a2;
              }
            }

            goto LABEL_15;
          }

          v17 += v25;
          uint64_t v31 = v17;
          uint64_t v24 = *v23;
        }

        uint64_t v22 = v23[1] + v24;
        v23 += 3;
        if (!--v16) {
          goto LABEL_28;
        }
      }
    }

    pthread_mutex_unlock(v10);
    uint64_t v20 = 0LL;
    uint64_t v11 = 29LL;
    goto LABEL_17;
  }

uint64_t sub_1882463A4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

uint64_t sub_1882463AC(void *a1, uint64_t a2, size_t a3, char *a4)
{
  CFTypeID v4 = a4;
  size_t v5 = a3;
  uint64_t v6 = a2;
  size_t v8 = *(void *)(a1[26] + 8LL);
  if (v8 <= a3)
  {
    size_t v9 = a3 / v8 * v8;
    uint64_t result = (*(uint64_t (**)(void *, uint64_t, size_t, char *, char *))(*a1 + 696LL))(a1, a2, v9, v15, a4);
    if ((_DWORD)result) {
      return result;
    }
    v5 %= v8;
    v6 += v9;
    v4 += v9;
  }

  if (!v5) {
    return 0LL;
  }
  uint64_t v11 = sub_18823BEC8(a1[26]);
  uint64_t v12 = v11;
  if (!*(_BYTE *)(v11 + 8) || !*(_BYTE *)(v11 + 16) || (uint64_t result = sub_1882464CC(v11), !(_DWORD)result))
  {
    *(_BYTE *)(v12 + 8) = 0;
    *(_DWORD *)(v12 + 12) = 0;
    *(_BYTE *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0LL;
    *(void *)(v12 + 32) = 0LL;
    if (v5 + v6 <= a1[25]) {
      uint64_t v13 = v5 + v6 - 1;
    }
    else {
      uint64_t v13 = v8 + v6 - 1;
    }
    uint64_t v14 = sub_18823BF18(a1[26], v6, v13);
    memmove(*(void **)(v12 + 40), v4, v5);
    uint64_t result = 0LL;
    *(void *)(v12 + 24) = v6;
    *(void *)(v12 + 32) = v6 + v14 - 1;
    *(_BYTE *)(v12 + 8) = 1;
    *(_BYTE *)(v12 + 16) = 1;
  }

  return result;
}

uint64_t sub_1882464CC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 8) || !*(_BYTE *)(a1 + 16)) {
    return 0LL;
  }
  char v2 = *(uint64_t (**)(void))(a1 + 56);
  if (!v2) {
    return 999LL;
  }
  uint64_t v3 = *(void *)(a1 + 32) - *(void *)(a1 + 24) + 1LL;
  uint64_t result = v2(*(void *)(a1 + 48));
  if (!(_DWORD)result)
  {
    if (v3 == v5)
    {
      uint64_t result = 0LL;
      *(_BYTE *)(a1 + 16) = 0;
    }

    else
    {
      return 5LL;
    }
  }

  return result;
}

uint64_t sub_188246554(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 696LL))(a1);
}

uint64_t sub_188246560(uint64_t a1, off_t a2, size_t a3, ssize_t *a4, void *__buf)
{
  ssize_t v6 = pwrite(*(_DWORD *)(a1 + 320), __buf, a3, a2);
  if (v6 < 0) {
    return *__error();
  }
  ssize_t v7 = v6;
  uint64_t result = 0LL;
  *a4 = v7;
  return result;
}

uint64_t sub_1882465B8(uint64_t a1)
{
  return a1 + 128;
}

uint64_t DIUDIFFileAccessOpenFile_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  if (!v2) {
    return 4294967253LL;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 272LL))(v2);
  if ((_DWORD)v3) {
    return v3;
  }
  uint64_t v4 = (*(uint64_t (**)(void, uint64_t *))(**(void **)(a1 + 112) + 296LL))(*(void *)(a1 + 112), &v11);
  if ((_DWORD)v4)
  {
    uint64_t v9 = v4;
LABEL_9:
    (*(void (**)(void, void))(**(void **)(a1 + 112) + 280LL))(*(void *)(a1 + 112), 0LL);
    return v9;
  }

  int v5 = *(_DWORD *)(a1 + 644);
  if (v5 == 1)
  {
    uint64_t v6 = *(void *)(a1 + 112);
    ssize_t v7 = (void *)(a1 + 128);
    uint64_t v8 = v11 - 512;
  }

  else
  {
    if (v5) {
      return 0LL;
    }
    uint64_t v6 = *(void *)(a1 + 112);
    ssize_t v7 = (void *)(a1 + 128);
    uint64_t v8 = 0LL;
  }

  uint64_t v9 = sub_18823CADC(v6, v7, v8);
  if ((_DWORD)v9) {
    goto LABEL_9;
  }
  return v9;
}

uint64_t sub_188246688(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  if (!v2) {
    return 4294967253LL;
  }
  int v3 = *(_DWORD *)(a1 + 644);
  if (v3 != 1)
  {
    if (v3) {
      return 0LL;
    }
    uint64_t v4 = *(void *)(a1 + 160) + *(void *)(a1 + 152);
    if (v4 <= *(void *)(a1 + 352) + *(void *)(a1 + 344)) {
      uint64_t v4 = *(void *)(a1 + 352) + *(void *)(a1 + 344);
    }
    if (v4 <= *(void *)(a1 + 176) + *(void *)(a1 + 168)) {
      uint64_t v4 = *(void *)(a1 + 176) + *(void *)(a1 + 168);
    }
    uint64_t v14 = v4 & ~(v4 >> 63);
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 312LL))(v2);
    if (!(_DWORD)v5)
    {
      uint64_t v6 = (*(uint64_t (**)(void, uint64_t *))(**(void **)(a1 + 112) + 296LL))(*(void *)(a1 + 112), &v14);
      if (!(_DWORD)v6)
      {
        ssize_t v7 = (const void *)(a1 + 128);
        uint64_t v8 = *(void *)(a1 + 112);
        uint64_t v9 = 0LL;
        return sub_188245FD0(v8, v7, v9);
      }

      return v6;
    }

uint64_t sub_1882467D0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 200) == a2) {
    return 0LL;
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 568LL))(a1))
  {
    if ((ftruncate(*(_DWORD *)(a1 + 320), a2) & 0x80000000) == 0)
    {
      if (*(void *)(a1 + 200) > a2)
      {
        uint64_t v5 = *(void *)(a1 + 208);
        if (v5) {
          sub_18823C014(v5, a2);
        }
      }

      goto LABEL_9;
    }
  }

  else if ((truncate(*(const char **)(a1 + 296), a2) & 0x80000000) == 0)
  {
LABEL_9:
    uint64_t result = 0LL;
    *(void *)(a1 + 200) = a2;
    return result;
  }

  return *__error();
}

uint64_t DIUDIFFileAccessCloseFile_0(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 112);
  if (!v2) {
    return 4294967253LL;
  }
  if (*(_BYTE *)(a1 + 640))
  {
    (*(void (**)(void))(**(void **)(a1 + 120) + 72LL))(*(void *)(a1 + 120));
    (*(void (**)(void, _OWORD *))(**(void **)(a1 + 120) + 136LL))(*(void *)(a1 + 120), v10);
    __int128 v3 = v10[7];
    *(_OWORD *)(a1 + 304) = v10[6];
    *(_OWORD *)(a1 + 320) = v3;
    *(void *)(a1 + 336) = v11;
    __int128 v4 = v10[3];
    *(_OWORD *)(a1 + 240) = v10[2];
    *(_OWORD *)(a1 + 256) = v4;
    __int128 v5 = v10[5];
    *(_OWORD *)(a1 + 272) = v10[4];
    *(_OWORD *)(a1 + 288) = v5;
    __int128 v6 = v10[1];
    *(_OWORD *)(a1 + 208) = v10[0];
    *(_OWORD *)(a1 + 224) = v6;
    *(_BYTE *)(a1 + 640) = 0;
    uint64_t v7 = sub_188246688(a1);
    uint64_t v2 = *(void *)(a1 + 112);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v8 = (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 280LL))(v2, 0LL);
  if ((_DWORD)v8 && ((_DWORD)v7 == 5 || !(_DWORD)v7)) {
    return v8;
  }
  return v7;
}

uint64_t DIUDIFFileAccessGetResourceFile_0(uint64_t a1, char **a2)
{
  uint64_t v9 = 0LL;
  __int128 v4 = *(char **)(a1 + 664);
  if (v4)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = sub_18824D160(*(void *)(a1 + 112), a1 + 128, &v9);
    if (!(_DWORD)v5)
    {
      __int128 v6 = v9;
      *(void *)(a1 + 664) = v9;
      uint64_t v5 = (*(uint64_t (**)(char *))(*(void *)v6 + 48LL))(v6);
    }

    __int128 v4 = v9;
    if ((_DWORD)v5) {
      BOOL v7 = v9 == 0LL;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      DIDiskImageObjectRelease(v9);
      __int128 v4 = 0LL;
    }
  }

  if (a2) {
    *a2 = v4;
  }
  return v5;
}

uint64_t sub_1882469F8(void *a1)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = (void **)sub_18826612C(204LL);
  uint64_t result = sub_1882660D4();
  if (!(_DWORD)result) {
    void **v2 = 0x16D697368LL;
  }
  *a1 = v2;
  return result;
}

uint64_t sub_188246A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 168LL))( a1,  a2,  a3,  a4,  a6);
  if (!(_DWORD)v13)
  {
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 232LL))( a1,  a2,  a5 & 0xFFFFFFF7);
    if ((_DWORD)v13) {
      goto LABEL_3;
    }
    if (a7)
    {
      uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 328LL))( a1,  a2,  a4,  a6,  a7);
      if ((_DWORD)v13) {
        goto LABEL_3;
      }
    }

    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 176LL))(a1, a2);
    if ((_DWORD)v13) {
      goto LABEL_3;
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 184LL))(a1, a2);
    if ((_DWORD)v13) {
      goto LABEL_3;
    }
    if ((a5 & 8) == 0) {
      return 0LL;
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232LL))(a1, a2, a5);
    if ((_DWORD)v13
      || (uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 264LL))(a1, 32LL), (_DWORD)v13))
    {
LABEL_3:
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 248LL))(a1, a2);
    }
  }

  return v13;
}

uint64_t sub_188246B90(uint64_t a1, void *a2, unsigned int a3, int a4, const unsigned __int8 *a5)
{
  uint64_t v5 = 4294967246LL;
  if (a2 && *(void *)(a1 + 104) && *a2)
  {
    if (*(_BYTE *)(a1 + 114))
    {
      CFStringRef v10 = sub_18823EE58(a3);
      if (v10)
      {
        uint64_t v11 = (__CFString *)v10;
        int Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), v10);
        uint64_t v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        if (!Value)
        {
          CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
          if (!Mutable) {
            goto LABEL_19;
          }
          int Value = Mutable;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 104), v11, Mutable);
          CFRelease(Value);
        }

        int v15 = CFDictionaryCreateMutable(v13, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        if (v15)
        {
          int v16 = (__CFString *)v15;
          if (sub_18823F274((int)v15, v15, (uint64_t)a2)
            && sub_188246D24((__CFDictionary *)v16, @"ID", a4, 0)
            && sub_188246D24((__CFDictionary *)v16, @"Attributes", 2, 1)
            && sub_188246DBC(v16, a5))
          {
            CFArrayAppendValue((CFMutableArrayRef)Value, v16);
            uint64_t v5 = 0LL;
            *(_WORD *)(a1 + 112) |= 0x20u;
          }

          else
          {
            uint64_t v5 = 4294967246LL;
          }

          CFRelease(v11);
          goto LABEL_20;
        }

LABEL_19:
        uint64_t v5 = 4294962336LL;
        int v16 = v11;
LABEL_20:
        CFRelease(v16);
        return v5;
      }

      return 4294962336LL;
    }

    else
    {
      return 4294967242LL;
    }
  }

  return v5;
}

  if (a4) {
    *a4 = v17;
  }
  pthread_rwlock_unlock(v10);
  return v22;
}

  if (v3)
  {
LABEL_24:
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
    *((_BYTE *)a1 + 280) = 1;
    pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
  }

  if (v23)
  {
    CFRelease(v23);
    uint64_t v23 = 0LL;
  }

  if (existing) {
    IOObjectRelease(existing);
  }
  return Copy;
}

__CFDictionary *sub_188246D24(__CFDictionary *result, const void *a2, int a3, int a4)
{
  if (result)
  {
    BOOL v7 = result;
    CFDictionaryRemoveValue(result, a2);
    uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (a4) {
      uint64_t result = (__CFDictionary *)CFStringCreateWithFormat(v8, 0LL, @"0x%04hX", a3);
    }
    else {
      uint64_t result = (__CFDictionary *)CFStringCreateWithFormat(v8, 0LL, @"%hd", a3);
    }
    if (result)
    {
      uint64_t v9 = result;
      CFDictionarySetValue(v7, a2, result);
      CFRelease(v9);
      return (__CFDictionary *)1;
    }
  }

  return result;
}

__CFString *sub_188246DBC(__CFString *result, const unsigned __int8 *a2)
{
  if (result)
  {
    uint64_t v2 = (__CFDictionary *)result;
    if (!a2) {
      a2 = (const unsigned __int8 *)&unk_18826CFC7;
    }
    uint64_t result = (__CFString *)CFStringCreateWithPascalString((CFAllocatorRef)*MEMORY[0x189604DB0], a2, 0);
    if (result)
    {
      __int128 v3 = result;
      CFDictionarySetValue(v2, @"Name", result);
      CFRelease(v3);
      return (__CFString *)1;
    }
  }

  return result;
}

uint64_t sub_188246E28(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(void *)(a1 + 104)) {
    return 4294967097LL;
  }
  if (!a2) {
    return 4294967246LL;
  }
  if (!*(_BYTE *)(a1 + 114)) {
    return 4294967242LL;
  }
  __int128 v4 = sub_18823F3DC(a1, a2, 0LL);
  if (!v4) {
    return 4294967104LL;
  }
  return 4294967097LL;
}

uint64_t sub_188246EA4(uint64_t a1, uint64_t a2)
{
  uint64_t result = 4294967246LL;
  if (a2 && *(void *)(a1 + 104))
  {
    if (*(_BYTE *)(a1 + 114))
    {
      __int128 v4 = sub_18823F3DC(a1, a2, &v8);
      if (v4)
      {
        uint64_t v5 = v4;
        __int16 v7 = 0;
        if (sub_18823E874(v4, @"Attributes", &v7)
          && (int v6 = v7 | 2, v7 |= 2u, sub_188246D24(v5, @"Attributes", v6, 1)))
        {
          uint64_t result = 0LL;
          *(_WORD *)(a1 + 112) |= 0x20u;
        }

        else
        {
          return 4294967097LL;
        }
      }

      else
      {
        return 4294967104LL;
      }
    }

    else
    {
      return 4294967242LL;
    }
  }

  return result;
}

uint64_t sub_188246F58(uint64_t a1, const UInt8 **a2)
{
  if (!a2) {
    return 4294967246LL;
  }
  if (!*(void *)(a1 + 104)) {
    return 4294967246LL;
  }
  if (!*(_BYTE *)(a1 + 114)) {
    return 4294967242LL;
  }
  if ((*(_WORD *)(a1 + 112) & 0x80) != 0) {
    return 4294967098LL;
  }
  __int128 v3 = sub_18823F3DC(a1, (uint64_t)a2, &v5);
  if (v3) {
    return sub_188246FDC((uint64_t)v3, v3, v5, a2);
  }
  else {
    return 4294967104LL;
  }
}

uint64_t sub_188246FDC(uint64_t a1, const __CFDictionary *a2, uint64_t a3, const UInt8 **a4)
{
  uint64_t result = 4294967246LL;
  if (a2 && a4)
  {
    if (*a4)
    {
      __int16 v11 = 0;
      __int16 v10 = 0;
      __int16 v7 = v10;
      if ((v10 & 2) == 0) {
        return 0LL;
      }
      v10 &= ~2u;
      if (sub_188246D24(a2, @"Attributes", (__int16)(v7 & 0xFFFD), 1))
      {
        CFIndex v8 = sub_1882661C8((uint64_t)a4);
        sub_1882661D4();
        nullsub_4(a4);
        sub_1882660D4();
        CFDataRef v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], *a4, v8);
        sub_1882660D4();
        nullsub_4(a4);
        if (v9)
        {
          CFDictionarySetValue(a2, @"Data", v9);
          CFRelease(v9);
          return 0LL;
        }

        return 4294962336LL;
      }

      else
      {
        return 4294967097LL;
      }
    }

    else
    {
      return 4294967187LL;
    }
  }

  return result;
}

unsigned __int16 *sub_188247154(unsigned __int16 *result)
{
  *uint64_t result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  result[4] = bswap32(result[4]) >> 16;
  result[5] = bswap32(result[5]) >> 16;
  *((_DWORD *)result + 3) = bswap32(*((_DWORD *)result + 3));
  unsigned int v1 = result[8];
  if (v1 <= 0x3D)
  {
    if (!result[8]) {
      goto LABEL_6;
    }
  }

  else
  {
    unsigned int v1 = 61;
  }

  uint64_t v2 = v1;
  __int128 v3 = result + 12;
  do
  {
    *(_DWORD *)(v3 - 3) = bswap32(*(_DWORD *)(v3 - 3));
    *(v3 - 1) = bswap32((unsigned __int16)*(v3 - 1)) >> 16;
    *__int128 v3 = bswap32((unsigned __int16)*v3) >> 16;
    v3 += 4;
    --v2;
  }

  while (v2);
LABEL_6:
  result[8] = (_WORD)v1 << 8;
  return result;
}

uint64_t sub_18824720C(uint64_t a1)
{
  uint64_t v2 = *(const __CFDictionary **)(a1 + 104);
  if (!v2) {
    goto LABEL_16;
  }
  if (!*(_BYTE *)(a1 + 114)) {
    return 4294967242LL;
  }
  if ((*(_WORD *)(a1 + 112) & 0x80) != 0) {
    return 4294967098LL;
  }
  size_t Count = CFDictionaryGetCount(v2);
  if (!Count)
  {
LABEL_16:
    CFIndex v8 = 0LL;
    int v6 = 0LL;
    goto LABEL_17;
  }

  int64_t v4 = Count;
  unsigned int v5 = (const void **)calloc(Count, 8uLL);
  if (!v5) {
    return 4294967188LL;
  }
  int v6 = v5;
  __int16 v7 = (const void **)calloc(v4, 8uLL);
  if (!v7)
  {
    uint64_t v18 = 4294967188LL;
    goto LABEL_20;
  }

  CFIndex v8 = v7;
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v6, v7);
  if (v4 < 1)
  {
LABEL_17:
    uint64_t v18 = 0LL;
    *(_WORD *)(a1 + 112) &= ~0x20u;
    if (!v8) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  uint64_t v9 = 0LL;
  while (1)
  {
    uint64_t v10 = sub_18823F52C((const __CFString *)v6[v9]);
    __int16 v11 = (const __CFArray *)v8[v9];
    CFIndex v12 = CFArrayGetCount(v11);
    if (v12 >= 1) {
      break;
    }
LABEL_14:
    if (++v9 == v4) {
      goto LABEL_17;
    }
  }

  CFIndex v13 = v12;
  CFIndex v14 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v14);
    int v16 = sub_18823F1CC((int)ValueAtIndex, ValueAtIndex, &v20);
    if ((_DWORD)v16)
    {
      uint64_t v17 = sub_188246FDC((uint64_t)v16, ValueAtIndex, v10, v20);
      if ((_DWORD)v17) {
        break;
      }
    }

    if (v13 == ++v14) {
      goto LABEL_14;
    }
  }

  uint64_t v18 = v17;
LABEL_18:
  free(v8);
LABEL_19:
  if (v6) {
LABEL_20:
  }
    free(v6);
  return v18;
}

uint64_t sub_18824738C( uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, void, void), uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v20 = 0LL;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)a2 + 64LL))(a2, &v23);
  if (!(_DWORD)v8)
  {
    if (v23 < 1) {
      return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
    }
    LOWORD(v9) = 1;
    while (1)
    {
      uint64_t v10 = (*(uint64_t (**)(uint64_t, unsigned int *, void))(*(void *)a2 + 72LL))( a2,  &v21,  (__int16)v9);
      if ((_DWORD)v10) {
        return v10;
      }
      uint64_t v10 = (*(uint64_t (**)(uint64_t, void, __int16 *))(*(void *)a2 + 96LL))(a2, v21, &v22);
      if ((_DWORD)v10) {
        return v10;
      }
      if (v22 >= 1)
      {
        LOWORD(v11) = 1;
        do
        {
          uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 88LL))(a2);
          (*(void (**)(uint64_t, void))(*(void *)a2 + 80LL))(a2, 0LL);
          uint64_t v8 = (*(uint64_t (**)(uint64_t, void, void, void **))(*(void *)a2 + 112LL))( a2,  v21,  (__int16)v11,  &v20);
          (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 80LL))(a2, v12);
          if ((_DWORD)v8) {
            return v8;
          }
          uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, __int16 *, unsigned int *, _BYTE *, uint64_t *))(*(void *)a2 + 320LL))( a2,  v20,  &v19,  &v21,  v24,  &v17);
          if ((_DWORD)v10) {
            return v10;
          }
          if (!a3 || a3(a4, v21, v19))
          {
            uint64_t v10 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 136LL))(a2, v20);
            if ((_DWORD)v10) {
              return v10;
            }
            uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, __int16 *))(*(void *)a2 + 224LL))(a2, v20, &v18);
            if ((_DWORD)v10) {
              return v10;
            }
            uint64_t v10 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a2 + 248LL))(a2, v20);
            if ((_DWORD)v10) {
              return v10;
            }
            uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
            (*(void (**)(uint64_t, void))(*(void *)a1 + 80LL))(a1, 0LL);
            int v16 = 0LL;
            if (!(*(unsigned int (**)(uint64_t, void, void, void **))(*(void *)a1 + 120LL))( a1,  v21,  v19,  &v16)
              && v16)
            {
              (*(void (**)(uint64_t))(*(void *)a1 + 192LL))(a1);
              sub_188266150((void **)v16);
            }

            (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80LL))(a1, v13);
            uint64_t v14 = (*(uint64_t (**)(uint64_t, void *, void, void, void, _BYTE *, uint64_t))(*(void *)a1 + 312LL))( a1,  v20,  v21,  v19,  v18,  v24,  v17);
            if ((_DWORD)v14)
            {
              uint64_t v8 = v14;
              sub_188266150((void **)v20);
              return v8;
            }
          }

          int v11 = (__int16)(v11 + 1);
        }

        while (v11 <= v22);
      }

      int v9 = (__int16)(v9 + 1);
      if (v9 > v23) {
        return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
      }
    }
  }

  return v8;
}

uint64_t sub_188247668(uint64_t a1, _WORD *a2)
{
  if (!a2) {
    return 4294967246LL;
  }
  __int128 v3 = *(const __CFDictionary **)(a1 + 104);
  if (v3)
  {
    __int16 Count = CFDictionaryGetCount(v3);
    uint64_t result = 0LL;
  }

  else
  {
    __int16 Count = 0;
    uint64_t result = 4294967097LL;
  }

  *a2 = Count;
  return result;
}

uint64_t sub_1882476B4(CFDictionaryRef *a1, _DWORD *a2, int a3)
{
  if (!a2) {
    return 4294967246LL;
  }
  if (a1[13])
  {
    uint64_t result = (*((uint64_t (**)(CFDictionaryRef *, __int16 *))*a1 + 8))(a1, &v10);
    if ((_DWORD)result)
    {
      int v9 = 0;
    }

    else if (a3 < 1 || v10 < a3)
    {
      int v9 = 0;
      uint64_t result = 4294967246LL;
    }

    else
    {
      __int16 v7 = (const void **)calloc(v10, 8uLL);
      if (v7)
      {
        uint64_t v8 = v7;
        CFDictionaryGetKeysAndValues(a1[13], v7, 0LL);
        int v9 = sub_18823F52C((const __CFString *)v8[a3 - 1]);
        free(v8);
        uint64_t result = 0LL;
      }

      else
      {
        int v9 = 0;
        uint64_t result = 12LL;
      }
    }
  }

  else
  {
    int v9 = 0;
    uint64_t result = 4294967097LL;
  }

  *a2 = v9;
  return result;
}

uint64_t sub_18824779C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 115);
}

uint64_t sub_1882477A4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 115) = a2;
  return result;
}

uint64_t sub_1882477AC(uint64_t a1, unsigned int a2, int a3, void *a4)
{
  uint64_t v13 = 0LL;
  if (!a4) {
    return 4294967246LL;
  }
  int v6 = *(void **)(a1 + 104);
  if (!v6) {
    goto LABEL_13;
  }
  int v9 = (const __CFArray *)sub_18823EE00(a1, a2);
  if (!v9 || a3 < 1 || (__int16 v10 = v9, CFArrayGetCount(v9) < a3))
  {
    int v6 = 0LL;
    uint64_t result = 4294967104LL;
    goto LABEL_8;
  }

  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, a3 - 1LL);
  if (!ValueAtIndex)
  {
    int v6 = 0LL;
LABEL_13:
    uint64_t result = 4294967097LL;
    goto LABEL_8;
  }

  uint64_t result = sub_18823EFD0(a1, a2, ValueAtIndex, &v13);
  int v6 = v13;
LABEL_8:
  *a4 = v6;
  return result;
}

uint64_t sub_188247870(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 4294967246LL;
  }
  __int128 v3 = sub_18823F3DC(a1, a2, &v9);
  if (!v3) {
    return 4294967104LL;
  }
  int64_t v4 = v3;
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80LL))(a1, 1LL);
  uint64_t v6 = sub_18823EFD0(a1, v9, v4, &v8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80LL))(a1, v5);
  return v6;
}

uint64_t sub_188247918(uint64_t a1, uint64_t a2, _WORD *a3)
{
  __int16 v6 = 0;
  if (!a3) {
    return 4294967246LL;
  }
  if (*(void *)(a1 + 104))
  {
    if (a2)
    {
      int64_t v4 = sub_18823F3DC(a1, a2, 0LL);
      if (v4)
      {
        if ((sub_18823E874(v4, @"Attributes", &v6) & 1) != 0) {
          uint64_t result = 0LL;
        }
        else {
          uint64_t result = 4294967097LL;
        }
      }

      else
      {
        uint64_t result = 4294967104LL;
      }
    }

    else
    {
      uint64_t result = 4294967246LL;
    }
  }

  else
  {
    uint64_t result = 4294967097LL;
  }

  *a3 = v6;
  return result;
}

void sub_1882479A0(void *a1)
{
}

void sub_1882479C4(_Unwind_Exception *a1)
{
}

void *sub_1882479D8(void *a1)
{
  *a1 = off_18A20A870;
  uint64_t v2 = (const void *)a1[13];
  if (v2) {
    CFRelease(v2);
  }
  a1[13] = 0LL;
  __int128 v3 = (char *)a1[83];
  if (v3)
  {
    DIDiskImageObjectRelease(v3);
    a1[83] = 0LL;
  }

  int64_t v4 = (char *)a1[14];
  if (v4)
  {
    DIDiskImageObjectRelease(v4);
    a1[14] = 0LL;
  }

  uint64_t v5 = (char *)a1[15];
  if (v5)
  {
    DIDiskImageObjectRelease(v5);
    a1[15] = 0LL;
  }

  return sub_18823B28C(a1);
}

void sub_188247A44(_Unwind_Exception *a1)
{
}

void sub_188247A5C(void *a1)
{
}

void sub_188247A80(_Unwind_Exception *a1)
{
}

void *sub_188247A94(void *a1)
{
  *a1 = off_18A20B1E0;
  uint64_t v2 = (const void *)a1[14];
  if (v2) {
    CFRelease(v2);
  }
  return sub_1882405F8(a1);
}

void sub_188247ACC(_Unwind_Exception *a1)
{
}

uint64_t sub_188247AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_188245F5C((_BYTE *)a1, a2);
  if ((_DWORD)v4)
  {
LABEL_4:
    if (!(_DWORD)v4) {
      return v4;
    }
    goto LABEL_5;
  }

  uint64_t v5 = *(void *)(a1 + 200);
  if (v5)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 168LL))(v5, a2);
    goto LABEL_4;
  }

  uint64_t v4 = 999LL;
LABEL_5:
  if ((_DWORD)a2)
  {
    sub_188245F5C((_BYTE *)a1, 0);
    uint64_t v6 = *(void *)(a1 + 200);
    if (v6) {
      (*(void (**)(uint64_t, void))(*(void *)v6 + 168LL))(v6, 0LL);
    }
  }

  return v4;
}

uint64_t sub_188247B70(void *a1)
{
  uint64_t v1 = a1[32];
  if (v1 >= a1[34] && v1 >= a1[56]) {
    return sub_188247B98((uint64_t)a1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_188247B98(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 152LL))(result);
  }
  return result;
}

uint64_t sub_188247BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  if (a6) {
    *a6 = 0LL;
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 208LL))(a1);
}

uint64_t DIBackingStoreGetURLArray(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216LL))(a1);
}

uint64_t sub_188247BD0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 216LL))(result);
  }
  return result;
}

uint64_t sub_188247BE8(uint64_t a1)
{
  return *(void *)(a1 + 152);
}

uint64_t DIMediaKitCreateMKMediaRef(uint64_t a1, uint64_t a2, const __CFDictionary *a3, uint64_t *a4)
{
  uint64_t result = 22LL;
  unsigned int v13 = 22;
  if (a4)
  {
    *a4 = 0LL;
    if (a1)
    {
      __int16 v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      if (a3) {
        MutableCFStringRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, a3);
      }
      else {
        MutableCFStringRef Copy = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      }
      int v9 = MutableCopy;
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v7, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      int valuePtr = 16;
      CFNumberRef v11 = CFNumberCreate(v7, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(Mutable, @"attributes", v11);
      CFDictionarySetValue(Mutable, @"valid", v11);
      CFRelease(v11);
      CFDictionarySetValue(v9, @"Characteristics", Mutable);
      CFRelease(Mutable);
      *a4 = MKMediaCreate();
      CFRelease(v9);
      return v13;
    }
  }

  return result;
}

uint64_t sub_188247D34(uint64_t a1)
{
  if (!a1) {
    return 999LL;
  }
  DIDiskImageObjectRetain();
  return 0LL;
}

__CFDictionary *sub_188247D58(uint64_t a1, CFTypeRef cf1)
{
  CFMutableArrayRef Mutable = 0LL;
  if (a1 && cf1)
  {
    if (CFEqual(cf1, @"Geometry"))
    {
      uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      uint64_t valuePtr = DIDiskImageGetSectorCount(a1);
      CFNumberRef v6 = CFNumberCreate(v5, kCFNumberLongLongType, &valuePtr);
      if (v6)
      {
        CFNumberRef v7 = v6;
        CFDictionarySetValue(Mutable, @"Sector Count", v6);
        CFRelease(v7);
      }

      uint64_t valuePtr = 512LL;
      CFNumberRef v8 = CFNumberCreate(v5, kCFNumberLongLongType, &valuePtr);
      if (v8)
      {
        CFNumberRef v9 = v8;
        CFDictionarySetValue(Mutable, @"Block Size", v8);
        CFRelease(v9);
      }

      uint64_t valuePtr = 2048LL;
      CFNumberRef v10 = CFNumberCreate(v5, kCFNumberLongLongType, &valuePtr);
      if (v10)
      {
        CFNumberRef v11 = v10;
        CFDictionarySetValue(Mutable, @"Maximum Transfer Sector Count", v10);
        CFRelease(v11);
      }
    }

    else if (CFEqual(cf1, @"Writable"))
    {
      int v12 = DIDiskImageIsWriteEnabled(a1);
      uint64_t v13 = MEMORY[0x189604DE8];
      if (!v12) {
        uint64_t v13 = MEMORY[0x189604DE0];
      }
      return *(__CFDictionary **)v13;
    }

    else
    {
      return 0LL;
    }
  }

  return Mutable;
}

uint64_t DIDiskImageGetSectorCount(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
}

uint64_t DIDiskImageIsWriteEnabled(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288LL))(a1);
}

uint64_t sub_188247EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = DIDiskImageWriteSectors(a1);
  if (a5) {
    *a5 = v7;
  }
  return result;
}

uint64_t DIDiskImageWriteSectors(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
}

char *sub_188247F44(char *a1)
{
  if (a1) {
    return (char *)DIDiskImageObjectRelease(a1);
  }
  return a1;
}

uint64_t sub_188247F50(uint64_t a1, char a2)
{
  if ((*(_DWORD *)(a1 + 320) & 0x80000000) == 0)
  {
    uint64_t result = sub_188247FCC(a1);
    if ((_DWORD)result) {
      return result;
    }
    if (!*(_BYTE *)(a1 + 304)
      && ((a2 & 1) == 0 || fcntl(*(_DWORD *)(a1 + 320), 51, 1LL) == -1)
      && fsync(*(_DWORD *)(a1 + 320)) < 0)
    {
      return *__error();
    }
  }

  return 0LL;
}

uint64_t sub_188247FCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 208) + 16LL);
  if (v2)
  {
    while (!*(_BYTE *)(v2 + 8) || !*(_BYTE *)(v2 + 16))
    {
      uint64_t v2 = *(void *)(v2 + 72);
      if (!v2) {
        goto LABEL_7;
      }
    }

    uint64_t v3 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 704LL))(a1, *(void *)(a1 + 200));
    if (!(_DWORD)v3) {
      uint64_t v3 = sub_18823BFC8(*(void *)(a1 + 208), *(void *)(a1 + 200));
    }
  }

  else
  {
LABEL_7:
    uint64_t v3 = 0LL;
  }

  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 216));
  return v3;
}

uint64_t sub_18824807C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(void *))(*a1 + 496LL))(a1);
  uint64_t v7 = a1[94];
  if (v7 == a2) {
    return 0LL;
  }
  uint64_t v9 = v6;
  if (!v6) {
    return 999LL;
  }
  if (*((_BYTE *)a1 + 777))
  {
    uint64_t v10 = a1[32] + a2;
  }

  else if (*((_BYTE *)a1 + 776))
  {
    uint64_t v10 = a1[32] + a2 + 512;
  }

  else
  {
    uint64_t v10 = a1[32] + a2;
  }

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v9 + 320LL))(v9, v10, a3);
  if (!(_DWORD)result)
  {
    a1[94] = a2;
    a1[33] = a2;
    uint64_t result = (*(uint64_t (**)(void *, void *))(*a1 + 776LL))(a1, a1 + 29);
    if (!(_DWORD)result)
    {
      sub_18823CFC4((uint64_t)a1, a2);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_188248170(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 160LL))(result);
  }
  return result;
}

uint64_t sub_188248188(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 312LL))(a1);
}

uint64_t sub_188248194(_BYTE *a1, const void *a2)
{
  __dst[64] = *MEMORY[0x1895F89C0];
  if (!a1[777] && !a1[776]) {
    return 78LL;
  }
  uint64_t v4 = (*(uint64_t (**)(_BYTE *))(*(void *)a1 + 496LL))(a1);
  memcpy(__dst, a2, 0x200uLL);
  __dst[37] = 0LL;
  __dst[38] = 0LL;
  v5.n128_u64[0] = (unint64_t)sub_18823CBB0((uint64_t)__dst);
  uint64_t v6 = 0LL;
  if (!a1[777])
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t *, double))(*(void *)v4 + 296LL))(v4, &v11, v5.n128_f64[0]);
    if ((_DWORD)v7) {
      return v7;
    }
    uint64_t v6 = v11 - 512;
  }

  uint64_t v11 = v6;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, __n128))(*(void *)v4 + 272LL))(v4, v5);
  if ((_DWORD)v7) {
    return v7;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BYTE *, void *))(*(void *)v4 + 336LL))( v4,  v11,  512LL,  v10,  __dst);
  (*(void (**)(uint64_t, void))(*(void *)v4 + 280LL))(v4, 0LL);
  if (!(_DWORD)v8) {
    memcpy(a1 + 232, a2, 0x200uLL);
  }
  return v8;
}

uint64_t sub_1882482DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a5) {
    return 22LL;
  }
  unint64_t v7 = a1[94];
  if ((uint64_t)v7 >= a2)
  {
    uint64_t v11 = a3 + a2;
    if (a3 + a2 <= v7)
    {
LABEL_6:
      uint64_t v13 = (*(uint64_t (**)(void *))(*a1 + 496LL))(a1);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v13 + 336LL))( v13,  a1[93] + a2,  a3,  a4,  a5);
    }

    if ((*(unsigned int (**)(void *))(*a1 + 160LL))(a1))
    {
      uint64_t result = (*(uint64_t (**)(void *, uint64_t, void))(*a1 + 320LL))(a1, v11, 0LL);
      if ((_DWORD)result) {
        return result;
      }
      goto LABEL_6;
    }
  }

  return 29LL;
}

uint64_t sub_1882483B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  if (v3) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 472LL))(v3, a2);
  }
  else {
    return 78LL;
  }
}

uint64_t sub_1882483F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 472LL))(v1);
  }
  else {
    return 78LL;
  }
}

uint64_t sub_188248414(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2 != -536870288 && (_DWORD)a2 != -536870144 && (_DWORD)a2 != -536870272) {
    return 22LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  if (result)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 440LL))(v5, a2);
  }

  return result;
}

uint64_t sub_1882484A4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 440LL))(result);
  }
  return result;
}

uint64_t sub_1882484BC(uint64_t a1, int a2)
{
  if (a2 == -536870288 || a2 == -536870272 || a2 == -536870144) {
    return 0LL;
  }
  else {
    return 22LL;
  }
}

uint64_t sub_1882484EC(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (!a5) {
    return 22LL;
  }
  *a5 = 0LL;
  uint64_t v10 = 22LL;
  if (a3 && a4)
  {
    sub_18824269C(a1, a2, &v28, &v29, &v27, &v26, &v25, &__size, 0LL);
    if (v29 > -2147483640)
    {
      return 78LL;
    }

    else
    {
      uint64_t v11 = sub_18824289C(a1, v29);
      if (v11)
      {
        int v12 = v11;
        size_t v13 = __size;
        uint64_t v23 = 0LL;
        uint64_t v14 = v26;
        int v15 = malloc(__size);
        if (v15)
        {
          int v16 = v15;
          uint64_t v22 = v14;
          uint64_t v17 = v14 << 9;
          __int16 v18 = malloc(v14 << 9);
          if (v18)
          {
            uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
            uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, size_t, uint64_t *, void *))(*(void *)v19 + 328LL))( v19,  v25,  v13,  &v23,  v16);
            if ((_DWORD)v20)
            {
              uint64_t v10 = v20;
            }

            else
            {
              uint64_t v10 = (*(uint64_t (**)(void *, void *, void, void *, uint64_t))(*v12 + 48LL))( v12,  v16,  v23,  v18,  v17);
              if ((_DWORD)v10) {
                fprintf( (FILE *)*MEMORY[0x1895F89D0],  "readSectorChunk: decompressData failed with error %ld (inStartSector: %qd)\n",  v10,  a2);
              }
            }
          }

          else
          {
            uint64_t v10 = 12LL;
          }

          free(v16);
          if (v18 && (_DWORD)v10)
          {
            free(v18);
          }

          else if (v18)
          {
            *a3 = v27;
            *a4 = v22;
            *a5 = v18;
          }
        }

        else
        {
          return 12LL;
        }
      }

      else
      {
        return 999LL;
      }
    }
  }

  return v10;
}

uint64_t sub_1882486C0(char *a1, const __CFDictionary *a2)
{
  uint64_t valuePtr = 0LL;
  int v79 = -1;
  uint64_t v78 = -1LL;
  int v4 = sub_188239FB0(a2, @"inhibit-apm-final-gap", 0);
  if (v4) {
    uint64_t v5 = 35LL;
  }
  else {
    uint64_t v5 = 3LL;
  }
  int v6 = sub_188239FB0(a2, @"freeze-file-system", 0);
  uint64_t v7 = (*(uint64_t (**)(char *, uint64_t, void, void))(*(void *)a1 + 456LL))(a1, v5, 0LL, 0LL);
  if (!v7) {
    return 999LL;
  }
  uint64_t v8 = (const __CFDictionary *)v7;
  uint64_t v9 = (const __CFNumber *)sub_188245490(a2, @"content-new-length");
  if (v9)
  {
    CFNumberGetValue(v9, kCFNumberLongLongType, &valuePtr);
    int v10 = sub_188239FB0(a2, @"freeze-image-size", 0);
    uint64_t v11 = (const __CFNumber *)sub_188245490(a2, @"partition-ID");
    int v12 = v11;
    if (v11) {
      CFNumberGetValue(v11, kCFNumberSInt32Type, &v79);
    }
    size_t v13 = (const __CFNumber *)sub_188245490(a2, @"content-min-length");
    if (v13) {
      CFNumberGetValue(v13, kCFNumberLongLongType, &v78);
    }
    if (sub_1882490A4(v8, @"subcontent-list"))
    {
      if (v12)
      {
        uint64_t v14 = v78;
        uint64_t v102 = valuePtr;
        int v101 = v79;
        uint64_t v99 = 0LL;
        v100 = 0LL;
        v97 = 0LL;
        CFTypeRef v98 = 0LL;
        v96 = 0LL;
        if (v10) {
          unsigned int v15 = 7;
        }
        else {
          unsigned int v15 = 3;
        }
        if (v4) {
          uint64_t v16 = v15 | 0x20;
        }
        else {
          uint64_t v16 = v15;
        }
        uint64_t v17 = *(uint64_t (**(char *, uint64_t, void, void))(*(void *)a1 + 456LL))( a1,  v16,  0LL,  0LL);
        if (!v17)
        {
          uint64_t v26 = 0LL;
          uint64_t v27 = 999LL;
          goto LABEL_103;
        }

        uint64_t v93 = 1LL;
        uint64_t v18 = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1);
        uint64_t v94 = v18;
        uint64_t v95 = v18;
        uint64_t v19 = (const __CFNumber *)sub_188245490(v17, @"content-min-length");
        if (v19) {
          CFNumberGetValue(v19, kCFNumberLongLongType, &v95);
        }
        uint64_t v20 = (const __CFNumber *)sub_188245490(v17, @"content-max-length");
        if (v20) {
          CFNumberGetValue(v20, kCFNumberLongLongType, &v94);
        }
        unsigned int v21 = (const __CFNumber *)sub_188245490(v17, @"content-granularity");
        if (v21) {
          CFNumberGetValue(v21, kCFNumberLongLongType, &v93);
        }
        uint64_t v22 = (const __CFArray *)sub_1882490A4(v17, @"subcontent-list");
        uint64_t v23 = sub_18824911C(v17, @"content-hint");
        if (!v4 && v23 && CFEqual(v23, @"APM"))
        {
          uint64_t v24 = 10 / v93;
          if (10 / v93 * v93 != 10) {
            ++v24;
          }
          uint64_t v99 = v24 * v93;
        }

        if (v101 != -1)
        {
          uint64_t v25 = sub_188267A58(v22, v101);
          if (!v25)
          {
LABEL_33:
            uint64_t v26 = 0LL;
            uint64_t v27 = 22LL;
LABEL_103:
            if (v100)
            {
              DIDiskImageObjectRelease(v100);
              v100 = 0LL;
            }

            if (v17) {
              CFRelease(v17);
            }
            if (v98)
            {
              CFRelease(v98);
              CFTypeRef v98 = 0LL;
            }

            if (v26) {
              CFRelease(v26);
            }
            goto LABEL_111;
          }

LABEL_42:
          uint64_t v89 = 1LL;
          int v32 = (const __CFNumber *)sub_188245490(v25, @"postamble");
          if (v32) {
            CFNumberGetValue(v32, kCFNumberSInt64Type, &v99);
          }
          uint64_t v33 = (const __CFNumber *)sub_188245490(v25, @"content-length");
          CFNumberGetValue(v33, kCFNumberLongLongType, &v90);
          uint64_t v91 = v90;
          uint64_t v92 = v90;
          uint64_t v34 = (const __CFNumber *)sub_188245490(v25, @"content-start");
          CFNumberGetValue(v34, kCFNumberLongLongType, &v88);
          if (v14 < 0)
          {
            __int128 v36 = (const __CFNumber *)sub_188245490(v25, @"content-min-length");
            if (v36) {
              CFNumberGetValue(v36, kCFNumberLongLongType, &v92);
            }
          }

          else
          {
            uint64_t v92 = v14;
          }

          int v37 = (const __CFNumber *)sub_188245490(v25, @"content-max-length");
          if (v37) {
            CFNumberGetValue(v37, kCFNumberLongLongType, &v91);
          }
          int v38 = (const __CFNumber *)sub_188245490(v25, @"content-granularity");
          if (v38) {
            CFNumberGetValue(v38, kCFNumberLongLongType, &v89);
          }
          int Value = (const __CFBoolean *)CFDictionaryGetValue(v25, @"can-trigger-image-resize");
          if (Value) {
            BOOL v40 = CFBooleanGetValue(Value) != 0;
          }
          else {
            BOOL v40 = 0;
          }
          uint64_t v41 = v102;
          if (v102 == -1)
          {
            uint64_t v41 = v92;
            uint64_t v102 = v92;
          }

          if (v41 == 1)
          {
            uint64_t v41 = v91;
            uint64_t v102 = v91;
          }

          if (v14 == -1 && v41 < v92)
          {
            warnx("resize request %qd is below minimum size %qd allowed.");
            goto LABEL_33;
          }

          if (v41 > v91)
          {
            warnx("resize request %qd is above maximum size %qd allowed.");
            goto LABEL_33;
          }

          if (v41 <= v90)
          {
            uint64_t v42 = (v90 - v41) / v89 * v89;
            uint64_t v43 = v90 - v42;
          }

          else
          {
            uint64_t v42 = (v41 - v90) / v89 * v89;
            uint64_t v43 = v42 + v90;
          }

          uint64_t v102 = v43;
          if (!v42)
          {
            uint64_t v26 = 0LL;
            goto LABEL_83;
          }

          uint64_t v77 = v14;
          uint64_t MKMediaRef = sub_188249164(a1, v88, v90, &v100);
          if (!(_DWORD)MKMediaRef)
          {
            char v45 = !v40;
            if (v10) {
              char v45 = 1;
            }
            if ((v45 & 1) != 0)
            {
              int v50 = 0;
              uint64_t v75 = v18 - v88;
              uint64_t v47 = v18;
              goto LABEL_100;
            }

            uint64_t v46 = v99 + v102;
            uint64_t v47 = v99 + v102 + v88;
            uint64_t v48 = v47 - v18;
            if (v47 <= v18)
            {
              if (v99 + v102 + v88 < v18)
              {
                if ((v18 - v47) % v93) {
                  uint64_t v51 = (v18 - v47) / v93 + 1;
                }
                else {
                  uint64_t v51 = (v18 - v47) / v93;
                }
                uint64_t v47 = v18 - v51 * v93;
              }
            }

            else
            {
              if (v48 % v93) {
                uint64_t v49 = v48 / v93 + 1;
              }
              else {
                uint64_t v49 = v48 / v93;
              }
              uint64_t v47 = v18 + v49 * v93;
            }

            if (v47 <= v18)
            {
              uint64_t v75 = v99 + v102;
              int v50 = 0;
LABEL_100:
              v52 = (const __CFAllocator *)*MEMORY[0x189604DB0];
              uint64_t MKMediaRef = DIMediaKitCreateMKMediaRef((uint64_t)a1, *MEMORY[0x189604DB0], 0LL, (uint64_t *)&v98);
              if ((_DWORD)MKMediaRef) {
                goto LABEL_101;
              }
              int v74 = v50;
              allocator = v52;
              CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v52, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
              CFDictionarySetValue(Mutable, @"Include most", (const void *)*MEMORY[0x189604DE8]);
              uint64_t v26 = (const void *)MKCFReadMedia();
              CFRelease(Mutable);
              uint64_t v27 = v87;
              if (v87) {
                goto LABEL_103;
              }
              uint64_t v27 = sub_1882669B4((const __CFDictionary *)v26, &v96, &v97);
              if ((_DWORD)v27) {
                goto LABEL_103;
              }
              uint64_t v72 = v47;
              v55 = (const __CFArray *)sub_1882490A4((const __CFDictionary *)v26, @"Schemes");
              CFIndex Count = CFArrayGetCount(v55);
              if (Count >= 1)
              {
                CFIndex v57 = Count;
                for (CFIndex i = 0LL; i < v57; ++i)
                {
                  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v55, i);
                  v60 = sub_18824911C(ValueAtIndex, @"ID");
                  if (v60 && CFEqual(v60, @"ISO9660"))
                  {
                    CFArrayRemoveValueAtIndex(v55, i--);
                    --v57;
                  }
                }
              }

              CFIndex v61 = CFArrayGetCount(v97);
              if (v61 < 1)
              {
LABEL_130:
                if (v74)
                {
                  uint64_t v27 = sub_1882672D8((uint64_t)a1, v18, v4 == 0, 0);
                  if ((_DWORD)v27) {
                    goto LABEL_103;
                  }
                }
              }

              else
              {
                CFIndex v62 = v61;
                CFIndex v63 = 0LL;
                while (1)
                {
                  v64 = (const __CFDictionary *)sub_1882490E0(v97, v63);
                  if (v64)
                  {
                    v65 = v64;
                    if (sub_188266EE4(v64, (const void **)&number, &v86, &v85, &v83, &v82, 0LL))
                    {
                      if (CFNumberGetValue(number, kCFNumberIntType, &v81))
                      {
                        if (v81 == v101 && v83 == v88)
                        {
                          CFNumberRef v66 = CFNumberCreate(allocator, kCFNumberLongLongType, &v102);
                          if (v66) {
                            break;
                          }
                        }
                      }
                    }
                  }

                  if (v62 == ++v63) {
                    goto LABEL_130;
                  }
                }

                CFNumberRef v67 = v66;
                CFDictionarySetValue(v65, @"Size", v66);
                CFRelease(v67);
                uint64_t v68 = sub_1882677AC((uint64_t)v100, v102, v75, 1, v6 != 0, v77);
                if ((_DWORD)v68)
                {
                  uint64_t v27 = v68;
                  if (!v74) {
                    goto LABEL_103;
                  }
LABEL_137:
                  sub_1882672D8((uint64_t)a1, v18, v4 == 0, 0);
                  goto LABEL_103;
                }

                if (v100)
                {
                  DIDiskImageObjectRelease(v100);
                  v100 = 0LL;
                }

                uint64_t v69 = MKCFWriteMedia();
                if ((_DWORD)v69)
                {
                  uint64_t v27 = v69;
                  int v70 = sub_1882677AC((uint64_t)v100, v90, v18, 1, 0, -1LL);
                  char v71 = v74 ^ 1;
                  if (v70) {
                    char v71 = 1;
                  }
                  if ((v71 & 1) != 0) {
                    goto LABEL_103;
                  }
                  goto LABEL_137;
                }

                if (v72 < v18)
                {
                  uint64_t v27 = sub_1882672D8((uint64_t)a1, v72, v4 == 0, 0);
                  goto LABEL_103;
                }
              }

LABEL_83:
              uint64_t v27 = 0LL;
              goto LABEL_103;
            }

            uint64_t MKMediaRef = sub_1882672D8((uint64_t)a1, v47, v4 == 0, 0);
            if (!(_DWORD)MKMediaRef)
            {
              uint64_t v75 = v46;
              int v50 = 1;
              goto LABEL_100;
            }
          }

      v59 = v75 + 1;
      v60 += 10;
      v58 = *v72;
    }

    uint64_t v69 = v48;
    v65 = *((void *)v60 + 2);
    CFNumberRef v66 = *(void *)(v58 + 8) + *((void *)v60 + 1);
    while (1)
    {
      if (!v65)
      {
        valuePtr += *((void *)v60 + 2);
        int v32 = allocator;
        uint64_t v48 = v69;
        goto LABEL_83;
      }

      CFNumberRef v67 = v65 >= 512 ? 512LL : v65;
      int v81 = v67;
      uint64_t v68 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 48LL))(a1, v66);
      if ((_DWORD)v68) {
        break;
      }
      uint64_t v68 = (*(uint64_t (**)(char *, uint64_t, uint64_t, unint64_t *, void *))(*(void *)v84 + 336LL))( v84,  v66 << 9,  v81 << 9,  &v80,  v76);
      if ((_DWORD)v68) {
        break;
      }
      int v81 = v80 >> 9;
      v65 -= v80 >> 9;
      v49 += v80 >> 9;
      v66 += v80 >> 9;
      (*(void (**)(uint64_t, float))(*(void *)a1 + 344LL))(a1, (float)((float)v49 * 100.0) / v50);
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 352LL))(a1))
      {
        __int128 v36 = 111LL;
        goto LABEL_101;
      }
    }

    __int128 v36 = v68;
LABEL_101:
    CFMutableArrayRef Mutable = 0LL;
    valuePtr += *((void *)v60 + 2);
LABEL_102:
    LODWORD(v25) = 1;
    goto LABEL_103;
  }

      unsigned int v21 = v48;
      uint64_t v49 = 0LL;
      a4 = v92;
LABEL_182:
      if (value[0])
      {
        CFRelease(value[0]);
        value[0] = 0LL;
      }

      if (v49) {
        CFRelease(v49);
      }
LABEL_186:
      if ((_DWORD)v21) {
        goto LABEL_217;
      }
      if (v104)
      {
        DIDiskImageObjectRelease(v104);
        v104 = 0LL;
      }

      goto LABEL_189;
    }

    if (CFStringCompare(theString1, @"Windows_NTFS", 0LL) == kCFCompareEqualTo)
    {
      int v37 = sub_188249164(v97, v106, v105, &v104);
      if ((_DWORD)v37) {
        goto LABEL_216;
      }
      uint64_t v75 = v104;
      uint64_t v47 = v101;
      value[0] = 0LL;
      uint64_t v48 = DIMediaKitCreateMKMediaRef((uint64_t)v104, (uint64_t)allocator, 0LL, (uint64_t *)value);
      if (!(_DWORD)v48)
      {
        v59 = (*(uint64_t (**)(char *))(*(void *)v75 + 96LL))(v75);
        if (v98 > 6) {
          goto LABEL_179;
        }
        if (((1 << v98) & 0x2C) == 0)
        {
          if (((1 << v98) & 0x42) != 0)
          {
            uint64_t v76 = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
            CFDictionarySetValue(v76, @"Record On Bits", v88);
            unsigned int v87 = (const __CFDictionary *)MKCFCreateFSInfo();
            if (v76) {
              CFRelease(v76);
            }
            unsigned int v21 = v108;
            if (v108) {
              goto LABEL_211;
            }
            uint64_t v49 = v87;
            if (v87)
            {
              uint64_t v77 = (const __CFNumber *)sub_188245490(v87, @"Volume block size");
              if (v77
                && CFNumberGetValue(v77, kCFNumberSInt64Type, &v107)
                && (v107 >>= 9, (uint64_t v78 = (const __CFArray *)sub_1882490A4(v87, @"Data Runs")) != 0LL))
              {
                unsigned int v21 = sub_1882659A0(v47, v78, v59, v89, v92, 0, (unint64_t *)&valuePtr);
                if (!(_DWORD)v21)
                {
                  v59 -= valuePtr;
                  uint64_t valuePtr = v59;
                  unsigned int v21 = sub_1882657C8((uint64_t)v47, v59, 2, v92);
                  if (!(_DWORD)v21) {
                    v59 -= valuePtr;
                  }
                }
              }

              else
              {
                unsigned int v21 = 999LL;
              }

LABEL_101:
          uint64_t v27 = MKMediaRef;
          goto LABEL_102;
        }

        uint64_t v76 = v18;
        uint64_t v29 = v14;
        int v30 = (const __CFNumber *)sub_188245490(v17, @"partition-resize-id-hint");
        uint64_t v31 = (const __CFNumber *)sub_188245490(v17, @"partition-resize-hint");
        if (v30 && CFNumberGetValue(v30, kCFNumberSInt32Type, &v101))
        {
          uint64_t v25 = sub_188267A58(v22, v101);
          if (v25)
          {
LABEL_41:
            uint64_t v14 = v29;
            uint64_t v18 = v76;
            goto LABEL_42;
          }

          uint64_t v27 = 999LL;
        }

        else
        {
          if (v31 && CFNumberGetValue(v31, kCFNumberSInt32Type, &v92))
          {
            uint64_t v27 = 999LL;
            if (!v22) {
              goto LABEL_102;
            }
            CFIndex v35 = v92;
            if ((v92 & 0x80000000) != 0) {
              goto LABEL_102;
            }
            if (CFArrayGetCount(v22) <= v35) {
              goto LABEL_102;
            }
            uint64_t v25 = (const __CFDictionary *)sub_1882490E0(v22, v35);
            if (!v25) {
              goto LABEL_102;
            }
            goto LABEL_41;
          }

          if (!v10)
          {
            uint64_t MKMediaRef = sub_1882672D8((uint64_t)a1, v102, v4 == 0, 1);
            goto LABEL_101;
          }

          uint64_t v27 = 0LL;
        }

LABEL_102:
        uint64_t v26 = 0LL;
        goto LABEL_103;
      }

      uint64_t v28 = sub_1882672D8((uint64_t)a1, valuePtr, v4 == 0, 1);
    }

    else
    {
      uint64_t v28 = sub_1882677AC((uint64_t)a1, valuePtr, 0LL, 0, 0, -1LL);
    }

    uint64_t v27 = v28;
  }

  else
  {
    uint64_t v27 = 22LL;
  }

LABEL_111:
  CFRelease(v8);
  return v27;
}

      CFMutableArrayRef Mutable = v91;
LABEL_136:
      if (v62) {
        uint64_t v69 = v63 == 0;
      }
      else {
        uint64_t v69 = 0;
      }
      if (v69) {
        unsigned int v21 = 115LL;
      }
      else {
        unsigned int v21 = v63;
      }
      goto LABEL_182;
    }

    if (CFStringCompare(theString1, @"DOS_FAT_32", 0LL) == kCFCompareEqualTo
      || CFStringCompare(theString1, @"DOS_FAT_16", 0LL) == kCFCompareEqualTo
      || CFStringCompare(theString1, @"DOS_FAT_16_S", 0LL) == kCFCompareEqualTo
      || CFStringCompare(theString1, @"Windows_FAT_16", 0LL) == kCFCompareEqualTo
      || CFStringCompare(theString1, @"Windows_FAT_32", 0LL) == kCFCompareEqualTo
      || CFStringCompare(theString1, @"DOS_FAT_12", 0LL) == kCFCompareEqualTo)
    {
      int v37 = sub_188249164(v97, v106, v105, &v104);
      if ((_DWORD)v37) {
        goto LABEL_216;
      }
      uint64_t v46 = v104;
      uint64_t v47 = v101;
      value[0] = 0LL;
      uint64_t v48 = DIMediaKitCreateMKMediaRef((uint64_t)v104, (uint64_t)allocator, 0LL, (uint64_t *)value);
      if (!(_DWORD)v48)
      {
        v59 = (*(uint64_t (**)(char *))(*(void *)v46 + 96LL))(v46);
        if (v98 > 6) {
          goto LABEL_179;
        }
        if (((1 << v98) & 0x2C) == 0)
        {
          if (((1 << v98) & 0x42) != 0)
          {
            v85 = v35;
            v64 = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
            CFDictionarySetValue(v64, @"Record On Bits", v88);
            v65 = (const __CFDictionary *)MKCFCreateFSInfo();
            if (v64) {
              CFRelease(v64);
            }
            unsigned int v21 = v108;
            if (v108)
            {
              uint64_t v49 = v65;
            }

            else
            {
              uint64_t v49 = v65;
              if (v65)
              {
                int v70 = (const __CFNumber *)sub_188245490(v65, @"Volume block size");
                if (v70)
                {
                  CFIndex v35 = v85;
                  if (CFNumberGetValue(v70, kCFNumberSInt64Type, &v107))
                  {
                    v107 >>= 9;
                    char v71 = (const __CFArray *)sub_1882490A4(v49, @"Data Runs");
                    if (v71)
                    {
                      unsigned int v21 = sub_1882659A0(v47, v71, v59, v89, v92, 0, (unint64_t *)&valuePtr);
                      if (!(_DWORD)v21)
                      {
                        v59 -= valuePtr;
                        uint64_t valuePtr = v59;
                        unsigned int v21 = sub_1882657C8((uint64_t)v47, v59, 2, v92);
                        if (!(_DWORD)v21) {
                          v59 -= valuePtr;
                        }
                      }

                      goto LABEL_158;
                    }
                  }

uint64_t sub_188249068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = DIDiskImageReadSectors(a1);
  if (a5) {
    *a5 = v7;
  }
  return result;
}

const void *sub_1882490A4(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

const void *sub_1882490E0(const __CFArray *a1, CFIndex a2)
{
  uint64_t result = CFArrayGetValueAtIndex(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

const void *sub_18824911C(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_188249158(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
}

uint64_t sub_188249164(char *a1, uint64_t a2, uint64_t a3, char **a4)
{
  if (!a4) {
    return 22LL;
  }
  *a4 = 0LL;
  if (!a1) {
    return 22LL;
  }
  uint64_t v8 = (char *)operator new(0xB8uLL);
  sub_18823DDF4((uint64_t)v8);
  *(void *)uint64_t v8 = off_18A20BF48;
  *((void *)v8 + 22) = 0LL;
  if ((*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1) < a2
    || a3 && a3 + a2 > (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1))
  {
    DIDiskImageObjectRelease(v8);
    uint64_t v8 = 0LL;
    uint64_t result = 29LL;
  }

  else
  {
    *((void *)v8 + 22) = a1;
    DIDiskImageObjectRetain_0(a1);
    *((void *)v8 + 20) = a2;
    uint64_t v10 = (*(uint64_t (**)(char *))(*(void *)a1 + 288LL))(a1);
    (*(void (**)(char *, uint64_t))(*(void *)v8 + 520LL))(v8, v10);
    uint64_t v11 = (*(uint64_t (**)(char *))(*(void *)a1 + 296LL))(a1);
    (*(void (**)(char *, uint64_t))(*(void *)v8 + 512LL))(v8, v11);
    if (!a3) {
      a3 = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1) - a2;
    }
    *((void *)v8 + 21) = a3;
    uint64_t result = (*(uint64_t (**)(char *, const __CFString *))(*(void *)a1 + 24LL))(a1, @"thread-safe");
    if (result)
    {
      (*(void (**)(char *, const __CFString *, uint64_t))(*(void *)v8 + 32LL))( v8,  @"thread-safe",  result);
      uint64_t result = 0LL;
    }
  }

  *a4 = v8;
  return result;
}

void sub_1882492D0(_Unwind_Exception *a1)
{
}

uint64_t sub_1882492E4(uint64_t a1)
{
  return *(void *)(a1 + 168);
}

uint64_t sub_1882492EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 168);
  if (v3 >= a2 && a3 + a2 <= v3) {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 176) + 48LL))( *(void *)(a1 + 176),  *(void *)(a1 + 160) + a2);
  }
  else {
    return 22LL;
  }
}

void sub_188249324(void *a1)
{
}

void sub_188249348(_Unwind_Exception *a1)
{
}

void *sub_18824935C(void *a1)
{
  *a1 = off_18A20BF48;
  uint64_t v2 = (char *)a1[22];
  if (v2)
  {
    DIDiskImageObjectRelease(v2);
    a1[22] = 0LL;
  }

  return sub_188244EB4(a1);
}

void sub_188249398(_Unwind_Exception *a1)
{
}

uint64_t sub_1882493B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 168);
  if (v3 >= a2 && a3 + a2 <= v3) {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 176) + 64LL))( *(void *)(a1 + 176),  *(void *)(a1 + 160) + a2);
  }
  else {
    return 22LL;
  }
}

uint64_t sub_1882493E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 160) + a2;
  uint64_t result = 0LL;
  *(void *)(a1 + ++*(_DWORD *)(result + 168) = a2;
  return result;
}

__CFDictionary *sub_188249440(char *a1, uint64_t a2)
{
  int v34 = 0;
  uint64_t v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable) {
    goto LABEL_52;
  }
  allocator = v4;
  int v6 = 0LL;
  int v7 = 0;
  for (int i = 0; ; ++i)
  {
    if (i == 2)
    {
      uint64_t v9 = (char *)operator new(0x70uLL);
      sub_18824BE80((uint64_t)v9, a1);
      goto LABEL_9;
    }

    if (i != 1) {
      break;
    }
    uint64_t v9 = (char *)operator new(0x70uLL);
    sub_18824B800((uint64_t)v9, a1);
LABEL_9:
    int v34 = (*(uint64_t (**)(char *, uint64_t))(*(void *)v9 + 56LL))(v9, a2);
    if (v34 > v7)
    {
      uint64_t v10 = (*(uint64_t (**)(char *, int *, uint64_t, CFTypeRef *))(*(void *)v9 + 64LL))(v9, &v34, a2, &cf);
      if (v10)
      {
        uint64_t v11 = (const void *)v10;
        int v12 = v34;
        if (v34 > v7)
        {
          size_t v13 = (const void *)(*(uint64_t (**)(char *))(*(void *)v9 + 48LL))(v9);
          CFDictionarySetValue(Mutable, @"partition-scheme", v13);
          CFDictionarySetValue(Mutable, @"partitions", v11);
          if (v6) {
            CFRelease(v6);
          }
          int v6 = (void *)cf;
          CFTypeRef cf = 0LL;
          int v7 = v12;
        }

        CFRelease(v11);
      }

      if (cf) {
        CFRelease(cf);
      }
    }

    DIDiskImageObjectRelease(v9);
  }

  if (!i)
  {
    uint64_t v9 = (char *)operator new(0x70uLL);
    sub_1882499B4((uint64_t)v9, a1);
    goto LABEL_9;
  }

  int v32 = 0;
  CFTypeRef cf = 0LL;
  uint64_t v14 = (char *)operator new(0x70uLL);
  sub_18824C990((uint64_t)v14, a1);
  unsigned int v15 = (const void *)(*(uint64_t (**)(char *, int *, uint64_t, CFTypeRef *))(*(void *)v14 + 64LL))( v14,  &v32,  a2,  &cf);
  if (!v15) {
    goto LABEL_22;
  }
  if (v7)
  {
    uint64_t v16 = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    uint64_t v17 = (const void *)(*(uint64_t (**)(char *))(*(void *)v14 + 48LL))(v14);
    CFDictionarySetValue(v16, @"partition-scheme", v17);
    CFDictionarySetValue(v16, @"partitions", v15);
    sub_1882383F8(v16, (CFDictionaryRef)cf, 0LL);
    CFDictionarySetValue(Mutable, @"hybrid-data", v16);
    CFRelease(v16);
    if ((a2 & 4) != 0)
    {
      int Value = (const __CFArray *)CFDictionaryGetValue(Mutable, @"partitions");
      MutableCFStringRef Copy = CFArrayCreateMutableCopy(allocator, 0LL, Value);
      uint64_t v22 = CFDictionaryGetValue(Mutable, @"partition-scheme");
      unint64_t v23 = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1);
      sub_188263B4C(MutableCopy, (CFArrayRef)v15, v23, a2);
      uint64_t v24 = (*(uint64_t (**)(char *))(*(void *)v14 + 48LL))(v14);
      CFStringRef v25 = CFStringCreateWithFormat(allocator, 0LL, @"%@/%@", v22, v24);
      CFDictionarySetValue(Mutable, @"partition-scheme", v25);
      CFDictionarySetValue(Mutable, @"partitions", MutableCopy);
      CFRelease(MutableCopy);
      CFRelease(v25);
      if (v6) {
        uint64_t v26 = CFDictionaryCreateMutableCopy(allocator, 0LL, (CFDictionaryRef)v6);
      }
      else {
        uint64_t v26 = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      }
      uint64_t v18 = v26;
      CFDictionarySetValue(v26, @"burnable", (const void *)*MEMORY[0x189604DE8]);
      CFDictionarySetValue(v18, @"appendable", (const void *)*MEMORY[0x189604DE0]);
      if (v6) {
        CFRelease(v6);
      }
      v7 += v32;
    }

    else
    {
LABEL_22:
      uint64_t v18 = (__CFDictionary *)v6;
    }
  }

  else
  {
    uint64_t v19 = (const void *)(*(uint64_t (**)(char *))(*(void *)v14 + 48LL))(v14);
    CFDictionarySetValue(Mutable, @"partition-scheme", v19);
    CFDictionarySetValue(Mutable, @"partitions", v15);
    if (v6) {
      CFRelease(v6);
    }
    uint64_t v18 = (__CFDictionary *)cf;
    CFTypeRef cf = 0LL;
    int v7 = v32;
  }

  DIDiskImageObjectRelease(v14);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (v15) {
    CFRelease(v15);
  }
  if (!v7)
  {
    int v32 = 0;
    CFTypeRef cf = 0LL;
    uint64_t v27 = (char *)operator new(0x70uLL);
    sub_188252D64((uint64_t)v27, a1);
    uint64_t v28 = (const void *)(*(uint64_t (**)(char *, int *, uint64_t, CFTypeRef *))(*(void *)v27 + 64LL))( v27,  &v32,  a2,  &cf);
    if (v28)
    {
      uint64_t v29 = (const void *)(*(uint64_t (**)(char *))(*(void *)v27 + 48LL))(v27);
      CFDictionarySetValue(Mutable, @"partition-scheme", v29);
      CFDictionarySetValue(Mutable, @"partitions", v28);
      if (v18) {
        CFRelease(v18);
      }
      uint64_t v18 = (__CFDictionary *)cf;
      CFTypeRef cf = 0LL;
      int v7 = v32;
    }

    else
    {
      int v7 = 0;
    }

    DIDiskImageObjectRelease(v27);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }

    if (v28) {
      CFRelease(v28);
    }
  }

  if (v7 && v18)
  {
    sub_1882383F8(Mutable, v18, 0LL);
    CFRelease(v18);
    return Mutable;
  }

  if (v18) {
    CFRelease(v18);
  }
  if (!v7)
  {
LABEL_52:
    CFRelease(Mutable);
    return 0LL;
  }

  return Mutable;
}

void sub_188249980(_Unwind_Exception *a1)
{
}

void *sub_1882499B4(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_1882499D4(a1, a2);
  *uint64_t result = off_18A20D7E8;
  return result;
}

uint64_t sub_1882499D4(uint64_t a1, char *a2)
{
  uint64_t v4 = (void *)sub_18823A554(a1);
  void *v4 = off_18A20D8E8;
  v4[13] = 0LL;
  sub_188249A2C((uint64_t)v4, a2);
  return a1;
}

void sub_188249A14(_Unwind_Exception *a1)
{
}

char *sub_188249A2C(uint64_t a1, char *a2)
{
  if (a2) {
    DIDiskImageObjectRetain_0(a2);
  }
  uint64_t result = *(char **)(a1 + 104);
  if (result) {
    uint64_t result = (char *)sub_18823ADA4(result);
  }
  *(void *)(a1 + 104) = a2;
  return result;
}

uint64_t sub_188249A68(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = 0;
  uint64_t v2 = (const __CFArray *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, void))(*(void *)a1 + 64LL))( a1,  &v5,  a2,  0LL);
  if (v2)
  {
    uint64_t v3 = v2;
    v5 += 100;
    if (!CFArrayGetCount(v2)) {
      unsigned int v5 = 0;
    }
    CFRelease(v3);
  }

  return v5;
}

__CFArray *sub_188249AD0(uint64_t a1, uint64_t a2, char a3, __CFDictionary **a4)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uint64_t valuePtr = 512LL;
  if (a4) {
    *a4 = 0LL;
  }
  int v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v8 = malloc(0x200uLL);
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_59;
  }
  v8[30] = 0u;
  v8[31] = 0u;
  v8[28] = 0u;
  v8[29] = 0u;
  v8[26] = 0u;
  v8[27] = 0u;
  v8[24] = 0u;
  v8[25] = 0u;
  v8[22] = 0u;
  v8[23] = 0u;
  v8[20] = 0u;
  v8[21] = 0u;
  v8[18] = 0u;
  v8[19] = 0u;
  v8[16] = 0u;
  v8[17] = 0u;
  v8[14] = 0u;
  v8[15] = 0u;
  v8[12] = 0u;
  v8[13] = 0u;
  v8[10] = 0u;
  v8[11] = 0u;
  v8[8] = 0u;
  v8[9] = 0u;
  v8[6] = 0u;
  v8[7] = 0u;
  v8[4] = 0u;
  v8[5] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  *uint64_t v8 = 0u;
  v8[1] = 0u;
  theArray = CFArrayCreateMutable(v6, 0LL, MEMORY[0x189605228]);
  if (!theArray)
  {
LABEL_59:
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v9) {
      free(v9);
    }
    return 0LL;
  }

  allocator = v6;
  CFTypeRef cf = Mutable;
  uint64_t v39 = a4;
  LODWORD(v10) = 0;
  int v43 = 0;
  int v11 = 0;
  unsigned int v12 = 0;
  unsigned int v13 = 0;
  do
  {
    uint64_t v14 = sub_18824A018(a1);
    uint64_t v15 = v13;
    if ((*(unsigned int (**)(uint64_t, void, uint64_t, char *, _OWORD *))(*(void *)v14 + 48LL))( v14,  v13,  1LL,  v45,  v9))
    {
      goto LABEL_58;
    }

    memcpy(__dst, v9, sizeof(__dst));
    uint64_t v16 = 0LL;
    unsigned int v13 = 0;
    uint64_t v17 = (uint64_t)v9 + 446;
    do
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)a1 + 72LL))(a1, v17))
      {
        if (!v13)
        {
          uint64_t v20 = *(_DWORD *)(v17 + 8) + v12;
          uint64_t v21 = sub_18824A018(a1);
          else {
            unsigned int v13 = v20;
          }
        }
      }

      else if (((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 80LL))(a1, v17) & 1) != 0 {
             || !v16 && *(_DWORD *)((char *)v9 + 458) && (a3 & 8) != 0 && !*((_BYTE *)v9 + 450))
      }
      {
        if ((_DWORD)v15) {
          int v22 = v10;
        }
        else {
          int v22 = v16;
        }
        uint64_t v10 = (v22 + 1);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 96LL))( a1,  v17,  v10,  v15))
        {
          ++v11;
        }

        else
        {
          unint64_t v23 = sub_18824A0DC(a1, v17, v10, v15);
          if (v23)
          {
            uint64_t v24 = v23;
            ++v43;
            CFArrayAppendValue(theArray, v23);
            CFRelease(v24);
          }
        }
      }

      ++v16;
      v17 += 16LL;
    }

    while (v16 != 4);
    if ((a3 & 1) != 0)
    {
      if ((_DWORD)v15)
      {
        CFDataRef v25 = 0LL;
        uint64_t v26 = @"Extended Partition Record";
        uint64_t v27 = @"XPR";
      }

      else
      {
        CFDataRef v25 = CFDataCreate(allocator, __dst, 446LL);
        uint64_t v26 = @"Master Boot Record";
        uint64_t v27 = @"MBR";
      }

      uint64_t v28 = sub_18824A300(v15, 1LL, 0, v27, v26, 0LL, v18, v19);
      uint64_t v29 = v28;
      if (v28 && v25)
      {
        CFDictionarySetValue(v28, @"boot-code", v25);
      }

      else if (!v28)
      {
        goto LABEL_38;
      }

      CFArrayAppendValue(theArray, v29);
      CFRelease(v29);
LABEL_38:
      if (v25) {
        CFRelease(v25);
      }
    }

    if (!(_DWORD)v15)
    {
      LODWORD(v10) = 4;
      unsigned int v12 = v13;
    }
  }

  while (v13);
  if (!v43) {
    goto LABEL_58;
  }
  uint64_t v30 = sub_18824A018(a1);
  unint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)v30 + 96LL))(v30);
  if ((sub_18824B1C0(theArray, v31) & 1) != 0) {
    goto LABEL_58;
  }
  if ((a3 & 2) != 0)
  {
    uint64_t v32 = sub_18824A018(a1);
    unint64_t v33 = (*(uint64_t (**)(uint64_t))(*(void *)v32 + 96LL))(v32);
    sub_18824B54C(theArray, v33, 0);
  }

  else
  {
    sub_18824E538(theArray);
  }

  CFNumberRef v34 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(cf, @"block-size", v34);
  CFRelease(v34);
  CFDictionarySetValue(cf, @"burnable", (const void *)*MEMORY[0x189604DE0]);
  if (v11)
  {
    sub_18824A018(a1);
    CFIndex v35 = sub_18824A348();
    if (v35)
    {
      __int128 v36 = v35;
      if (CFDictionaryGetValue(v35, @"NTFS")
        || CFDictionaryGetValue(v36, @"HFS+")
        || CFDictionaryGetValue(v36, @"HFSX")
        || CFDictionaryGetValue(v36, @"ProDOS")
        || CFDictionaryGetValue(v36, @"NTFS")
        || CFDictionaryGetValue(v36, @"FAT12")
        || CFDictionaryGetValue(v36, @"FAT16"))
      {
        CFRelease(v36);
LABEL_58:
        CFRelease(theArray);
        CFMutableDictionaryRef Mutable = cf;
        goto LABEL_59;
      }

      int Value = CFDictionaryGetValue(v36, @"FAT32");
      CFRelease(v36);
      if (Value) {
        goto LABEL_58;
      }
    }
  }

  if (v39) {
    void *v39 = cf;
  }
  else {
    CFRelease(cf);
  }
  free(v9);
  return theArray;
}

uint64_t sub_18824A018(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

BOOL sub_18824A020(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 4);
  return v2 == 5 || v2 == 15 || v2 == 133;
}

BOOL sub_18824A040(uint64_t a1, uint64_t a2)
{
  return *(_BYTE *)(a2 + 4) && *(_DWORD *)(a2 + 12) != 0;
}

uint64_t sub_18824A060()
{
  return 0LL;
}

BOOL sub_18824A068(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4 = *(_DWORD *)(a2 + 8);
  if (!v4) {
    return 1LL;
  }
  uint64_t v6 = (v4 + a4);
  uint64_t v7 = *(unsigned int *)(a2 + 12);
  uint64_t v8 = sub_18824A018(a1);
  uint64_t v9 = sub_18824A018(a1);
  return v6 + v7 > (*(uint64_t (**)(uint64_t))(*(void *)v9 + 96LL))(v9);
}

__CFDictionary *sub_18824A0DC(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7 = *(unsigned int *)(a2 + 12);
  uint64_t v8 = (*(_DWORD *)(a2 + 8) + a4);
  uint64_t v9 = sub_18824A018(a1);
  if (v8 + v7 > (*(uint64_t (**)(uint64_t))(*(void *)v9 + 96LL))(v9))
  {
    uint64_t v10 = sub_18824A018(a1);
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 96LL))(v10) - v8;
  }

  uint64_t v11 = sub_18824A28C();
  unsigned int v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (v11)
  {
    unsigned int v13 = (const __CFDictionary *)v11;
    CFStringRef v14 = CFStringCreateWithFormat(v12, 0LL, @"0x%02hX", *(unsigned __int8 *)(a2 + 4));
    if (!v14) {
      return 0LL;
    }
    CFStringRef v15 = v14;
    int Value = (const __CFString *)CFDictionaryGetValue(v13, v14);
    if (Value)
    {
      CFStringRef v17 = Value;
      CFRetain(Value);
      CFRelease(v15);
      goto LABEL_9;
    }

    CFRelease(v15);
  }

  CFStringRef v17 = CFStringCreateWithFormat(v12, 0LL, @"Type %02hX", *(unsigned __int8 *)(a2 + 4));
LABEL_9:
  uint64_t v20 = sub_18824A300(v8, v7, a3, v17, 0LL, 0LL, v18, v19);
  if (!v20)
  {
    if (v17) {
      CFRelease(v17);
    }
    return 0LL;
  }

  uint64_t v21 = v20;
  uint64_t v28 = 0LL;
  int v22 = (char *)sub_18824A018(a1);
  int v23 = sub_188249164(v22, v8, v7, &v28);
  uint64_t v24 = v28;
  if (!v23 && v28)
  {
    CFDataRef v25 = sub_18824A348();
    if (v25)
    {
      uint64_t v26 = v25;
      CFDictionarySetValue(v21, @"partition-filesystems", v25);
      CFRelease(v26);
    }

    uint64_t v24 = v28;
  }

  if (v24) {
    DIDiskImageObjectRelease(v24);
  }
  if (v17) {
    CFRelease(v17);
  }
  return v21;
}

uint64_t sub_18824A28C()
{
  uint64_t result = qword_18C7034C8;
  if (!qword_18C7034C8)
  {
    uint64_t v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    int v2 = CFDataCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const UInt8 *)"<?xml version=1.0 encoding=UTF-8?>\n <!DOCTYPE plist PUBLIC -//Apple Computer//DTD PLIST 1.0//EN http://www.apple.com/DTDs/Pr opertyList-1.0.dtd>\n <plist version=1.0>\n <dict>\n \t<key>0x01</key>\n \t<string>DOS_FAT_12</string>\n \t<key>0x04</key>\n \t<string>DOS_FAT_16_S</string>\n \t<key>0x05</key>\n \t<string>DOS_Extended</string>\n \t<key>0x06</key>\n \t<string>DOS_FAT_16</string>\n \t<key>0x07</key>\n \t<string>Windows_NTFS</string>\n \t<key>0x0A</key>\n \t<string>Boot_Manager</string>\n \t<key>0x0B</key>\n \t<string>DOS_FAT_32</string>\n \t<key>0x0C</key>\n \t<string>Windows_FAT_32</string>\n \t<key>0x0E</key>\n \t<string>Windows_FAT_16</string>\n \t<key>0x0F</key>\n \t<string>Windows_Extended</string>\n \t<key>0x11</key>\n \t<string>DOS_FAT_12_Hidden</string>\n \t<key>0x14</key>\n \t<string>DOS_FAT_16_S_Hidden</string>\n \t<key>0x16</key>\n \t<string>DOS_FAT_16_Hidden</string>\n \t<key>0x17</key>\n \t<string>Windows_NTFS_Hidden</string>\n \t<key>0x1B</key>\n \t<string>DOS_FAT_32_Hidden</string>\n \t<key>0x1C</key>\n \t<string>Windows_FAT_32_Hidden</string>\n \t<key>0x1E</key>\n \t<string>Windows_FAT_16_Hidden</string>\n \t<key>0x63</key>\n \t<string>UNIX</string>\n \t<key>0x82</key>\n \t<string>Linux_Swap</string>\n \t<key>0x83</key>\n \t<string>Linux_Ext2FS</string>\n \t<key>0x84</key>\n \t<string>Hibernation</string>\n \t<key>0x85</key>\n"
                          "\t<string>Linux_Extended</string>\n"
                          "\t<key>0x86</key>\n"
                          "\t<string>Windows_FAT_16_FT</string>\n"
                          "\t<key>0x87</key>\n"
                          "\t<string>Windows_NTFS_FT</string>\n"
                          "\t<key>0xA5</key>\n"
                          "\t<string>FreeBSD</string>\n"
                          "\t<key>0xA6</key>\n"
                          "\t<string>OpenBSD</string>\n"
                          "\t<key>0xA7</key>\n"
                          "\t<string>NeXTSTEP</string>\n"
                          "\t<key>0xA8</key>\n"
                          "\t<string>Apple_UFS</string>\n"
                          "\t<key>0xA9</key>\n"
                          "\t<string>NetBSD</string>\n"
                          "\t<key>0xAB</key>\n"
                          "\t<string>Apple_Boot</string>\n"
                          "\t<key>0xAF</key>\n"
                          "\t<string>Apple_HFS</string>\n"
                          "\t<key>0xB7</key>\n"
                          "\t<string>BSDI</string>\n"
                          "\t<key>0xB8</key>\n"
                          "\t<string>BSDI_Swap</string>\n"
                          "\t<key>0xC6</key>\n"
                          "\t<string>Windows_FAT_16_FT_Corrupt</string>\n"
                          "\t<key>0xC7</key>\n"
                          "\t<string>Windows_NTFS_FT_Corrupt</string>\n"
                          "\t<key>0xEB</key>\n"
                          "\t<string>BeOS</string>\n"
                          "\t<key>0xF2</key>\n"
                          "\t<string>DOS_Secondary</string>\n"
                          "\t<key>0xFD</key>\n"
                          "\t<string>Linux_RAID</string>\n"
                          "</dict>\n"
                          "</plist>\n",
           2045LL);
    qword_18C7034C8 = (uint64_t)CFPropertyListCreateFromXMLData(v1, v2, 0LL, 0LL);
    CFRelease(v2);
    return qword_18C7034C8;
  }

  return result;
}

__CFDictionary *sub_18824A300( uint64_t a1, uint64_t a2, int a3, const void *a4, const void *a5, const void *a6, uint64_t a7, uint64_t a8)
{
  return sub_18824A320(a1, a2, a3, a4, a5, a6, a7, a8, 0LL);
}

__CFDictionary *sub_18824A320( uint64_t a1, uint64_t a2, int a3, const void *a4, const void *a5, const void *a6, uint64_t a7, uint64_t a8, const __CFString *a9)
{
  return sub_188263E70(a1, a2, a3, a4, a5, a6, &a9);
}

__CFDictionary *sub_18824A348()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v101 = *MEMORY[0x1895F89C0];
  uint64_t v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v3 = malloc(0x10000uLL);
  int v4 = v3;
  if (Mutable) {
    BOOL v5 = v3 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    goto LABEL_6;
  }
  DIDiskImageGetSectorCount(v0);
  *(_DWORD *)buffer = 0;
  cf[0] = 0LL;
  uint64_t v8 = 0LL;
  if (!DIMediaKitCreateMKMediaRef(v0, (uint64_t)v1, 0LL, (uint64_t *)cf))
  {
    uint64_t v27 = (const __CFDictionary *)MKCFCreateFSInfo();
    uint64_t v8 = v27;
    if (v27)
    {
      if (CFDictionaryGetCount(v27))
      {
        int Value = CFDictionaryGetValue(v8, @"Filesystem");
        if (Value)
        {
          if (CFEqual(Value, @"APFS"))
          {
            uint64_t v29 = (const __CFString *)CFDictionaryGetValue(v8, @"Volume name");
            if (v29) {
              uint64_t v30 = v29;
            }
            else {
              uint64_t v30 = @"Untitled";
            }
            CFDictionarySetValue(Mutable, @"APFS", v30);
          }
        }
      }
    }
  }

  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0LL;
  }

  if (v8) {
    CFRelease(v8);
  }
  if (!sub_18824B0F0(v0, (uint64_t)v4, 2LL, 1LL, (char *)cf))
  {
    if (LOWORD(cf[0]) == 11080 && (DWORD2(v98) & 0xFF010000) == 0 && bswap32(WORD1(cf[0])) >> 16 >= 4) {
      CFDictionarySetValue(Mutable, @"HFS+", &stru_18A20E810);
    }
    if (!sub_18824B0F0(v0, (uint64_t)v4, 2LL, 1LL, (char *)cf)
      && LOWORD(cf[0]) == 22600
      && (DWORD2(v98) & 0xFF010000) == 0
      && bswap32(WORD1(cf[0])) >> 16 >= 5)
    {
      CFDictionarySetValue(Mutable, @"HFSX", &stru_18A20E810);
    }
  }

  if (sub_18824B0F0(v0, (uint64_t)v4, 0LL, 4LL, (char *)cf)
    || LOBYTE(cf[0]) != 233 && (LOBYTE(cf[0]) != 235 || BYTE2(cf[0]) != 144))
  {
    goto LABEL_21;
  }

  unint64_t v31 = *(unsigned __int16 *)((char *)&cf[1] + 3);
  v9.i32[0] = *(unsigned __int16 *)((char *)&cf[1] + 3);
  uint8x8_t v32 = (uint8x8_t)vcnt_s8(v9);
  v32.i16[0] = vaddlv_u8(v32);
  if (v32.i32[0] > 1u) {
    goto LABEL_21;
  }
  uint64_t v33 = BYTE5(cf[1]);
  if (!BYTE5(cf[1]) || ((BYTE5(cf[1]) - 1) & BYTE5(cf[1])) != 0) {
    goto LABEL_21;
  }
  unint64_t v34 = (32LL * *(unsigned __int16 *)((char *)&v97 + 1)
  if (WORD3(v97)) {
    unsigned int v35 = WORD3(v97);
  }
  else {
    unsigned int v35 = DWORD1(v98);
  }
  else {
    uint64_t v36 = v98;
  }
  uint64_t v37 = (uint64_t)(v36 - (v34 + HIWORD(cf[1]) + v35 * (unint64_t)v97)) / BYTE5(cf[1]);
  int v38 = @"FAT32";
  if (v37 < 65525) {
    int v38 = @"FAT16";
  }
  uint64_t v39 = v37 >= 4085 ? (__CFString *)v38 : @"FAT12";
  key = v39;
  int v93 = (32LL * *(unsigned __int16 *)((char *)&v97 + 1)
  char v95 = 0;
  if ((_DWORD)v34)
  {
    int v40 = 0;
    uint64_t v41 = HIWORD(cf[1]) + v97 * WORD3(v97);
    unint64_t v42 = (unint64_t)*(unsigned __int16 *)((char *)&cf[1] + 3) >> 9;
    while (2)
    {
      uint64_t v43 = v41;
      unint64_t v44 = v42;
      int v45 = sub_18824B0F0(v0, (uint64_t)v4, ((v41 + v40) * v31) >> 9, v42, buffer);
      if (v45)
      {
        int v77 = v45;
      }

      else
      {
        uint64_t v46 = 0LL;
        do
        {
          if (buffer[v46] != 229)
          {
            if (!buffer[v46]) {
              goto LABEL_188;
            }
            int v47 = buffer[v46 + 11];
            if (v47 != 15 && (v47 & 8) != 0)
            {
              __strncat_chk();
              goto LABEL_188;
            }
          }

          v46 += 32LL;
        }

        while (v46 < v31);
        ++v40;
        uint64_t v41 = v43;
        unint64_t v42 = v44;
        if (v40 != v93) {
          continue;
        }
LABEL_188:
        int v77 = 0;
      }

      break;
    }
  }

  else
  {
    unsigned int v68 = BYTE5(cf[1]) * *(unsigned __int16 *)((char *)&cf[1] + 3);
    uint64_t v69 = (char *)malloc(v68);
    unsigned int v70 = HIDWORD(v98);
    if ((HIDWORD(v98) - 2) >= 0xFFFFFF4)
    {
LABEL_194:
      int v77 = 0;
    }

    else
    {
      uint64_t v71 = v68 >> 9;
      while (1)
      {
        int v72 = sub_18824B0F0( v0,  (uint64_t)v4,  ((HIWORD(cf[1]) + DWORD1(v98) * v97 + (v70 - 2LL) * v33) * v31) >> 9,  v71,  v69);
        if (v72) {
          break;
        }
        uint64_t v73 = 0LL;
        do
        {
          if (v69[v73] != 229)
          {
            if (!v69[v73]) {
              goto LABEL_194;
            }
            int v74 = v69[v73 + 11];
            if (v74 != 15 && (v74 & 8) != 0)
            {
              __strncat_chk();
              goto LABEL_194;
            }
          }

          v73 += 32LL;
        }

        while (v73 < v68);
        int v91 = 4 * v70;
        uint64_t v76 = 4 * v70 / v31;
        int v77 = sub_18824B0F0(v0, (uint64_t)v4, ((v76 + HIWORD(cf[1])) * v31) >> 9, v31 >> 9, v69);
        if (!v77)
        {
          unsigned int v70 = *(_DWORD *)&v69[(v91 - v76 * v31)] & 0xFFFFFFF;
          uint64_t v71 = v68 >> 9;
          if (v70 - 2 < 0xFFFFFF4) {
            continue;
          }
        }

        goto LABEL_195;
      }

      int v77 = v72;
    }

LABEL_195:
    free(v69);
  }

  if (v77) {
    goto LABEL_21;
  }
  __strlcpy_chk();
  if (cStr[0] == 5) {
    cStr[0] = -27;
  }
  uint64_t v79 = 0LL;
  while (1)
  {
    unsigned int v80 = cStr[v79];
    unsigned int v81 = (_DWORD)v79 ? 32 : 33;
    if ((_DWORD)++v79 == 12)
    {
      LODWORD(v79) = 1;
      break;
    }
  }

  if (v80) {
    BOOL v82 = 1;
  }
  else {
    BOOL v82 = (_DWORD)v79 == 0;
  }
  if (v82) {
    cStr[0] = 0;
  }
  for (int i = 10; i != -1; --i)
  {
    if (cStr[i] != 32) {
      break;
    }
    cStr[i] = 0;
  }

  uid_t v84 = getuid();
  if (getpwuid(v84))
  {
    __strlcpy_chk();
    __strlcat_chk();
    int v85 = open(buffer, 0, 0LL);
    if ((v85 & 0x80000000) == 0)
    {
      int v86 = v85;
      ssize_t v87 = read(v85, buffer, 0x400uLL);
      buffer[v87 & ~(v87 >> 63)] = 0;
      close(v86);
      int v88 = strtol(buffer, 0LL, 0);
      if (v88 <= 24)
      {
        CFStringEncoding v89 = 1056;
        switch(v88)
        {
          case 0:
            goto LABEL_243;
          case 1:
            goto LABEL_242;
          case 2:
            CFStringEncoding v89 = 1059;
            goto LABEL_242;
          case 3:
            CFStringEncoding v89 = 1058;
            goto LABEL_242;
          case 4:
            CFStringEncoding v89 = 1049;
            goto LABEL_242;
          case 5:
            CFStringEncoding v89 = 1047;
            goto LABEL_242;
          case 6:
            CFStringEncoding v89 = 1029;
            goto LABEL_242;
          case 7:
            goto LABEL_230;
          case 21:
            CFStringEncoding v89 = 1053;
            goto LABEL_242;
          default:
            goto LABEL_240;
        }
      }

      switch(v88)
      {
        case 25:
          CFStringEncoding v89 = 1057;
          break;
        case 26:
        case 27:
        case 28:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
          goto LABEL_240;
        case 29:
        case 36:
        case 38:
          CFStringEncoding v89 = 1042;
          break;
        case 35:
          CFStringEncoding v89 = 1044;
          break;
        case 37:
          CFStringEncoding v89 = 1046;
          break;
        default:
          if (v88 == 140)
          {
            CFStringEncoding v89 = 1049;
          }

          else if (v88 == 152)
          {
LABEL_230:
            CFStringEncoding v89 = 1043;
          }

          else
          {
LABEL_240:
            CFStringEncoding v89 = -1;
          }

          break;
      }

LABEL_242:
      CFStringRef v90 = CFStringCreateWithCString(0LL, cStr, v89);
      if (v90) {
        goto LABEL_244;
      }
    }
  }

LABEL_243:
  CFStringRef v90 = CFStringCreateWithCString(0LL, cStr, 0x410u);
  if (v90)
  {
LABEL_244:
    CFDictionarySetValue(Mutable, key, v90);
    CFRelease(v90);
    goto LABEL_21;
  }

  CFDictionarySetValue(Mutable, key, @"UNTITLED");
LABEL_21:
  cf[0] = 0LL;
  uint64_t v10 = 0LL;
  if (!DIMediaKitCreateMKMediaRef(v0, (uint64_t)v1, 0LL, (uint64_t *)cf))
  {
    uint64_t v49 = (const __CFDictionary *)MKCFCreateFSInfo();
    uint64_t v10 = v49;
    if (!*(_DWORD *)buffer)
    {
      if (v49)
      {
        if (CFDictionaryGetCount(v49))
        {
          int v50 = CFDictionaryGetValue(v10, @"Filesystem");
          if (v50)
          {
            if (CFEqual(v50, @"NTFS"))
            {
              uint64_t v51 = (const __CFString *)CFDictionaryGetValue(v10, @"Volume name");
              if (v51) {
                v52 = v51;
              }
              else {
                v52 = @"UNTITLED";
              }
              CFDictionarySetValue(Mutable, @"NTFS", v52);
              CFDictionaryRemoveValue(Mutable, @"FAT12");
              CFDictionaryRemoveValue(Mutable, @"FAT16");
              CFDictionaryRemoveValue(Mutable, @"FAT32");
            }
          }
        }
      }
    }
  }

  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0LL;
  }

  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (char *)calloc(0x800uLL, 0x10uLL);
  if (v11)
  {
    unsigned int v12 = v11;
    if (!sub_18824B0F0(v0, (uint64_t)v4, 64LL, 64LL, v11))
    {
      uint64_t v13 = 0LL;
      while (v12[v13] || *(_WORD *)&v12[v13 + 1] != 21326 || v12[v13 + 3] != 82)
      {
        v13 += 2048LL;
        if ((_DWORD)v13 == 0x8000) {
          goto LABEL_35;
        }
      }

      SectorCFIndex Count = DIDiskImageGetSectorCount(v0);
      uint64_t v64 = SectorCount - 256;
      if (SectorCount >= 256)
      {
        unint64_t v65 = SectorCount;
        if (sub_1882536BC(v0, (uint64_t)v4, 512LL, 256LL, (char *)cf)
          || sub_1882536BC(v0, (uint64_t)v4, 512LL, v64, (char *)cf)
          || sub_1882536BC(v0, (uint64_t)v4, 512LL, v65 - 1, (char *)cf)
          || v65 >= 0x400
          && (sub_1882536BC(v0, (uint64_t)v4, 2048LL, 256LL, (char *)cf)
           || (unint64_t v78 = v65 >> 2, sub_1882536BC(v0, (uint64_t)v4, 2048LL, v78 - 256, (char *)cf))
           || sub_1882536BC(v0, (uint64_t)v4, 2048LL, v78 - 1, (char *)cf)))
        {
          CFStringRef v66 = CFStringCreateWithCString(v1, (const char *)cf, 0x8000100u);
          if (v66) {
            CFNumberRef v67 = v66;
          }
          else {
            CFNumberRef v67 = &stru_18A20E810;
          }
          CFDictionarySetValue(Mutable, @"UDF", v67);
          CFRelease(v67);
        }
      }
    }

LABEL_35:
    free(v12);
  }

  __int128 v98 = 0u;
  __int128 v99 = 0u;
  *(_OWORD *)CFTypeRef cf = 0u;
  __int128 v97 = 0u;
  CFStringRef v15 = (char *)malloc(0x800uLL);
  if (!v15) {
    goto LABEL_138;
  }
  uint64_t v16 = v15;
  CFStringRef v17 = v16 + 40;
  unint64_t v18 = 16LL;
  while (*(_DWORD *)(v16 + 1) == 808469571 && v16[5] == 49)
  {
    int v20 = *v16;
    if (v20 == 1)
    {
      v16[120] = 0;
      __int128 v21 = *(_OWORD *)(v16 + 56);
      *(_OWORD *)CFTypeRef cf = *v17;
      __int128 v97 = v21;
      LOBYTE(v98) = 0;
      goto LABEL_49;
    }

    if (v20 != 2)
    {
      if (v20 == 255) {
        goto LABEL_133;
      }
LABEL_49:
      if (v18 > 0x72) {
        goto LABEL_133;
      }
      goto LABEL_71;
    }

    if ((*((_WORD *)v16 + 44) != 12069 || v16[90] != 64)
      && (*((_WORD *)v16 + 44) != 12069 || v16[90] != 67)
      && (*((_WORD *)v16 + 44) != 12069 || v16[90] != 69))
    {
      goto LABEL_49;
    }

    for (uint64_t j = 0LL; j != 16; ++j)
    {
      if (!*((_WORD *)v17 + j)) {
        break;
      }
      *((_WORD *)v17 + j) = __rev16(*((unsigned __int16 *)v17 + j));
    }

    uint64_t v26 = CFStringCreateWithCharacters(v1, (const UniChar *)v16 + 20, j);
    if (CFStringGetCString(v26, buffer, 32LL, 0x8000100u))
    {
      strlen(buffer);
      __memmove_chk();
    }

    CFRelease(v26);
    if (v18 > 0x72 || LOBYTE(cf[0])) {
      goto LABEL_133;
    }
LABEL_71:
    ++v18;
  }

  if (!LOBYTE(cf[0])) {
    goto LABEL_137;
  }
LABEL_133:
  CFStringRef v53 = CFStringCreateWithCString(v1, (const char *)cf, 0x8000100u);
  if (v53) {
    v54 = v53;
  }
  else {
    v54 = &stru_18A20E810;
  }
  CFDictionarySetValue(Mutable, @"ISO9660", v54);
  CFRelease(v54);
LABEL_137:
  free(v16);
LABEL_138:
  if (!sub_18824B0F0(v0, (uint64_t)v4, 2LL, 1LL, (char *)cf)
    && !(LOBYTE(cf[0]) | BYTE1(cf[0]))
    && (~BYTE4(cf[0]) & 0xF0) == 0
    && (BYTE4(cf[0]) & 0xF) != 0)
  {
    uint64_t v55 = BYTE4(cf[0]) & 0xF;
    while (1)
    {
      int v56 = *((unsigned __int8 *)cf + v55 + 4);
      unsigned int v57 = (v56 - 65);
      BOOL v58 = v57 < 0x1A;
      if (!--v55) {
        break;
      }
      BOOL v59 = v57 >= 0x1A && (v56 - 48) >= 0xAu;
      if (!(_WORD)v55)
      {
        BOOL v58 = 1;
        break;
      }
    }

    if (v58 && BYTE3(v98) == 39 && BYTE4(v98) == 13)
    {
      CFStringRef v61 = CFStringCreateWithPascalString(v1, (ConstStr255Param)cf + 4, 0x600u);
      if (v61) {
        CFIndex v62 = v61;
      }
      else {
        CFIndex v62 = &stru_18A20E810;
      }
      CFDictionarySetValue(Mutable, @"ProDOS", v62);
      CFRelease(v62);
    }
  }

  if (v19) {
    CFRelease(v19);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v18) {
    CFRelease(v18);
  }
  return v24;
}

LABEL_6:
  if (Mutable)
  {
LABEL_9:
    if (!CFDictionaryGetCount(Mutable))
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0LL;
    }
  }

  if (v4) {
    free(v4);
  }
  return Mutable;
}

  CFRelease(cf);
  CFMutableDictionaryRef Mutable = theDict;
LABEL_7:
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v11) {
    free(v11);
  }
  return 0LL;
}

uint64_t sub_18824B0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *__dst)
{
  if (!a4) {
    return 0LL;
  }
  uint64_t v6 = a4;
  uint64_t v10 = __dst;
  while (1)
  {
    if (a3 < 128)
    {
      uint64_t v13 = v6 << 9;
      memmove(__dst, (const void *)(a2 + (a3 << 9)), v6 << 9);
      uint64_t v14 = v6;
      uint64_t v12 = v6;
      goto LABEL_8;
    }

    DIDiskImageGetSectorCount(a1);
    uint64_t result = DIDiskImageReadSectors(a1);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v12 = v14;
    if (!v14) {
      return 999LL;
    }
    uint64_t v13 = v14 << 9;
LABEL_8:
    v10 += v13;
    a3 += v12;
    v6 -= v12;
    if (!v6) {
      return 0LL;
    }
  }

uint64_t sub_18824B1C0(CFArrayRef theArray, unint64_t a2)
{
  MutableCFStringRef Copy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theArray);
  CFIndex Count = CFArrayGetCount(MutableCopy);
  v14.length = CFArrayGetCount(MutableCopy);
  v14.location = 0LL;
  CFArraySortValues(MutableCopy, v14, (CFComparatorFunction)sub_18824B2DC, 0LL);
  if (Count < 1)
  {
LABEL_10:
    uint64_t v10 = 0LL;
  }

  else
  {
    unint64_t v5 = 0LL;
    CFIndex v6 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, v6);
      if (!ValueAtIndex) {
        break;
      }
      uint64_t v8 = ValueAtIndex;
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      unint64_t v5 = v12 + v13;
      if (Count == ++v6)
      {
        if (v5 <= a2) {
          goto LABEL_10;
        }
        break;
      }
    }

    uint64_t v10 = 1LL;
  }

  CFRelease(MutableCopy);
  return v10;
}

CFDictionaryRef sub_18824B2DC(const __CFDictionary *result, const void *a2)
{
  CFTypeRef cf = 0LL;
  value = 0LL;
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 != CFDictionaryGetTypeID()
      || !CFDictionaryGetValueIfPresent(v3, @"partition-start", (const void **)&value))
    {
      return 0LL;
    }

    CFTypeID v5 = CFGetTypeID(value);
    CFTypeID TypeID = CFNumberGetTypeID();
    uint64_t result = 0LL;
    if (a2 && v5 == TypeID)
    {
      CFTypeID v7 = CFGetTypeID(a2);
      if (v7 == CFDictionaryGetTypeID())
      {
        if (CFDictionaryGetValueIfPresent((CFDictionaryRef)a2, @"partition-start", &cf))
        {
          CFTypeID v8 = CFGetTypeID(cf);
          if (v8 == CFNumberGetTypeID()) {
            return (const __CFDictionary *)CFNumberCompare((CFNumberRef)value, (CFNumberRef)cf, 0LL);
          }
        }
      }

      return 0LL;
    }
  }

  return result;
}

uint64_t sub_18824B3C0(CFDictionaryRef theDict, void *a2, void *a3, _DWORD *a4, uint64_t *a5, uint64_t *a6)
{
  if (a2)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"partition-start");
    if (!result) {
      return result;
    }
    unint64_t v13 = (const __CFNumber *)result;
    CFTypeID v14 = CFGetTypeID((CFTypeRef)result);
    if (v14 != CFNumberGetTypeID()) {
      return 0LL;
    }
    uint64_t result = CFNumberGetValue(v13, kCFNumberLongLongType, a2);
    if (!(_DWORD)result) {
      return result;
    }
  }

  if (a3)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"partition-length");
    if (!result) {
      return result;
    }
    CFStringRef v15 = (const __CFNumber *)result;
    CFTypeID v16 = CFGetTypeID((CFTypeRef)result);
    if (v16 != CFNumberGetTypeID()) {
      return 0LL;
    }
    uint64_t result = CFNumberGetValue(v15, kCFNumberLongLongType, a3);
    if (!(_DWORD)result) {
      return result;
    }
  }

  if (a4)
  {
    *a4 = 0;
    int Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"partition-number");
    if (Value)
    {
      unint64_t v18 = Value;
      CFTypeID v19 = CFGetTypeID(Value);
      if (v19 != CFNumberGetTypeID()) {
        return 0LL;
      }
      uint64_t result = CFNumberGetValue(v18, kCFNumberSInt32Type, a4);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  if (a6)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"partition-name");
    if (!result) {
      return result;
    }
    uint64_t v20 = result;
    CFTypeID v21 = CFGetTypeID((CFTypeRef)result);
    if (v21 != CFStringGetTypeID()) {
      return 0LL;
    }
    *a6 = v20;
  }

  if (!a5) {
    return 1LL;
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"partition-hint");
  if (!result) {
    return result;
  }
  uint64_t v22 = result;
  CFTypeID v23 = CFGetTypeID((CFTypeRef)result);
  if (v23 == CFStringGetTypeID())
  {
    *a5 = v22;
    return 1LL;
  }

  return 0LL;
}

void sub_18824B54C(const __CFArray *a1, unint64_t a2, char a3)
{
  CFTypeID v4 = sub_18824B5C0(a1, a2, a3);
  if (v4)
  {
    CFTypeID v5 = v4;
    if (CFArrayGetCount(v4))
    {
      v7.length = CFArrayGetCount(v5);
      v7.location = 0LL;
      CFArrayAppendArray(a1, v5, v7);
    }

    CFRelease(v5);
  }

  v6.length = CFArrayGetCount(a1);
  v6.location = 0LL;
  CFArraySortValues(a1, v6, (CFComparatorFunction)sub_18824B2DC, 0LL);
}

__CFArray *sub_18824B5C0(const __CFArray *a1, unint64_t a2, char a3)
{
  CFIndex Count = CFArrayGetCount(a1);
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  v21.length = CFArrayGetCount(a1);
  v21.location = 0LL;
  CFArraySortValues(a1, v21, (CFComparatorFunction)sub_18824B2DC, 0LL);
  if (Count < 1)
  {
    unint64_t v11 = 0LL;
  }

  else
  {
    CFIndex v10 = 0LL;
    unint64_t v11 = 0LL;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
      if (ValueAtIndex)
      {
        unint64_t v13 = ValueAtIndex;
        CFTypeID v14 = CFGetTypeID(ValueAtIndex);
        if (v14 == CFDictionaryGetTypeID())
        {
          if (sub_18824B3C0(v13, &v20, &v19, 0LL, 0LL, 0LL))
          {
            unint64_t v15 = v20;
            if (v20 > v11)
            {
              CFTypeID v16 = sub_18824A320(v11, v20 - v11, 0, @"Apple_Free", &stru_18A20E810, 0LL, v8, v9, 0LL);
              CFArrayAppendValue(Mutable, v16);
              CFRelease(v16);
              unint64_t v15 = v20;
            }

            unint64_t v11 = v19 + v15;
          }
        }
      }

      ++v10;
    }

    while (Count != v10);
  }

  if (a2 > v11 && (a3 & 1) == 0)
  {
    CFStringRef v17 = sub_18824A320(v11, a2 - v11, 0, @"Apple_Free", &stru_18A20E810, 0LL, v8, v9, 0LL);
    CFArrayAppendValue(Mutable, v17);
    CFRelease(v17);
  }

  return Mutable;
}

CFStringRef sub_18824B768()
{
  return @"fdisk";
}

void sub_18824B774(void *a1)
{
}

void sub_18824B798(_Unwind_Exception *a1)
{
}

void *sub_18824B7AC(void *a1)
{
  *a1 = off_18A20D8E8;
  int v2 = (char *)a1[13];
  if (v2) {
    sub_18823ADA4(v2);
  }
  a1[13] = 0LL;
  return sub_18823B28C(a1);
}

void sub_18824B7E8(_Unwind_Exception *a1)
{
}

void *sub_18824B800(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_1882499D4(a1, a2);
  *uint64_t result = off_18A20D760;
  return result;
}

uint64_t sub_18824B820(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = 0;
  int v2 = (const __CFArray *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, void))(*(void *)a1 + 64LL))( a1,  &v5,  a2,  0LL);
  if (v2)
  {
    uint64_t v3 = v2;
    v5 += 100;
    if (!CFArrayGetCount(v2)) {
      unsigned int v5 = 0;
    }
    CFRelease(v3);
  }

  return v5;
}

CFArrayRef sub_18824B888(uint64_t a1, _DWORD *a2, uint64_t a3, __CFDictionary **a4)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  if (a4) {
    *a4 = 0LL;
  }
  uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFIndex v10 = (unsigned __int16 *)malloc(0x200uLL);
  unint64_t v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  *((_OWORD *)v10 + 30) = 0u;
  *((_OWORD *)v10 + 31) = 0u;
  *((_OWORD *)v10 + 28) = 0u;
  *((_OWORD *)v10 + 29) = 0u;
  *((_OWORD *)v10 + 26) = 0u;
  *((_OWORD *)v10 + 27) = 0u;
  *((_OWORD *)v10 + 24) = 0u;
  *((_OWORD *)v10 + 25) = 0u;
  *((_OWORD *)v10 + 22) = 0u;
  *((_OWORD *)v10 + 23) = 0u;
  *((_OWORD *)v10 + 20) = 0u;
  *((_OWORD *)v10 + 21) = 0u;
  *((_OWORD *)v10 + 18) = 0u;
  *((_OWORD *)v10 + 19) = 0u;
  *((_OWORD *)v10 + 16) = 0u;
  *((_OWORD *)v10 + 17) = 0u;
  *((_OWORD *)v10 + 14) = 0u;
  *((_OWORD *)v10 + 15) = 0u;
  *((_OWORD *)v10 + 12) = 0u;
  *((_OWORD *)v10 + 13) = 0u;
  *((_OWORD *)v10 + 10) = 0u;
  *((_OWORD *)v10 + 11) = 0u;
  *((_OWORD *)v10 + 8) = 0u;
  *((_OWORD *)v10 + 9) = 0u;
  *((_OWORD *)v10 + 6) = 0u;
  *((_OWORD *)v10 + 7) = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  *((_OWORD *)v10 + 5) = 0u;
  *((_OWORD *)v10 + 2) = 0u;
  *((_OWORD *)v10 + 3) = 0u;
  *(_OWORD *)CFIndex v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  CFMutableArrayRef v12 = CFArrayCreateMutable(v8, 0LL, MEMORY[0x189605228]);
  if (!v12) {
    goto LABEL_7;
  }
  CFTypeRef cf = v12;
  allocator = v8;
  theDict = Mutable;
  unint64_t v42 = a4;
  uint64_t v13 = sub_18824A018(a1);
  if (!(*(unsigned int (**)(uint64_t, void, uint64_t, char *, unsigned __int16 *))(*(void *)v13 + 48LL))( v13,  0LL,  1LL,  v50,  v11))
  {
    uint64_t v16 = 512LL;
    memcpy(__dst, v11, sizeof(__dst));
    if (*v11 == 21061)
    {
      unsigned int v17 = v11[1];
      *a2 += 2000;
      if (v17 == 8)
      {
        uint64_t v18 = sub_18824A018(a1);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, char *, unsigned __int16 *))(*(void *)v18 + 48LL))( v18,  1LL,  1LL,  v50,  v11))
        {
          goto LABEL_6;
        }

        BOOL v19 = *v11 == 19792;
        unsigned int v20 = 512;
        if (*v11 == 19792) {
          uint64_t v16 = 512LL;
        }
        else {
          uint64_t v16 = 2048LL;
        }
      }

      else
      {
        BOOL v19 = 0;
        unsigned int v20 = 0;
        uint64_t v16 = __rev16(v17);
      }
    }

    else
    {
      BOOL v19 = 0;
      unsigned int v20 = 0;
    }

    uint64_t v21 = 1LL;
    unsigned int v45 = 0;
    char v46 = !v19;
    unsigned int v22 = v16;
    unsigned int v48 = 1;
    do
    {
      if ((unint64_t)v22 + 512 <= v20 + 512)
      {
        uint64_t v25 = v20;
      }

      else
      {
        uint64_t v23 = sub_18824A018(a1);
        int v24 = (*(uint64_t (**)(uint64_t, void, uint64_t, char *, unsigned __int16 *))(*(void *)v23 + 48LL))( v23,  v22 >> 9,  1LL,  v50,  v11);
        uint64_t v25 = v22;
        unsigned int v20 = v22;
        if (v24) {
          goto LABEL_6;
        }
      }

      uint64_t v26 = (char *)v11 + v22 - v25;
      if (*(_WORD *)v26 != 19792) {
        goto LABEL_6;
      }
      if (!strcmp(v26 + 48, "Apple_partition_map")
        || !strcmp(v26 + 48, "Apple_Partition_Map")
        || !strcmp(v26 + 48, "Apple_patition_map"))
      {
        unsigned int v48 = bswap32(*((_DWORD *)v26 + 1));
        unsigned int v45 = bswap32(*((_DWORD *)v26 + 3));
        strcpy(v26 + 48, "Apple_partition_map");
      }

      else if (v48 == 1)
      {
        unsigned int v48 = bswap32(*((_DWORD *)v26 + 1));
      }

      char v27 = v46;
      if ((v21 & 3) != 0) {
        char v27 = 1;
      }
      uint64_t v28 = v16;
      if ((v27 & 1) == 0)
      {
        if (!strcmp(v26 + 48, "Apple_Driver")
          || !strcmp(v26 + 48, "Apple_Driver43")
          || !strcmp(v26 + 48, "Apple_Driver43_CD")
          || !strcmp(v26 + 48, "Apple_Driver_ATA")
          || !strcmp(v26 + 48, "Apple_Driver_ATAPI")
          || (uint64_t v28 = v16, !strcmp(v26 + 48, "Apple_Patches")))
        {
          uint64_t v28 = 2048LL;
        }
      }

      if (!(_DWORD)a3
        || ((*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(*(void *)a1 + 80LL))(a1, v26, v21, v28) & 1) == 0)
      {
        uint64_t v29 = (const void *)(*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 88LL))( a1,  v26,  v21,  v28,  a3);
        if (v29)
        {
          uint64_t v30 = v29;
          CFArrayAppendValue(cf, v29);
          CFRelease(v30);
        }
      }

      uint64_t v21 = (v21 + 1);
      v22 += v16;
    }

    while (v21 <= v48);
    if (!v45) {
      goto LABEL_6;
    }
    if ((a3 & 1) != 0)
    {
      CFDataRef v31 = CFDataCreate(allocator, (const UInt8 *)__dst, 512LL);
      unint64_t v34 = sub_18824A300(0LL, 1LL, 0, @"DDM", @"Driver Descriptor Map", v31, v32, v33);
      CFTypeID v14 = cf;
      if (v34)
      {
        unsigned int v35 = v34;
        CFArrayAppendValue(cf, v34);
        CFRelease(v35);
      }

      if (v31) {
        CFRelease(v31);
      }
    }

    else
    {
      CFTypeID v14 = cf;
      if (!(_DWORD)a3) {
        goto LABEL_59;
      }
    }

    uint64_t v36 = sub_18824A018(a1);
    unint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)v36 + 96LL))(v36);
    if ((sub_18824B1C0(v14, v37) & 1) != 0) {
      goto LABEL_6;
    }
    CFTypeID v14 = cf;
    if ((a3 & 2) != 0)
    {
      uint64_t v38 = sub_18824A018(a1);
      unint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 96LL))(v38);
      sub_18824B54C(cf, v39, 0);
LABEL_61:
      __int16 valuePtr = bswap32(__dst[1]) >> 16;
      CFNumberRef v40 = CFNumberCreate(allocator, kCFNumberSInt16Type, &valuePtr);
      CFDictionarySetValue(theDict, @"block-size", v40);
      CFRelease(v40);
      uint64_t v41 = (const void *)*MEMORY[0x189604DE8];
      CFDictionarySetValue(theDict, @"appendable", (const void *)*MEMORY[0x189604DE8]);
      CFDictionarySetValue(theDict, @"burnable", v41);
      free(v11);
      if (v42) {
        *unint64_t v42 = theDict;
      }
      else {
        CFRelease(theDict);
      }
      return v14;
    }

LABEL_59:
    sub_18824E538(v14);
    goto LABEL_61;
  }

void sub_18824BE48(void *a1)
{
}

void sub_18824BE6C(_Unwind_Exception *a1)
{
}

void *sub_18824BE80(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_1882499D4(a1, a2);
  *uint64_t result = off_18A20E318;
  return result;
}

uint64_t sub_18824BEA0(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = 0;
  int v2 = (const __CFArray *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, void))(*(void *)a1 + 64LL))( a1,  &v5,  a2,  0LL);
  if (v2)
  {
    uint64_t v3 = v2;
    v5 += 101;
    if (!CFArrayGetCount(v2)) {
      unsigned int v5 = 0;
    }
    CFRelease(v3);
  }

  return v5;
}

__CFArray *sub_18824BF08(uint64_t a1, uint64_t a2, char a3, __CFDictionary **a4)
{
  uint64_t valuePtr = 512LL;
  if (a4) {
    *a4 = 0LL;
  }
  CFRange v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v9 = malloc(0x200uLL);
  CFIndex v10 = v9;
  if (v9)
  {
    v9[30] = 0u;
    v9[31] = 0u;
    v9[28] = 0u;
    v9[29] = 0u;
    v9[26] = 0u;
    v9[27] = 0u;
    v9[24] = 0u;
    v9[25] = 0u;
    v9[22] = 0u;
    v9[23] = 0u;
    v9[20] = 0u;
    v9[21] = 0u;
    v9[18] = 0u;
    v9[19] = 0u;
    v9[16] = 0u;
    v9[17] = 0u;
    v9[14] = 0u;
    v9[15] = 0u;
    v9[12] = 0u;
    v9[13] = 0u;
    v9[10] = 0u;
    v9[11] = 0u;
    v9[8] = 0u;
    v9[9] = 0u;
    v9[6] = 0u;
    v9[7] = 0u;
    v9[4] = 0u;
    v9[5] = 0u;
    v9[2] = 0u;
    v9[3] = 0u;
    *uint64_t v9 = 0u;
    v9[1] = 0u;
    CFMutableArrayRef v11 = CFArrayCreateMutable(v7, 8LL, MEMORY[0x189605228]);
    if (v11)
    {
      CFMutableArrayRef v12 = v11;
      uint64_t v13 = sub_18824A018(a1);
      if (!(*(unsigned int (**)(uint64_t, void, uint64_t, _BYTE *, void *))(*(void *)v13 + 48LL))( v13,  0LL,  1LL,  v64,  v10)
        && *((unsigned __int16 *)v10 + 255) == 43605)
      {
        uint64_t v14 = 0LL;
        int v15 = 0;
        do
        {
          if (BYTE2(v10[2 * v14 + 56]) == 238)
          {
            if (v15) {
              goto LABEL_48;
            }
            int v15 = ++v14;
          }

          else
          {
            ++v14;
          }
        }

        while (v14 != 4);
        if (v15)
        {
          uint64_t v16 = sub_18824A018(a1);
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, _BYTE *, void *))(*(void *)v16 + 48LL))( v16,  1LL,  1LL,  v64,  v10)
            && *v10 == 0x5452415020494645LL)
          {
            uInt v17 = *((_DWORD *)v10 + 3);
            if (v17 - 513 >= 0xFFFFFE5B)
            {
              uint64_t v18 = *((unsigned int *)v10 + 4);
              *((_DWORD *)v10 + 4) = 0;
              if (crc32(0LL, (const Bytef *)v10, v17) == v18)
              {
                uint64_t v19 = *((unsigned int *)v10 + 21);
                if ((v19 - 0x10000) >= 0xFFFF0080)
                {
                  uint64_t v20 = *((unsigned int *)v10 + 20);
                  if (!WORD1(v20))
                  {
                    uint64_t v60 = *((unsigned int *)v10 + 22);
                    uint64_t v62 = v10[9];
                    free(v10);
                    *(void *)len = (unsigned __int16)v20 * v19;
                    if (((*(void *)len + 511LL) & 0xFFFFFE00LL) != 0)
                    {
                      CFIndex v10 = malloc((*(void *)len + 511LL) & 0xFFFFFE00LL);
                      if (v10)
                      {
                        uint64_t v21 = sub_18824A018(a1);
                        uint64_t v56 = v62 & 0x7FFFFFFFFFFFFFLL;
                        uint64_t v57 = (len[0] + 511) >> 9;
                        if (!(*(unsigned int (**)(uint64_t))(*(void *)v21 + 48LL))(v21)
                          && crc32(0LL, (const Bytef *)v10, len[0]) == v60
                          && (_DWORD)v20)
                        {
                          int v61 = 0;
                          uint64_t v63 = v20 + 1;
                          uint64_t v22 = 1LL;
                          uint64_t v23 = v10;
                          do
                          {
                            sub_188265FC0(v23);
                            *(int8x8_t *)&double v24 = sub_188265FC0(v23 + 2);
                            if ((*(unsigned int (**)(uint64_t, uint64_t *, double))(*(void *)a1 + 72LL))( a1,  v23,  v24))
                            {
                              if (((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 80LL))( a1,  v23,  v22) & 1) != 0) {
                                goto LABEL_48;
                              }
                              if (((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 88LL))( a1,  v23,  v22) & 1) == 0)
                              {
                                char v27 = sub_18824C520(a1, (uint64_t)v23, v22);
                                if (v27)
                                {
                                  ++v61;
                                  lena = v27;
                                  CFArrayAppendValue(v12, v27);
                                  CFRelease(lena);
                                }
                              }
                            }

                            ++v22;
                            uint64_t v23 = (uint64_t *)((char *)v23 + v19);
                          }

                          while (v63 != v22);
                          if (v61)
                          {
                            if ((a3 & 1) != 0)
                            {
                              uint64_t v28 = sub_18824A300( 0LL,  1LL,  0,  @"MBR",  @"Protective Master Boot Record",  0LL,  v25,  v26);
                              if (v28)
                              {
                                CFDataRef v31 = v28;
                                CFArrayAppendValue(v12, v28);
                                CFRelease(v31);
                              }

                              uint64_t v32 = sub_18824A300( 1LL,  1LL,  0,  @"Primary GPT Header",  @"GPT Header",  0LL,  v29,  v30);
                              if (v32)
                              {
                                unsigned int v35 = v32;
                                CFArrayAppendValue(v12, v32);
                                CFRelease(v35);
                              }

                              uint64_t v36 = sub_18824A300( v56,  v57,  0,  @"Primary GPT Table",  @"GPT Partition Data",  0LL,  v33,  v34);
                              if (v36)
                              {
                                unint64_t v37 = v36;
                                CFArrayAppendValue(v12, v36);
                                CFRelease(v37);
                              }

                              uint64_t v38 = sub_18824A018(a1);
                              uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 96LL))(v38);
                              unint64_t v42 = sub_18824A300( v39 + ~v57,  v57,  0,  @"Backup GPT Table",  @"GPT Partition Data",  0LL,  v40,  v41);
                              if (v42)
                              {
                                uint64_t v43 = v42;
                                CFArrayAppendValue(v12, v42);
                                CFRelease(v43);
                              }

                              uint64_t v44 = sub_18824A018(a1);
                              uint64_t v45 = (*(uint64_t (**)(uint64_t))(*(void *)v44 + 96LL))(v44);
                              unsigned int v48 = sub_18824A300( v45 - 1,  1LL,  0,  @"Backup GPT Header",  @"GPT Header",  0LL,  v46,  v47);
                              if (v48)
                              {
                                uint64_t v49 = v48;
                                CFArrayAppendValue(v12, v48);
                                CFRelease(v49);
                              }
                            }

                            uint64_t v50 = sub_18824A018(a1);
                            unint64_t v51 = (*(uint64_t (**)(uint64_t))(*(void *)v50 + 96LL))(v50);
                            if ((sub_18824B1C0(v12, v51) & 1) == 0)
                            {
                              if ((a3 & 2) != 0)
                              {
                                uint64_t v53 = sub_18824A018(a1);
                                unint64_t v54 = (*(uint64_t (**)(uint64_t))(*(void *)v53 + 96LL))(v53);
                                sub_18824B54C(v12, v54, 0);
                              }

                              else
                              {
                                sub_18824E538(v12);
                              }

                              CFNumberRef v55 = CFNumberCreate(v7, kCFNumberLongLongType, &valuePtr);
                              CFDictionarySetValue(Mutable, @"block-size", v55);
                              CFRelease(v55);
                              CFDictionarySetValue(Mutable, @"burnable", (const void *)*MEMORY[0x189604DE0]);
                              free(v10);
                              if (a4) {
                                *a4 = Mutable;
                              }
                              else {
                                CFRelease(Mutable);
                              }
                              return v12;
                            }
                          }
                        }
                      }
                    }

                    else
                    {
                      CFIndex v10 = 0LL;
                    }
                  }
                }
              }
            }
          }
        }
      }

LABEL_48:
      CFRelease(v12);
    }
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v10) {
    free(v10);
  }
  return 0LL;
}

BOOL sub_18824C4B0(int a1, unsigned __int8 *uu)
{
  return uuid_is_null(uu) == 0;
}

uint64_t sub_18824C4D0()
{
  return 0LL;
}

BOOL sub_18824C4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  if (*(void *)(a2 + 32) == v2) {
    return 1LL;
  }
  uint64_t v4 = v2 + 1;
  uint64_t v5 = sub_18824A018(a1);
  return v4 > (*(uint64_t (**)(uint64_t))(*(void *)v5 + 96LL))(v5);
}

__CFDictionary *sub_18824C520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  uint64_t v36 = *MEMORY[0x1895F89C0];
  __dst[0] = 0;
  CFRange v7 = (const UInt8 *)(a2 + 56);
  do
  {
    if (!*(_WORD *)(a2 + 2 * v6 + 56)) {
      break;
    }
    ++v6;
  }

  while (v6 != 72);
  uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v9 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x189604DB0], v7, 2 * v6, 0x14000100u, 0);
  if (v9)
  {
    CFIndex v10 = v9;
    CFIndex Length = CFStringGetLength(v9);
    CFIndex v12 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v13 = (char *)malloc(v12);
    if (v13)
    {
      uint64_t v14 = v13;
      if (CFStringGetCString(v10, v13, v12, 0x8000100u) && strlen(v14) <= 0x6D) {
        strlcpy(__dst, v14, 0x6DuLL);
      }
      CFRelease(v10);
      free(v14);
    }

    else
    {
      CFRelease(v10);
    }
  }

  uuid_unparse((const unsigned __int8 *)a2, out);
  uint64_t v15 = *(void *)(a2 + 32);
  uint64_t v16 = *(void *)(a2 + 40) - v15 + 1;
  if (__dst[0]) {
    CFStringRef v17 = CFStringCreateWithCString(v8, __dst, 0x8000100u);
  }
  else {
    CFStringRef v17 = CFStringCreateWithFormat(v8, 0LL, @"Untitled %u", a3);
  }
  CFStringRef v18 = v17;
  CFStringRef v19 = CFStringCreateWithCString(v8, out, 0x8000100u);
  int Value = (const __CFDictionary *)sub_18824C8D0();
  if (Value) {
    int Value = (const __CFDictionary *)CFDictionaryGetValue(Value, v19);
  }
  if (Value) {
    uint64_t v21 = (const __CFString *)Value;
  }
  else {
    uint64_t v21 = v19;
  }
  CFRetain(v21);
  double v24 = sub_18824A300(v15, v16, a3, v21, v18, 0LL, v22, v23);
  if (v24)
  {
    *(void *)uuid_string_t cStr = 0LL;
    uint64_t v25 = (char *)sub_18824A018(a1);
    int v26 = sub_188249164(v25, v15, v16, (char **)cStr);
    char v27 = *(char **)cStr;
    if (v26 || !*(void *)cStr) {
      goto LABEL_31;
    }
    uint64_t v28 = sub_18824A348();
    if (!v28)
    {
LABEL_30:
      char v27 = *(char **)cStr;
LABEL_31:
      if (v27) {
        DIDiskImageObjectRelease(v27);
      }
      uuid_unparse((const unsigned __int8 *)(a2 + 16), cStr);
      CFStringRef v31 = CFStringCreateWithCString(v8, cStr, 0x8000100u);
      CFDictionarySetValue(v24, @"partition-UUID", v31);
      CFDictionarySetValue(v24, @"partition-hint-UUID", v19);
      if (v31) {
        CFRelease(v31);
      }
      goto LABEL_35;
    }

    uint64_t v29 = v28;
    CFDictionarySetValue(v24, @"partition-filesystems", v28);
    if (CFStringCompare(v21, @"Apple_HFS", 0LL))
    {
      if (CFDictionaryGetValue(v29, @"NTFS"))
      {
        uint64_t v30 = @"Windows_NTFS";
      }

      else
      {
        if (CFStringCompare(v21, @"DOS_FAT", 0LL)) {
          goto LABEL_29;
        }
        if (CFDictionaryGetValue(v29, @"FAT12"))
        {
          uint64_t v30 = @"DOS_FAT_12";
        }

        else if (CFDictionaryGetValue(v29, @"FAT16"))
        {
          uint64_t v30 = @"DOS_FAT_16";
        }

        else
        {
          if (!CFDictionaryGetValue(v29, @"FAT32")) {
            goto LABEL_29;
          }
          uint64_t v30 = @"DOS_FAT_32";
        }
      }
    }

    else
    {
      if (!CFDictionaryGetValue(v29, @"HFSX"))
      {
LABEL_29:
        CFRelease(v29);
        goto LABEL_30;
      }

      uint64_t v30 = @"Apple_HFSX";
    }

    CFDictionarySetValue(v24, @"partition-hint", v30);
    goto LABEL_29;
  }

uint64_t sub_18824C8D0()
{
  uint64_t result = qword_18C7034D8;
  if (!qword_18C7034D8)
  {
    uint64_t v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v2 = CFDataCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const UInt8 *)"<?xml version=1.0 encoding=UTF-8?>\n <!DOCTYPE plist PUBLIC -//Apple//DTD PLIST 1.0//EN http://www.apple.com/DTDs/PropertyLis t-1.0.dtd>\n <plist version=1.0>\n <dict>\n \t<key>48465300-0000-11AA-AA11-00306543ECAC</key>\n \t<string>Apple_HFS</string>\n \t<key>7C3457EF-0000-11AA-AA11-00306543ECAC</key>\n \t<string>Apple_APFS</string>\n \t<key>EBD0A0A2-B9E5-4433-87C0-68B6B72699C7</key>\n \t<string>DOS_FAT</string>\n </dict>\n </plist>\n",  418LL);
    if (v2)
    {
      uint64_t v3 = v2;
      qword_18C7034D8 = (uint64_t)CFPropertyListCreateWithData(v1, v2, 0LL, 0LL, 0LL);
      CFRelease(v3);
    }

    return qword_18C7034D8;
  }

  return result;
}

CFStringRef sub_18824C94C()
{
  return @"GUID";
}

void sub_18824C958(void *a1)
{
}

void sub_18824C97C(_Unwind_Exception *a1)
{
}

void *sub_18824C990(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_1882499D4(a1, a2);
  *uint64_t result = off_18A20E2A8;
  return result;
}

__CFArray *sub_18824C9B0(uint64_t a1, _DWORD *a2, char a3, __CFDictionary **a4)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  uint64_t v10 = sub_18824A018(a1);
  CFTypeRef cf = 0LL;
  if (a4) {
    *a4 = 0LL;
  }
  CFMutableArrayRef v11 = CFDictionaryCreateMutable(v8, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFIndex v12 = 0LL;
  if (!DIMediaKitCreateMKMediaRef(v10, 0LL, 0LL, (uint64_t *)&cf))
  {
    MKDetectISO();
    if (v31 >= 5000)
    {
      CFStringRef v13 = CFStringCreateWithCString(v8, cStr, 0x8000100u);
      if (v13) {
        CFIndex v12 = v13;
      }
      else {
        CFIndex v12 = @"ISO9660";
      }
      unint64_t v14 = (v35 * (unint64_t)v36) >> 9;
      else {
        uint64_t v15 = @"Apple_ISO";
      }
      uint64_t v16 = sub_18824A018(a1);
      if (v14 > (*(uint64_t (**)(uint64_t))(*(void *)v16 + 96LL))(v16))
      {
        uint64_t v19 = sub_18824A018(a1);
        unint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v19 + 96LL))(v19);
      }

      uint64_t v20 = sub_18824A300(0LL, v14, 0, v15, v12, 0LL, v17, v18);
      if (v20)
      {
        uint64_t v21 = v20;
        sub_18824A018(a1);
        uint64_t v22 = sub_18824A348();
        if (v22)
        {
          uint64_t v23 = v22;
          CFDictionarySetValue(v21, @"partition-filesystems", v22);
          CFRelease(v23);
        }

        CFArrayAppendValue(Mutable, v21);
        CFRelease(v21);
        uint64_t v24 = sub_18824A018(a1);
        unint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v24 + 96LL))(v24);
        if ((sub_18824B1C0(Mutable, v25) & 1) == 0)
        {
          if ((a3 & 2) != 0)
          {
            uint64_t v27 = sub_18824A018(a1);
            (*(void (**)(uint64_t))(*(void *)v27 + 96LL))(v27);
            uint64_t v28 = sub_18824A018(a1);
            unint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 96LL))(v28);
            sub_18824B54C(Mutable, v29, 0);
          }

          else
          {
            sub_18824E538(Mutable);
          }

          CFNumberRef v30 = CFNumberCreate(v8, kCFNumberSInt16Type, valuePtr);
          CFDictionarySetValue(v11, @"block-size", v30);
          CFRelease(v30);
          CFDictionarySetValue(v11, @"burnable", (const void *)*MEMORY[0x189604DE8]);
          CFDictionarySetValue(v11, @"appendable", (const void *)*MEMORY[0x189604DE0]);
          if (a4) {
            *a4 = v11;
          }
          else {
            CFRelease(v11);
          }
          CFRelease(v12);
          *a2 += 2;
          return Mutable;
        }
      }
    }

    else
    {
      CFIndex v12 = 0LL;
    }
  }

  if (cf) {
    CFRelease(cf);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v12) {
    CFRelease(v12);
  }
  return 0LL;
}

void sub_18824CD00(void *a1)
{
}

void sub_18824CD24(_Unwind_Exception *a1)
{
}

void sub_18824CD38(const void *a1, const void *a2, void *cf)
{
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID()) {
    CFDictionaryAddValue((CFMutableDictionaryRef)cf, a1, a2);
  }
}

uint64_t sub_18824CD98(const __CFArray *a1, CFIndex a2, void *a3, void *a4, void **a5, void **a6)
{
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = &stru_18A20E810;
  }
  if (a6) {
    *a6 = &stru_18A20E810;
  }
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, a2);
  if (!ValueAtIndex) {
    return 999LL;
  }
  CFMutableArrayRef v11 = ValueAtIndex;
  CFTypeID v12 = CFGetTypeID(ValueAtIndex);
  if (v12 != CFDictionaryGetTypeID()
    || a3
    && (!CFDictionaryGetValueIfPresent(v11, @"partition-start", (const void **)&value)
     || !CFNumberGetValue((CFNumberRef)value, kCFNumberLongLongType, a3)))
  {
    return 999LL;
  }

  if (a4
    && (!CFDictionaryGetValueIfPresent(v11, @"partition-length", (const void **)&value)
     || !CFNumberGetValue((CFNumberRef)value, kCFNumberLongLongType, a4)))
  {
    return 999LL;
  }

  if (a5 && CFDictionaryGetValueIfPresent(v11, @"partition-hint", (const void **)&value))
  {
    CFTypeID v13 = CFGetTypeID(value);
    if (v13 == CFStringGetTypeID()) {
      *a5 = value;
    }
  }

  if (!a6) {
    return 0LL;
  }
  uint64_t result = CFDictionaryGetValueIfPresent(v11, @"partition-name", (const void **)&value);
  if ((_DWORD)result)
  {
    CFTypeID v15 = CFGetTypeID(value);
    if (v15 == CFStringGetTypeID())
    {
      uint64_t result = 0LL;
      *a6 = value;
      return result;
    }

    return 0LL;
  }

  return result;
}

uLong sub_18824CF0C(uLong result, int a2, unsigned int a3)
{
  *(_DWORD *)buf = 16843009 * a2;
  unint64_t v3 = a3;
  if (a3)
  {
    uLong v4 = result;
    uint64_t result = *(unsigned int *)(result + 112);
    do
    {
      if (v3 >= 5) {
        uint64_t v5 = 4LL;
      }
      else {
        uint64_t v5 = v3;
      }
      unsigned int v6 = crc32(result, buf, v5);
      uint64_t result = v6;
      *(_DWORD *)(v4 + 112) = v6;
      v3 -= v5;
    }

    while (v3);
  }

  return result;
}

uint64_t sub_18824CF7C(uint64_t a1, uint64_t a2, int a3, const unsigned __int8 *a4, const void *a5)
{
  if (!a2) {
    return 4294967246LL;
  }
  if (!*(void *)(a1 + 104)) {
    return 4294967097LL;
  }
  if (!*(_BYTE *)(a1 + 114)) {
    return 4294967242LL;
  }
  uint64_t v8 = sub_18823F3DC(a1, a2, &v13);
  if (!v8) {
    return 4294967104LL;
  }
  uint64_t v9 = v8;
  __int16 v12 = 0;
  if ((v12 & 8) != 0) {
    return 4294967098LL;
  }
  CFDictionaryRemoveValue(v9, @"Name");
  CFDictionaryRemoveValue(v9, @"CFName");
  if (a5)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(a5)) {
      CFDictionarySetValue(v9, @"CFName", a5);
    }
  }

  return 0LL;
}

uint64_t sub_18824D0A4(uint64_t a1, void **a2)
{
  if (!a2) {
    return 4294967246LL;
  }
  LODWORD(result) = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 248LL))(a1);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == -198) {
      return 0LL;
    }
    else {
      return result;
    }
  }

  else
  {
    sub_188266150(a2);
    return 0LL;
  }

uint64_t sub_18824D0F4(_BYTE *a1)
{
  if (a1[114]) {
    (*(void (**)(_BYTE *))(*(void *)a1 + 200LL))(a1);
  }
  sub_18823FD90((uint64_t)a1);
  return 0LL;
}

BOOL sub_18824D134(_DWORD *a1)
{
  return *a1 == 1802464377 && a1[1] == 4;
}

uint64_t sub_18824D160(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v23 = 0LL;
  uint64_t Code = 22LL;
  if (!a1 || !a2 || !a3) {
    goto LABEL_22;
  }
  if ((*(_BYTE *)(a2 + 12) & 1) == 0)
  {
    CFTypeRef cf = 0LL;
    uint64_t Code = (*(uint64_t (**)(uint64_t, CFTypeRef *))(*(void *)a1 + 344LL))(a1, &cf);
    if (!(_DWORD)Code)
    {
      uint64_t Code = sub_18823E548(0LL, 3, &v23);
      if (!(_DWORD)Code)
      {
        uint64_t Code = (*(uint64_t (**)(char *))(*(void *)v23 + 48LL))(v23);
        if (!(_DWORD)Code)
        {
          uint64_t Code = (*(uint64_t (**)(char *, CFTypeRef, void, void))(*(void *)v23 + 304LL))( v23,  cf,  0LL,  0LL);
          if (!(_DWORD)Code) {
            uint64_t Code = (*(uint64_t (**)(char *))(*(void *)v23 + 56LL))(v23);
          }
        }
      }
    }

    if (cf) {
      (*(void (**)(uint64_t, void))(*(void *)a1 + 352LL))(a1, 0LL);
    }
    goto LABEL_22;
  }

  size_t v7 = *(void *)(a2 + 224);
  if (!v7)
  {
    uint64_t Code = sub_18823E548(0LL, 3, &v23);
    goto LABEL_22;
  }

  CFTypeRef cf = 0LL;
  uint64_t v8 = (UInt8 *)malloc(v7);
  if (!v8)
  {
    uint64_t Code = *__error();
    goto LABEL_20;
  }

  uint64_t v9 = v8;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272LL))(a1);
  if (!(_DWORD)v10)
  {
    uint64_t Code = (*(uint64_t (**)(uint64_t, void, void, CFIndex *, UInt8 *))(*(void *)a1 + 328LL))( a1,  *(void *)(a2 + 216),  *(void *)(a2 + 224),  &length,  v9);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
    if ((_DWORD)Code) {
      goto LABEL_19;
    }
    int v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    unint64_t v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v9, length);
    if (!v14)
    {
      uint64_t Code = 4294962336LL;
      goto LABEL_19;
    }

    CFTypeID v15 = v14;
    uint64_t v16 = (const __CFDictionary *)CFPropertyListCreateWithData( v13,  v14,  0LL,  (CFPropertyListFormat *)&v20,  (CFErrorRef *)&cf);
    uint64_t v17 = v16;
    if (v16)
    {
      CFTypeID v18 = CFGetTypeID(v16);
      if (v18 != CFDictionaryGetTypeID())
      {
        uint64_t Code = 107LL;
        goto LABEL_38;
      }

      uint64_t v19 = (__CFDictionary *)sub_188259104(v17, @"resource-fork");
      if (v19)
      {
        uint64_t Code = sub_18823E548(v19, 3, &v23);
        goto LABEL_38;
      }
    }

    else if (cf)
    {
      uint64_t Code = CFErrorGetCode((CFErrorRef)cf);
      goto LABEL_38;
    }

    uint64_t Code = 4294962336LL;
LABEL_38:
    free(v9);
    CFRelease(v15);
    if (v17) {
      CFRelease(v17);
    }
    goto LABEL_20;
  }

  uint64_t Code = v10;
LABEL_19:
  free(v9);
LABEL_20:
  if (cf) {
    CFRelease(cf);
  }
LABEL_22:
  CFMutableArrayRef v11 = v23;
  if ((_DWORD)Code && v23)
  {
    DIDiskImageObjectRelease(v23);
    CFMutableArrayRef v11 = 0LL;
  }

  if (a3) {
    *a3 = v11;
  }
  return Code;
}

uint64_t sub_18824D3E8(uint64_t a1, unsigned int (*a2)(uint64_t, void, void), uint64_t a3)
{
  if (!*(void *)(a1 + 104)) {
    return 4294967246LL;
  }
  if (!*(_BYTE *)(a1 + 114)) {
    return 4294967242LL;
  }
  if (a2)
  {
    uint64_t result = sub_188262FE8(a1, a2, a3);
    if ((_DWORD)result) {
      return result;
    }
  }

  else
  {
    sub_18823FD90(a1);
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 104));
  }

  uint64_t result = 0LL;
  *(_WORD *)(a1 + 112) |= 0x20u;
  return result;
}

CFDictionaryRef sub_18824D454(uint64_t a1)
{
  unsigned int v6 = 0LL;
  CFDictionaryRef Copy = 0LL;
  if (!sub_18823E548(0LL, 3, &v6))
  {
    if ((*(unsigned int (**)(char *))(*(void *)v6 + 48LL))(v6))
    {
LABEL_3:
      CFDictionaryRef Copy = 0LL;
      goto LABEL_5;
    }

    CFDictionaryRef Copy = 0LL;
    if (!(*(unsigned int (**)(char *, uint64_t, void, void))(*(void *)v6 + 304LL))(v6, a1, 0LL, 0LL))
    {
      unint64_t v3 = v6;
      uint64_t v5 = (const __CFDictionary *)*((void *)v6 + 13);
      if (!v5)
      {
        CFDictionaryRef Copy = 0LL;
        goto LABEL_6;
      }

      CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v5);
    }
  }

uint64_t sub_18824D524(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 172);
  if (v2 > 0 || a2 != 0)
  {
    int v4 = v2 - 1;
    if (a2) {
      int v4 = 0;
    }
    *(_DWORD *)(result + 172) = v4;
  }

  return result;
}

uint64_t DIDeinitialize()
{
  uint64_t result = pthread_mutex_lock(&stru_18C7033D8);
  if (!(_DWORD)result)
  {
    byte_18C7034A0 = 0;
    dword_18C7034A4 = 0;
    if (qword_18C703460)
    {
      CFRelease((CFTypeRef)qword_18C703460);
      qword_18C703460 = 0LL;
    }

    if (sub_18824D5E0())
    {
      printf("\x1B[7m\x1B[5m\a\aDIDeinitialize: objects have leaked\a\a\n\x1B[0m");
      sub_18825B24C();
    }

    if (getenv("DISKIMAGEOBJECTTRACKING"))
    {
      printf("\x1B[7mDIDeinitialize: stopping DiskImageObject tracking\n\x1B[0m");
      sub_18825B2F8();
    }

    return pthread_mutex_unlock(&stru_18C7033D8);
  }

  return result;
}

uint64_t sub_18824D5E0()
{
  uint64_t result = qword_18C7034B8;
  if (qword_18C7034B8) {
    return CFArrayGetCount((CFArrayRef)qword_18C7034B8) > 0;
  }
  return result;
}

uint64_t sub_18824D608(const __CFString *a1, CFNumberType a2, void *a3)
{
  CFTypeID v6 = CFGetTypeID(a1);
  if (v6 == CFStringGetTypeID())
  {
    size_t v7 = (const char *)sub_18823A098(a1, 0x600u);
    if (v7)
    {
      uint64_t v8 = (char *)v7;
      if (!*v7) {
        goto LABEL_20;
      }
      if (!(((unint64_t)a2 > kCFNumberDoubleType) | (0xF9Fu >> a2) & 1))
      {
        double valuePtr = strtod(v7, &v19);
        if (*v19) {
          goto LABEL_20;
        }
        uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        CFNumberType v11 = kCFNumberDoubleType;
        goto LABEL_18;
      }

      if (((unint64_t)a2 > kCFNumberDoubleType) | (0x37EFu >> a2) & 1)
      {
        uint64_t Value = 0LL;
        LODWORD(valuePtr) = strtol(v7, &v19, 0);
        if (!*v19)
        {
          uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          CFNumberType v11 = kCFNumberSInt32Type;
          goto LABEL_18;
        }
      }

      else
      {
        uint64_t Value = 0LL;
        double valuePtr = COERCE_DOUBLE(strtouq(v7, &v19, 0));
        if (!*v19)
        {
          uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          CFNumberType v11 = kCFNumberSInt64Type;
LABEL_18:
          uint64_t v17 = CFNumberCreate(v10, v11, &valuePtr);
          CFTypeID v18 = v17;
          if (v17)
          {
            uint64_t Value = CFNumberGetValue(v17, a2, a3);
            CFRelease(v18);
            goto LABEL_21;
          }

LABEL_21:
      free(v8);
      return Value;
    }

    return 0LL;
  }

  CFTypeID v12 = CFGetTypeID(a1);
  if (v12 != CFBooleanGetTypeID())
  {
    CFTypeID v15 = CFGetTypeID(a1);
    if (v15 == CFNumberGetTypeID()) {
      return CFNumberGetValue((CFNumberRef)a1, a2, a3);
    }
    return 0LL;
  }

  LODWORD(valuePtr) = CFBooleanGetValue((CFBooleanRef)a1) != 0;
  int v13 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
  if (!v13) {
    return 0LL;
  }
  unint64_t v14 = v13;
  uint64_t Value = CFNumberGetValue(v13, a2, a3);
  CFRelease(v14);
  return Value;
}

  if ((v12 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_56:
  LOBYTE(v12) = 1;
  LOBYTE(v11) = 1;
LABEL_57:
  int v31 = 999LL;
  if ((v11 & 1) != 0 && (v12 & 1) != 0)
  {
    if (v10 >= v41) {
      return 0LL;
    }
    if (v8 >= 0x100000) {
      uint64_t v32 = 0x100000LL;
    }
    else {
      uint64_t v32 = v8;
    }
    uint64_t v33 = malloc(v32);
    if (!v33) {
      return 12LL;
    }
    uint64_t v34 = v33;
    if (v8)
    {
      unsigned __int16 v35 = 0LL;
      while (1)
      {
        unsigned int v36 = v8 >= v32 ? v32 : v8;
        uint64_t v37 = (*(uint64_t (**)(void, uint64_t, int64_t, uint64_t *, void *))(**(void **)(a1 + 24)
                                                                                            + 328LL))( *(void *)(a1 + 24),  v35 + v41,  v36,  &v46,  v34);
        if ((_DWORD)v37) {
          break;
        }
        if (!v46) {
          goto LABEL_80;
        }
        uint64_t v37 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, void *))(**(void **)(a1 + 24) + 336LL))( *(void *)(a1 + 24),  v35 + v10,  v46,  &v46,  v34);
        if ((_DWORD)v37) {
          break;
        }
        if (!v46)
        {
LABEL_80:
          int v31 = 999LL;
          goto LABEL_81;
        }

        v35 += v46;
        v8 -= v46;
        if (!v8) {
          goto LABEL_74;
        }
      }
    }

    else
    {
LABEL_74:
      *uint64_t v43 = -1;
      *v45 |= 1u;
      *unint64_t v42 = a2;
      *v44 |= 1u;
      uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
      if (!(_DWORD)v37)
      {
        (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472LL))(*(void *)(a1 + 24), 1LL);
        if (a2)
        {
          uint64_t v38 = *(void *)(a1 + 8);
          if (v38)
          {
            if (*(_DWORD *)(a1 + 16) >= a2) {
              *(void *)(v38 + 8LL * (a2 - 1)) = v10;
            }
          }
        }

        int v31 = 0LL;
        *uint64_t v40 = 1;
        goto LABEL_81;
      }
    }

    int v31 = v37;
LABEL_81:
    free(v34);
  }

  return v31;
}

CFURLRef sub_18824D820(int a1, CFURLRef anURL, const __CFString *a3, int a4)
{
  if (!anURL) {
    return anURL;
  }
  if (!a3)
  {
    CFRetain(anURL);
    return anURL;
  }

  Boolean v6 = a4;
  if (CFURLHasDirectoryPath(anURL) == a4) {
    return CFURLCreateCopyAppendingPathExtension((CFAllocatorRef)*MEMORY[0x189604DB0], anURL, a3);
  }
  CFStringRef PathComponent = CFURLCopyLastPathComponent(anURL);
  uint64_t v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v10 = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x189604DB0], anURL);
  CFNumberType v11 = CFStringCreateWithFormat(v9, 0LL, @"%@.%@", PathComponent, a3);
  CFURLRef v12 = CFURLCreateCopyAppendingPathComponent(v9, v10, v11, v6);
  CFRelease(v11);
  CFRelease(v10);
  CFRelease(PathComponent);
  return v12;
}

void *sub_18824D928(const __CFString *a1)
{
  CFIndex v2 = CFStringGetMaximumSizeOfFileSystemRepresentation(a1) + 1;
  unint64_t v3 = malloc(v2);
  if (v3 && !CFStringGetFileSystemRepresentation(a1, (char *)v3, v2))
  {
    free(v3);
    return 0LL;
  }

  return v3;
}

uint64_t sub_18824D988()
{
  return 78LL;
}

uint64_t sub_18824D990()
{
  if (dword_18C7034B4) {
    warnx("DiskImages secure mode enabled");
  }
  pid_t v0 = getpid();
  uint64_t result = ptrace(31, v0, 0LL, 0);
  if (!(_DWORD)result)
  {
    v2.rlim_cur = 0LL;
    v2.rlim_max = 0LL;
    return setrlimit(4, &v2);
  }

  return result;
}

uint64_t sub_18824D9F0(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  CFStringRef v9 = 0LL;
  *(_OWORD *)CFTypeRef cf = 0u;
  if (a1)
  {
    if (_CFURLCopyComponents())
    {
      uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      if (a2) {
        cf[1] = CFURLCreateStringByAddingPercentEscapes( (CFAllocatorRef)*MEMORY[0x189604DB0],  a2,  0LL,  @";/?:@&=+$,",
      }
                  0x8000100u);
      if (a3) {
        CFStringRef v9 = CFURLCreateStringByAddingPercentEscapes(v5, a3, 0LL, @";/?:@&=+$,", 0x8000100u);
      }
      uint64_t v6 = _CFURLCreateFromComponents();
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  if (cf[1]) {
    CFRelease(cf[1]);
  }
  if (v9) {
    CFRelease(v9);
  }
  return v6;
}

uint64_t sub_18824DB74(uint64_t a1, uint64_t a2, char **a3, void *a4)
{
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  uint64_t MKMediaRef = 22LL;
  if (a1 && a3)
  {
    uint64_t v8 = (char *)operator new(0xA8uLL);
    sub_18824DD80((uint64_t)v8);
    uint64_t MKMediaRef = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)v8 + 560LL))(v8, a1, a2);
    if ((_DWORD)MKMediaRef)
    {
LABEL_8:
      sub_18823ADA4(v8);
      uint64_t v8 = 0LL;
LABEL_21:
      *a3 = v8;
      return MKMediaRef;
    }

    if ((*(unsigned int (**)(char *))(*(void *)v8 + 288LL))(v8))
    {
      int v9 = sub_18823AC00(a2);
      uint64_t MKMediaRef = 0LL;
      CFTypeRef cf = 0LL;
      uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      uint64_t MKMediaRef = DIMediaKitCreateMKMediaRef((uint64_t)v8, *MEMORY[0x189604DB0], 0LL, (uint64_t *)&cf);
      if ((_DWORD)MKMediaRef) {
        goto LABEL_8;
      }
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v10, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      CFDictionarySetValue(Mutable, @"Include data", (const void *)*MEMORY[0x189604DE8]);
      CFURLRef v12 = (const void *)MKCFReadMedia();
      CFRelease(Mutable);
      CFRelease(cf);
      if (v14 || (sub_1882490A4((const __CFDictionary *)v12, @"Schemes"), !sub_18825AA1C()))
      {
        if (v12) {
          CFRelease(v12);
        }
        (*(void (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
        (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80LL))(a1, 1LL);
        (*(void (**)(char *, void))(*(void *)v8 + 520LL))(v8, 0LL);
        uint64_t MKMediaRef = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272LL))(a1);
        if (!(_DWORD)MKMediaRef) {
          goto LABEL_21;
        }
        goto LABEL_8;
      }

      CFRelease(v12);
    }

    uint64_t MKMediaRef = 0LL;
    goto LABEL_21;
  }

  return MKMediaRef;
}

void sub_18824DD6C(_Unwind_Exception *a1)
{
}

uint64_t sub_18824DD80(uint64_t a1)
{
  rlimit v2 = (void *)sub_18823DDF4(a1);
  void *v2 = off_18A20B990;
  sub_18823DF90((uint64_t)v2, @"thread-safe", (const __CFString *)*MEMORY[0x189604DE8]);
  return a1;
}

void sub_18824DDC8(_Unwind_Exception *a1)
{
}

void sub_18824DDE0(void *a1)
{
}

void sub_18824DE04(_Unwind_Exception *a1)
{
}

void *sub_18824DE18(void *a1)
{
  *a1 = off_18A20B990;
  if (sub_18823E16C((uint64_t)a1))
  {
    uint64_t v2 = (*(uint64_t (**)(void *))(*a1 + 296LL))(a1);
    (*(void (**)(uint64_t, void))(*(void *)v2 + 280LL))(v2, 0LL);
  }

  return sub_188244EB4(a1);
}

void sub_18824DE6C(_Unwind_Exception *a1)
{
}

CFMutableDictionaryRef sub_18824DE84(io_registry_entry_t a1)
{
  kern_return_t v1;
  CFMutableDictionaryRef properties;
  properties = 0LL;
  uint64_t v1 = IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  if (!v1) {
    return properties;
  }
  fprintf( (FILE *)*MEMORY[0x1895F89D0],  "CFDictionaryCreateMutableFromIOKitObject: unable to get object properties: error 0x%08X (%d)\n",  v1,  v1);
  return 0LL;
}

uint64_t sub_18824DEE8(const __CFArray *a1, const __CFArray *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count == CFArrayGetCount(a2)) {
    return sub_18824DF44(a1, a2);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_18824DF44(const __CFArray *a1, CFArrayRef theArray)
{
  int Count = CFArrayGetCount(theArray);
  CFIndex v5 = CFArrayGetCount(a1);
  uint64_t result = 0LL;
  if (a1 && theArray && Count)
  {
    if (Count < 1)
    {
      return 1LL;
    }

    else
    {
      CFIndex v7 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v7);
        if (ValueAtIndex)
        {
          v9.location = 0LL;
          v9.CFIndex length = v5;
          uint64_t result = CFArrayContainsValue(a1, v9, ValueAtIndex);
          if (!(_DWORD)result) {
            break;
          }
        }

        if (Count == ++v7) {
          return 1LL;
        }
      }
    }
  }

  return result;
}

uint64_t sub_18824DFE4(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  if (result)
  {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
    return (*(uint64_t (**)(uint64_t))(*(void *)v3 + 448LL))(v3);
  }

  return result;
}

uint64_t sub_18824E034(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 448LL))(result);
  }
  return result;
}

uint64_t sub_18824E04C()
{
  return 0LL;
}

BOOL sub_18824E054(uint64_t a1)
{
  return sub_18824E07C(*(const char **)(a1 + 296), 0LL, 0LL) == 0;
}

uint64_t sub_18824E07C(const char *a1, _DWORD *a2, _DWORD *a3)
{
  int v7 = 0;
  memset(v6, 0, sizeof(v6));
  v8[1] = 0LL;
  v8[2] = 0LL;
  v8[0] = 0x400000000005LL;
  uint64_t result = getattrlist(a1, v8, v6, 0x24uLL, 0);
  if (!(_DWORD)result)
  {
    if (a2) {
      *a2 = bswap32(DWORD1(v6[0]));
    }
    if (a3) {
      *a3 = bswap32(DWORD2(v6[0]));
    }
  }

  return result;
}

uint64_t sub_18824E0F8(uint64_t a1, _DWORD *a2)
{
  return sub_18824E07C(*(const char **)(a1 + 296), a2, 0LL);
}

BOOL sub_18824E104(uint64_t a1)
{
  return sub_18824E07C(*(const char **)(a1 + 296), 0LL, 0LL) == 0;
}

uint64_t sub_18824E12C(uint64_t a1, _DWORD *a2)
{
  return sub_18824E07C(*(const char **)(a1 + 296), 0LL, a2);
}

uint64_t sub_18824E13C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
}

uint64_t sub_18824E14C(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
  uint64_t v9 = 0LL;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 248LL))(a1)
    && (*(unsigned int (**)(uint64_t, char *))(*(void *)a1 + 264LL))(a1, (char *)&v9 + 4))
  {
    return 0LL;
  }

  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 224LL))(a1) & 1) != 0)
  {
    BOOL v4 = HIDWORD(v9) == 1061109567;
    BOOL v5 = v9 == 1061109567;
    if (v4 && v5) {
      int v6 = 0;
    }
    else {
      int v6 = v9;
    }
    if (v4 && v5) {
      int v7 = 0;
    }
    else {
      int v7 = HIDWORD(v9);
    }
  }

  else
  {
    int v6 = 0;
    int v7 = HIDWORD(v9);
  }

  if (v7 | v6) {
    return sub_18825CDD4(v7, v6, a2);
  }
  return 0LL;
}

uint64_t sub_18824E218(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 208LL))(a1);
  *a2 = 0;
  if (!v3) {
    return 0LL;
  }
  BOOL v4 = v3;
  *a2 = -1000;
  if (CFStringCompare(v3, @"sparseimage", 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v4, @"shadow", 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v4, @"dmgpart", 1uLL) == kCFCompareEqualTo)
  {
    return 0LL;
  }

  uint64_t v5 = 1430541391LL;
  *a2 = 100;
  if (CFStringCompare(v4, @"dmg", 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v4, @"img", 1uLL) == kCFCompareEqualTo)
  {
    return 1430540887LL;
  }

  if (CFStringCompare(v4, @"iso", 1uLL)
    && CFStringCompare(v4, @"toast", 1uLL)
    && CFStringCompare(v4, @"cdr", 1uLL)
    && CFStringCompare(v4, @"dvdr", 1uLL))
  {
    uint64_t v5 = 0LL;
    *a2 = 0;
  }

  return v5;
}

uint64_t sub_18824E360(void *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v10 = (*(uint64_t (**)(void *))(*a1 + 296LL))(a1);
  if (a4) {
    *a4 = 0LL;
  }
  if (!v10) {
    return 999LL;
  }
  uint64_t v11 = a1[20];
  if (v11 < a2 || a3 + a2 > v11) {
    return 22LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))(*(void *)v10 + 328LL))( v10,  a2 << 9,  a3 << 9,  &v15,  a5);
  if ((_DWORD)result) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = a4 == 0LL;
  }
  if (!v14)
  {
    uint64_t result = 0LL;
    *a4 = v15 >> 9;
  }

  return result;
}

uint64_t sub_18824E418(uint64_t a1)
{
  uint64_t v3 = 0LL;
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v1 + 296LL))(v1, &v3);
  return v3 >> 9;
}

uint64_t sub_18824E458(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unsigned int v2 = 16;
  uint64_t v3 = 64LL;
  while (1)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, char *))(*(void *)a1 + 48LL))( a1,  v3,  4LL,  &v7,  &v8))
    {
      unsigned int v5 = 0;
      goto LABEL_12;
    }

    if (!v8 && v9 == 21326 && v10 == 82) {
      break;
    }
    ++v2;
    v3 += 4LL;
    if (v3 == 128)
    {
      unsigned int v5 = 0;
      unsigned int v2 = 32;
      goto LABEL_12;
    }
  }

  unsigned int v5 = 1;
LABEL_12:
  if (v2 < 0x20) {
    return v5;
  }
  else {
    return 0LL;
  }
}

void sub_18824E538(const __CFArray *a1)
{
  v2.CFIndex length = CFArrayGetCount(a1);
  v2.location = 0LL;
  CFArraySortValues(a1, v2, (CFComparatorFunction)sub_18824B2DC, 0LL);
}

CFStringRef sub_18824E570()
{
  return @"ISO9660";
}

uint64_t sub_18824E57C(uint64_t a1, void *a2)
{
  if (!a2) {
    return 22LL;
  }
  *a2 = 0LL;
  return 78LL;
}

void *sub_18824E594()
{
  pid_t v0 = operator new(0x80uLL);
  sub_18825B5EC(v0, 0LL);
  return v0;
}

void sub_18824E5C4(_Unwind_Exception *a1)
{
}

uint64_t sub_18824E5D8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 120)) {
    return 10LL;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_18824E5EC()
{
  return 1LL;
}

CFTypeRef sub_18824E5F4()
{
  int v0 = DIGetBundleRef();
  return sub_1882660CC(v0, (int)@"read/write", @"read/write");
}

uint64_t sub_18824E61C(uint64_t a1, const __CFDictionary *a2, void *a3, void *a4)
{
  char v8 = (const __CFString *)sub_188238A30();
  int v9 = sub_188238A38(v8, 0);
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    return 118LL;
  }
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  if (a4) {
    *a4 = 0LL;
  }
  if (!a1) {
    return 22LL;
  }
  uint64_t v11 = operator new(0x808uLL);
  sub_18824E85C((uint64_t)v11);
  if (a2)
  {
    v11[2048] = sub_188239FB0(a2, @"enable-keychain", 1u);
    v11[545] = sub_188239FB0(a2, @"allow-tty-prompt", 1u) != 0;
    if (sub_18824911C(a2, @"use-filename-for-prompt"))
    {
      uint64_t Value = CFDictionaryGetValue(a2, @"use-filename-for-prompt");
      (*(void (**)(_BYTE *, const __CFString *, const void *))(*(void *)v11 + 32LL))( v11,  @"use-filename-for-prompt",  Value);
    }
  }

  sub_188250504(v11, a1, a2);
  uint64_t v13 = sub_18823AC00((uint64_t)a2);
  int v14 = (*(uint64_t (**)(_BYTE *, uint64_t))(*(void *)v11 + 80LL))(v11, v13);
  if (v14) {
    sub_18824E974(v14, (uint64_t)"setPermission() failed");
  }
  v11[2049] = 1;
  (*(void (**)(_BYTE *))(*(void *)v11 + 704LL))(v11);
  uint64_t result = 0LL;
  *a3 = v11;
  return result;
}

void sub_18824E7A4(void *a1, int a2)
{
  unsigned int v5 = __cxa_begin_catch(a1);
  if (a2 == 2) {
    (*(void (**)(void *))(*(void *)v5 + 24LL))(v5);
  }
  __cxa_end_catch();
  JUMPOUT(0x18824E780LL);
}

void sub_18824E838(_Unwind_Exception *a1)
{
}

uint64_t sub_18824E85C(uint64_t a1)
{
  *(void *)uint64_t v2 = off_18A20CDB0;
  *(_BYTE *)(a1 + 2048) = 0;
  *(_OWORD *)(v2 + 520) = 0u;
  bzero((void *)(v2 + 546), 0x4FCuLL);
  uint64_t v3 = *MEMORY[0x189604DE8];
  sub_18823A7AC(a1, @"thread-safe", (const void *)*MEMORY[0x189604DE8]);
  pthread_rwlock_init((pthread_rwlock_t *)(a1 + 208), 0LL);
  (*(void (**)(uint64_t, const __CFString *, uint64_t))(*(void *)a1 + 32LL))( a1,  @"bs-supports-proxy-encoding",  v3);
  *(void *)(a1 + 472) = 0LL;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 408), 0LL);
  return a1;
}

void sub_18824E900(_Unwind_Exception *a1)
{
}

uint64_t sub_18824E918(uint64_t a1, const __CFString *a2)
{
  if (!a2)
  {
    if (*(_BYTE *)(a1 + 545))
    {
      uint64_t result = sub_188250224(a1);
      if (!(_DWORD)result) {
        return result;
      }
      if ((_DWORD)result == 80) {
        sub_18824E974(80, (uint64_t)"unable to unlock image.");
      }
    }

    sub_18824E974(80, (uint64_t)"unable to unlock image.");
  }

  uint64_t result = sub_188261C3C(a1, a2);
  if ((_DWORD)result) {
    sub_18824E974(result, (uint64_t)"cannot unlock image with specified passphrase");
  }
  return result;
}

void sub_18824E974(int a1, uint64_t a2)
{
  exception = __cxa_allocate_exception(0x18uLL);
  *(void *)exception = &off_18A20CD40;
  exception[3] = a1;
  *((void *)exception + 2) = a2;
  __cxa_throw(exception, (struct type_info *)&unk_18A20CD70, (void (*)(void *))std::exception::~exception);
}

void sub_18824E9B8(char **a1)
{
}

void sub_18824E9DC(_Unwind_Exception *a1)
{
}

void *sub_18824E9F0(char **a1)
{
  *a1 = (char *)off_18A20CDB0;
  uint64_t v2 = a1[59];
  if (v2) {
    free(v2);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 51));
  uint64_t v3 = a1[65];
  if (v3) {
    free(v3);
  }
  BOOL v4 = a1[66];
  if (v4) {
    free(v4);
  }
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 26));
  return sub_188245010(a1);
}

void sub_18824EABC(_Unwind_Exception *a1)
{
}

uint64_t sub_18824EAD4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

void sub_18824EAE0(_BYTE *a1, uint64_t a2, char *a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a1[545])
  {
    uint64_t v5 = (*(uint64_t (**)(_BYTE *, const __CFString *))(*(void *)a1 + 24LL))( a1,  @"use-filename-for-prompt");
    uint64_t v6 = *(void *)a1;
    if (v5) {
      uint64_t v7 = (*(uint64_t (**)(_BYTE *, const __CFString *))(v6 + 24))(a1, @"use-filename-for-prompt");
    }
    else {
      uint64_t v7 = (*(uint64_t (**)(_BYTE *))(v6 + 192))(a1);
    }
    uint64_t v8 = v7;
    int v9 = DIGetBundleRef();
    char v10 = (const __CFString *)sub_1882660CC( v9,  (int)@"Enter a new password to secure %1$@: ",  @"Enter a new password to secure %1$@: ");
    uint64_t v11 = CFStringCreateWithFormat(0LL, 0LL, v10, v8);
    CFURLRef v12 = sub_18823A098(v11, 0x8000100u);
    uint64_t v13 = v12;
    if (v12) {
      int v14 = (const char *)v12;
    }
    else {
      int v14 = "Enter new password: ";
    }
    int v15 = DIGetBundleRef();
    uint64_t v16 = (const __CFString *)sub_1882660CC( v15,  (int)@"Re-enter new password: ",  @"Re-enter new password: ");
    uint64_t v17 = sub_18823A098(v16, 0x8000100u);
    CFTypeID v18 = v17;
    if (v17) {
      uint64_t v19 = (const char *)v17;
    }
    else {
      uint64_t v19 = "Re-enter new password: ";
    }
    int v20 = sub_1882503D0(v14, a3, 1024, 1);
    if (!v20)
    {
      int v20 = sub_1882503D0(v19, __s2, 1024, 1);
      if (!v20)
      {
        int v20 = strncmp(a3, __s2, 0x400uLL);
        bzero(__s2, 0x400uLL);
        if (v20)
        {
          int v21 = DIGetBundleRef();
          uint64_t v22 = (const __CFString *)sub_1882660CC( v21,  (int)@"Passwords must match.",  @"Passwords must match.");
          uint64_t v23 = (const char *)sub_18823A098(v22, 0x8000100u);
          uint64_t v24 = "Passwords must match.";
          if (v23) {
            uint64_t v24 = v23;
          }
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v24);
          if (v22) {
            CFRelease(v22);
          }
          int v20 = 80;
        }
      }
    }

    if (v18) {
      free(v18);
    }
    if (v13) {
      free(v13);
    }
    if (v20)
    {
      bzero(a3, 0x400uLL);
      sub_18824E974(v20, (uint64_t)"cannot get passphrase.");
    }

    if (v16) {
      CFRelease(v16);
    }
    if (v11) {
      CFRelease(v11);
    }
    if (v10) {
      CFRelease(v10);
    }
  }

void sub_18824ED60(_Unwind_Exception *exception_object)
{
  if (v4) {
    CFRelease(v4);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_18824EDDC(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v2 = a1 + 566;
  int v3 = *(_DWORD *)(a1 + 480);
  BOOL v4 = v3 == 1;
  if (v3 == 1) {
    uint64_t v5 = (int *)(a1 + 642);
  }
  else {
    uint64_t v5 = (int *)(a1 + 566);
  }
  uint64_t v6 = 4LL;
  if (v4) {
    uint64_t v6 = 80LL;
  }
  int v7 = *(_DWORD *)(v2 + v6);
  int v8 = *v5;
  uint64_t v9 = 8LL;
  if (v4) {
    uint64_t v9 = 376LL;
  }
  int v10 = *(_DWORD *)(v2 + v9);
  int v11 = DIGetBundleRef();
  CFTypeRef v12 = sub_1882660CC(v11, (int)@"(CSSM non-standard algorithm)", @"(CSSM non-standard algorithm)");
  if (v12)
  {
    uint64_t v13 = v12;
    (*(void (**)(uint64_t, const __CFString *, CFTypeRef))(*(void *)a1 + 32LL))( a1,  @"encryption-class",  v12);
    CFRelease(v13);
  }

  if ((v10 == 91 || v10 == 0) && (!v8 || v8 == -2147483647))
  {
    if (v7 == 128)
    {
      uint64_t v16 = @"AES-128";
      uint64_t v17 = 16LL;
    }

    else
    {
      if (v7 != 256) {
        goto LABEL_25;
      }
      uint64_t v16 = @"AES-256";
      uint64_t v17 = 32LL;
    }

    *(void *)(a1 + 2032) = v17;
    (*(void (**)(uint64_t, const __CFString *, const __CFString *))(*(void *)a1 + 32LL))( a1,  @"encryption-class",  v16);
LABEL_25:
    *(void *)(a1 + 2040) = CFDataGetBytePtr(*(CFDataRef *)(a1 + 2016));
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 2024));
    unsigned int Length = CFDataGetLength(*(CFDataRef *)(a1 + 2024));
    unsigned int v20 = Length;
    if (!Length) {
      goto LABEL_29;
    }
    uint64_t v21 = Length;
    uint64_t v22 = data;
    uint64_t v23 = BytePtr;
    do
    {
      char v24 = *v23++;
      *v22++ = v24 ^ 0x36;
      --v21;
    }

    while (v21);
    if (Length > 0x3F)
    {
      int v25 = 0;
    }

    else
    {
LABEL_29:
      memset(&data[Length], 54, 64 - Length);
      int v25 = 1;
    }

    uint64_t v26 = (CC_SHA1_CTX *)(a1 + 1824);
    CC_SHA1_Init((CC_SHA1_CTX *)(a1 + 1824));
    uint64_t v27 = (CC_SHA1_CTX *)(a1 + 1920);
    CC_SHA1_Init(v27);
    CC_SHA1_Update(v26, data, 0x40u);
    if (v20)
    {
      uint64_t v28 = v20;
      unint64_t v29 = data;
      do
      {
        char v30 = *BytePtr++;
        *v29++ = v30 ^ 0x5C;
        --v28;
      }

      while (v28);
    }

    if (v25) {
      memset(&data[v20], 92, 64 - v20);
    }
    CC_SHA1_Update(v27, data, 0x40u);
  }

uint64_t sub_18824F010(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
  if (!v2) {
    return 999LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 272LL))(v2);
  if (!(_DWORD)v4)
  {
    int v5 = *(_DWORD *)(a1 + 480);
    if (v5 == 2)
    {
      *(_DWORD *)(a1 + 598) = *(void *)(a1 + 488);
      *(_OWORD *)(a1 + 602) = *(_OWORD *)(a1 + 496);
      int8x16_t v10 = *(int8x16_t *)(a1 + 562);
      __dst[0] = *(int8x16_t *)(a1 + 546);
      __dst[1] = v10;
      int8x16_t v11 = *(int8x16_t *)(a1 + 594);
      __dst[2] = *(int8x16_t *)(a1 + 578);
      __dst[3] = v11;
      __dst[4].i64[0] = *(void *)(a1 + 610);
      __dst[0] = vrev32q_s8(__dst[0]);
      __dst[1] = vrev32q_s8(__dst[1]);
      __dst[2].i32[0] = bswap32(__dst[2].u32[0]);
      __dst[3].i32[1] = bswap32(v11.u32[1]);
      *(int8x16_t *)((char *)&__dst[3] + 8) = vrev64q_s8(*(int8x16_t *)((char *)&__dst[3] + 8));
      uint64_t v9 = (*(uint64_t (**)(uint64_t, void, uint64_t, _BYTE *, int8x16_t *, __n128))(*(void *)v3 + 336LL))( v3,  0LL,  72LL,  v14,  __dst,  *(__n128 *)((char *)&__dst[3] + 8));
    }

    else
    {
      if (v5 != 1)
      {
        uint64_t v4 = 999LL;
        goto LABEL_11;
      }

      uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v3 + 296LL))(v3, &v13);
      if ((_DWORD)v4)
      {
LABEL_11:
        (*(void (**)(uint64_t, void))(*(void *)v3 + 280LL))(v3, 0LL);
        return v4;
      }

      uint64_t v6 = *(void *)(a1 + 496);
      *(_DWORD *)(a1 + 562) = *(void *)(a1 + 488);
      *(void *)(a1 + 1802) = v6;
      memcpy(__dst, (const void *)(a1 + 546), 0x4FCuLL);
      uint64_t v7 = v13 - 1276;
      v8.n128_u64[0] = (unint64_t)sub_188262328((uint64_t)__dst);
      uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BYTE *, int8x16_t *, __n128))(*(void *)v3 + 336LL))( v3,  v7,  1276LL,  v14,  __dst,  v8);
    }

    uint64_t v4 = v9;
    goto LABEL_11;
  }

  return v4;
}

uint64_t sub_18824F1C4(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a4 && a5 && (unint64_t v6 = *(void *)(a1 + 488), v7 = a2 / v6, a2 == v7 * v6) && !(a3 % v6)) {
    return sub_18824F1FC(a1, v7, a3 / v6, a4, a5);
  }
  else {
    return 22LL;
  }
}

uint64_t sub_18824F1FC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a3 < 1) {
    return 0LL;
  }
  uint64_t v10 = 0LL;
  while (1)
  {
    sub_18824F420((_OWORD *)a1, a2 + v10, iv);
    CCCryptorStatus v11 = CCCrypt( 0,  0,  0,  *(const void **)(a1 + 2040),  *(void *)(a1 + 2032),  iv,  (const void *)(a4 + *(void *)(a1 + 488) * v10),  *(void *)(a1 + 488),  (void *)(a5 + *(void *)(a1 + 488) * v10),  *(void *)(a1 + 488),  &v15);
    if (v11) {
      break;
    }
    if (a3 == ++v10) {
      return 0LL;
    }
  }

  uint64_t v13 = (FILE **)MEMORY[0x1895F89D0];
  fprintf((FILE *)*MEMORY[0x1895F89D0], "CEncryptedEncoding::encrypt CCCrypt() returned error %d\n", v11);
  uint64_t result = 999LL;
  if (v11 > -4301)
  {
    if (v11 == -4300 || v11 == -1) {
      return 22LL;
    }
  }

  else if (v11 == -4302)
  {
    return 12LL;
  }

  else if (v11 == -4301)
  {
    fprintf(*v13, "CEncryptedEncoding::encrypt output buffer should be %zu bytes\n", v15);
    return 999LL;
  }

  return result;
}

#error "18824F3EC: call analysis failed (funcsize=32)"
uint64_t sub_18824F420(_OWORD *a1, unsigned int a2, unsigned __int8 *a3)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CC_SHA1_CTX v12;
  unsigned int data;
  data = bswap32(a2);
  int v5 = a1[117];
  *(_OWORD *)&v12.data[1] = a1[116];
  *(_OWORD *)&v12.data[5] = v5;
  unint64_t v6 = a1[119];
  *(_OWORD *)&v12.data[9] = a1[118];
  *(_OWORD *)&v12.data[13] = v6;
  unint64_t v7 = a1[115];
  *(_OWORD *)&v12.h0 = a1[114];
  *(_OWORD *)&v12.h4 = v7;
  CC_SHA1_Update(&v12, &data, 4u);
  CC_SHA1_Final(a3, &v12);
  __n128 v8 = a1[123];
  *(_OWORD *)&v12.data[1] = a1[122];
  *(_OWORD *)&v12.data[5] = v8;
  uint64_t v9 = a1[125];
  *(_OWORD *)&v12.data[9] = a1[124];
  *(_OWORD *)&v12.data[13] = v9;
  uint64_t v10 = a1[121];
  *(_OWORD *)&v12.h0 = a1[120];
  *(_OWORD *)&v12.h4 = v10;
  CC_SHA1_Update(&v12, a3, 0x14u);
  return CC_SHA1_Final(a3, &v12);
}

uint64_t sub_18824F4D0()
{
  return 1LL;
}

uint64_t sub_18824F4D8(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a4 && (v5 = *(void *)(a1 + 488), unint64_t v6 = a2 / v5, a2 == v6 * v5) && !(a3 % v5)) {
    return sub_18824F50C(a1, v6, a3 / v5, a4);
  }
  else {
    return 22LL;
  }
}

uint64_t sub_18824F50C(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a3 < 1) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  while (1)
  {
    sub_18824F420((_OWORD *)a1, a2 + v8, iv);
    CCCryptorStatus v9 = CCCrypt( 1u,  0,  0,  *(const void **)(a1 + 2040),  *(void *)(a1 + 2032),  iv,  (const void *)(a4 + *(void *)(a1 + 488) * v8),  *(void *)(a1 + 488),  (void *)(a4 + *(void *)(a1 + 488) * v8),  *(void *)(a1 + 488),  &v13);
    if (v9) {
      break;
    }
    if (a3 == ++v8) {
      return 0LL;
    }
  }

  CCCryptorStatus v11 = (FILE **)MEMORY[0x1895F89D0];
  fprintf((FILE *)*MEMORY[0x1895F89D0], "CEncryptedEncoding::decrypt CCCrypt() returned error %d\n", v9);
  uint64_t result = 999LL;
  if (v9 > -4301)
  {
    if (v9 == -4300 || v9 == -1) {
      return 22LL;
    }
  }

  else if (v9 == -4302)
  {
    return 12LL;
  }

  else if (v9 == -4301)
  {
    fprintf(*v11, "CEncryptedEncoding::decrypt output buffer should be %zu bytes\n", v13);
    return 999LL;
  }

  return result;
}

#error "18824F6F0: call analysis failed (funcsize=32)"
uint64_t sub_18824F724(uint64_t a1, void *a2)
{
  unsigned int *v2;
  unint64_t v3;
  uint64_t v4;
  const UInt8 *v6;
  CFAllocatorRef v9;
  uint64_t v2 = (unsigned int *)(a1 + 570);
  uint64_t v3 = *(unsigned int *)(a1 + 570);
  uint64_t v4 = ((*(_DWORD *)(a1 + 578) + v3) >> 3) + 5;
  if (*a2 != v4) {
    return 0LL;
  }
  unint64_t v6 = (const UInt8 *)a2[1];
  if (*(_DWORD *)&v6[v4 - 5] ^ 0x45494B43 | v6[v4 - 1]) {
    return 0LL;
  }
  CCCryptorStatus v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  *(void *)(a1 + 2016) = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v6, v3 >> 3);
  *(void *)(a1 + 2024) = CFDataCreate( v9,  (const UInt8 *)(a2[1] + ((unint64_t)*v2 >> 3)),  (unint64_t)v2[2] >> 3);
  return 1LL;
}

uint64_t sub_18824F7DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 80LL))(v1);
  }
  else {
    return 999LL;
  }
}

void sub_18824F7F8(unint64_t *a1)
{
  uint64_t v2 = (*(uint64_t (**)(unint64_t *))(*a1 + 496))(a1);
  uint64_t v3 = (uint64_t *)(a1 + 64);
  if ((*(unsigned int (**)(uint64_t, _BYTE *))(*(void *)v2 + 296LL))(v2, (_BYTE *)a1 + 512))
  {
    uint64_t v4 = 0LL;
LABEL_3:
    *uint64_t v3 = v4;
    return;
  }

  unint64_t v6 = a1[61];
  unint64_t v5 = a1[62];
  unint64_t v7 = v5 % v6;
  unint64_t v8 = v6 - v5 % v6;
  if (!v7) {
    unint64_t v8 = 0LL;
  }
  uint64_t v9 = v8 + v5;
  if (*((_DWORD *)a1 + 120) == 1) {
    uint64_t v4 = v9 + 1276;
  }
  else {
    uint64_t v4 = a1[63] + v9;
  }
  if (v4 != *v3 && !*((_BYTE *)a1 + 2049))
  {
    uint64_t v10 = (const __CFString *)(*(uint64_t (**)(unint64_t *))(*a1 + 192))(a1);
    if (v10) {
      CCCryptorStatus v11 = (char *)sub_18823A098(v10, 0x8000100u);
    }
    else {
      CCCryptorStatus v11 = 0LL;
    }
    CFTypeRef v12 = "";
    if (v11) {
      CFTypeRef v12 = v11;
    }
    syslog(5, "CEncryptedEncoding: need to repair %s", v12);
    syslog(5, "expected length: %qd, actual length: %qd", v4, *v3);
    if (v11) {
      free(v11);
    }
    int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v2 + 312LL))(v2, v4);
    syslog(6, "setting length returned %d", v13);
  }

uint64_t sub_18824F968(uint64_t a1, unint64_t a2, size_t a3, void *a4, char *a5)
{
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
  if (a4) {
    *a4 = 0LL;
  }
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 208));
  size_t v33 = a3;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 568LL))(a1))
  {
    uint64_t v12 = 9LL;
    goto LABEL_11;
  }

  if (!a5)
  {
    uint64_t v12 = 22LL;
    goto LABEL_11;
  }

  int64_t v11 = *(void *)(a1 + 496);
  int64_t v35 = v11;
  if (*(_BYTE *)(a1 + 2049))
  {
    (*(void (**)(uint64_t, int64_t *))(*(void *)a1 + 304LL))(a1, &v35);
    int64_t v11 = v35;
  }

  if ((uint64_t)(a3 + a2) > v11)
  {
    uint64_t v12 = 29LL;
LABEL_11:
    int v13 = (pthread_rwlock_t *)(a1 + 208);
    goto LABEL_12;
  }

  if (!a3)
  {
    uint64_t v12 = 0LL;
    int v13 = (pthread_rwlock_t *)(a1 + 208);
    goto LABEL_12;
  }

  uint64_t v30 = v10;
  int v31 = 0LL;
  uint64_t v32 = (pthread_mutex_t *)(a1 + 408);
  while (1)
  {
    size_t v15 = *(void *)(a1 + 488);
    size_t v16 = a2 % v15;
    if (a3 < v15 || v16)
    {
      if (pthread_mutex_trylock(v32))
      {
        unint64_t v22 = *(void *)(a1 + 488);
        uint64_t v23 = v31;
        if (v31) {
          goto LABEL_37;
        }
        uint64_t v23 = (char *)malloc(32 * v22);
        int v31 = v23;
      }

      else
      {
        uint64_t v23 = *(char **)(a1 + 472);
      }

      if (!v23)
      {
        uint64_t v12 = 12LL;
        goto LABEL_70;
      }

      unint64_t v22 = *(void *)(a1 + 488);
LABEL_37:
      uint64_t v24 = *(void *)(a1 + 512);
      uint64_t v25 = *(void *)(a1 + 504) + a2 - v16;
      if (v24 <= v25)
      {
        unint64_t v26 = 0LL;
      }

      else
      {
        else {
          unint64_t v26 = v24 - v25;
        }
        if (v26)
        {
          unsigned int v27 = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t, uint64_t *, char *))(*(void *)v30 + 328LL))( v30,  *(void *)(a1 + 504) + a2 - v16,  v26,  &v34,  v23);
          if (v34 == v26) {
            unsigned int v28 = 0;
          }
          else {
            unsigned int v28 = 5;
          }
          if (v27) {
            uint64_t v12 = v27;
          }
          else {
            uint64_t v12 = v28;
          }
          if (v27) {
            BOOL v29 = 0;
          }
          else {
            BOOL v29 = v34 == v26;
          }
          if (!v29)
          {
            size_t v17 = 0LL;
            goto LABEL_61;
          }

          unint64_t v22 = *(void *)(a1 + 488);
LABEL_55:
          if (v22 != v26)
          {
            bzero(&v23[v26], v22 - v26);
            unint64_t v22 = *(void *)(a1 + 488);
          }

          sub_18824F50C(a1, (v25 - *(void *)(a1 + 504)) / v22, 1LL, (uint64_t)v23);
          if (*(void *)(a1 + 488) - v16 >= a3) {
            size_t v17 = a3;
          }
          else {
            size_t v17 = *(void *)(a1 + 488) - v16;
          }
          memcpy(a5, &v23[v16], v17);
LABEL_61:
          if ((_DWORD)v12) {
            goto LABEL_70;
          }
          goto LABEL_64;
        }
      }

      uint64_t v12 = 0LL;
      goto LABEL_55;
    }

    size_t v17 = a3 / v15 * v15;
    int64_t v18 = *(void *)(a1 + 512);
    int64_t v19 = *(void *)(a1 + 504) + a2;
    if (v18 > v19) {
      break;
    }
    size_t v20 = 0LL;
LABEL_31:
    if (v17 != v20) {
      bzero(&a5[v20], v17 - v20);
    }
    sub_18824F50C( a1,  (unint64_t)(v19 - *(void *)(a1 + 504)) / *(void *)(a1 + 488),  v17 / *(void *)(a1 + 488),  (uint64_t)a5);
LABEL_64:
    a2 += v17;
    a5 += v17;
    a3 -= v17;
    if (!a3)
    {
      uint64_t v12 = 0LL;
      goto LABEL_70;
    }
  }

  else {
    size_t v20 = v18 - v19;
  }
  if (!v20) {
    goto LABEL_31;
  }
  uint64_t v21 = (*(uint64_t (**)(uint64_t, unint64_t, size_t, uint64_t *, char *))(*(void *)v30 + 328LL))( v30,  *(void *)(a1 + 504) + a2,  v20,  &v34,  a5);
  if (!(_DWORD)v21)
  {
    if (v34 != v20)
    {
      uint64_t v12 = 5LL;
      goto LABEL_70;
    }

    goto LABEL_31;
  }

  uint64_t v12 = v21;
LABEL_70:
  int v13 = (pthread_rwlock_t *)(a1 + 208);
  if (v31) {
    free(v31);
  }
LABEL_12:
  pthread_rwlock_unlock(v13);
  if (a4) {
    *a4 = v33 - a3;
  }
  return v12;
}

uint64_t sub_18824FC9C(uint64_t a1, void *a2)
{
  if (!a2) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(void *)(a1 + 496);
  return result;
}

uint64_t sub_18824FCBC(void *a1, int64_t a2, size_t a3, void *a4, char *a5)
{
  uint64_t v10 = (*(uint64_t (**)(void *))(*a1 + 496LL))(a1);
  if (a4) {
    *a4 = 0LL;
  }
  int64_t v11 = (pthread_rwlock_t *)(a1 + 26);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 26));
  uint64_t v12 = a1[59];
  if (!(*(unsigned int (**)(void *))(*a1 + 568LL))(a1))
  {
    uint64_t v13 = 9LL;
    goto LABEL_38;
  }

  if (!a5)
  {
    uint64_t v13 = 22LL;
    goto LABEL_38;
  }

  size_t v25 = a3 + a2;
  if ((int64_t)(a3 + a2) > a1[62])
  {
    if ((*(unsigned int (**)(void *))(*a1 + 160LL))(a1))
    {
      if (a1[62] < a2) {
        (*(void (**)(void *, int64_t, uint64_t))(*a1 + 320LL))(a1, a2, 1LL);
      }
      uint64_t v13 = (*(uint64_t (**)(void *, size_t, void))(*a1 + 320LL))(a1, v25, 0LL);
      size_t v14 = a3;
      if ((_DWORD)v13) {
        goto LABEL_39;
      }
      goto LABEL_10;
    }

    uint64_t v13 = 29LL;
LABEL_38:
    size_t v14 = a3;
    goto LABEL_39;
  }

uint64_t sub_18824FFEC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 248LL))(result);
  }
  return result;
}

uint64_t sub_188250004(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 264LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_188250020(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 224LL))(result);
  }
  return result;
}

uint64_t sub_188250038(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 240LL))(v1);
  }
  else {
    return 999LL;
  }
}

CFDictionaryRef sub_188250054(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
  uint64_t v2 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (v1 && (CFMutableDictionaryRef Mutable = *(uint64_t (**(uint64_t))(*(void *)v1 + 464LL))(v1)) != 0LL
    || (uint64_t v4 = *v2, (Mutable = CFDictionaryCreateMutable(*v2, 0LL, MEMORY[0x189605240], MEMORY[0x189605250])) != 0LL))
  {
    uint64_t Value = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"owner-mode");
    if (Value)
    {
      int v6 = CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
      uint64_t v4 = *v2;
      if (v6)
      {
        valuePtr &= 0x1C0u;
        CFNumberRef v7 = CFNumberCreate(v4, kCFNumberSInt16Type, &valuePtr);
        if (v7) {
          goto LABEL_11;
        }
      }
    }

    else
    {
      uint64_t v4 = *v2;
    }
  }

  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v4, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    if (!Mutable) {
      return Mutable;
    }
  }

  __int16 valuePtr = 448;
  CFNumberRef v7 = CFNumberCreate(v4, kCFNumberSInt16Type, &valuePtr);
  if (v7)
  {
LABEL_11:
    CFNumberRef v8 = v7;
    CFDictionarySetValue(Mutable, @"owner-mode", v7);
    CFRelease(v8);
  }

  return Mutable;
}

uint64_t sub_188250188(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 184LL))(result);
  }
  return result;
}

uint64_t sub_1882501A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 344LL))(v1);
  }
  else {
    return 999LL;
  }
}

BOOL sub_1882501BC(_DWORD *a1)
{
  uint64_t v1 = (char *)a1 + 566;
  int v2 = a1[120];
  uint64_t v3 = 8LL;
  if (v2 == 1) {
    uint64_t v3 = 376LL;
  }
  if (*(_DWORD *)&v1[v3] != 91) {
    return 0LL;
  }
  uint64_t v4 = (_DWORD *)((char *)a1 + 642);
  if (v2 != 1) {
    uint64_t v4 = (_DWORD *)((char *)a1 + 566);
  }
  if (*v4 != -2147483647) {
    return 0LL;
  }
  BOOL v5 = v2 == 1;
  uint64_t v6 = 4LL;
  if (v5) {
    uint64_t v6 = 80LL;
  }
  return *(_DWORD *)&v1[v6] == 128;
}

uint64_t sub_188250224(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)a1 + 24LL))( a1,  @"use-filename-for-prompt");
  uint64_t v3 = *(void *)a1;
  if (v2) {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, const __CFString *))(v3 + 24))(a1, @"use-filename-for-prompt");
  }
  else {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(v3 + 192))(a1);
  }
  uint64_t v5 = v4;
  int v6 = DIGetBundleRef();
  CFNumberRef v7 = (const __CFString *)sub_1882660CC( v6,  (int)@"Enter password to access %1$@: ",  @"Enter password to access %1$@: ");
  CFNumberRef v8 = CFStringCreateWithFormat(0LL, 0LL, v7, v5);
  uint64_t v9 = (const char *)sub_18823A098(v8, 0x8000100u);
  uint64_t v10 = (char *)v9;
  if (!v9) {
    uint64_t v9 = "Enter password: ";
  }
  uint64_t v11 = sub_1882503D0(v9, __s, 1024, 1);
  if (!(_DWORD)v11)
  {
    size_t v12 = strlen(__s);
    uint64_t v11 = sub_1882617CC(a1, (uint64_t)__s, v12) ? 0LL : 80LL;
    if (v10) {
      free(v10);
    }
  }

  if (v8) {
    CFRelease(v8);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v11;
}

void sub_188250384(_Unwind_Exception *exception_object)
{
}

uint64_t sub_1882503D0(const char *a1, char *a2, int a3, int a4)
{
  uint64_t v6 = 22LL;
  if (a2 && a3 >= 2)
  {
    if (!a1) {
      a1 = "";
    }
    uint64_t v6 = *__error();
  }

  if (a2 && (_DWORD)v6) {
    bzero(a2, a3);
  }
  return v6;
}

const char *sub_188250458()
{
  return "CEncryptedEncoding";
}

uint64_t sub_188250464(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 496);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
  if (result)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v5 + 304LL))(v5, &v7);
    if (a2)
    {
      if (!(_DWORD)result)
      {
        if (*(_DWORD *)(a1 + 480) == 1) {
          unint64_t v6 = v7 - 1276;
        }
        else {
          unint64_t v6 = v7 - *(void *)(a1 + 504);
        }
        *a2 = v6 / *(void *)(a1 + 488) * *(void *)(a1 + 488);
      }
    }
  }

  return result;
}

void sub_188250504(_DWORD *a1, uint64_t a2, const __CFDictionary *a3)
{
  int v5 = (*(uint64_t (**)(_DWORD *))(*(void *)a1 + 696LL))(a1);
  if (v5) {
    sub_18824E974(v5, (uint64_t)"setBackingStore() failed");
  }
  int v6 = sub_188250680((uint64_t)a1);
  if (v6) {
    sub_18824E974(v6, (uint64_t)"loadHeaderAndKeys() failed");
  }
  int v7 = sub_18824D990();
  if (v7) {
    sub_18824E974(v7, (uint64_t)"DIEnableSecureMode() failed");
  }
  if (!a3)
  {
    if (a1[120] != 2)
    {
      uint64_t v9 = 0LL;
      goto LABEL_13;
    }

LABEL_17:
    size_t v12 = "unlock with passphrase failed";
    goto LABEL_20;
  }

  uint64_t Value = CFDictionaryGetValue(a3, @"recovery-key");
  uint64_t v9 = (const __CFString *)CFDictionaryGetValue(a3, @"passphrase");
  if (Value)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(Value))
    {
      size_t v12 = "recovery-key was not a CFStringRef";
      goto LABEL_20;
    }
  }

  if (v9)
  {
    CFTypeID v11 = CFStringGetTypeID();
    if (v11 == CFGetTypeID(v9)) {
      goto LABEL_13;
    }
    size_t v12 = "passphrase was not a CFStringRef";
LABEL_20:
    sub_18824E974(80, (uint64_t)v12);
  }

  if (a1[120] == 2) {
    goto LABEL_17;
  }
LABEL_13:
  sub_18824E918((uint64_t)a1, v9);
  sub_18824EDDC((uint64_t)a1);
}

uint64_t sub_18825063C(uint64_t a1, char *a2)
{
  uint64_t result = sub_18823CFEC(a1, a2);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)a2 + 296LL))(a2, a1 + 512);
  }
  return result;
}

uint64_t sub_188250680(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
  uint64_t v3 = sub_1882509A8(a1);
  if (!(_DWORD)v3)
  {
    if (*(_DWORD *)(a1 + 480) != 2) {
      return 0LL;
    }
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 272LL))(v2);
    if (!(_DWORD)v3)
    {
      uint64_t v4 = (unsigned int *)malloc(0x54uLL);
      if (!v4) {
        goto LABEL_15;
      }
      uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BYTE *, unsigned int *))(*(void *)v2 + 328LL))( v2,  72LL,  84LL,  v32,  v4);
      if ((_DWORD)v5)
      {
        uint64_t v3 = v5;
        goto LABEL_16;
      }

      unsigned int v7 = bswap32(*v4);
      if (v7 > 0x800)
      {
        uint64_t v3 = 107LL;
        goto LABEL_16;
      }

      uint64_t v8 = 20LL * v7 + 4;
      uint64_t v9 = (unsigned int *)realloc(v4, v8);
      if (!v9)
      {
LABEL_15:
        uint64_t v3 = 12LL;
        goto LABEL_16;
      }

      uint64_t v10 = v9;
      if (v7 >= 5)
      {
        uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BYTE *, unsigned int *))(*(void *)v2 + 328LL))( v2,  72LL,  v8,  v32,  v9);
        if ((_DWORD)v11)
        {
LABEL_14:
          uint64_t v3 = v11;
          goto LABEL_53;
        }
      }

      sub_18825810C(v10, v8);
      *(void *)(a1 + 536) = 0LL;
      unint64_t v12 = *v10;
      if ((_DWORD)v12)
      {
        unsigned int v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = (int *)(v10 + 1);
        uint64_t v16 = *v10;
        do
        {
          int v18 = *v15;
          v15 += 5;
          int v17 = v18;
          if (v18 == 2)
          {
            *(_DWORD *)(a1 + 536) = ++v14;
          }

          else if (v17 == 1)
          {
            *(_DWORD *)(a1 + 540) = ++v13;
          }

          --v16;
        }

        while (v16);
      }

      else
      {
        unsigned int v13 = 0;
        unsigned int v14 = 0;
      }

      BOOL v19 = malloc(564LL * v14);
      *(void *)(a1 + 520) = v19;
      if (!v19 || (unint64_t v20 = malloc(616LL * v13), (*(void *)(a1 + 528) = v20) == 0LL))
      {
        uint64_t v3 = 12LL;
        goto LABEL_53;
      }

      if (!v12)
      {
LABEL_44:
        if (v14)
        {
          uint64_t v28 = 0LL;
          unint64_t v29 = 0LL;
          do
          {
            sub_188261794(*(void *)(a1 + 520) + v28);
            ++v29;
            v28 += 564LL;
          }

          while (v29 < *(unsigned int *)(a1 + 536));
        }

        if (!*(_DWORD *)(a1 + 540))
        {
LABEL_51:
          uint64_t v3 = 0LL;
          goto LABEL_53;
        }

        uint64_t v30 = 0LL;
        unint64_t v31 = 0LL;
        while (1)
        {
          uint64_t v11 = sub_188258160(*(void *)(a1 + 528) + v30);
          if ((_DWORD)v11) {
            goto LABEL_14;
          }
          ++v31;
          v30 += 616LL;
        }
      }

      uint64_t v21 = 0LL;
      unsigned int v22 = 0;
      unsigned int v23 = 0;
      uint64_t v24 = v10 + 2;
      while (1)
      {
        int v25 = *((_DWORD *)v24 - 1);
        uint64_t v26 = *v24;
        uint64_t v27 = v24[1];
        if (v25 == 2) {
          break;
        }
        if (v25 == 1)
        {
          if (v27 != 616) {
            goto LABEL_54;
          }
          uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BYTE *, uint64_t))(*(void *)v2 + 328LL))( v2,  v26,  616LL,  v32,  *(void *)(a1 + 528) + 616LL * v22);
          if (!(_DWORD)v3) {
            ++v22;
          }
LABEL_40:
          if ((_DWORD)v3) {
            goto LABEL_53;
          }
          unint64_t v12 = *v10;
        }

        uint64_t v24 = (void *)((char *)v24 + 20);
        if (++v21 >= v12)
        {
          unsigned int v14 = *(_DWORD *)(a1 + 536);
          goto LABEL_44;
        }
      }

      if (v27 != 564)
      {
LABEL_54:
        uint64_t v3 = 107LL;
LABEL_53:
        uint64_t v4 = v10;
LABEL_16:
        (*(void (**)(uint64_t, void))(*(void *)v2 + 280LL))(v2, 0LL);
        if (v4) {
          free(v4);
        }
        return v3;
      }

      uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BYTE *, uint64_t))(*(void *)v2 + 328LL))( v2,  v26,  564LL,  v32,  *(void *)(a1 + 520) + 564LL * v23);
      if (!(_DWORD)v3) {
        ++v23;
      }
      goto LABEL_40;
    }
  }

  return v3;
}

uint64_t sub_1882509A8(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 272LL))(v2);
  if (!(_DWORD)v3)
  {
    uint64_t v3 = (*(uint64_t (**)(uint64_t, unint64_t *))(*(void *)v2 + 296LL))(v2, &v11);
    if ((_DWORD)v3)
    {
LABEL_3:
      (*(void (**)(uint64_t, void))(*(void *)v2 + 280LL))(v2, 0LL);
      return v3;
    }

    if ((v11 & 0x8000000000000000LL) == 0)
    {
      if (v11 >= 0x4FC)
      {
        uint64_t v3 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, _BYTE *, uint64_t))(*(void *)v2 + 328LL))( v2,  v11 - 1276,  1276LL,  v12,  a1 + 546);
        if ((_DWORD)v3) {
          goto LABEL_3;
        }
        if (!sub_18823C7C0(a1 + 546)
          && *(_DWORD *)(a1 + 1818) == 1701733234
          && *(_DWORD *)(a1 + 1814) == 1667527521
          && *(_DWORD *)(a1 + 1810) == 1)
        {
          uint64_t v5 = 0LL;
          *(_DWORD *)(a1 + 480) = 1;
          uint64_t v6 = *(unsigned int *)(a1 + 562);
          uint64_t v7 = *(void *)(a1 + 1802);
LABEL_19:
          *(void *)(a1 + 488) = v6;
          *(void *)(a1 + 496) = v7;
          *(void *)(a1 + 504) = v5;
          CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, (const void *)(a1 + 488));
          if (v8)
          {
            CFNumberRef v9 = v8;
            (*(void (**)(uint64_t, const __CFString *, CFNumberRef))(*(void *)a1 + 32LL))( a1,  @"bs-proxy-encoding-blocksize",  v8);
            CFRelease(v9);
          }

          uint64_t v10 = malloc(32LL * *(void *)(a1 + 488));
          *(void *)(a1 + 472) = v10;
          if (v10) {
            uint64_t v3 = 0LL;
          }
          else {
            uint64_t v3 = 12LL;
          }
          goto LABEL_3;
        }
      }

      uint64_t v3 = (*(uint64_t (**)(uint64_t, void, uint64_t, _BYTE *, uint64_t))(*(void *)v2 + 328LL))( v2,  0LL,  72LL,  v12,  a1 + 546);
      if ((_DWORD)v3) {
        goto LABEL_3;
      }
      uint64_t v3 = sub_18823C890(a1 + 546);
      if ((_DWORD)v3) {
        goto LABEL_3;
      }
      if (*(_DWORD *)(a1 + 546) != 1701733234 || *(_DWORD *)(a1 + 550) != 1667527521)
      {
        uint64_t v3 = 110LL;
        goto LABEL_3;
      }

      if (*(_DWORD *)(a1 + 554) == 2)
      {
        *(_DWORD *)(a1 + 480) = 2;
        uint64_t v6 = *(unsigned int *)(a1 + 598);
        uint64_t v7 = *(void *)(a1 + 602);
        uint64_t v5 = *(void *)(a1 + 610);
        goto LABEL_19;
      }
    }

    uint64_t v3 = 107LL;
    goto LABEL_3;
  }

  return v3;
}

uint64_t sub_188250BBC( const __CFURL *a1, CFDictionaryRef theDict, unsigned int (*a3)(void, void, void, void, void, void), uint64_t a4, char **a5, void *a6)
{
  uint64_t v6 = a6;
  unint64_t v11 = a1;
  uint64_t v43 = *MEMORY[0x1895F89C0];
  uint64_t v40 = 0LL;
  off_t valuePtr = 0LL;
  __int16 v39 = 0;
  if (a6) {
    *a6 = 0LL;
  }
  if (!a5) {
    return 22LL;
  }
  *a5 = 0LL;
  if (!a1) {
    return 22LL;
  }
  if (theDict)
  {
    uint64_t Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"size");
    if (Value && !CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr)) {
      off_t valuePtr = 0LL;
    }
    unsigned int v13 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"max-size");
    if (v13)
    {
      if (!CFNumberGetValue(v13, kCFNumberSInt64Type, &v40)) {
        goto LABEL_12;
      }
    }
  }

  if (!v40) {
LABEL_12:
  }
    uint64_t v40 = valuePtr;
  unsigned int v14 = sub_18823A054(v11);
  if (!v14) {
    return 999LL;
  }
  uint64_t v15 = (char *)v14;
  int v16 = sub_18823B6E8(v15, 3586, 0, 438LL);
  if (v16 < 0)
  {
    uint64_t v17 = *__error();
    if ((_DWORD)v17)
    {
      if (v16 != -1) {
        close(v16);
      }
      goto LABEL_50;
    }
  }

  if (theDict)
  {
    v42.f_bsize = sub_188245AE8(theDict, @"file-type", 0LL);
    LODWORD(v18) = sub_188245AE8(theDict, @"file-creator", 0LL);
    float v38 = v18;
    if (!v42.f_bsize || v18 == 0.0)
    {
      if (v42.f_bsize)
      {
        BOOL v19 = &v42;
        uint64_t v21 = v15;
        unint64_t v20 = 0LL;
      }

      else
      {
        if (v18 == 0.0) {
          goto LABEL_29;
        }
        unint64_t v20 = (unsigned int *)&v38;
        uint64_t v21 = v15;
        BOOL v19 = 0LL;
      }
    }

    else
    {
      BOOL v19 = &v42;
      unint64_t v20 = (unsigned int *)&v38;
      uint64_t v21 = v15;
    }

    if ((sub_18825AF9C(v21, &v19->f_bsize, v20) & 0x80000000) != 0)
    {
      uint64_t v17 = *__error();
      if ((_DWORD)v17) {
        goto LABEL_69;
      }
    }
  }

LABEL_29:
  unsigned int v22 = sub_188245BBC(v15, theDict);
  if ((_DWORD)v22)
  {
    uint64_t v17 = (uint64_t)v22;
LABEL_69:
    uint64_t v26 = 0LL;
    goto LABEL_34;
  }

  uint64_t v23 = v40;
  int v24 = statfs(v15, &v42);
  int64_t v25 = v42.f_bavail * v42.f_bsize;
  if (v24) {
    int64_t v25 = v23;
  }
  if (v40 > v25)
  {
    uint64_t v26 = 0LL;
    uint64_t v17 = 28LL;
    goto LABEL_34;
  }

  uint64_t v37 = a4;
  sub_188245CE4(v15, (_BYTE *)&v39 + 1, &v39);
  if (v40 && HIBYTE(v39)) {
    sub_1882534A4(v16, v40);
  }
  uint64_t v26 = 0LL;
  if (a3 && valuePtr && !(_BYTE)v39)
  {
    if (sub_188239FB0(theDict, @"skip-zeroing", 0))
    {
      uint64_t v26 = 0LL;
    }

    else
    {
      uint64_t v34 = v11;
      int64_t v35 = v6;
      fcntl(v16, 48, 1LL);
      uint64_t v26 = calloc(0x100000uLL, 1uLL);
      if (!v26)
      {
        uint64_t v17 = 12LL;
        goto LABEL_34;
      }

      float v38 = 0.0;
      unsigned int v36 = a3;
      a3(1LL, v37, &v38, 0LL, 0LL, 0LL);
      lseek(v16, 0LL, 0);
      uint64_t v28 = valuePtr;
      time_t v29 = time(0LL);
      if (v28)
      {
        off_t v30 = 0LL;
        time_t v31 = v29 - 1;
        while (1)
        {
          size_t v32 = v28 >= 0x100000 ? 0x100000LL : v28;
          ssize_t v33 = pwrite(v16, v26, v32, v30);
          if (v33 < 0)
          {
            uint64_t v17 = *__error();
            if ((_DWORD)v17) {
              goto LABEL_34;
            }
          }

          v28 -= v33;
          if (v28 < 1) {
            break;
          }
          v30 += v33;
          if (time((time_t *)&v42) > v31)
          {
            float v38 = (float)((float)v30 * 100.0) / (float)valuePtr;
            v36(1LL, v37, &v38, 0LL, 0LL, 0LL);
            if (v36(2LL, v37, 0LL, 0LL, 0LL, 0LL)) {
              goto LABEL_65;
            }
            time_t v31 = *(void *)&v42.f_bsize;
          }
        }
      }

      float v38 = 100.0;
      v36(1LL, v37, &v38, 0LL, 0LL, 0LL);
      if (v36(2LL, v37, 0LL, 0LL, 0LL, 0LL))
      {
LABEL_65:
        uint64_t v17 = 111LL;
        goto LABEL_34;
      }

      float v38 = -1.0;
      v36(1LL, v37, &v38, 0LL, 0LL, 0LL);
      unint64_t v11 = v34;
      uint64_t v6 = v35;
    }
  }

  if (sub_188239FB0(theDict, @"skip-file-size-set", 0)
    || (ftruncate(v16, valuePtr) & 0x80000000) == 0
    || (uint64_t v17 = *__error(), !(_DWORD)v17))
  {
    close(v16);
    uint64_t v17 = sub_18823A1E4(v11, theDict, a5, v6);
    if (!(_DWORD)v17) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }

  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v19) {
    CFRelease(v19);
  }
  return v12;
}

LABEL_34:
  if (v16 != -1) {
    close(v16);
  }
LABEL_48:
  unlink(v15);
LABEL_49:
  free(v15);
  uint64_t v15 = (char *)v26;
  if (v26) {
LABEL_50:
  }
    free(v15);
  return v17;
}

uint64_t sub_1882510B8(const __CFArray *a1, CFArrayRef theArray)
{
  int Count = CFArrayGetCount(theArray);
  CFIndex v5 = CFArrayGetCount(a1);
  uint64_t result = 0LL;
  if (a1 && theArray && Count > 0)
  {
    CFIndex v7 = 0LL;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v7);
      if (ValueAtIndex)
      {
        v9.location = 0LL;
        v9.CFIndex length = v5;
        if (CFArrayContainsValue(a1, v9, ValueAtIndex)) {
          break;
        }
      }

      if (Count == ++v7) {
        return 0LL;
      }
    }

    return 1LL;
  }

  return result;
}

uint64_t sub_188251160()
{
  return 0LL;
}

__CFDictionary *sub_188251168(uint64_t a1, uint64_t a2, int a3, unsigned int a4, int a5)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v10 = (const char *)(a2 + 48);
  if (strnlen((const char *)(a2 + 48), 0x20uLL) >= 0x20)
  {
    if (*(_BYTE *)(a2 + 79)) {
      return 0LL;
    }
  }

  uint64_t v11 = bswap32(*(_DWORD *)(a2 + 8)) * (unint64_t)(a4 >> 9);
  uint64_t v12 = bswap32(*(_DWORD *)(a2 + 12)) * (unint64_t)(a4 >> 9);
  if (a5)
  {
    uint64_t v13 = sub_18824A018(a1);
    if (v12 + v11 > (*(uint64_t (**)(uint64_t))(*(void *)v13 + 96LL))(v13))
    {
      uint64_t v14 = sub_18824A018(a1);
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 96LL))(v14) - v11;
    }
  }

  uint64_t v15 = sub_188251440();
  int v16 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (!v15) {
    goto LABEL_14;
  }
  uint64_t v17 = (const __CFDictionary *)v15;
  CFStringRef v18 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], v10, 0);
  if (!v18) {
    return 0LL;
  }
  CFStringRef v19 = v18;
  uint64_t Value = (const __CFString *)CFDictionaryGetValue(v17, v18);
  if (!Value)
  {
    CFRelease(v19);
LABEL_14:
    CFStringRef v21 = CFStringCreateWithCString(v16, v10, 0);
    if (v21) {
      goto LABEL_15;
    }
    return 0LL;
  }

  CFStringRef v21 = Value;
  CFRetain(Value);
  CFRelease(v19);
LABEL_15:
  unsigned int v22 = (const char *)(a2 + 15);
  do
    int v23 = *(unsigned __int8 *)++v22;
  while (v23 == 32);
  CFStringRef v24 = CFStringCreateWithCString(v16, v22, 0);
  if (!v24
    || CFStringCompare(v21, @"Apple_Free", 1uLL) == kCFCompareEqualTo
    || (uint64_t v27 = sub_18824A300(v11, v12, a3, v21, v24, 0LL, v25, v26)) == 0LL)
  {
    if (v21) {
      CFRelease(v21);
    }
    if (v24) {
      CFRelease(v24);
    }
    return 0LL;
  }

  uint64_t v28 = v27;
  uint64_t v37 = 0LL;
  time_t v29 = (char *)sub_18824A018(a1);
  int v30 = sub_188249164(v29, v11, v12, &v37);
  time_t v31 = v37;
  if (!v30 && v37)
  {
    size_t v32 = sub_18824A348();
    if (v32)
    {
      ssize_t v33 = v32;
      CFDictionarySetValue(v28, @"partition-filesystems", v32);
      CFRelease(v33);
    }

    time_t v31 = v37;
  }

  if (v31) {
    DIDiskImageObjectRelease(v31);
  }
  if (*(_DWORD *)(a2 + 508))
  {
    CFStringRef v34 = CFStringCreateWithFormat(v16, 0LL, @"%4.4s", a2 + 508);
    CFDictionarySetValue(v28, @"toast-signature", v34);
    CFRelease(v34);
  }

  if (*(_DWORD *)(a2 + 296))
  {
    CFStringRef v35 = CFStringCreateWithFormat(v16, 0LL, @"%4.4s", a2 + 296);
    CFDictionarySetValue(v28, @"drive-setup-signature", v35);
    CFRelease(v35);
  }

  CFRelease(v21);
  CFRelease(v24);
  return v28;
}

uint64_t sub_188251440()
{
  uint64_t result = qword_18C7034C0;
  if (!qword_18C7034C0)
  {
    uint64_t v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v2 = CFDataCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const UInt8 *)"<?xml version=1.0 encoding=UTF-8?>\n <!DOCTYPE plist PUBLIC -//Apple//DTD PLIST 1.0//EN http://www.apple.com/DTDs/PropertyLis t-1.0.dtd>\n <plist version=1.0>\n <dict>\n </dict>\n </plist>\n",  188LL);
    if (v2)
    {
      uint64_t v3 = v2;
      qword_18C7034C0 = (uint64_t)CFPropertyListCreateWithData(v1, v2, 0LL, 0LL, 0LL);
      CFRelease(v3);
    }

    return qword_18C7034C0;
  }

  return result;
}

CFStringRef sub_1882514BC()
{
  return @"Apple";
}

UInt8 *sub_1882514CC(int *a1)
{
  uint64_t v2 = (UInt8 *)qword_18C7034D0;
  if (qword_18C7034D0) {
    return sub_188251520(a1, 0, v2, 80);
  }
  uint64_t result = (UInt8 *)malloc(0x50uLL);
  uint64_t v2 = result;
  qword_18C7034D0 = (uint64_t)result;
  if (result) {
    return sub_188251520(a1, 0, v2, 80);
  }
  return result;
}

UInt8 *sub_188251520(int *a1, char a2, UInt8 *a3, int a4)
{
  uint64_t v6 = sub_1882515C0(a1, a2);
  if (!v6) {
    return 0LL;
  }
  CFIndex v7 = v6;
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0LL, v6, 0x8000100u, 0x3Fu);
  CFRelease(v7);
  if (!ExternalRepresentation) {
    return 0LL;
  }
  CFIndex Length = CFDataGetLength(ExternalRepresentation);
  if (Length >= a4) {
    CFIndex v10 = a4 - 1;
  }
  else {
    CFIndex v10 = Length;
  }
  v12.location = 0LL;
  v12.CFIndex length = v10;
  CFDataGetBytes(ExternalRepresentation, v12, a3);
  a3[v10] = 0;
  CFRelease(ExternalRepresentation);
  return a3;
}

CFStringRef sub_1882515C0(int *a1, char a2)
{
  uint64_t v3 = a1;
  if ((_DWORD)a1 == -1 && (a2 & 1) == 0) {
    LODWORD(a1) = *__error();
  }
  if (a1 >= 0x6B)
  {
    if ((a2 & 2) == 0)
    {
      uint64_t v9 = 0LL;
      int v10 = -19;
      do
      {
        if ((_DWORD)a1 == v10)
        {
          a1 = (int *)((char *)&unk_18826D150 + v9 + 4);
          goto LABEL_25;
        }

        int v10 = *(_DWORD *)((char *)&unk_18826D150 + v9 + 8);
        v9 += 8LL;
      }

      while (v9 != 192);
      if ((a1 & 0x80000000) != 0 && *__error() && *__error() != 2 && *__error() != 1)
      {
        a1 = __error();
LABEL_25:
        LODWORD(a1) = *a1;
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    uint64_t v4 = strerror((int)a1);
    CFStringRef v5 = CFStringCreateWithCString(0LL, v4, 0x8000100u);
    if (v5)
    {
      CFStringRef v6 = v5;
      CFTypeRef v7 = CFRetain(v5);
      CFRelease(v6);
      return (const __CFString *)v7;
    }
  }

  if ((a2 & 4) != 0) {
    return 0LL;
  }
  else {
    uint64_t v11 = @"error %1$#x";
  }
  CFRange v12 = (const __CFString *)CFRetain(v11);
  CFStringRef v13 = CFStringCreateWithFormat(0LL, 0LL, v12, v3);
  CFRelease(v12);
  if (v13) {
    return v13;
  }
  else {
    return &stru_18A20E810;
  }
}

uint64_t sub_18825172C()
{
  return 0LL;
}

uint64_t sub_188251734()
{
  return 0LL;
}

uint64_t sub_18825173C(uint64_t a1, uint64_t a2, char **a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  if (!a1) {
    return 22LL;
  }
  CFNumberRef v8 = (char *)operator new(0x170uLL);
  sub_1882517F0((uint64_t)v8);
  uint64_t v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)v8 + 560LL))(v8, a1, a2);
  if ((_DWORD)v9)
  {
    DIDiskImageObjectRelease(v8);
    CFNumberRef v8 = 0LL;
  }

  *a3 = v8;
  if (a4) {
    *a4 = 0LL;
  }
  return v9;
}

void sub_1882517DC(_Unwind_Exception *a1)
{
}

uint64_t sub_1882517F0(uint64_t a1)
{
  uint64_t v2 = sub_18823DDF4(a1);
  *(void *)uint64_t v2 = off_18A20BBF0;
  *(void *)(v2 + 160) = 0LL;
  pthread_rwlock_init((pthread_rwlock_t *)(v2 + 168), 0LL);
  (*(void (**)(uint64_t, const __CFString *, void))(*(void *)a1 + 32LL))( a1,  @"thread-safe",  *MEMORY[0x189604DE8]);
  return a1;
}

void sub_188251854(_Unwind_Exception *a1)
{
}

uint64_t sub_18825186C(char *a1, void *a2, char a3)
{
  CFStringRef v6 = operator new(0x80uLL);
  *CFStringRef v6 = off_18A20BE58;
  v6[1] = 0LL;
  *((_DWORD *)v6 + 4) = 0;
  v6[12] = 0LL;
  *((_DWORD *)v6 + 8) = 0;
  v6[5] = 0LL;
  v6[6] = 0LL;
  *((_DWORD *)v6 + 14) = 0;
  v6[9] = 0LL;
  v6[10] = 0LL;
  *((_WORD *)v6 + 52) = 1;
  *((_BYTE *)v6 + 106) = 1;
  v6[14] = 0LL;
  CFTypeRef v7 = v6 + 14;
  v6[15] = 0LL;
  v6[3] = a1;
  DIDiskImageObjectRetain_0(a1);
  *((_BYTE *)v6 + 104) = a3;
  uint64_t v8 = (*(uint64_t (**)(char *))(*(void *)a1 + 272LL))(a1);
  if ((_DWORD)v8)
  {
    uint64_t v12 = v8;
    BOOL v9 = 0;
  }

  else if ((*(unsigned int (**)(char *))(*(void *)a1 + 72LL))(a1) {
         && (BOOL v9 = 1, v10 = (*(uint64_t (**)(char *, uint64_t))(*(void *)a1 + 168LL))(a1, 1LL), (_DWORD)v10))
  }
  {
    uint64_t v12 = v10;
  }

  else
  {
    *CFTypeRef v7 = 0LL;
    v6[15] = 0LL;
    uint64_t v11 = (*(uint64_t (**)(void, void *))(*(void *)v6[3] + 296LL))(v6[3], v7);
    if ((_DWORD)v11 || (v6[15] = v6[14], uint64_t v11 = (*(uint64_t (**)(void *))(*v6 + 112LL))(v6), (_DWORD)v11))
    {
      uint64_t v12 = v11;
      BOOL v9 = 1;
    }

    else
    {
      uint64_t v12 = sub_188251FEC((uint64_t)v6);
      BOOL v9 = v12 != 0;
    }
  }

  if (!*((_BYTE *)v6 + 104) || !*((_BYTE *)v6 + 105)) {
    goto LABEL_22;
  }
  CFStringRef v13 = (const __CFURL *)(*(uint64_t (**)(char *))(*(void *)a1 + 176LL))(a1);
  if (!v13)
  {
    uint64_t v15 = 0LL;
    goto LABEL_14;
  }

  uint64_t v14 = (const __CFString *)sub_188243D00(v13);
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_14:
    int v16 = 0LL;
    char v17 = 1;
    goto LABEL_15;
  }

  int v16 = sub_18823A098(v14, 0x8000100u);
  char v17 = 0;
LABEL_15:
  if (*((_BYTE *)v6 + 106)) {
    sub_18825E874("\x1B[32m\x1B[1mThe sparse disk image %s was repaired.\x1B[0m");
  }
  else {
    sub_18825E874("\x1B[31m\x1B[1mThe sparse disk image %s was not repaired.\x1B[0m");
  }
  if (v16) {
    free(v16);
  }
  if ((v17 & 1) == 0) {
    CFRelease(v15);
  }
LABEL_22:
  if (v9) {
    (*(void (**)(char *, void))(*(void *)a1 + 280LL))(a1, 0LL);
  }
  if ((_DWORD)v12)
  {
    (*(void (**)(void *))(*v6 + 8LL))(v6);
    CFStringRef v6 = 0LL;
  }

  *a2 = v6;
  return v12;
}

uint64_t sub_188251A94(void *a1)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  (*(void (**)(void *))(*a1 + 128LL))(a1);
  unint64_t v2 = a1[14];
  uint64_t result = sub_18823D738(a1[3], (uint64_t)v36, 64LL);
  if ((_DWORD)result) {
    return result;
  }
  int v4 = v37;
  if ((v37 - 1) >= 2)
  {
    if (v37 == 3)
    {
      a1[5] = v40;
      *((_DWORD *)a1 + 12) = v38;
      *((_DWORD *)a1 + 22) = 3;
      goto LABEL_9;
    }
  }

  else
  {
    a1[5] = v39;
  }

  *((_DWORD *)a1 + 12) = v38;
  *((_DWORD *)a1 + 22) = v4;
  if (v4 == 1)
  {
    unint64_t v5 = 512LL;
    goto LABEL_11;
  }

  if (v4 == 2)
  {
LABEL_9:
    unint64_t v5 = 4096LL;
LABEL_11:
    a1[8] = v5;
    goto LABEL_13;
  }

  unint64_t v5 = a1[8];
LABEL_13:
  *(int32x2_t *)((char *)a1 + 52) = vshrn_n_s64(vaddq_s64(vdupq_n_s64(v5), (int64x2_t)xmmword_18826CE70), 2uLL);
  size_t v6 = (*(uint64_t (**)(void *))(*a1 + 80LL))(a1);
  CFTypeRef v7 = malloc(v6);
  a1[9] = v7;
  if (!v7) {
    return 12LL;
  }
  uint64_t v8 = (uint64_t)v7;
  uint64_t v9 = a1[3];
  uint64_t v10 = (*(uint64_t (**)(void *))(*a1 + 80LL))(a1);
  uint64_t result = sub_18823D738(v9, v8, v10);
  if (!(_DWORD)result)
  {
    uint64_t v11 = a1[9];
    int v12 = *(_DWORD *)(v11 + 12);
    *(_DWORD *)(v11 + 12) = v12 & 0xFFFFFFFE;
    if (*(_DWORD *)(v11 + 4) == 2)
    {
      *(_DWORD *)(v11 + 4) = 3;
      *(void *)(v11 + 28) = *(unsigned int *)(v11 + 16);
      *(_DWORD *)(v11 + 12) = v12 | 1;
    }

    uint64_t v13 = *(void *)(v11 + 20);
    if (v13)
    {
      uint64_t v14 = (*(uint64_t (**)(void *))(*a1 + 80LL))(a1);
      uint64_t v15 = (*(unsigned int (**)(void *))(*a1 + 88LL))(a1);
      uint64_t v16 = v14 + ((v15 * (*(uint64_t (**)(void *))(*a1 + 64LL))(a1)) << 9);
      if ((*(uint64_t (**)(void *))(*a1 + 80LL))(a1) + v13 <= v2 && v13 == v16)
      {
        while (1)
        {
          size_t v17 = (*(uint64_t (**)(void *))(*a1 + 80LL))(a1);
          CFStringRef v18 = (void *)a1[10];
          if (v18)
          {
            CFStringRef v19 = (char *)realloc(v18, v17 * (*((_DWORD *)a1 + 8) + 1));
            if (!v19) {
              return 12LL;
            }
            unint64_t v20 = v19;
            a1[10] = v19;
          }

          else
          {
            unint64_t v20 = (char *)malloc(v17);
            a1[10] = v20;
            if (!v20)
            {
              *((_DWORD *)a1 + 8) = 0;
              return 12LL;
            }
          }

          uint64_t v21 = *((unsigned int *)a1 + 8);
          *((_DWORD *)a1 + 8) = v21 + 1;
          if ((_DWORD)v21 == -1) {
            unsigned int v22 = 0LL;
          }
          else {
            unsigned int v22 = &v20[(*(uint64_t (**)(void *))(*a1 + 80LL))(a1) * v21];
          }
          bzero(v22, v17);
          uint64_t result = sub_18825E8A4((void **)a1, v13, (uint64_t)v22);
          if ((_DWORD)result) {
            return result;
          }
          if (*(_DWORD *)v22 != 1936749171) {
            break;
          }
          *((_DWORD *)v22 + 2) &= ~1u;
          uint64_t v23 = *(void *)(v22 + 12);
          if (!v23) {
            return 0LL;
          }
          uint64_t v24 = (*(uint64_t (**)(void *))(*a1 + 80LL))(a1) + v13;
          uint64_t v25 = (*(unsigned int (**)(void *))(*a1 + 96LL))(a1);
          uint64_t v26 = v24 + ((v25 * (*(uint64_t (**)(void *))(*a1 + 64LL))(a1)) << 9);
          if ((*(uint64_t (**)(void *))(*a1 + 80LL))(a1) + v23 <= v2)
          {
            uint64_t v13 = v23;
            if (v23 == v26) {
              continue;
            }
          }

          uint64_t v27 = v22 + 12;
          sub_18825E874( "\x1B[33mCSparseFile::loadHeaderAndIndexNodes: #%d i-node's i-node link is out of bounds.\x1B[0m",  *((_DWORD *)a1 + 8));
          sub_18825E92C((uint64_t)a1, (uint64_t)v22, 0);
          int v28 = (*(uint64_t (**)(void *))(*a1 + 80LL))(a1);
          sub_18825E874("\x1B[33mi-node offset %qd + node size %d should be <= logEOF %qd.\x1B[0m", v23, v28, v2);
          sub_18825E874("\x1B[33mi-node offset %qd should be == expected offset %qd.\x1B[0m", v23, v26);
          sub_18825E874("\x1B[33mremoving previous i-node's i-node link.\x1B[0m");
          *((_DWORD *)v22 + 2) |= 1u;
          goto LABEL_35;
        }

        sub_18825E874( "\x1B[33mCSparseFile::loadHeaderAndIndexNodes: #%d i-node is invalid.\x1B[0m",  *((_DWORD *)a1 + 8));
        sub_18825E92C((uint64_t)a1, (uint64_t)v22, 0);
        int v31 = *((_DWORD *)a1 + 8) - 1;
        *((_DWORD *)a1 + 8) = v31;
        if (v31)
        {
          sub_18825E874("\x1B[33mremoving previous i-node's i-node link.\x1B[0m");
          size_t v32 = (char *)realloc((void *)a1[10], v17 * *((unsigned int *)a1 + 8));
          a1[10] = v32;
          uint64_t v33 = (*((_DWORD *)a1 + 8) - 1);
          CFStringRef v34 = &v32[(*(uint64_t (**)(void *))(*a1 + 80LL))(a1) * v33];
          *((_DWORD *)v34 + 2) |= 1u;
          uint64_t v27 = v34 + 12;
          goto LABEL_35;
        }

        sub_18825E874("\x1B[33mremoving h-node's i-node link.\x1B[0m");
        CFStringRef v35 = (void *)a1[10];
        if (v35)
        {
          free(v35);
          a1[10] = 0LL;
        }
      }

      else
      {
        sub_18825E874("\x1B[33mCSparseFile::loadHeaderAndIndexNodes: h-node's i-node link is invalid.\x1B[0m");
        int v29 = (*(uint64_t (**)(void *))(*a1 + 80LL))(a1);
        sub_18825E874("\x1B[33mi-node offset %qd + node size %d should be <= logEOF %qd.\x1B[0m", v13, v29, v2);
        sub_18825E874("\x1B[33mi-node offset %qd should be == expected offset %qd.\x1B[0m", v13, v16);
        sub_18825E874("\x1B[33mremoving h-node's i-node link.\x1B[0m");
      }

      uint64_t v30 = a1[9];
      *(_DWORD *)(v30 + 12) |= 1u;
      uint64_t v27 = (void *)(v30 + 20);
LABEL_35:
      void *v27 = 0LL;
      *((_BYTE *)a1 + 105) = 1;
      (*(void (**)(void, uint64_t))(*(void *)a1[3] + 472LL))(a1[3], 1LL);
    }

    return 0LL;
  }

  return result;
}

void sub_188251FA4(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 72);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 72) = 0LL;
  }

  uint64_t v3 = *(void **)(a1 + 80);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 80) = 0LL;
  }

  *(_DWORD *)(a1 + 32) = 0;
}

uint64_t sub_188251FE4(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t sub_188251FEC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
  unint64_t v5 = *(void **)(a1 + 8);
  if (v5)
  {
    free(v5);
    *(void *)(a1 + 8) = 0LL;
  }

  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  *(_DWORD *)(a1 + 16) = v6 / (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
  unsigned int v9 = *(_DWORD *)(a1 + 16);
  if (v7 % v8) {
    *(_DWORD *)(a1 + 16) = ++v9;
  }
  uint64_t v10 = calloc(v9, 8uLL);
  *(void *)(a1 + 8) = v10;
  if (!v10) {
    return 12LL;
  }
  uint64_t v11 = v3 << 9;
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 88LL))(a1))
  {
    uint64_t v13 = 16LL;
    while (1)
    {
      uint64_t v14 = *(void *)(a1 + 72);
      unsigned int v15 = *(_DWORD *)(v14 + 4 * v13);
      if (v15 != -1)
      {
        if (!v15 && *(void *)(v14 + 20))
        {
          sub_18825E874("\x1B[33mCSparseFile::generateSparseTable: h-node has no more bands but i-node link is non-zero.\x1B[0m");
          sub_18825E874("\x1B[33mzeroing i-node link.\x1B[0m");
          uint64_t v35 = *(void *)(a1 + 72);
          CFStringRef v34 = *(void **)(a1 + 80);
          *(void *)(v35 + 20) = 0LL;
          *(_DWORD *)(v35 + 12) |= 1u;
          *(_DWORD *)(a1 + 32) = 0;
          if (v34)
          {
            free(v34);
            *(void *)(a1 + 80) = 0LL;
          }

          goto LABEL_57;
        }

        unsigned int v16 = *(_DWORD *)(a1 + 16);
        if (v15 <= v16)
        {
          if (!v15) {
            goto LABEL_57;
          }
          uint64_t v18 = v4 + v11;
          if (v4 + v11 > v2) {
            goto LABEL_52;
          }
          uint64_t v19 = *(void *)(a1 + 8);
          if (v19 && *(void *)(v19 + 8LL * (v15 - 1)))
          {
            sub_18825E874( "\x1B[33mCSparseFile::generateSparseTable: h-node %u-th slot (band %u) is a duplicate band reference.\x1B[0m",  v13 - 16,  v15);
            sub_18825E874("\x1B[33msparing %u-th slot.\x1B[0m", v13 - 16);
            uint64_t v20 = *(void *)(a1 + 72);
            *(_DWORD *)(v20 + 4 * v13) = -1;
            *(_DWORD *)(v20 + 12) |= 1u;
          }

          else
          {
            uint64_t v21 = *(void *)(a1 + 8);
            if (!v21 || *(_DWORD *)(a1 + 16) < v15) {
              return 999LL;
            }
            *(void *)(v21 + 8LL * (v15 - 1)) = v12;
          }

          goto LABEL_23;
        }

        sub_18825E874( "\x1B[33mCSparseFile::generateSparseTable: h-node %u-th slot (band %u) is out of bounds (should be <= %u).\x1B[0m",  v13 - 16,  v15,  v16);
        sub_18825E874("\x1B[33msparing %u-th slot.\x1B[0m", v13 - 16);
        uint64_t v17 = *(void *)(a1 + 72);
        *(_DWORD *)(v17 + 4 * v13) = -1;
        *(_DWORD *)(v17 + 12) |= 1u;
      }

      uint64_t v18 = v4 + v11;
      if (v4 + v11 > v2)
      {
        unsigned int v15 = -1;
LABEL_52:
        sub_18825E874( "\x1B[33mCSparseFile::generateSparseTable: h-node %u-th slot (band %u) ending offset %qd is too large (should b e <= %qd).\x1B[0m",  v13 - 16,  v15,  v18,  v2);
        sub_18825E874("\x1B[33mmarking %u-th slot unused.\x1B[0m", v13 - 16);
        uint64_t v33 = *(void *)(a1 + 72);
        *(_DWORD *)(v33 + 4 * v13) = 0;
        *(_DWORD *)(v33 + 12) |= 1u;
        goto LABEL_57;
      }

LABEL_39:
    v4 += v11;
    if (v18 + v11 > v2)
    {
      sub_18825E874( "\x1B[33mCSparseFile::generateSparseTable: #%u i-node %u-th slot (band %u) ending offset %qd is too large (should be <= %qd).\x1B[0m",  v24,  v27,  v29,  v18 + v11,  v2);
      sub_18825E874("\x1B[33mmarking %u-th slot unused.\x1B[0m", v27);
      *(_DWORD *)(v26 + 4 * v27 + 56) = 0;
      *(_DWORD *)(v26 + 8) |= 1u;
      goto LABEL_56;
    }

    if (v29 != -1)
    {
      uint64_t v31 = *(void *)(a1 + 8);
      if (v31 && *(_DWORD *)(a1 + 16) >= v29 && *(void *)(v31 + 8LL * (v29 - 1)))
      {
        sub_18825E874( "\x1B[33mCSparseFile::generateSparseTable: #%u i-node %u-th slot (band %u) is a duplicate band reference.\x1B[0m",  v24,  v27,  v29);
        sub_18825E874("\x1B[33msparing %u-th slot.\x1B[0m", v27);
        *(_DWORD *)(v28 + 4 * v27) = -1;
        *(_DWORD *)(v26 + 8) |= 1u;
      }

      else
      {
        uint64_t v32 = *(void *)(a1 + 8);
        if (!v32 || *(_DWORD *)(a1 + 16) < v29) {
          return 999LL;
        }
        *(void *)(v32 + 8LL * (v29 - 1)) = v12;
      }
    }

    v12 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1) << 9;
  }

  if (*(void *)(v26 + 12))
  {
    sub_18825E874( "\x1B[33mCSparseFile::generateSparseTable: #%u i-node has no more bands but i-node link is non-zero.\x1B[0m",  v24);
    sub_18825E874("\x1B[33mzeroing i-node link.\x1B[0m");
    *(void *)(v26 + 12) = 0LL;
    *(_DWORD *)(v26 + 8) |= 1u;
    *(_DWORD *)(a1 + 32) = v24 + 1;
    unsigned int v36 = *(void **)(a1 + 80);
    uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
    *(void *)(a1 + 80) = realloc(v36, v37 * *(unsigned int *)(a1 + 32));
  }

                uint64_t v44 = v32;
                CFStringRef v34 = v14;
                uint64_t v35 = CFNumberCreate(v14, kCFNumberLongLongType, &__endptr);
                CFDictionarySetValue(v25, @"sector-start", v35);
                if (v35) {
                  CFRelease(v35);
                }
                unsigned int v36 = CFNumberCreate(v34, kCFNumberLongLongType, &valuePtr);
                CFDictionarySetValue(v25, @"sector-count", v36);
                if (v36) {
                  CFRelease(v36);
                }
                if (v31)
                {
                  uint64_t v37 = CFNumberCreate(v34, kCFNumberSInt32Type, (const void *)v23);
                  CFDictionarySetValue(v25, @"comment", v37);
                  if (v37) {
                    CFRelease(v37);
                  }
                }

                if (v33) {
                  CFDictionarySetValue(v25, @"terminator", value);
                }
                uint64_t v14 = v34;
                if (v44) {
                  CFDictionarySetValue(v25, @"data", value);
                }
                uint64_t v21 = v43;
                if (v30)
                {
                  CFDictionarySetValue(v25, @"zero", value);
                  if (v29) {
                    goto LABEL_57;
                  }
                }

                else if (v29)
                {
LABEL_57:
                  CFDictionarySetValue(v25, @"ignored", value);
                  if (!v26) {
                    goto LABEL_54;
                  }
LABEL_53:
                  CFDictionarySetValue(v25, @"compressed", value);
                  goto LABEL_54;
                }

                if (v26) {
                  goto LABEL_53;
                }
LABEL_54:
                CFArrayAppendValue(v43, v25);
                CFRelease(v25);
                v23 += 40LL;
                --v22;
              }

              while (v22);
            }

            CFDictionarySetValue(theDict, @"runs", v21);
            CFRelease(v21);
            (*(void (**)(uint64_t, const __CFString *, CFMutableDictionaryRef))(*(void *)v38 + 32LL))( v38,  v41,  theDict);
            CFRelease(theDict);
            unint64_t v5 = v40;
          }
        }

        goto LABEL_60;
      }

      if (!strcmp(v6, "ddm"))
      {
        uint64_t v11 = -1LL;
      }

      else
      {
        uint64_t v7 = strtol(v6, &__endptr, 0);
        uint64_t v8 = v7 << 32;
        if (*__endptr) {
          unsigned int v9 = 1;
        }
        else {
          unsigned int v9 = v8 < (uint64_t)0xFFFFFFFE00000000LL;
        }
        if (v9) {
          goto LABEL_60;
        }
        if (v8 == 0xFFFFFFFE00000000LL) {
          goto LABEL_10;
        }
        uint64_t v11 = (int)v7;
      }

      uint64_t v12 = v11 - *(__int16 *)(a1 + 914);
      if (v12 < *(__int16 *)(a1 + 912))
      {
        uint64_t v10 = (uint64_t *)(*(void *)(a1 + 928) + 8 * v12);
        goto LABEL_15;
      }
    }

LABEL_56:
  uint64_t v4 = v18;
LABEL_57:
  if (v2 == v4) {
    return 0LL;
  }
  if (*(_BYTE *)(a1 + 104))
  {
    sub_18825E874("\x1B[33mCSparseFile::generateSparseTable: expected EOF %qd, actual EOF %qd.\x1B[0m", v4, v2);
    uint64_t v39 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 312LL))(*(void *)(a1 + 24), v4);
    if ((_DWORD)v39)
    {
      *(_BYTE *)(a1 + 106) = 0;
      DIStrError(v39);
      sub_18825E874("\x1B[31m\x1B[1madjusting EOF failed (%d - %s).\x1B[0m");
    }

    else
    {
      *(void *)(a1 + 112) = v4;
      *(void *)(a1 + 120) = v4;
      sub_18825E874("\x1B[33mEOF was adjusted.\x1B[0m");
    }
  }

  else
  {
    *(_BYTE *)(a1 + 106) = 0;
  }

  (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472LL))(*(void *)(a1 + 24), 1LL);
  *(_BYTE *)(a1 + 105) = 1;
  if (!*(_BYTE *)(a1 + 104)
    || (uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1), (_DWORD)result))
  {
    uint64_t result = 0LL;
    *(_BYTE *)(a1 + 106) = 0;
  }

  return result;
}

uint64_t sub_1882525E8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t sub_1882525F0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

uint64_t sub_1882525F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 64LL))(*(void *)(a1 + 160));
}

uint64_t sub_188252608()
{
  return 1LL;
}

CFStringRef sub_188252610()
{
  return @"sparse disk image";
}

uint64_t sub_18825261C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 160);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 48LL))(result);
  }
  return result;
}

uint64_t sub_188252634(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t sub_18825263C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char *a5)
{
  uint64_t v10 = (pthread_rwlock_t *)(a1 + 168);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 168));
  if (!a5)
  {
LABEL_23:
    uint64_t v17 = 0LL;
    uint64_t v22 = 22LL;
    goto LABEL_19;
  }

  uint64_t v11 = *(void *)(a1 + 160);
  if (v11)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 48LL))(v11);
    uint64_t v13 = a3 + a2;
    if (v12 >= a2)
    {
      BOOL v16 = __OFSUB__(v13, v12);
      BOOL v14 = v13 == v12;
      BOOL v15 = v13 - v12 < 0;
    }

    else
    {
      BOOL v16 = 0;
      BOOL v14 = 0;
      BOOL v15 = 0;
    }

    if (!(v15 ^ v16 | v14)) {
      goto LABEL_23;
    }
    uint64_t v17 = 0LL;
    if (a3)
    {
      unint64_t v18 = a3 << 9;
      while (1)
      {
        uint64_t v19 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, char *))(**(void **)(a1 + 160) + 24LL))( *(void *)(a1 + 160),  a2,  a3,  &v26,  &v24);
        if ((_DWORD)v19)
        {
LABEL_18:
          uint64_t v22 = v19;
          goto LABEL_19;
        }

        uint64_t v20 = v26;
        uint64_t v21 = v26 << 9;
        if (v26 << 9 > v18) {
          break;
        }
        if (v24)
        {
          uint64_t v19 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, char *))(**(void **)(a1 + 160) + 32LL))( *(void *)(a1 + 160),  a2,  v26,  &v25,  a5);
          if ((_DWORD)v19) {
            goto LABEL_18;
          }
          uint64_t v20 = v25;
          uint64_t v21 = v25 << 9;
        }

        else
        {
          bzero(a5, v26 << 9);
          uint64_t v25 = v20;
        }

        a5 += v21;
        a2 += v20;
        v17 += v20;
        a3 -= v20;
        if (!a3) {
          goto LABEL_17;
        }
      }

      uint64_t v22 = 29LL;
    }

    else
    {
LABEL_17:
      uint64_t v22 = 0LL;
    }
  }

  else
  {
    uint64_t v17 = 0LL;
    uint64_t v22 = 999LL;
  }

uint64_t sub_1882527A0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  unsigned int v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 136LL))(a1);
  uint64_t v11 = *(void *)(a1 + 8);
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || *(_DWORD *)(a1 + 16) < v10 || (uint64_t v13 = *(void *)(v11 + 8LL * (v10 - 1))) == 0)
  {
    *a5 = 0;
    uint64_t v15 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 144LL))(a1, v10 + 1) - a2;
  }

  else
  {
    *a5 = 1;
    uint64_t v14 = v10 + 1;
    do
    {
      uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 144LL))(a1, v14) - a2;
      if (v15 >= a3) {
        break;
      }
      if (!(_DWORD)v14) {
        break;
      }
      uint64_t v16 = *(void *)(a1 + 8);
      if (!v16) {
        break;
      }
      uint64_t v17 = *(void *)(v16 + 8LL * (v14 - 1));
      if (!v17) {
        break;
      }
      uint64_t v18 = v13 + ((unint64_t)*(unsigned int *)(a1 + 48) << 9);
      uint64_t v14 = (v14 + 1);
      uint64_t v13 = v17;
    }

    while (v17 == v18);
  }

  if (v15 >= a3) {
    uint64_t v15 = a3;
  }
  *a4 = v15;
  return 0LL;
}

uint64_t sub_1882528A8(uint64_t a1, uint64_t a2)
{
  return (a2 / (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1)) + 1;
}

uint64_t sub_1882528D8(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1) * (a2 - 1);
}

uint64_t sub_188252904(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a4) {
    return 22LL;
  }
  *a4 = 0LL;
  if (!a5) {
    return 22LL;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 136LL))(a1);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 144LL))(a1, (v10 + 1)) - a2;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 144LL))(a1, v10);
  if (v11 < a3) {
    a3 = v11;
  }
  uint64_t v13 = *(void *)(a1 + 8);
  if (!(_DWORD)v10 || v13 == 0) {
    return 22LL;
  }
  uint64_t v15 = *(void *)(v13 + 8LL * (v10 - 1));
  if (!v15) {
    return 22LL;
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, _BYTE *, uint64_t))(**(void **)(a1 + 24) + 328LL))( *(void *)(a1 + 24),  v15 + ((a2 - v12) << 9),  a3 << 9,  v17,  a5);
  if (!(_DWORD)result) {
    *a4 = a3;
  }
  return result;
}

void sub_188252A04(void *a1)
{
}

void sub_188252A28(_Unwind_Exception *a1)
{
}

void *sub_188252A3C(uint64_t a1)
{
  *(void *)a1 = off_18A20BBF0;
  uint64_t v2 = *(void *)(a1 + 160);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *(void *)(a1 + 160) = 0LL;
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 168));
  return sub_188244EB4((void *)a1);
}

void sub_188252A88(_Unwind_Exception *a1)
{
}

void sub_188252AA0(void *a1)
{
}

void sub_188252AC4(_Unwind_Exception *a1)
{
}

uint64_t sub_188252AD8(uint64_t a1)
{
  *(void *)a1 = off_18A20BE58;
  sub_188252B94(a1);
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 112);
    (*(void (**)(void, uint64_t))(**(void **)(a1 + 24) + 472LL))(*(void *)(a1 + 24), 1LL);
  }

  (*(void (**)(uint64_t))(*(void *)a1 + 128LL))(a1);
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    free(v4);
    *(void *)(a1 + 8) = 0LL;
  }

  *(_DWORD *)(a1 + 16) = 0;
  unint64_t v5 = *(void **)(a1 + 96);
  if (v5)
  {
    free(v5);
    *(void *)(a1 + 96) = 0LL;
  }

  uint64_t v6 = *(char **)(a1 + 24);
  if (v6)
  {
    DIDiskImageObjectRelease(v6);
    *(void *)(a1 + 24) = 0LL;
  }

  return a1;
}

uint64_t sub_188252B94(uint64_t a1)
{
  uint64_t v2 = sub_188252C28((void *)a1);
  if ((_DWORD)v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (const char *)DIStrError(v2);
    sub_18825E874( "\x1B[31m\x1B[1mCSparseFile::writeHeaderAndIndexNodes: updating header node failed (%d - %s).\x1B[0m",  v3,  v4);
  }

  else
  {
    uint64_t v5 = sub_188252CA0(a1);
    uint64_t v3 = v5;
    if ((_DWORD)v5)
    {
      if (*(_DWORD *)(a1 + 32) <= 1u) {
        uint64_t v6 = "node";
      }
      else {
        uint64_t v6 = "nodes";
      }
      uint64_t v7 = (const char *)DIStrError(v5);
      sub_18825E874( "\x1B[31m\x1B[1mCSparseFile::writeHeaderAndIndexNodes: updating index %s failed (%d - %s).\x1B[0m",  v6,  v3,  v7);
    }
  }

  return v3;
}

uint64_t sub_188252C28(void *a1)
{
  uint64_t v1 = (_BYTE *)a1[9];
  if (!v1) {
    return 22LL;
  }
  if ((v1[12] & 1) == 0) {
    return 0LL;
  }
  uint64_t v3 = a1[3];
  size_t v4 = (*(uint64_t (**)(void *))(*a1 + 80LL))(a1);
  uint64_t result = sub_188253E64(v3, v1, v4);
  if (!(_DWORD)result) {
    *(_DWORD *)(a1[9] + 12LL) &= ~1u;
  }
  return result;
}

uint64_t sub_188252CA0(uint64_t a1)
{
  if (!*(void *)(a1 + 80)) {
    return 0LL;
  }
  if (!*(_DWORD *)(a1 + 32)) {
    return 0LL;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
  if (!*(_DWORD *)(a1 + 32)) {
    return 0LL;
  }
  uint64_t v2 = 0LL;
  uint64_t v3 = (uint64_t *)(*(void *)(a1 + 72) + 20LL);
  while (1)
  {
    uint64_t v4 = *v3;
    if (!*v3) {
      break;
    }
    uint64_t v5 = *(void *)(a1 + 80);
    if (!v5) {
      break;
    }
    uint64_t v6 = (_DWORD *)(v5 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * v2);
    if ((v6[2] & 1) != 0)
    {
      uint64_t result = sub_18825EA88((void **)a1, v4, v6);
      if ((_DWORD)result) {
        return result;
      }
      v6[2] &= ~1u;
    }

    uint64_t v3 = (uint64_t *)(v6 + 3);
  }

  return 22LL;
}

void *sub_188252D64(uint64_t a1, char *a2)
{
  uint64_t result = (void *)sub_1882499D4(a1, a2);
  *uint64_t result = off_18A20D878;
  return result;
}

__CFArray *sub_188252D84(uint64_t a1, _DWORD *a2, uint64_t a3, __CFDictionary **a4)
{
  uint64_t v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  uint64_t v9 = sub_18824A018(a1);
  uint64_t v10 = (const void *)*MEMORY[0x189604DE0];
  if (a4) {
    *a4 = 0LL;
  }
  uint64_t v11 = CFDictionaryCreateMutable(v7, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  (*(void (**)(uint64_t))(*(void *)v9 + 96LL))(v9);
  uint64_t v12 = sub_18824A348();
  uint64_t v13 = v12;
  uint64_t v27 = a2;
  if (!v12) {
    goto LABEL_24;
  }
  if (!CFDictionaryGetValue(v12, @"APFS"))
  {
    if (CFDictionaryGetValue(v13, @"HFS+"))
    {
      uint64_t v10 = (const void *)*MEMORY[0x189604DE8];
      uint64_t v14 = @"Apple_HFS";
      goto LABEL_25;
    }

    if (CFDictionaryGetValue(v13, @"HFSX"))
    {
      uint64_t v10 = (const void *)*MEMORY[0x189604DE8];
      uint64_t v14 = @"Apple_HFSX";
      goto LABEL_25;
    }

    if (CFDictionaryGetValue(v13, @"UDF"))
    {
      uint64_t v15 = (const void *)*MEMORY[0x189604DE8];
      uint64_t v14 = @"UDF";
      goto LABEL_26;
    }

    if (CFDictionaryGetValue(v13, @"UFS"))
    {
      uint64_t v10 = (const void *)*MEMORY[0x189604DE8];
      uint64_t v14 = @"Apple_UFS";
      goto LABEL_25;
    }

    if (CFDictionaryGetValue(v13, @"ProDOS"))
    {
      uint64_t v14 = @"Apple_ProDOS";
      goto LABEL_25;
    }

    if (CFDictionaryGetValue(v13, @"NTFS"))
    {
      uint64_t v14 = @"Windows_NTFS";
      goto LABEL_25;
    }

    if (CFDictionaryGetValue(v13, @"FAT12"))
    {
      uint64_t v14 = @"DOS_FAT_12";
      goto LABEL_25;
    }

    if (CFDictionaryGetValue(v13, @"FAT16"))
    {
      uint64_t v14 = @"DOS_FAT_16";
      goto LABEL_25;
    }

    if (CFDictionaryGetValue(v13, @"FAT32"))
    {
      uint64_t v14 = @"DOS_FAT_32";
      goto LABEL_25;
    }

LABEL_24:
    int v16 = DIGetBundleRef();
    uint64_t v14 = (const __CFString *)sub_1882660CC(v16, (int)@"unknown partition", @"unknown partition");
    goto LABEL_25;
  }

  uint64_t v14 = @"Apple_APFS";
LABEL_25:
  uint64_t v15 = v10;
LABEL_26:
  int v17 = DIGetBundleRef();
  CFTypeRef v18 = sub_1882660CC(v17, (int)@"whole disk", @"whole disk");
  uint64_t v19 = sub_18824A018(a1);
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v19 + 96LL))(v19);
  unint64_t v23 = sub_18824A300(0LL, v20, 0, v14, v18, 0LL, v21, v22);
  if (v23)
  {
    char v24 = v23;
    if (v13)
    {
      CFDictionarySetValue(v23, @"partition-filesystems", v13);
      CFRelease(v13);
    }

    CFArrayAppendValue(Mutable, v24);
    CFRelease(v24);
    __int16 valuePtr = 512;
    CFNumberRef v25 = CFNumberCreate(v7, kCFNumberSInt16Type, &valuePtr);
    CFDictionarySetValue(v11, @"block-size", v25);
    CFRelease(v25);
    CFDictionarySetValue(v11, @"burnable", v15);
    CFDictionarySetValue(v11, @"appendable", v10);
    if (a4) {
      *a4 = v11;
    }
    else {
      CFRelease(v11);
    }
    ++*v27;
    if (v18) {
      CFRelease(v18);
    }
    if (v14) {
      CFRelease(v14);
    }
  }

  else
  {
    if (v18) {
      CFRelease(v18);
    }
    if (v14) {
      CFRelease(v14);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v11) {
      CFRelease(v11);
    }
    return 0LL;
  }

  return Mutable;
}

CFStringRef sub_188253150()
{
  return @"none";
}

void sub_18825315C(void *a1)
{
}

void sub_188253180(_Unwind_Exception *a1)
{
}

uint64_t sub_188253194( const __CFURL *a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, char **a5, CFTypeRef *a6)
{
  value = 0LL;
  CFNumberRef v25 = 0LL;
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  uint64_t v12 = 22LL;
  if (!a1 || !theDict || !a5) {
    return v12;
  }
  if (CFDictionaryGetValue(theDict, @"hybrid-image-source-array")) {
    return sub_1882660BC();
  }
  if (!CFDictionaryGetValueIfPresent(theDict, @"blockcount", (const void **)&value))
  {
    MutableCFDictionaryRef Copy = 0LL;
    CFNumberRef v22 = 0LL;
    CFURLRef v19 = 0LL;
    goto LABEL_25;
  }

  CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &valuePtr);
  value = 0LL;
  uint64_t v14 = (const __CFString *)CFDictionaryGetValue(theDict, @"create-image-type");
  if (v14
    && (v15 = v14, CFTypeID v16 = CFGetTypeID(v14), v16 == CFStringGetTypeID())
    && CFStringCompare(v15, @"UDTO", 0LL) == kCFCompareEqualTo)
  {
    int v17 = 0;
    CFTypeRef v18 = @"cdr";
  }

  else
  {
    int v17 = 1;
    CFTypeRef v18 = @"dmg";
  }

  CFURLRef v19 = sub_188245378(a1, v18, 0);
  if (!v19)
  {
    MutableCFDictionaryRef Copy = 0LL;
    goto LABEL_23;
  }

  uint64_t v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theDict);
  if (!MutableCopy)
  {
LABEL_23:
    CFNumberRef v22 = 0LL;
LABEL_24:
    uint64_t v12 = 999LL;
    goto LABEL_25;
  }

  uint64_t v26 = valuePtr << 9;
  CFNumberRef v22 = CFNumberCreate(v20, kCFNumberSInt64Type, &v26);
  CFDictionaryRemoveValue(MutableCopy, @"diskimage-class");
  CFDictionarySetValue(MutableCopy, @"writeable", (const void *)*MEMORY[0x189604DE8]);
  CFDictionarySetValue(MutableCopy, @"size", v22);
  if (v17)
  {
    CFDictionaryAddValue(MutableCopy, @"file-type", @"devr");
    CFDictionaryAddValue(MutableCopy, @"file-creator", @"ddsk");
  }

  uint64_t v23 = sub_1882454CC((uint64_t)v19, (uint64_t)MutableCopy, 7u, a3, a4, &v25, a6);
  if ((_DWORD)v23)
  {
    uint64_t v12 = v23;
    goto LABEL_25;
  }

  CFRelease(MutableCopy);
  char v24 = CFDictionaryCreateMutableCopy(v20, 0LL, theDict);
  MutableCFDictionaryRef Copy = v24;
  if (!v24) {
    goto LABEL_24;
  }
  CFDictionarySetValue(v24, @"diskimage-class", @"CRawDiskImage");
  uint64_t v12 = sub_18824DB74((uint64_t)v25, (uint64_t)MutableCopy, a5, a6);
  if (!(_DWORD)v12)
  {
LABEL_27:
    if (v25)
    {
      DIDiskImageObjectRelease(v25);
      CFNumberRef v25 = 0LL;
    }

    goto LABEL_29;
  }

LABEL_25:
  if (v25)
  {
    (*(void (**)(char *))(*(void *)v25 + 416LL))(v25);
    goto LABEL_27;
  }

  if (v15) {
    (*(void (**)(void *))(*v15 + 8LL))(v15);
  }
  return v3;
}

uint64_t sub_1882534A4(int a1, uint64_t a2)
{
  v3[0] = 0x300000000LL;
  v3[1] = 0LL;
  v3[2] = a2;
  v3[3] = 0LL;
  if (fcntl(a1, 42, v3) < 0) {
    return *__error();
  }
  else {
    return 0LL;
  }
}

BOOL sub_1882534F4(uint64_t a1, CFStringRef *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  if (a2) {
    *a2 = 0LL;
  }
  int MKMediaRef = DIMediaKitCreateMKMediaRef(a1, 0LL, 0LL, (uint64_t *)&cf);
  if (!MKMediaRef)
  {
    int v4 = MKDetectISO();
    int MKMediaRef = v7 >= 5000 ? v4 : -5343;
    if (a2 && v7 >= 5000)
    {
      int v5 = v4;
      *a2 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
      int MKMediaRef = v5;
    }
  }

  if (cf) {
    CFRelease(cf);
  }
  return MKMediaRef == 0;
}

uint64_t sub_1882535D8(void *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v10 = (*(uint64_t (**)(void *))(*a1 + 296LL))(a1);
  if (a4) {
    *a4 = 0LL;
  }
  if (!v10) {
    return 999LL;
  }
  uint64_t v11 = a1[20];
  if (v11 < a2 || a3 + a2 > v11) {
    return 22LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))(*(void *)v10 + 336LL))( v10,  a2 << 9,  a3 << 9,  &v15,  a5);
  if ((_DWORD)result) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = a4 == 0LL;
  }
  if (!v14)
  {
    uint64_t result = 0LL;
    *a4 = v15 >> 9;
  }

  return result;
}

uint64_t sub_188253690(uint64_t a1, off_t a2)
{
  if (ftruncate(*(_DWORD *)(a1 + 320), a2) < 0) {
    return *__error();
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1882536BC(uint64_t a1, uint64_t a2, int64_t __size, uint64_t a4, char *a5)
{
  v41[1] = *MEMORY[0x1895F89C0];
  uint64_t v10 = (char *)malloc(__size);
  if (!v10) {
    return 0LL;
  }
  uint64_t v11 = v10;
  if (*(_WORD *)v11 != 2) {
    goto LABEL_8;
  }
  char v13 = 0;
  v12.i32[0] = *(_DWORD *)v11;
  char v14 = vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v12)));
  uint64_t v15 = 5LL;
  do
    v13 += v11[v15++];
  while ((_DWORD)v15 != 16);
  int64_t v16 = *((unsigned int *)v11 + 4);
  if (v16 < __size) {
    goto LABEL_8;
  }
  unsigned int v19 = *((_DWORD *)v11 + 5);
  unsigned int v20 = v16 - __size;
  while (1)
  {
    if (*(_WORD *)v11 == 1) {
      break;
    }
    uint64_t v17 = 0LL;
    ++v19;
    int64_t v21 = v20;
    v20 -= __size;
    if (v21 < __size) {
      goto LABEL_9;
    }
  }

  if (v11[55])
  {
    int v22 = v11[55] - 1;
  }

  else
  {
    uint64_t v23 = 0LL;
    while (v23 != -29)
    {
      if (v11[v23-- + 54])
      {
        int v25 = (_DWORD)v11 + v23 + 55;
        goto LABEL_24;
      }
    }

    int v25 = (_DWORD)v11 + 25;
LABEL_24:
    int v22 = v25 - ((_DWORD)v11 + 25) + 1;
  }

  if ((v22 - 33) >= 0xFFFFFFE0)
  {
    int v26 = v11[24];
    if (v26 != 16 && v26 != 8)
    {
      *(void *)a5 = 0x6E776F6E6B6E55LL;
      int v32 = 7;
      goto LABEL_40;
    }

    MEMORY[0x1895F8858]();
    unsigned int v30 = (const UniChar *)((char *)v41 - v29);
    if (v11[24] == 8)
    {
      uint64_t v31 = 0LL;
      do
      {
        v30[v31] = v11[v31 + 25];
        ++v31;
      }

      while (v28 != v31);
    }

    else
    {
      unsigned int v30 = (const UniChar *)(v11 + 25);
      int v28 = v28 >> 1;
    }

    uint64_t v33 = CFStringCreateWithCharacters(0LL, v30, v28);
    if (!v33)
    {
      *(void *)a5 = 0x6E776F6E6B6E55LL;
      int v32 = 7;
      goto LABEL_40;
    }

    CFStringRef v34 = v33;
    CFStringGetCString(v33, a5, 136LL, 0x8000100u);
    CFRelease(v34);
    int v32 = strlen(a5);
    if (v32 >= 1)
    {
LABEL_40:
      uint64_t v35 = a5;
      do
      {
        --v32;
        int v37 = *v35++;
        int v36 = v37;
        if (v37 == 47 || v36 == 0)
        {
          if (!v32)
          {
LABEL_56:
            *a5++ = 95;
            break;
          }

          while (1)
          {
            int v39 = *v35;
            if (v39 != 47 && v39 != 0) {
              break;
            }
            ++v35;
            if (!--v32) {
              goto LABEL_56;
            }
          }

          LOBYTE(v36) = 95;
        }

        *a5++ = v36;
      }

      while (v32 > 0);
    }

    *a5 = 0;
    uint64_t v17 = 1LL;
  }

  else
  {
LABEL_8:
    uint64_t v17 = 0LL;
  }

uint64_t sub_1882539E0( const __CFURL *a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, char **a5, CFTypeRef *a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  unsigned int v19 = 0LL;
  value = 0LL;
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  uint64_t v12 = 22LL;
  if (a1 && theDict && a5)
  {
    if (!v22)
    {
LABEL_11:
      CFStringRef PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x189604DB0], a1);
      if (!PathComponent) {
        return v12;
      }
      char v14 = PathComponent;
      uint64_t v12 = sub_1882568E8(PathComponent, &v23);
      CFRelease(v14);
      if ((_DWORD)v12) {
        return v12;
      }
      uint64_t v22 = v23.f_blocks * (((unint64_t)v23.f_bsize >> 8) & 0xFFFFFE);
    }

    value = 0LL;
    if (CFDictionaryGetValueIfPresent(theDict, @"sparse-band-size", (const void **)&value)
      && !sub_18824D608((const __CFString *)value, kCFNumberSInt64Type, &v21))
    {
      return 22LL;
    }

    else
    {
      value = 0LL;
      CFURLRef v15 = sub_188245378(a1, @"sparseimage", 0);
      if (v15)
      {
        CFURLRef v16 = v15;
        uint64_t v12 = sub_188253BDC((uint64_t)v15, theDict, a3, a4, v22, v21, (uint64_t *)&v19, a6);
        uint64_t v17 = v19;
        if (!(_DWORD)v12)
        {
          uint64_t v12 = sub_18825173C((uint64_t)v19, (uint64_t)theDict, a5, a6);
          uint64_t v17 = v19;
        }

        if ((_DWORD)v12 && v17)
        {
          (*(void (**)(char *))(*(void *)v17 + 416LL))(v17);
          uint64_t v17 = v19;
        }

        if (v17)
        {
          DIDiskImageObjectRelease(v17);
          unsigned int v19 = 0LL;
        }

        CFRelease(v16);
      }

      else
      {
        return 999LL;
      }
    }
  }

  return v12;
}

uint64_t sub_188253BDC( uint64_t a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, uint64_t a5, int64_t a6, uint64_t *a7, CFTypeRef *a8)
{
  *(void *)uint64_t v31 = 0LL;
  if (a6) {
    int64_t v14 = a6;
  }
  else {
    int64_t v14 = 2048LL;
  }
  uint64_t v15 = a5 / v14;
  if (a5 % v14) {
    ++v15;
  }
  if (v15 >= 134217729)
  {
    if (a6)
    {
      uint64_t v16 = 0LL;
      uint64_t v17 = 115LL;
      goto LABEL_44;
    }

    double v18 = sqrt((double)a5) * 0.125;
    int64_t v14 = (uint64_t)v18;
    else {
      BOOL v19 = 0;
    }
    if (!v19)
    {
      uint64_t v20 = v14 + 2047;
      if (v14 >= 0) {
        uint64_t v20 = (uint64_t)v18;
      }
      int64_t v14 = (v20 & 0xFFFFFFFFFFFFF800LL) + 2048;
    }
  }

  uint64_t v21 = a5 / v14;
  if (a5 % v14) {
    ++v21;
  }
  uint64_t v17 = 115LL;
  if (v21 > 0x8000000 || (a6 ? (uint64_t v17 = 22LL) : (uint64_t v17 = 115LL), v14 > 0x200000))
  {
LABEL_43:
    uint64_t v16 = 0LL;
    goto LABEL_44;
  }

  if (theDict) {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(0LL, 0LL, theDict);
  }
  else {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  }
  CFMutableDictionaryRef v23 = MutableCopy;
  if (!MutableCopy)
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    goto LABEL_44;
  }

  uint64_t v17 = sub_1882454CC(a1, (uint64_t)MutableCopy, 1u, a3, a4, v31, a8);
  if ((_DWORD)v17) {
    goto LABEL_28;
  }
  uint64_t v24 = (*(uint64_t (**)(void, uint64_t))(**(void **)v31 + 168LL))(*(void *)v31, 1LL);
  if ((_DWORD)v24
    || (uint64_t v24 = (*(uint64_t (**)(void))(**(void **)v31 + 272LL))(*(void *)v31), (_DWORD)v24))
  {
    uint64_t v17 = v24;
LABEL_28:
    CFRelease(v23);
    uint64_t v16 = *(void *)v31;
LABEL_41:
    if (!v16) {
      goto LABEL_44;
    }
    (*(void (**)(uint64_t))(*(void *)v16 + 8LL))(v16);
    goto LABEL_43;
  }

  int v25 = sub_188239FB0(v23, @"di-sparse-puma-compatible", 0);
  if (v25) {
    size_t v26 = 512LL;
  }
  else {
    size_t v26 = 4096LL;
  }
  uint64_t v27 = (char *)calloc(1uLL, v26);
  if (!v27)
  {
    uint64_t v17 = 12LL;
    goto LABEL_28;
  }

  int v28 = v27;
  if (v25) {
    int v29 = 1;
  }
  else {
    int v29 = 3;
  }
  *(_DWORD *)uint64_t v27 = 1936749171;
  *((_DWORD *)v27 + 1) = v29;
  *((_DWORD *)v27 + 2) = v14;
  *(void *)(v27 + 28) = a5;
  *((_DWORD *)v27 + 4) = a5;
  uint64_t v17 = sub_188253E64(*(uint64_t *)v31, v27, v26);
  if (!(_DWORD)v17) {
    (*(void (**)(void, void))(**(void **)v31 + 280LL))(*(void *)v31, 0LL);
  }
  CFRelease(v23);
  free(v28);
  uint64_t v16 = *(void *)v31;
  if ((_DWORD)v17) {
    goto LABEL_41;
  }
LABEL_44:
  *a7 = v16;
  return v17;
}

uint64_t sub_188253E64(uint64_t a1, const void *a2, size_t __size)
{
  uint64_t v6 = malloc(__size);
  if (!v6) {
    return 12LL;
  }
  int v7 = v6;
  memcpy(v6, a2, __size);
  sub_18823D848((uint64_t)v7, (__size + 0x3FFFFFFC0LL) >> 2);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void, size_t, _BYTE *, void *))(*(void *)a1 + 336LL))( a1,  0LL,  __size,  v10,  v7);
  free(v7);
  return v8;
}

uint64_t sub_188253F0C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v10 = (pthread_rwlock_t *)(a1 + 168);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 168));
  if (!a5)
  {
LABEL_19:
    uint64_t v14 = 0LL;
    uint64_t v16 = 22LL;
    goto LABEL_16;
  }

  uint64_t v11 = *(void *)(a1 + 160);
  if (v11)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 48LL))(v11);
    if (v12 < a2 || a3 + a2 > v12) {
      goto LABEL_19;
    }
    uint64_t v14 = 0LL;
    if (a3)
    {
      while (1)
      {
        uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, char *))(**(void **)(a1 + 160) + 24LL))( *(void *)(a1 + 160),  a2,  a3,  &v20,  &v18);
        if ((_DWORD)v15) {
          break;
        }
        if (!v18)
        {
          uint64_t v15 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 160) + 16LL))(*(void *)(a1 + 160), a2);
          if ((_DWORD)v15) {
            break;
          }
        }

        uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, uint64_t))(**(void **)(a1 + 160) + 40LL))( *(void *)(a1 + 160),  a2,  v20,  &v19,  a5);
        if ((_DWORD)v15) {
          break;
        }
        a5 += v19 << 9;
        a2 += v19;
        v14 += v19;
        a3 -= v19;
        if (!a3) {
          goto LABEL_14;
        }
      }

      uint64_t v16 = v15;
    }

    else
    {
LABEL_14:
      uint64_t v16 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v16 = 999LL;
  }

LABEL_16:
  if (a4) {
    *a4 = v14;
  }
  pthread_rwlock_unlock(v10);
  return v16;
}

  uint64_t v14 = v6 + 1;
  uint64_t v6 = sub_188257B98(a1, a3 + 2);
  return (v14 + v6);
}

uint64_t sub_18825404C(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 136LL))(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 152LL))(a1, v2);
}

uint64_t sub_188254084(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 88LL))(a1))
  {
LABEL_5:
    int v8 = 0;
    unsigned int v9 = 1;
    while (1)
    {
      unsigned int v10 = *(_DWORD *)(a1 + 32);
      if (v9 > v10) {
        break;
      }
      uint64_t v11 = v9 - 1;
      uint64_t v12 = *(void *)(a1 + 80);
      if (v12) {
        BOOL v13 = v10 > v11;
      }
      else {
        BOOL v13 = 0;
      }
      if (v13) {
        uint64_t v14 = v12 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * v11;
      }
      else {
        uint64_t v14 = 0LL;
      }
      uint64_t v7 = v14 + 56;
      uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 96LL))(a1))
      {
        unsigned int v16 = 0;
        while ((*(_DWORD *)v7 + 1) > 1)
        {
          ++v16;
          v7 += 4LL;
        }

        uint64_t v18 = *(void *)(a1 + 80);
        uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
        char v17 = 0;
        *(_DWORD *)(v18 + v19 * v11 + 8) |= 1u;
        if (*(_DWORD *)v7 == -1) {
          int v8 = 1;
        }
      }

      else
      {
LABEL_17:
        char v17 = 1;
      }

      v5 += v15 + ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1) << 9);
      ++v9;
      if ((v17 & 1) == 0)
      {
        if (v8) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }

    uint64_t result = sub_18825EB40(a1);
    if ((_DWORD)result) {
      return result;
    }
    int v21 = *(_DWORD *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 80);
    if (v21)
    {
      uint64_t v23 = v22 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * (v21 - 1);
      uint64_t v22 = *(void *)(a1 + 80);
      uint64_t v7 = v23 + 56;
      int v21 = *(_DWORD *)(a1 + 32);
    }

    else
    {
      uint64_t v7 = 56LL;
    }

    uint64_t v24 = (v21 - 1);
    uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
    *(_DWORD *)(v22 + v25 * v24 + 8) |= 1u;
    goto LABEL_30;
  }

  unsigned int v6 = 0;
  uint64_t v7 = v4 + 64;
  while ((*(_DWORD *)v7 + 1) >= 2)
  {
    v5 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1) << 9;
    ++v6;
    v7 += 4LL;
  }

  *(_DWORD *)(*(void *)(a1 + 72) + 12LL) |= 1u;
  if (*(_DWORD *)v7 != -1)
  {
LABEL_30:
    uint64_t v5 = *(void *)(a1 + 112);
    uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
    uint64_t result = sub_188254340(a1, v5 + (v26 << 9));
    if ((_DWORD)result) {
      return result;
    }
  }

LABEL_31:
  uint64_t result = 999LL;
  if (a2)
  {
    uint64_t v27 = *(void *)(a1 + 8);
    if (v27)
    {
      if (*(_DWORD *)(a1 + 16) >= a2)
      {
        *(void *)(v27 + 8LL * (a2 - 1)) = v5;
        *(_DWORD *)uint64_t v7 = a2;
        return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
      }
    }
  }

  return result;
}

  if (theArray) {
    CFRelease(theArray);
  }
  return v4;
}

uint64_t sub_188254340(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 112);
  if (v2 == a2) {
    return 0LL;
  }
  if (v2 > a2 || *(void *)(a1 + 120) >= a2) {
    goto LABEL_10;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 48);
  unsigned int v7 = 10 * v6;
  if (10 * v6 >= 0x32000) {
    unsigned int v7 = 204800;
  }
  uint64_t v8 = a2 + ((v6 * (unint64_t)(v7 / v6)) << 9);
  if (!(*(unsigned int (**)(void, uint64_t, void))(**(void **)(a1 + 24) + 320LL))( *(void *)(a1 + 24),  v8,  0LL)
    || (uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(**(void **)(a1 + 24) + 320LL))( *(void *)(a1 + 24),  a2,  0LL),  v8 = a2,  !(_DWORD)result))
  {
    *(void *)(a1 + 120) = v8;
LABEL_10:
    uint64_t result = 0LL;
    *(void *)(a1 + 112) = a2;
  }

  return result;
}

uint64_t sub_1882543FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a4) {
    return 22LL;
  }
  *a4 = 0LL;
  if (!a5) {
    return 22LL;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 136LL))(a1);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 144LL))(a1, (v10 + 1)) - a2;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 144LL))(a1, v10);
  if (v11 < a3) {
    a3 = v11;
  }
  uint64_t v13 = *(void *)(a1 + 8);
  if (!(_DWORD)v10 || v13 == 0) {
    return 22LL;
  }
  uint64_t v15 = *(void *)(v13 + 8LL * (v10 - 1));
  if (!v15) {
    return 22LL;
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, _BYTE *, uint64_t))(**(void **)(a1 + 24) + 336LL))( *(void *)(a1 + 24),  v15 + ((a2 - v12) << 9),  a3 << 9,  v17,  a5);
  if (!(_DWORD)result) {
    *a4 = a3;
  }
  return result;
}

uint64_t sub_1882544FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 160);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 104LL))(v1);
  }
  else {
    return 78LL;
  }
}

uint64_t sub_188254518(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
  if (!(_DWORD)result)
  {
    uint64_t v5 = *(void *)(a1 + 112);
    if (v5 && v5 != *(void *)(a1 + 120))
    {
      uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 312LL))(*(void *)(a1 + 24));
      if ((_DWORD)result) {
        return result;
      }
      *(void *)(a1 + 120) = *(void *)(a1 + 112);
    }

    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 472LL))(*(void *)(a1 + 24), a2);
  }

  return result;
}

uint64_t sub_188254594(const __CFURL *a1)
{
  v11[2] = *(char **)MEMORY[0x1895F89C0];
  if (!a1) {
    return 22LL;
  }
  uint64_t v1 = (char *)sub_18823A054(a1);
  if (!v1) {
    return 4294962336LL;
  }
  uint64_t v2 = v1;
  v11[0] = v1;
  v11[1] = 0LL;
  uint64_t v3 = fts_open(v11, 21, 0LL);
  if (!v3)
  {
    unsigned int v9 = *__error();
    if (v9) {
      uint64_t fts_errno = v9;
    }
    else {
      uint64_t fts_errno = 0xFFFFFFFFLL;
    }
    goto LABEL_25;
  }

  uint64_t v4 = v3;
  while (1)
  {
    uint64_t v5 = fts_read(v4);
    if (!v5) {
      break;
    }
    unsigned int fts_info = v5->fts_info;
    if (fts_info > 0xA) {
      goto LABEL_14;
    }
    if (((1 << fts_info) & 0x490) != 0)
    {
      uint64_t fts_errno = v5->fts_errno;
      if ((_DWORD)fts_errno) {
        goto LABEL_24;
      }
    }

    else if (((1 << fts_info) & 6) == 0)
    {
      if (fts_info != 6)
      {
LABEL_14:
        uint64_t v8 = unlink(v5->fts_accpath);
        goto LABEL_15;
      }

      uint64_t v8 = rmdir(v5->fts_accpath);
LABEL_15:
      uint64_t fts_errno = v8;
      if ((v8 & 0x80000000) != 0)
      {
        uint64_t fts_errno = *__error();
        if ((_DWORD)fts_errno) {
          goto LABEL_24;
        }
      }

      else if ((_DWORD)v8)
      {
        goto LABEL_24;
      }
    }
  }

  uint64_t fts_errno = *__error();
LABEL_24:
  fts_close(v4);
LABEL_25:
  free(v2);
  return fts_errno;
}

uint64_t DIDiskImageValidateChecksumWithFlags(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 168LL))(a1);
}

void *sub_1882546F4(void *a1)
{
  uint64_t v2 = sub_1882429C0((uint64_t)a1) + 13;
  sub_18825479C((uint64_t)v2);
  sub_1882547C8(a1 + 21);
  *a1 = off_18A20B408;
  a1[13] = &unk_18A20B450;
  a1[21] = &unk_18A20B470;
  sub_1882547D8((uint64_t)v2, 0x10000u);
  return a1;
}

void sub_188254760(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  nullsub_4(v4);
  sub_188254A6C(v2);
  sub_18823FEB0(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_18825479C(uint64_t result)
{
  *(void *)(result + 8) = 0LL;
  *(void *)(result + 16) = 0LL;
  *(void *)uint64_t result = &off_18A20B4D8;
  *(_DWORD *)(result + 24) = 133114;
  *(void *)(result + 32) = 0LL;
  *(_DWORD *)(result + 40) = 0;
  *(void *)(result + 48) = 0LL;
  *(void *)(result + 56) = 0LL;
  return result;
}

void *sub_1882547C8(void *result)
{
  *uint64_t result = &off_18A20B3D8;
  return result;
}

uint64_t sub_1882547D8(uint64_t result, unsigned int a2)
{
  if (a2 >= 0x30000) {
    unsigned int v2 = 196608;
  }
  else {
    unsigned int v2 = a2;
  }
  if (v2 <= 0x800) {
    unsigned int v2 = 2048;
  }
  *(_DWORD *)(result + 20) = v2;
  return result;
}

uint64_t sub_1882547F8(int a1, char *__src, int a3, unint64_t __dst, int a5)
{
  if (a5 < 1) {
    return 0LL;
  }
  int v8 = 0;
  unsigned int v9 = (char *)__dst;
  while (a3 >= 1)
  {
    uint64_t v10 = __src + 1;
    if ((*__src & 0x80000000) == 0)
    {
      unsigned int v11 = *__src;
      if ((v11 & 0x40) != 0)
      {
        BOOL v12 = a3 >= 3;
        a3 -= 3;
        if (!v12) {
          return 1000LL;
        }
        int v13 = (v11 & 0x3F) + 4;
        uint64_t v15 = (bswap32(*(unsigned __int16 *)(__src + 1)) >> 16) + 1LL;
        __src += 3;
      }

      else
      {
        BOOL v12 = a3 >= 2;
        a3 -= 2;
        if (!v12) {
          return 1000LL;
        }
        int v13 = (v11 >> 2) + 3;
        int v14 = *(unsigned __int16 *)__src;
        __src += 2;
        uint64_t v15 = (bswap32(v14 & 0xFFFFFF03) >> 16) + 1;
      }

      v8 += v13;
      if (v8 <= a5)
      {
        uint64_t v19 = &v9[-v15];
        if ((unint64_t)v19 >= __dst)
        {
          while (2)
          {
            switch((__int16)v13)
            {
              case 1:
                *v9++ = *v19;
                goto LABEL_24;
              case 2:
                *unsigned int v9 = *v19;
                v9[1] = v19[1];
                v9 += 2;
                goto LABEL_24;
              case 3:
                goto LABEL_23;
              case 4:
                goto LABEL_22;
              case 5:
                goto LABEL_21;
              case 6:
                goto LABEL_20;
              case 7:
                goto LABEL_19;
              default:
                char v20 = *v19++;
                *v9++ = v20;
LABEL_19:
                char v21 = *v19++;
                *v9++ = v21;
LABEL_20:
                char v22 = *v19++;
                *v9++ = v22;
LABEL_21:
                char v23 = *v19++;
                *v9++ = v23;
LABEL_22:
                char v24 = *v19++;
                *v9++ = v24;
LABEL_23:
                *unsigned int v9 = *v19;
                v9[1] = v19[1];
                char v25 = v19[2];
                v19 += 3;
                v9[2] = v25;
                v9 += 3;
                unsigned int v26 = (unsigned __int16)v13;
                LOWORD(v13) = v13 - 8;
                if (v26 <= 8) {
                  goto LABEL_24;
                }
                continue;
            }
          }
        }
      }

      return 1000LL;
    }

    uint64_t v16 = *__src & 0x7F;
    size_t v17 = v16 + 1;
    v8 += v16 + 1;
    uint64_t result = 1000LL;
    if (v8 > a5) {
      return result;
    }
    a3 += ~(_DWORD)v17;
    if (a3 < 0) {
      return result;
    }
    memcpy(v9, __src + 1, v17);
    unsigned int __src = &v10[v17];
    v9 += v17;
LABEL_24:
    if (v8 >= a5) {
      return 0LL;
    }
  }

  return 1000LL;
}

uint64_t DIDiskImageCallProgressMessageProc(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 336LL))(a1);
}

void sub_1882549D8(void *a1)
{
}

void sub_1882549FC(_Unwind_Exception *a1)
{
}

void *sub_188254A10(void *a1)
{
  return sub_18823FEB0(a1);
}

void sub_188254A40(_Unwind_Exception *a1)
{
}

void *sub_188254A6C(void *a1)
{
  *a1 = &off_18A20B4D8;
  unsigned int v2 = (void *)a1[4];
  if (v2) {
    free(v2);
  }
  a1[4] = 0LL;
  return a1;
}

uint64_t DIChecksumGetShortName(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104LL))(a1);
}

uint64_t DIChecksumGetValueString(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
}

uint64_t sub_188254AC0(int a1, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 4294966296LL;
  }
  uint64_t Value = (const __CFString *)CFDictionaryGetValue(theDict, @"checksum-image-type");
  if (!Value) {
    return 4294966296LL;
  }
  uint64_t v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 4294966296LL;
  }
  if (CFStringCompare(v3, @"UDIF-CRC32", 0LL) == kCFCompareEqualTo) {
    return 1000LL;
  }
  uint64_t v5 = 1000LL;
  if (CFStringCompare(v3, @"UDIF-MD5", 0LL))
  {
    if (CFStringCompare(v3, @"IPOD", 0LL)) {
      return 4294966296LL;
    }
    else {
      return 1000LL;
    }
  }

  return v5;
}

uint64_t sub_188254B70(int a1, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 4294966296LL;
  }
  uint64_t Value = (const __CFString *)CFDictionaryGetValue(theDict, @"checksum-image-type");
  if (!Value) {
    return 4294966296LL;
  }
  uint64_t v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 4294966296LL;
  }
  if (CFStringCompare(v3, @"CRC32", 0LL) == kCFCompareEqualTo
    || CFStringCompare(v3, @"MD5", 0LL) == kCFCompareEqualTo
    || CFStringCompare(v3, @"SHA1", 0LL) == kCFCompareEqualTo
    || CFStringCompare(v3, @"SHA256", 0LL) == kCFCompareEqualTo)
  {
    return 1000LL;
  }

  uint64_t v5 = 1000LL;
  if (CFStringCompare(v3, @"SHA384", 0LL))
  {
    if (CFStringCompare(v3, @"SHA512", 0LL)) {
      return 4294966296LL;
    }
    else {
      return 1000LL;
    }
  }

  return v5;
}

uint64_t sub_188254C68(char *a1, CFDictionaryRef theDict, char **a3)
{
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  if (!theDict) {
    return 22LL;
  }
  uint64_t Value = (const __CFString *)CFDictionaryGetValue(theDict, @"checksum-image-type");
  if (!Value) {
    return 22LL;
  }
  unsigned int v6 = Value;
  CFTypeID v7 = CFGetTypeID(Value);
  if (v7 != CFStringGetTypeID()) {
    return 22LL;
  }
  if (CFStringCompare(v6, @"CRC32", 0LL))
  {
    if (CFStringCompare(v6, @"MD5", 0LL))
    {
      if (CFStringCompare(v6, @"SHA1", 0LL))
      {
        if (CFStringCompare(v6, @"SHA256", 0LL))
        {
          if (CFStringCompare(v6, @"SHA384", 0LL))
          {
            if (CFStringCompare(v6, @"SHA512", 0LL)) {
              return 22LL;
            }
            uint64_t v10 = (char *)operator new(0xA0uLL);
            sub_188264924();
          }

          else
          {
            uint64_t v10 = (char *)operator new(0xA0uLL);
            sub_18826482C();
          }
        }

        else
        {
          uint64_t v10 = (char *)operator new(0xA0uLL);
          sub_188264734();
        }
      }

      else
      {
        uint64_t v10 = (char *)operator new(0xA0uLL);
        sub_18825B69C();
      }
    }

    else
    {
      uint64_t v10 = (char *)operator new(0xA0uLL);
      sub_188257330();
    }
  }

  else
  {
    uint64_t v10 = (char *)operator new(0x78uLL);
    sub_1882404B0((uint64_t)v10);
  }

  uint64_t v8 = sub_188254E28(a1, v10);
  if ((_DWORD)v8)
  {
    DIDiskImageObjectRelease(v10);
    uint64_t v10 = 0LL;
  }

  *a3 = v10;
  return v8;
}

void sub_188254E00(_Unwind_Exception *a1)
{
}

uint64_t sub_188254E28(char *a1, char *a2)
{
  v38[9] = *MEMORY[0x1895F89C0];
  (*(void (**)(char *, float))(*(void *)a1 + 344LL))(a1, 0.0);
  (*(void (**)(char *))(*(void *)a2 + 48LL))(a2);
  memset(v38, 0, 72);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  memset(v35, 0, sizeof(v35));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  *(_OWORD *)uint64_t v31 = 0u;
  __int128 v32 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  int v29 = a2;
  DIDiskImageObjectRetain_0(a2);
  int v28 = a1;
  DIDiskImageObjectRetain_0(a1);
  *(void *)&__int128 v37 = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1);
  pthread_mutex_init((pthread_mutex_t *)&v31[1], 0LL);
  pthread_cond_init((pthread_cond_t *)&v35[1], 0LL);
  pthread_mutex_init((pthread_mutex_t *)&v35[7], 0LL);
  pthread_cond_init((pthread_cond_t *)&v35[15], 0LL);
  BYTE8(v36) = 0;
  *((void *)&v37 + 1) = 0LL;
  v38[0] = 0LL;
  pthread_mutex_init((pthread_mutex_t *)&v38[1], 0LL);
  CFTypeID v4 = operator new(0x98uLL);
  sub_188241AF8((uint64_t)v4);
  *(void *)&__int128 v27 = v4;
  uint64_t v5 = operator new(0x98uLL);
  sub_188241AF8((uint64_t)v5);
  *((void *)&v27 + 1) = v5;
  LODWORD(v30) = 1;
  unsigned int v6 = (const __CFString *)(*(uint64_t (**)(char *, const __CFString *))(*(void *)a1 + 24LL))( a1,  @"thread-safe");
  if (sub_188238A38(v6, 0))
  {
    v25.__darwin_time_t tv_sec = 4LL;
    int v7 = sysctlbyname("hw.ncpu", &v26, (size_t *)&v25, 0LL, 0LL);
    int v8 = 2 * (_DWORD)v26;
    if (v7) {
      int v8 = 2;
    }
    LODWORD(v30) = v8;
    unsigned int v9 = (const __CFString *)sub_188238A30();
    uint64_t v10 = v9;
    if (v9)
    {
      LODWORD(v25.tv_sec) = 4;
      if (sub_18824D608(v9, kCFNumberSInt32Type, &v25)
        && SLODWORD(v25.tv_sec) >= 1
        && (int)v30 > SLODWORD(v25.tv_sec))
      {
        LODWORD(v30) = v25.tv_sec;
      }

      CFRelease(v10);
    }
  }

  size_t v11 = (int)v30 + 1LL;
  LODWORD(v30) = v30 + 1;
  DWORD1(v30) = 2 * v11;
  DWORD2(v30) = v11;
  v31[0] = calloc(v11, 8uLL);
  if (v31[0])
  {
    if (SDWORD1(v30) >= 1)
    {
      int v12 = 0;
      do
      {
        int v13 = operator new(0x100068uLL);
        sub_188241B44((uint64_t)v13);
        *int v13 = &off_18A20B920;
        v13[11] = 0LL;
        v13[12] = 0LL;
        (*(void (**)(void, void *))(*(void *)v27 + 16LL))(v27, v13);
        ++v12;
      }

      while (v12 < SDWORD1(v30));
    }

    if ((int)v30 <= 1)
    {
      uint64_t v15 = 0LL;
    }

    else
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
      do
      {
        pthread_create((pthread_t *)((char *)v31[0] + v14), 0LL, (void *(__cdecl *)(void *))sub_18825538C, &v27);
        ++v15;
        v14 += 8LL;
      }

      while (v15 < (int)v30 - 1LL);
    }

    pthread_create((pthread_t *)v31[0] + v15, 0LL, (void *(__cdecl *)(void *))sub_188255530, &v27);
    pthread_mutex_lock((pthread_mutex_t *)&v31[1]);
    while (DWORD2(v30))
      pthread_cond_wait((pthread_cond_t *)&v35[1], (pthread_mutex_t *)&v31[1]);
    pthread_mutex_unlock((pthread_mutex_t *)&v31[1]);
    v25.__darwin_time_t tv_sec = time(0LL) + 1;
    v25.tv_nsec = 0LL;
    pthread_mutex_lock((pthread_mutex_t *)&v35[7]);
    while (1)
    {
      pthread_cond_timedwait((pthread_cond_t *)&v35[15], (pthread_mutex_t *)&v35[7], &v25);
      if ((void)v37) {
        v17.n128_f32[0] = (float)((float)*((uint64_t *)&v37 + 1) * 100.0) / (float)(uint64_t)v37;
      }
      else {
        v17.n128_u32[0] = 1120403456;
      }
      (*(void (**)(char *, __n128))(*(void *)a1 + 344LL))(a1, v17);
      int v18 = (*(uint64_t (**)(char *))(*(void *)a1 + 352LL))(a1);
      int v19 = v18;
      int v20 = BYTE8(v36) ? 1 : v18;
      if (v20 == 1) {
        break;
      }
      ++v25.tv_sec;
    }

    BYTE8(v36) = 1;
    if ((int)v30 >= 1)
    {
      int v21 = 0;
      do
      {
        (*(void (**)(void))(**((void **)&v27 + 1) + 48LL))(*((void *)&v27 + 1));
        (*(void (**)(void))(*(void *)v27 + 48LL))(v27);
        ++v21;
      }

      while (v21 < (int)v30);
    }

    if (v19) {
      uint64_t v16 = 111LL;
    }
    else {
      uint64_t v16 = 0LL;
    }
    pthread_mutex_unlock((pthread_mutex_t *)&v35[7]);
    if ((int)v30 >= 1)
    {
      uint64_t v22 = 0LL;
      do
      {
        pthread_join(*((pthread_t *)v31[0] + v22), &v26);
        if ((_DWORD)v16) {
          BOOL v23 = 1;
        }
        else {
          BOOL v23 = v26 == 0LL;
        }
        if (v23) {
          uint64_t v16 = v16;
        }
        else {
          uint64_t v16 = v26;
        }
        ++v22;
      }

      while (v22 < (int)v30);
    }
  }

  else
  {
    uint64_t v16 = 12LL;
  }

  (*(void (**)(char *))(*(void *)a2 + 72LL))(a2);
  (*(void (**)(char *, float))(*(void *)a1 + 344LL))(a1, 100.0);
  sub_18823ADA4(v29);
  int v29 = 0LL;
  sub_18823ADA4(v28);
  int v28 = 0LL;
  if ((void)v27) {
    (*(void (**)(void))(*(void *)v27 + 8LL))(v27);
  }
  if (*((void *)&v27 + 1)) {
    (*(void (**)(void))(**((void **)&v27 + 1) + 8LL))(*((void *)&v27 + 1));
  }
  pthread_mutex_destroy((pthread_mutex_t *)&v31[1]);
  pthread_cond_destroy((pthread_cond_t *)&v35[1]);
  pthread_mutex_destroy((pthread_mutex_t *)&v35[7]);
  pthread_cond_destroy((pthread_cond_t *)&v35[15]);
  pthread_mutex_destroy((pthread_mutex_t *)&v38[1]);
  if (v31[0]) {
    free(v31[0]);
  }
  return v16;
}

void sub_188255368(_Unwind_Exception *a1)
{
}

uint64_t sub_18825538C(void *a1)
{
  uint64_t v15 = 0LL;
  unsigned int v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  int v3 = (*(uint64_t (**)(void, void **, void))(*(void *)*a1 + 32LL))(*a1, &v15, 0LL);
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v15 == 0LL;
  }
  if (!v4)
  {
    while (1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 39));
      uint64_t v5 = a1[38];
      uint64_t v6 = a1[36];
      if (v5 + 2048 < v6) {
        uint64_t v6 = v5 + 2048;
      }
      a1[38] = v6;
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 39));
      uint64_t v7 = a1[36];
      if (v7 <= v5)
      {
        int v3 = 0;
        goto LABEL_25;
      }

      if (v5 + 2048 <= v7) {
        uint64_t v8 = 2048LL;
      }
      else {
        uint64_t v8 = v7 - v5;
      }
      int v9 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, void *))(*(void *)a1[2] + 48LL))( a1[2],  v5,  v8,  &v14,  v15 + 13);
      if (v9)
      {
        int v3 = v9;
        goto LABEL_24;
      }

      if (v14 != v8) {
        break;
      }
      uint64_t v10 = v15;
      v15[11] = v5;
      v10[12] = v8;
      (*(void (**)(void))(*(void *)a1[1] + 24LL))(a1[1]);
      uint64_t v15 = 0LL;
      int v11 = (*(uint64_t (**)(void, void **, void))(*(void *)*a1 + 32LL))(*a1, &v15, 0LL);
      if (v11) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v15 == 0LL;
      }
      if (v12)
      {
        int v3 = v11;
        goto LABEL_19;
      }
    }

    int v3 = 5;
    goto LABEL_24;
  }

uint64_t sub_188255530(void *a1)
{
  int v13 = 0LL;
  unsigned int v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  uint64_t v3 = a1[36];
  uint64_t v12 = a1[37];
  if (v12 >= v3)
  {
LABEL_9:
    int v10 = 0;
  }

  else
  {
    while (1)
    {
      int v4 = (*(uint64_t (**)(void, BOOL (*)(uint64_t, void *), uint64_t *, void **))(*(void *)a1[1] + 40LL))( a1[1],  sub_18825566C,  &v12,  &v13);
      uint64_t v5 = v13;
      if (v4 || v13 == 0LL) {
        break;
      }
      uint64_t v7 = a1[37] + 2048LL;
      if (v7 >= a1[36]) {
        uint64_t v7 = a1[36];
      }
      a1[37] = v7;
      (*(void (**)(void, void *, void))(*(void *)a1[3] + 56LL))(a1[3], v5 + 13, v5[12] << 9);
      uint64_t v8 = v13;
      v13[11] = 0LL;
      v8[12] = 0LL;
      (*(void (**)(void))(*(void *)*a1 + 16LL))(*a1);
      uint64_t v9 = a1[36];
      uint64_t v12 = a1[37];
      int v13 = 0LL;
      if (v12 >= v9) {
        goto LABEL_9;
      }
    }

    int v10 = v4;
  }

  pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
  *((_BYTE *)a1 + 280) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
  if (v13) {
    (*(void (**)(void *))(*v13 + 8LL))(v13);
  }
  return v10;
}

BOOL sub_18825566C(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 88) != *a2;
}

void sub_188255680(void *a1)
{
}

void sub_1882556A4(_Unwind_Exception *a1)
{
}

uint64_t sub_1882556B8(char *a1, CFDictionaryRef theDict, char **a3)
{
  v38[16] = *MEMORY[0x1895F89C0];
  uint64_t v35 = 0LL;
  uint64_t v36 = -1LL;
  int v34 = 0;
  CFArrayRef theArray = 0LL;
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  if (!theDict) {
    return 22LL;
  }
  uint64_t v6 = (const __CFString *)CFDictionaryGetValue(theDict, @"checksum-image-type");
  if (!v6) {
    return 22LL;
  }
  uint64_t v7 = v6;
  CFTypeID v8 = CFGetTypeID(v6);
  if (v8 != CFStringGetTypeID()) {
    return 22LL;
  }
  if (CFStringCompare(v7, @"UDIF-CRC32", 0LL))
  {
    if (CFStringCompare(v7, @"UDIF-MD5", 0LL))
    {
      if (CFStringCompare(v7, @"IPOD", 0LL)) {
        return 22LL;
      }
      int v11 = (char *)operator new(0x78uLL);
      sub_1882404B0((uint64_t)v11);
      unsigned int v12 = 6;
    }

    else
    {
      int v11 = (char *)operator new(0xA0uLL);
      sub_188257330();
      unsigned int v12 = 3;
    }
  }

  else
  {
    int v11 = (char *)operator new(0x78uLL);
    sub_1882404B0((uint64_t)v11);
    unsigned int v12 = 1;
  }

  if (CFDictionaryGetValueIfPresent(theDict, @"udif-chunk-size", (const void **)&value)
    && !sub_18824D608((const __CFString *)value, kCFNumberSInt64Type, &v36))
  {
    uint64_t v9 = 999LL;
  }

  else
  {
    unint64_t v13 = v36;
    if (v36 < 0)
    {
      unint64_t v13 = 2048LL;
      uint64_t v36 = 2048LL;
    }

    uint64_t v9 = sub_188264990(a1, v12, 1, v13, 0LL, (void ****)&v35, &v34, &theArray, 1);
    if (!(_DWORD)v9)
    {
      (*(void (**)(char *))(*(void *)v11 + 48LL))(v11);
      (*(void (**)(char *, float))(*(void *)a1 + 344LL))(a1, 0.0);
      if (v34 < 1)
      {
LABEL_39:
        uint64_t v9 = 0LL;
      }

      else
      {
        CFIndex v14 = 0LL;
        uint64_t v15 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        __int128 v32 = (const __CFBoolean *)*MEMORY[0x189604DE8];
        while (1)
        {
          uint64_t v16 = (void *)*((void *)v35 + v14);
          if (!v16)
          {
            uint64_t v9 = 22LL;
            goto LABEL_50;
          }

          __n128 v17 = (char *)sub_188240ECC((uint64_t)v11);
          if (!v17)
          {
            uint64_t v9 = 999LL;
            goto LABEL_50;
          }

          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v14);
          if (ValueAtIndex) {
            int v19 = ValueAtIndex;
          }
          else {
            int v19 = &stru_18A20E810;
          }
          int v20 = DIGetBundleRef();
          int v21 = (const __CFString *)sub_1882660CC( v20,  (int)@"Checksumming %1$@\\U2026",  @"Checksumming %1$@\\U2026");
          CFStringRef v22 = CFStringCreateWithFormat(v15, 0LL, v21, v19);
          (*(void (**)(char *, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v22, 16LL);
          if (v22) {
            CFRelease(v22);
          }
          if (v21) {
            CFRelease(v21);
          }
          uint64_t v9 = sub_188241604(a1, v16, v17);
          (*(void (**)(char *, const __CFString *, uint64_t))(*(void *)a1 + 336LL))( a1,  &stru_18A20E810,  16LL);
          if ((_DWORD)v9) {
            break;
          }
          BOOL v23 = (const void *)(*(uint64_t (**)(char *, void, char *))(*(void *)a1 + 376LL))(a1, 0LL, v17);
          int v24 = DIGetBundleRef();
          timespec v25 = (const __CFString *)sub_1882660CC(v24, (int)@"%1$@: %2$@", @"%1$@: %2$@");
          CFStringRef v26 = sub_1882434F4(v19, 36LL, v32);
          CFStringRef v27 = CFStringCreateWithFormat(v15, 0LL, v25, v26, v23);
          (*(void (**)(char *, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v27, 8LL);
          if (v26) {
            CFRelease(v26);
          }
          if (v27) {
            CFRelease(v27);
          }
          if (v25) {
            CFRelease(v25);
          }
          if (v23) {
            CFRelease(v23);
          }
          (*(void (**)(char *, void **))(*(void *)v17 + 136LL))(v17, &value);
          (*(void (**)(char *, void *, unint64_t))(*(void *)v11 + 56LL))( v11,  v38,  (unint64_t)HIDWORD(value) >> 3);
          DIDiskImageObjectRelease(v17);
          if (++v14 >= v34) {
            goto LABEL_39;
          }
        }

        int v28 = DIGetBundleRef();
        int v29 = (const __CFString *)sub_1882660CC( v28,  (int)@"%1$@: checksum failed with error %2$ld.",  @"%1$@: checksum failed with error %2$ld.");
        CFStringRef v30 = sub_1882434F4(v19, 36LL, v32);
        CFStringRef v31 = CFStringCreateWithFormat(v15, 0LL, v29, v30, v9);
        (*(void (**)(char *, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v31, 8LL);
        if (v30) {
          CFRelease(v30);
        }
        if (v31) {
          CFRelease(v31);
        }
        if (v29) {
          CFRelease(v29);
        }
        DIDiskImageObjectRelease(v17);
      }

LABEL_50:
      (*(void (**)(char *))(*(void *)v11 + 72LL))(v11);
      (*(void (**)(char *, float))(*(void *)a1 + 344LL))(a1, 100.0);
    }
  }

  sub_188255BD0((void ***)v35, v34);
  uint64_t v35 = 0LL;
  if (theArray)
  {
    CFRelease(theArray);
    CFArrayRef theArray = 0LL;
  }

  if ((_DWORD)v9)
  {
    DIDiskImageObjectRelease(v11);
    int v11 = 0LL;
  }

  *a3 = v11;
  return v9;
}

        ++v40;
        v41 += 10;
        int v39 = *v38;
        if (v40 >= *(_DWORD *)(*v38 + 200)) {
          goto LABEL_61;
        }
      }

      uint64_t v45 = *((void *)v41 + 2);
      uint64_t v46 = *(void *)(v39 + 8) + *((void *)v41 + 1);
      while (1)
      {
        if (!v45)
        {
          CFIndex v14 = v79;
          uint64_t v9 = v75;
          int v29 = v77;
          goto LABEL_50;
        }

        uint64_t v47 = v45 >= 512 ? 512LL : v45;
        uint64_t v83 = v47;
        unsigned int v48 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 48LL))(a1, v46);
        if ((_DWORD)v48) {
          break;
        }
        unsigned int v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t *, void *))(*(void *)v85 + 64LL))( v85,  v46,  v83,  &v83,  v82);
        if ((_DWORD)v48) {
          break;
        }
        v45 -= v83;
        v30 += v83;
        v46 += v83;
        (*(void (**)(uint64_t, float))(*(void *)a1 + 344LL))(a1, (float)((float)v30 * 100.0) / v31);
        if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 352LL))(a1))
        {
          int v28 = 111LL;
          goto LABEL_92;
        }
      }

      int v28 = v48;
LABEL_92:
      CFMutableDictionaryRef Mutable = 0LL;
      LOBYTE(v18) = 1;
LABEL_93:
      CFIndex v14 = v79;
      a7 = v80;
    }
  }

  (*(void (**)(void *))(*v14 + 8LL))(v14);
  if (v82) {
    free(v82);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t v64 = v85;
  unint64_t v65 = v18 ^ 1;
  if (!(_DWORD)v28) {
    unint64_t v65 = 1;
  }
  if ((v65 & 1) != 0 || !v85)
  {
    if ((_DWORD)v28) {
      uint64_t v73 = 1;
    }
    else {
      uint64_t v73 = a7 == 0LL;
    }
    if (!v73 || !v85)
    {
      if (a7) {
        goto LABEL_122;
      }
      return v28;
    }
  }

  else
  {
    CFStringRef v66 = (*(uint64_t (**)(void))(*(void *)v85 + 296LL))();
    if (v66)
    {
      CFNumberRef v67 = (const __CFArray *)(*(uint64_t (**)(uint64_t))(*(void *)v66 + 216LL))(v66);
      if (v67)
      {
        unsigned int v68 = v67;
        CFRetain(v67);
        if (v85)
        {
          DIDiskImageObjectRelease(v85);
          int v85 = 0LL;
        }

        int Count = CFArrayGetCount(v68);
        if (Count >= 1)
        {
          unsigned int v70 = Count;
          for (int i = 0LL; i != v70; ++i)
          {
            int v72 = (const __CFURL *)CFArrayGetValueAtIndex(v68, i);
            sub_188254594(v72);
          }
        }

        CFRelease(v68);
      }
    }

    uint64_t v64 = v85;
    if (!v85)
    {
      if (!a7) {
        return v28;
      }
      goto LABEL_120;
    }
  }

  DIDiskImageObjectRelease(v64);
  if (a7)
  {
LABEL_120:
    uint64_t v64 = 0LL;
LABEL_122:
    *a7 = v64;
  }

  return v28;
}

void sub_188255BAC(_Unwind_Exception *a1)
{
}

void sub_188255BD0(void ***a1, int a2)
{
  if (a1)
  {
    if (a2 >= 1)
    {
      uint64_t v3 = a2;
      int v4 = a1;
      do
      {
        sub_188266150(*v4);
        *v4++ = 0LL;
        --v3;
      }

      while (v3);
    }

    free(a1);
  }

BOOL sub_188255C24(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  int64_t v4 = (a4 >> 9) * (unint64_t)bswap32(*(_DWORD *)(a2 + 8));
  uint64_t v5 = sub_18824A018(a1);
  return v4 >= (*(uint64_t (**)(uint64_t))(*(void *)v5 + 96LL))(v5);
}

uint64_t sub_188255C7C(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  if (!a3) {
    return 4294966296LL;
  }
  int v3 = sub_188245AE8(a3, @"convert-image-type", 0LL);
  uint64_t result = 4294966296LL;
  if (v3 > 1430542926)
  {
    if (v3 != 1430542927 && v3 != 1431062095)
    {
      int v5 = 1430667849;
LABEL_10:
      if (v3 != v5) {
        return result;
      }
    }
  }

  else if (v3 != 1229999940 && v3 != 1430537039)
  {
    int v5 = 1430540879;
    goto LABEL_10;
  }

  return 100LL;
}

uint64_t sub_188255D24(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v3 = 4294966296LL;
  if (a3)
  {
    else {
      return 4294966296LL;
    }
  }

  return v3;
}

uint64_t sub_188255D70(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v3 = 4294966296LL;
  if (a3)
  {
    int v4 = sub_188245AE8(a3, @"convert-image-type", 0LL);
    if (v4 == 1430540887 || v4 == 1430541391) {
      return 100LL;
    }
    else {
      return 4294966296LL;
    }
  }

  return v3;
}

uint64_t sub_188255DC4(const __CFURL *a1, char *a2, const __CFDictionary *a3, void *a4)
{
  int valuePtr = 8;
  CFStringRef v22 = 0LL;
  BOOL v23 = 0LL;
  CFTypeRef v20 = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v19 = -1LL;
  if (!a2) {
    goto LABEL_7;
  }
  DIDiskImageObjectRetain_0(a2);
  if (!a3) {
    goto LABEL_7;
  }
  int v8 = sub_188245AE8(a3, @"convert-image-type", 0LL);
  if (!v8) {
    goto LABEL_7;
  }
  int v9 = v8;
  int v10 = sub_188239FB0(a3, @"convert-add-partition-map", 0);
  int v11 = (const __CFNumber *)CFDictionaryGetValue(a3, @"convert-alignment");
  if (v11) {
    CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
  }
  if (v10)
  {
LABEL_7:
    uint64_t v12 = 22LL;
    goto LABEL_8;
  }

  if (!sub_18824D608((const __CFString *)value, kCFNumberSInt64Type, &v19))
  {
    uint64_t v12 = 999LL;
    goto LABEL_8;
  }

  unint64_t v14 = v19;
  if (v19 < 0)
  {
LABEL_18:
    unint64_t v14 = 2048LL;
    uint64_t v19 = 2048LL;
  }

  if (v9 == 1430541391) {
    unsigned int v15 = 5;
  }
  else {
    unsigned int v15 = 1;
  }
  uint64_t v16 = sub_188264990(a2, v15, 1, v14, (__CFDictionary **)&v20, (void ****)&v22, (int *)&value, (__CFArray **)&cf, 1);
  __n128 v17 = (void ***)v22;
  if (!(_DWORD)v16)
  {
    uint64_t v12 = sub_18825D090((uint64_t)a2, a3, v9, (uint64_t)v22, (int)value, (const __CFArray *)cf, a1, &v23);
    __n128 v17 = (void ***)v22;
    if (!v22) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }

  uint64_t v12 = v16;
  if (v22) {
LABEL_26:
  }
    sub_188255BD0(v17, (int)value);
LABEL_8:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (v20)
  {
    CFRelease(v20);
    CFTypeRef v20 = 0LL;
  }

  if (a2) {
    DIDiskImageObjectRelease(a2);
  }
  *a4 = v23;
  return v12;
}

void *sub_188255F8C(void *result)
{
  *uint64_t result = &off_18A20B960;
  return result;
}

uint64_t sub_188255F9C(uint64_t a1)
{
  return gettimeofday((timeval *)(a1 + 8), 0LL);
}

uint64_t sub_188255FA8(uint64_t a1)
{
  return gettimeofday((timeval *)(a1 + 24), 0LL);
}

uint64_t sub_188255FB4(uint64_t a1)
{
  return 1000 * (1000000LL * (*(void *)(a1 + 24) - *(void *)(a1 + 8)) - *(int *)(a1 + 16) + *(int *)(a1 + 32));
}

uint64_t DIDiskImageCopyImageInformation(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
}

__CFDictionary *sub_188255FF8(char *a1)
{
  unsigned int v2 = sub_1882562C4(a1);
  if (v2)
  {
    uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    CFDictionaryAddValue(v2, @"Size Information", Mutable);
    int v5 = DIGetBundleRef();
    CFTypeRef v6 = sub_1882660CC(v5, (int)@"raw read/write", @"raw read/write");
    CFDictionaryAddValue(v2, @"Format Description", v6);
    if (v6) {
      CFRelease(v6);
    }
    unsigned int v7 = (*(uint64_t (**)(char *))(*(void *)a1 + 88LL))(a1);
    CFStringRef v8 = sub_18823EE58(v7);
    CFDictionaryAddValue(v2, @"Format", v8);
    if (v8) {
      CFRelease(v8);
    }
    uint64_t valuePtr = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1) << 9;
    CFNumberRef v9 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Total Bytes", v9);
    if (v9) {
      CFRelease(v9);
    }
    uint64_t valuePtr = 0LL;
    CFNumberRef v10 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Total Empty Bytes", v10);
    if (v10) {
      CFRelease(v10);
    }
    uint64_t valuePtr = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1) << 9;
    CFNumberRef v11 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Total Non-Empty Bytes", v11);
    if (v11) {
      CFRelease(v11);
    }
    uint64_t valuePtr = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1) << 9;
    CFNumberRef v12 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Compressed Bytes", v12);
    if (v12) {
      CFRelease(v12);
    }
    uint64_t v17 = 0x3FF0000000000000LL;
    CFNumberRef v13 = CFNumberCreate(v3, kCFNumberDoubleType, &v17);
    CFDictionaryAddValue(Mutable, @"Compressed Ratio", v13);
    if (v13) {
      CFRelease(v13);
    }
    uint64_t valuePtr = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1);
    CFNumberRef v14 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, @"Sector Count", v14);
    if (v14) {
      CFRelease(v14);
    }
    uint64_t Value = (__CFDictionary *)CFDictionaryGetValue(v2, @"Properties");
    CFDictionaryAddValue(Value, @"Compressed", @"no");
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  return v2;
}

__CFDictionary *sub_1882562C4(char *a1)
{
  uint64_t v2 = (*(uint64_t (**)(char *))(*(void *)a1 + 296LL))(a1);
  uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    int v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
    CFTypeRef v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
    CFMutableDictionaryRef v7 = CFDictionaryCreateMutable(v3, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFMutableDictionaryRef v8 = CFDictionaryCreateMutable(v3, 0LL, v5, v6);
    CFDictionaryAddValue(Mutable, @"Backing Store Information", v7);
    int v38 = Mutable;
    theDict = v8;
    CFDictionaryAddValue(Mutable, @"Properties", v8);
    CFRelease(v7);
    int v35 = (*(uint64_t (**)(char *))(*(void *)a1 + 384LL))(a1);
    int v36 = (*(uint64_t (**)(char *))(*(void *)a1 + 200LL))(a1);
    if (v2)
    {
      CFNumberRef v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
      while (1)
      {
        CFNumberRef v10 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 16LL))(v2);
        CFStringRef v11 = CFStringCreateWithCString(v3, v10, 0x8000100u);
        CFDictionaryAddValue(v7, @"Class Name", v11);
        if (v11) {
          CFRelease(v11);
        }
        CFNumberRef v12 = (const __CFURL *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 176LL))(v2);
        CFStringRef v13 = CFURLGetString(v12);
        CFDictionaryAddValue(v7, @"URL", v13);
        CFNumberRef v14 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 192LL))(v2);
        CFDictionaryAddValue(v7, @"Name", v14);
        if ((*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)v2 + 24LL))( v2,  @"encryption-class"))
        {
          unsigned int v15 = (const void *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)v2 + 24LL))( v2,  @"encryption-class");
          CFDictionaryAddValue(v7, @"Encryption", v15);
        }

        uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 496LL))(v2);
        if (!v16) {
          break;
        }
        uint64_t v2 = v16;
        CFMutableDictionaryRef v17 = CFDictionaryCreateMutable(v3, 0LL, MEMORY[0x189605240], v9);
        CFDictionaryAddValue(v7, @"Backing Store Information", v17);
        CFRelease(v17);
        CFMutableDictionaryRef v7 = v17;
      }
    }

    int v18 = (const void *)(*(uint64_t (**)(char *))(*(void *)a1 + 304LL))(a1);
    uint64_t v19 = v18;
    if (v18) {
      CFRelease(v18);
    }
    CFTypeRef v20 = (const void *)*MEMORY[0x189604DE8];
    int v21 = (const void *)*MEMORY[0x189604DE0];
    if (v35) {
      CFStringRef v22 = (const void *)*MEMORY[0x189604DE8];
    }
    else {
      CFStringRef v22 = (const void *)*MEMORY[0x189604DE0];
    }
    CFDictionaryAddValue(theDict, @"Encrypted", v22);
    else {
      BOOL v23 = v21;
    }
    CFDictionaryAddValue(theDict, @"Partitioned", v23);
    if (v19) {
      int v24 = v20;
    }
    else {
      int v24 = v21;
    }
    CFDictionaryAddValue(theDict, @"Software License Agreement", v24);
    else {
      timespec v25 = v21;
    }
    CFDictionaryAddValue(theDict, @"Checksummed", v25);
    if (v36) {
      CFStringRef v26 = v20;
    }
    else {
      CFStringRef v26 = v21;
    }
    CFDictionaryAddValue(theDict, @"Kernel Compatible", v26);
    CFStringRef v27 = (char *)(*(uint64_t (**)(char *))(*(void *)a1 + 176LL))(a1);
    int v28 = (const void *)(*(uint64_t (**)(char *))(*(void *)v27 + 104LL))(v27);
    CFMutableDictionaryRef Mutable = v38;
    CFDictionaryAddValue(v38, @"Checksum Type", v28);
    int v29 = (const void *)(*(uint64_t (**)(char *))(*(void *)v27 + 120LL))(v27);
    CFDictionaryAddValue(v38, @"Checksum Value", v29);
    sub_18823ADA4(v27);
    CFStringRef v30 = (const char *)(*(uint64_t (**)(char *))(*(void *)a1 + 16LL))(a1);
    CFStringRef v31 = CFStringCreateWithCString(v3, v30, 0x8000100u);
    CFDictionaryAddValue(v38, @"Class Name", v31);
    if (v31) {
      CFRelease(v31);
    }
    __int128 v32 = sub_188249440(a1, 23LL);
    if (v32)
    {
      __int128 v33 = v32;
      CFDictionaryAddValue(v38, @"partitions", v32);
      CFRelease(v33);
    }

    if (theDict) {
      CFRelease(theDict);
    }
  }

  return Mutable;
}

const char *sub_188256708()
{
  return "CBSDBackingStore";
}

BOOL sub_188256714(char *a1)
{
  uint64_t v1 = sub_188249440(a1, 23LL);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = (const __CFString *)sub_18824911C(v1, @"partition-scheme");
  if (v3) {
    BOOL v4 = CFStringCompare(v3, @"Apple", 0LL) == kCFCompareEqualTo;
  }
  else {
    BOOL v4 = 0LL;
  }
  CFRelease(v2);
  return v4;
}

uint64_t sub_188256780(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t sub_188256788()
{
  return 0LL;
}

const char *sub_188256790()
{
  return "CRawDiskImage";
}

uint64_t sub_18825679C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 144);
}

uint64_t sub_1882567A4(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  if (v3)
  {
    if (!(*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)v3 + 304LL))(v3, &v5))
    {
      uint64_t v2 = v5 >> 9;
    }
  }

  return v2;
}

uint64_t sub_188256838(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 200);
  if (statfs(*(const char **)(a1 + 296), &v5) < 0)
  {
    uint64_t result = *__error();
    if (!a2) {
      return result;
    }
  }

  else if (v5.f_bavail == -1LL)
  {
    uint64_t result = 0LL;
    if (!a2) {
      return result;
    }
  }

  else
  {
    uint64_t result = 0LL;
    v3 += v5.f_bavail * v5.f_bsize;
    if (!a2) {
      return result;
    }
  }

  *a2 = v3;
  return result;
}

uint64_t sub_1882568E0()
{
  return 22LL;
}

uint64_t sub_1882568E8(const __CFURL *a1, statfs *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = (const char *)sub_18823A054(a1);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  BOOL v4 = (char *)v3;
  uint64_t v5 = statfs(v3, a2);
  if ((v5 & 0x80000000) != 0) {
    uint64_t v5 = *__error();
  }
  free(v4);
  return v5;
}

__CFDictionary *sub_188256940(uint64_t a1)
{
  uint64_t v2 = sub_1882562C4((char *)a1);
  if (!v2) {
    return v2;
  }
  uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFDictionaryAddValue(v2, @"Size Information", Mutable);
  int v5 = *(_DWORD *)(**(void **)(a1 + 904) + 200LL);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v6 + 296LL))(v6, &v75);
  theDict = v2;
  if (v5)
  {
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = 0LL;
    unint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    uint64_t v18 = **(void **)(a1 + 904) + 204LL;
    do
    {
      int v19 = *(_DWORD *)v18;
      uint64_t v20 = *(void *)(v18 + 32);
      if (v20) {
        uint64_t v21 = 0LL;
      }
      else {
        uint64_t v21 = *(void *)(v18 + 16);
      }
      if (v20) {
        uint64_t v22 = *(void *)(v18 + 16);
      }
      else {
        uint64_t v22 = 0LL;
      }
      switch(v19)
      {
        case -2147483644:
          int v15 = 1;
          goto LABEL_21;
        case -2147483643:
          int v8 = 1;
          goto LABEL_21;
        case -2147483642:
          int v9 = 1;
          goto LABEL_21;
        case -2147483641:
          int v17 = 1;
          goto LABEL_21;
        case -2147483640:
          int v16 = 1;
LABEL_21:
          int v7 = 1;
          break;
        default:
          unsigned int v23 = v19 + 1;
          if (v19 < 0) {
            int v24 = 1;
          }
          else {
            int v24 = v7;
          }
          if (v23 >= 3) {
            int v7 = v24;
          }
          break;
      }

      v10 += v20;
      v12 += *(void *)(v18 + 16);
      v11 += v20;
      v14 += v21;
      v13 += v22;
      v18 += 40LL;
      --v5;
    }

    while (v5);
  }

  else
  {
    int v17 = 0;
    int v16 = 0;
    int v15 = 0;
    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
    unint64_t v11 = 0LL;
    uint64_t v10 = 0LL;
    int v9 = 0;
    int v8 = 0;
    LOBYTE(v7) = 0;
  }

  int v69 = v17;
  int v70 = v8;
  int v67 = v9;
  int v68 = v16;
  int v66 = v15;
  uint64_t valuePtr = v75 - v10;
  CFNumberRef v25 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"CUDIFEncoding-bytes-wasted", v25);
  if (v25) {
    CFRelease(v25);
  }
  uint64_t valuePtr = v75;
  CFNumberRef v26 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"CUDIFEncoding-bytes-total", v26);
  if (v26) {
    CFRelease(v26);
  }
  uint64_t valuePtr = v10;
  CFNumberRef v27 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"CUDIFEncoding-bytes-in-use", v27);
  if (v27) {
    CFRelease(v27);
  }
  uint64_t valuePtr = v12 << 9;
  CFNumberRef v28 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"Total Bytes", v28);
  if (v28) {
    CFRelease(v28);
  }
  uint64_t valuePtr = v14 << 9;
  CFNumberRef v29 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"Total Empty Bytes", v29);
  CFStringRef v30 = (uint64_t *)(a1 + 904);
  if (v29) {
    CFRelease(v29);
  }
  uint64_t valuePtr = v13 << 9;
  CFNumberRef v31 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"Total Non-Empty Bytes", v31);
  if (v31) {
    CFRelease(v31);
  }
  uint64_t valuePtr = v11;
  CFNumberRef v32 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"Compressed Bytes", v32);
  if (v32) {
    CFRelease(v32);
  }
  double v73 = (double)(v11 >> 9) / (double)v13;
  CFNumberRef v33 = CFNumberCreate(v3, kCFNumberDoubleType, &v73);
  uint64_t v71 = Mutable;
  CFDictionaryAddValue(Mutable, @"Compressed Ratio", v33);
  if (v33) {
    CFRelease(v33);
  }
  CFMutableDictionaryRef v34 = CFDictionaryCreateMutable(v3, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFDictionaryAddValue(theDict, @"Partition Information", v34);
  uint64_t valuePtr = *(__int16 *)(a1 + 914);
  if (*(__int16 *)(a1 + 912) >= 1)
  {
    CFIndex v35 = 0LL;
    while (1)
    {
      int v36 = CFDictionaryCreateMutable(v3, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      CFNumberRef v37 = CFNumberCreate(v3, kCFNumberLongType, &valuePtr);
      if (v37)
      {
        CFNumberRef v38 = v37;
        CFDictionaryAddValue(v36, @"Partition Number", v37);
        CFRelease(v38);
      }

      if (valuePtr >= -2)
      {
        uint64_t v40 = v30;
        if (valuePtr == -2) {
          goto LABEL_50;
        }
        uint64_t v41 = valuePtr - *(__int16 *)(a1 + 914);
      }

      int v39 = 0LL;
LABEL_60:
      CFStringRef v51 = CFStringCreateWithFormat(0LL, 0LL, @"%ld", valuePtr);
      CFDictionaryAddValue(v34, v51, v36);
      if (v51) {
        CFRelease(v51);
      }
      if (v39) {
        DIDiskImageObjectRelease(v39);
      }
      if (v36) {
        CFRelease(v36);
      }
      ++v35;
      ++valuePtr;
    }

    uint64_t v40 = (uint64_t *)(*(void *)(a1 + 928) + 8 * v41);
LABEL_50:
    uint64_t v42 = *v40;
    if (!*v40)
    {
      int v39 = 0LL;
LABEL_59:
      CFStringRef v30 = (uint64_t *)(a1 + 904);
      goto LABEL_60;
    }

    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 936), v35);
    if (ValueAtIndex)
    {
      uint64_t v44 = ValueAtIndex;
      CFRetain(ValueAtIndex);
    }

    else
    {
      uint64_t v45 = valuePtr;
      int v46 = DIGetBundleRef();
      if (v45 == -1)
      {
        uint64_t v44 = sub_1882660CC(v46, (int)@"Driver Descriptor Map", @"Driver Descriptor Map");
        if (!v44)
        {
LABEL_57:
          unsigned int v48 = (char *)sub_188241454((int *)(*(void *)v42 + 64LL));
          int v39 = v48;
          if (v48)
          {
            uint64_t v49 = (const void *)(*(uint64_t (**)(char *))(*(void *)v48 + 104LL))(v48);
            CFDictionaryAddValue(v36, @"Checksum Type", v49);
            uint64_t v50 = (const void *)(*(uint64_t (**)(char *))(*(void *)v39 + 120LL))(v39);
            CFDictionaryAddValue(v36, @"Checksum Value", v50);
          }

          goto LABEL_59;
        }
      }

      else
      {
        uint64_t v47 = (const __CFString *)sub_1882660CC(v46, (int)@"partition %d", @"partition %d");
        uint64_t v44 = CFStringCreateWithFormat(v3, 0LL, v47, valuePtr);
        CFRelease(v47);
        if (!v44) {
          goto LABEL_57;
        }
      }
    }

    CFDictionaryAddValue(v36, @"Name", v44);
    CFRelease(v44);
    goto LABEL_57;
  }

LABEL_70:
  if (v34) {
    CFRelease(v34);
  }
  if (!(_BYTE)v7)
  {
    int v60 = DIGetBundleRef();
    CFTypeRef v53 = sub_1882660CC(v60, (int)@"UDIF read-only", @"UDIF read-only");
    uint64_t v2 = theDict;
    CFDictionaryAddValue(theDict, @"Format Description", v53);
    unint64_t v54 = @"UDRO";
    if (!v53) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }

  if (!v70)
  {
    uint64_t v2 = theDict;
    if (v69)
    {
      int v61 = DIGetBundleRef();
      CFTypeRef v53 = sub_1882660CC( v61,  (int)@"UDIF read-only compressed (lzfse)",  @"UDIF read-only compressed (lzfse)");
      CFDictionaryAddValue(theDict, @"Format Description", v53);
      unint64_t v54 = @"ULFO";
      if (!v53) {
        goto LABEL_76;
      }
    }

    else if (v68)
    {
      int v62 = DIGetBundleRef();
      CFTypeRef v53 = sub_1882660CC( v62,  (int)@"UDIF read-only compressed (lzma)",  @"UDIF read-only compressed (lzma)");
      CFDictionaryAddValue(theDict, @"Format Description", v53);
      unint64_t v54 = @"ULMO";
      if (!v53) {
        goto LABEL_76;
      }
    }

    else if (v67)
    {
      int v63 = DIGetBundleRef();
      CFTypeRef v53 = sub_1882660CC( v63,  (int)@"UDIF read-only compressed (bzip2)",  @"UDIF read-only compressed (bzip2)");
      CFDictionaryAddValue(theDict, @"Format Description", v53);
      unint64_t v54 = @"UDBZ";
      if (!v53) {
        goto LABEL_76;
      }
    }

    else
    {
      int v64 = DIGetBundleRef();
      if (v66) {
        unint64_t v65 = @"UDIF read-only compressed (ADC)";
      }
      else {
        unint64_t v65 = @"UDIF read-only compressed";
      }
      CFTypeRef v53 = sub_1882660CC(v64, (int)v65, v65);
      CFDictionaryAddValue(theDict, @"Format Description", v53);
      unint64_t v54 = @"UDCO";
      if (!v53) {
        goto LABEL_76;
      }
    }

    goto LABEL_75;
  }

  int v52 = DIGetBundleRef();
  CFTypeRef v53 = sub_1882660CC(v52, (int)@"UDIF read-only compressed (zlib)", @"UDIF read-only compressed (zlib)");
  uint64_t v2 = theDict;
  CFDictionaryAddValue(theDict, @"Format Description", v53);
  unint64_t v54 = @"UDZO";
  if (v53) {
LABEL_75:
  }
    CFRelease(v53);
LABEL_76:
  CFDictionaryAddValue(v2, @"Format", v54);
  uint64_t v75 = *(void *)(*(void *)*v30 + 16LL);
  CFNumberRef v55 = CFNumberCreate(v3, kCFNumberLongLongType, &v75);
  CFDictionaryAddValue(v71, @"Sector Count", v55);
  if (v55) {
    CFRelease(v55);
  }
  uint64_t Value = (__CFDictionary *)CFDictionaryGetValue(v2, @"Properties");
  uint64_t v57 = (const void **)MEMORY[0x189604DE8];
  if (!(_BYTE)v7) {
    uint64_t v57 = (const void **)MEMORY[0x189604DE0];
  }
  CFDictionaryAddValue(Value, @"Compressed", *v57);
  if (v71) {
    CFRelease(v71);
  }
  BOOL v58 = (const void *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(void *)a1 + 24LL))( a1,  @"udif-ordered-chunks");
  if (v58) {
    CFDictionaryAddValue(v2, @"udif-ordered-chunks", v58);
  }
  return v2;
}

const char *sub_188257244()
{
  return "CUDIFEncoding";
}

uint64_t sub_188257250(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 176LL))(result);
  }
  return result;
}

uint64_t sub_188257268(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 192LL))(result);
  }
  return result;
}

const char *sub_188257280()
{
  return "CUDIFDiskImage";
}

BOOL sub_18825728C(void *a1)
{
  uint64_t v1 = (uint64_t *)a1[113];
  uint64_t v2 = *v1;
  unsigned int v3 = *(_DWORD *)(*v1 + 200);
  if (__dynamic_cast( a1,  (const struct __class_type_info *)&unk_18A20C410,  (const struct __class_type_info *)&unk_18A20C6E0,  0LL))
  {
    return 0LL;
  }

  if (!v3) {
    return 1LL;
  }
  uint64_t v5 = 0LL;
  uint64_t v6 = (void *)(v2 + 228);
  unsigned int v7 = 1;
  do
  {
    int v8 = *((_DWORD *)v6 - 6);
    if (v8 < -2147483639 || v8 == 1)
    {
      BOOL result = *v6 >= v5;
      uint64_t v5 = *v6;
    }

    else
    {
      BOOL result = 1LL;
    }

    if (v7 >= v3) {
      break;
    }
    ++v7;
    v6 += 5;
  }

  while (result);
  return result;
}

void *sub_188257334(void *a1)
{
  void *v2 = off_18A20B110;
  v2[16] = 16LL;
  a1[15] = calloc(1uLL, 0x10uLL);
  a1[14] = malloc(0x5CuLL);
  uint64_t v3 = MEMORY[0x1895F8288];
  a1[17] = MEMORY[0x1895F8280];
  a1[18] = v3;
  a1[19] = MEMORY[0x1895F8278];
  return a1;
}

void sub_1882573A8(_Unwind_Exception *a1)
{
}

double sub_1882573C0(uint64_t a1)
{
  uint64_t v1 = sub_1882404D4(a1);
  *(void *)uint64_t v1 = off_18A20E3D0;
  double result = 0.0;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_OWORD *)(v1 + 128) = 0u;
  *(_OWORD *)(v1 + 144) = 0u;
  return result;
}

uint64_t sub_1882573EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 136))(*(void *)(a1 + 112));
}

uint64_t sub_1882573F8()
{
  return 4LL;
}

uint64_t sub_188257400(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 144))(*(void *)(a1 + 112));
}

uint64_t sub_18825740C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 152))(*(void *)(a1 + 120), *(void *)(a1 + 112));
}

uint64_t sub_18825741C(uint64_t a1)
{
  return (8 * *(_DWORD *)(a1 + 128));
}

const void **sub_188257428(const void **result, void *a2, unsigned int a3)
{
  if (result[14])
  {
    unsigned int v3 = a3;
    uint64_t v5 = result;
    unsigned int v6 = v3 >> 3;
    if ((v3 & 7) != 0) {
      size_t v7 = v6 + 1;
    }
    else {
      size_t v7 = v6;
    }
    return (const void **)memcpy(a2, v5[15], v7);
  }

  return result;
}

CFStringRef sub_1882574A8()
{
  return @"MD5";
}

void sub_1882574B4(void *a1)
{
}

void sub_1882574D8(_Unwind_Exception *a1)
{
}

void *sub_1882574EC(void *a1)
{
  *a1 = off_18A20E3D0;
  uint64_t v2 = (void *)a1[14];
  if (v2) {
    free(v2);
  }
  unsigned int v3 = (void *)a1[15];
  if (v3) {
    free(v3);
  }
  return sub_1882405F8(a1);
}

void *sub_188257530(uint64_t a1, const void *a2)
{
  return memcpy(*(void **)(a1 + 120), a2, *(void *)(a1 + 128));
}

uint64_t sub_18825753C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 216LL))(a1);
}

BOOL sub_188257548(uint64_t a1)
{
  uint64_t v2 = (unsigned __int16 *)malloc(0x200uLL);
  if (!v2) {
    return 0LL;
  }
  unsigned int v3 = v2;
  BOOL v4 = !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, _BYTE *, unsigned __int16 *))(*(void *)a1 + 48LL))( a1,  2LL,  1LL,  v6,  v2)
    && (sub_1882575EC(v3), *v3 == 18475)
    && (v3[20] & 0x1FF) == 0
    && v3[1] > 3u;
  free(v3);
  return v4;
}

double sub_1882575EC(unsigned __int16 *a1)
{
  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  *(int8x16_t *)(a1 + 2) = vrev32q_s8(*(int8x16_t *)(a1 + 2));
  *(int8x16_t *)(a1 + 10) = vrev32q_s8(*(int8x16_t *)(a1 + 10));
  *(int8x16_t *)(a1 + 18) = vrev32q_s8(*(int8x16_t *)(a1 + 18));
  *(int8x16_t *)(a1 + 26) = vrev32q_s8(*(int8x16_t *)(a1 + 26));
  *((_DWORD *)a1 + 17) = bswap32(*((_DWORD *)a1 + 17));
  *((void *)a1 + 9) = bswap64(*((void *)a1 + 9));
  sub_188257694((uint64_t)(a1 + 56));
  sub_188257694((uint64_t)(a1 + 96));
  sub_188257694((uint64_t)(a1 + 136));
  sub_188257694((uint64_t)(a1 + 176));
  *(void *)&double result = sub_188257694((uint64_t)(a1 + 216)).n128_u64[0];
  return result;
}

__n128 sub_188257694(uint64_t a1)
{
  uint64_t v1 = 0LL;
  *(void *)a1 = bswap64(*(void *)a1);
  *(int8x8_t *)(a1 + 8) = vrev32_s8(*(int8x8_t *)(a1 + 8));
  do
  {
    uint64_t v2 = (float *)(a1 + 16 + v1);
    float32x4x2_t v4 = vld2q_f32(v2);
    v5.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[0]);
    v5.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[1]);
    vst2q_f32(v2, v5);
    v1 += 32LL;
  }

  while (v1 != 64);
  return (__n128)v4.val[0];
}

uint64_t sub_1882576E4()
{
  return 0LL;
}

uint64_t sub_1882576EC(uint64_t a1)
{
  return *(void *)(a1 + 184);
}

void *sub_1882576F8(void *a1, unsigned int a2)
{
  float32x4x2_t v4 = sub_1882429C0((uint64_t)a1) + 13;
  sub_18825479C((uint64_t)v4);
  *a1 = off_18A20B508;
  a1[13] = &unk_18A20B550;
  sub_1882547D8((uint64_t)v4, a2);
  return a1;
}

void sub_188257754(_Unwind_Exception *a1)
{
}

uint64_t sub_18825777C(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned int a5)
{
  char v26 = 1;
  *(_DWORD *)(a1 + 120) = 0;
  *(void *)(a1 + 112) = a2;
  *(_DWORD *)(a1 + 144) = 8 * a5;
  if (!a5) {
    return 0LL;
  }
  unsigned int v8 = 0;
  uint64_t v9 = a1 + 104;
  uint64_t v10 = &a4[a5];
  unint64_t v11 = a4;
  while (1)
  {
    sub_188257918(a1, &v28, &v27, &v29, v8, (BOOL *)&v26);
    int v12 = v28;
    if (v28 >= 1) {
      break;
    }
    int v12 = v29;
    sub_188257CF8(v9, v11, v29);
    v11 += v29;
LABEL_24:
    v8 += v12;
    if (v8 >= a5) {
      return 0LL;
    }
  }

  uint64_t result = 1000LL;
  if (v11 >= a4)
  {
    uint64_t v14 = &v11[-v27];
    BOOL v15 = v14 < a4 || &v11[v28] > v10;
    if (!v15 && v14 <= a4)
    {
      __int16 v17 = v28;
      while (2)
      {
        switch(v17)
        {
          case 1:
            goto LABEL_21;
          case 2:
            goto LABEL_20;
          case 3:
            goto LABEL_19;
          case 4:
            goto LABEL_18;
          case 5:
            goto LABEL_17;
          case 6:
            goto LABEL_16;
          case 7:
            goto LABEL_15;
          default:
            char v18 = *v14++;
            *v11++ = v18;
LABEL_15:
            char v19 = *v14++;
            *v11++ = v19;
LABEL_16:
            char v20 = *v14++;
            *v11++ = v20;
LABEL_17:
            char v21 = *v14++;
            *v11++ = v21;
LABEL_18:
            char v22 = *v14++;
            *v11++ = v22;
LABEL_19:
            char v23 = *v14++;
            *v11++ = v23;
LABEL_20:
            char v24 = *v14++;
            *v11++ = v24;
LABEL_21:
            char v25 = *v14++;
            *v11++ = v25;
            v28 -= 8;
            __int16 v17 = v28;
            if (v28 <= 0) {
              goto LABEL_24;
            }
            continue;
        }
      }
    }
  }

  return result;
}

uint64_t sub_188257918(uint64_t a1, _WORD *a2, _DWORD *a3, _WORD *a4, unsigned int a5, BOOL *a6)
{
  uint64_t v11 = a1 + 104;
  int v12 = sub_1882579C0(a1 + 104);
  *a2 = v12;
  if (v12 <= 0)
  {
    if (*a6)
    {
      uint64_t result = sub_188257C30(v11);
      *a4 = result;
      *a6 = (_DWORD)result << 16 > 4063232;
      return result;
    }

    goto LABEL_6;
  }

  if (!*a6)
  {
LABEL_6:
    __int16 v13 = v12 + 3;
    goto LABEL_7;
  }

  __int16 v13 = v12 + 2;
LABEL_7:
  *a2 = v13;
  *a6 = 1;
  uint64_t result = sub_188257D84(v11, a5);
  *a3 = result;
  return result;
}

uint64_t sub_1882579C0(uint64_t a1)
{
  switch(sub_188257B24(a1, 0xAu))
  {
    case 0u:
      __int16 v2 = sub_188257B98(a1, 1);
      break;
    case 1u:
      else {
        __int16 v2 = 2;
      }
      break;
    case 2u:
      else {
        __int16 v2 = sub_188257B98(a1, 1) + 5;
      }
      break;
    case 3u:
      __int16 v2 = sub_188257B98(a1, 3) + 11;
      break;
    case 4u:
      __int16 v2 = sub_188257B98(a1, 3) + 19;
      break;
    case 5u:
      __int16 v2 = sub_188257B98(a1, 5) + 27;
      break;
    case 6u:
      __int16 v2 = sub_188257B98(a1, 6) + 59;
      break;
    case 7u:
      __int16 v2 = sub_188257B98(a1, 7) + 123;
      break;
    case 8u:
      __int16 v2 = sub_188257B98(a1, 8) + 251;
      break;
    case 9u:
      __int16 v2 = sub_188257B98(a1, 9) + 507;
      break;
    default:
      __int16 v2 = sub_188257B98(a1, 10) + 1019;
      break;
  }

  return v2;
}

uint64_t sub_188257B24(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(unsigned int *)(a1 + 16);
  if (a2)
  {
    unsigned int v3 = 0x80u >> (v2 & 7);
    float32x4x2_t v4 = (_BYTE *)(*(void *)(a1 + 8) + (v2 >> 3));
    int v5 = 1;
    while (1)
    {
      unsigned int v6 = v5;
      if (v3 >= 2)
      {
        v3 >>= 1;
      }

      else
      {
        ++v4;
        unsigned int v3 = 128;
      }

      ++v5;
      if (v6 >= a2)
      {
        uint64_t v7 = v6;
        goto LABEL_11;
      }
    }

    uint64_t v7 = (v5 - 1);
  }

  else
  {
    uint64_t v7 = 0LL;
    unsigned int v6 = 0;
  }

uint64_t sub_188257B98(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v2 = *(unsigned int *)(a1 + 16);
  *(_DWORD *)(a1 + 16) = v2 + a2;
  if ((v2 + a2) > *(_DWORD *)(a1 + 40))
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 1000;
    __cxa_throw(exception, MEMORY[0x189614718], 0LL);
  }

  return (bswap32(*(_DWORD *)(*(void *)(a1 + 8) + (v2 >> 3))) >> (32 - a2 - (v2 & 7))) & (0xFFFFFFFF >> -(char)a2);
}

void sub_188257C24(_Unwind_Exception *a1, int a2)
{
  if (a2 < 0) {
    __cxa_call_unexpected(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_188257C30(uint64_t a1)
{
  uint64_t v2 = 1LL;
  if (sub_188257B98(a1, 1))
  {
    uint64_t v2 = 2LL;
    int v3 = sub_188257B98(a1, 2);
    if (v3)
    {
      if (v3 == 2)
      {
        return sub_188257B98(a1, 2) + 4;
      }

      else if (v3 == 1)
      {
        return 3LL;
      }

      else
      {
        signed int v4 = sub_188257B98(a1, 4) << 16;
        if (v4 >= 0x80000)
        {
          else {
            return sub_188257B98(a1, 2) + (v4 >> 14) - 16;
          }
        }

        else
        {
          return ((v4 >> 16) + 8);
        }
      }
    }
  }

  return v2;
}

uint64_t sub_188257CF8(uint64_t result, _BYTE *a2, int a3)
{
  uint64_t v3 = *(void *)(result + 8);
  unint64_t v4 = *(unsigned int *)(result + 16);
  unsigned int v5 = v4 + 8 * a3;
  *(_DWORD *)(result + 16) = v5;
  if (v5 > *(_DWORD *)(result + 40))
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 1000;
    __cxa_throw(exception, MEMORY[0x189614718], 0LL);
  }

  if (a3)
  {
    unsigned int v6 = (unsigned __int16 *)(v3 + (v4 >> 3));
    do
    {
      unsigned int v7 = *v6;
      unsigned int v6 = (unsigned __int16 *)((char *)v6 + 1);
      *a2++ = bswap32(v7) >> 16 >> (8 - (v4 & 7));
      --a3;
    }

    while (a3);
  }

  return result;
}

void sub_188257D78(_Unwind_Exception *a1, int a2)
{
  if (a2 < 0) {
    __cxa_call_unexpected(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_188257D84(uint64_t a1, unsigned int a2)
{
  if (a2 >= 0xB)
  {
    if (a2 >= 0x15)
    {
      if (a2 >= 0x29)
      {
        if (a2 >= 0x51)
        {
          if (a2 >= 0xA1)
          {
            if (a2 >= 0x2A1)
            {
              if (a2 >= 0x3E9)
              {
                __int16 v2 = 7;
                if (a2 >= 0xA81)
                {
                  unsigned int v3 = *(_DWORD *)(a1 + 20);
                  if (v3 >= 0x801)
                  {
                    __int16 v2 = 8;
                    if (a2 >= 0x1501 && v3 > 0x1000)
                    {
                      __int16 v2 = 9;
                      if (a2 >= 0x2A01 && v3 > 0x2000)
                      {
                        __int16 v2 = 10;
                        if (a2 >= 0x5401 && v3 > 0x4000)
                        {
                          __int16 v2 = 11;
                          if (a2 >= 0xA801 && v3 > 0x8000)
                          {
                            __int16 v2 = 12;
                            if (a2 >= 0x11171 && v3 > 0x10000)
                            {
                              if (v3 >= 0x20001 && a2 >= 0x2A001) {
                                __int16 v2 = 14;
                              }
                              else {
                                __int16 v2 = 13;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

              else
              {
                __int16 v2 = 6;
              }
            }

            else
            {
              __int16 v2 = 5;
            }
          }

          else
          {
            __int16 v2 = 4;
          }
        }

        else
        {
          __int16 v2 = 3;
        }
      }

      else
      {
        __int16 v2 = 2;
      }
    }

    else
    {
      __int16 v2 = 1;
    }
  }

  else
  {
    __int16 v2 = 0;
  }

  return sub_188257EB0(a1, a2, v2);
}

uint64_t sub_188257EB0(uint64_t a1, unsigned int a2, int a3)
{
  int v6 = 1;
  if (!sub_188257B98(a1, 1))
  {
    uint64_t v12 = a1;
    int v13 = a3;
LABEL_20:
    int v14 = sub_188257B98(v12, v13);
    return (v14 + v6);
  }

  if (!sub_188257B98(a1, 1))
  {
    int v6 = 1 << a3;
    goto LABEL_16;
  }

  int v6 = (5 << a3) + 1;
  if ((5 << a3) + 2 >= a2)
  {
    uint64_t v12 = a1;
    int v13 = 1;
    goto LABEL_20;
  }

  unsigned int v7 = (5 << a3) + 4;
  if (v7 >= a2)
  {
    uint64_t v12 = a1;
    int v13 = 2;
    goto LABEL_20;
  }

  int v8 = (__int16)(a3 + 4);
  if (v8 >= 3)
  {
    int v9 = 4;
    LOWORD(v10) = 3;
    while (1)
    {
      v7 += v9;
      unsigned int v11 = v7 == 1664 ? 1644 : v7;
      v9 *= 2;
      int v10 = (__int16)(v10 + 1);
      if (v10 > v8) {
        goto LABEL_16;
      }
    }

    int v13 = (__int16)v10;
    uint64_t v12 = a1;
    goto LABEL_20;
  }

void sub_188257FC8(void *a1)
{
}

void sub_188257FEC(_Unwind_Exception *a1)
{
}

void *sub_188258000(void *a1)
{
  return sub_18823FEB0(a1);
}

void sub_188258028(_Unwind_Exception *a1)
{
}

unsigned __int16 *sub_188258040(unsigned __int16 *result)
{
  *uint64_t result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  result[4] = bswap32(result[4]) >> 16;
  result[5] = bswap32(result[5]) >> 16;
  *((_DWORD *)result + 3) = bswap32(*((_DWORD *)result + 3));
  LODWORD(v1) = bswap32(result[8]) >> 16;
  else {
    uint64_t v1 = v1;
  }
  result[8] = v1;
  if ((_DWORD)v1)
  {
    __int16 v2 = result + 12;
    do
    {
      *(_DWORD *)(v2 - 3) = bswap32(*(_DWORD *)(v2 - 3));
      *(v2 - 1) = bswap32((unsigned __int16)*(v2 - 1)) >> 16;
      _WORD *v2 = bswap32((unsigned __int16)*v2) >> 16;
      v2 += 4;
      --v1;
    }

    while (v1);
  }

  return result;
}

uint64_t sub_1882580F4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 88LL))(result);
  }
  return result;
}

int8x16_t sub_18825810C(unsigned int *a1, uint64_t a2)
{
  unint64_t v2 = bswap32(*a1);
  *a1 = v2;
  if ((a2 - 4) / 0x14uLL < v2) {
    unint64_t v2 = (a2 - 4) / 0x14uLL;
  }
  if (v2)
  {
    unsigned int v3 = (int8x16_t *)(a1 + 2);
    do
    {
      v3[-1].i32[3] = bswap32(v3[-1].u32[3]);
      int8x16_t result = vrev64q_s8(*v3);
      *unsigned int v3 = result;
      unsigned int v3 = (int8x16_t *)((char *)v3 + 20);
      --v2;
    }

    while (v2);
  }

  return result;
}

uint64_t sub_188258160(uint64_t a1)
{
  int8x16_t v1 = vrev32q_s8(*(int8x16_t *)a1);
  *(int8x16_t *)a1 = v1;
  unsigned int v2 = bswap32(*(_DWORD *)(a1 + 48));
  *(_DWORD *)(a1 + 48) = v2;
  int8x16_t v3 = vrev32q_s8(*(int8x16_t *)(a1 + 84));
  *(int8x16_t *)(a1 + 84) = v3;
  unsigned int v4 = bswap32(*(_DWORD *)(a1 + 100));
  *(_DWORD *)(a1 + 100) = v4;
  uint32x4_t v5 = (uint32x4_t)vextq_s8(v1, v3, 8uLL);
  v5.i32[0] = v2;
  v5.i32[3] = v4;
  if ((vaddvq_s32((int32x4_t)vandq_s8( (int8x16_t)vcgtq_u32(v5, (uint32x4_t)xmmword_18826CF50),  (int8x16_t)xmmword_18826CF60)) & 0xF) != 0) {
    return 107LL;
  }
  else {
    return 0LL;
  }
}

CFDictionaryRef sub_1882581CC(uint64_t a1, int a2)
{
  io_iterator_t existing = 0;
  CFTypeRef cf = 0LL;
  CFTypeRef v23 = 0LL;
  unsigned int v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable)
  {
    CFDictionaryRef Copy = 0LL;
    goto LABEL_19;
  }

  int v6 = Mutable;
  CFMutableArrayRef v7 = CFArrayCreateMutable(v4, 0LL, MEMORY[0x189605228]);
  if (v7)
  {
    int v8 = *(uint64_t (**(uint64_t))(*(void *)a1 + 280LL))(a1);
    int v9 = v8;
    if ((a2 & 1) != 0)
    {
      int v9 = sub_188258504(v8);
      if (!v9)
      {
LABEL_10:
        if (CFArrayGetCount(v7)) {
          CFDictionarySetValue(v6, @"system-entities", v7);
        }
        goto LABEL_12;
      }
    }

    else
    {
      if (!v8) {
        goto LABEL_10;
      }
      CFRetain(v8);
    }

    mach_port_t v11 = *MEMORY[0x1896086B0];
    uint64_t v12 = IOServiceMatching("IOMedia");
    if (!IOServiceGetMatchingServices(v11, v12, &existing))
    {
      if (!IOIteratorIsValid(existing)) {
        MEMORY[0x1895BF69C](existing);
      }
      io_object_t v14 = IOIteratorNext(existing);
      if (v14)
      {
        io_registry_entry_t v15 = v14;
        do
        {
          int v16 = (const __CFDictionary *)IORegistryEntrySearchCFProperty( v15,  "IOService",  @"backingstore-id",  v4,  3u);
          __int16 v17 = v16;
          if (a2)
          {
            char v18 = sub_188258504(v16);
            if (v17) {
              CFRelease(v17);
            }
          }

          else
          {
            char v18 = v16;
          }

          if (v18)
          {
            if (CFEqual(v9, v18))
            {
              if (sub_188244A60(v15, (CFStringRef *)&v23))
              {
                CFTypeRef CFProperty = 0LL;
              }

              else
              {
                CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v15, @"Content", v4, 0);
                sub_188244B30(v23, &cf, 0LL, 0LL);
                char v20 = CFDictionaryCreateMutable(v4, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
                if (v20)
                {
                  char v21 = v20;
                  if (v23) {
                    CFDictionarySetValue(v20, @"dev-entry", v23);
                  }
                  if (cf) {
                    CFDictionarySetValue(v21, @"mount-point", cf);
                  }
                  if (CFProperty) {
                    CFDictionarySetValue(v21, @"content-hint", CFProperty);
                  }
                  if (CFDictionaryGetCount(v21)) {
                    CFArrayAppendValue(v7, v21);
                  }
                  CFRelease(v21);
                }
              }

              if (v23)
              {
                CFRelease(v23);
                CFTypeRef v23 = 0LL;
              }

              if (cf)
              {
                CFRelease(cf);
                CFTypeRef cf = 0LL;
              }

              if (CFProperty) {
                CFRelease(CFProperty);
              }
            }

            CFRelease(v18);
          }

          IOObjectRelease(v15);
          io_registry_entry_t v15 = IOIteratorNext(existing);
        }

        while (v15);
      }
    }

    goto LABEL_10;
  }

LABEL_12:
  if (CFDictionaryGetCount(v6)) {
    CFDictionaryRef Copy = CFDictionaryCreateCopy(v4, v6);
  }
  else {
    CFDictionaryRef Copy = 0LL;
  }
  CFRelease(v6);
  if (v7) {
    CFRelease(v7);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  *CFMutableArrayRef v7 = 0;
  if (!__dst[0]) {
    strcpy(__dst, ".");
  }
  int v8 = opendir(__dst);
  if (!v8) {
    return 999LL;
  }
  int v9 = v8;
  int v10 = a2 + 1;
  do
  {
    mach_port_t v11 = readdir(v9);
    uint64_t v12 = v11;
    int v13 = v10-- != 0;
  }

  while (v13 && v11);
  if (v11)
  {
    strlcat(__dst, "/", 0x400uLL);
    strlcat(__dst, v12->d_name, 0x400uLL);
    io_object_t v14 = sub_18825904C(__dst, a3);
  }

  else
  {
    io_object_t v14 = 0LL;
  }

  closedir(v9);
  return v14;
}

__CFSet *sub_188258504(const __CFDictionary *a1)
{
  CFMutableDictionaryRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605258]);
  if (a1)
  {
    uint64_t Value = (const __CFArray *)CFDictionaryGetValue(a1, @"writeable-components");
    sub_188258580(Mutable, Value);
    unsigned int v4 = (const __CFArray *)CFDictionaryGetValue(a1, @"readonly-components");
    sub_188258580(Mutable, v4);
  }

  return Mutable;
}

void sub_188258580(__CFSet *a1, CFArrayRef theArray)
{
  if (a1)
  {
    if (theArray)
    {
      CFIndex Count = CFArrayGetCount(theArray);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0LL; i != v5; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
          CFSetAddValue(a1, ValueAtIndex);
        }
      }
    }
  }

__CFDictionary *sub_1882585EC(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  int8x16_t v3 = sub_188247D58(a1, @"Geometry");
  if (v3)
  {
    unsigned int v4 = v3;
    CFDictionarySetValue(Mutable, @"Geometry", v3);
    CFRelease(v4);
  }

  CFIndex v5 = sub_188247D58(a1, @"Writable");
  if (v5)
  {
    int v6 = v5;
    CFDictionarySetValue(Mutable, @"Writable", v5);
    CFRelease(v6);
  }

  return Mutable;
}

__CFDictionary *sub_1882586B0(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  unsigned int v2 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)v1 + 192LL))(v1);
  int8x16_t v3 = (char *)sub_18823A098(v2, 0x8000100u);
  unsigned int v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  int v6 = (const CFArrayCallBacks *)MEMORY[0x189605228];
  CFMutableArrayRef v7 = CFArrayCreateMutable(v4, 0LL, MEMORY[0x189605228]);
  CFDictionarySetValue(Mutable, @"system-entities", v7);
  CFRelease(v7);
  if (*v3 == 114) {
    ++v3;
  }
  int v8 = CFArrayCreateMutable(v4, 0LL, v6);
  if (*v3 == 114) {
    int v9 = v3 + 1;
  }
  else {
    int v9 = v3;
  }
  uint64_t v10 = sub_188238BE8(v9);
  if ((_DWORD)v10)
  {
    io_object_t v11 = v10;
    sub_18825D7AC(v10, v8);
    IOObjectRelease(v11);
  }

  if (v8)
  {
    char v22 = Mutable;
    CFIndex Count = CFArrayGetCount(v8);
    if (Count >= 1)
    {
      CFIndex v13 = Count;
      CFIndex v14 = 0LL;
      io_registry_entry_t v15 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, v14);
        __int16 v17 = sub_18824911C(ValueAtIndex, @"BSD Name");
        CFStringRef v18 = CFStringCreateWithFormat(v4, 0LL, @"/dev/%@", v17);
        char v19 = (const __CFString *)sub_18824911C(ValueAtIndex, @"Content");
        sub_188244B30(v18, (CFTypeRef *)&theString, 0LL, 0LL);
        char v20 = CFDictionaryCreateMutable(v4, 0LL, MEMORY[0x189605240], v15);
        CFDictionarySetValue(v20, @"dev-entry", v18);
        if (v19 && CFStringGetLength(v19)) {
          CFDictionarySetValue(v20, @"content-hint", v19);
        }
        if (theString && CFStringGetLength(theString)) {
          CFDictionarySetValue(v20, @"mount-point", theString);
        }
        CFArrayAppendValue(v7, v20);
        if (v20) {
          CFRelease(v20);
        }
        if (v18) {
          CFRelease(v18);
        }
        ++v14;
      }

      while (v13 != v14);
    }

    CFRelease(v8);
    return v22;
  }

  return Mutable;
}

uint64_t DIDiskImageGetImageFormat(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
}

uint64_t sub_18825891C(const void *a1, const __CFDictionary *a2, void *a3)
{
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  int v6 = operator new(0x2A0uLL);
  sub_18823A554((uint64_t)v6);
  *int v6 = off_18A20A870;
  v6[14] = 0LL;
  v6[15] = 0LL;
  v6[13] = 0LL;
  v6[81] = 0x7FFFFFFFLL;
  v6[83] = 0LL;
  bzero(v6 + 16, 0x201uLL);
  sub_188245F20((uint64_t)v6, a1);
  CFMutableArrayRef v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (a2) {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v7, 0LL, a2);
  }
  else {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutable(v7, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  }
  uint64_t v10 = MutableCopy;
  CFDictionarySetValue(MutableCopy, @"writeable", (const void *)*MEMORY[0x189604DE8]);
  io_object_t v11 = v6 + 14;
  uint64_t v12 = DIResolveURLToBackingStore((uint64_t)a1, (uint64_t)v10, 1u, v6 + 14, 0LL);
  if ((_DWORD)v12
    || (uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)*v11 + 296LL))(*v11, &v14), (_DWORD)v12))
  {
    uint64_t v9 = v12;
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  if (!sub_18823CADC(*v11, v6 + 16, v14 - 512) && sub_18824D134((_DWORD *)v6 + 32))
  {
    uint64_t v9 = 0LL;
    *((_DWORD *)v6 + 161) = 1;
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  uint64_t v9 = sub_18823CADC(*v11, v6 + 16, 0LL);
  if (!(_DWORD)v9 && sub_18824D134((_DWORD *)v6 + 32))
  {
    uint64_t v9 = 0LL;
    *((_DWORD *)v6 + 161) = 0;
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  (*(void (**)(uint64_t, void))(*(void *)*v11 + 280LL))(*v11, 0LL);
  if (v10) {
LABEL_17:
  }
    CFRelease(v10);
LABEL_18:
  if ((_DWORD)v9)
  {
    DIDiskImageObjectRelease((char *)v6);
    int v6 = 0LL;
  }

  *a3 = v6;
  return v9;
}

void sub_188258AF0(_Unwind_Exception *a1)
{
}

uint64_t sub_188258B04(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 192);
}

uint64_t sub_188258B0C(uint64_t result)
{
  return result;
}

__CFDictionary *sub_188258B1C(uint64_t a1)
{
  unsigned int v2 = sub_1882562C4((char *)a1);
  if (v2)
  {
    int8x16_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    CFDictionaryAddValue(v2, @"Size Information", Mutable);
    uint64_t v5 = DIGetBundleRef();
    if (v5)
    {
      CFTypeRef v6 = sub_1882660CC(v5, (int)@"sparse", @"sparse");
      CFDictionaryAddValue(v2, @"Format Description", v6);
      if (v6) {
        CFRelease(v6);
      }
      CFDictionaryAddValue(v2, @"Format", @"SPRS");
      unint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1) << 9;
      unint64_t valuePtr = v7;
      uint64_t v8 = sub_188258DF0(*(void *)(a1 + 160));
      unint64_t v9 = ((*(uint64_t (**)(void))(**(void **)(a1 + 160) + 64LL))(*(void *)(a1 + 160)) * v8) << 9;
      if (v9 >= v7) {
        unint64_t v9 = v7;
      }
      unint64_t v20 = v9;
      unint64_t v19 = v7 - v9;
      CFNumberRef v10 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Total Bytes", v10);
      if (v10) {
        CFRelease(v10);
      }
      CFNumberRef v11 = CFNumberCreate(v3, kCFNumberLongLongType, &v19);
      CFDictionaryAddValue(Mutable, @"Total Empty Bytes", v11);
      if (v11) {
        CFRelease(v11);
      }
      CFNumberRef v12 = CFNumberCreate(v3, kCFNumberLongLongType, &v20);
      CFDictionaryAddValue(Mutable, @"Total Non-Empty Bytes", v12);
      if (v12) {
        CFRelease(v12);
      }
      CFNumberRef v13 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Compressed Bytes", v13);
      if (v13) {
        CFRelease(v13);
      }
      uint64_t v18 = 0x3FF0000000000000LL;
      CFNumberRef v14 = CFNumberCreate(v3, kCFNumberDoubleType, &v18);
      CFDictionaryAddValue(Mutable, @"Compressed Ratio", v14);
      if (v14) {
        CFRelease(v14);
      }
      uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
      CFNumberRef v15 = CFNumberCreate(v3, kCFNumberLongLongType, &v22);
      CFDictionaryAddValue(Mutable, @"Sector Count", v15);
      if (v15) {
        CFRelease(v15);
      }
      uint64_t Value = (__CFDictionary *)CFDictionaryGetValue(v2, @"Properties");
      CFDictionaryAddValue(Value, @"Compressed", @"no");
      if (Mutable) {
        CFRelease(Mutable);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

const char *sub_188258DE4()
{
  return "CSparseDiskImage";
}

uint64_t sub_188258DF0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  if (!v1) {
    return 0LL;
  }
  int v2 = *(_DWORD *)(a1 + 16);
  if (!v2) {
    return 0LL;
  }
  LODWORD(result) = 0;
  do
  {
    if (*v1++) {
      uint64_t result = (result + 1);
    }
    else {
      uint64_t result = result;
    }
    --v2;
  }

  while (v2);
  return result;
}

uint64_t sub_188258E24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 64LL))(*(void *)(a1 + 160)) << 27;
}

uint64_t DIBackingStoreGetDataForkLength(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
}

uint64_t sub_188258E54(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 212);
  return 0LL;
}

uint64_t DIBackingStoreReadDataFork(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 328LL))(a1);
}

uint64_t DIBackingStoreOpenResourceFile(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 344LL))(a1);
}

uint64_t DIResourceFileChangedResource(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
}

uint64_t DIResourceFileUpdateResFile(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
}

uint64_t DIBackingStoreCloseResourceFile(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 352LL))(a1, 0LL);
}

uint64_t sub_188258EB0()
{
  return 1LL;
}

uint64_t sub_188258EB8(uint64_t a1, int a2, CFURLRef *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  if (a2 < 1) {
    return 22LL;
  }
  CFTypeRef v6 = *(const char **)(a1 + 296);
  if (!v6) {
    return 9LL;
  }
  strlcpy(__dst, v6, 0x400uLL);
  unint64_t v7 = &__dst[strlen(*(const char **)(a1 + 296)) - 1];
  if (v7 > __dst)
  {
    while (*v7 == 47)
    {
      *v7-- = 0;
      if (v7 <= __dst)
      {
LABEL_11:
        unint64_t v7 = __dst;
        goto LABEL_12;
      }
    }
  }

  if (v7 > __dst)
  {
    while (*v7 != 47)
    {
      if (--v7 <= __dst) {
        goto LABEL_11;
      }
    }
  }

uint64_t sub_18825904C(char *cStr, CFURLRef *a2)
{
  if (!a2) {
    return 22LL;
  }
  *a2 = 0LL;
  if (!cStr) {
    return 22LL;
  }
  if (!*cStr) {
    return 22LL;
  }
  unsigned int v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringRef v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x8000100u);
  if (!v5) {
    return 22LL;
  }
  CFTypeRef v6 = v5;
  Boolean v7 = stat(cStr, &v9) >= 0 && (v9.st_mode & 0x4000) != 0;
  *a2 = CFURLCreateWithFileSystemPath(v4, v6, kCFURLPOSIXPathStyle, v7);
  CFRelease(v6);
  return 0LL;
}

const void *sub_188259104(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    int8x16_t v3 = result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_188259140(void *a1, uint64_t a2)
{
  if (a1[20] == a2) {
    return 0LL;
  }
  uint64_t v5 = a2 << 9;
  uint64_t v6 = (*(uint64_t (**)(void *))(*a1 + 296LL))(a1);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 312LL))(v6, v5);
  if (!(_DWORD)result) {
    a1[20] = a2;
  }
  return result;
}

uint64_t DIBackingStoreGetURL(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
}

uint64_t sub_1882591B0(void *a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1 + 296LL))(a1);
  uint64_t v5 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(void *)v4 + 192LL))(v4);
  uint64_t v6 = (char *)sub_18823A098(v5, 0x8000100u);
  syslog(6, "compaction requested for %s", v6);
  free(v6);
  (*(void (**)(void *, const __CFString *, void))(*a1 + 32LL))( a1,  @"on IO thread",  *MEMORY[0x189604DE8]);
  if (((*(uint64_t (**)(void *))(*a1 + 288LL))(a1) & 1) != 0)
  {
    uint64_t v7 = a1[17];
    if (v7 && (*(unsigned int (**)(uint64_t))(*(void *)v7 + 432LL))(v7))
    {
      syslog(4, "compaction rejected because image is in use");
      return 16LL;
    }

    else
    {
      stat v9 = operator new(0x40uLL);
      sub_1882592F0(v9, a1, a2);
      uint64_t v10 = sub_18825936C((uint64_t)v9);
      (*(void (**)(void *))(*(void *)v9 + 8LL))(v9);
      return v10;
    }
  }

  else
  {
    syslog(4, "compaction rejected because image is not write-enabled");
    return 1LL;
  }

void sub_1882592DC(_Unwind_Exception *a1)
{
}

void *sub_1882592F4(void *a1, char *a2, const void *a3)
{
  *a1 = off_18A20E3A0;
  a1[1] = a2;
  DIDiskImageObjectRetain_0(a2);
  uint64_t v6 = (*(uint64_t (**)(char *))(*(void *)a2 + 96LL))(a2);
  a1[6] = 0LL;
  a1[7] = v6;
  a1[4] = 0LL;
  a1[5] = 0LL;
  a1[2] = sub_188249440(a2, 23LL);
  a1[3] = a3;
  if (a3) {
    CFRetain(a3);
  }
  return a1;
}

uint64_t sub_18825936C(uint64_t a1)
{
  int v2 = DIGetBundleRef();
  CFTypeRef v3 = sub_1882660CC(v2, (int)@"Starting to compact\\U2026", @"Starting to compact\\U2026");
  (*(void (**)(void, CFTypeRef, uint64_t))(**(void **)(a1 + 8) + 336LL))(*(void *)(a1 + 8), v3, 16LL);
  if (v3) {
    CFRelease(v3);
  }
  (*(void (**)(void, float))(**(void **)(a1 + 8) + 344LL))(*(void *)(a1 + 8), -1.0);
  (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 360LL))(*(void *)(a1 + 8), 2LL);
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 8) + 128LL))(*(void *)(a1 + 8), 0LL);
  if (!(_DWORD)result)
  {
    if ((*(unsigned int (**)(void))(**(void **)(a1 + 8) + 352LL))(*(void *)(a1 + 8)))
    {
      int v5 = 222;
LABEL_6:
      syslog(5, "CDiskImageCompactor::compact: line %d: returning kDI_USERCANCELED", v5);
      return 111LL;
    }

    int v6 = DIGetBundleRef();
    CFTypeRef v7 = sub_1882660CC(v6, (int)@"Reclaiming free space\\U2026", @"Reclaiming free space\\U2026");
    (*(void (**)(void, CFTypeRef, uint64_t))(**(void **)(a1 + 8) + 336LL))(*(void *)(a1 + 8), v7, 16LL);
    if (v7) {
      CFRelease(v7);
    }
    uint64_t result = sub_188259680(a1);
    if (!(_DWORD)result)
    {
      if ((*(unsigned int (**)(void))(**(void **)(a1 + 8) + 352LL))(*(void *)(a1 + 8)))
      {
        int v5 = 241;
        goto LABEL_6;
      }

      int v8 = DIGetBundleRef();
      CFTypeRef v9 = sub_1882660CC(v8, (int)@"Finishing compaction\\U2026", @"Finishing compaction\\U2026");
      (*(void (**)(void, CFTypeRef, uint64_t))(**(void **)(a1 + 8) + 336LL))( *(void *)(a1 + 8),  v9,  16LL);
      if (v9) {
        CFRelease(v9);
      }
      (*(void (**)(void, float))(**(void **)(a1 + 8) + 344LL))(*(void *)(a1 + 8), -1.0);
      (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 360LL))(*(void *)(a1 + 8), 2LL);
      uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 8) + 136LL))(*(void *)(a1 + 8), 0LL);
      if (!(_DWORD)result)
      {
        CFStringRef v10 = sub_188259B44(*(void *)(a1 + 40) << 9);
        CFStringRef v11 = sub_188259B44(*(void *)(a1 + 48) << 9);
        int v12 = DIGetBundleRef();
        BOOL v13 = (const __CFString *)sub_1882660CC( v12,  (int)@"Reclaimed %1$@ out of %2$@ possible.",  @"Reclaimed %1$@ out of %2$@ possible.");
        uint64_t v14 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v13, v10, v11);
        (*(void (**)(void, const __CFString *, uint64_t))(**(void **)(a1 + 8) + 336LL))( *(void *)(a1 + 8),  v14,  8LL);
        CFNumberRef v15 = (char *)sub_18823A098(v14, 0x8000100u);
        syslog(5, "%s", v15);
        free(v15);
        if (v14) {
          CFRelease(v14);
        }
        if (v13) {
          CFRelease(v13);
        }
        if (v10) {
          CFRelease(v10);
        }
        if (v11) {
          CFRelease(v11);
        }
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_188259628(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_188241410(a1);
  if (result)
  {
    int v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void, void, void))sub_188241410(a1);
    return v5(3LL, a1, a2, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t sub_188259680(uint64_t a1)
{
  uint64_t Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"partitions");
  if (!Value) {
    return 22LL;
  }
  CFTypeRef v3 = Value;
  CFIndex Count = CFArrayGetCount(Value);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    for (CFIndex i = 0LL; v5 != i; ++i)
    {
      CFNumberRef v15 = 0LL;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, i);
      int v8 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"partition-hint");
      if (CFStringCompare(v8, @"Apple_HFS", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v8, @"Apple_HFSX", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v8, @"Apple_APFS", 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v8, @"not partitioned", 1uLL) == kCFCompareEqualTo)
      {
        CFTypeRef v9 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"partition-start");
        if (v9)
        {
          CFNumberGetValue(v9, kCFNumberLongLongType, &valuePtr);
          CFStringRef v10 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"partition-length");
          if (v10)
          {
            CFNumberGetValue(v10, kCFNumberLongLongType, &v16);
            uint64_t v11 = sub_188249164(*(char **)(a1 + 8), valuePtr, v16, &v15);
            if ((_DWORD)v11) {
              return v11;
            }
            uint64_t v12 = sub_188259874(a1, (uint64_t)v15, valuePtr);
            if (v15)
            {
              DIDiskImageObjectRelease(v15);
              CFNumberRef v15 = 0LL;
            }

            if ((_DWORD)v12) {
              return v12;
            }
            uint64_t v13 = v16 + valuePtr;
            *(void *)(a1 + 32) = v16 + valuePtr;
            (*(void (**)(void, float))(**(void **)(a1 + 8) + 344LL))( *(void *)(a1 + 8),  (float)((float)v13 * 100.0) / (float)*(uint64_t *)(a1 + 56));
          }
        }
      }
    }
  }

  return 0LL;
}

uint64_t sub_188259874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  cf[0] = 0LL;
  int v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable) {
    return 12;
  }
  int v8 = Mutable;
  CFTypeRef v9 = (const void *)*MEMORY[0x189604DE8];
  CFDictionarySetValue(Mutable, @"Writable", (const void *)*MEMORY[0x189604DE8]);
  unsigned int MKMediaRef = DIMediaKitCreateMKMediaRef(a2, 0LL, v8, (uint64_t *)cf);
  unsigned int v32 = MKMediaRef;
  CFRelease(v8);
  if (!MKMediaRef)
  {
    uint64_t v11 = CFDictionaryCreateMutable(v6, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    if (v11)
    {
      uint64_t v12 = v11;
      CFDictionarySetValue(v11, @"Record Off Bits", v9);
      uint64_t v13 = (const __CFDictionary *)MKCFCreateFSInfo();
      CFRelease(v12);
      if (cf[0])
      {
        CFRelease(cf[0]);
        cf[0] = 0LL;
      }

      if (v32)
      {
LABEL_7:
        if (!v13) {
          return v32;
        }
        goto LABEL_33;
      }

      if (v13)
      {
        uint64_t Value = (const __CFDictionary *)CFDictionaryGetValue(v13, @"Attributes");
        if (sub_188239FB0(Value, @"Dirty", 0)
          && !sub_188239FB0( *(const __CFDictionary **)(a1 + 24),  @"allow-compact-busy-filesystem",  0))
        {
          syslog(4, "cannot compact filesystem because it was not unmounted cleanly.");
        }

        else
        {
          uint64_t v17 = (const __CFArray *)CFDictionaryGetValue(v13, @"Data Runs");
          if (v17)
          {
            uint64_t v18 = v17;
            CFIndex Count = CFArrayGetCount(v17);
            if (Count >= 1)
            {
              CFIndex v20 = Count;
              for (CFIndex i = 0LL; i != v20; ++i)
              {
                uint64_t v29 = 0LL;
                uint64_t v30 = 0LL;
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v18, i);
                if (!ValueAtIndex) {
                  break;
                }
                CFTypeRef v23 = ValueAtIndex;
                char v24 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Type");
                if (v24)
                {
                  CFNumberGetValue(v24, kCFNumberSInt16Type, &valuePtr);
                  char v25 = (const __CFNumber *)CFDictionaryGetValue(v23, @"Origin");
                  if (v25) {
                    CFNumberGetValue(v25, kCFNumberSInt64Type, &v30);
                  }
                  v30 += a3;
                  if (valuePtr <= 1u)
                  {
                    char v26 = (const __CFNumber *)CFDictionaryGetValue(v23, @"Length");
                    if (v26) {
                      CFNumberGetValue(v26, kCFNumberSInt64Type, &v29);
                    }
                    if (!valuePtr)
                    {
                      uint64_t v27 = v30;
                      *(void *)(a1 + 48) += v29;
                      unsigned int v32 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 8) + 144LL))( *(void *)(a1 + 8),  v27);
                      if (!v32) {
                        *(void *)(a1 + 40) += cf[1];
                      }
                    }
                  }
                }
              }

              goto LABEL_7;
            }

LABEL_33:
            CFRelease(v13);
            return v32;
          }
        }

        unsigned int v32 = 999;
        goto LABEL_33;
      }

      return 999;
    }

    return 12;
  }

  return v32;
}

uint64_t sub_188259B3C()
{
  return 0LL;
}

CFStringRef sub_188259B44(unint64_t a1)
{
  double v1 = (double)a1 * 0.0009765625;
  double v2 = v1 * 0.0009765625;
  double v3 = v1 * 0.0009765625 * 0.0009765625;
  double v4 = v3 * 0.0009765625;
  if (v3 * 0.0009765625 >= 1.0)
  {
    int v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (v4 == floor(v4)) {
      return CFStringCreateWithFormat(v6, 0LL, @"%qd TB", (unint64_t)v4);
    }
    else {
      return CFStringCreateWithFormat(v6, 0LL, @"%.1f TB", v3 * 0.0009765625);
    }
  }

  else if (v3 >= 1.0)
  {
    CFTypeRef v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (v3 == floor(v3)) {
      return CFStringCreateWithFormat(v7, 0LL, @"%qd GB", (unint64_t)v3);
    }
    else {
      return CFStringCreateWithFormat(v7, 0LL, @"%.1f GB", *(void *)&v3);
    }
  }

  else if (v2 >= 1.0)
  {
    int v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (v2 == floor(v2)) {
      return CFStringCreateWithFormat(v8, 0LL, @"%qd MB", (unint64_t)v2);
    }
    else {
      return CFStringCreateWithFormat(v8, 0LL, @"%.1f MB", *(void *)&v2);
    }
  }

  else if (v1 >= 1.0)
  {
    CFTypeRef v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (v1 == floor(v1)) {
      return CFStringCreateWithFormat(v9, 0LL, @"%qd KB", (unint64_t)v1);
    }
    else {
      return CFStringCreateWithFormat(v9, 0LL, @"%.1f KB", *(void *)&v1);
    }
  }

  else
  {
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%qd bytes", a1);
  }

void sub_188259CB4(void *a1)
{
}

void sub_188259CD8(_Unwind_Exception *a1)
{
}

void *sub_188259CEC(void *a1)
{
  *a1 = off_18A20E3A0;
  double v2 = (char *)a1[1];
  if (v2) {
    sub_18823ADA4(v2);
  }
  double v3 = (const void *)a1[2];
  if (v3) {
    CFRelease(v3);
  }
  double v4 = (const void *)a1[3];
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

CFStringRef sub_188259D3C(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  double v1 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"/dev/%s", v5);
  int HasPrefix = CFStringHasPrefix(v1, @"/dev/disk");
  if (v1) {
    BOOL v3 = HasPrefix == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    CFRelease(v1);
    return 0LL;
  }

  return v1;
}

void *sub_188259DEC(uint64_t a1)
{
  double v1 = sub_188259D3C(a1);
  if (!v1) {
    return 0LL;
  }
  double v2 = v1;
  BOOL v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  v8.CFIndex length = CFStringGetLength(v1) - 5;
  v8.location = 5LL;
  double v4 = CFStringCreateWithSubstring(v3, v2, v8);
  if (v4)
  {
    CFIndex v5 = v4;
    uint64_t v6 = sub_18824D928(v4);
    CFRelease(v5);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  CFRelease(v2);
  return v6;
}

uint64_t DIBackingStoreGetRsrcForkLength(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 376LL))(a1);
}

uint64_t DIBackingStoreOpenDataFork(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 272LL))(a1);
}

uint64_t DIBackingStoreCloseDataFork(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
}

uint64_t DIChecksumGetValue(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
}

uint64_t sub_188259EAC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72LL))(a1);
}

uint64_t DIShadowedDiskImageCopyDefaultShadowFileURL()
{
  return 0LL;
}

uint64_t DIResourceFileAddResource(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 168LL))(a1);
}

uint64_t DIResourceFileGetResource(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
}

uint64_t DIResourceFileReleaseResource(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 240LL))(a1);
}

__CFBundle *DIGetDriverVersion()
{
  uint64_t result = CFBundleGetBundleWithIdentifier(@"com.apple.AppleDiskImageController");
  if (result) {
    return (__CFBundle *)CFBundleGetVersionNumber(result);
  }
  return result;
}

__CFBundle *DIGetFrameworkVersion()
{
  uint64_t result = (__CFBundle *)DIGetBundleRef();
  if (result) {
    return (__CFBundle *)CFBundleGetVersionNumber(result);
  }
  return result;
}

BOOL DIIsPotentiallyValidDiskImage(char *a1, int a2)
{
  CFStringRef v10 = 0LL;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  *(void *)CFTypeRef v9 = 0LL;
  if (a2)
  {
    int v5 = DIResolvePathsToDiskImageWithOptions(a1, 0LL, Mutable, 7u, 1, &v10, 0LL);
    CFURLRef v6 = 0LL;
    BOOL v7 = v5 == 0;
    if (!Mutable) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  CFURLRef v6 = sub_188245DF0(a1);
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"DIIsPotentiallyValidDiskImage", (const void *)*MEMORY[0x189604DE8]);
    if (!DIResolveURLToBackingStore((uint64_t)v6, (uint64_t)Mutable, 1u, v9, 0LL))
    {
      if ((int)sub_18823C8E0(*(uint64_t *)v9, 0LL) > 0 || (int)sub_18823C068(*(uint64_t *)v9, 0LL) > 0)
      {
LABEL_9:
        BOOL v7 = 1LL;
        if (!Mutable) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }

      BOOL v7 = (int)sub_18823D3CC(*(uint64_t *)v9, 0LL) > 0;
      if (!Mutable) {
        goto LABEL_14;
      }
LABEL_13:
      CFRelease(Mutable);
      goto LABEL_14;
    }
  }

  BOOL v7 = 0LL;
  if (Mutable) {
    goto LABEL_13;
  }
LABEL_14:
  if (v6) {
    CFRelease(v6);
  }
  if (*(void *)v9)
  {
    DIDiskImageObjectRelease(*(char **)v9);
    *(void *)CFTypeRef v9 = 0LL;
  }

  if (v10) {
    DIDiskImageObjectRelease(v10);
  }
  return v7;
}

uint64_t DIResolvePathsToDiskImageWithOptions( char *a1, const char *a2, const __CFDictionary *a3, unsigned int a4, int a5, void *a6, CFTypeRef *a7)
{
  if (a6) {
    *a6 = 0LL;
  }
  if (a7) {
    *a7 = 0LL;
  }
  uint64_t v14 = 22LL;
  if (a1 && a6)
  {
    CFURLRef v15 = sub_188245DF0(a1);
    if (!v15)
    {
      uint64_t v14 = 999LL;
LABEL_27:
      if (a7 && *a7 && !CFStringGetLength((CFStringRef)*a7) && *a7)
      {
        CFRelease(*a7);
        *a7 = 0LL;
      }

      return v14;
    }

    CFURLRef v16 = v15;
    uint64_t v17 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (a3) {
      MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, a3);
    }
    else {
      MutableCFDictionaryRef Copy = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    }
    unint64_t v19 = MutableCopy;
    CFStringRef v20 = CFStringCreateWithCString(v17, a1, 0x8000100u);
    if (v20)
    {
      CFDictionarySetValue(v19, @"image-path", v20);
      DIAddPermission(v19, a5);
      if (!a2) {
        goto LABEL_18;
      }
      a2 = (const char *)CFStringCreateWithCString(v17, a2, 0x8000100u);
      if (a2)
      {
        CFDictionarySetValue(v19, @"shadow-file", a2);
LABEL_18:
        uint64_t v14 = DIResolveURLToDiskImage((uint64_t)v16, v19, a4, a6, a7);
        if (!v19) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
    }

    else
    {
      a2 = 0LL;
    }

    uint64_t v14 = 999LL;
    if (!v19)
    {
LABEL_23:
      if (v20) {
        CFRelease(v20);
      }
      CFRelease(v16);
      if (a2) {
        CFRelease(a2);
      }
      goto LABEL_27;
    }

uint64_t DIResolvePathsToDiskImage( char *a1, const char *a2, unsigned int a3, int a4, void *a5, CFTypeRef *a6)
{
  else {
    return 119LL;
  }
}

uint64_t sub_18825A314(uint64_t a1, const uint8_t *a2, int a3, uint8_t *a4, int a5)
{
  if (!a3) {
    return 0LL;
  }
  compression_algorithm v10 = (*(unsigned int (**)(uint64_t))(*(void *)a1 + 56LL))(a1);
  size_t v11 = compression_decode_scratch_buffer_size(v10);
  uint64_t v12 = malloc(v11);
  if (!v12) {
    return 12LL;
  }
  uint64_t v13 = v12;
  compression_algorithm v14 = (*(unsigned int (**)(uint64_t))(*(void *)a1 + 56LL))(a1);
  if (compression_decode_buffer(a4, a5, a2, a3, v13, v14)) {
    uint64_t v15 = 0LL;
  }
  else {
    uint64_t v15 = 1000LL;
  }
  free(v13);
  return v15;
}

const char *sub_18825A3CC()
{
  return "CDecompressor";
}

void sub_18825A3D8(void *a1)
{
}

uint64_t DIUDIFFileAccessWriteResourceFile_0(uint64_t a1)
{
  uint64_t v29 = 0LL;
  if (*(_DWORD *)(a1 + 644) > 1u) {
    return 78LL;
  }
  int v2 = *(_DWORD *)(a1 + 140);
  uint64_t v3 = DIUDIFFileAccessOpenFile_0(a1);
  if (!(_DWORD)v3)
  {
    uint64_t v4 = *(void *)(a1 + 664);
    if (v4)
    {
      CFDictionaryRef v5 = sub_18824D454(v4);
      if (v5)
      {
        CFDictionaryRef v6 = v5;
        BOOL v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
        if (Mutable)
        {
          CFTypeRef v9 = Mutable;
          CFDictionarySetValue(Mutable, @"resource-fork", v6);
          CFRelease(v6);
          Data = CFPropertyListCreateData(v7, v9, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
          if (Data)
          {
            size_t v11 = Data;
            CFIndex Length = CFDataGetLength(Data);
            uint64_t v13 = *(void *)(a1 + 168);
            uint64_t v14 = *(void *)(a1 + 176);
            uint64_t v12 = (uint64_t *)(a1 + 168);
            uint64_t v15 = *(void *)(a1 + 344);
            uint64_t v16 = *(void *)(a1 + 352);
            uint64_t v3 = (*(uint64_t (**)(void, uint64_t *))(**(void **)(a1 + 112) + 296LL))( *(void *)(a1 + 112),  &v29);
            if ((_DWORD)v3)
            {
LABEL_8:
              CFRelease(v9);
              CFRelease(v11);
LABEL_14:
              DIUDIFFileAccessCloseFile_0(a1);
              return v3;
            }

            uint64_t v19 = v14 + v13;
            if (*(_DWORD *)(a1 + 644) == 1) {
              v29 -= 512LL;
            }
            if (v19 && v19 == v29)
            {
              uint64_t v29 = *(void *)(a1 + 168);
              uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 112) + 312LL))(*(void *)(a1 + 112));
              if ((_DWORD)v3) {
                goto LABEL_8;
              }
              uint64_t v19 = 0LL;
              *uint64_t v12 = 0LL;
              *(void *)(a1 + ++*(_DWORD *)(result + 176) = 0LL;
            }

            CFStringRef v20 = (uint64_t *)(a1 + 344);
            uint64_t v21 = v16 + v15;
            if (v21 && v21 == v29)
            {
              uint64_t v29 = *(void *)(a1 + 344);
              uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 112) + 312LL))(*(void *)(a1 + 112));
              if ((_DWORD)v3) {
                goto LABEL_8;
              }
              uint64_t v21 = 0LL;
              *CFStringRef v20 = 0LL;
              *(void *)(a1 + 352) = 0LL;
            }

            if (!v19) {
              goto LABEL_30;
            }
            if (v19 == v29)
            {
              uint64_t v29 = *(void *)(a1 + 168);
              uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 112) + 312LL))(*(void *)(a1 + 112));
              if ((_DWORD)v3) {
                goto LABEL_8;
              }
              *uint64_t v12 = 0LL;
              *(void *)(a1 + ++*(_DWORD *)(result + 176) = 0LL;
LABEL_30:
              if (!v21)
              {
                uint64_t v22 = 0LL;
                CFIndex v23 = 0LL;
                CFIndex v24 = Length;
                goto LABEL_44;
              }

              uint64_t v22 = *v20;
              CFIndex v23 = v21 - *v20;
LABEL_43:
              CFIndex v24 = Length;
              *CFStringRef v20 = 0LL;
              v20[1] = 0LL;
LABEL_44:
              if (v23 < v24)
              {
                uint64_t v22 = v29;
                v29 += v24;
                uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 112) + 312LL))(*(void *)(a1 + 112));
                if ((_DWORD)v3) {
                  goto LABEL_8;
                }
                CFIndex v24 = Length;
              }

              uint64_t v25 = *(void *)(a1 + 112);
              BytePtr = CFDataGetBytePtr(v11);
              uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, CFIndex, char *, const UInt8 *))(*(void *)v25 + 336LL))( v25,  v22,  v24,  v28,  BytePtr);
              if (!(_DWORD)v3)
              {
                *(void *)(a1 + 344) = v22;
                *(void *)(a1 + 352) = Length;
                *(_DWORD *)(a1 + 140) = *(_DWORD *)(a1 + 140) & 0xFFFFFFFC | 1;
                uint64_t v3 = sub_188246688(a1);
                if (!(v3 | v2 & 1))
                {
                  if (*(void *)(a1 + 176)) {
                    uint64_t v3 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 112) + 392LL))( *(void *)(a1 + 112),  0LL);
                  }
                  else {
                    uint64_t v3 = 0LL;
                  }
                }
              }

              goto LABEL_8;
            }

            if (!v21)
            {
              uint64_t v22 = *v12;
              CFIndex v23 = v19 - *v12;
              CFStringRef v20 = (uint64_t *)(a1 + 168);
              goto LABEL_43;
            }

            uint64_t v22 = *v12;
            CFIndex v23 = v19 - *v20;
            if (v19 == *v20)
            {
              CFIndex v23 = v21 - v22;
LABEL_42:
              *uint64_t v12 = 0LL;
              *(void *)(a1 + ++*(_DWORD *)(result + 176) = 0LL;
              goto LABEL_43;
            }

            if (v21 != v22)
            {
              if (*(void *)(a1 + 176) > *(void *)(a1 + 352))
              {
                CFIndex v23 = v19 - v22;
                goto LABEL_42;
              }

              CFIndex v23 = v21 - *v20;
            }

            uint64_t v22 = *v20;
            goto LABEL_42;
          }

          uint64_t v17 = v9;
        }

        else
        {
          uint64_t v17 = v6;
        }

        CFRelease(v17);
      }
    }

    uint64_t v3 = 999LL;
    goto LABEL_14;
  }

  return v3;
}

const char *sub_18825A740()
{
  return "CUDIFFileAccess";
}

void sub_18825A74C(int a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = a2;
    if (a2)
    {
      int v3 = a1;
      uint64_t v4 = (char *)malloc(0x80uLL);
      CFDictionaryRef v5 = (char *)malloc(0x80uLL);
      char *v5 = 0;
      LODWORD(v6) = v3 / 16;
      if ((v3 & 0xF) != 0) {
        uint64_t v6 = (v6 + 1);
      }
      else {
        uint64_t v6 = v6;
      }
      uint64_t v13 = v6;
      __s2 = v5;
      if ((int)v6 >= 1)
      {
        uint64_t v7 = 0LL;
        int v15 = 0;
        while (1)
        {
          uint64_t v8 = 0LL;
          if (v3 >= 16) {
            int v9 = 16;
          }
          else {
            int v9 = v3;
          }
          char *v4 = 0;
          uint64_t v10 = v9;
          do
          {
            if (v8 < v10) {
              snprintf(__str, 3uLL, "%02X", *(unsigned __int8 *)(v2 + v8));
            }
            __strlcat_chk();
            if ((v8 & 1) != 0) {
              __strlcat_chk();
            }
            ++v8;
          }

          while (v8 != 16);
          int v16 = v3;
          __strlcat_chk();
          for (uint64_t i = 0LL; i != 16; ++i)
          {
            __strlcat_chk();
          }

          __strlcat_chk();
          if (v7)
          {
            if (!strcmp(v4, __s2))
            {
              ++v15;
              goto LABEL_32;
            }

            uint64_t v12 = (FILE **)MEMORY[0x1895F89D0];
            if (v15) {
              fprintf((FILE *)*MEMORY[0x1895F89D0], "(repeated %d times)\n", v15);
            }
            fprintf(*v12, "%08lX: ", 16 * v7);
          }

          else
          {
            uint64_t v12 = (FILE **)MEMORY[0x1895F89D0];
            fprintf((FILE *)*MEMORY[0x1895F89D0], "%08lX: ", 0LL);
          }

          fputs(v4, *v12);
          __strlcpy_chk();
          int v15 = 0;
LABEL_32:
          int v3 = v16 - v10;
          v2 += v10;
          if (++v7 == v13)
          {
            if (v15) {
              fprintf((FILE *)*MEMORY[0x1895F89D0], "(repeated %d times)\n", v15);
            }
            break;
          }
        }
      }

      free(__s2);
      free(v4);
    }
  }

uint64_t sub_18825AA08()
{
  return 78LL;
}

uint64_t sub_18825AA10(uint64_t a1)
{
  if (a1) {
    return sub_188259EAC(a1);
  }
  return a1;
}

BOOL sub_18825AA1C()
{
  int v0 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  double v1 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  if (v0) {
    BOOL v2 = v1 == 0LL;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0LL;
  }
  CFDictionaryGetValue(v1, @"Sections");
  int v3 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  uint64_t Value = (const __CFArray *)CFDictionaryGetValue(v3, @"Partitions");
  CFIndex Count = CFArrayGetCount(Value);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v6 = Count;
  unint64_t v7 = 0LL;
  for (CFIndex i = 0LL; i != v6; ++i)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, i);
    uint64_t v10 = (const __CFNumber *)sub_188245490(ValueAtIndex, @"Offset");
    size_t v11 = (const __CFNumber *)sub_188245490(ValueAtIndex, @"Size");
    if (v10)
    {
      uint64_t v12 = v11;
      if (v11)
      {
        CFNumberGetValue(v10, kCFNumberSInt64Type, &valuePtr);
        CFNumberGetValue(v12, kCFNumberSInt64Type, &v24);
        if (v24 + valuePtr > v7) {
          unint64_t v7 = v24 + valuePtr;
        }
      }
    }
  }

  if (!v7) {
    return 0LL;
  }
  CFDictionaryGetValue(v0, @"Sections");
  uint64_t v13 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  uint64_t v14 = (const __CFArray *)CFDictionaryGetValue(v13, @"Partitions");
  CFIndex v15 = CFArrayGetCount(v14);
  if (v15 < 1)
  {
    char v18 = 0;
  }

  else
  {
    CFIndex v16 = v15;
    CFIndex v17 = 0LL;
    char v18 = 0;
    do
    {
      uint64_t v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, v17);
      CFStringRef v20 = (const __CFNumber *)sub_188245490(v19, @"Offset");
      uint64_t v21 = (const __CFNumber *)sub_188245490(v19, @"Size");
      if (v20)
      {
        uint64_t v22 = v21;
        if (v21)
        {
          CFNumberGetValue(v20, kCFNumberSInt64Type, &valuePtr);
          CFNumberGetValue(v22, kCFNumberSInt64Type, &v24);
        }
      }

      ++v17;
    }

    while (v16 != v17);
  }

  return v18 == 0;
}

uint64_t sub_18825AC70()
{
  return 0LL;
}

uint64_t sub_18825AC78()
{
  return 0LL;
}

uint64_t sub_18825AC80()
{
  return 0LL;
}

uint64_t sub_18825AC88(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = 0LL;
  }
  return 78LL;
}

uint64_t sub_18825AC98()
{
  return 0LL;
}

uint64_t sub_18825ACA0(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t sub_18825ACA8()
{
  return 78LL;
}

uint64_t sub_18825ACB0(uint64_t a1, _DWORD *a2)
{
  if (a2) {
    *a2 = 0;
  }
  return 78LL;
}

uint64_t sub_18825ACC0()
{
  return 78LL;
}

uint64_t sub_18825ACC8(uint64_t a1, _DWORD *a2)
{
  if (a2) {
    *a2 = 0;
  }
  return 78LL;
}

uint64_t sub_18825ACD8()
{
  return 78LL;
}

uint64_t sub_18825ACE0()
{
  return 78LL;
}

uint64_t sub_18825ACE8()
{
  return 0LL;
}

uint64_t sub_18825ACF0(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = 0LL;
  }
  return 78LL;
}

uint64_t sub_18825AD00(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
}

uint64_t sub_18825AD0C()
{
  return 78LL;
}

uint64_t sub_18825AD14(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  return 78LL;
}

uint64_t sub_18825AD24(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  return 78LL;
}

uint64_t sub_18825AD38()
{
  return 78LL;
}

uint64_t sub_18825AD40()
{
  return 78LL;
}

uint64_t sub_18825AD48(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = 0LL;
  }
  return 78LL;
}

uint64_t sub_18825AD58(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = 0LL;
  }
  return 78LL;
}

uint64_t sub_18825AD68()
{
  return 78LL;
}

uint64_t sub_18825AD70(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  return 78LL;
}

uint64_t sub_18825AD80(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  return 78LL;
}

uint64_t sub_18825AD90()
{
  return 78LL;
}

uint64_t sub_18825AD98()
{
  return 0LL;
}

uint64_t sub_18825ADA0()
{
  return 78LL;
}

uint64_t sub_18825ADA8(uint64_t a1, void *a2, void *a3)
{
  if (a2) {
    *a2 = 0LL;
  }
  if (*a3) {
    *a3 = 0LL;
  }
  return 78LL;
}

void sub_18825ADC4(uint64_t a1, __CFDictionary *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v3 = (const __CFURL *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
  if (v3)
  {
    uint64_t v4 = v3;
    CFDictionaryRef v5 = (const __CFString *)sub_188243D00(v3);
    if (v5)
    {
      CFIndex v6 = v5;
      CFDataRef v7 = sub_188243DCC(v5, 0x8000100u);
      if (v7)
      {
        CFDataRef v8 = v7;
        CFDictionarySetValue(a2, @"image-path", v7);
        if (CFURLGetFileSystemRepresentation(v4, 1u, buffer, 1024LL))
        {
          if (!statfs((const char *)buffer, &v18))
          {
            int v9 = (const char *)sub_188259DEC((uint64_t)&v18);
            if (v9)
            {
              uint64_t v10 = (char *)v9;
              mach_port_t v11 = *MEMORY[0x1896086B0];
              uint64_t v12 = IOBSDNameMatching(*MEMORY[0x1896086B0], 0, v9);
              free(v10);
              if (v12)
              {
                io_service_t MatchingService = IOServiceGetMatchingService(v11, v12);
                if (MatchingService)
                {
                  io_object_t v14 = MatchingService;
                  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"BSD Unit", 0LL, 0);
                  if (CFProperty)
                  {
                    CFIndex v16 = CFProperty;
                    CFTypeID v17 = CFGetTypeID(CFProperty);
                    if (v17 == CFNumberGetTypeID()) {
                      CFDictionarySetValue(a2, @"throttle-unit", v16);
                    }
                    CFRelease(v16);
                  }

                  IOObjectRelease(v14);
                }
              }
            }
          }
        }

        CFRelease(v8);
      }

      CFRelease(v6);
    }
  }

const char *sub_18825AF54()
{
  return "CBackingStore";
}

uint64_t sub_18825AF60()
{
  return 0LL;
}

uint64_t sub_18825AF68()
{
  return 78LL;
}

uint64_t sub_18825AF70()
{
  return 78LL;
}

uint64_t sub_18825AF78()
{
  return 78LL;
}

uint64_t sub_18825AF80()
{
  return 78LL;
}

uint64_t sub_18825AF88()
{
  return 78LL;
}

uint64_t sub_18825AF90()
{
  return 78LL;
}

uint64_t sub_18825AF9C(const char *a1, unsigned int *a2, unsigned int *a3)
{
  int v8 = 0;
  memset(v7, 0, sizeof(v7));
  v9[1] = 0LL;
  int v9[2] = 0LL;
  v9[0] = 0x400000000005LL;
  uint64_t result = getattrlist(a1, v9, v7, 0x24uLL, 0);
  if (!(_DWORD)result)
  {
    if (a2) {
      DWORD1(v7[0]) = bswap32(*a2);
    }
    if (a3) {
      DWORD2(v7[0]) = bswap32(*a3);
    }
    return setattrlist(a1, v9, (char *)v7 + 4, 0x20uLL, 0);
  }

  return result;
}

uint64_t sub_18825B040(uint64_t result, int a2)
{
  *(_DWORD *)(result + 320) = a2;
  return result;
}

uint64_t sub_18825B048(uint64_t a1)
{
  uint64_t result = unlink(*(const char **)(a1 + 296));
  if ((result & 0x80000000) != 0) {
    return *__error();
  }
  return result;
}

BOOL sub_18825B06C(uint64_t a1)
{
  BOOL result = 1;
  if (!stat(*(const char **)(a1 + 296), &v4))
  {
    __darwin_time_t v2 = *(void *)(a1 + 352);
    if (v4.st_mtimespec.tv_sec <= v2
      && (v4.st_mtimespec.tv_sec != v2 || v4.st_mtimespec.tv_nsec <= *(void *)(a1 + 360)))
    {
      return 0;
    }
  }

  return result;
}

uint64_t sub_18825B0D0()
{
  return 1LL;
}

uint64_t sub_18825B0D8(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = a2;
  return sub_18825AF9C(*(const char **)(a1 + 296), 0LL, &v3);
}

uint64_t sub_18825B104(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = a2;
  return sub_18825AF9C(*(const char **)(a1 + 296), &v3, 0LL);
}

uint64_t sub_18825B130()
{
  return 0LL;
}

void sub_18825B138()
{
  if (!qword_18C7034B8)
  {
    memset(&callBacks, 0, 24);
    callBacks.copyDescription = (CFArrayCopyDescriptionCallBack)sub_18825B1BC;
    callBacks.equal = (CFArrayEqualCallBack)sub_18825B240;
    fwrite("DIDiskImageBeginRetainCountTracking\n", 0x24uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    qword_18C7034B8 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks);
  }

CFStringRef sub_18825B1BC(uint64_t a1)
{
  __darwin_time_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return CFStringCreateWithFormat(v2, 0LL, @"%s %p (%d)", v3, a1, v4);
}

BOOL sub_18825B240(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_18825B24C()
{
  if (qword_18C7034B8)
  {
    int v0 = (FILE **)MEMORY[0x1895F89D0];
    fwrite("DIDiskImageDisplayRetainCountTracking\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    CFIndex Count = CFArrayGetCount((CFArrayRef)qword_18C7034B8);
    if (Count >= 1)
    {
      CFIndex v2 = Count;
      for (CFIndex i = 0LL; i != v2; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_18C7034B8, i);
        CFDictionaryRef v5 = *v0;
        CFIndex v6 = sub_18825B1BC((uint64_t)ValueAtIndex);
        sub_188263848(v5, v6, 0x8000100u);
        fputc(10, *v0);
      }
    }
  }

void sub_18825B2F8()
{
  if (qword_18C7034B8)
  {
    CFRelease((CFTypeRef)qword_18C7034B8);
    qword_18C7034B8 = 0LL;
  }

void sub_18825B328(void *a1)
{
}

void sub_18825B34C(_Unwind_Exception *a1)
{
}

uint64_t sub_18825B360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  CFDataRef v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 88);
  if (v7) {
    return v7(a2, a3, a4, a5, a6, a7);
  }
  else {
    return 0LL;
  }
}

const char *sub_18825B38C()
{
  return "<generic object>";
}

BOOL sub_18825B398(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  BOOL result = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 272LL))(a1))
  {
    int v2 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t *, _DWORD *))(*(void *)a1 + 328LL))( a1,  0LL,  512LL,  &v4,  v5);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 280LL))(a1, 0LL);
    if (!v2 && v5[0] == 2003069043 && bswap32(v5[1]) - 2 > 2) {
      return 1;
    }
  }

  return result;
}

uint64_t sub_18825B470(uint64_t a1, CFDictionaryRef theDict)
{
  if ((sub_188239F2C(theDict, @"diskimage-class", @"CNotSupportedDiskImage") & 0x80000000) != 0) {
    return 4294966296LL;
  }
  int v4 = sub_188239F2C(theDict, @"diskimage-class", @"CNotSupportedDiskImage");
  uint64_t v5 = 1000LL;
  if (v4 <= 0)
  {
    if (sub_18825B398(a1)) {
      return 1000LL;
    }
    else {
      return 4294966296LL;
    }
  }

  return v5;
}

const char *sub_18825B4F4()
{
  return "CChecksum";
}

uint64_t sub_18825B500()
{
  return 0xFFFFFFFFLL;
}

CFStringRef sub_18825B50C()
{
  return @"CRC-32";
}

const char *sub_18825B518()
{
  return "CCRC32Checksum";
}

const char *sub_18825B528()
{
  return "CMD5Checksum";
}

CFStringRef sub_18825B534()
{
  return @"MD5";
}

uint64_t sub_18825B540(uint64_t a1, int a2)
{
  uint64_t v4 = sub_1882404D4(a1);
  *(void *)uint64_t v4 = off_18A20B1E0;
  *(_BYTE *)(v4 + 120) = a2;
  if (a2) {
    uint64_t v5 = @"skip";
  }
  else {
    uint64_t v5 = @"none";
  }
  int v6 = DIGetBundleRef();
  CFTypeRef v7 = sub_1882660CC(v6, (int)v5, v5);
  *(void *)(a1 + 112) = v7;
  if (!v7)
  {
    CFRetain(v5);
    *(void *)(a1 + 112) = v5;
  }

  return a1;
}

void sub_18825B5D4(_Unwind_Exception *a1)
{
}

uint64_t sub_18825B5F8(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

const char *sub_18825B604()
{
  return "CNoneChecksum";
}

void *sub_18825B610(void *a1)
{
  void *v2 = &off_18A20B2A8;
  v2[16] = 20LL;
  a1[15] = calloc(1uLL, 0x14uLL);
  a1[14] = malloc(0x60uLL);
  uint64_t v3 = MEMORY[0x1895F82A8];
  a1[17] = MEMORY[0x1895F82A0];
  a1[18] = v3;
  a1[19] = MEMORY[0x1895F8298];
  return a1;
}

void sub_18825B684(_Unwind_Exception *a1)
{
}

void sub_18825B6A4(void *a1)
{
}

void sub_18825B6C8(_Unwind_Exception *a1)
{
}

const char *sub_18825B6DC()
{
  return "CSHA1Checksum";
}

uint64_t sub_18825B6E8()
{
  return 6LL;
}

CFStringRef sub_18825B6F0()
{
  return @"SHA1";
}

CFStringRef sub_18825B6FC()
{
  return @"SHA-1";
}

void *sub_18825B71C(uint64_t a1)
{
  return sub_188254A10((void *)(a1 - 104));
}

void *sub_18825B724(uint64_t a1)
{
  return sub_188254A10((void *)(a1 - 168));
}

void sub_18825B72C(uint64_t a1)
{
}

void sub_18825B734(uint64_t a1)
{
}

const char *sub_18825B73C()
{
  return "CADCDecompressor";
}

void *sub_18825B748(void *a1)
{
  *a1 = &off_18A20B4D8;
  int v2 = (void *)a1[4];
  if (v2) {
    free(v2);
  }
  a1[4] = 0LL;
  return a1;
}

void sub_18825B784(void *__p)
{
  *__p = &off_18A20B4D8;
  int v2 = (void *)__p[4];
  if (v2) {
    free(v2);
  }
  operator delete(__p);
}

void *sub_18825B7C0(uint64_t a1)
{
  return sub_188258000((void *)(a1 - 104));
}

void sub_18825B7C8(uint64_t a1)
{
}

const char *sub_18825B7D0()
{
  return "CKenCodeDecompressor";
}

void *sub_18825B7DC(uint64_t a1)
{
  BOOL result = sub_1882429C0(a1);
  *BOOL result = &off_18A20B5A8;
  return result;
}

void sub_18825B800(void *a1)
{
}

void sub_18825B824(_Unwind_Exception *a1)
{
}

uint64_t sub_18825B838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a5 & 1) != 0) {
    return 22LL;
  }
  if (a5 >= 0) {
    int v5 = a5;
  }
  else {
    int v5 = a5 + 1;
  }
  if (a5 >= 2)
  {
    __int16 v6 = 0;
    __int16 v7 = 0;
    __int16 v8 = 0;
    LOWORD(v9) = 0;
    __int16 v10 = 0;
    LOWORD(v11) = 0;
    int v12 = v5 >> 1;
    do
    {
      if (!(_WORD)v9)
      {
        v10 += v7;
        int v13 = bswap32(*(unsigned __int16 *)(a2 + 2LL * v10));
        int v9 = v13 >> 16;
        if (v13 >> 16 >= 0) {
          LOWORD(v14) = HIWORD(v13);
        }
        else {
          int v14 = -v9;
        }
        LOWORD(v11) = v10 + 1;
        if (v9 < 0)
        {
          int v9 = -HIWORD(v13);
          __int16 v7 = 2;
          __int16 v8 = 1;
        }

        else
        {
          __int16 v8 = 0;
          __int16 v7 = HIWORD(v13) + 1;
        }
      }

      *(_WORD *)(a4 + 2LL * v6) = *(_WORD *)(a2 + 2LL * (__int16)v11);
      int v11 = (__int16)(v11 + ((a5 > (__int16)v11) & (v8 ^ 1)));
      if (v11 < 1 || v11 > a5) {
        return 22LL;
      }
      LOWORD(v9) = v9 - 1;
      ++v6;
    }

    while (v12 > v6);
  }

  return 0LL;
}

double sub_18825B908(uint64_t a1)
{
  double v1 = sub_1882429C0(a1);
  void *v1 = &off_18A20B5F0;
  *(_OWORD *)(v1 + 37) = xmmword_18826CC62;
  qmemcpy(v1 + 39, "  !!##$$%%&&''(())**++,,--..//0123456789:;<=>?", 48);
  *(_OWORD *)(v1 + 29) = xmmword_18826CC22;
  *(_OWORD *)(v1 + 31) = unk_18826CC32;
  *(_OWORD *)(v1 + 33) = xmmword_18826CC42;
  *(_OWORD *)(v1 + 35) = unk_18826CC52;
  *(_OWORD *)(v1 + 21) = xmmword_18826CBE2;
  *(_OWORD *)(v1 + 23) = unk_18826CBF2;
  *(_OWORD *)(v1 + 25) = xmmword_18826CC02;
  *(_OWORD *)(v1 + 27) = unk_18826CC12;
  *(_OWORD *)(v1 + 13) = xmmword_18826CBA2;
  *(_OWORD *)(v1 + 15) = unk_18826CBB2;
  *(_OWORD *)(v1 + 17) = xmmword_18826CBC2;
  *(_OWORD *)(v1 + 19) = unk_18826CBD2;
  memset(v1 + 69, 7, 48);
  *(_OWORD *)(v1 + 75) = *(_OWORD *)"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b20CDARTRLEDecompressor";
  *(_OWORD *)(v1 + 61) = xmmword_18826CD22;
  *(_OWORD *)(v1 + 63) = unk_18826CD32;
  *(_OWORD *)(v1 + 65) = xmmword_18826CD42;
  *(_OWORD *)(v1 + 67) = unk_18826CD52;
  *(_OWORD *)(v1 + 53) = xmmword_18826CCE2;
  *(_OWORD *)(v1 + 55) = unk_18826CCF2;
  *(_OWORD *)(v1 + 57) = xmmword_18826CD02;
  *(_OWORD *)(v1 + 59) = unk_18826CD12;
  *(_OWORD *)(v1 + 45) = xmmword_18826CCA2;
  *(_OWORD *)(v1 + 47) = unk_18826CCB2;
  double result = 2.56734753e-289;
  *(_OWORD *)(v1 + 49) = xmmword_18826CCC2;
  *(_OWORD *)(v1 + 51) = unk_18826CCD2;
  return result;
}

void sub_18825B9D8(void *a1)
{
}

void sub_18825B9FC(_Unwind_Exception *a1)
{
}

uint64_t sub_18825BA10(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1895F8858](a1);
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  int v12 = v2;
  int v13 = v3;
  int v9 = 0;
  __int16 v8 = 0;
  __int16 v17 = 0;
  int v16 = 0;
  v7[0] = v4;
  v7[1] = v5;
  uint64_t v14 = v1 + 104;
  uint64_t v15 = v1 + 360;
  sub_18825BAC4(v1, (uint64_t)v7);
  if (v8) {
    return 1001LL;
  }
  else {
    return 0LL;
  }
}

void sub_18825BAC4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 44))
  {
    unsigned int v4 = 0;
    int v5 = 4036;
    while (*(_DWORD *)(a2 + 32) <= *(_DWORD *)(a2 + 40))
    {
      int v3 = (void *)sub_18825C02C(v3, a2);
      __int16 v6 = (__int16)v3;
      if ((int)v3 > 255)
      {
        int v3 = (void *)sub_18825C08C((uint64_t)v3, (uint64_t *)a2);
        __int16 v9 = 0;
        int v10 = 0;
        __int16 v11 = v5 + ~(_WORD)v3;
        while (1)
        {
          char v12 = *(_BYTE *)(a2 + ((v9 + v11) & 0xFFF) + 48);
          uint64_t v13 = *(void *)(a2 + 8);
          uint64_t v14 = *(unsigned int *)(a2 + 36);
          *(_DWORD *)(a2 + 36) = v14 + 1;
          *(_BYTE *)(v13 + v14) = v12;
          *(_BYTE *)(a2 + (__int16)v5 + 48) = v12;
          int v5 = (v5 + 1) & 0xFFF;
          ++v4;
          __int16 v9 = ++v10;
        }

uint64_t sub_18825BC0C(uint64_t a1, uint64_t *a2)
{
  int v2 = a2 + 1077;
  unsigned int v3 = *((unsigned __int8 *)a2 + 8620);
  if (v3 >= 9)
  {
    unsigned int v7 = (unsigned __int16)*v2;
  }

  else
  {
    uint64_t v4 = *a2;
    unsigned int v5 = *((_DWORD *)a2 + 10);
    unsigned int v6 = *((_DWORD *)a2 + 8);
    unsigned int v7 = (unsigned __int16)*v2;
    do
    {
      unsigned int v8 = v3;
      unsigned int v9 = v6 + 1;
      *((_DWORD *)a2 + 8) = v6 + 1;
      if (v6 + 1 <= v5) {
        __int16 v10 = *(unsigned __int8 *)(v4 + v6);
      }
      else {
        __int16 v10 = -1;
      }
      int v11 = v10 & ~(v10 >> 31);
      unsigned int v3 = 8;
      v7 |= v11 << (8 - v8);
      _WORD *v2 = v7;
      *((_BYTE *)a2 + 8620) = v8 + 8;
      unsigned int v6 = v9;
    }

    while (!v8);
    LOBYTE(v3) = v8 + 8;
  }

  _WORD *v2 = 2 * v7;
  *((_BYTE *)a2 + 8620) = v3 - 1;
  return (v7 >> 15) & 1;
}

uint64_t sub_18825BCA0(uint64_t a1, uint64_t *a2)
{
  int v2 = a2 + 1077;
  unsigned int v3 = *((unsigned __int8 *)a2 + 8620);
  if (v3 >= 9)
  {
    LOWORD(v7) = *v2;
    LOBYTE(v8) = v3 - 8;
  }

  else
  {
    uint64_t v4 = *a2;
    unsigned int v5 = *((_DWORD *)a2 + 10);
    unsigned int v6 = *((_DWORD *)a2 + 8);
    int v7 = (unsigned __int16)*v2;
    do
    {
      unsigned int v8 = v3;
      unsigned int v9 = v6 + 1;
      *((_DWORD *)a2 + 8) = v6 + 1;
      if (v6 + 1 <= v5) {
        int v10 = *(unsigned __int8 *)(v4 + v6);
      }
      else {
        int v10 = 0xFFFF;
      }
      unsigned int v3 = 8;
      v7 |= v10 << (8 - v8);
      _WORD *v2 = v7;
      *((_BYTE *)a2 + 8620) = v8 + 8;
      unsigned int v6 = v9;
    }

    while (!v8);
  }

  _WORD *v2 = (_WORD)v7 << 8;
  *((_BYTE *)a2 + 8620) = v8;
  return BYTE1(v7);
}

void sub_18825BD28(uint64_t a1, _WORD *a2)
{
  unsigned int v3 = a2 + 3367;
  uint64_t v4 = -314LL;
  do
  {
    v3[314] = v4 + 941;
    *v3++ = v4 + 314;
  }

  while (!__CFADD__(v4++, 1LL));
  uint64_t v6 = 0LL;
  int v7 = a2 + 2112;
  uint64_t v8 = 314LL;
  do
  {
    unsigned int v9 = &a2[v6 + 2426];
    *unsigned int v9 = v7[1] + *v7;
    v9[1569] = v6 * 2;
    v7[629] = v8;
    v7[628] = v8;
    ++v6;
    ++v8;
    v7 += 2;
  }

  while (v6 != 313);
  a2[2739] = -1;
  a2[3366] = 0;
}

void *sub_18825BDD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0LL;
  int v4 = 0;
  do
  {
    uint64_t v5 = a2 + v3;
    if (*(__int16 *)(a2 + v3 + 7362) >= 627)
    {
      uint64_t v6 = a2 + 2LL * (__int16)v4;
      *(_WORD *)(v6 + 4224) = (*(unsigned __int16 *)(v5 + 4224) + 1) >> 1;
      *(_WORD *)(v6 + 7362) = *(_WORD *)(v5 + 7362);
      ++v4;
    }

    v3 += 2LL;
  }

  while (v3 != 1254);
  uint64_t v7 = 0LL;
  uint64_t v8 = 314LL;
  uint64_t v9 = a2 + 4224;
  uint64_t v10 = a2 + 7362;
  do
  {
    unsigned __int16 v11 = *(_WORD *)(v9 + ((2 * v7) | 2)) + *(_WORD *)(v9 + 2 * v7);
    *(_WORD *)(v9 + 2 * v8) = v11;
    int v12 = v8;
    do
      __int16 v13 = v12--;
    while (*(unsigned __int16 *)(a2 + 2LL * (__int16)v12 + 4224) > v11);
    uint64_t v14 = 2LL * v13 + 2;
    memcpy((void *)(a2 + 4224 + 2LL * v13), (const void *)(a2 + 4224 + v14), 2LL * (((_WORD)v8 - v13) & 0x7FFF));
    *(_WORD *)(a2 + 4224 + 2LL * v13) = v11;
    double result = memcpy((void *)(v10 + 2LL * v13), (const void *)(v10 + v14), 2LL * (((_WORD)v8 - v13) & 0x7FFF));
    *(_WORD *)(v10 + 2LL * v13) = v7;
    v7 += 2LL;
    ++v8;
  }

  while (v8 != 627);
  uint64_t v16 = 0LL;
  uint64_t v17 = a2 + 7362;
  do
  {
    uint64_t v18 = *(unsigned __int16 *)(v17 + 2 * v16);
    if (*(__int16 *)(v17 + 2 * v16) < 627)
    {
      uint64_t v19 = a2 + 2LL * (__int16)v18;
      *(_WORD *)(v19 + 5482) = v16;
    }

    else
    {
      uint64_t v19 = a2 + 2 * v18;
    }

    *(_WORD *)(v19 + 5480) = v16++;
  }

  while (v16 != 627);
  return result;
}

void *sub_18825BF38(void *result, uint64_t a2, int a3)
{
  int v5 = *(unsigned __int16 *)(a2 + 2LL * a3 + 6734);
  uint64_t v6 = a2 + 4224;
  do
  {
    uint64_t v7 = (__int16)v5;
    uint64_t v8 = (_WORD *)(v6 + 2LL * (__int16)v5);
    __int16 v9 = *v8 + 1;
    *uint64_t v8 = v9;
    if (v9 > (int)*(unsigned __int16 *)(v6 + 2LL * (__int16)(v5 + 1)))
    {
      int v10 = v5 + 1;
      do
        __int16 v11 = v10++;
      while (v9 > (int)*(unsigned __int16 *)(a2 + 2LL * (__int16)v10 + 4224));
      uint64_t v12 = a2 + 2LL * v11;
      *uint64_t v8 = *(_WORD *)(v12 + 4224);
      *(_WORD *)(v12 + 4224) = v9;
      uint64_t v13 = a2 + 2LL * (__int16)v5;
      uint64_t v14 = *(__int16 *)(v13 + 7362);
      uint64_t v15 = a2 + 2 * v14;
      *(_WORD *)(v15 + 5480) = v11;
      if (v14 <= 626) {
        *(_WORD *)(v15 + 5482) = v11;
      }
      uint64_t v7 = v11;
      uint64_t v16 = a2 + 2LL * v11;
      uint64_t v17 = *(__int16 *)(v16 + 7362);
      *(_WORD *)(v16 + 7362) = v14;
      uint64_t v18 = a2 + 2 * v17;
      *(_WORD *)(v18 + 5480) = v5;
      if (v17 <= 626) {
        *(_WORD *)(v18 + 5482) = v5;
      }
      *(_WORD *)(v13 + 7362) = v17;
    }

    int v5 = *(unsigned __int16 *)(a2 + 2 * v7 + 5480);
  }

  while (*(_WORD *)(a2 + 2 * v7 + 5480));
  return result;
}

uint64_t sub_18825C02C(void *a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 8614);
  if (v3 <= 0x272)
  {
    do
    {
      a1 = (void *)sub_18825BC0C((uint64_t)a1, (uint64_t *)a2);
      unsigned int v3 = *(unsigned __int16 *)(a2 + 2LL * (unsigned __int16)((_WORD)a1 + v3) + 7362);
    }

    while (v3 < 0x273);
  }

  uint64_t v4 = (__int16)(v3 - 627);
  sub_18825BF38(a1, a2, v4);
  return v4;
}

uint64_t sub_18825C08C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_18825BCA0(a1, a2);
  char v4 = v3;
  int v5 = *(char *)(a2[526] + (unsigned __int16)v3);
  int v6 = *(char *)(a2[527] + (unsigned __int16)v3);
  int v7 = v6 - 2;
  if (v6 != 2)
  {
    do
    {
      --v7;
      uint64_t v3 = sub_18825BC0C(v3, a2);
      char v4 = v3 | (2 * v4);
    }

    while ((_WORD)v7);
  }

  return v4 & 0x3F | (v5 << 6);
}

const char *sub_18825C0FC()
{
  return "CDARTRLEDecompressor";
}

const char *sub_18825C108()
{
  return "CDARTLZHDecompressor";
}

const char *sub_18825C118()
{
  return "CZlibDecompressor";
}

uint64_t sub_18825C12C(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[17];
  if (!v2) {
    return 78LL;
  }
  while (!(*(unsigned int (**)(uint64_t))(*(void *)v2 + 104LL))(v2))
  {
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 496LL))(v2);
    if (!v2) {
      return 78LL;
    }
  }

  uint64_t v6 = (*(uint64_t (**)(void *))(*a1 + 296LL))(a1);
  int v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 72LL))(v6);
  uint64_t v8 = *(void *)v2;
  if (v7) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 112))(v2, a2);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 80))(v2, 1003LL);
  if (!(_DWORD)result)
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v2 + 112LL))(v2, a2);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v2 + 80LL))(v2, 1LL);
    return v9;
  }

  return result;
}

uint64_t sub_18825C214()
{
  return 78LL;
}

CFStringRef sub_18825C21C()
{
  return @"<unknown>";
}

uint64_t sub_18825C228(uint64_t result, uint64_t a2)
{
  *(void *)(result + 104) = a2;
  return result;
}

uint64_t sub_18825C230(uint64_t result, uint64_t a2)
{
  *(void *)(result + 112) = a2;
  return result;
}

uint64_t sub_18825C238(uint64_t result, uint64_t a2)
{
  *(void *)(result + 120) = a2;
  return result;
}

uint64_t sub_18825C240(uint64_t result)
{
  *(_BYTE *)(result + 128) = 1;
  return result;
}

uint64_t sub_18825C24C(uint64_t a1, __CFDictionary *a2)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 200LL))(a1)
    && ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 256LL))(a1) & 1) == 0)
  {
    char v4 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 304LL))(a1);
    if (!v4)
    {
      uint64_t v6 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 216LL))(a1);
      CFDictionaryAddValue(a2, @"kernel-dict", v6);
      uint64_t valuePtr = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 232LL))(a1);
      CFNumberRef v7 = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
      CFDictionaryAddValue(a2, @"sparse-band-size", v7);
      return 0LL;
    }

    CFRelease(v4);
  }

  return 78LL;
}

uint64_t sub_18825C318(void **a1, CFDictionaryRef theDict)
{
  if (theDict) {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(0LL, 0LL, theDict);
  }
  else {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  }
  char v4 = MutableCopy;
  if (!MutableCopy) {
    return 999LL;
  }
  if (((unsigned int (*)(void **, CFMutableDictionaryRef))(*a1)[66])(a1, MutableCopy)
    || (uint64_t v5 = DIHLDiskImageAttach(), (_DWORD)v5 == 45))
  {
    CFDictionaryRemoveValue(v4, @"kernel-dict");
    uint64_t v6 = (const void *)(*(uint64_t (**)(void *))(*a1[17] + 176LL))(a1[17]);
    CFDictionaryAddValue(v4, @"main-url", v6);
    uint64_t v5 = DIHLDiskImageAttach();
  }

  CFRelease(v4);
  return v5;
}

__CFArray *sub_18825C418(char *a1, char a2)
{
  int v15 = 0;
  uint64_t v14 = 0LL;
  uint64_t v4 = (*(uint64_t (**)(char *))(*(void *)a1 + 240LL))(a1);
  if (v4 >= 513) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 2048LL;
  }
  int v6 = sub_188264990(a1, 1u, 1, v5, 0LL, (void ****)&v14, &v15, 0LL, a2);
  CFMutableDictionaryRef Mutable = 0LL;
  if (!v6)
  {
    uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    if (v15 >= 1)
    {
      for (uint64_t i = 0LL; i < v15; ++i)
      {
        int v10 = (const UInt8 **)*((void *)v14 + i);
        sub_1882661D4();
        nullsub_4(v10);
        CFIndex v11 = sub_1882661C8((uint64_t)v10);
        CFDataRef v12 = CFDataCreate(v8, *v10, v11);
        CFArrayAppendValue(Mutable, v12);
        CFRelease(v12);
        nullsub_4(v10);
      }
    }
  }

  if (v14) {
    sub_188255BD0((void ***)v14, v15);
  }
  return Mutable;
}

uint64_t sub_18825C54C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (a5)
  {
    *a5 = 0LL;
    unsigned int v5 = 78;
  }

  else
  {
    unsigned int v5 = 22;
  }

  if (a4) {
    BOOL v6 = a3 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 22LL;
  }
  else {
    return v5;
  }
}

uint64_t sub_18825C584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
  if (v5) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v5 + 480LL))(v5, a2, a3);
  }
  else {
    return 78LL;
  }
}

uint64_t sub_18825C5D4(uint64_t a1, const char *a2)
{
  uint64_t v2 = "";
  if (a2) {
    uint64_t v2 = a2;
  }
  return fprintf((FILE *)*MEMORY[0x1895F89D0], "%s%qd at %qd\n", v2, *(void *)(a1 + 96), *(void *)(a1 + 88));
}

void sub_18825C624( __CFArray *a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, const void *a6, const void *a7)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  int v13 = DIGetBundleRef();
  CFTypeRef v14 = sub_1882660CC(v13, (int)a2, a2);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-convert-name", v14);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-convert-key", a5);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-convert-extension", a6);
  CFDictionaryAddValue(Mutable, @"expert-mode", a7);
  CFArrayAppendValue(a1, Mutable);
  if (v14) {
    CFRelease(v14);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_18825C734( __CFArray *a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, const void *a6, const void *a7, const void *a8, const void *a9)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  int v16 = DIGetBundleRef();
  CFTypeRef v17 = sub_1882660CC(v16, (int)a2, a2);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-name", v17);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-key", a5);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-extension", a6);
  CFDictionaryAddValue(Mutable, @"expert-mode", a7);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-virtual-size", a8);
  if (a9) {
    CFDictionaryAddValue(Mutable, @"plugin-diskimage-create-hide-from-ui", a9);
  }
  CFArrayAppendValue(a1, Mutable);
  if (v17) {
    CFRelease(v17);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_18825C884(__CFArray *a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, const void *a6)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  int v11 = DIGetBundleRef();
  CFTypeRef v12 = sub_1882660CC(v11, (int)a2, a2);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-checksum-name", v12);
  CFDictionaryAddValue(Mutable, @"plugin-diskimage-checksum-key", a5);
  CFDictionaryAddValue(Mutable, @"expert-mode", a6);
  CFArrayAppendValue(a1, Mutable);
  if (v12) {
    CFRelease(v12);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

const char *sub_18825C970()
{
  return "CDiskImage";
}

uint64_t sub_18825C97C()
{
  return 78LL;
}

uint64_t sub_18825C984()
{
  return 78LL;
}

uint64_t sub_18825C98C()
{
  return -1LL;
}

BOOL sub_18825C998(uint64_t a1)
{
  uint64_t v2 = (unsigned __int16 *)malloc(0x200uLL);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  BOOL v4 = !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, _BYTE *, unsigned __int16 *))(*(void *)a1 + 48LL))( a1,  2LL,  1LL,  v6,  v2)
    && (sub_1882575EC(v3), *v3 == 18520)
    && (v3[20] & 0x1FF) == 0
    && v3[1] > 4u;
  free(v3);
  return v4;
}

uint64_t sub_18825CA3C()
{
  return 0LL;
}

BOOL sub_18825CA44(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, _BYTE *))(*(void *)a1 + 48LL))( a1,  2LL,  1LL,  &v9,  v10)
    || v10[0] | v10[1])
  {
    return 0LL;
  }

  BOOL result = 0LL;
  if ((~v11[0] & 0xF0) == 0 && (v11[0] & 0xF) != 0)
  {
    uint64_t v2 = v11[0] & 0xF;
    while (1)
    {
      int v3 = v11[v2];
      char v4 = (v3 - 97) >= 0x1A ? v11[v2] : v3 & 0xDF;
      unsigned int v5 = (v4 - 65);
      BOOL v6 = v5 < 0x1A;
      if (!--v2) {
        break;
      }
      BOOL v7 = v5 >= 0x1A && (v4 - 48) >= 0xAu;
      if (v7 && v4 != 46 && v4 != 32)
      {
        BOOL v6 = 0;
        break;
      }

      if (!(_WORD)v2)
      {
        BOOL v6 = 1;
        break;
      }
    }

    BOOL v8 = v11[31] == 39 && v6;
    return v11[32] == 13 && v8;
  }

  return result;
}

CFStringRef sub_18825CB78(uint64_t a1)
{
  double v1 = (double)(unint64_t)(1000
                                * (1000000LL * (*(void *)(a1 + 24) - *(void *)(a1 + 8))
  double v2 = fmod(v1, 1000.0);
  double v3 = floor(v1 / 1000.0);
  double v4 = fmod(v3, 1000.0);
  double v5 = floor(v3 / 1000.0);
  double v6 = fmod(v5, 1000.0);
  double v7 = floor(v5 / 1000.0);
  double v8 = fmod(v7, 60.0);
  double v9 = floor(v7 / 60.0);
  double v10 = fmod(v9, 60.0);
  double v11 = floor(v9 / 60.0);
  double v12 = fmod(v11, 24.0);
  double v13 = floor(v11 / 24.0);
  double v14 = fmod(v13, 365.25);
  double v15 = floor(v13 / 365.25);
  int v16 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (v15 > 0.0) {
    return CFStringCreateWithFormat( v16,  0LL,  @"%2hdy %3hdd %2hdh",  (int)v15,  (int)v14,  (int)v10);
  }
  if (v14 > 0.0) {
    return CFStringCreateWithFormat( v16,  0LL,  @"%3hdd %2hdh %02hdm %02hds",  (int)v14,  (int)v12,  (int)v10,  (int)v8);
  }
  if (v12 > 0.0) {
    return CFStringCreateWithFormat( v16,  0LL,  @"%2hdh %2hdm %02hd.%03hds",  (int)v12,  (int)v10,  (int)v8,  (int)v6);
  }
  if (v10 > 0.0) {
    return CFStringCreateWithFormat( v16,  0LL,  @"%2hdm %2hd.%03hds",  (int)v10,  (int)v8,  (int)v6);
  }
  if (v8 > 0.0) {
    return CFStringCreateWithFormat(v16, 0LL, @"%2hd.%03hds", (int)v8, (int)v6);
  }
  if (v6 > 0.0) {
    return CFStringCreateWithFormat(v16, 0LL, @"%3hd.%03hdms", (int)v6, (int)v4);
  }
  if (v4 <= 0.0) {
    return CFStringCreateWithFormat(v16, 0LL, @"%2hdns", (int)v2);
  }
  return CFStringCreateWithFormat(v16, 0LL, @"%3hd.%03hdus", (int)v4, (int)v2);
}

uint64_t sub_18825CDD4(int a1, int a2, _DWORD *a3)
{
  uint64_t result = 0LL;
  *a3 = 0;
  if (a1 > 1346586691)
  {
    if (a1 > 1684371057)
    {
      if (a1 == 1684371058)
      {
        uint64_t result = 1430540887LL;
        goto LABEL_22;
      }

      if (a1 != 1751413366)
      {
        if (a1 != 1885554756) {
          return result;
        }
        goto LABEL_18;
      }

      goto LABEL_10;
    }

    if (a1 == 1346586692)
    {
LABEL_18:
      uint64_t result = 1144675390LL;
      goto LABEL_22;
    }

    if (a1 != 1346989415) {
      return result;
    }
LABEL_17:
    uint64_t result = 1430541391LL;
    goto LABEL_22;
  }

  if (a1 > 1195994470)
  {
    if (a1 == 1195994471) {
      goto LABEL_17;
    }
    if (a1 != 1330660164) {
      return result;
    }
    if (a2 == 1330660128) {
      goto LABEL_18;
    }
    return 0LL;
  }

  if (a1 == 1095782476)
  {
    uint64_t result = 1144675390LL;
    if (a2 == 1450461252 || a2 == 1144675390) {
      goto LABEL_22;
    }
    return 0LL;
  }

  if (a1 != 1145334125) {
    return result;
  }
LABEL_10:
  uint64_t result = 1380013866LL;
LABEL_22:
  *a3 = 100;
  return result;
}

uint64_t sub_18825CF20(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = sub_18823AC00(a3);
  int v12 = 0;
  if (a2
    && __dynamic_cast( a2,  (const struct __class_type_info *)&unk_18A20ABD8,  (const struct __class_type_info *)&unk_18A20D3D0,  0LL))
  {
    return 110LL;
  }

  int v7 = sub_18824E14C((uint64_t)a2, &v12);
  if (v12 < 0) {
    return 110LL;
  }
  if (!v7)
  {
    int v7 = sub_18824E218((uint64_t)a2, &v12);
    if (v12 < 0) {
      return 110LL;
    }
  }

  if (v7) {
    int v8 = v7;
  }
  else {
    int v8 = 1380013866;
  }
  *(_DWORD *)(a1 + 144) = v8;
  uint64_t v6 = (*(uint64_t (**)(void *, uint64_t))(*(void *)a2 + 80LL))(a2, v5);
  if (!(_DWORD)v6)
  {
    uint64_t v9 = (*(uint64_t (**)(void *))(*(void *)a2 + 72LL))(a2);
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 520LL))(a1, v9);
    uint64_t v6 = (*(uint64_t (**)(void *))(*(void *)a2 + 272LL))(a2);
    if (!(_DWORD)v6)
    {
      uint64_t v6 = (*(uint64_t (**)(void *, uint64_t *))(*(void *)a2 + 296LL))(a2, &v11);
      if ((_DWORD)v6)
      {
        (*(void (**)(void *, void))(*(void *)a2 + 280LL))(a2, 0LL);
      }

      else
      {
        *(void *)(a1 + 160) = v11 >> 9;
        sub_18823FF28(a1, (char *)a2);
      }
    }
  }

  return v6;
}

uint64_t sub_18825D090( uint64_t a1, const __CFDictionary *a2, int a3, uint64_t a4, int a5, const __CFArray *a6, const __CFURL *a7, char **a8)
{
  double v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uid_t v84 = 0LL;
  uint64_t v83 = 0LL;
  double v15 = operator new(0x28uLL);
  sub_188255F8C(v15);
  allocator = v13;
  int v16 = malloc(0x40000uLL);
  CFTypeRef v17 = v16;
  if (a3 == 1430541391) {
    uint64_t v18 = @"cdr";
  }
  else {
    uint64_t v18 = @"dmg";
  }
  int v71 = a5;
  if (a5 < 1)
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    double v30 = 100.0;
  }

  else
  {
    unsigned int v19 = a5;
    int v74 = v15;
    uint64_t v76 = v16;
    uint64_t v20 = a8;
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v24 = v19;
    do
    {
      uint64_t v25 = *(uint64_t **)(a4 + 8 * v21);
      if (!v25) {
        goto LABEL_100;
      }
      if (!*v25)
      {
        LODWORD(v25) = 0;
LABEL_100:
        CFURLRef v31 = 0LL;
        uint64_t v36 = 22LL;
        a8 = v20;
        double v15 = v74;
        goto LABEL_103;
      }

      nullsub_4(*(void *)(a4 + 8 * v21));
      uint64_t v26 = *v25;
      int v27 = *(_DWORD *)(*v25 + 200);
      if (v27)
      {
        __int16 v28 = (uint64_t *)(v26 + 220);
        do
        {
          uint64_t v29 = *v28;
          v28 += 5;
          v23 += v29;
          --v27;
        }

        while (v27);
      }

      v22 += *(void *)(v26 + 16);
      ++v21;
    }

    while (v21 != v24);
    if (v22) {
      double v30 = (double)(v22 - v23) * 100.0 / (double)v22;
    }
    else {
      double v30 = 100.0;
    }
    a8 = v20;
    double v15 = v74;
    CFTypeRef v17 = v76;
  }

  CFURLRef v31 = sub_188245378(a7, v18, 0);
  if (!v31)
  {
    LODWORD(v25) = 0;
    uint64_t v36 = 999LL;
    goto LABEL_28;
  }

  sub_188255F9C((uint64_t)v15);
  (*(void (**)(uint64_t, float))(*(void *)a1 + 344LL))(a1, 0.0);
  sub_1882383F8(Mutable, a2, 1uLL);
  uint64_t valuePtr = v22 << 9;
  unsigned int v32 = allocator;
  CFNumberRef v33 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, @"max-size", v33);
  if (v33) {
    CFRelease(v33);
  }
  uint64_t valuePtr = 0LL;
  CFNumberRef v34 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, @"size", v34);
  if (v34) {
    CFRelease(v34);
  }
  uint64_t v35 = sub_1882454CC((uint64_t)v31, (uint64_t)Mutable, 7u, 0LL, 0LL, &v84, 0LL);
  if ((_DWORD)v35)
  {
    uint64_t v36 = v35;
    LODWORD(v25) = 0;
    goto LABEL_28;
  }

  LODWORD(v25) = 1;
  uint64_t v37 = (*(uint64_t (**)(char *, uint64_t))(*(void *)v84 + 168LL))(v84, 1LL);
  if ((_DWORD)v37 || (uint64_t v37 = (*(uint64_t (**)(char *))(*(void *)v84 + 272LL))(v84), (_DWORD)v37))
  {
    uint64_t v36 = v37;
    goto LABEL_28;
  }

  uint64_t v76 = v17;
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t valuePtr = 0LL;
  if (v71 >= 1)
  {
    CFIndex v48 = 0LL;
    uint64_t v49 = 0LL;
    float v50 = (float)v23;
    uint64_t v70 = v71;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a6, v48);
      if (!ValueAtIndex || (v52 = ValueAtIndex, CFTypeID TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(v52))) {
        int v52 = &stru_18A20E810;
      }
      int v54 = DIGetBundleRef();
      CFNumberRef v55 = (const __CFString *)sub_1882660CC(v54, (int)@"Reading %1$@\\U2026", @"Reading %1$@\\U2026");
      CFStringRef v56 = CFStringCreateWithFormat(v32, 0LL, v55, v52);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v56, 16LL);
      if (v56) {
        CFRelease(v56);
      }
      if (v55) {
        CFRelease(v55);
      }
      uint64_t v57 = *(uint64_t **)(a4 + 8 * v48);
      if (!v57 || !*v57)
      {
        CFMutableDictionaryRef Mutable = 0LL;
        uint64_t v36 = 22LL;
        goto LABEL_102;
      }

      nullsub_4(*(void *)(a4 + 8 * v48));
      uint64_t v58 = *v57;
      if (*(_DWORD *)(*v57 + 200)) {
        break;
      }
LABEL_94:
      if (++v48 == v70) {
        goto LABEL_95;
      }
    }

    int v72 = v57;
    int v59 = 0;
    int v60 = (int *)(v58 + 204);
    while (1)
    {
      int v75 = v59;
      int v61 = *v60;
      BOOL v62 = !*v60 || v61 == 0x7FFFFFFF;
      if (!v62 && v61 != 2) {
        break;
      }
      uint64_t v64 = (*(uint64_t (**)(char *, void))(*(void *)v84 + 312LL))( v84,  (*(void *)(v58 + 8) + *((void *)v60 + 1) + *((void *)v60 + 2)) << 9);
      if ((_DWORD)v64)
      {
        uint64_t v36 = v64;
        CFMutableDictionaryRef Mutable = 0LL;
        goto LABEL_102;
      }

      valuePtr += *((void *)v60 + 2);
      if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 352LL))(a1) & 1) != 0)
      {
        CFMutableDictionaryRef Mutable = 0LL;
        uint64_t v36 = 111LL;
        goto LABEL_102;
      }

LABEL_95:
  (*(void (**)(char *, void))(*(void *)v84 + 280LL))(v84, 0LL);
  sub_188255FA8((uint64_t)v15);
  sub_18825D8B0(a1, (uint64_t)v15, v30);
  uint64_t v36 = sub_18824DB74((uint64_t)v84, (uint64_t)a2, &v83, 0LL);
  CFMutableDictionaryRef Mutable = 0LL;
  LODWORD(v25) = 1;
  if ((_DWORD)v36)
  {
LABEL_103:
    CFTypeRef v17 = v76;
    goto LABEL_28;
  }

  CFTypeRef v17 = v76;
  if (v84)
  {
    DIDiskImageObjectRelease(v84);
    CFMutableDictionaryRef Mutable = 0LL;
    uint64_t v36 = 0LL;
    uid_t v84 = 0LL;
  }

LABEL_28:
  (*(void (**)(void *))(*v15 + 8LL))(v15);
  if (v17) {
    free(v17);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v31) {
    CFRelease(v31);
  }
  if ((_DWORD)v36)
  {
    int v38 = v84 ? (int)v25 : 0;
    if (v38 == 1)
    {
      int v39 = (const __CFArray *)(*(uint64_t (**)(char *))(*(void *)v84 + 216LL))(v84);
      if (v39)
      {
        uint64_t v40 = v39;
        CFRetain(v39);
        if (v84)
        {
          DIDiskImageObjectRelease(v84);
          uid_t v84 = 0LL;
        }

        CFIndex Count = CFArrayGetCount(v40);
        if (Count >= 1)
        {
          CFIndex v42 = Count;
          for (CFIndex i = 0LL; i != v42; ++i)
          {
            uint64_t v44 = (const __CFURL *)CFArrayGetValueAtIndex(v40, i);
            sub_188254594(v44);
          }
        }

        CFRelease(v40);
      }

      if (v84)
      {
        DIDiskImageObjectRelease(v84);
        uid_t v84 = 0LL;
      }
    }
  }

  if ((_DWORD)v36) {
    BOOL v45 = 1;
  }
  else {
    BOOL v45 = a8 == 0LL;
  }
  int v46 = v83;
  if (v45 && v83)
  {
    DIDiskImageObjectRelease(v83);
    int v46 = 0LL;
  }

  if (a8) {
    *a8 = v46;
  }
  return v36;
}

void sub_18825D798(_Unwind_Exception *a1)
{
}

void sub_18825D7AC(uint64_t a1, __CFArray *a2)
{
  if (!IOObjectConformsTo(a1, "IOMedia")
    || (!IORegistryEntryCreateCFProperties( a1,  (CFMutableDictionaryRef *)&value,  (CFAllocatorRef)*MEMORY[0x189604DB0],  0)
      ? (BOOL v4 = value == 0LL)
      : (BOOL v4 = 1),
        v4
     || (CFArrayAppendValue(a2, value),
         int v5 = sub_188239FB0((const __CFDictionary *)value, @"Leaf", 0),
         CFRelease(value),
         !v5)))
  {
    if (!MEMORY[0x1895BF6D8](a1, "IOService", &iterator))
    {
      if (!IOIteratorIsValid(iterator)) {
        MEMORY[0x1895BF69C](iterator);
      }
      uint64_t v6 = IOIteratorNext(iterator);
      if ((_DWORD)v6)
      {
        uint64_t v7 = v6;
        do
        {
          sub_18825D7AC(v7, a2);
          IOObjectRelease(v7);
          uint64_t v7 = IOIteratorNext(iterator);
        }

        while ((_DWORD)v7);
      }

      if (iterator) {
        IOObjectRelease(iterator);
      }
    }
  }

void sub_18825D8B0(uint64_t a1, uint64_t a2, double a3)
{
  int v6 = DIGetBundleRef();
  uint64_t v7 = (const __CFString *)sub_1882660CC(v6, (int)@"Elapsed Time: %1$@", @"Elapsed Time: %1$@");
  CFStringRef v8 = sub_18825CB78(a2);
  uint64_t v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v7, v8);
  (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v10, 8LL);
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }
  double v11 = (100.0 - a3)
      * (double)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1)
      / 100.0
      * 512.0
      * 1000000000.0;
  double v12 = v11 / (double)(unint64_t)sub_188255FB4(a2);
  if (v12 >= 1024.0) {
    unsigned int v13 = 75;
  }
  else {
    unsigned int v13 = 32;
  }
  if (v12 >= 1024.0) {
    double v12 = v12 * 0.0009765625;
  }
  if (v12 >= 1024.0)
  {
    unsigned int v13 = 77;
    double v12 = v12 * 0.0009765625;
  }

  if (v12 >= 1024.0) {
    uint64_t v14 = 71LL;
  }
  else {
    uint64_t v14 = v13;
  }
  if (v12 >= 1024.0) {
    double v15 = v12 * 0.0009765625;
  }
  else {
    double v15 = v12;
  }
  int v16 = DIGetBundleRef();
  CFTypeRef v17 = (const __CFString *)sub_1882660CC(v16, (int)@"Speed: %1$.1f%2$cB/s", @"Speed: %1$.1f%2$cB/s");
  CFStringRef v18 = CFStringCreateWithFormat(v9, 0LL, v17, *(void *)&v15, v14);
  (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v18, 8LL);
  if (v18) {
    CFRelease(v18);
  }
  if (v17) {
    CFRelease(v17);
  }
  int v19 = DIGetBundleRef();
  uint64_t v20 = (const __CFString *)sub_1882660CC(v19, (int)@"Savings: %1$.1f%%", @"Savings: %1$.1f%%");
  CFStringRef v21 = CFStringCreateWithFormat(v9, 0LL, v20, *(void *)&a3);
  (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v21, 8LL);
  if (v21) {
    CFRelease(v21);
  }
  if (v20) {
    CFRelease(v20);
  }
}

uint64_t sub_18825DB10(void *a1, char *a2)
{
  char v4 = sub_18823FF68((uint64_t)a1);
  uint64_t v5 = sub_18825186C(a2, a1 + 20, v4 ^ 1u);
  if (!(_DWORD)v5)
  {
    uint64_t v6 = (*(uint64_t (**)(char *))(*(void *)a2 + 72LL))(a2);
    (*(void (**)(void *, uint64_t))(*a1 + 520LL))(a1, v6);
  }

  return v5;
}

uint64_t sub_18825DB84()
{
  return 1936749171LL;
}

uint64_t sub_18825DB90(void *a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1 + 112LL))(a1);
  uint64_t result = 22LL;
  if (a2 && v4 >= a2)
  {
    uint64_t v6 = a1[20];
    if (v6) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 56LL))(v6, a2);
    }
    else {
      return 999LL;
    }
  }

  return result;
}

uint64_t sub_18825DBF4(const __CFURL *a1, char *a2, const __CFDictionary *a3, void *a4)
{
  int valuePtr = 8;
  uint64_t v20 = 0LL;
  CFStringRef v21 = 0LL;
  int v19 = 0;
  CFTypeRef v17 = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v16 = -1LL;
  if (!a2) {
    goto LABEL_7;
  }
  DIDiskImageObjectRetain_0(a2);
  int v8 = sub_188239FB0(a3, @"convert-add-partition-map", 0);
  uint64_t v9 = (const __CFNumber *)CFDictionaryGetValue(a3, @"convert-alignment");
  if (v9) {
    CFNumberGetValue(v9, kCFNumberIntType, &valuePtr);
  }
  if (v8)
  {
LABEL_7:
    uint64_t v10 = 22LL;
    goto LABEL_8;
  }

  if (!sub_18824D608((const __CFString *)value, kCFNumberSInt64Type, &v16))
  {
    uint64_t v10 = 999LL;
    goto LABEL_8;
  }

  unint64_t v12 = v16;
  if (v16 < 0)
  {
LABEL_18:
    unint64_t v12 = 2048LL;
    uint64_t v16 = 2048LL;
  }

  uint64_t v13 = sub_188264990(a2, 1u, 1, v12, (__CFDictionary **)&v17, (void ****)&v20, &v19, (__CFArray **)&cf, 1);
  uint64_t v14 = (void ***)v20;
  if (!(_DWORD)v13)
  {
    uint64_t v10 = sub_18825DDA8((uint64_t)a2, a3, (uint64_t)v20, v19, (const __CFArray *)cf, a1, &v21);
    uint64_t v14 = (void ***)v20;
    if (!v20) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }

  uint64_t v10 = v13;
  if (v20) {
LABEL_23:
  }
    sub_188255BD0(v14, v19);
LABEL_8:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (v17)
  {
    CFRelease(v17);
    CFTypeRef v17 = 0LL;
  }

  if (a2) {
    DIDiskImageObjectRelease(a2);
  }
  *a4 = v21;
  return v10;
}

uint64_t sub_18825DDA8( uint64_t a1, const __CFDictionary *a2, uint64_t a3, int a4, const __CFArray *a5, const __CFURL *a6, char **a7)
{
  LODWORD(v9) = a4;
  allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  int v85 = 0LL;
  uint64_t v14 = operator new(0x28uLL);
  sub_188255F8C(v14);
  BOOL v82 = malloc(0x40000uLL);
  uint64_t valuePtr = 0LL;
  unint64_t v80 = a7;
  if ((int)v9 < 1)
  {
    uint64_t v16 = 0LL;
    double v25 = 100.0;
  }

  else
  {
    uint64_t v76 = a6;
    uint64_t v79 = v14;
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    do
    {
      uint64_t v18 = *(void *)(a3 + 8 * v15);
      if (!v18)
      {
        uint64_t v28 = 4294967246LL;
        goto LABEL_93;
      }

      if (!*(void *)v18)
      {
        LOBYTE(v18) = 0;
        uint64_t v28 = 4294967187LL;
        goto LABEL_93;
      }

      nullsub_4(*(void *)(a3 + 8 * v15));
      uint64_t v19 = *(void *)v18;
      int v20 = *(_DWORD *)(*(void *)v18 + 200LL);
      if (v20)
      {
        CFStringRef v21 = (void *)(v19 + 220);
        do
        {
          int v22 = *((_DWORD *)v21 - 4);
          if (v22) {
            BOOL v23 = v22 == 2;
          }
          else {
            BOOL v23 = 1;
          }
          if (!v23 && v22 != 0x7FFFFFFF) {
            v16 += *v21;
          }
          v21 += 5;
          --v20;
        }

        while (v20);
      }

      v17 += *(void *)(v19 + 16);
      uint64_t valuePtr = v17;
      ++v15;
    }

    while (v15 != v9);
    if (v17) {
      double v25 = (double)(v17 - v16) * 100.0 / (double)v17;
    }
    else {
      double v25 = 100.0;
    }
    a7 = v80;
    a6 = v76;
  }

  sub_188255F9C((uint64_t)v14);
  (*(void (**)(uint64_t, float))(*(void *)a1 + 344LL))(a1, 0.0);
  sub_1882383F8(Mutable, a2, 1uLL);
  CFNumberRef v26 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, @"blockcount", v26);
  if (v26) {
    CFRelease(v26);
  }
  uint64_t v27 = sub_1882539E0(a6, Mutable, 0LL, 0LL, &v85, 0LL);
  if ((_DWORD)v27)
  {
    uint64_t v28 = v27;
    LOBYTE(v18) = 0;
  }

  else
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    if ((int)v9 < 1)
    {
LABEL_62:
      sub_188255FA8((uint64_t)v14);
      int v49 = DIGetBundleRef();
      float v50 = (const __CFString *)sub_1882660CC(v49, (int)@"Elapsed Time: %1$@", @"Elapsed Time: %1$@");
      CFStringRef v51 = sub_18825CB78((uint64_t)v14);
      CFStringRef v52 = CFStringCreateWithFormat(allocator, 0LL, v50, v51);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v52, 8LL);
      if (v52) {
        CFRelease(v52);
      }
      if (v50) {
        CFRelease(v50);
      }
      if (v51) {
        CFRelease(v51);
      }
      double v53 = (100.0 - v25)
          * (double)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1)
          / 100.0
          * 512.0
          * 1000000000.0;
      double v54 = v53 / (double)(unint64_t)sub_188255FB4((uint64_t)v14);
      if (v54 >= 1024.0) {
        unsigned int v55 = 75;
      }
      else {
        unsigned int v55 = 32;
      }
      if (v54 >= 1024.0) {
        double v54 = v54 * 0.0009765625;
      }
      if (v54 >= 1024.0)
      {
        unsigned int v55 = 77;
        double v54 = v54 * 0.0009765625;
      }

      if (v54 >= 1024.0) {
        uint64_t v56 = 71LL;
      }
      else {
        uint64_t v56 = v55;
      }
      if (v54 >= 1024.0) {
        double v57 = v54 * 0.0009765625;
      }
      else {
        double v57 = v54;
      }
      int v58 = DIGetBundleRef();
      int v59 = (const __CFString *)sub_1882660CC(v58, (int)@"Speed: %1$.1f%2$cB/s", @"Speed: %1$.1f%2$cB/s");
      CFStringRef v60 = CFStringCreateWithFormat(allocator, 0LL, v59, *(void *)&v57, v56);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v60, 8LL);
      if (v60) {
        CFRelease(v60);
      }
      if (v59) {
        CFRelease(v59);
      }
      int v61 = DIGetBundleRef();
      BOOL v62 = (const __CFString *)sub_1882660CC(v61, (int)@"Savings: %1$.1f%%", @"Savings: %1$.1f%%");
      CFStringRef v63 = CFStringCreateWithFormat(allocator, 0LL, v62, *(void *)&v25);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v63, 8LL);
      if (v63) {
        CFRelease(v63);
      }
      if (v62) {
        CFRelease(v62);
      }
      CFMutableDictionaryRef Mutable = 0LL;
      uint64_t v28 = 0LL;
LABEL_90:
      LOBYTE(v18) = 1;
      a7 = v80;
    }

    else
    {
      CFIndex v29 = 0LL;
      uint64_t v30 = 0LL;
      float v31 = (float)v16;
      uint64_t v9 = v9;
      uint64_t v79 = v14;
      uint64_t v75 = v9;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a5, v29);
        if (!ValueAtIndex || (v33 = ValueAtIndex, CFTypeID TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(v33))) {
          CFNumberRef v33 = &stru_18A20E810;
        }
        int v35 = DIGetBundleRef();
        uint64_t v36 = (const __CFString *)sub_1882660CC(v35, (int)@"Reading %1$@\\U2026", @"Reading %1$@\\U2026");
        CFStringRef v37 = CFStringCreateWithFormat(allocator, 0LL, v36, v33);
        (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v37, 16LL);
        if (v37) {
          CFRelease(v37);
        }
        if (v36) {
          CFRelease(v36);
        }
        int v38 = *(uint64_t **)(a3 + 8 * v29);
        if (!v38)
        {
          CFMutableDictionaryRef Mutable = 0LL;
          uint64_t v28 = 4294967246LL;
          goto LABEL_90;
        }

        if (!*v38)
        {
          CFMutableDictionaryRef Mutable = 0LL;
          uint64_t v28 = 4294967187LL;
          goto LABEL_90;
        }

        nullsub_4(*(void *)(a3 + 8 * v29));
        uint64_t v39 = *v38;
        if (*(_DWORD *)(*v38 + 200)) {
          break;
        }
LABEL_61:
        if (++v29 == v9) {
          goto LABEL_62;
        }
      }

      unsigned int v40 = 0;
      uint64_t v41 = (int *)(v39 + 204);
      CFIndex v77 = v29;
      while (1)
      {
        int v42 = *v41;
        BOOL v43 = !*v41 || v42 == 0x7FFFFFFF;
        if (!v43 && v42 != 2) {
          break;
        }
        if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 352LL))(a1) & 1) != 0)
        {
          CFMutableDictionaryRef Mutable = 0LL;
          uint64_t v28 = 111LL;
          goto LABEL_90;
        }

void sub_18825E530(_Unwind_Exception *a1)
{
}

uint64_t sub_18825E544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 160LL))(*(void *)(a1 + 160));
  if (!(_DWORD)v6)
  {
    uint64_t v9 = v10;
    uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 64LL))(*(void *)(a1 + 160)) * v9;
    if (!a4) {
      return v6;
    }
    goto LABEL_3;
  }

  uint64_t v7 = 0LL;
  if (a4) {
LABEL_3:
  }
    *a4 = v7;
  return v6;
}

uint64_t sub_18825E5C8(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 160) + 168LL))(*(void *)(a1 + 160), a1);
}

uint64_t sub_18825E5DC(uint64_t a1, void ***a2)
{
  if (!a2)
  {
    sub_188266150(0LL);
    return 22LL;
  }

  *a2 = 0LL;
  uint64_t v4 = (void **)sub_18826612C(204LL);
  uint64_t v5 = sub_1882660D4();
  if (!(_DWORD)v5)
  {
    *(void *)__CFDictionary *v4 = 0x16D697368LL;
    uint64_t v8 = (*(uint64_t (**)(void))(**(void **)(a1 + 160) + 48LL))(*(void *)(a1 + 160));
    if (!v8)
    {
LABEL_18:
      uint64_t v16 = sub_18825E744((uint64_t)v4, -1, 0LL);
LABEL_19:
      uint64_t v6 = v16;
      if (!(_DWORD)v16) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    uint64_t v9 = v8;
    uint64_t v10 = 0LL;
    int v11 = -1;
    while (1)
    {
      uint64_t v5 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *, char *))(**(void **)(a1 + 160) + 24LL))( *(void *)(a1 + 160),  v10,  v9,  &v18,  &v17);
      if ((_DWORD)v5) {
        break;
      }
      if (v17) {
        int v12 = 1;
      }
      else {
        int v12 = 2;
      }
      uint64_t v13 = v18;
      if (v12 == v11)
      {
        uint64_t v14 = *v4;
        v14[2] = *((void *)*v4 + 2) + v18;
        uint64_t v15 = &v14[5 * *((unsigned int *)v14 + 50)];
        *(void *)((char *)v15 + 180) += v13;
      }

      else
      {
        uint64_t v16 = sub_18825E744((uint64_t)v4, v12, v18);
        int v11 = v12;
        if ((_DWORD)v16) {
          goto LABEL_19;
        }
      }

      v10 += v18;
      v9 -= v18;
      if (!v9) {
        goto LABEL_18;
      }
    }
  }

  uint64_t v6 = v5;
LABEL_4:
  sub_188266150(v4);
  uint64_t v4 = 0LL;
LABEL_5:
  *a2 = v4;
  return v6;
}

uint64_t sub_18825E744(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = sub_1882661C8(a1);
  uint64_t v7 = sub_1882660D4();
  if ((_DWORD)v7)
  {
    uint64_t v8 = v7;
  }

  else
  {
    sub_188266180(a1, v6 + 40);
    uint64_t v8 = sub_1882660D4();
    if (!(_DWORD)v8)
    {
      uint64_t v9 = *(void *)a1;
      unsigned int v10 = *(_DWORD *)(*(void *)a1 + 200LL);
      *(_DWORD *)(v9 + 200) = v10 + 1;
      uint64_t v11 = v9 + 40LL * v10;
      *(_OWORD *)(v11 + 208) = 0u;
      *(_OWORD *)(v11 + 224) = 0u;
      *(_DWORD *)(v11 + 240) = 0;
      *(_DWORD *)(v11 + 204) = a2;
      *(void *)(v11 + 220) = a3;
      uint64_t v12 = *(void *)a1;
      uint64_t v13 = *(void *)(*(void *)a1 + 16LL);
      *(void *)(v11 + 212) = v13;
      *(void *)(v12 + 16) = v13 + a3;
    }
  }

  nullsub_4(a1);
  return v8;
}

uint64_t sub_18825E80C()
{
  return 0LL;
}

BOOL sub_18825E818(uint64_t a1)
{
  if (*(_DWORD *)a1 != 1936749171) {
    return 0LL;
  }
  if (!*(_DWORD *)(a1 + 8)) {
    return 0LL;
  }
  int v1 = *(_DWORD *)(a1 + 4);
  return *(_DWORD *)(a1 + 16) != 0;
}

void sub_18825E874(char *a1, ...)
{
}

uint64_t sub_18825E8A4(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = ((uint64_t (*)(void **))(*a1)[10])(a1);
  uint64_t v7 = (*(uint64_t (**)(void *, uint64_t, uint64_t, _BYTE *, uint64_t))(*a1[3] + 328LL))( a1[3],  a2,  v6,  v10,  a3);
  if (!(_DWORD)v7)
  {
    unsigned int v8 = ((uint64_t (*)(void **))(*a1)[12])(a1);
    sub_188263AC4(a3, v8);
  }

  return v7;
}

uint64_t sub_18825E92C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = (FILE **)MEMORY[0x1895F89D0];
  fprintf((FILE *)*MEMORY[0x1895F89D0], "index node %p\n", (const void *)a2);
  fprintf(*v6, "   fSignature           %4.4s\n", (const char *)a2);
  fprintf(*v6, "   fIndexNodeNumber     %u\n", *(_DWORD *)(a2 + 4));
  fprintf(*v6, "   fNextIndexNodeOffset 0x%016qX (%qd)\n", *(void *)(a2 + 12), *(void *)(a2 + 12));
  uint64_t result = fprintf(*v6, "   fFlags               0x%08X\n", *(_DWORD *)(a2 + 8));
  if (a3)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
    if ((_DWORD)result)
    {
      unint64_t v8 = 0LL;
      uint64_t v9 = a2 + 56;
      do
      {
        if (*(_DWORD *)(v9 + 4 * v8))
        {
          fprintf(*v6, "   fBandNumber[%3d]     ", v8);
          unsigned int v10 = *v6;
          if (*(_DWORD *)(v9 + 4 * v8) == -1) {
            fwrite("(spare)\n", 8uLL, 1uLL, v10);
          }
          else {
            fprintf(v10, "%u\n", *(_DWORD *)(v9 + 4 * v8));
          }
        }

        ++v8;
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
      }

      while (v8 < result);
    }
  }

  return result;
}

uint64_t sub_18825EA88(void **a1, uint64_t a2, const void *a3)
{
  size_t v6 = ((uint64_t (*)(void **))(*a1)[10])(a1);
  uint64_t v7 = malloc(v6);
  if (!v7) {
    return 12LL;
  }
  unint64_t v8 = v7;
  memcpy(v7, a3, v6);
  unsigned int v9 = ((uint64_t (*)(void **))(*a1)[12])(a1);
  sub_188263AC4((uint64_t)v8, v9);
  uint64_t v10 = (*(uint64_t (**)(void *, uint64_t, size_t, _BYTE *, void *))(*a1[3] + 336LL))(a1[3], a2, v6, v12, v8);
  free(v8);
  return v10;
}

uint64_t sub_18825EB40(uint64_t a1)
{
  size_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
  uint64_t v3 = *(void *)(a1 + 112);
  uint64_t result = sub_188254340(a1, v3 + v2);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t v5 = *(void **)(a1 + 80);
  if (!v5)
  {
    uint64_t v7 = (char *)malloc(v2);
    *(void *)(a1 + 80) = v7;
    if (v7) {
      goto LABEL_6;
    }
    return 12LL;
  }

  size_t v6 = (char *)realloc(v5, v2 * (*(_DWORD *)(a1 + 32) + 1));
  if (!v6) {
    return 12LL;
  }
  uint64_t v7 = v6;
  *(void *)(a1 + 80) = v6;
LABEL_6:
  uint64_t v8 = *(unsigned int *)(a1 + 32);
  *(_DWORD *)(a1 + 32) = v8 + 1;
  unsigned int v9 = &v7[(*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * v8];
  LODWORD(v8) = *(_DWORD *)(a1 + 32);
  bzero(v9, v2);
  *(_DWORD *)unsigned int v9 = 1936749171;
  *((_DWORD *)v9 + 1) = v8 - 1;
  BOOL v10 = v8 >= 2;
  uint64_t v11 = (v8 - 2);
  if (v10)
  {
    uint64_t v12 = *(void *)(a1 + 80);
    uint64_t v13 = v12 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * v11;
    *(void *)(v13 + 12) = v3;
    uint64_t v15 = (_DWORD *)(v13 + 8);
  }

  else
  {
    uint64_t v14 = *(void *)(a1 + 72);
    *(void *)(v14 + 20) = v3;
    uint64_t v15 = (_DWORD *)(v14 + 12);
  }

  *v15 |= 1u;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, size_t, char *, char *))(**(void **)(a1 + 24) + 336LL))( *(void *)(a1 + 24),  v3,  v2,  v16,  v9);
  if (!(_DWORD)result)
  {
    *((_DWORD *)v9 + 2) &= ~1u;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
  }

  return result;
}

uint64_t sub_18825ECA0(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
  *a4 = 0;
  if (a2 >= a3) {
    return 0LL;
  }
  uint64_t v9 = v8;
  if (a2 % v8) {
    a2 = (v8 + a2) / v8 * v8;
  }
  unsigned int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 136LL))(a1, a2);
  if (*(void *)(a1 + 40) == a3)
  {
    if (a3 % v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 0LL;
    }
    a3 = (v11 + a3) / v9 * v9;
  }

  uint64_t v12 = a3 / v9 * v9;
  unsigned int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 136LL))(a1, v12 - 1);
  if (v12 - a2 < v9 || v10 > v13) {
    return 0LL;
  }
  unsigned int v16 = v13;
  uint64_t v17 = *(void *)(a1 + 72);
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 88LL))(a1))
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = v17 + 64;
    do
    {
      unsigned int v20 = *(_DWORD *)(v19 + 4 * v18);
      if (v20 + 1 >= 2 && v20 >= v10 && v20 <= v16)
      {
        *(_DWORD *)(*(void *)(a1 + 72) + 12LL) |= 1u;
        unsigned int v23 = *(_DWORD *)(v19 + 4 * v18);
        uint64_t v24 = *(void *)(a1 + 8);
        if (v23) {
          BOOL v25 = v24 == 0;
        }
        else {
          BOOL v25 = 1;
        }
        if (!v25 && *(_DWORD *)(a1 + 16) >= v23) {
          *(void *)(v24 + 8LL * (v23 - 1)) = 0LL;
        }
        *(_DWORD *)(v19 + 4 * v18) = -1;
        ++*a4;
      }

      ++v18;
    }

    while (v18 < (*(unsigned int (**)(uint64_t))(*(void *)a1 + 88LL))(a1));
  }

  unsigned int v26 = *(_DWORD *)(a1 + 32);
  if (v26)
  {
    for (unsigned int i = 1; i <= v26; ++i)
    {
      uint64_t v28 = i - 1;
      uint64_t v29 = *(void *)(a1 + 80);
      else {
        uint64_t v31 = v29 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * v28;
      }
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 96LL))(a1))
      {
        uint64_t v32 = 0LL;
        uint64_t v33 = v31 + 56;
        do
        {
          unsigned int v34 = *(_DWORD *)(v33 + 4 * v32);
          if (v34 + 1 >= 2 && v34 >= v10 && v34 <= v16)
          {
            uint64_t v37 = *(void *)(a1 + 80);
            uint64_t v38 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
            *(_DWORD *)(v37 + v38 * v28 + 8) |= 1u;
            unsigned int v39 = *(_DWORD *)(v33 + 4 * v32);
            uint64_t v40 = *(void *)(a1 + 8);
            if (v39) {
              BOOL v41 = v40 == 0;
            }
            else {
              BOOL v41 = 1;
            }
            if (!v41 && *(_DWORD *)(a1 + 16) >= v39) {
              *(void *)(v40 + 8LL * (v39 - 1)) = 0LL;
            }
            *(_DWORD *)(v33 + 4 * v32) = -1;
            ++*a4;
          }

          ++v32;
        }

        while (v32 < (*(unsigned int (**)(uint64_t))(*(void *)a1 + 96LL))(a1));
      }

      unsigned int v26 = *(_DWORD *)(a1 + 32);
    }
  }

  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
}

uint64_t sub_18825EF64(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[9];
  uint64_t v5 = *(void *)(v4 + 28);
  *(void *)(v4 + 28) = a2;
  *(_DWORD *)(v4 + 12) |= 1u;
  *(_DWORD *)(v4 + 16) = a2;
  if (v5 > a2)
  {
    uint64_t v6 = (*(uint64_t (**)(void *, uint64_t))(*a1 + 160LL))(a1, a2);
    if ((_DWORD)v6 || (uint64_t v6 = (*(uint64_t (**)(void *, void))(*a1 + 168LL))(a1, 0LL), (_DWORD)v6))
    {
      uint64_t v7 = v6;
      goto LABEL_15;
    }
  }

  uint64_t v7 = (*(uint64_t (**)(void *))(*a1 + 120LL))(a1);
  (*(void (**)(void, uint64_t))(*(void *)a1[3] + 472LL))(a1[3], 1LL);
  if ((_DWORD)v7)
  {
LABEL_15:
    uint64_t v13 = a1[5];
    uint64_t v14 = a1[9];
    *(void *)(v14 + 28) = v13;
    *(_DWORD *)(v14 + 16) = v13;
    return v7;
  }

  uint64_t v8 = a2 / (*(uint64_t (**)(void *))(*a1 + 64LL))(a1);
  else {
    unsigned int v9 = v8;
  }
  unsigned int v10 = (char *)realloc((void *)a1[1], 8LL * v9);
  if (!v10)
  {
    uint64_t v7 = 12LL;
    goto LABEL_15;
  }

  a1[1] = v10;
  uint64_t v11 = *((unsigned int *)a1 + 4);
  uint64_t v7 = 0LL;
  *((_DWORD *)a1 + 4) = v9;
  a1[5] = a2;
  return v7;
}

uint64_t sub_18825F0A8(uint64_t a1, uint64_t a2)
{
  CFArrayRef theArray = 0LL;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned int *, CFArrayRef *))(*(void *)a1 + 176LL))( a1,  a2,  &v19,  &theArray);
  if (!(_DWORD)v4)
  {
    if (v19)
    {
      unsigned int Count = CFArrayGetCount(theArray);
      unsigned int v6 = Count;
      if (Count)
      {
        if (v19 >= Count) {
          unsigned int v7 = Count;
        }
        else {
          unsigned int v7 = v19;
        }
        if (a2) {
          (*(void (**)(uint64_t, float))(*(void *)a2 + 344LL))(a2, 0.0);
        }
        if (v7)
        {
          unsigned int v9 = v6 - 1;
          unsigned int v10 = 1;
          float v11 = -1.0;
          do
          {
            ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v9);
            CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
            uint64_t v13 = (*(uint64_t (**)(uint64_t, void, char *))(*(void *)a1 + 184LL))(a1, valuePtr, &v18);
            if ((_DWORD)v13) {
              goto LABEL_34;
            }
            if (a2 && v18)
            {
              float v8 = (float)v7;
              if ((float)((float)((float)((float)v10 * 100.0) / (float)v7) - v11) >= 1.0)
              {
                (*(void (**)(uint64_t, float))(*(void *)a2 + 344LL))(a2, (float)((float)v10 * 100.0) / v8);
                float v11 = (float)((float)v10 * 100.0) / v8;
              }

              if (((*(uint64_t (**)(uint64_t))(*(void *)a2 + 352LL))(a2) & 1) != 0)
              {
                int v15 = 2714;
                goto LABEL_30;
              }
            }

            else if (!v18)
            {
              break;
            }

            ++v10;
            --v9;
          }

          while (v10 <= v7);
        }
      }
    }

    if (a2)
    {
      (*(void (**)(uint64_t, float))(*(void *)a2 + 344LL))(a2, 100.0);
      if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 352LL))(a2))
      {
        int v15 = 2728;
LABEL_30:
        syslog(5, "CSparseFile::compact(): line %d: returning kDI_USERCANCELED", v15);
        uint64_t v4 = 111LL;
        goto LABEL_31;
      }
    }

    uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192LL))(a1);
    if ((_DWORD)v13)
    {
LABEL_34:
      uint64_t v4 = v13;
      goto LABEL_31;
    }

    if (a2 && (*(unsigned int (**)(uint64_t))(*(void *)a2 + 352LL))(a2))
    {
      int v15 = 2739;
      goto LABEL_30;
    }

    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
    uint64_t v4 = v14;
    if (a2 && !(_DWORD)v14) {
      (*(void (**)(uint64_t, float))(*(void *)a2 + 344LL))(a2, 100.0);
    }
  }

uint64_t sub_18825F2E8(void *a1, uint64_t a2, _DWORD *a3, CFMutableArrayRef *a4)
{
  float v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (a2 && ((*(uint64_t (**)(uint64_t))(*(void *)a2 + 352LL))(a2) & 1) != 0)
  {
    int v10 = 2775;
LABEL_30:
    syslog(5, "CSparseFile::buildSortedBandList(): line %d: returning kDI_USERCANCELED", v10);
    if (Mutable)
    {
      CFRelease(Mutable);
      int v12 = 0;
      CFMutableArrayRef Mutable = 0LL;
    }

    else
    {
      int v12 = 0;
    }

    uint64_t result = 111LL;
    goto LABEL_34;
  }

  uint64_t v24 = a4;
  uint64_t v11 = a1[9];
  int v12 = 0;
  if ((*(unsigned int (**)(void *))(*a1 + 88LL))(a1))
  {
    unsigned int v13 = 0;
    uint64_t v14 = (unsigned int *)(v11 + 64);
    do
    {
      uint64_t result = *v14;
      if ((_DWORD)result == -1)
      {
        ++v12;
      }

      else
      {
        if (!(_DWORD)result) {
          goto LABEL_28;
        }
        CFNumberRef v16 = CFNumberCreate(v8, kCFNumberSInt32Type, v14);
        CFArrayAppendValue(Mutable, v16);
        CFRelease(v16);
      }

      ++v13;
      ++v14;
    }

    while (v13 < (*(unsigned int (**)(void *))(*a1 + 88LL))(a1));
  }

  if (*((_DWORD *)a1 + 8))
  {
    int v17 = 1;
    while (!a2 || ((*(uint64_t (**)(uint64_t))(*(void *)a2 + 352LL))(a2) & 1) == 0)
    {
      uint64_t v18 = a1[10];
      else {
        uint64_t v20 = 0LL;
      }
      if ((*(unsigned int (**)(void *))(*a1 + 96LL))(a1))
      {
        unsigned int v21 = 0;
        int v22 = (unsigned int *)(v20 + 56);
        do
        {
          uint64_t result = *v22;
          if ((_DWORD)result == -1)
          {
            ++v12;
          }

          else
          {
            if (!(_DWORD)result) {
              goto LABEL_28;
            }
            CFNumberRef v23 = CFNumberCreate(v8, kCFNumberSInt32Type, v22);
            CFArrayAppendValue(Mutable, v23);
            CFRelease(v23);
          }

          ++v21;
          ++v22;
        }

        while (v21 < (*(unsigned int (**)(void *))(*a1 + 96LL))(a1));
      }
    }

    int v10 = 2797;
    a4 = v24;
    goto LABEL_30;
  }

uint64_t sub_18825F538(uint64_t a1, unsigned int a2, _BYTE *a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
  uint64_t v40 = a3;
  uint64_t v41 = 0LL;
  *a3 = 0;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7)
    {
      if (*(_DWORD *)(a1 + 16) < a2) {
        uint64_t v41 = 0LL;
      }
      else {
        uint64_t v41 = *(void *)(v7 + 8LL * (a2 - 1));
      }
    }
  }

  uint64_t v8 = v6 << 9;
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
  int v11 = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 88LL))(a1))
  {
    uint64_t v44 = 0LL;
    uint64_t v45 = 0LL;
    int v12 = 0;
    int v42 = 0LL;
    BOOL v43 = 0LL;
    goto LABEL_22;
  }

  uint64_t v44 = 0LL;
  uint64_t v45 = 0LL;
  int v12 = 0;
  int v42 = 0LL;
  BOOL v43 = 0LL;
  unsigned int v13 = 0;
  uint64_t v14 = (int *)(v9 + 64);
  do
  {
    int v15 = *v14;
    if (!*v14) {
      goto LABEL_57;
    }
    if (!(v11 & 1 | (v15 != -1)))
    {
      uint64_t v44 = (_DWORD *)(*(void *)(a1 + 72) + 12LL);
      int v11 = 1;
      int v42 = v14;
    }

    if (v15 == a2)
    {
      uint64_t v45 = (_DWORD *)(*(void *)(a1 + 72) + 12LL);
      int v12 = 1;
      BOOL v43 = v14;
    }

    if ((v11 & 1) != 0) {
      uint64_t v16 = 0LL;
    }
    else {
      uint64_t v16 = v8;
    }
    v10 += v16;
    if ((v11 & v12 & 1) != 0)
    {
      int v12 = 1;
      int v11 = 1;
      goto LABEL_21;
    }

    ++v13;
    ++v14;
  }

  while (v13 < (*(unsigned int (**)(uint64_t))(*(void *)a1 + 88LL))(a1));
  if ((v11 & 1) == 0)
  {
LABEL_22:
    unsigned int v17 = 1;
    while (1)
    {
      unsigned int v18 = *(_DWORD *)(a1 + 32);
      if (v17 > v18) {
        goto LABEL_57;
      }
      uint64_t v19 = v17 - 1;
      uint64_t v20 = *(void *)(a1 + 80);
      uint64_t v22 = 0LL;
      if ((v11 & 1) == 0) {
        goto LABEL_31;
      }
LABEL_32:
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 96LL))(a1))
      {
        unsigned int v23 = 0;
        uint64_t v24 = (int *)(v22 + 56);
        do
        {
          int v25 = *v24;
          if (!*v24) {
            goto LABEL_57;
          }
          if (!(v11 & 1 | (v25 != -1)))
          {
            uint64_t v26 = *(void *)(a1 + 80);
            if (v26 && *(_DWORD *)(a1 + 32) > v19)
            {
              uint64_t v27 = v26 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * v19;
              int v25 = *v24;
            }

            else
            {
              uint64_t v27 = 0LL;
              int v25 = -1;
            }

            uint64_t v44 = (_DWORD *)(v27 + 8);
            int v11 = 1;
            int v42 = v24;
          }

          if (v25 == a2)
          {
            uint64_t v28 = *(void *)(a1 + 80);
            else {
              uint64_t v29 = 0LL;
            }
            uint64_t v45 = (_DWORD *)(v29 + 8);
            int v12 = 1;
            BOOL v43 = v24;
          }

          if ((v11 & 1) != 0) {
            uint64_t v30 = 0LL;
          }
          else {
            uint64_t v30 = v8;
          }
          v10 += v30;
          if ((v11 & v12 & 1) != 0)
          {
            int v12 = 1;
            int v11 = 1;
            break;
          }

          ++v23;
          ++v24;
        }

        while (v23 < (*(unsigned int (**)(uint64_t))(*(void *)a1 + 96LL))(a1));
      }

      ++v17;
      if ((v11 & 1) != 0 && (v12 & 1) != 0) {
        goto LABEL_56;
      }
    }

    uint64_t v22 = v20 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * v19;
    if ((v11 & 1) != 0) {
      goto LABEL_32;
    }
LABEL_31:
    v10 += (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
    goto LABEL_32;
  }

uint64_t sub_18825F980(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 32);
  if (!(_DWORD)v1) {
    return 0LL;
  }
  while (1)
  {
    uint64_t v3 = v1 - 1;
    uint64_t v4 = *(void *)(a1 + 80);
    else {
      uint64_t v5 = 0LL;
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 96LL))(a1))
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = v5 + 56;
      while ((*(_DWORD *)(v7 + 4 * v6) + 1) <= 1)
      {
      }

      return 0LL;
    }

uint64_t sub_18825FB70(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
  uint64_t v3 = v2 << 9;
  int v4 = *(_DWORD *)(a1 + 32);
  if (!v4)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
    unsigned int v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
    if (!v8) {
      goto LABEL_27;
    }
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = v7 + ((v2 * v8) << 9);
    unsigned int v11 = v8 - 1;
    while (1)
    {
      uint64_t v12 = v9 + 4LL * v11;
      int v15 = *(_DWORD *)(v12 + 64);
      unsigned int v13 = (_DWORD *)(v12 + 64);
      int v14 = v15;
      if (v15)
      {
        if (v14 != -1)
        {
          uint64_t v7 = v10;
          goto LABEL_27;
        }

        *unsigned int v13 = 0;
        *(_DWORD *)(v9 + 12) |= 1u;
      }

      v10 -= v3;
    }
  }

  uint64_t v5 = *(void *)(a1 + 80);
  if (v5)
  {
    uint64_t v6 = v5 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * (v4 - 1);
    int v4 = *(_DWORD *)(a1 + 32);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  if (v4 == 1)
  {
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 72) + 20LL);
  }

  else
  {
    uint64_t v18 = 0LL;
    if (v4)
    {
      uint64_t v19 = *(void *)(a1 + 80);
      if (v19) {
        uint64_t v18 = v19 + (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) * (v4 - 2);
      }
    }

    uint64_t v17 = (uint64_t *)(v18 + 12);
  }

  uint64_t v20 = *v17;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1) + v20;
  unsigned int v21 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  if (v21)
  {
    uint64_t v22 = v7 + ((v2 * v21) << 9);
    unsigned int v23 = v21 - 1;
    do
    {
      uint64_t v24 = v6 + 4LL * v23;
      int v27 = *(_DWORD *)(v24 + 56);
      int v25 = (_DWORD *)(v24 + 56);
      int v26 = v27;
      if (v27)
      {
        if (v26 != -1)
        {
          uint64_t v7 = v22;
          break;
        }

        *int v25 = 0;
        *(_DWORD *)(v6 + 8) |= 1u;
      }

      v22 -= v3;
    }

    while ((unint64_t)v23--);
  }

uint64_t sub_18825FD60(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t sub_18825FD68(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t sub_18825FD74()
{
  return 0LL;
}

CFDictionaryRef sub_18825FD7C(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**(void))(**(void **)(a1 + 176) + 192LL))(*(void *)(a1 + 176));
  if (v2)
  {
    uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v2);
    if (MutableCopy)
    {
      uint64_t v5 = MutableCopy;
      CFStringRef v6 = CFStringCreateWithFormat( v3,  0LL,  @"sectors %qd-%qd",  *(void *)(a1 + 160),  *(void *)(a1 + 160) + *(void *)(a1 + 168) - 1LL);
      if (v6)
      {
        CFStringRef v7 = v6;
        CFDictionarySetValue(v5, @"sector-range", v6);
        CFDictionaryRef Copy = CFDictionaryCreateCopy(v3, v5);
        CFRelease(v7);
      }

      else
      {
        CFDictionaryRef Copy = CFDictionaryCreateCopy(v3, v5);
      }

      CFRelease(v2);
      uint64_t v2 = Copy;
    }

    else
    {
      uint64_t v5 = v2;
    }

    CFRelease(v5);
  }

  return v2;
}

uint64_t sub_18825FE70(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 176) + 72LL))(*(void *)(a1 + 176));
  if (result)
  {
    uint64_t v2 = (const void *)result;
    CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%1$@ (part)", result);
    CFRelease(v2);
    return (uint64_t)v3;
  }

  return result;
}

uint64_t sub_18825FED8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 176) + 128LL))(*(void *)(a1 + 176));
}

uint64_t sub_18825FEE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 176) + 136LL))(*(void *)(a1 + 176));
}

uint64_t sub_18825FEF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 168);
  if (v3 >= a2 && a3 + a2 <= v3) {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 176) + 144LL))( *(void *)(a1 + 176),  *(void *)(a1 + 160) + a2);
  }
  else {
    return 22LL;
  }
}

uint64_t sub_18825FF34(uint64_t a1)
{
}

__CFDictionary *sub_18825FF68(char *a1)
{
  uint64_t v2 = sub_1882562C4(a1);
  if (v2)
  {
    uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    CFDictionaryAddValue(v2, @"Size Information", Mutable);
    uint64_t v5 = DIGetBundleRef();
    if (v5)
    {
      CFTypeRef v6 = sub_1882660CC(v5, (int)@"partial", @"partial");
      CFDictionaryAddValue(v2, @"Format Description", v6);
      if (v6) {
        CFRelease(v6);
      }
      CFDictionaryAddValue(v2, @"Format", @"SUBB");
      uint64_t valuePtr = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1) << 9;
      CFNumberRef v7 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Total Bytes", v7);
      if (v7) {
        CFRelease(v7);
      }
      uint64_t valuePtr = 0LL;
      CFNumberRef v8 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Total Empty Bytes", v8);
      if (v8) {
        CFRelease(v8);
      }
      uint64_t valuePtr = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1) << 9;
      CFNumberRef v9 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Total Non-Empty Bytes", v9);
      if (v9) {
        CFRelease(v9);
      }
      uint64_t valuePtr = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1) << 9;
      CFNumberRef v10 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Compressed Bytes", v10);
      if (v10) {
        CFRelease(v10);
      }
      uint64_t v15 = 0x3FF0000000000000LL;
      CFNumberRef v11 = CFNumberCreate(v3, kCFNumberDoubleType, &v15);
      CFDictionaryAddValue(Mutable, @"Compressed Ratio", v11);
      if (v11) {
        CFRelease(v11);
      }
      uint64_t valuePtr = (*(uint64_t (**)(char *))(*(void *)a1 + 96LL))(a1);
      CFNumberRef v12 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, @"Sector Count", v12);
      if (v12) {
        CFRelease(v12);
      }
      uint64_t Value = (__CFDictionary *)CFDictionaryGetValue(v2, @"Properties");
      CFDictionaryAddValue(Value, @"Compressed", @"no");
      if (Mutable) {
        CFRelease(Mutable);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

uint64_t sub_188260220(uint64_t a1, uint64_t a2)
{
  if (sub_188241410(a1)) {
    return sub_188259628(a1, a2);
  }
  else {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 176) + 360LL))(*(void *)(a1 + 176), a2);
  }
}

uint64_t sub_18826026C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 104) || sub_188241410(a1)) {
    return sub_188241574(a1, a2, a3);
  }
  else {
    return (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 176) + 336LL))( *(void *)(a1 + 176),  a2,  a3);
  }
}

uint64_t sub_1882602DC(uint64_t a1, float a2)
{
  if (*(void *)(a1 + 112) || sub_188241410(a1)) {
    return sub_188241398(a1, a2);
  }
  else {
    return (*(uint64_t (**)(void, float))(**(void **)(a1 + 176) + 344LL))(*(void *)(a1 + 176), a2);
  }
}

uint64_t sub_188260340(uint64_t a1)
{
  if (*(void *)(a1 + 120) || sub_188241410(a1)) {
    return sub_188242F00(a1);
  }
  else {
    return (*(uint64_t (**)(void))(**(void **)(a1 + 176) + 352LL))(*(void *)(a1 + 176));
  }
}

uint64_t sub_18826038C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = a1;
  if (!sub_188241410(a1)) {
    uint64_t v13 = *(void *)(v13 + 176);
  }
  return sub_18825B360(v13, a2, a3, a4, a5, a6, a7);
}

const char *sub_188260400()
{
  return "CSubDiskImage";
}

uint64_t sub_188260410(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  CFNumberRef v10 = (pthread_rwlock_t *)(a1 + 160);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 160));
  if (!a5)
  {
LABEL_33:
    uint64_t v13 = 0LL;
    uint64_t v17 = 22LL;
    goto LABEL_30;
  }

  if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1))
  {
    uint64_t v11 = *(void *)(a1 + 360);
    if (v11 < a2 || a3 + a2 > v11) {
      goto LABEL_33;
    }
    unsigned int v21 = v10;
    uint64_t v13 = 0LL;
    while (a3)
    {
      sub_18824269C(a1, a2, &v26, &v27, &v25, &v24, &v23, &v22, 0LL);
      if (v24 - (a2 - v25) >= a3) {
        uint64_t v14 = a3;
      }
      else {
        uint64_t v14 = v24 - (a2 - v25);
      }
      unsigned int v15 = 1;
      if (v27 >= -2147483639)
      {
        switch(v27)
        {
          case -1:
            unsigned int v15 = 999;
            break;
          case 0:
          case 2:
            break;
          case 1:
            uint64_t v18 = v23 + ((a2 - v25) << 9);
            uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1);
            unsigned int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BYTE *, uint64_t))(*(void *)v19 + 336LL))( v19,  v18,  v14 << 9,  v28,  a5);
            break;
          default:
            if (v27 == 2147483646) {
              unsigned int v15 = 1;
            }
            else {
              unsigned int v15 = 107;
            }
            break;
        }
      }

      a3 -= v14;
      v13 += v14;
      a2 += v14;
      a5 += v14 << 9;
      if (v15) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = v14 == 0;
      }
      if (v16) {
        uint64_t v17 = 999LL;
      }
      else {
        uint64_t v17 = v15;
      }
      if ((_DWORD)v17) {
        goto LABEL_29;
      }
    }

    uint64_t v17 = 0LL;
LABEL_29:
    CFNumberRef v10 = v21;
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v17 = 999LL;
  }

uint64_t DIUDIFDiskImageGetBLKXStartingAt_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 928);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 912);
  while (1)
  {
    uint64_t result = *v2;
    if (*v2)
    {
      if (*(void *)(*(void *)result + 8LL) == a2) {
        break;
      }
    }

    ++v2;
    if (!--v3) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_18826061C(uint64_t a1)
{
  return *(void *)(a1 + 920);
}

uint64_t sub_188260624(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = sub_18823AC00(a3);
  uint64_t v15 = 0LL;
  if (!(*(uint64_t (**)(uint64_t))(*(void *)a1 + 296LL))(a1))
  {
    if (!a2
      || !__dynamic_cast( a2,  (const struct __class_type_info *)&unk_18A20ABD8,  (const struct __class_type_info *)&unk_18A20D3D0,  0LL))
    {
      return 110LL;
    }

    *(_DWORD *)(a1 + 144) = 1430538566;
    uint64_t v7 = (*(uint64_t (**)(void *, uint64_t))(*(void *)a2 + 80LL))(a2, v5);
    if ((_DWORD)v7
      || (uint64_t v8 = (*(uint64_t (**)(void *))(*(void *)a2 + 72LL))(a2),
          (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 520LL))(a1, v8),
          uint64_t v7 = (*(uint64_t (**)(void *))(*(void *)a2 + 272LL))(a2),
          (_DWORD)v7))
    {
      uint64_t v6 = v7;
      int v9 = 0;
    }

    else if (__dynamic_cast( a2,  (const struct __class_type_info *)&unk_18A20ABD8,  (const struct __class_type_info *)&unk_18A20D3D0,  0LL))
    {
      (*(void (**)(void *, uint64_t))(*(void *)a2 + 704LL))(a2, a1 + 392);
      unsigned int v10 = (*(uint64_t (**)(void *, uint64_t *))(*(void *)a2 + 344LL))(a2, &v15);
      if (v10)
      {
        uint64_t v15 = 0LL;
        if (v10 == 78 || v10 == 2) {
          uint64_t v6 = 107LL;
        }
        else {
          uint64_t v6 = v10;
        }
LABEL_22:
        (*(void (**)(void *, void))(*(void *)a2 + 280LL))(a2, 0LL);
        return v6;
      }

      uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 584LL))(a1, v15);
      if ((_DWORD)v13
        || (uint64_t v13 = (*(uint64_t (**)(void *, uint64_t *))(*(void *)a2 + 296LL))(a2, &v14), (_DWORD)v13)
        || (uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 592LL))(a1, v14), (_DWORD)v13)
        || (uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 600LL))(a1), (_DWORD)v13))
      {
        uint64_t v6 = v13;
      }

      else
      {
        nullsub_4(*(void *)(a1 + 904));
        if (v15)
        {
          (*(void (**)(void *, void))(*(void *)a2 + 352LL))(a2, 0LL);
          uint64_t v15 = 0LL;
        }

        uint64_t v6 = sub_18823FEB4(a1);
        if (!(_DWORD)v6)
        {
          sub_18823FF28(a1, (char *)a2);
          *(void *)(a1 + 360) = *(void *)(**(void **)(a1 + 904) + 16LL);
          return v6;
        }
      }

      int v9 = 1;
    }

    else
    {
      int v9 = 1;
      uint64_t v6 = 107LL;
    }

    if (v15)
    {
      (*(void (**)(void *, void))(*(void *)a2 + 352LL))(a2, 0LL);
      uint64_t v15 = 0LL;
      if ((v9 & 1) == 0) {
        return v6;
      }
    }

    else if (!v9)
    {
      return v6;
    }

    goto LABEL_22;
  }

  return 78LL;
}

uint64_t sub_188260884(uint64_t a1, const char *a2)
{
  uint64_t v2 = "";
  if (a2) {
    uint64_t v2 = a2;
  }
  uint64_t v3 = "YES";
  if (*(void *)(a1 + 104)) {
    int v4 = "YES";
  }
  else {
    int v4 = "NO";
  }
  if (!*(_BYTE *)(a1 + 112)) {
    uint64_t v3 = "NO";
  }
  return fprintf( (FILE *)*MEMORY[0x1895F89D0],  "%s%qd at %qd (read %s, zero %s)\n",  v2,  *(void *)(a1 + 96),  *(void *)(a1 + 88),  v4,  v3);
}

BOOL sub_188260900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 160LL))(a1, a2, a3, 0LL) == 0;
}

uint64_t sub_188260928()
{
  return 78LL;
}

void sub_188260930(uint64_t a1, const __CFString *a2)
{
  int v4 = (const char *)sub_18823A098(a2, 0x8000100u);
  if (v4)
  {
    uint64_t v5 = (char *)v4;
    uint64_t v6 = v4 + 14;
    if (v4[14])
    {
      if (!strcmp(v4 + 14, "global"))
      {
LABEL_10:
        unsigned int v10 = (uint64_t *)(a1 + 904);
        uint64_t v11 = -2LL;
LABEL_15:
        uint64_t v13 = *v10;
        if (*v10)
        {
          uint64_t v14 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
          if (Mutable)
          {
            BOOL v16 = Mutable;
            uint64_t v41 = a2;
            CFNumberRef v17 = CFNumberCreate(v14, kCFNumberLongLongType, (const void *)(*(void *)v13 + 8LL));
            CFDictionarySetValue(v16, @"sector-start", v17);
            if (v17) {
              CFRelease(v17);
            }
            CFNumberRef v18 = CFNumberCreate(v14, kCFNumberLongLongType, (const void *)(*(void *)v13 + 16LL));
            CFDictionarySetValue(v16, @"sector-count", v18);
            if (v18) {
              CFRelease(v18);
            }
            uint64_t v19 = sub_188241424(a1, v11);
            if (v19) {
              CFDictionarySetValue(v16, @"name", v19);
            }
            CFMutableArrayRef v20 = CFArrayCreateMutable(v14, 0LL, MEMORY[0x189605228]);
            if (!v20)
            {
              free(v5);
              CFRelease(v16);
              return;
            }

            CFMutableArrayRef v21 = v20;
            uint64_t v38 = a1;
            CFMutableDictionaryRef theDict = v16;
            uint64_t v40 = v5;
            int v22 = *(_DWORD *)(*(void *)v13 + 200LL);
            if (v22)
            {
              uint64_t v23 = *(void *)v13 + 208LL;
              value = (void *)*MEMORY[0x189604DE8];
              BOOL v43 = v20;
              do
              {
                CFMutableDictionaryRef v24 = CFDictionaryCreateMutable(v14, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
                if (!v24)
                {
                  free(v40);
                  CFRelease(theDict);
                  CFRelease(v21);
                  return;
                }

                uint64_t v25 = v24;
                int v26 = 0;
                unsigned int v27 = *(_DWORD *)(v23 - 4);
                __endptr = *(char **)(v23 + 4);
                uint64_t valuePtr = *(void *)(v23 + 12);
                unsigned int v28 = v27 >> 28;
                if (v27 >> 28 > 7)
                {
                  if (v28 == 8)
                  {
                    BOOL v29 = 0;
                    BOOL v30 = 0;
                    int v31 = 0;
                    int v33 = 0;
                    int v26 = 1;
LABEL_38:
                    int v32 = 1;
                    goto LABEL_39;
                  }

                  BOOL v29 = 0;
                  BOOL v30 = 0;
                  int v31 = 0;
                  int v32 = 0;
                  int v33 = 0;
                  if (v28 == 15)
                  {
                    int v26 = 0;
                    BOOL v29 = 0;
                    BOOL v30 = 0;
                    int v31 = 0;
                    int v32 = 0;
                    int v33 = 1;
                  }
                }

                else
                {
                  if (!v28)
                  {
                    if (v27 <= 2)
                    {
                      int v26 = 0;
                      int v31 = 0;
                      int v33 = 0;
                      BOOL v30 = (v27 & 7) == 0;
                      BOOL v29 = (v27 & 7) == 2;
                      int v32 = v27 & 1;
                      goto LABEL_39;
                    }

                    int v26 = 0;
                    BOOL v29 = 0;
                    BOOL v30 = 0;
                    int v31 = 0;
                    int v33 = 0;
                    goto LABEL_38;
                  }

                  BOOL v29 = 0;
                  BOOL v30 = 0;
                  int v31 = 0;
                  int v32 = 0;
                  int v33 = 0;
                  if (v28 == 7)
                  {
                    int v26 = 0;
                    BOOL v29 = 0;
                    BOOL v30 = 0;
                    int v32 = 0;
                    int v33 = 0;
                    int v31 = 1;
                  }
                }

LABEL_60:
    free(v5);
  }

void sub_188260E5C(void *a1)
{
}

void sub_188260E80(_Unwind_Exception *a1)
{
}

uint64_t sub_188260E94(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  *(_DWORD *)(a1 + 912) = 1;
  *(_WORD *)(a1 + 916) = 0;
  int v4 = calloc(8uLL, 1uLL);
  *(void *)(a1 + 928) = v4;
  if (!v4) {
    return 12LL;
  }
  uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  *(void *)(a1 + 936) = Mutable;
  if (!Mutable) {
    return 12LL;
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t **))(*(void *)a2 + 120LL))( a2,  1651272547LL,  0LL,  &v19);
  **(void **)(a1 + 928) = v19;
  if ((_DWORD)v7) {
    return v7;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t *, _BYTE *, _BYTE *, unsigned __int8 *, CFTypeRef *))(*(void *)a2 + 320LL))( a2,  v19,  v18,  v17,  pStr,  &cf);
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a2 + 248LL))(a2, v19);
  if (!(_DWORD)v8)
  {
    if (cf)
    {
      BOOL v9 = CFRetain(cf);
    }

    else
    {
      CFStringRef v10 = CFStringCreateWithPascalString(v5, pStr, 0);
      if (v10)
      {
        BOOL v9 = v10;
        CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v10);
        goto LABEL_11;
      }

      int v14 = DIGetBundleRef();
      uint64_t v15 = (const __CFString *)sub_1882660CC(v14, (int)@"restricted segment %d", @"restricted segment %d");
      BOOL v9 = CFStringCreateWithFormat(v5, 0LL, v15, *(unsigned int *)(a1 + 448));
      CFRelease(v15);
    }

    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v9);
    if (!v9)
    {
LABEL_12:
      nullsub_4(v19);
      uint64_t v11 = *v19;
      unint64_t v12 = sub_1882661C8((uint64_t)v19);
      else {
        return 0LL;
      }
    }

uint64_t sub_188261088(uint64_t a1)
{
  uint64_t v1 = **(const void ****)(a1 + 928);
  if (!v1) {
    return 22LL;
  }
  size_t v3 = 40LL * (*((_DWORD *)*v1 + 50) - 1) + 244;
  int v4 = (void **)sub_18826612C(v3);
  *(void *)(a1 + 904) = v4;
  if (v4)
  {
    memcpy(*v4, *v1, v3);
    uint64_t result = 0LL;
    *(void *)(**(void **)(a1 + 904) + 8LL) = 0LL;
  }

  else if (sub_1882660D4())
  {
    return 12LL;
  }

  else
  {
    return 0LL;
  }

  return result;
}

__CFDictionary *sub_18826111C(uint64_t a1)
{
  uint64_t v1 = sub_188256940(a1);
  int v2 = DIGetBundleRef();
  CFTypeRef v3 = sub_1882660CC(v2, (int)@"[restricted segment]", @"[restricted segment]");
  uint64_t Value = CFDictionaryGetValue(v1, @"Format Description");
  CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%@ %@", Value, v3);
  CFDictionarySetValue(v1, @"Format Description", v5);
  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v1;
}

void *sub_1882611D4(uint64_t a1)
{
  uint64_t v1 = sub_188241454((int *)(**(void **)(a1 + 904) + 64LL));
  if (!v1)
  {
    uint64_t v1 = operator new(0x80uLL);
    sub_18825B5EC(v1, 0LL);
  }

  return v1;
}

void sub_18826121C(_Unwind_Exception *a1)
{
}

uint64_t sub_188261230(unsigned int *a1, char *a2)
{
  int v4 = DIGetBundleRef();
  CFStringRef v5 = (const __CFString *)sub_1882660CC( v4,  (int)@"Checksumming restricted segment %1$d\\U2026",  @"Checksumming restricted segment %1$d\\U2026");
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v5, a1[112]);
  (*(void (**)(unsigned int *, CFStringRef, uint64_t))(*(void *)a1 + 336LL))(a1, v6, 16LL);
  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v7 = sub_188241604((char *)a1, *((void **)a1 + 113), a2);
  (*(void (**)(unsigned int *, const __CFString *, uint64_t))(*(void *)a1 + 336LL))( a1,  &stru_18A20E810,  16LL);
  (*(void (**)(unsigned int *, float))(*(void *)a1 + 344LL))(a1, 100.0);
  return v7;
}

uint64_t sub_188261330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0LL;
  return 107LL;
}

uint64_t sub_18826133C()
{
  return 0LL;
}

const char *sub_188261348()
{
  return "CRestrictedUDIFDiskImage";
}

void sub_188261358(void *a1)
{
}

void sub_18826137C(_Unwind_Exception *a1)
{
}

const char *sub_188261390()
{
  return "CLZFSEDecompressor";
}

uint64_t sub_18826139C()
{
  return 2049LL;
}

void sub_1882613A8(char **a1)
{
}

void sub_1882613CC(_Unwind_Exception *a1)
{
}

uint64_t sub_1882613E0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 416LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_1882613FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 424LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_188261418(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 56LL))(result);
  }
  return result;
}

uint64_t sub_188261430(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 112LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_18826144C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 136LL))(result);
  }
  return result;
}

uint64_t sub_188261464(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 200);
  if (v3) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v3 + 144LL))(v3);
  }
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  return 999LL;
}

uint64_t sub_188261490(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 200LL))(result);
  }
  return result;
}

uint64_t sub_1882614A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 232LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_1882614C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 256LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_1882614E0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 288LL))(result);
  }
  return result;
}

uint64_t sub_1882614F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 296LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_188261514(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 312LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_188261530(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 328LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_18826154C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 336LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_188261568(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 200);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 352LL))(result);
  }
  return result;
}

uint64_t sub_188261580(void *a1)
{
  else {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 360LL))(v2);
  }
  (*(void (**)(void *))(*a1 + 600LL))(a1);
  return v3;
}

uint64_t sub_1882615E0(void *a1)
{
  if (((*(uint64_t (**)(void *))(*a1 + 592LL))(a1) & 1) == 0)
  {
    uint64_t v2 = a1[25];
    if (v2) {
      (*(void (**)(uint64_t, void))(*(void *)v2 + 368LL))(v2, 0LL);
    }
  }

  return 0LL;
}

uint64_t sub_188261638(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 376LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_188261654(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 384LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_188261670(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 392LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_18826168C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 400LL))(v1);
  }
  else {
    return 999LL;
  }
}

uint64_t sub_1882616A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 408LL))(v1);
  }
  else {
    return 999LL;
  }
}

const char *sub_1882616C4()
{
  return "CFileEncoding";
}

uint64_t sub_1882616D0()
{
  return 0LL;
}

void sub_1882616DC(char **a1)
{
}

void sub_188261700(_Unwind_Exception *a1)
{
}

uint64_t sub_188261714()
{
  return 78LL;
}

uint64_t sub_18826171C()
{
  return 78LL;
}

BOOL sub_188261724(uint64_t a1)
{
  return *(void *)(a1 + 216) != 0LL;
}

uint64_t sub_188261734()
{
  return 78LL;
}

uint64_t sub_18826173C(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 224);
  }
  return 0LL;
}

uint64_t sub_188261750(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(void *)(a1 + 224);
  }
  return 0LL;
}

uint64_t sub_188261764()
{
  return 78LL;
}

uint64_t sub_18826176C()
{
  return 0LL;
}

const char *sub_188261774()
{
  return "CFlatFileEncoding";
}

uint64_t sub_188261780(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t sub_188261788(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_188261794(uint64_t a1)
{
  unsigned int v1 = bswap32(*(_DWORD *)a1);
  *(_DWORD *)a1 = v1;
  int8x16_t v2 = vrev32q_s8(*(int8x16_t *)(a1 + 36));
  *(int8x16_t *)(a1 + 36) = v2;
  if (v2.i32[3] > 0x200u || v1 > 0x20) {
    return 107LL;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1882617CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 480) != 2) {
    return 0LL;
  }
  if (*(_DWORD *)(a1 + 540))
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    while ((sub_188261880(a1, a2, a3, (unsigned int *)(*(void *)(a1 + 528) + v6)) & 1) == 0)
    {
      ++v7;
      v6 += 616LL;
    }

    return 1LL;
  }

  else
  {
LABEL_6:
    v9[0] = a3;
    v9[1] = a2;
    return sub_188261A44(a1, v9);
  }

uint64_t sub_188261880(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  v26[2] = *MEMORY[0x1895F89C0];
  size_t v6 = ((unint64_t)a4[21] >> 3);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  BOOL v9 = (char *)v22 - v8;
  uint64_t v10 = MEMORY[0x1895F8858](v7);
  unint64_t v12 = (char *)v22 - ((v11 + 15) & 0x1FFFFFFF0LL);
  v26[0] = *(unsigned int *)(v13 + 48);
  v26[1] = v12;
  v25[0] = v6;
  v25[1] = v9;
  v24[0] = v15;
  v24[1] = v14;
  uint64_t v16 = sub_1882620B4(v10, v24, (uint64_t)a4, (uint64_t)v25, (uint64_t)v26);
  if ((v16 & 1) == 0) {
    return 0LL;
  }
  MEMORY[0x1895F8858](v16);
  CFNumberRef v18 = (char *)v22 - ((dataOutAvailable + 15) & 0x1FFFFFFF0LL);
  size_t v23 = 0LL;
  unsigned int v19 = a4[22];
  if (v19 == -2147483647)
  {
    CCAlgorithm v20 = 0;
  }

  else
  {
    if (v19 != 17) {
      sub_18824E974(45, (uint64_t)"Unsupported key encryption algorithm.");
    }
    CCAlgorithm v20 = 2;
  }

  if (CCCrypt( 1u,  v20,  1u,  v9,  v6,  v12,  a4 + 26,  dataOutAvailable,  (char *)v22 - ((dataOutAvailable + 15) & 0x1FFFFFFF0LL),  dataOutAvailable,  &v23))
  {
    return 0LL;
  }

  v22[0] = v23;
  v22[1] = v18;
  return sub_18824F724(a1, v22);
}

uint64_t sub_188261A44(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1895F89C0];
  int8x16_t v2 = (unsigned int *)(a1 + 570);
  unint64_t v3 = *(unsigned int *)(a1 + 570);
  CFStringRef v5 = (const char *)a2[1];
  CFIndex v6 = v3 >> 3;
  uint64_t v7 = MEMORY[0x1895F8858](a1);
  BOOL v9 = (const UInt8 *)v19 - v8;
  CFIndex v10 = (unint64_t)v2[2] >> 3;
  MEMORY[0x1895F8858](v7);
  uint64_t v13 = (const UInt8 *)v19 - v12;
  if (*v2 < 8)
  {
LABEL_7:
    if (v11 < 8)
    {
LABEL_11:
      CFNumberRef v17 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      *(void *)(a1 + 2016) = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v9, v6);
      *(void *)(a1 + 2024) = CFDataCreate(v17, v13, v10);
      return 1LL;
    }

    else
    {
      unint64_t v16 = 0LL;
      while (sscanf(&v5[((unint64_t)*v2 >> 2) & 0x3FFFFFFE], "%02hhx", &v13[v16]) == 1)
      {
        ++v16;
        v5 += 2;
      }

      return 0LL;
    }
  }

  else
  {
    v19[0] = v19;
    unint64_t v14 = 0LL;
    uint64_t v15 = v5;
    while (sscanf(v15, "%02hhx", &v9[v14]) == 1)
    {
      ++v14;
      v15 += 2;
      if (v14 >= (unint64_t)*v2 >> 3)
      {
        unsigned int v11 = v2[2];
        goto LABEL_7;
      }
    }

    return 0LL;
  }

uint64_t sub_188261C3C(uint64_t a1, const __CFString *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return 22LL;
  }
  bzero(buffer, 0x400uLL);
  CFTypeID v4 = CFGetTypeID(a2);
  if (v4 != CFStringGetTypeID() || !CFStringGetCString(a2, buffer, 1023LL, 0x8000100u)) {
    return 22LL;
  }
  size_t v5 = strlen(buffer);
  else {
    return 80LL;
  }
}

uint64_t sub_188261D08(_DWORD *a1, const __CFDictionary *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  unsigned int v22 = 0;
  bzero(cStr, 0x400uLL);
  if (!a2) {
    goto LABEL_14;
  }
  uint64_t Value = CFDictionaryGetValue(a2, @"new-passphrase");
  if (!Value)
  {
    CFTypeRef v7 = 0LL;
    goto LABEL_10;
  }

  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(Value))
  {
    CFTypeID v8 = CFArrayGetTypeID();
    if (v8 == CFGetTypeID(Value) && a1[120] != 1)
    {
      CFTypeRef v7 = CFRetain(Value);
      goto LABEL_10;
    }

    CCAlgorithm v20 = "key specified, but wrong type.";
    int v21 = 22;
LABEL_26:
    sub_18824E974(v21, (uint64_t)v20);
  }

  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (!Mutable)
  {
    CCAlgorithm v20 = "cannot create passphrase array.\n";
    int v21 = -4960;
    goto LABEL_26;
  }

  CFTypeRef v7 = Mutable;
  CFArrayAppendValue(Mutable, Value);
LABEL_10:
  BOOL v9 = (const __CFString *)CFDictionaryGetValue(a2, @"new-passphrase-index");
  if (v9)
  {
    CFTypeID v10 = CFNumberGetTypeID();
    if (v10 == CFGetTypeID(v9)) {
      sub_18824D608(v9, kCFNumberSInt32Type, &v22);
    }
  }

  if (!v7)
  {
LABEL_14:
    int v11 = DIGetBundleRef();
    CFTypeRef v12 = sub_1882660CC( v11,  (int)@"Enter a new password to secure %1$@. If you forget this password you will not be able to access the files stored on this image. Forgotten passwords cannot be retrieved.",  @"Enter a new password to secure %1$@. If you forget this password you will not be able to access the files stored on this image. Forgotten passwords cannot be retrieved.");
    (*(void (**)(_DWORD *, CFTypeRef, char *))(*(void *)a1 + 712LL))(a1, v12, cStr);
    uint64_t v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFStringRef v14 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x8000100u);
    bzero(cStr, 0x400uLL);
    if (v14)
    {
      uint64_t v15 = CFArrayCreateMutable(v13, 0LL, MEMORY[0x189605228]);
      CFTypeRef v7 = v15;
      if (v15)
      {
        CFArrayAppendValue(v15, v14);
        CFRelease(v14);
        if (v12) {
          CFRelease(v12);
        }
        goto LABEL_18;
      }

      CFNumberRef v18 = "cannot create passphrase array.\n";
      int v19 = -4960;
    }

    else
    {
      CFNumberRef v18 = "passphrase is not valid UTF-8 string.";
      int v19 = 999;
    }

    sub_18824E974(v19, (uint64_t)v18);
  }

LABEL_18:
  int v16 = (*(uint64_t (**)(_DWORD *, CFTypeRef, void))(*(void *)a1 + 720LL))(a1, v7, v22);
  if (v16) {
    sub_18824E974(v16, (uint64_t)"unable to change keys.");
  }
  CFRelease(v7);
  return 0LL;
}

void sub_188261FC4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (v2) {
      CFRelease(v2);
    }
    size_t v5 = __cxa_begin_catch(exception_object);
    if (a2 == 2) {
      (*(uint64_t (**)(void *))(*(void *)v5 + 24LL))(v5);
    }
    __cxa_end_catch();
    JUMPOUT(0x188261F2CLL);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_1882620AC()
{
  return 78LL;
}

uint64_t sub_1882620B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5 = *(_DWORD *)(a3 + 84);
  int v6 = *(_DWORD *)(a3 + 48);
  if (*a2 != 2 * (v6 + (v5 >> 3))) {
    return 0LL;
  }
  uint64_t v8 = a2[1];
  uint64_t v9 = *(void *)(a5 + 8);
  if (v5 >= 8)
  {
    unint64_t v10 = 0LL;
    uint64_t v11 = *(void *)(a4 + 8);
    CFTypeRef v12 = (const char *)a2[1];
    while (sscanf(v12, "%02hhx", v11 + v10) == 1)
    {
      ++v10;
      v12 += 2;
      if (v10 >= (unint64_t)*(unsigned int *)(a3 + 84) >> 3)
      {
        int v6 = *(_DWORD *)(a3 + 48);
        goto LABEL_7;
      }
    }

    return 0LL;
  }

LABEL_7:
  if (!v6) {
    return 1LL;
  }
  int v13 = 0;
  unint64_t v14 = 0LL;
  do
  {
    BOOL v15 = sscanf( (const char *)(v8 + (v13 & 0xFFFFFFFE) + (((unint64_t)*(unsigned int *)(a3 + 84) >> 2) & 0x3FFFFFFE)),  "%02hhx",  v9 + v14) == 1;
    uint64_t result = v15;
    if (!v15) {
      break;
    }
    ++v14;
    v13 += 2;
  }

  while (v14 < *(unsigned int *)(a3 + 48));
  return result;
}

uint64_t sub_1882621D0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 320LL))(a1, a2, 1LL);
}

uint64_t sub_1882621E0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
  unint64_t v7 = *(void *)(a1 + 488);
  uint64_t v8 = *(void *)(a1 + 496);
  unint64_t v9 = a2 % v7;
  unint64_t v10 = v7 - a2 % v7;
  if (!v9) {
    unint64_t v10 = 0LL;
  }
  unint64_t v11 = v10 + a2;
  if (*(_DWORD *)(a1 + 480) == 1) {
    unint64_t v12 = v11 + 1276;
  }
  else {
    unint64_t v12 = *(void *)(a1 + 504) + v11;
  }
  if (a2 == v8) {
    return 0LL;
  }
  if (!v6) {
    return 999LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v6 + 312LL))(v6, v12);
  if (!(_DWORD)result)
  {
    *(void *)(a1 + 512) = v12;
    *(void *)(a1 + 496) = a2;
    uint64_t result = sub_18824F010(a1);
    if (!(_DWORD)result && a2 > v8 && a3)
    {
      unint64_t v14 = calloc(1uLL, 32LL * *(void *)(a1 + 488));
      if (v14)
      {
        BOOL v15 = v14;
        uint64_t v16 = a2 - v8;
        if (v16)
        {
          do
          {
            if (32LL * *(void *)(a1 + 488) >= v16) {
              uint64_t v17 = v16;
            }
            else {
              uint64_t v17 = 32LL * *(void *)(a1 + 488);
            }
            int v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, void *))(*(void *)a1 + 336LL))( a1,  v8,  v17,  &v21,  v15);
            v16 -= v21;
            v8 += v21;
            if (v18) {
              BOOL v19 = 1;
            }
            else {
              BOOL v19 = v21 == 0;
            }
          }

          while (!v19 && v16 != 0);
        }

        free(v15);
        return 0LL;
      }

      return 12LL;
    }
  }

  return result;
}

int8x8_t sub_188262328(uint64_t a1)
{
  int8x16_t v1 = vrev32q_s8(*(int8x16_t *)(a1 + 32));
  *(int8x16_t *)(a1 + 16) = vrev32q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)(a1 + 32) = v1;
  *(int8x8_t *)(a1 + 48) = vrev32_s8(*(int8x8_t *)(a1 + 48));
  *(int8x16_t *)(a1 + 88) = vrev32q_s8(*(int8x16_t *)(a1 + 88));
  *(_DWORD *)(a1 + 136) = bswap32(*(_DWORD *)(a1 + 136));
  *(int8x8_t *)(a1 + 396) = vrev32_s8(*(int8x8_t *)(a1 + 396));
  *(_DWORD *)(a1 + 436) = bswap32(*(_DWORD *)(a1 + 436));
  *(int8x8_t *)(a1 + 696) = vrev32_s8(*(int8x8_t *)(a1 + 696));
  *(_DWORD *)(a1 + 736) = bswap32(*(_DWORD *)(a1 + 736));
  *(_DWORD *)(a1 + 996) = bswap32(*(_DWORD *)(a1 + 996));
  *(void *)(a1 + 1256) = bswap64(*(void *)(a1 + 1256));
  int8x8_t result = vrev32_s8(*(int8x8_t *)(a1 + 1264));
  *(int8x8_t *)(a1 + 1264) = result;
  *(_DWORD *)(a1 + 1272) = bswap32(*(_DWORD *)(a1 + 1272));
  return result;
}

CFDictionaryRef sub_1882623C4(uint64_t a1)
{
  CFMutableArrayRef Mutable = (const __CFDictionary *)sub_188243C00(a1);
  int8x16_t v2 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (Mutable
    || (CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250])) != 0LL)
  {
    uint64_t Value = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"owner-mode");
    if (Value && CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr)) {
      __int16 v4 = valuePtr & 0x1C0;
    }
    else {
      __int16 v4 = 448;
    }
    __int16 valuePtr = v4;
    CFNumberRef v5 = CFNumberCreate(*v2, kCFNumberSInt16Type, &valuePtr);
    CFDictionarySetValue(Mutable, @"owner-mode", v5);
    CFRelease(v5);
  }

  return Mutable;
}

void sub_188262488(std::exception *a1)
{
}

uint64_t sub_1882624A0()
{
  return 78LL;
}

uint64_t sub_1882624A8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 778))
  {
    uint64_t result = sub_188261580((void *)a1);
    if ((_DWORD)result) {
      return result;
    }
    goto LABEL_4;
  }

  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 360LL))(v3);
  if (!(_DWORD)result)
  {
LABEL_4:
    (*(void (**)(uint64_t))(*(void *)a1 + 600LL))(a1);
    return 0LL;
  }

  return result;
}

uint64_t sub_188262520(unsigned __int8 *a1, uint64_t a2)
{
  int v5 = a1[778];
  uint64_t v6 = (*(uint64_t (**)(unsigned __int8 *))(*(void *)a1 + 496LL))(a1);
  if (v5)
  {
    if (!v6) {
      return 999LL;
    }
    return v7();
  }

  if (!v6
    || (uint64_t v8 = (*(uint64_t (**)(unsigned __int8 *))(*(void *)a1 + 496LL))(a1),
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 368LL))(v8, a2),
        !(_DWORD)result))
  {
    return v7();
  }

  return result;
}

uint64_t sub_188262604(_BYTE *a1, void *a2)
{
  if (a1[778]) {
    return sub_18826173C((uint64_t)a1, a2);
  }
  uint64_t v4 = (*(uint64_t (**)(_BYTE *))(*(void *)a1 + 496LL))(a1);
  return (*(uint64_t (**)(uint64_t, void *))(*(void *)v4 + 376LL))(v4, a2);
}

uint64_t sub_188262650(_BYTE *a1, void *a2)
{
  if (a1[778]) {
    return sub_188261750((uint64_t)a1, a2);
  }
  uint64_t v4 = (*(uint64_t (**)(_BYTE *))(*(void *)a1 + 496LL))(a1);
  return (*(uint64_t (**)(uint64_t, void *))(*(void *)v4 + 384LL))(v4, a2);
}

uint64_t sub_18826269C(_BYTE *a1, uint64_t a2)
{
  if (a1[778]) {
    return 78LL;
  }
  uint64_t v4 = (*(uint64_t (**)(_BYTE *))(*(void *)a1 + 496LL))(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 392LL))(v4, a2);
}

uint64_t sub_1882626E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(_BYTE *)(a1 + 778))
  {
    unint64_t v11 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1) + 400LL);
    return v11();
  }

  if (!a5) {
    return 22LL;
  }
  unint64_t v9 = *(void *)(a1 + 768);
  uint64_t result = 29LL;
  if ((uint64_t)v9 >= a2 && a3 + a2 <= v9)
  {
    unint64_t v11 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1) + 328LL);
    return v11();
  }

  return result;
}

uint64_t sub_1882627C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(_BYTE *)(a1 + 778))
  {
    unint64_t v11 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1) + 408LL);
    return v11();
  }

  if (!a5) {
    return 22LL;
  }
  unint64_t v9 = *(void *)(a1 + 768);
  uint64_t result = 29LL;
  if ((uint64_t)v9 >= a2 && a3 + a2 <= v9)
  {
    unint64_t v11 = *(uint64_t (**)(void))(*(void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1) + 336LL);
    return v11();
  }

  return result;
}

BOOL sub_1882628A8(uint64_t a1)
{
  return *(_DWORD *)(a1 + 292) > 1u;
}

__n128 sub_1882628B8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 584);
  __int128 v2 = *(_OWORD *)(a1 + 600);
  __int128 v3 = *(_OWORD *)(a1 + 616);
  __int128 v4 = *(_OWORD *)(a1 + 648);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 632);
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 32) = v3;
  __n128 result = *(__n128 *)(a1 + 664);
  __int128 v6 = *(_OWORD *)(a1 + 680);
  __int128 v7 = *(_OWORD *)(a1 + 696);
  *(void *)(a2 + 128) = *(void *)(a1 + 712);
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(__n128 *)(a2 + 80) = result;
  return result;
}

__n128 sub_1882628F0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 312);
  __int128 v2 = *(_OWORD *)(a1 + 328);
  __int128 v3 = *(_OWORD *)(a1 + 344);
  __int128 v4 = *(_OWORD *)(a1 + 376);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 360);
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 32) = v3;
  __n128 result = *(__n128 *)(a1 + 392);
  __int128 v6 = *(_OWORD *)(a1 + 408);
  __int128 v7 = *(_OWORD *)(a1 + 424);
  *(void *)(a2 + 128) = *(void *)(a1 + 440);
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(__n128 *)(a2 + 80) = result;
  return result;
}

uint64_t sub_188262928(uint64_t a1)
{
  return *(unsigned int *)(a1 + 720);
}

uint64_t sub_188262930(uint64_t a1)
{
  return *(void *)(a1 + 724);
}

uint64_t sub_18826293C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, float, float))(*(void *)a1 + 792LL))(a1, 0.0, 100.0);
}

uint64_t sub_188262954(void *a1, void *a2, void *a3, float a4, float a5)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  float v37 = a4;
  if (a2) {
    *a2 = 0LL;
  }
  if (a3) {
    *a3 = 0LL;
  }
  int v8 = DIGetBundleRef();
  unint64_t v9 = (const __CFString *)sub_1882660CC( v8,  (int)@"Validating %1$@\\U2026",  @"Validating %1$@\\U2026");
  unint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v11 = (*(uint64_t (**)(void *))(*a1 + 192LL))(a1);
  CFStringRef v12 = CFStringCreateWithFormat(v10, 0LL, v9, v11);
  sub_18825B360((uint64_t)a1, 0LL, (uint64_t)a1, (uint64_t)v12, 16LL, 0LL, 0LL);
  if (v12) {
    CFRelease(v12);
  }
  if (v9) {
    CFRelease(v9);
  }
  (*(void (**)(void *, int *))(*a1 + 744LL))(a1, v38);
  int v13 = (char *)sub_1882403AC(v38[0]);
  if (v13)
  {
    unint64_t v14 = v13;
    BOOL v15 = (char *)sub_188241454(v38);
    sub_18825B360((uint64_t)a1, 3LL, (uint64_t)a1, 2LL, 0LL, 0LL, 0LL);
    (*(void (**)(char *))(*(void *)v14 + 48LL))(v14);
    sub_18825B360((uint64_t)a1, 1LL, (uint64_t)a1, (uint64_t)&v37, 0LL, 0LL, 0LL);
    uint64_t v16 = (*(uint64_t (**)(void *))(*a1 + 272LL))(a1);
    if ((_DWORD)v16)
    {
      uint64_t v17 = v16;
    }

    else
    {
      unsigned int v22 = malloc(0x100000uLL);
      if (v22)
      {
        size_t v23 = v22;
        uint64_t v24 = 0LL;
        uint64_t v25 = 0LL;
        float v26 = a5 - a4;
        uint64_t v27 = a1[33];
        float v28 = a4;
        uint64_t v29 = v27;
        while (1)
        {
          if (!v29)
          {
            unsigned int v32 = 0;
            goto LABEL_31;
          }

          uint64_t v30 = v29 >= 0x100000 ? 0x100000LL : v29;
          unsigned int v31 = (*(uint64_t (**)(void *, uint64_t, uint64_t, _BYTE *, void *))(*a1 + 328LL))( a1,  v24,  v30,  v36,  v23);
          if (v31) {
            break;
          }
          (*(void (**)(char *, void *, uint64_t))(*(void *)v14 + 56LL))(v14, v23, v30);
          v25 += v30;
          float v37 = a4 + (float)((float)(v25 / v27) * v26);
          if ((float)(v37 - v28) >= 1.0)
          {
            sub_18825B360((uint64_t)a1, 1LL, (uint64_t)a1, (uint64_t)&v37, 0LL, 0LL, 0LL);
            float v28 = v37;
          }

          v24 += v30;
          v29 -= v30;
          if (sub_18825B360((uint64_t)a1, 2LL, (uint64_t)a1, 0LL, 0LL, 0LL, 0LL))
          {
            unsigned int v32 = 111;
            goto LABEL_31;
          }
        }

        unsigned int v32 = v31;
LABEL_31:
        free(v23);
        (*(void (**)(char *))(*(void *)v14 + 72LL))(v14);
        CFStringRef v33 = sub_18824305C((uint64_t)a1, (uint64_t)v15, (uint64_t)v14);
        if (v33)
        {
          CFStringRef v34 = v33;
          sub_18825B360((uint64_t)a1, 0LL, (uint64_t)a1, (uint64_t)v33, 16LL, 0LL, 0LL);
          CFRelease(v34);
        }

        else {
          uint64_t v17 = 116LL;
        }
      }

      else
      {
        uint64_t v17 = 12LL;
      }

      (*(void (**)(void *, void))(*a1 + 280LL))(a1, 0LL);
    }

    DIDiskImageObjectRelease(v14);
    if (v15) {
      DIDiskImageObjectRelease(v15);
    }
  }

  else
  {
    int v18 = DIGetBundleRef();
    BOOL v19 = (const __CFString *)sub_1882660CC( v18,  (int)@"Unknown checksum type %1$ld.",  @"Unknown checksum type %1$ld.");
    uint64_t v20 = (*(uint64_t (**)(void *))(*a1 + 192LL))(a1);
    CFStringRef v21 = CFStringCreateWithFormat(v10, 0LL, v19, v20);
    sub_18825B360((uint64_t)a1, 0LL, (uint64_t)a1, (uint64_t)v21, 16LL, 0LL, 0LL);
    if (v21) {
      CFRelease(v21);
    }
    if (v19) {
      CFRelease(v19);
    }
    return 0LL;
  }

  return v17;
}

uint64_t sub_188262D48(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 320LL))(a1, a2, 1LL);
}

uint64_t sub_188262D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v13 = 0LL;
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 592LL))(a1) & 1) != 0
    || ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 616LL))(a1) & 1) != 0)
  {
    return 16LL;
  }

  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 48LL))(a2);
  if (!(_DWORD)v6)
  {
    if (DIUDIFFileAccessGetResourceFile_0(a3, &v13))
    {
      uint64_t v6 = 999LL;
    }

    else
    {
      uint64_t v6 = (*(uint64_t (**)(char *, void, void))(*(void *)v13 + 288LL))(v13, 0LL, 0LL);
      if (!(_DWORD)v6)
      {
        uint64_t v6 = (*(uint64_t (**)(char *, uint64_t, void, void))(*(void *)v13 + 304LL))(v13, a2, 0LL, 0LL);
        if (!(_DWORD)v6)
        {
          uint64_t v6 = (*(uint64_t (**)(char *))(*(void *)v13 + 200LL))(v13);
          if (!(_DWORD)v6)
          {
            uint64_t v6 = DIUDIFFileAccessWriteResourceFile_0(a3);
            if (!(_DWORD)v6)
            {
              int v8 = (const void *)sub_1882465B8(a3);
              memcpy((void *)(a1 + 232), v8, 0x200uLL);
              int v9 = *(_DWORD *)(a1 + 244);
              *(_BYTE *)(a1 + 778) = v9 & 1;
              if ((v9 & 1) != 0)
              {
                uint64_t v11 = *(void *)(a1 + 272);
                uint64_t v10 = *(void *)(a1 + 280);
                *(void *)(a1 + 768) = v10;
                *(void *)(a1 + 760) = v11;
                sub_18823CFCC(a1, v10);
                uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 496LL))(a1);
                (*(void (**)(uint64_t, void))(*(void *)v12 + 392LL))(v12, 0LL);
              }

              uint64_t v6 = 0LL;
            }
          }
        }
      }
    }

    (*(void (**)(uint64_t))(*(void *)a2 + 56LL))(a2);
  }

  return v6;
}

uint64_t sub_188262ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(*(void *)a1 + 96LL))(a1, a2, &v11);
  if ((_DWORD)v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v11 == 0;
  }
  if (!v5)
  {
    if (v11 < 1)
    {
      return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
    }

    else
    {
      LOWORD(v6) = 1;
      while (1)
      {
        uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
        (*(void (**)(uint64_t, void))(*(void *)a1 + 80LL))(a1, 0LL);
        uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, void, void **))(*(void *)a1 + 112LL))( a1,  a2,  (__int16)v6,  &v10);
        (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80LL))(a1, v7);
        if ((_DWORD)v4) {
          break;
        }
        uint64_t v8 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 192LL))(a1, v10);
        if ((_DWORD)v8) {
          return v8;
        }
        sub_188266150((void **)v10);
        int v6 = (__int16)(v6 + 1);
        if (v6 > v11) {
          return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
        }
      }
    }
  }

  return v4;
}

uint64_t sub_188262FE8(uint64_t a1, unsigned int (*a2)(uint64_t, void, void), uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v13 = 0LL;
  uint64_t v6 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)a1 + 64LL))(a1, &v16);
  if (!(_DWORD)v6)
  {
    if (v16 < 1) {
      return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
    }
    LOWORD(v7) = 1;
    while (1)
    {
      uint64_t v8 = (*(uint64_t (**)(uint64_t, unsigned int *, void))(*(void *)a1 + 72LL))( a1,  &v14,  (__int16)v7);
      if ((_DWORD)v8) {
        return v8;
      }
      uint64_t v8 = (*(uint64_t (**)(uint64_t, void, __int16 *))(*(void *)a1 + 96LL))(a1, v14, &v15);
      if ((_DWORD)v8) {
        return v8;
      }
      if (v15 >= 1)
      {
        LOWORD(v9) = 1;
        do
        {
          uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
          (*(void (**)(uint64_t, void))(*(void *)a1 + 80LL))(a1, 0LL);
          uint64_t v6 = (*(uint64_t (**)(uint64_t, void, void, void **))(*(void *)a1 + 112LL))( a1,  v14,  (__int16)v9,  &v13);
          (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 80LL))(a1, v10);
          if ((_DWORD)v6) {
            return v6;
          }
          uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, __int16 *, unsigned int *, _BYTE *))(*(void *)a1 + 208LL))( a1,  v13,  &v12,  &v14,  v17);
          if ((_DWORD)v8) {
            return v8;
          }
          if (!a2 || a2(a3, v14, v12))
          {
            uint64_t v8 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 192LL))(a1, v13);
            if ((_DWORD)v8) {
              return v8;
            }
            sub_188266150((void **)v13);
            int v13 = 0LL;
          }

          int v9 = (__int16)(v9 + 1);
        }

        while (v9 <= v15);
      }

      int v7 = (__int16)(v7 + 1);
      if (v7 > v16) {
        return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
      }
    }
  }

  return v6;
}

const char *sub_1882631CC()
{
  return "CResourceFile";
}

uint64_t sub_1882631DC(uint64_t a1, _BYTE *a2, uint64_t a3, int a4)
{
  unsigned int v14 = 0LL;
  if (!a2) {
    return 4294967246LL;
  }
  *a2 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void **))(*(void *)a1 + 120LL))( a1,  1398034979LL,  a3,  &v14);
  if (!(_DWORD)result)
  {
    if (!v14) {
      return 4294967104LL;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t *))(*(void *)a1 + 160LL))(a1, v14, &v13);
    if (!(_DWORD)result)
    {
      if (a4 >= 1 && *(__int16 *)*v14 >= a4)
      {
        uint64_t v8 = (unsigned __int8 *)(*v14 + 2LL);
        if (a4 < 2)
        {
          uint64_t v9 = 0LL;
        }

        else
        {
          uint64_t v9 = 0LL;
          LOWORD(v10) = 1;
          do
          {
            uint64_t v11 = *v8 + 1LL;
            v8 += v11;
            v9 += v11;
            int v10 = (__int16)(v10 + 1);
          }

          while (v10 < a4);
        }

        uint64_t v12 = *v8;
        if (v9 + v12 >= v13) {
          return 4294967106LL;
        }
        memmove(a2, v8, v12 + 1);
      }

      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1882632EC(uint64_t a1, unsigned int a2, const unsigned __int8 *a3, void *a4)
{
  int v10 = 0LL;
  if (a3 && a4)
  {
    uint64_t v6 = *(void **)(a1 + 104);
    if (v6)
    {
      uint64_t v8 = sub_188263380(a1, a2, a3);
      if (v8)
      {
        uint64_t result = sub_18823EFD0(a1, a2, v8, &v10);
        uint64_t v6 = v10;
      }

      else
      {
        uint64_t v6 = 0LL;
        uint64_t result = 4294967104LL;
      }
    }

    else
    {
      uint64_t result = 4294967097LL;
    }

    goto LABEL_6;
  }

  uint64_t result = 4294967246LL;
  if (a4)
  {
    uint64_t v6 = 0LL;
LABEL_6:
    *a4 = v6;
  }

  return result;
}

CFDictionaryRef sub_188263380(uint64_t a1, unsigned int a2, const unsigned __int8 *a3)
{
  if (!*(void *)(a1 + 104)) {
    return 0LL;
  }
  uint64_t v4 = (const __CFArray *)sub_18823EE00(a1, a2);
  if (!v4) {
    return 0LL;
  }
  BOOL v5 = v4;
  CFIndex Count = CFArrayGetCount(v4);
  CFStringRef v7 = CFStringCreateWithPascalString((CFAllocatorRef)*MEMORY[0x189604DB0], a3, 0);
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = v7;
  if (Count < 1)
  {
LABEL_11:
    uint64_t v11 = 0LL;
  }

  else
  {
    CFIndex v9 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v9);
      if (ValueAtIndex)
      {
        uint64_t v11 = ValueAtIndex;
        uint64_t Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"Name");
        if (Value)
        {
          uint64_t v13 = Value;
          CFTypeID v14 = CFGetTypeID(Value);
          if (v14 == CFStringGetTypeID() && CFStringCompare(v13, v8, 0LL) == kCFCompareEqualTo) {
            break;
          }
        }
      }

      if (Count == ++v9) {
        goto LABEL_11;
      }
    }
  }

  CFRelease(v8);
  return v11;
}

uint64_t sub_188263474(uint64_t a1, uint64_t a2)
{
  return sub_1882660D4();
}

uint64_t sub_188263490(uint64_t a1, uint64_t a2)
{
  return sub_1882660D4();
}

uint64_t sub_1882634AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t result = 4294967246LL;
  if (a2)
  {
    if (a3)
    {
      *a3 = sub_1882661C8(a2);
      return sub_1882660D4();
    }
  }

  return result;
}

uint64_t sub_1882634E4(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 4294967246LL;
  }
  __int128 v3 = *(const __CFDictionary **)(a1 + 104);
  if (!v3) {
    return 4294967246LL;
  }
  if (!*(_BYTE *)(a1 + 114)) {
    return 4294967242LL;
  }
  size_t Count = CFDictionaryGetCount(v3);
  if (!Count) {
    return 0LL;
  }
  int64_t v6 = Count;
  CFStringRef v7 = (const void **)calloc(Count, 8uLL);
  if (!v7) {
    return 4294967188LL;
  }
  uint64_t v8 = v7;
  CFIndex v9 = (const void **)calloc(v6, 8uLL);
  if (v9)
  {
    int v10 = v9;
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v8, v9);
    if (v6 < 1)
    {
      uint64_t v17 = 0LL;
    }

    else
    {
      uint64_t v11 = 0LL;
      while (1)
      {
        sub_18823F52C((const __CFString *)v8[v11]);
        uint64_t v12 = (const __CFArray *)v10[v11];
        CFIndex v13 = CFArrayGetCount(v12);
        if (v13 >= 1) {
          break;
        }
LABEL_14:
        if (++v11 >= v6)
        {
          uint64_t v17 = 4294967104LL;
          goto LABEL_30;
        }
      }

      CFIndex v14 = v13;
      CFIndex v15 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v12, v15);
        if (sub_18823F1CC((int)ValueAtIndex, ValueAtIndex, &v20))
        {
          if (v20 == a2) {
            break;
          }
        }

        if (v14 == ++v15) {
          goto LABEL_14;
        }
      }

      __int16 v19 = 0;
      if (sub_18823E874(ValueAtIndex, @"Attributes", &v19))
      {
        if ((v19 & 8) != 0)
        {
          uint64_t v17 = 4294967100LL;
        }

        else
        {
          CFArrayRemoveValueAtIndex(v12, v15);
          if (v14 == 1) {
            CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 104), v8[v11]);
          }
          uint64_t v17 = 0LL;
          *(_WORD *)(a1 + 112) |= 0x20u;
        }
      }

      else
      {
        uint64_t v17 = 4294967097LL;
      }
    }

uint64_t sub_1882636A4(uint64_t a1, unsigned int a2)
{
  if (!*(void *)(a1 + 104)) {
    return 4294967246LL;
  }
  if (!*(_BYTE *)(a1 + 114)) {
    return 4294967242LL;
  }
  uint64_t result = (uint64_t)sub_18823EE58(a2);
  if (result)
  {
    uint64_t v4 = (const void *)result;
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 104), (const void *)result);
    *(_WORD *)(a1 + 112) |= 0x20u;
    CFRelease(v4);
    return 0LL;
  }

  return result;
}

uint64_t sub_188263714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *))(*(void *)a1 + 320LL))( a1,  a2,  a3,  a4,  a5,  v6);
}

uint64_t sub_18826373C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 328LL))( a1,  a2,  a3,  a4,  0LL);
}

uint64_t sub_18826374C(uint64_t a1, _WORD *a2)
{
  if (a2) {
    *a2 = *(_WORD *)(a1 + 112);
  }
  return 0LL;
}

uint64_t sub_188263760(uint64_t a1, __int16 a2)
{
  *(_WORD *)(a1 + 112) = a2;
  return 0LL;
}

CFArrayRef sub_18826376C(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if (!a3) {
    return (const __CFArray *)4294967246LL;
  }
  *a3 = 0;
  if (!*(void *)(a1 + 104)) {
    return 0LL;
  }
  uint64_t result = (const __CFArray *)sub_18823EE00(a1, a2);
  if (result)
  {
    BOOL v5 = result;
    CFIndex Count = CFArrayGetCount(result);
    while (1)
    {
      __int16 v7 = random();
      if (Count < 1) {
        break;
      }
      CFIndex v8 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
        if (ValueAtIndex)
        {
          __int16 v10 = 0;
          if (sub_18823E874(ValueAtIndex, @"ID", &v10))
          {
            if (v10 == v7) {
              break;
            }
          }
        }

        if (Count == ++v8) {
          goto LABEL_11;
        }
      }
    }

uint64_t sub_188263834()
{
  return 4294967246LL;
}

const char *sub_18826383C()
{
  return "CXMLResourceFile";
}

void sub_188263848(FILE *a1, const __CFString *a2, CFStringEncoding a3)
{
  if (a2)
  {
    CFIndex Length = CFStringGetLength(a2);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, a3);
    CFIndex v8 = (UInt8 *)malloc(MaximumSizeForEncoding);
    if (v8)
    {
      CFIndex v9 = v8;
      v12.CFIndex length = CFStringGetLength(a2);
      v12.location = 0LL;
      CFStringGetBytes(a2, v12, a3, 0, 0, v9, MaximumSizeForEncoding, &usedBufLen);
      int v10 = fileno(a1);
      write(v10, v9, usedBufLen);
      fflush(a1);
      free(v9);
    }
  }

void sub_188263904(const void *a1, const void *a2, void *cf)
{
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID()) {
    CFDictionaryReplaceValue((CFMutableDictionaryRef)cf, a1, a2);
  }
}

uint64_t sub_188263964(char *a1, ...)
{
  return vfprintf((FILE *)*MEMORY[0x1895F89D0], a1, va);
}

size_t sub_1882639A0(uint64_t a1)
{
  __int128 v2 = (FILE **)MEMORY[0x1895F89D0];
  size_t result = fwrite( "## ? ...score.. ...age... ...use... ...start ... ...length...\n",  0x3EuLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
  int v4 = *(_DWORD *)(a1 + 208);
  if (v4 >= 1)
  {
    for (uint64_t i = 0LL; i < v4; ++i)
    {
      uint64_t v6 = *(void *)(a1 + 216);
      uint64_t v7 = *(void *)(v6 + 8 * i);
      if (v7)
      {
        CFIndex v8 = *v2;
        if (*(_BYTE *)(v7 + 24)) {
          CFIndex v9 = "+";
        }
        else {
          CFIndex v9 = " ";
        }
        uint64_t v10 = sub_188244998(*(void *)(v6 + 8 * i));
        size_t result = fprintf( v8,  "%2d %1.1s %+9qd %9qd %9qd %12qd %12qd\n",  i,  v9,  v10,  *(void *)(v7 + 16),  *(void *)(v7 + 8),  *(void *)(v7 + 32),  *(void *)(v7 + 40));
        int v4 = *(_DWORD *)(a1 + 208);
      }
    }
  }

  return result;
}

void *sub_188263A84(void *a1)
{
  *a1 = &off_18A20D720;
  __int128 v2 = (void *)a1[7];
  if (v2) {
    free(v2);
  }
  return a1;
}

CFStringRef DICopyStrError(int *a1)
{
  return sub_1882515C0(a1, 0);
}

uint64_t sub_188263AC4(uint64_t result, unsigned int a2)
{
  *(int8x8_t *)size_t result = vrev32_s8(*(int8x8_t *)result);
  *(_DWORD *)(result + 8) = bswap32(*(_DWORD *)(result + 8));
  *(void *)(result + 12) = bswap64(*(void *)(result + 12));
  if (a2)
  {
    uint64_t v2 = a2;
    __int128 v3 = (unsigned int *)(result + 56);
    do
    {
      *__int128 v3 = bswap32(*v3);
      ++v3;
      --v2;
    }

    while (v2);
  }

  return result;
}

const char *sub_188263B10()
{
  return "CDIApplePartitionScheme";
}

const char *sub_188263B20()
{
  return "CDIFDiskPartitionScheme";
}

uint64_t sub_188263B30()
{
  return 1LL;
}

const char *sub_188263B38()
{
  return "CDINoPartitionScheme";
}

void sub_188263B4C(const __CFArray *a1, CFArrayRef theArray, unint64_t a3, char a4)
{
  MutableCFDictionaryRef Copy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theArray);
  sub_188263D94(a1, 1);
  sub_188263D94(MutableCopy, 1);
  v35.CFIndex length = CFArrayGetCount(a1);
  v35.location = 0LL;
  CFArraySortValues(a1, v35, (CFComparatorFunction)sub_18824B2DC, 0LL);
  CFIndex Count = CFArrayGetCount(MutableCopy);
  if (Count >= 1)
  {
    CFIndex v8 = Count;
    for (CFIndex i = 0LL; i != v8; ++i)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, i);
      if (ValueAtIndex)
      {
        uint64_t v11 = ValueAtIndex;
        CFTypeID v12 = CFGetTypeID(ValueAtIndex);
        if (v12 == CFDictionaryGetTypeID())
        {
          if (sub_18824B3C0(v11, &v32, &v31, 0LL, (uint64_t *)&v30, (uint64_t *)&v29))
          {
            uint64_t v14 = v31;
            unint64_t v13 = v32;
            CFIndex v15 = sub_18824B5C0(a1, a3, 0);
            CFIndex v16 = CFArrayGetCount(v15);
            if (v16 >= 1)
            {
              unint64_t v17 = v13 + v14 - 1;
              unint64_t v18 = v16 + 1;
              do
              {
                __int16 v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(v15, v18 - 2);
                if (v19)
                {
                  uint64_t v20 = v19;
                  CFTypeID v21 = CFGetTypeID(v19);
                  if (v21 == CFDictionaryGetTypeID())
                  {
                    if (sub_18824B3C0(v20, &v34, &v33, 0LL, 0LL, 0LL))
                    {
                      if (v34 <= v17)
                      {
                        unint64_t v24 = v34 + v33 - 1;
                        if (v24 >= v32)
                        {
                          if (v34 <= v32) {
                            uint64_t v25 = v32;
                          }
                          else {
                            uint64_t v25 = v34;
                          }
                          if (v24 >= v17) {
                            uint64_t v26 = v17;
                          }
                          else {
                            uint64_t v26 = v34 + v33 - 1;
                          }
                          uint64_t v27 = sub_18824A320(v25, v26 - v25 + 1, 0, v30, v29, 0LL, v22, v23, 0LL);
                          CFArrayAppendValue(a1, v27);
                          CFRelease(v27);
                        }
                      }
                    }
                  }
                }

                --v18;
              }

              while (v18 > 1);
            }

            CFRelease(v15);
          }
        }
      }
    }
  }

  if ((a4 & 2) != 0)
  {
    sub_18824B54C(a1, a3, (a4 & 0x10) != 0);
  }

  else
  {
    v36.CFIndex length = CFArrayGetCount(a1);
    v36.location = 0LL;
    CFArraySortValues(a1, v36, (CFComparatorFunction)sub_18824B2DC, 0LL);
  }

  CFRelease(MutableCopy);
}

void sub_188263D94(const __CFArray *a1, int a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    unint64_t v5 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v5 - 2);
      if (ValueAtIndex)
      {
        uint64_t v7 = ValueAtIndex;
        CFTypeID v8 = CFGetTypeID(ValueAtIndex);
        if (v8 == CFDictionaryGetTypeID()
          && sub_18824B3C0(v7, 0LL, 0LL, &v9, (uint64_t *)&theString1, 0LL)
          && CFStringCompare(theString1, @"Apple_Free", 1uLL) == kCFCompareEqualTo
          && (!a2 || !v9))
        {
          CFArrayRemoveValueAtIndex(a1, v5 - 2);
        }
      }

      --v5;
    }

    while (v5 > 1);
  }

__CFDictionary *sub_188263E70( uint64_t a1, uint64_t a2, int a3, const void *a4, const void *a5, const void *a6, const __CFString **a7)
{
  uint64_t v28 = a2;
  uint64_t valuePtr = a1;
  int v27 = a3;
  uint64_t v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable) {
    return Mutable;
  }
  CFNumberRef v13 = CFNumberCreate(v11, kCFNumberLongLongType, &valuePtr);
  if (!v13) {
    goto LABEL_8;
  }
  CFNumberRef v14 = v13;
  CFDictionarySetValue(Mutable, @"partition-start", v13);
  CFRelease(v14);
  CFNumberRef v15 = CFNumberCreate(v11, kCFNumberLongLongType, &v28);
  if (!v15) {
    goto LABEL_8;
  }
  CFNumberRef v16 = v15;
  CFDictionarySetValue(Mutable, @"partition-length", v15);
  CFRelease(v16);
  if (!a3)
  {
    CFDictionarySetValue(Mutable, @"partition-synthesized", (const void *)*MEMORY[0x189604DE8]);
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  CFNumberRef v17 = CFNumberCreate(v11, kCFNumberSInt32Type, &v27);
  if (!v17)
  {
LABEL_8:
    CFRelease(Mutable);
    return 0LL;
  }

  CFNumberRef v18 = v17;
  CFDictionarySetValue(Mutable, @"partition-number", v17);
  CFRelease(v18);
  if (a4) {
LABEL_10:
  }
    CFDictionarySetValue(Mutable, @"partition-hint", a4);
LABEL_11:
  if (a5) {
    CFDictionarySetValue(Mutable, @"partition-name", a5);
  }
  if (!a6) {
    goto LABEL_16;
  }
  __int16 v19 = @"partition-data";
  uint64_t v20 = Mutable;
  CFTypeID v21 = a6;
  while (1)
  {
    CFDictionarySetValue(v20, v19, v21);
LABEL_16:
    uint64_t v22 = a7;
    uint64_t v26 = (const void **)(a7 + 1);
    __int16 v19 = *v22;
    if (!*v22) {
      break;
    }
    uint64_t v23 = v26;
    a7 = (const __CFString **)(v26 + 1);
    CFTypeID v21 = *v23;
    uint64_t v20 = Mutable;
  }

  return Mutable;
}

const char *sub_188264040()
{
  return "CDIPartitionScheme";
}

uint64_t sub_18826404C(uint64_t a1)
{
  *(void *)uint64_t v2 = off_18A20D958;
  *(_OWORD *)(v2 + 216) = 0u;
  *(_OWORD *)(v2 + 232) = 0u;
  *(_OWORD *)(v2 + 248) = 0u;
  *(_OWORD *)(v2 + 200) = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  sub_18823A7AC(v2, @"thread-safe", (const void *)*MEMORY[0x189604DE8]);
  return a1;
}

void sub_1882640B0(_Unwind_Exception *a1)
{
}

void *sub_1882640C8(uint64_t a1)
{
  *(void *)a1 = off_18A20D958;
  sub_18823B02C(a1, 1);
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  return sub_18823B1C4(a1);
}

void sub_188264140(_Unwind_Exception *a1)
{
}

void sub_18826415C(void *a1)
{
}

void sub_188264180(_Unwind_Exception *a1)
{
}

uint64_t sub_188264194(uint64_t a1, CFDictionaryRef theDict, char **a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  if (a1 && theDict && a3)
  {
    uint64_t Value = CFDictionaryGetValue(theDict, @"VectoredBackingStoreCallbackData");
    if (!Value) {
      return 22LL;
    }
    CFTypeID v8 = Value;
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID != CFGetTypeID(v8)) {
      return 22LL;
    }
    uint64_t v10 = (char *)operator new(0x118uLL);
    sub_18826404C((uint64_t)v10);
    __n128 v11 = sub_1882642AC((uint64_t)v10, (CFDataRef)v8);
    uint64_t v13 = v12;
    if (!(_DWORD)v12)
    {
      uint64_t v13 = (*(uint64_t (**)(char *, uint64_t, __n128))(*(void *)v10 + 696LL))(v10, a1, v11);
      if (!(_DWORD)v13)
      {
        uint64_t v14 = sub_18823AC00((uint64_t)theDict);
        uint64_t v13 = (*(uint64_t (**)(char *, uint64_t))(*(void *)v10 + 80LL))(v10, v14);
        if (!(_DWORD)v13) {
          goto LABEL_14;
        }
      }
    }

    sub_18823ADA4(v10);
LABEL_13:
    uint64_t v10 = 0LL;
LABEL_14:
    *a3 = v10;
    return v13;
  }

  uint64_t v13 = 22LL;
  if (a3) {
    goto LABEL_13;
  }
  return v13;
}

void sub_188264298(_Unwind_Exception *a1)
{
}

__n128 sub_1882642AC(uint64_t a1, CFDataRef theData)
{
  *(void *)buffer = 0LL;
  if (theData && CFDataGetLength(theData) == 8)
  {
    v8.location = 0LL;
    v8.CFIndex length = 8LL;
    CFDataGetBytes(theData, v8, buffer);
    uint64_t v5 = *(void *)buffer;
    if (!**(_DWORD **)buffer)
    {
      __int128 v6 = *(_OWORD *)(*(void *)buffer + 8LL);
      *(void *)(a1 + 272) = v6;
      *(_OWORD *)(a1 + 208) = v6;
      *(_OWORD *)(a1 + 224) = *(_OWORD *)(v5 + 24);
      *(_OWORD *)(a1 + 240) = *(_OWORD *)(v5 + 40);
      __n128 result = *(__n128 *)(v5 + 56);
      *(__n128 *)(a1 + 256) = result;
    }
  }

  return result;
}

uint64_t sub_18826433C(void *a1, const __CFURL *a2)
{
  return (*(uint64_t (**)(void *))(*a1 + 688LL))(a1);
}

uint64_t sub_188264368(uint64_t a1)
{
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v3 = getpid();
  CFStringRef v4 = CFStringCreateWithFormat(v2, 0LL, @"%d:%p", v3, a1);
  if (!v4) {
    return 999LL;
  }
  CFStringRef v5 = v4;
  (*(void (**)(uint64_t, CFStringRef))(*(void *)a1 + 552LL))(a1, v4);
  CFRelease(v5);
  return 0LL;
}

uint64_t sub_1882643E4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 568LL))(a1))
  {
    if ((_DWORD)a2)
    {
      else {
        return 13LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 216))(a1, *(void *)(a1 + 272), a2);
    if (!(_DWORD)result) {
      return sub_18823B7D8(a1, a2);
    }
  }

  return result;
}

uint64_t sub_188264468(uint64_t a1)
{
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 568LL))(a1) & 1) != 0
    || (uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 224))(a1, *(void *)(a1 + 272)), !(_DWORD)result))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 576LL))(a1);
    return 0LL;
  }

  return result;
}

uint64_t sub_1882644BC(uint64_t a1, uint64_t a2)
{
  else {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 256))(a1, *(void *)(a1 + 272), a2);
  }
}

uint64_t sub_18826451C(uint64_t a1, void *a2)
{
  if (!a2) {
    return 22LL;
  }
  *a2 = 0LL;
  return (*(uint64_t (**)(uint64_t, void, void *))(a1 + 264))(a1, *(void *)(a1 + 272), a2);
}

uint64_t sub_188264538(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (a4) {
    *a4 = 0LL;
  }
  uint64_t result = 22LL;
  if (a4)
  {
    if (a5) {
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, void *, uint64_t))(a1 + 232))( a1,  *(void *)(a1 + 272),  a2,  a3,  a4,  a5);
    }
  }

  return result;
}

uint64_t sub_1882645D0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (a4) {
    *a4 = 0LL;
  }
  uint64_t result = 22LL;
  if (a4 && a5)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 72LL))(a1)) {
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, void *, uint64_t))(a1 + 240))( a1,  *(void *)(a1 + 272),  a2,  a3,  a4,  a5);
    }
    else {
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_188264684(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 248))(a1, *(void *)(a1 + 272), a2);
}

const char *sub_188264694()
{
  return "CVectoredBackingStore";
}

uint64_t sub_1882646A0()
{
  return 1LL;
}

void *sub_1882646A8(void *a1)
{
  void *v2 = &off_18A20DC40;
  v2[16] = 32LL;
  a1[15] = calloc(1uLL, 0x20uLL);
  a1[14] = malloc(0x68uLL);
  uint64_t v3 = MEMORY[0x1895F82E8];
  a1[17] = MEMORY[0x1895F82E0];
  a1[18] = v3;
  a1[19] = MEMORY[0x1895F82D8];
  return a1;
}

void sub_18826471C(_Unwind_Exception *a1)
{
}

void sub_18826473C(void *a1)
{
}

void sub_188264760(_Unwind_Exception *a1)
{
}

const char *sub_188264774()
{
  return "CSHA256Checksum";
}

uint64_t sub_188264780()
{
  return 7LL;
}

CFStringRef sub_188264788()
{
  return @"SHA256";
}

CFStringRef sub_188264794()
{
  return @"SHA-256";
}

void *sub_1882647A0(void *a1)
{
  void *v2 = &off_18A20DD10;
  v2[16] = 48LL;
  a1[15] = calloc(1uLL, 0x30uLL);
  a1[14] = malloc(0xD0uLL);
  uint64_t v3 = MEMORY[0x1895F8308];
  a1[17] = MEMORY[0x1895F8300];
  a1[18] = v3;
  a1[19] = MEMORY[0x1895F82F8];
  return a1;
}

void sub_188264814(_Unwind_Exception *a1)
{
}

void sub_188264834(void *a1)
{
}

void sub_188264858(_Unwind_Exception *a1)
{
}

const char *sub_18826486C()
{
  return "CSHA384Checksum";
}

uint64_t sub_188264878()
{
  return 8LL;
}

CFStringRef sub_188264880()
{
  return @"SHA384";
}

CFStringRef sub_18826488C()
{
  return @"SHA-384";
}

void *sub_188264898(void *a1)
{
  void *v2 = &off_18A20DDE0;
  v2[16] = 64LL;
  a1[15] = calloc(1uLL, 0x40uLL);
  a1[14] = malloc(0xD0uLL);
  uint64_t v3 = MEMORY[0x1895F8328];
  a1[17] = MEMORY[0x1895F8320];
  a1[18] = v3;
  a1[19] = MEMORY[0x1895F8318];
  return a1;
}

void sub_18826490C(_Unwind_Exception *a1)
{
}

void sub_18826492C(void *a1)
{
}

void sub_188264950(_Unwind_Exception *a1)
{
}

const char *sub_188264964()
{
  return "CSHA512Checksum";
}

uint64_t sub_188264970()
{
  return 9LL;
}

CFStringRef sub_188264978()
{
  return @"SHA512";
}

CFStringRef sub_188264984()
{
  return @"SHA-512";
}

uint64_t sub_188264990( char *a1, unsigned int a2, int a3, unint64_t a4, __CFDictionary **a5, void ****a6, int *a7, __CFArray **a8, char a9)
{
  allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0LL;
  }
  v100 = a7;
  if (!a1)
  {
    __int16 v19 = 0LL;
    int v25 = 0;
    uint64_t v26 = 0LL;
    uint64_t v21 = 22LL;
    goto LABEL_32;
  }

  unsigned int v98 = a2;
  if (a2 == 6) {
    uint64_t v18 = 31LL;
  }
  else {
    uint64_t v18 = 23LL;
  }
  __int128 v97 = a1;
  __int16 v19 = sub_188249440(a1, v18);
  CFTypeID v20 = CFGetTypeID(v19);
  if (v20 == CFDictionaryGetTypeID())
  {
    uint64_t v21 = 999LL;
    if (CFDictionaryGetValueIfPresent(v19, @"partitions", (const void **)value))
    {
      CFTypeID v22 = CFGetTypeID(value[0]);
      CFTypeID TypeID = CFArrayGetTypeID();
      BOOL v24 = v22 != TypeID;
      if (v22 == TypeID) {
        uint64_t v21 = 0LL;
      }
      else {
        uint64_t v21 = 999LL;
      }
      if (!v19) {
        goto LABEL_25;
      }
LABEL_23:
      if (v24)
      {
        CFRelease(v19);
        __int16 v19 = 0LL;
      }

      goto LABEL_25;
    }
  }

  else
  {
    uint64_t v21 = 999LL;
  }

  BOOL v24 = 1;
  if (v19) {
    goto LABEL_23;
  }
LABEL_25:
  if ((_DWORD)v21)
  {
LABEL_26:
    uint64_t v26 = 0LL;
    goto LABEL_27;
  }

  CFArrayRef theArray = (const __CFArray *)CFDictionaryGetValue(v19, @"partitions");
  uint64_t v29 = (const __CFString *)CFDictionaryGetValue(v19, @"partition-scheme");
  if (v29) {
    BOOL v30 = CFStringCompare(v29, @"Apple", 0LL) == kCFCompareEqualTo;
  }
  else {
    BOOL v30 = 0;
  }
  int Count = CFArrayGetCount(theArray);
  if (v98 == 5)
  {
    value[0] = &stru_18A20E810;
    int v32 = CFArrayGetCount(theArray);
    sub_18824CD98(theArray, v32 - 1, 0LL, 0LL, value, 0LL);
    if (value[0]) {
      v32 -= CFStringCompare((CFStringRef)value[0], @"Apple_Free", 0LL) == kCFCompareEqualTo;
    }
    unsigned int v98 = 2;
  }

  else
  {
    int v32 = Count;
  }

  char v95 = (void ***)calloc(v32, 8uLL);
  if (!v95)
  {
    uint64_t v26 = 0LL;
    int v25 = 0;
    char v27 = 0;
    uint64_t v21 = 12LL;
    goto LABEL_28;
  }

  v104 = 0LL;
  uint64_t v106 = 0LL;
  int v90 = v32;
  if (v32 < 1)
  {
LABEL_213:
    uint64_t v21 = 0LL;
LABEL_214:
    if (!a6) {
      goto LABEL_221;
    }
LABEL_219:
    if ((_DWORD)v21) {
      goto LABEL_221;
    }
    uint64_t v26 = v95;
    int v25 = v90;
LABEL_222:
    char v27 = 1;
    if (!a5) {
      goto LABEL_28;
    }
    goto LABEL_30;
  }

  int v89 = a3;
  CFIndex v33 = 0LL;
  uint64_t v94 = v32;
  int v34 = -2;
  if (v32 != 1) {
    int v34 = 0;
  }
  int v88 = (void *)*MEMORY[0x189604DE8];
  BOOL v35 = a9 != 0;
  int v36 = -1;
  if (!v30) {
    int v36 = v34;
  }
  unint64_t v92 = a4;
  int v93 = v36;
  int v91 = Mutable;
  while (1)
  {
    uint64_t v37 = sub_18824CD98(theArray, v33, &v106, &v105, (void **)&theString1, &v102);
    if ((_DWORD)v37)
    {
LABEL_216:
      uint64_t v21 = v37;
LABEL_217:
      sub_188255BD0(v95, v94);
      goto LABEL_26;
    }

    uint64_t v38 = sub_1882469F8(&v101);
    if ((_DWORD)v38) {
      break;
    }
    uint64_t v39 = v101;
    v95[v33] = (void **)v101;
    uint64_t v40 = *v39;
    *(void *)(v40 + 8) = v106;
    *(void *)(v40 + 16) = 0LL;
    *(_DWORD *)(v40 + 36) = v93 + v33;
    if (CFStringCompare(theString1, @"Apple_HFS", 0LL) == kCFCompareEqualTo
      || CFStringCompare(theString1, @"Apple_HFSX", 0LL) == kCFCompareEqualTo)
    {
      uint64_t v37 = sub_188249164(v97, v106, v105, &v104);
      if ((_DWORD)v37) {
        goto LABEL_216;
      }
      int v42 = v104;
      BOOL v43 = v101;
      value[0] = 0LL;
      uint64_t MKMediaRef = DIMediaKitCreateMKMediaRef((uint64_t)v104, (uint64_t)allocator, 0LL, (uint64_t *)value);
      if ((_DWORD)MKMediaRef)
      {
        uint64_t v21 = MKMediaRef;
        uint64_t v45 = 0LL;
        a4 = v92;
LABEL_125:
        if (value[0])
        {
          CFRelease(value[0]);
          value[0] = 0LL;
        }

        if (v45) {
          CFRelease(v45);
        }
        CFMutableArrayRef Mutable = v91;
        goto LABEL_186;
      }

      unint64_t v50 = (*(uint64_t (**)(char *))(*(void *)v42 + 96LL))(v42);
      unsigned int v51 = 0;
      uint64_t v45 = 0LL;
      if (v98 <= 6)
      {
        if (((1 << v98) & 0x2C) != 0)
        {
          uint64_t v107 = v50;
          uint64_t v52 = (uint64_t)v43;
          a4 = v92;
          unsigned int v51 = sub_1882657C8(v52, v50, v89, v92);
          uint64_t v45 = 0LL;
          if (!v51) {
            unint64_t v50 = 0LL;
          }
          goto LABEL_119;
        }

        if (((1 << v98) & 0x42) != 0)
        {
          uint64_t v56 = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
          CFDictionarySetValue(v56, @"Record Runs", v88);
          CFDictionarySetValue(v56, @"Record Container", v88);
          CFDictionarySetValue(v56, @"Record Markers", v88);
          uint64_t v45 = (const void *)MKCFCreateFSInfo();
          if (v56) {
            CFRelease(v56);
          }
          unsigned int v51 = v108;
          if (!v108)
          {
            if (v45)
            {
              double v57 = (const __CFNumber *)sub_188245490((const __CFDictionary *)v45, @"Volume block size");
              if (v57)
              {
                if (CFNumberGetValue(v57, kCFNumberSInt64Type, &valuePtr))
                {
                  valuePtr >>= 9;
                  int v58 = (const __CFArray *)sub_1882490A4((const __CFDictionary *)v45, @"Data Runs");
                  if (v58)
                  {
                    unsigned int v51 = sub_1882659A0(v43, v58, v50, v89, v92, v35, (unint64_t *)&v107);
                    if (v51)
                    {
                      a4 = v92;
                    }

                    else
                    {
                      v50 -= v107;
                      uint64_t v107 = v50;
                      unsigned int v51 = sub_1882657C8((uint64_t)v43, v50, 2, v92);
                      a4 = v92;
                      if (!v51) {
                        v50 -= v107;
                      }
                    }

                    goto LABEL_119;
                  }
                }
              }
            }

            unsigned int v51 = 999;
          }
        }
      }

      a4 = v92;
LABEL_119:
      if (v50) {
        BOOL v66 = v51 == 0;
      }
      else {
        BOOL v66 = 0;
      }
      if (v66) {
        uint64_t v21 = 115LL;
      }
      else {
        uint64_t v21 = v51;
      }
      goto LABEL_125;
    }

    if (CFStringCompare(theString1, @"Apple_APFS", 0LL) == kCFCompareEqualTo)
    {
      uint64_t v37 = sub_188249164(v97, v106, v105, &v104);
      if ((_DWORD)v37) {
        goto LABEL_216;
      }
      double v53 = v104;
      double v54 = v101;
      value[0] = 0LL;
      uint64_t v55 = DIMediaKitCreateMKMediaRef((uint64_t)v104, (uint64_t)allocator, 0LL, (uint64_t *)value);
      if ((_DWORD)v55)
      {
        uint64_t v21 = v55;
LABEL_92:
        int v49 = 0LL;
LABEL_181:
        CFMutableArrayRef Mutable = v91;
        goto LABEL_182;
      }

      unint64_t v62 = (*(uint64_t (**)(char *))(*(void *)v53 + 96LL))(v53);
      unsigned int v63 = 0;
      int v49 = 0LL;
      if (v98 > 6) {
        goto LABEL_111;
      }
      if (((1 << v98) & 0x2C) != 0)
      {
        uint64_t v107 = v62;
        unsigned int v63 = sub_1882657C8((uint64_t)v54, v62, v89, a4);
        int v49 = 0LL;
        if (!v63) {
          unint64_t v62 = 0LL;
        }
      }

      else if (((1 << v98) & 0x42) != 0)
      {
        int v86 = v35;
        uint64_t v67 = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        CFDictionarySetValue(v67, @"Record Runs", v88);
        CFDictionarySetValue(v67, @"Record Container", v88);
        CFDictionarySetValue(v67, @"Record Markers", v88);
        uint64_t v68 = (const __CFDictionary *)MKCFCreateFSInfo();
        if (v67) {
          CFRelease(v67);
        }
        unsigned int v63 = v108;
        if (v108)
        {
          CFMutableArrayRef Mutable = v91;
          int v49 = v68;
        }

        else
        {
          int v49 = v68;
          if (v68)
          {
            int v72 = (const __CFNumber *)sub_188245490(v68, @"Volume block size");
            BOOL v35 = v86;
            if (v72
              && CFNumberGetValue(v72, kCFNumberSInt64Type, &valuePtr)
              && (valuePtr >>= 9, (BOOL v73 = (const __CFArray *)sub_1882490A4(v49, @"Data Runs")) != 0LL))
            {
              unsigned int v63 = sub_1882659A0(v54, v73, v62, v89, a4, v86, (unint64_t *)&v107);
              if (!v63)
              {
                v62 -= v107;
                uint64_t v107 = v62;
                unsigned int v63 = sub_1882657C8((uint64_t)v54, v62, 2, a4);
                if (!v63) {
                  v62 -= v107;
                }
              }
            }

            else
            {
              unsigned int v63 = 999;
            }

            goto LABEL_111;
          }

          unsigned int v63 = 999;
          CFMutableArrayRef Mutable = v91;
        }

        BOOL v35 = v86;
        goto LABEL_136;
      }

LABEL_202:
                  uint64_t v21 = 999LL;
                  goto LABEL_158;
                }
              }

              uint64_t v21 = 999LL;
            }

            BOOL v35 = v85;
LABEL_158:
            a4 = v92;
LABEL_159:
            if (v59) {
              uint64_t v74 = 115LL;
            }
            else {
              uint64_t v74 = 0LL;
            }
            if (!(_DWORD)v21) {
              uint64_t v21 = v74;
            }
            goto LABEL_181;
          }

LABEL_179:
          a4 = v92;
          if (v59)
          {
            int v49 = 0LL;
            uint64_t v21 = 115LL;
            goto LABEL_181;
          }

          goto LABEL_196;
        }

LABEL_105:
        uint64_t v60 = (uint64_t)v47;
        a4 = v92;
        uint64_t v61 = sub_1882657C8(v60, v59, v89, v92);
        if ((_DWORD)v61)
        {
          uint64_t v21 = v61;
          int v49 = 0LL;
          goto LABEL_159;
        }

LABEL_196:
        uint64_t v21 = 0LL;
        goto LABEL_92;
      }

LABEL_211:
              int v49 = v87;
              goto LABEL_158;
            }

            goto LABEL_202;
          }

          goto LABEL_179;
        }

        goto LABEL_105;
      }

      goto LABEL_83;
    }

    uint64_t v41 = theString1;
    if (theString1
      && (CFStringCompare(theString1, @"Apple_Free", 0LL) == kCFCompareEqualTo
       || CFStringCompare(v41, @"Apple_Void", 0LL) == kCFCompareEqualTo
       || CFStringCompare(v41, @"Apple_Scratch", 0LL) == kCFCompareEqualTo
       || CFStringCompare(v41, @"Linux_Swap", 0LL) == kCFCompareEqualTo
       || CFStringCompare(v41, @"0657FD6D-A4AB-43C4-84E5-0933C84B4F4F", 0LL) == kCFCompareEqualTo))
    {
      switch(v98)
      {
        case 6u:
          goto LABEL_200;
        case 3u:
          uint64_t v82 = (uint64_t)v101;
          unint64_t v83 = v105;
          int v84 = 1;
          break;
        case 1u:
LABEL_200:
          uint64_t v82 = (uint64_t)v101;
          unint64_t v83 = v105;
          int v84 = 2;
          break;
        default:
          uint64_t v82 = (uint64_t)v101;
          unint64_t v83 = v105;
          int v84 = 0x7FFFFFFF;
          break;
      }

      uint64_t v21 = sub_1882657C8(v82, v83, v84, a4);
      if ((_DWORD)v21) {
        goto LABEL_214;
      }
      goto LABEL_189;
    }

    uint64_t v38 = sub_1882657C8((uint64_t)v101, v105, v89, a4);
    if ((_DWORD)v38) {
      break;
    }
LABEL_189:
    uint64_t v38 = sub_1882657C8((uint64_t)v101, 0LL, -1, a4);
    if ((_DWORD)v38) {
      break;
    }
    nullsub_4(v101);
    v106 += v105;
    int v79 = DIGetBundleRef();
    unint64_t v80 = (const __CFString *)sub_1882660CC(v79, (int)@"%1$@ (%2$@ : %3$d)", @"%1$@ (%2$@ : %3$d)");
    CFStringRef v81 = CFStringCreateWithFormat(allocator, 0LL, v80, v102, theString1, v33);
    CFArrayAppendValue(Mutable, v81);
    if (v81) {
      CFRelease(v81);
    }
    if (v80) {
      CFRelease(v80);
    }
    if (v94 == ++v33) {
      goto LABEL_213;
    }
  }

  uint64_t v21 = v38;
  if (a6) {
    goto LABEL_219;
  }
LABEL_221:
  int v25 = v90;
  sub_188255BD0(v95, v90);
  uint64_t v26 = 0LL;
  if (!(_DWORD)v21) {
    goto LABEL_222;
  }
LABEL_27:
  int v25 = 0;
  char v27 = 0;
LABEL_28:
  if (v19)
  {
    CFRelease(v19);
    __int16 v19 = 0LL;
  }

uint64_t sub_1882657C8(uint64_t a1, unint64_t a2, int a3, unint64_t a4)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v5 = *(void *)a1;
  if (!*(void *)a1) {
    return 22LL;
  }
  int64_t v7 = a2;
  uint64_t result = 22LL;
  if (a3 > -2)
  {
    unint64_t v9 = 0LL;
    unsigned int v10 = 1;
    if (a3 > 2147483645)
    {
      if (a3 == 2147483646) {
        goto LABEL_24;
      }
    }

    else if (a3 >= 3)
    {
      if (a3 != -1) {
        return result;
      }
      goto LABEL_24;
    }

    unint64_t v9 = a2;
    if (a2) {
      goto LABEL_20;
    }
    return 0LL;
  }

  unint64_t v9 = a4;
  if ((a3 + 2147483644) < 5 || a3 == 0x80000000)
  {
    if (a2)
    {
      if (!a4)
      {
        unsigned int v10 = 1;
        goto LABEL_24;
      }

      goto LABEL_20;
    }

    return 0LL;
  }

  if (a3 != -2147483647) {
    return result;
  }
  if (!a2) {
    return 0LL;
  }
  unint64_t v9 = 20LL;
LABEL_20:
  if (a2 % v9) {
    unsigned int v10 = a2 / v9 + 1;
  }
  else {
    unsigned int v10 = a2 / v9;
  }
  if (!v10) {
    return 0LL;
  }
LABEL_24:
  unsigned int v11 = *(_DWORD *)(v5 + 200);
  uint64_t v12 = *(void *)(v5 + 16);
  nullsub_4(a1);
  uint64_t v13 = sub_1882661C8(a1);
  uint64_t result = sub_1882660D4();
  if (!(_DWORD)result)
  {
    sub_188266180(a1, v13 + 40LL * v10);
    uint64_t result = sub_1882660D4();
    if (!(_DWORD)result)
    {
      uint64_t v14 = *(void *)a1;
      *(_DWORD *)(v14 + 200) = *(_DWORD *)(*(void *)a1 + 200LL) + v10;
      *(void *)(v14 + 16) += v7;
      uint64_t v15 = v14 + 40LL * v11 + 204;
      do
      {
        uint64_t result = 0LL;
        else {
          unint64_t v16 = v9;
        }
        *(_DWORD *)uint64_t v15 = a3;
        *(_DWORD *)(v15 + 4) = 0;
        *(void *)(v15 + 8) = v12;
        *(void *)(v15 + 16) = v16;
        v12 += v16;
        v7 -= v16;
        *(void *)(v15 + 24) = 0LL;
        *(void *)(v15 + 32) = 0LL;
        v15 += 40LL;
        --v10;
      }

      while (v10);
    }
  }

  return result;
}

uint64_t sub_1882659A0( void *a1, const __CFArray *a2, unint64_t a3, int a4, unint64_t a5, int a6, unint64_t *a7)
{
  if (!a1 || !*a1) {
    return 22LL;
  }
  sub_1882661D4();
  uint64_t v32 = (uint64_t)a1;
  nullsub_4(a1);
  CFIndex Count = CFArrayGetCount(a2);
  CFIndex v11 = 0LL;
  unint64_t v12 = 0LL;
  unint64_t v34 = 0LL;
  unint64_t v13 = 0LL;
  uint64_t v14 = Count & ~(Count >> 63);
  unsigned int v35 = 2048;
  while (v14 != v11)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, v11);
    __int16 valuePtr = -1;
    if (!ValueAtIndex) {
      goto LABEL_10;
    }
    unint64_t v16 = ValueAtIndex;
    value = (void *)CFDictionaryGetValue(ValueAtIndex, @"Type");
    CFDictionaryGetValueIfPresent(v16, @"Type", (const void **)&value);
    if (!value) {
      goto LABEL_10;
    }
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt16Type, &valuePtr);
    unsigned __int16 v36 = valuePtr;
    value = (void *)CFDictionaryGetValue(v16, @"Origin");
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v37);
    int v17 = v36;
    if (v36 < 2u)
    {
      value = (void *)CFDictionaryGetValue(v16, @"Length");
      CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v38);
      goto LABEL_9;
    }

    if (v36 == 2)
    {
      unint64_t v38 = 0LL;
      BOOL v24 = (void *)sub_18824911C(v16, @"Marker");
      value = v24;
      if (v24)
      {
        if (CFEqual(v24, @"Embedded Start"))
        {
          __int16 v7 = 1;
        }

        else if (CFEqual(value, @"Embedded End"))
        {
          __int16 v7 = 2;
        }

        else if (CFEqual(value, @"Volume Start"))
        {
          __int16 v7 = 3;
        }

        else if (CFEqual(value, @"Volume End"))
        {
          __int16 v7 = 4;
        }

        else
        {
          __int16 v7 = -1;
        }
      }

      else
      {
LABEL_9:
        __int16 v7 = 0;
      }

uint64_t sub_188265D24(uint64_t a1)
{
  *(void *)a1 = off_18A20E1B8;
  free(*(void **)(a1 + 40));
  *(void *)(a1 + 40) = 0LL;
  return a1;
}

const char *sub_188265D5C()
{
  return "CCachedBackingStore";
}

uint64_t sub_188265D68()
{
  return 78LL;
}

uint64_t sub_188265D74(uint64_t a1, char *a2)
{
  uint64_t v3 = (FILE **)MEMORY[0x1895F89D0];
  if (a2) {
    fputs(a2, (FILE *)*MEMORY[0x1895F89D0]);
  }
  CFStringRef v4 = (pthread_mutex_t *)(a1 + 8);
  int v5 = pthread_mutex_trylock((pthread_mutex_t *)(a1 + 8));
  __int128 v6 = "<locked>";
  if (!v5) {
    __int128 v6 = "<unlocked>";
  }
  uint64_t result = fprintf(*v3, "%s (items %d, reserve %d)\n", v6, *(_DWORD *)(a1 + 136), *(_DWORD *)(a1 + 144));
  if (*(_DWORD *)(a1 + 120)) {
    uint64_t result = puts("<aborting>");
  }
  for (CFIndex i = *(void **)(a1 + 128); i; CFIndex i = (void *)i[9])
    uint64_t result = (*(uint64_t (**)(void *, void))(*i + 16LL))(i, 0LL);
  if (!v5) {
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t sub_188265E58(uint64_t a1)
{
  *(void *)a1 = off_18A20E260;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  return a1;
}

void sub_188265E88(char *a1)
{
  *(void *)a1 = off_18A20E260;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  operator delete(a1);
}

void sub_188265EB8(_Unwind_Exception *a1)
{
}

uint64_t sub_188265ECC(uint64_t a1, char *a2)
{
  uint64_t v3 = (FILE **)MEMORY[0x1895F89D0];
  if (a2) {
    fputs(a2, (FILE *)*MEMORY[0x1895F89D0]);
  }
  CFStringRef v4 = (pthread_mutex_t *)(a1 + 8);
  int v5 = pthread_mutex_trylock(v4);
  __int128 v6 = "<locked>";
  if (!v5) {
    __int128 v6 = "<unlocked>";
  }
  uint64_t result = fprintf(*v3, "%s\n", v6);
  if (!v5) {
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t sub_188265F70(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = 0;
  uint64_t v2 = (const void *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, void))(*(void *)a1 + 64LL))( a1,  &v4,  a2,  0LL);
  if (v2) {
    CFRelease(v2);
  }
  return v4;
}

const char *sub_188265FB0()
{
  return "CDIISOPartitionScheme";
}

int8x8_t sub_188265FC0(uint64_t *a1)
{
  v1.i64[0] = *a1;
  v1.i64[1] = *a1;
  int8x8_t result = vqtbl1_s8(v1, (int8x8_t)0x607040500010203LL);
  *a1 = (uint64_t)result;
  return result;
}

const char *sub_188265FDC()
{
  return "CDIGUIDPartitionScheme";
}

uint64_t sub_188265FF4(uint64_t result, int a2, unint64_t a3)
{
  if (*(void *)(result + 112))
  {
    uint64_t v4 = result;
    unint64_t v5 = a3 >> 2;
    BOOL v9 = a2 != 0;
    if (a3 >= 4)
    {
      do
      {
        int8x8_t result = (*(uint64_t (**)(void, BOOL *, uint64_t))(v4 + 144))(*(void *)(v4 + 112), &v9, 4LL);
        --v5;
      }

      while (v5);
      uint64_t v6 = -1LL;
    }

    else
    {
      uint64_t v6 = v5 - 1;
    }

    unint64_t v7 = a3 - 4 * v6;
    unint64_t v8 = v7 - 2;
    if (v7 >= 2)
    {
      int8x8_t result = (*(uint64_t (**)(void, BOOL *, uint64_t))(v4 + 144))(*(void *)(v4 + 112), &v9, 2LL);
      unint64_t v7 = v8;
    }

    if (v7) {
      return (*(uint64_t (**)(void, BOOL *, uint64_t))(v4 + 144))(*(void *)(v4 + 112), &v9, 1LL);
    }
  }

  return result;
}

uint64_t sub_1882660A8(_DWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_DWORD *, uint64_t, void))(*(void *)a1 + 96LL))( a1,  a2,  (8 * a1[32]));
}

uint64_t sub_1882660BC()
{
  return 45LL;
}

uint64_t DIHLDiskImageProbeURL()
{
  return 1LL;
}

CFTypeRef sub_1882660CC(int a1, int a2, CFTypeRef cf)
{
  return CFRetain(cf);
}

uint64_t sub_1882660D4()
{
  return 0LL;
}

void *sub_1882660DC(uint64_t a1)
{
  uint64_t v2 = calloc(1uLL, 0x10uLL);
  if (a1)
  {
    uint64_t v3 = (char *)calloc(1uLL, a1 + 4);
    *(_DWORD *)&v3[a1] = a1;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  void *v2 = v3;
  v2[1] = a1;
  return v2;
}

void *sub_188266130()
{
  int8x8_t result = calloc(1uLL, 0x10uLL);
  *int8x8_t result = 0LL;
  result[1] = 0LL;
  return result;
}

void sub_188266150(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1) {
      free(v2);
    }
  }

  free(a1);
}

char *sub_188266180(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4) {
    int8x8_t result = (char *)realloc(v4, a2 + 4);
  }
  else {
    int8x8_t result = (char *)calloc(1uLL, a2 + 4);
  }
  *(_DWORD *)&result[a2] = a2;
  *(void *)a1 = result;
  *(void *)(a1 + 8) = a2;
  return result;
}

uint64_t sub_1882661C8(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_1882661D4()
{
  return 7LL;
}

__CFDictionary *sub_1882661DC(uint64_t *a1, char a2, uint64_t a3, int a4)
{
  uint64_t v61 = a3;
  unint64_t v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  uint64_t v58 = 0LL;
  CFTypeRef v59 = 0LL;
  if (!Mutable) {
    return 0LL;
  }
  BOOL v9 = Mutable;
  if (!DIMediaKitCreateMKMediaRef((uint64_t)a1, (uint64_t)v7, 0LL, (uint64_t *)&v59))
  {
    CFIndex v11 = CFDictionaryCreateMutable(v7, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    unint64_t v12 = (void *)*MEMORY[0x189604DE8];
    CFDictionarySetValue(v11, @"Include most", (const void *)*MEMORY[0x189604DE8]);
    unint64_t v13 = (const void *)MKCFReadMedia();
    CFRelease(v11);
    if (v57 == 2 || !v13)
    {
      unsigned int v10 = sub_18826675C((uint64_t)a1, a2, 0LL, 0LL, 0LL, 0LL, 0LL, 1LL, v61, 0LL);
      if (v10) {
        int v14 = 0;
      }
      else {
        int v14 = 999;
      }
    }

    else
    {
      if (v57)
      {
        unsigned int v10 = 0LL;
LABEL_19:
        CFRelease(v13);
        goto LABEL_20;
      }

      int v15 = sub_1882669B4((const __CFDictionary *)v13, &v55, &v56);
      if (v15
        || (unint64_t v16 = (const __CFString *)sub_18824911C(v55, @"ID"),
            (int v15 = sub_188266AD8(a2, a1, (uint64_t)v59, v55, &v61, (uint64_t *)&v60)) != 0))
      {
        int v14 = v15;
        unsigned int v10 = 0LL;
        goto LABEL_15;
      }

      uint64_t v18 = (*(uint64_t (**)(uint64_t *))(*a1 + 96))(a1);
      uint64_t v40 = v61;
      uint64_t v41 = v18;
      unsigned int v10 = sub_188266D7C(v16, 0LL, 0LL, 0LL, a2, 0LL, v18, v18, v61, v60, 0LL);
      CFIndex Count = CFArrayGetCount(v56);
      unint64_t v20 = (const __CFDictionary *)sub_1882490E0(v56, 0LL);
      CFIndex v43 = Count;
      CFIndex v44 = Count - 1;
      if (Count >= 1)
      {
        uint64_t v21 = v20;
        uint64_t v39 = v12;
        int v14 = 0;
        CFIndex v22 = 0LL;
        int v42 = a4 | ((a2 & 0x10) >> 4);
        while (1)
        {
          if (v22 >= v44) {
            uint64_t v45 = 0LL;
          }
          else {
            uint64_t v45 = (const __CFDictionary *)sub_1882490E0(v56, v22 + 1);
          }
          double v54 = 0LL;
          if (!sub_188266EE4( v21,  (const void **)&value,  (const void **)&v53,  &v52,  &v49,  &v48,  (const void **)&v51)) {
            goto LABEL_68;
          }
          uint64_t v23 = v48;
          if ((v42 & 1) != 0)
          {
            uint64_t v24 = v48;
            char v25 = a2 & 0xF8 | 4;
          }

          else
          {
            if (v45)
            {
              uint64_t valuePtr = 0LL;
              uint64_t v26 = (const __CFNumber *)sub_188245490(v45, @"Offset");
              if (v26)
              {
                int v27 = CFNumberGetValue(v26, kCFNumberLongLongType, &valuePtr);
                uint64_t v24 = v48;
                if (v27)
                {
                  uint64_t v58 = valuePtr - (v49 + v48);
                  uint64_t v23 = v48;
                }
              }

              else
              {
                uint64_t v24 = v48;
              }
            }

            else
            {
              uint64_t v58 = v41 - (v48 + v49);
              uint64_t v24 = v48;
              if (v61 - (v41 - v48) > v48) {
                uint64_t v23 = v61 - (v41 - v48);
              }
            }

            char v25 = a2;
          }

          int v14 = sub_188249164((char *)a1, v49, v24, &v54);
          if (v14) {
            goto LABEL_68;
          }
          uint64_t v28 = sub_18826675C((uint64_t)v54, v25, value, v53, v53, v52, v49, v60, v23, v51);
          if (v28) {
            break;
          }
          int v14 = 0;
LABEL_68:
          uint64_t v21 = v45;
          if (v54) {
            DIDiskImageObjectRelease(v54);
          }
          if (v43 == ++v22) {
            goto LABEL_73;
          }
        }

        uint64_t v29 = v28;
        if (v58)
        {
          CFNumberRef v30 = CFNumberCreate(0LL, kCFNumberSInt64Type, &v58);
          CFDictionarySetValue(v29, @"postamble", v30);
          CFRelease(v30);
        }

        if ((v25 & 0x10) != 0 || !sub_188267020(v29))
        {
          if (v44 != v22)
          {
LABEL_66:
            int v14 = 0;
            goto LABEL_67;
          }

          uint64_t v35 = v41;
          uint64_t v36 = v41;
          if ((a2 & 4) == 0)
          {
            uint64_t v37 = v48;
            uint64_t v38 = v49;
            int v14 = sub_188267224(v55, (unint64_t *)&v58);
            if (v14)
            {
LABEL_67:
              CFArrayAppendValue(v9, v29);
              CFRelease(v29);
              goto LABEL_68;
            }

            uint64_t v36 = v37 + v38 + v58;
            uint64_t v35 = v41;
          }
        }

        else
        {
          if (value)
          {
            CFDictionarySetValue(v10, @"partition-resize-id-hint", value);
            LODWORD(v46) = v22;
            CFNumberRef v31 = CFNumberCreate(v7, kCFNumberIntType, &v46);
            CFDictionarySetValue(v10, @"partition-resize-hint", v31);
            CFRelease(v31);
          }

          if (v44 != v22) {
            goto LABEL_66;
          }
          if ((a2 & 4) == 0) {
            CFDictionarySetValue(v29, @"can-trigger-image-resize", v39);
          }
          uint64_t v33 = v48;
          uint64_t v32 = v49;
          uint64_t v46 = 0LL;
          unint64_t v34 = (const __CFNumber *)sub_188245490(v29, @"content-min-length");
          if (v34 && CFNumberGetValue(v34, kCFNumberLongLongType, &v46)) {
            uint64_t v33 = v46;
          }
          else {
            uint64_t v46 = v33;
          }
          uint64_t v35 = v41;
          if ((a2 & 4) != 0) {
            uint64_t v36 = v41;
          }
          else {
            uint64_t v36 = v33 + v32 + v58;
          }
        }

        sub_188267058(v10, a2, v36, v35, v40, v60);
        goto LABEL_66;
      }

      int v14 = 0;
LABEL_73:
      if (CFArrayGetCount(v9))
      {
        CFDictionarySetValue(v10, @"subcontent-list", v9);
        CFRelease(v9);
        BOOL v9 = 0LL;
      }
    }

__CFDictionary *sub_18826675C( uint64_t a1, char a2, const void *a3, const __CFString *a4, const void *a5, const void *a6, uint64_t a7, int64_t a8, uint64_t a9, void *a10)
{
  CFTypeRef cf = 0LL;
  if (!a1) {
    return 0LL;
  }
  uint64_t v17 = a9;
  if (!a9)
  {
    uint64_t v18 = 96LL;
    if ((a2 & 4) == 0) {
      uint64_t v18 = 112LL;
    }
    uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + v18))(a1);
  }

  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  if (!a4)
  {
    if ((a2 & 8) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
    uint64_t v24 = a7;
    goto LABEL_18;
  }

  CFComparisonResult v20 = CFStringCompare(a4, @"Apple_APFS", 0LL);
  if ((a2 & 8) != 0 || v20 == kCFCompareEqualTo) {
    goto LABEL_15;
  }
LABEL_9:
  int MKMediaRef = DIMediaKitCreateMKMediaRef(a1, *MEMORY[0x189604DB0], 0LL, (uint64_t *)&cf);
  if (cf && !MKMediaRef && !MKHFSGetResizeLimits())
  {
    uint64_t v26 = v38;
    unint64_t v28 = v39 | (unint64_t)a8;
    if (a8 && v39)
    {
      if ((v28 & 1) != 0)
      {
        char v29 = 0;
        unint64_t v31 = v39;
        unint64_t v30 = a8;
      }

      else
      {
        char v29 = 0;
        unint64_t v30 = a8;
        unint64_t v31 = v39;
        do
        {
          v31 >>= 1;
          v30 >>= 1;
          ++v29;
        }

        while (((v31 | v30) & 1) == 0);
      }

      do
      {
        unint64_t v32 = v31;
        v31 >>= 1;
      }

      while ((v32 & 1) == 0);
      do
      {
        do
        {
          unint64_t v33 = v30;
          v30 >>= 1;
        }

        while ((v33 & 1) == 0);
        unint64_t v34 = v32 - v33;
        if (v32 < v33)
        {
          unint64_t v35 = v33 - v32;
        }

        else
        {
          unint64_t v32 = v33;
          unint64_t v35 = v34;
        }

        unint64_t v30 = v35 >> 1;
      }

      while (v35 > 1);
      unint64_t v28 = v32 << v29;
    }

    uint64_t v24 = a7;
    if (a8 / v28 * v39 <= 1) {
      a8 = 1LL;
    }
    else {
      a8 = a8 / v28 * v39;
    }
    if (v37 < v17) {
      uint64_t v17 = v37;
    }
LABEL_18:
    if (v19 - (v19 - v26) / a8 * a8 >= v19) {
      uint64_t v22 = v19;
    }
    else {
      uint64_t v22 = v19 - (v19 - v26) / a8 * a8;
    }
    uint64_t v23 = (((v17 - v19) / a8 * a8) & ~(((v17 - v19) / a8 * a8) >> 63)) + v19;
    goto LABEL_22;
  }

  uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  a4 = @"unknown";
  uint64_t v23 = v22;
  uint64_t v19 = v22;
  uint64_t v24 = a7;
LABEL_22:
  char v25 = sub_188266D7C(a4, a3, a5, a6, a2, v24, v22, v19, v23, a8, a10);
  if (cf) {
    CFRelease(cf);
  }
  return v25;
}

uint64_t sub_1882669B4(const __CFDictionary *a1, const __CFDictionary **a2, const __CFArray **a3)
{
  if (a3) {
    *a3 = 0LL;
  }
  if (a2) {
    *a2 = 0LL;
  }
  unint64_t v5 = (const __CFArray *)sub_1882490A4(a1, @"Schemes");
  if (!v5) {
    return 45LL;
  }
  uint64_t v6 = v5;
  if (!CFArrayGetCount(v5)) {
    return 45LL;
  }
  if (CFArrayGetCount(v6) < 2)
  {
    unint64_t v7 = (const __CFDictionary *)sub_1882490E0(v6, 0LL);
    goto LABEL_12;
  }

  if (!sub_18825AA1C()) {
    return 45LL;
  }
  unint64_t v7 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
LABEL_12:
  BOOL v9 = v7;
  if (!v7) {
    return 22LL;
  }
  unsigned int v10 = sub_18824911C(v7, @"ID");
  if (!v10) {
    return 22LL;
  }
  if (CFEqual(v10, @"ISO9660")) {
    return 22LL;
  }
  CFIndex v11 = (const __CFArray *)sub_1882490A4(v9, @"Sections");
  unint64_t v12 = sub_188267B20(v11);
  if (!v12) {
    return 22LL;
  }
  unint64_t v13 = (const __CFArray *)sub_1882490A4(v12, @"Partitions");
  if (!v13) {
    return 22LL;
  }
  int v14 = v13;
  if (!CFArrayGetCount(v13)) {
    return 22LL;
  }
  if (a3) {
    *a3 = v14;
  }
  uint64_t result = 0LL;
  if (a2) {
    *a2 = v9;
  }
  return result;
}

uint64_t sub_188266AD8(char a1, uint64_t *a2, uint64_t a3, const __CFDictionary *a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (a6) {
    *a6 = 0LL;
  }
  if (a5)
  {
    uint64_t v11 = MKMediaCopyProperty();
    if (v11)
    {
      unint64_t v12 = (const void *)v11;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID != CFGetTypeID(v12)
        || (int v14 = (const __CFArray *)sub_1882490A4(a4, @"Sections"), (v15 = sub_188267B20(v14)) == 0LL))
      {
        uint64_t v20 = 22LL;
        goto LABEL_16;
      }

      unint64_t v16 = (const __CFNumber *)sub_188245490(v15, @"Media Block Size");
      if (!v16 || !CFNumberGetValue(v16, kCFNumberSInt64Type, &valuePtr)) {
        uint64_t valuePtr = 512LL;
      }
      uint64_t v17 = sub_18824911C(a4, @"ID");
      uint64_t v18 = v17;
      if (v17 && CFEqual(v17, @"APM"))
      {
        uint64_t v19 = (*(uint64_t (**)(uint64_t *, void, uint64_t, char *, unsigned __int16 *))(*a2 + 48))( a2,  0LL,  1LL,  v26,  v28);
        if ((_DWORD)v19)
        {
          uint64_t v20 = v19;
LABEL_16:
          CFRelease(v12);
          return v20;
        }

        sub_188258040(v28);
      }

      if (a6) {
        *a6 = valuePtr / 512;
      }
      if (*a5)
      {
        uint64_t v20 = 0LL;
        goto LABEL_16;
      }

      uint64_t v22 = *a2;
      if ((a1 & 4) == 0)
      {
        uint64_t v23 = (*(uint64_t (**)(uint64_t *))(v22 + 112))(a2);
        uint64_t v24 = v23;
        if (!v18) {
          goto LABEL_31;
        }
        if (CFEqual(v18, @"APM"))
        {
          uint64_t v24 = 0xFFFFFFFFLL * valuePtr / 512;
LABEL_31:
          uint64_t v20 = 0LL;
          if (v23 >= v24) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = v23;
          }
          *a5 = v25;
          goto LABEL_16;
        }

        uint64_t v24 = v23;
        if (CFEqual(v18, @"GPT")) {
          goto LABEL_31;
        }
        uint64_t v24 = v23;
        if (CFEqual(v18, @"MBR")) {
          goto LABEL_31;
        }
        uint64_t v22 = *a2;
      }

      uint64_t v20 = 0LL;
      *a5 = (*(uint64_t (**)(uint64_t *))(v22 + 96))(a2);
      goto LABEL_16;
    }
  }

  return 22LL;
}

__CFDictionary *sub_188266D7C( const __CFString *a1, const void *a2, const void *a3, const void *a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, void *value)
{
  uint64_t v22 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  sub_188267058(Mutable, a5, a7, a8, a9, a10);
  if (a1) {
    uint64_t v19 = a1;
  }
  else {
    uint64_t v19 = @"unknown";
  }
  CFDictionarySetValue(Mutable, @"content-hint", v19);
  if (a3) {
    CFDictionarySetValue(Mutable, @"partition-type", a3);
  }
  if (a4) {
    CFDictionarySetValue(Mutable, @"partition-name", a4);
  }
  if (a2) {
    CFDictionarySetValue(Mutable, @"partition-ID", a2);
  }
  if (value) {
    CFDictionarySetValue(Mutable, @"partition-UUID", value);
  }
  uint64_t valuePtr = a6;
  CFNumberRef v20 = CFNumberCreate(v22, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, @"content-start", v20);
  if (v20) {
    CFRelease(v20);
  }
  return Mutable;
}

uint64_t sub_188266EE4( const __CFDictionary *a1, const void **a2, const void **a3, const void **a4, void *a5, void *a6, const void **a7)
{
  if (a3) {
    *a3 = 0LL;
  }
  if (a2) {
    *a2 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (a7) {
    *a7 = 0LL;
  }
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  if (!a1) {
    return 0LL;
  }
  if (a2) {
    *a2 = sub_188245490(a1, @"Partition ID");
  }
  if (a3) {
    *a3 = sub_18824911C(a1, @"Type");
  }
  if (a4) {
    *a4 = sub_18824911C(a1, @"Name");
  }
  if (a7) {
    *a7 = sub_18824911C(a1, @"GUID");
  }
  if (!a5
    || (uint64_t result = (uint64_t)sub_188245490(a1, @"Offset")) != 0
    && (uint64_t result = CFNumberGetValue((CFNumberRef)result, kCFNumberLongLongType, a5), (_DWORD)result))
  {
    if (!a6) {
      return 1LL;
    }
    uint64_t result = (uint64_t)sub_188245490(a1, @"Size");
    if (result)
    {
      uint64_t result = CFNumberGetValue((CFNumberRef)result, kCFNumberLongLongType, a6);
      if ((_DWORD)result) {
        return 1LL;
      }
    }
  }

  return result;
}

CFStringRef sub_188267020(const __CFDictionary *a1)
{
  uint64_t result = (const __CFString *)sub_18824911C(a1, @"content-hint");
  if (result) {
    return (const __CFString *)(CFStringCompare(result, @"unknown", 0LL) != kCFCompareEqualTo);
  }
  return result;
}

void sub_188267058(__CFDictionary *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a1)
  {
    if (a5 < a4 || (a2 & 1) == 0) {
      uint64_t v9 = a4;
    }
    else {
      uint64_t v9 = a5;
    }
    if (a3 > a4 || (a2 & 2) == 0) {
      uint64_t v11 = a4;
    }
    else {
      uint64_t v11 = a3;
    }
    if (a6 <= 1) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = a6;
    }
    uint64_t v13 = a4 - (a4 - v11) / v12 * v12;
    if (v13 >= a4) {
      uint64_t v13 = a4;
    }
    if ((a4 - v11) % v12) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v11;
    }
    uint64_t v15 = (v9 - a4) / v12 * v12;
    if (v9 - a4 == v15) {
      uint64_t v16 = v9;
    }
    else {
      uint64_t v16 = (v15 & ~(v15 >> 63)) + a4;
    }
    CFDictionaryRemoveValue(a1, @"content-min-length");
    uint64_t v17 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (v14 != a4)
    {
      uint64_t valuePtr = v14;
      CFNumberRef v18 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
      CFDictionarySetValue(a1, @"content-min-length", v18);
      CFRelease(v18);
    }

    CFDictionaryRemoveValue(a1, @"content-max-length");
    if (v16 != a4)
    {
      uint64_t valuePtr = v16;
      CFNumberRef v19 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
      CFDictionarySetValue(a1, @"content-max-length", v19);
      CFRelease(v19);
    }

    CFDictionaryRemoveValue(a1, @"content-granularity");
    if (v14 != v16)
    {
      uint64_t valuePtr = v12;
      CFNumberRef v20 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
      CFDictionarySetValue(a1, @"content-granularity", v20);
      CFRelease(v20);
    }

    uint64_t valuePtr = a4;
    CFNumberRef v21 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
    CFDictionarySetValue(a1, @"content-length", v21);
    CFRelease(v21);
  }

uint64_t sub_188267224(const __CFDictionary *a1, unint64_t *a2)
{
  uint64_t v9 = 0LL;
  uint64_t valuePtr = 0LL;
  if (!a2) {
    return 22LL;
  }
  uint64_t v3 = (const __CFArray *)sub_1882490A4(a1, @"Sections");
  uint64_t v4 = sub_188267B20(v3);
  if (!v4) {
    return 2LL;
  }
  unint64_t v5 = v4;
  uint64_t v6 = (const __CFNumber *)sub_188245490(v4, @"Overhead");
  if (!v6) {
    return 2LL;
  }
  CFNumberGetValue(v6, kCFNumberLongLongType, &valuePtr);
  unint64_t v7 = (const __CFNumber *)sub_188245490(v5, @"Offset");
  if (!v7) {
    return 2LL;
  }
  CFNumberGetValue(v7, kCFNumberLongLongType, &v9);
  if (valuePtr - v9 < 0) {
    return 2LL;
  }
  uint64_t result = 0LL;
  *a2 = (valuePtr - v9 + 8LL * (((valuePtr - v9) & 7) != 0)) & 0xFFFFFFFFFFFFFFF8LL;
  return result;
}

uint64_t sub_1882672D8(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  if (a4) {
    unsigned int v6 = 19;
  }
  else {
    unsigned int v6 = 3;
  }
  if (a3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v6 | 0x20;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(*(void *)a1 + 456LL))(a1, v7, 0LL, 1LL);
  if (!v8) {
    return 999LL;
  }
  uint64_t v9 = (const __CFDictionary *)v8;
  uint64_t v45 = 1LL;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  uint64_t v46 = v10;
  uint64_t valuePtr = v10;
  uint64_t v11 = (const __CFNumber *)sub_188245490(v9, @"content-min-length");
  if (v11) {
    CFNumberGetValue(v11, kCFNumberLongLongType, &valuePtr);
  }
  uint64_t v12 = (const __CFNumber *)sub_188245490(v9, @"content-max-length");
  if (v12) {
    CFNumberGetValue(v12, kCFNumberLongLongType, &v46);
  }
  uint64_t v13 = (const __CFNumber *)sub_188245490(v9, @"content-granularity");
  if (v13) {
    CFNumberGetValue(v13, kCFNumberLongLongType, &v45);
  }
  if (a2 == -1) {
    uint64_t v14 = valuePtr;
  }
  else {
    uint64_t v14 = a2;
  }
  if (v14 == 1) {
    uint64_t v14 = v46;
  }
  if (v14 < valuePtr)
  {
    warnx("resize request is below minimum size allowed.");
LABEL_67:
    uint64_t v23 = 0LL;
    uint64_t v22 = 22LL;
    goto LABEL_33;
  }

  if (v14 > v46)
  {
    warnx("resize request is above maximum size allowed.");
    goto LABEL_67;
  }

  uint64_t v15 = (v10 - v14) / v45 * v45;
  uint64_t v16 = (v14 - v10) / v45 * v45;
  BOOL v17 = v14 <= v10;
  if (v14 > v10) {
    uint64_t v18 = (v14 - v10) / v45 * v45;
  }
  else {
    uint64_t v18 = (v10 - v14) / v45 * v45;
  }
  if (v17) {
    uint64_t v19 = v10 - v15;
  }
  else {
    uint64_t v19 = v16 + v10;
  }
  if (v18)
  {
    CFNumberRef v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t MKMediaRef = DIMediaKitCreateMKMediaRef(a1, *MEMORY[0x189604DB0], 0LL, (uint64_t *)&cf);
    if (!(_DWORD)MKMediaRef)
    {
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v20, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      uint64_t v26 = (const void *)*MEMORY[0x189604DE8];
      CFDictionarySetValue(Mutable, @"Include most", (const void *)*MEMORY[0x189604DE8]);
      uint64_t v23 = (const __CFDictionary *)MKCFReadMedia();
      CFRelease(Mutable);
      uint64_t v22 = v43;
      if (v43) {
        goto LABEL_33;
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      uint64_t v22 = sub_1882669B4(v23, &v41, &v42);
      if ((_DWORD)v22) {
        goto LABEL_33;
      }
      int v27 = sub_18824911C(v41, @"ID");
      unint64_t v28 = v27;
      uint64_t v29 = @"Fit Map to Container";
      if (v27 && CFEqual(v27, @"APM")) {
        uint64_t v29 = @"Fit Map to Media";
      }
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 104LL))(a1, v19);
      if ((_DWORD)v22) {
        goto LABEL_33;
      }
      uint64_t v22 = DIMediaKitCreateMKMediaRef(a1, (uint64_t)v20, 0LL, (uint64_t *)&cf);
      if ((_DWORD)v22) {
        goto LABEL_33;
      }
      CFTypeRef cf1 = v28;
      unint64_t v30 = (const __CFArray *)sub_1882490A4(v23, @"Schemes");
      CFIndex Count = CFArrayGetCount(v30);
      if (Count >= 1)
      {
        CFIndex v32 = Count;
        for (CFIndex i = 0LL; i < v32; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v30, i);
          unint64_t v35 = sub_18824911C(ValueAtIndex, @"ID");
          if (v35 && CFEqual(v35, @"ISO9660"))
          {
            CFArrayRemoveValueAtIndex(v30, i--);
            --v32;
          }
        }
      }

      uint64_t v36 = CFDictionaryCreateMutable(v20, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      CFDictionarySetValue(v36, v29, v26);
      uint64_t v22 = MKCFWriteMedia();
      CFRelease(v36);
      if (!cf1 || (_DWORD)v22) {
        goto LABEL_33;
      }
      if (CFEqual(cf1, @"APM"))
      {
        uint64_t v22 = (*(uint64_t (**)(uint64_t, void, uint64_t, char *, unsigned __int16 *))(*(void *)a1 + 48LL))( a1,  0LL,  1LL,  v40,  &v48);
        if ((_DWORD)v22) {
          goto LABEL_33;
        }
        sub_188258040(&v48);
        if (v49 < 0x200u) {
          uint64_t v37 = 1LL;
        }
        else {
          uint64_t v37 = v49 >> 9;
        }
        uint64_t v38 = v19 / v37;
        if (v19 % v37) {
          ++v38;
        }
        if (v50 * (unint64_t)v37 != v38 * v37)
        {
          if (v38 <= 0xFFFFFFFFLL)
          {
            unsigned int v50 = v38;
            sub_188247154(&v48);
            uint64_t v22 = (*(uint64_t (**)(uint64_t, void, uint64_t, char *, unsigned __int16 *))(*(void *)a1 + 64LL))( a1,  0LL,  1LL,  v40,  &v48);
          }

          else
          {
            uint64_t v22 = 999LL;
          }

          goto LABEL_33;
        }
      }

      else if (!CFEqual(cf1, @"GPT"))
      {
        CFEqual(cf1, @"MBR");
      }

      uint64_t v22 = 0LL;
      goto LABEL_33;
    }

    uint64_t v22 = MKMediaRef;
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  uint64_t v23 = 0LL;
LABEL_33:
  CFRelease(v9);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (v23) {
    CFRelease(v23);
  }
  return v22;
}

uint64_t sub_1882677AC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  uint64_t v12 = 0LL;
  CFTypeRef cf = 0LL;
  if (a4)
  {
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 96LL))(a1, a2, 0LL);
    if (v13 <= a2) {
      uint64_t v12 = a2;
    }
    else {
      uint64_t v12 = v13;
    }
  }

  if (a5) {
    uint64_t v14 = 11LL;
  }
  else {
    uint64_t v14 = 3LL;
  }
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 456LL))(a1, v14, v12, 0LL);
  if (!v15) {
    return 999LL;
  }
  uint64_t v16 = (const __CFDictionary *)v15;
  uint64_t v30 = 1LL;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  uint64_t v31 = v17;
  uint64_t valuePtr = v17;
  if (a6 < 0)
  {
    uint64_t v19 = (const __CFNumber *)sub_188245490(v16, @"content-min-length");
    if (v19) {
      CFNumberGetValue(v19, kCFNumberLongLongType, &valuePtr);
    }
  }

  else
  {
    uint64_t valuePtr = a6;
  }

  CFNumberRef v20 = (const __CFNumber *)sub_188245490(v16, @"content-max-length");
  if (v20) {
    CFNumberGetValue(v20, kCFNumberLongLongType, &v31);
  }
  CFNumberRef v21 = (const __CFNumber *)sub_188245490(v16, @"content-granularity");
  if (v21) {
    CFNumberGetValue(v21, kCFNumberLongLongType, &v30);
  }
  if (a2 == -1) {
    uint64_t v22 = valuePtr;
  }
  else {
    uint64_t v22 = a2;
  }
  if (v22 == 1) {
    uint64_t v23 = v31;
  }
  else {
    uint64_t v23 = v22;
  }
  if (v23 < valuePtr)
  {
    warnx("resize request is below minimum size allowed.", cf);
LABEL_46:
    uint64_t MKMediaRef = 22LL;
    goto LABEL_47;
  }

  if (v23 > v31)
  {
    warnx("resize request is above maximum size allowed.", cf);
    goto LABEL_46;
  }

  if (v23 <= v17)
  {
    if (v17 - v23 != (v17 - v23) % v30)
    {
      uint64_t v24 = v17 - (v17 - v23) / v30 * v30;
LABEL_33:
      uint64_t v25 = *MEMORY[0x189604DB0];
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      CFDictionarySetValue(Mutable, @"Writable", (const void *)*MEMORY[0x189604DE8]);
      uint64_t MKMediaRef = DIMediaKitCreateMKMediaRef(a1, v25, Mutable, (uint64_t *)&cf);
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (cf)
      {
        if ((a5 & 1) != 0 || (uint64_t MKMediaRef = MKHFSResizeVolume(), !(_DWORD)MKMediaRef))
        {
          uint64_t v27 = a4 ? a3 : v24;
          if (v23 <= v17 && v27) {
            uint64_t MKMediaRef = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104LL))(a1);
          }
        }
      }

      goto LABEL_47;
    }

    goto LABEL_31;
  }

  if (v23 - v17 == (v23 - v17) % v30)
  {
LABEL_31:
    uint64_t MKMediaRef = 0LL;
    goto LABEL_47;
  }

  uint64_t v24 = v23 - (v23 - v17) % v30;
  uint64_t MKMediaRef = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 104LL))(a1, v24);
  if (!(_DWORD)MKMediaRef) {
    goto LABEL_33;
  }
LABEL_47:
  CFRelease(v16);
  if (cf) {
    CFRelease(cf);
  }
  return MKMediaRef;
}

CFDictionaryRef sub_188267A58(const __CFArray *a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
  if (a1 && (CFIndex Count = CFArrayGetCount(a1), Count >= 1))
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0LL;
    while (1)
    {
      uint64_t v7 = (const __CFDictionary *)sub_1882490E0(a1, v6);
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = sub_188245490(v7, @"partition-ID");
        if (!v9) {
          goto LABEL_8;
        }
        if (CFEqual(v3, v9)) {
          break;
        }
      }

      if (v5 == ++v6) {
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    uint64_t v8 = 0LL;
  }

  if (v3) {
    CFRelease(v3);
  }
  return v8;
}

CFDictionaryRef sub_188267B20(const __CFArray *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  while (1)
  {
    CFIndex v5 = (const __CFDictionary *)sub_1882490E0(a1, v4);
    if (v5)
    {
      CFIndex v6 = v5;
      uint64_t v7 = sub_18824911C(v5, @"ID");
      if (v7)
      {
        if (CFEqual(v7, @"MAP")) {
          break;
        }
      }
    }

    if (v3 == ++v4) {
      return 0LL;
    }
  }

  return v6;
}

BOOL sub_188267BB4(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t sub_188267C00(uint64_t a1, char *a2, size_t a3)
{
  CFIndex v6 = calloc(1uLL, 0x400uLL);
  if (v6)
  {
    uint64_t v7 = v6;
    if (sub_188267BB4((const char *)(a1 + 72)))
    {
      uint64_t v8 = strstr((const char *)(a1 + 1112), "://");
      if (!v8 || (uint64_t v9 = v8 + 3, (v10 = strchr(v8 + 3, 47)) == 0LL))
      {
        uint64_t v12 = 22LL;
LABEL_17:
        free(v7);
        return v12;
      }

      if (v10 - v9 >= 1023) {
        uint64_t v11 = 1023LL;
      }
      else {
        uint64_t v11 = v10 - v9;
      }
      __memcpy_chk();
      *((_BYTE *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_16:
        uint64_t v12 = 0LL;
        goto LABEL_17;
      }
    }

    else
    {
      __strlcpy_chk();
      if (!a2) {
        goto LABEL_16;
      }
    }

    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_16;
  }

  return 12LL;
}

void sub_188267D34()
{
  int v0 = __error();
  warn("couldn't open debug log; error %d", *v0);
}

BOOL sub_188267D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 160LL))(a1, a2, a3, 0LL) == 0;
}

CCCryptorStatus CCCrypt( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8090]( *(void *)&op,  *(void *)&alg,  *(void *)&options,  key,  keyLength,  iv,  dataIn,  dataInLength);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

uint64_t CFArrayDictionarySearchWithIndexOptions()
{
  return MEMORY[0x189610C40]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySortValues( CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFURLRef CFBundleCopyResourceURL( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x189602850](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1896028B0](bundleID);
}

UInt32 CFBundleGetVersionNumber(CFBundleRef bundle)
{
  return MEMORY[0x189602910](bundle);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x189602E90](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x189602FD8](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateFromXMLData( CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x189602FE8](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation( CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x189603420](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation( CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603428](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x189603478](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithPascalString( CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1896034A0](alloc, pStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603538](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x189603560](string);
}

Boolean CFStringGetPascalString( CFStringRef theString, StringPtr buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x189603570](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1896036B0](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1896036B8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1896036D0](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1896036F0](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1896036F8](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603718](anURL);
}

CFStringRef CFURLCopyUserName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603728](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent( CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603748](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x189603750](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x189603758](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x189603760](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603780](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes( CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1896037A0]( allocator,  originalString,  charactersToLeaveUnescaped,  legalURLCharactersToBeEscaped,  *(void *)&encoding);
}

CFURLRef CFURLCreateWithBytes( CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037B8](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603828](anURL);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x189603838](anURL);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x189603878](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x189607C80](*(void *)&mainPort, *(void *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x1896082E8](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties( io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x189608458](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildIterator( io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x189608498](*(void *)&entry, plane, iterator);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

uint64_t MKCFCreateFSInfo()
{
  return MEMORY[0x189610C68]();
}

uint64_t MKCFReadMedia()
{
  return MEMORY[0x189610C88]();
}

uint64_t MKCFWriteMedia()
{
  return MEMORY[0x189610C98]();
}

uint64_t MKDetectISO()
{
  return MEMORY[0x189610CA8]();
}

uint64_t MKHFSGetResizeLimits()
{
  return MEMORY[0x189610CB0]();
}

uint64_t MKHFSResizeVolume()
{
  return MEMORY[0x189610CB8]();
}

uint64_t MKMediaCopyProperty()
{
  return MEMORY[0x189610CC0]();
}

uint64_t MKMediaCreate()
{
  return MEMORY[0x189610CC8]();
}

uint64_t _CFURLCopyComponents()
{
  return MEMORY[0x189604660]();
}

uint64_t _CFURLCreateFromComponents()
{
  return MEMORY[0x1896046E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A20A3E0(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_call_unexpected(void *a1)
{
}

void __cxa_end_catch(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast( const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x189614810](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1895F8938]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t __strncat_chk()
{
  return MEMORY[0x1895F8A10]();
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1895F95F0](a1);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FA540](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

size_t compression_decode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x189614998](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1896149A0](*(void *)&algorithm);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x189617578](crc, buf, *(void *)&len);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1895FAFB8](*(void *)&a1, *(void *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

double fmod(double a1, double a2)
{
  return result;
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

void free(void *a1)
{
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1895FB490](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1895FB498](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1895FB4A0](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x1895FB5C8](a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FB670](*(void *)&a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617608](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x189617610](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x189617620](strm, version, *(void *)&stream_size);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9A0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
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

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1895FCAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB18](a1);
}

int ptrace(int _request, pid_t _pid, caddr_t _addr, int _data)
{
  return MEMORY[0x1895FCB78](*(void *)&_request, *(void *)&_pid, _addr, *(void *)&_data);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FCBA0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

uint64_t random(void)
{
  return MEMORY[0x1895FCBF8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

char *__cdecl readpassphrase(const char *a1, char *a2, size_t a3, int a4)
{
  return (char *)MEMORY[0x1895FCC60](a1, a2, a3, *(void *)&a4);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1895FCD38](path, name, *(void *)&options);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1895FCD80](a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FCE50](a1, a2, a3, a4, *(void *)&a5);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x1895FCEB8](*(void *)&a1, a2);
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFD0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

double strtod(const char *a1, char **a2)
{
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1E0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x1895FD430](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD528](a1, a2, a3);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}