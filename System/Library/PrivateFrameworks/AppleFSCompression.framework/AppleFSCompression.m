uint64_t decompressWithCallback( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8)
{
  void v9[3];
  v9[0] = a8;
  v9[1] = a1;
  v9[2] = a2;
  return sub_1862369B0((uint64_t)v9, a3, a4, a5, a6, a7, (uint64_t)a7, a8);
}

_DWORD *sub_1862305A8(char *path, int fd)
{
  if (fd == -1) {
    ssize_t v4 = getxattr(path, "com.apple.decmpfs", 0LL, 0LL, 0, 32);
  }
  else {
    ssize_t v4 = fgetxattr(fd, "com.apple.decmpfs", 0LL, 0LL, 0, 32);
  }
  size_t v12 = v4;
  if (v4 == -1)
  {
    if (*__error() != 93)
    {
      v13 = __error();
      strerror(*v13);
      sub_18623172C( @"%s:%d: getxattr(%s): %s\n",  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    }

    return 0LL;
  }

  if ((unint64_t)v4 <= 0xF)
  {
    sub_18623172C( @"%s:%d: Error: size of %s EA is too small (%zd < %zu)\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    return 0LL;
  }

  if (v4 >= 0x100000000LL)
  {
    sub_18623172C( @"%s:%d: Error: size of %s EA is too big (%zd)\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    return 0LL;
  }

  v21 = malloc(v4 + 4);
  v22 = v21 + 1;
  if (fd == -1) {
    ssize_t v23 = getxattr(path, "com.apple.decmpfs", v22, v12, 0, 32);
  }
  else {
    ssize_t v23 = fgetxattr(fd, "com.apple.decmpfs", v22, v12, 0, 32);
  }
  if (v23 != v12)
  {
    sub_18623172C( @"%s:%d: Error: size of %s EA changed\n",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    return 0LL;
  }

  _DWORD *v21 = v12;
  return v21;
}

uint64_t catFile()
{
  v0 = (const char *)MEMORY[0x1895F8858]();
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (v1 && (int v2 = sub_1862308AC(), v2 != 93))
  {
    if (v2) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    int v3 = open(v0, 0);
    if (v3 == -1)
    {
      uint64_t v14 = __error();
      strerror(*v14);
      sub_18623172C( @"%s:%d: open(%s): %s\n",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
      return 0xFFFFFFFFLL;
    }

    else
    {
      int v4 = v3;
      memset(__b, 170, sizeof(__b));
      while (1)
      {
        ssize_t v5 = read(v4, __b, 0x1000uLL);
        if (!v5) {
          break;
        }
        if (write(1, __b, v5) != v5)
        {
          uint64_t v6 = __error();
          strerror(*v6);
          sub_18623172C( @"%s:%d: write: %s\n",  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
          ssize_t v5 = 0xFFFFFFFFLL;
          break;
        }
      }

      close(v4);
    }
  }

  return v5;
}

uint64_t sub_1862308AC()
{
  v0 = (char *)MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  int v3 = v0;
  uint64_t v89 = *MEMORY[0x1895F89C0];
  int v4 = sub_1862305A8(v0, -1);
  if (v4)
  {
    uint64_t v11 = v4;
    v82[0] = 0LL;
    v82[1] = v3;
    v82[2] = v4;
    sub_1862360D4((int *)&v83, (uint64_t)v82, v5, v6, v7, v8, v9, v10);
    if (HIDWORD(v84) != 196608 && HIDWORD(v84) != 0x20000)
    {
      if (HIDWORD(v84) == 0x10000) {
        goto LABEL_5;
      }
      sub_18623172C( @"%s:%d: %s: unknown chunking scheme %llu\n",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      goto LABEL_25;
    }

    unsigned int v86 = 0;
    LOWORD(__b[3]) = -21846;
    *(void *)&__int128 v26 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __b[1] = v26;
    __b[2] = v26;
    __b[0] = v26;
    if (HIDWORD(v84) == 0x20000) {
      uint64_t v27 = 8LL * v85 + 314;
    }
    else {
      uint64_t v27 = 4LL * (v85 + 1);
    }
    uint64_t v28 = *v83;
    if (*v83)
    {
      ssize_t value = 0LL;
      uint64_t v29 = (*(uint64_t (**)(uint64_t, void, void, void, ssize_t *))(v28 + 16))( v28,  0LL,  0LL,  0LL,  &value);
      unsigned int v86 = v29;
      if ((_DWORD)v29)
      {
        uint64_t v25 = v29;
        sub_18623172C( @"%s:%d: %s: readRscData: (0, 0), returned error [%d]",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
LABEL_26:
        strerror(v25);
        sub_18623172C( @"%s:%d: validate(%s): %s\n",  v53,  v54,  v55,  v56,  v57,  v58,  v59,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
LABEL_27:
        free(v11);
        return v25;
      }

      ssize_t v37 = value;
      if (value == -1)
      {
LABEL_5:
        for (unint64_t i = 0LL; ; i += v23)
        {
          ssize_t value = 0LL;
          memset(__b, 170, sizeof(__b));
          v83 = (uint64_t *)__b;
          uint64_t v84 = 4096LL;
          uint64_t v22 = sub_1862369B0((uint64_t)v82, i, 4096LL, 1LL, &v83, &value, v20, v21);
          if ((_DWORD)v22)
          {
            uint64_t v25 = v22;
            strerror(v22);
            sub_18623172C( @"%s:%d: decompress: %s\n",  v46,  v47,  v48,  v49,  v50,  v51,  v52,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
            goto LABEL_27;
          }

          ssize_t v23 = value;
          if (!value)
          {
            uint64_t v25 = 0LL;
            goto LABEL_27;
          }

          uint64_t v24 = (*(uint64_t (**)(uint64_t, _OWORD *, ssize_t))(v2 + 16))(v2, __b, value);
          if ((_DWORD)v24) {
            break;
          }
        }

        uint64_t v25 = v24;
        goto LABEL_27;
      }
    }

    else
    {
      ssize_t v37 = getxattr((const char *)v83[1], "com.apple.ResourceFork", 0LL, 0LL, 0, 32);
      if (v37 == -1)
      {
        v38 = __error();
        strerror(*v38);
        sub_18623172C( @"%s:%d: %s: fgetxattr: %s\n",  v39,  v40,  v41,  v42,  v43,  v44,  v45,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
        uint64_t v25 = *__error();
        goto LABEL_42;
      }
    }

    if (v37 < v27)
    {
      sub_18623172C( @"%s:%d: %s: resource fork is too small (actual size: %llu < expected min size: %llu) header: (attr_size %u, compression_type %u, uncompressed_size %llu)\n",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
LABEL_25:
      uint64_t v25 = 22LL;
      goto LABEL_26;
    }

    if (HIDWORD(v84) == 0x20000)
    {
      if ((sub_1862361AC(&v83, __b, 0x32uLL, v37 - 50, (int *)&v86, v34, v35, v36) & 1) != 0)
      {
        if (memcmp(__b, &unk_186237DC0, 0x32uLL))
        {
          sub_18623172C( @"%s:%d: %s: invalid resource map\n",  v61,  v62,  v63,  v64,  v65,  v66,  v67,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
          goto LABEL_25;
        }

        LODWORD(value) = -1431655766;
        if ((sub_1862361AC(&v83, &value, 4uLL, 260LL, (int *)&v86, v65, v66, v67) & 1) != 0)
        {
          if ((_DWORD)value == v85) {
            goto LABEL_5;
          }
          sub_18623172C( @"%s:%d: %s: expected chunk count %u, found %u\n",  v75,  v76,  v77,  v78,  v79,  v80,  v81,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
          goto LABEL_37;
        }
      }
    }

    else
    {
      LODWORD(value) = -1431655766;
      if ((sub_1862361AC(&v83, &value, 4uLL, 4LL * v85, (int *)&v86, v34, v35, v36) & 1) != 0)
      {
        sub_18623172C( @"%s:%d: %s: expected size %u, found %llu\n",  v68,  v69,  v70,  v71,  v72,  v73,  v74,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
LABEL_37:
        uint64_t v25 = 22LL;
        goto LABEL_42;
      }
    }

    uint64_t v25 = v86;
LABEL_42:
    if ((_DWORD)v25) {
      goto LABEL_26;
    }
    goto LABEL_5;
  }

  return 93LL;
}

uint64_t sub_186230D08(uint64_t a1, const void *a2, size_t a3)
{
  if (write(1, a2, a3) == a3) {
    return 0LL;
  }
  int v4 = __error();
  strerror(*v4);
  sub_18623172C( @"%s:%d: write: %s\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
  return *__error();
}

uint64_t decompressFile(char *a1, int a2, int a3)
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  char v61 = 0;
  v6.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v60.st_blksize = v6;
  *(timespec *)v60.st_qspare = v6;
  v60.st_birthtimespec = v6;
  *(timespec *)&v60.st_size = v6;
  v60.st_mtimespec = v6;
  v60.st_ctimespec = v6;
  *(timespec *)&v60.st_uid = v6;
  v60.st_atimespec = v6;
  *(timespec *)&v60.st_dev = v6;
  if (stat(a1, &v60) == -1)
  {
    int v8 = *__error();
    uint64_t v17 = __error();
    strerror(*v17);
    sub_18623172C( @"%s:%d: stat %s: %s\n",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    goto LABEL_33;
  }

  if ((v60.st_flags & 0x20) == 0) {
    return 0LL;
  }
  if (!a2)
  {
    CFDataRef v7 = 0LL;
    if (a3) {
      goto LABEL_5;
    }
LABEL_10:
    v57[0] = MEMORY[0x1895F87A8];
    v57[1] = 0x40000000LL;
    v57[2] = sub_18623138C;
    v57[3] = &unk_189E37F88;
    v57[4] = a1;
    int v25 = sub_1862318B0(-1, a1, (uint64_t)a1, &v61, (uint64_t)v57);
    if (v25 != -1)
    {
      int v26 = v25;
      int v8 = 0;
      goto LABEL_12;
    }

    int v8 = *__error();
    ssize_t v37 = __error();
    strerror(*v37);
LABEL_21:
    sub_18623172C( @"%s:%d: open %s: %s\n",  v38,  v39,  v40,  v41,  v42,  v43,  v44,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
LABEL_22:
    if (!v7) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }

  CFDataRef v7 = sub_18623118C();
  if (!a3) {
    goto LABEL_10;
  }
LABEL_5:
  if (!a1 || sub_1862319CC(a1, -1, 1))
  {
    int v8 = *__error();
    uint64_t v9 = __error();
    strerror(*v9);
    sub_18623172C( @"%s:%d: unsetBsdflags %s: %s\n",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    goto LABEL_22;
  }

  uint64_t v27 = MEMORY[0x1895F87A8];
  v59[0] = MEMORY[0x1895F87A8];
  v59[1] = 0x40000000LL;
  v59[2] = sub_186231308;
  v59[3] = &unk_189E37F48;
  v59[4] = a1;
  int v28 = sub_1862318B0(-1, a1, (uint64_t)a1, &v61, (uint64_t)v59);
  if (v28 == -1)
  {
    int v8 = *__error();
    uint64_t v45 = __error();
    strerror(*v45);
    goto LABEL_21;
  }

  int v26 = v28;
  v57[5] = v27;
  v57[6] = 0x40000000LL;
  v57[7] = sub_186231314;
  v57[8] = &unk_189E37F68;
  int v58 = v28;
  v57[9] = a1;
  int v29 = sub_1862308AC();
  int v8 = v29;
  if (v29)
  {
    strerror(v29);
    sub_18623172C( @"%s:%d: Error: processFileData %s: %s\n",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    ftruncate(v26, 0LL);
    sub_1862319CC(a1, -1, 0);
  }

  else
  {
    fremovexattr(v26, "com.apple.decmpfs", 0);
    fremovexattr(v26, "com.apple.ResourceFork", 0);
  }

LABEL_12:
  fsync(v26);
  close(v26);
  v62.__darwin_time_t tv_sec = v60.st_atimespec.tv_sec;
  *(&v62.tv_usec + 1) = -1431655766;
  v62.tv_usec = SLODWORD(v60.st_atimespec.tv_nsec) / 1000;
  __darwin_time_t tv_sec = v60.st_mtimespec.tv_sec;
  int v65 = -1431655766;
  int v64 = SLODWORD(v60.st_mtimespec.tv_nsec) / 1000;
  if (v61) {
    lchmod(a1, v60.st_mode);
  }
  utimes(a1, &v62);
  if (!v7) {
    goto LABEL_27;
  }
LABEL_23:
  if (!v8)
  {
    CFDataRef v46 = sub_18623118C();
    if (!v46)
    {
      CFRelease(v7);
      int v8 = 5;
LABEL_34:
      *__error() = v8;
      return 0xFFFFFFFFLL;
    }

    CFDataRef v47 = v46;
    if (CFEqual(v7, v46))
    {
      int v8 = 0;
    }

    else
    {
      sub_18623172C( @"%s:%d: Error: decompressing %s changed its data!\n",  v48,  v49,  v50,  v51,  v52,  v53,  v54,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
      int v8 = 5;
    }

    CFRelease(v7);
    CFDataRef v55 = v47;
    goto LABEL_32;
  }

LABEL_27:
  if (!v7) {
    goto LABEL_33;
  }
  CFDataRef v55 = v7;
LABEL_32:
  CFRelease(v55);
LABEL_33:
  if (v8) {
    goto LABEL_34;
  }
  return 0LL;
}

CFDataRef sub_18623118C()
{
  v0 = (const char *)MEMORY[0x1895F8858]();
  uint64_t v27 = *MEMORY[0x1895F89C0];
  int v1 = open(v0, 0);
  *(void *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v2;
  *(_OWORD *)&c.wbuf[10] = v2;
  *(_OWORD *)&c.hash[6] = v2;
  *(_OWORD *)&c.wbuf[2] = v2;
  *(_OWORD *)c.count = v2;
  *(_OWORD *)&c.hash[2] = v2;
  *(_OWORD *)md = v2;
  __int128 v26 = v2;
  if (v1 == -1)
  {
    uint64_t v5 = __error();
    strerror(*v5);
    sub_18623172C( @"%s:%d: open %s: %s\n",  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    return 0LL;
  }

  else
  {
    int v3 = v1;
    CC_SHA256_Init(&c);
    while (1)
    {
      memset(__b, 170, sizeof(__b));
      ssize_t v4 = read(v3, __b, 0x1000uLL);
      if (!v4) {
        break;
      }
      if (v4 == -1)
      {
        uint64_t v14 = __error();
        strerror(*v14);
        sub_18623172C( @"%s:%d: read %s: %s\n",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
        CFDataRef v13 = 0LL;
        goto LABEL_9;
      }

      CC_SHA256_Update(&c, __b, v4);
    }

    CC_SHA256_Final(md, &c);
    CFDataRef v13 = CFDataCreate(0LL, md, 32LL);
LABEL_9:
    close(v3);
  }

  return v13;
}

uint64_t sub_186231308(uint64_t a1)
{
  return open(*(const char **)(a1 + 32), 258);
}

uint64_t sub_186231314(uint64_t a1, const void *a2, size_t a3)
{
  if (write(*(_DWORD *)(a1 + 40), a2, a3) == a3) {
    return 0LL;
  }
  ssize_t v4 = __error();
  strerror(*v4);
  sub_18623172C( @"%s:%d: write %s: %s\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
  return *__error();
}

uint64_t sub_18623138C(uint64_t a1)
{
  return open(*(const char **)(a1 + 32), 258);
}

uint64_t queryCompressionInfo(char *a1, uint64_t a2)
{
  if (a1 && a2) {
    return sub_1862313D0(a1, -1, a2, 0LL);
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

uint64_t sub_1862313D0(char *a1, int a2, uint64_t a3, int *a4)
{
  v8.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nseCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v42.st_blksize = v8;
  *(timespec *)v42.st_qspare = v8;
  v42.st_birthtimespeCC_SHA256_CTX c = v8;
  *(timespec *)&v42.off_t st_size = v8;
  v42.st_mtimespeCC_SHA256_CTX c = v8;
  v42.st_ctimespeCC_SHA256_CTX c = v8;
  *(timespec *)&v42.st_uid = v8;
  v42.st_atimespeCC_SHA256_CTX c = v8;
  *(timespec *)&v42.st_dev = v8;
  if (a2 == -1) {
    uint64_t result = stat(a1, &v42);
  }
  else {
    uint64_t result = fstat(a2, &v42);
  }
  if ((_DWORD)result != -1)
  {
    if (a3)
    {
      off_t st_size = v42.st_size;
      *(void *)a3 = 0LL;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = st_size;
      *(void *)(a3 + 24) = 0LL;
    }

    else
    {
      *a4 = 0;
    }

    if ((v42.st_flags & 0x20) == 0) {
      return 0LL;
    }
    uint64_t v11 = sub_1862305A8(a1, a2);
    if (v11)
    {
      uint64_t v19 = v11;
      if (v11[1] == 1668116582)
      {
        int v20 = v11[2];
        if (a4)
        {
          *a4 = v20;
        }

        else
        {
          *(_DWORD *)a3 = v20;
          uint64_t v21 = *(void *)(v19 + 3);
          *(void *)(a3 + 16) = v21;
          if (v21 != v42.st_size)
          {
            sub_18623172C( @"%s:%d: Error: Uncompressed size for path '%s' as reported by stat did not match size in disk header!\n",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
            int v20 = *(_DWORD *)a3;
          }

          int v41 = 0;
          sub_186235F58(v20, 0LL, &v41, v14, v15, v16, v17, v18);
          if (v41 == 196608 || v41 == 0x20000)
          {
            if (a2 == -1) {
              ssize_t v30 = getxattr(a1, "com.apple.ResourceFork", 0LL, 0LL, 0, 32);
            }
            else {
              ssize_t v30 = fgetxattr(a2, "com.apple.ResourceFork", 0LL, 0LL, 0, 32);
            }
            if (v30 == -1)
            {
              sub_18623172C( @"%s:%d: Error: Type %d compressed file at path '%s' did not have a resource fork\n",  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
              LODWORD(v38) = *v19;
            }

            else
            {
              uint64_t v38 = *v19;
              *(void *)(a3 + 8) = v30 + v38;
              char v39 = 2;
              if (v41 == 0x20000)
              {
                char v39 = 3;
                int v40 = 314;
              }

              else
              {
                int v40 = 4;
              }

              *(_DWORD *)(a3 + 4) = v38
                                  + v40
                                  + (((unint64_t)(*(void *)(a3 + 16) + 0xFFFFLL) >> 16) << v39);
            }

            goto LABEL_13;
          }

          if (v41 == 0x10000)
          {
            *(void *)(a3 + 8) = *v19;
            int v29 = 16;
          }

          else
          {
            if (*(_DWORD *)a3 != 5)
            {
              sub_18623172C( @"%s:%d: Error: Unknown compression scheme encountered for file '%s'\n",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
              goto LABEL_13;
            }

            *(void *)(a3 + 8) = -1LL;
            int v29 = -1;
          }

          *(_DWORD *)(a3 + 4) = v29;
        }

LABEL_13:
        free(v19);
        return 0LL;
      }

      sub_18623172C( @"%s:%d: Error: Compressed file at path '%s' had incorrect magic in disk header\n",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
      free(v19);
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t queryCompressionType(char *a1, int *a2)
{
  if (a1 && a2) {
    return sub_1862313D0(a1, -1, 0LL, a2);
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

uint64_t fqueryCompressionInfo(int a1, uint64_t a2)
{
  if ((a1 & 0x80000000) == 0 && a2) {
    return sub_1862313D0("fd", a1, a2, 0LL);
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

uint64_t fqueryCompressionType(int a1, int *a2)
{
  if ((a1 & 0x80000000) == 0 && a2) {
    return sub_1862313D0("fd", a1, 0LL, a2);
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

int *sub_18623172C( const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = *__error();
  if (qword_18C68BD88 != -1) {
    dispatch_once(&qword_18C68BD88, &unk_189E37FC8);
  }
  uint64_t v11 = CFStringCreateWithFormatAndArguments(0LL, 0LL, a1, &a9);
  if (v11)
  {
    uint64_t v12 = v11;
    CFIndex Length = CFStringGetLength(v11);
    CFIndex v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v15 = (char *)malloc(v14);
    uint64_t v16 = "failed to convert string\n";
    if (v15 && CFStringGetCString(v12, v15, v14, 0x8000100u)) {
      uint64_t v16 = v15;
    }
    CFRelease(v12);
  }

  else
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = "failed to convert string\n";
  }

  if (!byte_18C68BD80)
  {
    syslog(3, "%s", v16);
    if (!v15) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  size_t v17 = strlen(v16);
  if (v16[v17 - 1] != 10) {
    *(_WORD *)&v16[v17] = 10;
  }
  fputs(v16, (FILE *)*MEMORY[0x1895F89D0]);
  if (v15) {
LABEL_13:
  }
    free(v15);
LABEL_14:
  uint64_t result = __error();
  *uint64_t result = v10;
  return result;
}

uint64_t sub_186231888()
{
  uint64_t result = isatty(2);
  byte_18C68BD80 = (_DWORD)result != 0;
  return result;
}

uint64_t sub_1862318B0(int a1, const char *a2, uint64_t a3, _BYTE *a4, uint64_t a5)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
  if ((_DWORD)result == -1)
  {
    if (*__error() == 13)
    {
      if (a2)
      {
        if (lchmod(a2, 0x180u) == -1)
        {
          int v10 = __error();
          strerror(*v10);
          sub_18623172C( @"%s:%d: lchmod %s (%s): %s\n",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/commonUtilsUser.c");
          return 0xFFFFFFFFLL;
        }
      }

      else if (fchmod(a1, 0x180u) == -1)
      {
        uint64_t v18 = __error();
        strerror(*v18);
        sub_18623172C( @"%s:%d: fchmod %s: %s\n",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/commonUtilsUser.c");
        return 0xFFFFFFFFLL;
      }

      *a4 = 1;
      return (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_1862319CC(char *a1, int a2, int a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  int v14 = -1431655766;
  v5.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nseCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v12.st_blksize = v5;
  *(timespec *)v12.st_qspare = v5;
  v12.st_birthtimespeCC_SHA256_CTX c = v5;
  *(timespec *)&v12.off_t st_size = v5;
  v12.st_mtimespeCC_SHA256_CTX c = v5;
  v12.st_ctimespeCC_SHA256_CTX c = v5;
  *(timespec *)&v12.st_uid = v5;
  v12.st_atimespeCC_SHA256_CTX c = v5;
  int v6 = 32 * (a3 == 0);
  int v7 = 4;
  *(timespec *)&v12.st_dev = v5;
  while (a2 != -1)
  {
    if (fstat(a2, &v12)) {
      goto LABEL_16;
    }
LABEL_6:
    LODWORD(v13) = v12.st_flags;
    HIDWORD(v13) = v12.st_flags & 0xFFFFFFDF | v6;
    int v14 = -1;
    if (a2 == -1) {
      uint64_t v8 = fsctl(a1, 0xC00C4114uLL, &v13, 0);
    }
    else {
      uint64_t v8 = ffsctl(a2, 0xC00C4114uLL, &v13, 0);
    }
    uint64_t v9 = v8;
    if ((_DWORD)v8)
    {
      if ((v8 & 0x80000000) != 0 && *__error() != 35) {
        return v9;
      }
    }

    else if (v12.st_flags == v14)
    {
      return 0LL;
    }

    if (!--v7) {
      goto LABEL_17;
    }
  }

  if (!stat(a1, &v12)) {
    goto LABEL_6;
  }
LABEL_16:
  uint64_t v9 = *__error();
LABEL_17:
  if (v12.st_flags == v14) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = 35LL;
  }
  if (!(_DWORD)v9) {
    return v10;
  }
  return v9;
}

void *CreateStreamCompressorQueueWithOptions(const __CFDictionary *a1)
{
  uint64_t v123 = *MEMORY[0x1895F89C0];
  __int128 v2 = calloc(1uLL, 0x60uLL);
  *(void *)__int128 v2 = dispatch_group_create();
  *((_BYTE *)v2 + 13) = sub_186232290(a1, @"IgnoreXattrErrors", 0LL, v3, v4, v5, v6, v7);
  *((_BYTE *)v2 + 14) = sub_186232290(a1, @"AllowStoringDataInXattr", 1LL, v8, v9, v10, v11, v12);
  *((_DWORD *)v2 + 9) = sub_18623233C(a1, @"CompressionLevel", 5LL);
  int v13 = sub_18623233C(a1, @"MaxCompressionPercentage", 80LL);
  *((_DWORD *)v2 + 5) = v13;
  if ((v13 - 101) <= 0xFFFFFF9B)
  {
    sub_18623172C( @"%s:%d: Error: compression ratio needs to be between 1 and 100\n",  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
    goto LABEL_50;
  }

  if (a1)
  {
    Value = CFDictionaryGetValue(a1, @"CompressionRules");
    uint64_t v22 = CFDictionaryGetValue(a1, @"SystemCompressionRules");
    if (Value)
    {
      CFTypeID v23 = CFGetTypeID(Value);
      if (v23 != CFArrayGetTypeID()) {
        goto LABEL_49;
      }
      Value = CFRetain(Value);
    }

    if (v22)
    {
      CFTypeID v31 = CFGetTypeID(v22);
      if (v31 == CFArrayGetTypeID())
      {
        CFTypeRef v32 = CFRetain(v22);
        goto LABEL_27;
      }

LABEL_49:
      *((void *)v2 + 10) = 0LL;
      sub_18623172C( @"%s:%d: Error: _InitCompressionRules failed (malformed plist?)\n",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      goto LABEL_50;
    }
  }

  else
  {
    Value = 0LL;
  }

  uint64_t v33 = CFURLCreateFromFileSystemRepresentation( 0LL,  (const UInt8 *)"/System/Library/PrivateFrameworks/AppleFSCompression.framework",  62LL,  1u);
  if (!v33) {
    goto LABEL_49;
  }
  uint64_t v34 = v33;
  uint64_t v35 = CFBundleCreate(0LL, v33);
  if (!v35 || (uint64_t v36 = CFBundleCopyResourceURL(v35, @"SystemCompressionRules", @"plist", 0LL)) == 0LL)
  {
    CFTypeRef v32 = 0LL;
    int v41 = v34;
LABEL_25:
    CFRelease(v41);
    goto LABEL_26;
  }

  uint64_t v37 = v36;
  uint64_t v38 = CFReadStreamCreateWithFile(0LL, v36);
  char v39 = v38;
  if (v38 && CFReadStreamOpen(v38))
  {
    int v40 = (const __CFURL *)CFPropertyListCreateWithStream(0LL, v39, 0LL, 0LL, 0LL, 0LL);
    int v41 = v40;
    if (v40 && (CFTypeID v42 = CFGetTypeID(v40), v42 == CFArrayGetTypeID())) {
      CFTypeRef v32 = CFRetain(v41);
    }
    else {
      CFTypeRef v32 = 0LL;
    }
  }

  else
  {
    CFTypeRef v32 = 0LL;
    int v41 = 0LL;
  }

  CFRelease(v34);
  CFRelease(v37);
  if (v39)
  {
    CFReadStreamClose(v39);
    CFRelease(v39);
  }

  if (v41) {
    goto LABEL_25;
  }
LABEL_26:
  if (!v32) {
    goto LABEL_49;
  }
LABEL_27:
  uint64_t v43 = malloc(0x10uLL);
  if (!v43)
  {
    if (Value) {
      CFRelease(Value);
    }
    if (v32) {
      CFRelease(v32);
    }
    goto LABEL_49;
  }

  *uint64_t v43 = Value;
  v43[1] = v32;
  *((void *)v2 + 10) = v43;
  *((_DWORD *)v2 + 16) = 0;
  if (!a1) {
    goto LABEL_59;
  }
  uint64_t v44 = (const __CFArray *)CFDictionaryGetValue(a1, @"SkipMachOFileTypes");
  if (!v44)
  {
LABEL_53:
    if (*((_DWORD *)v2 + 16))
    {
LABEL_54:
      uint64_t v71 = (const __CFArray *)CFDictionaryGetValue(a1, @"SkipMachOOverridePaths");
      if (v71)
      {
        uint64_t v72 = v71;
        CFTypeID v73 = CFGetTypeID(v71);
        if (v73 == CFArrayGetTypeID())
        {
          CFIndex Count = CFArrayGetCount(v72);
          uint64_t v75 = MEMORY[0x1895F8858]();
          uint64_t v77 = (const void **)&v121[-((v76 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
          if (v75) {
            memset(&v121[-((v76 + 15) & 0xFFFFFFFFFFFFFFF0LL)], 170, v76);
          }
          v124.location = 0LL;
          v124.length = Count;
          CFArrayGetValues(v72, v124, v77);
          *((void *)v2 + 9) = CFSetCreate(0LL, v77, Count, MEMORY[0x189605258]);
        }
      }
    }

LABEL_59:
    if (sub_186232290(a1, @"AFSCThrottledIO", 0LL, v26, v27, v28, v29, v30))
    {
      *((void *)v2 + 5) = dispatch_get_global_queue(-32768LL, 0LL);
    }

    else
    {
      int v78 = sub_18623233C(a1, @"DispatchQueuePriority", 2LL);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(v78, 0LL);
      *((void *)v2 + 5) = global_queue;
      if (!global_queue)
      {
        sub_18623172C( @"%s:%d: Error: invalid kAFSCDispatchQueuePriority value %d\n",  v80,  v81,  v82,  v83,  v84,  v85,  v86,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
        goto LABEL_50;
      }
    }

    dispatch_queue_t v87 = dispatch_queue_create("ioqueue", 0LL);
    *((void *)v2 + 6) = v87;
    dispatch_set_target_queue(v87, *((dispatch_queue_t *)v2 + 5));
    dispatch_queue_t v88 = dispatch_queue_create("borrowed buffer queue", 0LL);
    *((void *)v2 + 7) = v88;
    dispatch_set_target_queue(v88, *((dispatch_queue_t *)v2 + 5));
    *((_DWORD *)v2 + 4) = 0;
    unsigned int valuePtr = 0;
    if (!a1) {
      goto LABEL_76;
    }
    v94 = (const __CFNumber *)CFDictionaryGetValue(a1, @"CompressionTypes");
    if (v94)
    {
      v95 = v94;
      CFTypeID v96 = CFGetTypeID(v94);
      if (v96 == CFNumberGetTypeID())
      {
        if (CFNumberGetValue(v95, kCFNumberIntType, &valuePtr))
        {
          SInt32 IntValue = valuePtr;
          goto LABEL_70;
        }

        sub_18623172C( @"%s:%d: Error: value %@ for %@ could not be parsed\n",  v97,  v98,  v99,  v100,  v101,  v102,  v103,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      }

      else
      {
        CFTypeID v105 = CFGetTypeID(v95);
        if (v105 == CFStringGetTypeID())
        {
          SInt32 IntValue = CFStringGetIntValue((CFStringRef)v95);
          unsigned int valuePtr = IntValue;
LABEL_70:
          if (sub_186235F58(IntValue, (int *)v2 + 6, (_DWORD *)v2 + 7, v99, v100, v101, v102, v103))
          {
            unsigned int v113 = valuePtr;
            if (*((_DWORD *)v2 + 7) != 0x10000)
            {
              *((_DWORD *)v2 + 4) = valuePtr;
              if (v113) {
                goto LABEL_77;
              }
              goto LABEL_76;
            }

            *((_DWORD *)v2 + 4) = valuePtr + 1;
            sub_186235F58(v113 + 1, (int *)v2 + 6, (_DWORD *)v2 + 7, v89, v90, v91, v92, v93);
            sub_18623172C( @"%s:%d: Error: shouldn't use compressor type %d since it is a single chunk compressor, using %d instead\n",  v114,  v115,  v116,  v117,  v118,  v119,  v120,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
          }

          goto LABEL_75;
        }

        sub_18623172C( @"%s:%d: Error: value for %@ is not a string or number\n",  v106,  v107,  v108,  v109,  v110,  v111,  v112,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      }
    }

LABEL_75:
    if (*((_DWORD *)v2 + 4))
    {
LABEL_77:
      *((_BYTE *)v2 + 32) = *((_DWORD *)v2 + 6);
      *((_BYTE *)v2 + 88) = sub_186232290(a1, @"Synchronous", 0LL, v89, v90, v91, v92, v93);
      return v2;
    }

LABEL_76:
    *((_DWORD *)v2 + 4) = 8;
    sub_186235F58(8, (int *)v2 + 6, (_DWORD *)v2 + 7, v89, v90, v91, v92, v93);
    goto LABEL_77;
  }

  uint64_t v45 = v44;
  CFTypeID v46 = CFGetTypeID(v44);
  if (v46 != CFArrayGetTypeID())
  {
    sub_18623172C( @"%s:%d: Error: SkipMachOFileTypes value is not an array\n",  v47,  v48,  v49,  v50,  v51,  v52,  v53,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
    goto LABEL_53;
  }

  CFIndex v54 = CFArrayGetCount(v45);
  if (v54 < 1) {
    goto LABEL_53;
  }
  CFIndex v55 = v54;
  CFIndex v56 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v45, v56);
    if (!ValueAtIndex) {
      goto LABEL_43;
    }
    int v58 = ValueAtIndex;
    unsigned int valuePtr = 0;
    CFTypeID v59 = CFGetTypeID(ValueAtIndex);
    if (v59 != CFNumberGetTypeID()) {
      break;
    }
    CFNumberGetValue(v58, kCFNumberSInt32Type, &valuePtr);
    unsigned int v62 = valuePtr;
LABEL_40:
    if (v62 == -1)
    {
      *((_DWORD *)v2 + 16) = -1;
      goto LABEL_54;
    }

    if (v62 - 1 >= 0x1F)
    {
      sub_18623172C( @"%s:%d: Error: invalid item '%@' at index %ld in SkipMachOFileTypes dictionary\n",  v60,  v61,  v26,  v27,  v28,  v29,  v30,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      goto LABEL_50;
    }

    *((_DWORD *)v2 + 16) |= 1 << v62;
LABEL_43:
    if (v55 == ++v56) {
      goto LABEL_53;
    }
  }

  if (v59 == CFStringGetTypeID())
  {
    if (qword_18C68BD98 != -1) {
      dispatch_once(&qword_18C68BD98, &unk_189E38008);
    }
    unsigned int v62 = CFDictionaryGetValue((CFDictionaryRef)qword_18C68BD90, v58);
    unsigned int valuePtr = v62;
    goto LABEL_40;
  }

  sub_18623172C( @"%s:%d: Error: SkipMachOFileTypes value at index %lu is not a number or string\n",  v63,  v64,  v65,  v66,  v67,  v68,  v69,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
LABEL_50:
  FinishStreamCompressorQueue((uint64_t)v2);
  return 0LL;
}

uint64_t sub_186232290( const __CFDictionary *Value, void *key, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a3;
  if (Value) {
    Value = (const __CFDictionary *)CFDictionaryGetValue(Value, key);
  }
  if (Value == (const __CFDictionary *)*MEMORY[0x189604DE8]) {
    return 1LL;
  }
  if (Value == (const __CFDictionary *)*MEMORY[0x189604DE0]) {
    return 0LL;
  }
  if (Value) {
    sub_18623172C( @"%s:%d: Error: value for %@ is not a BOOLean, using default value (%s)\n",  (uint64_t)key,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
  }
  return v8;
}

uint64_t sub_18623233C(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (a1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      uint64_t v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        unsigned int valuePtr = -1431655766;
        if (CFNumberGetValue(v5, kCFNumberIntType, &valuePtr)) {
          return valuePtr;
        }
        else {
          sub_18623172C( @"%s:%d: Error: invalid %@ value %@, assuming %d\n",  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
        }
      }

      else
      {
        sub_18623172C( @"%s:%d: Error: value for %@ is not a number, assuming %d\n",  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      }
    }
  }

  return a3;
}

uint64_t FinishStreamCompressorQueue(uint64_t a1)
{
  uint64_t v2 = DrainStreamCompressorQueue(a1);
  int v3 = *__error();
  if (a1)
  {
    if (*(void *)a1) {
      dispatch_release(*(dispatch_object_t *)a1);
    }
    uint64_t v4 = *(dispatch_object_s **)(a1 + 48);
    if (v4) {
      dispatch_release(v4);
    }
    uint64_t v5 = *(dispatch_object_s **)(a1 + 56);
    if (v5) {
      dispatch_release(v5);
    }
    CFTypeID v6 = *(const void **)(a1 + 72);
    if (v6) {
      CFRelease(v6);
    }
    uint64_t v7 = *(void *)(a1 + 80);
    if (v7)
    {
      uint64_t v8 = *(const void **)(v7 + 8);
      if (v8) {
        CFRelease(v8);
      }
      if (*(void *)v7) {
        CFRelease(*(CFTypeRef *)v7);
      }
      free((void *)v7);
    }

    free((void *)a1);
  }

  *__error() = v3;
  return v2;
}

uint64_t DrainStreamCompressorQueue(uint64_t a1)
{
  if (!a1)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

  dispatch_group_wait(*(dispatch_group_t *)a1, 0xFFFFFFFFFFFFFFFFLL);
  if (*(_DWORD *)(a1 + 8))
  {
    strerror(*(_DWORD *)(a1 + 8));
    sub_18623172C( @"%s:%d: Error: returning errno %d (%s) from DrainStreamCompressorQueue\n",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
    int v9 = *(_DWORD *)(a1 + 8);
    *__error() = v9;
    *(_DWORD *)(a1 + 8) = 0;
    return 0xFFFFFFFFLL;
  }

  return 0LL;
}

void sub_186232538()
{
  qword_18C68BD90 = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], 0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"*", (const void *)0xFFFFFFFFFFFFFFFFLL);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_OBJECT", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_EXECUTE", (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_FVMLIB", (const void *)3);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_CORE", (const void *)4);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_PRELOAD", (const void *)5);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_DYLIB", (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_DYLINKER", (const void *)7);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_BUNDLE", (const void *)8);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_DYLIB_STUB", (const void *)9);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_DSYM", (const void *)0xA);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_18C68BD90, @"MH_KEXT_BUNDLE", (const void *)0xB);
}

void *CreateStreamCompressorQueue()
{
  return CreateStreamCompressorQueueWithOptions(0LL);
}

_BYTE *CreateCompressionQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t result = CreateStreamCompressorQueueWithOptions(a5);
  if (result) {
    result[12] = 1;
  }
  return result;
}

BOOL CompressFile(uint64_t a1, char *a2, char *a3)
{
  if (qword_18C68BDD8 != -1) {
    dispatch_once(&qword_18C68BDD8, &unk_189E385B8);
  }
  v6.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nseCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v63.st_blksize = v6;
  *(timespec *)v63.st_qspare = v6;
  v63.st_birthtimespeCC_SHA256_CTX c = v6;
  *(timespec *)&v63.off_t st_size = v6;
  v63.st_mtimespeCC_SHA256_CTX c = v6;
  v63.st_ctimespeCC_SHA256_CTX c = v6;
  *(timespec *)&v63.st_uid = v6;
  v63.st_atimespeCC_SHA256_CTX c = v6;
  *(timespec *)&v63.st_dev = v6;
  uint64_t v7 = (dispatch_semaphore_s *)qword_18C68BDE0;
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_18C68BDE0, 0xFFFFFFFFFFFFFFFFLL);
  int v8 = open(a2, 2);
  if (v8 == -1)
  {
    CFTypeID v31 = __error();
    strerror(*v31);
    sub_18623172C( @"%s:%d: open '%s': %s\n",  v32,  v33,  v34,  v35,  v36,  v37,  v38,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
    BOOL v11 = 0LL;
  }

  else
  {
    int v9 = v8;
    int v10 = fstat(v8, &v63);
    BOOL v11 = v10 != -1;
    if (v10 == -1)
    {
      char v39 = __error();
      strerror(*v39);
      sub_18623172C( @"%s:%d: open '%s': %s\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
    }

    else
    {
      uint64_t StreamCompressor = CreateStreamCompressor(v9, a2, a3, a1, v63.st_size);
      if (StreamCompressor)
      {
        uint64_t v13 = StreamCompressor;
        int v14 = *(_DWORD *)(StreamCompressor + 244);
        uint64_t v15 = malloc(0x10000uLL);
        off_t v16 = 0LL;
        while (v16 < v63.st_size)
        {
          ssize_t v17 = pread(v14, v15, 0x10000uLL, v16);
          if (!v17) {
            break;
          }
          if (v17 == -1)
          {
            uint64_t v47 = __error();
            strerror(*v47);
            sub_18623172C( @"%s:%d: pread(%s): %s\n",  v48,  v49,  v50,  v51,  v52,  v53,  v54,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
            break;
          }

          v16 += v17;
          if (WriteToStreamCompressor(v13, (uint64_t)v15, v17, v18, v19, v20, v21, v22) != v17)
          {
            if (*__error() != 28)
            {
              CFTypeID v23 = __error();
              strerror(*v23);
              sub_18623172C( @"%s:%d: WriteToStreamCompressor(%s): %s\n",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
            }

            break;
          }
        }

        free(v15);
        CloseStreamCompressor(v13, v55, v56, v57, v58, v59, v60, v61);
      }
    }

    close(v9);
  }

  dispatch_semaphore_signal(v7);
  return v11;
}

int *FinishCompressionAndCleanUp(uint64_t a1)
{
  uint64_t result = (int *)FinishStreamCompressorQueue(a1);
  if ((_DWORD)result)
  {
    uint64_t v2 = __error();
    strerror(*v2);
    return sub_18623172C( @"%s:%d: FinishStreamCompressorQueue: %s\n",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
  }

  return result;
}

const char *sub_18623290C(const char *a1, char *__s, _BYTE *a3)
{
  uint64_t v3 = a1;
  *a3 = 0;
  if (a1)
  {
    if (__s)
    {
      if (*a1)
      {
        if (*__s)
        {
          size_t v6 = strlen(__s);
          if (!strncmp(v3, __s, v6))
          {
            uint64_t v7 = &v3[v6];
            if (v3[v6])
            {
              if (v3[v6] == 47)
              {
                do
                  int v8 = *(unsigned __int8 *)++v7;
                while (v8 == 47);
              }

              else if (*(v7 - 1) != 47)
              {
                return v3;
              }

              uint64_t v3 = v7 - 1;
              if (!strncmp(v7 - 1, "/./", 3uLL)) {
                uint64_t v3 = v7 + 1;
              }
              *a3 = 1;
            }
          }
        }
      }
    }
  }

  return v3;
}

BOOL sub_1862329D0(int a1, CFArrayRef theArray, int a3, _BYTE *a4, void *a5)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count < 1) {
    return 1;
  }
  CFIndex v8 = Count;
  BOOL v9 = 0;
  CFIndex v10 = 0LL;
  if (a3) {
    int v11 = 0;
  }
  else {
    int v11 = 2;
  }
  if (a3) {
    int v12 = 3;
  }
  else {
    int v12 = 1;
  }
  unsigned int v31 = v12;
  unsigned int v32 = v11;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v10);
    if (!ValueAtIndex || (int v14 = ValueAtIndex, v15 = CFGetTypeID(ValueAtIndex), v15 != CFDictionaryGetTypeID()))
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "Rule at index %llu was not a dictionary\n");
      return v9;
    }

    Value = (const __CFString *)CFDictionaryGetValue(v14, @"RuleType");
    ssize_t v17 = CFDictionaryGetValue(v14, @"Flags");
    uint64_t v18 = CFDictionaryGetValue(v14, @"InverseFlags");
    uint64_t v19 = v18;
    uint64_t v35 = 0LL;
    uint64_t valuePtr = 0LL;
    if (!Value && !v17 && !v18)
    {
      uint64_t v29 = "None of the keys 'RuleType', 'Flags', or 'InverseFlags' were found while evaluating compression rule at index %llu\n";
      goto LABEL_48;
    }

    int v20 = *a4 != 0;
    if (!Value) {
      goto LABEL_19;
    }
    CFTypeID v21 = CFGetTypeID(Value);
    if (v21 != CFStringGetTypeID())
    {
      uint64_t v29 = "Key 'RuleType' was not a string while evaluating compression rule at index %llu\n";
      goto LABEL_48;
    }

    if (CFStringCompare(Value, @"Exclude", 0LL))
    {
      if (CFStringCompare(Value, @"Include", 0LL))
      {
        uint64_t v29 = "Invalid value found for key 'RuleType' while evaluating compression rule at index %llu\n";
        goto LABEL_48;
      }

      int v20 = 1;
LABEL_19:
      if (!v17) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }

    int v20 = 0;
    if (!v17) {
      goto LABEL_22;
    }
LABEL_20:
    CFTypeID v22 = CFGetTypeID(v17);
    if (v22 != CFNumberGetTypeID() || !CFNumberGetValue((CFNumberRef)v17, kCFNumberSInt64Type, &valuePtr))
    {
      uint64_t v29 = "Key 'Flags' was not a number while evaluating compression rule at index %llu\n";
      goto LABEL_48;
    }

LABEL_22:
    if (v19)
    {
      CFTypeID v23 = CFGetTypeID(v19);
      if (v23 != CFNumberGetTypeID() || !CFNumberGetValue((CFNumberRef)v19, kCFNumberSInt64Type, &v35))
      {
        uint64_t v29 = "Key 'InverseFlags' was not a number while evaluating compression rule at index %llu\n";
        goto LABEL_48;
      }
    }

    BOOL v9 = ++v10 >= v8;
    if (v8 == v10) {
      return v9;
    }
  }

  uint64_t v24 = CFDictionaryGetValue(v14, @"PathEndsWithString");
  if (v24)
  {
    uint64_t v25 = v24;
    unsigned int v26 = 1u;
    goto LABEL_36;
  }

  uint64_t v25 = CFDictionaryGetValue(v14, @"PathBeginsWithString");
  unsigned int v26 = v32;
  if (v25) {
    goto LABEL_36;
  }
  uint64_t v27 = CFDictionaryGetValue(v14, @"PathContainsString");
  if (v27)
  {
    uint64_t v25 = v27;
    unsigned int v26 = 2u;
    goto LABEL_36;
  }

  uint64_t v25 = CFDictionaryGetValue(v14, @"PathExactlyEqualsString");
  unsigned int v26 = v31;
  if (v25)
  {
LABEL_36:
    CFTypeID v28 = CFGetTypeID(v25);
    if (v28 == CFStringGetTypeID()) {
      __asm { BR              X9 }
    }

    uint64_t v29 = "A path match key had a value that was not a string, while evaluating compression rule at index %llu\n";
  }

  else
  {
    uint64_t v29 = "String to match against not found while evaluating compression rule at index %llu\n";
  }

LABEL_48:
  fprintf((FILE *)*MEMORY[0x1895F89D0], v29, v10);
  return v9;
}

    v14 += v20;
    v15 += v20;
    v13 -= v20;
  }

  while (v13);
  uint64_t v35 = *(void *)(a1 + 160);
  uint64_t v36 = *(unsigned __int8 *)(v35 + 12);
  uint64_t v37 = (unsigned int *)(v35 + 8);
  if (v36) {
    uint64_t v37 = (unsigned int *)(a1 + 240);
  }
  int v12 = *v37;
  if (*v37)
  {
LABEL_52:
    sub_18623365C((int *)a1, v12);
    sub_186233A70(a1, 3, v38, v39, v40, v41, v42, v43);
    goto LABEL_53;
  }

  return v14;
}

void sub_186232D84( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 321)) {
    sub_186232F7C(a1, "scheduling %s task after finish", a3, a4, a5, a6, a7, a8, (char)off_189E380D8[a2]);
  }
  if (*(_DWORD *)(a1 + 168) != -208193560 || *(_DWORD *)(a1 + 236) != -208193560) {
    sub_186232F7C( a1,  "magic numbers have been clobbered (0x%08x 0x%08x)",  a3,  a4,  a5,  a6,  a7,  a8,  *(_DWORD *)(a1 + 168));
  }
  int v12 = (dispatch_queue_s *)a3;
  if (a3)
  {
    if (a2) {
      goto LABEL_13;
    }
  }

  else
  {
    int v12 = *(dispatch_queue_s **)(a1 + 8LL * a2 + 176);
    if (a2) {
      goto LABEL_13;
    }
  }

  if (*(_BYTE *)(a1 + 232)) {
    sub_186232F7C(a1, "scheduling %s task after compression finished", a3, a4, a5, a6, a7, a8, (char)"compression");
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 224));
LABEL_13:
  uint64_t v13 = *(void *)(a1 + 160);
  int v14 = *(dispatch_group_s **)(a1 + 216);
  uint64_t v15 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 1107296256LL;
  v25[2] = sub_1862330B0;
  v25[3] = &unk_189E38100;
  unsigned int v26 = a2;
  v25[4] = a4;
  v25[5] = a1;
  off_t v16 = sub_18623317C();
  ssize_t v17 = v16;
  if (*(_BYTE *)(v13 + 88))
  {
    if (qword_18C68BDA8 != -1) {
      dispatch_once(&qword_18C68BDA8, &unk_189E384E0);
    }
    pthread_setspecific(qword_18C68BDB0, v17);
    sub_1862330B0((uint64_t)v25, v18, v19, v20, v21, v22, v23, v24);
    if (qword_18C68BDA8 != -1) {
      dispatch_once(&qword_18C68BDA8, &unk_189E384E0);
    }
    pthread_setspecific(qword_18C68BDB0, 0LL);
    CFRelease(v17);
  }

  else
  {
    block[0] = v15;
    block[1] = 1107296256LL;
    block[2] = sub_186233278;
    block[3] = &unk_189E38490;
    block[4] = v25;
    block[5] = v16;
    dispatch_group_async(v14, v12, block);
  }
}

void sub_186232F7C( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v46[0] = 0LL;
  v46[1] = &a9;
  vasprintf(v46, a2, &a9);
  uint64_t v44 = a1;
  uint64_t v45 = v46[0];
  uint64_t v43 = 510LL;
  sub_18623172C( @"%s:%d: Error: StreamCompressor %p %s. PLEASE FILE A BUG AGAINST AppleFSCompression/X",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  ssize_t v17 = sub_18623317C();
  CFIndex Count = CFArrayGetCount(v17);
  Mutable = CFStringCreateMutable(0LL, 0LL);
  if (Count >= 1)
  {
    for (CFIndex i = 0LL; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v17, i);
      CFStringAppendFormat(Mutable, 0LL, @"%p ", ValueAtIndex, v43, v44, v45);
    }
  }

  CFRelease(v17);
  sub_18623172C( @"%s:%d: Error: StreamCompressor %p stack: %@",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  dispatch_queue_get_label(0LL);
  sub_18623172C( @"%s:%d: Error: StreamCompressor %p queue: %s",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  sub_18623172C( @"%s:%d: Error: StreamCompressor %p path: %s",  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  if (Mutable) {
    CFRelease(Mutable);
  }
  free(v46[0]);
  abort();
}

void sub_1862330B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(unsigned int *)(a1 + 48);
  if (*(_BYTE *)(v8 + 321)) {
    sub_186232F7C(v8, "running %s task after finish", a3, a4, a5, a6, a7, a8, (char)off_189E380D8[v9]);
  }
  if (!(_DWORD)v9 && *(_BYTE *)(v8 + 232)) {
    sub_186232F7C(v8, "running %s task after compression finished", a3, a4, a5, a6, a7, a8, (char)"compression");
  }
  if (*(_DWORD *)(v8 + 168) != -208193560 || *(_DWORD *)(v8 + 236) != -208193560) {
    sub_186232F7C( v8,  "magic numbers have been clobbered (0x%08x 0x%08x)",  a3,  a4,  a5,  a6,  a7,  a8,  *(_DWORD *)(v8 + 168));
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (!*(_DWORD *)(a1 + 48)) {
    dispatch_group_leave(*(dispatch_group_t *)(v8 + 224));
  }
}

__CFArray *sub_18623317C()
{
  __b[100] = *(void **)MEMORY[0x1895F89C0];
  if (qword_18C68BDA8 != -1) {
    dispatch_once(&qword_18C68BDA8, &unk_189E384E0);
  }
  v0 = (const __CFArray *)pthread_getspecific(qword_18C68BDB0);
  if (v0) {
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, v0);
  }
  else {
    CFMutableArrayRef MutableCopy = CFArrayCreateMutable(0LL, 0LL, 0LL);
  }
  uint64_t v2 = MutableCopy;
  memset(__b, 170, 0x320uLL);
  int v3 = backtrace(__b, 100);
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (const void **)__b;
    do
    {
      size_t v6 = *v5++;
      CFArrayAppendValue(v2, v6);
      --v4;
    }

    while (v4);
  }

  CFArrayAppendValue(v2, 0LL);
  return v2;
}

void sub_186233278(uint64_t a1)
{
  if (qword_18C68BDA8 != -1) {
    dispatch_once(&qword_18C68BDA8, &unk_189E384E0);
  }
  pthread_setspecific(qword_18C68BDB0, *(const void **)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (qword_18C68BDA8 != -1) {
    dispatch_once(&qword_18C68BDA8, &unk_189E384E0);
  }
  pthread_setspecific(qword_18C68BDB0, 0LL);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_186233314(uint64_t a1, uint64_t a2)
{
}

void sub_186233324(uint64_t a1)
{
}

uint64_t sub_186233330()
{
  return pthread_key_create((pthread_key_t *)&qword_18C68BDB0, 0LL);
}

uint64_t sub_186233340(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v4 = MEMORY[0x1895F87A8];
  uint64_t v5 = 0x40000000LL;
  size_t v6 = sub_186233464;
  uint64_t v7 = &unk_189E38130;
  uint64_t v8 = v1;
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
}

uint64_t sub_18623339C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  dispatch_suspend(*(dispatch_object_t *)(a1 + 48));
  size_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = malloc(v3);
  if (!v4) {
    sub_186232F7C(v2, "allocating buffer of size %zu failed", v5, v6, v7, v8, v9, v10, v3);
  }
  uint64_t v11 = v4;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v15 = MEMORY[0x1895F87A8];
  uint64_t v16 = 0x40000000LL;
  ssize_t v17 = sub_18623343C;
  uint64_t v18 = &unk_189E38180;
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v19 = v11;
  uint64_t v20 = v13;
  return (*(uint64_t (**)(void))(v12 + 16))();
}

void sub_18623343C(uint64_t a1)
{
}

void *sub_186233464(uint64_t a1)
{
  return sub_186236F20(*(void **)(a1 + 32));
}

void sub_18623346C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  *(_BYTE *)(v1 + 232) = 1;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 216));
}

void sub_1862334A0(uint64_t a1, dispatch_group_s *a2, dispatch_queue_s *a3, uint64_t a4)
{
  uint64_t v8 = sub_18623317C();
  uint64_t v9 = v8;
  if (*(_BYTE *)(a1 + 88))
  {
    if (qword_18C68BDA8 != -1) {
      dispatch_once(&qword_18C68BDA8, &unk_189E384E0);
    }
    pthread_setspecific(qword_18C68BDB0, v9);
    (*(void (**)(uint64_t))(a4 + 16))(a4);
    if (qword_18C68BDA8 != -1) {
      dispatch_once(&qword_18C68BDA8, &unk_189E384E0);
    }
    pthread_setspecific(qword_18C68BDB0, 0LL);
    CFRelease(v9);
  }

  else
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 1107296256LL;
    v10[2] = sub_1862335C0;
    v10[3] = &unk_189E38500;
    v10[4] = a4;
    v10[5] = v8;
    dispatch_group_notify(a2, a3, v10);
  }

void sub_1862335C0(uint64_t a1)
{
  if (qword_18C68BDA8 != -1) {
    dispatch_once(&qword_18C68BDA8, &unk_189E384E0);
  }
  pthread_setspecific(qword_18C68BDB0, *(const void **)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (qword_18C68BDA8 != -1) {
    dispatch_once(&qword_18C68BDA8, &unk_189E384E0);
  }
  pthread_setspecific(qword_18C68BDB0, 0LL);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

int *sub_18623365C(int *result, unsigned int a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t v2 = *((void *)result + 20);
    if (*(_BYTE *)(v2 + 12))
    {
      size_t v3 = (unsigned int *)(result + 60);
      while (!__ldxr(v3))
      {
        if (!__stxr(a2, v3))
        {
          *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
          __int128 v24 = v5;
          __int128 v25 = v5;
          __int128 v22 = v5;
          __int128 v23 = v5;
          *(_OWORD *)uint64_t v21 = v5;
          backtrace(v21, 10);
          uint64_t v6 = __error();
          strerror(*v6);
          uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp";
          uint64_t v15 = @"%s:%d: %p %p %p %p %p %p %p %p %p %p: Error: setting compressor error to %d (%s)\n";
          return sub_18623172C(v15, v7, v8, v9, v10, v11, v12, v13, (char)v14);
        }
      }
    }

    else
    {
      int v17 = *(_DWORD *)(v2 + 8);
      uint64_t v16 = (unsigned int *)(v2 + 8);
      if (v17) {
        return result;
      }
      while (!__ldxr(v16))
      {
        if (!__stxr(a2, v16))
        {
          *(void *)&__int128 v19 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
          __int128 v24 = v19;
          __int128 v25 = v19;
          __int128 v22 = v19;
          __int128 v23 = v19;
          *(_OWORD *)uint64_t v21 = v19;
          backtrace(v21, 10);
          uint64_t v20 = __error();
          strerror(*v20);
          uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c";
          uint64_t v15 = @"%s:%d: %p %p %p %p %p %p %p %p %p %p: Error: setting queue error to %d (%s)\n";
          return sub_18623172C(v15, v7, v8, v9, v10, v11, v12, v13, (char)v14);
        }
      }
    }

    __clrex();
  }

  return result;
}

void *sub_186233800(uint64_t a1)
{
  return sub_186236F20(*(void **)(a1 + 56));
}

void sub_186233834( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 1107296256LL;
  v9[2] = sub_1862344D4;
  v9[3] = &unk_189E382A0;
  uint64_t v8 = *(void *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  sub_186232D84(v8, 4u, 0LL, (uint64_t)v9, a5, a6, a7, a8);
}

void sub_186233894( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(const uint8_t **)(a1 + 40);
  uint64_t v11 = *(unsigned int *)(a1 + 56);
  unsigned int v10 = *(_DWORD *)(a1 + 60);
  uint64_t v12 = *(uint8_t **)(a1 + 48);
  uint64_t v13 = *(unsigned int *)(a1 + 64);
  uint64_t v14 = *(void *)(v8 + 160);
  if (*(_BYTE *)(v14 + 12)) {
    uint64_t v15 = (unsigned int *)(v8 + 240);
  }
  else {
    uint64_t v15 = (unsigned int *)(v14 + 8);
  }
  uint64_t v16 = *v15;
  if ((_DWORD)v16)
  {
    sub_18623365C(*(int **)(a1 + 32), v16);
    sub_186233A70(v8, 3, v17, v18, v19, v20, v21, v22);
    return;
  }

  if (*(_BYTE *)(v8 + 324)) {
    goto LABEL_7;
  }
  int v29 = *(_DWORD *)(v14 + 24);
  if (v29 <= 773)
  {
    if (v29 == 460)
    {
      size_t v30 = 0LL;
      goto LABEL_22;
    }

    if (v29 == 767)
    {
      int v31 = *(_DWORD *)(v14 + 36);
      *(_WORD *)uint64_t v12 = 24184;
      uint64_t v32 = v12 + 2;
      LODWORD(v13) = v13 - 2;
      unsigned int v33 = v31 - 1;
      unsigned int v34 = v31 + 512;
      if (v33 >= 9) {
        size_t v30 = 517LL;
      }
      else {
        size_t v30 = v34;
      }
      goto LABEL_23;
    }

    goto LABEL_31;
  }

  if (v29 == 774)
  {
    size_t v30 = 2304LL;
    goto LABEL_22;
  }

  if (v29 == 1535)
  {
    size_t v30 = 1794LL;
    goto LABEL_22;
  }

  if (v29 != 1279)
  {
LABEL_31:
    sub_18623172C( @"%s:%d: Error: unknown compression scheme %llu\n",  v16,  a3,  a4,  v13,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    goto LABEL_7;
  }

  size_t v30 = 2049LL;
LABEL_22:
  uint64_t v32 = v12;
LABEL_23:
  unsigned int v35 = sub_186236024(v30, v9, v10, v32, v13, 1);
  if (v35) {
    BOOL v36 = v29 == 767;
  }
  else {
    BOOL v36 = 0;
  }
  if (v36) {
    unsigned int v23 = v35 + 2;
  }
  else {
    unsigned int v23 = v35;
  }
  if (v23)
  {
    *(void *)(*(void *)(v8 + 400) + 8 * v11) = v12;
    __int128 v24 = (uint8_t *)(v9 - 1);
    goto LABEL_8;
  }

LABEL_7:
  unsigned int v23 = v10 + 1;
  *(void *)(*(void *)(v8 + 400) + 8 * v11) = v9 - 1;
  __int128 v24 = v12;
LABEL_8:
  sub_186236F20(v24);
  *(_DWORD *)(*(void *)(v8 + 408) + 4 * v11) = v23;
  dispatch_group_enter(*(dispatch_group_t *)(v8 + 224));
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 0x40000000LL;
  v37[2] = sub_186233AF8;
  v37[3] = &unk_189E38450;
  v37[4] = v8;
  unsigned int v38 = v23;
  sub_186232D84(v8, 1u, 0LL, (uint64_t)v37, v25, v26, v27, v28);
}

void sub_186233A70( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 0x40000000LL;
  v8[2] = sub_1862344C4;
  v8[3] = &unk_189E38320;
  v8[4] = a1;
  int v9 = a2;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 1107296256LL;
  v10[2] = sub_186233834;
  v10[3] = &unk_189E382D0;
  v10[4] = v8;
  v10[5] = a1;
  sub_186232D84(a1, 3u, 0LL, (uint64_t)v10, a5, a6, a7, a8);
}

void sub_186233AF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  unsigned int v9 = *(_DWORD *)(v8 + 300) + *(_DWORD *)(a1 + 40);
  *(_DWORD *)(v8 + 300) = v9;
  int v10 = *(_DWORD *)(v8 + 292);
  int v11 = v10 + 1;
  *(_DWORD *)(v8 + 292) = v10 + 1;
  if (v9 > *(_DWORD *)(v8 + 296))
  {
    if (!*(_BYTE *)(v8 + 324)) {
      *(_BYTE *)(v8 + 324) = 1;
    }
    goto LABEL_29;
  }

  if (v11 != *(_DWORD *)(v8 + 288)) {
    goto LABEL_29;
  }
  uint64_t v12 = *(void *)(v8 + 160);
  if (*(_BYTE *)(v12 + 12)) {
    uint64_t v13 = (unsigned int *)(v8 + 240);
  }
  else {
    uint64_t v13 = (unsigned int *)(v12 + 8);
  }
  if (*v13)
  {
    sub_18623365C((int *)v8, *v13);
    uint64_t v14 = v8;
    int v15 = 3;
LABEL_10:
    sub_186233A70(v14, v15, a3, a4, a5, a6, a7, a8);
    goto LABEL_29;
  }

  if (!v10 && v9 <= 0xECA && !*(void *)(v8 + 280) && *(_BYTE *)(v12 + 14) && !*(_BYTE *)(v8 + 248))
  {
    uint64_t v14 = v8;
    int v15 = 2;
    goto LABEL_10;
  }

  uint64_t v16 = *(void *)(v8 + 336);
  if (v16)
  {
    int v17 = (8 * v11) | 4;
    unsigned int v18 = v9 + v17;
    int v19 = v9 + v17 + 314;
    *(_DWORD *)uint64_t v16 = 0x10000;
    *(int8x8_t *)(v16 + 4) = vrev32_s8((int8x8_t)vadd_s32(vdup_n_s32(v18), (int32x2_t)0x400000104LL));
    *(_DWORD *)(v16 + 12) = 838860800;
    *(_OWORD *)(v16 + 16) = 0u;
    *(_OWORD *)(v16 + 32) = 0u;
    *(_OWORD *)(v16 + 48) = 0u;
    *(_OWORD *)(v16 + 64) = 0u;
    *(_OWORD *)(v16 + 80) = 0u;
    *(_OWORD *)(v16 + 96) = 0u;
    *(_OWORD *)(v16 + 112) = 0u;
    *(_OWORD *)(v16 + 128) = 0u;
    *(_OWORD *)(v16 + 144) = 0u;
    *(_OWORD *)(v16 + 160) = 0u;
    *(_OWORD *)(v16 + 176) = 0u;
    *(_OWORD *)(v16 + 192) = 0u;
    *(_OWORD *)(v16 + 208) = 0u;
    *(_OWORD *)(v16 + 224) = 0u;
    *(_OWORD *)(v16 + 240) = 0u;
    uint64_t v20 = *(_DWORD **)(v8 + 336);
    v20[64] = bswap32(v18);
    uint64_t v21 = *(unsigned int *)(v8 + 288);
    v20[65] = v21;
    if ((_DWORD)v21)
    {
      uint64_t v22 = *(int **)(v8 + 408);
      unsigned int v23 = v20 + 67;
      do
      {
        int v24 = *v22++;
        *(v23 - 1) = v17;
        *unsigned int v23 = v24;
        v17 += v24;
        v23 += 2;
        --v21;
      }

      while (v21);
    }
  }

  else
  {
    int v19 = *(_DWORD *)(v8 + 344);
    uint64_t v25 = *(void *)(v8 + 352);
    if (v11)
    {
      unint64_t v26 = 0LL;
      uint64_t v27 = *(void *)(v8 + 408);
      do
      {
        *(_DWORD *)(v25 + 4 * v26) = v19;
        v19 += *(_DWORD *)(v27 + 4 * v26++);
        unint64_t v28 = *(unsigned int *)(v8 + 288);
      }

      while (v26 < v28);
    }

    else
    {
      unint64_t v28 = 0LL;
    }

    *(_DWORD *)(v25 + 4 * v28) = v19;
  }

  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 0x40000000LL;
  v29[2] = sub_186233D20;
  v29[3] = &unk_189E38470;
  v29[4] = v8;
  int v30 = v19;
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 1107296256LL;
  v31[2] = sub_186233834;
  v31[3] = &unk_189E382D0;
  v31[4] = v29;
  v31[5] = v8;
  sub_186232D84(v8, 3u, 0LL, (uint64_t)v31, a5, a6, a7, a8);
LABEL_29:
  dispatch_group_leave(*(dispatch_group_t *)(v8 + 224));
}

ssize_t sub_186233D20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  ssize_t result = fgetxattr(*(_DWORD *)(v1 + 244), "com.apple.ResourceFork", 0LL, 0LL, 0, 32);
  if (result == -1)
  {
    if (*__error() != 93)
    {
      size_t v3 = __error();
      strerror(*v3);
      sub_18623172C( @"%s:%d: fgetxattr %s: %s\n",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    }
  }

  else if (result >= 1)
  {
    *(_BYTE *)(v1 + 324) = 1;
    return result;
  }

  uint64_t v11 = *(void *)(v1 + 336);
  if (v11)
  {
    ssize_t result = sub_186233EB4(v1, *(void *)(v1 + 336), *(unsigned int *)(v1 + 332), 0LL);
    if ((result & 1) == 0) {
      return result;
    }
    uint64_t v12 = (void **)(v1 + 336);
    uint64_t v13 = (unsigned int *)(v1 + 332);
  }

  else
  {
    ssize_t result = sub_186233EB4(v1, *(void *)(v1 + 352), *(unsigned int *)(v1 + 344), 0LL);
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v12 = (void **)(v1 + 352);
    uint64_t v13 = (unsigned int *)(v1 + 344);
  }

  uint64_t v14 = *v13;
  sub_186236F20(*v12);
  *uint64_t v12 = 0LL;
  if (*(_DWORD *)(v1 + 288))
  {
    unint64_t v21 = 0LL;
    while (1)
    {
      ssize_t result = sub_186233EB4( v1,  *(void *)(*(void *)(v1 + 400) + 8 * v21),  *(unsigned int *)(*(void *)(v1 + 408) + 4 * v21),  v14);
      if (!(_DWORD)result) {
        break;
      }
      v14 += *(unsigned int *)(*(void *)(v1 + 408) + 4 * v21);
      sub_186236F20(*(void **)(*(void *)(v1 + 400) + 8 * v21));
      *(void *)(*(void *)(v1 + 400) + 8 * v21++) = 0LL;
    }
  }

  else
  {
LABEL_15:
    if (!v11) {
      return sub_186233FC4(v1, 1LL, v15, v16, v17, v18, v19, v20);
    }
    ssize_t result = sub_186233EB4(v1, (uint64_t)&unk_186237DC0, 50LL, v14);
    if ((_DWORD)result) {
      return sub_186233FC4(v1, 1LL, v15, v16, v17, v18, v19, v20);
    }
  }

  return result;
}

uint64_t sub_186233EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 < 0x100000000LL)
  {
    int v15 = *(_DWORD *)(a1 + 244);
    uint64_t v16 = *(void *)(a1 + 8);
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 0x40000000LL;
    v26[2] = sub_1862344A0;
    v26[3] = &unk_189E38360;
    v26[4] = a1;
    v26[5] = a2;
    v26[6] = a3;
    v26[7] = a4;
    uint64_t v18 = __error();
    strerror(*v18);
    sub_18623172C( @"%s:%d: fsetxattr %s: %s\n",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    unsigned int v14 = *__error();
    uint64_t v13 = (int *)a1;
  }

  else
  {
    uint64_t v5 = __error();
    strerror(*v5);
    sub_18623172C( @"%s:%d: fileOffset=%llu is too big: %s\n",  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    uint64_t v13 = (int *)a1;
    unsigned int v14 = 22;
  }

  sub_18623365C(v13, v14);
  return 0LL;
}

uint64_t sub_186233FC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  uint64_t result = *(unsigned int *)(a1 + 244);
  if ((_DWORD)result == -1) {
    return result;
  }
  uint64_t v10 = *(void *)(a1 + 160);
  if (*(_BYTE *)(v10 + 12)) {
    uint64_t v11 = (unsigned int *)(a1 + 240);
  }
  else {
    uint64_t v11 = (unsigned int *)(v10 + 8);
  }
  unsigned int v12 = *v11;
  if (*v11) {
    goto LABEL_6;
  }
  int v16 = *(_DWORD *)(v10 + 16);
  memset(v67, 170, sizeof(v67));
  switch((_DWORD)a2)
  {
    case 3:
      goto LABEL_34;
    case 2:
      if (!*(_BYTE *)(v10 + 14))
      {
        sub_18623172C( @"%s:%d: Error: storing data in xattr not allowed\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
        unsigned int v12 = 45;
        goto LABEL_6;
      }

      size_t v20 = **(unsigned int **)(a1 + 408);
      uint64_t v19 = v20 + 16;
      uint64_t v18 = malloc(v20 + 16);
      uint64_t v21 = **(void ***)(a1 + 400);
      memcpy(v18 + 2, v21, v20);
      sub_186236F20(v21);
      **(void **)(a1 + 400) = 0LL;
      int v16 = *(_DWORD *)(*(void *)(a1 + 160) + 16LL) - 1;
      LODWORD(result) = *(_DWORD *)(a1 + 244);
      int v17 = 1;
      break;
    case 1:
      int v17 = 0;
      if (*(void *)(a1 + 280))
      {
        v67[2] = *(void *)(a1 + 280);
        uint64_t v18 = v67;
        uint64_t v19 = 24LL;
      }

      else
      {
        uint64_t v18 = v67;
        uint64_t v19 = 16LL;
      }

      break;
    default:
      sub_18623172C( @"%s:%d: Error: invalid close flag %d\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
      unsigned int v12 = 22;
      goto LABEL_6;
  }

  *(_DWORD *)uint64_t v18 = 1668116582;
  *((_DWORD *)v18 + 1) = v16;
  v18[1] = *(void *)(a1 + 264);
  uint64_t v22 = *(void *)(a1 + 8);
  bytes.__darwin_time_t tv_sec = MEMORY[0x1895F87A8];
  *(void *)&bytes.tv_useCC_SHA256_CTX c = 0x40000000LL;
  uint64_t v69 = sub_18623447C;
  uint64_t v70 = &unk_189E38340;
  uint64_t v71 = a1;
  uint64_t v72 = v18;
  uint64_t v73 = v19;
  int v23 = sub_1862318B0(result, 0LL, v22, (_BYTE *)(a1 + 323), (uint64_t)&bytes);
  unsigned int v12 = *__error();
  if (v17) {
    free(v18);
  }
  if (v23 == -1)
  {
    unsigned int v33 = __error();
    strerror(*v33);
    sub_18623172C( @"%s:%d: fsetxattr %s: %s\n",  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }

  else if (*(_BYTE *)(*(void *)(a1 + 160) + 12LL) && ftruncate(*(_DWORD *)(a1 + 244), 0LL) == -1)
  {
    unsigned int v12 = *__error();
    uint64_t v41 = __error();
    strerror(*v41);
    sub_18623172C( @"%s:%d: ftruncate %s: %s\n",  v42,  v43,  v44,  v45,  v46,  v47,  v48,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }

  else
  {
    int v24 = *(_DWORD *)(a1 + 244);
    unsigned int v12 = *__error();
    uint64_t v25 = __error();
    strerror(*v25);
    sub_18623172C( @"%s:%d: setBsdflags %s: %s\n",  v26,  v27,  v28,  v29,  v30,  v31,  v32,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }

  if (!v12)
  {
LABEL_34:
    fsync(*(_DWORD *)(a1 + 244));
    if (!*(_BYTE *)(a1 + 249) && !*(_BYTE *)(*(void *)(a1 + 160) + 12LL)) {
      goto LABEL_37;
    }
    uint64_t v49 = *(void *)(a1 + 56);
    bytes.__darwin_time_t tv_sec = *(void *)(a1 + 48);
    *(&bytes.tv_usec + 1) = -1431655766;
    bytes.tv_useCC_SHA256_CTX c = (int)v49 / 1000;
    uint64_t v50 = *(void *)(a1 + 72);
    uint64_t v69 = *(uint64_t (**)(uint64_t))(a1 + 64);
    HIDWORD(v70) = -1431655766;
    LODWORD(v70) = (int)v50 / 1000;
    if (futimes(*(_DWORD *)(a1 + 244), &bytes) == -1)
    {
      unsigned int v12 = *__error();
      uint64_t v51 = __error();
      strerror(*v51);
      sub_18623172C( @"%s:%d: futimes %s (fd %d): %s\n",  v52,  v53,  v54,  v55,  v56,  v57,  v58,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    }

    else
    {
LABEL_37:
      unsigned int v12 = 0;
    }

    if (*(_BYTE *)(a1 + 323) && fchmod(*(_DWORD *)(a1 + 244), *(_WORD *)(a1 + 20)) == -1)
    {
      unsigned int v12 = *__error();
      uint64_t v59 = __error();
      strerror(*v59);
      sub_18623172C( @"%s:%d: fchmod %s (fd %d): %s\n",  v60,  v61,  v62,  v63,  v64,  v65,  v66,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    }

    if (!v12) {
      goto LABEL_7;
    }
  }

LABEL_6:
  sub_18623365C((int *)a1, v12);
LABEL_7:
  __darwin_time_t v13 = *(void *)(a1 + 24);
  LODWORD(bytes.tv_sec) = *(_DWORD *)(a1 + 16);
  *(__darwin_time_t *)((char *)&bytes.tv_sec + 4) = v13;
  CFDataRef v14 = CFDataCreate(0LL, (const UInt8 *)&bytes, 12LL);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18C68BDB8);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_18C68BDC0, v14);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C68BDB8);
  CFRelease(v14);
  int v15 = *(_DWORD *)(a1 + 244);
  if (v15 != -1) {
    close(v15);
  }
  *(_DWORD *)(a1 + 244) = -1;
  if (qword_18C68BDD8 != -1) {
    dispatch_once(&qword_18C68BDD8, &unk_189E385B8);
  }
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_18C68BDE0);
}

uint64_t sub_18623447C(uint64_t a1)
{
  return fsetxattr( *(_DWORD *)(*(void *)(a1 + 32) + 244LL),  "com.apple.decmpfs",  *(const void **)(a1 + 40),  *(void *)(a1 + 48),  0,  0);
}

uint64_t sub_1862344A0(uint64_t a1)
{
  return fsetxattr( *(_DWORD *)(*(void *)(a1 + 32) + 244LL),  "com.apple.ResourceFork",  *(const void **)(a1 + 40),  *(void *)(a1 + 48),  *(_DWORD *)(a1 + 56),  0);
}

uint64_t sub_1862344C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_186233FC4(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1862344D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

int *sub_1862344E0(int *a1, int a2, const void *a3, size_t a4, off_t a5)
{
  do
  {
    *__error() = 0;
    ssize_t v10 = pwrite(a2, a3, a4, a5);
    uint64_t result = __error();
  }

  while (*result == 35);
  if (v10 != a4)
  {
    if (v10 == -1) {
      int v12 = *__error();
    }
    else {
      int v12 = 28;
    }
    strerror(v12);
    sub_18623172C( @"%s:%d: Error: failed to write %zu bytes to %s(%d) at %llu: %s\n",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    return sub_18623365C(a1, v12);
  }

  return result;
}

_DWORD *sub_1862345C8(_DWORD *result)
{
  uint64_t v1 = result;
  result[90] = 0;
  unint64_t v2 = *((void *)result + 33) - *((void *)result + 34);
  if (!v2)
  {
    *((void *)result + 46) = 0LL;
    result[91] = 0;
LABEL_8:
    *((_BYTE *)v1 + 376) = 0;
    return result;
  }

  if (v2 >= 0x10000) {
    unsigned int v3 = 0x10000;
  }
  else {
    unsigned int v3 = result[66] - result[68];
  }
  v1[91] = v3;
  if (*((_BYTE *)v1 + 304))
  {
    uint64_t result = sub_186236D98(v3, 1);
    *((void *)v1 + 46) = result;
    goto LABEL_8;
  }

  uint64_t v4 = sub_186236D98(v3 + 1, 1);
  *uint64_t v4 = *(_BYTE *)(*((void *)v1 + 20) + 32LL);
  *((void *)v1 + 46) = v4 + 1;
  *((_BYTE *)v1 + 376) = 1;
  LODWORD(v4) = v1[91];
  v1[98] = (_DWORD)v4;
  uint64_t result = sub_186236D98(v4, 1);
  *((void *)v1 + 48) = result;
  return result;
}

uint64_t sub_186234664(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 244);
  uint64_t v3 = *(void *)(v1 + 264);
  v5[0] = 0x300000002LL;
  v5[1] = 0LL;
  v5[2] = v3;
  v5[3] = 0LL;
  return fcntl(v2, 42, v5);
}

unint64_t *sub_1862346AC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = a2;
  do
    unint64_t v3 = __ldxr(a2);
  while (__stxr(v3 + 1, a2));
  return result;
}

void sub_1862346C4(uint64_t a1, unint64_t *a2)
{
  do
  {
    unint64_t v2 = __ldxr(a2);
    unint64_t v3 = v2 - 1;
  }

  while (__stxr(v3, a2));
  if (!v3) {
    sub_1862346E4((uint64_t)a2);
  }
}

void sub_1862346E4(uint64_t a1)
{
  if (qword_18C68BDD0 != -1) {
    dispatch_once(&qword_18C68BDD0, &unk_189E38578);
  }
  if (pthread_getspecific(qword_18C68BDC8) != (void *)a1)
  {
    uint64_t v18 = "incorrectly released";
    goto LABEL_38;
  }

  if (!*(_BYTE *)(a1 + 321))
  {
    uint64_t v18 = "finalized before it was finished";
    goto LABEL_38;
  }

  if (!*(_BYTE *)(a1 + 322))
  {
    uint64_t v18 = "finalized before it was closed";
LABEL_38:
    sub_186232F7C(a1, v18, v3, v4, v5, v6, v7, v8, v19);
  }

  if (*(_DWORD *)(a1 + 244) != -1) {
    sub_18623172C( @"%s:%d: Error: freed StreamCompressor for %s without closing data fd\n",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }
  if (*(void *)(a1 + 256)) {
    sub_18623172C( @"%s:%d: Error: freed StreamCompressor for %s that is still locked\n",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }
  if (*(void *)(a1 + 368))
  {
    sub_18623172C( @"%s:%d: Error: freed StreamCompressor for %s that is still has a curBuffer\n",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    uint64_t v9 = *(char **)(a1 + 368);
    if (*(_BYTE *)(a1 + 376)) {
      --v9;
    }
    sub_186236F20(v9);
  }

  if (*(void *)(a1 + 384))
  {
    sub_18623172C( @"%s:%d: Error: freed StreamCompressor for %s that is still has a compressionBuffer\n",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    sub_186236F20(*(void **)(a1 + 384));
  }

  sub_186236F20(*(void **)(a1 + 336));
  sub_186236F20(*(void **)(a1 + 352));
  ssize_t v10 = *(void **)(a1 + 400);
  if (v10)
  {
    if (*(_DWORD *)(a1 + 288))
    {
      unint64_t v11 = 0LL;
      do
        sub_186236F20(*(void **)(*(void *)(a1 + 400) + 8 * v11++));
      while (v11 < *(unsigned int *)(a1 + 288));
      ssize_t v10 = *(void **)(a1 + 400);
    }

    free(v10);
  }

  int v12 = *(void **)(a1 + 408);
  if (v12) {
    free(v12);
  }
  *(void *)(a1 + 408) = 0LL;
  uint64_t v13 = *(void **)(a1 + 8);
  if (v13) {
    free(v13);
  }
  *(void *)(a1 + 8) = 0LL;
  for (uint64_t i = 176LL; i != 216; i += 8LL)
  {
    uint64_t v15 = *(dispatch_object_s **)(a1 + i);
    if (v15) {
      dispatch_release(v15);
    }
    *(void *)(a1 + i) = 0LL;
  }

  uint64_t v16 = *(dispatch_object_s **)(a1 + 216);
  if (v16) {
    dispatch_release(v16);
  }
  *(void *)(a1 + 216) = 0LL;
  uint64_t v17 = *(dispatch_object_s **)(a1 + 224);
  if (v17) {
    dispatch_release(v17);
  }
  free((void *)a1);
}

uint64_t sub_1862348DC()
{
  return pthread_key_create((pthread_key_t *)&qword_18C68BDC8, 0LL);
}

uint64_t sub_1862348EC(uint64_t a1)
{
  return open(*(const char **)(a1 + 32), 2);
}

void sub_1862348F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void **)(a1 + 32);
  sub_186234964((uint64_t)v8, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v9 = v8[20];
  unint64_t v11 = (dispatch_queue_s *)v8[26];
  ssize_t v10 = (dispatch_group_s *)v8[27];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 0x40000000LL;
  v12[2] = sub_186234AF0;
  v12[3] = &unk_189E38260;
  v12[4] = v8;
  sub_1862334A0(v9, v10, v11, (uint64_t)v12);
}

void sub_186234964( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 324))
  {
    uint64_t v9 = (unsigned int *)(a1 + 328);
    do
    {
      if (__ldxr(v9))
      {
        __clrex();
        return;
      }
    }

    while (__stxr(1u, v9));
    uint64_t v11 = MEMORY[0x1895F87A8];
    if (*(_BYTE *)(*(void *)(a1 + 160) + 12LL))
    {
      uint64_t v20 = MEMORY[0x1895F87A8];
      int v12 = &unk_189E38380;
      uint64_t v13 = &v20;
      uint64_t v14 = sub_186234DFC;
    }

    else
    {
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 0x40000000LL;
      v19[2] = sub_186234B8C;
      v19[3] = &unk_189E383A0;
      v19[4] = a1;
      uint64_t v21 = MEMORY[0x1895F87A8];
      uint64_t v22 = 1107296256LL;
      int v23 = sub_186233834;
      int v24 = &unk_189E382D0;
      uint64_t v25 = v19;
      uint64_t v26 = a1;
      sub_186232D84(a1, 3u, 0LL, (uint64_t)&v21, a5, a6, a7, a8);
      *(_BYTE *)(a1 + 304) = 1;
      if (*(void *)(a1 + 368))
      {
        *(void *)(a1 + 312) = *(void *)(a1 + 272) - *(unsigned int *)(a1 + 360);
        sub_186236F20(*(void **)(a1 + 384));
        *(void *)(a1 + 384) = 0LL;
        *(_DWORD *)(a1 + 392) = 0;
      }

      uint64_t v18 = v11;
      int v12 = &unk_189E38430;
      uint64_t v13 = &v18;
      uint64_t v14 = sub_186234BD4;
    }

    v13[1] = 0x40000000LL;
    v13[2] = (uint64_t)v14;
    v13[3] = (uint64_t)v12;
    v13[4] = a1;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 216));
    uint64_t v15 = *(void *)(a1 + 160);
    uint64_t v16 = *(dispatch_group_s **)(a1 + 224);
    uint64_t v17 = *(dispatch_queue_s **)(a1 + 192);
    uint64_t v21 = v11;
    uint64_t v22 = 1107296256LL;
    int v23 = sub_18623346C;
    int v24 = &unk_189E381D0;
    uint64_t v25 = v13;
    uint64_t v26 = a1;
    sub_1862334A0(v15, v16, v17, (uint64_t)&v21);
  }

uint64_t sub_186234AF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  sub_186233FC4(v8, 3LL, a3, a4, a5, a6, a7, a8);
  dispatch_group_leave(**(dispatch_group_t **)(v8 + 160));
  *(_BYTE *)(v8 + 321) = 1;
  if (qword_18C68BDD0 != -1) {
    dispatch_once(&qword_18C68BDD0, &unk_189E38578);
  }
  pthread_key_t v9 = qword_18C68BDC8;
  pthread_setspecific(qword_18C68BDC8, (const void *)v8);
  do
  {
    unint64_t v10 = __ldxr((unint64_t *)v8);
    unint64_t v11 = v10 - 1;
  }

  while (__stxr(v11, (unint64_t *)v8));
  if (!v11) {
    sub_1862346E4(v8);
  }
  return pthread_setspecific(v9, 0LL);
}

uint64_t sub_186234B8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 244);
  uint64_t v3 = *(void *)(v1 + 264);
  v5[0] = 0x300000002LL;
  v5[1] = 0LL;
  v5[2] = v3;
  v5[3] = 0LL;
  return fcntl(v2, 42, v5);
}

void sub_186234BD4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v8 + 292))
  {
    unint64_t v9 = 0LL;
    unsigned int v10 = 0;
    uint64_t v11 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v12 = *(void *)(v8 + 160);
      if (*(_BYTE *)(v12 + 12)) {
        uint64_t v13 = (unsigned int *)(v8 + 240);
      }
      else {
        uint64_t v13 = (unsigned int *)(v12 + 8);
      }
      if (*v13)
      {
        sub_18623365C((int *)v8, *v13);
        sub_186233A70(v8, 3, v22, v23, v24, v25, v26, v27);
        return;
      }

      uint64_t v14 = *(unsigned __int8 **)(*(void *)(v8 + 400) + 8 * v9);
      else {
        uint64_t v15 = *(void *)(v8 + 264) - v10;
      }
      int v16 = *(_DWORD *)(*(void *)(v8 + 408) + 4 * v9);
      if (*v14 == *(unsigned __int8 *)(v12 + 32))
      {
        if (v16 != (_DWORD)v15 + 1) {
          __assert_rtn("decompressIfNecessary_block_invoke_3", "StreamCompressor.cpp", 1403, "bufSz == uncmpSize + 1");
        }
        v33[0] = v11;
        v33[1] = 0x40000000LL;
        v33[2] = sub_186234E6C;
        v33[3] = &unk_189E383C0;
        v33[4] = v8;
        v33[5] = v14;
        int v34 = v15;
        unsigned int v35 = v10;
        uint64_t v36 = v11;
        uint64_t v37 = 1107296256LL;
        uint64_t v38 = sub_186233834;
        uint64_t v39 = &unk_189E382D0;
        uint64_t v40 = v33;
        uint64_t v41 = v8;
        uint64_t v17 = &v36;
        uint64_t v18 = v8;
        unsigned int v19 = 3;
      }

      else
      {
        v28[0] = v11;
        v28[1] = 0x40000000LL;
        v28[2] = sub_186234EA4;
        v28[3] = &unk_189E38410;
        v28[4] = v8;
        v28[5] = v14;
        int v29 = v16;
        int v30 = v15;
        unsigned int v31 = v10;
        int v32 = v9;
        uint64_t v20 = sub_186236D98(v15, 0);
        if (!v20)
        {
          uint64_t v21 = *(void *)(*(void *)(v8 + 160) + 56LL);
          uint64_t v36 = v11;
          uint64_t v37 = 1107296256LL;
          uint64_t v38 = sub_18623339C;
          uint64_t v39 = &unk_189E381A0;
          uint64_t v42 = v21;
          uint64_t v43 = v15;
          uint64_t v40 = v28;
          uint64_t v41 = v8;
          uint64_t v17 = &v36;
          uint64_t v18 = v8;
          unsigned int v19 = 2;
          goto LABEL_16;
        }

        v44[0] = v11;
        v44[1] = 1107296256LL;
        v44[2] = sub_186233340;
        v44[3] = &unk_189E38150;
        v44[4] = v28;
        v44[5] = v20;
        uint64_t v17 = v44;
        uint64_t v18 = v8;
        unsigned int v19 = 2;
      }

      uint64_t v21 = 0LL;
LABEL_16:
      sub_186232D84(v18, v19, v21, (uint64_t)v17, a5, a6, a7, a8);
      *(void *)(*(void *)(v8 + 400) + 8 * v9) = 0LL;
      v10 += v15;
      ++v9;
    }

    while (v9 < *(unsigned int *)(v8 + 292));
  }

void *sub_186234DFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 292))
  {
    unint64_t v2 = 0LL;
    do
    {
      sub_186236F20(*(void **)(*(void *)(v1 + 400) + 8 * v2));
      *(void *)(*(void *)(v1 + 400) + 8 * v2++) = 0LL;
    }

    while (v2 < *(unsigned int *)(v1 + 292));
  }

  uint64_t v3 = *(void *)(v1 + 368);
  if (v3)
  {
    sub_186236F20((void *)(v3 - 1));
    *(void *)(v1 + 368) = 0LL;
  }

  uint64_t result = *(void **)(v1 + 384);
  if (result)
  {
    uint64_t result = sub_186236F20(result);
    *(void *)(v1 + 384) = 0LL;
  }

  return result;
}

void *sub_186234E6C(uint64_t a1)
{
  return sub_186236F20(*(void **)(a1 + 40));
}

void sub_186234EA4( uint64_t a1, uint8_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  int v13 = *(_DWORD *)(*(void *)(v12 + 160) + 24LL);
  unsigned int v15 = *(_DWORD *)(a1 + 48);
  uint64_t v14 = *(unsigned int *)(a1 + 52);
  if (v13 <= 773)
  {
    if (v13 == 460)
    {
      size_t v16 = 0LL;
      goto LABEL_12;
    }

    if (v13 == 767)
    {
      size_t v16 = 517LL;
      goto LABEL_12;
    }

LABEL_19:
    sub_18623172C( @"%s:%d: Error: unknown compression scheme %llu\n",  (uint64_t)a2,  a3,  a4,  v14,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    int v20 = 0;
    goto LABEL_16;
  }

  if (v13 == 1535)
  {
    size_t v16 = 1794LL;
    goto LABEL_12;
  }

  if (v13 == 1279)
  {
    size_t v16 = 2049LL;
    goto LABEL_12;
  }

  if (v13 != 774) {
    goto LABEL_19;
  }
  size_t v16 = 2304LL;
LABEL_12:
  BOOL v17 = v13 == 767;
  BOOL v18 = v13 == 767;
  if (v17) {
    unsigned int v19 = v15 - 2;
  }
  else {
    unsigned int v19 = v15;
  }
  int v20 = sub_186236024(v16, (const uint8_t *)(v11 + 2LL * v18), v19, a2, v14, 2);
LABEL_16:
  sub_186236F20(*(void **)(a1 + 40));
  if (v20 == *(_DWORD *)(a1 + 52))
  {
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 1107296256LL;
    v29[2] = sub_186235070;
    v29[3] = &unk_189E383E0;
    void v29[5] = v12;
    v29[6] = a2;
    int v28 = *(_DWORD *)(a1 + 56);
    int v30 = v20;
    int v31 = v28;
    v29[4] = a3;
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 1107296256LL;
    v32[2] = sub_186233834;
    v32[3] = &unk_189E382D0;
    v32[4] = v29;
    v32[5] = v12;
    sub_186232D84(v12, 3u, 0LL, (uint64_t)v32, v24, v25, v26, v27);
  }

  else
  {
    sub_18623172C( @"%s:%d: Error: chunk %d of %s decompressed to %u, expected %u\n",  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    sub_18623365C((int *)v12, 0x16u);
    (*(void (**)(uint64_t))(a3 + 16))(a3);
  }

uint64_t sub_186235070(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t CreateStreamCompressor(int a1, char *a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = 0LL;
  uint64_t v123 = *MEMORY[0x1895F89C0];
  if (!a4 || !a5) {
    return v5;
  }
  uint64_t v11 = rindex(a2, 47);
  if (v11) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = a2;
  }
  if (!strncmp(v12, "._", 2uLL)) {
    return 0LL;
  }
  uint64_t v119 = 0LL;
  int v13 = *(CFArrayRef **)(a4 + 80);
  if (!v13) {
    goto LABEL_18;
  }
  LOBYTE(__b.f_bsize) = 0;
  uint64_t v14 = sub_18623290C(a2, a3, &__b);
  CFStringRef v15 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], v14);
  CFStringRef v16 = v15;
  LOBYTE(v121[0]) = 1;
  uint64_t v119 = 0LL;
  int f_bsize_low = LOBYTE(__b.f_bsize);
  if (*v13 && !sub_1862329D0((int)v15, *v13, LOBYTE(__b.f_bsize) != 0, v121, &v119))
  {
    unsigned int v19 = (FILE *)*MEMORY[0x1895F89D0];
    int v20 = "Failed to apply user rules.\n";
    size_t v21 = 28LL;
LABEL_16:
    fwrite(v20, v21, 1uLL, v19);
    if (v16) {
      CFRelease(v16);
    }
    goto LABEL_18;
  }

  if (!sub_1862329D0((int)v16, v13[1], f_bsize_low != 0, v121, &v119))
  {
    unsigned int v19 = (FILE *)*MEMORY[0x1895F89D0];
    int v20 = "Failed to apply system rules.\n";
    size_t v21 = 30LL;
    goto LABEL_16;
  }

  CFRelease(v16);
  if (LOBYTE(v121[0]))
  {
    char v18 = 0;
    goto LABEL_20;
  }

LABEL_18:
  if (*(_BYTE *)(a4 + 12)) {
    return 0LL;
  }
  char v18 = 1;
LABEL_20:
  uint64_t v22 = calloc(1uLL, 0x1A8uLL);
  uint64_t v5 = (uint64_t)v22;
  if (!v22) {
    return v5;
  }
  *(void *)uint64_t v22 = 1LL;
  uint64_t v23 = v119;
  v22[59] = -208193560;
  v22[42] = -208193560;
  v22[61] = -1;
  *((_BYTE *)v22 + 322) = 1;
  *((void *)v22 + 1) = strdup(a2);
  *(void *)(v5 + 264) = a5;
  *(void *)(v5 + 160) = a4;
  *(_BYTE *)(v5 + 304) = v18;
  *(void *)(v5 + 280) = v23;
  dispatch_group_enter(*(dispatch_group_t *)a4);
  if (!*(_DWORD *)(a4 + 64)
    || *(void *)(a4 + 72)
    && (uint64_t v24 = sub_18623290C(*(const char **)(v5 + 8), a3, &__b),
        (CFStringRef v25 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], v24)) != 0LL)
    && (CFStringRef v26 = v25, v27 = CFSetContainsValue(*(CFSetRef *)(a4 + 72), v25), CFRelease(v26), v27))
  {
    *(_BYTE *)(v5 + 320) = 1;
  }

  int v28 = *(dispatch_queue_s **)(*(void *)(v5 + 160) + 40LL);
  int v29 = (dispatch_queue_attr_s *)MEMORY[0x1895F8AF8];
  dispatch_queue_t v30 = dispatch_queue_create(0LL, MEMORY[0x1895F8AF8]);
  dispatch_set_target_queue(v30, v28);
  *(void *)(v5 + 176) = v30;
  int v31 = *(dispatch_queue_s **)(*(void *)(v5 + 160) + 40LL);
  dispatch_queue_t v32 = dispatch_queue_create(0LL, 0LL);
  dispatch_set_target_queue(v32, v31);
  *(void *)(v5 + 184) = v32;
  unsigned int v33 = *(dispatch_queue_s **)(*(void *)(v5 + 160) + 40LL);
  dispatch_queue_t v34 = dispatch_queue_create(0LL, v29);
  dispatch_set_target_queue(v34, v33);
  *(void *)(v5 + 192) = v34;
  unsigned int v35 = *(dispatch_queue_s **)(*(void *)(v5 + 160) + 40LL);
  dispatch_queue_t v36 = dispatch_queue_create(0LL, 0LL);
  dispatch_set_target_queue(v36, v35);
  *(void *)(v5 + 200) = v36;
  uint64_t v37 = *(dispatch_queue_s **)(*(void *)(v5 + 160) + 48LL);
  dispatch_queue_t v38 = dispatch_queue_create(0LL, 0LL);
  dispatch_set_target_queue(v38, v37);
  *(void *)(v5 + 208) = v38;
  *(void *)(v5 + 216) = dispatch_group_create();
  *(void *)(v5 + 224) = dispatch_group_create();
  if (fstat(a1, (stat *)(v5 + 16)) == -1)
  {
    unsigned int v42 = *__error();
    uint64_t v43 = __error();
    strerror(*v43);
    sub_18623172C( @"%s:%d: fstat %s: %s\n",  v44,  v45,  v46,  v47,  v48,  v49,  v50,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    goto LABEL_50;
  }

  if (qword_18C68BDD8 != -1) {
    dispatch_once(&qword_18C68BDD8, &unk_189E385B8);
  }
  uint64_t v39 = (dispatch_semaphore_s *)qword_18C68BDE0;
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_18C68BDE0, 0xFFFFFFFFFFFFFFFFLL);
  if (write(a1, 0LL, 0LL))
  {
    if (*__error() == 9)
    {
      memset(&__b, 170, 0x400uLL);
      if (fcntl(a1, 50, &__b) == -1)
      {
        unsigned int v42 = *__error();
        uint64_t v68 = __error();
        strerror(*v68);
        sub_18623172C( @"%s:%d: fcntl %s: %s\n",  v69,  v70,  v71,  v72,  v73,  v74,  v75,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
      }

      else
      {
        uint64_t v40 = *(void *)(v5 + 8);
        v121[0] = MEMORY[0x1895F87A8];
        v121[1] = 0x40000000LL;
        v121[2] = sub_1862348EC;
        v121[3] = &unk_189E38300;
        _BYTE v121[4] = &__b;
        int v41 = sub_1862318B0(-1, (const char *)&__b, v40, (_BYTE *)(v5 + 323), (uint64_t)v121);
        *(_DWORD *)(v5 + 244) = v41;
        if (v41 == -1)
        {
          unsigned int v42 = *__error();
          size_t v76 = __error();
          strerror(*v76);
          sub_18623172C( @"%s:%d: open %s (%s): %s\n",  v77,  v78,  v79,  v80,  v81,  v82,  v83,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
        }

        else
        {
          unsigned int v42 = 0;
        }
      }
    }

    else
    {
      unsigned int v42 = *__error();
      uint64_t v60 = __error();
      strerror(*v60);
      sub_18623172C( @"%s:%d: write %s: %s\n",  v61,  v62,  v63,  v64,  v65,  v66,  v67,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    }
  }

  else
  {
    int v51 = dup(a1);
    *(_DWORD *)(v5 + 244) = v51;
    if (v51 != -1) {
      goto LABEL_44;
    }
    unsigned int v42 = *__error();
    uint64_t v52 = __error();
    strerror(*v52);
    sub_18623172C( @"%s:%d: dup %s: %s\n",  v53,  v54,  v55,  v56,  v57,  v58,  v59,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }

  if (v42)
  {
    int v84 = *(_DWORD *)(v5 + 244);
    if (v84 != -1) {
      close(v84);
    }
    *(_DWORD *)(v5 + 244) = -1;
    dispatch_semaphore_signal(v39);
    goto LABEL_50;
  }

LABEL_44:
  *(_BYTE *)(v5 + 322) = 0;
  *(_BYTE *)(v5 + 248) = 0;
  int v85 = *(_DWORD *)(v5 + 244);
  if (v85 == -1)
  {
    unsigned int v42 = 22;
    goto LABEL_50;
  }

  memset(&__b, 170, sizeof(__b));
  if (fstatfs(v85, &__b) != -1)
  {
    if ((__b.f_flags & 0x80) != 0) {
      *(_BYTE *)(v5 + 248) = 1;
    }
    goto LABEL_53;
  }

  unsigned int v42 = *__error();
  uint64_t v86 = __error();
  strerror(*v86);
  sub_18623172C( @"%s:%d: fstatfs %s: %s\n",  v87,  v88,  v89,  v90,  v91,  v92,  v93,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  if (v42)
  {
LABEL_50:
    sub_18623365C((int *)v5, v42);
    sub_186233A70(v5, 3, v94, v95, v96, v97, v98, v99);
    uint64_t v100 = *(void *)(v5 + 160);
    uint64_t v101 = *(dispatch_group_s **)(v5 + 216);
    uint64_t v102 = *(dispatch_queue_s **)(v5 + 192);
    *(void *)&__b.f_bsize = MEMORY[0x1895F87A8];
    __b.f_blocks = 0x40000000LL;
    __b.f_bfree = (uint64_t)sub_1862348F8;
    __b.f_bavail = (uint64_t)&unk_189E38280;
    __b.f_files = v5;
    sub_1862334A0(v100, v101, v102, (uint64_t)&__b);
    return 0LL;
  }

LABEL_53:
  uint64_t v104 = *(void *)(v5 + 24);
  __b.f_bsize = *(_DWORD *)(v5 + 16);
  *(void *)&__b.f_iosize = v104;
  CFDataRef v105 = CFDataCreate(0LL, (const UInt8 *)&__b, 12LL);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18C68BDB8);
  Mutable = (__CFDictionary *)qword_18C68BDC0;
  if (!qword_18C68BDC0)
  {
    *(_OWORD *)&__b.f_bsize = xmmword_189E38530;
    *(_OWORD *)&__b.f_bfree = *(_OWORD *)&off_189E38540;
    __b.f_files = 0LL;
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], (const CFDictionaryValueCallBacks *)&__b);
    qword_18C68BDC0 = (uint64_t)Mutable;
  }

  CFDictionarySetValue(Mutable, v105, (const void *)v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C68BDB8);
  CFRelease(v105);
  if (*(_BYTE *)(v5 + 304))
  {
    v120[0] = MEMORY[0x1895F87A8];
    v120[1] = 0x40000000LL;
    v120[2] = sub_186234664;
    v120[3] = &unk_189E38240;
    v120[4] = v5;
    *(void *)&__b.f_bsize = MEMORY[0x1895F87A8];
    __b.f_blocks = 1107296256LL;
    __b.f_bfree = (uint64_t)sub_186233834;
    __b.f_bavail = (uint64_t)&unk_189E382D0;
    __b.f_files = (uint64_t)v120;
    __b.f_ffree = v5;
    sub_186232D84(v5, 3u, 0LL, (uint64_t)&__b, v107, v108, v109, v110);
  }

  else
  {
    uint64_t v111 = *(void *)(v5 + 264);
    size_t v112 = ((unint64_t)v111 + 0xFFFF) >> 16;
    *(_DWORD *)(v5 + 288) = v112;
    *(void *)(v5 + 400) = calloc(v112, 8uLL);
    *(void *)(v5 + 408) = calloc(*(unsigned int *)(v5 + 288), 4uLL);
    int v113 = *(_DWORD *)(v5 + 288);
    if (*(_DWORD *)(*(void *)(v5 + 160) + 28LL) == 0x20000)
    {
      unsigned int v114 = 8 * v113 + 264;
      *(_DWORD *)(v5 + 332) = v114;
      *(void *)(v5 + 336) = sub_186236D98(v114, 1);
      int v115 = *(_DWORD *)(v5 + 332) + 50;
    }

    else
    {
      unsigned int v116 = 4 * v113 + 4;
      *(_DWORD *)(v5 + 344) = v116;
      *(void *)(v5 + 352) = sub_186236D98(v116, 1);
      int v115 = *(_DWORD *)(v5 + 344);
    }

    if (*(_DWORD *)(*(void *)(v5 + 160) + 24LL) == 460)
    {
      unsigned int v117 = -1;
    }

    else
    {
      unint64_t v118 = (1374389535 * (unint64_t)(*(_DWORD *)(a4 + 20) * ((v111 + 4095) >> 12))) >> 32;
      unsigned int v117 = (((_DWORD)v118 << 7) & 0xFFFFF000) - v115;
      if (v117 <= 0xECA) {
        unsigned int v117 = 3786;
      }
      if ((((_DWORD)v118 << 7) & 0xFFFFF000) == 0) {
        unsigned int v117 = 3786;
      }
    }

    *(_DWORD *)(v5 + 296) = v117;
  }

  sub_1862345C8((_DWORD *)v5);
  return v5;
}

uint64_t WriteToStreamCompressor( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    unsigned int v12 = 22;
    goto LABEL_53;
  }

  if (*(_BYTE *)(a1 + 322)) {
    sub_186232F7C(a1, "written to after it was closed", a3, a4, a5, a6, a7, a8, v45);
  }
  uint64_t v9 = *(void *)(a1 + 160);
  int v10 = *(unsigned __int8 *)(v9 + 12);
  uint64_t v11 = (unsigned int *)(v9 + 8);
  if (v10) {
    uint64_t v11 = (unsigned int *)(a1 + 240);
  }
  unsigned int v12 = *v11;
  if (*v11)
  {
LABEL_53:
    *__error() = v12;
    return -1LL;
  }

  unint64_t v13 = a3;
  if (!a3) {
    return 0LL;
  }
  if ((unint64_t)(*(void *)(a1 + 272) + a3) > *(void *)(a1 + 264))
  {
    sub_18623172C( @"%s:%d: Error: wrote %llu bytes to file of size %llu\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    unsigned int v12 = 22;
    goto LABEL_52;
  }

  CFStringRef v15 = (char *)a2;
  if (v10 && *(_BYTE *)(a1 + 324))
  {
    unsigned int v12 = 28;
    goto LABEL_53;
  }

  uint64_t v14 = 0LL;
  CFStringRef v16 = (void *)(a1 + 360);
  uint64_t v17 = MEMORY[0x1895F87A8];
  do
  {
    sub_186234964(a1, a2, a3, a4, a5, a6, a7, a8);
    uint64_t v18 = *(unsigned int *)(a1 + 360);
    unint64_t v19 = (*(_DWORD *)(a1 + 364) - v18);
    if (v13 >= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v13;
    }
    memcpy((void *)(*(void *)(a1 + 368) + v18), v15, v20);
    unsigned int v21 = v20 + *(_DWORD *)(a1 + 360);
    *(_DWORD *)(a1 + 360) = v21;
    *(void *)(a1 + 272) += v20;
    if (*(_DWORD *)(a1 + 364) == v21)
    {
      uint64_t v22 = *(_DWORD **)(a1 + 368);
      if (!v22) {
        __assert_rtn("emitCurBuffer", "StreamCompressor.cpp", 548, "curBuffer");
      }
      if (*(_BYTE *)(a1 + 304))
      {
        uint64_t v23 = (char *)v22 - *(char *)(a1 + 376);
        uint64_t v24 = *(void *)(a1 + 312);
        uint64_t v46 = v17;
        uint64_t v47 = 0x40000000LL;
        uint64_t v48 = sub_186233800;
        uint64_t v49 = &unk_189E38200;
        uint64_t v50 = a1;
        int v51 = v22;
        unsigned int v54 = v21;
        uint64_t v52 = v24;
        unint64_t v53 = (unint64_t)v23;
        v55[0] = v17;
        v55[1] = 1107296256LL;
        v55[2] = sub_186233834;
        v55[3] = &unk_189E382D0;
        v55[4] = &v46;
        v55[5] = a1;
        sub_186232D84(a1, 3u, 0LL, (uint64_t)v55, a5, a6, a7, a8);
        *(void *)(a1 + 312) += v21;
LABEL_47:
        ++*(_DWORD *)(a1 + 416);
        *(void *)(a1 + 384) = 0LL;
        *(_DWORD *)(a1 + 392) = 0;
        *CFStringRef v16 = 0LL;
        *(void *)(a1 + 368) = 0LL;
        sub_1862345C8((_DWORD *)a1);
        goto LABEL_48;
      }

      if (*(_BYTE *)(a1 + 320))
      {
LABEL_46:
        unsigned int v32 = *(_DWORD *)(a1 + 416);
        uint64_t v33 = *(void *)(a1 + 384);
        unsigned int v34 = *(_DWORD *)(a1 + 392);
        uint64_t v46 = v17;
        uint64_t v47 = 0x40000000LL;
        uint64_t v48 = sub_186233894;
        uint64_t v49 = &unk_189E38220;
        uint64_t v50 = a1;
        int v51 = v22;
        uint64_t v52 = v33;
        unint64_t v53 = __PAIR64__(v21, v32);
        unsigned int v54 = v34;
        sub_186232D84(a1, 0, 0LL, (uint64_t)&v46, a5, a6, a7, a8);
        goto LABEL_47;
      }

      unsigned int v25 = *(_DWORD *)(*(void *)(a1 + 160) + 64LL);
      if (v21 < 0x1C || v25 == 0) {
        goto LABEL_45;
      }
      int v27 = *v22;
      if (*v22 == -1095041334)
      {
        unsigned int v29 = bswap32(v22[1]);
        unsigned int v30 = bswap32(v22[4]);
      }

      else
      {
        int v28 = *(int **)(a1 + 368);
        if (v27 != -889275714)
        {
LABEL_35:
          if ((v27 + 17958194) < 2)
          {
            unsigned int v31 = v28[3];
          }

          else
          {
            if (v27 != -822415874 && v27 != -805638658) {
              goto LABEL_45;
            }
            unsigned int v31 = bswap32(v28[3]);
          }

          if (v31)
          {
            if (v31 < 0x20)
            {
              if (((v25 >> v31) & 1) != 0) {
                goto LABEL_44;
              }
            }

            else
            {
              sub_18623172C( @"%s:%d: Error: file type of %s is out of range\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
            }
          }

LABEL_45:
          *(_BYTE *)(a1 + 320) = 1;
          goto LABEL_46;
        }

        unsigned int v29 = v22[1];
        unsigned int v30 = v22[4];
      }

      if (v29 > 0x13)
      {
LABEL_44:
        *(_BYTE *)(a1 + 324) = 1;
        goto LABEL_45;
      }

      if (v30 + 28 > v21)
      {
        sub_18623172C( @"%s:%d: Error: the first mach header of %s is not in the first %zu bytes, assuming we need to skip it\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
        goto LABEL_44;
      }

      int v28 = (_DWORD *)((char *)v22 + v30);
      int v27 = *v28;
      goto LABEL_35;
    }

uint64_t CloseStreamCompressor( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v9 = *(void *)(a1 + 160);
    if (*(_BYTE *)(a1 + 322)) {
      sub_186232F7C(a1, "double-closed", a3, a4, a5, a6, a7, a8, v34);
    }
    *(_BYTE *)(a1 + 322) = 1;
    int v10 = (int *)(a1 + 240);
    if (!*(_BYTE *)(v9 + 12)) {
      int v10 = (int *)(v9 + 8);
    }
    int v11 = *v10;
    if (*(void *)(a1 + 272) != *(void *)(a1 + 264) && v11 == 0)
    {
      if (*(_BYTE *)(v9 + 12) && *(_BYTE *)(a1 + 324)) {
        goto LABEL_14;
      }
      *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v38 = v16;
      __int128 v39 = v16;
      __int128 v36 = v16;
      __int128 v37 = v16;
      *(_OWORD *)uint64_t v35 = v16;
      backtrace(v35, 10);
      sub_18623172C( @"%s:%d: %p %p %p %p %p %p %p %p %p %p: Error: wrote %llu bytes but expected %llu bytes\n",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
      int v11 = 22;
    }

    else if (!v11)
    {
LABEL_14:
      uint64_t v14 = *(dispatch_group_s **)(a1 + 216);
      CFStringRef v15 = *(dispatch_queue_s **)(a1 + 192);
      v35[0] = (void *)MEMORY[0x1895F87A8];
      v35[1] = (void *)0x40000000;
      *(void *)&__int128 v36 = sub_1862348F8;
      *((void *)&v36 + 1) = &unk_189E38280;
      *(void *)&__int128 v37 = a1;
      sub_1862334A0(v9, v14, v15, (uint64_t)v35);
      uint64_t v13 = 0LL;
LABEL_17:
      DrainStreamCompressorQueue(v9);
      return v13;
    }

    sub_18623365C((int *)a1, v11);
    sub_186233A70(a1, 3, v24, v25, v26, v27, v28, v29);
    uint64_t v30 = *(void *)(a1 + 160);
    unsigned int v31 = *(dispatch_group_s **)(a1 + 216);
    unsigned int v32 = *(dispatch_queue_s **)(a1 + 192);
    v35[0] = (void *)MEMORY[0x1895F87A8];
    v35[1] = (void *)0x40000000;
    *(void *)&__int128 v36 = sub_1862348F8;
    *((void *)&v36 + 1) = &unk_189E38280;
    *(void *)&__int128 v37 = a1;
    sub_1862334A0(v30, v31, v32, (uint64_t)v35);
    *__error() = v11;
    uint64_t v13 = 0xFFFFFFFFLL;
    goto LABEL_17;
  }

  *__error() = 22;
  return 0xFFFFFFFFLL;
}

void *AFSCLockFilePath()
{
  return &unk_18C68BDA0;
}

void *AFSCLockFileFd()
{
  return &unk_18C68BDA0;
}

uint64_t AFSCUnlockFile()
{
  return 0LL;
}

uint64_t sub_186235F58( int a1, int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a1 - 15) <= 0xFFFFFFF1)
  {
    sub_18623172C( @"%s:%d: Error: type %d out of range\n",  (uint64_t)a2,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    goto LABEL_8;
  }

  int v10 = &dword_186237DF4[3 * a1];
  if (!*v10 || ((0x67uLL >> a1) & 1) != 0)
  {
    sub_18623172C( @"%s:%d: Error: unknown compressor %d\n",  (uint64_t)a2,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
LABEL_8:
    uint64_t result = 0LL;
    int v10 = dword_186237DF4;
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  uint64_t result = 1LL;
  if (a2) {
LABEL_9:
  }
    *a2 = *v10;
LABEL_10:
  if (a3) {
    *a3 = v10[1];
  }
  return result;
}

size_t sub_186236024( size_t algorithm, const uint8_t *a2, unsigned int a3, uint8_t *a4, unsigned int a5, int a6)
{
  size_t v6 = algorithm;
  if ((_DWORD)algorithm)
  {
    size_t v12 = compression_encode_scratch_buffer_size((compression_algorithm)algorithm);
    if (v12)
    {
      uint64_t v13 = malloc(v12);
      if (!v13) {
        return 0LL;
      }
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    if (a6 == 1) {
      size_t v14 = compression_encode_buffer(a4, a5, a2, a3, v13, (compression_algorithm)v6);
    }
    else {
      size_t v14 = compression_decode_buffer(a4, a5, a2, a3, v13, (compression_algorithm)v6);
    }
    size_t v6 = v14;
    if (v13) {
      free(v13);
    }
  }

  return v6;
}

int *sub_1862360D4( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = a2;
  sub_186235F58(*(_DWORD *)(*(void *)(a2 + 16) + 8LL), a1 + 2, a1 + 3, a4, a5, a6, a7, a8);
  int v16 = a1[3];
  if (v16 == 196608 || v16 == 0x20000)
  {
    unint64_t v17 = *(void *)(*(void *)(*(void *)a1 + 16LL) + 12LL) + 0xFFFFLL;
    if (HIWORD(v17)) {
      __assert_rtn("CompressedFile", "ChunkCompression.cpp", 249, "numChunks <= UINT32_MAX");
    }
    a1[4] = v17 >> 16;
  }

  else if (v16 == 0x10000)
  {
    a1[4] = 1;
  }

  else
  {
    sub_18623172C( @"%s:%d: %s: unknown chunking scheme %llu\n",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
  }

  return a1;
}

uint64_t sub_1862361AC( uint64_t **a1, void *value, size_t size, uint64_t position, int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *a1;
  uint64_t v11 = **a1;
  if (v11)
  {
    uint64_t v38 = 0LL;
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t, size_t, void *, uint64_t *))(v11 + 16))( v11,  position,  size,  value,  &v38);
    *a5 = v12;
    if (v12)
    {
      sub_18623172C( @"%s:%d: %s: readRscData: (%llu, %zu), returned error [%d]",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      return 0LL;
    }

    if (v38 != size)
    {
      sub_18623172C( @"%s:%d: %s: readRscData: (%llu, %zu), returned size [%lu]\n",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      *a5 = 5;
      return 0LL;
    }

    return 1LL;
  }

  if (position < 0x100000000LL)
  {
    ssize_t v22 = getxattr((const char *)v10[1], "com.apple.ResourceFork", value, size, position, 32);
    if (v22 == -1)
    {
      *a5 = *__error();
      uint64_t v30 = __error();
      strerror(*v30);
      sub_18623172C( @"%s:%d: %s: fgetxattr(%llu,%zu): %s\n",  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      return 0LL;
    }

    if (v22 == size) {
      return 1LL;
    }
    sub_18623172C( @"%s:%d: %s: fgetxattr(%llu,%zu) returned %zu\n",  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    uint64_t result = 0LL;
    int v21 = 5;
  }

  else
  {
    sub_18623172C( @"%s:%d: %s: position=%lld is too big\n",  (uint64_t)value,  size,  (uint64_t)value,  (uint64_t)a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    uint64_t result = 0LL;
    int v21 = 22;
  }

  *a5 = v21;
  return result;
}

void *sub_186236378(void *result, size_t __size)
{
  if (*((_DWORD *)result + 8) < __size)
  {
    unsigned int v2 = __size;
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    if (v4) {
      free(v4);
    }
    uint64_t result = malloc(v2);
    v3[3] = result;
    *((_DWORD *)v3 + 8) = v2;
  }

  return result;
}

uint64_t sub_1862363C0( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t *a6, uint64_t a7, uint64_t a8)
{
  value[1] = *MEMORY[0x1895F89C0];
  unsigned int v59 = 0;
  if (*((_DWORD *)a1 + 4) <= a2)
  {
    sub_18623172C( @"%s:%d: %s: attempting to read chunk %u from file with %u chunks\n",  a2,  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    return 22LL;
  }

  unsigned int v11 = a4;
  int v13 = *((_DWORD *)a1 + 3);
  if (v13 != 196608)
  {
    if (v13 != 0x20000)
    {
      if (v13 != 0x10000)
      {
        sub_18623172C( @"%s:%d: %s: unknown chunking scheme %llu\n",  a2,  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
        return 22LL;
      }

      uint64_t v14 = *(_DWORD **)(*a1 + 16LL);
      unsigned int v16 = *v14;
      uint64_t v15 = v14 + 5;
      a1[3] = v15;
      unsigned int v17 = v16 - 16;
      if (v16 <= 0x10)
      {
        sub_18623172C( @"%s:%d: %s: decmpfs xattr size (%u) should be greater than decmpfs disk header size (%zu)\n",  a2,  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
        return 22LL;
      }

LABEL_26:
      int v29 = *((_DWORD *)a1 + 2);
      if (*v15 == v29)
      {
        unsigned int v30 = v17 - 1;
        if (v30)
        {
          uint64_t v31 = 0LL;
          size_t v32 = 0LL;
          uint64_t v33 = v15 + 1;
          do
          {
            uint64_t v34 = a5 + 16 * v31;
            uint64_t v35 = *(void **)v34;
            else {
              uint64_t v36 = *(void *)(v34 + 8);
            }
            if (v35) {
              memcpy(v35, v33, v36);
            }
            v32 += v36;
            v33 += v36;
            uint64_t v31 = 1LL;
            v30 -= v36;
          }

          while (v30);
          goto LABEL_85;
        }

LABEL_84:
        size_t v32 = 0LL;
LABEL_85:
        uint64_t result = 0LL;
        *a6 = v32;
        return result;
      }

      *a6 = 0LL;
      if (v29 > 1278)
      {
        if (v29 == 1279)
        {
          compression_algorithm v38 = COMPRESSION_LZFSE;
        }

        else
        {
          if (v29 != 1535) {
            goto LABEL_47;
          }
          compression_algorithm v38 = 1794;
        }

        if (a1[7])
        {
          unsigned int v37 = 0;
          goto LABEL_55;
        }
      }

      else
      {
        if (v29 != 767)
        {
          if (v29 == 774)
          {
            unsigned int v37 = 0;
            compression_algorithm v38 = 2304;
LABEL_55:
            if (v11 == 1)
            {
              size_t v39 = compression_decode_buffer( *(uint8_t **)a5,  *(void *)(a5 + 8),  &v15[v37],  v17 - v37,  (void *)a1[7],  v38);
              if (v39)
              {
                size_t v47 = v39;
                uint64_t result = 0LL;
                *a6 = v47;
                return result;
              }

              goto LABEL_74;
            }

            if (a3 >= 0x100000000LL)
            {
              sub_18623172C( @"%s:%d: %s: vecTotal=%lld is too big for compression algorithm 0x%x\n",  a2,  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
              return 22LL;
            }

            unsigned int v48 = *((_DWORD *)a1 + 12);
            uint64_t v49 = (void *)a1[5];
            if (v48 < a3)
            {
              if (v49) {
                free(v49);
              }
              uint64_t v49 = malloc(a3);
              a1[5] = v49;
              *((_DWORD *)a1 + 12) = a3;
              unsigned int v48 = a3;
            }

            if (v49)
            {
              size_t v50 = compression_decode_buffer( (uint8_t *)v49,  v48,  (const uint8_t *)(a1[3] + v37),  v17 - v37,  (void *)a1[7],  v38);
              if (v50)
              {
                unsigned int v51 = v50;
                if (HIDWORD(v50))
                {
                  sub_18623172C( @"%s:%d: %s: decmpSize=%zu is too big\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
                  return 22LL;
                }

                if ((_DWORD)v50)
                {
                  uint64_t v52 = 0LL;
                  size_t v32 = 0LL;
                  unint64_t v53 = (char *)a1[5];
                  char v54 = 1;
                  do
                  {
                    uint64_t v55 = a5 + 16 * v52;
                    uint64_t v56 = *(void **)v55;
                    else {
                      uint64_t v57 = *(void *)(v55 + 8);
                    }
                    if (v56) {
                      memcpy(v56, v53, v57);
                    }
                    v32 += v57;
                    v51 -= v57;
                    v53 += v57;
                    char v58 = v54 & (v51 != 0);
                    uint64_t v52 = 1LL;
                    char v54 = 0;
                  }

                  while ((v58 & 1) != 0);
                  goto LABEL_85;
                }

                goto LABEL_84;
              }

LABEL_74:
              sub_18623172C( @"%s:%d: %s: decode failed for compression algorithm 0x%x\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
              return 22LL;
            }

            sub_18623172C( @"%s:%d: %s: allocating buffer of size %llu failed for compression algorithm 0x%x\n",  a2,  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
            return 12LL;
          }

LABEL_47:
          sub_18623172C( @"%s:%d: %s: unknown compression scheme %llu\n",  a2,  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
          return 22LL;
        }

        if (a1[7])
        {
          if (v17 < 2 || (*v15 & 0xF) != 8)
          {
            sub_18623172C( @"%s:%d: %s: invalid zlib header\n",  a2,  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
            return 22LL;
          }

          unsigned int v37 = 2;
          compression_algorithm v38 = COMPRESSION_ZLIB;
          goto LABEL_55;
        }
      }

      sub_18623172C( @"%s:%d: %s: workbuffer allocation failed\n",  a2,  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      return 12LL;
    }

    value[0] = 0xAAAAAAAAAAAAAAAALL;
    if ((sub_1862361AC((uint64_t **)a1, value, 8uLL, 8LL * a2 + 264, (int *)&v59, (uint64_t)a6, a7, a8) & 1) != 0)
    {
      sub_186236378(a1, HIDWORD(value[0]));
      uint64_t v28 = (void *)a1[3];
      if (v28)
      {
        if ((sub_1862361AC( (uint64_t **)a1,  v28,  HIDWORD(value[0]),  LODWORD(value[0]) + 260LL,  (int *)&v59,  v23,  v24,  v25) & 1) != 0)
        {
          uint64_t result = 0LL;
          unsigned int v17 = HIDWORD(value[0]);
          goto LABEL_24;
        }

        goto LABEL_23;
      }

LABEL_62:
      sub_18623172C( @"%s:%d: %s: allocating buffer of size %u failed\n",  0LL,  v20,  v21,  v22,  v23,  v24,  v25,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      unsigned int v17 = 0;
      uint64_t result = 12LL;
      goto LABEL_24;
    }

LABEL_23:
    unsigned int v17 = 0;
    uint64_t result = v59;
    goto LABEL_24;
  }

  value[0] = 0xAAAAAAAAAAAAAAAALL;
  size_t v19 = (HIDWORD(value[0]) - LODWORD(value[0]));
  if (HIDWORD(value[0]) <= LODWORD(value[0]))
  {
    sub_18623172C( @"%s:%d: %s: resource fork offsets are out of order (offsets[1] (%u) <= offsets[0] (%u)) \n",  a2,  a3,  a4,  a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    unsigned int v17 = 0;
    uint64_t result = 22LL;
    goto LABEL_24;
  }

  sub_186236378(a1, (HIDWORD(value[0]) - LODWORD(value[0])));
  uint64_t v26 = (void *)a1[3];
  if (!v26) {
    goto LABEL_62;
  }
  int v27 = sub_1862361AC((uint64_t **)a1, v26, v19, LODWORD(value[0]), (int *)&v59, v23, v24, v25);
  if (v27) {
    unsigned int v17 = v19;
  }
  else {
    unsigned int v17 = 0;
  }
  if (v27) {
    uint64_t result = 0LL;
  }
  else {
    uint64_t result = v59;
  }
LABEL_24:
  if (!(_DWORD)result)
  {
    uint64_t v15 = (_BYTE *)a1[3];
    goto LABEL_26;
  }

  return result;
}

  uint64_t v26 = calloc(v13 + 1, 0x10uLL);
  if (!v26)
  {
    sub_18623172C( @"%s:%d: allocation of %zu bytes failed\n",  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    uint64_t v8 = 12LL;
    goto LABEL_72;
  }

  uint64_t v34 = (uint64_t)v26;
  if (!a2)
  {
    uint64_t v35 = 0LL;
    uint64_t v36 = 0LL;
LABEL_31:
    compression_algorithm v38 = 0LL;
    unsigned int v37 = 0x10000LL;
    goto LABEL_32;
  }

  if (HIWORD(a2))
  {
    sub_18623172C( @"%s:%d: invalid offset: %llu\n",  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    goto LABEL_71;
  }

  uint64_t v35 = a2 >> 16;
  uint64_t v36 = a2 & 0xFFFF00000000FFFFLL;
  if ((a2 & 0xFFFF00000000FFFFLL) == 0) {
    goto LABEL_31;
  }
  *uint64_t v26 = 0LL;
  v26[1] = v36;
  unsigned int v37 = 0x10000 - v36;
  compression_algorithm v38 = 1LL;
LABEL_32:
  size_t v39 = 0LL;
  uint64_t v40 = 0;
  uint64_t v41 = 0LL;
  uint64_t v42 = v36;
  uint64_t v56 = v36;
  uint64_t v57 = v36;
  while (1)
  {
    uint64_t v43 = &a5[2 * v40];
    uint64_t v44 = v43[1] - v41;
    if (v44 >= v37) {
      uint64_t v44 = v37;
    }
    if (v44 >= v14) {
      uint64_t v44 = v14;
    }
    uint64_t v45 = (void *)(v34 + 16 * v38);
    v45[1] = v44;
    if (*v43) {
      uint64_t v46 = *v43 + v41;
    }
    else {
      uint64_t v46 = 0LL;
    }
    *uint64_t v45 = v46;
    v14 -= v44;
    if (v44 + v41 == v43[1])
    {
      ++v40;
      uint64_t v41 = 0LL;
    }

    else
    {
      v41 += v44;
    }

    if (v37 != v44 && v14 != 0 && v40 != v13) {
      goto LABEL_62;
    }
    uint64_t v49 = v44 + v42;
    size_t v50 = v38 + 1;
    while (1)
    {
      unsigned int v51 = v50 - 1;
      if (*(void *)(v34 + 16 * (v50 - 1))) {
        break;
      }
      v49 -= *(void *)(v34 + 16 * v51 + 8);
      size_t v50 = 1LL;
      if (!v51) {
        goto LABEL_62;
      }
    }

    uint64_t v63 = 0LL;
    if (v13 != 1
      || !v57
      || (_DWORD)v50 != 2
      || *(void *)v34
      || (uint64_t v52 = *(void *)(v34 + 24) + *(void *)(v34 + 8), v52 > a5[1]))
    {
      unint64_t v53 = sub_1862363C0(&v58, v35, v49, v50, v34, &v63, v32, v33);
      if ((_DWORD)v53) {
        break;
      }
      goto LABEL_61;
    }

    *(void *)(v34 + 8) = v52;
    *(void *)uint64_t v34 = *a5;
    unint64_t v53 = sub_1862363C0(&v58, v35, v49, 1LL, v34, &v63, v32, v33);
    if ((_DWORD)v53) {
      break;
    }
    memmove(*(void **)v34, (const void *)(*(void *)v34 + v57), *(void *)(v34 + 8) - v57);
    uint64_t v57 = 0LL;
LABEL_61:
    v39 += v63;
LABEL_62:
    compression_algorithm v38 = 0LL;
    uint64_t v42 = 0LL;
    uint64_t v35 = (v35 + 1);
    if (v14) {
      char v54 = v40 == v13;
    }
    else {
      char v54 = 1;
    }
    unsigned int v37 = 0x10000LL;
    if (v54)
    {
      free((void *)v34);
      uint64_t v8 = 0LL;
      *a6 = v39 - v56;
      goto LABEL_72;
    }
  }

  uint64_t v8 = v53;
LABEL_71:
  free((void *)v34);
LABEL_72:
  if (HIDWORD(v58) != 0x10000 && v59[1]) {
    free(v59[1]);
  }
  if (v60[1]) {
    free(v60[1]);
  }
  if (v61[1]) {
    free(v61[1]);
  }
  return v8;
}

uint64_t sub_1862369B0( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 22LL;
  if (!(_DWORD)a4 || !a5) {
    return v8;
  }
  unint64_t v12 = *(void *)(*(void *)(a1 + 16) + 12LL);
  if (v12 <= a2)
  {
    uint64_t v8 = 0LL;
    *a6 = 0LL;
    return v8;
  }

  if ((((unsigned __int128)(a3 + (__int128)(uint64_t)a2) >> 64) & 1) != 0)
  {
    sub_18623172C( @"%s:%d: add overflow: offset %llu, totalSize %llu\n",  a1,  a3,  a4,  (uint64_t)a5,  (uint64_t)a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    return v8;
  }

  int v13 = a4;
  if (v12 >= a3 + a2) {
    uint64_t v14 = a3;
  }
  else {
    uint64_t v14 = v12 - a2;
  }
  unint64_t v62 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v15 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uint64_t v60 = v15;
  *(_OWORD *)uint64_t v61 = v15;
  __int128 v58 = v15;
  *(_OWORD *)unsigned int v59 = v15;
  sub_1862360D4((int *)&v58, a1, a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  v59[1] = 0LL;
  LODWORD(v60[0]) = 0;
  v60[1] = 0LL;
  LODWORD(v61[0]) = 0;
  v61[1] = 0LL;
  unint64_t v62 = 0LL;
  if (SDWORD2(v58) <= 773)
  {
    if (DWORD2(v58) == 460) {
      goto LABEL_23;
    }
    if (DWORD2(v58) != 767) {
      goto LABEL_22;
    }
    compression_algorithm v23 = COMPRESSION_ZLIB;
  }

  else
  {
    switch(DWORD2(v58))
    {
      case 0x5FF:
        compression_algorithm v23 = 1794;
        break;
      case 0x4FF:
        compression_algorithm v23 = COMPRESSION_LZFSE;
        break;
      case 0x306:
        compression_algorithm v23 = 2304;
        break;
      default:
LABEL_22:
        sub_18623172C( @"%s:%d: %s: unknown compression scheme %llu\n",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
        goto LABEL_23;
    }
  }

  size_t v24 = compression_decode_scratch_buffer_size(v23);
  if (v24)
  {
    size_t v25 = v24;
    v61[1] = malloc(v24);
    unint64_t v62 = v25;
  }

void *sub_186236D98(unsigned int a1, int a2)
{
  if (a2)
  {
    if (qword_18C68BDE8 != -1) {
      dispatch_once(&qword_18C68BDE8, &unk_189E385F8);
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_18C68BDF0, 0xFFFFFFFFFFFFFFFFLL);
    return malloc(a1);
  }

  if (qword_18C68BDE8 != -1) {
    dispatch_once(&qword_18C68BDE8, &unk_189E385F8);
  }
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)qword_18C68BDF0, 0LL)) {
    return malloc(a1);
  }
  return 0LL;
}

dispatch_semaphore_t sub_186236E34()
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  size_t v11 = 8LL;
  unint64_t v12 = 0LL;
  *(void *)int v13 = 0x1800000006LL;
  if (sysctl(v13, 2u, &v12, &v11, 0LL, 0LL) == -1)
  {
    unsigned int v2 = __error();
    strerror(*v2);
    sub_18623172C( @"%s:%d: sysctl: %s\n",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
    unint64_t v12 = 0LL;
    goto LABEL_7;
  }

  unint64_t v0 = v12;
  if (!(v12 >> 31))
  {
LABEL_7:
    uint64_t v1 = 8194LL;
    goto LABEL_8;
  }

  v12 -= 0x80000000LL;
  if (v0 - 0x80000000 >= 0x20020000) {
    uint64_t v1 = (int)((uint64_t)(v0 - 0x80000000) >> 16);
  }
  else {
    uint64_t v1 = 8194LL;
  }
LABEL_8:
  dispatch_semaphore_t result = dispatch_semaphore_create(v1);
  qword_18C68BDF0 = (uint64_t)result;
  return result;
}

void *sub_186236F20(void *result)
{
  if (result)
  {
    free(result);
    if (qword_18C68BDE8 != -1) {
      dispatch_once(&qword_18C68BDE8, &unk_189E385F8);
    }
    return (void *)dispatch_semaphore_signal((dispatch_semaphore_t)qword_18C68BDF0);
  }

  return result;
}

int *sub_186236F6C()
{
  unint64_t v0 = getenv("AFSC_MAX_FDS");
  uint64_t v1 = v0;
  if (v0)
  {
    int v2 = atoi(v0);
    sub_18623172C( @"%s:%d: Error: using max fds override of %d\n",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
  }

  else
  {
    int v2 = 48;
  }

  v50.rlim_t rlim_cur = 0LL;
  v50.rlim_t rlim_max = 0LL;
  if (getrlimit(8, &v50) == -1)
  {
    unint64_t v42 = __error();
    strerror(*v42);
    return sub_18623172C( @"%s:%d: getrlimit: %s\n",  v43,  v44,  v45,  v46,  v47,  v48,  v49,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
  }

  else
  {
    unint64_t v10 = v2;
    if (v50.rlim_max >= 0x2800) {
      rlim_t rlim_max = 10240LL;
    }
    else {
      rlim_t rlim_max = v50.rlim_max;
    }
    if (v50.rlim_cur >= rlim_max) {
      rlim_t rlim_cur = rlim_max;
    }
    else {
      rlim_t rlim_cur = v50.rlim_cur;
    }
    rlim_t v13 = rlim_cur + v10;
    if (rlim_cur + v10 >= rlim_max) {
      rlim_t v13 = rlim_max;
    }
    v50.rlim_t rlim_cur = v13;
    if (setrlimit(8, &v50) == -1)
    {
      uint64_t v14 = __error();
      strerror(*v14);
      sub_18623172C( @"%s:%d: setrlimit(RLIMIT_NOFILE.rlim_t rlim_cur = %lld): %s\n",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
    }

    if (getrlimit(8, &v50) == -1)
    {
      uint64_t v29 = __error();
      strerror(*v29);
      sub_18623172C( @"%s:%d: getrlimit(RLIMIT_NOFILE): %s\n",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
    }

    rlim_t v37 = v50.rlim_cur;
    if (v50.rlim_cur >= rlim_max) {
      rlim_t v37 = rlim_max;
    }
    BOOL v38 = v37 >= rlim_cur;
    unint64_t v39 = v37 - rlim_cur;
    if (!v38) {
      unint64_t v39 = 0LL;
    }
    if (v39 <= 0xA) {
      unint64_t v39 = 10LL;
    }
    if (v39 >= v10) {
      uint64_t v40 = v10;
    }
    else {
      uint64_t v40 = v39;
    }
    if (v1)
    {
      if (v39 < v10) {
        sub_18623172C( @"%s:%d: Error: could not use desired max fds of %d, using %llu instead\n",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
      }
    }

    dispatch_semaphore_t result = (int *)dispatch_semaphore_create(v40);
    qword_18C68BDE0 = (uint64_t)result;
  }

  return result;
}

uint64_t type5_handler_function(uint64_t a1)
{
  uint64_t v25 = 0x34F2326416E94937LL;
  int v2 = guarded_open_np();
  if (v2 == -1)
  {
    uint64_t v16 = __error();
    uint64_t v17 = strerror(*v16);
    syslog(3, "afsc open: %s", v17);
    return 0LL;
  }

  int v3 = v2;
  uint64_t v4 = MEMORY[0x1895F87A8];
  int v5 = v2;
  while (1)
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x4800000000LL;
    memset(v24, 0, sizeof(v24));
    if (read(v3, v24, 0x30uLL) != 48)
    {
      uint64_t v6 = __error();
      uint64_t v7 = strerror(*v6);
      syslog(3, "read request from %d: %s", v5, v7);
    }

    uint64_t v8 = v22[4];
    if (v8 != 2) {
      break;
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 8))(v22[5], v22[6]);
    if (write(v3, v22 + 3, 0x30uLL) != 48)
    {
      uint64_t v14 = __error();
      uint64_t v15 = strerror(*v14);
      syslog(3, "send response to %d: %s", v3, v15);
    }

LABEL_10:
    _Block_object_dispose(&v21, 8);
  }

  if (v8 == 1)
  {
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))a1;
    uint64_t v10 = v22[5];
    uint64_t v11 = v22[6];
    uint64_t v12 = v22[7];
    uint64_t v13 = v22[8];
    v19[0] = v4;
    v19[1] = 1107296256LL;
    v19[2] = sub_186237330;
    v19[3] = &unk_189E38618;
    v19[4] = &v21;
    int v20 = v3;
    v9(v10, v11, v12, v13, v19);
    goto LABEL_10;
  }

  syslog(3, "unknown request type from %d: %lld\n", v3, v8);
  _Block_object_dispose(&v21, 8);
  return 0LL;
}

void sub_186237330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 48LL) = a4;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 56LL) = a3;
  if (write(*(_DWORD *)(a1 + 40), (const void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), 0x30uLL) != 48)
  {
    int v5 = *(_DWORD *)(a1 + 40);
    uint64_t v6 = __error();
    uint64_t v7 = strerror(*v6);
    syslog(3, "send response to %d: %s", v5, v7);
  }

void sub_1862373BC(uint64_t a1, uint64_t a2)
{
}

void sub_1862373CC(uint64_t a1)
{
}

uint64_t VolumeSupportsCompression(const char *a1)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (qword_18C68BDF8 != -1) {
    dispatch_once(&qword_18C68BDF8, &unk_189E38668);
  }
  memset(__b, 170, sizeof(__b));
  v2.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nseCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v33.dev_t st_dev = v2;
  *(timespec *)&v33.st_uid = v2;
  v33.st_atimespeCC_SHA256_CTX c = v2;
  v33.st_mtimespeCC_SHA256_CTX c = v2;
  v33.st_ctimespeCC_SHA256_CTX c = v2;
  v33.st_birthtimespeCC_SHA256_CTX c = v2;
  *(timespec *)&v33.off_t st_size = v2;
  *(timespec *)&v33.st_blksize = v2;
  *(timespec *)v33.st_qspare = v2;
  if (realpath_DARWIN_EXTSN(a1, __b))
  {
    if (lstat(__b, &v33) == -1)
    {
LABEL_9:
      uint64_t v12 = __error();
      strerror(*v12);
      sub_18623172C( @"%s:%d: lstat %s: %s\n",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/pathUtils.c");
      return 0LL;
    }

    dev_t st_dev = v33.st_dev;
    if (v33.st_dev == dword_18C68BD78)
    {
      *(_WORD *)statfs __b = 47;
    }

    else
    {
      for (uint64_t i = &__b[strlen(__b) - 1]; i > __b; --i)
      {
        if (*i == 47)
        {
          *uint64_t i = 0;
          if (lstat(__b, &v33) == -1) {
            goto LABEL_9;
          }
          if (v33.st_dev != st_dev)
          {
            *uint64_t i = 47;
            break;
          }
        }
      }
    }
  }

  else
  {
    memset(&v35, 170, sizeof(v35));
    if (statfs(a1, &v35))
    {
      uint64_t v4 = __error();
      strerror(*v4);
LABEL_21:
      sub_18623172C( @"%s:%d: statfs %s: %s\n",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/pathUtils.c");
      return 0LL;
    }

    __strlcpy_chk();
  }

  int v32 = 0;
  __int128 v31 = xmmword_186237EA8;
  *(_OWORD *)&v33.dev_t st_dev = xmmword_186237EBC;
  *(void *)&v33.st_uid = 0LL;
  if (getattrlist(__b, &v33, &v31, 0x14uLL, 0))
  {
    if (*__error() != 22)
    {
      uint64_t v22 = __error();
      strerror(*v22);
      sub_18623172C( @"%s:%d: getattrlist %s: %s\n",  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/pathUtils.c");
      return 0LL;
    }

    bzero(&v35, 0x878uLL);
    if (statfs(a1, &v35))
    {
      uint64_t v21 = __error();
      strerror(*v21);
      goto LABEL_21;
    }

    if (*(_DWORD *)v35.f_fstypename != 7562856) {
      return 0LL;
    }
  }

  else if ((BYTE6(v31) & 1) == 0)
  {
    return 0LL;
  }

  return 1LL;
}

int *sub_1862376B0()
{
  v0.__darwin_time_t tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v0.tv_nseCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v10.st_blksize = v0;
  *(timespec *)v10.st_qspare = v0;
  v10.st_birthtimespeCC_SHA256_CTX c = v0;
  *(timespec *)&v10.off_t st_size = v0;
  v10.st_mtimespeCC_SHA256_CTX c = v0;
  v10.st_ctimespeCC_SHA256_CTX c = v0;
  *(timespec *)&v10.st_uid = v0;
  v10.st_atimespeCC_SHA256_CTX c = v0;
  *(timespec *)&v10.dev_t st_dev = v0;
  dispatch_semaphore_t result = (int *)stat("/", &v10);
  if ((_DWORD)result == -1)
  {
    timespec v2 = __error();
    strerror(*v2);
    dispatch_semaphore_t result = sub_18623172C( @"%s:%d: stat /: %s\n",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/pathUtils.c");
  }

  dword_18C68BD78 = v10.st_dev;
  return result;
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

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

CFURLRef CFBundleCopyResourceURL( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x189602850](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1896028A0](allocator, bundleURL);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189603000](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x189603060](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFSetRef CFSetCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x189603250](allocator, values, numValues, callBacks);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x189603488](alloc, buffer);
}

CFStringRef CFStringCreateWithFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x189603498](alloc, formatOptions, format, arguments);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1896034C0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x189603540](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1896035A8](theString, suffix);
}

CFURLRef CFURLCreateFromFileSystemRepresentation( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603780](allocator, buffer, bufLen, isDirectory);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

void abort(void)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895F95D0](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
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

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1895FAD98](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB270](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB298](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
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

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB438](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FB460](*(void *)&a1, a2);
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

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1895FB680](*(void *)&a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

uint64_t guarded_open_np()
{
  return MEMORY[0x1895FB740]();
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FB9B0](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1895FCD78](a1, *(void *)&a2);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x1895FCEB8](*(void *)&a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1895FD4A8](a1, a2);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}