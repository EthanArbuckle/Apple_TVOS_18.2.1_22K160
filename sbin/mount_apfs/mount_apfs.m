uint64_t sub_1000018FC(char *__s2, char *a2, char *a3, size_t a4, char **a5)
{
  uint64_t v10;
  char *v11;
  uint64_t result;
  if (!strncmp("/dev/", __s2, 5uLL)) {
    v10 = 5LL;
  }
  else {
    v10 = 0LL;
  }
  v11 = &__s2[v10];
  if (!strncmp(&__s2[v10], "disk", 4uLL))
  {
    result = snprintf(a2, a4, "%s%s", "/dev/", v11);
    if (a3) {
      result = snprintf(a3, a4, "%sr%s");
    }
    goto LABEL_14;
  }

  if (!strncmp(v11, "rdisk", 5uLL))
  {
    result = snprintf(a2, a4, "%s%s", "/dev/", v11 + 1);
    if (a3) {
      result = snprintf(a3, a4, "%s%s");
    }
LABEL_14:
    if (!a5) {
      return result;
    }
    a2 += 5;
    goto LABEL_16;
  }

  result = strlcpy(a2, __s2, a4);
  if (a3) {
    result = strlcpy(a3, __s2, a4);
  }
  if (a5) {
LABEL_16:
  }
    *a5 = a2;
  return result;
}

