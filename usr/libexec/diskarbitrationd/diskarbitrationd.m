uint64_t *sub_100003CE0()
{
  return 0LL;
}

uint64_t sub_100003D20()
{
  if (qword_100020100)
  {
    rewind((FILE *)qword_100020100);
LABEL_4:
    dword_100020138 = 0;
    return 1LL;
  }

  qword_100020100 = (uint64_t)fopen("/etc/fstab", "r");
  if (qword_100020100) {
    goto LABEL_4;
  }
  v1 = __error();
  sub_100004138(*v1);
  return 0LL;
}

uint64_t sub_100003D88()
{
  uint64_t result = (uint64_t)fgets(byte_10002013C, 1024, (FILE *)qword_100020100);
  __stringp = (char *)result;
  if (!result) {
    return result;
  }
  v1 = &selRef_numberWithBool_;
  v2 = byte_10002013C;
  v3 = &selRef_numberWithBool_;
  v4 = &selRef_numberWithBool_;
  v5 = &selRef_numberWithBool_;
LABEL_3:
  ++dword_100020138;
  do
  {
    v6 = strsep(&__stringp, " \t\n");
    if (!v6)
    {
      v1[33] = 0LL;
LABEL_33:
      uint64_t result = (uint64_t)fgets(v2, 1024, (FILE *)qword_100020100);
      __stringp = (char *)result;
      if (!result) {
        return result;
      }
      goto LABEL_3;
    }
  }

  while (!*v6);
  v1[33] = v6;
  if (*v6 == 35) {
    goto LABEL_33;
  }
  do
    v7 = strsep(&__stringp, " \t\n");
  while (v7 && !*v7);
  v3[34] = v7;
  do
    v8 = strsep(&__stringp, " \t\n");
  while (v8 && !*v8);
  v4[35] = v8;
  do
  {
    v9 = strsep(&__stringp, " \t\n");
    if (!v9)
    {
      qword_100020120 = 0LL;
      sub_100004138(79);
      goto LABEL_33;
    }
  }

  while (!*v9);
  qword_100020120 = (uint64_t)v9;
  sub_10000425C((unsigned __int8 *)qword_100020108);
  sub_10000425C((unsigned __int8 *)qword_100020110);
  qword_100020130 = 0LL;
  while (1)
  {
    v10 = strsep(&__stringp, " \t\n");
    if (!v10) {
      break;
    }
    if (*v10)
    {
      LODWORD(qword_100020130) = atoi(v10);
      while (1)
      {
        v11 = strsep(&__stringp, " \t\n");
        if (!v11) {
          goto LABEL_22;
        }
        if (*v11)
        {
          HIDWORD(qword_100020130) = atoi(v11);
          goto LABEL_22;
        }
      }
    }
  }

LABEL_22:
  v12 = v2;
  v13 = v4;
  v14 = v3;
  v15 = v5;
  qword_100020128 = (uint64_t)"??";
  __strlcpy_chk(v20, qword_100020120, 1024LL, 1024LL);
  __stringp = v20;
  v16 = strsep(&__stringp, ",");
  if (!v16) {
    return 1LL;
  }
  v17 = v16;
  while (1)
  {
    if (strlen(v17) != 2) {
      goto LABEL_30;
    }
    if (!strcmp(v17, "rw"))
    {
      v18 = "rw";
      goto LABEL_41;
    }

    if (!strcmp(v17, "rq"))
    {
      v18 = "rq";
      goto LABEL_41;
    }

    if (!strcmp(v17, "ro"))
    {
      v18 = "ro";
      goto LABEL_41;
    }

    if (!strcmp(v17, "sw")) {
      break;
    }
    if (!strcmp(v17, "xx"))
    {
      v5 = v15;
      v15[37] = "xx";
      v3 = v14;
      v4 = v13;
      v2 = v12;
      v1 = &selRef_numberWithBool_;
      goto LABEL_33;
    }

LABEL_30:
    v17 = strsep(&__stringp, ",");
    if (!v17) {
      return 1LL;
    }
  }

  v18 = "sw";
LABEL_41:
  v15[37] = (char *)v18;
  return 1LL;
}

        if ((sub_1000092BC(a1, @"DARequestState") & 0x100000) != 0)
        {
          if ((sub_1000092BC(a1, @"DARequestState") & 0x200000) == 0)
          {
            v13 = sub_1000092BC(a1, @"DARequestState");
            sub_1000092F0(a1, @"DARequestState", v13 | 0x200000LL);
          }

          if (CFDictionaryGetValue(a1, @"DARequestDissenter"))
          {
            v14 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
            sub_10000F0E8(a1, v14);
LABEL_44:
            sub_1000132B0(v15);
            return 1LL;
          }

          if (!sub_100014FEC((uint64_t)Value, 1))
          {
            v18 = (const __CFString *)CFDictionaryGetValue(a1, @"DARequestArgument2");
            if (v18) {
              v19 = CFURLCreateWithString(kCFAllocatorDefault, v18, 0LL);
            }
            else {
              v19 = 0LL;
            }
            CFRetain(a1);
            sub_10000795C((uint64_t)Value, 1, 1);
            sub_1000151A8((uint64_t)Value, 1, 1);
            if ((sub_1000092BC(a1, @"DARequestState") & 0x8000000) != 0)
            {
              v30 = CFDictionaryGetValue(a1, @"DARequestArgument3");
              sub_10000A784( (uint64_t)Value,  v19,  (void (*)(void, void, void))sub_10000F620,  (uint64_t)a1,  v25,  v26,  v27,  v28,  @"rdonly",  (uint64_t)v30);
            }

            else
            {
              cf1 = (const __CFString *)CFDictionaryGetValue(a1, @"DARequestArgument3");
              sub_10000A784( (uint64_t)Value,  v19,  (void (*)(void, void, void))sub_10000F620,  (uint64_t)a1,  v21,  v22,  v23,  v24,  cf1,  0LL);
            }

            if (v19) {
              CFRelease(v19);
            }
            return 1LL;
          }
        }

        else
        {
          if (sub_100007500((uint64_t)Value, @"DAVolumeMountable") == kCFBooleanFalse)
          {
            v16 = a1;
            v17 = -119930868;
LABEL_43:
            sub_10000F090(v16, v17);
            goto LABEL_44;
          }

          CFRetain(a1);
          sub_10000795C((uint64_t)Value, 1, 1);
          v12 = sub_1000092BC(a1, @"DARequestState");
          sub_1000092F0(a1, @"DARequestState", v12 & 0xFFEFFFFF | 0x100000LL);
          sub_10000D754(Value, (uint64_t)sub_10000F5D4, (uint64_t)a1);
        }

        return 0LL;
      }
    }

    else if (v5)
    {
      v8 = sub_10000B12C(v5, @"-s=");
      if (v8) {
        v6 = 22;
      }
      else {
        v6 = -119930868;
      }
      if (v8 || v4 == 0LL) {
        goto LABEL_42;
      }
      goto LABEL_27;
    }

    if (v4) {
      goto LABEL_27;
    }
    v6 = -119930868;
LABEL_42:
    v16 = a1;
    v17 = v6;
    goto LABEL_43;
  }

  uint64_t result = sub_1000075C4((uint64_t)Value, 0x10000);
  if (result) {
    goto LABEL_30;
  }
  return result;
}

uint64_t *sub_100004098(const char *a1)
{
  if (sub_100003D20())
  {
    v2 = &qword_100020108;
    while (sub_100003D88())
    {
    }
  }

  return 0LL;
}

uint64_t *sub_1000040E8(const char *a1)
{
  if (sub_100003D20())
  {
    v2 = &qword_100020108;
    while (sub_100003D88())
    {
    }
  }

  return 0LL;
}

ssize_t sub_100004138(int a1)
{
  size_t v2 = strlen(__str);
  write(2, __str, v2);
  v3 = strerror(a1);
  size_t v4 = strlen(v3);
  write(2, v3, v4);
  return write(2, "\n", 1uLL);
}

uint64_t sub_100004230()
{
  uint64_t result = qword_100020100;
  if (qword_100020100)
  {
    uint64_t result = fclose((FILE *)qword_100020100);
    qword_100020100 = 0LL;
  }

  return result;
}

unsigned __int8 *sub_10000425C(unsigned __int8 *result)
{
  for (i = result; ; ++i)
  {
    int v2 = *result;
    if (v2 != 92) {
      break;
    }
    int v2 = result[1];
    if (v2 == 92)
    {
      ++result;
    }

    else if (v2 == 48 && result[2] == 52)
    {
      if (result[3] == 48)
      {
        result += 3;
        LOBYTE(v2) = 32;
      }

      else
      {
        LOBYTE(v2) = 92;
      }
    }

    else
    {
      LOBYTE(v2) = 92;
    }

LABEL_13:
    _BYTE *i = v2;
    ++result;
  }

  if (*result) {
    goto LABEL_13;
  }
  _BYTE *i = 0;
  return result;
}

  sub_100009F4C("renamed disk, id = %@, success.", v5);
LABEL_14:
  if ((_DWORD)a1) {
    v14 = a1 | 0xC000;
  }
  else {
    v14 = 0;
  }
  sub_10000F090(theDict, v14);
  sub_1000151A8((uint64_t)v5, 1, 0);
  v15 = sub_10000795C((uint64_t)v5, 1, 0);
  sub_1000132B0(v15);
  CFRelease(theDict);
}

uint64_t *sub_1000042D8()
{
  if (!qword_100020540 && !sub_100004318()) {
    return 0LL;
  }
  return 0LL;
}

BOOL sub_100004318()
{
  if (qword_100020540)
  {
    rewind((FILE *)qword_100020540);
    return 1LL;
  }

  else
  {
    qword_100020540 = (uint64_t)fopen("/var/db/volinfo.database", "r");
    return qword_100020540 != 0;
  }
}

uint64_t *sub_100004368(const char *a1)
{
  if (sub_100004318())
  {
    int v2 = &qword_100020548;
    while (sub_1000043E4())
    {
    }
  }

  return 0LL;
}

uint64_t sub_1000043B8()
{
  uint64_t result = qword_100020540;
  if (qword_100020540)
  {
    uint64_t result = fclose((FILE *)qword_100020540);
    qword_100020540 = 0LL;
  }

  return result;
}

char *sub_1000043E4()
{
  uint64_t result = fgets(byte_100020558, 1024, (FILE *)qword_100020540);
  __stringp = result;
  if (result)
  {
    while (1)
    {
      v1 = strsep(&__stringp, ":");
      if (v1)
      {
        if (*v1)
        {
          qword_100020548 = (uint64_t)v1;
          int v2 = strsep(&__stringp, "\n");
          if (v2)
          {
            if (*v2)
            {
              dword_100020550 = strtol(v2, &__stringp, 16);
              if (!*__stringp) {
                break;
              }
            }
          }
        }
      }

      uint64_t result = fgets(byte_100020558, 1024, (FILE *)qword_100020540);
      __stringp = result;
      if (!result) {
        return result;
      }
    }

    return (char *)1;
  }

  return result;
}

BOOL sub_1000044C4(const char *a1)
{
  int v3 = getfsstat(0LL, 0, 2);
  int v4 = v3;
  if (v3 >= 1)
  {
    v5 = (statfs *)malloc(2168LL * v3);
    if (v5)
    {
      v6 = v5;
      int v4 = getfsstat(v5, 2168 * v4, 2);
      if (v4 >= 1)
      {
        uint64_t v1 = 0LL;
        f_fstypename = v6->f_fstypename;
        while (1)
        {
          if (!strcmp(f_fstypename, "autofs"))
          {
            size_t v8 = strlen(f_fstypename + 16);
            if (!strncmp(f_fstypename + 16, a1, v8)) {
              break;
            }
          }

          ++v1;
          f_fstypename += 2168;
          if (v4 == v1)
          {
            LODWORD(v1) = v4;
            break;
          }
        }
      }

      free(v6);
    }
  }

  return (int)v1 < v4;
}

uint64_t sub_1000045B4(const char *a1, mode_t a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  asprintf(&__old, "%s.XXXXXX", a1);
  if (!__old) {
    return 0xFFFFFFFFLL;
  }
  if (mkdtemp(__old))
  {
    uint64_t v4 = chmod(__old, a2);
    if ((_DWORD)v4 || (uint64_t v4 = rename(__old, a1), (_DWORD)v4)) {
      rmdir(__old);
    }
  }

  else
  {
    uint64_t v4 = 0xFFFFFFFFLL;
  }

  free(__old);
  return v4;
}

void sub_100004650()
{
  uint64_t v0 = qword_100020958;
  if (!qword_100020958)
  {
    qword_100020960 = os_transaction_create("com.apple.daemon.diskarbitrationd");
    uint64_t v0 = qword_100020958;
  }

  qword_100020958 = v0 + 1;
}

void sub_100004694()
{
  if (!--qword_100020958)
  {
    os_release((void *)qword_100020960);
    qword_100020960 = 0LL;
  }

uint64_t sub_1000046D0()
{
  return qword_100020960;
}

const void *sub_1000046DC(const __CFArray *a1, const void *a2)
{
  v6.length = CFArrayGetCount(a1);
  v6.location = 0LL;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(a1, v6, a2);
  if (FirstIndexOfValue == -1) {
    return 0LL;
  }
  else {
    return CFArrayGetValueAtIndex(a1, FirstIndexOfValue);
  }
}

void sub_100004734(const __CFArray *a1, const __CFArray *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    unint64_t v5 = Count + 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v5 - 2);
      --v5;
    }

    while (v5 > 1);
  }

CFBundleRef sub_1000047A4( CFURLRef bundleURL, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  CFBundleRef result = CFBundleCreate(kCFAllocatorDefault, bundleURL);
  if (result)
  {
    size_t v8 = result;
    _CFBundleSetStringsFilesShared(result, 0LL);
    CFStringRef v9 = CFBundleCopyLocalizedString(v8, a2, a3, a4);
    CFRelease(v8);
    return (CFBundleRef)v9;
  }

  return result;
}

CFURLRef sub_100004818(const __CFURL *a1, const __CFString *a2)
{
  int v3 = CFURLCreateWithFileSystemPathRelativeToBase(kCFAllocatorDefault, a2, kCFURLPOSIXPathStyle, 0, 0LL);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  CFStringRef PathComponent = CFURLCopyLastPathComponent(v3);
  if (PathComponent)
  {
    CFRange v6 = PathComponent;
    v7 = CFURLCreateCopyDeletingLastPathComponent(kCFAllocatorDefault, v4);
    if (v7)
    {
      size_t v8 = v7;
      CFStringRef v9 = CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
      if (v9)
      {
        v10 = v9;
        CFURLRef v11 = CFBundleCopyResourceURLInDirectory(a1, v6, 0LL, v9);
        CFRelease(v10);
      }

      else
      {
        CFURLRef v11 = 0LL;
      }

      CFRelease(v8);
    }

    else
    {
      CFURLRef v11 = 0LL;
    }

    CFRelease(v6);
  }

  else
  {
    CFURLRef v11 = 0LL;
  }

  CFRelease(v4);
  return v11;
}

__CFData *sub_1000048F8(const __CFAllocator *a1, const __CFString *a2)
{
  Mutable = CFDataCreateMutable(a1, 0LL);
  if (Mutable)
  {
    CFIndex Length = CFStringGetLength(a2);
    if (Length < 2)
    {
      CFIndex v6 = 0LL;
    }

    else
    {
      CFIndex v5 = 1LL;
      while (1)
      {
        CFIndex v6 = v5 - 1;
        unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(a2, v5 - 1);
        unsigned int v8 = CFStringGetCharacterAtIndex(a2, v5);
        if (CharacterAtIndex > 0xFF) {
          break;
        }
        if ((_DefaultRuneLocale.__runetype[CharacterAtIndex] & 0x10000) == 0) {
          break;
        }
        __darwin_ct_rune_t v9 = v8;
        if (v8 > 0xFF || (_DefaultRuneLocale.__runetype[v8] & 0x10000) == 0) {
          break;
        }
        unsigned __int16 v10 = __tolower(CharacterAtIndex) - 48;
        __int16 v11 = __tolower(v9);
        __int16 v12 = v11 - 48;
        if (v10 <= 9u) {
          char v13 = 16 * v10;
        }
        else {
          char v13 = 16 * v10 - 112;
        }
        if ((v12 & 0xFFFEu) > 9) {
          LOBYTE(v12) = v11 - 87;
        }
        UInt8 bytes = v13 | v12;
        CFDataAppendBytes(Mutable, &bytes, 1LL);
        v5 += 2LL;
        if (v5 >= Length)
        {
          CFIndex v6 = v5 - 1;
          break;
        }
      }
    }

    if (v6 < Length)
    {
      do
      {
        unsigned int v14 = CFStringGetCharacterAtIndex(a2, v6);
        if (v14 > 0x7F)
        {
          if (!__maskrune(v14, 0x4000uLL))
          {
LABEL_23:
            CFDataSetLength(Mutable, 0LL);
            break;
          }
        }

        else if ((_DefaultRuneLocale.__runetype[v14] & 0x4000) == 0)
        {
          goto LABEL_23;
        }

        ++v6;
      }

      while (Length != v6);
    }

    if (!CFDataGetLength(Mutable))
    {
      CFRelease(Mutable);
      return 0LL;
    }
  }

  return Mutable;
}

CFTypeRef sub_100004AA4(uint64_t a1, const __CFString *a2)
{
  ExternalRepresentation = CFStringCreateExternalRepresentation(kCFAllocatorDefault, a2, 0x8000100u, 0);
  if (!ExternalRepresentation) {
    return 0LL;
  }
  int v3 = ExternalRepresentation;
  CFPropertyListRef v4 = CFPropertyListCreateWithData(kCFAllocatorDefault, ExternalRepresentation, 0LL, 0LL, 0LL);
  if (v4)
  {
    CFIndex v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFDictionaryGetTypeID()) {
      CFTypeRef v7 = CFRetain(v5);
    }
    else {
      CFTypeRef v7 = 0LL;
    }
    CFRelease(v5);
  }

  else
  {
    CFTypeRef v7 = 0LL;
  }

  CFRelease(v3);
  return v7;
}

const void *sub_100004B58(const __CFDictionary *a1)
{
  CFIndex Count = CFDictionaryGetCount(a1);
  if (!Count) {
    return 0LL;
  }
  int v3 = (const void **)malloc(8 * Count);
  if (!v3) {
    return 0LL;
  }
  CFPropertyListRef v4 = v3;
  CFDictionaryGetKeysAndValues(a1, 0LL, v3);
  CFIndex v5 = *v4;
  free(v4);
  return v5;
}

UInt8 *sub_100004BB4(char *cStr, va_list a2)
{
  if (!cStr) {
    return 0LL;
  }
  int v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v3) {
    return 0LL;
  }
  CFPropertyListRef v4 = v3;
  CFIndex v5 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, v3, a2);
  if (v5)
  {
    CFTypeID v6 = v5;
    CFTypeRef v7 = sub_1000093D8(v5);
    CFRelease(v6);
  }

  else
  {
    CFTypeRef v7 = 0LL;
  }

  CFRelease(v4);
  return v7;
}

BOOL sub_100004C4C(const __CFString *a1, UInt8 *a2, uint64_t a3)
{
  CFIndex v5 = a3 - 1;
  CFIndex usedBufLen = a3 - 1;
  v9.length = CFStringGetLength(a1);
  v9.location = 0LL;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, a2, v5, &usedBufLen);
  CFIndex v6 = usedBufLen;
  a2[usedBufLen] = 0;
  return v6 != 0;
}

void sub_100004CC8( __CFString *a1, CFIndex a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_100004CF0(__CFString *a1, CFIndex a2, const __CFString *a3, va_list a4)
{
  CFIndex v6 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, a3, a4);
  if (v6)
  {
    CFTypeRef v7 = v6;
    CFStringInsert(a1, a2, v6);
    CFRelease(v7);
  }

void sub_100004D58(__CFString *a1, const __CFString *a2, CFIndex a3, CFIndex a4)
{
  if (CFStringGetLength(a1) < a3) {
    CFStringPad(a1, a2, a3, a4);
  }
}

CFUUIDRef sub_100004DB4(const __CFAllocator *a1, CFUUIDRef uuid, const __CFData *a3)
{
  *(_OWORD *)md = 0u;
  __int128 v14 = 0u;
  CFUUIDBytes data = CFUUIDGetUUIDBytes(uuid);
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &data, 0x10u);
  BytePtr = CFDataGetBytePtr(a3);
  CC_LONG Length = CFDataGetLength(a3);
  CC_SHA256_Update(&c, BytePtr, Length);
  CC_SHA256_Final(md, &c);
  uint64_t v7 = 0LL;
  uint64_t byte7 = 0LL;
  uint64_t byte13 = 0LL;
  do
  {
    *((_BYTE *)&byte7 + (v7 & 0xF)) ^= md[v7];
    ++v7;
  }

  while (v7 != 32);
  return CFUUIDCreateWithBytes( a1,  byte7,  BYTE1(byte7),  BYTE2(byte7),  BYTE3(byte7),  BYTE4(byte7),  BYTE5(byte7),  BYTE6(byte7) & 0xF | 0x40u,  HIBYTE(byte7),  byte13 & 0x3F | 0x80,  BYTE1(byte13),  BYTE2(byte13),  BYTE3(byte13),  BYTE4(byte13),  BYTE5(byte13),  BYTE6(byte13),  HIBYTE(byte13));
}

CFUUIDRef sub_100004EF8(const __CFAllocator *a1, CFStringRef theString)
{
  uint64_t Length = CFStringGetLength(theString);
  if (!Length) {
    return CFUUIDCreateFromString(a1, theString);
  }
  unint64_t v5 = 0LL;
  while (1)
  {
    unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v5);
    if (v5 <= 0x23) {
      break;
    }
    if (CharacterAtIndex > 0x7F)
    {
      if (!__maskrune(CharacterAtIndex, 0x4000uLL)) {
        return 0LL;
      }
    }

    else if ((_DefaultRuneLocale.__runetype[CharacterAtIndex] & 0x4000) == 0)
    {
      return 0LL;
    }

LABEL_15:
    if (Length == ++v5) {
      return CFUUIDCreateFromString(a1, theString);
    }
  }

  if (v5 <= 0x17 && ((1 << v5) & 0x842100) != 0)
  {
    if (CharacterAtIndex != 45) {
      return 0LL;
    }
    goto LABEL_15;
  }

  if (CharacterAtIndex <= 0xFF && (_DefaultRuneLocale.__runetype[CharacterAtIndex] & 0x10000) != 0) {
    goto LABEL_15;
  }
  return 0LL;
}

CFStringRef sub_100004FFC(const __CFURL *a1, CFURLPathStyle a2)
{
  int v3 = CFURLCopyFileSystemPath(a1, a2);
  if (v3)
  {
    CFStringRef PathComponent = CFURLCopyLastPathComponent(a1);
    if (PathComponent)
    {
      unint64_t v5 = PathComponent;
      CFIndex v6 = CFGetAllocator(a1);
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v6, 0LL, v3);
      if (MutableCopy)
      {
        unsigned int v8 = MutableCopy;
        CFIndex Length = CFStringGetLength(v3);
        CFIndex v10 = CFStringGetLength(v5);
        CFStringInsert(v8, Length - v10, @"r");
        CFRelease(v3);
        int v3 = v8;
      }

      CFRelease(v5);
    }
  }

  return v3;
}

uint64_t sub_100005098(io_registry_entry_t a1, const char *a2, char *a3)
{
  kern_return_t LocationInPlane;
  size_t v9;
  char *v10;
  const char *v11;
  size_t v12;
  io_registry_entry_t parent;
  io_name_t location;
  io_name_t name;
  uint64_t v6 = 3758097090LL;
  uint64_t Path = IORegistryEntryGetPath(a1, a2, a3);
  if ((_DWORD)Path == -536870206)
  {
    uint64_t Path = IORegistryEntryGetParentEntry(a1, a2, &parent);
    if (!(_DWORD)Path)
    {
      uint64_t Path = sub_100005098(parent, a2, a3);
      if ((_DWORD)Path) {
        goto LABEL_12;
      }
      uint64_t Path = IORegistryEntryGetNameInPlane(a1, a2, name);
      if ((_DWORD)Path) {
        goto LABEL_12;
      }
      LocationInPlane = IORegistryEntryGetLocationInPlane(a1, a2, location);
      CFRange v9 = strlen(a3);
      if (LocationInPlane)
      {
        CFIndex v10 = name;
        if (v9 + strlen(name) + 1 <= 0x3FF)
        {
          __int16 v11 = "/";
LABEL_10:
          strlcat(a3, v11, 0x400uLL);
          strlcat(a3, v10, 0x400uLL);
          uint64_t v6 = 0LL;
        }
      }

      else
      {
        __int16 v12 = strlen(name);
        if (v9 + v12 + strlen(location) + 2 <= 0x3FF)
        {
          strlcat(a3, "/", 0x400uLL);
          strlcat(a3, name, 0x400uLL);
          CFIndex v10 = location;
          __int16 v11 = "@";
          goto LABEL_10;
        }
      }

      uint64_t Path = v6;
LABEL_12:
      IOObjectRelease(parent);
    }
  }

  return Path;
}

__CFDictionary *sub_100005234( const __CFAllocator *a1, const void *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, const void *a7, const void *a8)
{
  Mutable = CFDictionaryCreateMutable(a1, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v16 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, @"DACallbackSession", a2);
    sub_1000092F0(v16, @"DACallbackAddress", a3);
    sub_1000092F0(v16, @"DACallbackContext", a4);
    sub_1000092F0(v16, @"DACallbackKind", a5);
    sub_1000092F0(v16, @"DACallbackOrder", a6);
    if (a7) {
      CFDictionarySetValue(v16, @"DACallbackMatch", a7);
    }
    if (a8) {
      CFDictionarySetValue(v16, @"DACallbackWatch", a8);
    }
  }

  return v16;
}

CFMutableDictionaryRef sub_100005338(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  return CFDictionaryCreateMutableCopy(a1, 0LL, theDict);
}

CFNumberRef sub_100005344(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DACallbackAddress");
}

const void *sub_100005350(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackArgument0");
}

const void *sub_10000535C(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackArgument1");
}

CFNumberRef sub_100005368(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DACallbackContext");
}

const void *sub_100005374(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackDisk");
}

CFNumberRef sub_100005380(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DACallbackKind");
}

const void *sub_10000539C(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackMatch");
}

CFNumberRef sub_1000053A8(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DACallbackOrder");
}

const void *sub_1000053C4(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackSession");
}

double sub_1000053D0(const __CFDictionary *a1)
{
  Value = (const __CFDate *)CFDictionaryGetValue(a1, @"DACallbackTime");
  if (Value) {
    return CFDateGetAbsoluteTime(Value);
  }
  else {
    return 0.0;
  }
}

const void *sub_1000053FC(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DACallbackWatch");
}

void sub_100005408(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackArgument0", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackArgument0");
  }
}

void sub_100005420(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackArgument1", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackArgument1");
  }
}

void sub_100005438(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackDisk", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackDisk");
  }
}

void sub_100005450(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackMatch", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackMatch");
  }
}

void sub_100005468(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DACallbackSession", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DACallbackSession");
  }
}

void sub_100005480(__CFDictionary *a1, CFAbsoluteTime a2)
{
  CFDateRef v3 = CFDateCreate(kCFAllocatorDefault, a2);
  if (v3)
  {
    CFDateRef v4 = v3;
    CFDictionarySetValue(a1, @"DACallbackTime", v3);
    CFRelease(v4);
  }

uint64_t sub_1000054D8()
{
  if (dword_100020968)
  {
LABEL_2:
    uint64_t v0 = sub_100012A30();
    qword_100020970 = dispatch_mach_create_f("diskarbitrationd/command", v0, 0LL, sub_100005690);
    dispatch_mach_connect(qword_100020970, dword_100020968, dword_100020968, 0LL);
    goto LABEL_3;
  }

  if (!mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_100020968)
    && !mach_port_insert_right(mach_task_self_, dword_100020968, dword_100020968, 0x14u))
  {
    integer_t port_info = 1;
    mach_port_set_attributes(mach_task_self_, dword_100020968, 1, &port_info, 1u);
  }

  if (dword_100020968)
  {
    int v2 = (dispatch_queue_s *)sub_100012A30();
    CFDateRef v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x14uLL, 0LL, v2);
    if (!v3)
    {
      mach_port_mod_refs(mach_task_self_, dword_100020968, 1u, -1);
      dword_100020968 = 0;
      goto LABEL_3;
    }

    CFDateRef v4 = v3;
    dispatch_source_set_event_handler(v3, &stru_10001CA38);
    dispatch_resume(v4);
    if (!dword_100020968) {
      goto LABEL_3;
    }
    goto LABEL_2;
  }

LABEL_3:
  pthread_mutex_unlock(&stru_100020040);
  return qword_100020970;
}

  if (a1) {
    unsigned int v8 = a1 | 0xC000;
  }
  else {
    unsigned int v8 = 0;
  }
  sub_10000F090(theDict, v8);
  sub_1000151A8((uint64_t)Value, 1, 0);
  CFRange v9 = sub_10000795C((uint64_t)Value, 1, 0);
  sub_1000132B0(v9);
  CFRelease(theDict);
}

void sub_100005620(id a1)
{
  uint64_t v5 = 0LL;
  int v3 = dword_100020968;
  int v4 = 0;
  uint64_t v2 = 0x1800000013LL;
  uint64_t v1 = (dispatch_object_s *)dispatch_mach_msg_create(&v2, 24LL, 0LL, 0LL);
  dispatch_mach_send(qword_100020970, v1, 0LL);
  dispatch_release(v1);
}

void sub_100005690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
    pid_t v4 = waitpid(-1, &v15, 1);
    if (v4 >= 1)
    {
      for (pid_t i = v4; i > 0; pid_t i = waitpid(-1, &v15, 1))
      {
        pthread_mutex_lock(&stru_100020040);
        uint64_t v6 = qword_100020978;
        if (qword_100020978)
        {
          uint64_t v7 = 0LL;
          while (1)
          {
            uint64_t v8 = v6;
            if (*(_DWORD *)v6 != 1) {
              sub_100017FD8();
            }
            if (*(_DWORD *)(v6 + 16) == i) {
              break;
            }
            uint64_t v6 = *(void *)(v6 + 8);
            uint64_t v7 = v8;
            if (!v6) {
              goto LABEL_27;
            }
          }

          if (v7) {
            CFRange v9 = (uint64_t *)(v7 + 8);
          }
          else {
            CFRange v9 = &qword_100020978;
          }
          uint64_t *v9 = *(void *)(v6 + 8);
          pthread_mutex_unlock(&stru_100020040);
          if (*(_DWORD *)(v8 + 20) == -1)
          {
            Mutable = 0LL;
          }

          else
          {
            Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
            if (Mutable)
            {
              __int16 v11 = (UInt8 *)malloc(0x200uLL);
              if (v11)
              {
                __int16 v12 = v11;
                int v13 = read(*(_DWORD *)(v8 + 20), v11, 0x200uLL);
                if (v13 >= 1)
                {
                  do
                  {
                    CFDataAppendBytes(Mutable, v12, v13);
                    int v13 = read(*(_DWORD *)(v8 + 20), v12, 0x200uLL);
                  }

                  while (v13 > 0);
                }

                free(v12);
              }
            }

            close(*(_DWORD *)(v8 + 20));
          }

          if ((v15 & 0x7F) != 0) {
            int v14 = v15;
          }
          else {
            int v14 = (__int16)v15 >> 8;
          }
          int v15 = v14;
          (*(void (**)(void))(v8 + 24))();
          if (Mutable) {
            CFRelease(Mutable);
          }
          free((void *)v8);
          pthread_mutex_lock(&stru_100020040);
        }

LABEL_27:
        pthread_mutex_unlock(&stru_100020040);
      }
    }

    mach_msg_destroy(msg);
  }

void sub_10000586C( const __CFURL *a1, char a2, uid_t a3, gid_t a4, int a5, void (*a6)(uint64_t, void, uint64_t), uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v43 = &a9;
  size_t v17 = 8LL;
  do
  {
    v18 = v43++;
    v17 += 8LL;
  }

  while (*v18);
  v19 = (char **)malloc(v17);
  if (!v19)
  {
    int v29 = 1;
    uint64_t v30 = 70LL;
    if (!a6) {
      return;
    }
    goto LABEL_42;
  }

  v20 = v19;
  bzero(v19, v17);
  v21 = sub_100009498(a1);
  *v20 = (char *)v21;
  if (v21)
  {
    int v42 = a5;
    v44 = &a10;
    uint64_t v22 = a9;
    if (a9)
    {
      v23 = (UInt8 **)(v20 + 1);
      while (1)
      {
        v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@", v22);
        if (v24)
        {
          v25 = v24;
          *v23 = sub_1000093D8(v24);
          CFRelease(v25);
        }

        if (!*v23) {
          break;
        }
        v26 = v44++;
        uint64_t v22 = *v26;
        ++v23;
        if (!v22) {
          goto LABEL_11;
        }
      }

      uint64_t v30 = 70LL;
      int v29 = 1;
    }

    else
    {
LABEL_11:
      *(void *)v47 = -1LL;
      if (!dword_100020968) {
        sub_100018000();
      }
      if ((a2 & 1) != 0 && pipe(v47))
      {
        uint64_t v27 = 66LL;
        BOOL v28 = 1;
      }

      else
      {
        pthread_mutex_lock(&stru_100020040);
        pid_t v31 = fork();
        if (!v31)
        {
          if (setgid(a4) == -1 || setuid(a3) == -1) {
            _exit(77);
          }
          if (v47[1] != -1)
          {
            dup2(v47[1], 1);
            close(v47[1]);
          }

          if (!posix_spawnattr_init(&v46))
          {
            if (!posix_spawn_file_actions_init(&v45))
            {
              if (!posix_spawnattr_setflags(&v46, 16448)
                && !posix_spawn_file_actions_addinherit_np(&v45, 1)
                && !posix_spawn_file_actions_addinherit_np(&v45, 2)
                && !posix_spawn_file_actions_addinherit_np(&v45, 0)
                && (v42 < 0 || !posix_spawn_file_actions_addinherit_np(&v45, v42)))
              {
                v40 = *v20;
                v41 = _NSGetEnviron();
                posix_spawn(0LL, v40, &v45, &v46, v20, *v41);
              }

              posix_spawn_file_actions_destroy(&v45);
            }

            posix_spawnattr_destroy(&v46);
          }

          _exit(71);
        }

        pid_t v32 = v31;
        if (a6)
        {
          if (v31 != -1)
          {
            v33 = malloc(0x28uLL);
            if (v33)
            {
              uint64_t v34 = (uint64_t)v33;
              *(_DWORD *)v33 = 1;
              v33[1] = qword_100020978;
              *((_DWORD *)v33 + 4) = v32;
              int v35 = v47[0];
              if (v47[0] != -1) {
                int v35 = dup(v47[0]);
              }
              *(_DWORD *)(v34 + 20) = v35;
              *(void *)(v34 + 24) = a6;
              *(void *)(v34 + 32) = a7;
              qword_100020978 = v34;
            }
          }
        }

        pthread_mutex_unlock(&stru_100020040);
        BOOL v28 = v32 == -1;
        if (v32 == -1) {
          uint64_t v27 = 71LL;
        }
        else {
          uint64_t v27 = 0LL;
        }
      }

      if (v47[0] != -1) {
        close(v47[0]);
      }
      if (v47[1] != -1) {
        close(v47[1]);
      }
      char v36 = !v28;
      if (!a6) {
        char v36 = 1;
      }
      if ((v36 & 1) == 0) {
        a6(v27, 0LL, a7);
      }
      int v29 = 0;
      uint64_t v30 = 0LL;
    }

    v37 = *v20;
    if (*v20)
    {
      v38 = v20 + 1;
      do
      {
        free(v37);
        v39 = *v38++;
        v37 = v39;
      }

      while (v39);
    }
  }

  else
  {
    int v29 = 1;
    uint64_t v30 = 65LL;
  }

  free(v20);
  if (a6)
  {
LABEL_42:
    if (v29) {
      a6(v30, 0LL, a7);
    }
  }

uint64_t sub_100005C0C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v7 = 0;
  uint64_t v8 = a2;
  uint64_t v9 = a3;
  uint64_t v12 = a4;
  int v10 = a1;
  BOOL v11 = a5 == 0;
  uint64_t v5 = sub_100005C50(&v7);

  return 0LL;
}

NSMutableDictionary *sub_100005C50(unsigned int *a1)
{
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *a1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"operation_type");

  pid_t v4 = (const __CFString *)*((void *)a1 + 1);
  if (!v4)
  {
    uint64_t v6 = 0LL;
    goto LABEL_17;
  }

  int HasSuffix = CFStringHasSuffix(*((CFStringRef *)a1 + 1), @"_fskit");
  uint64_t v6 = 1LL;
  if (CFStringCompare(v4, @"MSDOS", 1uLL) == kCFCompareEqualTo) {
    goto LABEL_15;
  }
  if (CFStringCompare(v4, @"EXFAT", 1uLL) == kCFCompareEqualTo)
  {
    uint64_t v6 = 2LL;
    if (!HasSuffix) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  if (CFStringCompare(v4, @"APFS", 1uLL) == kCFCompareEqualTo)
  {
    uint64_t v6 = 3LL;
LABEL_15:
    if (!HasSuffix) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  if (CFStringCompare(v4, @"HFS", 1uLL) == kCFCompareEqualTo)
  {
    uint64_t v6 = 4LL;
    if (!HasSuffix) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  if (CFStringCompare(v4, @"NTFS", 1uLL)) {
    uint64_t v6 = 6LL;
  }
  else {
    uint64_t v6 = 5LL;
  }
  if (HasSuffix) {
LABEL_16:
  }
    CFRelease(v4);
LABEL_17:
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v7, @"fs_type");

  if (*a1 == 3
    || ((uint64_t v8 = (const __CFString *)*((void *)a1 + 2)) == 0LL
      ? (uint64_t v9 = 0LL)
      : CFStringCompare(*((CFStringRef *)a1 + 2), @"UserFS", 1uLL) == kCFCompareEqualTo
      ? (uint64_t v9 = 2LL)
      : (uint64_t v9 = CFStringCompare(v8, @"FSKit", 1uLL) == kCFCompareEqualTo),
        int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9)),
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v10,  @"fs_implementation"),  v10,  *a1 != 4))
  {
    uint64_t v11 = a1[6];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v12, @"status_code");

    int v13 = *a1;
    if (*a1 <= 5 && ((1 << v13) & 0x27) != 0)
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)a1 + 5) / 0xF4240uLL));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v14, @"duration_ms");

      int v13 = *a1;
    }

    if (v13 != 5 && v13 != 3) {
      goto LABEL_40;
    }
    int v15 = a1[13];
    if (v15 == -1)
    {
      size_t v17 = @"n/a";
    }

    else
    {
      int v16 = csops(a1[13], 0LL, v31, 4LL);
      if (v16)
      {
        sub_100009EFC("Unable to get signing information for pid %d: %d", v15, v16);
LABEL_38:
        size_t v17 = @"other";
        goto LABEL_39;
      }

      if ((v31[3] & 4) == 0 || !proc_name(v15, buffer, 0x40u)) {
        goto LABEL_38;
      }
      size_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
    }

LABEL_39:
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v17,  @"dissenter_name");
    int v13 = *a1;
LABEL_40:
    switch(v13)
    {
      case 0:
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a1[7] & 1));
        v19 = @"volume_clean";
        goto LABEL_69;
      case 1:
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)a1 + 4)));
        v19 = @"volume_size";
        goto LABEL_69;
      case 4:
        goto LABEL_42;
      case 5:
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *((unsigned __int8 *)a1 + 48)));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v27,  @"unmount_forced");

        if (*((_BYTE *)a1 + 56)) {
          unsigned int v28 = 1;
        }
        else {
          unsigned int v28 = 2;
        }
        if (a1[6]) {
          uint64_t v29 = v28;
        }
        else {
          uint64_t v29 = 0LL;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v29));
        v19 = @"approval_status";
        goto LABEL_69;
      default:
        return v2;
    }

    return v2;
  }

LABEL_42:
  unsigned int v20 = a1[7];
  if ((v20 & 8) != 0) {
    int v21 = 2;
  }
  else {
    int v21 = (v20 >> 2) & 1;
  }
  if ((v20 & 0x20) != 0) {
    int v22 = 4;
  }
  else {
    int v22 = v21;
  }
  if ((v20 & 0x10) != 0) {
    int v23 = 3;
  }
  else {
    int v23 = v22;
  }
  if ((v20 & 2) != 0) {
    int v24 = 5;
  }
  else {
    int v24 = v23;
  }
  if ((v20 & 0x40) != 0) {
    unsigned int v25 = 6;
  }
  else {
    unsigned int v25 = v24;
  }
  if ((v20 & 0x80) != 0) {
    uint64_t v26 = 7LL;
  }
  else {
    uint64_t v26 = v25;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v26));
  v19 = @"disk_state";
LABEL_69:
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v18, v19);

  return v2;
}

uint64_t sub_100006134(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v7 = 1;
  uint64_t v8 = a2;
  uint64_t v9 = a3;
  int v10 = a1;
  uint64_t v11 = a5;
  uint64_t v12 = a4;
  uint64_t v5 = sub_100005C50(&v7);

  return 0LL;
}

uint64_t sub_100006174(int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v7 = 2;
  pid_t v4 = @"kext";
  if (a3) {
    pid_t v4 = @"UserFS";
  }
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  int v10 = a1;
  uint64_t v11 = a4;
  uint64_t v5 = sub_100005C50(&v7);

  return 0LL;
}

uint64_t sub_1000061CC(int a1, uint64_t a2, int a3)
{
  unsigned int v5 = 3;
  uint64_t v6 = a2;
  uint64_t v7 = 0LL;
  int v8 = a1;
  int v9 = a3;
  int v3 = sub_100005C50(&v5);

  return 0LL;
}

uint64_t sub_10000620C(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, char a9)
{
  unsigned int v12 = 4;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  if (a9) {
    int v9 = 128;
  }
  else {
    int v9 = 0;
  }
  if (a4) {
    v9 |= 4u;
  }
  if (a5) {
    v9 |= 8u;
  }
  if (a6) {
    v9 |= 0x10u;
  }
  if (a7) {
    v9 |= 0x20u;
  }
  if (a8) {
    v9 |= 0x40u;
  }
  if (a3) {
    v9 |= 2u;
  }
  int v15 = -1;
  int v16 = v9;
  int v10 = sub_100005C50(&v12);

  return 0LL;
}

uint64_t sub_1000062A4(int a1, uint64_t a2, uint64_t a3, char a4, int a5, char a6, uint64_t a7)
{
  unsigned int v9 = 5;
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  int v12 = a1;
  uint64_t v13 = a7;
  char v14 = a4;
  int v15 = a5;
  char v16 = a6;
  uint64_t v7 = sub_100005C50(&v9);

  return 0LL;
}

void sub_1000062F4(uint64_t a1)
{
}

void sub_10000631C(uint64_t a1)
{
}

uint64_t sub_100006344(uint64_t a1, const void *a2, const void *a3)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  if (Value == a3) {
    return 0LL;
  }
  if (!Value) {
    return -1LL;
  }
  if (!a3) {
    return 1LL;
  }
  if (CFEqual(Value, a3)) {
    return 0LL;
  }
  return -1LL;
}

uint64_t sub_1000063A0(CFAllocatorRef allocator, io_registry_entry_t entry)
{
  CFMutableDictionaryRef properties = 0LL;
  io_iterator_t iterator = 0;
  if (IORegistryEntryCreateCFProperties(entry, &properties, allocator, 0)
    || (Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name")) == 0LL
    || !CFStringGetCString(Value, buffer, 128LL, 0x8000100u))
  {
    io_object_t v4 = 0;
    io_object_t v5 = 0;
    uint64_t v6 = 0LL;
LABEL_3:
    if (!sub_100005098(entry, "IOService", __s))
    {
      if (v6) {
        uint64_t v7 = *(const char **)(v6 + 144);
      }
      else {
        uint64_t v7 = 0LL;
      }
      sub_100009EFC("unable to create disk, id = %s.", v7);
    }

    if (v4) {
      IOObjectRelease(v4);
    }
    if (v5) {
      IOObjectRelease(v5);
    }
    if (v6) {
      CFRelease((CFTypeRef)v6);
    }
    if (properties) {
      CFRelease(properties);
    }
    return 0LL;
  }

  __strlcpy_chk(__s, "/dev/", 1024LL, 1024LL);
  __strlcat_chk(__s, buffer, 1024LL, 1024LL);
  uint64_t v6 = sub_10000711C(allocator, __s);
  if (!v6) {
    goto LABEL_20;
  }
  size_t v9 = strlen(__s);
  CFURLRef v10 = CFURLCreateFromFileSystemRepresentation(allocator, (const UInt8 *)__s, v9, 0);
  *(void *)(v6 + 72) = v10;
  if (!v10) {
    goto LABEL_20;
  }
  *(void *)(v6 + 104) = strdup(__s);
  __strlcpy_chk(__s, "/dev/", 1024LL, 1024LL);
  __strlcat_chk(__s, "r", 1024LL, 1024LL);
  __strlcat_chk(__s, buffer, 1024LL, 1024LL);
  *(void *)(v6 + 112) = strdup(__s);
  IOObjectRetain(entry);
  *(_DWORD *)(v6 + 152) = entry;
  CFBooleanRef v11 = kCFBooleanFalse;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAVolumeNetwork", kCFBooleanFalse);
  int v12 = CFDictionaryGetValue(properties, @"Preferred Block Size");
  if (!v12) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBlockSize", v12);
  uint64_t v13 = CFDictionaryGetValue(properties, @"BSD Name");
  if (!v13) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBSDName", v13);
  char v14 = (const __CFNumber *)CFDictionaryGetValue(properties, @"BSD Major");
  if (!v14) {
    goto LABEL_20;
  }
  int v15 = v14;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBSDMajor", v14);
  CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
  char v16 = (const __CFNumber *)CFDictionaryGetValue(properties, @"BSD Minor");
  if (!v16) {
    goto LABEL_20;
  }
  size_t v17 = v16;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBSDMinor", v16);
  CFNumberGetValue(v17, kCFNumberSInt32Type, &v82);
  *(_DWORD *)(v6 + 96) = v82 | (valuePtr << 24);
  v18 = (const __CFNumber *)CFDictionaryGetValue(properties, @"BSD Unit");
  if (!v18) {
    goto LABEL_20;
  }
  v19 = v18;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaBSDUnit", v18);
  CFNumberGetValue(v19, kCFNumberSInt32Type, (void *)(v6 + 128));
  unsigned int v20 = CFDictionaryGetValue(properties, @"Content");
  if (!v20) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaContent", v20);
  int v21 = CFDictionaryGetValue(properties, @"Ejectable");
  if (!v21) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaEjectable", v21);
  CFTypeRef v22 = IORegistryEntrySearchCFProperty(entry, "IOService", @"IOMediaIcon", allocator, 3u);
  if (!v22) {
    goto LABEL_20;
  }
  int v23 = v22;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaIcon", v22);
  CFRelease(v23);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaKind", @"IOMedia");
  int v24 = CFDictionaryGetValue(properties, @"Leaf");
  if (!v24) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaLeaf", v24);
  if (IORegistryEntryGetName(entry, buffer)) {
    goto LABEL_20;
  }
  CFStringRef v26 = CFStringCreateWithCString(allocator, buffer, 0x8000100u);
  if (!v26)
  {
    CFStringRef v26 = CFStringCreateWithCString(allocator, buffer, 0);
    if (!v26) {
      goto LABEL_20;
    }
  }

  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaName", v26);
  CFRelease(v26);
  if (sub_100005098(entry, "IODeviceTree", __s))
  {
  }

  CFStringRef v27 = CFStringCreateWithCString(allocator, __s, 0x8000100u);
  if (!v27)
  {
    CFStringRef v27 = CFStringCreateWithCString(allocator, __s, 0);
    if (!v27) {
      goto LABEL_20;
    }
  }

  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaPath", v27);
  CFRelease(v27);
  unsigned int v28 = CFDictionaryGetValue(properties, @"Removable");
  if (!v28) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaRemovable", v28);
  uint64_t v29 = CFDictionaryGetValue(properties, @"Size");
  if (!v29) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaSize", v29);
  uint64_t v30 = (const __CFString *)CFDictionaryGetValue(properties, @"UUID");
  if (!v30) {
    goto LABEL_44;
  }
  CFUUIDRef v31 = sub_100004EF8(allocator, v30);
  if (!v31)
  {
LABEL_20:
    io_object_t v4 = 0;
    io_object_t v5 = 0;
    goto LABEL_3;
  }

  CFUUIDRef v32 = v31;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaUUID", v31);
  CFRelease(v32);
LABEL_44:
  v33 = CFDictionaryGetValue(properties, @"Whole");
  if (!v33) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaWhole", v33);
  uint64_t v34 = CFDictionaryGetValue(properties, @"Writable");
  if (!v34) {
    goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAMediaWritable", v34);
  CFRelease(properties);
  CFMutableDictionaryRef properties = 0LL;
  if (IORegistryEntryCreateIterator(entry, "IOService", 3u, &iterator)) {
    goto LABEL_20;
  }
  io_object_t object = IOIteratorNext(iterator);
  if (object)
  {
    while (!IOObjectConformsTo(object, "IOBlockStorageDevice"))
    {
      IOObjectRelease(object);
      io_object_t object = IOIteratorNext(iterator);
      if (!object) {
        goto LABEL_50;
      }
    }
  }

  else
  {
LABEL_50:
    io_object_t object = 0;
  }

  IOObjectRelease(iterator);
  io_iterator_t iterator = 0;
  if (!object) {
    goto LABEL_20;
  }
  if (IORegistryEntryCreateCFProperties(object, &properties, allocator, 0))
  {
    io_object_t v5 = object;
    io_object_t v4 = 0;
    goto LABEL_3;
  }

  int v35 = (const __CFDictionary *)CFDictionaryGetValue(properties, @"Protocol Characteristics");
  if (!v35) {
    goto LABEL_63;
  }
  char v36 = v35;
  v37 = (const __CFString *)CFDictionaryGetValue(v35, @"Physical Interconnect Location");
  if (v37)
  {
    v38 = v37;
    if (CFStringCompare(v37, @"Internal", 0LL))
    {
      if (CFStringCompare(v38, @"External", 0LL)) {
        goto LABEL_61;
      }
    }

    else
    {
      CFBooleanRef v11 = kCFBooleanTrue;
    }

    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceInternal", v11);
  }

LABEL_61:
  v39 = CFDictionaryGetValue(v36, @"Physical Interconnect");
  if (v39) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceProtocol", v39);
  }
LABEL_63:
  v40 = (const __CFDictionary *)CFDictionaryGetValue(properties, @"Device Characteristics");
  if (v40)
  {
    v41 = v40;
    int v42 = CFDictionaryGetValue(v40, @"Product Name");
    if (v42) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceModel", v42);
    }
    v43 = CFDictionaryGetValue(v41, @"Product Revision Level");
    if (v43) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceRevision", v43);
    }
    v44 = CFDictionaryGetValue(v41, @"Vendor Name");
    if (v44) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceVendor", v44);
    }
  }

  CFStringRef v45 = CFStringCreateWithCString(allocator, __s, 0x8000100u);
  if (!v45) {
    goto LABEL_71;
  }
  CFStringRef v46 = v45;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADevicePath", v45);
  CFRelease(v46);
  CFTypeRef v47 = IORegistryEntrySearchCFProperty(object, "IOService", @"IOUnit", allocator, 3u);
  if (v47)
  {
    v48 = v47;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceUnit", v47);
    CFRelease(v48);
  }

  v49 = (const __CFNumber *)IORegistryEntrySearchCFProperty(object, "IOService", @"GUID", allocator, 3u);
  if (!v49) {
    goto LABEL_78;
  }
  v50 = v49;
  CFNumberGetValue(v49, kCFNumberSInt64Type, bytes);
  CFRelease(v50);
  *(void *)UInt8 bytes = bswap64(*(unint64_t *)bytes);
  CFDataRef v51 = CFDataCreate(allocator, bytes, 8LL);
  if (!v51)
  {
LABEL_71:
    io_object_t v4 = 0;
    io_object_t v5 = object;
    goto LABEL_3;
  }

  CFDataRef v52 = v51;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceGUID", v51);
  CFRelease(v52);
LABEL_78:
  CFTypeRef v53 = IORegistryEntrySearchCFProperty(object, "IOService", @"AppleTDMLocked", allocator, 3u);
  if (v53)
  {
    v54 = v53;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DADeviceTDMLocked", v53);
    CFRelease(v54);
  }

  CFRelease(properties);
  CFMutableDictionaryRef properties = 0LL;
  if (!IORegistryEntryCreateIterator(object, "IOService", 3u, &iterator))
  {
    io_registry_entry_t entrya = IOIteratorNext(iterator);
    if (entrya)
    {
      while (!IORegistryEntryInPlane(entrya, "IODeviceTree"))
      {
        IOObjectRelease(entrya);
        io_registry_entry_t entrya = IOIteratorNext(iterator);
        if (!entrya) {
          goto LABEL_90;
        }
      }
    }

    else
    {
LABEL_90:
      io_registry_entry_t entrya = 0;
    }

    IOObjectRelease(iterator);
    io_iterator_t iterator = 0;
    if (entrya)
    {
      if (IORegistryEntryGetNameInPlane(entrya, "IODeviceTree", buffer)
        || (CFStringRef v72 = CFStringCreateWithCString(allocator, buffer, 0x8000100u)) == 0LL
        || (CFStringRef v73 = v72,
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DABusName", v72),
            CFRelease(v73),
            sub_100005098(entrya, "IODeviceTree", __s))
        || (CFStringRef v74 = CFStringCreateWithCString(allocator, __s, 0x8000100u)) == 0LL)
      {
        io_object_t v4 = entrya;
        io_object_t v5 = object;
        goto LABEL_3;
      }

      CFStringRef v75 = v74;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DABusPath", v74);
      CFRelease(v75);
      IOObjectRelease(entrya);
    }
  }

  *(void *)UInt8 bytes = CFAbsoluteTimeGetCurrent();
  CFNumberRef v55 = CFNumberCreate(allocator, kCFNumberDoubleType, bytes);
  if (!v55) {
    goto LABEL_71;
  }
  CFNumberRef v56 = v55;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), @"DAAppearanceTime", v55);
  CFRelease(v56);
  uint32_t busyState = 0;
  IOServiceGetBusyState(entry, &busyState);
  if (busyState) {
    *(CFAbsoluteTime *)(v6 + 16) = CFAbsoluteTimeGetCurrent();
  }
  CFBooleanRef v57 = (CFBooleanRef)IORegistryEntrySearchCFProperty(entry, "IOService", @"quarantine", allocator, 3u);
  if (v57 && v57 == kCFBooleanTrue)
  {
    *(_DWORD *)(v6 + 176) |= 0x40u;
LABEL_95:
    CFRelease(v57);
    goto LABEL_96;
  }

  if (v57) {
    goto LABEL_95;
  }
LABEL_96:
  v58 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"owner-uid", allocator, 3u);
  if (v58)
  {
    v59 = v58;
    CFTypeID v60 = CFGetTypeID(v58);
    if (v60 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v59, kCFNumberIntType, &v78);
      uid_t v61 = v78;
      *(_DWORD *)(v6 + 184) = v78;
      v62 = getpwuid(v61);
      if (v62) {
        *(_DWORD *)(v6 + 180) = v62->pw_gid;
      }
    }

    CFRelease(v59);
  }

  v63 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"owner-gid", allocator, 3u);
  if (v63)
  {
    v64 = v63;
    CFTypeID v65 = CFGetTypeID(v63);
    if (v65 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v64, kCFNumberIntType, &v78);
      *(_DWORD *)(v6 + 180) = v78;
    }

    CFRelease(v64);
  }

  v66 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"owner-mode", allocator, 3u);
  if (v66)
  {
    v67 = v66;
    CFTypeID v68 = CFGetTypeID(v66);
    if (v68 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v67, kCFNumberIntType, &v78);
      *(_WORD *)(v6 + 156) = v78;
    }

    CFRelease(v67);
  }

  v69 = (const __CFString *)IORegistryEntrySearchCFProperty(entry, "IOService", @"dev-name", allocator, 0);
  if (v69)
  {
    v70 = v69;
    CFTypeID v71 = CFGetTypeID(v69);
    if (v71 == CFStringGetTypeID() && CFStringGetCString(v70, buffer, 128LL, 0x8000100u))
    {
      __strlcpy_chk(__s, "/dev/", 1024LL, 1024LL);
      __strlcat_chk(__s, buffer, 1024LL, 1024LL);
      *(void *)(v6 + 80) = strdup(__s);
      __strlcpy_chk(__s, "/dev/", 1024LL, 1024LL);
      __strlcat_chk(__s, "r", 1024LL, 1024LL);
      __strlcat_chk(__s, buffer, 1024LL, 1024LL);
      *(void *)(v6 + 88) = strdup(__s);
    }

    CFRelease(v70);
  }

  IOObjectRelease(object);
  return v6;
}

uint64_t sub_10000711C(const __CFAllocator *a1, const char *a2)
{
  uint64_t Instance = _CFRuntimeCreateInstance(a1, qword_100020980, 176LL, 0LL);
  uint64_t v5 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0LL;
    *(_DWORD *)(Instance + 24) = 0;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_OWORD *)(Instance + 48) = 0u;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *(void *)(v5 + 64) = Mutable;
    *(void *)(v5 + 72) = 0LL;
    *(void *)(v5 + 80) = 0LL;
    *(void *)(v5 + 88) = 0LL;
    *(_DWORD *)(v5 + 96) = 0;
    *(void *)(v5 + 112) = 0LL;
    *(void *)(v5 + 120) = 0LL;
    *(void *)(v5 + 104) = 0LL;
    *(_DWORD *)(v5 + 128) = -1;
    *(void *)(v5 + 136) = 0LL;
    uint64_t v7 = strdup(a2);
    *(void *)(v5 + 144) = v7;
    *(_DWORD *)(v5 + 152) = 0;
    *(_WORD *)(v5 + 156) = 488;
    *(_OWORD *)(v5 + 160) = 0u;
    *(_OWORD *)(v5 + 176) = 0u;
    if (!Mutable) {
      sub_100018028();
    }
    if (!v7) {
      sub_100018050();
    }
    size_t v8 = strlen(a2);
    CFDataRef v9 = CFDataCreate(a1, (const UInt8 *)a2, v8 + 1);
    if (v9)
    {
      CFDataRef v10 = v9;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 64), @"DADiskID", v9);
      CFRelease(v10);
    }
  }

  return v5;
}

uint64_t sub_100007220(uint64_t a1)
{
  return *(void *)(a1 + 144);
}

uint64_t sub_100007228(const __CFAllocator *a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  io_object_t v4 = (const UInt8 *)(a2 + 88);
  size_t v5 = strlen((const char *)(a2 + 88));
  CFURLRef v6 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, v4, v5, 1u);
  if (!v6) {
    return 0LL;
  }
  CFURLRef v7 = v6;
  CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(a2 + 72), 0x8000100u);
  if (v8)
  {
    CFStringRef v9 = v8;
    CFDataRef v10 = sub_100009864(a2);
    if (v10)
    {
      CFBooleanRef v11 = v10;
      uint64_t v12 = sub_10000711C(a1, v10);
      if (v12)
      {
        unsigned int v13 = *(_DWORD *)(a2 + 48);
        int v24 = v13 & 0xFFFFFF;
        unsigned int valuePtr = HIBYTE(v13);
        *(void *)(v12 + 32) = CFRetain(v7);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumePath", v7);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeMountable", kCFBooleanTrue);
        if (!CFDictionaryGetValue(*(CFDictionaryRef *)(v12 + 64), @"DAVolumeKind")) {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeKind", v9);
        }
        char v14 = sub_100007CB4(0LL, v7, 0LL);
        if (v14)
        {
          int v15 = v14;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeName", v14);
          CFRelease(v15);
        }

        CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
        if (v16)
        {
          CFNumberRef v17 = v16;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAMediaBSDMajor", v16);
          CFRelease(v17);
        }

        CFNumberRef v18 = CFNumberCreate(0LL, kCFNumberSInt32Type, &v24);
        if (v18)
        {
          CFNumberRef v19 = v18;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAMediaBSDMinor", v18);
          CFRelease(v19);
        }

        if ((*(_DWORD *)(a2 + 64) & 0x1000) != 0) {
          CFBooleanRef v20 = kCFBooleanFalse;
        }
        else {
          CFBooleanRef v20 = kCFBooleanTrue;
        }
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), @"DAVolumeNetwork", v20);
        *(_DWORD *)(v12 + 176) |= 0x70030u;
        uid_t v21 = *(_DWORD *)(a2 + 56);
        *(_DWORD *)(v12 + 184) = v21;
        CFTypeRef v22 = getpwuid(v21);
        if (v22) {
          *(_DWORD *)(v12 + 180) = v22->pw_gid;
        }
      }

      free(v11);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    CFRelease(v9);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  CFRelease(v7);
  return v12;
}

double sub_100007498(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

uint64_t sub_1000074A0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_1000074A8(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_1000074B0(uint64_t a1, int a2)
{
  return *(void *)(a1 + 8LL * (a2 != 0) + 80);
}

uint64_t sub_1000074C4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 96);
}

uint64_t sub_1000074CC(uint64_t a1, int a2)
{
  return *(void *)(a1 + 8LL * (a2 != 0) + 104);
}

uint64_t sub_1000074E0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 128);
}

uint64_t sub_1000074E8(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t sub_1000074F0(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t sub_1000074F8(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

const void *sub_100007500(uint64_t a1, const void *a2)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
}

uint64_t sub_100007508(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t sub_100007510(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t sub_100007518(uint64_t a1)
{
  return *(unsigned int *)(a1 + 152);
}

uint64_t sub_100007520(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int16 *)(a1 + 156);
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), @"DAMediaWritable") == kCFBooleanFalse) {
    return v1 & 0x16D;
  }
  else {
    return v1;
  }
}

BOOL sub_10000756C(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 160) & a2) != 0;
}

uint64_t sub_10000757C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 160);
}

uint64_t sub_100007584(uint64_t a1)
{
  return *(unsigned int *)(a1 + 164);
}

CFMutableDataRef sub_10000758C(CFTypeRef cf)
{
  CFMutableDataRef result = (CFMutableDataRef)*((void *)cf + 21);
  if (!result)
  {
    int v3 = CFGetAllocator(cf);
    CFMutableDataRef result = sub_100009550(v3, *((CFDictionaryRef *)cf + 8));
    *((void *)cf + 21) = result;
  }

  return result;
}

BOOL sub_1000075C4(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 176) & a2) != 0;
}

uint64_t sub_1000075D4()
{
  return qword_100020980;
}

uint64_t sub_1000075E0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 180);
}

uint64_t sub_1000075E8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 184);
}

uint64_t sub_1000075F0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 188);
}

uint64_t sub_1000075F8()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_10001CA58);
  qword_100020980 = result;
  return result;
}

BOOL sub_10000761C(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t context = a1;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_10000765C, &context);
  return context != 0;
}

unint64_t sub_10000765C(unint64_t result, const __CFDictionary *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  if (*a3)
  {
    CFURLRef v6 = (const void *)result;
    if (CFEqual((CFTypeRef)result, @"DAMediaMatch"))
    {
      BOOLean_t matches = 0;
      uint64_t result = IOServiceMatchPropertyTable(*(_DWORD *)(v3 + 152), a2, &matches);
      if (matches) {
        return result;
      }
      goto LABEL_7;
    }

    uint64_t result = (unint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(v3 + 64), v6);
    if (!result || (uint64_t result = CFEqual(a2, (CFTypeRef)result), !(_DWORD)result)) {
LABEL_7:
    }
      *a3 = 0LL;
  }

  return result;
}

uint64_t sub_1000076F0(uint64_t result, double a2)
{
  *(double *)(result + 16) = a2;
  return result;
}

uint64_t sub_1000076F8(uint64_t a1, io_object_t object)
{
  uint64_t result = *(unsigned int *)(a1 + 24);
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 24) = 0;
  }

  if (object)
  {
    uint64_t result = IOObjectRetain(object);
    *(_DWORD *)(a1 + 24) = object;
  }

  return result;
}

void sub_100007738(uint64_t a1, CFTypeRef cf)
{
  io_object_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 32) = 0LL;
  }

  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 32) = cf;
  }

void sub_100007778(uint64_t a1, int a2, char *__s1)
{
  uint64_t v4 = a1 + 8LL * (a2 != 0);
  CFURLRef v7 = *(void **)(v4 + 80);
  CFURLRef v6 = (char **)(v4 + 80);
  size_t v5 = v7;
  if (v7)
  {
    free(v5);
    const void *v6 = 0LL;
  }

  if (__s1) {
    const void *v6 = strdup(__s1);
  }
}

void sub_1000077C0(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 40) = 0LL;
  }

  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 40) = cf;
  }

void sub_100007800(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 48) = 0LL;
  }

  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 48) = cf;
  }

void sub_100007840(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 56) = 0LL;
  }

  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 56) = cf;
  }

void sub_100007880(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t v4 = *(__CFDictionary **)(a1 + 64);
  if (a3) {
    CFDictionarySetValue(v4, a2, a3);
  }
  else {
    CFDictionaryRemoveValue(v4, a2);
  }
  size_t v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 168) = 0LL;
  }

void sub_1000078C0(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4 = *(const void **)(a1 + 136);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 136) = 0LL;
  }

  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 136) = cf;
  }

uint64_t sub_100007900(uint64_t result, int a2, int a3)
{
  if (a3) {
    int v3 = a2;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(result + 160) = *(_DWORD *)(result + 160) & ~a2 | v3;
  return result;
}

uint64_t sub_10000791C(uint64_t a1, io_object_t object)
{
  uint64_t result = *(unsigned int *)(a1 + 164);
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 164) = 0;
  }

  if (object)
  {
    uint64_t result = IOObjectRetain(object);
    *(_DWORD *)(a1 + 164) = object;
  }

  return result;
}

uint64_t sub_10000795C(uint64_t result, int a2, int a3)
{
  if (a3) {
    int v3 = a2;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(result + 176) = *(_DWORD *)(result + 176) & ~a2 | v3;
  return result;
}

char *sub_100007978(uint64_t a1, char *__s1)
{
  uint64_t result = strdup(__s1);
  *(void *)(a1 + 120) = result;
  return result;
}

uint64_t sub_1000079A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 188) = a2;
  return result;
}

uint64_t sub_1000079A8(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

const char **sub_1000079B0(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020EC8);
  if (*(void *)(a1 + 120)) {
    BOOL v3 = Count < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0LL;
  }
  CFIndex v4 = Count;
  CFIndex v5 = 0LL;
  while (1)
  {
    ValueAtIndex = (const char **)CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, v5);
    if (v4 == ++v5) {
      return 0LL;
    }
  }

  return ValueAtIndex;
}

void sub_100007A38(uint64_t a1)
{
  io_object_t v2 = *(_DWORD *)(a1 + 24);
  if (v2) {
    IOObjectRelease(v2);
  }
  BOOL v3 = *(const void **)(a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
  CFIndex v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
  CFIndex v5 = *(const void **)(a1 + 48);
  if (v5) {
    CFRelease(v5);
  }
  CFURLRef v6 = *(const void **)(a1 + 56);
  if (v6) {
    CFRelease(v6);
  }
  CFURLRef v7 = *(const void **)(a1 + 64);
  if (v7) {
    CFRelease(v7);
  }
  CFStringRef v8 = *(const void **)(a1 + 72);
  if (v8) {
    CFRelease(v8);
  }
  CFStringRef v9 = *(void **)(a1 + 80);
  if (v9) {
    free(v9);
  }
  CFDataRef v10 = *(void **)(a1 + 88);
  if (v10) {
    free(v10);
  }
  CFBooleanRef v11 = *(void **)(a1 + 104);
  if (v11) {
    free(v11);
  }
  uint64_t v12 = *(void **)(a1 + 112);
  if (v12) {
    free(v12);
  }
  unsigned int v13 = *(const void **)(a1 + 136);
  if (v13) {
    CFRelease(v13);
  }
  char v14 = *(void **)(a1 + 144);
  if (v14) {
    free(v14);
  }
  io_object_t v15 = *(_DWORD *)(a1 + 152);
  if (v15) {
    IOObjectRelease(v15);
  }
  io_object_t v16 = *(_DWORD *)(a1 + 164);
  if (v16) {
    IOObjectRelease(v16);
  }
  CFNumberRef v17 = *(const void **)(a1 + 168);
  if (v17) {
    CFRelease(v17);
  }
  CFNumberRef v18 = *(void **)(a1 + 120);
  if (v18) {
    free(v18);
  }
}

BOOL sub_100007B28(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a1 + 144), *(const char **)(a2 + 144)) == 0;
}

uint64_t sub_100007B4C(uint64_t a1)
{
  unsigned int v1 = *(const char **)(a1 + 144);
  size_t v2 = strlen(v1);
  if (v2 >= 0x10) {
    uint64_t v3 = 16LL;
  }
  else {
    uint64_t v3 = v2;
  }
  return CFHashBytes(v1, v3);
}

CFStringRef sub_100007B80(void *a1)
{
  size_t v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0LL, @"%s", a1[18]);
}

CFStringRef sub_100007BC0(void *a1)
{
  size_t v2 = CFGetAllocator(a1);
  CFAllocatorRef v3 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0LL, @"<DADisk %p [%p]>{id = %s}", a1, v3, a1[18]);
}

CFMutableDictionaryRef sub_100007C14(const __CFAllocator *a1, int a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v4 = Mutable;
  if (Mutable) {
    sub_1000092F0(Mutable, @"DAStatus", a2);
  }
  return v4;
}

CFNumberRef sub_100007C68(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DAProcessID");
}

CFNumberRef sub_100007C84(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DAStatus");
}

void sub_100007CA0(void *a1, int a2)
{
}

CFStringRef sub_100007CB4(uint64_t a1, const __CFURL *a2, _OWORD *a3)
{
  v10[2] = 0LL;
  v10[0] = 5LL;
  v10[1] = 2147753984LL;
  CFIndex v5 = sub_100009498(a2);
  if (v5)
  {
    CFURLRef v6 = v5;
    if (getattrlist((const char *)v5, v10, v11, 0x41CuLL, 0) == -1)
    {
      CFStringRef v8 = 0LL;
LABEL_12:
      free(v6);
      return v8;
    }

    if (v12[1])
    {
      CFURLRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v12 + v12[0], 0x8000100u);
      CFStringRef v8 = v7;
      if (!v7 || CFStringGetLength(v7))
      {
LABEL_8:
        if (a3) {
          *a3 = v13;
        }
        goto LABEL_12;
      }

      CFRelease(v8);
    }

    CFStringRef v8 = 0LL;
    goto LABEL_8;
  }

  return 0LL;
}

CFUUIDRef sub_100007DDC(const __CFAllocator *a1, const __CFString *a2)
{
  CFUUIDRef v4 = sub_100004EF8(a1, a2);
  if (!v4)
  {
    CFIndex v5 = sub_1000048F8(a1, a2);
    if (v5)
    {
      CFURLRef v6 = v5;
      if (CFDataGetLength(v5) == 8)
      {
        if (*(void *)CFDataGetBytePtr(v6))
        {
          CFURLRef v7 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorDefault,  0xB3u,  0xE2u,  0xFu,  0x39u,  0xF2u,  0x92u,  0x11u,  0xD6u,  0x97u,  0xA4u,  0,  0x30u,  0x65u,  0x43u,  0xECu,  0xACu);
          CFStringRef v8 = sub_100004DB4(a1, v7, v6);
        }

        else
        {
          CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0LL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
          CFStringRef v8 = (const __CFUUID *)CFRetain(v9);
        }

        CFUUIDRef v4 = v8;
      }

      else
      {
        CFUUIDRef v4 = 0LL;
      }

      CFRelease(v6);
    }

    else
    {
      return 0LL;
    }
  }

  return v4;
}

uint64_t sub_100007EF4(uint64_t a1, CFURLRef bundleURL)
{
  CFDictionaryRef v4 = CFBundleCopyInfoDictionaryInDirectory(bundleURL);
  if (!v4) {
    return 0LL;
  }
  CFDictionaryRef v5 = v4;
  CFURLRef v6 = CFURLCopyAbsoluteURL(bundleURL);
  if (v6)
  {
    CFURLRef v7 = v6;
    uint64_t v8 = sub_100007F74(a1, v6, v5);
    CFRelease(v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

uint64_t sub_100007F74(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t Instance = _CFRuntimeCreateInstance(a1, qword_100020988, 16LL, 0LL);
  if (Instance)
  {
    *(void *)(Instance + 16) = CFRetain(a2);
    *(void *)(Instance + 24) = CFRetain(a3);
  }

  return Instance;
}

uint64_t sub_100007FD4(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  Value = (const __CFString *)CFDictionaryGetValue(theDict, kCFBundleNameKey);
  if (!Value) {
    return 0LL;
  }
  CFURLRef v5 = CFURLCreateWithFileSystemPath(a1, Value, kCFURLPOSIXPathStyle, 0);
  if (!v5) {
    return 0LL;
  }
  CFURLRef v6 = v5;
  uint64_t v7 = sub_100007F74((uint64_t)a1, v5, theDict);
  CFRelease(v6);
  return v7;
}

const void *sub_10000805C(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
}

const void *sub_100008070(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSMediaTypes");
}

const void *sub_100008080(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSIsFSModule");
}

uint64_t sub_100008090()
{
  return qword_100020988;
}

uint64_t sub_10000809C()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_10001CB30);
  qword_100020988 = result;
  return result;
}

void sub_1000080C0( uint64_t a1, const __CFURL *a2, int a3, const __CFURL *a4, uid_t a5, gid_t a6, void (*a7)(uint64_t, uint64_t), void (*a8)(uint64_t, uint64_t))
{
}

void sub_1000080E4( uint64_t a1, const __CFURL *a2, int a3, const __CFURL *a4, uid_t a5, gid_t a6, int a7, void (*a8)(uint64_t, uint64_t), void (*a9)(uint64_t, uint64_t), CFStringRef appendedString, uint64_t a11)
{
  CFURLRef v17 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/sbin/mount", kCFURLPOSIXPathStyle, 0);
  if (!v17)
  {
    uint64_t v26 = 45LL;
    if (!a8) {
      return;
    }
    goto LABEL_24;
  }

  CFURLRef v18 = v17;
  CFNumberRef v19 = (void (**)(uint64_t, uint64_t))malloc(0x40uLL);
  if (!v19)
  {
    CFRelease(v18);
    uint64_t v26 = 12LL;
    if (!a8) {
      return;
    }
LABEL_24:
    a8(v26, (uint64_t)a9);
    return;
  }

  CFBooleanRef v20 = v19;
  CFStringRef v21 = CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
  if (!v21)
  {
    CFRelease(v18);
    uint64_t v26 = 22LL;
    goto LABEL_23;
  }

  CFStringRef v22 = v21;
  if (a4)
  {
    CFStringRef v31 = CFURLCopyFileSystemPath(a4, kCFURLPOSIXPathStyle);
    if (!v31)
    {
      CFStringRef v23 = 0LL;
      CFMutableStringRef Mutable = 0LL;
      char v25 = 0;
      uint64_t v26 = 22LL;
      goto LABEL_18;
    }
  }

  else
  {
    CFStringRef v31 = 0LL;
  }

  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  if (Mutable)
  {
    CFUUIDRef v32 = (const __CFString **)&a11;
    CFStringRef v27 = appendedString;
    if (appendedString)
    {
      do
      {
        CFStringAppend(Mutable, v27);
        CFStringAppend(Mutable, @",");
        unsigned int v28 = v32++;
        CFStringRef v27 = *v28;
      }

      while (*v28);
    }

    CFStringTrim(Mutable, @",");
    *CFBooleanRef v20 = a8;
    v20[1] = a9;
    CFStringGetLength(Mutable);
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
    CFStringRef v23 = v31;
    sub_10000586C( v18,  0,  a5,  a6,  -1,  (void (*)(uint64_t, void, uint64_t))sub_100008360,  (uint64_t)v20,  v30,  (uint64_t)@"-t",  (uint64_t)Value);
    uint64_t v26 = 0LL;
    char v25 = 1;
  }

  else
  {
    char v25 = 0;
    uint64_t v26 = 12LL;
    CFStringRef v23 = v31;
  }

LABEL_18:
  CFRelease(v18);
  CFRelease(v22);
  if (v23) {
    CFRelease(v23);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if ((v25 & 1) == 0)
  {
LABEL_23:
    free(v20);
    if (!a8) {
      return;
    }
    goto LABEL_24;
  }

uint64_t sub_100008358()
{
  return 0LL;
}

void sub_100008360(uint64_t a1, int a2, void *a3)
{
  if (*a3) {
    ((void (*)(uint64_t, void))*a3)(a1, a3[1]);
  }
  free(a3);
}

void sub_100008390( uint64_t a1, CFURLRef url, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, void, void, void, void, uint64_t), uint64_t a6, int a7)
{
  CFStringRef PathComponent = CFURLCopyLastPathComponent(url);
  if (!PathComponent)
  {
    uint64_t v27 = 22LL;
    goto LABEL_17;
  }

  uint64_t v12 = PathComponent;
  Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSPersonalities");
  if (!Value
    || (char v14 = (const __CFDictionary *)sub_100004B58(Value)) == 0LL
    || (io_object_t v15 = v14,
        (io_object_t v16 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSMediaTypes")) == 0LL)
    || (CFURLRef v17 = (const __CFDictionary *)sub_100004B58(v16)) == 0LL
    || (CFURLRef v18 = (const __CFString *)CFDictionaryGetValue(v17, @"FSProbeExecutable")) == 0LL
    || (CFURLRef v19 = sub_100004818(*(const __CFURL **)(a1 + 16), v18)) == 0LL)
  {
    uint64_t v27 = 45LL;
LABEL_15:
    CFRelease(v12);
    goto LABEL_17;
  }

  CFBooleanRef v20 = v19;
  CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(v15, @"FSRepairExecutable");
  CFURLRef v22 = 0LL;
  if (a7 && v21 && (CFURLRef v22 = sub_100004818(*(const __CFURL **)(a1 + 16), v21)) == 0LL)
  {
    uint64_t v27 = 45LL;
  }

  else
  {
    CFStringRef v23 = sub_100004FFC(url, kCFURLPOSIXPathStyle);
    if (v23)
    {
      int v24 = v23;
      char v25 = malloc(0x58uLL);
      if (v25)
      {
        void *v25 = a5;
        v25[1] = a6;
        v25[2] = v12;
        v25[3] = v24;
        v25[4] = v20;
        v25[5] = v22;
        *((_DWORD *)v25 + 12) = -1;
        v25[8] = 0LL;
        v25[9] = 0LL;
        v25[7] = 0LL;
        v25[10] = -1LL;
        sub_10000586C( v20,  1,  0,  0,  -1,  (void (*)(uint64_t, void, uint64_t))sub_10000859C,  (uint64_t)v25,  v26,  (uint64_t)@"-p",  (uint64_t)v12);
        return;
      }

      CFRelease(v12);
      uint64_t v27 = 12LL;
      uint64_t v12 = v24;
    }

    else
    {
      uint64_t v27 = 22LL;
    }
  }

  CFRelease(v12);
  CFRelease(v20);
  uint64_t v12 = v22;
  if (v22) {
    goto LABEL_15;
  }
LABEL_17:
  if (a5) {
    a5(v27, 0LL, 0LL, 0LL, 0LL, a6);
  }
}

void sub_10000859C( uint64_t a1, const __CFData *a2, unsigned int *data, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a1 != -1) {
    goto LABEL_2;
  }
  if (a2)
  {
    CFUUIDRef v9 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, a2, 0x8000100u);
    if (v9)
    {
      CFDataRef v10 = v9;
      if (CFStringGetLength(v9))
      {
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, v10);
        *((void *)data + 7) = MutableCopy;
        if (MutableCopy) {
          CFStringTrim(MutableCopy, @"\n");
        }
      }

      CFRelease(v10);
    }
  }

  int v12 = data[20];
  if (v12 < 0)
  {
    CFStringRef v14 = 0LL;
  }

  else
  {
    CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"/dev/fd/%d", data[20]);
    if (!v13)
    {
      a1 = 12LL;
LABEL_2:
      sub_100008F30(a1, (CFTypeRef *)data);
      return;
    }

    CFStringRef v14 = v13;
    int v12 = data[20];
  }

  uint64_t v15 = (uint64_t)v14;
  if (v12 == -1) {
    uint64_t v15 = *((void *)data + 2);
  }
  sub_10000586C( *((const __CFURL **)data + 4),  1,  0,  0,  v12,  (void (*)(uint64_t, void, uint64_t))sub_100008DDC,  (uint64_t)data,  a8,  (uint64_t)@"-k",  v15);
  if (v14) {
    CFRelease(v14);
  }
}

void sub_1000086DC( uint64_t a1, const __CFURL *a2, const __CFString *a3, void (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  uint64_t v15 = 0LL;
  __int128 v14 = xmmword_10001BA10;
  LOWORD(v14) = 5;
  CFUUIDRef v9 = (char *)malloc(0x408uLL);
  if (v9)
  {
    CFDataRef v10 = v9;
    CFBooleanRef v11 = sub_100009498(a2);
    if (v11)
    {
      int v12 = (char *)v11;
      if (CFStringGetCString(a3, v10 + 8, 1024LL, 0x8000100u))
      {
        *(_DWORD *)CFDataRef v10 = 8;
        *((_DWORD *)v10 + 1) = strlen(v10 + 8) + 1;
        uint64_t v13 = setattrlist(v12, &v14, v10, 0x408uLL, 0);
        if ((_DWORD)v13 == -1) {
          uint64_t v13 = *__error();
        }
      }

      else
      {
        uint64_t v13 = 22LL;
      }

      free(v10);
      free(v12);
    }

    else
    {
      free(v10);
      uint64_t v13 = 22LL;
    }
  }

  else
  {
    uint64_t v13 = 12LL;
  }

  if (a4) {
    a4(v13, a5);
  }
}

void sub_1000087F8( uint64_t a1, const __CFURL *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  uint64_t v8 = sub_100004FFC(a2, kCFURLPOSIXPathStyle);
  if (!v8)
  {
    uint64_t v20 = 22LL;
    goto LABEL_12;
  }

  CFUUIDRef v9 = v8;
  Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FSPersonalities");
  if (!Value
    || (CFBooleanRef v11 = (const __CFDictionary *)sub_100004B58(Value)) == 0LL
    || (int v12 = (const __CFString *)CFDictionaryGetValue(v11, @"FSRepairExecutable")) == 0LL
    || (CFURLRef v13 = sub_100004818(*(const __CFURL **)(a1 + 16), v12)) == 0LL)
  {
    CFRelease(v9);
    uint64_t v20 = 45LL;
    goto LABEL_12;
  }

  __int128 v14 = v13;
  io_object_t v16 = malloc(0x40uLL);
  if (!v16)
  {
    char v19 = 0;
    CFStringRef v18 = 0LL;
    goto LABEL_16;
  }

  void *v16 = a4;
  v16[1] = a5;
  if ((_DWORD)a3 == -1)
  {
    CFStringRef v18 = 0LL;
    CFStringRef v17 = v9;
  }

  else
  {
    CFStringRef v17 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"/dev/fd/%d", a3);
    CFStringRef v18 = v17;
    if (!v17)
    {
      char v19 = 0;
LABEL_16:
      uint64_t v20 = 12LL;
      goto LABEL_19;
    }
  }

  sub_10000586C( v14,  0,  0,  0,  a3,  (void (*)(uint64_t, void, uint64_t))sub_100008360,  (uint64_t)v16,  v15,  (uint64_t)@"-y",  (uint64_t)v17);
  uint64_t v20 = 0LL;
  char v19 = 1;
LABEL_19:
  CFRelease(v14);
  CFRelease(v9);
  if (v18) {
    CFRelease(v18);
  }
  CFStringRef v21 = a4;
  if ((v19 & 1) == 0)
  {
    if (!v16)
    {
LABEL_13:
      if (v21) {
        v21(v20, a5);
      }
      return;
    }

    free(v16);
LABEL_12:
    CFStringRef v21 = a4;
    goto LABEL_13;
  }

void sub_1000089AC( uint64_t a1, const __CFURL *a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t))
{
  CFURLRef v6 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/sbin/quotacheck", kCFURLPOSIXPathStyle, 0);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = (void (**)(uint64_t, uint64_t))malloc(0x40uLL);
    if (v8)
    {
      CFUUIDRef v9 = v8;
      if (a2)
      {
        CFStringRef v10 = CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
        if (v10)
        {
          CFStringRef v12 = v10;
          CFStringRef v9 = a3;
          v9[1] = a4;
          sub_10000586C( v7,  0,  0,  0,  -1,  (void (*)(uint64_t, void, uint64_t))sub_100008360,  (uint64_t)v9,  v11,  (uint64_t)@"-g",  (uint64_t)@"-u");
          CFRelease(v7);
          CFRelease(v12);
          return;
        }
      }

      CFRelease(v7);
      free(v9);
      uint64_t v13 = 22LL;
    }

    else
    {
      CFRelease(v7);
      uint64_t v13 = 12LL;
    }
  }

  else
  {
    uint64_t v13 = 45LL;
  }

  if (a3) {
    a3(v13, (uint64_t)a4);
  }
}

void sub_100008AE0( int a1, const __CFURL *a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), int a5, int a6, int a7, int a8)
{
}

void sub_100008B00( int a1, const __CFURL *a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), int a5, int a6, int a7, int a8, CFTypeRef cf1, uint64_t a10)
{
  CFURLRef v12 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/sbin/umount", kCFURLPOSIXPathStyle, 0);
  if (v12)
  {
    uint64_t v13 = v12;
    __int128 v14 = (void (**)(uint64_t, uint64_t))malloc(0x40uLL);
    if (v14)
    {
      uint64_t v15 = v14;
      CFStringRef v16 = CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
      if (v16)
      {
        CFStringRef v18 = v16;
        int v24 = (CFTypeRef *)&a10;
        CFTypeRef v19 = cf1;
        if (cf1)
        {
          int v20 = 0;
          do
          {
            if (CFEqual(v19, @"force")) {
              int v20 = 0x80000;
            }
            CFStringRef v21 = v24++;
            CFTypeRef v19 = *v21;
          }

          while (*v21);
          *uint64_t v15 = a3;
          v15[1] = a4;
          if ((v20 & 0x80000) != 0)
          {
            sub_10000586C( v13,  0,  0,  0,  -1,  (void (*)(uint64_t, void, uint64_t))sub_100008360,  (uint64_t)v15,  v17,  (uint64_t)@"-f",  (uint64_t)v18);
LABEL_18:
            CFRelease(v13);
            CFRelease(v18);
            return;
          }
        }

        else
        {
          *uint64_t v15 = a3;
          v15[1] = a4;
        }

        sub_10000586C( v13,  0,  0,  0,  -1,  (void (*)(uint64_t, void, uint64_t))sub_100008360,  (uint64_t)v15,  v17,  (uint64_t)v18,  0LL);
        goto LABEL_18;
      }

      CFRelease(v13);
      free(v15);
      uint64_t v22 = 22LL;
    }

    else
    {
      CFRelease(v13);
      uint64_t v22 = 12LL;
    }
  }

  else
  {
    uint64_t v22 = 45LL;
  }

  if (a3) {
    a3(v22, (uint64_t)a4);
  }
}

void sub_100008C8C(uint64_t a1, void *a2)
{
  if (*a2) {
    ((void (*)(uint64_t, void))*a2)(a1, a2[1]);
  }
  CFAllocatorRef v3 = (const void *)a2[6];
  if (v3) {
    CFRelease(v3);
  }
  CFDictionaryRef v4 = (const void *)a2[2];
  if (v4) {
    CFRelease(v4);
  }
  CFURLRef v5 = (const void *)a2[4];
  if (v5) {
    CFRelease(v5);
  }
  CFURLRef v6 = (const void *)a2[5];
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)a2[7];
  if (v7) {
    CFRelease(v7);
  }
  free(a2);
}

void sub_100008CF8(uint64_t a1)
{
  size_t v2 = *(const void **)(a1 + 16);
  if (v2) {
    CFRelease(v2);
  }
  CFAllocatorRef v3 = *(const void **)(a1 + 24);
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t sub_100008D34(uint64_t a1, uint64_t a2)
{
  return CFEqual(*(CFTypeRef *)(a1 + 16), *(CFTypeRef *)(a2 + 16));
}

CFHashCode sub_100008D40(uint64_t a1)
{
  return CFHash(*(CFTypeRef *)(a1 + 16));
}

CFStringRef sub_100008D48(uint64_t a1)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@", *(void *)(a1 + 16));
}

CFStringRef sub_100008D88(void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"<DAFileSystem %p [%p]>{id = %@}", a1, v2, a1[2]);
}

void sub_100008DDC( int a1, const __CFData *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == -3)
  {
    if (a2)
    {
      CFUUIDRef v9 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, a2, 0x8000100u);
      if (v9)
      {
        CFStringRef v10 = v9;
        *(void *)(a3 + 72) = sub_100004EF8(kCFAllocatorDefault, v9);
        CFRelease(v10);
      }
    }
  }

  uint64_t v11 = *(void *)(a3 + 40);
  if (v11)
  {
    unsigned int v12 = *(_DWORD *)(a3 + 80);
    int v13 = *(_DWORD *)(a3 + 84);
    if ((v12 & 0x80000000) != 0 && v13 < 0)
    {
      sub_10000586C( (const __CFURL *)v11,  0,  0,  0,  -1,  sub_100008FD0,  a3,  a8,  (uint64_t)@"-q",  *(void *)(a3 + 24));
      return;
    }

    if (v13 >= 0) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v12;
    }
    CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"/dev/fd/%d", v14);
    if (v15)
    {
      CFStringRef v17 = v15;
      sub_10000586C( *(const __CFURL **)(a3 + 40),  0,  0,  0,  v14,  sub_100008FD0,  a3,  v16,  (uint64_t)@"-q",  (uint64_t)v15);
      CFRelease(v17);
      return;
    }

    uint64_t v11 = 12LL;
  }

  sub_100008FD0(v11, (uint64_t)a2, a3);
}

void sub_100008F30(uint64_t a1, CFTypeRef *a2)
{
  if (*a2) {
    ((void (*)(void))*a2)();
  }
  CFRelease(a2[2]);
  CFRelease(a2[3]);
  CFRelease(a2[4]);
  CFTypeRef v3 = a2[5];
  if (v3) {
    CFRelease(v3);
  }
  CFTypeRef v4 = a2[7];
  if (v4) {
    CFRelease(v4);
  }
  CFTypeRef v5 = a2[8];
  if (v5) {
    CFRelease(v5);
  }
  CFTypeRef v6 = a2[9];
  if (v6) {
    CFRelease(v6);
  }
  free(a2);
}

void sub_100008FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 48) = a1;
  sub_100009F4C(" fsck status %d %@", a1, *(void *)(a3 + 24));
  *(void *)(a3 + 64) = _FSCopyNameForVolumeFormatAtNode(*(const __CFString **)(a3 + 24));
  sub_100008F30(0LL, (CFTypeRef *)a3);
}

uint64_t sub_100009020(const char *a1, void *a2, int a3)
{
  int v6 = getfsstat(0LL, 0, 2);
  if (v6 < 1) {
    return 0xFFFFFFFFLL;
  }
  int v7 = 2168 * v6;
  uint64_t v8 = (statfs *)malloc(2168LL * v6);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  CFUUIDRef v9 = v8;
  int v10 = getfsstat(v8, v7, a3);
  if (v10 < 1)
  {
    uint64_t v13 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v11 = v10;
    f_mntonname = v9->f_mntonname;
    uint64_t v13 = 0xFFFFFFFFLL;
    do
    {
      if (!strcmp(f_mntonname, a1))
      {
        memcpy(a2, f_mntonname - 88, 0x878uLL);
        int v14 = *((_DWORD *)f_mntonname - 8);
        uint64_t v13 = 0LL;
        if (v14 == geteuid()) {
          break;
        }
      }

      f_mntonname += 2168;
      --v11;
    }

    while (v11);
  }

  free(v9);
  return v13;
}

uint64_t sub_100009108(const __CFArray *a1, const void *a2)
{
  v5.length = CFArrayGetCount(a1);
  v5.location = 0LL;
  return CFArrayContainsValue(a1, v5, a2);
}

BOOL sub_10000913C(const __CFArray *a1, const __CFString *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 0;
  }

  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0LL;
    BOOL v7 = 1;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID() && CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo) {
        break;
      }
      BOOL v7 = v5 > ++v6;
    }

    while (v5 != v6);
  }

  return v7;
}

void sub_1000091E0(const __CFArray *a1, const void *a2)
{
  v5.length = CFArrayGetCount(a1);
  v5.location = 0LL;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(a1, v5, a2);
  if (FirstIndexOfValue != -1) {
    CFArrayRemoveValueAtIndex(a1, FirstIndexOfValue);
  }
}

vm_address_t sub_100009234(const __CFData *a1, unsigned int *a2)
{
  vm_address_t address = 0LL;
  unsigned int Length = CFDataGetLength(a1);
  *a2 = Length;
  vm_allocate(mach_task_self_, &address, Length, 1);
  CFRange v5 = (void *)address;
  if (!address) {
    return 0LL;
  }
  BytePtr = CFDataGetBytePtr(a1);
  memmove(v5, BytePtr, *a2);
  return address;
}

CFNumberRef sub_1000092BC(const __CFDictionary *a1, const void *a2)
{
  uint64_t valuePtr = 0LL;
  uint64_t result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

void sub_1000092F0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFRange v5 = CFGetAllocator(a1);
  CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFDictionarySetValue((CFMutableDictionaryRef)a1, a2, v6);
    CFRelease(v7);
  }

CFNumberRef sub_100009354(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  return CFNumberCreate(a1, kCFNumberSInt64Type, &valuePtr);
}

CFNumberRef sub_10000937C(const __CFNumber *result)
{
  uint64_t valuePtr = 0LL;
  if (result)
  {
    unsigned int v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

UInt8 *sub_1000093D8(const __CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFIndex Length = CFStringGetLength(a1);
  v7.location = 0LL;
  v7.length = Length;
  if (!CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen)) {
    return 0LL;
  }
  CFIndex v3 = usedBufLen;
  CFTypeRef v4 = (UInt8 *)malloc(usedBufLen + 1);
  if (v4)
  {
    v8.location = 0LL;
    v8.length = Length;
    CFStringGetBytes(a1, v8, 0x8000100u, 0, 0, v4, v3, 0LL);
    v4[usedBufLen] = 0;
  }

  return v4;
}

UInt8 *sub_100009498(const __CFURL *a1)
{
  if (!a1) {
    return 0LL;
  }
  unsigned int v1 = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (!v1) {
    return 0LL;
  }
  CFTypeID v2 = v1;
  CFIndex v3 = sub_1000093D8(v1);
  CFRelease(v2);
  return v3;
}

const char *sub_1000094E0(unsigned int a1)
{
  if (a1 > 0x11) {
    return "Unknown Kind";
  }
  else {
    return off_10001CDB8[a1];
  }
}

CFMutableDataRef sub_100009504(const __CFAllocator *a1, uint64_t a2)
{
  CFMutableDataRef Mutable = CFDataCreateMutable(a1, 0LL);
  if (Mutable && !__CFBinaryPlistWriteToStream(a2, Mutable))
  {
    CFRelease(Mutable);
    return 0LL;
  }

  return Mutable;
}

CFMutableDataRef sub_100009550(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 0LL;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(a1, 0LL, theDict);
  if (!MutableCopy) {
    return 0LL;
  }
  CFRange v5 = MutableCopy;
  Value = (const __CFUUID *)CFDictionaryGetValue(theDict, @"DAMediaUUID");
  if (Value)
  {
    CFStringRef v7 = CFUUIDCreateString(a1, Value);
    if (v7)
    {
      CFStringRef v8 = v7;
      CFDictionarySetValue(v5, @"DAMediaUUID", v7);
      CFRelease(v8);
    }
  }

  CFTypeID v9 = (const __CFURL *)CFDictionaryGetValue(theDict, @"DAVolumePath");
  if (v9)
  {
    CFStringRef v10 = CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
    if (v10)
    {
      CFStringRef v11 = v10;
      CFDictionarySetValue(v5, @"DAVolumePath", v10);
      CFRelease(v11);
    }
  }

  unsigned int v12 = (const __CFUUID *)CFDictionaryGetValue(theDict, @"DAVolumeUUID");
  if (v12)
  {
    CFStringRef v13 = CFUUIDCreateString(a1, v12);
    if (v13)
    {
      CFStringRef v14 = v13;
      CFDictionarySetValue(v5, @"DAVolumeUUID", v13);
      CFRelease(v14);
    }
  }

  CFMutableDataRef v15 = sub_100009504(a1, (uint64_t)v5);
  CFRelease(v5);
  return v15;
}

CFPropertyListRef sub_10000967C(const __CFAllocator *a1, const __CFData *a2)
{
  return CFPropertyListCreateWithData(a1, a2, 0LL, 0LL, 0LL);
}

__CFDictionary *sub_10000968C(const __CFAllocator *a1, const __CFData *a2)
{
  CFIndex v3 = (const __CFDictionary *)CFPropertyListCreateWithData(a1, a2, 1uLL, 0LL, 0LL);
  CFTypeRef v4 = v3;
  if (v3)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v3, @"DAMediaUUID");
    if (Value)
    {
      CFUUIDRef v6 = CFUUIDCreateFromString(a1, Value);
      if (v6)
      {
        CFUUIDRef v7 = v6;
        CFDictionarySetValue(v4, @"DAMediaUUID", v6);
        CFRelease(v7);
      }
    }

    CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(v4, @"DAVolumePath");
    if (v8)
    {
      CFURLRef v9 = CFURLCreateWithFileSystemPath(a1, v8, kCFURLPOSIXPathStyle, 1u);
      if (v9)
      {
        CFURLRef v10 = v9;
        CFDictionarySetValue(v4, @"DAVolumePath", v9);
        CFRelease(v10);
      }
    }

    CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(v4, @"DAVolumeUUID");
    if (v11)
    {
      CFUUIDRef v12 = CFUUIDCreateFromString(a1, v11);
      if (v12)
      {
        CFUUIDRef v13 = v12;
        CFDictionarySetValue(v4, @"DAVolumeUUID", v12);
        CFRelease(v13);
      }
    }
  }

  return v4;
}

__CFDictionary *sub_1000097A0(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  if (!a2) {
    return 0LL;
  }
  CFTypeRef v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, kCFAllocatorNull);
  if (!v4) {
    return 0LL;
  }
  CFRange v5 = v4;
  CFUUIDRef v6 = sub_10000968C(a1, v4);
  CFRelease(v5);
  return v6;
}

CFPropertyListRef sub_1000097FC(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  if (!a2) {
    return 0LL;
  }
  CFTypeRef v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, kCFAllocatorNull);
  if (!v4) {
    return 0LL;
  }
  CFRange v5 = v4;
  CFPropertyListRef v6 = CFPropertyListCreateWithData(a1, v4, 0LL, 0LL, 0LL);
  CFRelease(v5);
  return v6;
}

char *sub_100009864(uint64_t a1)
{
  if (!strcmp((const char *)(a1 + 72), "lifs")
    && (__strlcpy_chk(v5, a1 + 1112, 1024LL, 1024LL), !sub_100009958(v5, v4, 1024)))
  {
    asprintf(&v3, "/dev/%s");
  }

  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    asprintf(&v3, "%s");
  }

  else
  {
    asprintf(&v3, "%s?owner=%u");
  }

  return v3;
}

uint64_t sub_100009958(const char *a1, char *a2, int a3)
{
  CFRange v5 = strstr(a1, "://");
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  CFPropertyListRef v6 = v5 + 3;
  CFUUIDRef v7 = strrchr(v5 + 3, 47);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  char *v7 = 0;
  strlcpy(a2, v6, a3);
  return 0LL;
}

char *sub_1000099C4(uint64_t a1)
{
  if (!strcmp((const char *)(a1 + 72), "lifs")
    && (__strlcpy_chk(v4, a1 + 1112, 1024LL, 1024LL), !sub_100009958(v4, v3, 1024)))
  {
    snprintf(byte_100020990, 0x411uLL, "/dev/%s");
  }

  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    snprintf(byte_100020990, 0x411uLL, "%s");
  }

  else
  {
    snprintf(byte_100020990, 0x411uLL, "%s?owner=%u");
  }

  return byte_100020990;
}

uint64_t sub_100009AD4(uint64_t a1, char *a2, int a3)
{
  CFRange v5 = strstr(__big, "://");
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  CFPropertyListRef v6 = v5 + 3;
  CFUUIDRef v7 = strrchr(v5 + 3, 47);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  char *v7 = 0;
  strlcpy(a2, "/dev/", a3);
  strlcat(a2, v6, a3);
  return 0LL;
}

void sub_100009BA4(char *cStr, ...)
{
}

void sub_100009BD4(int a1, char *cStr, va_list a3)
{
  if (a3) {
    CFTypeRef v4 = (const char *)sub_100004BB4(cStr, a3);
  }
  else {
    CFTypeRef v4 = strdup(cStr);
  }
  CFRange v5 = (char *)v4;
  if (v4)
  {
    switch(a1)
    {
      case 3:
        CFURLRef v9 = (os_log_s *)qword_100020DD0;
        if (os_log_type_enabled((os_log_t)qword_100020DD0, OS_LOG_TYPE_ERROR)) {
          sub_100018078((uint64_t)v5, v9);
        }
        goto LABEL_24;
      case 6:
        if (byte_100020DA8 && qword_100020DB0) {
          sub_10000A014(v4);
        }
        uint64_t v10 = qword_100020DD0;
        if (!os_log_type_enabled((os_log_t)qword_100020DD0, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        int v11 = 136446210;
        CFUUIDRef v12 = v5;
        break;
      case 7:
        if (byte_100020DA8)
        {
          if (qword_100020DB0) {
            sub_10000A014(v4);
          }
        }

        uint64_t v6 = qword_100020DD0;
        if (!os_log_type_enabled((os_log_t)qword_100020DD0, OS_LOG_TYPE_INFO)) {
          goto LABEL_24;
        }
        int v11 = 136446210;
        CFUUIDRef v12 = v5;
        CFUUIDRef v7 = (os_log_s *)v6;
        os_log_type_t v8 = OS_LOG_TYPE_INFO;
        goto LABEL_23;
      default:
        uint64_t v10 = qword_100020DD0;
        if (!os_log_type_enabled((os_log_t)qword_100020DD0, OS_LOG_TYPE_DEFAULT))
        {
LABEL_24:
          free(v5);
          return;
        }

        int v11 = 136446210;
        CFUUIDRef v12 = v5;
        break;
    }

    CFUUIDRef v7 = (os_log_s *)v10;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}s", (uint8_t *)&v11, 0xCu);
    goto LABEL_24;
  }

void sub_100009D9C()
{
  byte_100020DA8 = 0;
  if (qword_100020DB0)
  {
    fclose((FILE *)qword_100020DB0);
    qword_100020DB0 = 0LL;
  }

  closelog();
}

void sub_100009DD0(char *cStr, ...)
{
  if (byte_100020DB8 == 1)
  {
    CFTypeID v2 = (char *)qword_100020DC0;
    if (!qword_100020DC0) {
      sub_1000180EC();
    }
    if (qword_100020DC8) {
      free((void *)qword_100020DC8);
    }
    qword_100020DC8 = (uint64_t)v2;
    qword_100020DC0 = 0LL;
    byte_100020DB8 = 0;
    sub_100009BD4(7, v2, 0LL);
  }

  sub_100009BD4(7, cStr, va);
}

void sub_100009E68(char *cStr, ...)
{
  if (qword_100020DC0)
  {
    free((void *)qword_100020DC0);
    qword_100020DC0 = 0LL;
    byte_100020DB8 = 0;
  }

  if (cStr)
  {
    CFTypeID v2 = sub_100004BB4(cStr, va);
    if (v2)
    {
      CFIndex v3 = v2;
      if (qword_100020DC8 && !strcmp((const char *)qword_100020DC8, (const char *)v2))
      {
        free(v3);
      }

      else
      {
        qword_100020DC0 = (uint64_t)v3;
        byte_100020DB8 = 1;
      }
    }
  }

void sub_100009EFC(char *cStr, ...)
{
}

void sub_100009F4C(char *cStr, ...)
{
}

void sub_100009F7C(const char *a1, int a2)
{
  qword_100020DD0 = (uint64_t)os_log_create("com.apple.DiskArbitration.diskarbitrationd", "default");
  openlog(a1, 1, 24);
  if (a2)
  {
    asprintf(&__filename, "/var/log/%s.log", a1);
    if (__filename)
    {
      qword_100020DB0 = (uint64_t)fopen(__filename, "a");
      free(__filename);
    }
  }

  byte_100020DA8 = a2;
}

uint64_t sub_10000A014(const char *a1)
{
  time_t v4 = time(0LL);
  CFTypeID v2 = localtime(&v4);
  if (strftime(v5, 0xAuLL, "%T ", v2)) {
    fputs(v5, (FILE *)qword_100020DB0);
  }
  fputs(a1, (FILE *)qword_100020DB0);
  fputc(10, (FILE *)qword_100020DB0);
  return fflush((FILE *)qword_100020DB0);
}

void start(int a1, char **a2)
{
  qword_100020F28 = (uint64_t)basename(*a2);
  if (!geteuid())
  {
    while (1)
    {
      int v4 = getopt(a1, a2, "d") << 24;
      if (v4 != 1677721600) {
        break;
      }
      byte_100020DD8 = 1;
    }

    if (v4 == -16777216)
    {
      signal(15, (void (__cdecl *)(int))sub_10000A1EC);
      CFRange v5 = (dispatch_queue_s *)sub_100012A30();
      dispatch_async_and_wait_f(v5, 0LL, (dispatch_function_t)sub_10000A204);
      dispatch_main();
    }

    fprintf(__stderrp, "%s: [-d]\n", (const char *)qword_100020F28);
    fwrite("options:\n", 9uLL, 1uLL, __stderrp);
    fwrite("\t-d\tenable debugging\n", 0x15uLL, 1uLL, __stderrp);
    exit(64);
  }

  fprintf(__stderrp, "%s: permission denied.\n", (const char *)qword_100020F28);
  exit(77);
}

uint64_t sub_10000A1EC(uint64_t result)
{
  if ((_DWORD)result == 15) {
    byte_100020ED0 = 1;
  }
  return result;
}

uint64_t sub_10000A204()
{
  qword_100020EA8 = (uint64_t)CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/System/Library/Frameworks/DiskArbitration.framework",  kCFURLPOSIXPathStyle,  1u);
  if (!qword_100020EA8) {
    sub_100018114();
  }
  sub_100009F7C((const char *)qword_100020F28, byte_100020DD8);
  dword_100020F20 = getpid();
  asprintf((char **)&qword_100020F30, "%s [%d]", (const char *)qword_100020F28, dword_100020F20);
  if (!qword_100020F30) {
    sub_10001813C();
  }
  qword_100020EC8 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!qword_100020EC8) {
    sub_100018164();
  }
  qword_100020ED8 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!qword_100020ED8) {
    sub_10001818C();
  }
  qword_100020EE0 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!qword_100020EE0) {
    sub_1000181B4();
  }
  qword_100020F00 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!qword_100020F00) {
    sub_1000181DC();
  }
  qword_100020F08 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!qword_100020F08) {
    sub_100018204();
  }
  qword_100020F10 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!qword_100020F10) {
    sub_10001822C();
  }
  qword_100020F18 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!qword_100020F18) {
    sub_100018254();
  }
  qword_100020F38 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!qword_100020F38) {
    sub_10001827C();
  }
  qword_100020F40 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!qword_100020F40) {
    sub_1000182A4();
  }
  qword_100020F48 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!qword_100020F48) {
    sub_1000182CC();
  }
  qword_100020F50 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!qword_100020F50) {
    sub_1000182F4();
  }
  sub_100012AA8();
  IONotificationPortRef v0 = IONotificationPortCreate(kIOMainPortDefault);
  qword_100020EF8 = (uint64_t)v0;
  if (!v0)
  {
    sub_100009EFC("could not create I/O Kit notification port.");
    goto LABEL_45;
  }

  unsigned int v1 = v0;
  CFTypeID v2 = (dispatch_queue_s *)sub_100012A30();
  IONotificationPortSetDispatchQueue(v1, v2);
  if (!sub_100008058())
  {
    sub_100009EFC("could not create file system run loop channel.");
    goto LABEL_45;
  }

  if (!sub_1000152E8())
  {
    sub_100009EFC("could not create thread run loop channel.");
    goto LABEL_45;
  }

  CFIndex v3 = (IONotificationPort *)qword_100020EF8;
  int v4 = IOServiceMatching("IOMedia");
  IOServiceAddMatchingNotification( v3,  "IOServiceTerminate",  v4,  (IOServiceMatchingCallback)sub_100010968,  0LL,  (io_iterator_t *)&dword_100020EF0);
  if (!dword_100020EF0)
  {
    sub_100009EFC("could not create media disappeared notification.");
    goto LABEL_45;
  }

  CFRange v5 = (IONotificationPort *)qword_100020EF8;
  uint64_t v6 = IOServiceMatching("IOMedia");
  IOServiceAddMatchingNotification( v5,  "IOServiceMatched",  v6,  (IOServiceMatchingCallback)sub_10001000C,  0LL,  (io_iterator_t *)&dword_100020EEC);
  if (!dword_100020EEC)
  {
    sub_100009EFC("could not create media appeared notification.");
LABEL_45:
    exit(70);
  }

  CFUUIDRef v7 = (dispatch_queue_s *)sub_100012A30();
  os_log_type_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vfs, 0LL, 0x118uLL, v7);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_10000A70C;
  handler[3] = &unk_10001CE48;
  handler[4] = v8;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(v8);
  snprintf(__str, 0x400uLL, "/var/run/%s.pid", (const char *)qword_100020F28);
  CFURLRef v9 = fopen(__str, "w");
  if (v9)
  {
    uint64_t v10 = v9;
    fprintf(v9, "%d\n", dword_100020F20);
    fclose(v10);
  }

  sub_100009F4C((char *)&unk_10001A20A);
  sub_100009F4C("server has been started.");
  if (qword_100020EB0) {
    sub_100009F4C("  console user = %@ [%d].", qword_100020EB0, dword_100020EBC);
  }
  else {
    sub_100009F4C("  console user = none.", v13, v14);
  }
  sub_100014A38();
  sub_1000140FC();
  sub_100014438();
  sub_10001483C();
  sub_100010968(0LL, dword_100020EF0);
  sub_10001000C(0, dword_100020EEC);
  int v11 = (dispatch_queue_s *)sub_100012A30();
  xpc_set_event_stream_handler("com.apple.iokit.matching", v11, &stru_10001CE88);
  return notify_post("com.apple.diskarbitrationd.launched");
}

void sub_10000A70C(uint64_t a1)
{
  __int16 data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  __int16 v2 = data;
  if ((data & 8) != 0)
  {
    sub_100012870();
    if ((v2 & 0x10) == 0)
    {
LABEL_3:
      if ((v2 & 0x100) == 0) {
        return;
      }
LABEL_7:
      sub_1000129A8();
      return;
    }
  }

  else if ((data & 0x10) == 0)
  {
    goto LABEL_3;
  }

  sub_1000129A8();
  if ((v2 & 0x100) != 0) {
    goto LABEL_7;
  }
}

void sub_10000A758(id a1, void *a2)
{
}

void sub_10000A764( uint64_t a1, const void *a2, void (*a3)(void, void, void), uint64_t a4, int a5, int a6, int a7, int a8)
{
}

void sub_10000A784( uint64_t a1, const void *a2, void (*a3)(void, void, void), uint64_t a4, int a5, int a6, int a7, int a8, const __CFString *cf1, uint64_t a10)
{
  uint64_t v14 = sub_100007510(a1);
  if (a2) {
    CFRetain(a2);
  }
  CFMutableDataRef v15 = (BOOL *)malloc(0x68uLL);
  if (!v15)
  {
    CFMutableStringRef Mutable = 0LL;
    uint64_t v22 = 12LL;
    if (a2) {
      goto LABEL_91;
    }
    goto LABEL_92;
  }

  uint64_t v16 = v15;
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  if (!Mutable)
  {
    uint64_t v22 = 12LL;
    goto LABEL_90;
  }

  uint64_t v86 = a4;
  uint64_t v87 = v14;
  v88 = (const void *)a1;
  v85 = a3;
  CFStringRef v18 = kCFBooleanTrue;
  v91 = (const __CFString **)&a10;
  CFTypeRef v19 = cf1;
  if (cf1)
  {
    CFBooleanRef v89 = 0LL;
    int v20 = 0;
    do
    {
      if (CFEqual(v19, @"force"))
      {
        int v20 = 1;
      }

      else if (CFEqual(v19, @"automatic"))
      {
        CFStringRef v18 = 0LL;
        CFBooleanRef v89 = kCFBooleanTrue;
      }

      else
      {
        CFStringAppend(Mutable, v19);
        CFStringAppend(Mutable, @",");
      }

      CFStringRef v21 = v91++;
      CFTypeRef v19 = *v21;
    }

    while (*v21);
  }

  else
  {
    int v20 = 0;
    CFBooleanRef v89 = 0LL;
  }

  CFStringTrim(Mutable, @",");
  BOOL *v16 = v18 == 0LL;
  a4 = v86;
  if (sub_100007500(a1, @"DADeviceTDMLocked") == kCFBooleanTrue
    && (!sub_100014F94(a1, 16) || !sub_10000B638(a1, @"PreBoot")))
  {
    uint64_t v22 = 1LL;
    goto LABEL_89;
  }

  if (!v18)
  {
    if (sub_100014F94(a1, 16))
    {
      int v23 = sub_10000B638(a1, @"System");
      io_registry_entry_t v24 = sub_100007518(a1);
      CFTypeRef v25 = IORegistryEntrySearchCFProperty(v24, "IOService", @"Role", kCFAllocatorDefault, 0);
      if (v25) {
        CFRelease(v25);
      }
      if (v23)
      {
        CFStringInsert(Mutable, 0LL, @",");
        CFStringInsert(Mutable, 0LL, @"rdonly");
      }
    }

    if (sub_1000075C4(a1, 64))
    {
      CFStringInsert(Mutable, 0LL, @",");
      CFStringInsert(Mutable, 0LL, @"quarantine");
    }
  }

  if (sub_10000B12C(Mutable, @"update"))
  {
    if (a2) {
      goto LABEL_34;
    }
    uint64_t v26 = sub_100007500(a1, @"DAVolumePath");
    a2 = v26;
    if (!v26) {
      goto LABEL_34;
    }
    CFRetain(v26);
  }

  if (sub_10000B12C(Mutable, @"-s="))
  {
    if (!a2 || (uint64_t v27 = (uint64_t)sub_100007500(a1, @"DAVolumePath")) == 0)
    {
LABEL_34:
      uint64_t v22 = 22LL;
LABEL_89:
      a3 = v85;
      goto LABEL_90;
    }
  }

  else
  {
    uint64_t v27 = sub_100007508(a1);
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020F00);
  uint64_t v83 = v27;
  v84 = a2;
  if (Count < 1) {
    goto LABEL_63;
  }
  CFIndex v29 = Count;
  int v82 = v16;
  CFIndex v30 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F00, v30);
    if (!ValueAtIndex) {
      goto LABEL_49;
    }
    CFUUIDRef v32 = ValueAtIndex;
    Value = CFDictionaryGetValue(ValueAtIndex, @"DAProbeID");
    uint64_t v34 = CFDictionaryGetValue(v32, @"DAProbeKind");
    if (v34)
    {
      int v35 = v34;
      char v36 = sub_10000805C(v87);
      if (!CFEqual(v35, v36)) {
        goto LABEL_49;
      }
    }

    CFTypeID v37 = CFGetTypeID(Value);
    if (v37 == CFUUIDGetTypeID())
    {
      uint64_t v38 = (uint64_t)v88;
      v39 = @"DAVolumeUUID";
      goto LABEL_48;
    }

    CFTypeID v40 = CFGetTypeID(Value);
    if (v40 != CFStringGetTypeID()) {
      break;
    }
    uint64_t v38 = (uint64_t)v88;
    v39 = @"DAVolumeName";
LABEL_48:
    if (!sub_100006344(v38, v39, Value)) {
      goto LABEL_53;
    }
LABEL_49:
    if (v29 == ++v30)
    {
      uint64_t v16 = v82;
      goto LABEL_63;
    }
  }

  CFTypeID v41 = CFGetTypeID(Value);
  if (v41 != CFDictionaryGetTypeID()) {
    goto LABEL_49;
  }
  BOOLean_t matches = 0;
  io_service_t v42 = sub_100007518((uint64_t)v88);
  IOServiceMatchPropertyTable(v42, (CFDictionaryRef)Value, &matches);
  if (!matches) {
    goto LABEL_49;
  }
LABEL_53:
  if (!v18)
  {
    CFStringRef v18 = (const __CFBoolean *)CFDictionaryGetValue(v32, @"DAMountAutomatic");
    if (v18 == kCFBooleanTrue)
    {
      sub_10000795C((uint64_t)v88, 16, 1);
      sub_10000795C((uint64_t)v88, 32, 1);
      CFStringRef v18 = kCFBooleanTrue;
    }
  }

  v43 = (const __CFString *)CFDictionaryGetValue(v32, @"DAMountOptions");
  if (v43)
  {
    v44 = v43;
    CFStringInsert(Mutable, 0LL, @",");
    CFStringInsert(Mutable, 0LL, v44);
  }

  if (!a2)
  {
    CFStringRef v45 = CFDictionaryGetValue(v32, @"DAMountPath");
    if (v45)
    {
      v84 = v45;
      CFRetain(v45);
    }

    else
    {
      v84 = 0LL;
    }
  }

  uint64_t v16 = v82;
LABEL_63:
  CFIndex v46 = CFArrayGetCount((CFArrayRef)qword_100020F08);
  if (v46 >= 1)
  {
    CFIndex v47 = v46;
    CFIndex v48 = 0LL;
    while (1)
    {
      v49 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F08, v48);
      if (v49)
      {
        v50 = v49;
        CFDataRef v51 = CFDictionaryGetValue(v49, @"DAProbeID");
      }

      if (v47 == ++v48) {
        goto LABEL_71;
      }
    }

    CFDataRef v52 = (const __CFString *)CFDictionaryGetValue(v50, @"DAMountOptions");
    if (v52)
    {
      CFTypeRef v53 = v52;
      CFStringInsert(Mutable, 0LL, @",");
      CFStringInsert(Mutable, 0LL, v53);
    }
  }

LABEL_71:
  a4 = v86;
  if (!v18)
  {
    if (sub_1000075C4((uint64_t)v88, 16))
    {
      CFStringRef v18 = kCFBooleanTrue;
    }

    else
    {
      CFStringRef v18 = kCFBooleanFalse;
    }

    if (!v18)
    {
LABEL_77:
      if (sub_10000B474((uint64_t)v88, 0))
      {
        sub_100009F4C(" No console users yet, delaying mount of %@", v88);
        CFStringRef v18 = kCFBooleanFalse;
      }

      else
      {
        CFStringRef v18 = 0LL;
      }
    }
  }

  a2 = v84;
  if (v18 == kCFBooleanFalse)
  {
    uint64_t v22 = 89LL;
    goto LABEL_89;
  }

  if (sub_100007500((uint64_t)v88, @"DAMediaWritable") == kCFBooleanFalse)
  {
    CFStringInsert(Mutable, 0LL, @",");
    CFStringInsert(Mutable, 0LL, @"rdonly");
  }

  v54 = v89;
  if (!sub_10000B474((uint64_t)v88, 1))
  {
    CFStringInsert(Mutable, 0LL, @",");
    CFStringInsert(Mutable, 0LL, @"nosuid");
    CFStringInsert(Mutable, 0LL, @",");
    CFStringInsert(Mutable, 0LL, @"noowners");
    CFStringInsert(Mutable, 0LL, @",");
    CFStringInsert(Mutable, 0LL, @"nodev");
  }

  CFNumberRef v55 = sub_10000805C(v87);
  if (CFEqual(v55, @"hfs"))
  {
    sub_100004CC8(Mutable, 0LL, @"-m=%o,", v56, v57, v58, v59, v60, 237);
    else {
      char v66 = 99;
    }
    sub_100004CC8(Mutable, 0LL, @"-g=%d,", v61, v62, v63, v64, v65, v66);
    else {
      char v72 = 99;
    }
    sub_100004CC8(Mutable, 0LL, @"-u=%d,", v67, v68, v69, v70, v71, v72);
  }

  CFStringTrim(Mutable, @",");
  sub_100009F4C(" Mount options %@", Mutable);
  if ((!v89 && (v54 = kCFBooleanTrue, sub_10000B12C(Mutable, @"rdonly")) || v54 == kCFBooleanFalse)
    && (v54 = kCFBooleanFalse, sub_1000075C4((uint64_t)v88, 2))
    && !v20)
  {
    uint64_t v22 = 92LL;
    a3 = v85;
    a4 = v86;
LABEL_90:
    free(v16);
    if (a2) {
LABEL_91:
    }
      CFRelease(a2);
LABEL_92:
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (a3) {
      a3(v22, 0LL, a4);
    }
  }

  else
  {
    if (v54 == kCFBooleanTrue)
    {
      else {
        v54 = kCFBooleanFalse;
      }
    }

    CFRetain(v88);
    *((_DWORD *)v16 + 1) = 0;
    *((void *)v16 + 1) = v85;
    *((void *)v16 + 2) = v86;
    *((void *)v16 + 3) = v88;
    v16[32] = v20;
    *((void *)v16 + 5) = v84;
    *((void *)v16 + 6) = Mutable;
    *((void *)v16 + 7) = v83;
    *((void *)v16 + 8) = 0LL;
    *((_DWORD *)v16 + 18) = -1;
    if (v54 == kCFBooleanTrue)
    {
      sub_100009F4C("repaired disk, id = %@, ongoing.", v88);
      IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  @"com.apple.DiskArbitration.diskarbitrationd",  0LL,  0LL,  0LL,  0.0,  0LL,  (IOPMAssertionID *)v16 + 1);
      *((void *)v16 + 10) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      uint64_t v79 = sub_100007510((uint64_t)v88);
      uint64_t v80 = *((void *)v16 + 8);
      if (!v80) {
        uint64_t v80 = (uint64_t)v88;
      }
      v81 = (const __CFURL *)sub_100007508(v80);
      sub_1000087F8( v79,  v81,  *((unsigned int *)v16 + 18),  (void (*)(uint64_t, uint64_t))sub_10000B720,  (uint64_t)v16);
    }

    else
    {
      sub_10000B720(89LL, (uint64_t)v16, v73, v74, v75, v76, v77, v78);
    }
  }

BOOL sub_10000B12C(const __CFString *a1, CFStringRef theString)
{
  if (CFStringHasPrefix(theString, @"no"))
  {
    v28.length = CFStringGetLength(theString) - 2;
    v28.location = 2LL;
    int v4 = CFStringCreateWithSubstring(kCFAllocatorDefault, theString, v28);
    CFRange v5 = &kCFBooleanFalse;
  }

  else
  {
    int v4 = CFRetain(theString);
    CFRange v5 = &kCFBooleanTrue;
  }

  CFBooleanRef v6 = *v5;
  if (v4)
  {
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, a1, @",");
    if (ArrayBySeparatingStrings)
    {
      uint64_t v8 = ArrayBySeparatingStrings;
      uint64_t v27 = v6;
      CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        int v11 = 0LL;
        CFIndex v12 = 0LL;
        uint64_t v13 = @"-s=";
        while (1)
        {
          if (!CFArrayGetValueAtIndex(v8, v12)) {
            goto LABEL_38;
          }
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v8, v12);
          CFMutableDictionaryRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, ValueAtIndex);
          if (!MutableCopy) {
            goto LABEL_38;
          }
          uint64_t v16 = MutableCopy;
          CFStringLowercase(MutableCopy, 0LL);
          Copy = CFStringCreateCopy(kCFAllocatorDefault, v16);
          if (!Copy) {
            break;
          }
          CFStringRef v18 = Copy;
          CFTypeRef v19 = v13;
          if (!CFStringHasPrefix(Copy, @"-o"))
          {
            CFRelease(v16);
LABEL_19:
            if (CFStringHasPrefix(v18, @"no"))
            {
              v30.length = CFStringGetLength(v18) - 2;
              v30.location = 2LL;
              uint64_t v22 = CFStringCreateWithSubstring(kCFAllocatorDefault, v18, v30);
              int v23 = &kCFBooleanFalse;
              uint64_t v13 = v19;
              if (!v22) {
                goto LABEL_37;
              }
            }

            else
            {
              uint64_t v13 = v19;
              if (CFStringHasPrefix(v18, v19)) {
                io_registry_entry_t v24 = v19;
              }
              else {
                io_registry_entry_t v24 = v18;
              }
              uint64_t v22 = CFRetain(v24);
              int v23 = &kCFBooleanTrue;
              if (!v22) {
                goto LABEL_37;
              }
            }

            CFTypeRef v25 = *v23;
            if (CFEqual(v22, @"ro"))
            {
              CFRelease(v22);
              uint64_t v22 = CFRetain(@"rdonly");
            }

            if (CFEqual(v22, @"rw"))
            {
              CFRelease(v22);
              uint64_t v22 = CFRetain(@"rdonly");
              if (v25 == kCFBooleanTrue) {
                CFTypeRef v25 = kCFBooleanFalse;
              }
              else {
                CFTypeRef v25 = kCFBooleanTrue;
              }
            }

            if (v22)
            {
              if (CFEqual(v4, v22)) {
                int v11 = v25;
              }
              CFRelease(v22);
            }

            uint64_t v13 = v19;
            goto LABEL_37;
          }

          if (CFStringHasPrefix(v18, @"-o=")) {
            uint64_t v20 = 3LL;
          }
          else {
            uint64_t v20 = 2LL;
          }
          v29.length = CFStringGetLength(v18) - v20;
          v29.location = v20;
          CFStringRef v21 = CFStringCreateWithSubstring(kCFAllocatorDefault, v18, v29);
          CFRelease(v18);
          CFRelease(v16);
          CFStringRef v18 = v21;
          if (v21) {
            goto LABEL_19;
          }
          uint64_t v13 = v19;
LABEL_38:
          if (v10 == ++v12) {
            goto LABEL_43;
          }
        }

        CFStringRef v18 = v16;
LABEL_37:
        CFRelease(v18);
        goto LABEL_38;
      }

      int v11 = 0LL;
LABEL_43:
      CFRelease(v8);
      CFBooleanRef v6 = v27;
    }

    else
    {
      int v11 = 0LL;
    }

    CFRelease(v4);
  }

  else
  {
    int v11 = 0LL;
  }

  return v6 == v11;
}

uint64_t sub_10000B46C()
{
  return 0LL;
}

uint64_t sub_10000B474(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
      CFIndex v3 = (const __CFBoolean *)sub_100007500(a1, @"DAMediaRemovable");
      if (v3 == kCFBooleanTrue)
      {
        CFBooleanRef v7 = v3;
        CFRange v5 = (const __CFDictionary *)qword_100020F10;
        CFIndex v10 = (const void **)&off_10001D050;
LABEL_22:
        Value = (const __CFBoolean *)CFDictionaryGetValue(v5, *v10);
        if (!Value) {
          Value = v7;
        }
        if (Value) {
          return CFBooleanGetValue(Value);
        }
LABEL_25:
        sub_10001831C();
      }

      int v4 = (const __CFBoolean *)sub_100007500(a1, @"DADeviceInternal");
      CFRange v5 = (const __CFDictionary *)qword_100020F10;
      if (v4 == kCFBooleanTrue)
      {
        CFURLRef v9 = (const void **)&off_10001D048;
LABEL_17:
        Value = (const __CFBoolean *)CFDictionaryGetValue(v5, *v9);
        if (!Value) {
          Value = kCFBooleanFalse;
        }
        if (Value) {
          return CFBooleanGetValue(Value);
        }
        goto LABEL_25;
      }

      Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)qword_100020F10, @"DAMountDeferExternal");
      if (!Value) {
        Value = kCFBooleanTrue;
      }
      if (!Value) {
        goto LABEL_25;
      }
      return CFBooleanGetValue(Value);
    case 1:
      CFBooleanRef v7 = kCFBooleanTrue;
      if (sub_100007500(a1, @"DAMediaRemovable") == kCFBooleanTrue)
      {
        CFRange v5 = (const __CFDictionary *)qword_100020F10;
        CFURLRef v9 = (const void **)&off_10001D068;
        goto LABEL_17;
      }

      uint64_t v8 = (const __CFBoolean *)sub_100007500(a1, @"DADeviceInternal");
      CFRange v5 = (const __CFDictionary *)qword_100020F10;
      if (v8 != kCFBooleanTrue)
      {
        CFURLRef v9 = (const void **)&off_10001D058;
        goto LABEL_17;
      }

      CFIndex v10 = (const void **)&off_10001D060;
      goto LABEL_22;
    case 2:
      CFRange v5 = (const __CFDictionary *)qword_100020F10;
      CFURLRef v9 = (const void **)&off_10001D070;
      goto LABEL_17;
    default:
      Value = kCFBooleanFalse;
      if (!kCFBooleanFalse) {
        goto LABEL_25;
      }
      return CFBooleanGetValue(Value);
  }

uint64_t sub_10000B638(uint64_t a1, const __CFString *a2)
{
  io_registry_entry_t v3 = sub_100007518(a1);
  int v4 = (const __CFArray *)IORegistryEntrySearchCFProperty(v3, "IOService", @"Role", kCFAllocatorDefault, 0);
  if (!v4) {
    return 0LL;
  }
  CFRange v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFArrayGetTypeID() && (CFIndex Count = CFArrayGetCount(v5), Count >= 1))
  {
    CFIndex v8 = Count;
    CFIndex v9 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v5, v9);
      CFTypeID v11 = CFGetTypeID(ValueAtIndex);
      if (v11 == CFStringGetTypeID())
      {
        uint64_t v12 = 1LL;
        if (CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo) {
          break;
        }
      }

      if (v8 == ++v9) {
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    uint64_t v12 = 0LL;
  }

  CFRelease(v5);
  return v12;
}

void sub_10000B720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  IOPMAssertionID v10 = *(_DWORD *)(a2 + 4);
  if (v10)
  {
    IOPMAssertionRelease(v10);
    *(_DWORD *)(a2 + 4) = 0;
  }

  if ((_DWORD)a1)
  {
    if ((_DWORD)a1 != 89)
    {
      sub_100009F4C("repaired disk, id = %@, failure.", *(void *)(a2 + 24));
      sub_100009EFC("unable to repair %@ (status code 0x%08X).", *(void *)(a2 + 24), a1);
      sub_10000B908(a1, a2);
      if (!*(_BYTE *)(a2 + 32))
      {
        int v11 = 92;
LABEL_16:
        sub_10000B9C4(v11, (void *)a2, a3, a4, a5, a6, a7, a8);
        return;
      }
    }
  }

  else
  {
    sub_10000795C(*(void *)(a2 + 24), 2, 0);
    sub_100009F4C("repaired disk, id = %@, success.", *(void *)(a2 + 24));
    sub_10000B908(0, a2);
  }

  if (!*(void *)(a2 + 40))
  {
    int v11 = 28;
    goto LABEL_16;
  }

  sub_100009F4C("mounted disk, id = %@, ongoing.", *(void *)(a2 + 24));
  sub_10000795C(*(void *)(a2 + 24), 0x200000, 1);
  uint64_t v12 = *(const void **)(a2 + 40);
  if (v12) {
    CFArrayAppendValue((CFMutableArrayRef)qword_100020F18, v12);
  }
  else {
    LODWORD(v13) = 0;
  }
  sub_100007510(*(void *)(a2 + 24));
  *(_BYTE *)(a2 + 96) = sub_100008358();
  *(void *)(a2 + 88) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v14 = sub_100007510(*(void *)(a2 + 24));
  CFMutableDataRef v15 = *(const __CFURL **)(a2 + 56);
  int v16 = sub_100007500(*(void *)(a2 + 24), @"DAVolumeName");
  CFStringRef v17 = *(const __CFURL **)(a2 + 40);
  uid_t v18 = sub_1000075E8(*(void *)(a2 + 24));
  gid_t v19 = sub_1000075E0(*(void *)(a2 + 24));
  sub_1000080E4( v14,  v15,  v16,  v17,  v18,  v19,  (int)v13,  sub_10000BA64,  (void (*)(uint64_t, uint64_t))a2,  *(CFStringRef *)(a2 + 48),  0LL);
}

uint64_t sub_10000B908(int a1, uint64_t a2)
{
  int v4 = (const __CFNumber *)sub_100007500(*(void *)(a2 + 24), @"DAMediaSize");
  uint64_t v5 = sub_100007510(*(void *)(a2 + 24));
  if (v4) {
    int v4 = sub_10000937C(v4);
  }
  CFTypeID v6 = @"kext";
  if (v5)
  {
    CFBooleanRef v7 = sub_10000805C(v5);
    if (sub_100008080(v5)) {
      CFTypeID v6 = @"FSKit";
    }
  }

  else
  {
    CFBooleanRef v7 = 0LL;
  }

  uint64_t v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(void *)(a2 + 80);
  return sub_100006134(a1, (uint64_t)v7, (uint64_t)v6, v8, (uint64_t)v4);
}

void sub_10000B9C4(int a1, void *a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  if (a1 == 92 && *(_BYTE *)a2)
  {
    sub_10000A784(*((void *)a2 + 3), 0, *((void *)a2 + 1), *((void *)a2 + 2), a5, a6, a7, a8, @"force");
    *((void *)a2 + 1) = 0LL;
  }

  else
  {
    CFIndex v9 = (void (*)(void))*((void *)a2 + 1);
    if (v9) {
      v9();
    }
  }

  CFRelease(*((CFTypeRef *)a2 + 3));
  CFRelease(*((CFTypeRef *)a2 + 6));
  IOPMAssertionID v10 = (const void *)*((void *)a2 + 5);
  if (v10) {
    CFRelease(v10);
  }
  free(a2);
}

void sub_10000BA64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007510(*(void *)(a2 + 24));
  sub_10000795C(*(void *)(a2 + 24), 0x200000, 0);
  if (v4) {
    uint64_t v4 = (uint64_t)sub_10000805C(v4);
  }
  BOOL v5 = *(_BYTE *)(a2 + 96) != 0;
  __uint64_t v6 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  sub_100006174(a1, v4, v5, v6 - *(void *)(a2 + 88));
  CFBooleanRef v7 = *(const void **)(a2 + 40);
  if (v7) {
    sub_1000091E0((const __CFArray *)qword_100020F18, v7);
  }
  if ((_DWORD)a1)
  {
    sub_100009F4C("mounted disk, id = %@, failure.", *(void *)(a2 + 24));
    sub_100009EFC("unable to mount %@ (status code 0x%08X).", *(void *)(a2 + 24), a1);
    int v14 = a1;
LABEL_7:
    sub_10000B9C4(v14, (void *)a2, v8, v9, v10, v11, v12, v13);
    return;
  }

  sub_100009F4C("mounted disk, id = %@, success.", *(void *)(a2 + 24));
  if (sub_100007500(*(void *)(a2 + 24), @"DAMediaEncrypted") == kCFBooleanTrue)
  {
    if (sub_10000B474(*(void *)(a2 + 24), 0))
    {
      sub_100009F4C("setting uid, id = %@ %d, success.", *(void *)(a2 + 24), dword_100020EBC);
      sub_1000079A0(*(void *)(a2 + 24), dword_100020EBC);
    }
  }

  BOOL v15 = sub_1000075C4(*(void *)(a2 + 24), 4);
  uint64_t v16 = *(void *)(a2 + 24);
  if (!v15)
  {
    sub_10000795C(v16, 4, 0);
    int v14 = 0;
    goto LABEL_7;
  }

  uint64_t v17 = sub_100007510(v16);
  sub_1000089AC( v17,  *(const __CFURL **)(a2 + 40),  (void (*)(uint64_t, uint64_t))sub_10000BC00,  (void (*)(uint64_t, uint64_t))a2);
}

void sub_10000BC00(uint64_t a1, uint64_t *a2)
{
  if ((_DWORD)a1) {
    sub_100009EFC("unable to repair quotas on disk %@ (status code 0x%08X).", a2[3], a1);
  }
  else {
    sub_10000795C(a2[3], 4, 0);
  }
  sub_10000B9C4(0, a2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10000BC58(void *a1)
{
  if (sub_100007500((uint64_t)a1, @"DAVolumePath"))
  {
    int v2 = getmntinfo(&v26, 2);
    if (v2 < 1)
    {
LABEL_6:
      int v7 = sub_100007500((uint64_t)a1, @"DAVolumePath");
      CFRetain(v7);
      sub_1000154C0((uint64_t)sub_10000BFF0, (uint64_t)v7, 0LL, 0LL);
      sub_100007738((uint64_t)a1, 0LL);
      if (sub_100007500((uint64_t)a1, @"DAMediaPath"))
      {
        sub_100007880((uint64_t)a1, @"DAVolumePath", 0LL);
        sub_10000D5B0(a1, @"DAVolumePath");
      }

      else
      {
        sub_100009F4C("removed disk, id = %@.", a1);
        sub_10000D648(a1);
        sub_100007880((uint64_t)a1, @"DAVolumePath", 0LL);
        sub_10000795C((uint64_t)a1, 0x10000000, 1);
        sub_1000091E0((const __CFArray *)qword_100020EC8, a1);
      }

      sub_1000132B0(v8);
    }

    else
    {
      unint64_t v3 = 0LL;
      uint64_t v4 = 2168LL * v2;
      while (1)
      {
        int v5 = sub_1000099C4((uint64_t)&v26[v3 / 0x878]);
        int v6 = (const char *)sub_100007220((uint64_t)a1);
        if (!strcmp(v5, v6)) {
          break;
        }
        v3 += 2168LL;
        if (v4 == v3) {
          goto LABEL_6;
        }
      }

      CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
      if (Mutable)
      {
        BOOL v15 = Mutable;
        if (!strcmp(v26[v3 / 0x878].f_fstypename, "hfs"))
        {
          uint64_t v16 = (const __CFURL *)sub_100007500((uint64_t)a1, @"DAVolumePath");
          uint64_t v17 = _FSCopyNameForVolumeFormatAtURL(v16);
          if (sub_100006344((uint64_t)a1, @"DAVolumeType", v17))
          {
            sub_100007880((uint64_t)a1, @"DAVolumeType", v17);
            CFArrayAppendValue(v15, @"DAVolumeType");
          }

          if (v17) {
            CFRelease(v17);
          }
        }

        size_t v18 = strlen(v26[v3 / 0x878].f_mntonname);
        CFURLRef v19 = CFURLCreateFromFileSystemRepresentation( kCFAllocatorDefault,  (const UInt8 *)v26[v3 / 0x878].f_mntonname,  v18,  1u);
        if (v19)
        {
          CFURLRef v20 = v19;
          if (sub_100006344((uint64_t)a1, @"DAVolumePath", v19))
          {
            sub_100007738((uint64_t)a1, v20);
            sub_100007880((uint64_t)a1, @"DAVolumePath", v20);
            sub_100009F4C("volume path changed for %@", a1);
            CFArrayAppendValue(v15, @"DAVolumePath");
          }

          CFRelease(v20);
        }

        if (CFArrayGetCount(v15))
        {
          sub_100009F4C("updated disk, id = %@.", a1);
        }

        goto LABEL_30;
      }
    }
  }

  else
  {
    int v9 = getmntinfo(&v26, 2);
    if (v9 >= 1)
    {
      unint64_t v10 = 0LL;
      uint64_t v11 = 2168LL * v9;
      while (1)
      {
        int v12 = sub_1000099C4((uint64_t)&v26[v10 / 0x878]);
        int v13 = (const char *)sub_100007220((uint64_t)a1);
        if (!strcmp(v12, v13)) {
          break;
        }
        v10 += 2168LL;
        if (v11 == v10) {
          return 0LL;
        }
      }

      f_mntonname = v26[v10 / 0x878].f_mntonname;
      size_t v22 = strlen(f_mntonname);
      CFURLRef v23 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)f_mntonname, v22, 1u);
      if (v23)
      {
        BOOL v15 = v23;
        sub_100007738((uint64_t)a1, v23);
        sub_100007880((uint64_t)a1, @"DAVolumePath", v15);
        sub_10000D5B0(a1, @"DAVolumePath");
        sub_1000132B0(v24);
LABEL_30:
        CFRelease(v15);
      }
    }
  }

  return 0LL;
}

uint64_t sub_10000BFF0(const void *a1)
{
  return 0LL;
}

uint64_t sub_10000C01C(uint64_t a1, int a2)
{
  uint64_t v4 = (const __CFURL *)sub_100007500(a1, @"DAVolumePath");
  if (!v4) {
    return 4175036419LL;
  }
  int v5 = v4;
  sub_100007510(a1);
  int v6 = sub_100009498(v5);
  if (!v6) {
    return 49174LL;
  }
  int v7 = v6;
  pid_t v8 = fork();
  int v12 = v8;
  if (v8 == -1)
  {
    int v9 = *__error();
  }

  else
  {
    if (!v8)
    {
      uint64_t v11 = "-a";
      if (!a2) {
        uint64_t v11 = "-d";
      }
      execle("/usr/sbin/vsdbutil", "/usr/sbin/vsdbutil", v11, v7, 0LL, 0LL);
      exit(71);
    }

    waitpid(v8, &v12, 0);
    if ((v12 & 0x7F) != 0) {
      int v9 = v12;
    }
    else {
      int v9 = (__int16)v12 >> 8;
    }
  }

  free(v7);
  if (v9) {
    return v9 | 0xC000u;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000C118(void *a1, int a2)
{
  uint64_t v4 = 4175036417LL;
  int v5 = (const __CFURL *)sub_100007500((uint64_t)a1, @"DAVolumePath");
  if (!v5) {
    return 4175036419LL;
  }
  int v6 = v5;
  sub_100007510((uint64_t)a1);
  bzero(v27, 0x878uLL);
  int v7 = sub_100009498(v6);
  if (!v7)
  {
    int v10 = 22;
    return v10 | 0xC000u;
  }

  pid_t v8 = v7;
  if (sub_100009020((const char *)v7, v27, 2) == -1 || (pid_t v9 = fork(), v25 = v9, v9 == -1))
  {
    int v10 = *__error();
  }

  else
  {
    if (!v9)
    {
      snprintf(__str, 0x10uLL, "-o-e=%d", a2);
      CFURLRef v20 = "-onodev";
      if ((v28 & 0x10) == 0) {
        CFURLRef v20 = "-odev";
      }
      CFStringRef v21 = "-onoexec";
      if ((v28 & 4) == 0) {
        CFStringRef v21 = "-oexec";
      }
      size_t v22 = "-onosuid";
      if ((v28 & 8) == 0) {
        size_t v22 = "-osuid";
      }
      CFURLRef v23 = "-ordonly";
      if ((v28 & 1) == 0) {
        CFURLRef v23 = "-orw";
      }
      if ((v28 & 0x200000) != 0) {
        uint64_t v24 = "-onoowners";
      }
      else {
        uint64_t v24 = "-oowners";
      }
      execle("/sbin/mount", "/sbin/mount", "-t", &v29, "-u", __str, v20, v21, v22, v23, v24, &v31, &v30, 0LL, 0LL);
      exit(71);
    }

    waitpid(v9, &v25, 0);
    if ((v25 & 0x7F) != 0) {
      int v10 = v25;
    }
    else {
      int v10 = (__int16)v25 >> 8;
    }
  }

  free(v8);
  if (v10) {
    return v10 | 0xC000u;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!Mutable) {
    return 4175036421LL;
  }
  int v12 = Mutable;
  int v13 = sub_100007500((uint64_t)a1, @"DAVolumeName");
  if (v13 && (int v14 = v13, v15 = sub_100007510((uint64_t)a1), (v16 = sub_100007CB4(v15, v6, 0LL)) != 0LL))
  {
    uint64_t v17 = v16;
    int v18 = CFEqual(v14, v16);
    sub_100007880((uint64_t)a1, @"DAVolumeName", v17);
    CFArrayAppendValue(v12, @"DAVolumeName");
    if (v18)
    {
      uint64_t v4 = 0LL;
    }

    else
    {
      uint64_t v4 = sub_10000B46C();
      if (v4)
      {
        sub_100007738((uint64_t)a1, (CFTypeRef)v4);
        sub_100007880((uint64_t)a1, @"DAVolumePath", (const void *)v4);
        CFArrayAppendValue(v12, @"DAVolumePath");
      }
    }

    sub_10000D5B0(a1, v12);
    CFRelease(v12);
    CFRelease(v17);
    if (v4)
    {
      CFRelease((CFTypeRef)v4);
      return 0LL;
    }
  }

  else
  {
    CFRelease(v12);
  }

  return v4;
}

uint64_t sub_10000C440()
{
  return 0LL;
}

void sub_10000C448(int a1, void *a2)
{
  uint64_t v4 = (void *)*((void *)a2 + 1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  int v6 = Mutable;
  if (!a1 && Mutable)
  {
    int v7 = (const void **)(*(_BYTE *)a2 ? &kCFBooleanTrue : &kCFBooleanFalse);
    pid_t v8 = *v7;
    if (sub_100006344((uint64_t)v4, @"DAMediaEncrypted", *v7))
    {
      sub_100007880((uint64_t)v4, @"DAMediaEncrypted", v8);
      CFArrayAppendValue(v6, @"DAMediaEncrypted");
    }
  }

  if (CFArrayGetCount(v6))
  {
    sub_100009F4C("encryption status changed, id = %@.", v4);
  }

  if (v6) {
    CFRelease(v6);
  }
  CFRelease(*((CFTypeRef *)a2 + 1));
  free(a2);
}

BOOL sub_10000C558(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020EC8);
  if (Count < 1) {
    return 1LL;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  CFBooleanRef v5 = kCFBooleanTrue;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, v4);
    int v7 = sub_1000074E0(a1);
    if (v7 == sub_1000074E0((uint64_t)ValueAtIndex))
    {
      pid_t v8 = (const __CFString *)sub_100007500((uint64_t)ValueAtIndex, @"DAMediaBSDName");
      BOOL result = sub_1000075C4((uint64_t)ValueAtIndex, 16);
      if (!result) {
        return result;
      }
      if (sub_100007500((uint64_t)ValueAtIndex, @"DAMediaLeaf") == kCFBooleanFalse)
      {
        CFIndex v10 = CFArrayGetCount((CFArrayRef)qword_100020EC8);
        if (v10 < 1)
        {
          CFIndex v11 = 0LL;
        }

        else
        {
          CFIndex v11 = 0LL;
          while (1)
          {
            int v12 = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, v11);
            if (ValueAtIndex != v12)
            {
              int v13 = (const __CFString *)sub_100007500((uint64_t)v12, @"DAMediaBSDName");
              if (v13)
              {
                if (CFStringHasPrefix(v13, v8)) {
                  break;
                }
              }
            }

            if (v10 == ++v11) {
              return 0LL;
            }
          }
        }

        BOOL v14 = v11 == v10;
        CFBooleanRef v5 = kCFBooleanTrue;
        if (v14) {
          break;
        }
      }
    }

    if (++v4 == v3) {
      return 1LL;
    }
  }

  return 0LL;
}

void sub_10000C6FC( const void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, void, void, void, void, uint64_t), uint64_t a4)
{
  int v7 = malloc(0x38uLL);
  if (v7)
  {
    pid_t v8 = v7;
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFArrayRef)qword_100020EE0);
    if (MutableCopy)
    {
      CFIndex v10 = MutableCopy;
      CFIndex v11 = (const __CFNumber *)sub_100007500((uint64_t)a1, @"DAMediaSize");
      if (v11)
      {
        if (!sub_10000937C(v11)) {
          CFArrayRemoveAllValues(v10);
        }
      }

      CFRetain(a1);
      void *v8 = a3;
      v8[1] = a4;
      v8[2] = v10;
      v8[3] = a1;
      v8[4] = a2;
      v8[5] = 0LL;
      v8[6] = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      sub_10000C834(0xFFFFFFFFLL, 0LL, 0LL, 0LL, 0LL, (uint64_t)v8);
      return;
    }

    free(v8);
  }

  if (a3) {
    a3(12LL, -1LL, 0LL, 0LL, 0LL, 0LL, a4);
  }
}

void sub_10000C834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(a6 + 40);
  if (!(_DWORD)a1)
  {
    uint64_t v16 = sub_10000805C(v12);
    sub_100009F4C("probed disk, id = %@, with %@, success.", *(void *)(a6 + 24), v16);
    BOOL v13 = 1;
LABEL_20:
    uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))a6;
    if (*(void *)a6)
    {
      uint64_t v27 = *(void *)(a6 + 40);
      char v28 = !v13;
      if (!v27) {
        char v28 = 1;
      }
      if ((v28 & 1) == 0)
      {
        uint64_t v29 = sub_10000805C(*(void *)(a6 + 40));
        __uint64_t v30 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        sub_100005C0C(a1, (uint64_t)v29, (uint64_t)@"kext", v30 - *(void *)(a6 + 48), a2);
        uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))a6;
        uint64_t v27 = *(void *)(a6 + 40);
      }

      v26(a1, v27, a2, a3, a4, a5, *(void *)(a6 + 8));
    }

    CFRelease(*(CFTypeRef *)(a6 + 16));
    CFRelease(*(CFTypeRef *)(a6 + 24));
    uint64_t v31 = *(const void **)(a6 + 40);
    if (v31) {
      CFRelease(v31);
    }
    free((void *)a6);
    return;
  }

  BOOL v13 = v12 != 0;
  if (v12)
  {
    BOOL v14 = sub_10000805C(v12);
    sub_100009F4C("probed disk, id = %@, with %@, failure.", *(void *)(a6 + 24), v14);
    if ((_DWORD)a1 != -2) {
      sub_100009EFC("unable to probe %@ (status code 0x%08X).", *(void *)(a6 + 24), a1);
    }
    CFRelease(*(CFTypeRef *)(a6 + 40));
    *(void *)(a6 + 40) = 0LL;
  }

  BOOL v15 = (sub_100007500(*(void *)(a6 + 24), @"DAMediaRemovable") != kCFBooleanTrue
      || sub_100007500(*(void *)(a6 + 24), @"DADeviceInternal"))
     && sub_100007500(*(void *)(a6 + 24), @"DADeviceInternal") != kCFBooleanTrue;
  if (!CFArrayGetCount(*(CFArrayRef *)(a6 + 16))) {
    goto LABEL_20;
  }
  int v35 = v15;
  uint64_t v36 = a3;
  uint64_t v17 = a4;
  uint64_t v18 = a5;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a6 + 16), 0LL);
    if (ValueAtIndex)
    {
      CFURLRef v20 = ValueAtIndex;
      Value = CFDictionaryGetValue(ValueAtIndex, @"DAFileSystem");
      if (Value)
      {
        size_t v22 = Value;
        CFURLRef v23 = (const __CFDictionary *)CFDictionaryGetValue(v20, @"FSMediaProperties");
        if (v23)
        {
          uint64_t v24 = v23;
          BOOLean_t matches = 0;
          io_service_t v25 = sub_100007518(*(void *)(a6 + 24));
          IOServiceMatchPropertyTable(v25, v24, &matches);
          if (matches) {
            break;
          }
        }
      }
    }

    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a6 + 16), 0LL);
    if (!CFArrayGetCount(*(CFArrayRef *)(a6 + 16)))
    {
      a5 = v18;
      a4 = v17;
      a3 = v36;
      a2 = a2;
      goto LABEL_20;
    }
  }

  CFUUIDRef v32 = sub_10000805C((uint64_t)v22);
  CFRetain(v22);
  *(void *)(a6 + 40) = v22;
  if (CFDictionaryGetValue(v20, @"autodiskmount") == kCFBooleanFalse)
  {
    sub_10000795C(*(void *)(a6 + 24), 16, 0);
    sub_10000795C(*(void *)(a6 + 24), 32, 0);
  }

  CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a6 + 16), 0LL);
  sub_100009F4C("probed disk, id = %@, with %@, ongoing.", *(void *)(a6 + 24), v32);
  v33 = (const __CFURL *)sub_100007508(*(void *)(a6 + 24));
  uint64_t v34 = sub_1000074CC(*(void *)(a6 + 24), 1);
  sub_100008390( (uint64_t)v22,  v33,  v34,  0LL,  (void (*)(uint64_t, void, void, void, void, uint64_t))sub_10000C834,  a6,  v35);
}

BOOL sub_10000CB68(const void *a1, int a2)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020F40);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v5 = Count;
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F40, 0LL);
  int v7 = (const __CFNumber *)sub_10000535C(ValueAtIndex);
  if (sub_10000937C(v7) != (const __CFNumber *)a2)
  {
    CFIndex v10 = (const __CFNumber *)a2;
    CFIndex v11 = 1LL;
    while (v5 != v11)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F40, v11);
      uint64_t v12 = (const __CFNumber *)sub_10000535C(ValueAtIndex);
      ++v11;
      if (sub_10000937C(v12) == v10)
      {
        CFIndex v8 = v11 - 1;
        BOOL v9 = v8 < v5;
        goto LABEL_8;
      }
    }

    return 0LL;
  }

  CFIndex v8 = 0LL;
  BOOL v9 = 1LL;
LABEL_8:
  BOOL v13 = sub_100005374(ValueAtIndex);
  unsigned int v14 = sub_100005380(ValueAtIndex);
  switch(v14)
  {
    case 6u:
    case 8u:
    case 0xEu:
      goto LABEL_9;
    case 7u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
      break;
    case 9u:
      io_service_t v25 = sub_100005344(ValueAtIndex);
      uint64_t v26 = sub_100005368(ValueAtIndex);
      unsigned int v27 = sub_100005380(ValueAtIndex);
      __uint64_t v30 = sub_1000094E0(v27);
      sub_100009DD0("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %@.", v25, v26, v30, v13);
      break;
    default:
      if (v14 == 2)
      {
LABEL_9:
        if (a1)
        {
          BOOL v15 = (const __CFData *)sub_1000074F8((uint64_t)v13);
          if (v15)
          {
            BytePtr = CFDataGetBytePtr(v15);
            if (!*((void *)BytePtr + 2)) {
              *((void *)BytePtr + 2) = CFRetain(a1);
            }
          }

          uint64_t v17 = sub_100005344(ValueAtIndex);
          uint64_t v18 = sub_100005368(ValueAtIndex);
          unsigned int v19 = sub_100005380(ValueAtIndex);
          CFURLRef v20 = sub_1000094E0(v19);
          CFStringRef v21 = sub_100007C84((const __CFDictionary *)a1);
          sub_100009EFC( "  dispatched response, id = %016llX:%016llX, kind = %s, disk = %@, dissented, status = 0x%08X.",  v17,  v18,  v20,  v13,  v21);
        }

        else
        {
          size_t v22 = sub_100005344(ValueAtIndex);
          CFURLRef v23 = sub_100005368(ValueAtIndex);
          unsigned int v24 = sub_100005380(ValueAtIndex);
          uint64_t v29 = sub_1000094E0(v24);
          sub_100009DD0( "  dispatched response, id = %016llX:%016llX, kind = %s, disk = %@, approved.",  v22,  v23,  v29,  v13);
        }
      }

      break;
  }

  CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100020F40, v8);
  sub_10000CD7C(v13);
  return v9;
}

void sub_10000CD7C(const void *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020F40);
  if (Count < 1)
  {
    CFIndex v3 = 0LL;
  }

  else
  {
    CFIndex v3 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F40, v3);
      if (sub_100005374(ValueAtIndex) == a1) {
        break;
      }
      if (Count == ++v3) {
        goto LABEL_8;
      }
    }
  }

  if (v3 == Count)
  {
LABEL_8:
    CFIndex v5 = (const __CFData *)sub_1000074F8((uint64_t)a1);
    BytePtr = CFDataGetBytePtr(v5);
    CFIndex v8 = *(void (**)(const void *, uint64_t))BytePtr;
    uint64_t v7 = *((void *)BytePtr + 1);
    BOOL v9 = (const void *)*((void *)BytePtr + 2);
    sub_100007840((uint64_t)a1, 0LL);
    v8(v9, v7);
    if (v9) {
      CFRelease(v9);
    }
  }

  CFIndex v10 = CFArrayGetCount((CFArrayRef)qword_100020F40);
  if (v10 >= 1)
  {
    CFIndex v11 = v10;
    CFIndex v12 = 0LL;
    double v13 = kCFAbsoluteTimeIntervalSince1904;
    do
    {
      unsigned int v14 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F40, v12);
      if (v14)
      {
        BOOL v15 = v14;
        uint64_t v16 = sub_1000053C4(v14);
        if (!sub_100012CD4((uint64_t)v16, 0x1000000))
        {
          double v17 = sub_1000053D0(v15) + 10.0 + 1.0;
          if (v17 < v13) {
            double v13 = v17;
          }
        }
      }

      ++v12;
    }

    while (v11 != v12);
    if (v13 < kCFAbsoluteTimeIntervalSince1904 && v13 > CFAbsoluteTimeGetCurrent())
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      dispatch_time_t v19 = dispatch_time(0LL, 1000000000 * (uint64_t)(v13 - Current));
      CFURLRef v20 = (dispatch_queue_s *)sub_100012A30();
      dispatch_after(v19, v20, &stru_10001CEC8);
    }
  }

void sub_10000CF24(void *a1)
{
}

void sub_10000CF34(int a1, void *a2, void *a3)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020F48);
  if (Count >= 1)
  {
    CFIndex v7 = Count;
    for (CFIndex i = 0LL; i != v7; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100020F48, i);
      uint64_t v10 = (uint64_t)ValueAtIndex;
      if (a1 == 15)
      {
        if (!sub_100012CEC((uint64_t)ValueAtIndex, 1))
        {
          sub_10000D834(v10, 15, a2, a3);
          sub_100012EE4(v10, 1, 1);
        }
      }

      else
      {
        sub_10000D834((uint64_t)ValueAtIndex, a1, a2, a3);
      }
    }
  }

void sub_10000D000(void *a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4)
{
}

void sub_10000D040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFMutableArrayRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 24LL);
  if (Mutable)
  {
    CFIndex v7 = Mutable;
    BytePtr = (UInt8 *)CFDataGetBytePtr(Mutable);
    *((void *)BytePtr + 1) = a3;
    *((void *)BytePtr + 2) = 0LL;
    *(void *)BytePtr = a2;
    sub_100007840(a1, v7);
    CFRelease(v7);
  }

void sub_10000D0B4(const __CFDictionary *a1, void *a2, void *a3)
{
  int v6 = sub_1000053C4(a1);
  sub_100009E68("%s -> %@", qword_100020F30, v6);
  if (!sub_100012CEC((uint64_t)v6, 0x10000000))
  {
    if (sub_100005344(a1))
    {
      CFIndex v7 = (const __CFDictionary *)sub_10000539C(a1);
      if (!v7 || sub_10000761C((uint64_t)a2, v7))
      {
        switch(sub_100005380(a1))
        {
          case 0u:
          case 4u:
            uint64_t v26 = sub_100005338(kCFAllocatorDefault, a1);
            if (v26)
            {
              unsigned int v27 = v26;
              sub_100005438(v26, a2);
              CFMutableDataRef v28 = sub_10000758C(a2);
              sub_100005408(v27, v28);
              sub_100012D34((uint64_t)v6, v27);
              uint64_t v29 = sub_100005344(v27);
              __uint64_t v30 = sub_100005368(v27);
              unsigned int v31 = sub_100005380(v27);
              CFUUIDRef v32 = sub_1000094E0(v31);
              sub_100009DD0("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@.", v29, v30, v32, a2);
              v33 = v27;
              goto LABEL_23;
            }

            return;
          case 1u:
          case 5u:
          case 7u:
          case 0xAu:
          case 0xCu:
          case 0xDu:
          case 0x11u:
            sub_100005438(a1, a2);
            CFMutableDataRef v8 = sub_10000758C(a2);
            sub_100005408(a1, v8);
            sub_100005420(a1, a3);
            sub_100012D34((uint64_t)v6, a1);
            BOOL v9 = sub_100005344(a1);
            uint64_t v10 = sub_100005368(a1);
            unsigned int v11 = sub_100005380(a1);
            CFIndex v12 = sub_1000094E0(v11);
            double v13 = v12;
            if (a3)
            {
              CFNumberRef v55 = sub_100007C84((const __CFDictionary *)a3);
              sub_100009DD0( "  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@, status = 0x%08X.",  v9,  v10,  v13,  a2,  v55);
            }

            else
            {
              sub_100009DD0( "  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@, success.",  v9,  v10,  v12,  a2);
            }

            return;
          case 2u:
            if (!sub_100012CEC((uint64_t)v6, 0x1000000))
            {
              if (a3) {
                sub_100018344();
              }
              goto LABEL_11;
            }

            return;
          case 3u:
            CFTypeID v40 = (const __CFArray *)sub_1000053FC(a1);
            if (v40)
            {
              CFTypeID v41 = v40;
              CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFArrayRef)a3);
              if (MutableCopy)
              {
                v43 = MutableCopy;
                sub_100004734(MutableCopy, v41);
                goto LABEL_32;
              }
            }

            else
            {
              v43 = (const __CFArray *)CFRetain(a3);
              if (v43)
              {
LABEL_32:
                if (CFArrayGetCount(v43))
                {
                  CFMutableDictionaryRef v44 = sub_100005338(kCFAllocatorDefault, a1);
                  if (v44)
                  {
                    CFStringRef v45 = v44;
                    CFIndex Count = CFArrayGetCount(v43);
                    if (Count >= 1)
                    {
                      CFIndex v47 = Count;
                      for (CFIndex i = 0LL; i != v47; ++i)
                      {
                        v49 = sub_100005344(v45);
                        v50 = sub_100005368(v45);
                        unsigned int v51 = sub_100005380(v45);
                        CFDataRef v52 = sub_1000094E0(v51);
                        ValueAtIndex = CFArrayGetValueAtIndex(v43, i);
                        sub_100009DD0( "  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@, key = %@.",  v49,  v50,  v52,  a2,  ValueAtIndex);
                      }
                    }

                    sub_100005438(v45, a2);
                    CFMutableDataRef v54 = sub_10000758C(a2);
                    sub_100005408(v45, v54);
                    sub_100005420(v45, v43);
                    sub_100012D34((uint64_t)v6, v45);
                    CFRelease(v45);
                  }
                }

                v33 = v43;
                goto LABEL_23;
              }
            }

            break;
          case 6u:
          case 8u:
          case 9u:
          case 0xEu:
            if (!sub_100012CEC((uint64_t)v6, 0x1000000))
            {
              if (a3) {
                sub_10001836C();
              }
LABEL_11:
              CFNumberRef v14 = sub_100009354(kCFAllocatorDefault, dword_100020DDC);
              if (v14)
              {
                CFNumberRef v15 = v14;
                uint64_t v16 = sub_100005338(kCFAllocatorDefault, a1);
                if (v16)
                {
                  double v17 = v16;
                  sub_100005438(v16, a2);
                  sub_100005420(v17, v15);
                  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
                  sub_100005480(v17, Current);
                  CFArrayAppendValue((CFMutableArrayRef)qword_100020F40, v17);
                  CFRelease(v17);
                }

                dispatch_time_t v19 = sub_100005338(kCFAllocatorDefault, a1);
                if (v19)
                {
                  CFURLRef v20 = v19;
                  sub_100005438(v19, a2);
                  CFMutableDataRef v21 = sub_10000758C(a2);
                  sub_100005408(v20, v21);
                  sub_100005420(v20, v15);
                  sub_100012D34((uint64_t)v6, v20);
                  size_t v22 = sub_100005344(v20);
                  CFURLRef v23 = sub_100005368(v20);
                  unsigned int v24 = sub_100005380(v20);
                  io_service_t v25 = sub_1000094E0(v24);
                  sub_100009DD0("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@.", v22, v23, v25, a2);
                  CFRelease(v20);
                }

                CFRelease(v15);
              }

              ++dword_100020DDC;
            }

            return;
          case 0xFu:
          case 0x10u:
            CFMutableDictionaryRef v34 = sub_100005338(kCFAllocatorDefault, a1);
            if (v34)
            {
              int v35 = v34;
              sub_100012D34((uint64_t)v6, v34);
              uint64_t v36 = sub_100005344(v35);
              CFTypeID v37 = sub_100005368(v35);
              unsigned int v38 = sub_100005380(v35);
              v39 = sub_1000094E0(v38);
              sub_100009DD0("  dispatched callback, id = %016llX:%016llX, kind = %s.", v36, v37, v39);
              v33 = v35;
LABEL_23:
              CFRelease(v33);
            }

            return;
          default:
            return;
        }
      }
    }
  }

void sub_10000D5B0(void *a1, void *cf)
{
  CFTypeID v4 = CFGetTypeID(cf);
  if (v4 == CFArrayGetTypeID())
  {
    sub_10000CF34(3, a1, cf);
  }

  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, cf);
    sub_10000CF34(3, a1, Mutable);
    CFRelease(Mutable);
  }

void sub_10000D648(void *a1)
{
}

uint64_t sub_10000D658(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return sub_10000D678(5LL, a1, a2, 0LL, 0LL, a3);
}

void sub_10000D678( unsigned int a1, const void *a2, uint64_t a3, const void *a4, const void *a5, const void *a6)
{
  int v6 = sub_10000DFA4((uint64_t)kCFAllocatorDefault, a1, a2, a3, a4, a5, 0, 0, a6);
  if (v6)
  {
    CFIndex v7 = v6;
    sub_10000DAFC(v6);
    CFRelease(v7);
  }

void sub_10000D6EC(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_10000D720(const void *a1, const void *a2, unsigned int a3, const void *a4)
{
}

uint64_t sub_10000D73C(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  return sub_10000D678(7LL, a1, a3, a2, a5, a4);
}

void sub_10000D754(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_10000D788(const void *a1, const void *a2)
{
}

void sub_10000D7A4(const void *a1, const void *a2)
{
}

void sub_10000D7C0(const void *a1, unsigned int a2, const void *a3)
{
}

void sub_10000D7E0(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_10000D814()
{
}

void sub_10000D824()
{
}

void sub_10000D834(uint64_t a1, int a2, void *a3, void *a4)
{
  CFIndex v7 = (const __CFArray *)sub_1000074F0(a1);
  if (v7)
  {
    CFMutableDataRef v8 = v7;
    CFIndex Count = CFArrayGetCount(v7);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      for (CFIndex i = 0LL; i != v10; ++i)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, i);
      }
    }
  }

void sub_10000D8C8(const void *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020F40);
  if (Count >= 1)
  {
    unint64_t v3 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F40, v3 - 2);
      if (sub_100005374(ValueAtIndex) == a1)
      {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100020F40, v3 - 2);
        sub_10000CD7C(a1);
      }

      --v3;
    }

    while (v3 > 1);
  }

  CFIndex v5 = CFArrayGetCount((CFArrayRef)qword_100020F38);
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      CFIndex v7 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F38, v6 - 2);
      if (sub_10000E1D8(v7) == a1)
      {
        sub_10000F090(v7, -119930874);
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100020F38, v6 - 2);
      }

      --v6;
    }

    while (v6 > 1);
  }

void sub_10000D9B0(const void *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020F40);
  if (Count >= 1)
  {
    unint64_t v3 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F40, v3 - 2);
      if (sub_1000053C4(ValueAtIndex) == a1)
      {
        CFIndex v5 = sub_100005374(ValueAtIndex);
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100020F40, v3 - 2);
        sub_10000CD7C(v5);
      }

      --v3;
    }

    while (v3 > 1);
  }

  CFIndex v6 = CFArrayGetCount((CFArrayRef)qword_100020F38);
  if (v6 >= 1)
  {
    unint64_t v7 = v6 + 1;
    do
    {
      CFMutableDataRef v8 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F38, v7 - 2);
      if (v8)
      {
        BOOL v9 = v8;
        CFIndex v10 = (const __CFDictionary *)sub_10000F204(v8);
        if (v10)
        {
          if (sub_1000053C4(v10) == a1) {
            sub_10000F294(v9, 0LL);
          }
        }
      }

      --v7;
    }

    while (v7 > 1);
  }

  CFIndex v11 = CFArrayGetCount((CFArrayRef)qword_100020EC8);
  if (v11 >= 1)
  {
    unint64_t v12 = v11 + 1;
    do
    {
      double v13 = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, v12 - 2);
      if (v13)
      {
        uint64_t v14 = (uint64_t)v13;
        CFNumberRef v15 = (const __CFDictionary *)sub_1000074E8((uint64_t)v13);
        if (v15)
        {
          if (sub_1000053C4(v15) == a1) {
            sub_1000077C0(v14, 0LL);
          }
        }
      }

      --v12;
    }

    while (v12 > 1);
  }

void sub_10000DAFC(const __CFDictionary *a1)
{
  unsigned int v2 = sub_10000E1E4(a1);
  if (v2 > 0xD || ((1 << v2) & 0x20A0) == 0) {
    goto LABEL_29;
  }
  unsigned int v3 = sub_10000F1E0(a1);
  CFTypeID v4 = sub_10000E1D8(a1);
  uint64_t v5 = (sub_10000E1E4(a1) == 5) | v3;
  if ((v5 & 1) != 0)
  {
    int v6 = -119930868;
    unint64_t v7 = (unint64_t)sub_10000F1EC(a1);
    unint64_t v8 = (unint64_t)sub_10000F1F8(a1);
    BOOL v9 = sub_100007500((uint64_t)v4, @"DAMediaWhole");
    int v10 = -119930877;
    if (!(v8 | v7)) {
      int v10 = 0;
    }
    int v6 = v9 ? v10 : -119930868;
    if (!v9 || (v8 | v7) != 0)
    {
LABEL_18:
      sub_10000F090(a1, v6);
      return;
    }

    goto LABEL_19;
  }

  if (sub_1000075C4((uint64_t)v4, 128) && sub_10000E1E4(a1) == 13)
  {
LABEL_19:
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      double v13 = Mutable;
      CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020EC8);
      if (Count >= 1)
      {
        CFIndex v15 = Count;
        for (CFIndex i = 0LL; i != v15; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, i);
          if (v4 != ValueAtIndex)
          {
            uint64_t v18 = ValueAtIndex;
            sub_1000074CC((uint64_t)ValueAtIndex, 0);
            sub_1000074CC((uint64_t)v4, 0);
            if ((v5 & 1) != 0)
            {
              int v19 = sub_1000074E0((uint64_t)v4);
              if (v19 == sub_1000074E0((uint64_t)v18))
              {
                unsigned int v20 = sub_10000E1E4(a1);
                unsigned int v21 = sub_10000F278(a1);
                unsigned int v22 = sub_10000F25C(a1);
                CFURLRef v23 = sub_10000DFA4((uint64_t)kCFAllocatorDefault, v20, v18, v5, 0LL, 0LL, v21, v22, 0LL);
                if (v23)
                {
                  unsigned int v24 = v23;
                  CFArrayAppendValue(v13, v23);
                  CFArrayAppendValue((CFMutableArrayRef)qword_100020F38, v24);
                  CFRelease(v24);
                }
              }
            }
          }
        }
      }

      sub_10000F2C4(a1, v13);
      CFRelease(v13);
    }
  }

LABEL_29:
  CFArrayAppendValue((CFMutableArrayRef)qword_100020F38, a1);
  sub_1000132B0();
}

void sub_10000DDA0(const __CFDictionary *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020F40);
  if (Count >= 1)
  {
    unint64_t v3 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F40, v3 - 2);
      uint64_t v5 = sub_1000053C4(ValueAtIndex);
      if (v5 == sub_1000053C4(a1))
      {
        int v6 = sub_100005344(ValueAtIndex);
        if (v6 == sub_100005344(a1))
        {
          unint64_t v7 = sub_100005368(ValueAtIndex);
          if (v7 == sub_100005368(a1))
          {
            unint64_t v8 = sub_100005374(ValueAtIndex);
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100020F40, v3 - 2);
            sub_10000CD7C(v8);
          }
        }
      }

      --v3;
    }

    while (v3 > 1);
  }

void sub_10000DE78(id a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020F40);
  if (Count >= 1)
  {
    unint64_t v3 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F40, v3 - 2);
      if (ValueAtIndex)
      {
        uint64_t v5 = ValueAtIndex;
        int v6 = sub_1000053C4(ValueAtIndex);
        if (!sub_100012CD4((uint64_t)v6, 0x1000000) && sub_1000053D0(v5) + 10.0 < Current)
        {
          unint64_t v7 = sub_100005374(v5);
          if (!sub_100012CEC((uint64_t)v6, 0x1000000))
          {
            sub_100009DD0("  timed out session, id = %@.", v6);
            sub_100009EFC("%@ not responding.", v6);
            sub_100012EE4((uint64_t)v6, 0x1000000, 1);
          }

          CFRetain(v7);
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100020F40, v3 - 2);
          sub_10000CD7C(v7);
          CFRelease(v7);
        }
      }

      --v3;
    }

    while (v3 > 1);
  }

__CFDictionary *sub_10000DFA4( uint64_t a1, unsigned int a2, const void *a3, uint64_t a4, const void *a5, const void *a6, unsigned int a7, unsigned int a8, const void *a9)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  double v17 = Mutable;
  if (Mutable)
  {
    sub_1000092F0(Mutable, @"DARequestKind", a2);
    if (a3) {
      CFDictionarySetValue(v17, @"DARequestDisk", a3);
    }
    if (a4) {
      sub_1000092F0(v17, @"DARequestArgument1", a4);
    }
    if (a5) {
      CFDictionarySetValue(v17, @"DARequestArgument2", a5);
    }
    if (a6) {
      CFDictionarySetValue(v17, @"DARequestArgument3", a6);
    }
    sub_1000092F0(v17, @"DARequestUserGID", a8);
    sub_1000092F0(v17, @"DARequestUserUID", a7);
    if (a9) {
      CFDictionarySetValue(v17, @"DARequestCallback", a9);
    }
  }

  return v17;
}

uint64_t sub_10000E0D8(uint64_t result)
{
  if (result)
  {
    unsigned int v1 = (const __CFDictionary *)result;
    BOOL result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, @"DARequestDisk");
    if (result)
    {
      uint64_t v2 = result;
      if (sub_1000075C4(result, 1))
      {
        return 0LL;
      }

      else
      {
        BOOL result = sub_1000075C4(v2, 0x80000);
        if ((_DWORD)result)
        {
          unsigned int v3 = sub_1000092BC(v1, @"DARequestKind");
          BOOL result = 0LL;
          switch(v3)
          {
            case 1u:
              BOOL result = sub_10000E200(v1);
              break;
            case 5u:
              BOOL result = sub_10000E44C(v1);
              break;
            case 7u:
              BOOL result = sub_10000E5F4(v1);
              break;
            case 0xAu:
              BOOL result = sub_10000E9D8(v1);
              break;
            case 0xBu:
              sub_10000EB44(v1);
              BOOL result = 1LL;
              break;
            case 0xCu:
              BOOL result = sub_10000EC1C(v1);
              break;
            case 0xDu:
              BOOL result = sub_10000ED7C(v1);
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

const void *sub_10000E1D8(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestDisk");
}

CFNumberRef sub_10000E1E4(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DARequestKind");
}

uint64_t sub_10000E200(const __CFDictionary *a1)
{
  Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if ((sub_1000092BC(a1, @"DARequestState") & 0x100000) != 0)
  {
    if (CFDictionaryGetValue(a1, @"DARequestDissenter"))
    {
      uint64_t v5 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
      sub_10000F0E8(a1, v5);
      sub_1000132B0(v6);
      return 1LL;
    }

    else
    {
      CFRetain(a1);
      sub_10000795C((uint64_t)Value, 1, 1);
      sub_1000077C0((uint64_t)Value, 0LL);
      unint64_t v8 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"DARequestCallback");
      if (v8)
      {
        BOOL v9 = sub_1000053C4(v8);
        if (v9)
        {
          int v10 = v9;
          CFIndex v11 = (const __CFNumber *)CFDictionaryGetValue(a1, @"DARequestArgument2");
          unint64_t v12 = sub_10000937C(v11);
          double v13 = (const __CFNumber *)CFDictionaryGetValue(a1, @"DARequestArgument3");
          uint64_t v14 = sub_10000937C(v13);
          CFIndex v15 = sub_100005234(kCFAllocatorDefault, v10, (uint64_t)v12, (uint64_t)v14, 2u, 0LL, 0LL, 0LL);
          if (v15)
          {
            uint64_t v16 = v15;
            sub_1000077C0((uint64_t)Value, v15);
            CFRelease(v16);
          }
        }
      }

      double v17 = CFDictionaryGetValue(a1, @"DARequestDisk");
      sub_100009F4C("claimed disk, id = %@, success.", v17);
      sub_10000F0E8(a1, 0LL);
      uint64_t v7 = 1LL;
      uint64_t v18 = sub_10000795C((uint64_t)v17, 1, 0);
      sub_1000132B0(v18);
      CFRelease(a1);
    }
  }

  else
  {
    unsigned int v3 = (const __CFDictionary *)sub_1000074E8((uint64_t)Value);
    CFRetain(a1);
    sub_10000795C((uint64_t)Value, 1, 1);
    unsigned int v4 = sub_1000092BC(a1, @"DARequestState");
    sub_1000092F0(a1, @"DARequestState", v4 | 0x100000LL);
    if (v3)
    {
      if (sub_100005344(v3))
      {
        sub_10000D000(Value, v3, (uint64_t)sub_10000F344, (uint64_t)a1);
      }

      else
      {
        CFMutableDictionaryRef v19 = sub_100007C14(kCFAllocatorDefault, -119930872);
        sub_10000F344(v19, a1);
        CFRelease(v19);
      }
    }

    else
    {
      sub_10000F344(0LL, a1);
    }

    return 0LL;
  }

  return v7;
}

uint64_t sub_10000E44C(const __CFDictionary *a1)
{
  Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if ((sub_1000092BC(a1, @"DARequestState") & 0x100000) != 0)
  {
    if (!CFDictionaryGetValue(a1, @"DARequestDissenter"))
    {
      if (!sub_100014FEC((uint64_t)Value, 1))
      {
        CFRetain(a1);
        uint64_t v7 = 1LL;
        sub_10000795C((uint64_t)Value, 1, 1);
        sub_1000151A8((uint64_t)Value, 1, 1);
        sub_100009F4C("ejected disk, id = %@, ongoing.", Value);
        sub_1000154C0( (uint64_t)sub_10000F3DC,  (uint64_t)Value,  (uint64_t (*)(uint64_t, uint64_t))sub_10000F488,  (uint64_t)a1);
        return v7;
      }

      return 0LL;
    }

    uint64_t v6 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
    sub_10000F0E8(a1, v6);
  }

  else
  {
    unsigned int v3 = sub_100007500((uint64_t)Value, @"DAMediaWhole");
    if (sub_100007500((uint64_t)Value, @"DAMediaWhole") != kCFBooleanFalse && v3 != 0LL)
    {
      CFRetain(a1);
      sub_10000795C((uint64_t)Value, 1, 1);
      unsigned int v8 = sub_1000092BC(a1, @"DARequestState");
      sub_1000092F0(a1, @"DARequestState", v8 | 0x100000LL);
      sub_10000D6EC(Value, (uint64_t)sub_10000F390, (uint64_t)a1);
      return 0LL;
    }

    sub_10000F090(a1, -119930868);
  }

  sub_1000132B0(v5);
  return 1LL;
}

BOOL sub_10000E5F4(const __CFDictionary *a1)
{
  Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if ((sub_1000092BC(a1, @"DARequestState") & 0x10000) == 0)
  {
    unsigned int v4 = sub_100007500((uint64_t)Value, @"DAMediaPath");
    uint64_t v5 = (const __CFString *)CFDictionaryGetValue(a1, @"DARequestArgument3");
    if (sub_100007500((uint64_t)Value, @"DAVolumePath"))
    {
      int v6 = -119930878;
      if (!v5) {
        goto LABEL_42;
      }
      if (!sub_10000B12C(v5, @"update"))
      {
        BOOL v7 = sub_10000B12C(v5, @"-s=");
        if (v7) {
          int v6 = -119930868;
        }
        else {
          int v6 = -119930878;
        }
        if (!v7 || !v4) {
          goto LABEL_42;
        }
LABEL_27:
        unsigned int v10 = sub_1000092BC(a1, @"DARequestState");
        sub_1000092F0(a1, @"DARequestState", v10 & 0xFFFEFFFF | 0x10000LL);
        CFIndex v11 = CFDictionaryGetValue(a1, @"DARequestArgument3");
        if ((!v11 || !CFEqual(v11, @"automatic")) && !sub_100007500((uint64_t)Value, @"DAVolumePath"))
        {
          uint64_t v20 = sub_10000795C((uint64_t)Value, 0x10000, 0);
          sub_1000132B0(v20);
          return 0LL;
        }

uint64_t sub_10000E9D8(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, @"DARequestDisk");
  if ((sub_1000092BC(a1, @"DARequestState") & 0x10000) != 0)
  {
  }

  else if (!sub_100007500((uint64_t)Value, @"DAVolumePath"))
  {
    unsigned int v3 = sub_1000092BC(a1, @"DARequestState");
    sub_1000092F0(a1, @"DARequestState", v3 | 0x10000LL);
    uint64_t v4 = sub_10000795C((uint64_t)Value, 0x10000, 0);
    sub_1000132B0(v4);
    return 0LL;
  }

  if (sub_100007500((uint64_t)Value, @"DAVolumePath"))
  {
    sub_10000F090(a1, -119930878);
    sub_1000132B0(v7);
    return 1LL;
  }

  else
  {
    CFRetain(a1);
    uint64_t v5 = 1LL;
    sub_10000795C((uint64_t)Value, 1, 1);
    sub_1000151A8((uint64_t)Value, 1, 1);
    BOOL v8 = CFDictionaryGetValue(a1, @"DARequestDisk");
    sub_10000F0E8(a1, 0LL);
    sub_1000151A8((uint64_t)v8, 1, 0);
    uint64_t v9 = sub_10000795C((uint64_t)v8, 1, 0);
    sub_1000132B0(v9);
    CFRelease(a1);
  }

  return v5;
}

void sub_10000EB44(const __CFDictionary *a1)
{
  Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if (sub_100007500((uint64_t)Value, @"DAVolumeMountable") == kCFBooleanFalse)
  {
    sub_10000F090(a1, -119930868);
    sub_1000132B0(v7);
  }

  else
  {
    CFRetain(a1);
    sub_10000795C((uint64_t)Value, 1, 1);
    int v3 = sub_10000BC58(Value);
    uint64_t v4 = CFDictionaryGetValue(a1, @"DARequestDisk");
    if (v3) {
      int v5 = 49197;
    }
    else {
      int v5 = 0;
    }
    sub_10000F090(a1, v5);
    uint64_t v6 = sub_10000795C((uint64_t)v4, 1, 0);
    sub_1000132B0(v6);
    CFRelease(a1);
  }

uint64_t sub_10000EC1C(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, @"DARequestDisk");
  else {
    int v4 = 0;
  }
  if (CFDictionaryGetValue(a1, @"DARequestArgument2")) {
    int v5 = v4;
  }
  else {
    int v5 = -119930868;
  }
  if (v5)
  {
    sub_10000F090(a1, v5);
    sub_1000132B0(v6);
    return 1LL;
  }

  else
  {
    CFRetain(a1);
    uint64_t v3 = 1LL;
    sub_10000795C((uint64_t)Value, 1, 1);
    sub_1000151A8((uint64_t)Value, 1, 1);
    sub_100009F4C("renamed disk, id = %@, ongoing.", Value);
    uint64_t v7 = sub_100007510((uint64_t)Value);
    BOOL v8 = (const __CFURL *)sub_100007500((uint64_t)Value, @"DAVolumePath");
    uint64_t v9 = (const __CFString *)CFDictionaryGetValue(a1, @"DARequestArgument2");
    sub_1000086DC(v7, v8, v9, (void (*)(uint64_t, uint64_t))sub_10000F784, (uint64_t)a1);
  }

  return v3;
}

uint64_t sub_10000ED7C(const __CFDictionary *a1)
{
  Value = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
  if ((sub_1000092BC(a1, @"DARequestState") & 0x100000) != 0)
  {
LABEL_14:
    if (CFDictionaryGetValue(a1, @"DARequestDissenter"))
    {
      unsigned int v12 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
      uint64_t v3 = 1LL;
      sub_10000FABC(a1, 16, 1, 0LL);
      sub_10000F0E8(a1, v12);
      sub_1000132B0(v13);
      return v3;
    }

    if (!sub_100014FEC((uint64_t)Value, 1))
    {
      sub_1000092BC(a1, @"DARequestArgument1");
      CFRetain(a1);
      uint64_t v3 = 1LL;
      sub_10000795C((uint64_t)Value, 1, 1);
      sub_1000151A8((uint64_t)Value, 1, 1);
      sub_100009F4C("unmounted disk, id = %@, ongoing.", Value);
      uint64_t v15 = malloc(0x18uLL);
      v15[16] = 0;
      *(void *)uint64_t v15 = a1;
      *((void *)v15 + 1) = 0LL;
      sub_1000154C0( (uint64_t)sub_10000FC04,  (uint64_t)v15,  (uint64_t (*)(uint64_t, uint64_t))sub_10000FCD0,  (uint64_t)v15);
      return v3;
    }

    return 0LL;
  }

  int v4 = -119930878;
  int v5 = (const __CFBoolean *)sub_100007500((uint64_t)Value, @"DAVolumeMountable");
  if (!sub_100007500((uint64_t)Value, @"DAVolumePath"))
  {
    int v4 = -119930873;
    goto LABEL_10;
  }

  uint64_t v6 = (const __CFURL *)sub_100007500((uint64_t)Value, @"DAVolumePath");
  CFStringRef v7 = CFURLGetString(v6);
  if (CFEqual(v7, @"file:///") || (CFStringRef v8 = CFURLGetString(v6), CFEqual(v8, @"file:///System/Volumes/Data/")))
  {
    CFMutableDictionaryRef v9 = sub_100007C14(kCFAllocatorDefault, -119930878);
    sub_10000F2AC(a1, v9);
    CFRelease(v9);
LABEL_10:
    sub_10000F090(a1, v4);
    sub_1000132B0(v10);
    return 1LL;
  }

  if (v5 == kCFBooleanFalse)
  {
    int v4 = -119930868;
    goto LABEL_10;
  }

  if (sub_1000075C4((uint64_t)Value, 0x10000000))
  {
    unsigned int v11 = sub_1000092BC(a1, @"DARequestState");
    sub_1000092F0(a1, @"DARequestState", v11 & 0xFFEFFFFF | 0x100000LL);
    goto LABEL_14;
  }

  CFRetain(a1);
  sub_10000795C((uint64_t)Value, 1, 1);
  unsigned int v16 = sub_1000092BC(a1, @"DARequestState");
  sub_1000092F0(a1, @"DARequestState", v16 & 0xFFEFFFFF | 0x100000LL);
  if (sub_100007500((uint64_t)Value, @"DAMediaWritable") == kCFBooleanTrue) {
    sub_1000154C0( (uint64_t)sub_10000F958,  (uint64_t)Value,  (uint64_t (*)(uint64_t, uint64_t))sub_10000F9E4,  (uint64_t)a1);
  }
  else {
    sub_10000D7E0(Value, (uint64_t)sub_10000FA1C, (uint64_t)a1);
  }
  return 0LL;
}

void sub_10000F090(const __CFDictionary *a1, int a2)
{
  if (a2)
  {
    CFMutableDictionaryRef v3 = sub_100007C14(kCFAllocatorDefault, a2);
    sub_10000F0E8(a1, v3);
    CFRelease(v3);
  }

  else
  {
    sub_10000F0E8(a1, 0LL);
  }

void sub_10000F0E8(const __CFDictionary *a1, void *a2)
{
  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"DARequestCallback");
  if (Value)
  {
    int v5 = Value;
    uint64_t v6 = (const __CFArray *)CFDictionaryGetValue(a1, @"DARequestLink");
    if (v6)
    {
      CFStringRef v7 = v6;
      a2 = (void *)CFDictionaryGetValue(a1, @"DARequestDissenter");
      if (!a2)
      {
        CFIndex Count = CFArrayGetCount(v7);
        if (Count < 1)
        {
LABEL_8:
          a2 = 0LL;
        }

        else
        {
          CFIndex v9 = Count;
          CFIndex v10 = 0LL;
          while (1)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v7, v10);
            unsigned int v12 = (void *)CFDictionaryGetValue(ValueAtIndex, @"DARequestDissenter");
            if (v12) {
              break;
            }
            if (v9 == ++v10) {
              goto LABEL_8;
            }
          }

          a2 = v12;
        }
      }
    }

    uint64_t v13 = (void *)CFDictionaryGetValue(a1, @"DARequestDisk");
    sub_10000D0B4(v5, v13, a2);
  }

CFNumberRef sub_10000F1E0(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DARequestArgument1");
}

const void *sub_10000F1EC(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestArgument2");
}

const void *sub_10000F1F8(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestArgument3");
}

const void *sub_10000F204(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestCallback");
}

const void *sub_10000F210(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestDissenter");
}

const void *sub_10000F21C(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DARequestLink");
}

BOOL sub_10000F228(const __CFDictionary *a1, int a2)
{
  return (sub_1000092BC(a1, @"DARequestState") & a2) != 0LL;
}

CFNumberRef sub_10000F25C(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DARequestUserGID");
}

CFNumberRef sub_10000F278(const __CFDictionary *a1)
{
  return sub_1000092BC(a1, @"DARequestUserUID");
}

void sub_10000F294(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DARequestCallback", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DARequestCallback");
  }
}

void sub_10000F2AC(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DARequestDissenter", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DARequestDissenter");
  }
}

void sub_10000F2C4(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DARequestLink", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DARequestLink");
  }
}

void sub_10000F2DC(const __CFDictionary *a1, int a2, int a3)
{
  unsigned int v6 = sub_1000092BC(a1, @"DARequestState");
  if (a3) {
    uint64_t v7 = v6 | a2;
  }
  else {
    uint64_t v7 = v6 & ~a2;
  }
  sub_1000092F0(a1, @"DARequestState", v7);
}

void sub_10000F32C(__CFDictionary *a1, void *value)
{
  if (value) {
    CFDictionarySetValue(a1, @"DARequestArgument2", value);
  }
  else {
    CFDictionaryRemoveValue(a1, @"DARequestArgument2");
  }
}

void sub_10000F344(void *value, __CFDictionary *a2)
{
  CFMutableDictionaryRef v3 = CFDictionaryGetValue(a2, @"DARequestDisk");
  uint64_t v4 = sub_10000795C((uint64_t)v3, 1, 0);
  sub_1000132B0(v4);
  CFRelease(a2);
}

void sub_10000F390(void *value, __CFDictionary *a2)
{
  CFMutableDictionaryRef v3 = CFDictionaryGetValue(a2, @"DARequestDisk");
  uint64_t v4 = sub_10000795C((uint64_t)v3, 1, 0);
  sub_1000132B0(v4);
  CFRelease(a2);
}

uint64_t sub_10000F3DC(uint64_t a1)
{
  uint64_t v2 = (const char *)sub_1000074CC(a1, 1);
  int v3 = open(v2, 0);
  if (v3 == -1)
  {
    unsigned int v6 = __error();
    sub_100009F4C("open failed with %d for %@", *v6, a1);
    return *__error();
  }

  else
  {
    int v4 = v3;
    uint64_t v5 = ioctl(v3, 0x20006415uLL, 0LL);
    if ((_DWORD)v5 == -1)
    {
      if (*__error() == 25) {
        uint64_t v5 = 0LL;
      }
      else {
        uint64_t v5 = *__error();
      }
    }

    close(v4);
  }

  return v5;
}

void sub_10000F488(uint64_t a1, CFDictionaryRef theDict)
{
  Value = CFDictionaryGetValue(theDict, @"DARequestDisk");
  uint64_t v5 = sub_100007510((uint64_t)Value);
  if (v5)
  {
    unsigned int v6 = sub_10000805C(v5);
    if ((_DWORD)a1) {
      goto LABEL_3;
    }
LABEL_6:
    sub_100009F4C("ejected disk, id = %@, success.", Value);
    int v11 = 0;
    uint64_t v12 = (uint64_t)v6;
    int v10 = -1;
    goto LABEL_7;
  }

  unsigned int v6 = 0LL;
  if (!(_DWORD)a1) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"DARequestDissenter");
  if (v7)
  {
    CFStringRef v8 = v7;
    unint64_t v9 = (unint64_t)sub_100007C84(v7) & 0x3FFF;
    int v10 = sub_100007C68(v8);
    int v11 = v9;
    uint64_t v12 = (uint64_t)v6;
LABEL_7:
    sub_1000061CC(v11, v12, v10);
    goto LABEL_9;
  }

  sub_100009F4C("ejected disk, id = %@, failure.", Value);
  sub_100009F4C("unable to eject %@ (status code 0x%08X).", Value, a1);
  CFMutableDictionaryRef v13 = sub_100007C14(kCFAllocatorDefault, a1 | 0xC000);
  sub_10000F2AC(theDict, v13);
  CFRelease(v13);
LABEL_9:
  if ((_DWORD)a1) {
    int v14 = a1 | 0xC000;
  }
  else {
    int v14 = 0;
  }
  sub_10000F090(theDict, v14);
  sub_1000151A8((uint64_t)Value, 1, 0);
  uint64_t v15 = sub_10000795C((uint64_t)Value, 1, 0);
  sub_1000132B0(v15);
  CFRelease(theDict);
}

void sub_10000F5D4(void *value, __CFDictionary *a2)
{
  int v3 = CFDictionaryGetValue(a2, @"DARequestDisk");
  uint64_t v4 = sub_10000795C((uint64_t)v3, 1, 0);
  sub_1000132B0(v4);
  CFRelease(a2);
}

void sub_10000F620(int a1, const void *a2, CFDictionaryRef theDict)
{
  Value = (void *)CFDictionaryGetValue(theDict, @"DARequestDisk");
  if (a1)
  {
    CFMutableDictionaryRef v7 = sub_100007C14(kCFAllocatorDefault, a1 | 0xC000u);
    sub_10000F2AC(theDict, v7);
    CFRelease(v7);
  }

  else
  {
    int v10 = (const __CFString *)CFDictionaryGetValue(theDict, @"DARequestArgument3");
    if (a2)
    {
      int v11 = v10;
      if (v10)
      {
        if (sub_10000B12C(v10, @"-s=")) {
          goto LABEL_3;
        }
        sub_100007738((uint64_t)Value, a2);
        sub_100007880((uint64_t)Value, @"DAVolumePath", a2);
        if (sub_10000B12C(v11, @"update")) {
          goto LABEL_3;
        }
      }

      else
      {
        sub_100007738((uint64_t)Value, a2);
        sub_100007880((uint64_t)Value, @"DAVolumePath", a2);
      }

      sub_10000D5B0(Value, @"DAVolumePath");
    }
  }

void sub_10000F784(uint64_t a1, CFDictionaryRef theDict)
{
  Value = (void *)CFDictionaryGetValue(theDict, @"DARequestDisk");
  uint64_t v5 = Value;
  if ((_DWORD)a1)
  {
    sub_100009F4C("renamed disk, id = %@, failure.", Value);
    sub_100009F4C("unable to rename %@ (status code 0x%08X).", v5, a1);
    goto LABEL_14;
  }

  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    CFMutableArrayRef v7 = Mutable;
    int v8 = CFDictionaryGetValue(theDict, @"DARequestArgument2");
    if (!sub_100006344((uint64_t)v5, @"DAVolumeName", v8))
    {
LABEL_12:
      CFRelease(v7);
      goto LABEL_13;
    }

    sub_100007880((uint64_t)v5, @"DAVolumeName", v8);
    CFArrayAppendValue(v7, @"DAVolumeName");
    uint64_t v9 = (const __CFURL *)sub_100007500((uint64_t)v5, @"DAVolumePath");
    CFStringRef v10 = CFURLGetString(v9);
    int v11 = CFEqual(v10, @"file:///");
    uint64_t v12 = (const void *)sub_10000B46C();
    CFMutableDictionaryRef v13 = v12;
    if (v11)
    {
      if (v12)
      {
        sub_100007738((uint64_t)v5, v12);
LABEL_10:
        CFRelease(v13);
      }
    }

    else if (v12)
    {
      sub_100007738((uint64_t)v5, v12);
      sub_100007880((uint64_t)v5, @"DAVolumePath", v13);
      CFArrayAppendValue(v7, @"DAVolumePath");
      goto LABEL_10;
    }

    sub_10000D5B0(v5, v7);
    goto LABEL_12;
  }

uint64_t sub_10000F958(uint64_t a1)
{
  uint64_t v2 = (const __CFNumber *)sub_100007500(a1, @"DAMediaBlockSize");
  int v3 = sub_10000937C(v2);
  if (v3)
  {
    size_t v4 = (size_t)v3;
    uint64_t v5 = malloc((size_t)v3);
    if (v5)
    {
      unsigned int v6 = v5;
      CFMutableArrayRef v7 = (const char *)sub_1000074CC(a1, 1);
      int v8 = open(v7, 0);
      if (v8 != -1)
      {
        int v9 = v8;
        read(v8, v6, v4);
        close(v9);
      }

      free(v6);
    }
  }

  return 0LL;
}

void sub_10000F9E4(int a1, CFDictionaryRef theDict)
{
  Value = (void *)CFDictionaryGetValue(theDict, @"DARequestDisk");
  sub_10000D7E0(Value, (uint64_t)sub_10000FA1C, (uint64_t)theDict);
}

void sub_10000FA1C(const void *a1, CFDictionaryRef theDict)
{
  if (a1)
  {
  }

  Value = CFDictionaryGetValue(theDict, @"DARequestDisk");
  uint64_t v5 = sub_10000795C((uint64_t)Value, 1, 0);
  sub_1000132B0(v5);
  CFRelease(theDict);
}

CFDictionaryRef sub_10000FABC(const __CFDictionary *a1, int a2, int a3, uint64_t a4)
{
  Value = CFDictionaryGetValue(a1, @"DARequestDisk");
  BOOL result = (const __CFDictionary *)CFDictionaryGetValue(a1, @"DARequestDissenter");
  if (Value)
  {
    CFStringRef v10 = result;
    int v11 = (const __CFString *)sub_100007510((uint64_t)Value);
    sub_10000B474((uint64_t)Value, 3);
    if (v11)
    {
      uint64_t v12 = sub_10000805C((uint64_t)v11);
      else {
        int v11 = @"kext";
      }
      if (v10) {
        goto LABEL_7;
      }
    }

    else
    {
      uint64_t v12 = 0LL;
      if (v10) {
LABEL_7:
      }
        a2 = (unsigned __int16)sub_100007C84(v10) & 0x3FFF;
    }

    if (a4)
    {
      char v13 = *(_BYTE *)(a4 + 16) != 0;
      if (v10) {
        goto LABEL_10;
      }
    }

    else
    {
      char v13 = 0;
      if (v10)
      {
LABEL_10:
        int v14 = sub_100007C68(v10);
        if (a4)
        {
LABEL_11:
          uint64_t v15 = *(void *)(a4 + 8);
          return (const __CFDictionary *)sub_1000062A4(a2, (uint64_t)v12, (uint64_t)v11, v13, v14, a3 != 0, v15);
        }

LABEL_17:
        uint64_t v15 = 0LL;
        return (const __CFDictionary *)sub_1000062A4(a2, (uint64_t)v12, (uint64_t)v11, v13, v14, a3 != 0, v15);
      }
    }

    int v14 = -1;
    if (a4) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }

  return result;
}

uint64_t sub_10000FC04(uint64_t a1)
{
  uint64_t v2 = *(const __CFDictionary **)a1;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)a1, @"DARequestDisk");
  size_t v4 = (const __CFURL *)sub_100007500((uint64_t)Value, @"DAVolumePath");
  uint64_t v5 = sub_100009498(v4);
  if (!v5) {
    return 22LL;
  }
  unsigned int v6 = (char *)v5;
  if ((sub_1000092BC(v2, @"DARequestArgument1") & 0x80000) != 0)
  {
    *(_BYTE *)(a1 + 16) = 1;
    int v7 = 0x80000;
  }

  else
  {
    int v7 = 0;
  }

  __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  uint64_t v8 = unmount(v6, v7);
  if ((_DWORD)v8 == -1) {
    uint64_t v8 = *__error();
  }
  *(void *)(a1 + 8) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v9;
  free(v6);
  return v8;
}

void sub_10000FCD0(uint64_t a1, CFDictionaryRef *a2)
{
  size_t v4 = *a2;
  Value = (void *)CFDictionaryGetValue(*a2, @"DARequestDisk");
  if ((_DWORD)a1)
  {
    int v6 = getmntinfo(&v19, 2);
    int v7 = v6;
    if (v6 < 1)
    {
      int v9 = 0;
    }

    else
    {
      unint64_t v8 = 0LL;
      int v9 = 0;
      uint64_t v10 = 2168LL * v6;
      while (1)
      {
        int v11 = sub_1000099C4((uint64_t)&v19[v8 / 0x878]);
        uint64_t v12 = (const char *)sub_100007220((uint64_t)Value);
        char v13 = (const char *)sub_100007220((uint64_t)Value);
        size_t v14 = strlen(v13);
        if (!strncmp(v11, v12, v14 + 1)) {
          break;
        }
        ++v9;
        v8 += 2168LL;
        if (v10 == v8) {
          goto LABEL_10;
        }
      }
    }

    if (v9 != v7)
    {
      unsigned int v16 = (__CFDictionary *)CFDictionaryGetValue(v4, @"DARequestDissenter");
      if (v16)
      {
        CFMutableDictionaryRef v17 = v16;
      }

      else
      {
        sub_100009F4C("unmounted disk, id = %@, failure.", Value);
        sub_100009EFC("unable to unmount %@ (status code 0x%08X).", Value, a1);
        CFMutableDictionaryRef v17 = sub_100007C14(kCFAllocatorDefault, 49168);
        sub_10000F2AC(v4, v17);
        CFRelease(v17);
        LODWORD(a1) = 16;
      }

      sub_10000F0E8(v4, v17);
      sub_10000FABC(v4, a1, 0, (uint64_t)a2);
      goto LABEL_21;
    }

LABEL_10:
    sub_100009DD0(" %@ is not mounted. Ignore the umount error %d", Value, a1);
  }

  else
  {
    sub_10000FABC(v4, 0, 0, (uint64_t)a2);
  }

  uint64_t v15 = sub_100007500((uint64_t)Value, @"DAVolumePath");
  sub_100007738((uint64_t)Value, 0LL);
  sub_100009F4C("unmounted disk, id = %@, success.", Value);
  if (sub_100007500((uint64_t)Value, @"DAMediaPath"))
  {
    sub_100007880((uint64_t)Value, @"DAVolumePath", 0LL);
    sub_10000D5B0(Value, @"DAVolumePath");
  }

  else
  {
    sub_100009F4C("removed disk, id = %@.", Value);
    sub_10000D648(Value);
    sub_100007880((uint64_t)Value, @"DAVolumePath", 0LL);
    sub_10000795C((uint64_t)Value, 0x10000000, 1);
    sub_1000091E0((const __CFArray *)qword_100020EC8, Value);
  }

  sub_10000F0E8(v4, 0LL);
LABEL_21:
  sub_1000151A8((uint64_t)Value, 1, 0);
  uint64_t v18 = sub_10000795C((uint64_t)Value, 1, 0);
  sub_1000132B0(v18);
  CFRelease(v4);
  free(a2);
}

const void *sub_10000FF8C(const char *a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020EC8);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, v4);
    int v6 = (const char *)sub_100007220((uint64_t)ValueAtIndex);
    if (!strcmp(v6, a1)) {
      break;
    }
    if (v3 == ++v4) {
      return 0LL;
    }
  }

  return ValueAtIndex;
}

void sub_10001000C(int a1, io_iterator_t iterator)
{
  io_object_t v3 = IOIteratorNext(iterator);
  if (v3)
  {
    io_object_t v4 = v3;
    while (1)
    {
      uint64_t v5 = sub_1000103E8(v4);
      if (!v5) {
        break;
      }
      int v6 = v5;
      sub_100010468(v4);
      if (sub_100007500((uint64_t)v6, @"DAVolumeMountable") == kCFBooleanTrue
        && sub_100007500((uint64_t)v6, @"DAMediaLeaf") == kCFBooleanFalse)
      {
        sub_10000D788(v6, 0LL);
      }

LABEL_35:
      IOObjectRelease(v4);
      io_object_t v4 = IOIteratorNext(iterator);
      if (!v4) {
        goto LABEL_36;
      }
    }

    io_object_t notification = 0;
    IOServiceAddInterestNotification( (IONotificationPortRef)qword_100020EF8,  v4,  "IOBusyInterest",  (IOServiceInterestCallback)sub_1000108CC,  0LL,  &notification);
    io_object_t object = 0;
    IOServiceAddInterestNotification( (IONotificationPortRef)qword_100020EF8,  v4,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_1000108CC,  0LL,  &object);
    int v7 = (const void *)sub_1000063A0(kCFAllocatorDefault, v4);
    if (!v7)
    {
LABEL_31:
      if (notification) {
        IOObjectRelease(notification);
      }
      if (object) {
        IOObjectRelease(object);
      }
      goto LABEL_35;
    }

    unint64_t v8 = v7;
    if (sub_100009108((const __CFArray *)qword_100020EC8, v7))
    {
      int v9 = sub_1000046DC((const __CFArray *)qword_100020EC8, v8);
      sub_100010968((uint64_t)v9, 0);
    }

    if (notification) {
      sub_1000076F8((uint64_t)v8, notification);
    }
    if (object) {
      sub_10000791C((uint64_t)v8, object);
    }
    if (sub_1000074B0((uint64_t)v8, 1))
    {
      uint64_t v10 = (const char *)sub_1000074B0((uint64_t)v8, 1);
      if (strncmp(v10, "/dev/disk", 9uLL))
      {
        int v11 = (const char *)sub_1000074CC((uint64_t)v8, 1);
        uint64_t v12 = (const char *)sub_1000074B0((uint64_t)v8, 1);
        if (link(v11, v12))
        {
LABEL_19:
          uint64_t v16 = sub_1000074B0((uint64_t)v8, 1);
          sub_100009EFC("unable to link %@ to %s.", v8, v16);
          sub_100007778((uint64_t)v8, 1, 0LL);
          sub_100007778((uint64_t)v8, 0, 0LL);
          goto LABEL_20;
        }

        char v13 = (const char *)sub_1000074CC((uint64_t)v8, 0);
        size_t v14 = (const char *)sub_1000074B0((uint64_t)v8, 0);
        if (link(v13, v14))
        {
          uint64_t v15 = (const char *)sub_1000074B0((uint64_t)v8, 1);
          unlink(v15);
          goto LABEL_19;
        }
      }
    }

LABEL_20:
    CFMutableDictionaryRef v17 = sub_100007500((uint64_t)v8, @"DAMediaContent");
    if (CFEqual(v17, @"41504653-0000-11AA-AA11-00306543ECAC")) {
      sub_1000151A8((uint64_t)v8, 16, 1);
    }
    sub_100009F4C("created disk, id = %@.", v8);
    sub_1000151A8((uint64_t)v8, 0x10000, 0);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)qword_100020EC8, 0LL, v8);
    uint64_t v18 = malloc(0x10uLL);
    if (v18)
    {
      uint64_t v19 = (uint64_t)v18;
      v18[1] = v8;
      CFRetain(v8);
      sub_1000154C0((uint64_t)sub_10000C440, v19, (uint64_t (*)(uint64_t, uint64_t))sub_10000C448, v19);
    }

    if (sub_100007500((uint64_t)v8, @"DADeviceInternal") == kCFBooleanFalse
      || sub_100007500((uint64_t)v8, @"DAMediaRemovable") == kCFBooleanTrue)
    {
      sub_100004650();
    }

    CFRelease(v8);
    goto LABEL_31;
  }

LABEL_36:
  sub_1000132B0();
}

const void *sub_1000103E8(io_object_t a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020EC8);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, v4);
    io_object_t v6 = sub_100007518((uint64_t)ValueAtIndex);
    if (IOObjectIsEqualTo(v6, a1)) {
      break;
    }
    if (v3 == ++v4) {
      return 0LL;
    }
  }

  return ValueAtIndex;
}

void sub_100010468(io_object_t a1)
{
  uint64_t v2 = (void *)sub_1000103E8(a1);
  if (v2)
  {
    CFIndex v3 = v2;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      uint64_t v5 = Mutable;
      CFMutableDictionaryRef properties = 0LL;
      io_object_t v6 = CFGetAllocator(v3);
      IORegistryEntryCreateCFProperties(a1, &properties, v6, 0);
      if (properties)
      {
        Value = CFDictionaryGetValue(properties, @"Content");
        if (sub_100006344((uint64_t)v3, @"DAMediaContent", Value))
        {
          sub_100007880((uint64_t)v3, @"DAMediaContent", Value);
          CFArrayAppendValue(v5, @"DAMediaContent");
        }

        unint64_t v8 = CFDictionaryGetValue(properties, @"Ejectable");
        if (sub_100006344((uint64_t)v3, @"DAMediaEjectable", v8))
        {
          sub_100007880((uint64_t)v3, @"DAMediaEjectable", v8);
          CFArrayAppendValue(v5, @"DAMediaEjectable");
        }

        int v9 = CFDictionaryGetValue(properties, @"Leaf");
        if (sub_100006344((uint64_t)v3, @"DAMediaLeaf", v9))
        {
          sub_100007880((uint64_t)v3, @"DAMediaLeaf", v9);
          CFArrayAppendValue(v5, @"DAMediaLeaf");
        }

        uint64_t v10 = CFDictionaryGetValue(properties, @"Preferred Block Size");
        if (sub_100006344((uint64_t)v3, @"DAMediaBlockSize", v10))
        {
          sub_100007880((uint64_t)v3, @"DAMediaBlockSize", v10);
          CFArrayAppendValue(v5, @"DAMediaBlockSize");
        }

        int v11 = CFDictionaryGetValue(properties, @"Removable");
        if (sub_100006344((uint64_t)v3, @"DAMediaRemovable", v11))
        {
          sub_100007880((uint64_t)v3, @"DAMediaRemovable", v11);
          CFArrayAppendValue(v5, @"DAMediaRemovable");
        }

        uint64_t v12 = CFDictionaryGetValue(properties, @"Size");
        if (sub_100006344((uint64_t)v3, @"DAMediaSize", v12))
        {
          sub_100007880((uint64_t)v3, @"DAMediaSize", v12);
          CFArrayAppendValue(v5, @"DAMediaSize");
        }

        char v13 = (const __CFString *)CFDictionaryGetValue(properties, @"UUID");
        if (v13)
        {
          CFUUIDRef v14 = sub_100004EF8(kCFAllocatorDefault, v13);
          if (v14)
          {
            CFUUIDRef v15 = v14;
            if (sub_100006344((uint64_t)v3, @"DAMediaUUID", v14))
            {
              sub_100007880((uint64_t)v3, @"DAMediaUUID", v15);
              CFArrayAppendValue(v5, @"DAMediaUUID");
            }

            CFRelease(v15);
          }
        }

        uint64_t v16 = CFDictionaryGetValue(properties, @"Whole");
        if (sub_100006344((uint64_t)v3, @"DAMediaWhole", v16))
        {
          sub_100007880((uint64_t)v3, @"DAMediaWhole", v16);
          CFArrayAppendValue(v5, @"DAMediaWhole");
        }

        CFMutableDictionaryRef v17 = CFDictionaryGetValue(properties, @"Writable");
        if (sub_100006344((uint64_t)v3, @"DAMediaWritable", v17))
        {
          sub_100007880((uint64_t)v3, @"DAMediaWritable", v17);
          CFArrayAppendValue(v5, @"DAMediaWritable");
        }

        uint64_t v18 = malloc(0x10uLL);
        if (v18)
        {
          uint64_t v19 = (uint64_t)v18;
          v18[1] = v3;
          CFRetain(v3);
          sub_1000154C0((uint64_t)sub_10000C440, v19, (uint64_t (*)(uint64_t, uint64_t))sub_10000C448, v19);
        }

        CFTypeRef v20 = IORegistryEntrySearchCFProperty(a1, "IOService", @"AppleTDMLocked", kCFAllocatorDefault, 3u);
        if (sub_100006344((uint64_t)v3, @"DADeviceTDMLocked", v20))
        {
          sub_100007880((uint64_t)v3, @"DADeviceTDMLocked", v20);
          CFArrayAppendValue(v5, @"DADeviceTDMLocked");
        }

        if (v20) {
          CFRelease(v20);
        }
        if (CFArrayGetCount(v5))
        {
          sub_100009F4C("updated disk, id = %@.", v3);
        }

        CFRelease(properties);
      }

      CFRelease(v5);
    }
  }

void sub_1000108CC(uint64_t a1, io_object_t a2, int a3, uint64_t a4)
{
  if (a3 == -536870608)
  {
    sub_100010468(a2);
  }

  else if (a3 == -536870624)
  {
    uint64_t v5 = sub_1000103E8(a2);
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      if (a4)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        sub_1000076F0(v6, Current);
      }

      else
      {
        sub_10001000C((int)v5, dword_100020EEC);
        sub_1000076F0(v6, 0.0);
        sub_1000132B0();
      }
    }
  }

void sub_100010968(uint64_t a1, io_iterator_t a2)
{
  theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (a1) {
    io_object_t v4 = sub_100007518(a1);
  }
  else {
    io_object_t v4 = IOIteratorNext(a2);
  }
  io_object_t v5 = v4;
  if (v4)
  {
    CFBooleanRef v6 = kCFBooleanTrue;
    int v27 = -1;
    io_iterator_t v30 = a2;
    uint64_t v29 = a1;
    while (1)
    {
      int v7 = (void *)sub_1000103E8(v5);
      if (!v7)
      {
        if (a1) {
          sub_1000183BC();
        }
        sub_10001000C(0, dword_100020EEC);
        int v7 = (void *)sub_1000103E8(v5);
        if (!v7) {
          goto LABEL_43;
        }
      }

      sub_100009F4C("removed disk, id = %@.", v7);
      if (sub_1000074B0((uint64_t)v7, 1))
      {
        unint64_t v8 = (const char *)sub_1000074B0((uint64_t)v7, 1);
        unlink(v8);
      }

      if (sub_1000074B0((uint64_t)v7, 0))
      {
        int v9 = (const char *)sub_1000074B0((uint64_t)v7, 0);
        unlink(v9);
      }

      sub_10000D8C8(v7);
      if (sub_1000075C4((uint64_t)v7, 0x40000))
      {
        sub_10000795C((uint64_t)v7, 0x80000, 1);
        sub_10000D7C0(v7, 0x80000u, 0LL);
        uint64_t v10 = (const __CFBoolean *)sub_100007500((uint64_t)v7, @"DAVolumeMountable");
        if (sub_100007500((uint64_t)v7, @"DAVolumePath"))
        {
          if (v10 != kCFBooleanFalse && sub_100007500((uint64_t)v7, @"DAMediaWritable") == v6)
          {
            int v11 = (const __CFURL *)sub_100007500((uint64_t)v7, @"DAVolumePath");
            uint64_t v12 = sub_100009498(v11);
            if (!v12
              || (char v13 = v12, v14 = sub_100009020((const char *)v12, v31, 2), v15 = v31[64], free(v13), v14)
              || (v15 & 1) == 0)
            {
              CFMutableDataRef v16 = sub_10000758C(v7);
              CFArrayAppendValue(theArray, v16);
              int v27 = sub_1000074E0((uint64_t)v7);
            }
          }
        }
      }

      uint64_t v17 = sub_100007510((uint64_t)v7);
      uint64_t v18 = v17;
      if (!v17 || (uint64_t v19 = @"FSKit", !sub_100008080(v17))) {
        uint64_t v19 = @"kext";
      }
      BOOL v20 = sub_1000075C4((uint64_t)v7, 0x100000)
         && sub_1000075C4((uint64_t)v7, 2)
      int v21 = sub_100007500((uint64_t)v7, @"DAVolumePath");
      BOOL v22 = 0;
      if (v18) {
        goto LABEL_36;
      }
LABEL_37:
      BOOL v23 = sub_1000075C4((uint64_t)v7, 0x80000);
      BOOL v24 = sub_1000075C4((uint64_t)v7, 2);
      BOOL v25 = sub_1000075C4((uint64_t)v7, 0x200000);
      BOOL v26 = sub_1000075C4((uint64_t)v7, 0x10000000);
      sub_10000620C(v18, (uint64_t)v19, v21 != 0LL, v23, v22, v24, v25, v20, v26);
      CFBooleanRef v6 = kCFBooleanTrue;
      if (sub_100007500((uint64_t)v7, @"DAMediaWhole") == kCFBooleanTrue)
      {
        sub_1000151A8((uint64_t)v7, 16, 0);
        sub_1000151A8((uint64_t)v7, 2, 0);
        sub_1000151A8((uint64_t)v7, 4, 0);
      }

      sub_10000795C((uint64_t)v7, 0x10000000, 1);
      a2 = v30;
      a1 = v29;
      if (sub_100007500((uint64_t)v7, @"DADeviceInternal") == kCFBooleanFalse
        || sub_100007500((uint64_t)v7, @"DAMediaRemovable") == kCFBooleanTrue)
      {
        sub_100004694();
        sub_100013160();
      }

      sub_1000091E0((const __CFArray *)qword_100020EC8, v7);
      if (v29) {
        goto LABEL_47;
      }
LABEL_43:
      IOObjectRelease(v5);
      io_object_t v5 = IOIteratorNext(a2);
      if (!v5) {
        goto LABEL_47;
      }
    }

    BOOL v22 = sub_1000075C4((uint64_t)v7, 1);
    if (!v18) {
      goto LABEL_37;
    }
LABEL_36:
    uint64_t v18 = (uint64_t)sub_10000805C(v18);
    goto LABEL_37;
  }

LABEL_47:
  if (CFArrayGetCount(theArray)) {
    nullsub_1(theArray);
  }
  CFRelease(theArray);
  sub_1000132B0();
}

void sub_100010E78(int a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 8)
  {
    sub_100010F74(a1);
  }

  else if (a2 == 2)
  {
    uint64_t msg = dispatch_mach_msg_get_msg(a3, 0LL);
    if ((dispatch_mach_mig_demux(0LL, &off_10001CEE8, 1LL, a3) & 1) == 0)
    {
      if (*(_DWORD *)(msg + 20) == 70) {
        sub_100010F20(a1);
      }
      CFBooleanRef v6 = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
      mach_msg_destroy(v6);
    }
  }

void sub_100010F20(int a1)
{
  if (a1)
  {
    uint64_t v2 = sub_100011160(a1);
    if (v2) {
      sub_100012DD8((uint64_t)v2);
    }
  }

uint64_t sub_100010F74(int a1)
{
  if (a1 && (uint64_t v2 = sub_100011160(a1)) != 0LL)
  {
    CFIndex v3 = v2;
    sub_100009E68("%@ -> %s", v2, qword_100020F30);
    sub_100009DD0("  removed session, id = %@.", v3);
    io_object_t v4 = (__CFArray *)sub_1000074E8((uint64_t)v3);
    if (v4) {
      CFArrayRemoveAllValues(v4);
    }
    io_object_t v5 = (__CFArray *)sub_1000074F0((uint64_t)v3);
    if (v5) {
      CFArrayRemoveAllValues(v5);
    }
    sub_10000D9B0(v3);
    sub_100012EE4((uint64_t)v3, 0x10000000, 1);
    if (!sub_100012D08((uint64_t)v3))
    {
      sub_100004694();
      sub_100013160();
    }

    sub_1000091E0((const __CFArray *)qword_100020F48, v3);
    return 0LL;
  }

  else
  {
    sub_100009DD0("unable to release session, id = ? [?]:%d.", a1);
    return 4175036419LL;
  }

uint64_t sub_100011078(int a1, const char *a2, vm_address_t *a3, unsigned int *a4)
{
  if (!a1 || (unint64_t v8 = sub_100011160(a1)) == 0LL)
  {
    sub_100009E68("? [?]:%d -> %s");
LABEL_9:
    uint64_t v13 = 4175036419LL;
    sub_100009DD0("unable to copy disk description, id = %s (status code 0x%08X).", a2, -119930877);
    return v13;
  }

  int v9 = v8;
  uint64_t v10 = sub_10000FF8C(a2);
  if (!v10 || (int v11 = sub_10000758C(v10)) == 0LL || (v12 = sub_100009234(v11, a4), (*a3 = v12) == 0))
  {
    sub_100009E68("? [?]:%d -> %s", a1, (const char *)qword_100020F30);
    sub_100009E68("%@ -> %s", v9, qword_100020F30);
    goto LABEL_9;
  }

  return 0LL;
}

const void *sub_100011160(int a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020F48);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100020F48, v4);
    if (v3 == ++v4) {
      return 0LL;
    }
  }

  return ValueAtIndex;
}

uint64_t sub_1000111DC(int a1, const char *a2, _DWORD *a3)
{
  if (a1
    && (CFBooleanRef v6 = sub_100011160(a1)) != 0LL
    && (sub_100009E68("%@ -> %s", v6, qword_100020F30), (int v7 = sub_10000FF8C(a2)) != 0LL))
  {
    unint64_t v8 = v7;
    uint64_t v9 = sub_10000757C((uint64_t)v7);
    *a3 = v9;
    sub_100009DD0("  got disk options, id = %@, options = 0x%08X.", v8, v9);
    return 0LL;
  }

  else
  {
    uint64_t v10 = 4175036419LL;
    sub_100009DD0("unable to get disk options, id = %s (status code 0x%08X).", a2, -119930877);
  }

  return v10;
}

uint64_t sub_10001129C(int a1, const char *a2, _DWORD *a3)
{
  uint64_t v3 = 4175036419LL;
  if (a1)
  {
    if (sub_100011160(a1))
    {
      CFBooleanRef v6 = sub_10000FF8C(a2);
      if (v6)
      {
        uint64_t v3 = 0LL;
        *a3 = sub_1000075E8((uint64_t)v6);
      }
    }
  }

  return v3;
}

uint64_t sub_1000112F4(int a1, const char *a2, _DWORD *a3)
{
  if (a1
    && (CFBooleanRef v6 = sub_100011160(a1)) != 0LL
    && (sub_100009E68("%@ -> %s", v6, qword_100020F30), (int v7 = sub_10000FF8C(a2)) != 0LL))
  {
    unint64_t v8 = v7;
    uint64_t v9 = sub_1000074E8((uint64_t)v7);
    *a3 = v9 != 0;
    uint64_t v10 = "false";
    if (v9) {
      uint64_t v10 = "true";
    }
    sub_100009DD0("  got disk claim state, id = %@, claimed = %s.", v8, v10);
    return 0LL;
  }

  else
  {
    uint64_t v11 = 4175036419LL;
    sub_100009DD0("unable to get disk claim state, id = %s (status code 0x%08X).", a2, -119930877);
  }

  return v11;
}

uint64_t sub_1000113D0(int a1, const char *a2, int a3, _OWORD *a4)
{
  uint64_t v8 = 4175036419LL;
  sub_100009E68("? [?]:%d -> %s", a1, (const char *)qword_100020F30);
  if (!a1) {
    goto LABEL_8;
  }
  uint64_t v9 = sub_100011160(a1);
  if (!v9) {
    goto LABEL_8;
  }
  sub_100009E68("%@ -> %s", v9, qword_100020F30);
  uint64_t v10 = sub_10000FF8C(a2);
  if (!v10) {
    goto LABEL_8;
  }
  uint64_t v11 = (uint64_t)v10;
  __int128 v12 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v12;
  audit_token_to_euid(&atoken);
  __int128 v13 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v13;
  audit_token_to_egid(&atoken);
  uint64_t v8 = sub_100008358();
  if ((_DWORD)v8) {
    goto LABEL_8;
  }
  int v14 = "true";
  if (!a3) {
    int v14 = "false";
  }
  sub_100009DD0("  set disk adoption, id = %@, adoption = %s.", v11, v14);
  uint64_t v8 = sub_10000C01C(v11, a3);
  if ((_DWORD)v8) {
LABEL_8:
  }
    sub_100009DD0("unable to set disk adoption, id = %s (status code 0x%08X).", a2, v8);
  return v8;
}

uint64_t sub_100011510(int a1, const char *a2, uint64_t a3, _OWORD *a4)
{
  uint64_t v8 = 4175036419LL;
  sub_100009E68("? [?]:%d -> %s", a1, (const char *)qword_100020F30);
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v9 = sub_100011160(a1);
  if (!v9) {
    goto LABEL_6;
  }
  sub_100009E68("%@ -> %s", v9, qword_100020F30);
  uint64_t v10 = (void *)sub_10000FF8C(a2);
  if (!v10) {
    goto LABEL_6;
  }
  uint64_t v11 = v10;
  __int128 v12 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v12;
  audit_token_to_euid(&atoken);
  __int128 v13 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v13;
  audit_token_to_egid(&atoken);
  uint64_t v8 = sub_100008358();
  if ((_DWORD)v8
    || (sub_100009DD0("  set disk encoding, id = %@, encoding = %d.", v11, a3), uint64_t v8 = sub_10000C118(v11, a3), (_DWORD)v8))
  {
LABEL_6:
    sub_100009DD0("unable to set disk encoding, id = %s (status code 0x%08X).", a2, v8);
  }

  return v8;
}

uint64_t sub_100011638(int a1, const char *a2, uint64_t a3, int a4)
{
  if (a1
    && (uint64_t v8 = sub_100011160(a1)) != 0LL
    && (sub_100009E68("%@ -> %s", v8, qword_100020F30), (uint64_t v9 = sub_10000FF8C(a2)) != 0LL))
  {
    uint64_t v10 = (uint64_t)v9;
    uint64_t v11 = "true";
    if (!a4) {
      uint64_t v11 = "false";
    }
    sub_100009DD0("  set disk options, id = %@, options = 0x%08X, value = %s.", v9, a3, v11);
    sub_100007900(v10, a3, a4);
    return 0LL;
  }

  else
  {
    uint64_t v12 = 4175036419LL;
    sub_100009DD0("unable to set disk options, id = %s (status code 0x%08X).", a2, -119930877);
  }

  return v12;
}

uint64_t sub_100011728(int a1, const char *a2)
{
  if (a1
    && (CFIndex v4 = sub_100011160(a1)) != 0LL
    && (v5 = v4, sub_100009E68("%@ -> %s", v4, qword_100020F30), (CFBooleanRef v6 = sub_10000FF8C(a2)) != 0LL)
    && (v7 = (uint64_t)v6, (uint64_t v8 = (const __CFDictionary *)sub_1000074E8((uint64_t)v6)) != 0LL)
    && sub_1000053C4(v8) == v5)
  {
    sub_100009DD0("  unclaimed disk, id = %@.", v7);
    sub_1000077C0(v7, 0LL);
    return 0LL;
  }

  else
  {
    uint64_t v9 = 4175036419LL;
    sub_100009DD0("unable to unclaim disk, id = %s (status code 0x%08X).", a2, -119930877);
  }

  return v9;
}

uint64_t sub_100011800(int a1, vm_address_t *a2, unsigned int *a3)
{
  uint64_t v6 = 4175036419LL;
  sub_100009E68("? [?]:%d -> %s", a1, (const char *)qword_100020F30);
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v7 = sub_100011160(a1);
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = (uint64_t)v7;
  sub_100009E68("%s -> %@", qword_100020F30, v7);
  uint64_t v9 = (const __CFArray *)sub_1000074E8(v8);
  if (!v9)
  {
    sub_100012EE4(v8, 0x1000000, 0);
LABEL_14:
    sub_100009DD0("unable to copy callback queue (status code 0x%08X).", v6);
    return v6;
  }

  uint64_t v10 = v9;
  CFIndex Count = CFArrayGetCount(v9);
  if (Count >= 1)
  {
    CFIndex v12 = Count;
    for (CFIndex i = 0LL; i != v12; ++i)
    {
      ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(v10, i);
      sub_100005438(ValueAtIndex, 0LL);
      sub_100005450(ValueAtIndex, 0LL);
      sub_100005468(ValueAtIndex, 0LL);
    }
  }

  char v15 = sub_100009504(kCFAllocatorDefault, (uint64_t)v10);
  if (v15)
  {
    CFMutableDataRef v16 = v15;
    vm_address_t v17 = sub_100009234(v15, a3);
    *a2 = v17;
    if (v17)
    {
      sub_100009DD0("  dispatched callback queue.");
      uint64_t v6 = 0LL;
    }

    CFRelease(v16);
  }

  CFArrayRemoveAllValues(v10);
  sub_100012EE4(v8, 0x1000000, 0);
  if ((_DWORD)v6) {
    goto LABEL_14;
  }
  return v6;
}

BOOL sub_100011978(_OWORD *a1, const __CFString *a2)
{
  __int128 v3 = a1[1];
  *(_OWORD *)v10.val = *a1;
  *(_OWORD *)&v10.val[4] = v3;
  CFIndex v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v10);
  if (!v4) {
    return 0LL;
  }
  io_object_t v5 = v4;
  CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, a2, 0LL);
  if (v6)
  {
    uint64_t v7 = v6;
    BOOL v8 = CFEqual(v6, kCFBooleanTrue) != 0;
    CFRelease(v7);
  }

  else
  {
    BOOL v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

uint64_t sub_100011A1C(int a1, const char *a2, _OWORD *a3, _DWORD *a4)
{
  __int128 v8 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v8;
  pid_t v9 = audit_token_to_pid(&atoken);
  sub_100009E68("%s [%d] -> %s", a2, v9, (const char *)qword_100020F30);
  if (a1)
  {
    __int128 v10 = a3[1];
    *(_OWORD *)atoken.val = *a3;
    *(_OWORD *)&atoken.val[4] = v10;
    if (sub_100011978(&atoken, @"com.apple.private.diskarbitrationd.access"))
    {
      __int128 v11 = a3[1];
      *(_OWORD *)atoken.val = *a3;
      *(_OWORD *)&atoken.val[4] = v11;
      pid_t v12 = audit_token_to_pid(&atoken);
      uint64_t v13 = sub_100012B68(kCFAllocatorDefault, a2, v12);
      if (v13)
      {
        int v14 = (const void *)v13;
        sub_100009E68("%@ -> %s", v13, qword_100020F30);
        sub_100009DD0("  created session, id = %@.", v14);
        *a4 = sub_100012CCC((uint64_t)v14);
        sub_100004650();
        CFArrayAppendValue((CFMutableArrayRef)qword_100020F48, v14);
        sub_100012E0C((uint64_t)v14);
        CFRelease(v14);
        return 0LL;
      }
    }

    else
    {
      sub_100009DD0("no entitlement");
    }
  }

  __int128 v16 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v16;
  pid_t v17 = audit_token_to_pid(&atoken);
  sub_100009DD0("unable to create session, id = %s [%d].", a2, v17);
  return 4175036419LL;
}

uint64_t sub_100011B74( int a1, unsigned int a2, const char *a3, uint64_t a4, const UInt8 *a5, unsigned int a6, const UInt8 *a7, unsigned int a8, uint64_t a9, uint64_t a10, _OWORD *a11)
{
  uint64_t v18 = a10;
  sub_100009E68("? [?]:%d -> %s", a1, (const char *)qword_100020F30);
  if (!a1
    || (uint64_t v19 = sub_100011160(a1)) == 0LL
    || (BOOL v20 = v19, sub_100009E68("%@ -> %s", v19, qword_100020F30), (v66 = sub_10000FF8C(a3)) == 0LL))
  {
    uint64_t v23 = 4175036419LL;
LABEL_8:
    BOOL v24 = sub_1000094E0(a2);
    sub_100009DD0( "unable to queue solicitation, id = %016llX:%016llX, kind = %s, disk = %s (status code 0x%08X).",  a9,  v18,  v24,  a3,  v23);
    return v23;
  }

  sub_100009E68("%@ -> %s", v20, qword_100020F30);
  if (a5)
  {
    int v21 = (const __CFString *)sub_1000097FC(kCFAllocatorDefault, a5, a6);
    if (a7)
    {
LABEL_6:
      CFPropertyListRef v22 = sub_1000097FC(kCFAllocatorDefault, a7, a8);
      goto LABEL_12;
    }
  }

  else
  {
    int v21 = 0LL;
    if (a7) {
      goto LABEL_6;
    }
  }

  CFPropertyListRef v22 = 0LL;
LABEL_12:
  BOOL v26 = sub_100005234(kCFAllocatorDefault, v20, a9, a10, a2, 0LL, 0LL, 0LL);
  uint64_t v65 = a4;
  uint64_t v27 = (int)a4;
  __int128 v28 = a11[1];
  *(_OWORD *)atoken.val = *a11;
  *(_OWORD *)&atoken.val[4] = v28;
  uid_t v29 = audit_token_to_euid(&atoken);
  __int128 v30 = a11[1];
  *(_OWORD *)atoken.val = *a11;
  *(_OWORD *)&atoken.val[4] = v30;
  gid_t v31 = audit_token_to_egid(&atoken);
  CFUUIDRef v32 = v21;
  v33 = sub_10000DFA4((uint64_t)kCFAllocatorDefault, a2, v66, v27, v21, v22, v29, v31, v26);
  if (v33)
  {
    CFMutableDictionaryRef v34 = v33;
    switch(a2)
    {
      case 5u:
      case 0xCu:
      case 0xDu:
        __int128 v51 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v51;
        audit_token_to_euid(&atoken);
        __int128 v52 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v52;
        audit_token_to_egid(&atoken);
        uint64_t v23 = sub_100008358();
        goto LABEL_30;
      case 7u:
        __int128 v35 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v35;
        audit_token_to_euid(&atoken);
        __int128 v36 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v36;
        audit_token_to_egid(&atoken);
        uint64_t v23 = sub_100008358();
        if ((_DWORD)v23) {
          goto LABEL_34;
        }
        CFTypeID v37 = sub_100007500((uint64_t)v66, @"DAMediaContent");
        if (CFEqual(v37, @"C12A7328-F81F-11D2-BA4B-00A0C93EC93B"))
        {
          __int128 v38 = a11[1];
          *(_OWORD *)atoken.val = *a11;
          *(_OWORD *)&atoken.val[4] = v38;
          if (audit_token_to_euid(&atoken))
          {
            __int128 v39 = a11[1];
            *(_OWORD *)atoken.val = *a11;
            *(_OWORD *)&atoken.val[4] = v39;
            uid_t v40 = audit_token_to_euid(&atoken);
            if (v40 != sub_1000075E8((uint64_t)v66))
            {
              uint64_t v23 = 4175036424LL;
              goto LABEL_34;
            }
          }
        }

        if (!v32) {
          goto LABEL_33;
        }
        CFTypeID v41 = CFURLCreateWithString(kCFAllocatorDefault, v32, 0LL);
        if (!v41) {
          goto LABEL_33;
        }
        io_service_t v42 = v41;
        memset(&v69, 0, sizeof(v69));
        v43 = sub_100009498(v41);
        uint64_t v44 = 4175036419LL;
        cf = v42;
        if (!v43) {
          goto LABEL_57;
        }
        uint64_t v63 = v43;
        if ((v65 & 2) != 0)
        {
          __strlcpy_chk(&atoken, v43, 1024LL, 1024LL);
        }

        else
        {
          size_t v45 = strlen((const char *)&atoken);
          CFIndex v46 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)&atoken, v45, 1u);
          if (v46)
          {
            CFIndex v47 = v46;
            CFIndex v48 = (__CFString *)CFURLGetString(v46);
            sub_10000F32C(v34, v48);
            CFRelease(v47);
          }
        }

        __int128 v57 = a11[1];
        *(_OWORD *)v68.val = *a11;
        *(_OWORD *)&v68.val[4] = v57;
        if (audit_token_to_euid(&v68))
        {
          if (fstatat(-2, (const char *)&atoken, &v69, 2048))
          {
            uint64_t v44 = *__error() | 0xC000u;
          }

          else
          {
            __int128 v58 = a11[1];
            *(_OWORD *)v68.val = *a11;
            *(_OWORD *)&v68.val[4] = v58;
            uid_t v59 = audit_token_to_euid(&v68);
            if (v59 == v69.st_uid) {
              uint64_t v44 = 0LL;
            }
            else {
              uint64_t v44 = 4175036425LL;
            }
          }
        }

        else
        {
          uint64_t v44 = 0LL;
        }

        free(v63);
LABEL_57:
        __int128 v60 = a11[1];
        *(_OWORD *)v68.val = *a11;
        *(_OWORD *)&v68.val[4] = v60;
        if (audit_token_to_euid(&v68))
        {
          __int128 v61 = a11[1];
          *(_OWORD *)v68.val = *a11;
          *(_OWORD *)&v68.val[4] = v61;
          uid_t v62 = audit_token_to_euid(&v68);
          else {
            uint64_t v44 = 4175036425LL;
          }
        }

        CFRelease(cf);
        uint64_t v23 = v44;
        goto LABEL_30;
      case 0xAu:
        __int128 v49 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v49;
        pid_t v50 = audit_token_to_pid(&atoken);
        if (v50 == getpid())
        {
          sub_100009BA4("_kDADiskProbe authorized ourself");
LABEL_33:
          sub_10000DAFC(v34);
          CFTypeRef v53 = sub_1000094E0(a2);
          sub_100009F4C( "  %@ queued solicitation, id = %016llX:%016llX, kind = %s, disk = %@, options = 0x%08X.",  v20,  a9,  a10,  v53,  v66,  v65);
          uint64_t v23 = 0LL;
          goto LABEL_34;
        }

        int v54 = sub_100008358();
        __int128 v55 = a11[1];
        if (v54) {
          uint64_t v23 = 0LL;
        }
        else {
          uint64_t v23 = 4175036425LL;
        }
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v55;
        pid_t v56 = audit_token_to_pid(&atoken);
        sub_100009BA4("_kDADiskProbe checking request from pid %u, replying %d", v56, v23);
LABEL_30:
        if (!(_DWORD)v23) {
          goto LABEL_33;
        }
LABEL_34:
        CFRelease(v34);
        if (v26) {
          goto LABEL_35;
        }
        goto LABEL_36;
      case 0x11u:
        uint64_t v23 = 4175036425LL;
        goto LABEL_34;
      default:
        goto LABEL_33;
    }
  }

  uint64_t v23 = 4175036419LL;
  if (v26) {
LABEL_35:
  }
    CFRelease(v26);
LABEL_36:
  if (v32) {
    CFRelease(v32);
  }
  uint64_t v18 = a10;
  if (v22) {
    CFRelease(v22);
  }
  if ((_DWORD)v23) {
    goto LABEL_8;
  }
  return v23;
}

uint64_t sub_100012194( int a1, uint64_t a2, uint64_t a3, unsigned int a4, const char *a5, const UInt8 *a6, unsigned int a7, int a8)
{
  if (a1 && (__int128 v16 = sub_100011160(a1)) != 0LL)
  {
    sub_100009E68("%@ -> %s", v16, qword_100020F30);
    if (a6) {
      a6 = (const UInt8 *)sub_1000097FC(kCFAllocatorDefault, a6, a7);
    }
    if (!sub_10000CB68(a6, a8))
    {
      pid_t v17 = sub_1000094E0(a4);
      sub_100009DD0("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %s, orphaned.", a2, a3, v17, a5);
    }

    if (a6) {
      CFRelease(a6);
    }
    return 0LL;
  }

  else
  {
    uint64_t v18 = 4175036419LL;
    sub_100009DD0( "unable to dispatch response, id = %016llX:%016llX, disk = %s (status code 0x%08X).",  a2,  a3,  a5,  -119930877);
  }

  return v18;
}

uint64_t sub_1000122B4( int a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, __CFDictionary *a6, unsigned int a7, const UInt8 *a8, unsigned int a9)
{
  uint64_t v17 = 4175036419LL;
  sub_100009E68("? [?]:%d -> %s", a1, (const char *)qword_100020F30);
  if (!a1
    || (uint64_t v18 = sub_100011160(a1)) == 0LL
    || (uint64_t v19 = v18, sub_100009E68("%@ -> %s", v18, qword_100020F30), a4 > 0x11))
  {
LABEL_30:
    uint64_t v27 = sub_1000094E0(a4);
    sub_100009DD0( "unable to register callback, id = %016llX:%016llX, kind = %s (status code 0x%08X).",  a2,  a3,  v27,  v17);
    return v17;
  }

  if (a6) {
    a6 = sub_1000097A0(kCFAllocatorDefault, (const UInt8 *)a6, a7);
  }
  if (a8) {
    a8 = (const UInt8 *)sub_1000097FC(kCFAllocatorDefault, a8, a9);
  }
  BOOL v20 = sub_100005234(kCFAllocatorDefault, v19, a2, a3, a4, a5, a6, a8);
  if (v20)
  {
    sub_100012DD0((uint64_t)v19, v20);
    int v21 = sub_1000094E0(a4);
    sub_100009DD0("  registered callback, id = %016llX:%016llX, kind = %s.", a2, a3, v21);
    if (sub_100005380(v20))
    {
      if (sub_100005380(v20) != 15)
      {
LABEL_23:
        CFRelease(v20);
        uint64_t v17 = 0LL;
        goto LABEL_24;
      }

      if (!byte_1000200B8)
      {
        int v26 = 0;
        goto LABEL_22;
      }

      sub_10000D0B4(v20, 0LL, 0LL);
    }

    else
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020EC8);
      if (Count >= 1)
      {
        CFIndex v23 = Count;
        for (CFIndex i = 0LL; i != v23; ++i)
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, i);
        }
      }

      sub_10000D834((uint64_t)v19, 16, 0LL, 0LL);
      if (!byte_1000200B8) {
        goto LABEL_23;
      }
      sub_10000D834((uint64_t)v19, 15, 0LL, 0LL);
    }

    int v26 = 1;
LABEL_22:
    sub_100012EE4((uint64_t)v19, 1, v26);
    goto LABEL_23;
  }

LABEL_24:
  if (a6) {
    CFRelease(a6);
  }
  if (a8) {
    CFRelease(a8);
  }
  if (!v20) {
    goto LABEL_30;
  }
  return 0LL;
}

uint64_t sub_100012538(int a1)
{
  if (a1 && (uint64_t v2 = sub_100011160(a1)) != 0LL)
  {
    uint64_t v3 = (uint64_t)v2;
    sub_100009E68("%@ -> %s", v2, qword_100020F30);
    sub_100009DD0("  set keepalive, id = %@.", v3);
    sub_100012F00(v3, 1);
    sub_100004694();
    sub_100013160();
    return 0LL;
  }

  else
  {
    uint64_t v4 = 4175036419LL;
    sub_100009DD0("unable to set keep alive,  (status code 0x%08X).", -119930877);
  }

  return v4;
}

uint64_t sub_1000125E8(int a1, int a2)
{
  if (a1 && (uint64_t v4 = sub_100011160(a1)) != 0LL)
  {
    uint64_t v5 = (uint64_t)v4;
    sub_100009E68("%@ -> %s", v4, qword_100020F30);
    sub_100012E24(v5, a2);
    sub_100009DD0("  set client port, id = %@.", v5);
    return 0LL;
  }

  else
  {
    sub_100009DD0("unable to set client port, id = ? [?]:%d.", a1);
    return 4175036419LL;
  }

uint64_t sub_10001269C(int a1, uint64_t a2, uint64_t a3)
{
  if (a1
    && (CFTypeRef v6 = sub_100011160(a1)) != 0LL
    && (uint64_t v7 = v6,
        sub_100009E68("%@ -> %s", v6, qword_100020F30),
        (__int128 v8 = sub_100005234(kCFAllocatorDefault, v7, a2, a3, 0, 0LL, 0LL, 0LL)) != 0LL))
  {
    pid_t v9 = v8;
    sub_10000DDA0(v8);
    sub_100012F08((uint64_t)v7, v9);
    sub_100009DD0("  unregistered callback, id = %016llX:%016llX.", a2, a3);
    CFRelease(v9);
    return 0LL;
  }

  else
  {
    uint64_t v10 = 4175036419LL;
    sub_100009DD0("unable to unregister callback, id = %016llX:%016llX (status code 0x%08X).", a2, a3, -119930877);
  }

  return v10;
}

void sub_100012798(uint64_t a1)
{
  uint64_t v2 = sub_100007228(kCFAllocatorDefault, a1);
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    sub_100009F4C("created disk, id = %@.", v2);
    if ((*(_BYTE *)(a1 + 67) & 0x40) != 0)
    {
      uint64_t v4 = strrchr((const char *)(a1 + 1112), 64) + 1;
      if (!strncmp(v4, "/dev/disk", 9uLL))
      {
        uint64_t v5 = sub_10000FF8C(v4);
        if (v5)
        {
        }
      }
    }

    CFArrayInsertValueAtIndex((CFMutableArrayRef)qword_100020EC8, 0LL, v3);
    CFRelease(v3);
  }

void sub_100012870()
{
  int v0 = getmntinfo(&v8, 2);
  if (v0 >= 1)
  {
    unint64_t v1 = 0LL;
    uint64_t v2 = 2168LL * v0;
    do
    {
      uint64_t v3 = sub_1000099C4((uint64_t)&v8[v1 / 0x878]);
      uint64_t v4 = sub_10000FF8C(v3);
      if (v4)
      {
        uint64_t v5 = v4;
        if (!sub_100007500((uint64_t)v4, @"DAVolumePath"))
        {
          sub_10000D7A4(v5, 0LL);
        }
      }

      else
      {
        CFTypeRef v6 = v8;
        uint64_t v7 = &v8[v1 / 0x878];
        if (strncmp(v8[v1 / 0x878].f_mntfromname, "/dev/disk", 9uLL)
          && (v7->f_flags & 0x20) == 0
          && strcmp(v6[v1 / 0x878].f_fstypename, "devfs"))
        {
          sub_100012798((uint64_t)v7);
          sub_1000132B0();
        }
      }

      v1 += 2168LL;
    }

    while (v2 != v1);
  }

void sub_1000129A8()
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020EC8);
  if (Count >= 1)
  {
    CFIndex v1 = Count;
    for (CFIndex i = 0LL; i != v1; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, i);
    }
  }

uint64_t sub_100012A30()
{
  if (qword_100020DE0 != -1) {
    dispatch_once(&qword_100020DE0, &stru_10001CF10);
  }
  return qword_100020DE8;
}

void sub_100012A70(id a1)
{
  qword_100020DE8 = (uint64_t)dispatch_workloop_create_inactive("DAServer");
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_100020DE8);
}

uint64_t sub_100012AA8()
{
  if (dword_100020DF0
    || (uint64_t result = bootstrap_check_in( bootstrap_port,  "com.apple.DiskArbitration.diskarbitrationd",  (mach_port_t *)&dword_100020DF0),  dword_100020DF0))
  {
    if (qword_100020DE0 != -1) {
      dispatch_once(&qword_100020DE0, &stru_10001CF10);
    }
    qword_100020DF8 = dispatch_mach_create_f("diskarbitrationd", qword_100020DE8, 0LL, sub_100010E78);
    return dispatch_mach_connect(qword_100020DF8, dword_100020DF0, 0LL, 0LL);
  }

  return result;
}

uint64_t sub_100012B60(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t sub_100012B68(const __CFAllocator *a1, const char *a2, int a3)
{
  uint64_t Instance = _CFRuntimeCreateInstance(a1, qword_100020E00, 64LL, 0LL);
  uint64_t v7 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 0;
    *(void *)(Instance + 24) = 0LL;
    *(void *)(Instance + 32) = 0LL;
    *(void *)(Instance + 40) = CFArrayCreateMutable(a1, 0LL, &kCFTypeArrayCallBacks);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, 0LL, &kCFTypeArrayCallBacks);
    *(void *)(v7 + 48) = Mutable;
    *(void *)(v7 + 64) = 0LL;
    *(_BYTE *)(v7 + 72) = 0;
    if (!*(void *)(v7 + 40)) {
      sub_1000183E4();
    }
    if (!Mutable) {
      sub_10001840C();
    }
    if (mach_port_allocate(mach_task_self_, 1u, &name)) {
      goto LABEL_8;
    }
    uint64_t v9 = sub_100012A30();
    uint64_t f = dispatch_mach_create_f("diskarbitrationd/session", v9, name, sub_100010E78);
    if (!f || (uint64_t v11 = f, mach_port_request_notification(mach_task_self_, name, 70, 1u, name, 0x15u, &previous)))
    {
      mach_port_mod_refs(mach_task_self_, name, 1u, -1);
LABEL_8:
      CFRelease((CFTypeRef)v7);
      return 0LL;
    }

    if (previous) {
      sub_100018434();
    }
    *(void *)(v7 + 24) = strdup(a2);
    *(_DWORD *)(v7 + 32) = a3;
    *(void *)(v7 + 56) = v11;
    *(_DWORD *)(v7 + 64) = name;
  }

  return v7;
}

uint64_t sub_100012CCC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

BOOL sub_100012CD4(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 36) & a2) != 0;
}

uint64_t sub_100012CE4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

BOOL sub_100012CEC(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 68) & a2) != 0;
}

uint64_t sub_100012CFC()
{
  return qword_100020E00;
}

uint64_t sub_100012D08(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 72);
}

uint64_t sub_100012D10()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_10001CF30);
  qword_100020E00 = result;
  return result;
}

void sub_100012D34(uint64_t a1, const void *a2)
{
  *(_DWORD *)(a1 + 68) &= ~1u;
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2);
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 40)) == 1)
  {
    mach_port_t v3 = *(_DWORD *)(a1 + 16);
    if (v3)
    {
      *(void *)&msg.msgh_voucher_port = 0LL;
      msg.msgh_remote_port = v3;
      msg.msgh_local_port = 0;
      *(void *)&msg.msgh_bits = 0x1800000013LL;
      if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460) {
        mach_msg_destroy(&msg);
      }
    }
  }

void sub_100012DD0(uint64_t a1, const void *a2)
{
}

void sub_100012DD8(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    dispatch_mach_cancel();
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
    *(void *)(a1 + 56) = 0LL;
  }

uint64_t sub_100012E0C(uint64_t a1)
{
  return dispatch_mach_connect(*(void *)(a1 + 56), *(unsigned int *)(a1 + 64), 0LL, 0LL);
}

void sub_100012E24(uint64_t a1, int a2)
{
  mach_port_name_t v4 = *(_DWORD *)(a1 + 16);
  if (v4) {
    mach_port_deallocate(mach_task_self_, v4);
  }
  *(_DWORD *)(a1 + 16) = a2;
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 40)))
  {
    mach_port_t v5 = *(_DWORD *)(a1 + 16);
    if (v5)
    {
      *(void *)&msg.msgh_voucher_port = 0LL;
      msg.msgh_remote_port = v5;
      msg.msgh_local_port = 0;
      *(void *)&msg.msgh_bits = 0x1800000013LL;
      if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460) {
        mach_msg_destroy(&msg);
      }
    }
  }

uint64_t sub_100012EC8(uint64_t result, int a2, int a3)
{
  if (a3) {
    int v3 = a2;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(result + 36) = *(_DWORD *)(result + 36) & ~a2 | v3;
  return result;
}

uint64_t sub_100012EE4(uint64_t result, int a2, int a3)
{
  if (a3) {
    int v3 = a2;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) & ~a2 | v3;
  return result;
}

uint64_t sub_100012F00(uint64_t result, char a2)
{
  *(_BYTE *)(result + 72) = a2;
  return result;
}

void sub_100012F08(uint64_t a1, const __CFDictionary *a2)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 48));
  if (Count >= 1)
  {
    unint64_t v5 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v5 - 2);
      uint64_t v7 = sub_100005344(ValueAtIndex);
      if (v7 == sub_100005344(a2))
      {
        __int128 v8 = sub_100005368(ValueAtIndex);
        if (v8 == sub_100005368(a2)) {
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 48), v5 - 2);
        }
      }

      --v5;
    }

    while (v5 > 1);
  }

  CFIndex v9 = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
  if (v9 >= 1)
  {
    unint64_t v10 = v9 + 1;
    do
    {
      uint64_t v11 = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), v10 - 2);
      pid_t v12 = sub_100005344(v11);
      if (v12 == sub_100005344(a2))
      {
        uint64_t v13 = sub_100005368(v11);
        if (v13 == sub_100005368(a2)) {
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 40), v10 - 2);
        }
      }

      --v10;
    }

    while (v10 > 1);
  }

void sub_100013020(uint64_t a1)
{
  mach_port_name_t v2 = *(_DWORD *)(a1 + 16);
  if (v2) {
    mach_port_deallocate(mach_task_self_, v2);
  }
  int v3 = *(void **)(a1 + 24);
  if (v3) {
    free(v3);
  }
  mach_port_name_t v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
  unint64_t v5 = *(const void **)(a1 + 48);
  if (v5) {
    CFRelease(v5);
  }
  mach_port_name_t v6 = *(_DWORD *)(a1 + 64);
  if (v6) {
    mach_port_mod_refs(mach_task_self_, v6, 1u, -1);
  }
}

BOOL sub_100013098(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 64) == *(_DWORD *)(a2 + 64);
}

uint64_t sub_1000130AC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

CFStringRef sub_1000130B4(uint64_t a1)
{
  mach_port_name_t v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat( v2,  0LL,  @"%s [%d]:%d",  *(void *)(a1 + 24),  *(unsigned int *)(a1 + 32),  *(unsigned int *)(a1 + 64));
}

CFStringRef sub_100013100(uint64_t a1)
{
  mach_port_name_t v2 = CFGetAllocator((CFTypeRef)a1);
  CFAllocatorRef v3 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat( v2,  0LL,  @"<DASession %p [%p]>{id = %s [%d]:%d}",  a1,  v3,  *(void *)(a1 + 24),  *(unsigned int *)(a1 + 32),  *(unsigned int *)(a1 + 64));
}

void sub_100013160()
{
  int v0 = byte_1000200B8;
  int v1 = sub_1000046D0();
  sub_100009F4C("__DASetIdleTimer %d %x", v0, v1);
  if (!sub_1000046D0() && byte_1000200B8 == 1)
  {
    qword_100020F60 = CFAbsoluteTimeGetCurrent();
    if (!byte_100020EE8)
    {
      sub_100009F4C("Idle timer started ");
      byte_100020EE8 = 1;
      dispatch_time_t v2 = dispatch_time(0LL, 20000000000LL);
      CFAllocatorRef v3 = (dispatch_queue_s *)sub_100012A30();
      dispatch_after(v2, v3, &stru_10001CFB0);
    }
  }

void sub_100013224(id a1)
{
  byte_100020EE8 = 0;
  if (byte_1000200B8 == 1 && !sub_1000046D0())
  {
    CFAbsoluteTime v1 = *(double *)&qword_100020F60 + 20.0;
    if (v1 < CFAbsoluteTimeGetCurrent())
    {
      sub_100009F4C("__DAIdleTimerCallback exiting");
      exit(0);
    }

    sub_100013160();
  }

void sub_1000132B0()
{
  if (byte_1000200B8) {
    sub_100004650();
  }
  byte_1000200B8 = 0;
  int v0 = (dispatch_queue_s *)sub_100012A30();
  dispatch_async_f(v0, 0LL, (dispatch_function_t)sub_1000132F0);
}

void sub_1000132F0()
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100020EC8);
  if (Count < 1)
  {
    int v3 = 1;
  }

  else
  {
    CFIndex v1 = Count;
    CFIndex v2 = 0LL;
    int v3 = 1;
    double v4 = kCFAbsoluteTimeIntervalSince1904;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, v2);
      if (ValueAtIndex)
      {
        uint64_t v6 = (uint64_t)ValueAtIndex;
        double v7 = sub_100007498((uint64_t)ValueAtIndex);
        double v8 = v7;
        if (v7 == 0.0)
        {
          if (sub_100007500(v6, @"DAMediaWhole") == kCFBooleanTrue) {
            sub_1000151A8(v6, 4, 1);
          }
        }

        else
        {
          double v8 = v7 + 10.0;
        }

        if (v8 == 0.0 || v8 < CFAbsoluteTimeGetCurrent())
        {
          if (sub_100007500(v6, @"DAMediaWhole") == kCFBooleanTrue) {
            sub_1000151A8(v6, 2, 1);
          }
        }

        else
        {
          int v3 = 0;
          if (v8 + 1.0 < v4) {
            double v4 = v8 + 1.0;
          }
        }
      }

      ++v2;
    }

    while (v1 != v2);
    if (kCFAbsoluteTimeIntervalSince1904 > v4 && CFAbsoluteTimeGetCurrent() < v4)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      dispatch_time_t v10 = dispatch_time(0LL, 1000000000 * (uint64_t)(v4 - Current));
      uint64_t v11 = (dispatch_queue_s *)sub_100012A30();
      dispatch_after(v10, v11, &stru_10001CFF0);
    }
  }

  CFIndex v12 = CFArrayGetCount((CFArrayRef)qword_100020EC8);
  if (v12 >= 1)
  {
    CFIndex v13 = v12;
    CFIndex v14 = 0LL;
    CFIndex v68 = v12;
    char v15 = &selRef_numberWithBool_;
    do
    {
      __int128 v16 = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, v14);
      if (!sub_1000075C4((uint64_t)v16, 1))
      {
        if (sub_1000075C4((uint64_t)v16, 0x10000))
        {
          if (sub_1000075C4((uint64_t)v16, 0x20000))
          {
            if (sub_1000075C4((uint64_t)v16, 0x40000))
            {
              if (sub_1000075C4((uint64_t)v16, 0x80000))
              {
                if (!qword_100020EC0)
                {
                  if (sub_100007500((uint64_t)v16, @"DAMediaType"))
                  {
                    uint64_t v17 = (const __CFNumber *)sub_100007500((uint64_t)v16, @"DAMediaSize");
                    if (v17)
                    {
                      if (!sub_10000937C(v17) && !sub_100014F94((uint64_t)v16, 0x10000))
                      {
                        sub_1000151A8((uint64_t)v16, 0x10000, 1);
                      }
                    }
                  }
                }

                goto LABEL_23;
              }

              sub_10000795C((uint64_t)v16, 0x80000, 1);
              sub_10000CF24(v16);
              sub_1000132B0(v35);
            }

            else
            {
              if (byte_100020ED0) {
                goto LABEL_23;
              }
              if (sub_1000075C4((uint64_t)v16, 2))
              {
                CFIndex v31 = CFArrayGetCount((CFArrayRef)qword_100020EC8);
                if (v31 < 1)
                {
                  CFIndex v32 = 0LL;
                }

                else
                {
                  CFIndex v32 = 0LL;
                  while (1)
                  {
                    v33 = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, v32);
                    int v34 = sub_1000074E0((uint64_t)v16);
                    if (v34 == sub_1000074E0((uint64_t)v33)
                      && (!sub_1000075C4((uint64_t)v33, 0x10000)
                       || !sub_1000075C4((uint64_t)v33, 0x40000) && !sub_1000075C4((uint64_t)v33, 2)))
                    {
                      break;
                    }

                    if (v31 == ++v32) {
                      goto LABEL_66;
                    }
                  }
                }

                if (v32 == v31) {
LABEL_66:
                }
                  sub_100013BB0((uint64_t)v16);
                int v3 = 0;
                goto LABEL_51;
              }

              sub_100013BB0((uint64_t)v16);
            }
          }

          else
          {
            CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
            if (Mutable)
            {
              uint64_t v19 = Mutable;
              BOOL v20 = (const __CFArray *)qword_100020F48;
              CFIndex v21 = CFArrayGetCount((CFArrayRef)qword_100020F48);
              if (v21 >= 1)
              {
                CFIndex v22 = v21;
                for (CFIndex i = 0LL; i != v22; ++i)
                {
                  BOOL v24 = CFArrayGetValueAtIndex(v20, i);
                  BOOL v25 = (const __CFArray *)sub_1000074F0((uint64_t)v24);
                  CFIndex v26 = CFArrayGetCount(v25);
                  if (v26 >= 1)
                  {
                    CFIndex v27 = v26;
                    for (CFIndex j = 0LL; j != v27; ++j)
                    {
                      uid_t v29 = CFArrayGetValueAtIndex(v25, j);
                    }
                  }
                }
              }

              v69.length = CFArrayGetCount(v19);
              v69.location = 0LL;
              CFArraySortValues(v19, v69, (CFComparatorFunction)sub_100014028, 0LL);
              CFRetain(v16);
              sub_100007800((uint64_t)v16, v19);
              sub_10000795C((uint64_t)v16, 0x20000, 1);
              uint64_t v30 = sub_10000795C((uint64_t)v16, 1, 1);
              sub_100014060(v30, (uint64_t)v16);
              CFRelease(v19);
              int v3 = 0;
              CFIndex v13 = v68;
LABEL_51:
              char v15 = &selRef_numberWithBool_;
              goto LABEL_23;
            }
          }
        }

        else
        {
          if (*((_BYTE *)v15 + 3592) == 1)
          {
            sub_1000140FC();
            sub_100014438();
            sub_10001483C();
            *((_BYTE *)v15 + 3592) = 0;
          }

          if (!sub_100014FEC((uint64_t)v16, 1))
          {
            CFRetain(v16);
            sub_10000795C((uint64_t)v16, 0x10000, 1);
            sub_10000795C((uint64_t)v16, 1, 1);
            sub_1000151A8((uint64_t)v16, 1, 1);
            sub_10000C6FC( v16,  0LL,  (void (*)(uint64_t, uint64_t, void, void, void, void, uint64_t))sub_100013C08,  (uint64_t)v16);
          }
        }
      }

      int v3 = 0;
LABEL_23:
      ++v14;
    }

    while (v14 != v13);
  }

  CFIndex v36 = CFArrayGetCount((CFArrayRef)qword_100020F38);
  if (v36)
  {
    uint64_t v37 = v36;
    CFMutableSetRef v38 = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
    if (v38)
    {
      __int128 v39 = v38;
      if (v37 >= 1)
      {
        CFIndex v40 = 0LL;
        while (1)
        {
          CFTypeID v41 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020F38, v40);
          if (!v41) {
            goto LABEL_100;
          }
          io_service_t v42 = v41;
          v43 = sub_10000E1D8(v41);
          if (!v43) {
            break;
          }
          uint64_t v44 = (const __CFArray *)sub_10000F21C(v42);
          if (!v44)
          {
            if (CFSetContainsValue(v39, v43)) {
              goto LABEL_95;
            }
LABEL_89:
            if (sub_10000E1E4(v42) == 7 && byte_100020E08)
            {
              sub_1000140FC();
              sub_100014438();
              sub_10001483C();
              byte_100020E08 = 0;
            }

            if (sub_10000E0D8((uint64_t)v42))
            {
              CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100020F38, v40);
              --v37;
              --v40;
              goto LABEL_100;
            }

            goto LABEL_94;
          }

          size_t v45 = v44;
          CFIndex v46 = CFArrayGetCount(v44);
          if (v46 < 1)
          {
            BOOL v50 = 0;
          }

          else
          {
            CFIndex v47 = v46;
            CFIndex v48 = (const __CFDictionary *)CFArrayGetValueAtIndex(v45, 0LL);
            __int128 v49 = sub_10000E1D8(v48);
            if (CFSetContainsValue(v39, v49))
            {
              BOOL v50 = 1;
            }

            else
            {
              CFIndex v51 = 1LL;
              do
              {
                CFIndex v52 = v51;
                if (v47 == v51) {
                  break;
                }
                CFTypeRef v53 = (const __CFDictionary *)CFArrayGetValueAtIndex(v45, v51);
                int v54 = sub_10000E1D8(v53);
                int v55 = CFSetContainsValue(v39, v54);
                CFIndex v51 = v52 + 1;
              }

              while (!v55);
              BOOL v50 = v52 < v47;
            }
          }

          int v56 = CFSetContainsValue(v39, v43);
          if (!v50 && !v56) {
            goto LABEL_89;
          }
LABEL_94:
          if (v43)
          {
LABEL_95:
            __int128 v57 = (const __CFArray *)sub_10000F21C(v42);
            if (v57)
            {
              __int128 v58 = v57;
              CFIndex v59 = CFArrayGetCount(v57);
              if (v59 >= 1)
              {
                CFIndex v60 = v59;
                for (CFIndex k = 0LL; k != v60; ++k)
                {
                  uid_t v62 = (const __CFDictionary *)CFArrayGetValueAtIndex(v58, k);
                  uint64_t v63 = sub_10000E1D8(v62);
                  CFSetSetValue(v39, v63);
                }
              }
            }

            CFSetSetValue(v39, v43);
          }

LABEL_100:
          if (++v40 >= v37) {
            goto LABEL_101;
          }
        }

        if (v40) {
          goto LABEL_101;
        }
        goto LABEL_89;
      }

LABEL_101:
      CFRelease(v39);
    }
  }

  else if (v3)
  {
    byte_100020E08 = 1;
    if (!byte_1000200B8)
    {
      sub_100004694();
      byte_1000200B8 = 1;
      sub_100013160();
    }

    sub_10000D814();
    if (qword_100020EB0)
    {
      CFIndex v64 = CFArrayGetCount((CFArrayRef)qword_100020EC8);
      if (v64 >= 1)
      {
        CFIndex v65 = v64;
        for (CFIndex m = 0LL; m != v65; ++m)
        {
          uint64_t v67 = CFArrayGetValueAtIndex((CFArrayRef)qword_100020EC8, m);
          if (sub_100007500((uint64_t)v67, @"DAMediaWhole") == kCFBooleanTrue
            && !sub_100014F94((uint64_t)v67, 0x10000))
          {
            sub_1000151A8((uint64_t)v67, 0x10000, 1);
          }

          if (sub_100007500((uint64_t)v67, @"DAVolumePath") && !sub_1000075C4((uint64_t)v67, 0x100000))
          {
            sub_10000795C((uint64_t)v67, 0x100000, 1);
          }
        }
      }
    }
  }

uint64_t sub_100013BB0(uint64_t a1)
{
  uint64_t v2 = sub_10000B474(a1, 2);
  if (!(_DWORD)v2) {
    uint64_t v2 = sub_10000D73C(a1, 0LL, 0, 0LL, (uint64_t)@"automatic");
  }
  return sub_1000132B0(v2);
}

void sub_100013C08(int a1, const void *a2, int a3, const void *a4, const void *a5, const void *a6, void *a7)
{
  if (a1)
  {
    CFIndex v14 = 0LL;
    int v15 = 8;
LABEL_18:
    sub_10000795C((uint64_t)a7, v15, 1);
    goto LABEL_19;
  }

  CFIndex v14 = sub_10000805C((uint64_t)a2);
  sub_10000795C((uint64_t)a7, 8, 0);
  CFBooleanRef v16 = (CFBooleanRef)sub_100007500((uint64_t)a7, @"DAMediaWritable");
  else {
    BOOL v17 = 1;
  }
  if (v17 && v16 != kCFBooleanFalse && a3 != 0 || kCFBooleanTrue == kCFBooleanFalse)
  {
    int v15 = 2;
    goto LABEL_18;
  }

LABEL_19:
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    CFIndex v22 = Mutable;
    if (v14) {
      CFIndex v23 = (const void **)&kCFBooleanTrue;
    }
    else {
      CFIndex v23 = (const void **)&kCFBooleanFalse;
    }
    BOOL v24 = *v23;
    if (sub_100006344((uint64_t)a7, @"DAVolumeMountable", *v23))
    {
      sub_100007880((uint64_t)a7, @"DAVolumeMountable", v24);
      CFArrayAppendValue(v22, @"DAVolumeMountable");
    }

    if (sub_100006344((uint64_t)a7, @"DAVolumeKind", v14))
    {
      sub_100007880((uint64_t)a7, @"DAVolumeKind", v14);
      CFArrayAppendValue(v22, @"DAVolumeKind");
    }

    if (sub_100006344((uint64_t)a7, @"DAVolumeName", a4))
    {
      sub_100007880((uint64_t)a7, @"DAVolumeName", a4);
      CFArrayAppendValue(v22, @"DAVolumeName");
    }

    if (sub_100006344((uint64_t)a7, @"DAVolumeType", a5))
    {
      sub_100007880((uint64_t)a7, @"DAVolumeType", a5);
      CFArrayAppendValue(v22, @"DAVolumeType");
    }

    if (sub_100006344((uint64_t)a7, @"DAVolumeUUID", a6))
    {
      sub_100007880((uint64_t)a7, @"DAVolumeUUID", a6);
      CFArrayAppendValue(v22, @"DAVolumeUUID");
    }

    CFRelease(v22);
  }

  if (!sub_1000075C4((uint64_t)a7, 0x40000))
  {
    int v26 = getmntinfo(&v36, 2);
    if (v26 >= 1)
    {
      unint64_t v27 = 0LL;
      uint64_t v28 = 2168LL * v26;
      while (1)
      {
        uid_t v29 = sub_1000099C4((uint64_t)&v36[v27 / 0x878]);
        uint64_t v30 = (const char *)sub_100007220((uint64_t)a7);
        if (!strcmp(v29, v30)) {
          break;
        }
        v27 += 2168LL;
        if (v28 == v27) {
          goto LABEL_38;
        }
      }

      size_t v31 = strlen(v36[v27 / 0x878].f_mntonname);
      CFURLRef v32 = CFURLCreateFromFileSystemRepresentation( kCFAllocatorDefault,  (const UInt8 *)v36[v27 / 0x878].f_mntonname,  v31,  1u);
      if (v32)
      {
        CFURLRef v33 = v32;
        sub_100007738((uint64_t)a7, v32);
        sub_100007880((uint64_t)a7, @"DAVolumePath", v33);
        CFRelease(v33);
      }

      if (!strcmp(v36[v27 / 0x878].f_mntonname, "/"))
      {
        int v34 = (const void *)sub_10000B46C();
        if (v34)
        {
          uint64_t v35 = v34;
          sub_100007738((uint64_t)a7, v34);
          CFRelease(v35);
        }

        sub_10000795C((uint64_t)a7, 16, 1);
        sub_10000795C((uint64_t)a7, 32, 1);
      }

      sub_10000795C((uint64_t)a7, 2, 0);
      sub_10000795C((uint64_t)a7, 4, 0);
    }
  }

  uint64_t v6 = SCPreferencesCreate( kCFAllocatorDefault,  @"com.apple.DiskArbitration.diskarbitrationd",  @"com.apple.DiskArbitration.diskarbitrationd.plist");
  if (v6)
  {
    double v7 = v6;
    double v8 = SCPreferencesGetValue(v6, @"DAMountDeferExternal");
    if (v8)
    {
      CFIndex v9 = v8;
      dispatch_time_t v10 = CFGetTypeID(v8);
      if (v10 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountDeferExternal", v9);
      }
    }

    uint64_t v11 = SCPreferencesGetValue(v7, @"DAMountDeferInternal");
    if (v11)
    {
      CFIndex v12 = v11;
      CFIndex v13 = CFGetTypeID(v11);
      if (v13 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountDeferInternal", v12);
      }
    }

    CFIndex v14 = SCPreferencesGetValue(v7, @"DAMountDeferRemovable");
    if (v14)
    {
      int v15 = v14;
      CFBooleanRef v16 = CFGetTypeID(v14);
      if (v16 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountDeferRemovable", v15);
      }
    }

    BOOL v17 = SCPreferencesGetValue(v7, @"DAMountTrustExternal");
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = CFGetTypeID(v17);
      if (v19 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountTrustExternal", v18);
      }
    }

    BOOL v20 = SCPreferencesGetValue(v7, @"DAMountTrustInternal");
    if (v20)
    {
      CFIndex v21 = v20;
      CFIndex v22 = CFGetTypeID(v20);
      if (v22 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountTrustInternal", v21);
      }
    }

    CFIndex v23 = SCPreferencesGetValue(v7, @"DAMountTrustRemovable");
    if (v23)
    {
      BOOL v24 = v23;
      uint64_t v25 = CFGetTypeID(v23);
      if (v25 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountTrustRemovable", v24);
      }
    }

    int v26 = SCPreferencesGetValue(v7, @"DAAutoMountDisable");
    if (v26)
    {
      unint64_t v27 = v26;
      uint64_t v28 = CFGetTypeID(v26);
      if (v28 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAAutoMountDisable", v27);
      }
    }

    uid_t v29 = SCPreferencesGetValue(v7, @"DAEnableUserFSMountExternal");
    if (v29)
    {
      uint64_t v30 = v29;
      size_t v31 = CFGetTypeID(v29);
      if (v31 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAEnableUserFSMountExternal", v30);
      }
    }

    CFURLRef v32 = SCPreferencesGetValue(v7, @"DAEnableUserFSMountInternal");
    if (v32)
    {
      CFURLRef v33 = v32;
      int v34 = CFGetTypeID(v32);
      if (v34 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAEnableUserFSMountInternal", v33);
      }
    }

    uint64_t v35 = SCPreferencesGetValue(v7, @"DAEnableUserFSMountRemovable");
    if (v35)
    {
      CFIndex v36 = v35;
      uint64_t v37 = CFGetTypeID(v35);
      if (v37 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAEnableUserFSMountRemovable", v36);
      }
    }

    CFMutableSetRef v38 = SCPreferencesGetValue(v7, @"DAMountMethod");
    if (v38)
    {
      __int128 v39 = v38;
      CFIndex v40 = CFGetTypeID(v38);
      if (v40 == CFStringGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountMethod", v39);
      }
    }

    CFTypeID v41 = SCPreferencesGetValue(v7, @"DADisableEjectNotification");
    if (v41)
    {
      io_service_t v42 = v41;
      v43 = CFGetTypeID(v41);
      if (v43 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DADisableEjectNotification", v42);
      }
    }

    uint64_t v44 = SCPreferencesGetValue(v7, @"DADisableUnreadableNotification");
    if (v44)
    {
      size_t v45 = v44;
      CFIndex v46 = CFGetTypeID(v44);
      if (v46 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DADisableUnreadableNotification", v45);
      }
    }

    CFIndex v47 = SCPreferencesGetValue(v7, @"DADisableUnrepairableNotification");
    if (v47)
    {
      CFIndex v48 = v47;
      __int128 v49 = CFGetTypeID(v47);
      if (v49 == CFBooleanGetTypeID()) {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DADisableUnrepairableNotification", v48);
      }
    }

    CFRelease(v7);
  }

LABEL_38:
  sub_1000151A8((uint64_t)a7, 1, 0);
  uint64_t v25 = sub_10000795C((uint64_t)a7, 1, 0);
  sub_1000132B0(v25);
  CFRelease(a7);
}

uint64_t sub_100014028(const __CFDictionary *a1, const __CFDictionary *a2)
{
  signed int v3 = sub_1000053A8(a1);
  signed int v4 = sub_1000053A8(a2);
  if (v3 >= v4) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = -1LL;
  }
  if (v3 > v4) {
    return 1LL;
  }
  else {
    return v5;
  }
}

void sub_100014060(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  signed int v3 = (const __CFArray *)sub_1000074F0(a2);
  if (CFArrayGetCount(v3))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v3, 0LL);
    CFRetain(ValueAtIndex);
    CFArrayRemoveValueAtIndex(v3, 0LL);
    sub_10000D000(v2, (const __CFDictionary *)ValueAtIndex, (uint64_t)sub_100014060, (uint64_t)v2);
    uint64_t v2 = (void *)ValueAtIndex;
  }

  else
  {
    sub_10000795C((uint64_t)v2, 1, 0);
    sub_100007800((uint64_t)v2, 0LL);
    sub_1000132B0(v5);
  }

  CFRelease(v2);
}

void sub_1000140FC()
{
  if (stat("/System/Library/Filesystems", &v3))
  {
    qword_100020E10 = 0LL;
    qword_100020E18 = 0LL;
  }

  if (stat("/Library/Filesystems", &v2)) {
    xmmword_100020E20 = 0uLL;
  }
  if (qword_100020E10 != v3.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = v3.st_mtimespec.tv_nsec;
    goto LABEL_12;
  }

  tv_nseCC_SHA256_CTX c = v3.st_mtimespec.tv_nsec;
  if (qword_100020E18 != v3.st_mtimespec.tv_nsec) {
    goto LABEL_12;
  }
  if ((void)xmmword_100020E20 != v2.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = qword_100020E18;
    goto LABEL_12;
  }

  tv_nseCC_SHA256_CTX c = qword_100020E18;
  if (*((void *)&xmmword_100020E20 + 1) != v2.st_mtimespec.tv_nsec)
  {
LABEL_12:
    qword_100020E10 = v3.st_mtimespec.tv_sec;
    qword_100020E18 = tv_nsec;
    xmmword_100020E20 = (__int128)v2.st_mtimespec;
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_100020ED8);
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_100020EE0);
    sub_100014234("/System/Library/Filesystems");
    sub_100014234("/Library/Filesystems");
    CFIndex v1 = (__CFArray *)qword_100020EE0;
    v4.length = CFArrayGetCount((CFArrayRef)qword_100020EE0);
    v4.location = 0LL;
    CFArraySortValues(v1, v4, (CFComparatorFunction)sub_1000143C4, 0LL);
  }

void sub_100014234(const char *a1)
{
  size_t v2 = strlen(a1);
  CFURLRef v3 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)a1, v2, 1u);
  if (v3)
  {
    CFRange v4 = v3;
    uint64_t v5 = opendir(a1);
    if (v5)
    {
      uint64_t v6 = v5;
      sub_100009E68("filesystems have been refreshed.");
      for (CFIndex i = readdir(v6); i; CFIndex i = readdir(v6))
      {
        d_mach_port_name_t name = (const UInt8 *)i->d_name;
        size_t v9 = strlen(i->d_name);
        dispatch_time_t v10 = (const char *)&d_name[v9 - 3];
        if (v10 > (const char *)d_name && !strcmp(v10, ".fs"))
        {
          uint64_t v11 = CFURLCreateFromFileSystemRepresentationRelativeToBase(kCFAllocatorDefault, d_name, v9, 1u, v4);
          if (v11)
          {
            CFIndex v12 = v11;
            uint64_t v13 = sub_100007EF4((uint64_t)kCFAllocatorDefault, v11);
            if (v13)
            {
              CFIndex v14 = (void *)v13;
              sub_100009DD0("  created filesystem, id = %@.", v13);
              CFArrayAppendValue((CFMutableArrayRef)qword_100020ED8, v14);
              int v15 = (const __CFDictionary *)sub_100008070((uint64_t)v14);
              if (v15) {
                CFDictionaryApplyFunction(v15, (CFDictionaryApplierFunction)sub_100015278, v14);
              }
              CFRelease(v14);
            }

            CFRelease(v12);
          }
        }
      }

      closedir(v6);
    }

    CFRelease(v4);
  }

CFComparisonResult sub_1000143C4(const __CFDictionary *a1, const __CFDictionary *a2)
{
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"FSProbeOrder");
  CFRange v4 = (const __CFNumber *)CFDictionaryGetValue(a2, @"FSProbeOrder");
  if (!Value) {
    return 1LL;
  }
  if (v4) {
    return CFNumberCompare(Value, v4, 0LL);
  }
  return -1LL;
}

uint64_t sub_100014438()
{
  uint64_t result = stat("/etc/fstab", &v26);
  if ((_DWORD)result)
  {
    uint64_t v1 = 0LL;
    qword_100020E30 = 0LL;
    qword_100020E38 = 0LL;
  }

  else
  {
    uint64_t v1 = qword_100020E30;
  }

  if (v1 != v26.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = v26.st_mtimespec.tv_nsec;
    goto LABEL_8;
  }

  tv_nseCC_SHA256_CTX c = v26.st_mtimespec.tv_nsec;
  if (qword_100020E38 != v26.st_mtimespec.tv_nsec)
  {
LABEL_8:
    qword_100020E30 = v26.st_mtimespec.tv_sec;
    qword_100020E38 = tv_nsec;
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_100020F00);
    uint64_t result = sub_100003D20();
    if (!(_DWORD)result) {
      return result;
    }
    CFURLRef v3 = sub_100003CE0();
    if (!v3) {
      return sub_100004230();
    }
    CFRange v4 = v3;
    while (1)
    {
      __stringp = (char *)*v4;
      strsep(&__stringp, "=");
      if (!__stringp) {
        goto LABEL_44;
      }
      CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, __stringp, 0x8000100u);
      if (!v5) {
        goto LABEL_44;
      }
      uint64_t v6 = v5;
      double v7 = (const char *)*v4;
      if (!strcmp(v7, "LABEL"))
      {
        double v8 = (void *)CFRetain(v6);
LABEL_20:
        size_t v9 = v8;
        if (v8)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          if (Mutable)
          {
            uint64_t v11 = Mutable;
            CFMutableStringRef v12 = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
            if (v12)
            {
              uint64_t v13 = v12;
              unint64_t v27 = (char *)v4[3];
              CFIndex v14 = strsep(&v27, ",");
              if (v14)
              {
                int v15 = v14;
                CFBooleanRef v16 = 0LL;
                do
                {
                  BOOL v17 = v16;
                  CFBooleanRef v16 = kCFBooleanTrue;
                  if (strcmp(v15, "auto"))
                  {
                    CFBooleanRef v16 = kCFBooleanFalse;
                    if (strcmp(v15, "noauto"))
                    {
                      CFStringAppendCString(v13, v15, 0x8000100u);
                      CFStringAppendCString(v13, ",", 0x8000100u);
                      CFBooleanRef v16 = v17;
                    }
                  }

                  int v15 = strsep(&v27, ",");
                }

                while (v15);
                if (v16) {
                  CFDictionarySetValue(v11, @"DAMountAutomatic", v16);
                }
              }

              if (CFStringGetLength(v13))
              {
                CFStringTrim(v13, @",");
                CFDictionarySetValue(v11, @"DAMountOptions", v13);
              }

              CFRelease(v13);
            }

            uint64_t v18 = (const char *)v4[1];
            if (strcmp(v18, "none"))
            {
              size_t v19 = strlen(v18);
              CFURLRef v20 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v18, v19, 1u);
              if (v20)
              {
                CFURLRef v21 = v20;
                CFDictionarySetValue(v11, @"DAMountPath", v20);
                CFRelease(v21);
              }
            }

            CFIndex v22 = (const char *)v4[2];
            if (strcmp(v22, "auto"))
            {
              CFStringRef v23 = CFStringCreateWithCString(kCFAllocatorDefault, v22, 0x8000100u);
              if (v23)
              {
                CFStringRef v24 = v23;
                CFDictionarySetValue(v11, @"DAProbeKind", v23);
                CFRelease(v24);
              }
            }

            CFDictionarySetValue(v11, @"DAProbeID", v9);
            CFRelease(v9);
            CFRelease(v6);
            CFArrayAppendValue((CFMutableArrayRef)qword_100020F00, v11);
            uint64_t v25 = v11;
          }

          else
          {
            CFRelease(v9);
            uint64_t v25 = v6;
          }

          CFRelease(v25);
          goto LABEL_44;
        }

        goto LABEL_41;
      }

      if (!strcmp(v7, "DEVICE"))
      {
        double v8 = (void *)sub_100004AA4((uint64_t)kCFAllocatorDefault, v6);
        goto LABEL_20;
      }

LABEL_41:
      CFRelease(v6);
LABEL_44:
      CFRange v4 = sub_100003CE0();
      if (!v4) {
        return sub_100004230();
      }
    }

    double v8 = sub_100004EF8(kCFAllocatorDefault, v6);
    goto LABEL_20;
  }

  return result;
}

uint64_t sub_10001483C()
{
  uint64_t result = stat("/var/db/volinfo.database", &v14);
  if ((_DWORD)result)
  {
    uint64_t v1 = 0LL;
    qword_100020E40 = 0LL;
    qword_100020E48 = 0LL;
  }

  else
  {
    uint64_t v1 = qword_100020E40;
  }

  if (v1 != v14.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = v14.st_mtimespec.tv_nsec;
    goto LABEL_8;
  }

  tv_nseCC_SHA256_CTX c = v14.st_mtimespec.tv_nsec;
  if (qword_100020E48 != v14.st_mtimespec.tv_nsec)
  {
LABEL_8:
    qword_100020E40 = v14.st_mtimespec.tv_sec;
    qword_100020E48 = tv_nsec;
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_100020F08);
    uint64_t result = sub_100004318();
    if (!(_DWORD)result) {
      return result;
    }
    CFURLRef v3 = sub_1000042D8();
    if (!v3) {
      return sub_1000043B8();
    }
    CFRange v4 = v3;
    while (1)
    {
      CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)*v4, 0x8000100u);
      if (v5) {
        break;
      }
LABEL_25:
      CFRange v4 = sub_1000042D8();
      if (!v4) {
        return sub_1000043B8();
      }
    }

    uint64_t v6 = (__CFString *)v5;
    CFUUIDRef v7 = sub_100007DDC(kCFAllocatorDefault, v5);
    if (v7)
    {
      CFUUIDRef v8 = v7;
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        dispatch_time_t v10 = Mutable;
        uint64_t v11 = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
        if (v11)
        {
          CFMutableStringRef v12 = v11;
          if ((v4[1] & 1) != 0) {
            uint64_t v13 = @"owners";
          }
          else {
            uint64_t v13 = @"noowners";
          }
          CFStringAppend(v11, v13);
          CFStringAppend(v12, @",");
          if (CFStringGetLength(v12))
          {
            CFStringTrim(v12, @",");
            CFDictionarySetValue(v10, @"DAMountOptions", v12);
          }

          CFRelease(v12);
        }

        CFDictionarySetValue(v10, @"DAProbeID", v8);
        CFRelease(v8);
        CFRelease(v6);
        CFArrayAppendValue((CFMutableArrayRef)qword_100020F08, v10);
        goto LABEL_24;
      }

      CFRelease(v8);
    }

    dispatch_time_t v10 = (__CFDictionary *)v6;
LABEL_24:
    CFRelease(v10);
    goto LABEL_25;
  }

  return result;
}

void sub_100014A38()
{
  if (stat("/Library/Preferences/SystemConfiguration/autodiskmount.plist", &v51))
  {
    qword_100020E50 = 0LL;
    qword_100020E58 = 0LL;
  }

  if (stat("/Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist", &v50)) {
    xmmword_100020E60 = 0uLL;
  }
  if (qword_100020E50 == v51.st_mtimespec.tv_sec)
  {
    tv_nseCC_SHA256_CTX c = v51.st_mtimespec.tv_nsec;
    if (qword_100020E58 == v51.st_mtimespec.tv_nsec)
    {
      if ((void)xmmword_100020E60 == v50.st_mtimespec.tv_sec)
      {
        tv_nseCC_SHA256_CTX c = qword_100020E58;
        if (*((void *)&xmmword_100020E60 + 1) == v50.st_mtimespec.tv_nsec) {
          return;
        }
      }

      else
      {
        tv_nseCC_SHA256_CTX c = qword_100020E58;
      }
    }
  }

  else
  {
    tv_nseCC_SHA256_CTX c = v51.st_mtimespec.tv_nsec;
  }

  qword_100020E50 = v51.st_mtimespec.tv_sec;
  qword_100020E58 = tv_nsec;
  xmmword_100020E60 = (__int128)v50.st_mtimespec;
  CFDictionaryRemoveAllValues((CFMutableDictionaryRef)qword_100020F10);
  uint64_t v1 = SCPreferencesCreate(kCFAllocatorDefault, @"autodiskmount", @"autodiskmount.plist");
  if (v1)
  {
    size_t v2 = v1;
    Value = (const __CFBoolean *)SCPreferencesGetValue(v1, @"AutomountDisksWithoutUserLogin");
    CFBooleanRef v4 = Value;
    CFBooleanRef v5 = kCFBooleanTrue;
    if (Value == kCFBooleanTrue)
    {
      CFBooleanRef v5 = kCFBooleanFalse;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountDeferExternal", kCFBooleanFalse);
    }

    else
    {
      if (Value != kCFBooleanFalse)
      {
LABEL_18:
        CFRelease(v2);
        goto LABEL_19;
      }

      CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountDeferExternal", Value);
      CFBooleanRef v4 = kCFBooleanTrue;
    }

    CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountDeferRemovable", v5);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F10, @"DAMountTrustExternal", v4);
    goto LABEL_18;
  }

void *sub_100014F94(uint64_t a1, int a2)
{
  uint64_t result = (void *)sub_100007500(a1, @"DAMediaBSDUnit");
  if (result)
  {
    uint64_t result = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_100020F50, result);
    if (result) {
      return (void *)((*(_DWORD *)CFDataGetMutableBytePtr((CFMutableDataRef)result) & a2) != 0);
    }
  }

  return result;
}

uint64_t sub_100014FEC(uint64_t a1, int a2)
{
  uint64_t result = sub_100007518(a1);
  io_registry_entry_t entry = result;
  if ((_DWORD)result)
  {
    char v5 = 0;
    IOOptionBits v6 = 3;
    char v7 = 1;
    do
    {
      char v15 = v7;
      do
      {
        io_iterator_t iterator = 0;
        IORegistryEntryCreateIterator(entry, "IOService", v6, &iterator);
        if (!iterator) {
          break;
        }
        io_object_t v8 = IOIteratorNext(iterator);
        if (v8) {
          IOObjectRelease(v8);
        }
        io_object_t v9 = IOIteratorNext(iterator);
        if (v9)
        {
          io_object_t v10 = v9;
          do
          {
            if (IOObjectConformsTo(v10, "IOMedia"))
            {
              CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v10, @"BSD Unit", kCFAllocatorDefault, 0);
              if (CFProperty)
              {
                CFMutableStringRef v12 = CFProperty;
                Value = (__CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_100020F50, CFProperty);
                if (Value && (*(_DWORD *)CFDataGetMutableBytePtr(Value) & a2) != 0)
                {
                  CFRelease(v12);
                  IOObjectRelease(v10);
                  IOObjectRelease(iterator);
                  return 1LL;
                }

                CFRelease(v12);
              }
            }

            else if ((v5 & 1) == 0 && IOObjectConformsTo(v10, "IOBlockStorageDevice"))
            {
              IORegistryIteratorExitEntry(iterator);
            }

            IOObjectRelease(v10);
            io_object_t v10 = IOIteratorNext(iterator);
          }

          while (v10);
        }

        char IsValid = IOIteratorIsValid(iterator);
        IOObjectRelease(iterator);
      }

      while (!IsValid);
      char v7 = 0;
      uint64_t result = 0LL;
      char v5 = 1;
      IOOptionBits v6 = 1;
    }

    while ((v15 & 1) != 0);
  }

  return result;
}

void sub_1000151A8(uint64_t a1, int a2, int a3)
{
  char v5 = sub_100007500(a1, @"DAMediaBSDUnit");
  if (v5)
  {
    IOOptionBits v6 = v5;
    Value = (__CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_100020F50, v5);
    if (Value)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(Value);
      if (a3) {
        int v9 = a2;
      }
      else {
        int v9 = 0;
      }
      *(_DWORD *)MutableBytePtr = *(_DWORD *)MutableBytePtr & ~a2 | v9;
    }

    else
    {
      CFMutableDictionaryRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 4LL);
      if (Mutable)
      {
        CFPropertyListRef v11 = Mutable;
        CFMutableStringRef v12 = CFDataGetMutableBytePtr(Mutable);
        if (a3) {
          int v13 = a2;
        }
        else {
          int v13 = 0;
        }
        *(_DWORD *)CFMutableStringRef v12 = v13;
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100020F50, v6, v11);
        CFRelease(v11);
      }
    }
  }

void sub_100015278(int a1, CFDictionaryRef theDict, const void *a3)
{
  CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, theDict);
  if (MutableCopy)
  {
    char v5 = MutableCopy;
    CFDictionarySetValue(MutableCopy, @"DAFileSystem", a3);
    CFArrayAppendValue((CFMutableArrayRef)qword_100020EE0, v5);
    CFRelease(v5);
  }

uint64_t sub_1000152E8()
{
  if (dword_100020E70) {
    goto LABEL_6;
  }
  if (!mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_100020E70)
    && !mach_port_insert_right(mach_task_self_, dword_100020E70, dword_100020E70, 0x14u))
  {
    integer_t port_info = 1;
    mach_port_set_attributes(mach_task_self_, dword_100020E70, 1, &port_info, 1u);
  }

  if (dword_100020E70)
  {
LABEL_6:
    uint64_t v0 = sub_100012A30();
    qword_100020E78 = dispatch_mach_create_f("diskarbitrationd/thread", v0, 0LL, sub_1000153B8);
    dispatch_mach_connect(qword_100020E78, dword_100020E70, dword_100020E70, 0LL);
  }

  return qword_100020E78;
}

void sub_1000153B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2)
  {
    mach_msg_header_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
    pthread_mutex_lock(&stru_1000200C0);
    uint64_t v4 = qword_100020E80;
    if (qword_100020E80)
    {
      uint64_t v5 = 0LL;
      do
      {
        while (1)
        {
          uint64_t v6 = v4;
          if (*(_DWORD *)v4 != 1) {
            sub_10001845C();
          }
          if (*(_BYTE *)(v4 + 16)) {
            break;
          }
          uint64_t v4 = *(void *)(v4 + 8);
          uint64_t v5 = v6;
          if (!v4) {
            goto LABEL_14;
          }
        }

        if (v5) {
          char v7 = (uint64_t *)(v5 + 8);
        }
        else {
          char v7 = &qword_100020E80;
        }
        uint64_t *v7 = *(void *)(v4 + 8);
        pthread_mutex_unlock(&stru_1000200C0);
        io_object_t v8 = *(void (**)(void, void))(v6 + 32);
        if (v8) {
          v8(*(unsigned int *)(v6 + 20), *(void *)(v6 + 40));
        }
        free((void *)v6);
        pthread_mutex_lock(&stru_1000200C0);
        uint64_t v5 = 0LL;
        uint64_t v4 = qword_100020E80;
      }

      while (qword_100020E80);
    }

LABEL_14:
    pthread_mutex_unlock(&stru_1000200C0);
    mach_msg_destroy(msg);
  }

      int v9 = 0LL;
LABEL_15:
      free(v5);
      close(v7);
      return v9;
    }

    free(v5);
  }

  return 0LL;
}

uint64_t sub_1000154C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  if (!dword_100020E70) {
    sub_100018484();
  }
  pthread_mutex_lock(&stru_1000200C0);
  int v8 = pthread_create(&v11, 0LL, (void *(__cdecl *)(void *))sub_100015598, 0LL);
  if (!v8)
  {
    int v9 = malloc(0x40uLL);
    if (v9)
    {
      *(_DWORD *)int v9 = 1;
      v9[1] = qword_100020E80;
      *((_BYTE *)v9 + 16) = 0;
      *((_DWORD *)v9 + 5) = 0;
      v9[3] = v11;
      v9[4] = a3;
      v9[5] = a4;
      v9[6] = a1;
      v9[7] = a2;
      qword_100020E80 = (uint64_t)v9;
    }
  }

  uint64_t result = pthread_mutex_unlock(&stru_1000200C0);
  if (a3)
  {
    if (v8) {
      return a3(71LL, a4);
    }
  }

  return result;
}

uint64_t sub_100015598()
{
  uint64_t v0 = qword_100020E80;
  if (qword_100020E80)
  {
    while (1)
    {
      if (*(_DWORD *)v0 != 1) {
        sub_1000184AC();
      }
      uint64_t v1 = *(_opaque_pthread_t **)(v0 + 24);
      size_t v2 = pthread_self();
      if (pthread_equal(v1, v2)) {
        break;
      }
      uint64_t v0 = *(void *)(v0 + 8);
      if (!v0) {
        goto LABEL_5;
      }
    }

    pthread_mutex_unlock(&stru_1000200C0);
    *(_DWORD *)(v0 + 20) = (*(uint64_t (**)(void))(v0 + 48))(*(void *)(v0 + 56));
    pthread_mutex_lock(&stru_1000200C0);
    *(_BYTE *)(v0 + 16) = 1;
    pthread_mutex_unlock(&stru_1000200C0);
    uint64_t v9 = 0LL;
    int v7 = dword_100020E70;
    int v8 = 0;
    uint64_t v6 = 0x1800000013LL;
    CFURLRef v3 = (dispatch_object_s *)dispatch_mach_msg_create(&v6, 24LL, 0LL, 0LL);
    dispatch_mach_send(qword_100020E78, v3, 0LL);
    dispatch_release(v3);
  }

  else
  {
LABEL_5:
    pthread_mutex_unlock(&stru_1000200C0);
  }

  uint64_t v4 = pthread_self();
  pthread_detach(v4);
  return 0LL;
}

uint64_t sub_1000156A0(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 20);
  if (v1 <= 0x10) {
    return (uint64_t)*(&off_10001D0B0 + 5 * v1 + 5);
  }
  else {
    return 0LL;
  }
}

const char *sub_1000156CC(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = (_DWORD)v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr(result + 40, 0, v4 - 40)) == 0LL))
  {
    *(_DWORD *)(a2 + 32) = -304;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (const char *)sub_100011078( *((_DWORD *)v3 + 3),  v3 + 40,  (vm_address_t *)(a2 + 28),  (unsigned int *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    goto LABEL_12;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

const char *sub_1000157C8(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = (_DWORD)v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr(result + 40, 0, v4 - 40)) == 0LL))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }

  uint64_t result = (const char *)sub_1000111DC(*((_DWORD *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v9 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_100015894(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = (_DWORD)v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr(result + 40, 0, v4 - 40)) == 0LL))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }

  uint64_t result = (const char *)sub_10001129C(*((_DWORD *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v9 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_100015960(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = (_DWORD)v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr(result + 40, 0, v4 - 40)) == 0LL))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }

  uint64_t result = (const char *)sub_1000112F4(*((_DWORD *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v9 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_100015A2C(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  CFURLRef v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  uint64_t result = (const char *)memchr(result + 40, 0, v8 - 40);
  if (result)
  {
    NDR_record_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      int v11 = *((_DWORD *)v3 + 3);
      int v12 = *(_DWORD *)&v3[v6 + 40];
      __int128 v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      uint64_t result = (const char *)sub_1000113D0(v11, v3 + 40, v12, v14);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_18;
    }

    int v10 = -309;
  }

  else
  {
LABEL_16:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
LABEL_18:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100015B3C(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  CFURLRef v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  uint64_t result = (const char *)memchr(result + 40, 0, v8 - 40);
  if (result)
  {
    NDR_record_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      int v11 = *((_DWORD *)v3 + 3);
      uint64_t v12 = *(unsigned int *)&v3[v6 + 40];
      __int128 v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      uint64_t result = (const char *)sub_100011510(v11, v3 + 40, v12, v14);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_18;
    }

    int v10 = -309;
  }

  else
  {
LABEL_16:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
LABEL_18:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100015C4C(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_14;
  }
  CFURLRef v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_14;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t result = (const char *)memchr(result + 40, 0, v4 - 40);
  if (result)
  {
    uint64_t result = (const char *)sub_100011638( *((_DWORD *)v3 + 3),  v3 + 40,  *(unsigned int *)&v3[v6 + 40],  *(_DWORD *)&v3[v6 + 44]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  else
  {
LABEL_14:
    *(_DWORD *)(a2 + 32) = -304;
  }

  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100015D10(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0
    && (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 >= 0x28)
    && v4 <= 0x428
    && ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = (_DWORD)v4 == v7) : (BOOL v8 = 0),
        v8 && (uint64_t result = (const char *)memchr(result + 40, 0, v4 - 40)) != 0LL))
  {
    uint64_t result = (const char *)sub_100011728(*((_DWORD *)v3 + 3), v3 + 40);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  return result;
}

_DWORD *sub_100015DBC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)sub_100011800(result[3], (vm_address_t *)(a2 + 28), (unsigned int *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

const char *sub_100015E64(const char *result, _DWORD *a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (BOOL v6 = (int)v4 - 40 >= v5) : (BOOL v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = (_DWORD)v4 == v7) : (BOOL v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr(result + 40, 0, v4 - 40)) == 0LL))
  {
    int v9 = -304;
LABEL_12:
    a2[8] = v9;
    goto LABEL_13;
  }

  int v10 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }

  *((void *)a2 + 4) = 0x14000000000000LL;
  int v11 = *((_DWORD *)v3 + 3);
  __int128 v12 = *(_OWORD *)(v10 + 36);
  v13[0] = *(_OWORD *)(v10 + 20);
  v13[1] = v12;
  uint64_t result = (const char *)sub_100011A1C(v11, v3 + 40, v13, a2 + 7);
  if (!(_DWORD)result)
  {
    *a2 |= 0x80000000;
    a2[1] = 40;
    a2[6] = 1;
    return result;
  }

  a2[8] = (_DWORD)result;
LABEL_13:
  *((NDR_record_t *)a2 + 3) = NDR_record;
  return result;
}

void sub_100015F80(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  if (*(_BYTE *)(a1 + 39) != 1 || *(_BYTE *)(a1 + 55) != 1) {
    goto LABEL_21;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 76);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }

  int v3 = -304;
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v7 + 108) {
    goto LABEL_3;
  }
  uint64_t v8 = a1 + v7;
  unsigned int v9 = *(_DWORD *)(a1 + 40);
  if (v9 != *(_DWORD *)(v8 + 84) || (v10 = v8 - 1024, unsigned int v11 = *(_DWORD *)(a1 + 56), v11 != *(_DWORD *)(v8 + 88)))
  {
LABEL_21:
    int v3 = -300;
    goto LABEL_3;
  }

  uint64_t v12 = 1104LL;
  uint64_t v13 = ((v5 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v13 && *(_DWORD *)(v13 + 4) > 0x1Fu)
  {
    int v14 = *(_DWORD *)(a1 + 12);
    unsigned int v15 = *(_DWORD *)(a1 + 68);
    uint64_t v16 = *(unsigned int *)(v10 + 1104);
    CFPropertyListRef v17 = *(const UInt8 **)(a1 + 28);
    uint64_t v18 = *(const UInt8 **)(a1 + 44);
    uint64_t v19 = *(void *)(v10 + 1116);
    uint64_t v20 = *(void *)(v10 + 1124);
    __int128 v21 = *(_OWORD *)(v13 + 36);
    v22[0] = *(_OWORD *)(v13 + 20);
    v22[1] = v21;
    *(_DWORD *)(a2 + 32) = sub_100011B74(v14, v15, (const char *)(a1 + 80), v16, v17, v9, v18, v11, v19, v20, v22);
    mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
    *(void *)(a1 + 44) = 0LL;
    *(_DWORD *)(a1 + 56) = 0;
    mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
    *(void *)(a1 + 28) = 0LL;
    *(_DWORD *)(a1 + 40) = 0;
    goto LABEL_4;
  }

  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100016144(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1) {
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 4);
  if (v5 < 0x58 || v5 > 0x458) {
    goto LABEL_3;
  }
  if (*(_BYTE *)(a1 + 39) != 1) {
    goto LABEL_16;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 76);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  int v3 = -304;
  if (v5 - 88 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 88) {
    goto LABEL_3;
  }
  uint64_t v8 = a1 + v7;
  unsigned int v9 = *(_DWORD *)(a1 + 40);
  if (v9 != *(_DWORD *)(v8 + 80))
  {
LABEL_16:
    int v3 = -300;
    goto LABEL_3;
  }

  uint64_t v10 = 1104LL;
  *(_DWORD *)(a2 + 32) = sub_100012194( *(_DWORD *)(a1 + 12),  *(void *)(a1 + 52),  *(void *)(a1 + 60),  *(_DWORD *)(a1 + 68),  (const char *)(a1 + 80),  *(const UInt8 **)(a1 + 28),  v9,  *(_DWORD *)(v8 + 84));
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
}

void sub_100016278(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 100)
  {
    int v5 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v5;
    goto LABEL_11;
  }

  if (*(_BYTE *)(a1 + 39) != 1
    || *(_BYTE *)(a1 + 55) != 1
    || (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 != *(_DWORD *)(a1 + 92))
    || *(_DWORD *)(a1 + 56) != *(_DWORD *)(a1 + 96))
  {
    int v5 = -300;
    goto LABEL_10;
  }

  *(_DWORD *)(a2 + 32) = sub_1000122B4( *(_DWORD *)(a1 + 12),  *(void *)(a1 + 68),  *(void *)(a1 + 76),  *(_DWORD *)(a1 + 84),  *(_DWORD *)(a1 + 88),  *(__CFDictionary **)(a1 + 28),  v4,  *(const UInt8 **)(a1 + 44),  *(_DWORD *)(a1 + 56));
  mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(void *)(a1 + 44) = 0LL;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

_DWORD *sub_100016368(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100010F74(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_1000163C0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100012538(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100016418(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      uint64_t result = sub_1000125E8(*(_DWORD *)(result + 12), *(_DWORD *)(result + 28));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }

    int v3 = -300;
  }

  else
  {
    int v3 = -304;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10001649C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 48)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t result = sub_10001269C(*(_DWORD *)(result + 12), *(void *)(result + 32), *(void *)(result + 40));
    *(_DWORD *)(a2 + 32) = result;
  }

  return result;
}

uint64_t sub_1000164FC(_DWORD *a1, uint64_t a2)
{
  unsigned int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(void *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  unsigned int v4 = a1[5];
  if (v4 <= 0x10 && (int v5 = (void (*)(void))*(&off_10001D0B0 + 5 * v4 + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

uint64_t _FSGetTypeInfoFromStatfs(uint64_t a1, char *a2, size_t a3, _DWORD *a4)
{
  uint64_t v8 = a1 + 72;
  if (!sub_10001668C((const char *)(a1 + 72)))
  {
    __strlcpy_chk(__source, v8, 16LL, 16LL);
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  uint64_t v9 = a1 + 1112;
  uint64_t v10 = strstr((const char *)(a1 + 1112), "://");
  if (!v10) {
    return 22LL;
  }
  else {
    uint64_t v11 = (uint64_t)&v10[-v9];
  }
  __memcpy_chk(__source, a1 + 1112, v11, 16LL);
  __source[v11] = 0;
  if (a2) {
LABEL_9:
  }
    strlcpy(a2, __source, a3);
LABEL_10:
  uint64_t result = 0LL;
  if (a4) {
    *a4 = *(_DWORD *)(a1 + 68);
  }
  return result;
}

BOOL sub_10001668C(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t _FSGetTypeInfoForPath(const char *a1, char *a2, size_t a3, _DWORD *a4)
{
  if (statfs(a1, &v8) == -1) {
    return *__error();
  }
  else {
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
  }
}

uint64_t _FSGetTypeInfoForFileDescriptor(int a1, char *a2, size_t a3, _DWORD *a4)
{
  if (fstatfs(a1, &v8) == -1) {
    return *__error();
  }
  else {
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
  }
}

uint64_t _FSGetLocationFromStatfs(uint64_t a1, char *a2, size_t a3)
{
  unsigned int v6 = calloc(1uLL, 0x400uLL);
  if (v6)
  {
    unsigned int v7 = v6;
    if (sub_10001668C((const char *)(a1 + 72)))
    {
      statfs v8 = strstr((const char *)(a1 + 1112), "://");
      if (!v8 || (uint64_t v9 = v8 + 3, (v10 = strchr(v8 + 3, 47)) == 0LL))
      {
        uint64_t v12 = 22LL;
LABEL_20:
        free(v7);
        return v12;
      }

      if (v10 - v9 >= 1023) {
        uint64_t v11 = 1023LL;
      }
      else {
        uint64_t v11 = v10 - v9;
      }
      __memcpy_chk(v7, v9, v11, 1024LL);
      *((_BYTE *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_19:
        uint64_t v12 = 0LL;
        goto LABEL_20;
      }
    }

    else
    {
      if (!strncmp((const char *)(a1 + 1112), "/dev/disk", 9uLL))
      {
        uint64_t v13 = a1 + 1117;
      }

      else if (!strncmp((const char *)(a1 + 1112), "/dev/rdisk", 0xAuLL))
      {
        uint64_t v13 = a1 + 1118;
      }

      else
      {
        uint64_t v13 = a1 + 1112;
      }

      __strlcpy_chk(v7, v13, 1024LL, 1024LL);
      if (!a2) {
        goto LABEL_19;
      }
    }

    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_19;
  }

  return 12LL;
}

uint64_t _FSGetLocationForPath(const char *a1, char *a2, size_t a3)
{
  if (statfs(a1, &v6) == -1) {
    return *__error();
  }
  else {
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
  }
}

uint64_t _FSGetLocationForFileDescriptor(int a1, char *a2, size_t a3)
{
  if (fstatfs(a1, &v6) == -1) {
    return *__error();
  }
  else {
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
  }
}

CFArrayRef FSCopyFormatNameForFSType(const __CFArray *result, int a2, unsigned int a3, int a4)
{
  __int16 v61 = a2;
  if (!result) {
    return result;
  }
  statfs v6 = result;
  CFStringRef v7 = CFStringCreateWithFormat(0LL, 0LL, @"%d%@%d", a3, result, a2);
  _os_nospin_lock_lock(&unk_100020E88);
  statfs v8 = &selRef_numberWithBool_;
  if (qword_100020E90)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_100020E90, v7);
    _os_nospin_lock_unlock(&unk_100020E88);
    if (Value)
    {
LABEL_70:
      CFRelease(v7);
      CFTypeID v50 = CFGetTypeID(Value);
      if (v50 == CFStringGetTypeID()) {
        return (const __CFArray *)CFRetain(Value);
      }
      CFTypeID v51 = CFGetTypeID(Value);
      if (v51 != CFDictionaryGetTypeID()) {
        return (const __CFArray *)CFRetain(Value);
      }
      CFDictionaryGetCount((CFDictionaryRef)Value);
      uint64_t v52 = ((uint64_t (*)(void))__chkstk_darwin)();
      int v54 = (const void **)((char *)&v58 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      __chkstk_darwin(v52);
      int v56 = (CFTypeRef *)((char *)&v58 - v55);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)Value, v54, (const void **)((char *)&v58 - v55));
      if (a4) {
        __int128 v57 = v56;
      }
      else {
        __int128 v57 = v54;
      }
      return (const __CFArray *)CFRetain(*v57);
    }
  }

  else
  {
    _os_nospin_lock_unlock(&unk_100020E88);
  }

  uint64_t result = (const __CFArray *)qword_100020E98;
  if (qword_100020E98) {
    goto LABEL_7;
  }
  uint64_t result = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains(5LL, 14LL, 1LL);
  if (result)
  {
    uint64_t v16 = result;
    CFIndex Count = CFArrayGetCount(result);
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, Count, 0LL);
    if (Mutable)
    {
      CFIndex v59 = v7;
      LODWORD(v58) = a4;
      if (CFArrayGetCount(v16) < 1)
      {
LABEL_25:
        qword_100020E98 = (uint64_t)CFArrayCreateCopy(0LL, Mutable);
      }

      else
      {
        CFIndex v19 = 0LL;
        while (1)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v16, v19);
          CFTypeID v21 = CFGetTypeID(ValueAtIndex);
          if (v21 == CFURLGetTypeID())
          {
            if (!CFURLGetFileSystemRepresentation((CFURLRef)ValueAtIndex, 0, (UInt8 *)v63, 1025LL)) {
              break;
            }
          }

          else
          {
            CFTypeID v22 = CFGetTypeID(ValueAtIndex);
            if (v22 != CFStringGetTypeID()) {
              break;
            }
            CFStringGetCString(ValueAtIndex, v63, 1025LL, 0x8000100u);
          }

          __strlcat_chk(v63, "/Filesystems", 1025LL, 1025LL);
          CFPropertyListRef v23 = CFStringCreateWithCString(0LL, v63, 0x8000100u);
          if (!v23) {
            break;
          }
          CFStringRef v24 = v23;
          CFURLRef v25 = CFURLCreateWithFileSystemPath(0LL, v23, kCFURLPOSIXPathStyle, 1u);
          if (v25) {
            CFArrayAppendValue(Mutable, v25);
          }
          CFRelease(v24);
          if (++v19 >= CFArrayGetCount(v16)) {
            goto LABEL_25;
          }
        }
      }

      a4 = (int)v58;
      CFStringRef v7 = v59;
      statfs v8 = &selRef_numberWithBool_;
    }

    CFRelease(Mutable);
    CFRelease(v16);
    uint64_t result = (const __CFArray *)qword_100020E98;
    if (qword_100020E98)
    {
LABEL_7:
      if (CFArrayGetCount(result) < 1)
      {
        CFBundleRef v14 = 0LL;
        char v15 = 1;
LABEL_63:
        CFStringRef v47 = (CFStringRef)qword_100020EA0;
        if (!qword_100020EA0)
        {
          MainBundle = CFBundleGetMainBundle();
          CFStringRef v47 = CFBundleCopyLocalizedString(MainBundle, @"Unknown", @"Unknown", 0LL);
          qword_100020EA0 = (uint64_t)v47;
        }

        Value = CFStringCreateWithFormat(0LL, 0LL, @"%@ (%@)", v47, v6);
LABEL_66:
        _os_nospin_lock_lock(&unk_100020E88);
        CFTypeID v49 = (__CFDictionary *)v8[466];
        if (!v49)
        {
          CFTypeID v49 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          v8[466] = (char *)v49;
        }

        CFDictionarySetValue(v49, v7, Value);
        _os_nospin_lock_unlock(&unk_100020E88);
        if ((v15 & 1) == 0) {
          CFRelease(v14);
        }
        goto LABEL_70;
      }

      CFIndex v59 = v7;
      CFIndex v10 = 0LL;
      while (1)
      {
        uint64_t v11 = (const __CFURL *)CFArrayGetValueAtIndex((CFArrayRef)qword_100020E98, v10);
        uint64_t v12 = CFStringCreateWithFormat(0LL, 0LL, @"%@.fs", v6);
        uint64_t v13 = CFURLCreateWithFileSystemPathRelativeToBase(0LL, v12, kCFURLPOSIXPathStyle, 1u, v11);
        CFBundleRef v14 = CFBundleCreate(0LL, v13);
        CFRelease(v12);
        CFRelease(v13);
        if (v14) {
          break;
        }
        if (++v10 >= CFArrayGetCount((CFArrayRef)qword_100020E98))
        {
          CFBundleRef v14 = 0LL;
          char v15 = 1;
LABEL_37:
          CFStringRef v7 = v59;
          statfs v8 = &selRef_numberWithBool_;
          goto LABEL_63;
        }
      }

      int v26 = a4;
      InfoDictionary = CFBundleGetInfoDictionary(v14);
      CFTypeID v28 = InfoDictionary;
      if (a3)
      {
        ValueForInfoDictionaryKey = (const __CFDictionary *)CFBundleGetValueForInfoDictionaryKey( v14,  @"FSPersonalities");
        uint64_t v30 = (const __CFDictionary *)CFDictionaryGetValue(v28, @"FSPersonalities");
        if (ValueForInfoDictionaryKey) {
          BOOL v31 = v30 == 0LL;
        }
        else {
          BOOL v31 = 1;
        }
        if (v31)
        {
          char v15 = 0;
          goto LABEL_37;
        }

        CFPropertyListRef v32 = v30;
        statfs v8 = &selRef_numberWithBool_;
      }

      else
      {
        ValueForInfoDictionaryKey = (const __CFDictionary *)CFDictionaryGetValue( InfoDictionary,  @"FSPersonalities");
        CFPropertyListRef v32 = ValueForInfoDictionaryKey;
        statfs v8 = &selRef_numberWithBool_;
        if (!ValueForInfoDictionaryKey)
        {
LABEL_42:
          char v15 = 0;
          a4 = v26;
          CFStringRef v7 = v59;
          goto LABEL_63;
        }
      }

      CFIndex v33 = CFDictionaryGetCount(v32);
      if (v33 >= 1)
      {
        CFIndex v34 = v33;
        if ((unint64_t)v33 < 6)
        {
          CFIndex v36 = (const void **)v62;
          CFPropertyListRef v35 = (const void **)v63;
        }

        else
        {
          CFPropertyListRef v35 = (const void **)malloc(8 * v33);
          CFIndex v36 = (const void **)malloc(8 * v34);
        }

        __int128 v58 = v36;
        CFDictionaryGetKeysAndValues(v32, v36, v35);
        CFNumberRef v37 = CFNumberCreate(0LL, kCFNumberSInt16Type, &v61);
        uint64_t v38 = 0LL;
        while (CFDictionaryGetValueIfPresent((CFDictionaryRef)v35[v38], @"FSSubType", (const void **)&v60) != 1
             || CFNumberCompare(v37, v60, 0LL))
        {
          if (v34 == ++v38)
          {
            CFRelease(v37);
            __int128 v39 = v58;
LABEL_49:
            CFTypeID v40 = v39[v34 - 1];
            goto LABEL_51;
          }
        }

        CFTypeID v40 = v58[v38];
        __int128 v39 = v58;
        CFRelease(v37);
        if (!v40) {
          goto LABEL_49;
        }
LABEL_51:
        CFPropertyListRef v41 = (const __CFDictionary *)CFDictionaryGetValue(ValueForInfoDictionaryKey, v40);
        a4 = v26;
        if (!v41) {
          goto LABEL_56;
        }
        io_service_t v42 = v41;
        Value = CFDictionaryGetValue(v41, @"FSName");
        CFTypeID v43 = CFDictionaryGetValue(v42, @"FSEncryptionName");
        CFStringRef v7 = v59;
        if (!Value || (CFPropertyListRef v44 = v43) == 0LL)
        {
LABEL_58:
          char v15 = 0;
          statfs v8 = &selRef_numberWithBool_;
          if (Value) {
            goto LABEL_66;
          }
          goto LABEL_63;
        }

        size_t v45 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v45)
        {
          CFTypeID v46 = v45;
          CFDictionarySetValue(v45, Value, v44);
          Value = v46;
        }

        else
        {
LABEL_56:
          Value = 0LL;
        }

        CFStringRef v7 = v59;
        goto LABEL_58;
      }

      goto LABEL_42;
    }
  }

  return result;
}

CFArrayRef _FSCopyLocalizedNameForVolumeFormatAtURL(const __CFURL *a1)
{
  return sub_1000170EC(a1, 1u);
}

CFArrayRef sub_1000170EC(const __CFURL *a1, unsigned int a2)
{
  if (!a1
    || !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024LL)
    || statfs((const char *)buffer, &v9)
    || _FSGetTypeInfoFromStatfs((uint64_t)&v9, cStr, 0x10uLL, &v6))
  {
    return 0LL;
  }

  int v5 = (const __CFArray *)CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x600u);
  if (_FSGetLocationFromStatfs((uint64_t)&v9, v9.f_mntfromname, 0x400uLL))
  {
    int v3 = 0LL;
  }

  else
  {
    unsigned __int8 v7 = 0;
    GetFSEncryptionStatus(v9.f_mntfromname, (char *)&v7, 1, 0LL);
    int v3 = FSCopyFormatNameForFSType(v5, (__int16)v6, a2, v7);
  }

  CFRelease(v5);
  return v3;
}

CFArrayRef _FSCopyNameForVolumeFormatAtURL(const __CFURL *a1)
{
  return sub_1000170EC(a1, 0);
}

CFArrayRef _FSCopyLocalizedNameForVolumeFormatAtNode(const __CFString *a1)
{
  int v6 = 0;
  if (CFStringGetCString(a1, buffer, 1025LL, 0x8000100u) != 1) {
    return 0LL;
  }
  cStr[0] = 0;
  GetFSEncryptionStatus(buffer, cStr, 1, 0LL);
  int v1 = cStr[0];
  *(void *)cStr = 0LL;
  __int16 v8 = 0;
  unsigned int v2 = 0LL;
  if (getfstype(buffer, (uint64_t)cStr, &v6))
  {
    BOOL v3 = v1 != 0;
    unsigned int v4 = (const __CFArray *)CFStringCreateWithCString(0LL, cStr, 0x600u);
    unsigned int v2 = FSCopyFormatNameForFSType(v4, (__int16)v6, 1u, v3);
    CFRelease(v4);
  }

  return v2;
}

uint64_t getfstype(const char *a1, uint64_t a2, int *a3)
{
  if (is_apfs(a1, a3))
  {
    *(_BYTE *)(a2 + 4) = 0;
    int v6 = 1936093281;
  }

  else if (is_hfs(a1, a3))
  {
    int v6 = 7562856;
  }

  else
  {
    uint64_t result = is_msdos(a1, a3);
    if (!(_DWORD)result) {
      return result;
    }
    *(_WORD *)(a2 + 4) = 115;
    int v6 = 1868854125;
  }

  *(_DWORD *)a2 = v6;
  return 1LL;
}

CFArrayRef _FSCopyNameForVolumeFormatAtNode(const __CFString *a1)
{
  int v6 = 0;
  if (CFStringGetCString(a1, buffer, 1025LL, 0x8000100u) != 1) {
    return 0LL;
  }
  cStr[0] = 0;
  GetFSEncryptionStatus(buffer, cStr, 1, 0LL);
  int v1 = cStr[0];
  *(void *)cStr = 0LL;
  __int16 v8 = 0;
  unsigned int v2 = 0LL;
  if (getfstype(buffer, (uint64_t)cStr, &v6))
  {
    BOOL v3 = v1 != 0;
    unsigned int v4 = (const __CFArray *)CFStringCreateWithCString(0LL, cStr, 0x600u);
    unsigned int v2 = FSCopyFormatNameForFSType(v4, (__int16)v6, 0, v3);
    CFRelease(v4);
  }

  return v2;
}

BOOL is_apfs(const char *a1, _DWORD *a2)
{
  uint64_t v4 = 6LL;
  if (strncmp(a1, "/dev/r", 6uLL))
  {
    uint64_t v4 = 5LL;
    if (strncmp(a1, "/dev/", 5uLL)) {
      uint64_t v4 = 0LL;
    }
  }

  int v5 = IOBSDNameMatching(kIOMasterPortDefault, 0, &a1[v4]);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  if (!MatchingService) {
    return 0LL;
  }
  io_registry_entry_t v7 = MatchingService;
  BOOLean_t v8 = IOObjectConformsTo(MatchingService, "AppleAPFSVolume");
  BOOL v9 = v8 != 0;
  if (v8)
  {
    if (a2) {
      *a2 = 1;
    }
    CFTypeRef v10 = IORegistryEntrySearchCFProperty(v7, "IOService", @"CaseSensitive", kCFAllocatorDefault, 0);
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = CFEqual(v10, kCFBooleanTrue);
      if (a2 && v12) {
        *a2 = 0;
      }
      CFRelease(v11);
    }
  }

  IOObjectRelease(v7);
  return v9;
}

uint64_t is_hfs(const char *a1, int *a2)
{
  *a2 = -1;
  size_t __size = 0LL;
  int v3 = open(a1, 4, 0LL);
  if (v3 >= 1)
  {
    int v4 = v3;
    if (ioctl(v3, 0x40046418uLL, &__size) == -1)
    {
      size_t v5 = 512LL;
      size_t __size = 512LL;
    }

    else
    {
      size_t v5 = __size;
      if (__size > 0x10000) {
        goto LABEL_11;
      }
    }

    io_registry_entry_t v7 = (unsigned __int16 *)malloc(v5);
    if (!v7)
    {
LABEL_11:
      uint64_t v6 = 0LL;
      goto LABEL_12;
    }

    BOOLean_t v8 = v7;
    unsigned int v10 = *v8;
    if (v10 == 17474)
    {
      if (v8[62] == 11080)
      {
        unsigned int v10 = *v8;
      }

      else
      {
        unint64_t v11 = 0LL;
        unsigned int v10 = 17474;
      }
    }

    else
    {
      unint64_t v11 = 0LL;
    }

    unsigned int v12 = __rev16(v10);
    if (v12 == 16964)
    {
      int v13 = 128;
      goto LABEL_39;
    }

    if (v12 == 18520)
    {
      if (v8[1] != 1280) {
        goto LABEL_9;
      }
    }

    else if (v12 != 18475 || v8[1] != 1024)
    {
      goto LABEL_9;
    }

    if (*((_DWORD *)v8 + 3) && (v8[3] & 0x20) != 0) {
      *a2 = 1;
    }
    if (v10 != 22600)
    {
LABEL_37:
      if ((*a2 & 0x80000000) == 0)
      {
LABEL_40:
        uint64_t v6 = 1LL;
        goto LABEL_10;
      }

      int v13 = 0;
LABEL_39:
      *a2 = v13;
      goto LABEL_40;
    }

    if ((unint64_t)readdisk( v4,  v11 + bswap32(*((_DWORD *)v8 + 10)) * (unint64_t)bswap32(*((_DWORD *)v8 + 72)),  0x78uLL,  __size,  v8) >= 0x78)
    {
      if (v8[17] == 1026 && *((unsigned __int8 *)v8 + 51) == 188)
      {
        if (*a2 == 1) {
          int v13 = 3;
        }
        else {
          int v13 = 2;
        }
        goto LABEL_39;
      }

      goto LABEL_37;
    }

LABEL_9:
    uint64_t v6 = 0LL;
LABEL_10:
    free(v8);
LABEL_12:
    close(v4);
    return v6;
  }

  return 0LL;
}

uint64_t is_msdos(const char *a1, int *a2)
{
  unint64_t v23 = 0LL;
  *a2 = -1;
  int v4 = (unsigned __int8 *)malloc(0x800uLL);
  if (v4)
  {
    size_t v5 = v4;
    int v6 = open(a1, 4, 0LL);
    if (v6 >= 1)
    {
      int v7 = v6;
      if (ioctl(v6, 0x40046418uLL, &v23) == -1)
      {
        size_t v8 = 512LL;
        unint64_t v23 = 512LL;
      }

      else
      {
        size_t v8 = v23;
        if (v23 > 0x800) {
          goto LABEL_14;
        }
      }

      if ((unint64_t)readdisk(v7, 0LL, 0x200uLL, v8, v5) >= 0x200)
      {
        int v11 = *v5;
        if (v11 == 233 || v11 == 235 && v5[2] == 144)
        {
          unsigned int v12 = *(unsigned __int16 *)(v5 + 11);
          if (v12 >= 0x200)
          {
            uint64_t v9 = 0LL;
            if (v12 > 0x800) {
              goto LABEL_15;
            }
            v10.i32[0] = *(unsigned __int16 *)(v5 + 11);
            uint8x8_t v14 = (uint8x8_t)vcnt_s8(v10);
            v14.i16[0] = vaddlv_u8(v14);
            if (v14.i32[0] > 1u) {
              goto LABEL_15;
            }
            unsigned int v15 = v5[13];
            if ((v15 & (v15 - 1)) == 0 && v15 != 0)
            {
              int v17 = *((unsigned __int16 *)v5 + 11);
              if (!*((_WORD *)v5 + 11)) {
                int v17 = *((_DWORD *)v5 + 9);
              }
              int v18 = *(unsigned __int16 *)(v5 + 19);
              unsigned int v19 = (v12 - 1 + 32 * *(unsigned __int16 *)(v5 + 17)) / v12;
              if (!*(_WORD *)(v5 + 19)) {
                int v18 = *((_DWORD *)v5 + 8);
              }
              unsigned int v20 = (v18 - (v19 + *((unsigned __int16 *)v5 + 7) + v17 * v5[16])) / v15;
              uint64_t v9 = 1LL;
              if (v20 < 0xFFF5) {
                int v21 = 1;
              }
              else {
                int v21 = 2;
              }
              if (v20 >= 0xFF5) {
                int v22 = v21;
              }
              else {
                int v22 = 0;
              }
              *a2 = v22;
              goto LABEL_15;
            }
          }
        }
      }

uint64_t readdisk(int a1, unint64_t a2, size_t a3, size_t a4, void *a5)
{
  size_t v10 = a2 / a4;
  size_t v11 = (a3 + a2) / a4 - a2 / a4;
  unsigned int v12 = (char *)malloc((v11 + 1) * a4);
  if (v11 == -1LL)
  {
    uint64_t v13 = 0LL;
LABEL_10:
    memcpy(a5, &v12[a2 - v10 * a4], a3);
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    size_t v15 = v11 + 1;
    while (pread(a1, &v12[v13], a4, (v14 + v10) * a4) == a4 || a4 == -1LL)
    {
      v13 += a4;
      ++v14;
      if (!--v15) {
        goto LABEL_10;
      }
    }
  }

  free(v12);
  return v13;
}

uint64_t GetFSEncryptionStatus(char *a1, char *a2, char a3, _DWORD *a4)
{
  *(void *)io_registry_entry_t entry = 0LL;
  if (!a2) {
    return 22LL;
  }
  uint64_t v8 = sub_100017C94(a1, &entry[1]);
  if (!(_DWORD)v8)
  {
    if (a4) {
      *a4 = 0;
    }
    if (is_apfs(a1, 0LL)
      && (uint64_t v9 = (const __CFBoolean *)IORegistryEntryCreateCFProperty( entry[1],  @"Encrypted",  kCFAllocatorDefault,  0)) != 0LL)
    {
      size_t v10 = v9;
      if (CFBooleanGetValue(v9) == 1)
      {
        size_t v11 = strlen(a1);
        unsigned int v12 = &a1[v11];
        uint64_t v13 = &a1[v11 - 1];
        if (v13 < a1 || (int v14 = *v13, (v14 - 48) > 9))
        {
          int v18 = -1;
        }

        else
        {
          int v15 = 0;
          unint64_t v16 = (unint64_t)&a1[v11 - 2];
          int v17 = 1;
          do
          {
            uint64_t v13 = (char *)v16;
            v15 += (v14 - 48) * v17;
            v17 *= 10;
            --v16;
            int v14 = *v13;
          }

          while ((v14 - 48) <= 9);
          int v18 = v15 - 1;
          unsigned int v12 = v13 + 1;
        }

        if (v13 > a1 && *v13 == 115)
        {
          if (*(v12 - 2) == 47) {
            int v20 = -1;
          }
          else {
            int v20 = v18;
          }
        }

        else
        {
          int v20 = -1;
        }

        if (IORegistryEntryGetParentEntry(entry[1], "IOService", entry))
        {
          char v19 = 0;
        }

        else
        {
          if (IOObjectConformsTo(entry[0], "AppleAPFSContainer"))
          {
            if (sub_100017D60(entry[0], v20))
            {
              if (a4) {
                *a4 |= 2u;
              }
              char v19 = 1;
            }

            else
            {
              char v19 = a3 ^ 1;
            }
          }

          else
          {
            char v19 = 0;
          }

          IOObjectRelease(entry[0]);
        }

        if (a4)
        {
          CFTypeRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty( entry[1],  @"EncryptionRolling",  kCFAllocatorDefault,  0);
          if (CFProperty)
          {
            int v22 = CFProperty;
            if (CFBooleanGetValue(CFProperty) == 1)
            {
              *a4 |= 4u;
              CFRelease(v22);
            }
          }
        }
      }

      else
      {
        char v19 = 0;
      }

      *a2 = v19;
      CFRelease(v10);
    }

    else
    {
      *a2 = 0;
    }
  }

  if (entry[1]) {
    IOObjectRelease(entry[1]);
  }
  return v8;
}

uint64_t sub_100017C94(char *__s1, io_service_t *a2)
{
  uint64_t result = 22LL;
  if (__s1 && a2)
  {
    *a2 = 0;
    if (!strncmp(__s1, "/dev/", 5uLL)) {
      uint64_t v5 = 5LL;
    }
    else {
      uint64_t v5 = 0LL;
    }
    int v6 = &__s1[v5];
    if (!strncmp(v6, "rdisk", 5uLL)) {
      int v7 = v6 + 1;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = IOBSDNameMatching(kIOMasterPortDefault, 0, v7);
    if (v8)
    {
      uint64_t v9 = v8;
      CFDictionarySetValue(v8, @"IOProviderClass", @"IOMedia");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v9);
      uint64_t result = 0LL;
      *a2 = MatchingService;
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

uint64_t sub_100017D60(io_service_t a1, int a2)
{
  kern_return_t v3;
  uint64_t result;
  size_t outputStructCnt;
  __int16 outputStruct;
  int inputStruct;
  io_connect_t connect;
  outputStruct = 0;
  outputStructCnt = 2LL;
  if (IOServiceOpen(a1, mach_task_self_, 0, &connect)) {
    return 1LL;
  }
  inputStruct = a2;
  int v3 = IOConnectCallStructMethod(connect, 0x13u, &inputStruct, 4uLL, &outputStruct, &outputStructCnt);
  IOServiceClose(connect);
  if (v3) {
    return 1LL;
  }
  uint64_t result = 0LL;
  if ((_BYTE)outputStruct)
  {
    if (!HIBYTE(outputStruct)) {
      return 1LL;
    }
  }

  return result;
}

uint64_t GetDiskImageEncryptionStatus(char *a1, BOOL *a2)
{
  io_registry_entry_t entry = 0;
  uint64_t v2 = 22LL;
  if (a1 && a2)
  {
    uint64_t v2 = sub_100017C94(a1, &entry);
    if (!(_DWORD)v2)
    {
      CFBooleanRef v4 = (CFBooleanRef)IORegistryEntrySearchCFProperty( entry,  "IOService",  @"image-encrypted",  kCFAllocatorDefault,  3u);
      if (v4)
      {
        *a2 = v4 == kCFBooleanTrue;
        CFRelease(v4);
      }

      else
      {
        *a2 = 0;
      }
    }

    if (entry) {
      IOObjectRelease(entry);
    }
  }

  return v2;
}

uint64_t _FSGetMediaEncryptionStatusAtPath(char *a1, BOOL *a2, _DWORD *a3)
{
  __int16 v9 = 0;
  uint64_t result = 22LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = GetFSEncryptionStatus(a1, (char *)&v9 + 1, 0, a3);
      if (!(_DWORD)result)
      {
        if (a3 || !HIBYTE(v9))
        {
          int DiskImageEncryptionStatus = GetDiskImageEncryptionStatus(a1, (BOOL *)&v9);
          int v7 = v9;
          if (!DiskImageEncryptionStatus && a3)
          {
            if ((_BYTE)v9)
            {
              *a3 |= 1u;
              int v7 = 1;
            }
          }
        }

        else
        {
          int v7 = 0;
        }

        uint64_t result = 0LL;
        *a2 = (HIBYTE(v9) | v7) != 0;
      }
    }
  }

  return result;
}

uint64_t _FSGetMediaEncryptionStatus(const __CFString *a1, BOOL *a2, _DWORD *a3)
{
  if (CFStringGetCString(a1, buffer, 1025LL, 0x8000100u)) {
    return _FSGetMediaEncryptionStatusAtPath(buffer, a2, a3);
  }
  else {
    return 22LL;
  }
}

void sub_100017FD8()
{
  __assert_rtn( "__DACommandMachChannelHandler",  "DACommand.c",  269,  "job->kind == __kDACommandMachChannelJobKindExecute");
}

void sub_100018000()
{
}

void sub_100018028()
{
}

void sub_100018050()
{
}

void sub_100018078(uint64_t a1, os_log_s *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)&v2, 0xCu);
}

void sub_1000180EC()
{
}

void sub_100018114()
{
}

void sub_10001813C()
{
}

void sub_100018164()
{
}

void sub_10001818C()
{
}

void sub_1000181B4()
{
}

void sub_1000181DC()
{
}

void sub_100018204()
{
}

void sub_10001822C()
{
}

void sub_100018254()
{
}

void sub_10001827C()
{
}

void sub_1000182A4()
{
}

void sub_1000182CC()
{
}

void sub_1000182F4()
{
}

void sub_10001831C()
{
}

void sub_100018344()
{
  __assert_rtn("DAQueueCallback", "DAQueue.c", 552, "argument1 == NULL");
}

void sub_10001836C()
{
  __assert_rtn("DAQueueCallback", "DAQueue.c", 611, "argument1 == NULL");
}

void sub_100018394()
{
  __assert_rtn("_DAMediaAppearedCallback", "DAServer.c", 1146, "___CFArrayContainsValue( gDADiskList, disk) == FALSE");
}

void sub_1000183BC()
{
  __assert_rtn("_DAMediaDisappearedCallback", "DAServer.c", 1384, "context == NULL");
}

void sub_1000183E4()
{
}

void sub_10001840C()
{
}

void sub_100018434()
{
  __assert_rtn("DASessionCreate", "DASession.c", 218, "port == MACH_PORT_NULL");
}

void sub_10001845C()
{
  __assert_rtn("__DAThreadMachChannelHandler", "DAThread.c", 143, "job->kind == __kDAThreadMachChannelJobKindExecute");
}

void sub_100018484()
{
}

void sub_1000184AC()
{
  __assert_rtn("__DAThreadFunction", "DAThread.c", 77, "job->kind == __kDAThreadMachChannelJobKindExecute");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}