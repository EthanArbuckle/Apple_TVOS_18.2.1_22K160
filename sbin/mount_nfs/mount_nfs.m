uint64_t sub_100003B28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  if (*(_DWORD *)(a1 + 48) != 1) {
    return 0LL;
  }
  v2 = *(void *)(a1 + 8);
  v3 = *(void *)(a1 + 40);
  v4 = v3 + v2;
  if (__CFADD__(v3, v2)) {
    return 12LL;
  }
  v5 = (char *)realloc(*(void **)a1, v3 + v2);
  if (!v5) {
    return 12LL;
  }
  v6 = v5;
  result = 0LL;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v4;
  v8 = *(void *)(a1 + 40);
  *(void *)(a1 + 24) = &v6[v2];
  *(void *)(a1 + 32) = v8;
  return result;
}

uint64_t sub_100003BA0(uint64_t a1, char *__src, unint64_t a3, int a4)
{
  if (a4) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = (a3 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  }
  if (!v4) {
    return 0LL;
  }
  size_t v5 = a3;
  size_t v8 = *(void *)(a1 + 32);
  while (1)
  {
    if (!v8)
    {
      uint64_t result = sub_100003B28(a1);
      if ((_DWORD)result) {
        return result;
      }
      size_t v8 = *(void *)(a1 + 32);
      if (!v8) {
        break;
      }
    }

    if (v8 >= v4) {
      size_t v10 = v4;
    }
    else {
      size_t v10 = v8;
    }
    if (v5)
    {
      if (v10 >= v5) {
        size_t v10 = v5;
      }
      memmove(*(void **)(a1 + 24), __src, v10);
      size_t v8 = *(void *)(a1 + 32) - v10;
      *(void *)(a1 + 24) += v10;
      *(void *)(a1 + 32) = v8;
      __src += v10;
      v5 -= v10;
    }

    else
    {
      bzero(*(void **)(a1 + 24), v10);
      size_t v8 = *(void *)(a1 + 32) - v10;
      *(void *)(a1 + 24) += v10;
      *(void *)(a1 + 32) = v8;
    }

    v4 -= v10;
    if (!v4) {
      return 0LL;
    }
  }

  return 12LL;
}

void sub_100003C74(int a1, char *a2, ...)
{
  if ((dword_100010928 & 0x400000) != 0) {
    vsyslog(3, a2, va);
  }
  verrx(a1, a2, va);
}

void *sub_100003CC4()
{
  v0 = (char *)malloc(0x330uLL);
  qword_100010908 = (uint64_t)v0;
  if (!v0) {
    sub_100003C74(12, "memory allocation failed");
  }
  v1 = v0;
  uint64_t result = memcpy(v0, &off_1000105C8, 0x330uLL);
  uint64_t v3 = &dword_100000008;
  do
  {
    *(_DWORD *)&v1[v3] = *(_DWORD *)((char *)&off_1000105C8 + v3) == 0;
    v3 += 24LL;
  }

  while (v3 != 824);
  return result;
}

void sub_100003D38(int a1, char *const *a2)
{
  v75[0] = 0;
  bzero(v74, 0x400uLL);
  v72 = 0LL;
  __endptr = 0LL;
  uint64_t v71 = 0LL;
  *(_OWORD *)dword_100010928 = 0u;
  *(_OWORD *)((char *)&qword_100010934 + 4) = 0u;
  *(__int128 *)((char *)&xmmword_10001093C + 12) = 0u;
  *(_OWORD *)&dword_100010958 = 0u;
  xmmword_100010968 = 0u;
  *(_OWORD *)&dword_100010978 = 0u;
  xmmword_100010988 = 0u;
  *(_OWORD *)&dword_100010998 = 0u;
  xmmword_1000109A8 = 0u;
  *(_OWORD *)&dword_1000109B8 = 0u;
  *(_OWORD *)((char *)&qword_1000109C4 + 4) = 0u;
  unk_1000109D8 = 0u;
  unk_1000109E8 = 0u;
  *(_OWORD *)((char *)&qword_1000109F4 + 4) = 0u;
  xmmword_100010A08 = 0u;
  *(_OWORD *)&dword_100010A18 = 0u;
  xmmword_100010A28 = 0u;
  *(_OWORD *)&dword_100010A38 = 0u;
  xmmword_100010A48 = 0u;
  unk_100010A58 = 0u;
  xmmword_100010A68 = 0u;
  unk_100010A78 = 0u;
  xmmword_100010A88 = 0u;
  unk_100010A98 = 0u;
  xmmword_100010AA8 = 0u;
  unk_100010AB8 = 0u;
  xmmword_100010AC8 = 0u;
  xmmword_100010AD8 = 0u;
  qword_100010AE8 = 0LL;
  sub_100003CC4();
  sub_1000049E8("/etc/nfs.conf", (uint64_t)&dword_100010000);
  while (1)
  {
    while (1)
    {
      while (1)
      {
        int v4 = getopt(a1, a2, "234a:bcdF:g:I:iLlmo:Pp:R:r:sTt:Uvw:x:z");
        if (v4 <= 51) {
          break;
        }
        switch(v4)
        {
          case 'F':
            int v5 = open(optarg, 0);
            if (v5 < 0)
            {
              int v49 = *__error();
              v50 = __error();
              strerror(*v50);
              sub_100003C74(v49, "could not open file containing file system specification: %s: %s");
            }

            int v6 = v5;
            v7 = malloc(0x400uLL);
            qword_100010910 = (uint64_t)v7;
            if (!v7) {
              sub_100003C74(12, "memory allocation failed");
            }
            ssize_t v8 = read(v6, v7, 0x3FFuLL);
            if (v8 < 0)
            {
              int v51 = *__error();
              v52 = __error();
              strerror(*v52);
              sub_100003C74(v51, "could not read file containing file system specification: %s: %s");
            }

            ssize_t v9 = v8;
            size_t v10 = (_BYTE *)(qword_100010910 + v8);
            ssize_t v11 = v8 - 1;
            do
            {
              *size_t v10 = 0;
              uint64_t v12 = qword_100010910;
              __darwin_ct_rune_t v13 = *(char *)(qword_100010910 + v11);
              if (v13 < 0) {
                __uint32_t v14 = __maskrune(v13, 0x4000uLL);
              }
              else {
                __uint32_t v14 = _DefaultRuneLocale.__runetype[v13] & 0x4000;
              }
              --v9;
              size_t v10 = (_BYTE *)(v12 + v9);
              --v11;
            }

            while (v14);
            close(v6);
            continue;
          case 'G':
          case 'H':
          case 'J':
          case 'K':
          case 'M':
          case 'N':
          case 'O':
          case 'Q':
          case 'S':
          case 'V':
          case 'W':
          case 'X':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '^':
          case '_':
          case 'e':
          case 'f':
          case 'h':
          case 'j':
          case 'k':
          case 'n':
          case 'q':
          case 'u':
          case 'y':
            goto LABEL_114;
          case 'I':
            uint64_t v25 = strtoll(optarg, &__endptr, 10);
            uint64_t v26 = 0xFFFFFFFFLL;
            if (v25 < 0xFFFFFFFFLL) {
              uint64_t v26 = v25;
            }
            unsigned int v27 = v26 & ~(v26 >> 63);
            if (*__endptr) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v27 == 0;
            }
            if (v28 || v27 > 0x100000)
            {
              warnx("illegal -I value -- %s", optarg);
            }

            else
            {
              LODWORD(qword_10001092C) = qword_10001092C | 0x20;
              dword_100010954 = v27;
            }

            continue;
          case 'L':
            LODWORD(qword_10001092C) = qword_10001092C | 0x800;
            dword_1000109C0 = 1;
            continue;
          case 'P':
            qword_100010934 |= 0x400000004uLL;
            continue;
          case 'R':
            uint64_t v29 = strtoll(optarg, &__endptr, 10);
            if (*__endptr)
            {
              warnx("illegal -R value -- %s", optarg);
            }

            else
            {
              uint64_t v30 = 0xFFFFFFFFLL;
              if (v29 < 0xFFFFFFFFLL) {
                uint64_t v30 = v29;
              }
              dword_1000108F8 = v30 & ~(v30 >> 63);
            }

            continue;
          case 'T':
            LODWORD(qword_1000109F4) = 1;
            continue;
          case 'U':
            qword_100010934 |= 0x1000000010000uLL;
            continue;
          case 'a':
            uint64_t v23 = strtoll(optarg, &__endptr, 10);
            if (*__endptr)
            {
              warnx("illegal -a value -- %s", optarg);
            }

            else
            {
              uint64_t v24 = 0xFFFFFFFFLL;
              if (v23 < 0xFFFFFFFFLL) {
                uint64_t v24 = v23;
              }
              LODWORD(qword_10001092C) = qword_10001092C | 0x40;
              dword_100010958 = v24 & ~(v24 >> 63);
            }

            continue;
          case 'b':
            dword_10001091C |= 1u;
            continue;
          case 'c':
            qword_100010934 |= 0x800000008uLL;
            continue;
          case 'd':
            qword_100010934 |= 0x1000000010uLL;
            continue;
          case 'g':
            uint64_t v16 = strtoll(optarg, &__endptr, 10);
            if (*__endptr)
            {
              warnx("illegal maxgroups value -- %s", optarg);
            }

            else
            {
              uint64_t v17 = 0xFFFFFFFFLL;
              if (v16 < 0xFFFFFFFFLL) {
                uint64_t v17 = v16;
              }
              LODWORD(qword_10001092C) = qword_10001092C | 0x2000;
              unk_1000109F0 = v17 & ~(v17 >> 63);
            }

            continue;
          case 'i':
            qword_100010934 |= 0x200000002uLL;
            continue;
          case 'l':
            qword_100010934 |= 0x4000000040uLL;
            continue;
          case 'm':
            LODWORD(v15) = qword_100010934 | 0x40;
            HIDWORD(v15) = HIDWORD(qword_100010934) & 0xFFFFFFBF;
            qword_100010934 = v15;
            continue;
          case 'o':
            sub_100004F50(optarg);
            continue;
          case 'p':
            *(void *)&xmmword_100010AC8 = strdup(optarg);
            if (!(void)xmmword_100010AC8)
            {
              strerror(1);
              sub_100003C74(1, "could not set principal: %s");
            }

            LODWORD(qword_10001092C) = qword_10001092C | 0x2000000;
            continue;
          case 'r':
            uint64_t v18 = strtoll(optarg, &__endptr, 10);
            uint64_t v19 = 0xFFFFFFFFLL;
            if (v18 < 0xFFFFFFFFLL) {
              uint64_t v19 = v18;
            }
            int v20 = v19 & ~(v19 >> 63);
            int v21 = *__endptr;
            if ((v21 | 0x20) == 0x6B)
            {
              v20 <<= 10;
              int v21 = *++__endptr;
            }

            if (v21) {
              BOOL v22 = 1;
            }
            else {
              BOOL v22 = v20 == 0;
            }
            if (v22)
            {
              warnx("illegal -r value -- %s", optarg);
            }

            else
            {
              LODWORD(qword_10001092C) = qword_10001092C | 8;
              dword_10001094C = v20;
            }

            continue;
          case 's':
            qword_100010934 |= 0x100000001uLL;
            continue;
          case 't':
            uint64_t v36 = strtoll(optarg, &__endptr, 10);
            if (*__endptr)
            {
              warnx("illegal -t value -- %s", optarg);
            }

            else
            {
              uint64_t v37 = 0xFFFFFFFFLL;
              if (v36 < 0xFFFFFFFFLL) {
                uint64_t v37 = v36;
              }
              unsigned int v38 = v37 & ~(v37 >> 63);
              LODWORD(qword_10001092C) = qword_10001092C | 0x20000;
              *(void *)&xmmword_100010A08 = v38 / 0xAuLL;
              *((void *)&xmmword_100010A08 + 1) = 100000000 * (v38 % 0xA);
            }

            continue;
          case 'v':
            ++dword_100010920;
            continue;
          case 'w':
            uint64_t v31 = strtoll(optarg, &__endptr, 10);
            uint64_t v32 = 0xFFFFFFFFLL;
            if (v31 < 0xFFFFFFFFLL) {
              uint64_t v32 = v31;
            }
            int v33 = v32 & ~(v32 >> 63);
            int v34 = *__endptr;
            if ((v34 | 0x20) == 0x6B)
            {
              v33 <<= 10;
              int v34 = *++__endptr;
            }

            if (v34) {
              BOOL v35 = 1;
            }
            else {
              BOOL v35 = v33 == 0;
            }
            if (v35)
            {
              warnx("illegal -w value -- %s", optarg);
            }

            else
            {
              LODWORD(qword_10001092C) = qword_10001092C | 0x10;
              dword_100010950 = v33;
            }

            continue;
          case 'x':
            uint64_t v39 = strtoll(optarg, &__endptr, 10);
            uint64_t v40 = 0xFFFFFFFFLL;
            if (v39 < 0xFFFFFFFFLL) {
              uint64_t v40 = v39;
            }
            int v41 = v40 & ~(v40 >> 63);
            if (*__endptr) {
              BOOL v42 = 1;
            }
            else {
              BOOL v42 = v41 == 0;
            }
            if (v42)
            {
              warnx("illegal -x value -- %s", optarg);
            }

            else
            {
              LODWORD(qword_10001092C) = qword_10001092C | 0x40000;
              dword_100010A18 = v41;
            }

            continue;
          case 'z':
            dword_100010924 = 1;
            continue;
          default:
            if (v4 != 52) {
              goto LABEL_114;
            }
            LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
            xmmword_10001093C = xmmword_10000A540;
            break;
        }
      }

      if (v4 != 50) {
        break;
      }
      LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
      xmmword_10001093C = xmmword_10000A520;
    }

    if (v4 != 51) {
      break;
    }
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
    xmmword_10001093C = xmmword_10000A530;
  }

  if (v4 == -1)
  {
    uint64_t v43 = optind;
    sub_1000068FC();
    if ((qword_100010934 & 1) != 0 && (qword_100010934 & 0x100000000LL) != 0 && (dword_100010928[0] & 1) != 0)
    {
      int v44 = qword_10001092C;
      if ((qword_10001092C & 0x800) == 0)
      {
        int v44 = qword_10001092C | 0x800;
        LODWORD(qword_10001092C) = qword_10001092C | 0x800;
        dword_1000109C0 = 2;
      }

      if ((v44 & 0x80000) == 0)
      {
        LODWORD(qword_10001092C) = v44 | 0x80000;
        xmmword_100010A28 = xmmword_10000A550;
      }
    }

    int v45 = a1 - v43;
    v46 = (const char **)&a2[v43];
    if (qword_1000109F4) {
      LODWORD(qword_10001092C) = qword_10001092C | 0x4000;
    }
    if (v45 == 1 && !strcmp(*v46, "configupdate"))
    {
      if (geteuid()) {
        sub_100003C74(1, "Must be superuser to configupdate");
      }
      uint64_t v47 = sub_1000069AC();
      nullsub_1(v47);
      goto LABEL_136;
    }

    if (!qword_100010910 && v45 >= 1)
    {
      v48 = *v46++;
      qword_100010910 = (uint64_t)v48;
      --v45;
    }

    if (v45 == 1)
    {
      if ((dword_100010928[0] & 0x8000000) != 0)
      {
        if ((unint64_t)__strlcpy_chk(v74, *v46, 1024LL, 1024LL) >= 0x400)
        {
          strerror(22);
          sub_100003C74(1, "%s: %s");
        }
      }

      else if (!realpath_DARWIN_EXTSN(*v46, v74))
      {
        if (!*__error()) {
          sub_100003C74(1, "realpath %s");
        }
        int v56 = *__error();
        v57 = __error();
        strerror(*v57);
        sub_100003C74(v56, "realpath %s: %s");
      }

      uint64_t v53 = sub_100006E58((const char *)qword_100010910, &v71);
      if ((_DWORD)v53 || (uint64_t v54 = v71) == 0)
      {
        if (!(_DWORD)v53) {
          LODWORD(v53) = 22;
        }
        sub_100003C74(v53, "could not parse file system specification");
      }

      if (dword_1000108F8 < 0)
      {
        if ((dword_10001091C & 1) != 0) {
          int v55 = 10000;
        }
        else {
          int v55 = 1;
        }
        dword_1000108F8 = v55;
      }

      else if (!dword_1000108F8)
      {
        qword_100010934 |= 0x2000000020000uLL;
      }

      nullsub_1(v53);
      if ((dword_1000108F8 & 0x80000000) == 0)
      {
        int v58 = 0;
        int v59 = 0;
        v60 = &dword_100010000;
        while (1)
        {
          if ((v59 + 1) >= 2)
          {
            if ((dword_10001091C & 1) != 0)
            {
              puts("Retrying NFS mount in background...");
              dword_10001091C &= ~1u;
              if (daemon(0, 0))
              {
                int v67 = *__error();
                v68 = __error();
                strerror(*v68);
                sub_100003C74(v67, "mount nfs background: fork failed: %s");
              }

              dword_10001091C |= 2u;
            }

            if (v58 >= 30) {
              unsigned int v61 = 30;
            }
            else {
              unsigned int v61 = v58;
            }
            if (dword_100010920) {
              printf("Retrying NFS mount in %d seconds...\n", v61);
            }
            sleep(v61);
          }

          sub_10000727C(v54, v75);
          if (v75[0])
          {
            if (dword_100010920) {
              sub_1000072E4((uint64_t **)v54, v74);
            }
            if (((qword_10001092C & 0x40) == 0 || dword_100010958)
              && dword_100010950 > dword_10001094C
              && (double)dword_100010958
               / ((double)dword_100010950
                / (double)dword_10001094C) < 0.25)
            {
              warnx("wsize/rsize ratio is high: this could end up with unexpected readahead RPCs");
            }

            int v62 = sub_100008214(v54, &v72);
            if (v62)
            {
              int v66 = v62;
              strerror(v62);
              sub_100003C74(v66, "error assembling mount args: %s");
            }

            v63 = v72;
            if (dword_100010920 >= 3) {
              printf("Calling mount(nfs, %8.8x, %p)\n", dword_100010928[0], v72);
            }
            if (!mount("nfs", v74, dword_100010928[0], v63)) {
              break;
            }
            int v64 = *__error();
            uint64_t v65 = (v64 - 32);
            if (((1LL << (v64 - 32)) & 0x3367E0009LL) == 0)
            {
              if (v65 != 42)
              {
LABEL_173:
                strerror(v64);
                sub_100003C74(v64, "can't mount %s from %s onto %s: %s");
              }

              if (((qword_10001092C & 2) == 0 || xmmword_10001093C <= 3)
                && sub_100009544(*(void *)(*(void *)(*(void *)(v54 + 8) + 16LL) + 32LL)) == 15)
              {
                v69 = *(const char **)(*(void *)(v54 + 8) + 8LL);
                v70 = strerror(74);
                sub_100003C74( 74,  "can't mount with remote locks when server (%s) is not running rpc.statd: %s",  v69,  v70);
              }
            }

            sub_1000095EC((void *)v54);
            if (v63)
            {
              free(v63);
              v72 = 0LL;
            }

            v60 = &dword_100010000;
          }

          else
          {
            warnx("no usable addresses for host: %s", *(const char **)(*(void *)(v54 + 8) + 8LL));
            int v64 = 2;
          }

          ++v59;
          v58 += 5;
          if (v59 > v60[574]) {
            goto LABEL_173;
          }
        }
      }

LABEL_136:
      exit(0);
    }
  }

