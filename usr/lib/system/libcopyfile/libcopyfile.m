int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  copyfile_state_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int *v18;
  int v19;
  int v21;
  stat v22;
  copyfile_state_t v23;
  v23 = a3;
  if ((to_fd | from_fd) < 0)
  {
    v18 = __error();
    v19 = 22;
LABEL_30:
    *v18 = v19;
    return -1;
  }

  if ((copyfile_preamble(&v23, flags) & 0x80000000) != 0) {
    return -1;
  }
  v8 = v23;
  if (v23 && *((_DWORD *)v23 + 69) >= 2u)
  {
    v9 = *__error();
    syslog( 7,  "%s:%d:%s() set src_fd <- %d\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1029,  "fcopyfile",  from_fd);
    *__error() = v9;
  }

  if (*((_DWORD *)v8 + 4) == -2)
  {
    *((_DWORD *)v8 + 4) = from_fd;
    if (fstatx_np(from_fd, (stat *)((char *)v8 + 32), *((filesec_t *)v8 + 23)))
    {
      if (*__error() != 45 && *__error() != 1)
      {
        v21 = *__error();
        syslog(4, "fstatx_np on src fd %d: %m", *((_DWORD *)v8 + 4));
        *__error() = v21;
        return -1;
      }

      fstat(*((_DWORD *)v8 + 4), (stat *)((char *)v8 + 32));
    }
  }

  v10 = *((_WORD *)v8 + 18) & 0xF000;
  if (v10 != 0x4000 && v10 != 0x8000 && v10 != 40960)
  {
    v18 = __error();
    v19 = 45;
    goto LABEL_30;
  }

  if (*((_DWORD *)v8 + 69) >= 2u)
  {
    v11 = *__error();
    syslog( 7,  "%s:%d:%s() set dst_fd <- %d\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1057,  "fcopyfile",  to_fd);
    *__error() = v11;
  }

  v12 = *((_DWORD *)v8 + 6);
  if (v12 == -2)
  {
    *((_DWORD *)v8 + 6) = to_fd;
    v12 = to_fd;
  }

  v13 = fstat(v12, &v22);
  fchmod(*((_DWORD *)v8 + 6), v22.st_mode & 0xE7F | 0x180);
  if (!*((void *)v8 + 28)) {
    *((void *)v8 + 28) = 0LL;
  }
  v14 = copyfile_internal(v8, flags);
  if ((v13 & 0x80000000) == 0 && (*((_BYTE *)v8 + 192) & 2) == 0)
  {
    v15 = *__error();
    fchmod(*((_DWORD *)v8 + 6), v22.st_mode & 0xFFF);
    *__error() = v15;
  }

  v16 = *((_DWORD *)v8 + 68);
  if (v16)
  {
    *__error() = v16;
    *((_DWORD *)v8 + 68) = 0;
  }

  if (!a3)
  {
    v17 = *__error();
    copyfile_state_free(v8);
    *__error() = v17;
  }

  if ((v14 & 0x80000000) == 0) {
    *__error() = 0;
  }
  return v14;
}

uint64_t copyfile_preamble(copyfile_state_t *a1, int a2)
{
  copyfile_state_t v3 = *a1;
  if (!*a1)
  {
    copyfile_state_t v3 = copyfile_state_alloc();
    *a1 = v3;
    if (!v3) {
      return 0xFFFFFFFFLL;
    }
  }

  if (a2 < 0)
  {
    v5 = getenv("COPYFILE_DEBUG");
    if (v5)
    {
      v6 = v5;
      *__error() = 0;
      int v7 = strtol(v6, 0LL, 0);
      *((_DWORD *)v3 + 69) = v7;
      if (!v7)
      {
        if (*__error()) {
          *((_DWORD *)v3 + 69) = 1;
        }
      }
    }

    if (*((_DWORD *)v3 + 69) >= 2u)
    {
      int v8 = *__error();
      syslog( 7,  "%s:%d:%s() debug value set to: %d\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1507,  "copyfile_preamble",  *((_DWORD *)v3 + 69));
      *__error() = v8;
    }
  }

  if (*((_DWORD *)v3 + 69) >= 2u)
  {
    int v9 = *__error();
    syslog( 7,  "%s:%d:%s() setting flags: %d\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1518,  "copyfile_preamble",  *((_DWORD *)v3 + 48));
    *__error() = v9;
  }

  uint64_t result = 0LL;
  *((_DWORD *)v3 + 48) = a2;
  return result;
}

uint64_t copyfile_internal(void *a1, int a2)
{
  uint64_t v180 = *MEMORY[0x1895FEE08];
  int v3 = *((_DWORD *)a1 + 6);
  if (v3 < 0 || (a1[2] & 0x80000000) != 0)
  {
    if (*((_DWORD *)a1 + 69))
    {
      int v13 = *__error();
      syslog( 7,  "%s:%d:%s() file descriptors not open (src: %d, dst: %d)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1535,  "copyfile_internal",  *((_DWORD *)a1 + 4),  *((_DWORD *)a1 + 6));
      *__error() = v13;
    }

    *((_DWORD *)a1 + 68) = 22;
    return 0xFFFFFFFFLL;
  }

  if ((a2 & 0x400000) != 0)
  {
    uint64_t v5 = copyfile_pack(a1);
    if ((v5 & 0x80000000) != 0)
    {
      v15 = (const char *)a1[1];
      if (v15) {
        unlink(v15);
      }
    }

    return v5;
  }

  if ((a2 & 0x800000) != 0)
  {
    else {
      size_t v16 = a1[16];
    }
    v17 = calloc(1uLL, v16);
    if (!v17)
    {
      if (*((_DWORD *)a1 + 69))
      {
        int v32 = *__error();
        syslog( 7,  "%s:%d:%s() copyfile_unpack: calloc(1, %zu) returned NULL\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  4661,  "copyfile_unpack",  v16);
        *__error() = v32;
      }

      return 0xFFFFFFFFLL;
    }

    unint64_t v18 = (unint64_t)v17;
    ssize_t v19 = pread(*((_DWORD *)a1 + 4), v17, v16, 0LL);
    int v20 = v19;
    if (v19 < 0)
    {
      if (*((_DWORD *)a1 + 69))
      {
        int v33 = *__error();
        syslog(7, "%s:%d:%s() pread returned: %zd\n");
LABEL_78:
        *__error() = v33;
      }
    }

    else
    {
      if (v19 < (uint64_t)v16)
      {
        if (*((_DWORD *)a1 + 69))
        {
          int v21 = *__error();
          syslog( 7,  "%s:%d:%s() pread couldn't read entire header: %d of %d\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  4679,  "copyfile_unpack",  v20,  a1[16]);
          *__error() = v21;
        }

        goto LABEL_79;
      }

      if ((unint64_t)v19 >= 0x52
        && *(_DWORD *)v18 == 118883584
        && *(_DWORD *)(v18 + 4) == 512
        && *(_WORD *)(v18 + 24) == 512
        && *(_DWORD *)(v18 + 26) == 150994944)
      {
        swap_adhdr((int8x8_t *)v18);
        ssize_t v34 = flistxattr(*((_DWORD *)a1 + 6), 0LL, 0LL, 0);
        size_t v35 = v34;
        if (v34 < 1)
        {
          if (v34 < 0 && *__error() != 45 && *__error() != 1)
          {
            uint64_t v5 = 0LL;
            goto LABEL_80;
          }
        }

        else
        {
          uint64_t v5 = (uint64_t)malloc(v34);
          if (!v5)
          {
            *((_DWORD *)a1 + 68) = 12;
            goto LABEL_80;
          }

          ssize_t v36 = flistxattr(*((_DWORD *)a1 + 6), (char *)v5, v35, 0);
          if (v36 >= 1)
          {
            unint64_t v37 = v5 + v36;
            v38 = (const char *)v5;
            do
            {
              fremovexattr(*((_DWORD *)a1 + 6), v38, 0);
              v38 += strlen(v38) + 1;
            }

            while ((unint64_t)v38 < v37);
          }

          free((void *)v5);
        }

        if (*(_DWORD *)(v18 + 34) >= 0x21u)
        {
          if (v16 <= 0x77)
          {
            int v33 = *__error();
            syslog(4, "bad attribute header:  %zu < %zu: %m");
            goto LABEL_78;
          }

          swap_attrhdr(v18);
          if (*(_DWORD *)(v18 + 84) != 1096045650)
          {
            if ((*((_BYTE *)a1 + 195) & 0x40) == 0) {
              goto LABEL_79;
            }
            int v33 = *__error();
            syslog(4, "bad attribute header: %m");
            goto LABEL_78;
          }

          int v117 = *(unsigned __int16 *)(v18 + 118);
          if (*(_WORD *)(v18 + 118))
          {
            v118 = 0LL;
            unsigned int sizea = 0;
            unint64_t v119 = v18 + v16;
            v120 = (unsigned int *)(v18 + 120);
            while (1)
            {
              if ((unint64_t)v120 >= v119 || (unint64_t)v120 < v18 || (unint64_t)(v120 + 3) > v119)
              {
                if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
                {
                  int v141 = *__error();
                  syslog(4, "Incomplete or corrupt attribute entry: %m");
                  goto LABEL_401;
                }

LABEL_402:
                *((_DWORD *)a1 + 68) = 22;
LABEL_340:
                uint64_t v5 = 0xFFFFFFFFLL;
                v126 = (void *)v18;
                goto LABEL_431;
              }

              unsigned int v121 = bswap32(v120[1]);
              unsigned int *v120 = bswap32(*v120);
              v120[1] = v121;
              *((_WORD *)v120 + 4) = bswap32(*((unsigned __int16 *)v120 + 4)) >> 16;
              uint64_t v122 = *((unsigned __int8 *)v120 + 10);
              if (v122 <= 1)
              {
                if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
                {
                  int v141 = *__error();
                  syslog(4, "Corrupt attribute entry (only %d bytes): %m");
LABEL_401:
                  *__error() = v141;
                }

                goto LABEL_402;
              }

              __dsta = v118;
              if (v122 >= 0x81)
              {
                if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
                {
                  int v155 = *__error();
                  syslog(4, "Corrupt attribute entry (name length is %d bytes): %m");
                  goto LABEL_409;
                }

                goto LABEL_410;
              }

              if ((unint64_t)v120 + v122 + 11 > v119)
              {
                if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
                {
                  int v155 = *__error();
                  syslog(4, "Incomplete or corrupt attribute entry: %m", v164);
                  goto LABEL_409;
                }

LABEL_410:
                int v156 = 22;
                goto LABEL_414;
              }

              if (*((_BYTE *)v120 + (v122 - 1) + 11))
              {
                if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
                {
                  int v155 = *__error();
                  syslog(4, "Corrupt attribute entry (name is not NUL-terminated): %m", v164);
LABEL_409:
                  *__error() = v155;
                }

                goto LABEL_410;
              }

              if (*((_DWORD *)a1 + 69) >= 3u)
              {
                int v123 = *__error();
                syslog( 7,  "%s:%d:%s() extracting %s (%d bytes) at offset %u\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  4851,  "copyfile_unpack",  (const char *)v120 + 11,  v120[1],  *v120);
                *__error() = v123;
                unsigned int v121 = v120[1];
              }

              size_t v124 = v121;
              v125 = malloc(v121);
              if (!v125)
              {
                if (*((_DWORD *)a1 + 69))
                {
                  int v157 = *__error();
                  syslog( 7,  "%s:%d:%s() no memory for %u bytes\n\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  4855,  "copyfile_unpack",  v120[1]);
                  *__error() = v157;
                }

                int v156 = 12;
LABEL_414:
                *((_DWORD *)a1 + 68) = v156;
                uint64_t v5 = 0xFFFFFFFFLL;
                v126 = (void *)v18;
LABEL_419:
                v118 = __dsta;
LABEL_431:
                free(v126);
                if (v118)
                {
LABEL_432:
                  v43 = v118;
LABEL_81:
                  free(v43);
                }

                if ((v5 & 0x80000000) == 0) {
                  return v5;
                }
                return 0xFFFFFFFFLL;
              }

              v126 = v125;
              ssize_t v127 = pread(*((_DWORD *)a1 + 4), v125, v124, *v120);
              uint64_t v128 = v120[1];
              if (v127 != v128)
              {
                if (*((_DWORD *)a1 + 69))
                {
                  int v158 = *__error();
                  syslog( 7,  "%s:%d:%s() failed to read %u bytes at offset %u\n\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  4861,  "copyfile_unpack",  v120[1],  *v120);
                  *__error() = v158;
                }

                *((_DWORD *)a1 + 68) = 22;
                goto LABEL_418;
              }

              size_t v129 = v127;
              if (strcmp((const char *)v120 + 11, "com.apple.acl.text"))
              {
                uint64_t v5 = copyfile_unpack_xattr(a1, (uint64_t)v120, v126);
                if ((_DWORD)v5 == -1) {
                  goto LABEL_418;
                }
                goto LABEL_336;
              }

              if (!(_DWORD)v128)
              {
LABEL_335:
                uint64_t v5 = 0LL;
              }

              else
              {
                __dsta = (char *)malloc(v129);
                if (!__dsta)
                {
                  __dsta = 0LL;
LABEL_418:
                  free((void *)v18);
                  uint64_t v5 = 0xFFFFFFFFLL;
                  goto LABEL_419;
                }

                memcpy(__dsta, v126, v129);
                uint64_t v5 = 0LL;
                unsigned int sizea = v128;
              }

LABEL_336:
              free(v126);
              v120 = (unsigned int *)((char *)v120 + ((*((unsigned __int8 *)v120 + 10) + 14) & 0x1FC));
              --v117;
              v118 = __dsta;
              if (!v117) {
                goto LABEL_339;
              }
            }
          }
        }

        unsigned int sizea = 0;
        v118 = 0LL;
        uint64_t v5 = 0LL;
LABEL_339:
        unint64_t v130 = *(unsigned int *)(v18 + 30);
        if (v16 - 32 < v130) {
          goto LABEL_340;
        }
        v131 = v118;
        if (*(void *)(v18 + v130) | *(void *)(v18 + v130 + 8) | *(void *)(v18 + v130 + 16) | *(void *)(v18 + v130 + 24))
        {
          uint64_t v132 = *(unsigned int *)(v18 + 30);
          if (*((_DWORD *)a1 + 69) >= 3u)
          {
            int v133 = *__error();
            syslog( 7,  "%s:%d:%s()  extracting %s (32 bytes)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  4934,  "copyfile_unpack",  "com.apple.FinderInfo");
            *__error() = v133;
          }

          v134 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
          if (v134)
          {
            a1[31] = "com.apple.FinderInfo";
            int v135 = v134(5LL, 1LL, a1, *a1, a1[1], a1[27]);
            a1[31] = 0LL;
            if (v135 == 1) {
              goto LABEL_374;
            }
            if (v135 == 2) {
              goto LABEL_367;
            }
          }

          uint64_t v136 = fsetxattr( *((_DWORD *)a1 + 6),  "com.apple.FinderInfo",  (const void *)(v18 + *(unsigned int *)(v18 + 30)),  0x20uLL,  0,  0);
          v137 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
          if ((_DWORD)v136)
          {
            uint64_t v5 = v136;
            if (!v137) {
              goto LABEL_430;
            }
            a1[31] = "com.apple.FinderInfo";
            int v138 = v137(5LL, 3LL, a1, *a1, a1[1], a1[27]);
            a1[31] = 0LL;
            if (v138 != 2) {
              goto LABEL_430;
            }
            goto LABEL_367;
          }

          if (v137)
          {
            a1[31] = "com.apple.FinderInfo";
            int v140 = v137(5LL, 2LL, a1, *a1, a1[1], a1[27]);
            a1[31] = 0LL;
            if (v140 == 2)
            {
LABEL_367:
              *((_DWORD *)a1 + 68) = 89;
LABEL_368:
              uint64_t v5 = 0xFFFFFFFFLL;
              goto LABEL_430;
            }
          }

          uint64_t v5 = 0LL;
          if ((*(_WORD *)(v18 + v132 + 8) & 0x40) != 0) {
            *((_DWORD *)a1 + 49) |= 2u;
          }
        }

LABEL_374:
        if (*(_DWORD *)(v18 + 38) != 2) {
          goto LABEL_426;
        }
        int64_t v142 = *(unsigned int *)(v18 + 46);
        if (!(_DWORD)v142) {
          goto LABEL_426;
        }
        off_t v143 = *(unsigned int *)(v18 + 42);
        v144 = malloc(*(unsigned int *)(v18 + 46));
        if (!v144)
        {
          if (*((_DWORD *)a1 + 69))
          {
            int v150 = *__error();
            syslog( 7,  "%s:%d:%s() could not allocate %zu bytes for rsrcforkdata\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5002,  "copyfile_unpack",  v142);
            *__error() = v150;
          }

          uint64_t v5 = 0xFFFFFFFFLL;
          goto LABEL_426;
        }

        v145 = v144;
        if (fstat(*((_DWORD *)a1 + 6), (stat *)&v179) < 0)
        {
          if (*((_DWORD *)a1 + 69))
          {
            int v149 = *__error();
            syslog(7, "%s:%d:%s() couldn't stat destination file\n");
            goto LABEL_422;
          }

LABEL_424:
          uint64_t v5 = 0xFFFFFFFFLL;
          goto LABEL_425;
        }

        ssize_t v146 = pread(*((_DWORD *)a1 + 4), v145, v142, v143);
        size_t v147 = v146;
        if (v146 < v142)
        {
          int v148 = *((_DWORD *)a1 + 69);
          if (v146 == -1)
          {
            if (v148)
            {
              int v149 = *__error();
              syslog(7, "%s:%d:%s() couldn't read resource fork\n");
              goto LABEL_422;
            }
          }

          else if (v148)
          {
            int v149 = *__error();
            syslog(7, "%s:%d:%s() couldn't read resource fork (only read %d bytes of %d)\n");
LABEL_422:
            uint64_t v5 = 0xFFFFFFFFLL;
LABEL_423:
            *__error() = v149;
            goto LABEL_425;
          }

          goto LABEL_424;
        }

        v151 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
        if (!v151) {
          goto LABEL_452;
        }
        a1[31] = "com.apple.ResourceFork";
        int v152 = v151(5LL, 1LL, a1, *a1, a1[1], a1[27]);
        a1[31] = 0LL;
        if (v152 == 1)
        {
LABEL_425:
          free(v145);
LABEL_426:
          if (v131)
          {
            v118 = v131;
            uint64_t v5 = copyfile_unpack_acl((uint64_t)a1, sizea, v131);
            if ((_DWORD)v5 == -1)
            {
              free((void *)v18);
              uint64_t v5 = 0xFFFFFFFFLL;
              goto LABEL_432;
            }
          }

          if ((a1[24] & 2) != 0)
          {
            copyfile_stat((uint64_t)a1);
            uint64_t v5 = 0LL;
          }

LABEL_430:
          v126 = (void *)v18;
          v118 = v131;
          goto LABEL_431;
        }

        if (v152 != 2)
        {
LABEL_452:
          if (fsetxattr(*((_DWORD *)a1 + 6), "com.apple.ResourceFork", v145, v147, 0, 0))
          {
            if (v147 == 286 && (v179.f_iosize & 0xF000) == 0x4000 && !memcmp(v145, &empty_rsrcfork_header, 0x11EuLL))
            {
              if (*((_DWORD *)a1 + 69) >= 2u)
              {
                int v163 = *__error();
                syslog( 7,  "%s:%d:%s() not setting empty resource fork on directory\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5059,  "copyfile_unpack");
                int v149 = 0;
                uint64_t v5 = 0LL;
                *__error() = v163;
                goto LABEL_423;
              }
            }

            else
            {
              v153 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
              if (!v153
                || (a1[31] = "com.apple.ResourceFork", int v154 = v153(5LL, 3LL, a1, *a1, a1[1], a1[27]), a1[31] = 0LL, v154))
              {
                if (*((_DWORD *)a1 + 69))
                {
                  int v149 = *__error();
                  syslog(7, "%s:%d:%s() error %d setting resource fork attribute\n");
                  goto LABEL_422;
                }

                goto LABEL_424;
              }
            }

            int v149 = 0;
LABEL_449:
            uint64_t v5 = 0LL;
            goto LABEL_423;
          }

          v159 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
          if (!v159
            || (a1[31] = "com.apple.ResourceFork", int v160 = v159(5LL, 2LL, a1, *a1, a1[1], a1[27]),
                                                   a1[31] = 0LL,
                                                   v160 != 2))
          {
            if (*((_DWORD *)a1 + 69) >= 3u)
            {
              int v161 = *__error();
              syslog( 7,  "%s:%d:%s() extracting %s (%d bytes)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5090,  "copyfile_unpack",  "com.apple.ResourceFork",  v142);
              *__error() = v161;
            }

            if ((a1[24] & 2) != 0
              || (acl[1] = 0LL,
                  acl[2] = 0LL,
                  acl[0] = (acl_t)0x140000000005LL,
                  *(_OWORD *)&v178.st_dev = *(_OWORD *)v179.f_fsid.val,
                  *(_OWORD *)&v178.st_uid = *(_OWORD *)&v179.f_files,
                  !fsetattrlist(*((_DWORD *)a1 + 6), acl, &v178, 0x20uLL, 0)))
            {
              uint64_t v5 = 0LL;
              goto LABEL_425;
            }

            int v149 = *__error();
            v162 = (const char *)a1[1];
            if (!v162) {
              v162 = "(null dst)";
            }
            syslog(4, "%s: set times: %m", v162);
            goto LABEL_449;
          }
        }

        *((_DWORD *)a1 + 68) = 89;
        free(v145);
        goto LABEL_368;
      }

      if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
      {
        int v33 = *__error();
        syslog(4, "Not a valid Apple Double header: %m");
        goto LABEL_78;
      }
    }

LABEL_79:
    uint64_t v5 = 0xFFFFFFFFLL;
LABEL_80:
    v43 = (void *)v18;
    goto LABEL_81;
  }

  if ((a2 & 4) == 0) {
    goto LABEL_6;
  }
  ssize_t v22 = flistxattr(v3, 0LL, 0LL, 0);
  size_t v23 = v22;
  if (v22 < 1)
  {
    if (v22 < 0) {
      goto LABEL_124;
    }
    goto LABEL_102;
  }

  v24 = 0LL;
  int64_t v25 = 0LL;
  int v26 = -3;
  while (1)
  {
    if ((uint64_t)v23 <= v25)
    {
      size_t v23 = v25;
      v28 = v24;
    }

    else
    {
      if (v23 >= 0x2000001)
      {
        int v27 = *__error();
        syslog( 4,  "destination's xattr list size (%zu) exceeds the threshold (%d); trying to allocate: %m",
          v23,
          0x2000000);
        *__error() = v27;
      }

      v28 = (char *)realloc(v24, v23);
      if (!v28)
      {
LABEL_128:
        if (!v24) {
          goto LABEL_144;
        }
        goto LABEL_143;
      }
    }

    int64_t v25 = v23;
    ssize_t v29 = flistxattr(*((_DWORD *)a1 + 6), v28, v23, 0);
    if ((v29 & 0x8000000000000000LL) == 0) {
      break;
    }
    if (*__error() != 34 || v26 == 0) {
      goto LABEL_100;
    }
    ssize_t v31 = flistxattr(*((_DWORD *)a1 + 6), 0LL, 0LL, 0);
    size_t v23 = v31;
    ++v26;
    v24 = v28;
    if (v31 < 1)
    {
      if (v31 < 0)
      {
        if (v28) {
          free(v28);
        }
        goto LABEL_124;
      }

LABEL_100:
      if (v28) {
        goto LABEL_101;
      }
      goto LABEL_102;
    }
  }

  if (!v29) {
    goto LABEL_100;
  }
  v44 = &v28[v29 - 1];
  if (*v44) {
    char *v44 = 0;
  }
  if (v28 <= v44)
  {
    v45 = v28;
    do
    {
      if (strncmp(v45, "figgledidiggledy", v44 - v45)) {
        fremovexattr(*((_DWORD *)a1 + 6), v45, 0);
      }
      v45 += strlen(v45) + 1;
    }

    while (v45 <= v44);
    goto LABEL_100;
  }

LABEL_101:
  free(v28);
LABEL_102:
  if ((a1[24] & 8) != 0 && (*((_BYTE *)a1 + 148) & 0x20) != 0 && doesdecmpfs(*((_DWORD *)a1 + 4)))
  {
    BOOL v46 = doesdecmpfs(*((_DWORD *)a1 + 6));
    BOOL v47 = !v46;
    int v48 = 32 * v46;
  }

  else
  {
    int v48 = 0;
    BOOL v47 = 1;
  }

  ssize_t v49 = flistxattr(*((_DWORD *)a1 + 4), 0LL, 0LL, v48);
  if (v49 < 1) {
    goto LABEL_123;
  }
  BOOL __dst = v47;
  v24 = 0LL;
  ssize_t v50 = 0LL;
  int v51 = -3;
  while (1)
  {
    if (v49 <= v50)
    {
      ssize_t v49 = v50;
      v53 = v24;
    }

    else
    {
      if ((unint64_t)v49 >= 0x2000001)
      {
        int v52 = *__error();
        syslog(4, "source's xattr list size (%zu) exceeds the threshold (%d); trying to allocate: %m", v49, 0x2000000);
        *__error() = v52;
      }

      v53 = (char *)realloc(v24, v49);
      if (!v53) {
        goto LABEL_128;
      }
    }

    ssize_t v50 = v49;
    ssize_t v54 = flistxattr(*((_DWORD *)a1 + 4), v53, v49, v48);
    uint64_t v5 = v54;
    if ((v54 & 0x8000000000000000LL) == 0) {
      break;
    }
    if (*__error() != 34 || v51 == 0) {
      goto LABEL_137;
    }
    ssize_t v49 = flistxattr(*((_DWORD *)a1 + 4), 0LL, 0LL, v48);
    ++v51;
    v24 = v53;
    if (v49 <= 0)
    {
      if (v53) {
        free(v53);
      }
LABEL_123:
      if (v49)
      {
LABEL_124:
        if (*__error() != 45)
        {
          if (*__error() == 1) {
            uint64_t v5 = 0LL;
          }
          else {
            uint64_t v5 = 0xFFFFFFFFLL;
          }
          goto LABEL_358;
        }
      }

LABEL_6:
      uint64_t v5 = 0LL;
LABEL_7:
      if ((a2 & 0x8000008) != 0)
      {
        uint64_t v5 = copyfile_data(a1, 0);
        if ((v5 & 0x80000000) != 0)
        {
          int v39 = *__error();
          syslog(4, "error processing data: %m");
          *__error() = v39;
          v40 = (const char *)a1[1];
          if (v40 && unlink(v40))
          {
            int v41 = *__error();
            v42 = (const char *)*a1;
            if (!*a1) {
              v42 = "(null src)";
            }
            syslog(4, "%s: remove: %m", v42);
            *__error() = v41;
          }

          return v5;
        }
      }

      if ((a2 & 3) == 0) {
        goto LABEL_282;
      }
      acl[0] = 0LL;
      obj_p = 0LL;
      acl_t acl_p = 0LL;
      filesec_t v6 = filesec_init();
      if (!v6)
      {
        uint64_t v5 = 0xFFFFFFFFLL;
        goto LABEL_284;
      }

      int v7 = v6;
      if ((a1[24] & 1) == 0) {
        goto LABEL_12;
      }
      if (filesec_get_property((filesec_t)a1[23], FILESEC_ACL, acl))
      {
        if (*__error() == 2)
        {
          acl[0] = 0LL;
          goto LABEL_90;
        }

LABEL_91:
        uint64_t v5 = 0xFFFFFFFFLL;
LABEL_275:
        filesec_free(v7);
        if (acl[0]) {
          acl_free(acl[0]);
        }
        if (obj_p) {
          acl_free(obj_p);
        }
        if (acl_p) {
          acl_free(acl_p);
        }
        if ((v5 & 0x80000000) == 0)
        {
LABEL_282:
          if ((a2 & 2) != 0)
          {
            copyfile_stat((uint64_t)a1);
            return 0LL;
          }

          return v5;
        }

LABEL_284:
        int v109 = *__error();
        syslog(4, "error processing security information: %m");
        goto LABEL_285;
      }

LABEL_90:
      if (fstatx_np(*((_DWORD *)a1 + 6), &v178, v7)) {
        goto LABEL_91;
      }
      if (filesec_get_property(v7, FILESEC_ACL, &obj_p))
      {
        if (*__error() != 2) {
          goto LABEL_91;
        }
        unint64_t v59 = 0LL;
        obj_p = 0LL;
      }

      else
      {
        unint64_t v59 = (unint64_t)obj_p;
      }

      if ((unint64_t)acl[0] | v59)
      {
        acl_t acl_p = acl_init(4);
        if (!acl_p) {
          goto LABEL_91;
        }
        if (acl[0])
        {
          *(void *)&v179.f_buint64_t size = 0LL;
          acl_entry_t entry_p = 0LL;
          uint64_t v5 = 0LL;
          if (!acl_get_entry(acl[0], 0, (acl_entry_t *)&v179))
          {
            uint64_t v5 = 0LL;
            do
            {
              acl_flagset_t flagset_p = 0LL;
              acl_get_flagset_np(*(void **)&v179.f_bsize, &flagset_p);
              if (!acl_get_flag_np(flagset_p, ACL_ENTRY_INHERITED))
              {
                if (acl_create_entry(&acl_p, &entry_p) == -1) {
                  goto LABEL_91;
                }
                uint64_t v97 = acl_copy_entry(entry_p, *(acl_entry_t *)&v179.f_bsize);
                if ((_DWORD)v97 == -1) {
                  goto LABEL_91;
                }
                uint64_t v5 = v97;
                if (*((_DWORD *)a1 + 69) >= 2u)
                {
                  int v98 = *__error();
                  v99 = (const char *)*a1;
                  v100 = (const char *)a1[1];
                  if (!*a1) {
                    v99 = "(null src)";
                  }
                  if (!v100) {
                    v100 = "(null tmp)";
                  }
                  syslog( 7,  "%s:%d:%s() copied acl entry from %s to %s\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  3166,  "copyfile_security",  v99,  v100);
                  *__error() = v98;
                }
              }

              if (*(void *)&v179.f_bsize) {
                int v101 = -1;
              }
              else {
                int v101 = 0;
              }
            }

            while (!acl_get_entry(acl[0], v101, (acl_entry_t *)&v179));
          }
        }

        else
        {
          uint64_t v5 = 0LL;
        }

        if (obj_p)
        {
          *(void *)&v179.f_buint64_t size = 0LL;
          acl_flagset_t flagset_p = 0LL;
          acl_entry_t entry_p = 0LL;
          if (!acl_get_entry((acl_t)obj_p, 0, (acl_entry_t *)&v179))
          {
            do
            {
              acl_get_flagset_np(*(void **)&v179.f_bsize, &flagset_p);
              if (acl_get_flag_np(flagset_p, ACL_ENTRY_INHERITED))
              {
                if (acl_create_entry(&acl_p, &entry_p) == -1) {
                  goto LABEL_91;
                }
                uint64_t v110 = acl_copy_entry(entry_p, *(acl_entry_t *)&v179.f_bsize);
                if ((_DWORD)v110 == -1) {
                  goto LABEL_91;
                }
                uint64_t v5 = v110;
                if (a1 && *((_DWORD *)a1 + 69) >= 2u)
                {
                  int v111 = *__error();
                  v112 = (const char *)*a1;
                  v113 = (const char *)a1[1];
                  if (!*a1) {
                    v112 = "(null dst)";
                  }
                  if (!v113) {
                    v113 = "(null tmp)";
                  }
                  syslog( 7,  "%s:%d:%s() copied acl entry from %s to %s\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  3190,  "copyfile_security",  v112,  v113);
                  *__error() = v111;
                }
              }

              if (*(void *)&v179.f_bsize) {
                int v114 = -1;
              }
              else {
                int v114 = 0;
              }
            }

            while (!acl_get_entry((acl_t)obj_p, v114, (acl_entry_t *)&v179));
          }
        }

        int v115 = filesec_set_property((filesec_t)a1[23], FILESEC_ACL, &acl_p);
        if (a1 && !v115 && *((_DWORD *)a1 + 69) >= 3u)
        {
          int v116 = *__error();
          syslog( 7,  "%s:%d:%s() altered acl\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  3197,  "copyfile_security");
          *__error() = v116;
        }
      }

      else
      {
LABEL_12:
        uint64_t v5 = 0LL;
      }

      filesec_t v8 = filesec_dup((filesec_t)a1[23]);
      if (!v8) {
        goto LABEL_91;
      }
      int v9 = v8;
      mode_t v10 = *((_WORD *)a1 + 18);
      if ((a1[24] & 2) == 0 || (int v11 = *((_DWORD *)a1 + 49), (v11 & 0x4000) != 0))
      {
        BOOL v12 = 1;
      }

      else if ((v11 & 0x8000) != 0 {
             || fstatfs(*((_DWORD *)a1 + 4), &v179) != -1 && (v179.f_flags & 8) != 0
      }
             || (BOOL v12 = 1, fstatfs(*((_DWORD *)a1 + 6), &v179) != -1) && (v179.f_flags & 8) != 0)
      {
        LOWORD(v179.f_bsize) = 0;
        if (filesec_get_property(v9, FILESEC_MODE, &v179) || (v179.f_bsize & 0xC00) == 0)
        {
          BOOL v12 = 1;
        }

        else
        {
          LOWORD(v179.f_bsize) &= 0xF3FFu;
          BOOL v12 = filesec_set_property(v9, FILESEC_MODE, &v179) == 0;
        }

        v10 &= 0xF3FFu;
      }

      int v102 = a1[24] & 3;
      switch(v102)
      {
        case 3:
LABEL_256:
          if (!v12 || fchmodx_np(*((_DWORD *)a1 + 6), v9) < 0)
          {
            *(void *)&v179.f_buint64_t size = 0LL;
            if ((a1[24] & 2) != 0 && fchmod(*((_DWORD *)a1 + 6), v10) == -1)
            {
              int v103 = *__error();
              v104 = "(null string)";
              v105 = (const char *)a1[1];
              if (!v105) {
                v105 = "(null string)";
              }
              if (*a1) {
                v104 = (const char *)*a1;
              }
              syslog(4, "could not change mode of destination file %s to match source file %s: %m", v105, v104);
              *__error() = v103;
            }

            fchown(*((_DWORD *)a1 + 6), *((_DWORD *)a1 + 12), *((_DWORD *)a1 + 13));
            if (!filesec_get_property(v9, FILESEC_ACL, &v179))
            {
              if (MEMORY[0x186DF5DC0](*((unsigned int *)a1 + 6), *(void *)&v179.f_bsize) == -1)
              {
                int v106 = *__error();
                v107 = "(null string)";
                v108 = (const char *)a1[1];
                if (!v108) {
                  v108 = "(null string)";
                }
                if (*a1) {
                  v107 = (const char *)*a1;
                }
                syslog(4, "could not apply acl to destination file %s from source file %s: %m", v108, v107);
                *__error() = v106;
              }

              acl_free(*(void **)&v179.f_bsize);
            }
          }

          break;
        case 2:
          fchmod(*((_DWORD *)a1 + 6), v10);
          break;
        case 1:
          filesec_set_property(v9, FILESEC_OWNER, 0LL);
          filesec_set_property(v9, FILESEC_GROUP, 0LL);
          filesec_set_property(v9, FILESEC_MODE, 0LL);
          goto LABEL_256;
      }

      filesec_free(v9);
      goto LABEL_275;
    }
  }

  if (!v54)
  {
LABEL_137:
    if (v53) {
      free(v53);
    }
    goto LABEL_358;
  }

  v56 = &v53[v54 - 1];
  if (*v56) {
    char *v56 = 0;
  }
  v57 = malloc(0x1000uLL);
  if (!v57)
  {
    v24 = v53;
LABEL_143:
    free(v24);
LABEL_144:
    uint64_t v5 = 0xFFFFFFFFLL;
    goto LABEL_359;
  }

  v58 = v57;
  if (v53 > v56)
  {
    uint64_t v5 = 0LL;
    goto LABEL_355;
  }

  uint64_t v60 = 0LL;
  uint64_t size = 4096LL;
  v61 = v53;
  uint64_t v166 = (uint64_t)&v53[v5 - 1];
  while (1)
  {
    v62 = (void *)a1[31];
    if (v62)
    {
      free(v62);
      a1[31] = 0LL;
    }

    size_t v63 = v56 - v61;
    if (!strncmp(v61, "figgledidiggledy", v56 - v61)) {
      goto LABEL_219;
    }
    xattr_operation_intent_t v64 = *((_DWORD *)a1 + 70);
    if (v64)
    {
    }

    a1[31] = strdup(v61);
    v65 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    if (v65)
    {
      int v66 = v65(5LL, 1LL, a1, *a1, a1[1], a1[27]);
      if (v66 == 1) {
        goto LABEL_219;
      }
      if (v66 == 2) {
        goto LABEL_352;
      }
    }

    if (!strncmp(v61, "com.apple.ResourceFork", v56 - v61))
    {
      if ((*((_BYTE *)a1 + 197) & 4) != 0)
      {
        uint64_t v60 = copyfile_data(a1, 1);
        if (!(_DWORD)v60) {
          goto LABEL_217;
        }
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          int v80 = *__error();
          int v81 = *((_DWORD *)a1 + 68);
          v82 = __error();
          syslog( 7,  "%s:%d:%s() Resource fork copy (fd) failed (%d - state %d - errno %d)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  3686,  "copyfile_xattr",  v60,  v81,  *v82);
          *__error() = v80;
        }

        int v83 = *((_DWORD *)a1 + 68);
        uint64_t v5 = v60;
        goto LABEL_216;
      }

      ssize_t v74 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", 0LL, 0LL, 0, v48);
      if (v74 < 0)
      {
        uint64_t v60 = 0LL;
        uint64_t v5 = 45LL;
LABEL_213:
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          int v168 = *__error();
          uint64_t v91 = v60;
          int v92 = *((_DWORD *)a1 + 68);
          v93 = __error();
          int v165 = v92;
          uint64_t v60 = v91;
          syslog( 7,  "%s:%d:%s() Resource fork copy (fsetxattr) failed (%d - state %d - errno %d)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  3704,  "copyfile_xattr",  v5,  v165,  *v93);
          *__error() = v168;
        }

        int v83 = *((_DWORD *)a1 + 68);
LABEL_216:
        if (v83 == 89) {
          goto LABEL_354;
        }
        goto LABEL_217;
      }

      size_t v75 = size;
      if (size < 0x100000 && v74 > size)
      {
        if (v74 >= 0x100000) {
          size_t v76 = 0x100000LL;
        }
        else {
          size_t v76 = v74;
        }
        size_t v77 = v76;
        v58 = reallocf(v58, v76);
        if (!v58)
        {
          int v90 = *__error();
          syslog(4, "realloc for resource fork failed: %m");
          uint64_t size = 0LL;
          *__error() = v90;
          goto LABEL_212;
        }

        size_t v75 = v77;
      }

      uint64_t size = v75;
      ssize_t v78 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", v58, v75, 0, v48);
      if (v78 < 1)
      {
        u_int32_t v79 = 0;
LABEL_204:
        if (v78 < 0)
        {
          int v89 = *__error();
          syslog(4, "resource fork getxattr failed: %m");
          *__error() = v89;
          if (v79) {
            goto LABEL_212;
          }
        }
      }

      else
      {
        u_int32_t v79 = 0;
        while ((fsetxattr(*((_DWORD *)a1 + 6), "com.apple.ResourceFork", v58, v78, v79, v48) & 0x80000000) == 0)
        {
          v79 += v78;
          ssize_t v78 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", v58, size, v79, v48);
          if (v78 < 1) {
            goto LABEL_204;
          }
        }

        int v87 = *__error();
        syslog(4, "writing to resource fork got error: %m");
        *__error() = v87;
        v88 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
        if (!v88) {
          goto LABEL_212;
        }
        if (v88(5LL, 3LL, a1, *a1, a1[1], a1[27]) == 2)
        {
          *((_DWORD *)a1 + 68) = 89;
LABEL_212:
          uint64_t v60 = 0xFFFFFFFFLL;
          uint64_t v5 = 0xFFFFFFFFLL;
          goto LABEL_213;
        }
      }

      uint64_t v60 = 0LL;
      goto LABEL_217;
    }

    uint64_t v167 = v60;
    ssize_t v67 = fgetxattr(*((_DWORD *)a1 + 4), v61, 0LL, 0LL, 0, v48);
    if ((v67 & 0x8000000000000000LL) == 0) {
      break;
    }
    v71 = v58;
LABEL_220:
    v61 += strlen(v61) + 1;
    v58 = v71;
    uint64_t v5 = v60;
    if (v61 > v56) {
      goto LABEL_354;
    }
  }

  ssize_t v68 = v67;
  int v69 = -3;
  while (1)
  {
    if (v68 <= size)
    {
      v71 = v58;
      ssize_t v68 = size;
    }

    else
    {
      if ((unint64_t)v68 >= 0x2000001)
      {
        int v70 = *__error();
        syslog( 4,  "xattr named %s has size (%zu), which exceeds the threshold (%d); trying to allocate: %m",
          v61,
          v68,
          0x2000000);
        *__error() = v70;
      }

      v71 = realloc(v58, v68);
      if (!v71)
      {
        free(v58);
        uint64_t size = 0LL;
        v56 = (char *)v166;
        goto LABEL_197;
      }
    }

    uint64_t size = v68;
    ssize_t v72 = fgetxattr(*((_DWORD *)a1 + 4), v61, v71, v68, 0, v48);
    if ((v72 & 0x8000000000000000LL) == 0) {
      break;
    }
    if (*__error() == 34 && v69 != 0)
    {
      ssize_t v68 = fgetxattr(*((_DWORD *)a1 + 4), v61, 0LL, 0LL, 0, v48);
      ++v69;
      v58 = v71;
      if ((v68 & 0x8000000000000000LL) == 0) {
        continue;
      }
    }

    goto LABEL_169;
  }

  size_t v84 = v72;
  uint64_t v60 = v167;
  if (!strncmp(v61, "com.apple.decmpfs", v63))
  {
    v56 = (char *)v166;
    if (v84 < 0x10 || *v71 != 1668116582) {
      goto LABEL_220;
    }
    int v86 = v71[1];
    if ((v86 - 7) >= 8 && (v86 - 3) >= 2)
    {
      if (v86 == 5)
      {
        if (*((_DWORD *)a1 + 69) >= 3u)
        {
          int v96 = *__error();
          syslog(7, "%s:%d:%s() compression_type <5> on attribute com.apple.decmpfs for src file %s is not copied.\n");
          goto LABEL_228;
        }
      }

      else
      {
        int v96 = *__error();
        syslog(4, "Invalid compression_type <%d> on attribute %s for src file %s: %m");
LABEL_228:
        *__error() = v96;
      }

LABEL_169:
      v56 = (char *)v166;
      uint64_t v60 = v167;
      goto LABEL_220;
    }

    if (!__dst) {
      *((_DWORD *)a1 + 49) |= 4u;
    }
  }

  v56 = (char *)v166;
  if (fsetxattr(*((_DWORD *)a1 + 6), v61, v71, v84, 0, v48) < 0)
  {
    if (*__error() == 1 && !strcmp(v61, "com.apple.root.installed")) {
      goto LABEL_220;
    }
    v85 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    if (!v85)
    {
      int v95 = *__error();
      syslog(4, "could not set attributes %s on destination file descriptor: %m", v61);
      *__error() = v95;
LABEL_197:
      uint64_t v60 = 0xFFFFFFFFLL;
      goto LABEL_220;
    }

    if (v85(5LL, 3LL, a1, *a1, a1[1], a1[27]) == 2)
    {
      uint64_t v60 = 0xFFFFFFFFLL;
      goto LABEL_353;
    }
  }

  v58 = v71;
LABEL_217:
  v94 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (!v94 || v94(5LL, 2LL, a1, *a1, a1[1], a1[27]) != 2)
  {
LABEL_219:
    v71 = v58;
    goto LABEL_220;
  }

  uint64_t v60 = 0xFFFFFFFFLL;
LABEL_352:
  v71 = v58;
LABEL_353:
  *((_DWORD *)a1 + 68) = 89;
  v58 = v71;
  uint64_t v5 = v60;
LABEL_354:
  if (v53) {
LABEL_355:
  }
    free(v53);
  free(v58);
  v139 = (void *)a1[31];
  if (v139)
  {
    free(v139);
    a1[31] = 0LL;
  }

LABEL_358:
  if ((v5 & 0x80000000) == 0) {
    goto LABEL_7;
  }
LABEL_359:
  if (*__error() != 45 && *__error() != 1)
  {
    int v109 = *__error();
    syslog(4, "error processing extended attributes: %m");
LABEL_285:
    *__error() = v109;
  }

  return v5;
}

int copyfile_state_free(copyfile_state_t a1)
{
  if (!a1) {
    return 0;
  }
  v2 = (_filesec *)*((void *)a1 + 23);
  if (v2) {
    filesec_free(v2);
  }
  int v3 = (_filesec *)*((void *)a1 + 29);
  if (v3) {
    filesec_free(v3);
  }
  v4 = (_filesec *)*((void *)a1 + 30);
  if (v4) {
    filesec_free(v4);
  }
  if (*(void *)a1)
  {
    int v5 = *((_DWORD *)a1 + 4);
    if (v5 < 0 || (close(v5), *(void *)a1))
    {
      int v6 = *((_DWORD *)a1 + 5);
      if ((v6 & 0x80000000) == 0) {
        close(v6);
      }
    }
  }

  if (!*((void *)a1 + 1)) {
    goto LABEL_25;
  }
  int v7 = *((_DWORD *)a1 + 6);
  if (v7 < 0)
  {
    int v8 = 0;
  }

  else
  {
    if (close(v7)) {
      int v8 = -1;
    }
    else {
      int v8 = 0;
    }
    if (!*((void *)a1 + 1)) {
      goto LABEL_24;
    }
  }

  int v10 = *((_DWORD *)a1 + 7);
  if ((v10 & 0x80000000) == 0 && close(v10)) {
    goto LABEL_26;
  }
LABEL_24:
  if (v8 < 0)
  {
LABEL_26:
    int v11 = *__error();
    syslog(4, "error closing files: %m");
    *__error() = v11;
    int v9 = -1;
    goto LABEL_27;
  }

LABEL_25:
  int v9 = 0;
LABEL_27:
  BOOL v12 = (void *)*((void *)a1 + 31);
  if (v12) {
    free(v12);
  }
  int v13 = (void *)*((void *)a1 + 22);
  if (v13) {
    free(v13);
  }
  v14 = (void *)*((void *)a1 + 1);
  if (v14) {
    free(v14);
  }
  if (*(void *)a1) {
    free(*(void **)a1);
  }
  free(a1);
  return v9;
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  uint64_t v114 = *MEMORY[0x1895FEE08];
  v107 = (const char **)state;
  if (!((unint64_t)from | (unint64_t)to))
  {
    *__error() = 22;
    return -1;
  }

  copyfile_flags_t v4 = flags;
  if ((copyfile_preamble((copyfile_state_t *)&v107, flags) & 0x80000000) != 0) {
    return -1;
  }
  int v8 = v107;
  if (from)
  {
    int v9 = (char *)*v107;
    if (*v107)
    {
      if (!strncmp(from, *v107, 0x400uLL)) {
        goto LABEL_14;
      }
      if (*((_DWORD *)v8 + 69) >= 2u)
      {
        int v10 = *__error();
        syslog( 7,  "%s:%d:%s() replacing string %s (%s) -> (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1300,  "copyfile",  "src",  from,  *v8);
        *__error() = v10;
      }

      int v11 = *((_DWORD *)v8 + 4);
      if ((v11 & 0x80000000) == 0)
      {
        if (*((_DWORD *)v8 + 69) >= 4u)
        {
          int v12 = *__error();
          syslog( 7,  "%s:%d:%s() closing %s fd: %d\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1300,  "copyfile",  "src",  *((_DWORD *)v8 + 4));
          *__error() = v12;
          int v11 = *((_DWORD *)v8 + 4);
        }

        close(v11);
        *((_DWORD *)v8 + 4) = -2;
      }

      int v9 = (char *)*v8;
      if (*v8)
      {
LABEL_14:
        free(v9);
        *int v8 = 0LL;
      }
    }

    int v13 = strdup(from);
    *int v8 = v13;
    if (!v13) {
      return -1;
    }
  }

  if (to)
  {
    v14 = (char *)v8[1];
    if (v14)
    {
      if (!strncmp(to, v8[1], 0x400uLL)) {
        goto LABEL_26;
      }
      if (*((_DWORD *)v8 + 69) >= 2u)
      {
        int v15 = *__error();
        syslog( 7,  "%s:%d:%s() replacing string %s (%s) -> (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1301,  "copyfile",  "dst",  to,  v8[1]);
        *__error() = v15;
      }

      int v16 = *((_DWORD *)v8 + 6);
      if ((v16 & 0x80000000) == 0)
      {
        if (*((_DWORD *)v8 + 69) >= 4u)
        {
          int v17 = *__error();
          syslog( 7,  "%s:%d:%s() closing %s fd: %d\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1301,  "copyfile",  "dst",  *((_DWORD *)v8 + 6));
          *__error() = v17;
          int v16 = *((_DWORD *)v8 + 6);
        }

        close(v16);
        *((_DWORD *)v8 + 6) = -2;
      }

      v14 = (char *)v8[1];
      if (v14)
      {
LABEL_26:
        free(v14);
        v8[1] = 0LL;
      }
    }

    unint64_t v18 = strdup(to);
    v8[1] = v18;
    if (!v18) {
      return -1;
    }
  }

  if ((*((_BYTE *)v8 + 194) & 1) == 0 && stat(to, &v109) != -1 && stat(from, &v112) != -1 && statfs(from, &v113) != -1)
  {
    __strlcpy_chk();
    v110[2] = 0LL;
    v110[0] = 5LL;
    v110[1] = 0x20000LL;
    if (getattrlist((const char *)&v111, v110, v108, 0x24uLL, 0) != -1 && v112.st_dev == v109.st_dev)
    {
      if ((v108[4] & 1) == 0 || (v108[20] & 1) == 0)
      {
        ssize_t v19 = realpath_DARWIN_EXTSN(from, 0LL);
        if (!v19) {
          goto LABEL_46;
        }
        int v20 = v19;
        int v21 = realpath_DARWIN_EXTSN(to, 0LL);
        if (!v21) {
          goto LABEL_40;
        }
        ssize_t v22 = v21;
        if (strncasecmp(from, to, 0x400uLL))
        {
          free(v20);
          int v20 = v22;
LABEL_40:
          free(v20);
          goto LABEL_46;
        }

LABEL_44:
        if ((*((_BYTE *)v8 + 194) & 2) == 0)
        {
LABEL_123:
          int v23 = 0;
          goto LABEL_74;
        }

        BOOL v25 = 0;
        int v26 = 17;
        goto LABEL_101;
      }

      if (v112.st_ino == v109.st_ino) {
        goto LABEL_44;
      }
    }
  }

LABEL_46:
  unsigned int v27 = *((_DWORD *)v8 + 48);
  if ((v27 & 0x8000) == 0)
  {
    if ((v27 & 0x3000000) == 0) {
      goto LABEL_59;
    }
    if (!*((_DWORD *)v8 + 70))
    {
      if ((v27 & 1) != 0) {
        uint32_t v28 = 5;
      }
      else {
        uint32_t v28 = 1;
      }
      if (lstat(*v8, (stat *)&v113) || (v113.f_iosize & 0xD000 | 0x2000) != 0xA000)
      {
        *__error() = 22;
      }

      else if (((*((_BYTE *)v8 + 194) & 0x20) == 0 || (remove(v8[1]) & 0x80000000) == 0 || *__error() == 2) {
             && !clonefileat(-2, *v8, -2, v8[1], v28))
      }
      {
        *((_DWORD *)v8 + 49) |= 0x800u;
        if ((*((_BYTE *)v8 + 194) & 0x10) != 0) {
          remove(*v8);
        }
        goto LABEL_123;
      }

      unsigned int v27 = *((_DWORD *)v8 + 48);
    }

    if ((v27 & 0x2000000) == 0)
    {
      unsigned int v27 = v27 & 0xFEF9FFF1 | 0x6000E;
      *((_DWORD *)v8 + 48) = v27;
      int v29 = *((_DWORD *)v8 + 49);
      if ((v29 & 0x4000) == 0) {
        *((_DWORD *)v8 + 49) = v29 | 0x8000;
      }
      copyfile_flags_t v4 = v27;
LABEL_59:
      if ((v4 & 0x10000) != 0)
      {
        *(void *)&v113.f_buint64_t size = 0LL;
        if (*v8)
        {
          if ((v27 & 4) != 0)
          {
            int v23 = 4 * (listxattr(*v8, 0LL, 0LL, (v27 >> 18) & 1) > 0);
            unsigned int v27 = *((_DWORD *)v8 + 48);
          }

          else
          {
            int v23 = 0;
          }

          if ((v27 & 1) != 0)
          {
            BOOL v47 = (void (*)(const char *, const char **, const char *))MEMORY[0x1895FF158];
            if ((v27 & 0x40000) == 0) {
              BOOL v47 = (void (*)(const char *, const char **, const char *))MEMORY[0x1895FF2C0];
            }
            v47(*v8, v8 + 4, v8[23]);
            v23 |= filesec_get_property((filesec_t)v8[23], FILESEC_ACL, &v113) == 0;
          }

          if (*((_DWORD *)v8 + 69) >= 2u)
          {
            int v48 = *__error();
            syslog( 7,  "%s:%d:%s() check result: %d (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2399,  "copyfile_check",  v23,  *v8);
            *__error() = v48;
          }

          if (*(void *)&v113.f_bsize) {
            acl_free(*(void **)&v113.f_bsize);
          }
          if (v8[28])
          {
            if (((_BYTE)v8[24] & 4) != 0) {
              int v49 = 4;
            }
            else {
              int v49 = 1;
            }
            v23 |= v49;
          }
        }

        else
        {
          *((_DWORD *)v8 + 68) = 22;
          int v23 = -1;
        }

        goto LABEL_73;
      }

      ssize_t v31 = (filesec_t *)(v8 + 29);
      v30 = (_filesec *)v8[29];
      if (v30)
      {
        filesec_free(v30);
        *ssize_t v31 = 0LL;
      }

      filesec_t v32 = filesec_init();
      *ssize_t v31 = v32;
      if (v32)
      {
        if ((*((_BYTE *)v8 + 194) & 8) != 0 && !lstat(v8[1], (stat *)&v113) && (v113.f_iosize & 0xF000) == 0xA000)
        {
          int v33 = (char *)v8[30];
          if (v33) {
            free(v33);
          }
          goto LABEL_133;
        }

        if (statx_np(v8[1], (stat *)&v113, (filesec_t)v8[29]))
        {
          BOOL v25 = *__error() == 2;
LABEL_134:
          if ((copyfile_open(v8) & 0x80000000) == 0)
          {
            fcntl(*((_DWORD *)v8 + 4), 48, 1LL);
            fcntl(*((_DWORD *)v8 + 6), 48, 1LL);
            fcntl(*((_DWORD *)v8 + 6), 76, 1LL);
            int v53 = copyfile_internal(v8, v4);
            if (v53 != -1)
            {
              int v23 = v53;
              if (((v25 | ((v4 & 2) >> 1)) & 1) == 0)
              {
                fchown(*((_DWORD *)v8 + 6), v113.f_bfree, HIDWORD(v113.f_bfree));
                fchmod(*((_DWORD *)v8 + 6), v113.f_iosize);
              }

              reset_security((uint64_t)v8);
              if ((v4 & 0x100000) != 0 && *v8) {
                remove(*v8);
              }
              goto LABEL_73;
            }
          }

          goto LABEL_141;
        }

        fixed = copyfile_fix_perms((filesec_t *)v8 + 29);
        v8[30] = (const char *)fixed;
        if (fixed)
        {
          if ((chmodx_np(v8[1], fixed) & 0x80000000) == 0)
          {
            BOOL v25 = 0;
            *((_DWORD *)v8 + 49) |= 0x1000u;
            goto LABEL_134;
          }

          if (*__error() != 45)
          {
            int v52 = *__error();
            syslog(4, "setting security information: %m");
            *__error() = v52;
            filesec_free((filesec_t)v8[30]);
LABEL_133:
            BOOL v25 = 0;
            v8[30] = 0LL;
            goto LABEL_134;
          }
        }

        BOOL v25 = 0;
        goto LABEL_134;
      }

      goto LABEL_96;
    }

    if (*((_DWORD *)v8 + 68))
    {
LABEL_96:
      BOOL v25 = 0;
      goto LABEL_141;
    }

    BOOL v25 = 0;
    int v26 = 45;
LABEL_101:
    *((_DWORD *)v8 + 68) = v26;
LABEL_141:
    if (!v25 && (*((_DWORD *)v8 + 49) & 0x1000) != 0)
    {
      int v54 = *__error();
      chown(v8[1], v113.f_bfree, HIDWORD(v113.f_bfree));
      chmod(v8[1], v113.f_iosize);
      *__error() = v54;
    }

    int v55 = *((_DWORD *)v8 + 68);
    if (v55)
    {
      *__error() = v55;
      *((_DWORD *)v8 + 68) = 0;
    }

    int v23 = -1;
    goto LABEL_147;
  }

  v112.st_ino = 0LL;
  *(void *)&v112.st_dev = 0LL;
  if ((v27 & 0x2F10000) != 0
    || (dev_t v36 = *((_DWORD *)v8 + 8), v37 = (char *)*v8, (*(void *)&v112.st_dev = v37) == 0LL)
    || (v38 = v8[1]) == 0LL)
  {
    *__error() = 22;
    goto LABEL_70;
  }

  int v39 = (uint64_t (*)(const char *, statfs *))MEMORY[0x189600040];
  v40 = (uint64_t (*)(const char *, statfs *))MEMORY[0x1895FFBF8];
  if ((v27 & 0x40000) != 0) {
    int v41 = MEMORY[0x1895FFBF8](v37, &v113);
  }
  else {
    int v41 = MEMORY[0x189600040](v37, &v113);
  }
  if (v41 == -1) {
    goto LABEL_70;
  }
  BOOL v42 = 0;
  if ((v27 & 0x40000) == 0 && (v113.f_iosize & 0xF000) == 0x4000)
  {
    int v43 = lstat(v37, &v111);
    BOOL v42 = (v111.st_mode & 0xF000) == 40960;
    if (v43 == -1) {
      goto LABEL_70;
    }
  }

  BOOL v98 = v42;
  if ((v27 & 0x80000) != 0) {
    int v44 = v40(v38, &v113);
  }
  else {
    int v44 = v39(v38, &v113);
  }
  if (v44 == -1)
  {
    if (*__error() == 2 && basename(v37)) {
      goto LABEL_129;
    }
LABEL_70:
    int v23 = -1;
    goto LABEL_71;
  }

  f_iouint64_t size = v113.f_iosize;
  if (!basename(v37)) {
    goto LABEL_70;
  }
  if ((f_iosize & 0xF000) != 0x4000)
  {
LABEL_129:
    __s1 = v37;
    size_t v102 = strlen(v37);
    int v51 = (const char *)&unk_1801476B9;
    goto LABEL_154;
  }

  BOOL v46 = strrchr(v37, 47);
  __s1 = v37;
  if (v46) {
    size_t v102 = v46 - v37 + 1;
  }
  else {
    size_t v102 = 0LL;
  }
  int v51 = "/";
LABEL_154:
  v100 = v38;
  int v101 = v51;
  uint64_t v60 = 0LL;
  v61 = 0LL;
  if ((*((_WORD *)v8 + 97) & 0x104) != 0) {
    int v62 = 20;
  }
  else {
    int v62 = 21;
  }
  int v103 = (*((_DWORD *)v8 + 49) >> 7) & 0x40 | v62;
  v104 = (uint64_t (*)(void))v8[26];
  int flagsa = v27 & 0xC0000 | 2;
  char v63 = 1;
LABEL_158:
  char v64 = v63;
  if ((v63 & 1) == 0 && (v60 & 1) == 0)
  {
LABEL_219:
    int v23 = 0;
    goto LABEL_225;
  }

  if (v61) {
    fts_close(v61);
  }
  v61 = fts_open((char *const *)&v112, v103, 0LL);
  while (2)
  {
    uint64_t v65 = v60;
    do
    {
      while (1)
      {
        int v66 = fts_read(v61);
        if (!v66)
        {
          char v63 = 0;
          uint64_t v60 = v65;
          if ((v64 & 1) == 0) {
            goto LABEL_219;
          }
          goto LABEL_158;
        }

        ssize_t v67 = v66;
        if ((v66->fts_info & 0xFFFE) == 0xC) {
          break;
        }
        if ((v64 & 1) != 0)
        {
          unsigned int v106 = v65;
          goto LABEL_170;
        }
      }

      uint64_t v65 = 1LL;
    }

    while ((v64 & 1) != 0);
    unsigned int v106 = v60;
LABEL_170:
    *(void *)&v111.st_dev = 0LL;
    copyfile_state_t v68 = copyfile_state_alloc();
    if (!v68) {
      goto LABEL_221;
    }
    copyfile_state_t v69 = v68;
    *((_OWORD *)v68 + 13) = *((_OWORD *)v8 + 13);
    if ((*((_BYTE *)v8 + 198) & 1) != 0) {
      *((_DWORD *)v68 + 49) |= 0x10000u;
    }
    dev_t fts_dev = v67->fts_dev;
    if (v36 == fts_dev)
    {
      *((_DWORD *)v68 + 49) |= *((_DWORD *)v8 + 49) & 0x78;
      dev_t fts_dev = v36;
    }

    asprintf((char **)&v111, "%s%s%s", v38, v101, &v67->fts_path[v102]);
    v71 = *(const char **)&v111.st_dev;
    if (*(void *)&v111.st_dev)
    {
      dev_t v105 = fts_dev;
      *((void *)v69 + 32) = v67;
      int v72 = *((_DWORD *)v69 + 49);
      *((_DWORD *)v69 + 49) = v72 | 0x20000;
      int v73 = 0;
      int v74 = 1;
      switch(v67->fts_info)
      {
        case 1u:
          *((_DWORD *)v69 + 49) = v72 | 0x20001;
          if (v98 && !strcmp(__s1, v67->fts_path)) {
            *((_DWORD *)v69 + 49) = v72 | 0x60001;
          }
          int v73 = 1;
          int v74 = 2;
          goto LABEL_177;
        case 3u:
        case 8u:
        case 0xCu:
        case 0xDu:
LABEL_177:
          fts_path = v67->fts_path;
          size_t v76 = v104;
          unsigned int v99 = v74;
          if (!v104) {
            goto LABEL_181;
          }
          int v77 = v104();
          if (v77 == 1)
          {
            if (!v73 || fts_set(v61, v67, 4) != -1) {
              goto LABEL_213;
            }
            int v83 = v67->fts_path;
            uint64_t v84 = *(void *)&v111.st_dev;
            v85 = v8[27];
            uint64_t v86 = 0LL;
          }

          else
          {
            if (v77 == 2) {
              goto LABEL_222;
            }
            fts_path = v67->fts_path;
            v71 = *(const char **)&v111.st_dev;
            size_t v76 = v104;
LABEL_181:
            if (v73) {
              int v78 = 1225654285;
            }
            else {
              int v78 = 1225654287;
            }
            if ((copyfile(fts_path, v71, v69, v78 & v27) & 0x80000000) == 0)
            {
              uint64_t v79 = v99;
              if (!v76) {
                goto LABEL_213;
              }
              int v80 = v67->fts_path;
              uint64_t v81 = *(void *)&v111.st_dev;
              v82 = v8[27];
LABEL_187:
              if (((unsigned int (*)(uint64_t, uint64_t, copyfile_state_t, char *, uint64_t, const char *))v104)( v79,  2LL,  v69,  v80,  v81,  v82) == 2) {
                goto LABEL_222;
              }
LABEL_213:
              unsigned int v93 = *((_DWORD *)v8 + 49) & 0xFFFFFF87;
              *((_DWORD *)v8 + 49) = v93;
              *((_DWORD *)v8 + 49) = *((_DWORD *)v69 + 49) & 0x78 | v93;
              copyfile_state_free(v69);
              free(*(void **)&v111.st_dev);
LABEL_214:
              dev_t v36 = v105;
              uint64_t v60 = v106;
              v38 = v100;
              continue;
            }

            uint64_t v86 = v99;
            if (!v76) {
              goto LABEL_223;
            }
            int v83 = v67->fts_path;
            uint64_t v84 = *(void *)&v111.st_dev;
            v85 = v8[27];
          }

          unsigned int v87 = ((uint64_t (*)(uint64_t, uint64_t, copyfile_state_t, char *, uint64_t, const char *))v104)( v86,  3LL,  v69,  v83,  v84,  v85);
LABEL_202:
          unsigned int v89 = *((_DWORD *)v8 + 49) & 0xFFFFFF87;
          *((_DWORD *)v8 + 49) = v89;
          *((_DWORD *)v8 + 49) = *((_DWORD *)v69 + 49) & 0x78 | v89;
          copyfile_state_free(v69);
          free(*(void **)&v111.st_dev);
          if (v87 == 2) {
            goto LABEL_224;
          }
          goto LABEL_214;
        case 5u:
          goto LABEL_213;
        case 6u:
          int v90 = v67->fts_path;
          if (v98 && !strcmp(__s1, v67->fts_path)) {
            *((_DWORD *)v69 + 49) = v72 | 0x60000;
          }
          if (v104)
          {
            int v91 = ((uint64_t (*)(uint64_t, uint64_t, copyfile_state_t, const char *, const char *, const char *))v104)( 3LL,  1LL,  v69,  v90,  v71,  v8[27]);
            if (v91 == 1) {
              goto LABEL_213;
            }
            if (v91 == 2)
            {
LABEL_222:
              *__error() = 0;
LABEL_223:
              unsigned int v95 = *((_DWORD *)v8 + 49) & 0xFFFFFF87;
              *((_DWORD *)v8 + 49) = v95;
              *((_DWORD *)v8 + 49) = *((_DWORD *)v69 + 49) & 0x78 | v95;
              copyfile_state_free(v69);
              free(*(void **)&v111.st_dev);
              goto LABEL_224;
            }

            int v92 = copyfile(v67->fts_path, *(const char **)&v111.st_dev, v69, flagsa);
            int v80 = v67->fts_path;
            uint64_t v81 = *(void *)&v111.st_dev;
            v82 = v8[27];
            if ((v92 & 0x80000000) == 0)
            {
              uint64_t v79 = 3LL;
              goto LABEL_187;
            }

            int v94 = ((uint64_t (*)(uint64_t, uint64_t, copyfile_state_t, char *, void, const char *))v104)( 3LL,  3LL,  v69,  v80,  *(void *)&v111.st_dev,  v82);
            if (v94)
            {
              if (v94 == 2) {
                goto LABEL_223;
              }
            }

            else
            {
LABEL_201:
              *__error() = 0;
            }
          }

          else if (copyfile(v90, v71, v69, flagsa) < 0)
          {
            goto LABEL_223;
          }

          goto LABEL_213;
        default:
          int fts_errno = v67->fts_errno;
          *__error() = fts_errno;
          if (!v104) {
            goto LABEL_223;
          }
          unsigned int v87 = ((uint64_t (*)(void, uint64_t, copyfile_state_t, char *, void, const char *))v104)( 0LL,  3LL,  v69,  v67->fts_path,  *(void *)&v111.st_dev,  v8[27]);
          if (v87 < 2) {
            goto LABEL_201;
          }
          goto LABEL_202;
      }
    }

    break;
  }

  copyfile_state_free(v69);
LABEL_221:
  *__error() = 12;
LABEL_224:
  int v23 = -1;
LABEL_225:
  if (v61) {
    fts_close(v61);
  }
LABEL_71:
  if (*((_DWORD *)v8 + 69))
  {
    int v34 = *__error();
    size_t v35 = __error();
    syslog( 7,  "%s:%d:%s() returning: %d errno %d\n\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1003,  "copytree",  v23,  *v35);
    *__error() = v34;
  }

LABEL_73:
  if ((v23 & 0x80000000) == 0) {
LABEL_74:
  }
    *__error() = 0;
LABEL_147:
  v56 = (_copyfile_state *)v107;
  if (v107 && *((_DWORD *)v107 + 69) >= 5u)
  {
    int v57 = *__error();
    v58 = __error();
    syslog( 7,  "%s:%d:%s() returning %d errno %d\n\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1446,  "copyfile",  v23,  *v58);
    *__error() = v57;
  }

  if (!state)
  {
    int v59 = *__error();
    copyfile_state_free(v56);
    *__error() = v59;
  }

  return v23;
}

  v38 = *v5;
  int v39 = *v6;
  v40 = (char *)malloc(v29);
  if (!v40) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v37 = v40;
  if (a2) {
    int v41 = (uint64_t *)(a1[22] + 96LL);
  }
  else {
    int v41 = a1 + 16;
  }
  BOOL v42 = *v41;
  int v43 = fstat(v39, (stat *)&v111);
  int v44 = *(void *)&v111.f_mntonname[16] << 9;
  if (v43) {
    int v44 = 0LL;
  }
  v45 = __OFSUB__(v42, v44);
  BOOL v46 = v42 - v44;
  if (!((v46 < 0) ^ v45 | (v46 == 0)))
  {
    v109[0] = 0x300000000LL;
    v109[1] = 0LL;
    uint64_t v110 = v46;
    if (*((_DWORD *)a1 + 69) >= 3u)
    {
      BOOL v47 = *__error();
      syslog( 7,  "%s:%d:%s() preallocating %lld bytes on destination\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2993,  "copyfile_data",  v110);
      *__error() = v47;
    }

    fcntl(v39, 42, v109);
  }

  int v48 = read(v38, v37, v29);
  if (v48 < 1)
  {
    int v49 = 0LL;
LABEL_109:
    if (v48 < 0)
    {
      char v64 = *__error();
      uint64_t v65 = (const char *)*a1;
      if (!*a1) {
        uint64_t v65 = "(null src)";
      }
      int v66 = "(rsrc)";
      if (a2) {
        int v66 = (const char *)&unk_1801476B9;
      }
      syslog(4, "reading from %s %s: %m", v65, v66);
      *__error() = v64;
      goto LABEL_171;
    }

    int v62 = ftruncate(v39, v49) >> 31;
    goto LABEL_111;
  }

  size_t v102 = v29;
  int v49 = 0LL;
  __fda = 0;
  if (a2) {
    ssize_t v50 = 5LL;
  }
  else {
    ssize_t v50 = 4LL;
  }
  int v51 = v37;
  uint64_t v97 = v28;
  v108 = v37;
LABEL_89:
  *(void *)unsigned int v106 = v49;
  if (v48 >= v28) {
    int v52 = v28;
  }
  else {
    int v52 = v48;
  }
  while (1)
  {
    int v53 = write(v39, v51, v52);
    if (v53 != -1)
    {
      v56 = v53;
      if (v53)
      {
        int v57 = 0;
        v48 -= v53;
        v51 += v53;
        v58 = *(void *)v106;
      }

      else
      {
        int v57 = __fda + 1;
        v58 = *(void *)v106;
        if (__fda >= 5)
        {
          int v80 = *__error();
          syslog(4, "writing to output %d times resulted in 0 bytes written: %m", __fda + 1);
          *__error() = v80;
          uint64_t v81 = 35;
LABEL_169:
          *((_DWORD *)a1 + 68) = v81;
LABEL_170:
          unint64_t v37 = v108;
          goto LABEL_171;
        }
      }

      __fda = v57;
      if ((a2 & 1) == 0)
      {
        a1[33] += v53;
        if (v4)
        {
          int v59 = v4(4LL, 4LL, a1, *a1, a1[1], a1[27]);
          v58 = *(void *)v106;
          if (v59 == 2)
          {
            v82 = __error();
            uint64_t v81 = 89;
            const char *v82 = 89;
            goto LABEL_169;
          }
        }
      }

      int v49 = v56 + v58;
      uint32_t v28 = v97;
      unint64_t v37 = v108;
      if (!v48)
      {
        uint64_t v60 = v49;
        v61 = read(v38, v108, v102);
        int v49 = v60;
        int v48 = v61;
        __fda = 0;
        int v51 = v108;
        if (v61 < 1) {
          goto LABEL_109;
        }
      }

      goto LABEL_89;
    }

    int v54 = *__error();
    syslog(4, "writing to output file got error: %m");
    *__error() = v54;
    if (!v4) {
      goto LABEL_170;
    }
    int v55 = v4(v50, 3LL, a1, *a1, a1[1], a1[27]);
    if ((_DWORD)v55 == 1)
    {
      int v9 = 0LL;
      unint64_t v37 = v108;
      goto LABEL_173;
    }

    int v9 = v55;
    if (a2) {
      break;
    }
    if ((_DWORD)v55) {
      goto LABEL_170;
    }
    *__error() = 0;
  }

  unint64_t v37 = v108;
  if (!(_DWORD)v55) {
    goto LABEL_173;
  }
  if ((_DWORD)v55 == 2)
  {
    char v63 = 89;
    goto LABEL_172;
  }

_filesec *copyfile_fix_perms(filesec_t *a1)
{
  obj_p = 0LL;
  v1 = filesec_dup(*a1);
  v2 = v1;
  if (v1)
  {
    if (!filesec_get_property(v1, FILESEC_ACL, &obj_p)
      && (add_uberace((acl_t *)&obj_p) || filesec_set_property(v2, FILESEC_ACL, &obj_p))
      || !filesec_get_property(v2, FILESEC_MODE, &v5)
      && (~v5 & 0x180) != 0
      && (v5 |= 0x180u, filesec_set_property(v2, FILESEC_MODE, &v5)))
    {
      filesec_free(v2);
      v2 = 0LL;
    }

    if (obj_p) {
      acl_free(obj_p);
    }
  }

  return v2;
}

uint64_t copyfile_open(const char **a1)
{
  uint64_t v79 = *MEMORY[0x1895FEE08];
  if (!*a1 || *((_DWORD *)a1 + 4) != -2)
  {
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    goto LABEL_10;
  }

  if (((_DWORD)a1[24] & 0x40000) != 0) {
    v2 = (unsigned int (*)(void))MEMORY[0x1895FF158];
  }
  else {
    v2 = (unsigned int (*)(void))MEMORY[0x1895FF2C0];
  }
  if (!v2())
  {
    int v12 = *((_WORD *)a1 + 18) & 0xF000;
    switch(v12)
    {
      case 16384:
        int v4 = 0;
        char v13 = 1;
        int v14 = 1;
        break;
      case 40960:
        int v14 = 0;
        int v4 = 0;
        unsigned int v36 = *((_DWORD *)a1 + 48);
        int v35 = 0x200000;
        int v34 = 1;
        char v13 = 1;
        int v37 = 0x200000;
LABEL_65:
        if ((v36 & 0x400000) != 0) {
          int v38 = v37;
        }
        else {
          int v38 = v35;
        }
        if ((v36 & 0x400000) != 0) {
          int v5 = 0;
        }
        else {
          int v5 = v14;
        }
        if ((v36 & 0x400000) != 0) {
          int v6 = 0;
        }
        else {
          int v6 = v34;
        }
        int v39 = open(*a1, v38, 0LL);
        *((_DWORD *)a1 + 4) = v39;
        if (v39 < 0)
        {
          int v3 = *__error();
LABEL_149:
          syslog(4, "open on %s: %m");
          goto LABEL_8;
        }

        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          int v40 = *__error();
          syslog( 7,  "%s:%d:%s() open successful on source (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1946,  "copyfile_open",  *a1);
          *__error() = v40;
        }

        int v41 = *((_DWORD *)a1 + 49);
        *((_DWORD *)a1 + 49) = v41 | 0x80;
        if ((v41 & 0x20000) != 0)
        {
          if (!a1[32])
          {
            *__error() = 2;
            *((_DWORD *)a1 + 68) = 2;
            int v33 = *__error();
            syslog(4, "missing FTS entry during recursive copy\n: %m");
            goto LABEL_135;
          }

          if (!lstat(*a1, &v77))
          {
            __int16 v60 = 0;
            unsigned int v61 = *((unsigned __int16 *)a1[32] + 44);
            if (v61 > 0xB)
            {
              if (v61 - 12 <= 1) {
                __int16 v60 = -24576;
              }
            }

            else if (v61 == 1 || v61 == 6)
            {
              __int16 v60 = 0x4000;
            }

            else if (v61 == 8)
            {
              __int16 v60 = 0x8000;
            }

            if ((*((_BYTE *)a1 + 198) & 4) != 0) {
              unsigned __int16 v44 = -24576;
            }
            else {
              unsigned __int16 v44 = v60;
            }
LABEL_177:
            if ((v77.st_mode & 0xF000) != v44)
            {
              *__error() = 9;
              *((_DWORD *)a1 + 68) = 9;
              int v3 = *__error();
              syslog(4, "file type (%u) does not match expected %u on %s\n: %m");
              goto LABEL_8;
            }

            if (!a1[28]) {
              a1[28] = 0LL;
            }
            if ((v13 & 1) == 0)
            {
              unsigned int v66 = *((_DWORD *)a1 + 48);
              if ((v66 & 4) != 0)
              {
                if ((v66 & 8) != 0 && (*((_BYTE *)a1 + 148) & 0x20) != 0)
                {
                  int v67 = 32 * doesdecmpfs(*((_DWORD *)a1 + 4));
                  unsigned int v66 = *((_DWORD *)a1 + 48);
                }

                else
                {
                  int v67 = 0;
                }

                ssize_t v69 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", 0LL, 0LL, 0, (v66 >> 18) & 1 | v67);
                *__error() = 0;
                if (v69 > 0x100000)
                {
                  if (*((_DWORD *)a1 + 69) >= 2u)
                  {
                    int v70 = *__error();
                    syslog( 7,  "%s:%d:%s() %s has large resource fork, will use namedfork to copy\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2057,  "copyfile_open",  *a1);
                    *__error() = v70;
                  }

                  snprintf((char *)&v78, 0x400uLL, "%s%s", *a1, "/..namedfork/rsrc");
                  v71 = (const char *)malloc(0x90uLL);
                  a1[22] = v71;
                  if (!v71) {
                    goto LABEL_199;
                  }
                  if (((_DWORD)a1[24] & 0x40000) != 0) {
                    int v72 = MEMORY[0x1895FFBF8](&v78, v71);
                  }
                  else {
                    int v72 = MEMORY[0x189600040](&v78, v71);
                  }
                  if (v72)
                  {
                    int v73 = *__error();
                    syslog(4, "stat on %s: %m", (const char *)&v78);
                    *__error() = v73;
                    free((void *)a1[22]);
                    a1[22] = 0LL;
LABEL_199:
                    int v74 = *__error();
                    syslog(4, "malloc/stat/open on %s: %m", (const char *)&v78);
                    *__error() = v74;
                    *__error() = 0;
                    goto LABEL_10;
                  }

                  if (!a1[22]) {
                    goto LABEL_199;
                  }
                  int v75 = open((const char *)&v78, v38, 0LL);
                  *((_DWORD *)a1 + 5) = v75;
                  if (v75 < 0) {
                    goto LABEL_199;
                  }
                  if (*((_DWORD *)a1 + 69) >= 2u)
                  {
                    int v76 = *__error();
                    syslog( 7,  "%s:%d:%s() open successful on source rsrc (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2085,  "copyfile_open",  (const char *)&v78);
                    *__error() = v76;
                  }

                  *((_DWORD *)a1 + 49) |= 0x400u;
                }
              }
            }

LABEL_10:
            int v7 = a1[1];
            if (!v7 || *((_DWORD *)a1 + 6) != -2) {
              goto LABEL_154;
            }
            int v8 = *((_DWORD *)a1 + 48);
            if ((v8 & 0x800000) != 0) {
              int v9 = 2560;
            }
            else {
              int v9 = ((v8 & 0x8000008) != 0) | 0xA00;
            }
            if ((v8 & 0x400000) != 0) {
              int v10 = 2561;
            }
            else {
              int v10 = v9;
            }
            if ((v8 & 0x200000) != 0 && remove(v7) < 0 && *__error() != 2)
            {
              int v3 = *__error();
              syslog(4, "%s: remove: %m");
              goto LABEL_8;
            }

            if ((*((_BYTE *)a1 + 194) & 8) != 0)
            {
              int v15 = lstat(a1[1], (stat *)&v78);
              if ((v78.f_iosize & 0xF000) == 0xA000) {
                int v16 = 0x200000;
              }
              else {
                int v16 = 256;
              }
              if (v15 == -1) {
                int v11 = 256;
              }
              else {
                int v11 = v16;
              }
            }

            else
            {
              int v11 = 0;
            }

            int v17 = *((_DWORD *)a1 + 49);
            if ((v17 & 8) == 0)
            {
              int v18 = fstatfs(*((_DWORD *)a1 + 4), &v78);
              if (v18 == -1 || (v78.f_flags & 0x80) == 0)
              {
                if (v18 == -1) {
                  goto LABEL_123;
                }
                int v19 = *((_DWORD *)a1 + 49);
              }

              else
              {
                int v19 = *((_DWORD *)a1 + 49) | 0x10;
              }

              int v17 = v19 | 8;
              *((_DWORD *)a1 + 49) = v17;
            }

            uint64_t v20 = 0xFFFFFFFFLL;
            int v21 = v5 | v4;
            if (v5 | v4)
            {
              if ((v17 & 0x210) == 0x10)
              {
                uint64_t v20 = fcntl(*((_DWORD *)a1 + 4), 63);
                if ((v20 & 0x80000000) != 0)
                {
                  int v3 = *__error();
                  __error();
                  syslog(4, "GET_PROT_CLASS failed on (%s) with error <%d>: %m");
                  goto LABEL_8;
                }
              }
            }

            if (v6)
            {
              size_t v22 = (size_t)a1[16];
              int v23 = (char *)calloc(1uLL, v22 + 1);
              if (v23)
              {
                v24 = v23;
                if (readlink(*a1, v23, v22) == -1)
                {
                  int v46 = *__error();
                  syslog(4, "cannot readlink %s: %m");
LABEL_127:
                  *__error() = v46;
                  free(v24);
                  return 0xFFFFFFFFLL;
                }

                if (symlink(v24, a1[1]) == -1 && (*__error() != 17 || (*((_BYTE *)a1 + 194) & 2) != 0))
                {
                  int v46 = *__error();
                  syslog(4, "Cannot make symlink %s: %m");
                  goto LABEL_127;
                }

                free(v24);
                int v25 = open(a1[1], 0x200000);
                *((_DWORD *)a1 + 6) = v25;
                if (v25 == -1)
                {
                  int v3 = *__error();
                  syslog(4, "Cannot open symlink %s for reading: %m");
                  goto LABEL_8;
                }

                int i = 0;
                goto LABEL_53;
              }

              int v33 = *__error();
              syslog(4, "cannot allocate %zd bytes: %m");
LABEL_135:
              *__error() = v33;
              return 0xFFFFFFFFLL;
            }

            if (!v5)
            {
              for (int i = 0; ; int i = 1)
              {
                unsigned int v47 = v10 & 0xFFFFF9FE;
                while (1)
                {
                  while (1)
                  {
                    int v48 = a1[1];
                    uint64_t v49 = *((unsigned __int16 *)a1 + 18) | 0x80u;
                    if ((statfs(v48, &v78) != -1
                       || *__error() == 2 && dirname_r(v48, (char *)&v77) && statfs((const char *)&v77, &v78) != -1)
                      && (v78.f_flags & 0x80) != 0)
                    {
                      int v50 = open_dprotected_np(v48, v10 | v11, v20, 0, v49);
                    }

                    else
                    {
                      int v50 = open(v48, v10 | v11, v49);
                    }

                    *((_DWORD *)a1 + 6) = v50;
                    if ((v50 & 0x80000000) == 0) {
                      goto LABEL_53;
                    }
                    int v51 = *__error();
                    if (v51 != 13) {
                      break;
                    }
                    if (chmod(a1[1], *((_WORD *)a1 + 18) & 0xF7F | 0x80))
                    {
                      if (*__error() == 2) {
                        *__error() = 13;
                      }
LABEL_148:
                      int v3 = *__error();
                      goto LABEL_149;
                    }

                    *((_DWORD *)a1 + 49) |= 0x1000u;
                  }

                  if (v51 != 21) {
                    break;
                  }
                  if (*((_DWORD *)a1 + 69) >= 3u)
                  {
                    int v52 = *__error();
                    syslog( 7,  "%s:%d:%s() open failed because it is a directory (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2274,  "copyfile_open",  a1[1]);
                    *__error() = v52;
                  }

                  int v53 = *((_DWORD *)a1 + 48);
                  if ((v53 & 0x20000) != 0)
                  {
                    int v10 = v47;
                    if ((v53 & 0x800000) == 0) {
                      goto LABEL_148;
                    }
                  }

                  else
                  {
                    int v10 = v47;
                    if ((v53 & 0x800008) == 8) {
                      goto LABEL_148;
                    }
                  }
                }

                if (v51 != 17) {
                  goto LABEL_148;
                }
                if (*((_DWORD *)a1 + 69) >= 3u)
                {
                  int v54 = *__error();
                  syslog( 7,  "%s:%d:%s() open failed, retrying (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2241,  "copyfile_open",  a1[1]);
                  *__error() = v54;
                }

                int v55 = *((_DWORD *)a1 + 48);
                if ((v55 & 0x20000) != 0) {
                  goto LABEL_148;
                }
                v10 &= ~0x200u;
                if ((v55 & 0x400008) != 0)
                {
                  if (*((_DWORD *)a1 + 69) >= 4u)
                  {
                    int v56 = *__error();
                    syslog( 7,  "%s:%d:%s() truncating existing file (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2251,  "copyfile_open",  a1[1]);
                    *__error() = v56;
                  }

                  v10 |= 0x400u;
                }
              }
            }

            if (mkdir(a1[1], *((_WORD *)a1 + 18) & 0xE3F | 0x1C0) == -1)
            {
              if (*__error() != 17 || (*((_BYTE *)a1 + 194) & 2) != 0)
              {
                int v3 = *__error();
                syslog(4, "Cannot make directory %s: %m");
                goto LABEL_8;
              }

              if ((*((_BYTE *)a1 + 198) & 1) != 0)
              {
                if (lstat(a1[1], (stat *)&v78) == -1)
                {
                  int v59 = "Cannot lstat destination %s: %m";
                  goto LABEL_188;
                }

                if ((v78.f_iosize & 0xF000) == 0xA000)
                {
                  *__error() = 9;
                  *((_DWORD *)a1 + 68) = 9;
                  int v59 = "Destination %s already exists as a symlink, refusing to copy: %m";
LABEL_188:
                  int v68 = *__error();
                  syslog(4, v59, a1[1]);
                  *__error() = v68;
                  return 0xFFFFFFFFLL;
                }
              }
            }

            int v27 = open(a1[1], v11);
            *((_DWORD *)a1 + 6) = v27;
            if (v27 == -1)
            {
              int v3 = *__error();
              syslog(4, "Cannot open directory %s for reading: %m");
              goto LABEL_8;
            }

            int i = 1;
LABEL_53:
            if (*((_DWORD *)a1 + 69) >= 2u)
            {
              int v28 = *__error();
              syslog( 7,  "%s:%d:%s() open successful on destination (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2285,  "copyfile_open",  a1[1]);
              *__error() = v28;
            }

            int v29 = *((_DWORD *)a1 + 49);
            LOWORD(v30) = v29 | 0x100;
            *((_DWORD *)a1 + 49) = v29 | 0x100;
            if ((v29 & 0x10) == 0) {
              goto LABEL_56;
            }
            if ((v29 & 0x20) != 0)
            {
LABEL_165:
              if (v21 && i && (v30 & 0x240) == 0x40)
              {
                if (fcntl(*((_DWORD *)a1 + 6), 64, v20))
                {
                  int v3 = *__error();
                  __error();
                  syslog(4, "SET_PROT_CLASS failed on (%s) with error <%d>: %m");
                  goto LABEL_8;
                }

                int v30 = *((_DWORD *)a1 + 49);
              }

LABEL_56:
              if ((v30 & 0x400) == 0) {
                goto LABEL_154;
              }
              snprintf((char *)&v78, 0x400uLL, "%s%s", a1[1], "/..namedfork/rsrc");
              int v31 = open((const char *)&v78, 1537, *((unsigned __int16 *)a1 + 18) | 0x80u);
              *((_DWORD *)a1 + 7) = v31;
              if (v31 == -1)
              {
                int v62 = *__error();
                syslog(4, "open on %s: %m", (const char *)&v78);
                *__error() = v62;
                free((void *)a1[22]);
                a1[22] = 0LL;
                if (close(*((_DWORD *)a1 + 5)))
                {
                  int v63 = *__error();
                  syslog(4, "error closing source rsrc file descriptor: %m");
                  *__error() = v63;
                }

                int v32 = 0;
                *((_DWORD *)a1 + 5) = -1;
                *((_DWORD *)a1 + 49) &= ~0x400u;
              }

              else
              {
                if (*((_DWORD *)a1 + 69) < 2u) {
                  goto LABEL_154;
                }
                int v32 = *__error();
                syslog( 7,  "%s:%d:%s() open successful on destination rsrc (%s)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2346,  "copyfile_open",  (const char *)&v78);
              }

              *__error() = v32;
LABEL_154:
              if (((_DWORD)a1[3] & 0x80000000) == 0 && ((_DWORD)a1[2] & 0x80000000) == 0) {
                return 0LL;
              }
              if (*((_DWORD *)a1 + 69))
              {
                int v65 = *__error();
                syslog( 7,  "%s:%d:%s() file descriptors not open (src: %d, dst: %d)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2354,  "copyfile_open",  *((_DWORD *)a1 + 4),  *((_DWORD *)a1 + 6));
                *__error() = v65;
              }

              int v45 = 22;
              goto LABEL_160;
            }

            int v57 = fstatfs(*((_DWORD *)a1 + 6), &v78);
            if (v57 != -1 && (v78.f_flags & 0x80) != 0)
            {
              int v58 = *((_DWORD *)a1 + 49) | 0x40;
LABEL_164:
              int v30 = v58 | 0x20;
              *((_DWORD *)a1 + 49) = v30;
              goto LABEL_165;
            }

            if (v57 != -1)
            {
              int v58 = *((_DWORD *)a1 + 49);
              goto LABEL_164;
            }

LABEL_123:
            int v3 = *__error();
            __error();
            syslog(4, "failed to determine copy protection on (%s) with error <%d>: %m");
            goto LABEL_8;
          }
        }

        else
        {
          __int16 v42 = *((_WORD *)a1 + 18);
          int v43 = (unsigned int (*)(const char *, stat *))MEMORY[0x1895FFBF8];
          if (((_DWORD)a1[24] & 0x40000) == 0) {
            int v43 = (unsigned int (*)(const char *, stat *))MEMORY[0x189600040];
          }
          if (!v43(*a1, &v77))
          {
            unsigned __int16 v44 = v42 & 0xF000;
            goto LABEL_177;
          }
        }

        int v3 = *__error();
        syslog(4, "repeat stat on %s\n: %m");
        goto LABEL_8;
      case 32768:
        char v13 = 0;
        int v14 = 0;
        int v4 = 1;
        break;
      default:
        if (strcmp(*a1, "/dev/null") || ((_BYTE)a1[24] & 7) == 0)
        {
          int v45 = 45;
LABEL_160:
          *((_DWORD *)a1 + 68) = v45;
          return 0xFFFFFFFFLL;
        }

        int v4 = 0;
        int v14 = 0;
        char v13 = 1;
        break;
    }

    int v34 = 0;
    int v35 = 0;
    unsigned int v36 = *((_DWORD *)a1 + 48);
    int v37 = (v36 >> 10) & 0x100;
    goto LABEL_65;
  }

  int v3 = *__error();
  syslog(4, "stat on %s: %m");
LABEL_8:
  *__error() = v3;
  return 0xFFFFFFFFLL;
}

void reset_security(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895FEE08];
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 0x80000000) == 0)
  {
    int v3 = *(_DWORD *)(a1 + 16);
    if (v3 < 0 || (*(_BYTE *)(a1 + 192) & 2) == 0) {
      int v3 = v1;
    }
    fstat(v3, &v11);
    if ((*(_BYTE *)(a1 + 196) & 1) == 0)
    {
      int v4 = *(_DWORD *)(a1 + 24);
      int v14 = 0LL;
      int v5 = filesec_init();
      if (!v5) {
        goto LABEL_9;
      }
      if (fstatx_np(v4, &v12, v5))
      {
        if (*__error() != 45)
        {
LABEL_10:
          if (v14) {
            acl_free(v14);
          }
          if (v5) {
            filesec_free(v5);
          }
          return;
        }

LABEL_9:
        fchmod(v4, v11.st_mode & 0xFFF);
        goto LABEL_10;
      }

      if (filesec_get_property(v5, FILESEC_ACL, &v14) || acl_get_entry((acl_t)v14, 0, &entry_p)) {
        goto LABEL_10;
      }
      int v6 = entry_p;
      uid_t v7 = geteuid();
      mbr_uid_to_uuid(v7, uu);
      qualifier = acl_get_qualifier(v6);
      acl_t v17 = acl_init(1);
      if (v17)
      {
        add_uberace(&v17);
        BOOL v9 = 0;
        if (acl_get_entry(v17, 0, &v16)) {
          goto LABEL_25;
        }
        acl_get_permset(v16, &permset_p);
        acl_get_tag_type(v6, &tag_type_p);
        acl_get_permset(v6, &v19);
        if (tag_type_p == ACL_EXTENDED_ALLOW && *qualifier == *(void *)uu && qualifier[1] == *(void *)&uu[8])
        {
          BOOL v9 = *(_DWORD *)permset_p == *(_DWORD *)v19;
          if (!qualifier)
          {
LABEL_27:
            if (v17) {
              acl_free(v17);
            }
            if (!v9) {
              goto LABEL_10;
            }
            *(_WORD *)uuid_t uu = v11.st_mode & 0xFFF;
            if (!acl_delete_entry((acl_t)v14, entry_p)
              && !filesec_set_property(v5, FILESEC_ACL, &v14)
              && !filesec_set_property(v5, FILESEC_MODE, uu)
              && !fchmodx_np(v4, v5))
            {
              goto LABEL_10;
            }

            goto LABEL_9;
          }

LABEL_26:
          acl_free(qualifier);
          goto LABEL_27;
        }
      }

      BOOL v9 = 0;
LABEL_25:
      if (!qualifier) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
}

copyfile_state_t copyfile_state_alloc(void)
{
  v0 = (_filesec **)calloc(1uLL, 0x128uLL);
  int v1 = (_copyfile_state *)v0;
  if (v0)
  {
    *(void *)&__int128 v2 = 0x100000001LL;
    *((void *)&v2 + 1) = 0x100000001LL;
    *((_OWORD *)v0 + 1) = v2;
    int v3 = v0[23];
    if (v3)
    {
      filesec_free(v3);
      *((void *)v1 + 23) = 0LL;
    }

    *((void *)v1 + 23) = filesec_init();
  }

  else
  {
    *__error() = 12;
  }

  return v1;
}

int copyfile_state_get(copyfile_state_t s, uint32_t flag, void *dst)
{
  if (dst)
  {
    switch(flag)
    {
      case 1u:
        int result = 0;
        int v5 = *((_DWORD *)s + 4);
        goto LABEL_24;
      case 2u:
        int result = 0;
        uint64_t v8 = *(void *)s;
        goto LABEL_22;
      case 3u:
        int result = 0;
        int v5 = *((_DWORD *)s + 6);
        goto LABEL_24;
      case 4u:
        int result = 0;
        uint64_t v8 = *((void *)s + 1);
        goto LABEL_22;
      case 5u:
        int result = 0;
        uint64_t v8 = *((void *)s + 28);
        goto LABEL_22;
      case 6u:
        int result = 0;
        uint64_t v8 = *((void *)s + 26);
        goto LABEL_22;
      case 7u:
        int result = 0;
        uint64_t v8 = *((void *)s + 27);
        goto LABEL_22;
      case 8u:
        int result = 0;
        uint64_t v8 = *((void *)s + 33);
        goto LABEL_22;
      case 9u:
        int result = 0;
        uint64_t v8 = *((void *)s + 31);
        goto LABEL_22;
      case 0xAu:
        int result = 0;
        int v9 = (*((_DWORD *)s + 49) >> 11) & 1;
        goto LABEL_28;
      case 0xBu:
      case 0xDu:
        int result = 0;
        int v5 = *((_DWORD *)s + 71);
        goto LABEL_24;
      case 0xCu:
        int result = 0;
        int v5 = *((_DWORD *)s + 72);
        goto LABEL_24;
      case 0xEu:
        int result = 0;
        int v9 = (*((_DWORD *)s + 49) >> 13) & 1;
LABEL_28:
        *(_BYTE *)dst = v9;
        return result;
      case 0xFu:
        int result = 0;
        int v5 = (*((_DWORD *)s + 49) >> 9) & 1;
        goto LABEL_24;
      case 0x10u:
        int result = 0;
        int v5 = (*((_DWORD *)s + 49) >> 14) & 1;
        goto LABEL_24;
      case 0x11u:
        int result = 0;
        uint64_t v8 = *((void *)s + 32);
LABEL_22:
        *(void *)dst = v8;
        return result;
      case 0x12u:
        int result = 0;
        int v5 = HIWORD(*((_DWORD *)s + 49)) & 1;
        goto LABEL_24;
      default:
        if (flag != 256)
        {
          int v6 = __error();
          int v7 = 22;
          goto LABEL_5;
        }

        int result = 0;
        int v5 = *((_DWORD *)s + 70);
LABEL_24:
        *(_DWORD *)dst = v5;
        break;
    }
  }

  else
  {
    int v6 = __error();
    int v7 = 14;
LABEL_5:
    int *v6 = v7;
    return -1;
  }

  return result;
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  if (src)
  {
    switch(flag)
    {
      case 1u:
        int result = 0;
        *((_DWORD *)s + 4) = *(_DWORD *)src;
        return result;
      case 2u:
        int v7 = strdup((const char *)src);
        int result = 0;
        *(void *)s = v7;
        return result;
      case 3u:
        int result = 0;
        *((_DWORD *)s + 6) = *(_DWORD *)src;
        return result;
      case 4u:
        uint64_t v8 = strdup((const char *)src);
        int result = 0;
        *((void *)s + 1) = v8;
        return result;
      case 5u:
        if (*((void *)s + 28)) {
          *((void *)s + 28) = 0LL;
        }
        if (!*(void *)src) {
          return 0;
        }
        int result = 0;
        *((void *)s + 28) = 0LL;
        return result;
      case 6u:
        int result = 0;
        *((void *)s + 26) = src;
        return result;
      case 7u:
        int result = 0;
        *((void *)s + 27) = src;
        return result;
      case 8u:
      case 9u:
      case 0xAu:
      case 0x11u:
        goto LABEL_8;
      case 0xBu:
        int result = 0;
        *((_DWORD *)s + 71) = *(_DWORD *)src;
        return result;
      case 0xCu:
        int result = 0;
        int v9 = *(_DWORD *)src;
        goto LABEL_21;
      case 0xDu:
        int result = 0;
        int v9 = *(_DWORD *)src;
        *((_DWORD *)s + 71) = *(_DWORD *)src;
LABEL_21:
        *((_DWORD *)s + 72) = v9;
        return result;
      case 0xEu:
        if (!*(_BYTE *)src) {
          return 0;
        }
        int result = 0;
        unsigned int v10 = *((_DWORD *)s + 49) | 0x2000;
LABEL_34:
        *((_DWORD *)s + 49) = v10;
        return result;
      case 0xFu:
        int v11 = *((_DWORD *)s + 49);
        int result = 0;
        if (*(_DWORD *)src) {
          unsigned int v10 = v11 | 0x200;
        }
        else {
          unsigned int v10 = v11 & 0xFFFFFDFF;
        }
        goto LABEL_34;
      case 0x10u:
        int v12 = *((_DWORD *)s + 49);
        int result = 0;
        if (*(_DWORD *)src) {
          unsigned int v10 = v12 | 0x4000;
        }
        else {
          unsigned int v10 = v12 & 0xFFFFBFFF;
        }
        goto LABEL_34;
      case 0x12u:
        int v13 = *((_DWORD *)s + 49);
        int result = 0;
        if (*(_DWORD *)src) {
          unsigned int v10 = v13 | 0x10000;
        }
        else {
          unsigned int v10 = v13 & 0xFFFEFFFF;
        }
        goto LABEL_34;
      default:
        if (flag == 256)
        {
          int result = 0;
          *((_DWORD *)s + 70) = *(_DWORD *)src;
          return result;
        }

LABEL_8:
        int v5 = __error();
        int v6 = 22;
        break;
    }
  }

  else
  {
    int v5 = __error();
    int v6 = 14;
  }

  int *v5 = v6;
  return -1;
}

uint64_t add_uberace(acl_t *a1)
{
  uint64_t v9 = *MEMORY[0x1895FEE08];
  uid_t v2 = getuid();
  if (!mbr_uid_to_uuid(v2, uu))
  {
    uint64_t result = acl_create_entry_np(a1, &entry_p, 0);
    if ((_DWORD)result == -1) {
      return result;
    }
    if (acl_get_permset(entry_p, &permset_p) == -1)
    {
      int v4 = "acl_get_permset: %m";
    }

    else if (acl_clear_perms(permset_p) == -1)
    {
      int v4 = "acl_clear_permset: %m";
    }

    else if (acl_add_perm(permset_p, ACL_WRITE_DATA) == -1)
    {
      int v4 = "add ACL_WRITE_DATA: %m";
    }

    else if (acl_add_perm(permset_p, ACL_WRITE_ATTRIBUTES) == -1)
    {
      int v4 = "add ACL_WRITE_ATTRIBUTES: %m";
    }

    else if (acl_add_perm(permset_p, ACL_WRITE_EXTATTRIBUTES) == -1)
    {
      int v4 = "add ACL_WRITE_EXTATTRIBUTES: %m";
    }

    else if (acl_add_perm(permset_p, ACL_APPEND_DATA) == -1)
    {
      int v4 = "add ACL_APPEND_DATA: %m";
    }

    else if (acl_add_perm(permset_p, ACL_WRITE_SECURITY) == -1)
    {
      int v4 = "add ACL_WRITE_SECURITY: %m";
    }

    else if (acl_set_tag_type(entry_p, ACL_EXTENDED_ALLOW) == -1)
    {
      int v4 = "set ACL_EXTENDED_ALLOW: %m";
    }

    else if (acl_set_permset(entry_p, permset_p) == -1)
    {
      int v4 = "acl_set_permset: %m";
    }

    else
    {
      if (acl_set_qualifier(entry_p, uu) != -1) {
        return 0LL;
      }
      int v4 = "acl_set_qualifier: %m";
    }

    int v5 = *__error();
    syslog(4, v4);
    *__error() = v5;
  }

  return 0xFFFFFFFFLL;
}

uint64_t copyfile_pack(void *a1)
{
  v122[1] = *(void **)MEMORY[0x1895FEE08];
  uid_t v2 = calloc(1uLL, 0x10012uLL);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = v2;
  int v4 = (char *)calloc(1uLL, 0x10012uLL);
  if (!v4)
  {
    free(v3);
    return 0xFFFFFFFFLL;
  }

  int v5 = v4;
  int v6 = v4 + 65554;
  *int v3 = 0x2000000051607LL;
  *((_WORD *)v3 + 12) = 2;
  *(_OWORD *)((char *)v3 + 26) = xmmword_180147520;
  *(void *)((char *)v3 + 42) = 82LL;
  *(_OWORD *)(v3 + 1) = *(_OWORD *)"Mac OS X        ";
  *(void *)((char *)v3 + 84) = 1096045650LL;
  *((_DWORD *)v3 + 24) = 120;
  int v7 = (int8x8_t *)(v3 + 15);
  int v8 = *((_DWORD *)a1 + 48);
  if ((v8 & 1) != 0)
  {
    v122[0] = 0LL;
    if (filesec_get_property((filesec_t)a1[23], FILESEC_ACL, v122) < 0)
    {
      if (*((_DWORD *)a1 + 69) < 2u)
      {
        uint64_t v9 = 0LL;
      }

      else
      {
        int v11 = *__error();
        int v12 = __error();
        syslog( 7,  "%s:%d:%s() no acl entries found (errno = %d)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5390,  "copyfile_pack",  *v12);
        uint64_t v9 = 0LL;
        *__error() = v11;
      }
    }

    else
    {
      strcpy(v5, "com.apple.acl.text");
      int v6 = v5 + 19;
      uint64_t v9 = 19LL;
    }

    if (v122[0]) {
      acl_free(v122[0]);
    }
    int v8 = *((_DWORD *)a1 + 48);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  v120 = v3;
  v118 = v5;
  if ((v8 & 4) != 0)
  {
    uint64_t v56 = 65554 - v9;
    ssize_t v57 = flistxattr(*((_DWORD *)a1 + 4), &v5[v9], 65554 - v9, 0);
    if (v57 <= 0 && *((_DWORD *)a1 + 69) >= 2u)
    {
      int v58 = *__error();
      int v59 = __error();
      syslog( 7,  "%s:%d:%s() no extended attributes found (%d)\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5406,  "copyfile_pack",  *v59);
      *__error() = v58;
    }

    if (v57 >= v56) {
      ssize_t v60 = 65554 - v9;
    }
    else {
      ssize_t v60 = v57;
    }
    if (v57 <= v56)
    {
      uint64_t v56 = v60;
    }

    else if (*((_DWORD *)a1 + 69))
    {
      int v61 = *__error();
      syslog( 7,  "%s:%d:%s() extended attribute list too long\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5410,  "copyfile_pack");
      *__error() = v61;
    }

    int64_t v70 = (v56 & ~(v56 >> 63)) + v9;
    uint64_t v117 = v9;
    int v6 = &v5[v70];
    if (v56 >= 1 && !*v6)
    {
      v71 = (char **)calloc(0xAuLL, 8uLL);
      if (v71)
      {
        int v72 = v71;
        int v73 = v118;
        *int v72 = v118;
        int v74 = (char *)memchr(v73, 0, v70);
        if (v74)
        {
          int v75 = v74;
          int v76 = 10;
          uint64_t v77 = 1LL;
          do
          {
            if (v77 == v76)
            {
              v76 += 10;
              statfs v78 = (char **)realloc(v72, 8LL * v76);
              if (!v78) {
                goto LABEL_190;
              }
              int v72 = v78;
            }

            int v79 = v77 + 1;
            v72[v77] = v75 + 1;
            int v75 = (char *)memchr(v75 + 1, 0, v6 - (v75 + 1));
            ++v77;
          }

          while (v75);
          unsigned int v80 = v79 - 1;
        }

        else
        {
          unsigned int v80 = 0;
        }

        uint64_t v98 = v80;
        qsort_b(v72, v80, 8uLL, &__block_literal_global);
        unsigned int v99 = (char *)malloc(v70);
        if (v99)
        {
          v100 = v99;
          unint64_t v119 = v6;
          if ((_DWORD)v98)
          {
            int v101 = (const char **)v72;
            size_t v102 = v99;
            do
            {
              int v103 = *v101++;
              size_t v104 = strlen(v103) + 1;
              memcpy(v102, v103, v104);
              v102 += v104;
              --v98;
            }

            while (v98);
          }

          __memcpy_chk();
          free(v100);
          int v6 = v119;
          int v3 = v120;
        }

        free(v72);
      }
    }

LABEL_190:
    if (v70 < 1)
    {
      int v13 = 0;
      int v5 = v118;
      goto LABEL_17;
    }

    int v13 = 0;
    uint64_t v105 = 120LL;
    unsigned int v106 = v7;
    int v5 = v118;
    v107 = v118;
    while (1)
    {
      v108 = v6;
      size_t v109 = strlen(v107) + 1;
      if (strcmp(v107, "com.apple.FinderInfo") && strcmp(v107, "com.apple.ResourceFork"))
      {
        if (!strcmp(v107, "figgledidiggledy")) {
          int v13 = 1;
        }
        if (v109 >= 0x80) {
          size_t v109 = 128LL;
        }
        xattr_operation_intent_t v110 = *((_DWORD *)a1 + 70);
        if (v110 && !xattr_preserve_for_intent(v107, v110))
        {
          memmove(v107, &v107[v109], v108 - &v107[v109]);
          v108 -= v109;
          size_t v109 = 0LL;
        }

        else
        {
          if (!a1[26]) {
            goto LABEL_204;
          }
          MEMORY[0x1895FE128]();
          stat v111 = (char *)&v116 - ((v109 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          memmove(v111, v107, v109);
          v111[v109 - 1] = 0;
          a1[31] = v111;
          int v112 = ((uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26])( 5LL,  1LL,  a1,  *a1,  a1[1],  a1[27]);
          a1[31] = 0LL;
          if (v112 != 1)
          {
            int v3 = v120;
            if (v112 == 2)
            {
              *((_DWORD *)a1 + 68) = 89;
              uint64_t v10 = 0xFFFFFFFFLL;
              int v26 = 0LL;
              goto LABEL_167;
            }

            int v5 = v118;
LABEL_204:
            v106[1].i8[2] = v109;
            v106[1].i16[0] = 0;
            if (&v107[v109] > v108) {
              goto LABEL_214;
            }
            statfs v113 = (char *)&v106[1] + 3;
            memmove((char *)&v106[1] + 3, v107, v109);
            if (*((_DWORD *)a1 + 69) >= 2u)
            {
              int v114 = *__error();
              syslog( 7,  "%s:%d:%s() copied name [%s]\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5479,  "copyfile_pack",  v113);
              *__error() = v114;
            }

            uint64_t v115 = ((_WORD)v109 + 14) & 0x1FC;
            v105 += v115;
            if (v105 >= 65554)
            {
LABEL_214:
              int v26 = 0LL;
              uint64_t v10 = 0xFFFFFFFFLL;
              int v3 = v120;
              goto LABEL_157;
            }

            int v3 = v120;
            ++*((_WORD *)v120 + 59);
            *((_DWORD *)v3 + 24) += v115;
            goto LABEL_211;
          }

          memmove(v107, &v107[v109], v108 - &v107[v109]);
          v108 -= v109;
          size_t v109 = 0LL;
          int v3 = v120;
          int v5 = v118;
        }
      }

LABEL_211:
      v107 += v109;
      unsigned int v106 = (int8x8_t *)((char *)v3 + v105);
      int v6 = v108;
      if (v107 >= v108) {
        goto LABEL_17;
      }
    }
  }

  uint64_t v117 = v9;
  int v13 = 0;
LABEL_17:
  if (a1[28] && !v13) {
    strlcpy(&v5[v117], "figgledidiggledy", 65554 - v117);
  }
  if (v5 >= v6)
  {
    uint64_t v10 = 0LL;
    LODWORD(v117) = 0;
LABEL_111:
    unsigned int v62 = *((_DWORD *)v3 + 24);
    unsigned int v63 = *((_DWORD *)v3 + 25) + v62;
    *(_DWORD *)((char *)v3 + 42) = v63;
    *(_DWORD *)((char *)v3 + 34) = v63 - *(_DWORD *)((char *)v3 + 30);
    *((_DWORD *)v3 + 23) = v63;
    if (!(_DWORD)v117)
    {
      int v5 = v118;
LABEL_149:
      size_t v87 = v62;
      ssize_t len_p = v62;
      swap_adhdr((int8x8_t *)v3);
      int8x16_t v88 = *(int8x16_t *)((char *)v3 + 84);
      *(int8x16_t *)((char *)v3 + 84) = vrev32q_s8(v88);
      *((_DWORD *)v3 + 25) = bswap32(*((_DWORD *)v3 + 25));
      *((_WORD *)v3 + 58) = bswap32(*((unsigned __int16 *)v3 + 58)) >> 16;
      unsigned int i = *((unsigned __int16 *)v3 + 59);
      unsigned int v90 = bswap32(i) >> 16;
      *((_WORD *)v3 + 59) = v90;
      if (v88.i32[0] == 1381258305) {
        LOWORD(i) = v90;
      }
      for (unsigned int i = (unsigned __int16)i; i; --i)
      {
        uint64_t v91 = (v7[1].u8[2] + 14) & 0x1FC;
        *int v7 = vrev32_s8(*v7);
        v7[1].i16[0] = bswap32(v7[1].u16[0]) >> 16;
        int v7 = (int8x8_t *)((char *)v7 + v91);
      }

      ssize_t v92 = pwrite(*((_DWORD *)a1 + 6), v3, v87, 0LL);
      int v26 = 0LL;
      if (v92 == len_p) {
        goto LABEL_157;
      }
      if ((*((_BYTE *)a1 + 195) & 0x40) == 0) {
        goto LABEL_155;
      }
      int v81 = *__error();
      syslog(4, "couldn't write file header: %m");
LABEL_163:
      int v26 = 0LL;
      *__error() = v81;
      goto LABEL_156;
    }

    char v64 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    int v5 = v118;
    if (v64)
    {
      a1[31] = "com.apple.ResourceFork";
      int v65 = v64(5LL, 1LL, a1, *a1, a1[1], a1[27]);
      a1[31] = 0LL;
      if (v65 == 1)
      {
        int v68 = 0LL;
        int v83 = 0;
        goto LABEL_143;
      }

      if (v65 == 2) {
        goto LABEL_136;
      }
    }

    unint64_t v66 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", 0LL, 0LL, 0, 0);
    if ((v66 & 0x8000000000000000LL) != 0)
    {
      if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
      {
        int v81 = *__error();
        v82 = __error();
        syslog(4, "skipping attr %s due to error %d: %m", "com.apple.ResourceFork", *v82);
        goto LABEL_163;
      }

      goto LABEL_155;
    }

    size_t v67 = v66;
    if (v66 >> 31)
    {
      int v68 = 0LL;
      int v69 = 22;
LABEL_137:
      *((_DWORD *)a1 + 68) = v69;
      goto LABEL_138;
    }

    uint64_t v84 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    if (v84)
    {
      a1[31] = "com.apple.ResourceFork";
      a1[33] = 0LL;
      int v85 = v84(5LL, 4LL, a1, *a1, a1[1], a1[27]);
      a1[31] = 0LL;
      if (v85 == 2)
      {
LABEL_136:
        int v68 = 0LL;
        int v69 = 89;
        goto LABEL_137;
      }
    }

    int v68 = malloc(v67);
    if (v68)
    {
      if (fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", v68, v67, 0, 0) == v67)
      {
        if (pwrite(*((_DWORD *)a1 + 6), v68, v67, *(unsigned int *)((char *)v3 + 42)) != v67
          && (*((_BYTE *)a1 + 195) & 0x40) != 0)
        {
          int v94 = *__error();
          syslog(4, "couldn't write resource fork: %m");
          *__error() = v94;
        }

        unsigned int v95 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
        if (!v95 || v95(5LL, 2LL, a1, *a1, a1[1], a1[27]) != 2)
        {
          if (*((_DWORD *)a1 + 69) >= 3u)
          {
            int v96 = *__error();
            syslog( 7,  "%s:%d:%s() copied %zd bytes of %s data @ offset 0x%08x\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5295,  "copyfile_pack_rsrcfork",  v67,  "com.apple.ResourceFork",  *(_DWORD *)((char *)v3 + 42));
            *__error() = v96;
          }

          int v83 = 0;
          *(_DWORD *)((char *)v3 + 46) = v67;
LABEL_143:
          if (a1[31]) {
            a1[31] = 0LL;
          }
          if (v68) {
            free(v68);
          }
          if (!v83)
          {
            uint64_t v10 = 0LL;
            unsigned int v62 = *((_DWORD *)v3 + 24);
            goto LABEL_149;
          }

LABEL_155:
          int v26 = 0LL;
LABEL_156:
          uint64_t v10 = 0xFFFFFFFFLL;
          goto LABEL_157;
        }

                __nbyte = read(v105, v72, __size);
                if (__nbyte <= 0)
                {
LABEL_191:
                  if ((__nbyte & 0x8000000000000000LL) == 0)
                  {
                    if (lseek(v105, v67, 0) == -1 || lseek(__fd, v95, 0) == -1)
                    {
                      unsigned int v89 = *__error();
                      syslog(4, "unable to reset file descriptors to punch holes: %m", v90, v91);
                      goto LABEL_204;
                    }

                    do
                    {
                      uint64_t v86 = lseek(v105, v70 + __size, 4);
                      if (v86 == -1)
                      {
                        if (*__error() != 6) {
                          goto LABEL_209;
                        }
                        *(void *)&v111.f_buint64_t size = 0LL;
                        v111.f_blocks = v70 - v67 + v95;
                        v111.f_bfree = v34 - v70 - v34 % __size;
                        if (fcntl(__fd, 99, &v111) == -1)
                        {
                          unsigned int v89 = *__error();
                          syslog(4, "unable to punch trailing hole in destination file, offset %lld: %m");
                          goto LABEL_204;
                        }

                        goto LABEL_180;
                      }

                      size_t v87 = v86;
                      *(void *)&v111.f_buint64_t size = 0LL;
                      v111.f_blocks = v70 - v67 + v95;
                      v111.f_bfree = v86 - v70;
                      if (fcntl(__fd, 99, &v111) == -1)
                      {
                        unsigned int v89 = *__error();
                        syslog(4, "unable to punch hole in destination file, offset %lld length %lld: %m");
                        goto LABEL_204;
                      }

                      int8x16_t v88 = lseek(v105, v87, 3);
                      int64_t v70 = v88;
                    }

                    while (v88 != -1 && v88 != v34);
                    if (v88 == -1 && *__error() != 6)
                    {
LABEL_209:
                      unsigned int v89 = *__error();
                      syslog(4, "lseek during hole punching failed: %m", v90, v91);
LABEL_204:
                      *__error() = v89;
                    }

LABEL_138:
        uint64_t v86 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
        if (v86)
        {
          if (v86(5LL, 3LL, a1, *a1, a1[1], a1[27])) {
            int v83 = -1;
          }
          else {
            int v83 = 0;
          }
        }

        else
        {
          int v83 = -1;
        }

        goto LABEL_143;
      }

      if ((*((_BYTE *)a1 + 195) & 0x40) == 0) {
        goto LABEL_138;
      }
      int v97 = *__error();
      syslog(4, "couldn't read entire resource fork: %m");
    }

    else
    {
      int v97 = *__error();
      syslog(4, "malloc: %m");
    }

    *__error() = v97;
    goto LABEL_138;
  }

  int v14 = v5;
  LODWORD(v117) = 0;
  uint64_t v10 = 0LL;
  int v15 = v7;
  unint64_t v119 = v6;
  while (1)
  {
    size_t v16 = strlen(v14);
    if (!strcmp(v14, "com.apple.acl.text"))
    {
      v122[0] = 0LL;
      if (filesec_get_property((filesec_t)a1[23], FILESEC_ACL, v122) < 0)
      {
        if (*__error() != 2 && (*((_BYTE *)a1 + 195) & 0x40) != 0)
        {
          int v36 = *__error();
          syslog(4, "getting acl: %m");
          *__error() = v36;
        }

        int v26 = 0LL;
        ssize_t len_p = 0LL;
      }

      else
      {
        size_t v22 = acl_to_text((acl_t)v122[0], &len_p);
        if (v22)
        {
          int v23 = v22;
          ssize_t v24 = len_p + 1;
          ssize_t len_p = v24;
          int v25 = malloc(v24);
          int v26 = v25;
          if (v25) {
            memcpy(v25, v23, v24);
          }
          else {
            ssize_t len_p = 0LL;
          }
          acl_free(v23);
          int v6 = v119;
        }

        else
        {
          int v26 = 0LL;
        }

        int v3 = v120;
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          int v37 = *__error();
          syslog( 7,  "%s:%d:%s() copied acl (%ld) %p\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5200,  "copyfile_pack_acl",  len_p,  v26);
          *__error() = v37;
          int v6 = v119;
        }
      }

      if (v122[0]) {
        acl_free(v122[0]);
      }
      goto LABEL_66;
    }

    if (a1[28] && !strcmp(v14, "figgledidiggledy"))
    {
      int v26 = 0LL;
      goto LABEL_66;
    }

    if (!strcmp(v14, "com.apple.FinderInfo")) {
      break;
    }
    if (strcmp(v14, "com.apple.ResourceFork"))
    {
      acl_t v17 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
      if (v17)
      {
        a1[31] = strdup(v14);
        a1[33] = 0LL;
        int v18 = v17(5LL, 4LL, a1, *a1, a1[1], a1[27]);
        acl_permset_t v19 = (void *)a1[31];
        if (v19)
        {
          free(v19);
          a1[31] = 0LL;
        }

        if (v18 == 2)
        {
LABEL_164:
          int v26 = 0LL;
LABEL_165:
          *((_DWORD *)a1 + 68) = 89;
          goto LABEL_166;
        }
      }

      unint64_t v20 = fgetxattr(*((_DWORD *)a1 + 4), v14, 0LL, 0LL, 0, 0);
      ssize_t len_p = v20;
      if (!v20) {
        goto LABEL_35;
      }
      size_t v21 = v20;
      if ((v20 & 0x8000000000000000LL) != 0)
      {
        int v3 = v120;
        if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
        {
          int v47 = *__error();
          int v48 = __error();
          syslog(4, "skipping attr %s due to error %d: %m", v14, *v48);
          *__error() = v47;
        }

        uint64_t v49 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
        if (v49)
        {
          a1[31] = strdup(v14);
          int v50 = v49(5LL, 3LL, a1, *a1, a1[1], a1[27]);
          int v51 = (void *)a1[31];
          if (v51)
          {
            free(v51);
            a1[31] = 0LL;
          }

          if (v50 == 2) {
            goto LABEL_164;
          }
        }

        goto LABEL_72;
      }

      if (v20 >= 0x1000001)
      {
        if ((*((_BYTE *)a1 + 195) & 0x40) == 0)
        {
LABEL_35:
          int v3 = v120;
LABEL_72:
          int v15 = (int8x8_t *)((char *)v15 + ((v15[1].u8[2] + 14) & 0x1FC));
          goto LABEL_73;
        }

        int v42 = *__error();
        syslog(4, "skipping attr %s (too big): %m", v14);
        int v3 = v120;
LABEL_71:
        *__error() = v42;
        goto LABEL_72;
      }

      int v52 = malloc(v20);
      if (!v52)
      {
        uint64_t v10 = 0xFFFFFFFFLL;
        int v3 = v120;
        goto LABEL_73;
      }

      int v26 = v52;
      ssize_t len_p = fgetxattr(*((_DWORD *)a1 + 4), v14, v52, v21, 0, 0);
      int v53 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
      if (v53)
      {
        a1[31] = strdup(v14);
        int v54 = v53(5LL, 2LL, a1, *a1, a1[1], a1[27]);
        int v55 = (void *)a1[31];
        int v3 = v120;
        if (v55)
        {
          free(v55);
          a1[31] = 0LL;
        }

        if (v54 == 2) {
          goto LABEL_165;
        }
      }

      else
      {
        int v3 = v120;
      }

      int v6 = v119;
LABEL_66:
      ssize_t v38 = len_p;
      v15->i32[1] = len_p;
      int v39 = *((_DWORD *)v3 + 25);
      off_t v40 = (v39 + *((_DWORD *)v3 + 24));
      v15->i32[0] = v40;
      *((_DWORD *)v3 + 25) = v39 + v38;
      ssize_t v41 = pwrite(*((_DWORD *)a1 + 6), v26, v38, v40);
      if (v41 == len_p) {
        uint64_t v10 = v10;
      }
      else {
        uint64_t v10 = 1LL;
      }
      free(v26);
      if (*((_DWORD *)a1 + 69) < 3u) {
        goto LABEL_72;
      }
      int v42 = *__error();
      syslog( 7,  "%s:%d:%s() copied %ld bytes of %s data @ offset 0x%08x\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  5702,  "copyfile_pack",  len_p,  v14,  v15->i32[0]);
      goto LABEL_71;
    }

    LODWORD(v117) = 1;
LABEL_73:
    v14 += v16 + 1;
    if (v14 >= v6) {
      goto LABEL_111;
    }
  }

  int v27 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (v27)
  {
    a1[31] = "com.apple.FinderInfo";
    int v28 = v27(5LL, 1LL, a1, *a1, a1[1], a1[27]);
    a1[31] = 0LL;
    if (v28 == 1) {
      goto LABEL_73;
    }
    if (v28 == 2) {
      goto LABEL_164;
    }
    a1[33] = 0LL;
    int v29 = ((uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26])( 5LL,  4LL,  a1,  *a1,  a1[1],  a1[27]);
    a1[31] = 0LL;
    if (v29 == 2) {
      goto LABEL_164;
    }
  }

  ssize_t v30 = fgetxattr(*((_DWORD *)a1 + 4), v14, (char *)v3 + *(unsigned int *)((char *)v3 + 30), 0x20uLL, 0, 0);
  ssize_t len_p = v30;
  if ((v30 & 0x8000000000000000LL) == 0)
  {
    int v31 = *((_DWORD *)a1 + 48);
    if (v30 != 32)
    {
      if ((v31 & 0x40000000) == 0) {
        goto LABEL_73;
      }
      int v46 = *__error();
      syslog(4, "unexpected size (%ld) for %s: %m");
      goto LABEL_90;
    }

    if ((v31 & 0x40000000) != 0)
    {
      int v32 = *__error();
      syslog( 4,  " copied 32 bytes of %s data @ offset 0x%08x: %m",  "com.apple.FinderInfo",  *(_DWORD *)((char *)v3 + 30));
      *__error() = v32;
    }

    int v33 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    if (v33)
    {
      a1[31] = strdup(v14);
      int v34 = v33(5LL, 2LL, a1, *a1, a1[1], a1[27]);
      int v35 = (void *)a1[31];
      if (v35)
      {
        free(v35);
        a1[31] = 0LL;
      }

      if (v34 == 2) {
        goto LABEL_182;
      }
    }

    goto LABEL_73;
  }

  int v43 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (!v43) {
    goto LABEL_79;
  }
  a1[31] = strdup(v14);
  int v44 = v43(5LL, 3LL, a1, *a1, a1[1], a1[27]);
  int v45 = (void *)a1[31];
  if (v45)
  {
    free(v45);
    a1[31] = 0LL;
  }

  if (v44 != 2)
  {
LABEL_79:
    if ((*((_BYTE *)a1 + 195) & 0x40) == 0) {
      goto LABEL_73;
    }
    int v46 = *__error();
    __error();
    syslog(4, "skipping attr %s due to error %d: %m");
LABEL_90:
    *__error() = v46;
    goto LABEL_73;
  }

LABEL_182:
  int v26 = 0LL;
LABEL_166:
  uint64_t v10 = 0xFFFFFFFFLL;
LABEL_167:
  int v5 = v118;
LABEL_157:
  free(v3);
  free(v5);
  if (v26) {
    free(v26);
  }
  if (!(_DWORD)v10) {
    copyfile_stat((uint64_t)a1);
  }
  return v10;
}

uint64_t copyfile_data(void *a1, int a2)
{
  uint64_t v112 = *MEMORY[0x1895FEE08];
  if ((*((_WORD *)a1 + 18) & 0xF000) != 0x8000) {
    return 0LL;
  }
  int v4 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if ((a2 & 1) != 0)
  {
    int v5 = (int *)a1 + 5;
    size_t v104 = (int *)(a1 + 2);
    int v6 = (int *)a1 + 7;
    int v7 = (int *)(a1 + 3);
    int v8 = (void *)a1[22];
    goto LABEL_17;
  }

  int v10 = *((_DWORD *)a1 + 49);
  if ((v10 & 4) != 0)
  {
    if ((v10 & 0x80) != 0)
    {
      BOOL v11 = 1;
      if ((v10 & 0x100) != 0) {
        goto LABEL_8;
      }
    }

    else
    {
      BOOL v11 = lseek(*((_DWORD *)a1 + 4), 0LL, 1) == 0;
      if ((*((_DWORD *)a1 + 49) & 0x100) != 0)
      {
LABEL_8:
        BOOL v12 = 1;
        goto LABEL_11;
      }
    }

    BOOL v12 = lseek(*((_DWORD *)a1 + 6), 0LL, 1) == 0;
LABEL_11:
    if (v11
      && v12
      && !copyfile_set_bsdflags((uint64_t)a1, 32, -1)
      && !fstat(*((_DWORD *)a1 + 6), (stat *)&v111)
      && (v111.f_mntonname[28] & 0x20) != 0)
    {
      goto LABEL_157;
    }

    fremovexattr(*((_DWORD *)a1 + 6), "com.apple.decmpfs", 32);
    fremovexattr(*((_DWORD *)a1 + 6), "com.apple.ResourceFork", 32);
  }

  int v5 = (int *)(a1 + 2);
  int v6 = (int *)(a1 + 3);
  int v8 = a1 + 4;
  int v7 = (int *)(a1 + 3);
  size_t v104 = (int *)(a1 + 2);
LABEL_17:
  int v13 = *v6;
  if (fstatfs(*v5, &v111) == -1)
  {
    f_buint64_t size = 0LL;
    f_iouint64_t size = *((_DWORD *)v8 + 28);
  }

  else
  {
    f_buint64_t size = v111.f_bsize;
    f_iouint64_t size = v111.f_iosize;
  }

  unint64_t v16 = f_iosize;
  if (fstatfs(v13, &v111) == -1)
  {
    acl_t v17 = 0LL;
    unint64_t v18 = v16;
  }

  else
  {
    acl_t v17 = (void *)v111.f_bsize;
    else {
      LODWORD(v18) = v111.f_iosize;
    }
    unint64_t v18 = (int)v18;
    if (!v111.f_iosize) {
      unint64_t v18 = v16;
    }
  }

  v107 = v17;
  unint64_t v19 = *((unsigned int *)a1 + 71);
  if (f_bsize > v19) {
    unint64_t v19 = v16;
  }
  unint64_t v20 = *((unsigned int *)a1 + 72);
  BOOL v21 = v19 < v20 || (unint64_t)v17 > v20;
  if (v21) {
    unint64_t v22 = v18;
  }
  else {
    unint64_t v22 = *((unsigned int *)a1 + 72);
  }
  unint64_t v23 = v8[12];
  if (v23 < v19 && f_bsize != 0)
  {
    if (*((_DWORD *)a1 + 69) >= 3u)
    {
      int v25 = *__error();
      syslog( 7,  "%s:%d:%s() rounding up block size from fsize: %lld to multiple of %zu\n\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2852,  "copyfile_get_bsizes",  a1[16],  f_bsize);
      *__error() = v25;
      unint64_t v23 = v8[12];
    }

    if (v23 % f_bsize) {
      unint64_t v26 = f_bsize - v23 % f_bsize;
    }
    else {
      unint64_t v26 = 0LL;
    }
    unint64_t v19 = v26 + v23;
    if (v22 >= v19) {
      unint64_t v22 = v19;
    }
  }

  if (v22 >= 0x40000000) {
    uint64_t v27 = 0x40000000LL;
  }
  else {
    uint64_t v27 = v22;
  }
  if (v19 <= 0x40000000) {
    unint64_t v28 = v22;
  }
  else {
    unint64_t v28 = v27;
  }
  if (v19 >= 0x40000000) {
    size_t v29 = 0x40000000LL;
  }
  else {
    size_t v29 = v19;
  }
  *__error() = 0;
  if (*((_DWORD *)a1 + 69) >= 3u)
  {
    int v30 = *__error();
    syslog( 7,  "%s:%d:%s() input block size: %zu output block size: %zu\n\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  2926,  "copyfile_data",  v29,  v28);
    *__error() = v30;
  }

  if ((a2 & 1) != 0) {
    goto LABEL_73;
  }
  a1[33] = 0LL;
  if ((*((_BYTE *)a1 + 195) & 8) == 0) {
    goto LABEL_73;
  }
  size_t v101 = v29;
  uint64_t v31 = fpathconf(*v104, 27);
  if (v31 >= fpathconf(*v7, 27)) {
    int v32 = v7;
  }
  else {
    int v32 = v104;
  }
  unint64_t v33 = fpathconf(*v32, 27);
  if (f_bsize && v107 && v33 >= f_bsize && v33 >= (unint64_t)v107)
  {
    int v105 = *((_DWORD *)a1 + 4);
    int __fd = *((_DWORD *)a1 + 6);
    unint64_t v34 = a1[16];
    int v35 = f_bsize >= (unint64_t)v107 ? v107 : (void *)f_bsize;
    int v36 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    *__error() = 0;
    if ((*((_BYTE *)a1 + 195) & 8) != 0)
    {
      __uint64_t size = (size_t)v35;
      if ((v34 & 0x8000000000000000LL) != 0)
      {
        int v72 = 0LL;
        int v85 = 22;
        goto LABEL_163;
      }

      if (v34)
      {
        unint64_t v67 = lseek(v105, 0LL, 1);
        unint64_t v68 = lseek(__fd, 0LL, 1);
        if ((v67 & 0x8000000000000000LL) != 0 || v34 <= v67 || (v68 & 0x8000000000000000LL) != 0)
        {
          if (!*__error()) {
            *__error() = 22;
          }
          int v85 = *__error();
          syslog(4, "Invalid file descriptor offset, cannot perform a sparse copy: %m");
        }

        else
        {
          if (v67 % __size || v68 % __size) {
            goto LABEL_71;
          }
          uint64_t v94 = v34 - v67;
          off_t v95 = v68;
          off_t v69 = lseek(v105, v67, 3);
          if (v69 == -1 || v69 == v34)
          {
            if (lseek(v105, v67, 0) == -1)
            {
              int v72 = 0LL;
              goto LABEL_164;
            }

            goto LABEL_71;
          }

          off_t v70 = v69;
          if (ftruncate(__fd, v95) == -1)
          {
            int v85 = *__error();
            syslog(4, "Could not zero destination file before copy: %m");
          }

          else if (ftruncate(__fd, v94 + v95) == -1)
          {
            int v85 = *__error();
            syslog(4, "Could not set destination file size before copy: %m");
          }

          else
          {
            off_t v71 = lseek(v105, v67, 4);
            if (v71 == -1)
            {
              int v72 = 0LL;
              if (*__error() == 6) {
                goto LABEL_180;
              }
              goto LABEL_164;
            }

            off_t v98 = v71;
            if (lseek(__fd, v71 + v95 - v67, 0) != -1)
            {
              int v72 = (char *)malloc(__size);
              if (!v72)
              {
                int v85 = *__error();
                syslog(4, "No memory for copy buffer: %m", v90, v91);
                goto LABEL_163;
              }

              ssize_t __nbyte = read(v105, v72, __size);
              if (__nbyte < 1) {
                goto LABEL_191;
              }
              while (1)
              {
                int v92 = 0;
                size_t v73 = __nbyte;
                int v103 = v72;
                do
                {
                  while (1)
                  {
                    ssize_t v74 = write(__fd, v103, v73);
                    if (v74 != -1) {
                      break;
                    }
                    int v75 = *__error();
                    syslog(4, "writing to output file failed: %m");
                    *__error() = v75;
                    if (!v36) {
                      goto LABEL_164;
                    }
                    int v76 = v36(4LL, 3LL, a1, *a1, a1[1], a1[27]);
                    if (v76)
                    {
                      if (v76 == 1)
                      {
                        int v62 = 0;
                        *__error() = 0;
                        goto LABEL_181;
                      }

LABEL_164:
                      char v79 = 0;
                      *((_DWORD *)a1 + 68) = *__error();
                      int v62 = -1;
                      if (v72) {
LABEL_165:
                      }
                        free(v72);
LABEL_166:
                      int v37 = 0LL;
                      if ((v79 & 1) != 0)
                      {
LABEL_167:
                        uint64_t v9 = 0LL;
                        goto LABEL_173;
                      }

LABEL_111:
                      if (v62 == -1) {
                        goto LABEL_171;
                      }
                      goto LABEL_167;
                    }

                    *__error() = 0;
                  }

                  if (v74)
                  {
                    int v92 = 0;
                    v73 -= v74;
                    v103 += v74;
                  }

                  else
                  {
                    int v77 = v92 + 1;
                    BOOL v21 = v92++ < 5;
                    if (!v21)
                    {
                      int v84 = *__error();
                      syslog(4, "writing to output %d times resulted in 0 bytes written: %m", v77);
                      *__error() = v84;
                      int v85 = 35;
                      goto LABEL_163;
                    }
                  }

                  a1[33] += v74;
                  if (v36 && v36(4LL, 4LL, a1, *a1, a1[1], a1[27]) == 2)
                  {
                    int v85 = 89;
                    goto LABEL_163;
                  }
                }

                while (v73);
                v98 += __nbyte;
                off_t v78 = lseek(v105, v98, 3);
                if (v78 == -1)
                {
                  if (*__error() != 6)
                  {
                    int v85 = *__error();
                    syslog(4, "unable to find next hole in file during copy: %m", v90, v91);
                    goto LABEL_163;
                  }

                  goto LABEL_191;
                }

                if (v78 != v98)
                {
                  if (lseek(v105, v98, 0) == -1) {
                    goto LABEL_164;
                  }
                  goto LABEL_155;
                }

                off_t v98 = lseek(v105, v98, 4);
                if (v98 == -1)
                {
                  if (*__error() != 6)
                  {
                    int v85 = *__error();
                    syslog(4, "unable to advance src to next data section: %m", v90, v91);
                    goto LABEL_163;
                  }

                  goto LABEL_191;
                }

                if (lseek(__fd, v98 + v95 - v67, 0) == -1)
                {
                  int v85 = *__error();
                  syslog(4, "unable to advance dst to next data section: %m", v90, v91);
                  goto LABEL_163;
                }

LABEL_180:
                    int v62 = 0;
                    a1[33] = v94;
LABEL_181:
                    char v79 = 1;
                    if (v72) {
                      goto LABEL_165;
                    }
                    goto LABEL_166;
                  }

                  int v85 = *__error();
                  __error();
                  syslog(4, "error %d reading from %s: %m");
LABEL_163:
                  *__error() = v85;
                  goto LABEL_164;
                }
              }
            }

            int v85 = *__error();
            syslog(4, "failed to set dst to first data section: %m");
          }
        }

        int v72 = 0LL;
        goto LABEL_163;
      }

LABEL_157:
      int v37 = 0LL;
      goto LABEL_167;
    }
  }

LABEL_71:
  size_t v29 = v101;
  if ((a1[24] & 8) == 0)
  {
    int v37 = 0LL;
    *__error() = 45;
    goto LABEL_171;
  }

LABEL_171:
  int v63 = *__error();
LABEL_172:
  *((_DWORD *)a1 + 68) = v63;
  uint64_t v9 = 0xFFFFFFFFLL;
LABEL_173:
  free(v37);
  return v9;
}

uint64_t copyfile_stat(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  __int16 v2 = *(_WORD *)(a1 + 36);
  mode_t v3 = v2 & 0xFFF;
  int v4 = *(_DWORD *)(a1 + 196);
  if ((v4 & 0x4000) == 0)
  {
    if ((v4 & 0x8000) != 0
      || (fstatfs(*(_DWORD *)(a1 + 16), &v12) != -1 ? (BOOL v5 = (v12.f_flags & 8) == 0) : (BOOL v5 = 1),
          !v5 || (fstatfs(*(_DWORD *)(a1 + 24), &v12) != -1 ? (BOOL v6 = (v12.f_flags & 8) == 0) : (BOOL v6 = 1), !v6)))
    {
      mode_t v3 = v2 & 0x3FF;
    }
  }

  v11[1] = 0LL;
  v11[2] = 0LL;
  v11[0] = 0x140000000005LL;
  __int128 v7 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v12.f_buint64_t size = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v12.f_bfree = v7;
  fsetattrlist(*(_DWORD *)(a1 + 24), v11, &v12, 0x20uLL, 0);
  fchown(*(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52));
  fchmod(*(_DWORD *)(a1 + 24), v3);
  int v8 = *(_DWORD *)(a1 + 148);
  if ((*(_DWORD *)(a1 + 192) & 0x10000000) != 0) {
    int v9 = 1573056;
  }
  else {
    int v9 = 1572992;
  }
  uint64_t result = copyfile_set_bsdflags(a1, (*(_DWORD *)(a1 + 196) << 14) & 0x8000 | v8 & 0xFFE7FF3F, v9);
  if ((v8 & 0x60026) == 0x20) {
    return fsetattrlist(*(_DWORD *)(a1 + 24), v11, &v12, 0x20uLL, 0);
  }
  return result;
}

int8x8_t swap_adhdr(int8x8_t *a1)
{
  LODWORD(v1) = a1[3].u16[0];
  unsigned int v2 = bswap32(v1) >> 16;
  int8x8_t result = *a1;
  int8x8_t v4 = vrev32_s8(*a1);
  if (a1->u32[0] != 333319) {
    LOWORD(v1) = v2;
  }
  *a1 = v4;
  a1[3].i16[0] = v2;
  if ((_WORD)v1)
  {
    uint64_t v1 = (unsigned __int16)v1;
    BOOL v5 = (unsigned int *)((char *)&a1[4] + 2);
    do
    {
      int8x8_t result = vrev32_s8(*(int8x8_t *)(v5 - 2));
      *((int8x8_t *)v5 - 1) = result;
      unsigned int *v5 = bswap32(*v5);
      v5 += 3;
      --v1;
    }

    while (v1);
  }

  return result;
}

int8x16_t swap_attrhdr(uint64_t a1)
{
  int8x16_t result = vrev32q_s8(*(int8x16_t *)(a1 + 84));
  *(int8x16_t *)(a1 + 84) = result;
  *(_DWORD *)(a1 + 100) = bswap32(*(_DWORD *)(a1 + 100));
  *(_WORD *)(a1 + 116) = bswap32(*(unsigned __int16 *)(a1 + 116)) >> 16;
  *(_WORD *)(a1 + 118) = bswap32(*(unsigned __int16 *)(a1 + 118)) >> 16;
  return result;
}

uint64_t __sort_xattrname_list_block_invoke(uint64_t a1, const char **a2, const char **a3)
{
  return strcmp(*a2, *a3);
}

uint64_t copyfile_unpack_xattr(void *a1, uint64_t a2, void *value)
{
  if (!*((_DWORD *)a1 + 70))
  {
    int v6 = xattr_preserve_for_intent((const char *)(a2 + 11), 0);
    uint64_t result = 0LL;
    if (v6 != 1) {
      return result;
    }
  }

  int v8 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (v8)
  {
    a1[31] = strdup((const char *)(a2 + 11));
    a1[33] = 0LL;
    int v9 = v8(5LL, 1LL, a1, *a1, a1[1], a1[27]);
    int v10 = (void *)a1[31];
    if (v10)
    {
      free(v10);
      a1[31] = 0LL;
    }

    if (v9 == 2) {
      goto LABEL_12;
    }
  }

  BOOL v11 = (const char *)(a2 + 11);
  int v12 = fsetxattr(*((_DWORD *)a1 + 6), (const char *)(a2 + 11), value, *(unsigned int *)(a2 + 4), 0, 0);
  int v13 = *__error();
  if (v12 != -1 || v13 == 1 && !strcmp((const char *)(a2 + 11), "com.apple.root.installed"))
  {
    uint64_t v14 = a1[26];
    *__error() = v13;
    if (!v14) {
      return 0LL;
    }
    a1[31] = strdup((const char *)(a2 + 11));
    a1[33] = *(unsigned int *)(a2 + 4);
    int v15 = ((uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26])( 5LL,  2LL,  a1,  *a1,  a1[1],  a1[27]);
    unint64_t v16 = (void *)a1[31];
    if (v16)
    {
      free(v16);
      a1[31] = 0LL;
    }

    if (v15 != 2) {
      return 0LL;
    }
LABEL_12:
    *((_DWORD *)a1 + 68) = 89;
    return 0xFFFFFFFFLL;
  }

  *__error() = v13;
  if ((*((_BYTE *)a1 + 195) & 0x40) != 0)
  {
    int v17 = *__error();
    syslog(4, "error %d setting attribute %s: %m", v13, v11);
    *__error() = v17;
  }

  unint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  a1[31] = strdup(v11);
  int v19 = v18(5LL, 3LL, a1, *a1, a1[1], a1[27]);
  unint64_t v20 = (void *)a1[31];
  if (v20)
  {
    free(v20);
    a1[31] = 0LL;
  }

  if (v19 == 2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

uint64_t copyfile_unpack_acl(uint64_t a1, unsigned int a2, char *buf_p)
{
  if (buf_p[a2 - 1])
  {
    int v6 = (char *)malloc(a2 + 1);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    __int128 v7 = v6;
    memcpy(v6, buf_p, a2);
    v7[a2] = 0;
    v22[0] = acl_from_text(v7);
    free(v7);
    if (v22[0]) {
      goto LABEL_4;
    }
    return 0LL;
  }

  v22[0] = acl_from_text(buf_p);
  if (!v22[0]) {
    return 0LL;
  }
LABEL_4:
  int v8 = filesec_init();
  if (!v8
    || (uint64_t v9 = fstatx_np(*(_DWORD *)(a1 + 24), &v21, v8), (v9 & 0x80000000) != 0)
    || (uint64_t v10 = v9, filesec_set_property(v8, FILESEC_ACL, v22) < 0))
  {
LABEL_36:
    uint64_t v10 = 0xFFFFFFFFLL;
  }

  else
  {
    char v11 = 1;
    while (fchmodx_np(*(_DWORD *)(a1 + 24), v8) < 0)
    {
      if (*__error() != 45 || (v11 & 1) == 0) {
        goto LABEL_35;
      }
      if (filesec_set_property(*(filesec_t *)(a1 + 184), FILESEC_ACL, 0LL) == -1)
      {
        if (*(_DWORD *)(a1 + 276) >= 5u)
        {
          int v13 = *__error();
          uint64_t v14 = *(const char **)(a1 + 8);
          if (!v14) {
            uint64_t v14 = "(null dst)";
          }
          syslog( 7,  "%s:%d:%s() unsetting acl attribute on %s\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1854,  "copyfile_unset_acl",  v14);
          *__error() = v13;
        }

        int v12 = 1;
      }

      else
      {
        int v12 = 0;
      }

      if (filesec_set_property(*(filesec_t *)(a1 + 184), FILESEC_UUID, 0LL) == -1)
      {
        if (*(_DWORD *)(a1 + 276) >= 5u)
        {
          int v15 = *__error();
          unint64_t v16 = *(const char **)(a1 + 8);
          if (!v16) {
            unint64_t v16 = "(null dst)";
          }
          syslog( 7,  "%s:%d:%s() unsetting uuid attribute on %s\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1859,  "copyfile_unset_acl",  v16);
          *__error() = v15;
        }

        int v12 = 1;
      }

      if (filesec_set_property(*(filesec_t *)(a1 + 184), FILESEC_GRPUUID, 0LL) == -1)
      {
        if (*(_DWORD *)(a1 + 276) >= 5u)
        {
          int v17 = *__error();
          unint64_t v18 = *(const char **)(a1 + 8);
          if (!v18) {
            unint64_t v18 = "(null dst)";
          }
          syslog( 7,  "%s:%d:%s() unsetting group uuid attribute on %s\n",  "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c",  1864,  "copyfile_unset_acl",  v18);
          *__error() = v17;
        }

LABEL_35:
        int v19 = *__error();
        syslog(4, "setting security information: %m");
        *__error() = v19;
        goto LABEL_36;
      }

      char v11 = 0;
      if (v12) {
        goto LABEL_35;
      }
    }

    if (!(_DWORD)v10) {
      *(_DWORD *)(a1 + 196) |= 0x1000u;
    }
  }

  acl_free(v22[0]);
  filesec_free(v8);
  return v10;
}

BOOL doesdecmpfs(int a1)
{
  uint64_t v6 = *MEMORY[0x1895FEE08];
  BOOL result = 0;
  if (!fstatfs(a1, &v4))
  {
    __strlcpy_chk();
    v3[2] = 0LL;
    v3[0] = 5LL;
    v3[1] = 0x20000LL;
    if (getattrlist(v5, v3, v2, 0x24uLL, 0) != -1 && (v2[6] & 1) != 0 && (v2[22] & 1) != 0) {
      return 1;
    }
  }

  return result;
}

uint64_t copyfile_set_bsdflags(uint64_t a1, int a2, int a3)
{
  if (fstat(*(_DWORD *)(a1 + 24), &v11))
  {
    if (a3)
    {
      if (*(_DWORD *)(a1 + 276))
      {
        int v6 = *__error();
        __error();
        syslog(7, "%s:%d:%s() couldn't stat destination file for st_flags (%d)\n");
LABEL_18:
        *__error() = v6;
      }

      return *__error();
    }

    __uint32_t v7 = 0;
  }

  else
  {
    __uint32_t v7 = v11.st_flags & a3;
  }

  int v8 = 4;
  do
  {
    __uint32_t v9 = v7 | a2;
    v12[0] = v11.st_flags;
    v12[1] = v7 | a2;
    __uint32_t v13 = -1;
    *__error() = 0;
    if (ffsctl(*(_DWORD *)(a1 + 24), 0xC00C4114uLL, v12, 0))
    {
      if (*__error() != 35) {
        goto LABEL_15;
      }
    }

    else
    {
      if (v11.st_flags == v13) {
        return 0LL;
      }
      v11.st_flags = v13;
      __uint32_t v7 = v13 & a3;
    }

    --v8;
  }

  while (v8);
  __uint32_t v9 = v7 | a2;
LABEL_15:
  uint64_t result = fchflags(*(_DWORD *)(a1 + 24), v9);
  if (!(_DWORD)result) {
    return result;
  }
  if (*(_DWORD *)(a1 + 276))
  {
    int v6 = *__error();
    __error();
    syslog(7, "%s:%d:%s() fchflags failed on %s (%d)\n");
    goto LABEL_18;
  }

  return *__error();
}

char *__cdecl xattr_name_with_flags(const char *a1, xattr_flags_t a2)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  __s = 0LL;
  char v17 = 0;
  memset(v16, 0, sizeof(v16));
  char v15 = 35;
  char v3 = 67;
  statfs v4 = &byte_180147538;
  uint64_t v5 = 1LL;
  int v6 = (char *)v16;
  do
  {
    if ((*((_DWORD *)v4 - 1) & a2) != 0)
    {
      char *v6 = v3;
      if (v5 >= 65)
      {
        int v8 = __error();
        uint64_t result = 0LL;
        *int v8 = 63;
        return result;
      }

      ++v5;
    }

    int v7 = *v4;
    v4 += 8;
    char v3 = v7;
    int v6 = &v15 + v5;
  }

  while (v7);
  if (v5 != 1)
  {
    uint64_t v10 = (const char *)nameInDefaultList((char *)a1);
    if (v10 && !strcmp(v10, (const char *)v16))
    {
      stat v11 = strdup(a1);
      __s = v11;
      if (v11)
      {
LABEL_13:
        if (strlen(v11) >= 0x80)
        {
          free(v11);
          __s = 0LL;
          int v12 = __error();
          int v13 = 63;
LABEL_17:
          *int v12 = v13;
          return __s;
        }

        return __s;
      }
    }

    else
    {
      asprintf(&__s, "%s%s", a1, &v15);
      stat v11 = __s;
      if (__s) {
        goto LABEL_13;
      }
    }

LABEL_16:
    int v12 = __error();
    int v13 = 12;
    goto LABEL_17;
  }

  __s = strdup(a1);
  if (!__s) {
    goto LABEL_16;
  }
  return __s;
}

uint64_t nameInDefaultList(char *__s2)
{
  if (nameInDefaultList_onceToken != -1) {
    dispatch_once(&nameInDefaultList_onceToken, &__block_literal_global_0);
  }
  unsigned int v2 = *(const char **)defaultPropertyTable;
  if (!*(void *)defaultPropertyTable) {
    return 0LL;
  }
  for (unsigned int i = (const char **)(defaultPropertyTable + 24); ; i += 3)
  {
    if ((*(_BYTE *)(i - 1) & 1) != 0)
    {
      size_t v4 = strlen(v2);
      if (!strncmp(v2, __s2, v4)) {
        break;
      }
    }

    if (!strcmp(v2, __s2)) {
      break;
    }
    uint64_t v5 = *i;
    unsigned int v2 = v5;
    if (!v5) {
      return 0LL;
    }
  }

  return (uint64_t)*(i - 2);
}

char *__cdecl xattr_name_without_flags(const char *a1)
{
  unsigned int v2 = strrchr(a1, 35);
  if (!v2)
  {
    uint64_t v5 = strdup(a1);
    if (v5) {
      return v5;
    }
LABEL_5:
    uint64_t v5 = 0LL;
    *__error() = 12;
    return v5;
  }

  size_t v3 = v2 - a1 + 1;
  size_t v4 = (char *)calloc(v3, 1uLL);
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = v4;
  strlcpy(v4, a1, v3);
  return v5;
}

int xattr_intent_with_flags(xattr_operation_intent_t a1, xattr_flags_t a2)
{
  int v2 = 1;
  size_t v3 = &dword_189627168;
  while (v2 != a1)
  {
    int v4 = *v3;
    v3 += 4;
    int v2 = v4;
    if (!v4) {
      return (a2 & 4) == 0;
    }
  }

  return (*(uint64_t (**)(void))(*((void *)v3 - 1) + 16LL))();
}

xattr_flags_t xattr_flags_from_name(const char *a1)
{
  int v2 = strrchr(a1, 35);
  if (v2)
  {
    xattr_flags_t result = (xattr_flags_t)(v2 + 1);
  }

  else
  {
    xattr_flags_t result = nameInDefaultList((char *)a1);
    if (!result) {
      return result;
    }
  }

  int v4 = *(unsigned __int8 *)result;
  if (*(_BYTE *)result)
  {
    unsigned int v5 = 0;
    do
    {
      int v6 = 67;
      int v7 = &dword_180147534;
      do
      {
        if (v4 == v6)
        {
          v5 |= *v7;
        }

        else if (v4 == *((unsigned __int8 *)v7 - 3))
        {
          v5 &= ~*v7;
        }

        int v6 = *((unsigned __int8 *)v7 + 4);
        v7 += 2;
      }

      while (v6);
      int v8 = *(unsigned __int8 *)++result;
      int v4 = v8;
    }

    while (v8);
  }

  else
  {
    return 0;
  }

  return v5;
}

int xattr_preserve_for_intent(const char *a1, xattr_operation_intent_t a2)
{
  char v3 = xattr_flags_from_name(a1);
  int v4 = 1;
  unsigned int v5 = &dword_189627168;
  while (v4 != a2)
  {
    int v6 = *v5;
    v5 += 4;
    int v4 = v6;
    if (!v6) {
      return (v3 & 4) == 0LL;
    }
  }

  return (*(uint64_t (**)(void))(*((void *)v5 - 1) + 16LL))();
}

uint64_t __nameInDefaultList_block_invoke()
{
  uint64_t result = _xpc_runtime_is_app_sandboxed();
  uint64_t v1 = defaultUnboxedPropertyTable;
  if ((_DWORD)result) {
    uint64_t v1 = defaultSandboxedPropertyTable;
  }
  defaultPropertyTable = (uint64_t)v1;
  return result;
}

BOOL intentTable_block_invoke(uint64_t a1, char a2)
{
  return (a2 & 0x34) == 0LL;
}

BOOL intentTable_block_invoke_2(uint64_t a1, char a2)
{
  return (a2 & 0x16) == 0LL;
}

BOOL intentTable_block_invoke_3(uint64_t a1, char a2)
{
  return (a2 & 0x35) == 0LL;
}

BOOL intentTable_block_invoke_4(uint64_t a1, char a2)
{
  return (a2 & 0x1C) == 8LL;
}

BOOL intentTable_block_invoke_5(uint64_t a1, char a2)
{
  return (a2 & 4) == 0LL;
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895FEDD8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895FEE38]();
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x189600950]();
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1895FEE98](permset_d, *(void *)&perm);
}

int acl_clear_perms(acl_permset_t permset_d)
{
  return MEMORY[0x1895FEEA0](permset_d);
}

int acl_copy_entry(acl_entry_t dest_d, acl_entry_t src_d)
{
  return MEMORY[0x1895FEEA8](dest_d, src_d);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1895FEEB0](acl_p, entry_p);
}

int acl_create_entry_np(acl_t *acl_p, acl_entry_t *entry_p, int entry_index)
{
  return MEMORY[0x1895FEEB8](acl_p, entry_p, *(void *)&entry_index);
}

int acl_delete_entry(acl_t acl, acl_entry_t entry_d)
{
  return MEMORY[0x1895FEEC0](acl, entry_d);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1895FEEC8](obj_p);
}

acl_t acl_from_text(const char *buf_p)
{
  return (acl_t)MEMORY[0x1895FEED0](buf_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1895FEED8](acl, *(void *)&entry_id, entry_p);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1895FEEE0](flagset_d, *(void *)&flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x1895FEEE8](obj_p, flagset_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1895FEEF0](entry_d, permset_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x1895FEEF8](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1895FEF00](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1895FEF08](*(void *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1895FEF10](*(void *)&fd, acl);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1895FEF18](entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1895FEF20](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1895FEF28](entry_d, *(void *)&tag_type);
}

char *__cdecl acl_to_text(acl_t acl, ssize_t *len_p)
{
  return (char *)MEMORY[0x1895FEF30](acl, len_p);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895FEF50](a1, a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1895FEF90](a1);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FF940](a1, a2);
}

int chmodx_np(const char *a1, filesec_t a2)
{
  return MEMORY[0x1895FEFA8](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FF948](a1, *(void *)&a2, *(void *)&a3);
}

int clonefileat(int a1, const char *a2, int a3, const char *a4, uint32_t a5)
{
  return MEMORY[0x1895FF958](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

int close(int a1)
{
  return MEMORY[0x1895FF960](*(void *)&a1);
}

char *__cdecl dirname_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FEFE0](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1895FF9B8](*(void *)&a1, *(void *)&a2);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FF9C0](*(void *)&a1, a2);
}

int fchmodx_np(int a1, filesec_t a2)
{
  return MEMORY[0x1895FEFF8](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FF9D0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FF9D8](*(void *)&a1, *(void *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FF9E8](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FF9F8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

filesec_t filesec_dup(filesec_t a1)
{
  return (filesec_t)MEMORY[0x1895FF040](a1);
}

void filesec_free(filesec_t a1)
{
}

int filesec_get_property(filesec_t a1, filesec_property_t a2, void *a3)
{
  return MEMORY[0x1895FF050](a1, *(void *)&a2, a3);
}

filesec_t filesec_init(void)
{
  return (filesec_t)MEMORY[0x1895FF058]();
}

int filesec_set_property(filesec_t a1, filesec_property_t a2, const void *a3)
{
  return MEMORY[0x1895FF060](a1, *(void *)&a2, a3);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FFA10](*(void *)&fd, namebuff, size, *(void *)&options);
}

uint64_t fpathconf(int a1, int a2)
{
  return MEMORY[0x1895FFA20](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1895FFA28](*(void *)&fd, name, *(void *)&options);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FFA38](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FFA40](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FFA50](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FFA60](*(void *)&a1, a2);
}

int fstatx_np(int a1, stat *a2, filesec_t a3)
{
  return MEMORY[0x1895FF0A0](*(void *)&a1, a2, a3);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FFA78](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1895FF0B8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1895FF0C0](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1895FF0C8](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1895FF0D0](a1, a2, *(void *)&a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FFA80](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FFAA8]();
}

uid_t getuid(void)
{
  return MEMORY[0x1895FFB10]();
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FFBE8](path, namebuff, size, *(void *)&options);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FFBF0](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FFBF8](a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1895FF670](*(void *)&uid, uu);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FF160](__s, *(void *)&__c, __n);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FFE20](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FFE58](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FFE68](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FFEF8](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FFF38](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FFF48](*(void *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FFF58](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600320](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600330](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FF220](a1, a2);
}

int remove(const char *a1)
{
  return MEMORY[0x1895FF248](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x189600040](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x189600048](a1, a2);
}

int statx_np(const char *a1, stat *a2, filesec_t a3)
{
  return MEMORY[0x1895FF2C0](a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FF300](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FF328](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FF338](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FF340](__s1, __s2, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF370](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3A0](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x189600058](a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x1896000E8](a1);
}