uint64_t start(int a1, char *const *a2)
{
  kern_return_t ParentEntry;
  CFBooleanRef v37;
  CFBooleanRef v38;
  int v39;
  int v40;
  __int16 v41;
  CFStringRef v42;
  CFStringRef v43;
  CFTypeID v44;
  CFMutableDictionaryRef v45;
  __int16 v46;
  CFStringRef v47;
  CFStringRef v48;
  CFURLRef v49;
  CFURLRef v50;
  CFDataRef v51;
  CFDataRef v52;
  CFTypeID v53;
  CFStringEncoding SystemEncoding;
  CFStringRef v55;
  CFStringRef v56;
  CFStringEncoding v57;
  const char *CStringPtr;
  CFStringEncoding v59;
  int v60;
  uint64_t result;
  char *v62;
  int v63;
  char *v64;
  char *v65;
  int v66;
  int Value;
  CFMutableDictionaryRef properties;
  io_registry_entry_t parent;
  int v70[4];
  uint64_t v71;
  uint64_t v72;
  stat v73;
  int v74[2];
  _OWORD v75[2];
  char *__endptr[2];
  _OWORD v77[63];
  _DWORD v78[256];
  char v79[1024];
  statfs __b;
  __int128 v81;
  _OWORD v82[16];
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  char *__s1[2];
  _OWORD v87[19];
  int v88;
  uint64_t v89;
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  v75[0] = v4;
  v75[1] = v4;
  *(void *)v74 = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v73.st_blksize = v4;
  *(timespec *)v73.st_qspare = v4;
  v73.st_birthtimespec = v4;
  *(timespec *)&v73.st_size = v4;
  v73.st_mtimespec = v4;
  v73.st_ctimespec = v4;
  *(timespec *)&v73.uid_t st_uid = v4;
  v73.st_atimespec = v4;
  *(timespec *)&v73.st_dev = v4;
  memset(&__b, 170, sizeof(__b));
  memset(v79, 170, sizeof(v79));
  memset(v78, 170, sizeof(v78));
  __strlcpy_chk(v78, "", 1LL, 1024LL);
  __strlcpy_chk(v79, "", 1LL, 1024LL);
  sub_100002DB0(0LL, (int *)v75);
  sub_100003054(0LL, v74);
  v81 = 0u;
  memset(v82, 0, sizeof(v82));
  v83 = 0u;
  v84 = 0u;
  v85 = 0LL;
  v88 = 0;
  memset(v87, 0, sizeof(v87));
  *(_OWORD *)__s1 = 0u;
  v89 = -1LL;
  v71 = 0LL;
  v72 = 0LL;
  err_set_exit((void (__cdecl *)(int))sub_1000027C4);
  int v5 = 0;
  v64 = 0LL;
  v65 = 0LL;
  int v6 = 0;
  v66 = 0;
  int v7 = 0;
  v63 = 0;
  v62 = 0LL;
  while (2)
  {
    while (1)
    {
      uint64_t v8 = getopt(a1, a2, ":cCF:g:M:o:P:rRnSs:u:E:T:");
      switch((int)v8)
      {
        case 'g':
          v10 = optarg;
          __endptr[0] = (char *)0xAAAAAAAAAAAAAAAALL;
          int gr_gid = strtol(optarg, __endptr, 0);
          if (*__endptr[0])
          {
            v12 = getgrnam(v10);
            if (!v12)
            {
              HIDWORD(v89) = -1;
              sub_100003338();
            }

            int gr_gid = v12->gr_gid;
          }

          HIDWORD(v89) = gr_gid;
          if (gr_gid == -1) {
            sub_100003338();
          }
          return result;
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'p':
        case 'q':
        case 't':
          continue;
        case 'n':
          v74[1] |= 4u;
          break;
        case 'o':
          if (sub_1000030EC( optarg,  (uint64_t (*)(const char *, uint64_t))sub_100002DB0,  (uint64_t)v75,  (uint64_t (*)(const char *, uint64_t))sub_100003054,  (uint64_t)v74))
          {
            errx(64, "unrecognized option '%s'");
          }

          return result;
        case 'r':
          v63 = 1;
          break;
        case 's':
          v62 = optarg;
          break;
        case 'u':
          v13 = optarg;
          __endptr[0] = (char *)0xAAAAAAAAAAAAAAAALL;
          int pw_uid = strtol(optarg, __endptr, 0);
          if (*__endptr[0])
          {
            v15 = getpwnam(v13);
            if (!v15)
            {
              LODWORD(v89) = -1;
              sub_100003364();
            }

            int pw_uid = v15->pw_uid;
          }

          LODWORD(v89) = pw_uid;
          if (pw_uid == -1) {
            sub_100003364();
          }
          return result;
        default:
          if ((_DWORD)v8 == 99) {
            int v7 = 1;
          }
          break;
      }
    }

    switch((int)v8)
    {
      case '?':
        sub_100003390(v8);
      case '@':
      case 'A':
      case 'B':
      case 'D':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'N':
      case 'O':
      case 'Q':
        continue;
      case 'C':
        goto LABEL_31;
      case 'E':
        v9 = optarg;
        int v6 = 4;
        if (strcasecmp(optarg, "generic"))
        {
          int v6 = 5;
          if (strcasecmp(v9, "supplemental"))
          {
            int v6 = 6;
            if (strcasecmp(v9, "pdi_nonce"))
            {
              int v6 = 8;
              if (strcasecmp(v9, "mobile_asset")) {
                errx(64, "invalid auth environment '%s'");
              }
            }
          }
        }

        continue;
      case 'F':
        sub_1000027DC(optarg, (char *)&v87[8] + 12, 0x80uLL);
LABEL_31:
        v66 = 1;
        continue;
      case 'M':
        v64 = sub_100002B48(optarg, &v71);
        continue;
      case 'P':
        v65 = sub_100002B48(optarg, &v72);
        continue;
      case 'R':
        v74[1] |= 2u;
        continue;
      case 'S':
        v74[1] |= 8u;
        continue;
      case 'T':
        v16 = optarg;
        int v5 = 1735681910;
        if (strcasecmp(optarg, "generic"))
        {
          int v5 = 1937334626;
          if (strcasecmp(v16, "brain")) {
            errx(64, "invalid cryptex type '%s'");
          }
        }

        continue;
      default:
        if ((_DWORD)v8 != -1)
        {
          if ((_DWORD)v8 == 58) {
            sub_1000033B8(v8);
          }
          continue;
        }

        uint64_t v17 = (a1 - optind);
        if ((_DWORD)v17 != 2) {
          sub_100003314(v17);
        }
        int v18 = v74[0];
        if (v66 && v7 | v74[0] & 0x10000) {
          sub_1000031DC(v17);
        }
        if ((v65 != 0LL) != (v64 != 0LL)) {
          sub_1000031F0(v17);
        }
        if (v65 && !v72 || v64 && !v71) {
          sub_100003204(v17);
        }
        if (v6 && !v65) {
          sub_100003218(v17);
        }
        if (v5 && !v65) {
          sub_10000322C(v17);
        }
        uint64_t v19 = (uint64_t)&a2[optind];
        if ((v74[0] & 0x10000) == 0)
        {
          if (v65)
          {
            *(void *)((char *)&v87[16] + 12) = v65;
            *(void *)((char *)&v87[17] + 4) = v72;
            *(void *)((char *)&v87[17] + 12) = v64;
            *(void *)((char *)&v87[18] + 4) = v71;
            HIDWORD(v87[18]) = v5;
            v88 = v6;
          }

          if (v66)
          {
            __int16 v20 = 4;
            goto LABEL_61;
          }

          if (v7)
          {
            if (v63) {
              __int16 v20 = 7;
            }
            else {
              __int16 v20 = 5;
            }
LABEL_61:
            LOWORD(v87[0]) = v20;
            sub_1000027DC(*(char **)v19, (char *)v87 + 12, 0x80uLL);
          }

          else if (v62)
          {
            if (v65) {
              v41 = 3;
            }
            else {
              v41 = 2;
            }
            LOWORD(v87[0]) = v41;
            if ((v73.st_mode & 0xF000) == 0x6000)
            {
            }

            else
            {
              DWORD2(v87[0]) = v73.st_dev;
            }

            __strlcpy_chk((char *)v87 + 12, v62, 256LL, 256LL);
          }

          else
          {
            if (v65) {
              v46 = 8;
            }
            else {
              v46 = 1;
            }
            LOWORD(v87[0]) = v46;
          }
        }

        if ((v74[0] & 0x8000000) != 0)
        {
        }

        else if (!realpath_DARWIN_EXTSN(*(const char **)(v19 + 8), v79))
        {
          err(66, "%s");
        }

        if ((v18 & 0x10000) != 0)
        {
          if (v7)
          {
            sub_1000027DC(*(char **)v19, (char *)v78, 0x400uLL);
            DWORD2(v83) = 2;
            uint64_t v21 = 5LL;
            if (v78[0] ^ 0x7665642F | LOBYTE(v78[1]) ^ 0x2F) {
              uint64_t v21 = 0LL;
            }
            v22 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)v78 + v21);
            io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v22);
            if (!MatchingService)
            {
              int v28 = 2;
              goto LABEL_179;
            }

            io_registry_entry_t v24 = MatchingService;
            *(void *)((char *)v77 + 13) = 0xAAAAAAAAAAAAAAAALL;
            *(void *)&__int128 v25 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)__endptr = v25;
            v77[0] = v25;
            if (IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
            {
              CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty( v24,  @"UUID",  kCFAllocatorDefault,  0);
              if (CFProperty)
              {
                v27 = CFProperty;
                if (CFStringGetCString(CFProperty, (char *)__endptr, 37LL, 0x8000100u))
                {
                  int v28 = uuid_parse((const char *)__endptr, (unsigned __int8 *)v82);
                  CFRelease(v27);
                  IOObjectRelease(v24);
                  if (!v28)
                  {
                    if (fsctl(v79, 0x81384A06uLL, &v81, 0)) {
                      sub_100003284();
                    }
                    goto LABEL_157;
                  }

LABEL_179:
                  errc(66, v28, "switch crypto context");
                }
              }

              int v28 = 2;
            }

            else
            {
              int v28 = 22;
            }

            IOObjectRelease(v24);
            goto LABEL_179;
          }
        }

        else
        {
          if ((_DWORD)v89 == -1)
          {
            if ((v74[0] & 0x200000) != 0) {
              uid_t st_uid = 99;
            }
            else {
              uid_t st_uid = v73.st_uid;
            }
            LODWORD(v89) = st_uid;
          }

          if (HIDWORD(v89) == -1)
          {
            if ((v74[0] & 0x200000) != 0) {
              gid_t st_gid = 99;
            }
            else {
              gid_t st_gid = v73.st_gid;
            }
            HIDWORD(v89) = st_gid;
          }
        }

        *(_OWORD *)v70 = xmmword_100003F50;
        __s1[1] = *(char **)v74;
        v31 = __s1[0];
        if (!__s1[0]
          || (strncmp(__s1[0], "/dev/", 5uLL) ? (uint64_t v32 = 0LL) : (uint64_t v32 = 5LL),
              v33 = IOBSDNameMatching(kIOMainPortDefault, 0, &v31[v32]),
              (io_service_t v34 = IOServiceGetMatchingService(kIOMainPortDefault, v33)) == 0))
        {
          v40 = 0;
          v39 = -1;
          if ((v18 & 0x10000) == 0) {
            goto LABEL_149;
          }
          goto LABEL_150;
        }

        io_registry_entry_t v35 = v34;
        Value = 0;
        while (2)
        {
          parent = -1431655766;
          ParentEntry = IORegistryEntryGetParentEntry(v35, "IOService", &parent);
          IOObjectRelease(v35);
          if (ParentEntry)
          {
LABEL_103:
            v39 = -1;
            v40 = Value;
            if ((v18 & 0x10000) == 0) {
              goto LABEL_149;
            }
            goto LABEL_150;
          }

          if (IOObjectConformsTo(parent, "AppleAPFSContainerScheme"))
          {
            v37 = (const __CFBoolean *)IORegistryEntryCreateCFProperty( parent,  @"APFSComposited",  kCFAllocatorDefault,  0);
            if (v37)
            {
              v38 = v37;
              Value = CFBooleanGetValue(v37);
              CFRelease(v38);
            }
          }

          if (!IOObjectConformsTo(parent, "IOHDIXHDDriveOutKernel"))
          {
            if (IOObjectConformsTo(parent, "AppleDiskImageDevice"))
            {
              properties = 0LL;
              if (IORegistryEntryCreateCFProperties(parent, &properties, kCFAllocatorDefault, 0)) {
                goto LABEL_123;
              }
              if (CFDictionaryGetValue(properties, @"sparse-backend") != kCFBooleanTrue)
              {
                v39 = -1;
LABEL_146:
                v45 = properties;
                goto LABEL_147;
              }

              v47 = (const __CFString *)CFDictionaryGetValue(properties, @"DiskImageURL");
              if (!v47) {
                sub_1000032BC(v19);
              }
              v48 = v47;
              bzero(__endptr, 0x400uLL);
              v49 = CFURLCreateWithString(kCFAllocatorDefault, v48, 0LL);
              if (!v49)
              {
                v39 = -1;
                goto LABEL_146;
              }

              v50 = v49;
              if (!CFURLGetFileSystemRepresentation(v49, 0, (UInt8 *)__endptr, 1024LL)) {
                sub_1000032DC();
              }
              CFRelease(v50);
              v39 = open((const char *)__endptr, 0, 0LL);
              v70[2] = v39;
              if ((v39 & 0x80000000) == 0) {
                goto LABEL_146;
              }
LABEL_184:
              err(66, "cannot open backing store '%s' for '%s'");
            }

            io_registry_entry_t v35 = parent;
            if (!parent) {
              goto LABEL_103;
            }
            continue;
          }

          break;
        }

        __endptr[0] = 0LL;
        if (IORegistryEntryCreateCFProperties(parent, (CFMutableDictionaryRef *)__endptr, kCFAllocatorDefault, 0))
        {
LABEL_123:
          v39 = -1;
          goto LABEL_148;
        }

        v42 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)__endptr[0], @"image-type");
        if (!v42
          || (v43 = v42, v44 = CFGetTypeID(v42), v44 != CFStringGetTypeID())
          || CFStringCompare(v43, @"sparse disk image", 0LL)
          && CFStringCompare(v43, @"sparse bundle disk image", 0LL))
        {
          v39 = -1;
          goto LABEL_121;
        }

        v51 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)__endptr[0], @"image-path");
        if (!v51
          || (v52 = v51, v53 = CFGetTypeID(v51), v53 != CFDataGetTypeID())
          || (SystemEncoding = CFStringGetSystemEncoding(),
              (v55 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v52, SystemEncoding)) == 0LL))
        {
          sub_1000032BC(v19);
        }

        v56 = v55;
        v57 = CFStringGetSystemEncoding();
        CStringPtr = CFStringGetCStringPtr(v56, v57);
        if (!CStringPtr)
        {
          v59 = CFStringGetSystemEncoding();
          CStringPtr = byte_100008210;
          CFStringGetCString(v56, byte_100008210, 4096LL, v59);
        }

        v60 = open(CStringPtr, 0, 0LL);
        v70[2] = v60;
        if (v60 < 0) {
          goto LABEL_184;
        }
        v39 = v60;
        CFRelease(v56);