LABEL_114:
  fwrite("usage: mount_nfs [-o options] server:/path directory\n", 0x35uLL, 1uLL, __stderrp);
  exit(22);
}

uint64_t sub_1000049E8(const char *a1, uint64_t a2)
{
  size_t v24 = 0LL;
  size_t v25 = 0LL;
  uint64_t v3 = fopen(a1, "r");
  if (v3)
  {
    int v4 = v3;
    int v5 = fparseln(v3, &v25, &v24, 0LL, 0);
    if (v5)
    {
      int v6 = v5;
      do
      {
        if (v25)
        {
          for (i = &v6[v25 - 1]; i > v6; --i)
          {
            __darwin_ct_rune_t v8 = *i;
            if (v8 < 0)
            {
              if (!__maskrune(v8, 0x4000uLL)) {
                break;
              }
            }

            else if ((_DefaultRuneLocale.__runetype[v8] & 0x4000) == 0)
            {
              break;
            }

            char *i = 0;
          }

          ssize_t v9 = v6 - 1;
          do
          {
            __darwin_ct_rune_t v10 = v9[1];
            if (v10 < 0) {
              __uint32_t v11 = __maskrune(v10, 0x4000uLL);
            }
            else {
              __uint32_t v11 = _DefaultRuneLocale.__runetype[v10] & 0x4000;
            }
            ++v9;
          }

          while (v11);
          uint64_t v12 = strchr(v6, 61);
          __darwin_ct_rune_t v13 = v12;
          if (v12)
          {
            __uint32_t v14 = v12 - 1;
            do
            {
              v14[1] = 0;
              if (v14 <= v6) {
                break;
              }
              __darwin_ct_rune_t v15 = *v14;
              __uint32_t v16 = v15 < 0 ? __maskrune(v15, 0x4000uLL) : _DefaultRuneLocale.__runetype[v15] & 0x4000;
              --v14;
            }

            while (v16);
            uint64_t v17 = v13;
            do
            {
              while (1)
              {
                __darwin_ct_rune_t v19 = *++v17;
                __darwin_ct_rune_t v18 = v19;
                if (v19 < 0) {
                  break;
                }
                if ((_DefaultRuneLocale.__runetype[v18] & 0x4000) == 0) {
                  goto LABEL_29;
                }
              }
            }

            while (__maskrune(v18, 0x4000uLL));
LABEL_29:
            if (!strncmp(v9, "nfs.client.", 0xBuLL))
            {
              uint64_t v21 = strtol(v17, 0LL, 0);
              int v20 = v17;
LABEL_36:
              if (dword_100010920) {
                printf("%4ld %s=%s (%ld)\n", v24, v9, v17, v21);
              }
              if (!strcmp(v9, "nfs.client.access_cache_timeout"))
              {
                if (v13 && v21) {
                  *(_DWORD *)a2 = v21;
                }
              }

              else if (!strcmp(v9, "nfs.client.access_for_getattr"))
              {
                *(_DWORD *)(a2 + 4) = v21;
              }

              else if (!strcmp(v9, "nfs.client.allow_async"))
              {
                *(_DWORD *)(a2 + 8) = v21;
              }

              else if (!strcmp(v9, "nfs.client.callback_port"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 12) = v21;
                }
              }

              else if (!strcmp(v9, "nfs.client.initialdowndelay"))
              {
                *(_DWORD *)(a2 + 16) = v21;
              }

              else if (!strcmp(v9, "nfs.client.iosize"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 20) = v21;
                }
              }

              else if (!strcmp(v9, "nfs.client.mount.options"))
              {
                sub_100004F50(v20);
              }

              else if (!strcmp(v9, "nfs.client.nextdowndelay"))
              {
                *(_DWORD *)(a2 + 24) = v21;
              }

              else if (!strcmp(v9, "nfs.client.nfsiod_thread_max"))
              {
                if (v13) {
                  *(_DWORD *)(a2 + 28) = v21;
                }
              }

              else if (!strcmp(v9, "nfs.client.statfs_rate_limit"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 32) = v21;
                }
              }

              else if (!strcmp(v9, "nfs.client.is_mobile"))
              {
                *(_DWORD *)(a2 + 36) = v21;
              }

              else if (!strcmp(v9, "nfs.client.squishy_flags"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 40) = v21;
                }
              }

              else if (!strcmp(v9, "nfs.client.root_steals_gss_context"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 44) = v21;
                }
              }

              else if (!strcmp(v9, "nfs.client.default_nfs4domain"))
              {
                if (v13) {
                  *(void *)(a2 + 56) = strndup(v20, 0x400uLL);
                }
              }

              else if (!strcmp(v9, "nfs.client.mount_timeout"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 48) = v21;
                }
              }

              else if (!strcmp(v9, "nfs.client.mount_quick_timeout"))
              {
                if (v13 && v21) {
                  *(_DWORD *)(a2 + 52) = v21;
                }
              }

              else if (dword_100010920)
              {
                printf("ignoring unknown config value: %4ld %s=%s\n");
              }

              goto LABEL_90;
            }
          }

          else
          {
            int v20 = 0LL;
            if (!strncmp(v9, "nfs.client.", 0xBuLL))
            {
              uint64_t v17 = (const char *)&unk_10000B33F;
              uint64_t v21 = 1LL;
              goto LABEL_36;
            }
          }

          if (dword_100010920 >= 2) {
            printf("%4ld %s=%s\n");
          }
        }

LABEL_90:
        free(v6);
        int v6 = fparseln(v4, &v25, &v24, 0LL, 0);
      }

      while (v6);
    }

    fclose(v4);
    return 0LL;
  }

  else
  {
    if (*__error() != 2) {
      warn("%s", a1);
    }
    return 1LL;
  }
}

uint64_t sub_100004EE8(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)&xmmword_10001093C = 0LL;
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 0x8000000;
    DWORD2(xmmword_10001093C) = a2;
    HIDWORD(xmmword_10001093C) = result;
  }

  else
  {
    int v2 = qword_10001092C & 0xF7FFFFFB;
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
    xmmword_10001093C = WORD1(result);
    if ((_WORD)result)
    {
      LODWORD(qword_10001092C) = v2 | 6;
      DWORD1(xmmword_10001093C) = (unsigned __int16)result;
    }
  }

  return result;
}

void sub_100004F50(const char *a1)
{
  __endptr = 0LL;
  int v118 = 0;
  getmnt_silent = 1;
  int v119 = 0;
  uint64_t v2 = getmntopts(a1, &off_100010040, dword_100010928, &v119);
  if (!v2) {
    goto LABEL_382;
  }
  uint64_t v3 = v2;
  int v4 = &dword_100010000;
  if (dword_100010928[0]) {
    LODWORD(qword_10001092C) = qword_10001092C | 0x400000;
  }
  if ((v119 & 1) != 0)
  {
    uint64_t v5 = getmntoptstr(v2, "actimeo");
    if (v5)
    {
      int v6 = (const char *)v5;
      uint64_t v7 = getmntoptnum(v3, "actimeo");
      if (v7 < 0)
      {
        warnx("illegal actimeo value -- %s", v6);
      }

      else
      {
        qword_10001092C = (uint64_t)vorr_s8((int8x8_t)qword_10001092C, (int8x8_t)0x600000780LL);
        *(void *)&dword_100010960 = v7;
        *((void *)&xmmword_100010968 + 1) = v7;
        *(void *)&dword_100010980 = v7;
        *((void *)&xmmword_100010988 + 1) = v7;
        qword_1000109A0 = v7;
        *((void *)&xmmword_1000109A8 + 1) = v7;
        *(void *)&xmmword_100010968 = 0LL;
        *(void *)&dword_100010978 = 0LL;
        *(void *)&xmmword_100010988 = 0LL;
        *(void *)&dword_100010998 = 0LL;
        *(void *)&xmmword_1000109A8 = 0LL;
        *(void *)&dword_1000109B8 = 0LL;
      }
    }

    uint64_t v8 = getmntoptstr(v3, "acregmin");
    if (v8)
    {
      ssize_t v9 = (const char *)v8;
      uint64_t v10 = getmntoptnum(v3, "acregmin");
      if (v10 < 0)
      {
        warnx("illegal acregmin value -- %s", v9);
      }

      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x80;
        *(void *)&dword_100010960 = v10;
        *(void *)&xmmword_100010968 = 0LL;
      }
    }

    uint64_t v11 = getmntoptstr(v3, "acregmax");
    if (v11)
    {
      uint64_t v12 = (const char *)v11;
      uint64_t v13 = getmntoptnum(v3, "acregmax");
      if (v13 < 0)
      {
        warnx("illegal acregmax value -- %s", v12);
      }

      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x100;
        *((void *)&xmmword_100010968 + 1) = v13;
        *(void *)&dword_100010978 = 0LL;
      }
    }

    uint64_t v14 = getmntoptstr(v3, "acdirmin");
    if (v14)
    {
      __darwin_ct_rune_t v15 = (const char *)v14;
      uint64_t v16 = getmntoptnum(v3, "acdirmin");
      if (v16 < 0)
      {
        warnx("illegal acdirmin value -- %s", v15);
      }

      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x200;
        *(void *)&dword_100010980 = v16;
        *(void *)&xmmword_100010988 = 0LL;
      }
    }

    uint64_t v17 = getmntoptstr(v3, "acdirmax");
    if (v17)
    {
      __darwin_ct_rune_t v18 = (const char *)v17;
      uint64_t v19 = getmntoptnum(v3, "acdirmax");
      if (v19 < 0)
      {
        warnx("illegal acdirmax value -- %s", v18);
      }

      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x400;
        *((void *)&xmmword_100010988 + 1) = v19;
        *(void *)&dword_100010998 = 0LL;
      }
    }

    uint64_t v20 = getmntoptstr(v3, "acrootdirmin");
    if (v20)
    {
      uint64_t v21 = (const char *)v20;
      uint64_t v22 = getmntoptnum(v3, "acrootdirmin");
      if (v22 < 0)
      {
        warnx("illegal acrootdirmin value -- %s", v21);
      }

      else
      {
        HIDWORD(qword_10001092C) |= 2u;
        qword_1000109A0 = v22;
        *(void *)&xmmword_1000109A8 = 0LL;
      }
    }

    uint64_t v23 = getmntoptstr(v3, "acrootdirmax");
    if (v23)
    {
      size_t v24 = (const char *)v23;
      uint64_t v25 = getmntoptnum(v3, "acrootdirmax");
      if (v25 < 0)
      {
        warnx("illegal acrootdirmax value -- %s", v24);
      }

      else
      {
        HIDWORD(qword_10001092C) |= 4u;
        *((void *)&xmmword_1000109A8 + 1) = v25;
        *(void *)&dword_1000109B8 = 0LL;
      }
    }
  }

  if ((v119 & 0x20000) != 0)
  {
    uint64_t v26 = (const char *)getmntoptstr(v3, "deadtimeout");
    if (v26)
    {
      unsigned int v27 = v26;
      uint64_t v28 = strtol(v26, &__endptr, 10);
      if (v28 < 0)
      {
        warnx("illegal deadtimeout value -- %s", v27);
      }

      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x80000;
        xmmword_100010A28 = (unint64_t)v28;
      }
    }
  }

  if ((v119 & 2) != 0)
  {
    uint64_t v29 = (const char *)getmntoptstr(v3, "dsize");
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = strtol(v29, &__endptr, 10);
      uint64_t v32 = __endptr;
      if ((*__endptr | 0x20) == 0x6B)
      {
        v31 <<= 10;
        uint64_t v32 = ++__endptr;
      }

      if (v31 < 1 || *v32)
      {
        warnx("illegal dsize value -- %s", v30);
      }

      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x20;
        dword_100010954 = v31;
      }
    }
  }

  if ((v119 & 4) != 0)
  {
    uint64_t v33 = getmntoptnum(v3, "maxgroups");
    if ((unint64_t)(v33 - 17) <= 0xFFFFFFFFFFFFFFEFLL)
    {
      sub_10000A130(v3);
    }

    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x2000;
      unk_1000109F0 = v33;
    }
  }

  if ((v119 & 8) != 0)
  {
    int v34 = (const char *)getmntoptstr(v3, "mountport");
    if (v34)
    {
      BOOL v35 = v34;
      unint64_t v36 = strtol(v34, &__endptr, 10);
      if (*__endptr)
      {
        if (*v35 == 47)
        {
          LODWORD(qword_10001092C) = qword_10001092C | 0x40000000;
          *((void *)&xmmword_100010AD8 + 1) = strdup(v35);
          HIDWORD(qword_1000109F4) = 1;
        }

        else
        {
          warnx("unsupported mount port -- %s");
        }
      }

      else if (v36 >= 0x10000)
      {
        warnx("illegal mountport number -- %s");
      }

      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x10000;
        dword_100010A00 = v36;
      }
    }

    else
    {
      warnx("option mountport needs a value", v116);
    }
  }

  if ((v119 & 0x10) != 0)
  {
    uint64_t v37 = (const char *)getmntoptstr(v3, "port");
    if (v37)
    {
      unsigned int v38 = v37;
      unint64_t v39 = strtol(v37, &__endptr, 10);
      if (*__endptr)
      {
        if (*v38 == 47)
        {
          LODWORD(qword_10001092C) = qword_10001092C | 0x20000000;
          *(void *)&xmmword_100010AD8 = strdup(v38);
          HIDWORD(qword_1000109F4) = 1;
        }

        else
        {
          warnx("unsupported port -- %s");
        }
      }

      else if (v39 >= 0x10000)
      {
        warnx("illegal port number -- %s");
      }

      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 0x8000;
        dword_1000109FC = v39;
      }
    }

    else
    {
      warnx("option port needs a value", v116);
    }
  }

  if ((v119 & 0x800020) == 0) {
    goto LABEL_87;
  }
  uint64_t v40 = (const char *)getmntoptstr(v3, "netid");
  if (!v40)
  {
    uint64_t v40 = (const char *)getmntoptstr(v3, "proto");
    if (!v40) {
      goto LABEL_87;
    }
  }

  if (!strncasecmp(v40, "tcp", 4uLL) || !strncasecmp(v40, "tcp4", 5uLL))
  {
    if (xmmword_100010AD8 == 0)
    {
      uint64_t v41 = 0x200000001LL;
      goto LABEL_86;
    }

    goto LABEL_377;
  }

  if (!strncasecmp(v40, "udp", 4uLL) || !strncasecmp(v40, "udp4", 5uLL))
  {
    if (xmmword_100010AD8 == 0)
    {
      uint64_t v41 = 0x200000002LL;
      goto LABEL_86;
    }

    goto LABEL_377;
  }

  if (!strncasecmp(v40, "tcp6", 5uLL))
  {
    if (xmmword_100010AD8 == 0)
    {
      uint64_t v41 = 0x1E00000001LL;
      goto LABEL_86;
    }

    goto LABEL_377;
  }

  if (!strncasecmp(v40, "udp6", 5uLL))
  {
    if (xmmword_100010AD8 == 0)
    {
      uint64_t v41 = 0x1E00000002LL;
      goto LABEL_86;
    }

LABEL_377:
    warnx("netid must be ticotsord or ticlts when specifing local socket ports");
    goto LABEL_87;
  }

  if (!strncasecmp(v40, "ticotsord", 0xAuLL))
  {
    uint64_t v41 = 0x100000001LL;
    goto LABEL_86;
  }

  if (!strncasecmp(v40, "ticlts", 7uLL))
  {
    uint64_t v41 = 0x100000002LL;
LABEL_86:
    qword_1000109F4 = v41;
    goto LABEL_87;
  }

  warnx("unknown protocol -- %s");
