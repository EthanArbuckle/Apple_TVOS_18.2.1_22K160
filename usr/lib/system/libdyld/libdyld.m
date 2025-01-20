BOOL mach_o::hasWarningHandler(mach_o *this)
{
  return mach_o::sHandler != 0LL;
}

uint64_t mach_o::warning(uint64_t this, const void *a2, const char *a3, ...)
{
  if (mach_o::sHandler) {
    return mach_o::sHandler(this, a2, (uint64_t *)va);
  }
  return this;
}

cpu_type_t *mach_o::Architecture::Architecture(cpu_type_t *this, const mach_header *a2)
{
  cpu_type_t cputype = a2->cputype;
  cpu_subtype_t cpusubtype = a2->cpusubtype;
  uint32_t magic = a2->magic;
  *this = cputype;
  this[1] = cpusubtype;
  if ((magic | 0x1000000) == 0xCFFAEDFE)
  {
    *this = bswap32(cputype);
    this[1] = bswap32(cpusubtype);
  }

  return this;
}

const char *mach_o::Architecture::name(mach_o::Architecture *this)
{
  int v1 = *(_DWORD *)this;
  if (*(int *)this <= 16777222)
  {
    if (v1 == 7)
    {
      if ((*((_DWORD *)this + 1) & 0xFFFFFF) == 3) {
        return "i386";
      }
    }

    else if (v1 == 12)
    {
      uint64_t v5 = (*((_DWORD *)this + 1) & 0xFFFFFF) - 9LL;
    }

    else if (v1 == 18 && (*((_DWORD *)this + 1) & 0xFFFFFF) == 0)
    {
      return "ppc";
    }

    return "unknown";
  }

  if (v1 == 33554444)
  {
    if ((*((_DWORD *)this + 1) & 0xFFFFFE) == 0) {
      return "arm64_32";
    }
    return "unknown";
  }

  if (v1 == 16777228)
  {
    int v6 = *((_DWORD *)this + 1);
    if (v6 == -2147483646) {
      return "arm64e";
    }
    if (!v6) {
      return "arm64";
    }
    if ((v6 & 0xFFFFFF) != 2)
    {
      if ((v6 & 0xFFFFFF) != 1 || v6 != 1) {
        return "unknown";
      }
      return "arm64";
    }

    switch(v6)
    {
      case -2130706430:
        return "arm64e.v1";
      case -1073741822:
        return "arm64e.kernel";
      case 2:
        return "arm64e.old";
    }

    return "unknown";
  }

  if (v1 != 16777223) {
    return "unknown";
  }
  int v3 = *((_DWORD *)this + 1) & 0xFFFFFF;
  v4 = "unknown";
  if (v3 == 8) {
    v4 = "x86_64h";
  }
  if (v3 == 3) {
    return "x86_64";
  }
  else {
    return v4;
  }
}

void *mach_o::Platform::Platform(void *this, int a2)
{
  uint64_t v2 = 0LL;
  *this = 0LL;
  while (1)
  {
    int v3 = mach_o::PlatformInfo::knownPlatformInfos[v2];
    int v4 = *((_DWORD *)v3 + 2);
    if (!v4) {
      mach_o::Platform::Platform();
    }
    if (v4 == a2) {
      break;
    }
    if (++v2 == 31) {
      return this;
    }
  }

  *this = v3;
  return this;
}

mach_o::Error *mach_o::Platform::valid@<X0>(mach_o::Error *this@<X0>, mach_o::Error *a2@<X8>)
{
  if (!*(void *)this) {
    return mach_o::Error::Error(a2, "unknown platform");
  }
  *(void *)a2 = 0LL;
  return this;
}

BOOL mach_o::Platform::isExclaveKit(mach_o::Platform *this)
{
  return *(void *)this && *(_BYTE *)(*(void *)this + 50LL) != 0;
}

uint64_t mach_o::Platform::epoch(uint64_t *a1, unsigned int a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = 5LL;
  if (v2)
  {
    (*(void (**)(uint64_t, void, unsigned __int16 *, char *))(*(void *)v2 + 8LL))(v2, a2, &v7, &v6);
    if (v6) {
      int v4 = 0;
    }
    else {
      int v4 = 5;
    }
    return v4 + 10 * v7;
  }

  return v3;
}

void mach_o::PlatformAndVersions::zip(uint64_t *a1@<X0>, uint64_t *a2@<X1>, mach_o::Error *a3@<X8>)
{
  if (!*a1)
  {
    *a1 = *a2;
LABEL_11:
    __int128 v8 = *(_OWORD *)(a2 + 1);
LABEL_12:
    *(_OWORD *)(a1 + 1) = v8;
LABEL_13:
    *(void *)a3 = 0LL;
    return;
  }

  if (*a2)
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    mach_o::Error::Error((mach_o::Error *)&v12, "unknown platform");
    if (v12)
    {
      mach_o::Error::Error(a3, "can't zip with invalid platform");
      mach_o::Error::~Error((mach_o::Error *)&v12);
      return;
    }
  }

  mach_o::Error::~Error((mach_o::Error *)&v12);
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  if (*a1 == *a2) {
    goto LABEL_11;
  }
  if ((_UNKNOWN **)v6 == &mach_o::PlatformInfo_macOS::singleton)
  {
    if ((_UNKNOWN **)v7 == &mach_o::PlatformInfo_macCatalyst::singleton)
    {
      *a1 = (uint64_t)&mach_o::PlatformInfo_zippered::singleton;
      goto LABEL_18;
    }

    goto LABEL_22;
  }

  if ((_UNKNOWN **)v7 != &mach_o::PlatformInfo_macOS::singleton)
  {
    if ((_UNKNOWN **)v6 == &mach_o::PlatformInfo_zippered::singleton)
    {
      if ((_UNKNOWN **)v7 == &mach_o::PlatformInfo_macCatalyst::singleton)
      {
        *a1 = (uint64_t)&mach_o::PlatformInfo_zippered::singleton;
LABEL_18:
        a1[2] = a2[1];
        goto LABEL_13;
      }

      goto LABEL_22;
    }

    goto LABEL_21;
  }

  if ((_UNKNOWN **)v6 == &mach_o::PlatformInfo_macCatalyst::singleton)
  {
    __int128 v8 = *(_OWORD *)(a2 + 1);
    uint64_t v11 = a1[1];
    *a1 = (uint64_t)&mach_o::PlatformInfo_zippered::singleton;
LABEL_30:
    *((void *)&v8 + 1) = v11;
    goto LABEL_12;
  }

  if ((_UNKNOWN **)v6 == &mach_o::PlatformInfo_zippered::singleton)
  {
    __int128 v8 = *(_OWORD *)(a2 + 1);
    uint64_t v11 = a1[2];
    *a1 = (uint64_t)&mach_o::PlatformInfo_zippered::singleton;
    goto LABEL_30;
  }

LABEL_21:
  if (!v6)
  {
    v9 = "unknown";
    if (v7) {
      goto LABEL_23;
    }
LABEL_25:
    v10 = "unknown";
    goto LABEL_26;
  }

    Diagnostics::error(a2, "fat header malformed, architecture slices extend beyond end of file");
    return;
  }

  if (*(_DWORD *)this != -1095041334)
  {
    Diagnostics::error(a2, "not a fat file");
    return;
  }

  __int128 v8 = *((_DWORD *)this + 1);
  v9 = bswap32(v8);
  if (v9 >= 0xCD)
  {
    Diagnostics::error(a2, "fat header too large: %u entries", v9);
    return;
  }

  v40 = 0;
  if (!v8) {
    goto LABEL_34;
  }
  v33 = v8;
  uint64_t v12 = 0LL;
  v13 = (unsigned int *)((char *)this + 20);
  while (1)
  {
    v14 = bswap32(*(v13 - 3));
    v15 = bswap32(*(v13 - 2));
    v16 = bswap32(*(v13 - 1));
    v17 = bswap32(*v13);
    Diagnostics::Diagnostics((Diagnostics *)v39);
    if (!a4 || dyld3::FatFile::isValidSlice(this, (Diagnostics *)v39, a3, v12, v14, v15, v16, v17)) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, char *, unint64_t, char *))(a5 + 16))( a5,  v14,  v15,  (char *)this + v16,  v17,  &v40);
    }
    if (v40) {
      break;
    }
    if (Diagnostics::hasError((Diagnostics *)v39))
    {
      v18 = Diagnostics::errorMessageCStr((Diagnostics *)v39);
      Diagnostics::appendError(a2, "%s, ", v18);
    }

    v13 += 5;
    mach_o::Error::~Error((mach_o::Error *)v39);
    if (v9 == ++v12) {
      goto LABEL_33;
    }
  }

  mach_o::Error::~Error((mach_o::Error *)v39);
LABEL_33:
  if (v33 != -872415232)
  {
LABEL_34:
    v27 = (char *)this + 8;
    v28 = (_DWORD *)((char *)this + 20 * v9 + 8);
    v29 = bswap32(v28[1]);
    if (*v28 == 201326593 && v29 <= 1)
    {
      v31 = bswap32(*(_DWORD *)&v27[20 * v9 + 12]);
      v32 = bswap32(*(_DWORD *)&v27[20 * v9 + 8]);
      if (!a4 || dyld3::FatFile::isValidSlice(this, a2, a3, v9, 16777228, v29, v32, v31)) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, char *, unint64_t, char *))(a5 + 16))( a5,  16777228LL,  v29,  (char *)this + v32,  v31,  &v40);
      }
    }
  }

LABEL_22:
  v9 = *(const char **)(v6 + 16);
  if (!v7) {
    goto LABEL_25;
  }
LABEL_23:
  v10 = *(const char **)(v7 + 16);
LABEL_26:
  mach_o::Error::Error(a3, "incompatible platforms: %s - %s", v9, v10);
}

uint64_t mach_o::PlatformAndVersions::unzip(void *a1, uint64_t a2)
{
  if ((_UNKNOWN **)*a1 == &mach_o::PlatformInfo_zippered::singleton)
  {
    v7[0] = &mach_o::PlatformInfo_macOS::singleton;
    v7[1] = a1[1];
    v7[2] = 0x1000000010000LL;
    (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v7);
    v6[0] = &mach_o::PlatformInfo_macCatalyst::singleton;
    v6[1] = a1[2];
    v6[2] = 0x1000000010000LL;
    uint64_t v3 = (_UNKNOWN ***)v6;
  }

  else
  {
    __int128 v8 = (_UNKNOWN **)*a1;
    __int128 v9 = *(_OWORD *)(a1 + 1);
    uint64_t v3 = &v8;
  }

  return (*(uint64_t (**)(uint64_t, _UNKNOWN ***))(a2 + 16))(a2, v3);
}

uint64_t mach_o::PlatformInfo_macOS::versionForYear( mach_o::PlatformInfo_macOS *this, unsigned int a2, int a3)
{
  if (a2 == 2020) {
    char v3 = a3;
  }
  else {
    char v3 = 1;
  }
  if (a2 <= 0x7E4 && (v3 & 1) != 0)
  {
    if (a3) {
      int v4 = 655364;
    }
    else {
      int v4 = 655360;
    }
    return ((((_WORD)a2 - (_WORD)a3) << 8) + 11264) & 0xFF00 | v4;
  }

  else
  {
    unsigned int v6 = a2 - *((unsigned __int16 *)this + 27);
    if (a3) {
      int v7 = (*(unsigned __int8 (**)(mach_o::PlatformInfo_macOS *, void))(*(void *)this + 16LL))( this,  (unsigned __int16)--v6) << 8;
    }
    else {
      int v7 = 0;
    }
    return v7 | (v6 << 16);
  }
}

_WORD *mach_o::PlatformInfo_macOS::yearForVersion(_WORD *result, unsigned int a2, _WORD *a3, BOOL *a4)
{
  if (a2 < 0xB0000)
  {
    unsigned int v8 = (a2 + 16121856) >> 8;
    *a3 = v8 + 2004;
    *a4 = (a2 & 0xFC) != 0;
    if ((a2 & 0xFC) == 0) {
      return result;
    }
    __int16 v7 = v8 + 2003;
  }

  else
  {
    *a3 = result[27] + HIWORD(a2);
    unsigned int v6 = BYTE1(a2);
    result = (_WORD *)(*(uint64_t (**)(_WORD *, void))(*(void *)result + 16LL))(result, HIWORD(a2));
    *a4 = v6 >= result;
    __int16 v7 = *a3 + 1;
  }

  *a3 = v7;
  return result;
}

uint64_t mach_o::PlatformInfo_macOS::minorVersionForSpring(mach_o::PlatformInfo_macOS *this, unsigned int a2)
{
  if (a2 < 0xE) {
    return 3LL;
  }
  else {
    return 4LL;
  }
}

uint64_t mach_o::PlatformInfo::versionForYear(mach_o::PlatformInfo *this, int a2, int a3)
{
  int v3 = a2 - *((unsigned __int16 *)this + 27);
  if (a3) {
    int v4 = (*(unsigned __int8 (**)(mach_o::PlatformInfo *, void))(*(void *)this + 16LL))( this,  (unsigned __int16)--v3) << 8;
  }
  else {
    int v4 = 0;
  }
  return v4 | (v3 << 16);
}

uint64_t mach_o::PlatformInfo::yearForVersion(_WORD *a1, int a2, _WORD *a3, BOOL *a4)
{
  *a3 = a1[27] + HIWORD(a2);
  unsigned int v6 = BYTE1(a2);
  uint64_t result = (*(uint64_t (**)(_WORD *, void))(*(void *)a1 + 16LL))(a1, HIWORD(a2));
  *a4 = v6 >= result;
  return result;
}

uint64_t mach_o::PlatformInfo::minorVersionForSpring(mach_o::PlatformInfo *this)
{
  return 4LL;
}

uint64_t mach_o::PlatformInfo_bridgeOS::minorVersionForSpring( mach_o::PlatformInfo_bridgeOS *this, unsigned int a2)
{
  if (a2 < 9) {
    return 3LL;
  }
  else {
    return 4LL;
  }
}

uint64_t mach_o::PlatformInfo_firmware::versionForYear(mach_o::PlatformInfo_firmware *this)
{
  return 0x10000LL;
}

void mach_o::PlatformInfo_firmware::yearForVersion(uint64_t a1, uint64_t a2, _WORD *a3, _BYTE *a4)
{
  *a3 = 2020;
  *a4 = 0;
}

uint64_t mach_o::PlatformInfo_sepOS::versionForYear(mach_o::PlatformInfo_sepOS *this)
{
  return 0x10000LL;
}

void mach_o::PlatformInfo_sepOS::yearForVersion(uint64_t a1, uint64_t a2, _WORD *a3, _BYTE *a4)
{
  *a3 = 2020;
  *a4 = 0;
}

uint64_t mach_o::PlatformInfo_visionOS::minorVersionForSpring(mach_o::PlatformInfo_visionOS *this, int a2)
{
  if (a2 == 1) {
    return 1LL;
  }
  else {
    return 4LL;
  }
}

void *mach_o::FunctionStarts::FunctionStarts(void *this, const unsigned __int8 *a2, uint64_t a3)
{
  *this = a2;
  this[1] = &a2[a3];
  return this;
}

double mach_o::CompactUnwind::CompactUnwind(void *a1, double *a2, uint64_t a3, uint64_t a4)
{
  double result = *a2;
  *a1 = *(void *)a2;
  a1[1] = a3;
  a1[2] = a4;
  return result;
}

uint64_t mach_o::Policy::Policy(uint64_t a1, void *a2, uint64_t a3, int a4, char a5, char a6)
{
  *(_DWORD *)a1 = mach_o::Platform::epoch((uint64_t *)a3, *(_DWORD *)(a3 + 8));
  *(_DWORD *)(a1 + 4) = mach_o::Platform::epoch((uint64_t *)a3, *(_DWORD *)(a3 + 12));
  *(void *)(a1 + 8) = *a2;
  *(void *)(a1 + 16) = *(void *)a3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a3 + 8);
  *(_DWORD *)(a1 + 40) = a4;
  *(_BYTE *)(a1 + 44) = a5;
  *(_BYTE *)(a1 + 45) = a6;
  return a1;
}

BOOL mach_o::Policy::enforceReadOnlyLinkedit(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4EBBu;
}

BOOL mach_o::Policy::enforceLinkeditContentAlignment(mach_o::Policy *this)
{
  return *((_DWORD *)this + 10) != 1 && *((_DWORD *)this + 1) >= 0x4ED9u;
}

BOOL mach_o::Policy::enforceOneFixupEncoding(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4ED9u;
}

BOOL mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4EE3u;
}

BOOL mach_o::Policy::enforceSectionsInSegment(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4EEDu;
}

BOOL mach_o::Policy::enforceHasLinkedDylibs(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4EF7u;
}

BOOL mach_o::Policy::enforceHasUUID(mach_o::Policy *this)
{
  return *((_DWORD *)this + 10) != 1 && *((_DWORD *)this + 1) >= 0x4EF7u;
}

BOOL mach_o::Policy::enforceNoDuplicateDylibs(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4F15u;
}

BOOL mach_o::Policy::enforceDataSegmentPermissions(mach_o::Policy *this)
{
  return !*((_BYTE *)this + 44) && *((_DWORD *)this + 1) >= 0x4F0Bu;
}

uint64_t mach_o::RebaseOpcodes::RebaseOpcodes(uint64_t this, const unsigned __int8 *a2, uint64_t a3, int a4)
{
  *(void *)this = a2;
  *(void *)(this + 8) = &a2[a3];
  if (a4) {
    int v4 = 8;
  }
  else {
    int v4 = 4;
  }
  *(_DWORD *)(this + 16) = v4;
  return this;
}

void mach_o::RebaseOpcodes::valid( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, BOOL *a4@<X3>, char a5@<W4>, void *a6@<X8>)
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3002000000LL;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  uint64_t v17 = 0LL;
  v8[0] = MEMORY[0x1895FED80];
  v8[1] = 0x40000000LL;
  v8[2] = ___ZNK6mach_o13RebaseOpcodes5validENSt3__14spanIKNS_13MappedSegmentELm18446744073709551615EEEbb_block_invoke;
  v8[3] = &unk_18962F1A8;
  v8[4] = &v12;
  v8[5] = a1;
  v8[6] = a2;
  v8[7] = a3;
  char v9 = a5;
  char v10 = (char)a4;
  mach_o::RebaseOpcodes::forEachRebase(a1, (uint64_t)v8, a4, (mach_o::Error *)&v11);
  if (v11) {
    __int16 v7 = &v11;
  }
  else {
    __int16 v7 = v13 + 5;
  }
  mach_o::Error::Error(a6, v7);
  mach_o::Error::~Error((mach_o::Error *)&v11);
  _Block_object_dispose(&v12, 8);
  mach_o::Error::~Error((mach_o::Error *)&v17);
}

void *__Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t mach_o::RebaseOpcodes::forEachRebase@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, BOOL *a3@<X3>, mach_o::Error *a4@<X8>)
{
  uint64_t v5 = result;
  uint64_t v6 = 0LL;
  unsigned __int8 v7 = 0;
  uint64_t v8 = 0LL;
  char v9 = 0;
  v31 = *(const unsigned __int8 ***)result;
  *(_WORD *)v30 = 0;
  while (2)
  {
    char v10 = *(const unsigned __int8 ***)(v5 + 8);
    if (v31 >= v10)
    {
LABEL_45:
      *(void *)a4 = 0LL;
    }

    else
    {
      unsigned __int8 v12 = *(_BYTE *)v31;
      uint64_t v11 = (char *)v31 + 1;
      v31 = (const unsigned __int8 **)((char *)v31 + 1);
      unsigned int v13 = v12 & 0xF;
      switch(v12 >> 4)
      {
        case 0:
          return (uint64_t)mach_o::Error::Error(a4, "rebase opcodes terminated early at offset %d of %d");
        case 1:
          if (v13 - 1 >= 3) {
            uint64_t v6 = 0LL;
          }
          else {
            uint64_t v6 = v13;
          }
          goto LABEL_37;
        case 2:
          double result = mach_o::read_uleb128(&v31, v10, v30, a3);
          uint64_t v8 = result;
          char v9 = 1;
          unsigned __int8 v7 = v13;
          goto LABEL_37;
        case 3:
          double result = mach_o::read_uleb128(&v31, v10, v30, a3);
          v8 += result;
          goto LABEL_37;
        case 4:
          v8 += *(_DWORD *)(v5 + 16) * v13;
          goto LABEL_37;
        case 5:
          if (v13)
          {
            unsigned int v14 = 1;
            do
            {
              double result = (*(uint64_t (**)(uint64_t, const char *, uint64_t, void, void, uint64_t, unsigned __int8 *))(a2 + 16))( a2,  "REBASE_OPCODE_DO_REBASE_IMM_TIMES",  v6,  v9 & 1,  v7,  v8,  &v30[1]);
              v8 += *(unsigned int *)(v5 + 16);
              if (v30[1]) {
                BOOL v15 = 1;
              }
              else {
                BOOL v15 = v14 >= v13;
              }
              ++v14;
            }

            while (!v15);
          }

          goto LABEL_37;
        case 6:
          double result = mach_o::read_uleb128(&v31, v10, v30, a3);
          if (v30[0]) {
            goto LABEL_43;
          }
          unint64_t v16 = result;
          if (!result) {
            goto LABEL_41;
          }
          unsigned int v17 = 1;
          do
          {
            double result = (*(uint64_t (**)(uint64_t, const char *, uint64_t, void, void, uint64_t, unsigned __int8 *))(a2 + 16))( a2,  "REBASE_OPCODE_DO_REBASE_ADD_ADDR_ULEB",  v6,  v9 & 1,  v7,  v8,  &v30[1]);
            v8 += *(unsigned int *)(v5 + 16);
            unint64_t v18 = v17++;
            if (v30[1]) {
              BOOL v19 = 0;
            }
            else {
              BOOL v19 = v16 > v18;
            }
          }

          while (v19);
          goto LABEL_37;
        case 7:
          (*(void (**)(uint64_t, const char *, uint64_t, void, void, uint64_t, unsigned __int8 *))(a2 + 16))( a2,  "REBASE_OPCODE_DO_REBASE_ADD_ADDR_ULEB",  v6,  v9 & 1,  v7,  v8,  &v30[1]);
          double result = mach_o::read_uleb128(&v31, *(const unsigned __int8 ***)(v5 + 8), v30, v20);
          v8 += result + *(unsigned int *)(v5 + 16);
          goto LABEL_37;
        case 8:
          uint64_t v21 = mach_o::read_uleb128(&v31, v10, v30, a3);
          if (v30[0]) {
            goto LABEL_43;
          }
          unint64_t v23 = v21;
          double result = mach_o::read_uleb128(&v31, *(const unsigned __int8 ***)(v5 + 8), v30, v22);
          if (v30[0]) {
            goto LABEL_43;
          }
          if (v23)
          {
            uint64_t v24 = result;
            unsigned int v25 = 1;
            do
            {
              double result = (*(uint64_t (**)(uint64_t, const char *, uint64_t, void, void, uint64_t, unsigned __int8 *))(a2 + 16))( a2,  "REBASE_OPCODE_DO_REBASE_ULEB_TIMES_SKIPPING_ULEB",  v6,  v9 & 1,  v7,  v8,  &v30[1]);
              v8 += v24 + *(unsigned int *)(v5 + 16);
              unint64_t v26 = v25++;
              if (v30[1]) {
                BOOL v27 = 0;
              }
              else {
                BOOL v27 = v23 > v26;
              }
            }

            while (v27);
LABEL_37:
            int v28 = v30[0];
          }

          else
          {
LABEL_41:
            int v28 = 0;
          }

          if (!v30[1] && !v28) {
            continue;
          }
          if (!v28) {
            goto LABEL_45;
          }
LABEL_43:
          double result = (uint64_t)mach_o::Error::Error(a4, "malformed uleb128");
          break;
        default:
          return (uint64_t)mach_o::Error::Error(a4, "unknown rebase opcode 0x%02X");
      }
    }

    return result;
  }

void ___ZNK6mach_o13RebaseOpcodes5validENSt3__14spanIKNS_13MappedSegmentELm18446744073709551615EEEbb_block_invoke( uint64_t a1, uint64_t a2, int a3, char a4, unsigned int a5, unint64_t a6, _BYTE *a7)
{
  if ((a4 & 1) == 0)
  {
    mach_o::Error::Error((mach_o::Error *)&v10, "%s missing preceding REBASE_OPCODE_SET_SEGMENT_AND_OFFSET_ULEB");
    goto LABEL_7;
  }

  if (*(void *)(a1 + 56) <= (unint64_t)a5)
  {
    mach_o::Error::Error((mach_o::Error *)&v10, "%s segment index %d too large");
    goto LABEL_7;
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (*(void *)(v9 + 56LL * a5 + 8) - (unint64_t)*(unsigned int *)(*(void *)(a1 + 40) + 16LL) < a6)
  {
    mach_o::Error::Error((mach_o::Error *)&v10, "%s segment offset 0x%08llX beyond segment '%.*s' size (0x%08llX)");
LABEL_7:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), &v10);
    mach_o::Error::~Error((mach_o::Error *)&v10);
    *a7 = 1;
    return;
  }

  if ((a3 - 2) >= 2)
  {
    if (a3 != 1)
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s unknown rebase type");
      goto LABEL_7;
    }

    if (!*(_BYTE *)(v9 + 56LL * a5 + 49) && *(_BYTE *)(a1 + 64))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s pointer rebase is in non-writable segment '%.*s'");
      goto LABEL_7;
    }

    if (*(_BYTE *)(v9 + 56LL * a5 + 50) && *(_BYTE *)(a1 + 64))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s pointer rebase is in executable segment '%.*s'");
      goto LABEL_7;
    }
  }

  else
  {
    if (!*(_BYTE *)(a1 + 65))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s text rebase not supported for architecture");
      goto LABEL_7;
    }

    if (*(_BYTE *)(v9 + 56LL * a5 + 49))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s text rebase is in writable segment '%.*s'");
      goto LABEL_7;
    }

    if (!*(_BYTE *)(v9 + 56LL * a5 + 50))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s text rebase is in non-executable segment '%.*s'");
      goto LABEL_7;
    }
  }

uint64_t mach_o::read_uleb128( const unsigned __int8 ***this, const unsigned __int8 **a2, unsigned __int8 *a3, BOOL *a4)
{
  unint64_t v5 = 0LL;
  uint64_t result = 0LL;
  *a3 = 0;
  for (i = *this; i != a2 && v5 <= 0x3F; i = (const unsigned __int8 **)((char *)i + 1))
  {
    result |= (unint64_t)(*(_BYTE *)i & 0x7F) << v5;
    v5 += 7LL;
    *this = (const unsigned __int8 **)((char *)i + 1);
    int v8 = *(char *)i;
    if ((v8 & 0x80000000) == 0) {
      return result;
    }
  }

  *a3 = 1;
  return result;
}

uint64_t mach_o::read_sleb128( const unsigned __int8 ***this, const unsigned __int8 **a2, unsigned __int8 *a3, BOOL *a4)
{
  *a3 = 0;
  int v4 = *this;
  if (*this == a2)
  {
    uint64_t v6 = 0LL;
    int v7 = 0;
    unsigned int v9 = 0;
LABEL_7:
    *a3 = 1;
  }

  else
  {
    int v5 = 0;
    uint64_t v6 = 0LL;
    int v7 = -7 * (_DWORD)v4 - (_DWORD)a2 + 8 * (_DWORD)a2;
    while (1)
    {
      int v8 = (const unsigned __int8 **)((char *)v4 + 1);
      *this = (const unsigned __int8 **)((char *)v4 + 1);
      unsigned int v9 = *(unsigned __int8 *)v4;
      v6 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        break;
      }
      v5 += 7;
      int v4 = (const unsigned __int8 **)((char *)v4 + 1);
      if (v8 == a2) {
        goto LABEL_7;
      }
    }

    int v7 = v5 + 7;
  }

  BOOL v10 = v7 < 64;
  uint64_t v11 = -1LL << v7;
  if ((v10 & (v9 >> 6)) == 0) {
    uint64_t v11 = 0LL;
  }
  return v11 | v6;
}

void *mach_o::Error::Error(void *result, void *a2)
{
  *uint64_t result = 0LL;
  *uint64_t result = *a2;
  *a2 = 0LL;
  return result;
}

void *mach_o::Error::operator=(void *result, void *a2)
{
  *uint64_t result = *a2;
  *a2 = 0LL;
  return result;
}

mach_o::Error *mach_o::Error::Error(mach_o::Error *this, const char *a2, ...)
{
  *(void *)this = 0LL;
  *(void *)this = _simple_salloc();
  _simple_vsprintf();
  return this;
}

void mach_o::Error::~Error(mach_o::Error *this)
{
  if (*(void *)this) {
    _simple_sfree();
  }
  *(void *)this = 0LL;
}

char *mach_o::LinkedDylibAttributes::toString(char *this, char *__dst)
{
  int v3 = this;
  *__dst = 0;
  char v4 = *this;
  if ((*this & 1) != 0)
  {
    strcpy(__dst, "weak-link");
    char v4 = *this;
    if ((*this & 4) == 0) {
      goto LABEL_7;
    }
    strlcat(__dst, ",", 0x40uLL);
    goto LABEL_6;
  }

  if ((*this & 4) != 0)
  {
LABEL_6:
    this = (char *)strlcat(__dst, "upward", 0x40uLL);
    char v4 = *v3;
  }

LABEL_7:
  if ((v4 & 8) != 0)
  {
    if (*__dst) {
      strlcat(__dst, ",", 0x40uLL);
    }
    this = (char *)strlcat(__dst, "delay-init", 0x40uLL);
    char v4 = *v3;
  }

  if ((v4 & 2) != 0)
  {
    if (*__dst) {
      strlcat(__dst, ",", 0x40uLL);
    }
    return (char *)strlcat(__dst, "re-export", 0x40uLL);
  }

  return this;
}

  unint64_t v18 = lsl::readPVLEUInt64((unsigned __int8 **)&v58);
  int v3 = 1LL;
  if (v18)
  {
    BOOL v19 = v18;
    v20 = 0LL;
    uint64_t v21 = 0LL;
    while (1)
    {
      v75 = 0uLL;
      memset(v71, 0, sizeof(v71));
      v72 = 0x1FFFFFFFFLL;
      v73 = 0;
      v74 = 1;
      if (!dyld4::Atlas::ProcessSnapshot::Serializer::readMappedFileInfo( a1,  (unsigned __int8 **)&v58,  (uint64_t *)&v56,  &v75,  (dyld4::FileRecord *)v71)) {
        break;
      }
      v22 = 14;
      if ((*(void *)(a1 + 216) & 4LL) == 0) {
        v22 = 12;
      }
      uint64_t v21 = (lsl::Allocator *)((char *)v21 + ((void)v56 << v22));
      v56 = v21;
      if (*(_BYTE *)(*(void *)a1 + 104LL))
      {
        unint64_t v23 = *(unsigned int **)(*(void *)a1 + 72LL);
        if (v23)
        {
          do
            uint64_t v24 = __ldxr(v23);
          while (__stxr(v24 + 1, v23));
        }
      }

      else
      {
        unint64_t v23 = 0LL;
      }

      *(void *)&v61[0] = *(void *)(a1 + 8);
      unsigned int v25 = (lsl::Allocator *)dyld4::FileRecord::FileRecord((uint64_t)v61 + 8, (dyld4::FileRecord *)v71);
      v65 = (lsl::Allocator *)v23;
      if (v23)
      {
        do
          unint64_t v26 = __ldxr(v23);
        while (__stxr(v26 + 1, v23));
      }

      v66 = v75;
      memset(v67, 0, 25);
      v67[32] = 0;
      v67[40] = 0;
      v68 = v21;
      v69 = 0LL;
      v70[0] = 0LL;
      *(_DWORD *)((char *)v70 + 7) = 0;
      BOOL v27 = *(void *)(a1 + 24);
      int v28 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v25);
      lsl::Allocator::makeUnique<dyld4::Atlas::Image,dyld4::Atlas::Image>(v28, (dyld4::Atlas::Image *)v61, &v55);
      lsl::OrderedSet<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>>::insert( v27,  (uint64_t *)&v55,  (uint64_t)v60);
      lsl::UniquePtr<dyld4::Atlas::Image>::~UniquePtr(&v55);
      dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v67);
      if (v65) {
        lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v65, v29);
      }
      dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)((char *)v61 + 8));
      if (v23) {
        lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount((lsl::Allocator *)v23, v30);
      }
      dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v71);
      if (++v20 == v19) {
        return 1LL;
      }
    }

    v37 = (dyld4::FileRecord *)v71;
    goto LABEL_45;
  }

  return v3;
}

BOOL mach_o::Header::hasMachOMagic(mach_o::Header *this)
{
  return *(_DWORD *)this >> 1 == 2138504551;
}

BOOL mach_o::Header::is64(mach_o::Header *this)
{
  return *(_DWORD *)this == -17958193;
}

uint64_t mach_o::Header::pointerSize(mach_o::Header *this)
{
  if (*(_DWORD *)this == -17958193) {
    return 8LL;
  }
  else {
    return 4LL;
  }
}

BOOL mach_o::Header::isArch(mach_header *this, const char *a2)
{
  int v3 = mach_o::Architecture::name((mach_o::Architecture *)&v5);
  return strcmp(a2, v3) == 0;
}

cpu_type_t *mach_o::Header::arch@<X0>(mach_header *this@<X0>, cpu_type_t *a2@<X8>)
{
  return mach_o::Architecture::Architecture(a2, this);
}

uint64_t mach_o::Header::inDyldCache(mach_o::Header *this)
{
  return *((_DWORD *)this + 6) >> 31;
}

uint64_t mach_o::Header::isDyldManaged(mach_o::Header *this)
{
  unsigned int v1 = *((_DWORD *)this + 3);
  BOOL v2 = v1 > 8;
  int v3 = (1 << v1) & 0x144;
  if (v2 || v3 == 0) {
    return 0LL;
  }
  else {
    return (*((unsigned __int8 *)this + 24) >> 2) & 1;
  }
}

BOOL mach_o::Header::isObjectFile(mach_o::Header *this)
{
  return *((_DWORD *)this + 3) == 1;
}

BOOL mach_o::Header::isFileSet(mach_o::Header *this)
{
  return *((_DWORD *)this + 3) == 12;
}

BOOL mach_o::Header::isPreload(mach_o::Header *this)
{
  return *((_DWORD *)this + 3) == 5;
}

BOOL mach_o::Header::mayHaveTextFixups(mach_o::Header *this)
{
  int v1 = *((_DWORD *)this + 1);
  if (v1 == 7) {
    return 1LL;
  }
  return v1 == 16777223 && *((_DWORD *)this + 3) == 11;
}

void mach_o::Header::platformAndVersions(mach_o::Header *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v7 = 0LL;
  int v8 = &v7;
  uint64_t v9 = 0x4002000000LL;
  BOOL v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  mach_o::Platform::Platform((mach_o::Platform *)v12, 0);
  *(void *)&__int128 v4 = 0x1000000010000LL;
  *((void *)&v4 + 1) = 0x1000000010000LL;
  *(_OWORD *)&v12[8] = v4;
  v6[0] = MEMORY[0x1895FED80];
  v6[1] = 0x40000000LL;
  v6[2] = ___ZNK6mach_o6Header19platformAndVersionsEv_block_invoke;
  void v6[3] = &unk_18962F1D0;
  v6[4] = &v7;
  mach_o::Header::forEachPlatformLoadCommand(this, (uint64_t)v6);
  cpu_type_t v5 = v8;
  *(void *)a2 = v8[5];
  *(_OWORD *)(a2 + 8) = *((_OWORD *)v5 + 3);
  _Block_object_dispose(&v7, 8);
}

__n128 __Block_byref_object_copy__0(__n128 *a1, __n128 *a2)
{
  a1[2].n128_u64[1] = a2[2].n128_u64[1];
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void mach_o::Header::forEachPlatformLoadCommand(mach_o::Error *a1, uint64_t a2)
{
  v3[0] = 0LL;
  v3[1] = v3;
  v3[2] = 0x2000000000LL;
  char v4 = 0;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZNK6mach_o6Header26forEachPlatformLoadCommandEU13block_pointerFvNS_8PlatformENS_9Version32ES2_E_block_invoke;
  v2[3] = &unk_18962F360;
  v2[5] = v3;
  v2[6] = a1;
  v2[4] = a2;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v5);
  mach_o::Error::~Error((mach_o::Error *)v5);
  _Block_object_dispose(v3, 8);
}

void ___ZNK6mach_o6Header19platformAndVersionsEv_block_invoke(uint64_t a1, uint64_t *a2, int a3, int a4)
{
  char v4 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  uint64_t v5 = *a2;
  int v6 = a3;
  int v7 = a4;
  uint64_t v8 = 0x1000000010000LL;
  mach_o::PlatformAndVersions::zip(v4, &v5, (mach_o::Error *)&v9);
  if (v9) {
    ___ZNK6mach_o6Header19platformAndVersionsEv_block_invoke_cold_1();
  }
  mach_o::Error::~Error((mach_o::Error *)&v9);
}

void mach_o::Header::validSemanticsPlatform(mach_o::Header *this@<X0>, mach_o::Error *a2@<X8>)
{
  uint64_t v12 = 0LL;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x4002000000LL;
  BOOL v15 = __Block_byref_object_copy__0;
  unint64_t v16 = __Block_byref_object_dispose__0;
  mach_o::Platform::Platform((mach_o::Platform *)v17, 0);
  *(void *)&__int128 v4 = 0x1000000010000LL;
  *((void *)&v4 + 1) = 0x1000000010000LL;
  *(_OWORD *)&v17[8] = v4;
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x3002000000LL;
  uint64_t v9 = __Block_byref_object_copy__8;
  BOOL v10 = __Block_byref_object_dispose__9;
  uint64_t v11 = 0LL;
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = ___ZNK6mach_o6Header22validSemanticsPlatformEv_block_invoke;
  v5[3] = &unk_18962F1F8;
  v5[4] = &v6;
  v5[5] = &v12;
  mach_o::Header::forEachPlatformLoadCommand(this, (uint64_t)v5);
  if (v7[5])
  {
    mach_o::Error::Error(a2, v7 + 5);
  }

  else if (*((_DWORD *)this + 3) == 5)
  {
    *(void *)a2 = 0LL;
  }

  else
  {
    mach_o::Platform::valid((mach_o::Error *)(v13 + 5), a2);
  }

  _Block_object_dispose(&v6, 8);
  mach_o::Error::~Error((mach_o::Error *)&v11);
  _Block_object_dispose(&v12, 8);
}

void *__Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void ___ZNK6mach_o6Header22validSemanticsPlatformEv_block_invoke( uint64_t a1, mach_o::Platform *this, int a3, int a4)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
  {
    mach_o::Platform::valid(this, (mach_o::Error *)&v10);
    if (v10)
    {
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), &v10);
      uint64_t v8 = (mach_o::Error *)&v10;
    }

    else
    {
      mach_o::Error::~Error((mach_o::Error *)&v10);
      uint64_t v9 = (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      uint64_t v10 = *(void *)this;
      int v11 = a3;
      int v12 = a4;
      uint64_t v13 = 0x1000000010000LL;
      mach_o::PlatformAndVersions::zip(v9, &v10, (mach_o::Error *)&v14);
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), &v14);
      uint64_t v8 = (mach_o::Error *)&v14;
    }

    mach_o::Error::~Error(v8);
  }

void mach_o::Header::valid(mach_o::Header *this@<X0>, unint64_t a2@<X1>, mach_o::Error *a3@<X8>)
{
  if (a2 <= 0x1B)
  {
    mach_o::Error::Error(a3, "file is too short");
    return;
  }

  if (*(_DWORD *)this >> 1 != 2138504551)
  {
    mach_o::Error::Error(a3, "not a mach-o file (start is no MH_MAGIC[_64])");
    return;
  }

  mach_o::Header::validStructureLoadCommands(this, a2, a3);
  if (!*(void *)a3)
  {
    mach_o::Error::~Error(a3);
    mach_o::Header::validSemanticsPlatform(this, a3);
    if (!*(void *)a3)
    {
      mach_o::Error::~Error(a3);
      mach_o::Architecture::Architecture(&v7, (const mach_header *)this);
      mach_o::Header::platformAndVersions(this, (uint64_t)v6);
      mach_o::Policy::Policy(v8, &v7, v6, *((unsigned int *)this + 3), 0LL, 0LL);
      mach_o::Header::validSemanticsUUID(this, (const mach_o::Policy *)v8, a3);
      if (!*(void *)a3)
      {
        mach_o::Error::~Error(a3);
        mach_o::Header::validSemanticsInstallName(this, a3);
        if (!*(void *)a3)
        {
          mach_o::Error::~Error(a3);
          mach_o::Header::validSemanticsLinkedDylibs(this, (const mach_o::Policy *)v8, a3);
          if (!*(void *)a3)
          {
            mach_o::Error::~Error(a3);
            mach_o::Header::validSemanticsRPath(this, (const mach_o::Policy *)v8, a3);
            if (!*(void *)a3)
            {
              mach_o::Error::~Error(a3);
              mach_o::Header::validSemanticsSegments(this, (const mach_o::Policy *)v8, a2, a3);
              if (!*(void *)a3)
              {
                mach_o::Error::~Error(a3);
                mach_o::Header::validSemanticsLinkerOptions(this, a3);
                if (!*(void *)a3)
                {
                  mach_o::Error::~Error(a3);
                  if (*((_DWORD *)this + 3) == 2)
                  {
                    mach_o::Header::validSemanticsMain(this, (const mach_o::Policy *)v8, a3);
                    if (*(void *)a3) {
                      return;
                    }
                    mach_o::Error::~Error(a3);
                  }

                  *(void *)a3 = 0LL;
                }
              }
            }
          }
        }
      }
    }
  }

void mach_o::Header::validStructureLoadCommands( mach_o::Header *this@<X0>, unint64_t a2@<X1>, mach_o::Error *a3@<X8>)
{
  if (*(_DWORD *)this == -17958193) {
    int v4 = 32;
  }
  else {
    int v4 = 28;
  }
  if ((v4 + *((_DWORD *)this + 5)) <= a2)
  {
    unsigned int v5 = *((_DWORD *)this + 3);
    if (v5 > 0xC || ((1 << v5) & 0x1BE6) == 0)
    {
      mach_o::Error::Error(a3, "unknown filetype %d");
    }

    else
    {
      v14[0] = 0LL;
      v14[1] = v14;
      v14[2] = 0x2000000000LL;
      int v15 = 1;
      uint64_t v8 = 0LL;
      uint64_t v9 = &v8;
      uint64_t v10 = 0x3002000000LL;
      int v11 = __Block_byref_object_copy__8;
      int v12 = __Block_byref_object_dispose__9;
      uint64_t v13 = 0LL;
      v7[0] = MEMORY[0x1895FED80];
      v7[1] = 0x40000000LL;
      v7[2] = ___ZNK6mach_o6Header26validStructureLoadCommandsEy_block_invoke;
      void v7[3] = &unk_18962F220;
      v7[4] = &v8;
      v7[5] = v14;
      mach_o::Header::forEachLoadCommand(this, (uint64_t)v7, a3);
      if (!*(void *)a3)
      {
        mach_o::Error::~Error(a3);
        if (v9[5]) {
          mach_o::Error::Error(a3, v9 + 5);
        }
        else {
          *(void *)a3 = 0LL;
        }
      }

      _Block_object_dispose(&v8, 8);
      mach_o::Error::~Error((mach_o::Error *)&v13);
      _Block_object_dispose(v14, 8);
    }
  }

  else
  {
    mach_o::Error::Error(a3, "load commands length (%llu) exceeds length of file (%llu)");
  }

void mach_o::Header::validSemanticsUUID( mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  int v10 = 0;
  v6[0] = MEMORY[0x1895FED80];
  v6[1] = 0x40000000LL;
  v6[2] = ___ZNK6mach_o6Header18validSemanticsUUIDERKNS_6PolicyE_block_invoke;
  void v6[3] = &unk_18962F248;
  v6[4] = &v7;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v6, (mach_o::Error *)v11);
  mach_o::Error::~Error((mach_o::Error *)v11);
  unsigned int v5 = *((_DWORD *)v8 + 6);
  if (v5 < 2)
  {
    if (v5 || !mach_o::Policy::enforceHasUUID(a2)) {
      *(void *)a3 = 0LL;
    }
    else {
      mach_o::Error::Error(a3, "missing LC_UUID load command");
    }
  }

  else
  {
    mach_o::Error::Error(a3, "too many LC_UUID load commands");
  }

  _Block_object_dispose(&v7, 8);
}

void mach_o::Header::validSemanticsInstallName(mach_o::Header *this@<X0>, mach_o::Error *a2@<X8>)
{
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  uint64_t v14 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = (int *)&v7;
  uint64_t v9 = 0x2000000000LL;
  int v10 = 0;
  v6[0] = MEMORY[0x1895FED80];
  v6[1] = 0x40000000LL;
  v6[2] = ___ZNK6mach_o6Header25validSemanticsInstallNameERKNS_6PolicyE_block_invoke;
  void v6[3] = &unk_18962F270;
  v6[4] = &v11;
  void v6[5] = &v7;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v6, (mach_o::Error *)v15);
  mach_o::Error::~Error((mach_o::Error *)v15);
  if (v8[6] < 2)
  {
    int v5 = *((_DWORD *)this + 3);
    if (v5 == 9 || v5 == 6)
    {
      if (!v12[3])
      {
        mach_o::Error::Error(a2, "MH_DYLIB is missing LC_ID_DYLIB");
        goto LABEL_10;
      }
    }

    else if (v12[3])
    {
      mach_o::Error::Error(a2, "found LC_ID_DYLIB found in non-MH_DYLIB");
      goto LABEL_10;
    }

    *(void *)a2 = 0LL;
    goto LABEL_10;
  }

  mach_o::Error::Error(a2, "multiple LC_ID_DYLIB found");
LABEL_10:
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

void mach_o::Header::validSemanticsLinkedDylibs( mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v31 = *MEMORY[0x1895FEE08];
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3002000000LL;
  uint64_t v24 = __Block_byref_object_copy__8;
  unsigned int v25 = __Block_byref_object_dispose__9;
  uint64_t v26 = 0LL;
  uint64_t v17 = 0LL;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  int v20 = 0;
  BOOL v6 = mach_o::Policy::enforceNoDuplicateDylibs(a2);
  BOOL v7 = v6;
  BOOL hasWarningHandler = mach_o::hasWarningHandler((mach_o *)v6);
  v14[0] = MEMORY[0x1895FED80];
  v14[1] = 0x40000000LL;
  v14[2] = ___ZNK6mach_o6Header26validSemanticsLinkedDylibsERKNS_6PolicyE_block_invoke;
  void v14[3] = &unk_18962F298;
  BOOL v15 = v7;
  BOOL v16 = hasWarningHandler;
  v14[6] = this;
  v14[7] = &v30;
  v14[4] = &v17;
  v14[5] = &v21;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v14, (mach_o::Error *)v29);
  mach_o::Error::~Error((mach_o::Error *)v29);
  if (v22[5])
  {
    mach_o::Error::Error(a3, v22 + 5);
  }

  else
  {
    unsigned int v9 = *((_DWORD *)this + 3);
    if (v9 > 8
      || ((1 << v9) & 0x144) == 0
      || (*((_BYTE *)this + 24) & 4) == 0
      || !mach_o::Policy::enforceHasLinkedDylibs(a2)
      || *((_DWORD *)v18 + 6))
    {
      goto LABEL_8;
    }

    int v27 = 0x10000;
    int v28 = 0x10000;
    int v10 = (const char *)v29[0];
    if (!v29[0]) {
      goto LABEL_18;
    }
    mach_o::Header::platformAndVersions(this, (uint64_t)v29);
    if (v29[0] == 0x18962E9A8LL)
    {
      uint64_t v11 = "/System/DriverKit/usr/lib/system/";
      int v12 = v10;
      size_t v13 = 33LL;
    }

    else
    {
      mach_o::Header::platformAndVersions(this, (uint64_t)v29);
      if (mach_o::Platform::isExclaveKit((mach_o::Platform *)v29))
      {
        uint64_t v11 = "/System/ExclaveKit/usr/lib/system/";
        int v12 = v10;
        size_t v13 = 34LL;
      }

      else
      {
        uint64_t v11 = "/usr/lib/system/";
        int v12 = v10;
        size_t v13 = 16LL;
      }
    }

    if (!strncmp(v12, v11, v13)) {
LABEL_8:
    }
      *(void *)a3 = 0LL;
    else {
LABEL_18:
    }
      mach_o::Error::Error(a3, "missing LC_LOAD_DYLIB (must link with at least libSystem.dylib)");
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  mach_o::Error::~Error((mach_o::Error *)&v26);
}

void mach_o::Header::validSemanticsRPath( mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, void *a3@<X8>)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  BOOL v5 = mach_o::Policy::enforceNoDuplicateDylibs(a2);
  BOOL v6 = v5;
  if (v5 || mach_o::hasWarningHandler((mach_o *)v5))
  {
    uint64_t v11 = 0LL;
    int v12 = &v11;
    uint64_t v13 = 0x3002000000LL;
    uint64_t v14 = __Block_byref_object_copy__8;
    BOOL v15 = __Block_byref_object_dispose__9;
    uint64_t v16 = 0LL;
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x2000000000LL;
    int v10 = 0;
    v7[0] = MEMORY[0x1895FED80];
    v7[1] = 0x40000000LL;
    v7[2] = ___ZNK6mach_o6Header19validSemanticsRPathERKNS_6PolicyE_block_invoke;
    void v7[3] = &unk_18962F2C0;
    v7[5] = &v11;
    void v7[6] = &v17;
    BOOL v8 = v6;
    v7[4] = v9;
    mach_o::Header::forEachRPath(this, (uint64_t)v7);
    mach_o::Error::Error(a3, v12 + 5);
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(&v11, 8);
    mach_o::Error::~Error((mach_o::Error *)&v16);
  }

  else
  {
    *a3 = 0LL;
  }

void mach_o::Header::validSemanticsSegments( mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, uint64_t a3@<X2>, mach_o::Error *a4@<X8>)
{
  uint64_t v55 = *MEMORY[0x1895FEE08];
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x5002000000LL;
  v46 = __Block_byref_object_copy__51;
  v47 = __Block_byref_object_dispose__52;
  v48 = &v54;
  uint64_t v49 = 12LL;
  uint64_t v51 = 0LL;
  uint64_t v52 = 0LL;
  uint64_t v50 = 0LL;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3002000000LL;
  v40 = __Block_byref_object_copy__8;
  v41 = __Block_byref_object_dispose__9;
  uint64_t v42 = 0LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  char v36 = 0;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2000000000LL;
  char v32 = 0;
  uint64_t v27 = 0LL;
  int v28 = &v27;
  uint64_t v29 = 0x2000000000LL;
  uint64_t v30 = 0LL;
  v26[0] = MEMORY[0x1895FED80];
  v26[1] = 0x40000000LL;
  v26[2] = ___ZNK6mach_o6Header22validSemanticsSegmentsERKNS_6PolicyEy_block_invoke;
  v26[3] = &unk_18962F2E8;
  v26[4] = &v33;
  v26[5] = &v27;
  v26[6] = &v43;
  v26[7] = v31;
  v26[8] = &v37;
  v26[9] = this;
  v26[10] = a2;
  v26[11] = a3;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v26, (mach_o::Error *)v53);
  mach_o::Error::~Error((mach_o::Error *)v53);
  if (v38[5])
  {
    mach_o::Error::Error(a4, v38 + 5);
    goto LABEL_41;
  }

  unsigned int v7 = *((_DWORD *)this + 3);
  if (v7 <= 8 && ((1 << v7) & 0x144) != 0)
  {
    int v8 = *((_DWORD *)this + 6);
    if ((v8 & 4) != 0)
    {
      if (!*((_BYTE *)v34 + 24))
      {
        mach_o::Error::Error(a4, "missing __TEXT segment");
        goto LABEL_41;
      }

      if ((v8 & 0x80000000) == 0
        && *(void *)(dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::operator[]( (uint64_t)(v44 + 5),  v28[3])
                     + 16))
      {
        mach_o::Error::Error(a4, "__TEXT segment fileoffset is not zero");
        goto LABEL_41;
      }

      if (*(_DWORD *)this == -17958193) {
        int v24 = 32;
      }
      else {
        int v24 = 28;
      }
      unint64_t v25 = (v24 + *((_DWORD *)this + 5));
      if (*(void *)(dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::operator[]( (uint64_t)(v44 + 5),  v28[3])
                     + 24) < v25)
      {
        mach_o::Error::Error(a4, "load commands do not fit in __TEXT segment");
        goto LABEL_41;
      }
    }
  }

  uint64_t v9 = v44[7];
  if (v9)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = (void *)v44[5];
    int v12 = &v11[5 * v9];
    uint64_t v13 = v11 + 4;
    uint64_t v14 = 40 * v9;
    do
    {
      uint64_t v15 = v10;
      uint64_t v16 = v14;
      char v17 = v13;
      do
      {
        if (v15)
        {
          if (*(v17 - 4) < v11[1] && *(v17 - 3) > *v11)
          {
            mach_o::Error::Error(a4, "vm range of segment '%s' overlaps segment '%s'");
            goto LABEL_41;
          }

          if ((*((_DWORD *)this + 6) & 0x80000000) == 0 && *(v17 - 2) < v11[3] && *(v17 - 1) > v11[2])
          {
            mach_o::Error::Error(a4, "file range of segment '%s' overlaps segment '%s'");
            goto LABEL_41;
          }
        }

        v17 += 5;
        v15 -= 40LL;
        v16 -= 40LL;
      }

      while (v16);
      v11 += 5;
      v10 += 40LL;
    }

    while (v11 != v12);
  }

  if (!mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2)
    || (*((_DWORD *)this + 6) & 0x80000000) != 0
    || (uint64_t v18 = v44[7]) == 0)
  {
LABEL_28:
    *(void *)a4 = 0LL;
    goto LABEL_41;
  }

  uint64_t v19 = 0LL;
  uint64_t v20 = v44[5];
  uint64_t v21 = 40 * v18;
  while (1)
  {
    v22 = (void *)v19;
    uint64_t v19 = v20;
    if (!v22) {
      goto LABEL_27;
    }
    unint64_t v23 = *(void *)(v20 + 16);
    if (v23 < v22[2] && v23 != *(void *)(v19 + 24)) {
      break;
    }
    if (*(void *)v19 < *v22 && (*((_DWORD *)this + 3) != 12 || strcmp(*(const char **)(v19 + 32), "__PRELINK_INFO")))
    {
      mach_o::Error::Error(a4, "segment '%s' vm address out of order");
      goto LABEL_41;
    }

LABEL_27:
    uint64_t v20 = v19 + 40;
    v21 -= 40LL;
    if (!v21) {
      goto LABEL_28;
    }
  }

  mach_o::Error::Error(a4, "segment '%s' file offset out of order");
LABEL_41:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  mach_o::Error::~Error((mach_o::Error *)&v42);
  _Block_object_dispose(&v43, 8);
  uint64_t v50 = 0LL;
  if (v51) {
    MEMORY[0x186DF7B88](*MEMORY[0x1895FFD48], v51, v52);
  }
}

void mach_o::Header::validSemanticsLinkerOptions(mach_o::Header *this@<X0>, void *a2@<X8>)
{
  uint64_t v5 = 0LL;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3002000000LL;
  int v8 = __Block_byref_object_copy__8;
  uint64_t v9 = __Block_byref_object_dispose__9;
  uint64_t v10 = 0LL;
  v4[0] = MEMORY[0x1895FED80];
  v4[1] = 0x40000000LL;
  v4[2] = ___ZNK6mach_o6Header27validSemanticsLinkerOptionsERKNS_6PolicyE_block_invoke;
  v4[3] = &unk_18962F338;
  v4[4] = &v5;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v4, (mach_o::Error *)v11);
  mach_o::Error::~Error((mach_o::Error *)v11);
  mach_o::Error::Error(a2, v6 + 5);
  _Block_object_dispose(&v5, 8);
  mach_o::Error::~Error((mach_o::Error *)&v10);
}

void mach_o::Header::validSemanticsMain( mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  if ((*((_DWORD *)this + 6) & 0x80000000) != 0 && mach_o::Policy::enforceHasLinkedDylibs(a2))
  {
    mach_o::Error::Error(a3, "MH_EXECUTE has MH_DYLIB_IN_CACHE bit set");
    return;
  }

  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3002000000LL;
  uint64_t v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__9;
  uint64_t v23 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2000000000LL;
  v17[3] = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 0LL;
  v8[0] = MEMORY[0x1895FED80];
  v8[1] = 0x40000000LL;
  v8[2] = ___ZNK6mach_o6Header18validSemanticsMainERKNS_6PolicyE_block_invoke;
  v8[3] = &unk_18962F310;
  v8[7] = v17;
  void v8[8] = this;
  v8[4] = &v13;
  v8[5] = &v18;
  v8[6] = &v9;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v8, (mach_o::Error *)v24);
  mach_o::Error::~Error((mach_o::Error *)v24);
  if (v19[5])
  {
    mach_o::Error::Error(a3, v19 + 5);
  }

  else if (v14[3] && v10[3])
  {
    mach_o::Error::Error(a3, "can't have LC_MAIN and LC_UNIXTHREAD load commands");
  }

  else
  {
    uint64_t v7 = 0x18962E9A8LL;
    BOOL v5 = mach_o::Header::builtForPlatform(this, &v7, 0);
    uint64_t v6 = v14[3];
    if (v5)
    {
      if (v6 || v10[3])
      {
        mach_o::Error::Error(a3, "LC_MAIN not allowed for driverkit");
        goto LABEL_17;
      }
    }

    else if (!v6 && !v10[3])
    {
      mach_o::Error::Error(a3, "missing LC_MAIN or LC_UNIXTHREAD in main executable");
      goto LABEL_17;
    }

    *(void *)a3 = 0LL;
  }

LABEL_17:
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v18, 8);
  mach_o::Error::~Error((mach_o::Error *)&v23);
}

    if (dyld3::MachOFile::builtForPlatform(v11, v12, 1)) {
      return v8;
    }
LABEL_18:
    if (!a4)
    {
LABEL_33:
      if (a2 == 6)
      {
LABEL_34:
        int v8 = 1LL;
        if (dyld3::MachOFile::builtForPlatform(a1, 1, 1)) {
          return v8;
        }
      }

      return 0LL;
    }

    if (a2 == 12)
    {
      int v8 = 1LL;
      uint64_t v13 = a1;
      uint64_t v14 = 7;
    }

    else
    {
      if (a2 != 11) {
        goto LABEL_24;
      }
      int v8 = 1LL;
      uint64_t v13 = a1;
      uint64_t v14 = 2;
    }

    if (dyld3::MachOFile::builtForPlatform(v13, v14, 1)) {
      return v8;
    }
LABEL_24:
    HIDWORD(v15) = a2;
    LODWORD(v15) = a2 - 6;
    switch((v15 >> 1))
    {
      case 0u:
        goto LABEL_34;
      case 5u:
        int v8 = 1LL;
        if (dyld3::MachOFile::builtForPlatform(a1, 1, 0)) {
          return v8;
        }
        if (a2 == 6) {
          goto LABEL_34;
        }
        if (a2 == 20) {
          goto LABEL_32;
        }
        if (a2 != 18) {
          return 0LL;
        }
LABEL_29:
        int v8 = 1LL;
        if (dyld3::MachOFile::builtForPlatform(a1, 2, 1)) {
          return v8;
        }
        if (a2 == 6) {
          goto LABEL_34;
        }
        if (a2 != 20) {
          return 0LL;
        }
LABEL_32:
        int v8 = 1LL;
        if (!dyld3::MachOFile::builtForPlatform(a1, 3, 1)) {
          goto LABEL_33;
        }
        return v8;
      case 6u:
        goto LABEL_29;
      case 7u:
        goto LABEL_32;
      default:
        return 0LL;
    }
  }

  return 1LL;
}

void ___ZNK6mach_o6Header26validStructureLoadCommandsEy_block_invoke(uint64_t a1, mach_o *this, _BYTE *a3)
{
  int v5 = *(_DWORD *)this;
  if (*(int *)this <= -2147483596)
  {
    if (v5 > -2147483609)
    {
      switch(v5)
      {
        case -2147483608:
          if (*((_DWORD *)this + 1) == 24) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_MAIN size wrong");
          break;
        case -2147483597:
          if (*((_DWORD *)this + 1) == 16) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_DYLD_EXPORTS_TRIE size wrong");
          break;
        case -2147483596:
          if (*((_DWORD *)this + 1) == 16) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_DYLD_CHAINED_FIXUPS size wrong");
          break;
        default:
LABEL_24:
          if ((v5 & 0x80000000) == 0) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d unknown required load command 0x%08X");
          break;
      }
    }

    else
    {
      switch(v5)
      {
        case -2147483624:
        case -2147483620:
        case -2147483617:
        case -2147483613:
LABEL_7:
          unsigned int v6 = *((_DWORD *)this + 2);
LABEL_8:
          mach_o::stringOverflow(this, v6, (mach_o::Error *)&v7);
          break;
        case -2147483614:
LABEL_18:
          if (*((_DWORD *)this + 1) == 48) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_DYLD_INFO_ONLY size wrong");
          break;
        default:
          goto LABEL_24;
      }
    }

LABEL_46:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), &v7);
    mach_o::Error::~Error((mach_o::Error *)&v7);
  }

  else
  {
    switch(v5)
    {
      case 1:
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_SEGMENT size does not match number of sections");
        goto LABEL_46;
      case 2:
        if (*((_DWORD *)this + 1) == 24) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_SYMTAB size wrong");
        goto LABEL_46;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 22:
      case 23:
      case 24:
      case 26:
      case 28:
      case 29:
      case 31:
      case 32:
      case 35:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 45:
      case 46:
      case 49:
        goto LABEL_24;
      case 11:
        if (*((_DWORD *)this + 1) == 80) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_DYSYMTAB size wrong");
        goto LABEL_46;
      case 12:
      case 13:
      case 19:
      case 20:
      case 21:
        goto LABEL_7;
      case 25:
        mach_o::Error::Error( (mach_o::Error *)&v7,  "load command #%d LC_SEGMENT_64 size does not match number of sections");
        goto LABEL_46;
      case 27:
        if (*((_DWORD *)this + 1) == 24) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_UUID size wrong");
        goto LABEL_46;
      case 30:
        if (*((_DWORD *)this + 1) == 16) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_SEGMENT_SPLIT_INFO size wrong");
        goto LABEL_46;
      case 33:
        if (*((_DWORD *)this + 1) == 20) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_ENCRYPTION_INFO size wrong");
        goto LABEL_46;
      case 34:
        goto LABEL_18;
      case 36:
      case 37:
      case 47:
      case 48:
        if (*((_DWORD *)this + 1) == 16) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_VERSION_MIN_* size wrong");
        goto LABEL_46;
      case 38:
        if (*((_DWORD *)this + 1) == 16) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_FUNCTION_STARTS size wrong");
        goto LABEL_46;
      case 44:
        if (*((_DWORD *)this + 1) == 24) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_ENCRYPTION_INFO_64 size wrong");
        goto LABEL_46;
      case 50:
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_BUILD_VERSION size wrong");
        goto LABEL_46;
      default:
        if (v5 == -2147483595)
        {
          unsigned int v6 = *((_DWORD *)this + 6);
          goto LABEL_8;
        }

        if (v5 != 54) {
          goto LABEL_24;
        }
        if (*((_DWORD *)this + 1) != 16)
        {
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_ATOM_INFO size wrong");
          goto LABEL_46;
        }

        break;
    }
  }

LABEL_47:
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    *a3 = 1;
  }
}

mach_o::Error *mach_o::stringOverflow@<X0>( mach_o::Error *this@<X0>, unsigned int a2@<W2>, mach_o::Error *a3@<X8>)
{
  uint64_t v4 = *((unsigned int *)this + 1);
  int v5 = (char *)this + v4;
  unsigned int v6 = (char *)this + a2;
  while (*v6)
  {
    if (++v6 >= v5) {
      return mach_o::Error::Error(a3, "load command #%d string extends beyond end of load command");
    }
  }

  *(void *)a3 = 0LL;
  return this;
}

mach_o::Error *mach_o::Header::forEachLoadCommand@<X0>( mach_o::Error *result@<X0>, uint64_t a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v4 = result;
  int v6 = *(_DWORD *)result;
  if (*(_DWORD *)result == -17958193)
  {
    uint64_t v7 = 32LL;
  }

  else
  {
    if (v6 != -17958194)
    {
      if ((v6 & 0xFEFFFFFF) == 0xCEFAEDFE) {
        return mach_o::Error::Error(a3, "big endian mach-o file");
      }
      else {
        return mach_o::Error::Error(a3, "file does not start with MH_MAGIC[_64]: 0x%08X 0x%08X");
      }
    }

    uint64_t v7 = 28LL;
  }

  if (*((_DWORD *)result + 3) >= 0xDu) {
    return mach_o::Error::Error(a3, "unknown mach-o filetype (%u)");
  }
  if (*((_DWORD *)result + 4))
  {
    int v8 = (char *)result + v7;
    uint64_t v9 = (char *)result + v7 + *((unsigned int *)result + 5);
    int v10 = 1;
    for (i = (char *)result + v7; ; i = v13)
    {
      if (i >= v9) {
        return mach_o::Error::Error(a3, "malformed load command (%d of %d) at %p with mh=%p, off end of load commands");
      }
      uint64_t v12 = *((unsigned int *)i + 1);
      uint64_t v13 = &i[v12];
      if (&i[v12] > v9 || v13 < v8) {
        return mach_o::Error::Error( a3,  "malformed load command (%d of %d) at %p with mh=%p, size (0x%X) is too large, load commands end at %p");
      }
      __n128 result = (mach_o::Error *)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    }

    return mach_o::Error::Error(a3, "malformed load command (%d of %d) at %p with mh=%p, size (0x%X) too small");
  }

  else
  {
LABEL_20:
    *(void *)a3 = 0LL;
  }

  return result;
}

void mach_o::Header::forEachLoadCommandSafe(mach_o::Error *a1, uint64_t a2)
{
}

uint64_t ___ZNK6mach_o6Header18validSemanticsUUIDERKNS_6PolicyE_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 == 27) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
  }
  return result;
}

uint64_t ___ZNK6mach_o6Header25validSemanticsInstallNameERKNS_6PolicyE_block_invoke( uint64_t result, _DWORD *a2)
{
  if (*a2 == 13)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = (char *)a2 + a2[2];
    ++*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL);
  }

  return result;
}

void ___ZNK6mach_o6Header26validSemanticsLinkedDylibsERKNS_6PolicyE_block_invoke( uint64_t a1, _DWORD *a2, _BYTE *a3)
{
  if ((*a2 + 2147483624) <= 0xB && ((1 << (*a2 - 24)) & 0x881) != 0 || *a2 == 12)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    LODWORD(v7) = *(_DWORD *)(v6 + 24);
    if ((int)v7 <= 255)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      if (*(_BYTE *)(a1 + 64) || *(_BYTE *)(a1 + 65))
      {
        int v10 = (char *)a2 + a2[2];
        if ((int)v7 <= 0)
        {
          uint64_t v7 = (int)v7;
        }

        else
        {
          uint64_t v11 = 0LL;
          do
          {
            if (!strcmp(v10, *(const char **)(*(void *)(a1 + 56) + 8 * v11)))
            {
              if (*(_BYTE *)(a1 + 64))
              {
                mach_o::Error::Error((mach_o::Error *)&v13, "duplicate linked dylib '%s'", v10);
                mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), &v13);
                mach_o::Error::~Error((mach_o::Error *)&v13);
                *a3 = 1;
              }

              else
              {
                mach_o::warning(v9, "duplicate linked dylib are deprecated ('%s')", v12, v10);
              }
            }

            ++v11;
            uint64_t v7 = *(int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
          }

          while (v11 < v7);
        }

        *(void *)(*(void *)(a1 + 56) + 8 * v7) = v10;
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
        LODWORD(v7) = *(_DWORD *)(v6 + 24);
      }
    }

    *(_DWORD *)(v6 + 24) = v7 + 1;
  }

BOOL mach_o::Header::builtForPlatform(mach_o::Header *a1, uint64_t *a2, char a3)
{
  uint64_t v5 = *a2;
  BOOL v6 = v14[0] == *a2;
  BOOL v7 = v6;
  if (!v6 && (a3 & 1) == 0)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    char v13 = 0;
    v9[0] = MEMORY[0x1895FED80];
    v9[1] = 1174405120LL;
    v9[2] = ___ZNK6mach_o6Header16builtForPlatformENS_8PlatformEb_block_invoke;
    void v9[3] = &unk_18962F388;
    v9[4] = &v10;
    v9[5] = v5;
    mach_o::PlatformAndVersions::unzip(v14, (uint64_t)v9);
    BOOL v7 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }

  return v7;
}

void mach_o::Header::forEachRPath(mach_o::Error *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZNK6mach_o6Header12forEachRPathEU13block_pointerFvPKcRbE_block_invoke;
  v2[3] = &unk_18962F610;
  v2[4] = a2;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void ___ZNK6mach_o6Header19validSemanticsRPathERKNS_6PolicyE_block_invoke(uint64_t a1, char *__s1, _BYTE *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 8);
  LODWORD(v5) = *(_DWORD *)(v4 + 24);
  if ((int)v5 <= 63)
  {
    if ((int)v5 <= 0)
    {
      uint64_t v5 = (int)v5;
    }

    else
    {
      uint64_t v9 = 0LL;
      do
      {
        if (!strcmp(__s1, *(const char **)(*(void *)(a1 + 48) + 8 * v9)) && *(_BYTE *)(a1 + 56))
        {
          mach_o::Error::Error((mach_o::Error *)&v10, "duplicate LC_RPATH '%s'", __s1);
          mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), &v10);
          mach_o::Error::~Error((mach_o::Error *)&v10);
          *a3 = 1;
          uint64_t v3 = *(void *)(a1 + 32);
        }

        ++v9;
        uint64_t v5 = *(int *)(*(void *)(v3 + 8) + 24LL);
      }

      while (v9 < v5);
    }

    *(void *)(*(void *)(a1 + 48) + 8 * v5) = __s1;
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    LODWORD(v5) = *(_DWORD *)(v4 + 24);
  }

  *(_DWORD *)(v4 + 24) = v5 + 1;
}

double __Block_byref_object_copy__51(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 72) = 0LL;
  double result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v3 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v3;
  *(void *)(a2 + 72) = 0LL;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  return result;
}

uint64_t __Block_byref_object_dispose__52(uint64_t result)
{
  *(void *)(result + 56) = 0LL;
  if (*(void *)(result + 64)) {
    JUMPOUT(0x186DF7B88LL);
  }
  return result;
}

void ___ZNK6mach_o6Header22validSemanticsSegmentsERKNS_6PolicyEy_block_invoke( uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6 = *(void *)(a1 + 72);
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t v7 = a2 + 8;
    if (!strcmp((const char *)(a2 + 8), "__TEXT"))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL)
                                                                              + 56LL);
    }

    else if (!strcmp((const char *)(a2 + 8), "__LINKEDIT"))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }

    mach_o::Header::validSegment<segment_command,section>( *(mach_o::Policy **)(a1 + 80),  v6,  *(void *)(a1 + 88),  a2,  (mach_o::Error *)&v13);
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), &v13);
    mach_o::Error::~Error((mach_o::Error *)&v13);
    int v8 = (vm_address_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v12 = (*(_DWORD *)(a2 + 28) + *(_DWORD *)(a2 + 24));
    uint64_t v13 = *(unsigned int *)(a2 + 24);
    uint64_t v14 = v12;
    uint64_t v10 = *(unsigned int *)(a2 + 32);
    uint64_t v11 = (*(_DWORD *)(a2 + 36) + v10);
  }

  else
  {
    if (*(_DWORD *)a2 != 25) {
      goto LABEL_14;
    }
    uint64_t v7 = a2 + 8;
    if (!strcmp((const char *)(a2 + 8), "__TEXT"))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL)
                                                                              + 56LL);
    }

    else if (!strcmp((const char *)(a2 + 8), "__LINKEDIT"))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }

    mach_o::Header::validSegment<segment_command_64,section_64>( *(mach_o::Policy **)(a1 + 80),  v6,  *(void *)(a1 + 88),  a2,  (mach_o::Error *)&v13);
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), &v13);
    mach_o::Error::~Error((mach_o::Error *)&v13);
    int v8 = (vm_address_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v9 = *(void *)(a2 + 32) + *(void *)(a2 + 24);
    uint64_t v13 = *(void *)(a2 + 24);
    uint64_t v14 = v9;
    uint64_t v10 = *(void *)(a2 + 40);
    uint64_t v11 = *(void *)(a2 + 48) + v10;
  }

  uint64_t v15 = v10;
  uint64_t v16 = v11;
  uint64_t v17 = v7;
  dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back( v8,  (uint64_t)&v13);
LABEL_14:
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
    *a3 = 1;
  }
}

mach_o::Error *mach_o::Header::validSegment<segment_command_64,section_64>@<X0>( mach_o::Policy *this@<X1>, uint64_t a2@<X0>, unint64_t a3@<X2>, uint64_t a4@<X3>, mach_o::Error *a5@<X8>)
{
  uint64_t v7 = *(void *)(a4 + 40);
  unint64_t v8 = *(void *)(a4 + 48);
  BOOL v9 = __CFADD__(v7, v8);
  unint64_t v10 = v7 + v8;
  if (v9 || v10 > a3) {
    return mach_o::Error::Error(a5, "segment '%s' load command content extends beyond end of file");
  }
  unsigned int v13 = *(_DWORD *)(a2 + 12);
  if (v13 != 1)
  {
    unint64_t v14 = *(void *)(a4 + 32);
    if (v8 > v14 && (v14 || (*(_BYTE *)(a4 + 68) & 4) == 0)) {
      return mach_o::Error::Error(a5, "segment '%s' filesize exceeds vmsize");
    }
  }

  if (*(_DWORD *)(a4 + 60) >= 8u) {
    return mach_o::Error::Error(a5, "%s segment permissions has invalid bits set (0x%08X)");
  }
  if (v13 <= 8
    && ((1 << v13) & 0x144) != 0
    && (*(_BYTE *)(a2 + 24) & 4) != 0
    && mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(this)
    && !strcmp((const char *)(a4 + 8), "__TEXT")
    && *(_DWORD *)(a4 + 60) != 5)
  {
    return mach_o::Error::Error(a5, "__TEXT segment permissions is not 'r-x'");
  }

  double result = (mach_o::Error *)mach_o::Policy::enforceReadOnlyLinkedit(this);
  if ((_DWORD)result)
  {
    double result = (mach_o::Error *)strcmp((const char *)(a4 + 8), "__LINKEDIT");
    if (!(_DWORD)result && *(_DWORD *)(a4 + 60) != 1) {
      return mach_o::Error::Error(a5, "__LINKEDIT segment permissions is not 'r--'");
    }
  }

  if (*(_DWORD *)(a2 + 12) != 9)
  {
    double result = (mach_o::Error *)mach_o::Policy::enforceDataSegmentPermissions(this);
    if ((_DWORD)result)
    {
      double result = (mach_o::Error *)strcmp((const char *)(a4 + 8), "__DATA_CONST");
      if (!(_DWORD)result)
      {
        if (*(_DWORD *)(a4 + 60) != 3) {
          return mach_o::Error::Error(a5, "__DATA_CONST segment permissions is not 'rw-'");
        }
        if ((*(_BYTE *)(a4 + 68) & 0x10) == 0)
        {
          if ((v20 = 0, int v19 = *(_DWORD *)(a2 + 12), v19 != 9) && v19 != 6
            || (double result = (mach_o::Error *)mach_o::Header::hasSplitSegInfo((mach_o::Header *)a2, &v20), !(_DWORD)result)
            || v20)
          {
            if ((*(_DWORD *)(a2 + 24) & 0x80000000) == 0) {
              return mach_o::Error::Error(a5, "__DATA_CONST segment missing SG_READ_ONLY flag");
            }
          }
        }
      }
    }
  }

  if (__CFADD__(*(void *)(a4 + 24), *(void *)(a4 + 32))) {
    return mach_o::Error::Error(a5, "'%s' segment vm range wraps");
  }
  if (*(_DWORD *)(a2 + 12) == 9 || (unsigned int v16 = *(_DWORD *)(a4 + 64)) == 0)
  {
LABEL_36:
    *(void *)a5 = 0LL;
  }

  else
  {
    unint64_t v17 = a4 + 72;
    unint64_t v18 = a4 + 72 + 80LL * v16;
    while (1)
    {
      if ((*(void *)(v17 + 40) & 0x8000000000000000LL) != 0) {
        return mach_o::Error::Error(a5, "section '%s' size too large 0x%lX");
      }
      if (*(void *)(v17 + 32) < *(void *)(a4 + 24)) {
        return mach_o::Error::Error( a5,  "section '%s' start address 0x%lX is before containing segment's address 0x%0lX");
      }
      double result = (mach_o::Error *)mach_o::Policy::enforceSectionsInSegment(this);
      if ((_DWORD)result)
      {
        if (*(void *)(v17 + 40) + *(void *)(v17 + 32) > *(void *)(a4 + 32) + *(void *)(a4 + 24)) {
          return mach_o::Error::Error( a5,  "section '%s' end address 0x%lX is beyond containing segment's end address 0x%0lX");
        }
      }

      v17 += 80LL;
      if (v17 >= v18) {
        goto LABEL_36;
      }
    }
  }

  return result;
}

__n128 dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back( vm_address_t *a1, uint64_t a2)
{
  kern_return_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  __n128 result;
  __int128 v17;
  char v18[256];
  uint64_t v19;
  int v19 = *MEMORY[0x1895FEE08];
  unint64_t v4 = a1[1];
  unint64_t v5 = a1[2] + 1;
  if (v5 > v4)
  {
    uint64_t v6 = (char *)a1[3];
    uint64_t v7 = (char *)a1[4];
    unint64_t v8 = 2 * v4;
    if (v8 > v5) {
      unint64_t v5 = v8;
    }
    vm_size_t v9 = (*MEMORY[0x189600148] + 40 * v5 - 1) & -*MEMORY[0x189600148];
    a1[4] = v9;
    unint64_t v10 = (unsigned int *)MEMORY[0x1895FFD48];
    uint64_t v11 = vm_allocate(*MEMORY[0x1895FFD48], a1 + 3, v9, 1006632961);
    if (v11) {
      dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back( v18,  a1 + 4,  v11);
    }
    memcpy((void *)a1[3], (const void *)*a1, 40 * a1[2]);
    uint64_t v12 = a1[4] / 0x28;
    *a1 = a1[3];
    a1[1] = v12;
    if (v6) {
      MEMORY[0x186DF7B88](*v10, v6, v7);
    }
  }

  unsigned int v13 = (char *)*a1;
  unint64_t v14 = (char *)a1[2];
  a1[2] = (vm_address_t)(v14 + 1);
  uint64_t v15 = &v13[40 * (void)v14];
  double result = *(__n128 *)a2;
  unint64_t v17 = *(_OWORD *)(a2 + 16);
  *((void *)v15 + 4) = *(void *)(a2 + 32);
  *(__n128 *)uint64_t v15 = result;
  *((_OWORD *)v15 + 1) = v17;
  return result;
}

mach_o::Error *mach_o::Header::validSegment<segment_command,section>@<X0>( mach_o::Policy *this@<X1>, uint64_t a2@<X0>, unint64_t a3@<X2>, uint64_t a4@<X3>, mach_o::Error *a5@<X8>)
{
  int v7 = *(_DWORD *)(a4 + 32);
  unsigned int v8 = *(_DWORD *)(a4 + 36);
  BOOL v9 = __CFADD__(v7, v8);
  unint64_t v10 = v7 + v8;
  if (v9 || v10 > a3) {
    return mach_o::Error::Error(a5, "segment '%s' load command content extends beyond end of file");
  }
  unsigned int v13 = *(_DWORD *)(a2 + 12);
  if (v13 != 1)
  {
    unsigned int v14 = *(_DWORD *)(a4 + 28);
    if (v8 > v14 && (v14 || (*(_BYTE *)(a4 + 52) & 4) == 0)) {
      return mach_o::Error::Error(a5, "segment '%s' filesize exceeds vmsize");
    }
  }

  if (*(_DWORD *)(a4 + 44) >= 8u) {
    return mach_o::Error::Error(a5, "%s segment permissions has invalid bits set (0x%08X)");
  }
  if (v13 <= 8
    && ((1 << v13) & 0x144) != 0
    && (*(_BYTE *)(a2 + 24) & 4) != 0
    && mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(this)
    && !strcmp((const char *)(a4 + 8), "__TEXT")
    && *(_DWORD *)(a4 + 44) != 5)
  {
    return mach_o::Error::Error(a5, "__TEXT segment permissions is not 'r-x'");
  }

  double result = (mach_o::Error *)mach_o::Policy::enforceReadOnlyLinkedit(this);
  if ((_DWORD)result)
  {
    double result = (mach_o::Error *)strcmp((const char *)(a4 + 8), "__LINKEDIT");
    if (!(_DWORD)result && *(_DWORD *)(a4 + 44) != 1) {
      return mach_o::Error::Error(a5, "__LINKEDIT segment permissions is not 'r--'");
    }
  }

  if (*(_DWORD *)(a2 + 12) != 9)
  {
    double result = (mach_o::Error *)mach_o::Policy::enforceDataSegmentPermissions(this);
    if ((_DWORD)result)
    {
      double result = (mach_o::Error *)strcmp((const char *)(a4 + 8), "__DATA_CONST");
      if (!(_DWORD)result)
      {
        if (*(_DWORD *)(a4 + 44) != 3) {
          return mach_o::Error::Error(a5, "__DATA_CONST segment permissions is not 'rw-'");
        }
        if ((*(_BYTE *)(a4 + 52) & 0x10) == 0)
        {
          if ((v20 = 0, int v19 = *(_DWORD *)(a2 + 12), v19 != 9) && v19 != 6
            || (double result = (mach_o::Error *)mach_o::Header::hasSplitSegInfo((mach_o::Header *)a2, &v20), !(_DWORD)result)
            || v20)
          {
            if ((*(_DWORD *)(a2 + 24) & 0x80000000) == 0) {
              return mach_o::Error::Error(a5, "__DATA_CONST segment missing SG_READ_ONLY flag");
            }
          }
        }
      }
    }
  }

  if (__CFADD__(*(_DWORD *)(a4 + 24), *(_DWORD *)(a4 + 28))) {
    return mach_o::Error::Error(a5, "'%s' segment vm range wraps");
  }
  if (*(_DWORD *)(a2 + 12) == 9 || (unsigned int v16 = *(_DWORD *)(a4 + 48)) == 0)
  {
LABEL_35:
    *(void *)a5 = 0LL;
  }

  else
  {
    unint64_t v17 = a4 + 56;
    unint64_t v18 = a4 + 56 + 68LL * v16;
    while (1)
    {
      if (*(_DWORD *)(v17 + 32) < *(_DWORD *)(a4 + 24)) {
        return mach_o::Error::Error( a5,  "section '%s' start address 0x%lX is before containing segment's address 0x%0lX");
      }
      double result = (mach_o::Error *)mach_o::Policy::enforceSectionsInSegment(this);
      if ((_DWORD)result)
      {
        if (*(_DWORD *)(v17 + 36) + *(_DWORD *)(v17 + 32) > (*(_DWORD *)(a4 + 28) + *(_DWORD *)(a4 + 24))) {
          return mach_o::Error::Error( a5,  "section '%s' end address 0x%lX is beyond containing segment's end address 0x%0lX");
        }
      }

      v17 += 68LL;
      if (v17 >= v18) {
        goto LABEL_35;
      }
    }
  }

  return result;
}

uint64_t dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::operator[]( uint64_t a1, unint64_t a2)
{
  kern_return_t v13;
  unint64_t v14;
  char v16[256];
  uint64_t v17;
  unint64_t v17 = *MEMORY[0x1895FEE08];
  unint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = a2 + 1;
  if (v4 <= a2 && v4 != v5)
  {
    if (v4 <= v5)
    {
      unint64_t v7 = *(void *)(a1 + 8);
      if (v7 < v5)
      {
        uint64_t v8 = *(void *)(a1 + 24);
        uint64_t v9 = *(void *)(a1 + 32);
        unint64_t v10 = 2 * v7;
        if (v10 <= v5) {
          unint64_t v10 = a2 + 1;
        }
        vm_size_t v11 = (*MEMORY[0x189600148] + 40 * v10 - 1) & -*MEMORY[0x189600148];
        *(void *)(a1 + 32) = v11;
        uint64_t v12 = (unsigned int *)MEMORY[0x1895FFD48];
        unsigned int v13 = vm_allocate(*MEMORY[0x1895FFD48], (vm_address_t *)(a1 + 24), v11, 1006632961);
        if (v13) {
          dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back( v16,  (void *)(a1 + 32),  v13);
        }
        memcpy(*(void **)(a1 + 24), *(const void **)a1, 40LL * *(void *)(a1 + 16));
        unsigned int v14 = *(void *)(a1 + 32) / 0x28uLL;
        *(void *)a1 = *(void *)(a1 + 24);
        *(void *)(a1 + 8) = v14;
        if (v8) {
          MEMORY[0x186DF7B88](*v12, v8, v9);
        }
      }
    }

    *(void *)(a1 + 16) = v5;
  }

  return *(void *)a1 + 40 * a2;
}

void ___ZNK6mach_o6Header18validSemanticsMainERKNS_6PolicyE_block_invoke(void *a1, _DWORD *a2)
{
  if (*a2 == 5)
  {
    unint64_t v5 = (mach_o::Header *)a1[8];
    uint64_t v6 = *(void *)(a1[6] + 8LL);
    if (*(void *)(v6 + 24))
    {
      mach_o::Error::Error((mach_o::Error *)&v7, "multiple LC_UNIXTHREAD load commands");
      mach_o::Error::operator=((void *)(*(void *)(a1[5] + 8LL) + 40LL), &v7);
      mach_o::Error::~Error((mach_o::Error *)&v7);
      uint64_t v6 = *(void *)(a1[6] + 8LL);
    }

    *(void *)(v6 + 24) = a2;
    if ((mach_o::Header::entryAddrFromThreadCmd( v5,  *(const thread_command **)(*(void *)(a1[6] + 8LL) + 24LL),  (unint64_t *)(*(void *)(a1[7] + 8LL) + 24LL)) & 1) == 0)
    {
      mach_o::Error::Error((mach_o::Error *)&v7, "invalid LC_UNIXTHREAD");
      mach_o::Error::operator=((void *)(*(void *)(a1[5] + 8LL) + 40LL), &v7);
      mach_o::Error::~Error((mach_o::Error *)&v7);
    }
  }

  else if (*a2 == -2147483608)
  {
    uint64_t v4 = *(void *)(a1[4] + 8LL);
    if (*(void *)(v4 + 24))
    {
      mach_o::Error::Error((mach_o::Error *)&v7, "multiple LC_MAIN load commands");
      mach_o::Error::operator=((void *)(*(void *)(a1[5] + 8LL) + 40LL), &v7);
      mach_o::Error::~Error((mach_o::Error *)&v7);
      uint64_t v4 = *(void *)(a1[4] + 8LL);
    }

    *(void *)(v4 + 24) = a2;
  }

uint64_t mach_o::Header::entryAddrFromThreadCmd( mach_o::Header *this, const thread_command *a2, unint64_t *a3)
{
  uint64_t result = 0LL;
  uint32_t cmd = a2[1].cmd;
  int v6 = *((_DWORD *)this + 1);
  if (v6 > 16777222)
  {
    if (v6 == 16777223)
    {
      if (cmd == 4)
      {
        unint64_t cmdsize = (unint64_t)a2[18];
        goto LABEL_14;
      }
    }

    else
    {
      if (v6 != 16777228) {
        return result;
      }
      if (cmd == 6)
      {
        unint64_t cmdsize = (unint64_t)a2[34];
        goto LABEL_14;
      }
    }

    return 0LL;
  }

  if (v6 == 7)
  {
    if (cmd == 1)
    {
      unint64_t cmdsize = a2[7].cmd;
      goto LABEL_14;
    }

    return 0LL;
  }

  if (v6 != 12) {
    return result;
  }
  if (cmd != 1) {
    return 0LL;
  }
  unint64_t cmdsize = a2[9].cmdsize;
LABEL_14:
  *a3 = cmdsize;
  return 1LL;
}

void ___ZNK6mach_o6Header27validSemanticsLinkerOptionsERKNS_6PolicyE_block_invoke( uint64_t a1, _DWORD *a2, _BYTE *a3)
{
  if (*a2 == 45)
  {
    int v3 = a2[2];
    if (v3)
    {
      int v6 = (char *)a2 + a2[1];
      uint64_t v7 = (const char *)(a2 + 3);
      while (1)
      {
        v7 += strlen(v7) + 1;
        if (v7 > v6) {
          break;
        }
        if (!--v3) {
          return;
        }
      }

      mach_o::Error::Error((mach_o::Error *)&v8, "malformed LC_LINKER_OPTION command");
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), &v8);
      mach_o::Error::~Error((mach_o::Error *)&v8);
      *a3 = 1;
    }
  }

uint64_t ___ZNK6mach_o6Header26forEachPlatformLoadCommandEU13block_pointerFvNS_8PlatformENS_9Version32ES2_E_block_invoke( uint64_t result, int *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 48);
  int v5 = *a2;
  if (*a2 <= 46)
  {
    if (v5 == 36)
    {
      uint64_t v11 = a2[2];
      unsigned int v12 = a2[3];
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v11;
      }
      uint64_t v14 = *(void *)(result + 32);
      uint64_t v21 = 0x18962E5E8LL;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v14 + 16))(v14, &v21, v11, v13);
    }

    else
    {
      if (v5 != 37) {
        return result;
      }
      uint64_t v7 = *(void *)(result + 32);
      if ((*(_DWORD *)(v4 + 4) | 0x1000000) == 0x1000007)
      {
        uint64_t v20 = 0x18962E6A8LL;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v7 + 16))( v7,  &v20,  a2[2],  a2[3]);
      }

      else
      {
        uint64_t v19 = 0x18962E648LL;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v7 + 16))( v7,  &v19,  a2[2],  a2[3]);
      }
    }
  }

  else
  {
    switch(v5)
    {
      case '/':
        uint64_t v8 = *(void *)(result + 32);
        if (*(_DWORD *)(v4 + 4) == 16777223)
        {
          uint64_t v18 = 0x18962E768LL;
          uint64_t v9 = &v18;
        }

        else
        {
          uint64_t v17 = 0x18962E708LL;
          uint64_t v9 = &v17;
        }

        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v8 + 16))( v8,  v9,  a2[2],  a2[3]);
        break;
      case '0':
        uint64_t v10 = *(void *)(result + 32);
        if ((*(_DWORD *)(v4 + 4) | 0x1000000) == 0x1000007)
        {
          uint64_t v16 = 0x18962E8E8LL;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v10 + 16))( v10,  &v16,  a2[2],  a2[3]);
        }

        else
        {
          uint64_t v15 = 0x18962E888LL;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v10 + 16))( v10,  &v15,  a2[2],  a2[3]);
        }

        break;
      case '2':
        uint64_t v6 = *(void *)(result + 32);
        mach_o::Platform::Platform((mach_o::Platform *)v22, a2[2]);
        uint64_t result = (*(uint64_t (**)(uint64_t, char *, void, void))(v6 + 16))( v6,  v22,  a2[3],  a2[4]);
        break;
      default:
        return result;
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(v3 + 40) + 8LL) + 24LL) = 1;
  return result;
}

uint64_t ___ZNK6mach_o6Header16builtForPlatformENS_8PlatformEb_block_invoke(uint64_t result, void *a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) |= *a2 == *(void *)(result + 40);
  return result;
}

uint64_t __copy_helper_block_8_40c22_ZTSN6mach_o8PlatformE(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

void mach_o::Header::forEachSection(mach_o::Error *a1, uint64_t a2)
{
  v3[0] = 0LL;
  v3[1] = v3;
  v3[2] = 0x2000000000LL;
  int v4 = 0;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZNK6mach_o6Header14forEachSectionEU13block_pointerFvRKNS0_11SectionInfoERbE_block_invoke;
  v2[3] = &unk_18962F5C0;
  v2[4] = a2;
  void v2[5] = v3;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v5);
  mach_o::Error::~Error((mach_o::Error *)v5);
  _Block_object_dispose(v3, 8);
}

BOOL std::string_view::starts_with[abi:nn180100](void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  return a1[1] >= v4 && std::string_view::compare[abi:nn180100](a1, 0LL, v4, __s, v4) == 0;
}

uint64_t mach_o::Header::getDylibInstallName(mach_o::Error *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  char v10 = 0;
  v6[0] = MEMORY[0x1895FED80];
  v6[1] = 0x40000000LL;
  v6[2] = ___ZNK6mach_o6Header19getDylibInstallNameEPPKcPNS_9Version32ES5__block_invoke;
  void v6[3] = &unk_18962F3C0;
  void v6[6] = a4;
  v6[7] = a2;
  v6[4] = &v7;
  void v6[5] = a3;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v6, (mach_o::Error *)v11);
  mach_o::Error::~Error((mach_o::Error *)v11);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t ___ZNK6mach_o6Header19getDylibInstallNameEPPKcPNS_9Version32ES5__block_invoke( uint64_t result, _DWORD *a2, _BYTE *a3)
{
  if (*a2 == 13)
  {
    uint64_t v3 = *(_DWORD **)(result + 48);
    **(_DWORD **)(result + 40) = a2[5];
    *uint64_t v3 = a2[4];
    **(void **)(result + 56) = (char *)a2 + a2[2];
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

uint64_t mach_o::Header::linkedDylibLoadPath(mach_o::Header *this, int a2)
{
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x2000000000LL;
  int v11 = 0;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 0LL;
  v4[0] = MEMORY[0x1895FED80];
  v4[1] = 0x40000000LL;
  v4[2] = ___ZNK6mach_o6Header19linkedDylibLoadPathEj_block_invoke;
  v4[3] = &unk_18962F3E8;
  int v5 = a2;
  v4[4] = v10;
  void v4[5] = &v6;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v4, (mach_o::Error *)v12);
  mach_o::Error::~Error((mach_o::Error *)v12);
  uint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t ___ZNK6mach_o6Header19linkedDylibLoadPathEj_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 + 2147483624) <= 0xB && ((1 << (*a2 - 24)) & 0x881) != 0 || *a2 == 12)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 32) + 8LL);
    int v5 = *(_DWORD *)(v4 + 24);
    if (v5 == *(_DWORD *)(result + 48))
    {
      *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = (char *)a2 + a2[2];
      uint64_t v4 = *(void *)(*(void *)(result + 32) + 8LL);
      int v5 = *(_DWORD *)(v4 + 24);
    }

    *(_DWORD *)(v4 + 24) = v5 + 1;
  }

  return result;
}

uint64_t mach_o::Header::linkedDylibCount(mach_o::Header *this, BOOL *a2)
{
  if (a2) {
    *a2 = 1;
  }
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  int v8 = 0;
  v4[0] = MEMORY[0x1895FED80];
  v4[1] = 0x40000000LL;
  v4[2] = ___ZNK6mach_o6Header16linkedDylibCountEPb_block_invoke;
  v4[3] = &unk_18962F410;
  v4[4] = &v5;
  void v4[5] = a2;
  mach_o::Header::forEachLinkedDylib(this, (uint64_t)v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void mach_o::Header::forEachLinkedDylib(mach_o::Error *a1, uint64_t a2)
{
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x2000000000LL;
  int v6 = 0;
  v3[0] = 0LL;
  v3[1] = v3;
  v3[2] = 0x2000000000LL;
  char v4 = 0;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZNK6mach_o6Header18forEachLinkedDylibEU13block_pointerFvPKcNS_21LinkedDylibAttributesENS_9Version32ES4_RbE_block_invoke;
  v2[3] = &unk_18962F438;
  v2[4] = a2;
  void v2[5] = v5;
  void v2[6] = v3;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v7);
  mach_o::Error::~Error((mach_o::Error *)v7);
  _Block_object_dispose(v3, 8);
  _Block_object_dispose(v5, 8);
}

uint64_t ___ZNK6mach_o6Header16linkedDylibCountEPb_block_invoke(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3 = *(_BYTE **)(result + 40);
  if (v3) {
    BOOL v4 = a3 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    *uint64_t v3 = 0;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
  return result;
}

uint64_t mach_o::Header::loadCommandToDylibKind(mach_o::Header *this, const dylib_command *a2)
{
  if (*((_DWORD *)this + 3) == 443815936 && *((_DWORD *)this + 2) == 28) {
    return *((unsigned int *)this + 6);
  }
  int v3 = *(_DWORD *)this;
  if (*(int *)this > -2147483614)
  {
    if (v3 == -2147483613)
    {
      return 4LL;
    }

    else
    {
      if (v3 != 12) {
        goto LABEL_14;
      }
      return 0LL;
    }
  }

  else
  {
    if (v3 != -2147483624)
    {
      if (v3 == -2147483617) {
        return 2LL;
      }
LABEL_14:
      mach_o::Header::loadCommandToDylibKind();
    }

    return 1LL;
  }

uint64_t ___ZNK6mach_o6Header18forEachLinkedDylibEU13block_pointerFvPKcNS_21LinkedDylibAttributesENS_9Version32ES4_RbE_block_invoke( uint64_t result, mach_o::Header *this, _BYTE *a3)
{
  if ((*(_DWORD *)this + 2147483624) <= 0xB && ((1 << (*(_DWORD *)this - 24)) & 0x881) != 0
    || *(_DWORD *)this == 12)
  {
    uint64_t v7 = result;
    int v8 = (char *)this + *((unsigned int *)this + 2);
    uint64_t v9 = *(void *)(result + 32);
    unsigned __int8 CommandToDylibKind = mach_o::Header::loadCommandToDylibKind(this, (const dylib_command *)this);
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, void, void, void, _BYTE *))(v9 + 16))( v9,  v8,  CommandToDylibKind,  *((unsigned int *)this + 5),  *((unsigned int *)this + 4),  a3);
    ++*(_DWORD *)(*(void *)(*(void *)(v7 + 40) + 8LL) + 24LL);
    if (*a3) {
      *(_BYTE *)(*(void *)(*(void *)(v7 + 48) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

uint64_t mach_o::Header::preferredLoadAddress(mach_o::Header *this)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  uint64_t v7 = 0LL;
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  v3[2] = ___ZNK6mach_o6Header20preferredLoadAddressEv_block_invoke;
  void v3[3] = &unk_18962F4B0;
  v3[4] = &v4;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v3, (mach_o::Error *)v8);
  mach_o::Error::~Error((mach_o::Error *)v8);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t mach_o::Header::hasCodeSignature(mach_o::Header *this, unsigned int *a2, unsigned int *a3)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  char v9 = 0;
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = ___ZNK6mach_o6Header16hasCodeSignatureERjS1__block_invoke;
  void v5[3] = &unk_18962F460;
  v5[5] = a2;
  void v5[6] = a3;
  v5[4] = &v6;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v5, (mach_o::Error *)v10);
  mach_o::Error::~Error((mach_o::Error *)v10);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t ___ZNK6mach_o6Header16hasCodeSignatureERjS1__block_invoke(uint64_t result, _DWORD *a2, _BYTE *a3)
{
  if (*a2 == 29)
  {
    uint64_t v3 = *(_DWORD **)(result + 48);
    **(_DWORD **)(result + 40) = a2[2];
    *uint64_t v3 = a2[3];
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

uint64_t mach_o::Header::hasSplitSegInfo(mach_o::Header *this, BOOL *a2)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  char v8 = 0;
  v4[0] = MEMORY[0x1895FED80];
  v4[1] = 0x40000000LL;
  v4[2] = ___ZNK6mach_o6Header15hasSplitSegInfoERb_block_invoke;
  v4[3] = &unk_18962F488;
  v4[4] = &v5;
  void v4[5] = a2;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v4, (mach_o::Error *)v9);
  mach_o::Error::~Error((mach_o::Error *)v9);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___ZNK6mach_o6Header15hasSplitSegInfoERb_block_invoke(uint64_t result, _DWORD *a2, _BYTE *a3)
{
  if (*a2 == 30)
  {
    **(_BYTE **)(result + 40) = a2[3] == 0;
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

const char *mach_o::Header::libOrdinalName(mach_o::Header *this, int a2)
{
  int v3 = a2 - 1;
  Path = (const char *)mach_o::Header::linkedDylibLoadPath(this, v3);
  uint64_t v2 = Path;
  if (Path) {
    strlen(Path);
  }
  return v2;
}

uint64_t ___ZNK6mach_o6Header20preferredLoadAddressEv_block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t result = strcmp((const char *)(a2 + 8), "__TEXT");
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v6 = *(unsigned int *)(a2 + 24);
    goto LABEL_7;
  }

  if (*(_DWORD *)a2 == 25)
  {
    uint64_t result = strcmp((const char *)(a2 + 8), "__TEXT");
    if (!(_DWORD)result)
    {
      uint64_t v6 = *(void *)(a2 + 24);
LABEL_7:
      *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL) + 24LL) = v6;
      *a3 = 1;
    }
  }

  return result;
}

uint64_t mach_o::Header::getSlide(mach_o::Header *this)
{
  return (uint64_t)this - mach_o::Header::preferredLoadAddress(this);
}

void mach_o::Header::forEachSegment(mach_o::Error *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZNK6mach_o6Header14forEachSegmentEU13block_pointerFvRKNS0_11SegmentInfoERbE_block_invoke;
  v2[3] = &unk_18962F598;
  v2[4] = a2;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

char *mach_o::Header::name16(mach_o::Header *this, const char *a2)
{
  uint64_t v2 = this;
  if (strnlen((const char *)this, 0x10uLL) >= 0x10)
  {
    uint64_t v3 = 0LL;
    while (1)
    {
      uint64_t v4 = mach_o::Header::name16(char const*)::knownName16s[v3];
      if (*(void *)v2 == *(void *)v4 && *((void *)v2 + 1) == *((void *)v4 + 1)) {
        break;
      }
      if (++v3 == 24)
      {
        uint64_t v6 = malloc(0x11uLL);
        *(_OWORD *)uint64_t v6 = *(_OWORD *)v2;
        v6[16] = 0;
        return v6;
      }
    }

    return mach_o::Header::name16(char const*)::knownName16s[v3];
  }

  return (char *)v2;
}

uint64_t ___ZNK6mach_o6Header14forEachSegmentEU13block_pointerFvRKNS0_11SegmentInfoERbE_block_invoke( uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    int v11 = mach_o::Header::name16((mach_o::Header *)(a2 + 8), (const char *)a2);
    uint64_t v12 = *(void *)(a2 + 24);
    int32x2_t v13 = *(int32x2_t *)(a2 + 32);
    *(void *)&__int128 v14 = v12;
    *((void *)&v14 + 1) = HIDWORD(v12);
    __int128 v18 = v14;
    uint64_t v16 = v11;
    uint64_t v17 = v15;
    int32x2_t v19 = v13;
    int v20 = *(_DWORD *)(a2 + 52);
    int v10 = *(_DWORD *)(a2 + 44);
  }

  else
  {
    if (*(_DWORD *)a2 != 25) {
      return result;
    }
    uint64_t v16 = mach_o::Header::name16((mach_o::Header *)(a2 + 8), (const char *)a2);
    uint64_t v17 = v6;
    __int128 v18 = *(_OWORD *)(a2 + 24);
    int32x2_t v19 = vmovn_s64(*(int64x2_t *)(a2 + 40));
    int v20 = *(_DWORD *)(a2 + 68);
    int v10 = *(_DWORD *)(a2 + 60);
  }

  char v21 = v10;
  return (*(uint64_t (**)(void, char **, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 + 32) + 16LL))( *(void *)(v5 + 32),  &v16,  a3,  v7,  v8,  v9);
}

uint64_t ___ZNK6mach_o6Header14forEachSectionEU13block_pointerFvRKNS0_11SectionInfoERbE_block_invoke( uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    unsigned int v16 = *(_DWORD *)(a2 + 48);
    if (*a3) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v16 == 0;
    }
    if (!v17)
    {
      unint64_t v18 = a2 + 56;
      unint64_t v19 = a2 + 56 + 68LL * v16;
      do
      {
        uint64_t v29 = mach_o::Header::name16((mach_o::Header *)v18, (const char *)a2);
        uint64_t v30 = v20;
        uint64_t v31 = mach_o::Header::name16((mach_o::Header *)(v18 + 16), v20);
        uint64_t v32 = v21;
        uint64_t v22 = *(void *)(v5 + 32);
        int v23 = *(_DWORD *)(a2 + 44);
        int v33 = *(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8LL) + 24LL);
        int v34 = v23;
        int v25 = *(_DWORD *)(v18 + 40);
        int v24 = *(_DWORD *)(v18 + 44);
        int v35 = *(_DWORD *)(v18 + 56);
        int v36 = v24;
        uint64_t v26 = *(void *)(v18 + 32);
        *(void *)&__int128 v27 = v26;
        *((void *)&v27 + 1) = HIDWORD(v26);
        __int128 v37 = v27;
        int v38 = v25;
        *(void *)&__int128 v28 = *(void *)(v18 + 48);
        *((void *)&v28 + 1) = *(void *)(v18 + 60);
        __int128 v39 = v28;
        uint64_t result = (*(uint64_t (**)(void))(v22 + 16))();
        if (*a3) {
          break;
        }
        v18 += 68LL;
      }

      while (v18 < v19);
    }
  }

  else
  {
    if (*(_DWORD *)a2 != 25) {
      return result;
    }
    if (!*a3)
    {
      unsigned int v6 = *(_DWORD *)(a2 + 64);
      if (v6)
      {
        unint64_t v7 = a2 + 72;
        unint64_t v8 = a2 + 72 + 80LL * v6;
        do
        {
          uint64_t v29 = mach_o::Header::name16((mach_o::Header *)v7, (const char *)a2);
          uint64_t v30 = v9;
          uint64_t v31 = mach_o::Header::name16((mach_o::Header *)(v7 + 16), v9);
          uint64_t v32 = v10;
          uint64_t v11 = *(void *)(v5 + 32);
          int v12 = *(_DWORD *)(a2 + 60);
          int v33 = *(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8LL) + 24LL);
          int v34 = v12;
          int v14 = *(_DWORD *)(v7 + 48);
          int v13 = *(_DWORD *)(v7 + 52);
          int v35 = *(_DWORD *)(v7 + 64);
          int v36 = v13;
          __int128 v37 = *(_OWORD *)(v7 + 32);
          int v38 = v14;
          *(void *)&__int128 v15 = *(void *)(v7 + 56);
          *((void *)&v15 + 1) = *(void *)(v7 + 68);
          __int128 v39 = v15;
          uint64_t result = (*(uint64_t (**)(void))(v11 + 16))();
          if (*a3) {
            break;
          }
          v7 += 80LL;
        }

        while (v7 < v8);
      }
    }
  }

  ++*(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8LL) + 24LL);
  return result;
}

mach_o::Header *mach_o::Header::computeLinkEditBias(mach_o::Header *this, int a2)
{
  uint64_t v2 = this;
  if (a2) {
    return (mach_o::Header *)((char *)this + mach_o::Header::zerofillExpansionAmount(this));
  }
  return v2;
}

uint64_t mach_o::Header::zerofillExpansionAmount(mach_o::Header *this)
{
  uint64_t v6 = 0LL;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 0LL;
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x2000000000LL;
  void v5[3] = 0LL;
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x2000000000LL;
  v4[3] = 0LL;
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  v3[2] = ___ZNK6mach_o6Header23zerofillExpansionAmountEv_block_invoke;
  void v3[3] = &unk_18962F5E8;
  v3[4] = v5;
  void v3[5] = v4;
  v3[6] = &v6;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v3, (mach_o::Error *)v10);
  mach_o::Error::~Error((mach_o::Error *)v10);
  uint64_t v1 = v7[3];
  _Block_object_dispose(v4, 8);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v6, 8);
  return v1;
}

BOOL mach_o::Header::hasZerofillExpansion(mach_o::Header *this)
{
  return mach_o::Header::zerofillExpansionAmount(this) != 0;
}

void *___ZNK6mach_o6Header23zerofillExpansionAmountEv_block_invoke(void *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t result = (void *)strcmp((const char *)(a2 + 8), "__TEXT");
    if ((_DWORD)result)
    {
      uint64_t result = (void *)strcmp((const char *)(a2 + 8), "__LINKEDIT");
      if ((_DWORD)result) {
        return result;
      }
      uint64_t v6 = *(void *)(*(void *)(v5[5] + 8LL) + 24LL)
         - (*(void *)(*(void *)(v5[4] + 8LL) + 24LL)
      goto LABEL_9;
    }

    *(void *)(*(void *)(v5[4] + 8LL) + 24LL) = *(unsigned int *)(a2 + 24);
    uint64_t v7 = *(unsigned int *)(a2 + 32);
  }

  else
  {
    if (*(_DWORD *)a2 != 25) {
      return result;
    }
    uint64_t result = (void *)strcmp((const char *)(a2 + 8), "__TEXT");
    if ((_DWORD)result)
    {
      uint64_t result = (void *)strcmp((const char *)(a2 + 8), "__LINKEDIT");
      if ((_DWORD)result) {
        return result;
      }
      uint64_t v6 = *(void *)(a2 + 24) - *(void *)(a2 + 40) - *(void *)(*(void *)(v5[4] + 8LL) + 24LL);
LABEL_9:
      *(void *)(*(void *)(v5[6] + 8LL) + 24LL) = v6;
      *a3 = 1;
      return result;
    }

    *(void *)(*(void *)(v5[4] + 8LL) + 24LL) = *(void *)(a2 + 24);
    uint64_t v7 = *(void *)(a2 + 40);
  }

  *(void *)(*(void *)(v5[5] + 8LL) + 24LL) = v7;
  return result;
}

uint64_t ___ZNK6mach_o6Header12forEachRPathEU13block_pointerFvPKcRbE_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 == -2147483620) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

uint64_t std::string_view::compare[abi:nn180100]( void *a1, unint64_t a2, size_t a3, void *__s2, size_t a5)
{
  unint64_t v5 = a1[1];
  BOOL v6 = v5 >= a2;
  size_t v7 = v5 - a2;
  if (!v6) {
    abort();
  }
  uint64_t v9 = (const void *)(*a1 + a2);
  if (v7 >= a3) {
    size_t v10 = a3;
  }
  else {
    size_t v10 = v7;
  }
  if (a5 >= v10) {
    size_t v11 = v10;
  }
  else {
    size_t v11 = a5;
  }
  LODWORD(result) = memcmp(v9, __s2, v11);
  if (v10 < a5) {
    unsigned int v13 = -1;
  }
  else {
    unsigned int v13 = 1;
  }
  if (v10 == a5) {
    unsigned int v13 = 0;
  }
  if ((_DWORD)result) {
    return result;
  }
  else {
    return v13;
  }
}

uint64_t mach_o::Symbol::makeRegularExport@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, int a7@<W6>, uint64_t a8@<X8>)
{
  *(void *)a8 = result;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 31) = 0LL;
  *(_BYTE *)(a8 + 33) = a4;
  if (a7) {
    char v8 = 5;
  }
  else {
    char v8 = 4;
  }
  *(_BYTE *)(a8 + 34) = v8;
  *(void *)(a8 + 16) = a3;
  *(void *)(a8 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_8:
    *(_BYTE *)(a8 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a8 + 36) = 1;
  if (a6) {
    goto LABEL_8;
  }
  return result;
}

uint64_t mach_o::Symbol::makeRegularHidden@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0LL;
  *(_BYTE *)(a7 + 33) = a4;
  *(_BYTE *)(a7 + 34) = 2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a7 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeRegularLocal@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0LL;
  *(_BYTE *)(a7 + 33) = a4;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a7 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeRegularWasPrivateExtern@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0LL;
  *(_BYTE *)(a7 + 33) = a4;
  *(_BYTE *)(a7 + 34) = 1;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a7 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeWeakDefExport@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0LL;
  *(_BYTE *)(a7 + 33) = a4;
  *(_WORD *)(a7 + 34) = 260;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a7 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeWeakDefAutoHide@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0LL;
  *(_BYTE *)(a7 + 33) = a4;
  *(_WORD *)(a7 + 34) = 259;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a7 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeWeakDefHidden@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0LL;
  *(_BYTE *)(a7 + 33) = a4;
  *(_WORD *)(a7 + 34) = 258;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a7 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeWeakDefWasPrivateExtern@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0LL;
  *(_BYTE *)(a7 + 33) = a4;
  *(_WORD *)(a7 + 34) = 257;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a7 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeAltEntry@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, int a6@<W5>, int a7@<W6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 31) = 0LL;
  *(_BYTE *)(a9 + 32) = 1;
  *(_BYTE *)(a9 + 33) = a4;
  *(_BYTE *)(a9 + 34) = a5;
  *(_BYTE *)(a9 + 35) = a8;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = 0LL;
  if (!a6)
  {
    if (!a7) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a9 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a9 + 36) = 1;
  if (a7) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeDynamicResolver@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(_DWORD *)(a6 + 32) = 0;
  *(_DWORD *)(a6 + 35) = 0;
  *(_BYTE *)(a6 + 32) = 2;
  *(_BYTE *)(a6 + 34) = 4;
  *(_BYTE *)(a6 + 33) = a3;
  *(void *)(a6 + 16) = a5;
  *(void *)(a6 + 24) = a4;
  return result;
}

uint64_t mach_o::Symbol::makeThreadLocalExport@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, char a7@<W6>, uint64_t a8@<X8>)
{
  *(void *)a8 = result;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 31) = 0LL;
  *(_BYTE *)(a8 + 32) = 5;
  *(_BYTE *)(a8 + 34) = 4;
  *(_BYTE *)(a8 + 33) = a4;
  *(void *)(a8 + 16) = a3;
  *(void *)(a8 + 24) = 0LL;
  *(_BYTE *)(a8 + 35) = a7;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a8 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a8 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeAbsoluteExport@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 31) = 0LL;
  *(_BYTE *)(a5 + 32) = 3;
  *(_BYTE *)(a5 + 34) = 4;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = 0LL;
  if (a4) {
    *(_BYTE *)(a5 + 36) = 1;
  }
  return result;
}

uint64_t mach_o::Symbol::makeAbsoluteLocal@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 31) = 0LL;
  *(_BYTE *)(a5 + 32) = 3;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = 0LL;
  if (a4) {
    *(_BYTE *)(a5 + 36) = 1;
  }
  return result;
}

uint64_t mach_o::Symbol::makeReExport@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(_DWORD *)(a6 + 32) = 0;
  *(_DWORD *)(a6 + 35) = 0;
  *(_BYTE *)(a6 + 32) = 4;
  *(_BYTE *)(a6 + 34) = a5;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  return result;
}

uint64_t mach_o::Symbol::makeUndefined@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 31) = 0LL;
  *(_BYTE *)(a5 + 32) = 7;
  *(_BYTE *)(a5 + 34) = 4;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = 0LL;
  *(_BYTE *)(a5 + 38) = a4;
  return result;
}

uint64_t mach_o::Symbol::makeTentativeDef@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0LL;
  *(_BYTE *)(a7 + 32) = 6;
  *(_BYTE *)(a7 + 34) = 4;
  *(_BYTE *)(a7 + 33) = a4;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a7 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeHiddenTentativeDef@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0LL;
  *(_BYTE *)(a7 + 32) = 6;
  *(_BYTE *)(a7 + 34) = 2;
  *(_BYTE *)(a7 + 33) = a4;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0LL;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(_BYTE *)(a7 + 37) = 1;
    return result;
  }

  *(_BYTE *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::implOffset(mach_o::Symbol *this)
{
  return *((void *)this + 2);
}

BOOL mach_o::Symbol::isDynamicResolver(mach_o::Symbol *this, unint64_t *a2)
{
  int v2 = *((unsigned __int8 *)this + 32);
  if (v2 == 2) {
    *a2 = *((void *)this + 3);
  }
  return v2 == 2;
}

BOOL mach_o::Symbol::isReExport(mach_o::Symbol *this, int *a2, const char **a3)
{
  int v3 = *((unsigned __int8 *)this + 32);
  if (v3 == 4)
  {
    *a2 = *((void *)this + 2);
    uint64_t v4 = (const char *)*((void *)this + 3);
    if (!v4) {
      uint64_t v4 = *(const char **)this;
    }
    *a3 = v4;
  }

  return v3 == 4;
}

BOOL mach_o::Symbol::isAbsolute(mach_o::Symbol *this, unint64_t *a2)
{
  int v2 = *((unsigned __int8 *)this + 32);
  if (v2 == 3) {
    *a2 = *((void *)this + 2);
  }
  return v2 == 3;
}

void mach_o::GenericTrie::recurseTrie( uint64_t a1@<X0>, const unsigned __int8 **a2@<X1>, vm_address_t *a3@<X2>, BOOL *a4@<X3>, _BYTE *a5@<X4>, uint64_t a6@<X5>, mach_o::Error *a7@<X8>)
{
  int v35 = a2;
  uint64_t v9 = *(const unsigned __int8 ***)(a1 + 8);
  if (v9 <= a2)
  {
    mach_o::Error::Error(a7, "malformed trie, node past end");
    return;
  }

  LODWORD(v12) = (_DWORD)a4;
  uint64_t v15 = mach_o::read_uleb128(&v35, v9, &v34, a4);
  if (v34)
  {
LABEL_3:
    mach_o::Error::Error(a7, "malformed uleb128", v32);
    return;
  }

  unsigned int v16 = (unsigned __int8 *)v35 + v15;
  if ((unint64_t)v35 + v15 > *(void *)(a1 + 8))
  {
    mach_o::Error::Error(a7, "malformed trie, terminalSize extends beyond trie data");
    return;
  }

  if (!v15)
  {
    BOOL v17 = *a5 == 0;
LABEL_13:
    unsigned int v19 = *v16;
    unsigned int v18 = v19;
    int v33 = (const unsigned __int8 **)(v16 + 1);
    if (v19) {
      BOOL v20 = !v17;
    }
    else {
      BOOL v20 = 1;
    }
    if (!v20)
    {
      unsigned int v21 = 0;
      vm_address_t v12 = (int)v12;
      vm_address_t v32 = (int)v12;
      while (1)
      {
        uint64_t v22 = v33;
        while (*(_BYTE *)v22)
        {
          vm_address_t v23 = v12 + 1;
          vm_address_t v24 = a3[2];
          if (v12 + 1 != v24)
          {
            if (v24 <= v23)
            {
              dyld3::OverflowSafeArray<char,4294967295ull>::reserve(a3, v12 + 1);
              uint64_t v22 = v33;
            }

            a3[2] = v23;
          }

          int v33 = (const unsigned __int8 **)((char *)v22 + 1);
          char v25 = *(_BYTE *)v22;
          *(_BYTE *)dyld3::OverflowSafeArray<char,4294967295ull>::operator[](a3, v12) = v25;
          uint64_t v22 = v33;
          ++v12;
          if ((unint64_t)v33 > *(void *)(a1 + 8))
          {
            mach_o::Error::Error(a7, "malformed trie node, child node name extends beyond trie data", v32);
            return;
          }
        }

        int v26 = v12 + 1;
        unint64_t v27 = a3[2];
        if (v27 != (_DWORD)v12 + 1)
        {
          vm_address_t v28 = v26;
          if (v27 <= v26)
          {
            dyld3::OverflowSafeArray<char,4294967295ull>::reserve(a3, v26);
            uint64_t v22 = v33;
          }

          a3[2] = v28;
        }

        int v33 = (const unsigned __int8 **)((char *)v22 + 1);
        char v29 = *(_BYTE *)v22;
        *(_BYTE *)dyld3::OverflowSafeArray<char,4294967295ull>::operator[](a3, (int)v12) = v29;
        uint64_t v31 = mach_o::read_uleb128(&v33, *(const unsigned __int8 ***)(a1 + 8), &v34, v30);
        if (v34) {
          goto LABEL_3;
        }
        if (!v31)
        {
          mach_o::Error::Error(a7, "malformed trie, childNodeOffset==0", v32);
          return;
        }

        mach_o::GenericTrie::recurseTrie(a1, *(void *)a1 + v31, a3, v12, a5, a6);
        if (*(void *)a7) {
          return;
        }
        mach_o::Error::~Error(a7);
        ++v21;
        vm_address_t v12 = v32;
        if (v21 >= v18 || *a5) {
          goto LABEL_18;
        }
      }
    }

    goto LABEL_18;
  }

  if (a6) {
    (*(void (**)(uint64_t, vm_address_t))(a6 + 16))(a6, *a3);
  }
  if (!*a5)
  {
    BOOL v17 = 1;
    goto LABEL_13;
  }

LABEL_18:
  *(void *)a7 = 0LL;
}

  *(_DWORD *)(v9 + 24) = v10 + 1;
  return result;
}

void mach_o::GenericTrie::forEachEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (const unsigned __int8 ***)MEMORY[0x1895FE128](a1, a2, a3, a4);
  uint64_t v6 = v5;
  uint64_t v16 = *MEMORY[0x1895FEE08];
  size_t v7 = *v4;
  if (*v4 != v4[1])
  {
    char v14 = 0;
    v10[0] = (vm_address_t)&v15;
    v10[1] = 4096LL;
    uint64_t v13 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    v8[0] = MEMORY[0x1895FED80];
    v8[1] = 0x40000000LL;
    v8[2] = ___ZNK6mach_o11GenericTrie12forEachEntryEU13block_pointerFvRKNS0_5EntryERbE_block_invoke;
    v8[3] = &unk_18962F658;
    v8[4] = v6;
    mach_o::GenericTrie::recurseTrie((uint64_t)v4, v7, v10, 0LL, &v14, (uint64_t)v8, (mach_o::Error *)v9);
    mach_o::Error::~Error((mach_o::Error *)v9);
    uint64_t v11 = 0LL;
    if (v12) {
      MEMORY[0x186DF7B88](*MEMORY[0x1895FFD48], v12, v13);
    }
  }

uint64_t ___ZNK6mach_o11GenericTrie12forEachEntryEU13block_pointerFvRKNS0_5EntryERbE_block_invoke( uint64_t a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v11[0] = __s;
  v11[1] = strlen(__s);
  v11[2] = a3;
  v11[3] = a4;
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  v11,  a5,  v9);
}

vm_address_t dyld3::OverflowSafeArray<char,4294967295ull>::operator[]( vm_address_t *address, vm_address_t a2)
{
  vm_address_t v4 = address[2];
  vm_address_t v5 = a2 + 1;
  if (v4 <= a2 && v4 != v5)
  {
    if (v4 <= v5) {
      dyld3::OverflowSafeArray<char,4294967295ull>::reserve(address, a2 + 1);
    }
    address[2] = v5;
  }

  return *address + a2;
}

mach_o::Error *mach_o::ExportsTrie::terminalPayloadToSymbol@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, BOOL *a3@<X3>, mach_o::Error *a4@<X8>)
{
  uint64_t v7 = *(void *)(a1 + 24);
  int v35 = *(const unsigned __int8 ***)(a1 + 16);
  char v8 = (const unsigned __int8 **)((char *)v35 + v7);
  unint64_t v9 = mach_o::read_uleb128(&v35, (const unsigned __int8 **)((char *)v35 + v7), &v36, a3);
  if (v36) {
    return mach_o::Error::Error(a4, "malformed uleb128");
  }
  char v12 = v9;
  if (v9 < 0x40)
  {
    uint64_t v13 = mach_o::read_uleb128(&v35, v8, &v36, v10);
    if (!v36)
    {
      uint64_t v15 = v13;
      if ((v12 & 3) == 1)
      {
        BOOL v17 = *(const char **)a1;
        if (v17) {
          size_t v18 = strlen(v17);
        }
        else {
          size_t v18 = 0LL;
        }
        uint64_t result = (mach_o::Error *)mach_o::Symbol::makeThreadLocalExport( (uint64_t)v17,  v18,  v15,  0,  0,  0,  (v12 & 4) != 0LL,  (uint64_t)&v33);
        goto LABEL_26;
      }

      if ((v12 & 3) == 2)
      {
        if (*(void *)a1) {
          size_t v16 = strlen(*(const char **)a1);
        }
        else {
          size_t v16 = 0LL;
        }
        uint64_t result = (mach_o::Error *)mach_o::Symbol::makeAbsoluteExport(*(void *)a1, v16, v15, 0, (uint64_t)&v33);
LABEL_26:
        __int128 v25 = *(_OWORD *)v34;
        *(_OWORD *)a2 = v33;
        *(_OWORD *)(a2 + 16) = v25;
        *(void *)(a2 + 31) = *(void *)&v34[15];
LABEL_27:
        *(void *)a4 = 0LL;
        return result;
      }

      if ((v12 & 8) != 0)
      {
        BOOL v20 = *(const char **)a1;
        unsigned int v21 = v35;
        if (*(_BYTE *)v35)
        {
          uint64_t v22 = (const unsigned __int8 **)((char *)v35 + 1);
          do
          {
            int v35 = v22;
            int v23 = *(unsigned __int8 *)v22;
            uint64_t v22 = (const unsigned __int8 **)((char *)v22 + 1);
          }

          while (v23);
          vm_address_t v24 = (const unsigned __int8 **)((char *)v22 - 1);
        }

        else
        {
          vm_address_t v24 = v35;
          unsigned int v21 = (const unsigned __int8 **)v20;
        }

        int v35 = (const unsigned __int8 **)((char *)v24 + 1);
        if (v20) {
          size_t v30 = strlen(v20);
        }
        else {
          size_t v30 = 0LL;
        }
        uint64_t result = (mach_o::Error *)mach_o::Symbol::makeReExport((uint64_t)v20, v30, v15, (uint64_t)v21, 4, (uint64_t)&v33);
        __int128 v31 = *(_OWORD *)v34;
        *(_OWORD *)a2 = v33;
        *(_OWORD *)(a2 + 16) = v31;
        *(void *)(a2 + 31) = *(void *)&v34[15];
        if ((v12 & 4) != 0) {
          *(_BYTE *)(a2 + 35) = 1;
        }
        goto LABEL_27;
      }

      if ((v12 & 0x10) == 0)
      {
        if ((v12 & 4) != 0)
        {
          if (*(void *)a1) {
            size_t v32 = strlen(*(const char **)a1);
          }
          else {
            size_t v32 = 0LL;
          }
          uint64_t result = (mach_o::Error *)mach_o::Symbol::makeWeakDefExport(*(void *)a1, v32, v15, 0, 0, 0, (uint64_t)&v33);
        }

        else
        {
          if (*(void *)a1) {
            size_t v19 = strlen(*(const char **)a1);
          }
          else {
            size_t v19 = 0LL;
          }
          uint64_t result = (mach_o::Error *)mach_o::Symbol::makeRegularExport( *(void *)a1,  v19,  v15,  0,  0,  0,  0,  (uint64_t)&v33);
        }

        goto LABEL_26;
      }

      uint64_t v26 = mach_o::read_uleb128(&v35, v8, &v36, v14);
      if (!v36)
      {
        uint64_t v27 = v26;
        vm_address_t v28 = *(const char **)a1;
        if (v28) {
          size_t v29 = strlen(v28);
        }
        else {
          size_t v29 = 0LL;
        }
        uint64_t result = (mach_o::Error *)mach_o::Symbol::makeDynamicResolver((uint64_t)v28, v29, 1, v15, v27, (uint64_t)&v33);
        goto LABEL_26;
      }
    }

    return mach_o::Error::Error(a4, "malformed uleb128");
  }

  return mach_o::Error::Error(a4, "unknown exports flag bits");
}

void mach_o::ExportsTrie::forEachExportedSymbol(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[0] = MEMORY[0x1895FED80];
  v4[1] = 0x40000000LL;
  v4[2] = ___ZNK6mach_o11ExportsTrie21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolERbE_block_invoke;
  v4[3] = &unk_18962F680;
  void v4[4] = a2;
  void v4[5] = a1;
  mach_o::GenericTrie::forEachEntry(a1, (uint64_t)v4, a3, a4);
}

void ___ZNK6mach_o11ExportsTrie21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolERbE_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  v7[0] = "";
  v7[1] = 0LL;
  v7[2] = 0LL;
  v8[0] = 0LL;
  *(void *)((char *)v8 + 7) = 0LL;
  mach_o::ExportsTrie::terminalPayloadToSymbol(a2, (uint64_t)v7, a4, (mach_o::Error *)&v6);
  uint64_t v5 = v6;
  mach_o::Error::~Error((mach_o::Error *)&v6);
  if (!v5) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void mach_o::ExportsTrie::valid(mach_o::ExportsTrie *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  vm_address_t v4 = (const unsigned __int8 ***)MEMORY[0x1895FE128](this, a2, a3, a4);
  uint64_t v7 = v6;
  char v8 = v5;
  uint64_t v25 = *MEMORY[0x1895FEE08];
  unint64_t v9 = *v4;
  if (*v4 == v4[1])
  {
    *uint64_t v5 = 0LL;
  }

  else
  {
    v20[0] = (vm_address_t)&v24;
    v20[1] = 4096LL;
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v21 = 0LL;
    char v19 = 0;
    uint64_t v13 = 0LL;
    char v14 = &v13;
    uint64_t v15 = 0x3002000000LL;
    size_t v16 = __Block_byref_object_copy__1;
    BOOL v17 = __Block_byref_object_dispose__1;
    uint64_t v18 = 0LL;
    v11[0] = MEMORY[0x1895FED80];
    v11[1] = 0x40000000LL;
    v11[2] = ___ZNK6mach_o11ExportsTrie5validEy_block_invoke;
    v11[3] = &unk_18962F6A8;
    void v11[4] = &v13;
    v11[5] = v4;
    v11[6] = v7;
    mach_o::GenericTrie::recurseTrie((uint64_t)v4, v9, v20, 0LL, &v19, (uint64_t)v11, (mach_o::Error *)&v12);
    if (v12) {
      size_t v10 = &v12;
    }
    else {
      size_t v10 = v14 + 5;
    }
    mach_o::Error::Error(v8, v10);
    mach_o::Error::~Error((mach_o::Error *)&v12);
    _Block_object_dispose(&v13, 8);
    mach_o::Error::~Error((mach_o::Error *)&v18);
    uint64_t v21 = 0LL;
    if (v22) {
      MEMORY[0x186DF7B88](*MEMORY[0x1895FFD48], v22, v23);
    }
  }

void *__Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void ___ZNK6mach_o11ExportsTrie5validEy_block_invoke( uint64_t a1, char *__s, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  v16[0] = __s;
  v16[1] = strlen(__s);
  v16[2] = a3;
  v16[3] = a4;
  v14[0] = "";
  v14[1] = 0LL;
  v14[2] = 0LL;
  v15[0] = 0LL;
  *(void *)((char *)v15 + 7) = 0LL;
  mach_o::ExportsTrie::terminalPayloadToSymbol((uint64_t)v16, (uint64_t)v14, v9, (mach_o::Error *)&v13);
  if (v13)
  {
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), &v13);
    *a5 = 1;
    mach_o::Error::~Error((mach_o::Error *)&v13);
  }

  else
  {
    mach_o::Error::~Error((mach_o::Error *)&v13);
    if (!mach_o::Symbol::isAbsolute((mach_o::Symbol *)v14, &v13)
      && !mach_o::Symbol::isReExport((mach_o::Symbol *)v14, &v12, (const char **)&v11)
      && (unint64_t)mach_o::Symbol::implOffset((mach_o::Symbol *)v14) > *(void *)(a1 + 48))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "vmOffset too large for %s", v14[0]);
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), &v10);
      mach_o::Error::~Error((mach_o::Error *)&v10);
      *a5 = 1;
    }
  }

void *dyld3::OverflowSafeArray<char,4294967295ull>::reserve(void *address, unint64_t a2)
{
  kern_return_t v8;
  uint64_t v9;
  char v10[256];
  uint64_t v11;
  uint64_t v11 = *MEMORY[0x1895FEE08];
  unint64_t v2 = address[1];
  if (v2 < a2)
  {
    uint64_t v3 = (uint64_t)address;
    uint64_t v4 = address[3];
    uint64_t v5 = address + 4;
    unint64_t v6 = 2 * v2;
    if (v6 <= a2) {
      unint64_t v6 = a2;
    }
    vm_size_t v7 = (v6 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148];
    *uint64_t v5 = v7;
    char v8 = vm_allocate(*MEMORY[0x1895FFD48], address + 3, v7, 1006632961);
    if (v8) {
      dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back( v10,  v5,  v8);
    }
    address = memcpy(*(void **)(v3 + 24), *(const void **)v3, *(void *)(v3 + 16));
    unint64_t v9 = *(void *)(v3 + 32);
    *(void *)uint64_t v3 = *(void *)(v3 + 24);
    *(void *)(v3 + 8) = v9;
    if (v4) {
      JUMPOUT(0x186DF7B88LL);
    }
  }

  return address;
}

void *mach_o::ChainedFixups::ChainedFixups(void *this, const dyld_chained_fixups_header *a2, uint64_t a3)
{
  *this = a2;
  this[1] = a3;
  return this;
}

void mach_o::ChainedFixups::forEachBindTarget(mach_o::Error *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZNK6mach_o13ChainedFixups17forEachBindTargetEU13block_pointerFvRKNS_5Fixup10BindTargetERbE_block_invoke;
  v2[3] = &unk_18962F6D0;
  v2[4] = a2;
  mach_o::ChainedFixups::forEachBindTarget(a1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

mach_o::Error *mach_o::ChainedFixups::forEachBindTarget@<X0>( mach_o::Error *result@<X0>, uint64_t a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v4 = *(unsigned int **)result;
  unint64_t v5 = *((void *)result + 1);
  unint64_t v6 = *(unsigned int *)(*(void *)result + 8LL);
  if (v5 < v6) {
    return mach_o::Error::Error(a3, "malformed import table, imports_offset too large");
  }
  unint64_t v7 = v4[3];
  unint64_t v8 = v5 - v7;
  if (v5 < v7) {
    return mach_o::Error::Error(a3, "malformed import table, symbols_offset too large");
  }
  uint64_t v10 = result;
  uint64_t v11 = (char *)v4 + v7;
  char v30 = 0;
  unsigned int v12 = v4[5];
  if (v12 == 3)
  {
    if (v4[4])
    {
      uint64_t v18 = 0LL;
      char v19 = (void *)((char *)v4 + v6 + 8);
      while (1)
      {
        unint64_t v20 = *(v19 - 1);
        if (HIDWORD(v20) > v8) {
          return mach_o::Error::Error(a3, "malformed import table, imports[%d].name_offset (%d) out of range");
        }
        uint64_t v21 = v19 + 2;
        else {
          uint64_t v22 = (__int16)v20;
        }
        uint64_t result = (mach_o::Error *)(*(uint64_t (**)(uint64_t, uint64_t, char *, void, unint64_t, char *))(a2 + 16))( a2,  v22,  &v11[HIDWORD(v20)],  *v19,  (v20 >> 16) & 1,  &v30);
        BOOL v23 = ++v18 < (unint64_t)*(unsigned int *)(*(void *)v10 + 16LL) && v30 == 0;
        char v19 = v21;
        if (!v23) {
          goto LABEL_40;
        }
      }
    }

    goto LABEL_40;
  }

  if (v12 == 2)
  {
    if (v4[4])
    {
      uint64_t v24 = 0LL;
      uint64_t v25 = (int *)((char *)v4 + v6 + 4);
      do
      {
        unint64_t v26 = *(v25 - 1);
        if (v8 < v26 >> 9) {
          return mach_o::Error::Error(a3, "malformed import table, imports[%d].name_offset (%d) out of range");
        }
        uint64_t v27 = v25 + 2;
        else {
          uint64_t v28 = (char)v26;
        }
        uint64_t result = (mach_o::Error *)(*(uint64_t (**)(uint64_t, uint64_t, char *, void, void, char *))(a2 + 16))( a2,  v28,  &v11[v26 >> 9],  *v25,  (v26 >> 8) & 1,  &v30);
        BOOL v29 = ++v24 < (unint64_t)*(unsigned int *)(*(void *)v10 + 16LL) && v30 == 0;
        uint64_t v25 = v27;
      }

      while (v29);
    }

LABEL_40:
    *(void *)a3 = 0LL;
    return result;
  }

  if (v12 != 1) {
    return mach_o::Error::Error(a3, "unknown imports format %d");
  }
  if (!v4[4]) {
    goto LABEL_40;
  }
  uint64_t v13 = 0LL;
  char v14 = (char *)v4 + v6;
  while (1)
  {
    unint64_t v15 = *(unsigned int *)&v14[4 * v13];
    if (v8 < v15 >> 9) {
      return mach_o::Error::Error(a3, "malformed import table, imports[%d].name_offset (%d) out of range");
    }
    else {
      uint64_t v16 = (char)v15;
    }
    uint64_t result = (mach_o::Error *)(*(uint64_t (**)(uint64_t, uint64_t, char *, void, void, char *))(a2 + 16))( a2,  v16,  &v11[v15 >> 9],  0LL,  (v15 >> 8) & 1,  &v30);
  }

uint64_t ___ZNK6mach_o13ChainedFixups17forEachBindTargetEU13block_pointerFvRKNS_5Fixup10BindTargetERbE_block_invoke( uint64_t a1, int a2, char *__s, uint64_t a4, char a5, uint64_t a6)
{
  if (__s) {
    size_t v12 = strlen(__s);
  }
  else {
    size_t v12 = 0LL;
  }
  v14[0] = __s;
  v14[1] = v12;
  int v15 = a2;
  char v16 = a5;
  uint64_t v17 = a4;
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  v14,  a6,  a4);
}

_UNKNOWN **mach_o::ChainedFixups::PointerFormat::make(mach_o::ChainedFixups::PointerFormat *this)
{
  else {
    return off_18962FDD8[(__int16)((_WORD)this - 2)];
  }
}

mach_o::Error *mach_o::ChainedFixups::valid@<X0>( unsigned int **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, mach_o::Error *a5@<X8>)
{
  unint64_t v6 = *a1;
  if (**a1) {
    return mach_o::Error::Error(a5, "chained fixups, unknown header version (%d)");
  }
  unint64_t v9 = v6[1];
  uint64_t v10 = a1[1];
  if ((unint64_t)v10 <= v9)
  {
    size_t v12 = "chained fixups, starts_offset exceeds LC_DYLD_CHAINED_FIXUPS size";
    return mach_o::Error::Error(a5, v12);
  }

  unint64_t v11 = v6[2];
  if ((unint64_t)v10 < v11)
  {
    size_t v12 = "chained fixups, imports_offset exceeds LC_DYLD_CHAINED_FIXUPS size";
    return mach_o::Error::Error(a5, v12);
  }

  int v13 = v6[5] - 1;
  int v14 = v6[4] * dword_1801C2AF0[v13];
  BOOL v15 = __CFADD__((_DWORD)v11, v14);
  unsigned int v16 = v11 + v14;
  if (v15 || v16 > v6[3])
  {
    size_t v12 = "chained fixups, imports array overlaps symbols";
    return mach_o::Error::Error(a5, v12);
  }

  if (v6[6]) {
    return mach_o::Error::Error(a5, "chained fixups, symbols_format unknown (%d)");
  }
  unint64_t v20 = (char *)v6 + v9;
  unint64_t v21 = *(unsigned int *)((char *)v6 + v9);
  if (a4 != v21)
  {
    if (a4 < v21)
    {
      size_t v12 = "chained fixups, seg_count exceeds number of segments";
      return mach_o::Error::Error(a5, v12);
    }

    if (*(void *)(a3 + 56 * (a4 - 1) + 40) != 5LL
      || ((v44 = *(int **)(a3 + 56 * (a4 - 1) + 32), int v45 = *v44, v46 = *((unsigned __int8 *)v44 + 4), v45 == 1413701471)
        ? (BOOL v47 = v46 == 70)
        : (BOOL v47 = 0),
          !v47))
    {
      size_t v12 = "chained fixups, seg_count does not match number of segments";
      return mach_o::Error::Error(a5, v12);
    }
  }

  if (!(_DWORD)v21)
  {
    LOWORD(v32) = 0;
    unsigned int v23 = 0;
LABEL_59:
    v48 = mach_o::ChainedFixups::PointerFormat::make((mach_o::ChainedFixups::PointerFormat *)(unsigned __int16)v32);
    uint64_t result = (mach_o::Error *)(*((uint64_t (**)(_UNKNOWN **, void))*v48 + 9))(v48, 0LL);
    if (!v23) {
      goto LABEL_77;
    }
    unint64_t v49 = a4 - 1;
    if (*(void *)(a3 + 56 * (a4 - 1) + 40) == 10LL)
    {
      uint64_t v50 = *(void *)(a3 + 56 * v49 + 32);
      unint64_t v51 = 0x5F5F4C494E4B4544LL;
      unint64_t v52 = bswap64(*(void *)v50);
      if (v52 == 0x5F5F4C494E4B4544LL
        && (v52 = bswap32(*(unsigned __int16 *)(v50 + 8)) >> 16, unint64_t v51 = 18772LL, (_DWORD)v52 == 18772))
      {
        int v53 = 0;
      }

      else if (v52 < v51)
      {
        int v53 = -1;
      }

      else
      {
        int v53 = 1;
      }

      BOOL v47 = v53 == 0;
      uint64_t v54 = -2LL;
      if (!v47) {
        uint64_t v54 = -1LL;
      }
      unint64_t v49 = v54 + a4;
    }

    if (*(void *)(a3 + 56 * v49) + a2 + *(void *)(a3 + 56 * v49 + 8) > (unint64_t)v23) {
      return mach_o::Error::Error( a5,  "chained fixups, max_valid_pointer (0x%x) too small for image last vm address 0x%llx");
    }
LABEL_77:
    *(void *)a5 = 0LL;
    return result;
  }

  uint64_t v22 = 0LL;
  unsigned int v23 = 0;
  uint64_t v24 = 0LL;
  char v25 = 0;
  unint64_t v26 = (char *)v6 + v11;
  uint64_t v27 = (uint64_t)v6 + v9 + 24;
  while (1)
  {
    uint64_t v28 = *(unsigned int *)&v20[4 * v22 + 4];
    if ((_DWORD)v28) {
      break;
    }
    uint64_t v32 = v24;
LABEL_48:
    ++v22;
    uint64_t v24 = v32;
    if (v22 == v21) {
      goto LABEL_59;
    }
  }

  BOOL v29 = &v20[v28];
  unint64_t v30 = *(unsigned int *)&v20[v28];
  if (v26 - &v20[v28] < (uint64_t)v30) {
    return mach_o::Error::Error( a5,  "chained fixups, dyld_chained_starts_in_segment for segment #%d overruns imports table");
  }
  unsigned int v31 = *((unsigned __int16 *)v29 + 2);
  if (v31 != 4096 && v31 != 0x4000) {
    return mach_o::Error::Error(a5, "chained fixups, page_size not 4KB or 16KB in segment #%d");
  }
  uint64_t v32 = *((unsigned __int16 *)v29 + 3);
  if ((v25 & 1) != 0)
  {
    uint64_t v32 = v24;
  }

  int v33 = *((_DWORD *)v29 + 4);
  if (v33)
  {
    if (v23)
    {
      if (v23 != v33)
      {
        size_t v12 = "chained fixups, different max_valid_pointer values seen in different segments";
        return mach_o::Error::Error(a5, v12);
      }
    }

    else
    {
      unsigned int v23 = *((_DWORD *)v29 + 4);
    }
  }

  uint64_t v34 = *((unsigned __int16 *)v29 + 10);
  if (2 * v34 + 22 > v30)
  {
    size_t v12 = "chained fixups, page_start array overflows size";
    return mach_o::Error::Error(a5, v12);
  }

  if (!*((_WORD *)v29 + 10))
  {
LABEL_47:
    char v25 = 1;
    goto LABEL_48;
  }

  uint64_t v35 = 0LL;
  unint64_t v36 = (v30 - 22) >> 1;
  uint64_t v37 = v27 + v28;
  while (1)
  {
    unsigned int v38 = *(unsigned __int16 *)&v29[2 * v35 + 22];
    if (v38 == 0xFFFF) {
      goto LABEL_38;
    }
    if ((v38 & 0x8000) != 0) {
      break;
    }
    if (v38 > v31) {
      return mach_o::Error::Error(a5, "chained fixups, in segment #%d page_start[%d]=0x%04X exceeds page size");
    }
LABEL_38:
    if (++v35 == v34) {
      goto LABEL_47;
    }
  }

  unsigned int v39 = 0;
  unint64_t v40 = v38 & 0x7FFF;
  v41 = (__int16 *)(v37 + 2 * v40);
  while (1)
  {
    if (v40 > v36) {
      return mach_o::Error::Error(a5, "chain overflow index out of range %d (max=%d) in segment #%d");
    }
    unsigned int v42 = *(v41 - 1) & 0x7FFF;
    if (v42 > v31) {
      return mach_o::Error::Error(a5, "chained fixups, in segment #%d overflow page_start[%d]=0x%04X exceeds page size");
    }
    if (v39 && v42 <= v39) {
      return mach_o::Error::Error( a5,  "chained fixups, in segment #%d overflow page_start[%d]=0x%04X is before previous at 0x%04X\n");
    }
    ++v40;
    int v43 = *v41++;
    unsigned int v39 = v42;
    if (v43 < 0) {
      goto LABEL_38;
    }
  }

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return 1LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return "DYLD_CHAINED_PTR_ARM64E";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return "authenticated arm64e, 8-byte stride, target vmadddr";
}

uint64_t mach_o::PointerFormat_Generic_arm64e::is64(mach_o::PointerFormat_Generic_arm64e *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_Generic_arm64e::supportsAuth(mach_o::PointerFormat_Generic_arm64e *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_Generic_arm64e::minNext(mach_o::PointerFormat_Generic_arm64e *this)
{
  return (*(uint64_t (**)(mach_o::PointerFormat_Generic_arm64e *))(*(void *)this + 120LL))(this);
}

uint64_t mach_o::PointerFormat_Generic_arm64e::maxNext(mach_o::PointerFormat_Generic_arm64e *this)
{
  return 2047 * (*(unsigned int (**)(mach_o::PointerFormat_Generic_arm64e *))(*(void *)this + 120LL))(this);
}

uint64_t mach_o::PointerFormat_Generic_arm64e::maxRebaseTargetOffset( mach_o::PointerFormat_Generic_arm64e *this, int a2)
{
  if (a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0x7FFFFFFFFFFLL;
  }
}

uint64_t mach_o::PointerFormat_Generic_arm64e::supportsBinds(mach_o::PointerFormat_Generic_arm64e *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_Generic_arm64e::maxBindOrdinal(mach_o::PointerFormat_Generic_arm64e *this)
{
  return ~(-1 << (*(uint64_t (**)(mach_o::PointerFormat_Generic_arm64e *))(*(void *)this
                                                                                                 + 112LL))(this));
}

uint64_t mach_o::PointerFormat_Generic_arm64e::bindMaxEmbeddableAddend( mach_o::PointerFormat_Generic_arm64e *this, int a2)
{
  if (a2) {
    return 0LL;
  }
  else {
    return 0x3FFFFLL;
  }
}

uint64_t mach_o::PointerFormat_Generic_arm64e::bindMinEmbeddableAddend( mach_o::PointerFormat_Generic_arm64e *this, int a2)
{
  if (a2) {
    return 0LL;
  }
  else {
    return 4294705153LL;
  }
}

uint64_t mach_o::PointerFormat_Generic_arm64e::nextLocation( mach_o::PointerFormat_Generic_arm64e *this, void *a2)
{
  uint64_t v2 = (*a2 >> 51) & 0x7FFLL;
  if ((_DWORD)v2) {
    return (uint64_t)a2
  }
  else {
    return 0LL;
  }
}

uint64_t mach_o::PointerFormat_Generic_arm64e::parseChainEntry@<X0>( uint64_t result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v8 = *a2;
  if ((*a2 & 0x4000000000000000LL) != 0)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 112LL))(result);
    unint64_t v8 = *a2;
    if ((_DWORD)result == 24)
    {
      uint64_t v12 = *a2 & 0xFFFFFF;
      if ((v8 & 0x8000000000000000LL) == 0)
      {
LABEL_8:
        *(void *)a5 = a2;
        *(void *)(a5 + 8) = a3;
        *(_BYTE *)(a5 + 16) = 0;
        *(_BYTE *)(a5 + 18) &= 0xF8u;
        *(_DWORD *)(a5 + 20) = 0x10000;
        *(_DWORD *)(a5 + 24) = v12;
        *(_DWORD *)(a5 + 28) = HIDWORD(v8) & 0x7FFFF;
        return result;
      }
    }

    else
    {
      LODWORD(v12) = (unsigned __int16)*a2;
      if ((v8 & 0x8000000000000000LL) == 0) {
        goto LABEL_8;
      }
    }

    uint64_t v13 = (v8 >> 49) & 3;
    unint64_t v14 = HIDWORD(v8);
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    char v15 = *(_BYTE *)(a5 + 18) & 0xF8;
    *(_WORD *)(a5 + 22) = 1;
    *(_DWORD *)(a5 + 24) = v12;
    *(_DWORD *)(a5 + 28) = 0;
    *(_BYTE *)(a5 + 16) = 1;
LABEL_12:
    *(_BYTE *)(a5 + 18) = (v8 >> 46) & 4 | v13 | v15;
    *(_WORD *)(a5 + 20) = v14;
    return result;
  }

  if ((v8 & 0x8000000000000000LL) != 0)
  {
    uint64_t v13 = (v8 >> 49) & 3;
    unint64_t v14 = HIDWORD(v8);
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    char v15 = *(_BYTE *)(a5 + 18) & 0xF8;
    *(_WORD *)(a5 + 22) = 0;
    *(void *)(a5 + 24) = v8;
    *(_BYTE *)(a5 + 16) = 1;
    goto LABEL_12;
  }

  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 128LL))(result);
  uint64_t v10 = *a2 & 0x7FFFFFFFFFFLL;
  if ((_DWORD)result) {
    v10 -= a4;
  }
  unint64_t v11 = (*a2 << 13) & 0xFF00000000000000LL | v10;
  *(void *)a5 = a2;
  *(void *)(a5 + 8) = a3;
  *(_BYTE *)(a5 + 16) = 0;
  *(_BYTE *)(a5 + 18) &= 0xF8u;
  *(_DWORD *)(a5 + 20) = 0;
  *(void *)(a5 + 24) = v11;
  return result;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::bindBitCount( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return 16LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::stride( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return 8LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::unauthRebaseIsVmAddr( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 2LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return "DYLD_CHAINED_PTR_64";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return "generic 64-bit, 4-byte stride, target vmadddr";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::is64(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::supportsAuth( mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::minNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 4LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::maxNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 16380LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::maxRebaseTargetOffset( mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 0xFFFFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::supportsBinds( mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::maxBindOrdinal( mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 0xFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::bindMaxEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 255LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::bindMinEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::nextLocation( mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this, void *a2)
{
  if (((*a2 >> 51) & 0xFFF) != 0) {
    return (uint64_t)a2 + 4 * ((*a2 >> 51) & 0xFFF);
  }
  else {
    return 0LL;
  }
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::parseChainEntry@<X0>( uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8 = *a2;
  if (*a2 < 0)
  {
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    *(_BYTE *)(a5 + 16) = 0;
    *(_BYTE *)(a5 + 18) &= 0xF8u;
    *(_DWORD *)(a5 + 20) = 0x10000;
    *(_DWORD *)(a5 + 24) = v8 & 0xFFFFFF;
    *(_DWORD *)(a5 + 28) = BYTE3(v8);
  }

  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 112LL))(result);
    uint64_t v10 = *a2 & 0xFFFFFFFFFLL;
    if ((_DWORD)result) {
      v10 -= a4;
    }
    unint64_t v11 = (*a2 << 20) & 0xFF00000000000000LL | v10;
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    *(_BYTE *)(a5 + 16) = 0;
    *(_BYTE *)(a5 + 18) &= 0xF8u;
    *(_DWORD *)(a5 + 20) = 0;
    *(void *)(a5 + 24) = v11;
  }

  return result;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::unauthRebaseIsVmAddr( mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 3LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return "DYLD_CHAINED_PTR_32";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return "generic 32-bit, 4-byte stride";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::is64(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::supportsAuth( mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::minNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 4LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::maxNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 124LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::maxRebaseTargetOffset( mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0x3FFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::supportsBinds( mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::maxBindOrdinal( mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0xFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::bindMaxEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 63LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::bindMinEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0LL;
}

unsigned int *mach_o::PointerFormat_DYLD_CHAINED_PTR_32::nextLocation( mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this, unsigned int *a2)
{
  unint64_t v2 = ((unint64_t)*a2 >> 26) & 0x1F;
  if ((_DWORD)v2) {
    return &a2[v2];
  }
  else {
    return 0LL;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_32::parseChainEntry( unsigned int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  unsigned int v3 = *a1;
  if ((*a1 & 0x80000000) != 0)
  {
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    *(_BYTE *)(a3 + 16) = 0;
    *(_BYTE *)(a3 + 18) &= 0xF8u;
    *(_DWORD *)(a3 + 24) = v3 & 0xFFFFF;
    *(_DWORD *)(a3 + 28) = (v3 >> 20) & 0x3F;
    char v4 = 1;
  }

  else
  {
    char v4 = 0;
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    *(_BYTE *)(a3 + 16) = 0;
    *(_BYTE *)(a3 + 18) &= 0xF8u;
    *(void *)(a3 + 24) = v3 & 0x3FFFFFF;
  }

  *(_WORD *)(a3 + 20) = 0;
  *(_BYTE *)(a3 + 22) = v4;
  *(_BYTE *)(a3 + 23) = 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 4LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return "DYLD_CHAINED_PTR_32_CACHE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return "generic 32-bit, 4-byte stride";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::is64( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::supportsAuth( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::minNext( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 4LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::maxNext( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 12LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::maxRebaseTargetOffset( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0x3FFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::supportsBinds( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::maxBindOrdinal( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::bindMaxEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::bindMinEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::nextLocation( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this, unsigned int *a2)
{
  unint64_t v2 = *a2;
  else {
    return 0LL;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::parseChainEntry( _DWORD *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3 = *a1 & 0x3FFFFFFF;
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 18) &= 0xF8u;
  *(_DWORD *)(a3 + 20) = 0;
  *(void *)(a3 + 24) = v3;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 5LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return "DYLD_CHAINED_PTR_32_FIRMWARE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return "generic 32-bit, 4-byte stride";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::is64( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::supportsAuth( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::minNext( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 4LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::maxNext( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 124LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::maxRebaseTargetOffset( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0x3FFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::supportsBinds( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::maxBindOrdinal( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0xFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::bindMaxEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::bindMinEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::nextLocation( mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this, unsigned int *a2)
{
  unint64_t v2 = *a2;
  else {
    return 0LL;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::parseChainEntry( _DWORD *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4 = (*a1 & 0x3FFFFFF) - a3;
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = 0;
  *(_BYTE *)(a4 + 18) &= 0xF8u;
  *(_DWORD *)(a4 + 20) = 0;
  *(void *)(a4 + 24) = v4;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET *this)
{
  return 6LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET *this)
{
  return "DYLD_CHAINED_PTR_64_OFFSET";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET *this)
{
  return "generic 64-bit, 4-byte stride, target vmoffset";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET::unauthRebaseIsVmAddr( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return 7LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return "DYLD_CHAINED_PTR_ARM64E_KERNEL";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return "authenticated arm64e, 4-byte stride, target vmoffset";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::bindBitCount( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return 16LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::stride( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return 4LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::unauthRebaseIsVmAddr( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 8LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return "DYLD_CHAINED_PTR_64_KERNEL_CACHE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return "authenticated arm64e, 4-byte stride, for kernel cache";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::is64( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::supportsAuth( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::minNext( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 4LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::maxNext( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 16380LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::maxRebaseTargetOffset( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0x3FFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::supportsBinds( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::maxBindOrdinal( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::bindMaxEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::bindMinEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::nextLocation( mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this, void *a2)
{
  if (((*a2 >> 51) & 0xFFF) != 0) {
    return (uint64_t)a2 + 4 * ((*a2 >> 51) & 0xFFF);
  }
  else {
    return 0LL;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::parseChainEntry( unint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  unint64_t v3 = *a1;
  if ((*a1 & 0x8000000000000000LL) != 0)
  {
    unint64_t v4 = HIDWORD(v3);
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    int v6 = *(_BYTE *)(a3 + 18) & 0xF8;
    *(_BYTE *)(a3 + 16) = 1;
    int v5 = (v3 >> 46) & 4 | (v3 >> 49) & 3 | v6;
  }

  else
  {
    LOWORD(v4) = 0;
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    *(_BYTE *)(a3 + 16) = 0;
    LOBYTE(v5) = *(_BYTE *)(a3 + 18) & 0xF8;
  }

  *(_BYTE *)(a3 + 18) = v5;
  *(_WORD *)(a3 + 20) = v4;
  *(_WORD *)(a3 + 22) = 0;
  *(void *)(a3 + 24) = v3 & 0x3FFFFFFF;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return 9LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return "DYLD_CHAINED_PTR_ARM64E_USERLAND";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return "authenticated arm64e, 8-byte stride, target vmoffset";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::bindBitCount( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return 16LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::stride( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return 8LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::unauthRebaseIsVmAddr( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 10LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return "DYLD_CHAINED_PTR_ARM64E_FIRMWARE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return "authenticated arm64e, 4-byte stride, target vmaddr";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::is64( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::bindBitCount( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 16LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::stride( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 4LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::unauthRebaseIsVmAddr( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 11LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return "DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return "1-byte stride, for x86_64 kernel cache";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::is64( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::supportsAuth( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::minNext( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 1LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::maxNext( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 4095LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::maxRebaseTargetOffset( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0x3FFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::supportsBinds( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::maxBindOrdinal( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::bindMaxEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::bindMinEmbeddableAddend( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::nextLocation( mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this, void *a2)
{
  if ((*a2 & 0x7FF8000000000000LL) != 0) {
    return (uint64_t)a2 + ((*a2 >> 51) & 0xFFFLL);
  }
  else {
    return 0LL;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::parseChainEntry( unint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  unint64_t v3 = *a1;
  if ((*a1 & 0x8000000000000000LL) != 0)
  {
    unint64_t v4 = HIDWORD(v3);
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    int v6 = *(_BYTE *)(a3 + 18) & 0xF8;
    *(_BYTE *)(a3 + 16) = 1;
    int v5 = (v3 >> 46) & 4 | (v3 >> 49) & 3 | v6;
  }

  else
  {
    LOWORD(v4) = 0;
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    *(_BYTE *)(a3 + 16) = 0;
    LOBYTE(v5) = *(_BYTE *)(a3 + 18) & 0xF8;
  }

  *(_BYTE *)(a3 + 18) = v5;
  *(_WORD *)(a3 + 20) = v4;
  *(_WORD *)(a3 + 22) = 0;
  *(void *)(a3 + 24) = v3 & 0x3FFFFFFF;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::value( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return 12LL;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::name( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return "DYLD_CHAINED_PTR_ARM64E_USERLAND24";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::description( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return "authenticated arm64e, 8-byte stride, target vmoffset";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::bindBitCount( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return 24LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::stride( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return 8LL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::unauthRebaseIsVmAddr( mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return 0LL;
}

uint64_t mach_o::BindOpcodes::BindOpcodes(uint64_t this, const unsigned __int8 *a2, uint64_t a3, int a4)
{
  *(void *)this = off_18962FE40;
  *(void *)(this + 8) = a2;
  *(void *)(this + 16) = &a2[a3];
  if (a4) {
    int v4 = 8;
  }
  else {
    int v4 = 4;
  }
  *(_DWORD *)(this + 24) = v4;
  return this;
}

uint64_t mach_o::BindOpcodes::hasDoneBetweenBinds(mach_o::BindOpcodes *this)
{
  return 0LL;
}

uint64_t mach_o::BindOpcodes::implicitLibraryOrdinal(mach_o::BindOpcodes *this)
{
  return 0LL;
}

void mach_o::BindOpcodes::valid( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, char a5@<W4>, char a6@<W5>, void *a7@<X8>)
{
  uint64_t v14 = 0LL;
  char v15 = &v14;
  uint64_t v16 = 0x3002000000LL;
  uint64_t v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  uint64_t v19 = 0LL;
  v9[0] = MEMORY[0x1895FED80];
  v9[1] = 0x40000000LL;
  v9[2] = ___ZNK6mach_o11BindOpcodes5validENSt3__14spanIKNS_13MappedSegmentELm18446744073709551615EEEjbb_block_invoke;
  void v9[3] = &unk_18962FE58;
  v9[4] = &v14;
  v9[5] = a1;
  void v9[6] = a2;
  v9[7] = a3;
  int v10 = a4;
  char v11 = a6;
  char v12 = a5;
  mach_o::BindOpcodes::forEachBind(a1, (uint64_t)v9, (uint64_t)&__block_literal_global, (mach_o::Error *)&v13);
  if (v13) {
    uint64_t v8 = &v13;
  }
  else {
    uint64_t v8 = v15 + 5;
  }
  mach_o::Error::Error(a7, v8);
  mach_o::Error::~Error((mach_o::Error *)&v13);
  _Block_object_dispose(&v14, 8);
  mach_o::Error::~Error((mach_o::Error *)&v19);
}

void *__Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t mach_o::BindOpcodes::forEachBind@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, mach_o::Error *a4@<X8>)
{
  unint64_t v7 = *(uint64_t (***)(uint64_t))a1;
  unint64_t v40 = *(const unsigned __int8 ***)(a1 + 8);
  unsigned int v38 = (*v7)(a1);
  *(_WORD *)unsigned int v39 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8LL))(a1);
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  uint64_t v10 = 0LL;
  char v11 = 0LL;
  char v35 = 0;
  BOOL v12 = (result & 0xFF00000000LL) != 0;
  if ((result & 0xFF00000000LL) != 0) {
    uint64_t v13 = result;
  }
  else {
    uint64_t v13 = 0LL;
  }
  char v14 = 1;
  while (2)
  {
    char v15 = v40;
    uint64_t v16 = *(const unsigned __int8 ***)(a1 + 16);
    if (v40 >= v16)
    {
LABEL_39:
      *(void *)a4 = 0LL;
    }

    else
    {
      uint64_t v18 = (char *)v40 + 1;
      unsigned __int8 v17 = *(_BYTE *)v40;
      unint64_t v40 = (const unsigned __int8 **)((char *)v40 + 1);
      unsigned int v19 = v17 & 0xF;
      switch(v17 >> 4)
      {
        case 0:
          uint64_t result = (**(uint64_t (***)(uint64_t))a1)(a1);
          if ((result & 1) == 0) {
            v39[1] = 1;
          }
          goto LABEL_35;
        case 1:
          BOOL v12 = 1;
          uint64_t v13 = v17 & 0xF;
          goto LABEL_35;
        case 2:
          uint64_t result = mach_o::read_uleb128(&v40, v16, v39, v9);
          uint64_t v13 = result;
          goto LABEL_14;
        case 3:
          unsigned int v20 = *(_DWORD *)&v17 | 0xFFFFFFF0;
          if (v19) {
            uint64_t v13 = v20;
          }
          else {
            uint64_t v13 = 0LL;
          }
LABEL_14:
          BOOL v12 = 1;
          goto LABEL_35;
        case 4:
          if (*v18)
          {
            unint64_t v21 = (const unsigned __int8 **)((char *)v15 + 2);
            do
            {
              unint64_t v40 = v21;
              int v22 = *(unsigned __int8 *)v21;
              unint64_t v21 = (const unsigned __int8 **)((char *)v21 + 1);
            }

            while (v22);
            char v15 = (const unsigned __int8 **)((char *)v21 - 2);
          }

          char v35 = v17 & 1;
          unint64_t v40 = (const unsigned __int8 **)((char *)v15 + 2);
          if (v19 >= 8) {
            uint64_t result = (*(uint64_t (**)(uint64_t, _BYTE *))(a3 + 16))(a3, v18);
          }
          char v14 = 1;
          char v11 = v18;
          goto LABEL_35;
        case 5:
          unsigned int v38 = v17 & 0xF;
          goto LABEL_35;
        case 6:
          uint64_t result = mach_o::read_sleb128(&v40, v16, v39, v9);
          uint64_t v37 = result;
          char v14 = 1;
          goto LABEL_35;
        case 7:
          uint64_t result = mach_o::read_uleb128(&v40, v16, v39, v9);
          uint64_t v10 = result;
          LOBYTE(v36) = v19;
          BYTE4(v36) = 1;
          goto LABEL_35;
        case 8:
          uint64_t result = mach_o::read_uleb128(&v40, v16, v39, v9);
          v10 += result;
          goto LABEL_35;
        case 9:
          LOBYTE(v32) = v14;
          LOBYTE(v31) = v35 & 1;
          uint64_t result = (*(uint64_t (**)(uint64_t, const char *, void, void, void, uint64_t, BOOL, uint64_t, _BYTE *, int, uint64_t, int, unsigned __int8 *))(a2 + 16))( a2,  "BIND_OPCODE_DO_BIND",  v38,  BYTE4(v36) & 1,  v36,  v10,  v12,  v13,  v11,  v31,  v37,  v32,  &v39[1]);
          char v14 = 0;
          uint64_t v23 = *(unsigned int *)(a1 + 24);
          goto LABEL_29;
        case 10:
          LOBYTE(v32) = v14;
          LOBYTE(v31) = v35 & 1;
          (*(void (**)(uint64_t, const char *, void, void, void, uint64_t, BOOL, uint64_t, _BYTE *, int, uint64_t, int, unsigned __int8 *))(a2 + 16))( a2,  "BIND_OPCODE_DO_BIND_ADD_ADDR_ULEB",  v38,  BYTE4(v36) & 1,  v36,  v10,  v12,  v13,  v11,  v31,  v37,  v32,  &v39[1]);
          uint64_t result = mach_o::read_uleb128(&v40, *(const unsigned __int8 ***)(a1 + 16), v39, v24);
          char v14 = 0;
          v10 += result + *(unsigned int *)(a1 + 24);
          goto LABEL_35;
        case 11:
          LOBYTE(v32) = v14;
          LOBYTE(v31) = v35 & 1;
          uint64_t result = (*(uint64_t (**)(uint64_t, const char *, void, void, void, uint64_t, BOOL, uint64_t, _BYTE *, int, uint64_t, int, unsigned __int8 *))(a2 + 16))( a2,  "BIND_OPCODE_DO_BIND_ADD_ADDR_IMM_SCALED",  v38,  BYTE4(v36) & 1,  v36,  v10,  v12,  v13,  v11,  v31,  v37,  v32,  &v39[1]);
          char v14 = 0;
          uint64_t v23 = *(_DWORD *)(a1 + 24) + *(_DWORD *)(a1 + 24) * v19;
LABEL_29:
          v10 += v23;
          goto LABEL_35;
        case 12:
          unint64_t v25 = mach_o::read_uleb128(&v40, v16, v39, v9);
          uint64_t result = mach_o::read_uleb128(&v40, *(const unsigned __int8 ***)(a1 + 16), v39, v26);
          if (v25)
          {
            uint64_t v27 = result;
            int v33 = a4;
            unsigned int v28 = 1;
            do
            {
              LOBYTE(v32) = v14;
              LOBYTE(v31) = v35 & 1;
              uint64_t result = (*(uint64_t (**)(uint64_t, const char *, void, void, void, uint64_t, BOOL, uint64_t, _BYTE *, int, uint64_t, int, unsigned __int8 *))(a2 + 16))( a2,  "BIND_OPCODE_DO_BIND_ULEB_TIMES_SKIPPING_ULEB",  v38,  BYTE4(v36) & 1,  v36,  v10,  v12,  v13,  v11,  v31,  v37,  v32,  &v39[1]);
              char v14 = 0;
              v10 += v27 + *(unsigned int *)(a1 + 24);
              if (v39[1]) {
                break;
              }
              unint64_t v29 = v28++;
            }

            while (v25 > v29);
            a4 = v33;
          }

LABEL_35:
          if (!*(_WORD *)v39) {
            continue;
          }
          if (!v39[0]) {
            goto LABEL_39;
          }
          uint64_t result = (uint64_t)mach_o::Error::Error(a4, "malformed uleb128", v30);
          break;
        case 13:
          return (uint64_t)mach_o::Error::Error(a4, "old arm64e bind opcodes not supported", v30);
        default:
          return (uint64_t)mach_o::Error::Error(a4, "unknown bind opcode 0x%02X");
      }
    }

    return result;
  }

void ___ZNK6mach_o11BindOpcodes5validENSt3__14spanIKNS_13MappedSegmentELm18446744073709551615EEEjbb_block_invoke( uint64_t a1, uint64_t a2, int a3, char a4, unsigned int a5, unint64_t a6, char a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _BYTE *a13)
{
  if ((a4 & 1) == 0)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s missing preceding BIND_OPCODE_SET_SEGMENT_AND_OFFSET_ULEB");
    goto LABEL_7;
  }

  if (*(void *)(a1 + 56) <= (unint64_t)a5)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s segment index %d too large");
    goto LABEL_7;
  }

  if (*(void *)(*(void *)(a1 + 48) + 56LL * a5 + 8)
     - (unint64_t)*(unsigned int *)(*(void *)(a1 + 40) + 24LL) < a6)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s segment offset 0x%08llX beyond segment '%.*s' size (0x%08llX)");
LABEL_7:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), &v18);
    mach_o::Error::~Error((mach_o::Error *)&v18);
    *a13 = 1;
    goto LABEL_8;
  }

  if (!a9)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s missing preceding BIND_OPCODE_SET_SYMBOL_TRAILING_FLAGS_IMM");
    goto LABEL_7;
  }

  if ((a7 & 1) == 0)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s missing preceding BIND_OPCODE_SET_DYLIB_ORDINAL");
    goto LABEL_7;
  }

  if (a8 < 1)
  {
    if (a8 <= -4)
    {
      mach_o::Error::Error((mach_o::Error *)&v18, "%s has unknown library special ordinal (%d)");
      goto LABEL_7;
    }
  }

  else if (*(_DWORD *)(a1 + 64) < a8)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s has library ordinal too large (%d) max (%d)");
    goto LABEL_7;
  }

LABEL_8:
  if ((a3 - 2) < 2)
  {
    if (*(_BYTE *)(a1 + 69))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      if (*(_BYTE *)(v16 + 56LL * a5 + 49))
      {
        mach_o::Error::Error((mach_o::Error *)&v18, "%s text bind is in writable segment");
      }

      else
      {
        if (*(_BYTE *)(v16 + 56LL * a5 + 50)) {
          return;
        }
        mach_o::Error::Error((mach_o::Error *)&v18, "%s text bind is in non-executable segment");
      }
    }

    else
    {
      mach_o::Error::Error((mach_o::Error *)&v18, "%s text binds not supported for architecture");
    }

    goto LABEL_28;
  }

  if (a3 != 1)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s unknown bind type %d");
    goto LABEL_28;
  }

  uint64_t v17 = *(void *)(a1 + 48);
  if (!*(_BYTE *)(v17 + 56LL * a5 + 49) && *(_BYTE *)(a1 + 68))
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s pointer bind is in non-writable segment '%.*s'");
    goto LABEL_28;
  }

  if (*(_BYTE *)(v17 + 56LL * a5 + 50) && *(_BYTE *)(a1 + 68))
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s pointer bind is in executable segment '%.*s'");
LABEL_28:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), &v18);
    mach_o::Error::~Error((mach_o::Error *)&v18);
    *a13 = 1;
  }

    mach_o::Error::Error( (mach_o::Error *)&v17,  "LC_ROUTINES initializer 0x%08llX is not an offset to an executable segment");
LABEL_15:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), &v17);
    mach_o::Error::~Error((mach_o::Error *)&v17);
    *a3 = 1;
    return;
  }

  char v11 = *((void *)a2 + 1);
  BOOL v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v13 = *(void *)(v12 + 248);
  if (!v13)
  {
LABEL_14:
    mach_o::Error::Error( (mach_o::Error *)&v17,  "LC_ROUTINES _64 initializer 0x%08llX is not an offset to an executable segment");
    goto LABEL_15;
  }

  char v14 = *(void *)(v12 + 232);
  char v15 = 24 * v13;
  uint64_t v16 = (unint64_t *)(v14 + 8);
  while (*(v16 - 1) > v11 || *v16 <= v11)
  {
    v16 += 3;
    v15 -= 24LL;
    if (!v15) {
      goto LABEL_14;
    }
  }

void mach_o::BindOpcodes::forEachBindTarget(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x2000000000LL;
  void v5[3] = 0LL;
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  v3[2] = ___ZNK6mach_o11BindOpcodes17forEachBindTargetEU13block_pointerFvRKNS_5Fixup10BindTargetERbEU13block_pointerFvPKcE_block_invoke;
  void v3[3] = &unk_18962FEC0;
  v3[4] = a2;
  void v3[5] = v5;
  mach_o::BindOpcodes::forEachBind(a1, (uint64_t)v3, a3, (mach_o::Error *)v4);
  mach_o::Error::~Error((mach_o::Error *)v4);
  _Block_object_dispose(v5, 8);
}

uint64_t ___ZNK6mach_o11BindOpcodes17forEachBindTargetEU13block_pointerFvRKNS_5Fixup10BindTargetERbEU13block_pointerFvPKcE_block_invoke( uint64_t result, int a2, int a3, uint64_t a4, int a5, int a6, int a7, int a8, char *__s, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (*(char **)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) != __s)
  {
    uint64_t v14 = result;
    if (__s) {
      size_t v15 = strlen(__s);
    }
    else {
      size_t v15 = 0LL;
    }
    v16[0] = __s;
    v16[1] = v15;
    int v17 = a8;
    char v18 = a10;
    uint64_t v19 = a11;
    uint64_t result = (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(v14 + 32) + 16LL))( *(void *)(v14 + 32),  v16,  a13,  a4);
    *(void *)(*(void *)(*(void *)(v14 + 40) + 8LL) + 24LL) = __s;
  }

  return result;
}

uint64_t mach_o::LazyBindOpcodes::hasDoneBetweenBinds(mach_o::LazyBindOpcodes *this)
{
  return 1LL;
}

uint64_t mach_o::NListSymbolTable::NListSymbolTable( uint64_t this, unsigned int a2, const nlist *a3, int a4, const char *a5, int a6, int a7, int a8, unsigned int a9)
{
  *(void *)this = a2;
  *(void *)(this + 8) = a5;
  *(void *)(this + 16) = a3;
  *(void *)(this + 24) = 0LL;
  *(_DWORD *)(this + 32) = a6;
  *(_DWORD *)(this + 36) = a4;
  *(_DWORD *)(this + 40) = a7;
  *(_DWORD *)(this + 44) = a8;
  *(_DWORD *)(this + 48) = a9;
  return this;
}

uint64_t mach_o::NListSymbolTable::NListSymbolTable( uint64_t this, uint64_t a2, const nlist_64 *a3, int a4, const char *a5, int a6, int a7, int a8, unsigned int a9)
{
  *(void *)this = a2;
  *(void *)(this + 8) = a5;
  *(void *)(this + 16) = 0LL;
  *(void *)(this + 24) = a3;
  *(_DWORD *)(this + 32) = a6;
  *(_DWORD *)(this + 36) = a4;
  *(_DWORD *)(this + 40) = a7;
  *(_DWORD *)(this + 44) = a8;
  *(_DWORD *)(this + 48) = a9;
  return this;
}

void mach_o::NListSymbolTable::valid(void *a1@<X8>)
{
  *a1 = 0LL;
}

uint64_t mach_o::NListSymbolTable::symbolFromNList@<X0>( uint64_t this@<X0>, const char *__s@<X1>, unint64_t a3@<X2>, unsigned int a4@<W3>, char a5@<W4>, unsigned int a6@<W5>, void *a7@<X8>)
{
  char v11 = (void *)this;
  switch((a4 >> 1) & 7)
  {
    case 0u:
      if (a3)
      {
        if ((a4 & 0x10) != 0)
        {
          if (__s) {
            size_t v21 = strlen(__s);
          }
          else {
            size_t v21 = 0LL;
          }
          return mach_o::Symbol::makeHiddenTentativeDef( (uint64_t)__s,  v21,  a3,  BYTE1(a6) & 0xF,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (uint64_t)a7);
        }

        else
        {
          if (__s) {
            size_t v12 = strlen(__s);
          }
          else {
            size_t v12 = 0LL;
          }
          return mach_o::Symbol::makeTentativeDef( (uint64_t)__s,  v12,  a3,  BYTE1(a6) & 0xF,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (uint64_t)a7);
        }
      }

      else
      {
        if (__s) {
          size_t v20 = strlen(__s);
        }
        else {
          size_t v20 = 0LL;
        }
        unsigned int v24 = (BYTE1(a6) + 2);
        if (v24 >= 3) {
          int v25 = a6 >> 8;
        }
        else {
          int v25 = v24 - 2;
        }
        return mach_o::Symbol::makeUndefined((uint64_t)__s, v20, v25, (a6 & 0x40) != 0, (uint64_t)a7);
      }

    case 1u:
      if ((a4 & 1) != 0)
      {
        if (__s) {
          size_t v18 = strlen(__s);
        }
        else {
          size_t v18 = 0LL;
        }
        return mach_o::Symbol::makeAbsoluteExport((uint64_t)__s, v18, a3, (a6 >> 5) & 1, (uint64_t)a7);
      }

      else
      {
        if (__s) {
          size_t v13 = strlen(__s);
        }
        else {
          size_t v13 = 0LL;
        }
        return mach_o::Symbol::makeAbsoluteLocal((uint64_t)__s, v13, a3, (a6 >> 5) & 1, (uint64_t)a7);
      }

    case 5u:
      uint64_t v14 = __s;
      if ((a4 & 1) != 0)
      {
        if ((a4 & 0x10) != 0)
        {
          if (__s) {
            size_t v15 = strlen(__s);
          }
          else {
            size_t v15 = 0LL;
          }
          uint64_t v27 = (uint64_t)a7;
          unsigned int v28 = __s;
          uint64_t v29 = (uint64_t)v14;
          char v30 = 2;
        }

        else
        {
          if (__s) {
            size_t v15 = strlen(__s);
          }
          else {
            size_t v15 = 0LL;
          }
          uint64_t v27 = (uint64_t)a7;
          unsigned int v28 = __s;
          uint64_t v29 = (uint64_t)v14;
          char v30 = 4;
        }
      }

      else if ((a4 & 0x10) != 0)
      {
        if (__s) {
          size_t v15 = strlen(__s);
        }
        else {
          size_t v15 = 0LL;
        }
        uint64_t v27 = (uint64_t)a7;
        unsigned int v28 = __s;
        uint64_t v29 = (uint64_t)v14;
        char v30 = 1;
      }

      else
      {
        if (__s) {
          size_t v15 = strlen(__s);
        }
        else {
          size_t v15 = 0LL;
        }
        uint64_t v27 = (uint64_t)a7;
        unsigned int v28 = __s;
        uint64_t v29 = (uint64_t)v14;
        char v30 = 0;
      }

      return mach_o::Symbol::makeReExport((uint64_t)v28, v15, 0, v29, v30, v27);
    case 7u:
      if ((a4 & 1) == 0)
      {
        if ((a6 & 0x200) == 0)
        {
          if ((a4 & 0x10) != 0)
          {
            if ((a6 & 0x80) != 0)
            {
              if (__s) {
                size_t v41 = strlen(__s);
              }
              else {
                size_t v41 = 0LL;
              }
              return mach_o::Symbol::makeWeakDefWasPrivateExtern( (uint64_t)__s,  v41,  a3 - *v11,  a5,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (uint64_t)a7);
            }

            else
            {
              if (__s) {
                size_t v26 = strlen(__s);
              }
              else {
                size_t v26 = 0LL;
              }
              return mach_o::Symbol::makeRegularWasPrivateExtern( (uint64_t)__s,  v26,  a3 - *v11,  a5,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (uint64_t)a7);
            }
          }

          else
          {
            if (__s) {
              size_t v17 = strlen(__s);
            }
            else {
              size_t v17 = 0LL;
            }
            return mach_o::Symbol::makeRegularLocal( (uint64_t)__s,  v17,  a3 - *v11,  a5,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (uint64_t)a7);
          }
        }

        if (__s) {
          size_t v22 = strlen(__s);
        }
        else {
          size_t v22 = 0LL;
        }
        int v31 = (a6 >> 10) & 1;
        int v32 = (a6 >> 5) & 1;
        uint64_t v33 = a3 - *v11;
        int v34 = (a6 >> 7) & 1;
        uint64_t v35 = (uint64_t)a7;
        uint64_t v36 = __s;
        char v37 = a5;
        char v38 = 0;
        return mach_o::Symbol::makeAltEntry((uint64_t)v36, v22, v33, v37, v38, v32, v31, v34, v35);
      }

      if ((a4 & 0x10) != 0)
      {
        if ((a6 & 0x200) != 0)
        {
          if (__s) {
            size_t v22 = strlen(__s);
          }
          else {
            size_t v22 = 0LL;
          }
          int v31 = (a6 >> 10) & 1;
          int v32 = (a6 >> 5) & 1;
          uint64_t v33 = a3 - *v11;
          int v34 = (a6 >> 7) & 1;
          uint64_t v35 = (uint64_t)a7;
          uint64_t v36 = __s;
          char v37 = a5;
          char v38 = 2;
          return mach_o::Symbol::makeAltEntry((uint64_t)v36, v22, v33, v37, v38, v32, v31, v34, v35);
        }

        if ((a6 & 0x80) != 0)
        {
          if (__s) {
            size_t v40 = strlen(__s);
          }
          else {
            size_t v40 = 0LL;
          }
          return mach_o::Symbol::makeWeakDefHidden( (uint64_t)__s,  v40,  a3 - *v11,  a5,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (uint64_t)a7);
        }

        else
        {
          if (__s) {
            size_t v23 = strlen(__s);
          }
          else {
            size_t v23 = 0LL;
          }
          return mach_o::Symbol::makeRegularHidden( (uint64_t)__s,  v23,  a3 - *v11,  a5,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (uint64_t)a7);
        }
      }

      else
      {
        if ((a6 & 0x200) != 0)
        {
          if (__s) {
            size_t v22 = strlen(__s);
          }
          else {
            size_t v22 = 0LL;
          }
          int v31 = (a6 >> 10) & 1;
          int v32 = (a6 >> 5) & 1;
          uint64_t v33 = a3 - *v11;
          int v34 = (a6 >> 7) & 1;
          uint64_t v35 = (uint64_t)a7;
          uint64_t v36 = __s;
          char v37 = a5;
          char v38 = 4;
          return mach_o::Symbol::makeAltEntry((uint64_t)v36, v22, v33, v37, v38, v32, v31, v34, v35);
        }

        if ((~a6 & 0xC0) != 0)
        {
          if ((a6 & 0x80) != 0)
          {
            if (__s) {
              size_t v42 = strlen(__s);
            }
            else {
              size_t v42 = 0LL;
            }
            return mach_o::Symbol::makeWeakDefExport( (uint64_t)__s,  v42,  a3 - *v11,  a5,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (uint64_t)a7);
          }

          else if ((a6 & 0x100) != 0)
          {
            if (__s) {
              size_t v43 = strlen(__s);
            }
            else {
              size_t v43 = 0LL;
            }
            return mach_o::Symbol::makeDynamicResolver((uint64_t)__s, v43, a5, 0LL, a3 - *v11, (uint64_t)a7);
          }

          else
          {
            if (__s) {
              size_t v39 = strlen(__s);
            }
            else {
              size_t v39 = 0LL;
            }
            return mach_o::Symbol::makeRegularExport( (uint64_t)__s,  v39,  a3 - *v11,  a5,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (a6 >> 4) & 1,  (uint64_t)a7);
          }
        }

        else
        {
          if (__s) {
            size_t v19 = strlen(__s);
          }
          else {
            size_t v19 = 0LL;
          }
          return mach_o::Symbol::makeWeakDefAutoHide( (uint64_t)__s,  v19,  a3 - *v11,  a5,  (a6 >> 5) & 1,  (a6 >> 10) & 1,  (uint64_t)a7);
        }
      }

    default:
      a7[3] = 0LL;
      a7[4] = 0LL;
      a7[1] = 0LL;
      a7[2] = 0LL;
      *a7 = "";
      *(void *)((char *)a7 + 31) = 0LL;
      return this;
  }

uint64_t mach_o::NListSymbolTable::forEachExportedSymbol(_DWORD *a1, uint64_t a2)
{
  int v3 = a1[10];
  unsigned int v2 = a1[11];
  if (!*((void *)a1 + 5))
  {
    if (a1[12])
    {
      unsigned int v2 = 0;
    }

    else
    {
      unsigned int v2 = a1[9];
      if (v2)
      {
        v8[0] = MEMORY[0x1895FED80];
        v8[1] = 0x40000000LL;
        void v8[2] = ___ZNK6mach_o16NListSymbolTable21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolEjRbE_block_invoke;
        v8[3] = &unk_18962FF08;
        v8[4] = a2;
        void v8[5] = a1;
        v9[0] = MEMORY[0x1895FED80];
        v9[1] = 0x40000000LL;
        v9[2] = ___ZNK6mach_o16NListSymbolTable13forEachSymbolEU13block_pointerFvPKcyhhtjRbE_block_invoke;
        void v9[3] = &unk_18962FF58;
        v9[4] = v8;
        int v4 = v9;
        int v5 = 0;
        return mach_o::NListSymbolTable::forEachSymbol((uint64_t)a1, v5, v2, (uint64_t)v4);
      }
    }
  }

  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  v7[2] = ___ZNK6mach_o16NListSymbolTable21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolEjRbE_block_invoke_2;
  void v7[3] = &unk_18962FF30;
  v7[4] = a2;
  v7[5] = a1;
  int v4 = v7;
  int v5 = v3;
  return mach_o::NListSymbolTable::forEachSymbol((uint64_t)a1, v5, v2, (uint64_t)v4);
}

uint64_t ___ZNK6mach_o16NListSymbolTable21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolEjRbE_block_invoke( uint64_t result, const char *a2, unint64_t a3, unsigned int a4, char a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  if ((a4 & 1) != 0)
  {
    BOOL v11 = (~a4 & 0xA) == 0 || (a4 & 0xE) == 2;
    if (a4 <= 0x1F && v11)
    {
      v15[9] = v8;
      v15[10] = v9;
      uint64_t v14 = *(void *)(result + 32);
      mach_o::NListSymbolTable::symbolFromNList(*(void *)(result + 40), a2, a3, a4, a5, a6, v15);
      return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v14 + 16))(v14, v15, a7, a8);
    }
  }

  return result;
}

uint64_t mach_o::NListSymbolTable::forEachSymbol(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = a3;
    for (unint64_t i = 1LL; ; ++i)
    {
      uint64_t v9 = *(void *)(a1 + 24);
      if (v9)
      {
        uint64_t v10 = (a2 + i - 1);
        uint64_t v11 = *(unsigned int *)(v9 + 16 * v10);
        uint64_t v12 = *(void *)(a1 + 8) + v11;
        uint64_t v13 = v9 + 16 * v10;
        uint64_t v14 = *(void *)(v13 + 8);
      }

      else
      {
        uint64_t v15 = *(void *)(a1 + 16);
        unsigned int v16 = a2 + i - 1;
        uint64_t v17 = *(unsigned int *)(v15 + 12LL * v16);
        uint64_t v12 = *(void *)(a1 + 8) + v17;
        uint64_t v13 = v15 + 12LL * v16;
        uint64_t v14 = *(unsigned int *)(v13 + 8);
      }

      (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, void))(a4 + 16))( a4,  v12,  v14,  *(unsigned __int8 *)(v13 + 4),  *(unsigned __int8 *)(v13 + 5),  *(unsigned __int16 *)(v13 + 6));
LABEL_9:
      uint64_t result = 0LL;
      if (i >= v6) {
        return result;
      }
    }
  }

  return 0LL;
}

uint64_t ___ZNK6mach_o16NListSymbolTable21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolEjRbE_block_invoke_2( uint64_t result, const char *a2, unint64_t a3, unsigned int a4, char a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  if ((a4 & 1) != 0)
  {
    BOOL v11 = (~a4 & 0xA) == 0 || (a4 & 0xE) == 2;
    if (a4 <= 0x1F && v11)
    {
      v15[9] = v8;
      v15[10] = v9;
      uint64_t v14 = *(void *)(result + 32);
      mach_o::NListSymbolTable::symbolFromNList(*(void *)(result + 40), a2, a3, a4, a5, a6, v15);
      return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v14 + 16))(v14, v15, a7, a8);
    }
  }

  return result;
}

uint64_t ___ZNK6mach_o16NListSymbolTable13forEachSymbolEU13block_pointerFvPKcyhhtjRbE_block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t mach_o::DebugNoteFileInfo::dump(const char **this)
{
  unsigned int v2 = (FILE **)MEMORY[0x1895FEE18];
  fprintf((FILE *)*MEMORY[0x1895FEE18], "scrDir:      %s\n", this[1]);
  fprintf(*v2, "scrName:     %s\n", this[3]);
  fprintf(*v2, "objPath:     %s\n", this[5]);
  fprintf(*v2, "objModTime:  0x%08X\n", *(_DWORD *)this);
  fprintf(*v2, "objSubType:  0X%02X\n", *((unsigned __int8 *)this + 4));
  if (this[8]) {
    int v3 = this[7];
  }
  else {
    int v3 = "N/A";
  }
  fprintf(*v2, "libPath:     %s\n", v3);
  if (this[10]) {
    int v4 = this[9];
  }
  else {
    int v4 = "N/A";
  }
  return fprintf(*v2, "origlibPath: %s\n", v4);
}

mach_o::Image *mach_o::Image::Image(mach_o::Image *this, mach_o::Header *a2, unint64_t a3, int a4)
{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = 0LL;
  *((_BYTE *)this + 24) = a4;
  *((_BYTE *)this + 25) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  if ((a4 - 1) >= 2)
  {
    int v7 = 0;
    if (a4 != 3) {
      goto LABEL_6;
    }
    BOOL hasZerofillExpansion = mach_o::Image::inferIfZerofillExpanded((mach_o::Header **)this);
  }

  else
  {
    BOOL hasZerofillExpansion = mach_o::Header::hasZerofillExpansion(a2);
  }

  int v7 = hasZerofillExpansion;
  *((_BYTE *)this + 25) = hasZerofillExpansion;
LABEL_6:
  *((void *)this + 2) = mach_o::Header::computeLinkEditBias(*(mach_o::Header **)this, v7);
  mach_o::Header::validStructureLoadCommands(*(mach_o::Header **)this, a3, (mach_o::Error *)v11);
  uint64_t v8 = v11[0];
  mach_o::Error::~Error((mach_o::Error *)v11);
  if (!v8)
  {
    mach_o::Image::makeExportsTrie((mach_o::Error **)this);
    mach_o::Image::makeSymbolTable((mach_o::Header **)this);
    mach_o::Image::makeRebaseOpcodes((mach_o::Error **)this);
    mach_o::Image::makeBindOpcodes((mach_o::Error **)this);
    mach_o::Image::makeLazyBindOpcodes((mach_o::Error **)this);
    mach_o::Image::makeWeakBindOpcodes((mach_o::Error **)this);
    mach_o::Image::makeChainedFixups((mach_o::Error **)this);
    mach_o::Image::makeFunctionStarts((mach_o::Error **)this);
    uint64_t v9 = *(mach_o::Error **)this;
    v11[0] = MEMORY[0x1895FED80];
    v11[1] = 0x40000000LL;
    v11[2] = ___ZN6mach_o5Image17makeCompactUnwindEv_block_invoke;
    v11[3] = &__block_descriptor_tmp_70;
    void v11[4] = this;
    mach_o::Header::forEachSection(v9, (uint64_t)v11);
    mach_o::Image::makeSplitSegInfo((mach_o::Error **)this);
  }

  return this;
}

BOOL mach_o::Image::inferIfZerofillExpanded(mach_o::Header **this)
{
  if (mach_o::Header::isPreload(*this)
    || mach_o::Header::isFileSet(*this)
    || !mach_o::Header::hasZerofillExpansion(*this))
  {
    return 0LL;
  }

  if (!mach_o::Header::hasCodeSignature(*this, &v8, &v7)
    || (unint64_t)this[1] <= v8
    || (v2 = *this, int v3 = *(_DWORD *)((char *)*this + v8), v4 = v3 != -1072898310)
    && (uint64_t v5 = mach_o::Header::zerofillExpansionAmount(v2), *(_DWORD *)((char *)v2 + v5 + v8) != -1072898310))
  {
    __assert_rtn("inferIfZerofillExpanded", "Image.cpp", 148, "false && handle unsigned");
  }

  return v4;
}

void mach_o::Image::makeExportsTrie(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZN6mach_o5Image15makeExportsTrieEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_60;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeSymbolTable(mach_o::Header **this)
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  uint64_t v19 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  unsigned int v2 = *this;
  v10[0] = MEMORY[0x1895FED80];
  v10[1] = 0x40000000LL;
  vm_address_t v10[2] = ___ZN6mach_o5Image15makeSymbolTableEv_block_invoke;
  void v10[3] = &unk_1896300E0;
  v10[4] = &v16;
  v10[5] = &v12;
  mach_o::Header::forEachLoadCommand(v2, (uint64_t)v10, (mach_o::Error *)v11);
  mach_o::Error::~Error((mach_o::Error *)v11);
  if (v17[3])
  {
    int v3 = (_DWORD *)v13[3];
    if (v3)
    {
      int v4 = v3[3];
      int v5 = v3[5];
      unsigned int v6 = v3[7];
    }

    else
    {
      unsigned int v6 = 0;
      int v5 = 0;
      int v4 = 0;
    }

    BOOL v7 = mach_o::Header::is64(*this);
    uint64_t Address = mach_o::Header::preferredLoadAddress(*this);
    if (v7) {
      uint64_t v9 = mach_o::NListSymbolTable::NListSymbolTable( (uint64_t)(this + 16),  Address,  (const nlist_64 *)((char *)this[2] + *(unsigned int *)(v17[3] + 8)),  *(_DWORD *)(v17[3] + 12),  (const char *)this[2] + *(unsigned int *)(v17[3] + 16),  *(_DWORD *)(v17[3] + 20),  v4,  v5,  v6);
    }
    else {
      uint64_t v9 = mach_o::NListSymbolTable::NListSymbolTable( (uint64_t)(this + 16),  Address,  (const nlist *)((char *)this[2] + *(unsigned int *)(v17[3] + 8)),  *(_DWORD *)(v17[3] + 12),  (const char *)this[2] + *(unsigned int *)(v17[3] + 16),  *(_DWORD *)(v17[3] + 20),  v4,  v5,  v6);
    }
    this[5] = (mach_o::Header *)v9;
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

void mach_o::Image::makeRebaseOpcodes(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZN6mach_o5Image17makeRebaseOpcodesEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_62;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeBindOpcodes(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZN6mach_o5Image15makeBindOpcodesEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_63;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeLazyBindOpcodes(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZN6mach_o5Image19makeLazyBindOpcodesEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_64;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeWeakBindOpcodes(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZN6mach_o5Image19makeWeakBindOpcodesEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_65;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeChainedFixups(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZN6mach_o5Image17makeChainedFixupsEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_66;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeFunctionStarts(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZN6mach_o5Image18makeFunctionStartsEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_67;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeSplitSegInfo(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = ___ZN6mach_o5Image16makeSplitSegInfoEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_71;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

mach_o::Image *mach_o::Image::Image(mach_o::Image *this, mach_header *a2)
{
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  *(void *)this = a2;
  *((_BYTE *)this + 24) = 2;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  BOOL hasZerofillExpansion = mach_o::Header::hasZerofillExpansion((mach_o::Header *)a2);
  *((_BYTE *)this + 25) = hasZerofillExpansion;
  *((void *)this + 2) = mach_o::Header::computeLinkEditBias(*(mach_o::Header **)this, hasZerofillExpansion);
  mach_o::Image::makeExportsTrie((mach_o::Error **)this);
  mach_o::Image::makeSymbolTable((mach_o::Header **)this);
  mach_o::Image::makeRebaseOpcodes((mach_o::Error **)this);
  mach_o::Image::makeBindOpcodes((mach_o::Error **)this);
  mach_o::Image::makeLazyBindOpcodes((mach_o::Error **)this);
  mach_o::Image::makeWeakBindOpcodes((mach_o::Error **)this);
  mach_o::Image::makeChainedFixups((mach_o::Error **)this);
  mach_o::Image::makeFunctionStarts((mach_o::Error **)this);
  int v4 = *(mach_o::Error **)this;
  v6[0] = MEMORY[0x1895FED80];
  v6[1] = 0x40000000LL;
  v6[2] = ___ZN6mach_o5Image17makeCompactUnwindEv_block_invoke;
  void v6[3] = &__block_descriptor_tmp_70;
  v6[4] = this;
  mach_o::Header::forEachSection(v4, (uint64_t)v6);
  mach_o::Image::makeSplitSegInfo((mach_o::Error **)this);
  return this;
}

void mach_o::Image::validate(mach_o::Image *this@<X0>, mach_o::Error *a2@<X8>)
{
  if (!*(void *)a2)
  {
    mach_o::Error::~Error(a2);
    mach_o::Header::arch(*(mach_header **)this, &v5);
    mach_o::Header::platformAndVersions(*(mach_o::Header **)this, (uint64_t)v4);
    mach_o::Policy::Policy(v6, &v5, v4, *(unsigned int *)(*(void *)this + 12LL), 0LL, 0LL);
    mach_o::Image::validInitializers((mach_o::Header **)this, a2);
    if (!*(void *)a2)
    {
      mach_o::Error::~Error(a2);
      mach_o::Image::validLinkedit((mach_o::Header **)this, (const mach_o::Policy *)v6, a2);
      if (!*(void *)a2)
      {
        mach_o::Error::~Error(a2);
        *(void *)a2 = 0LL;
      }
    }
  }

void mach_o::Image::validInitializers(mach_o::Header **this@<X0>, mach_o::Error *a2@<X8>)
{
  uint64_t Address = mach_o::Header::preferredLoadAddress(*this);
  uint64_t Slide = mach_o::Header::getSlide(*this);
  uint64_t v24 = 0LL;
  int v25 = &v24;
  uint64_t v26 = 0x3002000000LL;
  uint64_t v27 = __Block_byref_object_copy__3;
  unsigned int v28 = __Block_byref_object_dispose__3;
  uint64_t v29 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x10002000000LL;
  size_t v20 = __Block_byref_object_copy__42;
  size_t v21 = __Block_byref_object_dispose__43;
  v22[24] = v22;
  __int128 v23 = xmmword_1801C2B30;
  uint64_t v7 = MEMORY[0x1895FED80];
  unsigned int v8 = *this;
  v16[0] = MEMORY[0x1895FED80];
  v16[1] = 0x40000000LL;
  void v16[2] = ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke;
  v16[3] = &unk_189630020;
  void v16[4] = &v17;
  mach_o::Header::forEachSegment(v8, (uint64_t)v16);
  if (v18[31])
  {
    uint64_t v9 = *this;
    v15[0] = v7;
    v15[1] = 0x40000000LL;
    void v15[2] = ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_2;
    v15[3] = &unk_189630048;
    v15[4] = &v17;
    v15[5] = &v24;
    mach_o::Header::forEachLoadCommandSafe(v9, (uint64_t)v15);
    uint64_t v10 = *this;
    v14[0] = v7;
    v14[1] = 0x40000000LL;
    void v14[2] = ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_3;
    void v14[3] = &unk_189630070;
    v14[4] = &v24;
    v14[5] = &v17;
    v14[6] = this;
    v14[7] = Address;
    mach_o::Header::forEachSection(v10, (uint64_t)v14);
    BOOL v11 = v25 + 5;
    if (v25[5]) {
      goto LABEL_4;
    }
    uint64_t v12 = *this;
    v13[0] = v7;
    v13[1] = 0x40000000LL;
    v13[2] = ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_4;
    v13[3] = &unk_189630098;
    v13[4] = &v24;
    v13[5] = &v17;
    v13[6] = Slide;
    v13[7] = Address;
    mach_o::Header::forEachSection(v12, (uint64_t)v13);
    BOOL v11 = v25 + 5;
    if (v25[5]) {
LABEL_4:
    }
      mach_o::Error::Error(a2, v11);
    else {
      *(void *)a2 = 0LL;
    }
  }

  else
  {
    mach_o::Error::Error(a2, "no executable segments");
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);
  mach_o::Error::~Error((mach_o::Error *)&v29);
}

void mach_o::Image::validLinkedit( mach_o::Header **this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v37 = *MEMORY[0x1895FEE08];
  mach_o::Image::validStructureLinkedit(this, a2, a3);
  if (!*(void *)a3)
  {
    mach_o::Error::~Error(a3);
    unsigned int v8 = this[4];
    if (v8)
    {
      mach_o::ExportsTrie::valid(v8, 0x200000000LL, v6, v7);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }

    if (this[5])
    {
      mach_o::NListSymbolTable::valid(a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }

    uint64_t v9 = mach_o::Image::segmentCount(this);
    unint64_t v10 = v9;
    int v14 = MEMORY[0x1895FE128](v9, v11, v12, v13);
    uint64_t v16 = (char *)v35 - v15;
    if (v14)
    {
      uint64_t v17 = v16 + 32;
      uint64_t v18 = 56 * v10;
      do
      {
        *uint64_t v17 = 0LL;
        v17[1] = 0LL;
        v17 += 7;
        v18 -= 56LL;
      }

      while (v18);
      uint64_t v19 = 0LL;
      size_t v20 = v16;
      do
      {
        mach_o::Image::segment(this, v19, (uint64_t)v35);
        __int128 v21 = v35[1];
        *(_OWORD *)size_t v20 = v35[0];
        *((_OWORD *)v20 + 1) = v21;
        *((_OWORD *)v20 + 2) = *(_OWORD *)v36;
        *(_DWORD *)(v20 + 47) = *(_DWORD *)&v36[15];
        ++v19;
        v20 += 56;
      }

      while (v10 != v19);
    }

    uint64_t v22 = (uint64_t)this[6];
    if (v22)
    {
      BOOL HaveTextFixups = mach_o::Header::mayHaveTextFixups(*this);
      char Cmds = mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2);
      mach_o::RebaseOpcodes::valid(v22, (uint64_t)v16, v10, (BOOL *)HaveTextFixups, Cmds, a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }

    uint64_t v25 = (uint64_t)this[7];
    if (v25)
    {
      int v26 = mach_o::Header::linkedDylibCount(*this, 0LL);
      char v27 = mach_o::Header::mayHaveTextFixups(*this);
      char v28 = mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2);
      mach_o::BindOpcodes::valid(v25, (uint64_t)v16, v10, v26, v27, v28, a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }

    uint64_t v29 = (uint64_t)this[8];
    if (v29)
    {
      int v30 = mach_o::Header::linkedDylibCount(*this, 0LL);
      char v31 = mach_o::Header::mayHaveTextFixups(*this);
      char v32 = mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2);
      mach_o::BindOpcodes::valid(v29, (uint64_t)v16, v10, v30, v31, v32, a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }

    uint64_t v33 = (unsigned int **)this[10];
    if (v33)
    {
      uint64_t Address = mach_o::Header::preferredLoadAddress(*this);
      mach_o::ChainedFixups::valid(v33, Address, (uint64_t)v16, v10, a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }

    *(void *)a3 = 0LL;
  }

void mach_o::Image::validStructureLinkedit( mach_o::Header **this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v88 = *MEMORY[0x1895FEE08];
  int v6 = mach_o::Header::pointerSize(*this);
  uint64_t v82 = 0LL;
  v83 = &v82;
  uint64_t v84 = 0x2000000000LL;
  v85 = v86;
  uint64_t v78 = 0LL;
  v79 = &v78;
  uint64_t v80 = 0x2000000000LL;
  int v81 = 0;
  uint64_t v74 = 0LL;
  v75 = &v74;
  uint64_t v76 = 0x2000000000LL;
  int v77 = 0;
  uint64_t v70 = 0LL;
  v71 = &v70;
  uint64_t v72 = 0x2000000000LL;
  char v73 = 0;
  uint64_t v66 = 0LL;
  v67 = &v66;
  uint64_t v68 = 0x2000000000LL;
  char v69 = 0;
  uint64_t v62 = 0LL;
  v63 = &v62;
  uint64_t v64 = 0x2000000000LL;
  char v65 = 0;
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x2000000000LL;
  char v61 = 0;
  uint64_t v54 = 0LL;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x2000000000LL;
  char v57 = 0;
  uint64_t v48 = 0LL;
  unint64_t v49 = &v48;
  uint64_t v50 = 0x3002000000LL;
  unint64_t v51 = __Block_byref_object_copy__3;
  unint64_t v52 = __Block_byref_object_dispose__3;
  uint64_t v53 = 0LL;
  uint64_t v7 = *this;
  uint64_t v8 = MEMORY[0x1895FED80];
  v45[0] = MEMORY[0x1895FED80];
  v45[1] = 0x40000000LL;
  v45[2] = ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke;
  v45[3] = &unk_18962FF80;
  v45[4] = &v78;
  v45[5] = &v48;
  int v46 = v6;
  v45[6] = &v82;
  v45[7] = &v70;
  v45[8] = &v74;
  v45[9] = &v66;
  v45[10] = &v62;
  v45[11] = &v58;
  v45[12] = &v54;
  mach_o::Header::forEachLoadCommand(v7, (uint64_t)v45, (mach_o::Error *)v47);
  mach_o::Error::~Error((mach_o::Error *)v47);
  if (v49[5])
  {
    mach_o::Error::Error(a3, v49 + 5);
  }

  else
  {
    if (*((_BYTE *)v71 + 24) && *((_DWORD *)v79 + 6) != *((_DWORD *)v75 + 6))
    {
      mach_o::Error::Error(a3, "symbol count from symbol table and dynamic symbol table differ");
      goto LABEL_57;
    }

    if (*((_BYTE *)v59 + 24) && mach_o::Policy::enforceOneFixupEncoding(a2))
    {
      if (*((_BYTE *)v67 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_INFO_ONLY and local relocations");
        goto LABEL_57;
      }

      if (*((_BYTE *)v63 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_INFO_ONLY and external relocations");
        goto LABEL_57;
      }
    }

    if (*((_BYTE *)v55 + 24))
    {
      if (*((_BYTE *)v67 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_CHAINED_FIXUPS and local relocations");
        goto LABEL_57;
      }

      if (*((_BYTE *)v63 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_CHAINED_FIXUPS and external relocations");
        goto LABEL_57;
      }

      if (*((_BYTE *)v59 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_INFO and LC_DYLD_CHAINED_FIXUPS");
        goto LABEL_57;
      }
    }

    uint64_t v41 = 0LL;
    size_t v42 = &v41;
    uint64_t v43 = 0x2000000000LL;
    uint64_t v44 = 0LL;
    uint64_t v37 = 0LL;
    char v38 = &v37;
    uint64_t v39 = 0x2000000000LL;
    uint64_t v40 = 0LL;
    if (mach_o::Header::isObjectFile(*this) || mach_o::Header::isPreload(*this))
    {
      uint64_t v9 = *this;
      v36[0] = v8;
      v36[1] = 0x40000000LL;
      v36[2] = ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_2;
      v36[3] = &unk_18962FFA8;
      v36[4] = &v41;
      mach_o::Header::forEachSection(v9, (uint64_t)v36);
      v38[3] = (uint64_t)this[1];
      if (!v42[3])
      {
        unint64_t v10 = *this;
        v35[0] = v8;
        v35[1] = 0x40000000LL;
        _OWORD v35[2] = ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_3;
        v35[3] = &unk_18962FFD0;
        v35[4] = &v41;
        mach_o::Header::forEachLoadCommandSafe(v10, (uint64_t)v35);
      }
    }

    else
    {
      uint64_t v11 = *this;
      v33[0] = v8;
      v33[1] = 0x40000000LL;
      v33[2] = ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_4;
      v33[3] = &unk_18962FFF8;
      v33[4] = &v41;
      v33[5] = &v37;
      mach_o::Header::forEachLoadCommand(v11, (uint64_t)v33, (mach_o::Error *)v34);
      mach_o::Error::~Error((mach_o::Error *)v34);
      if (!v42[3] || !v38[3])
      {
        mach_o::Error::Error(a3, "bad or unknown fileoffset/size for LINKEDIT");
        goto LABEL_56;
      }
    }

    uint64_t v12 = v83[3] - (void)v86;
    if (v12)
    {
      unint64_t v13 = v12 / 24;
      if (v13 != 1)
      {
        uint64_t v14 = 0LL;
        unsigned int v15 = 0;
        do
        {
          unint64_t v16 = v13 + ~v14;
          if (!v16) {
            break;
          }
          unint64_t v17 = 0LL;
          unsigned int v18 = 1;
          char v19 = 1;
          do
          {
            unint64_t v20 = v18;
            if (*(_DWORD *)&v86[24 * v17 + 12] > *(_DWORD *)&v86[24 * v18 + 12])
            {
              char v19 = 0;
              __int128 v21 = &v86[24 * v18];
              uint64_t v22 = &v86[24 * v17];
              uint64_t v23 = *((void *)v22 + 2);
              __int128 v24 = *(_OWORD *)v22;
              uint64_t v25 = *((void *)v21 + 2);
              *(_OWORD *)uint64_t v22 = *(_OWORD *)v21;
              *((void *)v22 + 2) = v25;
              *(_OWORD *)__int128 v21 = v24;
              *((void *)v21 + 2) = v23;
            }

            unsigned int v18 = v20 + 1;
            unint64_t v17 = v20;
          }

          while (v16 > v20);
          uint64_t v14 = ++v15;
        }

        while (!(v19 & 1 | (v13 - 1 <= v15)));
      }

      if (v13 <= 1) {
        uint64_t v26 = 1LL;
      }
      else {
        uint64_t v26 = v13;
      }
      unint64_t v27 = v87;
      if (v42[3] > (unint64_t)v87)
      {
LABEL_51:
        mach_o::Error::Error(a3, "LINKEDIT overlap of %s and %s");
        goto LABEL_56;
      }

      char v28 = v86;
      while (1)
      {
        uint64_t v29 = *((void *)v28 + 2);
        BOOL v30 = __CFADD__(v27, v29);
        unint64_t v31 = v27 + v29;
        if (v30 || v31 > v38[3])
        {
          mach_o::Error::Error(a3, "LINKEDIT content '%s' extends beyond end of segment");
          goto LABEL_56;
        }

        if (((*((_DWORD *)v28 + 2) - 1) & v27) != 0)
        {
          if (!strcmp(*(const char **)v28, "code signature"))
          {
            if (mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2))
            {
              mach_o::Error::Error(a3, "mis-aligned code signature");
              goto LABEL_56;
            }
          }

          else if (mach_o::Policy::enforceLinkeditContentAlignment(a2))
          {
            mach_o::Error::Error(a3, "mis-aligned LINKEDIT content '%s'");
            goto LABEL_56;
          }
        }

        if (!--v26) {
          goto LABEL_40;
        }
        unint64_t v32 = *((void *)v28 + 2) + *((unsigned int *)v28 + 3);
        unint64_t v27 = *((unsigned int *)v28 + 9);
        v28 += 24;
        if (v32 > v27) {
          goto LABEL_51;
        }
      }
    }

    if (mach_o::Header::isObjectFile(*this)) {
LABEL_40:
    }
      *(void *)a3 = 0LL;
    else {
      mach_o::Error::Error(a3, "malformed mach-o has no LINKEDIT information");
    }
LABEL_56:
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
  }

LABEL_57:
  _Block_object_dispose(&v48, 8);
  mach_o::Error::~Error((mach_o::Error *)&v53);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);
}

  ++*(_DWORD *)(*(void *)(v30 + 8) + 24LL);
  return result;
}

uint64_t mach_o::Image::segmentCount(mach_o::Error **this)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  int v9 = 0;
  uint64_t v1 = *this;
  v4[0] = MEMORY[0x1895FED80];
  v4[1] = 0x40000000LL;
  v4[2] = ___ZNK6mach_o5Image12segmentCountEv_block_invoke;
  v4[3] = &unk_189630208;
  void v4[4] = &v6;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v4, (mach_o::Error *)v5);
  mach_o::Error::~Error((mach_o::Error *)v5);
  uint64_t v2 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void mach_o::Image::segment(mach_o::Error **this@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x6002000000LL;
  unint64_t v16 = __Block_byref_object_copy__73;
  unint64_t v17 = __Block_byref_object_dispose__74;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2000000000LL;
  int v12 = 0;
  v10[0] = 0LL;
  v10[1] = v10;
  vm_address_t v10[2] = 0x2000000000LL;
  void v10[3] = 0LL;
  int v4 = *this;
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  v7[2] = ___ZNK6mach_o5Image7segmentEj_block_invoke;
  void v7[3] = &unk_189630230;
  v7[4] = v10;
  v7[5] = v11;
  int v8 = a2;
  void v7[6] = &v13;
  void v7[7] = this;
  mach_o::Header::forEachLoadCommand(v4, (uint64_t)v7, (mach_o::Error *)v9);
  mach_o::Error::~Error((mach_o::Error *)v9);
  cpu_type_t v5 = v14;
  __int128 v6 = *(_OWORD *)(v14 + 7);
  *(_OWORD *)a3 = *(_OWORD *)(v14 + 5);
  *(_OWORD *)(a3 + 16) = v6;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(v5 + 9);
  *(void *)(a3 + 48) = v5[11];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
}

void *__Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke(uint64_t a1, int *a2, _BYTE *a3)
{
  int v5 = *a2;
  if (*a2 > 28)
  {
    switch(v5)
    {
      case 29:
        unsigned int v6 = a2[3];
        if (!v6) {
          return;
        }
        int v7 = *(_DWORD *)(a1 + 104);
        int v8 = a2[2];
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v10 = *(void *)(v9 + 24);
        *(void *)(v9 + 24) = v10 + 24;
        uint64_t v11 = "code signature";
        goto LABEL_48;
      case 30:
        unsigned int v6 = a2[3];
        if (!v6) {
          return;
        }
        int v7 = *(_DWORD *)(a1 + 104);
        int v8 = a2[2];
        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v10 = *(void *)(v14 + 24);
        *(void *)(v14 + 24) = v10 + 24;
        uint64_t v11 = "shared cache info";
        goto LABEL_48;
      case 31:
      case 32:
      case 33:
      case 35:
      case 36:
      case 37:
        return;
      case 34:
        goto LABEL_35;
      case 38:
        unsigned int v6 = a2[3];
        if (!v6) {
          return;
        }
        int v7 = *(_DWORD *)(a1 + 104);
        int v8 = a2[2];
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v10 = *(void *)(v15 + 24);
        *(void *)(v15 + 24) = v10 + 24;
        uint64_t v11 = "function starts";
        goto LABEL_48;
      default:
        if (v5 != 41)
        {
          if (v5 == 54)
          {
            unsigned int v6 = a2[3];
            if (v6)
            {
              int v7 = *(_DWORD *)(a1 + 104);
              int v8 = a2[2];
              uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
              uint64_t v10 = *(void *)(v13 + 24);
              *(void *)(v13 + 24) = v10 + 24;
              uint64_t v11 = "atom info";
              goto LABEL_48;
            }
          }

          return;
        }

        unsigned int v6 = a2[3];
        if (!v6) {
          return;
        }
        int v7 = *(_DWORD *)(a1 + 104);
        int v8 = a2[2];
        uint64_t v46 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v10 = *(void *)(v46 + 24);
        *(void *)(v46 + 24) = v10 + 24;
        uint64_t v11 = "data in code";
        break;
    }

    goto LABEL_48;
  }

  if (v5 <= -2147483597)
  {
    if (v5 == -2147483614)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 1;
LABEL_35:
      uint64_t v25 = a2[3];
      if ((_DWORD)v25)
      {
        int v26 = *(_DWORD *)(a1 + 104);
        int v27 = a2[2];
        uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v29 = *(void *)(v28 + 24);
        *(void *)(v28 + 24) = v29 + 24;
        *(void *)uint64_t v29 = "rebase opcodes";
        *(_DWORD *)(v29 + 8) = v26;
        *(_DWORD *)(v29 + 12) = v27;
        *(void *)(v29 + 16) = v25;
      }

      uint64_t v30 = a2[5];
      if ((_DWORD)v30)
      {
        int v31 = *(_DWORD *)(a1 + 104);
        int v32 = a2[4];
        uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v34 = *(void *)(v33 + 24);
        *(void *)(v33 + 24) = v34 + 24;
        *(void *)uint64_t v34 = "bind opcodes";
        *(_DWORD *)(v34 + 8) = v31;
        *(_DWORD *)(v34 + 12) = v32;
        *(void *)(v34 + 16) = v30;
      }

      uint64_t v35 = a2[7];
      if ((_DWORD)v35)
      {
        int v36 = *(_DWORD *)(a1 + 104);
        int v37 = a2[6];
        uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v39 = *(void *)(v38 + 24);
        *(void *)(v38 + 24) = v39 + 24;
        *(void *)uint64_t v39 = "weak bind opcodes";
        *(_DWORD *)(v39 + 8) = v36;
        *(_DWORD *)(v39 + 12) = v37;
        *(void *)(v39 + 16) = v35;
      }

      uint64_t v40 = a2[9];
      if ((_DWORD)v40)
      {
        int v41 = *(_DWORD *)(a1 + 104);
        int v42 = a2[8];
        uint64_t v43 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v44 = *(void *)(v43 + 24);
        *(void *)(v43 + 24) = v44 + 24;
        *(void *)uint64_t v44 = "lazy bind opcodes";
        *(_DWORD *)(v44 + 8) = v41;
        *(_DWORD *)(v44 + 12) = v42;
        *(void *)(v44 + 16) = v40;
      }

      unsigned int v6 = a2[11];
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)(a1 + 104);
      int v8 = a2[10];
    }

    else
    {
      if (v5 != -2147483597) {
        return;
      }
      unsigned int v6 = a2[3];
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)(a1 + 104);
      int v8 = a2[2];
    }

    uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v10 = *(void *)(v45 + 24);
    *(void *)(v45 + 24) = v10 + 24;
    uint64_t v11 = "exports trie";
LABEL_48:
    *(void *)uint64_t v10 = v11;
    goto LABEL_49;
  }

  if (v5 == -2147483596)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 1;
    unsigned int v6 = a2[3];
    if (!v6) {
      return;
    }
    int v7 = *(_DWORD *)(a1 + 104);
    int v8 = a2[2];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v10 = *(void *)(v16 + 24);
    *(void *)(v16 + 24) = v10 + 24;
    uint64_t v11 = "chained fixups";
    goto LABEL_48;
  }

  if (v5 != 2)
  {
    if (v5 != 11) {
      return;
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    if (a2[15] < 0x10000001)
    {
      if (a2[2])
      {
        mach_o::Error::Error((mach_o::Error *)&v60, "malformed mach-o image: indirect symbol table ilocalsym != 0");
      }

      else
      {
        int v47 = a2[4];
        if (v47 == a2[3])
        {
          if (a2[6] == a2[5] + v47) {
            goto LABEL_58;
          }
          mach_o::Error::Error( (mach_o::Error *)&v60,  "malformed mach-o image: indirect symbol table iundefsym != iextdefsym+nextdefsym");
        }

        else
        {
          mach_o::Error::Error( (mach_o::Error *)&v60,  "malformed mach-o image: indirect symbol table iextdefsym != nlocalsym");
        }
      }
    }

    else
    {
      mach_o::Error::Error((mach_o::Error *)&v60, "malformed mach-o image: indirect symbol table too large");
    }

    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), &v60);
    mach_o::Error::~Error((mach_o::Error *)&v60);
    *a3 = 1;
LABEL_58:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = a2[7] + a2[6];
    uint64_t v48 = a2[19];
    if ((_DWORD)v48)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
      int v49 = *(_DWORD *)(a1 + 104);
      int v50 = a2[18];
      uint64_t v51 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v52 = *(void *)(v51 + 24);
      *(void *)(v51 + 24) = v52 + 24;
      *(void *)uint64_t v52 = "local relocations";
      *(_DWORD *)(v52 + 8) = v49;
      *(_DWORD *)(v52 + 12) = v50;
      *(void *)(v52 + 16) = 8 * v48;
    }

    uint64_t v53 = a2[17];
    if ((_DWORD)v53)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
      int v54 = *(_DWORD *)(a1 + 104);
      int v55 = a2[16];
      uint64_t v56 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v57 = *(void *)(v56 + 24);
      *(void *)(v56 + 24) = v57 + 24;
      *(void *)uint64_t v57 = "external relocations";
      *(_DWORD *)(v57 + 8) = v54;
      *(_DWORD *)(v57 + 12) = v55;
      *(void *)(v57 + 16) = 8 * v53;
    }

    int v58 = a2[15];
    if (v58)
    {
      int v8 = a2[14];
      unsigned int v6 = 4 * v58;
      uint64_t v59 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v10 = *(void *)(v59 + 24);
      *(void *)(v59 + 24) = v10 + 24;
      *(void *)uint64_t v10 = "indirect symbol table";
      int v7 = 4;
      goto LABEL_49;
    }

    return;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2[3];
  unsigned int v17 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v17)
  {
    if (v17 >= 0x10000001)
    {
      mach_o::Error::Error((mach_o::Error *)&v60, "malformed mach-o image: symbol table too large");
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), &v60);
      mach_o::Error::~Error((mach_o::Error *)&v60);
      *a3 = 1;
      unsigned int v17 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    }

    int v18 = *(_DWORD *)(a1 + 104);
    if (v18 == 8) {
      int v19 = 16;
    }
    else {
      int v19 = 12;
    }
    uint64_t v20 = v19 * v17;
    int v21 = a2[2];
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v23 = *(void *)(v22 + 24);
    *(void *)(v22 + 24) = v23 + 24;
    *(void *)uint64_t v23 = "symbol table";
    *(_DWORD *)(v23 + 8) = v18;
    *(_DWORD *)(v23 + 12) = v21;
    *(void *)(v23 + 16) = v20;
  }

  unsigned int v6 = a2[5];
  if (v6)
  {
    int v8 = a2[4];
    uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v10 = *(void *)(v24 + 24);
    *(void *)(v24 + 24) = v10 + 24;
    *(void *)uint64_t v10 = "symbol table strings";
    int v7 = 1;
LABEL_49:
    *(_DWORD *)(v10 + 8) = v7;
    *(_DWORD *)(v10 + 12) = v8;
    *(void *)(v10 + 16) = v6;
  }

uint64_t ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_2(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 40);
  if (v2 != 1 && v2 != 18)
  {
    unint64_t v4 = *(void *)(a2 + 56) + *(unsigned int *)(a2 + 64);
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8LL);
    if (v4 > *(void *)(v5 + 24)) {
      *(void *)(v5 + 24) = v4;
    }
  }

  return result;
}

uint64_t ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_3(uint64_t result, _DWORD *a2)
{
  if (*a2 == 2) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2[2];
  }
  return result;
}

uint64_t ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_4( uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t result = strcmp((const char *)(a2 + 8), "__LINKEDIT");
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v7 = *(unsigned int *)(a2 + 32);
    int v8 = *(_DWORD *)(a2 + 36);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL) + 24LL) = v7;
    uint64_t v6 = (v8 + v7);
    goto LABEL_7;
  }

  if (*(_DWORD *)a2 == 25)
  {
    uint64_t result = strcmp((const char *)(a2 + 8), "__LINKEDIT");
    if (!(_DWORD)result)
    {
      *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL) + 24LL) = *(void *)(a2 + 40);
      uint64_t v6 = *(void *)(a2 + 48) + *(void *)(a2 + 40);
LABEL_7:
      *(void *)(*(void *)(*(void *)(v5 + 40) + 8LL) + 24LL) = v6;
      *a3 = 1;
    }
  }

  return result;
}

__n128 __Block_byref_object_copy__42(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v2;
  __int128 v3 = *(_OWORD *)(a2 + 72);
  __int128 v4 = *(_OWORD *)(a2 + 88);
  __int128 v5 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v5;
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  __int128 v6 = *(_OWORD *)(a2 + 136);
  __int128 v7 = *(_OWORD *)(a2 + 152);
  __int128 v8 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = v8;
  *(_OWORD *)(a1 + 152) = v7;
  *(_OWORD *)(a1 + 136) = v6;
  __n128 result = *(__n128 *)(a2 + 200);
  __int128 v10 = *(_OWORD *)(a2 + 216);
  __int128 v11 = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(_OWORD *)(a1 + 232) = v11;
  *(_OWORD *)(a1 + 216) = v10;
  *(__n128 *)(a1 + 200) = result;
  return result;
}

double ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a2 + 44) & 4) != 0)
  {
    __int128 v2 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 232LL);
    unint64_t v3 = *(void *)(a2 + 24) + *(void *)(a2 + 16);
    v5.n128_u64[0] = *(void *)(a2 + 16);
    v5.n128_u64[1] = v3;
    int v6 = *(_DWORD *)(a2 + 36);
    *(void *)&double result = dyld3::Array<mach_o::SegmentRanges::SegmentRange>::push_back(v2, &v5).n128_u64[0];
  }

  return result;
}

__n128 dyld3::Array<mach_o::SegmentRanges::SegmentRange>::push_back(uint64_t *a1, __n128 *a2)
{
  unint64_t v2 = a1[2];
  if (v2 >= a1[1]) {
    dyld3::Array<mach_o::SegmentRanges::SegmentRange>::push_back();
  }
  uint64_t v3 = *a1;
  a1[2] = v2 + 1;
  __int128 v4 = (__n128 *)(v3 + 24 * v2);
  __n128 result = *a2;
  v4[1].n128_u64[0] = a2[1].n128_u64[0];
  __n128 *v4 = result;
  return result;
}

void ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_2(uint64_t a1, _DWORD *a2, _BYTE *a3)
{
  if (*a2 != 26)
  {
    if (*a2 != 17) {
      return;
    }
    unint64_t v5 = a2[2];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v7 = *(void *)(v6 + 248);
    if (v7)
    {
      uint64_t v8 = *(void *)(v6 + 232);
      uint64_t v9 = 24 * v7;
      __int128 v10 = (unint64_t *)(v8 + 8);
      while (*(v10 - 1) > v5 || *v10 <= v5)
      {
        v10 += 3;
        v9 -= 24LL;
        if (!v9) {
          goto LABEL_8;
        }
      }

      return;
    }

void ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_3(void *a1, uint64_t a2, _BYTE *a3)
{
  int v3 = *(unsigned __int8 *)(a2 + 40);
  uint64_t v7 = (mach_o::Header **)a1[6];
  unint64_t v8 = *(void *)(a2 + 56);
  if (v8 % mach_o::Header::pointerSize(*v7))
  {
    mach_o::Error::Error((mach_o::Error *)&v34, "section %s/%s size (%llu) is not a multiple of pointer-size");
LABEL_6:
    mach_o::Error::operator=((void *)(*(void *)(a1[4] + 8LL) + 40LL), &v34);
    mach_o::Error::~Error((mach_o::Error *)&v34);
    *a3 = 1;
    return;
  }

  unint64_t v9 = *(void *)(a2 + 48);
  if (v9 % mach_o::Header::pointerSize(*v7))
  {
    mach_o::Error::Error((mach_o::Error *)&v34, "section %s/%s address (0x%llX) is not pointer aligned");
    goto LABEL_6;
  }

  __int128 v10 = *v7;
  uint64_t v11 = *(unsigned int *)(a2 + 64);
  if (mach_o::Header::inDyldCache(*v7))
  {
    uint64_t v12 = *(void *)(a2 + 48);
    uint64_t v13 = (char *)(mach_o::Header::getSlide(*v7) + v12);
  }

  else
  {
    uint64_t v13 = (char *)v10 + v11;
  }

  BOOL v14 = mach_o::Header::is64(*v7);
  uint64_t v15 = *(void *)(a2 + 56);
  unint64_t v16 = (unint64_t)&v13[v15];
  if (v14)
  {
    if (v15 >= 1)
    {
      uint64_t v17 = *(void *)(a1[5] + 8LL);
      uint64_t v18 = *(void *)(v17 + 232);
      uint64_t v19 = *(void *)(v17 + 248);
      uint64_t v20 = (unint64_t *)(v18 + 8);
      int v21 = v13;
      while (v19)
      {
        unint64_t v22 = a1[7] + *(unsigned int *)v21;
        uint64_t v23 = v20;
        uint64_t v24 = 24 * v19;
        while (*(v23 - 1) > v22 || *v23 <= v22)
        {
          v23 += 3;
          v24 -= 24LL;
          if (!v24) {
            goto LABEL_33;
          }
        }

        v21 += 8;
      }

      int v21 = v13;
LABEL_33:
      uint64_t v33 = (v21 - v13) >> 3;
LABEL_36:
      mach_o::Error::Error( (mach_o::Error *)&v34,  "initializer %lu/%llu is not in an executable segment",  v33,  (unint64_t)v15 >> 3);
      mach_o::Error::operator=((void *)(*(void *)(a1[4] + 8LL) + 40LL), &v34);
      mach_o::Error::~Error((mach_o::Error *)&v34);
    }
  }

  else if (v15 >= 1)
  {
    uint64_t v25 = *(void *)(a1[5] + 8LL);
    uint64_t v26 = *(void *)(v25 + 232);
    uint64_t v27 = *(void *)(v25 + 248);
    uint64_t v28 = (unint64_t *)(v26 + 8);
    uint64_t v29 = v13;
    while (v27)
    {
      unint64_t v30 = a1[7] + (*(_DWORD *)v29 & 0x3FFFFFF);
      int v31 = v28;
      uint64_t v32 = 24 * v27;
      while (*(v31 - 1) > v30 || *v31 <= v30)
      {
        v31 += 3;
        v32 -= 24LL;
        if (!v32) {
          goto LABEL_35;
        }
      }

      v29 += 4;
    }

    uint64_t v29 = v13;
LABEL_35:
    uint64_t v33 = (v29 - v13) >> 2;
    uint64_t v15 = (((unint64_t)v15 >> 2) * (unsigned __int128)0x6186186186186187uLL) >> 64;
    goto LABEL_36;
  }

LABEL_37:
  if (v3 == 10
    && mach_o::Header::isDyldManaged(*v7)
    && mach_o::Header::isArch((mach_header *)*v7, "arm6e"))
  {
    mach_o::Error::Error( (mach_o::Error *)&v34,  "terminators section %s/%s not supported for arm64e",  *(const char **)(a2 + 16),  *(const char **)a2);
    mach_o::Error::operator=((void *)(*(void *)(a1[4] + 8LL) + 40LL), &v34);
    mach_o::Error::~Error((mach_o::Error *)&v34);
  }

      if (v17) {
        uint64_t v39 = v16 == 0;
      }
      else {
        uint64_t v39 = 1;
      }
      uint64_t v40 = v39;
      if (!v39)
      {
        *a3 = 0LL;
        if (&v50 != a3)
        {
          *a3 = v50;
          int v50 = 0LL;
        }
      }

      if (v18) {
        lsl::Allocator::freeObject(v18, v11);
      }
      if (!v40) {
        return lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v50, v11);
      }
LABEL_49:
      address += size;
      infoCnt = 9;
      if (mach_vm_region(this[4], &address, &size, 10, info, &infoCnt, &object_name)) {
        goto LABEL_50;
      }
    }
  }

  unint64_t v16 = 0;
LABEL_50:
  if (a2) {
    uint64_t v15 = *a2;
  }
  if (v15) {
    goto LABEL_11;
  }
  if (!v16)
  {
    if (!a2) {
      goto LABEL_11;
    }
    uint64_t v13 = 5;
LABEL_10:
    *a2 = v13;
LABEL_11:
    *a3 = 0LL;
    return lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v50, v11);
  }

  *a3 = 0LL;
  if (&v50 != a3)
  {
    *a3 = v50;
    int v50 = 0LL;
  }

  return lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v50, v11);
}

void ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_4(void *a1, uint64_t a2, _BYTE *a3)
{
  if (*(_BYTE *)(a2 + 40) == 22)
  {
    if ((*(_BYTE *)(a2 + 36) & 2) != 0)
    {
      mach_o::Error::Error((mach_o::Error *)&v16, "initializer offsets section %s/%s must be in read-only segment");
      goto LABEL_6;
    }

    uint64_t v5 = *(void *)(a2 + 56);
    if ((v5 & 3) != 0)
    {
      mach_o::Error::Error((mach_o::Error *)&v16, "initializer offsets section %s/%s has bad size");
LABEL_6:
      mach_o::Error::operator=((void *)(*(void *)(a1[4] + 8LL) + 40LL), &v16);
      mach_o::Error::~Error((mach_o::Error *)&v16);
      *a3 = 1;
      return;
    }

    uint64_t v6 = *(void *)(a2 + 48);
    if ((v6 & 3) != 0)
    {
      mach_o::Error::Error((mach_o::Error *)&v16, "initializer offsets section %s/%s is not 4-byte aligned");
      goto LABEL_6;
    }

    if (v5 >= 1)
    {
      uint64_t v7 = (unsigned int *)(a1[6] + v6);
      unint64_t v8 = (unsigned int *)((char *)v7 + v5);
      uint64_t v9 = *(void *)(a1[5] + 8LL);
      uint64_t v10 = *(void *)(v9 + 232);
      uint64_t v11 = *(void *)(v9 + 248);
      uint64_t v12 = (unint64_t *)(v10 + 8);
      while (v11)
      {
        unint64_t v13 = a1[7] + *v7;
        BOOL v14 = v12;
        uint64_t v15 = 24 * v11;
        while (*(v14 - 1) > v13 || *v14 <= v13)
        {
          v14 += 3;
          v15 -= 24LL;
          if (!v15) {
            goto LABEL_20;
          }
        }

        if (++v7 >= v8) {
          return;
        }
      }

LABEL_20:
      mach_o::Error::Error((mach_o::Error *)&v16, "initializer 0x%08X is not an offset to an executable segment");
      goto LABEL_6;
    }
  }

  lsl::Allocator::~Allocator((lsl::Allocator *)v7);
}

    int v42 = *v20;
    goto LABEL_21;
  }

void *___ZN6mach_o5Image15makeExportsTrieEv_block_invoke(void *result, int *a2)
{
  unint64_t v2 = (void *)result[4];
  int v3 = *a2;
  if (*a2 == -2147483614 || v3 == 34)
  {
    uint64_t v8 = a2[10];
    if (!(_DWORD)v8) {
      return result;
    }
    uint64_t v5 = v2 + 14;
    uint64_t v6 = (const unsigned __int8 *)(v2[2] + v8);
    uint64_t v7 = a2[11];
    goto LABEL_8;
  }

  if (v3 == -2147483597)
  {
    uint64_t v4 = a2[2];
    if ((_DWORD)v4)
    {
      uint64_t v5 = v2 + 14;
      uint64_t v6 = (const unsigned __int8 *)(v2[2] + v4);
      uint64_t v7 = a2[3];
LABEL_8:
      __n128 result = mach_o::FunctionStarts::FunctionStarts(v5, v6, v7);
      v2[4] = result;
    }
  }

  return result;
}

uint64_t ___ZN6mach_o5Image15makeSymbolTableEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 == 11)
  {
    uint64_t v2 = *(void *)(result + 40);
  }

  else
  {
    if (*a2 != 2) {
      return result;
    }
    uint64_t v2 = *(void *)(result + 32);
  }

  *(void *)(*(void *)(v2 + 8) + 24LL) = a2;
  return result;
}

uint64_t ___ZN6mach_o5Image17makeRebaseOpcodesEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 | 0x80000000) == 0x80000022)
  {
    uint64_t v2 = a2[3];
    if ((_DWORD)v2)
    {
      uint64_t v3 = *(void *)(result + 32);
      uint64_t v4 = (const unsigned __int8 *)(*(void *)(v3 + 16) + a2[2]);
      BOOL v5 = mach_o::Header::is64(*(mach_o::Header **)v3);
      __n128 result = mach_o::RebaseOpcodes::RebaseOpcodes(v3 + 184, v4, v2, v5);
      *(void *)(v3 + 48) = v3 + 184;
    }
  }

  return result;
}

uint64_t ___ZN6mach_o5Image15makeBindOpcodesEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 | 0x80000000) == 0x80000022)
  {
    uint64_t v2 = a2[5];
    if ((_DWORD)v2)
    {
      uint64_t v3 = *(void *)(result + 32);
      uint64_t v4 = (const unsigned __int8 *)(*(void *)(v3 + 16) + a2[4]);
      BOOL v5 = mach_o::Header::is64(*(mach_o::Header **)v3);
      __n128 result = mach_o::BindOpcodes::BindOpcodes(v3 + 208, v4, v2, v5);
      *(void *)(v3 + 56) = v3 + 208;
    }
  }

  return result;
}

uint64_t ___ZN6mach_o5Image19makeLazyBindOpcodesEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 | 0x80000000) == 0x80000022)
  {
    uint64_t v2 = a2[9];
    if ((_DWORD)v2)
    {
      uint64_t v3 = *(void *)(result + 32);
      uint64_t v4 = (const unsigned __int8 *)(*(void *)(v3 + 16) + a2[8]);
      BOOL v5 = mach_o::Header::is64(*(mach_o::Header **)v3);
      __n128 result = mach_o::BindOpcodes::BindOpcodes(v3 + 240, v4, v2, v5);
      *(void *)(v3 + 240) = off_18962FEF0;
      *(void *)(v3 + 64) = v3 + 240;
    }
  }

  return result;
}

uint64_t ___ZN6mach_o5Image19makeWeakBindOpcodesEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 | 0x80000000) == 0x80000022)
  {
    uint64_t v2 = a2[7];
    if ((_DWORD)v2)
    {
      uint64_t v3 = *(void *)(result + 32);
      uint64_t v4 = (const unsigned __int8 *)(*(void *)(v3 + 16) + a2[6]);
      BOOL v5 = mach_o::Header::is64(*(mach_o::Header **)v3);
      __n128 result = mach_o::BindOpcodes::BindOpcodes(v3 + 272, v4, v2, v5);
      *(void *)(v3 + 72) = v3 + 272;
    }
  }

  return result;
}

void *___ZN6mach_o5Image17makeChainedFixupsEv_block_invoke(void *result, _DWORD *a2)
{
  if (*a2 == -2147483596)
  {
    uint64_t v2 = a2[3];
    if ((_DWORD)v2)
    {
      uint64_t v3 = (void *)result[4];
      __n128 result = mach_o::ChainedFixups::ChainedFixups( v3 + 38,  (const dyld_chained_fixups_header *)(v3[2] + a2[2]),  v2);
      v3[10] = result;
    }
  }

  return result;
}

void *___ZN6mach_o5Image18makeFunctionStartsEv_block_invoke(void *result, _DWORD *a2)
{
  if (*a2 == 38)
  {
    uint64_t v2 = a2[3];
    if ((_DWORD)v2)
    {
      uint64_t v3 = (void *)result[4];
      __n128 result = mach_o::FunctionStarts::FunctionStarts( v3 + 40,  (const unsigned __int8 *)(v3[2] + a2[2]),  v2);
      v3[11] = result;
    }
  }

  return result;
}

void ___ZN6mach_o5Image17makeCompactUnwindEv_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (*(void *)(a2 + 8) == 13LL
    && **(void **)a2 == 0x646E69776E755F5FLL
    && *(void *)(*(void *)a2 + 5LL) == 0x6F666E695F646E69LL)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (std::string_view::starts_with[abi:nn180100]((void *)(a2 + 16), "__TEXT"))
    {
      uint64_t v7 = *(void *)v6 + *(unsigned int *)(a2 + 64);
      mach_o::Header::arch(*(mach_header **)v6, (cpu_type_t *)&v8);
      mach_o::CompactUnwind::CompactUnwind((void *)(v6 + 336), &v8, v7, *(void *)(a2 + 56));
      *(void *)(v6 + 96) = v6 + 336;
      *a3 = 1;
    }
  }

void *___ZN6mach_o5Image16makeSplitSegInfoEv_block_invoke(void *result, _DWORD *a2, _BYTE *a3)
{
  if (*a2 == 30)
  {
    uint64_t v4 = (void *)result[4];
    __n128 result = mach_o::FunctionStarts::FunctionStarts( v4 + 45,  (const unsigned __int8 *)(v4[2] + a2[2]),  a2[3]);
    v4[13] = result;
    *a3 = 1;
  }

  return result;
}

uint64_t ___ZNK6mach_o5Image12segmentCountEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 == 25 || *a2 == 1) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
  }
  return result;
}

__n128 __Block_byref_object_copy__73(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  __int128 v3 = *(_OWORD *)(a2 + 56);
  __int128 v4 = *(_OWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 87) = *(_DWORD *)(a2 + 87);
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

size_t ___ZNK6mach_o5Image7segmentEj_block_invoke(size_t result, uint64_t a2, _BYTE *a3)
{
  size_t v5 = result;
  uint64_t v6 = *(uint64_t **)(result + 56);
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t v15 = a2 + 8;
    __n128 result = strcmp((const char *)(a2 + 8), "__TEXT");
    if (!(_DWORD)result) {
      *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL) + 24LL) = *(unsigned int *)(a2 + 24);
    }
    size_t v8 = v5 + 40;
    uint64_t v9 = *(void *)(*(void *)(v5 + 40) + 8LL);
    int v10 = *(_DWORD *)(v9 + 24);
    if (v10 != *(_DWORD *)(v5 + 64)) {
      goto LABEL_18;
    }
    uint64_t v16 = *(unsigned int *)(a2 + 24);
    size_t v12 = v5 + 48;
    *(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 40LL) = v16
                                                                - *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL)
                                                                            + 24LL);
    uint64_t v17 = *v6;
    if (*((_BYTE *)v6 + 25))
    {
      *(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 64LL) = v17
                                                                  + v16
                                                                  - *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL)
                                                                              + 24LL);
      uint64_t v18 = *(unsigned int *)(a2 + 32);
    }

    else
    {
      uint64_t v18 = *(unsigned int *)(a2 + 32);
      *(void *)(*(void *)(*(void *)v12 + 8LL) + 64LL) = v17 + v18;
    }

    *(void *)(*(void *)(*(void *)v12 + 8LL) + 48LL) = *(unsigned int *)(a2 + 28);
    *(void *)(*(void *)(*(void *)v12 + 8LL) + 56LL) = v18;
    __n128 result = strlen((const char *)(a2 + 8));
    uint64_t v21 = *(void *)(*(void *)v12 + 8LL);
    *(void *)(v21 + 72) = v15;
    *(void *)(v21 + 80) = result;
    uint64_t v20 = (char *)(a2 + 44);
    goto LABEL_17;
  }

  if (*(_DWORD *)a2 != 25) {
    return result;
  }
  uint64_t v7 = a2 + 8;
  __n128 result = strcmp((const char *)(a2 + 8), "__TEXT");
  if (!(_DWORD)result) {
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL) + 24LL) = *(void *)(a2 + 24);
  }
  size_t v8 = v5 + 40;
  uint64_t v9 = *(void *)(*(void *)(v5 + 40) + 8LL);
  int v10 = *(_DWORD *)(v9 + 24);
  if (v10 == *(_DWORD *)(v5 + 64))
  {
    uint64_t v11 = *(void *)(a2 + 24);
    size_t v12 = v5 + 48;
    *(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 40LL) = v11
                                                                - *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL)
                                                                            + 24LL);
    uint64_t v13 = *v6;
    if (*((_BYTE *)v6 + 25))
    {
      *(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 64LL) = v13
                                                                  + v11
                                                                  - *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL)
                                                                              + 24LL);
      uint64_t v14 = *(void *)(a2 + 40);
    }

    else
    {
      uint64_t v14 = *(void *)(a2 + 40);
      *(void *)(*(void *)(*(void *)v12 + 8LL) + 64LL) = v13 + v14;
    }

    *(void *)(*(void *)(*(void *)v12 + 8LL) + 48LL) = *(void *)(a2 + 32);
    *(void *)(*(void *)(*(void *)v12 + 8LL) + 56LL) = v14;
    __n128 result = strlen((const char *)(a2 + 8));
    uint64_t v19 = *(void *)(*(void *)v12 + 8LL);
    *(void *)(v19 + 72) = v7;
    *(void *)(v19 + 80) = result;
    uint64_t v20 = (char *)(a2 + 60);
LABEL_17:
    char v22 = *v20;
    *(_BYTE *)(*(void *)(*(void *)v12 + 8LL) + 88LL) = v22 & 1;
    *(_BYTE *)(*(void *)(*(void *)v12 + 8LL) + 89LL) = (v22 & 2) != 0;
    *(_BYTE *)(*(void *)(*(void *)v12 + 8LL) + 90LL) = (v22 & 4) != 0;
    *a3 = 1;
    uint64_t v9 = *(void *)(*(void *)v8 + 8LL);
    int v10 = *(_DWORD *)(v9 + 24);
  }

void Diagnostics::Diagnostics(Diagnostics *this)
{
  *(void *)this = 0LL;
}

uint64_t Diagnostics::clearError(Diagnostics *this)
{
  uint64_t result = *(void *)this;
  if (result) {
    uint64_t result = _simple_sfree();
  }
  *(void *)this = 0LL;
  return result;
}

uint64_t Diagnostics::error(Diagnostics *this, const char *a2, ...)
{
  return Diagnostics::error(this, a2, va);
}

uint64_t Diagnostics::error(Diagnostics *this, const char *a2, char *a3)
{
  if (!*(void *)this) {
    *(void *)this = _simple_salloc();
  }
  return _simple_vsprintf();
}

uint64_t Diagnostics::appendError(Diagnostics *this, const char *a2, ...)
{
  if (*(void *)this) {
    _simple_sresize();
  }
  return Diagnostics::error(this, a2, va);
}

BOOL Diagnostics::hasError(Diagnostics *this)
{
  return *(void *)this != 0LL;
}

BOOL Diagnostics::noError(Diagnostics *this)
{
  return *(void *)this == 0LL;
}

Diagnostics *Diagnostics::assertNoError(Diagnostics *this)
{
  if (*(void *)this) {
    Diagnostics::assertNoError(this);
  }
  return this;
}

const char *Diagnostics::errorMessageCStr(Diagnostics *this)
{
  if (*(void *)this) {
    return (const char *)_simple_string();
  }
  else {
    return "";
  }
}

uint64_t instantiateTLVs_thunk(unsigned int a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)dyld4::gDyld + 8LL))(dyld4::gDyld, a1);
}

uint64_t legacyDyldLookup4OldBinaries(const char *a1, void **a2)
{
  *a2 = 0LL;
  return 0LL;
}

uint64_t _dyld_initializer()
{
  return (*(uint64_t (**)(uint64_t, uint64_t (***)(dyld4::LibSystemHelpers *__hidden)))(*(void *)dyld4::gDyld + 16LL))( dyld4::gDyld,  &sHelpers);
}

uint32_t _dyld_image_count(void)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 24LL))(dyld4::gDyld);
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)(*(uint64_t (**)(uint64_t, void))(*(void *)dyld4::gDyld + 32LL))( dyld4::gDyld,  *(void *)&image_index);
}

intptr_t _dyld_get_image_vmaddr_slide(uint32_t image_index)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)dyld4::gDyld + 40LL))( dyld4::gDyld,  *(void *)&image_index);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)(*(uint64_t (**)(uint64_t, void))(*(void *)dyld4::gDyld + 48LL))( dyld4::gDyld,  *(void *)&image_index);
}

void _dyld_register_func_for_add_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

void _dyld_register_func_for_remove_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return (*(uint64_t (**)(uint64_t, const char *))(*(void *)dyld4::gDyld + 72LL))(dyld4::gDyld, libraryName);
}

int32_t NSVersionOfRunTimeLibrary(const char *libraryName)
{
  return (*(uint64_t (**)(uint64_t, const char *))(*(void *)dyld4::gDyld + 80LL))(dyld4::gDyld, libraryName);
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return (*(uint64_t (**)(uint64_t, char *, uint32_t *))(*(void *)dyld4::gDyld + 88LL))( dyld4::gDyld,  buf,  bufsize);
}

uint64_t _dyld_fork_child()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 96LL))(dyld4::gDyld);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return (*(uint64_t (**)(uint64_t, const void *, Dl_info *))(*(void *)dyld4::gDyld + 104LL))( dyld4::gDyld,  a1,  a2);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)(*(uint64_t (**)(uint64_t, void *, const char *))(*(void *)dyld4::gDyld + 136LL))( dyld4::gDyld,  __handle,  __symbol);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)(*(uint64_t (**)(uint64_t, const char *, void))(*(void *)dyld4::gDyld + 112LL))( dyld4::gDyld,  __path,  *(void *)&__mode);
}

int dlclose(void *__handle)
{
  return (*(uint64_t (**)(uint64_t, void *))(*(void *)dyld4::gDyld + 120LL))(dyld4::gDyld, __handle);
}

char *dlerror(void)
{
  return (char *)(*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 128LL))(dyld4::gDyld);
}

BOOL dlopen_preflight(const char *__path)
{
  return (*(uint64_t (**)(uint64_t, const char *))(*(void *)dyld4::gDyld + 144LL))(dyld4::gDyld, __path);
}

uint64_t _dyld_get_image_slide(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 360LL))(dyld4::gDyld, a1);
}

uint64_t dyld_image_path_containing_address(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 368LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_find_unwind_sections(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 376LL))(dyld4::gDyld, a1, a2);
}

uint64_t dyld_get_sdk_version(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 384LL))(dyld4::gDyld, a1);
}

uint64_t dyld_get_min_os_version(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 392LL))(dyld4::gDyld, a1);
}

uint64_t dyld_get_program_sdk_version()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 400LL))(dyld4::gDyld);
}

uint64_t dyld_get_program_min_os_version()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 408LL))(dyld4::gDyld);
}

uint64_t dyld_process_is_restricted()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 416LL))(dyld4::gDyld);
}

uint64_t dyld_shared_cache_some_image_overridden()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 424LL))(dyld4::gDyld);
}

void _tlv_atexit(void (__cdecl *termFunc)(void *), void *objAddr)
{
}

void _tlv_bootstrap(void)
{
}

uint64_t _tlv_exit()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 448LL))(dyld4::gDyld);
}

uint64_t dyld_shared_cache_iterate_text(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 456LL))(dyld4::gDyld, a1, a2);
}

uint64_t dyld_image_header_containing_address(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 464LL))(dyld4::gDyld, a1);
}

uint64_t dyld_shared_cache_file_path()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 472LL))(dyld4::gDyld);
}

uint64_t _dyld_objc_notify_register(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 496LL))( dyld4::gDyld,  a1,  a2,  a3);
}

uint64_t _dyld_get_image_uuid(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 504LL))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_get_shared_cache_uuid(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 512LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_is_memory_immutable(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 520LL))(dyld4::gDyld, a1, a2);
}

uint64_t dyld_shared_cache_find_iterate_text(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 528LL))( dyld4::gDyld,  a1,  a2,  a3);
}

uint64_t _dyld_get_shared_cache_range(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 536LL))(dyld4::gDyld, a1);
}

uint64_t dyld_get_active_platform()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 560LL))(dyld4::gDyld);
}

uint64_t dyld_get_base_platform(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 568LL))(dyld4::gDyld, a1);
}

uint64_t dyld_is_simulator_platform(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 576LL))(dyld4::gDyld, a1);
}

uint64_t dyld_sdk_at_least(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 584LL))(dyld4::gDyld, a1, a2);
}

uint64_t dyld_minos_at_least(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 592LL))(dyld4::gDyld, a1, a2);
}

uint64_t dyld_program_sdk_at_least(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 600LL))(dyld4::gDyld, a1);
}

uint64_t dyld_program_minos_at_least(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 608LL))(dyld4::gDyld, a1);
}

uint64_t dyld_get_image_versions(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 616LL))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_images_for_addresses(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 624LL))( dyld4::gDyld,  a1,  a2,  a3);
}

uint64_t _dyld_register_for_image_loads(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 632LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_atfork_prepare()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 640LL))(dyld4::gDyld);
}

uint64_t _dyld_atfork_parent()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 648LL))(dyld4::gDyld);
}

uint64_t dyld_need_closure(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 656LL))(dyld4::gDyld, a1, a2);
}

uint64_t dyld_has_inserted_or_interposing_libraries()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 664LL))(dyld4::gDyld);
}

uint64_t _dyld_shared_cache_optimized()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 672LL))(dyld4::gDyld);
}

uint64_t _dyld_shared_cache_is_locally_built()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 680LL))(dyld4::gDyld);
}

uint64_t _dyld_register_for_bulk_image_loads(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 688LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_register_driverkit_main(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 696LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_missing_symbol_abort()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 704LL))(dyld4::gDyld);
}

uint64_t _dyld_get_objc_selector(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 712LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_for_each_objc_class(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 720LL))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_for_each_objc_protocol(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 728LL))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_launch_mode()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 736LL))(dyld4::gDyld);
}

uint64_t _dyld_is_objc_constant(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 744LL))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_has_fix_for_radar(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 752LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_shared_cache_real_path(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 760LL))(dyld4::gDyld, a1);
}

BOOL _dyld_shared_cache_contains_path(const char *path)
{
  return (*(uint64_t (**)(uint64_t, const char *))(*(void *)dyld4::gDyld + 768LL))(dyld4::gDyld, path);
}

uint64_t dlopen_from(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 776LL))( dyld4::gDyld,  a1,  a2,  a3);
}

uint64_t dlopen_audited(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 784LL))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_get_prog_image_header()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 792LL))(dyld4::gDyld);
}

uint64_t _dyld_visit_objc_classes(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 808LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_objc_class_count()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 816LL))(dyld4::gDyld);
}

uint64_t _dyld_objc_uses_large_shared_cache()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 824LL))(dyld4::gDyld);
}

uint64_t _dyld_find_protocol_conformance(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 832LL))( dyld4::gDyld,  a1,  a2,  a3);
}

uint64_t _dyld_find_foreign_type_protocol_conformance(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 840LL))( dyld4::gDyld,  a1,  a2,  a3);
}

uint64_t _dyld_swift_optimizations_version()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 848LL))(dyld4::gDyld);
}

uint64_t _dyld_get_dlopen_image_header(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 888LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_objc_register_callbacks(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 896LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_has_preoptimized_swift_protocol_conformances(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 904LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_find_protocol_conformance_on_disk(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 912LL))( dyld4::gDyld,  a1,  a2,  a3,  a4);
}

uint64_t _dyld_find_foreign_type_protocol_conformance_on_disk(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 920LL))( dyld4::gDyld,  a1,  a2,  a3,  a4);
}

uint64_t _dyld_dlopen_atfork_prepare()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 864LL))(dyld4::gDyld);
}

uint64_t _dyld_dlopen_atfork_parent()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 872LL))(dyld4::gDyld);
}

uint64_t _dyld_dlopen_atfork_child()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 880LL))(dyld4::gDyld);
}

uint64_t _dyld_lookup_section_info(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 928LL))( dyld4::gDyld,  a1,  a2,  a3);
}

uint64_t _dyld_pseudodylib_register_callbacks(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 936LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_pseudodylib_deregister_callbacks(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 944LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_pseudodylib_register(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 952LL))( dyld4::gDyld,  a1,  a2,  a3,  a4);
}

uint64_t _dyld_pseudodylib_deregister(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 960LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_is_preoptimized_objc_image_loaded(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 968LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_for_objc_header_opt_rw()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 976LL))(dyld4::gDyld);
}

uint64_t _dyld_for_objc_header_opt_ro()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 984LL))(dyld4::gDyld);
}

uint64_t _dyld_dlsym_blocked()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 992LL))(dyld4::gDyld);
}

uint64_t _dyld_register_dlsym_notifier(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1000LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_get_swift_prespecialized_data()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 1008LL))(dyld4::gDyld);
}

uint64_t _dyld_is_pseudodylib(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1056LL))(dyld4::gDyld, a1);
}

uint64_t _dyld_find_pointer_hash_table_entry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1016LL))( dyld4::gDyld,  a1,  a2,  a3,  a4);
}

uint64_t dyld_get_program_sdk_version_token()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 1024LL))(dyld4::gDyld);
}

uint64_t dyld_get_program_minos_version_token()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)dyld4::gDyld + 1032LL))(dyld4::gDyld);
}

uint64_t dyld_version_token_get_platform(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1040LL))(dyld4::gDyld, a1);
}

uint64_t dyld_version_token_at_least(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1048LL))(dyld4::gDyld, a1, a2);
}

uint64_t dyld4::Atlas::Bitmap::Bitmap(uint64_t a1, lsl::Lock **a2, uint64_t a3)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  uint64_t PVLEUInt64 = lsl::readPVLEUInt64((unsigned __int8 **)a3);
  *(void *)a1 = PVLEUInt64;
  unint64_t v7 = PVLEUInt64 + 7;
  unint64_t v8 = (unint64_t)(PVLEUInt64 + 7) >> 3;
  int v10 = lsl::Allocator::malloc(a2, v8);
  uint64_t v11 = *(lsl::Allocator **)(a1 + 8);
  *(void *)(a1 + 8) = v10;
  if (v11) {
    lsl::Allocator::freeObject(v11, v9);
  }
  if (v7 >= 8) {
    memmove(*(void **)(a1 + 8), *(const void **)a3, v8);
  }
  unint64_t v12 = *(void *)(a3 + 8) - v8;
  *(void *)a3 += v8;
  *(void *)(a3 + 8) = v12;
  return a1;
}

void dyld4::Atlas::Mapper::mapperForSharedCache( dyld4::Atlas::Mapper *this, lsl::Allocator *a2, dyld4::FileRecord *a3, const void *a4)
{
  uint64_t v4 = MEMORY[0x1895FE128](this, a2, a3, a4);
  uint64_t v6 = v5;
  unint64_t v8 = v7;
  uint64_t v9 = (lsl::Lock **)v4;
  uint64_t v11 = v10;
  uint64_t v174 = *MEMORY[0x1895FEE08];
  *(void *)&v146[1] = 0LL;
  Path = (const char *)dyld4::FileRecord::getPath(v7);
  v146[0] = open(Path, 0);
  if (v146[0] == -1)
  {
    *uint64_t v11 = 0LL;
    return;
  }

  v135 = v11;
  v136 = v8;
  uint64_t v142 = 0LL;
  v143 = v9;
  uint64_t v144 = 0LL;
  char v145 = 0;
  lsl::OrderedSet<int,std::less<int>>::insert((uint64_t)&v142, v146, (uint64_t)v167);
  if (!v14)
  {
    *(void *)__dst = &v142;
    memset(&__dst[8], 0, 32);
    __int128 v158 = 0u;
    memset(v159, 0, 25);
    uint64_t v26 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)__dst, v15, v16);
    uint64_t v27 = *(void *)v26;
    __int128 v28 = *(_OWORD *)(v26 + 56);
    __int128 v29 = *(_OWORD *)(v26 + 40);
    __int128 v30 = *(_OWORD *)(v26 + 24);
    __int128 v161 = *(_OWORD *)(v26 + 8);
    __int128 v162 = v30;
    __int128 v163 = v29;
    __int128 v164 = v28;
    uint64_t v31 = *(void *)(v26 + 72);
    unsigned __int8 v32 = *(_BYTE *)(v26 + 80);
    uint64_t v160 = v27;
    uint64_t v165 = v31;
    unsigned __int8 v166 = v32;
    __int128 v158 = 0u;
    memset(v159, 0, 25);
    memset(&__dst[8], 0, 32);
    *(void *)__dst = &v142;
    while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>( (uint64_t)&v160,  (uint64_t)__dst))
    {
      close(*(_DWORD *)(*((void *)&v161 + v166 - 1) + 4LL * *((unsigned __int8 *)&v165 + v166 - 1)));
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)&v160, v33, v34);
    }

    goto LABEL_76;
  }

  uint64_t v17 = v14;
  __int128 v168 = *(_OWORD *)(v14 + 88);
  uint64_t shared_cache_range = _dyld_get_shared_cache_range((uint64_t)&v146[1]);
  uint64_t v137 = shared_cache_range;
  if (shared_cache_range)
  {
    uint64_t v21 = 0LL;
    *(_OWORD *)__dst = *(_OWORD *)(shared_cache_range + 88);
    do
    {
      int v22 = __dst[v21];
      int v23 = *((unsigned __int8 *)&v168 + v21);
      BOOL v24 = v22 == v23;
    }

    while (v22 == v23 && v21++ != 15);
  }

  else
  {
    BOOL v24 = 0;
  }

  uint64_t v35 = *((void *)v17 + 28);
  if (!v6) {
    uint64_t v6 = *((void *)v17 + 28);
  }
  unsigned int v36 = *((_DWORD *)v17 + 4);
  if (v36 > 0x18B)
  {
    if (!*((_DWORD *)v17 + 113))
    {
      *(void *)__dst = &v142;
      memset(&__dst[8], 0, 32);
      __int128 v158 = 0u;
      memset(v159, 0, 25);
      uint64_t v114 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)__dst, v19, v20);
      uint64_t v115 = *(void *)v114;
      __int128 v116 = *(_OWORD *)(v114 + 56);
      __int128 v117 = *(_OWORD *)(v114 + 40);
      __int128 v118 = *(_OWORD *)(v114 + 24);
      __int128 v161 = *(_OWORD *)(v114 + 8);
      __int128 v162 = v118;
      __int128 v163 = v117;
      __int128 v164 = v116;
      uint64_t v119 = *(void *)(v114 + 72);
      unsigned __int8 v120 = *(_BYTE *)(v114 + 80);
      uint64_t v160 = v115;
      uint64_t v165 = v119;
      unsigned __int8 v166 = v120;
      __int128 v158 = 0u;
      memset(v159, 0, 25);
      memset(&__dst[8], 0, 32);
      *(void *)__dst = &v142;
      while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>( (uint64_t)&v160,  (uint64_t)__dst))
      {
        close(*(_DWORD *)(*((void *)&v161 + v166 - 1) + 4LL * *((unsigned __int8 *)&v165 + v166 - 1)));
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)&v160, v121, v122);
      }

      goto LABEL_76;
    }

    size_t v37 = *((unsigned int *)v17 + 98) + 56LL * *((unsigned int *)v17 + 99);
  }

  else
  {
    size_t v37 = *((unsigned int *)v17 + 6) + 32LL * *((unsigned int *)v17 + 7);
  }

  size_t v132 = v37;
  uint64_t v38 = (lsl::Allocator *)mmap(0LL, v37, 1, 2, v146[0], 0LL);
  v134 = v38;
  if (v38 == (lsl::Allocator *)-1LL)
  {
    *(void *)__dst = &v142;
    memset(&__dst[8], 0, 32);
    __int128 v158 = 0u;
    memset(v159, 0, 25);
    uint64_t v105 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)__dst, v39, v40);
    uint64_t v106 = *(void *)v105;
    __int128 v107 = *(_OWORD *)(v105 + 56);
    __int128 v108 = *(_OWORD *)(v105 + 40);
    __int128 v109 = *(_OWORD *)(v105 + 24);
    __int128 v161 = *(_OWORD *)(v105 + 8);
    __int128 v162 = v109;
    __int128 v163 = v108;
    __int128 v164 = v107;
    uint64_t v110 = *(void *)(v105 + 72);
    unsigned __int8 v111 = *(_BYTE *)(v105 + 80);
    uint64_t v160 = v106;
    uint64_t v165 = v110;
    unsigned __int8 v166 = v111;
    __int128 v158 = 0u;
    memset(v159, 0, 25);
    memset(&__dst[8], 0, 32);
    *(void *)__dst = &v142;
    while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>( (uint64_t)&v160,  (uint64_t)__dst))
    {
      close(*(_DWORD *)(*((void *)&v161 + v166 - 1) + 4LL * *((unsigned __int8 *)&v165 + v166 - 1)));
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)&v160, v112, v113);
    }

LABEL_76:
    void *v135 = 0LL;
    goto LABEL_77;
  }

  uint64_t v41 = v6 - v35;
  uint64_t v42 = *((unsigned int *)v17 + 78);
  uint64_t v138 = lsl::Allocator::defaultAllocator(v38);
  v139 = 0LL;
  uint64_t v140 = 0LL;
  uint64_t v141 = 0LL;
  if (*((_DWORD *)v17 + 79))
  {
    uint64_t v45 = 0LL;
    unint64_t v46 = 0LL;
    int v47 = (char *)v134 + v42;
    do
    {
      if (!v24 || (v47[48] & 2) != 0)
      {
        int v52 = v146[0];
        uint64_t v49 = *((void *)v47 + 1);
        uint64_t v53 = *((void *)v47 + 2);
        uint64_t v48 = *(void *)v47;
        lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v138, v45 + 1);
        uint64_t v51 = &v139[2 * v140];
        *(void *)uint64_t v51 = v53;
      }

      else
      {
        uint64_t v48 = *(void *)v47;
        uint64_t v49 = *((void *)v47 + 1);
        uint64_t v50 = *(void *)v47 + v137 - *((void *)v17 + 28);
        lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v138, v45 + 1);
        uint64_t v51 = &v139[2 * v140];
        *(void *)uint64_t v51 = v50;
        int v52 = -1;
      }

      *((void *)v51 + 1) = v49;
      *((void *)v51 + 2) = v48 + v41;
      *((_DWORD *)v51 + 6) = v52;
      uint64_t v45 = ++v140;
      ++v46;
      v47 += 56;
    }

    while (v46 < *((unsigned int *)v17 + 79));
  }

  BOOL v54 = v36 >= 0x18C;
  int v55 = v136;
  if (!v54 || !*((_DWORD *)v17 + 99))
  {
LABEL_63:
    if (v140)
    {
      v89 = v139;
      uint64_t v90 = 32 * v140;
      do
      {
        __int128 v91 = *v89;
        __int128 v92 = v89[1];
        v89 += 2;
        *(_OWORD *)&__dst[16] = v92;
        *(_OWORD *)__dst = v91;
        lsl::BTree<int,std::less<int>,false>::erase((uint64_t)&v142, &__dst[24]);
        v90 -= 32LL;
      }

      while (v90);
    }

    *(void *)__dst = &v142;
    memset(&__dst[8], 0, 32);
    __int128 v158 = 0u;
    memset(v159, 0, 25);
    uint64_t v93 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)__dst, v43, (uint64_t)v44);
    uint64_t v94 = *(void *)v93;
    __int128 v95 = *(_OWORD *)(v93 + 56);
    __int128 v96 = *(_OWORD *)(v93 + 40);
    __int128 v97 = *(_OWORD *)(v93 + 24);
    __int128 v161 = *(_OWORD *)(v93 + 8);
    __int128 v162 = v97;
    __int128 v163 = v96;
    __int128 v164 = v95;
    uint64_t v98 = *(void *)(v93 + 72);
    unsigned __int8 v99 = *(_BYTE *)(v93 + 80);
    uint64_t v160 = v94;
    uint64_t v165 = v98;
    unsigned __int8 v166 = v99;
    __int128 v158 = 0u;
    memset(v159, 0, 25);
    memset(&__dst[8], 0, 32);
    *(void *)__dst = &v142;
    while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>( (uint64_t)&v160,  (uint64_t)__dst))
    {
      close(*(_DWORD *)(*((void *)&v161 + v166 - 1) + 4LL * *((unsigned __int8 *)&v165 + v166 - 1)));
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)&v160, v100, v101);
    }

    v102 = (lsl::Allocator *)munmap(v134, v132);
    v103 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v102);
    uint64_t v104 = lsl::Allocator::defaultAllocator(v103);
    lsl::Allocator::makeShared<dyld4::Atlas::Mapper,lsl::Allocator&,lsl::Vector<dyld4::Atlas::Mapper::Mapping> &>( (lsl::Lock **)v103,  v104,  (uint64_t)&v138,  v135);
    goto LABEL_69;
  }

  uint64_t v56 = 0LL;
  while (1)
  {
    if (*((_DWORD *)v17 + 4) > 0x1C8u)
    {
      uint64_t v57 = (dyld4::Utils *)dyld4::FileRecord::getPath(v55);
      uint64_t v59 = dyld4::Utils::strrstr(v57, ".development", v58);
      if (v59)
      {
        int64_t v60 = v59 - (char *)v57;
        strncpy(__dst, (const char *)v57, v59 - (char *)v57);
        __dst[v60] = 0;
      }

      else
      {
        strcpy(__dst, (const char *)v57);
      }

      snprintf((char *)&v160, 0x400uLL, "%s%s");
    }

    else
    {
      dyld4::FileRecord::getPath(v55);
      snprintf((char *)&v160, 0x400uLL, "%s.%u");
    }

    v146[0] = open((const char *)&v160, 0);
    lsl::OrderedSet<int,std::less<int>>::insert((uint64_t)&v142, v146, (uint64_t)__dst);
    if (v146[0] == -1) {
      goto LABEL_63;
    }
    if (!v61)
    {
      v169 = &v142;
      __int128 v170 = 0u;
      __int128 v171 = 0u;
      __int128 v172 = 0u;
      memset(v173, 0, sizeof(v173));
      uint64_t v80 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)&v169, v43, (uint64_t)v44);
      uint64_t v81 = *(void *)v80;
      __int128 v82 = *(_OWORD *)(v80 + 56);
      __int128 v83 = *(_OWORD *)(v80 + 40);
      __int128 v84 = *(_OWORD *)(v80 + 24);
      __int128 v151 = *(_OWORD *)(v80 + 8);
      __int128 v152 = v84;
      __int128 v153 = v83;
      __int128 v154 = v82;
      uint64_t v85 = *(void *)(v80 + 72);
      unsigned __int8 v86 = *(_BYTE *)(v80 + 80);
      uint64_t v150 = v81;
      uint64_t v155 = v85;
      unsigned __int8 v156 = v86;
      __int128 v172 = 0u;
      memset(v173, 0, sizeof(v173));
      __int128 v170 = 0u;
      __int128 v171 = 0u;
      v169 = &v142;
      while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>( (uint64_t)&v150,  (uint64_t)&v169))
      {
        close(*(_DWORD *)(*((void *)&v151 + v156 - 1) + 4LL * *((unsigned __int8 *)&v155 + v156 - 1)));
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)&v150, v87, v88);
      }

      goto LABEL_62;
    }

    uint64_t v62 = v61;
    uint64_t v63 = 0LL;
    uint64_t v64 = &v61[*((unsigned int *)v61 + 78)];
    __int128 v65 = *(_OWORD *)(v61 + 88);
    uint64_t v66 = (char *)v134 + *((unsigned int *)v17 + 98);
    v67 = &v66[56 * v56];
    uint64_t v68 = &v66[24 * v56];
    if (*((_DWORD *)v17 + 4) < 0x1C9u) {
      v67 = v68;
    }
    __int128 v148 = *(_OWORD *)v67;
    __int128 v149 = v65;
    __int128 v147 = v148;
    do
    {
      int v69 = *((unsigned __int8 *)&v149 + v63);
      int v70 = *((unsigned __int8 *)&v147 + v63);
    }

    while (v69 == v70 && v63++ != 15);
    if (v69 != v70) {
      break;
    }
    uint64_t v133 = v56;
    if (*((_DWORD *)v61 + 79))
    {
      unint64_t v72 = 0LL;
      while (v24)
      {
        uint64_t v73 = v140;
        if ((v64[48] & 2) != 0) {
          goto LABEL_57;
        }
        uint64_t v75 = *(void *)v64;
        uint64_t v74 = *((void *)v64 + 1);
        uint64_t v76 = *(void *)v64 + v137 - *((void *)v17 + 28);
        lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v138, v140 + 1);
        int v77 = &v139[2 * v140];
        *(void *)int v77 = v76;
        int v78 = -1;
LABEL_58:
        *((void *)v77 + 1) = v74;
        *((void *)v77 + 2) = v75 + v41;
        *((_DWORD *)v77 + 6) = v78;
        ++v140;
        ++v72;
        v64 += 56;
      }

      uint64_t v73 = v140;
LABEL_57:
      int v78 = v146[0];
      uint64_t v74 = *((void *)v64 + 1);
      uint64_t v79 = *((void *)v64 + 2);
      uint64_t v75 = *(void *)v64;
      lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v138, v73 + 1);
      int v77 = &v139[2 * v140];
      *(void *)int v77 = v79;
      goto LABEL_58;
    }

LABEL_59:
    int v55 = v136;
    uint64_t v56 = v133;
LABEL_62:
  }

  v169 = &v142;
  __int128 v170 = 0u;
  __int128 v171 = 0u;
  __int128 v172 = 0u;
  memset(v173, 0, sizeof(v173));
  uint64_t v123 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)&v169, v43, (uint64_t)v44);
  uint64_t v124 = *(void *)v123;
  __int128 v125 = *(_OWORD *)(v123 + 56);
  __int128 v126 = *(_OWORD *)(v123 + 40);
  __int128 v127 = *(_OWORD *)(v123 + 24);
  __int128 v151 = *(_OWORD *)(v123 + 8);
  __int128 v152 = v127;
  __int128 v153 = v126;
  __int128 v154 = v125;
  uint64_t v128 = *(void *)(v123 + 72);
  unsigned __int8 v129 = *(_BYTE *)(v123 + 80);
  uint64_t v150 = v124;
  uint64_t v155 = v128;
  unsigned __int8 v156 = v129;
  memset(v173, 0, sizeof(v173));
  __int128 v172 = 0u;
  __int128 v171 = 0u;
  __int128 v170 = 0u;
  v169 = &v142;
  while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>( (uint64_t)&v150,  (uint64_t)&v169))
  {
    close(*(_DWORD *)(*((void *)&v151 + v156 - 1) + 4LL * *((unsigned __int8 *)&v155 + v156 - 1)));
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t)&v150, v130, v131);
  }

  void *v135 = 0LL;
LABEL_69:
  if (v139) {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize((uint64_t)&v138, 0LL);
  }
LABEL_77:
  if (v142) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::deallocate(v142, v143);
  }
}

double lsl::OrderedSet<int,std::less<int>>::insert@<D0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  int v9 = *a2;
  lsl::BTree<int,std::less<int>,false>::const_iterator::const_iterator((uint64_t)v18, a1, &v9);
  lsl::BTree<int,std::less<int>,false>::insert_internal(a1, (uint64_t)v18, &v9, (uint64_t)&v10);
  uint64_t v5 = v10;
  *(_OWORD *)(a3 + 8) = v11;
  *(_OWORD *)(a3 + 24) = v12;
  *(_OWORD *)(a3 + 40) = v13;
  double result = *(double *)&v14;
  *(_OWORD *)(a3 + 56) = v14;
  uint64_t v7 = v15;
  char v8 = v16;
  *(void *)a3 = v5;
  *(void *)(a3 + 72) = v7;
  *(_BYTE *)(a3 + 80) = v8;
  *(_BYTE *)(a3 + 88) = v17;
  return result;
}

void *anonymous namespace'::cacheFilePeek(_anonymous_namespace_ *this, void *a2, unsigned __int8 *a3)
{
  ssize_t v4 = pread((int)this, a2, 0x4000uLL, 0LL);
  double result = 0LL;
  if (v4 == 0x4000)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

void *lsl::Allocator::makeShared<dyld4::Atlas::Mapper,lsl::Allocator&,lsl::Vector<dyld4::Atlas::Mapper::Mapping> &>@<X0>( lsl::Lock **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = (lsl::Allocator::AllocationMetadata *)lsl::Allocator::aligned_alloc(a1, 8uLL, 0x30uLL);
  char v8 = lsl::Vector<dyld4::Atlas::Mapper::Mapping>::Vector(v7, a3, a2);
  v8[4] = 0LL;
  void v8[5] = a2;
  return lsl::SharedPtr<dyld4::Atlas::Mapper>::SharedPtr(a4, v7);
}

void dyld4::Atlas::Mapper::mapperForSharedCacheLocals( dyld4::Atlas::Mapper *this, lsl::Allocator *a2, dyld4::FileRecord *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v24 = *MEMORY[0x1895FEE08];
  uint64_t v8 = dyld4::FileRecord::open(v4, 0);
  if ((_DWORD)v8 == -1) {
    goto LABEL_9;
  }
  int v9 = (_anonymous_namespace_ *)v8;
  uint64_t v10 = dyld4::FileRecord::size(v5);
  if (!(_DWORD)v9) {
    goto LABEL_9;
  }
  uint64_t v12 = v10;
  if (!v13)
  {
    dyld4::FileRecord::close(v5);
LABEL_9:
    *uint64_t v7 = 0LL;
    v7[1] = 0LL;
    return;
  }

  uint64_t v19 = lsl::Allocator::defaultAllocator(v13);
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v19, 1uLL);
  uint64_t v14 = v20 + 32 * v21;
  *(void *)uint64_t v14 = 0LL;
  *(void *)(v14 + 8) = v12;
  *(void *)(v14 + 16) = 0LL;
  *(_DWORD *)(v14 + 24) = (_DWORD)v9;
  ++v21;
  char v16 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v15);
  uint64_t v17 = lsl::Allocator::defaultAllocator(v16);
  lsl::Allocator::makeShared<dyld4::Atlas::Mapper,lsl::Allocator&,lsl::Vector<dyld4::Atlas::Mapper::Mapping> &>( (lsl::Lock **)v16,  v17,  (uint64_t)&v19,  &v18);
  *uint64_t v7 = 0LL;
  if (&v18 != v7) {
    *uint64_t v7 = v18;
  }
  v7[1] = 0LL;
  if (v20) {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize((uint64_t)&v19, 0LL);
  }
}

void dyld4::Atlas::Mapper::mapperForMachO( lsl::Allocator *a1@<X1>, dyld4::FileRecord *a2@<X2>, const UUID *a3@<X3>, void *a4@<X8>)
{
  uint64_t v49 = *MEMORY[0x1895FEE08];
  Path = (dyld3 *)dyld4::FileRecord::getPath(a1);
  int v10 = dyld3::open(Path, 0LL, 0LL);
  if (v10 == -1) {
    goto LABEL_20;
  }
  int v11 = v10;
  if (fstat(v10, &v37) == -1 || (uint64_t v12 = mmap(0LL, v37.st_size, 1, 8194, v11, 0LL), v12 == (_DWORD *)-1LL))
  {
    int v10 = v11;
LABEL_20:
    close(v10);
    *a4 = 0LL;
    return;
  }

  uint64_t v14 = v12;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  uint64_t v36 = 0LL;
  Uuid = (dyld3::MachOFile *)dyld3::FatFile::isFatFile(v12, v13);
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2000000000LL;
  v32[3] = 0LL;
  uint64_t v17 = MEMORY[0x1895FED80];
  if (Uuid)
  {
    uint64_t v18 = Uuid;
    off_t st_size = v37.st_size;
    Diagnostics::Diagnostics((Diagnostics *)&v41);
    v31[0] = MEMORY[0x1895FED80];
    v31[1] = 0x40000000LL;
    v31[2] = ___ZN5dyld45Atlas6Mapper14mapperForMachOERN3lsl9AllocatorERNS_10FileRecordERKNS2_4UUIDEPKv_block_invoke;
    void v31[3] = &unk_189630260;
    v31[4] = &v33;
    v31[5] = v32;
    v31[6] = a2;
    v31[7] = v18;
    uint64_t v17 = MEMORY[0x1895FED80];
    dyld3::FatFile::forEachSlice(v18, (Diagnostics *)&v41, st_size, (uint64_t)v31);
    Diagnostics::clearError((Diagnostics *)&v41);
    mach_o::Error::~Error((mach_o::Error *)&v41);
  }

  if (!v34[3])
  {
    Uuid = (dyld3::MachOFile *)dyld3::MachOFile::isMachO(v14, v16);
    if (Uuid)
    {
      uint64_t v20 = Uuid;
      Uuid = (dyld3::MachOFile *)dyld3::MachOFile::getUuid(Uuid, (unsigned __int8 *)&v41);
      uint64_t v21 = 0LL;
      __int128 v38 = v41;
      do
      {
        int v22 = *((unsigned __int8 *)a2 + v21);
        int v23 = *((unsigned __int8 *)&v38 + v21);
      }

      while (v22 == v23 && v21++ != 15);
      if (v22 == v23) {
        v34[3] = (uint64_t)v20;
      }
    }
  }

  if (v34[3])
  {
    *(void *)&__int128 v41 = 0LL;
    *((void *)&v41 + 1) = &v41;
    uint64_t v42 = 0x4802000000LL;
    uint64_t v43 = __Block_byref_object_copy__4;
    uint64_t v44 = __Block_byref_object_dispose__4;
    uint64_t v45 = lsl::Allocator::defaultAllocator(Uuid);
    uint64_t v46 = 0LL;
    uint64_t v47 = 0LL;
    uint64_t v48 = 0LL;
    *(void *)&__int128 v38 = 0LL;
    *((void *)&v38 + 1) = &v38;
    uint64_t v39 = 0x2000000000LL;
    uint64_t v40 = 0LL;
    uint64_t v25 = (_DWORD *)v34[3];
    v29[0] = v17;
    v29[1] = 0x40000000LL;
    v29[2] = ___ZN5dyld45Atlas6Mapper14mapperForMachOERN3lsl9AllocatorERNS_10FileRecordERKNS2_4UUIDEPKv_block_invoke_3;
    void v29[3] = &unk_189630288;
    v29[4] = &v38;
    v29[5] = &v41;
    v29[6] = v32;
    v29[7] = a3;
    int v30 = v11;
    dyld3::MachOFile::forEachSegment(v25, (uint64_t)v29);
    uint64_t v26 = (lsl::Allocator *)munmap(v14, v37.st_size);
    uint64_t v27 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v26);
    uint64_t v28 = lsl::Allocator::defaultAllocator(v27);
    lsl::Allocator::makeShared<dyld4::Atlas::Mapper,lsl::Allocator&,lsl::Vector<dyld4::Atlas::Mapper::Mapping> &>( (lsl::Lock **)v27,  v28,  *((void *)&v41 + 1) + 40LL,  a4);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v41, 8);
    if (v46) {
      lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize((uint64_t)&v45, 0LL);
    }
  }

  else
  {
    munmap(v14, v37.st_size);
    close(v11);
    *a4 = 0LL;
  }

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);
}

BOOL ___ZN5dyld45Atlas6Mapper14mapperForMachOERN3lsl9AllocatorERNS_10FileRecordERKNS2_4UUIDEPKv_block_invoke( void *a1, int a2, int a3, dyld3::MachOFile *this, uint64_t a5, _BYTE *a6)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  BOOL result = dyld3::MachOFile::getUuid(this, v15);
  uint64_t v10 = 0LL;
  __int128 v14 = *(_OWORD *)v15;
  do
  {
    int v11 = *(unsigned __int8 *)(a1[6] + v10);
    int v12 = v15[v10 - 8];
  }

  while (v11 == v12 && v10++ != 15);
  if (v11 == v12)
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = this;
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = (char *)this - a1[7];
    *a6 = 1;
  }

  return result;
}

uint64_t *__Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 40) = 0u;
  uint64_t v2 = a1 + 40;
  *(_OWORD *)(v2 + 16) = 0u;
  return lsl::Vector<dyld4::Atlas::Mapper::Mapping>::swap((uint64_t *)v2, (uint64_t *)(a2 + 40));
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  if (*(void *)(a1 + 48)) {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize(a1 + 40, 0LL);
  }
}

void ___ZN5dyld45Atlas6Mapper14mapperForMachOERN3lsl9AllocatorERNS_10FileRecordERKNS2_4UUIDEPKv_block_invoke_3( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) + *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + *(void *)(a2 + 16);
  int v8 = *(_DWORD *)(a1 + 64);
  lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve(v4 + 40, *(void *)(v4 + 56) + 1LL);
  uint64_t v9 = *(void *)(v4 + 48) + 32LL * *(void *)(v4 + 56);
  *(void *)uint64_t v9 = v5;
  *(void *)(v9 + 8) = v6;
  *(void *)(v9 + 16) = v7;
  *(_DWORD *)(v9 + 24) = v8;
  ++*(void *)(v4 + 56);
}

void dyld4::Atlas::Mapper::~Mapper(dyld4::Atlas::Mapper *this)
{
  if (*((void *)this + 4)) {
    dyld4::Atlas::Mapper::~Mapper();
  }
  uint64_t v15 = *((void *)this + 5);
  uint64_t v16 = 0LL;
  size_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = *((void *)this + 2);
  if (v3)
  {
    size_t v4 = 0LL;
    uint64_t v5 = 0LL;
    uint64_t v6 = 32 * v3;
    uint64_t v7 = (__int32 *)(v2 + 24);
    do
    {
      if (*v7 != -1)
      {
        int v8 = (__int32 *)&v5[v4];
        uint64_t v9 = wmemchr(v5, *v7, v4);
        uint64_t v10 = v9 ? v9 : v8;
        uint64_t v5 = v16;
        size_t v4 = v17;
        if (v10 == &v16[v17])
        {
          lsl::Vector<unsigned int>::reserve((uint64_t)&v15, v17 + 1);
          __int32 v11 = *v7;
          uint64_t v5 = v16;
          size_t v12 = v17;
          size_t v4 = ++v17;
          v16[v12] = v11;
        }
      }

      v7 += 8;
      v6 -= 32LL;
    }

    while (v6);
    if (v4)
    {
      uint64_t v13 = 4 * v4;
      do
      {
        int v14 = *v5++;
        close(v14);
        v13 -= 4LL;
      }

      while (v13);
      uint64_t v5 = v16;
    }

    if (v5) {
      lsl::Vector<unsigned int>::resize((uint64_t)&v15, 0LL);
    }
    uint64_t v2 = *((void *)this + 1);
  }

  if (v2) {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize((uint64_t)this, 0LL);
  }
}

char *dyld4::Atlas::Mapper::map(dyld4::Atlas::Mapper *this, char *a2, uint64_t a3)
{
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    return &a2[v3 - *(void *)(*((void *)this + 1) + 16LL)];
  }
  uint64_t v5 = *((void *)this + 2);
  if (v5)
  {
    uint64_t v6 = *((void *)this + 1);
    uint64_t v7 = 32 * v5;
    while (1)
    {
      unint64_t v8 = *(void *)(v6 + 16);
      if (v8 <= (unint64_t)a2)
      {
        unint64_t v9 = *(void *)(v6 + 8) + v8;
      }

      v6 += 32LL;
      v7 -= 32LL;
      if (!v7) {
        return 0LL;
      }
    }

    int v10 = *(_DWORD *)(v6 + 24);
    if (v10 == -1)
    {
      return &a2[*(void *)v6 - v8];
    }

    else
    {
      unint64_t v11 = (unint64_t)&a2[*(void *)v6 - v8];
      uint64_t v12 = -*MEMORY[0x189600148];
      uint64_t v13 = (char *)(v11 - (v11 & v12));
      int v14 = (char *)mmap(0LL, (size_t)&v13[a3], 1, 2, v10, v11 & v12);
      else {
        return &v14[(void)v13];
      }
    }
  }

  return a2;
}

uint64_t dyld4::Atlas::Mapper::pin(dyld4::Atlas::Mapper *this)
{
  if (*((void *)this + 4)) {
    dyld4::Atlas::Mapper::pin();
  }
  uint64_t v2 = (vm_map_t *)MEMORY[0x1895FFD48];
  if (vm_allocate( *MEMORY[0x1895FFD48],  (vm_address_t *)this + 4,  *(void *)(*((void *)this + 1) + 32LL * *((void *)this + 2) - 16)
       - *(void *)(*((void *)this + 1) + 16LL)
       + *(void *)(*((void *)this + 1) + 32LL * *((void *)this + 2) - 24),
         1))
  {
    return 0LL;
  }

  uint64_t v4 = *((void *)this + 2);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 1) + 16LL;
    for (uint64_t i = 32 * v4; i; i -= 32LL)
    {
      uint64_t v7 = *(void *)v5 - *(void *)(*((void *)this + 1) + 16LL);
      int v8 = *(_DWORD *)(v5 + 8);
      if (v8 == -1)
      {
        if (vm_copy(*v2, *(void *)v5, *(void *)(v5 - 8), v7 + *((void *)this + 4)))
        {
LABEL_12:
          dyld4::Atlas::Mapper::unpin(this);
          return 0LL;
        }
      }

      else if (mmap((void *)(v7 + *((void *)this + 4)), *(void *)(v5 - 8), 1, 18, v8, *(void *)(v5 - 16)) == (void *)-1LL)
      {
        goto LABEL_12;
      }

      v5 += 32LL;
    }
  }

  return 1LL;
}

uint64_t dyld4::Atlas::Mapper::unpin(dyld4::Atlas::Mapper *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (!v1) {
    dyld4::Atlas::Mapper::unpin();
  }
  uint64_t result = MEMORY[0x186DF7B88]( *MEMORY[0x1895FFD48],  v1,  *(void *)(*((void *)this + 1) + 32LL * *((void *)this + 2) - 16)
           - *(void *)(*((void *)this + 1) + 16LL)
           + *(void *)(*((void *)this + 1) + 32LL * *((void *)this + 2) - 24));
  *((void *)this + 4) = 0LL;
  return result;
}

void dyld4::Atlas::Image::swap(dyld4::Atlas::Image *this, dyld4::Atlas::Image *a2)
{
  if (this != a2)
  {
    __int128 v4 = *((_OWORD *)this + 6);
    *((_OWORD *)this + 6) = *((_OWORD *)a2 + 6);
    *((_OWORD *)a2 + 6) = v4;
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::swap((uint64_t *)this + 14, (uint64_t *)a2 + 14);
    std::optional<unsigned long long>::swap[abi:nn180100]((uint64_t *)this + 18, (uint64_t *)a2 + 18);
    uint64_t v5 = *((void *)this + 20);
    *((void *)this + 20) = *((void *)a2 + 20);
    *((void *)a2 + 20) = v5;
    uint64_t v6 = *((void *)this + 11);
    *((void *)this + 11) = *((void *)a2 + 11);
    *((void *)a2 + 11) = v6;
    uint64_t v7 = *((void *)this + 21);
    *((void *)this + 21) = *((void *)a2 + 21);
    *((void *)a2 + 21) = v7;
    uint64_t v8 = *((void *)this + 22);
    *((void *)this + 22) = *((void *)a2 + 22);
    *((void *)a2 + 22) = v8;
    dyld4::FileRecord::swap((dyld4::Atlas::Image *)((char *)this + 8), (dyld4::Atlas::Image *)((char *)a2 + 8));
    char v9 = *((_BYTE *)this + 184);
    *((_BYTE *)this + 184) = *((_BYTE *)a2 + 184);
    *((_BYTE *)a2 + 184) = v9;
    char v10 = *((_BYTE *)this + 185);
    *((_BYTE *)this + 185) = *((_BYTE *)a2 + 185);
    *((_BYTE *)a2 + 185) = v10;
    char v11 = *((_BYTE *)this + 186);
    *((_BYTE *)this + 186) = *((_BYTE *)a2 + 186);
    *((_BYTE *)a2 + 186) = v11;
  }

_DWORD *dyld4::Atlas::Image::ml(dyld4::Atlas::Image *this)
{
  if (*((_BYTE *)this + 186)) {
    return 0LL;
  }
  uint64_t result = (_DWORD *)*((void *)this + 16);
  if (result) {
    return result;
  }
  __int128 v4 = (__int128 *)((char *)this + 88);
  uint64_t v3 = (lsl::Allocator *)*((void *)this + 11);
  uint64_t v5 = (char *)*((void *)this + 20);
  if (!v3 || !*((void *)v3 + 1))
  {
    lsl::Allocator::defaultAllocator(0LL);
    dyld4::Atlas::Mapper::mapperForMachO( (dyld4::Atlas::Image *)((char *)this + 8),  (dyld4::Atlas::Image *)((char *)this + 96),  *((const UUID **)this + 20),  &v19);
    if (&v19 == v4)
    {
      uint64_t v7 = (lsl::Allocator *)v19;
      if (!(void)v19)
      {
LABEL_9:
        uint64_t v3 = *(lsl::Allocator **)v4;
        if (!*(void *)v4)
        {
LABEL_25:
          uint64_t result = 0LL;
          *((_BYTE *)this + 186) = 1;
          return result;
        }

        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v7 = *(lsl::Allocator **)v4;
      *(void *)__int128 v4 = v19;
      *(void *)&__int128 v19 = v7;
      if (!v7) {
        goto LABEL_9;
      }
    }

    lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v7, v6);
    goto LABEL_9;
  }

LABEL_10:
  uint64_t v8 = (dyld4::Atlas::Mapper *)*((void *)v3 + 1);
  if (!v8) {
    goto LABEL_25;
  }
  *(void *)&__int128 v19 = *((void *)v3 + 1);
  *((void *)&v19 + 1) = 4096LL;
  char v9 = dyld4::Atlas::Mapper::map(v8, v5, 4096LL);
  uint64_t v20 = v9;
  char v21 = v10;
  if ((__int128 *)((char *)this + 112) != &v19)
  {
    __int128 v19 = *((_OWORD *)this + 7);
    *((void *)this + 14) = v8;
    *((void *)this + 15) = 4096LL;
    char v11 = (char *)*((void *)this + 16);
    *((void *)this + 16) = v9;
    uint64_t v20 = v11;
    LOBYTE(v11) = *((_BYTE *)this + 136);
    *((_BYTE *)this + 136) = v10;
    char v21 = (char)v11;
  }

  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v19);
  uint64_t result = (_DWORD *)*((void *)this + 16);
  if (!result) {
    goto LABEL_25;
  }
  uint64_t v12 = result[5];
  uint64_t v13 = 28LL;
  if (*result == -17958193) {
    uint64_t v13 = 32LL;
  }
  uint64_t v14 = v13 + v12;
  if ((unint64_t)(v13 + v12) > 0x1000)
  {
    uint64_t v15 = *(void *)v4 ? *(dyld4::Atlas::Mapper **)(*(void *)v4 + 8LL) : 0LL;
    *(void *)&__int128 v19 = v15;
    *((void *)&v19 + 1) = v13 + v12;
    uint64_t v16 = dyld4::Atlas::Mapper::map(v15, v5, v14);
    uint64_t v20 = v16;
    char v21 = v17;
    if ((__int128 *)((char *)this + 112) != &v19)
    {
      __int128 v19 = *((_OWORD *)this + 7);
      *((void *)this + 14) = v15;
      *((void *)this + 15) = v14;
      uint64_t v18 = (char *)*((void *)this + 16);
      *((void *)this + 16) = v16;
      uint64_t v20 = v18;
      LOBYTE(v18) = *((_BYTE *)this + 136);
      *((_BYTE *)this + 136) = v17;
      char v21 = (char)v18;
    }

    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v19);
    uint64_t result = (_DWORD *)*((void *)this + 16);
    if (!result) {
      goto LABEL_25;
    }
  }

  return result;
}

uint64_t dyld4::Atlas::Image::uuid(dyld4::Atlas::Image *this)
{
  uint64_t v6 = *MEMORY[0x1895FEE08];
  if (!*((_BYTE *)this + 184))
  {
    uint64_t v2 = (mach_o::Header *)dyld4::Atlas::Image::ml(this);
    if (v2)
    {
      uint64_t v3 = v2;
      if (mach_o::Header::hasMachOMagic(v2) && dyld3::MachOFile::getUuid(v3, v5)) {
        *((_OWORD *)this + 6) = *(_OWORD *)v5;
      }
    }

    *((_BYTE *)this + 184) = 1;
  }

  return (uint64_t)this + 96;
}

uint64_t dyld4::Atlas::Image::installname(dyld4::Atlas::Image *this)
{
  if (!*((_BYTE *)this + 185))
  {
    if (dyld4::Atlas::Image::ml(this))
    {
      uint64_t v2 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(this);
      *((void *)this + 22) = dyld3::MachOFile::installName(v2);
    }

    *((_BYTE *)this + 185) = 1;
  }

  return *((void *)this + 22);
}

uint64_t dyld4::Atlas::Image::filename(dyld4::Atlas::Image *this)
{
  if (*((void *)this + 21)) {
    return 0LL;
  }
  else {
    return dyld4::FileRecord::getPath((dyld4::Atlas::Image *)((char *)this + 8));
  }
}

uint64_t dyld4::Atlas::Image::sharedCache(dyld4::Atlas::Image *this)
{
  return *((void *)this + 21);
}

uint64_t dyld4::Atlas::Image::sharedCacheVMOffset(dyld4::Atlas::Image *this)
{
  return *((void *)this + 20) - *(void *)(*((void *)this + 21) + 160LL);
}

uint64_t dyld4::Atlas::SharedCache::rebasedAddress(dyld4::Atlas::SharedCache *this)
{
  return *((void *)this + 20);
}

_DWORD *dyld4::Atlas::Image::pointerSize(dyld4::Atlas::Image *this)
{
  uint64_t result = dyld4::Atlas::Image::ml(this);
  if (result)
  {
    uint64_t v3 = (mach_o::Header *)dyld4::Atlas::Image::ml(this);
    return (_DWORD *)mach_o::Header::pointerSize(v3);
  }

  return result;
}

BOOL dyld4::Atlas::Image::forEachSegment(dyld4::Atlas::Image *a1, uint64_t a2)
{
  __int128 v4 = dyld4::Atlas::Image::ml(a1);
  if (v4)
  {
    v10[0] = 0LL;
    v10[1] = v10;
    vm_address_t v10[2] = 0x2000000000LL;
    uint64_t v5 = *((void *)a1 + 20);
    uint64_t v6 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(a1);
    void v10[3] = v5 - dyld3::MachOFile::preferredLoadAddress(v6);
    uint64_t v7 = dyld4::Atlas::Image::ml(a1);
    v9[0] = MEMORY[0x1895FED80];
    v9[1] = 0x40000000LL;
    v9[2] = ___ZN5dyld45Atlas5Image14forEachSegmentEU13block_pointerFvPKcyyiE_block_invoke;
    void v9[3] = &unk_1896302B0;
    void v9[5] = v10;
    void v9[6] = a1;
    v9[4] = a2;
    dyld3::MachOFile::forEachSegment(v7, (uint64_t)v9);
    _Block_object_dispose(v10, 8);
  }

  return v4 != 0LL;
}

uint64_t ___ZN5dyld45Atlas5Image14forEachSegmentEU13block_pointerFvPKcyyiE_block_invoke( uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(dyld4::Atlas::Image **)(a1 + 48);
  if (*((_BYTE *)v4 + 152)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  uint64_t v5 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(v4);
  if (!dyld3::MachOFile::isMainExecutable(v5)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  uint64_t result = strncmp(*(const char **)(a2 + 40), "__PAGEZERO", 0xAuLL);
  if ((_DWORD)result) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  return result;
}

BOOL dyld4::Atlas::Image::forEachSection(dyld4::Atlas::Image *a1, uint64_t a2)
{
  __int128 v4 = dyld4::Atlas::Image::ml(a1);
  if (v4)
  {
    v10[0] = 0LL;
    v10[1] = v10;
    vm_address_t v10[2] = 0x2000000000LL;
    uint64_t v5 = *((void *)a1 + 20);
    uint64_t v6 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(a1);
    void v10[3] = v5 - dyld3::MachOFile::preferredLoadAddress(v6);
    uint64_t v7 = dyld4::Atlas::Image::ml(a1);
    v9[0] = MEMORY[0x1895FED80];
    v9[1] = 0x40000000LL;
    v9[2] = ___ZN5dyld45Atlas5Image14forEachSectionEU13block_pointerFvPKcS3_yyE_block_invoke;
    void v9[3] = &unk_1896302D8;
    void v9[5] = v10;
    void v9[6] = a1;
    v9[4] = a2;
    dyld3::MachOFile::forEachSection(v7, (uint64_t)v9);
    _Block_object_dispose(v10, 8);
  }

  return v4 != 0LL;
}

uint64_t ___ZN5dyld45Atlas5Image14forEachSectionEU13block_pointerFvPKcS3_yyE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL dyld4::Atlas::Image::contentForSegment(dyld4::Atlas::Image *a1, uint64_t a2, uint64_t a3)
{
  if (!dyld4::Atlas::Image::ml(a1)) {
    return 0LL;
  }
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  char v16 = 0;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x2000000000LL;
  uint64_t v6 = *((void *)a1 + 20);
  uint64_t v7 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(a1);
  v12[3] = v6 - dyld3::MachOFile::preferredLoadAddress(v7);
  uint64_t v8 = dyld4::Atlas::Image::ml(a1);
  v11[0] = MEMORY[0x1895FED80];
  v11[1] = 0x40000000LL;
  v11[2] = ___ZN5dyld45Atlas5Image17contentForSegmentEPKcU13block_pointerFvPKvyyE_block_invoke;
  void v11[3] = &unk_189630300;
  void v11[7] = a1;
  _BYTE v11[8] = a2;
  void v11[4] = a3;
  void v11[5] = v12;
  v11[6] = &v13;
  dyld3::MachOFile::forEachSegment(v8, (uint64_t)v11);
  BOOL v9 = *((_BYTE *)v14 + 24) != 0;
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t ___ZN5dyld45Atlas5Image17contentForSegmentEPKcU13block_pointerFvPKvyyE_block_invoke( uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t result = strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 40));
  if (!(_DWORD)result)
  {
    if (*(_BYTE *)(v6 + 152))
    {
      uint64_t v8 = (void *)(v6 + 144);
    }

    else
    {
      BOOL v9 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml((dyld4::Atlas::Image *)v6);
      if (dyld3::MachOFile::isMainExecutable(v9))
      {
        uint64_t result = strncmp(*(const char **)(a2 + 40), "__PAGEZERO", 0xAuLL);
        if (!(_DWORD)result) {
          return result;
        }
      }

      uint64_t v8 = (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }

    uint64_t v10 = *(void *)(a2 + 24);
    char v11 = (char *)(*v8 + *(void *)(a2 + 16));
    if (v10)
    {
      uint64_t v12 = *(void *)(v6 + 88);
      if (v12) {
        uint64_t v13 = *(dyld4::Atlas::Mapper **)(v12 + 8);
      }
      else {
        uint64_t v13 = 0LL;
      }
      v15[0] = v13;
      v15[1] = v10;
      char v16 = dyld4::Atlas::Mapper::map(v13, v11, v10);
      char v17 = v14;
      (*(void (**)(void, char *, char *, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  v16,  v11,  *(void *)(a2 + 24));
      uint64_t result = dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v15);
    }

    else
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

uint64_t dyld4::Atlas::Image::contentForSection(dyld4::Atlas::Image *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = 0LL;
  char v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  char v18 = 0;
  v14[0] = 0LL;
  v14[1] = v14;
  void v14[2] = 0x2000000000LL;
  uint64_t v8 = *((void *)a1 + 20);
  BOOL v9 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(a1);
  void v14[3] = v8 - dyld3::MachOFile::preferredLoadAddress(v9);
  uint64_t v10 = dyld4::Atlas::Image::ml(a1);
  v13[0] = MEMORY[0x1895FED80];
  v13[1] = 0x40000000LL;
  v13[2] = ___ZN5dyld45Atlas5Image17contentForSectionEPKcS3_U13block_pointerFvPKvyyE_block_invoke;
  v13[3] = &unk_189630328;
  void v13[8] = a2;
  v13[9] = a3;
  v13[4] = a4;
  v13[5] = v14;
  v13[6] = &v15;
  v13[7] = a1;
  dyld3::MachOFile::forEachSection(v10, (uint64_t)v13);
  uint64_t v11 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t ___ZN5dyld45Atlas5Image17contentForSectionEPKcS3_U13block_pointerFvPKvyyE_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t result = strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 40));
  if (!(_DWORD)result)
  {
    uint64_t result = strcmp(*(const char **)(a1 + 72), *(const char **)(a2 + 80));
    if (!(_DWORD)result)
    {
      if (*(_BYTE *)(v7 + 152)) {
        BOOL v9 = (void *)(v7 + 144);
      }
      else {
        BOOL v9 = (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      uint64_t v10 = *(void *)(a2 + 72);
      uint64_t v11 = (char *)(*v9 + *(void *)(a2 + 64));
      if (v10)
      {
        uint64_t v12 = *(void *)(v7 + 88);
        if (v12) {
          uint64_t v13 = *(dyld4::Atlas::Mapper **)(v12 + 8);
        }
        else {
          uint64_t v13 = 0LL;
        }
        v15[0] = v13;
        v15[1] = v10;
        char v16 = dyld4::Atlas::Mapper::map(v13, v11, v10);
        char v17 = v14;
        (*(void (**)(void, char *, char *, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  v16,  v11,  *(void *)(a2 + 72));
        uint64_t result = dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v15);
      }

      else
      {
        uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      *a4 = 1;
    }
  }

  return result;
}

unsigned int **dyld4::Atlas::SharedCacheLocals::SharedCacheLocals( unsigned int **a1, unsigned int **a2, char a3)
{
  __int128 v4 = *a2;
  *a1 = *a2;
  if (v4)
  {
    do
      unsigned int v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    uint64_t v6 = *a1;
    a1[1] = 0LL;
    uint64_t v7 = (__int128 *)(a1 + 1);
    a1[2] = 0LL;
    a1[3] = 0LL;
    *((_BYTE *)a1 + 32) = 0;
    *((_BYTE *)a1 + 40) = a3;
    if (v6) {
      uint64_t v8 = (dyld4::Atlas::Mapper *)*((void *)v6 + 1);
    }
    else {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
    a1[1] = 0LL;
    uint64_t v7 = (__int128 *)(a1 + 1);
    *((_BYTE *)a1 + 32) = 0;
    a1[2] = 0LL;
    a1[3] = 0LL;
    *((_BYTE *)a1 + 40) = a3;
  }

  v21[0] = v8;
  v21[1] = 520LL;
  BOOL v9 = dyld4::Atlas::Mapper::map(v8, 0LL, 520LL);
  v21[2] = v9;
  char v22 = v10;
  if (*a1) {
    uint64_t v11 = (dyld4::Atlas::Mapper *)*((void *)*a1 + 1);
  }
  else {
    uint64_t v11 = 0LL;
  }
  uint64_t v12 = (char *)*((void *)v9 + 9);
  uint64_t v13 = *((void *)v9 + 10);
  *(void *)&__int128 v18 = v11;
  *((void *)&v18 + 1) = v13;
  char v14 = dyld4::Atlas::Mapper::map(v11, v12, v13);
  __int128 v19 = v14;
  char v20 = v15;
  if (v7 != &v18)
  {
    __int128 v18 = *(_OWORD *)(a1 + 1);
    a1[1] = (unsigned int *)v11;
    a1[2] = (unsigned int *)v13;
    char v16 = (char *)a1[3];
    a1[3] = (unsigned int *)v14;
    __int128 v19 = v16;
    LOBYTE(v16) = *((_BYTE *)a1 + 32);
    *((_BYTE *)a1 + 32) = v15;
    char v20 = (char)v16;
  }

  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v18);
  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v21);
  return a1;
}

uint64_t dyld4::Atlas::SharedCacheLocals::localInfo(dyld4::Atlas::SharedCacheLocals *this)
{
  return *((void *)this + 3);
}

uint64_t dyld4::Atlas::SharedCacheLocals::use64BitDylibOffsets(dyld4::Atlas::SharedCacheLocals *this)
{
  return *((unsigned __int8 *)this + 40);
}

uint64_t dyld4::Atlas::SharedCache::SharedCache( uint64_t a1, uint64_t a2, dyld4::FileRecord *a3, unsigned int **a4, char *a5, char a6)
{
  *(void *)a1 = a2;
  dyld4::FileRecord::FileRecord(a1 + 8, a3);
  *(void *)(a1 + 88) = 0LL;
  *(void *)(a1 + 112) = 0LL;
  char v10 = (__int128 *)(a1 + 112);
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 120) = 0LL;
  *(void *)(a1 + 128) = 0LL;
  *(_BYTE *)(a1 + 136) = 0;
  uint64_t v11 = *a4;
  *(void *)(a1 + 144) = *a4;
  if (!v11)
  {
    *(void *)(a1 + 152) = 0LL;
    *(void *)(a1 + 160) = a5;
    *(_BYTE *)(a1 + 168) = a6;
    goto LABEL_52;
  }

  do
    unsigned int v12 = __ldxr(v11);
  while (__stxr(v12 + 1, v11));
  uint64_t v13 = *(void *)(a1 + 144);
  *(void *)(a1 + 152) = 0LL;
  *(void *)(a1 + 160) = a5;
  *(_BYTE *)(a1 + 168) = a6;
  if (!v13 || (char v14 = *(dyld4::Atlas::Mapper **)(v13 + 8)) == 0LL) {
LABEL_52:
  }
    dyld4::Atlas::SharedCache::SharedCache();
  char v15 = (uint64_t *)MEMORY[0x189600148];
  uint64_t v16 = *MEMORY[0x189600148];
  *(void *)&__int128 v59 = *(void *)(v13 + 8);
  *((void *)&v59 + 1) = v16;
  char v17 = dyld4::Atlas::Mapper::map(v14, a5, v16);
  int64_t v60 = v17;
  char v61 = v18;
  if (v10 != &v59)
  {
    __int128 v59 = *(_OWORD *)(a1 + 112);
    *(void *)(a1 + 112) = v14;
    *(void *)(a1 + 120) = v16;
    __int128 v19 = *(char **)(a1 + 128);
    *(void *)(a1 + 128) = v17;
    int64_t v60 = v19;
    LOBYTE(v19) = *(_BYTE *)(a1 + 136);
    *(_BYTE *)(a1 + 136) = v18;
    char v61 = (char)v19;
  }

  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v59);
  uint64_t v20 = *(void *)(a1 + 128);
  unsigned int v21 = *(_DWORD *)(v20 + 16);
  if (v21 >= 0x18C) {
    unint64_t v22 = *(unsigned int *)(v20 + 392) + 56LL * *(unsigned int *)(v20 + 396);
  }
  else {
    unint64_t v22 = *(unsigned int *)(v20 + 24) + 32LL * *(unsigned int *)(v20 + 28);
  }
  if (v22 > *v15)
  {
    uint64_t v23 = *(void *)(a1 + 144);
    if (v23) {
      uint64_t v24 = *(dyld4::Atlas::Mapper **)(v23 + 8);
    }
    else {
      uint64_t v24 = 0LL;
    }
    uint64_t v25 = *(char **)(a1 + 160);
    *(void *)&__int128 v59 = v24;
    *((void *)&v59 + 1) = v22;
    uint64_t v26 = dyld4::Atlas::Mapper::map(v24, v25, v22);
    int64_t v60 = v26;
    char v61 = v27;
    if (v10 != &v59)
    {
      __int128 v59 = *(_OWORD *)(a1 + 112);
      *(void *)(a1 + 112) = v24;
      *(void *)(a1 + 120) = v22;
      uint64_t v28 = *(char **)(a1 + 128);
      *(void *)(a1 + 128) = v26;
      int64_t v60 = v28;
      LOBYTE(v28) = *(_BYTE *)(a1 + 136);
      *(_BYTE *)(a1 + 136) = v27;
      char v61 = (char)v28;
    }

    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v59);
    uint64_t v20 = *(void *)(a1 + 128);
  }

  *(_OWORD *)(a1 + 88) = *(_OWORD *)(v20 + 88);
  uint64_t v29 = *(void *)(v20 + 224);
  *(void *)(a1 + 152) = *(void *)(a1 + 160) - v29;
  if (*(_DWORD *)(v20 + 16) < 0x18Cu)
  {
    uint64_t v31 = *(unsigned int *)(v20 + 316);
    if ((_DWORD)v31)
    {
      unint64_t v32 = 0LL;
      uint64_t v33 = (void *)(*(unsigned int *)(v20 + 312) + v20 + 8);
      do
      {
        if (v32 <= *v33 + *(v33 - 1)) {
          unint64_t v32 = *v33 + *(v33 - 1);
        }
        v33 += 7;
        --v31;
      }

      while (v31);
    }

    else
    {
      unint64_t v32 = 0LL;
    }

    if (v21 >= 0x18C && *(_DWORD *)(v20 + 396))
    {
      unint64_t v34 = 0LL;
      uint64_t v35 = v20;
      do
      {
        unsigned int v36 = *(_DWORD *)(v35 + 16);
        uint64_t v37 = v20 + *(unsigned int *)(v35 + 392);
        uint64_t v38 = v37 + 24 * v34 + 16;
        uint64_t v39 = (void *)(v37 + 56 * v34 + 16);
        if (v36 < 0x1C9) {
          uint64_t v39 = (void *)v38;
        }
        uint64_t v40 = *(void *)(a1 + 144);
        if (v40) {
          __int128 v41 = *(dyld4::Atlas::Mapper **)(v40 + 8);
        }
        else {
          __int128 v41 = 0LL;
        }
        uint64_t v42 = &a5[*v39];
        uint64_t v43 = *v15;
        *(void *)&__int128 v59 = v41;
        *((void *)&v59 + 1) = v43;
        uint64_t v44 = dyld4::Atlas::Mapper::map(v41, v42, v43);
        int64_t v60 = v44;
        char v61 = v45;
        if (*((_DWORD *)v44 + 4) < 0x18Cu) {
          unint64_t v46 = *((unsigned int *)v44 + 6) + 32LL * *((unsigned int *)v44 + 7);
        }
        else {
          unint64_t v46 = *((unsigned int *)v44 + 98) + 56LL * *((unsigned int *)v44 + 99);
        }
        if (v46 > *v15)
        {
          uint64_t v47 = *(void *)(a1 + 144);
          if (v47) {
            uint64_t v48 = *(dyld4::Atlas::Mapper **)(v47 + 8);
          }
          else {
            uint64_t v48 = 0LL;
          }
          *(void *)&__int128 v56 = v48;
          *((void *)&v56 + 1) = v46;
          uint64_t v49 = dyld4::Atlas::Mapper::map(v48, v42, v46);
          __int128 v50 = v56;
          __int128 v56 = v59;
          __int128 v59 = v50;
          uint64_t v51 = v60;
          int64_t v60 = v49;
          uint64_t v57 = v51;
          LOBYTE(v51) = v61;
          char v61 = v52;
          char v58 = (char)v51;
          dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v56);
          uint64_t v44 = v60;
        }

        uint64_t v53 = *((unsigned int *)v44 + 79);
        if ((_DWORD)v53)
        {
          BOOL v54 = &v44[*((unsigned int *)v44 + 78) + 8];
          do
          {
            if (v32 <= *(void *)v54 + *((void *)v54 - 1)) {
              unint64_t v32 = *(void *)v54 + *((void *)v54 - 1);
            }
            v54 += 56;
            --v53;
          }

          while (v53);
        }

        dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v59);
        ++v34;
        uint64_t v35 = *(void *)(a1 + 128);
      }

      while (v34 < *(unsigned int *)(v35 + 396));
      uint64_t v29 = *(void *)(v35 + 224);
    }

    uint64_t v30 = v32 - v29;
  }

  else
  {
    uint64_t v30 = *(void *)(v20 + 232);
  }

  *(void *)(a1 + 104) = v30;
  return a1;
}

void dyld4::Atlas::SharedCache::forEachInstalledCacheWithSystemPath( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v4 = (lsl::Lock **)MEMORY[0x1895FE128](a1, a2, a3, a4);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  char v10 = v9;
  uint64_t v11 = v4;
  uint64_t v12 = 0LL;
  uint64_t v47 = *MEMORY[0x1895FEE08];
  uint64_t v32 = 0LL;
  uint64_t v33 = v4;
  uint64_t v34 = 0LL;
  char v35 = 0;
  do
  {
    v42[0] = 0;
    if ((!v8 || dyld4::Utils::concatenatePaths((dyld4::Utils *)v42, v8, (const char *)0x400) <= 0x3FF)
      && dyld4::Utils::concatenatePaths( (dyld4::Utils *)v42,  dyld4::Atlas::SharedCache::forEachInstalledCacheWithSystemPath(lsl::Allocator &,dyld4::FileManager &,char const*,void({block_pointer})(dyld4::Atlas::SharedCache*))::cacheDirPaths[v12],  (const char *)0x400) <= 0x3FF)
    {
      __source[0] = 0;
      if (realpath_DARWIN_EXTSN(v42, __source))
      {
        if (dyld4::Utils::concatenatePaths((dyld4::Utils *)__source, "/", (const char *)0x400) <= 0x3FF)
        {
          uint64_t v31 = lsl::Allocator::strdup(v11, __source);
          lsl::OrderedSet<char const*,lsl::ConstCharStarCompare>::insert(&v32, (char **)&v31, (uint64_t)v39);
          if (v39[104])
          {
            char v15 = opendir(__source);
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v30 = 0LL;
              __dst[0] = 0;
              while (!readdir_r(v16, &v38, &v30) && v30)
              {
                if (v30->d_type == 8
                  && !DyldSharedCache::isSubCachePath((DyldSharedCache *)v30->d_name, v17)
                  && strlcpy(__dst, __source, 0x400uLL) <= 0x3FF
                  && dyld4::Utils::concatenatePaths((dyld4::Utils *)__dst, v30->d_name, (const char *)0x400) <= 0x3FF)
                {
                  dyld4::FileManager::fileRecordForPath(v10, v11, __dst, (uint64_t)v36);
                  dyld4::Atlas::SharedCache::createForFileRecord( (dyld4::Atlas::Mapper *)v11,  (lsl::Allocator *)v36,  v18,  &v29);
                  __int128 v19 = v29;
                  if (v29) {
                    (*(void (**)(uint64_t))(v6 + 16))(v6);
                  }
                  lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr(&v29, v19);
                  dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v36);
                }
              }

              closedir(v16);
            }
          }

          else
          {
            lsl::Allocator::free(v11, v31);
          }
        }
      }
    }

    ++v12;
  }

  while (v12 != 15);
  v38.d_ino = (__uint64_t)&v32;
  memset(&v38.d_seekoff, 0, 91);
  uint64_t v20 = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t)&v38, v13, v14);
  uint64_t v21 = *(void *)v20;
  v43[0] = *(_OWORD *)(v20 + 8);
  __int128 v22 = *(_OWORD *)(v20 + 72);
  __int128 v23 = *(_OWORD *)(v20 + 56);
  __int128 v24 = *(_OWORD *)(v20 + 40);
  v43[1] = *(_OWORD *)(v20 + 24);
  v43[2] = v24;
  v43[3] = v23;
  v43[4] = v22;
  uint64_t v25 = *(void *)(v20 + 88);
  __int16 v45 = *(_WORD *)(v20 + 96);
  unsigned __int8 v26 = *(_BYTE *)(v20 + 98);
  uint64_t v44 = v25;
  *(void *)uint64_t v42 = v21;
  unsigned __int8 v46 = v26;
  __int128 v41 = 0u;
  memset(&v38.d_seekoff, 0, 91);
  v38.d_ino = (__uint64_t)&v32;
  while (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>( (uint64_t)v42,  (uint64_t)&v38))
  {
    lsl::Allocator::free(v11, *(void **)(*((void *)v43 + v46 - 1) + 8LL * *((unsigned __int8 *)&v44 + v46 - 1)));
    lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t)v42, v27, v28);
  }

  if (v32) {
    lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::deallocate(v32, v33);
  }
}

double lsl::OrderedSet<char const*,lsl::ConstCharStarCompare>::insert@<D0>( uint64_t *a1@<X0>, char **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  uint64_t v8 = *a2;
  lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::const_iterator((uint64_t)v19, a1, &v8);
  lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::insert_internal((uint64_t)a1, (uint64_t)v19, &v8, (uint64_t)&v9);
  uint64_t v5 = v9;
  *(_OWORD *)(a3 + 24) = v11;
  *(_OWORD *)(a3 + 40) = v12;
  *(_OWORD *)(a3 + 56) = v13;
  *(_OWORD *)(a3 + 72) = v14;
  double result = *(double *)&v10;
  *(_OWORD *)(a3 + 8) = v10;
  *(void *)(a3 + 88) = v15;
  *(_WORD *)(a3 + 96) = v16;
  char v7 = v17;
  *(void *)a3 = v5;
  *(_BYTE *)(a3 + 98) = v7;
  *(_BYTE *)(a3 + 104) = v18;
  return result;
}

void dyld4::Atlas::SharedCache::createForFileRecord( dyld4::Atlas::Mapper *a1@<X0>, lsl::Allocator *a2@<X1>, const void *a3@<X3>, void *a4@<X8>)
{
  uint64_t v8 = v12;
  if (!v12)
  {
    *a4 = 0LL;
    return;
  }

  if (!*((void *)v12 + 1))
  {
    *a4 = 0LL;
    goto LABEL_7;
  }

  uint64_t v9 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v12);
  __int128 v10 = *(char **)(*(void *)(*((void *)v12 + 1) + 8LL) + 16LL);
  __int128 v11 = lsl::Allocator::aligned_alloc(v9, 8uLL, 0xB0uLL);
  dyld4::Atlas::SharedCache::SharedCache((uint64_t)v11, (uint64_t)a1, a2, (unsigned int **)&v12, v10, 1);
  uint64_t v8 = v12;
  *a4 = v11;
  if (v8) {
LABEL_7:
  }
    lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v8, v7);
}

uint64_t dyld4::Atlas::SharedCache::uuid(dyld4::Atlas::SharedCache *this)
{
  return (uint64_t)this + 88;
}

uint64_t dyld4::Atlas::SharedCache::size(dyld4::Atlas::SharedCache *this)
{
  return *((void *)this + 13);
}

uint64_t dyld4::Atlas::SharedCache::forEachFilePath(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  __int128 v4 = (dyld4::FileRecord *)(a1 + 8);
  uint64_t Path = dyld4::FileRecord::getPath((dyld4::FileRecord *)(a1 + 8));
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, Path);
  uint64_t v7 = *(void *)(a1 + 128);
  unsigned int v8 = *(_DWORD *)(v7 + 16);
  if (v8 >= 0x18C)
  {
    if (v8 > 0x1C8)
    {
      if (*(_DWORD *)(v7 + 396))
      {
        unint64_t v11 = 0LL;
        __int128 v12 = (const char *)(*(unsigned int *)(v7 + 392) + v7 + 24);
        do
        {
          __int128 v13 = (const char *)dyld4::FileRecord::getPath(v4);
          snprintf(__str, 0x400uLL, "%s%s", v13, v12);
          uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, __str);
          ++v11;
          uint64_t v7 = *(void *)(a1 + 128);
          v12 += 56;
        }

        while (v11 < *(unsigned int *)(v7 + 396));
      }
    }

    else if (*(_DWORD *)(v7 + 396))
    {
      unsigned int v9 = 0;
      do
      {
        __int128 v10 = (const char *)dyld4::FileRecord::getPath(v4);
        snprintf(__str, 0x400uLL, "%s.%u", v10, ++v9);
        uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, __str);
        uint64_t v7 = *(void *)(a1 + 128);
      }

      while (v9 < *(_DWORD *)(v7 + 396));
    }

    if (*(_DWORD *)(v7 + 16) >= 0x190u)
    {
      uint64_t result = uuid_is_null((const unsigned __int8 *)(v7 + 400));
      if (!(_DWORD)result)
      {
        __int128 v14 = (const char *)dyld4::FileRecord::getPath(v4);
        strlcpy(__str, v14, 0x400uLL);
        if (strstr(__str, ".development")) {
          __str[strlen(__str) - 12] = 0;
        }
        strlcat(__str, ".symbols", 0x400uLL);
        return (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, __str);
      }
    }
  }

  return result;
}

uint64_t dyld4::Atlas::SharedCache::isPrivateMapped(dyld4::Atlas::SharedCache *this)
{
  return *((unsigned __int8 *)this + 168);
}

void dyld4::Atlas::SharedCache::forEachImage(void *a1, uint64_t a2)
{
  v26[2] = *MEMORY[0x1895FEE08];
  uint64_t v2 = a1[16];
  uint64_t v3 = *(void *)(v2 + 144);
  if (v3)
  {
    uint64_t v6 = v2 + *(void *)(v2 + 136);
    uint64_t v7 = v6 + 32 * v3;
    __int128 v8 = 0uLL;
    do
    {
      uint64_t v9 = *(void *)(v6 + 16);
      uint64_t v14 = *a1;
      v15[0] = v8;
      v15[1] = v8;
      void v15[2] = v8;
      v15[3] = v8;
      uint64_t v16 = 0x1FFFFFFFFLL;
      __int16 v17 = 0;
      char v18 = 1;
      unint64_t v11 = (lsl::Allocator *)a1[18];
      uint64_t v10 = a1[19];
      __int128 v19 = v11;
      if (v11)
      {
        do
          unsigned int v12 = __ldxr((unsigned int *)v11);
        while (__stxr(v12 + 1, (unsigned int *)v11));
      }

      *(_OWORD *)((char *)v21 + 9) = v8;
      __int128 v20 = v8;
      v21[0] = v8;
      uint64_t v22 = v10;
      char v23 = 1;
      uint64_t v24 = v10 + v9;
      uint64_t v25 = a1;
      v26[0] = 0LL;
      *(_DWORD *)((char *)v26 + 7) = 0;
      (*(void (**)(uint64_t, uint64_t *))(a2 + 16))(a2, &v14);
      dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v21);
      if (v19) {
        lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v19, v13);
      }
      dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v15);
      v6 += 32LL;
      __int128 v8 = 0uLL;
    }

    while (v6 != v7);
  }

void dyld4::Atlas::SharedCache::withImageForIndex(void *a1, unsigned int a2, uint64_t a3)
{
  vm_address_t v20[2] = *MEMORY[0x1895FEE08];
  uint64_t v3 = *(void *)(a1[16] + *(void *)(a1[16] + 136LL) + 32LL * a2 + 16);
  uint64_t v8 = *a1;
  memset(v9, 0, sizeof(v9));
  uint64_t v10 = 0x1FFFFFFFFLL;
  __int16 v11 = 0;
  char v12 = 1;
  uint64_t v5 = (lsl::Allocator *)a1[18];
  uint64_t v4 = a1[19];
  __int128 v13 = v5;
  if (v5)
  {
    do
      unsigned int v6 = __ldxr((unsigned int *)v5);
    while (__stxr(v6 + 1, (unsigned int *)v5));
  }

  memset(v15, 0, 25);
  __int128 v14 = 0uLL;
  uint64_t v16 = v4;
  char v17 = 1;
  uint64_t v18 = v4 + v3;
  __int128 v19 = a1;
  v20[0] = 0LL;
  *(_DWORD *)((char *)v20 + 7) = 0;
  (*(void (**)(uint64_t, uint64_t *))(a3 + 16))(a3, &v8);
  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v15);
  if (v13) {
    lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v13, v7);
  }
  dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v9);
}

void dyld4::Atlas::SharedCache::localSymbols(dyld4::Atlas::SharedCache *this@<X0>, unsigned int ***a2@<X8>)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  uint64_t v4 = (dyld4::Atlas::SharedCache *)((char *)this + 8);
  uint64_t Path = (const char *)dyld4::FileRecord::getPath((dyld4::Atlas::SharedCache *)((char *)this + 8));
  strlcpy(__dst, Path, 0x400uLL);
  uint64_t v6 = *((void *)this + 16);
  unsigned int v7 = *(_DWORD *)(v6 + 16);
  if (v7 < 0x190)
  {
    if (*(void *)(v6 + 80) && *(void *)(v6 + 72)) {
      goto LABEL_8;
    }
LABEL_12:
    *a2 = 0LL;
    return;
  }

  if (strstr(__dst, ".development")) {
    __dst[strlen(__dst) - 12] = 0;
  }
  strlcat(__dst, ".symbols", 0x400uLL);
LABEL_8:
  uint64_t v8 = (dyld4::FileManager *)dyld4::FileRecord::fileManager(v4);
  dyld4::FileManager::fileRecordForPath(v8, *(lsl::Lock ***)this, __dst, (uint64_t)v17);
  dyld4::Atlas::Mapper::mapperForSharedCacheLocals(v9, (lsl::Allocator *)v17, v10, v11);
  __int128 v13 = v16;
  if (v16)
  {
    if (*((void *)v16 + 1))
    {
      __int128 v14 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v16);
      uint64_t v15 = (unsigned int **)lsl::Allocator::aligned_alloc(v14, 8uLL, 0x30uLL);
      dyld4::Atlas::SharedCacheLocals::SharedCacheLocals(v15, (unsigned int **)&v16, v7 > 0x18F);
      __int128 v13 = v16;
      *a2 = v15;
      if (!v13) {
        goto LABEL_16;
      }
    }

    else
    {
      *a2 = 0LL;
    }

    lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v13, v12);
  }

  else
  {
    *a2 = 0LL;
  }

LABEL_16:
  dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v17);
}

  uint64_t v10 = v5[1];
  if ((v10 & 1) != 0) {
    lsl::Allocator::Pool::aligned_alloc_best_fit();
  }
  uint64_t v11 = (lsl::Allocator::Pool *)(v5 + 2);
  v5[1] = v10 | 1;
  if (v11 == this) {
    lsl::Allocator::Pool::aligned_alloc_best_fit();
  }
  return v11;
}

uint64_t dyld4::Atlas::SharedCache::pin(dyld4::Atlas::SharedCache *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1) {
    return dyld4::Atlas::Mapper::pin(*(dyld4::Atlas::Mapper **)(v1 + 8));
  }
  else {
    return dyld4::Atlas::Mapper::pin(0LL);
  }
}

uint64_t dyld4::Atlas::SharedCache::unpin(dyld4::Atlas::SharedCache *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1) {
    return dyld4::Atlas::Mapper::unpin(*(dyld4::Atlas::Mapper **)(v1 + 8));
  }
  else {
    return dyld4::Atlas::Mapper::unpin(0LL);
  }
}

dyld4::Atlas::Process *dyld4::Atlas::Process::Process( dyld4::Atlas::Process *this, lsl::Allocator *a2, dyld4::FileManager *a3, int a4, int *a5)
{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = 0;
  unsigned int v7 = (lsl::Allocator *)dispatch_queue_create("com.apple.dyld.introspection", 0LL);
  *((void *)this + 3) = v7;
  *((void *)this + 4) = 0LL;
  *((_DWORD *)this + 10) = 0;
  uint64_t v8 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v7);
  *((void *)this + 6) = 0LL;
  *((void *)this + 7) = v8;
  *((void *)this + 9) = 0LL;
  *((_BYTE *)this + 80) = 0;
  uint64_t v9 = lsl::Allocator::defaultAllocator(v8);
  *((void *)this + 11) = 0LL;
  *((void *)this + 12) = v9;
  *((void *)this + 14) = 0LL;
  *((_BYTE *)this + 120) = 0;
  *((void *)this + 16) = 0LL;
  uint64_t v10 = (lsl::Allocator **)((char *)this + 128);
  *((_DWORD *)this + 34) = 1;
  dyld4::Atlas::Process::getSnapshot(this, a5, v11, v12);
  if (&v16 != (lsl::Allocator **)((char *)this + 128))
  {
    __int128 v14 = *v10;
    dyld4::FileRecord *v10 = v16;
    uint64_t v16 = v14;
  }

  lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v16, v13);
  return this;
}

void dyld4::Atlas::Process::getSnapshot(dyld4::Atlas::Process *this, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = MEMORY[0x1895FE128](this, a2, a3, a4);
  uint64_t v6 = v4;
  uint64_t v8 = v7;
  uint64_t v38 = *MEMORY[0x1895FEE08];
  if (v5) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = (unsigned int *)&v32;
  }
  mach_msg_type_number_t task_info_outCnt = 5;
  int v32 = 0;
  LODWORD(v10) = task_info(*(_DWORD *)(v4 + 16), 0x11u, task_info_out, &task_info_outCnt);
  unsigned int *v9 = v10;
  if ((_DWORD)v10)
  {
    int v11 = -285212672;
LABEL_6:
    int v12 = v11 & 0xFF000000 | v10 & 0xFFFFFF;
    goto LABEL_7;
  }

  if (!*(void *)task_info_out)
  {
    int v12 = -301989888;
LABEL_7:
    unsigned int *v9 = v12;
    *uint64_t v8 = 0LL;
    return;
  }

  mach_vm_size_t outsize = 0LL;
  while (1)
  {
    uint64_t v10 = (lsl::Allocator *)mach_vm_read_overwrite( *(_DWORD *)(v6 + 16),  *(mach_vm_address_t *)task_info_out,  v29,  (mach_vm_address_t)v33,  &outsize);
    unsigned int *v9 = v10;
    if ((_DWORD)v10)
    {
      int v11 = -318767104;
      goto LABEL_6;
    }

    if (!v30) {
      break;
    }
    mach_vm_address_t v13 = v36;
    unint64_t v14 = v37;
    if (!v37) {
      goto LABEL_28;
    }
LABEL_15:
    uint64_t v15 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v10);
    uint64_t v16 = (lsl::Allocator *)lsl::Allocator::malloc(v15, v14);
    char v17 = (lsl::Allocator *)mach_vm_read_overwrite(*(_DWORD *)(v6 + 16), v13, v14, (mach_vm_address_t)v16, &outsize);
    int v19 = (int)v17;
    unsigned int *v9 = v17;
    if (!(_DWORD)v17)
    {
      __int128 v20 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v17);
      uint64_t v21 = *(void *)v6;
      uint64_t v22 = *(void *)(v6 + 8);
      char v23 = (__int128 *)lsl::Allocator::aligned_alloc(v20, 8uLL, 0x70uLL);
      uint64_t v24 = dyld4::Atlas::ProcessSnapshot::ProcessSnapshot(v23, v21, v22, 0, (uint64_t)v16, v14);
      unsigned __int8 v26 = (lsl::Allocator *)v24;
      if (*((_BYTE *)v24 + 105))
      {
        *uint64_t v8 = 0LL;
        if (&v26 != v8)
        {
          *uint64_t v8 = (lsl::Allocator *)v24;
          unsigned __int8 v26 = 0LL;
        }
      }

      else
      {
        unsigned int *v9 = -352321531;
        *uint64_t v8 = 0LL;
      }

      lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v26, v25);
      if (!v16) {
        goto LABEL_18;
      }
LABEL_17:
      lsl::Allocator::freeObject(v16, v18);
      goto LABEL_18;
    }

    unsigned int *v9 = v17 & 0xFFFFFF | 0xEC000000;
    if (v16) {
      goto LABEL_17;
    }
LABEL_18:
    if (!v19) {
      return;
    }
  }

  mach_vm_address_t v13 = v34;
  unint64_t v14 = v35;
  if (v35) {
    goto LABEL_15;
  }
LABEL_28:
  dyld4::Atlas::Process::synthesizeSnapshot((mach_port_name_t *)v6, v9, v8);
}

void dyld4::Atlas::Process::~Process(dyld4::Atlas::Process *this)
{
  uint64_t v2 = (dispatch_queue_s *)*((void *)this + 3);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = ___ZN5dyld45Atlas7ProcessD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_42;
  block[4] = this;
  dispatch_async_and_wait(v2, block);
  dispatch_release(*((dispatch_object_t *)this + 3));
  lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr((lsl::Allocator **)this + 16, v3);
  uint64_t v4 = *((void *)this + 11);
  if (v4)
  {
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::deallocate( v4,  *((lsl::Lock ***)this + 12));
    *((void *)this + 11) = 0LL;
  }

  *((void *)this + 14) = 0LL;
  *((_BYTE *)this + 120) = 0;
  uint64_t v5 = *((void *)this + 6);
  if (v5)
  {
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::deallocate( v5,  *((lsl::Lock ***)this + 7));
    *((void *)this + 6) = 0LL;
  }

  *((void *)this + 9) = 0LL;
  *((_BYTE *)this + 80) = 0;
}

dispatch_source_s *___ZN5dyld45Atlas7ProcessD2Ev_block_invoke(uint64_t a1)
{
  uint64_t result = *(dispatch_source_s **)(a1 + 32);
  if (*((_DWORD *)result + 10) == 1) {
    return dyld4::Atlas::Process::teardownNotifications((dispatch_queue_t *)result);
  }
  return result;
}

dispatch_source_s *dyld4::Atlas::Process::teardownNotifications(dispatch_queue_t *this)
{
  uint64_t v62 = *MEMORY[0x1895FEE08];
  if (dispatch_get_current_queue() != this[3]) {
    dyld4::Atlas::Process::teardownNotifications();
  }
  if (*((_DWORD *)this + 10) != 1) {
    dyld4::Atlas::Process::teardownNotifications();
  }
  uint64_t result = (dispatch_source_s *)this[4];
  if (result)
  {
    dispatch_source_cancel(result);
    *((_DWORD *)this + 5) = 0;
    this[4] = 0LL;
    *((_DWORD *)this + 10) = 0;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    memset(v52, 0, 24);
    uint64_t v44 = (char *)(this + 11);
    uint64_t v5 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v44,  v3,  v4);
    uint64_t v6 = *(void *)v5;
    __int128 v7 = *(_OWORD *)(v5 + 104);
    __int128 v8 = *(_OWORD *)(v5 + 88);
    uint64_t v9 = *(void *)(v5 + 120);
    uint64_t v10 = *(void *)(v5 + 128);
    __int128 v39 = *(_OWORD *)(v5 + 72);
    __int128 v40 = v8;
    __int128 v41 = v7;
    *(void *)uint64_t v42 = v9;
    __int128 v11 = *(_OWORD *)(v5 + 56);
    __int128 v12 = *(_OWORD *)(v5 + 40);
    __int128 v13 = *(_OWORD *)(v5 + 24);
    __int128 v35 = *(_OWORD *)(v5 + 8);
    __int128 v36 = v13;
    __int128 v37 = v12;
    __int128 v38 = v11;
    *(void *)&v42[15] = *(void *)(v5 + 135);
    *(void *)&char v42[8] = v10;
    LOBYTE(v9) = *(_BYTE *)(v5 + 143);
    uint64_t v34 = v6;
    v42[23] = v9;
    __int128 v60 = 0u;
    memset(v61, 0, 23);
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    uint64_t v44 = (char *)(this + 11);
    memset(v52, 0, 24);
    while (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v34,  (uint64_t)&v44))
    {
      uint64_t v16 = *((void *)&v35 + v42[23] - 1) + 24LL * v42[v42[23] + 7];
      if (!*(_DWORD *)v16) {
        dyld4::Atlas::Process::teardownNotifications();
      }
      char v17 = *(dispatch_object_s **)(v16 + 8);
      if (v17)
      {
        dispatch_release(v17);
        *(void *)(v16 + 8) = 0LL;
      }

      uint64_t v18 = *(const void **)(v16 + 16);
      if (v18)
      {
        _Block_release(v18);
        *(void *)(v16 + 16) = 0LL;
      }

      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v34,  v14,  v15);
    }

    int v19 = (char *)(this + 6);
    uint64_t v44 = v19;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    memset(v52, 0, sizeof(v52));
    char v53 = 0;
    uint64_t v20 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v44,  v14,  v15);
    uint64_t v21 = *(void *)v20;
    __int128 v22 = *(_OWORD *)(v20 + 120);
    __int128 v23 = *(_OWORD *)(v20 + 104);
    __int128 v24 = *(_OWORD *)(v20 + 88);
    __int128 v39 = *(_OWORD *)(v20 + 72);
    __int128 v40 = v24;
    __int128 v41 = v23;
    *(_OWORD *)uint64_t v42 = v22;
    __int128 v25 = *(_OWORD *)(v20 + 56);
    __int128 v26 = *(_OWORD *)(v20 + 40);
    __int128 v27 = *(_OWORD *)(v20 + 24);
    __int128 v35 = *(_OWORD *)(v20 + 8);
    __int128 v36 = v27;
    __int128 v37 = v26;
    __int128 v38 = v25;
    *(_OWORD *)&v42[16] = *(_OWORD *)(v20 + 136);
    unsigned __int8 v28 = *(_BYTE *)(v20 + 152);
    uint64_t v34 = v21;
    unsigned __int8 v43 = v28;
    memset(v61, 0, sizeof(v61));
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v54 = 0u;
    uint64_t v44 = v19;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    memset(v52, 0, sizeof(v52));
    char v53 = 0;
    for (uint64_t result = (dispatch_source_s *)lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v34,  (uint64_t)&v44);
          (_BYTE)result;
          uint64_t result = (dispatch_source_s *)lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v34,  (uint64_t)&v44))
    {
      uint64_t v31 = *((void *)&v35 + v43 - 1) + 32LL * v42[v43 + 15];
      if (!*(_DWORD *)v31) {
        dyld4::Atlas::Process::teardownNotifications();
      }
      int v32 = *(dispatch_object_s **)(v31 + 8);
      if (v32)
      {
        dispatch_release(v32);
        *(void *)(v31 + 8) = 0LL;
      }

      uint64_t v33 = *(const void **)(v31 + 16);
      if (v33)
      {
        _Block_release(v33);
        *(void *)(v31 + 16) = 0LL;
      }

      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v34,  v29,  v30);
    }
  }

  return result;
}

lsl::Allocator **dyld4::Atlas::Process::synthesizeSnapshot@<X0>( mach_port_name_t *this@<X0>, unsigned int *a2@<X1>, lsl::Allocator **a3@<X8>)
{
  kern_return_t v10;
  void *v11;
  int v12;
  unsigned int v13;
  unsigned int v15;
  int v16;
  int v17;
  lsl::Allocator *v18;
  kern_return_t v19;
  dyld3::MachOFile *v20;
  dyld3::MachOFile *v21;
  int v22;
  lsl::Allocator *v23;
  dyld4::FileManager *v24;
  lsl::Lock **v25;
  BOOL v26;
  lsl::Allocator *v27;
  uint64_t v28;
  mach_vm_address_t v29;
  void *v30;
  lsl::Allocator *v31;
  dyld4::FileManager *v32;
  lsl::Lock **v33;
  BOOL Uuid;
  lsl::Allocator *v35;
  uint64_t v36;
  mach_vm_address_t v37;
  void *v38;
  BOOL v39;
  int v40;
  unsigned int v41;
  mach_msg_type_number_t infoCnt;
  mach_port_t object_name;
  int info[9];
  mach_vm_address_t address;
  mach_vm_size_t size;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[12];
  int x;
  lsl::Allocator *v50;
  mach_vm_size_t outsize;
  char buffer[1025];
  uint64_t v53;
  _BYTE v54[80];
  lsl::Allocator *v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;
  mach_vm_address_t v63;
  uint64_t v64;
  void v65[2];
  __int128 v66;
  __int128 v67;
  _BYTE v68[80];
  uint64_t v69;
  int v69 = *MEMORY[0x1895FEE08];
  uint64_t v6 = (lsl::Lock **)lsl::Allocator::defaultAllocator((lsl::Allocator *)this);
  __int128 v7 = *(lsl::Allocator **)this;
  __int128 v8 = (dyld4::FileManager *)*((void *)this + 1);
  uint64_t v9 = (dyld4::Atlas::ProcessSnapshot *)lsl::Allocator::aligned_alloc(v6, 8uLL, 0x70uLL);
  __int128 v50 = dyld4::Atlas::ProcessSnapshot::ProcessSnapshot(v9, v7, v8, 0);
  uint64_t v10 = pid_for_task(this[4], &x);
  if (a2)
  {
    *a2 = v10;
    if (v10)
    {
      __int128 v12 = -352321536;
LABEL_9:
      __int128 v13 = v12 & 0xFF000000 | v10 & 0xFFFFFF;
      goto LABEL_10;
    }

    mach_msg_type_number_t task_info_outCnt = 12;
    uint64_t v10 = task_info(this[4], 0x14u, task_info_out, &task_info_outCnt);
    *a2 = v10;
    if (v10)
    {
      __int128 v12 = -385875968;
      goto LABEL_9;
    }
  }

  else
  {
    if (v10) {
      goto LABEL_11;
    }
    mach_msg_type_number_t task_info_outCnt = 12;
    if (task_info(this[4], 0x14u, task_info_out, &task_info_outCnt)) {
      goto LABEL_11;
    }
  }

  address = 0LL;
  infoCnt = 9;
  uint64_t v15 = 0;
  if (!mach_vm_region(this[4], &address, &size, 10, info, &infoCnt, &object_name))
  {
    char v17 = 0;
    uint64_t v16 = 0;
    while (1)
    {
      if (info[0] != 5) {
        goto LABEL_49;
      }
      uint64_t v18 = (lsl::Allocator *)lsl::Allocator::malloc(*(lsl::Lock ***)this, size);
      mach_vm_size_t outsize = 0LL;
      int v19 = mach_vm_read_overwrite(this[4], address, size, (mach_vm_address_t)v18, &outsize);
      if (a2)
      {
        *a2 = v19;
        if (v19)
        {
          *a2 = v19 & 0xFFFFFF | 0xE8000000;
          goto LABEL_37;
        }
      }

      else
      {
        if (v19)
        {
          uint64_t v15 = v19 & 0xFFFFFF | 0xE8000000;
          goto LABEL_37;
        }

        uint64_t v15 = 0;
      }

      uint64_t v20 = (dyld3::MachOFile *)dyld3::MachOFile::isMachO(v18, v11);
      if (v20)
      {
        uint64_t v21 = v20;
        __int128 v22 = *((_DWORD *)v20 + 3);
        if (v22 == 7)
        {
          __int128 v41 = v15;
          uint64_t v31 = (lsl::Allocator *)proc_regionfilename(x, address, buffer, 0x400u);
          if ((_DWORD)v31) {
            buffer[(int)v31] = 0;
          }
          int v32 = (dyld4::FileManager *)*((void *)this + 1);
          uint64_t v33 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v31);
          dyld4::FileManager::fileRecordForPath(v32, v33, buffer, (uint64_t)v68);
          Uuid = dyld3::MachOFile::getUuid(v21, (unsigned __int8 *)&v67);
          uint64_t v66 = v67;
          __int128 v35 = v50;
          __int128 v36 = lsl::Allocator::defaultAllocator((lsl::Allocator *)Uuid);
          __int128 v37 = address;
          char v53 = v36;
          dyld4::FileRecord::FileRecord((uint64_t)v54, (dyld4::FileRecord *)v68);
          __int128 v55 = 0LL;
          __int128 v56 = v66;
          __int128 v58 = 0LL;
          __int128 v59 = 0LL;
          __int128 v57 = 0LL;
          __int128 v60 = 0;
          char v61 = 0;
          uint64_t v62 = 0;
          uint64_t v63 = v37;
          uint64_t v64 = 0LL;
          v65[0] = 0LL;
          *(_DWORD *)((char *)v65 + 7) = 0;
          dyld4::Atlas::ProcessSnapshot::addImage(v35, (dyld4::Atlas::Image *)&v53);
          dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v57);
          if (v55) {
            lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v55, v38);
          }
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v54);
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v68);
          char v17 = 1;
        }

        else
        {
          if (v22 != 2) {
            goto LABEL_37;
          }
          __int128 v41 = v15;
          __int128 v23 = (lsl::Allocator *)proc_regionfilename(x, address, buffer, 0x400u);
          if ((_DWORD)v23) {
            buffer[(int)v23] = 0;
          }
          __int128 v24 = (dyld4::FileManager *)*((void *)this + 1);
          __int128 v25 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v23);
          dyld4::FileManager::fileRecordForPath(v24, v25, buffer, (uint64_t)v68);
          __int128 v26 = dyld3::MachOFile::getUuid(v21, (unsigned __int8 *)&v67);
          uint64_t v66 = v67;
          __int128 v27 = v50;
          unsigned __int8 v28 = lsl::Allocator::defaultAllocator((lsl::Allocator *)v26);
          uint64_t v29 = address;
          char v53 = v28;
          dyld4::FileRecord::FileRecord((uint64_t)v54, (dyld4::FileRecord *)v68);
          __int128 v55 = 0LL;
          __int128 v56 = v66;
          __int128 v58 = 0LL;
          __int128 v59 = 0LL;
          __int128 v57 = 0LL;
          __int128 v60 = 0;
          char v61 = 0;
          uint64_t v62 = 0;
          uint64_t v63 = v29;
          uint64_t v64 = 0LL;
          v65[0] = 0LL;
          *(_DWORD *)((char *)v65 + 7) = 0;
          dyld4::Atlas::ProcessSnapshot::addImage(v27, (dyld4::Atlas::Image *)&v53);
          dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v57);
          if (v55) {
            lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v55, v30);
          }
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v54);
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v68);
          uint64_t v16 = 1;
        }

        uint64_t v15 = v41;
      }

uint64_t dyld4::Atlas::ProcessSnapshot::valid(dyld4::Atlas::ProcessSnapshot *this)
{
  return *((unsigned __int8 *)this + 105);
}

void dyld4::Atlas::Process::setupNotifications(dyld4::Atlas::Process *this, int *a2)
{
  kern_return_t v5;
  kern_return_t v6;
  kern_return_t v7;
  dispatch_source_s *v8;
  uint64_t v9;
  dispatch_source_s *v10;
  void v11[7];
  void handler[5];
  mach_port_t previous;
  mach_port_options_t options;
  if (dispatch_get_current_queue() != *((dispatch_queue_t *)this + 3)) {
    dyld4::Atlas::Process::setupNotifications();
  }
  if (!a2) {
    dyld4::Atlas::Process::setupNotifications();
  }
  if (*((_DWORD *)this + 10)) {
    dyld4::Atlas::Process::setupNotifications();
  }
  options.reserved[1] = 0LL;
  *(_OWORD *)&options.flags = xmmword_1801C2B60;
  uint64_t v4 = (ipc_space_t *)MEMORY[0x1895FFD48];
  uint64_t v5 = mach_port_construct(*MEMORY[0x1895FFD48], &options, (mach_port_context_t)this, (mach_port_name_t *)this + 5);
  *a2 = v5;
  if (!v5)
  {
    previous = 0;
    uint64_t v6 = mach_port_request_notification(*v4, *((_DWORD *)this + 5), 70, 1u, *((_DWORD *)this + 5), 0x15u, &previous);
    *a2 = v6;
    if (v6 | previous
      || (__int128 v7 = task_dyld_process_info_notify_register(*((_DWORD *)this + 4), *((_DWORD *)this + 5)), (*a2 = v7) != 0)
      || (__int128 v8 = dispatch_source_create( MEMORY[0x1895FE808],  *((unsigned int *)this + 5),  0LL,  *((dispatch_queue_t *)this + 3)),  (*((void *)this + 4) = v8) == 0LL))
    {
      mach_port_destruct(*v4, *((_DWORD *)this + 5), 0, (mach_port_context_t)this);
    }

    else
    {
      uint64_t v9 = MEMORY[0x1895FED80];
      handler[0] = MEMORY[0x1895FED80];
      handler[1] = 0x40000000LL;
      handler[2] = ___ZN5dyld45Atlas7Process18setupNotificationsEPi_block_invoke;
      handler[3] = &__block_descriptor_tmp_46;
      handler[4] = this;
      dispatch_source_set_event_handler(v8, handler);
      uint64_t v10 = (dispatch_source_s *)*((void *)this + 4);
      v11[0] = v9;
      v11[1] = 0x40000000LL;
      v11[2] = ___ZN5dyld45Atlas7Process18setupNotificationsEPi_block_invoke_2;
      void v11[3] = &__block_descriptor_tmp_47;
      v11[6] = *((void *)this + 2);
      void v11[4] = this;
      void v11[5] = v10;
      dispatch_source_set_cancel_handler(v10, v11);
      dispatch_activate(*((dispatch_object_t *)this + 4));
      *((_DWORD *)this + 10) = 1;
    }
  }

void ___ZN5dyld45Atlas7Process18setupNotificationsEPi_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void dyld4::Atlas::Process::handleNotifications( dyld4::Atlas::Process *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = MEMORY[0x1895FE128](this, a2, a3, a4);
  uint64_t v51 = *MEMORY[0x1895FEE08];
  if (*(_DWORD *)(v4 + 40) == 1)
  {
    uint64_t v5 = v4;
    bzero(&msg, 0x8000uLL);
    if (mach_msg(&msg, 50333698, 0, 0x7FCCu, *(_DWORD *)(v5 + 20), 0, 0) || (msg.msgh_bits & 0x80000000) != 0)
    {
      __int128 v22 = (FILE *)*MEMORY[0x1895FEE10];
      mach_msg_id_t msgh_id = msg.msgh_id;
    }

    else
    {
      mach_msg_id_t msgh_id = msg.msgh_id;
      if ((msg.msgh_id & 0xFFFFF000) == 0x4000)
      {
        if (msg.msgh_size == 24)
        {
          if ((msg.msgh_id & 0xFFF) != 0)
          {
            *(void *)&v32.msgh_bits = v5 + 48;
            *(_OWORD *)&v32.msgh_remote_port = 0u;
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            char v41 = 0;
            uint64_t v10 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v32,  v6,  v7);
            uint64_t v11 = *(void *)v10;
            __int128 v12 = *(_OWORD *)(v10 + 120);
            __int128 v13 = *(_OWORD *)(v10 + 104);
            __int128 v14 = *(_OWORD *)(v10 + 88);
            v28[4] = *(_OWORD *)(v10 + 72);
            v28[5] = v14;
            v28[6] = v13;
            v28[7] = v12;
            __int128 v15 = *(_OWORD *)(v10 + 56);
            __int128 v16 = *(_OWORD *)(v10 + 40);
            __int128 v17 = *(_OWORD *)(v10 + 24);
            v28[0] = *(_OWORD *)(v10 + 8);
            v28[1] = v17;
            v28[2] = v16;
            v28[3] = v15;
            __int128 v29 = *(_OWORD *)(v10 + 136);
            unsigned __int8 v18 = *(_BYTE *)(v10 + 152);
            *(void *)__int128 v27 = v11;
            unsigned __int8 v30 = v18;
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            __int128 v43 = 0u;
            __int128 v44 = 0u;
            __int128 v42 = 0u;
            *(void *)&v32.msgh_bits = v5 + 48;
            *(_OWORD *)&v32.msgh_remote_port = 0u;
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            char v41 = 0;
            while (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)v27,  (uint64_t)&v32))
            {
              uint64_t v21 = *((void *)v28 + v30 - 1) + 32LL * *((unsigned __int8 *)&v29 + v30 - 1);
              if ((msg.msgh_id & 0xFFF) == *(_DWORD *)(v21 + 24)) {
                dispatch_async_and_wait(*(dispatch_queue_t *)(v21 + 8), *(dispatch_block_t *)(v21 + 16));
              }
              lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)v27,  v19,  v20);
            }
          }

          else
          {
            dyld4::Atlas::Process::getSnapshot((dyld4::Atlas::Process *)v5, v27, v7, v8);
            if (!v27[0])
            {
              lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::withUnsafe<dyld4::Atlas::Process::handleNotifications(void)::$_0>( (uint64_t *)&v32,  v5);
              lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::withUnsafe<dyld4::Atlas::Process::handleNotifications(void)::$_1>( (uint64_t *)(v5 + 128),  (uint64_t *)&v32,  v5);
            }

            __int128 v25 = (uint64_t *)(v5 + 128);
            if (&v32 != (mach_msg_header_t *)(v5 + 128))
            {
              uint64_t v26 = *v25;
              *__int128 v25 = *(void *)&v32.msgh_bits;
              *(void *)&v32.msgh_bits = v26;
            }

            lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr((lsl::Allocator **)&v32, v24);
          }
        }

        else
        {
          dyld4::Atlas::Process::teardownNotifications((dispatch_queue_t *)v5);
        }

        *(void *)&v32.msgh_voucher_port = 0LL;
        v32.msgh_remote_port = msg.msgh_remote_port;
        v32.msgh_local_port = 0;
        v32.msgh_bits = msg.msgh_bits & 0x1F;
        v32.msgh_size = 24;
        if (!mach_msg(&v32, 1, 0x18u, 0, 0, 0, 0))
        {
          msg.msgh_remote_port = 0;
          goto LABEL_34;
        }

        goto LABEL_32;
      }

      if (msg.msgh_id >= 0x2000)
      {
        if (msg.msgh_id == 0x2000 || msg.msgh_id == 12288) {
          goto LABEL_34;
        }
      }

      else
      {
        if (msg.msgh_id == 70)
        {
          __int128 v23 = (mach_msg_bits_t *)((char *)&msg.msgh_bits + ((msg.msgh_size + 3LL) & 0x1FFFFFFFCLL));
          if (*v23 || v23[1] < 0x34u || v23[10]) {
            goto LABEL_34;
          }
LABEL_32:
          dyld4::Atlas::Process::teardownNotifications((dispatch_queue_t *)v5);
          goto LABEL_34;
        }

        if (msg.msgh_id == 4096)
        {
LABEL_34:
          mach_msg_destroy(&msg);
          return;
        }
      }

      __int128 v22 = (FILE *)*MEMORY[0x1895FEE10];
    }

    fprintf(v22, "dyld: received unknown message id=0x%X, size=%d\n", msgh_id, msg.msgh_size);
    goto LABEL_34;
  }

void ___ZN5dyld45Atlas7Process18setupNotificationsEPi_block_invoke_2(uint64_t a1)
{
  mach_port_context_t v2 = *(void *)(a1 + 32);
  task_dyld_process_info_notify_deregister(*(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52));
  mach_port_destruct(*MEMORY[0x1895FFD48], *(_DWORD *)(a1 + 52), 0, v2);
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void *lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::withUnsafe<dyld4::Atlas::Process::handleNotifications(void)::$_0>( uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(a2 + 128);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__0clEPNS0_15ProcessSnapshotE_block_invoke;
  void v5[3] = &__block_descriptor_tmp_69;
  void v5[4] = a2;
  return dyld4::Atlas::ProcessSnapshot::forEachImageNotIn(v3, v2, (uint64_t)v5);
}

void *lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::withUnsafe<dyld4::Atlas::Process::handleNotifications(void)::$_1>( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  v6[0] = MEMORY[0x1895FED80];
  v6[1] = 0x40000000LL;
  v6[2] = ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__1clEPNS0_15ProcessSnapshotE_block_invoke;
  void v6[3] = &__block_descriptor_tmp_71_0;
  v6[4] = a3;
  return dyld4::Atlas::ProcessSnapshot::forEachImageNotIn(v4, v3, (uint64_t)v6);
}

uint64_t dyld4::Atlas::Process::registerAtlasChangedEventHandler( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  int v11 = 0;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 24);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke;
  block[3] = &unk_189630450;
  block[6] = a1;
  block[7] = a2;
  block[8] = a3;
  block[4] = a4;
  void block[5] = &v8;
  dispatch_async_and_wait(v4, block);
  uint64_t v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

double ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(int **)(a1 + 56);
  if (*(_DWORD *)(v5 + 40))
  {
    if (*v4)
    {
      dyld4::Atlas::Process::teardownNotifications(*(dispatch_queue_t **)(a1 + 48));
      return result;
    }
  }

  else
  {
    dyld4::Atlas::Process::setupNotifications(*(dyld4::Atlas::Process **)(a1 + 48), v4);
    if (**(_DWORD **)(a1 + 56)) {
      return result;
    }
  }

  uint64_t v7 = *(void *)(v5 + 128);
  v16[0] = MEMORY[0x1895FED80];
  v16[1] = 0x40000000LL;
  void v16[2] = ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke_2;
  v16[3] = &unk_189630428;
  void v16[4] = *(void *)(a1 + 32);
  dyld4::Atlas::ProcessSnapshot::forEachImage(v7, (uint64_t)v16, a3);
  if (*(_DWORD *)(v5 + 40) != 1) {
    ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke_cold_1();
  }
  dispatch_retain(*(dispatch_object_t *)(a1 + 64));
  int v8 = *(_DWORD *)(v5 + 136);
  *(_DWORD *)(v5 + 136) = v8 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v8;
  uint64_t v9 = *(const void **)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v11 = *(void *)(a1 + 64);
  __int128 v12 = _Block_copy(v9);
  int v13 = *(_DWORD *)(v10 + 24);
  uint64_t v14 = v11;
  __int128 v15 = v12;
  return lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::insert( v5 + 88,  (uint64_t)&v13,  (uint64_t)v17);
}

void *dyld4::Atlas::ProcessSnapshot::forEachImage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v38 = *MEMORY[0x1895FEE08];
  uint64_t v24 = a2;
  uint64_t v4 = a1 + 16;
  uint64_t v30 = a1 + 16;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  memset(v35, 0, 27);
  uint64_t v5 = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t)&v30, a2, a3);
  uint64_t v6 = *(void *)v5;
  v26[0] = *(_OWORD *)(v5 + 8);
  __int128 v7 = *(_OWORD *)(v5 + 72);
  __int128 v8 = *(_OWORD *)(v5 + 56);
  __int128 v9 = *(_OWORD *)(v5 + 40);
  v26[1] = *(_OWORD *)(v5 + 24);
  v26[2] = v9;
  void v26[3] = v8;
  v26[4] = v7;
  uint64_t v10 = *(void *)(v5 + 88);
  __int16 v28 = *(_WORD *)(v5 + 96);
  uint64_t v27 = v10;
  LOBYTE(v10) = *(_BYTE *)(v5 + 98);
  uint64_t v25 = v6;
  unsigned __int8 v29 = v10;
  __int128 v37 = 0u;
  uint64_t v30 = v4;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  memset(v35, 0, 27);
  if (!lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>( (uint64_t)&v25,  (uint64_t)&v30))
  {
    __int128 v12 = (void **)(a1 + 64);
    double result = *(void **)(a1 + 64);
    if (!result) {
      return result;
    }
    goto LABEL_18;
  }

  int v11 = 0;
  __int128 v12 = (void **)(a1 + 64);
  do
  {
    uint64_t v13 = v29 - 1LL;
    uint64_t v14 = *((void *)v26 + v13);
    uint64_t v15 = *((unsigned __int8 *)&v27 + v13);
    __int128 v16 = *v12;
    uint64_t v17 = *(void *)(v14 + 8 * v15);
    if (*v12 && v16[20] <= *(void *)(v17 + 160))
    {
      if (!v11)
      {
        if (*(void *)(v16[16] + 144LL))
        {
          unint64_t v18 = 0LL;
          do
          {
            if (((*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + (v18 >> 3)) >> (v18 & 7)) & 1) != 0)
            {
              v36[0] = MEMORY[0x1895FED80];
              v36[1] = 0x40000000LL;
              v36[2] = ___ZZN5dyld45Atlas15ProcessSnapshot12forEachImageEU13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke;
              v36[3] = &__block_descriptor_tmp_74;
              v36[4] = &v24;
              dyld4::Atlas::SharedCache::withImageForIndex(v16, v18, (uint64_t)v36);
              __int128 v16 = *v12;
            }

            ++v18;
          }

          while (*(void *)(v16[16] + 144LL) > v18);
        }

        int v11 = 1;
      }

      uint64_t v17 = *(void *)(v14 + 8 * v15);
    }

    (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, v17);
    lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t)&v25, v19, v20);
  }

  while (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>( (uint64_t)&v25,  (uint64_t)&v30));
  double result = *v12;
  if (*v12 && !v11)
  {
LABEL_18:
    if (*(void *)(result[16] + 144LL))
    {
      unint64_t v22 = 0LL;
      uint64_t v23 = MEMORY[0x1895FED80];
      do
      {
        if (((*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + (v22 >> 3)) >> (v22 & 7)) & 1) != 0)
        {
          uint64_t v30 = v23;
          *(void *)&__int128 v31 = 0x40000000LL;
          *((void *)&v31 + 1) = ___ZZN5dyld45Atlas15ProcessSnapshot12forEachImageEU13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke;
          *(void *)&__int128 v32 = &__block_descriptor_tmp_74;
          *((void *)&v32 + 1) = &v24;
          dyld4::Atlas::SharedCache::withImageForIndex(result, v22, (uint64_t)&v30);
          double result = *v12;
        }

        ++v22;
      }

      while (*(void *)(result[16] + 144LL) > v22);
    }
  }

  return result;
}

uint64_t ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

double lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::insert@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  unsigned int v9 = *(_DWORD *)a2;
  __int128 v10 = *(_OWORD *)(a2 + 8);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator( (uint64_t)v22,  a1,  &v9);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::insert_internal( a1,  (uint64_t)v22,  &v9,  (uint64_t)&v11);
  uint64_t v5 = v11;
  *(_OWORD *)(a3 + 72) = v16;
  *(_OWORD *)(a3 + 88) = v17;
  *(_OWORD *)(a3 + 104) = v18;
  *(_OWORD *)(a3 + 8) = v12;
  *(_OWORD *)(a3 + 24) = v13;
  *(_OWORD *)(a3 + 40) = v14;
  double result = *(double *)&v15;
  *(_OWORD *)(a3 + 56) = v15;
  *(void *)(a3 + 135) = *(void *)&v20[7];
  uint64_t v7 = *(void *)v20;
  *(void *)(a3 + 120) = v19;
  *(void *)(a3 + 128) = v7;
  __int16 v8 = v21;
  *(void *)a3 = v5;
  *(_WORD *)(a3 + 143) = v8;
  return result;
}

uint64_t dyld4::Atlas::Process::registerEventHandler(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  int v13 = 0;
  uint64_t v5 = *(dispatch_queue_s **)(a1 + 24);
  v8[0] = MEMORY[0x1895FED80];
  v8[1] = 0x40000000LL;
  void v8[2] = ___ZN5dyld45Atlas7Process20registerEventHandlerEPijP16dispatch_queue_sU13block_pointerFvvE_block_invoke;
  v8[3] = &unk_189630478;
  void v8[6] = a1;
  v8[7] = a2;
  _BYTE v8[8] = a4;
  v8[4] = a5;
  void v8[5] = &v10;
  int v9 = a3;
  dispatch_async_and_wait(v5, v8);
  uint64_t v6 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void ___ZN5dyld45Atlas7Process20registerEventHandlerEPijP16dispatch_queue_sU13block_pointerFvvE_block_invoke( uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = *(_DWORD *)(v2 + 40);
  if (!v3)
  {
    dyld4::Atlas::Process::setupNotifications(*(dyld4::Atlas::Process **)(a1 + 48), *(int **)(a1 + 56));
    if (**(_DWORD **)(a1 + 56)) {
      return;
    }
    int v3 = *(_DWORD *)(v2 + 40);
  }

  if (v3 != 1) {
    ___ZN5dyld45Atlas7Process20registerEventHandlerEPijP16dispatch_queue_sU13block_pointerFvvE_block_invoke_cold_1();
  }
  dispatch_retain(*(dispatch_object_t *)(a1 + 64));
  int v4 = *(_DWORD *)(v2 + 136);
  *(_DWORD *)(v2 + 136) = v4 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = _Block_copy(*(const void **)(a1 + 32));
  int v8 = *(_DWORD *)(a1 + 72);
  int v9 = *(_DWORD *)(v5 + 24);
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  int v12 = v8;
  lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::insert( v2 + 48,  (uint64_t)&v9,  (uint64_t)v13);
}

double lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::insert@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v24 = *MEMORY[0x1895FEE08];
  unsigned int v8 = *(_DWORD *)a2;
  __int128 v9 = *(_OWORD *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 24);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator( (uint64_t)v23,  a1,  &v8);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::insert_internal( a1,  (uint64_t)v23,  &v8,  (uint64_t)&v11);
  uint64_t v5 = v11;
  *(_OWORD *)(a3 + 72) = v16;
  *(_OWORD *)(a3 + 88) = v17;
  *(_OWORD *)(a3 + 104) = v18;
  *(_OWORD *)(a3 + 120) = v19;
  *(_OWORD *)(a3 + 8) = v12;
  *(_OWORD *)(a3 + 24) = v13;
  *(_OWORD *)(a3 + 40) = v14;
  *(_OWORD *)(a3 + 56) = v15;
  double result = *(double *)&v20;
  *(_OWORD *)(a3 + 136) = v20;
  char v7 = v21;
  *(void *)a3 = v5;
  *(_BYTE *)(a3 + 152) = v7;
  *(_BYTE *)(a3 + 160) = v22;
  return result;
}

void dyld4::Atlas::Process::unregisterEventHandler(dyld4::Atlas::Process *this, int a2)
{
  uint64_t v2 = (dispatch_queue_s *)*((void *)this + 3);
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  v3[2] = ___ZN5dyld45Atlas7Process22unregisterEventHandlerEj_block_invoke;
  void v3[3] = &__block_descriptor_tmp_56;
  v3[4] = this;
  int v4 = a2;
  dispatch_async_and_wait(v2, v3);
}

double ___ZN5dyld45Atlas7Process22unregisterEventHandlerEj_block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1895FEE08];
  uint64_t v2 = *(void *)(a1 + 32);
  *(void *)&v36[8] = 0LL;
  *(void *)&v36[16] = 0LL;
  *(_DWORD *)__int128 v36 = *(_DWORD *)(a1 + 40);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::find( v2 + 88,  (unsigned int *)v36,  (uint64_t)&v38);
  __int128 v31 = v43;
  __int128 v32 = v44;
  __int128 v33 = v45;
  uint64_t v26 = v38;
  __int128 v27 = v39;
  __int128 v28 = v40;
  __int128 v29 = v41;
  __int128 v30 = v42;
  *(void *)&v34[15] = *(void *)((char *)v46 + 15);
  *(_OWORD *)__int128 v34 = v46[0];
  unsigned __int8 v35 = BYTE7(v46[1]);
  memset(v36, 0, 135);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  uint64_t v38 = v2 + 88;
  memset(v46, 0, 24);
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v26,  (uint64_t)&v38))
  {
    unsigned __int8 v4 = v35;
    uint64_t v5 = v35 - 1LL;
    uint64_t v6 = *((void *)&v27 + v5) + 24LL * v34[v5 + 8];
    if (!*(void *)(v6 + 16)) {
      ___ZN5dyld45Atlas7Process22unregisterEventHandlerEj_block_invoke_cold_1();
    }
    char v7 = *(dispatch_object_s **)(v6 + 8);
    if (v7)
    {
      dispatch_release(v7);
      unsigned __int8 v4 = v35;
      uint64_t v5 = v35 - 1LL;
    }

    unsigned int v8 = *(const void **)(*((void *)&v27 + v5) + 24LL * v34[v5 + 8] + 16);
    if (v8)
    {
      _Block_release(v8);
      unsigned __int8 v4 = v35;
    }

    *(_OWORD *)&v36[72] = v31;
    *(_OWORD *)&v36[88] = v32;
    *(_OWORD *)&v36[104] = v33;
    *(_OWORD *)&v36[8] = v27;
    *(_OWORD *)&v36[24] = v28;
    *(_OWORD *)&v36[40] = v29;
    *(_OWORD *)&v36[56] = v30;
    *(void *)&v36[135] = *(void *)&v34[15];
    *(void *)&v36[120] = *(void *)v34;
    *(void *)&v36[128] = *(void *)&v34[8];
    *(void *)__int128 v36 = v26;
    v36[143] = v4;
    *(void *)&double result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::erase( v2 + 88,  (uint64_t)v36,  v3,  (uint64_t)&v38).n128_u64[0];
  }

  else
  {
    memset(&v36[8], 0, 24);
    *(_DWORD *)__int128 v36 = *(_DWORD *)(a1 + 40);
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::find( v2 + 48,  (unsigned int *)v36,  (uint64_t)&v38);
    uint64_t v15 = v38;
    __int128 v20 = v43;
    __int128 v21 = v44;
    __int128 v22 = v45;
    __int128 v23 = v46[0];
    __int128 v16 = v39;
    __int128 v17 = v40;
    __int128 v18 = v41;
    __int128 v19 = v42;
    __int128 v24 = v46[1];
    unsigned __int8 v25 = v47;
    memset(v36, 0, 144);
    uint64_t v38 = v2 + 48;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    memset(v46, 0, sizeof(v46));
    unsigned __int8 v47 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v15,  (uint64_t)&v38))
    {
      unsigned __int8 v11 = v25;
      uint64_t v12 = v25 - 1LL;
      __int128 v13 = *(dispatch_object_s **)(*((void *)&v16 + v12) + 32LL * *((unsigned __int8 *)&v24 + v12) + 8);
      if (v13)
      {
        dispatch_release(v13);
        unsigned __int8 v11 = v25;
        uint64_t v12 = v25 - 1LL;
      }

      __int128 v14 = *(const void **)(*((void *)&v16 + v12) + 32LL * *((unsigned __int8 *)&v24 + v12) + 16);
      if (v14)
      {
        _Block_release(v14);
        unsigned __int8 v11 = v25;
      }

      *(_OWORD *)&v36[72] = v20;
      *(_OWORD *)&v36[88] = v21;
      *(_OWORD *)&v36[104] = v22;
      *(_OWORD *)&v36[120] = v23;
      *(_OWORD *)&v36[8] = v16;
      *(_OWORD *)&v36[24] = v17;
      *(_OWORD *)&v36[40] = v18;
      *(_OWORD *)&v36[56] = v19;
      *(_OWORD *)&v36[136] = v24;
      *(void *)__int128 v36 = v15;
      unsigned __int8 v37 = v11;
      *(void *)&double result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::erase( v2 + 48,  (uint64_t)v36,  v10,  (uint64_t)&v38).n128_u64[0];
    }
  }

  return result;
}

dyld4::Atlas::ProcessSnapshot *dyld4::Atlas::ProcessSnapshot::ProcessSnapshot( dyld4::Atlas::ProcessSnapshot *this, lsl::Allocator *a2, dyld4::FileManager *a3, char a4)
{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  uint64_t v6 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(this);
  *((void *)this + 2) = 0LL;
  *((void *)this + 3) = v6;
  *((void *)this + 5) = 0LL;
  *((_BYTE *)this + 48) = 0;
  *((void *)this + 7) = 0LL;
  *((void *)this + 8) = 0LL;
  char v7 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v6);
  uint64_t v8 = lsl::Allocator::defaultAllocator(v7);
  __int128 v9 = lsl::Allocator::aligned_alloc((lsl::Lock **)v7, 8uLL, 0x30uLL);
  void *v9 = v8;
  *(_OWORD *)(v9 + 1) = 0u;
  *(_OWORD *)(v9 + 3) = 0u;
  void v9[5] = v8;
  lsl::SharedPtr<dyld4::Atlas::Mapper>::SharedPtr((void *)this + 9, (lsl::Allocator::AllocationMetadata *)v9);
  *((void *)this + 10) = 0LL;
  *((void *)this + 11) = 0LL;
  *((void *)this + 12) = 0LL;
  *((_BYTE *)this + 104) = a4;
  *((_BYTE *)this + 105) = 1;
  return this;
}

__int128 *dyld4::Atlas::ProcessSnapshot::ProcessSnapshot( __int128 *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)a1 = a2;
  *((void *)a1 + 1) = a3;
  uint64_t v10 = (lsl::Allocator *)lsl::Allocator::defaultAllocator((lsl::Allocator *)a1);
  *((void *)a1 + 2) = 0LL;
  unsigned __int8 v11 = (uint64_t *)(a1 + 1);
  *((void *)a1 + 3) = v10;
  *((void *)a1 + 5) = 0LL;
  *((_BYTE *)a1 + 48) = 0;
  *((void *)a1 + 7) = 0LL;
  uint64_t v12 = (lsl::Allocator ***)a1 + 7;
  *((void *)a1 + 8) = 0LL;
  __int128 v13 = (lsl::Allocator ***)(a1 + 4);
  __int128 v14 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v10);
  uint64_t v15 = lsl::Allocator::defaultAllocator(v14);
  __int128 v16 = lsl::Allocator::aligned_alloc((lsl::Lock **)v14, 8uLL, 0x30uLL);
  *__int128 v16 = v15;
  *(_OWORD *)(v16 + 1) = 0u;
  *(_OWORD *)(v16 + 3) = 0u;
  void v16[5] = v15;
  lsl::SharedPtr<dyld4::Atlas::Mapper>::SharedPtr((void *)a1 + 9, (lsl::Allocator::AllocationMetadata *)v16);
  *((void *)a1 + 10) = 0LL;
  *((void *)a1 + 12) = 0LL;
  *((void *)a1 + 11) = 0LL;
  *((_BYTE *)a1 + 104) = a4;
  *((_BYTE *)a1 + 105) = 1;
  __int128 v23 = a1;
  __int128 v24 = *a1;
  unsigned __int8 v25 = a1 + 1;
  uint64_t v26 = a1 + 4;
  uint64_t v27 = (uint64_t)a1 + 56;
  uint64_t v28 = v24;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v32 = v24;
  uint64_t v34 = 0LL;
  uint64_t v35 = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v36 = v24;
  uint64_t v38 = 0LL;
  uint64_t v39 = 0LL;
  uint64_t v37 = 0LL;
  uint64_t v40 = v24;
  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  uint64_t v43 = 0LL;
  int v44 = -1491447450;
  uint64_t v46 = 0LL;
  uint64_t v45 = 0LL;
  uint64_t v47 = 0LL;
  uint64_t v48 = 0LL;
  uint64_t v49 = 0LL;
  __int128 v50 = a1 + 5;
  uint64_t v51 = (uint64_t)a1 + 88;
  char v52 = a1 + 6;
  if ((dyld4::Atlas::ProcessSnapshot::Serializer::deserialize((uint64_t)&v23, a5, a6) & 1) == 0)
  {
    if (*v11)
    {
      lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::deallocate( *v11,  *((lsl::Lock ***)a1 + 3));
      *((void *)a1 + 2) = 0LL;
    }

    *((void *)a1 + 5) = 0LL;
    *((_BYTE *)a1 + 48) = 0;
    __int128 v22 = 0LL;
    if (&v22 != v12)
    {
      __int128 v18 = *v12;
      *uint64_t v12 = 0LL;
      __int128 v22 = v18;
    }

    lsl::UniquePtr<dyld4::Atlas::Bitmap>::~UniquePtr(&v22, v17);
    __int128 v22 = 0LL;
    if (&v22 != v13)
    {
      __int128 v20 = *v13;
      dispatch_object_s *v13 = 0LL;
      __int128 v22 = v20;
    }

    lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr((lsl::Allocator **)&v22, v19);
    *((_BYTE *)a1 + 105) = 0;
    *((void *)a1 + 11) = 0LL;
    *((void *)a1 + 12) = 0LL;
    *((void *)a1 + 10) = 0LL;
  }

  if (v41) {
    lsl::Vector<unsigned int>::resize((uint64_t)&v40, 0LL);
  }
  if (v37) {
    lsl::Vector<char>::resize((uint64_t)&v36, 0LL);
  }
  if (v33) {
    lsl::Vector<char const*>::resize((uint64_t)&v32, 0LL);
  }
  if (v29) {
    lsl::Vector<lsl::UUID>::resize((uint64_t)&v28, 0LL);
  }
  return a1;
}

uint64_t dyld4::Atlas::ProcessSnapshot::Serializer::deserialize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0LL;
  uint64_t v76 = *MEMORY[0x1895FEE08];
  unsigned int v4 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 176) = *(_DWORD *)a2;
  unsigned int v5 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 180) = v5;
  *(void *)(a1 + 184) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 208) = *(_DWORD *)(a2 + 20);
  *(void *)(a1 + 200) = *(void *)(a2 + 24);
  int v6 = *(_DWORD *)(a2 + 32);
  uint64_t v7 = a3 - 36;
  uint64_t v8 = a2 + 36;
  __int128 v58 = (char *)(a2 + 36);
  uint64_t v59 = a3 - 36;
  *(_DWORD *)(a1 + 212) = v6;
  if (__PAIR64__(v5, v4) != 2803519846) {
    return v3;
  }
  uint64_t v9 = a2;
  lsl::CRC32c::CRC32c((uint64_t)v57);
  lsl::CRC32c::operator()(v57, v9, 32LL);
  lsl::CRC32c::operator()(v57, 0LL);
  lsl::CRC32c::operator()(v57, v8, v7);
  LODWORD(v9) = *(_DWORD *)(a1 + 212);
  uint64_t v3 = 0LL;
  *(void *)(a1 + 216) = lsl::readPVLEUInt64((unsigned __int8 **)&v58);
  **(void **)(a1 + 224) = lsl::readPVLEUInt64((unsigned __int8 **)&v58);
  **(void **)(a1 + 232) = lsl::readPVLEUInt64((unsigned __int8 **)&v58);
  **(void **)(a1 + 240) = lsl::readPVLEUInt64((unsigned __int8 **)&v58);
  uint64_t PVLEUInt64 = lsl::readPVLEUInt64((unsigned __int8 **)&v58);
  uint64_t v12 = PVLEUInt64;
  if (PVLEUInt64)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = PVLEUInt64;
    do
    {
      v61[0] = *(_OWORD *)&v58[v13];
      lsl::Vector<lsl::UUID>::reserve(a1 + 48, *(void *)(a1 + 64) + 1LL);
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 64);
      *(void *)(a1 + 64) = v16 + 1;
      *(_OWORD *)(v15 + 16 * v16) = v61[0];
      v13 += 16LL;
      --v14;
    }

    while (v14);
  }

  v58 += 16 * v12;
  v59 -= 16 * v12;
  unint64_t v17 = lsl::readPVLEUInt64((unsigned __int8 **)&v58);
  lsl::Vector<char>::reserve(a1 + 112, v17);
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<unsigned char *,unsigned char *,std::back_insert_iterator<lsl::Vector<char>>>( (uint64_t)v61,  v58,  &v58[v17],  a1 + 112);
  v58 += v17;
  v59 -= v17;
  if ((*(_BYTE *)(a1 + 216) & 1) != 0)
  {
    v60[0] = 0uLL;
    memset(v61, 0, sizeof(v61));
    uint64_t v62 = 0x1FFFFFFFFLL;
    __int16 v63 = 0;
    char v64 = 1;
    uint64_t MappedFileInfo = dyld4::Atlas::ProcessSnapshot::Serializer::readMappedFileInfo( a1,  (unsigned __int8 **)&v58,  (uint64_t *)v71,  v60,  (dyld4::FileRecord *)v61);
    if ((MappedFileInfo & 1) != 0)
    {
      char v33 = 14;
      if ((*(void *)(a1 + 216) & 4LL) == 0) {
        char v33 = 12;
      }
      uint64_t v34 = (dyld4::FileRecord *)(*(void *)&v71[0] << v33);
      *(void *)&v71[0] <<= v33;
      if (*(_BYTE *)(*(void *)a1 + 104LL))
      {
        uint64_t v35 = *(lsl::Allocator **)(*(void *)a1 + 72LL);
        if (v35)
        {
          do
            unsigned int v36 = __ldxr((unsigned int *)v35);
          while (__stxr(v36 + 1, (unsigned int *)v35));
        }
      }

      else
      {
        uint64_t v38 = (dyld4::Atlas::Mapper *)lsl::Allocator::defaultAllocator((lsl::Allocator *)MappedFileInfo);
        dyld4::Atlas::Mapper::mapperForSharedCache(v38, (lsl::Allocator *)v61, v34, v39);
        uint64_t v35 = v56;
      }

      *(void *)&__int128 v75 = v35;
      if (v35)
      {
        if (*((void *)v35 + 1))
        {
          uint64_t v40 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v35);
          uint64_t v41 = *(void *)(a1 + 8);
          __int128 v55 = (lsl::Allocator *)(*(void *)(a1 + 216) & 2LL);
          lsl::Allocator::makeUnique<dyld4::Atlas::SharedCache,lsl::Allocator&,dyld4::FileRecord,lsl::SharedPtr<dyld4::Atlas::Mapper> &,unsigned long long &,unsigned long long>( v40,  v41,  (dyld4::FileRecord *)v61,  (unsigned int **)&v75,  (char **)v71,  &v55,  (uint64_t *)&v56);
          uint64_t v43 = *(lsl::Allocator ***)(a1 + 32);
          if (&v56 != v43)
          {
            int v44 = *v43;
            *uint64_t v43 = v56;
            __int128 v56 = v44;
          }

          uint64_t v45 = lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr(&v56, v42);
          uint64_t v46 = (lsl::Allocator *)lsl::Allocator::defaultAllocator((lsl::Allocator *)v45);
          uint64_t v47 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v46);
          uint64_t v48 = lsl::Allocator::aligned_alloc((lsl::Lock **)v46, 8uLL, 0x10uLL);
          uint64_t v49 = (lsl::Allocator *)dyld4::Atlas::Bitmap::Bitmap((uint64_t)v48, v47, (uint64_t)&v58);
          __int128 v56 = v49;
          uint64_t v51 = *(lsl::Allocator ***)(a1 + 40);
          if (&v56 != v51)
          {
            char v52 = *v51;
            *uint64_t v51 = v49;
            __int128 v56 = v52;
          }

          lsl::UniquePtr<dyld4::Atlas::Bitmap>::~UniquePtr((lsl::Allocator ***)&v56, v50);
          if ((void)v75) {
            lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount((lsl::Allocator *)v75, v53);
          }
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v61);
          goto LABEL_7;
        }

        lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v35, v32);
      }
    }

    uint64_t v37 = (dyld4::FileRecord *)v61;
LABEL_45:
    dyld4::FileRecord::~FileRecord(v37);
    return 0LL;
  }

void *dyld4::Atlas::ProcessSnapshot::forEachImageNotIn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v65 = *MEMORY[0x1895FEE08];
  uint64_t v40 = a3;
  uint64_t v4 = a2 + 16;
  uint64_t v38 = a2 + 16;
  uint64_t v58 = a2 + 16;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  memset(v63, 0, 27);
  uint64_t v5 = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t)&v58, a2, a3);
  uint64_t v6 = *(void *)v5;
  v54[0] = *(_OWORD *)(v5 + 8);
  __int128 v7 = *(_OWORD *)(v5 + 72);
  __int128 v8 = *(_OWORD *)(v5 + 56);
  __int128 v9 = *(_OWORD *)(v5 + 40);
  v54[1] = *(_OWORD *)(v5 + 24);
  v54[2] = v9;
  v54[3] = v8;
  v54[4] = v7;
  uint64_t v10 = *(void *)(v5 + 88);
  __int16 v56 = *(_WORD *)(v5 + 96);
  unsigned __int8 v11 = *(_BYTE *)(v5 + 98);
  uint64_t v55 = v10;
  uint64_t v53 = v6;
  unsigned __int8 v57 = v11;
  *(_OWORD *)&v50[2] = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  memset(v63, 0, 27);
  uint64_t v58 = v4;
  if (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>( (uint64_t)&v53,  (uint64_t)&v58)) {
    unint64_t v14 = *(void *)(*(void *)(*((void *)v54 + v57 - 1) + 8LL * *((unsigned __int8 *)&v55 + v57 - 1)) + 160LL);
  }
  else {
    unint64_t v14 = -1LL;
  }
  uint64_t v58 = a1 + 16;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  memset(v63, 0, 27);
  uint64_t v15 = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t)&v58, v12, v13);
  uint64_t v16 = *(void *)v15;
  v49[0] = *(_OWORD *)(v15 + 8);
  __int128 v17 = *(_OWORD *)(v15 + 72);
  __int128 v18 = *(_OWORD *)(v15 + 56);
  __int128 v19 = *(_OWORD *)(v15 + 40);
  v49[1] = *(_OWORD *)(v15 + 24);
  v49[2] = v19;
  v49[3] = v18;
  *(_OWORD *)__int128 v50 = v17;
  uint64_t v20 = *(void *)(v15 + 88);
  __int16 v51 = *(_WORD *)(v15 + 96);
  unsigned __int8 v21 = *(_BYTE *)(v15 + 98);
  *(void *)&v50[16] = v20;
  uint64_t v48 = v16;
  unsigned __int8 v52 = v21;
  *(_OWORD *)&v46[1] = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  memset(v63, 0, 27);
  uint64_t v58 = a1 + 16;
  uint64_t v23 = v38;
  while (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>( (uint64_t)&v48,  (uint64_t)&v58))
  {
    uint64_t v24 = v52 - 1LL;
    uint64_t v25 = *((void *)v49 + v24);
    uint64_t v26 = v50[v24 + 16];
    uint64_t v27 = *(void **)(a1 + 64);
    uint64_t v28 = *(void *)(v25 + 8 * v26);
    if (v27 && v27[20] <= *(void *)(v28 + 160))
    {
      uint64_t v29 = a2;
      if (*(void *)(v27[16] + 144LL))
      {
        unint64_t v30 = 0LL;
        do
        {
          int v31 = 1 << (v30 & 7);
          if ((*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + (v30 >> 3)) & v31) != 0
            && (!*(void *)(v29 + 64)
             || (*(_BYTE *)(*(void *)(*(void *)(v29 + 56) + 8LL) + (v30 >> 3)) & v31) == 0))
          {
            uint64_t v41 = MEMORY[0x1895FED80];
            *(void *)&__int128 v42 = 0x40000000LL;
            *((void *)&v42 + 1) = ___ZZN5dyld45Atlas15ProcessSnapshot17forEachImageNotInERKS1_U13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke;
            *(void *)&__int128 v43 = &__block_descriptor_tmp_75_0;
            *((void *)&v43 + 1) = &v40;
            dyld4::Atlas::SharedCache::withImageForIndex(v27, v30, (uint64_t)&v41);
            uint64_t v29 = a2;
            uint64_t v27 = *(void **)(a1 + 64);
          }

          ++v30;
        }

        while (*(void *)(v27[16] + 144LL) > v30);
      }

      uint64_t v28 = *(void *)(v25 + 8 * v26);
      uint64_t v23 = v38;
    }

    while (1)
    {
      unint64_t v32 = *(void *)(v28 + 160);
      if (v14 >= v32) {
        break;
      }
      __int128 v64 = 0u;
      uint64_t v41 = v23;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      memset(v46, 0, sizeof(v46));
      char v47 = 0;
      if (!lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>( (uint64_t)&v53,  (uint64_t)&v41))
      {
        uint64_t v28 = *(void *)(v25 + 8 * v26);
        unint64_t v32 = *(void *)(v28 + 160);
        unint64_t v14 = -1LL;
        break;
      }

      unint64_t v14 = *(void *)(*(void *)(*((void *)v54 + v57 - 1) + 8LL * *((unsigned __int8 *)&v55 + v57 - 1)) + 160LL);
      lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t)&v53, v33, v22);
      uint64_t v28 = *(void *)(v25 + 8 * v26);
    }

    if (v14 != v32) {
      (*(void (**)(void))(v40 + 16))();
    }
    lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t)&v48, v28, v22);
  }

  double result = *(void **)(a1 + 64);
  if (result)
  {
    uint64_t v35 = a2;
    if (*(void *)(result[16] + 144LL))
    {
      unint64_t v36 = 0LL;
      do
      {
        int v37 = 1 << (v36 & 7);
        if ((*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + (v36 >> 3)) & v37) != 0
          && (!*(void *)(v35 + 64)
           || (*(_BYTE *)(*(void *)(*(void *)(v35 + 56) + 8LL) + (v36 >> 3)) & v37) == 0))
        {
          uint64_t v58 = MEMORY[0x1895FED80];
          *(void *)&__int128 v59 = 0x40000000LL;
          *((void *)&v59 + 1) = ___ZZN5dyld45Atlas15ProcessSnapshot17forEachImageNotInERKS1_U13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke;
          *(void *)&__int128 v60 = &__block_descriptor_tmp_75_0;
          *((void *)&v60 + 1) = &v40;
          dyld4::Atlas::SharedCache::withImageForIndex(result, v36, (uint64_t)&v58);
          uint64_t v35 = a2;
          double result = *(void **)(a1 + 64);
        }

        ++v36;
      }

      while (*(void *)(result[16] + 144LL) > v36);
    }
  }

  return result;
}

uint64_t dyld4::Atlas::ProcessSnapshot::sharedCache(dyld4::Atlas::ProcessSnapshot *this)
{
  return (uint64_t)this + 64;
}

lsl::Allocator **dyld4::Atlas::ProcessSnapshot::addImage(lsl::Allocator *a1, dyld4::Atlas::Image *a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  uint64_t v3 = (uint64_t)a1 + 16;
  uint64_t v4 = (lsl::Lock **)lsl::Allocator::defaultAllocator(a1);
  lsl::Allocator::makeUnique<dyld4::Atlas::Image,dyld4::Atlas::Image>(v4, a2, &v6);
  lsl::OrderedSet<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>>::insert( v3,  (uint64_t *)&v6,  (uint64_t)v7);
  return lsl::UniquePtr<dyld4::Atlas::Image>::~UniquePtr(&v6);
}

double lsl::OrderedSet<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>>::insert@<D0>( uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::const_iterator( (uint64_t)v19,  a1,  (uint64_t)a2);
  lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::insert_internal( a1,  (uint64_t)v19,  a2,  (uint64_t)&v9);
  uint64_t v6 = v9;
  *(_OWORD *)(a3 + 24) = v11;
  *(_OWORD *)(a3 + 40) = v12;
  *(_OWORD *)(a3 + 56) = v13;
  *(_OWORD *)(a3 + 72) = v14;
  double result = *(double *)&v10;
  *(_OWORD *)(a3 + 8) = v10;
  *(void *)(a3 + 88) = v15;
  *(_WORD *)(a3 + 96) = v16;
  char v8 = v17;
  *(void *)a3 = v6;
  *(_BYTE *)(a3 + 98) = v8;
  *(_BYTE *)(a3 + 104) = v18;
  return result;
}

void lsl::Allocator::makeUnique<dyld4::Atlas::Image,dyld4::Atlas::Image>( lsl::Lock **a1@<X0>, dyld4::Atlas::Image *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = lsl::Allocator::aligned_alloc(a1, 8uLL, 0xC0uLL);
  *uint64_t v5 = *(void *)a2;
  *(_OWORD *)(v5 + 7) = 0u;
  *(_OWORD *)(v5 + 5) = 0u;
  *(_OWORD *)(v5 + 3) = 0u;
  *(_OWORD *)(v5 + 1) = 0u;
  v5[9] = 0x1FFFFFFFFLL;
  *((_WORD *)v5 + 40) = 0;
  *((_BYTE *)v5 + 82) = 1;
  *((_BYTE *)v5 + 144) = 0;
  *((_BYTE *)v5 + 152) = 0;
  *((_BYTE *)v5 + 136) = 0;
  *(_OWORD *)(v5 + 15) = 0u;
  *(_OWORD *)(v5 + 13) = 0u;
  *(_OWORD *)(v5 + 11) = 0u;
  *(_DWORD *)((char *)v5 + 183) = 0;
  v5[21] = 0LL;
  v5[22] = 0LL;
  v5[20] = 0LL;
  dyld4::Atlas::Image::swap((dyld4::Atlas::Image *)v5, a2);
  *a3 = v5;
}

uint64_t dyld4::Atlas::ProcessSnapshot::Serializer::readMappedFileInfo( uint64_t a1, unsigned __int8 **a2, uint64_t *a3, _OWORD *a4, dyld4::FileRecord *a5)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  char PVLEUInt64 = lsl::readPVLEUInt64(a2);
  *a3 = lsl::readPVLEUInt64(a2);
  if ((PVLEUInt64 & 4) != 0)
  {
    *a4 = *(_OWORD *)*a2;
    uint64_t v11 = (uint64_t)(a2[1] - 16);
    *a2 += 16;
    a2[1] = (unsigned __int8 *)v11;
  }

  if ((PVLEUInt64 & 1) != 0)
  {
    unint64_t v12 = lsl::readPVLEUInt64(a2);
    uint64_t v13 = lsl::readPVLEUInt64(a2);
    if (v12 >= *(void *)(a1 + 64)) {
      return 0LL;
    }
    dyld4::FileManager::fileRecordForVolumeUUIDAndObjID( *(dyld4::FileManager **)(a1 + 16),  (const UUID *)(*(void *)(a1 + 56) + 16 * v12),  v13,  (uint64_t)v16);
    dyld4::FileRecord::operator=(a5, (dyld4::FileRecord *)v16);
    dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v16);
  }

  if ((PVLEUInt64 & 2) == 0) {
    return 1LL;
  }
  unint64_t v14 = lsl::readPVLEUInt64(a2);
  if (v14 < *(void *)(a1 + 128))
  {
    dyld4::FileManager::fileRecordForPath( *(dyld4::FileManager **)(a1 + 16),  *(lsl::Lock ***)(a1 + 8),  (const char *)(*(void *)(a1 + 120) + v14),  (uint64_t)v16);
    dyld4::FileRecord::operator=(a5, (dyld4::FileRecord *)v16);
    dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v16);
    return 1LL;
  }

  return 0LL;
}

void lsl::Vector<char>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }

    else
    {
      unint64_t v2 = 16LL;
    }

    lsl::Vector<char>::reserveExact(a1, v2);
  }

uint64_t lsl::Allocator::makeUnique<dyld4::Atlas::SharedCache,lsl::Allocator&,dyld4::FileRecord,lsl::SharedPtr<dyld4::Atlas::Mapper> &,unsigned long long &,unsigned long long>@<X0>( lsl::Lock **a1@<X0>, uint64_t a2@<X1>, dyld4::FileRecord *a3@<X2>, unsigned int **a4@<X3>, char **a5@<X4>, void *a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v13 = lsl::Allocator::aligned_alloc(a1, 8uLL, 0xB0uLL);
  uint64_t result = dyld4::Atlas::SharedCache::SharedCache((uint64_t)v13, a2, a3, a4, *a5, *a6 != 0LL);
  *a7 = result;
  return result;
}

uint64_t lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 80);
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v2 >= v3) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
  }
  else {
    uint64_t v4 = *(unsigned __int8 *)(a2 + 80);
  }
  if ((_DWORD)v4)
  {
    uint64_t v5 = (unsigned __int8 *)(a1 + 72);
    uint64_t v6 = (unsigned __int8 *)(a2 + 72);
    while (1)
    {
      unsigned int v8 = *v5++;
      unsigned int v7 = v8;
      unsigned int v9 = *v6++;
      BOOL v10 = v7 >= v9;
      if (v7 != v9) {
        break;
      }
      if (!--v4) {
        goto LABEL_8;
      }
    }

    if (v10) {
      return 1LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
LABEL_8:
    BOOL v11 = v3 == v2;
    if (v3 < v2) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v11) {
      return 0LL;
    }
    else {
      return v12;
    }
  }

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::deallocate(uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 248) & 0x80000000) == 0)
  {
    uint64_t v4 = (uint64_t *)(a1 + 80);
    uint64_t v5 = 8LL * *(unsigned __int8 *)(a1 + 248) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::deallocate(v6, a2);
      v5 -= 8LL;
    }

    while (v5);
  }

  lsl::Allocator::free(a2, (void *)a1);
}

uint64_t *std::optional<unsigned long long>::swap[abi:nn180100](uint64_t *result, uint64_t *a2)
{
  if ((*((_BYTE *)result + 8) != 0) != (*((_BYTE *)a2 + 8) != 0))
  {
    if (*((_BYTE *)result + 8))
    {
      *a2 = *result;
      *((_BYTE *)a2 + 8) = 1;
      if (*((_BYTE *)result + 8)) {
        *((_BYTE *)result + 8) = 0;
      }
    }

    else
    {
      *uint64_t result = *a2;
      *((_BYTE *)result + 8) = 1;
      if (*((_BYTE *)a2 + 8)) {
        *((_BYTE *)a2 + 8) = 0;
      }
    }
  }

  else if (*((_BYTE *)result + 8))
  {
    uint64_t v2 = *result;
    *uint64_t result = *a2;
    *a2 = v2;
  }

  return result;
}

uint64_t lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>( uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 98);
  unsigned int v3 = *(unsigned __int8 *)(a1 + 98);
  if (v2 >= v3) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 98);
  }
  else {
    uint64_t v4 = *(unsigned __int8 *)(a2 + 98);
  }
  if ((_DWORD)v4)
  {
    uint64_t v5 = (unsigned __int8 *)(a1 + 88);
    uint64_t v6 = (unsigned __int8 *)(a2 + 88);
    while (1)
    {
      unsigned int v8 = *v5++;
      unsigned int v7 = v8;
      unsigned int v9 = *v6++;
      BOOL v10 = v7 >= v9;
      if (v7 != v9) {
        break;
      }
      if (!--v4) {
        goto LABEL_8;
      }
    }

    if (v10) {
      return 1LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
LABEL_8:
    BOOL v11 = v3 == v2;
    if (v3 < v2) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v11) {
      return 0LL;
    }
    else {
      return v12;
    }
  }

void lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::deallocate( uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 248) & 0x80000000) == 0)
  {
    uint64_t v4 = (uint64_t *)(a1 + 120);
    uint64_t v5 = 8LL * *(unsigned __int8 *)(a1 + 248) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::deallocate(v6, a2);
      v5 -= 8LL;
    }

    while (v5);
  }

  lsl::Allocator::free(a2, (void *)a1);
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::deallocate( uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 240) & 0x80000000) == 0)
  {
    uint64_t v4 = (uint64_t *)(a1 + 168);
    uint64_t v5 = 8LL * *(unsigned __int8 *)(a1 + 240) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::deallocate( v6,  a2);
      v5 -= 8LL;
    }

    while (v5);
  }

  lsl::Allocator::free(a2, (void *)a1);
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::deallocate( uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 248) & 0x80000000) == 0)
  {
    uint64_t v4 = (uint64_t *)(a1 + 192);
    uint64_t v5 = 8LL * *(unsigned __int8 *)(a1 + 248) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::deallocate( v6,  a2);
      v5 -= 8LL;
    }

    while (v5);
  }

  lsl::Allocator::free(a2, (void *)a1);
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 143);
  unsigned int v3 = *(unsigned __int8 *)(a1 + 143);
  if (v2 >= v3) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 143);
  }
  else {
    uint64_t v4 = *(unsigned __int8 *)(a2 + 143);
  }
  if ((_DWORD)v4)
  {
    uint64_t v5 = (unsigned __int8 *)(a1 + 128);
    uint64_t v6 = (unsigned __int8 *)(a2 + 128);
    while (1)
    {
      unsigned int v8 = *v5++;
      unsigned int v7 = v8;
      unsigned int v9 = *v6++;
      BOOL v10 = v7 >= v9;
      if (v7 != v9) {
        break;
      }
      if (!--v4) {
        goto LABEL_8;
      }
    }

    if (v10) {
      return 1LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
LABEL_8:
    BOOL v11 = v3 == v2;
    if (v3 < v2) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v11) {
      return 0LL;
    }
    else {
      return v12;
    }
  }

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 152);
  unsigned int v3 = *(unsigned __int8 *)(a1 + 152);
  if (v2 >= v3) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 152);
  }
  else {
    uint64_t v4 = *(unsigned __int8 *)(a2 + 152);
  }
  if ((_DWORD)v4)
  {
    uint64_t v5 = (unsigned __int8 *)(a1 + 136);
    uint64_t v6 = (unsigned __int8 *)(a2 + 136);
    while (1)
    {
      unsigned int v8 = *v5++;
      unsigned int v7 = v8;
      unsigned int v9 = *v6++;
      BOOL v10 = v7 >= v9;
      if (v7 != v9) {
        break;
      }
      if (!--v4) {
        goto LABEL_8;
      }
    }

    if (v10) {
      return 1LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
LABEL_8:
    BOOL v11 = v3 == v2;
    if (v3 < v2) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v11) {
      return 0LL;
    }
    else {
      return v12;
    }
  }

uint64_t ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__0clEPNS0_15ProcessSnapshotE_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = *MEMORY[0x1895FEE08];
  uint64_t v4 = *(void *)(a1 + 32);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v5 = v4 + 88;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  memset(v35, 0, sizeof(v35));
  uint64_t v27 = v4 + 88;
  uint64_t v6 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v27,  a2,  a3);
  uint64_t v7 = *(void *)v6;
  __int128 v8 = *(_OWORD *)(v6 + 104);
  __int128 v9 = *(_OWORD *)(v6 + 88);
  uint64_t v10 = *(void *)(v6 + 120);
  uint64_t v11 = *(void *)(v6 + 128);
  v23[4] = *(_OWORD *)(v6 + 72);
  v23[5] = v9;
  v23[6] = v8;
  uint64_t v24 = v10;
  __int128 v12 = *(_OWORD *)(v6 + 56);
  __int128 v13 = *(_OWORD *)(v6 + 40);
  __int128 v14 = *(_OWORD *)(v6 + 24);
  v23[0] = *(_OWORD *)(v6 + 8);
  v23[1] = v14;
  v23[2] = v13;
  v23[3] = v12;
  *(void *)&v25[7] = *(void *)(v6 + 135);
  *(void *)uint64_t v25 = v11;
  LOBYTE(v10) = *(_BYTE *)(v6 + 143);
  uint64_t v22 = v7;
  unsigned __int8 v26 = v10;
  __int128 v42 = 0u;
  memset(v43, 0, sizeof(v43));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v27 = v5;
  memset(v35, 0, sizeof(v35));
  uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v22,  (uint64_t)&v27);
  if ((_BYTE)result)
  {
    uint64_t v16 = MEMORY[0x1895FED80];
    do
    {
      uint64_t v17 = *((void *)v23 + v26 - 1) + 24LL * v25[v26 - 1];
      char v18 = *(dispatch_queue_s **)(v17 + 8);
      v21[0] = v16;
      v21[1] = 0x40000000LL;
      _OWORD v21[2] = ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__0clEPNS0_15ProcessSnapshotE_block_invoke_2;
      void v21[3] = &__block_descriptor_tmp_68_0;
      v21[4] = v17;
      v21[5] = a2;
      dispatch_async_and_wait(v18, v21);
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v22,  v19,  v20);
      uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v22,  (uint64_t)&v27);
    }

    while ((_BYTE)result);
  }

  return result;
}

uint64_t ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__0clEPNS0_15ProcessSnapshotE_block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 16LL))();
}

uint64_t ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__1clEPNS0_15ProcessSnapshotE_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = *MEMORY[0x1895FEE08];
  uint64_t v4 = *(void *)(a1 + 32);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v5 = v4 + 88;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  memset(v35, 0, sizeof(v35));
  uint64_t v27 = v4 + 88;
  uint64_t v6 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v27,  a2,  a3);
  uint64_t v7 = *(void *)v6;
  __int128 v8 = *(_OWORD *)(v6 + 104);
  __int128 v9 = *(_OWORD *)(v6 + 88);
  uint64_t v10 = *(void *)(v6 + 120);
  uint64_t v11 = *(void *)(v6 + 128);
  v23[4] = *(_OWORD *)(v6 + 72);
  v23[5] = v9;
  v23[6] = v8;
  uint64_t v24 = v10;
  __int128 v12 = *(_OWORD *)(v6 + 56);
  __int128 v13 = *(_OWORD *)(v6 + 40);
  __int128 v14 = *(_OWORD *)(v6 + 24);
  v23[0] = *(_OWORD *)(v6 + 8);
  v23[1] = v14;
  v23[2] = v13;
  v23[3] = v12;
  *(void *)&v25[7] = *(void *)(v6 + 135);
  *(void *)uint64_t v25 = v11;
  LOBYTE(v10) = *(_BYTE *)(v6 + 143);
  uint64_t v22 = v7;
  unsigned __int8 v26 = v10;
  __int128 v42 = 0u;
  memset(v43, 0, sizeof(v43));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v27 = v5;
  memset(v35, 0, sizeof(v35));
  uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v22,  (uint64_t)&v27);
  if ((_BYTE)result)
  {
    uint64_t v16 = MEMORY[0x1895FED80];
    do
    {
      uint64_t v17 = *((void *)v23 + v26 - 1) + 24LL * v25[v26 - 1];
      char v18 = *(dispatch_queue_s **)(v17 + 8);
      v21[0] = v16;
      v21[1] = 0x40000000LL;
      _OWORD v21[2] = ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__1clEPNS0_15ProcessSnapshotE_block_invoke_2;
      void v21[3] = &__block_descriptor_tmp_70_0;
      v21[4] = v17;
      v21[5] = a2;
      dispatch_async_and_wait(v18, v21);
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v22,  v19,  v20);
      uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v22,  (uint64_t)&v27);
    }

    while ((_BYTE)result);
  }

  return result;
}

uint64_t ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__1clEPNS0_15ProcessSnapshotE_block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 16LL))();
}

void lsl::Vector<unsigned int>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 4 * a2);
    }

    else
    {
      unsigned int v3 = (void *)(a1 + 8);
      unsigned int v2 = *(void **)(a1 + 8);
      if (v2) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v2);
      }
      *unsigned int v3 = 0LL;
      v3[1] = 0LL;
      v3[2] = 0LL;
    }
  }

  else
  {
    lsl::Vector<unsigned int>::reserve(a1, a2);
  }

void lsl::Vector<unsigned int>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }

    else
    {
      unint64_t v2 = 16LL;
    }

    lsl::Vector<unsigned int>::reserveExact(a1, v2);
  }

void lsl::Vector<unsigned int>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if ((lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 4 * a2) & 1) != 0)
    {
LABEL_12:
      *(void *)(a1 + 24) = a2;
      return;
    }

    unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, 4 * a2);
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)(a1 + 8);
    uint64_t v7 = *(void *)(a1 + 16);
    if (v7)
    {
      __int128 v8 = v4;
      __int128 v9 = *(int **)(a1 + 8);
      do
      {
        int v10 = *v9++;
        *v8++ = v10;
        --v7;
      }

      while (v7);
    }

    else if (!v6)
    {
      unint64_t v11 = 0LL;
      goto LABEL_9;
    }

    lsl::Allocator::free(*(lsl::Lock ***)a1, v6);
    unint64_t v11 = *(void *)(a1 + 16);
LABEL_9:
    if (v11 >= a2) {
      unint64_t v11 = a2;
    }
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v11;
    goto LABEL_12;
  }

void lsl::Vector<char>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), a2);
    }

    else
    {
      unint64_t v3 = (void *)(a1 + 8);
      unint64_t v2 = *(void **)(a1 + 8);
      if (v2) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v2);
      }
      *unint64_t v3 = 0LL;
      v3[1] = 0LL;
      v3[2] = 0LL;
    }
  }

  else
  {
    lsl::Vector<char>::reserve(a1, a2);
  }

void lsl::Vector<char const*>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 8 * a2);
    }

    else
    {
      unint64_t v3 = (void *)(a1 + 8);
      unint64_t v2 = *(void **)(a1 + 8);
      if (v2) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v2);
      }
      *unint64_t v3 = 0LL;
      v3[1] = 0LL;
      v3[2] = 0LL;
    }
  }

  else
  {
    lsl::Vector<char const*>::reserve(a1, a2);
  }

void lsl::Vector<char const*>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }

    else
    {
      unint64_t v2 = 16LL;
    }

    lsl::Vector<char const*>::reserveExact(a1, v2);
  }

void lsl::Vector<char const*>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if ((lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 8 * a2) & 1) == 0)
    {
      unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, 8 * a2);
      uint64_t v5 = v4;
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        uint64_t v7 = 0LL;
        __int128 v8 = v4;
        do
          *v8++ = *(void *)(*(void *)(a1 + 8) + 8 * v7++);
        while (v6 != v7);
      }

      __int128 v9 = *(void **)(a1 + 8);
      if (v9)
      {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v9);
        unint64_t v6 = *(void *)(a1 + 16);
      }

      if (v6 >= a2) {
        unint64_t v6 = a2;
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v6;
    }

    *(void *)(a1 + 24) = a2;
  }

void *___ZZN5dyld45Atlas15ProcessSnapshot12forEachImageEU13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke( uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 32) + 16LL))(*(void **)(a1 + 32));
}

void *___ZZN5dyld45Atlas15ProcessSnapshot17forEachImageNotInERKS1_U13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke( uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 32) + 16LL))(*(void **)(a1 + 32));
}

char *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<unsigned char *,unsigned char *,std::back_insert_iterator<lsl::Vector<char>>>( uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      char v7 = *v5++;
      lsl::Vector<char>::reserve(a4, *(void *)(a4 + 16) + 1LL);
      uint64_t v8 = *(void *)(a4 + 8);
      uint64_t v9 = *(void *)(a4 + 16);
      *(void *)(a4 + 16) = v9 + 1;
      *(_BYTE *)(v8 + v9) = v7;
    }

    while (v5 != a3);
    return a3;
  }

  return v5;
}

uint64_t lsl::BTree<int,std::less<int>,false>::insert_internal@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v26 = *MEMORY[0x1895FEE08];
  if (*(void *)a1)
  {
    uint64_t v21 = a1;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    memset(v25, 0, sizeof(v25));
    uint64_t result = lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>(a2, (uint64_t)&v21);
    if ((_BYTE)result
      && (uint64_t v9 = *(unsigned __int8 *)(a2 + 80),
          *a3 >= *(_DWORD *)(*(void *)(a2 + 8 + 8 * (v9 - 1)) + 4LL * *(unsigned __int8 *)(a2 + v9 - 1 + 72))))
    {
      char v15 = 0;
      *(void *)a4 = *(void *)a2;
      __int128 v19 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a4 + 24) = v19;
      __int128 v20 = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = v20;
      *(void *)(a4 + 72) = *(void *)(a2 + 72);
      *(_BYTE *)(a4 + 80) = v9;
    }

    else
    {
      uint64_t v21 = a1;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      memset(v25, 0, sizeof(v25));
      if (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>(a2, (uint64_t)&v21)
        && *(unsigned __int8 *)(a2 + 80) == *(unsigned __int8 *)(a1 + 32))
      {
        lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2, v10, v11);
        uint64_t v12 = *(unsigned __int8 *)(a2 + 80) - 1LL;
        unsigned __int8 v13 = *(_BYTE *)(a2 + v12 + 72);
      }

      else
      {
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(a2, v10, v11);
        lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2, v16, v17);
        uint64_t v18 = *(unsigned __int8 *)(a2 + 80) + a2;
        unsigned __int8 v13 = *(_BYTE *)(v18 + 71) + 1;
        *(_BYTE *)(v18 + 71) = v13;
        uint64_t v12 = *(unsigned __int8 *)(a2 + 80) - 1LL;
      }

      uint64_t result = (uint64_t)lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert( *(char **)(a2 + 8 + 8 * v12),  v13,  a3);
      ++*(void *)(a1 + 24);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
      *(void *)(a4 + 72) = *(void *)(a2 + 72);
      *(_BYTE *)(a4 + 80) = *(_BYTE *)(a2 + 80);
      char v15 = 1;
    }
  }

  else
  {
    __int128 v14 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    *((_BYTE *)v14 + 248) = 0x80;
    *(_OWORD *)__int128 v14 = 0u;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
    *((_OWORD *)v14 + 3) = 0u;
    *((_OWORD *)v14 + 4) = 0u;
    *((_OWORD *)v14 + 5) = 0u;
    *((_OWORD *)v14 + 6) = 0u;
    *((_OWORD *)v14 + 7) = 0u;
    *((_OWORD *)v14 + 8) = 0u;
    *((_OWORD *)v14 + 9) = 0u;
    *((_OWORD *)v14 + 10) = 0u;
    *((_OWORD *)v14 + 11) = 0u;
    *((_OWORD *)v14 + 12) = 0u;
    *((_OWORD *)v14 + 13) = 0u;
    *((_OWORD *)v14 + 14) = 0u;
    v14[30] = 0LL;
    *(void *)a1 = v14;
    char v15 = 1;
    *(_BYTE *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v14;
    *(_BYTE *)(a2 + 80) = 1;
    uint64_t result = (uint64_t)lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert((char *)v14, 0LL, a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(void *)(a4 + 72) = *(void *)(a2 + 72);
    *(_BYTE *)(a4 + 80) = *(_BYTE *)(a2 + 80);
  }

  *(_BYTE *)(a4 + 88) = v15;
  return result;
}

char *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert(char *result, uint64_t a2, _DWORD *a3)
{
  int v3 = result[248];
  int v4 = v3 & 0x7F;
  if (v3 >= 0) {
    int v5 = 20;
  }
  else {
    int v5 = 62;
  }
  if (v4 == v5) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert((uint64_t)result, a2, (uint64_t)a3);
  }
  if (v5 == (_DWORD)a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert((uint64_t)result, a2, (uint64_t)a3);
  }
  char v7 = result;
  uint64_t v8 = &result[4 * a2];
  if (v4 != (_DWORD)a2)
  {
    uint64_t result = (char *)memmove( &result[4 * a2 + 4],  &result[4 * a2],  4LL * (v3 & 0x7F) - 4LL * a2);
    LOBYTE(v3) = v7[248];
  }

  v7[248] = v3 + 1;
  *(_DWORD *)uint64_t v8 = *a3;
  return result;
}

uint64_t lsl::BTree<int,std::less<int>,false>::const_iterator::operator--( uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int8 *)(result + 80);
  int v4 = *(uint64_t **)result;
  if (*(_BYTE *)(result + 80))
  {
    if ((_DWORD)v3 == *((unsigned __int8 *)v4 + 32))
    {
      uint64_t v5 = result + 72;
      uint64_t v6 = v3 - 1;
      char v7 = (char *)(result + 72 + v3 - 1);
      char v8 = *v7;
      if (!*(_BYTE *)(result + 72 + (v3 - 1)))
      {
        if (!*v7)
        {
          do
          {
            LODWORD(v3) = v3 - 1;
            *(_BYTE *)(result + 80) = v3;
            uint64_t v6 = v3 - 1LL;
            char v8 = *(_BYTE *)(v5 + v6);
          }

          while (!v8);
        }

        char v7 = (char *)(v5 + v6);
      }
    }

    else
    {
      uint64_t v16 = result + 8;
      uint64_t v17 = result + 72;
      do
      {
        uint64_t v18 = *(void *)(v16 + 8 * (v3 - 1LL));
        uint64_t v19 = *(void *)(v18 + 8LL * *(unsigned __int8 *)(v17 + v3 - 1LL) + 80);
        *(void *)(v16 + 8LL * v3) = v19;
        *(_BYTE *)(v17 + v3) = *(_BYTE *)(v19 + 248) & 0x7F;
        LOBYTE(v3) = *(_BYTE *)(result + 80) + 1;
        *(_BYTE *)(result + 80) = v3;
      }

      while (*((unsigned __int8 *)v4 + 32) != v3);
      uint64_t v20 = v17 + v3;
      char v21 = *(_BYTE *)(v20 - 1);
      char v7 = (char *)(v20 - 1);
      char v8 = v21;
    }
  }

  else
  {
    uint64_t v9 = *v4;
    *(_BYTE *)(result + 80) = 0;
    if (*((_BYTE *)v4 + 32))
    {
      unsigned __int8 v10 = 0;
      uint64_t v11 = result + 8;
      do
      {
        *(void *)(v11 + 8LL * v10) = v9;
        *(_BYTE *)(result + 72 + v10) = *(_BYTE *)(v9 + 248) & 0x7F;
        uint64_t v12 = *(unsigned __int8 *)(result + 80);
        unsigned int v13 = *((unsigned __int8 *)v4 + 32);
        if ((_DWORD)v12 + 1 != v13)
        {
          uint64_t v14 = *(void *)(v11 + 8 * v12);
          uint64_t v9 = *(void *)(v14 + 8LL * *(unsigned __int8 *)(v14 + 248) + 80);
        }

        unsigned __int8 v10 = v12 + 1;
        *(_BYTE *)(result + 80) = v10;
      }

      while (v13 > v10);
      uint64_t v15 = v10 - 1LL;
    }

    else
    {
      uint64_t v15 = -1LL;
    }

    char v7 = (char *)(result + v15 + 72);
    char v8 = *v7;
  }

  *char v7 = v8 - 1;
  return result;
}

unsigned __int8 *lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion( unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result[80];
  int v4 = result;
  uint64_t v5 = result + 8;
  else {
    int v6 = 62;
  }
  if ((*(_BYTE *)(*(void *)&result[8 * v3] + 248LL) & 0x7F) == v6)
  {
    if (!result[80]) {
      goto LABEL_15;
    }
    uint64_t v7 = 0LL;
    unsigned int v8 = 0;
    do
    {
      else {
        int v9 = 62;
      }
      if ((*(_BYTE *)(v5[v7] + 248LL) & 0x7F) != v9) {
        unsigned int v8 = v7;
      }
      ++v7;
    }

    while (v3 != v7);
    if (!v8)
    {
LABEL_15:
      else {
        int v10 = 62;
      }
      if ((*(_BYTE *)(*v5 + 248LL) & 0x7F) == v10)
      {
        uint64_t result = (unsigned __int8 *)lsl::Allocator::aligned_alloc( *(lsl::Lock ***)(*(void *)result + 8LL),  0x100uLL,  0x100uLL);
        uint64_t v11 = **(void **)v4;
        result[248] = 0;
        *(_OWORD *)uint64_t result = 0u;
        *((_OWORD *)result + 1) = 0u;
        *((_OWORD *)result + 2) = 0u;
        *((_OWORD *)result + 3) = 0u;
        *((_OWORD *)result + 4) = 0u;
        *((void *)result + 10) = v11;
        **(void **)int v4 = result;
        if (v4[80] && (uint64_t result = (unsigned __int8 *)memmove(v4 + 73, v4 + 72, v4[80]), v4[80]))
        {
          uint64_t result = (unsigned __int8 *)memmove(v5 + 1, v5, 8LL * v4[80]);
          LOBYTE(v3) = v4[80] + 1;
        }

        else
        {
          LOBYTE(v3) = 1;
        }

        unsigned int v8 = 0;
        v4[72] = 0;
        uint64_t v12 = *(uint64_t **)v4;
        *((void *)v4 + 1) = **(void **)v4;
        ++*((_BYTE *)v12 + 32);
        v4[80] = v3;
      }

      else
      {
        unsigned int v8 = 0;
      }
    }

    if (v8 + 1 < v3)
    {
      unsigned int v13 = v4 + 72;
      uint64_t v14 = v8;
      do
      {
        int v15 = v14;
        uint64_t result = (unsigned __int8 *)lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild( (char *)v5[v14],  v13[v14],  *(lsl::Lock ***)(*(void *)v4 + 8LL));
        uint64_t v18 = v5[v14];
        uint64_t v19 = v13[v14];
        uint64_t v20 = *(void *)(v18 + 8 * v19 + 80);
        unsigned int v21 = v4[v14 + 73];
        if (v21 > (*(_BYTE *)(v20 + 248) & 0x7Fu))
        {
          unsigned __int8 v22 = v19 + 1;
          v13[v14] = v22;
          v4[v14 + 73] = v21 + (~*(_BYTE *)(v20 + 248) | 0x80);
          uint64_t v23 = v5[v14];
          *(void *)&v4[8 * v14 + 16] = *(void *)(v23 + 8LL * v22 + 80);
        }

        ++v14;
      }

      while (v15 + 2 < v4[80]);
    }
  }

  return result;
}

char *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild( char *a1, uint64_t a2, lsl::Lock **this)
{
  if (a1[248] < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild((uint64_t)a1, a2, (uint64_t)this);
  }
  uint64_t v3 = a1[248];
  int v4 = a1;
  uint64_t v5 = a1 + 80;
  uint64_t v6 = (uint64_t)&a1[8 * a2 + 80];
  char v7 = *(_BYTE *)(*(void *)v6 + 248LL);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 20;
  }
  else {
    int v10 = 62;
  }
  if (v9 != v10) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild((uint64_t)a1, a2, (uint64_t)this);
  }
  uint64_t v12 = a2;
  if (v8 >= 0) {
    uint64_t v13 = 10LL;
  }
  else {
    uint64_t v13 = 31LL;
  }
  uint64_t v14 = &a1[4 * a2];
  if ((_DWORD)v3 != (_DWORD)a2)
  {
    a1 = (char *)memmove(&a1[4 * a2 + 4], &a1[4 * a2], 4 * v3 - 4LL * a2);
    a2 = v4[248];
  }

  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)a1, a2, (uint64_t)this);
  }
  int v15 = &v5[8 * a2];
  if (v15 != (char *)v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), (size_t)&v15[-v6]);
    LOBYTE(a2) = v4[248];
  }

  v4[248] = a2 + 1;
  *(_DWORD *)uint64_t v14 = *(_DWORD *)(*(void *)v6 + 4 * v13);
  uint64_t result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  uint64_t v19 = result;
  uint64_t v20 = *(void *)v6;
  char v21 = *(_BYTE *)(*(void *)v6 + 248LL);
  result[248] = v21 & 0x80;
  if (v21 < 0)
  {
    *((void *)result + 30) = 0LL;
    __int128 v22 = 0uLL;
    *((_OWORD *)result + 13) = 0u;
    *((_OWORD *)result + 14) = 0u;
    *((_OWORD *)result + 11) = 0u;
    *((_OWORD *)result + 12) = 0u;
    *((_OWORD *)result + 9) = 0u;
    *((_OWORD *)result + 10) = 0u;
    *((_OWORD *)result + 7) = 0u;
    *((_OWORD *)result + 8) = 0u;
    *((_OWORD *)result + 5) = 0u;
    *((_OWORD *)result + 6) = 0u;
  }

  else
  {
    __int128 v22 = 0uLL;
  }

  *((_OWORD *)result + 3) = v22;
  *((_OWORD *)result + 4) = v22;
  *((_OWORD *)result + 1) = v22;
  *((_OWORD *)result + 2) = v22;
  *(_OWORD *)uint64_t result = v22;
  if (v4[248] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v17, v18);
  }
  unsigned __int8 v23 = v9 + ~(_BYTE)v13;
  *(void *)&v5[8 * v12 + 8] = result;
  if (v23)
  {
    uint64_t result = (char *)memmove(result, (const void *)(v20 + 4 * v13 + 4), 4LL * v23);
    uint64_t v20 = *(void *)v6;
  }

  int v24 = *(char *)(v20 + 248);
  if ((v24 & 0x80000000) == 0)
  {
    if (v19[248] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v17, v18);
    }
    uint64_t result = (char *)memmove(v19 + 80, (const void *)(v20 + 8 * v13 + 88), 8LL * v23 + 8);
    uint64_t v20 = *(void *)v6;
    LOBYTE(v24) = *(_BYTE *)(*(void *)v6 + 248LL);
  }

  *(_BYTE *)(v20 + 248) = v24 + ~v23;
  char v25 = v19[248] + v23;
  v19[248] = v25;
  if (v25 >= 0) {
    int v26 = 20;
  }
  else {
    int v26 = 62;
  }
  if ((v25 & 0x7F) == v26
    || ((char v27 = *(_BYTE *)(v20 + 248), v28 = v27, v29 = v27 & 0x7F, v28 >= 0) ? (v30 = 20) : (v30 = 62), v29 == v30))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild((uint64_t)result, v17, v18);
  }

  return result;
}

uint64_t lsl::BTree<int,std::less<int>,false>::const_iterator::const_iterator( uint64_t result, uint64_t a2, _DWORD *a3)
{
  *(_OWORD *)(result + 8) = 0u;
  uint64_t v3 = result + 8;
  *(void *)uint64_t result = a2;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 65) = 0u;
  if (*(_BYTE *)(a2 + 32))
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = *(void *)a2;
    uint64_t v6 = result + 72;
    do
    {
      *(void *)(v3 + 8 * v4) = v5;
      unint64_t v7 = *(_BYTE *)(v5 + 248) & 0x7F;
      if ((*(_BYTE *)(v5 + 248) & 0x7F) != 0)
      {
        int v8 = (_DWORD *)v5;
        do
        {
          unint64_t v9 = v7 >> 1;
          int v10 = &v8[v7 >> 1];
          int v12 = *v10;
          uint64_t v11 = v10 + 1;
          v7 += ~(v7 >> 1);
          if (v12 < *a3) {
            int v8 = v11;
          }
          else {
            unint64_t v7 = v9;
          }
        }

        while (v7);
      }

      else
      {
        int v8 = (_DWORD *)(v5 + 4 * v7);
      }

      __int16 v13 = (_WORD)v8 - v5;
      unint64_t v14 = ((unint64_t)v8 - v5) >> 2;
      *(_BYTE *)(v6 + v4) = v14;
      uint64_t v15 = *(void *)(v3 + 8 * v4);
      if ((*(_BYTE *)(v15 + 248) & 0x7F) != v14 && *(_DWORD *)(v15 + (v13 & 0x3FC)) < *a3)
      {
        *(_BYTE *)(result + 80) = v4 + 1;
        return result;
      }

      unint64_t v16 = *(unsigned __int8 *)(a2 + 32);
      if ((_DWORD)v4 + 1 != (_DWORD)v16)
      {
        if ((*(_BYTE *)(v15 + 248) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(result, a2, (uint64_t)a3);
        }
        uint64_t v5 = *(void *)(v15 + 8LL * v14 + 80);
      }

      ++v4;
    }

    while (v4 < v16);
    for (*(_BYTE *)(result + 80) = v16; (_BYTE)v16; *(_BYTE *)(result + 80) = v16)
    {
      if (*(_BYTE *)(v6 + v16 - 1) != (*(_BYTE *)(*(void *)(result
                                                                                            + 8LL * v16)
                                                                                + 248LL) & 0x7F))
        break;
      LOBYTE(v16) = v16 - 1;
    }
  }

  return result;
}

uint64_t lsl::BTree<int,std::less<int>,false>::const_iterator::operator++( uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(unsigned __int8 *)(result + 80);
  unint64_t v4 = *(uint64_t **)result;
  if (*(_BYTE *)(result + 80))
  {
    int v5 = *((unsigned __int8 *)v4 + 32);
    uint64_t v6 = result + 72;
    ++*(_BYTE *)(result + 72 + (v3 - 1));
    if (v3 == v5)
    {
      uint64_t v7 = *((unsigned __int8 *)v4 + 32);
      if (v7)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(_BYTE *)(v6 + (v7 + ~(_BYTE)i)) != (*(_BYTE *)(*(void *)(result
                                                                                           + 8
                                                                                           + 8LL
                                                                                           * (v7 + ~(_BYTE)i))
                                                                               + 248LL) & 0x7F))
            break;
          *(_BYTE *)(result + 80) = v7 + ~(_BYTE)i;
        }
      }
    }

    else
    {
      int v15 = *(unsigned __int8 *)(result + 80);
      if (v15 != *((unsigned __int8 *)v4 + 32))
      {
        uint64_t v16 = result + 8;
        do
        {
          uint64_t v17 = *(void *)(v16 + 8 * (v15 - 1LL));
          *(void *)(v16 + 8LL * v15) = *(void *)(v17
                                                                    + 8LL
                                                                    * *(unsigned __int8 *)(v6
                                                                                         + v15
                                                                                         - 1LL)
                                                                    + 80);
          *(_BYTE *)(v6 + v15) = 0;
          LOBYTE(v15) = *(_BYTE *)(result + 80) + 1;
          *(_BYTE *)(result + 80) = v15;
        }

        while (*((unsigned __int8 *)v4 + 32) != v15);
      }
    }
  }

  else
  {
    uint64_t v9 = *v4;
    *(_BYTE *)(result + 80) = 0;
    if (*((_BYTE *)v4 + 32))
    {
      unsigned __int8 v10 = 0;
      uint64_t v11 = result + 8;
      do
      {
        *(void *)(v11 + 8LL * v10) = v9;
        *(_BYTE *)(result + 72 + v10) = 0;
        uint64_t v12 = *(unsigned __int8 *)(result + 80);
        unsigned int v13 = *((unsigned __int8 *)v4 + 32);
        if ((_DWORD)v12 + 1 != v13)
        {
          uint64_t v14 = *(void *)(v11 + 8 * v12);
          uint64_t v9 = *(void *)(v14 + 80);
        }

        unsigned __int8 v10 = v12 + 1;
        *(_BYTE *)(result + 80) = v10;
      }

      while (v13 > v10);
    }
  }

  return result;
}

void lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 32 * a2);
    }

    else
    {
      int v3 = (void *)(a1 + 8);
      unint64_t v2 = *(void **)(a1 + 8);
      if (v2) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v2);
      }
      *int v3 = 0LL;
      v3[1] = 0LL;
      v3[2] = 0LL;
    }
  }

  else
  {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve(a1, a2);
  }

void lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }

    else
    {
      unint64_t v2 = 16LL;
    }

    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserveExact(a1, v2);
  }

void lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if ((lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 32 * a2) & 1) == 0)
    {
      unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, 32 * a2);
      int v5 = v4;
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        uint64_t v7 = 0LL;
        for (unint64_t i = 0LL; i < v6; ++i)
        {
          uint64_t v9 = &v4[v7];
          unsigned __int8 v10 = (_OWORD *)(*(void *)(a1 + 8) + v7 * 8);
          __int128 v11 = v10[1];
          _OWORD *v9 = *v10;
          v9[1] = v11;
          unint64_t v6 = *(void *)(a1 + 16);
          v7 += 4LL;
        }
      }

      uint64_t v12 = *(void **)(a1 + 8);
      if (v12)
      {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v12);
        unint64_t v6 = *(void *)(a1 + 16);
      }

      if (v6 >= a2) {
        unint64_t v6 = a2;
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v6;
    }

    *(void *)(a1 + 24) = a2;
  }

uint64_t lsl::BTree<int,std::less<int>,false>::erase(uint64_t a1, _DWORD *a2)
{
  uint64_t v24 = *MEMORY[0x1895FEE08];
  lsl::BTree<int,std::less<int>,false>::find(a1, a2, (uint64_t)&v17);
  uint64_t v12 = a1;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  memset(v16, 0, sizeof(v16));
  uint64_t v5 = v17;
  __int128 v6 = v18;
  __int128 v7 = v19;
  __int128 v8 = v20;
  __int128 v9 = v21;
  uint64_t v10 = v22;
  char v11 = v23;
  lsl::BTree<int,std::less<int>,false>::erase(a1, (uint64_t)&v5, v3, (uint64_t)&v12);
  return 1LL;
}

__n128 lsl::BTree<int,std::less<int>,false>::erase@<Q0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(unsigned __int8 *)(a2 + 80);
  int v8 = *(unsigned __int8 *)(a1 + 32);
  if ((_DWORD)v7 == v8)
  {
    uint64_t v9 = v7 - 1;
  }

  else
  {
    uint64_t v10 = *(void *)(a2 + 8 + 8 * (v7 - 1));
    uint64_t v11 = *(unsigned __int8 *)(a2 + 72 + v7 - 1);
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(a2, a2, a3);
    uint64_t v9 = *(unsigned __int8 *)(a2 + 80) - 1LL;
    uint64_t v12 = *(void *)(a2 + 8 + 8 * v9);
    uint64_t v13 = *(unsigned __int8 *)(a2 + 72 + v9);
    int v14 = *(_DWORD *)(v10 + 4 * v11);
    *(_DWORD *)(v10 + 4 * v11) = *(_DWORD *)(v12 + 4 * v13);
    *(_DWORD *)(v12 + 4 * v13) = v14;
  }

  uint64_t v15 = *(void *)(a2 + 8 + 8 * v9);
  lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase(v15, *(unsigned __int8 *)(a2 + v9 + 72), a3);
  lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure((char *)a2, v16, v17);
  if ((_DWORD)v7 != v8) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(a2, v18, v19);
  }
  --*(void *)(a1 + 24);
  __int128 v20 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a4 + 24) = v20;
  __n128 result = *(__n128 *)(a2 + 40);
  __int128 v22 = *(_OWORD *)(a2 + 56);
  *(__n128 *)(a4 + 40) = result;
  *(void *)a4 = *(void *)a2;
  *(_OWORD *)(a4 + 56) = v22;
  *(void *)(a4 + 72) = *(void *)(a2 + 72);
  *(_BYTE *)(a4 + 80) = *(_BYTE *)(a2 + 80);
  return result;
}

__n128 lsl::BTree<int,std::less<int>,false>::find@<Q0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = *MEMORY[0x1895FEE08];
  lsl::BTree<int,std::less<int>,false>::const_iterator::const_iterator((uint64_t)&v16, a1, a2);
  uint64_t v11 = a1;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  memset(v15, 0, sizeof(v15));
  if (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>((uint64_t)&v16, (uint64_t)&v11)
    && (unsigned __int8 v7 = v21, *a2 >= *(_DWORD *)(*((void *)v17 + v21 - 1) + 4LL * *((unsigned __int8 *)&v20 + v21 - 1))))
  {
    uint64_t v8 = v20;
    *(void *)a3 = v16;
    __int128 v9 = v17[1];
    *(_OWORD *)(a3 + 8) = v17[0];
    *(_OWORD *)(a3 + 24) = v9;
    __n128 result = v18;
    __int128 v10 = v19;
    *(__n128 *)(a3 + 40) = v18;
    *(_OWORD *)(a3 + 56) = v10;
    *(void *)(a3 + 72) = v8;
    *(_BYTE *)(a3 + 80) = v7;
  }

  else
  {
    *(void *)a3 = a1;
    result.n128_u64[0] = 0LL;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 65) = 0u;
  }

  return result;
}

char *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(char *)(a1 + 248);
  if ((v3 & 0x80000000) == 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase(a1, a2, a3);
  }
  __n128 result = (char *)(a1 + 4LL * a2);
  __int128 v6 = (char *)(a1 + 4LL * (v3 & 0x7F));
  if (v6 != result + 4)
  {
    __n128 result = (char *)memmove(result, result + 4, v6 - (result + 4));
    LOBYTE(v3) = *(_BYTE *)(a1 + 248);
  }

  *(_BYTE *)(a1 + 248) = v3 - 1;
  return result;
}

void lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure( char *__dst, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = __dst[80];
  uint64_t v4 = *(void *)__dst;
  if (v3 >= 2)
  {
    unsigned __int8 v6 = 0;
    unsigned __int8 v7 = __dst + 8;
    uint64_t v8 = __dst + 72;
    do
    {
      uint64_t v9 = (v3 - v6 - 2);
      uint64_t v10 = v9 + 1;
      else {
        unsigned int v11 = 31;
      }
      if ((*(_BYTE *)(*(void *)&v7[8 * v9 + 8] + 248LL) & 0x7Fu) >= v11) {
        break;
      }
      uint64_t v12 = v8[v9];
      uint64_t v13 = *(void *)&v7[8 * v9];
      int v14 = *(char *)(v13 + 248);
      if ((_DWORD)v12 == (v14 & 0x7F))
      {
        int v15 = 0;
        if (v8[v9]) {
          goto LABEL_10;
        }
      }

      else
      {
        if (v14 < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(v13, a2, v12);
        }
        else {
          int v20 = -31;
        }
        int v15 = v20 + (*(_BYTE *)(*(void *)(v13 + 8 * v12 + 88) + 248LL) & 0x7F);
        if (v8[v9])
        {
LABEL_10:
          if (v14 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(v13, a2, v12);
          }
          int v16 = *(char *)(*(void *)(v13 + 8 * v12 + 72) + 248LL);
          char v17 = v16 & 0x7F;
          if (v16 >= 0) {
            char v18 = -10;
          }
          else {
            char v18 = -31;
          }
          char v19 = v18 + v17;
          goto LABEL_21;
        }
      }

      char v19 = 0;
LABEL_21:
      if (v15 < 1 || v15 < v19)
      {
        if (v19 < 1 || v15 >= v19)
        {
          if ((_DWORD)v12 == (v14 & 0x7F))
          {
            if (v14 < 0) {
              lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(v13, a2, v12);
            }
            v8[v9] = v12 - 1;
            v8[v10] += (*(_BYTE *)(*(void *)(v13 + 8LL * (v12 - 1) + 80) + 248LL) & 0x7F) + 1;
            lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge( *(void *)&v7[8 * v9],  *(lsl::Lock ***)(v4 + 8),  (v12 - 1));
            uint64_t v25 = *(void *)&v7[8 * v9];
            *(void *)&v7[8 * v10] = *(void *)(v25 + 8LL * v8[v9] + 80);
          }

          else
          {
            lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge(v13, *(lsl::Lock ***)(v4 + 8), v12);
          }
        }

        else
        {
          if (v14 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(v13, a2, v12);
          }
          char v21 = *(_BYTE *)(*(void *)(v13 + 8 * v12 + 80) + 248LL);
          uint64_t v22 = lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::rotateFromLeft( (void *)v13,  v8[v9],  v12);
          uint64_t v23 = *(void *)&v7[8 * v9];
          v8[v10] += (*(_BYTE *)(*(void *)(v23 + 8LL * v8[v9] + 80) + 248LL) & 0x7F) - (v21 & 0x7F);
        }
      }

      else
      {
        lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::rotateFromRight( (_DWORD *)v13,  v8[v9],  v12);
      }

      ++v6;
      uint64_t v4 = *(void *)__dst;
      unsigned int v3 = *(unsigned __int8 *)(*(void *)__dst + 32LL);
    }

    while ((int)(v3 - 1) > v6);
  }

  int v26 = __dst + 8;
  if ((*(_BYTE *)(*((void *)__dst + 1) + 248LL) & 0x7F) != 0)
  {
    unsigned __int8 v27 = *(_BYTE *)(v4 + 32);
  }

  else
  {
    int v28 = __dst + 72;
    if (__dst[72]) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure((uint64_t)v28, a2, a3);
    }
    uint64_t v29 = __dst[80];
    if (&v28[v29] != __dst + 73)
    {
      memmove(v28, __dst + 73, v29 - 1);
      uint64_t v29 = __dst[80];
    }

    int v30 = (unsigned __int8 *)&v26[v29];
    if (v30 != (unsigned __int8 *)(__dst + 16))
    {
      memmove(__dst + 8, __dst + 16, v30 - (unsigned __int8 *)(__dst + 16));
      LOBYTE(v29) = __dst[80];
    }

    __dst[80] = v29 - 1;
    lsl::Allocator::free(*(lsl::Lock ***)(v4 + 8), *(void **)v4);
    __int128 v31 = *(void **)__dst;
    unsigned __int8 v27 = *(_BYTE *)(*(void *)__dst + 32LL) - 1;
    *(_BYTE *)(*(void *)__dst + 32LL) = v27;
    if (__dst[80]) {
      *__int128 v31 = *v26;
    }
    else {
      *__int128 v31 = 0LL;
    }
  }

  if (v27)
  {
    uint64_t v32 = 0LL;
    do
    {
      if ((*(_BYTE *)(v26[(v27 + ~(_BYTE)v32)] + 248LL) & 0x7F) != __dst[(v27 + ~(_BYTE)v32)
                                                                                         + 72])
        break;
      --__dst[80];
      ++v32;
    }

    while (v27 != v32);
  }

_DWORD *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::rotateFromRight( _DWORD *result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = (char *)&result[2 * a2];
  uint64_t v5 = *((void *)v3 + 10);
  uint64_t v4 = (_BYTE *)*((void *)v3 + 11);
  uint64_t v6 = *(_BYTE *)(v5 + 248) & 0x7F;
  int v7 = v4[248] & 0x7F;
  unsigned int v8 = v7 + v6;
  uint64_t v9 = (_DWORD *)(v5 + 4 * v6);
  _DWORD *v9 = result[a2];
  uint64_t v10 = (v7 - ((v7 + v6) >> 1));
  result[a2] = *(_DWORD *)&v4[4 * v10 - 4];
  unsigned int v11 = v7;
  if (v7 != v8 >> 1)
  {
    __n128 result = memmove(v9 + 1, v4, 4 * v10);
    unsigned int v11 = v4[248] & 0x7F;
  }

  if (v11 != (_DWORD)v10) {
    __n128 result = memmove(v4, &v4[4 * (v7 - (v8 >> 1))], 4LL * v11 - 4 * v10);
  }
  if ((*(char *)(v5 + 248) & 0x80000000) == 0)
  {
    int v12 = (char)v4[248];
    if (v12 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, a2, a3);
    }
    if (v7 != v8 >> 1)
    {
      __n128 result = memmove((void *)(v5 + 8LL * *(unsigned __int8 *)(v5 + 248) + 88), v4 + 80, 8 * v10);
      int v12 = (char)v4[248];
      if (v12 < 0) {
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v13, v14);
      }
    }

    uint64_t v15 = v12 + 1LL;
    if (v15 != v10) {
      __n128 result = memmove(v4 + 80, &v4[8 * v10 + 80], 8 * v15 - 8 * v10);
    }
  }

  *(_BYTE *)(v5 + 248) += v10;
  v4[248] -= v10;
  return result;
}

void *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::rotateFromLeft( void *result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = result;
  uint64_t v4 = a2 - 1LL;
  uint64_t v5 = result[v4 + 10];
  uint64_t v6 = (_BYTE *)result[a2 + 10];
  LOBYTE(v7) = *(_BYTE *)(v5 + 248);
  int v8 = v7 & 0x7F;
  uint64_t v9 = v6[248] & 0x7F;
  unsigned int v10 = v9 + v8;
  uint64_t v11 = ((v7 & 0x7F) - ((v9 + v8) >> 1));
  if ((v6[248] & 0x7F) != 0)
  {
    __n128 result = memmove(&v6[4 * v9 + 4 * v11 + -4 * v9], v6, 4 * v9);
    LOBYTE(v7) = *(_BYTE *)(v5 + 248);
  }

  int v12 = v7 & 0x7F;
  uint64_t v13 = (const void *)(v5 + 4LL * (v7 & 0x7F) - 4 * v11 + 4);
  uint64_t v14 = -(-4 * v11 + 4);
  if (-4 * v11 != -4)
  {
    __n128 result = memmove(v6, v13, v14);
    LOBYTE(v7) = *(_BYTE *)(v5 + 248);
    int v12 = v7 & 0x7F;
  }

  uint64_t v15 = v6[248];
  *(_DWORD *)&v6[4 * v11 - 4] = *((_DWORD *)v3 + v4);
  *((_DWORD *)v3 + v4) = *(_DWORD *)(v5 + 4LL * (v12 - (int)v11));
  if ((v7 & 0x80) == 0)
  {
    if ((v15 & 0x80) != 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, (uint64_t)v13, v14);
    }
    __n128 result = memmove(&v6[8 * v15 + 88 + 8 * v11 + 8 * ~v15], v6 + 80, 8 * v15 + 8);
    int v7 = *(char *)(v5 + 248);
    if (v7 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v16, v17);
    }
    if (v8 != v10 >> 1)
    {
      __n128 result = memmove(v6 + 80, (const void *)(v5 + 8LL * *(unsigned __int8 *)(v5 + 248) + 88 - 8 * v11), 8 * v11);
      LOBYTE(v7) = *(_BYTE *)(v5 + 248);
    }
  }

  *(_BYTE *)(v5 + 248) = v7 - v11;
  v6[248] += v11;
  return result;
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge( uint64_t a1, lsl::Lock **this, uint64_t a3)
{
  int v3 = *(char *)(a1 + 248);
  if (v3 < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge(a1, (uint64_t)this, a3);
  }
  LOBYTE(v4) = *(_BYTE *)(a1 + 248);
  uint64_t v7 = a1 + 80;
  int v8 = (void *)(a1 + 80 + 8LL * a3);
  uint64_t v10 = *v8;
  uint64_t v9 = (unsigned __int8 *)v8[1];
  uint64_t v11 = (_DWORD *)(a1 + 4LL * a3);
  *(_DWORD *)(*v8 + 4LL * (*(_BYTE *)(*v8 + 248LL) & 0x7F)) = *v11;
  int v12 = (char *)(a1 + 4LL * v3);
  if (v12 != (char *)(v11 + 1))
  {
    uint64_t v11 = memmove(v11, v11 + 1, v12 - (char *)(v11 + 1));
    int v4 = *(char *)(a1 + 248);
    if (v4 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v11, v13, v14);
    }
  }

  uint64_t v15 = v8 + 2;
  uint64_t v16 = v7 + 8LL * v4 + 8;
  size_t v17 = v16 - (void)(v8 + 2);
  if ((void *)v16 != v8 + 2) {
    uint64_t v11 = memmove(v8 + 1, v15, v17);
  }
  unsigned int v18 = v9[248];
  unsigned int v19 = *(unsigned __int8 *)(v10 + 248);
  if ((v18 & 0x7F) != 0)
  {
    uint64_t v11 = memmove((void *)(v10 + 4LL * (v19 & 0x7F) + 4), v9, 4LL * (v18 & 0x7F));
    unsigned int v19 = *(unsigned __int8 *)(v10 + 248);
    unsigned int v18 = v9[248];
  }

  if ((v19 & 0x80) == 0)
  {
    if ((v18 & 0x80) != 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v11, (uint64_t)v15, v17);
    }
    memmove((void *)(v10 + 8LL * v19 + 88), v9 + 80, 8LL * v18 + 8);
    LOBYTE(v18) = v9[248];
    LOBYTE(v19) = *(_BYTE *)(v10 + 248);
  }

  *(_BYTE *)(v10 + 248) = (v18 & 0x7F) + v19 + 1;
  --*(_BYTE *)(a1 + 248);
  lsl::Allocator::free(this, v9);
}

void *lsl::SharedPtr<dyld4::Atlas::Mapper>::SharedPtr( void *a1, lsl::Allocator::AllocationMetadata *this)
{
  *a1 = 0LL;
  int v4 = (lsl::Allocator::AllocationMetadata *)lsl::Allocator::AllocationMetadata::forPtr(this, this);
  uint64_t v5 = (dyld4::FileRecord *)lsl::Allocator::AllocationMetadata::pool(v4, 1);
  uint64_t v6 = (lsl::Lock **)dyld4::FileRecord::fileManager(v5);
  uint64_t v7 = lsl::Allocator::aligned_alloc(v6, 8uLL, 0x10uLL);
  *(_DWORD *)uint64_t v7 = 0;
  v7[1] = this;
  *a1 = v7;
  return a1;
}

void lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(lsl::Allocator *this, void *a2)
{
  do
    unsigned int v3 = __ldaxr((unsigned int *)this);
  while (__stlxr(v3 - 1, (unsigned int *)this));
  if (!v3)
  {
    int v4 = (dyld4::Atlas::Mapper *)*((void *)this + 1);
    if (v4)
    {
      dyld4::Atlas::Mapper::~Mapper(v4);
      lsl::Allocator::freeObject(*((lsl::Allocator **)this + 1), v5);
    }

    lsl::Allocator::freeObject(this, a2);
  }

uint64_t *lsl::Vector<dyld4::Atlas::Mapper::Mapping>::swap(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v2 = *result;
    *__n128 result = *a2;
    *a2 = v2;
    uint64_t v4 = result[1];
    uint64_t v3 = result[2];
    uint64_t v5 = a2[2];
    result[1] = a2[1];
    result[2] = v5;
    a2[2] = v3;
    uint64_t v6 = result[3];
    result[3] = a2[3];
    a2[3] = v6;
    a2[1] = v4;
  }

  return result;
}

void *lsl::Vector<dyld4::Atlas::Mapper::Mapping>::Vector(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a3;
  a1[1] = 0LL;
  uint64_t v5 = (void **)(a1 + 1);
  a1[2] = 0LL;
  a1[3] = 0LL;
  lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)a1, *(void *)(a2 + 16));
  a1[2] = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6) {
    memmove(*v5, *(const void **)(a2 + 8), 32 * v6);
  }
  return a1;
}

uint64_t dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 && *(_BYTE *)(a1 + 24)) {
    munmap((void *)(-*MEMORY[0x189600148] & v2), *(void *)(a1 + 8) + v2 - (-*MEMORY[0x189600148] & v2));
  }
  return a1;
}

uint64_t *dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::swap(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v2 = *result;
    uint64_t v3 = result[1];
    uint64_t v4 = a2[1];
    *__n128 result = *a2;
    result[1] = v4;
    *a2 = v2;
    a2[1] = v3;
    uint64_t v5 = result[2];
    result[2] = a2[2];
    a2[2] = v5;
    LOBYTE(v5) = *((_BYTE *)result + 24);
    *((_BYTE *)result + 24) = *((_BYTE *)a2 + 24);
    *((_BYTE *)a2 + 24) = v5;
  }

  return result;
}

uint64_t lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::insert_internal@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v35 = *MEMORY[0x1895FEE08];
  if (*(void *)a1)
  {
    uint64_t v29 = a1;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    memset(v34, 0, sizeof(v34));
    uint64_t result = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>(a2, (uint64_t)&v29);
    if ((_BYTE)result
      && (uint64_t v9 = *(unsigned __int8 *)(a2 + 98),
          uint64_t v10 = *(char **)(*(void *)(a2 + 8 + 8 * (v9 - 1)) + 8LL * *(unsigned __int8 *)(a2 + 88 + v9 - 1)),
          int v11 = **a3,
          v11 >= *v10))
    {
      int v12 = *v10;
      uint64_t v13 = v10 + 1;
      uint64_t v14 = *a3 + 1;
      while (v12 && (char)v12 >= (char)v11)
      {
        if ((_BYTE)v11)
        {
          int v15 = *v14++;
          int v11 = v15;
          int v16 = *v13++;
          int v12 = v16;
          if (v11 >= v16) {
            continue;
          }
        }

        goto LABEL_9;
      }

      char v25 = 0;
      __int128 v27 = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      __int128 v28 = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = v28;
      *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 8) = v27;
      *(void *)(a4 + 88) = *(void *)(a2 + 88);
      *(_WORD *)(a4 + 96) = *(_WORD *)(a2 + 96);
      *(_BYTE *)(a4 + 98) = v9;
    }

    else
    {
LABEL_9:
      uint64_t v29 = a1;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      memset(v34, 0, sizeof(v34));
      if (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>( a2,  (uint64_t)&v29)
        && *(unsigned __int8 *)(a2 + 98) == *(unsigned __int8 *)(a1 + 32))
      {
        lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::prepareForInsertion( (unsigned __int8 *)a2,  v17,  v18);
        uint64_t v19 = a2 + 88;
        uint64_t v20 = *(unsigned __int8 *)(a2 + 98) - 1LL;
        unsigned __int8 v21 = *(_BYTE *)(a2 + 88 + v20);
      }

      else
      {
        lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator--(a2, v17, v18);
        lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::prepareForInsertion( (unsigned __int8 *)a2,  v22,  v23);
        uint64_t v19 = a2 + 88;
        uint64_t v24 = *(unsigned __int8 *)(a2 + 98) + a2 + 88;
        unsigned __int8 v21 = *(_BYTE *)(v24 - 1) + 1;
        *(_BYTE *)(v24 - 1) = v21;
        uint64_t v20 = *(unsigned __int8 *)(a2 + 98) - 1LL;
      }

      uint64_t result = (uint64_t)lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::insert( *(char **)(a2 + 8 + 8 * v20),  v21,  a3);
      ++*(void *)(a1 + 24);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
      *(void *)(a4 + 88) = *(void *)v19;
      *(_WORD *)(a4 + 96) = *(_WORD *)(v19 + 8);
      *(_BYTE *)(a4 + 98) = *(_BYTE *)(a2 + 98);
      char v25 = 1;
    }
  }

  else
  {
    int v26 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    *((_BYTE *)v26 + 248) = 0x80;
    *(_OWORD *)int v26 = 0u;
    *((_OWORD *)v26 + 1) = 0u;
    *((_OWORD *)v26 + 2) = 0u;
    *((_OWORD *)v26 + 3) = 0u;
    *((_OWORD *)v26 + 4) = 0u;
    *((_OWORD *)v26 + 5) = 0u;
    *((_OWORD *)v26 + 6) = 0u;
    *((_OWORD *)v26 + 7) = 0u;
    *((_OWORD *)v26 + 8) = 0u;
    *((_OWORD *)v26 + 9) = 0u;
    *((_OWORD *)v26 + 10) = 0u;
    *((_OWORD *)v26 + 11) = 0u;
    *((_OWORD *)v26 + 12) = 0u;
    *((_OWORD *)v26 + 13) = 0u;
    *((_OWORD *)v26 + 14) = 0u;
    v26[30] = 0LL;
    *(void *)a1 = v26;
    char v25 = 1;
    *(_BYTE *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v26;
    *(_BYTE *)(a2 + 98) = 1;
    uint64_t result = (uint64_t)lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::insert( (char *)v26,  0LL,  a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(void *)(a4 + 88) = *(void *)(a2 + 88);
    *(_WORD *)(a4 + 96) = *(_WORD *)(a2 + 96);
    *(_BYTE *)(a4 + 98) = *(_BYTE *)(a2 + 98);
  }

  *(_BYTE *)(a4 + 104) = v25;
  return result;
}

char *lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::insert( char *result, uint64_t a2, void *a3)
{
  int v3 = result[248];
  int v4 = v3 & 0x7F;
  if (v3 >= 0) {
    int v5 = 15;
  }
  else {
    int v5 = 31;
  }
  if (v4 == v5) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert((uint64_t)result, a2, (uint64_t)a3);
  }
  if (v5 == (_DWORD)a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert((uint64_t)result, a2, (uint64_t)a3);
  }
  uint64_t v7 = result;
  int v8 = &result[8 * a2];
  if (v4 != (_DWORD)a2)
  {
    uint64_t result = (char *)memmove( &result[8 * a2 + 8],  &result[8 * a2],  8LL * (v3 & 0x7F) - 8LL * a2);
    LOBYTE(v3) = v7[248];
  }

  v7[248] = v3 + 1;
  *(void *)int v8 = *a3;
  return result;
}

uint64_t lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator--( uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int8 *)(result + 98);
  int v4 = *(uint64_t **)result;
  if (*(_BYTE *)(result + 98))
  {
    if ((_DWORD)v3 == *((unsigned __int8 *)v4 + 32))
    {
      uint64_t v5 = result + 88;
      uint64_t v6 = v3 - 1;
      uint64_t v7 = (char *)(result + 88 + v3 - 1);
      char v8 = *v7;
      if (!*(_BYTE *)(result + 88 + (v3 - 1)))
      {
        if (!*v7)
        {
          do
          {
            LODWORD(v3) = v3 - 1;
            *(_BYTE *)(result + 98) = v3;
            uint64_t v6 = v3 - 1LL;
            char v8 = *(_BYTE *)(v5 + v6);
          }

          while (!v8);
        }

        uint64_t v7 = (char *)(v5 + v6);
      }
    }

    else
    {
      uint64_t v16 = result + 8;
      uint64_t v17 = result + 88;
      do
      {
        uint64_t v18 = *(void *)(v16 + 8 * (v3 - 1LL));
        uint64_t v19 = *(void *)(v18 + 8LL * *(unsigned __int8 *)(v17 + v3 - 1LL) + 120);
        *(void *)(v16 + 8LL * v3) = v19;
        *(_BYTE *)(v17 + v3) = *(_BYTE *)(v19 + 248) & 0x7F;
        LOBYTE(v3) = *(_BYTE *)(result + 98) + 1;
        *(_BYTE *)(result + 98) = v3;
      }

      while (*((unsigned __int8 *)v4 + 32) != v3);
      uint64_t v20 = v17 + v3;
      char v21 = *(_BYTE *)(v20 - 1);
      uint64_t v7 = (char *)(v20 - 1);
      char v8 = v21;
    }
  }

  else
  {
    uint64_t v9 = *v4;
    *(_BYTE *)(result + 98) = 0;
    if (*((_BYTE *)v4 + 32))
    {
      unsigned __int8 v10 = 0;
      uint64_t v11 = result + 8;
      do
      {
        *(void *)(v11 + 8LL * v10) = v9;
        *(_BYTE *)(result + 88 + v10) = *(_BYTE *)(v9 + 248) & 0x7F;
        uint64_t v12 = *(unsigned __int8 *)(result + 98);
        unsigned int v13 = *((unsigned __int8 *)v4 + 32);
        if ((_DWORD)v12 + 1 != v13)
        {
          uint64_t v14 = *(void *)(v11 + 8 * v12);
          uint64_t v9 = *(void *)(v14 + 8LL * *(unsigned __int8 *)(v14 + 248) + 120);
        }

        unsigned __int8 v10 = v12 + 1;
        *(_BYTE *)(result + 98) = v10;
      }

      while (v13 > v10);
      uint64_t v15 = v10 - 1LL;
    }

    else
    {
      uint64_t v15 = -1LL;
    }

    uint64_t v7 = (char *)(result + v15 + 88);
    char v8 = *v7;
  }

  *uint64_t v7 = v8 - 1;
  return result;
}

unsigned __int8 *lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::prepareForInsertion( unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result[98];
  int v4 = result;
  uint64_t v5 = result + 8;
  else {
    int v6 = 31;
  }
  if ((*(_BYTE *)(*(void *)&result[8 * v3] + 248LL) & 0x7F) == v6)
  {
    if (!result[98]) {
      goto LABEL_15;
    }
    uint64_t v7 = 0LL;
    unsigned int v8 = 0;
    do
    {
      else {
        int v9 = 31;
      }
      if ((*(_BYTE *)(v5[v7] + 248LL) & 0x7F) != v9) {
        unsigned int v8 = v7;
      }
      ++v7;
    }

    while (v3 != v7);
    if (!v8)
    {
LABEL_15:
      else {
        int v10 = 31;
      }
      if ((*(_BYTE *)(*v5 + 248LL) & 0x7F) == v10)
      {
        uint64_t result = (unsigned __int8 *)lsl::Allocator::aligned_alloc( *(lsl::Lock ***)(*(void *)result + 8LL),  0x100uLL,  0x100uLL);
        uint64_t v11 = **(void **)v4;
        result[248] = 0;
        *(_OWORD *)uint64_t result = 0u;
        *((_OWORD *)result + 1) = 0u;
        *((_OWORD *)result + 2) = 0u;
        *((_OWORD *)result + 3) = 0u;
        *((_OWORD *)result + 4) = 0u;
        *((_OWORD *)result + 5) = 0u;
        *((_OWORD *)result + 6) = 0u;
        *((void *)result + 14) = 0LL;
        *((void *)result + 15) = v11;
        **(void **)int v4 = result;
        if (v4[98] && (uint64_t result = (unsigned __int8 *)memmove(v4 + 89, v4 + 88, v4[98]), v4[98]))
        {
          uint64_t result = (unsigned __int8 *)memmove(v5 + 1, v5, 8LL * v4[98]);
          LOBYTE(v3) = v4[98] + 1;
        }

        else
        {
          LOBYTE(v3) = 1;
        }

        unsigned int v8 = 0;
        v4[88] = 0;
        uint64_t v12 = *(uint64_t **)v4;
        *((void *)v4 + 1) = **(void **)v4;
        ++*((_BYTE *)v12 + 32);
        v4[98] = v3;
      }

      else
      {
        unsigned int v8 = 0;
      }
    }

    if (v8 + 1 < v3)
    {
      unsigned int v13 = v4 + 88;
      uint64_t v14 = v8;
      do
      {
        int v15 = v14;
        uint64_t result = (unsigned __int8 *)lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::splitChild( (char *)v5[v14],  v13[v14],  *(lsl::Lock ***)(*(void *)v4 + 8LL));
        uint64_t v18 = v5[v14];
        uint64_t v19 = v13[v14];
        uint64_t v20 = *(void *)(v18 + 8 * v19 + 120);
        unsigned int v21 = v4[v14 + 89];
        if (v21 > (*(_BYTE *)(v20 + 248) & 0x7Fu))
        {
          unsigned __int8 v22 = v19 + 1;
          v13[v14] = v22;
          v4[v14 + 89] = v21 + (~*(_BYTE *)(v20 + 248) | 0x80);
          uint64_t v23 = v5[v14];
          *(void *)&v4[8 * v14 + 16] = *(void *)(v23 + 8LL * v22 + 120);
        }

        ++v14;
      }

      while (v15 + 2 < v4[98]);
    }
  }

  return result;
}

char *lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::splitChild( char *a1, uint64_t a2, lsl::Lock **this)
{
  if (a1[248] < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild((uint64_t)a1, a2, (uint64_t)this);
  }
  uint64_t v3 = a1[248];
  int v4 = a1;
  uint64_t v5 = a1 + 120;
  uint64_t v6 = (uint64_t)&a1[8 * a2 + 120];
  char v7 = *(_BYTE *)(*(void *)v6 + 248LL);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 15;
  }
  else {
    int v10 = 31;
  }
  if (v9 != v10) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild((uint64_t)a1, a2, (uint64_t)this);
  }
  uint64_t v12 = a2;
  if (v8 >= 0) {
    uint64_t v13 = 7LL;
  }
  else {
    uint64_t v13 = 15LL;
  }
  uint64_t v14 = &a1[8 * a2];
  if ((_DWORD)v3 != (_DWORD)a2)
  {
    a1 = (char *)memmove(&a1[8 * a2 + 8], &a1[8 * a2], 8 * v3 - 8LL * a2);
    a2 = v4[248];
  }

  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)a1, a2, (uint64_t)this);
  }
  int v15 = &v5[8 * a2];
  if (v15 != (char *)v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), (size_t)&v15[-v6]);
    LOBYTE(a2) = v4[248];
  }

  v4[248] = a2 + 1;
  *(void *)uint64_t v14 = *(void *)(*(void *)v6 + 8 * v13);
  uint64_t result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  uint64_t v19 = result;
  char v20 = *(_BYTE *)(*(void *)v6 + 248LL);
  result[248] = v20 & 0x80;
  if (v20 < 0)
  {
    *((void *)result + 30) = 0LL;
    __int128 v21 = 0uLL;
    *((_OWORD *)result + 13) = 0u;
    *((_OWORD *)result + 14) = 0u;
    *((_OWORD *)result + 11) = 0u;
    *((_OWORD *)result + 12) = 0u;
    *((_OWORD *)result + 9) = 0u;
    *((_OWORD *)result + 10) = 0u;
    *((_OWORD *)result + 7) = 0u;
    *((_OWORD *)result + 8) = 0u;
  }

  else
  {
    *((void *)result + 14) = 0LL;
    __int128 v21 = 0uLL;
  }

  *((_OWORD *)result + 5) = v21;
  *((_OWORD *)result + 6) = v21;
  *((_OWORD *)result + 3) = v21;
  *((_OWORD *)result + 4) = v21;
  *((_OWORD *)result + 1) = v21;
  *((_OWORD *)result + 2) = v21;
  *(_OWORD *)uint64_t result = v21;
  if (v4[248] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v17, v18);
  }
  char v22 = v9 + ~(_BYTE)v13;
  *(void *)&v5[8 * v12 + 8] = result;
  if (v22) {
    uint64_t result = (char *)memmove( result,  (const void *)(*(void *)v6 + 8 * v13 + 8),  8LL * (v9 + ~(_BYTE)v13));
  }
  uint64_t v23 = *(void *)v6;
  int v24 = *(char *)(*(void *)v6 + 248LL);
  if ((v24 & 0x80000000) == 0)
  {
    if (v19[248] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v17, v18);
    }
    uint64_t result = (char *)memmove( v19 + 120,  (const void *)(v23 + 8 * v13 + 128),  8LL * (v9 + ~(_BYTE)v13) + 8);
    uint64_t v23 = *(void *)v6;
    LOBYTE(v24) = *(_BYTE *)(*(void *)v6 + 248LL);
  }

  *(_BYTE *)(v23 + 248) = v24 + ~v22;
  char v25 = v19[248] + v22;
  v19[248] = v25;
  if (v25 >= 0) {
    int v26 = 15;
  }
  else {
    int v26 = 31;
  }
  if ((v25 & 0x7F) == v26
    || ((char v27 = *(_BYTE *)(v23 + 248), v28 = v27, v29 = v27 & 0x7F, v28 >= 0) ? (v30 = 15) : (v30 = 31), v29 == v30))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild((uint64_t)result, v17, v18);
  }

  return result;
}

uint64_t lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::const_iterator( uint64_t a1, uint64_t *a2, void *a3)
{
  *(void *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = a1 + 8;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 83) = 0u;
  if (*((_BYTE *)a2 + 32))
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = *a2;
    uint64_t v9 = a1 + 88;
    do
    {
      *(void *)(v4 + 8 * v7) = v8;
      int v10 = std::__lower_bound[abi:nn180100]<std::_ClassicAlgPolicy,std::__wrap_iter<char const**>,std::__wrap_iter<char const**>,char const*,std::__identity,lsl::ConstCharStarCompare>( (void *)v8,  (void *)(v8 + 8LL * (*(_BYTE *)(v8 + 248) & 0x7F)),  a3);
      __int16 v13 = (_WORD)v10 - v8;
      unint64_t v14 = ((unint64_t)v10 - v8) >> 3;
      *(_BYTE *)(v9 + v7) = v14;
      uint64_t v15 = *(void *)(v4 + 8 * v7);
      if ((*(_BYTE *)(v15 + 248) & 0x7F) != v14)
      {
        uint64_t v17 = *(char **)(v15 + (v13 & 0x7F8));
        int v18 = *v17;
        if (v18 < *(char *)*a3)
        {
LABEL_15:
          *(_BYTE *)(a1 + 98) = v7 + 1;
          return a1;
        }

        int v19 = *(unsigned __int8 *)*a3;
        char v20 = (char *)(*a3 + 1LL);
        __int128 v21 = v17 + 1;
        while (v19 && (char)v19 >= (char)v18)
        {
          if ((_BYTE)v18)
          {
            int v22 = *v21++;
            int v18 = v22;
            int v23 = *v20++;
            int v19 = v23;
            if (v18 >= v23) {
              continue;
            }
          }

          goto LABEL_15;
        }
      }

      unint64_t v16 = *((unsigned __int8 *)a2 + 32);
      if ((_DWORD)v7 + 1 != (_DWORD)v16)
      {
        if ((*(_BYTE *)(v15 + 248) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v10, v11, v12);
        }
        uint64_t v8 = *(void *)(v15 + (v13 & 0x7F8) + 120);
      }

      ++v7;
    }

    while (v7 < v16);
    for (*(_BYTE *)(a1 + 98) = v16; (_BYTE)v16; *(_BYTE *)(a1 + 98) = v16)
    {
      if (*(_BYTE *)(v9 + v16 - 1) != (*(_BYTE *)(*(void *)(v4
                                                                                            + 8LL * v16
                                                                                            - 8)
                                                                                + 248LL) & 0x7F))
        break;
      LOBYTE(v16) = v16 - 1;
    }
  }

  return a1;
}

void *std::__lower_bound[abi:nn180100]<std::_ClassicAlgPolicy,std::__wrap_iter<char const**>,std::__wrap_iter<char const**>,char const*,std::__identity,lsl::ConstCharStarCompare>( void *result, void *a2, void *a3)
{
  if (a2 != result)
  {
    unint64_t v3 = a2 - result;
    do
    {
      unint64_t v4 = v3 >> 1;
      uint64_t v5 = &result[v3 >> 1];
      int v6 = *(char *)*v5;
      if (v6 < *(char *)*a3)
      {
LABEL_9:
        uint64_t result = v5 + 1;
        unint64_t v4 = v3 + ~v4;
      }

      else
      {
        unint64_t v7 = (char *)(*v5 + 1LL);
        uint64_t v8 = (char *)(*a3 + 1LL);
        int v9 = *(unsigned __int8 *)*a3;
        while (v9 && (char)v9 >= (char)v6)
        {
          if ((_BYTE)v6)
          {
            int v10 = *v7++;
            int v6 = v10;
            int v11 = *v8++;
            int v9 = v11;
            if (v6 >= v11) {
              continue;
            }
          }

          goto LABEL_9;
        }
      }

      unint64_t v3 = v4;
    }

    while (v4);
  }

  return result;
}

lsl::Allocator **lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr(lsl::Allocator **a1, void *a2)
{
  unint64_t v3 = *a1;
  if (*a1)
  {
    unint64_t v4 = (lsl::Allocator *)*((void *)v3 + 18);
    if (v4) {
      lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v4, a2);
    }
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v3 + 112);
    dyld4::FileRecord::~FileRecord((lsl::Allocator *)((char *)v3 + 8));
    lsl::Allocator::freeObject(*a1, v5);
  }

  return a1;
}

uint64_t lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++( uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(unsigned __int8 *)(result + 98);
  unint64_t v4 = *(uint64_t **)result;
  if (*(_BYTE *)(result + 98))
  {
    int v5 = *((unsigned __int8 *)v4 + 32);
    uint64_t v6 = result + 88;
    ++*(_BYTE *)(result + 88 + (v3 - 1));
    if (v3 == v5)
    {
      uint64_t v7 = *((unsigned __int8 *)v4 + 32);
      if (v7)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(_BYTE *)(v6 + (v7 + ~(_BYTE)i)) != (*(_BYTE *)(*(void *)(result
                                                                                           + 8
                                                                                           + 8LL
                                                                                           * (v7 + ~(_BYTE)i))
                                                                               + 248LL) & 0x7F))
            break;
          *(_BYTE *)(result + 98) = v7 + ~(_BYTE)i;
        }
      }
    }

    else
    {
      int v15 = *(unsigned __int8 *)(result + 98);
      if (v15 != *((unsigned __int8 *)v4 + 32))
      {
        uint64_t v16 = result + 8;
        do
        {
          uint64_t v17 = *(void *)(v16 + 8 * (v15 - 1LL));
          *(void *)(v16 + 8LL * v15) = *(void *)(v17
                                                                    + 8LL
                                                                    * *(unsigned __int8 *)(v6
                                                                                         + v15
                                                                                         - 1LL)
                                                                    + 120);
          *(_BYTE *)(v6 + v15) = 0;
          LOBYTE(v15) = *(_BYTE *)(result + 98) + 1;
          *(_BYTE *)(result + 98) = v15;
        }

        while (*((unsigned __int8 *)v4 + 32) != v15);
      }
    }
  }

  else
  {
    uint64_t v9 = *v4;
    *(_BYTE *)(result + 98) = 0;
    if (*((_BYTE *)v4 + 32))
    {
      unsigned __int8 v10 = 0;
      uint64_t v11 = result + 8;
      do
      {
        *(void *)(v11 + 8LL * v10) = v9;
        *(_BYTE *)(result + 88 + v10) = 0;
        uint64_t v12 = *(unsigned __int8 *)(result + 98);
        unsigned int v13 = *((unsigned __int8 *)v4 + 32);
        if ((_DWORD)v12 + 1 != v13)
        {
          uint64_t v14 = *(void *)(v11 + 8 * v12);
          uint64_t v9 = *(void *)(v14 + 120);
        }

        unsigned __int8 v10 = v12 + 1;
        *(_BYTE *)(result + 98) = v10;
      }

      while (v13 > v10);
    }
  }

  return result;
}

lsl::Allocator **lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(lsl::Allocator **a1, void *a2)
{
  int v3 = *a1;
  if (*a1)
  {
    unint64_t v4 = (lsl::Allocator *)*((void *)v3 + 9);
    if (v4) {
      lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v4, a2);
    }
    lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr((lsl::Allocator **)v3 + 8, a2);
    lsl::UniquePtr<dyld4::Atlas::Bitmap>::~UniquePtr((lsl::Allocator ***)v3 + 7, v5);
    uint64_t v7 = *((void *)v3 + 2);
    if (v7)
    {
      lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::deallocate( v7,  *((lsl::Lock ***)v3 + 3));
      *((void *)v3 + 2) = 0LL;
    }

    *((void *)v3 + 5) = 0LL;
    *((_BYTE *)v3 + 48) = 0;
    lsl::Allocator::freeObject(*a1, v6);
  }

  return a1;
}

void lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::deallocate( uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 248) & 0x80000000) == 0)
  {
    unint64_t v4 = (uint64_t *)(a1 + 120);
    uint64_t v5 = 8LL * *(unsigned __int8 *)(a1 + 248) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::deallocate( v6,  a2);
      v5 -= 8LL;
    }

    while (v5);
  }

  unint64_t v7 = 0LL;
  uint64_t v8 = (lsl::Allocator **)a1;
  do
  {
    uint64_t v9 = lsl::UniquePtr<dyld4::Atlas::Image>::~UniquePtr(v8);
    ++v7;
    else {
      unint64_t v10 = 31LL;
    }
    uint64_t v8 = v9 + 1;
  }

  while (v7 < v10);
  lsl::Allocator::free(a2, (void *)a1);
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(unsigned __int8 *)(result + 143);
  unint64_t v4 = *(uint64_t **)result;
  if (*(_BYTE *)(result + 143))
  {
    int v5 = *((unsigned __int8 *)v4 + 32);
    uint64_t v6 = result + 128;
    ++*(_BYTE *)(result + 128 + (v3 - 1));
    if (v3 == v5)
    {
      uint64_t v7 = *((unsigned __int8 *)v4 + 32);
      if (v7)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(_BYTE *)(v6 + (v7 + ~(_BYTE)i)) != (*(_BYTE *)(*(void *)(result
                                                                                           + 8
                                                                                           + 8LL
                                                                                           * (v7 + ~(_BYTE)i))
                                                                               + 240LL) & 0x7F))
            break;
          *(_BYTE *)(result + 143) = v7 + ~(_BYTE)i;
        }
      }
    }

    else
    {
      int v15 = *(unsigned __int8 *)(result + 143);
      if (v15 != *((unsigned __int8 *)v4 + 32))
      {
        uint64_t v16 = result + 8;
        do
        {
          uint64_t v17 = *(void *)(v16 + 8 * (v15 - 1LL));
          *(void *)(v16 + 8LL * v15) = *(void *)(v17
                                                                    + 8LL
                                                                    * *(unsigned __int8 *)(v6
                                                                                         + v15
                                                                                         - 1LL)
                                                                    + 168);
          *(_BYTE *)(v6 + v15) = 0;
          LOBYTE(v15) = *(_BYTE *)(result + 143) + 1;
          *(_BYTE *)(result + 143) = v15;
        }

        while (*((unsigned __int8 *)v4 + 32) != v15);
      }
    }
  }

  else
  {
    uint64_t v9 = *v4;
    *(_BYTE *)(result + 143) = 0;
    if (*((_BYTE *)v4 + 32))
    {
      unsigned __int8 v10 = 0;
      uint64_t v11 = result + 8;
      do
      {
        *(void *)(v11 + 8LL * v10) = v9;
        *(_BYTE *)(result + 128 + v10) = 0;
        uint64_t v12 = *(unsigned __int8 *)(result + 143);
        unsigned int v13 = *((unsigned __int8 *)v4 + 32);
        if ((_DWORD)v12 + 1 != v13)
        {
          uint64_t v14 = *(void *)(v11 + 8 * v12);
          uint64_t v9 = *(void *)(v14 + 168);
        }

        unsigned __int8 v10 = v12 + 1;
        *(_BYTE *)(result + 143) = v10;
      }

      while (v13 > v10);
    }
  }

  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(unsigned __int8 *)(result + 152);
  unint64_t v4 = *(uint64_t **)result;
  if (*(_BYTE *)(result + 152))
  {
    int v5 = *((unsigned __int8 *)v4 + 32);
    uint64_t v6 = result + 136;
    ++*(_BYTE *)(result + 136 + (v3 - 1));
    if (v3 == v5)
    {
      uint64_t v7 = *((unsigned __int8 *)v4 + 32);
      if (v7)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(_BYTE *)(v6 + (v7 + ~(_BYTE)i)) != (*(_BYTE *)(*(void *)(result
                                                                                           + 8
                                                                                           + 8LL
                                                                                           * (v7 + ~(_BYTE)i))
                                                                               + 248LL) & 0x7F))
            break;
          *(_BYTE *)(result + 152) = v7 + ~(_BYTE)i;
        }
      }
    }

    else
    {
      int v15 = *(unsigned __int8 *)(result + 152);
      if (v15 != *((unsigned __int8 *)v4 + 32))
      {
        uint64_t v16 = result + 8;
        do
        {
          uint64_t v17 = *(void *)(v16 + 8 * (v15 - 1LL));
          *(void *)(v16 + 8LL * v15) = *(void *)(v17
                                                                    + 8LL
                                                                    * *(unsigned __int8 *)(v6
                                                                                         + v15
                                                                                         - 1LL)
                                                                    + 192);
          *(_BYTE *)(v6 + v15) = 0;
          LOBYTE(v15) = *(_BYTE *)(result + 152) + 1;
          *(_BYTE *)(result + 152) = v15;
        }

        while (*((unsigned __int8 *)v4 + 32) != v15);
      }
    }
  }

  else
  {
    uint64_t v9 = *v4;
    *(_BYTE *)(result + 152) = 0;
    if (*((_BYTE *)v4 + 32))
    {
      unsigned __int8 v10 = 0;
      uint64_t v11 = result + 8;
      do
      {
        *(void *)(v11 + 8LL * v10) = v9;
        *(_BYTE *)(result + 136 + v10) = 0;
        uint64_t v12 = *(unsigned __int8 *)(result + 152);
        unsigned int v13 = *((unsigned __int8 *)v4 + 32);
        if ((_DWORD)v12 + 1 != v13)
        {
          uint64_t v14 = *(void *)(v11 + 8 * v12);
          uint64_t v9 = *(void *)(v14 + 192);
        }

        unsigned __int8 v10 = v12 + 1;
        *(_BYTE *)(result + 152) = v10;
      }

      while (v13 > v10);
    }
  }

  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::insert_internal( uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v40 = *MEMORY[0x1895FEE08];
  if (*(void *)a1)
  {
    uint64_t v30 = a1;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v39 = 0LL;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( a2,  (uint64_t)&v30))
    {
      uint64_t v8 = *(unsigned __int8 *)(a2 + 143);
      if (*a3 >= *(_DWORD *)(*(void *)(a2 + 8 + 8 * (v8 - 1)) + 24LL * *(unsigned __int8 *)(a2 + 128 + v8 - 1)))
      {
        char v17 = 0;
        __int128 v25 = *(_OWORD *)(a2 + 88);
        *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
        *(_OWORD *)(a4 + 88) = v25;
        *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
        __int128 v26 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a4 + 24) = v26;
        __int128 v27 = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
        *(void *)a4 = *(void *)a2;
        *(void *)(a4 + 135) = *(void *)(a2 + 135);
        uint64_t v28 = *(void *)(a2 + 120);
        *(_OWORD *)(a4 + 56) = v27;
        uint64_t v29 = *(void *)(a2 + 128);
        *(void *)(a4 + 120) = v28;
        *(void *)(a4 + 128) = v29;
        *(_BYTE *)(a4 + 143) = v8;
        goto LABEL_13;
      }
    }

    uint64_t v30 = a1;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v39 = 0LL;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( a2,  (uint64_t)&v30)
      && *(unsigned __int8 *)(a2 + 143) == *(unsigned __int8 *)(a1 + 32))
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion( (unsigned __int8 *)a2,  v9,  v10);
      uint64_t v11 = (uint64_t *)(a2 + 128);
      uint64_t v12 = *(unsigned __int8 *)(a2 + 143) - 1LL;
      unsigned __int8 v13 = *(_BYTE *)(a2 + 128 + v12);
    }

    else
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--( a2,  v9,  v10);
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion( (unsigned __int8 *)a2,  v20,  v21);
      uint64_t v11 = (uint64_t *)(a2 + 128);
      uint64_t v22 = *(unsigned __int8 *)(a2 + 143) + a2 + 128;
      unsigned __int8 v13 = *(_BYTE *)(v22 - 1) + 1;
      *(_BYTE *)(v22 - 1) = v13;
      uint64_t v12 = *(unsigned __int8 *)(a2 + 143) - 1LL;
    }

    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::insert( *(void *)(a2 + 8 + 8 * v12),  v13,  (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    uint64_t v23 = *(void *)(a2 + 120);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    uint64_t v24 = *v11;
    *(void *)(a4 + 135) = *(uint64_t *)((char *)v11 + 7);
    *(void *)(a4 + 120) = v23;
    *(void *)(a4 + 128) = v24;
    char v19 = *(_BYTE *)(a2 + 143);
    char v17 = 1;
  }

  else
  {
    uint64_t v14 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    uint64_t v15 = 0LL;
    *((_BYTE *)v14 + 240) = 0x80;
    do
    {
      uint64_t v16 = &v14[v15];
      *(_DWORD *)uint64_t v16 = 0;
      v16[1] = 0LL;
      void v16[2] = 0LL;
      v15 += 3LL;
    }

    while (v15 != 30);
    *(void *)a1 = v14;
    char v17 = 1;
    *(_BYTE *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v14;
    *(_BYTE *)(a2 + 143) = 1;
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::insert( (uint64_t)v14,  0LL,  (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(void *)(a4 + 135) = *(void *)(a2 + 135);
    uint64_t v18 = *(void *)(a2 + 128);
    *(void *)(a4 + 120) = *(void *)(a2 + 120);
    *(void *)(a4 + 128) = v18;
    char v19 = *(_BYTE *)(a2 + 143);
  }

  *(_BYTE *)(a4 + 143) = v19;
LABEL_13:
  *(_BYTE *)(a4 + 144) = v17;
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::insert( uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = *(_BYTE *)(a1 + 240);
  char v4 = v3;
  uint64_t v5 = v3 & 0x7F;
  if (v3 >= 0) {
    int v6 = 7;
  }
  else {
    int v6 = 10;
  }
  if ((_DWORD)v5 == v6) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert(a1, a2, a3);
  }
  if (v6 == (_DWORD)a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert(a1, a2, a3);
  }
  if ((_DWORD)v5 != (_DWORD)a2)
  {
    uint64_t v7 = 3 * v5;
    uint64_t v8 = a1 + 8 * v7;
    uint64_t v9 = 24LL * a2 - 8 * v7;
    uint64_t v10 = v8;
    do
    {
      int v11 = *(_DWORD *)(v10 - 24);
      v10 -= 24LL;
      *(_DWORD *)uint64_t v8 = v11;
      *(_OWORD *)(v8 + 8) = *(_OWORD *)(v8 - 16);
      uint64_t v8 = v10;
      v9 += 24LL;
    }

    while (v9);
    char v4 = *(_BYTE *)(a1 + 240);
  }

  *(_BYTE *)(a1 + 240) = v4 + 1;
  *(_DWORD *)(a1 + 24LL * a2) = *(_DWORD *)a3;
  __n128 result = *(__n128 *)(a3 + 8);
  *(__n128 *)(a1 + 24LL * a2 + 8) = result;
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--( uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int8 *)(result + 143);
  char v4 = *(uint64_t **)result;
  if (*(_BYTE *)(result + 143))
  {
    if ((_DWORD)v3 == *((unsigned __int8 *)v4 + 32))
    {
      uint64_t v5 = result + 128;
      uint64_t v6 = v3 - 1;
      uint64_t v7 = (char *)(result + 128 + v3 - 1);
      char v8 = *v7;
      if (!*(_BYTE *)(result + 128 + (v3 - 1)))
      {
        if (!*v7)
        {
          do
          {
            LODWORD(v3) = v3 - 1;
            *(_BYTE *)(result + 143) = v3;
            uint64_t v6 = v3 - 1LL;
            char v8 = *(_BYTE *)(v5 + v6);
          }

          while (!v8);
        }

        uint64_t v7 = (char *)(v5 + v6);
      }
    }

    else
    {
      uint64_t v16 = result + 8;
      uint64_t v17 = result + 128;
      do
      {
        uint64_t v18 = *(void *)(v16 + 8 * (v3 - 1LL));
        uint64_t v19 = *(void *)(v18 + 8LL * *(unsigned __int8 *)(v17 + v3 - 1LL) + 168);
        *(void *)(v16 + 8LL * v3) = v19;
        *(_BYTE *)(v17 + v3) = *(_BYTE *)(v19 + 240) & 0x7F;
        LOBYTE(v3) = *(_BYTE *)(result + 143) + 1;
        *(_BYTE *)(result + 143) = v3;
      }

      while (*((unsigned __int8 *)v4 + 32) != v3);
      uint64_t v20 = v17 + v3;
      char v21 = *(_BYTE *)(v20 - 1);
      uint64_t v7 = (char *)(v20 - 1);
      char v8 = v21;
    }
  }

  else
  {
    uint64_t v9 = *v4;
    *(_BYTE *)(result + 143) = 0;
    if (*((_BYTE *)v4 + 32))
    {
      unsigned __int8 v10 = 0;
      uint64_t v11 = result + 8;
      do
      {
        *(void *)(v11 + 8LL * v10) = v9;
        *(_BYTE *)(result + 128 + v10) = *(_BYTE *)(v9 + 240) & 0x7F;
        uint64_t v12 = *(unsigned __int8 *)(result + 143);
        unsigned int v13 = *((unsigned __int8 *)v4 + 32);
        if ((_DWORD)v12 + 1 != v13)
        {
          uint64_t v14 = *(void *)(v11 + 8 * v12);
          uint64_t v9 = *(void *)(v14 + 8LL * *(unsigned __int8 *)(v14 + 240) + 168);
        }

        unsigned __int8 v10 = v12 + 1;
        *(_BYTE *)(result + 143) = v10;
      }

      while (v13 > v10);
      uint64_t v15 = v10 - 1LL;
    }

    else
    {
      uint64_t v15 = -1LL;
    }

    uint64_t v7 = (char *)(result + v15 + 128);
    char v8 = *v7;
  }

  *uint64_t v7 = v8 - 1;
  return result;
}

unsigned __int8 *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion( unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result[143];
  char v4 = result;
  uint64_t v5 = result + 8;
  else {
    int v6 = 10;
  }
  if ((*(_BYTE *)(*(void *)&result[8 * v3] + 240LL) & 0x7F) == v6)
  {
    if (!result[143]) {
      goto LABEL_15;
    }
    uint64_t v7 = 0LL;
    unsigned int v8 = 0;
    do
    {
      else {
        int v9 = 10;
      }
      if ((*(_BYTE *)(v5[v7] + 240LL) & 0x7F) != v9) {
        unsigned int v8 = v7;
      }
      ++v7;
    }

    while (v3 != v7);
    if (!v8)
    {
LABEL_15:
      else {
        int v10 = 10;
      }
      if ((*(_BYTE *)(*v5 + 240LL) & 0x7F) == v10)
      {
        __n128 result = (unsigned __int8 *)lsl::Allocator::aligned_alloc( *(lsl::Lock ***)(*(void *)result + 8LL),  0x100uLL,  0x100uLL);
        uint64_t v11 = 0LL;
        uint64_t v12 = **(void **)v4;
        result[240] = 0;
        do
        {
          unsigned int v13 = &result[v11];
          *(_DWORD *)unsigned int v13 = 0;
          *((void *)v13 + 1) = 0LL;
          *((void *)v13 + 2) = 0LL;
          v11 += 24LL;
        }

        while (v11 != 168);
        *((void *)result + 21) = v12;
        **(void **)char v4 = result;
        if (v4[143] && (__n128 result = (unsigned __int8 *)memmove(v4 + 129, v4 + 128, v4[143]), v4[143]))
        {
          __n128 result = (unsigned __int8 *)memmove(v5 + 1, v5, 8LL * v4[143]);
          LOBYTE(v3) = v4[143] + 1;
        }

        else
        {
          LOBYTE(v3) = 1;
        }

        unsigned int v8 = 0;
        v4[128] = 0;
        uint64_t v14 = *(uint64_t **)v4;
        *((void *)v4 + 1) = **(void **)v4;
        ++*((_BYTE *)v14 + 32);
        v4[143] = v3;
      }

      else
      {
        unsigned int v8 = 0;
      }
    }

    if (v8 + 1 < v3)
    {
      uint64_t v15 = v4 + 128;
      uint64_t v16 = v8;
      do
      {
        int v17 = v16;
        __n128 result = (unsigned __int8 *)lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::splitChild( v5[v16],  v15[v16],  *(lsl::Lock ***)(*(void *)v4 + 8LL));
        uint64_t v20 = v5[v16];
        uint64_t v21 = v15[v16];
        uint64_t v22 = *(void *)(v20 + 8 * v21 + 168);
        unsigned int v23 = v4[v16 + 129];
        if (v23 > (*(_BYTE *)(v22 + 240) & 0x7Fu))
        {
          unsigned __int8 v24 = v21 + 1;
          v15[v16] = v24;
          v4[v16 + 129] = v23 + (~*(_BYTE *)(v22 + 240) | 0x80);
          uint64_t v25 = v5[v16];
          *(void *)&v4[8 * v16 + 16] = *(void *)(v25 + 8LL * v24 + 168);
        }

        ++v16;
      }

      while (v17 + 2 < v4[143]);
    }
  }

  return result;
}

char *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::splitChild( uint64_t a1, uint64_t a2, lsl::Lock **this)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 240);
  uint64_t v5 = a1 + 168;
  uint64_t v6 = a1 + 168 + 8LL * a2;
  char v7 = *(_BYTE *)(*(void *)v6 + 240LL);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 7;
  }
  else {
    int v10 = 10;
  }
  if (v9 != v10) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild(a1, a2, (uint64_t)this);
  }
  uint64_t v12 = a2;
  if (v8 >= 0) {
    uint64_t v13 = 3LL;
  }
  else {
    uint64_t v13 = 5LL;
  }
  if ((_DWORD)v3 != (_DWORD)a2)
  {
    uint64_t v14 = 3 * v3;
    uint64_t v15 = a1 + 24 * v3;
    uint64_t v16 = 24LL * a2 - 8 * v14;
    uint64_t v17 = v15;
    do
    {
      int v18 = *(_DWORD *)(v17 - 24);
      v17 -= 24LL;
      *(_DWORD *)uint64_t v15 = v18;
      *(_OWORD *)(v15 + 8) = *(_OWORD *)(v15 - 16);
      uint64_t v15 = v17;
      v16 += 24LL;
    }

    while (v16);
    a2 = *(unsigned __int8 *)(a1 + 240);
  }

  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(a1, a2, (uint64_t)this);
  }
  uint64_t v19 = v5 + 8LL * a2;
  if (v19 != v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v19 - v6);
    LOBYTE(a2) = *(_BYTE *)(a1 + 240);
  }

  *(_BYTE *)(a1 + 240) = a2 + 1;
  uint64_t v20 = *(void *)v6 + 24LL * v13;
  *(_DWORD *)(a1 + 24LL * v12) = *(_DWORD *)v20;
  *(_OWORD *)(a1 + 24LL * v12 + 8) = *(_OWORD *)(v20 + 8);
  __n128 result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  unsigned __int8 v24 = result;
  char v25 = *(_BYTE *)(*(void *)v6 + 240LL);
  result[240] = v25 & 0x80;
  if (v25 < 0)
  {
    for (uint64_t i = 0LL; i != 240; i += 24LL)
    {
      uint64_t v29 = &result[i];
      *(_DWORD *)uint64_t v29 = 0;
      *((void *)v29 + 1) = 0LL;
      *((void *)v29 + 2) = 0LL;
    }
  }

  else
  {
    for (uint64_t j = 0LL; j != 168; j += 24LL)
    {
      __int128 v27 = &result[j];
      *(_DWORD *)__int128 v27 = 0;
      *((void *)v27 + 1) = 0LL;
      *((void *)v27 + 2) = 0LL;
    }
  }

  unsigned __int8 v30 = v9 + ~(_BYTE)v13;
  __int128 v31 = (uint64_t *)(v5 + 8 * v12);
  v31[1] = (uint64_t)result;
  uint64_t v32 = *v31;
  if (v30)
  {
    uint64_t v33 = v32 + 24LL * v13;
    uint64_t v34 = v33 + 24LL * v30 + 24;
    uint64_t v35 = v33 + 24;
    __int128 v36 = result;
    do
    {
      *(_DWORD *)__int128 v36 = *(_DWORD *)v35;
      *(_OWORD *)(v36 + 8) = *(_OWORD *)(v35 + 8);
      v35 += 24LL;
      v36 += 24;
    }

    while (v35 != v34);
    uint64_t v32 = *(void *)v6;
  }

  int v37 = *(char *)(v32 + 240);
  if ((v37 & 0x80000000) == 0)
  {
    if (result[240] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v22, v23);
    }
    __n128 result = (char *)memmove(result + 168, (const void *)(v32 + 8 * v13 + 176), 8LL * v30 + 8);
    uint64_t v32 = *(void *)v6;
    LOBYTE(v37) = *(_BYTE *)(*(void *)v6 + 240LL);
  }

  *(_BYTE *)(v32 + 240) = v37 + ~v30;
  char v38 = v24[240] + v30;
  v24[240] = v38;
  if (v38 >= 0) {
    int v39 = 7;
  }
  else {
    int v39 = 10;
  }
  if ((v38 & 0x7F) == v39
    || ((v40 = *(_BYTE *)(v32 + 240), v41 = v40, int v42 = v40 & 0x7F, v41 >= 0) ? (v43 = 7) : (v43 = 10), v42 == v43))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild((uint64_t)result, v22, v23);
  }

  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator( uint64_t result, uint64_t a2, unsigned int *a3)
{
  *(void *)__n128 result = a2;
  *(_OWORD *)(result + 8) = 0u;
  uint64_t v3 = result + 8;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 72) = 0u;
  *(_OWORD *)(result + 88) = 0u;
  *(_OWORD *)(result + 104) = 0u;
  *(_OWORD *)(result + 120) = 0u;
  *(void *)(result + 136) = 0LL;
  if (*(_BYTE *)(a2 + 32))
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = *(void *)a2;
    uint64_t v6 = result + 128;
    do
    {
      *(void *)(v3 + 8 * v4) = v5;
      unint64_t v7 = *(_BYTE *)(v5 + 240) & 0x7F;
      if ((*(_BYTE *)(v5 + 240) & 0x7F) != 0)
      {
        int v8 = (_DWORD *)v5;
        do
        {
          unint64_t v9 = v7 >> 1;
          int v10 = &v8[6 * (v7 >> 1)];
          unsigned int v12 = *v10;
          uint64_t v11 = v10 + 6;
          v7 += ~(v7 >> 1);
          if (v12 < *a3) {
            int v8 = v11;
          }
          else {
            unint64_t v7 = v9;
          }
        }

        while (v7);
      }

      else
      {
        int v8 = (_DWORD *)(v5 + 24LL * (*(_BYTE *)(v5 + 240) & 0x7F));
      }

      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v5) >> 3);
      *(_BYTE *)(v6 + v4) = v13;
      uint64_t v14 = *(void *)(v3 + 8 * v4);
      if ((*(_BYTE *)(v14 + 240) & 0x7F) != v13
        && *(_DWORD *)(v14 + 24LL * v13) < *a3)
      {
        *(_BYTE *)(result + 143) = v4 + 1;
        return result;
      }

      unint64_t v15 = *(unsigned __int8 *)(a2 + 32);
      if ((_DWORD)v4 + 1 != (_DWORD)v15)
      {
        if ((*(_BYTE *)(v14 + 240) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(result, a2, (uint64_t)a3);
        }
        uint64_t v5 = *(void *)(v14 + 8LL * v13 + 168);
      }

      ++v4;
    }

    while (v4 < v15);
    for (*(_BYTE *)(result + 143) = v15; (_BYTE)v15; *(_BYTE *)(result + 143) = v15)
    {
      if (*(_BYTE *)(v6 + v15 - 1) != (*(_BYTE *)(*(void *)(result
                                                                                            + 8LL * v15)
                                                                                + 240LL) & 0x7F))
        break;
      LOBYTE(v15) = v15 - 1;
    }
  }

  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::insert_internal( uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v37 = *MEMORY[0x1895FEE08];
  if (*(void *)a1)
  {
    uint64_t v26 = a1;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    char v36 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( a2,  (uint64_t)&v26))
    {
      uint64_t v8 = *(unsigned __int8 *)(a2 + 152);
      if (*a3 >= *(_DWORD *)(*(void *)(a2 + 8 + 8 * (v8 - 1)) + 32LL * *(unsigned __int8 *)(a2 + 136 + v8 - 1)))
      {
        char v17 = 0;
        __int128 v22 = *(_OWORD *)(a2 + 88);
        *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
        *(_OWORD *)(a4 + 88) = v22;
        __int128 v23 = *(_OWORD *)(a2 + 120);
        *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
        *(_OWORD *)(a4 + 120) = v23;
        __int128 v24 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a4 + 24) = v24;
        __int128 v25 = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
        *(void *)a4 = *(void *)a2;
        *(_OWORD *)(a4 + 56) = v25;
        *(_OWORD *)(a4 + 136) = *(_OWORD *)(a2 + 136);
        *(_BYTE *)(a4 + 152) = v8;
        goto LABEL_13;
      }
    }

    uint64_t v26 = a1;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    char v36 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( a2,  (uint64_t)&v26)
      && *(unsigned __int8 *)(a2 + 152) == *(unsigned __int8 *)(a1 + 32))
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion( (unsigned __int8 *)a2,  v9,  v10);
      uint64_t v11 = (_OWORD *)(a2 + 136);
      uint64_t v12 = *(unsigned __int8 *)(a2 + 152) - 1LL;
      unsigned __int8 v13 = *(_BYTE *)(a2 + 136 + v12);
    }

    else
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--( a2,  v9,  v10);
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion( (unsigned __int8 *)a2,  v19,  v20);
      uint64_t v11 = (_OWORD *)(a2 + 136);
      uint64_t v21 = *(unsigned __int8 *)(a2 + 152) + a2 + 136;
      unsigned __int8 v13 = *(_BYTE *)(v21 - 1) + 1;
      *(_BYTE *)(v21 - 1) = v13;
      uint64_t v12 = *(unsigned __int8 *)(a2 + 152) - 1LL;
    }

    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::insert( *(void *)(a2 + 8 + 8 * v12),  v13,  (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a4 + 120) = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a4 + 136) = *v11;
    char v18 = *(_BYTE *)(a2 + 152);
    char v17 = 1;
  }

  else
  {
    uint64_t v14 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    uint64_t v15 = 0LL;
    *((_BYTE *)v14 + 248) = 0x80;
    do
    {
      uint64_t v16 = &v14[v15];
      *(_DWORD *)uint64_t v16 = 0;
      void v16[2] = 0LL;
      v16[3] = 0LL;
      v16[1] = 0LL;
      v15 += 4LL;
    }

    while (v15 != 28);
    *(void *)a1 = v14;
    char v17 = 1;
    *(_BYTE *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v14;
    *(_BYTE *)(a2 + 152) = 1;
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::insert( (uint64_t)v14,  0LL,  (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a4 + 120) = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a4 + 136) = *(_OWORD *)(a2 + 136);
    char v18 = *(_BYTE *)(a2 + 152);
  }

  *(_BYTE *)(a4 + 152) = v18;
LABEL_13:
  *(_BYTE *)(a4 + 160) = v17;
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::insert( uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = *(_BYTE *)(a1 + 248);
  LOBYTE(v4) = v3;
  uint64_t v5 = v3 & 0x7F;
  if (v3 >= 0) {
    int v6 = 6;
  }
  else {
    int v6 = 7;
  }
  if ((_DWORD)v5 == v6) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert(a1, a2, a3);
  }
  uint64_t v7 = a1 + 32LL * a2;
  if ((_DWORD)v5 != (_DWORD)a2)
  {
    uint64_t v8 = a1 + 32 * v5;
    uint64_t v9 = 32LL * a2 - 32 * v5;
    uint64_t v10 = v8;
    do
    {
      int v11 = *(_DWORD *)(v10 - 32);
      v10 -= 32LL;
      *(_DWORD *)uint64_t v8 = v11;
      *(_OWORD *)(v8 + 8) = *(_OWORD *)(v8 - 24);
      *(void *)(v8 + 24) = *(void *)(v8 - 8);
      uint64_t v8 = v10;
      v9 += 32LL;
    }

    while (v9);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 248);
  }

  *(_BYTE *)(a1 + 248) = v4 + 1;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)a3;
  __n128 result = *(__n128 *)(a3 + 8);
  *(void *)(v7 + 24) = *(void *)(a3 + 24);
  *(__n128 *)(v7 + 8) = result;
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--( uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int8 *)(result + 152);
  uint64_t v4 = *(uint64_t **)result;
  if (*(_BYTE *)(result + 152))
  {
    if ((_DWORD)v3 == *((unsigned __int8 *)v4 + 32))
    {
      uint64_t v5 = result + 136;
      uint64_t v6 = v3 - 1;
      uint64_t v7 = (char *)(result + 136 + v3 - 1);
      char v8 = *v7;
      if (!*(_BYTE *)(result + 136 + (v3 - 1)))
      {
        if (!*v7)
        {
          do
          {
            LODWORD(v3) = v3 - 1;
            *(_BYTE *)(result + 152) = v3;
            uint64_t v6 = v3 - 1LL;
            char v8 = *(_BYTE *)(v5 + v6);
          }

          while (!v8);
        }

        uint64_t v7 = (char *)(v5 + v6);
      }
    }

    else
    {
      uint64_t v16 = result + 8;
      uint64_t v17 = result + 136;
      do
      {
        uint64_t v18 = *(void *)(v16 + 8 * (v3 - 1LL));
        uint64_t v19 = *(void *)(v18 + 8LL * *(unsigned __int8 *)(v17 + v3 - 1LL) + 192);
        *(void *)(v16 + 8LL * v3) = v19;
        *(_BYTE *)(v17 + v3) = *(_BYTE *)(v19 + 248) & 0x7F;
        LOBYTE(v3) = *(_BYTE *)(result + 152) + 1;
        *(_BYTE *)(result + 152) = v3;
      }

      while (*((unsigned __int8 *)v4 + 32) != v3);
      uint64_t v20 = v17 + v3;
      char v21 = *(_BYTE *)(v20 - 1);
      uint64_t v7 = (char *)(v20 - 1);
      char v8 = v21;
    }
  }

  else
  {
    uint64_t v9 = *v4;
    *(_BYTE *)(result + 152) = 0;
    if (*((_BYTE *)v4 + 32))
    {
      unsigned __int8 v10 = 0;
      uint64_t v11 = result + 8;
      do
      {
        *(void *)(v11 + 8LL * v10) = v9;
        *(_BYTE *)(result + 136 + v10) = *(_BYTE *)(v9 + 248) & 0x7F;
        uint64_t v12 = *(unsigned __int8 *)(result + 152);
        unsigned int v13 = *((unsigned __int8 *)v4 + 32);
        if ((_DWORD)v12 + 1 != v13)
        {
          uint64_t v14 = *(void *)(v11 + 8 * v12);
          uint64_t v9 = *(void *)(v14 + 8LL * *(unsigned __int8 *)(v14 + 248) + 192);
        }

        unsigned __int8 v10 = v12 + 1;
        *(_BYTE *)(result + 152) = v10;
      }

      while (v13 > v10);
      uint64_t v15 = v10 - 1LL;
    }

    else
    {
      uint64_t v15 = -1LL;
    }

    uint64_t v7 = (char *)(result + v15 + 136);
    char v8 = *v7;
  }

  *uint64_t v7 = v8 - 1;
  return result;
}

unsigned __int8 *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion( unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result[152];
  uint64_t v4 = result;
  uint64_t v5 = result + 8;
  else {
    int v6 = 7;
  }
  if ((*(_BYTE *)(*(void *)&result[8 * v3] + 248LL) & 0x7F) == v6)
  {
    if (!result[152]) {
      goto LABEL_15;
    }
    uint64_t v7 = 0LL;
    unsigned int v8 = 0;
    do
    {
      else {
        int v9 = 7;
      }
      if ((*(_BYTE *)(v5[v7] + 248LL) & 0x7F) != v9) {
        unsigned int v8 = v7;
      }
      ++v7;
    }

    while (v3 != v7);
    if (!v8)
    {
LABEL_15:
      else {
        int v10 = 7;
      }
      if ((*(_BYTE *)(*v5 + 248LL) & 0x7F) == v10)
      {
        uint64_t v11 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(*(void *)result + 8LL), 0x100uLL, 0x100uLL);
        __n128 result = (unsigned __int8 *)lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::NodeCore( (uint64_t)v11,  **(void **)v4,  v12);
        **(void **)uint64_t v4 = result;
        if (v4[152] && (__n128 result = (unsigned __int8 *)memmove(v4 + 137, v4 + 136, v4[152]), v4[152]))
        {
          __n128 result = (unsigned __int8 *)memmove(v5 + 1, v5, 8LL * v4[152]);
          LOBYTE(v3) = v4[152] + 1;
        }

        else
        {
          LOBYTE(v3) = 1;
        }

        unsigned int v8 = 0;
        v4[136] = 0;
        unsigned int v13 = *(uint64_t **)v4;
        *((void *)v4 + 1) = **(void **)v4;
        ++*((_BYTE *)v13 + 32);
        v4[152] = v3;
      }

      else
      {
        unsigned int v8 = 0;
      }
    }

    if (v8 + 1 < v3)
    {
      uint64_t v14 = v4 + 136;
      uint64_t v15 = v8;
      do
      {
        int v16 = v15;
        __n128 result = (unsigned __int8 *)lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::splitChild( v5[v15],  v14[v15],  *(lsl::Lock ***)(*(void *)v4 + 8LL));
        uint64_t v19 = v5[v15];
        uint64_t v20 = v14[v15];
        uint64_t v21 = *(void *)(v19 + 8 * v20 + 192);
        unsigned int v22 = v4[v15 + 137];
        if (v22 > (*(_BYTE *)(v21 + 248) & 0x7Fu))
        {
          unsigned __int8 v23 = v20 + 1;
          v14[v15] = v23;
          v4[v15 + 137] = v22 + (~*(_BYTE *)(v21 + 248) | 0x80);
          uint64_t v24 = v5[v15];
          *(void *)&v4[8 * v15 + 16] = *(void *)(v24 + 8LL * v23 + 192);
        }

        ++v15;
      }

      while (v16 + 2 < v4[152]);
    }
  }

  return result;
}

char *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::splitChild( uint64_t a1, uint64_t a2, lsl::Lock **this)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 248);
  uint64_t v5 = a1 + 192;
  uint64_t v6 = a1 + 192 + 8LL * a2;
  char v7 = *(_BYTE *)(*(void *)v6 + 248LL);
  int v8 = v7 & 0x7F;
  if (v7 >= 0) {
    int v9 = 6;
  }
  else {
    int v9 = 7;
  }
  if (v8 != v9) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild(a1, a2, (uint64_t)this);
  }
  uint64_t v11 = a2;
  if ((_DWORD)v3 != (_DWORD)a2)
  {
    uint64_t v12 = a1 + 32 * v3;
    uint64_t v13 = 32LL * a2 - 32 * v3;
    uint64_t v14 = v12;
    do
    {
      int v15 = *(_DWORD *)(v14 - 32);
      v14 -= 32LL;
      *(_DWORD *)uint64_t v12 = v15;
      *(_OWORD *)(v12 + 8) = *(_OWORD *)(v12 - 24);
      *(void *)(v12 + 24) = *(void *)(v12 - 8);
      uint64_t v12 = v14;
      v13 += 32LL;
    }

    while (v13);
    a2 = *(unsigned __int8 *)(a1 + 248);
  }

  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(a1, a2, (uint64_t)this);
  }
  uint64_t v16 = v5 + 8LL * a2;
  if (v16 != v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v16 - v6);
    LOBYTE(a2) = *(_BYTE *)(a1 + 248);
  }

  *(_BYTE *)(a1 + 248) = a2 + 1;
  uint64_t v17 = *(void *)v6;
  *(_DWORD *)(a1 + 32 * v11) = *(_DWORD *)(*(void *)v6 + 96LL);
  uint64_t v18 = a1 + 32 * v11;
  __int128 v19 = *(_OWORD *)(v17 + 104);
  *(void *)(v18 + 24) = *(void *)(v17 + 120);
  *(_OWORD *)(v18 + 8) = v19;
  __n128 result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  unsigned __int8 v23 = result;
  char v24 = *(_BYTE *)(*(void *)v6 + 248LL);
  result[248] = v24 & 0x80;
  if (v24 < 0)
  {
    for (uint64_t i = 0LL; i != 224; i += 32LL)
    {
      __int128 v28 = &result[i];
      *(_DWORD *)__int128 v28 = 0;
      *((void *)v28 + 2) = 0LL;
      *((void *)v28 + 3) = 0LL;
      *((void *)v28 + 1) = 0LL;
    }
  }

  else
  {
    for (uint64_t j = 0LL; j != 192; j += 32LL)
    {
      uint64_t v26 = &result[j];
      *(_DWORD *)uint64_t v26 = 0;
      *((void *)v26 + 2) = 0LL;
      *((void *)v26 + 3) = 0LL;
      *((void *)v26 + 1) = 0LL;
    }
  }

  char v29 = v8 - 4;
  __int128 v30 = (uint64_t *)(v5 + 8 * v11);
  v30[1] = (uint64_t)result;
  uint64_t v31 = *v30;
  uint64_t v32 = (v8 - 4);
  if ((_BYTE)v8 != 4)
  {
    uint64_t v33 = v31 + 32 * v32 + 128;
    uint64_t v34 = v31 + 128;
    __int128 v35 = result;
    do
    {
      *(_DWORD *)__int128 v35 = *(_DWORD *)v34;
      __int128 v36 = *(_OWORD *)(v34 + 8);
      *((void *)v35 + 3) = *(void *)(v34 + 24);
      *(_OWORD *)(v35 + 8) = v36;
      v34 += 32LL;
      v35 += 32;
    }

    while (v34 != v33);
    uint64_t v31 = *(void *)v6;
  }

  int v37 = *(char *)(v31 + 248);
  if ((v37 & 0x80000000) == 0)
  {
    if (result[248] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, (uint64_t)v21, v22);
    }
    uint64_t v21 = (const void *)(v31 + 224);
    uint64_t v38 = v31 + 8 * v32 + 232;
    size_t v22 = v38 - (v31 + 224);
    if (v38 != v31 + 224)
    {
      __n128 result = (char *)memmove(result + 192, v21, v22);
      uint64_t v31 = *(void *)v6;
      LOBYTE(v37) = *(_BYTE *)(*(void *)v6 + 248LL);
    }
  }

  *(_BYTE *)(v31 + 248) = v37 + ~v29;
  char v39 = v23[248] + v29;
  v23[248] = v39;
  if (v39 >= 0) {
    int v40 = 6;
  }
  else {
    int v40 = 7;
  }
  if ((v39 & 0x7F) == v40
    || ((v41 = *(_BYTE *)(v31 + 248), int v42 = v41, v43 = v41 & 0x7F, v42 >= 0) ? (v44 = 6) : (v44 = 7), v43 == v44))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild((uint64_t)result, (uint64_t)v21, v22);
  }

  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::NodeCore( uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0LL;
  *(_BYTE *)(result + 248) = 0;
  do
  {
    uint64_t v4 = result + v3;
    *(_DWORD *)uint64_t v4 = 0;
    *(void *)(v4 + 16) = 0LL;
    *(void *)(v4 + 24) = 0LL;
    *(void *)(v4 + 8) = 0LL;
    v3 += 32LL;
  }

  while (v3 != 192);
  *(void *)(result + 192) = a2;
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator( uint64_t result, uint64_t a2, unsigned int *a3)
{
  *(void *)__n128 result = a2;
  *(_OWORD *)(result + 8) = 0u;
  uint64_t v3 = result + 8;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 72) = 0u;
  *(_OWORD *)(result + 88) = 0u;
  *(_OWORD *)(result + 104) = 0u;
  *(_OWORD *)(result + 120) = 0u;
  *(_OWORD *)(result + 136) = 0u;
  *(_BYTE *)(result + 152) = 0;
  if (*(_BYTE *)(a2 + 32))
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = *(void *)a2;
    uint64_t v6 = result + 136;
    do
    {
      *(void *)(v3 + 8 * v4) = v5;
      unint64_t v7 = *(_BYTE *)(v5 + 248) & 0x7F;
      if ((*(_BYTE *)(v5 + 248) & 0x7F) != 0)
      {
        int v8 = (_DWORD *)v5;
        do
        {
          unint64_t v9 = v7 >> 1;
          int v10 = &v8[8 * (v7 >> 1)];
          unsigned int v12 = *v10;
          uint64_t v11 = v10 + 8;
          v7 += ~(v7 >> 1);
          if (v12 < *a3) {
            int v8 = v11;
          }
          else {
            unint64_t v7 = v9;
          }
        }

        while (v7);
      }

      else
      {
        int v8 = (_DWORD *)(v5 + 32 * v7);
      }

      __int16 v13 = (_WORD)v8 - v5;
      unint64_t v14 = ((unint64_t)v8 - v5) >> 5;
      *(_BYTE *)(v6 + v4) = v14;
      uint64_t v15 = *(void *)(v3 + 8 * v4);
      if ((*(_BYTE *)(v15 + 248) & 0x7F) != v14 && *(_DWORD *)(v15 + (v13 & 0x1FE0)) < *a3)
      {
        *(_BYTE *)(result + 152) = v4 + 1;
        return result;
      }

      unint64_t v16 = *(unsigned __int8 *)(a2 + 32);
      if ((_DWORD)v4 + 1 != (_DWORD)v16)
      {
        if ((*(_BYTE *)(v15 + 248) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(result, a2, (uint64_t)a3);
        }
        uint64_t v5 = *(void *)(v15 + 8LL * v14 + 192);
      }

      ++v4;
    }

    while (v4 < v16);
    for (*(_BYTE *)(result + 152) = v16; (_BYTE)v16; *(_BYTE *)(result + 152) = v16)
    {
      if (*(_BYTE *)(v6 + v16 - 1) != (*(_BYTE *)(*(void *)(result
                                                                                            + 8LL * v16)
                                                                                + 248LL) & 0x7F))
        break;
      LOBYTE(v16) = v16 - 1;
    }
  }

  return result;
}

double lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::find@<D0>( uint64_t a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = *MEMORY[0x1895FEE08];
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator( (uint64_t)&v23,  a1,  a2);
  uint64_t v13 = a1;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v22 = 0LL;
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v23,  (uint64_t)&v13)
    && (unsigned __int8 v6 = v32, *a2 >= *(_DWORD *)(*((void *)v24 + v32 - 1) + 24LL * v31[v32 - 1])))
  {
    __int128 v8 = v28;
    *(_OWORD *)(a3 + 72) = v27;
    *(_OWORD *)(a3 + 88) = v8;
    *(_OWORD *)(a3 + 104) = v29;
    __int128 v9 = v24[1];
    *(_OWORD *)(a3 + 8) = v24[0];
    *(_OWORD *)(a3 + 24) = v9;
    double result = *(double *)&v25;
    __int128 v10 = v26;
    *(_OWORD *)(a3 + 40) = v25;
    *(void *)a3 = v23;
    uint64_t v11 = v30;
    *(_OWORD *)(a3 + 56) = v10;
    *(void *)(a3 + 135) = *(void *)&v31[7];
    uint64_t v12 = *(void *)v31;
    *(void *)(a3 + 120) = v11;
    *(void *)(a3 + 128) = v12;
    *(_BYTE *)(a3 + 143) = v6;
  }

  else
  {
    *(void *)a3 = a1;
    double result = 0.0;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(_OWORD *)(a3 + 120) = 0u;
    *(void *)(a3 + 136) = 0LL;
  }

  return result;
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::erase@<Q0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(unsigned __int8 *)(a2 + 143);
  int v8 = *(unsigned __int8 *)(a1 + 32);
  unsigned int v9 = v7;
  if ((_DWORD)v7 != v8)
  {
    uint64_t v10 = *(void *)(a2 + 8 + 8 * (v7 - 1)) + 24LL * *(unsigned __int8 *)(a2 + 128 + v7 - 1);
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( a2,  a2,  a3);
    int v12 = *(_DWORD *)v10;
    *(_DWORD *)uint64_t v10 = *(_DWORD *)v11;
    *(_DWORD *)uint64_t v11 = v12;
    __int128 v13 = *(_OWORD *)(v10 + 8);
    *(_OWORD *)(v10 + 8) = *(_OWORD *)(v11 + 8);
    *(_OWORD *)(v11 + 8) = v13;
    unsigned int v9 = *(unsigned __int8 *)(a2 + 143);
  }

  uint64_t v14 = v9 - 1LL;
  uint64_t v15 = *(void *)(a2 + 8 + 8 * v14);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::erase( v15,  *(unsigned __int8 *)(a2 + 128 + v14),  a3);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::rebalanceFromErasure( (char *)a2,  v16,  v17);
  if ((_DWORD)v7 != v8) {
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--( a2,  v18,  v19);
  }
  --*(void *)(a1 + 24);
  __int128 v20 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a4 + 88) = v20;
  *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
  __int128 v21 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a4 + 24) = v21;
  __n128 result = *(__n128 *)(a2 + 40);
  __int128 v23 = *(_OWORD *)(a2 + 56);
  *(__n128 *)(a4 + 40) = result;
  *(void *)a4 = *(void *)a2;
  uint64_t v24 = *(void *)(a2 + 120);
  *(_OWORD *)(a4 + 56) = v23;
  uint64_t v25 = *(void *)(a2 + 128);
  *(void *)(a4 + 120) = v24;
  *(void *)(a4 + 128) = v25;
  *(void *)(a4 + 135) = *(void *)(a2 + 135);
  *(_BYTE *)(a4 + 143) = *(_BYTE *)(a2 + 143);
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::erase( uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(char *)(result + 240);
  if ((v3 & 0x80000000) == 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase(result, a2, a3);
  }
  unsigned int v4 = v3 & 0x7F;
  if (result + 24LL * a2 + 24 != result + 24LL * (v3 & 0x7F))
  {
    uint64_t v5 = (_OWORD *)(result + 24LL * a2 + 32);
    uint64_t v6 = 24LL * v4 - 24LL * a2 - 24;
    do
    {
      *((_DWORD *)v5 - 8) = *((_DWORD *)v5 - 2);
      *(_OWORD *)((char *)v5 - 24) = *v5;
      uint64_t v5 = (_OWORD *)((char *)v5 + 24);
      v6 -= 24LL;
    }

    while (v6);
    LOBYTE(v3) = *(_BYTE *)(result + 240);
  }

  *(_BYTE *)(result + 240) = v3 - 1;
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::rebalanceFromErasure( char *__dst, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = __dst[143];
  uint64_t v4 = *(void *)__dst;
  if (v3 >= 2)
  {
    unsigned __int8 v6 = 0;
    uint64_t v7 = __dst + 8;
    int v8 = __dst + 128;
    do
    {
      uint64_t v9 = (v3 - v6 - 2);
      uint64_t v10 = v9 + 1;
      else {
        unsigned int v11 = 5;
      }
      if ((*(_BYTE *)(*(void *)&v7[8 * v9 + 8] + 240LL) & 0x7Fu) >= v11) {
        break;
      }
      uint64_t v12 = v8[v9];
      __int128 v13 = *(char **)&v7[8 * v9];
      int v14 = v13[240];
      if ((_DWORD)v12 == (v14 & 0x7F))
      {
        int v15 = 0;
        if (v8[v9]) {
          goto LABEL_10;
        }
      }

      else
      {
        if (v14 < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v13, a2, v12);
        }
        else {
          int v20 = -5;
        }
        int v15 = v20 + (*(_BYTE *)(*(void *)&v13[8 * v12 + 176] + 240LL) & 0x7F);
        if (v8[v9])
        {
LABEL_10:
          if (v14 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v13, a2, v12);
          }
          int v16 = *(char *)(*(void *)&v13[8 * v12 + 160] + 240LL);
          char v17 = v16 & 0x7F;
          if (v16 >= 0) {
            char v18 = -3;
          }
          else {
            char v18 = -5;
          }
          char v19 = v18 + v17;
          goto LABEL_21;
        }
      }

      char v19 = 0;
LABEL_21:
      if (v15 < 1 || v15 < v19)
      {
        if (v19 < 1 || v15 >= v19)
        {
          if ((_DWORD)v12 == (v14 & 0x7F))
          {
            if (v14 < 0) {
              lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v13, a2, v12);
            }
            v8[v9] = v12 - 1;
            v8[v10] += (*(_BYTE *)(*(void *)&v13[8 * (v12 - 1) + 168] + 240LL) & 0x7F) + 1;
            lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::merge( *(char **)&v7[8 * v9],  *(lsl::Lock ***)(v4 + 8),  (v12 - 1));
            uint64_t v25 = *(void *)&v7[8 * v9];
            *(void *)&v7[8 * v10] = *(void *)(v25 + 8LL * v8[v9] + 168);
          }

          else
          {
            lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::merge( v13,  *(lsl::Lock ***)(v4 + 8),  v12);
          }
        }

        else
        {
          if (v14 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v13, a2, v12);
          }
          char v21 = *(_BYTE *)(*(void *)&v13[8 * v12 + 168] + 240LL);
          uint64_t v22 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::rotateFromLeft( v13,  v8[v9],  v12);
          uint64_t v23 = *(void *)&v7[8 * v9];
          v8[v10] += (*(_BYTE *)(*(void *)(v23 + 8LL * v8[v9] + 168) + 240LL) & 0x7F) - (v21 & 0x7F);
        }
      }

      else
      {
        lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::rotateFromRight( v13,  v8[v9],  v12);
      }

      ++v6;
      uint64_t v4 = *(void *)__dst;
      unsigned int v3 = *(unsigned __int8 *)(*(void *)__dst + 32LL);
    }

    while ((int)(v3 - 1) > v6);
  }

  __int128 v26 = __dst + 8;
  if ((*(_BYTE *)(*((void *)__dst + 1) + 240LL) & 0x7F) != 0)
  {
    unsigned __int8 v27 = *(_BYTE *)(v4 + 32);
  }

  else
  {
    __int128 v28 = __dst + 128;
    if (__dst[128]) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure((uint64_t)v28, a2, a3);
    }
    uint64_t v29 = __dst[143];
    if (&v28[v29] != __dst + 129)
    {
      memmove(v28, __dst + 129, v29 - 1);
      uint64_t v29 = __dst[143];
    }

    uint64_t v30 = (unsigned __int8 *)&v26[v29];
    if (v30 != (unsigned __int8 *)(__dst + 16))
    {
      memmove(__dst + 8, __dst + 16, v30 - (unsigned __int8 *)(__dst + 16));
      LOBYTE(v29) = __dst[143];
    }

    __dst[143] = v29 - 1;
    lsl::Allocator::free(*(lsl::Lock ***)(v4 + 8), *(void **)v4);
    uint64_t v31 = *(void **)__dst;
    unsigned __int8 v27 = *(_BYTE *)(*(void *)__dst + 32LL) - 1;
    *(_BYTE *)(*(void *)__dst + 32LL) = v27;
    if (__dst[143]) {
      *uint64_t v31 = *v26;
    }
    else {
      *uint64_t v31 = 0LL;
    }
  }

  if (v27)
  {
    uint64_t v32 = 0LL;
    do
    {
      if ((*(_BYTE *)(v26[(v27 + ~(_BYTE)v32)] + 240LL) & 0x7F) != __dst[(v27 + ~(_BYTE)v32)
                                                                                         + 128])
        break;
      --__dst[143];
      ++v32;
    }

    while (v27 != v32);
  }

char *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::rotateFromRight( char *result, uint64_t a2, uint64_t a3)
{
  if (result[240] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, a2, a3);
  }
  unsigned int v3 = &result[8 * a2];
  uint64_t v5 = *((void *)v3 + 21);
  uint64_t v4 = *((void *)v3 + 22);
  int v6 = *(_BYTE *)(v4 + 240) & 0x7F;
  unsigned int v7 = v6 + (*(_BYTE *)(v5 + 240) & 0x7F);
  int v8 = &result[24 * a2];
  uint64_t v9 = v5 + 24LL * (*(_BYTE *)(v5 + 240) & 0x7F);
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v8;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v8 + 8);
  uint64_t v10 = (v6 - (v7 >> 1));
  uint64_t v11 = v4 + 24 * v10;
  *(_DWORD *)int v8 = *(_DWORD *)(v11 - 24);
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(v11 - 16);
  if (v6 != v7 >> 1)
  {
    uint64_t v12 = (_OWORD *)(v5 + 24LL * (*(_BYTE *)(v5 + 240) & 0x7F) + 32);
    uint64_t v13 = v4;
    do
    {
      *((_DWORD *)v12 - 2) = *(_DWORD *)v13;
      *uint64_t v12 = *(_OWORD *)(v13 + 8);
      uint64_t v12 = (_OWORD *)((char *)v12 + 24);
      v13 += 24LL;
    }

    while (v13 != v11);
  }

  if ((_DWORD)v10 != (*(_BYTE *)(v4 + 240) & 0x7F))
  {
    uint64_t v14 = v4 + 24LL * (*(_BYTE *)(v4 + 240) & 0x7F);
    uint64_t v15 = 24 * v10;
    uint64_t v16 = v4;
    do
    {
      *(_DWORD *)uint64_t v16 = *(_DWORD *)(v16 + 24 * v10);
      *(_OWORD *)(v16 + 8) = *(_OWORD *)(v16 + v15 + 8);
      uint64_t v17 = v16 + v15 + 24;
      v16 += 24LL;
    }

    while (v17 != v14);
  }

  if ((*(char *)(v5 + 240) & 0x80000000) == 0)
  {
    int v18 = *(char *)(v4 + 240);
    if (v18 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, a2, a3);
    }
    if (v6 != v7 >> 1)
    {
      __n128 result = (char *)memmove( (void *)(v5 + 8LL * *(unsigned __int8 *)(v5 + 240) + 176),  (const void *)(v4 + 168),  8 * v10);
      int v18 = *(char *)(v4 + 240);
      if (v18 < 0) {
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v19, v20);
      }
    }

    uint64_t v21 = v18 + 1LL;
    if (v21 != v10) {
      __n128 result = (char *)memmove((void *)(v4 + 168), (const void *)(v4 + 168 + 8 * v10), 8 * v21 - 8 * v10);
    }
  }

  *(_BYTE *)(v5 + 240) += v10;
  *(_BYTE *)(v4 + 240) -= v10;
  return result;
}

void *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::rotateFromLeft( void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 - 1LL;
  uint64_t v4 = result[v3 + 21];
  uint64_t v5 = result[a2 + 21];
  int v6 = *(_BYTE *)(v4 + 240) & 0x7F;
  uint64_t v7 = *(_BYTE *)(v5 + 240) & 0x7F;
  unsigned int v8 = v7 + v6;
  uint64_t v9 = (v6 - ((v7 + v6) >> 1));
  if ((*(_BYTE *)(v5 + 240) & 0x7F) != 0)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 24 * v7;
    uint64_t v12 = v5 + 24LL * v9;
    uint64_t v13 = result[a2 + 21];
    do
    {
      uint64_t v14 = v12 + v11;
      *(_DWORD *)(v14 - 24) = *(_DWORD *)(v13 + v11 - 24);
      *(_OWORD *)(v14 - 16) = *(_OWORD *)(v13 + v11 - 16);
      v12 -= 24LL;
      v13 -= 24LL;
      v10 += 24LL;
    }

    while (v11 != v10);
    unsigned int v15 = *(_BYTE *)(v4 + 240) & 0x7F;
  }

  else
  {
    unsigned int v15 = *(_BYTE *)(v4 + 240) & 0x7F;
  }

  uint64_t v16 = v4 + 24LL * v15;
  uint64_t v17 = v16 + 24LL * -(int)v9 + 24;
  if (v17 != v16)
  {
    uint64_t v18 = v5;
    do
    {
      *(_DWORD *)uint64_t v18 = *(_DWORD *)v17;
      *(_OWORD *)(v18 + 8) = *(_OWORD *)(v17 + 8);
      v17 += 24LL;
      v18 += 24LL;
    }

    while (v17 != v16);
  }

  uint64_t v19 = (char *)&result[3 * (int)v3];
  uint64_t v20 = v5 + 24LL * v9;
  *(_DWORD *)(v20 - 24) = *(_DWORD *)v19;
  *(_OWORD *)(v20 - 16) = *(_OWORD *)(v19 + 8);
  uint64_t v21 = v4 + 24LL * ((*(_BYTE *)(v4 + 240) & 0x7F) - (int)v9);
  *(_DWORD *)uint64_t v19 = *(_DWORD *)v21;
  *(_OWORD *)(v19 + 8) = *(_OWORD *)(v21 + 8);
  int v22 = *(char *)(v4 + 240);
  if ((v22 & 0x80000000) == 0)
  {
    __n128 result = memmove( (void *)(v5 + 168 + 8LL * *(unsigned __int8 *)(v5 + 240)
                      + 8
                      + 8 * v9
                      + 8 * ~(unint64_t)*(unsigned __int8 *)(v5 + 240)),
               (const void *)(v5 + 168),
               8LL * *(unsigned __int8 *)(v5 + 240) + 8);
    int v22 = *(char *)(v4 + 240);
    if (v22 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v23, v24);
    }
    if (v6 != v8 >> 1)
    {
      __n128 result = memmove( (void *)(v5 + 168),  (const void *)(v4 + 8LL * *(unsigned __int8 *)(v4 + 240) + 176 - 8 * v9),  8 * v9);
      LOBYTE(v22) = *(_BYTE *)(v4 + 240);
    }
  }

  *(_BYTE *)(v4 + 240) = v22 - v9;
  *(_BYTE *)(v5 + 240) += v9;
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::merge( char *a1, lsl::Lock **this, uint64_t a3)
{
  if (a1[240] < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge((uint64_t)a1, (uint64_t)this, a3);
  }
  uint64_t v4 = a1;
  uint64_t v5 = &a1[8 * a3 + 168];
  uint64_t v7 = *(void *)v5;
  uint64_t v6 = *((void *)v5 + 1);
  unsigned int v8 = &a1[24 * a3];
  uint64_t v9 = *(void *)v5 + 24LL * (*(_BYTE *)(*(void *)v5 + 240LL) & 0x7F);
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v8;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v8 + 8);
  int v10 = a1[240];
  unsigned int v11 = v10 & 0x7F;
  if (v8 + 24 != &a1[24 * (v10 & 0x7F)])
  {
    uint64_t v12 = &a1[24 * a3 + 32];
    uint64_t v13 = 24LL * v11 - 24LL * a3 - 24;
    do
    {
      *((_DWORD *)v12 - 8) = *((_DWORD *)v12 - 2);
      *(_OWORD *)(v12 - 24) = *(_OWORD *)v12;
      v12 += 24;
      v13 -= 24LL;
    }

    while (v13);
    int v10 = a1[240];
  }

  if ((v10 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)a1, (uint64_t)this, a3);
  }
  uint64_t v14 = v5 + 16;
  uint64_t v15 = (uint64_t)&a1[8 * v10 + 176];
  size_t v16 = v15 - (void)(v5 + 16);
  unsigned int v17 = *(unsigned __int8 *)(v6 + 240);
  unsigned int v18 = *(unsigned __int8 *)(v7 + 240);
  if ((v17 & 0x7F) != 0)
  {
    uint64_t v19 = v6 + 24LL * (v17 & 0x7F);
    uint64_t v20 = (_OWORD *)(v7 + 24LL * (v18 & 0x7F) + 32);
    uint64_t v21 = v6;
    do
    {
      *((_DWORD *)v20 - 2) = *(_DWORD *)v21;
      _OWORD *v20 = *(_OWORD *)(v21 + 8);
      uint64_t v20 = (_OWORD *)((char *)v20 + 24);
      v21 += 24LL;
    }

    while (v21 != v19);
    unsigned int v18 = *(unsigned __int8 *)(v7 + 240);
    unsigned int v17 = *(unsigned __int8 *)(v6 + 240);
  }

  if ((v18 & 0x80) == 0)
  {
    if ((v17 & 0x80) != 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)a1, (uint64_t)v14, v16);
    }
    memmove((void *)(v7 + 8LL * v18 + 176), (const void *)(v6 + 168), 8LL * v17 + 8);
    LOBYTE(v17) = *(_BYTE *)(v6 + 240);
    LOBYTE(v18) = *(_BYTE *)(v7 + 240);
  }

  *(_BYTE *)(v7 + 240) = (v17 & 0x7F) + v18 + 1;
  --v4[240];
  lsl::Allocator::free(this, (void *)v6);
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::find@<Q0>( uint64_t a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = *MEMORY[0x1895FEE08];
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator( (uint64_t)&v23,  a1,  a2);
  uint64_t v12 = a1;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  char v22 = 0;
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v23,  (uint64_t)&v12)
    && (unsigned __int8 v7 = v26, *a2 >= *(_DWORD *)(*((void *)v24 + v26 - 1) + 32LL * v25.n128_u8[v26 - 1])))
  {
    __int128 v8 = v24[5];
    *(_OWORD *)(a3 + 72) = v24[4];
    *(_OWORD *)(a3 + 88) = v8;
    __int128 v9 = v24[7];
    *(_OWORD *)(a3 + 104) = v24[6];
    *(_OWORD *)(a3 + 120) = v9;
    __int128 v10 = v24[1];
    *(_OWORD *)(a3 + 8) = v24[0];
    *(_OWORD *)(a3 + 24) = v10;
    __int128 v11 = v24[3];
    *(_OWORD *)(a3 + 40) = v24[2];
    *(void *)a3 = v23;
    *(_OWORD *)(a3 + 56) = v11;
    __n128 result = v25;
    *(__n128 *)(a3 + 136) = v25;
    *(_BYTE *)(a3 + 152) = v7;
  }

  else
  {
    *(void *)a3 = a1;
    result.n128_u64[0] = 0LL;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(_OWORD *)(a3 + 120) = 0u;
    *(_OWORD *)(a3 + 136) = 0u;
    *(_BYTE *)(a3 + 152) = 0;
  }

  return result;
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::erase@<Q0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(unsigned __int8 *)(a2 + 152);
  int v8 = *(unsigned __int8 *)(a1 + 32);
  unsigned int v9 = v7;
  if ((_DWORD)v7 != v8)
  {
    uint64_t v10 = *(void *)(a2 + 8 + 8 * (v7 - 1)) + 32LL * *(unsigned __int8 *)(a2 + 136 + v7 - 1);
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( a2,  a2,  a3);
    int v12 = *(_DWORD *)v10;
    *(_DWORD *)uint64_t v10 = *(_DWORD *)v11;
    *(_DWORD *)uint64_t v11 = v12;
    uint64_t v13 = *(void *)(v10 + 24);
    __int128 v14 = *(_OWORD *)(v10 + 8);
    uint64_t v15 = *(void *)(v11 + 24);
    *(_OWORD *)(v10 + 8) = *(_OWORD *)(v11 + 8);
    *(void *)(v10 + 24) = v15;
    *(_OWORD *)(v11 + 8) = v14;
    *(void *)(v11 + 24) = v13;
    unsigned int v9 = *(unsigned __int8 *)(a2 + 152);
  }

  uint64_t v16 = v9 - 1LL;
  uint64_t v17 = *(void *)(a2 + 8 + 8 * v16);
  __int128 v18 = (__n128 *)(a2 + 136);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::erase( v17,  *(unsigned __int8 *)(a2 + 136 + v16),  a3);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::rebalanceFromErasure( (char *)a2,  v19,  v20);
  if ((_DWORD)v7 != v8) {
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--( a2,  v21,  v22);
  }
  --*(void *)(a1 + 24);
  __int128 v23 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a4 + 88) = v23;
  __int128 v24 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a4 + 120) = v24;
  __int128 v25 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a4 + 24) = v25;
  __int128 v26 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)a4 = *(void *)a2;
  *(_OWORD *)(a4 + 56) = v26;
  __n128 result = *v18;
  *(__n128 *)(a4 + 136) = *v18;
  *(_BYTE *)(a4 + 152) = *(_BYTE *)(a2 + 152);
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::erase( uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(char *)(result + 248);
  if ((v3 & 0x80000000) == 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase(result, a2, a3);
  }
  uint64_t v4 = v3 & 0x7F;
  uint64_t v5 = result + 32LL * a2;
  if (v5 + 32 != result + 32 * v4)
  {
    uint64_t v6 = v5 + 40;
    uint64_t v7 = 32 * v4 - 32LL * a2 - 32;
    do
    {
      *(_DWORD *)(v6 - 40) = *(_DWORD *)(v6 - 8);
      *(_OWORD *)(v6 - 32) = *(_OWORD *)v6;
      *(void *)(v6 - 16) = *(void *)(v6 + 16);
      v6 += 32LL;
      v7 -= 32LL;
    }

    while (v7);
    LOBYTE(v3) = *(_BYTE *)(result + 248);
  }

  *(_BYTE *)(result + 248) = v3 - 1;
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::rebalanceFromErasure( char *__dst, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = __dst[152];
  uint64_t v4 = *(void *)__dst;
  if (v3 >= 2)
  {
    unsigned __int8 v6 = 0;
    uint64_t v7 = __dst + 8;
    int v8 = __dst + 136;
    do
    {
      uint64_t v9 = (v3 - v6 - 2);
      uint64_t v10 = v9 + 1;
      if ((*(_BYTE *)(*(void *)&v7[8 * v9 + 8] + 248LL) & 0x7Fu) > 2) {
        break;
      }
      uint64_t v11 = v8[v9];
      int v12 = *(char **)&v7[8 * v9];
      int v13 = v12[248];
      if ((_DWORD)v11 == (v13 & 0x7F))
      {
        int v14 = 0;
        if (v8[v9]) {
          goto LABEL_7;
        }
      }

      else
      {
        if (v13 < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v12, a2, v11);
        }
        int v14 = (*(_BYTE *)(*(void *)&v12[8 * v11 + 200] + 248LL) & 0x7F) - 3;
        if (v8[v9])
        {
LABEL_7:
          if (v13 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v12, a2, v11);
          }
          char v15 = (*(_BYTE *)(*(void *)&v12[8 * v11 + 184] + 248LL) & 0x7F) - 3;
          goto LABEL_12;
        }
      }

      char v15 = 0;
LABEL_12:
      if (v14 < 1 || v14 < v15)
      {
        if (v15 < 1 || v14 >= v15)
        {
          if ((_DWORD)v11 == (v13 & 0x7F))
          {
            if (v13 < 0) {
              lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v12, a2, v11);
            }
            v8[v9] = v11 - 1;
            v8[v10] += (*(_BYTE *)(*(void *)&v12[8 * (v11 - 1) + 192] + 248LL) & 0x7F) + 1;
            lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::merge( *(char **)&v7[8 * v9],  *(lsl::Lock ***)(v4 + 8),  (v11 - 1));
            uint64_t v20 = *(void *)&v7[8 * v9];
            *(void *)&v7[8 * v10] = *(void *)(v20 + 8LL * v8[v9] + 192);
          }

          else
          {
            lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::merge( v12,  *(lsl::Lock ***)(v4 + 8),  v11);
          }
        }

        else
        {
          if (v13 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)v12, a2, v11);
          }
          char v16 = *(_BYTE *)(*(void *)&v12[8 * v11 + 192] + 248LL);
          uint64_t v17 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::rotateFromLeft( v12,  v8[v9],  v11);
          uint64_t v18 = *(void *)&v7[8 * v9];
          v8[v10] += (*(_BYTE *)(*(void *)(v18 + 8LL * v8[v9] + 192) + 248LL) & 0x7F) - (v16 & 0x7F);
        }
      }

      else
      {
        lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::rotateFromRight( v12,  v8[v9],  v11);
      }

      ++v6;
      uint64_t v4 = *(void *)__dst;
      unsigned int v3 = *(unsigned __int8 *)(*(void *)__dst + 32LL);
    }

    while ((int)(v3 - 1) > v6);
  }

  uint64_t v21 = __dst + 8;
  if ((*(_BYTE *)(*((void *)__dst + 1) + 248LL) & 0x7F) != 0)
  {
    unsigned __int8 v22 = *(_BYTE *)(v4 + 32);
  }

  else
  {
    __int128 v23 = __dst + 136;
    if (__dst[136]) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure((uint64_t)v23, a2, a3);
    }
    uint64_t v24 = __dst[152];
    if (&v23[v24] != __dst + 137)
    {
      memmove(v23, __dst + 137, v24 - 1);
      uint64_t v24 = __dst[152];
    }

    __int128 v25 = (unsigned __int8 *)&v21[v24];
    if (v25 != (unsigned __int8 *)(__dst + 16))
    {
      memmove(__dst + 8, __dst + 16, v25 - (unsigned __int8 *)(__dst + 16));
      LOBYTE(v24) = __dst[152];
    }

    __dst[152] = v24 - 1;
    lsl::Allocator::free(*(lsl::Lock ***)(v4 + 8), *(void **)v4);
    __int128 v26 = *(void **)__dst;
    unsigned __int8 v22 = *(_BYTE *)(*(void *)__dst + 32LL) - 1;
    *(_BYTE *)(*(void *)__dst + 32LL) = v22;
    if (__dst[152]) {
      *__int128 v26 = *v21;
    }
    else {
      *__int128 v26 = 0LL;
    }
  }

  if (v22)
  {
    uint64_t v27 = 0LL;
    do
    {
      if ((*(_BYTE *)(v21[(v22 + ~(_BYTE)v27)] + 248LL) & 0x7F) != __dst[(v22 + ~(_BYTE)v27)
                                                                                         + 136])
        break;
      --__dst[152];
      ++v27;
    }

    while (v22 != v27);
  }

char *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::rotateFromRight( char *result, uint64_t a2, uint64_t a3)
{
  if (result[248] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, a2, a3);
  }
  unsigned int v3 = &result[8 * a2];
  uint64_t v5 = *((void *)v3 + 24);
  uint64_t v4 = *((void *)v3 + 25);
  uint64_t v6 = *(_BYTE *)(v5 + 248) & 0x7F;
  int v7 = *(_BYTE *)(v4 + 248) & 0x7F;
  unsigned int v8 = v7 + v6;
  uint64_t v9 = &result[32 * a2];
  uint64_t v10 = v5 + 32 * v6;
  *(_DWORD *)uint64_t v10 = *(_DWORD *)v9;
  uint64_t v11 = *((void *)v9 + 3);
  *(_OWORD *)(v10 + 8) = *(_OWORD *)(v9 + 8);
  *(void *)(v10 + 24) = v11;
  uint64_t v12 = (v7 - (v8 >> 1));
  uint64_t v13 = v4 + 32 * v12;
  *(_DWORD *)uint64_t v9 = *(_DWORD *)(v13 - 32);
  __int128 v14 = *(_OWORD *)(v13 - 24);
  *((void *)v9 + 3) = *(void *)(v13 - 8);
  *(_OWORD *)(v9 + 8) = v14;
  if (v7 != v8 >> 1)
  {
    uint64_t v15 = v5 + 32LL * (*(_BYTE *)(v5 + 248) & 0x7F) + 40;
    uint64_t v16 = v4;
    do
    {
      *(_DWORD *)(v15 - 8) = *(_DWORD *)v16;
      __int128 v17 = *(_OWORD *)(v16 + 8);
      *(void *)(v15 + 16) = *(void *)(v16 + 24);
      *(_OWORD *)uint64_t v15 = v17;
      v15 += 32LL;
      v16 += 32LL;
    }

    while (v16 != v13);
  }

  uint64_t v18 = *(_BYTE *)(v4 + 248) & 0x7F;
  if ((_DWORD)v12 != (_DWORD)v18)
  {
    uint64_t v19 = 32 * v12;
    uint64_t v20 = v4;
    uint64_t v21 = v4 + 32 * v18;
    do
    {
      *(_DWORD *)uint64_t v20 = *(_DWORD *)(v20 + 32 * v12);
      uint64_t v22 = *(void *)(v20 + v19 + 24);
      *(_OWORD *)(v20 + 8) = *(_OWORD *)(v20 + v19 + 8);
      *(void *)(v20 + 24) = v22;
      uint64_t v23 = v20 + v19 + 32;
      v20 += 32LL;
    }

    while (v23 != v21);
  }

  if ((*(char *)(v5 + 248) & 0x80000000) == 0)
  {
    int v24 = *(char *)(v4 + 248);
    if (v24 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, a2, a3);
    }
    if (v7 != v8 >> 1)
    {
      __n128 result = (char *)memmove( (void *)(v5 + 8LL * *(unsigned __int8 *)(v5 + 248) + 200),  (const void *)(v4 + 192),  8 * v12);
      int v24 = *(char *)(v4 + 248);
      if (v24 < 0) {
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v25, v26);
      }
    }

    uint64_t v27 = v24 + 1LL;
    if (v27 != v12) {
      __n128 result = (char *)memmove((void *)(v4 + 192), (const void *)(v4 + 192 + 8 * v12), 8 * v27 - 8 * v12);
    }
  }

  *(_BYTE *)(v5 + 248) += v12;
  *(_BYTE *)(v4 + 248) -= v12;
  return result;
}

void *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::rotateFromLeft( void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2 - 1LL;
  uint64_t v4 = result[v3 + 24];
  uint64_t v5 = result[a2 + 24];
  int v6 = *(_BYTE *)(v4 + 248) & 0x7F;
  uint64_t v7 = *(_BYTE *)(v5 + 248) & 0x7F;
  unsigned int v8 = v7 + v6;
  uint64_t v9 = (v6 - ((v7 + v6) >> 1));
  if ((*(_BYTE *)(v5 + 248) & 0x7F) != 0)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 32 * v7;
    uint64_t v12 = result[a2 + 24];
    uint64_t v13 = v5 + 32 * v9;
    do
    {
      uint64_t v14 = v13 + v11;
      *(_DWORD *)(v14 - 32) = *(_DWORD *)(v12 + v11 - 32);
      __int128 v15 = *(_OWORD *)(v12 + v11 - 24);
      *(void *)(v14 - 8) = *(void *)(v12 + v11 - 8);
      *(_OWORD *)(v14 - 24) = v15;
      v13 -= 32LL;
      v12 -= 32LL;
      v10 += 32LL;
    }

    while (v11 != v10);
    unsigned int v16 = *(_BYTE *)(v4 + 248) & 0x7F;
  }

  else
  {
    unsigned int v16 = *(_BYTE *)(v4 + 248) & 0x7F;
  }

  uint64_t v17 = v4 + 32LL * v16;
  uint64_t v18 = v17 - 32 * v9 + 32;
  if (v18 != v17)
  {
    uint64_t v19 = v5;
    do
    {
      *(_DWORD *)uint64_t v19 = *(_DWORD *)v18;
      __int128 v20 = *(_OWORD *)(v18 + 8);
      *(void *)(v19 + 24) = *(void *)(v18 + 24);
      *(_OWORD *)(v19 + 8) = v20;
      v18 += 32LL;
      v19 += 32LL;
    }

    while (v18 != v17);
  }

  uint64_t v21 = (char *)&result[4 * v3];
  uint64_t v22 = v5 + 32 * v9;
  *(_DWORD *)(v22 - 32) = *(_DWORD *)v21;
  __int128 v23 = *(_OWORD *)(v21 + 8);
  *(void *)(v22 - 8) = *((void *)v21 + 3);
  *(_OWORD *)(v22 - 24) = v23;
  uint64_t v24 = v4 + 32 * ((*(_BYTE *)(v4 + 248) & 0x7F) - v9);
  *(_DWORD *)uint64_t v21 = *(_DWORD *)v24;
  __int128 v25 = *(_OWORD *)(v24 + 8);
  *((void *)v21 + 3) = *(void *)(v24 + 24);
  *(_OWORD *)(v21 + 8) = v25;
  int v26 = *(char *)(v4 + 248);
  if ((v26 & 0x80000000) == 0)
  {
    __n128 result = memmove( (void *)(v5 + 192 + 8LL * *(unsigned __int8 *)(v5 + 248)
                      + 8
                      + 8 * v9
                      + 8 * ~(unint64_t)*(unsigned __int8 *)(v5 + 248)),
               (const void *)(v5 + 192),
               8LL * *(unsigned __int8 *)(v5 + 248) + 8);
    int v26 = *(char *)(v4 + 248);
    if (v26 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v27, v28);
    }
    if (v6 != v8 >> 1)
    {
      __n128 result = memmove( (void *)(v5 + 192),  (const void *)(v4 + 8LL * *(unsigned __int8 *)(v4 + 248) + 200 - 8 * v9),  8 * v9);
      LOBYTE(v26) = *(_BYTE *)(v4 + 248);
    }
  }

  *(_BYTE *)(v4 + 248) = v26 - v9;
  *(_BYTE *)(v5 + 248) += v9;
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::merge( char *a1, lsl::Lock **this, uint64_t a3)
{
  if (a1[248] < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge((uint64_t)a1, (uint64_t)this, a3);
  }
  uint64_t v4 = a1;
  uint64_t v5 = &a1[8 * a3 + 192];
  uint64_t v7 = *(void *)v5;
  uint64_t v6 = *((void *)v5 + 1);
  unsigned int v8 = &a1[32 * a3];
  uint64_t v9 = *(void *)v5 + 32LL * (*(_BYTE *)(*(void *)v5 + 248LL) & 0x7F);
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v8;
  uint64_t v10 = *((void *)v8 + 3);
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v8 + 8);
  *(void *)(v9 + 24) = v10;
  int v11 = a1[248];
  uint64_t v12 = v11 & 0x7F;
  if (v8 + 32 != &a1[32 * v12])
  {
    uint64_t v13 = v8 + 40;
    uint64_t v14 = 32 * v12 - 32LL * a3 - 32;
    do
    {
      *((_DWORD *)v13 - 10) = *((_DWORD *)v13 - 2);
      *((_OWORD *)v13 - 2) = *(_OWORD *)v13;
      *((void *)v13 - 2) = *((void *)v13 + 2);
      v13 += 32;
      v14 -= 32LL;
    }

    while (v14);
    int v11 = a1[248];
  }

  if ((v11 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)a1, (uint64_t)this, a3);
  }
  __int128 v15 = v5 + 16;
  uint64_t v16 = (uint64_t)&a1[8 * v11 + 200];
  size_t v17 = v16 - (void)(v5 + 16);
  unsigned int v18 = *(unsigned __int8 *)(v6 + 248);
  unsigned int v19 = *(unsigned __int8 *)(v7 + 248);
  if ((v18 & 0x7F) != 0)
  {
    uint64_t v20 = v6 + 32LL * (v18 & 0x7F);
    uint64_t v21 = v7 + 32LL * (v19 & 0x7F) + 40;
    uint64_t v22 = v6;
    do
    {
      *(_DWORD *)(v21 - 8) = *(_DWORD *)v22;
      __int128 v23 = *(_OWORD *)(v22 + 8);
      *(void *)(v21 + 16) = *(void *)(v22 + 24);
      *(_OWORD *)uint64_t v21 = v23;
      v21 += 32LL;
      v22 += 32LL;
    }

    while (v22 != v20);
    unsigned int v19 = *(unsigned __int8 *)(v7 + 248);
    unsigned int v18 = *(unsigned __int8 *)(v6 + 248);
  }

  if ((v19 & 0x80) == 0)
  {
    if ((v18 & 0x80) != 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)a1, (uint64_t)v15, v17);
    }
    memmove((void *)(v7 + 8LL * v19 + 200), (const void *)(v6 + 192), 8LL * v18 + 8);
    LOBYTE(v18) = *(_BYTE *)(v6 + 248);
    LOBYTE(v19) = *(_BYTE *)(v7 + 248);
  }

  *(_BYTE *)(v7 + 248) = (v18 & 0x7F) + v19 + 1;
  --v4[248];
  lsl::Allocator::free(this, (void *)v6);
}

lsl::Allocator ***lsl::UniquePtr<dyld4::Atlas::Bitmap>::~UniquePtr(lsl::Allocator ***a1, void *a2)
{
  uint64_t v3 = *a1;
  if (v3)
  {
    if (v3[1])
    {
      lsl::Allocator::freeObject(v3[1], a2);
      uint64_t v3 = *a1;
    }

    lsl::Allocator::freeObject((lsl::Allocator *)v3, a2);
  }

  return a1;
}

void lsl::Vector<lsl::UUID>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 16 * a2);
    }

    else
    {
      uint64_t v3 = (void *)(a1 + 8);
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v2);
      }
      *uint64_t v3 = 0LL;
      v3[1] = 0LL;
      v3[2] = 0LL;
    }
  }

  else
  {
    lsl::Vector<lsl::UUID>::reserve(a1, a2);
  }

void lsl::Vector<lsl::UUID>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }

    else
    {
      unint64_t v2 = 16LL;
    }

    lsl::Vector<lsl::UUID>::reserveExact(a1, v2);
  }

void lsl::Vector<lsl::UUID>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if ((lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 16 * a2) & 1) == 0)
    {
      unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, 16 * a2);
      uint64_t v5 = v4;
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        uint64_t v7 = 0LL;
        for (unint64_t i = 0LL; i < v6; ++i)
        {
          *(_OWORD *)&v4[v7] = *(_OWORD *)(*(void *)(a1 + 8) + v7 * 8);
          unint64_t v6 = *(void *)(a1 + 16);
          v7 += 2LL;
        }
      }

      uint64_t v9 = *(void **)(a1 + 8);
      if (v9)
      {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v9);
        unint64_t v6 = *(void *)(a1 + 16);
      }

      if (v6 >= a2) {
        unint64_t v6 = a2;
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v6;
    }

    *(void *)(a1 + 24) = a2;
  }

lsl::Allocator **lsl::UniquePtr<dyld4::Atlas::Image>::~UniquePtr(lsl::Allocator **a1)
{
  unint64_t v2 = *a1;
  if (*a1)
  {
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v2 + 112);
    unint64_t v4 = (lsl::Allocator *)*((void *)v2 + 11);
    if (v4) {
      lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v4, v3);
    }
    dyld4::FileRecord::~FileRecord((lsl::Allocator *)((char *)v2 + 8));
    lsl::Allocator::freeObject(*a1, v5);
  }

  return a1;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::insert_internal@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v28 = *MEMORY[0x1895FEE08];
  if (*(void *)a1)
  {
    uint64_t v22 = a1;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    memset(v27, 0, sizeof(v27));
    uint64_t result = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>(a2, (uint64_t)&v22);
    if ((_BYTE)result
      && (uint64_t v9 = *(unsigned __int8 *)(a2 + 98),
          *(void *)(*a3 + 160) >= *(void *)(*(void *)(*(void *)(a2 + 8 + 8 * (v9 - 1))
                                                          + 8LL * *(unsigned __int8 *)(a2 + 88 + v9 - 1))
                                              + 160LL)))
    {
      char v16 = 0;
      __int128 v20 = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      __int128 v21 = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = v21;
      *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 8) = v20;
      *(void *)(a4 + 88) = *(void *)(a2 + 88);
      *(_WORD *)(a4 + 96) = *(_WORD *)(a2 + 96);
      *(_BYTE *)(a4 + 98) = v9;
    }

    else
    {
      uint64_t v22 = a1;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      memset(v27, 0, sizeof(v27));
      if (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>( a2,  (uint64_t)&v22)
        && *(unsigned __int8 *)(a2 + 98) == *(unsigned __int8 *)(a1 + 32))
      {
        lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::prepareForInsertion( (unsigned __int8 *)a2,  v10,  v11);
        uint64_t v12 = a2 + 88;
        uint64_t v13 = *(unsigned __int8 *)(a2 + 98) - 1LL;
        unsigned __int8 v14 = *(_BYTE *)(a2 + 88 + v13);
      }

      else
      {
        lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator--(a2, v10, v11);
        lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::prepareForInsertion( (unsigned __int8 *)a2,  v17,  v18);
        uint64_t v12 = a2 + 88;
        uint64_t v19 = *(unsigned __int8 *)(a2 + 98) + a2 + 88;
        unsigned __int8 v14 = *(_BYTE *)(v19 - 1) + 1;
        *(_BYTE *)(v19 - 1) = v14;
        uint64_t v13 = *(unsigned __int8 *)(a2 + 98) - 1LL;
      }

      uint64_t result = lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::insert( *(void *)(a2 + 8 + 8 * v13),  v14,  a3);
      ++*(void *)(a1 + 24);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
      *(void *)(a4 + 88) = *(void *)v12;
      *(_WORD *)(a4 + 96) = *(_WORD *)(v12 + 8);
      *(_BYTE *)(a4 + 98) = *(_BYTE *)(a2 + 98);
      char v16 = 1;
    }
  }

  else
  {
    __int128 v15 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    *((_BYTE *)v15 + 248) = 0x80;
    *(_OWORD *)__int128 v15 = 0u;
    *((_OWORD *)v15 + 1) = 0u;
    *((_OWORD *)v15 + 2) = 0u;
    *((_OWORD *)v15 + 3) = 0u;
    *((_OWORD *)v15 + 4) = 0u;
    *((_OWORD *)v15 + 5) = 0u;
    *((_OWORD *)v15 + 6) = 0u;
    *((_OWORD *)v15 + 7) = 0u;
    *((_OWORD *)v15 + 8) = 0u;
    *((_OWORD *)v15 + 9) = 0u;
    *((_OWORD *)v15 + 10) = 0u;
    *((_OWORD *)v15 + 11) = 0u;
    *((_OWORD *)v15 + 12) = 0u;
    *((_OWORD *)v15 + 13) = 0u;
    *((_OWORD *)v15 + 14) = 0u;
    v15[30] = 0LL;
    *(void *)a1 = v15;
    char v16 = 1;
    *(_BYTE *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v15;
    *(_BYTE *)(a2 + 98) = 1;
    uint64_t result = lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::insert( (uint64_t)v15,  0LL,  a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(void *)(a4 + 88) = *(void *)(a2 + 88);
    *(_WORD *)(a4 + 96) = *(_WORD *)(a2 + 96);
    *(_BYTE *)(a4 + 98) = *(_BYTE *)(a2 + 98);
  }

  *(_BYTE *)(a4 + 104) = v16;
  return result;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::insert( uint64_t result, uint64_t a2, uint64_t *a3)
{
  int v3 = *(char *)(result + 248);
  int v4 = v3 & 0x7F;
  if (v3 >= 0) {
    int v5 = 15;
  }
  else {
    int v5 = 31;
  }
  if (v4 == v5) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert(result, a2, (uint64_t)a3);
  }
  if (v5 == (_DWORD)a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert(result, a2, (uint64_t)a3);
  }
  unint64_t v6 = (uint64_t *)(result + 8LL * a2);
  if (v4 != (_DWORD)a2)
  {
    uint64_t v7 = (uint64_t *)(result + 8LL * (v3 & 0x7F));
    uint64_t v10 = *v7;
    unsigned int v8 = v7 - 1;
    uint64_t v9 = v10;
    uint64_t v11 = 8LL * a2 - 8LL * (v3 & 0x7F);
    do
    {
      uint64_t v12 = *v8;
      *unsigned int v8 = v9;
      v8[1] = v12;
      --v8;
      v11 += 8LL;
    }

    while (v11);
  }

  *(_BYTE *)(result + 248) = v3 + 1;
  if (v6 != a3)
  {
    uint64_t v13 = *v6;
    *unint64_t v6 = *a3;
    *a3 = v13;
  }

  return result;
}

unsigned __int8 *lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::prepareForInsertion( unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result[98];
  int v4 = result;
  int v5 = result + 8;
  else {
    int v6 = 31;
  }
  if ((*(_BYTE *)(*(void *)&result[8 * v3] + 248LL) & 0x7F) == v6)
  {
    if (!result[98]) {
      goto LABEL_15;
    }
    uint64_t v7 = 0LL;
    unsigned int v8 = 0;
    do
    {
      else {
        int v9 = 31;
      }
      if ((*(_BYTE *)(v5[v7] + 248LL) & 0x7F) != v9) {
        unsigned int v8 = v7;
      }
      ++v7;
    }

    while (v3 != v7);
    if (!v8)
    {
LABEL_15:
      else {
        int v10 = 31;
      }
      if ((*(_BYTE *)(*v5 + 248LL) & 0x7F) == v10)
      {
        uint64_t v11 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(*(void *)result + 8LL), 0x100uLL, 0x100uLL);
        uint64_t result = (unsigned __int8 *)lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::NodeCore( (uint64_t)v11,  **(void **)v4,  v12);
        **(void **)int v4 = result;
        if (v4[98] && (uint64_t result = (unsigned __int8 *)memmove(v4 + 89, v4 + 88, v4[98]), v4[98]))
        {
          uint64_t result = (unsigned __int8 *)memmove(v5 + 1, v5, 8LL * v4[98]);
          LOBYTE(v3) = v4[98] + 1;
        }

        else
        {
          LOBYTE(v3) = 1;
        }

        unsigned int v8 = 0;
        v4[88] = 0;
        uint64_t v13 = *(uint64_t **)v4;
        *((void *)v4 + 1) = **(void **)v4;
        ++*((_BYTE *)v13 + 32);
        v4[98] = v3;
      }

      else
      {
        unsigned int v8 = 0;
      }
    }

    if (v8 + 1 < v3)
    {
      unsigned __int8 v14 = v4 + 88;
      uint64_t v15 = v8;
      do
      {
        int v16 = v15;
        uint64_t result = (unsigned __int8 *)lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::splitChild( v5[v15],  v14[v15],  *(lsl::Lock ***)(*(void *)v4 + 8LL));
        uint64_t v19 = v5[v15];
        uint64_t v20 = v14[v15];
        uint64_t v21 = *(void *)(v19 + 8 * v20 + 120);
        unsigned int v22 = v4[v15 + 89];
        if (v22 > (*(_BYTE *)(v21 + 248) & 0x7Fu))
        {
          unsigned __int8 v23 = v20 + 1;
          v14[v15] = v23;
          v4[v15 + 89] = v22 + (~*(_BYTE *)(v21 + 248) | 0x80);
          uint64_t v24 = v5[v15];
          *(void *)&v4[8 * v15 + 16] = *(void *)(v24 + 8LL * v23 + 120);
        }

        ++v15;
      }

      while (v16 + 2 < v4[98]);
    }
  }

  return result;
}

char *lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::splitChild( uint64_t a1, uint64_t a2, lsl::Lock **this)
{
  unsigned int v3 = *(unsigned __int8 *)(a1 + 248);
  if (v3 >= 0xF) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild(a1, a2, (uint64_t)this);
  }
  uint64_t v5 = a1 + 120;
  uint64_t v6 = a1 + 120 + 8LL * a2;
  char v7 = *(_BYTE *)(*(void *)v6 + 248LL);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 15;
  }
  else {
    int v10 = 31;
  }
  if (v9 != v10) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild(a1, a2, (uint64_t)this);
  }
  uint64_t v12 = *(unsigned __int8 *)(a1 + 248);
  uint64_t v13 = v12 + 1;
  uint64_t v14 = a2;
  if (v8 >= 0) {
    uint64_t v15 = 7LL;
  }
  else {
    uint64_t v15 = 15LL;
  }
  if (v3 != (_DWORD)a2)
  {
    int v16 = (uint64_t *)(a1 + 8 * v12);
    uint64_t v19 = *v16;
    uint64_t v17 = v16 - 1;
    uint64_t v18 = v19;
    uint64_t v20 = 8LL * a2 - 8 * v12;
    do
    {
      uint64_t v21 = *v17;
      *uint64_t v17 = v18;
      v17[1] = v21;
      --v17;
      v20 += 8LL;
    }

    while (v20);
  }

  unsigned int v22 = (uint64_t *)(a1 + 8LL * a2);
  uint64_t v23 = v5 + 8 * v13;
  if (v23 != v6 + 8)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v23 - (v6 + 8));
    LOBYTE(v3) = *(_BYTE *)(a1 + 248);
  }

  *(_BYTE *)(a1 + 248) = v3 + 1;
  uint64_t v24 = (uint64_t *)(*(void *)v6 + 8 * v15);
  if (v24 != v22)
  {
    uint64_t v25 = *v22;
    uint64_t *v22 = *v24;
    *uint64_t v24 = v25;
  }

  uint64_t result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  uint64_t v29 = result;
  int v30 = *(char *)(*(void *)v6 + 248LL);
  result[248] = *(_BYTE *)(*(void *)v6 + 248LL) & 0x80;
  if (v30 < 0)
  {
    *((void *)result + 30) = 0LL;
    __int128 v31 = 0uLL;
    *((_OWORD *)result + 13) = 0u;
    *((_OWORD *)result + 14) = 0u;
    *((_OWORD *)result + 11) = 0u;
    *((_OWORD *)result + 12) = 0u;
    *((_OWORD *)result + 9) = 0u;
    *((_OWORD *)result + 10) = 0u;
    *((_OWORD *)result + 7) = 0u;
    *((_OWORD *)result + 8) = 0u;
  }

  else
  {
    *((void *)result + 14) = 0LL;
    __int128 v31 = 0uLL;
  }

  *((_OWORD *)result + 5) = v31;
  *((_OWORD *)result + 6) = v31;
  *((_OWORD *)result + 3) = v31;
  *((_OWORD *)result + 4) = v31;
  *((_OWORD *)result + 1) = v31;
  *((_OWORD *)result + 2) = v31;
  *(_OWORD *)uint64_t result = v31;
  char v32 = v9 + ~(_BYTE)v15;
  uint64_t v33 = (uint64_t *)(v5 + 8 * v14);
  v33[1] = (uint64_t)result;
  uint64_t v34 = *v33;
  if (v32)
  {
    __int128 v35 = (uint64_t *)(v34 + 8 * v15 + 8);
    uint64_t v36 = 8LL * (v9 + ~(_BYTE)v15);
    int v37 = (uint64_t *)result;
    do
    {
      if (v35 != v37)
      {
        uint64_t v38 = *v37;
        *int v37 = *v35;
        *__int128 v35 = v38;
      }

      ++v35;
      ++v37;
      v36 -= 8LL;
    }

    while (v36);
    uint64_t v34 = *(void *)v6;
  }

  int v39 = *(char *)(v34 + 248);
  if ((v39 & 0x80000000) == 0)
  {
    if (v30 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v27, v28);
    }
    uint64_t result = (char *)memmove( result + 120,  (const void *)(v34 + 8 * v15 + 128),  8LL * (v9 + ~(_BYTE)v15) + 8);
    uint64_t v34 = *(void *)v6;
    LOBYTE(v39) = *(_BYTE *)(*(void *)v6 + 248LL);
  }

  *(_BYTE *)(v34 + 248) = v39 + ~v32;
  char v40 = v29[248] + v32;
  v29[248] = v40;
  if (v40 >= 0) {
    int v41 = 15;
  }
  else {
    int v41 = 31;
  }
  if ((v40 & 0x7F) == v41
    || ((char v42 = *(_BYTE *)(v34 + 248), v43 = v42, v44 = v42 & 0x7F, v43 >= 0) ? (v45 = 15) : (v45 = 31), v44 == v45))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild((uint64_t)result, v27, v28);
  }

  return result;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::NodeCore( uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0LL;
  *(_BYTE *)(result + 248) = 0;
  do
  {
    *(void *)(result + v3) = 0LL;
    v3 += 8LL;
  }

  while (v3 != 120);
  *(void *)(result + 120) = a2;
  return result;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::const_iterator( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = a1 + 8;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 83) = 0u;
  if (*(_BYTE *)(a2 + 32))
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = *(void *)a2;
    uint64_t v9 = a1 + 88;
    do
    {
      uint64_t v10 = v9 + 8 * v7;
      *(void *)(v10 - 80) = v8;
      uint64_t v11 = lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::lower_bound_index( v8,  a3);
      *(_BYTE *)(v9 + v7) = v11;
      uint64_t v14 = *(void *)(v10 - 80);
      int v15 = *(char *)(v14 + 248);
      if ((_DWORD)v11 != (v15 & 0x7F)
        && *(void *)(*(void *)(v14 + 8LL * v11) + 160LL) < *(void *)(*(void *)a3 + 160LL))
      {
        *(_BYTE *)(a1 + 98) = v7 + 1;
        return a1;
      }

      unint64_t v16 = *(unsigned __int8 *)(a2 + 32);
      if ((_DWORD)v7 + 1 != (_DWORD)v16)
      {
        if (v15 < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(v11, v12, v13);
        }
        uint64_t v8 = *(void *)(v14 + 8LL * v11 + 120);
      }

      ++v7;
    }

    while (v7 < v16);
    for (*(_BYTE *)(a1 + 98) = v16; (_BYTE)v16; *(_BYTE *)(a1 + 98) = v16)
    {
      if (*(_BYTE *)(v9 + v16 - 1) != (*(_BYTE *)(*(void *)(v4
                                                                                            + 8LL * v16
                                                                                            - 8)
                                                                                + 248LL) & 0x7F))
        break;
      LOBYTE(v16) = v16 - 1;
    }
  }

  return a1;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::lower_bound_index( uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(_BYTE *)(a1 + 248) & 0x7F;
  if ((*(_BYTE *)(a1 + 248) & 0x7F) != 0)
  {
    uint64_t v3 = (void *)a1;
    do
    {
      unint64_t v4 = v2 >> 1;
      uint64_t v5 = &v3[v2 >> 1];
      uint64_t v7 = *v5;
      uint64_t v6 = v5 + 1;
      v2 += ~(v2 >> 1);
      if (*(void *)(v7 + 160) < *(void *)(*(void *)a2 + 160LL)) {
        uint64_t v3 = v6;
      }
      else {
        unint64_t v2 = v4;
      }
    }

    while (v2);
  }

  else
  {
    LODWORD(v3) = a1 + 8 * v2;
  }

  return (((_DWORD)v3 - a1) >> 3);
}

void lsl::Vector<char>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if ((lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), a2) & 1) == 0)
    {
      unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, a2);
      uint64_t v5 = v4;
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        for (unint64_t i = 0LL; i < v6; ++i)
        {
          *((_BYTE *)v4 + i) = *(_BYTE *)(*(void *)(a1 + 8) + i);
          unint64_t v6 = *(void *)(a1 + 16);
        }
      }

      uint64_t v8 = *(void **)(a1 + 8);
      if (v8)
      {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v8);
        unint64_t v6 = *(void *)(a1 + 16);
      }

      if (v6 >= a2) {
        unint64_t v6 = a2;
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v6;
    }

    *(void *)(a1 + 24) = a2;
  }

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_2(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_3(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_4(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_5(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_6(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_7(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_8(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_9(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_10(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_11(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_12(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_13(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_14(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

char *dyld4::Utils::strrstr(dyld4::Utils *this, const char *__s, const char *a3)
{
  size_t v5 = strlen(__s);
  size_t v6 = strlen((const char *)this);
  if (!v6) {
    return 0LL;
  }
  size_t v7 = v6;
  while (1)
  {
    uint64_t v8 = (char *)this + v7;
    if (!--v7) {
      return 0LL;
    }
  }

  return v8;
}

size_t dyld4::Utils::concatenatePaths(dyld4::Utils *this, char *a2, const char *a3)
{
  if (*((_BYTE *)this + strlen((const char *)this) - 1) == 47 && *a2 == 47)
  {
    size_t v6 = a2 + 1;
    size_t v7 = (char *)this;
  }

  else
  {
    size_t v7 = (char *)this;
    size_t v6 = a2;
  }

  return strlcat(v7, v6, (size_t)a3);
}

uint64_t dyld4::LibSystemHelpers::version(dyld4::LibSystemHelpers *this)
{
  return 6LL;
}

void *dyld4::LibSystemHelpers::malloc(dyld4::LibSystemHelpers *this, size_t __size)
{
  return malloc(__size);
}

void dyld4::LibSystemHelpers::free(dyld4::LibSystemHelpers *this, void *a2)
{
}

size_t dyld4::LibSystemHelpers::malloc_size(dyld4::LibSystemHelpers *this, const void *ptr)
{
  return malloc_size(ptr);
}

uint64_t dyld4::LibSystemHelpers::vm_allocate( dyld4::LibSystemHelpers *this, vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return vm_allocate(target_task, address, size, flags);
}

void dyld4::LibSystemHelpers::vm_deallocate(dyld4::LibSystemHelpers *this)
{
}

uint64_t dyld4::LibSystemHelpers::pthread_key_create_free(dyld4::LibSystemHelpers *this, pthread_key_t *a2)
{
  return pthread_key_create(a2, (void (__cdecl *)(void *))MEMORY[0x189600260]);
}

uint64_t dyld4::LibSystemHelpers::pthread_key_init_free(dyld4::LibSystemHelpers *this)
{
  return pthread_key_init_np();
}

uint64_t dyld4::LibSystemHelpers::run_async( dyld4::LibSystemHelpers *this, void *(__cdecl *a2)(void *), void *a3)
{
  return pthread_detach(v4);
}

uint64_t dyld4::LibSystemHelpers::pthread_key_create_thread_exit( dyld4::LibSystemHelpers *this, pthread_key_t *a2)
{
  return pthread_key_create(a2, (void (__cdecl *)(void *))dyld4::finalizeListTLV_thunk);
}

uint64_t dyld4::finalizeListTLV_thunk(dyld4 *this, void *a2)
{
  return (**(uint64_t (***)(uint64_t, dyld4 *))dyld4::gDyld)(dyld4::gDyld, this);
}

void *dyld4::LibSystemHelpers::pthread_getspecific(dyld4::LibSystemHelpers *this, pthread_key_t a2)
{
  return pthread_getspecific(a2);
}

uint64_t dyld4::LibSystemHelpers::pthread_setspecific( dyld4::LibSystemHelpers *this, pthread_key_t a2, const void *a3)
{
  return pthread_setspecific(a2, a3);
}

uint64_t dyld4::LibSystemHelpers::__cxa_atexit( dyld4::LibSystemHelpers *this, void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return __cxa_atexit(lpfunc, obj, lpdso_handle);
}

uint64_t dyld4::LibSystemHelpers::__cxa_finalize_ranges()
{
  return __cxa_finalize_ranges();
}

uint64_t dyld4::LibSystemHelpers::isLaunchdOwned(dyld4::LibSystemHelpers *this)
{
  return 0LL;
}

uint64_t dyld4::LibSystemHelpers::os_unfair_recursive_lock_lock_with_options()
{
  return os_unfair_recursive_lock_lock_with_options();
}

uint64_t dyld4::LibSystemHelpers::os_unfair_recursive_lock_unlock()
{
  return os_unfair_recursive_lock_unlock();
}

void dyld4::LibSystemHelpers::exit(dyld4::LibSystemHelpers *this, int a2)
{
}

char *dyld4::LibSystemHelpers::getenv(dyld4::LibSystemHelpers *this, const char *a2)
{
  return getenv(a2);
}

uint64_t dyld4::LibSystemHelpers::mkstemp(dyld4::LibSystemHelpers *this, char *a2)
{
  return mkstemp(a2);
}

__n128 (*dyld4::LibSystemHelpers::getTLVGetAddrFunc( dyld4::LibSystemHelpers *this))(uint64_t a1, __n128 result)
{
  return tlv_get_addr;
}

uint64_t dyld4::LibSystemHelpers::os_unfair_recursive_lock_unlock_forked_child()
{
  return os_unfair_recursive_lock_unlock_forked_child();
}

void dyld4::LibSystemHelpers::setDyldPatchedObjCClasses(dyld4::LibSystemHelpers *this)
{
  dyld_process_has_objc_patches = 1;
}

uint64_t dyld4::LibSystemHelpers::os_unfair_lock_lock_with_options()
{
  return os_unfair_lock_lock_with_options();
}

void dyld4::LibSystemHelpers::os_unfair_lock_unlock(dyld4::LibSystemHelpers *this, os_unfair_lock_t lock)
{
}

uint64_t DyldSharedCache::forEachRegion(uint64_t a1, uint64_t a2)
{
  uint64_t result = strncmp((const char *)a1, "dyld_v1", 7uLL);
  if (!(_DWORD)result)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 16);
    if (v5 <= 0x400)
    {
      uint64_t v6 = *(unsigned int *)(a1 + 20);
      if (v6 <= 0x14)
      {
        if (v5 > 0x138)
        {
          if ((_DWORD)v6)
          {
            uint64_t v10 = a1 + *(unsigned int *)(a1 + 312);
            unint64_t v11 = v10 + 56LL * v6;
            unint64_t v12 = v10 + 56;
            do
            {
              char v13 = 0;
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void, void, void, void, char *))(a2 + 16))( a2,  a1 + *(void *)(v12 - 40),  *(void *)(v12 - 56),  *(void *)(v12 - 48),  *(unsigned int *)(v12 - 4),  *(unsigned int *)(v12 - 8),  *(void *)(v12 - 16),  &v13);
              if (v13) {
                break;
              }
              BOOL v9 = v12 >= v11;
              v12 += 56LL;
            }

            while (!v9);
          }
        }

        else if ((_DWORD)v6)
        {
          unint64_t v7 = a1 + v5 + 32 * v6;
          unint64_t v8 = v5 + a1 + 32;
          do
          {
            char v14 = 0;
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void, void, void, void, char *))(a2 + 16))( a2,  a1 + *(void *)(v8 - 16),  *(void *)(v8 - 32),  *(void *)(v8 - 24),  *(unsigned int *)(v8 - 4),  *(unsigned int *)(v8 - 8),  0LL,  &v14);
            if (v14) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = v8 >= v7;
            }
            v8 += 32LL;
          }

          while (!v9);
        }
      }
    }
  }

  return result;
}

const char *DyldSharedCache::mappingName(DyldSharedCache *this, char a2)
{
  if ((this & 4) != 0)
  {
    if ((a2 & 8) != 0) {
      return "__TEXT_STUBS";
    }
    else {
      return "__TEXT";
    }
  }

  else
  {
    if ((this & 2) != 0)
    {
      unint64_t v2 = "__DATA_DIRTY";
      uint64_t v6 = "__TPRO_CONST";
      unint64_t v7 = "__DATA_CONST";
      if ((a2 & 4) == 0) {
        unint64_t v7 = "__DATA";
      }
      if ((a2 & 0x40) == 0) {
        uint64_t v6 = v7;
      }
      if ((a2 & 2) == 0) {
        unint64_t v2 = v6;
      }
      uint64_t v3 = "__AUTH_DIRTY";
      unint64_t v8 = "__AUTH_TPRO_CONST";
      BOOL v9 = "__AUTH_CONST";
      if ((a2 & 4) == 0) {
        BOOL v9 = "__AUTH";
      }
      if ((a2 & 0x40) == 0) {
        unint64_t v8 = v9;
      }
      if ((a2 & 2) == 0) {
        uint64_t v3 = v8;
      }
      BOOL v4 = (a2 & 1) == 0;
    }

    else
    {
      unint64_t v2 = "*unknown*";
      uint64_t v3 = "__READ_ONLY";
      if ((a2 & 0x20) == 0) {
        uint64_t v3 = "__LINKEDIT";
      }
      BOOL v4 = (this & 1) == 0;
    }

    if (v4) {
      return v2;
    }
    else {
      return v3;
    }
  }

void DyldSharedCache::forEachRange(char *a1, uint64_t a2, uint64_t a3)
{
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x2000000000LL;
  int v5 = 0;
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  v3[2] = ___ZNK15DyldSharedCache12forEachRangeEU13block_pointerFvPKcyyjyjjRbEU13block_pointerFvPKS_jE_block_invoke;
  void v3[3] = &unk_189630680;
  void v3[5] = a3;
  void v3[6] = v4;
  v3[4] = a2;
  DyldSharedCache::forEachCache(a1, (uint64_t)v3);
  _Block_object_dispose(v4, 8);
}

uint64_t DyldSharedCache::forEachCache(char *a1, uint64_t a2)
{
  char v10 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, char *))(a2 + 16))(a2, a1, &v10);
  if (!v10 && *((_DWORD *)a1 + 4) >= 0x18Du && *((_DWORD *)a1 + 99))
  {
    int v5 = 0;
    do
    {
      uint64_t v6 = &a1[*((unsigned int *)a1 + 98)];
      uint64_t v7 = (uint64_t)&v6[24 * v5 + 16];
      uint64_t v8 = (uint64_t)&v6[56 * v5 + 16];
      if (*((_DWORD *)a1 + 4) >= 0x1C9u) {
        BOOL v9 = (void *)v8;
      }
      else {
        BOOL v9 = (void *)v7;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, char *))(a2 + 16))(a2, &a1[*v9], &v10);
      if (v10) {
        break;
      }
      ++v5;
    }

    while (v5 != *((_DWORD *)a1 + 99));
  }

  return result;
}

uint64_t ___ZNK15DyldSharedCache12forEachRangeEU13block_pointerFvPKcyyjyjjRbEU13block_pointerFvPKS_jE_block_invoke( void *a1, uint64_t a2, _BYTE *a3)
{
  v8[0] = MEMORY[0x1895FED80];
  v8[1] = 0x40000000LL;
  void v8[2] = ___ZNK15DyldSharedCache12forEachRangeEU13block_pointerFvPKcyyjyjjRbEU13block_pointerFvPKS_jE_block_invoke_2;
  v8[3] = &unk_189630658;
  uint64_t v6 = a1[6];
  v8[4] = a1[4];
  void v8[5] = v6;
  void v8[6] = a2;
  v8[7] = a3;
  uint64_t result = DyldSharedCache::forEachRegion(a2, (uint64_t)v8);
  if (!*a3)
  {
    uint64_t result = a1[5];
    if (result) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))( result,  a2,  *(unsigned int *)(*(void *)(a1[6] + 8LL) + 24LL));
    }
    ++*(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL);
  }

  return result;
}

uint64_t ___ZNK15DyldSharedCache12forEachRangeEU13block_pointerFvPKcyyjyjjRbEU13block_pointerFvPKS_jE_block_invoke_2( uint64_t a1, int a2, int a3, int a4, int a5, DyldSharedCache *this, char a7)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32));
}

BOOL DyldSharedCache::inCache(DyldSharedCache *this, DyldSharedCache *a2, uint64_t a3, BOOL *a4)
{
  if (a2 < this) {
    return 0LL;
  }
  int64_t v5 = a2 - this + *(void *)((char *)this + *((unsigned int *)this + 4));
  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  char v11 = 0;
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  v7[2] = ___ZNK15DyldSharedCache7inCacheEPKvmRb_block_invoke;
  void v7[3] = &unk_1896306A8;
  v7[4] = &v8;
  v7[5] = v5;
  void v7[6] = a3;
  void v7[7] = a4;
  DyldSharedCache::forEachRange((char *)this, (uint64_t)v7, 0LL);
  BOOL v4 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t ___ZNK15DyldSharedCache7inCacheEPKvmRb_block_invoke( uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, _BYTE *a9)
{
  unint64_t v9 = *(void *)(result + 40);
  if (v9 >= a3 && *(void *)(result + 48) + v9 < a4 + a3)
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
    **(_BYTE **)(result + 56) = (a8 & 2) == 0;
    *a9 = 1;
  }

  return result;
}

BOOL DyldSharedCache::isSubCachePath(DyldSharedCache *this, const char *a2)
{
  unint64_t v2 = strchr((const char *)this, 46);
  return v2 && strcmp(v2, ".development");
}

uint64_t dyld_process_create_for_task(lsl::Allocator *a1, int *a2)
{
  unsigned int v3 = a1;
  BOOL v4 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(a1);
  int64_t v5 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v4);
  uint64_t v6 = (dyld4::FileManager *)defaultFileManager(void)::sFileManager;
  uint64_t v7 = (dyld4::Atlas::Process *)lsl::Allocator::aligned_alloc((lsl::Lock **)v4, 8uLL, 0x90uLL);
  return dyld4::Atlas::Process::Process(v7, v5, v6, v3, a2);
}

uint64_t dyld_process_create_for_current_task()
{
  return dyld_process_create_for_task((lsl::Allocator *)*MEMORY[0x1895FFD48], 0LL);
}

void dyld_process_dispose(dyld4::Atlas::Process *a1)
{
  if (a1)
  {
    dyld4::Atlas::Process::~Process(a1);
    lsl::Allocator::freeObject(v1, v2);
  }

uint64_t dyld_process_register_for_image_notifications(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v5 = 0;
  if (!a2) {
    a2 = &v5;
  }
  return dyld4::Atlas::Process::registerAtlasChangedEventHandler(a1, (uint64_t)a2, a3, a4);
}

uint64_t dyld_process_register_for_event_notification(uint64_t a1, int *a2, int a3, uint64_t a4, uint64_t a5)
{
  int v6 = 0;
  if (!a2) {
    a2 = &v6;
  }
  return dyld4::Atlas::Process::registerEventHandler(a1, (uint64_t)a2, a3, a4, a5);
}

lsl::Allocator *dyld_process_snapshot_create_for_process( dyld4::Atlas::Process *a1, int *a2, uint64_t a3, uint64_t a4)
{
  BOOL v4 = v7;
  uint64_t v7 = 0LL;
  lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v7, v5);
  return v4;
}

void *dyld_process_snapshot_create_from_data(lsl::AllocatorLayout *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v22[1] = *(lsl::Allocator **)MEMORY[0x1895FEE08];
  if (a3) {
    dyld_process_snapshot_create_from_data_cold_2();
  }
  if (a4) {
    dyld_process_snapshot_create_from_data_cold_1();
  }
  uint64_t v6 = lsl::AllocatorLayout::minSize(a1);
  uint64_t v10 = (lsl::AllocatorLayout *)MEMORY[0x1895FE128](v6, v7, v8, v9);
  char v11 = (lsl::Allocator *)((char *)v22 - (((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  unint64_t v12 = (char *)lsl::AllocatorLayout::minSize(v10);
  unint64_t v16 = (lsl::Allocator *)lsl::Allocator::stackAllocatorInternal(v11, v12, v13, v14, v15);
  uint64_t v17 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v16);
  uint64_t v18 = defaultFileManager(void)::sFileManager;
  uint64_t v19 = lsl::Allocator::aligned_alloc(v17, 8uLL, 0x70uLL);
  dyld4::Atlas::ProcessSnapshot::ProcessSnapshot(v19, v16, v18, 0LL, a1, a2);
  v22[0] = 0LL;
  lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(v22, v20);
  lsl::Allocator::~Allocator(v16);
  return v19;
}

lsl::Allocator **dyld_process_snapshot_dispose(dyld4::Atlas::ProcessSnapshot *a1)
{
  uint64_t result = (lsl::Allocator **)dyld4::Atlas::ProcessSnapshot::valid(a1);
  if ((_DWORD)result)
  {
    BOOL v4 = a1;
    return lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v4, v3);
  }

  return result;
}

void *dyld_process_snapshot_for_each_image(dyld4::Atlas::ProcessSnapshot *a1, uint64_t a2)
{
  uint64_t result = (void *)dyld4::Atlas::ProcessSnapshot::valid(a1);
  if ((_DWORD)result)
  {
    v6[0] = MEMORY[0x1895FED80];
    v6[1] = 0x40000000LL;
    v6[2] = __dyld_process_snapshot_for_each_image_block_invoke;
    void v6[3] = &unk_1896306D0;
    v6[4] = a2;
    return dyld4::Atlas::ProcessSnapshot::forEachImage((uint64_t)a1, (uint64_t)v6, v5);
  }

  return result;
}

uint64_t __dyld_process_snapshot_for_each_image_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t dyld_process_snapshot_get_shared_cache(dyld4::Atlas::ProcessSnapshot *a1)
{
  else {
    return 0LL;
  }
}

__n128 dyld_shared_cache_copy_uuid(dyld4::Atlas::SharedCache *a1, __n128 *a2)
{
  unsigned int v3 = (__n128 *)dyld4::Atlas::SharedCache::uuid(a1);
  __n128 result = *v3;
  *a2 = *v3;
  return result;
}

void dyld_shared_cache_for_each_image(void *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = __dyld_shared_cache_for_each_image_block_invoke;
  v2[3] = &unk_1896306F8;
  v2[4] = a2;
  dyld4::Atlas::SharedCache::forEachImage(a1, (uint64_t)v2);
}

uint64_t __dyld_shared_cache_for_each_image_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void dyld_for_each_installed_shared_cache_with_system_path(lsl::AllocatorLayout *a1, uint64_t a2)
{
  v15[5] = *MEMORY[0x1895FEE08];
  uint64_t v4 = lsl::AllocatorLayout::minSize(a1);
  uint64_t v8 = (lsl::AllocatorLayout *)MEMORY[0x1895FE128](v4, v5, v6, v7);
  uint64_t v9 = (lsl::Allocator *)((char *)v15 - (((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v10 = (char *)lsl::AllocatorLayout::minSize(v8);
  char v14 = (lsl::Allocator *)lsl::Allocator::stackAllocatorInternal(v9, v10, v11, v12, v13);
  v15[0] = MEMORY[0x1895FED80];
  v15[1] = 0x40000000LL;
  void v15[2] = __dyld_for_each_installed_shared_cache_with_system_path_block_invoke;
  v15[3] = &unk_189630720;
  _OWORD v15[4] = a2;
  dyld4::Atlas::SharedCache::forEachInstalledCacheWithSystemPath( (uint64_t)v14,  defaultFileManager(void)::sFileManager,  (uint64_t)a1,  (uint64_t)v15);
  lsl::Allocator::~Allocator(v14);
}

uint64_t __dyld_for_each_installed_shared_cache_with_system_path_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void dyld_for_each_installed_shared_cache(lsl::AllocatorLayout *a1)
{
  v13[5] = *MEMORY[0x1895FEE08];
  uint64_t v2 = lsl::AllocatorLayout::minSize(a1);
  uint64_t v6 = (lsl::AllocatorLayout *)MEMORY[0x1895FE128](v2, v3, v4, v5);
  uint64_t v7 = (lsl::Allocator *)((char *)v13 - (((unint64_t)v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v8 = (char *)lsl::AllocatorLayout::minSize(v6);
  unint64_t v12 = (lsl::Allocator *)lsl::Allocator::stackAllocatorInternal(v7, v8, v9, v10, v11);
  v13[0] = MEMORY[0x1895FED80];
  v13[1] = 0x40000000LL;
  v13[2] = __dyld_for_each_installed_shared_cache_block_invoke;
  v13[3] = &unk_189630748;
  v13[4] = a1;
  dyld4::Atlas::SharedCache::forEachInstalledCacheWithSystemPath( (uint64_t)v12,  defaultFileManager(void)::sFileManager,  (uint64_t)"/",  (uint64_t)v13);
  lsl::Allocator::~Allocator(v12);
}

uint64_t __dyld_for_each_installed_shared_cache_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL dyld_shared_cache_for_file(lsl::AllocatorLayout *a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1895FEE08];
  uint64_t v4 = lsl::AllocatorLayout::minSize(a1);
  uint64_t v8 = (lsl::AllocatorLayout *)MEMORY[0x1895FE128](v4, v5, v6, v7);
  uint64_t v9 = (lsl::Allocator *)&v20[-(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v10 = (char *)lsl::AllocatorLayout::minSize(v8);
  char v14 = (lsl::Lock **)lsl::Allocator::stackAllocatorInternal(v9, v10, v11, v12, v13);
  dyld4::FileManager::fileRecordForPath( (dyld4::FileManager *)defaultFileManager(void)::sFileManager,  v14,  (const char *)a1,  (uint64_t)v20);
  dyld4::Atlas::SharedCache::createForFileRecord((dyld4::Atlas::Mapper *)v14, (lsl::Allocator *)v20, v15, &v19);
  uint64_t v17 = v19;
  if (v19) {
    (*(void (**)(uint64_t, lsl::Allocator *))(a2 + 16))(a2, v19);
  }
  lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr(&v19, v16);
  dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v20);
  lsl::Allocator::~Allocator((lsl::Allocator *)v14);
  return v17 != 0LL;
}

uint64_t dyld_image_copy_uuid(dyld4::Atlas::Image *a1, __int128 *a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  uint64_t v3 = (__int128 *)dyld4::Atlas::Image::uuid(a1);
  __int128 v7 = *v3;
  if (!(_BYTE)v7)
  {
    unint64_t v4 = 0LL;
    do
    {
      unint64_t v5 = v4;
      if (v4 == 15) {
        break;
      }
      ++v4;
    }

    while (!*((_BYTE *)&v7 + v5 + 1));
    if (v5 > 0xE) {
      return 0LL;
    }
  }

  *a2 = *v3;
  return 1LL;
}

BOOL dyld_image_local_nlist_content_4Symbolication(dyld4::Atlas::Image *a1, uint64_t a2)
{
  unint64_t v4 = (dyld4::Atlas::SharedCache *)dyld4::Atlas::Image::sharedCache(a1);
  if (!v4) {
    return 0LL;
  }
  uint64_t v25 = 0LL;
  __int128 v26 = &v25;
  uint64_t v27 = 0x2000000000LL;
  char v28 = 1;
  dyld4::Atlas::SharedCache::localSymbols(v4, (unsigned int ***)&v24);
  if (v24)
  {
    uint64_t v5 = dyld4::Atlas::Image::sharedCacheVMOffset(a1);
    uint64_t v6 = dyld4::Atlas::SharedCacheLocals::localInfo(v24);
    int v7 = dyld4::Atlas::SharedCacheLocals::use64BitDylibOffsets(v24);
    v16[0] = MEMORY[0x1895FED80];
    v16[1] = 0x40000000LL;
    uint64_t v17 = __dyld_image_local_nlist_content_4Symbolication_block_invoke;
    uint64_t v18 = &unk_189630770;
    uint64_t v21 = v5;
    unsigned int v22 = a1;
    uint64_t v23 = v6;
    uint64_t v19 = a2;
    uint64_t v20 = &v25;
    uint64_t v8 = *(unsigned int *)(v6 + 16);
    if (v7)
    {
      char v29 = 0;
      if (*(_DWORD *)(v6 + 20))
      {
        unint64_t v9 = 0LL;
        uint64_t v10 = (unsigned int *)(v8 + v6 + 12);
        do
        {
          v17((dyld4::Atlas::Image **)v16, *(dyld4::Atlas::Image **)(v10 - 3), *(v10 - 1), *v10, &v29);
          if (v29) {
            break;
          }
          v10 += 4;
          ++v9;
        }

        while (v9 < *(unsigned int *)(v6 + 20));
      }
    }

    else
    {
      char v29 = 0;
      if (*(_DWORD *)(v6 + 20))
      {
        unint64_t v13 = 0LL;
        char v14 = (unsigned int *)(v8 + v6 + 8);
        do
        {
          v17((dyld4::Atlas::Image **)v16, (dyld4::Atlas::Image *)*(v14 - 2), *(v14 - 1), *v14, &v29);
          if (v29) {
            break;
          }
          v14 += 3;
          ++v13;
        }

        while (v13 < *(unsigned int *)(v6 + 20));
      }
    }

    int v12 = *((unsigned __int8 *)v26 + 24);
    lsl::UniquePtr<dyld4::Atlas::SharedCacheLocals>::~UniquePtr(&v24);
  }

  else
  {
    lsl::UniquePtr<dyld4::Atlas::SharedCacheLocals>::~UniquePtr(&v24);
    int v12 = *((unsigned __int8 *)v26 + 24);
  }

  BOOL v11 = v12 != 0;
  _Block_object_dispose(&v25, 8);
  return v11;
}

dyld4::Atlas::Image **__dyld_image_local_nlist_content_4Symbolication_block_invoke( dyld4::Atlas::Image **result, dyld4::Atlas::Image *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (result[6] == a2)
  {
    uint64_t v6 = result;
    if (dyld4::Atlas::Image::pointerSize(result[7]) == 8
      || (__n128 result = (dyld4::Atlas::Image **)dyld4::Atlas::Image::pointerSize(v6[7]), (_DWORD)result == 4))
    {
      __n128 result = (dyld4::Atlas::Image **)(*((uint64_t (**)(void))v6[4] + 2))();
    }

    else
    {
      *(_BYTE *)(*((void *)v6[5] + 1) + 24LL) = 0;
    }

    *a5 = 1;
  }

  return result;
}

uint64_t ___ZL18defaultFileManagerv_block_invoke(lsl::Allocator *a1)
{
  uint64_t v1 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(a1);
  uint64_t v2 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v1);
  uint64_t v3 = lsl::Allocator::aligned_alloc((lsl::Lock **)v1, 8uLL, 0x20uLL);
  uint64_t result = dyld4::FileManager::FileManager((uint64_t)v3, v2, 0LL);
  defaultFileManager(void)::sFileManager = result;
  return result;
}

lsl::Allocator **lsl::UniquePtr<dyld4::Atlas::SharedCacheLocals>::~UniquePtr(lsl::Allocator **a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v2 + 8);
    if (*(void *)v2) {
      lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(*(lsl::Allocator **)v2, v3);
    }
    lsl::Allocator::freeObject(*a1, v3);
  }

  return a1;
}

uint64_t lsl::readPVLEUInt64(unsigned __int8 **a1)
{
  uint64_t __dst = 0LL;
  uint64_t v2 = *a1;
  unsigned int v3 = **a1;
  unsigned int v4 = __clz(__rbit32(v3));
  if (**a1) {
    BOOL v5 = v4 == 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t result = *(void *)(v2 + 1);
    uint64_t v7 = (uint64_t)(a1[1] - 9);
    *a1 = v2 + 9;
    a1[1] = (unsigned __int8 *)v7;
  }

  else
  {
    uint64_t v8 = v4 + 1;
    char v9 = 7 - v4;
    uint64_t v10 = (v3 >> (v4 + 1)) & ~(-1 << (7 - v4));
    if (v4)
    {
      memcpy(&__dst, v2 + 1, v8 - 1);
      uint64_t v11 = __dst;
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    uint64_t result = (v11 << v9) | v10;
    int v12 = &a1[1][-v8];
    *a1 = &v2[v8];
    a1[1] = v12;
  }

  return result;
}

__n128 tlv_get_addr(uint64_t a1, __n128 result)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!*(void *)((_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) & 0xFFFFFFFFFFFFFFF8LL) + 8 * v2))
  {
    __n128 v3 = result;
    instantiateTLVs_thunk(v2);
    return v3;
  }

  return result;
}

void RemoteBuffer::RemoteBuffer(RemoteBuffer *this)
{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  *((_DWORD *)this + 4) = 0;
}

_BYTE *RemoteBuffer::create@<X0>( RemoteBuffer *this@<X0>, mach_vm_address_t a2@<X1>, mach_vm_size_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  vm_map_read_t v8 = this;
  uint64_t result = RemoteBuffer::map((vm_map_read_t)this, a2, a3);
  if (v11)
  {
    if (!a4 || (uint64_t result = RemoteBuffer::map(v8, a2, 4096 - (a2 & 0xFFF)), v11))
    {
      *(void *)a5 = 0LL;
      *(void *)(a5 + 8) = 0LL;
      *(_DWORD *)(a5 + 16) = v11;
      return result;
    }

    *(void *)a5 = result;
    *(void *)(a5 + 8) = 4096 - (a2 & 0xFFF);
  }

  else
  {
    *(void *)a5 = result;
    *(void *)(a5 + 8) = a3;
  }

  *(_DWORD *)(a5 + 16) = 0;
  return result;
}

_BYTE *RemoteBuffer::map(vm_map_read_t src_task, mach_vm_address_t src_address, mach_vm_size_t a3)
{
  vm_prot_t cur_protection = 0;
  vm_prot_t v10 = 1;
  if (!a3) {
    return 0LL;
  }
  mach_vm_address_t target_address = 0LL;
  unsigned int v4 = (unsigned int *)MEMORY[0x1895FFD48];
  if (mach_vm_remap_new( *MEMORY[0x1895FFD48],  &target_address,  a3,  0LL,  97,  src_task,  src_address,  1,  &cur_protection,  &v10,  2u))
  {
    return 0LL;
  }

  uint64_t v6 = malloc(a3 + 1);
  BOOL v5 = v6;
  if (v6)
  {
    mach_vm_address_t v7 = target_address;
    memcpy(v6, (const void *)target_address, a3);
    v5[a3] = 0;
    MEMORY[0x186DF7B88](*v4, v7, a3);
  }

  else
  {
    MEMORY[0x186DF7B88](*v4, target_address, a3);
  }

  return v5;
}

void RemoteBuffer::~RemoteBuffer(void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    free(v1);
  }
}

void withRemoteBuffer( RemoteBuffer *a1, mach_vm_address_t a2, mach_vm_size_t a3, int a4, _DWORD *a5, uint64_t a6)
{
  int v8 = v11;
  if (a5) {
    *a5 = v11;
  }
  char v9 = v10[0];
  if (v8)
  {
    if (!v10[0]) {
      return;
    }
    goto LABEL_5;
  }

  (*(void (**)(uint64_t, void *, void *))(a6 + 16))(a6, v10[0], v10[1]);
  if (v9) {
LABEL_5:
  }
    free(v9);
}

void dyld_process_info_base::dyld_process_info_base( dyld_process_info_base *this, int a2, int a3, int a4, uint64_t a5)
{
  *(_OWORD *)this = xmmword_1801C2B80;
  *((_DWORD *)this + 4) = 192;
  unsigned int v5 = 40 * a3 + 192;
  *((_DWORD *)this + 5) = v5;
  unsigned int v6 = v5 + 56 * a4;
  if (__CFADD__(v5, 56 * a4)) {
    dyld_process_info_base::dyld_process_info_base();
  }
  *((_DWORD *)this + 6) = v6;
  *((void *)this + 4) = a5;
  *((_DWORD *)this + 10) = a2;
  *((void *)this + 6) = (char *)this + 192;
  *((void *)this + 7) = (char *)this + 192;
  mach_vm_address_t v7 = (char *)this + v5;
  *((void *)this + 8) = v7;
  *((void *)this + 9) = v7;
  int v8 = (char *)this + v6;
  *((void *)this + 10) = v8;
  *((void *)this + 11) = v8;
  *((_DWORD *)this + 24) = 0;
  *((void *)this + 13) = (char *)this + a5;
}

const char *dyld_process_info_base::addString(dyld_process_info_base *this, const char *__s1, size_t __n)
{
  size_t v5 = strnlen(__s1, __n);
  size_t v6 = v5 + 1;
  unint64_t v7 = *((void *)this + 4);
  BOOL v8 = v7 >= v5 + 1;
  unint64_t v9 = v7 - (v5 + 1);
  if (!v8) {
    return "";
  }
  *((void *)this + 4) = v9;
  int v11 = (char *)(*((void *)this + 13) + ~v5);
  *((void *)this + 13) = v11;
  strlcpy(v11, __s1, v6);
  return (const char *)*((void *)this + 13);
}

uint64_t dyld_process_info_base::copyPath( dyld_process_info_base *this, RemoteBuffer *a2, int *a3, mach_vm_address_t a4)
{
  uint64_t v7 = 0LL;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  vm_prot_t v10 = "";
  v6[0] = MEMORY[0x1895FED80];
  v6[1] = 0x40000000LL;
  v6[2] = ___ZN22dyld_process_info_base8copyPathEjPiy_block_invoke;
  void v6[3] = &unk_1896307D8;
  v6[4] = &v7;
  void v6[5] = this;
  withRemoteBuffer(a2, a4, 0x400uLL, 1, a3, (uint64_t)v6);
  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

const char *___ZN22dyld_process_info_base8copyPathEjPiy_block_invoke(uint64_t a1, const char *a2, size_t a3)
{
  uint64_t result = dyld_process_info_base::addString(*(dyld_process_info_base **)(a1 + 40), a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t dyld_process_info_base::addImage( dyld_process_info_base *this, RemoteBuffer *a2, int a3, DyldSharedCache *a4, unint64_t a5, mach_header *a6, DyldSharedCache *a7, const char *__s1, unsigned int a9)
{
  char v14 = this;
  int v22 = 0;
  BOOL v21 = 0;
  uint64_t v15 = *((void *)this + 7);
  *(void *)(v15 + 16) = a6;
  *(_DWORD *)(v15 + 32) = *((_DWORD *)this + 24);
  if (__s1)
  {
    unint64_t v16 = __s1;
LABEL_3:
    uint64_t v17 = dyld_process_info_base::addString(this, v16, 0x400uLL);
LABEL_4:
    *(void *)(*((void *)v14 + 7) + 24LL) = v17;
    goto LABEL_5;
  }

  if (a4)
  {
    if (a3)
    {
      if (DyldSharedCache::inCache(a4, a7, 1LL, &v21))
      {
        uint64_t v17 = (const char *)a7;
        if (v21) {
          goto LABEL_4;
        }
      }
    }
  }

  if (!a7)
  {
    unint64_t v16 = "/<unknown>";
    this = v14;
    goto LABEL_3;
  }

  uint64_t v17 = (const char *)dyld_process_info_base::copyPath(v14, a2, &v22, (mach_vm_address_t)a7);
  *(void *)(*((void *)v14 + 7) + 24LL) = v17;
  uint64_t Commands = v22;
  if (v22) {
    return Commands;
  }
LABEL_5:
  checkPath(v17, (uint64_t)a7, a9);
  if (a4 && a3 && DyldSharedCache::inCache(a4, (DyldSharedCache *)a6, 0x8000LL, &v21))
  {
    dyld_process_info_base::addInfoFromLoadCommands((const char *)v14, a6);
    uint64_t Commands = v22;
LABEL_10:
    uint64_t v19 = *((void *)v14 + 7);
    *(_DWORD *)(v19 + 36) = *((_DWORD *)v14 + 24) - *(_DWORD *)(v19 + 32);
    *((void *)v14 + 7) = v19 + 40;
    return Commands;
  }

  uint64_t Commands = dyld_process_info_base::addInfoFromRemoteLoadCommands(v14, a2, (mach_vm_address_t)a6);
  if (!(_DWORD)Commands) {
    goto LABEL_10;
  }
  return Commands;
}

const char *checkPath(const char *result, uint64_t a2, int a3)
{
  uint64_t v12 = *MEMORY[0x1895FEE08];
  if (*result != 47)
  {
    __n128 v3 = result;
    snprintf(sCrashReporterInfo, 0x1000uLL, "dyld: found non-UTF8 string on image[%d]: 0x%llx [ ", a3, a2);
    size_t v4 = strnlen(v3, 8uLL);
    if (v4)
    {
      size_t v5 = v4;
      do
      {
        unsigned int v7 = *(unsigned __int8 *)v3++;
        unsigned int v6 = v7;
        if (v7 >= 0xA0) {
          char v8 = 87;
        }
        else {
          char v8 = 48;
        }
        __source[0] = v8 + (v6 >> 4);
        unsigned int v9 = v6 & 0xF;
        if (v9 >= 0xA) {
          char v10 = 87;
        }
        else {
          char v10 = 48;
        }
        __source[1] = v10 + v9;
        __source[2] = 0;
        strlcat(sCrashReporterInfo, __source, 0x1000uLL);
        strlcat(sCrashReporterInfo, " ", 0x1000uLL);
        --v5;
      }

      while (v5);
    }

    uint64_t result = (const char *)strlcat(sCrashReporterInfo, " ]\n", 0x1000uLL);
    qword_18C50BF08 = (uint64_t)sCrashReporterInfo;
  }

  return result;
}

const char *dyld_process_info_base::addInfoFromLoadCommands(const char *this, const mach_header *a2)
{
  uint64_t v3 = (uint64_t)this;
  if (a2->magic == -17958193)
  {
    uint64_t v4 = 32LL;
  }

  else
  {
    if (a2->magic != -17958194) {
      return this;
    }
    uint64_t v4 = 28LL;
  }

  if (a2->ncmds)
  {
    uint32_t v5 = 0;
    unsigned int v6 = (char *)a2 + v4;
    unsigned int v7 = (char *)a2 + v4 + a2->sizeofcmds;
    char v8 = (char *)a2 + v4;
    do
    {
      uint64_t v9 = *((unsigned int *)v8 + 1);
      char v10 = &v8[v9];
      BOOL v12 = v9 >= 8 && v10 <= v7 && v10 >= v6;
      if (!v12) {
        return this;
      }
      int v13 = *(_DWORD *)v8;
      if (*(_DWORD *)v8 == 1)
      {
        unint64_t v14 = *(void *)(v3 + 32);
        BOOL v12 = v14 >= 0x18;
        unint64_t v15 = v14 - 24;
        if (!v12) {
          return this;
        }
        *(void *)(v3 + 32) = v15;
        this = dyld_process_info_base::copySegmentName((dyld_process_info_base *)v3, v8 + 8);
        uint64_t v16 = *(void *)(v3 + 88);
        *(void *)uint64_t v16 = this;
        uint64_t v17 = *((void *)v8 + 3);
        *(void *)&__int128 v18 = v17;
        *((void *)&v18 + 1) = HIDWORD(v17);
        __int128 v19 = v18;
      }

      else
      {
        if (v13 != 25)
        {
          if (v13 == 27) {
            *(_OWORD *)*(void *)(v3 + 56) = *(_OWORD *)(v8 + 8);
          }
          goto LABEL_26;
        }

        unint64_t v20 = *(void *)(v3 + 32);
        BOOL v12 = v20 >= 0x18;
        unint64_t v21 = v20 - 24;
        if (!v12) {
          return this;
        }
        *(void *)(v3 + 32) = v21;
        this = dyld_process_info_base::copySegmentName((dyld_process_info_base *)v3, v8 + 8);
        uint64_t v16 = *(void *)(v3 + 88);
        *(void *)uint64_t v16 = this;
        __int128 v19 = *(_OWORD *)(v8 + 24);
      }

      *(_OWORD *)(v16 + 8) = v19;
      *(void *)(v3 + 88) = v16 + 24;
      ++*(_DWORD *)(v3 + 96);
LABEL_26:
      ++v5;
      char v8 = v10;
    }

    while (v5 < a2->ncmds);
  }

  return this;
}

uint64_t dyld_process_info_base::addInfoFromRemoteLoadCommands( dyld_process_info_base *this, RemoteBuffer *a2, mach_vm_address_t a3)
{
  unsigned int v20 = 0;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  uint64_t v19 = 0LL;
  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  char v15 = 0;
  uint64_t v6 = MEMORY[0x1895FED80];
  v11[0] = MEMORY[0x1895FED80];
  v11[1] = 0x40000000LL;
  v11[2] = ___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke;
  void v11[3] = &unk_189630800;
  v11[6] = this;
  void v11[7] = a3;
  void v11[4] = &v16;
  void v11[5] = &v12;
  withRemoteBuffer(a2, a3, 0x1000uLL, 1, &v20, (uint64_t)v11);
  if (!*((_BYTE *)v13 + 24))
  {
    uint64_t v7 = v20;
    if (v20) {
      goto LABEL_4;
    }
    mach_vm_size_t v9 = v17[3];
    v10[0] = v6;
    v10[1] = 0x40000000LL;
    vm_address_t v10[2] = ___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke_2;
    void v10[3] = &__block_descriptor_tmp_4_0;
    void v10[4] = this;
    v10[5] = a3;
    withRemoteBuffer(a2, a3, v9, 0, &v20, (uint64_t)v10);
  }

  uint64_t v7 = v20;
LABEL_4:
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

const char *___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke( const char *result, const mach_header *a2, unint64_t a3)
{
  if (a3 >= 0x1D)
  {
    uint64_t v3 = result;
    uint64_t result = (const char *)*((void *)result + 6);
    *(void *)(*(void *)(*((void *)v3 + 4) + 8LL) + 24LL) = a2->sizeofcmds + 28LL;
    if (*(void *)(*(void *)(*((void *)v3 + 4) + 8LL) + 24LL) <= a3)
    {
      uint64_t result = dyld_process_info_base::addInfoFromLoadCommands(result, a2);
      *(_BYTE *)(*(void *)(*((void *)v3 + 5) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

const char *___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke_2( uint64_t a1, const mach_header *a2)
{
  return dyld_process_info_base::addInfoFromLoadCommands(*(const char **)(a1 + 32), a2);
}

uint64_t dyld_process_info_base::addDyldImage( dyld_process_info_base *this, RemoteBuffer *a2, mach_vm_address_t a3, mach_vm_address_t a4, const char *__s1)
{
  int v13 = 0;
  uint64_t v9 = *((void *)this + 7);
  *(void *)(v9 + 16) = a3;
  *(_DWORD *)(v9 + 32) = *((_DWORD *)this + 24);
  if (__s1)
  {
    char v10 = dyld_process_info_base::addString(this, __s1, 0x400uLL);
    *(void *)(*((void *)this + 7) + 24LL) = v10;
  }

  else
  {
    char v10 = (const char *)dyld_process_info_base::copyPath(this, a2, &v13, a4);
    *(void *)(*((void *)this + 7) + 24LL) = v10;
    uint64_t result = v13;
    if (v13) {
      return result;
    }
  }

  checkPath(v10, a4, -1);
  uint64_t result = dyld_process_info_base::addInfoFromRemoteLoadCommands(this, a2, a3);
  if (!(_DWORD)result)
  {
    uint64_t v12 = *((void *)this + 7);
    *(_DWORD *)(v12 + 36) = *((_DWORD *)this + 24) - *(_DWORD *)(v12 + 32);
    *((void *)this + 7) = v12 + 40;
  }

  return result;
}

const char *dyld_process_info_base::copySegmentName(dyld_process_info_base *this, const char *__s1)
{
  uint64_t v4 = "__TEXT";
  uint32_t v5 = off_189630848;
  while (strcmp(__s1, v4))
  {
    uint64_t v6 = *v5++;
    uint64_t v4 = v6;
    if (!v6) {
      return dyld_process_info_base::addString(this, __s1, 0x10uLL);
    }
  }

  return v4;
}

void *dyld_process_info_base::forEachSegment(void *result, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = result[6];
  unint64_t v3 = result[7];
  if (v4 < v3)
  {
    uint64_t v7 = result;
    while (*(void *)(v4 + 16) != a2)
    {
      v4 += 40LL;
      if (v4 >= v3) {
        return result;
      }
    }

    uint64_t v8 = *(unsigned int *)(v4 + 36);
    if ((_DWORD)v8)
    {
      uint64_t v9 = result[10];
      unsigned int v10 = *(_DWORD *)(v4 + 32);
      while (1)
      {
        unsigned int v11 = v10;
        unsigned int v10 = v11 + 1;
        if (!--v8)
        {
          uint64_t v12 = 0LL;
          goto LABEL_12;
        }
      }

      uint64_t v12 = a2 - *(void *)(v9 + 24LL * v11 + 8);
LABEL_12:
      unsigned int v13 = 0;
      do
      {
        uint64_t v14 = (void *)(v7[10] + 24LL * (v13 + *(_DWORD *)(v4 + 32)));
        uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, void, void))(a3 + 16))( a3,  v14[1] + v12,  v14[2],  *v14);
        ++v13;
      }

      while (v13 < *(_DWORD *)(v4 + 36));
    }
  }

  return result;
}

uint64_t _dyld_process_info_create(RemoteBuffer *a1, uint64_t a2, unsigned int *a3)
{
  kern_return_t v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  mach_msg_type_number_t v12;
  integer_t v13[4];
  int v14;
  void v15[7];
  __int128 v16;
  int v17;
  int v18;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  int v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2000000000LL;
  __int128 v26 = 0LL;
  int v22 = 0;
  if (a3) {
    uint32_t v5 = a3;
  }
  else {
    uint32_t v5 = (unsigned int *)&v22;
  }
  *uint32_t v5 = 0;
  mach_msg_type_number_t task_info_outCnt = 5;
  uint64_t v6 = task_info((task_name_t)a1, 0x11u, task_info_out, &task_info_outCnt);
  if (v6)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = v6 | 0xFF000000;
LABEL_6:
    *uint32_t v5 = v8;
    goto LABEL_14;
  }

  if (!*(void *)task_info_out)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = -33554427;
    goto LABEL_6;
  }

  uint64_t v9 = 10;
  unsigned int v10 = MEMORY[0x1895FED80];
  do
  {
    v15[0] = v10;
    v15[1] = 0x40000000LL;
    void v15[2] = ___dyld_process_info_create_block_invoke;
    v15[3] = &unk_189630898;
    uint64_t v16 = *(_OWORD *)task_info_out;
    uint64_t v17 = v21;
    uint64_t v18 = (int)a1;
    v15[5] = a2;
    void v15[6] = v5;
    _OWORD v15[4] = &v23;
    withRemoteBuffer(a1, *(mach_vm_address_t *)task_info_out, *(mach_vm_size_t *)&task_info_out[2], 0, v5, (uint64_t)v15);
    if (!*v5) {
      break;
    }
    uint64_t v12 = 5;
    if (!task_info((task_name_t)a1, 0x11u, v13, &v12))
    {
      *(_OWORD *)task_info_out = *(_OWORD *)v13;
      unint64_t v21 = v14;
    }

    --v9;
  }

  while (v9);
  uint64_t v7 = v24[3];
LABEL_14:
  _Block_object_dispose(&v23, 8);
  return v7;
}

void ___dyld_process_info_create_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 72)) {
    dyld_process_info_base::make<dyld_all_image_infos_64,dyld_image_info_64>( (RemoteBuffer *)*(unsigned int *)(a1 + 76),  a2,  *(void *)(a1 + 40),  *(int **)(a1 + 48),  &v6);
  }
  else {
    dyld_process_info_base::make<dyld_all_image_infos_32,dyld_image_info_32>( (RemoteBuffer *)*(unsigned int *)(a1 + 76),  a2,  *(void *)(a1 + 40),  *(int **)(a1 + 48),  &v6);
  }
  uint64_t v3 = v6;
  if (v6)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint32_t v5 = *(void **)(v4 + 24);
    if (v5)
    {
      free(v5);
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    }

    *(void *)(v4 + 24) = v3;
  }

void dyld_process_info_base::make<dyld_all_image_infos_32,dyld_image_info_32>( RemoteBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, void *a5@<X8>)
{
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3002000000LL;
  uint64_t v38 = __Block_byref_object_copy__5;
  int v39 = __Block_byref_object_dispose__5;
  char v40 = 0LL;
  if (*(_DWORD *)a2 <= 0xEu)
  {
    int v7 = 5;
LABEL_3:
    *a4 = v7;
LABEL_4:
    *a5 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = atomic_load((unint64_t *)(a2 + 104));
  if (v10
    && ((unsigned int v11 = atomic_load((unsigned int *)(a2 + 8))) != 0
     || (unsigned int v23 = *(_DWORD *)(a2 + 100)) == 0
     || *(_DWORD *)(a2 + 20) <= v23))
  {
    if (a3)
    {
      unint64_t v12 = atomic_load((unint64_t *)(a2 + 104));
      if (v12 == a3)
      {
        *a4 = 0;
        goto LABEL_4;
      }
    }

    unint64_t v13 = atomic_load((unint64_t *)(a2 + 104));
    mach_vm_address_t v14 = atomic_load((unsigned int *)(a2 + 8));
    if (!(_DWORD)v14)
    {
      usleep(0xC350u);
      int v7 = 19;
      goto LABEL_3;
    }

    if (*(_DWORD *)(a2 + 4) >= 0x2000u) {
      int v15 = 0x2000;
    }
    else {
      int v15 = *(_DWORD *)(a2 + 4);
    }
    uint64_t v34 = 0LL;
    uint64_t shared_cache_range = _dyld_get_shared_cache_range((uint64_t)&v34);
    uint64_t v17 = (char *)v34 + shared_cache_range;
    uint64_t v18 = MEMORY[0x1895FED80];
    v31[0] = MEMORY[0x1895FED80];
    v31[1] = 0x40000000LL;
    if (!shared_cache_range) {
      uint64_t v17 = 0LL;
    }
    v31[2] = ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_3218dyld_image_info_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke;
    void v31[3] = &unk_1896308C0;
    v31[4] = &v35;
    v31[5] = a2;
    v31[6] = a4;
    v31[7] = v13;
    int v32 = v15;
    int v33 = (int)a1;
    void v31[8] = shared_cache_range;
    v31[9] = v17;
    withRemoteBuffer(a1, v14, (12 * v15), 0, a4, (uint64_t)v31);
    mach_vm_address_t v19 = atomic_load((unint64_t *)(a2 + 184));
    unsigned int v20 = v36;
    if (v19 && v36[5])
    {
      uint64_t v21 = *(unsigned int *)(a2 + 180);
      v29[0] = v18;
      v29[1] = 0x40000000LL;
      v29[2] = ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_3218dyld_image_info_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke_2;
      void v29[3] = &unk_1896308E8;
      int v30 = v21;
      v29[4] = &v35;
      v29[5] = a4;
      withRemoteBuffer(a1, v19, 56 * v21, 0, a4, (uint64_t)v29);
      unsigned int v20 = v36;
    }

    uint64_t v22 = v20[5];
  }

  else
  {
    uint64_t v24 = atomic_load((unint64_t *)(a2 + 104));
    dyld_process_info_base::makeSuspended<dyld_all_image_infos_32>(a1, a2, v24, a4, (dyld_process_info_base **)&v34);
    uint64_t v25 = v34;
    uint64_t v34 = 0LL;
    __int128 v26 = (void *)v36[5];
    void v36[5] = (uint64_t)v25;
    if (v26)
    {
      free(v26);
      uint64_t v27 = v34;
      uint64_t v34 = 0LL;
      if (v27) {
        free(v27);
      }
    }

    unsigned int v20 = v36;
    uint64_t v22 = v36[5];
    if (!v22)
    {
      usleep(0xC350u);
      if (*a4) {
        goto LABEL_4;
      }
      int v7 = 6;
      goto LABEL_3;
    }
  }

  v20[5] = 0LL;
  *a5 = v22;
LABEL_27:
  _Block_object_dispose(&v35, 8);
  char v28 = v40;
  char v40 = 0LL;
  if (v28) {
    free(v28);
  }
}

void dyld_process_info_base::make<dyld_all_image_infos_64,dyld_image_info_64>( RemoteBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, void *a5@<X8>)
{
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3002000000LL;
  uint64_t v38 = __Block_byref_object_copy__5;
  int v39 = __Block_byref_object_dispose__5;
  char v40 = 0LL;
  if (*(_DWORD *)a2 <= 0xEu)
  {
    int v7 = 5;
LABEL_3:
    *a4 = v7;
LABEL_4:
    *a5 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = atomic_load((unint64_t *)(a2 + 184));
  if (v10
    && ((unint64_t v11 = atomic_load((unint64_t *)(a2 + 8))) != 0
     || (unint64_t v23 = *(void *)(a2 + 176)) == 0
     || *(void *)(a2 + 32) <= v23))
  {
    if (a3)
    {
      unint64_t v12 = atomic_load((unint64_t *)(a2 + 184));
      if (v12 == a3)
      {
        *a4 = 0;
        goto LABEL_4;
      }
    }

    unint64_t v13 = atomic_load((unint64_t *)(a2 + 184));
    mach_vm_address_t v14 = atomic_load((unint64_t *)(a2 + 8));
    if (!v14)
    {
      usleep(0xC350u);
      int v7 = 19;
      goto LABEL_3;
    }

    if (*(_DWORD *)(a2 + 4) >= 0x2000u) {
      int v15 = 0x2000;
    }
    else {
      int v15 = *(_DWORD *)(a2 + 4);
    }
    uint64_t v34 = 0LL;
    uint64_t shared_cache_range = _dyld_get_shared_cache_range((uint64_t)&v34);
    uint64_t v17 = (char *)v34 + shared_cache_range;
    uint64_t v18 = MEMORY[0x1895FED80];
    v31[0] = MEMORY[0x1895FED80];
    v31[1] = 0x40000000LL;
    if (!shared_cache_range) {
      uint64_t v17 = 0LL;
    }
    v31[2] = ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_6418dyld_image_info_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke;
    void v31[3] = &unk_189630960;
    v31[6] = shared_cache_range;
    v31[7] = a4;
    v31[4] = &v35;
    v31[5] = a2;
    int v32 = v15;
    int v33 = (int)a1;
    void v31[8] = v13;
    v31[9] = v17;
    withRemoteBuffer(a1, v14, (24 * v15), 0, a4, (uint64_t)v31);
    mach_vm_address_t v19 = atomic_load((unint64_t *)(a2 + 328));
    unsigned int v20 = v36;
    if (v19 && v36[5])
    {
      uint64_t v21 = *(unsigned int *)(a2 + 324);
      v29[0] = v18;
      v29[1] = 0x40000000LL;
      v29[2] = ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_6418dyld_image_info_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke_2;
      void v29[3] = &unk_189630988;
      int v30 = v21;
      v29[4] = &v35;
      v29[5] = a4;
      withRemoteBuffer(a1, v19, 56 * v21, 0, a4, (uint64_t)v29);
      unsigned int v20 = v36;
    }

    uint64_t v22 = v20[5];
  }

  else
  {
    uint64_t v24 = atomic_load((unint64_t *)(a2 + 184));
    dyld_process_info_base::makeSuspended<dyld_all_image_infos_64>(a1, a2, v24, a4, (dyld_process_info_base **)&v34);
    uint64_t v25 = v34;
    uint64_t v34 = 0LL;
    __int128 v26 = (void *)v36[5];
    void v36[5] = (uint64_t)v25;
    if (v26)
    {
      free(v26);
      uint64_t v27 = v34;
      uint64_t v34 = 0LL;
      if (v27) {
        free(v27);
      }
    }

    unsigned int v20 = v36;
    uint64_t v22 = v36[5];
    if (!v22)
    {
      usleep(0xC350u);
      if (*a4) {
        goto LABEL_4;
      }
      int v7 = 6;
      goto LABEL_3;
    }
  }

  v20[5] = 0LL;
  *a5 = v22;
LABEL_27:
  _Block_object_dispose(&v35, 8);
  char v28 = v40;
  char v40 = 0LL;
  if (v28) {
    free(v28);
  }
}

__n128 _dyld_process_info_get_state(uint64_t a1, __n128 *a2)
{
  uint64_t v2 = (__n128 *)(a1 + *(unsigned int *)(a1 + 12));
  __n128 result = *v2;
  a2[1].n128_u64[0] = v2[1].n128_u64[0];
  *a2 = result;
  return result;
}

__n128 _dyld_process_info_get_cache(uint64_t a1, _OWORD *a2)
{
  uint64_t v2 = a1 + *(unsigned int *)(a1 + 4);
  __n128 result = *(__n128 *)v2;
  __int128 v4 = *(_OWORD *)(v2 + 16);
  *a2 = *(_OWORD *)v2;
  a2[1] = v4;
  return result;
}

__n128 _dyld_process_info_get_aot_cache(uint64_t a1, __n128 *a2)
{
  uint64_t v2 = (__n128 *)(a1 + *(unsigned int *)(a1 + 8));
  __n128 result = *v2;
  a2[1].n128_u64[0] = v2[1].n128_u64[0];
  *a2 = result;
  return result;
}

unsigned int *_dyld_process_info_retain(unsigned int *result)
{
  do
    unsigned int v1 = __ldaxr(result);
  while (__stlxr(v1 + 1, result));
  return result;
}

uint64_t _dyld_process_info_get_platform(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

void _dyld_process_info_release(void *a1)
{
  do
  {
    unsigned int v1 = __ldaxr((unsigned int *)a1);
    unsigned int v2 = v1 - 1;
  }

  while (__stlxr(v2, (unsigned int *)a1));
  if (!v2) {
    free(a1);
  }
}

uint64_t _dyld_process_info_for_each_image(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(result + 48);
  if (v2 < *(void *)(result + 56))
  {
    uint64_t v4 = result;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, void, unint64_t, void))(a2 + 16))( a2,  *(void *)(v2 + 16),  v2,  *(void *)(v2 + 24));
      v2 += 40LL;
    }

    while (v2 < *(void *)(v4 + 56));
  }

  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  *(void *)(result + 40) = v2;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0LL;
  if (v2) {
    free(v2);
  }
}

void dyld_process_info_base::makeSuspended<dyld_all_image_infos_32>( RemoteBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X3>, dyld_process_info_base **a5@<X8>)
{
  kern_return_t v10;
  kern_return_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  unsigned int v15;
  unsigned int *v16;
  kern_return_t v17;
  int v18;
  dyld_process_info_base *v19;
  dyld_process_info_base *v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  char *v25;
  void *v26;
  unint64_t v27;
  char *v28;
  uint64_t *v29;
  mach_vm_address_t v30;
  int v31;
  mach_header *v32;
  int v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void v37[10];
  int v38;
  mach_msg_type_number_t infoCnt;
  mach_port_t object_name;
  int info[9];
  mach_vm_address_t address;
  mach_vm_size_t size;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  mach_vm_size_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  mach_vm_address_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  int v63;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[12];
  int x;
  void v67[5];
  mach_vm_size_t kcd_size[97];
  mach_vm_address_t kcd_addr_begin[131];
  kcd_addr_begin[129] = *MEMORY[0x1895FEE08];
  unint64_t v10 = pid_for_task((mach_port_name_t)a1, &x);
  *a4 = v10;
  if (v10) {
    goto LABEL_5;
  }
  mach_msg_type_number_t task_info_outCnt = 12;
  unint64_t v11 = task_info((task_name_t)a1, 0x14u, task_info_out, &task_info_outCnt);
  *a4 = v11;
  if (v11)
  {
    unint64_t v12 = -67108861;
LABEL_4:
    *a4 = v12;
LABEL_5:
    *a5 = 0LL;
    return;
  }

  if (!task_info_out[11])
  {
    kcd_addr_begin[0] = 0LL;
    kcd_size[0] = 0LL;
    uint64_t v16 = (unsigned int *)MEMORY[0x1895FFD48];
    uint64_t v17 = task_map_corpse_info_64(*MEMORY[0x1895FFD48], (task_t)a1, kcd_addr_begin, kcd_size);
    *a4 = v17;
    if (v17)
    {
      unint64_t v12 = v17 & 0xFFFFFF | 0xFB000000;
      goto LABEL_4;
    }

    MEMORY[0x186DF7B88](*v16, kcd_addr_begin[0], kcd_size[0]);
  }

  uint64_t v35 = a2;
  uint64_t v36 = a3;
  __int128 v60 = 0LL;
  __int128 v61 = &v60;
  __int128 v62 = 0x2000000000LL;
  __int16 v63 = 0;
  __int16 v56 = 0LL;
  unsigned __int8 v57 = &v56;
  uint64_t v58 = 0x2000000000LL;
  __int128 v59 = 0LL;
  unsigned __int8 v52 = 0LL;
  uint64_t v53 = &v52;
  __int128 v54 = 0x2000000000LL;
  uint64_t v55 = 0LL;
  uint64_t v48 = 0LL;
  uint64_t v49 = &v48;
  __int128 v50 = 0x2000000000LL;
  __int16 v51 = kcd_addr_begin;
  int v44 = 0LL;
  int v45 = &v44;
  uint64_t v46 = 0x2000000000LL;
  char v47 = kcd_size;
  LOBYTE(kcd_addr_begin[0]) = 0;
  LOBYTE(kcd_size[0]) = 0;
  address = 0LL;
  infoCnt = 9;
  if (!mach_vm_region((vm_map_read_t)a1, &address, &size, 10, info, &infoCnt, &object_name))
  {
    unint64_t v13 = MEMORY[0x1895FED80];
    do
    {
      if (info[0] == 5)
      {
        v37[0] = v13;
        v37[1] = 0x40000000LL;
        v37[2] = ___ZN22dyld_process_info_base13makeSuspendedI23dyld_all_image_infos_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke;
        v37[3] = &unk_189630910;
        uint64_t v38 = x;
        v37[4] = &v56;
        v37[5] = &v44;
        v37[6] = &v60;
        v37[7] = &v52;
        v37[8] = &v48;
        v37[9] = address;
        v67[0] = v13;
        v67[1] = 0x40000000LL;
        v67[2] = ___Z16withRemoteObjectI14mach_header_64EvjyPiU13block_pointerFvT_E_block_invoke;
        v67[3] = &unk_189630938;
        v67[4] = v37;
        withRemoteBuffer(a1, address, 0x20uLL, 0, 0LL, (uint64_t)v67);
      }

      address += size;
      infoCnt = 9;
    }

    while (!mach_vm_region((vm_map_read_t)a1, &address, &size, 10, info, &infoCnt, &object_name));
  }

  mach_vm_address_t v14 = v61;
  if (v53[3])
  {
    int v15 = *((_DWORD *)v61 + 6);
  }

  else
  {
    v53[3] = *(unsigned int *)(a2 + 20);
    strcpy((char *)kcd_addr_begin, "/usr/lib/dyld");
    int v15 = *((_DWORD *)v14 + 6) + 1;
  }

  if (v15 >= 0x2000) {
    uint64_t v18 = 0x2000;
  }
  else {
    uint64_t v18 = v15;
  }
  *((_DWORD *)v14 + 6) = v18;
  mach_vm_address_t v19 = (dyld_process_info_base *)malloc((1304 * v18 + 192));
  if (!v19)
  {
    *a4 = -100663293;
    *a5 = 0LL;
    goto LABEL_34;
  }

  unsigned int v20 = v19;
  dyld_process_info_base::dyld_process_info_base(v19, 0, v18, 0, (1304 * v18 + 192));
  uint64_t v22 = *(void *)(v21 + 32);
  unint64_t v23 = v22 >= 0xC0;
  uint64_t v24 = v22 - 192;
  if (v23) {
    *((void *)v20 + 4) = v24;
  }
  uint64_t v25 = (char *)v20 + *((unsigned int *)v20 + 1);
  bzero(v25, 0x10uLL);
  *((void *)v25 + 2) = 0LL;
  *((_WORD *)v25 + 12) = 1;
  __int128 v26 = (void *)((char *)v20 + *((unsigned int *)v20 + 2));
  bzero(v26, 0x10uLL);
  v26[2] = 0LL;
  char v28 = (char *)v20 + *((unsigned int *)v20 + 3);
  *(void *)char v28 = v36;
  char v29 = v61;
  *((_DWORD *)v28 + 2) = *((_DWORD *)v61 + 6);
  *((_DWORD *)v28 + 3) = *((_DWORD *)v29 + 6);
  v28[16] = 0;
  int v30 = v53[3];
  if (v30 && (__int128 v31 = dyld_process_info_base::addDyldImage(v20, a1, v30, 0LL, (const char *)v49[3]), (*a4 = v31) != 0)
    || (int v32 = (mach_header *)v57[3]) != 0LL
    && (int v33 = dyld_process_info_base::addImage(v20, a1, 0, 0LL, v27, v32, 0LL, (const char *)v45[3], 0), (*a4 = v33) != 0))
  {
LABEL_33:
    *a5 = 0LL;
    free(v20);
    goto LABEL_34;
  }

  uint64_t v34 = atomic_load((unint64_t *)(v35 + 104));
  if (v34 != v36)
  {
    *a4 = 18;
    goto LABEL_33;
  }

  *a5 = v20;
LABEL_34:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
}

void ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_3218dyld_image_info_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  int v6 = *(_DWORD *)(v4 + 100)
    && *(void *)(qword_18C3D4008 + 176)
    && !*(_BYTE *)(v4 + 16)
    && !*(_BYTE *)(qword_18C3D4008 + 24)
    && (*(void *)(qword_18C3D4008 + 160) == *(void *)(v4 + 84)
      ? (BOOL v5 = *(void *)(qword_18C3D4008 + 168) == *(void *)(v4 + 92))
      : (BOOL v5 = 0),
        v5)
    && *(void *)(qword_18C3D4008 + 152) == *(_DWORD *)(v4 + 80);
  uint64_t v7 = (*(_DWORD *)(a1 + 80) + 1);
  uint64_t v8 = *(unsigned int *)(v4 + 180);
  uint64_t v9 = 56 * v8;
  unint64_t v10 = 40LL * (*(_DWORD *)(a1 + 80) + 1);
  uint64_t v11 = v10 + 240LL * v7 + ((_DWORD)v7 << 10) + v9 + 32960;
  unint64_t v12 = (dyld_process_info_base *)malloc(v11);
  if (!v12)
  {
    **(_DWORD **)(a1 + 48) = 3;
    uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 8LL);
    unint64_t v13 = *(dyld_process_info_base **)(v35 + 40);
    *(void *)(v35 + 40) = 0LL;
    if (!v13) {
      return;
    }
LABEL_48:
    free(v13);
    return;
  }

  unint64_t v13 = v12;
  dyld_process_info_base::dyld_process_info_base(v12, *(_DWORD *)(v4 + 176), v7, v8, v11);
  unint64_t v16 = *(void *)(v15 + 32);
  if (v16 <= 0xBF)
  {
    BOOL v17 = v16 >= v10;
  }

  else
  {
    v16 -= 192LL;
    BOOL v17 = 1;
  }

  if (v17)
  {
    if (v16 < v10) {
      uint64_t v18 = 0LL;
    }
    else {
      uint64_t v18 = 8 * (v7 + 4LL * v7);
    }
    *((void *)v13 + 4) = v16 - v18;
  }

  uint64_t v19 = 0LL;
  unsigned int v20 = (char *)v13 + *((unsigned int *)v13 + 1);
  uint64_t v21 = *(void *)(a1 + 40);
  *(_OWORD *)unsigned int v20 = *(_OWORD *)(v21 + 84);
  *((void *)v20 + 2) = *(unsigned int *)(v21 + 100);
  v20[25] = *(_BYTE *)(v21 + 16);
  v20[24] = 1;
  do
  {
    if (v20[v19]) {
      v20[24] = 0;
    }
    ++v19;
  }

  while (v19 != 16);
  uint64_t v22 = (char *)v13 + *((unsigned int *)v13 + 2);
  *(_OWORD *)uint64_t v22 = *(_OWORD *)(v21 + 208);
  *((void *)v22 + 2) = *(void *)(v21 + 200);
  unint64_t v23 = (char *)v13 + *((unsigned int *)v13 + 3);
  *(void *)unint64_t v23 = *(void *)(a1 + 56);
  int v24 = *(_DWORD *)(v21 + 60);
  *((_DWORD *)v23 + 2) = v7;
  *((_DWORD *)v23 + 3) = v24 + 1;
  v23[16] = 16;
  if (*(_BYTE *)(v21 + 17))
  {
    if (v24 == *(_DWORD *)(a1 + 80)) {
      char v25 = 48;
    }
    else {
      char v25 = 80;
    }
    v23[16] = v25;
  }

  if (*(_DWORD *)(v21 + 32))
  {
    if (*(_DWORD *)(v21 + 36)) {
      char v26 = 32;
    }
    else {
      char v26 = 96;
    }
    v23[16] = v26;
  }

  mach_vm_address_t v27 = *(unsigned int *)(v21 + 112);
  if ((_DWORD)v27)
  {
    int v28 = dyld_process_info_base::addDyldImage( v13,  (RemoteBuffer *)*(unsigned int *)(a1 + 84),  *(unsigned int *)(v21 + 20),  v27,  0LL);
    char v29 = *(_DWORD **)(a1 + 48);
    *char v29 = v28;
    if (v28) {
      goto LABEL_44;
    }
  }

  if (*(_DWORD *)(a1 + 80))
  {
    uint64_t v30 = 0LL;
    __int128 v31 = (unsigned int *)(a2 + 4);
    do
    {
      int v32 = dyld_process_info_base::addImage( v13,  (RemoteBuffer *)*(unsigned int *)(a1 + 84),  v6,  *(DyldSharedCache **)(a1 + 64),  v14,  (mach_header *)*(v31 - 1),  (DyldSharedCache *)*v31,  0LL,  v30);
      **(_DWORD **)(a1 + 48) = v32;
      if (v32) {
        goto LABEL_45;
      }
      v31 += 3;
    }

    while (++v30 < (unint64_t)*(unsigned int *)(a1 + 80));
  }

  if (*((void *)v13 + 13) < *((void *)v13 + 11))
  {
    char v29 = *(_DWORD **)(a1 + 48);
LABEL_44:
    *char v29 = 5;
LABEL_45:
    uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = 0LL;
    if (v34) {
      free(v34);
    }
    goto LABEL_48;
  }

  uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v37 = *(dyld_process_info_base **)(v36 + 40);
  *(void *)(v36 + 40) = v13;
  unint64_t v13 = v37;
  if (v37) {
    goto LABEL_48;
  }
}

void ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_3218dyld_image_info_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke_2( uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v2 = 0LL;
    for (unint64_t i = (_OWORD *)(a2 + 24); ; unint64_t i = (_OWORD *)((char *)i + 56))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      __int128 v5 = *(_OWORD *)((char *)i - 24);
      uint64_t v6 = *((void *)i - 1);
      __int128 v11 = *i;
      __int128 v12 = i[1];
      unint64_t v7 = *(void *)(v4 + 32);
      if (v7 <= 0x37) {
        break;
      }
      *(void *)(v4 + 32) = v7 - 56;
      uint64_t v8 = *(void *)(v4 + 72);
      *(_OWORD *)uint64_t v8 = v5;
      *(_OWORD *)(v8 + 24) = v11;
      *(void *)(v8 + 16) = v6;
      *(_OWORD *)(v8 + 40) = v12;
      *(void *)(v4 + 72) += 56LL;
      **(_DWORD **)(a1 + 40) = 0;
    }

    **(_DWORD **)(a1 + 40) = 3;
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    unint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0LL;
    if (v10) {
      free(v10);
    }
  }

uint64_t ___ZN22dyld_process_info_base13makeSuspendedI23dyld_all_image_infos_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke( uint64_t result, _DWORD *a2)
{
  if (*a2 >> 1 == 2138504551)
  {
    uint64_t v2 = (void *)result;
    int v3 = a2[3];
    if (v3 == 7)
    {
      *(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL) = *(void *)(result + 72);
      __n128 result = proc_regionfilename( *(_DWORD *)(result + 80),  *(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL),  *(void **)(*(void *)(*(void *)(result + 64) + 8LL) + 24LL),  0x400u);
    }

    else
    {
      if (v3 != 2) {
        return result;
      }
      *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *(void *)(result + 72);
      __n128 result = proc_regionfilename( *(_DWORD *)(result + 80),  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL),  *(void **)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL),  0x400u);
    }

    ++*(_DWORD *)(*(void *)(v2[6] + 8LL) + 24LL);
  }

  return result;
}

uint64_t ___Z16withRemoteObjectI14mach_header_64EvjyPiU13block_pointerFvT_E_block_invoke( uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  __int128 v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return (*(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v4 + 16))(v4, v7, a3, a4);
}

void dyld_process_info_base::makeSuspended<dyld_all_image_infos_64>( RemoteBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X3>, dyld_process_info_base **a5@<X8>)
{
  kern_return_t v10;
  kern_return_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  unsigned int v15;
  unsigned int *v16;
  kern_return_t v17;
  int v18;
  dyld_process_info_base *v19;
  dyld_process_info_base *v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  char *v25;
  void *v26;
  unint64_t v27;
  char *v28;
  uint64_t *v29;
  mach_vm_address_t v30;
  int v31;
  mach_header *v32;
  int v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void v37[10];
  int v38;
  mach_msg_type_number_t infoCnt;
  mach_port_t object_name;
  int info[9];
  mach_vm_address_t address;
  mach_vm_size_t size;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  mach_vm_size_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  mach_vm_address_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  int v63;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[12];
  int x;
  void v67[5];
  mach_vm_size_t kcd_size[97];
  mach_vm_address_t kcd_addr_begin[131];
  kcd_addr_begin[129] = *MEMORY[0x1895FEE08];
  unint64_t v10 = pid_for_task((mach_port_name_t)a1, &x);
  *a4 = v10;
  if (v10) {
    goto LABEL_5;
  }
  mach_msg_type_number_t task_info_outCnt = 12;
  __int128 v11 = task_info((task_name_t)a1, 0x14u, task_info_out, &task_info_outCnt);
  *a4 = v11;
  if (v11)
  {
    __int128 v12 = -67108861;
LABEL_4:
    *a4 = v12;
LABEL_5:
    *a5 = 0LL;
    return;
  }

  if (!task_info_out[11])
  {
    kcd_addr_begin[0] = 0LL;
    kcd_size[0] = 0LL;
    unint64_t v16 = (unsigned int *)MEMORY[0x1895FFD48];
    BOOL v17 = task_map_corpse_info_64(*MEMORY[0x1895FFD48], (task_t)a1, kcd_addr_begin, kcd_size);
    *a4 = v17;
    if (v17)
    {
      __int128 v12 = v17 & 0xFFFFFF | 0xFB000000;
      goto LABEL_4;
    }

    MEMORY[0x186DF7B88](*v16, kcd_addr_begin[0], kcd_size[0]);
  }

  uint64_t v35 = a2;
  uint64_t v36 = a3;
  __int128 v60 = 0LL;
  __int128 v61 = &v60;
  __int128 v62 = 0x2000000000LL;
  __int16 v63 = 0;
  __int16 v56 = 0LL;
  unsigned __int8 v57 = &v56;
  uint64_t v58 = 0x2000000000LL;
  __int128 v59 = 0LL;
  unsigned __int8 v52 = 0LL;
  uint64_t v53 = &v52;
  __int128 v54 = 0x2000000000LL;
  uint64_t v55 = 0LL;
  uint64_t v48 = 0LL;
  uint64_t v49 = &v48;
  __int128 v50 = 0x2000000000LL;
  __int16 v51 = kcd_addr_begin;
  int v44 = 0LL;
  int v45 = &v44;
  uint64_t v46 = 0x2000000000LL;
  char v47 = kcd_size;
  LOBYTE(kcd_addr_begin[0]) = 0;
  LOBYTE(kcd_size[0]) = 0;
  address = 0LL;
  infoCnt = 9;
  if (!mach_vm_region((vm_map_read_t)a1, &address, &size, 10, info, &infoCnt, &object_name))
  {
    unint64_t v13 = MEMORY[0x1895FED80];
    do
    {
      if (info[0] == 5)
      {
        v37[0] = v13;
        v37[1] = 0x40000000LL;
        v37[2] = ___ZN22dyld_process_info_base13makeSuspendedI23dyld_all_image_infos_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke;
        v37[3] = &unk_1896309B0;
        uint64_t v38 = x;
        v37[4] = &v56;
        v37[5] = &v44;
        v37[6] = &v60;
        v37[7] = &v52;
        v37[8] = &v48;
        v37[9] = address;
        v67[0] = v13;
        v67[1] = 0x40000000LL;
        v67[2] = ___Z16withRemoteObjectI14mach_header_64EvjyPiU13block_pointerFvT_E_block_invoke;
        v67[3] = &unk_189630938;
        v67[4] = v37;
        withRemoteBuffer(a1, address, 0x20uLL, 0, 0LL, (uint64_t)v67);
      }

      address += size;
      infoCnt = 9;
    }

    while (!mach_vm_region((vm_map_read_t)a1, &address, &size, 10, info, &infoCnt, &object_name));
  }

  unint64_t v14 = v61;
  if (v53[3])
  {
    uint64_t v15 = *((_DWORD *)v61 + 6);
  }

  else
  {
    v53[3] = *(void *)(a2 + 32);
    strcpy((char *)kcd_addr_begin, "/usr/lib/dyld");
    uint64_t v15 = *((_DWORD *)v14 + 6) + 1;
  }

  if (v15 >= 0x2000) {
    uint64_t v18 = 0x2000;
  }
  else {
    uint64_t v18 = v15;
  }
  *((_DWORD *)v14 + 6) = v18;
  uint64_t v19 = (dyld_process_info_base *)malloc((1304 * v18 + 192));
  if (!v19)
  {
    *a4 = -100663293;
    *a5 = 0LL;
    goto LABEL_34;
  }

  unsigned int v20 = v19;
  dyld_process_info_base::dyld_process_info_base(v19, 0, v18, 0, (1304 * v18 + 192));
  uint64_t v22 = *(void *)(v21 + 32);
  unint64_t v23 = v22 >= 0xC0;
  int v24 = v22 - 192;
  if (v23) {
    *((void *)v20 + 4) = v24;
  }
  char v25 = (char *)v20 + *((unsigned int *)v20 + 1);
  bzero(v25, 0x10uLL);
  *((void *)v25 + 2) = 0LL;
  *((_WORD *)v25 + 12) = 1;
  char v26 = (void *)((char *)v20 + *((unsigned int *)v20 + 2));
  bzero(v26, 0x10uLL);
  v26[2] = 0LL;
  int v28 = (char *)v20 + *((unsigned int *)v20 + 3);
  *(void *)int v28 = v36;
  char v29 = v61;
  *((_DWORD *)v28 + 2) = *((_DWORD *)v61 + 6);
  *((_DWORD *)v28 + 3) = *((_DWORD *)v29 + 6);
  v28[16] = 0;
  uint64_t v30 = v53[3];
  if (v30 && (__int128 v31 = dyld_process_info_base::addDyldImage(v20, a1, v30, 0LL, (const char *)v49[3]), (*a4 = v31) != 0)
    || (int v32 = (mach_header *)v57[3]) != 0LL
    && (uint64_t v33 = dyld_process_info_base::addImage(v20, a1, 0, 0LL, v27, v32, 0LL, (const char *)v45[3], 0), (*a4 = v33) != 0))
  {
LABEL_33:
    *a5 = 0LL;
    free(v20);
    goto LABEL_34;
  }

  uint64_t v34 = atomic_load((unint64_t *)(v35 + 184));
  if (v34 != v36)
  {
    *a4 = 18;
    goto LABEL_33;
  }

  *a5 = v20;
LABEL_34:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
}

void ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_6418dyld_image_info_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!*(void *)(v4 + 176)
    || !*(void *)(qword_18C3D4008 + 176)
    || *(_BYTE *)(v4 + 24)
    || *(_BYTE *)(qword_18C3D4008 + 24)
    || (*(void *)(qword_18C3D4008 + 160) == *(void *)(v4 + 160)
      ? (BOOL v5 = *(void *)(qword_18C3D4008 + 168) == *(void *)(v4 + 168))
      : (BOOL v5 = 0),
        !v5))
  {
    BOOL v6 = 0;
LABEL_10:
    unsigned int v7 = *(_DWORD *)(a1 + 80) + 1;
    unsigned int v8 = v7;
    goto LABEL_11;
  }

  uint64_t v39 = *(void *)(qword_18C3D4008 + 152);
  uint64_t v40 = *(void *)(v4 + 152);
  BOOL v6 = v39 == v40;
  int v41 = *(DyldSharedCache **)(a1 + 48);
  if (v39 != v40 || v41 == 0LL) {
    goto LABEL_10;
  }
  BOOL v48 = 0;
  if (*(_DWORD *)(a1 + 80))
  {
    unint64_t v43 = 0LL;
    unsigned int v8 = 0;
    int v44 = (DyldSharedCache **)(a2 + 8);
    do
    {
      int v45 = *v44;
      v44 += 3;
      int v46 = !DyldSharedCache::inCache(v41, v45, 1LL, &v48);
      if (!v48) {
        int v46 = 1;
      }
      v8 += v46;
      ++v43;
      unint64_t v47 = *(unsigned int *)(a1 + 80);
    }

    while (v43 < v47);
    uint64_t v4 = *(void *)(a1 + 40);
    unsigned int v7 = v47 + 1;
  }

  else
  {
    unsigned int v8 = 0;
    unsigned int v7 = 1;
  }

  BOOL v6 = 1;
LABEL_11:
  uint64_t v9 = *(unsigned int *)(v4 + 324);
  uint64_t v10 = 56 * v9;
  uint64_t v11 = (v8 << 10) + 40LL * v7 + 240LL * v7 + v10 + 32960;
  __int128 v12 = (dyld_process_info_base *)malloc(v11);
  if (!v12)
  {
    **(_DWORD **)(a1 + 56) = 3;
    uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 8LL);
    unint64_t v13 = *(dyld_process_info_base **)(v36 + 40);
    *(void *)(v36 + 40) = 0LL;
    if (!v13) {
      return;
    }
    goto LABEL_49;
  }

  unint64_t v13 = v12;
  unint64_t v14 = 40LL * v7;
  dyld_process_info_base::dyld_process_info_base(v12, *(_DWORD *)(v4 + 320), v7, v9, v11);
  unint64_t v17 = *(void *)(v16 + 32);
  if (v17 <= 0xBF)
  {
    BOOL v18 = v17 >= v14;
  }

  else
  {
    v17 -= 192LL;
    BOOL v18 = 1;
  }

  if (v18)
  {
    if (v17 < v14) {
      uint64_t v19 = 0LL;
    }
    else {
      uint64_t v19 = 40LL * v7;
    }
    *((void *)v13 + 4) = v17 - v19;
  }

  uint64_t v20 = 0LL;
  uint64_t v21 = (char *)v13 + *((unsigned int *)v13 + 1);
  uint64_t v22 = *(void *)(a1 + 40);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)(v22 + 160);
  *((void *)v21 + 2) = *(void *)(v22 + 176);
  v21[25] = *(_BYTE *)(v22 + 24);
  v21[24] = 1;
  do
  {
    if (v21[v20]) {
      v21[24] = 0;
    }
    ++v20;
  }

  while (v20 != 16);
  unint64_t v23 = (char *)v13 + *((unsigned int *)v13 + 2);
  *(_OWORD *)unint64_t v23 = *(_OWORD *)(v22 + 352);
  *((void *)v23 + 2) = *(void *)(v22 + 344);
  int v24 = (char *)v13 + *((unsigned int *)v13 + 3);
  *(void *)int v24 = *(void *)(a1 + 64);
  uint64_t v25 = *(void *)(v22 + 112);
  *((_DWORD *)v24 + 2) = v7;
  *((_DWORD *)v24 + 3) = v25 + 1;
  v24[16] = 16;
  if (*(_BYTE *)(v22 + 25))
  {
    if (v25 == *(_DWORD *)(a1 + 80)) {
      char v26 = 48;
    }
    else {
      char v26 = 80;
    }
    v24[16] = v26;
  }

  if (*(void *)(v22 + 56))
  {
    if (*(void *)(v22 + 64)) {
      char v27 = 32;
    }
    else {
      char v27 = 96;
    }
    v24[16] = v27;
  }

  mach_vm_address_t v28 = *(void *)(v22 + 192);
  if (v28)
  {
    int v29 = dyld_process_info_base::addDyldImage( v13,  (RemoteBuffer *)*(unsigned int *)(a1 + 84),  *(void *)(v22 + 32),  v28,  0LL);
    uint64_t v30 = *(_DWORD **)(a1 + 56);
    *uint64_t v30 = v29;
    if (v29) {
      goto LABEL_45;
    }
  }

  if (*(_DWORD *)(a1 + 80))
  {
    uint64_t v31 = 0LL;
    int v32 = (DyldSharedCache **)(a2 + 8);
    do
    {
      int v33 = dyld_process_info_base::addImage( v13,  (RemoteBuffer *)*(unsigned int *)(a1 + 84),  v6,  *(DyldSharedCache **)(a1 + 48),  v15,  (mach_header *)*(v32 - 1),  *v32,  0LL,  v31);
      **(_DWORD **)(a1 + 56) = v33;
      if (v33) {
        goto LABEL_46;
      }
      v32 += 3;
    }

    while (++v31 < (unint64_t)*(unsigned int *)(a1 + 80));
  }

  if (*((void *)v13 + 13) < *((void *)v13 + 11))
  {
    uint64_t v30 = *(_DWORD **)(a1 + 56);
LABEL_45:
    *uint64_t v30 = 5;
LABEL_46:
    uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = 0LL;
    if (v35) {
      free(v35);
    }
    goto LABEL_49;
  }

  uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v38 = *(dyld_process_info_base **)(v37 + 40);
  *(void *)(v37 + 40) = v13;
  unint64_t v13 = v38;
  if (v38) {
LABEL_49:
  }
    free(v13);
}

void ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_6418dyld_image_info_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke_2( uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v2 = 0LL;
    for (unint64_t i = (_OWORD *)(a2 + 24); ; unint64_t i = (_OWORD *)((char *)i + 56))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      __int128 v5 = *(_OWORD *)((char *)i - 24);
      uint64_t v6 = *((void *)i - 1);
      __int128 v11 = *i;
      __int128 v12 = i[1];
      unint64_t v7 = *(void *)(v4 + 32);
      if (v7 <= 0x37) {
        break;
      }
      *(void *)(v4 + 32) = v7 - 56;
      uint64_t v8 = *(void *)(v4 + 72);
      *(_OWORD *)uint64_t v8 = v5;
      *(_OWORD *)(v8 + 24) = v11;
      *(void *)(v8 + 16) = v6;
      *(_OWORD *)(v8 + 40) = v12;
      *(void *)(v4 + 72) += 56LL;
      **(_DWORD **)(a1 + 40) = 0;
    }

    **(_DWORD **)(a1 + 40) = 3;
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0LL;
    if (v10) {
      free(v10);
    }
  }

uint64_t ___ZN22dyld_process_info_base13makeSuspendedI23dyld_all_image_infos_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke( uint64_t result, _DWORD *a2)
{
  if (*a2 >> 1 == 2138504551)
  {
    uint64_t v2 = (void *)result;
    int v3 = a2[3];
    if (v3 == 7)
    {
      *(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL) = *(void *)(result + 72);
      __n128 result = proc_regionfilename( *(_DWORD *)(result + 80),  *(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL),  *(void **)(*(void *)(*(void *)(result + 64) + 8LL) + 24LL),  0x400u);
    }

    else
    {
      if (v3 != 2) {
        return result;
      }
      *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *(void *)(result + 72);
      __n128 result = proc_regionfilename( *(_DWORD *)(result + 80),  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL),  *(void **)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL),  0x400u);
    }

    ++*(_DWORD *)(*(void *)(v2[6] + 8LL) + 24LL);
  }

  return result;
}

uint64_t lsl::CRC32c::CRC32c(uint64_t this)
{
  *(void *)this = &lsl::sCRC32cSW;
  *(_DWORD *)(this + 8) = -1;
  return this;
}

uint64_t lsl::CRC32c::operator unsigned int(uint64_t a1)
{
  return ~*(_DWORD *)(a1 + 8);
}

uint64_t lsl::CRC32c::operator()(unsigned int *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void, void, uint64_t))(**(void **)a1 + 16LL))(*(void *)a1, a1[2], a2);
  a1[2] = result;
  return result;
}

uint64_t lsl::CRC32c::operator()(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void, void, uint64_t, uint64_t))(**(void **)a1 + 32LL))( *(void *)a1,  a1[2],  a2,  a3);
  a1[2] = result;
  return result;
}

uint64_t lsl::CRC32cSW::checksum(lsl::CRC32cSW *this, unsigned int a2, char a3)
{
  return lsl::CRC32cSW::sCRC32cTable[(a2 ^ a3)] ^ (a2 >> 8);
}

uint64_t lsl::CRC32cSW::checksum(lsl::CRC32cSW *this, uint64_t a2, __int16 a3)
{
  __int16 v4 = a3;
  return (*(uint64_t (**)(lsl::CRC32cSW *, uint64_t, __int16 *, uint64_t))(*(void *)this + 32LL))( this,  a2,  &v4,  2LL);
}

uint64_t lsl::CRC32cSW::checksum(lsl::CRC32cSW *this, uint64_t a2, int a3)
{
  int v4 = a3;
  return (*(uint64_t (**)(lsl::CRC32cSW *, uint64_t, int *, uint64_t))(*(void *)this + 32LL))( this,  a2,  &v4,  4LL);
}

uint64_t lsl::CRC32cSW::checksum(lsl::CRC32cSW *this, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  return (*(uint64_t (**)(lsl::CRC32cSW *, uint64_t, uint64_t *, uint64_t))(*(void *)this + 32LL))( this,  a2,  &v4,  8LL);
}

uint64_t lsl::CRC32cSW::checksum(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  for (uint64_t result = a2; a4; --a4)
  {
    char v5 = *a3++;
    uint64_t result = lsl::CRC32cSW::sCRC32cTable[(v5 ^ result)] ^ (result >> 8);
  }

  return result;
}

uint64_t dyld3::open(dyld3 *this, const char *a2, uint64_t a3)
{
  int v4 = (int)a2;
  for (uint64_t result = open((const char *)this, (int)a2, a3); (_DWORD)result == -1; uint64_t result = open((const char *)this, v4, a3))
  {
    if (*__error() != 35 && *__error() != 4) {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

_DWORD *dyld3::FatFile::isFatFile(_DWORD *this, const void *a2)
{
  if ((*this | 0x1000000) != 0xBFBAFECA) {
    return 0LL;
  }
  return this;
}

BOOL dyld3::FatFile::isValidSlice( dyld3::FatFile *this, Diagnostics *a2, unint64_t a3, unsigned int a4, int a5, int a6, unint64_t a7, unint64_t a8)
{
  if (a3 < a7 || a3 - a7 < a8)
  {
    Diagnostics::error(a2, "slice %d extends beyond end of file");
  }

  else
  {
    __int128 v12 = (char *)this + a7;
    BOOL result = dyld3::MachOFile::isMachO((dyld3::FatFile *)((char *)this + a7), a2, a8);
    if (!result) {
      return result;
    }
    if (*((_DWORD *)v12 + 1) == a5)
    {
      int v14 = *((_DWORD *)v12 + 2);
      if (((v14 ^ a6) & 0xFFFFFF) != 0)
      {
        Diagnostics::error(a2, "cpu subtype in slice (0x%08X) does not match fat header (0x%08X)");
      }

      else
      {
        if (a5 == 33554444 || a5 == 16777228 || (uint64_t v15 = 4095LL, a5 == 12) && v14 == 12 && *((_DWORD *)v12 + 3) != 11) {
          uint64_t v15 = 0x3FFFLL;
        }
        if ((v15 & a7) == 0) {
          return 1LL;
        }
        if (!strncmp(v12, "!<arch>", 7uLL)) {
          Diagnostics::error(a2, "file is static library");
        }
        else {
          Diagnostics::error(a2, "slice is not page aligned");
        }
      }
    }

    else
    {
      Diagnostics::error(a2, "cpu type in slice (0x%08X) does not match fat header (0x%08X)");
    }
  }

  return 0LL;
}

BOOL dyld3::MachOFile::isMachO(dyld3::MachOFile *this, Diagnostics *a2, unint64_t a3)
{
  if (a3 <= 0x1B)
  {
    Diagnostics::error(a2, "MachO header exceeds file length");
    return 0LL;
  }

  int v4 = *(_DWORD *)this;
  if (*(_DWORD *)this >> 1 != 2138504551)
  {
    if ((v4 & 0xFEFFFFFF) != 0xCEFAEDFE) {
      Diagnostics::error(a2, "file does not start with MH_MAGIC[_64]");
    }
    return 0LL;
  }

  BOOL v5 = v4 == -17958193;
  uint64_t v6 = 28LL;
  if (v5) {
    uint64_t v6 = 32LL;
  }
  if (v6 + (unint64_t)*((unsigned int *)this + 5) > a3)
  {
    Diagnostics::error(a2, "load commands exceed length of first segment");
    return 0LL;
  }

  dyld3::MachOFile::forEachLoadCommand(this, a2, (uint64_t)&__block_literal_global_1);
  return Diagnostics::noError(a2);
}

void dyld3::FatFile::forEachSlice( dyld3::FatFile *this, Diagnostics *a2, unint64_t a3, int a4, uint64_t a5)
{
  if (*(_DWORD *)this == -1078264118)
  {
    unsigned int v10 = *((_DWORD *)this + 1);
    uint64_t v11 = bswap32(v10);
    if (v11 >= 0x80)
    {
      Diagnostics::error(a2, "fat header too large: %u entries", v11);
      return;
    }

    if (((32 * v11) | 8uLL) <= a3)
    {
      char v38 = 0;
      if (v10)
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = v11 - 1;
        uint64_t v21 = (char *)this + 12;
        do
        {
          uint64_t v22 = bswap32(*((_DWORD *)v21 - 1));
          uint64_t v23 = bswap32(*(_DWORD *)v21);
          unint64_t v24 = bswap64(*(void *)(v21 + 4));
          unint64_t v25 = bswap64(*(void *)(v21 + 12));
          if (!a4 || dyld3::FatFile::isValidSlice(this, a2, a3, v19, v22, v23, v24, v25)) {
            (*(void (**)(uint64_t, uint64_t, uint64_t, char *, unint64_t, char *))(a5 + 16))( a5,  v22,  v23,  (char *)this + v24,  v25,  &v38);
          }
          if (v38) {
            break;
          }
          v21 += 32;
        }

        while (v20 != v19++);
      }

      return;
    }

void dyld3::FatFile::forEachSlice(dyld3::FatFile *a1, Diagnostics *a2, unint64_t a3, uint64_t a4)
{
}

const char *dyld3::MachOFile::archName(dyld3::MachOFile *this, int a2)
{
  int v2 = (int)this;
  uint64_t v3 = 0LL;
  BOOL result = "unknown";
  while (LODWORD((&dyld3::MachOFile::_s_archInfos)[v3 + 1]) != v2
       || (a2 & 0xFFFFFF) != *((_DWORD *)&dyld3::MachOFile::_s_archInfos + 2 * v3 + 3))
  {
    v3 += 2LL;
    if (v3 == 26) {
      return result;
    }
  }

  return (&dyld3::MachOFile::_s_archInfos)[v3];
}

uint64_t dyld3::GradedArchs::grade(dyld3::GradedArchs *this, int a2, int a3, char a4)
{
  uint64_t v4 = 0LL;
  while (1)
  {
    int v5 = *(_DWORD *)((char *)this + v4);
    if (!v5) {
      return 0LL;
    }
    if (v5 == a2
      && *(_DWORD *)((char *)this + v4 + 4) == (a3 & 0xFFFFFF)
      && (!*((_BYTE *)this + v4 + 8) || (a4 & 1) != 0))
    {
      break;
    }

    v4 += 12LL;
    if (v4 == 48) {
      return 0LL;
    }
  }

  return *(unsigned __int16 *)((char *)this + v4 + 10);
}

void *dyld3::GradedArchs::forCurrentOS(dyld3::GradedArchs *this)
{
  return &dyld3::GradedArchs::arm64;
}

BOOL dyld3::MachOFile::cpuTypeFromArchName(dyld3::MachOFile *this, char *a2, int *a3, int *a4)
{
  uint64_t v7 = 0LL;
  while (1)
  {
    int v8 = strcmp((const char *)this, (&dyld3::MachOFile::_s_archInfos)[v7]);
    if (!v8) {
      break;
    }
    v7 += 2LL;
    if (v7 == 26) {
      return v8 == 0;
    }
  }

  *(_DWORD *)a2 = (&dyld3::MachOFile::_s_archInfos)[v7 + 1];
  *a3 = *((_DWORD *)&dyld3::MachOFile::_s_archInfos + 2 * v7 + 3);
  return v8 == 0;
}

BOOL dyld3::MachOFile::builtForPlatform(_DWORD *a1, int a2, int a3)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  char v17 = 0;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  char v13 = 0;
  v8[0] = MEMORY[0x1895FED80];
  v8[1] = 0x40000000LL;
  void v8[2] = ___ZNK5dyld39MachOFile16builtForPlatformENS_8PlatformEb_block_invoke;
  v8[3] = &unk_189630AE0;
  int v9 = a2;
  v8[4] = &v14;
  void v8[5] = &v10;
  dyld3::MachOFile::forEachSupportedPlatform(a1, (uint64_t)v8);
  if (!*((_BYTE *)v11 + 24) || (BOOL v6 = 0LL, !a3))
  {
    if (*((_BYTE *)v15 + 24))
    {
      BOOL v6 = 1LL;
    }

    else
    {
      BOOL v6 = 0LL;
      if (a2 == 1 && !*((_BYTE *)v11 + 24)) {
        BOOL v6 = ((a1[1] - 7) & 0xFEFFFFFF) == 0;
      }
    }
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

void dyld3::MachOFile::forEachSupportedPlatform(_DWORD *a1, uint64_t a2)
{
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x2000000000LL;
  char v6 = 0;
  v4[0] = MEMORY[0x1895FED80];
  v4[1] = 0x40000000LL;
  v4[2] = ___ZNK5dyld39MachOFile24forEachSupportedPlatformEU13block_pointerFvNS_8PlatformEjjE_block_invoke;
  void v4[3] = &unk_189630B38;
  void v4[5] = v5;
  void v4[6] = a1;
  void v4[4] = a2;
  dyld3::MachOFile::forEachLoadCommand(a1, (Diagnostics *)v7, (uint64_t)v4);
  Diagnostics::assertNoError((Diagnostics *)v7);
  _Block_object_dispose(v5, 8);
  mach_o::Error::~Error((mach_o::Error *)v7);
}

uint64_t ___ZNK5dyld39MachOFile16builtForPlatformENS_8PlatformEb_block_invoke(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 48) == a2) {
    uint64_t v2 = *(void *)(result + 32);
  }
  else {
    uint64_t v2 = *(void *)(result + 40);
  }
  *(_BYTE *)(*(void *)(v2 + 8) + 24LL) = 1;
  return result;
}

uint64_t dyld3::MachOFile::loadableIntoProcess(_DWORD *a1, unsigned int a2, const char *a3, int a4)
{
  if (!dyld3::MachOFile::builtForPlatform(a1, a2, 0))
  {
    if (a2 <= 0xC && ((1 << a2) & 0x1380) != 0)
    {
      if (dyld3::MachOFile::builtForPlatform(a1, 1, 0))
      {
        uint64_t v10 = 0LL;
        while (strcmp(dyld3::MachOFile::loadableIntoProcess(dyld3::Platform,char const*,BOOL)const::macOSHost[v10], a3))
        {
          if (++v10 == 6) {
            goto LABEL_10;
          }
        }

        return 1LL;
      }
    }

    else
    {
LABEL_10:
      if (a2 == 1 && a1[3] == 2)
      {
        uint64_t v8 = 1LL;
        uint64_t v11 = a1;
        int v12 = 6;
        goto LABEL_17;
      }
    }

    if (a2 == 7)
    {
      uint64_t v8 = 1LL;
      uint64_t v11 = a1;
      int v12 = 12;
    }

    else
    {
      if (a2 != 2) {
        goto LABEL_18;
      }
      uint64_t v8 = 1LL;
      uint64_t v11 = a1;
      int v12 = 11;
    }

uint64_t dyld3::MachOFile::currentPlatform(dyld3::MachOFile *this)
{
  return 3LL;
}

BOOL dyld3::MachOFile::isMainExecutable(dyld3::MachOFile *this)
{
  return *((_DWORD *)this + 3) == 2;
}

_DWORD *dyld3::MachOFile::forEachLoadCommand(_DWORD *result, Diagnostics *this, uint64_t a3)
{
  int v5 = result;
  int v6 = *result;
  if (*result == -17958193)
  {
    uint64_t v7 = 8LL;
  }

  else
  {
    if (v6 != -17958194)
    {
      if ((v6 & 0xFEFFFFFF) != 0xCEFAEDFE) {
        return (_DWORD *)Diagnostics::error(this, "file does not start with MH_MAGIC[_64]: 0x%08X 0x%08X");
      }
      return result;
    }

    uint64_t v7 = 7LL;
  }

  if (result[3] >= 0xDu) {
    return (_DWORD *)Diagnostics::error(this, "unknown mach-o filetype (%u)");
  }
  if (result[4])
  {
    unsigned int v8 = 0;
    int v9 = &result[v7];
    unint64_t v10 = (unint64_t)&result[v7] + result[5];
    unint64_t v11 = (unint64_t)&result[v7];
    while (1)
    {
      if (v11 > v10 - 8) {
        return (_DWORD *)Diagnostics::error( this,  "malformed load command #%u of %u at %p with mh=%p, extends past sizeofcmds");
      }
      uint64_t v12 = *(unsigned int *)(v11 + 4);
      if (v12 <= 7) {
        return (_DWORD *)Diagnostics::error( this,  "malformed load command #%u of %u at %p with mh=%p, size (0x%X) too small");
      }
      if ((v12 & 3) != 0) {
        break;
      }
      unint64_t v13 = v11 + v12;
      if (v11 + v12 > v10 || v13 < (unint64_t)v9) {
        return (_DWORD *)Diagnostics::error( this,  "malformed load command #%u of %u at %p with mh=%p, size (0x%X) is too large, load commands end at %p");
      }
      BOOL result = (_DWORD *)(*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
      ++v8;
      unint64_t v11 = v13;
      if (v8 >= v5[4]) {
        return result;
      }
    }

    return (_DWORD *)Diagnostics::error( this,  "malformed load command #%u of %u at %p with mh=%p, size (0x%X) not multiple of 4");
  }

  return result;
}

uint64_t ___ZNK5dyld39MachOFile24forEachSupportedPlatformEU13block_pointerFvNS_8PlatformEjjE_block_invoke( uint64_t result, int *a2)
{
  uint64_t v2 = result;
  int v3 = *a2;
  if (*a2 <= 46)
  {
    if (v3 == 36)
    {
      int v5 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16LL);
    }

    else
    {
      if (v3 != 37) {
        return result;
      }
      int v5 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16LL);
    }

    goto LABEL_13;
  }

  if (v3 != 47)
  {
    if (v3 != 48)
    {
      if (v3 != 50) {
        return result;
      }
      uint64_t v4 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16LL);
      goto LABEL_10;
    }

    int v5 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16LL);
LABEL_13:
    BOOL result = v5();
    goto LABEL_14;
  }

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16LL);
LABEL_10:
  BOOL result = v4();
LABEL_14:
  *(_BYTE *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL) = 1;
  return result;
}

_DWORD *dyld3::MachOFile::isMachO(_DWORD *this, const void *a2)
{
  if (*this >> 1 != 2138504551) {
    return 0LL;
  }
  return this;
}

void dyld3::MachOFile::forEachSection(_DWORD *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  Diagnostics::Diagnostics((Diagnostics *)v9);
  BOOL v4 = a1[1] == 7;
  v7[0] = 0LL;
  v7[1] = v7;
  _OWORD v7[2] = 0x2000000000LL;
  int v8 = 0;
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = ___ZNK5dyld39MachOFile14forEachSectionEU13block_pointerFvRKNS0_11SectionInfoEbRbE_block_invoke;
  void v5[3] = &unk_189630C40;
  void v5[6] = a1;
  void v5[7] = &v10;
  void v5[4] = a2;
  void v5[5] = v7;
  BOOL v6 = v4;
  dyld3::MachOFile::forEachLoadCommand(a1, (Diagnostics *)v9, (uint64_t)v5);
  Diagnostics::assertNoError((Diagnostics *)v9);
  _Block_object_dispose(v7, 8);
  mach_o::Error::~Error((mach_o::Error *)v9);
}

char *dyld3::MachOFile::installName(dyld3::MachOFile *this)
{
  else {
    return 0LL;
  }
}

uint64_t dyld3::MachOFile::getDylibInstallName( dyld3::MachOFile *this, const char **a2, unsigned int *a3, unsigned int *a4)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  char v14 = 0;
  v10[0] = MEMORY[0x1895FED80];
  v10[1] = 0x40000000LL;
  vm_address_t v10[2] = ___ZNK5dyld39MachOFile19getDylibInstallNameEPPKcPjS4__block_invoke;
  void v10[3] = &unk_189630BA0;
  void v10[6] = a4;
  v10[7] = a2;
  void v10[4] = &v11;
  v10[5] = a3;
  dyld3::MachOFile::forEachLoadCommand(this, (Diagnostics *)v15, (uint64_t)v10);
  Diagnostics::assertNoError((Diagnostics *)v15);
  uint64_t v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  mach_o::Error::~Error((mach_o::Error *)v15);
  return v8;
}

uint64_t ___ZNK5dyld39MachOFile19getDylibInstallNameEPPKcPjS4__block_invoke( uint64_t result, _DWORD *a2, _BYTE *a3)
{
  if ((*a2 | 2) == 0xF)
  {
    unsigned int v3 = *(_DWORD **)(result + 48);
    **(_DWORD **)(result + 40) = a2[5];
    *unsigned int v3 = a2[4];
    **(void **)(result + 56) = (char *)a2 + a2[2];
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

BOOL dyld3::MachOFile::getUuid(dyld3::MachOFile *this, unsigned __int8 *a2)
{
  uint64_t v8 = 0LL;
  int v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  char v11 = 0;
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = ___ZNK5dyld39MachOFile7getUuidEPh_block_invoke;
  void v7[3] = &unk_189630BC8;
  v7[4] = &v8;
  v7[5] = a2;
  dyld3::MachOFile::forEachLoadCommand(this, (Diagnostics *)v12, (uint64_t)v7);
  Diagnostics::assertNoError((Diagnostics *)v12);
  BOOL v4 = v9;
  if (*((_BYTE *)v9 + 24))
  {
    BOOL v5 = 1LL;
  }

  else
  {
    bzero(a2, 0x10uLL);
    BOOL v5 = *((_BYTE *)v4 + 24) != 0;
  }

  _Block_object_dispose(&v8, 8);
  mach_o::Error::~Error((mach_o::Error *)v12);
  return v5;
}

__n128 ___ZNK5dyld39MachOFile7getUuidEPh_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (*(_DWORD *)a2 == 27)
  {
    __n128 result = *(__n128 *)(a2 + 8);
    *(__n128 *)*(void *)(a1 + 40) = result;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

uint64_t dyld3::MachOFile::preferredLoadAddress(dyld3::MachOFile *this)
{
  uint64_t v4 = 0LL;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  uint64_t v7 = 0LL;
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  v3[2] = ___ZNK5dyld39MachOFile20preferredLoadAddressEv_block_invoke;
  void v3[3] = &unk_189630C18;
  v3[4] = &v4;
  dyld3::MachOFile::forEachSegment(this, (uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void dyld3::MachOFile::forEachSegment(_DWORD *a1, uint64_t a2)
{
  BOOL v4 = a1[1] == 7;
  v7[0] = 0LL;
  v7[1] = v7;
  _OWORD v7[2] = 0x2000000000LL;
  int v8 = 0;
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = ___ZNK5dyld39MachOFile14forEachSegmentEU13block_pointerFvRKNS0_11SegmentInfoERbE_block_invoke;
  void v5[3] = &unk_189630BF0;
  void v5[5] = v7;
  void v5[6] = a1;
  void v5[4] = a2;
  BOOL v6 = v4;
  dyld3::MachOFile::forEachLoadCommand(a1, (Diagnostics *)v9, (uint64_t)v5);
  Diagnostics::assertNoError((Diagnostics *)v9);
  _Block_object_dispose(v7, 8);
  mach_o::Error::~Error((mach_o::Error *)v9);
}

uint64_t ___ZNK5dyld39MachOFile14forEachSegmentEU13block_pointerFvRKNS0_11SegmentInfoERbE_block_invoke( uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v3 = *(void *)(result + 48);
  if (*(_DWORD *)a2 == 1)
  {
    unint64_t v13 = *(unsigned int *)(a2 + 28);
    unsigned int v14 = *(_DWORD *)(a2 + 48);
    if (v14)
    {
      int v15 = 0;
      LOBYTE(v16) = 0;
      unint64_t v17 = a2 + 56;
      unint64_t v18 = a2 + 56 + 68LL * v14;
      do
      {
        v15 |= (*(_BYTE *)(v17 + 57) & 3) != 0;
        v17 += 68LL;
      }

      while (v17 < v18);
      int v19 = *(_DWORD *)(v17 - 32) + *(_DWORD *)(v17 - 36);
      unsigned int v20 = *(_DWORD *)(a2 + 24);
      unsigned int v21 = v19 - v20;
      int v22 = v16 << 16;
    }

    else
    {
      int v22 = 0;
      int v15 = 0;
      unsigned int v20 = *(_DWORD *)(a2 + 24);
      unsigned int v21 = *(_DWORD *)(a2 + 28);
    }

    unint64_t v29 = *(unsigned int *)(a2 + 36);
    uint64_t v36 = *(unsigned int *)(a2 + 32);
    unint64_t v37 = v29;
    uint64_t v38 = v20;
    unint64_t v39 = v13;
    uint64_t v40 = v21;
    uint64_t v41 = a2 + 8;
    int v30 = *(_DWORD *)(a2 + 44);
    int v42 = a2 - v3;
    int v43 = v30;
    BOOL v32 = (v30 & 2) == 0 && *(_BYTE *)(result + 56) != 0;
    int v33 = (*(_DWORD *)(a2 + 52) >> 3) & 2 | (*(_DWORD *)(a2 + 52) >> 1) & 4 | v32 & v15;
    else {
      int v35 = 0;
    }
    uint64_t v27 = *(void *)(result + 32);
    int v28 = v35 | v22 | v33 | (16 * (*(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL) & 0xFFF));
  }

  else
  {
    if (*(_DWORD *)a2 != 25) {
      return result;
    }
    unint64_t v4 = *(void *)(a2 + 32);
    unsigned int v5 = *(_DWORD *)(a2 + 64);
    if (v5)
    {
      LOBYTE(v6) = 0;
      unint64_t v7 = a2 + 72;
      unint64_t v8 = a2 + 72 + 80LL * v5;
      do
      {
        v7 += 80LL;
      }

      while (v7 < v8);
      uint64_t v9 = *(void *)(v7 - 40) + *(void *)(v7 - 48);
      uint64_t v10 = *(void *)(a2 + 24);
      uint64_t v11 = v9 - v10;
      int v12 = v6 << 16;
    }

    else
    {
      int v12 = 0;
      uint64_t v10 = *(void *)(a2 + 24);
      uint64_t v11 = *(void *)(a2 + 32);
    }

    unint64_t v23 = *(void *)(a2 + 48);
    uint64_t v36 = *(void *)(a2 + 40);
    unint64_t v37 = v23;
    uint64_t v38 = v10;
    unint64_t v39 = v4;
    uint64_t v40 = v11;
    uint64_t v41 = a2 + 8;
    int v24 = *(_DWORD *)(a2 + 60);
    int v42 = a2 - v3;
    int v43 = v24;
    if (v23 < v4 && v24 == 3) {
      int v26 = 8;
    }
    else {
      int v26 = 0;
    }
    uint64_t v27 = *(void *)(result + 32);
    int v28 = v26 | v12 | (*(_DWORD *)(a2 + 68) >> 3) & 2 | (*(_DWORD *)(a2 + 68) >> 1) & 4 | (16
                                                                                         * (*(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL) & 0xFFF));
  }

  int v44 = v28;
  __n128 result = (*(uint64_t (**)(uint64_t, uint64_t *))(v27 + 16))(v27, &v36);
  ++*(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL);
  return result;
}

uint64_t ___ZNK5dyld39MachOFile20preferredLoadAddressEv_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result = strcmp(*(const char **)(a2 + 40), "__TEXT");
  if (!(_DWORD)result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *(void *)(a2 + 16);
    *a3 = 1;
  }

  return result;
}

uint64_t ___ZNK5dyld39MachOFile14forEachSectionEU13block_pointerFvRKNS0_11SectionInfoEbRbE_block_invoke( uint64_t result, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = result;
  uint64_t v11 = *(void *)(result + 48);
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t v20 = *(unsigned int *)(a2 + 28);
    unint64_t v21 = a2 + 56;
    unsigned int v22 = *(_DWORD *)(a2 + 48);
    unint64_t v23 = a2 + 56 + 68LL * v22;
    if (v22)
    {
      int v24 = 0;
      LOBYTE(v25) = 0;
      do
      {
        v24 |= (*(_BYTE *)(v21 + 57) & 3) != 0;
        v21 += 68LL;
      }

      while (v21 < v23);
      unsigned int v26 = *(_DWORD *)(a2 + 24);
      unsigned int v27 = *(_DWORD *)(v21 - 32) + *(_DWORD *)(v21 - 36) - v26;
      int v28 = v25 << 16;
    }

    else
    {
      int v28 = 0;
      int v24 = 0;
      unsigned int v26 = *(_DWORD *)(a2 + 24);
      unsigned int v27 = *(_DWORD *)(a2 + 28);
    }

    uint64_t v42 = *(void *)(a2 + 32);
    *(void *)&__int128 v43 = v42;
    *((void *)&v43 + 1) = HIDWORD(v42);
    __int128 v57 = v43;
    uint64_t v58 = v26;
    uint64_t v59 = v20;
    uint64_t v60 = v27;
    uint64_t v61 = a2 + 8;
    int v44 = *(_DWORD *)(a2 + 44);
    int v62 = a2 - v11;
    int v63 = v44;
    unint64_t v31 = (uint64_t *)(result + 40);
    uint64_t v30 = *(void *)(result + 40);
    BOOL v46 = (v44 & 2) == 0 && *(_BYTE *)(result + 64) != 0;
    int v64 = (*(_DWORD *)(a2 + 52) >> 3) & 2 | v46 & v24 & 0xFF0007 | (*(_DWORD *)(a2 + 52) >> 1) & 4 | v28 & 0xFF0007 | (16 * (*(_DWORD *)(*(void *)(v30 + 8) + 24LL) & 0xFFF));
    if (*a3 || !v22) {
      goto LABEL_57;
    }
    unint64_t v47 = a2 + 124;
    do
    {
      BOOL v48 = (const char *)(v47 - 68);
      if (*(_BYTE *)(v47 - 53))
      {
        strlcpy(*(char **)(v10 + 56), v48, 0x11uLL);
        BOOL v48 = *(const char **)(v10 + 56);
      }

      unsigned int v49 = *(_DWORD *)(a2 + 24);
      unint64_t v50 = *(unsigned int *)(v47 - 36);
      if (v50 >= v49)
      {
        unsigned int v52 = *(_DWORD *)(a2 + 36) + v49;
        BOOL v39 = v52 >= v50;
        unsigned int v53 = v52 - v50;
        uint64_t v51 = !v39 || v53 < *(_DWORD *)(v47 - 32);
      }

      else
      {
        uint64_t v51 = 1LL;
      }

      uint64_t v66 = *(unsigned int *)(v47 - 32);
      v67 = v48;
      int v55 = *(_DWORD *)(v47 - 12);
      int v56 = *(_DWORD *)(v47 - 24);
      int v68 = *(_DWORD *)(v47 - 28);
      int v69 = v55;
      unint64_t v65 = v50;
      int v70 = v56;
      uint64_t v71 = *(void *)(v47 - 8);
      uint64_t result = (*(uint64_t (**)(void, __int128 *, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 32) + 16LL))( *(void *)(v10 + 32),  &v57,  v51,  a3,  a5,  a6,  a7,  a8);
      if (*a3) {
        break;
      }
      BOOL v39 = v47 >= v23;
      v47 += 68LL;
    }

    while (!v39);
    goto LABEL_56;
  }

  if (*(_DWORD *)a2 != 25) {
    return result;
  }
  uint64_t v12 = *(void *)(a2 + 32);
  unint64_t v13 = a2 + 72;
  unsigned int v14 = *(_DWORD *)(a2 + 64);
  unint64_t v15 = a2 + 72 + 80LL * v14;
  if (v14)
  {
    LOBYTE(v16) = 0;
    do
    {
      v13 += 80LL;
    }

    while (v13 < v15);
    uint64_t v17 = *(void *)(a2 + 24);
    uint64_t v18 = *(void *)(v13 - 40) + *(void *)(v13 - 48) - v17;
    int v19 = v16 << 16;
  }

  else
  {
    int v19 = 0;
    uint64_t v17 = *(void *)(a2 + 24);
    uint64_t v18 = *(void *)(a2 + 32);
  }

  __int128 v57 = *(_OWORD *)(a2 + 40);
  uint64_t v58 = v17;
  uint64_t v59 = v12;
  uint64_t v60 = v18;
  uint64_t v61 = a2 + 8;
  int v29 = *(_DWORD *)(a2 + 60);
  int v62 = a2 - v11;
  int v63 = v29;
  int v64 = (*(_DWORD *)(a2 + 68) >> 3) & 2 | (*(_DWORD *)(a2 + 68) >> 1) & 4 | v19;
  unint64_t v31 = (uint64_t *)(result + 40);
  uint64_t v30 = *(void *)(result + 40);
  int v64 = v64 & 0xFF0006 | (16 * (*(_DWORD *)(*(void *)(v30 + 8) + 24LL) & 0xFFF));
  if (!*a3 && v14)
  {
    unint64_t v32 = a2 + 152;
    do
    {
      int v33 = (const char *)(v32 - 80);
      if (*(_BYTE *)(v32 - 65))
      {
        strlcpy(*(char **)(v10 + 56), v33, 0x11uLL);
        int v33 = *(const char **)(v10 + 56);
      }

      unint64_t v34 = *(void *)(a2 + 24);
      unint64_t v35 = *(void *)(v32 - 48);
      if (v35 >= v34)
      {
        unint64_t v37 = *(void *)(a2 + 48) + v34;
        BOOL v39 = v37 >= v35;
        unint64_t v38 = v37 - v35;
        BOOL v39 = v39 && v38 >= *(void *)(v32 - 40);
        uint64_t v36 = !v39;
      }

      else
      {
        uint64_t v36 = 1LL;
      }

      uint64_t v66 = *(void *)(v32 - 40);
      v67 = v33;
      int v40 = *(_DWORD *)(v32 - 16);
      int v41 = *(_DWORD *)(v32 - 28);
      int v68 = *(_DWORD *)(v32 - 32);
      int v69 = v40;
      unint64_t v65 = v35;
      int v70 = v41;
      uint64_t v71 = *(void *)(v32 - 12);
      uint64_t result = (*(uint64_t (**)(void, __int128 *, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 32) + 16LL))( *(void *)(v10 + 32),  &v57,  v36,  a3,  a5,  a6,  a7,  a8);
      if (*a3) {
        break;
      }
      BOOL v39 = v32 >= v15;
      v32 += 80LL;
    }

    while (!v39);
LABEL_56:
    uint64_t v30 = *v31;
  }

uint64_t dyld4::FileManager::FileManager(uint64_t a1, lsl::Lock **this, uint64_t a3)
{
  *(void *)a1 = a3;
  *(void *)(a1 + 8) = this;
  unsigned int v5 = lsl::Allocator::aligned_alloc(this, 8uLL, 0x28uLL);
  *unsigned int v5 = 0LL;
  v5[1] = this;
  void v5[3] = 0LL;
  *((_BYTE *)v5 + 32) = 0;
  *(void *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 24) = 0;
  return a1;
}

double dyld4::FileManager::fileRecordForPath@<D0>( dyld4::FileManager *this@<X0>, lsl::Lock **a2@<X1>, const char *__s@<X2>, uint64_t a4@<X8>)
{
  if (__s) {
    int v6 = lsl::Allocator::strdup(a2, __s);
  }
  else {
    int v6 = 0LL;
  }
  *(void *)a4 = this;
  *(_OWORD *)(a4 + 8) = 0u;
  *(_OWORD *)(a4 + 24) = 0u;
  *(void *)(a4 + 48) = 0LL;
  *(void *)(a4 + 56) = 0LL;
  *(void *)(a4 + 40) = v6;
  *(void *)&double result = 0x1FFFFFFFFLL;
  *(void *)(a4 + 64) = 0x1FFFFFFFFLL;
  *(_WORD *)(a4 + 72) = 0;
  *(_BYTE *)(a4 + 74) = 1;
  return result;
}

double dyld4::FileManager::fileRecordForVolumeUUIDAndObjID@<D0>( dyld4::FileManager *this@<X0>, const UUID *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = this;
  *(void *)(a4 + 8) = a3;
  *(void *)(a4 + 16) = 0LL;
  *(_OWORD *)(a4 + 24) = *(_OWORD *)a2;
  *(void *)(a4 + 48) = 0LL;
  *(void *)(a4 + 56) = 0LL;
  *(void *)(a4 + 40) = 0LL;
  *(void *)&double result = 0x1FFFFFFFFLL;
  *(void *)(a4 + 64) = 0x1FFFFFFFFLL;
  *(_WORD *)(a4 + 72) = 0;
  *(_BYTE *)(a4 + 74) = 1;
  return result;
}

void dyld4::FileManager::reloadFSInfos(dyld4::FileManager *this)
{
  int v33 = this;
  uint64_t v61 = *MEMORY[0x1895FEE08];
  lsl::AllocatorLayout::minSize(this);
  uint64_t v1 = (lsl::AllocatorLayout *)MEMORY[0x1895FE128]();
  uint64_t v2 = (lsl::Allocator *)((char *)&v28 - (((unint64_t)v1 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v3 = (char *)lsl::AllocatorLayout::minSize(v1);
  unint64_t v7 = (lsl::Lock **)lsl::Allocator::stackAllocatorInternal(v2, v3, v4, v5, v6);
  int v8 = getfsstat(0LL, 0, 2);
  if (v8 != -1)
  {
    LODWORD(v9) = v8;
    while (1)
    {
      uint64_t v10 = (statfs *)lsl::Allocator::malloc(v7, 2168 * (int)v9);
      if (getfsstat(v10, 2168 * v9, 2) == (_DWORD)v9) {
        break;
      }
      lsl::Allocator::free(v7, v10);
      LODWORD(v9) = getfsstat(0LL, 0, 2);
      if ((_DWORD)v9 == -1) {
        goto LABEL_20;
      }
    }

    if ((int)v9 >= 1)
    {
      unint64_t v32 = (void *)&v53 + 1;
      uint64_t v30 = (uint64_t *)&v60[8];
      unint64_t v31 = v52;
      int v28 = (_OWORD *)((char *)v50 + 8);
      int v29 = &v35;
      _X22 = v10;
      uint64_t v9 = v9;
      uint64_t v12 = v33;
      do
      {
        __asm { PRFM            #0, [X22,#0x1998] }

        uint64_t v18 = _X22->f_fsid.val[0];
        uint64_t v19 = *((void *)v12 + 2);
        uint64_t v20 = v32;
        *unint64_t v32 = 0LL;
        v20[1] = 0LL;
        *(void *)&__int128 v53 = v18;
        lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find( v19,  (unint64_t *)&v53,  (uint64_t)&v36);
        uint64_t v47 = v36;
        v50[2] = v41;
        v50[3] = v42;
        v50[4] = v43;
        uint64_t v51 = v44;
        __int128 v48 = v37;
        __int128 v49 = v38;
        v50[0] = v39;
        v50[1] = v40;
        uint64_t v21 = *(void *)v45;
        unsigned int v22 = v31;
        *(void *)(v31 + 7) = *(void *)&v45[7];
        void *v22 = v21;
        v52[15] = v46;
        uint64_t v23 = *((void *)v12 + 2);
        __int128 v59 = 0u;
        memset(v60, 0, 23);
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        uint64_t v36 = v23;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        uint64_t v44 = 0LL;
        uint64_t v24 = *v30;
        *(void *)&v45[7] = *(uint64_t *)((char *)v30 + 7);
        *(void *)int v45 = v24;
        char v46 = 0;
        if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v47,  (uint64_t)&v36))
        {
          if ((_X22->f_flags & 0x4000) != 0)
          {
            LODWORD(v53) = 5;
            HIDWORD(v53) = 0;
            *(void *)&__int128 v54 = 0LL;
            *(void *)((char *)&v53 + 4) = 0x8006000000000006LL;
            if (!getattrlist(_X22->f_mntonname, &v53, &v47, 0x40uLL, 0) && (BYTE8(v48) & 1) != 0)
            {
              uint64_t v25 = *((void *)v33 + 2);
              uint64_t v34 = v18;
              *(_OWORD *)int v29 = *v28;
            }

            else
            {
              uint64_t v25 = *((void *)v33 + 2);
              unsigned int v27 = v29;
              *int v29 = 0LL;
              v27[1] = 0LL;
              uint64_t v34 = v18;
            }

            unsigned int v26 = &v34;
          }

          else
          {
            uint64_t v25 = *((void *)v33 + 2);
            __int128 v48 = 0uLL;
            uint64_t v47 = v18;
            unsigned int v26 = &v47;
          }

          lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::insert( v25,  (uint64_t)v26,  (uint64_t)&v36);
        }

        ++_X22;
        --v9;
      }

      while (v9);
    }

    lsl::Allocator::free(v7, v10);
  }

double lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::insert@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  unint64_t v9 = *(void *)a2;
  __int128 v10 = *(_OWORD *)(a2 + 8);
  lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::const_iterator( (uint64_t)v22,  a1,  &v9);
  lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::insert_internal( a1,  (uint64_t)v22,  &v9,  (uint64_t)&v11);
  uint64_t v5 = v11;
  *(_OWORD *)(a3 + 72) = v16;
  *(_OWORD *)(a3 + 88) = v17;
  *(_OWORD *)(a3 + 104) = v18;
  *(_OWORD *)(a3 + 8) = v12;
  *(_OWORD *)(a3 + 24) = v13;
  *(_OWORD *)(a3 + 40) = v14;
  double result = *(double *)&v15;
  *(_OWORD *)(a3 + 56) = v15;
  *(void *)(a3 + 135) = *(void *)&v20[7];
  uint64_t v7 = *(void *)v20;
  *(void *)(a3 + 120) = v19;
  *(void *)(a3 + 128) = v7;
  __int16 v8 = v21;
  *(void *)a3 = v5;
  *(_WORD *)(a3 + 143) = v8;
  return result;
}

uint64_t dyld4::FileManager::uuidForFileSystem(os_unfair_lock_s *this, unsigned int a2)
{
  uint64_t v35 = *MEMORY[0x1895FEE08];
  unint64_t v4 = this + 6;
  os_unfair_lock_lock(this + 6);
  uint64_t v5 = *(void *)&this[4]._os_unfair_lock_opaque;
  *(void *)&v25[8] = 0LL;
  *(void *)&v25[16] = 0LL;
  *(void *)uint64_t v25 = a2;
  lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find( v5,  (unint64_t *)v25,  (uint64_t)&v14);
  v28[4] = v19;
  v28[5] = v20;
  v28[6] = v21;
  uint64_t v27 = v14;
  v28[0] = v15;
  v28[1] = v16;
  v28[2] = v17;
  v28[3] = v18;
  *(void *)&v30[7] = *(void *)&v23[7];
  uint64_t v29 = v22;
  *(void *)uint64_t v30 = *(void *)v23;
  unsigned __int8 v31 = v24;
  uint64_t v6 = *(void *)&this[4]._os_unfair_lock_opaque;
  memset(v25, 0, 135);
  uint64_t v14 = v6;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v22 = 0LL;
  memset(v23, 0, sizeof(v23));
  unsigned __int8 v24 = 0;
  if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v27,  (uint64_t)&v14))
  {
    dyld4::FileManager::reloadFSInfos((dyld4::FileManager *)this);
    uint64_t v7 = *(void *)&this[4]._os_unfair_lock_opaque;
    uint64_t v33 = 0LL;
    uint64_t v34 = 0LL;
    unint64_t v32 = a2;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find( v7,  &v32,  (uint64_t)&v14);
    *(_OWORD *)&v25[72] = v19;
    *(_OWORD *)&v25[88] = v20;
    *(_OWORD *)&v25[104] = v21;
    *(void *)uint64_t v25 = v14;
    *(_OWORD *)&v25[8] = v15;
    *(_OWORD *)&v25[24] = v16;
    *(_OWORD *)&v25[40] = v17;
    *(_OWORD *)&v25[56] = v18;
    *(void *)&v25[135] = *(void *)&v23[7];
    *(void *)&v25[120] = v22;
    *(void *)&v25[128] = *(void *)v23;
    unsigned __int8 v26 = v24;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::swap( &v27,  (uint64_t *)v25);
  }

  uint64_t v8 = *(void *)&this[4]._os_unfair_lock_opaque;
  memset(v25, 0, 135);
  uint64_t v14 = v8;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v22 = 0LL;
  memset(v23, 0, sizeof(v23));
  unsigned __int8 v24 = 0;
  if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v27,  (uint64_t)&v14))
  {
    uint64_t v9 = *(void *)&this[4]._os_unfair_lock_opaque;
    *(void *)&v25[8] = 0LL;
    *(void *)&v25[16] = 0LL;
    *(void *)uint64_t v25 = a2;
    lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::insert(v9, (uint64_t)v25, (uint64_t)&v14);
    uint64_t v10 = *(void *)&this[4]._os_unfair_lock_opaque;
    uint64_t v33 = 0LL;
    uint64_t v34 = 0LL;
    unint64_t v32 = a2;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find( v10,  &v32,  (uint64_t)&v14);
    *(_OWORD *)&v25[72] = v19;
    *(_OWORD *)&v25[88] = v20;
    *(_OWORD *)&v25[104] = v21;
    *(void *)uint64_t v25 = v14;
    *(_OWORD *)&v25[8] = v15;
    *(_OWORD *)&v25[24] = v16;
    *(_OWORD *)&v25[40] = v17;
    *(_OWORD *)&v25[56] = v18;
    *(void *)&v25[135] = *(void *)&v23[7];
    *(void *)&v25[120] = v22;
    *(void *)&v25[128] = *(void *)v23;
    unsigned __int8 v26 = v24;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::swap( &v27,  (uint64_t *)v25);
  }

  uint64_t v11 = *(void *)&this[4]._os_unfair_lock_opaque;
  memset(v25, 0, 135);
  uint64_t v14 = v11;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v22 = 0LL;
  memset(v23, 0, sizeof(v23));
  unsigned __int8 v24 = 0;
  if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v27,  (uint64_t)&v14)) {
    dyld4::FileManager::uuidForFileSystem();
  }
  uint64_t v12 = *(void *)(*((void *)v28 + v31 - 1) + 24LL * v30[v31 - 1] + 8);
  os_unfair_lock_unlock(v4);
  return v12;
}

uint64_t dyld4::FileManager::fsidForUUID(os_unfair_lock_s *this, const UUID *a2)
{
  uint64_t v72 = *MEMORY[0x1895FEE08];
  unint64_t v4 = this + 6;
  os_unfair_lock_lock(this + 6);
  uint64_t v5 = *(void *)&this[4]._os_unfair_lock_opaque;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  memset(v63, 0, sizeof(v63));
  uint64_t v55 = v5;
  uint64_t v8 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v55,  v6,  v7);
  uint64_t v9 = *(void *)v8;
  __int128 v10 = *(_OWORD *)(v8 + 104);
  __int128 v11 = *(_OWORD *)(v8 + 88);
  uint64_t v12 = *(void *)(v8 + 120);
  uint64_t v13 = *(void *)(v8 + 128);
  __int128 v49 = *(_OWORD *)(v8 + 72);
  __int128 v50 = v11;
  __int128 v51 = v10;
  uint64_t v52 = v12;
  __int128 v14 = *(_OWORD *)(v8 + 56);
  __int128 v15 = *(_OWORD *)(v8 + 40);
  __int128 v16 = *(_OWORD *)(v8 + 24);
  __int128 v45 = *(_OWORD *)(v8 + 8);
  __int128 v46 = v16;
  __int128 v47 = v15;
  __int128 v48 = v14;
  *(void *)&v53[7] = *(void *)(v8 + 135);
  *(void *)__int128 v53 = v13;
  LOBYTE(v12) = *(_BYTE *)(v8 + 143);
  uint64_t v44 = v9;
  unsigned __int8 v54 = v12;
  __int128 v70 = 0u;
  memset(v71, 0, sizeof(v71));
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  uint64_t v55 = v5;
  memset(v63, 0, sizeof(v63));
  while (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v44,  (uint64_t)&v55))
  {
    uint64_t v19 = 0LL;
    __int128 v20 = (uint64_t *)(*((void *)&v45 + v54 - 1) + 24LL * v53[v54 - 1]);
    do
    {
      int v21 = *((unsigned __int8 *)v20 + v19 + 8);
      int v22 = (*a2)[v19];
    }

    while (v21 == v22 && v19++ != 15);
    if (v21 == v22) {
      goto LABEL_20;
    }
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v44,  v17,  v18);
  }

  dyld4::FileManager::reloadFSInfos((dyld4::FileManager *)this);
  uint64_t v24 = *(void *)&this[4]._os_unfair_lock_opaque;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  memset(v63, 0, sizeof(v63));
  uint64_t v55 = v24;
  uint64_t v27 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v55,  v25,  v26);
  uint64_t v28 = *(void *)v27;
  __int128 v29 = *(_OWORD *)(v27 + 104);
  __int128 v30 = *(_OWORD *)(v27 + 88);
  uint64_t v31 = *(void *)(v27 + 120);
  uint64_t v32 = *(void *)(v27 + 128);
  __int128 v49 = *(_OWORD *)(v27 + 72);
  __int128 v50 = v30;
  __int128 v51 = v29;
  uint64_t v52 = v31;
  __int128 v33 = *(_OWORD *)(v27 + 56);
  __int128 v34 = *(_OWORD *)(v27 + 40);
  __int128 v35 = *(_OWORD *)(v27 + 24);
  __int128 v45 = *(_OWORD *)(v27 + 8);
  __int128 v46 = v35;
  __int128 v47 = v34;
  __int128 v48 = v33;
  *(void *)&v53[7] = *(void *)(v27 + 135);
  *(void *)__int128 v53 = v32;
  LOBYTE(v31) = *(_BYTE *)(v27 + 143);
  uint64_t v44 = v28;
  unsigned __int8 v54 = v31;
  __int128 v70 = 0u;
  memset(v71, 0, sizeof(v71));
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  uint64_t v55 = v24;
  memset(v63, 0, sizeof(v63));
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v44,  (uint64_t)&v55))
  {
    while (1)
    {
      uint64_t v38 = 0LL;
      __int128 v20 = (uint64_t *)(*((void *)&v45 + v54 - 1) + 24LL * v53[v54 - 1]);
      do
      {
        int v39 = *((unsigned __int8 *)v20 + v38 + 8);
        int v40 = (*a2)[v38];
      }

      while (v39 == v40 && v38++ != 15);
      if (v39 == v40) {
        break;
      }
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++( (uint64_t)&v44,  v36,  v37);
      if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v44,  (uint64_t)&v55)) {
        goto LABEL_19;
      }
    }

LABEL_19:
  uint64_t v42 = 0LL;
LABEL_21:
  os_unfair_lock_unlock(v4);
  return v42;
}

char *dyld4::FileManager::getPath@<X0>( char *this@<X0>, const UUID *a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v5 = this;
  uint64_t v7 = 0LL;
  do
  {
    int v8 = (*a2)[v7];
    if ((*a2)[v7]) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 15;
    }
    ++v7;
  }

  while (!v9);
  if (v8)
  {
    uint64_t v10 = dyld4::FileManager::fsidForUUID((os_unfair_lock_s *)this, a2);
    return dyld4::FileManager::getPath(v5, (fsid_t)v10, a3, a4);
  }

  else
  {
    *a4 = 0LL;
  }

  return this;
}

char *dyld4::FileManager::getPath@<X0>(char *this@<X0>, fsid_t a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (*(void *)&a2 && a3)
  {
    uint64_t v5 = (uint64_t)this;
    fsid_t v6 = a2;
    if (fsgetpath(__s, 0x400uLL, &v6, a3) == -1) {
      this = 0LL;
    }
    else {
      this = lsl::Allocator::strdup(*(lsl::Lock ***)(v5 + 8), __s);
    }
    *a4 = this;
  }

  else
  {
    *a4 = 0LL;
  }

  return this;
}

__n128 dyld4::FileRecord::swap(dyld4::FileRecord *this, dyld4::FileRecord *a2)
{
  __int128 v4 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a2 + 24) = v4;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v6;
  uint64_t v7 = *((void *)this + 5);
  *((void *)this + 5) = 0LL;
  uint64_t v8 = (lsl::Allocator *)*((void *)a2 + 5);
  if (a2 == this)
  {
    *((void *)a2 + 5) = v7;
    if (v8) {
      lsl::Allocator::freeObject(v8, a2);
    }
  }

  else
  {
    *((void *)this + 5) = v8;
    *((void *)a2 + 5) = v7;
  }

  uint64_t v9 = *(void *)this;
  *(void *)this = *(void *)a2;
  *(void *)a2 = v9;
  __n128 result = *((__n128 *)a2 + 3);
  __int128 v11 = *((_OWORD *)this + 3);
  *((__n128 *)this + 3) = result;
  *((_OWORD *)a2 + 3) = v11;
  LODWORD(v9) = *((_DWORD *)this + 16);
  *((_DWORD *)this + 16) = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = v9;
  LODWORD(v9) = *((_DWORD *)this + 17);
  *((_DWORD *)this + 17) = *((_DWORD *)a2 + 17);
  *((_DWORD *)a2 + 17) = v9;
  LOWORD(v9) = *((_WORD *)this + 36);
  *((_WORD *)this + 36) = *((_WORD *)a2 + 36);
  *((_WORD *)a2 + 36) = v9;
  LOBYTE(v9) = *((_BYTE *)this + 74);
  *((_BYTE *)this + 74) = *((_BYTE *)a2 + 74);
  *((_BYTE *)a2 + 74) = v9;
  return result;
}

uint64_t dyld4::FileRecord::FileRecord(uint64_t a1, dyld4::FileRecord *a2)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 64) = 0x1FFFFFFFFLL;
  *(_WORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 74) = 1;
  dyld4::FileRecord::swap((dyld4::FileRecord *)a1, a2);
  return a1;
}

dyld4::FileRecord *dyld4::FileRecord::operator=(dyld4::FileRecord *a1, dyld4::FileRecord *a2)
{
  return a1;
}

void dyld4::FileRecord::~FileRecord(dyld4::FileRecord *this, void *a2)
{
  int v3 = *((_DWORD *)this + 16);
  if (v3 != -1)
  {
    close(v3);
    *((_DWORD *)this + 16) = -1;
  }

  __int128 v4 = (lsl::Allocator *)*((void *)this + 5);
  if (v4) {
    lsl::Allocator::freeObject(v4, a2);
  }
}

uint64_t dyld4::FileRecord::close(dyld4::FileRecord *this)
{
  uint64_t result = *((unsigned int *)this + 16);
  if ((_DWORD)result != -1)
  {
    uint64_t result = close(result);
    *((_DWORD *)this + 16) = -1;
  }

  return result;
}

uint64_t dyld4::FileRecord::open(dyld4::FileRecord *this, int a2)
{
  if (*((_DWORD *)this + 16) != -1) {
    dyld4::FileRecord::open();
  }
  uint64_t v4 = 24LL;
  do
  {
    int v5 = *((unsigned __int8 *)this + v4);
    if (*((_BYTE *)this + v4)) {
      break;
    }
  }

  while (v4++ != 39);
  if (v5
    && dyld4::FileManager::fsidForUUID(*(os_unfair_lock_s **)this, (const UUID *)((char *)this + 24))
    && *((void *)this + 1))
  {
    uint64_t result = openbyid_np();
    *((_DWORD *)this + 16) = result;
  }

  else
  {
    uint64_t result = *((unsigned int *)this + 16);
  }

  if ((_DWORD)result == -1)
  {
    uint64_t Path = (const char *)dyld4::FileRecord::getPath(this);
    uint64_t result = open(Path, a2);
    *((_DWORD *)this + 16) = result;
  }

  return result;
}

uint64_t dyld4::FileRecord::getPath(dyld4::FileRecord *this)
{
  if (!*((void *)this + 5))
  {
    fsid_t v2 = (fsid_t)*((void *)this + 2);
    if (v2) {
      dyld4::FileManager::getPath(*(char **)this, v2, *((void *)this + 1), &v6);
    }
    else {
      dyld4::FileManager::getPath(*(char **)this, (const UUID *)((char *)this + 24), *((void *)this + 1), &v6);
    }
    uint64_t v4 = (lsl::Allocator *)*((void *)this + 5);
    *((void *)this + 5) = v6;
    if (v4) {
      lsl::Allocator::freeObject(v4, v3);
    }
  }

  return *((void *)this + 5);
}

uint64_t dyld4::FileRecord::stat(uint64_t this)
{
  if (*(_DWORD *)(this + 68) == 1)
  {
    uint64_t v1 = this;
    int v2 = *(_DWORD *)(this + 64);
    if (v2 == -1)
    {
      uint64_t Path = (const char *)dyld4::FileRecord::getPath((dyld4::FileRecord *)v1);
      this = stat(Path, &v9);
    }

    else
    {
      this = fstat(v2, &v9);
    }

    *(_DWORD *)(v1 + 68) = this;
    if (!(_DWORD)this)
    {
      __darwin_time_t tv_sec = v9.st_mtimespec.tv_sec;
      *(void *)(v1 + 48) = v9.st_size;
      *(void *)(v1 + 56) = tv_sec;
      *(_WORD *)(v1 + 72) = v9.st_mode;
      if (!*(void *)(v1 + 8))
      {
        uint64_t v5 = 24LL;
        do
        {
          int v6 = *(unsigned __int8 *)(v1 + v5);
          if (*(_BYTE *)(v1 + v5)) {
            break;
          }
        }

        while (v5++ != 39);
        if (!v6)
        {
          *(void *)(v1 + 8) = v9.st_ino;
          this = dyld4::FileManager::uuidForFileSystem(*(os_unfair_lock_s **)v1, v9.st_dev);
          *(void *)(v1 + 24) = this;
          *(void *)(v1 + 32) = v8;
        }
      }
    }
  }

  return this;
}

uint64_t dyld4::FileRecord::size(dyld4::FileRecord *this)
{
  uint64_t result = *((void *)this + 6);
  if (!result)
  {
    dyld4::FileRecord::stat((uint64_t)this);
    return *((void *)this + 6);
  }

  return result;
}

uint64_t dyld4::FileRecord::fileManager(dyld4::FileRecord *this)
{
  return *(void *)this;
}

uint64_t *lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::swap( uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *uint64_t result = *a2;
  *a2 = v2;
  for (uint64_t i = 1LL; i != 16; ++i)
  {
    uint64_t v4 = result[i];
    result[i] = a2[i];
    a2[i] = v4;
  }

  uint64_t v5 = 0LL;
  int v6 = result + 16;
  uint64_t v7 = a2 + 16;
  do
  {
    char v8 = *((_BYTE *)v6 + v5);
    *((_BYTE *)v6 + v5) = *((_BYTE *)v7 + v5);
    *((_BYTE *)v7 + v5++) = v8;
  }

  while (v5 != 15);
  char v9 = *((_BYTE *)result + 143);
  *((_BYTE *)result + 143) = *((_BYTE *)a2 + 143);
  *((_BYTE *)a2 + 143) = v9;
  return result;
}

double lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find@<D0>( uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = *MEMORY[0x1895FEE08];
  lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::const_iterator( (uint64_t)&v23,  a1,  a2);
  uint64_t v13 = a1;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v22 = 0LL;
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( (uint64_t)&v23,  (uint64_t)&v13)
    && (unsigned __int8 v6 = v32, *a2 >= *(void *)(*((void *)v24 + v32 - 1) + 24LL * v31[v32 - 1])))
  {
    __int128 v8 = v28;
    *(_OWORD *)(a3 + 72) = v27;
    *(_OWORD *)(a3 + 88) = v8;
    *(_OWORD *)(a3 + 104) = v29;
    __int128 v9 = v24[1];
    *(_OWORD *)(a3 + 8) = v24[0];
    *(_OWORD *)(a3 + 24) = v9;
    double result = *(double *)&v25;
    __int128 v10 = v26;
    *(_OWORD *)(a3 + 40) = v25;
    *(void *)a3 = v23;
    uint64_t v11 = v30;
    *(_OWORD *)(a3 + 56) = v10;
    *(void *)(a3 + 135) = *(void *)&v31[7];
    uint64_t v12 = *(void *)v31;
    *(void *)(a3 + 120) = v11;
    *(void *)(a3 + 128) = v12;
    *(_BYTE *)(a3 + 143) = v6;
  }

  else
  {
    *(void *)a3 = a1;
    double result = 0.0;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(_OWORD *)(a3 + 120) = 0u;
    *(void *)(a3 + 136) = 0LL;
  }

  return result;
}

uint64_t lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::const_iterator( uint64_t result, uint64_t a2, unint64_t *a3)
{
  *(void *)double result = a2;
  *(_OWORD *)(result + 8) = 0u;
  uint64_t v3 = result + 8;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 72) = 0u;
  *(_OWORD *)(result + 88) = 0u;
  *(_OWORD *)(result + 104) = 0u;
  *(_OWORD *)(result + 120) = 0u;
  *(void *)(result + 136) = 0LL;
  if (*(_BYTE *)(a2 + 32))
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = *(void *)a2;
    uint64_t v6 = result + 128;
    do
    {
      *(void *)(v3 + 8 * v4) = v5;
      unint64_t v7 = *(_BYTE *)(v5 + 240) & 0x7F;
      if ((*(_BYTE *)(v5 + 240) & 0x7F) != 0)
      {
        __int128 v8 = (void *)v5;
        do
        {
          unint64_t v9 = v7 >> 1;
          __int128 v10 = &v8[3 * (v7 >> 1)];
          unint64_t v12 = *v10;
          uint64_t v11 = v10 + 3;
          v7 += ~(v7 >> 1);
          if (v12 < *a3) {
            __int128 v8 = v11;
          }
          else {
            unint64_t v7 = v9;
          }
        }

        while (v7);
      }

      else
      {
        __int128 v8 = (void *)(v5 + 24LL * (*(_BYTE *)(v5 + 240) & 0x7F));
      }

      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v5) >> 3);
      *(_BYTE *)(v6 + v4) = v13;
      uint64_t v14 = *(void *)(v3 + 8 * v4);
      if ((*(_BYTE *)(v14 + 240) & 0x7F) != v13
        && *(void *)(v14 + 24LL * v13) < *a3)
      {
        *(_BYTE *)(result + 143) = v4 + 1;
        return result;
      }

      unint64_t v15 = *(unsigned __int8 *)(a2 + 32);
      if ((_DWORD)v4 + 1 != (_DWORD)v15)
      {
        if ((*(_BYTE *)(v14 + 240) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(result, a2, (uint64_t)a3);
        }
        uint64_t v5 = *(void *)(v14 + 8LL * v13 + 168);
      }

      ++v4;
    }

    while (v4 < v15);
    for (*(_BYTE *)(result + 143) = v15; (_BYTE)v15; *(_BYTE *)(result + 143) = v15)
    {
      if (*(_BYTE *)(v6 + v15 - 1) != (*(_BYTE *)(*(void *)(result
                                                                                            + 8LL * v15)
                                                                                + 240LL) & 0x7F))
        break;
      LOBYTE(v15) = v15 - 1;
    }
  }

  return result;
}

void lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::insert_internal( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v36 = *MEMORY[0x1895FEE08];
  if (*(void *)a1)
  {
    uint64_t v26 = a1;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v35 = 0LL;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( a2,  (uint64_t)&v26))
    {
      uint64_t v8 = *(unsigned __int8 *)(a2 + 143);
      if (*a3 >= *(void *)(*(void *)(a2 + 8 + 8 * (v8 - 1)) + 24LL * *(unsigned __int8 *)(a2 + 128 + v8 - 1)))
      {
        char v15 = 0;
        __int128 v21 = *(_OWORD *)(a2 + 88);
        *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
        *(_OWORD *)(a4 + 88) = v21;
        *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
        __int128 v22 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a4 + 24) = v22;
        __int128 v23 = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
        *(void *)a4 = *(void *)a2;
        *(void *)(a4 + 135) = *(void *)(a2 + 135);
        uint64_t v24 = *(void *)(a2 + 120);
        *(_OWORD *)(a4 + 56) = v23;
        uint64_t v25 = *(void *)(a2 + 128);
        *(void *)(a4 + 120) = v24;
        *(void *)(a4 + 128) = v25;
        *(_BYTE *)(a4 + 143) = v8;
        goto LABEL_11;
      }
    }

    uint64_t v26 = a1;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v35 = 0LL;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>( a2,  (uint64_t)&v26)
      && *(unsigned __int8 *)(a2 + 143) == *(unsigned __int8 *)(a1 + 32))
    {
      lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
      uint64_t v11 = (uint64_t *)(a2 + 128);
      uint64_t v12 = *(unsigned __int8 *)(a2 + 143) - 1LL;
      unsigned __int8 v13 = *(_BYTE *)(a2 + 128 + v12);
    }

    else
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--( a2,  v9,  v10);
      lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
      uint64_t v11 = (uint64_t *)(a2 + 128);
      uint64_t v18 = *(unsigned __int8 *)(a2 + 143) + a2 + 128;
      unsigned __int8 v13 = *(_BYTE *)(v18 - 1) + 1;
      *(_BYTE *)(v18 - 1) = v13;
      uint64_t v12 = *(unsigned __int8 *)(a2 + 143) - 1LL;
    }

    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::insert( *(void *)(a2 + 8 + 8 * v12),  v13,  (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    uint64_t v19 = *(void *)(a2 + 120);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    uint64_t v20 = *v11;
    *(void *)(a4 + 135) = *(uint64_t *)((char *)v11 + 7);
    *(void *)(a4 + 120) = v19;
    *(void *)(a4 + 128) = v20;
    char v17 = *(_BYTE *)(a2 + 143);
    char v15 = 1;
  }

  else
  {
    uint64_t v14 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    *((_BYTE *)v14 + 240) = 0x80;
    *(_OWORD *)uint64_t v14 = 0u;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
    *((_OWORD *)v14 + 3) = 0u;
    *((_OWORD *)v14 + 4) = 0u;
    *((_OWORD *)v14 + 5) = 0u;
    *((_OWORD *)v14 + 6) = 0u;
    *((_OWORD *)v14 + 7) = 0u;
    *((_OWORD *)v14 + 8) = 0u;
    *((_OWORD *)v14 + 9) = 0u;
    *((_OWORD *)v14 + 10) = 0u;
    *((_OWORD *)v14 + 11) = 0u;
    *((_OWORD *)v14 + 12) = 0u;
    *((_OWORD *)v14 + 13) = 0u;
    *((_OWORD *)v14 + 14) = 0u;
    *(void *)a1 = v14;
    char v15 = 1;
    *(_BYTE *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v14;
    *(_BYTE *)(a2 + 143) = 1;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::insert( (uint64_t)v14,  0,  (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(void *)(a4 + 135) = *(void *)(a2 + 135);
    uint64_t v16 = *(void *)(a2 + 128);
    *(void *)(a4 + 120) = *(void *)(a2 + 120);
    *(void *)(a4 + 128) = v16;
    char v17 = *(_BYTE *)(a2 + 143);
  }

  *(_BYTE *)(a4 + 143) = v17;
LABEL_11:
  *(_BYTE *)(a4 + 144) = v15;
}

__n128 lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::insert( uint64_t a1, unsigned int a2, uint64_t a3)
{
  char v3 = *(_BYTE *)(a1 + 240);
  char v4 = v3;
  uint64_t v5 = v3 & 0x7F;
  if (v3 >= 0) {
    int v6 = 7;
  }
  else {
    int v6 = 10;
  }
  if ((_DWORD)v5 == v6) {
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::insert();
  }
  if (v6 == a2) {
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::insert();
  }
  if ((_DWORD)v5 != a2)
  {
    uint64_t v7 = 3 * v5;
    uint64_t v8 = a1 + 8 * v7;
    uint64_t v9 = 24LL * a2 - 8 * v7;
    uint64_t v10 = v8;
    do
    {
      uint64_t v11 = *(void *)(v10 - 24);
      v10 -= 24LL;
      *(void *)uint64_t v8 = v11;
      *(_OWORD *)(v8 + 8) = *(_OWORD *)(v8 - 16);
      uint64_t v8 = v10;
      v9 += 24LL;
    }

    while (v9);
    char v4 = *(_BYTE *)(a1 + 240);
  }

  *(_BYTE *)(a1 + 240) = v4 + 1;
  *(void *)(a1 + 24LL * a2) = *(void *)a3;
  __n128 result = *(__n128 *)(a3 + 8);
  *(__n128 *)(a1 + 24LL * a2 + 8) = result;
  return result;
}

unsigned __int8 *lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::prepareForInsertion( unsigned __int8 *result)
{
  uint64_t v1 = result[143];
  uint64_t v2 = result;
  char v3 = result + 8;
  else {
    int v4 = 10;
  }
  if ((*(_BYTE *)(*(void *)&result[8 * v1] + 240LL) & 0x7F) == v4)
  {
    if (!result[143]) {
      goto LABEL_15;
    }
    uint64_t v5 = 0LL;
    unsigned int v6 = 0;
    do
    {
      else {
        int v7 = 10;
      }
      if ((*(_BYTE *)(v3[v5] + 240LL) & 0x7F) != v7) {
        unsigned int v6 = v5;
      }
      ++v5;
    }

    while (v1 != v5);
    if (!v6)
    {
LABEL_15:
      else {
        int v8 = 10;
      }
      if ((*(_BYTE *)(*v3 + 240LL) & 0x7F) == v8)
      {
        __n128 result = (unsigned __int8 *)lsl::Allocator::aligned_alloc( *(lsl::Lock ***)(*(void *)result + 8LL),  0x100uLL,  0x100uLL);
        uint64_t v9 = **(void **)v2;
        result[240] = 0;
        *(_OWORD *)__n128 result = 0u;
        *((_OWORD *)result + 1) = 0u;
        *((_OWORD *)result + 2) = 0u;
        *((_OWORD *)result + 3) = 0u;
        *((_OWORD *)result + 4) = 0u;
        *((_OWORD *)result + 5) = 0u;
        *((_OWORD *)result + 6) = 0u;
        *((_OWORD *)result + 7) = 0u;
        *((_OWORD *)result + 8) = 0u;
        *((_OWORD *)result + 9) = 0u;
        *((void *)result + 20) = 0LL;
        *((void *)result + 21) = v9;
        **(void **)uint64_t v2 = result;
        if (v2[143] && (__n128 result = (unsigned __int8 *)memmove(v2 + 129, v2 + 128, v2[143]), v2[143]))
        {
          __n128 result = (unsigned __int8 *)memmove(v3 + 1, v3, 8LL * v2[143]);
          LOBYTE(v1) = v2[143] + 1;
        }

        else
        {
          LOBYTE(v1) = 1;
        }

        unsigned int v6 = 0;
        v2[128] = 0;
        uint64_t v10 = *(uint64_t **)v2;
        *((void *)v2 + 1) = **(void **)v2;
        ++*((_BYTE *)v10 + 32);
        v2[143] = v1;
      }

      else
      {
        unsigned int v6 = 0;
      }
    }

    if (v6 + 1 < v1)
    {
      uint64_t v11 = v2 + 128;
      uint64_t v12 = v6;
      do
      {
        int v13 = v12;
        __n128 result = (unsigned __int8 *)lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::splitChild( v3[v12],  v11[v12],  *(lsl::Lock ***)(*(void *)v2 + 8LL));
        uint64_t v16 = v3[v12];
        uint64_t v17 = v11[v12];
        uint64_t v18 = *(void *)(v16 + 8 * v17 + 168);
        unsigned int v19 = v2[v12 + 129];
        if (v19 > (*(_BYTE *)(v18 + 240) & 0x7Fu))
        {
          unsigned __int8 v20 = v17 + 1;
          v11[v12] = v20;
          v2[v12 + 129] = v19 + (~*(_BYTE *)(v18 + 240) | 0x80);
          uint64_t v21 = v3[v12];
          *(void *)&v2[8 * v12 + 16] = *(void *)(v21 + 8LL * v20 + 168);
        }

        ++v12;
      }

      while (v13 + 2 < v2[143]);
    }
  }

  return result;
}

char *lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::splitChild( uint64_t a1, uint64_t a2, lsl::Lock **this)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 240);
  uint64_t v5 = a1 + 168;
  uint64_t v6 = a1 + 168 + 8LL * a2;
  char v7 = *(_BYTE *)(*(void *)v6 + 240LL);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 7;
  }
  else {
    int v10 = 10;
  }
  if (v9 != v10) {
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::splitChild();
  }
  uint64_t v12 = a2;
  if (v8 >= 0) {
    uint64_t v13 = 3LL;
  }
  else {
    uint64_t v13 = 5LL;
  }
  if ((_DWORD)v3 != (_DWORD)a2)
  {
    uint64_t v14 = 3 * v3;
    uint64_t v15 = a1 + 24 * v3;
    uint64_t v16 = 24LL * a2 - 8 * v14;
    uint64_t v17 = v15;
    do
    {
      uint64_t v18 = *(void *)(v17 - 24);
      v17 -= 24LL;
      *(void *)uint64_t v15 = v18;
      *(_OWORD *)(v15 + 8) = *(_OWORD *)(v15 - 16);
      uint64_t v15 = v17;
      v16 += 24LL;
    }

    while (v16);
    a2 = *(unsigned __int8 *)(a1 + 240);
  }

  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(a1, a2, (uint64_t)this);
  }
  uint64_t v19 = v5 + 8LL * a2;
  if (v19 != v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v19 - v6);
    LOBYTE(a2) = *(_BYTE *)(a1 + 240);
  }

  *(_BYTE *)(a1 + 240) = a2 + 1;
  uint64_t v20 = *(void *)v6 + 24LL * v13;
  *(void *)(a1 + 24LL * v12) = *(void *)v20;
  *(_OWORD *)(a1 + 24LL * v12 + 8) = *(_OWORD *)(v20 + 8);
  __n128 result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  uint64_t v24 = result;
  char v25 = *(_BYTE *)(*(void *)v6 + 240LL);
  result[240] = v25 & 0x80;
  if (v25 < 0)
  {
    __int128 v26 = 0uLL;
    *((_OWORD *)result + 13) = 0u;
    *((_OWORD *)result + 14) = 0u;
    *((_OWORD *)result + 11) = 0u;
    *((_OWORD *)result + 12) = 0u;
    *((_OWORD *)result + 10) = 0u;
  }

  else
  {
    *((void *)result + 20) = 0LL;
    __int128 v26 = 0uLL;
  }

  *((_OWORD *)result + 8) = v26;
  *((_OWORD *)result + 9) = v26;
  *((_OWORD *)result + 6) = v26;
  *((_OWORD *)result + 7) = v26;
  *((_OWORD *)result + 4) = v26;
  *((_OWORD *)result + 5) = v26;
  *((_OWORD *)result + 2) = v26;
  *((_OWORD *)result + 3) = v26;
  *(_OWORD *)__n128 result = v26;
  *((_OWORD *)result + 1) = v26;
  unsigned __int8 v27 = v9 + ~(_BYTE)v13;
  __int128 v28 = (uint64_t *)(v5 + 8 * v12);
  v28[1] = (uint64_t)result;
  uint64_t v29 = *v28;
  if (v27)
  {
    uint64_t v30 = v29 + 24LL * v13;
    uint64_t v31 = v30 + 24LL * v27 + 24;
    uint64_t v32 = v30 + 24;
    __int128 v33 = result;
    do
    {
      *(void *)__int128 v33 = *(void *)v32;
      *(_OWORD *)(v33 + 8) = *(_OWORD *)(v32 + 8);
      v32 += 24LL;
      v33 += 24;
    }

    while (v32 != v31);
    uint64_t v29 = *(void *)v6;
  }

  int v34 = *(char *)(v29 + 240);
  if ((v34 & 0x80000000) == 0)
  {
    if (result[240] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t)result, v22, v23);
    }
    __n128 result = (char *)memmove(result + 168, (const void *)(v29 + 8 * v13 + 176), 8LL * v27 + 8);
    uint64_t v29 = *(void *)v6;
    LOBYTE(v34) = *(_BYTE *)(*(void *)v6 + 240LL);
  }

  *(_BYTE *)(v29 + 240) = v34 + ~v27;
  char v35 = v24[240] + v27;
  v24[240] = v35;
  if (v35 >= 0) {
    int v36 = 7;
  }
  else {
    int v36 = 10;
  }
  if ((v35 & 0x7F) == v36
    || ((char v37 = *(_BYTE *)(v29 + 240), v38 = v37, v39 = v37 & 0x7F, v38 >= 0) ? (v40 = 7) : (v40 = 10), v39 == v40))
  {
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::splitChild();
  }

  return result;
}

os_unfair_lock_s *lsl::Lock::lock(lsl::Lock *this)
{
  __n128 result = (os_unfair_lock_s *)*((void *)this + 1);
  if (result)
  {
    os_unfair_lock_assert_not_owner(result);
    return (os_unfair_lock_s *)os_unfair_lock_lock_with_options();
  }

  return result;
}

void lsl::Lock::unlock(lsl::Lock *this)
{
  uint64_t v2 = (os_unfair_lock_s *)*((void *)this + 1);
  if (v2)
  {
    os_unfair_lock_assert_owner(v2);
    os_unfair_lock_unlock(*((os_unfair_lock_t *)this + 1));
  }

mach_vm_address_t lsl::MemoryManager::vm_allocate_bytes(lsl::MemoryManager *this, uint64_t a2)
{
  kern_return_t v5;
  mach_vm_address_t address;
  char v8[1024];
  uint64_t v9;
  int v9 = *MEMORY[0x1895FEE08];
  unint64_t v3 = (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL;
  address = 0x100000000LL;
  int v4 = (vm_map_t *)MEMORY[0x1895FFD48];
  if (mach_vm_map(*MEMORY[0x1895FFD48], &address, v3, *MEMORY[0x189600138], 1, 0, 0LL, 0, 3, 7, 1u))
  {
    uint64_t v5 = vm_allocate(*v4, &address, v3, 1);
    if (v5) {
      lsl::MemoryManager::vm_allocate_bytes(v8, v3, (uint64_t *)this, v5);
    }
  }

  return address;
}

size_t lsl::appendHexToString<unsigned long long>(char *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1895FEE08];
  v7.val[0] = (int8x8_t)vsra_n_u8( (uint8x8_t)vbsl_s8( (int8x8_t)vcgt_u8((uint8x8_t)0xA0A0A0A0A0A0A0A0LL, (uint8x8_t)a2),  (int8x8_t)0x3030303030303030LL,  (int8x8_t)0x5757575757575757LL),  (uint8x8_t)a2,  4uLL);
  int8x8_t v2 = vand_s8((int8x8_t)a2, (int8x8_t)0xF0F0F0F0F0F0F0FLL);
  v7.val[1] = vadd_s8( vbsl_s8( (int8x8_t)vcgt_u8((uint8x8_t)0xA0A0A0A0A0A0A0ALL, (uint8x8_t)v2),  (int8x8_t)0x3030303030303030LL,  (int8x8_t)0x5757575757575757LL),  v2);
  unint64_t v3 = v5;
  vst2_s8(v3, v7);
  v3 += 16;
  *unint64_t v3 = 0;
  return strlcat(a1, v5, 0x400uLL);
}

size_t lsl::appendHexToString<int>(char *a1, __int32 a2, int8x8_t a3)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  a3.i32[0] = a2;
  int8x8_t v3 = vzip1_s8(a3, a3);
  int16x4_t v4 = (int16x4_t)vand_s8(v3, (int8x8_t)0xF000F000F000FLL);
  int8x8_t v6 = vtrn1_s8( (int8x8_t)vsra_n_u16( (uint16x4_t)vbsl_s8( (int8x8_t)vcgt_u16( (uint16x4_t)0xA000A000A000A0LL,  (uint16x4_t)(*(void *)&v3 & 0xFF00FF00FF00FFLL)),  (int8x8_t)0x30003000300030LL,  (int8x8_t)0x57005700570057LL),  (uint16x4_t)(*(void *)&v3 & 0xFF00FF00FF00FFLL),  4uLL),  (int8x8_t)vadd_s16( (int16x4_t)vbsl_s8( (int8x8_t)vcgt_u16((uint16x4_t)0xA000A000A000ALL, (uint16x4_t)v4),  (int8x8_t)0x30003000300030LL,  (int8x8_t)0x57005700570057LL),  v4));
  char v7 = 0;
  return strlcat(a1, (const char *)&v6, 0x400uLL);
}

mach_vm_address_t lsl::Allocator::createAllocator(lsl::Allocator *this)
{
  mach_vm_address_t bytes = lsl::MemoryManager::vm_allocate_bytes((lsl::MemoryManager *)v4, 0x40000LL);
  *(_OWORD *)mach_vm_address_t bytes = 0u;
  *(_OWORD *)(bytes + 16) = 0u;
  *(_OWORD *)(bytes + 32) = 0u;
  *(_OWORD *)(bytes + 48) = 0u;
  *(_OWORD *)(bytes + 80) = 0u;
  *(_OWORD *)(bytes + 96) = 0u;
  *(_OWORD *)(bytes + 128) = 0u;
  *(_OWORD *)(bytes + 144) = 0u;
  *(_OWORD *)(bytes + 64) = 0u;
  *(_OWORD *)(bytes + 112) = 0u;
  int8x8_t v2 = lsl::Allocator::Pool::Pool( bytes + 112,  bytes + 64,  0LL,  bytes,  0x40000LL,  (unint64_t *)(bytes + 160),  261984LL);
  *(void *)(bytes + 64) = bytes;
  *(void *)(bytes + 72) = v2;
  *(void *)(bytes + 80) = v2;
  *(void *)(bytes + 88) = 0LL;
  *(void *)(bytes + 96) = 0LL;
  *(_BYTE *)(bytes + 104) = 0;
  return bytes + 64;
}

lsl::Allocator::Pool *lsl::AllocatorLayout::init( lsl::AllocatorLayout *this, unint64_t a2, const char **a3, const char **a4, void *a5)
{
  if (a2 <= 0x9F) {
    lsl::AllocatorLayout::init();
  }
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  __n128 result = lsl::Allocator::Pool::Pool( (unint64_t)this + 112,  (uint64_t)this + 64,  0LL,  (unint64_t)this,  a2,  (unint64_t *)this + 20,  a2 - 160);
  *((void *)this + 8) = this;
  *((void *)this + 9) = result;
  *((void *)this + 11) = 0LL;
  *((void *)this + 12) = 0LL;
  *((void *)this + 10) = result;
  *((_BYTE *)this + 104) = 0;
  return result;
}

_OWORD *lsl::Allocator::stackAllocatorInternal( lsl::Allocator *this, char *a2, const char **a3, const char **a4, void *a5)
{
  if (!this) {
    lsl::Allocator::stackAllocatorInternal();
  }
  if (!a2) {
    lsl::Allocator::stackAllocatorInternal();
  }
  if ((unint64_t)a2 < 0xA0
    || (int8x8_t v6 = (char *)(((unint64_t)this + 15) & 0xFFFFFFFFFFFFFFF0LL),
        char v7 = (char *)(v6 - (char *)this),
        v7 > a2 - 160))
  {
    lsl::Allocator::stackAllocatorInternal();
  }

  *((_OWORD *)v6 + 8) = 0u;
  *((_OWORD *)v6 + 9) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *(_OWORD *)int8x8_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  uint64_t v8 = v6 + 64;
  lsl::AllocatorLayout::init((lsl::AllocatorLayout *)v6, a2 - v7, a3, a4, a5);
  return v8;
}

void *lsl::Allocator::malloc(lsl::Lock **this, unint64_t a2)
{
  return lsl::Allocator::aligned_alloc(this, 0x10uLL, a2);
}

void *lsl::Allocator::aligned_alloc(lsl::Lock **this, unint64_t a2, unint64_t a3)
{
  int8x8_t v6 = *this;
  lsl::Lock::lock(*this);
  uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] != 1LL) {
    lsl::Allocator::aligned_alloc();
  }
  uint64_t v8 = 16LL;
  if (a2 <= 0x10) {
    uint64_t v9 = 16LL;
  }
  else {
    uint64_t v9 = a2;
  }
  if (a3 > 0x10) {
    uint64_t v8 = a3;
  }
  uint64_t v10 = (v9 + v8 - 1) & -v9;
  uint64_t v11 = *this;
  *((void *)v11 + 4) = a2;
  *((void *)v11 + 5) = a3;
  *((void *)v11 + 6) = v9;
  *((void *)v11 + 7) = v10;
  uint64_t v12 = this[2];
  if (*((_BYTE *)this + 40)) {
    uint64_t v13 = lsl::Allocator::Pool::aligned_alloc_best_fit(v12, v9, v10);
  }
  else {
    uint64_t v13 = lsl::Allocator::Pool::aligned_alloc(v12, v9, v10);
  }
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v15 = (uint64_t)this[2];
    if (((v9 + v10 + 16463) & 0xFFFFFFFFFFFFC000LL) <= 0x40000) {
      unint64_t v16 = 0x40000LL;
    }
    else {
      unint64_t v16 = (v9 + v10 + 16463) & 0xFFFFFFFFFFFFC000LL;
    }
    unint64_t v17 = *(void *)(v15 + 8);
    mach_vm_address_t bytes = (unint64_t *)lsl::MemoryManager::vm_allocate_bytes(*this, v16);
    lsl::Allocator::Pool::Pool(v17, (uint64_t)this, v15, (unint64_t)bytes, v19, bytes, v19);
    *(void *)(v15 + 8) = v17;
    uint64_t v20 = (lsl::Allocator::Pool *)*((void *)this[2] + 1);
    this[2] = v20;
    uint64_t v14 = lsl::Allocator::Pool::aligned_alloc(v20, v9, v10);
    if (!v14) {
      lsl::Allocator::aligned_alloc();
    }
  }

  this[3] = (lsl::Lock *)((char *)this[3] + v10);
  lsl::Lock::unlock(v6);
  return v14;
}

lsl::Allocator::Pool *lsl::Allocator::Pool::aligned_alloc_best_fit( lsl::Allocator::Pool *this, uint64_t a2, unint64_t a3)
{
  if (a2 != 16) {
    return (lsl::Allocator::Pool *)lsl::Allocator::Pool::aligned_alloc(this, a2, a3);
  }
  int16x4_t v4 = (void *)**((void **)this + 3);
  uint64_t v5 = 0LL;
  unint64_t v6 = -1LL;
  do
  {
    uint64_t v7 = v4[1];
    if ((v7 & 1) == 0)
    {
      unint64_t v8 = (v7 & 0xFFFFFFFFFFFFFFFCLL) - (void)v4 - 16;
      if (v8 >= a3)
      {
        if (v8 - a3 < v6)
        {
          unint64_t v6 = v8 - a3;
          uint64_t v5 = v4;
        }

        if (v8 == a3)
        {
          uint64_t v5 = v4;
          goto LABEL_16;
        }
      }
    }

    int16x4_t v4 = (void *)*v4;
  }

  while ((v4 & 1) == 0 && v4);
  if (!v5)
  {
    a2 = 16LL;
    return (lsl::Allocator::Pool *)lsl::Allocator::Pool::aligned_alloc(this, a2, a3);
  }

void *lsl::Allocator::Pool::aligned_alloc(lsl::Allocator::Pool *this, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (lsl::Allocator::AllocationMetadata *)*((void *)this + 3);
  if ((lsl::Allocator::Pool *)lsl::Allocator::AllocationMetadata::pool(v6, 1) != this) {
    lsl::Allocator::Pool::aligned_alloc();
  }
  unint64_t v7 = (*((void *)v6 + 1) & 0xFFFFFFFFFFFFFFFCLL) - (void)v6 - 16;
  unint64_t v8 = 0LL;
  if (v7 >= a3 + 16)
  {
    uint64_t v9 = ((unint64_t)v6 + a2 + 15) & -a2;
    if (v9 - ((uint64_t)v6 + 16) <= v7 - (a3 + 16))
    {
      if ((lsl::Allocator::AllocationMetadata *)((char *)v6 + 16) != (lsl::Allocator::AllocationMetadata *)v9)
      {
        lsl::Allocator::AllocationMetadata::reserve(v6, (unsigned __int16)(v9 - (_WORD)v6 - 32), 0);
        unint64_t v6 = (lsl::Allocator::AllocationMetadata *)*((void *)this + 3);
      }

      unint64_t v8 = (void *)((char *)v6 + 16);
      lsl::Allocator::AllocationMetadata::reserve(v6, a3, 1u);
    }
  }

  return v8;
}

void lsl::Allocator::freeObject(lsl::Allocator *this, void *a2)
{
  if (this)
  {
    int8x8_t v3 = (lsl::Lock ***)lsl::Allocator::AllocationMetadata::pool((lsl::Allocator *)((char *)this - 16), 1);
    lsl::Allocator::free(*v3, this);
  }

uint64_t lsl::Allocator::AllocationMetadata::forPtr(lsl::Allocator::AllocationMetadata *this, void *a2)
{
  return (uint64_t)this - 16;
}

unint64_t lsl::Allocator::AllocationMetadata::pool(lsl::Allocator::AllocationMetadata *this, int a2)
{
  for (uint64_t i = *(lsl::Allocator::AllocationMetadata **)this;
        i && (i & 1) == 0LL;
        uint64_t i = *(lsl::Allocator::AllocationMetadata **)i)
  {
    if (a2)
    {
      uint64_t v4 = *((void *)this + 1);
      if ((v4 & 1) == 0 && (((v4 & 0xFFFFFFFFFFFFFFFCLL) - (void)this) & 0xFFFFFFFFFFFFFFF8LL) != 0x10)
      {
        unint64_t result = *((void *)this + 2);
        if (result) {
          return result;
        }
      }
    }

    this = i;
  }

  return (unint64_t)i & 0xFFFFFFFFFFFFFFFELL;
}

void lsl::Allocator::free(lsl::Lock **this, void *a2)
{
  uint64_t v4 = *this;
  lsl::Lock::lock(*this);
  if (a2)
  {
    this[3] = (lsl::Lock *)((char *)this[3] + (void)a2 - (*(a2 - 1) & 0xFFFFFFFFFFFFFFFCLL));
    lsl::Allocator::AllocationMetadata::deallocate((lsl::Allocator::AllocationMetadata *)(a2 - 2));
  }

  lsl::Lock::unlock(v4);
}

unint64_t lsl::Allocator::AllocationMetadata::deallocate(lsl::Allocator::AllocationMetadata *this)
{
  uint64_t v1 = *((void *)this + 1);
  if ((v1 & 1) == 0) {
    lsl::Allocator::AllocationMetadata::deallocate();
  }
  unint64_t v3 = lsl::Allocator::AllocationMetadata::pool(this, 1);
  *((void *)this + 1) = v1 & 0xFFFFFFFFFFFFFFFCLL;
  return lsl::Allocator::AllocationMetadata::coalesce((unint64_t *)this, v3);
}

uint64_t lsl::Allocator::realloc(lsl::Lock **this, void *a2, unint64_t a3)
{
  unint64_t v6 = *this;
  lsl::Lock::lock(*this);
  if (!a2) {
    goto LABEL_6;
  }
  unint64_t v7 = (lsl::Allocator::AllocationMetadata *)(a2 - 2);
  uint64_t v8 = 16LL;
  if (a3 > 0x10) {
    uint64_t v8 = a3;
  }
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v10 = (*(a2 - 1) & 0xFFFFFFFFFFFFFFFCLL) - (void)v7;
  if (v10 - 16 >= v9)
  {
    if (v10 - 16 > v9) {
      lsl::Allocator::AllocationMetadata::returnToNext(v7, v9);
    }
    goto LABEL_9;
  }

  if (lsl::Allocator::AllocationMetadata::consumeFromNext(v7, v9))
  {
LABEL_9:
    this[3] = (lsl::Lock *)((char *)this[3] + v9 - v10 + 16);
    uint64_t v11 = 1LL;
    goto LABEL_10;
  }

LABEL_6:
  uint64_t v11 = 0LL;
LABEL_10:
  lsl::Lock::unlock(v6);
  return v11;
}

uint64_t lsl::Allocator::AllocationMetadata::consumeFromNext( lsl::Allocator::AllocationMetadata *this, uint64_t a2)
{
  uint64_t v2 = *((void *)this + 1);
  unint64_t v3 = v2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((v2 & 2) != 0) {
    unint64_t v4 = 0LL;
  }
  else {
    unint64_t v4 = v2 & 0xFFFFFFFFFFFFFFFCLL;
  }
  uint64_t v5 = *(void *)(v4 + 8);
  if ((v5 & 1) != 0) {
    return 0LL;
  }
  unint64_t v7 = (char *)this + a2 + 16;
  uint64_t v8 = &v7[-v3];
  unint64_t v9 = (v5 & 0xFFFFFFFFFFFFFFFCLL) - v4;
  if (v9 - 16 >= (unint64_t)&v7[-v3])
  {
    lsl::Allocator::AllocationMetadata::AllocationMetadata( (unint64_t)v7,  this,  v9 - 16 - (void)&v7[-v3],  v5 & 3,  v2 & 3);
    return 1LL;
  }

  uint64_t result = 0LL;
  if ((v5 & 2) == 0 && v8 == (char *)v9)
  {
    *((void *)this + 1) = v5 | 1;
    *(void *)(v5 & 0xFFFFFFFFFFFFFFFCLL) = this;
    return 1LL;
  }

  return result;
}

unint64_t lsl::Allocator::AllocationMetadata::returnToNext( lsl::Allocator::AllocationMetadata *this, uint64_t a2)
{
  unint64_t v4 = lsl::Allocator::AllocationMetadata::pool(this, 1);
  lsl::Allocator::AllocationMetadata::AllocationMetadata( (unint64_t)this + a2 + 16,  this,  (*((void *)this + 1) & 0xFFFFFFFFFFFFFFFCLL) - ((void)this + a2) - 32,  0LL,  *((void *)this + 1) & 3LL);
  uint64_t v5 = *((void *)this + 1);
  if ((v5 & 2) != 0) {
    unint64_t v6 = 0LL;
  }
  else {
    unint64_t v6 = (unint64_t *)(v5 & 0xFFFFFFFFFFFFFFFCLL);
  }
  return lsl::Allocator::AllocationMetadata::coalesce(v6, v4);
}

char *lsl::Allocator::strdup(lsl::Lock **this, const char *__s)
{
  unint64_t v4 = strlen(__s) + 1;
  uint64_t v5 = (char *)lsl::Allocator::aligned_alloc(this, 0x10uLL, v4);
  strlcpy(v5, __s, v4);
  return v5;
}

uint64_t lsl::Allocator::defaultAllocator(lsl::Allocator *this)
{
  return lsl::Allocator::defaultAllocator(void)::allocator;
}

void **___ZN3lsl9Allocator16defaultAllocatorEv_block_invoke(lsl::Allocator *a1)
{
  uint64_t result = (void **)lsl::Allocator::createAllocator(a1);
  lsl::Allocator::defaultAllocator(void)::allocator = (uint64_t)result;
  uint64_t v2 = *result;
  *uint64_t v2 = 0LL;
  v2[1] = &lsl::Allocator::defaultAllocator(void)::unfairLock;
  return result;
}

uint64_t lsl::Allocator::forEachVMAllocatedBuffer(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void **)(result + 16);
  if (v2)
  {
    while (1)
    {
      unint64_t v4 = v2[4];
      uint64_t v5 = v2[5];
LABEL_6:
      uint64_t v2 = (void *)v2[2];
      if (!v2) {
        return result;
      }
    }

    uint64_t v5 = v2[5];
LABEL_5:
    v6[0] = v2[4];
    v6[1] = v5;
    uint64_t result = (*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v6);
    goto LABEL_6;
  }

  return result;
}

void ___ZN3lsl9AllocatorD2Ev_block_invoke()
{
}

void lsl::Allocator::~Allocator(lsl::Allocator *this)
{
  v1[0] = MEMORY[0x1895FED80];
  v1[1] = 0x40000000LL;
  v1[2] = ___ZN3lsl9AllocatorD2Ev_block_invoke;
  v1[3] = &__block_descriptor_tmp_18_0;
  v1[4] = this;
  lsl::Allocator::forEachVMAllocatedBuffer((uint64_t)this, (uint64_t)v1);
}

lsl::Allocator::Pool *lsl::Allocator::Pool::Pool( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t *a6, uint64_t a7)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = a3;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = a4;
  *(void *)(a1 + 40) = a5;
  *a6 = a1 | 1;
  a6[1] = ((unint64_t)a6 + (a7 & 0xFFFFFFFFFFFFFFF0LL)) | 2;
  *(void *)(a1 + 24) = a6;
  uint64_t v8 = lsl::Allocator::Pool::aligned_alloc((lsl::Allocator::Pool *)a1, 16LL, 48LL);
  *uint64_t v8 = 0u;
  v8[1] = 0u;
  void v8[2] = 0u;
  *(void *)(a1 + 8) = v8;
  return (lsl::Allocator::Pool *)a1;
}

unint64_t lsl::Allocator::AllocationMetadata::reserve( lsl::Allocator::AllocationMetadata *this, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *((void *)this + 1);
  if ((v3 & 1) != 0) {
    lsl::Allocator::AllocationMetadata::reserve();
  }
  return lsl::Allocator::AllocationMetadata::AllocationMetadata( (unint64_t)this + a2 + 16,  this,  (v3 & 0xFFFFFFFFFFFFFFFCLL) - ((void)this + a2) - 32,  2LL,  a3);
}

unint64_t lsl::Allocator::AllocationMetadata::AllocationMetadata( unint64_t this, lsl::Allocator::AllocationMetadata *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)this = 0LL;
  *(void *)(this + 8) = 0LL;
  unint64_t v10 = lsl::Allocator::AllocationMetadata::pool(a2, 1);
  if (!v10) {
    lsl::Allocator::AllocationMetadata::AllocationMetadata();
  }
  *(void *)this = a2;
  if ((a4 & 2) != 0)
  {
    *(void *)(v10 + 24) = this;
  }

  else
  {
    uint64_t v11 = *((void *)a2 + 1);
    if ((v11 & 2) != 0) {
      uint64_t v12 = 0LL;
    }
    else {
      uint64_t v12 = (void *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
    }
    *uint64_t v12 = this;
  }

  *((void *)a2 + 1) = this | a5;
  unint64_t v13 = (this + 16 + a3) | a4;
  *(void *)(this + 8) = v13;
  if ((v13 & 1) == 0 && (((v13 & 0xFFFFFFFFFFFFFFFCLL) - this) & 0xFFFFFFFFFFFFFFF8LL) != 0x10) {
    *(void *)(this + 16) = v10;
  }
  if ((v13 & 2) == 0) {
    *(void *)(v13 & 0xFFFFFFFFFFFFFFFCLL) = this;
  }
  return this;
}

unint64_t lsl::Allocator::AllocationMetadata::setPoolHint( unint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if ((v2 & 1) == 0)
  {
    unint64_t v3 = result;
    if ((((v2 & 0xFFFFFFFFFFFFFFFCLL) - result) & 0xFFFFFFFFFFFFFFF8LL) != 0x10)
    {
      if (!a2)
      {
        if ((*(void *)result & 1LL) != 0) {
          unint64_t v4 = 0LL;
        }
        else {
          unint64_t v4 = *(lsl::Allocator::AllocationMetadata **)result;
        }
        uint64_t result = lsl::Allocator::AllocationMetadata::pool(v4, 1);
        a2 = result;
        if (!result) {
          lsl::Allocator::AllocationMetadata::setPoolHint();
        }
      }

      *(void *)(v3 + 16) = a2;
    }
  }

  return result;
}

unint64_t lsl::Allocator::AllocationMetadata::coalesce(unint64_t *a1, unint64_t a2)
{
  unint64_t v3 = a1[1];
  if ((v3 & 2) == 0 && (v3 & 0xFFFFFFFFFFFFFFFCLL) != 0)
  {
    unint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFFFCLL) + 8);
    if ((v4 & 1) == 0)
    {
      a1[1] = v4;
      if ((v4 & 2) == 0) {
        *(void *)(v4 & 0xFFFFFFFFFFFFFFFCLL) = a1;
      }
      unint64_t v3 = v4;
    }
  }

  unint64_t v5 = *a1;
  if (*a1) {
    BOOL v6 = (*a1 & 1) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6 || (*(_BYTE *)(v5 + 8) & 1) != 0)
  {
    unint64_t v5 = (unint64_t)a1;
  }

  else
  {
    *(void *)(v5 + 8) = v3;
    if ((v3 & 2) == 0)
    {
      unint64_t v7 = a1[1];
      if ((v7 & 2) != 0) {
        uint64_t v8 = 0LL;
      }
      else {
        uint64_t v8 = (void *)(v7 & 0xFFFFFFFFFFFFFFFCLL);
      }
      *uint64_t v8 = v5;
    }
  }

  unint64_t result = lsl::Allocator::AllocationMetadata::setPoolHint(v5, a2);
  if ((*(_BYTE *)(v5 + 8) & 2) != 0) {
    *(void *)(a2 + 24) = v5;
  }
  return result;
}

uint64_t lsl::AllocatorLayout::minSize(lsl::AllocatorLayout *this)
{
  return 240LL;
}

size_t OUTLINED_FUNCTION_0_0(uint64_t a1, const char *a2)
{
  return strlcat(v2, a2, 0x400uLL);
}

size_t OUTLINED_FUNCTION_1_0(uint64_t a1, uint64_t a2)
{
  return lsl::appendHexToString<unsigned long long>(v2, a2);
}

mach_port_context_t dyld_process_info_notify_base::dyld_process_info_notify_base( mach_port_context_t a1, uint64_t a2, const void *a3, const void *a4, int a5, kern_return_t *a6)
{
  kern_return_t v15;
  kern_return_t v16;
  kern_return_t v17;
  dispatch_source_s *v19;
  uint64_t v20;
  dispatch_source_s *v21;
  void v22[5];
  void handler[5];
  mach_port_t previous;
  mach_port_options_t options;
  RemoteBuffer::RemoteBuffer((RemoteBuffer *)a1);
  *(_DWORD *)(v12 + 24) = 0;
  *(void *)(v12 + 32) = a2;
  *(void *)(a1 + 40) = _Block_copy(a3);
  unint64_t v13 = _Block_copy(a4);
  *(_DWORD *)(a1 + 76) = 0;
  *(void *)(a1 + 48) = v13;
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  *(_DWORD *)(a1 + 72) = a5;
  *(_BYTE *)(a1 + 80) = 0;
  if (!a6) {
    dyld_process_info_notify_base::dyld_process_info_notify_base();
  }
  dispatch_retain(*(dispatch_object_t *)(a1 + 32));
  *(_OWORD *)&options.flags = xmmword_1801C2FD0;
  options.reserved[1] = 0LL;
  uint64_t v14 = (ipc_space_t *)MEMORY[0x1895FFD48];
  uint64_t v15 = mach_port_construct(*MEMORY[0x1895FFD48], &options, a1, (mach_port_name_t *)(a1 + 76));
  *a6 = v15;
  if (v15
    || (previous = 0,
        unint64_t v16 = mach_port_request_notification(*v14, *(_DWORD *)(a1 + 76), 70, 1u, *(_DWORD *)(a1 + 76), 0x15u, &previous),
        *a6 = v16,
        v16 | previous)
    || (unint64_t v17 = task_dyld_process_info_notify_register(*(_DWORD *)(a1 + 72), *(_DWORD *)(a1 + 76)), (*a6 = v17) != 0)
    || (uint64_t v19 = dispatch_source_create( MEMORY[0x1895FE808],  *(unsigned int *)(a1 + 76),  0LL,  *(dispatch_queue_t *)(a1 + 32)),  (*(void *)(a1 + 64) = v19) == 0LL))
  {
    dyld_process_info_notify_base::teardownMachPorts(a1);
  }

  else
  {
    uint64_t v20 = MEMORY[0x1895FED80];
    handler[0] = MEMORY[0x1895FED80];
    handler[1] = 0x40000000LL;
    handler[2] = ___ZN29dyld_process_info_notify_baseC2EP16dispatch_queue_sU13block_pointerFvbyyPKhPKcEU13block_pointerFvvEjPi_block_invoke;
    handler[3] = &__block_descriptor_tmp_10;
    handler[4] = a1;
    dispatch_source_set_event_handler(v19, handler);
    uint64_t v21 = *(dispatch_source_s **)(a1 + 64);
    v22[0] = v20;
    v22[1] = 0x40000000LL;
    v22[2] = ___ZN29dyld_process_info_notify_baseC2EP16dispatch_queue_sU13block_pointerFvbyyPKhPKcEU13block_pointerFvvEjPi_block_invoke_2;
    v22[3] = &__block_descriptor_tmp_3_0;
    v22[4] = a1;
    dispatch_source_set_cancel_handler(v21, v22);
    dispatch_activate(*(dispatch_object_t *)(a1 + 64));
    atomic_store(1u, (unsigned __int8 *)(a1 + 80));
  }

  return a1;
}

mach_port_context_t dyld_process_info_notify_base::teardownMachPorts(mach_port_context_t this)
{
  mach_port_name_t v1 = *(_DWORD *)(this + 76);
  if (v1)
  {
    mach_port_context_t v2 = this;
    this = task_dyld_process_info_notify_deregister(*(_DWORD *)(this + 72), v1);
    if (!(_DWORD)this) {
      this = mach_port_destruct(*MEMORY[0x1895FFD48], *(_DWORD *)(v2 + 76), 0, v2);
    }
    *(_DWORD *)(v2 + 76) = 0;
  }

  return this;
}

void ___ZN29dyld_process_info_notify_baseC2EP16dispatch_queue_sU13block_pointerFvbyyPKhPKcEU13block_pointerFvvEjPi_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void dyld_process_info_notify_base::handleEvent( dyld_process_info_notify_base *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = MEMORY[0x1895FE128](this, a2, a3, a4);
  uint64_t v17 = *MEMORY[0x1895FEE08];
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(v4 + 80));
  if ((v5 & 1) != 0)
  {
    uint64_t v6 = v4;
    bzero(&msg, 0x8000uLL);
    if (mach_msg(&msg, 50333698, 0, 0x7FCCu, *(_DWORD *)(v6 + 76), 0, 0) || (msg.msgh_bits & 0x80000000) != 0)
    {
      uint64_t v8 = (FILE *)*MEMORY[0x1895FEE10];
      mach_msg_id_t msgh_id = msg.msgh_id;
      goto LABEL_10;
    }

    mach_msg_id_t msgh_id = msg.msgh_id;
    if (msg.msgh_id >= 0x2000)
    {
      if (msg.msgh_id == 12288)
      {
        if (msg.msgh_size == 24)
        {
          uint64_t v12 = *(void *)(v6 + 56);
          if (v12) {
            (*(void (**)(void))(v12 + 16))();
          }
          goto LABEL_30;
        }

        goto LABEL_29;
      }

      if (msg.msgh_id != 0x2000) {
        goto LABEL_7;
      }
    }

    else
    {
      if (msg.msgh_id == 70)
      {
        uint64_t v11 = (mach_msg_bits_t *)((char *)&msg.msgh_bits + ((msg.msgh_size + 3LL) & 0x1FFFFFFFCLL));
        if (*v11 || v11[1] < 0x34u || v11[10]) {
          goto LABEL_31;
        }
        goto LABEL_25;
      }

      if (msg.msgh_id != 4096)
      {
LABEL_7:
        if ((msg.msgh_id & 0x4000) != 0)
        {
LABEL_31:
          mach_msg_destroy(&msg);
          return;
        }

        uint64_t v8 = (FILE *)*MEMORY[0x1895FEE10];
LABEL_10:
        fprintf(v8, "dyld: received unknown message id=0x%X, size=%d\n", msgh_id, msg.msgh_size);
        goto LABEL_31;
      }
    }

    if (msg.msgh_size >= 0x30
      && msg.msgh_size >= v15
      && v16 <= msg.msgh_size
      && msg.msgh_size - v15 >= 32 * (unint64_t)v14)
    {
      if (!v14)
      {
LABEL_30:
        dyld_process_info_notify_base::replyToMonitoredProcess((dyld_process_info_notify_base *)v6, &msg);
        goto LABEL_31;
      }

      unint64_t v9 = 0LL;
      unint64_t v10 = (char *)&msg + v15;
      while (*((_DWORD *)v10 + 6) <= msg.msgh_size - v16)
      {
        (*(void (**)(void))(*(void *)(v6 + 40) + 16LL))();
        ++v9;
        v10 += 32;
        if (v9 >= v14) {
          goto LABEL_30;
        }
      }

LABEL_29:
      dyld_process_info_notify_base::disconnect((dyld_process_info_notify_base *)v6);
      goto LABEL_30;
    }

LABEL_25:
    dyld_process_info_notify_base::disconnect((dyld_process_info_notify_base *)v6);
    goto LABEL_31;
  }

mach_port_context_t ___ZN29dyld_process_info_notify_baseC2EP16dispatch_queue_sU13block_pointerFvbyyPKhPKcEU13block_pointerFvvEjPi_block_invoke_2( uint64_t a1)
{
  return dyld_process_info_notify_base::teardownMachPorts(*(void *)(a1 + 32));
}

void dyld_process_info_notify_base::~dyld_process_info_notify_base(dyld_process_info_notify_base *this)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)this + 80);
  if ((v2 & 1) != 0) {
    fwrite( "dyld: ~dyld_process_info_notify_base called while still connected\n",  0x42uLL,  1uLL,  (FILE *)*MEMORY[0x1895FEE10]);
  }
  _Block_release(*((const void **)this + 5));
  _Block_release(*((const void **)this + 7));
  _Block_release(*((const void **)this + 6));
  dispatch_release(*((dispatch_object_t *)this + 4));
  RemoteBuffer::~RemoteBuffer((void **)this);
}

void dyld_process_info_notify_base::disconnect(dyld_process_info_notify_base *this)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)this + 80);
  if ((v1 & 1) != 0)
  {
    atomic_store(0, (unsigned __int8 *)this + 80);
    unint64_t v3 = (dispatch_source_s *)*((void *)this + 8);
    if (v3)
    {
      dispatch_source_cancel(v3);
      dispatch_release(*((dispatch_object_t *)this + 8));
      *((void *)this + 8) = 0LL;
    }

    if (*((void *)this + 6))
    {
      uint64_t v4 = (dispatch_queue_s *)*((void *)this + 4);
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = ___ZN29dyld_process_info_notify_base10disconnectEv_block_invoke;
      block[3] = &__block_descriptor_tmp_5_1;
      block[4] = this;
      dispatch_async(v4, block);
    }
  }

uint64_t ___ZN29dyld_process_info_notify_base10disconnectEv_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48LL) + 16LL))();
}

void dyld_process_info_notify_base::release(dispatch_queue_s **this)
{
  unsigned __int8 v2 = (unsigned int *)(this + 3);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3 - 1, v2));
  if (!v3)
  {
    dyld_process_info_notify_base::disconnect((dyld_process_info_notify_base *)this);
    uint64_t v4 = this[4];
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = ___ZN29dyld_process_info_notify_base7releaseEv_block_invoke;
    block[3] = &__block_descriptor_tmp_6_0;
    block[4] = this;
    dispatch_async(v4, block);
  }

void ___ZN29dyld_process_info_notify_base7releaseEv_block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = *(dyld_process_info_notify_base **)(a1 + 32);
  if (v1)
  {
    dyld_process_info_notify_base::~dyld_process_info_notify_base(v1);
    free(v2);
  }

void dyld_process_info_notify_base::replyToMonitoredProcess( dyld_process_info_notify_base *this, mach_msg_header_t *a2)
{
  mach_msg_bits_t v4 = a2->msgh_bits & 0x1F;
  mach_port_t msgh_remote_port = a2->msgh_remote_port;
  *(void *)&msg.msgh_voucher_port = 0LL;
  msg.mach_port_t msgh_remote_port = msgh_remote_port;
  msg.msgh_local_port = 0;
  msg.msgh_bits = v4;
  msg.msgh_size = 24;
  if (mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0)) {
    dyld_process_info_notify_base::disconnect(this);
  }
  else {
    a2->mach_port_t msgh_remote_port = 0;
  }
}

mach_port_context_t _dyld_process_info_notify( int a1, uint64_t a2, const void *a3, const void *a4, kern_return_t *a5)
{
  kern_return_t *v9;
  void *v10;
  mach_port_context_t result;
  unsigned __int8 v12;
  int v13;
  unint64_t v13 = 0;
  if (a5) {
    unint64_t v9 = a5;
  }
  else {
    unint64_t v9 = &v13;
  }
  uint64_t *v9 = 0;
  unint64_t v10 = malloc(0x58uLL);
  unint64_t result = dyld_process_info_notify_base::dyld_process_info_notify_base((mach_port_context_t)v10, a2, a3, a4, a1, v9);
  uint64_t v12 = atomic_load((unsigned __int8 *)(result + 80));
  if ((v12 & 1) == 0)
  {
    dyld_process_info_notify_base::release((dispatch_queue_s **)result);
    return 0LL;
  }

  return result;
}

void *dyld_process_info_notify_base::setNotifyMain(uint64_t a1, const void *a2)
{
  unint64_t result = *(void **)(a1 + 56);
  if (result != a2)
  {
    _Block_release(result);
    unint64_t result = _Block_copy(a2);
    *(void *)(a1 + 56) = result;
  }

  return result;
}

uint64_t _dyld_process_info_notify_retain(uint64_t result)
{
  unsigned __int8 v1 = (unsigned int *)(result + 24);
  do
    unsigned int v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return result;
}

const char *__cdecl macho_arch_name_for_cpu_type(cpu_type_t type, cpu_subtype_t subtype)
{
  unsigned int v2 = dyld3::MachOFile::archName(*(dyld3::MachOFile **)&type, subtype);
  if (!strcmp(v2, "unknown")) {
    return 0LL;
  }
  else {
    return v2;
  }
}

const char *__cdecl macho_arch_name_for_mach_header(const mach_header *mh)
{
  if (!mh) {
    mh = (const mach_header *)_dyld_get_prog_image_header();
  }
  unsigned __int8 v1 = dyld3::MachOFile::archName((dyld3::MachOFile *)mh->cputype, mh->cpusubtype);
  if (!strcmp(v1, "unknown")) {
    return 0LL;
  }
  else {
    return v1;
  }
}

int macho_for_each_slice(const char *path, void *callback)
{
  int v3 = open(path, 0, 0LL);
  if (v3 == -1) {
    return *__error();
  }
  int v4 = v3;
  int v5 = macho_for_each_slice_in_fd(v3, callback);
  close(v4);
  return v5;
}

int macho_for_each_slice_in_fd(int fd, void *callback)
{
  if (fstat(fd, &v13) == -1) {
    return *__error();
  }
  int v4 = (dyld3::MachOFile *)mmap(0LL, v13.st_size, 1, 2, fd, 0LL);
  if (v4 == (dyld3::MachOFile *)-1LL) {
    return *__error();
  }
  int v5 = v4;
  Diagnostics::Diagnostics((Diagnostics *)v12);
  unint64_t v7 = (dyld3::FatFile *)dyld3::FatFile::isFatFile(v5, v6);
  if (v7)
  {
    v11[0] = MEMORY[0x1895FED80];
    v11[1] = 0x40000000LL;
    v11[2] = __macho_for_each_slice_in_fd_block_invoke;
    void v11[3] = &unk_189630D48;
    void v11[4] = callback;
    void v11[5] = v5;
    dyld3::FatFile::forEachSlice(v7, (Diagnostics *)v12, v13.st_size, (uint64_t)v11);
    if (Diagnostics::hasError((Diagnostics *)v12)) {
      int v8 = 88;
    }
    else {
      int v8 = 0;
    }
  }

  else if (dyld3::MachOFile::isMachO(v5, (Diagnostics *)v12, v13.st_size))
  {
    if (callback) {
      (*((void (**)(void *, dyld3::MachOFile *, void, off_t, char *))callback + 2))( callback,  v5,  0LL,  v13.st_size,  &v10);
    }
    int v8 = 0;
  }

  else
  {
    int v8 = 79;
  }

  munmap(v5, v13.st_size);
  mach_o::Error::~Error((mach_o::Error *)v12);
  return v8;
}

uint64_t __macho_for_each_slice_in_fd_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))( result,  a4,  a4 - *(void *)(a1 + 40),  a5,  a6);
  }
  return result;
}

int macho_best_slice(const char *path, void *bestSlice)
{
  int v3 = open(path, 0, 0LL);
  if (v3 == -1) {
    return *__error();
  }
  int v4 = v3;
  int v5 = macho_best_slice_in_fd(v3, bestSlice);
  close(v4);
  return v5;
}

int macho_best_slice_in_fd(int fd, void *bestSlice)
{
  unsigned int v4 = dyld3::MachOFile::currentPlatform(*(dyld3::MachOFile **)&fd);
  int v5 = (dyld3::GradedArchs *)dyld3::GradedArchs::forCurrentOS((dyld3::GradedArchs *)"");
  uint64_t v6 = (dyld3::GradedArchs *)dyld3::GradedArchs::forCurrentOS((dyld3::GradedArchs *)1);
  return macho_best_slice_fd_internal(fd, v4, v5, v6, 0, (uint64_t)bestSlice);
}

uint64_t macho_best_slice_fd_internal( int a1, unsigned int a2, dyld3::GradedArchs *a3, dyld3::GradedArchs *a4, char a5, uint64_t a6)
{
  if (fstat(a1, &v40) != -1)
  {
    uint64_t v12 = (char *)mmap(0LL, v40.st_size, 1, 2, a1, 0LL);
    if (v12 != (char *)-1LL)
    {
      stat v13 = v12;
      Diagnostics::Diagnostics((Diagnostics *)v39);
      mach_msg_size_t v15 = (dyld3::FatFile *)dyld3::FatFile::isFatFile(v13, v14);
      if (v15)
      {
        uint64_t v35 = 0LL;
        int v36 = &v35;
        uint64_t v37 = 0x2000000000LL;
        int v38 = 0;
        uint64_t v31 = 0LL;
        uint64_t v32 = &v31;
        uint64_t v33 = 0x2000000000LL;
        uint64_t v34 = 0LL;
        uint64_t v27 = 0LL;
        __int128 v28 = &v27;
        uint64_t v29 = 0x2000000000LL;
        uint64_t v30 = 0LL;
        v24[0] = MEMORY[0x1895FED80];
        v24[1] = 0x40000000LL;
        _OWORD v24[2] = ___Z28macho_best_slice_fd_internaliN5dyld38PlatformERKNS_11GradedArchsES3_bU13block_pointerFvPK11mach_headerymE_block_invoke;
        v24[3] = &unk_189630D70;
        char v26 = a5;
        v24[4] = &v35;
        v24[5] = &v31;
        v24[6] = &v27;
        v24[7] = a3;
        _OWORD v24[8] = v13;
        v24[9] = a4;
        unsigned int v25 = a2;
        dyld3::FatFile::forEachSlice(v15, (Diagnostics *)v39, v40.st_size, (uint64_t)v24);
        BOOL hasError = Diagnostics::hasError((Diagnostics *)v39);
        uint64_t v18 = 0LL;
        if (!hasError)
        {
          if (*((_DWORD *)v36 + 6))
          {
            if (a6) {
              (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(a6 + 16))(a6, &v13[v32[3]], v32[3], v28[3]);
            }
            uint64_t v18 = 0LL;
          }

          else
          {
            uint64_t v18 = 86LL;
          }
        }

        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&v35, 8);
        if (hasError)
        {
          uint64_t v18 = 88LL;
LABEL_25:
          mach_o::Error::~Error((mach_o::Error *)v39);
          return v18;
        }
      }

      else
      {
        uint64_t v19 = dyld3::MachOFile::isMachO(v13, v16);
        if (v19)
        {
          uint64_t v20 = v19;
          if (v19[3] == 2
            && (uint64_t v21 = (dyld3::MachOFile *)dyld3::GradedArchs::grade(a3, v19[1], v19[2], a5), (_DWORD)v21)
            && (int v22 = dyld3::MachOFile::currentPlatform(v21), dyld3::MachOFile::builtForPlatform(v20, v22, 0))
            || dyld3::GradedArchs::grade(a4, v20[1], v20[2], a5)
            && dyld3::MachOFile::loadableIntoProcess(v20, a2, "", 0))
          {
            if (a6) {
              (*(void (**)(uint64_t, int *, void, off_t))(a6 + 16))(a6, v20, 0LL, v40.st_size);
            }
            uint64_t v18 = 0LL;
          }

          else
          {
            uint64_t v18 = 86LL;
          }
        }

        else
        {
          uint64_t v18 = 79LL;
        }
      }

      munmap(v13, v40.st_size);
      goto LABEL_25;
    }
  }

  return *__error();
}

uint64_t ___Z28macho_best_slice_fd_internaliN5dyld38PlatformERKNS_11GradedArchsES3_bU13block_pointerFvPK11mach_headerymE_block_invoke( uint64_t a1, const void *a2, int a3, dyld3::MachOFile *this, uint64_t a5)
{
  uint64_t result = (uint64_t)dyld3::MachOFile::isMachO(this, a2);
  if (result)
  {
    unint64_t v9 = (_DWORD *)result;
    int v10 = *(_DWORD *)(result + 8);
    int v11 = *(_DWORD *)(result + 4);
    int v12 = *(unsigned __int8 *)(a1 + 84);
    if (*(_DWORD *)(result + 12) == 2)
    {
      uint64_t result = dyld3::GradedArchs::grade(*(dyld3::GradedArchs **)(a1 + 56), v11, v10, v12 != 0);
      int v13 = result;
      int v14 = dyld3::MachOFile::currentPlatform((dyld3::MachOFile *)result);
      uint64_t result = dyld3::MachOFile::builtForPlatform(v9, v14, 0);
      if ((result & 1) == 0) {
        return result;
      }
LABEL_8:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (char *)this - *(void *)(a1 + 64);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a5;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v13;
      return result;
    }

    uint64_t result = dyld3::GradedArchs::grade(*(dyld3::GradedArchs **)(a1 + 72), v11, v10, v12 != 0);
    if ((int)result > *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      int v13 = result;
      uint64_t result = dyld3::MachOFile::loadableIntoProcess(v9, *(_DWORD *)(a1 + 80), "", 0);
      if ((_DWORD)result) {
        goto LABEL_8;
      }
    }
  }

  return result;
}

char *macho_dylib_install_name(_DWORD *a1, const void *a2)
{
  uint64_t result = (char *)dyld3::MachOFile::isMachO(a1, a2);
  if (result) {
    return dyld3::MachOFile::installName((dyld3::MachOFile *)result);
  }
  return result;
}

uint64_t macho_for_each_dependent_dylib(mach_header *a1, uint64_t a2, uint64_t a3)
{
  v7[47] = *(mach_o::Header **)MEMORY[0x1895FEE08];
  if (!a2)
  {
    mach_o::Image::Image((mach_o::Image *)v7, a1);
LABEL_6:
    v6[0] = MEMORY[0x1895FED80];
    v6[1] = 0x40000000LL;
    void v6[2] = ___ZL19iterateDependenciesRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke;
    void v6[3] = &unk_189630DE8;
    v6[4] = a3;
    mach_o::Header::forEachLinkedDylib(v7[0], (uint64_t)v6);
    return 0LL;
  }

  mach_o::Image::Image(v7, a1, a2, 0LL);
  if (mach_o::Header::hasMachOMagic(v7[0]))
  {
    mach_o::Image::validate((mach_o::Image *)v7, (mach_o::Error *)v6);
    uint64_t v4 = v6[0];
    mach_o::Error::~Error((mach_o::Error *)v6);
    if (v4) {
      return 88LL;
    }
    goto LABEL_6;
  }

  return 79LL;
}

uint64_t macho_for_each_imported_symbol(mach_header *this, uint64_t a2, uint64_t a3)
{
  v8[47] = *(mach_o::Header **)MEMORY[0x1895FEE08];
  if (a2)
  {
    mach_o::Image::Image(v8, this, a2, 0LL);
    if (mach_o::Header::hasMachOMagic(v8[0]))
    {
      mach_o::Image::validate((mach_o::Image *)v8, (mach_o::Error *)&v7);
      uint64_t v5 = v7;
      mach_o::Error::~Error((mach_o::Error *)&v7);
      if (v5) {
        return 88LL;
      }
      goto LABEL_7;
    }
  }

  else if (mach_o::Header::hasMachOMagic((mach_o::Header *)this))
  {
    mach_o::Image::Image((mach_o::Image *)v8, this);
LABEL_7:
    iterateImportedSymbols(v8, a3);
    return 0LL;
  }

  return 79LL;
}

void iterateImportedSymbols(void *a1, uint64_t a2)
{
  uint64_t v4 = (mach_o::Error *)a1[10];
  if (v4)
  {
    v9[0] = MEMORY[0x1895FED80];
    v9[1] = 0x40000000LL;
    v9[2] = ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke;
    void v9[3] = &unk_189630E10;
    _OWORD v9[4] = a2;
    void v9[5] = a1;
    mach_o::ChainedFixups::forEachBindTarget(v4, (uint64_t)v9);
  }

  else
  {
    uint64_t v5 = a1[7];
    if (v5)
    {
      v8[0] = MEMORY[0x1895FED80];
      v8[1] = 0x40000000LL;
      void v8[2] = ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke_2;
      v8[3] = &unk_189630E38;
      v8[4] = a2;
      void v8[5] = a1;
      mach_o::BindOpcodes::forEachBindTarget(v5, (uint64_t)v8, (uint64_t)&__block_literal_global_3);
    }

    uint64_t v6 = a1[8];
    if (v6)
    {
      v7[0] = MEMORY[0x1895FED80];
      v7[1] = 0x40000000LL;
      _OWORD v7[2] = ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke_4;
      void v7[3] = &unk_189630EA0;
      v7[4] = a2;
      v7[5] = a1;
      mach_o::BindOpcodes::forEachBindTarget(v6, (uint64_t)v7, (uint64_t)&__block_literal_global_16);
    }
  }

uint64_t macho_for_each_exported_symbol(mach_header *this, uint64_t a2, uint64_t a3)
{
  v10[47] = *(mach_o::Header **)MEMORY[0x1895FEE08];
  if (a2)
  {
    mach_o::Image::Image(v10, this, a2, 0LL);
    if (mach_o::Header::hasMachOMagic(v10[0]))
    {
      mach_o::Image::validate((mach_o::Image *)v10, (mach_o::Error *)&v9);
      uint64_t v5 = v9;
      mach_o::Error::~Error((mach_o::Error *)&v9);
      if (v5) {
        return 88LL;
      }
      goto LABEL_7;
    }
  }

  else if (mach_o::Header::hasMachOMagic((mach_o::Header *)this))
  {
    mach_o::Image::Image((mach_o::Image *)v10, this);
LABEL_7:
    iterateExportedSymbols((uint64_t)v10, a3, v6, v7);
    return 0LL;
  }

  return 79LL;
}

void iterateExportedSymbols(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    v8[0] = MEMORY[0x1895FED80];
    v8[1] = 0x40000000LL;
    void v8[2] = ___ZL22iterateExportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke;
    v8[3] = &unk_189630F08;
    v8[4] = a2;
    mach_o::ExportsTrie::forEachExportedSymbol(v5, (uint64_t)v8, a3, a4);
  }

  else
  {
    uint64_t v6 = *(_DWORD **)(a1 + 40);
    if (v6)
    {
      v7[0] = MEMORY[0x1895FED80];
      v7[1] = 0x40000000LL;
      _OWORD v7[2] = ___ZL22iterateExportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke_2;
      void v7[3] = &unk_189630F30;
      v7[4] = a2;
      mach_o::NListSymbolTable::forEachExportedSymbol(v6, (uint64_t)v7);
    }
  }

uint64_t macho_for_each_defined_rpath(mach_header *a1, uint64_t a2, uint64_t a3)
{
  v11[47] = *(mach_o::Header **)MEMORY[0x1895FEE08];
  if (a2)
  {
    mach_o::Image::Image(v11, a1, a2, 0LL);
    if (!mach_o::Header::hasMachOMagic(v11[0])) {
      return 79LL;
    }
    mach_o::Image::validate((mach_o::Image *)v11, (mach_o::Error *)&v9);
    uint64_t v4 = v9;
    mach_o::Error::~Error((mach_o::Error *)&v9);
    if (v4) {
      return 88LL;
    }
    uint64_t v6 = v11[0];
    v8[0] = MEMORY[0x1895FED80];
    v8[1] = 0x40000000LL;
    void v8[2] = __macho_for_each_defined_rpath_block_invoke_2;
    v8[3] = &unk_189630DC0;
    v8[4] = a3;
    uint64_t v7 = v8;
  }

  else
  {
    mach_o::Image::Image((mach_o::Image *)v11, a1);
    uint64_t v6 = v11[0];
    v10[0] = MEMORY[0x1895FED80];
    v10[1] = 0x40000000LL;
    vm_address_t v10[2] = __macho_for_each_defined_rpath_block_invoke;
    void v10[3] = &unk_189630D98;
    void v10[4] = a3;
    uint64_t v7 = v10;
  }

  mach_o::Header::forEachRPath(v6, (uint64_t)v7);
  return 0LL;
}

uint64_t __macho_for_each_defined_rpath_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __macho_for_each_defined_rpath_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t ___ZL19iterateDependenciesRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke( uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  char v5 = a3;
  mach_o::LinkedDylibAttributes::toString(&v5, __dst);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke( uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = mach_o::Header::libOrdinalName(**(mach_o::Header ***)(a1 + 40), *((_DWORD *)a2 + 4));
  return (*(uint64_t (**)(uint64_t, uint64_t, const char *, void, uint64_t))(v6 + 16))( v6,  v5,  v7,  *((unsigned __int8 *)a2 + 20),  a3);
}

uint64_t ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke_2( uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = mach_o::Header::libOrdinalName(**(mach_o::Header ***)(a1 + 40), *((_DWORD *)a2 + 4));
  return (*(uint64_t (**)(uint64_t, uint64_t, const char *, void, uint64_t))(v6 + 16))( v6,  v5,  v7,  *((unsigned __int8 *)a2 + 20),  a3);
}

uint64_t ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke_4( uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = mach_o::Header::libOrdinalName(**(mach_o::Header ***)(a1 + 40), *((_DWORD *)a2 + 4));
  return (*(uint64_t (**)(uint64_t, uint64_t, const char *, void, uint64_t))(v6 + 16))( v6,  v5,  v7,  *((unsigned __int8 *)a2 + 20),  a3);
}

uint64_t ___ZL22iterateExportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke( uint64_t a1, mach_o::Symbol *this, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = exportSymbolAttrString(this);
  return (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t))(v4 + 16))(v4, v5, v6, a3);
}

const char *exportSymbolAttrString(const mach_o::Symbol *this)
{
  if (*((_BYTE *)this + 35)) {
    return "weak-def";
  }
  if (*((_BYTE *)this + 32) == 5) {
    return "thread-local";
  }
  if (mach_o::Symbol::isDynamicResolver(this, &v3)) {
    return "dynamic-resolver";
  }
  if (mach_o::Symbol::isAbsolute(this, &v3)) {
    return "absolute";
  }
  return "";
}

uint64_t ___ZL22iterateExportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke_2( uint64_t a1, mach_o::Symbol *this, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = exportSymbolAttrString(this);
  return (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t))(v5 + 16))(v5, v6, v7, a4);
}

void mach_o::Platform::Platform()
{
  __assert_rtn( "Platform",  "Platform.cpp",  745,  "p->value != 0 && PlatformInfo value uninitialized, this might be a problem with C++ static initializers order");
}

void ___ZNK6mach_o6Header19platformAndVersionsEv_block_invoke_cold_1()
{
}

void dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back( char *a1, void *a2, int a3)
{
  snprintf(a1, 0x100uLL, "OverflowSafeArray failed to allocate %llu bytes, vm_allocate returned: %d\n", *a2, a3);
  qword_18C50BEF0 = (uint64_t)a1;
  __assert_rtn("growTo", "Array.h", 184, "0");
}

void mach_o::Header::loadCommandToDylibKind()
{
}

void mach_o::Symbol::implOffset()
{
  __assert_rtn("implOffset", "Symbol.cpp", 297, "(_kind != Kind::reExport) && (_kind != Kind::absolute)");
}

void dyld3::Array<mach_o::SegmentRanges::SegmentRange>::push_back()
{
}

void Diagnostics::assertNoError(Diagnostics *a1)
{
  uint64_t v1 = abort_report_np();
  dyld4::Atlas::Mapper::~Mapper(v1);
}

void dyld4::Atlas::Mapper::~Mapper()
{
  __assert_rtn("~Mapper", "ProcessAtlas.cpp", 493, "_flatMapping == nullptr");
}

void dyld4::Atlas::Mapper::map()
{
  __assert_rtn("map", "ProcessAtlas.cpp", 521, "((uint64_t)addr + size) <= mapping.address + mapping.size");
}

void dyld4::Atlas::Mapper::pin()
{
  __assert_rtn("pin", "ProcessAtlas.cpp", 554, "_flatMapping == nullptr");
}

void dyld4::Atlas::Mapper::unpin()
{
  __assert_rtn("unpin", "ProcessAtlas.cpp", 576, "_flatMapping != nullptr");
}

void dyld4::Atlas::SharedCache::SharedCache()
{
}

void dyld4::Atlas::Process::teardownNotifications()
{
  __assert_rtn("teardownNotifications", "ProcessAtlas.cpp", 1452, "handle != 0");
}

{
  __assert_rtn("teardownNotifications", "ProcessAtlas.cpp", 1441, "handle != 0");
}

{
  __assert_rtn("teardownNotifications", "ProcessAtlas.cpp", 1432, "_state == Connected");
}

{
  __assert_rtn("teardownNotifications", "ProcessAtlas.cpp", 1431, "dispatch_get_current_queue() == _queue");
}

void dyld4::Atlas::Process::setupNotifications()
{
  __assert_rtn("setupNotifications", "ProcessAtlas.cpp", 1391, "kr != NULL");
}

{
  __assert_rtn("setupNotifications", "ProcessAtlas.cpp", 1392, "_state == Disconnected");
}

{
  __assert_rtn("setupNotifications", "ProcessAtlas.cpp", 1390, "dispatch_get_current_queue() == _queue");
}

void ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke_cold_1()
{
  __assert_rtn("registerAtlasChangedEventHandler_block_invoke", "ProcessAtlas.cpp", 1563, "_state == Connected");
}

void ___ZN5dyld45Atlas7Process20registerEventHandlerEPijP16dispatch_queue_sU13block_pointerFvvE_block_invoke_cold_1()
{
  __assert_rtn("registerEventHandler_block_invoke", "ProcessAtlas.cpp", 1580, "_state == Connected");
}

void ___ZN5dyld45Atlas7Process22unregisterEventHandlerEj_block_invoke_cold_1()
{
  __assert_rtn("unregisterEventHandler_block_invoke", "ProcessAtlas.cpp", 1591, "i->second.block != NULL");
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert( uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("insert", "BTree.h", a3, "size() != capacity()");
}

{
  OUTLINED_FUNCTION_3("insert", "BTree.h", a3, "index != capacity()");
}

void lsl::BTree<int,std::less<int>,false>::const_iterator::operator--( uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion( uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2( "prepareForInsertion",  "BTree.h",  a3,  "_depth == _btree->_depth && prepareForInsertion only works on iterators leaf nodes");
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild( uint64_t a1, uint64_t a2, uint64_t a3)
{
}

{
  OUTLINED_FUNCTION_7( "splitChild",  "BTree.h",  a3,  "!newChild->full() && !child->full() && After split the child nodes should be full");
}

{
  OUTLINED_FUNCTION_6( "splitChild",  "BTree.h",  a3,  "children()[index]->full() && The child being split must be full");
}

{
  OUTLINED_FUNCTION_5( "splitChild",  "BTree.h",  a3,  "size() < capacity() && There must be room in this node for an additional child");
}

void lsl::BTree<int,std::less<int>,false>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase( uint64_t a1, uint64_t a2, uint64_t a3)
{
}

{
  OUTLINED_FUNCTION_12("erase", "BTree.h", a3, "leaf()");
}

void lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure( uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_11("rebalanceFromErasure", "BTree.h", a3, "_indexes[0] == 0");
}

{
  OUTLINED_FUNCTION_10( "rebalanceFromErasure",  "BTree.h",  a3,  "_depth == _btree->_depth && rebalanceFromErasure only works on iterators to leaf nodes");
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge( uint64_t a1, uint64_t a2, uint64_t a3)
{
}

{
  OUTLINED_FUNCTION_8("merge", "BTree.h", a3, "index < size() && A node must have a successor node to merge with");
}

void dyld_process_snapshot_create_from_data_cold_1()
{
  __assert_rtn("dyld_process_snapshot_create_from_data", "dyld_introspection.cpp", 122, "reserved2 == 0");
}

void dyld_process_snapshot_create_from_data_cold_2()
{
  __assert_rtn("dyld_process_snapshot_create_from_data", "dyld_introspection.cpp", 121, "reserved1 == nullptr");
}

void dyld_process_info_base::dyld_process_info_base()
{
}

void dyld4::FileManager::uuidForFileSystem()
{
  __assert_rtn("operator()", "FileManager.cpp", 161, "i != _fsUUIDMap->end()");
}

void dyld4::FileRecord::open()
{
  __assert_rtn("open", "FileManager.cpp", 295, "_fd == -1");
}

void lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::insert()
{
  __assert_rtn("insert", "BTree.h", 140, "size() != capacity()");
}

{
  __assert_rtn("insert", "BTree.h", 141, "index != capacity()");
}

void lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::prepareForInsertion()
{
  __assert_rtn( "prepareForInsertion",  "BTree.h",  573,  "_depth == _btree->_depth && prepareForInsertion only works on iterators leaf nodes");
}

void lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::splitChild()
{
}

{
  __assert_rtn( "splitChild",  "BTree.h",  194,  "!newChild->full() && !child->full() && After split the child nodes should be full");
}

{
  __assert_rtn("splitChild", "BTree.h", 160, "children()[index]->full() && The child being split must be full");
}

{
  __assert_rtn( "splitChild",  "BTree.h",  159,  "size() < capacity() && There must be room in this node for an additional child");
}

void lsl::MemoryManager::vm_allocate_bytes(char *a1, uint64_t a2, uint64_t *a3, __int32 a4)
{
  size_t appended = lsl::appendHexToString<unsigned long long>(a1, a2);
  size_t v8 = OUTLINED_FUNCTION_0_0(appended, "\n\tRequested size: 0x");
  size_t v9 = OUTLINED_FUNCTION_1_0(v8, a3[5]);
  size_t v10 = OUTLINED_FUNCTION_0_0(v9, "\n\tRequested allgnment: 0x");
  size_t v11 = OUTLINED_FUNCTION_1_0(v10, a3[4]);
  size_t v12 = OUTLINED_FUNCTION_0_0(v11, "\n\tRequested target size: 0x");
  size_t v13 = OUTLINED_FUNCTION_1_0(v12, a3[7]);
  size_t v14 = OUTLINED_FUNCTION_0_0(v13, "\n\tRequested target allgnment: 0x");
  size_t v15 = OUTLINED_FUNCTION_1_0(v14, a3[6]);
  OUTLINED_FUNCTION_0_0(v15, "\n\tkern return: 0x");
  lsl::appendHexToString<int>(a1, a4, v16);
  qword_18C50BF08 = (uint64_t)a1;
  __assert_rtn("vm_allocate_bytes", "Allocator.cpp", 342, "0 && vm_allocate failed");
}

void lsl::AllocatorLayout::init()
{
  __assert_rtn("consumeSpace", "Allocator.cpp", 426, "consumedSpace <= size");
}

void lsl::Allocator::stackAllocatorInternal()
{
  __assert_rtn("stackAllocatorInternal", "Allocator.cpp", 471, "buffer != nullptr");
}

{
  __assert_rtn("stackAllocatorInternal", "Allocator.cpp", 472, "size != 0");
}

{
  __assert_rtn("stackAllocatorInternal", "Allocator.cpp", 475, "0");
}

void lsl::Allocator::aligned_alloc()
{
}

{
  __assert_rtn("aligned_alloc", "Allocator.cpp", 499, "std::popcount(alignment) == 1");
}

void lsl::Allocator::Pool::aligned_alloc_best_fit()
{
  __assert_rtn("aligned_alloc_best_fit", "Allocator.cpp", 754, "(uint64_t)result != (uint64_t)this");
}

{
  __assert_rtn("markAllocated", "Allocator.cpp", 1025, "!allocated()");
}

void lsl::Allocator::Pool::aligned_alloc()
{
  __assert_rtn("aligned_alloc", "Allocator.cpp", 705, "(uint64_t)result != (uint64_t)this");
}

{
  __assert_rtn("aligned_alloc", "Allocator.cpp", 674, "_lastFreeMetadata->pool() == this");
}

void lsl::Allocator::AllocationMetadata::deallocate()
{
}

void lsl::Allocator::Pool::Pool()
{
}

void lsl::Allocator::AllocationMetadata::reserve()
{
}

void lsl::Allocator::AllocationMetadata::AllocationMetadata()
{
}

void lsl::Allocator::AllocationMetadata::setPoolHint()
{
}

void dyld_process_info_notify_base::dyld_process_info_notify_base()
{
  __assert_rtn("dyld_process_info_notify_base", "dyld_process_info_notify.cpp", 222, "kr != NULL");
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895FED58](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1895FEDC0](lpfunc, obj, lpdso_handle);
}

uint64_t __cxa_finalize_ranges()
{
  return MEMORY[0x1895FEDC8]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x1896004F0]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x189600500]();
}

uint64_t _simple_sresize()
{
  return MEMORY[0x189600510]();
}

uint64_t _simple_string()
{
  return MEMORY[0x189600518]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x189600528]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895FEE90]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1895FF960](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FEFB8](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1895FE938]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FEA40](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FEAC8](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FF070](a1, a2);
}

void free(void *a1)
{
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1895FFA48](a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FFA50](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FF0D8](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FFA80](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1895FFAB0](a1, *(void *)&a2, *(void *)&a3);
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FFC90]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_construct( ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1895FFCB8](*(void *)&task, options, context, name);
}

kern_return_t mach_port_destruct( ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1895FFCC8](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_port_request_notification( ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1895FFD18]( *(void *)&task,  *(void *)&name,  *(void *)&msgid,  *(void *)&sync,  *(void *)&notify,  *(void *)&notifyPoly,  previous);
}

kern_return_t mach_vm_map( vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FFD78]( *(void *)&target_task,  address,  size,  mask,  *(void *)&flags,  *(void *)&object,  offset,  *(void *)&copy);
}

kern_return_t mach_vm_read_overwrite( vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize)
{
  return MEMORY[0x1895FFDA0](*(void *)&target_task, address, size, data, outsize);
}

kern_return_t mach_vm_region( vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x1895FFDA8](*(void *)&target_task, address, size, *(void *)&flavor, info, infoCnt, object_name);
}

kern_return_t mach_vm_remap_new( vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_read_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FFDB8]( *(void *)&target_task,  target_address,  size,  mask,  *(void *)&flags,  *(void *)&src_task,  src_address,  *(void *)&copy);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1896002E8](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FF168](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FF178](__dst, __src, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FF198](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FFE30](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FFE48](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FFE58](a1, *(void *)&a2);
}

uint64_t openbyid_np()
{
  return MEMORY[0x1895FFE80]();
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FF1C0](a1);
}

void os_unfair_lock_assert_not_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x189600588]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x189600590]();
}

uint64_t os_unfair_recursive_lock_unlock_forked_child()
{
  return MEMORY[0x189600598]();
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1895FFE98](*(void *)&t, x);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FFEF8](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FFF20](*(void *)&pid, address, buffer, *(void *)&buffersize);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x189600680](a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return MEMORY[0x189600688](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1896006B0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1896006C8](a1, a2);
}

uint64_t pthread_key_init_np()
{
  return MEMORY[0x1896006D0]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x189600758](a1, a2);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1895FF218](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FF220](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x189600040](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF2E0](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FF2F0](__dst, __src);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FF320](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FF328](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FF340](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FF348](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FF358](__s1, __n);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FF388](__big, __little);
}

kern_return_t task_dyld_process_info_notify_deregister(task_read_t target_task, mach_port_name_t notify)
{
  return MEMORY[0x189600060](*(void *)&target_task, *(void *)&notify);
}

kern_return_t task_dyld_process_info_notify_register(task_read_t target_task, mach_port_t notify)
{
  return MEMORY[0x189600068](*(void *)&target_task, *(void *)&notify);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x189600080](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_map_corpse_info_64( task_t task, task_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x189600088](*(void *)&task, *(void *)&corspe_task, kcd_addr_begin, kcd_size);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FF428](*(void *)&a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FF458](uu);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x189600100](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_copy( vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x189600108](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x189600110](*(void *)&target_task, address, size);
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x1896009E8]();
}