LABEL_121:
        v45 = (CFMutableDictionaryRef)__endptr[0];
LABEL_147:
        CFRelease(v45);
LABEL_148:
        v40 = Value;
        IOObjectRelease(parent);
        if ((v18 & 0x10000) != 0)
        {
LABEL_150:
          __s1[0] = 0LL;
          goto LABEL_151;
        }

LABEL_149:
LABEL_151:
        if (mount("apfs", v79, v74[0], __s1)) {
          sub_10000329C();
        }
        if ((v39 & 0x80000000) == 0)
        {
          if (fsctl(v79, 0x80106807uLL, v70, 0) && *__error() != 37)
          {
            warn("cannot propagate backing store information to %s", v79);
            if (v40) {
              goto LABEL_163;
            }
          }

          else
          {
            if (!v40) {
              goto LABEL_156;
            }
LABEL_163:
            warnx("APFS Fusion is not guaranteed to work reliably on top of sparse images");
          }

LABEL_156:
          close(v70[2]);
        }

LABEL_157:
        if ((v74[0] & 0x10001) == 0 && !statfs(v79, &__b) && (__b.f_flags & 1) != 0) {
          sub_100003240((uint64_t)__s1);
        }
        return 0LL;
    }
  }
}

void sub_1000027C4(int a1)
{
  if (a1 == 64) {
    warnx( "[-o options] [-u UID] [-g GID] [-n] [-c [-r] | [-C|-F <tier2 device>]] [-s snapshot] [-P <im4p file> -M <im4m file > [-T <generic | brain>] [-E <generic | supplemental | pdi_nonce | mobile_asset]] <volume | device> <directory>");
  }
}