LABEL_87:
  if ((v119 & 0x40) != 0)
  {
    unint64_t v42 = getmntoptnum(v3, "readahead");
    if (v42 >= 0x81)
    {
      sub_10000A100(v3);
    }

    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x40;
      dword_100010958 = v42;
    }
  }

  if ((v119 & 0x80) != 0)
  {
    uint64_t v43 = getmntoptnum(v3, "retrans");
    if ((unint64_t)(v43 - 0x80000000LL) <= 0xFFFFFFFF80000000LL)
    {
      sub_10000A0D0(v3);
    }

    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x40000;
      dword_100010A18 = v43;
    }
  }

  if ((v119 & 0x100) != 0)
  {
    unint64_t v44 = getmntoptnum(v3, "retrycnt");
    if (v44 >> 31) {
      sub_10000A0A0(v3);
    }
    else {
      dword_1000108F8 = v44;
    }
  }

  if ((v119 & 0x200) != 0)
  {
    int v45 = (const char *)getmntoptstr(v3, "rwsize");
    if (v45 || (int v45 = (const char *)getmntoptstr(v3, "rsize")) != 0LL)
    {
      uint64_t v46 = strtol(v45, &__endptr, 10);
      uint64_t v47 = __endptr;
      if ((*__endptr | 0x20) == 0x6B)
      {
        v46 <<= 10;
        uint64_t v47 = ++__endptr;
      }

      if ((unint64_t)(v46 - 1048577) < 0xFFFFFFFFFFF00000LL || *v47)
      {
        warnx("illegal rsize value -- %s", v45);
      }

      else
      {
        LODWORD(qword_10001092C) = qword_10001092C | 8;
        dword_10001094C = v46;
      }
    }
  }

  if ((v119 & 0x400) == 0) {
    goto LABEL_139;
  }
  v48 = (const char *)getmntoptstr(v3, "sec");
  if (!v48)
  {
    warnx("missing security value for sec= option");
    goto LABEL_139;
  }

  int v49 = strdup(v48);
  __stringp = v49;
  if (!v49)
  {
LABEL_136:
    warnx("couldn't parse security value -- %s");
    goto LABEL_139;
  }

  v50 = v49;
  qword_1000109C4 = 0LL;
  unk_1000109CC = 0LL;
  unk_1000109D4 = 0LL;
  int v51 = strsep(&__stringp, ":");
  if (!v51)
  {
LABEL_135:
    int v57 = qword_1000109C4;
    free(v50);
    int v4 = &dword_100010000;
    if (v57) {
      goto LABEL_138;
    }
    goto LABEL_136;
  }

  v52 = v51;
  int v53 = 0;
  while (1)
  {
    uint64_t v54 = (int)qword_1000109C4;
    if (*v52)
    {
      if (!strcmp("krb5p", v52))
      {
        if ((v53 & 8) == 0)
        {
          v53 |= 8u;
          LODWORD(qword_1000109C4) = v54 + 1;
          int v55 = (char *)&qword_1000109C4 + 4 * v54;
          int v56 = 390005;
LABEL_131:
          *((_DWORD *)v55 + 1) = v56;
          goto LABEL_132;
        }

        warnx("sec krb5p appears more than once: %s");
      }

      else if (!strcmp("krb5i", v52))
      {
        if ((v53 & 4) == 0)
        {
          v53 |= 4u;
          LODWORD(qword_1000109C4) = v54 + 1;
          int v55 = (char *)&qword_1000109C4 + 4 * v54;
          int v56 = 390004;
          goto LABEL_131;
        }

        warnx("sec krb5i appears more than once: %s");
      }

      else if (!strcmp("krb5", v52))
      {
        if ((v53 & 2) == 0)
        {
          v53 |= 2u;
          LODWORD(qword_1000109C4) = v54 + 1;
          int v55 = (char *)&qword_1000109C4 + 4 * v54;
          int v56 = 390003;
          goto LABEL_131;
        }

        warnx("sec krb5 appears more than once: %s");
      }

      else
      {
        if (strcmp("sys", v52))
        {
          if (!strcmp("none", v52))
          {
            if ((v53 & 0x10) != 0)
            {
              warnx("sec none appears more than once: %s");
            }

            else
            {
              v53 |= 0x10u;
              LODWORD(qword_1000109C4) = v54 + 1;
              *((_DWORD *)&qword_1000109C4 + v54 + 1) = 0;
            }
          }

          else
          {
            warnx("unknown sec flavor '%s' ignored");
          }

          goto LABEL_132;
        }

        if ((v53 & 1) == 0)
        {
          v53 |= 1u;
          LODWORD(qword_1000109C4) = v54 + 1;
          int v55 = (char *)&qword_1000109C4 + 4 * v54;
          int v56 = 1;
          goto LABEL_131;
        }

        warnx("sec sys appears more than once: %s");
      }
    }

LABEL_132:
    v52 = strsep(&__stringp, ":");
    if (!v52) {
      goto LABEL_135;
    }
  }

  free(v50);
  int v4 = &dword_100010000;
LABEL_138:
  v4[587] |= 0x1000u;
LABEL_139:
  if ((v119 & 0x200000) != 0)
  {
    int v58 = (const char *)getmntoptstr(v3, "etype");
    if (v58)
    {
      int v59 = strdup(v58);
      __stringp = v59;
      if (!v59) {
        goto LABEL_357;
      }
      v60 = v59;
      qword_1000109DC = 0LL;
      *(void *)&dword_1000109E4 = 0LL;
      unk_1000109EC = 0;
      unsigned int v61 = strsep(&__stringp, ":");
      uint64_t v62 = qword_1000109DC;
      if (v61 && qword_1000109DC <= 2uLL)
      {
        v63 = v61;
        int v64 = 0;
        while (1)
        {
          if (!*v63) {
            goto LABEL_161;
          }
          if (!strcasecmp("des3", v63) || !strcasecmp("des3-cbc-sha1", v63) || !strcasecmp("des3-cbc-sha1-kd", v63))
          {
            if ((v64 & 1) != 0)
            {
              warnx("etype des3-cbc-sha1-kd  appears more than once: %s");
              goto LABEL_161;
            }

            v64 |= 1u;
            LODWORD(qword_1000109DC) = v62 + 1;
            uint64_t v65 = (char *)&qword_1000109DC + 4 * v62;
            int v66 = 16;
            goto LABEL_160;
          }

          if (!strcasecmp("aes128", v63)
            || !strcasecmp("aes128-cts-hmac-sha1", v63)
            || !strcasecmp("aes128-cts-hmac-sha1-96", v63))
          {
            if ((v64 & 2) == 0)
            {
              v64 |= 2u;
              LODWORD(qword_1000109DC) = v62 + 1;
              uint64_t v65 = (char *)&qword_1000109DC + 4 * v62;
              int v66 = 17;
LABEL_160:
              *((_DWORD *)v65 + 2) = v66;
              goto LABEL_161;
            }

            warnx("etype aes128-cts-hmac-sha1-96  appears more than once: %s");
          }

          else
          {
            if (!strcasecmp("aes256", v63)
              || !strcasecmp("aes256-cts-hmac-sha1", v63)
              || !strcasecmp("aes256-cts-hmac-sha1-96", v63))
            {
              if ((v64 & 4) != 0)
              {
                warnx("etype aes256-cts-hmac-sha1-96  appears more than once: %s");
                goto LABEL_161;
              }

              v64 |= 4u;
              LODWORD(qword_1000109DC) = v62 + 1;
              uint64_t v65 = (char *)&qword_1000109DC + 4 * v62;
              int v66 = 18;
              goto LABEL_160;
            }

            warnx("etype %s is unknown etype. Ignored");
          }

LABEL_161:
          int v67 = strsep(&__stringp, ":");
          uint64_t v62 = qword_1000109DC;
          if (v67)
          {
            v63 = v67;
          }

          break;
        }
      }

      free(v60);
      HIDWORD(qword_1000109DC) = v62;
      int v4 = &dword_100010000;
      if (v62) {
        LODWORD(qword_10001092C) = qword_10001092C | 0x10000000;
      }
      else {
LABEL_357:
      }
        warnx("couldn't parse type value -- %s");
    }

    else
    {
      warnx("missing encryption type value for etype= option");
    }
  }

  if ((v119 & 0x800) != 0)
  {
    uint64_t v68 = getmntoptnum(v3, "timeo");
    if (v68 <= 0)
    {
      sub_10000A070(v3);
    }

    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x20000;
      *(void *)&xmmword_100010A08 = v68 / 0xAuLL;
      *((void *)&xmmword_100010A08 + 1) = 100000000 * (v68 % 0xAuLL);
    }
  }

  int v69 = v119;
  if ((v119 & 0x1000) != 0)
  {
    LODWORD(__stringp) = 0;
    int v117 = 0;
    v76 = (const char *)getmntoptstr(v3, "vers");
    if (v76 || (v76 = (const char *)getmntoptstr(v3, "nfsvers")) != 0LL)
    {
      else {
        warnx("illegal NFS version value -- %s", v76);
      }
    }

    int v69 = v119;
    if ((v119 & 0x2000) == 0)
    {
LABEL_176:
      if ((v69 & 0x4000) == 0) {
        goto LABEL_177;
      }
      goto LABEL_202;
    }
  }

  else if ((v119 & 0x2000) == 0)
  {
    goto LABEL_176;
  }

  warnx("option nfsv2 deprecated, use vers=#");
  LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
  xmmword_10001093C = xmmword_10000A520;
  int v69 = v119;
  if ((v119 & 0x4000) == 0)
  {
LABEL_177:
    if ((v69 & 0x8000) == 0) {
      goto LABEL_178;
    }
LABEL_203:
    warnx("option nfsv4 deprecated, use vers=#");
    LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
    xmmword_10001093C = xmmword_10000A540;
    if ((v119 & 0x10000) == 0) {
      goto LABEL_186;
    }
    goto LABEL_179;
  }

LABEL_202:
  warnx("option nfsv3 deprecated, use vers=#");
  LODWORD(qword_10001092C) = qword_10001092C & 0xF7FFFFF9 | 2;
  xmmword_10001093C = xmmword_10000A530;
  int v69 = v119;
  if ((v119 & 0x8000) != 0) {
    goto LABEL_203;
  }
LABEL_178:
  if ((v69 & 0x10000) == 0) {
    goto LABEL_186;
  }
LABEL_179:
  v70 = (const char *)getmntoptstr(v3, "rwsize");
  if (v70 || (v70 = (const char *)getmntoptstr(v3, "wsize")) != 0LL)
  {
    uint64_t v71 = strtol(v70, &__endptr, 10);
    v72 = __endptr;
    if ((*__endptr | 0x20) == 0x6B)
    {
      v71 <<= 10;
      v72 = ++__endptr;
    }

    if ((unint64_t)(v71 - 1048577) < 0xFFFFFFFFFFF00000LL || *v72)
    {
      warnx("illegal wsize value -- %s", v70);
    }

    else
    {
      LODWORD(qword_10001092C) = qword_10001092C | 0x10;
      dword_100010950 = v71;
    }
  }

LABEL_186:
  if ((v119 & 0x80000) == 0) {
    goto LABEL_191;
  }
  v73 = (const char *)getmntoptstr(v3, "principal");
  if (v73)
  {
    if ((void)xmmword_100010AC8)
    {
      warnx("principal is already set to %s. ignoring %s", (const char *)xmmword_100010AC8, v73);
      if ((void)xmmword_100010AC8) {
        goto LABEL_190;
      }
    }

    else
    {
      *(void *)&xmmword_100010AC8 = strdup(v73);
      if ((void)xmmword_100010AC8)
      {
LABEL_190:
        v4[587] |= 0x2000000u;
        goto LABEL_191;
      }
    }

    strerror(1);
    sub_100003C74(1, "could not set principal: %s");
  }

  warnx("missing principal name");
LABEL_191:
  if ((v119 & 0x40000) != 0)
  {
    v74 = (const char *)getmntoptstr(v3, "realm");
    if (v74)
    {
      if (*v74 == 64 || dword_100010924)
      {
        v75 = strdup(v74);
        qword_100010AC0 = (uint64_t)v75;
      }

      else
      {
        asprintf((char **)&qword_100010AC0, "@%s", v74);
        v75 = (char *)qword_100010AC0;
      }

      if (!v75)
      {
        strerror(1);
        sub_100003C74(1, "could not set realm: %s");
      }

      v4[587] |= 0x1000000u;
    }

    else
    {
      warnx("missing realm name");
    }
  }

  if ((v119 & 0x100000) != 0)
  {
    v77 = (const char *)getmntoptstr(v3, "sprincipal");
    if (v77)
    {
      *((void *)&xmmword_100010AC8 + 1) = strdup(v77);
      if (!*((void *)&xmmword_100010AC8 + 1))
      {
        strerror(1);
        sub_100003C74(1, "could not set server's principal: %s");
      }

      v4[587] |= 0x4000000u;
    }

    else
    {
      warnx("missing server's principal");
    }
  }

  if ((v119 & 0x400000) != 0)
  {
    v78 = (const char *)getmntoptstr(v3, "fh");
    if (v78)
    {
      if (sub_100009640(v78, &dword_100010A38))
      {
        strerror(1);
        sub_100003C74(1, "cound not set root file handle: %s");
      }

      v4[587] |= 0x100000u;
      if (dword_100010920 >= 2)
      {
        v79 = sub_10000974C(&dword_100010A38);
        if (v79)
        {
          v80 = v79;
          printf("Got fh %s\n", v79);
          free(v80);
        }
      }
    }

    else
    {
      warnx("missing hex string for file handle");
    }
  }

  if ((v119 & 0x1000000) != 0)
  {
    uint64_t v81 = getmntoptstr(v3, "readlink_nocache");
    if (v81)
    {
      v82 = (const char *)v81;
      uint64_t v83 = getmntoptnum(v3, "readlink_nocache");
      if (v83 < 0)
      {
        warnx("illegal readlink_nocache value -- %s", v82);
      }

      else
      {
        HIDWORD(qword_10001092C) |= 1u;
        dword_100010A1C = v83;
      }
    }
  }

  if ((v119 & 0x2000000) != 0)
  {
    uint64_t v84 = getmntoptstr(v3, "accesscache");
    if (v84)
    {
      v85 = (const char *)v84;
      uint64_t v86 = getmntoptnum(v3, "accesscache");
      if (v86 < 0)
      {
        warnx("illegal accesscache value -- %s", v85);
      }

      else
      {
        HIDWORD(qword_10001092C) |= 8u;
        dword_100010A20 = v86;
      }
    }
  }

  freemntopts(v3);
  int v119 = 0;
  uint64_t v87 = getmntopts(a1, &off_1000105C8, &v118, &v119);
  if (!v87) {
LABEL_382:
  }
    sub_100003C74(22, "getmntops failed: %s", a1);
  uint64_t v88 = v87;
  if (dword_100010920 >= 3) {
    printf("altflags=0x%x\n", v119);
  }
  int v89 = v119;
  if ((v119 & 0x40000) != 0)
  {
    LODWORD(v99) = qword_100010934 | 0x1000;
    HIDWORD(v99) = HIDWORD(qword_100010934) & 0xFFFFEFFF;
    qword_100010934 = v99;
    if ((v119 & 0x80000) == 0)
    {
LABEL_231:
      if ((v119 & 1) == 0) {
        goto LABEL_232;
      }
      goto LABEL_312;
    }
  }

  else if ((v119 & 0x80000) == 0)
  {
    goto LABEL_231;
  }

  qword_100010934 |= 0x200000002000uLL;
  if ((v119 & 1) == 0)
  {
LABEL_232:
    if ((v119 & 2) == 0) {
      goto LABEL_233;
    }
    goto LABEL_313;
  }

