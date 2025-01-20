uint64_t extractThread(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  if (AAArchiveStreamProcess( *(AAArchiveStream *)(a1 + 56),  *(AAArchiveStream *)(a1 + 64),  0LL,  0LL,  *(void *)(a1 + 2128),  *(_DWORD *)(a1 + 2136)) < 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"extractThread",  389,  115,  0,  "AAByteStreamProcess reported an error",  v2,  v3,  v5);
    cancelStreams((void *)a1);
  }

  return a1;
}

void **loadRemainingRange(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  bzero(v19, 0x400uLL);
  if ((concatPath(v19, 0x400uLL, (char *)(a1 + 1096), "remaining") & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"loadRemainingRange",  254,  115,  0,  "Name too long",  v2,  v3,  v17);
    goto LABEL_9;
  }

  int v4 = open(v19, 0);
  if (v4 < 0)
  {
LABEL_9:
    v8 = 0LL;
    goto LABEL_17;
  }

  int v5 = v4;
  v8 = (void **)AAByteRangeCreate();
  if (v8)
  {
    while (1)
    {
      ssize_t v9 = read(v5, v18, 0x10uLL);
      if (v9 < 0)
      {
        int v15 = *__error();
        v13 = "read";
        __int16 v14 = 264;
        goto LABEL_16;
      }

      if (v9 != 16) {
        break;
      }
      if ((AAByteRangeAdd((uint64_t)v8, v18[0], v18[1], v10, v11, v12, v6, v7) & 0x80000000) != 0)
      {
        v13 = "AAByteRangeAdd";
        __int16 v14 = 267;
        goto LABEL_15;
      }
    }

    if (!v9)
    {
      close(v5);
      return v8;
    }

    v13 = "truncated remaining range file";
    __int16 v14 = 266;
  }

  else
  {
    v13 = "AAByteRangeCreate";
    __int16 v14 = 259;
  }

uint64_t unlinkTempSegment( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t result = getTempSegmentFilename(a1, a2, __str, a4, a5, a6, a7, a8);
  if (!(_DWORD)result) {
    return unlink(__str);
  }
  return result;
}

uint64_t loadTempSegment( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  memset(&v17, 0, sizeof(v17));
  if ((getTempSegmentFilename(a1, a2, __str, a4, a5, a6, a7, a8) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  int v10 = open( __str,  0,  *(_OWORD *)&v17.st_dev,  *(_OWORD *)&v17.st_uid,  *(_OWORD *)&v17.st_atimespec,  *(_OWORD *)&v17.st_mtimespec,  *(_OWORD *)&v17.st_ctimespec,  *(_OWORD *)&v17.st_birthtimespec);
  if (v10 < 0) {
    return 0LL;
  }
  int v11 = v10;
  if (fstat(v10, &v17))
  {
    uint64_t v12 = 0LL;
  }

  else if (v17.st_size == a4)
  {
    LODWORD(v12) = 0;
    unint64_t v13 = 0LL;
    while (a4 > v13)
    {
      ssize_t v14 = read(v11, (void *)(a3 + v13), a4 - v13);
      if (v14) {
        int v15 = 0;
      }
      else {
        int v15 = 3;
      }
      if (v14 < 0) {
        uint64_t v12 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v12 = v12;
      }
      v13 += v14 & ~(v14 >> 63);
      if (v14 < 0) {
        int v15 = 2;
      }
      if (v15)
      {
        if (v15 == 2) {
          goto LABEL_24;
        }
        break;
      }
    }

    if (v13 == a4) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = 0xFFFFFFFFLL;
    }
  }

  else
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }

void cancelStreams(void *a1)
{
  uint64_t v2 = (unsigned int *)a1 + 573;
  do
  {
    if (__ldaxr(v2))
    {
      __clrex();
      return;
    }
  }

  while (__stlxr(1u, v2));
  int v4 = (AAArchiveStream_impl *)a1[7];
  if (v4) {
    AAArchiveStreamCancel(v4);
  }
  int v5 = (AAArchiveStream_impl *)a1[8];
  if (v5) {
    AAArchiveStreamCancel(v5);
  }
  uint64_t v6 = (void *)a1[6];
  if (v6) {
    AAAsyncByteStreamCancel(v6);
  }
  uint64_t v7 = (AAByteStream_impl *)a1[4];
  if (v7) {
    AAByteStreamCancel(v7);
  }
  v8 = (AAByteStream_impl *)a1[5];
  if (v8) {
    AAByteStreamCancel(v8);
  }
}

uint64_t getTempSegmentFilename( uint64_t a1, unsigned int a2, char *__str, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 2384) <= a2)
  {
    char v11 = a2;
    v8 = "Invalid segment index: %u";
    __int16 v9 = 113;
    goto LABEL_5;
  }

  if (snprintf(__str, 0x400uLL, "%s/%08x", (const char *)(a1 + 1096), a2) >= 0x400)
  {
    v8 = "Segment file name too long";
    __int16 v9 = 115;
LABEL_5:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"getTempSegmentFilename",  v9,  115,  0,  v8,  a7,  a8,  v11);
    return 0xFFFFFFFFLL;
  }

  return 0LL;
}

uint64_t notifySegmentAvailable(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 2320);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 2320)))
  {
    __int16 v9 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"notifySegmentAvailable",  88,  115,  *v9,  "pthread_mutex_lock",  v10,  v11,  v24);
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v13 = *(void *)(a1 + 2392);
    if (*(_DWORD *)(v13 + 16LL * a2))
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"notifySegmentAvailable",  90,  115,  0,  "Invalid segment state",  v7,  v8,  v24);
      int v14 = 0;
      uint64_t v13 = *(void *)(a1 + 2392);
    }

    else
    {
      int v14 = 1;
    }

    uint64_t v15 = v13 + 16LL * a2;
    *(_DWORD *)uint64_t v15 = 1;
    *(void *)(v15 + 8) = a3;
    unsigned int v16 = *(_DWORD *)(a1 + 2400);
    if (v16 < *(_DWORD *)(a1 + 2384))
    {
      stat v17 = (FILE **)MEMORY[0x1895F89D0];
      do
      {
        int v18 = *(_DWORD *)(*(void *)(a1 + 2392) + 16LL * v16);
        if (v18 == 1)
        {
          if (*(_DWORD *)(a1 + 2120) >= 2u)
          {
            fprintf(*v17, "Segment %u: in queue for processing\n", v16);
            unsigned int v16 = *(_DWORD *)(a1 + 2400);
          }

          if ((SharedArrayEnqueue((unsigned int *)(a1 + 2160), v16) & 0x80000000) != 0)
          {
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtr actAsyncStream.c",  (uint64_t)"notifySegmentAvailable",  101,  115,  0,  "SharedArrayEnqueue",  v19,  v20,  v24);
            int v14 = 0;
          }
        }

        else if (!v18)
        {
          break;
        }

        unsigned int v16 = *(_DWORD *)(a1 + 2400) + 1;
        *(_DWORD *)(a1 + 2400) = v16;
      }

      while (v16 < *(_DWORD *)(a1 + 2384));
    }

    if (pthread_mutex_unlock(v6))
    {
      v21 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"notifySegmentAvailable",  106,  115,  *v21,  "pthread_mutex_unlock",  v22,  v23,  v24);
      int v14 = 0;
    }

    if (v14) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

uint64_t retireEntryRange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (pthread_mutex_t *)(a1 + 2408);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 2408)))
  {
    uint64_t v12 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"retireEntryRange",  290,  115,  *v12,  "pthread_mutex_lock",  v13,  v14,  v54);
    return 0xFFFFFFFFLL;
  }

  if ((AAByteRangeSub(*(unint64_t **)(a1 + 2472), a2, a3, v7, v8, v9, v10, v11) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"retireEntryRange",  293,  115,  0,  "AAByteRangeSub",  v16,  v17,  v54);
    int v18 = 0;
  }

  else
  {
    int v18 = 1;
  }

  double RealTime = getRealTime();
  uint64_t v55 = 0LL;
  uint64_t v56 = 0LL;
  bzero(__old, 0x400uLL);
  bzero(__new, 0x400uLL);
  if ((concatPath(__old, 0x400uLL, (char *)(a1 + 1096), "remaining.tmp") & 0x80000000) != 0)
  {
    __int16 v33 = 203;
LABEL_23:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"storeRemainingRange",  v33,  115,  0,  "Name too long",  v20,  v21,  v54);
LABEL_24:
    char v24 = 0LL;
    goto LABEL_25;
  }

  if ((concatPath(__new, 0x400uLL, (char *)(a1 + 1096), "remaining") & 0x80000000) != 0)
  {
    __int16 v33 = 204;
    goto LABEL_23;
  }

  char v54 = 0x80;
  int v22 = open(__old, 1537);
  if (v22 < 0)
  {
    int v45 = *__error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"storeRemainingRange",  207,  115,  v45,  "open: %s",  v46,  v47,  (char)__new);
    goto LABEL_24;
  }

  int v23 = v22;
  char v24 = (char *)calloc(0x4000uLL, 8uLL);
  if (!v24)
  {
    int v48 = *__error();
    v49 = "malloc";
    __int16 v50 = 210;
LABEL_45:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptAndExtractAsyncStream.c",  (uint64_t)"storeRemainingRange",  v50,  115,  v48,  v49,  v30,  v31,  128);
    close(v23);
    goto LABEL_25;
  }

  uint64_t v25 = AAByteRangeFirst(*(void *)(a1 + 2472), 0LL, &v56, &v55);
  if (v25 < 0) {
    goto LABEL_19;
  }
  uint64_t v26 = v25;
  uint64_t v27 = 0LL;
  do
  {
    uint64_t v28 = v55;
    v29 = &v24[8 * v27];
    v27 += 2LL;
    *(void *)v29 = v56;
    *((void *)v29 + 1) = v28;
    if (v27 == 0x4000)
    {
      if (write(v23, v24, 0x20000uLL) != 0x20000)
      {
        v49 = "truncated write";
        __int16 v50 = 220;
LABEL_44:
        int v48 = 0;
        goto LABEL_45;
      }

      uint64_t v27 = 0LL;
    }

    uint64_t v26 = AAByteRangeNext(*(void *)(a1 + 2472), v26, &v56, &v55);
  }

  while ((v26 & 0x8000000000000000LL) == 0);
  if (v27 && write(v23, v24, 8 * v27) != 8 * v27)
  {
    v49 = "truncated write";
    __int16 v50 = 229;
    goto LABEL_44;
  }

uint64_t aaEntryHashesInitWithFD(_BYTE *a1, unsigned int a2, int a3)
{
  uint64_t v6 = malloc(0x40000uLL);
  if (a1) {
    memset_s(a1, 0xACuLL, 0, 0xACuLL);
  }
  __int16 v7 = *a1 & 0xE0 | ((unsigned __int16)a2 >> 11);
  *a1 = *a1 & 0xE0 | ((unsigned __int16)a2 >> 11);
  if (((a2 >> 11) & 1) != 0)
  {
    CC_CKSUM_Init((uint64_t)v21);
    LOBYTE(v7) = *a1;
    if ((*a1 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }

  else if ((v7 & 2) == 0)
  {
    goto LABEL_5;
  }

  CC_SHA1_Deprecated_Init(&c);
  LOBYTE(v7) = *a1;
  if ((*a1 & 4) == 0)
  {
LABEL_6:
    if ((v7 & 8) == 0) {
      goto LABEL_7;
    }
LABEL_12:
    CC_SHA384_Init(&v18);
    if ((*a1 & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_13;
  }

uint64_t aaEntryHashesInitWithPath(_BYTE *a1, unsigned int a2, char *a3, const char *a4)
{
  char v4 = (char)a4;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if ((concatPath(v19, 0x400uLL, a3, a4) & 0x80000000) != 0)
  {
    char v14 = "invalid path";
    __int16 v15 = 65;
    int v16 = 0;
LABEL_7:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaEntryHashesInitWithPath",  v15,  102,  v16,  v14,  v7,  v8,  (char)v18);
    return 0xFFFFFFFFLL;
  }

  int v9 = open(v19, 0);
  if (v9 < 0)
  {
    int v16 = *__error();
    CC_SHA512_CTX v18 = v19;
    char v14 = "%s";
    __int16 v15 = 69;
    goto LABEL_7;
  }

  int v10 = v9;
  if ((aaEntryHashesInitWithFD(a1, a2, v9) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaEntryHashesInitWithPath",  71,  102,  0,  "computing hashes: %s",  v11,  v12,  v4);
    uint64_t v13 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  close(v10);
  return v13;
}

uint64_t aaEntryTypeFromMode(__int16 a1)
{
  unsigned int v1 = (a1 & 0xF000) - 4096;
  if (v1 >> 13 > 6) {
    return 0LL;
  }
  else {
    return dword_1862D806C[v1 >> 12];
  }
}

uint64_t aaEntryAttributesInitWithHeader(char *__s, char *a2, char *a3, AAHeader header)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (__s) {
    memset_s(__s, 0x48uLL, 0, 0x48uLL);
  }
  if (a2) {
    memset_s(a2, 0x38uLL, 0, 0x38uLL);
  }
  if (a3) {
    memset_s(a3, 0xACuLL, 0, 0xACuLL);
  }
  uint32_t FieldCount = AAHeaderGetFieldCount(header);
  if (FieldCount)
  {
    uint32_t v9 = FieldCount;
    for (uint32_t i = 0; v9 != i; ++i)
    {
      AAFieldKey FieldKey = AAHeaderGetFieldKey(header, i);
      if (__s)
      {
        uint32_t v12 = FieldKey.ikey & 0xFFFFFF;
        if ((FieldKey.ikey & 0xFFFFFF) <= 0x474C45)
        {
          if (v12 == 4475207)
          {
            if ((AAHeaderGetFieldUInt(header, i, &v24) & 0x80000000) == 0)
            {
              *__s |= 2u;
              *((_DWORD *)__s + 2) = v24;
            }
          }

          else if (v12 == 4475221)
          {
            if ((AAHeaderGetFieldUInt(header, i, &v24) & 0x80000000) == 0)
            {
              *__s |= 1u;
              *((_DWORD *)__s + 1) = v24;
            }
          }

          else if (v12 == 4476749 && (AAHeaderGetFieldUInt(header, i, &v24) & 0x80000000) == 0)
          {
            *__s |= 8u;
            *((_DWORD *)__s + 4) = v24;
          }

          goto LABEL_34;
        }

        if ((FieldKey.ikey & 0xFFFFFF) > 0x4D5442)
        {
          if (v12 != 5067843)
          {
            if (v12 != 5067853 || AAHeaderGetFieldTimespec(header, i, (timespec *)(__s + 56)) < 0) {
              goto LABEL_34;
            }
            char v13 = *__s | 0x40;
            goto LABEL_31;
          }

          if ((AAHeaderGetFieldTimespec(header, i, (timespec *)(__s + 40)) & 0x80000000) == 0)
          {
            char v13 = *__s | 0x20;
            goto LABEL_31;
          }
        }

        else
        {
          if (v12 == 4672582)
          {
            if ((AAHeaderGetFieldUInt(header, i, &v24) & 0x80000000) == 0)
            {
              *__s |= 4u;
              *((_DWORD *)__s + 3) = v24;
            }

            goto LABEL_34;
          }

          if (v12 == 5067842 && (AAHeaderGetFieldTimespec(header, i, (timespec *)(__s + 24)) & 0x80000000) == 0)
          {
            char v13 = *__s | 0x10;
LABEL_31:
            *__s = v13;
          }
        }
      }

uint64_t aaEntryAttributesInitWithFD(char *a1, _BYTE *a2, _BYTE *a3, unsigned int a4, int a5)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  memset(&v23, 0, sizeof(v23));
  if ((fstat(a5, &v23) & 0x80000000) == 0)
  {
    if (!a1) {
      goto LABEL_15;
    }
    memset_s(a1, 0x48uLL, 0, 0x48uLL);
    char v10 = *a1 & 0x80 | a4 & 0x7F;
    *a1 = v10;
    if ((a4 & 1) != 0)
    {
      *((_DWORD *)a1 + 1) = v23.st_uid;
      if ((a4 & 2) == 0)
      {
LABEL_5:
        if ((a4 & 8) == 0) {
          goto LABEL_6;
        }
        goto LABEL_35;
      }
    }

    else if ((a4 & 2) == 0)
    {
      goto LABEL_5;
    }

    *((_DWORD *)a1 + 2) = v23.st_gid;
    if ((a4 & 8) == 0)
    {
LABEL_6:
      if ((a4 & 4) == 0)
      {
LABEL_8:
        if ((a4 & 0x30) != 0)
        {
          v22[1] = 0LL;
          v22[2] = 0LL;
          memset(v24, 0, sizeof(v24));
          v22[0] = 0x220000000005LL;
          if (!fgetattrlist(a5, v22, v24, 0x40uLL, 1u) && LODWORD(v24[0]) == 36)
          {
            *(_OWORD *)(a1 + 40) = *(_OWORD *)((char *)v24 + 4);
            *(_OWORD *)(a1 + 24) = *(_OWORD *)((char *)&v24[1] + 4);
          }

          char v10 = *a1;
        }

        if ((v10 & 0x40) != 0) {
          *(timespec *)(a1 + 56) = v23.st_mtimespec;
        }
LABEL_15:
        if (!a2)
        {
LABEL_28:
          if (!a3 || (v23.st_mode & 0xF000) != 0x8000 || (aaEntryHashesInitWithFD(a3, a4, a5) & 0x80000000) == 0) {
            return 0LL;
          }
          __int128 v18 = "computing file digests";
          __int16 v19 = 282;
          goto LABEL_39;
        }

        memset_s(a2, 0x38uLL, 0, 0x38uLL);
        *a2 = (a4 >> 7) & 0xF | *a2 & 0xF0;
        mode_t st_mode = v23.st_mode;
        int v12 = v23.st_mode & 0xF000;
        if (v12 == 0x8000)
        {
          *(void *)&v24[0] = 0LL;
          int v21 = 0;
          LODWORD(v22[0]) = 0;
          if ((ParallelCompressionAFSCGetMetadataFD(a5, (off_t *)v24, (unsigned int *)v22, &v21) & 0x80000000) != 0)
          {
            __int128 v18 = "querying AFSC metadata";
            __int16 v19 = 269;
LABEL_39:
            int v17 = 0;
            goto LABEL_40;
          }

          int v15 = v21;
          *((_DWORD *)a2 + 2) = v22[0];
          *((_DWORD *)a2 + 3) = v15;
          mode_t st_mode = v23.st_mode;
          int v12 = v23.st_mode & 0xF000;
        }

        if (v12 != 0x8000 && v12 != 0x4000)
        {
LABEL_25:
          if ((st_mode & 0xF000) == 0x8000 && (*a2 & 8) != 0) {
            *((_DWORD *)a2 + 1) = getFileProtectionClassFD(a5);
          }
          goto LABEL_28;
        }

uint64_t aaEntryAttributesInitWithPath( char *a1, _BYTE *a2, _BYTE *a3, unsigned int a4, char *__s, const char *a6)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  memset(&v30, 0, sizeof(v30));
  if ((concatPath(v32, 0x800uLL, __s, a6) & 0x80000000) != 0)
  {
    int v21 = "invalid path";
    __int16 v22 = 301;
LABEL_36:
    int v23 = 0;
LABEL_38:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaEntryAttributesInitWithPath",  v22,  102,  v23,  v21,  v10,  v11,  (char)v27);
    return 0xFFFFFFFFLL;
  }

  if (lstat(v32, &v30) < 0)
  {
    int v23 = *__error();
    __int128 v27 = v32;
    int v21 = "lstat: %s";
    __int16 v22 = 302;
    goto LABEL_38;
  }

  if (a1)
  {
    memset_s(a1, 0x48uLL, 0, 0x48uLL);
    char v12 = *a1 & 0x80 | a4 & 0x7F;
    *a1 = v12;
    if ((a4 & 1) != 0)
    {
      *((_DWORD *)a1 + 1) = v30.st_uid;
      if ((a4 & 2) == 0)
      {
LABEL_6:
        if ((a4 & 8) == 0) {
          goto LABEL_7;
        }
        goto LABEL_42;
      }
    }

    else if ((a4 & 2) == 0)
    {
      goto LABEL_6;
    }

    *((_DWORD *)a1 + 2) = v30.st_gid;
    if ((a4 & 8) == 0)
    {
LABEL_7:
      if ((a4 & 4) == 0)
      {
LABEL_9:
        if ((a4 & 0x30) != 0)
        {
          v29[1] = 0LL;
          v29[2] = 0LL;
          memset(v31, 0, sizeof(v31));
          v29[0] = 0x220000000005LL;
          if (!getattrlist(v32, v29, v31, 0x40uLL, 1u) && LODWORD(v31[0]) == 36)
          {
            *(_OWORD *)(a1 + 40) = *(_OWORD *)((char *)v31 + 4);
            *(_OWORD *)(a1 + 24) = *(_OWORD *)((char *)&v31[1] + 4);
          }

          char v12 = *a1;
        }

        if ((v12 & 0x40) != 0) {
          *(timespec *)(a1 + 56) = v30.st_mtimespec;
        }
        goto LABEL_16;
      }

uint64_t aaEntryAttributesApplyToPath(char *a1, char *__s, const char *a3, char a4)
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  if ((concatPath(v63, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    uint64_t v11 = "invalid path";
    __int16 v12 = 391;
    int v13 = 0;
LABEL_33:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaEntryAttributesApplyToPath",  v12,  102,  v13,  v11,  v6,  v7,  (char)v59);
    return 0xFFFFFFFFLL;
  }

  v61[1] = 0LL;
  v61[2] = 0LL;
  v61[0] = 5LL;
  memset(v62, 0, sizeof(v62));
  char v8 = *a1;
  if ((*a1 & 0x20) != 0)
  {
    v62[0] = *(_OWORD *)(a1 + 40);
    int v9 = 512;
    HIDWORD(v61[0]) = 512;
    unsigned int v10 = 16;
    if ((v8 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  int v9 = 0;
  unsigned int v10 = 0;
  if ((*a1 & 0x40) != 0)
  {
LABEL_7:
    __int128 v14 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)((char *)v62 + v10) = v14;
    *(_OWORD *)((char *)&v62[1] + v10) = v14;
    v10 |= 0x20u;
    v9 |= 0x1400u;
    HIDWORD(v61[0]) = v9;
  }

uint64_t aaEntryAttributesApplyToFD(char *a1, int a2, char a3)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  if (fstat(a2, &v50) < 0)
  {
    int v9 = __error();
    if ((a3 & 1) == 0 || *v9 != 13)
    {
      unsigned int v10 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaEntryAttributesApplyToFD",  545,  102,  *v10,  "fstat",  v11,  v12,  v48[0]);
      return 0xFFFFFFFFLL;
    }

    return 0LL;
  }

  v49[1] = 0LL;
  v49[2] = 0LL;
  v49[0] = 5LL;
  memset(v55, 0, sizeof(v55));
  v48[1] = 0LL;
  v48[2] = 0LL;
  v48[0] = 5LL;
  memset(v54, 0, sizeof(v54));
  char v6 = *a1;
  if ((*a1 & 0x20) != 0)
  {
    v55[0] = *(_OWORD *)(a1 + 40);
    int v7 = 512;
    HIDWORD(v49[0]) = 512;
    v54[0] = v55[0];
    HIDWORD(v48[0]) = 512;
    unsigned int v8 = 16;
    if ((v6 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  int v7 = 0;
  unsigned int v8 = 0;
  if ((*a1 & 0x40) != 0)
  {
LABEL_9:
    __int128 v14 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)((char *)v55 + v8) = v14;
    unsigned int v15 = v8 + 16;
    *(_OWORD *)((char *)v55 + v15) = v14;
    *(_OWORD *)((char *)v54 + v8) = v14;
    v8 |= 0x20u;
    v7 |= 0x1400u;
    HIDWORD(v49[0]) = v7;
    *(_OWORD *)((char *)v54 + v15) = v14;
    HIDWORD(v48[0]) = v7;
  }

uint64_t aaEntryAttributesCmp(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0 && (*(_BYTE *)a1 & 1) != 0)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 4) != *(_DWORD *)(a2 + 4);
    if ((a3 & 2) == 0) {
      goto LABEL_9;
    }
  }

  else
  {
    unsigned int v3 = 0;
    if ((a3 & 2) == 0) {
      goto LABEL_9;
    }
  }

  if ((*(_BYTE *)a1 & 2) != 0 && *(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)) {
    v3 |= 2u;
  }
LABEL_9:
  if ((a3 & 8) != 0 && (*(_BYTE *)a1 & 8) != 0 && *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
    v3 |= 8u;
  }
  if ((a3 & 4) != 0 && (*(_BYTE *)a1 & 4) != 0 && *(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 12)) {
    v3 |= 4u;
  }
  if ((a3 & 0x40) != 0 && (*(_BYTE *)a1 & 0x40) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 56) - *(void *)(a2 + 56);
    if ((unint64_t)(v4 - 2) < 0xFFFFFFFFFFFFFFFDLL
      || (unint64_t)(*(void *)(a1 + 64) + 1000000000 * v4 - *(void *)(a2 + 64) + 2000) >= 0xFA1)
    {
      v3 |= 0x40u;
    }
  }

  if ((a3 & 0x10) != 0 && (*(_BYTE *)a1 & 0x10) != 0)
  {
    uint64_t v5 = *(void *)(a1 + 24) - *(void *)(a2 + 24);
    if ((unint64_t)(v5 - 2) < 0xFFFFFFFFFFFFFFFDLL
      || (unint64_t)(*(void *)(a1 + 32) + 1000000000 * v5 - *(void *)(a2 + 32) + 2000) >= 0xFA1)
    {
      v3 |= 0x10u;
    }
  }

  if ((a3 & 0x20) != 0 && (*(_BYTE *)a1 & 0x20) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 40) - *(void *)(a2 + 40);
    if ((unint64_t)(v6 - 2) < 0xFFFFFFFFFFFFFFFDLL
      || (unint64_t)(*(void *)(a1 + 48) + 1000000000 * v6 - *(void *)(a2 + 48) + 2000) >= 0xFA1)
    {
      v3 |= 0x20u;
    }
  }

  return v3;
}

uint64_t aaEntryInternalAttributesCmp(uint64_t a1, uint64_t a2, __int16 a3)
{
  if ((a3 & 0x100) != 0 && (*(_BYTE *)a1 & 2) != 0)
  {
    unsigned int v3 = (*(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 12)) << 8;
    if ((a3 & 0x80) == 0) {
      goto LABEL_9;
    }
  }

  else
  {
    unsigned int v3 = 0;
    if ((a3 & 0x80) == 0) {
      goto LABEL_9;
    }
  }

  if ((*(_BYTE *)a1 & 1) != 0 && *(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)) {
    v3 |= 0x80u;
  }
LABEL_9:
  if ((a3 & 0x200) != 0 && (*(_BYTE *)a1 & 4) != 0 && *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    v3 |= 0x200u;
  }
  if ((a3 & 0x400) != 0 && (*(_BYTE *)a1 & 8) != 0 && *(_DWORD *)(a1 + 4) != *(_DWORD *)(a2 + 4)) {
    v3 |= 0x400u;
  }
  return v3;
}

uint64_t aaEntryHashesCmp(uint64_t a1, uint64_t a2, __int16 a3)
{
  if ((a3 & 0x800) != 0 && (*(_BYTE *)a1 & 1) != 0)
  {
    unsigned int v6 = (*(_DWORD *)(a1 + 4) != *(_DWORD *)(a2 + 4)) << 11;
    if ((a3 & 0x1000) == 0) {
      goto LABEL_9;
    }
  }

  else
  {
    unsigned int v6 = 0;
    if ((a3 & 0x1000) == 0) {
      goto LABEL_9;
    }
  }

  if ((*(_BYTE *)a1 & 2) != 0
    && *(void *)(a1 + 8) ^ *(void *)(a2 + 8) | *(void *)(a1 + 16) ^ *(void *)(a2 + 16) | (*(_DWORD *)(a1 + 24) ^ *(_DWORD *)(a2 + 24)))
  {
    v6 |= 0x1000u;
  }

uint64_t AAThreadErrorContextLeave(unint64_t a1)
{
  return ParallelCompressionLeaveThreadErrorContext(0LL, 0LL, HIWORD(a1) & 1);
}

uint64_t aaCheckAndFixWithPath( char *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, unsigned int *a6, char *__s, const char *a8, uint64_t a9)
{
  uint64_t v110 = *MEMORY[0x1895F89C0];
  uint64_t v107 = 0LL;
  memset(v106, 0, sizeof(v106));
  uint64_t v105 = 0LL;
  memset(v104, 0, sizeof(v104));
  memset(v109, 0, 172);
  if ((concatPath(v108, 0x800uLL, __s, a8) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaCheckAndFixWithPath",  773,  102,  0,  "invalid path: %s",  v17,  v18,  (char)a8);
    unsigned int v25 = 0;
    v70 = 0LL;
    uint64_t v35 = 0LL;
    uint64_t v73 = 0xFFFFFFFFLL;
    goto LABEL_101;
  }

  v91 = a6;
  uint64_t v98 = (uint64_t)a1;
  char v19 = *a1;
  v96 = a2;
  unsigned int v20 = *a2;
  v93 = a3;
  unsigned int v21 = *a3;
  unsigned int v22 = *a4;
  AAEntryXATBlob v23 = AAEntryXATBlobCreate();
  AAEntryACLBlob v24 = AAEntryACLBlobCreate();
  v95 = v23;
  if (!v23 || !v24)
  {
    v70 = v24;
    v74 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaCheckAndFixWithPath",  800,  102,  *v74,  "malloc",  v75,  v76,  v90);
    unsigned int v25 = 0;
    uint64_t v73 = 0xFFFFFFFFLL;
    a6 = v91;
    uint64_t v35 = v95;
    goto LABEL_101;
  }

  acl = v24;
  unsigned int v25 = 0;
  uint32x4_t v26 = vmovl_u16((uint16x4_t)(*(void *)&vshl_u16((uint16x4_t)vdup_n_s16(v21), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01LL));
  v27.i64[0] = v26.u32[0];
  v27.i64[1] = v26.u32[1];
  v28.i64[0] = 255LL;
  v28.i64[1] = 255LL;
  uint64x2_t v29 = (uint64x2_t)vandq_s8(v27, v28);
  v27.i64[0] = v26.u32[2];
  v27.i64[1] = v26.u32[3];
  int8x16_t v30 = vorrq_s8( (int8x16_t)vshlq_u64(v29, (uint64x2_t)xmmword_1862D80C0),  (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v27, v28), (uint64x2_t)xmmword_1862D80B0));
  unint64_t v31 = (*(void *)&vorr_s8(*(int8x8_t *)v30.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v30, v30, 8uLL)) | ((unint64_t)(v21 & 1) << 11) | ((unint64_t)((v20 >> 2) & 1) << 9) | ((unint64_t)((v20 >> 1) & 1) << 8) | ((unint64_t)(v22 & 1) << 16) | ((unint64_t)((v20 >> 3) & 1) << 10) | ((unint64_t)((v22 >> 2) & 1) << 18) | ((unint64_t)((v22 >> 1) & 1) << 17) | a5 & 0x80000 | v19 & 0x7F | ((unint64_t)(v20 & 1) << 7)) & a5;
  if (v31 >= 0x80000) {
    unsigned int v32 = v31;
  }
  else {
    unsigned int v32 = v31 & 0xFFFE07FF;
  }
  uint64_t flags = a9 | 8;
  int v33 = 1;
  uint64_t v35 = v95;
  uint64_t v34 = (uint64_t)v96;
  uint64_t v36 = (uint64_t)v93;
  if ((v32 & 0x20000) != 0)
  {
LABEL_8:
    if ((aaEntryXATBlobInitWithPath(v35, __s, a8) & 0x80000000) == 0) {
      goto LABEL_9;
    }
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaCheckAndFixWithPath",  805,  102,  0,  "loading file XAT: %s",  v37,  v38,  (char)a8);
    goto LABEL_99;
  }

  while (1)
  {
LABEL_9:
    if ((v32 & 0x40000) != 0 && (aaEntryACLBlobInitWithPath(acl, __s, a8, a9) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaCheckAndFixWithPath",  806,  102,  0,  "loading file ACL: %s",  v39,  v40,  (char)a8);
      goto LABEL_99;
    }

    if ((aaEntryAttributesInitWithPath(v106, v104, v109, v32, __s, a8) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaCheckAndFixWithPath",  807,  102,  0,  "loading file attributes: %s",  v41,  v42,  (char)a8);
      goto LABEL_99;
    }

    uint64_t v94 = aaEntryAttributesCmp((uint64_t)v106, v98, v32);
    int v43 = aaEntryInternalAttributesCmp((uint64_t)v104, v34, v32) | v94;
    unsigned int v25 = aaEntryHashesCmp((uint64_t)v109, v36, v32) ? v43 | 0x80000 : v43;
    if ((v32 & 0x20000) != 0)
    {
      if (*((void *)a4 + 4))
      {
        if (AAEntryXATBlobGetEncodedSize(v35) == *((void *)a4 + 4)
          && (EncodedData = AAEntryXATBlobGetEncodedData(v35),
              !memcmp(EncodedData, *((const void **)a4 + 3), *((void *)a4 + 4))))
        {
          int v50 = 0;
        }

        else
        {
          int v50 = 0x20000;
        }

        unsigned int v25 = v50 | v25 & 0xFFFDFFFF;
        if ((v32 & 0x40000) == 0)
        {
LABEL_17:
          if ((v32 & 0x10000) == 0) {
            goto LABEL_37;
          }
          goto LABEL_33;
        }
      }

      else
      {
        unsigned int v25 = v25 & 0xFFFDFFFF | ((AAEntryXATBlobGetEntryCount(v35) != 0) << 17);
        if ((v32 & 0x40000) == 0) {
          goto LABEL_17;
        }
      }
    }

    else if ((v32 & 0x40000) == 0)
    {
      goto LABEL_17;
    }

    if (*((void *)a4 + 6))
    {
      if (AAEntryACLBlobGetEncodedSize(acl) == *((void *)a4 + 6)
        && (timeval v51 = AAEntryACLBlobGetEncodedData(acl), !memcmp(v51, *((const void **)a4 + 5), *((void *)a4 + 6))))
      {
        int v52 = 0;
      }

      else
      {
        int v52 = 0x40000;
      }

      unsigned int v25 = v52 | v25 & 0xFFFBFFFF;
      if ((v32 & 0x10000) == 0) {
        goto LABEL_37;
      }
    }

    else
    {
      unsigned int v25 = v25 & 0xFFFBFFFF | ((AAEntryACLBlobGetEntryCount(acl) != 0) << 18);
      if ((v32 & 0x10000) == 0) {
        goto LABEL_37;
      }
    }

uint64_t aaCopyFile(const char *a1, const char *a2, char a3)
{
  uint64_t v69 = 0LL;
  memset(v68, 0, sizeof(v68));
  uint64_t v67 = 0LL;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  *(_OWORD *)int v64 = 0u;
  memset(&v63, 0, sizeof(v63));
  int v6 = open(a1, 0);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    if (fstat(v6, &v63) < 0)
    {
      int v33 = *__error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaCopyFile",  940,  102,  v33,  "stat: %s",  v34,  v35,  (char)a1);
    }

    else if ((v63.st_mode & 0xF000) == 0x8000)
    {
      if ((aaEntryAttributesInitWithFD((char *)v68, v64, 0LL, 0xFFFFFFFF, v7) & 0x80000000) == 0)
      {
        uint64_t v12 = AAEntryXATBlobCreate();
        unsigned int v15 = v12;
        if (v12 && (aaEntryXATBlobInitWithFD(v12, v7) & 0x80000000) == 0)
        {
          __int128 v16 = AAEntryACLBlobCreate();
          char v19 = (unint64_t *)v16;
          if (!v16 || (aaEntryACLBlobInitWithFD(v16, v7, 0) & 0x80000000) != 0)
          {
            uint64_t v38 = "get ACL";
            __int16 v39 = 946;
            int v40 = 0;
          }

          else if (clonefile(a1, a2, 0))
          {
            if ((v64[0] & 8) != 0
              && v64[1] >= 1
              && (v62 = -92, uint64_t v20 = open_dprotected_np(a2, 1537, v64[1], 0), (v20 & 0x80000000) == 0)
              || (uint64_t v20 = open(a2, 1537, 420LL), (v20 & 0x80000000) == 0))
            {
              if (v63.st_size)
              {
                unsigned int v21 = malloc(0x40000uLL);
                if (!v21)
                {
                  unsigned int v22 = __error();
                  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaCopyFile",  972,  102,  *v22,  "malloc",  v23,  v24,  v62);
                }

                if (statIsCompressed(v63.st_flags))
                {
                  unint64_t v25 = fgetxattr(v7, "com.apple.decmpfs", v21, 0x40000uLL, 0, 32);
                  if ((v25 & 0x8000000000000000LL) != 0)
                  {
                    int8x16_t v28 = "Missing decmpfs xattr";
                    __int16 v29 = 980;
                    goto LABEL_64;
                  }

                  if (v25 > 0x40000)
                  {
                    int8x16_t v28 = "invalid decmpfs xattr size";
                    __int16 v29 = 981;
LABEL_64:
                    int v55 = 0;
LABEL_65:
                    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAUtils.c",  (uint64_t)"aaCopyFile",  v29,  102,  v55,  v28,  v26,  v27,  v62);
                    close(v7);
                    close(v20);
LABEL_66:
                    unlink(a2);
                    goto LABEL_29;
                  }

                  if (fsetxattr(v20, "com.apple.decmpfs", v21, v25, 0, 0) < 0)
                  {
                    int v55 = *__error();
                    int8x16_t v28 = "fsetxattr decmpfs";
                    __int16 v29 = 982;
                    goto LABEL_65;
                  }

                  ssize_t v56 = fgetxattr(v7, "com.apple.ResourceFork", 0LL, 0LL, 0, 32);
                  if (v56 >= 1)
                  {
                    unint64_t v57 = v56;
                    unint64_t v58 = 0LL;
                    while (1)
                    {
                      if (v57 - v58 >= 0x40000) {
                        size_t v59 = 0x40000LL;
                      }
                      else {
                        size_t v59 = v57 - v58;
                      }
                      ssize_t v60 = fgetxattr(v7, "com.apple.ResourceFork", v21, v59, v58, 32);
                      if (v60 < 0)
                      {
                        uint64_t v48 = "read resource fork";
                        __int16 v49 = 992;
                        goto LABEL_46;
                      }

                      if (v60 != v59)
                      {
                        uint64_t v48 = "truncated read resource fork";
                        __int16 v49 = 993;
                        goto LABEL_46;
                      }

                      if (fsetxattr(v20, "com.apple.ResourceFork", v21, v59, v58, 0) < 0) {
                        break;
                      }
                      v58 += v59;
                      if (v58 >= v57) {
                        goto LABEL_77;
                      }
                    }

                    int v50 = *__error();
                    uint64_t v48 = "write resource fork";
                    __int16 v49 = 994;
                    goto LABEL_47;
                  }

uint64_t AARandomAccessDecodeAndExtract( uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, unint64_t a6, int DefaultNThreads)
{
  uint64_t v253 = *MEMORY[0x1895F89C0];
  memset(&v252, 0, sizeof(v252));
  uint64_t v14 = malloc(0x520uLL);
  if (!v14)
  {
    __int16 v39 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateCreate",  812,  120,  *v39,  "malloc",  v40,  v41,  v247);
    goto LABEL_28;
  }

  uint64_t v15 = (uint64_t)v14;
  memset_s(v14, 0x520uLL, 0, 0x520uLL);
  *(void *)uint64_t v15 = a1;
  *(void *)(v15 + 8) = a2;
  if (!realpath_DARWIN_EXTSN(a3, (char *)(v15 + 16))
    || lstat((const char *)(v15 + 16), &v252) < 0
    || (v252.st_mode & 0xF000) != 0x4000)
  {
    int v34 = *__error();
    char v247 = (char)a3;
    uint64_t v35 = "invalid directory: %s";
    __int16 v36 = 819;
LABEL_26:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateCreate",  v36,  120,  v34,  v35,  v22,  v23,  v247);
    stateDestroy(v15);
LABEL_28:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"AARandomAccessDecodeAndExtract",  1352,  120,  0,  "creating state",  v37,  v38,  v248);
    uint64_t v15 = 0LL;
    goto LABEL_29;
  }

  *(void *)(v15 + 1056) = a6;
  *(void *)(v15 + 1040) = a4;
  *(void *)(v15 + 1048) = a5;
  *(_DWORD *)(v15 + 1080) = a6 >> 62;
  if (!DefaultNThreads) {
    DefaultNThreads = getDefaultNThreads();
  }
  *(_DWORD *)(v15 + 1152) = DefaultNThreads;
  *(_DWORD *)(v15 + 1064) = isDirEmpty((const char *)(v15 + 16)) == 0;
  *(void *)(v15 + 1068) = (a6 >> 54) & 1;
  uint64_t VolumeCapabilities = getVolumeCapabilities((const char *)(v15 + 16));
  uint64_t v17 = VolumeCapabilities & ~(VolumeCapabilities >> 63);
  uint64_t v18 = 268LL;
  if ((v17 & 8) == 0) {
    uint64_t v18 = 264LL;
  }
  unint64_t v19 = v18 & 0xFFFFFFFFFFFFFFDFLL | (32 * (v17 & 1));
  if ((a6 & 0x20) == 0 && (v17 & 2) != 0) {
    uint64_t v20 = v19 | 0x40;
  }
  else {
    uint64_t v20 = v19;
  }
  *(void *)(v15 + 1088) = v20;
  unsigned int v21 = StringTableCreate();
  *(void *)(v15 + 1096) = v21;
  if (!v21)
  {
    uint64_t v35 = "string table creation";
    __int16 v36 = 842;
    goto LABEL_49;
  }

  uint64_t v24 = calloc(*(unsigned int *)(v15 + 1152), 8uLL);
  *(void *)(v15 + 1160) = v24;
  if (!v24)
  {
    int v34 = *__error();
    uint64_t v35 = "malloc";
    __int16 v36 = 845;
    goto LABEL_26;
  }

  if (*(_DWORD *)(v15 + 1152))
  {
    unint64_t v25 = 0LL;
    while (1)
    {
      uint64_t v26 = malloc(0x858uLL);
      uint64_t v27 = (uint64_t)v26;
      if (v26)
      {
        memset_s(v26, 0x858uLL, 0, 0x858uLL);
        *(void *)(v27 + 40) = 0x40000LL;
        int8x16_t v28 = malloc(0x40000uLL);
        *(void *)(v27 + 32) = v28;
        if (v28)
        {
          *(_DWORD *)(v27 + 2104) = -1;
          goto LABEL_22;
        }

        __int16 v29 = 120;
      }

      else
      {
        __int16 v29 = 116;
      }

      int8x16_t v30 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreate",  v29,  120,  *v30,  "malloc",  v31,  v32,  v247);
      workerDestroy_0(v27);
      uint64_t v27 = 0LL;
LABEL_22:
      *(void *)(*(void *)(v15 + 1160) + 8 * v25) = v27;
      uint64_t v33 = *(void *)(v15 + 1160);
      if (!*(void *)(v33 + 8 * v25))
      {
        uint64_t v35 = "creating new worker";
        __int16 v36 = 849;
        goto LABEL_49;
      }

      ++v25;
      uint64_t v24 = (void *)*(unsigned int *)(v15 + 1152);
    }
  }

  uint64_t v33 = (uint64_t)v24;
  LODWORD(v24) = 0;
LABEL_34:
  uint64_t v44 = ThreadPoolCreate(v24, v33, (uint64_t)workerProc_3);
  *(void *)(v15 + 1168) = v44;
  if (!v44)
  {
    uint64_t v35 = "ThreadPoolCreate";
    __int16 v36 = 854;
LABEL_49:
    int v34 = 0;
    goto LABEL_26;
  }

  if (pthread_mutex_init((pthread_mutex_t *)(v15 + 1176), 0LL) < 0)
  {
    uint64_t v35 = "pthread_mutex_init";
    __int16 v36 = 857;
    goto LABEL_49;
  }

  if (*(_DWORD *)(v15 + 1080))
  {
    uint64_t v45 = (FILE **)MEMORY[0x1895F89D0];
    fwrite("DecodeAndExtract\n", 0x11uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    fprintf(*v45, "  target directory: %s\n", a3);
    if (a2) {
      uint64_t v46 = "yes";
    }
    else {
      uint64_t v46 = "no";
    }
    fprintf(*v45, "  manifest: %s\n", v46);
    if ((a6 & 0x40000000000000LL) != 0) {
      int v47 = "no";
    }
    else {
      int v47 = "yes";
    }
    fprintf(*v45, "  path checking: %s\n", v47);
    int v48 = *(_DWORD *)(v15 + 1080);
    if (!*(void *)(v15 + 8))
    {
LABEL_97:
      if (v48) {
        fwrite("Scanning archive\n", 0x11uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
      }
      goto LABEL_99;
    }

    *(void *)&v252.st_dev = 0LL;
    if (v48) {
      fwrite("Scanning manifest\n", 0x12uLL, 1uLL, *v45);
    }
LABEL_52:
    double RealTime = getRealTime();
    uint64_t v250 = 0LL;
    uint64_t value = 0LL;
    int Header = AAArchiveStreamReadHeader(*(AAArchiveStream *)(v15 + 8), (AAHeader *)&v252);
    if (Header)
    {
      while (1)
      {
        if (Header < 0)
        {
          v84 = "manifest read";
          __int16 v85 = 1041;
          goto LABEL_145;
        }

        ssize_t v53 = *(AAHeader_impl **)&v252.st_dev;
        v54.ikey = 5784649;
        uint32_t KeyIndex = AAHeaderGetKeyIndex(*(AAHeader *)&v252.st_dev, v54);
        if ((KeyIndex & 0x80000000) != 0) {
          break;
        }
        unsigned int FieldUInt = AAHeaderGetFieldUInt(v53, KeyIndex, &value);
        int v57 = FieldUInt <= 1 ? 1 : FieldUInt;
        if (v57 <= 0) {
          break;
        }
        unint64_t v58 = *(AAHeader_impl **)&v252.st_dev;
        v59.ikey = 5915721;
        uint32_t v60 = AAHeaderGetKeyIndex(*(AAHeader *)&v252.st_dev, v59);
        if ((v60 & 0x80000000) != 0
          || ((unsigned int v61 = AAHeaderGetFieldUInt(v58, v60, &v250), v61 <= 1) ? (v62 = 1) : (v62 = v61), v62 <= 0))
        {
          v84 = "missing IDZ field";
          __int16 v85 = 1045;
          goto LABEL_145;
        }

        if ((stateAppendEntry(v15, *(AAHeader *)&v252.st_dev, value, v250, 0LL) & 0x80000000) != 0)
        {
          v84 = "adding entry";
          __int16 v85 = 1048;
          goto LABEL_145;
        }

        uint64_t v250 = 0LL;
        uint64_t value = 0LL;
        int Header = AAArchiveStreamReadHeader(*(AAArchiveStream *)(v15 + 8), (AAHeader *)&v252);
        if (!Header) {
          goto LABEL_66;
        }
      }

      v84 = "missing IDX field";
      __int16 v85 = 1044;
LABEL_145:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateScanManifest",  v85,  120,  0,  v84,  v51,  v52,  v247);
      AAHeaderDestroy(*(AAHeader *)&v252.st_dev);
      v125 = "scanning manifest";
      __int16 v126 = 1363;
      goto LABEL_277;
    }

LABEL_66:
    AAHeaderDestroy(*(AAHeader *)&v252.st_dev);
    double v65 = getRealTime();
    if (*(_DWORD *)(v15 + 1080)) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%12.2f time (s)\n", v65 - RealTime);
    }
    if (*(void *)(v15 + 8)) {
      goto LABEL_69;
    }
    int v48 = *(_DWORD *)(v15 + 1080);
    goto LABEL_97;
  }

  if (*(void *)(v15 + 8))
  {
    *(void *)&v252.st_dev = 0LL;
    goto LABEL_52;
  }

      uint64_t v43 = *v42;
      uint64_t v44 = realloc(*v42, v40);
      if (v44)
      {
        *((void *)v35 + 280) = v44;
        *((void *)v35 + 279) = v40;
        goto LABEL_68;
      }

      free(v43);
LABEL_165:
      int *v42 = 0LL;
      *((void *)v35 + 278) = 0LL;
      *((void *)v35 + 279) = 0LL;
      goto LABEL_166;
    }
  }

LABEL_151:
  if (*(_DWORD *)(v15 + 1080))
  {
    if (*(void *)(v15 + 1136))
    {
      uint64_t v130 = 0LL;
      uint64_t v131 = 0LL;
      uint64_t v132 = 0LL;
      uint64_t v133 = 0LL;
      uint64_t v134 = 0LL;
      uint64_t v135 = 0LL;
      uint64_t v136 = 0LL;
      uint64_t v137 = 0LL;
      uint64_t v138 = *(void *)(v15 + 1144) + 32LL;
      uint64_t v139 = *(void *)(v15 + 1136);
      do
      {
        int v140 = *(_DWORD *)(v138 + 28);
        switch(v140)
        {
          case 'L':
            ++v132;
            break;
          case 'F':
            ++v131;
            if (*(void *)(v138 - 16) != -1LL) {
              ++v136;
            }
            if (*(void *)(v138 - 8) != -1LL) {
              ++v135;
            }
            if (*(void *)v138 != -1LL) {
              ++v134;
            }
            break;
          case 'D':
            ++v130;
            break;
          default:
            ++v133;
            break;
        }

        v137 += *(void *)(v138 - 24);
        v138 += 72LL;
        --v139;
      }

      while (v139);
    }

    else
    {
      uint64_t v137 = 0LL;
      uint64_t v136 = 0LL;
      uint64_t v135 = 0LL;
      uint64_t v134 = 0LL;
      uint64_t v133 = 0LL;
      uint64_t v132 = 0LL;
      uint64_t v131 = 0LL;
      uint64_t v130 = 0LL;
    }

    v141 = (FILE **)MEMORY[0x1895F89D0];
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%12zu entries selected\n", *(void *)(v15 + 1136));
    fprintf(*v141, "%12llu archive bytes\n", v137);
    fprintf(*v141, "%12zu regular files\n", v131);
    fprintf(*v141, "%12zu directories\n", v130);
    fprintf(*v141, "%12zu symbolic links\n", v132);
    if (v133) {
      fprintf(*v141, "%12zu other entries\n", v133);
    }
    fprintf(*v141, "%12zu bytes allocated in DIR blob\n", *(void *)(v15 + 1112));
    if (v136) {
      fprintf(*v141, "%12zu regular files in hard link clusters\n", v136);
    }
    if (v135) {
      fprintf(*v141, "%12zu regular files in clone clusters\n", v135);
    }
    if (v134) {
      fprintf(*v141, "%12zu regular files in same content clusters\n", v134);
    }
    if (*(_DWORD *)(v15 + 1080)) {
      fwrite("Creating directories\n", 0x15uLL, 1uLL, *v141);
    }
  }

  double v149 = getRealTime();
  unint64_t v150 = *(void *)(v15 + 1136);
  else {
    unint64_t v151 = v150 / (4 * *(_DWORD *)(v15 + 1152));
  }
  if (v150)
  {
    unint64_t v152 = 0LL;
    while (1)
    {
      uint64_t Worker = ThreadPoolGetWorker(*(void *)(v15 + 1168), v142, v143, v144, v145, v146, v147, v148);
      if (!Worker)
      {
        v160 = "ThreadPoolGetWorker";
        __int16 v161 = 1190;
        goto LABEL_193;
      }

      *(_DWORD *)uint64_t Worker = 0;
      *(void *)(Worker + 16) = v152;
      v152 += v151;
      unint64_t v158 = *(void *)(v15 + 1136);
      if (v152 < v158) {
        unint64_t v158 = v152;
      }
      *(void *)(Worker + 24) = v158;
      *(void *)(Worker + 8) = v15;
      if ((ThreadPoolRunWorker(*(void *)(v15 + 1168), Worker, v154, v155, v156, v157, v147, v148) & 0x80000000) != 0) {
        break;
      }
      if (v152 >= *(void *)(v15 + 1136)) {
        goto LABEL_189;
      }
    }

    v160 = "ThreadPoolRunWorker";
    __int16 v161 = 1195;
LABEL_193:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateCreateDirs",  v161,  120,  0,  v160,  v147,  v148,  v247);
    char v159 = 1;
  }

  else
  {
LABEL_189:
    char v159 = 0;
  }

  if ((ThreadPoolSync(*(unsigned int **)(v15 + 1168)) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateCreateDirs",  1199,  120,  0,  "ThreadPoolSync",  v123,  v124,  v247);
    goto LABEL_215;
  }

  if ((v159 & 1) != 0)
  {
LABEL_215:
    v125 = "creating directories";
    __int16 v126 = 1410;
    goto LABEL_277;
  }

  double v162 = getRealTime();
  if (*(_DWORD *)(v15 + 1080))
  {
    v163 = (FILE **)MEMORY[0x1895F89D0];
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%12.2f time (s)\n", v162 - v149);
    if (*(_DWORD *)(v15 + 1080)) {
      fprintf(*v163, "Creating files (flags=0x%08x)\n", *(void *)(v15 + 1088));
    }
  }

  double v171 = getRealTime();
  unint64_t v172 = *(void *)(v15 + 1136);
  if (!v172)
  {
LABEL_213:
    char v188 = 0;
    goto LABEL_219;
  }

  unint64_t v173 = 0LL;
  v174 = (uint64_t *)(*(void *)(v15 + 1144) + 8LL);
  uint64_t v175 = *(void *)(v15 + 1136);
  do
  {
    uint64_t v176 = *v174;
    v174 += 9;
    v173 += v176;
    --v175;
  }

  while (v175);
  unint64_t v177 = 0LL;
  unint64_t v178 = 0LL;
  else {
    unint64_t v179 = v173;
  }
  uint64_t v180 = 8LL;
  unint64_t v181 = 1LL;
  while (2)
  {
    if (v181 < v172)
    {
      v177 += *(void *)(*(void *)(v15 + 1144) + v180);
      if (v177 < v179)
      {
LABEL_211:
        v180 += 72LL;
        if (v181++ >= v172) {
          goto LABEL_213;
        }
        continue;
      }
    }

    break;
  }

  uint64_t v182 = ThreadPoolGetWorker(*(void *)(v15 + 1168), v164, v165, v166, v167, v168, v169, v170);
  if (!v182)
  {
    v189 = "ThreadPoolGetWorker";
    __int16 v190 = 1308;
    goto LABEL_218;
  }

  *(_DWORD *)uint64_t v182 = 1;
  *(void *)(v182 + 16) = v178;
  *(void *)(v182 + 24) = v181;
  *(void *)(v182 + 8) = v15;
  if ((ThreadPoolRunWorker(*(void *)(v15 + 1168), v182, v183, v184, v185, v186, v169, v170) & 0x80000000) == 0)
  {
    unint64_t v177 = 0LL;
    unint64_t v172 = *(void *)(v15 + 1136);
    unint64_t v178 = v181;
    goto LABEL_211;
  }

  v189 = "ThreadPoolRunWorker";
  __int16 v190 = 1313;
LABEL_218:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateCreateEntries",  v190,  120,  0,  v189,  v169,  v170,  v247);
  char v188 = 1;
LABEL_219:
  if ((ThreadPoolSync(*(unsigned int **)(v15 + 1168)) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateCreateEntries",  1321,  120,  0,  "ThreadPoolSync",  v123,  v124,  v247);
    *(_DWORD *)(v15 + 1072) = 1;
    goto LABEL_231;
  }

  *(_DWORD *)(v15 + 1072) = 1;
  if ((v188 & 1) != 0)
  {
LABEL_231:
    v125 = "creating entries";
    __int16 v126 = 1413;
    goto LABEL_277;
  }

  double v191 = getRealTime();
  if (*(_DWORD *)(v15 + 1080))
  {
    double v192 = v191 - v171;
    unint64_t v193 = atomic_load((unint64_t *)(v15 + 1304));
    v194 = (FILE **)MEMORY[0x1895F89D0];
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%12llu data bytes written\n", v193);
    fprintf(*v194, "%12.2f MB/s\n", (double)v193 / v192 * 0.000000953674316);
    fprintf(*v194, "%12.2f time (s)\n", v192);
  }

  int v195 = *(_DWORD *)(v15 + 1076);
  if (v195)
  {
    uint64_t v196 = *(void *)(v15 + 1136);
    if (v196)
    {
      unsigned int v197 = 0;
      v198 = (unsigned __int16 *)(*(void *)(v15 + 1144) + 68LL);
      do
      {
        unsigned int v200 = *v198;
        v198 += 36;
        unsigned int v199 = v200;
        if (v200 > v197) {
          unsigned int v197 = v199;
        }
        --v196;
      }

      while (v196);
    }

    else
    {
      unsigned int v197 = 0;
    }
  }

  else
  {
    unsigned int v197 = -1;
  }

  if (*(_DWORD *)(v15 + 1080))
  {
    if (v195) {
      v202 = "depth loop";
    }
    else {
      v202 = "single pass";
    }
    fprintf((FILE *)*MEMORY[0x1895F89D0], "Setting directories attributes (%s)\n", v202);
  }

  double v210 = getRealTime();
  else {
    unint64_t v211 = *(void *)(v15 + 1136) / (unint64_t)(4 * *(_DWORD *)(v15 + 1152));
  }
  while (2)
  {
    if (*(void *)(v15 + 1136))
    {
      unint64_t v212 = 0LL;
      while (1)
      {
        uint64_t v213 = ThreadPoolGetWorker(*(void *)(v15 + 1168), v203, v204, v205, v206, v207, v208, v209);
        if (!v213)
        {
          v243 = "ThreadPoolGetWorker";
          __int16 v244 = 1232;
          goto LABEL_276;
        }

        *(_DWORD *)uint64_t v213 = 3;
        *(void *)(v213 + 16) = v212;
        v212 += v211;
        unint64_t v218 = *(void *)(v15 + 1136);
        if (v212 < v218) {
          unint64_t v218 = v212;
        }
        *(void *)(v213 + 24) = v218;
        *(void *)(v213 + 8) = v15;
        *(_DWORD *)(v213 + 2108) = v197;
        if ((ThreadPoolRunWorker(*(void *)(v15 + 1168), v213, v214, v215, v216, v217, v208, v209) & 0x80000000) != 0) {
          break;
        }
        if (v212 >= *(void *)(v15 + 1136)) {
          goto LABEL_252;
        }
      }

      v243 = "ThreadPoolRunWorker";
      __int16 v244 = 1238;
      goto LABEL_276;
    }

LABEL_252:
    if ((ThreadPoolSync(*(unsigned int **)(v15 + 1168)) & 0x80000000) != 0)
    {
      v243 = "ThreadPoolSync";
      __int16 v244 = 1240;
LABEL_276:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateSetDirsAttributes",  v244,  120,  0,  v243,  v208,  v209,  v247);
      v125 = "setting directories attributes";
      __int16 v126 = 1416;
      goto LABEL_277;
    }

    unsigned int v219 = v197-- + 1;
    if (v219 > 1) {
      continue;
    }
    break;
  }

  double v220 = getRealTime();
  if (*(_DWORD *)(v15 + 1080))
  {
    v221 = (FILE **)MEMORY[0x1895F89D0];
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%12.2f time (s)\n", v220 - v210);
    if (*(_DWORD *)(v15 + 1080)) {
      fwrite("Creating hard links / clones\n", 0x1DuLL, 1uLL, *v221);
    }
  }

  double v229 = getRealTime();
  unint64_t v230 = *(void *)(v15 + 1136);
  else {
    unint64_t v231 = v230 / (4 * *(_DWORD *)(v15 + 1152));
  }
  if (v230)
  {
    unint64_t v232 = 0LL;
    while (1)
    {
      uint64_t v233 = ThreadPoolGetWorker(*(void *)(v15 + 1168), v222, v223, v224, v225, v226, v227, v228);
      if (!v233)
      {
        v245 = "ThreadPoolGetWorker";
        __int16 v246 = 1266;
        goto LABEL_289;
      }

      *(_DWORD *)uint64_t v233 = 2;
      *(void *)(v233 + 16) = v232;
      v232 += v231;
      unint64_t v238 = *(void *)(v15 + 1136);
      if (v232 < v238) {
        unint64_t v238 = v232;
      }
      *(void *)(v233 + 24) = v238;
      *(void *)(v233 + 8) = v15;
      if ((ThreadPoolRunWorker(*(void *)(v15 + 1168), v233, v234, v235, v236, v237, v227, v228) & 0x80000000) != 0) {
        break;
      }
      if (v232 >= *(void *)(v15 + 1136)) {
        goto LABEL_267;
      }
    }

    v245 = "ThreadPoolRunWorker";
    __int16 v246 = 1271;
LABEL_289:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateCreateClusters",  v246,  120,  0,  v245,  v227,  v228,  v247);
    v125 = "creating hard links, clones";
    __int16 v126 = 1419;
LABEL_277:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"AARandomAccessDecodeAndExtract",  v126,  120,  0,  v125,  v123,  v124,  v247);
LABEL_29:
    uint64_t v42 = 0xFFFFFFFFLL;
  }

  else
  {
LABEL_267:
    if ((ThreadPoolSync(*(unsigned int **)(v15 + 1168)) & 0x80000000) != 0)
    {
      v245 = "ThreadPoolSync";
      __int16 v246 = 1273;
      goto LABEL_289;
    }

    double v239 = getRealTime();
    if (*(_DWORD *)(v15 + 1080)) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%12.2f time (s)\n", v239 - v229);
    }
    if (atomic_load((unint64_t *)(v15 + 1296)))
    {
      if (*(_DWORD *)(v15 + 1080))
      {
        v241 = (FILE *)*MEMORY[0x1895F89D0];
        unint64_t v242 = atomic_load((unint64_t *)(v15 + 1296));
        fprintf(v241, "%12llu errors reported\n", v242);
      }

      v125 = "errors reported";
      __int16 v126 = 1424;
      goto LABEL_277;
    }

    uint64_t v42 = 0LL;
  }

  stateDestroy(v15);
  return v42;
}

void stateDestroy(uint64_t a1)
{
  if (a1)
  {
    StringTableDestroy(*(void ***)(a1 + 1096));
    ThreadPoolDestroy(*(void *)(a1 + 1168));
    free(*(void **)(a1 + 1120));
    memset_s((void *)(a1 + 1104), 0x18uLL, 0, 0x18uLL);
    uint64_t v2 = *(void **)(a1 + 1160);
    if (v2)
    {
      if (*(_DWORD *)(a1 + 1152))
      {
        unint64_t v3 = 0LL;
        do
          workerDestroy_0(*(void *)(*(void *)(a1 + 1160) + 8 * v3++));
        while (v3 < *(unsigned int *)(a1 + 1152));
        uint64_t v2 = *(void **)(a1 + 1160);
      }

      free(v2);
    }

    free(*(void **)(a1 + 1144));
    pthread_mutex_destroy((pthread_mutex_t *)(a1 + 1176));
    free((void *)a1);
  }

uint64_t workerProc_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = MEMORY[0x1895F8858](a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v381 = *MEMORY[0x1895F89C0];
  uint64_t v9 = v8;
  uint64_t v360 = v8;
  switch(*(_DWORD *)v8)
  {
    case 0:
      uint64_t v10 = *(void *)(v8 + 8);
      bzero(__s, 0x800uLL);
      memset(&v379, 0, sizeof(v379));
      unsigned int v11 = atomic_load((unsigned int *)(v10 + 1288));
      if (v11) {
        goto LABEL_19;
      }
      unint64_t v12 = *(void *)(v360 + 16);
      if (v12 >= *(void *)(v360 + 24)) {
        goto LABEL_19;
      }
      uint64_t v13 = (unint64_t *)(v10 + 1296);
      do
      {
        uint64_t v14 = *(void *)(v10 + 1144);
        if (*(_DWORD *)(v14 + 72 * v12 + 60) != 68) {
          goto LABEL_18;
        }
        uint64_t v15 = (const char *)(*(void *)(*(void *)(v10 + 1096) + 32LL)
                           + *(void *)(*(void *)(*(void *)(v10 + 1096) + 8LL)
                                       + 16LL * *(unsigned int *)(v14 + 72 * v12 + 64)));
        if ((stateConcatPath(v10, __s, v15) & 0x80000000) != 0)
        {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateDirs",  352,  120,  0,  "invalid path",  v16,  v17,  v340);
LABEL_16:
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateDirs",  370,  120,  0,  "create dir failed: %s",  v22,  v23,  (char)v15);
          do
            unint64_t v24 = __ldxr(v13);
          while (__stxr(v24 + 1, v13));
          goto LABEL_18;
        }

        if (mkdir(__s, 0x1EDu))
        {
          if (!*(_DWORD *)(v10 + 1068)
            || *__error() != 2
            || (size_t v18 = strlen(__s), makePath(__s, v18), mkdir(__s, 0x1EDu)))
          {
            if (*__error() != 17 || lstat(__s, &v379) || (v379.st_mode & 0xF000) != 0x4000)
            {
              int v19 = *__error();
              pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateDirs",  366,  120,  v19,  "creating directory: %s",  v20,  v21,  (char)__s);
              goto LABEL_16;
            }
          }
        }

LABEL_394:
                v327 = *v308;
                v328 = realloc(*v308, v306);
                if (v328)
                {
                  v347[266] = v328;
                  v347[265] = v306;
                  goto LABEL_396;
                }

                free(v327);
LABEL_413:
                *v308 = 0LL;
                uint64_t *v304 = 0LL;
                v347[265] = 0LL;
              }
            }

            __int16 v254 = 325;
            v255 = "storing entry in worker blob";
LABEL_415:
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerDeferEntry",  v254,  120,  0,  v255,  v250,  v251,  v340);
            AAHeaderDestroy(v247);
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateEntries",  651,  120,  0,  "storing deferred entry",  v334,  v335,  v341);
            uint64_t v32 = v351;
            uint64_t v26 = v352;
            unint64_t v173 = v354;
            goto LABEL_231;
          }

          int v222 = *v176;
        }

        if (v222 == 76)
        {
          v230.iint key = 4935244;
          uint32_t v231 = AAHeaderGetKeyIndex(v32, v230);
          if ((v231 & 0x80000000) != 0
            || ((unsigned int FieldString = AAHeaderGetFieldString(v32, v231, 0x400uLL, (char *)&v379, &length), FieldString <= 1)
              ? (int v233 = 1)
              : (int v233 = FieldString),
                v233 <= 0))
          {
            __int16 v245 = 563;
            __int16 v246 = "missing LNK field";
            goto LABEL_294;
          }
        }

        v234.iint key = 5521752;
        uint32_t v235 = AAHeaderGetKeyIndex(v32, v234);
        if ((v235 & 0x80000000) != 0
          || ((unsigned int FieldBlob = AAHeaderGetFieldBlob(v32, v235, &v364, &v363), FieldBlob <= 1)
            ? (int v237 = 1)
            : (int v237 = FieldBlob),
              v237 <= 0))
        {
          uint64_t v364 = 0LL;
        }

        v238.iint key = 4997953;
        uint32_t v239 = AAHeaderGetKeyIndex(v32, v238);
        if ((v239 & 0x80000000) != 0
          || ((unsigned int v240 = AAHeaderGetFieldBlob(v32, v239, &v362, &v361), v240 <= 1) ? (v241 = 1) : (v241 = v240), v241 <= 0))
        {
          uint64_t v362 = 0LL;
        }

        unint64_t v242 = *(void *)headera + v346;
        v365 += v242;
        v363 += v242;
        v361 += v242;
        if ((aaEntryAttributesInitWithHeader((char *)&v370, (char *)data_size, 0LL, v32) & 0x80000000) != 0)
        {
          __int16 v245 = 571;
          __int16 v246 = "setting attributes from header";
          goto LABEL_294;
        }

        if (*(_DWORD *)(v352 + 1064)) {
          unlinkat(*(_DWORD *)(v360 + 2104), v196, 0);
        }
        if (*v176 != 70)
        {
          if (*v176 != 76)
          {
            __int16 v245 = 584;
            __int16 v246 = "unsupported entry type";
            goto LABEL_294;
          }

          if (symlinkat((const char *)&v379, *(_DWORD *)(v360 + 2104), v196) < 0)
          {
            int v309 = *__error();
            __int16 v310 = 581;
            v311 = "symlink";
            goto LABEL_363;
          }

          uint64_t v9 = v360;
          uint64_t v32 = v351;
          uint64_t v26 = v352;
          if (*v176 != 70)
          {
            unint64_t v173 = v354;
            __int16 v211 = 591;
            unint64_t v212 = "setting attributes";
            goto LABEL_223;
          }
        }

        if ((v370 & 4) != 0)
        {
          char v243 = data_size[0];
          unsigned int v244 = -1;
          if ((BYTE12(v370) & 0x20) != 0 && v375) {
            unsigned int v244 = (LOBYTE(data_size[0]) << 31 >> 31) & data_size[1];
          }
        }

        else
        {
          char v243 = data_size[0];
          unsigned int v244 = -1;
        }

        if ((v243 & 8) != 0)
        {
          if ((*(_BYTE *)(v352 + 1062) & 2) != 0) {
            int v256 = HIDWORD(data_size[0]);
          }
          else {
            int v256 = -1;
          }
        }

        else
        {
          int v256 = -1;
        }

        v189 = (AAByteStream_impl *)aaArchiveFileOutputStreamOpenAt( *(_DWORD *)(v360 + 2104),  v196,  v375,  v244,  0LL,  v256,  *(void *)(v352 + 1088));
        if (!v189)
        {
          __int16 v286 = 610;
          v287 = "creating file stream";
          goto LABEL_366;
        }

        uint64_t v264 = v375;
        if (v375)
        {
          uint64_t v265 = 0LL;
          while (1)
          {
            size_t v266 = v264 - v265;
            if (*(void *)(v360 + 40) >= v266) {
              size_t v267 = v266;
            }
            else {
              size_t v267 = *(void *)(v360 + 40);
            }
            ssize_t v268 = AAByteStreamPRead(*(AAByteStream *)v352, *(void **)(v360 + 32), v267, v365 + v265);
            if (v268 < 0)
            {
              __int16 v286 = 617;
              v287 = "read failed";
              goto LABEL_366;
            }

            ssize_t v269 = v268;
            v265 += v269;
            v270 = *(uint64_t (**)(void, uint64_t, const char *, uint64_t *))(v352 + 1048);
            if (v270)
            {
              size[0] = v375;
              size[1] = v265;
              if ((v270(*(void *)(v352 + 1040), 60LL, v357, size) & 0x80000000) != 0)
              {
                pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateEntries",  629,  120,  0,  "callback cancel",  v262,  v263,  v340);
                while (!__ldaxr(v350))
                {
                  if (!__stlxr(1u, v350)) {
                    goto LABEL_433;
                  }
                }

                __clrex();
LABEL_433:
                uint64_t v25 = 0xFFFFFFFFLL;
                uint64_t v32 = v351;
LABEL_31:
                uint64_t v33 = v32;
                goto LABEL_120;
              }
            }

            uint64_t v264 = v375;
            if (v265 >= v375) {
              goto LABEL_314;
            }
          }

          __int16 v286 = 619;
          v287 = "write failed";
LABEL_366:
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateEntries",  v286,  120,  0,  v287,  v262,  v263,  v340);
          goto LABEL_367;
        }

LABEL_314:
        uint64_t v271 = aaArchiveFileOutputStreamCloseAndReturnFD( (uint64_t (**)(uint64_t))v189,  v257,  v258,  v259,  v260,  v261,  v262,  v263);
        if ((v271 & 0x80000000) != 0)
        {
          __int16 v310 = 636;
          int v309 = 0;
          v311 = "invalid fd";
LABEL_363:
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateEntries",  v310,  120,  v309,  v311,  v272,  v273,  v340);
          v189 = 0LL;
LABEL_367:
          uint64_t v32 = v351;
LABEL_226:
          uint64_t v26 = v352;
LABEL_229:
          unint64_t v173 = v354;
          goto LABEL_230;
        }

        uint64_t v274 = v271;
        if ((workerApplyAttr(v360, (uint64_t)headera, v271, (char *)&v370) & 0x80000000) != 0)
        {
          __int16 v312 = 637;
          v313 = "setting attributes";
        }

        else
        {
          size_t v277 = v364;
          if (!v364) {
            goto LABEL_379;
          }
          uint64_t v278 = v363;
          if ((workerReserve(v360, v364) & 0x80000000) != 0)
          {
            __int16 v314 = 248;
            v315 = "allocating worker buf";
          }

          else
          {
            uint64_t v281 = **(void **)(v360 + 8);
            if (*(void *)(v281 + 32))
            {
              uint64_t v282 = 0LL;
              uint64_t v283 = *(void *)(v360 + 32);
              size_t v284 = v277;
              while (1)
              {
                uint64_t v285 = (*(uint64_t (**)(void, uint64_t, size_t, uint64_t))(v281 + 32))( *(void *)v281,  v283,  v284,  v278);
                if (v285 < 0) {
                  break;
                }
                if (v285)
                {
                  v283 += v285;
                  v282 += v285;
                  v278 += v285;
                  v284 -= v285;
                  if (v284) {
                    continue;
                  }
                }

                goto LABEL_377;
              }

              uint64_t v282 = v285;
            }

            else
            {
              uint64_t v282 = -1LL;
            }

LABEL_377:
            if (v282 == v277)
            {
              if ((workerDecodeAndApplyXAT(v360, (uint64_t)headera, v274, *(uint8_t **)(v360 + 32), v277) & 0x80000000) == 0)
              {
LABEL_379:
                size_t v316 = v362;
                if (!v362) {
                  goto LABEL_401;
                }
                uint64_t v317 = v361;
                if ((workerReserve(v360, v362) & 0x80000000) != 0)
                {
                  __int16 v325 = 269;
                  v326 = "allocating worker buf";
                }

                else
                {
                  uint64_t v320 = **(void **)(v360 + 8);
                  if (*(void *)(v320 + 32))
                  {
                    uint64_t v321 = 0LL;
                    uint64_t v322 = *(void *)(v360 + 32);
                    size_t v323 = v316;
                    while (1)
                    {
                      uint64_t v324 = (*(uint64_t (**)(void, uint64_t, size_t, uint64_t))(v320 + 32))( *(void *)v320,  v322,  v323,  v317);
                      if (v324 < 0) {
                        break;
                      }
                      if (v324)
                      {
                        v322 += v324;
                        v321 += v324;
                        v317 += v324;
                        v323 -= v324;
                        if (v323) {
                          continue;
                        }
                      }

                      goto LABEL_399;
                    }

                    uint64_t v321 = v324;
                  }

                  else
                  {
                    uint64_t v321 = -1LL;
                  }

LABEL_399:
                  if (v321 == v316)
                  {
                    if ((workerDecodeAndApplyACL(v360, (uint64_t)headera, v274, *(uint8_t **)(v360 + 32), v316) & 0x80000000) == 0)
                    {
LABEL_401:
                      uint64_t v330 = v375;
                      do
                        unint64_t v331 = __ldxr(v348);
                      while (__stxr(v331 + v330, v348));
                      close(v274);
                      uint64_t v9 = v360;
                      uint64_t v32 = v351;
                      uint64_t v26 = v352;
                      unint64_t v173 = v354;
LABEL_359:
                      AAByteStreamClose(0LL);
                      uint64_t v218 = 21LL;
                      goto LABEL_234;
                    }

                    __int16 v325 = 276;
                    v326 = "applying ACL";
                  }

                  else
                  {
                    __int16 v325 = 273;
                    v326 = "loading ACL blob";
                  }
                }

                pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerLoadAndApplyACL",  v325,  120,  0,  v326,  v318,  v319,  v340);
                __int16 v312 = 639;
                v313 = "loading and applying ACL";
                goto LABEL_407;
              }

              __int16 v314 = 255;
              v315 = "applying XAT";
            }

            else
            {
              __int16 v314 = 252;
              v315 = "loading XAT blob";
            }
          }

          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerLoadAndApplyXAT",  v314,  120,  0,  v315,  v279,  v280,  v340);
          __int16 v312 = 638;
          v313 = "loading and applying XAT";
        }

LABEL_407:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateEntries",  v312,  120,  0,  v313,  v275,  v276,  v340);
        close(v274);
        AAByteStreamClose(0LL);
        uint64_t v32 = v351;
        uint64_t v26 = v352;
        unint64_t v173 = v354;
LABEL_231:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateEntries",  656,  120,  0,  "extract entry failed: %s",  v215,  v216,  (char)v357);
        uint64_t v9 = v360;
        do
          unint64_t v217 = __ldxr(v174);
        while (__stxr(v217 + 1, v174));
        uint64_t v218 = 22LL;
LABEL_234:
        unsigned int v219 = *(uint64_t (**)(void, uint64_t, const char *, AAHeader_impl *))(v26 + 1048);
        if (v219 && (v219(*(void *)(v26 + 1040), v218, v357, v32) & 0x80000000) != 0)
        {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateEntries",  663,  120,  0,  "Caller cancelled",  v171,  v172,  v340);
          uint64_t v25 = 0xFFFFFFFFLL;
          while (!__ldaxr(v350))
          {
            if (!__stlxr(1u, v350)) {
              goto LABEL_31;
            }
          }

          __clrex();
          goto LABEL_30;
        }

LABEL_236:
        if (++v173 >= *(void *)(v9 + 24)) {
          goto LABEL_431;
        }
      }

    case 2:
      uint64_t v34 = *(void *)(v8 + 8);
      bzero(__s, 0x800uLL);
      bzero(&v379, 0x800uLL);
      uint64_t offset = 0LL;
      size[0] = 0LL;
      uint64_t v375 = 0LL;
      uint64_t length = 0LL;
      uint64_t v374 = 0LL;
      __int128 v372 = 0u;
      __int128 v373 = 0u;
      __int128 v370 = 0u;
      __int128 v371 = 0u;
      uint64_t v369 = 0LL;
      __int128 v367 = 0u;
      __int128 v368 = 0u;
      *(_OWORD *)data_size = 0u;
      AAHeader v35 = AAHeaderCreate();
      uint64_t v38 = v35;
      if (!v35)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  689,  120,  0,  "AAHeaderCreate",  v36,  v37,  v340);
        goto LABEL_118;
      }

      unint64_t v39 = *(void *)(v9 + 16);
      if (v39 >= *(void *)(v9 + 24))
      {
LABEL_116:
        uint64_t v25 = 0LL;
        goto LABEL_119;
      }

      uint64_t v40 = (unint64_t *)(v34 + 1296);
      int v358 = -1;
      header = v35;
      while (1)
      {
        uint64_t v41 = *(void *)(v34 + 1144);
        uint64_t v42 = v41 + 72 * v39;
        if (*(_DWORD *)(v42 + 60) != 70) {
          goto LABEL_64;
        }
        uint64_t v44 = (unint64_t *)(v42 + 48);
        uint64_t v43 = *(void *)(v42 + 48);
        uint64_t v45 = v41 + 72 * v39;
        uint64_t v47 = *(void *)(v45 + 16);
        uint64_t v46 = (unint64_t *)(v45 + 16);
        if (v47 == -1 && *(void *)(v41 + 72 * v39 + 24) == -1LL)
        {
          BOOL v72 = *(void *)(v41 + 72 * v39 + 32) == -1LL || v43 == 0;
          if (v72)
          {
LABEL_63:
            uint64_t v9 = v360;
            goto LABEL_64;
          }
        }

        else if (!v43)
        {
          goto LABEL_63;
        }

        int v48 = (const char *)(*(void *)(*(void *)(v34 + 1096) + 32LL)
                           + *(void *)(*(void *)(*(void *)(v34 + 1096) + 8LL)
                                       + 16LL * *(unsigned int *)(v41 + 72 * v39 + 64)));
        if ((stateConcatPath(v34, __s, v48) & 0x80000000) != 0) {
          break;
        }
        int v55 = (unsigned __int16 *)stateGetEntryData(v34, v42, v49, v50, v51, v52, v53, v54);
        if (!v55)
        {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  708,  120,  0,  "invalid entry data",  v56,  v57,  v340);
          uint64_t v25 = 0LL;
          uint64_t v38 = header;
          goto LABEL_119;
        }

        unint64_t v58 = *v44;
        if (*v44 <= 5)
        {
          __int16 v59 = 710;
          goto LABEL_46;
        }

        int v62 = v55;
        unint64_t v63 = v55[2];
        if (v58 < v63)
        {
          __int16 v59 = 712;
LABEL_46:
          uint64_t v64 = "invalid entry";
LABEL_47:
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  v59,  120,  0,  v64,  v56,  v57,  v340);
LABEL_48:
          uint64_t v38 = header;
          goto LABEL_49;
        }

        if ((aaHeaderInitWithEncodedData((uint64_t)header, v55, v63) & 0x80000000) != 0)
        {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  713,  120,  0,  "invalid header",  v73,  v74,  v340);
          uint64_t v38 = header;
LABEL_49:
          int v65 = v358;
          if (v358 < 0) {
            goto LABEL_51;
          }
          goto LABEL_50;
        }

        v75.iint key = 5521752;
        uint32_t v76 = AAHeaderGetKeyIndex(header, v75);
        if ((v76 & 0x80000000) != 0
          || ((unsigned int v77 = AAHeaderGetFieldBlob(header, v76, size, &offset), v77 <= 1) ? (v78 = 1) : (v78 = v77), v78 <= 0))
        {
          size[0] = 0LL;
        }

        v79.iint key = 4997953;
        uint32_t v80 = AAHeaderGetKeyIndex(header, v79);
        if ((v80 & 0x80000000) != 0
          || ((unsigned int v81 = AAHeaderGetFieldBlob(header, v80, &length, &v375), v81 <= 1) ? (v82 = 1) : (v82 = v81), v82 <= 0))
        {
          uint64_t length = 0LL;
        }

        uint64_t v83 = offset + v63;
        offset += v63;
        uint64_t v84 = v375 + v63;
        v375 += v63;
        if (size[0] && size[0] + v83 > v43 || length && length + v84 > v43)
        {
          __int16 v59 = 721;
          uint64_t v64 = "invalid blob sizes";
          goto LABEL_47;
        }

        if ((aaEntryAttributesInitWithHeader((char *)&v370, (char *)data_size, 0LL, header) & 0x80000000) != 0)
        {
          __int16 v59 = 722;
          uint64_t v64 = "setting attributes from header";
          goto LABEL_47;
        }

        unint64_t v85 = *v46;
        unint64_t v86 = *(void *)(v34 + 1240);
        uint64_t v87 = (void *)(v34 + 1264);
        unint64_t v88 = *v46;
        if (*v46 >= v86
          && (v88 = *(void *)(v41 + 72 * v39 + 24), uint64_t v87 = (void *)(v34 + 1272), v88 >= *(void *)(v34 + 1248))
          && (v88 = *(void *)(v41 + 72 * v39 + 32), uint64_t v87 = (void *)(v34 + 1280), v88 >= *(void *)(v34 + 1256))
          || (uint64_t v89 = *(void *)(*v87 + 8 * v88), v89 == -1))
        {
          __int16 v59 = 730;
          uint64_t v64 = "missing reference entry in cluster";
          goto LABEL_47;
        }

        if ((stateConcatPath( v34,  (char *)&v379,  (const char *)(*(void *)(*(void *)(v34 + 1096) + 32LL)
                             + *(void *)(*(void *)(*(void *)(v34 + 1096) + 8LL)
                                         + 16LL * *(unsigned int *)(*(void *)(v34 + 1144) + 72 * v89 + 64)))) & 0x80000000) != 0)
        {
          __int16 v59 = 733;
          uint64_t v64 = "invalid path";
          goto LABEL_47;
        }

        if (*(_DWORD *)(v34 + 1064)) {
          unlink(__s);
        }
        if (v85 >= v86)
        {
          if (clonefile((const char *)&v379, __s, 0)
            && (copyFileSegment((const char *)&v379, 0LL, 0xFFFFFFFFFFFFFFFFLL, __s) & 0x80000000) != 0)
          {
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  745,  120,  0,  "cloning file, falling back to copy, failed: %s",  v93,  v94,  (char)__s);
            goto LABEL_48;
          }
        }

        else if (link((const char *)&v379, __s) < 0)
        {
          int v90 = *__error();
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  754,  120,  v90,  "hard link: %s",  v91,  v92,  (char)__s);
          goto LABEL_48;
        }

        uint64_t v95 = open(__s, 0x200000);
        if ((v95 & 0x80000000) == 0)
        {
          uint64_t v96 = v95;
          if ((workerApplyAttr(v360, v42, v95, (char *)&v370) & 0x80000000) != 0)
          {
            __int16 v102 = 760;
            uint64_t v103 = "setting attributes";
          }

          else if (size[0] {
                 && (workerDecodeAndApplyXAT(v360, v42, v96, (uint8_t *)v62 + offset, size[0]) & 0x80000000) != 0)
          }
          {
            __int16 v102 = 761;
            uint64_t v103 = "loading and applying XAT";
          }

          else
          {
            if (!length || (workerDecodeAndApplyACL(v360, v42, v96, (uint8_t *)v62 + v375, length) & 0x80000000) == 0)
            {
              close(v96);
              uint64_t v67 = 21LL;
              int v358 = -1;
              uint64_t v38 = header;
              goto LABEL_54;
            }

            __int16 v102 = 762;
            uint64_t v103 = "loading and applying ACL";
          }

          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  v102,  120,  0,  v103,  v97,  v98,  v340);
          uint64_t v38 = header;
          int v65 = v96;
LABEL_50:
          close(v65);
          int v358 = -1;
          goto LABEL_51;
        }

        int v358 = v95;
        uint64_t v99 = __error();
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  759,  120,  *v99,  "open: %s",  v100,  v101,  (char)__s);
        uint64_t v38 = header;
LABEL_51:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  766,  120,  0,  "extract cluster entry failed: %s",  v60,  v61,  (char)v48);
        do
          unint64_t v66 = __ldxr(v40);
        while (__stxr(v66 + 1, v40));
        uint64_t v67 = 22LL;
LABEL_54:
        uint64_t v68 = *(uint64_t (**)(void, uint64_t, const char *, AAHeader_impl *))(v34 + 1048);
        if (v68)
        {
          int v69 = v68(*(void *)(v34 + 1040), v67, v48, v38);
          uint64_t v9 = v360;
          if (v69 < 0)
          {
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerCreateClusters",  773,  120,  0,  "Caller cancelled",  v70,  v71,  v340);
            v336 = (unsigned int *)(v34 + 1288);
            uint64_t v25 = 0xFFFFFFFFLL;
            while (!__ldaxr(v336))
            {
              if (!__stlxr(1u, v336)) {
                goto LABEL_119;
              }
            }

            __clrex();
LABEL_118:
            uint64_t v25 = 0xFFFFFFFFLL;
LABEL_119:
            uint64_t v33 = v38;
LABEL_120:
            AAHeaderDestroy(v33);
            return v25;
          }
        }

        else
        {
          uint64_t v9 = v360;
        }

void workerDestroy_0(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 2104);
    if ((v2 & 0x80000000) == 0) {
      close(v2);
    }
    free(*(void **)(a1 + 32));
    free(*(void **)(a1 + 2128));
    memset_s((void *)(a1 + 2112), 0x18uLL, 0, 0x18uLL);
    free((void *)a1);
  }

uint64_t stateConcatPath(uint64_t a1, char *a2, const char *a3)
{
  uint64_t v4 = (char *)(a1 + 16);
  if (*(_DWORD *)(a1 + 1068)) {
    return concatPath(a2, 0x800uLL, v4, a3);
  }
  else {
    return concatExtractPath(a2, 0x800uLL, v4, a3);
  }
}

uint64_t stateGetEntryData( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a2 + 56);
  if ((_DWORD)v8 == -1)
  {
    uint64_t v15 = *(void *)(a2 + 40);
    uint64_t v16 = *(void *)(a2 + 48);
    BOOL v11 = __CFADD__(v15, v16);
    unint64_t v17 = v15 + v16;
    if (!v11 && v17 <= *(void *)(a1 + 1104)) {
      return *(void *)(a1 + 1120) + v15;
    }
  }

  else if (v8 >= *(_DWORD *)(a1 + 1152))
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateGetEntryData",  1008,  120,  0,  "invalid worker index",  a7,  a8,  vars0);
  }

  else
  {
    uint64_t v9 = *(void *)(a2 + 40);
    uint64_t v10 = *(void *)(a2 + 48);
    BOOL v11 = __CFADD__(v9, v10);
    unint64_t v12 = v9 + v10;
    if (!v11)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 1160) + 8 * v8);
      if (v12 <= *(void *)(v13 + 2112)) {
        return *(void *)(v13 + 2128) + v9;
      }
    }
  }

  return 0LL;
}

uint64_t workerUpdateDir(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  size_t v7 = v4;
  int v8 = *(_DWORD *)(a1 + 2104);
  if ((v8 & 0x80000000) == 0)
  {
    if (v4 == *(void *)(a1 + 2096))
    {
      uint64_t result = strcmp(__s, (const char *)(a1 + 48));
      if (!(_DWORD)result) {
        return result;
      }
    }

    close(v8);
    *(_DWORD *)(a1 + 2104) = -1;
  }

  if (v7 >= 0x800)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerUpdateDir",  150,  120,  0,  "directory path too long",  v5,  v6,  v15);
    return 0xFFFFFFFFLL;
  }

  *(void *)(a1 + 2096) = v7;
  memcpy((void *)(a1 + 48), __s, v7);
  *(_BYTE *)(a1 + 48 + v7) = 0;
  int v10 = open((const char *)(a1 + 48), 0);
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 2104) = v10;
  if (v10 < 0)
  {
    makePath((const char *)(a1 + 48), *(void *)(a1 + 2096));
    mkdir((const char *)(a1 + 48), 0x1EDu);
    int v11 = open((const char *)(a1 + 48), 0);
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 2104) = v11;
    if (v11 < 0)
    {
      int v12 = *__error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerUpdateDir",  164,  120,  v12,  "open: %s",  v13,  v14,  a1 + 48);
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t stateShouldCreateFileInCluster( uint64_t a1, unsigned int a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 8LL * a2 + 1240) <= a3)
  {
    uint64_t v16 = "invalid index in HLC/CLC/SLC cluster";
    __int16 v17 = 1019;
  }

  else
  {
    int v12 = (pthread_mutex_t *)(a1 + 1176);
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 1176)) < 0)
    {
      uint64_t v16 = "pthread_mutex_lock";
      __int16 v17 = 1020;
    }

    else
    {
      uint64_t v13 = *(void *)(a1 + 8LL * a2 + 1264);
      uint64_t v14 = *(void *)(v13 + 8 * a3);
      if (v14 == -1) {
        *(void *)(v13 + 8 * a3) = a4;
      }
      if ((pthread_mutex_unlock(v12) & 0x80000000) == 0) {
        return v14 == -1;
      }
      uint64_t v16 = "pthread_mutex_lock";
      __int16 v17 = 1023;
    }
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateShouldCreateFileInCluster",  v17,  120,  0,  v16,  a7,  a8,  v18);
  return 0xFFFFFFFFLL;
}

uint64_t workerApplyAttr(uint64_t a1, uint64_t a2, int a3, char *a4)
{
  uint64_t v6 = *(void **)(a1 + 8);
  size_t v7 = (uint64_t (*)(void, uint64_t, void, char *))v6[131];
  if (v7
    && (v7( v6[130],  23LL,  *(void *)(v6[137] + 32LL) + *(void *)(*(void *)(v6[137] + 8LL) + 16LL * *(unsigned int *)(a2 + 64)),  a4) & 0x80000000) != 0)
  {
    int v11 = "user error";
    __int16 v12 = 178;
  }

  else
  {
    if ((aaEntryAttributesApplyToFD(a4, a3, v6[132]) & 0x80000000) == 0) {
      return 0LL;
    }
    int v11 = "setting attributes";
    __int16 v12 = 182;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerApplyAttr",  v12,  120,  0,  v11,  v8,  v9,  v13);
  return 0xFFFFFFFFLL;
}

uint64_t workerReserve(uint64_t a1, size_t a2)
{
  if (*(void *)(a1 + 40) >= a2) {
    return 0LL;
  }
  *(void *)(a1 + 40) = a2;
  if (a2 < 0x2000000001LL)
  {
    size_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = realloc(v4, a2);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t result = 0LL;
      *(void *)(a1 + 32) = v6;
      return result;
    }

    free(v4);
  }

  else
  {
    *__error() = 12;
  }

  *(void *)(a1 + 32) = 0LL;
  size_t v7 = __error();
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerReserve",  137,  120,  *v7,  "malloc",  v8,  v9,  v10);
  return 0xFFFFFFFFLL;
}

uint64_t workerDecodeAndApplyXAT(uint64_t a1, uint64_t a2, int a3, uint8_t *data, size_t data_size)
{
  size_t v7 = *(void **)(a1 + 8);
  AAEntryXATBlob v13 = AAEntryXATBlobCreateWithEncodedData(data, data_size);
  if (!v13)
  {
    uint64_t v16 = "invalid XAT blob";
    __int16 v17 = 197;
LABEL_9:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerDecodeAndApplyXAT",  v17,  120,  0,  v16,  v11,  v12,  v19);
    uint64_t v15 = 0xFFFFFFFFLL;
    goto LABEL_10;
  }

  uint64_t v14 = (uint64_t (*)(void, uint64_t, void, AAEntryXATBlob))v7[131];
  if (v14
    && (v14( v7[130],  24LL,  *(void *)(v7[137] + 32LL) + *(void *)(*(void *)(v7[137] + 8LL) + 16LL * *(unsigned int *)(a2 + 64)),  v13) & 0x80000000) != 0)
  {
    uint64_t v16 = "user error";
    __int16 v17 = 203;
    goto LABEL_9;
  }

  if ((aaEntryXATBlobApplyToFD(v13, a3, v7[132], v8, v9, v10, v11, v12) & 0x80000000) != 0)
  {
    uint64_t v16 = "applying XAT";
    __int16 v17 = 207;
    goto LABEL_9;
  }

  uint64_t v15 = 0LL;
LABEL_10:
  AAEntryXATBlobDestroy(v13);
  return v15;
}

uint64_t workerDecodeAndApplyACL(uint64_t a1, uint64_t a2, uint64_t a3, uint8_t *data, size_t data_size)
{
  size_t v7 = *(void **)(a1 + 8);
  uint64_t v10 = (unint64_t *)AAEntryACLBlobCreateWithEncodedData(data, data_size);
  if (!v10)
  {
    AAEntryXATBlob v13 = "invalid ACL blob";
    __int16 v14 = 223;
LABEL_9:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"workerDecodeAndApplyACL",  v14,  120,  0,  v13,  v8,  v9,  v16);
    uint64_t v12 = 0xFFFFFFFFLL;
    goto LABEL_10;
  }

  uint64_t v11 = (uint64_t (*)(void, uint64_t, void, unint64_t *))v7[131];
  if (v11
    && (v11( v7[130],  25LL,  *(void *)(v7[137] + 32LL) + *(void *)(*(void *)(v7[137] + 8LL) + 16LL * *(unsigned int *)(a2 + 64)),  v10) & 0x80000000) != 0)
  {
    AAEntryXATBlob v13 = "user error";
    __int16 v14 = 229;
    goto LABEL_9;
  }

  if ((aaEntryACLBlobApplyToFD(v10, a3, v7[132]) & 0x80000000) != 0)
  {
    AAEntryXATBlob v13 = "applying ACL";
    __int16 v14 = 233;
    goto LABEL_9;
  }

  uint64_t v12 = 0LL;
LABEL_10:
  AAEntryACLBlobDestroy((AAEntryACLBlob)v10);
  return v12;
}

uint64_t stateAppendEntry(uint64_t a1, AAHeader header, uint64_t a3, rsize_t a4, char **a5)
{
  *(void *)&v84[1023] = *MEMORY[0x1895F89C0];
  uint64_t v80 = -1LL;
  uint64_t value = 0LL;
  uint64_t v78 = -1LL;
  uint64_t v79 = -1LL;
  int v77 = 0;
  size_t length = 0LL;
  v11.iint key = 5265748;
  uint32_t KeyIndex = AAHeaderGetKeyIndex(header, v11);
  if ((KeyIndex & 0x80000000) != 0
    || ((FieldUInt = AAHeaderGetFieldUInt(header, KeyIndex, &value), FieldUInt <= 1) ? (int v16 = 1) : (int v16 = FieldUInt),
        v16 <= 0))
  {
    __int16 v17 = "invalid archive stream";
    __int16 v18 = 900;
LABEL_10:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateAppendEntry",  v18,  120,  0,  v17,  v13,  v14,  v75);
    return 0xFFFFFFFFLL;
  }

  if (value - 66 <= 0x15)
  {
    if (((1LL << (value - 66)) & 0x274003) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateAppendEntry",  913,  120,  0,  "unsupported entry type %c: %s",  v13,  v14,  value);
      return 0xFFFFFFFFLL;
    }

    if (value == 77) {
      goto LABEL_14;
    }
  }

  v21.iint key = 5521744;
  uint32_t v22 = AAHeaderGetKeyIndex(header, v21);
  if ((v22 & 0x80000000) != 0
    || ((unsigned int FieldString = AAHeaderGetFieldString(header, v22, 0x400uLL, &v83, &length), FieldString <= 1)
      ? (int v26 = 1)
      : (int v26 = FieldString),
        v26 <= 0))
  {
    __int16 v17 = "missing PAT field";
    __int16 v18 = 920;
    goto LABEL_10;
  }

  uint64_t v27 = *(uint64_t (**)(void, uint64_t, char *, AAHeader))(a1 + 1048);
  if (!v27) {
    goto LABEL_28;
  }
  int v28 = v27(*(void *)(a1 + 1040), 20LL, &v83, header);
  if (v28 < 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateAppendEntry",  926,  120,  0,  "Caller cancelled",  v29,  v30,  v75);
    uint64_t v51 = (unsigned int *)(a1 + 1288);
    uint64_t result = 0xFFFFFFFFLL;
    while (!__ldaxr(v51))
    {
      if (!__stlxr(1u, v51)) {
        return result;
      }
    }

    goto LABEL_88;
  }

  if (v28)
  {
LABEL_14:
    uint64_t v20 = 0LL;
    goto LABEL_15;
  }

  LOBYTE(v82[0]) = 0;
  int v31 = (*(uint64_t (**)(void, uint64_t, char *, uint64_t *))(a1 + 1048))( *(void *)(a1 + 1040),  27LL,  &v83,  v82);
  if (v31 < 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecodeAndExtract.c",  (uint64_t)"stateAppendEntry",  932,  120,  0,  "Caller cancelled",  v13,  v14,  v75);
    uint64_t v64 = (unsigned int *)(a1 + 1288);
    while (!__ldaxr(v64))
    {
      if (!__stlxr(1u, v64)) {
        return 0xFFFFFFFFLL;
      }
    }

AAFieldKeySet AAFieldKeySetCreate(void)
{
  v0 = (AAFieldKeySet_impl *)malloc(0x10uLL);
  unsigned int v1 = v0;
  if (v0)
  {
    memset_s(v0, 0x10uLL, 0, 0x10uLL);
  }

  else
  {
    int v2 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"AAFieldKeySetCreate",  63,  103,  *v2,  "malloc",  v3,  v4,  v6);
  }

  return v1;
}

AAFieldKeySet AAFieldKeySetCreateWithString(const char *s)
{
  AAFieldKeySet v2 = AAFieldKeySetCreate();
  if (!v2) {
    goto LABEL_44;
  }
  size_t v3 = strlen(s);
  size_t v6 = v3 + 1;
  if (((v3 + 1) & 3) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"AAFieldKeySetCreateWithString",  73,  103,  0,  "Invalid KeySet string length: %zu",  v4,  v5,  v3 + 1);
    return 0LL;
  }

  if (v6 >> 34)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"AAFieldKeySetCreateWithString",  75,  103,  0,  "String too long: %zu",  v4,  v5,  v3 + 1);
    return 0LL;
  }

  size_t v7 = v6 >> 2;
  if (((v6 >> 2) & 0x80000000) != 0)
  {
LABEL_43:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"AAFieldKeySetCreateWithString",  77,  103,  0,  "realloc_keys",  v4,  v5,  v27);
LABEL_44:
    AAFieldKeySetDestroy(v2);
    return 0LL;
  }

  unsigned int v8 = *((_DWORD *)v2 + 1);
  if (v8 < v7)
  {
    do
    {
      if (v8) {
        v8 += v8 >> 1;
      }
      else {
        unsigned int v8 = 16;
      }
    }

    while (v8 < v7);
    uint64_t v9 = (void *)*((void *)v2 + 1);
    uint64_t v10 = realloc(v9, 4LL * v8);
    if (v10)
    {
      AAFieldKey v11 = v10;
      *((void *)v2 + 1) = v10;
      *((_DWORD *)v2 + 1) = v8;
      goto LABEL_15;
    }

    free(v9);
    *((void *)v2 + 1) = 0LL;
    uint64_t v23 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"realloc_keys",  17,  103,  *v23,  "malloc",  v24,  v25,  v27);
    *(void *)AAFieldKeySet v2 = 0LL;
    goto LABEL_43;
  }

  AAFieldKey v11 = (_BYTE *)*((void *)v2 + 1);
LABEL_15:
  memcpy(v11, s, v6);
  if (v6)
  {
    size_t v12 = v6;
    do
    {
      *AAFieldKey v11 = __toupper((char)*v11);
      ++v11;
      --v12;
    }

    while (v12);
    *(_DWORD *)AAFieldKeySet v2 = v7;
    if (v6 >= 4)
    {
      uint64_t v15 = 0LL;
      if (v7 <= 1) {
        uint64_t v16 = 1LL;
      }
      else {
        uint64_t v16 = v7;
      }
      uint64_t v17 = MEMORY[0x1895F8770];
      while (1)
      {
        uint64_t v18 = *((void *)v2 + 1) + v15;
        if (*(_BYTE *)(v18 + 3))
        {
          if (*(_BYTE *)(v18 + 3) != 44) {
            break;
          }
        }

        *(_BYTE *)(v18 + 3) = 0;
        unsigned int v19 = *(_DWORD *)(*((void *)v2 + 1) + v15);
        if ((v19 & 0x80) != 0)
        {
        }

        else if ((*(_DWORD *)(v17 + 4LL * (char)v19 + 60) & 0x500) == 0)
        {
          goto LABEL_47;
        }

        unsigned int v20 = (__int16)v19 >> 8;
        if (((v19 << 16) & 0x80000000) != 0)
        {
          if (!__maskrune(v20, 0x500uLL)) {
            goto LABEL_47;
          }
        }

        else if ((*(_DWORD *)(v17 + 4LL * v20 + 60) & 0x500) == 0)
        {
          goto LABEL_47;
        }

        unsigned int v21 = (int)(v19 << 8) >> 24;
        if (((v19 << 8) & 0x80000000) != 0) {
          int v22 = __maskrune(v21, 0x500uLL);
        }
        else {
          int v22 = *(_DWORD *)(v17 + 4LL * v21 + 60) & 0x500;
        }
        if (HIBYTE(v19) || !v22)
        {
LABEL_47:
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"AAFieldKeySetCreateWithString",  88,  103,  0,  "invalid key set: %s",  v13,  v14,  (char)s);
          goto LABEL_44;
        }

        v15 += 4LL;
        if (!--v16) {
          goto LABEL_41;
        }
      }

      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"AAFieldKeySetCreateWithString",  86,  103,  0,  "invalid key set: %s",  v13,  v14,  (char)s);
      goto LABEL_44;
    }
  }

  else
  {
    *(_DWORD *)AAFieldKeySet v2 = v7;
  }

uint64_t cmp_keys(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

void AAFieldKeySetDestroy(AAFieldKeySet key_set)
{
  if (key_set)
  {
    free(*((void **)key_set + 1));
    free(key_set);
  }

AAFieldKeySet AAFieldKeySetClone(AAFieldKeySet key_set)
{
  AAFieldKeySet v2 = AAFieldKeySetCreate();
  AAFieldKeySet v5 = v2;
  if (!v2) {
    goto LABEL_15;
  }
  uint64_t v6 = *(unsigned int *)key_set;
  if ((_DWORD)v6)
  {
    if ((v6 & 0x80000000) == 0)
    {
      unsigned int v7 = *((_DWORD *)v2 + 1);
      if (v7 >= v6)
      {
        uint64_t v9 = (void *)*((void *)v2 + 1);
        goto LABEL_12;
      }

      do
      {
        if (v7) {
          v7 += v7 >> 1;
        }
        else {
          unsigned int v7 = 16;
        }
      }

      while (v7 < v6);
      unsigned int v8 = (void *)*((void *)v2 + 1);
      uint64_t v9 = realloc(v8, 4LL * v7);
      if (v9)
      {
        *((void *)v5 + 1) = v9;
        *((_DWORD *)v5 + 1) = v7;
LABEL_12:
        *(_DWORD *)AAFieldKeySet v5 = v6;
        memcpy(v9, *((const void **)key_set + 1), 4 * v6);
        return v5;
      }

      free(v8);
      *((void *)v5 + 1) = 0LL;
      uint64_t v10 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"realloc_keys",  17,  103,  *v10,  "malloc",  v11,  v12,  v14);
      *(void *)AAFieldKeySet v5 = 0LL;
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"AAFieldKeySetClone",  106,  103,  0,  "realloc_keys",  v3,  v4,  v14);
LABEL_15:
    AAFieldKeySetDestroy(v5);
    return 0LL;
  }

  return v5;
}

int AAFieldKeySetClear(AAFieldKeySet key_set)
{
  *(_DWORD *)key_set = 0;
  return 0;
}

int AAFieldKeySetContainsKey(AAFieldKeySet key_set, AAFieldKey key)
{
  uint64_t v3 = 0LL;
  AAFieldKey v10 = key;
  unsigned int v11 = 0;
  do
  {
    *((_BYTE *)&v11 + v3) = __toupper(v10.skey[v3]);
    ++v3;
  }

  while (v3 != 3);
  int v4 = *(_DWORD *)key_set;
  if (*(_DWORD *)key_set && (AAFieldKeySet v5 = (unsigned int *)*((void *)key_set + 1), *v5 < v11))
  {
    int v6 = v4 - 1;
    unsigned int v7 = v5[v4 - 1];
    if (v7 < v11) {
      return 0;
    }
    if (v4 < 3) {
      return v7 == v11;
    }
    int v8 = 0;
    do
    {
      if (v5[(v8 + v6) >> 1] >= v11) {
        int v6 = (v8 + v6) >> 1;
      }
      else {
        int v8 = (v8 + v6) >> 1;
      }
    }

    while (v6 - v8 > 1);
  }

  else
  {
    int v6 = 0;
  }

  if (v6 < v4)
  {
    unsigned int v7 = *(_DWORD *)(*((void *)key_set + 1) + 4LL * v6);
    return v7 == v11;
  }

  return 0;
}

int AAFieldKeySetInsertKey(AAFieldKeySet key_set, AAFieldKey key)
{
  uint64_t v3 = 0LL;
  AAFieldKey v22 = key;
  unsigned int v23 = 0;
  do
  {
    *((_BYTE *)&v23 + v3) = __toupper(v22.skey[v3]);
    ++v3;
  }

  while (v3 != 3);
  int v6 = *(_DWORD *)key_set;
  int v7 = *(_DWORD *)key_set + 1;
  if (v7 < 0) {
    goto LABEL_21;
  }
  unsigned int v8 = v23;
  unsigned int v9 = *((_DWORD *)key_set + 1);
  if (v9 < v7)
  {
    do
    {
      if (v9) {
        v9 += v9 >> 1;
      }
      else {
        unsigned int v9 = 16;
      }
    }

    while (v9 < v7);
    AAFieldKey v10 = (void *)*((void *)key_set + 1);
    unsigned int v11 = realloc(v10, 4LL * v9);
    if (v11)
    {
      *((void *)key_set + 1) = v11;
      *((_DWORD *)key_set + 1) = v9;
      int v6 = *(_DWORD *)key_set;
      goto LABEL_11;
    }

    free(v10);
    *((void *)key_set + 1) = 0LL;
    uint64_t v17 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"realloc_keys",  17,  103,  *v17,  "malloc",  v18,  v19,  v21);
    *(void *)key_set = 0LL;
LABEL_21:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"AAFieldKeySetInsertKey",  139,  103,  0,  "realloc_keys failed",  v4,  v5,  v21);
    return -1;
  }

int AAFieldKeySetRemoveKey(AAFieldKeySet key_set, AAFieldKey key)
{
  uint64_t v3 = 0LL;
  AAFieldKey v14 = key;
  unsigned int v15 = 0;
  do
  {
    *((_BYTE *)&v15 + v3) = __toupper(v14.skey[v3]);
    ++v3;
  }

  while (v3 != 3);
  uint64_t v4 = *(int *)key_set;
  if (!(_DWORD)v4 || (uint64_t v5 = (unsigned int *)*((void *)key_set + 1), *v5 >= v15))
  {
    int v6 = 0;
LABEL_14:
    if (v6 == (_DWORD)v4) {
      return 0;
    }
    uint64_t v5 = (unsigned int *)*((void *)key_set + 1);
    uint64_t v9 = v6;
    unsigned int v7 = v5[v6];
    goto LABEL_16;
  }

  int v6 = v4 - 1;
  unsigned int v7 = v5[v4 - 1];
  if (v7 < v15) {
    return 0;
  }
  if ((int)v4 >= 3)
  {
    int v8 = 0;
    do
    {
      if (v5[(v8 + v6) >> 1] >= v15) {
        int v6 = (v8 + v6) >> 1;
      }
      else {
        int v8 = (v8 + v6) >> 1;
      }
    }

    while (v6 - v8 > 1);
    goto LABEL_14;
  }

  uint64_t v9 = v4 - 1;
LABEL_16:
  if (v7 == v15)
  {
    int v10 = v4 - 1;
    *(_DWORD *)key_set = v10;
    BOOL v11 = __OFSUB__(v10, v6);
    int v12 = v10 - v6;
    if (!((v12 < 0) ^ v11 | (v12 == 0))) {
      memmove(&v5[v9], &v5[v6 + 1], 4LL * v12);
    }
  }

  return 0;
}

int AAFieldKeySetInsertKeySet(AAFieldKeySet key_set, AAFieldKeySet s)
{
  uint64_t v4 = *(unsigned int *)s;
  if ((_DWORD)v4)
  {
    uint64_t v6 = *((void *)s + 1);
    uint64_t v7 = *(unsigned int *)key_set;
    int v8 = (_DWORD *)*((void *)key_set + 1);
    *(void *)key_set = 0LL;
    *((void *)key_set + 1) = 0LL;
    unsigned int v9 = v7 + v4;
    if ((int)v7 + (int)v4 >= 0)
    {
      if (!v9)
      {
LABEL_11:
        if ((_DWORD)v7)
        {
          unsigned int v12 = 0;
          unsigned int v13 = 0;
          unsigned int v14 = 0;
          while (1)
          {
            unsigned int v15 = v8[v14];
            unsigned int v16 = *(_DWORD *)(v6 + 4LL * v13);
            if (v15 == v16)
            {
              *(_DWORD *)(*((void *)key_set + 1) + 4LL * v12) = v15;
              ++v14;
            }

            else
            {
              uint64_t v17 = *((void *)key_set + 1);
              if (v15 < v16)
              {
                *(_DWORD *)(v17 + 4LL * v12) = v15;
                ++v14;
                goto LABEL_19;
              }

              *(_DWORD *)(v17 + 4LL * v12) = v16;
            }

            ++v13;
LABEL_19:
            ++v12;
          }
        }

        unsigned int v14 = 0;
        unsigned int v13 = 0;
        unsigned int v12 = 0;
LABEL_23:
        if (v14 >= v7)
        {
          unsigned int v20 = v12;
        }

        else
        {
          uint64_t v18 = &v8[v14];
          uint64_t v19 = v7 - v14;
          do
          {
            unsigned int v20 = v12 + 1;
            int v21 = *v18++;
            *(_DWORD *)(*((void *)key_set + 1) + 4LL * v12++) = v21;
            --v19;
          }

          while (v19);
        }

        if (v13 >= v4)
        {
          unsigned int v24 = v20;
        }

        else
        {
          AAFieldKey v22 = (int *)(v6 + 4LL * v13);
          uint64_t v23 = v4 - v13;
          do
          {
            unsigned int v24 = v20 + 1;
            int v25 = *v22++;
            *(_DWORD *)(*((void *)key_set + 1) + 4LL * v20++) = v25;
            --v23;
          }

          while (v23);
        }

        LODWORD(v4) = 0;
        *(_DWORD *)key_set = v24;
        goto LABEL_36;
      }

      unsigned int v10 = 0;
      do
      {
        if (v10) {
          v10 += v10 >> 1;
        }
        else {
          unsigned int v10 = 16;
        }
      }

      while (v10 < v9);
      BOOL v11 = malloc(4LL * v10);
      if (v11)
      {
        *((void *)key_set + 1) = v11;
        *((_DWORD *)key_set + 1) = v10;
        goto LABEL_11;
      }

      *((void *)key_set + 1) = 0LL;
      int v26 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"realloc_keys",  17,  103,  *v26,  "malloc",  v27,  v28,  v30);
      *(void *)key_set = 0LL;
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldKeys.c",  (uint64_t)"AAFieldKeySetInsertKeySet",  178,  103,  0,  "realloc_keys",  v2,  v3,  v30);
    LODWORD(v4) = -1;
LABEL_36:
    free(v8);
  }

  return v4;
}

int AAFieldKeySetRemoveKeySet(AAFieldKeySet key_set, AAFieldKeySet s)
{
  unint64_t v2 = *(unsigned int *)s;
  if ((_DWORD)v2)
  {
    unint64_t v3 = *(unsigned int *)key_set;
    uint64_t v4 = *((void *)key_set + 1);
    if ((_DWORD)v3)
    {
      unsigned int v5 = 0;
      unint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      uint64_t v8 = *((void *)s + 1);
      while (1)
      {
        unsigned int v9 = *(_DWORD *)(v4 + 4 * v7);
        unsigned int v10 = *(_DWORD *)(v8 + 4 * v6);
        if (v9 == v10)
        {
          ++v7;
        }

        else if (v9 < v10)
        {
          *(_DWORD *)(*((void *)key_set + 1) + 4LL * v5++) = v9;
          ++v7;
          goto LABEL_9;
        }

        ++v6;
LABEL_9:
        if (v7 >= v3 || v6 >= v2) {
          goto LABEL_13;
        }
      }
    }

    unint64_t v7 = 0LL;
    unsigned int v5 = 0;
LABEL_13:
    if (v7 >= v3)
    {
      unsigned int v13 = v5;
    }

    else
    {
      BOOL v11 = (int *)(v4 + 4 * v7);
      unint64_t v12 = v3 - v7;
      do
      {
        unsigned int v13 = v5 + 1;
        int v14 = *v11++;
        *(_DWORD *)(*((void *)key_set + 1) + 4LL * v5++) = v14;
        --v12;
      }

      while (v12);
    }

    *(_DWORD *)key_set = v13;
  }

  return 0;
}

int AAFieldKeySetSelectKeySet(AAFieldKeySet key_set, AAFieldKeySet s)
{
  unint64_t v2 = *(unsigned int *)s;
  if ((_DWORD)v2 && (unint64_t v3 = *(unsigned int *)key_set, (_DWORD)v3))
  {
    unsigned int v4 = 0;
    unint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    uint64_t v7 = *((void *)s + 1);
    uint64_t v8 = *((void *)key_set + 1);
    do
    {
      unsigned int v9 = *(_DWORD *)(v8 + 4 * v6);
      unsigned int v10 = *(_DWORD *)(v7 + 4 * v5);
      if (v9 == v10)
      {
        *(_DWORD *)(*((void *)key_set + 1) + 4LL * v4++) = v9;
        ++v6;
        ++v5;
      }

      else if (v9 >= v10)
      {
        ++v5;
      }

      else
      {
        ++v6;
      }
    }

    while (v6 < v3 && v5 < v2);
  }

  else
  {
    unsigned int v4 = 0;
  }

  *(_DWORD *)key_set = v4;
  return 0;
}

uint32_t AAFieldKeySetGetKeyCount(AAFieldKeySet key_set)
{
  return *(_DWORD *)key_set;
}

AAFieldKey AAFieldKeySetGetKey(AAFieldKeySet key_set, uint32_t i)
{
  return *(AAFieldKey *)(*((void *)key_set + 1) + 4LL * i);
}

int AAFieldKeySetSerialize(AAFieldKeySet key_set, size_t capacity, char *s)
{
  uint64_t v3 = *(unsigned int *)key_set;
  if ((_DWORD)v3)
  {
    if (capacity >= 4 * v3)
    {
      if ((int)v3 >= 1)
      {
        uint64_t v4 = 0LL;
        unint64_t v5 = s;
        do
        {
          *(_DWORD *)unint64_t v5 = *(_DWORD *)(*((void *)key_set + 1) + 4 * v4);
          if (v4) {
            *(v5 - 1) = 44;
          }
          ++v4;
          v5 += 4;
        }

        while (v4 < *(int *)key_set);
        LODWORD(v3) = *(_DWORD *)key_set;
      }

      s += (4 * v3 - 1);
      goto LABEL_11;
    }
  }

  else if (capacity)
  {
LABEL_11:
    int result = 0;
    *s = 0;
    return result;
  }

  return -1;
}

uint64_t AAPathListCreate()
{
  uint64_t result = create();
  *(_DWORD *)(*(void *)(result + 8) + 16LL) = 1;
  return result;
}

uint64_t create()
{
  v0 = malloc(0x20uLL);
  uint64_t v1 = (uint64_t)v0;
  if (!v0)
  {
    int v10 = *__error();
    BOOL v11 = "malloc";
    __int16 v12 = 444;
LABEL_11:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"create",  v12,  60,  v10,  v11,  v3,  v4,  v14);
    AAPathListDestroy((AAPathList)v1);
    return 0LL;
  }

  memset_s(v0, 0x20uLL, 0, 0x20uLL);
  unint64_t v2 = StringTableCreate();
  *(void *)(v1 + 16) = v2;
  if (!v2)
  {
    BOOL v11 = "StringTableCreate";
    __int16 v12 = 447;
LABEL_10:
    int v10 = 0;
    goto LABEL_11;
  }

  if ((increaseCapacity(v1, 0x100u) & 0x80000000) != 0)
  {
    BOOL v11 = "alloc";
    __int16 v12 = 450;
    goto LABEL_10;
  }

  unsigned int v15 = -1;
  if ((StringTableAppend(*(unsigned int **)(v1 + 16), &unk_1862C62C1, 0LL, &v15, v5, v6, v3, v4) & 0x80000000) != 0)
  {
    BOOL v11 = "String table insert";
    __int16 v12 = 452;
    goto LABEL_10;
  }

  uint64_t v7 = *(void *)(v1 + 8);
  unsigned int v8 = (*(_DWORD *)v1)++;
  uint64_t v9 = v7 + 24LL * v8;
  *(_DWORD *)(v9 + 20) = -1;
  *(_DWORD *)(v9 + 8) = -1;
  *(void *)uint64_t v9 = -1LL;
  *(void *)(v9 + 12) = v15;
  return v1;
}

void AAPathListDestroy(AAPathList path_list)
{
  if (path_list)
  {
    StringTableDestroy(*((void ***)path_list + 2));
    free(*((void **)path_list + 1));
    free(path_list);
  }

AAPathList AAPathListCreateWithDirectoryContents( const char *dir, const char *path, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  uint64_t v6 = ((uint64_t (*)(const char *, const char *, void *, AAEntryMessageProc, AAFlagSet, void))MEMORY[0x1895F8858])( dir,  path,  msg_data,  msg_proc,  flags,  *(void *)&n_threads);
  unsigned int DefaultNThreads = v7;
  unsigned int v10 = v9;
  __int16 v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v17 = (const char *)v6;
  uint64_t v121 = *MEMORY[0x1895F89C0];
  unsigned int v116 = 0;
  bzero(v120, 0x400uLL);
  bzero(v119, 0x400uLL);
  if (!DefaultNThreads) {
    unsigned int DefaultNThreads = getDefaultNThreads();
  }
  if (!realpath_DARWIN_EXTSN(v17, v120))
  {
    int v26 = *__error();
    char v107 = (char)v17;
    unsigned int v24 = "Invalid dir: %s";
    __int16 v25 = 508;
    goto LABEL_47;
  }

  size_t v18 = strlen(v120);
  BOOL v20 = v18 != 1 || v120[0] != 47;
  if (v16)
  {
    size_t v21 = v18;
    __strlcpy_chk();
    if ((normalizePath((uint64_t)v119) & 0x80000000) != 0)
    {
      char v107 = (char)v17;
      unsigned int v24 = "Invalid path (subpath normalization failed): %s/%s";
      __int16 v25 = 517;
LABEL_46:
      int v26 = 0;
      goto LABEL_47;
    }

    if ((concatPath(v118, 0x800uLL, v120, v119) & 0x80000000) != 0)
    {
      int v26 = *__error();
      char v107 = (char)v17;
      unsigned int v24 = "Path too long: %s/%s";
      __int16 v25 = 523;
    }

    else
    {
      if (realpath_DARWIN_EXTSN(v118, __s))
      {
        if (v20 && (strlen(__s) < v21 || memcmp(__s, v120, v21) || __s[v21] && __s[v21] != 47))
        {
          char v107 = (char)v17;
          unsigned int v24 = "Path resolving outside target dir: %s/%s";
          __int16 v25 = 531;
        }

        else
        {
          if (!lstat(__s, &v115) && (v115.st_mode & 0xF000) == 0x4000) {
            goto LABEL_26;
          }
          char v107 = (char)v17;
          unsigned int v24 = "Not a directory: %s/%s";
          __int16 v25 = 534;
        }

        goto LABEL_46;
      }

      int v26 = *__error();
      char v107 = (char)v17;
      unsigned int v24 = "Invalid path, doesn't exist: %s/%s";
      __int16 v25 = 524;
    }

uint64_t increaseCapacity(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 4);
  if (v2 >= a2) {
    return 0LL;
  }
  do
  {
    if (v2) {
      v2 += v2 >> 1;
    }
    else {
      unsigned int v2 = 256;
    }
  }

  while (v2 < a2);
  *(_DWORD *)(a1 + 4) = v2;
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t v5 = realloc(v4, 24LL * v2);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t result = 0LL;
    *(void *)(a1 + 8) = v6;
  }

  else
  {
    free(v4);
    *(void *)(a1 + 8) = 0LL;
    unsigned int v8 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"increaseCapacity",  270,  60,  *v8,  "malloc",  v9,  v10,  v11);
    *(void *)a1 = 0LL;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t expandDirThreadProc( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = MEMORY[0x1895F8858](a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v84 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *(int **)(v8 + 48);
  bzero(__src, 0x400uLL);
  bzero(v82, 0x800uLL);
  uint64_t v10 = (void *)*((void *)v9 + 4);
  if (!v10)
  {
    uint64_t v10 = StringTableCreate();
    *((void *)v9 + 4) = v10;
    if (!v10)
    {
      uint64_t v14 = "String table creation";
      __int16 v15 = 79;
      goto LABEL_101;
    }
  }

  StringTableClear((uint64_t)v10);
  v9[4] = 0;
  size_t v13 = strlen(*(const char **)(v8 + 8));
  if (v13 >= 0x800)
  {
    uint64_t v14 = "dir name too long";
    __int16 v15 = 88;
    goto LABEL_101;
  }

  size_t v16 = v13;
  __memcpy_chk();
  uint64_t v17 = &v82[v16];
  v82[v16] = 0;
  unsigned int v18 = v9[1];
  if (v18 >= v9[2]) {
    return 0LL;
  }
  size_t v19 = v16 + 1;
  __dst = v17 + 1;
  while (1)
  {
    BOOL v20 = *(_DWORD **)v8;
    if (**(_DWORD **)v8 <= v18
      || (v81.__uint64_t d_ino = 0LL, (getPath((uint64_t)v20, v18, 0x400uLL, __src, &v81.d_ino) & 0x80000000) != 0))
    {
      uint64_t v14 = "get node path";
      __int16 v15 = 96;
      goto LABEL_101;
    }

    __uint64_t d_ino = v81.d_ino;
    if (v81.d_ino >= 0x400)
    {
      uint64_t v14 = "truncated node path";
      __int16 v15 = 97;
      goto LABEL_101;
    }

    if (v81.d_ino) {
      size_t v22 = v19 + v81.d_ino;
    }
    else {
      size_t v22 = v16;
    }
    if (v81.d_ino)
    {
      if (v19 + v81.d_ino >= 0x800)
      {
        uint64_t v14 = "path too long";
        __int16 v15 = 103;
        goto LABEL_101;
      }

      *uint64_t v17 = 47;
      memcpy(__dst, __src, d_ino);
    }

    v82[v22] = 0;
    if (lstat(v82, &v80) < 0)
    {
      int v66 = *__error();
      BOOL v73 = v82;
      uint64_t v14 = "lstat %s";
      __int16 v15 = 111;
      goto LABEL_102;
    }

    unsigned int v24 = *(unsigned int (**)(void, uint64_t, _BYTE *, void))(v8 + 24);
    if (v24 && v24(*(void *)(v8 + 16), 12LL, __src, 0LL))
    {
      BOOL v73 = v82;
      uint64_t v14 = "dataless dir error: %s";
      __int16 v15 = 118;
      goto LABEL_101;
    }

    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"expandDirThreadProc",  119,  60,  "skip dataless dir: %s",  v23,  v11,  v12,  (char)v82);
LABEL_21:
    if (++v18 >= v9[2]) {
      return 0LL;
    }
  }

  __int16 v25 = opendir(v82);
  if (!v25)
  {
    uint64_t v59 = *(unsigned int (**)(void, uint64_t, _BYTE *, void))(v8 + 24);
    size_t v19 = v16 + 1;
    if (v59 && v59(*(void *)(v8 + 16), 12LL, __src, 0LL))
    {
      int v66 = *__error();
      BOOL v73 = v82;
      uint64_t v14 = "opendir failed: %s";
      __int16 v15 = 130;
      goto LABEL_102;
    }

    int v74 = *__error();
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"expandDirThreadProc",  131,  60,  "opendir failed with errno=%d: %s",  v60,  v61,  v62,  v74);
    goto LABEL_21;
  }

  int v26 = v25;
  unsigned int v75 = v17;
  int v27 = 1;
  while (1)
  {
    if (!v27) {
      goto LABEL_99;
    }
    if (readdir_r(v26, &v81, &v79)) {
      break;
    }
    if (!v79) {
      goto LABEL_88;
    }
    size_t d_namlen = v81.d_namlen;
    if (v81.d_namlen == 1 && v81.d_name[0] == 46 || v81.d_namlen == 2 && v81.d_name[0] == 46 && v81.d_name[1] == 46) {
      goto LABEL_36;
    }
    unint64_t v31 = v22 + 1 + v81.d_namlen;
    if (v31 >= 0x800)
    {
      uint64_t v67 = "path too long";
      __int16 v68 = 162;
      int v69 = 0;
      goto LABEL_98;
    }

    v82[v22] = 47;
    memcpy(&v82[v22 + 1], v81.d_name, d_namlen);
    v82[v31] = 0;
    if (lstat(v82, &v78))
    {
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"expandDirThreadProc",  169,  60,  "stat failed: %s",  v33,  v34,  v35,  (char)v82);
      goto LABEL_36;
    }

    if (v81.d_type == 4)
    {
      int v37 = *v9;
      if (!*v9) {
        goto LABEL_36;
      }
LABEL_51:
      if (v78.st_dev != v80.st_dev && !*(_DWORD *)(v8 + 40)) {
        goto LABEL_36;
      }
      if (v37)
      {
        int v40 = *(uint64_t (**)(void, uint64_t, void *, void))(v8 + 24);
        if (!v40) {
          goto LABEL_67;
        }
        int v41 = v40(*(void *)(v8 + 16), 10LL, __dst, 0LL);
        if (v41 < 0)
        {
          __int16 v55 = 182;
          goto LABEL_79;
        }

        int v27 = 1;
        if (v41)
        {
          int v36 = 26;
          goto LABEL_38;
        }
      }

      else
      {
        int v27 = 1;
      }

      goto LABEL_60;
    }

    if (v81.d_type) {
      BOOL v38 = 0;
    }
    else {
      BOOL v38 = (v78.st_mode & 0xF000) == 0x4000;
    }
    int v39 = v38;
    int v37 = *v9;
    if ((((*v9 != 0) ^ v39) & 1) != 0) {
      goto LABEL_36;
    }
    if (v39) {
      goto LABEL_51;
    }
    int v27 = 0;
LABEL_60:
    uint64_t v42 = *(uint64_t (**)(void, uint64_t, void *, void))(v8 + 24);
    if (!v42)
    {
LABEL_67:
      BOOL v45 = 1;
      goto LABEL_68;
    }

    int v43 = v42(*(void *)(v8 + 16), 11LL, __dst, 0LL);
    if (v43 < 0)
    {
      __int16 v55 = 189;
LABEL_79:
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"expandDirThreadProc",  v55,  60,  "abort from callback",  v33,  v34,  v35,  (char)v73);
      goto LABEL_80;
    }

    if (v43) {
      int v44 = v27;
    }
    else {
      int v44 = 1;
    }
    if (v44 == 1)
    {
      BOOL v45 = v43 == 0;
LABEL_68:
      int v77 = -1;
      if ((StringTableAppend(*((unsigned int **)v9 + 4), v81.d_name, d_namlen, &v77, v32, v33, v34, v35) & 0x80000000) != 0)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"expandDirThreadProc",  196,  60,  0,  "String insertion failed",  v46,  v47,  (char)v73);
LABEL_80:
        int v27 = 0;
LABEL_81:
        int v36 = 27;
        goto LABEL_38;
      }

      unsigned int v48 = v9[3];
      unsigned int v49 = v9[4];
      int v50 = (char *)*((void *)v9 + 3);
      if (v49 >= v48)
      {
        if (v48) {
          unsigned int v51 = 2 * v48;
        }
        else {
          unsigned int v51 = 256;
        }
        v9[3] = v51;
        uint64_t v52 = (char *)realloc(v50, 12LL * v51);
        if (!v52)
        {
          free(v50);
          *((void *)v9 + 3) = 0LL;
          unint64_t v56 = __error();
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"expandDirThreadProc",  201,  60,  *v56,  "malloc",  v57,  v58,  (char)v73);
          int v27 = 0;
          v9[3] = 0;
          v9[4] = 0;
          goto LABEL_81;
        }

        *((void *)v9 + 3) = v52;
        unsigned int v49 = v9[4];
        int v50 = v52;
      }

      int v36 = 0;
      v9[4] = v49 + 1;
      int v53 = (unsigned int *)&v50[12 * v49];
      int v54 = v77;
      *int v53 = v18;
      v53[1] = v54;
      v53[2] = !v45;
      goto LABEL_37;
    }

uint64_t normalize(_DWORD *a1)
{
  if (*a1)
  {
    unsigned int v2 = StringTableSize(*((unsigned int **)a1 + 2));
    uint64_t v33 = 0LL;
    size_t v3 = *a1;
    if ((StringTableSort(*((unsigned int **)a1 + 2), &v33) & 0x80000000) != 0)
    {
      int v27 = "String table sorting";
      __int16 v28 = 379;
LABEL_30:
      int v30 = 0;
    }

    else
    {
      if ((_DWORD)v3)
      {
        uint64_t v6 = v33;
        unsigned int v7 = (_DWORD *)(*((void *)a1 + 1) + 12LL);
        size_t v8 = v3;
        do
        {
          uint64_t v9 = *v7;
          if (v9 >= v2)
          {
            int v27 = "Name out of range";
            __int16 v28 = 386;
            goto LABEL_30;
          }

          *unsigned int v7 = v6[v9];
          *((void *)v7 - 1) = -1LL;
          v7 += 6;
          --v8;
        }

        while (v8);
        uint64_t v10 = 0LL;
        int v11 = -1;
        a1[7] = -1;
        uint64_t v12 = *((void *)a1 + 1);
        size_t v13 = (_DWORD *)(v12 + 8);
        do
        {
          unsigned int v14 = *(v13 - 2);
          if (v14 == -1)
          {
            if (v11 != -1)
            {
              int v27 = "Multiple root nodes";
              __int16 v28 = 399;
              goto LABEL_30;
            }

            a1[7] = v10;
            int v11 = v10;
          }

          else
          {
            uint64_t v15 = v12 + 24LL * v14;
            _DWORD *v13 = *(_DWORD *)(v15 + 4);
            *(_DWORD *)(v15 + 4) = v10;
          }

          v13 += 6;
          ++v10;
        }

        while (v3 != v10);
        size_t v16 = (char *)calloc(v3, 4uLL);
        if (!v16) {
          goto LABEL_28;
        }
        uint64_t v17 = v16;
        uint64_t v18 = 0LL;
        unsigned int v19 = 0;
        BOOL v20 = (char *)(*((void *)a1 + 1) + 16LL);
        do
        {
          char v21 = *v20;
          v20 += 24;
          if ((v21 & 1) == 0) {
            *(_DWORD *)&v16[4 * v19++] = v18;
          }
          ++v18;
        }

        while (v3 != v18);
        qsort_r(v16, v19, 4uLL, a1, (int (__cdecl *)(void *, const void *, const void *))cmpNodesProc);
        size_t v22 = a1 + 6;
        if (v19)
        {
          uint64_t v23 = 0LL;
          uint64_t v24 = *((void *)a1 + 1);
          do
          {
            unsigned int v25 = *(_DWORD *)&v17[v23];
            *size_t v22 = v25;
            size_t v22 = (unsigned int *)(v24 + 24LL * v25 + 20);
            v23 += 4LL;
          }

          while (4LL * v19 != v23);
        }

        goto LABEL_26;
      }

      a1[7] = -1;
      uint64_t v29 = (char *)calloc(v3, 4uLL);
      if (v29)
      {
        uint64_t v17 = v29;
        qsort_r(v29, 0LL, 4uLL, a1, (int (__cdecl *)(void *, const void *, const void *))cmpNodesProc);
        size_t v22 = a1 + 6;
LABEL_26:
        uint64_t v26 = 0LL;
        *size_t v22 = -1;
LABEL_32:
        free(v33);
        free(v17);
        return v26;
      }

AAPathList AAPathListCreateWithPath(const char *dir, const char *path)
{
  unsigned int v2 = (const char *)((uint64_t (*)(const char *, const char *))MEMORY[0x1895F8858])(dir, path);
  uint64_t v35 = *MEMORY[0x1895F89C0];
  bzero(v34, 0x400uLL);
  bzero(v33, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(v2, v34))
  {
    int v10 = *__error();
    char v29 = (char)v2;
    size_t v8 = "Invalid dir: %s";
    __int16 v9 = 693;
LABEL_20:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"AAPathListCreateWithPath",  v9,  60,  v10,  v8,  v6,  v7,  v29);
    int v11 = 0LL;
    goto LABEL_21;
  }

  size_t v3 = strlen(v34);
  BOOL v5 = v3 != 1 || v34[0] != 47;
  __strlcpy_chk();
  if ((normalizePath((uint64_t)v33) & 0x80000000) != 0)
  {
    char v29 = (char)v2;
    size_t v8 = "Invalid path (subpath normalization failed): %s/%s";
    __int16 v9 = 699;
    goto LABEL_17;
  }

  if ((concatPath(v32, 0x800uLL, v34, v33) & 0x80000000) != 0)
  {
    int v10 = *__error();
    char v29 = (char)v2;
    size_t v8 = "Path too long: %s/%s";
    __int16 v9 = 705;
    goto LABEL_20;
  }

  if (!realpath_DARWIN_EXTSN(v32, __s))
  {
    int v10 = *__error();
    char v29 = (char)v2;
    size_t v8 = "Invalid path, doesn't exist: %s/%s";
    __int16 v9 = 706;
    goto LABEL_20;
  }

  if (v5 && (strlen(__s) < v3 || memcmp(__s, v34, v3) || __s[v3] && __s[v3] != 47))
  {
    char v29 = (char)v2;
    size_t v8 = "Path resolving outside target dir: %s/%s";
    __int16 v9 = 713;
LABEL_17:
    int v10 = 0;
    goto LABEL_20;
  }

  int v11 = (unsigned int *)create();
  if (!v11) {
    goto LABEL_21;
  }
  size_t v13 = strlen(v33);
  if (!v13)
  {
LABEL_38:
    if ((normalize(v11) & 0x80000000) != 0)
    {
      uint64_t v26 = "Tree normalization";
      __int16 v27 = 745;
      goto LABEL_42;
    }

    return (AAPathList)v11;
  }

  size_t v14 = v13;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = *((void *)v11 + 1) + 24LL * v11[7];
  *(_DWORD *)(v17 + 16) |= 1u;
  while (1)
  {
    int v18 = v33[v15];
    if (v18 == 47 || v18 == 0) {
      break;
    }
LABEL_37:
    if (++v15 > v14) {
      goto LABEL_38;
    }
  }

  int v30 = -1;
  if ((increaseCapacity((uint64_t)v11, *v11 + 1) & 0x80000000) != 0)
  {
    uint64_t v26 = "increase PathList capacity";
    __int16 v27 = 732;
    goto LABEL_42;
  }

  if ((StringTableAppend(*((unsigned int **)v11 + 2), &v33[v16], v15 - v16, &v30, v20, v21, v22, v23) & 0x80000000) == 0)
  {
    int v24 = *v11;
    unsigned int v25 = (_DWORD *)(*((void *)v11 + 1) + 24LL * *v11);
    *unsigned int v25 = *v11 - 1;
    v25[3] = v30;
    v25[4] = v18 != 0;
    *int v11 = v24 + 1;
    if (!v18) {
      goto LABEL_38;
    }
    uint64_t v16 = ++v15;
    goto LABEL_37;
  }

  uint64_t v26 = "inserting path component in table";
  __int16 v27 = 733;
LABEL_42:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"AAPathListCreateWithPath",  v27,  60,  0,  v26,  v22,  v23,  v28);
LABEL_21:
  AAPathListDestroy((AAPathList)v11);
  return 0LL;
}

int AAPathListNodeGetPath( AAPathList path_list, uint64_t node, size_t path_capacity, char *path, size_t *path_length)
{
  if (node == -1LL)
  {
    if (path_capacity) {
      *path = 0;
    }
    int result = 0;
    *path_size_t length = 0LL;
  }

  else if (*(unsigned int *)path_list <= node)
  {
    return -1;
  }

  else
  {
    size_t v7 = 0LL;
    int result = getPath((uint64_t)path_list, node, path_capacity, path, &v7);
    if (path_length) {
      *path_size_t length = v7;
    }
  }

  return result;
}

uint64_t getPath(uint64_t a1, unsigned int a2, size_t a3, _BYTE *a4, size_t *a5)
{
  if (a2 == -1)
  {
    size_t v16 = 0LL;
    if (a3) {
      *a4 = 0;
    }
    goto LABEL_15;
  }

  if ((getPath() & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(v10 + 8) + 16LL * *(unsigned int *)(*(void *)(a1 + 8) + 24LL * a2 + 12);
  size_t v12 = *(unsigned int *)(v11 + 8);
  if (!(_DWORD)v12) {
    return 0LL;
  }
  size_t v13 = *a5;
  uint64_t v14 = *a5 + 1;
  if (v14 + v12 < a3)
  {
    uint64_t v15 = (const void *)(*(void *)(v10 + 32) + *(void *)v11);
    if (v13) {
      a4[v13] = 47;
    }
    else {
      uint64_t v14 = 0LL;
    }
    memcpy(&a4[v14], v15, v12);
    size_t v16 = v14 + v12;
    a4[v14 + v12] = 0;
    goto LABEL_15;
  }

  if (a3) {
    return 0xFFFFFFFFLL;
  }
  size_t v16 = v13 + (v12 + 1);
LABEL_15:
  uint64_t result = 0LL;
  *a5 = v16;
  return result;
}

uint64_t AAPathListGetNode(uint64_t a1, char *__s)
{
  uint64_t v2 = *(unsigned int *)(a1 + 28);
  if ((_DWORD)v2 != -1)
  {
    size_t v6 = strlen(__s);
    if (!v6) {
      return v2;
    }
    size_t v7 = 0LL;
    size_t v17 = v6;
    while (1)
    {
      uint64_t v8 = v6 <= v7 + 1 ? v7 + 1 : v6;
      uint64_t v9 = v7;
      while (1)
      {
        int v10 = __s[v9];
        if (v10 == 47) {
          break;
        }
        if (v8 == ++v9)
        {
          int v10 = __s[v8];
          uint64_t v9 = v8;
          break;
        }
      }

      size_t v11 = v9 - v7;
      if (v9 == v7) {
        break;
      }
      uint64_t v12 = *(void *)(a1 + 8);
      uint64_t v2 = *(unsigned int *)(v12 + 24 * v2 + 4);
      if ((_DWORD)v2 == -1) {
        break;
      }
      int v18 = v10;
      uint64_t v13 = *(void *)(a1 + 16);
      uint64_t v14 = *(void *)(v13 + 8);
      uint64_t v15 = &__s[v7];
      while (1)
      {
        uint64_t v16 = *(unsigned int *)(v12 + 24 * v2 + 12);
        if (v11 == *(_DWORD *)(v14 + 16 * v16 + 8)
          && !strncmp((const char *)(*(void *)(v13 + 32) + *(void *)(v14 + 16 * v16)), v15, v11))
        {
          break;
        }

        uint64_t v2 = *(unsigned int *)(v12 + 24 * v2 + 8);
        if ((_DWORD)v2 == -1) {
          return -1LL;
        }
      }

      if (v18) {
        size_t v7 = v9 + 1;
      }
      else {
        size_t v7 = v9;
      }
      size_t v6 = v17;
      if (v7 >= v17) {
        return v2;
      }
    }
  }

  return -1LL;
}

uint64_t AAPathListMerge(uint64_t a1, unsigned int *a2)
{
  uint64_t result = 0LL;
  int v22 = 0;
  if (*a2 != 1)
  {
    if ((StringTableAppendTable(*(void *)(a1 + 16), *((unsigned int **)a2 + 2), &v22) & 0x80000000) != 0)
    {
      unsigned int v19 = "String table merge";
      __int16 v20 = 800;
    }

    else
    {
      int v7 = *(_DWORD *)a1;
      if ((increaseCapacity(a1, *a2 + *(_DWORD *)a1) & 0x80000000) != 0)
      {
        unsigned int v19 = "Capacity increase";
        __int16 v20 = 804;
      }

      else
      {
        if (*a2 >= 2)
        {
          uint64_t v8 = 0LL;
          uint64_t v9 = *(void *)(a1 + 8);
          int v10 = *(_DWORD *)a1;
          size_t v11 = (int *)(*((void *)a2 + 1) + 40LL);
          do
          {
            *(_DWORD *)a1 = v10 + v8 + 1;
            uint64_t v12 = v9 + 24LL * (v10 + v8);
            int v13 = v22 + *(v11 - 1);
            int v14 = *(v11 - 4);
            BOOL v15 = v14 == 0;
            int v16 = v7 - 1 + v14;
            if (v15) {
              int v16 = 0;
            }
            *(_DWORD *)uint64_t v12 = v16;
            int v17 = *v11;
            v11 += 6;
            *(_DWORD *)(v12 + 12) = v13;
            *(_DWORD *)(v12 + 16) = v17;
            *(_DWORD *)(v12 + 20) = -1;
            *(void *)(v12 + 4) = -1LL;
            unint64_t v18 = v8 + 2;
            ++v8;
          }

          while (v18 < *a2);
        }

        if ((normalize((_DWORD *)a1) & 0x80000000) == 0) {
          return 0LL;
        }
        unsigned int v19 = "Tree normalization";
        __int16 v20 = 816;
      }
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"AAPathListMerge",  v20,  60,  0,  v19,  v5,  v6,  v21);
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t AAPathListNodeFirst(AAPathList path_list)
{
  if (*((_DWORD *)path_list + 6) == -1) {
    return -1LL;
  }
  else {
    return *((unsigned int *)path_list + 6);
  }
}

uint64_t AAPathListNodeNext(AAPathList path_list, uint64_t node)
{
  if (*(unsigned int *)path_list <= node)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathList.c",  (uint64_t)"AAPathListNodeNext",  826,  60,  0,  "Invalid node: %llu",  v2,  v3,  node);
    return -1LL;
  }

  else if (*(_DWORD *)(*((void *)path_list + 1) + 24LL * node + 20) == -1)
  {
    return -1LL;
  }

  else
  {
    return *(unsigned int *)(*((void *)path_list + 1) + 24LL * node + 20);
  }

uint64_t cmpNodesProc(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  unsigned int v3 = *a2;
  unsigned int v4 = *a3;
  uint64_t v5 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v5 + 24LL * v3) == *(_DWORD *)(v5 + 24LL * *a3))
  {
    unsigned int v6 = *(_DWORD *)(v5 + 24LL * v3 + 12);
    unsigned int v7 = *(_DWORD *)(v5 + 24LL * v4 + 12);
    if (v6 < v7) {
      return 0xFFFFFFFFLL;
    }
    else {
      return v7 < v6;
    }
  }

  else
  {
    if (*(_DWORD *)a1 <= v3
      || (*(void *)__s2 = 0LL, (getPath(a1, v3, 0x400uLL, __s1, (size_t *)__s2) & 0x80000000) != 0)
      || *(void *)__s2 >= 0x400uLL)
    {
      __s1[0] = 0;
    }

    if (*(_DWORD *)a1 <= v4 || (size_t v10 = 0LL, (getPath(a1, v4, 0x400uLL, __s2, &v10) & 0x80000000) != 0) || v10 >= 0x400) {
      __s2[0] = 0;
    }
    return strcmp(__s1, __s2);
  }

AAArchiveStream AAExtractArchiveOutputStreamOpen( const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  unsigned int DefaultNThreads = n_threads;
  if (!n_threads) {
    unsigned int DefaultNThreads = getDefaultNThreads();
  }
  size_t v10 = (uint64_t *)malloc(0x38uLL);
  size_t v11 = v10;
  if (v10) {
    memset_s(v10, 0x38uLL, 0, 0x38uLL);
  }
  uint64_t v12 = malloc(0x690uLL);
  uint64_t v13 = (uint64_t)v12;
  if (v12)
  {
    memset_s(v12, 0x690uLL, 0, 0x690uLL);
    if (v11)
    {
      if (!realpath_DARWIN_EXTSN(dir, (char *)v13))
      {
        int v22 = *__error();
        char v47 = (char)dir;
        uint64_t v23 = "%s";
        __int16 v24 = 1611;
        goto LABEL_16;
      }

      if (stat((const char *)v13, &v48) || (v48.st_mode & 0xF000) != 0x4000)
      {
        char v47 = (char)dir;
        uint64_t v23 = "Invalid directory: %s";
        __int16 v24 = 1612;
      }

      else
      {
        *(void *)(v13 + 1024) = flags;
        *(void *)(v13 + 1032) = msg_data;
        *(void *)(v13 + 1040) = msg_proc;
        *(double *)(v13 + 1656) = getRealTime();
        *(void *)(v13 + 1640) = 0LL;
        *(_DWORD *)(v13 + 1056) = 1;
        *(_DWORD *)(v13 + 1072) = 0;
        *(_DWORD *)(v13 + 1076) = DefaultNThreads;
        int v16 = calloc(DefaultNThreads, 4uLL);
        *(void *)(v13 + 1080) = v16;
        if (!v16)
        {
          __int16 v20 = "SharedArrayInit: malloc failed\n";
          __int16 v21 = 55;
          goto LABEL_22;
        }

        if (pthread_mutex_init((pthread_mutex_t *)(v13 + 1088), 0LL))
        {
          __int16 v20 = "SharedArrayInit: pthread_mutex_init failed\n";
          __int16 v21 = 56;
LABEL_22:
          pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayInit",  v21,  0,  v20,  v17,  v18,  v19,  v47);
          uint64_t v23 = "SharedArrayInit";
          __int16 v24 = 1619;
          goto LABEL_15;
        }

        if (pthread_cond_init((pthread_cond_t *)(v13 + 1152), 0LL))
        {
          __int16 v20 = "SharedArrayInit: pthread_cond_init failed\n";
          __int16 v21 = 57;
          goto LABEL_22;
        }

        unint64_t VolumeCapabilities = getVolumeCapabilities((const char *)v13);
        char v34 = -1;
        if (VolumeCapabilities < 0x7FFFFFFFFFFFFFFFLL) {
          char v34 = VolumeCapabilities;
        }
        uint64_t v35 = 268LL;
        if ((v34 & 8) == 0) {
          uint64_t v35 = 264LL;
        }
        unint64_t v36 = v35 & 0xFFFFFFFFFFFFFFDFLL | (32LL * (v34 & 1));
        if ((flags & 0x20) == 0 && (v34 & 2) != 0LL) {
          uint64_t v37 = v36 | 0x40;
        }
        else {
          uint64_t v37 = v36;
        }
        *(void *)(v13 + 1048) = v37;
        for (uint64_t i = 0LL; i != 240; i += 80LL)
        {
          *(_OWORD *)(v13 + i + 1376) = 0u;
          if (pthread_mutex_init((pthread_mutex_t *)(v13 + i + 1312), 0LL) < 0)
          {
            int v39 = __error();
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"clusterInit",  472,  72,  *v39,  "pthread_mutex_init",  v40,  v41,  v47);
            uint64_t v23 = "cluster init";
            __int16 v24 = 1638;
            goto LABEL_15;
          }
        }

        *(void *)(v13 + 1200) = v13;
        if (pthread_mutex_init((pthread_mutex_t *)(v13 + 1216), 0LL))
        {
          int v22 = *__error();
          uint64_t v23 = "pthread_mutex_init";
          __int16 v24 = 1643;
          goto LABEL_16;
        }

        if ((createThread((pthread_t *)(v13 + 1208), (uint64_t)retireThreadProc, v13 + 1200, 0LL) & 0x80000000) == 0)
        {
          *(_DWORD *)(v13 + 1060) = DefaultNThreads;
          if (DefaultNThreads < 0x2E8BA2E9)
          {
            uint64_t v42 = calloc(DefaultNThreads, 0xB0uLL);
            *(void *)(v13 + 1064) = v42;
            if (v42)
            {
              if (!DefaultNThreads)
              {
LABEL_50:
                v11[3] = (uint64_t)extractStreamWriteHeader;
                v11[4] = (uint64_t)extractStreamWriteBlob;
                *size_t v11 = v13;
                v11[1] = (uint64_t)extractStreamClose;
                v11[2] = (uint64_t)extractStreamAbort;
                return (AAArchiveStream)v11;
              }

              uint64_t v43 = 0LL;
              while (1)
              {
                uint64_t v44 = *(void *)(v13 + 1064);
                uint64_t v45 = v44 + v43;
                *(void *)(v44 + v43) = v13;
                if (AASharedBufferPipeOpen( (AAByteStream *)(v44 + v43 + 32),  (AAByteStream *)(v44 + v43 + 40),  0x40000uLL) < 0)
                {
                  uint64_t v23 = "creating shared data buffer";
                  __int16 v24 = 1654;
                  goto LABEL_15;
                }

                if (AASharedBufferPipeOpen((AAByteStream *)(v45 + 16), (AAByteStream *)(v45 + 24), 0x4000uLL) < 0)
                {
                  uint64_t v23 = "creating shared command buffer";
                  __int16 v24 = 1655;
                  goto LABEL_15;
                }

                uint64_t v46 = v44 + v43;
                if ((SemInit(v46 + 48) & 0x80000000) != 0)
                {
                  uint64_t v23 = "SemInit failed";
                  __int16 v24 = 1656;
                  goto LABEL_15;
                }

                v43 += 176LL;
                if (176LL * DefaultNThreads == v43) {
                  goto LABEL_50;
                }
              }

              uint64_t v23 = "creating worker thread";
              __int16 v24 = 1657;
              goto LABEL_15;
            }
          }

          else
          {
            *__error() = 12;
            *(void *)(v13 + 1064) = 0LL;
          }

          int v22 = *__error();
          uint64_t v23 = "malloc";
          __int16 v24 = 1649;
          goto LABEL_16;
        }

        uint64_t v23 = "creating retire thread";
        __int16 v24 = 1644;
      }

pthread_mutex_t *retireThreadProc(pthread_mutex_t *a1)
{
  uint64_t v2 = (pthread_mutex_t *)&a1->__opaque[8];
  sig = (void *)a1->__sig;
  if (pthread_mutex_lock((pthread_mutex_t *)&a1->__opaque[8])) {
    goto LABEL_71;
  }
  unsigned int v4 = sig + 164;
  while (1)
  {
    unint64_t v5 = *(void *)&a1[1].__opaque[16];
    if (v5 >= *(void *)&a1[1].__opaque[24])
    {
      if (!pthread_mutex_unlock(v2)) {
        goto LABEL_70;
      }
      uint64_t v7 = 0LL;
    }

    else
    {
      uint64_t v6 = *(void *)&a1[1].__opaque[32];
      *(void *)&a1[1].__opaque[16] = v5 + 1;
      uint64_t v7 = *(void *)(v6 + 8 * v5);
      if (!pthread_mutex_unlock(v2))
      {
        if (!v7) {
          return a1;
        }
        goto LABEL_10;
      }
    }

    uint64_t v15 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"retireThreadDequeue",  643,  72,  *v15,  "pthread_mutex_unlock",  v16,  v17,  v69);
    if (!v7) {
      return a1;
    }
LABEL_10:
    int v18 = *(_DWORD *)(v7 + 2300);
    if (v18 == -1) {
      goto LABEL_69;
    }
    if (v18 == 2)
    {
      *(_DWORD *)(v7 + 2300) = 3;
      uint64_t v19 = (void (*)(void, uint64_t, uint64_t, uint64_t))sig[130];
      if (v19) {
        v19(sig[129], 21LL, v7, v7 + 2272);
      }
    }

    uint64_t v20 = *(void *)(v7 + 2048);
    if (v20 != 70)
    {
LABEL_32:
      if (v20 == 72)
      {
        uint64_t v32 = sig[195];
        if (v32 == sig[194])
        {
          uint64_t v33 = 2 * v32;
          BOOL v34 = v32 == 0;
          uint64_t v35 = 32LL;
          if (!v34) {
            uint64_t v35 = v33;
          }
          sig[194] = v35;
          if ((unint64_t)(8 * v35) >= 0x2000000001LL)
          {
            *__error() = 12;
            goto LABEL_63;
          }

          uint64_t v42 = (void *)sig[196];
          unint64_t v36 = realloc(v42, 8 * v35);
          if (v36)
          {
            sig[196] = v36;
            uint64_t v32 = sig[195];
            goto LABEL_42;
          }

          free(v42);
LABEL_63:
          sig[196] = 0LL;
          int v54 = __error();
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"hlinkInsertEntry",  455,  72,  *v54,  "malloc",  v55,  v56,  v69);
          sig[194] = 0LL;
          sig[195] = 0LL;
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"retireThreadProc",  681,  72,  0,  "hlinkInsertEntry failed: %s",  v57,  v58,  v7);
LABEL_66:
          if (*(_DWORD *)(v7 + 2300) == -1) {
            goto LABEL_69;
          }
LABEL_67:
          *(_DWORD *)(v7 + 2300) = -1;
          uint64_t v64 = (void (*)(void, uint64_t, uint64_t, uint64_t))sig[130];
          if (v64) {
            v64(sig[129], 22LL, v7, v7 + 2272);
          }
          goto LABEL_69;
        }

        unint64_t v36 = (void *)sig[196];
LABEL_42:
        sig[195] = v32 + 1;
        v36[v32] = v7;
        uint64_t v43 = (unsigned int *)(v7 + 2304);
        do
          unsigned int v44 = __ldaxr(v43);
        while (__stlxr(v44 + 1, v43));
        uint64_t v20 = *(void *)(v7 + 2048);
      }

      if (v20 != 68) {
        goto LABEL_69;
      }
      uint64_t v45 = sig[198];
      if (v45 == sig[197])
      {
        uint64_t v46 = 2 * v45;
        BOOL v34 = v45 == 0;
        uint64_t v47 = 32LL;
        if (!v34) {
          uint64_t v47 = v46;
        }
        sig[197] = v47;
        if ((unint64_t)(8 * v47) >= 0x2000000001LL)
        {
          *__error() = 12;
LABEL_65:
          sig[199] = 0LL;
          uint64_t v59 = __error();
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"dirInsertEntry",  433,  72,  *v59,  "malloc",  v60,  v61,  v69);
          sig[197] = 0LL;
          sig[198] = 0LL;
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"retireThreadProc",  687,  72,  0,  "dirInsertEntry failed: %s",  v62,  v63,  v7);
          goto LABEL_66;
        }

        unsigned int v49 = (void *)sig[199];
        stat v48 = realloc(v49, 8 * v47);
        if (!v48)
        {
          free(v49);
          goto LABEL_65;
        }

        sig[199] = v48;
        uint64_t v45 = sig[198];
      }

      else
      {
        stat v48 = (void *)sig[199];
      }

      sig[198] = v45 + 1;
      v48[v45] = v7;
      int v50 = (unsigned int *)(v7 + 2304);
      do
        unsigned int v51 = __ldaxr(v50);
      while (__stlxr(v51 + 1, v50));
      goto LABEL_69;
    }

    unint64_t v21 = 0LL;
    int v22 = (unsigned int *)(v7 + 2304);
    while (1)
    {
      uint64_t v23 = *(void *)(v7 + 8 * v21 + 2312);
      if (v23 == -1) {
        goto LABEL_30;
      }
      if (pthread_mutex_lock((pthread_mutex_t *)&v4[10 * v21]) < 0)
      {
        int v37 = *__error();
        __int16 v40 = 561;
        uint64_t v41 = "pthread_mutex_lock";
        goto LABEL_59;
      }

      uint64_t v26 = v4[10 * v21 + 9];
      if (!v21) {
        break;
      }
      uint64_t v27 = *(void *)(v7 + 2312);
      if (v27 == -1) {
        break;
      }
      *(void *)(v26 + 32 * v23 + 16) = v27;
      if (v21 >= 2)
      {
        uint64_t v28 = *(void *)(v7 + 2320);
        if (v28 != -1) {
          goto LABEL_25;
        }
      }

uint64_t SemInit(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  if (pthread_mutex_init((pthread_mutex_t *)(a1 + 8), 0LL)) {
    return 0xFFFFFFFFLL;
  }
  if (pthread_cond_init((pthread_cond_t *)(a1 + 72), 0LL)) {
    return 0xFFFFFFFFLL;
  }
  return 0LL;
}

uint64_t extractThreadProc( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = MEMORY[0x1895F8858](a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v132 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(*(void *)v8 + 1064LL);
  bzero(v130, 0x800uLL);
  bzero(__s, 0x800uLL);
  bzero(__s2, 0x800uLL);
  uint64_t v13 = (char *)malloc(0x40000uLL);
  if (!v13)
  {
    int v114 = *__error();
    stat v115 = "malloc";
    __int16 v116 = 756;
LABEL_197:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractThreadProc",  v116,  72,  v114,  v115,  v11,  v12,  v118);
    free(v13);
    return v8;
  }

  if (*(_DWORD *)(v9 + 1060) <= -1171354717 * ((unint64_t)(v8 - v10) >> 4))
  {
    char v118 = -93 * ((unint64_t)(v8 - v10) >> 4);
    stat v115 = "invalid thread ID %d";
    __int16 v116 = 757;
    int v114 = 0;
    goto LABEL_197;
  }

  int v123 = -1171354717 * ((unint64_t)(v8 - v10) >> 4);
  int v14 = 0;
  uint64_t v15 = (pthread_mutex_t *)(v9 + 1088);
  uint64_t v16 = (pthread_mutex_t *)(v8 + 56);
  uint64_t v17 = (pthread_cond_t *)(v8 + 120);
  uint64_t v120 = v9 + 1200;
  uint64_t v121 = (pthread_cond_t *)(v9 + 1152);
  int v122 = -1;
  while (1)
  {
LABEL_4:
    if (v14) {
      goto LABEL_20;
    }
    if (pthread_mutex_lock(v15))
    {
      __int16 v21 = 117;
      int v22 = "SharedArrayPush: pthread_mutex_lock failed\n";
LABEL_14:
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayPush",  v21,  0,  v22,  v18,  v19,  v20,  v118);
      goto LABEL_15;
    }

    uint64_t v23 = *(unsigned int *)(v9 + 1072);
    unsigned int v24 = *(_DWORD *)(v9 + 1076);
    int v25 = v23;
    if (v23 < v24)
    {
      *(_DWORD *)(*(void *)(v9 + 1080) + 4 * v23) = v123;
      int v25 = *(_DWORD *)(v9 + 1072);
    }

    *(_DWORD *)(v9 + 1072) = v25 + 1;
    if (!v25 && pthread_cond_broadcast(v121))
    {
      __int16 v21 = 122;
      int v22 = "SharedArrayPush: pthread_cond_broadcast failed\n";
      goto LABEL_14;
    }

    if (pthread_mutex_unlock(v15))
    {
      __int16 v21 = 124;
      int v22 = "SharedArrayPush: pthread_mutex_unlock failed\n";
      goto LABEL_14;
    }

    if (v23 >= v24)
    {
      __int16 v21 = 125;
      int v22 = "SharedArrayPush: stack is full\n";
      goto LABEL_14;
    }

LABEL_190:
                  if (*(_DWORD *)(v56 + 2300) != 2) {
                    *(_DWORD *)(v56 + 2300) = 2;
                  }
                  if (*(void *)(v56 + 2048) == 68LL || (applyEntryAttributes(v9, v56) & 0x80000000) == 0) {
                    goto LABEL_106;
                  }
                  char v118 = v56;
                  __int16 v84 = 833;
LABEL_121:
                  uint64_t v85 = "applyEntryAttributes failed: %s";
                  goto LABEL_132;
                }

uint64_t extractStreamClose( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = MEMORY[0x1895F8858](a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v154 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v11 = result;
  unint64_t v140 = *(void *)(result + 1024);
  if (atomic_load((unsigned int *)(result + 1600)))
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamClose",  1486,  72,  0,  "stream cancelled",  v9,  v10,  v139);
    int v13 = 0;
  }

  else
  {
    int v13 = 1;
  }

  if (*(void *)(v11 + 1632) || *(void *)(v11 + 1640))
  {
    extractStreamStateFail(v11);
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamClose",  1492,  72,  0,  "invalid state on destroy",  v14,  v15,  v139);
    int v13 = 0;
  }

  if (*(void *)(v11 + 1064))
  {
    int v141 = v13;
    unint64_t v16 = *(unsigned int *)(v11 + 1060);
    if ((_DWORD)v16)
    {
      uint64_t v17 = 0LL;
      unint64_t v18 = 0LL;
      int v19 = 0;
      do
      {
        uint64_t v20 = *(void *)(v11 + 1064);
        if (v20)
        {
          uint64_t v21 = v20 + v17;
          if (*(void *)(v21 + 8)) {
            ++v19;
          }
          if (!v141)
          {
            int v22 = *(AAByteStream_impl **)(v21 + 32);
            if (v22)
            {
              AAByteStreamCancel(v22);
              unint64_t v16 = *(unsigned int *)(v11 + 1060);
            }
          }
        }

        ++v18;
        v17 += 176LL;
      }

      while (v18 < v16);
      if (v19)
      {
        for (int i = 0; i != v19; ++i)
        {
          if (pthread_mutex_lock((pthread_mutex_t *)(v11 + 1088)))
          {
            __int16 v27 = 91;
            uint64_t v28 = "SharedArrayPop: pthread_mutex_lock failed\n";
LABEL_25:
            pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  v27,  0,  v28,  v24,  v25,  v26,  v139);
          }

          else
          {
            while (1)
            {
              int v29 = *(_DWORD *)(v11 + 1072);
              if (v29) {
                break;
              }
              if (pthread_cond_wait((pthread_cond_t *)(v11 + 1152), (pthread_mutex_t *)(v11 + 1088)))
              {
                __int16 v27 = 94;
                uint64_t v28 = "SharedArrayPop: pthread_cond_wait failed\n";
                goto LABEL_25;
              }
            }

            unsigned int v30 = v29 - 1;
            *(_DWORD *)(v11 + 1072) = v30;
            unsigned int v31 = *(_DWORD *)(*(void *)(v11 + 1080) + 4LL * v30);
            if (pthread_mutex_unlock((pthread_mutex_t *)(v11 + 1088))) {
              pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  98,  0,  "SharedArrayPop: pthread_mutex_unlock failed\n",  v32,  v33,  v34,  v139);
            }
            if (v31 != -1)
            {
              uint64_t v35 = *(void *)(v11 + 1064);
              unint64_t v36 = (pthread_mutex_t *)(v35 + 176LL * v31 + 56);
              if (!pthread_mutex_lock(v36))
              {
                uint64_t v37 = v35 + 176LL * v31;
                int v38 = *(_DWORD *)(v37 + 48);
                *(_DWORD *)(v37 + 48) = v38 + 1;
                if (v38 || !pthread_cond_broadcast((pthread_cond_t *)(v35 + 176LL * v31 + 120))) {
                  pthread_mutex_unlock(v36);
                }
              }

              uint64_t v153 = 0LL;
              int buf = 42;
              uint64_t v39 = v35 + 176LL * v31;
              AAByteStreamWrite(*(AAByteStream *)(v39 + 16), &buf, 0xCuLL);
              joinThread(*(_opaque_pthread_t **)(v39 + 8));
              AAByteStreamClose(*(AAByteStream *)(v39 + 16));
              AAByteStreamClose(*(AAByteStream *)(v39 + 24));
              AAByteStreamClose(*(AAByteStream *)(v39 + 32));
              AAByteStreamClose(*(AAByteStream *)(v39 + 40));
              if (!pthread_mutex_destroy(v36)) {
                pthread_cond_destroy((pthread_cond_t *)(v35 + 176LL * v31 + 120));
              }
            }
          }
        }
      }
    }

    free(*(void **)(v11 + 1064));
    int v13 = v141;
  }

  if (!pthread_mutex_destroy((pthread_mutex_t *)(v11 + 1088)) && !pthread_cond_destroy((pthread_cond_t *)(v11 + 1152))) {
    free(*(void **)(v11 + 1080));
  }
  if (*(void *)(v11 + 1208))
  {
    retireThreadEnqueue(v11 + 1200, 0LL);
    joinThread(*(_opaque_pthread_t **)(v11 + 1208));
    pthread_mutex_destroy((pthread_mutex_t *)(v11 + 1216));
  }

  if (*(void *)(v11 + 1632))
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamClose",  1541,  72,  0,  "entry found in extract stream",  v45,  v46,  v139);
    entryRelease(*(void *)(v11 + 1632), v47, v48, v49, v50, v51, v52, v53);
    int v13 = 0;
  }

  int v142 = v13;
  uint64_t v54 = 0LL;
  unint64_t v55 = *(void *)(v11 + 1024);
  unsigned int v147 = v55 & 1;
  uint64_t v56 = v11 + 1312;
  uint64_t v57 = (void *)(v11 + 1384);
  char v144 = v55;
  uint64_t v145 = v11 + 1312;
  uint64_t v143 = (v55 >> 7) & 1;
  do
  {
    uint64_t v150 = (void *)(v56 + 80 * v54 + 64);
    if (*v150)
    {
      uint64_t v58 = 0LL;
      int v149 = (void *)(v145 + 80 * v54 + 72);
      BOOL v59 = (v144 & 0x10) == 0 && v54 == 2;
      char v60 = v59;
      if (v59) {
        int v61 = v143;
      }
      else {
        int v61 = 0;
      }
      int v148 = v61;
      char v146 = v60 ^ 1 | v143;
      while (1)
      {
        int v62 = (uint64_t *)(*v149 + 32 * v58);
        uint64_t v63 = v62 + 1;
        if (!v62[1]) {
          goto LABEL_103;
        }
        uint64_t v64 = v62[2];
        int v65 = v57;
        if (v64 != -1 || (uint64_t v64 = *(void *)(*v149 + 32 * v58 + 24), v65 = (void *)(v11 + 1464), v64 != -1)) {
          int v62 = (uint64_t *)(*v65 + 32 * v64);
        }
        uint64_t v66 = *v62;
        if (*v62)
        {
          if (*(_DWORD *)(v66 + 2300) == 3) {
            break;
          }
        }

        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamProcessClusters",  1049,  72,  0,  "no valid DAT entry for cluster %d/%llu",  v45,  v46,  v54);
        while (1)
        {
          uint64_t v82 = *v63;
          if (!*v63) {
            break;
          }
          *uint64_t v63 = *(void *)(v82 + 8 * v54 + 2336);
          if (*(_DWORD *)(v82 + 2300) != -1)
          {
            *(_DWORD *)(v82 + 2300) = -1;
            uint64_t v83 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(v11 + 1040);
            if (v83) {
              v83(*(void *)(v11 + 1032), 22LL, v82, v82 + 2272);
            }
          }

          entryRelease(v82, v40, v41, v42, v43, v44, v45, v46);
        }

LABEL_103:
      }

      if ((concatExtractPath((char *)&buf, 0x800uLL, (char *)v11, (const char *)v66) & 0x80000000) != 0) {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamProcessClusters",  1071,  72,  0,  "invalid DAT path",  v45,  v46,  v139);
      }
      while (1)
      {
        uint64_t v81 = *v63;
        if (!*v63)
        {
          uint64_t v57 = (void *)(v11 + 1384);
          goto LABEL_103;
        }

        *uint64_t v63 = *(void *)(v81 + 8 * v54 + 2336);
        if (v81 == v66)
        {
          uint64_t v72 = v66;
          goto LABEL_100;
        }

        int Path = concatExtractPath(v151, 0x800uLL, (char *)v11, (const char *)v81);
        if (Path < 0) {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamProcessClusters",  1082,  72,  0,  "invalid path: %s",  v67,  v68,  v81);
        }
        unlink(v151);
        if (!(_DWORD)v54) {
          break;
        }
        if ((_DWORD)v54 == 1) {
          goto LABEL_71;
        }
        if (v148) {
          break;
        }
        if ((v146 & 1) == 0)
        {
LABEL_71:
          int v70 = clonefile((const char *)&buf, v151, 0);
          char v71 = 0;
          if ((v70 & 0x80000000) == 0) {
            goto LABEL_80;
          }
          pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamProcessClusters",  1116,  72,  "failed to create clone: %s",  v44,  v45,  v46,  v81);
        }

        int v76 = copyFileWithAttributes((const char *)&buf, v151, 0, v147, 0);
        char v71 = 0;
        if (v76 < 0)
        {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamProcessClusters",  1123,  72,  0,  "create copy: %s",  v45,  v46,  v81);
          int v77 = 0;
LABEL_88:
          if ((applyEntryAttributes(v11, v81) & 0x80000000) != 0)
          {
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamProcessClusters",  1129,  72,  0,  "setting entry attributes: %s",  v45,  v46,  v81);
            goto LABEL_92;
          }

          goto LABEL_89;
        }

LABEL_147:
  unsigned int v120 = atomic_load((unsigned int *)(v11 + 1604));
  uint64_t v121 = (FILE **)MEMORY[0x1895F89D0];
  if (v120)
  {
    char v122 = atomic_load((unsigned int *)(v11 + 1604));
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamClose",  1556,  72,  0,  "%u entries failed to extract",  v45,  v46,  v122);
    BOOL v123 = 0;
  }

  else
  {
    BOOL v123 = v142 != 0;
    if (v142 && v140 >> 62)
    {
      double v124 = getRealTime() - *(double *)(v11 + 1656);
      BOOL v123 = 1;
      fwrite("Extract archive\n", 0x10uLL, 1uLL, *v121);
      fprintf(*v121, "%12u worker threads\n", *(_DWORD *)(v11 + 1060));
      fprintf(*v121, "%12u directories\n", *(_DWORD *)(v11 + 1672));
      fprintf(*v121, "%12u regular files\n", *(_DWORD *)(v11 + 1668));
      fprintf(*v121, "%12u symbolic links\n", *(_DWORD *)(v11 + 1676));
      fprintf(*v121, "%12u entries\n", *(_DWORD *)(v11 + 1664));
      fprintf(*v121, "%12.2f time (s)\n", v124);
    }
  }

  for (uint64_t j = 0LL; j != 3; ++j)
  {
    uint64_t v126 = v119 + 80 * j;
    uint64_t v128 = *(void *)(v126 + 64);
    stat v127 = (unint64_t *)(v126 + 64);
    if (v128)
    {
      unint64_t v129 = 0LL;
      unint64_t v130 = (uint64_t *)(v145 + 80 * j + 72);
      do
      {
        uint64_t v131 = *v130;
        uint64_t v132 = *(const char **)(*v130 + 32 * v129 + 8);
        if (v132)
        {
          do
          {
            fprintf(*v121, "pending %s\n", v132);
            uint64_t v132 = *(const char **)&v132[8 * j + 2336];
          }

          while (v132);
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"clusterFree",  485,  72,  0,  "cluster has pending entries %d/%llu",  v133,  v134,  j);
          while (1)
          {
            uint64_t v131 = *v130;
            uint64_t v135 = *v130 + 32 * v129;
            uint64_t v138 = *(void *)(v135 + 8);
            uint64_t v137 = (void *)(v135 + 8);
            uint64_t v136 = v138;
            if (!v138) {
              break;
            }
            *uint64_t v137 = *(void *)(v136 + 8 * v129 + 2336);
            entryRelease(v136, v40, v41, v42, v43, v44, v45, v46);
          }
        }

        entryRelease(*(void *)(v131 + 32 * v129++), v40, v41, v42, v43, v44, v45, v46);
      }

      while (v129 < *v127);
    }

    uint64_t v119 = v11 + 1312;
    pthread_mutex_destroy((pthread_mutex_t *)(v145 + 80 * j));
    free(*(void **)(v145 + 80 * j + 72));
  }

  free(*(void **)(v11 + 1568));
  free(*(void **)(v11 + 1624));
  memset_s((void *)(v11 + 1616), 0x10uLL, 0, 0x10uLL);
  free(*(void **)(v11 + 1304));
  free(*(void **)(v11 + 1592));
  free((void *)v11);
  return (v123 - 1);
}

uint64_t extractStreamWriteHeader( uint64_t a1, AAHeader header, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v104 = *MEMORY[0x1895F89C0];
  uint64_t size = 0LL;
  uint64_t value = -1LL;
  uint64_t offset = 0LL;
  uint64_t v9 = *(void *)(a1 + 1024);
  *(_DWORD *)(a1 + 1608) = 0;
  if (*(void *)(a1 + 1632) || *(void *)(a1 + 1640))
  {
    uint64_t v10 = "invalid extract state";
    __int16 v11 = 1245;
LABEL_4:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamWriteHeader",  v11,  72,  0,  v10,  a7,  a8,  v95);
LABEL_5:
    extractStreamStateFail(a1);
    return 0xFFFFFFFFLL;
  }

  v15.iint key = 5265748;
  uint32_t KeyIndex = AAHeaderGetKeyIndex(header, v15);
  if ((KeyIndex & 0x80000000) != 0 || AAHeaderGetFieldUInt(header, KeyIndex, &value) >= 2)
  {
    uint64_t v32 = "AA entry missing TYP field";
    __int16 v33 = 1249;
LABEL_24:
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamWriteHeader",  v33,  72,  v32,  v17,  v18,  v19,  v95);
    goto LABEL_25;
  }

  if (value - 66 > 0x11 || ((1LL << (value - 66)) & 0x24457) == 0)
  {
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 1608) = 1;
    return result;
  }

  length[0] = 0LL;
  v21.iint key = 5521744;
  uint32_t v22 = AAHeaderGetKeyIndex(header, v21);
  if ((v22 & 0x80000000) != 0 || AAHeaderGetFieldString(header, v22, 0x400uLL, __s, length) >= 2)
  {
    uint64_t v32 = "YAA entry missing/invalid PAT field";
    __int16 v33 = 1274;
    goto LABEL_24;
  }

  uint64_t v23 = *(uint64_t (**)(void, uint64_t, char *, AAHeader))(a1 + 1040);
  if (v23)
  {
    int v24 = v23(*(void *)(a1 + 1032), 20LL, __s, header);
    if (v24 < 0)
    {
      uint64_t v10 = "user cancelled";
      __int16 v11 = 1284;
      goto LABEL_4;
    }

    if (!v24)
    {
      int v25 = (*(uint64_t (**)(void, uint64_t, char *, size_t *))(a1 + 1040))( *(void *)(a1 + 1032),  27LL,  __s,  length);
      if (v25 < 0)
      {
        uint64_t v10 = "user cancelled";
        __int16 v11 = 1289;
        goto LABEL_4;
      }

      if (v25) {
        __strlcpy_chk();
      }
      goto LABEL_20;
    }

uint64_t extractStreamWriteBlob( uint64_t a1, size_t a2, void *__src, rsize_t __smax, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = 0LL;
  if (__smax && !*(_DWORD *)(a1 + 1608))
  {
    uint64_t v12 = *(void **)(a1 + 1632);
    uint64_t v13 = *(void *)(a1 + 1640);
    if (*(_OWORD *)(a1 + 1632) == 0LL)
    {
      uint64_t v14 = "no active entry or active thread";
      __int16 v15 = 1423;
LABEL_8:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamWriteBlob",  v15,  72,  0,  v14,  a7,  a8,  v60);
      extractStreamStateFail(a1);
      return 0xFFFFFFFFLL;
    }

    unsigned int v16 = *(_DWORD *)(a1 + 1648);
    if (v16 >= *(_DWORD *)(a1 + 1616))
    {
      uint64_t v19 = "invalid blob reference";
      __int16 v20 = 1424;
      goto LABEL_13;
    }

    uint64_t v17 = *(void *)(a1 + 1624);
    int v18 = *(_DWORD *)(v17 + 24LL * v16);
    if (((v18 ^ a2) & 0xFFFFFF) != 0)
    {
      uint64_t v19 = "inconsistent blob key";
      __int16 v20 = 1428;
LABEL_13:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamWriteBlob",  v20,  72,  0,  v19,  a7,  a8,  v60);
      return 0xFFFFFFFFLL;
    }

    uint64_t v21 = v17 + 24LL * v16;
    rsize_t v23 = *(void *)(v21 + 8);
    uint32_t v22 = (void *)(v21 + 8);
    if (v23 < __smax)
    {
      uint64_t v19 = "too many blob bytes received";
      __int16 v20 = 1429;
      goto LABEL_13;
    }

    uint64_t v25 = *(void *)&v18 & 0xFFFFFFLL;
    if ((*(void *)&v18 & 0xFFFFFFuLL) <= 0x544143)
    {
      if (v25 != 4408665)
      {
        if (v25 == 4997953)
        {
          if (v12)
          {
            uint64_t v26 = v12[278];
            BOOL v27 = __CFADD__(v26, __smax);
            unint64_t v28 = v26 + __smax;
            if (v27 || (v28 & 0x8000000000000000LL) != 0) {
              goto LABEL_112;
            }
            int v29 = v12 + 278;
            a2 = v12[279];
            if (a2 < v28)
            {
              do
              {
                while (!a2)
                {
                  a2 = 0x4000LL;
                  if (v28 <= 0x4000)
                  {
                    int v31 = (void **)(v12 + 280);
                    a2 = 0x4000LL;
                    goto LABEL_68;
                  }
                }

                size_t v30 = a2 >> 1;
                if ((a2 & (a2 >> 1)) != 0) {
                  size_t v30 = a2 & (a2 >> 1);
                }
                a2 += v30;
              }

              while (a2 < v28);
              int v31 = (void **)(v12 + 280);
              if (a2 >= 0x2000000001LL)
              {
                int v61 = (void **)(v12 + 280);
                *__error() = 12;
                goto LABEL_111;
              }

LABEL_70:
            uint64_t v44 = v12[280];
            if (__src)
            {
              memcpy((void *)(v44 + *v29), __src, __smax);
            }

            else if (v44)
            {
              memset_s((void *)(v44 + *v29), __smax, 0, __smax);
            }

            *v29 += __smax;
            if ((__smax & 0x8000000000000000LL) != 0)
            {
LABEL_112:
              uint64_t v14 = "too many blob bytes received";
              __int16 v15 = 1438;
              goto LABEL_8;
            }
          }

          if (v13 && (extractThreadSendCommand(v13, 65, __smax, __src) & 0x80000000) != 0)
          {
            uint64_t v14 = "sending blob";
            __int16 v15 = 1439;
            goto LABEL_8;
          }
        }

        goto LABEL_97;
      }

      if (!v12) {
        goto LABEL_96;
      }
      uint64_t v37 = v12[281];
      BOOL v27 = __CFADD__(v37, __smax);
      unint64_t v38 = v37 + __smax;
      if (!v27 && (v38 & 0x8000000000000000LL) == 0)
      {
        uint32_t v39 = v12 + 281;
        a2 = v12[282];
        if (a2 < v38)
        {
          do
          {
            while (!a2)
            {
              a2 = 0x4000LL;
              if (v38 <= 0x4000)
              {
                size_t v41 = (void **)(v12 + 283);
                a2 = 0x4000LL;
                goto LABEL_76;
              }
            }

            size_t v40 = a2 >> 1;
            if ((a2 & (a2 >> 1)) != 0) {
              size_t v40 = a2 & (a2 >> 1);
            }
            a2 += v40;
          }

          while (a2 < v38);
          size_t v41 = (void **)(v12 + 283);
          if (a2 >= 0x2000000001LL)
          {
            AAFieldKey v63 = (void **)(v12 + 283);
            *__error() = 12;
            goto LABEL_117;
          }

LABEL_74:
      uint64_t v47 = v12[277];
      if (__src)
      {
        memcpy((void *)(v47 + *v34), __src, __smax);
      }

      else if (v47)
      {
        memset_s((void *)(v47 + *v34), __smax, 0, __smax);
      }

      *v34 += __smax;
      if ((__smax & 0x8000000000000000LL) == 0)
      {
LABEL_90:
        if (v13 && (extractThreadSendCommand(v13, 88, __smax, __src) & 0x80000000) != 0)
        {
          uint64_t v14 = "sending blob";
          __int16 v15 = 1434;
          goto LABEL_8;
        }

        goto LABEL_97;
      }
    }

LABEL_115:
    uint64_t v14 = "too many blob bytes received";
    __int16 v15 = 1433;
    goto LABEL_8;
  }

  return result;
}

    uint64_t v2 = 0;
    if (v114)
    {
      uint64_t v2 = v114;
      if (*(_DWORD *)(a1 + 148) == *(_DWORD *)(a1 + 88)) {
        return a1;
      }
    }
  }

void extractStreamAbort(uint64_t a1)
{
  uint64_t v1 = (unsigned int *)(a1 + 1600);
  while (!__ldaxr(v1))
  {
    if (!__stlxr(1u, v1))
    {
      extractStreamStateFail(a1);
      return;
    }
  }

  __clrex();
}

void entryRelease( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = (unsigned int *)(a1 + 2304);
    do
    {
      unsigned int v10 = __ldaxr(v9);
      unsigned int v11 = v10 - 1;
    }

    while (__stlxr(v11, v9));
    if (!v11)
    {
      int v12 = *(_DWORD *)(a1 + 2300);
      if (v12 != -1 && v12 != 3) {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"entryDestroy",  223,  72,  0,  "invalid entry final state %d: %s",  a7,  a8,  *(_DWORD *)(a1 + 2300));
      }
      if (atomic_load(v9))
      {
        char v15 = atomic_load((unsigned int *)(a1 + 2304));
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"entryDestroy",  224,  72,  0,  "invalid entry final ref count %u: %s",  a7,  a8,  v15);
      }

      if ((*(_DWORD *)(a1 + 2296) & 0x80000000) == 0)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"entryDestroy",  226,  72,  0,  "invalid entry final fd",  a7,  a8,  v16);
        close(*(_DWORD *)(a1 + 2296));
      }

      AAByteStreamClose(*(AAByteStream *)(a1 + 2288));
      free(*(void **)(a1 + 2216));
      memset_s((void *)(a1 + 2200), 0x18uLL, 0, 0x18uLL);
      free(*(void **)(a1 + 2240));
      memset_s((void *)(a1 + 2224), 0x18uLL, 0, 0x18uLL);
      free(*(void **)(a1 + 2264));
      memset_s((void *)(a1 + 2248), 0x18uLL, 0, 0x18uLL);
      free((void *)a1);
    }
  }

uint64_t extractThreadFailEntry(uint64_t *a1)
{
  uint64_t v1 = a1[21];
  if (!v1) {
    return 0LL;
  }
  a1[21] = 0LL;
  uint64_t v3 = *a1;
  if (*(_DWORD *)(v1 + 2300) != -1)
  {
    *(_DWORD *)(v1 + 2300) = -1;
    unsigned int v4 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(v3 + 1040);
    if (v4)
    {
      v4(*(void *)(v3 + 1032), 22LL, v1, v1 + 2272);
      uint64_t v3 = *a1;
    }
  }

  unint64_t v5 = (unsigned int *)(v3 + 1604);
  do
    unsigned int v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  AAByteStreamClose(*(AAByteStream *)(v1 + 2288));
  *(void *)(v1 + 2288) = 0LL;
  if ((retireThreadEnqueue(*a1 + 1200, v1) & 0x80000000) == 0) {
    return 0LL;
  }
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractThreadFailEntry",  736,  72,  0,  "sending entry to retire thread",  v7,  v8,  v10);
  return 0xFFFFFFFFLL;
}

uint64_t applyEntryAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  AAEntryACLBlob v4 = AAEntryACLBlobCreate();
  char v10 = (unint64_t *)AAEntryXATBlobCreate();
  rsize_t v11 = *(void *)(a2 + 2224);
  if (v11 && (aaEntryACLBlobInitWithEncodedData(v4, *(char **)(a2 + 2240), v11, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    uint64_t v19 = "invalid ACL blob";
    __int16 v20 = 354;
LABEL_22:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"applyEntryAttributes",  v20,  72,  0,  v19,  v8,  v9,  v39);
    int v30 = 0;
    char v16 = 0LL;
    goto LABEL_32;
  }

  rsize_t v12 = *(void *)(a2 + 2200);
  if (v12 && (aaEntryXATBlobInitWithEncodedData(v10, *(char **)(a2 + 2216), v12, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    uint64_t v19 = "invalid XAT blob";
    __int16 v20 = 357;
    goto LABEL_22;
  }

  rsize_t v13 = *(void *)(a2 + 2248);
  if (v13)
  {
    char v16 = AAEntryYECBlobCreateWithEncodedData(*(void **)(a2 + 2264), v13);
    if (!v16)
    {
      uint64_t v17 = "invalid YEC blob";
      __int16 v18 = 361;
LABEL_25:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"applyEntryAttributes",  v18,  72,  0,  v17,  v14,  v15,  v39);
LABEL_26:
      int v30 = 0;
      goto LABEL_32;
    }
  }

  else
  {
    char v16 = 0LL;
  }

  uint64_t v21 = *(void (**)(void, uint64_t, uint64_t, unint64_t *))(a1 + 1040);
  if (v21)
  {
    v21(*(void *)(a1 + 1032), 24LL, a2, v10);
    (*(void (**)(void, uint64_t, uint64_t, AAEntryACLBlob))(a1 + 1040))(*(void *)(a1 + 1032), 25LL, a2, v4);
  }

  if (v16)
  {
    *(_DWORD *)size_t v40 = 0;
    if ((AAEntryYECBlobApplyToPath( (uint64_t)v16,  (char *)a1,  (const char *)a2,  (int *)v40,  *(void *)(a1 + 1024),  *(_DWORD *)(a1 + 1060)) & 0x80000000) != 0)
    {
      char v39 = v40[0];
      uint64_t v17 = "corrupted file data, ECC failed 0x%08x: %s";
      __int16 v18 = 377;
      goto LABEL_25;
    }

    if (*(_DWORD *)v40) {
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"applyEntryAttributes",  378,  72,  "ECC applied 0x%08x: %s",  v22,  v14,  v15,  v40[0]);
    }
  }

  if ((concatExtractPath(v40, 0x800uLL, (char *)a1, (const char *)a2) & 0x80000000) != 0)
  {
    char v39 = a1;
    uint64_t v17 = "invalid path: %s/%s";
    __int16 v18 = 391;
    goto LABEL_25;
  }

  uint64_t v26 = *(unsigned int *)(a2 + 2296);
  uint64_t v27 = v26;
  if ((v26 & 0x80000000) != 0)
  {
    uint64_t v27 = open(v40, 0x200000);
    if ((v27 & 0x80000000) != 0)
    {
      int v36 = *__error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"applyEntryAttributes",  400,  72,  v36,  "open: %s",  v37,  v38,  (char)v40);
      goto LABEL_26;
    }
  }

  if ((aaEntryXATBlobApplyToFD(v10, v27, *(void *)(a1 + 1024), v23, v24, v25, v14, v15) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"applyEntryAttributes",  405,  72,  0,  "applying XAT: %s",  v28,  v29,  a2);
    int v30 = 0;
  }

  else
  {
    int v30 = 1;
  }

  if ((aaEntryACLBlobApplyToFD((unint64_t *)v4, v27, *(void *)(a1 + 1024)) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"applyEntryAttributes",  406,  72,  0,  "applying ACL: %s",  v31,  v32,  a2);
    int v30 = 0;
  }

  if ((aaEntryAttributesApplyToFD((char *)(a2 + 2056), v27, *(void *)(a1 + 1024)) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"applyEntryAttributes",  407,  72,  0,  "applying ATTR: %s",  v33,  v34,  a2);
    int v30 = 0;
    if ((v26 & 0x80000000) == 0) {
      goto LABEL_32;
    }
  }

  else if ((v26 & 0x80000000) == 0)
  {
    goto LABEL_32;
  }

  close(v27);
LABEL_32:
  AAEntryXATBlobDestroy((AAEntryXATBlob)v10);
  AAEntryACLBlobDestroy(v4);
  AAEntryYECBlobDestroy(v16);
  if (v30) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t retireThreadEnqueue(uint64_t a1, uint64_t a2)
{
  AAEntryACLBlob v4 = (pthread_mutex_t *)(a1 + 16);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 16)))
  {
    uint64_t v5 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"retireThreadEnqueue",  597,  72,  *v5,  "pthread_mutex_lock",  v6,  v7,  v21);
    return 0xFFFFFFFFLL;
  }

  unint64_t v10 = *(void *)(a1 + 88);
  unint64_t v9 = *(void *)(a1 + 96);
  unint64_t v11 = v9 - v10;
  if (v9 == v10)
  {
    unint64_t v9 = 0LL;
    *(void *)(a1 + 88) = 0LL;
    *(void *)(a1 + 96) = 0LL;
  }

  else if (v10 >= 0x40)
  {
    memmove(*(void **)(a1 + 104), (const void *)(*(void *)(a1 + 104) + 8 * v10), 8 * v11);
    *(void *)(a1 + 88) = 0LL;
    *(void *)(a1 + 96) = v11;
    unint64_t v9 = v11;
  }

  unint64_t v12 = *(void *)(a1 + 80);
  if (v9 < v12) {
    goto LABEL_14;
  }
  uint64_t v13 = 2 * v12;
  if (!v12) {
    uint64_t v13 = 256LL;
  }
  *(void *)(a1 + 80) = v13;
  if ((unint64_t)(8 * v13) < 0x2000000001LL)
  {
    uint64_t v14 = *(void **)(a1 + 104);
    uint64_t v15 = realloc(v14, 8 * v13);
    if (!v15)
    {
      free(v14);
      goto LABEL_18;
    }

    *(void *)(a1 + 104) = v15;
    unint64_t v9 = *(void *)(a1 + 96);
    unint64_t v12 = *(void *)(a1 + 80);
LABEL_14:
    if (v9 < v12)
    {
      uint64_t v16 = *(void *)(a1 + 104);
      *(void *)(a1 + 96) = v9 + 1;
      *(void *)(v16 + 8 * v9) = a2;
    }

    int v17 = 1;
    goto LABEL_19;
  }

  *__error() = 12;
LABEL_18:
  int v17 = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
LABEL_19:
  if (pthread_mutex_unlock(v4))
  {
    __int16 v18 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"retireThreadEnqueue",  623,  72,  *v18,  "pthread_mutex_unlock",  v19,  v20,  v21);
    int v17 = 0;
  }

  if (v17) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void extractStreamStateFail(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 1632);
  uint64_t v3 = *(void *)(a1 + 1632);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 1632);
    if (*(_DWORD *)(v3 + 2300) != -1)
    {
      *(_DWORD *)(v3 + 2300) = -1;
      uint64_t v5 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 1040);
      uint64_t v4 = v3;
      if (v5)
      {
        v5(*(void *)(a1 + 1032), 22LL, v3, v3 + 2272);
        uint64_t v4 = *(void *)(a1 + 1632);
      }
    }

    if ((retireThreadEnqueue(a1 + 1200, v4) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamSendEntryToRetireThread",  1163,  72,  0,  "retireThreadEnqueue failed",  v6,  v7,  v18);
      entryRelease(v3, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = (unsigned int *)(a1 + 1604);
    do
      unsigned int v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }

  else
  {
    uint64_t v17 = *(void *)(a1 + 1640);
    if (v17) {
      extractThreadSendCommand(v17, 70, 0LL, 0LL);
    }
  }

  *(_DWORD *)(a1 + 1608) = 1;
  *uint64_t v2 = 0LL;
  v2[1] = 0LL;
}

uint64_t extractThreadSendCommand(uint64_t a1, int a2, size_t a3, const void *a4)
{
  int buf = a2;
  size_t v14 = a3;
  if (AAByteStreamWrite(*(AAByteStream *)(a1 + 16), &buf, 0xCuLL) == 12)
  {
    if (!a3 || AAByteStreamWrite(*(AAByteStream *)(a1 + 32), a4, a3) == a3) {
      return 0LL;
    }
    uint64_t v10 = "sending command payload";
    __int16 v11 = 713;
  }

  else
  {
    uint64_t v10 = "sending command";
    __int16 v11 = 708;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractThreadSendCommand",  v11,  72,  0,  v10,  v7,  v8,  v12);
  return 0xFFFFFFFFLL;
}

uint64_t clusterEntryUpdateDAT(uint64_t a1, int a2, unint64_t a3, uint64_t a4, void *a5)
{
  *a5 = 0LL;
  if (a3 == -1LL) {
    return 0LL;
  }
  uint64_t v9 = a1 + 1312;
  uint64_t v10 = (pthread_mutex_t *)(a1 + 1312 + 80LL * a2);
  if (pthread_mutex_lock(v10) < 0)
  {
    int v22 = *__error();
    uint64_t v25 = "pthread_mutex_lock";
    __int16 v26 = 514;
LABEL_29:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"clusterEntryUpdateDAT",  v26,  72,  v22,  v25,  v23,  v24,  v38);
    return 0xFFFFFFFFLL;
  }

  int v11 = a2;
  uint64_t v12 = v9 + 80LL * a2;
  unint64_t v15 = *(void *)(v12 + 64);
  uint64_t v13 = (unint64_t *)(v12 + 64);
  unint64_t v14 = v15;
  if (v15 <= a3)
  {
    unint64_t v27 = v14;
    do
    {
      if (v27) {
        v27 *= 2LL;
      }
      else {
        unint64_t v27 = 32LL;
      }
    }

    while (v27 <= a3);
    unint64_t *v13 = v27;
    uint64_t v28 = v9 + 80LL * a2;
    uint64_t v31 = *(void **)(v28 + 72);
    int v30 = (void *)(v28 + 72);
    uint64_t v29 = v31;
    if (32 * v27 < 0x2000000001LL)
    {
      unsigned int v16 = (char *)realloc(v29, 32 * v27);
      if (v16)
      {
        *int v30 = v16;
        unint64_t v32 = *v13 - v14;
        if (*v13 > v14)
        {
          uint64_t v33 = &v16[32 * v14 + 16];
          do
          {
            *((void *)v33 - 2) = 0LL;
            *((void *)v33 - 1) = 0LL;
            *(void *)uint64_t v33 = -1LL;
            *((void *)v33 + 1) = -1LL;
            v33 += 32;
            --v32;
          }

          while (v32);
        }

        goto LABEL_5;
      }

      free(v29);
    }

    else
    {
      *__error() = 12;
    }

    *int v30 = 0LL;
    uint64_t v34 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"clusterEntryUpdateDAT",  523,  72,  *v34,  "malloc",  v35,  v36,  v38);
    unint64_t *v13 = 0LL;
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_27;
  }

  unsigned int v16 = *(char **)(v9 + 80LL * a2 + 72);
LABEL_5:
  uint64_t v17 = 0LL;
  char v18 = &v16[32 * a3];
  uint64_t v19 = *(void *)v18;
  if (a4 && !v19)
  {
    *(void *)char v18 = a4;
    uint64_t v20 = (unsigned int *)(a4 + 2304);
    do
      unsigned int v21 = __ldaxr(v20);
    while (__stlxr(v21 + 1, v20));
    uint64_t v19 = *(void *)(*(void *)(v9 + 80LL * v11 + 72) + 32 * a3);
    uint64_t v17 = 1LL;
  }

  *a5 = v19;
LABEL_27:
  if (pthread_mutex_unlock(v10) < 0)
  {
    int v22 = *__error();
    uint64_t v25 = "pthread_mutex_unlock";
    __int16 v26 = 547;
    goto LABEL_29;
  }

  return v17;
}

uint64_t extractStreamEntryEnd( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 1608)) {
    return 0LL;
  }
  uint64_t v11 = *(void *)(a1 + 1632);
  uint64_t v12 = *(void *)(a1 + 1640);
  if (*(_OWORD *)(a1 + 1632) == 0LL)
  {
    uint64_t v13 = "no active entry or active thread";
    __int16 v14 = 1202;
LABEL_14:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamEntryEnd",  v14,  72,  0,  v13,  a7,  a8,  v16);
    extractStreamStateFail(a1);
    return 0xFFFFFFFFLL;
  }

  if (v11)
  {
    if ((extractStreamSendEntryToExtractThread(a1) & 0x80000000) != 0)
    {
      uint64_t v13 = "send entry to thread";
      __int16 v14 = 1207;
      goto LABEL_14;
    }

    uint64_t v12 = *(void *)(a1 + 1640);
  }

  unint64_t v15 = (void *)(a1 + 1632);
  if (v12) {
    extractThreadSendCommand(v12, 69, 0LL, 0LL);
  }
  uint64_t result = 0LL;
  *unint64_t v15 = 0LL;
  v15[1] = 0LL;
  return result;
}

uint64_t extractStreamSendEntryToExtractThread(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 1088);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 1088)))
  {
    uint64_t v6 = "SharedArrayPop: pthread_mutex_lock failed\n";
    __int16 v7 = 91;
LABEL_8:
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  v7,  0,  v6,  v3,  v4,  v5,  v20);
    uint64_t v13 = "SharedArrayPop failed";
    __int16 v14 = 1145;
LABEL_9:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAExtractArchiveOutputStream.c",  (uint64_t)"extractStreamSendEntryToExtractThread",  v14,  72,  0,  v13,  v11,  v12,  v20);
    return 0xFFFFFFFFLL;
  }

  while (1)
  {
    int v8 = *(_DWORD *)(a1 + 1072);
    if (v8) {
      break;
    }
    if (pthread_cond_wait((pthread_cond_t *)(a1 + 1152), v2))
    {
      uint64_t v6 = "SharedArrayPop: pthread_cond_wait failed\n";
      __int16 v7 = 94;
      goto LABEL_8;
    }
  }

  unsigned int v9 = v8 - 1;
  *(_DWORD *)(a1 + 1072) = v9;
  unsigned int v10 = *(_DWORD *)(*(void *)(a1 + 1080) + 4LL * v9);
  if (pthread_mutex_unlock(v2))
  {
    uint64_t v6 = "SharedArrayPop: pthread_mutex_unlock failed\n";
    __int16 v7 = 98;
    goto LABEL_8;
  }

  uint64_t v16 = *(void *)(a1 + 1064);
  uint64_t v17 = v16 + 176LL * v10;
  *(void *)(a1 + 1640) = v17;
  *(void *)(v17 + 168) = *(void *)(a1 + 1632);
  *(void *)(a1 + 1632) = 0LL;
  if (pthread_mutex_lock((pthread_mutex_t *)(v17 + 56))
    || (v18 = v16 + 176LL * v10, int v19 = *(_DWORD *)(v18 + 48), *(_DWORD *)(v18 + 48) = v19 + 1, !v19)
    && pthread_cond_broadcast((pthread_cond_t *)(v16 + 176LL * v10 + 120))
    || pthread_mutex_unlock((pthread_mutex_t *)(v17 + 56)))
  {
    uint64_t v13 = "SemRelease failed";
    __int16 v14 = 1150;
    goto LABEL_9;
  }

  if ((extractThreadSendCommand(v16 + 176LL * v10, 66, 0LL, 0LL) & 0x80000000) != 0)
  {
    uint64_t v13 = "extract thread BEGIN failed";
    __int16 v14 = 1153;
    goto LABEL_9;
  }

  return 0LL;
}

uint64_t aaHeaderInitWithEncodedData(uint64_t a1, unsigned __int16 *a2, unint64_t a3)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 40) = 0LL;
  if (a3 <= 5)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"aaHeaderInitWithEncodedData",  113,  101,  0,  "invalid header size: %llu",  v6,  v7,  a3);
    goto LABEL_63;
  }

  if (*(_DWORD *)a2 != 826360153 && *(_DWORD *)a2 != 825246017)
  {
    int v8 = "invalid header magic";
    __int16 v9 = 114;
    goto LABEL_62;
  }

  if (a2[2] != a3)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"aaHeaderInitWithEncodedData",  116,  101,  0,  "header size mismatch: stored %u, got %llu",  v6,  v7,  a2[2]);
    goto LABEL_63;
  }

  *(void *)(a1 + 16) = 0LL;
  unsigned int v10 = (void *)(a1 + 16);
  if ((a3 & 0x8000000000000000LL) != 0) {
    goto LABEL_61;
  }
  size_t v11 = *(void *)(a1 + 24);
  if (v11 >= a3)
  {
    uint64_t v14 = 0LL;
    unint64_t v15 = *(char **)(a1 + 32);
LABEL_22:
    memcpy(&v15[v14], a2, a3);
    goto LABEL_23;
  }

  do
  {
    while (!v11)
    {
      size_t v11 = 0x4000LL;
      if (a3 <= 0x4000)
      {
        uint64_t v13 = (void **)(a1 + 32);
        size_t v11 = 0x4000LL;
        goto LABEL_20;
      }
    }

    size_t v12 = v11 >> 1;
    if ((v11 & (v11 >> 1)) != 0) {
      size_t v12 = v11 & (v11 >> 1);
    }
    v11 += v12;
  }

  while (v11 < a3);
  uint64_t v13 = (void **)(a1 + 32);
  if (v11 >= 0x2000000001LL)
  {
    *__error() = 12;
    goto LABEL_60;
  }

uint64_t init_blob_with_magic(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 16);
  size_t v3 = *(void *)(a1 + 24);
  if (v3 <= 5)
  {
    while (v3)
    {
      size_t v4 = v3 >> 1;
      if ((v3 & (v3 >> 1)) != 0) {
        size_t v4 = v3 & (v3 >> 1);
      }
      v3 += v4;
      if (v3 >= 6) {
        goto LABEL_8;
      }
    }

    size_t v3 = 0x4000LL;
LABEL_8:
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = realloc(v5, v3);
    if (!v6)
    {
      free(v5);
      *(_DWORD *)a1 = 0;
      v2[1] = 0LL;
      v2[2] = 0LL;
      *uint64_t v2 = 0LL;
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"init_blob_with_magic",  61,  101,  0,  "realloc_blob failed",  v13,  v14,  v18);
      return 0xFFFFFFFFLL;
    }

    *(void *)(a1 + 24) = v3;
    *(void *)(a1 + 32) = v6;
  }

  *(void *)(a1 + 16) = 0LL;
  **(_DWORD **)(a1 + 32) = 825246017;
  unint64_t v7 = *(void *)(a1 + 16) + 4LL;
  *(void *)(a1 + 16) = v7;
  unint64_t v8 = v7 + 2;
  if (v7 >= 0xFFFFFFFFFFFFFFFELL || (v8 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  unint64_t v9 = *(void *)(a1 + 24);
  if (v9 >= v8)
  {
    unint64_t v15 = *(char **)(a1 + 32);
LABEL_28:
    uint64_t result = 0LL;
    *(_WORD *)&v15[v7] = 6;
    *v2 += 2LL;
  }

  else
  {
    size_t v10 = 0x4000LL;
    do
    {
      while (!v9)
      {
        unint64_t v9 = 0x4000LL;
        if (v8 <= 0x4000) {
          goto LABEL_26;
        }
      }

      unint64_t v11 = v9 >> 1;
      if ((v9 & (v9 >> 1)) != 0) {
        unint64_t v11 = v9 & (v9 >> 1);
      }
      v9 += v11;
    }

    while (v9 < v8);
    size_t v10 = v9;
    if (v9 >= 0x2000000001LL)
    {
      *__error() = 12;
      goto LABEL_30;
    }

uint64_t realloc_fields(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 4);
  if (v3 >= a2) {
    return 0LL;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 4);
  do
  {
    if (v4) {
      v4 += v4 >> 1;
    }
    else {
      unsigned int v4 = 16;
    }
  }

  while (v4 < a2);
  if (v3 >= v4) {
    return 0LL;
  }
  if (v4 < 0xAAAAAAAB)
  {
    uint64_t v6 = *(void **)(a1 + 8);
    unint64_t v7 = realloc(v6, 48LL * v4);
    if (v7)
    {
      unint64_t v8 = v7;
      uint64_t result = 0LL;
      *(void *)(a1 + 8) = v8;
      *(_DWORD *)(a1 + 4) = v4;
      return result;
    }

    free(v6);
  }

  else
  {
    *__error() = 12;
  }

  *(void *)(a1 + 8) = 0LL;
  unint64_t v9 = __error();
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"realloc_fields",  35,  101,  *v9,  "malloc",  v10,  v11,  v12);
  *(void *)a1 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  *(void *)(a1 + 16) = 0LL;
  return result;
}

uint64_t aaHeaderInitWithPath(AAHeader_impl *a1, AAFieldKeySet_impl *a2, char *a3, const char *a4)
{
  uint64_t v84 = *MEMORY[0x1895F89C0];
  init_blob_with_magic((uint64_t)a1);
  *(_DWORD *)a1 = 0;
  *((void *)a1 + 5) = 0LL;
  if ((concatPath(v83, 0x800uLL, a3, a4) & 0x80000000) != 0)
  {
    LOBYTE(v76) = (_BYTE)a3;
    uint64_t v11 = "invalid path %s/%s";
    __int16 v12 = 196;
LABEL_7:
    int v10 = 0;
    goto LABEL_8;
  }

  if ((init_blob_with_magic((uint64_t)a1) & 0x80000000) != 0)
  {
    uint64_t v11 = "init_blob_with_magic";
    __int16 v12 = 199;
    goto LABEL_7;
  }

  *(_DWORD *)a1 = 0;
  *((void *)a1 + 5) = 0LL;
  if (lstat(v83, &v79))
  {
    int v10 = *__error();
    uint64_t v76 = v83;
    uint64_t v11 = "lstat %s";
    __int16 v12 = 204;
LABEL_8:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"aaHeaderInitWithPath",  v12,  101,  v10,  v11,  v8,  v9,  (char)v76);
    *(_DWORD *)a1 = 0;
    *((void *)a1 + 2) = 0LL;
    uint64_t result = 0xFFFFFFFFLL;
    *((void *)a1 + 5) = 0LL;
    return result;
  }

  unsigned int v14 = aaEntryTypeFromMode(v79.st_mode);
  if (!v14)
  {
    uint64_t v76 = v83;
    uint64_t v11 = "could not determine entry type: %s";
    __int16 v12 = 210;
    goto LABEL_7;
  }

  v15.iint key = 5265748;
  if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v15, v14) < 0)
  {
    uint64_t v76 = v83;
    uint64_t v11 = "inserting TYP: %s";
    __int16 v12 = 211;
    goto LABEL_7;
  }

  size_t v16 = strlen(a4);
  v17.iint key = 5521744;
  if (AAHeaderSetFieldString(a1, 0xFFFFFFFF, v17, a4, v16) < 0)
  {
    uint64_t v76 = v83;
    uint64_t v11 = "inserting PAT: %s";
    __int16 v12 = 217;
    goto LABEL_7;
  }

  int v18 = v79.st_mode & 0xF000;
  if (v18 == 40960)
  {
    ssize_t v19 = readlink(v83, value, 0x3FFuLL);
    if (v19 < 0)
    {
      int v10 = *__error();
      uint64_t v76 = v83;
      uint64_t v11 = "readlink: %s";
      __int16 v12 = 225;
      goto LABEL_8;
    }

    value[v19] = 0;
    v20.iint key = 4935244;
    if (AAHeaderSetFieldString(a1, 0xFFFFFFFF, v20, value, v19) < 0)
    {
      uint64_t v76 = v83;
      uint64_t v11 = "inserting LNK: %s";
      __int16 v12 = 227;
      goto LABEL_7;
    }

    int v18 = v79.st_mode & 0xF000;
  }

  if ((v18 | 0x4000) == 0x6000)
  {
    v21.iint key = 5653828;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v21, v79.st_rdev) < 0)
    {
      uint64_t v76 = v83;
      uint64_t v11 = "inserting DEV: %s";
      __int16 v12 = 233;
      goto LABEL_7;
    }
  }

  v22.iint key = 4475221;
  if (AAFieldKeySetContainsKey(a2, v22))
  {
    v23.iint key = 4475221;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v23, v79.st_uid) < 0)
    {
      uint64_t v76 = v83;
      uint64_t v11 = "inserting UID: %s";
      __int16 v12 = 239;
      goto LABEL_7;
    }
  }

  v24.iint key = 4475207;
  if (AAFieldKeySetContainsKey(a2, v24))
  {
    v25.iint key = 4475207;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v25, v79.st_gid) < 0)
    {
      uint64_t v76 = v83;
      uint64_t v11 = "inserting GID: %s";
      __int16 v12 = 245;
      goto LABEL_7;
    }
  }

  v26.iint key = 4476749;
  if (AAFieldKeySetContainsKey(a2, v26))
  {
    v27.iint key = 4476749;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v27, v79.st_mode & 0xFFF) < 0)
    {
      uint64_t v76 = v83;
      uint64_t v11 = "inserting MOD: %s";
      __int16 v12 = 251;
      goto LABEL_7;
    }
  }

  v28.iint key = 4672582;
  if (AAFieldKeySetContainsKey(a2, v28))
  {
    v29.iint key = 4672582;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v29, v79.st_flags) < 0)
    {
      uint64_t v76 = v83;
      uint64_t v11 = "inserting FLG: %s";
      __int16 v12 = 259;
      goto LABEL_7;
    }
  }

  v30.iint key = 5067843;
  if (AAFieldKeySetContainsKey(a2, v30) || (v31.iint key = 5067842, AAFieldKeySetContainsKey(a2, v31)))
  {
    v78[1] = 0LL;
    v78[2] = 0LL;
    __int128 v81 = 0u;
    memset(value, 0, sizeof(value));
    v78[0] = 0x220000000005LL;
    if (!getattrlist(v83, v78, value, 0x40uLL, 1u) && *(_DWORD *)value == 36)
    {
      timespec v77 = *(timespec *)&value[4];
      v32.iint key = 5067843;
      if (AAFieldKeySetContainsKey(a2, v32))
      {
        if (v77.tv_sec)
        {
          v33.iint key = 5067843;
          if (AAHeaderSetFieldTimespec(a1, 0xFFFFFFFF, v33, &v77) < 0)
          {
            uint64_t v76 = v83;
            uint64_t v11 = "inserting CTM: %s";
            __int16 v12 = 277;
            goto LABEL_7;
          }
        }
      }

      timespec v77 = *(timespec *)&value[20];
      v34.iint key = 5067842;
      if (AAFieldKeySetContainsKey(a2, v34))
      {
        if (v77.tv_sec)
        {
          v35.iint key = 5067842;
          if (AAHeaderSetFieldTimespec(a1, 0xFFFFFFFF, v35, &v77) < 0)
          {
            uint64_t v76 = v83;
            uint64_t v11 = "inserting BTM: %s";
            __int16 v12 = 283;
            goto LABEL_7;
          }
        }
      }
    }
  }

  v36.iint key = 5067853;
  if (AAFieldKeySetContainsKey(a2, v36))
  {
    v37.iint key = 5067853;
    if (AAHeaderSetFieldTimespec(a1, 0xFFFFFFFF, v37, &v79.st_mtimespec) < 0)
    {
      uint64_t v76 = v83;
      uint64_t v11 = "inserting MTM: %s";
      __int16 v12 = 291;
      goto LABEL_7;
    }
  }

  if ((v79.st_mode & 0xF000) != 0x8000) {
    goto LABEL_46;
  }
  v38.iint key = 5523009;
  if (AAFieldKeySetContainsKey(a2, v38) <= 0)
  {
    v39.iint key = 5391937;
    if (AAFieldKeySetContainsKey(a2, v39) < 1) {
      goto LABEL_46;
    }
  }

  *(void *)uint64_t value = 0LL;
  LODWORD(v78[0]) = 0;
  LODWORD(v77.tv_sec) = 0;
  if ((ParallelCompressionAFSCGetMetadata(v83, (off_t *)value, (unsigned int *)v78, &v77) & 0x80000000) != 0)
  {
    uint64_t v11 = "querying AFSC metadata";
    __int16 v12 = 306;
    goto LABEL_7;
  }

  if (LODWORD(v78[0]) != -1)
  {
    v40.iint key = 5523009;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v40, SLODWORD(v78[0])) < 0)
    {
      uint64_t v76 = v83;
      uint64_t v11 = "inserting AFT: %s";
      __int16 v12 = 309;
      goto LABEL_7;
    }

    v41.iint key = 5391937;
    if (AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v41, LODWORD(v77.tv_sec)) < 0)
    {
      uint64_t v76 = v83;
      uint64_t v11 = "inserting AFR: %s";
      __int16 v12 = 310;
      goto LABEL_7;
    }
  }

uint64_t getFileDiskUsageBlocks2(char *a1, const char *a2, unsigned int a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  bzero(v7, 0x800uLL);
  uint64_t result = getFileDiskUsage(v7);
  if (result >= 0) {
    return (result + a3 - 1) & -(uint64_t)a3;
  }
  return result;
}

uint64_t aaHeaderAppendEntryAttributes(AAHeader header, char *a2, char *a3)
{
  char v6 = *a2;
  if ((*a2 & 1) != 0)
  {
    v7.iint key = 4475221;
    if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v7, *((unsigned int *)a2 + 1)) < 0)
    {
      AAFieldKey v22 = "append UID";
      __int16 v23 = 416;
      goto LABEL_44;
    }

    char v6 = *a2;
  }

  if ((v6 & 2) != 0)
  {
    v10.iint key = 4475207;
    if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v10, *((unsigned int *)a2 + 2)) < 0)
    {
      AAFieldKey v22 = "append GID";
      __int16 v23 = 417;
      goto LABEL_44;
    }

    char v6 = *a2;
  }

  if ((v6 & 8) != 0)
  {
    v11.iint key = 4476749;
    if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v11, *((unsigned int *)a2 + 4)) < 0)
    {
      AAFieldKey v22 = "append MOD";
      __int16 v23 = 418;
      goto LABEL_44;
    }

    char v6 = *a2;
  }

  if ((v6 & 4) != 0)
  {
    v12.iint key = 4672582;
    if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v12, *((unsigned int *)a2 + 3)) < 0)
    {
      AAFieldKey v22 = "append FLG";
      __int16 v23 = 419;
      goto LABEL_44;
    }

    char v6 = *a2;
  }

  if ((v6 & 0x40) != 0)
  {
    v13.iint key = 5067853;
    if (AAHeaderSetFieldTimespec(header, 0xFFFFFFFF, v13, (const timespec *)(a2 + 56)) < 0)
    {
      AAFieldKey v22 = "append MTM";
      __int16 v23 = 420;
      goto LABEL_44;
    }

    char v6 = *a2;
  }

  if ((v6 & 0x20) != 0)
  {
    v14.iint key = 5067843;
    if (AAHeaderSetFieldTimespec(header, 0xFFFFFFFF, v14, (const timespec *)(a2 + 40)) < 0)
    {
      AAFieldKey v22 = "append CTM";
      __int16 v23 = 421;
      goto LABEL_44;
    }

    char v6 = *a2;
  }

  if ((v6 & 0x10) != 0
    && (v15.iint key = 5067842, AAHeaderSetFieldTimespec(header, 0xFFFFFFFF, v15, (const timespec *)(a2 + 24)) < 0))
  {
    AAFieldKey v22 = "append BTM";
    __int16 v23 = 422;
  }

  else
  {
    char v16 = *a3;
    if ((*a3 & 1) != 0)
    {
      v17.iint key = 5523009;
      if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v17, *((int *)a3 + 2)) < 0)
      {
        AAFieldKey v22 = "append AFT";
        __int16 v23 = 423;
        goto LABEL_44;
      }

      char v16 = *a3;
    }

    if ((v16 & 2) != 0)
    {
      v18.iint key = 5391937;
      if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v18, *((unsigned int *)a3 + 3)) < 0)
      {
        AAFieldKey v22 = "append AFR";
        __int16 v23 = 424;
        goto LABEL_44;
      }

      char v16 = *a3;
    }

    if ((v16 & 4) != 0)
    {
      v19.iint key = 4803654;
      if (AAHeaderSetFieldUInt(header, 0xFFFFFFFF, v19, *((void *)a3 + 2)) < 0)
      {
        AAFieldKey v22 = "append FLI";
        __int16 v23 = 425;
        goto LABEL_44;
      }

      char v16 = *a3;
    }

    if ((v16 & 8) == 0) {
      return 0LL;
    }
    v20.iint key = 4411984;
    AAFieldKey v22 = "append PRC";
    __int16 v23 = 426;
  }

LABEL_44:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"aaHeaderAppendEntryAttributes",  v23,  101,  0,  v22,  v8,  v9,  v24);
  return 0xFFFFFFFFLL;
}

  if (fsetxattr(fd, "com.apple.ResourceFork", v15, v31, 0, 0) < 0)
  {
    AAFieldKey v43 = *__error();
    uint64_t v44 = "fsetxattr resource fork";
    AAFieldKey v45 = 420;
LABEL_53:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"storeChunkOffsets",  v45,  55,  v43,  v44,  v21,  v22,  v47);
    goto LABEL_54;
  }

  int v42 = 0LL;
LABEL_55:
  free(v15);
  memset_s(&v47, 0x18uLL, 0, 0x18uLL);
  return v42;
}

        if (v10 != v38) {
          break;
        }
        if (v35)
        {
          free(*v35);
          *AAFieldKey v35 = 0LL;
        }

        *(void *)(a1 + 360) += v10;
        AAFieldKey v41 = *(void (**)(void, float))(a1 + 128);
        if (v41)
        {
          int v42 = *(void *)(a1 + 72);
          if (v42)
          {
            do
            {
              AAFieldKey v43 = __ldxr(v36);
              uint64_t v44 = v43 + v10;
            }

            while (__stxr(v44, v36));
            v41(*(void *)(a1 + 112), (float)((float)v44 * 100.0) / (float)v42);
          }
        }

        if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 232))
          || (AAFieldKey v45 = *(_DWORD *)(a1 + 224), *(_DWORD *)(a1 + 224) = v45 + 1, !v45)
          && pthread_cond_broadcast((pthread_cond_t *)(a1 + 296))
          || pthread_mutex_unlock((pthread_mutex_t *)(a1 + 232)))
        {
          AAFieldKey v29 = "SemRelease";
          AAFieldKey v30 = 241;
          goto LABEL_28;
        }

        AAFieldKey v46 = 0LL;
        AAFieldKey v35 = *(void ***)(a1 + 344);
        while (v35[1] != *(void **)(a1 + 360))
        {
          ++v46;
          v35 += 3;
          if (v46 == *(void *)(a1 + 352))
          {
            AAFieldKey v27 = 0LL;
            goto LABEL_60;
          }
        }

        a4 = (char *)*v35;
        AAFieldKey v10 = (size_t)v35[2];
      }

      AAFieldKey v29 = "aaByteStreamWriteExpected";
      AAFieldKey v30 = 229;
    }

    else
    {
      AAFieldKey v29 = "data already written";
      AAFieldKey v30 = 178;
    }

uint64_t aaHeaderBlobArrayInitWithHeader(uint64_t a1, AAHeader_impl *a2)
{
  *(_DWORD *)a1 = 0;
  uint64_t v4 = *(unsigned int *)a2;
  if (v4 <= *(_DWORD *)(a1 + 4))
  {
    if (!(_DWORD)v4)
    {
      unsigned int v8 = 0;
LABEL_13:
      uint64_t result = 0LL;
      *(_DWORD *)a1 = v8;
      return result;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 4) = v4;
    uint64_t v5 = *(void **)(a1 + 8);
    char v6 = realloc(v5, 24 * v4);
    if (!v6)
    {
      free(v5);
      *(void *)(a1 + 8) = 0LL;
      AAFieldKey v12 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"aaHeaderBlobArrayInitWithHeader",  441,  101,  *v12,  "malloc",  v13,  v14,  v16);
      *(void *)a1 = 0LL;
      return 0xFFFFFFFFLL;
    }

    *(void *)(a1 + 8) = v6;
  }

  uint32_t v7 = 0;
  unsigned int v8 = 0;
  while (AAHeaderGetFieldType(a2, v7) != 5)
  {
LABEL_9:
    if ((_DWORD)v4 == ++v7) {
      goto LABEL_13;
    }
  }

  if ((AAHeaderGetFieldBlob(a2, v7, &size, &v16) & 0x80000000) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 8);
    *(AAFieldKey *)(v11 + 24LL * v8) = AAHeaderGetFieldKey(a2, v7);
    *(int64x2_t *)(*(void *)(a1 + 8) + 24LL * v8++ + 8) = vdupq_lane_s64(size, 0);
    goto LABEL_9;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"aaHeaderBlobArrayInitWithHeader",  448,  101,  0,  "get field blob failed",  v9,  v10,  v16);
  return 0xFFFFFFFFLL;
}

uint32_t AAHeaderGetFieldCount(AAHeader header)
{
  return *(_DWORD *)header;
}

int AAHeaderGetFieldType(AAHeader header, uint32_t i)
{
  if (*(_DWORD *)header > i) {
    return *(_DWORD *)(*((void *)header + 1) + 48LL * i + 4);
  }
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldType",  580,  101,  0,  "invalid field index %u",  v2,  v3,  i);
  return -1;
}

int AAHeaderGetFieldBlob(AAHeader header, uint32_t i, uint64_t *size, uint64_t *offset)
{
  if (*(_DWORD *)header <= i)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldBlob",  658,  101,  0,  "invalid field index %u",  v4,  v5,  i);
  }

  else
  {
    uint64_t v6 = *((void *)header + 1);
    if (*(_DWORD *)(v6 + 48LL * i + 4) == 5)
    {
      int result = 0;
      uint64_t v8 = v6 + 48LL * i;
      *uint64_t size = *(void *)(v8 + 32);
      *uint64_t offset = *(void *)(v8 + 24);
      return result;
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldBlob",  660,  101,  0,  "invalid type %d, expected BLOB",  v4,  v5,  *(_DWORD *)(v6 + 48LL * i + 4));
  }

  return -1;
}

AAFieldKey AAHeaderGetFieldKey(AAHeader header, uint32_t i)
{
  if (*(_DWORD *)header <= i)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldKey",  586,  101,  0,  "invalid field index %u",  v2,  v3,  i);
    return (AAFieldKey)0;
  }

  else
  {
    return *(AAFieldKey *)(*((void *)header + 1) + 48LL * i);
  }

uint64_t aaHeaderBlobArrayPayloadSize(unsigned int *a1)
{
  uint64_t v1 = *a1;
  if (!(_DWORD)v1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v4 = (uint64_t *)(*((void *)a1 + 1) + 8LL);
  do
  {
    uint64_t v5 = *v4;
    v4 += 3;
    result += v5;
    --v1;
  }

  while (v1);
  return result;
}

AAHeader AAHeaderCreate(void)
{
  v0 = (AAHeader_impl *)malloc(0x30uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    memset_s(v0, 0x30uLL, 0, 0x30uLL);
    if ((init_blob_with_magic((uint64_t)v1) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderCreate",  473,  101,  0,  "init_blob_with_magic",  v2,  v3,  v8);
      AAHeaderDestroy(v1);
      return 0LL;
    }
  }

  else
  {
    uint64_t v4 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderCreate",  470,  101,  *v4,  "malloc",  v5,  v6,  v8);
  }

  return v1;
}

void AAHeaderDestroy(AAHeader header)
{
  if (header)
  {
    free(*((void **)header + 1));
    free(*((void **)header + 4));
    memset_s((char *)header + 16, 0x18uLL, 0, 0x18uLL);
    free(header);
  }

AAHeader AAHeaderClone(AAHeader header)
{
  uint64_t v2 = (AAHeader_impl *)malloc(0x30uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    memset_s(v2, 0x30uLL, 0, 0x30uLL);
    if (AAHeaderAssign(v3, header) < 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderClone",  495,  101,  0,  "header copy",  v4,  v5,  v10);
      AAHeaderDestroy(v3);
      return 0LL;
    }
  }

  else
  {
    uint64_t v6 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderClone",  492,  101,  *v6,  "malloc",  v7,  v8,  v10);
  }

  return v3;
}

int AAHeaderAssign(AAHeader header, AAHeader from_header)
{
  if ((realloc_fields((uint64_t)header, *(_DWORD *)from_header) & 0x80000000) != 0)
  {
    AAFieldKey v12 = "realloc_fields";
    __int16 v13 = 507;
  }

  else
  {
    memcpy(*((void **)header + 1), *((const void **)from_header + 1), 48LL * *(unsigned int *)from_header);
    *(_DWORD *)header = *(_DWORD *)from_header;
    *((void *)header + 2) = 0LL;
    uint64_t v6 = (unint64_t *)((char *)header + 16);
    size_t v7 = *((void *)from_header + 2);
    if ((v7 & 0x8000000000000000LL) == 0)
    {
      uint64_t v8 = (const void *)*((void *)from_header + 4);
      size_t v9 = *((void *)header + 3);
      if (v9 >= v7)
      {
LABEL_16:
        uint64_t v16 = *((void *)header + 4);
        if (v8)
        {
          memcpy((void *)(v16 + *v6), v8, v7);
        }

        else if (v16)
        {
          memset_s((void *)(v16 + *v6), v7, 0, v7);
        }

        unint64_t v17 = *v6 + v7;
        *uint64_t v6 = v17;
        if (v17 > 3)
        {
          int result = 0;
          **((_DWORD **)header + 4) = 825246017;
          *((void *)header + 5) = *((void *)from_header + 5);
          return result;
        }
      }

      else
      {
        do
        {
          while (!v9)
          {
            size_t v9 = 0x4000LL;
            if (v7 <= 0x4000)
            {
              uint64_t v11 = (void **)((char *)header + 32);
              size_t v9 = 0x4000LL;
              goto LABEL_14;
            }
          }

          size_t v10 = v9 >> 1;
          if ((v9 & (v9 >> 1)) != 0) {
            size_t v10 = v9 & (v9 >> 1);
          }
          v9 += v10;
        }

        while (v9 < v7);
        uint64_t v11 = (void **)((char *)header + 32);
        if (v9 >= 0x2000000001LL)
        {
          *__error() = 12;
          goto LABEL_23;
        }

AAHeader AAHeaderCreateWithEncodedData(size_t data_size, const uint8_t *data)
{
  AAHeader v4 = AAHeaderCreate();
  uint64_t v5 = v4;
  if (v4 && (aaHeaderInitWithEncodedData((uint64_t)v4, (unsigned __int16 *)data, data_size) & 0x80000000) != 0)
  {
    AAHeaderDestroy(v5);
    return 0LL;
  }

  return v5;
}

AAHeader AAHeaderCreateWithPath(AAFieldKeySet key_set, const char *dir, const char *path, AAFlagSet flags)
{
  size_t v7 = AAHeaderCreate();
  uint64_t v8 = v7;
  if (v7 && (aaHeaderInitWithPath(v7, key_set, (char *)dir, path) & 0x80000000) != 0)
  {
    AAHeaderDestroy(v8);
    return 0LL;
  }

  return v8;
}

int AAHeaderRemoveField(AAHeader header, uint32_t i)
{
  if ((update_field_sizes((uint64_t)header, i, 0, 0LL, v2, v3, v4, v5) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderRemoveField",  546,  101,  0,  "update_field_sizes failed",  v8,  v9,  v12);
    return -1;
  }

  else
  {
    int v10 = *(_DWORD *)header;
    if (*(_DWORD *)header + ~i)
    {
      memmove( (void *)(*((void *)header + 1) + 48LL * i),  (const void *)(*((void *)header + 1) + 48LL * (i + 1)),  48LL * (*(_DWORD *)header + ~i));
      int v10 = *(_DWORD *)header;
    }

    int result = 0;
    *(_DWORD *)header = v10 - 1;
  }

  return result;
}

uint64_t update_field_sizes( uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)a1 <= a2)
  {
    AAFieldKey v20 = "invalid field index";
    __int16 v21 = 74;
    goto LABEL_5;
  }

  unsigned int v9 = a2;
  char v12 = (unint64_t *)(a1 + 16);
  unint64_t v11 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = v13 + 48LL * a2;
  unsigned int v17 = *(_DWORD *)(v14 + 16);
  uint64_t v16 = (unsigned int *)(v14 + 16);
  uint64_t v15 = v17;
  unint64_t v18 = *(v16 - 1) + (unint64_t)v17;
  size_t v19 = v11 - v18;
  if (v11 < v18)
  {
LABEL_3:
    AAFieldKey v20 = "realloc blob";
    __int16 v21 = 78;
LABEL_5:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"update_field_sizes",  v21,  101,  0,  v20,  a7,  a8,  (char)v41);
    return 0xFFFFFFFFLL;
  }

  if (v15 >= a3)
  {
    uint64_t v29 = v15 - a3;
    if (v11 != v18)
    {
      memmove((void *)(*(void *)(a1 + 32) + v18 - v29), (const void *)(*(void *)(a1 + 32) + v18), v19);
      unint64_t v18 = *(void *)(a1 + 16);
    }

    unint64_t v11 = v18 - v29;
  }

  else
  {
    uint64_t v24 = a3 - v15;
    unint64_t v25 = v11 + v24;
    size_t v26 = *(void *)(a1 + 24);
    if (v26 < v25)
    {
      do
      {
        while (!v26)
        {
          size_t v26 = 0x4000LL;
          if (v25 <= 0x4000)
          {
            uint64_t v43 = v24;
            size_t v44 = v11 - v18;
            AAFieldKey v28 = (void **)(a1 + 32);
            size_t v26 = 0x4000LL;
            goto LABEL_23;
          }
        }

        size_t v27 = v26 >> 1;
        if ((v26 & (v26 >> 1)) != 0) {
          size_t v27 = v26 & (v26 >> 1);
        }
        v26 += v27;
      }

      while (v26 < v25);
      AAFieldKey v28 = (void **)(a1 + 32);
      if (v26 >= 0x2000000001LL)
      {
        AAFieldKey v30 = (void **)(a1 + 32);
        *__error() = 12;
        goto LABEL_36;
      }

      uint64_t v43 = v24;
      size_t v44 = v11 - v18;
LABEL_23:
      AAFieldKey v41 = v28;
      int v42 = *v28;
      AAFieldKey v31 = realloc(*v28, v26);
      if (v31)
      {
        *(void *)(a1 + 24) = v26;
        *(void *)(a1 + 32) = v31;
        uint64_t v24 = v43;
        size_t v19 = v44;
        goto LABEL_25;
      }

      AAFieldKey v30 = v41;
      free(v42);
LABEL_36:
      *AAFieldKey v30 = 0LL;
      *char v12 = 0LL;
      v12[1] = 0LL;
      goto LABEL_3;
    }

int AAHeaderClear(AAHeader header)
{
  *(_DWORD *)header = 0;
  *((void *)header + 5) = 0LL;
  return 0;
}

int AAHeaderGetKeyIndex(AAHeader header, AAFieldKey key)
{
  uint64_t v2 = *(unsigned int *)header;
  if ((_DWORD)v2)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = (int *)*((void *)header + 1);
    while (1)
    {
      int v6 = *v5;
      v5 += 12;
      if (((v6 ^ key.ikey) & 0xFFFFFF) == 0) {
        break;
      }
      if (v2 == ++v4) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    LODWORD(v4) = -1;
  }

  return v4;
}

int AAHeaderGetFieldUInt(AAHeader header, uint32_t i, uint64_t *value)
{
  if (*(_DWORD *)header <= i)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldUInt",  592,  101,  0,  "invalid field index %u",  v3,  v4,  i);
  }

  else
  {
    uint64_t v5 = *((void *)header + 1);
    if (*(_DWORD *)(v5 + 48LL * i + 4) == 1)
    {
      int result = 0;
      *uint64_t value = *(void *)(v5 + 48LL * i + 40);
      return result;
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldUInt",  594,  101,  0,  "invalid type %d, expected UINT",  v3,  v4,  *(_DWORD *)(v5 + 48LL * i + 4));
  }

  return -1;
}

int AAHeaderGetFieldString(AAHeader header, uint32_t i, size_t capacity, char *value, size_t *length)
{
  if (*(_DWORD *)header <= i)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldString",  602,  101,  0,  "invalid field index %u",  v5,  v6,  i);
    return -1;
  }

  uint64_t v7 = *((void *)header + 1);
  if (*(_DWORD *)(v7 + 48LL * i + 4) != 2)
  {
    int v14 = *(_DWORD *)(v7 + 48LL * i + 4);
    unint64_t v11 = "invalid type %d, expected STRING";
    __int16 v12 = 604;
    goto LABEL_11;
  }

  size_t v9 = *(unsigned int *)(v7 + 48LL * i + 40);
  if (length) {
    *size_t length = v9;
  }
  if (!capacity) {
    return 0;
  }
  if (v9 >= capacity) {
    return -1;
  }
  uint64_t v10 = (*(_DWORD *)(v7 + 48LL * i + 12) + 6);
  if (v9 + v10 > *((void *)header + 2))
  {
    unint64_t v11 = "invalid blob segment";
    __int16 v12 = 612;
LABEL_11:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldString",  v12,  101,  0,  v11,  v5,  v6,  v14);
    return -1;
  }

  memcpy(value, (const void *)(*((void *)header + 4) + v10), v9);
  int result = 0;
  value[v9] = 0;
  return result;
}

int AAHeaderGetFieldHash( AAHeader header, uint32_t i, size_t capacity, AAHashFunction *hash_function, uint8_t *value)
{
  if (*(_DWORD *)header <= i)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldHash",  622,  101,  0,  "invalid field index %u",  v5,  v6,  i);
    return -1;
  }

  uint64_t v7 = *((void *)header + 1);
  if (*(_DWORD *)(v7 + 48LL * i + 4) != 3)
  {
    int v19 = *(_DWORD *)(v7 + 48LL * i + 4);
    unint64_t v11 = "invalid type %d, expected HASH";
    __int16 v12 = 624;
    goto LABEL_7;
  }

  size_t v10 = *(unsigned int *)(v7 + 48LL * i + 40);
  if (v10 > capacity)
  {
    unint64_t v11 = "not enough capacity to store HASH";
    __int16 v12 = 627;
LABEL_7:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldHash",  v12,  101,  0,  v11,  v5,  v6,  v19);
    return -1;
  }

  uint64_t v14 = (*(_DWORD *)(v7 + 48LL * i + 12) + 4);
  if (v10 + v14 > *((void *)header + 2))
  {
    unint64_t v11 = "invalid blob segment";
    __int16 v12 = 628;
    goto LABEL_7;
  }

  memcpy(value, (const void *)(*((void *)header + 4) + v14), v10);
  int result = 0;
  if (hash_function)
  {
    int v16 = *(_DWORD *)(v7 + 48LL * i + 8);
    unsigned int v17 = v16 - 70;
    AAHashFunction v18 = v16 - 69;
    if (v17 >= 5) {
      AAHashFunction v18 = -1;
    }
    *AAHashFunction hash_function = v18;
  }

  return result;
}

int AAHeaderGetFieldTimespec(AAHeader header, uint32_t i, timespec *value)
{
  if (*(_DWORD *)header > i)
  {
    uint64_t v5 = *((void *)header + 1);
    if (*(_DWORD *)(v5 + 48LL * i + 4) == 4)
    {
      int v6 = *(_DWORD *)(v5 + 48LL * i + 8);
      if (v6 == 84)
      {
        int v11 = *(_DWORD *)(v5 + 48LL * i + 12);
        uint64_t v12 = (v11 + 4);
        unint64_t v13 = *((void *)header + 2);
        uint64_t v14 = (v11 + 12);
        if (v12 + 8 > v13 || v14 + 4 > v13)
        {
          uint64_t v8 = "invalid blob segment";
          __int16 v9 = 649;
          goto LABEL_9;
        }

        uint64_t v16 = *((void *)header + 4);
        __darwin_time_t v17 = *(void *)(v16 + v12);
        uint64_t v18 = *(unsigned int *)(v16 + v14);
      }

      else if (v6 == 83)
      {
        uint64_t v7 = (*(_DWORD *)(v5 + 48LL * i + 12) + 4);
        if ((unint64_t)(v7 + 8) > *((void *)header + 2))
        {
          uint64_t v8 = "invalid blob segment";
          __int16 v9 = 643;
LABEL_9:
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldTimespec",  v9,  101,  0,  v8,  v3,  v4,  v19);
          return -1;
        }

        uint64_t v18 = 0LL;
        __darwin_time_t v17 = *(void *)(*((void *)header + 4) + v7);
      }

      else
      {
        __darwin_time_t v17 = 0LL;
        uint64_t v18 = 0LL;
      }

      int result = 0;
      value->tv_seCC_SHA1_CTX c = v17;
      value->tv_nseCC_SHA1_CTX c = v18;
      return result;
    }

    int v19 = *(_DWORD *)(v5 + 48LL * i + 4);
    uint64_t v8 = "invalid type %d, expected TIMESPEC";
    __int16 v9 = 637;
    goto LABEL_9;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderGetFieldTimespec",  635,  101,  0,  "invalid field index %u",  v3,  v4,  i);
  return -1;
}

int AAHeaderSetFieldFlag(AAHeader header, uint32_t i, AAFieldKey key)
{
  uint64_t v10 = MEMORY[0x1895F8770];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_19;
    }
  }

  else if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_19;
  }

  unsigned int v11 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v11, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_19:
    uint64_t v18 = "invalid key";
    __int16 v19 = 669;
    goto LABEL_20;
  }

  if ((*(_DWORD *)(v10 + 4LL * v11 + 60) & 0x500) == 0) {
    goto LABEL_19;
  }
LABEL_9:
  unsigned int v12 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v13 = __maskrune(v12, 0x500uLL);
  }
  else {
    int v13 = *(_DWORD *)(v10 + 4LL * v12 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v13) {
    goto LABEL_19;
  }
  if (i == -1) {
    int i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, 4u, 0LL, v3, v4, v5, v6) & 0x80000000) != 0)
  {
    uint64_t v18 = "update_field_sizes failed";
    __int16 v19 = 673;
  }

  else
  {
    uint64_t v14 = *((void *)header + 1) + 48LL * i;
    *(AAFieldKey *)uint64_t v14 = key;
    *(void *)(v14 + 4) = 0x2A00000000LL;
    *(void *)(v14 + 40) = 0LL;
    __srCC_SHA1_CTX c = key;
    __src.skey[3] = 42;
    uint64_t v17 = v14 + 12;
    uint64_t v16 = *(unsigned int *)(v14 + 12);
    size_t v15 = *(unsigned int *)(v17 + 4);
    if (v16 + v15 <= *((void *)header + 2))
    {
      memcpy((void *)(*((void *)header + 4) + v16), &__src, v15);
      return 0;
    }

    uint64_t v18 = "invalid blob segment";
    __int16 v19 = 684;
  }

uint64_t append_field(unsigned int *a1)
{
  uint64_t v2 = *a1;
  if ((realloc_fields((uint64_t)a1, (int)v2 + 1) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"append_field",  46,  101,  0,  "realloc_fields failed",  v3,  v4,  v8);
    return 0xFFFFFFFFLL;
  }

  else
  {
    ++*a1;
    uint64_t v5 = *((void *)a1 + 1);
    if (v5) {
      memset_s((void *)(v5 + 48LL * v2), 0x30uLL, 0, 0x30uLL);
    }
    uint64_t v6 = v5 + 48LL * v2;
    *(_DWORD *)(v6 + 12) = *((void *)a1 + 2);
    *(void *)(v6 + 24) = *((void *)a1 + 5);
  }

  return v2;
}

int AAHeaderSetFieldUInt(AAHeader header, uint32_t i, AAFieldKey key, uint64_t value)
{
  uint64_t v12 = MEMORY[0x1895F8770];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_16;
    }
  }

  else if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_16;
  }

  unsigned int v13 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v13, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_16:
    uint64_t v18 = "invalid key";
    __int16 v19 = 691;
    goto LABEL_17;
  }

  if ((*(_DWORD *)(v12 + 4LL * v13 + 60) & 0x500) == 0) {
    goto LABEL_16;
  }
LABEL_9:
  unsigned int v14 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v15 = __maskrune(v14, 0x500uLL);
  }
  else {
    int v15 = *(_DWORD *)(v12 + 4LL * v14 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v15) {
    goto LABEL_16;
  }
  if (value >= 0x100)
  {
    if (value >= 0x10000)
    {
      if (HIDWORD(value)) {
        unsigned int v17 = 12;
      }
      else {
        unsigned int v17 = 8;
      }
      if (HIDWORD(value)) {
        int v16 = 56;
      }
      else {
        int v16 = 52;
      }
    }

    else
    {
      int v16 = 50;
      unsigned int v17 = 6;
    }
  }

  else
  {
    int v16 = 49;
    unsigned int v17 = 5;
  }

  if (i == -1) {
    int i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, v17, 0LL, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    uint64_t v18 = "update_field_sizes failed";
    __int16 v19 = 701;
  }

  else
  {
    uint64_t v21 = *((void *)header + 1) + 48LL * i;
    *(AAFieldKey *)uint64_t v21 = key;
    *(_DWORD *)(v21 + 4) = 1;
    *(_DWORD *)(v21 + 8) = v16;
    *(void *)(v21 + 40) = value;
    __srCC_SHA1_CTX c = key;
    __src.skey[3] = v16;
    uint64_t v27 = value;
    uint64_t v24 = v21 + 12;
    uint64_t v23 = *(unsigned int *)(v21 + 12);
    size_t v22 = *(unsigned int *)(v24 + 4);
    if (v23 + v22 <= *((void *)header + 2))
    {
      memcpy((void *)(*((void *)header + 4) + v23), &__src, v22);
      return 0;
    }

    uint64_t v18 = "invalid blob segment";
    __int16 v19 = 713;
  }

int AAHeaderSetFieldString(AAHeader header, uint32_t i, AAFieldKey key, const char *value, size_t length)
{
  uint64_t v13 = MEMORY[0x1895F8770];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_16;
    }
  }

  else if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_16;
  }

  unsigned int v14 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v14, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_16:
    unsigned int v17 = "invalid key";
    __int16 v18 = 720;
    goto LABEL_17;
  }

  if ((*(_DWORD *)(v13 + 4LL * v14 + 60) & 0x500) == 0) {
    goto LABEL_16;
  }
LABEL_9:
  unsigned int v15 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v16 = __maskrune(v15, 0x500uLL);
  }
  else {
    int v16 = *(_DWORD *)(v13 + 4LL * v15 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v16) {
    goto LABEL_16;
  }
  if (length >= 0x10000)
  {
    unsigned int v17 = "string too long";
    __int16 v18 = 721;
LABEL_17:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderSetFieldString",  v18,  101,  0,  v17,  v6,  v7,  v27);
    return -1;
  }

  if (i == -1) {
    int i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, (int)length + 6, 0LL, length, v5, v6, v7) & 0x80000000) != 0)
  {
    unsigned int v17 = "update_field_sizes failed";
    __int16 v18 = 725;
    goto LABEL_17;
  }

  uint64_t v20 = *((void *)header + 1) + 48LL * i;
  *(AAFieldKey *)uint64_t v20 = key;
  *(void *)(v20 + 4) = 0x5000000002LL;
  *(void *)(v20 + 40) = length;
  unsigned int v23 = *(_DWORD *)(v20 + 12);
  uint64_t v21 = (_DWORD *)(v20 + 12);
  uint64_t v22 = v23;
  if ((unint64_t)v23 + 6 > *((void *)header + 2)
    || (uint64_t v24 = *((void *)header + 4) + v22,
        *(_DWORD *)uint64_t v24 = key.ikey & 0xFFFFFF | 0x50000000,
        *(_WORD *)(v24 + 4) = length,
        uint64_t v25 = (*v21 + 6),
        v25 + length > *((void *)header + 2)))
  {
    unsigned int v17 = "invalid blob segment";
    __int16 v18 = 738;
    goto LABEL_17;
  }

  uint64_t v26 = *((void *)header + 4);
  if (value)
  {
    memcpy((void *)(v26 + v25), value, length);
  }

  else if (v26)
  {
    memset_s((void *)(v26 + v25), length, 0, length);
  }

  return 0;
}

int AAHeaderSetFieldHash( AAHeader header, uint32_t i, AAFieldKey key, AAHashFunction hash_function, const uint8_t *value)
{
  uint64_t v13 = MEMORY[0x1895F8770];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_21;
    }
  }

  else if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_21;
  }

  unsigned int v14 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v14, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_21:
    unsigned int v23 = "invalid key";
    __int16 v24 = 745;
    goto LABEL_22;
  }

  if ((*(_DWORD *)(v13 + 4LL * v14 + 60) & 0x500) == 0) {
    goto LABEL_21;
  }
LABEL_9:
  unsigned int v15 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v16 = __maskrune(v15, 0x500uLL);
  }
  else {
    int v16 = *(_DWORD *)(v13 + 4LL * v15 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v16) {
    goto LABEL_21;
  }
  if (hash_function - 1 >= 5)
  {
    int v25 = -1;
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderSetFieldHash",  748,  101,  0,  "invalid HASH subtype: %d",  v6,  v7,  -1);
    return v25;
  }

  size_t v17 = dword_1862D810C[hash_function - 1];
  if (i == -1) {
    int i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, (int)v17 + 4, 0LL, (uint64_t)value, v5, v6, v7) & 0x80000000) != 0)
  {
    unsigned int v23 = "update_field_sizes failed";
    __int16 v24 = 752;
    goto LABEL_22;
  }

  uint64_t v18 = *((void *)header + 1) + 48LL * i;
  *(AAFieldKey *)uint64_t v18 = key;
  *(_DWORD *)(v18 + 4) = 3;
  *(_DWORD *)(v18 + 8) = hash_function + 69;
  *(void *)(v18 + 40) = v17;
  unsigned int v21 = *(_DWORD *)(v18 + 12);
  __int16 v19 = (_DWORD *)(v18 + 12);
  uint64_t v20 = v21;
  if ((unint64_t)v21 + 4 > *((void *)header + 2)
    || (*(_DWORD *)(*((void *)header + 4) + v20) = key.ikey & 0xFFFFFF | ((hash_function + 69) << 24),
        uint64_t v22 = (*v19 + 4),
        v22 + v17 > *((void *)header + 2)))
  {
    unsigned int v23 = "invalid blob segment";
    __int16 v24 = 764;
LABEL_22:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAHeader.c",  (uint64_t)"AAHeaderSetFieldHash",  v24,  101,  0,  v23,  v6,  v7,  v28);
    return -1;
  }

  uint64_t v27 = *((void *)header + 4);
  if (value)
  {
    memcpy((void *)(v27 + v22), value, v17);
  }

  else if (v27)
  {
    memset_s((void *)(v27 + v22), v17, 0, v17);
  }

  return 0;
}

int AAHeaderSetFieldTimespec(AAHeader header, uint32_t i, AAFieldKey key, const timespec *value)
{
  uint64_t v12 = MEMORY[0x1895F8770];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_25;
    }
  }

  else if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_25;
  }

  unsigned int v13 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v13, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_25:
    unsigned int v23 = "invalid key";
    __int16 v24 = 771;
    goto LABEL_26;
  }

  if ((*(_DWORD *)(v12 + 4LL * v13 + 60) & 0x500) == 0) {
    goto LABEL_25;
  }
LABEL_9:
  unsigned int v14 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v15 = __maskrune(v14, 0x500uLL);
  }
  else {
    int v15 = *(_DWORD *)(v12 + 4LL * v14 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v15) {
    goto LABEL_25;
  }
  if (value->tv_nsec) {
    unsigned int v16 = 16;
  }
  else {
    unsigned int v16 = 12;
  }
  if (value->tv_nsec) {
    int v17 = 84;
  }
  else {
    int v17 = 83;
  }
  if (i == -1) {
    int i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, v16, 0LL, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    unsigned int v23 = "update_field_sizes failed";
    __int16 v24 = 779;
  }

  else
  {
    uint64_t v18 = *((void *)header + 1) + 48LL * i;
    *(AAFieldKey *)uint64_t v18 = key;
    *(_DWORD *)(v18 + 4) = 4;
    *(_DWORD *)(v18 + 8) = v17;
    *(void *)(v18 + 40) = 0LL;
    __srCC_SHA1_CTX c = key;
    __src.skey[3] = v17;
    tv_nseCC_SHA1_CTX c = value->tv_nsec;
    tv_seCC_SHA1_CTX c = value->tv_sec;
    int v29 = tv_nsec;
    uint64_t v22 = v18 + 12;
    uint64_t v21 = *(unsigned int *)(v18 + 12);
    size_t v20 = *(unsigned int *)(v22 + 4);
    if (v21 + v20 <= *((void *)header + 2))
    {
      memcpy((void *)(*((void *)header + 4) + v21), &__src, v20);
      return 0;
    }

    unsigned int v23 = "invalid blob segment";
    __int16 v24 = 792;
  }

int AAHeaderSetFieldBlob(AAHeader header, uint32_t i, AAFieldKey key, uint64_t size)
{
  uint64_t v12 = MEMORY[0x1895F8770];
  if (key.skey[0] < 0)
  {
    if (!__maskrune(key.skey[0], 0x500uLL)) {
      goto LABEL_31;
    }
  }

  else if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * key.skey[0] + 60) & 0x500) == 0)
  {
    goto LABEL_31;
  }

  unsigned int v13 = *(__int16 *)key.skey >> 8;
  if (((key.ikey << 16) & 0x80000000) != 0)
  {
    if (__maskrune(v13, 0x500uLL)) {
      goto LABEL_9;
    }
LABEL_31:
    __int16 v24 = "invalid key";
    __int16 v25 = 799;
    goto LABEL_32;
  }

  if ((*(_DWORD *)(v12 + 4LL * v13 + 60) & 0x500) == 0) {
    goto LABEL_31;
  }
LABEL_9:
  unsigned int v14 = (int)(key.ikey << 8) >> 24;
  if (((key.ikey << 8) & 0x80000000) != 0) {
    int v15 = __maskrune(v14, 0x500uLL);
  }
  else {
    int v15 = *(_DWORD *)(v12 + 4LL * v14 + 60) & 0x500;
  }
  if ((key.ikey & 0xFF000000) != 0 || !v15) {
    goto LABEL_31;
  }
  if (HIDWORD(size)) {
    int v16 = 12;
  }
  else {
    int v16 = 8;
  }
  if (HIDWORD(size)) {
    int v17 = 67;
  }
  else {
    int v17 = 66;
  }
  if (size >= 0x10000) {
    unsigned int v18 = v16;
  }
  else {
    unsigned int v18 = 6;
  }
  if (size >= 0x10000) {
    int v19 = v17;
  }
  else {
    int v19 = 65;
  }
  if (i == -1) {
    int i = append_field((unsigned int *)header);
  }
  if ((update_field_sizes((uint64_t)header, i, v18, size, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    __int16 v24 = "update_field_sizes failed";
    __int16 v25 = 808;
  }

  else
  {
    uint64_t v20 = *((void *)header + 1) + 48LL * i;
    *(AAFieldKey *)uint64_t v20 = key;
    *(_DWORD *)(v20 + 4) = 5;
    *(_DWORD *)(v20 + 8) = v19;
    *(void *)(v20 + 40) = 0LL;
    __srCC_SHA1_CTX c = key;
    __src.skey[3] = v19;
    uint64_t v29 = size;
    uint64_t v23 = v20 + 12;
    uint64_t v22 = *(unsigned int *)(v20 + 12);
    size_t v21 = *(unsigned int *)(v23 + 4);
    if (v22 + v21 <= *((void *)header + 2))
    {
      memcpy((void *)(*((void *)header + 4) + v22), &__src, v21);
      return 0;
    }

    __int16 v24 = "invalid blob segment";
    __int16 v25 = 820;
  }

uint64_t AAHeaderGetPayloadSize(AAHeader header)
{
  return *((void *)header + 5);
}

size_t AAHeaderGetEncodedSize(AAHeader header)
{
  return *((void *)header + 2);
}

const uint8_t *__cdecl AAHeaderGetEncodedData(AAHeader header)
{
  return (const uint8_t *)*((void *)header + 4);
}

uint64_t aaEntryXATBlobInitWithEncodedData( unint64_t *a1, char *__src, rsize_t __smax, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a1 = 0LL;
  a1[3] = 0LL;
  char v8 = a1 + 3;
  if (!__smax) {
    return 0LL;
  }
  char v12 = 0;
  unsigned int v13 = a1 + 4;
  char v14 = 1;
  while (2)
  {
    rsize_t v15 = 0LL;
    unint64_t v16 = 0LL;
    char v17 = v14;
    do
    {
      if (v15 + 4 > __smax) {
        goto LABEL_77;
      }
      uint64_t v18 = *(unsigned int *)&__src[v15];
      BOOL v19 = __CFADD__(v18, v15);
      rsize_t v20 = v18 + v15;
      if (v19 || v20 > __smax) {
        goto LABEL_77;
      }
      if ((v12 & 1) != 0)
      {
        unint64_t v21 = a1[2];
        unint64_t v22 = (*a1)++;
        *(void *)(v21 + 8 * v22) = v15;
      }

      ++v16;
      rsize_t v15 = v20;
    }

    while (v20 < __smax);
    if (v20 != __smax) {
      goto LABEL_77;
    }
    if ((v17 & 1) == 0) {
      break;
    }
    if (v16 > 0xFFFFFFFE) {
      goto LABEL_77;
    }
    unint64_t v23 = a1[1];
    if (v23 < v16)
    {
      unint64_t v24 = a1[1];
      do
      {
        if (v24) {
          v24 *= 2LL;
        }
        else {
          unint64_t v24 = 16LL;
        }
      }

      while (v24 < v16);
      if (v24 > v23)
      {
        a1[1] = v24;
        if (8 * v24 >= 0x2000000001LL)
        {
          *__error() = 12;
        }

        else
        {
          __int16 v25 = (void *)a1[2];
          char v26 = realloc(v25, 8 * v24);
          if (v26)
          {
            a1[2] = (unint64_t)v26;
            goto LABEL_24;
          }

          free(v25);
        }

        a1[2] = 0LL;
LABEL_77:
        *a1 = 0LL;
        a1[3] = 0LL;
        AAFieldKey v46 = "invalid XAT blob";
        __int16 v47 = 72;
LABEL_78:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"aaEntryXATBlobInitWithEncodedData",  v47,  104,  0,  v46,  a7,  a8,  v48);
        *a1 = 0LL;
        a1[3] = 0LL;
        return 0xFFFFFFFFLL;
      }
    }

LABEL_50:
    AAFieldKey v35 = (void *)a1[5];
    uint64_t v36 = realloc(v35, v33);
    if (v36)
    {
      a1[4] = v33;
      a1[5] = (unint64_t)v36;
      goto LABEL_52;
    }

    free(v35);
LABEL_76:
    rsize_t *v13 = 0LL;
    v13[1] = 0LL;
    goto LABEL_77;
  }

    AAFieldKey v35 = (void *)a1[5];
    uint64_t v36 = realloc(v35, v33);
    if (v36)
    {
      a1[4] = v33;
      a1[5] = v36;
      goto LABEL_52;
    }

    free(v35);
LABEL_80:
    rsize_t *v13 = 0LL;
    v13[1] = 0LL;
    goto LABEL_81;
  }

      if (v37)
      {
LABEL_51:
        if (acl_create_entry(&acl_p, &entry_p))
        {
          uint64_t v41 = *__error();
          int v42 = "acl_create_entry";
          uint64_t v43 = 489;
          goto LABEL_78;
        }

        if (acl_set_tag_type(entry_p, v33))
        {
          uint64_t v41 = *__error();
          int v42 = "acl_set_tag_type";
          uint64_t v43 = 490;
          goto LABEL_78;
        }

        if (acl_set_permset_mask_np(entry_p, *(void *)((char *)v30 + 13)))
        {
          uint64_t v41 = *__error();
          int v42 = "acl_set_permset_mask_np";
          uint64_t v43 = 491;
          goto LABEL_78;
        }

        if (acl_get_flagset_np(entry_p, &flagset_p))
        {
          uint64_t v41 = *__error();
          int v42 = "acl_get_flagset_np";
          uint64_t v43 = 492;
          goto LABEL_78;
        }

        if (acl_add_flag_np(flagset_p, *(acl_flag_t *)((char *)v30 + 5)))
        {
          uint64_t v41 = *__error();
          int v42 = "acl_add_flag_np";
          uint64_t v43 = 493;
          goto LABEL_78;
        }

        if (acl_set_qualifier(entry_p, uu))
        {
          uint64_t v41 = *__error();
          int v42 = "acl_set_qualifier";
          uint64_t v43 = 494;
          goto LABEL_78;
        }

        rsize_t v28 = *a1;
        goto LABEL_58;
      }

uint64_t aaEntryXATBlobInitWithPath(AAEntryXATBlob_impl *a1, char *__s, const char *a3)
{
  char v3 = (char)__s;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ((concatPath(v16, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"aaEntryXATBlobInitWithPath",  99,  104,  0,  "invalid path %s/%s",  v5,  v6,  v3);
    return 0xFFFFFFFFLL;
  }

  int v7 = open(v16, 0x200000);
  if (v7 < 0)
  {
    int v12 = *__error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"aaEntryXATBlobInitWithPath",  110,  104,  v12,  "open: %s",  v13,  v14,  (char)v16);
    return 0xFFFFFFFFLL;
  }

  int v8 = v7;
  if ((aaEntryXATBlobInitWithFD(a1, v7) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"aaEntryXATBlobInitWithPath",  112,  104,  0,  "aaEntryXATBlobInitWithFD failed: %s",  v9,  v10,  (char)v16);
    uint64_t v11 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  close(v8);
  return v11;
}

uint64_t aaEntryXATBlobInitWithFD(AAEntryXATBlob_impl *a1, int fd)
{
  *(void *)a1 = 0LL;
  *((void *)a1 + 3) = 0LL;
  ssize_t v4 = flistxattr(fd, 0LL, 0LL, 0);
  if (v4 < 1)
  {
    uint64_t v6 = 0LL;
    int v7 = 0LL;
LABEL_5:
    free(v6);
    free(v7);
    return 0LL;
  }

  size_t v5 = v4;
  if ((unint64_t)v4 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_27:
    unint64_t v21 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"aaEntryXATBlobInitWithFD",  144,  104,  *v21,  "malloc",  v22,  v23,  v35);
    uint64_t v6 = 0LL;
    int v7 = 0LL;
    goto LABEL_28;
  }

  uint64_t v9 = (char *)malloc(v4);
  if (!v9) {
    goto LABEL_27;
  }
  int v7 = v9;
  ssize_t v10 = flistxattr(fd, v9, v5, 0);
  if (v10 < 1)
  {
    int v24 = *__error();
    rsize_t v27 = "listxattr";
    __int16 v28 = 153;
    goto LABEL_30;
  }

  uint64_t v11 = 0LL;
  uint64_t v6 = 0LL;
  size_t v12 = 0LL;
  uint64_t v13 = v7;
  ssize_t v36 = v10;
  while (v7[v11])
  {
    ++v11;
LABEL_25:
    if (v11 == v10) {
      goto LABEL_5;
    }
  }

  unint64_t v14 = fgetxattr(fd, v13, 0LL, 0LL, 0, 0);
  if ((v14 & 0x8000000000000000LL) != 0)
  {
    int v29 = *__error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"aaEntryXATBlobInitWithFD",  167,  104,  v29,  "getxattr failed for name=%s",  v30,  v31,  (char)v13);
    goto LABEL_28;
  }

  unsigned int v17 = v14;
  if (v14 >= 0xFFFFFFFF)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"aaEntryXATBlobInitWithFD",  169,  104,  0,  "attribute data is too large name=%s",  v15,  v16,  (char)v13);
    goto LABEL_28;
  }

  if (v14 <= v12)
  {
    uint64_t v18 = v6;
    goto LABEL_22;
  }

  do
  {
    if (v12) {
      v12 += v12 >> 1;
    }
    else {
      size_t v12 = 256LL;
    }
  }

  while (v14 > v12);
  if (v12 < 0x2000000001LL)
  {
    uint64_t v18 = (uint8_t *)realloc(v6, v12);
    if (!v18)
    {
      free(v6);
      goto LABEL_37;
    }

int AAEntryXATBlobAppendEntry(AAEntryXATBlob xat, const char *key, const uint8_t *data, size_t data_size)
{
  size_t v8 = strlen(key);
  size_t v11 = v8 + 1;
  size_t v12 = v8 + 5;
  if (v8 + 1 >= 0xFFFFFFFFFFFFFFFCLL || (rsize_t v15 = data_size + v12, __CFADD__(data_size, v12)) || v15 >= 0xFFFFFFFF)
  {
    uint64_t v13 = "invalid attribute size";
    __int16 v14 = 377;
LABEL_49:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"AAEntryXATBlobAppendEntry",  v14,  104,  0,  v13,  v9,  v10,  (char)v43);
    return -1;
  }

  uint64_t v16 = (void *)((char *)xat + 24);
  unint64_t v17 = *((void *)xat + 3);
  unint64_t v18 = v17 + v15;
  if (__CFADD__(v17, v15)) {
    goto LABEL_48;
  }
  uint64_t v20 = *(void *)xat;
  unint64_t v19 = *((void *)xat + 1);
  unint64_t v21 = *(void *)xat + 1LL;
  if (v19 < v21)
  {
    unint64_t v22 = *((void *)xat + 1);
    do
    {
      if (v22) {
        v22 *= 2LL;
      }
      else {
        unint64_t v22 = 16LL;
      }
    }

    while (v22 < v21);
    if (v22 > v19)
    {
      int v24 = (void *)((char *)xat + 16);
      uint64_t v23 = (void **)*((void *)xat + 2);
      *((void *)xat + 1) = v22;
      if (8 * v22 >= 0x2000000001LL)
      {
        *__error() = 12;
LABEL_47:
        *(void *)xat = 0LL;
        *int v24 = 0LL;
        *((void *)xat + 3) = 0LL;
        goto LABEL_48;
      }

      uint64_t v43 = v23;
      uint64_t v44 = v20;
      uint64_t v25 = realloc(v23, 8 * v22);
      if (!v25)
      {
        free(v43);
        goto LABEL_47;
      }

      *int v24 = v25;
      uint64_t v20 = v44;
    }
  }

  if ((v18 & 0x8000000000000000LL) != 0) {
    goto LABEL_43;
  }
  size_t v26 = *((void *)xat + 4);
  if (v26 < v18)
  {
    do
    {
      while (!v26)
      {
        size_t v26 = 0x4000LL;
        if (v18 <= 0x4000)
        {
          size_t v26 = 0x4000LL;
          goto LABEL_29;
        }
      }

      size_t v27 = v26 >> 1;
      if ((v26 & (v26 >> 1)) != 0) {
        size_t v27 = v26 & (v26 >> 1);
      }
      v26 += v27;
    }

    while (v26 < v18);
    if (v26 >= 0x2000000001LL)
    {
      *__error() = 12;
      goto LABEL_42;
    }

uint64_t aaEntryXATBlobApplyToFD( void *a1, int fd, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a3 & 8) != 0)
  {
    unint64_t v11 = flistxattr(fd, 0LL, 0LL, 0);
    if ((v11 & 0x8000000000000000LL) != 0)
    {
      int v13 = *__error();
      uint64_t v16 = "listxattr";
      __int16 v17 = 28;
LABEL_40:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"clearXATFD",  v17,  104,  v13,  v16,  v14,  v15,  v43);
      unint64_t v18 = 0LL;
      goto LABEL_41;
    }

    size_t v12 = v11;
    if (v11)
    {
      if (v11 >= 0x2000000001LL)
      {
        *__error() = 12;
LABEL_39:
        int v13 = *__error();
        uint64_t v16 = "malloc";
        __int16 v17 = 34;
        goto LABEL_40;
      }

      size_t v32 = (char *)malloc(v11);
      if (!v32) {
        goto LABEL_39;
      }
      unint64_t v18 = v32;
      ssize_t v33 = flistxattr(fd, v32, v12, 0);
      if (v33 < 0)
      {
        int v38 = *__error();
        uint64_t v41 = "listxattr";
        __int16 v42 = 43;
        goto LABEL_47;
      }

      ssize_t v34 = v33;
      if (v33)
      {
        uint64_t v35 = 0LL;
        ssize_t v36 = v18;
        do
        {
          if (v18[v35])
          {
            ++v35;
          }

          else
          {
            if (fremovexattr(fd, v36, 0) < 0)
            {
              int v38 = *__error();
              char v43 = (char)v36;
              uint64_t v41 = "removexattr failed for name=%s";
              __int16 v42 = 57;
LABEL_47:
              pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"clearXATFD",  v42,  104,  v38,  v41,  v39,  v40,  v43);
LABEL_41:
              free(v18);
              uint64_t v30 = "clearing extended attributes";
              __int16 v31 = 212;
LABEL_42:
              int v37 = 0;
LABEL_43:
              pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"aaEntryXATBlobApplyToFD",  v31,  104,  v37,  v30,  a7,  a8,  v43);
              return 0xFFFFFFFFLL;
            }

            ssize_t v36 = &v18[++v35];
          }
        }

        while (v35 != v34);
      }
    }

    else
    {
      unint64_t v18 = 0LL;
    }

    free(v18);
  }

  if (*a1)
  {
    uint64_t v19 = 0LL;
    while (1)
    {
      uint64_t v20 = (_DWORD *)(a1[5] + *(void *)(a1[2] + 8 * v19));
      unsigned int v23 = *v20;
      unint64_t v21 = (const char *)(v20 + 1);
      uint64_t v22 = v23;
      if (v23 < 5)
      {
        LOBYTE(v24) = 0;
LABEL_28:
        char v43 = v24;
        uint64_t v30 = "invalid XAT entry key %zu";
        __int16 v31 = 225;
        goto LABEL_42;
      }

      uint64_t v24 = 0LL;
      uint64_t v25 = (const char *)(a1[5] + *(void *)(a1[2] + 8 * v19) + v22);
      while (v21[v24])
      {
        size_t v26 = &v21[++v24];
        if (&v21[v24] >= v25)
        {
          if (!v24) {
            goto LABEL_28;
          }
          goto LABEL_18;
        }
      }

      size_t v26 = &v21[v24];
      if (!v24) {
        goto LABEL_28;
      }
LABEL_18:
      if (v26 == v25) {
        goto LABEL_28;
      }
      size_t v27 = v25 == v26 + 1 ? 0LL : v26 + 1;
      if (fsetxattr(fd, v21, v27, v25 - (v26 + 1), 0, 0) < 0)
      {
        __int16 v28 = __error();
        if ((a3 & 1) == 0 || *v28 != 1) {
          break;
        }
      }
    }

    int v37 = *__error();
    uint64_t v30 = "setxattr";
    __int16 v31 = 238;
    goto LABEL_43;
  }

  return 0LL;
}

AAEntryXATBlob AAEntryXATBlobCreate(void)
{
  v0 = (AAEntryXATBlob_impl *)malloc(0x30uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    memset_s(v0, 0x30uLL, 0, 0x30uLL);
  }

  else
  {
    uint64_t v2 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"AAEntryXATBlobCreate",  251,  104,  *v2,  "malloc",  v3,  v4,  v6);
  }

  return v1;
}

void AAEntryXATBlobDestroy(AAEntryXATBlob xat)
{
  if (xat)
  {
    free(*((void **)xat + 2));
    free(*((void **)xat + 5));
    memset_s((char *)xat + 24, 0x18uLL, 0, 0x18uLL);
    memset_s(xat, 0x30uLL, 0, 0x30uLL);
    free(xat);
  }

AAEntryXATBlob AAEntryXATBlobCreateWithEncodedData(const uint8_t *data, size_t data_size)
{
  uint64_t v4 = (unint64_t *)AAEntryXATBlobCreate();
  uint64_t v10 = (AAEntryXATBlob_impl *)v4;
  if (v4 && (aaEntryXATBlobInitWithEncodedData(v4, (char *)data, data_size, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    AAEntryXATBlobDestroy(v10);
    return 0LL;
  }

  return v10;
}

AAEntryXATBlob AAEntryXATBlobCreateWithPath(const char *dir, const char *path, AAFlagSet flags)
{
  uint64_t v5 = AAEntryXATBlobCreate();
  uint64_t v6 = v5;
  if (v5 && (aaEntryXATBlobInitWithPath(v5, (char *)dir, path) & 0x80000000) != 0)
  {
    AAEntryXATBlobDestroy(v6);
    return 0LL;
  }

  return v6;
}

int AAEntryXATBlobClear(AAEntryXATBlob xat)
{
  *(void *)xat = 0LL;
  *((void *)xat + 3) = 0LL;
  return 0;
}

int AAEntryXATBlobApplyToPath(AAEntryXATBlob xat, const char *dir, const char *path, AAFlagSet flags)
{
  char v4 = flags;
  char v5 = (char)dir;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if ((concatPath(v23, 0x800uLL, (char *)dir, path) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"AAEntryXATBlobApplyToPath",  299,  104,  0,  "invalid path %s/%s",  v7,  v8,  v5);
    return -1;
  }

  int v9 = open(v23, 0x200000);
  if (v9 < 0)
  {
    int v19 = *__error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"AAEntryXATBlobApplyToPath",  304,  104,  v19,  "open: %s",  v20,  v21,  (char)v23);
    return -1;
  }

  int v15 = v9;
  if ((aaEntryXATBlobApplyToFD(xat, v9, v4, v10, v11, v12, v13, v14) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"AAEntryXATBlobApplyToPath",  306,  104,  0,  "applying XAT blob: %s",  v16,  v17,  (char)v23);
    int v18 = -1;
  }

  else
  {
    int v18 = 0;
  }

  close(v15);
  return v18;
}

uint32_t AAEntryXATBlobGetEntryCount(AAEntryXATBlob xat)
{
  return *(_DWORD *)xat;
}

int AAEntryXATBlobGetEntry( AAEntryXATBlob xat, uint32_t i, size_t key_capacity, char *key, size_t *key_length, size_t data_capacity, uint8_t *data, size_t *data_size)
{
  if (*(void *)xat <= (unint64_t)i)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"AAEntryXATBlobGetEntry",  328,  104,  0,  "invalid XAT index %u",  (uint64_t)data,  (uint64_t)data_size,  i);
    return -1;
  }

  uint64_t v8 = (unsigned int *)(*((void *)xat + 5) + *(void *)(*((void *)xat + 2) + 8LL * i));
  int v9 = v8 + 1;
  unint64_t v10 = *v8;
  size_t v14 = 0LL;
  while (v9[v14])
  {
  }

  if ((int)v10 - 5 - (int)v14 >= v10)
  {
LABEL_15:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"AAEntryXATBlobGetEntry",  338,  104,  0,  "invalid XAT blob",  (uint64_t)data,  (uint64_t)data_size,  v17);
    return -1;
  }

  size_t v15 = (v10 - 5 - v14);
  if (key_length) {
    *key_size_t length = v14;
  }
  if (data_size) {
    *data_uint64_t size = v15;
  }
  if (v14 >= key_capacity)
  {
    if (key_capacity) {
      return -1;
    }
  }

  else
  {
    memcpy(key, v9, v14);
    key[v14] = 0;
  }

  if (v15 > data_capacity)
  {
    if (!data_capacity) {
      return 0;
    }
    return -1;
  }

  memcpy(data, (char *)v8 + v10 - (v10 - 5 - v14), (v10 - 5 - v14));
  return 0;
}

int AAEntryXATBlobSetEntry( AAEntryXATBlob xat, uint32_t i, const char *key, const uint8_t *data, size_t data_size)
{
  if (*(void *)xat <= (unint64_t)i)
  {
    uint64_t v24 = "invalid XAT index";
    __int16 v25 = 401;
    goto LABEL_11;
  }

  size_t v12 = strlen(key);
  size_t v13 = v12 + 1;
  size_t v14 = v12 + 5;
  if (v12 + 1 >= 0xFFFFFFFFFFFFFFFCLL || (unint64_t v15 = data_size + v14, __CFADD__(data_size, v14)) || v15 >= 0xFFFFFFFF)
  {
    uint64_t v24 = "invalid attribute size";
    __int16 v25 = 409;
    goto LABEL_11;
  }

  unint64_t v16 = i;
  unint64_t v17 = *(void *)(*((void *)xat + 2) + 8LL * i);
  int v18 = (char *)*((void *)xat + 5);
  unint64_t v19 = *(unsigned int *)&v18[v17];
  unint64_t v20 = v17 + v19;
  if (__CFADD__(v17, v19)
    || (v21 = (unint64_t *)((char *)xat + 24), unint64_t v22 = *((void *)xat + 3), v23 = v22 - v20, v22 < v20))
  {
LABEL_8:
    uint64_t v24 = "alloc XAT entry";
    __int16 v25 = 412;
LABEL_11:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"AAEntryXATBlobSetEntry",  v25,  104,  0,  v24,  v5,  v6,  v48);
    return -1;
  }

  uint64_t v27 = v15 - v19;
  if (v15 > v19)
  {
    unint64_t v28 = v22 + v27;
    unint64_t v29 = *((void *)xat + 4);
    if (v29 < v28)
    {
      size_t v30 = 0x4000LL;
      do
      {
        while (!v29)
        {
          unint64_t v29 = 0x4000LL;
          if (v28 <= 0x4000) {
            goto LABEL_29;
          }
        }

        unint64_t v31 = v29 >> 1;
        if ((v29 & (v29 >> 1)) != 0) {
          unint64_t v31 = v29 & (v29 >> 1);
        }
        v29 += v31;
      }

      while (v29 < v28);
      size_t v30 = v29;
      if (v29 >= 0x2000000001LL)
      {
        *__error() = 12;
        goto LABEL_44;
      }

int AAEntryXATBlobRemoveEntry(AAEntryXATBlob xat, uint32_t i)
{
  uint64_t v4 = *(void *)xat;
  if (*(void *)xat <= (unint64_t)i
    || (unint64_t v6 = i,
        uint64_t v7 = *(void *)(*((void *)xat + 2) + 8LL * i),
        uint64_t v8 = *((void *)xat + 5),
        uint64_t v9 = *(unsigned int *)(v8 + v7),
        BOOL v10 = __CFADD__(v7, v9),
        unint64_t v11 = v7 + v9,
        v10)
    || (unint64_t v12 = *((void *)xat + 3), v12 < v11))
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldXAT.c",  (uint64_t)"AAEntryXATBlobRemoveEntry",  426,  104,  0,  "invalid XAT index %u",  v2,  v3,  i);
    return -1;
  }

  else
  {
    if ((_DWORD)v9)
    {
      if (v12 != v11)
      {
        memmove((void *)(v8 + v11 - v9), (const void *)(v8 + v11), v12 - v11);
        unint64_t v11 = *((void *)xat + 3);
        uint64_t v4 = *(void *)xat;
      }

      *((void *)xat + 3) = v11 - v9;
    }

    unint64_t v14 = v4 - 1;
    *(void *)xat = v14;
    if (v14 > v6)
    {
      uint64_t v15 = *((void *)xat + 2);
      do
      {
        *(void *)(v15 + 8 * v6) = *(void *)(v15 + 8 * v6 + 8) - v9;
        ++v6;
      }

      while (v6 < *(void *)xat);
    }

    return 0;
  }

size_t AAEntryXATBlobGetEncodedSize(AAEntryXATBlob xat)
{
  return *((void *)xat + 3);
}

const uint8_t *__cdecl AAEntryXATBlobGetEncodedData(AAEntryXATBlob xat)
{
  return (const uint8_t *)*((void *)xat + 5);
}

uint64_t loadAndDecodeHeader_Ustar(uint64_t a1, uint64_t *a2)
{
  *(void *)&v149[1022] = *MEMORY[0x1895F89C0];
  if (AAHeaderAssign(*(AAHeader *)(a1 + 88), *(AAHeader *)(a1 + 96)) < 0)
  {
    unint64_t v16 = "init header";
    __int16 v17 = 199;
    goto LABEL_242;
  }

  if ((decodeStreamLoadHeader((void *)a1, 0x200uLL, v4, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    unint64_t v16 = "invalid tar archive";
    __int16 v17 = 202;
    goto LABEL_242;
  }

  BOOL v10 = *(_BYTE **)(a1 + 64);
  if (isZero(v10, 512LL))
  {
    if ((decodeStreamLoadHeader((void *)a1, 0x400uLL, v11, v12, v13, v14, v8, v9) & 0x80000000) != 0)
    {
      unint64_t v16 = "invalid tar archive";
      __int16 v17 = 207;
      goto LABEL_242;
    }

    if (!isZero(*(_BYTE **)(a1 + 64), 1024LL))
    {
      unint64_t v16 = "Invalid EOF record header";
      __int16 v17 = 209;
      goto LABEL_242;
    }

    return 1LL;
  }

  while (1)
  {
    while (1)
    {
      uint64_t v18 = *(void *)(a1 + 72);
      unint64_t v19 = &v10[v18];
      unint64_t v20 = &v10[v18 - 356];
      int v21 = *v20;
      if (v21 != 120 && v21 != 103) {
        break;
      }
      uint64_t v146 = 0LL;
      if ((tarParseInt(v19 - 388, 0xCuLL, &v146) & 0x80000000) != 0)
      {
        unint64_t v16 = "invalid pax header";
        __int16 v17 = 229;
        goto LABEL_242;
      }

      uint64_t v26 = v146;
      if (v21 == 103 && AAHeaderClear(*(AAHeader *)(a1 + 88)) < 0)
      {
        unint64_t v16 = "clear header";
        __int16 v17 = 233;
        goto LABEL_242;
      }

      if ((decodeStreamLoadHeader( (void *)a1,  v18 + ((v26 + 511) & 0xFFFFFFFFFFFFFE00LL) + 512,  v22,  v23,  v24,  v25,  v8,  v9) & 0x80000000) != 0)
      {
        unint64_t v16 = "truncated stream";
        __int16 v17 = 236;
        goto LABEL_242;
      }

      if (v26)
      {
        uint64_t v27 = 0LL;
        uint64_t v28 = *(void *)(a1 + 64) + v18;
        unint64_t v29 = v28 + v26;
        unint64_t v137 = v28 + v26;
        while (1)
        {
          __endptr = 0LL;
          uint64_t v30 = strtoll((const char *)(v28 + v27), &__endptr, 10);
          if (!v30
            || ((v27 += v30, unint64_t v31 = __endptr, v27 <= v26) ? (v32 = (unint64_t)__endptr > v29) : (v32 = 1),
                v32 || (ssize_t v33 = (char *)(v27 - 1), v34 = (char *)(v28 + v27 - 1), *v34 != 10)))
          {
            unint64_t v16 = "invalid xhdr entry";
            __int16 v17 = 249;
            goto LABEL_242;
          }

          v33[v28] = 0;
          unint64_t v35 = &v31[-v28];
          if (&v31[-v28] < v33)
          {
            while (1)
            {
              int v36 = *v31++;
              if (v36 != 32) {
                break;
              }
              if (++v35 >= v33) {
                goto LABEL_145;
              }
            }
          }

          if (v35 >= v33)
          {
LABEL_145:
            unint64_t v16 = "invalid xhdr entry";
            __int16 v17 = 257;
            goto LABEL_242;
          }

          uint64_t v37 = v28;
          while (v35[v37] != 61)
          {
            --v33;
            ++v37;
            if (v35 == v33) {
              goto LABEL_145;
            }
          }

          uint64_t v136 = a2;
          v35[v37] = 0;
          int v38 = &v35[v37 + 1];
          fprintf((FILE *)*MEMORY[0x1895F89D0], "xhdr %s: %s\n", &v35[v28], v38);
          if (!strcmp(&v35[v28], "size"))
          {
            v41.iint key = 5521732;
            int v39 = 5;
LABEL_42:
            char v40 = 1;
            goto LABEL_47;
          }

          if (!strcmp(&v35[v28], "path"))
          {
            char v40 = 0;
            int v39 = 2;
            v41.iint key = 5521744;
            goto LABEL_47;
          }

          if (!strcmp(&v35[v28], "uid")) {
            break;
          }
          if (!strcmp(&v35[v28], "gid"))
          {
            char v40 = 1;
            v41.iint key = 4475207;
            goto LABEL_46;
          }

          if (!strcmp(&v35[v28], "uname"))
          {
            v41.iint key = 5130581;
            int v39 = 2;
            goto LABEL_42;
          }

          if (!strcmp(&v35[v28], "gname"))
          {
            int v39 = 2;
            char v40 = 1;
            v41.iint key = 5130567;
          }

          else if (!strcmp(&v35[v28], "linkpath"))
          {
            char v40 = 0;
            int v39 = 2;
            v41.iint key = 4935244;
          }

          else
          {
            if (strcmp(&v35[v28], "mtime")) {
              goto LABEL_97;
            }
            int v39 = 4;
            char v40 = 1;
            v41.iint key = 5067853;
          }

uint64_t isZero(_BYTE *a1, uint64_t a2)
{
  unint64_t v2 = (unint64_t)&a1[a2];
  if (a2 >= 1 && (a1 & 7) != 0)
  {
    uint64_t v3 = a1 + 1;
    while (!*a1)
    {
      if ((unint64_t)++a1 < v2)
      {
      }

      goto LABEL_9;
    }

    return 0LL;
  }

  else
  {
LABEL_9:
    while ((unint64_t)(a1 + 8) <= v2)
    {
      uint64_t v5 = *(void *)a1;
      a1 += 8;
      if (v5) {
        return 0LL;
      }
    }

    while ((unint64_t)a1 < v2)
    {
      if (*a1) {
        return 0LL;
      }
      ++a1;
    }

    return 1LL;
  }

uint64_t tarParseInt(_BYTE *a1, unint64_t a2, unint64_t *a3)
{
  int v3 = *a1;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (*a1 && v3 != 128 && v3 != 255)
  {
    unint64_t v5 = 0LL;
    if (a2)
    {
      while (a1[v5] == 32)
      {
        if (a2 == ++v5) {
          return 0xFFFFFFFFLL;
        }
      }
    }

    unint64_t v6 = a2 - v5;
    if (a2 <= v5) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v7 = 0LL;
    unint64_t v8 = 0LL;
    uint64_t v9 = -3LL * v5 + 3 * a2;
    BOOL v10 = &a1[v5];
    while (1)
    {
      char v12 = *v10++;
      char v11 = v12;
      if ((v12 & 0xF8) != 0x30) {
        break;
      }
      v7 += 3LL;
      unint64_t v8 = v11 & 7 | (8 * v8);
      if (!--v6)
      {
        uint64_t v7 = v9;
        break;
      }
    }

    if ((unint64_t)(v7 - 65) >= 0xFFFFFFFFFFFFFFC0LL)
    {
      uint64_t v4 = 0LL;
      *a3 = v8;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return v4;
}

uint64_t appendFieldIfNotDefinedUInt(AAHeader_impl *a1, AAFieldKey a2, uint64_t a3)
{
  if ((AAHeaderGetKeyIndex(a1, a2) & 0x80000000) == 0) {
    return 0LL;
  }
  AAFieldKey v7 = a2;
  return AAHeaderSetFieldUInt(a1, 0xFFFFFFFF, v7, a3);
}

uint64_t appendFieldIfNotDefinedTimespec(AAHeader_impl *a1, const timespec *a2)
{
  v4.iint key = 5067853;
  if ((AAHeaderGetKeyIndex(a1, v4) & 0x80000000) == 0) {
    return 0LL;
  }
  v6.iint key = 5067853;
  return AAHeaderSetFieldTimespec(a1, 0xFFFFFFFF, v6, a2);
}

uint64_t appendFieldIfNotDefinedString(AAHeader_impl *a1, AAFieldKey a2, const char *a3, size_t a4)
{
  if ((AAHeaderGetKeyIndex(a1, a2) & 0x80000000) == 0) {
    return 0LL;
  }
  AAFieldKey v9 = a2;
  return AAHeaderSetFieldString(a1, 0xFFFFFFFF, v9, a3, a4);
}

uint64_t aaEntryACLBlobInitWithEncodedData( void *a1, char *__src, rsize_t __smax, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a1 = 0LL;
  a1[3] = 0LL;
  unint64_t v8 = a1 + 3;
  if (!__smax) {
    return 0LL;
  }
  char v12 = 0;
  uint64_t v13 = a1 + 4;
  char v14 = 1;
  while (2)
  {
    rsize_t v15 = 0LL;
    unint64_t v16 = 0LL;
    char v17 = v14;
    do
    {
      if (v15 + 4 > __smax) {
        goto LABEL_81;
      }
      uint64_t v18 = *(unsigned int *)&__src[v15];
      BOOL v19 = __CFADD__(v18, v15);
      rsize_t v20 = v18 + v15;
      if (v19 || v20 > __smax) {
        goto LABEL_81;
      }
      if ((v12 & 1) != 0)
      {
        uint64_t v21 = a1[2];
        uint64_t v22 = (*a1)++;
        *(void *)(v21 + 8 * v22) = v15;
      }

      ++v16;
      rsize_t v15 = v20;
    }

    while (v20 < __smax);
    if (v20 != __smax) {
      goto LABEL_81;
    }
    if ((v17 & 1) == 0) {
      break;
    }
    if (v16 > 0xFFFFFFFE) {
      goto LABEL_81;
    }
    unint64_t v23 = a1[1];
    if (v23 < v16)
    {
      unint64_t v24 = a1[1];
      do
      {
        if (v24) {
          v24 *= 2LL;
        }
        else {
          unint64_t v24 = 16LL;
        }
      }

      while (v24 < v16);
      if (v24 > v23)
      {
        a1[1] = v24;
        if (8 * v24 >= 0x2000000001LL)
        {
          *__error() = 12;
        }

        else
        {
          uint64_t v25 = (void *)a1[2];
          uint64_t v26 = realloc(v25, 8 * v24);
          if (v26)
          {
            a1[2] = v26;
            goto LABEL_24;
          }

          free(v25);
        }

        a1[2] = 0LL;
LABEL_81:
        *a1 = 0LL;
        a1[3] = 0LL;
        __int16 v49 = 169;
LABEL_82:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"aaEntryACLBlobInitWithEncodedData",  v49,  100,  0,  "invalid ACL blob",  a7,  a8,  v50);
LABEL_83:
        *a1 = 0LL;
        a1[3] = 0LL;
        return 0xFFFFFFFFLL;
      }
    }

uint64_t aaEntryACLBlobInitWithPath(AAEntryACLBlob_impl *a1, char *__s, const char *a3, char a4)
{
  char v5 = (char)__s;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if ((concatPath(v18, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"aaEntryACLBlobInitWithPath",  215,  100,  0,  "invalid path %s/%s",  v7,  v8,  v5);
    return 0xFFFFFFFFLL;
  }

  int v9 = open(v18, 0x200000);
  if (v9 < 0)
  {
    int v14 = *__error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"aaEntryACLBlobInitWithPath",  219,  100,  v14,  "open: %s",  v15,  v16,  (char)v18);
    return 0xFFFFFFFFLL;
  }

  int v10 = v9;
  if ((aaEntryACLBlobInitWithFD(a1, v9, a4) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"aaEntryACLBlobInitWithPath",  221,  100,  0,  "initializing ACL blob: %s",  v11,  v12,  (char)v18);
    uint64_t v13 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  close(v10);
  return v13;
}

uint64_t aaEntryACLBlobInitWithFD(AAEntryACLBlob_impl *a1, int a2, char a3)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  uint64_t v6 = sysconf(71);
  uint64_t v7 = sysconf(70);
  if (v6 <= v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v6;
  }
  if (v8 <= 4096) {
    size_t v9 = 4096LL;
  }
  else {
    size_t v9 = v8;
  }
  if (v9 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_14:
    uint64_t v15 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"aaEntryACLBlobInitWithFD",  243,  100,  *v15,  "malloc",  v16,  v17,  v33);
    goto LABEL_15;
  }

  int v10 = malloc(v9);
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  *(void *)a1 = 0LL;
  *((void *)a1 + 3) = 0LL;
  fd_np = acl_get_fd_np(a2, ACL_TYPE_EXTENDED);
  if (!fd_np)
  {
LABEL_13:
    free(v11);
    return 0LL;
  }

  uint64_t v13 = fd_np;
  if (acl_get_entry(fd_np, 0, &entry_p))
  {
LABEL_12:
    acl_free(v13);
    goto LABEL_13;
  }

  while (1)
  {
    memset(&ace, 0, sizeof(ace));
    memset(out, 0, 256);
    if (acl_get_tag_type(entry_p, &tag_type_p))
    {
      int v28 = *__error();
      unint64_t v31 = "acl_get_tag_type";
      __int16 v32 = 272;
LABEL_66:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"aaEntryACLBlobInitWithFD",  v32,  100,  v28,  v31,  v29,  v30,  v33);
      goto LABEL_67;
    }

    if (tag_type_p - 1 <= 1) {
      break;
    }
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"aaEntryACLBlobInitWithFD",  274,  100,  "Warning: ACL tag type is not ALLOW/DENY (ignoring entry): %d\n",  v18,  v19,  v20,  tag_type_p);
LABEL_60:
    if (acl_get_entry(v13, -1, &entry_p)) {
      goto LABEL_12;
    }
  }

  ace.tag = tag_type_p;
  if (acl_get_flagset_np(entry_p, &flagset_p))
  {
    int v28 = *__error();
    unint64_t v31 = "acl_get_flagset_np";
    __int16 v32 = 278;
    goto LABEL_66;
  }

  if (acl_get_flag_np(flagset_p, ACL_FLAG_NO_INHERIT))
  {
    ace.uint64_t flags = 0x20000LL;
    AAACEFlagSet v21 = 0x20000LL;
  }

  else
  {
    AAACEFlagSet v21 = 0LL;
  }

  if (acl_get_flag_np(flagset_p, ACL_ENTRY_INHERITED))
  {
    v21 |= 0x10uLL;
    ace.uint64_t flags = v21;
  }

  if (acl_get_flag_np(flagset_p, ACL_ENTRY_FILE_INHERIT))
  {
    v21 |= 0x20uLL;
    ace.uint64_t flags = v21;
  }

  if (acl_get_flag_np(flagset_p, ACL_ENTRY_DIRECTORY_INHERIT))
  {
    v21 |= 0x40uLL;
    ace.uint64_t flags = v21;
  }

  if (acl_get_flag_np(flagset_p, ACL_ENTRY_LIMIT_INHERIT))
  {
    v21 |= 0x80uLL;
    ace.uint64_t flags = v21;
  }

  if (acl_get_flag_np(flagset_p, ACL_ENTRY_ONLY_INHERIT)) {
    ace.uint64_t flags = v21 | 0x100;
  }
  if (acl_get_permset_mask_np(entry_p, &mask_p))
  {
    int v28 = *__error();
    unint64_t v31 = "acl_get_permset_mask_np";
    __int16 v32 = 289;
    goto LABEL_66;
  }

  ace.perms = mask_p & 0x103FFE;
  qualifier = (const unsigned __int8 *)acl_get_qualifier(entry_p);
  if (!qualifier)
  {
    int v28 = *__error();
    unint64_t v31 = "acl_get_qualifier";
    __int16 v32 = 294;
    goto LABEL_66;
  }

  unint64_t v23 = (unsigned __int8 *)qualifier;
  if ((a3 & 4) != 0) {
    goto LABEL_57;
  }
  if (mbr_uuid_to_id(qualifier, &uid_or_gid, &id_type)) {
    goto LABEL_53;
  }
  if (id_type == 1)
  {
    memset(&v35, 0, 32);
    rsize_t v34 = 0LL;
    AAACEQualifierType v24 = 0;
    if (!getgrgid_r(uid_or_gid, (group *)&v35, (char *)v11, v9, (group **)&v34) && v34 && v35.pw_name)
    {
      if (strlen(v35.pw_name) > 0xFF) {
        goto LABEL_51;
      }
      AAACEQualifierType v24 = 71;
LABEL_50:
      ace.qualifier_type = v24;
      __strlcpy_chk();
    }
  }

  else
  {
    if (id_type) {
      goto LABEL_53;
    }
    memset(&v35, 0, sizeof(v35));
    rsize_t v34 = 0LL;
    AAACEQualifierType v24 = 0;
    if (!getpwuid_r(uid_or_gid, &v35, (char *)v11, v9, &v34) && v34 && v35.pw_name)
    {
      if (strlen(v35.pw_name) <= 0xFF)
      {
        AAACEQualifierType v24 = 85;
        goto LABEL_50;
      }

int AAEntryACLBlobAppendEntry( AAEntryACLBlob acl, const AAAccessControlEntry *ace, const uint8_t *qualifier_value, size_t qualifier_size)
{
  if ((ace_check_entry((uint64_t)ace, (uint64_t)ace, (uint64_t)qualifier_value, qualifier_size, v4, v5, v6, v7) & 0x80000000) != 0)
  {
    AAACEQualifierType v24 = "invalid ACL entry";
    __int16 v25 = 618;
LABEL_50:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"AAEntryACLBlobAppendEntry",  v25,  100,  0,  v24,  v12,  v13,  v44);
    return -1;
  }

  if (qualifier_size > 0xFFFFFFE9 || (uint64_t v14 = (qualifier_size + 22), (_DWORD)qualifier_size == -23))
  {
    AAACEQualifierType v24 = "ACL entry size out of range";
    __int16 v25 = 622;
    goto LABEL_50;
  }

  uint64_t v15 = (void *)((char *)acl + 24);
  unint64_t v16 = *((void *)acl + 3);
  unint64_t v17 = v16 + v14;
  unint64_t v19 = *(void *)acl;
  unint64_t v18 = *((void *)acl + 1);
  unint64_t v20 = *(void *)acl + 1LL;
  if (v18 < v20)
  {
    unint64_t v21 = *((void *)acl + 1);
    do
    {
      if (v21) {
        v21 *= 2LL;
      }
      else {
        unint64_t v21 = 16LL;
      }
    }

    while (v21 < v20);
    if (v21 > v18)
    {
      unint64_t v45 = *(void *)acl;
      unint64_t v23 = (void *)((char *)acl + 16);
      uint64_t v22 = (void *)*((void *)acl + 2);
      *((void *)acl + 1) = v21;
      if (8 * v21 >= 0x2000000001LL)
      {
        *__error() = 12;
LABEL_48:
        *(void *)acl = 0LL;
        *unint64_t v23 = 0LL;
        *((void *)acl + 3) = 0LL;
        goto LABEL_49;
      }

      uint64_t v26 = realloc(v22, 8 * v21);
      if (!v26)
      {
        free(v22);
        goto LABEL_48;
      }

      *unint64_t v23 = v26;
      unint64_t v19 = v45;
    }
  }

  if ((v17 & 0x8000000000000000LL) != 0) {
    goto LABEL_44;
  }
  size_t v27 = *((void *)acl + 4);
  if (v27 < v17)
  {
    do
    {
      while (!v27)
      {
        size_t v27 = 0x4000LL;
        if (v17 <= 0x4000)
        {
          size_t v27 = 0x4000LL;
          goto LABEL_30;
        }
      }

      size_t v28 = v27 >> 1;
      if ((v27 & (v27 >> 1)) != 0) {
        size_t v28 = v27 & (v27 >> 1);
      }
      v27 += v28;
    }

    while (v27 < v17);
    if (v27 >= 0x2000000001LL)
    {
      *__error() = 12;
      goto LABEL_43;
    }

uint64_t aaEntryACLBlobApplyToFD(unint64_t *a1, uint64_t a2, char a3)
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  if (fstat(a2, &v51))
  {
    uint64_t v6 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"aaEntryACLBlobApplyToFD",  370,  100,  *v6,  "fstat",  v7,  v8,  v45);
    return 0xFFFFFFFFLL;
  }

  int v10 = v51.st_mode & 0xF000;
  if (v10 != 0x8000 && v10 != 0x4000) {
    return 0LL;
  }
  unint64_t v11 = *a1;
  if (!*a1) {
    return 0LL;
  }
  int v12 = 0;
  uint64_t v13 = (uint64_t *)a1[2];
  do
  {
    uint64_t v14 = *v13++;
    int v15 = *(char *)(a1[5] + 4 + v14);
    if (v15 == 68 || v15 == 65) {
      ++v12;
    }
    --v11;
  }

  while (v11);
  if (!v12) {
    return 0LL;
  }
  acl_t acl_p = 0LL;
  uint64_t v16 = sysconf(71);
  uint64_t v17 = sysconf(70);
  if (v16 <= v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v16;
  }
  if (v18 <= 4096) {
    size_t v19 = 4096LL;
  }
  else {
    size_t v19 = v18;
  }
  if (v19 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_24:
    __int16 v25 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"aaEntryACLBlobApplyToFD",  403,  100,  *v25,  "malloc",  v26,  v27,  v45);
    unint64_t v23 = 0LL;
    goto LABEL_79;
  }

  unint64_t v20 = (char *)malloc(v19);
  if (!v20) {
    goto LABEL_24;
  }
  unint64_t v23 = v20;
  if ((a3 & 8) != 0)
  {
    fd_np = acl_p;
  }

  else
  {
    fd_np = acl_get_fd_np(a2, ACL_TYPE_EXTENDED);
    acl_t acl_p = fd_np;
  }

  if (!fd_np)
  {
    fd_np = acl_init(v12);
    acl_t acl_p = fd_np;
    if (!fd_np)
    {
      int v41 = *__error();
      char v42 = "acl_init";
      __int16 v43 = 415;
      goto LABEL_78;
    }
  }

  unint64_t v28 = *a1;
  if (!*a1)
  {
LABEL_60:
    if ((MEMORY[0x186E361CC](a2, fd_np) & 0x80000000) != 0)
    {
      uint64_t v40 = __error();
      if ((a3 & 1) == 0 || *v40 != 1)
      {
        int v41 = *__error();
        char v42 = "acl_set_fd";
        __int16 v43 = 499;
        goto LABEL_78;
      }
    }

    uint64_t v9 = 0LL;
    goto LABEL_80;
  }

  uint64_t v29 = 0LL;
  while (1)
  {
    uint64_t v30 = (int *)(a1[5] + *(void *)(a1[2] + 8 * v29));
    acl_flagset_t flagset_p = 0LL;
    acl_entry_t entry_p = 0LL;
    memset(uu, 0, sizeof(uu));
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    *(_OWORD *)in = 0u;
    __int128 v53 = 0u;
    int v31 = *v30;
    int v32 = *((char *)v30 + 4);
    if (v32 == 65) {
      break;
    }
    if (v32 == 68)
    {
      acl_tag_t v33 = ACL_EXTENDED_DENY;
      goto LABEL_34;
    }

AAEntryACLBlob AAEntryACLBlobCreate(void)
{
  v0 = (AAEntryACLBlob_impl *)malloc(0x30uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    memset_s(v0, 0x30uLL, 0, 0x30uLL);
  }

  else
  {
    unint64_t v2 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"AAEntryACLBlobCreate",  521,  100,  *v2,  "malloc",  v3,  v4,  v6);
  }

  return v1;
}

void AAEntryACLBlobDestroy(AAEntryACLBlob acl)
{
  if (acl)
  {
    free(*((void **)acl + 2));
    free(*((void **)acl + 5));
    memset_s((char *)acl + 24, 0x18uLL, 0, 0x18uLL);
    memset_s(acl, 0x30uLL, 0, 0x30uLL);
    free(acl);
  }

AAEntryACLBlob AAEntryACLBlobCreateWithEncodedData(const uint8_t *data, size_t data_size)
{
  AAEntryACLBlob v4 = AAEntryACLBlobCreate();
  int v10 = v4;
  if (v4 && (aaEntryACLBlobInitWithEncodedData(v4, (char *)data, data_size, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    AAEntryACLBlobDestroy(v10);
    return 0LL;
  }

  return v10;
}

AAEntryACLBlob AAEntryACLBlobCreateWithPath(const char *dir, const char *path, AAFlagSet flags)
{
  char v3 = flags;
  uint64_t v6 = AAEntryACLBlobCreate();
  uint64_t v7 = v6;
  if (v6 && (aaEntryACLBlobInitWithPath(v6, (char *)dir, path, v3) & 0x80000000) != 0)
  {
    AAEntryACLBlobDestroy(v7);
    return 0LL;
  }

  return v7;
}

int AAEntryACLBlobClear(AAEntryACLBlob acl)
{
  *(void *)acl = 0LL;
  *((void *)acl + 3) = 0LL;
  return 0;
}

int AAEntryACLBlobApplyToPath(AAEntryACLBlob acl, const char *dir, const char *path, AAFlagSet flags)
{
  char v4 = flags;
  char v5 = (char)dir;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if ((concatPath(v18, 0x800uLL, (char *)dir, path) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"AAEntryACLBlobApplyToPath",  569,  100,  0,  "invalid path %s/%s",  v7,  v8,  v5);
    return -1;
  }

  uint64_t v9 = open(v18, 0x200000);
  if ((v9 & 0x80000000) != 0)
  {
    int v14 = *__error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"AAEntryACLBlobApplyToPath",  571,  100,  v14,  "open: %s",  v15,  v16,  (char)v18);
    return -1;
  }

  int v10 = v9;
  if ((aaEntryACLBlobApplyToFD((unint64_t *)acl, v9, v4) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"AAEntryACLBlobApplyToPath",  573,  100,  0,  "applying ACL blob: %s",  v11,  v12,  (char)v18);
    int v13 = -1;
  }

  else
  {
    int v13 = 0;
  }

  close(v10);
  return v13;
}

uint32_t AAEntryACLBlobGetEntryCount(AAEntryACLBlob acl)
{
  return *(_DWORD *)acl;
}

int AAEntryACLBlobGetEntry( AAEntryACLBlob acl, uint32_t i, AAAccessControlEntry *ace, size_t qualifier_capacity, uint8_t *qualifier_value, size_t *qualifier_size)
{
  if (*(void *)acl <= (unint64_t)i)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"AAEntryACLBlobGetEntry",  593,  100,  0,  "invalid ACL index %u",  v6,  v7,  i);
  }

  else
  {
    uint64_t v9 = *((void *)acl + 5) + *(void *)(*((void *)acl + 2) + 8LL * i);
    size_t v10 = (*(_DWORD *)v9 - 22);
    int v11 = *(unsigned __int8 *)(v9 + 4);
    if (v11 == 65) {
      AAACETag v12 = ACL_EXTENDED_ALLOW;
    }
    else {
      AAACETag v12 = 2 * (v11 == 68);
    }
    ace->tag = v12;
    ace->qualifier_type = *(char *)(v9 + 21);
    ace->uint64_t flags = *(void *)(v9 + 5);
    ace->perms = *(void *)(v9 + 13);
    if (qualifier_size) {
      *qualifier_uint64_t size = v10;
    }
    if (!qualifier_capacity) {
      return 0;
    }
    if (v10 <= qualifier_capacity)
    {
      memcpy(qualifier_value, (const void *)(v9 + 22), v10);
      return 0;
    }
  }

  return -1;
}

uint64_t ace_check_entry( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_DWORD *)a1 - 3) > 0xFFFFFFFD)
  {
    int v8 = *(_DWORD *)(a1 + 24);
    HIDWORD(v10) = v8 - 71;
    LODWORD(v10) = v8 - 71;
    unsigned int v9 = v10 >> 1;
    BOOL v11 = v9 > 7;
    int v12 = (1 << v9) & 0xC3;
    if (v11 || v12 == 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"ace_check_entry",  156,  100,  0,  "invalid ACL qualifier type %c",  a7,  a8,  v8);
    }

    else if ((*(void *)(a1 + 16) & 0xFFFFFFFFFCFDFE0FLL) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"ace_check_entry",  158,  100,  0,  "invalid ACL flags 0x%llx",  a7,  a8,  *(void *)(a1 + 16));
    }

    else
    {
      if ((*(void *)(a1 + 8) & 0xFFFFFFFFFFEFC001LL) == 0) {
        return 0LL;
      }
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"ace_check_entry",  159,  100,  0,  "invalid ACL perms 0x%llx",  a7,  a8,  *(void *)(a1 + 8));
    }
  }

  else
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"ace_check_entry",  148,  100,  0,  "invalid ACL entry tag %c",  a7,  a8,  *(_DWORD *)a1);
  }

  return 0xFFFFFFFFLL;
}

int AAEntryACLBlobSetEntry( AAEntryACLBlob acl, uint32_t i, const AAAccessControlEntry *ace, const uint8_t *qualifier_value, size_t qualifier_size)
{
  if ((ace_check_entry( (uint64_t)ace,  *(uint64_t *)&i,  (uint64_t)ace,  (uint64_t)qualifier_value,  qualifier_size,  v5,  v6,  v7) & 0x80000000) != 0)
  {
    AAACEQualifierType v24 = "invalid ACL entry";
    __int16 v25 = 648;
    goto LABEL_11;
  }

  if (*(void *)acl <= (unint64_t)i)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"AAEntryACLBlobSetEntry",  649,  100,  0,  "invalid ACL index %u",  v13,  v14,  i);
    return -1;
  }

  if (qualifier_size > 0xFFFFFFE9 || (uint64_t v15 = (qualifier_size + 22), (_DWORD)qualifier_size == -23))
  {
    AAACEQualifierType v24 = "ACL entry size out of range";
    __int16 v25 = 653;
    goto LABEL_11;
  }

  unint64_t v16 = i;
  unint64_t v17 = *(void *)(*((void *)acl + 2) + 8LL * i);
  uint64_t v18 = (char *)*((void *)acl + 5);
  uint64_t v19 = *(unsigned int *)&v18[v17];
  unint64_t v20 = v17 + v19;
  if (__CFADD__(v17, v19)
    || (v21 = (unint64_t *)((char *)acl + 24), unint64_t v22 = *((void *)acl + 3), v23 = v22 - v20, v22 < v20))
  {
LABEL_7:
    AAACEQualifierType v24 = "alloc ACL entry";
    __int16 v25 = 656;
LABEL_11:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"AAEntryACLBlobSetEntry",  v25,  100,  0,  v24,  v13,  v14,  v49);
    return -1;
  }

  if (v15 > v19)
  {
    uint64_t v27 = v15 - v19;
    unint64_t v28 = v22 + v15 - v19;
    if ((v28 & 0x8000000000000000LL) != 0LL) {
      goto LABEL_7;
    }
    unint64_t v29 = *((void *)acl + 4);
    if (v29 < v28)
    {
      size_t v30 = 0x4000LL;
      do
      {
        while (!v29)
        {
          unint64_t v29 = 0x4000LL;
          if (v28 <= 0x4000) {
            goto LABEL_30;
          }
        }

        unint64_t v31 = v29 >> 1;
        if ((v29 & (v29 >> 1)) != 0) {
          unint64_t v31 = v29 & (v29 >> 1);
        }
        v29 += v31;
      }

      while (v29 < v28);
      size_t v30 = v29;
      if (v29 >= 0x2000000001LL)
      {
        int v36 = __error();
        BOOL v37 = (void *)((char *)acl + 24);
        *int v36 = 12;
        goto LABEL_56;
      }

int AAEntryACLBlobRemoveEntry(AAEntryACLBlob acl, uint32_t i)
{
  uint64_t v4 = *(void *)acl;
  if (*(void *)acl <= (unint64_t)i
    || (unint64_t v6 = i,
        uint64_t v7 = *(void *)(*((void *)acl + 2) + 8LL * i),
        uint64_t v8 = *((void *)acl + 5),
        uint64_t v9 = *(unsigned int *)(v8 + v7),
        BOOL v10 = __CFADD__(v7, v9),
        unint64_t v11 = v7 + v9,
        v10)
    || (unint64_t v12 = *((void *)acl + 3), v12 < v11))
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldACL.c",  (uint64_t)"AAEntryACLBlobRemoveEntry",  673,  100,  0,  "invalid ACL index %u",  v2,  v3,  i);
    return -1;
  }

  else
  {
    if ((_DWORD)v9)
    {
      if (v12 != v11)
      {
        memmove((void *)(v8 + v11 - v9), (const void *)(v8 + v11), v12 - v11);
        unint64_t v11 = *((void *)acl + 3);
        uint64_t v4 = *(void *)acl;
      }

      *((void *)acl + 3) = v11 - v9;
    }

    unint64_t v14 = v4 - 1;
    *(void *)acl = v14;
    if (v14 > v6)
    {
      uint64_t v15 = *((void *)acl + 2);
      do
      {
        *(void *)(v15 + 8 * v6) = *(void *)(v15 + 8 * v6 + 8) - v9;
        ++v6;
      }

      while (v6 < *(void *)acl);
    }

    return 0;
  }

size_t AAEntryACLBlobGetEncodedSize(AAEntryACLBlob acl)
{
  return *((void *)acl + 3);
}

const uint8_t *__cdecl AAEntryACLBlobGetEncodedData(AAEntryACLBlob acl)
{
  return (const uint8_t *)*((void *)acl + 5);
}

uint64_t AAAssetBuilderGenerate( void *a1, uint64_t a2, int DefaultNThreads, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1[2];
  if (!v8 || v8 != a1[1] + 1LL)
  {
    uint64_t v194 = "exactly one output, and 0 or more inputs expected";
    __int16 v195 = 1547;
LABEL_200:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"AAAssetBuilderGenerate",  v195,  27,  0,  v194,  a7,  a8,  v266);
    uint64_t v13 = 0LL;
    goto LABEL_201;
  }

  unint64_t v12 = malloc(0x460uLL);
  uint64_t v13 = (uint64_t)v12;
  if (!v12)
  {
    int v196 = *__error();
    uint64_t v197 = "malloc";
    __int16 v198 = 646;
LABEL_195:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateCreate",  v198,  27,  v196,  v197,  v15,  v16,  v266);
LABEL_199:
    stateDestroy_0(v13);
    uint64_t v194 = "stateCreate";
    __int16 v195 = 1550;
    goto LABEL_200;
  }

  memset_s(v12, 0x460uLL, 0, 0x460uLL);
  *(void *)(v13 + 32) = StringTableCreate();
  unint64_t v14 = StringTableCreate();
  *(void *)(v13 + 40) = v14;
  if (!*(void *)(v13 + 32) || !v14)
  {
    uint64_t v197 = "StringTableCreate";
    __int16 v198 = 650;
    int v196 = 0;
    goto LABEL_195;
  }

  *(void *)uint64_t v13 = a2;
  *(void *)(v13 + 8) = a1;
  if (!DefaultNThreads) {
    unsigned int DefaultNThreads = getDefaultNThreads();
  }
  uint64_t v17 = *a1;
  uint64_t v18 = *a1 >> 62;
  *(_DWORD *)(v13 + 20) = DefaultNThreads;
  *(_DWORD *)(v13 + 24) = v18;
  *(_DWORD *)(v13 + 16) = v17 & 1;
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(a1 + 1);
  if ((getTempDir((char *)(v13 + 92), 0x3F6uLL) & 0x80000000) != 0)
  {
    unsigned int v199 = "getTempDir";
    __int16 v200 = 658;
    int v201 = 0;
LABEL_198:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateCreate",  v200,  27,  v201,  v199,  v19,  v20,  v266);
    memset_s((void *)(v13 + 92), 0x400uLL, 0, 0x400uLL);
    goto LABEL_199;
  }

  __strlcat_chk();
  if (!mkdtemp((char *)(v13 + 92)))
  {
    int v201 = *__error();
    unsigned int v199 = "mkdtemp";
    __int16 v200 = 660;
    goto LABEL_198;
  }

  uint64_t v21 = *(void *)(v13 + 56);
  uint64_t v22 = **(void **)(v13 + 8);
  if ((v22 & 0x10) != 0) {
    size_t v23 = "DAT,YEC";
  }
  else {
    size_t v23 = "DAT";
  }
  uint64_t v26 = AAFieldKeySetCreateWithString(v23);
  if (!v26)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateScanVariants",  863,  27,  0,  "AAFieldKeySetCreateWithString",  v24,  v25,  v266);
    int v38 = 0LL;
    unint64_t v31 = 0LL;
    goto LABEL_204;
  }

  if (!*(void *)(v13 + 56)) {
    goto LABEL_157;
  }
  uint64_t v27 = 0LL;
  uint64_t v28 = v21 - 1;
  uint64_t v29 = v22 & 0x10;
  uint64_t v296 = v21 - 1;
  do
  {
    if (*(_DWORD *)(v13 + 24)) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "Scanning archive for variant %zu...\n", v27);
    }
    AAByteStreamSeek(*(AAByteStream *)(*(void *)(v13 + 8) + 8 * v27 + 24), 0LL, 0);
    size_t v30 = (uint64_t **)malloc(0x38uLL);
    unint64_t v31 = v30;
    if (!v30)
    {
      int v241 = v26;
      __int16 v242 = 376;
LABEL_271:
      char v243 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateCollectorStreamOpen",  v242,  27,  *v243,  "malloc",  v244,  v245,  v266);
      free(v31);
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateScanVariants",  874,  27,  0,  "collector stream",  v246,  v247,  v267);
      int v38 = 0LL;
      unint64_t v31 = 0LL;
      uint64_t v42 = 0LL;
      int v41 = 0LL;
      uint64_t v26 = v241;
      goto LABEL_208;
    }

    memset_s(v30, 0x38uLL, 0, 0x38uLL);
    uint64_t v32 = (uint64_t *)malloc(0x40uLL);
    if (!v32)
    {
      int v241 = v26;
      __int16 v242 = 378;
      goto LABEL_271;
    }

    acl_tag_t v33 = v32;
    memset_s(v32, 0x40uLL, 0, 0x40uLL);
    BOOL v34 = v27 == v28 && v29 == 0;
    *acl_tag_t v33 = v13;
    v33[1] = v27;
    *unint64_t v31 = v33;
    v31[1] = (uint64_t *)stateCollectorStreamClose;
    v31[3] = (uint64_t *)stateCollectorStreamWriteHeader;
    _OWORD v31[4] = (uint64_t *)stateCollectorStreamWriteBlob;
    if (v34) {
      uint64_t v35 = "SH2,IDX,IDZ,SIZ,YEC";
    }
    else {
      uint64_t v35 = "SH2,IDX,IDZ,SIZ";
    }
    int v38 = AAFieldKeySetCreateWithString(v35);
    if (!v38)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateScanVariants",  880,  27,  0,  "AAFieldKeySetCreateWithString",  v36,  v37,  v266);
LABEL_204:
      uint64_t v42 = 0LL;
      int v41 = 0LL;
      goto LABEL_208;
    }

    int v41 = AADecodeArchiveInputStreamOpen( *(AAByteStream *)(*(void *)(v13 + 8) + 8 * v27 + 24),  0LL,  0LL,  0x100uLL,  *(_DWORD *)(v13 + 20));
    if (!v41)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateScanVariants",  882,  27,  0,  "AADecodeArchiveInputStreamOpen",  v39,  v40,  v266);
      uint64_t v42 = 0LL;
      goto LABEL_208;
    }

    uint64_t v42 = AAConvertArchiveOutputStreamOpen((AAArchiveStream)v31, v38, v26, 0LL, 0LL, 0LL, *(_DWORD *)(v13 + 20));
    if (AAArchiveStreamProcess(v41, v42, 0LL, 0LL, 0LL, *(_DWORD *)(v13 + 20)) < 0)
    {
      uint64_t v204 = "processing manifest";
      __int16 v205 = 885;
LABEL_207:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateScanVariants",  v205,  27,  0,  v204,  v43,  v44,  v266);
LABEL_208:
      AAArchiveStreamClose((AAArchiveStream)v31);
      AAArchiveStreamClose(v42);
      AAArchiveStreamClose(v41);
      AAFieldKeySetDestroy(v38);
      AAFieldKeySetDestroy(v26);
      uint64_t v208 = "loading manifests / scanning directories";
      __int16 v209 = 1553;
      goto LABEL_209;
    }

    int v309 = 0LL;
    if ((StringTableSort(*(unsigned int **)(v13 + 32), &v309) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateAggregateEntries",  800,  27,  0,  "StringTableSort",  v45,  v46,  v266);
      goto LABEL_206;
    }

    size_t v48 = *(void *)(v13 + 72);
    char v47 = *(void **)(v13 + 80);
    if (v48)
    {
      char v49 = v309;
      size_t v50 = *(_DWORD **)(v13 + 80);
      uint64_t v51 = *(void *)(v13 + 72);
      do
      {
        *size_t v50 = v49[*v50];
        v50 += 246;
        --v51;
      }

      while (v51);
    }

    s = v42;
    size_t v306 = v41;
    uint64_t v300 = v27;
    qsort(v47, v48, 0x3D8uLL, (int (__cdecl *)(const void *, const void *))entryVectorCmp);
    if (!*(void *)(v13 + 72))
    {
      uint64_t v55 = 0LL;
      goto LABEL_156;
    }

    unint64_t v54 = 0LL;
    uint64_t v55 = 0LL;
    uint64_t v56 = 264LL;
    uint64_t v297 = v38;
    uint64_t v299 = v29;
    do
    {
      uint64_t v57 = *(void *)(v13 + 80);
      __int128 v58 = (_DWORD *)(v57 + 984 * v54);
      if (!v55 || (uint64_t v59 = v55 - 1, *(_DWORD *)(v57 + 984 * (v55 - 1)) != *v58))
      {
        if (v54 != v55) {
          memcpy((void *)(v57 + 984 * v55), v58, 0x3D8uLL);
        }
        ++v55;
        goto LABEL_56;
      }

      uint64_t v60 = 0LL;
      uint64_t v61 = v57 + 984 * v59 + 264;
      uint64_t v62 = v57 + v56;
      do
      {
        if (*(_DWORD *)(v62 + v60))
        {
          if (*(_DWORD *)(v61 + v60))
          {
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateAggregateEntries",  830,  27,  0,  "entry defined multiple times in the same variant",  v52,  v53,  v266);
            int v41 = v306;
            uint64_t v42 = s;
LABEL_206:
            free(v309);
            uint64_t v204 = "aggregating entries";
            __int16 v205 = 888;
            goto LABEL_207;
          }

          uint64_t v63 = v61 + v60;
          *(_OWORD *)uint64_t v63 = *(_OWORD *)(v62 + v60);
          __int128 v64 = *(_OWORD *)(v62 + v60 + 16);
          __int128 v65 = *(_OWORD *)(v62 + v60 + 32);
          __int128 v66 = *(_OWORD *)(v62 + v60 + 48);
          *(void *)(v63 + 64) = *(void *)(v62 + v60 + 64);
          *(_OWORD *)(v63 + 32) = v65;
          *(_OWORD *)(v63 + 48) = v66;
          *(_OWORD *)(v63 + 16) = v64;
        }

        v60 += 72LL;
      }

      while (v60 != 720);
      uint64_t v67 = v57 + 984 * v59;
      uint64_t v69 = *(void *)(v67 + 56);
      uint32_t v68 = (void *)(v67 + 56);
      if (!v69)
      {
        uint64_t v70 = v57 + 984 * v54;
        uint64_t v72 = *(void *)(v70 + 56);
        AAFieldKey v71 = (size_t *)(v70 + 56);
        if (v72)
        {
          *uint32_t v68 = 0LL;
          uint64_t v73 = v57 + 984 * v54;
          uint64_t v76 = *(const void **)(v73 + 72);
          AAFieldKey v75 = (void **)(v73 + 72);
          uint32_t v74 = v76;
          char __s = v71;
          size_t v77 = *v71;
          if ((*v71 & 0x8000000000000000LL) == 0)
          {
            size_t v284 = v75;
            uint32_t v292 = v26;
            uint64_t v78 = v57 + 984 * v59;
            size_t v81 = *(void *)(v78 + 64);
            int v79 = (size_t *)(v78 + 64);
            size_t v80 = v81;
            if (v81 >= v77)
            {
LABEL_63:
              uint64_t v86 = *(void *)(v57 + 984 * v59 + 72);
              if (v74)
              {
                memcpy((void *)(v86 + *v68), v74, v77);
                uint64_t v26 = v292;
              }

              else
              {
                uint64_t v26 = v292;
                if (v86) {
                  memset_s((void *)(v86 + *v68), v77, 0, v77);
                }
              }

              *v68 += v77;
            }

            else
            {
              do
              {
                while (!v80)
                {
                  size_t v80 = 0x4000LL;
                  if (v77 <= 0x4000)
                  {
                    uint64_t v272 = v79;
                    uint64_t v276 = v74;
                    AAFieldKey v83 = (void **)(v57 + 984 * v59 + 72);
                    size_t v80 = 0x4000LL;
                    goto LABEL_61;
                  }
                }

                size_t v82 = v80 >> 1;
                if ((v80 & (v80 >> 1)) != 0) {
                  size_t v82 = v80 & (v80 >> 1);
                }
                v80 += v82;
              }

              while (v80 < v77);
              AAFieldKey v83 = (void **)(v57 + 984 * v59 + 72);
              if (v80 >= 0x2000000001LL)
              {
                uint32_t v84 = (void **)(v57 + 984 * v59 + 72);
                *__error() = 12;
                goto LABEL_69;
              }

              uint64_t v272 = v79;
              uint64_t v276 = v74;
LABEL_61:
              uint64_t v280 = v83;
              ssize_t v268 = *v83;
              AAFieldKey v85 = realloc(*v83, v80);
              if (v85)
              {
                uint32_t v74 = v276;
                *uint64_t v280 = v85;
                *uint64_t v272 = v80;
                goto LABEL_63;
              }

              uint32_t v84 = v280;
              free(v268);
LABEL_69:
              const char *v84 = 0LL;
              *uint32_t v68 = 0LL;
              v68[1] = 0LL;
              uint64_t v26 = v292;
            }

            AAFieldKey v75 = v284;
          }

          free(*v75);
          memset_s(__s, 0x18uLL, 0, 0x18uLL);
          int v38 = v297;
        }
      }

      uint64_t v87 = v57 + 984 * v59;
      uint64_t v89 = *(void *)(v87 + 32);
      uint32_t v88 = (void *)(v87 + 32);
      if (!v89)
      {
        uint64_t v90 = v57 + 984 * v54;
        uint64_t v92 = *(void *)(v90 + 32);
        uint64_t v91 = (size_t *)(v90 + 32);
        if (v92)
        {
          *uint32_t v88 = 0LL;
          uint64_t v93 = v57 + 984 * v54;
          uint64_t v96 = *(const void **)(v93 + 48);
          int v95 = (void **)(v93 + 48);
          uint64_t v94 = v96;
          __AAArchiveStream sa = v91;
          size_t v97 = *v91;
          if ((*v91 & 0x8000000000000000LL) == 0)
          {
            uint64_t v285 = v95;
            v293 = v26;
            uint64_t v98 = v57 + 984 * v59;
            size_t v101 = *(void *)(v98 + 40);
            uint64_t v99 = (size_t *)(v98 + 40);
            size_t v100 = v101;
            if (v101 >= v97)
            {
LABEL_88:
              uint64_t v106 = *(void *)(v57 + 984 * v59 + 48);
              if (v94)
              {
                memcpy((void *)(v106 + *v88), v94, v97);
                uint64_t v26 = v293;
              }

              else
              {
                uint64_t v26 = v293;
                if (v106) {
                  memset_s((void *)(v106 + *v88), v97, 0, v97);
                }
              }

              *v88 += v97;
            }

            else
            {
              do
              {
                while (!v100)
                {
                  size_t v100 = 0x4000LL;
                  if (v97 <= 0x4000)
                  {
                    uint64_t v273 = v99;
                    size_t v277 = v94;
                    BOOL v103 = (void **)(v57 + 984 * v59 + 48);
                    size_t v100 = 0x4000LL;
                    goto LABEL_86;
                  }
                }

                size_t v102 = v100 >> 1;
                if ((v100 & (v100 >> 1)) != 0) {
                  size_t v102 = v100 & (v100 >> 1);
                }
                v100 += v102;
              }

              while (v100 < v97);
              BOOL v103 = (void **)(v57 + 984 * v59 + 48);
              if (v100 >= 0x2000000001LL)
              {
                uint64_t v104 = (void **)(v57 + 984 * v59 + 48);
                *__error() = 12;
                goto LABEL_94;
              }

              uint64_t v273 = v99;
              size_t v277 = v94;
LABEL_86:
              uint64_t v281 = v103;
              ssize_t v269 = *v103;
              int v105 = realloc(*v103, v100);
              if (v105)
              {
                uint64_t v94 = v277;
                *uint64_t v281 = v105;
                *uint64_t v273 = v100;
                goto LABEL_88;
              }

              uint64_t v104 = v281;
              free(v269);
LABEL_94:
              *uint64_t v104 = 0LL;
              *uint32_t v88 = 0LL;
              v88[1] = 0LL;
              uint64_t v26 = v293;
            }

            int v95 = v285;
          }

          free(*v95);
          memset_s(__sa, 0x18uLL, 0, 0x18uLL);
          int v38 = v297;
        }
      }

      uint64_t v107 = v57 + 984 * v59;
      uint64_t v109 = *(void *)(v107 + 80);
      int v108 = (void *)(v107 + 80);
      if (!v109)
      {
        uint64_t v110 = v57 + 984 * v54;
        uint64_t v112 = *(void *)(v110 + 80);
        AAFieldKey v111 = (size_t *)(v110 + 80);
        if (v112)
        {
          *int v108 = 0LL;
          uint64_t v113 = v57 + 984 * v54;
          AAFieldKey v116 = *(const void **)(v113 + 96);
          size_t v115 = (void **)(v113 + 96);
          size_t v114 = v116;
          __AAArchiveStream sb = v111;
          size_t v117 = *v111;
          if ((*v111 & 0x8000000000000000LL) == 0)
          {
            __int16 v286 = v115;
            uint32_t v294 = v26;
            uint64_t v118 = v57 + 984 * v59;
            size_t v121 = *(void *)(v118 + 88);
            uint64_t v119 = (size_t *)(v118 + 88);
            size_t v120 = v121;
            if (v121 >= v117)
            {
LABEL_113:
              uint64_t v126 = *(void *)(v57 + 984 * v59 + 96);
              if (v114)
              {
                memcpy((void *)(v126 + *v108), v114, v117);
                uint64_t v26 = v294;
              }

              else
              {
                uint64_t v26 = v294;
                if (v126) {
                  memset_s((void *)(v126 + *v108), v117, 0, v117);
                }
              }

              *v108 += v117;
            }

            else
            {
              do
              {
                while (!v120)
                {
                  size_t v120 = 0x4000LL;
                  if (v117 <= 0x4000)
                  {
                    uint64_t v274 = v119;
                    uint64_t v278 = v114;
                    AAFieldKey v123 = (void **)(v57 + 984 * v59 + 96);
                    size_t v120 = 0x4000LL;
                    goto LABEL_111;
                  }
                }

                size_t v122 = v120 >> 1;
                if ((v120 & (v120 >> 1)) != 0) {
                  size_t v122 = v120 & (v120 >> 1);
                }
                v120 += v122;
              }

              while (v120 < v117);
              AAFieldKey v123 = (void **)(v57 + 984 * v59 + 96);
              if (v120 >= 0x2000000001LL)
              {
                uint32_t v124 = (void **)(v57 + 984 * v59 + 96);
                *__error() = 12;
                goto LABEL_119;
              }

              uint64_t v274 = v119;
              uint64_t v278 = v114;
LABEL_111:
              uint64_t v282 = v123;
              v270 = *v123;
              AAFieldKey v125 = realloc(*v123, v120);
              if (v125)
              {
                size_t v114 = v278;
                *uint64_t v282 = v125;
                *uint64_t v274 = v120;
                goto LABEL_113;
              }

              uint32_t v124 = v282;
              free(v270);
LABEL_119:
              *uint32_t v124 = 0LL;
              *int v108 = 0LL;
              v108[1] = 0LL;
              uint64_t v26 = v294;
            }

            size_t v115 = v286;
          }

          free(*v115);
          memset_s(__sb, 0x18uLL, 0, 0x18uLL);
          int v38 = v297;
        }
      }

      uint64_t v127 = v57 + 984 * v59;
      uint64_t v129 = *(void *)(v127 + 104);
      AAFieldKey v128 = (void *)(v127 + 104);
      if (!v129)
      {
        uint64_t v130 = v57 + 984 * v54;
        uint64_t v132 = *(void *)(v130 + 104);
        AAFieldKey v131 = (size_t *)(v130 + 104);
        if (v132)
        {
          *AAFieldKey v128 = 0LL;
          uint64_t v133 = v57 + 984 * v54;
          uint64_t v136 = *(const void **)(v133 + 120);
          char v135 = (void **)(v133 + 120);
          AAFieldKey v134 = v136;
          __sCC_SHA1_CTX c = v131;
          size_t v137 = *v131;
          if ((*v131 & 0x8000000000000000LL) == 0)
          {
            v287 = v135;
            BOOL v295 = v26;
            uint64_t v138 = v57 + 984 * v59;
            size_t v141 = *(void *)(v138 + 112);
            timespec v139 = (size_t *)(v138 + 112);
            size_t v140 = v141;
            if (v141 >= v137)
            {
LABEL_138:
              uint64_t v146 = *(void *)(v57 + 984 * v59 + 120);
              if (v134)
              {
                memcpy((void *)(v146 + *v128), v134, v137);
                uint64_t v26 = v295;
              }

              else
              {
                uint64_t v26 = v295;
                if (v146) {
                  memset_s((void *)(v146 + *v128), v137, 0, v137);
                }
              }

              *v128 += v137;
            }

            else
            {
              do
              {
                while (!v140)
                {
                  size_t v140 = 0x4000LL;
                  if (v137 <= 0x4000)
                  {
                    uint64_t v275 = v139;
                    uint64_t v279 = v134;
                    uint64_t v143 = (void **)(v57 + 984 * v59 + 120);
                    size_t v140 = 0x4000LL;
                    goto LABEL_136;
                  }
                }

                size_t v142 = v140 >> 1;
                if ((v140 & (v140 >> 1)) != 0) {
                  size_t v142 = v140 & (v140 >> 1);
                }
                v140 += v142;
              }

              while (v140 < v137);
              uint64_t v143 = (void **)(v57 + 984 * v59 + 120);
              if (v140 >= 0x2000000001LL)
              {
                char v144 = (void **)(v57 + 984 * v59 + 120);
                *__error() = 12;
                goto LABEL_144;
              }

              uint64_t v275 = v139;
              uint64_t v279 = v134;
LABEL_136:
              uint64_t v283 = v143;
              uint64_t v271 = *v143;
              uint64_t v145 = realloc(*v143, v140);
              if (v145)
              {
                AAFieldKey v134 = v279;
                *uint64_t v283 = v145;
                *uint64_t v275 = v140;
                goto LABEL_138;
              }

              char v144 = v283;
              free(v271);
LABEL_144:
              *char v144 = 0LL;
              *AAFieldKey v128 = 0LL;
              v128[1] = 0LL;
              uint64_t v26 = v295;
            }

            char v135 = v287;
          }

          free(*v135);
          memset_s(__sc, 0x18uLL, 0, 0x18uLL);
          int v38 = v297;
        }
      }

      uint64_t v147 = v57 + 984 * v59;
      int v149 = *(_DWORD *)(v147 + 136);
      uint64_t v148 = v147 + 136;
      if (!v149)
      {
        uint64_t v150 = v57 + 984 * v54;
        int v152 = *(_DWORD *)(v150 + 136);
        uint64_t v151 = v150 + 136;
        if (v152)
        {
          *(_OWORD *)uint64_t v148 = *(_OWORD *)v151;
          __int128 v153 = *(_OWORD *)(v151 + 16);
          __int128 v154 = *(_OWORD *)(v151 + 32);
          __int128 v155 = *(_OWORD *)(v151 + 48);
          *(void *)(v148 + 64) = *(void *)(v151 + 64);
          *(_OWORD *)(v148 + 32) = v154;
          *(_OWORD *)(v148 + 48) = v155;
          *(_OWORD *)(v148 + 16) = v153;
        }
      }

      uint64_t v156 = v57 + 984 * v59;
      int v158 = *(_DWORD *)(v156 + 208);
      uint64_t v157 = v156 + 208;
      uint64_t v29 = v299;
      if (!v158)
      {
        uint64_t v159 = v57 + 984 * v54;
        int v161 = *(_DWORD *)(v159 + 208);
        uint64_t v160 = (__int128 *)(v159 + 208);
        if (v161)
        {
          __int128 v162 = *v160;
          __int128 v163 = v160[1];
          __int128 v164 = v160[2];
          *(void *)(v157 + 48) = *((void *)v160 + 6);
          *(_OWORD *)(v157 + 16) = v163;
          *(_OWORD *)(v157 + 32) = v164;
          *(_OWORD *)uint64_t v157 = v162;
        }
      }

      uint64_t v165 = v57 + 984 * v59;
      uint64_t v167 = *(void *)(v165 + 128);
      AAHeader v166 = (void *)(v165 + 128);
      if (v167 == -1) {
        *AAHeader v166 = *(void *)(v57 + 984 * v54 + 128);
      }
LABEL_56:
      ++v54;
      v56 += 984LL;
    }

    while (v54 < *(void *)(v13 + 72));
LABEL_156:
    *(void *)(v13 + 72) = v55;
    free(v309);
    AAArchiveStreamClose((AAArchiveStream)v31);
    AAArchiveStreamClose(s);
    AAArchiveStreamClose(v306);
    AAFieldKeySetDestroy(v38);
    uint64_t v27 = v300 + 1;
    uint64_t v28 = v296;
  }

  while ((unint64_t)(v300 + 1) < *(void *)(v13 + 56));
LABEL_157:
  AAArchiveStreamClose(0LL);
  AAArchiveStreamClose(0LL);
  AAArchiveStreamClose(0LL);
  AAFieldKeySetDestroy(0LL);
  AAFieldKeySetDestroy(v26);
  uint64_t v172 = *(void *)(v13 + 72);
  if (v172)
  {
    unint64_t v173 = *(unsigned int **)(v13 + 80);
    do
    {
      if (v173[18 * *(void *)(v13 + 56) + 48] == 70 && *((void *)v173 + 16) != -1LL)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"AAAssetBuilderGenerate",  1562,  27,  0,  "HLC field found, not supported: %s",  v170,  v171,  *(_BYTE *)(*(void *)(v13 + 32) + 32LL) + *(_BYTE *)(*(void *)(*(void *)(v13 + 32) + 8LL) + 16LL * *v173));
        goto LABEL_201;
      }

      v173 += 246;
      --v172;
    }

    while (v172);
  }

  int v310 = -1;
  *(_DWORD *)(v13 + 88) = 1;
  if ((StringTableAppend(*(unsigned int **)(v13 + 40), "main", 4uLL, &v310, v168, v169, v170, v171) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateAssignLabels",  913,  27,  0,  "string table",  v177,  v178,  v266);
    uint64_t v208 = "assigning labels";
    __int16 v209 = 1568;
    goto LABEL_209;
  }

  unint64_t v179 = *(void *)(v13 + 72);
  if (v179)
  {
    uint64_t v180 = (int *)(*(void *)(v13 + 80) + 4LL);
    do
    {
      *uint64_t v180 = v310;
      v180 += 246;
      --v179;
    }

    while (v179);
    unint64_t v179 = *(void *)(v13 + 72);
  }

  if (*(_DWORD *)(v13 + 24))
  {
    if (v179)
    {
      unint64_t v181 = 0LL;
      uint64_t v182 = 0LL;
      uint64_t v183 = 0LL;
      uint64_t v184 = 0LL;
      uint64_t v185 = *(void *)(v13 + 56) - 1LL;
      uint64_t v186 = 264LL;
      uint64_t v187 = (FILE **)MEMORY[0x1895F89D0];
      uint64_t v298 = v185;
      do
      {
        uint64_t v188 = *(void *)(v13 + 80);
        int v189 = *(_DWORD *)(v188 + 984 * v181 + 72 * v185 + 264);
        if (v189) {
          ++v183;
        }
        if (v189 == 70) {
          uint64_t v182 = (AAArchiveStream_impl *)((char *)v182 + 1);
        }
        if (v189 == 68) {
          ++v184;
        }
        if (*(_DWORD *)(v13 + 24) >= 2u)
        {
          uint64_t v301 = v183;
          AAArchiveStream sa = v182;
          uint64_t v307 = v184;
          if (!v181) {
            fwrite("All entries:\n", 0xDuLL, 1uLL, *v187);
          }
          if (*(void *)(v13 + 56))
          {
            unint64_t v190 = 0LL;
            uint64_t v191 = (int *)(v188 + v186);
            do
            {
              int v193 = *v191;
              v191 += 18;
              LODWORD(v192) = v193;
              if ((_BYTE)v193) {
                uint64_t v192 = v192;
              }
              else {
                uint64_t v192 = 45LL;
              }
              fprintf(*v187, " %c", v192);
              ++v190;
            }

            while (v190 < *(void *)(v13 + 56));
          }

          fprintf( *v187,  " lbl=%s",  (const char *)(*(void *)(*(void *)(v13 + 40) + 32LL)
                         + *(void *)(*(void *)(*(void *)(v13 + 40) + 8LL)
                                     + 16LL * *(unsigned int *)(v188 + 984 * v181 + 4))));
          if (v189 == 70)
          {
            uint64_t v185 = v298;
            fprintf( *v187,  " siz=%llu yec=%zu",  *(void *)(v188 + 984 * v181 + 72 * v298 + 280),  *(void *)(v188 + 984 * v181 + 32));
            uint64_t v184 = v307;
          }

          else
          {
            uint64_t v184 = v307;
            uint64_t v185 = v298;
            if (v189 == 76) {
              fprintf(*v187, " lnk=%s", *(const char **)(v188 + 984 * v181 + 72));
            }
          }

          fprintf( *v187,  " pat=%s",  (const char *)(*(void *)(*(void *)(v13 + 32) + 32LL)
                         + *(void *)(*(void *)(*(void *)(v13 + 32) + 8LL)
                                     + 16LL * *(unsigned int *)(v188 + 984 * v181))));
          fputc(10, *v187);
          unint64_t v179 = *(void *)(v13 + 72);
          uint64_t v183 = v301;
          uint64_t v182 = sa;
        }

        ++v181;
        v186 += 984LL;
      }

      while (v181 < v179);
    }

    else
    {
      uint64_t v184 = 0LL;
      uint64_t v183 = 0LL;
      uint64_t v182 = 0LL;
    }

    uint64_t v210 = (FILE **)MEMORY[0x1895F89D0];
    __int16 v211 = v182;
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%12zu entries in output\n", v183);
    fprintf(*v210, "%12zu regular files\n", (size_t)v211);
    fprintf(*v210, "%12zu directories\n", v184);
    unint64_t v179 = *(void *)(v13 + 72);
  }

  if (!v179)
  {
LABEL_263:
    unsigned int v240 = 0LL;
    goto LABEL_264;
  }

  unint64_t v212 = 0LL;
  uint64_t v308 = *(void *)(v13 + 56);
  uint64_t v213 = v308 - 1;
  uint64_t v214 = 264LL;
  uint64_t v215 = 304LL;
  uint64_t v216 = 280LL;
  while (2)
  {
    uint64_t v217 = *(void *)(v13 + 80);
    uint64_t v218 = (unsigned int *)(v217 + 984 * v212);
    uint64_t v219 = *(void *)(v13 + 32);
    uint64_t v220 = *(void *)(v219 + 32);
    uint64_t v221 = *(void *)(*(void *)(v219 + 8) + 16LL * *v218);
    unsigned int v222 = v218[18 * v213 + 66];
    if (!v222)
    {
      unsigned int v232 = *(_DWORD *)(v13 + 24);
      int v233 = 2;
      AAFieldKey v234 = "REMOVE (not in output): %s\n";
      goto LABEL_251;
    }

    uint64_t v223 = *(void *)(v13 + 48);
    if (!v223)
    {
      unsigned int v232 = *(_DWORD *)(v13 + 24);
      int v233 = 3;
      AAFieldKey v234 = "ARCHIVE (full replacement): %s\n";
      goto LABEL_251;
    }

    if (v222 != 70)
    {
      unsigned int v232 = *(_DWORD *)(v13 + 24);
      int v233 = 3;
      AAFieldKey v234 = "ARCHIVE (not a regular file): %s\n";
LABEL_251:
      if (v232 <= 1) {
        goto LABEL_253;
      }
      goto LABEL_252;
    }

    uint64_t v224 = (int *)(v217 + v214);
    uint64_t v225 = *(void *)(v13 + 48);
    do
    {
      int v226 = *v224;
      v224 += 18;
      if (v226 != 70)
      {
        unsigned int v232 = *(_DWORD *)(v13 + 24);
        int v233 = 3;
        AAFieldKey v234 = "ARCHIVE (different type/missing in some inputs): %s\n";
        goto LABEL_251;
      }

      --v225;
    }

    while (v225);
    unint64_t v227 = (void *)(v217 + v215);
    uint64_t v228 = *(void *)(v13 + 48);
    while (1)
    {
      uint64_t v174 = v227[3];
      uint64_t v175 = *(void *)(v217 + 984 * v212 + 72 * v213 + 320);
      uint64_t v176 = *(void *)(v217 + 984 * v212 + 72 * v213 + 328);
      BOOL v229 = *v227 == *(void *)(v217 + 984 * v212 + 72 * v213 + 304)
          && v227[1] == *(void *)(v217 + 984 * v212 + 72 * v213 + 312);
      BOOL v230 = v229 && v227[2] == v175;
      if (!v230 || v174 != v176) {
        break;
      }
      v227 += 9;
      if (!--v228)
      {
        unsigned int v232 = *(_DWORD *)(v13 + 24);
        int v233 = 1;
        AAFieldKey v234 = "COPY: %s\n";
        goto LABEL_251;
      }
    }

    uint32_t v235 = (uint64_t *)(v217 + v216);
    do
    {
      uint64_t v236 = *v235;
      v235 += 9;
      if (!v236)
      {
        unsigned int v232 = *(_DWORD *)(v13 + 24);
        int v233 = 3;
        AAFieldKey v234 = "ARCHIVE (empty in some inputs): %s\n";
        goto LABEL_251;
      }

      --v223;
    }

    while (v223);
    if (*(void *)(v217 + 984 * v212 + 72 * v213 + 280) >= *(void *)(*(void *)(v13 + 8) + 104LL)) {
      AAFieldKey v234 = "PATCH: %s\n";
    }
    else {
      AAFieldKey v234 = "ARCHIVE (too small for patching): %s\n";
    }
    if (*(void *)(v217 + 984 * v212 + 72 * v213 + 280) < *(void *)(*(void *)(v13 + 8) + 104LL)) {
      int v233 = 3;
    }
    else {
      int v233 = 4;
    }
    if (*(_DWORD *)(v13 + 24) >= 2u)
    {
LABEL_252:
      fprintf((FILE *)*MEMORY[0x1895F89D0], v234, v174, v175, v176, v220 + v221);
      unint64_t v179 = *(void *)(v13 + 72);
    }

LABEL_253:
    uint64_t v237 = v217 + 984 * v212++;
    *(_DWORD *)(v237 + 8) = v233;
    v214 += 984LL;
    v215 += 984LL;
    v216 += 984LL;
    if (v212 < v179) {
      continue;
    }
    break;
  }

  if (!v179) {
    goto LABEL_263;
  }
  size_t v238 = 0LL;
  uint64_t v239 = *(void *)(v13 + 80) + 192LL;
  do
  {
    if (*(_DWORD *)(v239 + 72 * v308) == 70 && *(void *)(v239 - 64) != -1LL) {
      ++v238;
    }
    v239 += 984LL;
    --v179;
  }

  while (v179);
  if (!v238) {
    goto LABEL_263;
  }
  if (v238 > 0x400000000LL)
  {
    *__error() = 12;
    goto LABEL_298;
  }

  AAFieldKey v248 = (AAArchiveStream_impl *)calloc(v238, 8uLL);
  if (v248)
  {
    unsigned int v240 = v248;
    unint64_t v250 = *(void *)(v13 + 72);
    uint32_t v249 = *(char **)(v13 + 80);
    if (v250)
    {
      uint64_t v251 = 0LL;
      unint64_t v252 = 0LL;
      uint64_t v253 = v249 + 192;
      do
      {
        if (*(_DWORD *)&v253[72 * v308] == 70 && *((void *)v253 - 8) != -1LL)
        {
          *((void *)v248 + v251++) = v252;
          unint64_t v250 = *(void *)(v13 + 72);
        }

        ++v252;
        v253 += 984;
      }

      while (v252 < v250);
    }

    qsort_r(v248, v238, 8uLL, v249, (int (__cdecl *)(void *, const void *, const void *))entryIndexCmpHLC);
    size_t v254 = 0LL;
    uint64_t v255 = -(uint64_t)v238;
    uint64_t v302 = (char *)v240 + 8;
    AAArchiveStream sb = v240;
    do
    {
      size_t v256 = v254 + 1;
      if (v254 + 1 < v238)
      {
        unint64_t v257 = 1LL;
        while (*(void *)(*(void *)(v13 + 80) + 984LL * *((void *)v240 + v254 + v257) + 128) == *(void *)(*(void *)(v13 + 80) + 984LL * *((void *)v240 + v254) + 128))
        {
          ++v257;
          if (!(v255 + v254 + v257))
          {
            unint64_t v257 = v238 - v254;
            size_t v256 = v238;
            goto LABEL_290;
          }
        }

        size_t v256 = v254 + v257;
LABEL_290:
        if (v257 >= 2)
        {
          unint64_t v258 = v257 - 1;
          uint64_t v259 = &v302[8 * v254];
          do
          {
            uint64_t v260 = *(void *)(v13 + 80);
            uint64_t v262 = *(void *)v259;
            v259 += 8;
            uint64_t v261 = v262;
            if (*(_DWORD *)(v13 + 24) >= 2u) {
              fprintf( (FILE *)*MEMORY[0x1895F89D0],  "FIXUP (hard linked): %s\n",  (const char *)(*(void *)(*(void *)(v13 + 32) + 32LL)
            }
                             + *(void *)(*(void *)(*(void *)(v13 + 32) + 8LL)
                                         + 16LL * *(unsigned int *)(v260 + 984 * v261))));
            *(_DWORD *)(v260 + 984 * v261 + 8) = 5;
            --v258;
          }

          while (v258);
          unsigned int v240 = sb;
          uint64_t v255 = -(uint64_t)v238;
        }
      }

      size_t v254 = v256;
    }

    while (v256 < v238);
LABEL_264:
    free(v240);
    if ((stateComputePatches(v13) & 0x80000000) != 0)
    {
      uint64_t v208 = "compute patches";
      __int16 v209 = 1601;
    }

    else
    {
      if ((stateGenerateArchive(v13) & 0x80000000) == 0)
      {
        uint64_t v202 = 0LL;
        goto LABEL_202;
      }

      uint64_t v208 = "generate archive";
      __int16 v209 = 1602;
    }
  }

  else
  {
LABEL_298:
    uint64_t v263 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateInitOps",  1029,  27,  *v263,  "malloc",  v264,  v265,  v266);
    uint64_t v208 = "init ops";
    __int16 v209 = 1600;
  }

LABEL_209:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"AAAssetBuilderGenerate",  v209,  27,  0,  v208,  v206,  v207,  v266);
LABEL_201:
  uint64_t v202 = 0xFFFFFFFFLL;
LABEL_202:
  stateDestroy_0(v13);
  return v202;
}

            if (v149 != v148) {
              break;
            }
            v143 += v148;
            size_t v142 = v279 - v148;
            uint64_t v20 = v279 == v148;
            v279 -= v148;
            BOOL v10 = header;
            if (v20) {
              goto LABEL_212;
            }
          }

          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateStreamEntryBlob",  781,  27,  0,  "write blob to stream",  v146,  v147,  v248);
          uint64_t v19 = v274;
          BOOL v10 = header;
LABEL_333:
          char v135 = v252;
          goto LABEL_358;
        }

uint64_t stateComputePatches(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  size_t v3 = *(unsigned int *)(a1 + 20);
  if (*(_DWORD *)(a1 + 24)) {
    fwrite("Computing patches...\n", 0x15uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  }
  uint64_t v4 = (void **)calloc(v3, 8uLL);
  uint64_t v5 = v4;
  if (!v4)
  {
    int v37 = *__error();
    __int16 v40 = 1072;
    goto LABEL_28;
  }

  if ((_DWORD)v3)
  {
    size_t v6 = v3;
    uint64_t v7 = v4;
    while (1)
    {
      uint64_t v8 = malloc(0x10uLL);
      *uint64_t v7 = v8;
      if (!v8) {
        break;
      }
      ++v7;
      if (!--v6) {
        goto LABEL_8;
      }
    }

    int v37 = *__error();
    __int16 v40 = 1076;
LABEL_28:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateComputePatches",  v40,  27,  v37,  "malloc",  v38,  v39,  v48[0]);
    uint64_t v16 = 0LL;
    goto LABEL_35;
  }

uint64_t stateGenerateArchive(uint64_t a1)
{
  uint64_t v281 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 56);
  size_t v3 = *(uint64_t **)(a1 + 8);
  uint64_t v4 = v3[16];
  uint64_t v5 = *v3;
  if (*(_DWORD *)(a1 + 24))
  {
    fwrite("Generating asset...\n", 0x14uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    size_t v3 = *(uint64_t **)(a1 + 8);
  }

  AAByteStream ostream = (AAByteStream)AATempStreamOpen(v3[14]);
  if (!ostream)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1159,  27,  0,  "AATempStreamOpen",  v6,  v7,  v248);
    uint64_t v19 = 0LL;
    uint64_t v10 = 0LL;
LABEL_315:
    uint64_t v16 = 0LL;
    uint64_t v13 = 0LL;
LABEL_316:
    uint64_t v217 = 0LL;
    uint64_t v218 = 0LL;
    uint64_t v216 = 0LL;
    uint64_t v24 = 0LL;
LABEL_317:
    uint64_t v159 = 0LL;
LABEL_318:
    uint64_t v224 = 0xFFFFFFFFLL;
    goto LABEL_319;
  }

  uint64_t v10 = AAHeaderCreate();
  if (!v10)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1161,  27,  0,  "AAHeaderCreate",  v8,  v9,  v248);
    uint64_t v19 = 0LL;
    goto LABEL_315;
  }

  uint64_t v13 = AAFieldKeySetCreateWithString("IDX,IDZ,SIZ");
  if (!v13)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1163,  27,  0,  "AAFieldKeySetCreateWithString",  v11,  v12,  v248);
    uint64_t v19 = 0LL;
    uint64_t v16 = 0LL;
    goto LABEL_316;
  }

  uint64_t v16 = AAFieldKeySetCreateWithString("DAT,YEC,UID,GID,FLG,AFT,AFR");
  if (!v16)
  {
    int v226 = "AAFieldKeySetCreateWithString";
    __int16 v227 = 1165;
    int v228 = 0;
LABEL_325:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  v227,  27,  v228,  v226,  v14,  v15,  v248);
    uint64_t v19 = 0LL;
    goto LABEL_316;
  }

  uint64_t v274 = malloc(0x10000uLL);
  if (!v274)
  {
    int v228 = *__error();
    int v226 = "malloc";
    __int16 v227 = 1167;
    goto LABEL_325;
  }

  if (!*(_DWORD *)(a1 + 88))
  {
LABEL_304:
    uint64_t v159 = (AAByteStream *)subArchiveCreate(*(void *)(*(void *)(a1 + 8) + 112LL), 0, 0LL, 0);
    if (v159)
    {
      uint64_t v19 = v274;
      if (AAByteStreamSeek(ostream, 0LL, 0) < 0)
      {
        uint32_t v231 = "seek";
        __int16 v232 = 1500;
        goto LABEL_329;
      }

      uint64_t v215 = v159[4];
      if (!v215) {
        uint64_t v215 = v159[3];
      }
      uint64_t v216 = AAEncodeArchiveOutputStreamOpen(v215, 0LL, 0LL, 0LL, *(_DWORD *)(a1 + 20));
      uint64_t v217 = AAConvertArchiveOutputStreamOpen(v216, v13, v16, 0LL, 0LL, 0LL, *(_DWORD *)(a1 + 20));
      uint64_t v218 = AADecodeArchiveInputStreamOpen(ostream, 0LL, 0LL, 0x100uLL, *(_DWORD *)(a1 + 20));
      if (AAArchiveStreamProcess(v218, v217, 0LL, 0LL, 0LL, *(_DWORD *)(a1 + 20)) < 0)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1507,  27,  0,  "processing manifest",  v219,  v220,  v248);
        goto LABEL_335;
      }

      AAArchiveStreamClose(v218);
      AAArchiveStreamClose(v217);
      AAArchiveStreamClose(v216);
      uint64_t v221 = *(AAByteStream_impl **)a1;
      AAByteStreamClose(v159[4]);
      v159[4] = 0LL;
      if ((encodeYOPEntry(v221, 0x4Du, 0LL, 0LL, v159[3]) & 0x80000000) == 0)
      {
        subArchiveDestroy(v159);
        uint64_t v19 = v274;
        if (AAByteStreamSeek(ostream, 0LL, 0) < 0)
        {
          uint64_t v239 = "seek";
          __int16 v240 = 1520;
        }

        else
        {
          if ((AAByteStreamProcess(ostream, *(AAByteStream *)a1) & 0x8000000000000000LL) == 0)
          {
            uint64_t v217 = 0LL;
            uint64_t v218 = 0LL;
            uint64_t v216 = 0LL;
            uint64_t v24 = 0LL;
            uint64_t v159 = 0LL;
            uint64_t v224 = 0LL;
            goto LABEL_319;
          }

          uint64_t v239 = "writing archive";
          __int16 v240 = 1521;
        }

        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  v240,  27,  0,  v239,  v222,  v223,  v248);
        goto LABEL_316;
      }

      BOOL v229 = "encode entry";
      __int16 v230 = 1514;
    }

    else
    {
      BOOL v229 = "sub_asset";
      __int16 v230 = 1498;
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  v230,  27,  0,  v229,  v213,  v214,  v248);
    uint64_t v217 = 0LL;
    uint64_t v218 = 0LL;
    uint64_t v216 = 0LL;
LABEL_335:
    uint64_t v24 = 0LL;
    uint64_t v224 = 0xFFFFFFFFLL;
    uint64_t v19 = v274;
    goto LABEL_319;
  }

  uint64_t v17 = 0LL;
  header = v10;
  uint64_t v276 = v2 - 1;
  char v255 = v5;
  uint64_t v256 = v4 != 0;
  uint64_t v272 = v13;
  uint64_t v273 = v16;
  uint64_t v262 = v4;
  BOOL v261 = v4 != 0;
LABEL_10:
  unsigned int v18 = 0;
  uint64_t v251 = v17;
  uint64_t v19 = v274;
  while (v18 <= 3 && !*(void *)(a1 + 48))
  {
LABEL_302:
    if (++v18 == 10)
    {
      uint64_t v17 = v251 + 1;
      goto LABEL_10;
    }
  }

  unsigned int v271 = v18;
  uint64_t v21 = (AAByteStream *)subArchiveCreate( *(void *)(*(void *)(a1 + 8) + 112LL),  *(_DWORD *)(*(void *)(a1 + 8) + 136LL),  *(void *)(*(void *)(a1 + 8) + 144LL),  *(_DWORD *)(a1 + 20));
  uint64_t v24 = v21;
  if (!v21)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1190,  27,  0,  "subArchiveCreate",  v22,  v23,  v248);
    uint64_t v217 = 0LL;
    uint64_t v218 = 0LL;
    uint64_t v216 = 0LL;
    goto LABEL_317;
  }

  unint64_t v25 = *(void *)(a1 + 72);
  if (!v25)
  {
LABEL_301:
    AAByteStreamClose(v24[4]);
    AAByteStreamClose(v24[3]);
    free(v24);
    unsigned int v18 = v271;
    goto LABEL_302;
  }

  uint64_t v263 = v21;
  uint64_t v270 = 0LL;
  int v26 = 0;
  unsigned int v27 = 0;
  unint64_t v258 = 0LL;
  unint64_t v28 = 0LL;
  uint64_t v29 = ostream;
  unsigned int v30 = v271;
  while (2)
  {
    unint64_t v31 = v25 + ~v28;
    if (v20) {
      unint64_t v32 = v31;
    }
    else {
      unint64_t v32 = v28;
    }
    uint64_t v13 = *(AAFieldKeySet_impl **)(a1 + 80);
    unint64_t v33 = (unsigned int *)((char *)v13 + 984 * v32);
    uint64_t v35 = v33[18 * v276 + 66];
    switch(v30)
    {
      case 0u:
        if ((_DWORD)v35 != 70)
        {
          unsigned int v27 = 73;
          int v26 = 1;
          goto LABEL_156;
        }

        int v36 = *((_DWORD *)v13 + 246 * v32 + 2);
        int v26 = 1;
        if (v36 != 1 && v36 != 4)
        {
          unsigned int v27 = 73;
          goto LABEL_156;
        }

        uint64_t v38 = v35;
        int buf = 1;
        goto LABEL_35;
      case 1u:
        int v39 = *((_DWORD *)v13 + 246 * v32 + 2);
        uint64_t v13 = v272;
        uint64_t v16 = v273;
        if (v39 == 2 || v39 == 3 && (_DWORD)v35 != 68)
        {
          if (v262)
          {
            uint64_t v92 = (uint64_t)v263[4];
            if (!v92) {
              uint64_t v92 = (uint64_t)v263[3];
            }
            if ((encodeEntry(v92, v35, v34) & 0x80000000) == 0)
            {
              ++v270;
              unsigned int v27 = 82;
LABEL_104:
              int v26 = 1;
LABEL_242:
              unsigned int v30 = v271;
              goto LABEL_243;
            }

            uint64_t v244 = "encode entry";
            __int16 v245 = 1336;
LABEL_379:
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  v245,  27,  0,  v244,  v65,  v66,  v248);
            uint64_t v217 = 0LL;
            uint64_t v218 = 0LL;
            uint64_t v216 = 0LL;
            uint64_t v24 = 0LL;
            uint64_t v224 = 0xFFFFFFFFLL;
            goto LABEL_361;
          }

          unsigned int v27 = 82;
          if ((encodeYOPEntry(v29, 0x52u, v34, __s, 0LL) & 0x80000000) != 0)
          {
            uint64_t v244 = "encode entry";
            __int16 v245 = 1341;
            goto LABEL_379;
          }

LABEL_149:
          int v26 = 0;
          goto LABEL_242;
        }

        unsigned int v27 = 82;
LABEL_233:
        int v26 = v261;
LABEL_243:
        ++v28;
        unint64_t v25 = *(void *)(a1 + 72);
        BOOL v20 = v28 == v25;
        if (v28 >= v25)
        {
          uint64_t v24 = v263;
          if (!v26) {
            goto LABEL_301;
          }
          if (!v270) {
            goto LABEL_301;
          }
          AAByteStreamClose(v263[4]);
          v263[4] = 0LL;
          if ((encodeYOPEntry(ostream, v27, 0LL, __s, v263[3]) & 0x80000000) == 0) {
            goto LABEL_301;
          }
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1488,  27,  0,  "encode entry",  v211,  v212,  v248);
          uint64_t v217 = 0LL;
          uint64_t v159 = v263;
          goto LABEL_330;
        }

        continue;
      case 2u:
        if (*((_DWORD *)v13 + 246 * v32 + 2) != 4) {
          goto LABEL_156;
        }
        if (v27 == 79) {
          goto LABEL_89;
        }
        int buf = v26;
        if (v27 == 73)
        {
          uint64_t v38 = v33[18 * v276 + 66];
LABEL_35:
          int v40 = AAHeaderClear(v10);
          v41.iint key = 5265748;
          int v42 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v41, v38);
          size_t v43 = strlen(v34);
          v44.iint key = 5521744;
          BOOL v47 = (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v44, v34, v43) | v42 | v40) >= 0;
          unint64_t v48 = *(void *)(a1 + 48);
          if (v48)
          {
            for (unint64_t i = 0LL; i < v48; ++i)
            {
              if (*((_DWORD *)v13 + 246 * v32 + 18 * i + 66) == 70)
              {
                if (i)
                {
                  size_t v50 = (void *)((char *)v13 + 984 * v32 + 304);
                  unint64_t v51 = i;
                  while (1)
                  {
                    if (*((_DWORD *)v50 - 10) == 70)
                    {
                      BOOL v52 = *v50 == *((void *)v13 + 123 * v32 + 9 * i + 38)
                         && v50[1] == *((void *)v13 + 123 * v32 + 9 * i + 39);
                      BOOL v53 = v52 && v50[2] == *((void *)v13 + 123 * v32 + 9 * i + 40);
                      if (v53 && v50[3] == *((void *)v13 + 123 * v32 + 9 * i + 41)) {
                        break;
                      }
                    }

                    v50 += 9;
                    if (!--v51) {
                      goto LABEL_52;
                    }
                  }
                }

                else
                {
LABEL_52:
                  v55.iint key = 3295315;
                  if (AAHeaderSetFieldHash( header,  0xFFFFFFFF,  v55,  3u,  (const uint8_t *)v13 + 984 * v32 + 72 * i + 304) < 0) {
                    BOOL v47 = 0;
                  }
                  unint64_t v48 = *(void *)(a1 + 48);
                }
              }
            }
          }

          if (!v47)
          {
            uint32_t v235 = "setup header";
            __int16 v236 = 1284;
            goto LABEL_352;
          }

          uint64_t v56 = v29;
          size_t EncodedSize = AAHeaderGetEncodedSize(header);
          EncodedData = AAHeaderGetEncodedData(header);
          uint64_t v13 = v272;
          uint64_t v16 = v273;
          if (buf)
          {
            uint64_t v56 = v263[4];
            if (!v56) {
              uint64_t v56 = v263[3];
            }
          }

          if (*((void *)v56 + 3))
          {
            uint64_t v61 = 0LL;
            if (EncodedSize)
            {
              size_t v62 = EncodedSize;
              while (1)
              {
                uint64_t v63 = (*((uint64_t (**)(void, const uint8_t *, size_t))v56 + 3))( *(void *)v56,  EncodedData,  v62);
                if (v63 < 1) {
                  break;
                }
                EncodedData += v63;
                v61 += v63;
                v62 -= v63;
                if (!v62) {
                  goto LABEL_238;
                }
              }

              uint64_t v61 = v63;
            }
          }

          else
          {
            uint64_t v61 = -1LL;
          }

LABEL_238:
          if (v61 != EncodedSize)
          {
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1290,  27,  0,  "write header",  v58,  v59,  v248);
            uint64_t v217 = 0LL;
            uint64_t v218 = 0LL;
            uint64_t v216 = 0LL;
            uint64_t v24 = 0LL;
            uint64_t v224 = 0xFFFFFFFFLL;
            uint64_t v10 = header;
            goto LABEL_355;
          }

          int v26 = buf;
          uint64_t v165 = v270;
          if (buf) {
            uint64_t v165 = v270 + 1;
          }
          uint64_t v270 = v165;
          unsigned int v27 = 73;
          uint64_t v29 = ostream;
          uint64_t v19 = v274;
          uint64_t v10 = header;
          goto LABEL_242;
        }

        uint64_t v113 = (char *)v13 + 984 * v32;
        uint64_t v115 = *((void *)v113 + 3);
        uint64_t v114 = (uint64_t)(v113 + 24);
        uint64_t valueb = v114;
        if (v115)
        {
          uint64_t v24 = 0LL;
          off_t sizea = *(void *)(v114 - 8);
          goto LABEL_250;
        }

        if (snprintf(__str, 0x400uLL, "%s/0x%08zx", (const char *)(a1 + 92), v28) >= 0x400)
        {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1369,  27,  0,  "patch path: %s",  v166,  v167,  (char)v34);
        }

        else if (stat(__str, &offset) < 0 || (offset.st_mode & 0xF000) != 0x8000)
        {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1371,  27,  0,  "invalid patch: %s",  v168,  v169,  (char)__str);
        }

        else
        {
          off_t sizea = offset.st_size;
          AAByteStream v170 = AAFileStreamOpenWithPath(__str, 0, 0);
          if (v170)
          {
            uint64_t v24 = (AAByteStream *)v170;
            uint64_t v114 = valueb;
LABEL_250:
            AAHeader v253 = (AAHeader)(v114 + 112);
            int v250 = AAHeaderClear(v10);
            v173.iint key = 5265748;
            int v249 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v173, 0x4DuLL);
            v174.iint key = 5263193;
            int v175 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v174, 0x50uLL);
            size_t v176 = strlen(v34);
            v177.iint key = 5521744;
            int v178 = AAHeaderSetFieldString(v10, 0xFFFFFFFF, v177, v34, v176);
            size_t v179 = strlen(__s);
            v180.iint key = 4997708;
            BOOL v181 = (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v180, __s, v179) | v175 | v249 | v250 | v178) >= 0;
            if ((*(_BYTE *)v253 & 4) != 0)
            {
              v182.iint key = 4672582;
            }

            char v183 = *(_BYTE *)(valueb + 184);
            if ((v183 & 1) != 0)
            {
              v184.iint key = 5523009;
              char v183 = *(_BYTE *)(valueb + 184);
            }

            if ((v183 & 2) != 0)
            {
              uint64_t v10 = header;
              v185.iint key = 5391937;
            }

            else
            {
              uint64_t v10 = header;
            }

            v186.iint key = 5521732;
            if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v186, sizea) < 0) {
              BOOL v181 = 0;
            }
            int v189 = (char *)v13 + 984 * v32;
            uint64_t v192 = *((void *)v189 + 4);
            uint64_t v191 = (AAHeader_impl *)(v189 + 32);
            uint64_t v190 = v192;
            if (!v192 || (v193.iint key = 4408665, (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v193, v190) & 0x80000000) == 0))
            {
              if (v181)
              {
                AAHeader v254 = v191;
                size_t v194 = AAHeaderGetEncodedSize(v10);
                __int16 v195 = AAHeaderGetEncodedData(v10);
                if (*((void *)ostream + 3))
                {
                  if (v194)
                  {
                    __int16 v198 = v195;
                    uint64_t v199 = 0LL;
                    size_t v200 = v194;
                    while (1)
                    {
                      uint64_t v201 = (*((uint64_t (**)(void, const uint8_t *, size_t))ostream + 3))( *(void *)ostream,  v198,  v200);
                      if (v201 < 1) {
                        break;
                      }
                      v198 += v201;
                      v199 += v201;
                      v200 -= v201;
                      if (!v200) {
                        goto LABEL_276;
                      }
                    }

                    uint64_t v199 = v201;
                  }

                  else
                  {
                    uint64_t v199 = 0LL;
                  }
                }

                else
                {
                  uint64_t v199 = -1LL;
                }

LABEL_276:
                if (v199 != v194)
                {
                  __int16 v242 = "write header";
                  __int16 v243 = 1398;
                  goto LABEL_374;
                }

                uint64_t v202 = *(void *)valueb;
                if (*(void *)valueb)
                {
                  off_t v203 = sizea;
                  if (!*((void *)ostream + 3)) {
                    goto LABEL_366;
                  }
                  off_t v204 = 0LL;
                  if (!sizea)
                  {
LABEL_287:
                    if (v204 < 0 || v204 != v203)
                    {
LABEL_366:
                      __int16 v242 = "write patch payload";
                      __int16 v243 = 1404;
                    }

                    else
                    {
                      uint64_t v207 = *(void *)v254;
                      uint64_t v29 = ostream;
                      if (!*(void *)v254) {
                        goto LABEL_297;
                      }
                      if (*((void *)ostream + 3))
                      {
                        uint64_t v208 = 0LL;
                        uint64_t v209 = *((void *)v13 + 123 * v32 + 6);
                        while (1)
                        {
                          uint64_t v210 = (*((uint64_t (**)(void, uint64_t, uint64_t))ostream + 3))( *(void *)ostream,  v209,  v207);
                          if (v210 < 1) {
                            break;
                          }
                          v209 += v210;
                          v208 += v210;
                          v207 -= v210;
                          if (!v207) {
                            goto LABEL_296;
                          }
                        }

                        uint64_t v208 = v210;
LABEL_296:
                        uint64_t v29 = ostream;
                        if ((v208 & 0x8000000000000000LL) == 0)
                        {
LABEL_297:
                          AAByteStreamClose((AAByteStream)v24);
                          uint64_t v19 = v274;
                          uint64_t v10 = header;
                          uint64_t v13 = v272;
                          uint64_t v16 = v273;
                          unsigned int v30 = v271;
                          int v26 = buf;
                          goto LABEL_243;
                        }
                      }

                      __int16 v242 = "write YEC";
                      __int16 v243 = 1409;
                    }

LABEL_374:
                    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  v243,  27,  0,  v242,  v196,  v197,  v248);
                    uint64_t v217 = 0LL;
                    uint64_t v218 = 0LL;
                    uint64_t v216 = 0LL;
                    goto LABEL_353;
                  }

                  off_t v205 = sizea;
                  while (1)
                  {
                    off_t v206 = (*((uint64_t (**)(void, uint64_t, off_t))ostream + 3))( *(void *)ostream,  v202,  v205);
                    if (v206 < 1) {
                      break;
                    }
                    v202 += v206;
                    v204 += v206;
                    v205 -= v206;
                    if (!v205) {
                      goto LABEL_287;
                    }
                  }
                }

                else
                {
                  off_t v203 = sizea;
                  if (!v24) {
                    goto LABEL_366;
                  }
                  off_t v206 = AAByteStreamProcess((AAByteStream)v24, ostream);
                }

                off_t v204 = v206;
                goto LABEL_287;
              }
            }

            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1392,  27,  0,  "setup header",  v187,  v188,  v248);
            uint64_t v217 = 0LL;
            uint64_t v218 = 0LL;
            uint64_t v216 = 0LL;
LABEL_337:
            uint64_t v224 = 0xFFFFFFFFLL;
            goto LABEL_354;
          }

          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  1375,  27,  0,  "open: %s",  v171,  v172,  (char)__str);
        }

        goto LABEL_360;
      case 3u:
        if (*((_DWORD *)v13 + 246 * v32 + 2) == 1)
        {
          uint64_t v13 = v272;
          uint64_t v16 = v273;
          if (v262)
          {
            uint64_t v64 = (uint64_t)v263[4];
            if (!v64) {
              uint64_t v64 = (uint64_t)v263[3];
            }
            if ((encodeEntry(v64, v35, v34) & 0x80000000) == 0)
            {
              ++v270;
              unsigned int v27 = 67;
              goto LABEL_104;
            }

            uint64_t v244 = "encode entry";
            __int16 v245 = 1350;
            goto LABEL_379;
          }

          unsigned int v27 = 67;
          if ((encodeYOPEntry(v29, 0x43u, v34, __s, 0LL) & 0x80000000) != 0)
          {
            uint64_t v244 = "encode entry";
            __int16 v245 = 1355;
            goto LABEL_379;
          }

          goto LABEL_149;
        }

        unsigned int v27 = 67;
LABEL_106:
        int v26 = v261;
        goto LABEL_156;
      case 4u:
        unsigned int v27 = 69;
        if (*((_DWORD *)v13 + 246 * v32 + 2) != 3 || (_DWORD)v35 == 70) {
          goto LABEL_106;
        }
        goto LABEL_77;
      case 5u:
        unsigned int v27 = 69;
        if (*((_DWORD *)v13 + 246 * v32 + 2) != 3 || (_DWORD)v35 != 70) {
          goto LABEL_106;
        }
LABEL_77:
        uint64_t size = *((void *)v13 + 123 * v32 + 9 * v276 + 35);
        uint64_t v67 = v33[18 * v276 + 66];
        int v68 = AAHeaderClear(v10);
        v69.iint key = 5265748;
        int v70 = AAHeaderSetFieldUInt(v10, 0xFFFFFFFF, v69, v67);
        size_t v71 = strlen(v34);
        v72.iint key = 5521744;
        BOOL v75 = (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v72, v34, v71) | v70 | v68) >= 0;
        if (!v262)
        {
          size_t v76 = strlen(__s);
          v77.iint key = 4997708;
          if (AAHeaderSetFieldString(v10, 0xFFFFFFFF, v77, __s, v76) < 0) {
            BOOL v75 = 0;
          }
        }

        uint64_t v19 = v274;
        int value = v67;
        if ((_DWORD)v67 == 70)
        {
          uint64_t v93 = (char *)v13 + 984 * v32;
          if ((v93[136] & 4) != 0)
          {
            v116.iint key = 4672582;
          }

          char v119 = v93[208];
          uint64_t v118 = v93 + 208;
          char v117 = v119;
          if ((v119 & 1) != 0)
          {
            v120.iint key = 5523009;
            char v117 = *v118;
          }

          uint64_t v19 = v274;
          if ((v117 & 2) != 0)
          {
            v121.iint key = 5391937;
          }

          v122.iint key = 5521732;
          if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v122, size) < 0) {
            BOOL v75 = 0;
          }
          uint64_t v123 = *((void *)v13 + 123 * v32 + 4);
          if (v123)
          {
            v124.iint key = 4408665;
            if (AAHeaderSetFieldBlob(v10, 0xFFFFFFFF, v124, v123) < 0)
            {
LABEL_338:
              int v233 = "setup header";
              __int16 v234 = 1442;
LABEL_359:
              pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  v234,  27,  0,  v233,  v73,  v74,  v248);
LABEL_360:
              uint64_t v217 = 0LL;
              uint64_t v218 = 0LL;
              uint64_t v216 = 0LL;
              uint64_t v24 = 0LL;
              uint64_t v224 = 0xFFFFFFFFLL;
              uint64_t v13 = v272;
              uint64_t v16 = v273;
              goto LABEL_361;
            }
          }
        }

        else if ((_DWORD)v67 == 76)
        {
          if (*((void *)v13 + 123 * v32 + 7))
          {
            size_t v78 = strlen(*((const char **)v13 + 123 * v32 + 9));
            v79.iint key = 4935244;
            uint64_t v19 = v274;
          }
        }

        if (!v75) {
          goto LABEL_338;
        }
        size_t v125 = AAHeaderGetEncodedSize(v10);
        uint64_t v126 = AAHeaderGetEncodedData(v10);
        uint64_t v127 = ostream;
        if (v262)
        {
          uint64_t v127 = v263[4];
          if (!v127) {
            uint64_t v127 = v263[3];
          }
        }

        if (v127[3])
        {
          uint64_t v128 = 0LL;
          if (v125)
          {
            size_t v129 = v125;
            while (1)
            {
              uint64_t v130 = ((uint64_t (*)(void, const uint8_t *, size_t))v127[3])(*v127, v126, v129);
              if (v130 < 1) {
                break;
              }
              v126 += v130;
              v128 += v130;
              v129 -= v130;
              if (!v129) {
                goto LABEL_185;
              }
            }

            uint64_t v128 = v130;
          }
        }

        else
        {
          uint64_t v128 = -1LL;
        }

LABEL_212:
        AAHeaderDestroy(v252);
        free(bufb);
        uint64_t v153 = size;
        if (!v262) {
          uint64_t v153 = 0LL;
        }
        v258 += v153;
        int v131 = value;
LABEL_215:
        unsigned int v30 = v271;
        if (v131 != 70) {
          goto LABEL_224;
        }
        uint64_t v154 = *((void *)v13 + 123 * v32 + 4);
        if (!v154) {
          goto LABEL_224;
        }
        if (v127[3])
        {
          uint64_t v155 = 0LL;
          uint64_t v156 = *((void *)v13 + 123 * v32 + 6);
          while (1)
          {
            uint64_t v157 = ((uint64_t (*)(void, uint64_t, uint64_t))v127[3])(*v127, v156, v154);
            if (v157 < 1) {
              break;
            }
            v156 += v157;
            v155 += v157;
            v154 -= v157;
            if (!v154) {
              goto LABEL_223;
            }
          }

          uint64_t v155 = v157;
LABEL_223:
          unsigned int v30 = v271;
          if ((v155 & 0x8000000000000000LL) == 0)
          {
LABEL_224:
            uint64_t v158 = v270 + v256;
            unsigned int v27 = 69;
            v270 += v256;
            if (v262)
            {
              uint64_t v29 = ostream;
              if (v158)
              {
                uint64_t v19 = v274;
                uint64_t v10 = header;
                uint64_t v13 = v272;
                uint64_t v16 = v273;
                if (v258 <= *(void *)(*(void *)(a1 + 8) + 128LL)) {
                  goto LABEL_233;
                }
                uint64_t v159 = v263;
                AAByteStreamClose(v263[4]);
                v263[4] = 0LL;
                if ((encodeYOPEntry(ostream, 0x45u, 0LL, __s, v263[3]) & 0x80000000) == 0)
                {
                  if ((AAByteStreamTruncate(v263[3]) & 0x80000000) != 0)
                  {
                    uint64_t v246 = "AAByteStreamTruncate";
                    __int16 v247 = 195;
                  }

                  else if (AAByteStreamSeek(v263[3], 0LL, 0) < 0)
                  {
                    uint64_t v246 = "AAByteStreamSeek";
                    __int16 v247 = 196;
                  }

                  else
                  {
                    AAByteStreamClose(v263[4]);
                    v263[4] = 0LL;
                    if (!*(_DWORD *)v263)
                    {
                      unint64_t v258 = 0LL;
                      uint64_t v270 = 0LL;
                      int v26 = v261;
                      uint64_t v29 = ostream;
                      goto LABEL_242;
                    }

                    AAByteStream v164 = AACompressionOutputStreamOpen( v263[3],  *(_DWORD *)v263,  (size_t)v263[1],  0LL,  *((_DWORD *)v263 + 4));
                    v263[4] = v164;
                    if (v164)
                    {
                      unint64_t v258 = 0LL;
                      uint64_t v270 = 0LL;
                      int v26 = v261;
                      uint64_t v29 = ostream;
                      goto LABEL_242;
                    }

                    uint64_t v246 = "AACompressionOutputStreamOpen";
                    __int16 v247 = 201;
                  }

                  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"subArchiveReset",  v247,  27,  0,  v246,  v162,  v163,  v248);
                  uint64_t v244 = "truncating sub asset";
                  __int16 v245 = 1472;
                  goto LABEL_379;
                }

                uint32_t v231 = "encode entry";
                __int16 v232 = 1469;
LABEL_329:
                pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  v232,  27,  0,  v231,  v160,  v161,  v248);
                uint64_t v217 = 0LL;
LABEL_330:
                uint64_t v218 = 0LL;
                uint64_t v216 = 0LL;
                uint64_t v24 = 0LL;
                goto LABEL_318;
              }

              int v26 = v261;
            }

            else
            {
              int v26 = v261;
              uint64_t v29 = ostream;
            }

            uint64_t v19 = v274;
            uint64_t v10 = header;
            uint64_t v13 = v272;
            uint64_t v16 = v273;
            goto LABEL_243;
          }
        }

        uint32_t v235 = "write YEC";
        __int16 v236 = 1460;
LABEL_352:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateGenerateArchive",  v236,  27,  0,  v235,  v45,  v46,  v248);
        uint64_t v217 = 0LL;
        uint64_t v218 = 0LL;
        uint64_t v216 = 0LL;
        uint64_t v24 = 0LL;
LABEL_353:
        uint64_t v224 = 0xFFFFFFFFLL;
        uint64_t v10 = header;
LABEL_354:
        uint64_t v13 = v272;
        uint64_t v16 = v273;
LABEL_355:
        uint64_t v19 = v274;
LABEL_361:
        uint64_t v159 = v263;
LABEL_319:
        AAArchiveStreamClose(v216);
        AAArchiveStreamClose(v218);
        AAArchiveStreamClose(v217);
        AAByteStreamClose(ostream);
        if (v159)
        {
          AAByteStreamClose(v159[4]);
          AAByteStreamClose(v159[3]);
          free(v159);
        }

        AAByteStreamClose((AAByteStream)v24);
        AAHeaderDestroy(v10);
        AAFieldKeySetDestroy(v13);
        AAFieldKeySetDestroy(v16);
        free(v19);
        return v224;
      case 6u:
        unsigned int v27 = 79;
        int v26 = 1;
        if ((_DWORD)v35 && (_DWORD)v35 != 68) {
          goto LABEL_89;
        }
        goto LABEL_156;
      case 7u:
        int v26 = 1;
        if ((_DWORD)v35 != 68)
        {
          unsigned int v27 = 79;
LABEL_156:
          uint64_t v13 = v272;
LABEL_157:
          uint64_t v16 = v273;
          goto LABEL_243;
        }

LABEL_130:
        if (v101 != v99)
        {
          uint32_t v235 = "write header";
          __int16 v236 = 1318;
          goto LABEL_352;
        }

        uint64_t v29 = ostream;
        unsigned int v30 = v271;
        int v26 = bufa;
        if ((valuea | 2) == 0x46)
        {
          uint64_t v104 = *((void *)v13 + 123 * v32 + 10);
          if (v104)
          {
            if (!*((void *)v98 + 3)) {
              goto LABEL_344;
            }
            uint64_t v105 = 0LL;
            uint64_t v106 = *((void *)v13 + 123 * v32 + 12);
            while (1)
            {
              uint64_t v107 = (*((uint64_t (**)(void, uint64_t, uint64_t))v98 + 3))(*(void *)v98, v106, v104);
              if (v107 < 1) {
                break;
              }
              v106 += v107;
              v105 += v107;
              v104 -= v107;
              if (!v104) {
                goto LABEL_139;
              }
            }

            uint64_t v105 = v107;
LABEL_139:
            uint64_t v29 = ostream;
            unsigned int v30 = v271;
            int v26 = bufa;
            if (v105 < 0)
            {
LABEL_344:
              uint32_t v235 = "write XAT";
              __int16 v236 = 1322;
              goto LABEL_352;
            }
          }

          uint64_t v108 = *((void *)v13 + 123 * v32 + 13);
          if (v108)
          {
            if (!*((void *)v98 + 3)) {
              goto LABEL_345;
            }
            uint64_t v109 = 0LL;
            uint64_t v110 = *((void *)v13 + 123 * v32 + 15);
            while (1)
            {
              uint64_t v111 = (*((uint64_t (**)(void, uint64_t, uint64_t))v98 + 3))(*(void *)v98, v110, v108);
              if (v111 < 1) {
                break;
              }
              v110 += v111;
              v109 += v111;
              v108 -= v111;
              if (!v108) {
                goto LABEL_151;
              }
            }

            uint64_t v109 = v111;
LABEL_151:
            uint64_t v29 = ostream;
            unsigned int v30 = v271;
            int v26 = bufa;
            if (v109 < 0)
            {
LABEL_345:
              uint32_t v235 = "write ACL";
              __int16 v236 = 1323;
              goto LABEL_352;
            }
          }
        }

        uint64_t v112 = v270;
        if (v26) {
          uint64_t v112 = v270 + 1;
        }
        uint64_t v270 = v112;
        unsigned int v27 = 79;
        uint64_t v19 = v274;
        uint64_t v10 = header;
        uint64_t v13 = v272;
        uint64_t v16 = v273;
        goto LABEL_243;
      default:
        goto LABEL_157;
    }
  }

void stateDestroy_0(uint64_t a1)
{
  if (a1)
  {
    int v3 = *(unsigned __int8 *)(a1 + 92);
    uint64_t v2 = (char *)(a1 + 92);
    if (v3) {
      removeTree(v2);
    }
    uint64_t v4 = *(void **)(a1 + 80);
    if (v4)
    {
      if (*(void *)(a1 + 72))
      {
        unint64_t v5 = 0LL;
        uint64_t v6 = 120LL;
        do
        {
          uint64_t v7 = (void **)(*(void *)(a1 + 80) + v6);
          free(*(v7 - 12));
          free(*(v7 - 9));
          memset_s(v7 - 11, 0x18uLL, 0, 0x18uLL);
          free(*(v7 - 3));
          memset_s(v7 - 5, 0x18uLL, 0, 0x18uLL);
          free(*v7);
          memset_s(v7 - 2, 0x18uLL, 0, 0x18uLL);
          free(*(v7 - 6));
          memset_s(v7 - 8, 0x18uLL, 0, 0x18uLL);
          ++v5;
          v6 += 984LL;
        }

        while (v5 < *(void *)(a1 + 72));
        uint64_t v4 = *(void **)(a1 + 80);
      }

      free(v4);
    }

    StringTableDestroy(*(void ***)(a1 + 32));
    StringTableDestroy(*(void ***)(a1 + 40));
    free((void *)a1);
  }

uint64_t stateCollectorStreamClose(void *a1)
{
  return 0LL;
}

uint64_t stateCollectorStreamWriteHeader(void *a1, AAHeader header)
{
  uint64_t v137 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *a1;
  uint64_t v131 = 0LL;
  uint64_t value = 0LL;
  uint64_t v129 = 0LL;
  uint64_t v130 = -1LL;
  uint64_t v128 = 0LL;
  AAHashFunction hash_function = 0;
  uint64_t v5 = *(void *)(v4 + 56);
  *((_OWORD *)a1 + 1) = 0u;
  uint64_t v6 = a1 + 2;
  uint64_t v7 = a1[1];
  *((_OWORD *)a1 + 2) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  v9.iint key = 5265748;
  uint32_t KeyIndex = AAHeaderGetKeyIndex(header, v9);
  if ((KeyIndex & 0x80000000) != 0
    || ((FieldUInt = AAHeaderGetFieldUInt(header, KeyIndex, &value), FieldUInt <= 1) ? (int v14 = 1) : (int v14 = FieldUInt),
        v14 <= 0))
  {
    uint64_t v16 = "no TYP";
    __int16 v17 = 245;
LABEL_9:
    int v18 = 0;
LABEL_10:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateCollectorStreamWriteHeader",  v17,  27,  v18,  v16,  v11,  v12,  (char)v125);
    return 0xFFFFFFFFLL;
  }

  if (value == 77) {
    return 0LL;
  }
  v19.iint key = 5521744;
  uint32_t v20 = AAHeaderGetKeyIndex(header, v19);
  if ((v20 & 0x80000000) != 0
    || ((unsigned int FieldString = AAHeaderGetFieldString(header, v20, 0x400uLL, __s, 0LL), FieldString <= 1)
      ? (int v22 = 1)
      : (int v22 = FieldString),
        v22 <= 0))
  {
    uint64_t v16 = "no PAT";
    __int16 v17 = 247;
    goto LABEL_9;
  }

  v23.iint key = 5784649;
  uint32_t v24 = AAHeaderGetKeyIndex(header, v23);
  if ((v24 & 0x80000000) != 0
    || ((unsigned int v25 = AAHeaderGetFieldUInt(header, v24, &v129), v25 <= 1) ? (v26 = 1) : (v26 = v25), v26 <= 0))
  {
    uint64_t v16 = "no IDX";
    __int16 v17 = 248;
    goto LABEL_9;
  }

  v27.iint key = 5915721;
  uint32_t v28 = AAHeaderGetKeyIndex(header, v27);
  if ((v28 & 0x80000000) != 0
    || ((v29 = AAHeaderGetFieldUInt(header, v28, &v128), v29 <= 1) ? (int v30 = 1) : (int v30 = v29), v30 <= 0))
  {
    uint64_t v16 = "no IDZ";
    __int16 v17 = 249;
    goto LABEL_9;
  }

  uint64_t v31 = v5 - 1;
  uint64_t v32 = value;
  if (value != 70) {
    goto LABEL_51;
  }
  v33.iint key = 3295315;
  uint32_t v34 = AAHeaderGetKeyIndex(header, v33);
  if ((v34 & 0x80000000) != 0
    || ((unsigned int FieldHash = AAHeaderGetFieldHash(header, v34, 0x20uLL, &hash_function, v133), FieldHash <= 1)
      ? (int v36 = 1)
      : (int v36 = FieldHash),
        v36 <= 0))
  {
    size_t v125 = __s;
    uint64_t v16 = "no hash: %s";
    __int16 v17 = 254;
    goto LABEL_9;
  }

  v37.iint key = 5917011;
  uint32_t v38 = AAHeaderGetKeyIndex(header, v37);
  if ((v38 & 0x80000000) != 0
    || ((unsigned int v39 = AAHeaderGetFieldUInt(header, v38, &v131), v39 <= 1) ? (v40 = 1) : (v40 = v39), v40 <= 0))
  {
    size_t v125 = __s;
    uint64_t v16 = "no SIZ: %s";
    __int16 v17 = 255;
    goto LABEL_9;
  }

  v41.iint key = 4410440;
  uint32_t v42 = AAHeaderGetKeyIndex(header, v41);
  if ((v42 & 0x80000000) != 0
    || ((unsigned int v43 = AAHeaderGetFieldUInt(header, v42, &v130), v43 <= 1) ? (v44 = 1) : (v44 = v43), v44 <= 0))
  {
    uint64_t v130 = -1LL;
  }

  if (v7 != v31) {
    goto LABEL_65;
  }
  size[0] = 0LL;
  uint64_t offset = 0LL;
  v45.iint key = 4408665;
  uint32_t v46 = AAHeaderGetKeyIndex(header, v45);
  if ((v46 & 0x80000000) == 0)
  {
    unsigned int FieldBlob = AAHeaderGetFieldBlob(header, v46, size, &offset);
    int v48 = FieldBlob <= 1 ? 1 : FieldBlob;
    if (v48 >= 1) {
      *uint64_t v6 = size[0];
    }
  }

  uint64_t v32 = value;
LABEL_51:
  if ((v32 & 0xFFFFFFFFFFFFFFFDLL) != 0x44 || v7 != v31) {
    goto LABEL_66;
  }
  size[0] = 0LL;
  uint64_t offset = 0LL;
  v49.iint key = 5521752;
  uint32_t v50 = AAHeaderGetKeyIndex(header, v49);
  if ((v50 & 0x80000000) == 0)
  {
    unsigned int v51 = AAHeaderGetFieldBlob(header, v50, size, &offset);
    int v52 = v51 <= 1 ? 1 : v51;
    if (v52 >= 1) {
      a1[4] = size[0];
    }
  }

  v53.iint key = 4997953;
  uint32_t v54 = AAHeaderGetKeyIndex(header, v53);
  if ((v54 & 0x80000000) == 0)
  {
    unsigned int v55 = AAHeaderGetFieldBlob(header, v54, size, &offset);
    int v56 = v55 <= 1 ? 1 : v55;
    if (v56 >= 1) {
      a1[6] = size[0];
    }
  }

LABEL_106:
      BOOL v88 = *v87;
      size_t v89 = v83;
      AAFieldKey v90 = realloc(*v87, v83);
      if (v90)
      {
        *uint64_t v87 = v90;
        size_t *v84 = v89;
        goto LABEL_108;
      }

      free(v88);
LABEL_151:
      *uint64_t v87 = 0LL;
      *AAFieldKey v81 = 0LL;
      *(void *)(v72 + 984 * v73 + 40) = 0LL;
      goto LABEL_152;
    }

LABEL_121:
      size_t v99 = *v98;
      size_t v100 = realloc(*v98, v94);
      if (v100)
      {
        *uint64_t v98 = v100;
        size_t *v95 = v94;
        goto LABEL_123;
      }

      free(v99);
LABEL_154:
      *uint64_t v98 = 0LL;
      void *v92 = 0LL;
      *(void *)(v72 + 984 * v73 + 88) = 0LL;
      goto LABEL_155;
    }

        *(_DWORD *)(a1 + 24) = v25;
        if (v25) {
          AAFieldKey v37 = 5;
        }
        else {
          AAFieldKey v37 = 9;
        }
        AAFieldKey v27 = 2;
LABEL_125:
        *(_DWORD *)(a1 + 16) = v37;
LABEL_126:
        if (a2) {
          memset_s(a2, 0x38uLL, 0, 0x38uLL);
        }
        *a2 = v27;
        uint32_t v38 = *(void *)(a1 + 80);
        if (v38) {
          uint32_t v38 = *(void *)(a1 + 88);
        }
        *((void *)a2 + 1) = v38;
        a2[12] = *(_DWORD *)(a1 + 24);
        if (v27 == 6)
        {
          unsigned int v39 = strcmp(*(const char **)(a1 + 112), "true");
          uint64_t result = 0LL;
          a2[9] = v39 == 0;
        }

        else if (v27 == 4)
        {
          int v40 = *(const char **)(a1 + 112);
          if (*v40 == 45)
          {
            AAFieldKey v41 = strtoull(v40 + 1, 0LL, 10);
            uint64_t result = 0LL;
            *((void *)a2 + 3) = v41;
            uint32_t v42 = -1;
          }

          else
          {
            unsigned int v43 = strtoull(v40, 0LL, 0);
            uint64_t result = 0LL;
            *((void *)a2 + 3) = v43;
            uint32_t v42 = v43 != 0;
          }

          a2[8] = v42;
        }

        else
        {
          uint64_t result = 0LL;
          if (v27 == 3) {
            *((void *)a2 + 2) = *(void *)(a1 + 112);
          }
        }

        return result;
      case 7:
        if ((char)v18 == 34)
        {
          if ((jsonPushLabel(a1, 0) & 0x80000000) == 0)
          {
            AAFieldKey v23 = 8;
            goto LABEL_69;
          }

          int v30 = "jsonPushLabel";
          uint64_t v31 = 587;
LABEL_103:
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamRead",  v31,  109,  0,  v30,  a7,  a8,  v46);
          goto LABEL_104;
        }

        if ((jsonPushLabel(a1, v18) & 0x80000000) != 0)
        {
          int v30 = "jsonPushLabel";
          uint64_t v31 = 591;
          goto LABEL_103;
        }

        continue;
      case 8:
        if ((char)v18 < 0)
        {
        }

        else if ((*(_DWORD *)(v14 + 4LL * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }

        AAFieldKey v23 = 0;
        goto LABEL_69;
      default:
        goto LABEL_102;
    }
  }

LABEL_123:
    a1[5] = v92;
  }

  unint64_t v101 = a1[6];
  if (v101)
  {
    if ((v101 & 0x8000000000000000LL) != 0)
    {
LABEL_159:
      uint64_t v16 = "ACL blob";
      __int16 v17 = 324;
      goto LABEL_9;
    }

    size_t v102 = (void *)(v72 + 984 * v73 + 104);
    uint64_t v103 = v72 + 984 * v73;
    size_t v106 = *(void *)(v103 + 112);
    uint64_t v105 = (size_t *)(v103 + 112);
    size_t v104 = v106;
    if (v106 < v101)
    {
      do
      {
        while (!v104)
        {
          size_t v104 = 0x4000LL;
          if (v101 <= 0x4000)
          {
            uint64_t v108 = (void **)(v72 + 984 * v73 + 120);
            size_t v104 = 0x4000LL;
            goto LABEL_136;
          }
        }

        size_t v107 = v104 >> 1;
        if ((v104 & (v104 >> 1)) != 0) {
          size_t v107 = v104 & (v104 >> 1);
        }
        v104 += v107;
      }

      while (v104 < v101);
      uint64_t v108 = (void **)(v72 + 984 * v73 + 120);
      if (v104 >= 0x2000000001LL)
      {
        *__error() = 12;
        goto LABEL_158;
      }

LABEL_136:
      uint64_t v109 = *v108;
      uint64_t v110 = realloc(*v108, v104);
      if (v110)
      {
        *uint64_t v108 = v110;
        *uint64_t v105 = v104;
        goto LABEL_138;
      }

      free(v109);
LABEL_158:
      *uint64_t v108 = 0LL;
      *size_t v102 = 0LL;
      *(void *)(v72 + 984 * v73 + 112) = 0LL;
      goto LABEL_159;
    }

          if (v15 >= 3)
          {
            uint64_t v76 = "truncated stream";
            uint64_t v77 = 240;
            goto LABEL_154;
          }

LABEL_138:
    a1[7] = v102;
  }

  if (value == 76)
  {
    size_t v111 = strlen((const char *)size) + 1;
    uint64_t v112 = v72 + 984 * v73;
    uint64_t v115 = *(void *)(v112 + 56);
    uint64_t v114 = (uint64_t *)(v112 + 56);
    uint64_t v113 = v115;
    unint64_t v116 = v115 + v111;
    if (__CFADD__(v115, v111) || (v116 & 0x8000000000000000LL) != 0) {
      goto LABEL_170;
    }
    uint64_t v117 = v72 + 984 * v73;
    size_t v120 = *(void *)(v117 + 64);
    char v119 = (size_t *)(v117 + 64);
    size_t v118 = v120;
    if (v120 < v116)
    {
      do
      {
        while (!v118)
        {
          size_t v118 = 0x4000LL;
          if (v116 <= 0x4000)
          {
            AAFieldKey v122 = (void **)(v72 + 984 * v73 + 72);
            size_t v118 = 0x4000LL;
            goto LABEL_162;
          }
        }

        size_t v121 = v118 >> 1;
        if ((v118 & (v118 >> 1)) != 0) {
          size_t v121 = v118 & (v118 >> 1);
        }
        v118 += v121;
      }

      while (v118 < v116);
      AAFieldKey v122 = (void **)(v72 + 984 * v73 + 72);
      if (v118 >= 0x2000000001LL)
      {
        *__error() = 12;
        goto LABEL_169;
      }

uint64_t stateCollectorStreamWriteBlob( void *a1, int a2, void *__src, rsize_t __smax, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (void *)a1[3];
  uint64_t v12 = *(void *)&a2 & 0xFFFFFFLL;
  if (v11) {
    BOOL v13 = v12 == 4408665;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13) {
    goto LABEL_5;
  }
  if (a1[2] < __smax)
  {
    int v18 = "invalid blob size";
    __int16 v19 = 344;
    goto LABEL_86;
  }

  unint64_t v20 = *v11 + __smax;
  if (__CFADD__(*v11, __smax) || (v20 & 0x8000000000000000LL) != 0) {
    goto LABEL_69;
  }
  size_t v21 = v11[1];
  if (v21 < v20)
  {
    do
    {
      while (!v21)
      {
        size_t v21 = 0x4000LL;
        if (v20 <= 0x4000)
        {
          size_t v21 = 0x4000LL;
          goto LABEL_49;
        }
      }

      size_t v22 = v21 >> 1;
      if ((v21 & (v21 >> 1)) != 0) {
        size_t v22 = v21 & (v21 >> 1);
      }
      v21 += v22;
    }

    while (v21 < v20);
    if (v21 >= 0x2000000001LL)
    {
      *__error() = 12;
      goto LABEL_68;
    }

uint64_t entryVectorCmp(_DWORD *a1, _DWORD *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 < *a1;
  }
}

uint64_t entryIndexCmpHLC(uint64_t a1, void *a2, void *a3)
{
  unint64_t v3 = *(void *)(a1 + 984LL * *a2 + 128);
  unint64_t v4 = *(void *)(a1 + 984LL * *a3 + 128);
  if (v3 < v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v4 < v3;
  }
}

uint64_t computePatchesWorkerProc( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (uint64_t *)MEMORY[0x1895F8858](a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v107 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *v8;
  bzero(v106, 0x400uLL);
  memset(v105, 0, sizeof(v105));
  memset(v104, 0, sizeof(v104));
  unint64_t v101 = 0LL;
  unint64_t st_size = 0LL;
  uint64_t v100 = 0LL;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  *(_OWORD *)size_t v94 = 0u;
  *(_OWORD *)AAFieldKey v95 = 0u;
  unint64_t v15 = v8[1];
  if (v15 >= *(void *)(v9 + 72))
  {
    uint32_t v50 = "invalid entry";
    __int16 v51 = 509;
    goto LABEL_53;
  }

  uint64_t v16 = *(void *)(v9 + 80);
  uint64_t v89 = v16;
  uint64_t v88 = *(void *)(v9 + 56);
  if (v88)
  {
    unint64_t v17 = 0LL;
    size_t v86 = v8;
    uint64_t v87 = v16 + 984 * v15;
    uint64_t v85 = v8[1];
    while (1)
    {
      uint64_t v18 = v8[1];
      *(void *)&offset[0] = 0LL;
      *(void *)&size.st_dev = 0LL;
      Entryint Header = stateLoadEntryHeader(v9, v17, v18);
      size_t v22 = EntryHeader;
      if (!EntryHeader)
      {
        int v52 = "loading entry header";
        __int16 v53 = 726;
        goto LABEL_51;
      }

      v23.iint key = 5521732;
      uint32_t KeyIndex = AAHeaderGetKeyIndex(EntryHeader, v23);
      if ((KeyIndex & 0x80000000) != 0
        || ((unsigned int FieldBlob = AAHeaderGetFieldBlob(v22, KeyIndex, (uint64_t *)&size, (uint64_t *)offset), FieldBlob <= 1)
          ? (int v26 = 1)
          : (int v26 = FieldBlob),
            v26 <= 0))
      {
        int v52 = "blob not found";
        __int16 v53 = 727;
        goto LABEL_51;
      }

      if (*(void *)&size.st_dev >= 0x2000000001uLL) {
        break;
      }
      size_t v27 = (char *)malloc(*(size_t *)&size.st_dev);
      if (!v27)
      {
        unsigned int v59 = __error();
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"stateLoadEntryBlob",  730,  27,  *v59,  "malloc",  v60,  v61,  v84);
        goto LABEL_52;
      }

      uint64_t v28 = *(void *)(*(void *)(v9 + 80) + 984 * v18 + 72 * v17 + 288);
      header = v22;
      size_t EncodedSize = AAHeaderGetEncodedSize(v22);
      uint64_t v32 = *(void *)&size.st_dev;
      if (*(void *)&size.st_dev)
      {
        unint64_t v33 = 0LL;
        uint64_t v92 = EncodedSize + *(void *)&offset[0] + v28;
        while (1)
        {
          unint64_t v34 = v32 - v33;
          uint64_t v35 = v34 >= 0x7FFFFFFF ? 0x7FFFFFFFLL : v34;
          int v36 = *(void **)(*(void *)(v9 + 8) + 8 * v17 + 24);
          if (!v36[4]) {
            break;
          }
          uint64_t v37 = 0LL;
          if (v35)
          {
            char v38 = &v27[v33];
            uint64_t v39 = v92 + v33;
            uint64_t v40 = v35;
            while (1)
            {
              uint64_t v41 = ((uint64_t (*)(void, char *, uint64_t, uint64_t))v36[4])(*v36, v38, v40, v39);
              if (v41 < 0) {
                break;
              }
              if (v41)
              {
                v38 += v41;
                v37 += v41;
                v39 += v41;
                v40 -= v41;
                if (v40) {
                  continue;
                }
              }

              goto LABEL_25;
            }

            uint64_t v37 = v41;
          }

AAHeader stateLoadEntryHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 984 * a3 + 72 * a2 + 288);
  uint64_t v6 = (uint8_t *)malloc(0x10000uLL);
  uint64_t v9 = v6;
  if (v6)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 8) + 8 * a2 + 24);
    if (*(void *)(v10 + 32))
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = 6LL;
      uint64_t v13 = (char *)v6;
      uint64_t v14 = v5;
      while (1)
      {
        uint64_t v15 = (*(uint64_t (**)(void, char *, uint64_t, uint64_t))(v10 + 32))(*(void *)v10, v13, v12, v14);
        if (v15 < 0) {
          break;
        }
        if (v15)
        {
          v13 += v15;
          v11 += v15;
          v14 += v15;
          v12 -= v15;
          if (v12) {
            continue;
          }
        }

        if (v11 != 6) {
          break;
        }
        if (*(_DWORD *)v9 != 826360153 && *(_DWORD *)v9 != 825246017)
        {
          uint64_t v16 = "invalid header magic";
          __int16 v17 = 704;
          goto LABEL_12;
        }

        uint64_t v21 = *(void **)(*(void *)(a1 + 8) + 8 * a2 + 24);
        if (!v21[4]) {
          goto LABEL_28;
        }
        size_t v22 = *((unsigned __int16 *)v9 + 2);
        if (*((_WORD *)v9 + 2))
        {
          uint64_t v23 = 0LL;
          size_t v24 = v9;
          uint64_t v25 = *((unsigned __int16 *)v9 + 2);
          while (1)
          {
            uint64_t v26 = ((uint64_t (*)(void, uint8_t *, uint64_t, uint64_t))v21[4])(*v21, v24, v25, v5);
            if (v26 < 0) {
              break;
            }
            if (v26)
            {
              v24 += v26;
              v23 += v26;
              v5 += v26;
              v25 -= v26;
              if (v25) {
                continue;
              }
            }

            goto LABEL_25;
          }

          uint64_t v23 = v26;
        }

        else
        {
          uint64_t v23 = 0LL;
        }

void *subArchiveCreate(unint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = malloc(0x28uLL);
  uint64_t v9 = v8;
  if (v8)
  {
    memset_s(v8, 0x28uLL, 0, 0x28uLL);
    *(_DWORD *)uint64_t v9 = a2;
    *((void *)v9 + 1) = a3;
    *((_DWORD *)v9 + 4) = a4;
    uint64_t v10 = (AAByteStream_impl *)AATempStreamOpen(a1);
    *((void *)v9 + 3) = v10;
    if (!v10)
    {
      uint64_t v14 = "AATempStreamOpen";
      __int16 v15 = 165;
      goto LABEL_8;
    }

    if (*(_DWORD *)v9)
    {
      AAByteStream v13 = AACompressionOutputStreamOpen(v10, *(_DWORD *)v9, *((void *)v9 + 1), 0LL, *((_DWORD *)v9 + 4));
      *((void *)v9 + 4) = v13;
      if (!v13)
      {
        uint64_t v14 = "AACompressionOutputStreamOpen";
        __int16 v15 = 169;
LABEL_8:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"subArchiveCreate",  v15,  27,  0,  v14,  v11,  v12,  v20);
        AAByteStreamClose(*((AAByteStream *)v9 + 4));
        AAByteStreamClose(*((AAByteStream *)v9 + 3));
        free(v9);
        return 0LL;
      }
    }
  }

  else
  {
    uint64_t v16 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"subArchiveCreate",  159,  27,  *v16,  "malloc",  v17,  v18,  v20);
  }

  return v9;
}

uint64_t encodeEntry(uint64_t a1, unsigned int a2, const char *a3)
{
  uint64_t v6 = AAHeaderCreate();
  uint64_t v9 = v6;
  if (!v6)
  {
    char v20 = "AAHeaderCreate";
    __int16 v21 = 468;
LABEL_18:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"encodeEntry",  v21,  27,  0,  v20,  v7,  v8,  v24);
    uint64_t v22 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }

  v10.iint key = 5265748;
  int v11 = AAHeaderSetFieldUInt(v6, 0xFFFFFFFF, v10, a2);
  size_t v12 = strlen(a3);
  v13.iint key = 5521744;
  if (AAHeaderSetFieldString(v9, 0xFFFFFFFF, v13, a3, v12) < 0 || v11 < 0)
  {
    char v20 = "setup header";
    __int16 v21 = 473;
    goto LABEL_18;
  }

  size_t EncodedSize = AAHeaderGetEncodedSize(v9);
  EncodedData = AAHeaderGetEncodedData(v9);
  if (*(void *)(a1 + 24))
  {
    if (EncodedSize)
    {
      uint64_t v16 = EncodedData;
      uint64_t v17 = 0LL;
      size_t v18 = EncodedSize;
      while (1)
      {
        uint64_t v19 = (*(uint64_t (**)(void, const uint8_t *, size_t))(a1 + 24))(*(void *)a1, v16, v18);
        if (v19 < 1) {
          break;
        }
        v16 += v19;
        v17 += v19;
        v18 -= v19;
        if (!v18) {
          goto LABEL_15;
        }
      }

      uint64_t v17 = v19;
    }

    else
    {
      uint64_t v17 = 0LL;
    }
  }

  else
  {
    uint64_t v17 = -1LL;
  }

uint64_t encodeYOPEntry( AAByteStream_impl *a1, unsigned int a2, const char *a3, const char *a4, AAByteStream s)
{
  if (s)
  {
    off_t v12 = AAByteStreamSeek(s, 0LL, 2);
    if (v12 < 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAssetGenerate.c",  (uint64_t)"encodeYOPEntry",  416,  27,  0,  "seek dat stream",  v10,  v11,  v37);
      AAFieldKey v13 = 0LL;
LABEL_37:
      uint64_t v35 = 0xFFFFFFFFLL;
      goto LABEL_38;
    }
  }

  else
  {
    off_t v12 = -1LL;
  }

  uint64_t v14 = AAHeaderCreate();
  AAFieldKey v13 = v14;
  if (!v14)
  {
    uint64_t v32 = "AAHeaderCreate";
    __int16 v33 = 421;
    goto LABEL_36;
  }

  v17.iint key = 5265748;
  int v18 = AAHeaderSetFieldUInt(v14, 0xFFFFFFFF, v17, 0x4DuLL);
  v19.iint key = 5263193;
  BOOL v20 = (AAHeaderSetFieldUInt(v13, 0xFFFFFFFF, v19, a2) | v18) >= 0;
  if (a3)
  {
    size_t v21 = strlen(a3);
    v22.iint key = 5521744;
    if (AAHeaderSetFieldString(v13, 0xFFFFFFFF, v22, a3, v21) < 0) {
      BOOL v20 = 0;
    }
  }

  if (a4)
  {
    size_t v23 = strlen(a4);
    v24.iint key = 4997708;
    if (AAHeaderSetFieldString(v13, 0xFFFFFFFF, v24, a4, v23) < 0) {
      BOOL v20 = 0;
    }
  }

  if (v12 != -1 && (v25.iint key = 5521732, AAHeaderSetFieldBlob(v13, 0xFFFFFFFF, v25, v12) < 0) || !v20)
  {
    uint64_t v32 = "setup header";
    __int16 v33 = 427;
    goto LABEL_36;
  }

  size_t EncodedSize = AAHeaderGetEncodedSize(v13);
  EncodedData = AAHeaderGetEncodedData(v13);
  if (*((void *)a1 + 3))
  {
    if (EncodedSize)
    {
      char v28 = EncodedData;
      uint64_t v29 = 0LL;
      size_t v30 = EncodedSize;
      while (1)
      {
        uint64_t v31 = (*((uint64_t (**)(void, const uint8_t *, size_t))a1 + 3))(*(void *)a1, v28, v30);
        if (v31 < 1) {
          break;
        }
        v28 += v31;
        v29 += v31;
        v30 -= v31;
        if (!v30) {
          goto LABEL_26;
        }
      }

      uint64_t v29 = v31;
    }

    else
    {
      uint64_t v29 = 0LL;
    }
  }

  else
  {
    uint64_t v29 = -1LL;
  }

void subArchiveDestroy(AAByteStream *a1)
{
  if (a1)
  {
    AAByteStreamClose(a1[4]);
    AAByteStreamClose(a1[3]);
    free(a1);
  }

uint64_t aaEntryYECBlobInitWithEncodedData( void *a1, void *__src, rsize_t __smax, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a1 = 0LL;
  if ((__smax & 0x8000000000000000LL) != 0)
  {
LABEL_21:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c",  (uint64_t)"aaEntryYECBlobInitWithEncodedData",  22,  105,  0,  "malloc",  a7,  a8,  v17);
    return 0xFFFFFFFFLL;
  }

  size_t v11 = a1[1];
  if (v11 < __smax)
  {
    do
    {
      while (!v11)
      {
        size_t v11 = 0x4000LL;
        if (__smax <= 0x4000)
        {
          size_t v11 = 0x4000LL;
          goto LABEL_12;
        }
      }

      size_t v12 = v11 >> 1;
      if ((v11 & (v11 >> 1)) != 0) {
        size_t v12 = v11 & (v11 >> 1);
      }
      v11 += v12;
    }

    while (v11 < __smax);
    if (v11 >= 0x2000000001LL)
    {
      *__error() = 12;
      goto LABEL_20;
    }

uint64_t aaEntryYECBlobInitWithPath(void *a1, int a2, char *a3, const char *a4)
{
  char v4 = (char)a3;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if ((concatPath(v23, 0x800uLL, a3, a4) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c",  (uint64_t)"aaEntryYECBlobInitWithPath",  34,  105,  0,  "invalid path %s/%s",  v7,  v8,  v4);
    return 0xFFFFFFFFLL;
  }

  int v9 = open(v23, 0);
  if (v9 < 0)
  {
    int v19 = *__error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c",  (uint64_t)"aaEntryYECBlobInitWithPath",  38,  105,  v19,  "open: %s",  v20,  v21,  (char)v23);
    return 0xFFFFFFFFLL;
  }

  int v15 = v9;
  if ((aaEntryYECBlobInitWithFD(a1, a2, v9, v10, v11, v12, v13, v14) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c",  (uint64_t)"aaEntryYECBlobInitWithPath",  40,  105,  0,  "computing YEC blob: %s",  v16,  v17,  (char)v23);
    uint64_t v18 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  close(v15);
  return v18;
}

uint64_t aaEntryYECBlobInitWithFD( void *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 == 65552)
  {
    memset(&v39, 0, sizeof(v39));
    if (!fstat(a3, &v39) && (v39.st_mode & 0xF000) == 0x8000)
    {
      off_t st_size = v39.st_size;
      int v15 = (char *)IFileStreamCreateWithFD(a3, 0LL, v39.st_size);
      if (v15)
      {
        uint64_t v18 = (void **)OECCStreamCreate(1, 0x4000u, st_size);
        if (v18)
        {
          int v19 = (unint64_t *)MemBufferCreate(0x10000uLL);
          AAFieldKey v22 = (void **)v19;
          if (v19)
          {
            uint64_t v23 = MemBufferTransmit( v19,  st_size,  (size_t (*)(int, void *, size_t))IFileStreamRead,  (uint64_t)v15,  (uint64_t (*)(uint64_t, uint64_t, uint64_t))OECCStreamWrite,  (uint64_t)v18,  v20,  v21);
            if ((v23 & 0x8000000000000000LL) == 0 && v23 == st_size)
            {
              size_t DataSize = OECCStreamGetDataSize((uint64_t)v18);
              uint64_t DataPtr = OECCStreamGetDataPtr((uint64_t)v18);
              *a1 = 0LL;
              if ((DataSize & 0x8000000000000000LL) != 0)
              {
LABEL_41:
                uint64_t v29 = "alloc blob failed";
                __int16 v30 = 89;
                goto LABEL_19;
              }

              uint64_t v26 = (const void *)DataPtr;
              size_t v27 = a1[1];
              if (v27 < DataSize)
              {
                do
                {
                  while (!v27)
                  {
                    size_t v27 = 0x4000LL;
                    if (DataSize <= 0x4000)
                    {
                      size_t v27 = 0x4000LL;
                      goto LABEL_32;
                    }
                  }

                  size_t v28 = v27 >> 1;
                  if ((v27 & (v27 >> 1)) != 0) {
                    size_t v28 = v27 & (v27 >> 1);
                  }
                  v27 += v28;
                }

                while (v27 < DataSize);
                if (v27 >= 0x2000000001LL)
                {
                  *__error() = 12;
                  goto LABEL_40;
                }

void *AAEntryYECBlobCreate()
{
  v0 = malloc(0x18uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    memset_s(v0, 0x18uLL, 0, 0x18uLL);
  }

  else
  {
    uint64_t v2 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c",  (uint64_t)"AAEntryYECBlobCreate",  105,  105,  *v2,  "malloc",  v3,  v4,  v6);
  }

  return v1;
}

void AAEntryYECBlobDestroy(void **a1)
{
  if (a1)
  {
    free(a1[2]);
    memset_s(a1, 0x18uLL, 0, 0x18uLL);
    free(a1);
  }

void **AAEntryYECBlobCreateWithEncodedData(void *a1, rsize_t a2)
{
  uint64_t v4 = (void **)AAEntryYECBlobCreate();
  uint64_t v10 = v4;
  if (v4 && (aaEntryYECBlobInitWithEncodedData(v4, a1, a2, v5, v6, v7, v8, v9) & 0x80000000) != 0)
  {
    AAEntryYECBlobDestroy(v10);
    return 0LL;
  }

  return v10;
}

void **AAEntryYECBlobCreateWithPath(int a1, char *a2, const char *a3)
{
  uint64_t v6 = (void **)AAEntryYECBlobCreate();
  uint64_t v7 = v6;
  if (v6 && (aaEntryYECBlobInitWithPath(v6, a1, a2, a3) & 0x80000000) != 0)
  {
    AAEntryYECBlobDestroy(v7);
    return 0LL;
  }

  return v7;
}

uint64_t AAEntryYECBlobApplyToPath(uint64_t a1, char *__s, const char *a3, int *a4, uint64_t a5, int a6)
{
  char v8 = (char)__s;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  memset(&v32, 0, sizeof(v32));
  if ((concatPath(v33, 0x800uLL, __s, a3) & 0x80000000) != 0)
  {
    LOBYTE(v28) = v8;
    AAFieldKey v22 = "invalid path %s/%s";
    __int16 v23 = 153;
    goto LABEL_12;
  }

  if (lstat(v33, &v32) || (v32.st_mode & 0xF000) != 0x8000)
  {
    size_t v28 = v33;
    AAFieldKey v22 = "entry not found, or not a regular file: %s";
    __int16 v23 = 156;
LABEL_12:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c",  (uint64_t)"AAEntryYECBlobApplyToPath",  v23,  105,  0,  v22,  v10,  v11,  (char)v28);
    goto LABEL_13;
  }

  off_t st_size = v32.st_size;
  memset_s(__sa, 0x18uLL, 0, 0x18uLL);
  int v30 = a6;
  int v13 = open(v33, 2);
  if ((v13 & 0x80000000) == 0)
  {
    int v14 = v13;
    int v15 = ParallelArchiveECCFixFileSegment(v13, 0LL, st_size, *(__int128 **)(a1 + 16), *(void *)a1, (uint64_t)__sa);
    int v18 = v31;
    if (v15 < 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c",  (uint64_t)"AAEntryYECBlobApplyToPath",  166,  105,  0,  "file can't be fixed: %s",  v16,  v17,  (char)v33);
    }

    else
    {
      if (!v15
        || !statIsCompressed(v32.st_flags)
        || (ParallelCompressionAFSCCompress(v33, 1) & 0x80000000) == 0)
      {
        uint64_t v21 = 0LL;
        goto LABEL_19;
      }

      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c",  (uint64_t)"AAEntryYECBlobApplyToPath",  171,  105,  0,  "file can't be re-compressed: %s",  v19,  v20,  (char)v33);
    }

    uint64_t v21 = 0xFFFFFFFFLL;
LABEL_19:
    close(v14);
    if (!a4) {
      return v21;
    }
    goto LABEL_14;
  }

  int v25 = *__error();
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAFieldYEC.c",  (uint64_t)"AAEntryYECBlobApplyToPath",  163,  105,  v25,  "opening file RW: %s",  v26,  v27,  (char)v33);
LABEL_13:
  uint64_t v21 = 0xFFFFFFFFLL;
  int v18 = -1;
  if (a4) {
LABEL_14:
  }
    *a4 = v18;
  return v21;
}

uint64_t AAEntryYECBlobGetEncodedSize(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t AAEntryYECBlobGetEncodedData(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

AAArchiveStream AAEncodeArchiveOutputStreamOpen( AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  uint64_t v10 = (uint64_t *)malloc(0x38uLL);
  uint64_t v11 = v10;
  if (v10) {
    memset_s(v10, 0x38uLL, 0, 0x38uLL);
  }
  uint64_t v12 = malloc(0x478uLL);
  uint64_t v13 = (uint64_t)v12;
  if (!v12 || (memset_s(v12, 0x478uLL, 0, 0x478uLL), !v11))
  {
    uint64_t v16 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"AAEncodeArchiveOutputStreamOpen",  246,  99,  *v16,  "malloc",  v17,  v18,  v23);
LABEL_11:
    encoderStreamClose(v13);
    free(v11);
    return 0LL;
  }

  *(void *)uint64_t v13 = flags;
  if (!n_threads) {
    n_threads = getDefaultNThreads();
  }
  *(_DWORD *)(v13 + 8) = n_threads;
  *(void *)(v13 + 16) = stream;
  *(void *)(v13 + 80) = msg_data;
  *(void *)(v13 + 88) = msg_proc;
  double RealTime = getRealTime();
  *(_OWORD *)(v13 + 24) = xmmword_1862D8150;
  *(double *)(v13 + 1136) = RealTime;
  int v15 = malloc(0x40000uLL);
  *(void *)(v13 + 40) = v15;
  if (!v15)
  {
    uint64_t v19 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"AAEncodeArchiveOutputStreamOpen",  260,  99,  *v19,  "malloc",  v20,  v21,  v23);
    *(void *)(v13 + 24) = 0LL;
    *(void *)(v13 + 32) = 0LL;
    goto LABEL_11;
  }

  *uint64_t v11 = v13;
  v11[1] = (uint64_t)encoderStreamClose;
  v11[2] = (uint64_t)encoderStreamAbort;
  v11[3] = (uint64_t)encoderStreamWriteHeader;
  v11[4] = (uint64_t)encoderStreamWriteBlob;
  return (AAArchiveStream)v11;
}

uint64_t encoderStreamClose(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    unint64_t v2 = *(void *)result;
    if ((flushOBuf(result) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"encoderStreamClose",  98,  99,  0,  "flushing buffer",  v3,  v4,  v8);
      int v5 = 0;
    }

    else
    {
      int v5 = 1;
    }

    if (*(void *)(v1 + 32))
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"encoderStreamClose",  99,  99,  0,  "bytes remaining in obuf",  v3,  v4,  v8);
      int v5 = 0;
    }

    if (*(_DWORD *)(v1 + 72))
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"encoderStreamClose",  100,  99,  0,  "truncated entry when encoder destroyed",  v3,  v4,  v8);
      int v5 = 0;
    }

    free(*(void **)(v1 + 56));
    memset_s((void *)(v1 + 48), 0x10uLL, 0, 0x10uLL);
    free(*(void **)(v1 + 40));
    if (v5 && v2 >> 62)
    {
      double v6 = getRealTime() - *(double *)(v1 + 1136);
      uint64_t v7 = (FILE **)MEMORY[0x1895F89D0];
      fwrite("Encode archive\n", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
      fprintf(*v7, "%12u entries in archive\n", *(_DWORD *)(v1 + 1128));
      fprintf(*v7, "%12llu bytes in archive (uncompressed)\n", *(void *)(v1 + 1120));
      fprintf(*v7, "%12.0f MB/s\n", (double)*(unint64_t *)(v1 + 1120) * 0.000000953674316 / v6);
      fprintf(*v7, "%12.2f encoding time (s)\n", v6);
    }

    free((void *)v1);
    if (v5) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

void encoderStreamAbort(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 68))
  {
    *(_DWORD *)(a1 + 68) = 1;
    AAByteStreamCancel(*(AAByteStream *)(a1 + 16));
  }

uint64_t encoderStreamWriteHeader( uint64_t a1, AAHeader header, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 68)) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 72))
  {
    uint64_t v9 = "truncated entry when header encoded";
    __int16 v10 = 136;
LABEL_4:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"encoderStreamWriteHeader",  v10,  99,  0,  v9,  a7,  a8,  v24);
    return 0xFFFFFFFFLL;
  }

  *(_BYTE *)(a1 + 96) = 0;
  if (!*((void *)header + 2)) {
    return 0LL;
  }
  if (*(void *)(a1 + 88))
  {
    v14.iint key = 5521744;
    uint32_t KeyIndex = AAHeaderGetKeyIndex(header, v14);
    if ((KeyIndex & 0x80000000) == 0)
    {
      unsigned int FieldString = AAHeaderGetFieldString(header, KeyIndex, 0x400uLL, (char *)(a1 + 96), 0LL);
      int v17 = FieldString <= 1 ? 1 : FieldString;
      if (v17 >= 1
        && ((*(uint64_t (**)(void, uint64_t, uint64_t, void))(a1 + 88))( *(void *)(a1 + 80),  31LL,  a1 + 96,  0LL) & 0x80000000) != 0)
      {
        return 0xFFFFFFFFLL;
      }
    }
  }

  if ((aaHeaderBlobArrayInitWithHeader(a1 + 48, header) & 0x80000000) != 0)
  {
    uint64_t v9 = "initializing blob array";
    __int16 v10 = 159;
    goto LABEL_4;
  }

  if ((writeOBuf((void *)a1, *((char **)header + 4), *((void *)header + 2)) & 0x80000000) != 0)
  {
    uint64_t v9 = "writing header blob";
    __int16 v10 = 162;
    goto LABEL_4;
  }

  *(_DWORD *)(a1 + 64) = 0;
  uint64_t v18 = *(unsigned int *)(a1 + 48);
  if ((_DWORD)v18 && (uint64_t v19 = *(void *)(a1 + 56), !*(void *)(v19 + 8)))
  {
    uint64_t v21 = (uint64_t *)(v19 + 32);
    uint64_t v22 = 1LL;
    do
    {
      unsigned int v20 = v22;
      if (v18 == v22) {
        break;
      }
      uint64_t v23 = *v21;
      v21 += 3;
      ++v22;
    }

    while (!v23);
    *(_DWORD *)(a1 + 64) = v20;
  }

  else
  {
    unsigned int v20 = 0;
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 72) = v20 < v18;
  ++*(_DWORD *)(a1 + 1128);
  return result;
}

uint64_t encoderStreamWriteBlob( uint64_t a1, int a2, char *a3, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v36[2] = *MEMORY[0x1895F89C0];
  int v35 = a2;
  if (*(_DWORD *)(a1 + 68)) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0LL;
  }
  if (!*(_DWORD *)(a1 + 72))
  {
    int v17 = "receiving blob data outside of entry";
    __int16 v18 = 187;
LABEL_12:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"encoderStreamWriteBlob",  v18,  99,  0,  v17,  a7,  a8,  (char)v34);
    return 0xFFFFFFFFLL;
  }

  unsigned int v11 = *(_DWORD *)(a1 + 64);
  if (v11 >= *(_DWORD *)(a1 + 48))
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"encoderStreamWriteBlob",  190,  99,  0,  "unexpected blob data received: %llu B",  a7,  a8,  a4);
    return 0xFFFFFFFFLL;
  }

  uint64_t v12 = *(void *)(a1 + 56);
  if (*(_DWORD *)(v12 + 24LL * v11) != a2)
  {
    uint64_t v34 = &v35;
    int v17 = "unexpected blob key: received %s, expecting %s";
    __int16 v18 = 192;
    goto LABEL_12;
  }

  uint64_t v13 = v12 + 24LL * v11;
  size_t v15 = *(void *)(v13 + 8);
  AAFieldKey v14 = (void *)(v13 + 8);
  if (v15 >= a4)
  {
    int v21 = writeOBuf((void *)a1, a3, a4);
    if (v21 < 0) {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"encoderStreamWriteBlob",  201,  99,  0,  "writing data blob",  v19,  v20,  (char)v34);
    }
    size_t v22 = *v14 - a4;
    BOOL v32 = *v14 == a4;
    *AAFieldKey v14 = v22;
    if (v32)
    {
      int v23 = *(_DWORD *)(a1 + 64);
      uint64_t v24 = (v23 + 1);
      *(_DWORD *)(a1 + 64) = v24;
      uint64_t v25 = *(unsigned int *)(a1 + 48);
      if (v24 < v25)
      {
        uint64_t v26 = *(void *)(a1 + 56);
        if (!*(void *)(v26 + 24LL * v24 + 8))
        {
          uint64_t v27 = (uint64_t *)(v26 + 24LL * v24 + 32);
          uint64_t v28 = ~v24 + v25;
          int v29 = v23 + 2;
          do
          {
            LODWORD(v24) = v29;
            if (!v28) {
              break;
            }
            uint64_t v30 = *v27;
            v27 += 3;
            --v28;
            ++v29;
          }

          while (!v30);
          *(_DWORD *)(a1 + 64) = v24;
        }
      }

      *(_DWORD *)(a1 + 72) = v24 < v25;
    }

    int v31 = *(uint64_t (**)(void, uint64_t, uint64_t, void *))(a1 + 88);
    if (v31) {
      BOOL v32 = (a2 & 0xFFFFFF) == 5521732;
    }
    else {
      BOOL v32 = 0;
    }
    if (!v32) {
      return (v21 >> 31);
    }
    if (!*(_BYTE *)(a1 + 96)) {
      return (v21 >> 31);
    }
    size_t v33 = *(void *)(v12 + 24LL * v11 + 16) - v22;
    v36[0] = *(void *)(v12 + 24LL * v11 + 16);
    v36[1] = v33;
    if ((v31(*(void *)(a1 + 80), 31LL, a1 + 96, v36) & 0x80000000) == 0) {
      return (v21 >> 31);
    }
    int v17 = "client callback cancel";
    __int16 v18 = 220;
    goto LABEL_12;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"encoderStreamWriteBlob",  193,  99,  0,  "extra data received for blob %s: received %llu, expecting %llu",  a7,  a8,  a4);
  return 0xFFFFFFFFLL;
}

uint64_t flushOBuf(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    return 0LL;
  }
  unint64_t v3 = 0LL;
  while (1)
  {
    ssize_t v4 = AAByteStreamWrite(*(AAByteStream *)(a1 + 16), (const void *)(*(void *)(a1 + 40) + v3), v1 - v3);
    if (v4 < 1) {
      break;
    }
    v3 += v4;
    *(void *)(a1 + 1120) += v4;
    unint64_t v1 = *(void *)(a1 + 32);
    if (v3 >= v1)
    {
      uint64_t result = 0LL;
      *(void *)(a1 + 32) = 0LL;
      return result;
    }
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"flushOBuf",  54,  99,  0,  "Writing to ostream failed",  v5,  v6,  v8);
  return 0xFFFFFFFFLL;
}

uint64_t writeOBuf(void *a1, char *__src, size_t a3)
{
  if (!a3) {
    return 0LL;
  }
  size_t v3 = a3;
  size_t v6 = a1[4];
  while (1)
  {
    size_t v7 = a1[3];
    if (v6 == v7) {
      break;
    }
LABEL_6:
    if (v6 + v3 <= v7) {
      size_t v10 = v3;
    }
    else {
      size_t v10 = v7 - v6;
    }
    memcpy((void *)(a1[5] + v6), __src, v10);
    size_t v6 = a1[4] + v10;
    a1[4] = v6;
    __src += v10;
    v3 -= v10;
    if (!v3) {
      return 0LL;
    }
  }

  if ((flushOBuf((uint64_t)a1) & 0x80000000) == 0)
  {
    size_t v7 = a1[3];
    size_t v6 = a1[4];
    goto LABEL_6;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAEncodeArchiveOutputStream.c",  (uint64_t)"writeOBuf",  70,  99,  0,  "flush output buffer failed",  v8,  v9,  v12);
  return 0xFFFFFFFFLL;
}

uint64_t forceInPlaceControls( unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  if (a1 <= a2) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = a1;
  }
  size_t v9 = ((v8 + 4095) >> 12) + 16;
  if (a5 >= 3) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "Post-processing ctrl for in-place patching, %u pages\n", v9);
  }
  size_t v10 = calloc(v9, 4uLL);
  unsigned int v11 = (char *)calloc(v9, 4uLL);
  char v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if (a4)
    {
      unint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      int v21 = v9;
      do
      {
        size_t v22 = (unint64_t *)(a3 + 24 * v20);
        unint64_t v23 = *v22;
        if ((*v22 & 0x8000000000000000LL) != 0LL) {
          unint64_t v23 = 0x8000000000000000LL - *v22;
        }
        uint64_t v24 = v22[2];
        if (v24 < 0) {
          uint64_t v24 = 0x8000000000000000LL - v24;
        }
        unint64_t v25 = v19 >> 12;
        if (v23) {
          int v26 = ((v19 + v23 - 1) >> 12) - (v19 >> 12) + 1;
        }
        else {
          int v26 = 0;
        }
        uint64_t v27 = (v26 + v25);
        if (v27 > v25)
        {
          uint64_t v28 = &v10[v25];
          uint64_t v29 = v27 - v25;
          do
          {
            int v21 = (__PAIR64__(v21, (*v28++)++) - 1) >> 32;
            --v29;
          }

          while (v29);
        }

        v19 += v23 + v24;
        ++v20;
      }

      while (v20 != a4);
    }

    else
    {
      int v21 = v9;
    }

    if (a5 > 1) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "After input pages retained, %u free pages\n", v21);
    }
    if (a4)
    {
      unint64_t v30 = 0LL;
      unint64_t v31 = 0LL;
      uint64_t v32 = 0LL;
      int v33 = v21;
      do
      {
        uint64_t v34 = (unint64_t *)(a3 + 24 * v32);
        uint64_t v35 = v34[1];
        unint64_t v36 = 0x8000000000000000LL - *v34;
        if ((*v34 & 0x8000000000000000LL) == 0LL) {
          unint64_t v36 = *v34;
        }
        unint64_t v37 = 0x8000000000000000LL - v35;
        if (v35 >= 0) {
          unint64_t v37 = v34[1];
        }
        uint64_t v38 = v34[2];
        if (v38 < 0) {
          uint64_t v38 = 0x8000000000000000LL - v38;
        }
        if (v36)
        {
          unint64_t v39 = v36 + v30;
          do
          {
            unint64_t v40 = (v30 & 0xFFFFFFFFFFFFF000LL) + 4096;
            if (v40 >= v39) {
              unint64_t v40 = v39;
            }
            unint64_t v41 = v31 >> 12;
            unint64_t v42 = v40 - v30;
            if (v40 == v30) {
              int v43 = 0;
            }
            else {
              int v43 = ((v31 + v42 - 1) >> 12) - v41 + 1;
            }
            unint64_t v44 = v30 >> 12;
            int v45 = v10[v44] - 1;
            v10[v44] = v45;
            if (!v45) {
              ++v21;
            }
            uint64_t v46 = (v43 + v41);
            if (v46 > v41)
            {
              BOOL v47 = &v12[4 * v41];
              uint64_t v48 = v46 - v41;
              do
              {
                int v21 = (__PAIR64__(v21, (*(_DWORD *)v47)++) - 1) >> 32;
                v47 += 4;
                --v48;
              }

              while (v48);
            }

            v31 += v42;
            if (v21 < v33) {
              int v33 = v21;
            }
            unint64_t v30 = v40;
            v36 -= v42;
          }

          while (v36);
        }

        else
        {
          unint64_t v40 = v30;
        }

        unint64_t v30 = v40 + v38;
        v31 += v37;
        ++v32;
      }

      while (v32 != a4);
    }

    else
    {
      int v33 = v21;
    }

    if (a5 > 2)
    {
      uint64_t v49 = (FILE **)MEMORY[0x1895F89D0];
      fprintf((FILE *)*MEMORY[0x1895F89D0], "Free pages after diff controls: %u\n", v21);
      fprintf(*v49, "Min free pages reached: %d\n", v33);
    }

    bzero(v10, 4 * v9);
    if (a4)
    {
      unint64_t v50 = 0LL;
      uint64_t v51 = 0LL;
      do
      {
        int v52 = (unint64_t *)(a3 + 24 * v51);
        unint64_t v53 = *v52;
        if ((*v52 & 0x8000000000000000LL) != 0LL) {
          unint64_t v53 = 0x8000000000000000LL - *v52;
        }
        uint64_t v54 = v52[2];
        if (v54 < 0) {
          uint64_t v54 = 0x8000000000000000LL - v54;
        }
        unint64_t v55 = v50 >> 12;
        if (v53) {
          int v56 = ((v50 + v53 - 1) >> 12) - (v50 >> 12) + 1;
        }
        else {
          int v56 = 0;
        }
        uint64_t v57 = (v56 + v55);
        if (v57 > v55)
        {
          uint32_t v58 = &v10[v55];
          uint64_t v59 = v57 - v55;
          do
          {
            ++*v58++;
            --v59;
          }

          while (v59);
        }

        v50 += v53 + v54;
        ++v51;
      }

      while (v51 != a4);
      BOOL v60 = v33 < 4;
      uint64_t v81 = v12;
      if (v33 <= 3)
      {
        uint64_t v82 = a3;
        unint64_t v83 = a4;
        unint64_t v61 = 0LL;
        unint64_t v62 = 0LL;
        int64x2_t v63 = vdupq_n_s64(0x8000000000000000LL);
        int64x2_t v84 = v63;
        do
        {
          unint64_t v64 = (int64x2_t *)(v82 + 24 * v61);
          int64x2_t v65 = (int64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(*v64), (int8x16_t)vsubq_s64(v63, *v64), *(int8x16_t *)v64);
          uint64_t v66 = v64[1].i64[0];
          if (v66 >= 0) {
            uint64_t v67 = v64[1].i64[0];
          }
          else {
            uint64_t v67 = 0x8000000000000000LL - v66;
          }
          if (a5 >= 3)
          {
            int64x2_t v87 = v65;
            fprintf((FILE *)*MEMORY[0x1895F89D0], "ctrl[%zu]: ndiff=%llu nlit=%llu\n", v61, v65.i64[0], v65.i64[1]);
            int64x2_t v65 = v87;
            int64x2_t v63 = v84;
          }

          unint64_t v68 = v65.i64[0];
          if (v65.i64[0])
          {
            do
            {
              unint64_t v69 = v65.i64[0] + v62;
              unint64_t v70 = (v65.i64[0] + v62 - 1) & 0xFFFFFFFFFFFFF000LL;
              if (v70 <= v62) {
                unint64_t v70 = v62;
              }
              int v71 = v10[(v70 >> 12)] - 1;
              v10[(v70 >> 12)] = v71;
              if (!v71) {
                ++v33;
              }
              unint64_t v72 = v69 - v70;
              int64x2_t v73 = vdupq_n_s64(v69 - v70);
              unint64_t v74 = vsubq_s64(v65, v73).u64[0];
              if (a5 >= 3)
              {
                int64x2_t v88 = v65;
                int64x2_t v85 = v73;
                unint64_t v86 = v74;
                fprintf( (FILE *)*MEMORY[0x1895F89D0],  "ctrl[%zu]: moving %llu bytes from diff to lit (minFree=%d, ndiff=%llu)\n",  v61,  v72,  v33,  v74);
                int64x2_t v73 = v85;
                unint64_t v74 = v86;
                int64x2_t v65 = v88;
                int64x2_t v63 = v84;
              }

              int64x2_t v75 = vaddq_s64(v65, v73);
              v65.i64[0] = v74;
              v65.i64[1] = v75.i64[1];
              v67 += v72;
              *(int8x16_t *)unint64_t v64 = vbslq_s8((int8x16_t)vcltzq_s64(v65), (int8x16_t)vsubq_s64(v63, v65), (int8x16_t)v65);
              uint64_t v76 = 0x8000000000000000LL - v67;
              if (v67 >= 0) {
                uint64_t v76 = v67;
              }
              v64[1].i64[0] = v76;
              unint64_t v68 = v74;
            }

            while (v33 <= 3 && v74 != 0);
          }

          ++v61;
          BOOL v60 = v33 < 4;
          if (v61 >= v83) {
            break;
          }
          v62 += v68 + v67;
        }

        while (v33 <= 3);
      }

      char v12 = v81;
      if (v60) {
        goto LABEL_96;
      }
    }

    else if (v33 < 4)
    {
LABEL_96:
      char v80 = 4;
      int v17 = "Could not reduce minFree to %d, something is wrong";
      __int16 v18 = 264;
      int v14 = 0;
      goto LABEL_97;
    }

    uint64_t v78 = 0LL;
    goto LABEL_100;
  }

  int v14 = *__error();
  int v17 = "malloc";
  __int16 v18 = 139;
LABEL_97:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c",  (uint64_t)"forceInPlaceControls",  v18,  53,  v14,  v17,  v15,  v16,  v80);
  uint64_t v78 = 0xFFFFFFFFLL;
LABEL_100:
  free(v10);
  free(v12);
  return v78;
}

void *initDiffSegmentVector(void *result)
{
  *uint64_t result = 0LL;
  result[1] = 0LL;
  result[2] = 0LL;
  return result;
}

uint64_t reserveDiffSegmentVector(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 8) >= a2) {
    return 0LL;
  }
  *(void *)(a1 + 8) = a2;
  size_t v3 = reallocf(*(void **)(a1 + 16), 24 * a2);
  *(void *)(a1 + 16) = v3;
  if (v3) {
    return 0LL;
  }
  uint64_t v5 = __error();
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c",  (uint64_t)"reserveDiffSegmentVector",  327,  53,  *v5,  "reallocf",  v6,  v7,  v8);
  return 0xFFFFFFFFLL;
}

__n128 pushDiffSegment(unint64_t *a1, __n128 *a2)
{
  if (!a2[1].n128_u64[0]) {
    return result;
  }
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (*a1 < v5)
  {
LABEL_10:
    unint64_t v8 = a1[2];
    *a1 = v4 + 1;
    size_t v9 = (__n128 *)(v8 + 24 * v4);
    __n128 result = *a2;
    v9[1].n128_u64[0] = a2[1].n128_u64[0];
    *size_t v9 = result;
    return result;
  }

  if (v5) {
    unint64_t v6 = v5 + (v5 >> 1);
  }
  else {
    unint64_t v6 = 64LL;
  }
  if (!reserveDiffSegmentVector((uint64_t)a1, v6))
  {
    unint64_t v4 = *a1;
    goto LABEL_10;
  }

  return result;
}

uint64_t pushControls( unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  if (a3)
  {
    uint64_t v9 = 0LL;
    size_t v10 = (unint64_t *)(a2 + 16);
    int v11 = 1;
    do
    {
      uint64_t v12 = *(v10 - 2);
      uint64_t v13 = *(v10 - 1);
      if (v12 >= 0) {
        unint64_t v14 = *(v10 - 2);
      }
      else {
        unint64_t v14 = 0x8000000000000000LL - v12;
      }
      if (v13 >= 0) {
        unint64_t v15 = *(v10 - 1);
      }
      else {
        unint64_t v15 = 0x8000000000000000LL - v13;
      }
      if ((*v10 & 0x8000000000000000LL) == 0LL) {
        unint64_t v16 = *v10;
      }
      else {
        unint64_t v16 = 0x8000000000000000LL - *v10;
      }
      v21.n128_u64[0] = a5;
      v21.n128_u64[1] = a4;
      unint64_t v22 = v14;
      pushDiffSegment(a1, &v21);
      if (v17) {
        break;
      }
      unint64_t v18 = v14 + a5;
      v21.n128_u64[0] = v18;
      v21.n128_u64[1] = -1LL;
      unint64_t v22 = v15;
      pushDiffSegment(a1, &v21);
      if (v19) {
        break;
      }
      v10 += 3;
      a4 += v14 + v16;
      a5 = v18 + v15;
      int v11 = ++v9 < a3;
    }

    while (a3 != v9);
  }

  else
  {
    int v11 = 0;
  }

  return (v11 << 31 >> 31);
}

uint64_t mergeDiffSegmentVectors( unint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  __int128 v61 = 0uLL;
  unint64_t v62 = 0LL;
  do
  {
    unint64_t v14 = &a2[3 * v13];
    uint64_t v15 = *v14;
    if (!*v14)
    {
      uint64_t v38 = "empty segment vector";
      __int16 v39 = 429;
LABEL_62:
      int v37 = 0;
LABEL_32:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c",  (uint64_t)"mergeDiffSegmentVectors",  v39,  53,  v37,  v38,  a7,  a8,  v56);
      goto LABEL_33;
    }

    unint64_t v16 = (uint64_t *)(v14[2] + 16);
    do
    {
      if (v10 + 4 > v11)
      {
        v11 += 0x4000LL;
        uint64_t v12 = (char *)reallocf(v12, 16 * v11);
        if (!v12)
        {
          int v37 = *__error();
          uint64_t v38 = "malloc";
          __int16 v39 = 437;
          goto LABEL_32;
        }
      }

      uint64_t v17 = *(v16 - 2);
      if (*(v16 - 1) == -1)
      {
        uint64_t v20 = *v16;
        __n128 v21 = &v12[16 * v10];
        *(void *)__n128 v21 = v17;
        v17 += v20;
        uint64_t v19 = v10 + 1;
        *((_DWORD *)v21 + 2) = 1;
        int v18 = -1;
      }

      else
      {
        int v18 = 0;
        uint64_t v19 = v10;
      }

      unint64_t v22 = &v12[16 * v19];
      *(void *)unint64_t v22 = v17;
      *((_DWORD *)v22 + 2) = v18;
      uint64_t v10 = v19 + 1;
      v16 += 3;
      --v15;
    }

    while (v15);
    ++v13;
  }

  while (v13 != a1);
  uint64_t v23 = a2[2] + 24LL * *a2;
  size_t v24 = v19 + 2;
  unint64_t v25 = &v12[16 * v10];
  *(void *)unint64_t v25 = *(void *)(v23 - 8) + *(void *)(v23 - 24);
  *((_DWORD *)v25 + 2) = 0;
  qsort(v12, v24, 0x10uLL, (int (__cdecl *)(const void *, const void *))mergeDiffSegmentEventCompareProc);
  if (v24)
  {
    size_t v26 = 0LL;
    unint64_t v27 = 0LL;
    int v28 = 0;
    while (1)
    {
      int v29 = 0;
      uint64_t v30 = *(void *)&v12[16 * v26];
      if (v24 <= v26 + 1) {
        size_t v31 = v26 + 1;
      }
      else {
        size_t v31 = v24;
      }
      uint64_t v32 = &v12[16 * v26 + 8];
      while (*((void *)v32 - 1) == v30)
      {
        int v33 = *(_DWORD *)v32;
        v32 += 16;
        v29 += v33;
        if (v31 == ++v26)
        {
          size_t v26 = v31;
          break;
        }
      }

      if (v29 | v28)
      {
        if (!v29) {
          goto LABEL_28;
        }
        if (!v28)
        {
          unint64_t v36 = &v12[16 * v27];
          *(void *)unint64_t v36 = v30;
          *((_DWORD *)v36 + 2) = 1;
          ++v27;
        }

        v28 += v29;
        if (v28) {
          goto LABEL_28;
        }
        int v34 = -1;
      }

      else
      {
        int v34 = 0;
      }

      int v28 = 0;
      uint64_t v35 = &v12[16 * v27];
      *(void *)uint64_t v35 = v30;
      *((_DWORD *)v35 + 2) = v34;
      ++v27;
LABEL_28:
      if (v26 >= v24) {
        goto LABEL_39;
      }
    }
  }

  unint64_t v27 = 0LL;
LABEL_39:
  uint64_t v42 = 0LL;
  if (a1 <= 1) {
    uint64_t v43 = 1LL;
  }
  else {
    uint64_t v43 = a1;
  }
  uint64_t v56 = v43;
  while (1)
  {
    unint64_t v44 = &a2[3 * v42];
    unint64_t v45 = *v44;
    unint64_t v58 = v44[2];
    uint64_t v57 = v42;
    if (v27)
    {
      uint64_t v46 = 0LL;
      unint64_t v47 = 0LL;
      int v48 = 0;
      unint64_t v49 = 0LL;
      while (1)
      {
        unint64_t v50 = (unint64_t *)&v12[16 * v46];
        unint64_t v51 = *v50;
        if (v49 < v45)
        {
          int v52 = (void *)(v58 + 16 + 24 * v49);
          while (*v52 + *(v52 - 2) < v51)
          {
            v52 += 3;
            if (v45 == ++v49) {
              goto LABEL_61;
            }
          }
        }

        if (v49 == v45) {
          break;
        }
        if (v46)
        {
          if (v48) {
            unint64_t v53 = -1LL;
          }
          else {
            unint64_t v53 = *(void *)(v58 + 24 * v49 + 8) + v47 - *(void *)(v58 + 24 * v49);
          }
          v59.n128_u64[0] = v47;
          v59.n128_u64[1] = v53;
          unint64_t v60 = v51 - v47;
          pushDiffSegment((unint64_t *)&v61, &v59);
          unint64_t v47 = *v50;
        }

        else
        {
          unint64_t v47 = *v50;
        }

        v48 += *(_DWORD *)&v12[16 * v46++ + 8];
        if (v46 == v27) {
          goto LABEL_59;
        }
      }

uint64_t mergeDiffSegmentEventCompareProc(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < *(void *)a2) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)a2 >= *(void *)a1) {
    return (*(_DWORD *)(a1 + 8) - *(_DWORD *)(a2 + 8));
  }
  return 1LL;
}

uint64_t getComboControlsFromMergedDiffSegmentVectors(char *a1, uint64_t *a2, void *a3, uint64_t *a4)
{
  if (!a1)
  {
    uint64_t v16 = 0LL;
LABEL_39:
    uint64_t v39 = 0LL;
    goto LABEL_40;
  }

  size_t v7 = (size_t)a1;
  uint64_t v8 = *a2;
  uint64_t v9 = a1 + 2;
  uint64_t v10 = (char *)calloc((size_t)&v9[(void)v9 * *a2], 8uLL);
  if (v10)
  {
    unint64_t v11 = calloc(v7, 8uLL);
    if (v11)
    {
      if (v8)
      {
        uint64_t v12 = 0LL;
        uint64_t v15 = a2[2];
        unint64_t v14 = a2 + 2;
        uint64_t v13 = v15;
        uint64_t v16 = 1LL;
        while (1)
        {
          uint64_t v17 = (uint64_t *)&v10[8 * v16 * (void)v9];
          int v18 = (uint64_t *)&v10[8 * (v16 - 1) * (void)v9];
          uint64_t v19 = *(void *)(v13 + 24 * v12 + 16);
          if (*(void *)(v13 + 24 * v12 + 8) == -1LL)
          {
            if (v19 < 0) {
              uint64_t v19 = 0x8000000000000000LL - v19;
            }
            if (!v18[1])
            {
              v18[1] = v19;
              goto LABEL_25;
            }

            v17[1] = v19;
          }

          else
          {
            uint64_t v20 = (uint64_t *)&v10[8LL * (void)v9 * (v16 - 1) + 16];
            int v21 = 1;
            unint64_t v22 = v14;
            uint64_t v23 = v11;
            size_t v24 = v7;
            do
            {
              uint64_t v25 = *v22;
              v22 += 3;
              uint64_t v26 = *(void *)(v25 + 24 * v12 + 8);
              uint64_t v27 = v26 - *v23;
              if (v26 != *v23) {
                int v21 = 0;
              }
              *v23++ = v26 + v19;
              uint64_t v28 = 0x8000000000000000LL - v27;
              if (v27 >= 0) {
                uint64_t v28 = v27;
              }
              *v20++ = v28;
              --v24;
            }

            while (v24);
            if (v21)
            {
              uint64_t v29 = v18[1];
              if (v29 < 0) {
                uint64_t v29 = 0x8000000000000000LL - v29;
              }
              if (!v29)
              {
                unint64_t v31 = *v18;
                if (*v18 < 0) {
                  unint64_t v31 = 0x8000000000000000LL - *v18;
                }
                BOOL v32 = __OFADD__(v31, v19);
                uint64_t v33 = v31 + v19;
                if (v33 < 0 != v32) {
                  uint64_t v33 = 0x8000000000000000LL - v33;
                }
                *int v18 = v33;
                goto LABEL_25;
              }
            }

            uint64_t v30 = 0x8000000000000000LL - v19;
            if (v19 >= 0) {
              uint64_t v30 = v19;
            }
            *uint64_t v17 = v30;
          }

          ++v16;
LABEL_25:
          if (++v12 == v8) {
            goto LABEL_38;
          }
        }
      }

      uint64_t v16 = 1LL;
LABEL_38:
      free(v11);
      a1 = (char *)reallocToFit(v10, 8 * (void)v9 * v16);
      goto LABEL_39;
    }

    int v34 = *__error();
    int v37 = "calloc ipos";
    __int16 v38 = 600;
  }

  else
  {
    int v34 = *__error();
    int v37 = "calloc controls";
    __int16 v38 = 596;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelDiff/BXDiffControls.c",  (uint64_t)"getComboControlsFromMergedDiffSegmentVectors",  v38,  53,  v34,  v37,  v35,  v36,  v41);
  free(v10);
  a1 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v39 = 0xFFFFFFFFLL;
LABEL_40:
  *a3 = a1;
  *a4 = v16;
  return v39;
}

ssize_t decodeStreamRefillBuffer(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 1128))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    do
    {
      uint64_t v4 = *(void *)(a1 + 40);
      if (v4 == v3) {
        break;
      }
      ssize_t result = AAByteStreamRead(*(AAByteStream *)(a1 + 8), (void *)(*(void *)(a1 + 48) + v3), v4 - v3);
      if (!result)
      {
        *(_DWORD *)(a1 + 1128) = 1;
        return result;
      }

      if (result < 0)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c",  (uint64_t)"decodeStreamRefillBuffer",  35,  61,  0,  "istream read error",  v5,  v6,  v8);
        return 0xFFFFFFFFLL;
      }

      uint64_t v3 = *(void *)(a1 + 32);
      unint64_t v7 = v3 + result;
      if (!__CFADD__(v3, result) && v7 <= *(void *)(a1 + 40))
      {
        *(void *)(a1 + 32) = v7;
        v3 += result;
      }
    }

    while (!*(_DWORD *)(a1 + 1128));
  }

  return 0LL;
}

uint64_t decodeStreamDiscard(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v2 = a2;
  unint64_t v4 = *(void *)(a1 + 32);
  while (1)
  {
    if (v4 >= v2) {
      unint64_t v5 = v2;
    }
    else {
      unint64_t v5 = v4;
    }
    if (v5)
    {
      unint64_t v6 = v4 - v5;
      if (v4 > v2) {
        memmove(*(void **)(a1 + 48), (const void *)(*(void *)(a1 + 48) + v5), v4 - v5);
      }
      *(void *)(a1 + 32) = v6;
      v2 -= v5;
      *(void *)(a1 + 1136) += v5;
      goto LABEL_12;
    }

    if ((decodeStreamRefillBuffer(a1) & 0x80000000) != 0)
    {
      uint64_t v10 = "refill buffer failed";
      __int16 v11 = 56;
      goto LABEL_17;
    }

    unint64_t v6 = *(void *)(a1 + 32);
    if (!v6) {
      break;
    }
LABEL_12:
    unint64_t v4 = v6;
    if (!v2) {
      return 0LL;
    }
  }

  uint64_t v10 = "discard data failed";
  __int16 v11 = 58;
LABEL_17:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c",  (uint64_t)"decodeStreamDiscard",  v11,  61,  0,  v10,  v7,  v8,  v12);
  return 0xFFFFFFFFLL;
}

uint64_t decodeStreamReadData(uint64_t a1, char *__dst, size_t a3)
{
  if (!a3) {
    return 0LL;
  }
  size_t v3 = a3;
  size_t v6 = *(void *)(a1 + 32);
  while (1)
  {
    if (v6 >= v3) {
      size_t v7 = v3;
    }
    else {
      size_t v7 = v6;
    }
    if (v7)
    {
      memcpy(__dst, *(const void **)(a1 + 48), v7);
      v3 -= v7;
      unint64_t v10 = *(void *)(a1 + 32);
      size_t v6 = v10 - v7;
      if (v10 < v7)
      {
        char v12 = "updating buffer";
        __int16 v13 = 76;
        goto LABEL_19;
      }

      if (v10 != v7) {
        memmove(*(void **)(a1 + 48), (const void *)(*(void *)(a1 + 48) + v7), v10 - v7);
      }
      __dst += v7;
      *(void *)(a1 + 32) = v6;
      *(void *)(a1 + 1136) += v7;
      goto LABEL_13;
    }

    if ((decodeStreamRefillBuffer(a1) & 0x80000000) != 0)
    {
      char v12 = "refill buffer failed";
      __int16 v13 = 82;
      goto LABEL_19;
    }

    size_t v6 = *(void *)(a1 + 32);
    if (!v6) {
      break;
    }
LABEL_13:
    if (!v3) {
      return 0LL;
    }
  }

  char v12 = "load header failed";
  __int16 v13 = 84;
LABEL_19:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c",  (uint64_t)"decodeStreamReadData",  v13,  61,  0,  v12,  v8,  v9,  v14);
  return 0xFFFFFFFFLL;
}

uint64_t decodeStreamLoadHeader( void *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = a1[9];
  size_t v9 = a2 - v8;
  if (a2 <= v8) {
    return 0LL;
  }
  if (a1[10] >= a2)
  {
    if ((decodeStreamReadData((uint64_t)a1, (char *)(a1[8] + v8), v9) & 0x80000000) == 0)
    {
      uint64_t result = 0LL;
      a1[9] += v9;
      return result;
    }

    __int16 v11 = "read error";
    __int16 v12 = 96;
  }

  else
  {
    __int16 v11 = "invalid header size";
    __int16 v12 = 94;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c",  (uint64_t)"decodeStreamLoadHeader",  v12,  61,  0,  v11,  a7,  a8,  v14);
  return 0xFFFFFFFFLL;
}

uint64_t loadAndDecodeHeader_AA( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 72) > 5uLL)
  {
    if ((decodeStreamLoadHeader( (void *)a1,  *(unsigned __int16 *)(*(void *)(a1 + 64) + 4LL),  a3,  a4,  a5,  a6,  a7,  a8) & 0x80000000) != 0)
    {
      unint64_t v8 = "truncated stream";
      __int16 v9 = 110;
    }

    else
    {
      unint64_t v8 = "corrupted archive header";
      __int16 v9 = 113;
    }
  }

  else
  {
    unint64_t v8 = "Invalid decoder state";
    __int16 v9 = 106;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c",  (uint64_t)"loadAndDecodeHeader_AA",  v9,  61,  0,  v8,  a7,  a8,  v12);
  return 0xFFFFFFFFLL;
}

uint64_t decodeStreamHLCFromINO( void *a1, unint64_t a2, unint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v12 = a1[147];
  if (v12 && (__int16 v13 = (unint64_t *)a1[149], *v13 < a2))
  {
    if (v12 < 2)
    {
      uint64_t v14 = 1LL;
LABEL_10:
      unint64_t v18 = a1[148];
      if (v12 >= v18)
      {
        uint64_t v19 = 2 * v18;
        if (!v18) {
          uint64_t v19 = 32LL;
        }
        a1[148] = v19;
        if ((unint64_t)(32 * v19) >= 0x2000000001LL)
        {
          *__error() = 12;
LABEL_31:
          a1[149] = 0LL;
          unint64_t v31 = __error();
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c",  (uint64_t)"decodeStreamHLCFromINO",  146,  61,  *v31,  "malloc",  v32,  v33,  v34);
          a1[147] = 0LL;
          a1[148] = 0LL;
          return -1LL;
        }

        uint64_t v20 = (void *)a1[149];
        int v21 = realloc(v20, 32 * v19);
        if (!v21)
        {
          free(v20);
          goto LABEL_31;
        }

        a1[149] = v21;
        unint64_t v12 = a1[147];
      }

      uint64_t v22 = v14;
      unint64_t v23 = v12 - v14;
      if (v23)
      {
        memmove((void *)(a1[149] + 32 * v14 + 32), (const void *)(a1[149] + 32 * v14), 32 * v23);
        uint64_t v22 = a1[147];
      }

      a1[147] = v22 + 1;
      uint64_t v15 = a1[149];
      uint64_t v24 = v15 + 32 * v14;
      *(void *)uint64_t v24 = a2;
      *(void *)(v24 + 24) = v22;
      *(int64x2_t *)(v24 + 8) = vdupq_n_s64(a3);
      goto LABEL_20;
    }

    uint64_t v28 = 0LL;
    unint64_t v29 = a1[147];
    uint64_t v14 = v29;
    do
    {
      uint64_t v30 = v28 + (v29 >> 1);
      if (v13[4 * v30] >= a2) {
        uint64_t v14 = v30;
      }
      else {
        uint64_t v28 = v30;
      }
      unint64_t v29 = v14 - v28;
    }

    while ((unint64_t)(v14 - v28) > 1);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  if (v14 == v12) {
    goto LABEL_10;
  }
  uint64_t v15 = a1[149];
  if (*(void *)(v15 + 32 * v14) != a2) {
    goto LABEL_10;
  }
  if (*(void *)(v15 + 32 * v14 + 8) == a3)
  {
LABEL_20:
    uint64_t v25 = v15 + 32 * v14;
    unint64_t v26 = *(void *)(v25 + 16) - 1LL;
    *(void *)(v25 + 16) = v26;
    if (v26 < a3)
    {
      *a4 = v26 == 0;
      return *(void *)(v25 + 24);
    }

    uint64_t v16 = "invalid nlink";
    __int16 v17 = 165;
    goto LABEL_23;
  }

  uint64_t v16 = "nlink mismatch";
  __int16 v17 = 163;
LABEL_23:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c",  (uint64_t)"decodeStreamHLCFromINO",  v17,  61,  0,  v16,  a7,  a8,  v34);
  return -1LL;
}

AAArchiveStream AADecodeArchiveInputStreamOpen( AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  __int16 v9 = (char *)malloc(0x4C0uLL);
  unint64_t v10 = v9;
  if (v9) {
    memset_s(v9, 0x4C0uLL, 0, 0x4C0uLL);
  }
  __int16 v11 = malloc(0x38uLL);
  unint64_t v12 = v11;
  if (!v11 || (memset_s(v11, 0x38uLL, 0, 0x38uLL), !v10))
  {
    int v21 = *__error();
    uint64_t v22 = "malloc";
    __int16 v23 = 388;
LABEL_19:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c",  (uint64_t)"AADecodeArchiveInputStreamOpen",  v23,  61,  v21,  v22,  v19,  v20,  v25);
    free(v12);
    decodeStreamClose(v10);
    return 0LL;
  }

  size_t v13 = *((void *)v10 + 5);
  if (!(v13 >> 18))
  {
    do
    {
      size_t v14 = (v13 >> 1) + v13;
      if (((v13 >> 1) & v13) != 0) {
        size_t v14 = ((v13 >> 1) & v13) + v13;
      }
      if (v13) {
        size_t v13 = v14;
      }
      else {
        size_t v13 = 0x4000LL;
      }
    }

    while (v13 < 0x40000);
    uint64_t v15 = (void *)*((void *)v10 + 6);
    uint64_t v16 = realloc(v15, v13);
    if (!v16)
    {
      free(v15);
      *((void *)v10 + 4) = 0LL;
      *((void *)v10 + 5) = 0LL;
      *((void *)v10 + 6) = 0LL;
      uint64_t v22 = "init buffer";
      __int16 v23 = 391;
      goto LABEL_24;
    }

    *((void *)v10 + 5) = v13;
    *((void *)v10 + 6) = v16;
  }

  *((void *)v10 + 1) = stream;
  *((_DWORD *)v10 + 14) = -1;
  *(_OWORD *)(v10 + 72) = xmmword_1862D8160;
  __int16 v17 = malloc(0x10000uLL);
  *((void *)v10 + 8) = v17;
  if (!v17)
  {
    int v21 = *__error();
    uint64_t v22 = "malloc";
    __int16 v23 = 397;
    goto LABEL_19;
  }

  *((void *)v10 + 11) = AAHeaderCreate();
  AAHeader v18 = AAHeaderCreate();
  *((void *)v10 + 12) = v18;
  if (!*((void *)v10 + 11) || !v18)
  {
    uint64_t v22 = "allocating header";
    __int16 v23 = 400;
LABEL_24:
    int v21 = 0;
    goto LABEL_19;
  }

  *(void *)unint64_t v10 = flags;
  *((void *)v10 + 2) = msg_proc;
  *((void *)v10 + 3) = msg_data;
  *((double *)v10 + 151) = getRealTime();
  v12[5] = decodeStreamReadHeader;
  v12[6] = decodeStreamReadBlob;
  *unint64_t v12 = v10;
  v12[1] = decodeStreamClose;
  v12[2] = decodeStreamAbort;
  return (AAArchiveStream)v12;
}

uint64_t decodeStreamReadHeader( uint64_t a1, AAHeader *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 1132)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v51 = 0LL;
  uint64_t v52 = 0LL;
  unint64_t v10 = *(void *)(a1 + 1136);
  unint64_t v11 = *(void *)(a1 + 1144);
  if (v11 < v10)
  {
    unint64_t v12 = "invalid state";
    __int16 v13 = 193;
    goto LABEL_66;
  }

  if ((decodeStreamDiscard(a1, v11 - v10) & 0x80000000) != 0)
  {
    unint64_t v12 = "truncated archive";
    __int16 v13 = 194;
    goto LABEL_66;
  }

  if (!*(void *)(a1 + 32))
  {
    if (*(_DWORD *)(a1 + 1128)) {
      goto LABEL_85;
    }
    if ((decodeStreamRefillBuffer(a1) & 0x80000000) != 0)
    {
      unint64_t v12 = "refill buffer";
      __int16 v13 = 199;
      goto LABEL_66;
    }

    if (!*(void *)(a1 + 32))
    {
LABEL_85:
      if (*(_DWORD *)(a1 + 1128)) {
        return 0LL;
      }
    }
  }

  uint64_t v18 = *(void *)(a1 + 1136);
  *(_BYTE *)(a1 + 104) = 0;
  *(void *)(a1 + 72) = 0LL;
  if ((decodeStreamLoadHeader((void *)a1, 6uLL, v14, v15, v16, v17, a7, a8) & 0x80000000) != 0)
  {
    unint64_t v12 = "truncated stream";
    __int16 v13 = 209;
    goto LABEL_66;
  }

  int v24 = *(_DWORD *)(a1 + 56);
  if (v24 < 0)
  {
    char v25 = *(int **)(a1 + 64);
    if (*v25 == 825246017 || *v25 == 826360153)
    {
      *(_DWORD *)(a1 + 56) = 0;
LABEL_32:
      int v30 = loadAndDecodeHeader_AA(a1, v19, v20, v21, v22, v23, a7, a8);
      goto LABEL_39;
    }

    if (*v25 == 925906736 && *((_WORD *)v25 + 2) == 12592)
    {
      int v31 = 1;
    }

    else
    {
      int v27 = *v25;
      int v28 = *((unsigned __int16 *)v25 + 2);
      if (v27 != 925906736 || v28 != 14128)
      {
        unint64_t v12 = "Invalid/non-supported archive stream";
        __int16 v13 = 226;
        goto LABEL_66;
      }

      int v31 = 2;
    }

    *(_DWORD *)(a1 + 56) = v31;
    goto LABEL_38;
  }

  if ((v24 - 1) < 2)
  {
LABEL_38:
    int v30 = loadAndDecodeHeader_Cpio((uint64_t *)a1, (unint64_t *)&v52);
    goto LABEL_39;
  }

  if (v24 != 3)
  {
    if (v24)
    {
      unint64_t v12 = "Invalid archive stream";
      __int16 v13 = 240;
      goto LABEL_66;
    }

    goto LABEL_32;
  }

  int v30 = loadAndDecodeHeader_Ustar(a1, (uint64_t *)&v52);
LABEL_39:
  if (v30 < 0)
  {
    unint64_t v12 = "parsing entry header";
    __int16 v13 = 242;
    goto LABEL_66;
  }

  if (v30) {
    return 0LL;
  }
  uint64_t v33 = *(void *)(a1 + 72);
  char v34 = *(AAHeader_impl **)(a1 + 88);
  v35.iint key = 5265748;
  uint32_t KeyIndex = AAHeaderGetKeyIndex(v34, v35);
  if ((KeyIndex & 0x80000000) != 0
    || ((FieldUInt = AAHeaderGetFieldUInt(v34, KeyIndex, &v51), FieldUInt <= 1) ? (int v38 = 1) : (int v38 = FieldUInt), v38 <= 0))
  {
    unint64_t v12 = "Invalid entry: no TYP field";
    __int16 v13 = 249;
    goto LABEL_66;
  }

  if (v51 != 77)
  {
    uint64_t v39 = *(AAHeader_impl **)(a1 + 88);
    v40.iint key = 5521744;
    uint32_t v41 = AAHeaderGetKeyIndex(v39, v40);
    if ((v41 & 0x80000000) == 0)
    {
      unsigned int FieldString = AAHeaderGetFieldString(v39, v41, 0x400uLL, (char *)(a1 + 104), 0LL);
      int v43 = FieldString <= 1 ? 1 : FieldString;
      if (v43 >= 1)
      {
        size_t v44 = strlen((const char *)(a1 + 104));
        if (!pathIsValid((_BYTE *)(a1 + 104), v44))
        {
          unint64_t v12 = "Invalid entry path";
          __int16 v13 = 255;
          goto LABEL_66;
        }
      }
    }
  }

  unint64_t v45 = *(uint64_t (**)(void, uint64_t, uint64_t, void))(a1 + 16);
  if (v45 && *(_BYTE *)(a1 + 104) && (v45(*(void *)(a1 + 24), 60LL, a1 + 104, 0LL) & 0x80000000) != 0)
  {
    unint64_t v12 = "callback cancel";
    __int16 v13 = 262;
    goto LABEL_66;
  }

  if ((aaHeaderBlobArrayInitWithHeader(a1 + 1152, *(AAHeader_impl **)(a1 + 88)) & 0x80000000) != 0)
  {
    unint64_t v12 = "initializing blob array";
    __int16 v13 = 266;
    goto LABEL_66;
  }

  *(_DWORD *)(a1 + 1168) = 0;
  if (!*(_DWORD *)(a1 + 56)) {
    uint64_t v52 = aaHeaderBlobArrayPayloadSize((unsigned int *)(a1 + 1152));
  }
  if (!a2)
  {
LABEL_77:
    ++*(void *)(a1 + 1200);
    *(void *)(a1 + 1144) = v33 + v18 + v52;
    return 1LL;
  }

  uint64_t v46 = *a2;
  if (*a2)
  {
    if (AAHeaderAssign(*a2, *(AAHeader *)(a1 + 88)) < 0)
    {
      unint64_t v12 = "header init";
      __int16 v13 = 286;
      goto LABEL_66;
    }
  }

  else
  {
    uint64_t v46 = AAHeaderClone(*(AAHeader *)(a1 + 88));
    if (!v46)
    {
      unint64_t v12 = "header init";
      __int16 v13 = 282;
      goto LABEL_66;
    }
  }

  if ((*(_BYTE *)(a1 + 1) & 1) == 0
    || (v47.iint key = 5784649, (AAHeaderGetKeyIndex(v46, v47) & 0x80000000) == 0)
    || (v48.iint key = 5915721, (AAHeaderGetKeyIndex(v46, v48) & 0x80000000) == 0)
    || (v49.iint key = 5784649, (AAHeaderSetFieldUInt(v46, 0xFFFFFFFF, v49, v18) & 0x80000000) == 0)
    && (v50.iint key = 5915721, (AAHeaderSetFieldUInt(v46, 0xFFFFFFFF, v50, v52 + v33) & 0x80000000) == 0))
  {
    *a2 = v46;
    goto LABEL_77;
  }

  unint64_t v12 = "inserting IDX,IDZ fields";
  __int16 v13 = 295;
LABEL_66:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AADecodeArchiveInputStream.c",  (uint64_t)"decodeStreamReadHeader",  v13,  61,  0,  v12,  a7,  a8,  v51);
  if (!*(_DWORD *)(a1 + 1132))
  {
    *(_DWORD *)(a1 + 1132) = 1;
    AAByteStreamCancel(*(AAByteStream *)(a1 + 8));
  }

  return 0xFFFFFFFFLL;
}

uint64_t decodeStreamReadBlob( uint64_t a1, int a2, char *__dst, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v25[2] = *MEMORY[0x1895F89C0];
  if (a4)
  {
    unsigned int v9 = *(_DWORD *)(a1 + 1168);
    if (v9 >= *(_DWORD *)(a1 + 1152)) {
      goto LABEL_7;
    }
    while (1)
    {
      uint64_t v13 = *(void *)(a1 + 1160);
      uint64_t v14 = v13 + 24LL * v9;
      uint64_t v16 = (void *)(v14 + 8);
      unint64_t v15 = *(void *)(v14 + 8);
      if (((*(_DWORD *)v14 ^ a2) & 0xFFFFFF) == 0)
      {
        if (v15) {
          break;
        }
      }

      if ((decodeStreamDiscard(a1, v15) & 0x80000000) != 0)
      {
        uint64_t v17 = "reading blob data";
        __int16 v18 = 321;
        goto LABEL_9;
      }

      *uint64_t v16 = 0LL;
      unsigned int v9 = *(_DWORD *)(a1 + 1168) + 1;
      *(_DWORD *)(a1 + 1168) = v9;
      if (v9 >= *(_DWORD *)(a1 + 1152)) {
        goto LABEL_7;
      }
    }

    if (v15 < a4)
    {
LABEL_7:
      uint64_t v17 = "invalid read blob request";
      __int16 v18 = 326;
    }

    else if ((decodeStreamReadData(a1, __dst, a4) & 0x80000000) != 0)
    {
      uint64_t v17 = "read error";
      __int16 v18 = 329;
    }

    else
    {
      size_t v21 = *v16 - a4;
      BOOL v20 = *v16 == a4;
      *uint64_t v16 = v21;
      if (v20) {
        ++*(_DWORD *)(a1 + 1168);
      }
      uint64_t v22 = *(uint64_t (**)(void, uint64_t, uint64_t, void *))(a1 + 16);
      if (!v22) {
        return 0LL;
      }
      if (!*(_BYTE *)(a1 + 104)) {
        return 0LL;
      }
      if ((*(_DWORD *)v14 & 0xFFFFFF) != 0x544144) {
        return 0LL;
      }
      size_t v23 = *(void *)(v13 + 24LL * v9 + 16) - v21;
      v25[0] = *(void *)(v13 + 24LL * v9 + 16);
      v25[1] = v23;
      if ((v22(*(void *)(a1 + 24), 60LL, a1 + 104, v25) & 0x80000000) == 0) {
        return 0LL;
      }
      uint64_t v17 = "callback cancel";
      __int16 v18 = 342;
    }

void decodeStreamAbort(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 1132))
  {
    *(_DWORD *)(a1 + 1132) = 1;
    AAByteStreamCancel(*(AAByteStream *)(a1 + 8));
  }

uint64_t decodeStreamClose(char *a1)
{
  if (a1)
  {
    unint64_t v2 = a1 + 32;
    free(*((void **)a1 + 6));
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(*((void **)a1 + 8));
    free(*((void **)a1 + 149));
    free(*((void **)a1 + 145));
    memset_s(a1 + 1152, 0x10uLL, 0, 0x10uLL);
    AAHeaderDestroy(*((AAHeader *)a1 + 11));
    AAHeaderDestroy(*((AAHeader *)a1 + 12));
    if (*(void *)a1 >> 62)
    {
      double v3 = getRealTime() - *((double *)a1 + 151);
      unint64_t v4 = (FILE **)MEMORY[0x1895F89D0];
      fwrite("Decode archive\n", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
      fprintf(*v4, "%12llu entries in archive\n", *((void *)a1 + 150));
      fprintf(*v4, "%12llu bytes in archive (uncompressed)\n", *((void *)a1 + 142));
      fprintf(*v4, "%12.0f MB/s\n", (double)*((unint64_t *)a1 + 142) * 0.000000953674316 / v3);
      fprintf(*v4, "%12.2f decoding time (s)\n", v3);
    }

    free(a1);
  }

  return 0LL;
}

uint64_t aaByteStreamSimulate(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[11];
  if (v1) {
    return v1(*a1);
  }
  else {
    return -1LL;
  }
}

uint64_t aaByteStreamPCWriteProc(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[3];
  if (v1) {
    return v1(*a1);
  }
  else {
    return -1LL;
  }
}

ssize_t AAByteStreamWrite(AAByteStream s, const void *buf, size_t nbyte)
{
  double v3 = (uint64_t (*)(void, const void *, size_t))*((void *)s + 3);
  if (v3) {
    return v3(*(void *)s, buf, nbyte);
  }
  else {
    return -1LL;
  }
}

uint64_t aaFileStreamGetFD(unsigned int **a1)
{
  unint64_t v1 = (uint64_t (*)(int *))a1[1];
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t aaFileStreamClose(int *a1)
{
  if (a1)
  {
    if (a1[1])
    {
      int v2 = *a1;
      if ((v2 & 0x80000000) == 0) {
        close(v2);
      }
    }

    free(a1);
  }

  return 0LL;
}

uint64_t aaTempFileStreamClose(char *a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)a1;
    if ((v2 & 0x80000000) == 0)
    {
      close(v2);
      unlink(a1 + 12);
    }

    free(a1);
  }

  return 0LL;
}

ssize_t AAByteStreamPWrite(AAByteStream s, const void *buf, size_t nbyte, off_t offset)
{
  unint64_t v4 = (uint64_t (*)(void, const void *, size_t, off_t))*((void *)s + 5);
  if (v4) {
    return v4(*(void *)s, buf, nbyte, offset);
  }
  else {
    return -1LL;
  }
}

ssize_t AAByteStreamRead(AAByteStream s, void *buf, size_t nbyte)
{
  double v3 = (uint64_t (*)(void, void *, size_t))*((void *)s + 2);
  if (v3) {
    return v3(*(void *)s, buf, nbyte);
  }
  else {
    return -1LL;
  }
}

ssize_t AAByteStreamPRead(AAByteStream s, void *buf, size_t nbyte, off_t offset)
{
  unint64_t v4 = (uint64_t (*)(void, void *, size_t, off_t))*((void *)s + 4);
  if (v4) {
    return v4(*(void *)s, buf, nbyte, offset);
  }
  else {
    return -1LL;
  }
}

off_t AAByteStreamSeek(AAByteStream s, off_t offset, int whence)
{
  double v3 = (uint64_t (*)(void, off_t, void))*((void *)s + 6);
  if (v3) {
    return v3(*(void *)s, offset, *(void *)&whence);
  }
  else {
    return -1LL;
  }
}

void AAByteStreamCancel(AAByteStream s)
{
  unint64_t v1 = (void (*)(void))*((void *)s + 7);
  if (v1) {
    v1(*(void *)s);
  }
}

int AAByteStreamClose(AAByteStream s)
{
  if (!s) {
    return 0;
  }
  if (*(void *)s) {
    int v2 = (*((uint64_t (**)(void))s + 1))();
  }
  else {
    int v2 = 0;
  }
  free(s);
  return v2;
}

uint64_t AAByteStreamCloseWithState(uint64_t (**a1)(void))
{
  if (a1)
  {
    int v2 = a1[12];
    double v3 = *a1;
    if (v2)
    {
      if (v3)
      {
        uint64_t v4 = v2();
LABEL_8:
        uint64_t v5 = v4;
LABEL_10:
        free(a1);
        return v5;
      }
    }

    else if (v3)
    {
      uint64_t v4 = a1[1]();
      goto LABEL_8;
    }

    uint64_t v5 = 0LL;
    goto LABEL_10;
  }

  return 0LL;
}

uint64_t AAByteStreamFlush(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[9];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t AAByteStreamTruncate(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[8];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t AAByteStreamPReadAsync(void *a1)
{
  unint64_t v1 = (uint64_t (*)(void))a1[10];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  uint64_t v4 = calloc(1uLL, 0x68uLL);
  uint64_t v5 = malloc(0xCuLL);
  size_t v6 = v5;
  if (v5 && v4)
  {
    *uint64_t v5 = fd;
    v5[1] = automatic_close;
    v5[2] = 0;
    *uint64_t v4 = v5;
    v4[1] = aaFileStreamClose;
    v4[2] = aaFileStreamRead;
    v4[3] = aaFileStreamWrite;
    v4[4] = aaFileStreamPRead;
    v4[5] = aaFileStreamPWrite;
    v4[6] = aaFileStreamSeek;
    v4[7] = aaFileStreamAbort;
    v4[8] = aaFileStreamTruncate;
    v4[9] = aaFileStreamFlush;
  }

  else
  {
    size_t v7 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"AAFileStreamOpenWithFD",  402,  17,  *v7,  "malloc",  v8,  v9,  v11);
    free(v4);
    free(v6);
    return 0LL;
  }

  return (AAByteStream)v4;
}

uint64_t aaFileStreamRead(int *a1, void *a2, size_t a3)
{
  if (a1[2]) {
    return -1LL;
  }
  ssize_t v3 = read(*a1, a2, a3);
  if (v3 < 0) {
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"aaFileStreamRead",  92,  17,  "aaFileStreamRead err=%zd buf=%p n=%zu",  v4,  v5,  v6,  v3);
  }
  return v3;
}

uint64_t aaFileStreamWrite(int *a1, const void *a2, size_t a3)
{
  if (a1[2]) {
    return -1LL;
  }
  ssize_t v3 = write(*a1, a2, a3);
  if (v3 < 0) {
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"aaFileStreamWrite",  104,  17,  "aaFileStreamWrite err=%zd buf=%p n=%zu",  v4,  v5,  v6,  v3);
  }
  return v3;
}

uint64_t aaFileStreamPRead(int *a1, void *a2, size_t a3, off_t a4)
{
  if (a1[2]) {
    return -1LL;
  }
  ssize_t v4 = pread(*a1, a2, a3, a4);
  if (v4 < 0) {
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"aaFileStreamPRead",  116,  17,  "aaFileStreamPRead err=%zd buf=%p n=%zu off=%llu",  v5,  v6,  v7,  v4);
  }
  return v4;
}

uint64_t aaFileStreamPWrite(int *a1, const void *a2, size_t a3, off_t a4)
{
  if (a1[2]) {
    return -1LL;
  }
  ssize_t v4 = pwrite(*a1, a2, a3, a4);
  if (v4 < 0) {
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"aaFileStreamPWrite",  128,  17,  "aaFileStreamPWrite err=%zd buf=%p n=%zu off=%llu",  v5,  v6,  v7,  v4);
  }
  return v4;
}

uint64_t aaFileStreamAbort(uint64_t result)
{
  *(_DWORD *)(result + 8) = 1;
  return result;
}

off_t aaFileStreamSeek(int *a1, off_t a2, int a3)
{
  if (a1[2]) {
    return -1LL;
  }
  else {
    return lseek(*a1, a2, a3);
  }
}

uint64_t aaFileStreamTruncate(int *a1, off_t a2)
{
  if (a1[2]) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ftruncate(*a1, a2);
  }
}

uint64_t aaFileStreamFlush(int *a1)
{
  if (!a1[2])
  {
    uint64_t result = fsync(*a1);
    if (!(_DWORD)result) {
      return result;
    }
    int v2 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"aaFileStreamFlush",  151,  17,  *v2,  "fsync",  v3,  v4,  vars0);
  }

  return 0xFFFFFFFFLL;
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  char v3 = (char)path;
  int v4 = open(path, open_flags, open_mode);
  if (v4 < 0)
  {
    uint64_t v7 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"AAFileStreamOpenWithPath",  428,  17,  *v7,  "open: %s",  v8,  v9,  v3);
  }

  else
  {
    int v5 = v4;
    AAByteStream result = AAFileStreamOpenWithFD(v4, 1);
    if (result) {
      return result;
    }
    close(v5);
  }

  return 0LL;
}

AAByteStream AATempFileStreamOpen(void)
{
  return (AAByteStream)AATempFileStreamOpenWithDirectory(0LL);
}

void *AATempFileStreamOpenWithDirectory(const char *a1)
{
  int v2 = calloc(1uLL, 0x68uLL);
  char v3 = (char *)malloc(0x40CuLL);
  int v4 = v3;
  if (!v2 || !v3)
  {
    int v9 = *__error();
    uint64_t v7 = "malloc";
    __int16 v8 = 447;
LABEL_16:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"AATempFileStreamOpenWithDirectory",  v8,  17,  v9,  v7,  v5,  v6,  v12);
    free(v2);
    free(v4);
    return 0LL;
  }

  memset_s(v3, 0x40CuLL, 0, 0x40CuLL);
  if (a1)
  {
    if (!realpath_DARWIN_EXTSN(a1, v4 + 12) || stat(v4 + 12, &v13) || (v13.st_mode & 0xF000) != 0x4000)
    {
      char v12 = (char)a1;
      uint64_t v7 = "invalid temp_dir: %s";
      __int16 v8 = 457;
LABEL_15:
      int v9 = 0;
      goto LABEL_16;
    }
  }

  else if ((getTempDir(v4 + 12, 0x400uLL) & 0x80000000) != 0)
  {
    uint64_t v7 = "get temp dir";
    __int16 v8 = 462;
    goto LABEL_15;
  }

  if ((unint64_t)__strlcat_chk() >= 0x400)
  {
    char v12 = (_BYTE)v4 + 12;
    uint64_t v7 = "Invalid temp dir path: %s";
    __int16 v8 = 464;
    goto LABEL_15;
  }

  int v10 = mkostemp(v4 + 12, 0x1000000);
  *(_DWORD *)int v4 = v10;
  if (v10 < 0)
  {
    int v9 = *__error();
    uint64_t v7 = "mkostemp";
    __int16 v8 = 466;
    goto LABEL_16;
  }

  *int v2 = v4;
  v2[1] = aaTempFileStreamClose;
  v2[2] = aaFileStreamRead;
  v2[3] = aaFileStreamWrite;
  v2[4] = aaFileStreamPRead;
  v2[5] = aaFileStreamPWrite;
  v2[6] = aaFileStreamSeek;
  v2[7] = aaFileStreamAbort;
  v2[8] = aaFileStreamTruncate;
  v2[9] = aaFileStreamFlush;
  return v2;
}

int AASharedBufferPipeOpen(AAByteStream *ostream, AAByteStream *istream, size_t buffer_capacity)
{
  uint64_t v6 = (AAByteStream_impl *)calloc(1uLL, 0x68uLL);
  uint64_t v7 = (AAByteStream_impl *)calloc(1uLL, 0x68uLL);
  unint64_t v15 = v7;
  if (v6 && v7)
  {
    uint64_t v16 = SharedBufferCreate(buffer_capacity, v8, v9, v10, v11, v12, v13, v14);
    if (v16)
    {
      uint64_t v19 = v16;
      int result = 0;
      *(void *)unint64_t v15 = v19;
      *((void *)v15 + 1) = aaSharedBufferOStreamClose;
      *((void *)v15 + 3) = aaSharedBufferWrite;
      *(void *)uint64_t v6 = v19;
      *((void *)v6 + 1) = aaSharedBufferIStreamClose;
      *((void *)v6 + 2) = aaSharedBufferRead;
      *((void *)v15 + 7) = SharedBufferAbort;
      *((void *)v6 + 7) = SharedBufferAbort;
      *AAByteStream ostream = v15;
      *istream = v6;
      return result;
    }

    uint64_t v22 = "SharedBufferCreate";
    __int16 v23 = 503;
    int v21 = 0;
  }

  else
  {
    int v21 = *__error();
    uint64_t v22 = "malloc";
    __int16 v23 = 499;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"AASharedBufferPipeOpen",  v23,  17,  v21,  v22,  v17,  v18,  v24);
  free(v6);
  free(v15);
  SharedBufferDestroy(0LL);
  return -1;
}

uint64_t aaSharedBufferOStreamClose( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0LL;
}

uint64_t aaSharedBufferIStreamClose(uint64_t a1)
{
  if (SharedBufferDecRefCount(a1)) {
    SharedBufferDestroy(a1);
  }
  return 0LL;
}

AAByteStream AADecompressionInputStreamOpen(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)aaSequentialDecompressionIStreamOpen((uint64_t)compressed_stream, n_threads);
}

void *AAMagicInputStreamOpen(void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t v8 = calloc(1uLL, 0x68uLL);
  uint64_t v9 = malloc(0x18uLL);
  uint64_t v10 = v9;
  if (!v8 || !v9)
  {
    int v11 = *__error();
    uint64_t v14 = "malloc";
    __int16 v15 = 552;
LABEL_11:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"AAMagicInputStreamOpen",  v15,  17,  v11,  v14,  v12,  v13,  v21);
    free(v8);
    free(v10);
    return 0LL;
  }

  memset_s(v9, 0x18uLL, 0, 0x18uLL);
  *uint64_t v10 = a1;
  if (a2 >= 0x2000000001LL)
  {
    *__error() = 12;
    v10[2] = 0LL;
LABEL_10:
    int v11 = *__error();
    uint64_t v14 = "malloc";
    __int16 v15 = 558;
    goto LABEL_11;
  }

  uint64_t v16 = malloc(a2);
  v10[2] = v16;
  if (!v16) {
    goto LABEL_10;
  }
  uint64_t v17 = (uint64_t (*)(void, void *, size_t))a1[2];
  if (!v17 || (size_t v18 = v17(*a1, v16, a2), (v18 & 0x8000000000000000LL) != 0))
  {
    uint64_t v14 = "reading magic bytes\n";
    __int16 v15 = 562;
    int v11 = 0;
    goto LABEL_11;
  }

  size_t v19 = v18;
  v10[1] = v18;
  memcpy(a3, (const void *)v10[2], v18);
  *a4 = v19;
  void *v8 = v10;
  v8[1] = aaMagicStreamClose;
  v8[2] = aaMagicStreamRead;
  v8[7] = aaMagicStreamAbort;
  return v8;
}

uint64_t aaMagicStreamClose(void **a1)
{
  return 0LL;
}

uint64_t aaMagicStreamRead(void **a1, char *__dst, size_t a3)
{
  size_t v3 = a3;
  int v4 = __dst;
  uint64_t v6 = a1[1];
  if (v6)
  {
    uint64_t v7 = 0LL;
    if (!a3) {
      return v7;
    }
    do
    {
      else {
        size_t v8 = (size_t)v6;
      }
      memcpy(v4, a1[2], v8);
      uint64_t v9 = a1[1];
      if ((unint64_t)v9 > v8)
      {
        memmove(a1[2], (char *)a1[2] + v8, (size_t)v9 - v8);
        uint64_t v9 = a1[1];
      }

      v4 += v8;
      v3 -= v8;
      v7 += v8;
      uint64_t v6 = (void *)((char *)v9 - v8);
      a1[1] = v6;
      if (v6) {
        BOOL v10 = v3 == 0;
      }
      else {
        BOOL v10 = 1;
      }
    }

    while (!v10);
    if (!v3) {
      return v7;
    }
    int v11 = (uint64_t (*)(void, char *, size_t))(*a1)[2];
    if (v11)
    {
      uint64_t v12 = v11(**a1, v4, v3);
      if (v12 < 0) {
        return v12;
      }
      v7 += v12;
      return v7;
    }
  }

  else
  {
    uint64_t v13 = (uint64_t (*)(void, char *, size_t))(*a1)[2];
    if (v13) {
      return v13(**a1, __dst, a3);
    }
  }

  return -1LL;
}

void **aaMagicStreamAbort(void **result)
{
  unint64_t v1 = (uint64_t (*)(void))(*result)[7];
  if (v1) {
    return (void **)v1(**result);
  }
  return result;
}

void *AATeeOutputStreamOpen(uint64_t a1, uint64_t a2)
{
  int v4 = calloc(1uLL, 0x68uLL);
  uint64_t v5 = malloc(0x10uLL);
  uint64_t v6 = v5;
  if (v5 && (memset_s(v5, 0x10uLL, 0, 0x10uLL), v4))
  {
    *uint64_t v6 = a1;
    v6[1] = a2;
    *int v4 = v6;
    v4[1] = aaTeeStreamClose;
    v4[3] = aaTeeStreamWrite;
    v4[5] = aaTeeStreamPWrite;
    v4[7] = aaTeeStreamAbort;
  }

  else
  {
    uint64_t v7 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"AATeeOutputStreamOpen",  591,  17,  *v7,  "malloc",  v8,  v9,  v11);
    free(v4);
    free(v6);
    return 0LL;
  }

  return v4;
}

uint64_t aaTeeStreamClose(void *a1)
{
  return 0LL;
}

uint64_t aaTeeStreamWrite(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *a1;
  if (*(void *)(*a1 + 24LL))
  {
    uint64_t v7 = 0LL;
    if (!a3)
    {
      if (*(void *)(a1[1] + 24LL)) {
        uint64_t v11 = 0LL;
      }
      else {
        uint64_t v11 = -1LL;
      }
      goto LABEL_20;
    }

    uint64_t v8 = a2;
    uint64_t v9 = a3;
    while (1)
    {
      uint64_t v10 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v6 + 24))(*(void *)v6, v8, v9);
      if (v10 < 1) {
        break;
      }
      v8 += v10;
      v7 += v10;
      v9 -= v10;
      if (!v9) {
        goto LABEL_12;
      }
    }

    uint64_t v7 = v10;
  }

  else
  {
    uint64_t v7 = -1LL;
  }

uint64_t aaTeeStreamPWrite(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v8 = *a1;
  if (*(void *)(*a1 + 40LL))
  {
    uint64_t v9 = 0LL;
    if (!a3)
    {
      if (*(void *)(a1[1] + 40LL)) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = -1LL;
      }
      goto LABEL_20;
    }

    uint64_t v10 = a2;
    uint64_t v11 = a4;
    uint64_t v12 = a3;
    while (1)
    {
      uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v8 + 40))(*(void *)v8, v10, v12, v11);
      if (v13 < 1) {
        break;
      }
      v10 += v13;
      v9 += v13;
      v11 += v13;
      v12 -= v13;
      if (!v12) {
        goto LABEL_12;
      }
    }

    uint64_t v9 = v13;
  }

  else
  {
    uint64_t v9 = -1LL;
  }

void **aaTeeStreamAbort(void **result)
{
  unint64_t v1 = result;
  int v2 = (uint64_t (*)(void))(*result)[7];
  if (v2) {
    int result = (void **)v2(**result);
  }
  size_t v3 = v1[1];
  uint64_t v4 = (uint64_t (*)(void))v3[7];
  if (v4) {
    return (void **)v4(*v3);
  }
  return result;
}

AAByteStream AACustomByteStreamOpen(void)
{
  v0 = (AAByteStream_impl *)calloc(1uLL, 0x68uLL);
  if (!v0)
  {
    unint64_t v1 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAByteStream.c",  (uint64_t)"AACustomByteStreamOpen",  619,  17,  *v1,  "malloc",  v2,  v3,  v5);
  }

  return v0;
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
  *(void *)s = data;
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
  *((void *)s + 1) = proc;
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
  *((void *)s + 2) = proc;
}

void AACustomByteStreamSetPReadProc(AAByteStream s, AAByteStreamPReadProc proc)
{
  *((void *)s + 4) = proc;
}

void AACustomByteStreamSetWriteProc(AAByteStream s, AAByteStreamWriteProc proc)
{
  *((void *)s + 3) = proc;
}

void AACustomByteStreamSetPWriteProc(AAByteStream s, AAByteStreamPWriteProc proc)
{
  *((void *)s + 5) = proc;
}

void AACustomByteStreamSetSeekProc(AAByteStream s, AAByteStreamSeekProc proc)
{
  *((void *)s + 6) = proc;
}

void AACustomByteStreamSetCancelProc(AAByteStream s, AAByteStreamCancelProc proc)
{
  *((void *)s + 7) = proc;
}

AAByteStream_impl *AAAFSCStreamOpen( int a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (AAByteStream_impl *)afscStreamOpen(a1, a2, a3, a4, a5, a6, a7, a8);
  if (!v11)
  {
    uint64_t v12 = "alloc stream";
    __int16 v13 = 1041;
    goto LABEL_5;
  }

  if ((stripAFSC(a1) & 0x80000000) != 0)
  {
    uint64_t v12 = "clearing file";
    __int16 v13 = 1043;
LABEL_5:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"AAAFSCStreamOpen",  v13,  55,  0,  v12,  v9,  v10,  v15);
    AAByteStreamClose(v11);
    return 0LL;
  }

  return v11;
}

void *afscStreamOpen( int a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2 || a2 >= 4194304001LL)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"afscStreamOpen",  959,  55,  0,  "invalid uncompressed size",  a7,  a8,  v51);
    goto LABEL_7;
  }

  if (a3 < 0xF && ((0x7F99u >> a3) & 1) != 0)
  {
    int v22 = dword_1862D81BC[a3];
    uint64_t v17 = calloc(1uLL, 0x68uLL);
    __int16 v23 = malloc(0x80uLL);
    uint64_t v18 = (uint64_t)v23;
    if (v23 && (memset_s(v23, 0x80uLL, 0, 0x80uLL), v17))
    {
      *(_DWORD *)uint64_t v18 = a1;
      *(void *)(v18 + 8) = a4;
      *(void *)(v18 + 16) = a2;
      *(_DWORD *)(v18 + 32) = v22;
      if ((unint64_t)(a2 + 0xFFFF) >> 48)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"chunkCount",  128,  55,  0,  "invalid uncompressed size",  v24,  v25,  v51);
        size_t v26 = 0LL;
        *(_DWORD *)(v18 + 44) = -1;
      }

      else
      {
        unint64_t v32 = (unint64_t)(a2 + 0xFFFF) >> 16;
        *(_DWORD *)(v18 + 44) = v32;
        size_t v26 = v32 + 1;
      }

      uint64_t v33 = calloc(v26, 4uLL);
      *(void *)(v18 + 48) = v33;
      if (v33)
      {
        compression_algorithm v36 = 1285;
        switch(v22)
        {
          case 4:
            goto LABEL_24;
          case 7:
          case 8:
            compression_algorithm v36 = 2304;
            goto LABEL_24;
          case 10:
            goto LABEL_28;
          case 11:
          case 12:
            compression_algorithm v36 = COMPRESSION_LZFSE;
            goto LABEL_24;
          case 13:
          case 14:
            compression_algorithm v36 = 1794;
            goto LABEL_24;
          default:
            compression_algorithm v36 = -1;
LABEL_24:
            size_t v37 = compression_encode_scratch_buffer_size(v36);
            if (!v37) {
              goto LABEL_28;
            }
            if (v37 >= 0x2000000001LL)
            {
              *__error() = 12;
              *(void *)(v18 + 56) = 0LL;
LABEL_50:
              int v27 = *__error();
              int v30 = "malloc";
              __int16 v31 = 1002;
              break;
            }

            int v38 = malloc(v37);
            *(void *)(v18 + 56) = v38;
            if (!v38) {
              goto LABEL_50;
            }
LABEL_28:
            size_t v39 = *(void *)(v18 + 72);
            if (v39 >> 16) {
              goto LABEL_38;
            }
            AAFieldKey v40 = (void *)(v18 + 64);
            do
            {
              size_t v41 = (v39 >> 1) + v39;
              if (((v39 >> 1) & v39) != 0) {
                size_t v41 = ((v39 >> 1) & v39) + v39;
              }
              if (v39) {
                size_t v39 = v41;
              }
              else {
                size_t v39 = 0x4000LL;
              }
            }

            while (v39 < 0x10000);
            uint64_t v42 = *(void **)(v18 + 80);
            int v43 = realloc(v42, v39);
            if (!v43) {
              goto LABEL_51;
            }
            *(void *)(v18 + 72) = v39;
            *(void *)(v18 + 80) = v43;
LABEL_38:
            size_t v44 = *(void *)(v18 + 96);
            if (v44 >= 0x80008) {
              goto LABEL_48;
            }
            AAFieldKey v40 = (void *)(v18 + 88);
            do
            {
              size_t v45 = (v44 >> 1) + v44;
              if (((v44 >> 1) & v44) != 0) {
                size_t v45 = ((v44 >> 1) & v44) + v44;
              }
              if (v44) {
                size_t v44 = v45;
              }
              else {
                size_t v44 = 0x4000LL;
              }
            }

            while (v44 < 0x80008);
            uint64_t v42 = *(void **)(v18 + 104);
            uint64_t v46 = realloc(v42, v44);
            if (v46)
            {
              *(void *)(v18 + 96) = v44;
              *(void *)(v18 + 104) = v46;
LABEL_48:
              else {
                unsigned __int8 v47 = byte_1862D81F8[v22 - 3];
              }
              *(_BYTE *)(v18 + 36) = v47;
              uint64_t v48 = *(unsigned int *)(v18 + 44);
              uint64_t v49 = 8 * v48 + 264;
              unint64_t v50 = 4 * v48 + 4;
              if (a3 - 3 < 2) {
                unint64_t v50 = v49;
              }
              if (v50 < 0xFFFFFFFF)
              {
                **(_DWORD **)(v18 + 48) = v50;
                *uint64_t v17 = v18;
                v17[1] = afscStreamClose;
                v17[7] = afscStreamCancel;
                v17[3] = afscStreamWrite;
                v17[12] = afscStreamCloseWithState;
                return v17;
              }

              pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"resourceForkHeaderSize",  146,  55,  0,  "invalid file size",  v34,  v35,  v51);
              **(_DWORD **)(v18 + 48) = -1;
              __int16 v31 = 1010;
              int v27 = 0;
              int v30 = "invalid file size";
            }

            else
            {
LABEL_51:
              free(v42);
              *AAFieldKey v40 = 0LL;
              v40[1] = 0LL;
              v40[2] = 0LL;
              int v27 = *__error();
              int v30 = "malloc";
              __int16 v31 = 1005;
            }

            break;
        }
      }

      else
      {
        int v27 = *__error();
        int v30 = "malloc";
        __int16 v31 = 997;
      }
    }

    else
    {
      int v27 = *__error();
      int v30 = "malloc";
      __int16 v31 = 988;
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"afscStreamOpen",  v31,  55,  v27,  v30,  v28,  v29,  v51);
    goto LABEL_8;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"afscStreamOpen",  981,  55,  0,  "invalid compression type: %d",  a7,  a8,  a3);
LABEL_7:
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
LABEL_8:
  afscStreamClose(v18, v10, v11, v12, v13, v14, v15, v16);
  free(v17);
  return 0LL;
}

uint64_t stripAFSC(int a1)
{
  if (fstat(a1, &v17))
  {
    int v2 = *__error();
    char v5 = "fstat";
    __int16 v6 = 100;
  }

  else
  {
    if ((v17.st_flags & 0x20) == 0 || (fchflags(a1, v17.st_flags & 0xFFFFFFDF) & 0x80000000) == 0)
    {
      int v9 = 1;
      goto LABEL_7;
    }

    int v2 = *__error();
    char v5 = "fchflags UF_COMPRESSED";
    __int16 v6 = 105;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"clearUFCompressedBit",  v6,  55,  v2,  v5,  v3,  v4,  v17.st_dev);
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"stripAFSC",  154,  55,  0,  "clearing UF_COMPRESSED",  v7,  v8,  v17.st_dev);
  int v9 = 0;
LABEL_7:
  if ((fgetxattr(a1, "com.apple.ResourceFork", 0LL, 0LL, 0, 32) & 0x8000000000000000LL) == 0
    && fremovexattr(a1, "com.apple.ResourceFork", 32) < 0)
  {
    uint64_t v10 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"stripAFSC",  159,  55,  *v10,  "fremovexattr",  v11,  v12,  v17.st_dev);
    int v9 = 0;
  }

  if ((fgetxattr(a1, "com.apple.decmpfs", 0LL, 0LL, 0, 32) & 0x8000000000000000LL) == 0
    && fremovexattr(a1, "com.apple.decmpfs", 32) < 0)
  {
    uint64_t v13 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"stripAFSC",  161,  55,  *v13,  "fremovexattr",  v14,  v15,  v17.st_dev);
    int v9 = 0;
  }

  if (v9) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

AAByteStream_impl *AAAFSCStreamOpenWithMetadata( int a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 > 0xE) {
    goto LABEL_4;
  }
  if (((1 << a3) & 0x2A88) != 0)
  {
    if (a4)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"AAAFSCStreamOpenWithMetadata",  1060,  55,  0,  "invalid resource fork for type",  a7,  a8,  v19);
      goto LABEL_7;
    }
  }

  else if (((1 << a3) & 0x5510) == 0)
  {
LABEL_4:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"AAAFSCStreamOpenWithMetadata",  1059,  55,  0,  "invalid compression_type: %d",  a7,  a8,  a3);
LABEL_7:
    uint64_t v11 = 0LL;
LABEL_13:
    AAByteStreamClose(v11);
    return 0LL;
  }

  uint64_t v12 = (AAByteStream_impl *)afscStreamOpen(a1, a2, a3, 0LL, a5, a6, a7, a8);
  uint64_t v11 = v12;
  if (!v12)
  {
    uint64_t v16 = "alloc stream";
    __int16 v17 = 1064;
    goto LABEL_12;
  }

  uint64_t v15 = *(void *)v12;
  *(_DWORD *)(v15 + 112) = a3;
  *(_DWORD *)(v15 + 116) = a4;
  if ((stripAFSC(a1) & 0x80000000) != 0)
  {
    uint64_t v16 = "clearing file";
    __int16 v17 = 1070;
LABEL_12:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"AAAFSCStreamOpenWithMetadata",  v17,  55,  0,  v16,  v13,  v14,  v19);
    goto LABEL_13;
  }

  return v11;
}

AAByteStream_impl *AAAFSCStreamOpenWithState( int a1, AAByteStream_impl *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v54 = 0u;
  if (!*((void *)a2 + 2)) {
    goto LABEL_69;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = &v54;
  uint64_t v13 = 48LL;
  do
  {
    uint64_t v14 = (*((uint64_t (**)(void, __int128 *, uint64_t))a2 + 2))(*(void *)a2, v12, v13);
    if (v14 < 0) {
      goto LABEL_69;
    }
    if (!v14) {
      break;
    }
    uint64_t v12 = (__int128 *)((char *)v12 + v14);
    v11 += v14;
    v13 -= v14;
  }

  while (v13);
  if (v11 < 0)
  {
LABEL_69:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"AAAFSCStreamOpenWithState",  1088,  55,  0,  "loading state",  a7,  a8,  v54);
    BOOL v20 = 0LL;
LABEL_76:
    AAByteStreamClose(v20);
    return 0LL;
  }

  __int16 v17 = (AAByteStream_impl *)afscStreamOpen(a1, *((uint64_t *)&v54 + 1), DWORD2(v55), v54, v15, v16, a7, a8);
  BOOL v20 = v17;
  if (!v17)
  {
    char v51 = "open AFSC stream";
    __int16 v52 = 1092;
LABEL_75:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"AAAFSCStreamOpenWithState",  v52,  55,  0,  v51,  v18,  v19,  v54);
    goto LABEL_76;
  }

  uint64_t v21 = *(void *)v17;
  *(void *)(v21 + 24) = v55;
  *(_DWORD *)(v21 + 40) = HIDWORD(v55);
  *(void *)(v21 + 112) = v56;
  if (!*((void *)a2 + 2)) {
    goto LABEL_74;
  }
  int v22 = *(_DWORD *)(v21 + 44);
  BOOL v23 = __CFADD__(v22, 1);
  unsigned int v24 = v22 + 1;
  if (!v23)
  {
    uint64_t v25 = 0LL;
    uint64_t v26 = 4LL * v24;
    uint64_t v27 = *(void *)(v21 + 48);
    do
    {
      uint64_t v28 = (*((uint64_t (**)(void, uint64_t, uint64_t))a2 + 2))(*(void *)a2, v27, v26);
      if (v28 < 0) {
        goto LABEL_74;
      }
      if (!v28) {
        break;
      }
      v27 += v28;
      v25 += v28;
      v26 -= v28;
    }

    while (v26);
    if (v25 < 0)
    {
LABEL_74:
      char v51 = "loading state";
      __int16 v52 = 1103;
      goto LABEL_75;
    }
  }

  size_t v29 = DWORD2(v56);
  if (!DWORD2(v56)) {
    goto LABEL_41;
  }
  uint64_t v30 = 0LL;
  __int16 v31 = (unint64_t *)(v21 + 64);
  unint64_t v33 = *(void *)(v21 + 64);
  unint64_t v32 = *(void *)(v21 + 72);
  do
  {
    if (v33 != v32) {
      goto LABEL_28;
    }
    unint64_t v34 = v32 + 0x40000;
    if (v32 > 0xFFFFFFFFFFFBFFFFLL)
    {
      unint64_t v33 = v32;
LABEL_28:
      size_t v36 = v32;
      goto LABEL_32;
    }

    do
    {
      while (!v32)
      {
        unint64_t v32 = 0x4000LL;
        size_t v36 = 0x4000LL;
        if (v34 <= 0x4000) {
          goto LABEL_30;
        }
      }

      unint64_t v35 = v32 >> 1;
      if ((v32 & (v32 >> 1)) != 0) {
        unint64_t v35 = v32 & (v32 >> 1);
      }
      v32 += v35;
    }

    while (v32 < v34);
    size_t v36 = v32;
    if (v32 >= 0x2000000001LL)
    {
LABEL_72:
      *__error() = 12;
      goto LABEL_73;
    }

uint64_t AAAFSCGetMetadata(int a1, _DWORD *a2, _DWORD *a3)
{
  __s[0] = 0LL;
  __s[1] = 0LL;
  uint64_t v16 = 0LL;
  if (!fstat(a1, &v17))
  {
    if (statIsCompressed(v17.st_flags))
    {
      if ((loadDecmpfsXattr(a1, a2, &v14, __s) & 0x80000000) != 0)
      {
        int v9 = "loading decmpfs";
        __int16 v10 = 1137;
      }

      else
      {
        if (*a2 <= 0xDu && ((1 << *a2) & 0x2A88) != 0)
        {
          uint64_t v11 = 0LL;
LABEL_10:
          *a3 = 0;
          goto LABEL_11;
        }

        int v13 = resourceForkSize(a1);
        *a3 = v13;
        if (v13 != -1)
        {
          uint64_t v11 = 0LL;
          goto LABEL_11;
        }

        int v9 = "invalid resource fork";
        __int16 v10 = 1140;
      }

      int v6 = 0;
      goto LABEL_3;
    }

    uint64_t v11 = 0LL;
    *a2 = -1;
    goto LABEL_10;
  }

  int v6 = *__error();
  int v9 = "fstat";
  __int16 v10 = 1123;
LABEL_3:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"AAAFSCGetMetadata",  v10,  55,  v6,  v9,  v7,  v8,  v14);
  uint64_t v11 = 0xFFFFFFFFLL;
LABEL_11:
  free(v16);
  memset_s(__s, 0x18uLL, 0, 0x18uLL);
  return v11;
}

uint64_t loadDecmpfsXattr(int a1, _DWORD *a2, void *a3, unint64_t *a4)
{
  *a4 = 0LL;
  size_t v8 = a4[1];
  if (v8 >> 16)
  {
    unint64_t v12 = 0LL;
    uint64_t v11 = (char *)a4[2];
  }

  else
  {
    do
    {
      size_t v9 = (v8 >> 1) + v8;
      if (((v8 >> 1) & v8) != 0) {
        size_t v9 = ((v8 >> 1) & v8) + v8;
      }
      if (v8) {
        size_t v8 = v9;
      }
      else {
        size_t v8 = 0x4000LL;
      }
    }

    while (v8 < 0x10000);
    __int16 v10 = (void *)a4[2];
    uint64_t v11 = (char *)realloc(v10, v8);
    if (!v11)
    {
      free(v10);
      *a4 = 0LL;
      a4[1] = 0LL;
      a4[2] = 0LL;
      stat v17 = "blob reserve";
      __int16 v18 = 255;
      goto LABEL_20;
    }

    a4[1] = v8;
    a4[2] = (unint64_t)v11;
    unint64_t v12 = *a4;
  }

  ssize_t v13 = fgetxattr(a1, "com.apple.decmpfs", &v11[v12], v8 - v12, 0, 32);
  if (v13 < 16 || (unint64_t v16 = *a4 + v13, __CFADD__(*a4, v13)) || v16 > a4[1])
  {
    stat v17 = "invalid/missing decmpfs";
    __int16 v18 = 261;
LABEL_20:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"loadDecmpfsXattr",  v18,  55,  0,  v17,  v14,  v15,  v23);
    return 0xFFFFFFFFLL;
  }

  *a4 = v16;
  unint64_t v19 = a4[2];
  if (*(_DWORD *)v19 != 1668116582)
  {
    stat v17 = "Invalid decmpfs xattr";
    __int16 v18 = 263;
    goto LABEL_20;
  }

  uint64_t v20 = *(void *)(v19 + 8);
  *a2 = *(_DWORD *)(v19 + 4);
  *a3 = v20;
  unint64_t v21 = v16 - 16;
  if (v16 < 0x10)
  {
    stat v17 = "blob resize";
    __int16 v18 = 268;
    goto LABEL_20;
  }

  if (v16 != 16) {
    memmove((void *)v19, (const void *)(v19 + 16), v16 - 16);
  }
  uint64_t result = 0LL;
  *a4 = v21;
  return result;
}

unint64_t resourceForkSize(int a1)
{
  unint64_t result = fgetxattr(a1, "com.apple.ResourceFork", 0LL, 0LL, 0, 32);
  if ((result & 0x8000000000000000LL) != 0)
  {
    uint64_t v4 = "Missing resource fork xattr";
    __int16 v5 = 309;
  }

  else
  {
    if (!HIDWORD(result)) {
      return result;
    }
    uint64_t v4 = "Invalid resource fork xattr";
    __int16 v5 = 310;
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"resourceForkSize",  v5,  55,  0,  v4,  v2,  v3,  vars0);
  return 0xFFFFFFFFLL;
}

uint64_t AAAFSCSetMetadata( int a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v41 = 0;
  int v42 = -1;
  uint64_t __s = 0LL;
  size_t v39 = 0LL;
  ssize_t v40 = 0LL;
  if (a2 <= 0xD && ((1 << a2) & 0x2A88) != 0)
  {
    if (a3)
    {
      uint64_t v11 = "invalid resource fork size";
      __int16 v12 = 1169;
LABEL_5:
      int v13 = 0;
LABEL_10:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"AAAFSCSetMetadata",  v12,  55,  v13,  v11,  a7,  a8,  (char)v36);
      uint64_t v15 = 0LL;
LABEL_11:
      uint64_t v16 = 0xFFFFFFFFLL;
      goto LABEL_12;
    }

    BOOL v14 = 0;
  }

  else
  {
    BOOL v14 = a3 != 0;
  }

  if (fstat(a1, &v43))
  {
    int v13 = *__error();
    uint64_t v11 = "fstat";
    __int16 v12 = 1171;
    goto LABEL_10;
  }

  unint64_t st_size = v43.st_size;
  if ((AAAFSCGetMetadata(a1, &v42, &v41) & 0x80000000) != 0)
  {
    uint64_t v11 = "reading current metadata";
    __int16 v12 = 1175;
    goto LABEL_5;
  }

  BOOL v21 = v42 != -1;
  BOOL v22 = v42 != a2 && v42 != -1;
  if (v42 != a2) {
    BOOL v21 = 0;
  }
  if (v41 <= a3) {
    BOOL v21 = 0;
  }
  if (v22 || v14 && v21)
  {
    if ((decompressToData(a1) & 0x80000000) != 0)
    {
      uint64_t v11 = "decompression failed";
      __int16 v12 = 1188;
      goto LABEL_5;
    }

    unsigned int v41 = 0;
    int v42 = -1;
    if (a2 == -1) {
      goto LABEL_61;
    }
  }

  else
  {
    if (v42 == a2) {
      goto LABEL_61;
    }
    if (v42 != -1)
    {
      uint64_t v11 = "invalid state";
      __int16 v12 = 1200;
      goto LABEL_5;
    }
  }

  uint64_t v15 = AAAFSCStreamOpenWithMetadata(a1, st_size, a2, a3, v19, v20, a7, a8);
  if (!v15)
  {
    unint64_t v34 = "open AFSC stream";
    __int16 v35 = 1202;
LABEL_75:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"AAAFSCSetMetadata",  v35,  55,  0,  v34,  v23,  v24,  (char)v36);
    goto LABEL_11;
  }

  size_t v25 = 0LL;
  do
  {
    size_t v26 = (v25 >> 1) + v25;
    if (((v25 >> 1) & v25) != 0) {
      size_t v26 = ((v25 >> 1) & v25) + v25;
    }
    if (v25) {
      size_t v25 = v26;
    }
    else {
      size_t v25 = 0x4000LL;
    }
  }

  while (v25 < 0x80000);
  uint64_t v27 = (char *)malloc(v25);
  if (!v27)
  {
    uint64_t __s = 0LL;
    size_t v39 = 0LL;
    ssize_t v40 = 0LL;
    unint64_t v34 = "blob alloc";
    __int16 v35 = 1205;
    goto LABEL_75;
  }

  uint64_t v28 = v27;
  size_t v39 = v25;
  ssize_t v40 = v27;
  if (st_size)
  {
    unint64_t v29 = 0LL;
    size_t v36 = v27;
    unint64_t v37 = st_size;
    while (1)
    {
      uint64_t __s = 0LL;
      if (v25 >= st_size - v29) {
        size_t v30 = st_size - v29;
      }
      else {
        size_t v30 = v25;
      }
      if (pread(a1, v28, v30, v29) != v30)
      {
LABEL_72:
        unint64_t v34 = "read data";
        __int16 v35 = 1213;
        goto LABEL_75;
      }

      if (v30)
      {
        if (__CFADD__(__s, v30)) {
          goto LABEL_72;
        }
        size_t v25 = v39;
        if (__s + v30 > v39) {
          goto LABEL_72;
        }
        __s += v30;
        if (*((void *)v15 + 3))
        {
          uint64_t v31 = 0LL;
          size_t v32 = v30;
          while (1)
          {
            uint64_t v33 = (*((uint64_t (**)(void, char *, size_t))v15 + 3))(*(void *)v15, v28, v32);
            if (v33 < 1) {
              break;
            }
            v28 += v33;
            v31 += v33;
            v32 -= v33;
            if (!v32) {
              goto LABEL_57;
            }
          }

          uint64_t v31 = v33;
LABEL_57:
          uint64_t v28 = v36;
          unint64_t st_size = v37;
        }

        else
        {
          uint64_t v31 = -1LL;
        }
      }

      else
      {
        uint64_t v31 = *((void *)v15 + 3) ? 0LL : -1LL;
      }

      if (v31 != v30) {
        break;
      }
      v29 += v30;
      if (v29 >= st_size) {
        goto LABEL_60;
      }
    }

    unint64_t v34 = "write data";
    __int16 v35 = 1215;
    goto LABEL_75;
  }

uint64_t decompressToData(int a1)
{
  size_t v2 = 0LL;
  size_t __s = 0LL;
  size_t v70 = 0LL;
  size_t v71 = 0LL;
  unint64_t v72 = 0LL;
  int v69 = -1;
  uint64_t v68 = 0LL;
  do
  {
    size_t v3 = (v2 >> 1) + v2;
    if (((v2 >> 1) & v2) != 0) {
      size_t v3 = ((v2 >> 1) & v2) + v2;
    }
    if (v2) {
      size_t v2 = v3;
    }
    else {
      size_t v2 = 0x4000LL;
    }
  }

  while (v2 <= 0x10000);
  uint64_t v4 = (uint8_t *)malloc(v2);
  if (!v4)
  {
    p_s = &__s;
LABEL_22:
    size_t *p_s = 0LL;
    p_s[1] = 0LL;
    p_s[2] = 0LL;
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"decompressToData",  448,  55,  0,  "blob alloc",  v5,  v6,  (char)__src);
    __int16 v10 = 0LL;
LABEL_41:
    size_t v25 = 0LL;
LABEL_42:
    size_t v26 = 0LL;
    goto LABEL_43;
  }

  size_t v7 = 0LL;
  size_t v74 = v2;
  int64x2_t v75 = v4;
  do
  {
    size_t v8 = (v7 >> 1) + v7;
    if (((v7 >> 1) & v7) != 0) {
      size_t v8 = ((v7 >> 1) & v7) + v7;
    }
    if (v7) {
      size_t v7 = v8;
    }
    else {
      size_t v7 = 0x4000LL;
    }
  }

  while (v7 < 0x80000);
  size_t v9 = (char *)malloc(v7);
  if (!v9)
  {
    p_s = &v70;
    goto LABEL_22;
  }

  __int16 v10 = v9;
  size_t v71 = v7;
  unint64_t v72 = v9;
  if ((loadDecmpfsXattr(a1, &v69, &v68, &__s) & 0x80000000) != 0)
  {
    uint64_t v16 = "loading decmpfs xattr";
    __int16 v17 = 451;
LABEL_39:
    int v24 = 0;
LABEL_40:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"decompressToData",  v17,  55,  v24,  v16,  v11,  v12,  (char)__src);
    goto LABEL_41;
  }

  unsigned int v13 = v69;
  else {
    int v14 = byte_1862D81F8[v69 - 3];
  }
  char v18 = 0;
  compression_algorithm v19 = 1285;
  switch(v69)
  {
    case 3:
    case 4:
      break;
    case 7:
    case 8:
      char v18 = 0;
      compression_algorithm v19 = 2304;
      break;
    case 11:
    case 12:
      char v18 = 0;
      compression_algorithm v19 = COMPRESSION_LZFSE;
      break;
    case 13:
    case 14:
      char v18 = 0;
      compression_algorithm v19 = 1794;
      break;
    default:
      compression_algorithm v19 = -1;
      char v18 = 1;
      break;
  }

  uint64_t v20 = v68;
  if (!v68 || (unint64_t v21 = v68 + 0xFFFF, (unint64_t)(v68 + 0xFFFF) >> 48))
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"chunkCount",  128,  55,  0,  "invalid uncompressed size",  v11,  v12,  (char)__src);
    goto LABEL_38;
  }

  unint64_t v22 = v21 >> 16;
  if ((v21 >> 16) == -1)
  {
LABEL_38:
    uint64_t v16 = "invalid uncompressed size";
    __int16 v17 = 457;
    goto LABEL_39;
  }

  if ((v18 & 1) != 0 || (size_t v23 = compression_decode_scratch_buffer_size(v19)) == 0)
  {
    size_t v25 = 0LL;
  }

  else
  {
    if (v23 >= 0x2000000001LL)
    {
      *__error() = 12;
LABEL_60:
      int v24 = *__error();
      uint64_t v16 = "malloc";
      __int16 v17 = 463;
      goto LABEL_40;
    }

    size_t v25 = malloc(v23);
    if (!v25) {
      goto LABEL_60;
    }
  }

  if (v13 <= 0xD && ((1 << v13) & 0x2A88) != 0)
  {
    unint64_t v29 = v75;
    if (*v75 == v14)
    {
      size_t v30 = __s - 1;
      memcpy(v10, v75 + 1, __s - 1);
    }

    else
    {
      size_t v30 = compression_decode_buffer((uint8_t *)v10, 0x10000uLL, v75, __s, v25, v19);
    }

    if (v30 - 65537 <= 0xFFFFFFFFFFFEFFFFLL)
    {
      uint64_t v33 = "invalid chunk";
      __int16 v34 = 487;
LABEL_58:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"decompressToData",  v34,  55,  0,  v33,  v31,  v32,  (char)__src);
      goto LABEL_42;
    }

    size_t v70 = v30;
    ssize_t v35 = pwrite(a1, v29, v30, 0LL);
    size_t v26 = 0LL;
    if (v35 != v30)
    {
      uint64_t v33 = "writing chunk";
      __int16 v34 = 490;
      goto LABEL_58;
    }

uint64_t resizeResourceFork(int a1, unsigned int a2)
{
  unint64_t __s = 0LL;
  unint64_t v76 = 0LL;
  __ptr = 0LL;
  int v74 = -1;
  uint64_t v73 = 0LL;
  if ((loadDecmpfsXattr(a1, &v74, &v73, &__s) & 0x80000000) != 0)
  {
    size_t v8 = "loading decmpfs xattr";
    __int16 v9 = 574;
    goto LABEL_8;
  }

  int v6 = v74;
  if ((v74 + 1) <= 0xE && ((1 << (v74 + 1)) & 0x5511) != 0)
  {
    size_t v8 = "invalid compression type";
    __int16 v9 = 575;
LABEL_8:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"resizeResourceFork",  v9,  55,  0,  v8,  v4,  v5,  v66);
LABEL_9:
    __int16 v10 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_10;
  }

  unsigned int v14 = resourceForkSize(a1);
  if (v14 == -1)
  {
    size_t v8 = "invalid resource fork";
    __int16 v9 = 579;
    goto LABEL_8;
  }

  if (a2 < v14)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"resizeResourceFork",  580,  55,  0,  "can't resize resource fork %u to %u",  v4,  v5,  v14);
    goto LABEL_9;
  }

  unsigned int v15 = a2 - v14;
  if (a2 == v14)
  {
    __int16 v10 = 0LL;
    uint64_t v11 = 0LL;
LABEL_18:
    uint64_t v12 = 0LL;
    goto LABEL_11;
  }

  uint64_t v16 = v73;
  if (!v73 || (unint64_t v17 = v73 + 0xFFFF, (unint64_t)(v73 + 0xFFFF) >> 48))
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"chunkCount",  128,  55,  0,  "invalid uncompressed size",  v4,  v5,  v66);
    goto LABEL_45;
  }

  unint64_t v18 = v17 >> 16;
  size_t v19 = (v17 >> 16) + 1;
  if (v19 <= 1)
  {
LABEL_45:
    size_t v8 = "invalid uncompressed size";
    __int16 v9 = 589;
    goto LABEL_8;
  }

  uint64_t v11 = calloc((v17 >> 16) + 1, 4uLL);
  uint64_t v20 = calloc(v19, 4uLL);
  __int16 v10 = v20;
  if (!v11 || !v20)
  {
    int v41 = *__error();
    unint64_t v64 = "malloc";
    __int16 v65 = 594;
    goto LABEL_91;
  }

  if ((loadChunkOffsets(a1, v6, v18, v11, v21, v22, v23, v24) & 0x80000000) != 0)
  {
    unint64_t v64 = "loading chunk offsets";
    __int16 v65 = 595;
    goto LABEL_90;
  }

  v10[v18] = v15 + v11[v18];
  int v29 = v18;
  while (v29)
  {
    uint64_t v30 = (v29 - 1);
    unint64_t v31 = v16 - (v30 << 16);
    if (v31 >= 0x10000) {
      LODWORD(v31) = 0x10000;
    }
    int v32 = v11[v29];
    int v33 = v11[v30];
    unsigned int v34 = v10[v29];
    unsigned int v35 = v32 - v33;
    unsigned int v36 = v34 - v33;
    if (v36 >= 0x10000) {
      unsigned int v36 = 0x10000;
    }
    BOOL v38 = v35 > v36 || (v35 & 0xFFFF0000) != 0 || v35 >= v31;
    if (v38) {
      unsigned int v39 = v35;
    }
    else {
      unsigned int v39 = v36;
    }
    BOOL v38 = v34 >= v39;
    unsigned int v40 = v34 - v39;
    v10[v30] = v40;
    if (!v38)
    {
      unint64_t v64 = "resource fork resize failed";
      __int16 v65 = 607;
      goto LABEL_90;
    }

    int v29 = v30;
    if (v40 < v11[v30])
    {
      unint64_t v64 = "invalid state when resizing resource fork";
      __int16 v65 = 608;
      goto LABEL_90;
    }
  }

  if (*v10 != *v11)
  {
    unint64_t v64 = "resource fork resize failed";
    __int16 v65 = 610;
    goto LABEL_90;
  }

  size_t v42 = v76;
  if (v76 <= 0x10000)
  {
    do
    {
      size_t v43 = (v42 >> 1) + v42;
      if (((v42 >> 1) & v42) != 0) {
        size_t v43 = ((v42 >> 1) & v42) + v42;
      }
      if (v42) {
        size_t v42 = v43;
      }
      else {
        size_t v42 = 0x4000LL;
      }
    }

    while (v42 < 0x10001);
    size_t v44 = __ptr;
    unint64_t v45 = realloc(__ptr, v42);
    if (!v45)
    {
      free(v44);
      unint64_t __s = 0LL;
      unint64_t v76 = 0LL;
      __ptr = 0LL;
      unint64_t v64 = "blob alloc";
      __int16 v65 = 613;
      goto LABEL_90;
    }

    __ptr = v45;
  }

  unint64_t v46 = __s;
  if (!(_DWORD)v18) {
    goto LABEL_97;
  }
  u_int32_t v47 = (char *)__ptr;
  u_int32_t v48 = v11[(v18 - 1)];
  int __n = v11[v18];
  u_int32_t v49 = __n - v48;
  int size_4 = v18 - 1;
  uint64_t v68 = &v10[(v18 - 1)];
  int v50 = v10[v18] - *v68;
  if (v48 == *v68 && v49 == v50)
  {
LABEL_96:
    __ptr = v47;
LABEL_97:
    unint64_t __s = v46;
    unint64_t v76 = v42;
    if ((storeChunkOffsets(a1, v6, v18, v10, v25, v26, v27, v28) & 0x80000000) != 0)
    {
      unint64_t v64 = "storing new offsets";
      __int16 v65 = 635;
      goto LABEL_90;
    }

    goto LABEL_18;
  }

  unint64_t v52 = v42;
  while (1)
  {
    unsigned int size = v50;
    unint64_t v53 = v49;
    size_t v67 = v47;
    u_int32_t v54 = v49;
    ssize_t v55 = fgetxattr(a1, "com.apple.ResourceFork", v47, v49, v48, 32);
    unsigned int v56 = size;
    if (v55 != v54)
    {
LABEL_93:
      unint64_t v76 = v42;
      __ptr = v67;
      unint64_t __s = 0LL;
      unint64_t v64 = "read chunk";
      __int16 v65 = 628;
      goto LABEL_90;
    }

    if (__n == v48)
    {
      unint64_t v57 = 0LL;
    }

    else
    {
      unint64_t v57 = v53;
      if (v52 < v53) {
        goto LABEL_93;
      }
    }

    if (size <= v53)
    {
      unint64_t v46 = v57;
      int v59 = v67;
      size_t v60 = v68;
      goto LABEL_84;
    }

    unint64_t v46 = v57 + size - v53;
    rsize_t __na = size - v53;
    if (v52 < v46) {
      break;
    }
    unint64_t v61 = v67;
    if (v67)
    {
LABEL_82:
      memset_s(&v61[v57], __na, 0, __na);
      int v59 = v61;
    }

    else
    {
      int v59 = 0LL;
    }

    size_t v60 = v68;
    unsigned int v56 = size;
LABEL_84:
    off_t v62 = v59;
    if (fsetxattr(a1, "com.apple.ResourceFork", v59, v56, *v60, 0) < 0)
    {
      unint64_t v76 = v42;
      __ptr = v62;
      unint64_t __s = v46;
      unint64_t v64 = "write chunk";
      __int16 v65 = 631;
      goto LABEL_90;
    }

    if (!size_4)
    {
      u_int32_t v47 = v62;
      goto LABEL_96;
    }

    int v63 = size_4 - 1;
    u_int32_t v48 = v11[size_4 - 1];
    int __n = v11[size_4];
    u_int32_t v49 = __n - v48;
    uint64_t v68 = &v10[size_4 - 1];
    int v50 = v10[size_4--] - *v68;
    u_int32_t v47 = v62;
    if (v48 == *v68)
    {
      int size_4 = v63;
      if (v49 == v50) {
        goto LABEL_96;
      }
    }
  }

  do
  {
    while (!v52)
    {
      unint64_t v52 = 0x4000LL;
      size_t v42 = 0x4000LL;
      if (v46 <= 0x4000) {
        goto LABEL_81;
      }
    }

    unint64_t v58 = v52 >> 1;
    if ((v52 & (v52 >> 1)) != 0) {
      unint64_t v58 = v52 & (v52 >> 1);
    }
    v52 += v58;
  }

  while (v52 < v46);
  size_t v42 = v52;
  if (v52 >= 0x2000000001LL)
  {
    *__error() = 12;
    goto LABEL_101;
  }

uint64_t afscStreamClose( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    unsigned int v9 = atomic_load((unsigned int *)(result + 120));
    BOOL v10 = v9 == 0;
    unint64_t v11 = *(void *)(result + 16);
    if (*(void *)(result + 24) < v11 || *(void *)(result + 64)) {
      goto LABEL_4;
    }
    size_t v15 = *(void *)(result + 88);
    int v16 = *(_DWORD *)(result + 40);
    if (v15)
    {
      if (v16)
      {
LABEL_4:
        uint64_t v39 = *(void *)(result + 24);
        uint64_t v12 = "invalid final AFSC stream state, received %zu/%zu bytes";
        __int16 v13 = 826;
        goto LABEL_5;
      }

LABEL_5:
          int v14 = 0;
LABEL_6:
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"afscStreamClose",  v13,  55,  v14,  v12,  a7,  a8,  v39);
          BOOL v10 = 0;
LABEL_7:
          free(*(void **)(v8 + 48));
          free(*(void **)(v8 + 56));
          free(*(void **)(v8 + 80));
          memset_s((void *)(v8 + 64), 0x18uLL, 0, 0x18uLL);
          free(*(void **)(v8 + 104));
          memset_s((void *)(v8 + 88), 0x18uLL, 0, 0x18uLL);
          free((void *)v8);
          return (v10 - 1);
        }

        int v32 = *__error();
        int v33 = "fsetxattr decmpfs";
        __int16 v34 = 297;
        goto LABEL_54;
      }

uint64_t afscStreamCancel(uint64_t result)
{
  unint64_t v1 = (unsigned int *)(result + 120);
  while (!__ldaxr(v1))
  {
    if (!__stlxr(1u, v1)) {
      return result;
    }
  }

  __clrex();
  return result;
}

uint64_t afscStreamWrite( uint64_t a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (unsigned int *)(a1 + 120);
  unint64_t v11 = a3;
  uint64_t v13 = *(void *)(a1 + 24);
  BOOL v14 = __CFADD__(v13, a3);
  unint64_t v15 = v13 + a3;
  if (v14 || v15 > *(void *)(a1 + 16))
  {
    int v16 = "too many bytes received";
    __int16 v17 = 923;
    goto LABEL_6;
  }

  if (!a3) {
    return 0LL;
  }
  uint64_t v20 = __src;
  uint64_t v10 = 0LL;
  uint64_t v22 = (void *)(a1 + 64);
  size_t v21 = *(void *)(a1 + 64);
  u_int32_t v47 = (void *)(a1 + 64);
  do
  {
    if (v11 >= 0x10000 - v21) {
      size_t v23 = 0x10000 - v21;
    }
    else {
      size_t v23 = v11;
    }
    unint64_t v24 = v21 + v23;
    if (__CFADD__(v21, v23) || (v24 & 0x8000000000000000LL) != 0) {
      goto LABEL_72;
    }
    unint64_t v25 = *(void *)(a1 + 72);
    if (v25 < v24)
    {
      do
      {
        while (!v25)
        {
          unint64_t v25 = 0x4000LL;
          size_t v27 = 0x4000LL;
          if (v24 <= 0x4000) {
            goto LABEL_28;
          }
        }

        unint64_t v26 = v25 >> 1;
        if ((v25 & (v25 >> 1)) != 0) {
          unint64_t v26 = v25 & (v25 >> 1);
        }
        v25 += v26;
      }

      while (v25 < v24);
      size_t v27 = v25;
      if (v25 >= 0x2000000001LL)
      {
        *__error() = 12;
        goto LABEL_71;
      }

uint64_t afscStreamCloseWithState( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (_DWORD *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 88);
  if (v12)
  {
    if ((flushOBuf_0(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
    {
      unint64_t v26 = "flushing obuf";
      __int16 v27 = 884;
LABEL_41:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"afscStreamCloseWithState",  v27,  55,  0,  v26,  a7,  a8,  v37);
      return 0xFFFFFFFFLL;
    }

    LODWORD(v12) = *v13;
  }

  uint64_t v14 = *(void *)(a1 + 64);
  __int128 v37 = *(_OWORD *)(a1 + 8);
  uint64_t v38 = *(void *)(a1 + 24);
  int v15 = *(_DWORD *)(a1 + 40);
  int v39 = *(_DWORD *)(a1 + 32);
  int v40 = v15;
  uint64_t v41 = *(void *)(a1 + 112);
  int v42 = v14;
  int v43 = v12;
  if (!a2[3]) {
    goto LABEL_40;
  }
  uint64_t v16 = 0LL;
  int v17 = *(_DWORD *)(a1 + 44);
  int v18 = &v37;
  uint64_t v19 = 48LL;
  while (1)
  {
    uint64_t v20 = ((uint64_t (*)(void, __int128 *, uint64_t))a2[3])(*a2, v18, v19);
    if (v20 < 1) {
      break;
    }
    int v18 = (__int128 *)((char *)v18 + v20);
    v16 += v20;
    v19 -= v20;
    if (!v19)
    {
      if (v16 < 0) {
        goto LABEL_40;
      }
      goto LABEL_12;
    }
  }

  if (v20 < 0) {
    goto LABEL_40;
  }
LABEL_12:
  if (!a2[3]) {
    goto LABEL_40;
  }
  unsigned int v21 = v17 + 1;
  if (v17 != -1)
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = 4LL * v21;
    uint64_t v24 = *(void *)(a1 + 48);
    while (1)
    {
      uint64_t v25 = ((uint64_t (*)(void, uint64_t, uint64_t))a2[3])(*a2, v24, v23);
      if (v25 < 1) {
        break;
      }
      v24 += v25;
      v22 += v25;
      v23 -= v25;
      if (!v23) {
        goto LABEL_20;
      }
    }

    uint64_t v22 = v25;
LABEL_20:
    if (v22 < 0 || !a2[3]) {
      goto LABEL_40;
    }
  }

  uint64_t v28 = *(void *)(a1 + 64);
  if (v28)
  {
    uint64_t v29 = 0LL;
    uint64_t v30 = *(void *)(a1 + 80);
    while (1)
    {
      uint64_t v31 = ((uint64_t (*)(void, uint64_t, uint64_t))a2[3])(*a2, v30, v28);
      if (v31 < 1) {
        break;
      }
      v30 += v31;
      v29 += v31;
      v28 -= v31;
      if (!v28) {
        goto LABEL_28;
      }
    }

    uint64_t v29 = v31;
LABEL_28:
    if (v29 < 0) {
      goto LABEL_40;
    }
  }

  if (!a2[3]) {
    goto LABEL_40;
  }
  uint64_t v32 = *(void *)v13;
  if (*(void *)v13)
  {
    uint64_t v33 = 0LL;
    uint64_t v34 = *(void *)(a1 + 104);
    while (1)
    {
      uint64_t v35 = ((uint64_t (*)(void, uint64_t, uint64_t))a2[3])(*a2, v34, v32);
      if (v35 < 1) {
        break;
      }
      v34 += v35;
      v33 += v35;
      v32 -= v35;
      if (!v32) {
        goto LABEL_36;
      }
    }

    uint64_t v33 = v35;
LABEL_36:
    if (v33 < 0)
    {
LABEL_40:
      unint64_t v26 = "serializing state";
      __int16 v27 = 901;
      goto LABEL_41;
    }
  }

  if (a3) {
    *a3 = *(void *)(a1 + 24);
  }
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 80));
  memset_s((void *)(a1 + 64), 0x18uLL, 0, 0x18uLL);
  free(*(void **)(a1 + 104));
  memset_s(v13, 0x18uLL, 0, 0x18uLL);
  free((void *)a1);
  return 0LL;
}

uint64_t setUFCompressedBit(int a1)
{
  if (fstat(a1, &v8))
  {
    int v2 = *__error();
    uint64_t v5 = "fstat";
    __int16 v6 = 115;
LABEL_3:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"setUFCompressedBit",  v6,  55,  v2,  v5,  v3,  v4,  v8.st_dev);
    return 0xFFFFFFFFLL;
  }

  if ((v8.st_flags & 0x20) == 0 && fchflags(a1, v8.st_flags | 0x20) < 0)
  {
    int v2 = *__error();
    uint64_t v5 = "fchflags UF_COMPRESSED";
    __int16 v6 = 120;
    goto LABEL_3;
  }

  return 0LL;
}

uint64_t storeChunkOffsets( int fd, int a2, unsigned int a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  __int128 v47 = 0uLL;
  uint64_t value = 0LL;
  unint64_t v9 = 8LL * a3 + 264;
  if (a2 != 4) {
    unint64_t v9 = 4LL * a3 + 4;
  }
  if (v9 >= 0xFFFFFFFF)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"resourceForkHeaderSize",  146,  55,  0,  "invalid file size",  a7,  a8,  v47);
    __int16 v12 = 373;
    int v13 = 0;
    uint64_t v14 = "invalid file size";
LABEL_5:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"storeChunkOffsets",  v12,  55,  v13,  v14,  v10,  v11,  v47);
    int v15 = 0LL;
LABEL_54:
    uint64_t v42 = 0xFFFFFFFFLL;
    goto LABEL_55;
  }

  if (a2 == 4)
  {
    uint64_t v18 = a3;
    if (fsetxattr(fd, "com.apple.ResourceFork", &old_resource_fork_map_0, 0x32uLL, a4[a3], 0) < 0)
    {
      int v13 = *__error();
      uint64_t v14 = "fsetxattr resource fork";
      __int16 v12 = 379;
      goto LABEL_5;
    }

    unsigned int v19 = a4[a3];
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v49 = 0u;
    uint64_t v20 = (char *)malloc(0x4000uLL);
    int v15 = v20;
    if (!v20)
    {
      __int128 v47 = 0uLL;
      __int16 v45 = 399;
LABEL_49:
      uint64_t value = 0LL;
LABEL_52:
      size_t v44 = "prepare zlib header";
      int v43 = 0;
      goto LABEL_53;
    }

    uint64_t value = v20;
    *(_DWORD *)uint64_t v20 = 0x10000;
    *((_DWORD *)v20 + 1) = bswap32(v19);
    *((_DWORD *)v20 + 2) = bswap32(v19 - 256);
    *((_DWORD *)v20 + 3) = 838860800;
    __int128 v23 = v62;
    *((_OWORD *)v20 + 13) = v61;
    *((_OWORD *)v20 + 14) = v23;
    *((_OWORD *)v20 + 15) = v63;
    __int128 v24 = v58;
    *((_OWORD *)v20 + 9) = v57;
    *((_OWORD *)v20 + 10) = v24;
    __int128 v25 = v60;
    *((_OWORD *)v20 + 11) = v59;
    *((_OWORD *)v20 + 12) = v25;
    __int128 v26 = v54;
    *((_OWORD *)v20 + 5) = v53;
    *((_OWORD *)v20 + 6) = v26;
    __int128 v27 = v56;
    *((_OWORD *)v20 + 7) = v55;
    *((_OWORD *)v20 + 8) = v27;
    __int128 v28 = v50;
    *((_OWORD *)v20 + 1) = v49;
    *((_OWORD *)v20 + 2) = v28;
    __int128 v29 = v52;
    *((_OWORD *)v20 + 3) = v51;
    *((_OWORD *)v20 + 4) = v29;
    *((_DWORD *)v20 + 64) = bswap32(v19 - 260);
    *((_DWORD *)v20 + 65) = a3;
    __int128 v47 = xmmword_1862D8250;
    if (a3)
    {
      uint64_t v30 = 0LL;
      rsize_t v31 = 264LL;
      unint64_t v32 = 0x4000LL;
      while (1)
      {
        unint64_t v33 = v31 + 8;
        if (v31 >= 0xFFFFFFFFFFFFFFF8LL || (v33 & 0x8000000000000000LL) != 0)
        {
          __int16 v45 = 406;
          int v15 = (char *)value;
          goto LABEL_52;
        }

        int v34 = a4[v30++];
        int v35 = a4[v30];
        if (v32 < v33) {
          break;
        }
LABEL_24:
        *(void *)&v15[v31] = (v34 - 260) | ((unint64_t)(v35 - v34) << 32);
        rsize_t v31 = v47 + 8;
        *(void *)&__int128 v47 = v47 + 8;
        if (v30 == v18)
        {
          int v15 = (char *)value;
          goto LABEL_44;
        }
      }

      do
      {
        while (!v32)
        {
          unint64_t v32 = 0x4000LL;
          size_t v37 = 0x4000LL;
          if (v33 <= 0x4000) {
            goto LABEL_22;
          }
        }

        unint64_t v36 = v32 >> 1;
        if ((v32 & (v32 >> 1)) != 0) {
          unint64_t v36 = v32 & (v32 >> 1);
        }
        v32 += v36;
      }

      while (v32 < v33);
      size_t v37 = v32;
      if (v32 >= 0x2000000001LL)
      {
        *__error() = 12;
        goto LABEL_58;
      }

uint64_t flushOBuf_0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v9 = (*(_BYTE *)(a1 + 8) & 2) != 0 && *(_DWORD *)(a1 + 32) != 10;
  unsigned int v10 = *(_DWORD *)(a1 + 112);
  if (v10)
  {
    if (v10 > 0xD || ((1 << v10) & 0x2A88) == 0)
    {
      int v13 = (_DWORD *)(a1 + 40);
      LODWORD(v12) = *(_DWORD *)(a1 + 40);
LABEL_15:
      BOOL v15 = v10 > 0xD;
      int v16 = (1 << v10) & 0x2A88;
      if (!v15 && v16 != 0)
      {
        uint64_t v18 = "requested compression type requests inline storage";
        __int16 v19 = 704;
        int v20 = 0;
        goto LABEL_31;
      }

uint64_t loadChunkOffsets( int fd, int a2, unsigned int a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t __s = 0LL;
  size_t v31 = 0LL;
  unint64_t v32 = 0LL;
  if (a2 == 4) {
    unint64_t v9 = 8LL * a3 + 264;
  }
  else {
    unint64_t v9 = 4LL * a3 + 4;
  }
  if (v9 >= 0xFFFFFFFF)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"resourceForkHeaderSize",  146,  55,  0,  "invalid file size",  a7,  a8,  v29);
    __int16 v12 = 329;
    int v13 = "invalid file size";
LABEL_27:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAFSCStream.c",  (uint64_t)"loadChunkOffsets",  v12,  55,  0,  v13,  v10,  v11,  v29);
    uint64_t v21 = 0LL;
LABEL_28:
    uint64_t v27 = 0xFFFFFFFFLL;
    goto LABEL_29;
  }

  unint64_t v17 = v9 & 0xFFFFFFFC;
  if ((v9 & 0xFFFFFFFC) != 0)
  {
    size_t v18 = 0LL;
    do
    {
      while (!v18)
      {
        size_t v18 = 0x4000LL;
        if (v17 <= 0x4000)
        {
          size_t v18 = 0x4000LL;
          goto LABEL_17;
        }
      }

      size_t v19 = v18 >> 1;
      if ((v18 & (v18 >> 1)) != 0) {
        size_t v19 = v18 & (v18 >> 1);
      }
      v18 += v19;
    }

    while (v18 < v17);
    if (v18 >= 0x2000000001LL)
    {
      *__error() = 12;
      goto LABEL_26;
    }

AAByteStream AACompressionOutputStreamOpen( AAByteStream compressed_stream, AACompressionAlgorithm compression_algorithm, size_t block_size, AAFlagSet flags, int n_threads)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  unint64_t v9 = calloc(1uLL, 0x68uLL);
  if (!v9)
  {
    int v16 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"AACompressionOutputStreamOpen",  254,  19,  *v16,  "malloc",  v17,  v18,  v32);
    uint64_t v10 = 0LL;
LABEL_37:
    free(v9);
    aaCompressionOutputStreamClose(v10, v24, v25, v26, v27, v28, v29, v30);
    return 0LL;
  }

  uint64_t v10 = (uint64_t *)calloc(1uLL, 0x30uLL);
  if (!v10)
  {
    int v19 = *__error();
    int v20 = "malloc";
    __int16 v21 = 256;
LABEL_36:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"AACompressionOutputStreamOpen",  v21,  19,  v19,  v20,  v13,  v14,  v32);
    goto LABEL_37;
  }

  if (!n_threads) {
    n_threads = getDefaultNThreads();
  }
  *((_DWORD *)v10 + 2) = n_threads;
  uint64_t v11 = calloc(n_threads, 8uLL);
  v10[2] = (uint64_t)v11;
  if (*((_DWORD *)v10 + 2))
  {
    unint64_t v12 = 0LL;
    while (1)
    {
      *(void *)(v10[2] + 8 * v12) = CompressionWorkerDataCreate( block_size,  (compression_algorithm)compression_algorithm);
      uint64_t v15 = v10[2];
      if (!*(void *)(v15 + 8 * v12)) {
        break;
      }
      ++v12;
      uint64_t v11 = (void *)*((unsigned int *)v10 + 2);
    }

    int v20 = "Worker data allocation";
    __int16 v21 = 264;
    goto LABEL_35;
  }

  uint64_t v15 = (uint64_t)v11;
  LODWORD(v11) = 0;
LABEL_13:
  ssize_t v22 = ThreadPipelineCreate( v11,  v15,  (uint64_t)CompressionWorkerProc,  (uint64_t)v10,  (uint64_t)CompressionConsumerProc,  0LL);
  *uint64_t v10 = (uint64_t)v22;
  if (!v22)
  {
    int v20 = "Thread allocation";
    __int16 v21 = 267;
LABEL_35:
    int v19 = 0;
    goto LABEL_36;
  }

  v10[3] = (uint64_t)compressed_stream;
  qmemcpy(buf, "pbz", sizeof(buf));
  char v23 = 122;
  if ((int)compression_algorithm <= 1284)
  {
    if (compression_algorithm)
    {
      if (compression_algorithm == 256)
      {
        char v23 = 52;
      }

      else
      {
        if (compression_algorithm != 774) {
          goto LABEL_34;
        }
        char v23 = 120;
      }
    }

    else
    {
      char v23 = 45;
    }
  }

  else
  {
    if ((int)compression_algorithm <= 2048)
    {
      if (compression_algorithm == 1285) {
        goto LABEL_31;
      }
      if (compression_algorithm == 1794)
      {
        char v23 = 98;
        goto LABEL_31;
      }

void *CompressionWorkerDataCreate(size_t a1, compression_algorithm a2)
{
  __int16 v4 = 56;
  uint64_t v5 = calloc(1uLL, 0x38uLL);
  __int16 v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  v5[1] = 0LL;
  v5[2] = 0LL;
  *uint64_t v5 = a1;
  if (a1 >= 0x2000000001LL)
  {
    *__error() = 12;
    v6[3] = 0LL;
    *__error() = 12;
    size_t v7 = v6 + 4;
    __int16 v4 = 62;
LABEL_4:
    *size_t v7 = 0LL;
LABEL_5:
    stat v8 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"CompressionWorkerDataCreate",  v4,  19,  *v8,  "malloc",  v9,  v10,  v16);
    CompressionWorkerDataDestroy((void **)v6);
    return 0LL;
  }

  unint64_t v12 = malloc(a1);
  v6[3] = v12;
  uint64_t v13 = malloc(a1);
  v6[4] = v13;
  __int16 v4 = 62;
  if (!v12 || !v13) {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 10) = a2;
  if (a2)
  {
    if (a2 != COMPRESSION_LZMA)
    {
      size_t v14 = compression_encode_scratch_buffer_size(a2);
      if (v14)
      {
        if (v14 < 0x2000000001LL)
        {
          uint64_t v15 = malloc(v14);
          v6[6] = v15;
          if (v15) {
            return v6;
          }
          __int16 v4 = 68;
          goto LABEL_5;
        }

        *__error() = 12;
        size_t v7 = v6 + 6;
        __int16 v4 = 68;
        goto LABEL_4;
      }
    }
  }

  return v6;
}

uint64_t CompressionWorkerProc(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 8);
  compression_algorithm v3 = *(_DWORD *)(a1 + 40);
  if (!v3
    || (v3 != COMPRESSION_LZMA
      ? (size_t v5 = compression_encode_buffer( *(uint8_t **)(a1 + 32),  *(void *)a1,  *(const uint8_t **)(a1 + 24),  v2,  *(void **)(a1 + 48),  v3))
      : (int64_t v4 = PCompressLZMA6Encode(*(uint8_t **)(a1 + 32), *(void *)a1, *(const uint8_t **)(a1 + 24), v2),
         size_t v5 = v4 & ~(v4 >> 63)),
        v5 ? (BOOL v6 = v5 + (v2 >> 4) >= v2) : (BOOL v6 = 1),
        v6))
  {
    memcpy(*(void **)(a1 + 32), *(const void **)(a1 + 24), v2);
    size_t v5 = v2;
  }

  *(void *)(a1 + 16) = v5;
  return 0LL;
}

uint64_t CompressionConsumerProc(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!*(_DWORD *)(a1 + 40))
  {
    int8x16_t v8 = vrev64q_s8(*(int8x16_t *)(a2 + 8));
    if (AAByteStreamWrite(*(AAByteStream *)(a1 + 24), &v8, 0x10uLL) == 16)
    {
      __int16 v7 = 119;
    }

    else
    {
      __int16 v7 = 115;
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"CompressionConsumerProc",  v7,  19,  0,  "Stream write failed",  v4,  v5,  v8.i8[0]);
    *(_DWORD *)(a1 + 40) = 1;
  }

  return 0xFFFFFFFFLL;
}

uint64_t aaCompressionOutputStreamWrite( uint64_t a1, uint64_t __src, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0LL;
  }
  size_t v8 = a3;
  uint64_t v9 = (char *)__src;
  uint64_t v11 = 0LL;
  while (1)
  {
    unint64_t v12 = *(uint64_t **)(a1 + 32);
    if (v12)
    {
      uint64_t v13 = v12[1];
      goto LABEL_7;
    }

    uint64_t Worker = ThreadPipelineGetWorker(*(void *)a1, __src, a3, a4, a5, a6, a7, a8);
    *(void *)(a1 + 32) = Worker;
    if (!Worker) {
      break;
    }
    unint64_t v12 = (uint64_t *)Worker;
    uint64_t v13 = 0LL;
    *(void *)(Worker + 8) = 0LL;
    *(void *)(Worker + 16) = 0LL;
LABEL_7:
    if (*v12 - v13 >= v8) {
      size_t v15 = v8;
    }
    else {
      size_t v15 = *v12 - v13;
    }
    memcpy((void *)(v12[3] + v13), v9, v15);
    uint64_t v16 = *v12;
    size_t v17 = v12[1] + v15;
    v12[1] = v17;
    if (v17 == v16)
    {
      if ((ThreadPipelineRunWorker(*(void *)a1, *(void *)(a1 + 32), a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
      {
        uint64_t v18 = "running worker";
        __int16 v19 = 186;
        goto LABEL_18;
      }

      *(void *)(a1 + 32) = 0LL;
    }

    v9 += v15;
    v11 += v15;
    v8 -= v15;
    if (!v8) {
      return v11;
    }
  }

  uint64_t v18 = "getting next worker";
  __int16 v19 = 168;
LABEL_18:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"aaCompressionOutputStreamWrite",  v19,  19,  0,  v18,  a7,  a8,  v21);
  *(_DWORD *)(a1 + 40) = 1;
  return -1LL;
}

uint64_t aaCompressionOutputStreamAbort(uint64_t result)
{
  *(_DWORD *)(result + 40) = 1;
  return result;
}

uint64_t *aaCompressionOutputStreamClose( uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    size_t v8 = result;
    uint64_t v9 = result[4];
    if (v9)
    {
      if ((ThreadPipelineRunWorker(*result, v9, a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"aaCompressionOutputStreamClose",  133,  19,  0,  "RunWorker",  v10,  v11,  v20);
        int v12 = 0;
      }

      else
      {
        int v12 = 1;
      }

      v8[4] = 0LL;
    }

    else
    {
      int v12 = 1;
    }

    if ((ThreadPipelineDestroy(*v8) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"aaCompressionOutputStreamClose",  138,  19,  0,  "Thread shutdown",  v13,  v14,  v20);
      int v12 = 0;
    }

    size_t v15 = (void *)v8[2];
    if (v15)
    {
      if (*((_DWORD *)v8 + 2))
      {
        unint64_t v16 = 0LL;
        do
          CompressionWorkerDataDestroy(*(void ***)(v8[2] + 8 * v16++));
        while (v16 < *((unsigned int *)v8 + 2));
        size_t v15 = (void *)v8[2];
      }

      free(v15);
    }

    if (*((_DWORD *)v8 + 11)
      && (AAByteStreamSeek((AAByteStream)v8[3], 0LL, 1) < 0 || (AAByteStreamTruncate((void *)v8[3]) & 0x80000000) != 0))
    {
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"aaCompressionOutputStreamClose",  151,  19,  "Truncate on compressed stream failed",  v17,  v18,  v19,  v20);
    }

    free(v8);
    if (v12) {
      return 0LL;
    }
    else {
      return (uint64_t *)0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t aaCompressionOutputStreamFlush(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40)) {
    return 0xFFFFFFFFLL;
  }
  if ((ThreadPipelineFlush(*(void *)a1) & 0x80000000) != 0)
  {
    uint64_t v10 = "ThreadPipelineFlush";
    __int16 v11 = 209;
LABEL_15:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"aaCompressionOutputStreamFlush",  v11,  19,  0,  v10,  v2,  v3,  v12);
    *(_DWORD *)(a1 + 40) = 1;
    return 0xFFFFFFFFLL;
  }

  if (*(void *)(a1 + 32))
  {
    off_t v4 = AAByteStreamSeek(*(AAByteStream *)(a1 + 24), 0LL, 1);
    if (v4 < 0)
    {
      uint64_t v10 = "AAByteStreamSeek";
      __int16 v11 = 216;
    }

    else
    {
      off_t v5 = v4;
      CompressionWorkerProc(*(void *)(a1 + 32));
      if ((CompressionConsumerProc(a1, *(void *)(a1 + 32)) & 0x80000000) != 0)
      {
        uint64_t v10 = "CompressionConsumerProc";
        __int16 v11 = 220;
      }

      else
      {
        if (v5 == AAByteStreamSeek(*(AAByteStream *)(a1 + 24), v5, 0))
        {
          *(_DWORD *)(a1 + 44) = 1;
          goto LABEL_8;
        }

        uint64_t v10 = "AAByteStreamSeek";
        __int16 v11 = 223;
      }
    }

    goto LABEL_15;
  }

AAByteStream AACompressionOutputStreamOpenExisting( AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  off_t v5 = AAByteStreamSeek(compressed_stream, 0LL, 2);
  if (v5 < 0)
  {
    size_t v15 = "Stream seek";
    __int16 v16 = 311;
    goto LABEL_15;
  }

  if (!*((void *)compressed_stream + 4))
  {
LABEL_13:
    size_t v15 = "Truncated stream";
    __int16 v16 = 315;
LABEL_15:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AACompressionStream.c",  (uint64_t)"AACompressionOutputStreamOpenExisting",  v16,  19,  0,  v15,  v6,  v7,  v78);
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
LABEL_16:
    uint64_t v19 = 0LL;
    char v20 = 0LL;
LABEL_17:
    int v21 = 1;
    goto LABEL_18;
  }

  off_t v8 = v5;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  __int16 v11 = &v86;
  uint64_t v12 = 12LL;
  do
  {
    uint64_t v13 = (*((uint64_t (**)(void, __int16 *, uint64_t, uint64_t))compressed_stream + 4))( *(void *)compressed_stream,  v11,  v12,  v10);
    if (v13 < 0) {
      goto LABEL_13;
    }
    if (!v13) {
      break;
    }
    __int16 v11 = (__int16 *)((char *)v11 + v13);
    v9 += v13;
    v10 += v13;
    v12 -= v13;
  }

  while (v12);
  if (v9 != 12) {
    goto LABEL_13;
  }
  if (v86 != 25200 || v87 != 122)
  {
    size_t v15 = "Invalid stream magic";
    __int16 v16 = 316;
    goto LABEL_15;
  }

  if (v88 <= 100)
  {
    switch(v88)
    {
      case '-':
        int v30 = 0;
        uint64_t v79 = 0x100000000LL;
        break;
      case '4':
        uint64_t v79 = 0LL;
        int v30 = 256;
        break;
      case 'b':
        uint64_t v79 = 0LL;
        int v30 = 1794;
        break;
      default:
        goto LABEL_60;
    }
  }

  else if (v88 > 119)
  {
    if (v88 == 120)
    {
      int v30 = 774;
      uint64_t v79 = 1LL;
    }

    else
    {
      if (v88 != 122) {
        goto LABEL_60;
      }
      uint64_t v79 = 0LL;
      int v30 = 1285;
    }
  }

  else
  {
    if (v88 != 101)
    {
      if (v88 == 102)
      {
        uint64_t v79 = 0LL;
        int v30 = 2304;
        goto LABEL_37;
      }

void CompressionWorkerDataDestroy(void **a1)
{
  if (a1)
  {
    free(a1[3]);
    free(a1[4]);
    free(a1[6]);
    free(a1);
  }

void *aaSequentialDecompressionIStreamOpen(uint64_t a1, int a2)
{
  if (!a2) {
    getDefaultNThreads();
  }
  uint64_t v3 = calloc(1uLL, 0x68uLL);
  off_t v4 = malloc(0x160uLL);
  uint64_t v5 = (uint64_t)v4;
  if (!v4 || (memset_s(v4, 0x160uLL, 0, 0x160uLL), !v3))
  {
    int v16 = *__error();
    uint64_t v17 = "malloc";
    __int16 v18 = 266;
LABEL_31:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AASequentialDecompressionStream.c",  (uint64_t)"aaSequentialDecompressionIStreamOpen",  v18,  20,  v16,  v17,  v14,  v15,  v20);
    free(v3);
    aaDecompressionStreamClose(v5);
    return 0LL;
  }

  *(void *)uint64_t v5 = a1;
  *(_DWORD *)(v5 + 56) = -1;
  uint64_t v6 = (void *)(v5 + 8);
  size_t v7 = *(void *)(v5 + 16);
  if (!(v7 >> 16))
  {
    do
    {
      size_t v8 = (v7 >> 1) + v7;
      if (((v7 >> 1) & v7) != 0) {
        size_t v8 = ((v7 >> 1) & v7) + v7;
      }
      if (v7) {
        size_t v7 = v8;
      }
      else {
        size_t v7 = 0x4000LL;
      }
    }

    while (v7 < 0x10000);
    uint64_t v9 = *(void **)(v5 + 24);
    uint64_t v10 = realloc(v9, v7);
    if (!v10) {
      goto LABEL_29;
    }
    *(void *)(v5 + 16) = v7;
    *(void *)(v5 + 24) = v10;
  }

  size_t v11 = *(void *)(v5 + 40);
  if (v11 >> 16) {
    goto LABEL_23;
  }
  do
  {
    size_t v12 = (v11 >> 1) + v11;
    if (((v11 >> 1) & v11) != 0) {
      size_t v12 = ((v11 >> 1) & v11) + v11;
    }
    if (v11) {
      size_t v11 = v12;
    }
    else {
      size_t v11 = 0x4000LL;
    }
  }

  while (v11 < 0x10000);
  uint64_t v9 = *(void **)(v5 + 48);
  uint64_t v13 = realloc(v9, v11);
  if (!v13)
  {
    uint64_t v6 = (void *)(v5 + 32);
LABEL_29:
    free(v9);
    *uint64_t v6 = 0LL;
    v6[1] = 0LL;
    v6[2] = 0LL;
    uint64_t v17 = "allocating buffer";
    __int16 v18 = 273;
    goto LABEL_30;
  }

  *(void *)(v5 + 40) = v11;
  *(void *)(v5 + 48) = v13;
LABEL_23:
  if (aaDecompressionStreamRefill(v5, 0xCuLL) < 0)
  {
    uint64_t v17 = "reading magic";
    __int16 v18 = 276;
LABEL_30:
    int v16 = 0;
    goto LABEL_31;
  }

  __memcpy_chk();
  if (*(_DWORD *)(v5 + 56) == -1) {
    *(_DWORD *)(v5 + 56) = 0;
  }
  *uint64_t v3 = v5;
  v3[1] = aaDecompressionStreamClose;
  v3[2] = aaDecompressionStreamRead;
  v3[7] = aaDecompressionStreamAbort;
  return v3;
}

uint64_t aaDecompressionStreamRefill(uint64_t a1, size_t a2)
{
  if (!a2) {
    return 0LL;
  }
  size_t v2 = a2;
  uint64_t v4 = 0LL;
  uint64_t v6 = (unint64_t *)(a1 + 8);
  uint64_t v5 = *(AAByteStream_impl **)a1;
  unint64_t v8 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  while (1)
  {
    if (v8 != v7) {
      goto LABEL_14;
    }
    unint64_t v9 = v7 + 0x40000;
    if (v7 <= 0xFFFFFFFFFFFBFFFFLL) {
      break;
    }
    unint64_t v8 = v7;
LABEL_14:
    size_t v11 = v7;
LABEL_18:
    if (v11 - v8 >= v2) {
      size_t v14 = v2;
    }
    else {
      size_t v14 = v11 - v8;
    }
    ssize_t v15 = AAByteStreamRead(v5, (void *)(*(void *)(a1 + 24) + v8), v14);
    if (v15 < 0) {
      return -1LL;
    }
    if (!v15) {
      return v4;
    }
    unint64_t v8 = *v6 + v15;
    if (__CFADD__(*v6, v15)) {
      return -1LL;
    }
    unint64_t v7 = *(void *)(a1 + 16);
    if (v8 > v7) {
      return -1LL;
    }
    *uint64_t v6 = v8;
    v4 += v15;
    v2 -= v15;
    if (!v2) {
      return v4;
    }
  }

  do
  {
    while (!v7)
    {
      unint64_t v7 = 0x4000LL;
      size_t v11 = 0x4000LL;
      if (v9 <= 0x4000) {
        goto LABEL_16;
      }
    }

    unint64_t v10 = v7 >> 1;
    if ((v7 & (v7 >> 1)) != 0) {
      unint64_t v10 = v7 & (v7 >> 1);
    }
    v7 += v10;
  }

  while (v7 < v9);
  size_t v11 = v7;
  if (v7 >= 0x2000000001LL)
  {
    *__error() = 12;
    goto LABEL_32;
  }

size_t aaDecompressionStreamReadInput(uint64_t a1, uint64_t a2, size_t nbyte)
{
  if (nbyte)
  {
    size_t v3 = nbyte;
    uint64_t v6 = 0LL;
    while (1)
    {
      size_t v7 = *(void *)(a1 + 8);
      if (v7)
      {
        if (v3 >= v7) {
          size_t v8 = *(void *)(a1 + 8);
        }
        else {
          size_t v8 = v3;
        }
        memcpy((void *)(a2 + v6), *(const void **)(a1 + 24), v8);
        if ((v8 & 0x8000000000000000LL) != 0) {
          return v8;
        }
        unint64_t v9 = *(void *)(a1 + 8);
        size_t v10 = v9 - v8;
        if (v9 >= v8)
        {
          if (v9 != v8) {
            memmove(*(void **)(a1 + 24), (const void *)(*(void *)(a1 + 24) + v8), v9 - v8);
          }
          *(void *)(a1 + 8) = v10;
        }
      }

      else
      {
        if (*(_DWORD *)(a1 + 60)) {
          return v6;
        }
        ssize_t v11 = AAByteStreamRead(*(AAByteStream *)a1, (void *)(a2 + v6), v3);
        size_t v8 = v11;
        if (v11 < 0) {
          return v8;
        }
        if (!v11)
        {
          *(_DWORD *)(a1 + 60) = 1;
          return v6;
        }
      }

      v6 += v8;
      v3 -= v8;
      if (!v3) {
        return v6;
      }
    }
  }

  return 0LL;
}

uint64_t aaDecompressionStreamClose(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 56);
    switch(v2)
    {
      case 2:
        compression_stream_destroy((compression_stream *)(a1 + 312));
        break;
      case 4:
        BZ2_bzDecompressEnd((bz_stream *)(a1 + 96));
        break;
      case 3:
        lzma_end();
        break;
    }

    IDecoderStreamDestroy(*(void **)(a1 + 72));
    free(*(void **)(a1 + 24));
    memset_s((void *)(a1 + 8), 0x18uLL, 0, 0x18uLL);
    free(*(void **)(a1 + 48));
    memset_s((void *)(a1 + 32), 0x18uLL, 0, 0x18uLL);
    free((void *)a1);
  }

  return 0LL;
}

size_t aaDecompressionStreamRead( uint64_t a1, uint64_t a2, size_t nbyte, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 68)) {
    return -1LL;
  }
  size_t v10 = nbyte;
  uint64_t v13 = *(void *)(a1 + 72);
  if (v13) {
    return IDecoderStreamRead(v13, a2, nbyte);
  }
  int v14 = *(_DWORD *)(a1 + 56);
  if (v14 == -1) {
    return -1LL;
  }
  if (!v14) {
    return aaDecompressionStreamReadInput(a1, a2, nbyte);
  }
  if (!nbyte) {
    return 0LL;
  }
  int v15 = 0;
  size_t v16 = 0LL;
  unint64_t v83 = (unint64_t *)(a1 + 8);
LABEL_11:
  size_t v17 = *(void *)(a1 + 32);
  if (v17)
  {
    if (v10 >= v17) {
      size_t v8 = *(void *)(a1 + 32);
    }
    else {
      size_t v8 = v10;
    }
    memcpy((void *)(a2 + v16), *(const void **)(a1 + 48), v8);
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      unint64_t v18 = *(void *)(a1 + 32);
      size_t v19 = v18 - v8;
      if (v18 >= v8)
      {
        if (v18 != v8) {
          memmove(*(void **)(a1 + 48), (const void *)(*(void *)(a1 + 48) + v8), v18 - v8);
        }
        *(void *)(a1 + 32) = v19;
      }

      v16 += v8;
      v10 -= v8;
      goto LABEL_137;
    }

    return v8;
  }

  if (*(_DWORD *)(a1 + 64)) {
    return v16;
  }
  unint64_t v21 = *(void *)(a1 + 8);
  unint64_t v20 = *(void *)(a1 + 16);
  if (v20 == v21) {
    goto LABEL_53;
  }
  if (*(_DWORD *)(a1 + 60)) {
    goto LABEL_52;
  }
  size_t v22 = v20 - v21;
  if (v20 == v21) {
    goto LABEL_51;
  }
  size_t v8 = 0LL;
  uint64_t v23 = *(AAByteStream_impl **)a1;
  while (1)
  {
    if (v21 != v20) {
      goto LABEL_37;
    }
    unint64_t v24 = v20 + 0x40000;
    if (v20 > 0xFFFFFFFFFFFBFFFFLL)
    {
      unint64_t v21 = v20;
LABEL_37:
      size_t v26 = v20;
      goto LABEL_41;
    }

    do
    {
      while (!v20)
      {
        unint64_t v20 = 0x4000LL;
        size_t v26 = 0x4000LL;
        if (v24 <= 0x4000) {
          goto LABEL_39;
        }
      }

      unint64_t v25 = v20 >> 1;
      if ((v20 & (v20 >> 1)) != 0) {
        unint64_t v25 = v20 & (v20 >> 1);
      }
      v20 += v25;
    }

    while (v20 < v24);
    size_t v26 = v20;
    if (v20 >= 0x2000000001LL)
    {
      *__error() = 12;
      goto LABEL_152;
    }

LABEL_120:
            *(_DWORD *)(a1 + 64) = 1;
            goto LABEL_136;
          }

          if (v21 <= 0xF) {
            goto LABEL_146;
          }
          unint64_t v35 = v32[1];
          size_t v36 = bswap64(*v32);
          unint64_t v37 = bswap64(v35);
          size_t v38 = *(void *)(a1 + 80);
          if (v36 > v38 || v37 > v38)
          {
            uint64_t v76 = "corrupted stream header";
            __int16 v77 = 217;
            goto LABEL_154;
          }

          int v79 = v15;
          unint64_t v40 = v37 + 16;
          if (v37 + 16 > v21)
          {
            uint64_t v76 = "truncated stream payload";
            __int16 v77 = 218;
            goto LABEL_154;
          }

          if (v36 > v33)
          {
            uint64_t v76 = "unexpected output buffer size";
            __int16 v77 = 219;
            goto LABEL_154;
          }

          unint64_t v41 = *v32;
          if (*v32 != v35)
          {
            uint64_t v76 = "block decompression failed";
            __int16 v77 = 229;
LABEL_154:
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AASequentialDecompressionStream.c",  (uint64_t)"aaDecompressionStreamRead",  v77,  20,  0,  v76,  a7,  a8,  v78);
            return -1LL;
          }

          memcpy(v34, v32 + 2, v36);
LABEL_122:
          if (v40)
          {
            unint64_t v72 = *v83 - v40;
            if (*v83 >= v40)
            {
              if (*v83 != v40) {
                memmove(*(void **)(a1 + 24), (const void *)(*(void *)(a1 + 24) + v40), *v83 - v40);
              }
              *unint64_t v83 = v72;
            }
          }

          if (v41)
          {
            uint64_t v73 = *(void *)(a1 + 32);
            BOOL v74 = __CFADD__(v73, v36);
            size_t v75 = v73 + v36;
            int v15 = v79;
            if (!v74 && v75 <= *(void *)(a1 + 40)) {
              *(void *)(a1 + 32) = v75;
            }
          }

          else
          {
            int v15 = v79;
          }

size_t aaDecompressionStreamAbort( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *(_DWORD *)(a1 + 68) = 1;
  size_t result = *(void *)(a1 + 72);
  if (result) {
    return IDecoderStreamAbort(result, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

uint64_t jsonPushLabel(uint64_t a1, char a2)
{
  unint64_t v4 = *(void *)(a1 + 72);
  unint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = (void *)(a1 + 72);
  if (v5 >= v4)
  {
    if (v4) {
      size_t v8 = v4 + (v4 >> 1);
    }
    else {
      size_t v8 = 256LL;
    }
    *(void *)(a1 + 72) = v8;
    size_t v7 = reallocf(*(void **)(a1 + 88), v8);
    *(void *)(a1 + 88) = v7;
    if (!v7)
    {
      size_t v10 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"jsonPushLabel",  358,  109,  *v10,  "malloc",  v11,  v12,  v14);
      *uint64_t v6 = 0LL;
      v6[1] = 0LL;
      return 0xFFFFFFFFLL;
    }

    unint64_t v5 = *(void *)(a1 + 80);
  }

  else
  {
    size_t v7 = *(_BYTE **)(a1 + 88);
  }

  uint64_t v9 = 0LL;
  *(void *)(a1 + 80) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

uint64_t jsonPushValue(uint64_t a1, char a2)
{
  unint64_t v4 = *(void *)(a1 + 96);
  unint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = (void *)(a1 + 96);
  if (v5 >= v4)
  {
    if (v4) {
      size_t v8 = v4 + (v4 >> 1);
    }
    else {
      size_t v8 = 256LL;
    }
    *(void *)(a1 + 96) = v8;
    size_t v7 = reallocf(*(void **)(a1 + 112), v8);
    *(void *)(a1 + 112) = v7;
    if (!v7)
    {
      size_t v10 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"jsonPushValue",  372,  109,  *v10,  "malloc",  v11,  v12,  v14);
      *uint64_t v6 = 0LL;
      v6[1] = 0LL;
      return 0xFFFFFFFFLL;
    }

    unint64_t v5 = *(void *)(a1 + 104);
  }

  else
  {
    size_t v7 = *(_BYTE **)(a1 + 112);
  }

  uint64_t v9 = 0LL;
  *(void *)(a1 + 104) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

void *AAJSONInputStreamOpen(uint64_t a1)
{
  int v2 = malloc(0x78uLL);
  size_t v3 = v2;
  if (v2)
  {
    memset_s(v2, 0x78uLL, 0, 0x78uLL);
    v3[1] = a1;
    v3[5] = 0x10000LL;
    unint64_t v4 = malloc(0x10000uLL);
    v3[8] = v4;
    if (v4)
    {
      *(void *)((char *)v3 + 20) = 32LL;
      v3[4] = calloc(0x20uLL, 4uLL);
    }

    else
    {
      size_t v8 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamOpen",  387,  109,  *v8,  "malloc",  v9,  v10,  v12);
      AAJSONInputStreamClose((void **)v3);
      return 0LL;
    }
  }

  else
  {
    unint64_t v5 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamOpen",  382,  109,  *v5,  "malloc",  v6,  v7,  v12);
  }

  return v3;
}

void AAJSONInputStreamClose(void **a1)
{
  if (a1)
  {
    free(a1[4]);
    free(a1[11]);
    free(a1[14]);
    free(a1[8]);
    free(a1);
  }

uint64_t AAJSONInputStreamRead( uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = *(_DWORD *)(a1 + 16);
  if (v10 == 9 || v10 == -1)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamRead",  418,  109,  0,  "unexpected read call",  a7,  a8,  v46);
    return 0xFFFFFFFFLL;
  }

  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 104) = 0LL;
  uint64_t v14 = MEMORY[0x1895F8770];
  while (2)
  {
    unint64_t v15 = *(void *)(a1 + 56);
    size_t v16 = *(unsigned __int8 **)(a1 + 64);
    if (v15 >= *(void *)(a1 + 48))
    {
      ssize_t v17 = AAByteStreamRead(*(AAByteStream *)(a1 + 8), v16, *(void *)(a1 + 40));
      if (v17 < 0)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamRead",  430,  109,  0,  "read error: %zd",  a7,  a8,  v17);
LABEL_104:
        uint64_t result = 0xFFFFFFFFLL;
        *(_DWORD *)(a1 + 16) = -1;
        return result;
      }

      if (!v17)
      {
        ssize_t v30 = "EOF reached";
        __int16 v31 = 431;
        goto LABEL_103;
      }

      unint64_t v15 = 0LL;
      *(void *)(a1 + 48) = v17;
      size_t v16 = *(unsigned __int8 **)(a1 + 64);
    }

    *(void *)(a1 + 56) = v15 + 1;
    int v18 = v16[v15];
    char v19 = v16[v15];
    switch(*(_DWORD *)(a1 + 16))
    {
      case 0:
        *(void *)(a1 + 104) = 0LL;
        if ((char)v18 < 0)
        {
        }

        else if ((*(_DWORD *)(v14 + 4LL * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }

        if (v18 == 34) {
          goto LABEL_68;
        }
        if (v18 == 43 || v18 == 45 || ((char)v18 - 48) <= 9)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            int v23 = 3;
            goto LABEL_69;
          }

          ssize_t v30 = "jsonPushValue";
          __int16 v31 = 451;
          goto LABEL_103;
        }

        if (v18 == 123)
        {
          uint64_t v32 = *(unsigned int *)(a1 + 24);
          if ((_DWORD)v32 == *(_DWORD *)(a1 + 20))
          {
            ssize_t v30 = "max level reached";
            __int16 v31 = 465;
            goto LABEL_103;
          }

          int v27 = 0;
          uint64_t v44 = *(void *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v32 + 1;
          *(_DWORD *)(v44 + 4 * v32) = 0;
          int v37 = 6;
          goto LABEL_125;
        }

        if (v18 == 91)
        {
          uint64_t v33 = *(unsigned int *)(a1 + 24);
          if ((_DWORD)v33 == *(_DWORD *)(a1 + 20))
          {
            ssize_t v30 = "max level reached";
            __int16 v31 = 457;
            goto LABEL_103;
          }

          int v37 = 0;
          uint64_t v45 = *(void *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v33 + 1;
          int v27 = 1;
          *(_DWORD *)(v45 + 4 * v33) = 1;
          goto LABEL_125;
        }

        if (((char)v18 - 97) <= 0x19)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            int v23 = 4;
            goto LABEL_69;
          }

          ssize_t v30 = "jsonPushValue";
          __int16 v31 = 473;
          goto LABEL_103;
        }

        unsigned int v25 = *(_DWORD *)(a1 + 24) - 1;
        BOOL v34 = (*(_DWORD *)(*(void *)(a1 + 32) + 4LL * v25) & 1) == 0 || (char)v18 != 93;
        BOOL v35 = (*(_DWORD *)(*(void *)(a1 + 32) + 4LL * v25) & 1) == 0 && (char)v18 == 125;
        if (v34 && !v35) {
          goto LABEL_102;
        }
        goto LABEL_121;
      case 1:
        if (v18 == 92)
        {
          int v23 = 2;
          goto LABEL_69;
        }

        if (v18 == 34)
        {
          *(_DWORD *)(a1 + 16) = 5;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            int v27 = 3;
            goto LABEL_126;
          }

          ssize_t v30 = "jsonPushValue";
          __int16 v31 = 499;
          goto LABEL_103;
        }

        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          ssize_t v30 = "jsonPushValue";
          __int16 v31 = 503;
          goto LABEL_103;
        }

        continue;
      case 2:
        HIDWORD(v21) = (char)v18;
        LODWORD(v21) = ((char)v18 << 24) - 1644167168;
        unsigned __int8 v20 = v21 >> 25;
        if (v20 < 0xAu && ((0x341u >> v20) & 1) != 0)
        {
          char v22 = byte_1862D8279[(char)v20];
        }

        else if ((char)v18 == 102)
        {
          char v22 = 12;
        }

        else
        {
          char v22 = v19;
        }

        if ((jsonPushValue(a1, v22) & 0x80000000) != 0)
        {
          ssize_t v30 = "jsonPushValue";
          __int16 v31 = 512;
          goto LABEL_103;
        }

LABEL_102:
          char v46 = v19;
          ssize_t v30 = "invalid char %c %s";
          __int16 v31 = 610;
          goto LABEL_103;
        }

        if ((v26 & 1) != 0) {
          int v23 = 0;
        }
        else {
          int v23 = 6;
        }
LABEL_69:
        *(_DWORD *)(a1 + 16) = v23;
        continue;
      case 6:
        *(void *)(a1 + 80) = 0LL;
        if (((char)v18 & 0x80000000) == 0)
        {
          continue;
        }

unsigned int *ThreadPoolCreate(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (unsigned int *)calloc(1uLL, 0xA8uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    *uint64_t v6 = a1;
    size_t v8 = calloc(a1, 0xA8uLL);
    *((void *)v7 + 1) = v8;
    if (v8)
    {
      size_t v9 = *v7;
      v7[8] = 0;
      v7[9] = v9;
      int v10 = calloc(v9, 4uLL);
      *((void *)v7 + 5) = v10;
      if (v10)
      {
        if (pthread_mutex_init((pthread_mutex_t *)(v7 + 12), 0LL))
        {
          uint64_t v14 = "SharedArrayInit: pthread_mutex_init failed\n";
          __int16 v15 = 56;
        }

        else
        {
          if (!pthread_cond_init((pthread_cond_t *)(v7 + 28), 0LL))
          {
            v7[4] = -1;
            if (!*v7) {
              return v7;
            }
            uint64_t v22 = 0LL;
            unint64_t v23 = 0LL;
            while (1)
            {
              uint64_t v24 = *((void *)v7 + 1);
              uint64_t v25 = v24 + v22;
              *(void *)(v25 + 16) = v7;
              *(_DWORD *)(v25 + 8) = v23;
              *(void *)(v25 + 24) = *(void *)(a2 + 8 * v23);
              *(void *)(v25 + 32) = a3;
              *(_DWORD *)(v25 + 40) = 0;
              if (pthread_mutex_init((pthread_mutex_t *)(v24 + v22 + 48), 0LL)
                || pthread_cond_init((pthread_cond_t *)(v25 + 112), 0LL))
              {
                char v19 = "SemInit";
                __int16 v20 = 115;
                goto LABEL_12;
              }

              ++v23;
              v22 += 168LL;
              if (v23 >= *v7) {
                return v7;
              }
            }

            char v19 = "Thread creation";
            __int16 v20 = 116;
            goto LABEL_12;
          }

          uint64_t v14 = "SharedArrayInit: pthread_cond_init failed\n";
          __int16 v15 = 57;
        }
      }

      else
      {
        uint64_t v14 = "SharedArrayInit: malloc failed\n";
        __int16 v15 = 55;
      }

      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h",  (uint64_t)"SharedArrayInit",  v15,  0,  v14,  v11,  v12,  v13,  v26);
      char v19 = "SharedArrayInit";
      __int16 v20 = 104;
LABEL_12:
      int v16 = 0;
      goto LABEL_13;
    }

    int v16 = *__error();
    char v19 = "malloc";
    __int16 v20 = 103;
  }

  else
  {
    int v16 = *__error();
    char v19 = "malloc";
    __int16 v20 = 98;
  }

uint64_t threadPoolWorkerThreadProc(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = *(_DWORD *)(a1 + 8);
  if (pthread_mutex_lock((pthread_mutex_t *)(v2 + 48)))
  {
LABEL_2:
    uint64_t v7 = "SharedArrayPush: pthread_mutex_lock failed\n";
    __int16 v8 = 117;
  }

  else
  {
    uint64_t v13 = (unsigned int *)(v2 + 160);
    while (1)
    {
      uint64_t v14 = *(unsigned int *)(v2 + 32);
      unsigned int v15 = *(_DWORD *)(v2 + 36);
      int v16 = v14;
      if (v14 < v15)
      {
        *(_DWORD *)(*(void *)(v2 + 40) + 4 * v14) = v3;
        int v16 = *(_DWORD *)(v2 + 32);
      }

      *(_DWORD *)(v2 + 32) = v16 + 1;
      if (!v16)
      {
        if (pthread_cond_broadcast((pthread_cond_t *)(v2 + 112))) {
          break;
        }
      }

      if (pthread_mutex_unlock((pthread_mutex_t *)(v2 + 48)))
      {
        uint64_t v7 = "SharedArrayPush: pthread_mutex_unlock failed\n";
        __int16 v8 = 124;
        goto LABEL_3;
      }

      if (v14 >= v15)
      {
        uint64_t v7 = "SharedArrayPush: stack is full\n";
        __int16 v8 = 125;
        goto LABEL_3;
      }

      if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48))) {
        goto LABEL_23;
      }
      while (1)
      {
        int v17 = *(_DWORD *)(a1 + 40);
        if (v17 > 0) {
          break;
        }
        if (pthread_cond_wait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)(a1 + 48))) {
          goto LABEL_23;
        }
      }

      *(_DWORD *)(a1 + 40) = v17 - 1;
      if (pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48)))
      {
LABEL_23:
        uint64_t v11 = "SemAcquire";
        __int16 v12 = 59;
        goto LABEL_24;
      }

      uint64_t v18 = *(void *)(a1 + 160);
      if (v18 != -2)
      {
        if (v18 < 0) {
          return a1;
        }
        if (((*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24)) & 0x80000000) != 0)
        {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c",  (uint64_t)"threadPoolWorkerThreadProc",  72,  90,  0,  "worker proc reported an error",  v19,  v20,  v25);
          do
            unsigned int v21 = __ldxr(v13);
          while (__stxr(v21 + 1, v13));
        }
      }

      int v3 = *(_DWORD *)(a1 + 8);
      if (pthread_mutex_lock((pthread_mutex_t *)(v2 + 48))) {
        goto LABEL_2;
      }
    }

    uint64_t v7 = "SharedArrayPush: pthread_cond_broadcast failed\n";
    __int16 v8 = 122;
  }

LABEL_3:
  pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h",  (uint64_t)"SharedArrayPush",  v8,  0,  v7,  v4,  v5,  v6,  v25);
  uint64_t v11 = "SharedArrayPush";
  __int16 v12 = 56;
LABEL_24:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c",  (uint64_t)"threadPoolWorkerThreadProc",  v12,  90,  0,  v11,  v9,  v10,  v25);
  uint64_t v22 = (unsigned int *)(v2 + 160);
  do
    unsigned int v23 = __ldxr(v22);
  while (__stxr(v23 + 1, v22));
  return a1;
}

uint64_t ThreadPoolDestroy(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = (unsigned int *)result;
    uint64_t v2 = *(uint64_t **)(result + 8);
    if (v2)
    {
      uint64_t v3 = *(unsigned int *)result;
      if (!(_DWORD)v3)
      {
        int v7 = 1;
        goto LABEL_37;
      }

      int v4 = 0;
      do
      {
        uint64_t v5 = *v2;
        v2 += 21;
        if (v5) {
          ++v4;
        }
        --v3;
      }

      while (v3);
      if (v4)
      {
        int v6 = 0;
        int v7 = 1;
        while (1)
        {
          if (pthread_mutex_lock((pthread_mutex_t *)(v1 + 12)))
          {
            __int16 v11 = 91;
            __int16 v12 = "SharedArrayPop: pthread_mutex_lock failed\n";
LABEL_15:
            pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  v11,  0,  v12,  v8,  v9,  v10,  v35);
            unsigned int v16 = -1;
          }

          else
          {
            while (1)
            {
              unsigned int v13 = v1[8];
              if (v13) {
                break;
              }
              if (pthread_cond_wait((pthread_cond_t *)(v1 + 28), (pthread_mutex_t *)(v1 + 12)))
              {
                __int16 v11 = 94;
                __int16 v12 = "SharedArrayPop: pthread_cond_wait failed\n";
                goto LABEL_15;
              }
            }

            unsigned int v23 = v13 - 1;
            v1[8] = v23;
            unsigned int v16 = *(_DWORD *)(*((void *)v1 + 5) + 4LL * v23);
            if (!pthread_mutex_unlock((pthread_mutex_t *)(v1 + 12))) {
              goto LABEL_17;
            }
            pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  98,  0,  "SharedArrayPop: pthread_mutex_unlock failed\n",  v24,  v25,  v26,  v35);
          }

          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c",  (uint64_t)"ThreadPoolDestroy",  147,  90,  0,  "SharedArrayPop",  v14,  v15,  v36);
          int v7 = 0;
LABEL_17:
          uint64_t v17 = *((void *)v1 + 1);
          uint64_t v18 = v17 + 168LL * v16;
          *(void *)(v18 + 160) = -1LL;
          if (pthread_mutex_lock((pthread_mutex_t *)(v18 + 48))
            || (v21 = v17 + 168LL * v16, int v22 = *(_DWORD *)(v21 + 40), *(_DWORD *)(v21 + 40) = v22 + 1, !v22)
            && pthread_cond_broadcast((pthread_cond_t *)(v17 + 168LL * v16 + 112))
            || pthread_mutex_unlock((pthread_mutex_t *)(v18 + 48)))
          {
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c",  (uint64_t)"ThreadPoolDestroy",  155,  90,  0,  "SemRelease",  v19,  v20,  v35);
            int v7 = 0;
          }

          if ((joinThread(*(_opaque_pthread_t **)v18) & 0x80000000) != 0)
          {
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c",  (uint64_t)"ThreadPoolDestroy",  156,  90,  0,  "joinThread",  v27,  v28,  v35);
            int v7 = 0;
          }

          *(void *)uint64_t v18 = 0LL;
          if (++v6 == v4)
          {
            if (!*v1) {
              goto LABEL_37;
            }
            goto LABEL_33;
          }
        }
      }

      int v7 = 1;
LABEL_33:
      unint64_t v29 = 0LL;
      uint64_t v30 = 112LL;
      do
      {
        __int16 v31 = (pthread_cond_t *)(*((void *)v1 + 1) + v30);
        if (!pthread_mutex_destroy((pthread_mutex_t *)&v31[-2].__opaque[24])) {
          pthread_cond_destroy(v31);
        }
        ++v29;
        v30 += 168LL;
      }

      while (v29 < *v1);
LABEL_37:
      free(*((void **)v1 + 1));
      *((void *)v1 + 1) = 0LL;
    }

    else
    {
      int v7 = 1;
    }

    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 12)) && !pthread_cond_destroy((pthread_cond_t *)(v1 + 28))) {
      free(*((void **)v1 + 5));
    }
    int v34 = atomic_load(v1 + 40);
    if (v34 >= 1)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c",  (uint64_t)"ThreadPoolDestroy",  171,  90,  0,  "Threads reported errors",  v32,  v33,  v35);
      int v7 = 0;
    }

    free(v1);
    if (v7) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t ThreadPoolGetWorker( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16) != -1)
  {
    uint64_t v8 = "Missing call to RunWorker before GetWorker";
    __int16 v9 = 182;
LABEL_11:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c",  (uint64_t)"ThreadPoolGetWorker",  v9,  90,  0,  v8,  a7,  a8,  v21);
    return 0LL;
  }

  __int16 v11 = (pthread_mutex_t *)(a1 + 48);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48)))
  {
    uint64_t v15 = "SharedArrayPop: pthread_mutex_lock failed\n";
    __int16 v16 = 91;
LABEL_10:
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  v16,  0,  v15,  v12,  v13,  v14,  v21);
    uint64_t v8 = "SharedArrayPop failed";
    __int16 v9 = 186;
    goto LABEL_11;
  }

  while (1)
  {
    int v17 = *(_DWORD *)(a1 + 32);
    if (v17) {
      break;
    }
    if (pthread_cond_wait((pthread_cond_t *)(a1 + 112), v11))
    {
      uint64_t v15 = "SharedArrayPop: pthread_cond_wait failed\n";
      __int16 v16 = 94;
      goto LABEL_10;
    }
  }

  unsigned int v18 = v17 - 1;
  *(_DWORD *)(a1 + 32) = v18;
  unsigned int v19 = *(_DWORD *)(*(void *)(a1 + 40) + 4LL * v18);
  if (pthread_mutex_unlock(v11))
  {
    uint64_t v15 = "SharedArrayPop: pthread_mutex_unlock failed\n";
    __int16 v16 = 98;
    goto LABEL_10;
  }

  *(_DWORD *)(a1 + 16) = v19;
  return *(void *)(*(void *)(a1 + 8) + 168LL * v19 + 24);
}

uint64_t ThreadPoolRunWorker( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *(_DWORD *)(a1 + 16);
  if (v8 == -1)
  {
    __int16 v16 = "Missing call to GetWorker before RunWorker";
    __int16 v17 = 199;
LABEL_9:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/ThreadPool.c",  (uint64_t)"ThreadPoolRunWorker",  v17,  90,  0,  v16,  a7,  a8,  v18);
    return 0xFFFFFFFFLL;
  }

  *(_DWORD *)(a1 + 16) = -1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v10 + 1;
  uint64_t v11 = v9 + 168LL * v8;
  *(void *)(v11 + 160) = v10;
  uint64_t v12 = (pthread_mutex_t *)(v11 + 48);
  if (pthread_mutex_lock((pthread_mutex_t *)(v11 + 48))
    || (v13 = v9 + 168LL * v8, int v14 = *(_DWORD *)(v13 + 40), *(_DWORD *)(v13 + 40) = v14 + 1, !v14)
    && pthread_cond_broadcast((pthread_cond_t *)(v9 + 168LL * v8 + 112))
    || (uint64_t result = pthread_mutex_unlock(v12), (_DWORD)result))
  {
    __int16 v16 = "SemRelease failed";
    __int16 v17 = 211;
    goto LABEL_9;
  }

  return result;
}

uint64_t ThreadPoolSync(unsigned int *a1)
{
  uint64_t v1 = *a1;
  if (!(_DWORD)v1)
  {
    int v7 = 1;
    goto LABEL_30;
  }

  int v3 = 0;
  int v4 = (uint64_t *)*((void *)a1 + 1);
  do
  {
    uint64_t v5 = *v4;
    v4 += 21;
    if (v5) {
      ++v3;
    }
    --v1;
  }

  while (v1);
  if (v3)
  {
    int v6 = 0;
    int v7 = 1;
    while (1)
    {
      if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 12)))
      {
        __int16 v11 = 91;
        uint64_t v12 = "SharedArrayPop: pthread_mutex_lock failed\n";
      }

      else
      {
        while (1)
        {
          unsigned int v13 = a1[8];
          if (v13) {
            break;
          }
          if (pthread_cond_wait((pthread_cond_t *)(a1 + 28), (pthread_mutex_t *)(a1 + 12)))
          {
            __int16 v11 = 94;
            uint64_t v12 = "SharedArrayPop: pthread_cond_wait failed\n";
            goto LABEL_15;
          }
        }

        a1[8] = v13 - 1;
        if (!pthread_mutex_unlock((pthread_mutex_t *)(a1 + 12))) {
          goto LABEL_16;
        }
        __int16 v11 = 98;
        uint64_t v12 = "SharedArrayPop: pthread_mutex_unlock failed\n";
      }

AAByteStream AADecompressionRandomAccessInputStreamOpen( AAByteStream compressed_stream, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  __int128 v56 = 0uLL;
  int v7 = malloc(0x40uLL);
  uint64_t v8 = (uint64_t)v7;
  if (!v7)
  {
    int v22 = *__error();
    unsigned int v23 = "malloc";
    __int16 v24 = 106;
LABEL_18:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecompressionStream.c",  (uint64_t)"AADecompressionRandomAccessInputStreamOpen",  v24,  110,  v22,  v23,  v10,  v11,  v50);
    RandomAccessDecompressStreamDestroy(v8);
    return 0LL;
  }

  memset_s(v7, 0x40uLL, 0, 0x40uLL);
  *(void *)uint64_t v8 = compressed_stream;
  *(void *)(v8 + 8) = flags;
  off_t v9 = AAByteStreamSeek(compressed_stream, 0LL, 2);
  if (v9 < 0)
  {
    unsigned int v23 = "seek to end of stream";
    __int16 v24 = 112;
    goto LABEL_17;
  }

  uint64_t v12 = *(void *)v8;
  if (!*(void *)(*(void *)v8 + 32LL)) {
    goto LABEL_15;
  }
  unint64_t v13 = v9;
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v56;
  uint64_t v17 = 12LL;
  do
  {
    uint64_t v18 = (*(uint64_t (**)(void, __int128 *, uint64_t, uint64_t))(v12 + 32))(*(void *)v12, v16, v17, v15);
    if (v18 < 0) {
      goto LABEL_15;
    }
    if (!v18) {
      break;
    }
    uint64_t v16 = (__int128 *)((char *)v16 + v18);
    v14 += v18;
    v15 += v18;
    v17 -= v18;
  }

  while (v17);
  if (v14 != 12)
  {
LABEL_15:
    unsigned int v23 = "reading file header";
    __int16 v24 = 116;
LABEL_17:
    int v22 = 0;
    goto LABEL_18;
  }

  if (BYTE3(v56) <= 0x64u)
  {
    switch(BYTE3(v56))
    {
      case '-':
        int v19 = 0;
        uint64_t v20 = "none";
        uint64_t v21 = PCompressCopyDecode;
        goto LABEL_31;
      case '4':
        int v19 = 0;
        uint64_t v20 = "lz4";
        uint64_t v21 = PCompressLZ4Decode;
        goto LABEL_31;
      case 'b':
        int v19 = 0;
        uint64_t v20 = "lzbitmap";
        uint64_t v21 = PCompressLZBITMAPDecode;
        goto LABEL_31;
    }

uint64_t RandomAccessDecompressStreamDestroy(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 48);
    if (v2)
    {
      if (*(_DWORD *)(a1 + 40))
      {
        unint64_t v3 = 0LL;
        do
          free(*(void **)(*(void *)(a1 + 48) + 8 * v3++));
        while (v3 < *(unsigned int *)(a1 + 40));
        uint64_t v2 = *(void **)(a1 + 48);
      }

      free(v2);
    }

    free(*(void **)(a1 + 32));
    free((void *)a1);
  }

  return 0LL;
}

uint64_t RandomAccessDecompressStreamGetBlock( uint64_t *a1, unsigned int a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*((_DWORD *)a1 + 10) <= a2 || a1[3] <= a3)
  {
    uint64_t v21 = "Invalid worker/block id";
    __int16 v22 = 66;
LABEL_14:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AARandomAccessDecompressionStream.c",  (uint64_t)"RandomAccessDecompressStreamGetBlock",  v22,  110,  0,  v21,  a7,  a8,  v24);
    return 0xFFFFFFFFLL;
  }

  uint64_t v10 = a1[4];
  uint64_t v11 = v10 + 16 * a3;
  int v13 = *(_DWORD *)(v11 + 12);
  uint64_t v12 = (_DWORD *)(v11 + 12);
  uint64_t v14 = *(v12 - 1);
  if (v13 == (_DWORD)v14) {
    uint64_t v15 = a4;
  }
  else {
    uint64_t v15 = *(void *)(a1[6] + 8LL * a2);
  }
  uint64_t v16 = *a1;
  if (!*(void *)(*a1 + 32)) {
    goto LABEL_20;
  }
  uint64_t v17 = 0LL;
  if ((_DWORD)v14)
  {
    uint64_t v18 = *(void *)(v10 + 16 * a3);
    uint64_t v19 = v15;
    while (1)
    {
      uint64_t v20 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v16 + 32))(*(void *)v16, v19, v14, v18);
      if (v20 < 0) {
        break;
      }
      if (v20)
      {
        v19 += v20;
        v17 += v20;
        v18 += v20;
        v14 -= v20;
        if (v14) {
          continue;
        }
      }

      goto LABEL_16;
    }

    uint64_t v17 = v20;
LABEL_16:
    if (v17 != *(v12 - 1))
    {
LABEL_20:
      uint64_t v21 = "loading block";
      __int16 v22 = 74;
      goto LABEL_14;
    }
  }

  if (v15 != a4
    && ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))a1[2])(a4, *v12, v15, v17) != *v12)
  {
    uint64_t v21 = "decompressing block";
    __int16 v22 = 79;
    goto LABEL_14;
  }

  return 0LL;
}

void RandomAccessDecompressStreamAbort(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 56))
  {
    *(_DWORD *)(a1 + 56) = 1;
    AAByteStreamCancel(*(AAByteStream *)a1);
  }

void *aaAsyncByteStreamAlloc(uint64_t a1, uint64_t a2, int a3, float a4, float a5)
{
  uint64_t v10 = malloc(0x38uLL);
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v17 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c",  (uint64_t)"aaAsyncByteStreamAlloc",  191,  97,  *v17,  "malloc",  v18,  v19,  v21);
    return v11;
  }

  memset_s(v10, 0x38uLL, 0, 0x38uLL);
  *uint64_t v11 = a1;
  v11[1] = a2;
  if (a3)
  {
    uint64_t v12 = (float *)malloc(0x70uLL);
    int v13 = v12;
    if (!v12) {
      goto LABEL_14;
    }
    memset_s(v12, 0x70uLL, 0, 0x70uLL);
    if (a3 >= 1) {
      int v14 = a3;
    }
    else {
      int v14 = 5;
    }
    *((_DWORD *)v13 + 24) = v14;
    float v15 = 10.0;
    if (a4 > 0.0) {
      float v15 = a4;
    }
    float v16 = 5.0;
    if (a5 > 0.0) {
      float v16 = a5;
    }
    v13[25] = v15;
    v13[26] = v16;
    *((void *)v13 + 10) = -1LL;
    *((void *)v13 + 11) = -1LL;
    if ((pthread_mutex_init((pthread_mutex_t *)v13, 0LL) & 0x80000000) == 0) {
      goto LABEL_14;
    }
    free(v13);
  }

  int v13 = 0LL;
LABEL_14:
  v11[6] = v13;
  return v11;
}

uint64_t AAAsyncByteStreamGetRange(void *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = (uint64_t (*)(void))a1[2];
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v3(*a1);
  uint64_t v8 = v7;
  if ((v7 & 0x80000000) != 0) {
    return v8;
  }
  uint64_t v9 = a1[6];
  if (!(_DWORD)v7)
  {
    if (!v9) {
      return 0LL;
    }
    if (pthread_mutex_lock((pthread_mutex_t *)v9) < 0)
    {
      int v36 = *__error();
      uint64_t v39 = "mutex lock";
      __int16 v40 = 149;
    }

    else
    {
      double RealTime = getRealTime();
      uint64_t v26 = *(void *)(v9 + 80);
      if (v26 < 0)
      {
LABEL_20:
        uint64_t v8 = 0LL;
      }

      else
      {
        uint64_t v27 = *(void *)(v9 + 72);
        while (1)
        {
          uint64_t v28 = v27 + 40 * v26;
          double v30 = *(double *)(v28 + 24);
          uint64_t v29 = (double *)(v28 + 24);
          if (v30 < RealTime) {
            break;
          }
          uint64_t v26 = *(void *)(v27 + 40 * v26 + 32);
          if (v26 < 0) {
            goto LABEL_20;
          }
        }

        uint64_t v41 = v27 + 40 * v26;
        int v42 = *(_DWORD *)(v41 + 16);
        if (v42 <= 0)
        {
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c",  (uint64_t)"rangeDataGetRange",  159,  97,  0,  "Async stream range timed out (FAIL): %zu bytes at %llu",  v23,  v24,  *(void *)v41);
          uint64_t v8 = 0xFFFFFFFFLL;
        }

        else
        {
          unint64_t v43 = *(void *)v41;
          double *v29 = RealTime
          *(_DWORD *)(v41 + 16) = v42 - 1;
          *a2 = v43;
          *a3 = *(void *)(v27 + 40 * v26 + 8);
          pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c",  (uint64_t)"rangeDataGetRange",  170,  97,  "Async stream range timed out (retry): %zu bytes at %llu",  v22,  v23,  v24,  *(void *)v41);
          uint64_t v8 = 1LL;
        }
      }

      if ((pthread_mutex_unlock((pthread_mutex_t *)v9) & 0x80000000) == 0) {
        return v8;
      }
      int v36 = *__error();
      uint64_t v39 = "mutex unlock";
      __int16 v40 = 177;
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c",  (uint64_t)"rangeDataGetRange",  v40,  97,  v36,  v39,  v37,  v38,  v56);
    return 0xFFFFFFFFLL;
  }

  if (!v9) {
    return v8;
  }
  unint64_t v10 = *a2;
  uint64_t v11 = *a3;
  if (pthread_mutex_lock((pthread_mutex_t *)v9) < 0)
  {
    int v31 = *__error();
    uint64_t v34 = "mutex lock";
    __int16 v35 = 64;
LABEL_53:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c",  (uint64_t)"rangeDataInsert",  v35,  97,  v31,  v34,  v32,  v33,  v56);
    return v8;
  }

  uint64_t v15 = *(void *)(v9 + 80);
  if (!v10)
  {
    if ((v15 & 0x8000000000000000LL) == 0) {
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c",  (uint64_t)"rangeDataInsert",  68,  97,  "Async stream returning EOF, but we still have ranges in flight",  v12,  v13,  v14,  v56);
    }
    goto LABEL_51;
  }

  if (v15 < 0)
  {
LABEL_12:
    unint64_t v18 = *(void *)(v9 + 88);
    if ((v18 & 0x8000000000000000LL) == 0)
    {
LABEL_13:
      uint64_t v19 = *(void *)(v9 + 72) + 40 * v18;
      uint64_t v20 = *(void *)(v19 + 32);
      *(void *)(v19 + 32) = v15;
      *(void *)(v9 + 80) = v18;
      *(void *)(v9 + 88) = v20;
      *(void *)uint64_t v19 = v10;
      *(void *)(v19 + 8) = v11;
      *(_DWORD *)(v19 + 16) = *(_DWORD *)(v9 + 96) - 1;
      double v21 = *(float *)(v9 + 100) + (double)v10 * 0.000000953674316 * *(float *)(v9 + 104);
      *(double *)(v19 + 24) = getRealTime() + v21;
      goto LABEL_51;
    }

    uint64_t v44 = *(void *)(v9 + 64);
    if (v44) {
      unint64_t v45 = 2 * v44;
    }
    else {
      unint64_t v45 = 32LL;
    }
    if (40 * v45 < 0x2000000001LL)
    {
      unint64_t v46 = *(void **)(v9 + 72);
      unint64_t v47 = (char *)realloc(v46, 40 * v45);
      if (v47)
      {
        size_t v48 = v47;
        *(void *)(v9 + 72) = v47;
        unint64_t v18 = *(void *)(v9 + 64);
        if (v18 < v45)
        {
          uint64_t v49 = 40 * v18;
          uint64_t v50 = v18 + 1;
LABEL_36:
          memset_s(&v48[v49], 0x28uLL, 0, 0x28uLL);
          while (1)
          {
            uint64_t v51 = v45 == v50 ? -1LL : v50;
            *(void *)&v48[v49 + 32] = v51;
            if (v45 == v50) {
              break;
            }
            size_t v48 = *(char **)(v9 + 72);
            v49 += 40LL;
            ++v50;
            if (v48) {
              goto LABEL_36;
            }
          }

          unint64_t v18 = *(void *)(v9 + 64);
        }

        *(void *)(v9 + 64) = v45;
        uint64_t v15 = *(void *)(v9 + 80);
        goto LABEL_13;
      }

      free(v46);
    }

    else
    {
      *__error() = 12;
    }

    *(void *)(v9 + 72) = 0LL;
    unint64_t v53 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c",  (uint64_t)"rangeDataInsert",  84,  97,  *v53,  "malloc",  v54,  v55,  v56);
    *(void *)(v9 + 64) = 0LL;
    *(void *)(v9 + 80) = -1LL;
    *(void *)(v9 + 88) = -1LL;
    goto LABEL_51;
  }

  uint64_t v16 = *(void *)(v9 + 72);
  uint64_t v17 = *(void *)(v9 + 80);
  while (*(void *)(v16 + 40 * v17 + 8) != v11 || *(void *)(v16 + 40 * v17) != v10)
  {
    uint64_t v17 = *(void *)(v16 + 40 * v17 + 32);
    if (v17 < 0) {
      goto LABEL_12;
    }
  }

uint64_t AAAsyncByteStreamProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      if (pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48)) < 0)
      {
        int v18 = *__error();
        double v21 = "mutex lock";
        __int16 v22 = 116;
      }

      else
      {
        uint64_t v12 = (void *)(v8 + 80);
        uint64_t v13 = *(void *)(v8 + 80);
        if (v13 < 0)
        {
LABEL_10:
          pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c",  (uint64_t)"rangeDataRemove",  128,  97,  "Async stream receiving an unknown segment",  v9,  v10,  v11,  v25);
        }

        else
        {
          uint64_t v14 = *(void *)(v8 + 72);
          uint64_t v15 = -1LL;
          while (1)
          {
            uint64_t v16 = v13;
            if (*(void *)(v14 + 40 * v13 + 8) == a4 && *(void *)(v14 + 40 * v13) == a3) {
              break;
            }
            uint64_t v13 = *(void *)(v14 + 40 * v13 + 32);
            uint64_t v15 = v16;
            if (v13 < 0) {
              goto LABEL_10;
            }
          }

          uint64_t v23 = v14 + 40 * v13;
          uint64_t v24 = v14 + 40 * v15 + 32;
          if (v15 >= 0) {
            uint64_t v12 = (void *)v24;
          }
          *uint64_t v12 = *(void *)(v23 + 32);
          *(void *)(v23 + 32) = *(void *)(v8 + 88);
          *(void *)(v8 + 88) = v16;
        }

        if ((pthread_mutex_unlock((pthread_mutex_t *)v8) & 0x80000000) == 0) {
          return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 24))(*(void *)a1, a2, a3, a4);
        }
        int v18 = *__error();
        double v21 = "mutex unlock";
        __int16 v22 = 140;
      }

      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAAsyncByteStream.c",  (uint64_t)"rangeDataRemove",  v22,  97,  v18,  v21,  v19,  v20,  v25);
    }
  }

  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 24))(*(void *)a1, a2, a3, a4);
}

void *AAAsyncByteStreamCancel(void *result)
{
  uint64_t v1 = (uint64_t (*)(void))result[4];
  if (v1) {
    return (void *)v1(*result);
  }
  return result;
}

uint64_t AAAsyncByteStreamClose(uint64_t (**a1)(void))
{
  if (!a1) {
    return 0LL;
  }
  if (*a1)
  {
    uint64_t v2 = a1[1]();
    *a1 = 0LL;
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  unint64_t v3 = a1[6];
  if (v3)
  {
    free(*((void **)v3 + 9));
    pthread_mutex_destroy((pthread_mutex_t *)v3);
    free(v3);
  }

  free(a1);
  return v2;
}

uint64_t aaAsyncByteStreamIsCancelled(void *a1)
{
  uint64_t v1 = (uint64_t (*)(void))a1[5];
  if (v1) {
    return v1(*a1);
  }
  else {
    return 0LL;
  }
}

uint64_t graisClose(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (unsigned int *)result;
    int v2 = *(_DWORD *)(result + 576);
    BOOL v3 = v2 == 0;
    if (*(void *)(result + 136))
    {
      sendMessage_0(result, -1, -1);
      joinThread(*((_opaque_pthread_t **)v1 + 17));
    }

    int v4 = (uint64_t *)*((void *)v1 + 12);
    if (v4)
    {
      uint64_t v5 = v1[22];
      if ((_DWORD)v5)
      {
        int v6 = 0;
        do
        {
          int v7 = v6;
          uint64_t v9 = *v4;
          v4 += 20;
          uint64_t v8 = v9;
          if (v9) {
            ++v6;
          }
          --v5;
        }

        while (v5);
        if (v6)
        {
          if (v8) {
            int v10 = v7 + 1;
          }
          else {
            int v10 = v7;
          }
          do
          {
            unsigned int v11 = v1[37];
            if (!v11) {
              break;
            }
            unsigned int v12 = v1[39];
            if (!v12) {
              unsigned int v12 = v1[36];
            }
            unsigned int v13 = v12 - 1;
            unsigned int v14 = *(_DWORD *)(*((void *)v1 + 20) + 4LL * v13);
            v1[39] = v13;
            v1[37] = v11 - 1;
            if (v14 >= v1[22]) {
              break;
            }
            uint64_t v15 = *((void *)v1 + 12);
            uint64_t v16 = v15 + 160LL * v14;
            *(void *)(v16 + 144) = -1LL;
            if (!pthread_mutex_lock((pthread_mutex_t *)(v16 + 24)))
            {
              uint64_t v17 = v15 + 160LL * v14;
              int v18 = *(_DWORD *)(v17 + 16);
              *(_DWORD *)(v17 + 16) = v18 + 1;
              if (v18 || !pthread_cond_broadcast((pthread_cond_t *)(v15 + 160LL * v14 + 88))) {
                pthread_mutex_unlock((pthread_mutex_t *)(v16 + 24));
              }
            }

            joinThread(*(_opaque_pthread_t **)v16);
            *(void *)uint64_t v16 = 0LL;
            --v10;
          }

          while (v10);
        }
      }
    }

    uint64_t v19 = (int (*)(void))*((void *)v1 + 4);
    if (v19) {
      BOOL v3 = v19(*((void *)v1 + 1)) >= 0 && v2 == 0;
    }
    double v21 = (void *)*((void *)v1 + 14);
    if (v21)
    {
      if (v1[26])
      {
        unint64_t v22 = 0LL;
        uint64_t v23 = 16LL;
        do
        {
          free(*(void **)(*((void *)v1 + 14) + v23));
          ++v22;
          v23 += 32LL;
        }

        while (v22 < v1[26]);
        double v21 = (void *)*((void *)v1 + 14);
      }

      free(v21);
    }

    free(*((void **)v1 + 10));
    uint64_t v24 = (void *)*((void *)v1 + 16);
    if (v24)
    {
      if (v1[30])
      {
        unint64_t v25 = 0LL;
        uint64_t v26 = 88LL;
        do
        {
          uint64_t v27 = (pthread_cond_t *)(*((void *)v1 + 16) + v26);
          if (!pthread_mutex_destroy((pthread_mutex_t *)&v27[-2].__opaque[24])) {
            pthread_cond_destroy(v27);
          }
          ++v25;
          v26 += 136LL;
        }

        while (v25 < v1[30]);
        uint64_t v24 = (void *)*((void *)v1 + 16);
      }

      free(v24);
    }

    free(*((void **)v1 + 23));
    *((void *)v1 + 21) = 0LL;
    *((void *)v1 + 22) = 0LL;
    *((void *)v1 + 23) = 0LL;
    uint64_t v28 = (void *)*((void *)v1 + 12);
    if (v28)
    {
      if (v1[22])
      {
        unint64_t v29 = 0LL;
        uint64_t v30 = 88LL;
        do
        {
          int v31 = (pthread_cond_t *)(*((void *)v1 + 12) + v30);
          if (!pthread_mutex_destroy((pthread_mutex_t *)&v31[-2].__opaque[24])) {
            pthread_cond_destroy(v31);
          }
          ++v29;
          v30 += 160LL;
        }

        while (v29 < v1[22]);
        uint64_t v28 = (void *)*((void *)v1 + 12);
      }

      free(v28);
    }

    free(*((void **)v1 + 20));
    *((void *)v1 + 18) = 0LL;
    *((void *)v1 + 19) = 0LL;
    *((void *)v1 + 20) = 0LL;
    free(*((void **)v1 + 8));
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 52)) && !pthread_cond_destroy((pthread_cond_t *)(v1 + 68))) {
      free(*((void **)v1 + 25));
    }
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 84)) && !pthread_cond_destroy((pthread_cond_t *)(v1 + 100))) {
      free(*((void **)v1 + 41));
    }
    if (!pthread_mutex_destroy((pthread_mutex_t *)(v1 + 116)) && !pthread_cond_destroy((pthread_cond_t *)v1 + 11)) {
      free(*((void **)v1 + 57));
    }
    if ((*(void *)v1 & 0x8000000000000000LL) != 0)
    {
      uint64_t v32 = (FILE **)MEMORY[0x1895F89D0];
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%12llu blocks\n", *((void *)v1 + 7));
      fprintf(*v32, "%12u blocks in cache\n", v1[26]);
      uint64_t v33 = *v32;
      unint64_t v34 = atomic_load((unint64_t *)v1 + 75);
      fprintf(v33, "%12llu blocks computed\n", v34);
      __int16 v35 = *v32;
      unint64_t v36 = atomic_load((unint64_t *)v1 + 76);
      fprintf(v35, "%12llu requests processed\n", v36);
    }

    free(v1);
    return (v3 - 1);
  }

  return result;
}

void *AAGenericRandomAccessInputStreamOpen( uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = calloc(1uLL, 0x68uLL);
  int v18 = malloc(0x268uLL);
  uint64_t v19 = (uint64_t)v18;
  if (v18)
  {
    memset_s(v18, 0x268uLL, 0, 0x268uLL);
    if (v17)
    {
      if (a4 < a3)
      {
        unint64_t v22 = "Cache size must be >= n_workers";
        __int16 v23 = 653;
        goto LABEL_23;
      }

      *(void *)(v19 + 16) = a6;
      *(void *)(v19 + 24) = a7;
      *(void *)uint64_t v19 = a9;
      *(void *)(v19 + 8) = a5;
      *(_DWORD *)(v19 + 48) = a2;
      *(void *)(v19 + 32) = a8;
      *(void *)(v19 + 40) = a1;
      *(void *)(v19 + 56) = (a1 + (unint64_t)a2 - 1) / a2;
      *(_DWORD *)(v19 + 104) = a4;
      *(_DWORD *)(v19 + 88) = a3;
      *(_DWORD *)(v19 + 120) = 2 * a3;
      unsigned int v25 = 3 * a3 + 1;
      *(_DWORD *)(v19 + 72) = v25;
      if (a9 < 0)
      {
        uint64_t v26 = (FILE **)MEMORY[0x1895F89D0];
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%12llu blocks in file\n", (a1 + (unint64_t)a2 - 1) / a2);
        fprintf(*v26, "%12u blocks in cache\n", *(_DWORD *)(v19 + 104));
        fprintf(*v26, "%12u workers\n", *(_DWORD *)(v19 + 88));
        fprintf(*v26, "%12u requests\n", *(_DWORD *)(v19 + 120));
        fprintf(*v26, "%12u messages\n", *(_DWORD *)(v19 + 72));
        unsigned int v25 = *(_DWORD *)(v19 + 72);
      }

      *(_DWORD *)(v19 + 192) = 0;
      *(_DWORD *)(v19 + 196) = v25;
      uint64_t v27 = calloc(v25, 4uLL);
      *(void *)(v19 + 200) = v27;
      if (v27)
      {
        if (pthread_mutex_init((pthread_mutex_t *)(v19 + 208), 0LL))
        {
LABEL_10:
          int v31 = "SharedArrayInit: pthread_mutex_init failed\n";
          __int16 v32 = 56;
LABEL_22:
          pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayInit",  v32,  0,  v31,  v28,  v29,  v30,  v65);
          unint64_t v22 = "SharedArrayInit";
          __int16 v23 = 684;
          goto LABEL_23;
        }

        if (pthread_cond_init((pthread_cond_t *)(v19 + 272), 0LL))
        {
LABEL_12:
          int v31 = "SharedArrayInit: pthread_cond_init failed\n";
          __int16 v32 = 57;
          goto LABEL_22;
        }

        size_t v33 = *(unsigned int *)(v19 + 72);
        *(_DWORD *)(v19 + 320) = 0;
        *(_DWORD *)(v19 + 324) = v33;
        unint64_t v34 = calloc(v33, 4uLL);
        *(void *)(v19 + 328) = v34;
        if (v34)
        {
          if (pthread_mutex_init((pthread_mutex_t *)(v19 + 336), 0LL)) {
            goto LABEL_10;
          }
          if (pthread_cond_init((pthread_cond_t *)(v19 + 400), 0LL)) {
            goto LABEL_12;
          }
          size_t v35 = *(unsigned int *)(v19 + 120);
          *(_DWORD *)(v19 + 448) = 0;
          *(_DWORD *)(v19 + 452) = v35;
          unint64_t v36 = calloc(v35, 4uLL);
          *(void *)(v19 + 456) = v36;
          if (v36)
          {
            if (pthread_mutex_init((pthread_mutex_t *)(v19 + 464), 0LL)) {
              goto LABEL_10;
            }
            if (!pthread_cond_init((pthread_cond_t *)(v19 + 528), 0LL))
            {
              size_t v37 = *(void *)(v19 + 56);
              if (v37 < 0x800000001LL)
              {
                uint64_t v39 = calloc(v37, 4uLL);
                *(void *)(v19 + 64) = v39;
                if (v39)
                {
                  uint64_t v40 = *(void *)(v19 + 56);
                  if (v40) {
                    memset(v39, 255, 4 * v40);
                  }
                  uint64_t v41 = (char *)calloc(*(unsigned int *)(v19 + 104), 0x20uLL);
                  *(void *)(v19 + 112) = v41;
                  if (!v41)
                  {
                    int v24 = *__error();
                    unint64_t v22 = "malloc";
                    __int16 v23 = 693;
                    goto LABEL_24;
                  }

                  unint64_t v42 = *(unsigned int *)(v19 + 104);
                  if ((_DWORD)v42)
                  {
                    unint64_t v43 = 0LL;
                    size_t v44 = *(unsigned int *)(v19 + 48);
                    unint64_t v45 = (unsigned int *)(v41 + 16);
                    while (1)
                    {
                      *((void *)v45 - 1) = -1LL;
                      atomic_store(0, v45 - 4);
                      unint64_t v46 = malloc(v44);
                      *(void *)unint64_t v45 = v46;
                      if (!v46) {
                        break;
                      }
                      ++v43;
                      v45 += 8;
                      if (v43 >= v42) {
                        goto LABEL_34;
                      }
                    }

                    int v24 = *__error();
                    unint64_t v22 = "malloc";
                    __int16 v23 = 700;
                    goto LABEL_24;
                  }

uint64_t SharedArrayPush_0(unsigned int *a1, int a2)
{
  int v4 = (pthread_mutex_t *)(a1 + 4);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 4)))
  {
    uint64_t v8 = "SharedArrayPush: pthread_mutex_lock failed\n";
    __int16 v9 = 117;
  }

  else
  {
    uint64_t v10 = *a1;
    unsigned int v11 = a1[1];
    int v12 = v10;
    if (v10 < v11)
    {
      *(_DWORD *)(*((void *)a1 + 1) + 4 * v10) = a2;
      int v12 = *a1;
    }

    *a1 = v12 + 1;
    if (v12 || !pthread_cond_broadcast((pthread_cond_t *)(a1 + 20)))
    {
      if (pthread_mutex_unlock(v4))
      {
        uint64_t v8 = "SharedArrayPush: pthread_mutex_unlock failed\n";
        __int16 v9 = 124;
      }

      else
      {
        uint64_t v8 = "SharedArrayPush: stack is full\n";
        __int16 v9 = 125;
      }
    }

    else
    {
      uint64_t v8 = "SharedArrayPush: pthread_cond_broadcast failed\n";
      __int16 v9 = 122;
    }
  }

  pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayPush",  v9,  0,  v8,  v5,  v6,  v7,  v14);
  return 0xFFFFFFFFLL;
}

uint64_t workerProc_4(uint64_t a1)
{
  int v2 = (pthread_mutex_t *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = (pthread_cond_t *)(a1 + 88);
  int v5 = 1;
  while (1)
  {
    if (pthread_mutex_lock(v2)) {
      goto LABEL_7;
    }
    while (1)
    {
      int v8 = *(_DWORD *)(a1 + 16);
      if (v8 > 0) {
        break;
      }
      if (pthread_cond_wait(v4, v2)) {
        goto LABEL_7;
      }
    }

    *(_DWORD *)(a1 + 16) = v8 - 1;
    if (pthread_mutex_unlock(v2))
    {
LABEL_7:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"workerProc",  365,  33,  0,  "SemAcquire",  v6,  v7,  v15);
      int v5 = 0;
    }

    uint64_t v9 = *(void *)(a1 + 144);
    if (v9 == -1) {
      return a1;
    }
    if (((*(uint64_t (**)(void, void, uint64_t, void))(v3 + 16))( *(void *)(v3 + 8),  *(unsigned int *)(a1 + 136),  v9,  *(void *)(*(void *)(v3 + 112) + 32LL * *(unsigned int *)(a1 + 152) + 16)) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"workerProc",  374,  33,  0,  "get block data",  v10,  v11,  v15);
      int v5 = 0;
    }

    *(_DWORD *)(a1 + 156) = v5;
    if ((sendMessage_0(v3, -1, *(_DWORD *)(a1 + 136)) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"workerProc",  381,  33,  0,  "send worker message",  v12,  v13,  v15);
      int v5 = 0;
    }
  }

uint64_t streamProc_0(uint64_t a1)
{
  int v2 = 0;
  uint64_t v3 = (pthread_mutex_t *)(a1 + 336);
  int v4 = (pthread_cond_t *)(a1 + 400);
  uint64_t v110 = (unint64_t *)(a1 + 600);
  size_t v111 = (unsigned int *)(a1 + 192);
  int v5 = (unint64_t *)(a1 + 592);
  uint64_t v107 = (unint64_t *)(a1 + 608);
  while (1)
  {
    int v113 = v2;
    while (pthread_mutex_lock(v3))
    {
      __int16 v9 = 91;
      uint64_t v10 = "SharedArrayPop: pthread_mutex_lock failed\n";
LABEL_8:
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  v9,  0,  v10,  v6,  v7,  v8,  (char)v107);
LABEL_9:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"streamProc",  186,  33,  0,  "SharedArrayPop",  v12,  v13,  v108);
      *(_DWORD *)(a1 + 576) = 1;
    }

    while (1)
    {
      int v11 = *(_DWORD *)(a1 + 320);
      if (v11) {
        break;
      }
      if (pthread_cond_wait(v4, v3))
      {
        __int16 v9 = 94;
        uint64_t v10 = "SharedArrayPop: pthread_cond_wait failed\n";
        goto LABEL_8;
      }
    }

    unsigned int v14 = v11 - 1;
    *(_DWORD *)(a1 + 320) = v14;
    uint64_t v15 = *(unsigned int *)(*(void *)(a1 + 328) + 4LL * v14);
    if (pthread_mutex_unlock(v3))
    {
      pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  98,  0,  "SharedArrayPop: pthread_mutex_unlock failed\n",  v16,  v17,  v18,  (char)v107);
      goto LABEL_9;
    }

    uint64_t v19 = (int *)(*(void *)(a1 + 80) + 8 * v15);
    int v21 = *v19;
    unsigned int v20 = v19[1];
    if ((SharedArrayPush_0(v111, v15) & 0x80000000) != 0)
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"streamProc",  192,  33,  0,  "SharedArrayPush",  v22,  v23,  (char)v107);
      *(_DWORD *)(a1 + 576) = 1;
    }

    int v24 = v21;
    int v25 = v113;
    if ((v20 & v21) == 0xFFFFFFFF) {
      int v25 = 1;
    }
    int v114 = v25;
    uint64_t v26 = v107;
    if (v20 != -1)
    {
      do
        unint64_t v27 = __ldxr(v110);
      while (__stxr(v27 + 1, v110));
      uint64_t v28 = *(void *)(a1 + 96);
      uint64_t v29 = v28 + 160LL * v20;
      uint64_t v31 = *(unsigned int *)(v29 + 152);
      int v32 = *(_DWORD *)(v29 + 156);
      uint64_t v30 = (int *)(v29 + 152);
      uint64_t v33 = *(void *)(a1 + 112);
      if (v32)
      {
        unint64_t v34 = (unsigned int *)(v33 + 32 * v31);
        do
          unsigned int v35 = __ldaxr(v34);
        while (__stlxr(v35 + 1, v34));
        unint64_t v36 = (unsigned int *)(v33 + 32 * v31 + 4);
        do
          unsigned int v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        do
          unint64_t v38 = __ldaxr(v5);
        while (__stlxr(v38 + 1, v5));
        *(void *)(v33 + 32 * v31 + 24) = v38;
        int v39 = *v30;
      }

      else
      {
        uint64_t v40 = (unsigned int *)(v33 + 32 * v31 + 4);
        do
          unsigned int v41 = __ldaxr(v40);
        while (__stlxr(v41 - 1, v40));
        do
          unint64_t v42 = __ldaxr(v5);
        while (__stlxr(v42 + 1, v5));
        uint64_t v43 = v33 + 32 * v31;
        *(void *)(v43 + 24) = v42;
        *(void *)(v43 + 8) = -1LL;
        int v39 = -3;
      }

      uint64_t v44 = v28 + 160LL * v20;
      *(_DWORD *)(*(void *)(a1 + 64) + 4LL * *(void *)(v44 + 144)) = v39;
      *(void *)(v44 + 144) = -1LL;
      *uint64_t v30 = -1;
      if (*(_DWORD *)(a1 + 148) >= *(_DWORD *)(a1 + 144))
      {
        int v48 = v24;
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"streamProc",  242,  33,  0,  "LocalArrayPush",  v22,  v23,  (char)v107);
        int v24 = v48;
        *(_DWORD *)(a1 + 576) = 1;
      }

      else
      {
        uint64_t v45 = *(unsigned int *)(a1 + 156);
        *(_DWORD *)(*(void *)(a1 + 160) + 4 * v45) = v20;
        int v46 = *(_DWORD *)(a1 + 148);
        if ((_DWORD)v45 + 1 == *(_DWORD *)(a1 + 144)) {
          int v47 = 0;
        }
        else {
          int v47 = v45 + 1;
        }
        *(_DWORD *)(a1 + 156) = v47;
        *(_DWORD *)(a1 + 148) = v46 + 1;
      }
    }

    unsigned int v49 = *(_DWORD *)(a1 + 172);
    if (v24 == -1)
    {
      if (!v49) {
        goto LABEL_115;
      }
    }

    else
    {
      do
        unint64_t v50 = __ldxr(v26);
      while (__stxr(v50 + 1, v26));
      unsigned int v51 = *(_DWORD *)(a1 + 168);
      if (v49 >= v51)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"streamProc",  254,  33,  0,  "LocalArrayEnqueue",  v22,  v23,  (char)v107);
        *(_DWORD *)(a1 + 576) = 1;
        unsigned int v49 = *(_DWORD *)(a1 + 172);
        if (!v49) {
          goto LABEL_115;
        }
      }

      else
      {
        if (*(_DWORD *)(a1 + 176)) {
          unsigned int v51 = *(_DWORD *)(a1 + 176);
        }
        unsigned int v52 = v51 - 1;
        *(_DWORD *)(*(void *)(a1 + 184) + 4LL * v52) = v24;
        int v53 = *(_DWORD *)(a1 + 172);
        unsigned int v49 = v53 + 1;
        *(_DWORD *)(a1 + 172) = v53 + 1;
        *(_DWORD *)(a1 + 176) = v52;
        if (v53 == -1) {
          goto LABEL_115;
        }
      }
    }

    int v54 = 0;
    unsigned int v112 = v49;
    while (2)
    {
      int v55 = *(_DWORD *)(a1 + 172);
      if (v55)
      {
        int v56 = *(_DWORD *)(a1 + 180);
        if (!v56) {
          int v56 = *(_DWORD *)(a1 + 168);
        }
        unsigned int v57 = v56 - 1;
        unsigned int v58 = *(_DWORD *)(*(void *)(a1 + 184) + 4LL * v57);
        *(_DWORD *)(a1 + 180) = v57;
        *(_DWORD *)(a1 + 172) = v55 - 1;
      }

      else
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"streamProc",  262,  33,  0,  "LocalArrayDequeue",  v22,  v23,  (char)v107);
        *(_DWORD *)(a1 + 576) = 1;
        unsigned int v58 = -1;
      }

      uint64_t v59 = *(void *)(a1 + 128);
      if (v114)
      {
        uint64_t v60 = v59 + 136LL * v58;
        *(_DWORD *)(v60 + 8) = -1;
        uint64_t v61 = (pthread_mutex_t *)(v60 + 24);
        if (!pthread_mutex_lock((pthread_mutex_t *)(v60 + 24)))
        {
          uint64_t v62 = v59 + 136LL * v58;
          int v63 = *(_DWORD *)(v62 + 16);
          *(_DWORD *)(v62 + 16) = v63 + 1;
          if ((v63 || !pthread_cond_broadcast((pthread_cond_t *)(v59 + 136LL * v58 + 88)))
            && !pthread_mutex_unlock(v61))
          {
            goto LABEL_99;
          }
        }

        __int16 v78 = 272;
        goto LABEL_97;
      }

      int v64 = (uint64_t *)(v59 + 136LL * v58);
      uint64_t v65 = *(unsigned int *)(*(void *)(a1 + 64) + 4 * *v64);
      if (v65 < *(_DWORD *)(a1 + 104))
      {
        *(_DWORD *)(v59 + 136LL * v58 + 8) = v65;
        uint64_t v66 = *(void *)(a1 + 112);
        unint64_t v67 = (unsigned int *)(v66 + 32 * v65);
        do
          unsigned int v68 = __ldaxr(v67);
        while (__stlxr(v68 + 1, v67));
        do
          unint64_t v69 = __ldaxr(v5);
        while (__stlxr(v69 + 1, v5));
        *(void *)(v66 + 32 * v65 + 24) = v69;
        if (!pthread_mutex_lock((pthread_mutex_t *)(v59 + 136LL * v58 + 24)))
        {
          uint64_t v70 = v59 + 136LL * v58;
          int v71 = *(_DWORD *)(v70 + 16);
          *(_DWORD *)(v70 + 16) = v71 + 1;
          if ((v71 || !pthread_cond_broadcast((pthread_cond_t *)(v59 + 136LL * v58 + 88)))
            && !pthread_mutex_unlock((pthread_mutex_t *)(v59 + 136LL * v58 + 24)))
          {
            goto LABEL_99;
          }
        }

        __int16 v78 = 292;
        goto LABEL_97;
      }

      if ((_DWORD)v65 == -3)
      {
        uint64_t v72 = v59 + 136LL * v58;
        *(_DWORD *)(v72 + 8) = -1;
        uint64_t v73 = (pthread_mutex_t *)(v72 + 24);
        if (!pthread_mutex_lock((pthread_mutex_t *)(v72 + 24)))
        {
          uint64_t v74 = v59 + 136LL * v58;
          int v75 = *(_DWORD *)(v74 + 16);
          *(_DWORD *)(v74 + 16) = v75 + 1;
          if ((v75 || !pthread_cond_broadcast((pthread_cond_t *)(v59 + 136LL * v58 + 88)))
            && !pthread_mutex_unlock(v73))
          {
            goto LABEL_99;
          }
        }

        __int16 v78 = 303;
LABEL_97:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"streamProc",  v78,  33,  0,  "SemRelease",  v22,  v23,  (char)v107);
        goto LABEL_98;
      }

      unsigned int v76 = *(_DWORD *)(a1 + 168);
      if (*(_DWORD *)(a1 + 172) >= v76)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"streamProc",  308,  33,  0,  "LocalArrayEnqueue",  v22,  v23,  (char)v107);
        *(_DWORD *)(a1 + 576) = 1;
      }

      else
      {
        if (*(_DWORD *)(a1 + 176)) {
          unsigned int v76 = *(_DWORD *)(a1 + 176);
        }
        unsigned int v77 = v76 - 1;
        *(_DWORD *)(*(void *)(a1 + 184) + 4LL * v77) = v58;
        ++*(_DWORD *)(a1 + 172);
        *(_DWORD *)(a1 + 176) = v77;
      }

      if ((_DWORD)v65 != -1 || !*(_DWORD *)(a1 + 148)) {
        goto LABEL_99;
      }
      uint64_t v79 = *v64;
      if (*(void *)(a1 + 56) <= (unint64_t)*v64)
      {
        __int16 v90 = 149;
        unint64_t v91 = "Invalid block_id, or no workers available";
        goto LABEL_112;
      }

      while (!*(_DWORD *)(a1 + 104))
      {
        unsigned int v83 = -1;
LABEL_88:
        uint64_t v87 = *(void *)(a1 + 112);
        unint64_t v81 = v83;
        char v88 = (unsigned int *)(v87 + 32LL * v83);
        while (1)
        {
          unsigned int v89 = __ldaxr(v88);
          if (v89 != 1) {
            break;
          }
          if (!__stlxr(0, v88))
          {
            uint64_t v92 = v87 + 32LL * v83;
            *(_DWORD *)(*(void *)(a1 + 64) + 4LL * *(void *)(v92 + 8)) = -1;
            *(void *)(v92 + 8) = -1LL;
            uint64_t v93 = (unsigned int *)(v92 + 4);
            goto LABEL_103;
          }
        }

        __clrex();
      }

      uint64_t v80 = 0LL;
      unint64_t v81 = 0LL;
      unint64_t v82 = -1LL;
      unsigned int v83 = -1;
      while (2)
      {
        uint64_t v84 = *(void *)(a1 + 112);
        if (atomic_load((unsigned int *)(v84 + v80 + 4)))
        {
LABEL_85:
          ++v81;
          v80 += 32LL;
          continue;
        }

        break;
      }

      if (*(void *)(v84 + v80 + 8) != -1LL)
      {
        unint64_t v86 = *(void *)(v84 + v80 + 24);
        if (v86 < v82)
        {
          unint64_t v82 = v86;
          unsigned int v83 = v81;
        }

        goto LABEL_85;
      }

      uint64_t v93 = (unsigned int *)(v84 + v80 + 4);
      unsigned int v83 = v81;
      do
LABEL_103:
        unsigned int v94 = __ldaxr(v93);
      while (__stlxr(v94 + 1, v93));
      *(void *)(*(void *)(a1 + 112) + 32 * v81 + 8) = v79;
      int v95 = *(_DWORD *)(a1 + 148);
      if (!v95)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"runWorker",  159,  33,  0,  "LocalArrayPop",  v22,  v23,  (char)v107);
        goto LABEL_113;
      }

      int v96 = *(_DWORD *)(a1 + 156);
      if (!v96) {
        int v96 = *(_DWORD *)(a1 + 144);
      }
      unsigned int v97 = v96 - 1;
      unsigned int v98 = *(_DWORD *)(*(void *)(a1 + 160) + 4LL * v97);
      *(_DWORD *)(a1 + 156) = v97;
      *(_DWORD *)(a1 + 148) = v95 - 1;
      uint64_t v99 = *(void *)(a1 + 96);
      uint64_t v100 = v99 + 160LL * v98;
      *(void *)(v100 + 144) = v79;
      *(_DWORD *)(v100 + 152) = v83;
      *(_DWORD *)(*(void *)(a1 + 64) + 4 * v79) = -2;
      unint64_t v101 = (pthread_mutex_t *)(v100 + 24);
      if (pthread_mutex_lock((pthread_mutex_t *)(v100 + 24))
        || (uint64_t v102 = v99 + 160LL * v98, v103 = *(_DWORD *)(v102 + 16), *(_DWORD *)(v102 + 16) = v103 + 1, !v103)
        && pthread_cond_broadcast((pthread_cond_t *)(v99 + 160LL * v98 + 88))
        || pthread_mutex_unlock(v101))
      {
        __int16 v90 = 167;
        unint64_t v91 = "SemRelease";
LABEL_112:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"runWorker",  v90,  33,  0,  v91,  v22,  v23,  (char)v107);
LABEL_113:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"streamProc",  313,  33,  0,  "run worker",  v104,  v105,  v109);
LABEL_98:
        *(_DWORD *)(a1 + 576) = 1;
      }

uint64_t graisRead(uint64_t a1, char *a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 576)) {
    return -1LL;
  }
  int v4 = (unint64_t *)(a1 + 584);
  do
    unint64_t v5 = __ldaxr(v4);
  while (__stlxr(v5 + a3, v4));
  return graisPRead(a1, a2, a3, v5);
}

uint64_t graisPRead(uint64_t a1, char *a2, uint64_t a3, unint64_t a4)
{
  if (*(_DWORD *)(a1 + 576)) {
    return -1LL;
  }
  if (!a3) {
    return 0LL;
  }
  unint64_t v5 = a4;
  if ((a4 & 0x8000000000000000LL) == 0)
  {
    unint64_t v7 = a4 + a3;
    if (a4 + a3 >= *(void *)(a1 + 40)) {
      unint64_t v7 = *(void *)(a1 + 40);
    }
    if (__CFADD__(a4, a3)) {
      unint64_t v8 = *(void *)(a1 + 40);
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 > a4)
    {
      unint64_t v9 = a4 / *(unsigned int *)(a1 + 48);
      if (v9 < *(void *)(a1 + 56))
      {
        uint64_t v4 = 0LL;
        int v11 = (_DWORD *)(a1 + 448);
        while (1)
        {
          uint64_t v12 = *(unsigned int *)(a1 + 48);
          if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 464)))
          {
            unsigned int v37 = "SharedArrayPop: pthread_mutex_lock failed\n";
            __int16 v38 = 91;
LABEL_40:
            pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  v38,  0,  v37,  v13,  v14,  v15,  v41);
            int v39 = "SharedArrayPop";
            __int16 v40 = 395;
            goto LABEL_41;
          }

          while (!*v11)
          {
            if (pthread_cond_wait((pthread_cond_t *)(a1 + 528), (pthread_mutex_t *)(a1 + 464)))
            {
              unsigned int v37 = "SharedArrayPop: pthread_cond_wait failed\n";
              __int16 v38 = 94;
              goto LABEL_40;
            }
          }

          unint64_t v44 = v8;
          unsigned int v16 = *v11 - 1;
          *(_DWORD *)(a1 + 448) = v16;
          unsigned int v17 = *(_DWORD *)(*(void *)(a1 + 456) + 4LL * v16);
          if (pthread_mutex_unlock((pthread_mutex_t *)(a1 + 464)))
          {
            unsigned int v37 = "SharedArrayPop: pthread_mutex_unlock failed\n";
            __int16 v38 = 98;
            goto LABEL_40;
          }

          uint64_t v41 = v12;
          uint64_t v18 = *(void *)(a1 + 128);
          uint64_t v19 = v18 + 136LL * v17;
          *(void *)uint64_t v19 = v9;
          *(_DWORD *)(v19 + 8) = -1;
          unint64_t v42 = (unsigned int *)(v19 + 8);
          unsigned int v46 = v17;
          unint64_t v45 = v9;
          if ((sendMessage_0(a1, v17, -1) & 0x80000000) != 0)
          {
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"acquireCachedBlock",  404,  33,  0,  "send request",  v20,  v21,  v41);
            int v43 = 0;
          }

          else
          {
            int v43 = 1;
          }

          uint64_t v22 = v18 + 136LL * v17;
          uint64_t v23 = (pthread_mutex_t *)(v22 + 24);
          if (pthread_mutex_lock((pthread_mutex_t *)(v22 + 24))) {
            goto LABEL_27;
          }
          uint64_t v26 = (int *)(v22 + 16);
          unint64_t v27 = (pthread_cond_t *)(v18 + 136LL * v46 + 88);
          while (*v26 <= 0)
          {
            if (pthread_cond_wait(v27, v23)) {
              goto LABEL_27;
            }
          }

          --*v26;
          if (pthread_mutex_unlock(v23))
          {
LABEL_27:
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"acquireCachedBlock",  410,  33,  0,  "SemAcquire",  v24,  v25,  v41);
            int v43 = 0;
          }

          uint64_t v28 = *v42;
          if (!v43 || (_DWORD)v28 == -1) {
            goto LABEL_42;
          }
          unint64_t v31 = v45 * v41;
          unint64_t v32 = v44;
          if (v45 * v41 + v41 < v44) {
            unint64_t v32 = v31 + v41;
          }
          unint64_t v47 = v32;
          unint64_t v33 = v32 - v5;
          memcpy(a2, (const void *)(*(void *)(*(void *)(a1 + 112) + 32 * v28 + 16) + v5 - v31), v32 - v5);
          a2 += v33;
          v4 += v33;
          unint64_t v34 = (unsigned int *)(*(void *)(a1 + 112) + 32 * v28);
          do
            unsigned int v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          unint64_t v8 = v44;
          if (v44 > v45 * v41 + v41)
          {
            unint64_t v5 = v47;
            unint64_t v9 = v45 + 1;
            if (v45 + 1 < *(void *)(a1 + 56)) {
              continue;
            }
          }

          return v4;
        }

        int v39 = "SharedArrayPush";
        __int16 v40 = 418;
LABEL_41:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"acquireCachedBlock",  v40,  33,  0,  v39,  v29,  v30,  v41);
LABEL_42:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"graisPRead",  464,  33,  0,  "acquire segment in cache",  v29,  v30,  v41);
        return -1LL;
      }
    }

    return 0LL;
  }

  return -1LL;
}

uint64_t graisSeek(uint64_t a1, unint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 576)) {
    return -1LL;
  }
  if (!a3) {
    goto LABEL_7;
  }
  if (a3 != 1)
  {
    if (a3 != 2) {
      return -1LL;
    }
    a2 += *(void *)(a1 + 40);
LABEL_7:
    atomic_store(a2, (unint64_t *)(a1 + 584));
    return a2;
  }

  uint64_t v3 = (unint64_t *)(a1 + 584);
  do
  {
    unint64_t v4 = __ldaxr(v3);
    unint64_t v5 = v4 + a2;
  }

  while (__stlxr(v5, v3));
  return v5;
}

uint64_t graisAbort(uint64_t result)
{
  if (!*(_DWORD *)(result + 576))
  {
    *(_DWORD *)(result + 576) = 1;
    uint64_t v1 = *(uint64_t (**)(void))(result + 24);
    if (v1) {
      return v1(*(void *)(result + 8));
    }
  }

  return result;
}

uint64_t sendMessage_0(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 208);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 208)))
  {
    uint64_t v10 = "SharedArrayPop: pthread_mutex_lock failed\n";
    __int16 v11 = 91;
LABEL_8:
    pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/../Common/SharedArray.h",  (uint64_t)"SharedArrayPop",  v11,  0,  v10,  v7,  v8,  v9,  v21);
    unsigned int v17 = "SharedArrayPop";
    __int16 v18 = 339;
LABEL_9:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAGenericRandomAccessInputStream.c",  (uint64_t)"sendMessage",  v18,  33,  0,  v17,  v15,  v16,  v21);
    return 0xFFFFFFFFLL;
  }

  while (1)
  {
    int v12 = *(_DWORD *)(a1 + 192);
    if (v12) {
      break;
    }
    if (pthread_cond_wait((pthread_cond_t *)(a1 + 272), v6))
    {
      uint64_t v10 = "SharedArrayPop: pthread_cond_wait failed\n";
      __int16 v11 = 94;
      goto LABEL_8;
    }
  }

  unsigned int v13 = v12 - 1;
  *(_DWORD *)(a1 + 192) = v13;
  uint64_t v14 = *(unsigned int *)(*(void *)(a1 + 200) + 4LL * v13);
  if (pthread_mutex_unlock(v6))
  {
    uint64_t v10 = "SharedArrayPop: pthread_mutex_unlock failed\n";
    __int16 v11 = 98;
    goto LABEL_8;
  }

  uint64_t v20 = (_DWORD *)(*(void *)(a1 + 80) + 8 * v14);
  *uint64_t v20 = a2;
  v20[1] = a3;
  if ((SharedArrayPush_0((unsigned int *)(a1 + 320), v14) & 0x80000000) != 0)
  {
    unsigned int v17 = "SharedArrayPush";
    __int16 v18 = 347;
    goto LABEL_9;
  }

  return 0LL;
}

uint64_t contextPassThroughProc(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 40) = *(_OWORD *)a2;
  __int128 v2 = *(_OWORD *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 104) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(_OWORD *)(a1 + 56) = v2;
  unint64_t v5 = *(uint64_t (**)(void))(a1 + 120);
  if (v5) {
    return v5(*(void *)(a1 + 112));
  }
  else {
    return 0LL;
  }
}

uint64_t verifySegmentProc( uint64_t a1, size_t __size, uint64_t a3, int a4, const void *a5, size_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (*(unsigned int *)(a1 + 56) >= __size)
  {
    int v38 = 0;
    memset(v37, 0, sizeof(v37));
    if (__size < 0x2000000001LL)
    {
      uint64_t v16 = malloc(__size);
      if (v16)
      {
        uint64_t v21 = *(void *)(a1 + 8);
        unint64_t v36 = v16;
        if (*(void *)(v21 + 32))
        {
          uint64_t v22 = 0LL;
          if (__size)
          {
            uint64_t v23 = v16;
            size_t v24 = __size;
            while (1)
            {
              uint64_t v25 = (*(uint64_t (**)(void, void *, size_t, uint64_t))(v21 + 32))( *(void *)v21,  v23,  v24,  a3);
              if (v25 < 0) {
                break;
              }
              if (v25)
              {
                uint64_t v23 = (void *)((char *)v23 + v25);
                v22 += v25;
                a3 += v25;
                v24 -= v25;
                if (v24) {
                  continue;
                }
              }

              goto LABEL_16;
            }

            uint64_t v22 = v25;
          }
        }

        else
        {
          uint64_t v22 = -1LL;
        }

uint64_t readerProc(uint64_t **a1)
{
  __int128 v2 = *a1;
  size_t v3 = (size_t)a1[2];
  if (v3 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_19:
    uint64_t v17 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c",  (uint64_t)"readerProc",  142,  128,  *v17,  "aaMalloc",  v18,  v19,  v22);
    uint64_t v23 = 0LL;
    goto LABEL_20;
  }

  uint64_t v23 = (char *)malloc(v3);
  if (!v23) {
    goto LABEL_19;
  }
  char v4 = 0;
  int v5 = 3;
  do
  {
    int v6 = v5;
    uint64_t v7 = a1[2];
    uint64_t v8 = *v2;
    if (*(void *)(*v2 + 32))
    {
      if (!v7) {
        break;
      }
      uint64_t v9 = 0LL;
      uint64_t v10 = a1[1];
      __int16 v11 = v23;
      int v12 = a1[2];
      while (1)
      {
        uint64_t v13 = (*(uint64_t (**)(void, char *, uint64_t *, uint64_t *))(v8 + 32))(*(void *)v8, v11, v12, v10);
        if (v13 < 0) {
          break;
        }
        if (v13)
        {
          v11 += v13;
          v9 += v13;
          uint64_t v10 = (uint64_t *)((char *)v10 + v13);
          int v12 = (uint64_t *)((char *)v12 - v13);
          if (v12) {
            continue;
          }
        }

        goto LABEL_14;
      }

      uint64_t v9 = v13;
    }

    else
    {
      uint64_t v9 = -1LL;
    }

uint64_t writerProc_0( uint64_t a1, size_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v10 = a2;
  if (*(_DWORD *)(a1 + 384))
  {
    int v12 = (pthread_mutex_t *)(a1 + 160);
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 160)))
    {
      uint64_t v13 = "MutexLock";
      __int16 v14 = 172;
LABEL_24:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c",  (uint64_t)"writerProc",  v14,  128,  0,  v13,  a7,  a8,  v52);
      return 0xFFFFFFFFLL;
    }

    uint64_t v19 = (unsigned int *)(a1 + 376);
    if (!atomic_load((unsigned int *)(a1 + 376)))
    {
      while (!__ldaxr(v19))
      {
        if (!__stlxr(1u, v19)) {
          goto LABEL_26;
        }
      }

      __clrex();
    }

uint64_t AEADecryptToStreamChunk( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t a6, unint64_t a7, unint64_t a8, int a9)
{
  int DefaultNThreads = a9;
  uint64_t v92 = *MEMORY[0x1895F89C0];
  __int128 v89 = 0u;
  __int128 __count = 0u;
  __int128 v87 = 0u;
  memset(v86, 0, sizeof(v86));
  *(_OWORD *)unint64_t v85 = 0u;
  *(_OWORD *)uint64_t v84 = 0u;
  __int128 v83 = 0u;
  __int128 v82 = 0u;
  __int128 v81 = 0u;
  __int128 v80 = 0u;
  __int128 v79 = 0u;
  __int128 v78 = 0u;
  __int128 v77 = 0u;
  if (!a9) {
    int DefaultNThreads = getDefaultNThreads();
  }
  v76[0] = a1;
  v76[1] = a2;
  *(void *)&__int128 v83 = a3;
  *((void *)&v83 + 1) = a4;
  v84[0] = a5;
  *(void *)&__int128 __count = 3 * DefaultNThreads - 1;
  BOOL v18 = (a8 & 0x400) == 0 || *(void *)(a2 + 40) == 0LL;
  BOOL v90 = v18;
  if ((a8 & 0x100000000000000LL) != 0)
  {
    int v19 = !v18;
    if (!*(void *)(a2 + 32)) {
      int v19 = 0;
    }
  }

  else
  {
    int v19 = 0;
  }

  HIDWORD(v89) = v19;
  BOOL v91 = a6 == 0;
  if (pthread_mutex_init((pthread_mutex_t *)v86, 0LL))
  {
    char v22 = "MutexInit";
    __int16 v23 = 288;
    goto LABEL_15;
  }

  *(_DWORD *)&v86[64] = 0;
  if (pthread_mutex_init((pthread_mutex_t *)&v86[72], 0LL) || pthread_cond_init((pthread_cond_t *)&v86[136], 0LL))
  {
    char v22 = "SemInit";
    __int16 v23 = 289;
    goto LABEL_15;
  }

  if (DefaultNThreads >= 2)
  {
    int v37 = DefaultNThreads - 1;
    do
    {
      if (pthread_mutex_lock((pthread_mutex_t *)&v86[72])
        || (int v38 = *(_DWORD *)&v86[64], ++*(_DWORD *)&v86[64], !v38)
        && pthread_cond_broadcast((pthread_cond_t *)&v86[136])
        || pthread_mutex_unlock((pthread_mutex_t *)&v86[72]))
      {
        char v22 = "SemRelease";
        __int16 v23 = 292;
        goto LABEL_15;
      }

      --v37;
    }

    while (v37);
  }

  if (is_mul_ok(__count, 0x18uLL) && (unint64_t)(24 * __count) < 0x2000000001LL)
  {
    uint64_t v40 = calloc(__count, 0x18uLL);
  }

  else
  {
    size_t v39 = __error();
    uint64_t v40 = 0LL;
    *size_t v39 = 12;
  }

  *((void *)&v87 + 1) = v40;
  if (DefaultNThreads < 0)
  {
    *__error() = 12;
    v84[1] = 0LL;
    unint64_t v42 = __error();
    uint64_t v41 = 0LL;
    int *v42 = 12;
  }

  else
  {
    v84[1] = calloc(DefaultNThreads, 0x18uLL);
    uint64_t v41 = calloc(DefaultNThreads, 8uLL);
  }

  v85[0] = v41;
  if (!*((void *)&v87 + 1) || !v84[1] || !v41)
  {
    int v24 = *__error();
    char v22 = "malloc";
    __int16 v23 = 299;
    goto LABEL_16;
  }

  if (HIDWORD(v89)) {
    unint64_t v43 = verifySegmentProc;
  }
  else {
    unint64_t v43 = 0LL;
  }
  unint64_t v44 = (uint64_t (**)(void))AEADecryptAsyncStreamOpen( (uint64_t)v76,  (uint64_t)contextPassThroughProc,  (uint64_t)v43,  (uint64_t)writerProc_0,  a8,  DefaultNThreads);
  *(void *)&__int128 v77 = v44;
  if (!v44)
  {
    char v22 = "AEADecryptAsyncStreamOpen";
    __int16 v23 = 308;
    goto LABEL_15;
  }

  if (a6)
  {
    uint64_t v46 = AAChunkAsyncStreamOpen((uint64_t)v44, a6, a7, a8, DefaultNThreads, v45, v20, v21);
    *((void *)&v77 + 1) = v46;
    if (!v46)
    {
      char v22 = "AAChunkAsyncStreamOpen";
      __int16 v23 = 317;
      goto LABEL_15;
    }

    unint64_t v47 = v46;
    unint64_t v44 = (uint64_t (**)(void))v77;
  }

  else
  {
    unint64_t v47 = (uint64_t (**)(void))*((void *)&v77 + 1);
  }

  if (!v47) {
    unint64_t v47 = v44;
  }
  *(void *)&__int128 v78 = v47;
  if (DefaultNThreads >= 1)
  {
    for (uint64_t i = 0LL; i != DefaultNThreads; *((void *)v85[0] + i++) = v49)
    {
      unsigned int v49 = (char *)v84[1] + 24 * i;
      void *v49 = v76;
    }
  }

  v85[1] = ThreadPoolCreate(DefaultNThreads, (uint64_t)v85[0], (uint64_t)readerProc);
  if (!v85[1])
  {
    char v22 = "ThreadPoolCreate";
    __int16 v23 = 329;
    goto LABEL_15;
  }

  while (2)
  {
    if (v90)
    {
      unsigned int v50 = atomic_load((unsigned int *)&v89 + 2);
      if (v50 && v91)
      {
        while (!pthread_mutex_lock((pthread_mutex_t *)&v86[72]))
        {
          gettimeofday(&v74, 0LL);
          uint64_t v52 = 1000LL * v74.tv_usec;
          if (v74.tv_usec < 1000000)
          {
            __darwin_time_t v55 = v74.tv_sec + 1;
          }

          else
          {
            if (v52 >= 1999999999) {
              uint64_t v53 = 1999999999LL;
            }
            else {
              uint64_t v53 = 1000LL * v74.tv_usec;
            }
            unint64_t v54 = (v52 + 999999999 - v53) / 0x3B9ACA00uLL;
            __darwin_time_t v55 = v74.tv_sec + v54 + 2;
            uint64_t v52 = v52 - 1000000000 * v54 - 1000000000;
          }

          v75.tv_seCC_SHA1_CTX c = v55;
          v75.tv_nseCC_SHA1_CTX c = v52;
          do
          {
            if (*(int *)&v86[64] > 0)
            {
              --*(_DWORD *)&v86[64];
              if (!pthread_mutex_unlock((pthread_mutex_t *)&v86[72])) {
                goto LABEL_97;
              }
              goto LABEL_107;
            }

            int v56 = pthread_cond_timedwait((pthread_cond_t *)&v86[136], (pthread_mutex_t *)&v86[72], &v75);
          }

          while (!v56);
          if (v56 != 60 || pthread_mutex_unlock((pthread_mutex_t *)&v86[72])) {
            break;
          }
          if (aaAsyncByteStreamIsCancelled((void *)v78))
          {
            char v22 = "aaAsyncByteStreamIsCancelled";
            __int16 v23 = 343;
            goto LABEL_15;
          }

          if (!v91) {
            goto LABEL_97;
          }
        }

LABEL_107:
        char v22 = "SemTimedAcquire";
        __int16 v23 = 341;
        break;
      }
    }

    while (1)
    {
LABEL_97:
      unint64_t v72 = 0LL;
      uint64_t v73 = 0LL;
      int Range = AAAsyncByteStreamGetRange((void *)v78, &v72, &v73);
      if (Range < 0)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleEncryptedArchive/AEADecryptToStream.c",  (uint64_t)"AEADecryptToStreamChunk",  352,  128,  0,  "AAAsyncByteStreamGetRange",  v63,  v64,  v71);
        int v25 = 0;
LABEL_104:
        ThreadPoolSync((unsigned int *)v85[1]);
        goto LABEL_17;
      }

      if (Range) {
        break;
      }
      usleep(0x186A0u);
    }

    if (!v72)
    {
      int v25 = 1;
      goto LABEL_104;
    }

    uint64_t Worker = ThreadPoolGetWorker((uint64_t)v85[1], v58, v59, v60, v61, v62, v63, v64);
    if (Worker)
    {
      unint64_t v70 = v72;
      *(void *)(Worker + 8) = v73;
      *(void *)(Worker + 16) = v70;
      char v22 = "ThreadPoolRunWorker";
      __int16 v23 = 365;
    }

    else
    {
      char v22 = "ThreadPoolGetWorker";
      __int16 v23 = 362;
    }

    break;
  }

uint64_t AEADecryptToStream( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t a6, int a7)
{
  return AEADecryptToStreamChunk(a1, a2, a3, a4, a5, 0LL, 0LL, a6, a7);
}

size_t PCompressLZBITMAPEncode(uint8_t *a1, size_t a2, const uint8_t *a3, size_t a4)
{
  size_t result = compression_encode_buffer(a1, a2, a3, a4, 0LL, (compression_algorithm)0x702u);
  if (!result) {
    return -1LL;
  }
  return result;
}

size_t PCompressLZBITMAPDecode(uint8_t *a1, size_t a2, const uint8_t *a3, size_t a4)
{
  size_t result = compression_decode_buffer(a1, a2, a3, a4, 0LL, (compression_algorithm)0x702u);
  if (!result) {
    return -1LL;
  }
  return result;
}

void *PagedFileCreate(const char *a1, unint64_t a2, unint64_t a3, int a4)
{
  if (stat(a1, &v57))
  {
    int v10 = *__error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileCreate",  320,  21,  v10,  "%s",  v11,  v12,  (char)a1);
    return 0LL;
  }

  unint64_t st_size = v57.st_size;
  if (v57.st_size <= a2) {
    off_t v14 = a2;
  }
  else {
    off_t v14 = v57.st_size;
  }
  unint64_t v15 = v14 + 4095;
  if (v15 >= 0xFFFFFFEF000LL)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileCreate",  324,  21,  0,  "File is too large to be patched in place",  v8,  v9,  v55);
    return 0LL;
  }

  uint64_t v18 = (v15 >> 12) + 16;
  else {
    unsigned int v19 = a3 >> 12;
  }
  unsigned int v20 = v19 + v18;
  size_t v21 = (v19 << 12) + 4096 + 4LL * v19 + 16 * (v18 & 0x3FFFFFFF) + 8LL * v20 + 8LL * v20 + 216;
  char v22 = malloc(v21);
  uint64_t v16 = v22;
  if (!v22)
  {
    uint64_t v29 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileCreate",  339,  21,  *v29,  "malloc",  v30,  v31,  v55);
    return v16;
  }

  bzero(v22, v21);
  if (a4 >= 2) {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Opening paged file %s, %u pages in file, %u pages in cache, %u pages total, memory usage: %zu B\n",  a1,  v18,  v19,  v19 + v18,  v21);
  }
  *(_DWORD *)uint64_t v16 = -1;
  v16[1] = st_size;
  v16[2] = a2;
  *((_DWORD *)v16 + 32) = a4;
  *((_DWORD *)v16 + 6) = v18;
  *((_DWORD *)v16 + 7) = v19;
  *((_DWORD *)v16 + 8) = v20;
  int v23 = open(a1, 2);
  *(_DWORD *)uint64_t v16 = v23;
  if (v23 < 0)
  {
    int v26 = *__error();
    char v56 = (char)a1;
    uint64_t v27 = "%s";
    __int16 v28 = 357;
    goto LABEL_23;
  }

  char v56 = 1;
  if (fcntl(v23, 48)) {
    fwrite("Warning: couldn't set F_NOCACHE on paged file\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  }
  if (ftruncate(*(_DWORD *)v16, v18 << 12))
  {
    int v26 = *__error();
    char v56 = (char)a1;
    uint64_t v27 = "%s";
    __int16 v28 = 365;
LABEL_23:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileCreate",  v28,  21,  v26,  v27,  v24,  v25,  v56);
    if ((*(_DWORD *)v16 & 0x80000000) == 0) {
      close(*(_DWORD *)v16);
    }
    free(v16);
    return 0LL;
  }

  uint64_t v32 = (char *)(v16 + 24);
  uint64_t v33 = *((unsigned int *)v16 + 6);
  uint64_t v34 = *((unsigned int *)v16 + 7);
  uint64_t v35 = (uint64_t)v16 + 4 * v33 + 192;
  uint64_t v36 = v35 + 4LL * v33;
  uint64_t v37 = v36 + 4LL * v33;
  v16[14] = v36;
  v16[15] = v37;
  uint64_t v38 = v37 + 4LL * v33;
  v16[7] = v38;
  v16[8] = v35;
  uint64_t v39 = *((unsigned int *)v16 + 8);
  uint64_t v40 = v38 + 4 * v39;
  uint64_t v41 = v40 + 4 * v39;
  v16[5] = v41;
  v16[6] = v16 + 24;
  uint64_t v42 = v41 + 8 * v39;
  v16[9] = v40;
  v16[10] = v42;
  uint64_t v43 = v42 + 4096;
  uint64_t v44 = v42 + 4096 + ((_DWORD)v34 << 12);
  v16[11] = v43;
  v16[12] = v44;
  if (v44 + 4 * v34 > (unint64_t)v16 + v21)
  {
    uint64_t v27 = "in memory allocation for PagedFile";
    __int16 v28 = 378;
    int v26 = 0;
    goto LABEL_23;
  }

  if ((_DWORD)v39)
  {
    unint64_t v45 = 0LL;
    do
    {
      *(void *)(v38 + 8 * v39) = 0LL;
      *(_DWORD *)(v38 + 4 * v45) = -1;
      *(_DWORD *)(v38 + 4 * v39) = -1;
      ++v45;
      ++v39;
    }

    while (v45 < *((unsigned int *)v16 + 8));
    unsigned int v46 = *((_DWORD *)v16 + 6);
  }

  else
  {
    unsigned int v46 = v33;
  }

  if (v46)
  {
    unint64_t v47 = 0LL;
    int v48 = &v32[4 * v33];
    unsigned int v49 = &v32[12 * v33];
    unsigned int v50 = &v32[8 * v33];
    do
    {
      *(_DWORD *)&v32[4 * v47] = -1;
      *(_DWORD *)&v48[4 * v47] = -1;
      *(_DWORD *)&v50[4 * v47] = -1;
      *(_DWORD *)&v49[4 * v47++] = -1;
    }

    while (v47 < v46);
    unint64_t v51 = 0LL;
    unint64_t v52 = 0LL;
    unint64_t v53 = st_size;
    do
    {
      if (v51 >= st_size) {
        break;
      }
      unint64_t v54 = v53 - 4096;
      if (v53 >= 0x1000) {
        unint64_t v53 = 4096LL;
      }
      *(void *)(v41 + 8 * v52) = v53;
      *(_DWORD *)(v38 + 4 * v52) = v52;
      *(_DWORD *)&v32[4 * v52] = v52;
      ++v52;
      v51 += 4096LL;
      unint64_t v53 = v54;
    }

    while (v52 < v46);
  }

  return v16;
}

uint64_t PagedFileDestroy( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    for (unsigned int i = *(_DWORD *)(result + 24); ; ++i)
    {
      if (i >= *(_DWORD *)(v8 + 32))
      {
        int v10 = 1;
        goto LABEL_8;
      }
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"flushCache",  243,  21,  0,  "flushing cache pos",  a7,  a8,  v19);
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileDestroy",  423,  21,  0,  "flush cache",  v11,  v12,  v20);
    int v10 = 0;
LABEL_8:
    if ((*(_DWORD *)v8 & 0x80000000) == 0)
    {
      if (ftruncate(*(_DWORD *)v8, *(void *)(v8 + 16)))
      {
        uint64_t v13 = __error();
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileDestroy",  427,  21,  *v13,  "Final truncate",  v14,  v15,  v19);
        int v10 = 0;
      }

      if (fcntl(*(_DWORD *)v8, 51, 0LL) == -1)
      {
        uint64_t v16 = __error();
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileDestroy",  432,  21,  *v16,  "Final FULLSYNC",  v17,  v18,  v21);
        int v10 = 0;
      }

      close(*(_DWORD *)v8);
    }

    if (*(int *)(v8 + 128) >= 2) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Closing paged file, input size: %llu B, output size: %llu B, bytes read: %llu B, bytes written: %llu B\n",  *(void *)(v8 + 8),  *(void *)(v8 + 16),  *(void *)(v8 + 136),  *(void *)(v8 + 144));
    }
    free((void *)v8);
    if (v10) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t PagedFileDump(uint64_t a1, const char *a2)
{
  size_t v3 = (FILE **)MEMORY[0x1895F89D0];
  char v4 = "current PagedFile state";
  if (a2) {
    char v4 = a2;
  }
  fprintf((FILE *)*MEMORY[0x1895F89D0], "*** %s\n", v4);
  LODWORD(v7) = *(_DWORD *)(a1 + 32);
  if (!(_DWORD)v7)
  {
    int v14 = 0;
    int v13 = 0;
    uint64_t v12 = 0LL;
    uint64_t v11 = 0LL;
    int v10 = 0;
    int v9 = 0;
    goto LABEL_29;
  }

  unint64_t v8 = 0LL;
  int v9 = 0;
  int v10 = 0;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  int v13 = 0;
  int v14 = 0;
  do
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8 * v8);
    if (!v15)
    {
      else {
        ++v14;
      }
    }

    uint64_t v16 = *(unsigned int *)(*(void *)(a1 + 56) + 4 * v8);
    if ((_DWORD)v16 != -1)
    {
      ++v9;
      v11 += v15;
      if (v8 != *(_DWORD *)(*(void *)(a1 + 48) + 4 * v16)) {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileDump",  472,  21,  0,  "invalid reverse index for IN",  v5,  v6,  v22);
      }
    }

    uint64_t v17 = *(unsigned int *)(*(void *)(a1 + 72) + 4 * v8);
    if ((_DWORD)v17 != -1)
    {
      ++v10;
      v12 += v15;
      if (v8 != *(_DWORD *)(*(void *)(a1 + 64) + 4 * v17)) {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileDump",  480,  21,  0,  "invalid reverse index for OUT",  v5,  v6,  v22);
      }
    }

    if (*(_DWORD *)(*(void *)(a1 + 56) + 4 * v8) != -1 && *(_DWORD *)(*(void *)(a1 + 72) + 4 * v8) != -1) {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileDump",  483,  21,  0,  "inconsistency in inPage/outPage indices",  v5,  v6,  v22);
    }
    int v18 = *(_DWORD *)(*(void *)(a1 + 56) + 4 * v8);
    if (v15)
    {
      if (v18 == -1 && *(_DWORD *)(*(void *)(a1 + 72) + 4 * v8) == -1)
      {
        __int16 v19 = 485;
        char v20 = "inconsistency in nRefs != 0";
LABEL_25:
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileDump",  v19,  21,  0,  v20,  v5,  v6,  v22);
      }
    }

    else if (v18 != -1 || *(_DWORD *)(*(void *)(a1 + 72) + 4 * v8) != -1)
    {
      __int16 v19 = 486;
      char v20 = "inconsistency in nRefs == 0";
      goto LABEL_25;
    }

    ++v8;
    unint64_t v7 = *(unsigned int *)(a1 + 32);
  }

  while (v8 < v7);
  size_t v3 = (FILE **)MEMORY[0x1895F89D0];
LABEL_29:
  fprintf(*v3, "  %u total pages\n", v7);
  fprintf(*v3, "  %u free pages in file\n", v13);
  fprintf(*v3, "  %u free pages in cache\n", v14);
  fprintf(*v3, "  %u input pages stored, %llu bytes referenced\n", v9, v11);
  return fprintf(*v3, "  %u output pages stored, %llu bytes referenced\n", v10, v12);
}

uint64_t PagedFileRetainIn( void *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v8 = a1[6];
  while (1)
  {
    uint64_t v9 = *(unsigned int *)(v8 + 4LL * (a2 >> 12));
    if ((_DWORD)v9 == -1) {
      break;
    }
    uint64_t v10 = a1[15];
    *(_DWORD *)(a1[14] + 4LL * (a2 >> 12)) = v9;
    unint64_t v11 = 4096 - (a2 & 0xFFF);
    *(_DWORD *)(v10 + 4 * v9) = a2 >> 12;
    if (v11 >= a3) {
      unint64_t v11 = a3;
    }
    *(void *)(a1[5] + 8 * v9) += v11;
    a2 += v11;
    a3 -= v11;
    if (!a3) {
      return 0LL;
    }
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileRetainIn",  503,  21,  0,  "input page is not stored",  a7,  a8,  vars0);
  return 0xFFFFFFFFLL;
}

uint64_t PagedFileReleaseIn( uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0LL;
  }
  unint64_t v8 = a3;
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = (FILE **)MEMORY[0x1895F89D0];
  while (1)
  {
    unint64_t v13 = 4096 - (a2 & 0xFFF) >= v8 ? v8 : 4096 - (a2 & 0xFFF);
    uint64_t v14 = *(unsigned int *)(v11 + 4LL * (a2 >> 12));
    if ((_DWORD)v14 == -1) {
      break;
    }
    uint64_t v15 = *(void *)(a1 + 40);
    unint64_t v16 = *(void *)(v15 + 8 * v14) - v13;
    *(void *)(v15 + 8 * v14) = v16;
    if (!v16)
    {
      if (*(int *)(a1 + 128) >= 3)
      {
        fprintf(*v12, "PagedFile: input page %u removed from storage\n", a2 >> 12);
        uint64_t v11 = *(void *)(a1 + 48);
      }

      *(_DWORD *)(*(void *)(a1 + 56) + 4 * v14) = -1;
      *(_DWORD *)(v11 + 4LL * (a2 >> 12)) = -1;
    }

    a2 += v13;
    v8 -= v13;
    if (!v8) {
      return 0LL;
    }
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileReleaseIn",  525,  21,  0,  "input page is not stored",  a7,  a8,  v18);
  return 0xFFFFFFFFLL;
}

uint64_t PagedFileRetainOut( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0LL;
  }
  unint64_t v8 = a3;
  unint64_t v9 = a2;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = (FILE **)MEMORY[0x1895F89D0];
  while (1)
  {
    unint64_t v13 = v9 >> 12;
    if (4096 - (v9 & 0xFFF) >= v8) {
      uint64_t v14 = v8;
    }
    else {
      uint64_t v14 = 4096 - (v9 & 0xFFF);
    }
    uint64_t v15 = *(unsigned int *)(v11 + 4LL * v13);
    if ((_DWORD)v15 != -1) {
      goto LABEL_11;
    }
    int FreeCachePos = getFreeCachePos(a1, a2, a3, a4, a5, a6, a7, a8);
    if (FreeCachePos == -1) {
      break;
    }
    unsigned int v17 = FreeCachePos;
    uint64_t v15 = v17;
    uint64_t v11 = *(void *)(a1 + 64);
    *(_DWORD *)(*(void *)(a1 + 72) + 4LL * v17) = v13;
    *(_DWORD *)(v11 + 4LL * (v9 >> 12)) = v17;
LABEL_11:
    *(void *)(*(void *)(a1 + 40) + 8 * v15) += v14;
    v9 += v14;
    v8 -= v14;
    if (!v8) {
      return 0LL;
    }
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"PagedFileRetainOut",  555,  21,  0,  "no storage available for output page",  a7,  a8,  v19);
  return 0xFFFFFFFFLL;
}

uint64_t getFreeCachePos( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 24);
  uint64_t v9 = *(unsigned int *)(a1 + 32);
  if (v8 >= v9)
  {
LABEL_13:
    uint64_t v14 = "no cache";
    __int16 v15 = 231;
LABEL_14:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"getFreeCachePos",  v15,  21,  0,  v14,  a7,  a8,  v17);
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = v8 - v9;
    uint64_t v13 = 0xFFFFFFFFLL;
    do
    {
      if (!*(void *)(*(void *)(a1 + 40) + 8 * v8 + 8 * v11)) {
        return (v8 + v11);
      }
      if ((_DWORD)v13 == -1
        || *(_DWORD *)(*(void *)(a1 + 96) + 4 * v11) < *(_DWORD *)(*(void *)(a1 + 96)
                                                                   + 4LL * (v13 - v8)))
      {
        uint64_t v13 = (v8 + v11);
      }

      ++v11;
    }

    while (v12 + v11);
    if ((_DWORD)v13 == -1) {
      goto LABEL_13;
    }
    if (storeCachePos(a1, v13, a3, a4, a5, a6, a7, a8))
    {
      uint64_t v14 = "flushing cache pos";
      __int16 v15 = 235;
      goto LABEL_14;
    }
  }

  return v13;
}

uint64_t PagedFileReleaseAllIn( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return PagedFileReleaseIn(a1, 0LL, *(void *)(a1 + 8), a4, a5, a6, a7, a8);
}

BOOL PagedFileHasNoIn(uint64_t a1)
{
  unint64_t v1 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v1)
  {
    uint64_t v2 = 0LL;
    BOOL v3 = 0;
    do
    {
      if (*(_DWORD *)(*(void *)(a1 + 56) + 4 * v2) != -1 && *(void *)(*(void *)(a1 + 40) + 8 * v2)) {
        break;
      }
      BOOL v3 = ++v2 >= v1;
    }

    while (v1 != v2);
  }

  else
  {
    return 1;
  }

  return v3;
}

BOOL PagedFileHasAllOut(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v2)
  {
    unint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
    while (1)
    {
      if (*(_DWORD *)(*(void *)(a1 + 72) + 4 * v3) != -1)
      {
        uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8 * v3);
        v4 += v5;
      }

      if (v2 == ++v3) {
        return v4 == v1;
      }
    }

    return 0LL;
  }

  else
  {
    uint64_t v4 = 0LL;
    return v4 == v1;
  }

uint64_t PagedFileReadAndReleaseIn( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v8 = (char *)a4;
  unint64_t v9 = a3;
  while (1)
  {
    unint64_t v12 = a2 >> 12;
    if (4096 - (a2 & 0xFFF) >= v9) {
      size_t v13 = v9;
    }
    else {
      size_t v13 = 4096 - (a2 & 0xFFF);
    }
    unsigned int v14 = *(_DWORD *)(a1 + 24);
    if (v14 <= v12)
    {
      uint64_t v31 = "invalid input PAGE";
      __int16 v32 = 252;
      goto LABEL_27;
    }

    uint64_t v15 = *(unsigned int *)(*(void *)(a1 + 48) + 4LL * v12);
    if ((_DWORD)v15 == -1)
    {
      uint64_t v31 = "input page is not stored";
      __int16 v32 = 254;
      goto LABEL_27;
    }

    uint64_t v16 = (a2 >> 12);
    if (v15 >= v14)
    {
      uint64_t v18 = 0xFFFFFFFFLL;
    }

    else
    {
      uint64_t FreeCachePos = getFreeCachePos(a1, v15, a3, a4, a5, a6, a7, a8);
      if ((_DWORD)FreeCachePos == -1)
      {
        uint64_t v31 = "could not get a free pos from cache";
        __int16 v32 = 261;
        goto LABEL_27;
      }

      uint64_t v18 = FreeCachePos;
      LODWORD(v15) = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v16);
      unsigned int v14 = *(_DWORD *)(a1 + 24);
    }

uint64_t PagedFileRetainAndWriteOut( uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v8 = (char *)a4;
  unint64_t v9 = a3;
  while (1)
  {
    if (4096 - (a2 & 0xFFF) >= v9) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 4096 - (a2 & 0xFFF);
    }
    if (PagedFileRetainOut(a1, a2, v12, a4, a5, a6, a7, a8))
    {
      uint64_t v31 = "retain output chunk";
      __int16 v32 = 639;
      goto LABEL_31;
    }

    unsigned int v19 = *(_DWORD *)(a1 + 24);
    if (v19 <= (a2 >> 12))
    {
      uint64_t v29 = "invalid output PAGE";
      __int16 v30 = 286;
      goto LABEL_29;
    }

    uint64_t v20 = *(unsigned int *)(*(void *)(a1 + 64) + 4LL * (a2 >> 12));
    if ((_DWORD)v20 == -1)
    {
      uint64_t v29 = "output page is not stored";
      __int16 v30 = 288;
      goto LABEL_29;
    }

    uint64_t v21 = (a2 >> 12);
    if (v20 >= v19)
    {
      uint64_t v23 = 0xFFFFFFFFLL;
    }

    else
    {
      uint64_t FreeCachePos = getFreeCachePos(a1, v20, v13, v14, v15, v16, v17, v18);
      if ((_DWORD)FreeCachePos == -1)
      {
        uint64_t v29 = "could not get a free pos from cache";
        __int16 v30 = 294;
        goto LABEL_29;
      }

      uint64_t v23 = FreeCachePos;
      LODWORD(v20) = *(_DWORD *)(*(void *)(a1 + 64) + 4 * v21);
      unsigned int v19 = *(_DWORD *)(a1 + 24);
    }

uint64_t storeCachePos( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 24);
  if (v8 > a2 || *(_DWORD *)(a1 + 32) <= a2)
  {
    uint64_t v18 = "invalid cache POS";
    __int16 v19 = 165;
    goto LABEL_9;
  }

  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(v11 + 8LL * a2);
  if (!v12) {
    return 0LL;
  }
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(unsigned int *)(v13 + 4LL * a2);
  if ((_DWORD)v14 == -1)
  {
    uint64_t v20 = *(unsigned int *)(*(void *)(a1 + 72) + 4LL * a2);
    if ((_DWORD)v20 != -1)
    {
      if (*(void *)(v11 + 8 * v20))
      {
        int v21 = -(int)v8;
        uint64_t v22 = v8 - 1;
        do
        {
          if (v22 == -1) {
            goto LABEL_18;
          }
          uint64_t v23 = *(void *)(v11 + 8LL * v22);
          ++v21;
          --v22;
        }

        while (v23);
        if (v21 == 1)
        {
LABEL_18:
          uint64_t v18 = "no free pages in file";
          __int16 v19 = 208;
          goto LABEL_9;
        }

        uint64_t v28 = -v21;
        if (movePage(a1, v20, v28, a4, a5, a6, a7, a8))
        {
          uint64_t v18 = "vacating page in file";
          __int16 v19 = 210;
          goto LABEL_9;
        }
      }

      uint64_t result = movePage(a1, a2, v20, a4, a5, a6, a7, a8);
      if ((_DWORD)result)
      {
        uint64_t v18 = "moving output page from cache to disk";
        __int16 v19 = 213;
        goto LABEL_9;
      }

      return result;
    }

    uint64_t v18 = "nRefs inconsistency";
    __int16 v19 = 215;
LABEL_9:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"storeCachePos",  v19,  21,  0,  v18,  a7,  a8,  v29);
    return 0xFFFFFFFFLL;
  }

  uint64_t v15 = *(unsigned int *)(*(void *)(a1 + 112) + 4 * v14);
  if ((_DWORD)v15 == -1)
  {
    uint64_t v18 = "cached input page does not have a file position";
    __int16 v19 = 175;
    goto LABEL_9;
  }

  if (*(_DWORD *)(*(void *)(a1 + 120) + 4 * v15) == (_DWORD)v14)
  {
    uint64_t result = 0LL;
    *(_DWORD *)(*(void *)(a1 + 48) + 4 * v14) = v15;
    *(void *)(v11 + 8 * v15) = v12;
    *(_DWORD *)(v13 + 4 * v15) = v14;
    uint64_t v17 = *(void *)(a1 + 72);
    *(_DWORD *)(v17 + 4 * v15) = -1;
    *(void *)(v11 + 8LL * a2) = 0LL;
    *(_DWORD *)(v13 + 4LL * a2) = -1;
    *(_DWORD *)(v17 + 4LL * a2) = -1;
    return result;
  }

  int v24 = -(int)v8;
  uint64_t v25 = v8 - 1;
  do
  {
    if (v25 == -1) {
      goto LABEL_24;
    }
    uint64_t v26 = *(void *)(v11 + 8LL * v25);
    ++v24;
    --v25;
  }

  while (v26);
  if (v24 == 1)
  {
LABEL_24:
    uint64_t v18 = "no free pages in file";
    __int16 v19 = 196;
    goto LABEL_9;
  }

  uint64_t v27 = -v24;
  uint64_t result = movePage(a1, a2, v27, a4, a5, a6, a7, a8);
  if ((_DWORD)result)
  {
    uint64_t v18 = "moving input page from cache to disk";
    __int16 v19 = 198;
    goto LABEL_9;
  }

  return result;
}

uint64_t movePage( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *(_DWORD *)(a1 + 32);
  if (v8 <= a2 || v8 <= a3)
  {
    uint64_t v10 = "invalid SRC/DST";
    __int16 v11 = 77;
LABEL_10:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"movePage",  v11,  21,  0,  v10,  a7,  a8,  v39);
    return 0xFFFFFFFFLL;
  }

  uint64_t v14 = *(void *)(a1 + 40);
  if (!*(void *)(v14 + 8LL * a2))
  {
    uint64_t v10 = "SRC is empty";
    __int16 v11 = 78;
    goto LABEL_10;
  }

  unsigned int v15 = a3;
  if (*(void *)(v14 + 8LL * a3))
  {
    uint64_t v10 = "DST is not empty";
    __int16 v11 = 79;
    goto LABEL_10;
  }

  unsigned int v17 = *(_DWORD *)(a1 + 24);
  if (v17 > a2 && v17 > a3)
  {
    uint64_t v22 = *(unsigned int *)(*(void *)(a1 + 56) + 4LL * a2);
    if ((_DWORD)v22 != -1) {
      *(_DWORD *)(*(void *)(a1 + 112) + 4 * v22) = a3;
    }
    *(_DWORD *)(*(void *)(a1 + 120) + 4LL * a3) = v22;
    if (pread(*(_DWORD *)a1, *(void **)(a1 + 80), 0x1000uLL, a2 << 12) != 4096)
    {
      uint64_t v10 = "reading page";
      __int16 v11 = 93;
      goto LABEL_10;
    }

    if (pwrite(*(_DWORD *)a1, *(const void **)(a1 + 80), 0x1000uLL, v15 << 12) != 4096)
    {
      uint64_t v10 = "writing page";
      __int16 v11 = 94;
      goto LABEL_10;
    }

    *(int64x2_t *)(a1 + 136) = vaddq_s64(*(int64x2_t *)(a1 + 136), vdupq_n_s64(0x1000uLL));
  }

  else if (v17 > a2 || v17 <= a3)
  {
    if (v17 <= a2 || v17 > a3)
    {
      uint64_t v26 = (void *)cacheData(a1, v15, a3, a4, a5, a6, a7, a8);
      char v33 = (const void *)cacheData(a1, a2, v27, v28, v29, v30, v31, v32);
      memcpy(v26, v33, 0x1000uLL);
    }

    else
    {
      uint64_t v23 = *(unsigned int *)(*(void *)(a1 + 56) + 4LL * a2);
      if ((_DWORD)v23 != -1) {
        *(_DWORD *)(*(void *)(a1 + 112) + 4 * v23) = a2;
      }
      *(_DWORD *)(*(void *)(a1 + 120) + 4LL * a2) = v23;
      int v24 = *(_DWORD *)a1;
      uint64_t v25 = (void *)cacheData(a1, v15, a3, a4, a5, a6, a7, a8);
      if (pread(v24, v25, 0x1000uLL, a2 << 12) != 4096)
      {
        uint64_t v10 = "reading page";
        __int16 v11 = 121;
        goto LABEL_10;
      }

      *(void *)(a1 + 136) += 4096LL;
    }
  }

  else
  {
    uint64_t v19 = *(unsigned int *)(*(void *)(a1 + 56) + 4LL * a2);
    if ((_DWORD)v19 != -1) {
      *(_DWORD *)(*(void *)(a1 + 112) + 4 * v19) = a3;
    }
    *(_DWORD *)(*(void *)(a1 + 120) + 4LL * a3) = v19;
    int v20 = *(_DWORD *)a1;
    int v21 = (const void *)cacheData(a1, a2, a3, a4, a5, a6, a7, a8);
    if (pwrite(v20, v21, 0x1000uLL, v15 << 12) != 4096)
    {
      uint64_t v10 = "writing page";
      __int16 v11 = 108;
      goto LABEL_10;
    }

    *(void *)(a1 + 144) += 4096LL;
  }

  uint64_t v34 = *(void *)(a1 + 40);
  *(void *)(v34 + 8LL * v15) = *(void *)(v34 + 8LL * a2);
  *(void *)(v34 + 8LL * a2) = 0LL;
  uint64_t v35 = *(void *)(a1 + 56);
  uint64_t v36 = *(unsigned int *)(v35 + 4LL * a2);
  *(_DWORD *)(v35 + 4LL * v15) = v36;
  *(_DWORD *)(v35 + 4LL * a2) = -1;
  if ((_DWORD)v36 != -1) {
    *(_DWORD *)(*(void *)(a1 + 48) + 4 * v36) = v15;
  }
  uint64_t v37 = *(void *)(a1 + 72);
  uint64_t v38 = *(unsigned int *)(v37 + 4LL * a2);
  *(_DWORD *)(v37 + 4LL * v15) = v38;
  *(_DWORD *)(v37 + 4LL * a2) = -1;
  uint64_t result = 0LL;
  if ((_DWORD)v38 != -1) {
    *(_DWORD *)(*(void *)(a1 + 64) + 4 * v38) = v15;
  }
  return result;
}

uint64_t cacheData( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *(_DWORD *)(a1 + 24);
  BOOL v9 = a2 >= v8;
  unsigned int v10 = a2 - v8;
  if (v9 && *(_DWORD *)(a1 + 32) > a2) {
    return *(void *)(a1 + 88) + (v10 << 12);
  }
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/ParallelPatch/PagedFile.c",  (uint64_t)"cacheData",  66,  21,  0,  "invalid cache pos",  a7,  a8,  vars0);
  return 0LL;
}

void AAPathFilterApply_cold_1(int a1, const regex_t *a2)
{
  char v2 = a1;
  OUTLINED_FUNCTION_0(a1, a2, *MEMORY[0x1895F89C0], v7, v8, v9, v10, v11, v12, v13, v14, v15);
  OUTLINED_FUNCTION_2( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathFilter.c",  (uint64_t)"prepareFilter",  130,  v3,  v4,  "compile regex (err=%i, msg=%s)",  v5,  v6,  v2);
  OUTLINED_FUNCTION_1();
}

void AAPathFilterApply_cold_2(int a1, const regex_t *a2)
{
  char v2 = a1;
  OUTLINED_FUNCTION_0(a1, a2, *MEMORY[0x1895F89C0], v7, v8, v9, v10, v11, v12, v13, v14, v15);
  OUTLINED_FUNCTION_2( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAPathFilter.c",  (uint64_t)"prepareFilter",  119,  v3,  v4,  "compile regex (err=%i, msg=%s)",  v5,  v6,  v2);
  OUTLINED_FUNCTION_1();
}

void pc_log_error_cold_1(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_186243000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "[0x%08x] %s", (uint8_t *)v2, 0x12u);
}

int BZ2_bzDecompress(bz_stream *strm)
{
  return MEMORY[0x189614148](strm);
}

int BZ2_bzDecompressEnd(bz_stream *strm)
{
  return MEMORY[0x189614150](strm);
}

int BZ2_bzDecompressInit(bz_stream *strm, int verbosity, int small)
{
  return MEMORY[0x189614158](strm, *(void *)&verbosity, *(void *)&small);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1895F8228](bytes, count);
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

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F82F8](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8300](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8308](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8318](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8320](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8328](c, data, *(void *)&len);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
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

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x189602C48](err);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x189602C68](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

SecAccessControlRef SecAccessControlCreateWithFlags( CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x18960B1C8](allocator, protection, flags, error);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x18960B3F8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x18960B400](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x18960B408](query);
}

void _Block_release(const void *aBlock)
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

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1895F8940]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A30](*(void *)&a1);
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1895F9338](flagset_d, *(void *)&flag);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1895F9378](acl_p, entry_p);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1895F9390](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1895F93A0](acl, *(void *)&entry_id, entry_p);
}

acl_t acl_get_fd_np(int fd, acl_type_t type)
{
  return (acl_t)MEMORY[0x1895F93B0](*(void *)&fd, *(void *)&type);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1895F93C0](flagset_d, *(void *)&flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x1895F93C8](obj_p, flagset_p);
}

int acl_get_permset_mask_np(acl_entry_t entry_d, acl_permset_mask_t *mask_p)
{
  return MEMORY[0x1895F93E8](entry_d, mask_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x1895F93F0](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1895F93F8](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1895F9400](*(void *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1895F9408](*(void *)&fd, acl);
}

int acl_set_permset_mask_np(acl_entry_t entry_d, acl_permset_mask_t mask)
{
  return MEMORY[0x1895F9438](entry_d, mask);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1895F9440](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1895F9448](entry_d, *(void *)&tag_type);
}

void *__cdecl bsearch( const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1895F9650](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t ccaes_ctr_crypt_mode()
{
  return MEMORY[0x1895F9778]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1895F9B10]();
}

uint64_t ccec_generate_key()
{
  return MEMORY[0x1895F9B80]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x1895F9C20]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1895F9C40]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x1895F9C50]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1895F9C58]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1895F9C68]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1895F9C90]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1895F9F08]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1895F9F28]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1895F9F30]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1895F9F38]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA118]();
}

uint64_t ccscrypt()
{
  return MEMORY[0x1895FA258]();
}

uint64_t ccscrypt_storage_size()
{
  return MEMORY[0x1895FA260]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

int chflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1895FA530](a1, *(void *)&a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FA540](a1, *(void *)&a2, *(void *)&a3);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1895FA580](a1, a2, *(void *)&a3);
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

size_t compression_encode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1896149A8](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1896149B0](*(void *)&algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1896149B8](stream);
}

uint64_t compression_stream_identify_algorithm()
{
  return MEMORY[0x1896149C8]();
}

compression_status compression_stream_init( compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1896149D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1896149E0](stream, *(void *)&flags);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FA5E8](*(void *)&a1, a2, a3);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB0](flags, block);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1895FB1D8](*(void *)&a1, *(void *)&a2);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB1F0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB278](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB298](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FB2E8](*(void *)&fd, namebuff, size, *(void *)&options);
}

uint64_t fpathconf(int a1, int a2)
{
  return MEMORY[0x1895FB358](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1895FB3C8](*(void *)&fd, name, *(void *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB418](a1, a2, a3, *(void *)&a4);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB430](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB438](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1895FB458](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1895FB4C0](*(void *)&a1, a2);
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

int getgrgid_r(gid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x1895FB560](*(void *)&a1, a2, a3, a4, a5);
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x1895FB570](a1, a2, a3, a4, a5);
}

int getpagesize(void)
{
  return MEMORY[0x1895FB608]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB668](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB678](*(void *)&a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

int issetugid(void)
{
  return MEMORY[0x1895FB870]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1895FB9A8](a1, *(void *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FB9B0](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB9B8](a1, *(void *)&a2, *(void *)&a3);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1895FB9E8](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

uint64_t lzma_code()
{
  return MEMORY[0x189615E50]();
}

uint64_t lzma_end()
{
  return MEMORY[0x189615E70]();
}

uint64_t lzma_stream_buffer_bound()
{
  return MEMORY[0x189615EB0]();
}

uint64_t lzma_stream_decoder()
{
  return MEMORY[0x189615EC0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1895FBD80](*(void *)&gid, uu);
}

int mbr_sid_to_string(const nt_sid_t *sid, char *string)
{
  return MEMORY[0x1895FBD90](sid, string);
}

int mbr_sid_to_uuid(const nt_sid_t *sid, uuid_t uu)
{
  return MEMORY[0x1895FBD98](sid, uu);
}

int mbr_string_to_sid(const char *string, nt_sid_t *sid)
{
  return MEMORY[0x1895FBDA0](string, sid);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1895FBDA8](*(void *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x1895FBDB0](uu, uid_or_gid, id_type);
}

int mbr_uuid_to_sid(const uuid_t uu, nt_sid_t *sid)
{
  return MEMORY[0x1895FBDB8](uu, sid);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1895FBF00](a1);
}

int mkfifo(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBF10](a1, a2);
}

int mkostemp(char *path, int oflags)
{
  return MEMORY[0x1895FBF20](path, *(void *)&oflags);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FBF38](a1);
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1895FC268](*(void *)&a1, a2, *(void *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int pclose(FILE *a1)
{
  return MEMORY[0x1895FC778](a1);
}

void perror(const char *a1)
{
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FC7C8](a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1895FC940](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1895FC958](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1895FC960](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x1895FC988](a1, a2);
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

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x1895FCA18](__pthread, __qos_class, __relative_priority);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1895FCA58](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
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

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

void pthread_yield_np(void)
{
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FCBA0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_r( void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
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

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1895FCC48](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCC50](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1895FCCC8](a1, a2, *(void *)&a3);
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  return MEMORY[0x1895FCCD0](*(void *)&a1, a2, a3, a4);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1895FCCD8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1895FCD80](a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FCE50](a1, a2, a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
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

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
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

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD240](a1, a2);
}

int symlinkat(const char *a1, int a2, const char *a3)
{
  return MEMORY[0x1895FD248](a1, *(void *)&a2, a3);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FD2A8](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1895FD470](*(void *)&a1, a2, *(void *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1895FD4A8](a1, a2);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

void *__cdecl valloc(size_t a1)
{
  return (void *)MEMORY[0x1895FD508](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}