uint64_t sub_1000027DC(char *a1, char *a2, size_t a3)
{
  if (strncasecmp(a1, "ROLE=", 5uLL)) {
    return sub_1000018FC(a1, a2, 0LL, a3, 0LL);
  }
  int v7 = a1 + 5;
  if (!strcasecmp(v7, "SYSTEM"))
  {
    uint64_t v8 = 1LL;
  }

  else if (!strcasecmp(v7, "USER"))
  {
    uint64_t v8 = 2LL;
  }

  else if (!strcasecmp(v7, "RECOVERY"))
  {
    uint64_t v8 = 4LL;
  }

  else if (!strcasecmp(v7, "VM"))
  {
    uint64_t v8 = 8LL;
  }

  else if (!strcasecmp(v7, "PREBOOT"))
  {
    uint64_t v8 = 16LL;
  }

  else if (!strcasecmp(v7, "INSTALLER"))
  {
    uint64_t v8 = 32LL;
  }

  else if (!strcasecmp(v7, "DATA"))
  {
    uint64_t v8 = 64LL;
  }

  else if (!strcasecmp(v7, "BASEBAND"))
  {
    uint64_t v8 = 128LL;
  }

  else if (!strcasecmp(v7, "XART"))
  {
    uint64_t v8 = 256LL;
  }

  else if (!strcasecmp(v7, "INTERNAL"))
  {
    uint64_t v8 = 512LL;
  }

  else if (!strcasecmp(v7, "BACKUP"))
  {
    uint64_t v8 = 384LL;
  }

  else if (!strcasecmp(v7, "UPDATE"))
  {
    uint64_t v8 = 192LL;
  }

  else if (!strcasecmp(v7, "HARDWARE"))
  {
    uint64_t v8 = 320LL;
  }

  else if (!strcasecmp(v7, "SIDECAR"))
  {
    uint64_t v8 = 448LL;
  }

  else if (!strcasecmp(v7, "ENTERPRISE"))
  {
    uint64_t v8 = 576LL;
  }

  else if (!strcasecmp(v7, "IDIAGS"))
  {
    uint64_t v8 = 640LL;
  }

  else
  {
    if (strcasecmp(v7, "OVERPROVISION")) {
      errx(64, "Unknown role: %s", v7);
    }
    uint64_t v8 = 704LL;
  }

  memset(&__b, 170, sizeof(__b));
  if (statfs("/", &__b)) {
    errx(66, "statfs has failed, err %i");
  }
  CFArrayRef theArray = (CFArrayRef)0xAAAAAAAAAAAAAAAALL;
  if (!theArray || CFArrayGetCount(theArray) <= 0) {
    errx(66, "No volumes with role %s were found on disk %s");
  }
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0LL);
  uint64_t result = CFStringGetCString(ValueAtIndex, a2, a3, 0x8000100u);
  if (!(_DWORD)result) {
    sub_1000033E0();
  }
  return result;
}