LABEL_312:
  v4[587] &= 0xFFFFF87F;
  if ((v89 & 2) == 0)
  {
LABEL_233:
    if ((v89 & 0x10000) == 0) {
      goto LABEL_234;
    }
    goto LABEL_314;
  }

LABEL_313:
  dword_10001091C |= 1u;
  if ((v89 & 0x10000) == 0)
  {
LABEL_234:
    if ((v89 & 4) == 0) {
      goto LABEL_235;
    }
    goto LABEL_315;
  }

LABEL_314:
  LODWORD(v100) = qword_100010934 | 0x400;
  HIDWORD(v100) = HIDWORD(qword_100010934) & 0xFFFFFBFF;
  qword_100010934 = v100;
  if ((v89 & 4) == 0)
  {
LABEL_235:
    if ((v89 & 8) == 0) {
      goto LABEL_236;
    }
    goto LABEL_316;
  }

LABEL_315:
  LODWORD(v101) = qword_100010934 | 8;
  HIDWORD(v101) = HIDWORD(qword_100010934) & 0xFFFFFFF7;
  qword_100010934 = v101;
  if ((v89 & 8) == 0)
  {
LABEL_236:
    if ((v89 & 0x10) == 0) {
      goto LABEL_237;
    }
    goto LABEL_317;
  }

LABEL_316:
  qword_100010934 |= 0x1000000010uLL;
  if ((v89 & 0x10) == 0)
  {
LABEL_237:
    if ((v89 & 0x4000000) == 0) {
      goto LABEL_238;
    }
LABEL_318:
    v103 = strerror(45);
    sub_100003C74(69, "FPnfs is deprecated: %s", v103);
  }

LABEL_317:
  LODWORD(v102) = qword_100010934 | 1;
  HIDWORD(v102) = HIDWORD(qword_100010934) & 0xFFFFFFFE;
  qword_100010934 = v102;
  if ((v89 & 0x4000000) != 0) {
    goto LABEL_318;
  }
LABEL_238:
  if ((v89 & 0x600000) != 0)
  {
    if ((v89 & 0x400000) != 0) {
      int v90 = 30;
    }
    else {
      int v90 = 2;
    }
    HIDWORD(qword_1000109F4) = v90;
  }

  if ((v89 & 0x20) != 0)
  {
    qword_100010934 |= 0x200000002uLL;
    if ((v89 & 0x40) == 0)
    {
LABEL_245:
      if ((v89 & 0x80) == 0) {
        goto LABEL_246;
      }
      goto LABEL_321;
    }
  }

  else if ((v89 & 0x40) == 0)
  {
    goto LABEL_245;
  }

  LODWORD(qword_10001092C) = qword_10001092C | 0x800;
  dword_1000109C0 = 2;
  if ((v89 & 0x80) == 0)
  {
LABEL_246:
    if ((v89 & 0x100) == 0) {
      goto LABEL_247;
    }
    goto LABEL_322;
  }

LABEL_321:
  LODWORD(qword_10001092C) = qword_10001092C | 0x800;
  dword_1000109C0 = 0;
  if ((v89 & 0x100) == 0)
  {
LABEL_247:
    if ((v89 & 0x8000) == 0) {
      goto LABEL_248;
    }
    goto LABEL_323;
  }

LABEL_322:
  qword_100010934 |= 0x1000000010000uLL;
  if ((v89 & 0x8000) == 0)
  {
LABEL_248:
    if ((v89 & 0x20000) == 0) {
      goto LABEL_249;
    }
    goto LABEL_324;
  }

LABEL_323:
  qword_100010934 |= 0x10000000100uLL;
  if ((v89 & 0x20000) == 0)
  {
LABEL_249:
    if ((v89 & 0x200) == 0) {
      goto LABEL_250;
    }
    goto LABEL_325;
  }

LABEL_324:
  qword_100010934 |= 0x80000000800uLL;
  if ((v89 & 0x200) == 0)
  {
LABEL_250:
    if ((v89 & 0x100000) == 0) {
      goto LABEL_251;
    }
    goto LABEL_326;
  }

LABEL_325:
  LODWORD(v104) = qword_100010934 | 0x80;
  HIDWORD(v104) = HIDWORD(qword_100010934) & 0xFFFFFF7F;
  qword_100010934 = v104;
  if ((v89 & 0x100000) == 0)
  {
LABEL_251:
    if ((v89 & 0x2000000) == 0) {
      goto LABEL_252;
    }
    goto LABEL_327;
  }

LABEL_326:
  qword_100010934 |= 0x400000004000uLL;
  if ((v89 & 0x2000000) == 0)
  {
LABEL_252:
    if ((v89 & 0x800000) == 0) {
      goto LABEL_253;
    }
    goto LABEL_328;
  }

LABEL_327:
  qword_100010934 |= 0x8000000080000uLL;
  if ((v89 & 0x800000) == 0)
  {
LABEL_253:
    if ((v89 & 0x400) == 0) {
      goto LABEL_254;
    }
    goto LABEL_329;
  }

LABEL_328:
  LODWORD(v105) = qword_100010934 | 0x8000;
  HIDWORD(v105) = HIDWORD(qword_100010934) & 0xFFFF7FFF;
  qword_100010934 = v105;
  if ((v89 & 0x400) == 0)
  {
LABEL_254:
    if ((v89 & 0x800) == 0) {
      goto LABEL_255;
    }
    goto LABEL_330;
  }

LABEL_329:
  qword_100010934 |= 0x4000000040uLL;
  if ((v89 & 0x800) == 0)
  {
LABEL_255:
    if ((v89 & 0x1000) == 0) {
      goto LABEL_257;
    }
    goto LABEL_256;
  }

LABEL_330:
  qword_100010934 |= 0x400000004uLL;
  if ((v89 & 0x1000) != 0) {
LABEL_256:
  }
    qword_100010934 |= 0x100000001uLL;
LABEL_257:
  if ((v89 & 0x6000) != 0)
  {
    if ((v89 & 0x4000) != 0) {
      int v91 = 2;
    }
    else {
      int v91 = 1;
    }
    LODWORD(qword_1000109F4) = v91;
  }

  if ((v89 & 0x1000000) != 0)
  {
    LODWORD(qword_10001092C) = qword_10001092C | 0x100000;
    dword_100010A38 = 0;
    if ((v89 & 0x8000000) == 0)
    {
LABEL_264:
      if ((v89 & 0x10000000) == 0) {
        goto LABEL_265;
      }
      goto LABEL_334;
    }
  }

  else if ((v89 & 0x8000000) == 0)
  {
    goto LABEL_264;
  }

  qword_100010934 |= 0x2000000020uLL;
  if ((v89 & 0x10000000) == 0)
  {
LABEL_265:
    if ((v89 & 0x20000000) == 0) {
      goto LABEL_267;
    }
    goto LABEL_266;
  }

LABEL_334:
  LODWORD(qword_100010AE8) = 1;
  if ((v89 & 0x20000000) != 0) {
LABEL_266:
  }
    qword_100010934 |= 0x10000000100000uLL;
LABEL_267:
  freemntopts(v88);
  int v119 = 0;
  uint64_t v92 = getmntopts(a1, qword_100010908, &v118, &v119);
  if (!v92) {
    goto LABEL_382;
  }
  uint64_t v93 = v92;
  if (dword_100010920 >= 3) {
    printf("negative altflags=0x%x\n", v119);
  }
  if ((v119 & 0x40000) != 0)
  {
    qword_100010934 |= 0x100000001000uLL;
    if ((v119 & 0x80000) == 0)
    {
LABEL_272:
      if ((v119 & 1) == 0) {
        goto LABEL_273;
      }
      goto LABEL_338;
    }
  }

  else if ((v119 & 0x80000) == 0)
  {
    goto LABEL_272;
  }

  LODWORD(v106) = qword_100010934 | 0x2000;
  HIDWORD(v106) = HIDWORD(qword_100010934) & 0xFFFFDFFF;
  qword_100010934 = v106;
  if ((v119 & 1) == 0)
  {
LABEL_273:
    if ((v119 & 2) == 0) {
      goto LABEL_274;
    }
    goto LABEL_339;
  }

LABEL_338:
  qword_10001092C = (uint64_t)vorr_s8((int8x8_t)qword_10001092C, (int8x8_t)0x600000780LL);
  *(_OWORD *)&dword_100010960 = 0u;
  *(__int128 *)((char *)&xmmword_100010968 + 8) = 0u;
  *(_OWORD *)&dword_100010980 = 0u;
  *(__int128 *)((char *)&xmmword_100010988 + 8) = 0u;
  *(_OWORD *)&qword_1000109A0 = 0u;
  *(__int128 *)((char *)&xmmword_1000109A8 + 8) = 0u;
  if ((v119 & 2) == 0)
  {
LABEL_274:
    if ((v119 & 0x10000) == 0) {
      goto LABEL_275;
    }
    goto LABEL_340;
  }

LABEL_339:
  dword_10001091C &= ~1u;
  if ((v119 & 0x10000) == 0)
  {
LABEL_275:
    if ((v119 & 4) == 0) {
      goto LABEL_276;
    }
    goto LABEL_341;
  }

LABEL_340:
  qword_100010934 |= 0x40000000400uLL;
  if ((v119 & 4) == 0)
  {
LABEL_276:
    if ((v119 & 0x2000000) == 0) {
      goto LABEL_277;
    }
    goto LABEL_342;
  }

LABEL_341:
  qword_100010934 |= 0x800000008uLL;
  if ((v119 & 0x2000000) == 0)
  {
LABEL_277:
    if ((v119 & 8) == 0) {
      goto LABEL_278;
    }
    goto LABEL_343;
  }

LABEL_342:
  LODWORD(v107) = qword_100010934 | 0x80000;
  HIDWORD(v107) = HIDWORD(qword_100010934) & 0xFFF7FFFF;
  qword_100010934 = v107;
  if ((v119 & 8) == 0)
  {
LABEL_278:
    if ((v119 & 0x10) == 0) {
      goto LABEL_280;
    }
    goto LABEL_279;
  }

LABEL_343:
  LODWORD(v108) = qword_100010934 | 0x10;
  HIDWORD(v108) = HIDWORD(qword_100010934) & 0xFFFFFFEF;
  qword_100010934 = v108;
  if ((v119 & 0x10) != 0) {
LABEL_279:
  }
    qword_100010934 |= 0x100000001uLL;
LABEL_280:
  if ((v119 & 0x600000) != 0)
  {
    if ((v119 & 0x400000) != 0) {
      int v94 = 2;
    }
    else {
      int v94 = 30;
    }
    HIDWORD(qword_1000109F4) = v94;
  }

  if ((v119 & 0x20) != 0)
  {
    LODWORD(v109) = qword_100010934 | 2;
    HIDWORD(v109) = HIDWORD(qword_100010934) & 0xFFFFFFFD;
    qword_100010934 = v109;
    if ((v119 & 0x40) == 0)
    {
LABEL_287:
      if ((v119 & 0x80) == 0) {
        goto LABEL_288;
      }
      goto LABEL_347;
    }
  }

  else if ((v119 & 0x40) == 0)
  {
    goto LABEL_287;
  }

  LODWORD(qword_10001092C) = qword_10001092C | 0x800;
  dword_1000109C0 = 0;
  if ((v119 & 0x80) == 0)
  {
LABEL_288:
    if ((v119 & 0x100) == 0) {
      goto LABEL_289;
    }
    goto LABEL_348;
  }

LABEL_347:
  LODWORD(qword_10001092C) = qword_10001092C | 0x800;
  dword_1000109C0 = 1;
  if ((v119 & 0x100) == 0)
  {
LABEL_289:
    if ((v119 & 0x8000) == 0) {
      goto LABEL_290;
    }
    goto LABEL_349;
  }

LABEL_348:
  LODWORD(v110) = qword_100010934 | 0x10000;
  HIDWORD(v110) = HIDWORD(qword_100010934) & 0xFFFEFFFF;
  qword_100010934 = v110;
  if ((v119 & 0x8000) == 0)
  {
LABEL_290:
    if ((v119 & 0x20000) == 0) {
      goto LABEL_291;
    }
    goto LABEL_350;
  }

LABEL_349:
  LODWORD(v111) = qword_100010934 | 0x100;
  HIDWORD(v111) = HIDWORD(qword_100010934) & 0xFFFFFEFF;
  qword_100010934 = v111;
  if ((v119 & 0x20000) == 0)
  {
LABEL_291:
    if ((v119 & 0x200) == 0) {
      goto LABEL_292;
    }
    goto LABEL_351;
  }

LABEL_350:
  LODWORD(v112) = qword_100010934 | 0x800;
  HIDWORD(v112) = HIDWORD(qword_100010934) & 0xFFFFF7FF;
  qword_100010934 = v112;
  if ((v119 & 0x200) == 0)
  {
LABEL_292:
    if ((v119 & 0x100000) == 0) {
      goto LABEL_293;
    }
    goto LABEL_352;
  }

LABEL_351:
  qword_100010934 |= 0x8000000080uLL;
  if ((v119 & 0x100000) == 0)
  {
LABEL_293:
    if ((v119 & 0x800000) == 0) {
      goto LABEL_294;
    }
    goto LABEL_353;
  }

LABEL_352:
  LODWORD(v113) = qword_100010934 | 0x4000;
  HIDWORD(v113) = HIDWORD(qword_100010934) & 0xFFFFBFFF;
  qword_100010934 = v113;
  if ((v119 & 0x800000) == 0)
  {
LABEL_294:
    if ((v119 & 0x400) == 0) {
      goto LABEL_295;
    }
    goto LABEL_354;
  }

LABEL_353:
  qword_100010934 |= 0x800000008000uLL;
  if ((v119 & 0x400) == 0)
  {
LABEL_295:
    if ((v119 & 0x800) == 0) {
      goto LABEL_296;
    }
    goto LABEL_355;
  }

LABEL_354:
  LODWORD(v114) = qword_100010934 | 0x40;
  HIDWORD(v114) = HIDWORD(qword_100010934) & 0xFFFFFFBF;
  qword_100010934 = v114;
  if ((v119 & 0x800) == 0)
  {
LABEL_296:
    if ((v119 & 0x1000) == 0) {
      goto LABEL_298;
    }
    goto LABEL_297;
  }

LABEL_355:
  LODWORD(v115) = qword_100010934 | 4;
  HIDWORD(v115) = HIDWORD(qword_100010934) & 0xFFFFFFFB;
  qword_100010934 = v115;
  if ((v119 & 0x1000) != 0)
  {
LABEL_297:
    LODWORD(v95) = qword_100010934 | 1;
    HIDWORD(v95) = HIDWORD(qword_100010934) & 0xFFFFFFFE;
    qword_100010934 = v95;
  }