char *sub_100002B48(const char *a1, void *a2)
{
  int v3 = open(a1, 0);
  if (v3 == -1) {
    err(66, "cannot open %s");
  }
  int v4 = v3;
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v13.st_blksize = v5;
  *(timespec *)v13.st_qspare = v5;
  v13.st_birthtimespec = v5;
  *(timespec *)&v13.unint64_t st_size = v5;
  v13.st_mtimespec = v5;
  v13.st_ctimespec = v5;
  *(timespec *)&v13.uid_t st_uid = v5;
  v13.st_atimespec = v5;
  *(timespec *)&v13.st_dev = v5;
  if (fstat(v3, &v13) == -1) {
    err(66, "cannot stat %s");
  }
  unint64_t st_size = v13.st_size;
  if (v13.st_size > 0x100000uLL) {
    errx(66, "file %s is too large");
  }
  int v7 = (char *)malloc(v13.st_size);
  if (!v7) {
    errx(66, "failed to allocate memory for %s");
  }
  uint64_t v8 = v7;
  for (uint64_t i = 0LL; st_size; st_size -= v11)
  {
    if (st_size >= 0x10000) {
      size_t v10 = 0x10000LL;
    }
    else {
      size_t v10 = st_size;
    }
    ssize_t v11 = read(v4, &v8[i], v10);
    if (!v11) {
      break;
    }
    if (v11 == -1) {
      err(66, "cannot read %s into memory");
    }
    i += v11;
  }

  if (a2) {
    *a2 = i;
  }
  return v8;
}

BOOL sub_100002C7C(char *a1, char *a2, _DWORD *a3)
{
  int v18 = (statfs *)0xAAAAAAAAAAAAAAAALL;
  sub_1000027DC(a1, a2, 0x400uLL);
  int v5 = getmntinfo(&v18, 2);
  if (v5 < 1) {
    return 0LL;
  }
  unsigned int v6 = v5;
  int v7 = v18;
  f_mntfromname = v18->f_mntfromname;
  v9 = strrchr(v18->f_mntfromname, 64);
  if (v9) {
    size_t v10 = v9 + 1;
  }
  else {
    size_t v10 = f_mntfromname;
  }
  unint64_t v11 = 0LL;
  if (strcmp(v10, a2))
  {
    unint64_t v12 = v6;
    stat v13 = v7[1].f_mntfromname;
    while (v12 - 1 != v11)
    {
      v14 = strrchr(v13, 64);
      if (v14) {
        v15 = v14 + 1;
      }
      else {
        v15 = v13;
      }
      v13 += 2168;
      ++v11;
      if (!strcmp(v15, a2))
      {
        BOOL v16 = v11 < v12;
        if (a3) {
          goto LABEL_16;
        }
        return v16;
      }
    }

    return 0LL;
  }

  BOOL v16 = 1LL;
  if (a3)
  {
LABEL_16:
    if (strcmp(v7[v11].f_fstypename, "apfs")) {
      sub_1000033F8();
    }
    *a3 = v7[v11].f_fsid.val[0];
  }

  return v16;
}