LABEL_298:
  if ((v119 & 0x6000) != 0)
  {
    if ((v119 & 0x4000) != 0) {
      int v96 = 1;
    }
    else {
      int v96 = 2;
    }
    LODWORD(qword_1000109F4) = v96;
  }

  if ((v119 & 0x8000000) != 0)
  {
    LODWORD(v97) = qword_100010934 | 0x20;
    HIDWORD(v97) = HIDWORD(qword_100010934) & 0xFFFFFFDF;
    qword_100010934 = v97;
  }

  if ((v119 & 0x20000000) != 0)
  {
    LODWORD(v98) = qword_100010934 | 0x100000;
    HIDWORD(v98) = HIDWORD(qword_100010934) & 0xFFEFFFFF;
    qword_100010934 = v98;
  }

  freemntopts(v93);
  if (qword_1000109F4) {
    v4[587] |= 0x4000u;
  }
  sub_100009934(a1);
}

void sub_1000068FC()
{
  if ((void)xmmword_100010AC8) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = qword_100010AC0 == 0;
  }
  if (!v0 || *((void *)&xmmword_100010AC8 + 1) != 0LL)
  {
    if ((_DWORD)qword_1000109C4)
    {
      if ((int)qword_1000109C4 < 1)
      {
        LODWORD(v2) = 0;
      }

      else
      {
        uint64_t v2 = 0LL;
        while ((dword_100010928[v2 + 40] - 390003) >= 3)
        {
        }
      }

      if ((_DWORD)v2 == (_DWORD)qword_1000109C4) {
LABEL_18:
      }
        warnx("principal or realm specified but no kerberos is enabled");
    }

    else
    {
      sub_10000A160();
      warnx("no sec flavors specified for principal or realm, assuming kerberos");
    }
  }

uint64_t sub_1000069AC()
{
  if (dword_100010000 != -1)
  {
    *(_DWORD *)__big = dword_100010000;
    sysctlbyname("vfs.generic.nfs.client.access_cache_timeout", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_100010004 != -1)
  {
    *(_DWORD *)__big = dword_100010004;
    sysctlbyname("vfs.generic.nfs.client.access_for_getattr", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_100010008 != -1)
  {
    *(_DWORD *)__big = dword_100010008;
    sysctlbyname("vfs.generic.nfs.client.allow_async", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_10001000C != -1)
  {
    *(_DWORD *)__big = dword_10001000C;
    sysctlbyname("vfs.generic.nfs.client.callback_port", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_100010010 != -1)
  {
    *(_DWORD *)__big = dword_100010010;
    sysctlbyname("vfs.generic.nfs.client.initialdowndelay", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_100010014 != -1)
  {
    *(_DWORD *)__big = dword_100010014;
    sysctlbyname("vfs.generic.nfs.client.iosize", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_100010018 != -1)
  {
    *(_DWORD *)__big = dword_100010018;
    sysctlbyname("vfs.generic.nfs.client.nextdowndelay", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_10001001C != -1)
  {
    *(_DWORD *)__big = dword_10001001C;
    sysctlbyname("vfs.generic.nfs.client.nfsiod_thread_max", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_100010020 != -1)
  {
    *(_DWORD *)__big = dword_100010020;
    sysctlbyname("vfs.generic.nfs.client.statfs_rate_limit", 0LL, 0LL, __big, 4uLL);
  }

  int v0 = dword_100010024;
  if (dword_100010024 == -1)
  {
    size_t __len = 128LL;
    CFTypeRef v1 = IOPSCopyPowerSourcesInfo();
    if (!v1) {
      goto LABEL_36;
    }
    uint64_t v2 = v1;
    uint64_t v3 = IOPSCopyPowerSourcesList(v1);
    if (v3)
    {
      int v4 = v3;
      CFIndex Count = CFArrayGetCount(v3);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        CFIndex v7 = 0LL;
        BOOL v8 = 1;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v4, v7);
          if (ValueAtIndex)
          {
            uint64_t v10 = IOPSGetPowerSourceDescription(v2, ValueAtIndex);
            Value = (const __CFBoolean *)CFDictionaryGetValue(v10, @"Is Present");
            if (Value)
            {
              uint64_t v12 = Value;
              CFTypeID v13 = CFGetTypeID(Value);
              if (v13 == CFBooleanGetTypeID())
              {
                if (CFBooleanGetValue(v12))
                {
                  uint64_t v14 = (const __CFString *)CFDictionaryGetValue(v10, @"Type");
                  if (v14)
                  {
                    __darwin_ct_rune_t v15 = v14;
                    CFTypeID v16 = CFGetTypeID(v14);
                    if (v16 == CFStringGetTypeID()
                      && CFStringCompare(v15, @"InternalBattery", 0LL) == kCFCompareEqualTo)
                    {
                      break;
                    }
                  }
                }
              }
            }
          }

          BOOL v8 = v6 > ++v7;
        }

        while (v6 != v7);
        CFRelease(v4);
        CFRelease(v2);
        if (v8)
        {
          int v0 = 1;
LABEL_39:
          dword_100010024 = v0;
          goto LABEL_40;
        }

LABEL_36:
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        *(_OWORD *)__big = 0u;
        __int128 v23 = 0u;
        int v17 = sysctlbyname("hw.model", __big, &__len, 0LL, 0LL);
        int v0 = 0;
        if ((v17 & 0x80000000) == 0 && __len) {
          int v0 = strnstr(__big, "Book", __len) != 0LL;
        }
        goto LABEL_39;
      }

      CFRelease(v4);
    }

    CFRelease(v2);
    goto LABEL_36;
  }

  if ((v4 & 0x8000000) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(HIDWORD(xmmword_10001093C));
    CFIndex v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      __src = bswap32(DWORD2(xmmword_10001093C));
      CFIndex v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }

  if ((v4 & 8) != 0 && !(_DWORD)v7)
  {
    __src = bswap32(dword_10001094C);
    CFIndex v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x10) == 0) {
      goto LABEL_46;
    }
  }

  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_46;
  }

  if (!(_DWORD)v7)
  {
    __src = bswap32(dword_100010950);
    CFIndex v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }

LABEL_40:
  *(_DWORD *)__big = v0;
  uint64_t result = sysctlbyname("vfs.generic.nfs.client.is_mobile", 0LL, 0LL, __big, 4uLL);
  if (dword_100010028 != -1)
  {
    *(_DWORD *)__big = dword_100010028;
    uint64_t result = sysctlbyname("vfs.generic.nfs.client.squishy_flags", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_10001002C != -1)
  {
    *(_DWORD *)__big = dword_10001002C;
    uint64_t result = sysctlbyname("vfs.generic.nfs.client.root_steals_gss_context", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_100010030 != -1)
  {
    *(_DWORD *)__big = dword_100010030;
    uint64_t result = sysctlbyname("vfs.generic.nfs.client.mount_timeout", 0LL, 0LL, __big, 4uLL);
  }

  if (dword_100010034 != -1)
  {
    *(_DWORD *)__big = dword_100010034;
    uint64_t result = sysctlbyname("vfs.generic.nfs.client.mount_quick_timeout", 0LL, 0LL, __big, 4uLL);
  }

  uint64_t v19 = (void *)qword_100010038;
  if (qword_100010038)
  {
    size_t v20 = strnlen((const char *)qword_100010038, 0x400uLL);
    return sysctlbyname("vfs.generic.nfs.client.default_nfs4domain", 0LL, 0LL, v19, v20);
  }

  return result;
}

uint64_t sub_100006E58(const char *a1, void *a2)
{
  *a2 = 0LL;
  uint64_t v3 = strdup(a1);
  if (!v3) {
    return 12LL;
  }
  int v4 = v3;
  if (!*v3)
  {
    uint64_t v35 = 22LL;
    goto LABEL_96;
  }

  uint64_t v40 = a2;
  uint64_t v5 = 0LL;
  CFIndex v6 = 0LL;
  memset(v44, 0, sizeof(v44));
  CFIndex v7 = "ftp://";
  int v45 = 0;
  unint64_t v42 = v3;
  while (2)
  {
    uint64_t v41 = v5;
    BOOL v8 = malloc(0x20uLL);
    if (!v8)
    {
      uint64_t v35 = 12LL;
      int v4 = v42;
      if (v6) {
        goto LABEL_93;
      }
      goto LABEL_96;
    }

    uint64_t v5 = v8;
    *BOOL v8 = 0u;
    v8[1] = 0u;
    if (!*v4) {
      goto LABEL_86;
    }
    ssize_t v9 = 0LL;
    uint64_t v43 = (void *)v8 + 1;
    while (1)
    {
      uint64_t v10 = malloc(0x18uLL);
      if (!v10) {
        goto LABEL_87;
      }
      uint64_t v11 = v10;
      *uint64_t v10 = 0LL;
      v10[1] = 0LL;
      v10[2] = 0LL;
      if (!strncmp(v4, v7, 6uLL))
      {
        CFTypeID v13 = 0LL;
        CFTypeID v16 = v4;
        int v4 = "localhost";
        goto LABEL_50;
      }

      int v12 = *v4;
      if (v12 != 91)
      {
        CFTypeID v13 = 0LL;
        uint64_t v14 = 0LL;
        CFTypeID v16 = v4;
        if (!*v4) {
          goto LABEL_49;
        }
        goto LABEL_28;
      }

      CFTypeID v13 = 0LL;
      uint64_t v14 = 0LL;
      __darwin_ct_rune_t v15 = v4;
LABEL_11:
      CFTypeID v16 = v15 + 2;
      while (1)
      {
        BOOL v17 = (*(v16 - 1) & 0x80000000) == 0 && _DefaultRuneLocale.__runetype[*(v16 - 1)] & 0x10000;
        int v12 = *(v16 - 1);
        if (v12 != 58 && !v17) {
          break;
        }
        ++v16;
        if (v12 == 58)
        {
          __darwin_ct_rune_t v15 = v16 - 2;
          if (!v13) {
            CFTypeID v13 = (unsigned __int8 *)(v16 - 2);
          }
          if (!v14)
          {
            if (*(v16 - 1) == 47) {
              uint64_t v14 = (unsigned __int8 *)(v16 - 2);
            }
            else {
              uint64_t v14 = 0LL;
            }
          }

          goto LABEL_11;
        }
      }

      size_t v20 = v5;
      uint64_t v21 = v7;
      uint64_t v22 = (unsigned __int8 *)(v16 - 1);
      if (v12 != 93)
      {
        --v16;
        goto LABEL_48;
      }

      int v23 = *v16;
      if (v23 == 44 || v23 == 58)
      {
        *uint64_t v22 = 0;
        int v24 = inet_pton(30, v4 + 1, v44);
        *uint64_t v22 = 93;
        if (v24)
        {
          CFIndex v7 = v21;
          uint64_t v5 = v20;
          goto LABEL_50;
        }

        int v12 = *v16;
LABEL_48:
        CFIndex v7 = v21;
        uint64_t v5 = v20;
        if (!v12) {
          goto LABEL_49;
        }
        goto LABEL_28;
      }

      int v12 = 93;
      --v16;
      CFIndex v7 = v21;
      uint64_t v5 = v20;
      if (v13)
      {
LABEL_29:
        if (v14) {
          goto LABEL_50;
        }
      }

      while (1)
      {
        if (v12 == 58)
        {
          if (!v13) {
            CFTypeID v13 = (unsigned __int8 *)v16;
          }
          if (!v14 && v16[1] == 47) {
            goto LABEL_50;
          }
        }

        else if (v12 == 44)
        {
          goto LABEL_50;
        }

        int v19 = *++v16;
        int v12 = v19;
        if (!v19) {
          break;
        }
LABEL_28:
        if (v13) {
          goto LABEL_29;
        }
      }

LABEL_49:
      CFTypeID v16 = (char *)v13;
      if (!v13)
      {
        uint64_t v35 = 22LL;
        goto LABEL_91;
      }

LABEL_50:
      char v25 = *v16;
      *CFTypeID v16 = 0;
      v11[1] = strdup(v4);
      *CFTypeID v16 = v25;
      if (!v11[1])
      {
        uint64_t v35 = 12LL;
LABEL_91:
        free(v5);
        goto LABEL_92;
      }

      __int128 v26 = v43;
      if (v9) {
        __int128 v26 = v9;
      }
      *__int128 v26 = v11;
      ++*((_DWORD *)v5 + 6);
      if (*v16 != 44) {
        break;
      }
      int v4 = v16 + 1;
      ssize_t v9 = v11;
      if (!v16[1]) {
        goto LABEL_86;
      }
    }

    if (!strncmp(v16, v7, 6uLL)) {
      __int128 v27 = v16;
    }
    else {
      __int128 v27 = v16 + 1;
    }
    if (!*v27)
    {
      if (!v13)
      {
LABEL_86:
        uint64_t v35 = 22LL;
        goto LABEL_88;
      }

      __int128 v27 = (const char *)(v13 + 1);
    }

    for (i = (char *)v27; ; ++i)
    {
      int v29 = *i;
      if (!*i) {
        break;
      }
      if (v29 == 44)
      {
        uint64_t v30 = i;
        do
        {
          int v32 = *++v30;
          int v31 = v32;
        }

        while (v32 != 58 && v31 != 0);
        if (!v31) {
          i = v30;
        }
        int v29 = *i;
        break;
      }
    }

    char *i = 0;
    *((void *)v5 + 2) = strdup(v27);
    char *i = v29;
    if (*((void *)v5 + 2))
    {
      int v34 = v5;
      if (v41)
      {
        *uint64_t v41 = v5;
        int v29 = *i;
        int v34 = v6;
      }

      if (v29 == 44) {
        int v4 = i + 1;
      }
      else {
        int v4 = i;
      }
      CFIndex v6 = v34;
      if (!*v4)
      {
        if (!v34)
        {
          uint64_t v35 = 22LL;
          int v4 = v42;
          goto LABEL_96;
        }

        free(v42);
        uint64_t v35 = 0LL;
        *uint64_t v40 = v34;
        return v35;
      }

      continue;
    }

    break;
  }

LABEL_87:
  uint64_t v35 = 12LL;
LABEL_88:
  uint64_t v11 = v5;
LABEL_92:
  int v4 = v42;
  free(v11);
  if (v6)
  {
    do
    {
LABEL_93:
      unint64_t v36 = (void *)v6[1];
      if (v36)
      {
        do
        {
          uint64_t v37 = (void *)*v36;
          free(v36);
          v6[1] = v37;
          unint64_t v36 = v37;
        }

        while (v37);
      }

      unsigned int v38 = (void *)*v6;
      free(v6);
      CFIndex v6 = v38;
    }

    while (v38);
  }

LABEL_96:
  free(v4);
  return v35;
}

uint64_t sub_10000727C(uint64_t result, _DWORD *a2)
{
  *a2 = 0;
  if (result)
  {
    uint64_t v3 = (void *)result;
    do
    {
      for (i = (void *)v3[1]; i; i = (void *)*i)
      {
        uint64_t result = sub_100009A74((uint64_t)i);
        if (!(_DWORD)result)
        {
          if (i[2]) {
            ++*a2;
          }
        }
      }

      uint64_t v3 = (void *)*v3;
    }

    while (v3);
  }

  return result;
}

uint64_t sub_1000072E4(uint64_t **a1, const char *a2)
{
  int v3 = dword_100010928[0];
  printf("mount flags: 0x%x", dword_100010928[0]);
  if (v3)
  {
    int v4 = (const char **)&off_10000C2A0;
    do
    {
      int v5 = *((_DWORD *)v4 - 2);
      if (!v5) {
        break;
      }
      if ((v5 & v3) != 0)
      {
        printf(", %s", *v4);
        v3 &= ~v5;
      }

      v4 += 2;
    }

    while (v3);
  }

  putchar(10);
  if (dword_1000109F8 > 1)
  {
    if (dword_1000109F8 != 2 && dword_1000109F8 != 30) {
      goto LABEL_23;
    }
  }

  else if (dword_1000109F8)
  {
    if (dword_1000109F8 == 1) {
      printf("socket: type:%s");
    }
    goto LABEL_23;
  }

  CFIndex v7 = "any";
  if (HIDWORD(xmmword_1000109E8) == 2) {
    CFIndex v7 = "udp";
  }
  if (HIDWORD(xmmword_1000109E8) == 1) {
    BOOL v8 = "tcp";
  }
  else {
    BOOL v8 = v7;
  }
  printf("socket: type:%s", v8);
  if (dword_1000109F8) {
    printf("%s%s");
  }
LABEL_23:
  int v9 = qword_10001092C;
  if ((qword_10001092C & 0x8000) != 0)
  {
    printf(",port=%d", dword_1000109FC);
    int v9 = qword_10001092C;
  }

  if ((v9 & 0x10000) != 0) {
    printf(",mountport=%d", dword_100010A00);
  }
  if ((qword_100010934 & 0x10000) != 0 || dword_100010920 >= 2)
  {
    if ((qword_100010934 & 0x1000000000000LL) != 0) {
      uint64_t v10 = (const char *)&unk_10000B33F;
    }
    else {
      uint64_t v10 = "no";
    }
    printf(",%smntudp", v10);
  }

  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  *(_OWORD *)v72 = 0u;
  __int128 v73 = 0u;
  putchar(10);
  puts("file system locations:");
  if (a1)
  {
    while (1)
    {
      puts((const char *)a1[2]);
      uint64_t v11 = (uint64_t **)a1[1];
      if (v11) {
        break;
      }
LABEL_46:
      a1 = (uint64_t **)*a1;
      if (!a1) {
        goto LABEL_47;
      }
    }

    while (1)
    {
      printf("  %s\n", (const char *)v11[1]);
      int v12 = v11[2];
      if (v12) {
        break;
      }
LABEL_45:
      uint64_t v11 = (uint64_t **)*v11;
      if (!v11) {
        goto LABEL_46;
      }
    }

    while (1)
    {
      int v13 = *((_DWORD *)v12 + 1);
      if (v13 == 1)
      {
        printf("    local transport %s\n");
      }

      else
      {
        if (v13 == 30)
        {
          uint64_t v14 = (const void *)(v12[4] + 8);
        }

        else
        {
          if (v13 != 2)
          {
            puts("    ??? ???");
            goto LABEL_44;
          }

          uint64_t v14 = (const void *)(v12[4] + 4);
        }

        inet_ntop(v13, v14, v72, 0x80u);
        printf("    %s %s\n");
      }

LABEL_44:
      int v12 = (uint64_t *)v12[5];
      if (!v12) {
        goto LABEL_45;
      }
    }
  }

LABEL_47:
  if ((qword_10001092C & 0x100000) != 0)
  {
    printf("fh %d ", dword_100010A38);
    if (dword_100010A38 >= 1)
    {
      uint64_t v15 = 0LL;
      do
        printf("%02x", *((unsigned __int8 *)&dword_100010A38 + v15++ + 4));
      while (v15 < dword_100010A38);
    }

    putchar(10);
  }

  printf("NFS options:");
  if ((dword_10001091C & 1) != 0) {
    CFTypeID v16 = "bg";
  }
  else {
    CFTypeID v16 = "fg";
  }
  printf(" %s,retrycnt=%d", v16, dword_1000108F8);
  int v17 = qword_10001092C;
  if ((qword_10001092C & 2) != 0)
  {
    printf(",vers=%d", (_DWORD)xmmword_10001093C);
    int v17 = qword_10001092C;
    if ((qword_10001092C & 4) != 0)
    {
      printf(".%d", DWORD1(xmmword_10001093C));
      int v17 = qword_10001092C;
    }
  }

  if ((v17 & 0x8000000) != 0)
  {
    printf(",vers=%d", HIWORD(xmmword_10001093C));
    if (WORD6(xmmword_10001093C)) {
      printf(".%d", WORD6(xmmword_10001093C));
    }
    printf("-%d", WORD5(xmmword_10001093C));
    if (WORD4(xmmword_10001093C)) {
      printf(".%d", WORD4(xmmword_10001093C));
    }
  }

  __int16 v18 = qword_100010934;
  if ((qword_100010934 & 1) != 0 || (int v19 = dword_100010920, dword_100010920 >= 2))
  {
    if ((qword_100010934 & 0x100000000LL) != 0) {
      size_t v20 = "soft";
    }
    else {
      size_t v20 = "hard";
    }
    printf(",%s", v20);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }

  if ((v18 & 2) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x200000000LL) != 0) {
      uint64_t v21 = (const char *)&unk_10000B33F;
    }
    else {
      uint64_t v21 = "no";
    }
    printf(",%sintr", v21);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }

  if ((v18 & 4) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x400000000LL) != 0) {
      uint64_t v22 = (const char *)&unk_10000B33F;
    }
    else {
      uint64_t v22 = "no";
    }
    printf(",%sresvport", v22);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }

  if ((v18 & 8) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x800000000LL) != 0) {
      int v23 = "no";
    }
    else {
      int v23 = (const char *)&unk_10000B33F;
    }
    printf(",%sconn", v23);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }

  if ((v18 & 0x400) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x40000000000LL) != 0) {
      int v24 = "no";
    }
    else {
      int v24 = (const char *)&unk_10000B33F;
    }
    printf(",%scallback", v24);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }

  if ((v18 & 0x80) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x8000000000LL) != 0) {
      char v25 = "no";
    }
    else {
      char v25 = (const char *)&unk_10000B33F;
    }
    printf(",%snegnamecache", v25);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }

  if ((v18 & 0x800) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x80000000000LL) != 0) {
      __int128 v26 = (const char *)&unk_10000B33F;
    }
    else {
      __int128 v26 = "no";
    }
    printf(",%snamedattr", v26);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }

  if ((v18 & 0x1000) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x100000000000LL) != 0) {
      __int128 v27 = "no";
    }
    else {
      __int128 v27 = (const char *)&unk_10000B33F;
    }
    printf(",%sacl", v27);
    __int16 v18 = qword_100010934;
    int v19 = dword_100010920;
  }

  if ((v18 & 0x2000) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x200000000000LL) != 0) {
      __int128 v28 = (const char *)&unk_10000B33F;
    }
    else {
      __int128 v28 = "no";
    }
    printf(",%saclonly", v28);
    LOBYTE(v18) = qword_100010934;
    int v19 = dword_100010920;
  }

  if ((v18 & 0x20) != 0 || v19 >= 2)
  {
    if ((qword_100010934 & 0x2000000000LL) != 0) {
      int v29 = (const char *)&unk_10000B33F;
    }
    else {
      int v29 = "no";
    }
    printf(",%scallumnt", v29);
    int v19 = dword_100010920;
  }

  if ((qword_100010934 & 0x8000) != 0 || (int v30 = dword_100010920, dword_100010920 >= 2))
  {
    if ((qword_100010934 & 0x800000000000LL) != 0) {
      int v31 = "no";
    }
    else {
      int v31 = (const char *)&unk_10000B33F;
    }
    printf(",%squota", v31);
    int v30 = dword_100010920;
  }

  char v32 = qword_10001092C;
  if ((qword_10001092C & 8) != 0 || v30 >= 2)
  {
    if ((qword_10001092C & 8) != 0) {
      int v33 = dword_10001094C;
    }
    else {
      int v33 = 0x8000;
    }
    printf(",rsize=%d", v33);
    char v32 = qword_10001092C;
    int v30 = dword_100010920;
  }

  if ((v32 & 0x10) != 0 || v30 >= 2)
  {
    if ((v32 & 0x10) != 0) {
      int v34 = dword_100010950;
    }
    else {
      int v34 = 0x8000;
    }
    printf(",wsize=%d", v34);
    char v32 = qword_10001092C;
    int v30 = dword_100010920;
  }

  if ((v32 & 0x40) != 0 || v30 >= 2)
  {
    if ((v32 & 0x40) != 0) {
      int v35 = dword_100010958;
    }
    else {
      int v35 = 16;
    }
    printf(",readahead=%d", v35);
    char v32 = qword_10001092C;
    int v30 = dword_100010920;
  }

  if ((v32 & 0x20) != 0 || v30 >= 2)
  {
    if ((v32 & 0x20) != 0) {
      int v36 = dword_100010954;
    }
    else {
      int v36 = 0x8000;
    }
    printf(",dsize=%d", v36);
    int v30 = dword_100010920;
  }

  char v37 = qword_100010934;
  if ((qword_100010934 & 0x40) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x4000000000LL) != 0) {
      unsigned int v38 = (const char *)&unk_10000B33F;
    }
    else {
      unsigned int v38 = "no";
    }
    printf(",%srdirplus", v38);
    char v37 = qword_100010934;
    int v30 = dword_100010920;
  }

  if ((v37 & 0x10) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x1000000000LL) != 0) {
      unint64_t v39 = (const char *)&unk_10000B33F;
    }
    else {
      unint64_t v39 = "no";
    }
    printf(",%sdumbtimer", v39);
    int v30 = dword_100010920;
  }

  int v40 = qword_10001092C;
  if ((qword_10001092C & 0x20000) != 0 || v30 >= 2)
  {
    if ((qword_10001092C & 0x20000) != 0) {
      uint64_t v41 = *((void *)&xmmword_100010A08 + 1) % 100000000LL + 10 * xmmword_100010A08;
    }
    else {
      uint64_t v41 = 10LL;
    }
    printf(",timeo=%ld", v41);
    int v40 = qword_10001092C;
    int v30 = dword_100010920;
  }

  if ((v40 & 0x40000) != 0 || v30 >= 2)
  {
    if ((v40 & 0x40000) != 0) {
      int v42 = dword_100010A18;
    }
    else {
      int v42 = 10;
    }
    printf(",retrans=%d", v42);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }

  if ((v40 & 0x2000) != 0 || v30 >= 2)
  {
    if ((v40 & 0x2000) != 0) {
      int v43 = DWORD2(xmmword_1000109E8);
    }
    else {
      int v43 = 16;
    }
    printf(",maxgroups=%d", v43);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }

  if ((v40 & 0x80) != 0 || v30 >= 2)
  {
    uint64_t v44 = *(void *)&dword_100010960;
    if ((v40 & 0x80) == 0) {
      uint64_t v44 = 5LL;
    }
    printf(",acregmin=%ld", v44);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }

  if ((v40 & 0x100) != 0 || v30 >= 2)
  {
    uint64_t v45 = *((void *)&xmmword_100010968 + 1);
    if ((v40 & 0x100) == 0) {
      uint64_t v45 = 60LL;
    }
    printf(",acregmax=%ld", v45);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }

  if ((v40 & 0x200) != 0 || v30 >= 2)
  {
    uint64_t v46 = *(void *)&dword_100010980;
    if ((v40 & 0x200) == 0) {
      uint64_t v46 = 5LL;
    }
    printf(",acdirmin=%ld", v46);
    LOWORD(v40) = qword_10001092C;
    int v30 = dword_100010920;
  }

  if ((v40 & 0x400) != 0 || v30 >= 2)
  {
    uint64_t v47 = *((void *)&xmmword_100010988 + 1);
    if ((v40 & 0x400) == 0) {
      uint64_t v47 = 60LL;
    }
    printf(",acdirmax=%ld", v47);
    int v30 = dword_100010920;
  }

  char v48 = BYTE4(qword_10001092C);
  if ((qword_10001092C & 0x200000000LL) != 0 || v30 >= 2)
  {
    uint64_t v49 = qword_1000109A0;
    if ((qword_10001092C & 0x200000000LL) == 0) {
      uint64_t v49 = 5LL;
    }
    printf(",acrootdirmin=%ld", v49);
    char v48 = BYTE4(qword_10001092C);
    int v30 = dword_100010920;
  }

  if ((v48 & 4) != 0 || v30 >= 2)
  {
    uint64_t v50 = *((void *)&xmmword_1000109A8 + 1);
    if ((v48 & 4) == 0) {
      uint64_t v50 = 60LL;
    }
    printf(",acrootdirmax=%ld", v50);
    int v30 = dword_100010920;
  }

  if ((qword_10001092C & 0x80000) != 0 || v30 >= 2)
  {
    uint64_t v51 = xmmword_100010A28;
    if ((qword_10001092C & 0x80000) == 0) {
      uint64_t v51 = 0LL;
    }
    printf(",deadtimeout=%ld", v51);
    int v30 = dword_100010920;
  }

  __int16 v52 = qword_100010934;
  if ((qword_100010934 & 0x100) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x10000000000LL) != 0) {
      int v53 = (const char *)&unk_10000B33F;
    }
    else {
      int v53 = "no";
    }
    printf(",%smutejukebox", v53);
    __int16 v52 = qword_100010934;
    int v30 = dword_100010920;
  }

  if ((v52 & 0x200) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x20000000000LL) != 0) {
      uint64_t v54 = (const char *)&unk_10000B33F;
    }
    else {
      uint64_t v54 = "no";
    }
    printf(",%sephemeral", v54);
    __int16 v52 = qword_100010934;
    int v30 = dword_100010920;
  }

  if ((v52 & 0x4000) != 0 || v30 >= 2)
  {
    if ((qword_100010934 & 0x400000000000LL) != 0) {
      int v55 = (const char *)&unk_10000B33F;
    }
    else {
      int v55 = "no";
    }
    printf(",%snfc", v55);
  }

  if ((qword_10001092C & 0x1000) == 0) {
    goto LABEL_267;
  }
  if (SHIDWORD(qword_1000109C4) <= 390002)
  {
    if (!HIDWORD(qword_1000109C4))
    {
      int v56 = "none";
      goto LABEL_253;
    }

    if (HIDWORD(qword_1000109C4) == 1)
    {
      int v56 = "sys";
      goto LABEL_253;
    }
  }

  else
  {
    switch(HIDWORD(qword_1000109C4))
    {
      case 0x5F373:
        int v56 = "krb5";
        goto LABEL_253;
      case 0x5F374:
        int v56 = "krb5i";
        goto LABEL_253;
      case 0x5F375:
        int v56 = "krb5p";
        goto LABEL_253;
    }
  }

  int v56 = "?";