void sub_100002DA0(uint64_t a1, const char *a2)
{
}

void sub_100002DA8(uint64_t a1, const char *a2)
{
}

char *sub_100002DB0(char *a1, int *a2)
{
  getmnt_silent = 1;
  if (!a1)
  {
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    a2[1] = -1;
    return 0LL;
  }

  int v14 = *a2;
  unsigned int v4 = *((unsigned __int16 *)a2 + 4);
  int v5 = (v4 >> 6) & 8 | v4 & 5 | (v4 >> 8) & 0x10;
  int v6 = v4 << 18;
  if ((v4 & 0x1000) != 0) {
    int v7 = 32;
  }
  else {
    int v7 = 64;
  }
  unsigned int v13 = v7 & (v6 >> 31) | v5;
  uint64_t v8 = getmntopts();
  if (!v8) {
    return "";
  }
  uint64_t v9 = v8;
  *a2 = v14;
  *((_WORD *)a2 + 4) = a2[2] & 0xCDFA | v13 & 1 | v13 & 4 | (((v13 & 0x30) != 0) << 12) | (((v13 & 0x60) != 0) << 13) | (((v13 >> 3) & 1) << 9);
  if ((v13 & 2) != 0)
  {
    int v12 = getmntoptnum(v8, "checkpoint");
    a2[1] = v12;
    if (v12 == -1) {
      size_t v10 = "checkpoint";
    }
    else {
      size_t v10 = 0LL;
    }
  }

  else
  {
    size_t v10 = 0LL;
  }

  freemntopts(v9);
  uint64_t result = sub_100002F14((const char **)&off_100004260, a1, v10);
  if (!result) {
    return 0LL;
  }
  return result;
}

char *sub_100002F14(const char **a1, char *__s1, const char *a3)
{
  unsigned int v4 = __s1;
  int v6 = strdup(__s1);
  if (v6)
  {
    int v7 = v6;
    __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v8 = strtok_r(v6, ",", &__lasts);
    if (v8)
    {
      uint64_t v9 = v8;
      while (1)
      {
        int v10 = strncmp(v9, "no", 2uLL);
        unint64_t v11 = &v9[2 * (v10 == 0)];
        int v12 = strchr(v11, 61);
        if (v12) {
          char *v12 = 0;
        }
        unsigned int v13 = *a1;
        if (!*a1) {
          break;
        }
        int v14 = a1 + 3;
        while (strcasecmp(v13, v11))
        {
          v15 = *v14;
          v14 += 3;
          unsigned int v13 = v15;
          if (!v15) {
            goto LABEL_15;
          }
        }

        if (a3 && !strcasecmp(v11, a3)) {
          break;
        }
        uint64_t v9 = strtok_r(0LL, ",", &__lasts);
        if (!v9) {
          goto LABEL_14;
        }
      }

LABEL_15:
      uint64_t v16 = -2LL;
      if (v10) {
        uint64_t v16 = 0LL;
      }
      unsigned int v4 = (char *)&v11[(void)v4 + v16 - (void)v7];
    }

    else
    {
LABEL_14:
      unsigned int v4 = 0LL;
    }

    free(v7);
  }

  return v4;
}