LABEL_253:
  printf(",sec=%s", v56);
  if ((int)qword_1000109C4 >= 2)
  {
    for (uint64_t i = 41LL; i - 40 < (int)qword_1000109C4; ++i)
    {
      int v58 = dword_100010928[i];
      if (v58 <= 390002)
      {
        int v59 = "none";
        if (v58)
        {
          if (v58 != 1)
          {
LABEL_265:
            int v59 = "?";
            goto LABEL_266;
          }

          int v59 = "sys";
        }
      }

      else
      {
        switch(v58)
        {
          case 390003:
            int v59 = "krb5";
            break;
          case 390004:
            int v59 = "krb5i";
            break;
          case 390005:
            int v59 = "krb5p";
            break;
          default:
            goto LABEL_265;
        }
      }

LABEL_266:
      printf(":%s", v59);
    }
  }

LABEL_267:
  if ((qword_10001092C & 0x10000000) != 0)
  {
    v60 = (dword_1000109E4 - 16) > 2 ? "?" : (&off_10000C420)[dword_1000109E4 - 16];
    printf(",etype=%s", v60);
    if (qword_1000109DC >= 2)
    {
      uint64_t v61 = 48LL;
      do
      {
        unsigned int v62 = dword_100010928[v61] - 16;
        v63 = "?";
        if (v62 <= 2) {
          v63 = (&off_10000C420)[v62];
        }
        ++v61;
        printf(":%s", v63);
      }

      while (v61 - 47 < (unint64_t)qword_1000109DC);
    }
  }

  int v64 = qword_10001092C;
  if ((qword_10001092C & 0x1000000) != 0)
  {
    printf(",realm=%s", (const char *)qword_100010AC0);
    int v64 = qword_10001092C;
  }

  if ((v64 & 0x2000000) != 0)
  {
    printf(",principal=%s", (const char *)xmmword_100010AC8);
    int v64 = qword_10001092C;
  }

  if ((v64 & 0x4000000) != 0) {
    printf(",sprincipal=%s", *((const char **)&xmmword_100010AC8 + 1));
  }
  char v65 = BYTE4(qword_10001092C);
  if ((qword_10001092C & 0x100000000LL) != 0 || dword_100010920 >= 2)
  {
    if ((qword_10001092C & 0x100000000LL) != 0) {
      int v66 = dword_100010A1C;
    }
    else {
      int v66 = 0;
    }
    printf(",readlink_nocache=%d", v66);
    char v65 = BYTE4(qword_10001092C);
  }

  if ((v65 & 8) != 0) {
    printf(",accesscache=%d", dword_100010A20);
  }
  int v67 = qword_100010934;
  if ((qword_100010934 & 0x80000) != 0 || (int v68 = dword_100010920, dword_100010920 >= 2))
  {
    if ((qword_100010934 & 0x8000000000000LL) != 0) {
      int v69 = "no";
    }
    else {
      int v69 = (const char *)&unk_10000B33F;
    }
    printf(",%sopaque_auth", v69);
    int v67 = qword_100010934;
    int v68 = dword_100010920;
  }

  if ((v67 & 0x100000) != 0 || v68 >= 2)
  {
    if ((qword_100010934 & 0x10000000000000LL) != 0) {
      v70 = (const char *)&unk_10000B33F;
    }
    else {
      v70 = "no";
    }
    printf(",%sskip_renew", v70);
  }

  return putchar(10);
}