char *sub_100003054(char *a1, void *a2)
{
  getmnt_silent = 1;
  if (!a1)
  {
    *a2 = 0LL;
    return 0LL;
  }

  int v4 = *(_DWORD *)a2;
  int v7 = 0;
  int v8 = v4;
  uint64_t v5 = getmntopts(a1, &off_100008000, &v8, &v7);
  if (v5)
  {
    *(_DWORD *)a2 = v8;
    freemntopts(v5);
    uint64_t result = sub_100002F14((const char **)&off_100008000, a1, 0LL);
    if (result) {
      return result;
    }
    return 0LL;
  }

  return "";
}

const char *sub_1000030EC( const char *a1, uint64_t (*a2)(const char *, uint64_t), uint64_t a3, uint64_t (*a4)(const char *, uint64_t), uint64_t a5)
{
  size_t v10 = strlen(a1);
  size_t v11 = 0LL;
  size_t v12 = 0LL;
  do
  {
    if (v11 != v10 && v11 <= v12)
    {
      unsigned int v13 = (const char *)a2(&a1[v11], a3);
      size_t v11 = v10;
      if (v13)
      {
        size_t v11 = v13 - a1;
        if (v13 - a1 < v12)
        {
          int v14 = strchr(v13, 44);
          if (v14) {
            size_t v11 = v14 - a1;
          }
          else {
            size_t v11 = v10;
          }
        }
      }
    }

    if (v12 != v10 && v12 <= v11)
    {
      v15 = (const char *)a4(&a1[v12], a5);
      size_t v12 = v10;
      if (v15)
      {
        size_t v12 = v15 - a1;
        if (v15 - a1 < v11)
        {
          uint64_t v16 = strchr(v15, 44);
          if (v16) {
            size_t v12 = v16 - a1;
          }
          else {
            size_t v12 = v10;
          }
        }
      }
    }
  }

  while (v11 != v12);
  if (v11 == v10) {
    return 0LL;
  }
  else {
    return &a1[v11];
  }
}

void sub_1000031DC(uint64_t a1)
{
}

void sub_1000031F0(uint64_t a1)
{
}

void sub_100003204(uint64_t a1)
{
}

void sub_100003218(uint64_t a1)
{
}

void sub_10000322C(uint64_t a1)
{
}

void sub_100003240(uint64_t a1)
{
  if (*(_WORD *)(a1 + 16) == 2) {
    v1 = "snapshot ";
  }
  else {
    v1 = "";
  }
  warnx("%simplicitly mounted readonly", v1);
}

void sub_100003284()
{
}

void sub_10000329C()
{
  v0 = __error();
  int v1 = sysexit_np(*v0);
  err(v1, "volume could not be mounted");
}

void sub_1000032BC(uint64_t a1)
{
}

void sub_1000032DC()
{
}

void sub_1000032F4(uint64_t a1)
{
}

void sub_100003314(uint64_t a1)
{
  else {
    int v1 = "unexpected argument";
  }
  sub_100002DA0(a1, v1);
}

void sub_100003338()
{
}

void sub_100003364()
{
}

void sub_100003390(uint64_t a1)
{
}

void sub_1000033B8(uint64_t a1)
{
}

void sub_1000033E0()
{
}

void sub_1000033F8()
{
}