uint64_t sub_100008214(uint64_t a1, void *a2)
{
  *a2 = 0LL;
  int v3 = qword_10001092C;
  int v4 = qword_10001092C | 0x600000;
  uint64_t v79 = qword_10001092C | 0x600000;
  if ((_DWORD)qword_100010AE8 && qword_100010910 && !strncmp((const char *)qword_100010910, "ftp://", 6uLL))
  {
    int v4 = v3 | 0xE00000;
    LODWORD(v79) = v3 | 0xE00000;
  }

  if ((_DWORD)qword_100010934)
  {
    v4 |= 1u;
    LODWORD(v79) = v4;
  }

  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v85 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  *(_OWORD *)__s = 0u;
  *(void *)v80 = 0LL;
  uint64_t v81 = 0LL;
  uint64_t v78 = 0x100000001LL;
  v73[0] = 0LL;
  v73[1] = 0LL;
  uint64_t v76 = 0LL;
  uint64_t v77 = 512LL;
  uint64_t v74 = 0LL;
  __int128 v75 = 0LL;
  unsigned int __src = 1476395008;
  uint64_t v5 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  if ((_DWORD)v78 == 1) {
    uint64_t v6 = v75 - (char *)v73[0];
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v70 = v6;
  if (!(_DWORD)v5)
  {
    unsigned int __src = 0;
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((_DWORD)v7) {
      goto LABEL_14;
    }
    unsigned int __src = 0;
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((_DWORD)v7) {
      goto LABEL_14;
    }
    unsigned int __src = 0x2000000;
    uint64_t v5 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }

  uint64_t v7 = v5;
LABEL_14:
  uint64_t v8 = 0LL;
  char v9 = 1;
  do
  {
    char v10 = v9;
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(*(_DWORD *)&v80[4 * v8 - 8]);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }

    char v9 = 0;
    uint64_t v8 = 1LL;
  }

  while ((v10 & 1) != 0);
  if ((_DWORD)v78 == 1) {
    uint64_t v11 = v75 - (char *)v73[0];
  }
  else {
    uint64_t v11 = 0LL;
  }
  uint64_t v69 = v11;
  if ((_DWORD)v7)
  {
    if ((v4 & 1) == 0) {
      goto LABEL_30;
    }
  }

  else
  {
    unsigned int __src = 0;
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 1) == 0) {
      goto LABEL_30;
    }
  }

  if (!(_DWORD)v7)
  {
    unsigned int __src = 0x1000000;
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(qword_100010934);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        unsigned int __src = 0x1000000;
        uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
        if (!(_DWORD)v7)
        {
          unsigned int __src = bswap32(HIDWORD(qword_100010934));
          uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
        }
      }
    }
  }

LABEL_30:
  if ((v4 & 2) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(xmmword_10001093C);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 4) == 0) {
      goto LABEL_36;
    }
  }

  else if ((v4 & 4) == 0)
  {
    goto LABEL_36;
  }

  if (!(_DWORD)v7)
  {
    unsigned int __src = bswap32(DWORD1(xmmword_10001093C));
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }

LABEL_46:
  if ((v4 & 0x20) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010954);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x40) == 0) {
      goto LABEL_52;
    }
  }

  else if ((v4 & 0x40) == 0)
  {
    goto LABEL_52;
  }

  if (!(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010958);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }

LABEL_52:
  if ((v4 & 0x80) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010960);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(xmmword_100010968);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }

  if ((v4 & 0x100) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(DWORD2(xmmword_100010968));
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(dword_100010978);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }

  if ((v4 & 0x200) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010980);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(xmmword_100010988);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }

  if ((v4 & 0x400) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(DWORD2(xmmword_100010988));
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(dword_100010998);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }

  if ((v4 & 0x800) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_1000109C0);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x1000) == 0) {
      goto LABEL_80;
    }
  }

  else if ((v4 & 0x1000) == 0)
  {
    goto LABEL_80;
  }

  if (!(_DWORD)v7)
  {
    unsigned int __src = bswap32(qword_1000109C4);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }

  unint64_t v12 = qword_1000109C4;
  if ((_DWORD)qword_1000109C4)
  {
    unint64_t v13 = 0LL;
    do
    {
      if (!(_DWORD)v7)
      {
        unsigned int __src = bswap32(*((_DWORD *)&qword_1000109C4 + v13 + 1));
        uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
        unint64_t v12 = qword_1000109C4;
      }

      ++v13;
    }

    while (v13 < v12);
  }

LABEL_80:
  if ((v4 & 0x10000000) != 0)
  {
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(qword_1000109DC);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        unsigned int __src = bswap32(HIDWORD(qword_1000109DC));
        uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      }
    }

    unint64_t v14 = qword_1000109DC;
    if ((_DWORD)qword_1000109DC)
    {
      unint64_t v15 = 0LL;
      do
      {
        if (!(_DWORD)v7)
        {
          unsigned int __src = bswap32(*((_DWORD *)&qword_1000109DC + v15 + 2));
          uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
          unint64_t v14 = qword_1000109DC;
        }

        ++v15;
      }

      while (v15 < v14);
    }
  }

  if ((v4 & 0x2000) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(unk_1000109F0);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x4000) == 0) {
      goto LABEL_122;
    }
  }

  else if ((v4 & 0x4000) == 0)
  {
    goto LABEL_122;
  }

  if (SHIDWORD(qword_1000109F4) > 1)
  {
    if (HIDWORD(qword_1000109F4) != 2 && HIDWORD(qword_1000109F4) != 30) {
      goto LABEL_116;
    }
    goto LABEL_99;
  }

  if (!HIDWORD(qword_1000109F4))
  {
LABEL_99:
    int v17 = (const char *)&unk_10000B33F;
    if (HIDWORD(qword_1000109F4) == 2) {
      int v17 = "4";
    }
    if (HIDWORD(qword_1000109F4) == 30) {
      __int16 v18 = "6";
    }
    else {
      __int16 v18 = v17;
    }
    int v19 = "inet";
    if ((_DWORD)qword_1000109F4)
    {
      if ((_DWORD)qword_1000109F4 == 2) {
        int v19 = "udp";
      }
      BOOL v20 = (_DWORD)qword_1000109F4 == 1;
    }

    else
    {
      if (dword_100010918 == 17) {
        int v19 = "udp";
      }
      BOOL v20 = dword_100010918 == 6;
    }

    if (v20) {
      int v19 = "tcp";
    }
    snprintf(byte_100010B04, 0x10uLL, "%s%s", v19, v18);
    goto LABEL_116;
  }

  if (HIDWORD(qword_1000109F4) == 1)
  {
    if ((_DWORD)qword_1000109F4 == 2) {
      CFTypeID v16 = "ticlts";
    }
    else {
      CFTypeID v16 = "ticotsord";
    }
    __strlcpy_chk(byte_100010B04, v16, 16LL, 16LL);
    if ((_DWORD)v7) {
      goto LABEL_122;
    }
    goto LABEL_117;
  }

LABEL_116:
  if ((_DWORD)v7) {
    goto LABEL_122;
  }
LABEL_117:
  unsigned int __src = bswap32(strlen(byte_100010B04));
  uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  if (!(_DWORD)v7)
  {
    size_t v21 = strlen(byte_100010B04);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, byte_100010B04, v21, 0);
  }

LABEL_122:
  if ((v4 & 0x8000) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_1000109FC);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x10000) == 0) {
      goto LABEL_128;
    }
  }

  else if ((v4 & 0x10000) == 0)
  {
    goto LABEL_128;
  }

  if (!(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010A00);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }

LABEL_128:
  if ((v4 & 0x20000) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(xmmword_100010A08);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(DWORD2(xmmword_100010A08));
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }

  if ((v4 & 0x40000) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010A18);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v4 & 0x80000) == 0) {
      goto LABEL_139;
    }
  }

  else if ((v4 & 0x80000) == 0)
  {
    goto LABEL_139;
  }

  if (!(_DWORD)v7)
  {
    unsigned int __src = bswap32(xmmword_100010A28);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(DWORD2(xmmword_100010A28));
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }

LABEL_139:
  if ((v4 & 0x100000) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010A38);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7) {
      uint64_t v7 = sub_100003BA0((uint64_t)v73, byte_100010A3C, dword_100010A38, 0);
    }
  }

  unsigned int v22 = 0;
  if (a1)
  {
    int v23 = (void *)a1;
    do
    {
      ++v22;
      int v23 = (void *)*v23;
    }

    while (v23);
  }

  if (!(_DWORD)v7)
  {
    unsigned int __src = bswap32(v22);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }

  if (!a1) {
    goto LABEL_224;
  }
  do
  {
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(*(_DWORD *)(a1 + 24));
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }

    uint64_t v71 = (uint64_t *)a1;
    int v24 = *(uint64_t ***)(a1 + 8);
    if (v24)
    {
      while (1)
      {
        unsigned int __src = 0;
        if (!(_DWORD)v7)
        {
          unsigned int __src = bswap32(strlen((const char *)v24[1]));
          uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
          if (!(_DWORD)v7)
          {
            size_t v25 = strlen((const char *)v24[1]);
            uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)v24[1], v25, 0);
          }
        }

        __int128 v26 = v24[2];
        if (v26)
        {
          unsigned int v27 = 0;
          __int128 v28 = v24[2];
          do
          {
            ++v27;
            __int128 v28 = (uint64_t *)v28[5];
          }

          while (v28);
          if ((_DWORD)v7)
          {
LABEL_159:
            if (v26) {
              break;
            }
            goto LABEL_190;
          }
        }

        else
        {
          unsigned int v27 = 0;
          if ((_DWORD)v7) {
            goto LABEL_159;
          }
        }

        unsigned int __src = bswap32(v27);
        uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
        __int128 v26 = v24[2];
        if (v26) {
          break;
        }
LABEL_190:
        if (!(_DWORD)v7)
        {
          unsigned int __src = 0;
          uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
        }

        int v24 = (uint64_t **)*v24;
        if (!v24) {
          goto LABEL_193;
        }
      }

      while (1)
      {
        int v29 = (unsigned __int8 *)v26[4];
        int v30 = v29[1];
        if (v30 != 30 && v30 != 2) {
          break;
        }
        int v32 = *((_DWORD *)v26 + 1);
        int v33 = v29 + 4;
        int v34 = v29 + 8;
        if (v32 == 2) {
          int v35 = v33;
        }
        else {
          int v35 = v34;
        }
        if (inet_ntop(v32, v35, __s, 0x80u) != __s)
        {
          warn("unable to convert server address to string");
          uint64_t v7 = *__error();
        }

        if (*((_DWORD *)v26 + 1) != 30) {
          goto LABEL_180;
        }
        uint64_t v36 = v26[4];
        int v37 = *(_DWORD *)(v36 + 24);
        if (!v37) {
          goto LABEL_180;
        }
        if (if_indextoname(*(_DWORD *)(v36 + 24), v80))
        {
          size_t v38 = strlen(__s);
          if (128 - v38 >= 0x10) {
            size_t v39 = 16LL;
          }
          else {
            size_t v39 = 128 - v38;
          }
          snprintf(&__s[v38], v39, "%%%s", v80);
          if (!(_DWORD)v7)
          {
LABEL_181:
            unsigned int __src = bswap32(strlen(__s));
            uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
            if (!(_DWORD)v7)
            {
              size_t v40 = strlen(__s);
              uint64_t v7 = sub_100003BA0((uint64_t)v73, __s, v40, 0);
            }
          }
        }

        else
        {
          warn("unable to convert scope_id %u to interface name", v37);
          uint64_t v7 = *__error();
          if (!(_DWORD)v7) {
            goto LABEL_181;
          }
        }

LABEL_183:
        __int128 v26 = (uint64_t *)v26[5];
        if (!v26) {
          goto LABEL_190;
        }
      }

      if (v30 != 1)
      {
        warn("Unsupported addres family %d", v29[1]);
        uint64_t v7 = 45LL;
        goto LABEL_183;
      }

      __strlcpy_chk(__s, v29 + 2, 128LL, 128LL);
LABEL_180:
      if (!(_DWORD)v7) {
        goto LABEL_181;
      }
      goto LABEL_183;
    }

LABEL_193:
    uint64_t v41 = v71;
    uint64_t v42 = v71[2];
    uint64_t v43 = v42 - 1;
    do
    {
      int v45 = *(unsigned __int8 *)++v43;
      int v44 = v45;
    }

    while (v45 == 47);
    for (unsigned int i = 0; v44; ++i)
    {
      uint64_t v47 = v43--;
      while (v44 != 47 && v44)
      {
        int v48 = *(unsigned __int8 *)++v47;
        int v44 = v48;
        ++v43;
      }

      do
      {
        int v49 = *(unsigned __int8 *)++v43;
        int v44 = v49;
      }

      while (v49 == 47);
    }

    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(i);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      uint64_t v42 = v71[2];
    }

    uint64_t v50 = (char *)(v42 - 1);
    do
    {
      int v52 = *++v50;
      int v51 = v52;
    }

    while (v52 == 47);
    if (v51)
    {
      while (1)
      {
        unint64_t v53 = 0LL;
        uint64_t v54 = v50 - 1;
        while ((_BYTE)v51 && v51 != 47)
        {
          LOBYTE(v51) = v50[++v53];
          ++v54;
        }

        if ((_DWORD)v7) {
          break;
        }
        unsigned int __src = bswap32(v53);
        uint64_t v55 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
        if ((_DWORD)v55 || (uint64_t v55 = sub_100003BA0((uint64_t)v73, v50, v53, 0), (_DWORD)v55))
        {
          uint64_t v7 = v55;
          break;
        }

        uint64_t v50 = v54;
        uint64_t v41 = v71;
        do
        {
          int v56 = *++v50;
          int v51 = v56;
        }

        while (v56 == 47);
        if (!v51) {
          goto LABEL_208;
        }
        uint64_t v7 = 0LL;
      }

      uint64_t v41 = v71;
    }

    else if (!(_DWORD)v7)
    {
LABEL_208:
      unsigned int __src = 0;
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }

    a1 = *v41;
  }

  while (a1);
LABEL_224:
  if (!(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010928[0]);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  }

  int v57 = v79;
  if ((v79 & 0x800000) != 0)
  {
    unsigned int __src = 0;
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(strlen((const char *)qword_100010910));
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        size_t v58 = strlen((const char *)qword_100010910);
        uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)qword_100010910, v58, 0);
      }
    }
  }

  if ((v57 & 0x1000000) != 0)
  {
    unsigned int __src = 0;
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(strlen((const char *)qword_100010AC0));
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        size_t v59 = strlen((const char *)qword_100010AC0);
        uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)qword_100010AC0, v59, 0);
      }
    }
  }

  if ((v57 & 0x2000000) != 0)
  {
    unsigned int __src = 0;
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(strlen((const char *)xmmword_100010AC8));
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        size_t v60 = strlen((const char *)xmmword_100010AC8);
        uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)xmmword_100010AC8, v60, 0);
      }
    }
  }

  if ((v57 & 0x4000000) != 0)
  {
    unsigned int __src = 0;
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(strlen(*((const char **)&xmmword_100010AC8 + 1)));
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        size_t v61 = strlen(*((const char **)&xmmword_100010AC8 + 1));
        uint64_t v7 = sub_100003BA0((uint64_t)v73, *((char **)&xmmword_100010AC8 + 1), v61, 0);
      }
    }
  }

  if ((v57 & 0x20000000) != 0)
  {
    unsigned int __src = 0;
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(strlen((const char *)xmmword_100010AD8));
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        size_t v62 = strlen((const char *)xmmword_100010AD8);
        uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)xmmword_100010AD8, v62, 0);
      }
    }
  }

  if ((v57 & 0x40000000) != 0)
  {
    unsigned int __src = 0;
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(strlen(*((const char **)&xmmword_100010AD8 + 1)));
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
      if (!(_DWORD)v7)
      {
        size_t v63 = strlen(*((const char **)&xmmword_100010AD8 + 1));
        uint64_t v7 = sub_100003BA0((uint64_t)v73, *((char **)&xmmword_100010AD8 + 1), v63, 0);
      }
    }
  }

  char v64 = BYTE4(v79);
  if ((v79 & 0x100000000LL) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010A1C);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((v64 & 2) == 0) {
      goto LABEL_257;
    }
  }

  else if ((v79 & 0x200000000LL) == 0)
  {
    goto LABEL_257;
  }

  if (!(_DWORD)v7)
  {
    unsigned int __src = bswap32(qword_1000109A0);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(xmmword_1000109A8);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }

LABEL_257:
  if ((v64 & 4) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(DWORD2(xmmword_1000109A8));
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      unsigned int __src = bswap32(dword_1000109B8);
      uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    }
  }

  if ((v64 & 8) != 0 && !(_DWORD)v7)
  {
    unsigned int __src = bswap32(dword_100010A20);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if ((_DWORD)v7) {
      goto LABEL_274;
    }
  }

  else if ((_DWORD)v7)
  {
    goto LABEL_274;
  }

  if ((_DWORD)v78 == 1)
  {
    uint64_t v65 = v75 - (char *)v73[0];
    int v66 = v70;
    uint64_t v74 = v65;
    __int128 v75 = (char *)v73[0] + v70;
    uint64_t v76 = v65 - v70;
  }

  else
  {
    LODWORD(v65) = 0;
    int v66 = v70;
  }

  unsigned int __src = bswap32(v65 - v66 + 4);
  uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
  if (!(_DWORD)v7)
  {
    if ((_DWORD)v78 == 1)
    {
      __int128 v75 = (char *)v73[0] + v69;
      uint64_t v76 = v74 - v69;
    }

    unsigned int __src = bswap32(v65 - v69 - 4);
    uint64_t v7 = sub_100003BA0((uint64_t)v73, (char *)&__src, 4uLL, 0);
    if (!(_DWORD)v7)
    {
      *a2 = v73[0];
      HIDWORD(v78) &= ~1u;
    }
  }

LABEL_274:
  if ((v78 & 0x100000000LL) != 0 && (_DWORD)v78 == 1 && v73[0]) {
    free(v73[0]);
  }
  return v7;
}

uint64_t sub_100009544(uint64_t a1)
{
  __int128 v5 = xmmword_10000A560;
  int v4 = -1;
  *(_DWORD *)((uint64_t (*)(void))_newrpclib___rpc_createerr)() = 0;
  if (HIDWORD(xmmword_1000109E8) == 2)
  {
    uint64_t v2 = _newrpclib_clntudp_bufcreate_timeout(a1, 100024LL, 1LL, &v4, 0x10000LL, 0x10000LL, 0LL, &v5);
    if (!v2) {
      return *(unsigned int *)_newrpclib___rpc_createerr(v2);
    }
    goto LABEL_5;
  }

  uint64_t v2 = _newrpclib_clnttcp_create_timeout(a1, 100024LL, 1LL, &v4, 0x10000LL, 0x10000LL, 0LL, &v5);
  if (v2) {
LABEL_5:
  }
    uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(v2 + 8) + 32LL))();
  return *(unsigned int *)_newrpclib___rpc_createerr(v2);
}

void sub_1000095EC(void *a1)
{
  if (a1)
  {
    CFTypeRef v1 = a1;
    do
    {
      for (unsigned int i = (void *)v1[1]; i; unsigned int i = (void *)*i)
      {
        int v3 = (addrinfo *)i[2];
        if (v3)
        {
          freeaddrinfo(v3);
          i[2] = 0LL;
        }
      }

      CFTypeRef v1 = (void *)*v1;
    }

    while (v1);
  }

void start(int a1, char *const *a2)
{
}

uint64_t sub_100009640(const char *a1, int *a2)
{
  if (a1)
  {
    int v3 = a1;
    printf("hstr = [%s]\n", a1);
    int v4 = strlen(v3);
    if ((v4 & 1) == 0)
    {
      if (v4 >= 0) {
        int v5 = v4;
      }
      else {
        int v5 = v4 + 1;
      }
      *a2 = v5 >> 1;
      LOBYTE(v5) = *v3;
      if (!*v3) {
        return 0LL;
      }
      uint64_t v6 = 0LL;
      uint64_t v7 = a2 + 1;
      uint64_t v8 = v3 + 1;
      while (1)
      {
        char v9 = off_100010900;
        __darwin_ct_rune_t v10 = __tolower((char)v5);
        uint64_t v11 = strchr(v9, v10);
        if (!v11) {
          break;
        }
        char v12 = (_BYTE)v11 - (_BYTE)v9;
        if ((v6 & 1) != 0)
        {
          unint64_t v14 = v7 + 1;
          char v13 = *v7 | v12 & 0xF;
        }

        else
        {
          char v13 = 16 * v12;
          unint64_t v14 = v7;
        }

        _BYTE *v7 = v13;
        int v5 = v8[v6++];
        uint64_t v7 = v14;
        if (!v5) {
          return 0LL;
        }
      }
    }
  }

  CFTypeID v16 = __error();
  uint64_t result = 22LL;
  *CFTypeID v16 = 22;
  return result;
}

char *sub_10000974C(int *a1)
{
  uint64_t v2 = *a1;
  size_t v3 = 2 * v2 + 3;
  int v4 = (char *)calloc(1uLL, v3);
  int v5 = v4;
  if (v4)
  {
    uint64_t v2 = v2;
    strlcpy(v4, "0x", v3);
    if ((int)v2 >= 1)
    {
      uint64_t v6 = (char *)(a1 + 1);
      uint64_t v7 = v5 + 3;
      do
      {
        *(v7 - 1) = off_100010900[(unint64_t)*v6 >> 4];
        char v8 = *v6++;
        _BYTE *v7 = off_100010900[v8 & 0xF];
        v7 += 2;
        --v2;
      }

      while (v2);
    }
  }

  return v5;
}

uint64_t sub_1000097F0(const char *a1, unsigned int *a2, unsigned int *a3)
{
  __endptr = 0LL;
  *a3 = 0;
  int v5 = a2;
  while (1)
  {
    uint64_t v6 = strtol(a1, &__endptr, 10);
    uint64_t v7 = __endptr;
    int v8 = *__endptr;
    if (*__endptr && v8 != 46)
    {
      if (v8 != 45 || v6 < 2 || v6 > 4) {
        return 0LL;
      }
    }

    else if ((unint64_t)(v6 - 5) < 0xFFFFFFFFFFFFFFFDLL)
    {
      return 0LL;
    }

    *int v5 = (_DWORD)v6 << 16;
    int v11 = *v7;
    if (v11 == 45) {
      goto LABEL_23;
    }
    if (v11 != 46) {
      break;
    }
    uint64_t v12 = strtol(v7 + 1, &__endptr, 10);
    unint64_t v13 = v12;
    uint64_t v7 = __endptr;
    if (*__endptr)
    {
      uint64_t result = 0LL;
      if (*__endptr != 45 || (v13 & 0x8000000000000000LL) != 0) {
        return result;
      }
    }

    else if (v12 < 0)
    {
      return 0LL;
    }

    unint64_t v15 = *v5;
    *int v5 = v15 | (unsigned __int16)v13;
    if (!*v7) {
      goto LABEL_27;
    }
LABEL_23:
    a1 = v7 + 1;
    BOOL v16 = v5 == a3;
    int v5 = a3;
    if (v16) {
      return 0LL;
    }
  }

  if (*v7) {
    return 0LL;
  }
LABEL_27:
  unsigned int v17 = *a3;
  if (*a3)
  {
    unsigned int v18 = *a2;
    if (*a2 > v17)
    {
      *a2 = v17;
      *a3 = v18;
    }
  }

  return 1LL;
}

void sub_100009934(const char *a1)
{
  CFTypeRef v1 = strdup(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    size_t v3 = strtok(v1, ",");
    if (v3)
    {
      int v4 = v3;
      do
      {
        int v5 = &v4[2 * (strncmp(v4, "no", 2uLL) == 0)];
        uint64_t v6 = strchr(v5, 61);
        if (v6) {
          *uint64_t v6 = 0;
        }
        uint64_t v7 = off_100010040;
        if (off_100010040)
        {
          int v8 = &off_100010058;
          while (strcasecmp(v5, v7))
          {
            char v9 = *v8;
            v8 += 3;
            uint64_t v7 = v9;
            if (!v9) {
              goto LABEL_10;
            }
          }
        }

        else
        {
LABEL_10:
          __darwin_ct_rune_t v10 = off_1000105C8;
          if (off_1000105C8)
          {
            int v11 = &off_1000105E0;
            while (strcasecmp(v5, v10))
            {
              uint64_t v12 = *v11;
              v11 += 3;
              __darwin_ct_rune_t v10 = v12;
              if (!v12) {
                goto LABEL_14;
              }
            }
          }

          else
          {
LABEL_14:
            warnx("warning: option %s not known", v4);
          }
        }

        int v4 = strtok(0LL, ",");
      }

      while (v4);
    }

    free(v2);
  }

uint64_t sub_100009A74(uint64_t a1)
{
  int v30 = 0LL;
  bzero(__s, 0x401uLL);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v37 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  *(_OWORD *)int v32 = 0u;
  *(void *)(a1 + 16) = 0LL;
  uint64_t v2 = *(const char **)(a1 + 8);
  int v3 = *(unsigned __int8 *)v2;
  if (*v2)
  {
    if (v3 != 60)
    {
      if (v3 == 91 && v2[strlen(*(const char **)(a1 + 8)) - 1] == 93)
      {
        int v4 = v2 + 1;
        uint64_t v2 = __s;
        __strlcpy_chk(__s, v4, 1025LL, 1025LL);
        __s[strlen(__s) - 1] = 0;
      }

      goto LABEL_23;
    }

    if (v2[strlen(*(const char **)(a1 + 8)) - 1] != 62)
    {
LABEL_23:
      memset(&v31, 0, sizeof(v31));
      v31.ai_flags = 1024;
      v31.ai_socktype = qword_1000109F4;
      if ((_DWORD)qword_100010AE8) {
        uint64_t v2 = "localhost";
      }
      if (getaddrinfo(v2, 0LL, &v31, &v30))
      {
        warnx("can't resolve host: %s", v2);
        return 2LL;
      }

      int v11 = v30;
      if (!v30) {
        goto LABEL_74;
      }
      goto LABEL_27;
    }

    __strlcpy_chk(__s, v2, 1025LL, 1025LL);
    __s[strlen(__s) - 1] = 0;
    uint64_t v2 = v41;
  }

  int v5 = (addrinfo *)malloc(0x30uLL);
  int v30 = v5;
  if (!v5)
  {
    warnx("Can't allocate addrinfo sturcture for local address for %s");
    return 12LL;
  }

  uint64_t v6 = v5;
  uint64_t v7 = (sockaddr *)malloc(0x6AuLL);
  if (!v7)
  {
    free(v6);
    warnx("Can't allocate local socket address for %s");
    return 12LL;
  }

  int v8 = v7;
  *(_WORD *)&v7->sa_len = 362;
  if (dword_100010920 >= 3) {
    printf("hostname is <%s> : %s\n", v2, (const char *)xmmword_100010AD8);
  }
  if (*v2)
  {
    char v9 = (char *)xmmword_100010AD8;
    if ((void)xmmword_100010AD8)
    {
      if (strcmp((const char *)xmmword_100010AD8, v2))
      {
        warnx("%s overrides port=%s", v2, v9);
        char v9 = (char *)xmmword_100010AD8;
      }

      free(v9);
    }

    __darwin_ct_rune_t v10 = strdup(v2);
    *(void *)&xmmword_100010AD8 = v10;
    if (!v10)
    {
      __int128 v28 = strerror(1);
      sub_100003C74(1, "No memory to duplicate hostname %s: %s", 0LL, v28);
    }

    LODWORD(qword_10001092C) = qword_10001092C | 0x20000000;
    if (dword_100010920 >= 3) {
      printf("Setting local_nfs_port to %s\n", v10);
    }
  }

  v8->sa_data[0] = 0;
  int v11 = v30;
  *(void *)&v30->ai_flags = &_mh_execute_header;
  v11->size_t ai_addrlen = 106;
  int v12 = qword_1000109F4;
  v11->ai_socktype = v12;
  v11->ai_protocol = 0;
  v11->ai_canonname = 0LL;
  v11->ai_addr = v8;
  v11->ai_next = 0LL;
LABEL_27:
  uint64_t v29 = a1;
  unint64_t v13 = 0LL;
  unint64_t v14 = 0LL;
  do
  {
    while (1)
    {
      unint64_t v15 = v11;
      int v11 = v11->ai_next;
      if ((!HIDWORD(qword_1000109F4) || v15->ai_family == HIDWORD(qword_1000109F4))
        && (!(_DWORD)qword_1000109F4 || v15->ai_socktype == (_DWORD)qword_1000109F4)
        && (xmmword_10001093C < 4 || v15->ai_socktype != 2))
      {
        unsigned int ai_family = v15->ai_family;
        if (ai_family <= 0x1E && ((1 << ai_family) & 0x40000006) != 0) {
          break;
        }
      }

      ai_next = v11;
      if (v14) {
        goto LABEL_52;
      }
      int v30 = v11;
LABEL_54:
      v15->ai_next = v13;
      if (dword_100010920 >= 3)
      {
        int v24 = v15->ai_family;
        if (v24 == 2)
        {
          size_t v25 = &v15->ai_addr->sa_data[2];
        }

        else
        {
          if (v24 == 1)
          {
            if (v15->ai_socktype != 2) {
              v15->ai_socktype = 1;
            }
            printf("discard address: %s %s\n");
            goto LABEL_63;
          }

          size_t v25 = &v15->ai_addr->sa_data[6];
        }

        inet_ntop(v24, v25, v32, 0x80u);
        printf("discard address: %s %s %s\n");
      }

LABEL_63:
      unint64_t v13 = v15;
      if (!v11) {
        goto LABEL_72;
      }
    }

    if (!(_DWORD)qword_1000109F4 && v14 && v15->ai_socktype != v14->ai_socktype)
    {
      int v18 = v14->ai_family;
      int v19 = v18 - ai_family;
      if (v18 != ai_family) {
        goto LABEL_44;
      }
      size_t ai_addrlen = v14->ai_addrlen;
      socklen_t v21 = v15->ai_addrlen;
      if ((_DWORD)ai_addrlen == v21)
      {
        int v19 = bcmp(v14->ai_addr, v15->ai_addr, ai_addrlen);
LABEL_44:
        if (v19) {
          goto LABEL_45;
        }
LABEL_71:
        ai_next = v15->ai_next;
LABEL_52:
        v14->ai_next = ai_next;
        goto LABEL_54;
      }

      if ((_DWORD)ai_addrlen == v21) {
        goto LABEL_71;
      }
    }

LABEL_45:
    if (dword_100010920 < 3) {
      goto LABEL_68;
    }
    int v22 = v15->ai_family;
    if (v22 == 2)
    {
      __int128 v26 = &v15->ai_addr->sa_data[2];
LABEL_67:
      inet_ntop(v22, v26, v32, 0x80u);
      printf("usable address: %s %s %s\n");
      goto LABEL_68;
    }

    if (v22 != 1)
    {
      __int128 v26 = &v15->ai_addr->sa_data[6];
      goto LABEL_67;
    }

    if (v15->ai_socktype != 2) {
      v15->ai_socktype = 1;
    }
    printf("usable address: %s %s\n");
LABEL_68:
    unint64_t v14 = v15;
  }

  while (v11);
LABEL_72:
  a1 = v29;
  if (v13) {
    free(v13);
  }
LABEL_74:
  uint64_t result = 0LL;
  *(void *)(a1 + 16) = v30;
  return result;
}

  ;
}

void sub_10000A070(uint64_t a1)
{
  CFTypeRef v1 = (const char *)getmntoptstr(a1, "timeo");
  warnx("illegal timeout value -- %s", v1);
  sub_10000A064();
}

void sub_10000A0A0(uint64_t a1)
{
  CFTypeRef v1 = (const char *)getmntoptstr(a1, "retrycnt");
  warn("illegal retry count -- %s", v1);
  sub_10000A064();
}

void sub_10000A0D0(uint64_t a1)
{
  CFTypeRef v1 = (const char *)getmntoptstr(a1, "retrans");
  warnx("illegal retrans value -- %s", v1);
  sub_10000A064();
}

void sub_10000A100(uint64_t a1)
{
  CFTypeRef v1 = (const char *)getmntoptstr(a1, "readahead");
  warnx("illegal readahead value -- %s", v1);
  sub_10000A064();
}

void sub_10000A130(uint64_t a1)
{
  CFTypeRef v1 = (const char *)getmntoptstr(a1, "maxgroups");
  warnx("illegal maxgroups value -- %s", v1);
  sub_10000A064();
}

double sub_10000A160()
{
  LODWORD(qword_10001092C) = qword_10001092C | 0x1000;
  *(void *)&double result = 0x5F37300000001LL;
  qword_1000109C4 = 0x5F37300000001LL;
  return result;
}