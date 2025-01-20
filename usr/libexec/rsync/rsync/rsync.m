uint64_t sub_100004448(uint64_t a1, uint64_t *a2)
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  __int128 *v10;
  const char *v11;
  char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v37;
  char v38;
  unint64_t v39;
  copyfile_flags_t flags;
  char *v41;
  if (!*(_DWORD *)(*(void *)a1 + 600LL)) {
    return 1LL;
  }
  if (*(_DWORD *)(*(void *)a1 + 84LL)) {
    v3 = 851973;
  }
  else {
    v3 = 65541;
  }
  flags = v3;
  v4 = a2[1];
  if (!v4) {
    return 1;
  }
  v5 = 0LL;
  v6 = 0;
  v7 = 0LL;
  v8 = "._";
  v39 = a2[1];
  while (1)
  {
    v9 = *a2;
    v10 = (__int128 *)(*a2 + v5);
    v11 = *(const char **)v10;
    v12 = strrchr(*(const char **)v10, 47);
    if (v12) {
      v13 = v12 + 1;
    }
    else {
      v13 = v11;
    }
    if (!strncmp(v13, v8, 2uLL) || !copyfile(v11, 0LL, 0LL, flags)) {
      goto LABEL_14;
    }
    v14 = v8;
    v15 = v9 + v5;
    v16 = *(void *)(v15 + 16);
    v17 = *(const char **)v15;
    v18 = &v13[-*(void *)v15];
    v19 = basename(*(char **)v15);
    v27 = sub_100015788((uint64_t)a2);
    v28 = *((void *)v10 + 18);
    v29 = v10[6];
    v30 = v10[7];
    *(_OWORD *)(v27 + 128) = v10[8];
    v31 = *v10;
    *(_OWORD *)(v27 + 16) = v10[1];
    v32 = v10[2];
    v33 = v10[3];
    v34 = v10[4];
    v35 = v10[5];
    *(_OWORD *)(v27 + 96) = v29;
    *(_OWORD *)(v27 + 112) = v30;
    *(_OWORD *)v27 = v31;
    *(_OWORD *)(v27 + 64) = v34;
    *(_OWORD *)(v27 + 80) = v35;
    *(_OWORD *)(v27 + 32) = v32;
    *(_OWORD *)(v27 + 48) = v33;
    *(void *)v27 = v41;
    *(void *)(v27 + 16) = &v41[v16 - (void)v17];
    *(void *)(v27 + 88) = 0LL;
    *(void *)(v27 + 128) = sub_100004668;
    *(void *)(v27 + 136) = sub_1000048D0;
    *(void *)(v27 + 144) = v28;
    *(_DWORD *)(v15 + 56) |= 0x10000000u;
    v8 = v14;
    v4 = v39;
LABEL_14:
    *((void *)v10 + 17) = sub_1000048D0;
    v6 = ++v7 >= v4;
    v5 += 152LL;
    if (v4 == v7) {
      return 1;
    }
  }

  if (dword_100058FD8)
  {
    v37 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C0A4();
    }
    *__error() = v37;
  }

  sub_1000218D4("asprintf --extended-attributes path", v20, v21, v22, v23, v24, v25, v26, v38);
  return v6;
}

uint64_t sub_100004668(uint64_t a1, uint64_t a2, int a3)
{
  v6 = *(char **)a2;
  if (*(_DWORD *)(*(void *)a1 + 84LL)) {
    copyfile_flags_t v7 = 4980741;
  }
  else {
    copyfile_flags_t v7 = 4194309;
  }
  v8 = dirname(v6);
  v9 = basename(*(char **)a2);
  if (asprintf(&from, "%s/%s", v8, v9 + 2) == -1)
  {
    if (dword_100058FD8)
    {
      int v26 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C0F8();
      }
      *__error() = v26;
    }

    v27 = "asprintf";
    goto LABEL_27;
  }

  pid_t v17 = getpid();
  int v18 = snprintf(__str, 0x400uLL, "%s.%d.", "/tmp/", v17);
  unint64_t v19 = v18;
  v20 = *(_BYTE **)(a2 + 16);
  int v21 = *v20;
  if (*v20 && v18 <= 0x3FE)
  {
    v22 = v20 + 1;
    do
    {
      if (v21 == 47) {
        LOBYTE(v21) = 95;
      }
      __str[v19] = v21;
      unint64_t v23 = v19 + 1;
      int v24 = *v22++;
      int v21 = v24;
      if (!v24) {
        break;
      }
    }

    while (v19++ < 0x3FE);
  }

  else
  {
    unint64_t v23 = v18;
  }

  __str[v23] = 0;
  int v28 = copyfile(from, __str, 0LL, v7);
  int v29 = *__error();
  free(from);
  if (v28)
  {
    *__error() = v29;
    if (dword_100058FD8)
    {
      int v30 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C124();
      }
      *__error() = v30;
    }

    v27 = "copyfile";
LABEL_27:
    sub_1000218D4(v27, v10, v11, v12, v13, v14, v15, v16, v34);
    return 0xFFFFFFFFLL;
  }

  uint64_t v31 = open(__str, a3);
  int v33 = *__error();
  unlink(__str);
  if ((_DWORD)v31 == -1) {
    *__error() = v33;
  }
  return v31;
}

uint64_t sub_1000048D0(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(_DWORD *)(*(void *)a1 + 600LL)) {
    sub_10003C150();
  }
  if (dword_100058FD8)
  {
    int v4 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C178();
    }
    *__error() = v4;
  }

  sub_100021850("io_write_byte");
  return 0LL;
}

uint64_t sub_100004968(uint64_t result, __int128 *a2, unint64_t a3)
{
  if (*(_DWORD *)(*(void *)result + 600LL))
  {
    unint64_t v22 = a3 - 1;
    if (a3 != 1)
    {
      uint64_t v4 = 0LL;
      v5 = a2;
      do
      {
        v6 = (__int128 *)((char *)a2 + 152 * v4);
        if ((*((_WORD *)v6 + 12) & 0xF000) == 0x8000)
        {
          copyfile_flags_t v7 = *(const char **)v6;
          v8 = strrchr(*(const char **)v6, 47);
          v9 = v8 ? v8 + 1 : v7;
          result = strncmp(v9, "._", 2uLL);
          if (!(_DWORD)result)
          {
            size_t v10 = v9 - v7;
            uint64_t v11 = v9 + 2;
            uint64_t v12 = v5;
            uint64_t v13 = v4;
            while (++v13 < a3)
            {
              uint64_t v14 = (const char *)*((void *)v12 + 19);
              result = strncmp(v14, v7, v10);
              if ((_DWORD)result) {
                break;
              }
              uint64_t v12 = (__int128 *)((char *)v12 + 152);
              result = strcmp(&v14[v10], v11);
              if (!(_DWORD)result)
              {
                __int128 v30 = v12[6];
                __int128 v31 = v12[7];
                __int128 v32 = v12[8];
                uint64_t v33 = *((void *)v12 + 18);
                __int128 v26 = v12[2];
                __int128 v27 = v12[3];
                __int128 v28 = v12[4];
                __int128 v29 = v12[5];
                __int128 v24 = *v12;
                __int128 v25 = v12[1];
                __int128 v15 = v6[1];
                *uint64_t v12 = *v6;
                v12[1] = v15;
                __int128 v16 = v6[2];
                __int128 v17 = v6[3];
                __int128 v18 = v6[5];
                v12[4] = v6[4];
                v12[5] = v18;
                v12[2] = v16;
                v12[3] = v17;
                __int128 v19 = v6[6];
                __int128 v20 = v6[7];
                __int128 v21 = v6[8];
                *((void *)v12 + 18) = *((void *)v6 + 18);
                v12[7] = v20;
                v12[8] = v21;
                v12[6] = v19;
                v6[6] = v30;
                v6[7] = v31;
                v6[8] = v32;
                *((void *)v6 + 18) = v33;
                v6[2] = v26;
                v6[3] = v27;
                v6[4] = v28;
                v6[5] = v29;
                __int128 *v6 = v24;
                v6[1] = v25;
                break;
              }
            }
          }
        }

        ++v4;
        v5 = (__int128 *)((char *)v5 + 152);
      }

      while (v4 != v22);
    }
  }

  return result;
}

uint64_t sub_100004B3C(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(_DWORD *)(*(void *)a1 + 600LL)) {
    return 1LL;
  }
  if (sub_10001FB98(a1, a2, &v8))
  {
    int v4 = *(_DWORD *)(a3 + 56);
    if (v8) {
      int v5 = v4 | 0x10000000;
    }
    else {
      int v5 = v4 | 0x20000000;
    }
    *(_DWORD *)(a3 + 56) = v5;
    return 1LL;
  }

  if (dword_100058FD8)
  {
    int v6 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C1A4();
    }
    *__error() = v6;
  }

  sub_100021980("io_read_byte");
  return 0LL;
}

uint64_t sub_100004BF4(uint64_t a1, uint64_t a2, int a3, const char *a4, int a5, char *a6, int a7)
{
  if (a7)
  {
    if (*(_DWORD *)(*(void *)a1 + 600LL))
    {
      uint64_t v14 = basename(a6);
      if (!strncmp(v14, "._", 2uLL)) {
        return sub_100004D30(a1, a2, a3, a4, a5, a6);
      }
    }
  }

  if (dword_100058FD8)
  {
    int v22 = *__error();
    unint64_t v23 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C1D0((uint64_t)a4, (uint64_t)a6, v23);
    }
    *__error() = v22;
  }

  sub_1000218D4("%s: move_file: %s", v15, v16, v17, v18, v19, v20, v21, (char)a4);
  return 0LL;
}

uint64_t sub_100004D30(uint64_t a1, uint64_t a2, int a3, const char *a4, int a5, char *__s)
{
  uint64_t v12 = strrchr(__s, 47);
  if (v12) {
    uint64_t v13 = v12 + 1;
  }
  else {
    uint64_t v13 = __s;
  }
  if (snprintf(__str, 0x400uLL, "%.*s%s", (_DWORD)v13 - (_DWORD)__s, __s, v13 + 2) == -1)
  {
    if (dword_100058FD8)
    {
      int v37 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C248();
      }
      *__error() = v37;
    }

    v38 = "snprintf";
    goto LABEL_26;
  }

  int v21 = openat(a3, a4, 0);
  if (v21 == -1)
  {
    if (dword_100058FD8)
    {
      int v39 = *__error();
      v40 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C274((uint64_t)a4, v40, v41, v42, v43, v44, v45, v46);
      }
      *__error() = v39;
    }

    char v60 = (char)a4;
    v38 = "%s: openat";
LABEL_26:
    sub_1000218D4(v38, v14, v15, v16, v17, v18, v19, v20, v60);
    return 0LL;
  }

  int v22 = v21;
  if (*(_DWORD *)(*(void *)a1 + 84LL)) {
    int v23 = openat(a5, __str, 257);
  }
  else {
    int v23 = openat(a5, __str, 1);
  }
  if (v23 == -1)
  {
    if (dword_100058FD8)
    {
      int v48 = *__error();
      v49 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C274((uint64_t)__str, v49, v50, v51, v52, v53, v54, v55);
      }
      *__error() = v48;
    }

    sub_1000218D4("%s: openat", v24, v25, v26, v27, v28, v29, v30, (char)__str);
    close(v22);
    return 0LL;
  }

  int v31 = v23;
  int v32 = fcopyfile(v22, v23, 0LL, 0x800005u);
  int v33 = *__error();
  close(v31);
  close(v22);
  if (v32)
  {
    if (dword_100058FD8)
    {
      int v34 = *__error();
      v35 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v62 = __str;
        __int16 v63 = 2080;
        v64 = a4;
        __int16 v65 = 2080;
        v66 = strerror(v33);
        _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s: copyfile extended attributes from %s: %s",  buf,  0x20u);
      }

      *__error() = v34;
    }

    v36 = strerror(v33);
    sub_100021980("%s: copyfile extended attributes from %s: %s", __str, a4, v36);
    return 0LL;
  }

  if (unlinkat(a3, a4, 0))
  {
    if (dword_100058FD8)
    {
      int v56 = *__error();
      v57 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C2D8((uint64_t)a4, v57);
      }
      *__error() = v56;
    }

    v58 = __error();
    v59 = strerror(*v58);
    sub_100021980("%s: unlink: %s", a4, v59);
  }

  *(_DWORD *)(a2 + 56) |= 0x40000000u;
  return 1LL;
}

uint64_t sub_1000050D4(uint64_t a1, uint64_t a2, int a3, char *a4)
{
  if (*(_DWORD *)(*(void *)a1 + 600LL)
    && !*(_DWORD *)(*(void *)a1 + 196LL)
    && (*(_BYTE *)(a2 + 59) & 0x40) == 0
    && (char v8 = basename(a4), !strncmp(v8, "._", 2uLL)))
  {
    return sub_100004D30(a1, a2, a3, a4, a3, a4);
  }

  else
  {
    return 1LL;
  }
}

void sub_100005168( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000518C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000051A4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void *sub_1000051B0()
{
  v0 = calloc(1uLL, 0x18uLL);
  if (!v0)
  {
    if (dword_100058FD8)
    {
      int v18 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C370();
      }
      *__error() = v18;
    }

    sub_1000218D4("calloc", v1, v2, v3, v4, v5, v6, v7, v20);
    return 0LL;
  }

  char v8 = v0;
  v0[1] = 0x10000LL;
  v9 = calloc(0x10000uLL, 0x10uLL);
  void *v8 = v9;
  if (!v9)
  {
    if (dword_100058FD8)
    {
      int v17 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C370();
      }
      *__error() = v17;
    }

    sub_1000218D4("calloc", v10, v11, v12, v13, v14, v15, v16, v20);
    free(v8);
    return 0LL;
  }

  return v8;
}

uint64_t sub_1000052BC(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 1LL;
  }
  uint64_t v4 = (uint64_t *)(a2 + 40);
  unint64_t v3 = *(void *)(a2 + 40);
  if (!v3) {
    return 1LL;
  }
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint64_t v7 = *(void **)a1;
    do
    {
      *uint64_t v7 = 0LL;
      v7[1] = v7;
      v7 += 2;
      --v6;
    }

    while (v6);
  }

  if (!*(void *)(a2 + 32)) {
    return 1LL;
  }
  char v8 = (char *)sub_100006FD4(*(void **)(a1 + 16), v3, 0x18uLL);
  *(void *)(a1 + 16) = v8;
  if (v8)
  {
    uint64_t v16 = *v4;
    if (*v4)
    {
      uint64_t v17 = 0LL;
      uint64_t v18 = 0LL;
      char v20 = *(void **)a1;
      unint64_t v19 = *(void *)(a1 + 8);
      do
      {
        uint64_t v21 = *(void *)(a2 + 32) + v17;
        unint64_t v22 = *(unsigned int *)(v21 + 24) % v19;
        int v23 = &v8[v18];
        *(void *)int v23 = v21;
        *((void *)v23 + 1) = 0LL;
        uint64_t v24 = (void *)v20[2 * v22 + 1];
        *((void *)v23 + 2) = v24;
        *uint64_t v24 = &v8[v18];
        char v8 = *(char **)(a1 + 16);
        char v20 = *(void **)a1;
        *(void *)(*(void *)a1 + 16 * v22 + 8) = &v8[v18 + 8];
        v18 += 24LL;
        v17 += 48LL;
        --v16;
      }

      while (v16);
    }

    return 1LL;
  }

  if (dword_100058FD8)
  {
    int v26 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C39C();
    }
    *__error() = v26;
  }

  sub_1000218D4("reallocarray 3 %ld * %ld bytes", v9, v10, v11, v12, v13, v14, v15, *v4);
  return 0LL;
}

void sub_100005414(void **a1)
{
}

uint64_t sub_100005444( uint64_t a1, uint64_t *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a4 + 40);
  if (!v11)
  {
    int v15 = 3;
LABEL_8:
    *(void *)(a4 + 56) = 0LL;
    *(void *)(a4 + 64) = v11;
    *(_DWORD *)(a4 + 72) = 0;
    *(_DWORD *)(a4 + 52) = v15;
    *(void *)(a4 + 8) = v11;
    *(void *)(a4 + 16) = v11;
    *(void *)(a1 + 88) += v11;
    sub_100021744(3, "%s: flushing whole file %zu B", (uint64_t)a3, a4, a5, a6, a7, a8, (char)a3);
    return 1LL;
  }

  uint64_t v13 = a2[5];
  if (!v13)
  {
    int v15 = 2;
    goto LABEL_8;
  }

  if (**(_DWORD **)(a1 + 200))
  {
    uint64_t v14 = *a2;
    if (v11 < *a2) {
      sub_10003C438();
    }
    *(void *)a4 = v14;
    goto LABEL_14;
  }

  uint64_t v16 = v11 - *(void *)(a2[4] + 48 * v13 - 32) + 1;
  uint64_t v14 = *(void *)a4;
  if (*(void *)a4 >= v16)
  {
LABEL_14:
    unint64_t v20 = v11 - v14;
    char v30 = (char)a3;
    if (v11 == v14) {
      int v21 = 3;
    }
    else {
      int v21 = 2;
    }
    sub_100021744(3, "%s: flushing remaining %jd B", (uint64_t)a3, a4, a5, a6, a7, a8, v30);
    *(int64x2_t *)(a4 + 8) = vaddq_s64(*(int64x2_t *)(a4 + 8), vdupq_n_s64(v20));
    *(void *)(a1 + 88) += v20;
    *(void *)(a4 + 56) = v14;
    *(void *)(a4 + 64) = v11;
    *(_DWORD *)(a4 + 72) = 0;
    *(_DWORD *)(a4 + 52) = v21;
    return 1LL;
  }

  uint64_t v17 = 0LL;
  while (1)
  {
    uint64_t v18 = sub_10000565C(a1, a4, a2, a3, v17 == 0, a6, a7, a8);
    if (v18) {
      break;
    }
    uint64_t v19 = *(void *)a4 + 1LL;
    *(void *)a4 = v19;
    --v17;
    if (v19 >= v16)
    {
      uint64_t v11 = *(void *)(a4 + 40);
      goto LABEL_14;
    }
  }

  uint64_t v23 = v18;
  if (v18 != -1)
  {
    uint64_t v24 = *(void *)a4;
    unint64_t v25 = *(void *)a4 - v14;
    *(int64x2_t *)(a4 + 8) = vaddq_s64(*(int64x2_t *)(a4 + 8), vdupq_n_s64(v25));
    *(void *)(a1 + 88) += v25;
    sub_100021744(3, "%s: flushing %jd B before %zu B block %zu", (uint64_t)a3, a4, a5, a6, a7, a8, (char)a3);
    uint64_t v26 = *(void *)(v23 + 8);
    int v27 = ~*(_DWORD *)(v23 + 8);
    *(void *)(a4 + 56) = v14;
    *(void *)(a4 + 64) = v24;
    *(_DWORD *)(a4 + 72) = v27;
    if ((_DWORD)v26 == -1) {
      sub_10003C410();
    }
    if (v24 == v14) {
      int v28 = 3;
    }
    else {
      int v28 = 2;
    }
    *(_DWORD *)(a4 + 52) = v28;
    unint64_t v29 = *(void *)(v23 + 16);
    *(void *)(a1 + 96) += v29;
    *(int64x2_t *)a4 = vaddq_s64(*(int64x2_t *)a4, vdupq_n_s64(v29));
    *(void *)(a4 + 24) = v26 + 1;
    return 1LL;
  }

  return 0LL;
}

uint64_t sub_10000565C( uint64_t a1, uint64_t a2, void *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = v8 - *(void *)a2;
  if (v8 == *(void *)a2) {
    sub_10003C460();
  }
  uint64_t v12 = a3[2];
  if (v9 >= v12) {
    unint64_t v13 = a3[2];
  }
  else {
    unint64_t v13 = v8 - *(void *)a2;
  }
  if ((_DWORD)a5)
  {
    if (qword_100058F00) {
      BOOL v14 = qword_100058F08 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14) {
      sub_10003C524();
    }
    if (qword_100058F00) {
      qword_100058F08 = qword_100058F00;
    }
    if (sigsetjmp(dword_100058F10, 0) >= 1)
    {
      qword_100058F00 = qword_100058F08;
      qword_100058F08 = 0LL;
      if (!dword_100058FD8) {
        goto LABEL_68;
      }
      int v15 = *__error();
      uint64_t v16 = (os_log_s *)qword_100058FE8;
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO)) {
        goto LABEL_67;
      }
      int __s1 = 136315138;
      uint64_t v52 = a4;
      goto LABEL_17;
    }

    uint64_t v47 = v12;
    qword_100058F00 = *(void *)(a2 + 32);
    uint64_t v19 = sub_100013094((void *)qword_100058F00, *(void *)a2);
    uint64_t v20 = sub_10001DE3C((uint64_t)v19, v13);
    if (qword_100058F00 != *(void *)(a2 + 32)) {
      sub_10003C4D8(v20, v21, (uint64_t)a3);
    }
    unsigned int v18 = v20;
    qword_100058F00 = qword_100058F08;
    qword_100058F08 = 0LL;
    *(_DWORD *)(a2 + 88) = (unsigned __int16)v20;
    *(_DWORD *)(a2 + 92) = WORD1(v20);
  }

  else
  {
    uint64_t v47 = a3[2];
    unsigned int v18 = *(unsigned __int16 *)(a2 + 88) | (*(_DWORD *)(a2 + 92) << 16);
  }

  unint64_t v22 = *(void *)(a2 + 24);
  if (v22 < a3[5] && (uint64_t v23 = a3[4], v18 == *(_DWORD *)(v23 + 48 * v22 + 24)) && v13 == *(void *)(v23 + 48 * v22 + 16))
  {
    if (qword_100058F00) {
      BOOL v24 = qword_100058F08 == 0;
    }
    else {
      BOOL v24 = 1;
    }
    if (!v24) {
      sub_10003C488();
    }
    if (qword_100058F00) {
      qword_100058F08 = qword_100058F00;
    }
    if (sigsetjmp(dword_100058F10, 0) >= 1)
    {
      qword_100058F00 = qword_100058F08;
      qword_100058F08 = 0LL;
      if (!dword_100058FD8) {
        goto LABEL_68;
      }
      int v15 = *__error();
      uint64_t v16 = (os_log_s *)qword_100058FE8;
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO)) {
        goto LABEL_67;
      }
      int __s1 = 136315138;
      uint64_t v52 = a4;
LABEL_17:
      p_s1 = (uint8_t *)&__s1;
      goto LABEL_66;
    }

    qword_100058F00 = *(void *)(a2 + 32);
    uint64_t v42 = (char *)sub_100013094((void *)qword_100058F00, *(void *)a2);
    uint64_t v43 = sub_10001DED4(v42, v13, (unsigned __int8 *)&__s1, a1);
    if (qword_100058F00 != *(void *)(a2 + 32)) {
      sub_10003C4D8(v43, v44, v45);
    }
    qword_100058F00 = qword_100058F08;
    qword_100058F08 = 0LL;
    if (!memcmp(&__s1, (const void *)(a3[4] + 48LL * *(void *)(a2 + 24) + 28), a3[3]))
    {
      sub_100021744( 3,  "%s: found matching hinted match: position %jd, block %zu (position %jd, size %zu)",  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)a4);
      return a3[4] + 48LL * *(void *)(a2 + 24);
    }

    int v25 = 1;
  }

  else
  {
    int v25 = 0;
  }

  uint64_t v26 = *(void **)(**(void **)(a2 + 80) + 16 * ((unint64_t)v18 % *(void *)(*(void *)(a2 + 80) + 8LL)));
  if (v26)
  {
    int v27 = v25;
    do
    {
      if (v18 == *(_DWORD *)(*v26 + 24LL) && v13 == *(void *)(*v26 + 16LL))
      {
        sub_100021744( 3,  "%s: found matching fast match: position %jd, block %zu (position %jd, size %zu)",  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)a4);
        if (!v27)
        {
          if (qword_100058F00) {
            BOOL v28 = qword_100058F08 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (!v28) {
            sub_10003C4FC();
          }
          if (qword_100058F00) {
            qword_100058F08 = qword_100058F00;
          }
          if (sigsetjmp(dword_100058F10, 0) >= 1)
          {
            qword_100058F00 = qword_100058F08;
            qword_100058F08 = 0LL;
            if (dword_100058FD8)
            {
              int v15 = *__error();
              uint64_t v16 = (os_log_s *)qword_100058FE8;
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v50 = a4;
LABEL_65:
                p_s1 = buf;
LABEL_66:
                _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s: file truncated while reading",  p_s1,  0xCu);
              }

LABEL_67:
              *__error() = v15;
            }

            goto LABEL_68;
          }

          qword_100058F00 = *(void *)(a2 + 32);
          unint64_t v29 = (char *)sub_100013094((void *)qword_100058F00, *(void *)a2);
          uint64_t v30 = sub_10001DED4(v29, v13, (unsigned __int8 *)&__s1, a1);
          if (qword_100058F00 != *(void *)(a2 + 32)) {
            sub_10003C4D8(v30, v31, v32);
          }
          qword_100058F00 = qword_100058F08;
          qword_100058F08 = 0LL;
        }

        if (!memcmp(&__s1, (const void *)(*v26 + 28LL), a3[3]))
        {
          sub_100021744(3, "%s: sender verifies slow match", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)a4);
          return *v26;
        }

        int v27 = 1;
      }

      uint64_t v26 = (void *)v26[1];
    }

    while (v26);
  }

  if (qword_100058F00) {
    BOOL v33 = qword_100058F08 == 0;
  }
  else {
    BOOL v33 = 1;
  }
  if (!v33) {
    sub_10003C4B0();
  }
  if (qword_100058F00) {
    qword_100058F08 = qword_100058F00;
  }
  if (sigsetjmp(dword_100058F10, 0) < 1)
  {
    qword_100058F00 = *(void *)(a2 + 32);
    v35 = sub_100013094((void *)qword_100058F00, *(void *)a2);
    int v38 = *(_DWORD *)(a2 + 92);
    int v39 = *(_DWORD *)(a2 + 88) - *(char *)v35;
    *(_DWORD *)(a2 + 88) = v39;
    int v40 = v38 - v13 * *(char *)v35;
    *(_DWORD *)(a2 + 92) = v40;
    if (v9 > v47)
    {
      int v41 = v39 + *((char *)v35 + v13);
      *(_DWORD *)(a2 + 88) = v41;
      *(_DWORD *)(a2 + 92) = v41 + v40;
    }

    if (qword_100058F00 != *(void *)(a2 + 32)) {
      sub_10003C4D8((uint64_t)v35, v36, v37);
    }
    qword_100058F00 = qword_100058F08;
    qword_100058F08 = 0LL;
    return 0LL;
  }

  else
  {
    qword_100058F00 = qword_100058F08;
    qword_100058F08 = 0LL;
    if (dword_100058FD8)
    {
      int v15 = *__error();
      uint64_t v16 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v50 = a4;
        goto LABEL_65;
      }

      goto LABEL_67;
    }

  v59 = v3 - (v14 >> 3);
  *(void *)result = v59 + 1;
  *(void *)(result + 24) = v5 + 1;
  *(_DWORD *)(result + 8) = v4 - v59 + 5;
  *(_DWORD *)(result + 32) = (_DWORD)v8 - (_DWORD)v5 + 257;
  *(void *)(v2 + 72) = v13 & ~(-1 << (v14 & 7));
  *(_DWORD *)(v2 + 80) = v14 & 7;
  return result;
}

LABEL_68:
    sub_100021AB0("%s: file truncated while reading", a4);
    return -1LL;
  }

void *sub_100005CB8(uint64_t a1, int *a2)
{
  uint64_t v5 = 0LL;
  sub_10002019C(a1, &v5, 0x10uLL, a2[10]);
  sub_10002019C(a1, &v5, 0x10uLL, a2[4]);
  sub_10002019C(a1, &v5, 0x10uLL, a2[6]);
  result = sub_10002019C(a1, &v5, 0x10uLL, a2[2]);
  if (v5 != 16) {
    sub_10003C54C();
  }
  return result;
}

uint64_t *sub_100005D40( uint64_t a1, uint64_t a2, void **a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, uint64_t a8)
{
  uint64_t v9 = (void *)a6;
  uint64_t v10 = (uint64_t *)a5;
  int v14 = *a7;
  if (!a5 && v14) {
    sub_10003C574();
  }
  if ((v14 | 2) != 2) {
    sub_10003C59C();
  }
  if (!a5)
  {
    unsigned int v18 = (uint64_t *)calloc(1uLL, 0x30uLL);
    if (!v18)
    {
      if (dword_100058FD8)
      {
        int v38 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003C370();
        }
        *__error() = v38;
      }

      sub_1000218D4("calloc", v19, v20, v21, v22, v23, v24, v25, v66);
      return 0LL;
    }

    uint64_t v10 = v18;
    if (!sub_100020C5C(a1, a3, 0x500uLL))
    {
      if (dword_100058FD8)
      {
        int v26 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003C5C4();
        }
        *__error() = v26;
      }

      sub_100021980("iobuf_alloc");
      goto LABEL_76;
    }
  }

  if (!v14)
  {
    if (sub_100021404(a3, v10 + 5))
    {
      int v27 = v10 + 2;
      if (sub_100021404(a3, v10 + 2))
      {
        if (sub_100021404(a3, v10 + 3))
        {
          v69 = v9;
          BOOL v28 = (unint64_t *)(v10 + 1);
          if (sub_100021404(a3, v10 + 1))
          {
            unint64_t v35 = *v28;
            if (!*v28 || (uint64_t v36 = *v27, v35 < *v27))
            {
              if (dword_100058FD8)
              {
                int v37 = *__error();
                log = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v62 = v10[5];
                  uint64_t v63 = *v27;
                  unint64_t v64 = *v28;
                  uint64_t v65 = v10[3];
                  *(_DWORD *)buf = 136316162;
                  uint64_t v72 = a4;
                  __int16 v73 = 2048;
                  uint64_t v74 = v62;
                  __int16 v75 = 2048;
                  uint64_t v76 = v63;
                  __int16 v77 = 2048;
                  unint64_t v78 = v64;
                  __int16 v79 = 2048;
                  uint64_t v80 = v65;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s: read block prologue: %zu blocks of %zu B, %zu B remainder, %zu B checksum",  buf,  0x34u);
                }

                *__error() = v37;
              }

              sub_100021744( 2,  "%s: read block prologue: %zu blocks of %zu B, %zu B remainder, %zu B checksum",  v29,  v30,  v31,  v32,  v33,  v34,  a4);
              *a7 = 2;
              uint64_t v9 = v69;
              void *v69 = 0LL;
              goto LABEL_6;
            }

            if (dword_100058FD8)
            {
              int v61 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003C694();
              }
              *__error() = v61;
              unint64_t v35 = *v28;
              uint64_t v36 = *v27;
            }

            sub_100021850("block remainder %zu is greater than block size %zu", v35, v36);
LABEL_76:
            free((void *)v10[4]);
            free(v10);
            return 0LL;
          }

          if (dword_100058FD8)
          {
            int v55 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_73:
            }
              sub_10003C668();
LABEL_74:
            *__error() = v55;
          }
        }

        else if (dword_100058FD8)
        {
          int v55 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_73;
          }
          goto LABEL_74;
        }
      }

      else if (dword_100058FD8)
      {
        int v55 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_73;
        }
        goto LABEL_74;
      }
    }

    else if (dword_100058FD8)
    {
      int v55 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_73;
      }
      goto LABEL_74;
    }

    sub_100021980("iobuf_read_size");
    goto LABEL_76;
  }

LABEL_6:
  if (*a7 != 2) {
    sub_10003C640();
  }
  size_t v15 = v10[5];
  if (v15 && !v10[4])
  {
    uint64_t v39 = *(void *)(a1 + 200);
    if (!**(_DWORD **)(v39 + 8) && *(_DWORD *)v39)
    {
      uint64_t v56 = v10[1];
      if (v56) {
        size_t v17 = v56 + v10[2] * (v15 - 1);
      }
      else {
        size_t v17 = v10[2] * v15;
      }
LABEL_49:
      *a7 = 3;
      *uint64_t v10 = v17;
      if (dword_100058FD8)
      {
        int v53 = *__error();
        uint64_t v54 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v59 = v10[5];
          uint64_t v60 = *v10;
          *(_DWORD *)buf = 136315650;
          uint64_t v72 = a4;
          __int16 v73 = 2048;
          uint64_t v74 = v59;
          __int16 v75 = 2048;
          uint64_t v76 = v60;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "%s: read blocks: %zu blocks, %jd B total blocked data",  buf,  0x20u);
        }

        *__error() = v53;
      }

      sub_100021744( 2,  "%s: read blocks: %zu blocks, %jd B total blocked data",  (uint64_t)a3,  a4,  a5,  a6,  (uint64_t)a7,  a8,  a4);
      return v10;
    }

    int v40 = calloc(v15, 0x30uLL);
    v10[4] = (uint64_t)v40;
    if (v40)
    {
      size_t v17 = 0LL;
      v68 = v9;
      size_t v16 = *v9;
      size_t v15 = v10[5];
      goto LABEL_39;
    }

    if (dword_100058FD8)
    {
      int v57 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C370();
      }
      *__error() = v57;
    }

    sub_1000218D4("calloc", v41, (uint64_t)a3, a4, a5, a6, (uint64_t)a7, a8, v66);
    goto LABEL_76;
  }

  v68 = v9;
  size_t v16 = *v9;
  if (*v9) {
    size_t v17 = v10[2] * v16;
  }
  else {
    size_t v17 = 0LL;
  }
LABEL_39:
  if (v16 < v15)
  {
    uint64_t v42 = 48 * v16;
    do
    {
      uint64_t v43 = v10[4];
      sub_100021350(a3, &v70);
      uint64_t v44 = (size_t *)(v43 + v42);
      *(_DWORD *)(v43 + v42 + 24) = v70;
      size_t v45 = v10[3];
      if (v45 >= 0x11) {
        sub_10003C5F0();
      }
      sub_100021278(a3, (char *)v44 + 28, v45);
      *uint64_t v44 = v17;
      v44[1] = v16;
      if (v16 == v10[5] - 1 && (uint64_t v52 = v10[1]) != 0)
      {
        *(void *)(v43 + v42 + 16) = v52;
      }

      else
      {
        uint64_t v52 = v10[2];
        *(void *)(v43 + v42 + 16) = v52;
        if (!v52) {
          sub_10003C618();
        }
      }

      v17 += v52;
      sub_100021744(3, "%s: read block %zu, length %zu B", v46, v47, v48, v49, v50, v51, a4);
      ++v16;
      v42 += 48LL;
    }

    while (v16 < v10[5]);
  }

  size_t *v68 = v16;
  if (v16 >= v10[5]) {
    goto LABEL_49;
  }
  return v10;
}

    sub_10004080C();
    goto LABEL_7;
  }

  uint64_t v8 = v16;
  if (((char)v16 & 0x80000000) == 0)
  {
    uint64_t v9 = 0LL;
    goto LABEL_11;
  }

  if (!sub_10001FB98(a1, a2, (char *)&v16))
  {
    if (!dword_100058FD8) {
      goto LABEL_8;
    }
    uint64_t v10 = *__error();
    if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  uint64_t v9 = (v8 << 8) - 0x8000;
  uint64_t v8 = v16;
LABEL_11:
  uint64_t v11 = v9 | v8;
  if (v11 >= a4)
  {
    if (dword_100058FD8)
    {
      unint64_t v13 = *__error();
      int v14 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040864(v11, a4, v14);
      }
      *__error() = v13;
    }

    sub_100021980("io_read_vstring: incoming string too large (%zu > %zu)");
  }

  else
  {
    if (dword_100058FD8)
    {
      size_t v15 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040838();
      }
      *__error() = v15;
    }

    sub_100021980("io_read_vstring buf");
  }

  return 0LL;
}

uint64_t sub_100006450(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = 0LL;
  if (sub_10001FC1C(a1, a2, v11, 0x10uLL))
  {
    if (sub_1000209C4((uint64_t)v11, &v10, 0x10uLL, a3 + 5))
    {
      uint64_t v4 = a3 + 2;
      if (sub_1000209C4((uint64_t)v11, &v10, 0x10uLL, a3 + 2))
      {
        uint64_t v5 = a3 + 3;
        if (sub_1000209C4((uint64_t)v11, &v10, 0x10uLL, a3 + 3))
        {
          uint64_t v6 = a3 + 1;
          if (sub_1000209C4((uint64_t)v11, &v10, 0x10uLL, v6))
          {
            if (*v4 && *v6 >= *v4)
            {
              if (!dword_100058FD8)
              {
                sub_100021980("non-zero length is less than remainder", v10);
                return 0LL;
              }

              int v8 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003C790();
              }
              uint64_t v9 = "non-zero length is less than remainder";
            }

            else
            {
              if (*v5 <= 0x10uLL && (*v5 & 0x80000000) == 0) {
                return 1LL;
              }
              if (!dword_100058FD8)
              {
                sub_100021980("inappropriate checksum length", v10);
                return 0LL;
              }

              int v8 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003C764();
              }
              uint64_t v9 = "inappropriate checksum length";
            }

            goto LABEL_29;
          }

          if (dword_100058FD8)
          {
            int v8 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_27:
            }
              sub_10003C738();
LABEL_28:
            uint64_t v9 = "io_unbuffer_size";
LABEL_29:
            *__error() = v8;
LABEL_31:
            sub_100021980(v9, v10);
            return 0LL;
          }
        }

        else if (dword_100058FD8)
        {
          int v8 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          goto LABEL_28;
        }
      }

      else if (dword_100058FD8)
      {
        int v8 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }

    else if (dword_100058FD8)
    {
      int v8 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      goto LABEL_28;
    }

    uint64_t v9 = "io_unbuffer_size";
    goto LABEL_31;
  }

  if (dword_100058FD8)
  {
    int v8 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C70C();
    }
    uint64_t v9 = "io_read_buf";
    goto LABEL_29;
  }

  sub_100021980("io_read_buf", v10);
  return 0LL;
}

void sub_100006784(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

  ;
}

uint64_t sub_1000067A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v64 = 0u;
  __int128 v63 = 0u;
  __int128 v62 = 0u;
  __int128 v61 = 0u;
  __int128 v60 = 0u;
  __int128 v59 = 0u;
  __int128 v58 = 0u;
  __int128 v57 = 0u;
  __int128 v56 = 0u;
  v55[0] = a2;
  int v7 = *(_DWORD *)(a2 + 8);
  LODWORD(v55[1]) = *(_DWORD *)(a4 + 40);
  LODWORD(v55[2]) = v7;
  HIDWORD(v64) = v7;
  DWORD1(v60) = -1;
  int v8 = *(const char **)(a2 + 24);
  if (v8) {
    sub_100024B60(v8, v55);
  }
  sub_10003225C(a1, (uint64_t)v55);
  sub_100032094((uint64_t)a1);
  if (!sub_10001FFB4((uint64_t)v55, a3, v55[2]))
  {
    if (dword_100058FD8)
    {
      int v18 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C7BC();
      }
      *__error() = v18;
    }

    sub_100021980("io_write_int");
    goto LABEL_25;
  }

  if (!sub_100020708(v55, a3, (char *)&v55[2] + 4))
  {
    if (dword_100058FD8)
    {
      int v19 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      goto LABEL_23;
    }

LABEL_24:
    sub_100021980("io_read_int");
LABEL_25:
    uint64_t v20 = 1LL;
    goto LABEL_26;
  }

  if (!sub_100020708(v55, a3, (char *)&v55[1] + 4))
  {
    if (dword_100058FD8)
    {
      int v19 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_22:
      }
        sub_10003C7E8();
LABEL_23:
      *__error() = v19;
      goto LABEL_24;
    }

    goto LABEL_24;
  }

  int v15 = HIDWORD(v55[2]);
  if (SHIDWORD(v55[2]) <= 26)
  {
    if (dword_100058FD8)
    {
      int v16 = *__error();
      size_t v17 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C814((int *)&v55[2] + 1, v17);
      }
      *__error() = v16;
      int v15 = HIDWORD(v55[2]);
    }

    sub_100021850("remote protocol %d is older than our minimum supported %d: exiting", v15, 27);
LABEL_40:
    uint64_t v20 = 2LL;
    goto LABEL_26;
  }

  char v22 = v55[2];
  if (SHIDWORD(v55[2]) < SLODWORD(v55[2])) {
    HIDWORD(v64) = HIDWORD(v55[2]);
  }
  if (dword_100058FD8)
  {
    int v23 = *__error();
    uint64_t v24 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)char v66 = v55[2];
      *(_WORD *)&v66[4] = 1024;
      *(_DWORD *)&v66[6] = HIDWORD(v55[2]);
      __int16 v67 = 1024;
      int v68 = HIDWORD(v64);
      __int16 v69 = 1024;
      int v70 = HIDWORD(v55[1]);
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "client detected client version %d, server version %d, negotiated protocol version %d, seed %d",  buf,  0x1Au);
    }

    *__error() = v23;
    char v22 = v55[2];
  }

  uint64_t v20 = 1LL;
  sub_100021744( 1,  "client detected client version %d, server version %d, negotiated protocol version %d, seed %d",  v9,  v10,  v11,  v12,  v13,  v14,  v22);
  uint64_t v31 = v55[0];
  if (*(void *)(v55[0] + 528LL))
  {
    if (sub_10000A130(v55))
    {
      if (dword_100058FD8)
      {
        int v32 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003C970();
        }
        *__error() = v32;
      }

      sub_100021980("batch_open");
      goto LABEL_40;
    }

    uint64_t v20 = 0LL;
    uint64_t v31 = v55[0];
  }

  if (*(void *)(v31 + 496) && !*(_DWORD *)(a4 + 40)) {
    LODWORD(v60) = a3;
  }
  else {
    DWORD2(v56) = 1;
  }
  int v33 = *(_DWORD *)(v31 + 512);
  if (v33 == -1) {
    sub_10003C89C();
  }
  if (dword_100058FD8)
  {
    int v34 = *__error();
    unint64_t v35 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
    {
      if (*(_DWORD *)(v55[0] + 512LL)) {
        uint64_t v36 = "disabled";
      }
      else {
        uint64_t v36 = "enabled";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)char v66 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Delta transmission %s for this transfer",  buf,  0xCu);
    }

    *__error() = v34;
    int v33 = *(_DWORD *)(v55[0] + 512LL);
  }

  if (v33) {
    int v37 = "disabled";
  }
  else {
    int v37 = "enabled";
  }
  sub_100021744(1, "Delta transmission %s for this transfer", v25, v26, v27, v28, v29, v30, (char)v37);
  if (*(_DWORD *)(a4 + 40) == 1)
  {
    if (dword_100058FD8)
    {
      int v44 = *__error();
      size_t v45 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        uint64_t v46 = *(const char **)(a4 + 8);
        if (!v46) {
          uint64_t v46 = "(local)";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)char v66 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "client starting receiver: %s", buf, 0xCu);
      }

      *__error() = v44;
    }

    uint64_t v47 = *(const char **)(a4 + 8);
    if (!v47) {
      uint64_t v47 = "(local)";
    }
    sub_100021744(1, "client starting receiver: %s", v38, v39, v40, v41, v42, v43, (char)v47);
    if (*(_DWORD *)(v55[0] + 204LL)) {
      DWORD2(v57) = 1;
    }
    if (!sub_100028E84((uint64_t)v55, (uint64_t)a1, a3, a3, *(char **)(a4 + 32)))
    {
      if (dword_100058FD8)
      {
        int v48 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003C8C4();
        }
        *__error() = v48;
      }

      sub_100021980("rsync_receiver");
      goto LABEL_26;
    }

    goto LABEL_83;
  }

  if (dword_100058FD8)
  {
    int v49 = *__error();
    uint64_t v50 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
    {
      uint64_t v51 = *(const char **)(a4 + 8);
      if (!v51) {
        uint64_t v51 = "(local)";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)char v66 = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "client starting sender: %s", buf, 0xCu);
    }

    *__error() = v49;
  }

  uint64_t v52 = *(const char **)(a4 + 8);
  if (!v52) {
    uint64_t v52 = "(local)";
  }
  sub_100021744(1, "client starting sender: %s", v38, v39, v40, v41, v42, v43, (char)v52);
  if (sub_10002C7D4((uint64_t)v55, a3, a3, *(void *)(a4 + 24), *(const char ***)(a4 + 16)))
  {
LABEL_83:
    if (sub_10001ED2C(v55, a3))
    {
      if (BYTE8(v64))
      {
        uint64_t v20 = 25LL;
      }

      else if (*((void *)&v63 + 1))
      {
        uint64_t v20 = 23LL;
      }

      else
      {
        uint64_t v20 = 0LL;
      }
    }

    else
    {
      if (dword_100058FD8)
      {
        int v53 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003C8F0();
        }
        *__error() = v53;
      }

      sub_100021980("data remains in read pipe");
      uint64_t v20 = 14LL;
    }

    goto LABEL_26;
  }

  if (dword_100058FD8)
  {
    int v54 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C944();
    }
    *__error() = v54;
  }

  sub_100021980("rsync_sender");
LABEL_26:
  sub_10000A388(v55, a4, v20);
  return v20;
}

  *(_DWORD *)(v4 + 1156) = 0;
  return !v13;
}

uint64_t sub_100006F0C(int a1, int a2)
{
  uint64_t result = fork();
  if ((_DWORD)result != -1)
  {
    if ((_DWORD)result) {
      _exit(0);
    }
    uint64_t result = setsid();
    if ((_DWORD)result != -1)
    {
      if (a1)
      {
        if (!a2)
        {
LABEL_8:
          int v5 = open("/dev/null", 2);
          if (v5 != -1)
          {
            int v6 = v5;
            dup2(v5, 0);
            dup2(v6, 1);
            dup2(v6, 2);
            uint64_t result = 0LL;
            if (v6 < 3) {
              return result;
            }
            close(v6);
          }
        }
      }

      else
      {
        chdir("/");
        if (!a2) {
          goto LABEL_8;
        }
      }

      return 0LL;
    }
  }

  return result;
}

void *sub_100006FC0(void *result, rsize_t __n)
{
  if (__n) {
    return (void *)memset_s(result, __n, 0, __n);
  }
  return result;
}

void *sub_100006FD4(void *a1, unint64_t a2, unint64_t a3)
{
  if (!a2 || !((a3 | a2) >> 32) || is_mul_ok(a2, a3)) {
    return realloc(a1, a3 * a2);
  }
  *__error() = 12;
  return 0LL;
}

char *sub_100007014(char *a1, unint64_t a2, size_t __count, size_t __size)
{
  if (!a1) {
    return (char *)calloc(__count, __size);
  }
  if (!__count || !((__size | __count) >> 32) || is_mul_ok(__count, __size))
  {
    if (a2 && (__size | a2) >> 32 && !is_mul_ok(a2, __size))
    {
      int v5 = __error();
      int v6 = 0LL;
      int v7 = 22;
      goto LABEL_10;
    }

    size_t v9 = __size * __count;
    size_t v10 = __size * a2;
    size_t v11 = __size * __count - __size * a2;
    if (__size * __count <= __size * a2)
    {
      if (v10 - v9 < v10 >> 1 && v10 - v9 < getpagesize())
      {
        bzero(&a1[v9], v10 - v9);
        return a1;
      }

      uint64_t v13 = (char *)malloc(v9);
      int v6 = v13;
      if (!v13) {
        return v6;
      }
      memcpy(v13, a1, v9);
      if (!v10) {
        goto LABEL_16;
      }
    }

    else
    {
      uint64_t v12 = (char *)malloc(__size * __count);
      int v6 = v12;
      if (!v12) {
        return v6;
      }
      memcpy(v12, a1, v10);
      bzero(&v6[v10], v11);
      if (!v10)
      {
LABEL_16:
        free(a1);
        return v6;
      }
    }

    memset_s(a1, v10, 0, v10);
    goto LABEL_16;
  }

  int v5 = __error();
  int v6 = 0LL;
  int v7 = 12;
LABEL_10:
  int *v5 = v7;
  return v6;
}

uint64_t sub_10000715C(char *a1, uint64_t *a2)
{
  unint64_t v3 = a1;
  uint64_t v4 = *a1;
  if ((*a1 & 0x80000000) == 0)
  {
    do
    {
      if ((_DefaultRuneLocale.__runetype[v4] & 0x4000) == 0) {
        break;
      }
      int v5 = *++v3;
      uint64_t v4 = v5;
    }

    while ((v5 & 0x80000000) == 0);
  }

  unsigned int v6 = 0;
  while (v4 == 43)
  {
    if (v6) {
      goto LABEL_42;
    }
    unsigned int v6 = 1;
LABEL_11:
    unsigned int v7 = *++v3;
    uint64_t v4 = v7;
  }

  if (v4 == 45)
  {
    if (v6) {
      goto LABEL_42;
    }
    unsigned int v6 = -1;
    goto LABEL_11;
  }

  if ((v4 & 0x80) != 0)
  {
    unsigned int v10 = 0;
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
LABEL_31:
    if (v6 <= 1) {
      int v15 = 1;
    }
    else {
      int v15 = v6;
    }
    uint64_t v16 = v9 * v15;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    unsigned int v10 = 0;
    int v11 = 0;
    while (1)
    {
      uint64_t v12 = v4 - 48;
      if (v4 == 46)
      {
        if (v10) {
          goto LABEL_42;
        }
        unsigned int v10 = 1;
      }

      else if (v10)
      {
        if (v10 <= 0x13)
        {
          ++v10;
          uint64_t v8 = 10 * v8 + v12;
        }
      }

      else
      {
        if (v9 > 0xCCCCCCCCCCCCCCCLL) {
          goto LABEL_52;
        }
        uint64_t v13 = 10 * v9;
        unsigned int v10 = 0;
        uint64_t v9 = v13 + v12;
      }

      int v14 = *++v3;
      uint64_t v4 = v14;
      if (v14 < 0) {
        goto LABEL_31;
      }
    }

    if (v6 <= 1) {
      int v24 = 1;
    }
    else {
      int v24 = v6;
    }
    uint64_t v16 = v9 * v24;
    if (!v4)
    {
      uint64_t result = 0LL;
      *a2 = v16;
      return result;
    }
  }

  uint64_t v17 = 0LL;
  while (1)
  {
    int v18 = *v3;
    __darwin_ct_rune_t v19 = aBkmgtpe[v17];
    if (++v17 == 7) {
      goto LABEL_42;
    }
  }

  uint64_t v20 = v3[1];
  if (v3[1] < 0)
  {
    if (!__maskrune(v20, 0x500uLL)) {
      goto LABEL_50;
    }
LABEL_42:
    uint64_t v21 = __error();
    int v22 = 22;
LABEL_43:
    *uint64_t v21 = v22;
    return 0xFFFFFFFFLL;
  }

  if ((_DefaultRuneLocale.__runetype[v20] & 0x500) != 0) {
    goto LABEL_42;
  }
LABEL_50:
  uint64_t v25 = qword_100044F60[v17];
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL / v25;
  if (v16 > 0x7FFFFFFFFFFFFFFFLL / v25 || v16 < (uint64_t)0x8000000000000000LL / v25)
  {
LABEL_52:
    uint64_t v21 = __error();
    int v22 = 34;
    goto LABEL_43;
  }

  for (; v8 >= v26; --v10)
    v8 /= 10LL;
  uint64_t v27 = v25 * v16;
  uint64_t v28 = v8 * v25;
  if (v10)
  {
    unsigned int v29 = v10 - 1;
    if (v10 != 1)
    {
      do
      {
        v28 /= 10LL;
        --v29;
      }

      while (v29);
    }
  }

  uint64_t result = 0LL;
  if (v6 == -1) {
    uint64_t v28 = -v28;
  }
  *a2 = v28 + v27;
  return result;
}

uint64_t sub_100007418(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 200);
  if (*(_DWORD *)a3) {
    unsigned int v7 = "outgoing chmod";
  }
  else {
    unsigned int v7 = "incoming chmod";
  }
  if (sub_10001BB1C(*(uint64_t **)(v6 + 1128), a2, v7))
  {
    int v8 = sub_100024B60(v16, (_WORD *)a1);
    if (v8)
    {
      strerror(v8);
      sub_1000074E0(a1, "%s: failed to parse '%s': %s", v9, v10, v11, v12, v13, v14, (char)a2);
      return 0LL;
    }

    *(void *)(a3 + 24) = v16;
  }

  return 1LL;
}

void sub_1000074E0( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = *(void *)(a1 + 200);
  int v11 = vasprintf(&__s, a2, &a9);
  if (v11 != -1)
  {
    int v12 = *(_DWORD *)(v10 + 1172);
    if (!*(_DWORD *)(a1 + 144))
    {
      if (sub_10001F6EC(a1, v12, "@ERROR ", 7uLL)
        && sub_10001F6F4(a1, *(_DWORD *)(v10 + 1172), __s))
      {
        goto LABEL_18;
      }

      if (!dword_100058FD8) {
        goto LABEL_17;
      }
      int v20 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }

    if (sub_10001F4E8(a1, v12, __s, v11, 1))
    {
      if (sub_10001F4E8(a1, *(_DWORD *)(v10 + 1172), "\n", 1uLL, 1))
      {
LABEL_18:
        free(__s);
        return;
      }

      if (dword_100058FD8)
      {
        int v20 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        goto LABEL_16;
      }
    }

    else if (dword_100058FD8)
    {
      int v20 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_15:
      }
        sub_10003C9C4();
LABEL_16:
      *__error() = v20;
    }

LABEL_17:
    sub_1000218D4("io_write", v13, v14, v15, v16, v17, v18, v19, (char)&a9);
    goto LABEL_18;
  }

uint64_t sub_100007670(uint64_t a1, const char *a2, uint64_t a3, int a4)
{
  if (*(_DWORD *)(a3 + 120)) {
    return 1LL;
  }
  uint64_t v8 = *(void *)(a1 + 200);
  if (!sub_10001BB1C(*(uint64_t **)(v8 + 1128), a2, "numeric ids"))
  {
    *(_DWORD *)(a3 + 120) = a4 != 0;
    return 1LL;
  }

  if (sub_10001BC1C(*(uint64_t **)(v8 + 1128), a2, "numeric ids", &v17))
  {
    if (dword_100058FD8)
    {
      int v16 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C9F0();
      }
      *__error() = v16;
    }

    sub_1000218D4("%s: 'numeric ids' invalid", v9, v10, v11, v12, v13, v14, v15, (char)a2);
    return 0LL;
  }

  else
  {
    uint64_t result = 1LL;
    if (v17) {
      *(_DWORD *)(a3 + 120) = 1;
    }
  }

  return result;
}

uint64_t sub_10000776C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 200);
  if (!*(_DWORD *)(a3 + 568)
    && sub_10001BC1C(*(uint64_t **)(v6 + 1128), a2, "ignore errors", (int *)(a3 + 568)))
  {
    uint64_t v13 = "%s: 'ignore errors' invalid";
    goto LABEL_6;
  }

  if (sub_10001BC1C(*(uint64_t **)(v6 + 1128), a2, "ignore nonreadable", (int *)(a3 + 604)))
  {
    uint64_t v13 = "%s: 'ignore nonreadable' invalid";
LABEL_6:
    sub_1000074E0(a1, v13, v7, v8, v9, v10, v11, v12, v15);
    return 0LL;
  }

  return 1LL;
}

uint64_t sub_100007804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 200);
  uid_t v5 = geteuid();
  *(_BYTE *)(v4 + 1177) = v5 == 0;
  if (v5) {
    return 1LL;
  }
  if (!sub_1000078F4(v21, 0, (_DWORD *)(v4 + 1164)))
  {
    sub_1000074E0(a1, "%s: uid '%s' invalid", v7, v8, v9, v10, v11, v12, a2);
    return 0LL;
  }

  uint64_t v13 = (_DWORD *)(v4 + 1168);
  uint64_t v6 = 1LL;
  if (!sub_1000078F4(v22, 1, v13))
  {
    sub_1000074E0(a1, "%s: gid '%s' invalid", v14, v15, v16, v17, v18, v19, a2);
    return 0LL;
  }

  return v6;
}

uint64_t sub_1000078F4(const char *a1, int a2, _DWORD *a3)
{
  if (a2)
  {
    uid_t v5 = getgrnam(a1);
    if (v5)
    {
LABEL_3:
      LODWORD(v6) = v5[4];
LABEL_4:
      *a3 = v6;
      return 1LL;
    }
  }

  else
  {
    uid_t v5 = getpwnam(a1);
    if (v5) {
      goto LABEL_3;
    }
  }

  *__error() = 0;
  uint64_t v6 = strtoll(a1, &__endptr, 10);
  uint64_t v8 = __error();
  uint64_t result = 0LL;
  if (!*v8)
  {
    if (*__endptr) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = (unint64_t)(v6 - 0x80000000LL) >= 0xFFFFFFFF00000000LL;
    }
    if (v9) {
      goto LABEL_4;
    }
    return 0LL;
  }

  return result;
}

uint64_t sub_100007994(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 200);
  if (!*(_BYTE *)(v2 + 1177)) {
    return 1LL;
  }
  gid_t v5 = *(_DWORD *)(v2 + 1168);
  if (v5 && setgid(v5) == -1)
  {
    sub_1000074E0(a1, "%s: setgid to '%d' failed", v6, v7, v8, v9, v10, v11, a2);
  }

  else
  {
    uid_t v12 = *(_DWORD *)(v2 + 1164);
    if (!v12 || setuid(v12) != -1) {
      return 1LL;
    }
    sub_1000074E0(a1, "%s: setuid to '%d' failed", v13, v14, v15, v16, v17, v18, a2);
  }

  return 0LL;
}

uint64_t sub_100007A30(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 200);
  sub_100007ADC(v3, a2, "filter", 0LL, 0);
  sub_100007ADC(v3, a2, "include from", 2LL, 1);
  sub_100007ADC(v3, a2, "include", 2LL, 0);
  sub_100007ADC(v3, a2, "exclude from", 1LL, 1);
  sub_100007ADC(v3, a2, "exclude", 1LL, 0);
  return 1LL;
}

uint64_t sub_100007ADC(uint64_t a1, const char *a2, char *a3, uint64_t a4, int a5)
{
  uint64_t result = sub_10001BB1C(*(uint64_t **)(a1 + 1128), a2, a3);
  if ((_DWORD)result)
  {
    if (a5) {
      return (uint64_t)sub_10002B170(v11, a4, 10LL);
    }
    else {
      return sub_10002AA98(v11, a4, 0xAu);
    }
  }

  return result;
}

uint64_t sub_100007B64(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(void *)(a1 + 200);
  uint64_t v17 = 0LL;
  BOOL v5 = sub_10001BB1C(*(uint64_t **)(v4 + 1128), a2, "hosts deny");
  if (!sub_10001BB1C(*(uint64_t **)(v4 + 1128), a2, "hosts allow"))
  {
    int v12 = 0;
LABEL_9:
    if (!v5) {
      return 1LL;
    }
    goto LABEL_10;
  }

  if (sub_100007CE0(a1, __s1, &v16, (_DWORD *)&v17 + 1) == -1)
  {
    uint64_t v13 = "failed to process allow host list";
LABEL_19:
    sub_1000074E0(a1, v13, v6, v7, v8, v9, v10, v11, v15);
    return 0LL;
  }

  int v12 = HIDWORD(v17);
  if (SHIDWORD(v17) < 1) {
    goto LABEL_9;
  }
  if (v16) {
    return 1LL;
  }
  if (!v5) {
    goto LABEL_18;
  }
LABEL_10:
  if (sub_100007CE0(a1, __s1, &v16, &v17) == -1)
  {
    uint64_t v13 = "failed to process deny host list";
    goto LABEL_19;
  }

  if ((int)v17 < 1)
  {
    if (v12 >= 1)
    {
LABEL_18:
      char v15 = v4 + 16;
      uint64_t v13 = "access denied by allow policy from %s [%s]";
      goto LABEL_19;
    }
  }

  else if (v16)
  {
    sub_1000074E0(a1, "access denied by deny policy from %s [%s]", v6, v7, v8, v9, v10, v11, v4 + 16);
    return 0LL;
  }

  return 1LL;
}

uint64_t sub_100007CE0(uint64_t a1, char *__s1, BOOL *a3, _DWORD *a4)
{
  __stringp = strdup(__s1);
  if (__stringp)
  {
    int v13 = 0;
    uint64_t v14 = &v47;
    while (1)
    {
      while (1)
      {
        do
        {
          char v15 = (unsigned __int8 *)strsep(&__stringp, ", \t");
          BOOL v16 = (const char *)v15;
          if (!v15)
          {
LABEL_46:
            *a4 = v13;
            *a3 = v16 != 0LL;
            free(__stringp);
            return 0LL;
          }
        }

        while (!*v15);
        ++v13;
        uint64_t v17 = *(void *)(a1 + 200);
        uint64_t v18 = strrchr(v16, 47);
        if (v18) {
          break;
        }
      }

      uint64_t v19 = v18;
      uint64_t v40 = v14;
      uint64_t v41 = a4;
      int v20 = a3;
      uint64_t v21 = *(unsigned __int8 **)(v17 + 1088);
      int v22 = v21[1];
      int v23 = v18 + 1;
      *__error() = 0;
      unint64_t v24 = strtoul(v23, &__endptr, 10);
      if (*__error() || *__endptr)
      {
        if (v22 == 2) {
          uint64_t v25 = v45;
        }
        else {
          uint64_t v25 = v46;
        }
        if (inet_pton(v22, v23, v25) == 1)
        {
          char v44 = v22;
          goto LABEL_15;
        }

LABEL_36:
        a3 = v20;
        uint64_t v14 = v40;
        a4 = v41;
      }

      else
      {
        if (v22 == 2) {
          size_t v31 = 4LL;
        }
        else {
          size_t v31 = 16LL;
        }
        if (v22 == 2) {
          int v32 = v45;
        }
        else {
          int v32 = v46;
        }
        __b = v32;
        bzero(v32, v31);
        if (v24 > 8 * v31) {
          goto LABEL_36;
        }
        memset(__b, 255, v24 >> 3);
        if ((v24 & 7) != 0) {
          *((_BYTE *)__b + (v24 >> 3)) |= -1 << (8 - (v24 & 7));
        }
LABEL_15:
        *uint64_t v19 = 0;
        uint64_t v14 = v40;
        if (v22 == 2) {
          uint64_t v26 = v40;
        }
        else {
          uint64_t v26 = (int *)v48;
        }
        a3 = v20;
        a4 = v41;
        if (inet_pton(v22, v16, v26) == 1)
        {
          v46[121] = v22;
          uint64_t v27 = v21 + 8;
          unint64_t v28 = 16LL;
          if (v22 == 2)
          {
            unint64_t v28 = 4LL;
            uint64_t v27 = v21 + 4;
          }

          unsigned int v29 = v45;
          if (v22 != 2) {
            unsigned int v29 = v46;
          }
          uint64_t v30 = v48;
          if (v22 == 2) {
            uint64_t v30 = (unsigned __int8 *)v40;
          }
          if (((*v27 ^ *v30) & *v29) == 0)
          {
            uint64_t v33 = 1LL;
            while (v28 != v33)
            {
              int v34 = v27[v33] ^ v30[v33];
              int v35 = v29[v33++];
              if ((v34 & v35) != 0)
              {
                unint64_t v36 = v33 - 1;
                goto LABEL_45;
              }
            }

            unint64_t v36 = v28;
LABEL_45:
            if (v36 >= v28) {
              goto LABEL_46;
            }
          }
        }
      }
    }
  }

  sub_1000074E0(a1, "out of memory", v7, v8, v9, v10, v11, v12, v38);
  return 0xFFFFFFFFLL;
}

      uint64_t v21 = v19[4];
      v19 += 4;
      uint64_t v17 = v21;
      if (!v21) {
        goto LABEL_37;
      }
    }

    if ((!v18 || sub_10000949C(v17, 0))
      && !sub_10000961C(a1, &v33, &v30, &v29, (uint64_t)v19))
    {
      goto LABEL_48;
    }

    goto LABEL_36;
  }

uint64_t sub_100007FF0(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(void *)(a1 + 200);
  if (sub_10001BDDC(*(uint64_t **)(v4 + 1128), a2, "max connections", &v35))
  {
    if (dword_100058FD8)
    {
      int v11 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CC00();
      }
      *__error() = v11;
    }

    sub_100021850("%s: 'max connections' invalid", a2);
  }

  else if ((v35 & 0x80000000) != 0)
  {
    sub_1000074E0(a1, "module '%s' is currently disabled", v5, v6, v7, v8, v9, v10, (char)a2);
  }

  else
  {
    if (!v35) {
      return 0LL;
    }
    char v19 = (char)v36;
    if (*v36)
    {
      uint64_t v20 = v35;
      __int128 v37 = xmmword_100044F98;
      uint64_t v38 = 0x300000000LL;
      uint64_t v21 = *(void *)(a1 + 200);
      int v22 = open(v36, 513, 420LL);
      if (v22 == -1)
      {
        sub_1000074E0(a1, "%s: failed to open the lock file", v23, v24, v25, v26, v27, v28, (char)a2);
      }

      else
      {
        int v29 = v22;
        if ((int)v20 >= 1)
        {
          uint64_t v30 = 0LL;
          while (1)
          {
            *(void *)&__int128 v37 = v30 & 0xFFFFFFFC;
            *((void *)&v37 + 1) = 4LL;
            if (fcntl(v29, 8, &v37) != -1)
            {
              uint64_t result = 0LL;
              *(_DWORD *)(v21 + 1160) = v29;
              return result;
            }

            if (*__error() != 35) {
              break;
            }
            v30 += 4LL;
            if (4 * v20 == v30) {
              goto LABEL_32;
            }
          }

          if (dword_100058FD8)
          {
            int v34 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003CB78();
            }
            *__error() = v34;
          }

          sub_1000218D4("%s: lock fcntl", v31, v23, v24, v25, v26, v27, v28, v19);
        }

LABEL_32:
        sub_1000074E0(a1, "%s: too many connections (%d max)", v23, v24, v25, v26, v27, v28, (char)a2);
        close(v29);
      }
    }

    else
    {
      if (dword_100058FD8)
      {
        int v33 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003CB18();
        }
        *__error() = v33;
      }

      sub_1000218D4( "%s: 'lock file' is empty with 'max connections' in place",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (char)a2);
    }
  }

  return 1LL;
}

uint64_t sub_10000829C(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(void *)(a1 + 200);
  if (!sub_10001BB1C(*(uint64_t **)(v4 + 1128), a2, "pre-xfer exec")
    && !sub_10001BB1C(*(uint64_t **)(v4 + 1128), a2, "post-xfer exec"))
  {
    return 1LL;
  }

  if (sub_10001BB1C(*(uint64_t **)(v4 + 1128), a2, "post-xfer exec"))
  {
    uint64_t v5 = v35;
    if (*v35)
    {
      pid_t v6 = fork();
      if (v6)
      {
        pid_t v13 = v6;
        if (v6 != -1)
        {
          sub_1000098A0(*(void *)(a1 + 200), a2);
          sub_100009928("RSYNC_PID", v13);
          do
            pid_t v21 = waitpid(v13, (int *)__str, 0);
          while (v21 == -1 && *__error() == 4);
          if (v21 == v13)
          {
            uint64_t v22 = *(int *)__str;
          }

          else
          {
            *(_DWORD *)__str = -1;
            uint64_t v22 = -1LL;
          }

          sub_100009928("RSYNC_RAW_STATUS", v22);
          if ((__str[0] & 0x7F) != 0) {
            int v27 = -1;
          }
          else {
            int v27 = __str[1];
          }
          *(_DWORD *)__str = v27;
          sub_100009928("RSYNC_EXIT_STATUS", v27);
          system(v5);
          _exit(*(int *)__str);
        }

        uint64_t v14 = "%s: failed to fork for post-xfer";
        goto LABEL_18;
      }
    }
  }

  uint64_t v15 = v35;
  if (!*v35) {
    return 1LL;
  }
  uint64_t v16 = *(void *)(a1 + 200);
  pid_t v17 = getpid();
  if (pipe(v38) == -1 || (pid_t v18 = fork(), v18 == -1))
  {
    char v34 = (char)a2;
    uint64_t v14 = "%s: failed to stage pre-xfer process";
LABEL_18:
    sub_1000074E0(a1, v14, v7, v8, v9, v10, v11, v12, v34);
    return 0LL;
  }

  pid_t v19 = v18;
  if (v18)
  {
    close(v38[0]);
    *(_DWORD *)(v16 + 1152) = v38[1];
    *(_DWORD *)(v16 + 1156) = v19;
    return 1LL;
  }

  close(v38[1]);
  sub_100009928("RSYNC_PID", v17);
  sub_1000098A0(v16, a2);
  uint64_t v23 = (char *)sub_1000099A8(v38[0], &__n);
  uint64_t result = setenv("RSYNC_ARG0", "rsyncd", 1);
  size_t v24 = __n;
  if (!__n)
  {
LABEL_27:
    free(v23);
    close(0);
    close(1);
    __int16 v25 = system(v15);
    if ((v25 & 0x7F) != 0) {
      int v26 = 1;
    }
    else {
      int v26 = HIBYTE(v25);
    }
    _exit(v26);
  }

  uint64_t v28 = 0LL;
  int v29 = v23;
  while (v28 != 513)
  {
    uint64_t v30 = (char *)memchr(v29, 0, v24);
    if (!v30) {
      goto LABEL_27;
    }
    uint64_t v31 = v30;
    if (v28)
    {
      int v32 = snprintf(__str, 0x10uLL, "RSYNC_ARG%ld", v28);
      if (v32 == -1) {
        goto LABEL_27;
      }
    }

    else
    {
      int v32 = __strlcpy_chk(__str, "RSYNC_REQUEST", 16LL, 16LL);
    }

    if (v32 >= 16) {
      sub_10003CC60();
    }
    uint64_t result = setenv(__str, v29, 1);
    int v33 = (char *)(v29 - (v31 + 1));
    ++v28;
    int v29 = v31 + 1;
    v24 += (size_t)v33;
    if (!v24) {
      goto LABEL_27;
    }
  }

  __break(1u);
  return result;
}

BOOL sub_100008618(uint64_t a1, char *__s, char *a3, size_t a4)
{
  uint64_t v4 = *(void *)(a1 + 200);
  pid_t v5 = *(_DWORD *)(v4 + 1156);
  int v6 = *(_DWORD *)(v4 + 1152);
  if (v6 == -1 || v5 <= 0) {
    sub_10003CCD8();
  }
  BOOL v13 = 0;
  if (__s)
  {
    size_t v12 = strlen(__s) + 1;
    size_t __buf = v12 + a4;
    if (!sub_100008778(v6, (char *)&__buf, 8uLL)
      || !sub_100008778(v6, __s, v12)
      || !sub_100008778(v6, a3, a4))
    {
      BOOL v13 = 1;
    }
  }

  close(v6);
  *(_DWORD *)(v4 + 1152) = -1;
  while (1)
  {
    pid_t v14 = waitpid(v5, &v31, 0);
    if (v14 == v5) {
      break;
    }
    if (v14 == -1 && *__error() != 4)
    {
      sub_1000074E0(a1, "error waiting for pre-exec xfer child", v21, v22, v23, v24, v25, v26, v30);
      return 0LL;
    }
  }

  if ((v31 & 0x7F) == 0 && (v31 & 0xFF00) != 0)
  {
    int v29 = "pre-xfer exec command denies transfer";
LABEL_23:
    sub_1000074E0(a1, v29, v15, v16, v17, v18, v19, v20, v30);
    BOOL v13 = 1;
    goto LABEL_24;
  }

  if ((v31 & 0x7F) != 0)
  {
    int v29 = "pre-xfer exec command failed";
    goto LABEL_23;
  }

uint64_t sub_100008778(int __fd, char *__buf, size_t __nbyte)
{
  if (!__nbyte) {
    return 1LL;
  }
  size_t v3 = __nbyte;
  uint64_t v6 = 0LL;
  uint64_t v7 = __buf;
  while (1)
  {
    while (1)
    {
      ssize_t v8 = write(__fd, v7, v3);
      ssize_t v9 = v8;
      if (v8 <= 0) {
        break;
      }
      v6 += v8;
      uint64_t v7 = &__buf[v6];
      uint64_t result = 1LL;
      v3 -= v9;
      if (!v3) {
        return result;
      }
    }

    if (v8 != -1) {
      break;
    }
    if (*__error() != 4)
    {
      if (dword_100058FD8)
      {
        int v18 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003CD00();
        }
        *__error() = v18;
      }

      sub_1000218D4("write", v10, v11, v12, v13, v14, v15, v16, v19);
      return 0LL;
    }
  }

  return 0LL;
}

uint64_t sub_100008868(uint64_t a1, const char *a2, const sockaddr *a3, socklen_t a4)
{
  uint64_t v8 = *(void *)(a1 + 200);
  if (!sub_10001BB1C(*(uint64_t **)(v8 + 1128), a2, "hosts allow")
    && !sub_10001BB1C(*(uint64_t **)(v8 + 1128), a2, "hosts deny")
    && !sub_10001BB1C(*(uint64_t **)(v8 + 1128), a2, "pre-xfer exec")
    && !sub_10001BB1C(*(uint64_t **)(v8 + 1128), a2, "post-xfer exec"))
  {
    return 1LL;
  }

  int v9 = getnameinfo(a3, a4, (char *)(v8 + 16), 0x401u, 0LL, 0, 0);
  if (!v9) {
    return 1LL;
  }
  gai_strerror(v9);
  sub_1000074E0(a1, "%s: reverse dns lookup failed: %s", v10, v11, v12, v13, v14, v15, (char)a2);
  return 0LL;
}

uint64_t sub_100008950(uint64_t a1, const char *a2, int a3)
{
  BOOL v6 = a3 != 0;
  BOOL v24 = a3 == 0;
  uint64_t v7 = *(void *)(a1 + 200);
  if (sub_10001BB1C(*(uint64_t **)(v7 + 1128), a2, "munge symlinks"))
  {
    if (sub_10001BC1C(*(uint64_t **)(v7 + 1128), a2, "munge symlinks", (int *)&v24))
    {
      sub_1000074E0(a1, "%s: 'munge symlinks' invalid", v8, v9, v10, v11, v12, v13, (char)a2);
      return 0LL;
    }

    BOOL v6 = !v24;
  }

  if (!a3 || !v6)
  {
    if (v6)
    {
      uint64_t v15 = sub_100008BAC;
LABEL_15:
      *(void *)(a1 + 232) = v15;
      return 1LL;
    }

    if (stat("/rsyncd-munged/", &v23) == -1)
    {
      if (*__error() != 2)
      {
        uint64_t v22 = "%s: failed to stat munge dir";
        goto LABEL_18;
      }
    }

    else if ((v23.st_mode & 0xF000) == 0x4000)
    {
      uint64_t v22 = "%s: security violation: munger failure";
LABEL_18:
      sub_1000074E0(a1, v22, v16, v17, v18, v19, v20, v21, (char)a2);
      return 0LL;
    }

    uint64_t v15 = sub_100008A74;
    goto LABEL_15;
  }

  return 1LL;
}

uint64_t sub_100008A74(char *__s1, char **a2, int a3)
{
  if (a3)
  {
    if (dword_100058FD8)
    {
      int v13 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C0F8();
      }
      *__error() = v13;
    }

    uint64_t v14 = "asprintf";
  }

  else
  {
    if (strncmp(__s1, "/rsyncd-munged/", 0xFuLL))
    {
      uint64_t result = 0LL;
      *a2 = 0LL;
      return result;
    }

    uint64_t v15 = strdup(__s1 + 15);
    *a2 = v15;
    if (v15) {
      return 0LL;
    }
    if (dword_100058FD8)
    {
      int v16 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CD2C();
      }
      *__error() = v16;
    }

    uint64_t v14 = "strdup";
  }

  sub_1000218D4(v14, v5, v6, v7, v8, v9, v10, v11, v17);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100008BAC(const char *a1, char **a2, int a3)
{
  if (a3)
  {
    uint64_t v4 = sub_10000CB9C(a1);
    *a2 = v4;
    if (v4)
    {
      return 0LL;
    }

    else
    {
      if (dword_100058FD8)
      {
        int v6 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003CD58();
        }
        *__error() = v6;
      }

      sub_100021980("make_safe_link");
      return 12LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *a2 = 0LL;
  }

  return result;
}

uint64_t sub_100008C44(uint64_t a1, const char *a2)
{
  if (sub_10001BDDC(*(uint64_t **)(*(void *)(a1 + 200) + 1128LL), a2, "max verbosity", &v6))
  {
    if (dword_100058FD8)
    {
      int v3 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CD84();
      }
      *__error() = v3;
    }

    sub_100021850("%s: 'max verbosity' invalid", a2);
    return 0LL;
  }

  else
  {
    int v5 = dword_100058FDC;
    if (dword_100058FDC >= v6) {
      int v5 = v6;
    }
    dword_100058FDC = v5;
    return 1LL;
  }

uint64_t sub_100008D10(char *__s2, size_t __n, char *__s1)
{
  size_t v4 = __n;
  if (!__n) {
    size_t v4 = strlen(__s2);
  }
  uint64_t result = strncmp(__s1, __s2, v4);
  if (!(_DWORD)result)
  {
    if (__s1[v4] == 47)
    {
      uint64_t v7 = &__s1[v4 + 1];
      size_t v8 = strlen(v7) + 1;
      return (uint64_t)memmove(__s1, v7, v8);
    }

    else if (!__s1[v4])
    {
      *int __s1 = 0;
    }
  }

  return result;
}

size_t sub_100008DA4(char *a1, int a2, char **a3)
{
  LODWORD(v4) = a2;
  size_t result = strlen(a1);
  if ((int)v4 >= 1)
  {
    size_t v7 = result;
    uint64_t v4 = v4;
    do
    {
      size_t v8 = *a3++;
      size_t result = sub_100008D10(a1, v7, v8);
      --v4;
    }

    while (v4);
  }

  return result;
}

uint64_t sub_100008DFC(char *__filename, int a2)
{
  if (!__filename || (char v2 = (char)__filename, !*__filename))
  {
    uint64_t v4 = 0LL;
    goto LABEL_12;
  }

  uint64_t v4 = fopen(__filename, "a");
  if (v4)
  {
LABEL_12:
    sub_1000216C0((uint64_t)v4);
    return 1LL;
  }

  if (a2)
  {
    if (dword_100058FD8)
    {
      int v12 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CDE4();
      }
      *__error() = v12;
    }

    sub_1000218D4("%s: fopen", v5, v6, v7, v8, v9, v10, v11, v2);
  }

  return 0LL;
}

BOOL sub_100008EC0( uint64_t a1, _DWORD *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = (char)a3;
  uint64_t v10 = *(void *)(a1 + 200);
  if (*a2)
  {
    if (sub_10001BC1C(*(uint64_t **)(v10 + 1128), a3, "write only", (int *)&v14))
    {
      if (dword_100058FD8)
      {
        int v11 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003CEA4();
        }
        *__error() = v11;
      }

      sub_100021850("%s: 'write only' invalid");
      return 0LL;
    }

    goto LABEL_18;
  }

  if ((_DWORD)a4 == -1)
  {
    if (sub_10001BC1C(*(uint64_t **)(v10 + 1128), a3, "read only", (int *)&v14))
    {
      if (dword_100058FD8)
      {
        int v13 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003CE44();
        }
        *__error() = v13;
      }

      sub_100021850("%s: 'read only' invalid");
      return 0LL;
    }

LABEL_18:
    a4 = v14;
    if (v14) {
      goto LABEL_19;
    }
    return 1LL;
  }

  unsigned int v14 = a4;
  if (!(_DWORD)a4) {
    return 1LL;
  }
LABEL_19:
  sub_1000074E0(a1, "module '%s' is %s-protected", (uint64_t)a3, a4, a5, a6, a7, a8, v8);
  return v14 == 0;
}

    sub_1000411D0(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_19;
  }

  return result;
}

uint64_t sub_100009054(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(void *)(a1 + 200);
  __stringp = strdup(__s1);
  if (!__stringp)
  {
    sub_1000074E0(a1, "out of memory", v5, v6, v7, v8, v9, v10, v27);
    return 0LL;
  }

  unint64_t v29 = 0LL;
  unint64_t v30 = 0LL;
  size_t v27 = 0LL;
  size_t v28 = 0LL;
  int v33 = 0LL;
  __s = 0LL;
  int v11 = strsep(&__stringp, " ");
  if (!v11) {
    goto LABEL_50;
  }
  int v12 = v11;
  int v13 = 0;
  while (1)
  {
    __darwin_ct_rune_t v14 = *v12;
    if (*v12)
    {
      if (v14 < 0)
      {
        if (!__maskrune(v14, 0x40000uLL)) {
          break;
        }
      }

      else if ((_DefaultRuneLocale.__runetype[v14] & 0x40000) == 0)
      {
        break;
      }

      char v15 = *v12;
      if (v15 == 97) {
        v13 |= v12[1] == 0;
      }
      if (v12[1]) {
        break;
      }
    }

LABEL_40:
    int v12 = strsep(&__stringp, " ");
    if (!v12)
    {
      if (__s)
      {
        if ((v13 & 1) != 0)
        {
          char v22 = 114;
          uint64_t v23 = &_mh_execute_header.magic + 1;
          do
          {
            char v22 = aRlptgod[v23++];
          }

          while (v23 != 8);
        }

        else if (!strchr(__s, 97))
        {
          uint64_t v26 = 7LL;
          do
          {
            --v26;
          }

          while (v26);
        }

        uint64_t v25 = __s;
        if (strchr(__s, 68))
        {
          uint64_t result = sub_1000096E4(a1, &v33, &v30, &v29, "devices");
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t result = sub_1000096E4(a1, &v33, &v30, &v29, "specials");
          if (!(_DWORD)result) {
            return result;
          }
        }

        if (strchr(v25, 80))
        {
          uint64_t result = sub_1000096E4(a1, &v33, &v30, &v29, "partial");
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t result = sub_1000096E4(a1, &v33, &v30, &v29, "progress");
          if (!(_DWORD)result) {
            return result;
          }
        }

        goto LABEL_51;
      }

LABEL_50:
      uint64_t v25 = 0LL;
LABEL_51:
      *(void *)(v4 + 1192) = v25;
      *(void *)(v4 + 1184) = v33;
      *(void *)(v4 + 1200) = v30;
      return 1LL;
    }
  }

  int v16 = strchr(v12, 42);
  char v17 = "address";
  if ("address")
  {
    uint64_t v18 = v16;
    uint64_t v19 = &off_100054AE0;
    while (1)
    {
      if (v19[2]) {
        break;
      }
      uint64_t v20 = *((unsigned int *)v19 + 6);
      if (v20 > 0x7F)
      {
        if (!__maskrune(*((_DWORD *)v19 + 6), 0x40000uLL)) {
          break;
        }
      }

      else if ((_DefaultRuneLocale.__runetype[v20] & 0x40000) == 0)
      {
        break;
      }

      if (!v18 || sub_10000949C(0LL, (char)v20))
      {
        if ((_DWORD)v20 == 97) {
          v13 |= strcmp(v12, "archive") == 0;
        }
      }

LABEL_37:
  if (sub_10002A518((unsigned __int8 *)v12, "delete", 0)
    || sub_1000096E4(a1, &v33, &v30, &v29, "remove-sent-files")
    && sub_1000096E4(a1, &v33, &v30, &v29, "remove-source-files"))
  {
    goto LABEL_40;
  }

LABEL_48:
  free(__stringp);
  free(__s);
  free(v33);
  return 0LL;
}

    unint64_t v30 = *(void *)(v20 + 24);
    if (!v30)
    {
      int v31 = 0;
      goto LABEL_99;
    }

    v117 = v29;
    uint64_t v41 = *(const char ***)(v20 + 16);
    do
    {
      uint64_t v42 = *v41;
      if (v42[strcspn(*v41, ":/")] == 58) {
        goto LABEL_91;
      }
      ++v41;
      --v30;
    }

    while (v30);
    int v31 = 0;
    goto LABEL_98;
  }

  if (!**(_BYTE **)(v20 + 48)) {
    errx(1, "empty remote module", v113);
  }
  unint64_t v29 = *(void *)(v20 + 8);
  int v47 = *(_DWORD *)(v20 + 40);
  if (v47 == 1)
  {
    v87 = *(void *)(v20 + 24);
    if (v87)
    {
      v88 = *(const char ***)(v20 + 16);
      do
      {
        if (!sub_1000272B0(*v88)) {
          errx(1, "non-remote daemon file in list of remote daemon sources: %s");
        }
        ++v88;
        --v87;
      }

      while (v87);
    }

    int v47 = 1;
    if (v29) {
      goto LABEL_88;
    }
LABEL_82:
    __assert_rtn("fargs_parse", "main.c", 428, "f->host != NULL");
  }

  if (v47)
  {
LABEL_87:
    if (v29) {
      goto LABEL_88;
    }
    goto LABEL_82;
  }

unint64_t sub_10000949C(char *__s1, int a2)
{
  if (!__s1 && !a2) {
    sub_10003CFA4();
  }
  if ((__s1 != 0LL) == (a2 != 0)) {
    sub_10003CF7C();
  }
  if (a2)
  {
    unint64_t v3 = 0x3FDFFFFFFFFFFFFEuLL >> (a2 - 48);
  }

  else if (!strcmp(__s1, "server"))
  {
    LOBYTE(v3) = 0;
  }

  else
  {
    unint64_t v4 = 0LL;
    do
    {
      unint64_t v5 = v4;
      if (v4 == 6) {
        break;
      }
      int v6 = strcmp(__s1, off_100054670[v4 + 1]);
      unint64_t v4 = v5 + 1;
    }

    while (v6);
    LOBYTE(v3) = v5 > 5;
  }

  return v3 & 1;
}

uint64_t sub_100009564(uint64_t a1, const char **a2, size_t *a3, size_t *a4, int __c)
{
  uint64_t v8 = *a2;
  if (!*a2)
  {
    size_t v11 = strlen("0468B:CDEFHIKLOPRSVWabcde:f:ghklnopqrtuvxyz");
    *a4 = v11;
    int v12 = (const char *)calloc(1uLL, v11 + 1);
    if (!v12)
    {
      sub_1000074E0(a1, "out of memory", v13, v14, v15, v16, v17, v18, v21);
      return 0LL;
    }

    uint64_t v8 = v12;
    *a2 = v12;
  }

  if (!strchr(v8, __c))
  {
    size_t v19 = *a3;
    if (*a3 >= *a4) {
      sub_10003CFCC();
    }
    *a3 = v19 + 1;
    v8[v19] = __c;
  }

  return 1LL;
}

uint64_t sub_10000961C(uint64_t a1, void **a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v9 = *a2;
  unint64_t v10 = *a3;
  if (*a3 == *a4)
  {
    *a4 = v10 + 8;
    uint64_t v9 = sub_100006FD4(v9, v10 + 8, 8uLL);
    if (!v9)
    {
      sub_1000074E0(a1, "out of memory", v12, v13, v14, v15, v16, v17, v21);
      return 0LL;
    }

    *a2 = v9;
    unint64_t v10 = *a3;
  }

  if (v10)
  {
    uint64_t v18 = v9;
    unint64_t v19 = v10;
    while (*v18 != a5)
    {
      ++v18;
      if (!--v19) {
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    if (v10 >= *a4) {
      sub_10003CFF4();
    }
    *a3 = v10 + 1;
    *((void *)v9 + v10) = a5;
  }

  return 1LL;
}

uint64_t sub_1000096E4(uint64_t a1, void **a2, unint64_t *a3, unint64_t *a4, char *__s2)
{
  int v6 = "address";
  if (!"address") {
    return 1LL;
  }
  size_t v11 = &off_100054AE0;
  while (strcmp(v6, __s2))
  {
    uint64_t v12 = v11[4];
    v11 += 4;
    int v6 = v12;
    if (!v12) {
      return 1LL;
    }
  }

  return sub_10000961C(a1, a2, a3, a4, (uint64_t)v11);
}

uint64_t sub_100009778(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 200);
  __filename = 0LL;
  sub_1000216C0(0LL);
  if (dword_100058FD8)
  {
    int v5 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003D01C();
    }
    *__error() = v5;
  }

  sub_100021980("%s: 'syslog facility' does not exist: %s", a2, v6);
  return 0LL;
}

uint64_t sub_1000098A0(uint64_t a1, const char *a2)
{
  if (*(void *)(a1 + 1096)) {
    uint64_t v3 = *(const char **)(a1 + 1096);
  }
  else {
    uint64_t v3 = "";
  }
  return setenv("RSYNC_USER_NAME", v3, 1);
}

uint64_t sub_100009928(const char *a1, uint64_t a2)
{
  uint64_t result = snprintf(__str, 0x20uLL, "%ld", a2);
  return result;
}

void *sub_1000099A8(int a1, size_t *a2)
{
  int v4 = fcntl(a1, 3);
  if (v4 != -1 && (v4 & 4) != 0) {
    fcntl(a1, 4, v4 & 0xFFFFFFFB);
  }
  if (!sub_100009A5C(a1, (uint64_t)&__size, 8uLL)
    || (v6 = __size, (uint64_t v7 = malloc(__size)) == 0LL)
    || (uint64_t v8 = v7, !sub_100009A5C(a1, (uint64_t)v7, v6)))
  {
    _exit(1);
  }

  close(a1);
  *a2 = __size;
  return v8;
}

uint64_t sub_100009A5C(int a1, uint64_t a2, size_t a3)
{
  if (!a3) {
    return 1LL;
  }
  size_t v3 = a3;
  uint64_t v6 = 0LL;
  while (1)
  {
    ssize_t v7 = read(a1, (void *)(a2 + v6), v3);
    if (v7 <= 0) {
      break;
    }
LABEL_4:
    v6 += v7;
    v3 -= v7;
    if (!v3) {
      return 1LL;
    }
  }

  while (v7 == -1 && (*__error() == 4 || *__error() == 35))
  {
    ssize_t v7 = read(a1, (void *)(a2 + v6), v3);
    if (v7 >= 1) {
      goto LABEL_4;
    }
  }

  return 0LL;
}

  ;
}

uint64_t sub_100009B28(void *a1, uint64_t a2, uint64_t a3)
{
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v69 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  uint64_t v53 = a2;
  LODWORD(v54) = 1;
  DWORD2(v54) = 29;
  HIDWORD(v69) = 29;
  DWORD1(v65) = -1;
  sub_10003225C(a1, (uint64_t)&v53);
  sub_100032094((uint64_t)a1);
  uint64_t v6 = open(*(const char **)(v53 + 520), 0);
  if ((_DWORD)v6 != -1)
  {
    uint64_t v14 = v6;
    if (sub_100020708(&v53, v6, &v50))
    {
      if (sub_100020708(&v53, v14, &v51))
      {
        if (sub_100020708(&v53, v14, &v52))
        {
          if (v51 <= 26)
          {
            if (dword_100058FD8)
            {
              int v21 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003D158();
              }
              *__error() = v21;
            }

            sub_100021850("batch protocol %d is older than our minimum supported %d: exiting");
LABEL_33:
            uint64_t v30 = 14LL;
            goto LABEL_34;
          }

          if (v51 > SDWORD2(v54))
          {
            if (dword_100058FD8)
            {
              int v32 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003D1C8();
              }
              *__error() = v32;
            }

            sub_100021850("batch protocol %d is newer than our maximum supported %d: exiting");
            goto LABEL_33;
          }

          uint64_t v49 = a3;
          uint64_t v34 = 0LL;
          unsigned int v35 = &off_1000546A8;
          unint64_t v36 = &dword_100058FD8;
          while (v34 != 7 || SHIDWORD(v69) >= 29)
          {
            int v37 = (v50 >> v34) & 1;
            uint64_t v38 = v35[1];
            if (*(_DWORD *)&v38[a2] != v37)
            {
              if (*v36)
              {
                uint64_t v39 = v36;
                int v40 = *__error();
                uint64_t v41 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v42 = *v35;
                  int v43 = *(_DWORD *)&v38[a2];
                  *(_DWORD *)buf = 136315650;
                  *(void *)v71 = v42;
                  *(_WORD *)&v71[8] = 1024;
                  *(_DWORD *)uint64_t v72 = v43;
                  *(_WORD *)&v72[4] = 1024;
                  int v73 = v37;
                  _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Mismatch of %s option, changing from %d -> %d",  buf,  0x18u);
                }

                *__error() = v40;
                unint64_t v36 = v39;
              }

              sub_100021744( 0,  "Mismatch of %s option, changing from %d -> %d",  v15,  v16,  v17,  v18,  v19,  v20,  (char)*v35);
            }

            *(_DWORD *)&v38[a2] = v37;
            ++v34;
            v35 += 3;
            if (v34 == 8)
            {
              if (SHIDWORD(v69) > 28) {
                goto LABEL_52;
              }
              break;
            }
          }

          if (*(_DWORD *)(a2 + 32))
          {
            int v44 = 1;
          }

          else
          {
            if (*(_DWORD *)(a2 + 192) != 1)
            {
LABEL_52:
              HIDWORD(v54) = v51;
              char v45 = BYTE8(v54);
              if (v51 < SDWORD2(v54)) {
                HIDWORD(v69) = v51;
              }
              DWORD1(v54) = v52;
              if (*v36)
              {
                int v46 = *__error();
                int v47 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v71 = DWORD2(v54);
                  *(_WORD *)&v71[4] = 1024;
                  *(_DWORD *)&v71[6] = HIDWORD(v54);
                  *(_WORD *)uint64_t v72 = 1024;
                  *(_DWORD *)&v72[2] = DWORD1(v54);
                  _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "batch detected client version %d, batch version %d, seed %d\n",  buf,  0x14u);
                }

                *__error() = v46;
                char v45 = BYTE8(v54);
              }

              sub_100021744( 1,  "batch detected client version %d, batch version %d, seed %d\n",  v15,  v16,  v17,  v18,  v19,  v20,  v45);
              if (sub_100028E84((uint64_t)&v53, (uint64_t)a1, v14, v14, *(char **)(v49 + 32)))
              {
                uint64_t v30 = 0LL;
                goto LABEL_34;
              }

              if (*v36)
              {
                int v48 = *__error();
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                  sub_10003C8C4();
                }
                *__error() = v48;
              }

              sub_100021980("rsync_receiver");
              goto LABEL_33;
            }

            int v44 = 0;
          }

          *(_DWORD *)(a2 + 192) = v44;
          goto LABEL_52;
        }

        if (dword_100058FD8)
        {
          int v31 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_24:
          }
            sub_10003C7E8();
LABEL_25:
          *__error() = v31;
        }
      }

      else if (dword_100058FD8)
      {
        int v31 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }

    else if (dword_100058FD8)
    {
      int v31 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      goto LABEL_25;
    }

    sub_100021980("io_read_int");
    uint64_t v30 = 2LL;
LABEL_34:
    close(v14);
    return v30;
  }

  if (dword_100058FD8)
  {
    int v22 = *__error();
    uint64_t v23 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003D0EC((uint64_t)&v53, v23, v24, v25, v26, v27, v28, v29);
    }
    *__error() = v22;
  }

  sub_1000218D4("%s: open", v7, v8, v9, v10, v11, v12, v13, *(void *)(v53 + 520));
  return 14LL;
}

uint64_t sub_10000A130(_DWORD *a1)
{
  char v2 = *(const char **)(*(void *)a1 + 528LL);
  if (!v2) {
    sub_10003D23C();
  }
  if (a1[47] != -1) {
    sub_10003D2D0();
  }
  int v3 = open(v2, 1537, 384LL);
  if (v3 != -1)
  {
    int v11 = v3;
    int v12 = 0;
    int v13 = 0;
    uint64_t v14 = 0LL;
    uint64_t v15 = &qword_1000546B0;
    while (1)
    {
      if (v14 == 7)
      {
        int v16 = a1[65];
        if (v16 < 29) {
          break;
        }
      }

      uint64_t v17 = *v15;
      v15 += 3;
      if (*(_DWORD *)(v17 + *(void *)a1))
      {
        int v12 = (1 << v14) | v13;
        int v13 = v12;
      }

      if (++v14 == 8)
      {
        int v16 = a1[65];
        break;
      }
    }

    int v18 = a1[3];
    if (sub_10001FFB4((uint64_t)a1, v3, v12))
    {
      if (sub_10001FFB4((uint64_t)a1, v11, v16))
      {
        if (sub_10001FFB4((uint64_t)a1, v11, v18))
        {
          uint64_t result = 0LL;
          a1[47] = v11;
          return result;
        }

        if (!dword_100058FD8) {
          goto LABEL_30;
        }
        int v28 = *__error();
        if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }

      if (dword_100058FD8)
      {
        int v28 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        goto LABEL_29;
      }
    }

    else if (dword_100058FD8)
    {
      int v28 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_28:
      }
        sub_10003C7BC();
LABEL_29:
      *__error() = v28;
    }

LABEL_30:
    sub_100021980("io_write_int");
    close(v11);
    return 2LL;
  }

  if (dword_100058FD8)
  {
    int v20 = *__error();
    int v21 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003D264((uint64_t)a1, v21, v22, v23, v24, v25, v26, v27);
    }
    *__error() = v20;
  }

  sub_1000218D4("%s: open", v4, v5, v6, v7, v8, v9, v10, *(void *)(*(void *)a1 + 528LL));
  return 14LL;
}

void sub_10000A388(_DWORD *a1, uint64_t a2, int a3)
{
  int v4 = a1[47];
  if (v4 != -1)
  {
    close(v4);
    a1[47] = -1;
    if (!a3)
    {
      if (snprintf(__str, 0x400uLL, "%s.sh", *(const char **)(*(void *)a1 + 528LL)) < 1024)
      {
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        *(_OWORD *)buf = 0u;
        uint64_t v10 = *(void *)(a2 + 32);
        uint64_t v42 = 0LL;
        *(void *)&__int128 v41 = v10;
        int v11 = (void *)sub_1000134A0(a1, (uint64_t)buf, 0LL);
        int v12 = (const char **)sub_10002C0B0((uint64_t)a1);
        int v13 = fopen(__str, "w");
        if (v13)
        {
          int v21 = v13;
          fwrite("#!/bin/sh\n\n", 0xBuLL, 1uLL, v13);
          if (v11[1])
          {
            uint64_t v22 = v11 + 2;
            do
            {
              uint64_t v23 = (const char *)*(v22 - 2);
              if (!strcmp(v23, ".")) {
                break;
              }
              if (strcmp(v23, "--server"))
              {
                if (!strncmp(v23, "--only-write-batch", 0x12uLL)) {
                  fprintf(v21, "--read-batch=%s ");
                }
                else {
                  fprintf(v21, "%s ");
                }
              }
            }

            while (*v22++);
          }

          free(v11);
          if (*v12)
          {
            if ((int)a1[65] <= 28)
            {
              uint64_t v25 = "--exclude-from=- ";
              size_t v26 = 17LL;
            }

            else
            {
              uint64_t v25 = "--filter=. -";
              size_t v26 = 14LL;
            }

            fwrite(v25, v26, 1uLL, v21);
          }

          fprintf(v21, "${1-%s}", (const char *)v41);
          if (*v12)
          {
            fwrite(" <<@REOF@\n", 0xAuLL, 1uLL, v21);
            unsigned int v35 = *v12;
            if (*v12)
            {
              unint64_t v36 = v12 + 1;
              do
              {
                fprintf(v21, "%s\n", v35);
                int v37 = *v36++;
                unsigned int v35 = v37;
              }

              while (v37);
            }

            fwrite("@REOF@", 6uLL, 1uLL, v21);
          }

          free(v12);
          fputc(10, v21);
          fclose(v21);
        }

        else
        {
          if (dword_100058FD8)
          {
            int v27 = *__error();
            int v28 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003D2F8((uint64_t)__str, v28, v29, v30, v31, v32, v33, v34);
            }
            *__error() = v27;
          }

          sub_1000218D4("%s: fopen", v14, v15, v16, v17, v18, v19, v20, (char)__str);
        }
      }

      else
      {
        if (dword_100058FD8)
        {
          int v7 = *__error();
          uint64_t v8 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            uint64_t v9 = *(void *)(*(void *)a1 + 528LL);
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s.sh: path too long, did not write batch shell",  buf,  0xCu);
          }

          *__error() = v7;
        }

        sub_100021A18("%s.sh: path too long, did not write batch shell", *(const char **)(*(void *)a1 + 528LL));
      }
    }
  }

void sub_10000A718(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t sub_10000A738(int a1, char *const *a2, uint64_t a3)
{
  __filename = 0LL;
  uint64_t v6 = 0LL;
  __int128 v90 = 0u;
  __int128 v93 = 0u;
  __int128 v92 = 0u;
  __int128 v91 = 0u;
  __int128 v89 = 0u;
  __int128 v88 = 0u;
  __int128 v87 = 0u;
  __int128 v86 = 0u;
  __int128 v85 = 0u;
  __int128 v84 = 0u;
  __int128 v83 = 0u;
  __int128 v82 = 0u;
  __int128 v81 = 0u;
  __int128 v80 = 0u;
  __int128 v79 = 0u;
  __int128 v78 = 0u;
  uint64_t v77 = a3;
  *(void *)&__int128 v90 = v97;
  v98 = "/etc/rsyncd.conf";
  uint64_t v7 = 1LL;
  int v104 = -1;
  int v73 = (void *)(a3 + 464);
  uint64_t v72 = (void *)(a3 + 256);
  v71 = (void *)(a3 + 264);
  int v103 = -1;
  optreset = 1;
  optind = 1;
  while (1)
  {
    uint64_t v8 = v7;
    uint64_t v9 = v6;
    int v10 = getopt_long(a1, a2, "46hv", (const option *)&off_100054768, 0LL);
    if (v10 > 103)
    {
      uint64_t v7 = 0LL;
      uint64_t v6 = v9;
      switch(v10)
      {
        case 118:
          ++dword_100058FDC;
          goto LABEL_20;
        case 119:
        case 120:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 135:
          goto LABEL_76;
        case 128:
          uint64_t v6 = 1LL;
          uint64_t v7 = v8;
          if ((_DWORD)v9) {
            sub_10003D510();
          }
          continue;
        case 129:
          continue;
        case 130:
          int v12 = optarg;
          int v13 = (char **)(a3 + 264);
          goto LABEL_15;
        case 131:
          *(void *)(a3 + 472) = v76;
          goto LABEL_20;
        case 132:
          v98 = optarg;
          goto LABEL_20;
        case 133:
          int v12 = optarg;
          int v13 = (char **)(a3 + 256);
          goto LABEL_15;
        case 134:
          __filename = optarg;
          goto LABEL_20;
        case 136:
          int v12 = optarg;
          int v13 = (char **)(a3 + 464);
LABEL_15:
          *int v13 = v12;
          goto LABEL_20;
        default:
          if (v10 == 104) {
            sub_10000ADAC(0);
          }
          goto LABEL_76;
      }
    }

    if (v10 == 52)
    {
      int v11 = 4;
      goto LABEL_9;
    }

    if (v10 != 54) {
      break;
    }
    int v11 = 6;
LABEL_9:
    *(_DWORD *)(a3 + 560) = v11;
LABEL_20:
    uint64_t v6 = v9;
    uint64_t v7 = v8;
  }

  if (v10 != -1) {
LABEL_76:
  }
    sub_10000ADAC(1);
  dword_100058FF0 = -1;
  BOOL v14 = sub_100035058(0);
  if (!v14)
  {
    if ((_DWORD)v8)
    {
      uint64_t v15 = sub_100006F0C(0, 0);
      if ((_DWORD)v15 == -1) {
        sub_10003D35C(v15);
      }
    }
  }

  uint64_t v16 = sub_10001B248((uint64_t)&v77, v98, 0);
  uint64_t v100 = v16;
  if (!v16) {
    return 14LL;
  }
  if (v14) {
    goto LABEL_28;
  }
  uint64_t v96 = 0x300000000LL;
  sockaddr v95 = (sockaddr)xmmword_100044FE0;
  uint64_t v18 = v90;
  if (sub_10001BE38(v16, "global", "pid file", &v94))
  {
    uint64_t v19 = "";
    v94 = "";
  }

  else
  {
    uint64_t v19 = v94;
  }

  if (!*v19) {
    goto LABEL_28;
  }
  int v28 = fopen(v19, "w");
  if (!v28)
  {
    if (dword_100058FD8)
    {
      int v53 = *__error();
      __int128 v54 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D3C0((uint64_t)&v94, v54, v55, v56, v57, v58, v59, v60);
      }
      *__error() = v53;
    }

    sub_1000218D4("%s: fopen", v29, v30, v31, v32, v33, v34, v35, (char)v94);
    return 14LL;
  }

  unint64_t v36 = v28;
  int v37 = fileno(v28);
  if (fcntl(v37, 8, &v95))
  {
    fclose(v36);
    if (*__error() == 35)
    {
      if (dword_100058FD8)
      {
        int v45 = *__error();
        int v46 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003D428((uint64_t)&v94, v46, v47, v48, v49, v50, v51, v52);
        }
        *__error() = v45;
      }

      sub_100021850("%s: failed to obtain lock (is another rsyncd running?)", v94);
    }

    else
    {
      if (dword_100058FD8)
      {
        int v62 = *__error();
        __int128 v63 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003D490((uint64_t)&v94, v63, v64, v65, v66, v67, v68, v69);
        }
        *__error() = v62;
      }

      sub_1000218D4("%s: acquiring lock", v38, v39, v40, v41, v42, v43, v44, (char)v94);
    }

    return 14LL;
  }

  pid_t v61 = getpid();
  fprintf(v36, "%d\n", v61);
  fflush(v36);
  *(void *)(v18 + 1136) = v94;
  *(void *)(v18 + 1144) = v36;
LABEL_28:
  if (!*v71)
  {
    if (sub_10001BE38(v100, "global", "address", v71) == -1)
    {
      if (*__error() == 2) {
        sub_10003D370();
      }
    }

    else if (!*(_BYTE *)*v71)
    {
      void *v71 = 0LL;
    }
  }

  if (sub_10001BE38(v100, "global", "motd file", &v94))
  {
    uint64_t v17 = "";
    v94 = "";
  }

  else
  {
    uint64_t v17 = v94;
  }

  if (!strdup(v17)) {
    sub_10003D398(0LL);
  }
  if (v14)
  {
    socklen_t v75 = 128;
    uint64_t v26 = getpeername(0, &v95, &v75);
    if ((_DWORD)v26 == -1) {
      sub_10003D3AC(v26);
    }
    return sub_10000ADFC((uint64_t)&v77, 0LL, &v95, v75);
  }

  else
  {
    sub_100021744(-1, "openrsync listening on port '%s'", v20, v21, v22, v23, v24, v25, *v72);
    uint64_t v27 = sub_10003317C(&v77, (uint64_t (*)(uint64_t *, uint64_t, sockaddr *, void))sub_10000ADFC);
    if (v102)
    {
      unlink(v101);
      fclose(v102);
    }
  }

  return v27;
}

void sub_10000ADAC(int a1)
{
  char v2 = &__stdoutp;
  if (a1) {
    char v2 = &__stderrp;
  }
  int v3 = *v2;
  int v4 = getprogname();
  fprintf( v3,  "usage: %s --daemon [-46hv] [--address=bindaddr] [--bwlimit=limit] [--no-detach]\n \t[--log-file=logfile] [--port=portnumber] [--sockopts=sockopts]\n",  v4);
  exit(a1);
}

uint64_t sub_10000ADFC(uint64_t a1, uint64_t a2, const sockaddr *a3, socklen_t a4)
{
  v136 = 0LL;
  unsigned int v134 = -1;
  int v135 = 0;
  uint64_t v4 = *(void *)(a1 + 200);
  *(void *)(v4 + 1152) = 0xFFFFFFFFLL;
  *(_DWORD *)(v4 + 1172) = a2;
  if (*(_DWORD *)(v4 + 1160) != -1) {
    sub_10003D5D0();
  }
  uint64_t v9 = *(char **)(v4 + 1112);
  *(void *)(v4 + 1memset(&v55[1], 0, 112) = 0LL;
  int v10 = *(FILE **)(v4 + 1144);
  if (v10) {
    fclose(v10);
  }
  sub_10001B1F8(*(void *)(v4 + 1128));
  *(void *)(v4 + 1128) = 0LL;
  sub_10003394C(a2, "SO_KEEPALIVE");
  sub_10003394C(a2, *(void *)(*(void *)a1 + 464LL));
  int sa_family = a3->sa_family;
  if (sa_family != 2 && sa_family != 30) {
    sub_10003D528();
  }
  uint64_t v12 = *(void *)(a1 + 200);
  *(void *)(v12 + 1088) = a3;
  if (sa_family == 2) {
    int v13 = &a3->sa_data[2];
  }
  else {
    int v13 = &a3->sa_data[6];
  }
  if (!inet_ntop(sa_family, v13, (char *)(v12 + 1041), 0x2Eu))
  {
    if (dword_100058FD8)
    {
      int v38 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D550();
      }
      *__error() = v38;
    }

    sub_1000218D4("inet_ntop", v14, v15, v16, v17, v18, v19, v20, v131);
    return 14LL;
  }

  *(_DWORD *)(a1 + 260) = 29;
  *(_DWORD *)(a1 + 16) = 29;
  sub_1000320D4((uint64_t)off_1000586D8);
  LOBYTE(v132) = 0;
  int v21 = fcntl(a2, 3);
  if (v21 == -1 || (LOBYTE(v132) = v21 | 4, fcntl(a2, 4) == -1))
  {
    sub_1000074E0(a1, "failed to set non-blocking", v22, v23, v24, v25, v26, v27, (char)v132);
    return 14LL;
  }

  uint64_t v28 = sub_10001B248(a1, *(const char **)(v4 + 1104), 1);
  *(void *)(v4 + 1128) = v28;
  if (!v28) {
    return 14LL;
  }
  socklen_t v133 = a4;
  uint64_t v29 = 0LL;
  *(_DWORD *)(a1 + 20) = -1;
  char v30 = 1;
  while (1)
  {
    size_t __linecapp = 1024LL;
    if (!sub_10001FAB0(a1, a2, (uint64_t)__str, (uint64_t *)&__linecapp) || !(__linecapp | v29))
    {
      sub_1000074E0( a1,  "protocol violation: expected version and module information",  v31,  v32,  v33,  v34,  v35,  v36,  (char)v132);
LABEL_40:
      uint64_t v41 = 0LL;
      goto LABEL_41;
    }

    if (__linecapp == 1024)
    {
      uint64_t v39 = "line buffer overrun";
LABEL_38:
      sub_1000074E0(a1, v39, v31, v32, v33, v34, v35, v36, (char)v132);
LABEL_39:
      *__error() = 22;
      goto LABEL_40;
    }

    if ((v30 & 1) == 0) {
      break;
    }
    if (*(void *)__str != 0x3A44434E59535240LL || __str[8] != 32)
    {
      sub_1000074E0( a1,  "protocol violation: expected version line, got '%s'",  v31,  v32,  v33,  v34,  v35,  v36,  (char)__str);
      goto LABEL_39;
    }

    if (sscanf(&__str[9], "%d.%d", &v138, &v137) != 2 && sscanf(&__str[9], "%d", &v138) != 1)
    {
      v132 = &__str[9];
      uint64_t v39 = "protocol violation: malformed version line, got '%s'";
      goto LABEL_38;
    }

    *(_DWORD *)(a1 + 20) = v138;
    snprintf(__str, 0x400uLL, "@RSYNCD: %d", *(_DWORD *)(a1 + 16));
    char v30 = 0;
    uint64_t v29 = 1LL;
  }

  if (__linecapp) {
    uint64_t v40 = __str;
  }
  else {
    uint64_t v40 = "#list";
  }
  uint64_t v41 = strdup(v40);
  if (!v41)
  {
    if (dword_100058FD8)
    {
      int v56 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CD2C();
      }
      *__error() = v56;
    }

    sub_1000218D4("strdup", v48, v49, v50, v51, v52, v53, v54, (char)v132);
    goto LABEL_40;
  }

  int v55 = *(_DWORD *)(a1 + 20);
  if (v55 <= 26)
  {
    sub_1000074E0( a1,  "could not negotiate a protocol; client requested %d (supported range: %d to %d)",
      v49,
      v50,
      v51,
      v52,
      v53,
      v54,
      v55);
    goto LABEL_41;
  }

  if (v55 < *(_DWORD *)(a1 + 16)) {
    *(_DWORD *)(a1 + 260) = v55;
  }
  if (*v9)
  {
    size_t __linecapp = 0LL;
    *(void *)__str = 0LL;
    uint64_t v57 = fopen(v9, "r");
    if (v57)
    {
      uint64_t v58 = v57;
      while (1)
      {
        ssize_t v59 = getline((char **)__str, &__linecapp, v58);
        if (v59 < 1) {
          break;
        }
        if (!sub_10001F6EC(a1, a2, *(char **)__str, v59))
        {
          fclose(v58);
          free(*(void **)__str);
          free(v9);
          goto LABEL_41;
        }
      }

      fclose(v58);
      free(*(void **)__str);
    }
  }

  free(v9);
  if (*v41 == 35)
  {
    if (strcmp(v41 + 1, "list"))
    {
      sub_1000074E0(a1, "%s is not a known command", v60, v61, v62, v63, v64, v65, (char)v41);
      goto LABEL_41;
    }

    if (!sub_10001BA8C( *(void **)(*(void *)(a1 + 200) + 1128LL),  (uint64_t (*)(void *, const char *, uint64_t))sub_10000C440,  a1)) {
      goto LABEL_41;
    }
    if (sub_10001F6F4(a1, a2, "@RSYNCD: EXIT"))
    {
      v118 = 0LL;
      LODWORD(v119) = 0;
      goto LABEL_116;
    }

    if (dword_100058FD8)
    {
      int v124 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D57C();
      }
      *__error() = v124;
    }

    v125 = "io_write_line";
LABEL_130:
    sub_1000218D4(v125, v111, v112, v113, v114, v115, v116, v117, (char)v132);
    goto LABEL_41;
  }

  if (!sub_10001BA44(*(uint64_t ***)(v4 + 1128), v41))
  {
    LOBYTE(v132) = (_BYTE)v41;
    v110 = "%s is not a valid module";
    goto LABEL_123;
  }

  if (!sub_100008868(a1, v41, a3, v133)
    || !sub_100007B64(a1, v41)
    || sub_100007FF0(a1, v41))
  {
    goto LABEL_41;
  }

  if (!sub_10000BB44(a1, v41, (uint64_t)&v134))
  {
    sub_1000074E0(a1, "%s: authentication failed", v72, v73, v74, v75, v76, v77, (char)v41);
    goto LABEL_41;
  }

  if (sub_10001BC1C(*(uint64_t **)(v4 + 1128), v41, "use chroot", (int *)&__linecapp))
  {
    if (dword_100058FD8)
    {
      int v84 = *__error();
      __int128 v85 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__str = 136315138;
        *(void *)&char __str[4] = v41;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s: 'use chroot' malformed", __str, 0xCu);
      }

      *__error() = v84;
    }

    sub_100021B34(0, "%s: 'use chroot' malformed", v78, v79, v80, v81, v82, v83, (char)v41);
  }

  else if ((_DWORD)__linecapp && !sub_10001BB1C(*(uint64_t **)(v4 + 1128), v41, "use chroot"))
  {
    LODWORD(__linecapp) = 2;
  }

  if (!sub_100007A30(a1, v41)
    || !sub_100009778(a1, v41)
    || !sub_10000829C(a1, v41))
  {
    goto LABEL_41;
  }

  if (sub_10001BB1C(*(uint64_t **)(v4 + 1128), v41, "dont compress"))
  {
    if (dword_100058FD8)
    {
      int v86 = *__error();
      __int128 v87 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__str = 136315138;
        *(void *)&char __str[4] = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_INFO,  "%s: 'dont compress' is present but not honored",  __str,  0xCu);
      }

      *__error() = v86;
    }

    sub_100021AB0("%s: 'dont compress' is present but not honored", v41);
  }

  chdir(*(const char **)(v4 + 1120));
  if ((_DWORD)__linecapp && chroot(".") == -1)
  {
    if (*__error() != 1 || (_DWORD)__linecapp == 1) {
      goto LABEL_41;
    }
    if (dword_100058FD8)
    {
      int v94 = *__error();
      sockaddr v95 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__str = 136315138;
        *(void *)&char __str[4] = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_INFO,  "%s: attempt to chroot failed, falling back to 'no' since it is not explicitly set",  __str,  0xCu);
      }

      *__error() = v94;
    }

    sub_100021B34( 0,  "%s: attempt to chroot failed, falling back to 'no' since it is not explicitly set",  v88,  v89,  v90,  v91,  v92,  v93,  (char)v41);
    LODWORD(__linecapp) = 0;
  }

  *(_BYTE *)(v4 + 1176) = 1;
  if (!sub_10001F6F4(a1, a2, "@RSYNCD: OK"))
  {
    if (dword_100058FD8)
    {
      int v126 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D57C();
      }
      *__error() = v126;
    }

    sub_100021980("io_write_line");
    goto LABEL_41;
  }

  if ((sub_10000BEEC(a1, v41, a2, &v135, &v136) & 0x80000000) != 0) {
    goto LABEL_41;
  }
  dword_100058FF0 = 0;
  if (sub_10001BDDC(*(uint64_t **)(v4 + 1128), v41, "timeout", &dword_100058FF0))
  {
    if (dword_100058FD8)
    {
      int v102 = *__error();
      int v103 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__str = 136315138;
        *(void *)&char __str[4] = v41;
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "%s: bad value for 'timeout'", __str, 0xCu);
      }

      *__error() = v102;
    }

    sub_100021B34(0, "%s: bad value for 'timeout'", v96, v97, v98, v99, v100, v101, (char)v41);
  }

  if (!sub_100009054(a1, v41)
    || (optreset = 1,
        optind = 1,
        int v104 = v135,
        v105 = (char *)v136,
        (uint64_t v106 = sub_100024E80(v135, v136, sub_10000C368, a1)) == 0))
  {
LABEL_41:
    free(v41);
    sub_10001B1F8(*(void *)(v4 + 1128));
    *(void *)(v4 + 1128) = 0LL;
    int v42 = *(_DWORD *)(v4 + 1160);
    if (v42 != -1)
    {
      close(v42);
      *(_DWORD *)(v4 + 1160) = -1;
    }

    close(*(_DWORD *)(v4 + 1152));
    free(*(void **)(v4 + 1096));
    uint64_t v43 = v135;
    uint64_t v44 = v136;
    if (v135 >= 1)
    {
      int v45 = (void **)v136;
      do
      {
        int v46 = *v45++;
        free(v46);
        --v43;
      }

      while (v43);
    }

    free(v44);
    return 14LL;
  }

  uint64_t v107 = v106;
  uint64_t v108 = v104 - (uint64_t)optind;
  int v135 = v108;
  v109 = (const char **)&v105[8 * optind];
  v136 = v109;
  if (strcmp(*v109, "."))
  {
    v110 = "protocol violation: expected hard stop before file list";
LABEL_123:
    sub_1000074E0(a1, v110, v66, v67, v68, v69, v70, v71, (char)v132);
    goto LABEL_41;
  }

  size_t v119 = v108 - 1;
  int v135 = v119;
  v118 = (char **)(v109 + 1);
  v136 = v118;
  uint32_t v127 = *(_DWORD *)(v107 + 20);
  if (!v127) {
    uint32_t v127 = arc4random();
  }
  *(_DWORD *)(a1 + 12) = v127;
  if (!sub_10001FFB4(a1, a2, v127))
  {
    if (dword_100058FD8)
    {
      int v129 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C7BC();
      }
      *__error() = v129;
    }

    v125 = "io_write_int";
    goto LABEL_130;
  }

  *(_DWORD *)(a1 + 144) = 1;
  if (!sub_100008EC0(a1, (_DWORD *)v107, v41, v134, v114, v115, v116, v117)) {
    goto LABEL_41;
  }
  if (*(void *)(v107 + 504)) {
    sub_100008DA4(v41, 1, (char **)(v107 + 504));
  }
  if (!sub_100007418(a1, v41, v107)
    || !sub_100007670(a1, v41, v107, __linecapp)
    || !sub_10000776C(a1, v41, v107)
    || !sub_100008950(a1, v41, __linecapp))
  {
    goto LABEL_41;
  }

  if ((*(_DWORD *)(v107 + 512) & 0x80000000) != 0) {
    *(_DWORD *)(v107 + 512) = 0;
  }
  *(void *)a1 = v107;
  sub_10003225C(off_1000586D8, a1);
  sub_100032094((uint64_t)off_1000586D8);
  if (**(_DWORD **)a1)
  {
    if (!sub_10002C7D4(a1, a2, a2, v119, (const char **)v118))
    {
      if (dword_100058FD8)
      {
        int v128 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003C944();
        }
        *__error() = v128;
      }

      v125 = "rsync_sender";
      goto LABEL_130;
    }
  }

  else if (!sub_100028E84(a1, (uint64_t)off_1000586D8, a2, a2, *v118))
  {
    if (dword_100058FD8)
    {
      int v130 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C8C4();
      }
      *__error() = v130;
    }

    v125 = "rsync_receiver";
    goto LABEL_130;
  }

LABEL_116:
  int v120 = *(_DWORD *)(v4 + 1160);
  if (v120 != -1)
  {
    close(v120);
    *(_DWORD *)(v4 + 1160) = -1;
  }

  close(*(_DWORD *)(v4 + 1152));
  free(*(void **)(v4 + 1096));
  if ((int)v119 >= 1)
  {
    uint64_t v121 = v119;
    v122 = (void **)v118;
    do
    {
      v123 = *v122++;
      free(v123);
      --v121;
    }

    while (v121);
  }

  free(v118);
  return 0LL;
}

uint64_t sub_10000BB44(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 200);
  if (!*__filename)
  {
LABEL_8:
    sub_1000074E0(a1, "%s: missing secrets file", v7, v8, v9, v10, v11, v12, (char)a2);
    return 0LL;
  }

  if (sub_10001BC1C(*(uint64_t **)(v6 + 1128), a2, "strict modes", &v74))
  {
    sub_1000074E0(a1, "%s: 'strict modes' invalid", v13, v14, v15, v16, v17, v18, (char)a2);
    return 0LL;
  }

  uint64_t v20 = fopen(__filename, "r");
  if (!v20)
  {
    sub_1000074E0(a1, "%s: could not open secrets file", v21, v22, v23, v24, v25, v26, (char)a2);
    return 0LL;
  }

  uint64_t v27 = v20;
  if (v74)
  {
    uint64_t v28 = __filename;
    int v29 = fileno(v20);
    if (!sub_1000275CC((uint64_t)v28, v29))
    {
      fclose(v27);
      sub_1000074E0(a1, "%s: bad permissions on secrets file", v45, v46, v47, v48, v49, v50, (char)a2);
      return 0LL;
    }
  }

  arc4random_buf(__buf, 0x80uLL);
  res_9_b64_ntop((const u_char *)__buf, 0x80uLL, (char *)v80, 0x44uLL);
  v77[0] = v80[0];
  v77[1] = v80[1];
  v77[2] = v80[2];
  v77[3] = v80[3];
  char v78 = 10;
  if (!sub_10001F6EC(a1, *(_DWORD *)(v6 + 1172), "@RSYNCD: AUTHREQD ", 0x12uLL))
  {
    fclose(v27);
    if (dword_100058FD8)
    {
      int v43 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D5F8();
      }
      *__error() = v43;
    }

    uint64_t v44 = "io_write_buf";
    goto LABEL_30;
  }

  if (!sub_10001F6EC(a1, *(_DWORD *)(v6 + 1172), (char *)v77, 0x41uLL))
  {
    fclose(v27);
    if (dword_100058FD8)
    {
      int v51 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D57C();
      }
      *__error() = v51;
    }

    uint64_t v44 = "io_write_line";
LABEL_30:
    sub_1000218D4(v44, v36, v37, v38, v39, v40, v41, v42, v73);
    return 0LL;
  }

  char v78 = 0;
  *(void *)&v80[0] = 2048LL;
  if (!sub_10001FAB0(a1, *(_DWORD *)(v6 + 1172), (uint64_t)__buf, (uint64_t *)v80))
  {
    fclose(v27);
    sub_1000074E0(a1, "%s: expected auth response", v52, v53, v54, v55, v56, v57, (char)a2);
    return 0LL;
  }

  if (*(void *)&v80[0] == 2048LL)
  {
    fclose(v27);
    sub_1000074E0(a1, "%s: line buffer overflow on auth", v30, v31, v32, v33, v34, v35, (char)a2);
    return 0LL;
  }

  uint64_t v58 = strchr(__buf, 32);
  if (!v58)
  {
    fclose(v27);
    sub_1000074E0(a1, "%s: malformed auth response", v67, v68, v69, v70, v71, v72, (char)a2);
    return 0LL;
  }

  char *v58 = 0;
  int v59 = sub_10000C678(a1, (char)a2, __s1, v27, __buf, (const char *)v77, v58 + 1, a3);
  fclose(v27);
  if (!v59) {
    return 0LL;
  }
  uint64_t v60 = strdup(__buf);
  *(void *)(v6 + 1096) = v60;
  if (!v60)
  {
    sub_1000074E0(a1, "%s: out of memory", v61, v62, v63, v64, v65, v66, (char)a2);
    return 0LL;
  }

  return 1LL;
}

uint64_t sub_10000BEEC(uint64_t a1, char *a2, int a3, _DWORD *a4, void *a5)
{
  uint64_t v10 = *(void *)(a1 + 200);
  if (*(_DWORD *)(v10 + 1152) == -1)
  {
    uint64_t v18 = 0LL;
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v11 = usbuf_new(0LL, 0LL, 0LL, 1LL);
    if (!v11 || (uint64_t v18 = v11, (v19 = usbuf_new(0LL, 0LL, 0LL, 1LL)) == 0))
    {
      sub_1000074E0(a1, "daemon out of memory", v12, v13, v14, v15, v16, v17, v56);
      return 0xFFFFFFFFLL;
    }

    uint64_t v20 = v19;
  }

  uint64_t v58 = 5LL;
  uint64_t v21 = sub_100007014(0LL, 0LL, 5uLL, 8uLL);
  uint64_t v60 = v21;
  if (!v21)
  {
    sub_1000074E0(a1, "daemon out of memory", v22, v23, v24, v25, v26, v27, v56);
    usbuf_delete(v18);
    usbuf_delete(v20);
    if (!v18) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }

  unint64_t v59 = 1LL;
  *(void *)uint64_t v21 = 0LL;
  uint64_t v57 = 1024LL;
  if (!sub_10001FAB0(a1, a3, (uint64_t)__s1, &v57))
  {
LABEL_34:
    uint64_t v41 = "protocol violation: expected option line";
LABEL_35:
    sub_1000074E0(a1, v41, v28, v29, v30, v31, v32, v33, v56);
    *__error() = 22;
    if (!v18) {
      goto LABEL_39;
    }
LABEL_38:
    usbuf_delete(v18);
LABEL_39:
    if (v20) {
      usbuf_delete(v20);
    }
    return 0xFFFFFFFFLL;
  }

  char v34 = 0;
  while (v57)
  {
    if (v57 == 1024)
    {
      uint64_t v41 = "line buffer overrun";
      goto LABEL_35;
    }

    if ((v34 & 1) != 0)
    {
      if (v20)
      {
        if (usbuf_len(v20)) {
          usbuf_putc(v20, 32LL);
        }
        usbuf_cat(v20, __s1);
      }

      memset(&v61, 0, sizeof(v61));
      sub_100008D10(a2, 0LL, __s1);
      int v35 = glob(__s1, 0, 0LL, &v61);
      if (v35 != -3 && v35)
      {
        fprintf(__stderrp, "returned %d\n", v35);
        sub_1000074E0(a1, "glob '%s' failed", v49, v50, v51, v52, v53, v54, (char)__s1);
        if (!v18) {
          goto LABEL_44;
        }
LABEL_43:
        usbuf_delete(v18);
LABEL_44:
        if (v20) {
          usbuf_delete(v20);
        }
        if (*(_DWORD *)(v10 + 1152) != -1) {
          sub_100008618(a1, 0LL, 0LL, 0LL);
        }
        unint64_t v43 = v59;
        uint64_t v42 = v60;
        if (v59)
        {
          uint64_t v44 = (void **)v60;
          do
          {
            uint64_t v45 = *v44++;
            free(v45);
            --v43;
          }

          while (v43);
        }

        free(v42);
        return 0xFFFFFFFFLL;
      }

      if (v61.gl_pathc)
      {
        uint64_t v39 = 0LL;
        while (1)
        {
          if (v18)
          {
            usbuf_cat(v18, v61.gl_pathv[v39]);
            usbuf_putc(v18, 0LL);
          }

          if ((sub_10000CA9C(a1, &v59, &v60, &v58, v61.gl_pathv[v39], v36, v37, v38) & 1) == 0) {
            break;
          }
          if (++v39 >= v61.gl_pathc)
          {
            globfree(&v61);
            goto LABEL_33;
          }
        }

        globfree(&v61);
LABEL_42:
        if (v18) {
          goto LABEL_43;
        }
        goto LABEL_44;
      }

      if (v18)
      {
        usbuf_cat(v18, __s1);
        usbuf_putc(v18, 0LL);
      }

      char v40 = sub_10000CA9C(a1, &v59, &v60, &v58, __s1, v36, v37, v38);
      globfree(&v61);
      if ((v40 & 1) == 0) {
        goto LABEL_42;
      }
    }

    else
    {
      if (v18)
      {
        usbuf_cat(v18, __s1);
        usbuf_putc(v18, 0LL);
      }
    }

LABEL_33:
    v34 |= *(unsigned __int16 *)__s1 == 46;
    uint64_t v57 = 1024LL;
  }

  if (*(_DWORD *)(v10 + 1152) != -1)
  {
    if (usbuf_finish(v18))
    {
      uint64_t v47 = 0LL;
      size_t v48 = 0LL;
    }

    else
    {
      uint64_t v47 = (char *)usbuf_data(v18);
      size_t v48 = usbuf_len(v18);
    }

    else {
      uint64_t v55 = (char *)usbuf_data(v20);
    }
    sub_100008618(a1, v55, v47, v48);
    usbuf_delete(v18);
    usbuf_delete(v20);
  }

  uint64_t result = 0LL;
  *a4 = v59;
  *a5 = v60;
  return result;
}

    uint64_t v22 = openat(v10, v11, 0x100000);
    if (v22 != -1)
    {
      uint64_t v19 = v22;
      uint64_t v23 = *v6;
      uint64_t v24 = strrchr(*v6, 47);
      if (v24) {
        uint64_t v18 = v24 + 1;
      }
      else {
        uint64_t v18 = (char *)v23;
      }
      uint64_t v10 = *(_DWORD *)(a2 + 216);
      uint64_t v8 = *(const char **)(a2 + 80);
      goto LABEL_38;
    }

    return 0LL;
  }

  uint64_t v18 = (char *)*v6;
  uint64_t v19 = *(_DWORD *)(a2 + 216);
LABEL_38:
  uint64_t v25 = sub_100004BF4(a1, (uint64_t)v6, v10, v8, v19, v18, 0);
  uint64_t v26 = *(_DWORD *)(a2 + 216);
  if (v25 == -1)
  {
    if (v19 != v26)
    {
      unlinkat(v26, *(const char **)(a2 + 80), 0);
      close(v19);
    }

    return 0LL;
  }

  if (v19 != v26) {
    close(v19);
  }
  return 1LL;
}

uint64_t sub_10000C368( uint64_t a1, int __c, const char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void **)(a1 + 200);
  if (a3 && !strcmp(*a3, "daemon"))
  {
    sub_1000074E0(a1, "protection error: --daemon sent as client option", (uint64_t)a3, a4, a5, a6, a7, a8, v22);
    return 0LL;
  }

  if (__c)
  {
    uint64_t v12 = (const char *)v11[149];
    if (v12)
    {
      if (!strchr(v12, __c)) {
        return 1LL;
      }
      sub_1000074E0(a1, "option refused: -%c", v13, v14, v15, v16, v17, v18, __c);
      return 0LL;
    }
  }

  uint64_t result = 1LL;
  if (a3)
  {
    uint64_t v20 = (const char ***)v11[148];
    if (v20)
    {
      uint64_t v21 = v11[150];
      if (v21)
      {
        while (*v20 != a3)
        {
          ++v20;
          if (!--v21) {
            return 1LL;
          }
        }

        sub_1000074E0(a1, "option refused: --%s", (uint64_t)a3, a4, a5, a6, a7, a8, (char)*a3);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_10000C440(uint64_t *a1, char *a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(*(void *)(a3 + 200) + 1172LL);
  if (sub_10001BC1C(a1, a2, "list", &v28))
  {
    if (dword_100058FD8)
    {
      int v7 = *__error();
      uint64_t v8 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D69C((uint64_t)a2, v8, v9, v10, v11, v12, v13, v14);
      }
      *__error() = v7;
    }

    sub_100021850("%s: 'list' is not valid", a2);
    return 0LL;
  }

  if (v28)
  {
    if (sub_10001BB1C(a1, a2, "comment"))
    {
      if (asprintf(&__s, "%-15s%s", a2, v29) == -1)
      {
        if (dword_100058FD8)
        {
          int v25 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003C0F8();
          }
          *__error() = v25;
        }

        uint64_t v26 = "asprintf";
        goto LABEL_28;
      }

      int v23 = sub_10001F6F4(a3, v6, __s);
      free(__s);
      if (!v23)
      {
        if (dword_100058FD8)
        {
          int v24 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
          goto LABEL_26;
        }

        goto LABEL_27;
      }
    }

    else if (!sub_10001F6F4(a3, v6, a2))
    {
      if (dword_100058FD8)
      {
        int v24 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_25:
        }
          sub_10003D57C();
LABEL_26:
        *__error() = v24;
      }

LABEL_27:
      uint64_t v26 = "io_write_line";
LABEL_28:
      sub_1000218D4(v26, v16, v17, v18, v19, v20, v21, v22, v27);
      return 0LL;
    }
  }

  return 1LL;
}

  sub_100021744(3, "%s: updated permissions", v31, v32, v33, v34, v35, v36, *a4);
  return 1LL;
}

uint64_t sub_10000C678( uint64_t a1, char a2, char *__s1, FILE *a4, const char *a5, const char *a6, const char *a7, uint64_t a8)
{
  if (*a5 == 35)
  {
    sub_1000074E0(a1, "%s: bad username", (uint64_t)__s1, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, a2);
    return 0LL;
  }

  uint64_t v10 = (_DWORD *)a8;
  uint64_t v15 = strdup(__s1);
  __stringp = v15;
  if (!v15)
  {
    sub_1000074E0(a1, "%s: out of memory", v16, v17, v18, v19, v20, v21, a2);
    return 0LL;
  }

  if (*v15 == 44) {
    uint64_t v22 = ",";
  }
  else {
    uint64_t v22 = ", \t";
  }
  int v23 = strsep(&__stringp, v22);
  if (!v23) {
    goto LABEL_65;
  }
  int v24 = v23;
  while (1)
  {
    do
    {
      int v25 = v24;
      int v26 = *v24;
      if (v26 < 0) {
        __uint32_t v27 = __maskrune(*v24, 0x4000uLL);
      }
      else {
        __uint32_t v27 = _DefaultRuneLocale.__runetype[v26] & 0x4000;
      }
      ++v24;
    }

    while (v27);
    if (v26)
    {
      int v28 = &v25[strlen(v25) - 1];
      while (1)
      {
        __darwin_ct_rune_t v29 = *v28;
        if (v29 < 0) {
          break;
        }
        if ((_DefaultRuneLocale.__runetype[v29] & 0x4000) == 0) {
          goto LABEL_21;
        }
LABEL_19:
        *v28-- = 0;
        if (v28 <= v25) {
          sub_10003D73C();
        }
      }

      if (__maskrune(v29, 0x4000uLL)) {
        goto LABEL_19;
      }
LABEL_21:
      uint64_t v30 = strchr(v25, 58);
      uint64_t v31 = v30;
      if (v30)
      {
        *uint64_t v30 = 0;
        uint64_t v31 = v30 + 1;
      }

      if (*v25 != 64)
      {
        if (!strcmp(v25, a5)) {
          goto LABEL_35;
        }
        goto LABEL_31;
      }

      uint64_t v32 = getgrnam(v25 + 1);
      if (v32)
      {
        gr_mem = (const char **)v32->gr_mem;
        char v34 = *gr_mem;
        if (*gr_mem) {
          break;
        }
      }
    }

LABEL_31:
    int v24 = strsep(&__stringp, v22);
    if (!v24) {
      goto LABEL_65;
    }
  }

  int v35 = gr_mem + 1;
  while (strcmp(v34, a5))
  {
    uint64_t v36 = *v35++;
    char v34 = v36;
    if (!v36) {
      goto LABEL_31;
    }
  }

    sub_10003E9CC();
    goto LABEL_32;
  }

LABEL_35:
  int v38 = *(unsigned __int8 *)v25;
  if (v38 == 64) {
    uint64_t v39 = (char *)v25;
  }
  else {
    uint64_t v39 = 0LL;
  }
  __s2 = v39;
  size_t __linecapp = 0LL;
  __linep = 0LL;
  ssize_t v40 = getline(&__linep, &__linecapp, a4);
  if (v40 < 1)
  {
    char v52 = 1;
    goto LABEL_62;
  }

  ssize_t v41 = v40;
  uint64_t v53 = v10;
  do
  {
    while (2)
    {
      uint64_t v42 = __linep;
      __darwin_ct_rune_t v43 = __linep[v41 - 1];
      if (v43 < 0)
      {
        if (__maskrune(v43, 0x4000uLL))
        {
LABEL_42:
          v42[--v41] = 0;
          continue;
        }
      }

      else if ((_DefaultRuneLocale.__runetype[v43] & 0x4000) != 0)
      {
        goto LABEL_42;
      }

      break;
    }

    if (v41)
    {
      if (*v42 != 35)
      {
        uint64_t v44 = strchr(v42, 58);
        if (v44)
        {
          *uint64_t v44 = 0;
          uint64_t v45 = v44 + 1;
          uint64_t v46 = __linep;
          if (!strcmp(__linep, a5) || v38 == 64 && !strcmp(v46, __s2))
          {
            if (sub_10003230C(v45, a6, __s1a, 0x100uLL))
            {
              if (!strcmp(__s1a, a7))
              {
                char v52 = 0;
                goto LABEL_60;
              }
            }

            else
            {
              if (dword_100058FD8)
              {
                int v47 = *__error();
                size_t v48 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                  sub_10003D700(&buf, v57, v48);
                }
                *__error() = v47;
              }

              sub_100021980("rsync_password_hash");
            }
          }
        }
      }
    }

    ssize_t v41 = getline(&__linep, &__linecapp, a4);
  }

  while (v41 > 0);
  char v52 = 1;
LABEL_60:
  uint64_t v10 = v53;
LABEL_62:
  uint64_t v49 = __linep;
  if (__linep)
  {
    sub_100006FC0(__linep, __linecapp);
    uint64_t v49 = __linep;
  }

  free(v49);
  if ((v52 & 1) != 0)
  {
LABEL_65:
    uint64_t v37 = 0LL;
    goto LABEL_66;
  }

  if (!v31)
  {
    int v51 = -1;
LABEL_75:
    *uint64_t v10 = v51;
    goto LABEL_76;
  }

  if (!strcmp(v31, "deny")) {
    goto LABEL_65;
  }
  *uint64_t v10 = -1;
  if (!strcmp(v31, "ro"))
  {
    int v51 = 1;
    goto LABEL_75;
  }

  if (!strcmp(v31, "rw"))
  {
    int v51 = 0;
    goto LABEL_75;
  }

LABEL_76:
  uint64_t v37 = 1LL;
LABEL_66:
  free(__stringp);
  return v37;
}

uint64_t sub_10000CA9C( uint64_t a1, unint64_t *a2, char **a3, void *a4, char *__s1, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = *a2;
  if (*a2 != 0x7FFFFFFF)
  {
    uint64_t v15 = *a3;
    if (v9 == *a4)
    {
      uint64_t v16 = sub_100007014(*a3, *a2, v9 + 5, 8uLL);
      if (!v16)
      {
LABEL_8:
        uint64_t v10 = "daemon out of memory";
        goto LABEL_9;
      }

      uint64_t v15 = v16;
      *a4 = v9 + 5;
      *a3 = v16;
    }

    uint64_t v17 = strdup(__s1);
    *(void *)&v15[8 * v9] = v17;
    if (v17)
    {
      ++*a2;
      return 1LL;
    }

    goto LABEL_8;
  }

  uint64_t v10 = "protection error: too many arguments sent";
LABEL_9:
  sub_1000074E0(a1, v10, (uint64_t)a3, (uint64_t)a4, (uint64_t)__s1, a6, a7, a8, v19);
  return 0LL;
}

void sub_10000CB6C(uint64_t a1, const char *a2)
{
}

uint64_t sub_10000CB74(_BYTE *a1, uint64_t a2)
{
  if (!a2) {
    return 1LL;
  }
  while (!*a1)
  {
    ++a1;
    if (!--a2) {
      return 1LL;
    }
  }

  return 0LL;
}

char *sub_10000CB9C(const char *a1)
{
  size_t v2 = strlen(a1);
  size_t v3 = v2;
  uint64_t v4 = 2LL;
  if (v2 > 2) {
    uint64_t v4 = v2;
  }
  size_t v5 = v4 + 1;
  int v6 = (char *)malloc(v4 + 1);
  uint64_t v14 = v6;
  if (!v6)
  {
    if (dword_100058FD8)
    {
      int v25 = *__error();
      int v26 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D764(v26);
      }
      *__error() = v25;
    }

    sub_1000218D4("malloc", v7, v8, v9, v10, v11, v12, v13, v29);
    return v14;
  }

  if (!v3)
  {
    int v16 = 0;
LABEL_37:
    *uint64_t v14 = 0;
    goto LABEL_38;
  }

  strlcpy(v6, a1, v5);
  uint64_t v15 = 0LL;
  int v16 = a1[v3 - 1];
  uint64_t v17 = &v14[v3 + 1];
  while (v14[v15] == 47)
    ++v15;
  if (!v14[v15]) {
    goto LABEL_37;
  }
  memmove(v14, &v14[v15], v3 + 1 - v15);
  __stringp = v14;
  uint64_t v18 = strsep(&__stringp, "/");
  if (!v18) {
    goto LABEL_29;
  }
  char v19 = v18;
  unint64_t v20 = 0LL;
  while (1)
  {
    if (v19 > v14) {
      *(v19 - 1) = 47;
    }
    if (!*v19)
    {
      if (!__stringp) {
        goto LABEL_29;
      }
      memmove(v19, v19 + 1, v17 - (v19 + 1));
      --__stringp;
      --v17;
      goto LABEL_28;
    }

    uint64_t v21 = __stringp ? __stringp : v17 - 1;
    int64_t v22 = v21 - v19;
    if (!strncmp(v19, ".", v21 - v19)) {
      break;
    }
    if (!strncmp(v19, "..", v21 - v19))
    {
      if (v20-- <= 1)
      {
        if (!*v21) {
          goto LABEL_37;
        }
        memmove(v14, v21, v17 - v21);
        unint64_t v20 = 0LL;
        v17 += v14 - v21;
        int v23 = &__stringp[v14 - v21];
        goto LABEL_27;
      }
    }

    else
    {
      ++v20;
    }

LABEL_28:
    char v19 = strsep(&__stringp, "/");
    if (!v19) {
      goto LABEL_29;
    }
  }

  if (*v21)
  {
    memmove(v19, v21, v17 - v21);
    v17 -= v22;
    int v23 = &__stringp[-v22];
LABEL_27:
    __stringp = v23;
    goto LABEL_28;
  }

  *char v19 = v19[1];
LABEL_29:
  if (!*v14)
  {
LABEL_38:
    __uint32_t v27 = "/";
    if (v16 != 47) {
      __uint32_t v27 = "";
    }
    snprintf(v14, v5, ".%s", v27);
  }

  return v14;
}

  *__error() = v12;
  sub_100021980(v13);
  return 0LL;
}

    errx(1, "different remote host: %s", __s);
  }

  uint64_t v7 = __s + 1;
  uint64_t v9 = __s;
  uint64_t v8 = v6;
  return memmove(v9, v7, v8);
}

uint64_t sub_10000CE30(_BYTE *a1, const char *a2, char *__s)
{
  if (!a1) {
    return 1LL;
  }
  int v4 = *a1;
  uint64_t result = 1LL;
  if (v4 && v4 != 47)
  {
    size_t v8 = strlen(__s);
    if (!strncmp(a2, __s, v8))
    {
      if (a2[v8] == 47) {
        uint64_t v11 = (char *)&a2[v8 + 1];
      }
      else {
        uint64_t v11 = (char *)&a2[v8];
      }
      uint64_t v12 = sub_10000D024(v11, 0LL, 0);
      if ((v12 & 0x80000000) == 0) {
        return sub_10000D024(a1, v12, 1) >> 31;
      }
      if (dword_100058FD8)
      {
        int v13 = *__error();
        uint64_t v14 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint8_t buf = 136315394;
          int v16 = v11;
          __int16 v17 = 2080;
          uint64_t v18 = __s;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s: is_unsafe_link: src escaped the root: %s\n",  buf,  0x16u);
        }

        *__error() = v13;
      }

      sub_100021AB0("%s: is_unsafe_link: src escaped the root: %s\n");
    }

    else
    {
      if (dword_100058FD8)
      {
        int v9 = *__error();
        uint64_t v10 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint8_t buf = 136315394;
          int v16 = a2;
          __int16 v17 = 2080;
          uint64_t v18 = __s;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s: is_unsafe_link: src file is outside of the root: %s\n",  buf,  0x16u);
        }

        *__error() = v9;
      }

      sub_100021AB0("%s: is_unsafe_link: src file is outside of the root: %s\n");
    }

    return 1LL;
  }

  return result;
}

uint64_t sub_10000D024(_BYTE *a1, uint64_t a2, int a3)
{
  if (a1 && *a1)
  {
    while (1)
    {
      size_t v5 = a1 - 1;
      do
        int v6 = *(unsigned __int8 *)++v5;
      while (v6 == 47);
      if (!strncmp(v5, "../", 3uLL))
      {
        a2 = (a2 - 1);
        if (!a3) {
          goto LABEL_14;
        }
      }

      else
      {
        if (strncmp(v5, "./", 2uLL))
        {
          if (strchr(v5, 47)) {
            a2 = (a2 + 1);
          }
          else {
            a2 = a2;
          }
        }

        if (!a3) {
          goto LABEL_14;
        }
      }

      if ((a2 & 0x80000000) != 0) {
        return 0xFFFFFFFFLL;
      }
LABEL_14:
      uint64_t v7 = strchr(v5, 47);
      a1 = v7 + 1;
      if (!v7) {
        return a2;
      }
    }
  }

  return 0LL;
}

uint64_t sub_10000D0FC(uint64_t a1, int a2, const char **a3, const char *a4, mode_t a5)
{
  uint64_t v7 = a3;
  if (fstatat(a2, *a3, &v88, 32) < 0) {
    return 0LL;
  }
  uint64_t v10 = strdup(a4);
  if (!v10)
  {
    uint64_t v29 = 12LL;
LABEL_48:
    if (dword_100058FD8)
    {
      int v58 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D7A4();
      }
      *__error() = v58;
    }

    sub_1000218D4("%s: mk_backup_dir: %s", v11, v12, v13, v14, v15, v16, v17, (char)*v7);
    return v29;
  }

  uint64_t v18 = v10;
  size_t v19 = strlen(v10);
  uint64_t v20 = 0LL;
  do
  {
    int v21 = strncmp(&v18[v20], "./", 2uLL);
    v20 += 2LL;
  }

  while (!v21);
  size_t v86 = v19;
  size_t v22 = strlen(*(const char **)(*(void *)a1 + 160LL));
  int v23 = &v18[v20];
  int v24 = &v18[v20 + v22];
  __int128 v87 = &v18[v19];
  if (v24 - 2 >= &v18[v19]) {
    sub_10003DA3C();
  }
  size_t v25 = v22;
  uint64_t v82 = a1;
  mode_t v83 = a5;
  int v26 = v23 - 2;
  BOOL v85 = *(v24 - 2) == 47;
  if (*(v24 - 2) == 47) {
    size_t v27 = v22 + 1;
  }
  else {
    size_t v27 = v22;
  }
  int v28 = strrchr(v23 - 2, 47);
  if (v28)
  {
    while (1)
    {
      *int v28 = 0;
      uint64_t v29 = mkdirat(a2, v23 - 2, 0x1EDu);
      if (!(_DWORD)v29) {
        goto LABEL_17;
      }
      if (*__error() == 17) {
        goto LABEL_16;
      }
      if (*__error() != 2) {
        break;
      }
      int v28 = strrchr(v23 - 2, 47);
      if (!v28) {
        goto LABEL_17;
      }
    }

    if (dword_100058FD8)
    {
      int v47 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      goto LABEL_40;
    }

LABEL_41:
    sub_1000218D4("%s: mkdir", v30, v31, v32, v33, v34, v35, v36, (char)v26);
    goto LABEL_47;
  }

        if (v18 > v14) {
          continue;
        }
        size_t v19 = v16 == 0;
        int v26 = v17 == 0;
        uint64_t v20 = v17 != 0;
        int v21 = v26 || v19;
        size_t v22 = v7;
        if (v19 && v20) {
          uint64_t v7 = v14;
        }
        else {
          uint64_t v7 = v18;
        }
        while (1)
        {
          for (i = v8; ; i = v29)
          {
            int v24 = *i;
            if (v24 == 92)
            {
              size_t v25 = *++i;
              if (v25 != 47) {
                goto LABEL_56;
              }
              uint64_t v29 = i;
              int v24 = *i;
            }

            else if (!*i || v24 == 42)
            {
              goto LABEL_63;
            }

            if (v24 == 47)
            {
              if (v7 < v10) {
                goto LABEL_73;
              }
LABEL_63:
              size_t v8 = i;
              goto LABEL_64;
            }

LABEL_16:
  uint64_t v29 = 0LL;
LABEL_17:
  int v84 = v7;
  uint64_t v37 = &v18[strlen(v23 - 2) - 2 + v20];
  if (v37 >= v87) {
    sub_10003DA14();
  }
  int v38 = &v23[v27];
  uint64_t v39 = -(uint64_t)(v25 + v85);
  while (1)
  {
    if (v86 + 2 + v39 - strlen(v38 - 2) != v20 && *(v38 - 2))
    {
      uint64_t v29 = fstatat(a2, v38 - 2, &v89, 0);
      if ((v29 & 0x80000000) != 0)
      {
        uint64_t v7 = v84;
        if (dword_100058FD8)
        {
          int v57 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003D9B4();
          }
          *__error() = v57;
        }

        sub_1000218D4("%s: stat", v40, v41, v42, v43, v44, v45, v46, (_BYTE)v38 - 2);
LABEL_47:
        free(v18);
        goto LABEL_48;
      }

      fchownat(a2, v26, v89.st_uid, v89.st_gid, 32);
      fchmodat(a2, v26, v89.st_mode, 32);
    }

    *uint64_t v37 = 47;
    v37 += strlen(v37);
    if (v37 == v87) {
      break;
    }
    if (v37 >= v87) {
      sub_10003D98C();
    }
    uint64_t v29 = mkdirat(a2, v26, 0x1EDu);
    if ((v29 & 0x80000000) != 0)
    {
      uint64_t v7 = v84;
      if (!dword_100058FD8) {
        goto LABEL_41;
      }
      int v47 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_39:
      }
        sub_10003D92C();
LABEL_40:
      *__error() = v47;
      goto LABEL_41;
    }
  }

  free(v18);
  uint64_t v7 = v84;
  if ((_DWORD)v29) {
    goto LABEL_48;
  }
  int v48 = v83 & 0xF000;
  if (v48 == 0x4000)
  {
    uint64_t v29 = mkdirat(a2, a4, v83);
    if ((int)v29 >= 1)
    {
      if (dword_100058FD8)
      {
        int v56 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003D808();
        }
        *__error() = v56;
      }

      sub_1000218D4("%s: mkdirat", v49, v50, v51, v52, v53, v54, v55, (char)a4);
      return v29;
    }

    uint64_t v66 = *v84;
    int v67 = a2;
    int v68 = 128;
LABEL_65:
    unlinkat(v67, v66, v68);
    return v29;
  }

  if (v48 != 40960 || !*(_DWORD *)(*(void *)v82 + 84LL))
  {
    if (v48 == 0x8000)
    {
      if ((sub_10000D754(a2, *v84, a2, a4, 1) & 0x80000000) == 0) {
        return 0LL;
      }
      if (dword_100058FD8)
      {
        int v76 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003D8C8();
        }
        *__error() = v76;
      }

      sub_1000218D4("%s: move_file: %s", v69, v70, v71, v72, v73, v74, v75, (char)*v84);
      return 0xFFFFFFFFLL;
    }

    if (dword_100058FD8)
    {
      int v77 = *__error();
      char v78 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        uint64_t v79 = *v84;
        v89.st_dev = 136315138;
        *(void *)&v89.st_mode = v79;
        _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_INFO,  "backup_to_dir: skipping non-regular file %s\n",  (uint8_t *)&v89,  0xCu);
      }

      *__error() = v77;
    }

    sub_100021AB0("backup_to_dir: skipping non-regular file %s\n", *v84);
    return 0LL;
  }

  unlinkat(a2, a4, 0);
  uint64_t v29 = symlinkat(v84[11], a2, a4);
  if ((v29 & 0x80000000) == 0)
  {
    uint64_t v66 = *v84;
    int v67 = a2;
    int v68 = 0;
    goto LABEL_65;
  }

  if (dword_100058FD8)
  {
    int v81 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003D868();
    }
    *__error() = v81;
  }

  sub_1000218D4("%s: symlinkat", v59, v60, v61, v62, v63, v64, v65, (char)a4);
  return v29;
}

uint64_t sub_10000D754(int a1, const char *a2, int a3, const char *a4, int a5)
{
  if (a5) {
    int v9 = 1793;
  }
  else {
    int v9 = 3841;
  }
  uint64_t result = renameat(a1, a2, a3, a4);
  if ((_DWORD)result)
  {
    if ((_DWORD)result != -1 || *__error() == 18)
    {
      uint64_t result = openat(a1, a2, 256);
      if ((_DWORD)result == -1) {
        return result;
      }
      int v11 = result;
      int v12 = openat(a3, a4, v9, 384LL);
      if (v12 == -1)
      {
        int v16 = *__error();
        close(v11);
        *__error() = v16;
      }

      else
      {
        int v13 = v12;
        int v14 = sub_10000D86C();
        int v15 = *__error();
        close(v11);
        close(v13);
        *__error() = v15;
        if (!v14)
        {
          unlinkat(a1, a2, 0);
          return 0LL;
        }
      }
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_10000D86C()
{
  int v0 = __chkstk_darwin();
  int v2 = v1;
  int v3 = v0;
  ssize_t v4 = read(v0, __buf, 0x10000uLL);
  if (v4 >= 1)
  {
    while (2)
    {
      uint64_t v5 = 0LL;
      while (!__buf[v5])
      {
        if (++v5 == 0x10000)
        {
          if (lseek(v2, v4, 1) == -1) {
            return 0xFFFFFFFFLL;
          }
          goto LABEL_9;
        }
      }

      ssize_t v6 = write(v2, __buf, v4);
      uint64_t result = 0xFFFFFFFFLL;
      if (v4 != v6 || v6 == -1) {
        return result;
      }
LABEL_9:
      ssize_t v4 = read(v3, __buf, 0x10000uLL);
      if (v4 > 0) {
        continue;
      }
      break;
    }
  }

  if (v4 == -1) {
    return 0xFFFFFFFFLL;
  }
  off_t v8 = lseek(v2, 0LL, 1);
  if (ftruncate(v2, v8) == -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000D9B4(int a1, const char *a2, const char **a3)
{
  int v5 = openat(a1, a2, 0x100000);
  if (v5 == -1) {
    err(11, "%s: copy_file dfd: openat");
  }
  int v6 = v5;
  int v7 = openat(v5, *a3, 256);
  if (v7 == -1) {
    err(11, "%s/%s: copy_file fromfd: openat");
  }
  int v8 = v7;
  close(v6);
  int v9 = openat(a1, *a3, 3841, 384LL);
  if (v9 == -1) {
    sub_10003DA64(a3);
  }
  int v10 = v9;
  close(v8);
  return close(v10);
}

void sub_10000DAA0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

char *sub_10000DACC(uint64_t a1, const char **a2, char *a3, size_t a4)
{
  ssize_t v4 = *(const char **)(*(void *)a1 + 48LL);
  if (!v4) {
    sub_10003DAAC();
  }
  if (!a2) {
    sub_10003DAD4();
  }
  if (*v4 == 47) {
    return *(char **)(*(void *)a1 + 48LL);
  }
  int v5 = a3;
  int v8 = *a2;
  int v9 = strrchr(*a2, 47);
  if (v9)
  {
    int v10 = (_DWORD)v9 - (_DWORD)v8;
    do
    {
      int v11 = v9;
      int v12 = v10;
      if (v9 <= v8) {
        break;
      }
      --v9;
      --v10;
    }

    while (*(v11 - 1) == 47);
    if (v11 == v8) {
      sub_10003DAFC();
    }
    if (v12 <= 0) {
      sub_10003DB24();
    }
  }

  else
  {
    int v12 = 1;
    int v8 = ".";
  }

  if (snprintf(v5, a4, "%.*s/%s", v12, v8, v4) > a4)
  {
    if (dword_100058FD8)
    {
      int v20 = *__error();
      int v21 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(*(void *)a1 + 48LL);
        *(_DWORD *)uint8_t buf = 136316162;
        size_t v25 = v8;
        __int16 v26 = 1040;
        int v27 = v12;
        __int16 v28 = 2080;
        uint64_t v29 = v8;
        __int16 v30 = 2080;
        uint64_t v31 = v23;
        __int16 v32 = 2048;
        size_t v33 = a4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s: partial-dir: path too long: %.*s/%s > %lu",  buf,  0x30u);
      }

      *__error() = v20;
    }

    sub_1000218D4("%s: partial-dir: path too long: %.*s/%s > %lu", v13, v14, v15, v16, v17, v18, v19, (char)v8);
  }

  return v5;
}

const char *sub_10000DCBC(const char **a1)
{
  int v1 = *a1;
  int v2 = strrchr(*a1, 47);
  if (v2) {
    return v2 + 1;
  }
  else {
    return v1;
  }
}

_OWORD *sub_10000DCEC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v12 = malloc(0x110uLL);
  if (!v12)
  {
    if (dword_100058FD8)
    {
      int v30 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003DB4C();
      }
      *__error() = v30;
    }

    sub_1000218D4("malloc", v13, v14, v15, v16, v17, v18, v19, v32);
    return 0LL;
  }

  int v20 = v12;
  *(_DWORD *)int v12 = 0;
  v12[25] = a3;
  v12[26] = a4;
  *((_DWORD *)v12 + 54) = a5;
  *((_DWORD *)v12 + 55) = a6;
  *((_DWORD *)v12 + 56) = a2;
  v12[32] = 0LL;
  sub_10000DE40(a1, (uint64_t)v12, 0LL);
  v20[15] = xmmword_100045020;
  int v21 = malloc(0x100000uLL);
  *((void *)v20 + 29) = v21;
  if (!v21)
  {
    if (dword_100058FD8)
    {
      int v29 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003DB4C();
      }
      *__error() = v29;
    }

    sub_1000218D4("malloc", v22, v23, v24, v25, v26, v27, v28, v32);
    free(v20);
    return 0LL;
  }

  return v20;
}

uint64_t sub_10000DE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int data = *(_DWORD *)(a1 + 12);
  if (*(_DWORD *)a2) {
    sub_10003DB7C();
  }
  *(void *)(a2 + 8) = a3;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = -1LL;
  ssize_t v4 = (CC_MD4_CTX *)(a2 + 88);
  *(void *)(a2 + 80) = 0LL;
  CC_MD4_Init((CC_MD4_CTX *)(a2 + 88));
  *(void *)(a2 + 264) = 0LL;
  *(void *)(a2 + 184) = 0LL;
  *(void *)(a2 + 192) = 0LL;
  CC_MD4_Update(v4, &data, 4u);
  return sub_10001210C();
}

uint64_t sub_10000DEC0(uint64_t a1)
{
  return *(void *)(a1 + 256);
}

void sub_10000DEC8(uint64_t a1, void **a2)
{
  if (a2)
  {
    sub_10000DF00(a1, (uint64_t)a2, 1);
    free(a2[29]);
    free(a2);
  }

void sub_10000DF00(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void *)(a2 + 64);
  if (v6)
  {
    sub_1000130B0(v6);
    *(void *)(a2 + 64) = 0LL;
  }

  int v7 = *(_DWORD *)(a2 + 72);
  if (v7 != -1)
  {
    close(v7);
    *(_DWORD *)(a2 + 72) = -1;
  }

  if (a3)
  {
    if (!sub_10000E01C(a1, a2))
    {
      if (dword_100058FD8)
      {
        int v15 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003DBA4();
        }
        *__error() = v15;
      }

      sub_1000218D4( "%s: partial cleanup failed, left at %s",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)(*(void *)(a2 + 200) + 152LL * *(void *)(a2 + 8)));
    }
  }

  else
  {
    int v16 = *(_DWORD *)(a2 + 76);
    if (v16 != -1)
    {
      close(v16);
      *(_DWORD *)(a2 + 76) = -1;
    }
  }

  free(*(void **)(a2 + 80));
  *(void *)(a2 + 80) = 0LL;
  *(_DWORD *)a2 = 0;
}

uint64_t sub_10000E010(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return sub_10000E01C(a1, a2);
  }
  return a1;
}

uint64_t sub_10000E01C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 200);
  if (!v2) {
    return 1LL;
  }
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = (const char **)(v2 + 152 * v5);
  int v7 = *(_DWORD *)(a2 + 76);
  if (v7 == -1)
  {
    if ((*(_DWORD *)(v2 + 152 * v5 + 8) & 0x80000000) != 0) {
      return 1LL;
    }
    uint64_t v13 = sub_10000DACC(a1, (const char **)(v2 + 152 * v5), v28, 0x400uLL);
    if (fstatat(*(_DWORD *)(a2 + 216), v13, &v27, 32) == -1 || (v27.st_mode & 0xF000) != 0x4000) {
      return 1LL;
    }
    int v14 = *(_DWORD *)(a2 + 216);
    int v15 = v13;
    int v16 = 128;
    goto LABEL_21;
  }

  close(v7);
  *(_DWORD *)(a2 + 76) = -1;
  uint64_t v8 = *(const char **)(a2 + 80);
  if (!v8) {
    return 1LL;
  }
  uint64_t v9 = *(void *)a1;
  if (!*(_DWORD *)(*(void *)a1 + 44LL))
  {
    if (!*(void *)(v9 + 544) || *(_DWORD *)(v9 + 40) || *(_DWORD *)(v9 + 12))
    {
      int v14 = *(_DWORD *)(a2 + 216);
      int v15 = *(const char **)(a2 + 80);
    }

    else
    {
      int v20 = *v6;
      int v21 = strrchr(v20, 47);
      if (v21) {
        int v15 = v21 + 1;
      }
      else {
        int v15 = v20;
      }
      int v14 = *(_DWORD *)(a2 + 220);
    }

    int v16 = 0;
LABEL_21:
    unlinkat(v14, v15, v16);
    return 1LL;
  }

  if (*(_DWORD *)(v9 + 40) || (*(_DWORD *)(v2 + 152 * v5 + 8) & 0x80000000) == 0) {
    return 1LL;
  }
  int v10 = *(_DWORD *)(a2 + 216);
  if (*(void *)(v9 + 48))
  {
    uint64_t v11 = sub_10000DACC(a1, v6, v28, 0x400uLL);
    int v12 = fstatat(v10, v11, &v27, 32);
    if (v12)
    {
      if (v12 != -1) {
        goto LABEL_33;
      }
      if (*__error() != 2) {
        return 0LL;
      }
    }

    else
    {
      if ((v27.st_mode & 0xF000) == 0x4000) {
        goto LABEL_33;
      }
      if (unlinkat(v10, v11, 0) == -1) {
        return 0LL;
      }
    }

void sub_10000E2D8( void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (int *)a1[24];
  if (v8)
  {
    if (v8[6] >= 1)
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v12 = *((void *)v8 + 1);
      do
      {
        uint64_t v13 = *(char **)v8;
        if (dword_100058FD8)
        {
          int v14 = *__error();
          int v15 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v38 = *(void *)&v13[v10];
            uint64_t v37 = *(void *)&v13[v10 + 8];
            *(_DWORD *)uint8_t buf = 136315394;
            uint64_t v47 = v38;
            __int16 v48 = 2080;
            uint64_t v49 = v37;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "mv '%s' -> '%s'", buf, 0x16u);
          }

          *__error() = v14;
        }

        int v16 = &v13[v10];
        sub_100021744(2, "mv '%s' -> '%s'", a3, a4, a5, a6, a7, a8, *(void *)&v13[v10]);
        if (*((_DWORD *)*a1 + 50)) {
          uint64_t v17 = (const char **)sub_100028E10(*((void *)v16 + 2), *((unsigned int **)v8 + 2));
        }
        else {
          uint64_t v17 = 0LL;
        }
        if (sub_100004BF4( (uint64_t)a1,  *((void *)v16 + 2),  v8[7],  *(const char **)v16,  v8[8],  *((char **)v16 + 1),  1)) {
          int v18 = 4;
        }
        else {
          int v18 = 8;
        }
        if (v17)
        {
          int v19 = (const char *)*((void *)v16 + 1);
          if (unlinkat(*(_DWORD *)(v12 + 216), v19, 0) == -1 && *__error() != 2)
          {
            if (dword_100058FD8)
            {
              int v40 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003DC4C(&v44, v45);
              }
              *__error() = v40;
            }

            sub_100021980("unlink");
            int v18 = 8;
          }

          if (linkat(*(_DWORD *)(v12 + 216), *v17, *(_DWORD *)(v12 + 216), v19, 0) == -1)
          {
            sub_100021744(-1, "While hard linking '%s' to '%s' ", v20, v21, v22, v23, v24, v25, (char)*v17);
            if (dword_100058FD8)
            {
              int v26 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003DC20(&v42, v43);
              }
              *__error() = v26;
            }

            sub_100021980("linkat");
          }
        }

        stat v27 = &v13[v10];
        uint64_t v28 = *(const char **)&v13[v10 + 24];
        if (v28 && unlinkat(v8[8], v28, 128) == -1 && *__error() != 66)
        {
          if (dword_100058FD8)
          {
            int v41 = *__error();
            uint64_t v36 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
            {
              uint64_t v39 = *((void *)v27 + 3);
              *(_DWORD *)uint8_t buf = 136315138;
              uint64_t v47 = v39;
              _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "rmdir '%s'", buf, 0xCu);
            }

            *__error() = v41;
          }

          sub_1000218D4("rmdir '%s'", v29, v30, v31, v32, v33, v34, v35, *((void *)v27 + 3));
        }

        *(_DWORD *)(*((void *)v16 + 2) + 112LL) |= v18;
        free(*(void **)&v13[v10]);
        free(*((void **)v27 + 3));
        *(void *)&v13[v10] = 0LL;
        *((void *)v27 + 3) = 0LL;
        ++v11;
        v10 += 32LL;
      }

      while (v11 < v8[6]);
    }

    free(*(void **)v8);
    *(void *)uint64_t v8 = 0LL;
    free(a1[24]);
    a1[24] = 0LL;
  }

uint64_t sub_10000E6C4(uint64_t a1, void *a2, int *a3, size_t a4, unsigned int *a5)
{
  uint64_t v8 = (uint64_t)a2;
  if (*(_DWORD *)(*a2 + 196LL))
  {
    uint64_t v10 = (void *)a2[24];
    if (!v10)
    {
      uint64_t v11 = malloc(0x28uLL);
      *(void *)(v8 + 192) = v11;
      if (!v11)
      {
        if (dword_100058FD8)
        {
          int v190 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003E99C();
          }
          *__error() = v190;
        }

        sub_1000218D4("malloc renamer", v12, v13, v14, v15, v16, v17, v18, (char)v374);
        goto LABEL_470;
      }

      v11[1] = a1;
      v11[2] = a5;
      *uint64_t v11 = 0LL;
      int v19 = *(_DWORD *)(a1 + 216);
      *((_DWORD *)v11 + 6) = 0;
      *((_DWORD *)v11 + 7) = v19;
      *((_DWORD *)v11 + 8) = v19;
      uint64_t v10 = v11;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v20 = v10;
  int v21 = *(_DWORD *)a1;
  if (*(_DWORD *)a1) {
    goto LABEL_7;
  }
  if (!sub_100020708(v8, *(unsigned int *)(a1 + 224), &v385))
  {
    if (dword_100058FD8)
    {
      int v173 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003DC78();
      }
      *__error() = v173;
    }

    sub_100021980("io_read_int");
    return 0xFFFFFFFFLL;
  }

  if ((v385 & 0x80000000) != 0)
  {
    if (dword_100058FD8)
    {
      int v191 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG)) {
        sub_10003E964();
      }
      *__error() = v191;
    }

    sub_100021744(2, "downloader: phase complete", v25, v26, v27, v28, v29, v30, (char)v374);
    return 0LL;
  }

  unint64_t v31 = *(void *)(a1 + 208);
  if (v31 <= v385)
  {
    if (dword_100058FD8)
    {
      int v192 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003E934();
      }
      *__error() = v192;
    }

    sub_100021850("index out of bounds");
    return 0xFFFFFFFFLL;
  }

  uint64_t v32 = *(void *)(a1 + 200);
  uint64_t v33 = (int *)(v32 + 144);
  uint64_t v34 = 0LL;
  while (1)
  {
    int v35 = *v33;
    v33 += 38;
    if (v35 == v385) {
      break;
    }
    if (v31 == ++v34)
    {
      int v36 = *(_DWORD *)(a1 + 224);
      unsigned int v37 = v385;
      goto LABEL_297;
    }
  }

  unsigned int v37 = v34;
  unsigned int v385 = v34;
  int v36 = *(_DWORD *)(a1 + 224);
LABEL_297:
  if (*(int *)(v8 + 260) <= 28)
  {
    size_t __counta = a4;
    v204 = v20;
    *(_DWORD *)(v32 + 152LL * v37 + 116) = 0x8000;
  }

  else
  {
    if (!sub_100020938(v8, v36, v428))
    {
      if (dword_100058FD8)
      {
        int v255 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003DCD8();
        }
        *__error() = v255;
      }

      sub_100021980("io_read_short");
      goto LABEL_412;
    }

    size_t __counta = a4;
    v204 = v20;
    __int16 st_dev = v428[0].st_dev;
    *(_DWORD *)(v32 + 152LL * v37 + 116) = v428[0].st_dev;
    if ((st_dev & 0x800) != 0)
    {
      if (!sub_10001FB98(v8, v36, (char *)&buf))
      {
        if (dword_100058FD8)
        {
          int v274 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003E904();
          }
          *__error() = v274;
        }

        sub_100021980("io_read_byte");
        goto LABEL_412;
      }

      *(_DWORD *)(v32 + 152LL * v37 + 120) = LOBYTE(buf.st_dev);
      __int16 st_dev = v428[0].st_dev;
    }

    if ((st_dev & 0x1000) != 0)
    {
      uint64_t v206 = v32 + 152LL * v37;
      v209 = *(void **)(v206 + 88);
      v208 = (char **)(v206 + 88);
      v207 = v209;
      if (v209) {
        free(v207);
      }
      v210 = (char *)calloc(1uLL, 0x400uLL);
      *v208 = v210;
      if (!v210)
      {
        if (dword_100058FD8)
        {
          int v276 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003E8A4();
          }
          *__error() = v276;
        }

        sub_1000218D4("calloc hlink vstring", v211, v212, v213, v214, v215, v216, v217, (char)v374);
        goto LABEL_412;
      }

      if (!sub_100020A60(v8, v36, v210, 0x400uLL))
      {
        if (dword_100058FD8)
        {
          int v218 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003E8D4();
          }
          *__error() = v218;
        }

        sub_100021980("io_read_vstring");
LABEL_412:
        if (dword_100058FD8)
        {
          int v275 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003DCA8();
          }
          *__error() = v275;
        }

        sub_100021850("get_iflags");
        return 0LL;
      }
    }
  }

  uint64_t v219 = *(void *)(a1 + 200);
  unsigned int v220 = v385;
  v221 = (const char **)(v219 + 152LL * (int)v385);
  if (*((_DWORD *)v221 + 29) == 0x2000 || *(_DWORD *)(*(void *)v8 + 36LL) && *(_DWORD *)(v8 + 188) == -1) {
    return 1LL;
  }
  uint64_t v222 = (int)v385;
  if (*(_DWORD *)(v219 + 152LL * (int)v385 + 144) != v385)
  {
    uint64_t v223 = *(void *)(a1 + 208);
    uint64_t v222 = (int)v385;
    if (v223)
    {
      v224 = (int *)(v219 + 144);
      uint64_t v225 = 0LL;
      uint64_t v226 = 0LL;
      while (1)
      {
        int v227 = *v224;
        v224 += 38;
        if (v227 == v385) {
          break;
        }
        ++v225;
        v226 += (uint64_t)&_mh_execute_header;
        if (v223 == v225)
        {
          uint64_t v222 = (int)v385;
          goto LABEL_438;
        }
      }

      unsigned int v385 = v225;
      uint64_t v222 = v226 >> 32;
    }
  }

LABEL_438:
  sub_10000DE40(v8, a1, v222);
  if (!sub_100006450(v8, *(_DWORD *)(a1 + 224), (void *)(a1 + 16)))
  {
    if (dword_100058FD8)
    {
      int v292 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003DD08();
      }
      *__error() = v292;
    }

    sub_100021980("blk_send_ack");
    goto LABEL_468;
  }

  *(_DWORD *)a1 = 1;
  v288 = *v221;
  if ((*(_DWORD *)(v219 + 152LL * (int)v220 + 8) & 0x80000000) != 0)
  {
    int v291 = *(_DWORD *)(a1 + 216);
    v288 = *v221;
  }

  else
  {
    int v289 = *(_DWORD *)(v219 + 152LL * (int)v220 + 8);
    v290 = strrchr(*v221, 47);
    if (v290) {
      v288 = v290 + 1;
    }
    int v291 = v289;
  }

  int v293 = v291;
  if (*(_DWORD *)(v219 + 152LL * (int)v220 + 120) == 131
    && (v294 = *(const char **)(v219 + 152LL * (int)v220 + 88)) != 0LL)
  {
    int v295 = openat(v293, v294, 4);
  }

  else
  {
    int v295 = openat(v293, v288, 4);
  }

  int v296 = v295;
  *(_DWORD *)(a1 + 72) = v295;
  uint64_t v20 = v204;
  if (*(_DWORD *)(*(void *)v8 + 136LL))
  {
    a4 = __counta;
    if (!dword_100058FDC)
    {
      fprintf(__stderrp, "%s\n", *v221);
      int v296 = *(_DWORD *)(a1 + 72);
    }
  }

  else
  {
    a4 = __counta;
  }

  if (v296 != -1) {
    goto LABEL_458;
  }
  if (*__error() != 2)
  {
    if (dword_100058FD8)
    {
      int v304 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003E844();
      }
      *__error() = v304;
    }

    sub_1000218D4("%s: rsync_downloader: openat", v297, v298, v299, v300, v301, v302, v303, (char)v288);
LABEL_468:
    uint64_t v23 = v221;
    goto LABEL_469;
  }

  int v296 = *(_DWORD *)(a1 + 72);
  if (v296 != -1)
  {
LABEL_458:
    *a3 = v296;
    if (*(_DWORD *)(*(void *)v8 + 112LL)) {
      fcntl(*(_DWORD *)(a1 + 72), 48);
    }
    return 1LL;
  }

  int v21 = *(_DWORD *)a1;
LABEL_7:
  size_t __count = a4;
  v382 = a5;
  uint64_t v22 = *(void *)(a1 + 200);
  uint64_t v379 = *(void *)(a1 + 8);
  uint64_t v23 = (const char **)(v22 + 152 * v379);
  if (v21 == 1)
  {
    uint64_t v24 = (const char **)(a1 + 80);
    if (*(void *)(a1 + 80)) {
      sub_10003E030();
    }
    if (*(_DWORD *)(*(void *)v8 + 36LL))
    {
      *a3 = -1;
LABEL_11:
      *(_DWORD *)a1 = 2;
      return 1LL;
    }

    int v174 = *(_DWORD *)(a1 + 72);
    if (v174 != -1)
    {
      if (fstat(v174, v428) == -1)
      {
        if (dword_100058FD8)
        {
          int v229 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003DFD0();
          }
          *__error() = v229;
        }

        v374 = *v23;
        v230 = "%s: fstat";
        goto LABEL_368;
      }

      if (*(_DWORD *)(a1 + 72) != -1 && (v428[0].st_mode & 0xF000) != 0x8000)
      {
        if (dword_100058FD8)
        {
          int v251 = *__error();
          v252 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            v253 = *v23;
            buf.__int16 st_dev = 136315138;
            *(void *)&buf.st_mode = v253;
            _os_log_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_INFO, "%s: not regular", (uint8_t *)&buf, 0xCu);
          }

          *__error() = v251;
        }

        sub_100021AB0("%s: not regular", *v23);
        goto LABEL_469;
      }
    }

    sub_100028E10((uint64_t)v23, v382);
    int v182 = *(_DWORD *)(a1 + 72);
    if (v182 == -1
      || v428[0].st_size < 1
      || (v183 = sub_100012F30(v182, v428[0].st_size, 1), (*(void *)(a1 + 64) = v183) != 0LL))
    {
      *a3 = -1;
      uint64_t v184 = *(void *)v8;
      uint64_t v185 = v379;
      if (*(_DWORD *)(*(void *)v8 + 40LL)
        || *(_DWORD *)(v184 + 12)
        || (*(_DWORD *)(v22 + 152 * v379 + 8) & 0x80000000) == 0)
      {
        v186 = *v23;
        if ((*(_DWORD *)(v22 + 152 * v379 + 8) & 0x80000000) != 0)
        {
          int v189 = *(_DWORD *)(a1 + 216);
          v186 = *v23;
        }

        else
        {
          int v187 = *(_DWORD *)(v22 + 152 * v379 + 8);
          v188 = strrchr(*v23, 47);
          uint64_t v185 = v379;
          if (v188) {
            v186 = v188 + 1;
          }
          int v189 = v187;
        }

        int v231 = openat(v189, v186, 518, *(_WORD *)(v22 + 152 * v185 + 24) & 0x1FF);
        *(_DWORD *)(a1 + 76) = v231;
        if (v231 == -1)
        {
          if (dword_100058FD8)
          {
            int v244 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003DD98();
            }
            *__error() = v244;
          }

          sub_100021980("%s: open");
          goto LABEL_469;
        }

        v232 = *v23;
        v233 = strrchr(*v23, 47);
        if (v233) {
          v234 = v233 + 1;
        }
        else {
          v234 = v232;
        }
        v235 = strdup(v234);
        *uint64_t v24 = v235;
        if (!v235)
        {
          if (dword_100058FD8)
          {
            int v256 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003DDF8();
            }
            *__error() = v256;
          }

          sub_100021980("strdup", v375);
          goto LABEL_469;
        }

        if (dword_100058FD8)
        {
          int v242 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG)) {
            sub_10003DE80();
          }
          *__error() = v242;
          v243 = *v23;
        }

        else
        {
          LOBYTE(v243) = (_BYTE)v232;
        }

        sub_100021744(2, "%s: writing inplace", v236, v237, v238, v239, v240, v241, (char)v243);
        if (!**(_DWORD **)(v8 + 200) || !sub_1000130A4(*(void *)(a1 + 64))) {
          goto LABEL_491;
        }
        if (qword_100058F00 && qword_100058F08) {
          sub_10003DE28();
        }
        if (qword_100058F00) {
          qword_100058F08 = qword_100058F00;
        }
        if (sigsetjmp(dword_100058F10, 0) >= 1)
        {
          qword_100058F00 = qword_100058F08;
          qword_100058F08 = 0LL;
          if (dword_100058FD8)
          {
            int v257 = *__error();
            v258 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
            {
              uint64_t v259 = *(void *)(*(void *)(a1 + 200) + 152LL * *(void *)(a1 + 8));
              buf.__int16 st_dev = 136315138;
              *(void *)&buf.st_mode = v259;
              _os_log_impl( (void *)&_mh_execute_header,  v258,  OS_LOG_TYPE_INFO,  "%s: file truncated while reading",  (uint8_t *)&buf,  0xCu);
            }

            *__error() = v257;
          }

          sub_100021AB0( "%s: file truncated while reading",  *(const char **)(*(void *)(a1 + 200) + 152LL * *(void *)(a1 + 8)));
          *(_DWORD *)a1 = 3;
LABEL_491:
          if (*(_DWORD *)(*(void *)v8 + 112LL))
          {
            fcntl(*(_DWORD *)(a1 + 72), 48);
            fcntl(*(_DWORD *)(a1 + 76), 48);
          }

          goto LABEL_11;
        }

        qword_100058F00 = *(void *)(a1 + 64);
        v277 = sub_100013094((void *)qword_100058F00, 0LL);
        uint64_t v278 = sub_1000130A4(*(void *)(a1 + 64));
        if (v278)
        {
          unint64_t v281 = v278;
          do
          {
            unint64_t v282 = v281;
            if (v281 >= 0xFFFFFFFF) {
              uint64_t v283 = 0xFFFFFFFFLL;
            }
            else {
              uint64_t v283 = v281;
            }
            CC_MD4_Update((CC_MD4_CTX *)(a1 + 88), v277, v283);
            v277 = (void *)((char *)v277 + v283);
            unint64_t v281 = v282 - v283;
          }

          while (v282 != v283);
        }

        sub_1000116F8(*(void *)(a1 + 64), v279, v280);
        off_t v284 = lseek(*(_DWORD *)(a1 + 76), 0LL, 2);
        if (v284 == v428[0].st_size) {
          goto LABEL_491;
        }
        if (dword_100058FD8)
        {
          int v285 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003DE50();
          }
          *__error() = v285;
        }

        sub_100021980("lseek");
LABEL_355:
        if (v22) {
          goto LABEL_469;
        }
        goto LABEL_470;
      }

      v286 = (char *)*v23;
      if (*(_DWORD *)(v184 + 32)) {
        BOOL v287 = 1;
      }
      else {
        BOOL v287 = strchr(*v23, 47) != 0LL;
      }
      if (sub_100027C70((char **)(a1 + 80), v286, v287, *(void *)(v184 + 544) != 0LL) == -1)
      {
        if (dword_100058FD8)
        {
          int v309 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003DEE0();
          }
          *__error() = v309;
        }

        sub_100021980("mktemplate", v374);
        goto LABEL_469;
      }

      uint64_t v306 = 220LL;
      if (!*(void *)(*(void *)v8 + 544LL)) {
        uint64_t v306 = 216LL;
      }
      int v307 = sub_100027920(*(_DWORD *)(a1 + v306), *(char **)(a1 + 80));
      *(_DWORD *)(a1 + 76) = v307;
      if (v307 != -1)
      {
        if (dword_100058FD8)
        {
          int v308 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG)) {
            sub_10003DF70();
          }
          *__error() = v308;
        }

        sub_100021744(2, "%s: temporary: %s", v176, v177, v178, v179, v180, v181, (char)*v23);
        goto LABEL_491;
      }

      if (dword_100058FD8)
      {
        int v313 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003DF10();
        }
        *__error() = v313;
      }

      v374 = *v24;
      v230 = "mkstempat: '%s'";
    }

    else
    {
      if (dword_100058FD8)
      {
        int v254 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003DD38();
        }
        *__error() = v254;
      }

      v374 = *v23;
      v230 = "%s: mmap";
    }

LABEL_368:
    sub_1000218D4(v230, v175, v176, v177, v178, v179, v180, v181, (char)v374);
    goto LABEL_469;
  }

  v383 = v20;
  if (*(_DWORD *)(*(void *)v8 + 112LL))
  {
    fcntl(*(_DWORD *)(a1 + 72), 48);
    fcntl(*(_DWORD *)(a1 + 76), 48);
  }

  uint64_t v378 = v8;
  do
  {
    sub_1000119C4(v8, *(void *)(*(void *)(a1 + 200) + 152LL * *(void *)(a1 + 8) + 40), *(void *)(a1 + 192), 0);
    if ((*(_DWORD *)a1 & 0xFFFFFFFE) != 2) {
      sub_10003E81C();
    }
    if (!*(void *)(a1 + 80) && !*(_DWORD *)(*(void *)v8 + 36LL)) {
      sub_10003E058();
    }
    if (*(_DWORD *)(a1 + 76) == -1 && !*(_DWORD *)(*(void *)v8 + 36LL)) {
      sub_10003E080();
    }
    uint64_t v38 = *(unsigned int *)(a1 + 224);
    if ((_DWORD)v38 == -1) {
      sub_10003E0A8();
    }
    if (*(_DWORD *)(*(void *)v8 + 552LL))
    {
      *(_DWORD *)v418 = *(void *)(a1 + 264);
      if (!sub_10001FB98(v8, v38, (char *)md))
      {
        if (!dword_100058FD8)
        {
LABEL_56:
          sub_100021980("io_read_byte");
LABEL_57:
          int v81 = 0;
LABEL_128:
          int v120 = v81;
          continue;
        }

        int v80 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003E71C(&v404, v405);
        }
LABEL_55:
        *__error() = v80;
        goto LABEL_56;
      }

      unsigned int v45 = LOBYTE(md[0]);
      if ((md[0] & 0xC0) == 0x40)
      {
        if (sub_10001FB98(v8, *(_DWORD *)(a1 + 224), (char *)&buf))
        {
          unsigned int v46 = LOBYTE(buf.st_dev) | ((md[0] & 0xBF) << 8);
          uint64_t v47 = v46;
          __int16 v48 = malloc(v46);
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = (char *)malloc(0x8030uLL);
            if (v50)
            {
              int data = v50;
              if (!sub_10001FC1C(v8, *(_DWORD *)(a1 + 224), (char *)v49, v46))
              {
                if (dword_100058FD8)
                {
                  int v128 = *__error();
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                    sub_10003E698(&v396, v397);
                  }
                  *__error() = v128;
                }

                sub_100021980("io_read_buf");
LABEL_150:
                free(v49);
                free(data);
                int v57 = 0;
                goto LABEL_127;
              }

              if (*(_DWORD *)a1 == 3)
              {
                int v57 = 2;
LABEL_127:
                int v81 = v57;
                goto LABEL_128;
              }

              v384 = v23;
              v377 = v49;
              sub_100021744(3, "decompress_state transition %d -> %d", v51, v52, v53, v54, v55, v56, dword_100058760);
              dword_100058760 = 3;
              qword_100058768 = (uint64_t)v49;
              dword_100058770 = v46;
              qword_100058780 = (uint64_t)data;
              dword_100058788 = 32816;
              if (!v46)
              {
LABEL_172:
                unint64_t v145 = 0LL;
LABEL_173:
                unint64_t v146 = *(void *)(a1 + 192) + v145;
                *(void *)(a1 + 184) += v47;
                *(void *)(a1 + 192) = v146;
                *(void *)(v8 + 88) += v145;
                free(v49);
                free(data);
                if (dword_100058770) {
                  sub_10003E748();
                }
                sub_100021744( 3,  "decompress_state transition %d -> %d",  v147,  v148,  v149,  v150,  v151,  v152,  dword_100058760);
                dword_100058760 = 4;
                int v57 = 3;
                uint64_t v23 = v384;
                goto LABEL_127;
              }

              while (1)
              {
                int v137 = sub_10001C0D0((unsigned __int8 **)&qword_100058768, 0LL, v133, v134, v135, v136);
                if (v137) {
                  break;
                }
                int v138 = dword_100058788;
                size_t v139 = (32816 - dword_100058788);
                if (!sub_100011C00(data, v139, a1, v8))
                {
                  uint64_t v23 = v384;
                  uint64_t v49 = v377;
                  if (dword_100058FD8)
                  {
                    int v170 = *__error();
                    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                      sub_10003E7B4(&v394, v395);
                    }
                    goto LABEL_228;
                  }

                  goto LABEL_229;
                }

                uint64_t v140 = v22;
                if (v138 != 32816)
                {
                  v141 = data;
                  unint64_t v142 = v139;
                  do
                  {
                    if (v142 >= 0xFFFFFFFF) {
                      uint64_t v143 = 0xFFFFFFFFLL;
                    }
                    else {
                      uint64_t v143 = v142;
                    }
                    CC_MD4_Update((CC_MD4_CTX *)(a1 + 88), v141, v143);
                    v141 += v143;
                    v142 -= v143;
                  }

                  while (v142);
                }

                size_t v144 = *(void *)(a1 + 192) + v139;
                *(void *)(a1 + 184) += v47;
                *(void *)(a1 + 192) = v144;
                uint64_t v8 = v378;
                *(void *)(v378 + 88) += v139;
                uint64_t v49 = v377;
                qword_100058780 = (uint64_t)data;
                dword_100058788 = 32816;
                uint64_t v22 = v140;
                if (!dword_100058770) {
                  goto LABEL_172;
                }
              }

              int v158 = v137;
              if (v137 == -5)
              {
                unint64_t v145 = (32816 - dword_100058788);
                if (dword_100058788 == 32816) {
                  goto LABEL_173;
                }
                uint64_t v159 = v22;
                v160 = data;
                int v161 = sub_100011C00(data, (32816 - dword_100058788), a1, v8);
                unint64_t v162 = v145;
                if (!v161)
                {
                  uint64_t v23 = v384;
                  uint64_t v8 = v378;
                  uint64_t v49 = v377;
                  if (dword_100058FD8)
                  {
                    int v170 = *__error();
                    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                      sub_10003E7B4(&v392, v393);
                    }
LABEL_228:
                    *__error() = v170;
                  }

LABEL_229:
                  sub_100021850("buf_copy dbuf");
                  goto LABEL_150;
                }

                do
                {
                  unint64_t v163 = v162;
                  if (v162 >= 0xFFFFFFFF) {
                    uint64_t v164 = 0xFFFFFFFFLL;
                  }
                  else {
                    uint64_t v164 = v162;
                  }
                  CC_MD4_Update((CC_MD4_CTX *)(a1 + 88), v160, v164);
                  v160 += v164;
                  unint64_t v162 = v163 - v164;
                }

                while (v163 != v164);
                uint64_t v22 = v159;
                uint64_t v8 = v378;
                uint64_t v49 = v377;
                goto LABEL_173;
              }

              if (dword_100058FD8)
              {
                int v165 = *__error();
                v166 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
                {
                  v428[0].__int16 st_dev = 67109120;
                  *(_DWORD *)&v428[0].st_mode = v158;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v166,  OS_LOG_TYPE_ERROR,  "inflate res=%d",  (uint8_t *)v428,  8u);
                }

                *__error() = v165;
              }

              sub_100021850("inflate res=%d", v158);
              v167 = (const char *)qword_100058798;
              uint64_t v23 = v384;
              if (qword_100058798)
              {
                if (dword_100058FD8)
                {
                  int v168 = *__error();
                  v169 = (os_log_s *)qword_100058FE8;
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                    sub_10003E770(v434, &v435, v169);
                  }
                  *__error() = v168;
                  v167 = (const char *)qword_100058798;
                }

                sub_100021850("inflate error: %s", v167);
              }

              free(v49);
              size_t v119 = data;
            }

            else
            {
              if (dword_100058FD8)
              {
                int v118 = *__error();
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                  sub_10003E66C(&v398, v399);
                }
                *__error() = v118;
              }

              sub_100021980("malloc");
              size_t v119 = v49;
            }

            free(v119);
          }

          else
          {
            if (dword_100058FD8)
            {
              int v113 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003E66C(&v400, v401);
              }
              *__error() = v113;
            }

            sub_100021980("malloc");
          }
        }

        else
        {
          if (dword_100058FD8)
          {
            int v111 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003E640(&v402, v403);
            }
            *__error() = v111;
          }

          sub_100021980("io_read_int");
        }

        int v57 = 0;
        goto LABEL_127;
      }

      if (dword_100058760 != 4)
      {
        char v100 = dword_100058760;
        if (!LOBYTE(md[0])) {
          goto LABEL_73;
        }
        goto LABEL_80;
      }

      sub_100021744(3, "decompress_state: flushing end of stream", v39, v40, v41, v42, v43, v44, (char)v374);
      if (!qword_100058780)
      {
LABEL_72:
        sub_100021744(3, "decompress_state transition %d -> %d", v82, v83, v84, (uint64_t)v85, v86, v87, dword_100058760);
        dword_100058760 = 1;
        unsigned int v45 = LOBYTE(md[0]);
        char v100 = 1;
        if (!LOBYTE(md[0]))
        {
LABEL_73:
          sub_100021744(3, "decompress_state transition %d -> %d", v39, v40, v41, v42, v43, v44, v100);
          dword_100058760 = 0;
          int v81 = 1;
          goto LABEL_128;
        }

LABEL_80:
        if ((v45 & 0x80) != 0)
        {
          *(_DWORD *)v418 += v45 & 0x3F;
          LOBYTE(md[0]) = v45 >> 6;
          if ((v45 & 0x40) != 0) {
            goto LABEL_84;
          }
        }

        else if ((v45 & 0x20) != 0)
        {
          if (!sub_100020708(v8, *(unsigned int *)(a1 + 224), v418))
          {
            if (dword_100058FD8)
            {
              int v153 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003E640(&v390, v391);
              }
              *__error() = v153;
            }

            sub_100021980("io_read_int");
            goto LABEL_57;
          }

          if ((md[0] & 1) != 0)
          {
LABEL_84:
            if (sub_10001FB98(v8, *(_DWORD *)(a1 + 224), (char *)v428))
            {
              uint64_t st_dev_low = LOBYTE(v428[0].st_dev);
              if (sub_10001FB98(v8, *(_DWORD *)(a1 + 224), (char *)v428))
              {
                unint64_t v109 = st_dev_low | ((unint64_t)LOBYTE(v428[0].st_dev) << 8);
                sub_100021744( 3,  "decompress_state transition %d -> %d",  v103,  v104,  v105,  v106,  v107,  v108,  dword_100058760);
                dword_100058760 = 2;
                unint64_t v110 = v109;
                goto LABEL_106;
              }

              if (!dword_100058FD8) {
                goto LABEL_56;
              }
              int v80 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003E71C(&v386, v387);
              }
            }

            else
            {
              if (!dword_100058FD8) {
                goto LABEL_56;
              }
              int v80 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003E71C(&v388, v389);
              }
            }

            goto LABEL_55;
          }
        }

        unint64_t v110 = 0LL;
LABEL_106:
        uint64_t v114 = -(uint64_t)v110;
        while (1)
        {
          if (*(_DWORD *)a1 == 3)
          {
LABEL_112:
            *(void *)(a1 + 264) = *(int *)v418 - 1LL;
            int v81 = 3;
            goto LABEL_128;
          }

          if (!v114)
          {
            sub_100021744(3, "decompress_state transition %d -> %d", v39, v40, v41, v42, v43, v44, dword_100058760);
            dword_100058760 = 1;
          }

          unint64_t v115 = *(int *)v418;
          ++*(_DWORD *)v418;
          int v116 = sub_100012248((void *)v8, a1, v115);
          if (v116 != 3) {
            break;
          }
          if (++v114 == 1) {
            goto LABEL_112;
          }
        }

        int v121 = v116;
        int v81 = v116;
        if (*(_DWORD *)a1 != 3)
        {
          if (dword_100058FD8)
          {
            int v122 = *__error();
            v123 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
            {
              v428[0].__int16 st_dev = 67109120;
              *(_DWORD *)&v428[0].st_mode = v81;
              _os_log_error_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_ERROR,  "protocol_token_ff res=%d",  (uint8_t *)v428,  8u);
            }

            *__error() = v122;
          }

          sub_100021850("protocol_token_ff res=%d", v121);
        }

        goto LABEL_128;
      }

      dword_100058770 = 0;
      dword_100058788 = 32816;
      int v88 = sub_10001C0D0((unsigned __int8 **)&qword_100058768, 2uLL, v82, v83, v84, v85);
      int v89 = v88;
      if (v88 != -5 && v88)
      {
        if (dword_100058FD8)
        {
          int v124 = *__error();
          v125 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
          {
            v428[0].__int16 st_dev = 67109120;
            *(_DWORD *)&v428[0].st_mode = v89;
            _os_log_error_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_ERROR,  "inflate protocol_token_cflush res=%d",  (uint8_t *)v428,  8u);
          }

          *__error() = v124;
        }

        sub_100021850("inflate protocol_token_cflush res=%d", v89);
        if (qword_100058798)
        {
          if (dword_100058FD8)
          {
            int v126 = *__error();
            uint32_t v127 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003E770(v436, &v437, v127);
            }
            *__error() = v126;
          }

          sub_100021850("inflate error: %s");
        }

        goto LABEL_198;
      }

      if (v88 != -5 && dword_100058788 != 32816)
      {
        size_t v90 = (32816 - dword_100058788);
        uint64_t v8 = v378;
        if (!sub_100011C00(0LL, v90, a1, v378))
        {
          if (dword_100058FD8)
          {
            int v155 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003E7B4(&v406, v407);
            }
            *__error() = v155;
          }

          sub_100021850("buf_copy dbuf");
          goto LABEL_198;
        }

        uint64_t v91 = 0LL;
        do
        {
          unint64_t v92 = v90;
          uint64_t v93 = v91;
          if (v92 >= 0xFFFFFFFF) {
            uint64_t v94 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v94 = v92;
          }
          CC_MD4_Update((CC_MD4_CTX *)(a1 + 88), v91, v94);
          uint64_t v91 = &v93[v94];
          size_t v90 = v92 - v94;
        }

        while (v92 != v94);
      }

      int v95 = sub_10001DA34((uint64_t)&qword_100058768);
      if (v95 == 1)
      {
        dword_100058770 = 4;
        qword_100058768 = (uint64_t)&buf;
        buf.__int16 st_dev = -65536;
        sub_10001C0D0((unsigned __int8 **)&qword_100058768, 2uLL, v96, v97, v98, v99);
        uint64_t v8 = v378;
        goto LABEL_72;
      }

      int v130 = v95;
      if (dword_100058FD8)
      {
        int v131 = *__error();
        v132 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
        {
          v428[0].__int16 st_dev = 67109120;
          *(_DWORD *)&v428[0].st_mode = v130;
          _os_log_error_impl( (void *)&_mh_execute_header,  v132,  OS_LOG_TYPE_ERROR,  "inflateSyncPoint res=%d",  (uint8_t *)v428,  8u);
        }

        *__error() = v131;
      }

      sub_100021850("inflateSyncPoint res=%d", v130);
      uint64_t v8 = v378;
LABEL_198:
      if (dword_100058FD8)
      {
        int v156 = *__error();
        v157 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003E7E0(v432, v433, v157);
        }
        *__error() = v156;
      }

      sub_100021850("protocol_token_cflush=%d", 0);
      goto LABEL_57;
    }

    if (!sub_100020708(v8, v38, v428))
    {
      if (dword_100058FD8)
      {
        int v101 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003E640(&v416, v417);
        }
        *__error() = v101;
      }

      sub_100021980("io_read_int");
      goto LABEL_186;
    }

    size_t v58 = v428[0].st_dev;
    if (v428[0].st_dev < 1)
    {
      if (v428[0].st_dev < 0)
      {
        if (*(_DWORD *)a1 == 3) {
          int v79 = 2;
        }
        else {
          int v79 = sub_100012248((void *)v8, a1, ~v428[0].st_dev);
        }
      }

      else
      {
        int v79 = 1;
      }

      goto LABEL_187;
    }

    uint64_t v59 = (char *)malloc(v428[0].st_dev);
    if (!v59)
    {
      if (dword_100058FD8)
      {
        int v112 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003E66C(&v414, v415);
        }
        *__error() = v112;
      }

      sub_1000218D4("malloc", v60, v61, v62, v63, v64, v65, v66, (char)v374);
      goto LABEL_186;
    }

    int v67 = v59;
    if (!sub_10001FC1C(v8, *(_DWORD *)(a1 + 224), v59, v58))
    {
      if (dword_100058FD8)
      {
        int v117 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003E698(&v412, v413);
        }
        *__error() = v117;
      }

      sub_100021980("io_read_buf");
      goto LABEL_185;
    }

    if (*(_DWORD *)a1 != 3 && !sub_100011C00(v67, v58, a1, v8))
    {
      if (dword_100058FD8)
      {
        int v154 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003E6F0(&v410, v411);
        }
        *__error() = v154;
      }

      sub_100021850("buf_copy");
LABEL_185:
      free(v67);
      goto LABEL_186;
    }

    *(int64x2_t *)(a1 + 184) = vaddq_s64(*(int64x2_t *)(a1 + 184), vdupq_n_s64(v58));
    *(void *)(v8 + 88) += v58;
    sub_100021744(3, "%s: received %zu B block", v68, v69, v70, v71, v72, v73, *(void *)(a1 + 80));
    uint64_t v74 = v67;
    do
    {
      unint64_t v75 = v58;
      int v76 = v74;
      if (v75 >= 0xFFFFFFFF) {
        uint64_t v77 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v77 = v75;
      }
      CC_MD4_Update((CC_MD4_CTX *)(a1 + 88), v74, v77);
      uint64_t v74 = &v76[v77];
      size_t v58 = v75 - v77;
    }

    while (v75 != v77);
    free(v67);
    int v78 = sub_10001EC7C(v8, *(_DWORD *)(a1 + 224));
    if ((v78 & 0x80000000) == 0)
    {
      if (v78) {
        int v79 = 3;
      }
      else {
        int v79 = 2;
      }
      goto LABEL_187;
    }

    if (dword_100058FD8)
    {
      int v129 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003E6C4(&v408, v409);
      }
      *__error() = v129;
    }

    sub_100021980("io_read_check");
LABEL_186:
    int v79 = 0;
LABEL_187:
    int v120 = v79;
  }

  while (v120 == 3);
  if (v120 == 2) {
    return 1LL;
  }
  if (v120 != 1) {
    goto LABEL_355;
  }
  if (*(_DWORD *)(*(void *)v8 + 36LL)) {
    BOOL v171 = 0;
  }
  else {
    BOOL v171 = *(_DWORD *)a1 == 2;
  }
  int v172 = *(_DWORD *)a1;
  if (v171)
  {
    if (sub_100011C00(0LL, 0LL, a1, v8))
    {
      int v172 = *(_DWORD *)a1;
      goto LABEL_242;
    }

    if (dword_100058FD8)
    {
      int v250 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003E0D0();
      }
      *__error() = v250;
    }

    sub_100021850("buf_copy");
    goto LABEL_355;
  }

      sub_100021850("buf_copy");
      return 0LL;
    }

    if (lseek(*(_DWORD *)(a2 + 76), v7, 1) == -1)
    {
      if (dword_100058FD8)
      {
        uint64_t v18 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003DE50();
        }
        *__error() = v18;
      }

      sub_100021980("lseek");
      return 0LL;
    }
  }

  else
  {
    if (qword_100058F00 && qword_100058F08) {
      sub_10003ED7C();
    }
    if (qword_100058F00) {
      qword_100058F08 = qword_100058F00;
    }
    if (sigsetjmp(dword_100058F10, 0) >= 1)
    {
      qword_100058F00 = qword_100058F08;
      qword_100058F08 = 0LL;
      if (!dword_100058FD8)
      {
LABEL_35:
        sub_100021AB0( "%s: file truncated while reading",  *(const char **)(*(void *)(a2 + 200) + 152LL * *(void *)(a2 + 8)));
        *(_DWORD *)a2 = 3;
        return 2LL;
      }

      uint64_t v22 = *__error();
      uint64_t v23 = (os_log_s *)qword_100058FE8;
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
LABEL_34:
        *__error() = v22;
        goto LABEL_35;
      }

      uint64_t v24 = *(void *)(*(void *)(a2 + 200) + 152LL * *(void *)(a2 + 8));
      *(_DWORD *)stat buf = 136315138;
      uint64_t v40 = v24;
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s: file truncated while reading", buf, 0xCu);
      goto LABEL_34;
    }

    qword_100058F00 = *(void *)(a2 + 64);
    uint64_t v25 = sub_100011C00(v10, v7, a2, (uint64_t)a1);
    uint64_t v27 = *(void *)(a2 + 64);
    if (!(_DWORD)v25)
    {
      if (qword_100058F00 != v27) {
        sub_10003C4D8(v25, v26, v12);
      }
      qword_100058F00 = qword_100058F08;
      qword_100058F08 = 0LL;
      if (!dword_100058FD8) {
        goto LABEL_80;
      }
      uint64_t v30 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      goto LABEL_78;
    }

    if (qword_100058F00 != v27) {
      sub_10003C4D8(v25, v26, v12);
    }
    qword_100058F00 = qword_100058F08;
    qword_100058F08 = 0LL;
  }

  uint64_t v28 = *a1;
  if (!*(_DWORD *)(*a1 + 36LL))
  {
    if (sub_100011C00(0LL, 0LL, a2, (uint64_t)a1))
    {
      uint64_t v28 = *a1;
      goto LABEL_44;
    }

    if (dword_100058FD8)
    {
      uint64_t v30 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_78;
      }
      goto LABEL_79;
    }

    goto LABEL_80;
  }

  __int16 v48 = *(void *)(v20 + 24);
  if (!v48)
  {
    uint64_t v47 = 0;
    if (!v29) {
      goto LABEL_82;
    }
LABEL_88:
    if (v27)
    {
      if (v47 != 1)
      {
        sub_10002731C(v20, *(char **)(v20 + 32), (size_t)v27);
        goto LABEL_108;
      }

    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void *)(a1 + 24) + 1LL;
    *(void *)(a1 + 24) = v28;
    if (v28 <= v27)
    {
      uint64_t v30 = *(char **)(a1 + 8);
    }

    else
    {
      if (v27) {
        uint64_t v29 = 2 * v27;
      }
      else {
        uint64_t v29 = 16LL;
      }
      uint64_t v30 = sub_100007014(*(char **)(a1 + 8), v27, v29, 0x30uLL);
      if (!v30) {
        sub_100040AEC();
      }
      *(void *)(a1 + 8) = v30;
      *(void *)(a1 + 32) = v29;
      uint64_t v28 = *(void *)(a1 + 24);
      uint64_t v26 = v42;
    }

    unint64_t v31 = &v30[48 * v28];
    *((void *)v31 - 6) = 0LL;
    *((void *)v31 - 5) = v31 - 48;
    *((_DWORD *)v31 - 5) = v26;
    *((_DWORD *)v31 - 4) = v26;
    *((_DWORD *)v31 - 6) = v14;
    if ((v14 & 0xFFFFFFFE) == 4)
    {
      *((_DWORD *)v31 - 4) = v26 & 0x1F80;
      goto LABEL_91;
    }

    if (v14 != 3)
    {
LABEL_91:
      if (v14 == 4)
      {
        *((void *)v31 - 4) = v23;
        break;
      }

      goto LABEL_93;
    }

    *(void *)(a1 + 16) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(48 * v28 - 48) >> 4);
LABEL_93:
    if (*v23 == 47)
    {
      ++v23;
      *(v31 - 10) = 1;
    }

    uint64_t v32 = strlen(v23);
    if (v32 >= 2)
    {
      uint64_t v33 = v32;
      if (v23[v32 - 1] == 47)
      {
        *(v31 - 7) = 1;
        v23[v32 - 1] = 0;
      }
LABEL_242:
  if (v172 == 3)
  {
    *(void *)(a1 + 240) = 0LL;
  }

  else if (*(void *)(a1 + 240))
  {
    sub_10003E618();
  }

  CC_MD4_Final((unsigned __int8 *)md, (CC_MD4_CTX *)(a1 + 88));
  if (!sub_10001FC1C(v8, *(_DWORD *)(a1 + 224), (char *)v429, 0x10uLL))
  {
    if (dword_100058FD8)
    {
      int v228 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003E100();
      }
      *__error() = v228;
    }

    sub_100021980("io_read_buf");
    goto LABEL_355;
  }

  if (v429[0] == md[0] && v429[1] == md[1])
  {
    uint64_t v245 = v22 + 152 * v379;
    int v247 = *(_DWORD *)(v245 + 112);
    v246 = (unsigned int *)(v245 + 112);
    unsigned int v203 = v247 & 0xFFFFFFFC | 1;
    unsigned int *v246 = v203;
    uint64_t v248 = *(void *)(v8 + 80);
    ++*(void *)(v8 + 72);
    *(void *)(v8 + 80) = v248 + *((void *)v246 - 9);
    if (*(_DWORD *)(*(void *)v8 + 36LL))
    {
LABEL_348:
      sub_10000DF00(v8, a1, (v203 >> 1) & 1);
      return 1LL;
    }

    if (*(_DWORD *)(*(void *)v8 + 152LL))
    {
      if (fstatat(*(_DWORD *)(a1 + 216), *v23, &buf, 0) == -1)
      {
        if (*__error() != 2)
        {
          if (dword_100058FD8)
          {
            int v305 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003E390();
            }
            *__error() = v305;
          }

          v374 = *v23;
          v230 = "%s: stat during --backup";
          goto LABEL_368;
        }
      }

      else if (*(void *)(*(void *)v8 + 160LL))
      {
        if (dword_100058FD8)
        {
          int v266 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG)) {
            sub_10003E5B4();
          }
          *__error() = v266;
        }

        sub_100021744(2, "%s: doing backup-dir to %s", v260, v261, v262, v263, v264, v265, (char)*v23);
        uint64_t v267 = (uint64_t)(*v23 - 2);
        v268 = *v23;
        do
        {
          v269 = v268;
          uint64_t v270 = v267;
          int v271 = strncmp(v268, "./", 2uLL);
          v268 = v269 + 2;
          uint64_t v267 = v270 + 2;
        }

        while (!v271);
        if (snprintf( (char *)v428,  0x400uLL,  "%s/%s%s",  *(const char **)(*(void *)v8 + 160LL),  v269,  *(const char **)(*(void *)v8 + 168LL)) >= 1025)
        {
          if (dword_100058FD8)
          {
            int v272 = *__error();
            v273 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
            {
              v371 = *v23;
              uint64_t v373 = *(void *)(*(void *)v8 + 160LL);
              uint64_t v372 = *(void *)(*(void *)v8 + 168LL);
              *(_DWORD *)v418 = 136316162;
              v419 = v371;
              __int16 v420 = 2080;
              uint64_t v421 = v373;
              __int16 v422 = 2080;
              uint64_t v423 = v270 + 2;
              __int16 v424 = 2080;
              uint64_t v425 = v372;
              __int16 v426 = 1024;
              int v427 = 1024;
              _os_log_error_impl( (void *)&_mh_execute_header,  v273,  OS_LOG_TYPE_ERROR,  "%s: backup-dir: compound backup path too long: %s/%s%s > %d",  v418,  0x30u);
            }

            *__error() = v272;
          }

          v374 = *v23;
          v230 = "%s: backup-dir: compound backup path too long: %s/%s%s > %d";
          goto LABEL_368;
        }

        if (sub_10000D0FC(v8, *(_DWORD *)(a1 + 216), v23, (const char *)v428, buf.st_mode) == -1)
        {
          if (dword_100058FD8)
          {
            int v312 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003E54C();
            }
            *__error() = v312;
          }

          v374 = *v23;
          v230 = "%s: backup_to_dir: %s";
          goto LABEL_368;
        }
      }

      else if ((buf.st_mode & 0xF000) != 0x4000)
      {
        if (dword_100058FD8)
        {
          int v310 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG)) {
            sub_10003E4EC();
          }
          *__error() = v310;
        }

        sub_100021744(2, "%s: doing backup", v260, v261, v262, v263, v264, v265, (char)*v23);
        if (snprintf((char *)v428, 0x400uLL, "%s%s", *v23, *(const char **)(*(void *)v8 + 168LL)) >= 1025)
        {
          if (dword_100058FD8)
          {
            int v311 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003E3F0();
            }
            *__error() = v311;
          }

          v374 = *v23;
          v230 = "%s: backup: compound backup path too long: %s%s > %d";
          goto LABEL_368;
        }

        if (sub_10000D754(*(_DWORD *)(a1 + 216), *v23, *(_DWORD *)(a1 + 216), (const char *)v428, 1) == -1)
        {
          if (dword_100058FD8)
          {
            int v370 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003E484();
            }
            *__error() = v370;
            uint64_t v8 = v378;
          }

          v374 = *v23;
          v230 = "%s: move_file: %s";
          goto LABEL_368;
        }
      }
    }

    if (!sub_100028484( v8,  *(_DWORD *)(a1 + 72) == -1,  *(_DWORD *)(a1 + 76),  (uint64_t *)v23,  *(void *)(a1 + 80)))
    {
      if (dword_100058FD8)
      {
        int v317 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003E130();
        }
        *__error() = v317;
      }

      sub_100021980("rsync_set_metadata");
      goto LABEL_355;
    }

    if (*(_DWORD *)(v8 + 164)) {
      sub_100021D28((void *)v8, (uint64_t)v23, 1);
    }
    if (!*(_DWORD *)(*(void *)v8 + 196LL))
    {
      v318 = (char *)*v23;
      if (*(_DWORD *)(*(void *)v8 + 200LL)) {
        v319 = (const char **)sub_100028E10((uint64_t)v23, v382);
      }
      else {
        v319 = 0LL;
      }
      goto LABEL_579;
    }

    if (*v383)
    {
      int v314 = *((_DWORD *)v383 + 6);
      if (v314 >= 1)
      {
        uint64_t v315 = *v383 + 32LL * (v314 - 1);
        v316 = (void *)*v383;
LABEL_541:
        *((_DWORD *)v383 + 6) = v314 + 1;
        v328 = *v23;
        v329 = strrchr(*v23, 47);
        if (v329) {
          v330 = v329 + 1;
        }
        else {
          v330 = (char *)v328;
        }
        int v331 = (_DWORD)v330 - (_DWORD)v328;
        if (v330 != v328 && *(v330 - 1) != 47) {
          sub_10003E368();
        }
        if (snprintf((char *)v428, 0x400uLL, "%.*s.~tmp~", v331, v328) >= 1025)
        {
          if (dword_100058FD8)
          {
            int v332 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003E1F0();
            }
            *__error() = v332;
          }

          v374 = *v23;
          v230 = "%s: delayed-update: compound path too long: %.*s.~tmp~ > %d";
          goto LABEL_368;
        }

        if (v315 && (v333 = *(const char **)(v315 + 24), !strcmp((const char *)v428, v333)))
        {
          v316[4 * v314 + 3] = v333;
          *(void *)(v315 + 24) = 0LL;
        }

        else
        {
          v334 = strdup((const char *)v428);
          v335 = (char *)&v316[4 * v314];
          *((void *)v335 + 3) = v334;
          v336 = (void **)(v335 + 24);
          if (!v334)
          {
            if (dword_100058FD8)
            {
              int v346 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                goto LABEL_608;
              }
              goto LABEL_609;
            }

LABEL_610:
            v230 = "strdup";
            goto LABEL_368;
          }

          if (sub_100027830(*(_DWORD *)(a1 + 216), v334, 0x1C0u) == -1 && *__error() != 17)
          {
            if (dword_100058FD8)
            {
              int v344 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003E308();
              }
              *__error() = v344;
              uint64_t v8 = v378;
            }

            sub_1000218D4("mkpathat '%s'", v337, v338, v339, v340, v341, v342, v343, (char)*v336);
            free(*v336);
            *v336 = 0LL;
            goto LABEL_469;
          }
        }

        v318 = (char *)v428;
        if (snprintf((char *)v428, 0x400uLL, "%s/%s", (const char *)v316[4 * v314 + 3], &(*v23)[v331]) >= 1025)
        {
          if (dword_100058FD8)
          {
            int v347 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003E284();
            }
            *__error() = v347;
          }

          v374 = *v23;
          v230 = "%s: delayed-update: compound path too long: .~tmp~/%s > %d";
          goto LABEL_368;
        }

        v319 = 0LL;
LABEL_579:
        uint64_t v348 = *(void *)v8;
        if (!*(_DWORD *)(*(void *)v8 + 40LL) && !*(_DWORD *)(v348 + 12))
        {
          BOOL v171 = *(void *)(v348 + 544) == 0LL;
          uint64_t v349 = 220LL;
          if (v171) {
            uint64_t v349 = 216LL;
          }
          int v350 = *(_DWORD *)(a1 + v349);
          int v351 = *(int *)(v22 + 152 * v379 + 8) >= 0 ? *(_DWORD *)(v22 + 152 * v379 + 8) : v350;
          if (!sub_100004BF4( v8,  (uint64_t)v23,  v351,  *(const char **)(a1 + 80),  *(_DWORD *)(a1 + 216),  v318,  v318 == *v23)) {
            goto LABEL_469;
          }
        }

        if (!*(_DWORD *)(*(void *)v8 + 196LL))
        {
          *v246 |= 4u;
          if (v319)
          {
            if (unlinkat(*(_DWORD *)(a1 + 216), *v23, 0) == -1 && *__error() != 2)
            {
              if (dword_100058FD8)
              {
                int v356 = *__error();
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                  sub_10003E190();
                }
                *__error() = v356;
              }

              sub_100021980("unlink");
              uint64_t v8 = v378;
            }

            if (linkat(*(_DWORD *)(a1 + 216), *v319, *(_DWORD *)(a1 + 216), *v23, 0) == -1)
            {
              sub_100021744(-1, "While hard linking '%s' to '%s' ", v357, v358, v359, v360, v361, v362, (char)*v319);
              if (dword_100058FD8)
              {
                int v363 = *__error();
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                  sub_10003E160();
                }
                *__error() = v363;
                uint64_t v8 = v378;
              }

              sub_100021980("linkat");
            }
          }

          goto LABEL_605;
        }

        uint64_t v352 = *v383;
        uint64_t v353 = *((int *)v383 + 6) - 1LL;
        v354 = strdup(v318);
        *(void *)(v352 + 32 * v353) = v354;
        if (v354)
        {
          uint64_t v355 = v352 + 32 * v353;
          *(void *)(v355 + 16) = v23;
          *(void *)(v355 + 8) = *v23;
LABEL_605:
          unint64_t v364 = *(void *)(*(void *)(a1 + 200) + 152LL * *(void *)(a1 + 8) + 40);
          sub_1000119C4(v8, v364, v364, 1);
          sub_100011EF8(v8, a1, (uint64_t *)v23, v365, v366, v367, v368, v369);
          unsigned int v203 = *v246;
          goto LABEL_348;
        }

        if (dword_100058FD8)
        {
          int v346 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_608:
          }
            sub_10003DDF8();
LABEL_609:
          *__error() = v346;
          goto LABEL_610;
        }

        goto LABEL_610;
      }

      v316 = (void *)*v383;
    }

    else
    {
      v320 = calloc(__count, 0x20uLL);
      uint64_t *v383 = (uint64_t)v320;
      if (!v320)
      {
        if (dword_100058FD8)
        {
          int v345 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003E1C0();
          }
          *__error() = v345;
        }

        sub_1000218D4("malloc dlrenamer entries", v321, v322, v323, v324, v325, v326, v327, (char)v374);
        goto LABEL_355;
      }

      *((_DWORD *)v383 + 6) = 0;
      int v314 = 0;
      v316 = v320;
    }

    uint64_t v315 = 0LL;
    goto LABEL_541;
  }

  if (dword_100058FD8)
  {
    int v194 = *__error();
    v195 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
    {
      uint64_t v196 = *(void *)(a1 + 80);
      if ((*(_DWORD *)(v22 + 152 * v379 + 112) & 2) != 0) {
        v197 = "will not";
      }
      else {
        v197 = "will";
      }
      v428[0].__int16 st_dev = 136315394;
      *(void *)&v428[0].st_mode = v196;
      WORD2(v428[0].st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v428[0].st_ino + 6) = (__darwin_ino64_t)v197;
      _os_log_impl( (void *)&_mh_execute_header,  v195,  OS_LOG_TYPE_INFO,  "%s: hash does not match, %s redo",  (uint8_t *)v428,  0x16u);
    }

    *__error() = v194;
  }

  uint64_t v198 = v22 + 152 * v379;
  int v200 = *(_DWORD *)(v198 + 112);
  v199 = (int *)(v198 + 112);
  if ((v200 & 2) != 0) {
    v201 = "will not";
  }
  else {
    v201 = "will";
  }
  sub_100021AB0("%s: hash does not match, %s redo", *(const char **)(a1 + 80), v201);
  int v202 = *v199;
  if ((*v199 & 2) == 0)
  {
    unsigned int v203 = v202 | 2;
    int *v199 = v203;
    ++*(void *)(a1 + 256);
    goto LABEL_348;
  }

  int *v199 = v202 | 8;
LABEL_469:
  *((_DWORD *)v23 + 28) |= 8u;
LABEL_470:
  sub_10000DF00(v8, a1, 1);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000116F8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (qword_100058F00 != result) {
    sub_10003C4D8(result, a2, a3);
  }
  qword_100058F00 = qword_100058F08;
  qword_100058F08 = 0LL;
  return result;
}

uint64_t sub_100011734(uint64_t *a1, const char *a2, int a3, uint64_t a4)
{
  uint64_t v8 = *a1;
  if (*(_DWORD *)(*a1 + 92))
  {
    uid_t v9 = -1;
  }

  else
  {
    uid_t v10 = geteuid();
    if (*(_DWORD *)(a4 + 16)) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      uid_t v9 = *(_DWORD *)(a4 + 16);
    }
    else {
      uid_t v9 = -1;
    }
    uint64_t v8 = *a1;
  }

  if (*(_DWORD *)(v8 + 88))
  {
    gid_t v12 = -1;
  }

  else if (getegid() == *(_DWORD *)(a4 + 20))
  {
    gid_t v12 = -1;
  }

  else
  {
    gid_t v12 = *(_DWORD *)(a4 + 20);
  }

  __int16 v13 = *(_WORD *)(a4 + 4);
  if ((v12 & v9) != 0xFFFFFFFF && fchown(a3, v9, v12) == -1)
  {
    if (*__error() != 1)
    {
      if (!dword_100058FD8)
      {
        uint64_t v25 = "%s: fchown";
        goto LABEL_38;
      }

      int v24 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003EA2C();
      }
      uint64_t v25 = "%s: fchown";
      goto LABEL_35;
    }

    if (!geteuid())
    {
      if (dword_100058FD8)
      {
        int v22 = *__error();
        uint64_t v23 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 136315650;
          uint64_t v27 = a2;
          __int16 v28 = 1024;
          uid_t v29 = v9;
          __int16 v30 = 1024;
          gid_t v31 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s: identity unknown or not available to user.group: %u.%u",  buf,  0x18u);
        }

        *__error() = v22;
      }

      sub_100021AB0("%s: identity unknown or not available to user.group: %u.%u", a2, v9, v12);
    }
  }

  if (*(_DWORD *)(*a1 + 60) || fchmod(a3, v13 & 0xFFF) != -1) {
    return 1LL;
  }
  if (!dword_100058FD8)
  {
    uint64_t v25 = "%s: fchmod";
    goto LABEL_38;
  }

  int v24 = *__error();
  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
    sub_10003E9CC();
  }
  uint64_t v25 = "%s: fchmod";
LABEL_35:
  *__error() = v24;
LABEL_38:
  sub_1000218D4(v25, v14, v15, v16, v17, v18, v19, v20, (char)a2);
  return 0LL;
}

uint64_t sub_1000119C4(uint64_t result, unint64_t a2, unint64_t a3, int a4)
{
  if (*(_DWORD *)(*(void *)result + 136LL))
  {
    uint64_t v7 = result;
    uint64_t result = gettimeofday(&v12, 0LL);
    double v8 = (double)v12.tv_usec / 1000000.0 + (double)v12.tv_sec;
    double v9 = *(double *)(v7 + 152);
    if (v9 == 0.0)
    {
LABEL_16:
      *(double *)(v7 + 152) = v8;
      return result;
    }

    if (v8 - v9 >= 0.1 || a4 != 0)
    {
      fprintf(__stderrp, " %14llu", a3);
      fprintf(__stderrp, " %3.0f%%", (double)a3 / (double)a2 * 100.0);
      double v11 = (double)a3 / (v8 - *(double *)(v7 + 152));
      if (v11 <= 1073741820.0)
      {
        if (v11 <= 1048576.0)
        {
          if (v11 > 1024.0) {
            fprintf(__stderrp, " %7.2fKB/s");
          }
        }

        else
        {
          fprintf(__stderrp, " %7.2fMB/s");
        }
      }

      else
      {
        fprintf(__stderrp, " %7.2fGB/s");
      }

      fprintf( __stderrp,  "   %02d:%02d:%02d",  (int)((double)(a2 - a3) / v11) / 3600,  (int)((double)(a2 - a3) / v11) % 3600 / 60,  (int)((double)(a2 - a3) / v11) % 60);
      if (a4) {
        uint64_t result = fprintf(__stderrp, "\n");
      }
      else {
        uint64_t result = fprintf(__stderrp, "\r");
      }
      goto LABEL_16;
    }
  }

  return result;
}

uint64_t sub_100011C00(char *__buf, size_t __nbyte, uint64_t a3, uint64_t a4)
{
  size_t v5 = *(void *)(a3 + 240);
  size_t v6 = *(void *)(a3 + 248);
  if (v6 < v5) {
    sub_10003EA8C();
  }
  size_t v8 = __nbyte;
  double v9 = __buf;
  if (__nbyte)
  {
    size_t v10 = v6 - v5;
    if (v6 > v5)
    {
      uint64_t v11 = *(void *)(a3 + 232);
      if (!v11) {
        sub_10003EC4C();
      }
      if (v10 >= __nbyte) {
        size_t v12 = __nbyte;
      }
      else {
        size_t v12 = v10;
      }
      memcpy((void *)(v11 + v5), __buf, v12);
      size_t v6 = *(void *)(a3 + 248);
      size_t v5 = *(void *)(a3 + 240) + v12;
      *(void *)(a3 + 240) = v5;
      if (v5 > v6) {
        sub_10003EC74();
      }
      v8 -= v12;
      if (!v8) {
        return 1LL;
      }
      v9 += v12;
    }
  }

  if (!v5)
  {
LABEL_27:
    if (!v8) {
      return 1LL;
    }
    ssize_t v30 = write(*(_DWORD *)(a3 + 76), v9, v8);
    if ((v30 & 0x8000000000000000LL) == 0)
    {
      if (v30 == v8) {
        return 1LL;
      }
      if (!dword_100058FD8) {
        goto LABEL_46;
      }
      int v33 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }

    if (dword_100058FD8)
    {
      int v32 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      goto LABEL_37;
    }

    goto LABEL_38;
  }

  if (!v6) {
    sub_10003EB74();
  }
  if (v5 > v6) {
    sub_10003EB9C();
  }
  __int16 v13 = *(const void **)(a3 + 232);
  if (!v13) {
    sub_10003EBC4();
  }
  if (*(_DWORD *)(*(void *)a4 + 144LL))
  {
    if (sub_10000CB74(*(_BYTE **)(a3 + 232), v5))
    {
      if (lseek(*(_DWORD *)(a3 + 76), *(void *)(a3 + 240), 1) == -1)
      {
        if (dword_100058FD8)
        {
          int v21 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003EBEC();
          }
          *__error() = v21;
        }

        sub_1000218D4("%s: lseek", v14, v15, v16, v17, v18, v19, v20, *(void *)(a3 + 80));
        return 0LL;
      }

LABEL_26:
      *(void *)(a3 + 240) = 0LL;
      goto LABEL_27;
    }

    __int16 v13 = *(const void **)(a3 + 232);
    size_t v5 = *(void *)(a3 + 240);
  }

  ssize_t v22 = write(*(_DWORD *)(a3 + 76), v13, v5);
  if ((v22 & 0x8000000000000000LL) == 0)
  {
    if (v22 != *(void *)(a3 + 240))
    {
      if (!dword_100058FD8)
      {
LABEL_46:
        sub_100021850("%s: short write", *(const char **)(a3 + 80));
        return 0LL;
      }

      int v33 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
      {
LABEL_45:
        *__error() = v33;
        goto LABEL_46;
      }

LABEL_44:
      sub_10003EB14();
      goto LABEL_45;
    }

    goto LABEL_26;
  }

  if (dword_100058FD8)
  {
    int v32 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_36:
    }
      sub_10003EAB4();
LABEL_37:
    *__error() = v32;
  }

  if (*(_DWORD *)(v28 + 552))
  {
    if (!sub_10001292C(a2, a3))
    {
      if (dword_100058FD8)
      {
        gid_t v31 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003EDFC();
        }
        *__error() = v31;
      }

      sub_100021980("protocol_token_ff_compress");
      return 0LL;
    }

    if (*(_DWORD *)a2 == 3) {
      return 2LL;
    }
  }

  *(void *)(a2 + 192) += v7;
  a1[12] += v7;
  sub_100021744(3, "%s: copied %zu B", v12, v13, v14, v15, v16, v17, *(void *)(a2 + 80));
  if (qword_100058F00 && qword_100058F08) {
    sub_10003EDA4();
  }
  if (qword_100058F00) {
    qword_100058F08 = qword_100058F00;
  }
  if (sigsetjmp(dword_100058F10, 0) >= 1)
  {
    qword_100058F00 = qword_100058F08;
    qword_100058F08 = 0LL;
    if (!dword_100058FD8) {
      goto LABEL_35;
    }
    ssize_t v22 = *__error();
    uint64_t v23 = (os_log_s *)qword_100058FE8;
    if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO)) {
      goto LABEL_34;
    }
    uint64_t v29 = *(void *)(*(void *)(a2 + 200) + 152LL * *(void *)(a2 + 8));
    *(_DWORD *)stat buf = 136315138;
    uint64_t v40 = v29;
    goto LABEL_33;
  }

  qword_100058F00 = *(void *)(a2 + 64);
  do
  {
    if (v7 >= 0xFFFFFFFF) {
      int v32 = 0xFFFFFFFFLL;
    }
    else {
      int v32 = v7;
    }
    int v33 = CC_MD4_Update((CC_MD4_CTX *)(a2 + 88), v10, v32);
    v10 += v32;
    v7 -= v32;
  }

  while (v7);
  if (qword_100058F00 != *(void *)(a2 + 64)) {
    sub_10003C4D8(v33, v34, v35);
  }
  qword_100058F00 = qword_100058F08;
  qword_100058F08 = 0LL;
  if ((sub_10001EC7C((uint64_t)a1, *(_DWORD *)(a2 + 224)) & 0x80000000) != 0)
  {
    if (dword_100058FD8)
    {
      uint64_t v38 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003EDCC();
      }
      *__error() = v38;
    }

    sub_100021980("io_read_check");
    return 0LL;
  }

  return 3LL;
}

LABEL_38:
  sub_1000218D4("%s: write", v23, v24, v25, v26, v27, v28, v29, *(void *)(a3 + 80));
  return 0LL;
}

void sub_100011EF8( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_DWORD *)(*(void *)a1 + 4LL))
  {
    uint64_t v9 = *(void *)(a2 + 192);
    float v10 = (float)v9;
    if (v9)
    {
      double v11 = (double)v9;
      float v12 = (double)*(uint64_t *)(a2 + 184) * 100.0 / (double)v9;
      double v13 = v12;
      if (v9 < 1073741825)
      {
        if (v9 <= 0x100000)
        {
          if (v9 < 1025)
          {
            int v14 = 0;
            uint64_t v15 = "B";
          }

          else
          {
            float v10 = v11 * 0.0009765625;
            int v14 = 1;
            uint64_t v15 = "KB";
          }
        }

        else
        {
          float v10 = v11 * 0.000000953674316;
          int v14 = 2;
          uint64_t v15 = "MB";
        }
      }

      else
      {
        float v10 = v11 * 9.31322575e-10;
        int v14 = 3;
        uint64_t v15 = "GB";
      }
    }

    else
    {
      int v14 = 0;
      uint64_t v15 = "B";
      double v13 = 100.0;
    }

    if (dword_100058FD8)
    {
      int v16 = *__error();
      uint64_t v17 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *a3;
        *(_DWORD *)stat buf = 136316162;
        uint64_t v20 = v18;
        __int16 v21 = 1024;
        int v22 = v14;
        __int16 v23 = 2048;
        double v24 = v10;
        __int16 v25 = 2080;
        uint64_t v26 = v15;
        __int16 v27 = 2048;
        double v28 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s (%.*f %s, %.1f%% downloaded)",  buf,  0x30u);
      }

      *__error() = v16;
    }

    sub_100021744(0, "%s (%.*f %s, %.1f%% downloaded)", (uint64_t)a3, a4, a5, a6, a7, a8, *a3);
  }

uint64_t sub_10001210C()
{
  if (dword_100058760)
  {
    uint64_t v0 = 1LL;
    if (dword_100058760 >= 4)
    {
      qword_100058768 = 0LL;
      dword_100058770 = 0;
      qword_100058780 = 0LL;
      dword_100058788 = 0;
      sub_10001BF78(&qword_100058768);
      sub_100021744(3, "decompress_state transition %d -> %d", v1, v2, v3, v4, v5, v6, dword_100058760);
      dword_100058760 = 1;
    }
  }

  else
  {
    qword_100058768 = 0LL;
    dword_100058770 = 0;
    qword_100058780 = 0LL;
    dword_100058788 = 0;
    qword_1000587A8 = 0LL;
    unk_1000587B0 = 0LL;
    int v7 = sub_10001BFE0(&qword_100058768, -15, "1.2.3", 112);
    if (v7)
    {
      int v14 = v7;
      if (dword_100058FD8)
      {
        int v15 = *__error();
        int v16 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003EC9C(v14, v16, v17);
        }
        *__error() = v15;
      }

      sub_100021850("inflateInit2 res=%d", v14);
      return 0LL;
    }

    else
    {
      uint64_t v0 = 1LL;
      sub_100021744(3, "decompress_state transition %d -> %d", v8, v9, v10, v11, v12, v13, dword_100058760);
      dword_100058760 = 1;
    }
  }

  return v0;
}

uint64_t sub_100012248(void *a1, uint64_t a2, unint64_t a3)
{
  if (*(_DWORD *)a2 == 3) {
    sub_10003ED04();
  }
  unint64_t v5 = *(void *)(a2 + 56);
  if (v5 <= a3)
  {
    if (dword_100058FD8)
    {
      int v19 = *__error();
      uint64_t v20 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *(void *)(a2 + 80);
        uint64_t v37 = *(void *)(a2 + 56);
        *(_DWORD *)stat buf = 136315650;
        uint64_t v40 = v36;
        __int16 v41 = 2048;
        unint64_t v42 = a3;
        __int16 v43 = 2048;
        uint64_t v44 = v37;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: token not in block set: %zu (have %zu blocks)",  buf,  0x20u);
      }

      *__error() = v19;
    }

    sub_100021850("%s: token not in block set: %zu (have %zu blocks)");
    return 0LL;
  }

  if (v5 - 1 != a3 || (size_t v7 = *(void *)(a2 + 24)) == 0)
  {
    size_t v7 = *(void *)(a2 + 32);
    if (!v7) {
      sub_10003ED2C();
    }
  }

  uint64_t v8 = *(void **)(a2 + 64);
  if (!v8) {
    sub_10003ED54();
  }
  uint64_t v9 = *(void *)(a2 + 32) * a3;
  uint64_t v10 = (char *)sub_100013094(v8, v9);
  uint64_t v11 = *a1;
  if ((*(_DWORD *)(*a1 + 40LL) || *(_DWORD *)(v11 + 12))
    && (*(_DWORD *)(a2 + 72) & 0x80000000) == 0
    && *(void *)(a2 + 192) == v9)
  {
    if (!*(_DWORD *)(v11 + 36) && !sub_100011C00(0LL, 0LL, a2, (uint64_t)a1))
    {
      if (dword_100058FD8)
      {
        int v30 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_78:
        }
          sub_10003E0D0();
LABEL_79:
        *__error() = v30;
      }

uint64_t sub_10001292C(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 56);
  if (v4 <= a2)
  {
    if (dword_100058FD8)
    {
      int v23 = *__error();
      uint64_t v24 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *(void *)(a1 + 80);
        uint64_t v37 = *(void *)(a1 + 56);
        *(_DWORD *)stat buf = 136315650;
        uint64_t v43 = v36;
        __int16 v44 = 2048;
        unint64_t v45 = a2;
        __int16 v46 = 2048;
        uint64_t v47 = v37;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: token not in block set: %zu (have %zu blocks)",  buf,  0x20u);
      }

      *__error() = v23;
    }

    sub_100021850("%s: token not in block set: %zu (have %zu blocks)");
    return 0LL;
  }

  if (v4 - 1 != a2 || (unint64_t v5 = *(void *)(a1 + 24)) == 0)
  {
    unint64_t v5 = *(void *)(a1 + 32);
    if (!v5) {
      sub_10003EE2C();
    }
  }

  uint64_t v6 = *(void **)(a1 + 64);
  if (!v6) {
    sub_10003EE54();
  }
  size_t v7 = sub_100013094(v6, *(void *)(a1 + 32) * a2);
  if (!sub_10001210C())
  {
    if (dword_100058FD8)
    {
      int v25 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003EE7C();
      }
      *__error() = v25;
    }

    sub_100021850("decompress_reinit");
    return 0LL;
  }

  uint64_t v8 = malloc(0x8030uLL);
  if (!v8)
  {
    if (dword_100058FD8)
    {
      int v27 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003DB4C();
      }
      *__error() = v27;
    }

    sub_100021980("malloc");
    return 0LL;
  }

  uint64_t v38 = (uint64_t)v7;
  uint64_t v9 = v8;
  dword_100058770 = 0;
  char v39 = 0;
  unint64_t v10 = v5;
  uint64_t v11 = 0LL;
LABEL_10:
  if (v11)
  {
    uint64_t v12 = 0LL;
    qword_100058768 = v38;
    dword_100058770 = v11;
    unint64_t v13 = v10 - v11;
  }

  else
  {
    if (v10 >= 0xFFFF) {
      uint64_t v12 = 0xFFFFLL;
    }
    else {
      uint64_t v12 = v10;
    }
    __int16 v40 = v12;
    __int16 v41 = ~(_WORD)v12;
    qword_100058768 = (uint64_t)&v39;
    dword_100058770 = 5;
    unint64_t v13 = v10;
  }

  while (1)
  {
    qword_100058780 = (uint64_t)v9;
    dword_100058788 = 32816;
    if (qword_100058F00) {
      BOOL v14 = qword_100058F08 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14) {
      sub_10003EEAC();
    }
    if (qword_100058F00) {
      qword_100058F08 = qword_100058F00;
    }
    if (sigsetjmp(dword_100058F10, 0) >= 1)
    {
      qword_100058F00 = qword_100058F08;
      qword_100058F08 = 0LL;
      if (dword_100058FD8)
      {
        int v28 = *__error();
        uint64_t v29 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = *(void *)(*(void *)(a1 + 200) + 152LL * *(void *)(a1 + 8));
          *(_DWORD *)stat buf = 136315138;
          uint64_t v43 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s: file truncated while reading",  buf,  0xCu);
        }

        *__error() = v28;
      }

      sub_100021AB0( "%s: file truncated while reading",  *(const char **)(*(void *)(a1 + 200) + 152LL * *(void *)(a1 + 8)));
      *(_DWORD *)a1 = 3;
      return 2LL;
    }

    qword_100058F00 = *(void *)(a1 + 64);
    uint64_t v19 = sub_10001C0D0((unsigned __int8 **)&qword_100058768, 2uLL, v15, v16, v17, v18);
    if (qword_100058F00 != *(void *)(a1 + 64)) {
      sub_10003C4D8(v19, v20, v21);
    }
    int v22 = v19;
    qword_100058F00 = qword_100058F08;
    qword_100058F08 = 0LL;
    if ((_DWORD)v19) {
      break;
    }
    if (!dword_100058788 || !v13)
    {
      free(v9);
      return 2LL;
    }

    unint64_t v10 = v13;
    uint64_t v11 = v12;
    if (!dword_100058770) {
      goto LABEL_10;
    }
  }

  if (dword_100058FD8)
  {
    int v31 = *__error();
    uint64_t v32 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003EF40(v22, v32, v33);
    }
    *__error() = v31;
  }

  sub_100021850("inflate ff res=%d", v22);
  uint64_t v34 = (const char *)qword_100058798;
  if (qword_100058798)
  {
    if (dword_100058FD8)
    {
      int v35 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003EED4();
      }
      *__error() = v35;
      uint64_t v34 = (const char *)qword_100058798;
    }

    sub_100021850("inflate error: %s", v34);
  }

  free(v9);
  return 0LL;
}

void sub_100012E84(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

_BYTE *sub_100012E90(_BYTE *result, _BYTE *a2)
{
  void *result = 0;
  *a2 = 0;
  return result;
}

void sub_100012EA0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100012EB8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

  ;
}

void sub_100012EDC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100012EE8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100012EFC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100012F0C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100012F18( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void *sub_100012F30(int a1, size_t a2, int a3)
{
  uint64_t v6 = malloc(0x10uLL);
  size_t v7 = v6;
  if (v6)
  {
    v6[1] = a2;
    uint64_t v8 = mmap(0LL, a2, a3, 1, a1, 0LL);
    *size_t v7 = v8;
    if (v8 == (void *)-1LL)
    {
      int v10 = *__error();
      free(v7);
      size_t v7 = 0LL;
      *__error() = v10;
    }

    else if (!dword_1000587D8++)
    {
      *(void *)&v12.sa_mask = 0x4000000000LL;
      v12.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_10001300C;
      sigaction(10, &v12, (sigaction *)&qword_1000587E0);
    }
  }

  return v7;
}

uint64_t sub_10001300C(uint64_t result, uint64_t a2)
{
  if ((_DWORD)result != 10) {
    sub_10003EFA8();
  }
  if (qword_100058F00)
  {
    unint64_t v2 = *(void *)(a2 + 24);
    if (v2 >= *(void *)qword_100058F00 && v2 < *(void *)qword_100058F00 + *(void *)(qword_100058F00 + 8)) {
      siglongjmp(dword_100058F10, 10);
    }
  }

  if (qword_1000587E0 != 1)
  {
    sigaction(10, (const sigaction *)&qword_1000587E0, 0LL);
    return raise(10);
  }

  return result;
}

void *sub_100013094(void *result, uint64_t a2)
{
  if (result) {
    return (void *)(*result + a2);
  }
  return result;
}

uint64_t sub_1000130A4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_1000130B0(uint64_t a1)
{
  if (a1)
  {
    if (qword_100058F00 == a1 || qword_100058F08 == a1) {
      sub_10003EFD0();
    }
    munmap(*(void **)a1, *(void *)(a1 + 8));
    free((void *)a1);
    if (!--dword_1000587D8) {
      sigaction(10, (const sigaction *)&qword_1000587E0, 0LL);
    }
  }

uint64_t sub_100013130(int a1, unsigned __int8 *a2, unsigned int a3)
{
  unint64_t v3 = HIWORD(a1);
  unint64_t v4 = (unsigned __int16)a1;
  if (a3 != 1)
  {
    if (!a2) {
      return 1LL;
    }
    if (a3 < 0x10)
    {
      for (; a3; --a3)
      {
        unsigned int v9 = *a2++;
        v4 += v9;
        v3 += v4;
      }

      if (v4 > 0xFFF0) {
        v4 -= 65521LL;
      }
      v3 %= 0xFFF1uLL;
      return v4 | (v3 << 16);
    }

    if (a3 >> 4 >= 0x15B)
    {
      do
      {
        a3 -= 5552;
        int v10 = -347;
        uint64_t v11 = a2;
        do
        {
          unint64_t v12 = v4 + *v11;
          uint64_t v13 = v12 + v3;
          unint64_t v14 = v12 + v11[1];
          uint64_t v15 = v13 + v14;
          unint64_t v16 = v14 + v11[2];
          uint64_t v17 = v15 + v16;
          unint64_t v18 = v16 + v11[3];
          uint64_t v19 = v17 + v18;
          unint64_t v20 = v18 + v11[4];
          uint64_t v21 = v19 + v20;
          unint64_t v22 = v20 + v11[5];
          uint64_t v23 = v21 + v22;
          unint64_t v24 = v22 + v11[6];
          uint64_t v25 = v23 + v24;
          unint64_t v26 = v24 + v11[7];
          uint64_t v27 = v25 + v26;
          unint64_t v28 = v26 + v11[8];
          uint64_t v29 = v27 + v28;
          uint64_t v30 = v28 + v11[9];
          uint64_t v31 = v29 + v30;
          uint64_t v32 = v30 + v11[10];
          uint64_t v33 = v31 + v32;
          uint64_t v34 = v32 + v11[11];
          uint64_t v35 = v33 + v34;
          uint64_t v36 = v34 + v11[12];
          uint64_t v37 = v35 + v36;
          uint64_t v38 = v36 + v11[13];
          uint64_t v39 = v37 + v38;
          uint64_t v40 = v38 + v11[14];
          uint64_t v41 = v39 + v40;
          unint64_t v4 = v40 + v11[15];
          unint64_t v3 = v41 + v4;
          v11 += 16;
        }

        while (!__CFADD__(v10++, 1));
        a2 += 5552;
        v4 %= 0xFFF1uLL;
        v3 %= 0xFFF1uLL;
      }

      while (a3 >> 4 > 0x15A);
      if (!a3) {
        return v4 | (v3 << 16);
      }
      if (a3 < 0x10) {
        goto LABEL_30;
      }
    }

    do
    {
      a3 -= 16;
      unint64_t v43 = v4 + *a2;
      uint64_t v44 = v43 + v3;
      unint64_t v45 = v43 + a2[1];
      uint64_t v46 = v44 + v45;
      unint64_t v47 = v45 + a2[2];
      uint64_t v48 = v46 + v47;
      unint64_t v49 = v47 + a2[3];
      uint64_t v50 = v48 + v49;
      unint64_t v51 = v49 + a2[4];
      uint64_t v52 = v50 + v51;
      unint64_t v53 = v51 + a2[5];
      uint64_t v54 = v52 + v53;
      unint64_t v55 = v53 + a2[6];
      uint64_t v56 = v54 + v55;
      unint64_t v57 = v55 + a2[7];
      uint64_t v58 = v56 + v57;
      unint64_t v59 = v57 + a2[8];
      uint64_t v60 = v58 + v59;
      uint64_t v61 = v59 + a2[9];
      uint64_t v62 = v60 + v61;
      uint64_t v63 = v61 + a2[10];
      uint64_t v64 = v62 + v63;
      uint64_t v65 = v63 + a2[11];
      uint64_t v66 = v64 + v65;
      uint64_t v67 = v65 + a2[12];
      uint64_t v68 = v66 + v67;
      uint64_t v69 = v67 + a2[13];
      uint64_t v70 = v68 + v69;
      uint64_t v71 = v69 + a2[14];
      uint64_t v72 = v70 + v71;
      unint64_t v4 = v71 + a2[15];
      unint64_t v3 = v72 + v4;
      a2 += 16;
    }

    while (a3 > 0xF);
    if (a3)
    {
LABEL_30:
      do
      {
        unsigned int v73 = *a2++;
        v4 += v73;
        v3 += v4;
        --a3;
      }

      while (a3);
    }

    v4 %= 0xFFF1uLL;
    v3 %= 0xFFF1uLL;
    return v4 | (v3 << 16);
  }

  unint64_t v5 = (unsigned __int16)a1 + (unint64_t)*a2;
  if (v5 > 0xFFF0) {
    v5 -= 65521LL;
  }
  unint64_t v6 = v5 + HIWORD(a1);
  if (v6 <= 0xFFF0) {
    uint64_t v7 = v6 << 16;
  }
  else {
    uint64_t v7 = (v6 << 16) - 4293984256u;
  }
  return v7 | v5;
}

char *sub_10001345C(int a1)
{
  return off_100054908[a1 - 1];
}

uint64_t sub_1000134A0(_DWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v89 = 0LL;
  uint64_t v90 = 0LL;
  if (!a2) {
    sub_10003EFF8();
  }
  if (!*(void *)(a2 + 24) && *(_DWORD *)(a2 + 40) == 1) {
    sub_10003F020();
  }
  if (*(void *)(*(void *)a1 + 240LL)) {
    unint64_t v6 = *(char **)(*(void *)a1 + 240LL);
  }
  else {
    unint64_t v6 = "rsync";
  }
  if (*(void *)(a2 + 8))
  {
    uint64_t v7 = *(char **)(*(void *)a1 + 248LL);
    if (v7 || (uint64_t v7 = getenv("RSYNC_RSH")) != 0LL) {
      sub_10001416C((uint64_t)&v89, v7);
    }
    else {
      sub_100027504((uint64_t)&v89, "ssh", v8, v9, v10, v11, v12, v13, v86);
    }
    if (*(int *)(*(void *)a1 + 560LL) >= 1)
    {
      unint64_t v20 = (const char *)sub_1000275A8((uint64_t)&v89, 0LL);
      if (v20)
      {
        uint64_t v21 = v20;
        unint64_t v22 = strrchr(v20, 47);
        uint64_t v23 = v22 ? v22 + 1 : v21;
        if (!strcmp(v23, "ssh")) {
          sub_100027504((uint64_t)&v89, "-%d", v14, v15, v16, v17, v18, v19, *(_DWORD *)(*(void *)a1 + 560LL));
        }
      }
    }

    sub_100027504((uint64_t)&v89, "%s", v14, v15, v16, v17, v18, v19, *(void *)(a2 + 8));
    sub_10001416C((uint64_t)&v89, v6);
    if (a3) {
      *a3 = v90;
    }
    sub_100027504((uint64_t)&v89, "--server", v24, v25, v26, v27, v28, v29, v87);
    if (*(_DWORD *)(a2 + 40) != 1) {
      goto LABEL_24;
    }
    uint64_t v36 = "--sender";
  }

  else
  {
    sub_10001416C((uint64_t)&v89, v6);
    uint64_t v36 = "--server";
  }

  sub_100027504((uint64_t)&v89, v36, v30, v31, v32, v33, v34, v35, v86);
LABEL_24:
  uint64_t v37 = "--delete";
  switch(*(_DWORD *)(*(void *)a1 + 96LL))
  {
    case 0:
      goto LABEL_30;
    case 1:
      goto LABEL_29;
    case 2:
      uint64_t v37 = "--delete-before";
      goto LABEL_29;
    case 3:
      uint64_t v37 = "--delete-during";
      goto LABEL_29;
    case 4:
      uint64_t v37 = "--delete-delay";
      goto LABEL_29;
    case 5:
      uint64_t v37 = "--delete-after";
LABEL_29:
      sub_100027504((uint64_t)&v89, v37, v30, v31, v32, v33, v34, v35, v86);
LABEL_30:
      uint64_t v38 = *(void *)a1;
      if (*(_DWORD *)(*(void *)a1 + 12LL))
      {
        sub_100027504((uint64_t)&v89, "--append", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v38 = *(void *)a1;
      }

      if (*(_DWORD *)(v38 + 16)) {
        sub_100027504((uint64_t)&v89, "-c", v30, v31, v32, v33, v34, v35, v86);
      }
      if (a1[3]) {
        sub_100027504((uint64_t)&v89, "--checksum-seed=%d", v30, v31, v32, v33, v34, v35, a1[3]);
      }
      uint64_t v39 = *(void *)a1;
      if (*(_DWORD *)(*(void *)a1 + 100LL))
      {
        sub_100027504((uint64_t)&v89, "--delete-excluded", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v39 = *(void *)a1;
      }

      if (*(_DWORD *)(v39 + 120) == 2)
      {
        sub_100027504((uint64_t)&v89, "--numeric-ids", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v39 = *(void *)a1;
      }

      if (*(_DWORD *)(v39 + 88))
      {
        sub_100027504((uint64_t)&v89, "-g", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v39 = *(void *)a1;
      }

      if (*(_DWORD *)(v39 + 84))
      {
        sub_100027504((uint64_t)&v89, "-l", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v39 = *(void *)a1;
      }

      if (*(_DWORD *)(v39 + 36) == 2)
      {
        sub_100027504((uint64_t)&v89, "-n", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v39 = *(void *)a1;
      }

      if (*(_DWORD *)(v39 + 40))
      {
        sub_100027504((uint64_t)&v89, "--inplace", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v39 = *(void *)a1;
      }

      if (*(void *)(v39 + 48) && !*(_DWORD *)(a2 + 40))
      {
        sub_100027504((uint64_t)&v89, "--partial-dir", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v86 = *(void *)(*(void *)a1 + 48LL);
        uint64_t v40 = "%s";
        goto LABEL_54;
      }

      if (*(_DWORD *)(v39 + 44) && !*(_DWORD *)(a2 + 40))
      {
        uint64_t v40 = "--partial";
LABEL_54:
        sub_100027504((uint64_t)&v89, v40, v30, v31, v32, v33, v34, v35, v86);
      }

      uint64_t v41 = *(_DWORD **)a1;
      if (*(_DWORD *)(*(void *)a1 + 92LL))
      {
        sub_100027504((uint64_t)&v89, "-o", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v41 = *(_DWORD **)a1;
      }

      if (v41[15])
      {
        sub_100027504((uint64_t)&v89, "-p", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v41 = *(_DWORD **)a1;
      }

      if (v41[26])
      {
        sub_100027504((uint64_t)&v89, "-D", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v41 = *(_DWORD **)a1;
      }

      if (v41[8])
      {
        sub_100027504((uint64_t)&v89, "-r", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v41 = *(_DWORD **)a1;
      }

      if (v41[14])
      {
        sub_100027504((uint64_t)&v89, "-t", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v41 = *(_DWORD **)a1;
      }

      if (v41[32])
      {
        sub_100027504((uint64_t)&v89, "-O", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v41 = *(_DWORD **)a1;
      }

      if (v41[36])
      {
        sub_100027504((uint64_t)&v89, "-S", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v41 = *(_DWORD **)a1;
      }

      if (v41[50])
      {
        sub_100027504((uint64_t)&v89, "-H", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v41 = *(_DWORD **)a1;
      }

      if (v41[37]) {
        sub_100027504((uint64_t)&v89, "-u", v30, v31, v32, v33, v34, v35, v86);
      }
      int v42 = dword_100058FDC;
      if (dword_100058FDC > 3)
      {
        sub_100027504((uint64_t)&v89, "-v", v30, v31, v32, v33, v34, v35, v86);
        int v42 = dword_100058FDC;
      }

      if (v42 > 2)
      {
        sub_100027504((uint64_t)&v89, "-v", v30, v31, v32, v33, v34, v35, v86);
        int v42 = dword_100058FDC;
      }

      if (v42 > 1)
      {
        sub_100027504((uint64_t)&v89, "-v", v30, v31, v32, v33, v34, v35, v86);
        int v42 = dword_100058FDC;
      }

      if (v42 >= 1) {
        sub_100027504((uint64_t)&v89, "-v", v30, v31, v32, v33, v34, v35, v86);
      }
      uint64_t v43 = *(void *)a1;
      int v44 = *(_DWORD *)(*(void *)a1 + 176LL);
      if (v44 > 1)
      {
        sub_100027504((uint64_t)&v89, "-h", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
        int v44 = *(_DWORD *)(*(void *)a1 + 176LL);
      }

      if (v44 >= 1)
      {
        sub_100027504((uint64_t)&v89, "-h", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(int *)(v43 + 512) >= 1 && !*(_DWORD *)(v43 + 12))
      {
        sub_100027504((uint64_t)&v89, "-W", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(int *)(v43 + 136) >= 1)
      {
        sub_100027504((uint64_t)&v89, "--progress", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(int *)(v43 + 152) >= 1)
      {
        sub_100027504((uint64_t)&v89, "--backup", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(void *)(v43 + 160))
      {
        sub_100027504((uint64_t)&v89, "--backup-dir", v30, v31, v32, v33, v34, v35, v86);
        sub_100027504((uint64_t)&v89, "%s", v45, v46, v47, v48, v49, v50, *(void *)(*(void *)a1 + 160LL));
        uint64_t v43 = *(void *)a1;
      }

      unint64_t v51 = *(_BYTE **)(v43 + 168);
      if (v51 && strcmp(*(const char **)(v43 + 168), "~") && *v51)
      {
        sub_100027504((uint64_t)&v89, "--suffix", v30, v31, v32, v33, v34, v35, v86);
        sub_100027504((uint64_t)&v89, "%s", v52, v53, v54, v55, v56, v57, *(void *)(*(void *)a1 + 168LL));
        uint64_t v43 = *(void *)a1;
      }

      if (*(int *)(v43 + 180) >= 1)
      {
        sub_100027504((uint64_t)&v89, "--ignore-existing", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(int *)(v43 + 184) >= 1)
      {
        sub_100027504((uint64_t)&v89, "--ignore-non-existing", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      int v58 = *(_DWORD *)(v43 + 124);
      if (v58 > 1)
      {
        sub_100027504((uint64_t)&v89, "-x", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
        int v58 = *(_DWORD *)(*(void *)a1 + 124LL);
      }

      if (v58 >= 1)
      {
        sub_100027504((uint64_t)&v89, "-x", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 552))
      {
        sub_100027504((uint64_t)&v89, "-z", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
        if (*(_DWORD *)(*(void *)a1 + 552LL))
        {
          if (*(_DWORD *)(v43 + 556) != -1)
          {
            sub_100027504((uint64_t)&v89, "--compress-level=%d", v30, v31, v32, v33, v34, v35, *(_DWORD *)(v43 + 556));
            uint64_t v43 = *(void *)a1;
          }
        }
      }

      if (!*(_DWORD *)(v43 + 108)
        || !*(_DWORD *)(v43 + 104)
        && (sub_100027504((uint64_t)&v89, "--specials", v30, v31, v32, v33, v34, v35, v86),
            uint64_t v43 = *(void *)a1,
            !*(_DWORD *)(*(void *)a1 + 108LL)))
      {
        if (*(_DWORD *)(v43 + 104))
        {
          sub_100027504((uint64_t)&v89, "--no-specials", v30, v31, v32, v33, v34, v35, v86);
          uint64_t v43 = *(void *)a1;
        }
      }

      if ((*(void *)(v43 + 224) & 0x8000000000000000LL) == 0)
      {
        sub_100027504((uint64_t)&v89, "--max-size=%lld", v30, v31, v32, v33, v34, v35, *(void *)(v43 + 224));
        uint64_t v43 = *(void *)a1;
      }

      if ((*(void *)(v43 + 232) & 0x8000000000000000LL) == 0)
      {
        sub_100027504((uint64_t)&v89, "--min-size=%lld", v30, v31, v32, v33, v34, v35, *(void *)(v43 + 232));
        uint64_t v43 = *(void *)a1;
      }

      if (*(int *)(v43 + 188) >= 1)
      {
        sub_100027504((uint64_t)&v89, "--relative", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 192))
      {
        sub_100027504((uint64_t)&v89, "--dirs", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(int *)(v43 + 196) >= 1)
      {
        sub_100027504((uint64_t)&v89, "--delay-updates", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 64))
      {
        sub_100027504((uint64_t)&v89, "-L", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 68))
      {
        sub_100027504((uint64_t)&v89, "--copy-unsafe-links", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 72))
      {
        sub_100027504((uint64_t)&v89, "--safe-links", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 76))
      {
        sub_100027504((uint64_t)&v89, "-k", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 80))
      {
        sub_100027504((uint64_t)&v89, "-K", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 204))
      {
        sub_100027504((uint64_t)&v89, "--remove-source-files", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 600))
      {
        sub_100027504((uint64_t)&v89, "--extended-attributes", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (!*(_DWORD *)(a2 + 40))
      {
        if (*(int *)(v43 + 132) < 1
          || (sub_100027504((uint64_t)&v89, "--ignore-times", v30, v31, v32, v33, v34, v35, v86),
              uint64_t v43 = *(void *)a1,
              !*(_DWORD *)(a2 + 40)))
        {
          if (*(_DWORD *)(v43 + 580))
          {
            sub_100027504((uint64_t)&v89, "--fuzzy", v30, v31, v32, v33, v34, v35, v86);
            uint64_t v43 = *(void *)a1;
          }
        }
      }

      if (*(void *)(v43 + 448))
      {
        sub_100027504((uint64_t)&v89, "--out-format=%s", v30, v31, v32, v33, v34, v35, *(void *)(v43 + 448));
        uint64_t v43 = *(void *)a1;
      }

      if (*(int *)(v43 + 212) >= 1)
      {
        sub_100027504((uint64_t)&v89, "-8", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      uint64_t v59 = *(void *)(v43 + 472);
      if (v59 >= 1024)
      {
        sub_100027504((uint64_t)&v89, "--bwlimit=%lld", v30, v31, v32, v33, v34, v35, (unint64_t)v59 >> 10);
        uint64_t v43 = *(void *)a1;
      }

      if (*(int *)(v43 + 576) >= 1)
      {
        sub_100027504((uint64_t)&v89, "--modify-window=%d", v30, v31, v32, v33, v34, v35, *(_DWORD *)(v43 + 576));
        uint64_t v43 = *(void *)a1;
      }

      if (!*(_DWORD *)(a2 + 40))
      {
        if (!*(void *)(v43 + 544)
          || (sub_100027504((uint64_t)&v89, "--temp-dir", v30, v31, v32, v33, v34, v35, v86),
              sub_100027504((uint64_t)&v89, "%s", v62, v63, v64, v65, v66, v67, *(void *)(*(void *)a1 + 544LL)),
              uint64_t v43 = *(void *)a1,
              !*(_DWORD *)(a2 + 40)))
        {
          if (*(uint64_t *)(v43 + 488) >= 1)
          {
            sub_100027504((uint64_t)&v89, "-B%ld", v30, v31, v32, v33, v34, v35, *(void *)(v43 + 488));
            uint64_t v43 = *(void *)a1;
          }
        }
      }

      if (*(_DWORD *)(v43 + 564))
      {
        sub_100027504((uint64_t)&v89, "--force", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 568))
      {
        sub_100027504((uint64_t)&v89, "--ignore-errors", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 572))
      {
        sub_100027504((uint64_t)&v89, "--executability", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(_DWORD *)(v43 + 584))
      {
        sub_100027504((uint64_t)&v89, "-q", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      if (*(void *)(v43 + 592))
      {
        sub_100027504((uint64_t)&v89, "--max-delete=%ld", v30, v31, v32, v33, v34, v35, *(void *)(v43 + 592));
        uint64_t v43 = *(void *)a1;
      }

      if (!*(_DWORD *)(v43 + 112))
      {
        sub_100027504((uint64_t)&v89, "--cache", v30, v31, v32, v33, v34, v35, v86);
        uint64_t v43 = *(void *)a1;
      }

      int v60 = *(_DWORD *)(v43 + 208);
      if (v60)
      {
        if (v60 == 1)
        {
          uint64_t v61 = "--super";
        }

        else
        {
          if (v60 != 2) {
            sub_10003F048();
          }
          uint64_t v61 = "--no-super";
        }

        sub_100027504((uint64_t)&v89, v61, v30, v31, v32, v33, v34, v35, v86);
      }

      if (*(void *)(*(void *)a1 + 432LL) && *(void *)(*(void *)a1 + 496LL))
      {
        sub_100027504((uint64_t)&v89, "--files-from", v30, v31, v32, v33, v34, v35, v86);
        sub_100027504((uint64_t)&v89, "%s", v68, v69, v70, v71, v72, v73, *(void *)(*(void *)a1 + 504LL));
        uint64_t v74 = *(int **)a1;
        if (!*(_DWORD *)(*(void *)a1 + 188LL))
        {
          sub_100027504((uint64_t)&v89, "--no-relative", v30, v31, v32, v33, v34, v35, v86);
          uint64_t v74 = *(int **)a1;
        }

        if (!v74[48])
        {
          sub_100027504((uint64_t)&v89, "--no-dirs", v30, v31, v32, v33, v34, v35, v86);
          uint64_t v74 = *(int **)a1;
        }

        if (v74[8] >= 1)
        {
          sub_100027504((uint64_t)&v89, "--recursive", v30, v31, v32, v33, v34, v35, v86);
          uint64_t v74 = *(int **)a1;
        }

        if (v74[110]) {
          sub_100027504((uint64_t)&v89, "--from0", v30, v31, v32, v33, v34, v35, v86);
        }
      }

      if (!*(_DWORD *)(a2 + 40))
      {
        uint64_t v82 = *(_DWORD **)a1;
        if (*(void *)(*(void *)a1 + 528LL) && v82[9] == 1)
        {
          sub_100027504( (uint64_t)&v89,  "--only-write-batch=%s",  v30,  v31,  v32,  v33,  v34,  v35,  *(void *)(*(void *)a1 + 528LL));
          uint64_t v82 = *(_DWORD **)a1;
        }

        if (v82[120])
        {
          sub_100027504((uint64_t)&v89, "--size-only", v30, v31, v32, v33, v34, v35, v86);
          uint64_t v82 = *(_DWORD **)a1;
        }

        if (v82[35])
        {
          for (uint64_t i = 272LL; i != 432; i += 8LL)
          {
            if (!*(void *)(*(void *)a1 + i)) {
              break;
            }
            unsigned int v84 = *(_DWORD *)(*(void *)a1 + 140LL) - 1;
            if (v84 >= 3) {
              errx(1, "unknown base mode %d");
            }
            sub_100027504((uint64_t)&v89, "%s=%s", v30, v31, v32, v33, v34, v35, (char)off_100054908[v84]);
          }
        }
      }

      sub_100027504((uint64_t)&v89, ".", v30, v31, v32, v33, v34, v35, v86);
      if (*(_DWORD *)(a2 + 40) == 1)
      {
        if (*(void *)(a2 + 24))
        {
          unint64_t v81 = 0LL;
          do
          {
            if (**(_BYTE **)(*(void *)(a2 + 16) + 8 * v81)) {
              sub_100027504( (uint64_t)&v89,  "%s",  v75,  v76,  v77,  v78,  v79,  v80,  *(void *)(*(void *)(a2 + 16) + 8 * v81));
            }
            else {
              sub_100027504((uint64_t)&v89, ".", v75, v76, v77, v78, v79, v80, v88);
            }
            ++v81;
          }

          while (v81 < *(void *)(a2 + 24));
        }
      }

      else if (**(_BYTE **)(a2 + 32))
      {
        sub_100027504((uint64_t)&v89, "%s", v75, v76, v77, v78, v79, v80, *(void *)(a2 + 32));
      }

      else
      {
        sub_100027504((uint64_t)&v89, ".", v75, v76, v77, v78, v79, v80, v88);
      }

      return v89;
    default:
      errx(1, "bogus delete mode %d\n");
  }

void sub_10001416C(uint64_t a1, char *__s1)
{
  unint64_t v3 = strdup(__s1);
  if (!v3) {
    sub_10003F070();
  }
  unint64_t v4 = v3;
  char v5 = *v3;
  if (!*v3) {
    goto LABEL_31;
  }
  uint64_t v6 = 0LL;
  size_t v13 = (size_t)&v3[strlen(v3) + 1];
  uint64_t v14 = v4;
  uint64_t v23 = v4;
  while (1)
  {
    if (v5 < 0)
    {
      if (__maskrune(v5, 0x4000uLL))
      {
LABEL_6:
        sub_100027504(a1, "%.*s", v7, v8, v9, v10, v11, v12, (_BYTE)v4 - (_BYTE)v14);
        do
        {
          while (1)
          {
            __darwin_ct_rune_t v16 = *++v4;
            __darwin_ct_rune_t v15 = v16;
            if (v16 < 0) {
              break;
            }
            if ((_DefaultRuneLocale.__runetype[v15] & 0x4000) == 0) {
              goto LABEL_11;
            }
          }
        }

        while (__maskrune(v15, 0x4000uLL));
LABEL_11:
        uint64_t v17 = 0LL;
        uint64_t v14 = v4;
        goto LABEL_22;
      }
    }

    else if ((_DefaultRuneLocale.__runetype[v5] & 0x4000) != 0)
    {
      goto LABEL_6;
    }

    if (v5 != 39 && v5 != 34)
    {
      uint64_t v17 = v6;
      goto LABEL_23;
    }

    uint64_t v18 = *v4;
    uint64_t v17 = *v4;
    if (v14 == v4 || (_DWORD)v17 != v6)
    {
      memmove(v4, v4 + 1, v13 - (void)(v4 + 1));
      --v13;
    }

    else
    {
      ++v4;
    }

    uint64_t v19 = strchr(v4, v18);
    if (!v19) {
      break;
    }
    unint64_t v4 = v19;
    memmove(v19, v19 + 1, v13 - (void)(v19 + 1));
    if (v4 <= v14) {
      sub_10003F088();
    }
    --v13;
LABEL_22:
    --v4;
LABEL_23:
    int v20 = *++v4;
    char v5 = v20;
    uint64_t v6 = v17;
    if (!v20) {
      goto LABEL_28;
    }
  }

  if ((_DWORD)v17)
  {
    free(v23);
  }

  unint64_t v4 = 0LL;
LABEL_28:
  char v22 = (_BYTE)v4 - (_BYTE)v14;
  BOOL v21 = v4 > v14;
  unint64_t v4 = v23;
  if (v21) {
    sub_100027504(a1, "%.*s", v7, v8, v9, v10, v11, v12, v22);
  }
LABEL_31:
  free(v4);
}

uint64_t sub_100014344(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(const char **)(a1 + 16);
  size_t v4 = strlen(v3);
  char v5 = *(const char **)(a2 + 16);
  size_t v6 = strlen(v5);
  size_t v7 = v6;
  if (v4 >= v6) {
    size_t v8 = v6;
  }
  else {
    size_t v8 = v4;
  }
  if (strncmp(v3, v5, v8)) {
    return strcmp(v3, v5);
  }
  if (v4 < v7) {
    return 1LL;
  }
  return 0xFFFFFFFFLL;
}

BOOL sub_1000143C4(void *a1, uint64_t a2, int a3)
{
  BOOL result = 1LL;
  switch(*(_WORD *)(a2 + 88))
  {
    case 1:
    case 8:
      return result;
    case 2:
      if (dword_100058FD8)
      {
        int v6 = *__error();
        size_t v7 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = *(void *)(a2 + 48);
          *(_DWORD *)stat buf = 136315138;
          uint64_t v51 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: directory cycle", buf, 0xCu);
        }

        *__error() = v6;
      }

      sub_100021AB0("%s: directory cycle");
      return 0LL;
    case 3:
      if (*(_DWORD *)(*a1 + 104LL) && (*(_WORD *)(*(void *)(a2 + 96) + 4LL) & 0xB000 | 0x4000) == 0x6000) {
        return result;
      }
      if (*(_DWORD *)(*a1 + 108LL))
      {
        int v9 = *(_WORD *)(*(void *)(a2 + 96) + 4LL) & 0xF000;
        if (v9 == 4096 || !a3 || v9 == 49152) {
          return result;
        }
      }

      else if (!a3)
      {
        return result;
      }

      if (dword_100058FD8)
      {
        int v47 = *__error();
        uint64_t v48 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          uint64_t v49 = *(void *)(a2 + 48);
          *(_DWORD *)stat buf = 136315138;
          uint64_t v51 = v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s: skipping special", buf, 0xCu);
        }

        *__error() = v47;
      }

      sub_100021AB0("%s: skipping special");
      return 0LL;
    case 4:
      int v10 = *(_DWORD *)(a2 + 56);
      *__error() = v10;
      if (dword_100058FD8)
      {
        int v17 = *__error();
        uint64_t v18 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = *(void *)(a2 + 48);
          *(_DWORD *)stat buf = 136315138;
          uint64_t v51 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s: unreadable directory", buf, 0xCu);
        }

        *__error() = v17;
      }

      sub_100021B34(0, "%s: unreadable directory", v11, v12, v13, v14, v15, v16, *(void *)(a2 + 48));
      return 0LL;
    case 5:
      if (dword_100058FD8)
      {
        int v20 = *__error();
        BOOL v21 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = *(void *)(a2 + 48);
          *(_DWORD *)stat buf = 136315138;
          uint64_t v51 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s: skipping dot-file", buf, 0xCu);
        }

        *__error() = v20;
      }

      sub_100021AB0("%s: skipping dot-file");
      return 0LL;
    case 7:
      int v23 = *(_DWORD *)(a2 + 56);
      *__error() = v23;
      if (dword_100058FD8)
      {
        int v30 = *__error();
        uint64_t v31 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = *(void *)(a2 + 48);
          *(_DWORD *)stat buf = 136315138;
          uint64_t v51 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
        }

        *__error() = v30;
      }

      sub_100021B34(0, "%s", v24, v25, v26, v27, v28, v29, *(void *)(a2 + 48));
      return 0LL;
    case 0xA:
      int v33 = *(_DWORD *)(a2 + 56);
      *__error() = v33;
      ++a1[30];
      if (dword_100058FD8)
      {
        int v40 = *__error();
        uint64_t v41 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          uint64_t v42 = *(void *)(a2 + 48);
          *(_DWORD *)stat buf = 136315138;
          uint64_t v51 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s: could not stat", buf, 0xCu);
        }

        *__error() = v40;
      }

      sub_100021B34(0, "%s: could not stat", v34, v35, v36, v37, v38, v39, *(void *)(a2 + 48));
      return 0LL;
    case 0xC:
      if (*(_DWORD *)(*a1 + 84LL) || !a3 || *(_DWORD *)(*a1 + 76LL)) {
        return result;
      }
      if (dword_100058FD8)
      {
        int v43 = *__error();
        int v44 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          uint64_t v45 = *(void *)(a2 + 48);
          *(_DWORD *)stat buf = 136315138;
          uint64_t v51 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s: skipping symlink (5)", buf, 0xCu);
        }

        *__error() = v43;
      }

      sub_100021AB0("%s: skipping symlink (5)");
      return 0LL;
    case 0xD:
      uint64_t v46 = (_DWORD *)*a1;
      if (!*(_DWORD *)(*a1 + 64LL) && !v46[18] && !v46[17]) {
        return v46[21] != 0;
      }
      BOOL result = 0LL;
      ++a1[30];
      return result;
    default:
      return 0LL;
  }

void sub_1000148EC(char *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = a2;
    if (a2)
    {
      size_t v4 = a1;
      do
      {
        int v5 = *((_DWORD *)v4 + 2);
        if ((v5 & 0x80000000) == 0) {
          close(v5);
        }
        free(*(void **)v4);
        free(*((void **)v4 + 11));
        v4 += 152;
        --v2;
      }

      while (v2);
    }

    free(a1);
  }

uint64_t sub_100014950( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a5;
  uint64_t v69 = 0LL;
  uint64_t v70 = 0LL;
  uint64_t v67 = 0LL;
  uint64_t v68 = 0LL;
  uint64_t v12 = (os_log_t *)&qword_100058FE8;
  if (dword_100058FD8)
  {
    int v13 = *__error();
    uint64_t v14 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 134217984;
      uint64_t v72 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "sending file metadata list: %zu", buf, 0xCu);
    }

    *__error() = v13;
  }

  sub_100021744(1, "sending file metadata list: %zu", a3, a4, a5, a6, a7, a8, v8);
  if (v8)
  {
    uint64_t v15 = a4 + 72;
    while (1)
    {
      uint64_t v16 = *(char **)(v15 - 56);
      size_t v17 = strlen(v16);
      if (!v17) {
        sub_10003F0DC();
      }
      size_t v24 = v17;
      if (v17 >= 0x7FFFFFFF) {
        sub_10003F104();
      }
      if (*(_DWORD *)(a1 + 128)
        && sub_10001EC7C(a1, a2)
        && !sub_10001EE0C((void *)a1, a2))
      {
        break;
      }

      if ((*(_BYTE *)(v15 - 16) & 1) != 0) {
        unsigned __int16 v25 = 65;
      }
      else {
        unsigned __int16 v25 = 64;
      }
      int v26 = *(_DWORD *)(a1 + 260);
      if (*(_DWORD *)(*(void *)a1 + 200LL))
      {
        int v27 = *(_WORD *)(v15 - 48) & 0xF000;
        if (v26 < 28 || v27 == 0x4000 || *(void *)(v15 + 8) < 2uLL)
        {
          if (v27 == 0x8000) {
            v25 |= 0x200u;
          }
        }

        else
        {
          else {
            __int16 v28 = 2560;
          }
          v25 |= v28;
        }
      }

      if (v25 < 0x100u || v26 < 28) {
        unsigned __int16 v30 = v25;
      }
      else {
        unsigned __int16 v30 = v25 | 4;
      }
      if (dword_100058FD8)
      {
        int v31 = *__error();
        uint64_t v32 = v12;
        int v33 = *v12;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v44 = *(void *)(v15 - 32);
          uint64_t v45 = *(void *)(v15 - 24);
          int v46 = *(unsigned __int16 *)(v15 - 48);
          *(_DWORD *)stat buf = 136316162;
          uint64_t v72 = (uint64_t)v16;
          __int16 v73 = 2048;
          uint64_t v74 = v44;
          __int16 v75 = 2048;
          uint64_t v76 = v45;
          __int16 v77 = 1024;
          int v78 = v46;
          __int16 v79 = 1024;
          int v80 = v30;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%s: sending file metadata: size %jd, mtime %jd, mode %o, flag %o",  buf,  0x2Cu);
        }

        *__error() = v31;
        uint64_t v12 = v32;
      }

      sub_100021744( 2,  "%s: sending file metadata: size %jd, mtime %jd, mode %o, flag %o",  v18,  v19,  v20,  v21,  v22,  v23,  (char)v16);
      int v34 = *(_DWORD *)(a1 + 260);
      int v35 = sub_10001F820(a1, a3, v30);
      if ((v30 & 4) != 0 && v34 >= 28)
      {
        if (!v35)
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_90;
            }
            goto LABEL_91;
          }

          goto LABEL_205;
        }

        if (!sub_10001F820(a1, a3, SHIBYTE(v30)))
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_90;
            }
            goto LABEL_91;
          }

          goto LABEL_205;
        }
      }

      else if (!v35)
      {
        if (dword_100058FD8)
        {
          int v56 = *__error();
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_90;
          }
          goto LABEL_91;
        }

        goto LABEL_205;
      }

      if (!sub_10001FFB4(a1, a3, v24))
      {
        if (!dword_100058FD8) {
          goto LABEL_191;
        }
        int v56 = *__error();
        if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_187;
        }
LABEL_186:
        sub_10003C7BC();
        goto LABEL_187;
      }

      if (!sub_10001F6EC(a1, a3, v16, v24))
      {
        if (dword_100058FD8)
        {
          int v56 = *__error();
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_109;
          }
          goto LABEL_110;
        }

LABEL_195:
        sub_100021980("io_write_buf");
        goto LABEL_189;
      }

      if (!sub_10001FFBC(a1, a3, *(void *)(v15 - 32)))
      {
        if (dword_100058FD8)
        {
          int v56 = *__error();
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_172;
          }
          goto LABEL_173;
        }

LABEL_174:
        sub_100021980("io_write_long");
        goto LABEL_189;
      }

      if (!sub_10001FFB4(a1, a3, *(_DWORD *)(v15 - 24)))
      {
        if (dword_100058FD8)
        {
          int v56 = *__error();
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_148;
          }
LABEL_149:
          uint64_t v57 = "io_write_uint";
          goto LABEL_188;
        }

LABEL_150:
        sub_100021980("io_write_uint");
        goto LABEL_189;
      }

      if (!sub_10001FFB4(a1, a3, *(unsigned __int16 *)(v15 - 48)))
      {
        if (!dword_100058FD8) {
          goto LABEL_150;
        }
        int v56 = *__error();
        if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_149;
        }
LABEL_148:
        sub_10003F158();
        goto LABEL_149;
      }

      uint64_t v36 = *(_DWORD **)a1;
      if (*(_DWORD *)(*(void *)a1 + 92LL))
      {
        if (!sub_10001FFB4(a1, a3, *(_DWORD *)(v15 - 44)))
        {
          if (!dword_100058FD8) {
            goto LABEL_150;
          }
          int v56 = *__error();
          if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_149;
          }
          goto LABEL_148;
        }

        if (!sub_10001E3C0(0, &v67, &v69, *(unsigned int *)(v15 - 44)))
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
LABEL_156:
            }
              sub_10003F204();
LABEL_157:
            uint64_t v57 = "idents_add";
            goto LABEL_188;
          }

LABEL_166:
          sub_100021980("idents_add");
          goto LABEL_189;
        }

        uint64_t v36 = *(_DWORD **)a1;
      }

      if (v36[22])
      {
        if (!sub_10001FFB4(a1, a3, *(_DWORD *)(v15 - 40)))
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_148;
            }
            goto LABEL_149;
          }

          goto LABEL_150;
        }

        if (!sub_10001E3C0(1, &v68, &v70, *(unsigned int *)(v15 - 40)))
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_156;
            }
            goto LABEL_157;
          }

          goto LABEL_166;
        }

        uint64_t v36 = *(_DWORD **)a1;
      }

      if (v36[26] && (*(_WORD *)(v15 - 48) & 0xB000 | 0x4000) == 0x6000
        || v36[27] && ((int v37 = *(_WORD *)(v15 - 48) & 0xF000, v37 == 49152) || v37 == 4096))
      {
        unsigned int v38 = *(_DWORD *)(v15 - 36);
        if (*(int *)(a1 + 260) <= 27)
        {
          if (!sub_10001FFB4(a1, a3, v38))
          {
            if (!dword_100058FD8) {
              goto LABEL_191;
            }
            int v56 = *__error();
            if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_187;
            }
            goto LABEL_186;
          }
        }

        else
        {
          if (!sub_10001FFB4(a1, a3, HIBYTE(v38)))
          {
            if (!dword_100058FD8) {
              goto LABEL_191;
            }
            int v56 = *__error();
            if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_187;
            }
            goto LABEL_186;
          }

          if ((v30 & 0x800) != 0 && !sub_10001F820(a1, a3, *(_BYTE *)(v15 - 36)))
          {
            if (dword_100058FD8)
            {
              int v56 = *__error();
              if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
LABEL_90:
              }
                sub_10003C178();
LABEL_91:
              uint64_t v57 = "io_write_byte";
              goto LABEL_188;
            }

LABEL_205:
            sub_100021980("io_write_byte");
            goto LABEL_189;
          }

          if (!sub_10001FFB4(a1, a3, *(_DWORD *)(v15 - 36) & 0xFFFFFF))
          {
            if (!dword_100058FD8) {
              goto LABEL_191;
            }
            int v56 = *__error();
            if (!os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_187;
            }
            goto LABEL_186;
          }
        }
      }

      if ((*(_WORD *)(v15 - 48) & 0xF000) == 0xA000 && *(_DWORD *)(*(void *)a1 + 84LL))
      {
        uint64_t v39 = *(char **)(v15 + 16);
        size_t v40 = strlen(v39);
        if (v40 >= 0x7FFFFFFF) {
          sub_10003F1DC();
        }
        size_t v41 = v40;
        if (!sub_10001FFB4(a1, a3, v40))
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_186;
            }
LABEL_187:
            uint64_t v57 = "io_write_int";
LABEL_188:
            *__error() = v56;
            sub_100021980(v57);
            goto LABEL_189;
          }

LABEL_191:
          sub_100021980("io_write_int");
          goto LABEL_189;
        }

        if (!sub_10001F6EC(a1, a3, v39, v41))
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
LABEL_109:
            }
              sub_10003D5F8();
LABEL_110:
            uint64_t v57 = "io_write_buf";
            goto LABEL_188;
          }

          goto LABEL_195;
        }
      }

      if ((v30 & 0x200) != 0)
      {
        if (!sub_10001FFBC(a1, a3, *(void *)(v15 - 8)))
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
LABEL_172:
            }
              sub_10003F12C();
LABEL_173:
            uint64_t v57 = "io_write_long";
            goto LABEL_188;
          }

          goto LABEL_174;
        }

        if (!sub_10001FFBC(a1, a3, *(void *)v15))
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_172;
            }
            goto LABEL_173;
          }

          goto LABEL_174;
        }
      }

      int v42 = *(_WORD *)(v15 - 48) & 0xF000;
      if ((v42 | 0x2000) == 0xA000) {
        *(void *)(a1 + 40) += *(void *)(v15 - 32);
      }
      if (*(_DWORD *)(*(void *)a1 + 16LL)
        && (v42 == 0x8000 || *(int *)(a1 + 260) <= 27)
        && !sub_10001F6EC(a1, a3, (char *)(v15 + 24), 0x10uLL))
      {
        if (dword_100058FD8)
        {
          int v56 = *__error();
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
            sub_10003F1B0();
          }
          uint64_t v57 = "io_write_buf checksum";
          goto LABEL_188;
        }

        sub_100021980("io_write_buf checksum");
        goto LABEL_189;
      }

      int v43 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 64);
      if (v43 && !v43(a1, a3, v15 - 72))
      {
        if (dword_100058FD8)
        {
          int v56 = *__error();
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
            sub_10003F184();
          }
          uint64_t v57 = "platform sent";
          goto LABEL_188;
        }

        sub_100021980("platform sent");
        goto LABEL_189;
      }

      v15 += 152LL;
      if (!--v8) {
        goto LABEL_83;
      }
    }

    if (dword_100058FD8)
    {
      int v56 = *__error();
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
        sub_10003F230();
      }
      uint64_t v57 = "io_read_flush";
      goto LABEL_188;
    }

    sub_100021980("io_read_flush");
LABEL_189:
    uint64_t v62 = 0LL;
    goto LABEL_190;
  }

LABEL_83:
  if (!sub_10001F820(a1, a3, 0))
  {
    if (dword_100058FD8)
    {
      int v56 = *__error();
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      goto LABEL_91;
    }

    goto LABEL_205;
  }

  uint64_t v53 = *(void *)a1;
  if (*(_DWORD *)(*(void *)a1 + 92LL))
  {
    int v54 = *(_DWORD *)(v53 + 120);
    if (v54 != 2)
    {
      if (v54) {
        uint64_t v55 = 0LL;
      }
      else {
        uint64_t v55 = v69;
      }
      if (dword_100058FD8)
      {
        int v58 = *__error();
        uint64_t v59 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 134217984;
          uint64_t v72 = v55;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "sending uid list: %zu", buf, 0xCu);
        }

        *__error() = v58;
      }

      sub_100021744(1, "sending uid list: %zu", v47, v48, v49, v50, v51, v52, v55);
      if (!sub_10001E718(a1, a3, (uint64_t)v67, v55))
      {
        if (dword_100058FD8)
        {
          int v56 = *__error();
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
LABEL_131:
          }
            sub_10003F0B0();
LABEL_132:
          uint64_t v57 = "idents_send";
          goto LABEL_188;
        }

LABEL_133:
        sub_100021980("idents_send");
        goto LABEL_189;
      }

      uint64_t v53 = *(void *)a1;
    }
  }

  if (!*(_DWORD *)(v53 + 88) || (int v60 = *(_DWORD *)(v53 + 120), v60 == 2))
  {
    uint64_t v62 = 1LL;
    goto LABEL_190;
  }

  if (v60) {
    uint64_t v61 = 0LL;
  }
  else {
    uint64_t v61 = v70;
  }
  if (dword_100058FD8)
  {
    int v63 = *__error();
    uint64_t v64 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 134217984;
      uint64_t v72 = v61;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "sending gid list: %zu", buf, 0xCu);
    }

    *__error() = v63;
  }

  uint64_t v62 = 1LL;
  sub_100021744(1, "sending gid list: %zu", v47, v48, v49, v50, v51, v52, v61);
  if (!sub_10001E718(a1, a3, (uint64_t)v68, v61))
  {
    if (dword_100058FD8)
    {
      int v56 = *__error();
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_131;
      }
      goto LABEL_132;
    }

    goto LABEL_133;
  }

LABEL_190:
  sub_10001E1A8((void **)v68, v70);
  sub_10001E1A8((void **)v67, v69);
  return v62;
}

  if (dword_10005880C) {
    size_t v41 = dword_100058A00 < 1;
  }
  else {
    size_t v41 = 1;
  }
  if (!v41) {
    sub_100040B28(v8);
  }
  int v42 = (const char *)qword_1000588A8;
  if (!qword_1000588A8)
  {
    if (qword_1000588A0) {
      int v43 = "";
    }
    else {
      int v43 = "~";
    }
    int v42 = strdup(v43);
    qword_1000588A8 = (uint64_t)v42;
  }

  uint64_t v49 = dword_100058898;
  if (dword_100058898 && dword_100058860 >= 2 && !dword_100058864)
  {
    snprintf(__endptr, 0x400uLL, "P *%s", v42);
    int v42 = (const char *)sub_10002B150(__endptr, 0, 0);
    if ((_DWORD)v42 == -1) {
      errx(1, "error adding protect rule: %s");
    }
    uint64_t v49 = dword_100058898;
  }

  if (v49 && !qword_1000588A0) {
    dword_100058880 = 1;
  }
  if (!qword_100058900) {
    qword_100058900 = (uint64_t)"rsync";
  }
  if (dword_100058FE0) {
    uint64_t v50 = 1000 * dword_100058FE0;
  }
  else {
    uint64_t v50 = -1;
  }
  dword_100058FE0 = v50;
  uint64_t v51 = dword_100058FF0;
  if (v105 > dword_100058FF0) {
    uint64_t v51 = v105;
  }
  if (v51) {
    uint64_t v52 = 1000 * v51;
  }
  else {
    uint64_t v52 = -1;
  }
  dword_100058FF0 = v52;
  uint64_t v53 = (const char *)qword_1000589B0;
  if (!qword_1000589B0) {
    goto LABEL_281;
  }
  if (*(_BYTE *)qword_1000589B0 != 58)
  {
    if (sub_1000272B0((const char *)qword_1000589B0))
    {
      uint64_t v65 = v53 + 8;
      uint64_t v66 = strcspn(v53 + 8, ":/");
      uint64_t v67 = strndup(v53 + 8, v66);
      qword_1000589F0 = (uint64_t)v67;
      if (!v67)
      {
        if (dword_100058FD8)
        {
          int v78 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_270;
          }
          goto LABEL_271;
        }

        goto LABEL_272;
      }

      uint64_t v62 = (char)v67;
      if (v65[v66] != 47)
      {
        uint64_t v66 = strcspn(v53 + 8, "/");
        if (!v65[v66])
        {
          if (dword_100058FD8)
          {
            int v95 = *__error();
            uint64_t v96 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_100040CA8((uint64_t)v53, v96);
            }
            *__error() = v95;
          }

          sub_1000218D4("Missing path in --files-from: %s", v68, v69, v70, v71, v72, v73, v74, (char)v53);
          goto LABEL_274;
        }
      }

      qword_1000589F8 = (uint64_t)strdup(&v65[v66 + 1]);
      if (!qword_1000589F8)
      {
        if (dword_100058FD8)
        {
          uint64_t v76 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_100040C50();
          }
          *__error() = v76;
        }

        __int16 v77 = "malloc path";
LABEL_324:
        sub_1000218D4(v77, v75, v56, v57, v58, v59, v60, v61, v99);
        free((void *)qword_1000589F0);
        qword_1000589F0 = 0LL;
        goto LABEL_274;
      }
    }

    else
    {
      __int16 v79 = strchr(v53, 58);
      if (!v79) {
        goto LABEL_274;
      }
      int v80 = v79;
      unint64_t v81 = strndup(v53, v79 - v53);
      qword_1000589F0 = (uint64_t)v81;
      if (!v81)
      {
        if (dword_100058FD8)
        {
          int v78 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_270:
          }
            sub_100040C24();
LABEL_271:
          *__error() = v78;
        }

uint64_t sub_100015684(char **a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4 = *a2 + 1;
  if (v4 <= *a3)
  {
LABEL_7:
    *a2 = v4;
    return 1LL;
  }

  size_t v7 = sub_100007014(*a1, *a3, *a3 + 1024, 0x98uLL);
  if (v7)
  {
    *a1 = v7;
    unint64_t v15 = *a3;
    unint64_t v16 = *a3 + 1024;
    *a3 = v16;
    unint64_t v17 = *a2;
    if (*a2 < v16)
    {
      uint64_t v18 = v15 - v17 + 1024;
      uint64_t v19 = &v7[152 * v17 + 144];
      do
      {
        *(_DWORD *)uint64_t v19 = -1;
        *((_DWORD *)v19 - 34) = -1;
        v19 += 152;
        --v18;
      }

      while (v18);
    }

    unint64_t v4 = v17 + 1;
    goto LABEL_7;
  }

  if (dword_100058FD8)
  {
    int v21 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F25C();
    }
    *__error() = v21;
  }

  sub_1000218D4("recallocarray flist", v8, v9, v10, v11, v12, v13, v14, v22);
  return 0LL;
}

uint64_t sub_100015788(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 8);
  else {
    return 0LL;
  }
}

void *sub_1000157D8(void *result)
{
  void *result = 0LL;
  result[1] = 0LL;
  result[2] = 0LL;
  return result;
}

uint64_t sub_1000157E4(void *a1, unint64_t a2)
{
  if (a1[1] > a2) {
    return *a1 + 152 * a2;
  }
  if (dword_100058FD8)
  {
    int v3 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F288();
    }
    *__error() = v3;
  }

  sub_100021850("flist index error");
  return 0LL;
}

uint64_t sub_100015870(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4, unint64_t *a5)
{
  uint64_t v5 = a2;
  int v6 = (int *)a1;
  unint64_t v159 = 0LL;
  __base = 0LL;
  unint64_t v158 = 0LL;
  uint64_t v155 = 0LL;
  uint64_t v156 = 0LL;
  uint64_t v149 = 0LL;
  uint64_t v150 = 0LL;
  __src[0] = 0;
  if (!sub_10001FB98(a1, a2, (char *)&v151))
  {
LABEL_169:
    if (dword_100058FD8)
    {
      int v95 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
      {
LABEL_172:
        *__error() = v95;
        goto LABEL_173;
      }

LABEL_171:
      sub_10003F2B4();
      goto LABEL_172;
    }

LABEL_173:
    sub_100021980("io_read_byte");
    goto LABEL_267;
  }

  while (1)
  {
    int v14 = v151;
    if (!v151)
    {
      uint64_t v97 = *(void *)v6;
      if (*(_DWORD *)(*(void *)v6 + 92LL) && *(_DWORD *)(v97 + 120) != 2)
      {
        if (!sub_10001E95C((uint64_t)v6, v5, &v149, &v155))
        {
          if (dword_100058FD8)
          {
            int v140 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              goto LABEL_337;
            }
            goto LABEL_338;
          }

LABEL_339:
          sub_100021980("idents_recv");
          goto LABEL_267;
        }

        if (dword_100058FD8)
        {
          int v104 = *__error();
          uint64_t v105 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)stat buf = 134217984;
            *(void *)&uint8_t buf[4] = v155;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "received uid list: %zu", buf, 0xCu);
          }

          *__error() = v104;
        }

        sub_100021744(1, "received uid list: %zu", v98, v99, v100, v101, v102, v103, v155);
        uint64_t v97 = *(void *)v6;
      }

      if (!*(_DWORD *)(v97 + 88) || *(_DWORD *)(v97 + 120) == 2)
      {
LABEL_195:
        if (dword_100058FD8)
        {
          int v114 = *__error();
          unint64_t v115 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)stat buf = 134217984;
            *(void *)&uint8_t buf[4] = v159;
            _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_INFO,  "received file metadata list: %zu",  buf,  0xCu);
          }

          *__error() = v114;
        }

        unint64_t v116 = v159;
        sub_100021744(1, "received file metadata list: %zu", v8, v9, v10, v11, v12, v13, v159);
        int v117 = (__int128 *)__base;
        if (v6[65] <= 28) {
          int v118 = (int (__cdecl *)(const void *, const void *))sub_1000172B4;
        }
        else {
          int v118 = (int (__cdecl *)(const void *, const void *))sub_10001704C;
        }
        qsort(__base, v116, 0x98uLL, v118);
        if (v116)
        {
          uint64_t v119 = 0LL;
          int v120 = v117 + 9;
          do
          {
            *int v120 = v119;
            v120 += 38;
            ++v119;
          }

          while (v116 != v119);
        }

        sub_100004968((uint64_t)v6, v117, v116);
        *a5 = v116;
        *a4 = v117;
        uint64_t v121 = *(void *)v6;
        if (*(_DWORD *)(*(void *)v6 + 92LL) && !*(_DWORD *)(v121 + 120))
        {
          sub_10001E2EC((uint64_t)v6, 0, (uint64_t)v149, v155);
          sub_10001E270((uint64_t)v6, (uint64_t)v117, v116, (uint64_t)v149, v155);
          uint64_t v121 = *(void *)v6;
        }

        if (*(_DWORD *)(v121 + 88) && !*(_DWORD *)(v121 + 120))
        {
          sub_10001E2EC((uint64_t)v6, 1, (uint64_t)v150, v156);
          sub_10001E1F4((uint64_t)v6, (uint64_t)v117, v116, (uint64_t)v150, v156);
        }

        sub_10001E1A8((void **)v150, v156);
        sub_10001E1A8((void **)v149, v155);
        return 1LL;
      }

      if (sub_10001E95C((uint64_t)v6, v5, &v150, &v156))
      {
        if (dword_100058FD8)
        {
          int v112 = *__error();
          int v113 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)stat buf = 134217984;
            *(void *)&uint8_t buf[4] = v156;
            _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "received gid list: %zu", buf, 0xCu);
          }

          *__error() = v112;
        }

        sub_100021744(1, "received gid list: %zu", v106, v107, v108, v109, v110, v111, v156);
        goto LABEL_195;
      }

      if (dword_100058FD8)
      {
        int v140 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_337:
        }
          sub_10003F2E0();
LABEL_338:
        *__error() = v140;
        goto LABEL_339;
      }

      goto LABEL_339;
    }

    if ((v151 & 4) != 0 && v6[65] >= 28)
    {
      if (sub_10001FB98((uint64_t)v6, v5, (char *)&v151))
      {
        v14 |= v151 << 8;
        goto LABEL_7;
      }

      if (dword_100058FD8)
      {
        int v95 = *__error();
        if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_172;
        }
        goto LABEL_171;
      }

      goto LABEL_173;
    }

LABEL_7:
    if (v159 == 0x7FFFFFFF)
    {
      if (dword_100058FD8)
      {
        int v123 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F30C();
        }
        *__error() = v123;
      }

      int v124 = "remote sent too many files";
      goto LABEL_217;
    }

    if (!sub_100015684((char **)&__base, &v159, &v158))
    {
      if (dword_100058FD8)
      {
        int v125 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F338();
        }
        *__error() = v125;
      }

      sub_100021980("flist_realloc");
      goto LABEL_267;
    }

    size_t v15 = 0LL;
    unint64_t v145 = __base;
    unint64_t v16 = (char *)__base + 152 * v159;
    uint64_t v17 = v159 - 1;
    if (v159 <= 1) {
      uint64_t v18 = 0LL;
    }
    else {
      uint64_t v18 = v16 - 304;
    }
    unint64_t v146 = v18;
    *(void *)stat buf = 0LL;
    if ((v14 & 0x20) != 0)
    {
      if (!sub_10001FB98((uint64_t)v6, v5, (char *)&v161))
      {
        if (dword_100058FD8)
        {
          int v130 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_249;
          }
          goto LABEL_250;
        }

LABEL_251:
        sub_100021980("io_read_byte");
        goto LABEL_262;
      }

      size_t v15 = v161;
    }

    uint64_t v147 = v17;
    if ((v14 & 0x40) == 0)
    {
      if (sub_10001FB98((uint64_t)v6, v5, (char *)&v161))
      {
        size_t v19 = v161;
        *(void *)stat buf = v161;
        goto LABEL_20;
      }

      if (dword_100058FD8)
      {
        int v130 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_249:
        }
          sub_10003F2B4();
LABEL_250:
        *__error() = v130;
        goto LABEL_251;
      }

      goto LABEL_251;
    }

    if (!sub_10002070C((uint64_t)v6, v5, buf))
    {
      if (dword_100058FD8)
      {
        int v131 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F534();
        }
        *__error() = v131;
      }

      sub_100021980("io_read_size");
      goto LABEL_262;
    }

    size_t v19 = *(void *)buf;
LABEL_20:
    unint64_t v20 = v19 + v15;
    if (!(v19 + v15))
    {
      if (dword_100058FD8)
      {
        int v126 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F390();
        }
        *__error() = v126;
      }

      sub_100021850("security violation: zero-length pathname");
      goto LABEL_262;
    }

    uint64_t v21 = (uint64_t)v6;
    uint64_t v22 = v5;
    uint64_t v23 = (const char **)(v16 - 152);
    size_t v24 = v20 + 1;
    unsigned __int16 v25 = (char *)malloc(v20 + 1);
    uint64_t v148 = v23;
    *uint64_t v23 = v25;
    if (!v25)
    {
      if (dword_100058FD8)
      {
        int v127 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F3BC();
        }
        *__error() = v127;
      }

      sub_1000218D4("malloc", v26, v27, v28, v29, v30, v31, v32, v142);
      goto LABEL_262;
    }

    int v33 = v25;
    v25[v20] = 0;
    if ((v14 & 0x20) != 0) {
      memcpy(v25, __src, v15);
    }
    uint64_t v5 = v22;
    if (!sub_10001FC1C(v21, v22, &v33[v15], v19))
    {
      if (dword_100058FD8)
      {
        int v128 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F3E8();
        }
        *__error() = v128;
      }

      sub_100021980("io_read_buf");
      goto LABEL_262;
    }

    int v34 = *v148;
    int v6 = (int *)v21;
    if (**v148 == 47 && !*(_DWORD *)(*(void *)v21 + 188LL))
    {
      if (dword_100058FD8)
      {
        int v132 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F414();
        }
        *__error() = v132;
      }

      sub_100021850("security violation: absolute pathname: %s");
LABEL_262:
      if (dword_100058FD8)
      {
        int v133 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F364();
        }
        *__error() = v133;
      }

      sub_100021980("flist_recv_name");
      goto LABEL_267;
    }

    if (strstr(*v148, "/../")
      || v20 >= 3 && (!strcmp(&v34[v20 - 3], "/..") || !strncmp(v34, "../", 3uLL))
      || !strcmp(v34, ".."))
    {
      if (dword_100058FD8)
      {
        int v96 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F478();
        }
        *__error() = v96;
      }

      sub_100021850("%s: security violation: backtracking pathname");
      goto LABEL_262;
    }

    __strlcpy_chk(__src, v34, 1024LL, 1024LL);
    int v35 = (char *)*v148;
    if (*(_DWORD *)(*(void *)v21 + 188LL))
    {
      uint64_t v36 = v147;
      int v37 = v14;
      if (*v35 == 47)
      {
        unsigned int v38 = (char *)&v145[19 * v147];
        *((void *)v38 + 2) = v35;
        uint64_t v39 = v38 + 16;
        size_t v40 = v35;
        if (*v35 == 47)
        {
          size_t v24 = v15 + v19 + 1;
          size_t v41 = (unsigned __int8 *)(v35 + 1);
          do
          {
            *uint64_t v39 = v41;
            int v42 = *v41++;
            --v24;
          }

          while (v42 == 47);
          size_t v40 = (char *)(v41 - 1);
        }

        memmove(v35, v40, v24);
        int v35 = (char *)*v148;
      }
    }

    else
    {
      uint64_t v36 = v147;
      int v37 = v14;
    }

    int v43 = v145;
    v145[19 * v36 + 2] = v35;
    uint64_t v44 = v146;
    uint64_t v45 = (char *)&v145[19 * v36];
    *((void *)v45 + 5) = v154;
    int v46 = (uint64_t *)(v45 + 40);
    uint64_t v47 = v46 - 2;
    if ((v37 & 0x80) == 0)
    {
      if (sub_100020800((uint64_t)v6, v5, &v152))
      {
        uint64_t v48 = v152;
        goto LABEL_46;
      }

      if (!dword_100058FD8) {
        goto LABEL_284;
      }
      int v134 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_283;
      }
LABEL_282:
      sub_10003F508();
      goto LABEL_283;
    }

    if (!v146)
    {
      if (dword_100058FD8)
      {
        int v50 = *__error();
        uint64_t v51 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "same time without last entry", buf, 2u);
        }

        *__error() = v50;
        uint64_t v44 = v146;
        uint64_t v36 = v147;
      }

      sub_100021A18("same time without last entry");
      v145[19 * v36 + 6] = 0LL;
      if ((v37 & 2) != 0) {
        goto LABEL_59;
      }
LABEL_47:
      if (sub_100020800((uint64_t)v6, v5, &v152))
      {
        __int16 v49 = v152;
LABEL_51:
        *(_WORD *)uint64_t v47 = v49;
        if ((v37 & 1) != 0 && (v49 & 0xF000) == 0x4000) {
          LODWORD(v145[19 * v36 + 7]) |= 1u;
        }
        goto LABEL_64;
      }

      if (!dword_100058FD8) {
        goto LABEL_284;
      }
      int v134 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_283;
      }
      goto LABEL_282;
    }

    uint64_t v48 = *((void *)v146 + 6);
LABEL_46:
    v145[19 * v36 + 6] = v48;
    if ((v37 & 2) == 0) {
      goto LABEL_47;
    }
    if (v146)
    {
      __int16 v49 = *((_WORD *)v146 + 12);
      goto LABEL_51;
    }

LABEL_59:
    if (dword_100058FD8)
    {
      int v52 = *__error();
      uint64_t v53 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "same mode without last entry", buf, 2u);
      }

      *__error() = v52;
      uint64_t v44 = v146;
      uint64_t v36 = v147;
    }

    sub_100021A18("same mode without last entry");
    *(_WORD *)uint64_t v47 = 0;
LABEL_64:
    uint64_t v54 = *(void *)v6;
    if (*(void *)(*(void *)v6 + 24LL))
    {
      sub_100016FF4(v6, (uint64_t)v148);
      uint64_t v54 = *(void *)v6;
    }

    if (*(_DWORD *)(v54 + 92))
    {
      if ((v37 & 8) != 0)
      {
        if (v44)
        {
          unsigned int v55 = *((_DWORD *)v44 + 7);
        }

        else
        {
          if (dword_100058FD8)
          {
            int v56 = *__error();
            uint64_t v57 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)stat buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "same uid without last entry", buf, 2u);
            }

            *__error() = v56;
            uint64_t v44 = v146;
            uint64_t v36 = v147;
          }

          sub_100021A18("same uid without last entry");
          unsigned int v55 = 0;
        }
      }

      else
      {
        if (!sub_100020800((uint64_t)v6, v5, &v152))
        {
          if (!dword_100058FD8) {
            goto LABEL_334;
          }
          int v135 = *__error();
          if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_333;
          }
          goto LABEL_332;
        }

        unsigned int v55 = v152;
      }

      HIDWORD(v145[19 * v36 + 3]) = v55;
    }

    if (*(_DWORD *)(*(void *)v6 + 88LL))
    {
      if ((v37 & 0x10) != 0)
      {
        if (v44)
        {
          unsigned int v58 = *((_DWORD *)v44 + 8);
        }

        else
        {
          if (dword_100058FD8)
          {
            int v59 = *__error();
            int v60 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)stat buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "same gid without last entry", buf, 2u);
            }

            *__error() = v59;
            uint64_t v44 = v146;
            uint64_t v36 = v147;
          }

          sub_100021A18("same gid without last entry");
          unsigned int v58 = 0;
        }

        goto LABEL_89;
      }

      if (sub_100020800((uint64_t)v6, v5, &v152))
      {
        unsigned int v58 = v152;
LABEL_89:
        LODWORD(v145[19 * v36 + 4]) = v58;
        goto LABEL_90;
      }

      if (dword_100058FD8)
      {
        int v134 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_282;
        }
LABEL_283:
        *__error() = v134;
      }

LABEL_284:
      sub_100021980("io_read_uint");
      goto LABEL_267;
    }

LABEL_90:
    uint64_t v61 = *(void *)v6;
    int v62 = *(_DWORD *)(*(void *)v6 + 104LL);
    if (v62 && (*(_WORD *)v47 & 0xB000 | 0x4000) == 0x6000
      || *(_DWORD *)(v61 + 108) && ((int v63 = *(_WORD *)v47 & 0xF000, v63 == 49152) || v63 == 4096))
    {
      if (v6[65] <= 27)
      {
        if ((v37 & 4) != 0)
        {
          if (v44)
          {
            int v67 = *((_DWORD *)v44 + 9);
          }

          else
          {
            if (dword_100058FD8)
            {
              int v88 = *__error();
              uint64_t v89 = (os_log_s *)qword_100058FE8;
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)stat buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_INFO,  "same device without last entry",  buf,  2u);
              }

              *__error() = v88;
              uint64_t v44 = v146;
              uint64_t v36 = v147;
            }

            sub_100021A18("same device without last entry");
            int v67 = 0;
          }

          goto LABEL_114;
        }

        if (sub_100020708(v6, v5, &v153))
        {
          int v67 = v153;
LABEL_114:
          HIDWORD(v145[19 * v36 + 4]) = v67;
          goto LABEL_115;
        }

        if (!dword_100058FD8) {
          goto LABEL_334;
        }
        int v135 = *__error();
        if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_333;
        }
        goto LABEL_332;
      }
    }

    if (v62 && (*(_WORD *)v47 & 0xB000 | 0x4000) == 0x6000
      || *(_DWORD *)(v61 + 108) && ((int v64 = *(_WORD *)v47 & 0xF000, v64 == 49152) || v64 == 4096))
    {
      if ((v37 & 0x100) != 0)
      {
        if (v44)
        {
          int v65 = *((_DWORD *)v44 + 9);
          if ((v37 & 0x800) != 0) {
            goto LABEL_111;
          }
        }

        else
        {
          if (dword_100058FD8)
          {
            int v86 = *__error();
            char v87 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)stat buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_INFO,  "same device major without last entry",  buf,  2u);
            }

            *__error() = v86;
            uint64_t v44 = v146;
          }

          sub_100021A18("same device major without last entry");
          int v65 = 0;
          if ((v37 & 0x800) != 0) {
            goto LABEL_111;
          }
        }

LABEL_104:
        if (sub_100020708(v6, v5, &v153))
        {
          int v66 = v153;
LABEL_113:
          int v67 = v66 | (v65 << 24);
          uint64_t v36 = v147;
          goto LABEL_114;
        }

        if (dword_100058FD8)
        {
          int v135 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_332;
          }
LABEL_333:
          *__error() = v135;
          goto LABEL_334;
        }

        goto LABEL_334;
      }

      if (sub_100020708(v6, v5, &v153))
      {
        int v65 = v153;
        if ((v37 & 0x800) == 0) {
          goto LABEL_104;
        }
LABEL_111:
        if (sub_10001FB98((uint64_t)v6, v5, (char *)&v151))
        {
          int v66 = v151;
          goto LABEL_113;
        }

        if (dword_100058FD8)
        {
          int v135 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_332;
          }
          goto LABEL_333;
        }

LABEL_334:
        sub_100021980("io_read_int");
        goto LABEL_267;
      }

      if (!dword_100058FD8) {
        goto LABEL_334;
      }
      int v135 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_333;
      }
LABEL_332:
      sub_10003C7E8();
      goto LABEL_333;
    }

LABEL_115:
    if ((*(_WORD *)v47 & 0xF000) == 0xA000 && *(_DWORD *)(*(void *)v6 + 84LL))
    {
      if (!sub_10002070C((uint64_t)v6, v5, &v157))
      {
        if (dword_100058FD8)
        {
          int v136 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003F534();
          }
          *__error() = v136;
        }

        sub_100021980("io_read_size");
        goto LABEL_267;
      }

      if (!v157)
      {
        if (dword_100058FD8)
        {
          int v137 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003F560();
          }
          *__error() = v137;
        }

        sub_100021850("empty link name");
        goto LABEL_267;
      }

      uint64_t v68 = (char *)calloc(v157 + 1, 1uLL);
      if (!v68)
      {
        if (dword_100058FD8)
        {
          int v138 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003C370();
          }
          *__error() = v138;
        }

        int v124 = "calloc";
LABEL_217:
        sub_1000218D4(v124, v7, v8, v9, v10, v11, v12, v13, v142);
        goto LABEL_267;
      }

      uint64_t v69 = v68;
      if (!sub_10001FC1C((uint64_t)v6, v5, v68, v157))
      {
        free(v69);
        if (dword_100058FD8)
        {
          int v139 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_305:
          }
            sub_10003F3E8();
LABEL_306:
          *__error() = v139;
        }

LABEL_307:
        sub_100021980("io_read_buf");
        goto LABEL_267;
      }

      uint64_t v70 = (unsigned int (*)(char *, char *, uint64_t))*((void *)v6 + 29);
      uint64_t v71 = (char *)&v145[19 * v36];
      uint64_t v72 = (char **)(v71 + 88);
      if (!v70) {
        goto LABEL_127;
      }
      if (v70(v69, v71 + 88, 1LL))
      {
        free(v69);
        if (dword_100058FD8)
        {
          int v141 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003F58C();
          }
          *__error() = v141;
        }

        sub_100021980("symlink_filter");
        goto LABEL_267;
      }

      if (*v72) {
        free(v69);
      }
      else {
LABEL_127:
      }
        *uint64_t v72 = v69;
      int v43 = v145;
      uint64_t v44 = v146;
    }

    if (*(_DWORD *)(*(void *)v6 + 200LL) && v6[65] <= 27 && (*(_WORD *)v47 & 0xF000) == 0x8000) {
      v37 |= 0x200u;
    }
    if ((v37 & 0x200) != 0)
    {
      if ((v37 & 0x400) != 0)
      {
        if (v44)
        {
          uint64_t v73 = *((void *)v44 + 8);
        }

        else
        {
          if (dword_100058FD8)
          {
            int v74 = *__error();
            __int16 v75 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)stat buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_INFO,  "same device without last entry",  buf,  2u);
            }

            *__error() = v74;
            uint64_t v36 = v147;
          }

          sub_100021A18("same device without last entry");
          uint64_t v73 = 0LL;
        }
      }

      else
      {
        if (!sub_1000205E8((uint64_t)v6, v5, &v154))
        {
          if (dword_100058FD8)
          {
            int v129 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              goto LABEL_310;
            }
            goto LABEL_311;
          }

          goto LABEL_312;
        }

        uint64_t v73 = v154;
      }

      uint64_t v76 = &v43[19 * v36];
      v76[8] = v73;
      if (!sub_1000204E4((uint64_t)v6, v5, v76 + 9))
      {
        if (dword_100058FD8)
        {
          int v129 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_310:
          }
            sub_10003F4DC();
LABEL_311:
          *__error() = v129;
        }

        goto LABEL_312;
      }
    }

    if (dword_100058FD8)
    {
      int v83 = *__error();
      unsigned int v84 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v90 = *v148;
        uint64_t v91 = *v46;
        unint64_t v92 = &v43[19 * v147];
        uint64_t v93 = v92[6];
        int v94 = *(unsigned __int16 *)v47;
        LODWORD(v92) = *((_DWORD *)v92 + 9);
        *(_DWORD *)stat buf = 136316674;
        *(void *)&uint8_t buf[4] = v90;
        __int16 v163 = 2048;
        uint64_t v164 = v91;
        __int16 v165 = 2048;
        uint64_t v166 = v93;
        __int16 v167 = 1024;
        int v168 = v94;
        __int16 v169 = 1024;
        unsigned int v170 = v92 >> 24;
        __int16 v171 = 1024;
        unsigned int v172 = v92 & 0xFFFFFF;
        __int16 v173 = 1024;
        int v174 = v37;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEBUG,  "%s: received file metadata: size %jd, mtime %jd, mode %o, rdev (%d, %d), flag %x",  buf,  0x38u);
      }

      *__error() = v83;
      uint64_t v36 = v147;
    }

    sub_100021744( 2,  "%s: received file metadata: size %jd, mtime %jd, mode %o, rdev (%d, %d), flag %x",  v77,  v78,  v79,  v80,  v81,  v82,  (char)*v148);
    int v85 = *(_WORD *)v47 & 0xF000;
    if ((v85 | 0x2000) == 0xA000) {
      *((void *)v6 + 5) += *v46;
    }
    if (*(_DWORD *)(*(void *)v6 + 16LL)
      && (v85 == 0x8000 || v6[65] <= 27)
      && !sub_10001FC1C((uint64_t)v6, v5, (char *)&v43[19 * v36 + 12], 0x10uLL))
    {
      if (dword_100058FD8)
      {
        int v139 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_305;
        }
        goto LABEL_306;
      }

      goto LABEL_307;
    }
  }

  if (dword_100058FD8)
  {
    int v129 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_310;
    }
    goto LABEL_311;
  }

LABEL_312:
  sub_100021980("io_read_long");
LABEL_267:
  sub_10001E1A8((void **)v150, v156);
  sub_10001E1A8((void **)v149, v155);
  uint64_t result = 0LL;
  *a5 = 0LL;
  *a4 = 0LL;
  return result;
}

_WORD *sub_100016FF4(_WORD *result, uint64_t a2)
{
  __int16 v2 = *(_WORD *)(a2 + 24);
  if ((v2 & 0xF000) == 0x4000)
  {
    __int16 v3 = v2 & ~result[104] | result[105] | result[106];
  }

  else
  {
    __int16 v3 = v2 & ~result[107] | result[108];
    if ((v2 & 0x49) != 0) {
      v3 |= result[109];
    }
  }

  *(_WORD *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_10001704C(uint64_t a1, uint64_t a2)
{
  __int16 v3 = *(const char **)(a1 + 16);
  unint64_t v4 = *(const char **)(a2 + 16);
  int v5 = *(unsigned __int8 *)v3;
  if (v5 == 46 && !v3[1]) {
    return 0xFFFFFFFFLL;
  }
  int v6 = *(unsigned __int8 *)v4;
  if (v6 == 46 && !v4[1]) {
    return 1LL;
  }
  while (v5 == v6)
  {
    if (!v5) {
      return 0LL;
    }
    int v8 = *(unsigned __int8 *)++v3;
    int v5 = v8;
    int v9 = *(unsigned __int8 *)++v4;
    int v6 = v9;
  }

  int v10 = *(_WORD *)(a1 + 24) & 0xF000;
  if (v5 || v10 != 0x4000)
  {
    if (v6) {
      uint64_t v11 = v4;
    }
    else {
      uint64_t v11 = "/";
    }
    if ((*(_WORD *)(a2 + 24) & 0xF000) == 0x4000) {
      unint64_t v4 = v11;
    }
  }

  else
  {
    __int16 v3 = "/";
  }

  uint64_t v12 = strrchr(v3, 47);
  uint64_t v13 = strrchr(v4, 47);
  if (v10 == 0x4000 && !v12) {
    uint64_t v12 = (char *)&v3[strlen(v3)];
  }
  if (!v13)
  {
    if ((*(_WORD *)(a2 + 24) & 0xF000) != 0x4000)
    {
      BOOL v15 = 0;
      BOOL v14 = v12 != 0LL;
LABEL_35:
      if (v14) {
        uint64_t result = 1LL;
      }
      else {
        uint64_t result = 0xFFFFFFFFLL;
      }
      if (v14 || v15) {
        return result;
      }
      goto LABEL_40;
    }

    uint64_t v13 = (char *)&v4[strlen(v4)];
  }

  BOOL v14 = v12 != 0LL;
  BOOL v15 = v13 != 0LL;
  if (!v12 || !v13) {
    goto LABEL_35;
  }
  if (v12 - v3 >= v13 - v4) {
    int64_t v16 = v13 - v4;
  }
  else {
    int64_t v16 = v12 - v3;
  }
  if (strncmp(v3, v4, v16 + 1))
  {
LABEL_40:
    int v18 = *(unsigned __int8 *)v3;
    for (int i = *(unsigned __int8 *)v4; v18 == i; int i = v21)
    {
      if (!v18) {
        return 0LL;
      }
      int v20 = *(unsigned __int8 *)++v3;
      int v18 = v20;
      int v21 = *(unsigned __int8 *)++v4;
    }

    if (v10 != 0x4000 || v18)
    {
      if ((*(_WORD *)(a2 + 24) & 0xF000) == 0x4000)
      {
        if (i) {
          uint64_t v22 = v4;
        }
        else {
          uint64_t v22 = "/";
        }
        int i = *(unsigned __int8 *)v22;
      }
    }

    else
    {
      __int16 v3 = "/";
    }

    return *(unsigned __int8 *)v3 - i;
  }

  if (v10 == 0x4000 && (*(_WORD *)(a2 + 24) & 0xF000) == 0x4000)
  {
    size_t v17 = strlen(v3);
    if (v17 > strlen(v4)) {
      return 1LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t v23 = &v3[(int)v16 + 1];
  size_t v24 = &v4[(int)v16 + 1];
  unsigned __int16 v25 = strrchr(v23, 47);
  uint64_t v26 = strrchr(v24, 47);
  if (!v25 && v26) {
    return 0xFFFFFFFFLL;
  }
  if (v25 && !v26) {
    return 1LL;
  }
  return strcmp(v23, v24);
}

uint64_t sub_1000172B4(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a1 + 16), *(const char **)(a2 + 16));
}

uint64_t sub_1000172C0(uint64_t a1, size_t a2, char **a3, uint64_t a4)
{
  if (!a2) {
    sub_10003F5B8();
  }
  uint64_t v4 = a4;
  size_t v6 = a2;
  uint64_t v7 = a1;
  if (*(_DWORD *)(*(void *)a1 + 32LL))
  {
    int v8 = 0;
    do
    {
      if (**a3) {
        int v9 = *a3;
      }
      else {
        int v9 = ".";
      }
      sub_10002B718(v9);
      if (*(_DWORD *)(*(void *)v7 + 188LL) && !sub_100019840(v9, v4))
      {
        if (dword_100058FD8)
        {
          int v58 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003F6C0();
          }
          *__error() = v58;
        }

        sub_1000218D4("flist_append_dirs", v10, v11, v12, v13, v14, v15, v16, v132);
        goto LABEL_72;
      }

      ++a3;
      --v6;
    }

    while (v6);
    if (dword_100058FD8)
    {
      int v23 = *__error();
      size_t v24 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = *(void *)(v4 + 8);
        buf.__int16 st_dev = 134217984;
        *(void *)&buf.st_mode = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "recursively generated %zu filenames",  (uint8_t *)&buf,  0xCu);
      }

      *__error() = v23;
    }

    sub_100021744(1, "recursively generated %zu filenames", v17, v18, v19, v20, v21, v22, *(void *)(v4 + 8));
    if (!v8) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }

  sub_10002B718(".");
  uint64_t v26 = calloc(v6, 0x98uLL);
  *(void *)uint64_t v4 = v26;
  if (!v26)
  {
    if (dword_100058FD8)
    {
      int v59 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C370();
      }
      *__error() = v59;
    }

    sub_1000218D4("calloc", v27, v28, v29, v30, v31, v32, v33, v132);
LABEL_72:
    if (*(void *)(v7 + 240)) {
      goto LABEL_73;
    }
    return 0LL;
  }

  uint64_t v34 = 0LL;
  *(void *)(v4 + 8) = 0LL;
  *(void *)(v4 + 16) = v6;
  do
  {
    if (*a3[v34]) {
      int v35 = a3[v34];
    }
    else {
      int v35 = ".";
    }
    if (*(_DWORD *)(*(void *)v7 + 64LL)) {
      int v36 = stat(v35, &buf);
    }
    else {
      int v36 = lstat(v35, &buf);
    }
    if (v36 == -1)
    {
      ++*(void *)(v7 + 240);
      if (dword_100058FD8)
      {
        int v60 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F634();
        }
        *__error() = v60;
      }

      sub_1000218D4("'%s': (l)stat", v37, v38, v39, v40, v41, v42, v43, (char)v35);
      goto LABEL_71;
    }

    int v44 = buf.st_mode & 0xF000;
    if (v44 == 0x4000 && !*(_DWORD *)(*(void *)v7 + 192LL))
    {
      if (!dword_100058FD8)
      {
        uint64_t v53 = "%s: skipping directory";
        goto LABEL_43;
      }

      int v51 = *__error();
      uint64_t v54 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int v137 = 136315138;
        int v138 = v35;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%s: skipping directory", v137, 0xCu);
      }

      uint64_t v53 = "%s: skipping directory";
LABEL_40:
      *__error() = v51;
LABEL_43:
      sub_100021AB0(v53, v35);
      goto LABEL_44;
    }

    if (sub_10002BBB4(v35, v44 == 0x4000, 0, 0) == -1)
    {
      if (!dword_100058FD8)
      {
        sub_100021AB0("%s: skipping excluded file");
LABEL_44:
        uint64_t v4 = a4;
        goto LABEL_45;
      }

      int v51 = *__error();
      int v52 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int v137 = 136315138;
        int v138 = v35;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s: skipping excluded file", v137, 0xCu);
      }

      uint64_t v53 = "%s: skipping excluded file";
      goto LABEL_40;
    }

    if (!sub_10001ADE0((uint64_t *)v7, &buf.st_dev, v35, v4))
    {
      if (dword_100058FD8)
      {
        int v61 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F694();
        }
        *__error() = v61;
      }

      sub_100021980("flist_append");
LABEL_71:
      sub_1000148EC(*(char **)v4, v6);
      *(void *)uint64_t v4 = 0LL;
      goto LABEL_72;
    }

LABEL_45:
    ++v34;
  }

  while (v6 != v34);
  if (dword_100058FD8)
  {
    int v55 = *__error();
    int v56 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
    {
      uint64_t v57 = *(char **)(v4 + 8);
      *(_DWORD *)int v137 = 134217984;
      int v138 = v57;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_INFO,  "non-recursively generated %zu filenames",  v137,  0xCu);
    }

    *__error() = v55;
  }

  sub_100021744(1, "non-recursively generated %zu filenames", v45, v46, v47, v48, v49, v50, *(void *)(v4 + 8));
LABEL_73:
  uint64_t result = sub_100004448(v7, (uint64_t *)v4);
  if ((_DWORD)result)
  {
    else {
      int v63 = (int (__cdecl *)(const void *, const void *))sub_10001704C;
    }
    qsort(*(void **)v4, *(void *)(v4 + 8), 0x98uLL, v63);
    size_t v64 = *(void *)(v4 + 8);
    if (!v64) {
      return 1LL;
    }
    uint64_t v134 = *(void *)v7;
    int v65 = (const char **)calloc(v64, 0x98uLL);
    if (v65)
    {
      uint64_t v73 = v65;
      if (*(void *)(v4 + 8) == 1LL)
      {
        unint64_t v74 = 0LL;
        uint64_t v75 = 0LL;
      }

      else
      {
        uint64_t v133 = v7;
        unint64_t v74 = 0LL;
        uint64_t v75 = 0LL;
        uint64_t v78 = v65;
        do
        {
          uint64_t v79 = *(char **)v4;
          uint64_t v80 = (const char **)(*(void *)v4 + 152 * v74);
          uint64_t v81 = v80 + 2;
          uint64_t v82 = v80[2];
          if (strcmp(v82, v80[21]) || !strcmp(v82, "."))
          {
            __int128 v83 = *((_OWORD *)v80 + 1);
            *(_OWORD *)uint64_t v78 = *(_OWORD *)v80;
            *((_OWORD *)v78 + 1) = v83;
            __int128 v84 = *((_OWORD *)v80 + 2);
            __int128 v85 = *((_OWORD *)v80 + 3);
            __int128 v86 = *((_OWORD *)v80 + 5);
            *((_OWORD *)v78 + 4) = *((_OWORD *)v80 + 4);
            *((_OWORD *)v78 + 5) = v86;
            *((_OWORD *)v78 + 2) = v84;
            *((_OWORD *)v78 + 3) = v85;
            __int128 v87 = *((_OWORD *)v80 + 6);
            __int128 v88 = *((_OWORD *)v80 + 7);
            __int128 v89 = *((_OWORD *)v80 + 8);
            v78[18] = v80[18];
            *((_OWORD *)v78 + 7) = v88;
            *((_OWORD *)v78 + 8) = v89;
            *((_OWORD *)v78 + 6) = v87;
            ++v74;
          }

          else
          {
            uint64_t v90 = *v80;
            int v135 = (void **)(v80 + 19);
            uint64_t v91 = v80[19];
            if (strcmp(*v80, v91))
            {
              if (dword_100058FD8)
              {
                int v127 = *__error();
                int v128 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
                {
                  int v129 = *v81;
                  __darwin_ino64_t v130 = (__darwin_ino64_t)*v80;
                  int v131 = *v135;
                  buf.__int16 st_dev = 136315650;
                  *(void *)&buf.st_mode = v129;
                  WORD2(buf.st_ino) = 2080;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v130;
                  HIWORD(buf.st_gid) = 2080;
                  *(void *)&buf.st_rdev = v131;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_ERROR,  "%s: duplicate working path for possibly different file: '%s' '%s'",  (uint8_t *)&buf,  0x20u);
                }

                *__error() = v127;
                uint64_t v82 = *v81;
                uint64_t v90 = *v80;
                uint64_t v91 = (const char *)*v135;
              }

              sub_100021850("%s: duplicate working path for possibly different file: '%s' '%s'", v82, v90, v91);
              free(v73);
              uint64_t v4 = a4;
              goto LABEL_87;
            }

            __int128 v92 = *((_OWORD *)v80 + 1);
            *(_OWORD *)uint64_t v78 = *(_OWORD *)v80;
            *((_OWORD *)v78 + 1) = v92;
            __int128 v93 = *((_OWORD *)v80 + 2);
            __int128 v94 = *((_OWORD *)v80 + 3);
            __int128 v95 = *((_OWORD *)v80 + 5);
            *((_OWORD *)v78 + 4) = *((_OWORD *)v80 + 4);
            *((_OWORD *)v78 + 5) = v95;
            *((_OWORD *)v78 + 2) = v93;
            *((_OWORD *)v78 + 3) = v94;
            __int128 v96 = *((_OWORD *)v80 + 6);
            __int128 v97 = *((_OWORD *)v80 + 7);
            __int128 v98 = *((_OWORD *)v80 + 8);
            v78[18] = v80[18];
            *((_OWORD *)v78 + 7) = v97;
            *((_OWORD *)v78 + 8) = v98;
            *((_OWORD *)v78 + 6) = v96;
            uint64_t v4 = a4;
            if (!*(_DWORD *)(v134 + 188) && (*(_WORD *)&v79[152 * v74 + 24] & 0xF000) != 0x4000)
            {
              if (dword_100058FD8)
              {
                int v99 = *__error();
                uint64_t v100 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
                {
                  uint64_t v101 = *v81;
                  uint64_t v102 = *v80;
                  buf.__int16 st_dev = 136315394;
                  *(void *)&buf.st_mode = v101;
                  WORD2(buf.st_ino) = 2080;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v102;
                  _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_INFO,  "%s: duplicate path: %s",  (uint8_t *)&buf,  0x16u);
                }

                *__error() = v99;
              }

              sub_100021AB0("%s: duplicate path: %s", *v81, *v80);
            }

            free(*v135);
            uint64_t v103 = &v79[152 * v74 + 152];
            free(*((void **)v103 + 11));
            *((void *)v103 + 11) = 0LL;
            *int v135 = 0LL;
            v74 += 2LL;
          }

          ++v75;
          unint64_t v104 = *(void *)(v4 + 8) - 1LL;
          v78 += 19;
        }

        while (v74 < v104);
        uint64_t v7 = v133;
        if (v74 != v104) {
          goto LABEL_108;
        }
      }

      uint64_t v105 = &v73[19 * v75++];
      uint64_t v106 = *(void *)v4 + 152 * v74;
      __int128 v107 = *(_OWORD *)(v106 + 16);
      *(_OWORD *)uint64_t v105 = *(_OWORD *)v106;
      *((_OWORD *)v105 + 1) = v107;
      __int128 v108 = *(_OWORD *)(v106 + 32);
      __int128 v109 = *(_OWORD *)(v106 + 48);
      __int128 v110 = *(_OWORD *)(v106 + 80);
      *((_OWORD *)v105 + 4) = *(_OWORD *)(v106 + 64);
      *((_OWORD *)v105 + 5) = v110;
      *((_OWORD *)v105 + 2) = v108;
      *((_OWORD *)v105 + 3) = v109;
      __int128 v111 = *(_OWORD *)(v106 + 96);
      __int128 v112 = *(_OWORD *)(v106 + 112);
      __int128 v113 = *(_OWORD *)(v106 + 128);
      v105[18] = *(const char **)(v106 + 144);
      *((_OWORD *)v105 + 7) = v112;
      *((_OWORD *)v105 + 8) = v113;
      *((_OWORD *)v105 + 6) = v111;
LABEL_108:
      free(*(void **)v4);
      *(void *)uint64_t v4 = v73;
      *(void *)(v4 + 8) = v75;
      if (!v75) {
        sub_10003F60C();
      }
      if (*(_DWORD *)(*(void *)v7 + 32LL) || *(_DWORD *)(*(void *)v7 + 192LL))
      {
        int v120 = 0LL;
        do
        {
          if (((_WORD)v73[3] & 0xF000) == 0x4000)
          {
            if (!v120 || (size_t v121 = strlen(*v120), v122 = *v73, strncmp(*v120, *v73, v121)) || v122[v121] != 47)
            {
              int v123 = v73[2];
              if (*(_DWORD *)(*(void *)v7 + 32LL)
                || !strcmp(v73[2], ".")
                || (int v124 = strrchr(v123, 47)) != 0LL
                && ((int v126 = v124[1], v125 = v124 + 1, !v126) || !strcmp(v125, ".")))
              {
                *((_DWORD *)v73 + 14) |= 1u;
                sub_100021744(3, "%s: top-level", v114, v115, v116, v117, v118, v119, (char)v123);
                int v120 = v73;
              }
            }
          }

          v73 += 19;
          --v75;
        }

        while (v75);
      }

      return 1LL;
    }

    else
    {
      if (dword_100058FD8)
      {
        int v76 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003C370();
        }
        *__error() = v76;
      }

      sub_1000218D4("calloc", v66, v67, v68, v69, v70, v71, v72, v132);
LABEL_87:
      if (dword_100058FD8)
      {
        int v77 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F5E0();
        }
        *__error() = v77;
      }

      sub_100021980("flist_dedupe");
      sub_1000148EC(*(char **)v4, *(void *)(v4 + 8));
      uint64_t result = 0LL;
      *(void *)uint64_t v4 = 0LL;
    }
  }

  return result;
}

    v39.key = (char *)fts_open((char *const *)v23, 16, 0LL);
    if (!v39.key)
    {
      if (dword_100058FD8)
      {
        __int128 v92 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F718();
        }
        *__error() = v92;
      }

      v39.key = "fts_open";
      goto LABEL_141;
    }

    uint64_t v50 = v39.key;
    int v51 = strlen(a2);
    *__error() = 0;
    int v52 = fts_read((FTS *)v50);
    if (!v52)
    {
LABEL_120:
      if (*__error())
      {
        if (dword_100058FD8)
        {
          uint64_t v90 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003F744();
          }
          *__error() = v90;
        }

        uint64_t v91 = "fts_read";
LABEL_150:
        sub_1000218D4(v91, v61, v62, v63, v64, v65, v66, v67, (char)v103);
LABEL_151:
        uint64_t v33 = 0LL;
      }

      else
      {
        if (v109[65] < 29) {
          __int128 v95 = (int (__cdecl *)(const void *, const void *))sub_100014344;
        }
        else {
          __int128 v95 = (int (__cdecl *)(const void *, const void *))sub_10001704C;
        }
        qsort(*v106, *v107, 0x98uLL, v95);
        uint64_t v33 = 1LL;
      }

      fts_close((FTS *)v50);
      int v23 = (const char **)v108;
      if (v11)
      {
LABEL_155:
        __int128 v97 = (void **)v23;
        do
        {
          __int128 v98 = *v97++;
          free(v98);
          --v11;
        }

        while (v11);
      }

      goto LABEL_157;
    }

    uint64_t v53 = v52;
    uint64_t v54 = 0;
    __sa = 0LL;
    int v55 = "./";
    int v56 = v51 + 1;
    while (1)
    {
      fts_info = v53->fts_info;
      if (fts_info != 10)
      {
        if (!v54 || fts_info != 6)
        {
          int v58 = v55;
          if (fts_info == 6 || sub_1000143C4(v109, (uint64_t)v53, 1))
          {
            if (v56 < v53->fts_pathlen)
            {
              if (!v53->fts_statp) {
                sub_10003F770();
              }
              if (*(_DWORD *)(*(void *)v109 + 124LL))
              {
                int v59 = v7;
                int v60 = v6;
                if (v6)
                {
                  while (stat(*v59, &buf) != -1)
                  {
                    if (v53->fts_statp->st_dev == buf.st_dev) {
                      goto LABEL_62;
                    }
                    v59 += 19;
                    if (!--v60) {
                      goto LABEL_79;
                    }
                  }

                  if (dword_100058FD8)
                  {
                    __int128 v96 = *__error();
                    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                      sub_10003F7C0();
                    }
                    *__error() = v96;
                  }

                  uint64_t v103 = *v59;
                  uint64_t v91 = "%s: stat";
                  goto LABEL_150;
                }

                goto LABEL_79;
              }

uint64_t sub_100017D88(int *a1, const char *a2, void **a3, size_t *a4, uint64_t a5, size_t a6)
{
  unint64_t v112 = 0LL;
  *a3 = 0LL;
  *a4 = 0LL;
  if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
    return 1LL;
  }
  size_t v6 = a6;
  if (!a6) {
    return 1LL;
  }
  uint64_t v7 = (const char **)a5;
  unint64_t v11 = 0LL;
  uint64_t v12 = (int *)(a5 + 56);
  size_t v13 = a6;
  do
  {
    int v14 = *v12;
    v12 += 38;
    v11 += v14 & 1;
    --v13;
  }

  while (v13);
  if (!v11) {
    return 1LL;
  }
  uint64_t v15 = (const char **)calloc(v11 + 1, 8uLL);
  if (v15)
  {
    int v23 = v15;
    __int128 v109 = a1;
    uint64_t v106 = a3;
    __int128 v107 = a4;
    if (v6)
    {
      uint64_t v24 = 0LL;
      unint64_t v25 = 0LL;
      while (1)
      {
        uint64_t v26 = (char **)&v23[v25];
        if (asprintf(v26, "%s/%s", a2, v7[19 * v24 + 2]) == -1)
        {
          if (dword_100058FD8)
          {
            int v89 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003C0F8();
            }
            *__error() = v89;
          }

          sub_1000218D4("asprintf", v27, v17, v18, v19, v20, v21, v22, v102);
          uint64_t v33 = 0LL;
          *uint64_t v26 = 0LL;
          goto LABEL_155;
        }

        uint64_t v28 = v7;
        size_t v29 = v6;
        uint64_t v30 = *v26;
        uint64_t v31 = v23;
        unint64_t v32 = v25;
        if (v25) {
          break;
        }
LABEL_15:
        if (!v30) {
          goto LABEL_18;
        }
        sub_100021744(3, "%s: will scan for deletions", v17, v18, v19, v20, v21, v22, (char)v30);
        ++v25;
LABEL_19:
        int v23 = v31;
        size_t v6 = v29;
        uint64_t v7 = v28;
LABEL_20:
        if (++v24 >= v6 || v25 >= v11) {
          goto LABEL_31;
        }
      }

      while (strcmp(*v23, v30))
      {
        ++v23;
        if (!--v32) {
          goto LABEL_15;
        }
      }

      free(v30);
      *uint64_t v26 = 0LL;
LABEL_18:
      --v11;
      goto LABEL_19;
    }

    unint64_t v25 = 0LL;
LABEL_31:
    v23[v25] = 0LL;
    if (dword_100058FD8)
    {
      int v36 = v23;
      int v37 = *__error();
      uint64_t v38 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        buf.__int16 st_dev = 134217984;
        *(void *)&buf.st_mode = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "delete from %zu directories",  (uint8_t *)&buf,  0xCu);
      }

      *__error() = v37;
      int v23 = v36;
    }

    sub_100021744(1, "delete from %zu directories", v17, v18, v19, v20, v21, v22, v11);
    if (!hcreate(v6))
    {
      if (dword_100058FD8)
      {
        int v88 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F6EC();
        }
        *__error() = v88;
      }

      v39.key = "hcreate";
      goto LABEL_141;
    }

    __int128 v108 = (char **)v23;
    if (v6)
    {
      uint64_t v46 = 0LL;
      while (1)
      {
        uint64_t v47 = v7[19 * v46 + 2];
        do
        {
          int v48 = strncmp(v47, "./", 2uLL);
          v47 += 2;
        }

        while (!v48);
        v39.key = strdup(v47 - 2);
        if (!v39.key) {
          break;
        }
        key = v39.key;
        v39.int data = 0LL;
        v39.key = (char *)hsearch(v39, ENTER);
        if (!v39.key)
        {
          if (dword_100058FD8)
          {
            int v94 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003F824();
            }
            *__error() = v94;
          }

          v39.key = "hsearch";
          goto LABEL_141;
        }

        if (++v46 == v6) {
          goto LABEL_45;
        }
      }

      if (dword_100058FD8)
      {
        int v93 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003CD2C();
        }
        *__error() = v93;
      }

      v39.key = "strdup";
LABEL_141:
      sub_1000218D4(v39.key, (uint64_t)v39.data, v40, v41, v42, v43, v44, v45, (char)v103);
      uint64_t v33 = 0LL;
      if (v11) {
        goto LABEL_155;
      }
LABEL_157:
      free(v23);
      hdestroy();
      return v33;
    }

LABEL_62:
              fts_path = v53->fts_path;
              uint64_t v69 = &fts_path[v56];
              uint64_t v70 = (uint64_t)&fts_path[v56 + 1];
              int v71 = fts_path[v56];
              if (v71 == 47) {
                ++v56;
              }
              unint64_t v105 = v56;
              uint64_t v72 = &fts_path[v56];
              if (v71 == 47) {
                uint64_t v73 = v70;
              }
              else {
                uint64_t v73 = (uint64_t)v69;
              }
              unint64_t v74 = (char *)(v73 - 2);
              int v55 = v58;
              do
              {
                int v75 = strncmp(v72, v58, 2uLL);
                v72 += 2;
                v74 += 2;
              }

              while (!v75);
              int v76 = v53->fts_info;
              if (*(_DWORD *)(*(void *)v109 + 100LL))
              {
LABEL_70:
                if (v76 == 1 && __sa != 0LL) {
                  goto LABEL_104;
                }
              }

              else if (v76 != 6)
              {
                uint64_t v79 = (char *)(v72 - 2);
                if (sub_10002BBB4(v79, v76 == 1, 1, __sa != 0LL) == -1)
                {
                  if (dword_100058FD8)
                  {
                    unint64_t v104 = v79;
                    int v80 = *__error();
                    uint64_t v81 = (os_log_s *)qword_100058FE8;
                    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)__int128 v113 = 136315138;
                      uint64_t v114 = v74;
                      _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_INFO,  "skip excluded file %s",  v113,  0xCu);
                    }

                    *__error() = v80;
                    int v55 = v58;
                    uint64_t v79 = v104;
                  }

                  sub_100021AB0("skip excluded file %s", v79);
                  if (v53->fts_info == 1) {
                    int v54 = 1;
                  }
                  ++v53->fts_parent->fts_number;
                  fts_set((FTS *)v50, v53, 4);
                  goto LABEL_104;
                }

                int v76 = v53->fts_info;
                goto LABEL_70;
              }

              v116.key = v74;
              v116.int data = 0LL;
              if (hsearch(v116, FIND)) {
                goto LABEL_104;
              }
              int v78 = v53->fts_info;
              if (v78 == 1)
              {
                __sa = (char *)v53;
LABEL_104:
                unint64_t v56 = v105;
                goto LABEL_105;
              }

              if (v53 == (FTSENT *)__sa)
              {
                if (v78 != 6) {
                  sub_10003F798();
                }
                __sa = 0LL;
              }

              else if (v78 != 6)
              {
                goto LABEL_107;
              }

              if (v53->fts_number >= 1)
              {
                if (dword_100058FD8)
                {
                  int v82 = *__error();
                  __int128 v83 = (os_log_s *)qword_100058FE8;
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
                  {
                    __int128 v84 = v53->fts_path;
                    *(_DWORD *)__int128 v113 = 136315138;
                    uint64_t v114 = v84;
                    _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_INFO,  "%s: not empty, cannot delete",  v113,  0xCu);
                  }

                  *__error() = v82;
                }

                sub_100021AB0("%s: not empty, cannot delete", v53->fts_path);
                ++v53->fts_parent->fts_number;
                int v55 = v58;
                goto LABEL_104;
              }

LABEL_107:
              if (!sub_100015684((char **)v106, v107, &v112))
              {
                if (dword_100058FD8)
                {
                  int v99 = *__error();
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                    sub_10003F338();
                  }
                  *__error() = v99;
                }

                sub_100021980("flist_realloc");
                goto LABEL_151;
              }

              __int128 v85 = *v106;
              uint64_t v86 = *v107 - 1;
              __int128 v87 = strdup(v53->fts_path);
              v85[19 * v86] = v87;
              if (!v87)
              {
                if (dword_100058FD8)
                {
                  int v100 = *__error();
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                    sub_10003CD2C();
                  }
                  *__error() = v100;
                }

                uint64_t v91 = "strdup";
                goto LABEL_150;
              }

              v85[19 * v86 + 2] = &v87[v105];
              unint64_t v56 = v105;
              sub_100018870((uint64_t)&v85[19 * v86], &v53->fts_statp->st_dev);
LABEL_78:
              *__error() = 0;
            }

LABEL_79:
            int v55 = v58;
            goto LABEL_105;
          }

          if (v53->fts_errno) {
            ++*((void *)v109 + 30);
          }
          ++v53->fts_parent->fts_number;
          goto LABEL_78;
        }

        int v54 = 0;
      }

LABEL_105:
      uint64_t v53 = fts_read((FTS *)v50);
      if (!v53) {
        goto LABEL_120;
      }
    }
  }

  if (dword_100058FD8)
  {
    int v35 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C370();
    }
    *__error() = v35;
  }

  sub_1000218D4("calloc", v16, v17, v18, v19, v20, v21, v22, v101);
  return 0LL;
}

      if (*(void *)(v20 + 24))
      {
        int v55 = 0LL;
        do
          sub_10002731C(v20, *(char **)(*(void *)(v20 + 16) + 8 * v55++), (size_t)v27);
        while (v55 < *(void *)(v20 + 24));
      }

      goto LABEL_108;
    }

double sub_100018870(uint64_t a1, int *a2)
{
  *(_WORD *)(a1 + 24) = *((_WORD *)a2 + 2);
  double result = *((double *)a2 + 2);
  *(double *)(a1 + 28) = result;
  uint64_t v3 = *((void *)a2 + 6);
  *(void *)(a1 + 40) = *((void *)a2 + 12);
  *(void *)(a1 + 48) = v3;
  *(_DWORD *)(a1 + 36) = a2[6];
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)(a1 + 64) = *a2;
  *(void *)(a1 + 72) = v4;
  *(void *)(a1 + 80) = *((unsigned __int16 *)a2 + 3);
  return result;
}

uint64_t sub_1000188AC( uint64_t a1, const char *a2, uint64_t a3, char **a4, unint64_t *a5, unint64_t *a6, int *a7)
{
  if (sub_100015684(a4, a5, a6))
  {
    uint64_t v12 = *a4;
    uint64_t v13 = *a5 - 1;
    int v14 = strdup(a2);
    *(void *)&v12[152 * v13] = v14;
    if (v14)
    {
      uint64_t v22 = &v12[152 * v13];
      *((void *)v22 + 2) = &v14[a3];
      *((_WORD *)v22 + 12) = *((_WORD *)a7 + 2);
      *(void *)(v22 + 28) = *((void *)a7 + 2);
      uint64_t v23 = *((void *)a7 + 6);
      *((void *)v22 + 5) = *((void *)a7 + 12);
      *((void *)v22 + 6) = v23;
      *((_DWORD *)v22 + 9) = a7[6];
      uint64_t v24 = *((void *)a7 + 1);
      *((void *)v22 + 8) = *a7;
      *((void *)v22 + 9) = v24;
      *((void *)v22 + 10) = *((unsigned __int16 *)a7 + 3);
      return 1LL;
    }

    if (dword_100058FD8)
    {
      int v27 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CD2C();
      }
      *__error() = v27;
    }

    sub_1000218D4("strdup", v15, v16, v17, v18, v19, v20, v21, v28);
  }

  else
  {
    if (dword_100058FD8)
    {
      int v26 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F338();
      }
      *__error() = v26;
    }

    sub_100021980("flist_realloc");
  }

  return 0LL;
}

uint64_t sub_100018A20( void *a1, int a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a4)
  {
    uint64_t v10 = *a1;
    if (!*(_DWORD *)(*a1 + 96LL) && !*(_DWORD *)(v10 + 564)) {
      sub_10003F878();
    }
    if (!*(_DWORD *)(v10 + 32) && !*(_DWORD *)(v10 + 564)) {
      sub_10003F8A0();
    }
    if (!a1[30] || *(_DWORD *)(v10 + 568))
    {
      uint64_t v11 = *(void *)(v10 + 592);
      if ((v11 & 0x8000000000000000LL) == 0)
      {
        unint64_t v12 = a4;
        if (v11)
        {
          uint64_t v13 = a1[31];
          if (v11 <= v13 || *((_BYTE *)a1 + 256)) {
            return 1LL;
          }
          unint64_t v12 = a4;
          if (v13 + a4 > v11)
          {
            *((_BYTE *)a1 + 256) = 1;
            unint64_t v12 = v11 - v13;
          }
        }

        unint64_t v84 = v12;
        else {
          uint64_t v14 = -1LL;
        }
        else {
          uint64_t v15 = v12;
        }
        else {
          unint64_t v16 = 0LL;
        }
        unint64_t v17 = v16 - v15;
        if (v16 == v15)
        {
LABEL_24:
          if (a4 > v84) {
            sub_100021744( -1,  "Deletions stopped due to --max-delete limit (%zu skipped)",  a3,  a4,  a5,  a6,  a7,  a8,  a4 - v84);
          }
          return 1LL;
        }

        uint64_t v19 = a3 + 152 * v16;
        uint64_t v20 = &dword_100058FD8;
        while (1)
        {
          if (*v20)
          {
            int v21 = *__error();
            uint64_t v22 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = *(char **)(v19 + 16);
              *(_DWORD *)stat buf = 136315138;
              uint64_t v86 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: deleting", buf, 0xCu);
            }

            *__error() = v21;
          }

          sub_100021744(0, "%s: deleting", a3, a4, a5, a6, a7, a8, *(void *)(v19 + 16));
          uint64_t v24 = *a1;
          if (*(_DWORD *)(*a1 + 36LL)) {
            goto LABEL_72;
          }
          if (a2 == -1) {
            sub_10003F8C8();
          }
          ++a1[31];
          int v25 = *(_WORD *)(v19 + 24) & 0xF000;
          int v26 = v25 == 0x4000;
          if (*(_DWORD *)(v24 + 152))
          {
            if (*(void *)(v24 + 160))
            {
              if (*v20)
              {
                int v27 = v20;
                int v28 = *__error();
                size_t v29 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v72 = *(char **)(v19 + 16);
                  uint64_t v73 = *(char **)(*a1 + 160LL);
                  *(_DWORD *)stat buf = 136315394;
                  uint64_t v86 = v72;
                  __int16 v87 = 2080;
                  int v88 = v73;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s: doing backup-dir to %s",  buf,  0x16u);
                }

                *__error() = v28;
                uint64_t v20 = v27;
              }

              sub_100021744(2, "%s: doing backup-dir to %s", a3, a4, a5, a6, a7, a8, *(void *)(v19 + 16));
              if (snprintf( __str,  0x400uLL,  "%s/%s%s",  *(const char **)(*a1 + 160LL),  *(const char **)(v19 + 16),  *(const char **)(*a1 + 168LL)) >= 1024)
              {
                if (*v20)
                {
                  int v37 = *__error();
                  uint64_t v38 = (os_log_s *)qword_100058FE8;
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
                  {
                    unint64_t v74 = *(char **)(v19 + 16);
                    int v76 = *(char **)(*a1 + 160LL);
                    uint64_t v75 = *(void *)(*a1 + 168LL);
                    *(_DWORD *)stat buf = 136316162;
                    uint64_t v86 = v74;
                    __int16 v87 = 2080;
                    int v88 = v76;
                    __int16 v89 = 2080;
                    int v90 = v74;
                    __int16 v91 = 2080;
                    uint64_t v92 = v75;
                    __int16 v93 = 1024;
                    int v94 = 1024;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s: backup-dir: compound backup path too long: %s/%s%s > %d",  buf,  0x30u);
                  }

                  *__error() = v37;
                }

                sub_1000218D4( "%s: backup-dir: compound backup path too long: %s/%s%s > %d",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  *(void *)(v19 + 16));
                goto LABEL_71;
              }

              if (sub_10000D0FC((uint64_t)a1, a2, (const char **)v19, __str, *(_WORD *)(v19 + 24)) == -1)
              {
                if (*v20)
                {
                  int v58 = *__error();
                  int v59 = (os_log_s *)qword_100058FE8;
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v79 = *(char **)(v19 + 16);
                    *(_DWORD *)stat buf = 136315394;
                    uint64_t v86 = v79;
                    __int16 v87 = 2080;
                    int v88 = __str;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "%s: backup_to_dir: %s",  buf,  0x16u);
                  }

                  *__error() = v58;
                }

                sub_1000218D4("%s: backup_to_dir: %s", v51, v52, v53, v54, v55, v56, v57, *(void *)(v19 + 16));
                goto LABEL_71;
              }
            }

            else if (v25 != 0x4000)
            {
              if (*v20)
              {
                ENTRY v39 = v20;
                int v40 = *__error();
                uint64_t v41 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG))
                {
                  int v78 = *(char **)(v19 + 16);
                  *(_DWORD *)stat buf = 136315138;
                  uint64_t v86 = v78;
                  _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%s: doing backup", buf, 0xCu);
                }

                *__error() = v40;
                uint64_t v20 = v39;
              }

              sub_100021744(2, "%s: doing backup", a3, a4, a5, a6, a7, a8, *(void *)(v19 + 16));
              if (snprintf(__str, 0x400uLL, "%s%s", *(const char **)(v19 + 16), *(const char **)(*a1 + 168LL)) >= 1024)
              {
                if (*v20)
                {
                  int v49 = *__error();
                  uint64_t v50 = (os_log_s *)qword_100058FE8;
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
                  {
                    int v80 = *(char **)(v19 + 16);
                    uint64_t v81 = *(char **)(*a1 + 168LL);
                    *(_DWORD *)stat buf = 136315906;
                    uint64_t v86 = v80;
                    __int16 v87 = 2080;
                    int v88 = v80;
                    __int16 v89 = 2080;
                    int v90 = v81;
                    __int16 v91 = 1024;
                    LODWORD(v92) = 1024;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%s: backup: compound backup path too long: %s%s > %d",  buf,  0x26u);
                  }

                  *__error() = v49;
                }

                sub_1000218D4( "%s: backup: compound backup path too long: %s%s > %d",  v42,  v43,  v44,  v45,  v46,  v47,  v48,  *(void *)(v19 + 16));
                goto LABEL_71;
              }

              if (sub_10000D754(a2, *(const char **)(v19 + 16), a2, __str, 1) == -1)
              {
                if (*v20)
                {
                  int v70 = *__error();
                  int v71 = (os_log_s *)qword_100058FE8;
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
                  {
                    int v82 = *(char **)(v19 + 16);
                    *(_DWORD *)stat buf = 136315394;
                    uint64_t v86 = v82;
                    __int16 v87 = 2080;
                    int v88 = __str;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  "%s: move_file: %s",  buf,  0x16u);
                  }

                  *__error() = v70;
                }

                sub_1000218D4("%s: move_file: %s", v60, v61, v62, v63, v64, v65, v66, *(void *)(v19 + 16));
                goto LABEL_71;
              }
            }
          }

          if (*v20)
          {
            int v68 = *__error();
            uint64_t v69 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
            {
              int v77 = *(char **)(v19 + 16);
              *(_DWORD *)stat buf = 136315138;
              uint64_t v86 = v77;
              _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%s: unlinkat", buf, 0xCu);
            }

            *__error() = v68;
          }

          sub_1000218D4("%s: unlinkat", v67, a3, a4, a5, a6, a7, a8, *(void *)(v19 + 16));
LABEL_71:
          ++a1[30];
LABEL_72:
          v19 += 152 * v14;
          v17 += v14;
          if (!v17) {
            goto LABEL_24;
          }
        }
      }
    }
  }

  return 1LL;
}

void sub_1000191BC(uint64_t a1)
{
  if (*(void *)(*(void *)a1 + 432LL) && *(void *)(a1 + 176))
  {
    uint64_t v2 = 0LL;
    unsigned int v3 = 1;
    do
    {
      free(*(void **)(*(void *)(a1 + 168) + 8 * v2));
      uint64_t v2 = v3;
    }

    while (*(void *)(a1 + 176) > (unint64_t)v3++);
  }

  free(*(void **)(a1 + 168));
  *(void *)(a1 + 168) = 0LL;
  *(void *)(a1 + 176) = 0LL;
}

uint64_t sub_100019220(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  if (!strcmp(*(const char **)(*(void *)a1 + 432LL), "-"))
  {
    unsigned int v3 = __stdinp;
  }

  else if (*(void *)(v2 + 496))
  {
    unsigned int v3 = 0LL;
  }

  else
  {
    unsigned int v3 = fopen(*(const char **)(v2 + 504), "r");
    if (!v3)
    {
      if (dword_100058FD8)
      {
        int v30 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F9B0();
        }
        *__error() = v30;
      }

      sub_1000218D4("fopen ro: '%s'", v4, v5, v6, v7, v8, v9, v10, *(void *)(*(void *)a1 + 432LL));
      return 0LL;
    }
  }

  *(void *)(a1 + 168) = 0LL;
  *(void *)(a1 + 176) = 0LL;
  while (*(void *)(*(void *)a1 + 496LL))
  {
LABEL_11:
    if (!__s[0])
    {
      qsort( *(void **)(a1 + 168),  *(void *)(a1 + 176),  8uLL,  (int (__cdecl *)(const void *, const void *))sub_100019834);
      int v19 = 0;
      if (!v3) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }

  int v11 = fileno(v3);
  if (dword_100058FD8)
  {
    int v20 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F950();
    }
    *__error() = v20;
  }

  sub_1000218D4("fdgets: '%s'", v12, v13, v14, v15, v16, v17, v18, *(void *)(*(void *)a1 + 432LL));
LABEL_20:
  int v19 = 1;
  if (!v3) {
    goto LABEL_23;
  }
LABEL_21:
  if (v3 != __stdinp && fclose(v3) == -1)
  {
    if (dword_100058FD8)
    {
      int v29 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F8F0();
      }
      *__error() = v29;
    }

    sub_1000218D4("fclose: '%s'", v21, v22, v23, v24, v25, v26, v27, *(void *)(*(void *)a1 + 432LL));
    goto LABEL_30;
  }

LABEL_23:
  if (!v19) {
    return 1LL;
  }
LABEL_30:
  sub_1000191BC(a1);
  return 0LL;
}

uint64_t sub_1000194CC(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v6 = 0LL;
  ssize_t v7 = 1LL;
  while (v7 == 1 && v6 <= 0x3FF)
  {
    uint64_t v8 = (_BYTE *)(a3 + v6);
    while (1)
    {
      ssize_t v7 = read(a2, (void *)(a3 + v6), 1uLL);
      if (v7 != -1) {
        break;
      }
      if (*__error() != 35 && *__error() != 4 && *__error() != 35)
      {
        if (dword_100058FD8)
        {
          int v16 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003FA10();
          }
          *__error() = v16;
        }

        sub_1000218D4("read(2) of files-from file failed", v9, v10, v11, v12, v13, v14, v15, v18);
        return 0xFFFFFFFFLL;
      }
    }

    ++v6;
    if (!*v8) {
      return v6;
    }
    if (*v8 == 10 && !*(_DWORD *)(*(void *)a1 + 440LL))
    {
      *(_BYTE *)(a3 + v6 - 1) = 0;
      return v6;
    }
  }

  return v6;
}

uint64_t sub_1000195F0(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (__s[v4 - 1] == 10) {
    __s[v4 - 1] = 0;
  }
  int v5 = *__s;
  uint64_t result = 1LL;
  if (v5 != 35 && v5 != 59)
  {
    if (!strncmp(__s, "..", 2uLL))
    {
      if (dword_100058FD8)
      {
        int v7 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_12:
        }
          sub_10003FA3C();
LABEL_13:
        *__error() = v7;
      }
    }

    else
    {
      if (!strstr(__s, "/.."))
      {
        uint64_t v8 = (char **)realloc(*(void **)(a1 + 168), 8LL * *(void *)(a1 + 176) + 8);
        *(void *)(a1 + 168) = v8;
        if (v8)
        {
          asprintf(&v8[*(void *)(a1 + 176)], "%s", __s);
          uint64_t v23 = *(void *)(a1 + 176);
          if (*(void *)(*(void *)(a1 + 168) + 8 * v23))
          {
            sub_100021744( 3,  "Added '%s' to flist",  v17,  v18,  v19,  v20,  v21,  v22,  *(void *)(*(void *)(a1 + 168) + 8 * v23));
            ++*(void *)(a1 + 176);
            return 1LL;
          }

          if (dword_100058FD8)
          {
            int v25 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003C0F8();
            }
            *__error() = v25;
          }

          sub_1000218D4("asprintf", v16, v17, v18, v19, v20, v21, v22, v27);
          sub_1000191BC(a1);
        }

        else
        {
          if (dword_100058FD8)
          {
            int v24 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003FA68();
            }
            *__error() = v24;
          }

          sub_1000218D4("realloc", v9, v10, v11, v12, v13, v14, v15, v26);
        }

        return 0LL;
      }

      if (dword_100058FD8)
      {
        int v7 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_12;
        }
        goto LABEL_13;
      }
    }

    sub_100021850("Can't have files-from with '..'");
    return 0LL;
  }

  return result;
}

uint64_t sub_100019834(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

uint64_t sub_100019840(const char *a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  do
    int v5 = a1[v4++];
  while (v5 == 47);
  unint64_t v6 = strrchr(&a1[v4 - 1], 47);
  if (!v6) {
    return 1LL;
  }
  int v7 = v6;
  uint64_t v8 = strdup(a1);
  if (!v8)
  {
    if (dword_100058FD8)
    {
      int v27 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CD2C();
      }
      *__error() = v27;
    }

    sub_1000218D4("strdup", v9, v10, v11, v12, v13, v14, v15, v31);
    return 0LL;
  }

  uint64_t v16 = v8;
  v8[v7 - a1] = 0;
  if (stat(v8, &v32) == -1)
  {
    if (dword_100058FD8)
    {
      int v28 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D9B4();
      }
      *__error() = v28;
    }

    sub_1000218D4("%s: stat", v17, v18, v19, v20, v21, v22, v23, (char)v16);
    goto LABEL_25;
  }

  uint64_t v24 = sub_100015788(a2);
  if (!v24)
  {
    if (dword_100058FD8)
    {
      int v29 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F338();
      }
      *__error() = v29;
    }

    sub_100021980("flist_realloc");
LABEL_25:
    free(v16);
    return 0LL;
  }

  *(_OWORD *)uint64_t v24 = 0u;
  *(_OWORD *)(v24 + 16) = 0u;
  *(_OWORD *)(v24 + memset(&v55[1], 0, 112) = 0u;
  *(_OWORD *)(v24 + 128) = 0u;
  *(_OWORD *)(v24 + 80) = 0u;
  *(_OWORD *)(v24 + 96) = 0u;
  *(_OWORD *)(v24 + 48) = 0u;
  *(_OWORD *)(v24 + 64) = 0u;
  *(_OWORD *)(v24 + 32) = 0u;
  *(void *)(v24 + 144) = 0LL;
  *(void *)uint64_t v24 = v16;
  *(void *)(v24 + 16) = &v16[v4 - 1];
  *(_WORD *)(v24 + 24) = v32.st_mode;
  *(void *)(v24 + 28) = *(void *)&v32.st_uid;
  *(void *)(v24 + 40) = v32.st_size;
  *(void *)(v24 + 48) = v32.st_mtimespec.tv_sec;
  *(_DWORD *)(v24 + 36) = v32.st_rdev;
  __darwin_ino64_t st_ino = v32.st_ino;
  *(void *)(v24 + 64) = v32.st_dev;
  *(void *)(v24 + 72) = st_ino;
  *(void *)(v24 + 80) = v32.st_nlink;
  if (dword_100058FD8)
  {
    int v30 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F6C0();
    }
    *__error() = v30;
  }

  sub_100021980("flist_append_dirs");
  return 0LL;
}

uint64_t sub_100019AD8(uint64_t *a1, char *a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)(*a1 + 64)) {
    int v8 = stat(a2, &v189);
  }
  else {
    int v8 = lstat(a2, &v189);
  }
  if (v8 == -1)
  {
    ++a1[30];
    if (dword_100058FD8)
    {
      int v18 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003FA94();
      }
      *__error() = v18;
    }

    char v182 = (char)a2;
    uint64_t v19 = "%s: (l)stat";
    goto LABEL_14;
  }

  int v16 = v189.st_mode & 0xF000;
  if (v16 != 0x4000)
  {
    if (v16 != 40960)
    {
      if (v16 == 0x8000) {
        uint64_t v17 = "file";
      }
      else {
        uint64_t v17 = "special";
      }
      goto LABEL_34;
    }

    char v31 = (_DWORD *)*a1;
    if (*(_DWORD *)(*a1 + 76) || v31[17] || v31[18])
    {
      if (stat(a2, &v188) == -1)
      {
        ++a1[30];
        if (dword_100058FD8)
        {
          int v153 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003D9B4();
          }
          *__error() = v153;
        }

        sub_1000218D4("%s: stat", v32, v33, v34, v35, v36, v37, v38, (char)a2);
        return 0LL;
      }

      int v39 = readlink(a2, v198, 0x400uLL);
      if (v39 == -1)
      {
        ++a1[30];
        if (dword_100058FD8)
        {
          int v47 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003FAF4();
          }
          *__error() = v47;
        }

        sub_1000218D4("%s: readlink", v40, v41, v42, v43, v44, v45, v46, (char)a2);
        return 0LL;
      }

      v198[v39] = 0;
      char v31 = (_DWORD *)*a1;
      if (*(_DWORD *)(*a1 + 72))
      {
        if (sub_10000CE30(v198, a2, a2))
        {
          if (dword_100058FD8)
          {
            int v160 = *__error();
            unsigned __int8 v161 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)int v194 = 136315394;
              v195 = a2;
              __int16 v196 = 2080;
              v197 = v198;
              _os_log_impl( (void *)&_mh_execute_header,  v161,  OS_LOG_TYPE_DEFAULT,  "ignoring unsafe symlink: %s -> %s",  v194,  0x16u);
            }

            *__error() = v160;
          }

          sub_100021744(0, "ignoring unsafe symlink: %s -> %s", v154, v155, v156, v157, v158, v159, (char)a2);
          return 1LL;
        }

        char v31 = (_DWORD *)*a1;
      }
    }

    if (!v31[19] || (v188.st_mode & 0xF000) != 0x4000)
    {
      if (v31[17] && sub_10000CE30(v198, a2, a2))
      {
        if ((v188.st_mode & 0xF000) == 0x4000)
        {
          if (a4 == -1) {
            a4 = sub_10001AD70((uint64_t)a1, a2);
          }
          snprintf((char *)v194, 0x400uLL, "%s/", a2);
          sub_100021744(3, "symlinks: recursing '%s' -> '%s' '%s'", v172, v173, v174, v175, v176, v177, (char)a2);
          return sub_100019AD8(a1, v194, a3, a4);
        }

        uint64_t v17 = "file";
        uint64_t v48 = &v188;
        return sub_10001ABB8(a1, v17, a2, a3, (uint64_t)v48);
      }

      uint64_t v17 = "symlink";
LABEL_34:
      uint64_t v48 = &v189;
      return sub_10001ABB8(a1, v17, a2, a3, (uint64_t)v48);
    }

    if (a4 == -1) {
      a4 = sub_10001AD70((uint64_t)a1, a2);
    }
    snprintf((char *)v194, 0x400uLL, "%s/", a2);
    sub_100021744(3, "symlinks: recursing '%s' -> '%s' '%s'\n", v166, v167, v168, v169, v170, v171, (char)a2);
    sub_100019AD8(a1, v194, a3, a4);
    return 1LL;
  }

  size_t v21 = strlen(a2);
  size_t v22 = v21;
  if (v21 >= 3)
  {
    size_t v22 = v21 - (strcmp(&a2[v21 - 3], "/./") == 0);
    if (v22 >> 10 > 4)
    {
      if (dword_100058FD8)
      {
        int v30 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003FB54();
        }
        *__error() = v30;
      }

      sub_1000218D4("%s: flist_normalize_path", v23, v24, v25, v26, v27, v28, v29, (char)a2);
      return 0LL;
    }
  }

  __memcpy_chk(v194, a2, v22, 5120LL);
  if (v194[v22 - 1] == 47) {
    v194[v22++] = 46;
  }
  v194[v22] = 0;
  uint64_t v51 = a4;
  v199[0] = (char *)v194;
  v199[1] = 0LL;
  if (a4 == -1) {
    uint64_t v51 = sub_10001AD70((uint64_t)a1, (char *)v194);
  }
  if (*(_DWORD *)(*a1 + 64)) {
    int v52 = 2;
  }
  else {
    int v52 = 20;
  }
  uint64_t v53 = fts_open(v199, v52, 0LL);
  if (!v53)
  {
    ++a1[30];
    if (dword_100058FD8)
    {
      int v162 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F718();
      }
      *__error() = v162;
    }

    uint64_t v19 = "fts_open";
LABEL_14:
    sub_1000218D4(v19, v9, v10, v11, v12, v13, v14, v15, v182);
    return 0LL;
  }

  uint64_t v54 = v53;
  *__error() = 0;
  uint64_t v55 = fts_read(v54);
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v20 = 0LL;
    uint64_t v184 = 0LL;
    uint64_t v185 = 0LL;
    while (1)
    {
      if (v56->fts_info == 6) {
        sub_10002BA3C((uint64_t)v56->fts_path, v51);
      }
      if (v56->fts_info == 1)
      {
        if (*(_DWORD *)(*a1 + 440)) {
          int v57 = 0;
        }
        else {
          int v57 = 10;
        }
        sub_10002B82C((uint64_t)v56->fts_path, v51, v57);
      }

      fts_statp = v56->fts_statp;
      if (!fts_statp) {
        sub_10003FC34();
      }
      int v59 = fts_statp->st_mode & 0xF000;
      uint64_t v60 = (_DWORD *)*a1;
      if (v59 == 40960)
      {
        if (v60[19] || v60[17] || v60[18])
        {
          if (stat(v56->fts_accpath, &v188) == -1)
          {
            if (dword_100058FD8)
            {
              int v78 = *__error();
              uint64_t v79 = (os_log_s *)qword_100058FE8;
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
              {
                fts_accpath = v56->fts_accpath;
                *(_DWORD *)stat buf = 136315138;
                int v191 = fts_accpath;
                _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%s: stat", buf, 0xCu);
              }

              *__error() = v78;
            }

            sub_1000218D4("%s: stat", v61, v62, v63, v64, v65, v66, v67, (char)v56->fts_accpath);
            goto LABEL_73;
          }

          int v68 = readlink(v56->fts_accpath, v198, 0x400uLL);
          if (v68 == -1)
          {
            if (dword_100058FD8)
            {
              int v76 = *__error();
              int v77 = (os_log_s *)qword_100058FE8;
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
              {
                uint64_t v150 = v56->fts_accpath;
                *(_DWORD *)stat buf = 136315138;
                int v191 = v150;
                _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%s: readlink", buf, 0xCu);
              }

              *__error() = v76;
            }

            sub_1000218D4("%s: readlink", v69, v70, v71, v72, v73, v74, v75, (char)v56->fts_accpath);
LABEL_73:
            ++a1[30];
            goto LABEL_141;
          }

          v198[v68] = 0;
          uint64_t v60 = (_DWORD *)*a1;
          if (*(_DWORD *)(*a1 + 72))
          {
            if (sub_10000CE30(v198, v56->fts_accpath, (char *)v194))
            {
              if (dword_100058FD8)
              {
                int v86 = *__error();
                __int16 v87 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEFAULT))
                {
                  int v88 = v56->fts_accpath;
                  *(_DWORD *)stat buf = 136315394;
                  int v191 = v88;
                  __int16 v192 = 2080;
                  v193 = v198;
                  _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "ignoring unsafe symlink %s -> %s",  buf,  0x16u);
                }

                *__error() = v86;
              }

              sub_100021744(0, "ignoring unsafe symlink %s -> %s", v80, v81, v82, v83, v84, v85, (char)v56->fts_accpath);
              goto LABEL_141;
            }

            uint64_t v60 = (_DWORD *)*a1;
          }
        }

        if (v60[19] && (v188.st_mode & 0xF000) == 0x4000)
        {
          goto LABEL_73;
        }
      }

      int v89 = v60[31];
      if (v89)
      {
        int v90 = v56->fts_statp;
        dev_t st_dev = v90->st_dev;
        if (v90->st_dev != v189.st_dev)
        {
          if (v89 > 1 || (v90->st_mode & 0xF000) != 0x4000) {
            goto LABEL_141;
          }
          if (v184)
          {
            uint64_t v104 = 0LL;
            while (v185[v104] != st_dev)
            {
              if (v184 == ++v104) {
                goto LABEL_103;
              }
            }

            goto LABEL_141;
          }

LABEL_103:
          unint64_t v105 = sub_100006FD4(v185, v184 + 1, 4uLL);
          if (!v105)
          {
            if (dword_100058FD8)
            {
              int v181 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003FCBC();
              }
              *__error() = v181;
            }

            sub_100021980("reallocarray flist_gen_dirent()");
            goto LABEL_179;
          }

          v105[v184++] = v56->fts_statp->st_dev;
          uint64_t v185 = v105;
        }
      }

      fts_path = v56->fts_path;
      if (fts_path[v51] == 47) {
        ++v51;
      }
      if (sub_10002BBB4(&fts_path[v51], v56->fts_info == 1, 0, 0) == -1)
      {
        if (dword_100058FD8)
        {
          int v106 = *__error();
          __int128 v107 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            __int128 v108 = &v56->fts_path[v51];
            *(_DWORD *)stat buf = 136315138;
            int v191 = v108;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_INFO, "%s: skipping excluded file", buf, 0xCu);
          }

          *__error() = v106;
        }

        sub_100021AB0("%s: skipping excluded file", &v56->fts_path[v51]);
        fts_set(v54, v56, 4);
        goto LABEL_141;
      }

      if (!*(_DWORD *)(*a1 + 604) || !access(v56->fts_path, 4))
      {
        uint64_t v93 = sub_100015788(a3);
        if (!v93)
        {
          if (dword_100058FD8)
          {
            int v178 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003F338();
            }
            *__error() = v178;
          }

          sub_100021980("flist_realloc");
          goto LABEL_179;
        }

        uint64_t v94 = v93;
        __int128 v95 = v56->fts_path;
        if (v95[v51])
        {
          uint64_t v103 = strdup(v95);
          *(void *)uint64_t v94 = v103;
          if (!v103)
          {
            if (dword_100058FD8)
            {
              int v179 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003CD2C();
              }
              *__error() = v179;
            }

            uint64_t v164 = "strdup";
            goto LABEL_173;
          }
        }

        else
        {
          if (asprintf((char **)v94, "%s.", v56->fts_path) == -1)
          {
            if (dword_100058FD8)
            {
              int v180 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003C0F8();
              }
              *__error() = v180;
            }

            sub_1000218D4("asprintf", v109, v110, v111, v112, v113, v114, v115, v182);
            *(void *)uint64_t v94 = 0LL;
            goto LABEL_179;
          }

          uint64_t v103 = *(const char **)v94;
        }

        if (a4 != -1)
        {
          size_t v116 = strlen(v103);
          size_t v117 = v116 - 2;
          if (v116 < 2)
          {
            if (v116)
            {
              size_t v118 = 0LL;
              goto LABEL_119;
            }
          }

          else
          {
            size_t v118 = v116 - 1;
            if (v103[v116 - 1] == 46 && v103[v117] == 47)
            {
              v103[v117] = 0;
              uint64_t v103 = *(const char **)v94;
            }

LABEL_119:
            if (v103[v118] == 47)
            {
              v103[v118] = 0;
              uint64_t v103 = *(const char **)v94;
            }
          }
        }

        *(void *)(v94 + 16) = &v103[v51];
        uint64_t v119 = v56->fts_statp;
        mode_t st_mode = v119->st_mode;
        *(_WORD *)(v94 + 24) = st_mode;
        *(void *)(v94 + 28) = *(void *)&v119->st_uid;
        *(void *)(v94 + 40) = v119->st_size;
        *(void *)(v94 + 48) = v119->st_mtimespec.tv_sec;
        *(_DWORD *)(v94 + 36) = v119->st_rdev;
        *(void *)(v94 + 64) = v119->st_dev;
        *(void *)(v94 + 72) = v119->st_ino;
        *(void *)(v94 + 80) = v119->st_nlink;
        if ((st_mode & 0xF000) == 0xA000)
        {
          if (*(_DWORD *)(*a1 + 68) && sub_10000CE30(v198, v56->fts_path, (char *)v194))
          {
            *(_WORD *)(v94 + 24) = v188.st_mode;
            *(void *)(v94 + 28) = *(void *)&v188.st_uid;
            *(void *)(v94 + 40) = v188.st_size;
            *(void *)(v94 + 48) = v188.st_mtimespec.tv_sec;
            *(_DWORD *)(v94 + 36) = v188.st_rdev;
            __darwin_ino64_t st_ino = v188.st_ino;
            *(void *)(v94 + 64) = v188.st_dev;
            *(void *)(v94 + 72) = st_ino;
            *(void *)(v94 + 80) = v188.st_nlink;
            if (dword_100058FD8)
            {
              int v183 = *__error();
              int v128 = (os_log_s *)qword_100058FE8;
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG))
              {
                unsigned __int8 v151 = v56->fts_path;
                *(_DWORD *)stat buf = 136315394;
                int v191 = v151;
                __int16 v192 = 2080;
                v193 = v198;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_DEBUG,  "copy_unsafe_links: converting unsafe link %s -> %s to a regular file\n",  buf,  0x16u);
              }

              *__error() = v183;
            }

            sub_100021744( 2,  "copy_unsafe_links: converting unsafe link %s -> %s to a regular file\n",  v121,  v122,  v123,  v124,  v125,  v126,  (char)v56->fts_path);
          }

          else
          {
            int v129 = sub_100035150(v56->fts_accpath);
            *(void *)(v94 + 88) = v129;
            if (!v129)
            {
              if (dword_100058FD8)
              {
                int v144 = *__error();
                unint64_t v145 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                  sub_10003FC80(&v186, v187, v145);
                }
                *__error() = v144;
              }

              sub_100021980("symlink_read");
              ++a1[30];
              uint64_t v143 = *(void *)(a3 + 8);
              if (!v143) {
                sub_10003FC5C(v146, v147, v148);
              }
              goto LABEL_148;
            }
          }
        }

        if (*(_DWORD *)(*a1 + 16))
        {
          if ((*(_WORD *)(v94 + 24) & 0xF000) == 0x8000)
          {
            int64_t v130 = *(void *)(v94 + 40);
            if (v130 >= 1)
            {
              uint64_t v20 = sub_10001E004(-2, *(const char **)v94, v130, (unsigned __int8 *)(v94 + 96));
              if ((_DWORD)v20)
              {
                if (dword_100058FD8)
                {
                  int v138 = *__error();
                  int v139 = (os_log_s *)qword_100058FE8;
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
                  {
                    unsigned int v152 = *(char **)v94;
                    *(_DWORD *)stat buf = 136315138;
                    int v191 = v152;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_ERROR,  "%s: hash_file_by_path",  buf,  0xCu);
                  }

                  *__error() = v138;
                }

                sub_1000218D4("%s: hash_file_by_path", v131, v132, v133, v134, v135, v136, v137, *(void *)v94);
                ++a1[30];
                uint64_t v143 = *(void *)(a3 + 8);
                if (!v143) {
                  sub_10003FC5C(v140, v141, v142);
                }
LABEL_148:
                *(void *)(a3 + 8) = v143 - 1;
                goto LABEL_141;
              }
            }
          }
        }

LABEL_140:
        *__error() = 0;
      }

LABEL_141:
      uint64_t v56 = fts_read(v54);
      if (!v56) {
        goto LABEL_167;
      }
    }
  }

  uint64_t v185 = 0LL;
  uint64_t v20 = 0LL;
LABEL_167:
  if (*__error())
  {
    if (dword_100058FD8)
    {
      int v163 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F744();
      }
      *__error() = v163;
    }

    uint64_t v164 = "fts_read";
LABEL_173:
    sub_1000218D4(v164, v96, v97, v98, v99, v100, v101, v102, v182);
  }

  else
  {
    if (dword_100058FD8)
    {
      int v165 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG)) {
        sub_10003FBB4();
      }
      *__error() = v165;
    }

    sub_100021744(2, "generated %zu filenames: %s", v97, v98, v99, v100, v101, v102, *(void *)(a3 + 8));
    uint64_t v20 = 1LL;
  }

LABEL_179:
  fts_close(v54);
  free(v185);
  return v20;
}

uint64_t sub_10001ABB8(uint64_t *a1, const char *a2, char *__s, uint64_t a4, uint64_t a5)
{
  if (sub_10002BBB4(__s, (*(_WORD *)(a5 + 4) & 0xF000) == 0x4000, 0, 0) == -1)
  {
    if (dword_100058FD8)
    {
      int v12 = *__error();
      uint64_t v13 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 136315394;
        uint64_t v15 = __s;
        __int16 v16 = 2080;
        uint64_t v17 = a2;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: skipping excluded %s", buf, 0x16u);
      }

      *__error() = v12;
    }

    sub_100021AB0("%s: skipping excluded %s", __s, a2);
    return 1LL;
  }

  if (dword_100058FD8)
  {
    int v10 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F694();
    }
    *__error() = v10;
  }

  sub_100021980("flist_append");
  return 0LL;
}

uint64_t sub_10001AD70(uint64_t a1, char *__s)
{
  uint64_t result = strlen(__s);
  if (result <= 0) {
    sub_10003FCE8();
  }
  if (__s[result - 1] != 47)
  {
    if (*(_DWORD *)(*(void *)a1 + 188LL))
    {
      return 0LL;
    }

    else
    {
      int v5 = strrchr(__s, 47);
      if (v5) {
        return v5 - __s + 1;
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_10001ADE0(uint64_t *a1, int *a2, const char *a3, uint64_t a4)
{
  int v8 = (uint64_t *)(a4 + 8);
  if (!sub_100015684((char **)a4, (unint64_t *)(a4 + 8), (unint64_t *)(a4 + 16))
    || (uint64_t v9 = *v8) == 0)
  {
    if (dword_100058FD8)
    {
      int v24 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003FD10();
      }
      *__error() = v24;
    }

    sub_100021850("fl_new failed");
    return 0LL;
  }

  unint64_t v10 = v9 - 1;
  uint64_t v11 = sub_1000157E4((void *)a4, v9 - 1);
  int v12 = strdup(a3);
  *(void *)uint64_t v11 = v12;
  if (!v12)
  {
    if (dword_100058FD8)
    {
      int v25 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CD2C();
      }
      *__error() = v25;
    }

    uint64_t v26 = "strdup";
    goto LABEL_26;
  }

  uint64_t v20 = v12;
  uint64_t v21 = *a1;
  if (*(_DWORD *)(*a1 + 188))
  {
    size_t v22 = v12;
    do
    {
      *(void *)(v11 + 16) = v22;
      int v23 = *v22++;
    }

    while (v23 == 47);
    if (sub_100019840(v12, a4))
    {
      uint64_t v11 = sub_1000157E4((void *)a4, v10);
      uint64_t v21 = *a1;
      goto LABEL_28;
    }

    if (dword_100058FD8)
    {
      int v28 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F6C0();
      }
      *__error() = v28;
    }

    uint64_t v26 = "flist_append_dirs";
LABEL_26:
    sub_1000218D4(v26, v13, v14, v15, v16, v17, v18, v19, v41);
    return 0LL;
  }

  uint64_t v27 = strrchr(v12, 47);
  if (v27) {
    *(void *)(v11 + 16) = v27 + 1;
  }
  else {
    *(void *)(v11 + 16) = v20;
  }
LABEL_28:
  __int16 v29 = *((_WORD *)a2 + 2);
  *(_WORD *)(v11 + 24) = v29;
  *(void *)(v11 + 28) = *((void *)a2 + 2);
  uint64_t v30 = *((void *)a2 + 6);
  *(void *)(v11 + 40) = *((void *)a2 + 12);
  *(void *)(v11 + 48) = v30;
  *(_DWORD *)(v11 + 36) = a2[6];
  uint64_t v31 = *((void *)a2 + 1);
  *(void *)(v11 + 64) = *a2;
  *(void *)(v11 + 72) = v31;
  *(void *)(v11 + 80) = *((unsigned __int16 *)a2 + 3);
  if (*(void *)(v21 + 24))
  {
    sub_100016FF4(a1, v11);
    __int16 v29 = *((_WORD *)a2 + 2);
  }

  if ((v29 & 0xF000) == 0xA000)
  {
    uint64_t v32 = sub_100035150(*(const char **)v11);
    if (!v32)
    {
      ++a1[30];
      if (dword_100058FD8)
      {
        int v37 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003FD3C();
        }
        *__error() = v37;
      }

      sub_100021980("symlink_read");
      return 0LL;
    }

    uint64_t v33 = v32;
    uint64_t v34 = (unsigned int (*)(char *, uint64_t, void))a1[29];
    uint64_t v35 = (char **)(v11 + 88);
    if (!v34) {
      goto LABEL_46;
    }
    if (v34(v32, v11 + 88, 0LL))
    {
      ++a1[30];
      if (dword_100058FD8)
      {
        int v36 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F58C();
        }
        *__error() = v36;
      }

      sub_100021980("symlink_filter");
      return 0LL;
    }

    if (*v35) {
      free(v33);
    }
    else {
LABEL_46:
    }
      char *v35 = v33;
  }

  if (*(_DWORD *)(*a1 + 16))
  {
    if ((*(_WORD *)(v11 + 24) & 0xF000) == 0x8000)
    {
      int64_t v38 = *(void *)(v11 + 40);
      if (v38 >= 1)
      {
        if (sub_10001E004(-2, *(const char **)v11, v38, (unsigned __int8 *)(v11 + 96)))
        {
          ++a1[30];
          if (dword_100058FD8)
          {
            int v39 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003FD68();
            }
            *__error() = v39;
          }

          sub_100021980("hash_file_by_path");
          return 0LL;
        }
      }
    }
  }

  return 1LL;
}

void sub_10001B1E0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10001B1F0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void sub_10001B1F8(uint64_t a1)
{
  if (!a1) {
    sub_10003FD94();
  }
  while (1)
  {
    uint64_t v2 = *(void ***)a1;
    if (!*(void *)a1) {
      break;
    }
    unsigned int v3 = *v2;
    *(void *)a1 = *v2;
    if (!v3) {
      *(void *)(a1 + 8) = a1;
    }
    free(v2[3]);
    free(v2);
  }

uint64_t sub_10001B248(uint64_t a1, const char *a2, int a3)
{
  size_t __linecapp = 0LL;
  __linep = 0LL;
  int v5 = malloc(0x10uLL);
  if (!v5)
  {
    if (dword_100058FD8)
    {
      int v98 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F3BC();
      }
      *__error() = v98;
    }

    sub_1000218D4("malloc", v6, v7, v8, v9, v10, v11, v12, v108);
    return 0LL;
  }

  uint64_t v13 = (uint64_t)v5;
  void *v5 = 0LL;
  v5[1] = v5;
  uint64_t v14 = strdup("global");
  if (!v14)
  {
    if (dword_100058FD8)
    {
      int v99 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CD2C();
      }
      *__error() = v99;
    }

    uint64_t v100 = "strdup";
    goto LABEL_130;
  }

  size_t v22 = v14;
  int v23 = sub_10001BE3C(v13, (uint64_t)v14);
  if (!v23)
  {
    free(v22);
LABEL_131:
    sub_10001B1F8(v13);
    return 0LL;
  }

  int v24 = v23;
  int v25 = fopen(a2, "r");
  if (!v25)
  {
    if (dword_100058FD8)
    {
      int v102 = *__error();
      uint64_t v103 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003FDBC((uint64_t)a2, v103);
      }
      *__error() = v102;
    }

    char v108 = (char)a2;
    uint64_t v100 = "%s: open";
LABEL_130:
    sub_1000218D4(v100, v15, v16, v17, v18, v19, v20, v21, v108);
    goto LABEL_131;
  }

  uint64_t v26 = v25;
  uint64_t v113 = v13;
  uint64_t v110 = a2;
  uint64_t v111 = 0LL;
  uint64_t v27 = 0LL;
  char v28 = 0;
  __int16 v29 = 0LL;
LABEL_6:
  __dst = v27;
LABEL_7:
  size_t v116 = v29;
  while (1)
  {
    ssize_t v30 = getline(&__linep, &__linecapp, v26);
    if (v30 == -1) {
      break;
    }
    ssize_t v31 = v30;
    ssize_t v32 = v30 - 1;
    __linep[v30 - 1] = 0;
    uint64_t v33 = __linep;
    if ((v28 & 1) != 0)
    {
      int v68 = __linep[v30 - 2];
      BOOL v69 = v68 == 92;
      if (v68 == 92)
      {
        __linep[v30 - 2] = 0;
        uint64_t v33 = __linep;
      }

      uint64_t v27 = __dst;
      __int16 v29 = v116;
      if (*v33)
      {
        uint64_t v27 = &__dst[strlen(v33)];
        uint64_t v70 = (char *)realloc(v116, (size_t)(v27 + 1));
        if (!v70)
        {
          free(v116);
          __int16 v29 = 0LL;
          char v28 = 1;
          if (v68 == 92) {
            goto LABEL_6;
          }
LABEL_103:
          int v89 = (char *)(v24 + 1);
          while (1)
          {
            int v89 = *(char **)v89;
            if (!v89) {
              break;
            }
          }

          int v90 = (char *)malloc(0x20uLL);
          if (!v90)
          {
            if (dword_100058FD8)
            {
              int v105 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003F3BC();
              }
              *__error() = v105;
            }

            sub_1000218D4("malloc", v91, v92, v93, v94, v95, v96, v97, v108);
            int v106 = v29;
            goto LABEL_146;
          }

          int v89 = v90;
          *((void *)v90 + 1) = v24;
          *((void *)v90 + 2) = v111;
          *((void *)v90 + 3) = 0LL;
          *(void *)int v89 = 0LL;
          *(void *)v24[2] = v89;
          v24[2] = v89;
LABEL_111:
          free(*((void **)v89 + 3));
          uint64_t v27 = 0LL;
          char v28 = 0;
          *((void *)v89 + 3) = v29;
          __int16 v29 = 0LL;
          goto LABEL_6;
        }

        __int16 v29 = v70;
      }

LABEL_102:
      char v28 = 1;
      if (v69) {
        goto LABEL_6;
      }
      goto LABEL_103;
    }

    uint64_t v34 = -(uint64_t)__linep;
    do
    {
      uint64_t v35 = v33;
      uint64_t v36 = v34;
      int v37 = *v33;
      if (v37 < 0) {
        __uint32_t v38 = __maskrune(*v33, 0x4000uLL);
      }
      else {
        __uint32_t v38 = _DefaultRuneLocale.__runetype[v37] & 0x4000;
      }
      ++v33;
      uint64_t v34 = v36 - 1;
    }

    while (v38);
    char v28 = 0;
    if (v37 && v37 != 35)
    {
      if (v37 != 91)
      {
        uint64_t v54 = strchr(v35, 61);
        char v28 = 0;
        __int16 v29 = 0LL;
        if (v54)
        {
          int __s1 = v54;
          if (v54 > v35)
          {
            uint64_t v55 = v54;
            do
            {
              __darwin_ct_rune_t v57 = *--v55;
              __darwin_ct_rune_t v56 = v57;
              if (v57 < 0) {
                __uint32_t v58 = __maskrune(v56, 0x4000uLL);
              }
              else {
                __uint32_t v58 = _DefaultRuneLocale.__runetype[v56] & 0x4000;
              }
              if (!v58) {
                break;
              }
              *uint64_t v55 = 0;
            }

            while (v55 > v35);
          }

          size_t v59 = strlen(v35);
          if (v59)
          {
            size_t v60 = v59;
            size_t v61 = 0LL;
            size_t v117 = v35 + 1;
            do
            {
              __dsta = &v35[v61];
              __darwin_ct_rune_t v62 = v35[v61];
              if (v62 < 0) {
                __uint32_t v63 = __maskrune(v35[v61], 0x4000uLL);
              }
              else {
                __uint32_t v63 = _DefaultRuneLocale.__runetype[v62] & 0x4000;
              }
              if (v63)
              {
                size_t v112 = v61;
                uint64_t v64 = v117;
                do
                {
                  int v65 = *v64;
                  if (v65 < 0) {
                    __uint32_t v66 = __maskrune(*v64, 0x4000uLL);
                  }
                  else {
                    __uint32_t v66 = _DefaultRuneLocale.__runetype[v65] & 0x4000;
                  }
                  --v60;
                  ++v64;
                }

                while (v66);
                if (!v65)
                {
                  char *__dsta = 0;
                  break;
                }

                uint64_t v67 = v64 - 1;
                size_t v61 = v112;
                memmove(__dsta, v67, v60 - v112);
                v35[v60] = 0;
              }

              else
              {
                char *__dsta = __tolower(v62);
              }

              ++v61;
              ++v117;
            }

            while (v61 < v60);
          }

          if (*v35 && (uint64_t v71 = sub_10001BEEC(v35)) != 0LL)
          {
            uint64_t v72 = v71;
            uint64_t v73 = __s1;
            *int __s1 = 0;
            uint64_t v74 = __s1;
            do
            {
              __darwin_ct_rune_t v76 = *++v73;
              __darwin_ct_rune_t v75 = v76;
              if (v76 < 0)
              {
                int v78 = v73;
                __uint32_t v77 = __maskrune(v75, 0x4000uLL);
                uint64_t v73 = v78;
              }

              else
              {
                __uint32_t v77 = _DefaultRuneLocale.__runetype[v75] & 0x4000;
              }

              ++v74;
            }

            while (v77);
            uint64_t v111 = v72;
            uint64_t v79 = __linep;
            int v80 = __linep[v31 - 2];
            BOOL v69 = v80 == 92;
            if (v80 == 92)
            {
              __linep[v31 - 2] = 0;
              uint64_t v79 = __linep;
              ssize_t v32 = v31 - 2;
            }

            uint64_t v81 = strdup(v73);
            if (v81)
            {
              uint64_t v27 = (char *)(&v79[v32] - v74);
              __int16 v29 = v81;
              goto LABEL_102;
            }

            if (dword_100058FD8)
            {
              int v107 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_10003CD2C();
              }
              *__error() = v107;
            }

            sub_1000218D4("strdup", v82, v83, v84, v85, v86, v87, v88, v108);
            int v106 = v35;
LABEL_146:
            free(v106);
          }

          else
          {
            fprintf(__stderrp, "Invalid key in rsyncd.conf: '%s'\n", v35);
          }

LABEL_147:
          free(__linep);
LABEL_148:
          err(1, "failed to parse file %s", v110);
        }

        goto LABEL_7;
      }

      if (!a3) {
        break;
      }
      int v39 = strrchr(v35 + 1, 93);
      if (!v39) {
        goto LABEL_147;
      }
      uint64_t v40 = v39;
      char v41 = &v39[v36];
      do
      {
        uint64_t v42 = v40;
        uint64_t v43 = v41;
        if (v40 <= v33) {
          break;
        }
        --v40;
        __darwin_ct_rune_t v44 = *(v42 - 1);
        __uint32_t v45 = v44 < 0 ? __maskrune(v44, 0x4000uLL) : _DefaultRuneLocale.__runetype[v44] & 0x4000;
        char v41 = v43 - 1;
      }

      while (v45);
      if (v42 == v33) {
        goto LABEL_147;
      }
      do
      {
        __darwin_ct_rune_t v46 = v35[1];
        if (v46 < 0) {
          __uint32_t v47 = __maskrune(v46, 0x4000uLL);
        }
        else {
          __uint32_t v47 = _DefaultRuneLocale.__runetype[v46] & 0x4000;
        }
        ++v35;
        --v43;
      }

      while (v47);
      uint64_t v48 = (char *)malloc((size_t)(v43 + 1));
      if (!v48) {
        goto LABEL_147;
      }
      int v49 = v48;
      uint64_t v50 = v48;
      if (v35 != v42)
      {
        uint64_t v50 = v48;
        do
        {
          int v51 = *v35;
          if (v51 < 0)
          {
            if (__maskrune(*v35, 0x4000uLL))
            {
LABEL_36:
              *uint64_t v50 = 32;
              --v35;
              do
              {
                __darwin_ct_rune_t v52 = v35[2];
                if (v52 < 0) {
                  __uint32_t v53 = __maskrune(v52, 0x4000uLL);
                }
                else {
                  __uint32_t v53 = _DefaultRuneLocale.__runetype[v52] & 0x4000;
                }
                ++v35;
              }

              while (v53);
              goto LABEL_46;
            }
          }

          else if ((_DefaultRuneLocale.__runetype[v51] & 0x4000) != 0)
          {
            goto LABEL_36;
          }

          if (v51 == 47 || v51 == 93)
          {
            int v24 = 0LL;
            goto LABEL_55;
          }

          *uint64_t v50 = v51;
LABEL_46:
          ++v50;
          ++v35;
        }

        while (v42 != v35);
      }

      *uint64_t v50 = 0;
      int v24 = (void *)v113;
      while (1)
      {
        int v24 = (void *)*v24;
        if (!v24) {
          break;
        }
      }

      int v24 = sub_10001BE3C(v113, (uint64_t)v49);
      if (!v24) {
LABEL_55:
      }
        free(v49);
      char v28 = 0;
      if (!v24) {
        goto LABEL_147;
      }
    }
  }

  free(__linep);
  uint64_t v101 = v113;
  if (ferror(v26)) {
    goto LABEL_148;
  }
  fclose(v26);
  return v101;
}

                if (v94 + v53 <= v77)
                {
                  do
                  {
                    int v99 = &v7[2 * v53++];
                    *((_WORD *)v99 + 72) = v93;
                    --v94;
                  }

                  while (v94);
                  *((_DWORD *)v7 + 33) = v53;
                  goto LABEL_150;
                }

                goto LABEL_353;
              }

              uint64_t v95 = (v81 + 2);
              uint64_t v91 = 0LL;
              while ((_DWORD)v17)
              {
                uint64_t v96 = *v10++;
                uint64_t v17 = (v17 - 1);
                v13 += (unint64_t)v96 << (v15 + v91);
                v91 += 8LL;
                if ((unint64_t)v15 + v91 >= v95)
                {
                  LODWORD(v15) = v15 + v91;
LABEL_139:
                  v13 >>= v81;
                  uint64_t v15 = (v15 - v81);
                  if (v53)
                  {
                    uint64_t v93 = *(_WORD *)&v7[2 * v53 + 142];
                    uint64_t v94 = (v13 & 3) + 3;
                    v13 >>= 2;
                    uint64_t v15 = (v15 - 2);
                    goto LABEL_147;
                  }

BOOL sub_10001BA44(uint64_t **a1, char *__s2)
{
  if (!__s2) {
    sub_10003FE80();
  }
  do
    a1 = (uint64_t **)*a1;
  while (a1 && strcmp((const char *)a1[3], __s2));
  return a1 != 0LL;
}

uint64_t sub_10001BA8C(void *a1, uint64_t (*a2)(void *, const char *, uint64_t), uint64_t a3)
{
  unsigned int v3 = (void *)*a1;
  if (!*a1) {
    return 1LL;
  }
  uint64_t v7 = 1LL;
  do
  {
    uint64_t v8 = (const char *)v3[3];
    if (strcmp(v8, "global"))
    {
      uint64_t v7 = a2(a1, v8, a3);
      if (!(_DWORD)v7) {
        break;
      }
    }

    unsigned int v3 = (void *)*v3;
  }

  while (v3);
  return v7;
}

BOOL sub_10001BB1C(uint64_t *a1, const char *a2, char *a3)
{
  else {
    BOOL v3 = v5 == 0LL;
  }
  return !v3;
}

uint64_t sub_10001BB50(uint64_t *a1, const char *a2, char *__s2, char ***a4, char **a5)
{
  if (a2) {
    uint64_t v8 = a2;
  }
  else {
    uint64_t v8 = "global";
  }
  uint64_t v9 = sub_10001BEEC(__s2);
  if (!v9) {
    sub_10003FEA8();
  }
  uint64_t v10 = v9;
  do
  {
    a1 = (uint64_t *)*a1;
    if (!a1)
    {
      *__error() = 2;
      return 0xFFFFFFFFLL;
    }
  }

  while (strcmp((const char *)a1[3], v8));
  if (strcmp(v8, "global"))
  {
    uint64_t v11 = (char *)(a1 + 1);
    while (1)
    {
      uint64_t v11 = *(char **)v11;
      if (!v11) {
        break;
      }
      if (*((char ***)v11 + 2) == v10)
      {
        if (!a4) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
  }

  uint64_t v11 = v10[4];
  if (a4) {
LABEL_13:
  }
    *a4 = v10;
LABEL_14:
  uint64_t result = 0LL;
  *a5 = v11;
  return result;
}

uint64_t sub_10001BC1C(uint64_t *a1, const char *a2, char *a3, int *a4)
{
  uint64_t v6 = v8;
  if (!strcasecmp(v8, "yes") || !strcasecmp(v6, "true") || !strcasecmp(v6, "1"))
  {
    int v7 = 1;
  }

  else
  {
    if (strcasecmp(v6, "no") && strcasecmp(v6, "false") && strcasecmp(v6, "0"))
    {
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }

    int v7 = 0;
  }

  uint64_t result = 0LL;
  *a4 = v7;
  return result;
}

uint64_t sub_10001BCF4(uint64_t *a1, const char *a2, char *a3, void *a4)
{
  uint64_t result = 0LL;
  if (v7) {
    uint64_t v6 = v7 + 24;
  }
  else {
    uint64_t v6 = (char *)(v8 + 2);
  }
  *a4 = *(void *)v6;
  return result;
}

uint64_t sub_10001BD5C(uint64_t *a1, const char *a2, char *a3, uint64_t *a4)
{
  if (!sub_10001BCF4(a1, a2, a3, &__str))
  {
    *__error() = 0;
    uint64_t v5 = strtol(__str, &__endptr, 10);
    if (!*__error() && !*__endptr)
    {
      uint64_t result = 0LL;
      *a4 = v5;
      return result;
    }

    *__error() = 22;
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_10001BDDC(uint64_t *a1, const char *a2, char *a3, _DWORD *a4)
{
  uint64_t result = sub_10001BD5C(a1, a2, a3, &v6);
  if ((_DWORD)result != -1)
  {
    if (v6 == (int)v6)
    {
      uint64_t result = 0LL;
      *a4 = v6;
    }

    else
    {
      *__error() = 34;
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

void *sub_10001BE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = malloc(0x20uLL);
  uint64_t v12 = v4;
  if (v4)
  {
    v4[1] = 0LL;
    v4[2] = v4 + 1;
    v4[3] = a2;
    *uint64_t v4 = 0LL;
    **(void **)(a1 + 8) = v4;
    *(void *)(a1 + 8) = v4;
  }

  else
  {
    if (dword_100058FD8)
    {
      int v13 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F3BC();
      }
      *__error() = v13;
    }

    sub_1000218D4("malloc", v5, v6, v7, v8, v9, v10, v11, v15);
  }

  return v12;
}

char **sub_10001BEEC(char *__s2)
{
  uint64_t v2 = 0LL;
  for (uint64_t i = 0LL; ; ++i)
  {
    if (!strcmp((&off_100058000)[v2], __s2)) {
      return &(&off_100058000)[5 * i];
    }
    uint64_t v4 = (&off_100058000)[v2 + 1];
    if (v4)
    {
      if (!strcmp(v4, __s2)) {
        break;
      }
    }

    v2 += 5LL;
    if (v2 == 205) {
      return 0LL;
    }
  }

  return &(&off_100058000)[v2];
}

uint64_t sub_10001BF78(void *a1)
{
  if (!a1) {
    return 4294967294LL;
  }
  uint64_t v2 = a1[7];
  if (!v2) {
    return 4294967294LL;
  }
  uint64_t result = 0LL;
  a1[12] = 1LL;
  *(void *)(v2 + 32) = 0LL;
  a1[2] = 0LL;
  a1[5] = 0LL;
  a1[6] = 0LL;
  *(void *)uint64_t v2 = 0LL;
  *(_DWORD *)(v2 + 12) = 0;
  *(_DWORD *)(v2 + 20) = 0x8000;
  *(void *)(v2 + 40) = 0LL;
  *(void *)(v2 + 52) = 0LL;
  *(_DWORD *)(v2 + 60) = 0;
  *(void *)(v2 + 72) = 0LL;
  *(_DWORD *)(v2 + 80) = 0;
  *(void *)(v2 + 136) = v2 + 1360;
  *(void *)(v2 + 96) = v2 + 1360;
  *(void *)(v2 + 104) = v2 + 1360;
  return result;
}

uint64_t sub_10001BFE0(void *a1, int a2, _BYTE *a3, int a4)
{
  if (!a3) {
    return 4294967290LL;
  }
  uint64_t result = 4294967290LL;
  if (a4 == 112 && *a3 == 49)
  {
    if (!a1) {
      return 4294967294LL;
    }
    a1[6] = 0LL;
    uint64_t v7 = (void *(*)(uint64_t, int, int))a1[8];
    if (!v7)
    {
      uint64_t v7 = sub_100028474;
      a1[8] = sub_100028474;
      a1[10] = 0LL;
    }

    if (!a1[9]) {
      a1[9] = sub_10002847C;
    }
    uint64_t v8 = (uint64_t)v7(a1[10], 1, 9552);
    if (v8)
    {
      a1[7] = v8;
      int v9 = a2 & 0xF;
      if (a2 >= 0) {
        int v10 = (a2 >> 4) + 1;
      }
      else {
        int v10 = 0;
      }
      if (a2 < 0) {
        int v11 = -a2;
      }
      else {
        int v11 = v9;
      }
      *(_DWORD *)(v8 + 8) = v10;
      if ((v11 - 16) <= 0xFFFFFFF7)
      {
        ((void (*)(void, uint64_t))a1[9])(a1[10], v8);
        a1[7] = 0LL;
        return 4294967294LL;
      }

      *(_DWORD *)(v8 + 48) = v11;
      *(void *)(v8 + 64) = 0LL;
      return sub_10001BF78(a1);
    }

    else
    {
      return 4294967292LL;
    }
  }

  return result;
}

uint64_t sub_10001C0D0( unsigned __int8 **a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 *a6)
{
  if (!a1) {
    return 4294967294LL;
  }
  uint64_t v6 = (uint64_t)a1;
  uint64_t v7 = a1[7];
  if (!v7) {
    return 4294967294LL;
  }
  uint64_t v8 = a1[3];
  if (!v8) {
    return 4294967294LL;
  }
  int v10 = *a1;
  if (!*a1)
  {
    if (*((_DWORD *)a1 + 2)) {
      return 4294967294LL;
    }
  }

  int v11 = *(_DWORD *)v7;
  if (*(_DWORD *)v7 == 11)
  {
    int v11 = 12;
    *(_DWORD *)uint64_t v7 = 12;
  }

  unint64_t v12 = *((unsigned int *)a1 + 8);
  unint64_t v13 = *((void *)v7 + 9);
  uint64_t v14 = (_WORD **)(v7 + 136);
  unint64_t v15 = *((unsigned int *)v7 + 20);
  int v229 = (unsigned int *)(v7 + 112);
  v230 = v7 + 1360;
  uint64_t v16 = (unsigned __int16 *)(v7 + 144);
  int v228 = v7 + 784;
  unsigned int v233 = *((_DWORD *)a1 + 2);
  unsigned int v234 = 0;
  unint64_t v17 = v233;
  unsigned int v236 = *((_DWORD *)a1 + 8);
  unsigned int v235 = a2;
LABEL_8:
  int v18 = -3;
  unsigned int v19 = 1;
  switch(v11)
  {
    case 0:
      int v20 = *((_DWORD *)v7 + 2);
      if (!v20)
      {
        int v39 = 12;
        goto LABEL_351;
      }

      if (v15 <= 0xF)
      {
        uint64_t v21 = 0LL;
        do
        {
          if (!(_DWORD)v17) {
            goto LABEL_362;
          }
          unint64_t v17 = (v17 - 1);
          unsigned int v22 = *v10++;
          v13 += (unint64_t)v22 << (v15 + v21);
          v21 += 8LL;
        }

        while ((unint64_t)v15 + v21 - 8 < 8);
        unint64_t v15 = (v15 + v21);
      }

      if ((v20 & 2) != 0 && v13 == 35615)
      {
        uint64_t v23 = sub_10001DA6C(0, 0LL, 0);
        *((void *)v7 + 3) = v23;
        LOWORD(v237) = -29921;
        uint64_t v24 = sub_10001DA6C(v23, &v237, 2u);
        uint64_t v16 = (unsigned __int16 *)(v7 + 144);
        uint64_t v14 = (_WORD **)(v7 + 136);
        unint64_t v13 = 0LL;
        unint64_t v15 = 0LL;
        *((void *)v7 + 3) = v24;
        *(_DWORD *)uint64_t v7 = 1;
        a2 = v235;
        a6 = &jpt_10001C19C;
        goto LABEL_352;
      }

      *((_DWORD *)v7 + 4) = 0;
      uint64_t v131 = *((void *)v7 + 5);
      if (v131) {
        *(_DWORD *)(v131 + 72) = -1;
      }
      a6 = &jpt_10001C19C;
      if ((v20 & 1) == 0
        || 0xEF7BDEF7BDEF7BDFLL * (((unint64_t)v13 << 8) + (v13 >> 8)) >= 0x842108421084211LL)
      {
        *(void *)(v6 + 48) = "incorrect header check";
        *(_DWORD *)uint64_t v7 = 27;
        a2 = v235;
        goto LABEL_352;
      }

      a2 = v235;
      if ((v13 & 0xF) != 8) {
        goto LABEL_349;
      }
      int v215 = v13 >> 4;
      if ((v215 + 8) > *((_DWORD *)v7 + 12))
      {
        v13 >>= 4;
        unint64_t v15 = (v15 - 4);
        uint64_t v27 = "invalid window size";
        goto LABEL_350;
      }

      *((_DWORD *)v7 + 5) = 256 << v215;
      uint64_t v216 = sub_100013130(0, 0LL, 0);
      a6 = &jpt_10001C19C;
      uint64_t v16 = (unsigned __int16 *)(v7 + 144);
      uint64_t v14 = (_WORD **)(v7 + 136);
      unint64_t v15 = 0LL;
      *((void *)v7 + 3) = v216;
      *(void *)(v6 + 96) = v216;
      if ((v13 & 0x2000) != 0) {
        int v217 = 9;
      }
      else {
        int v217 = 11;
      }
      *(_DWORD *)uint64_t v7 = v217;
      unint64_t v13 = 0LL;
      goto LABEL_352;
    case 1:
      uint64_t v25 = 0LL;
      do
      {
        if (!(_DWORD)v17) {
          goto LABEL_364;
        }
        unint64_t v17 = (v17 - 1);
        unsigned int v26 = *v10++;
        v13 += (unint64_t)v26 << (v15 + v25);
        v25 += 8LL;
      }

      while ((unint64_t)v15 + v25 - 8 < 8);
      unint64_t v15 = (v15 + v25);
LABEL_23:
      *((_DWORD *)v7 + 4) = v13;
      if (v13 != 8)
      {
LABEL_349:
        uint64_t v27 = "unknown compression method";
        goto LABEL_350;
      }

      if ((v13 & 0xE000) != 0)
      {
        uint64_t v27 = "unknown header flags set";
        goto LABEL_350;
      }

      a2 = v12;
      uint64_t v136 = (unsigned int *)*((void *)v7 + 5);
      if (v136) {
        unsigned int *v136 = (v13 >> 8) & 1;
      }
      unsigned int v28 = v236;
      if ((v13 & 0x200) != 0)
      {
        LOWORD(v237) = v13;
        uint64_t v137 = sub_10001DA6C(*((void *)v7 + 3), &v237, 2u);
        uint64_t v16 = (unsigned __int16 *)(v7 + 144);
        uint64_t v14 = (_WORD **)(v7 + 136);
        *((void *)v7 + 3) = v137;
      }

      LODWORD(v15) = 0;
      unint64_t v13 = 0LL;
      *(_DWORD *)uint64_t v7 = 2;
LABEL_207:
      unint64_t v12 = v15;
      do
      {
        if (!(_DWORD)v17) {
          goto LABEL_363;
        }
        unsigned int v138 = *v10++;
        LODWORD(v17) = v17 - 1;
        v13 += (unint64_t)v138 << v12;
        BOOL v175 = v12 >= 0x18;
        v12 += 8LL;
      }

      while (!v175);
LABEL_211:
      uint64_t v139 = *((void *)v7 + 5);
      if (v139) {
        *(void *)(v139 + 8) = v13;
      }
      if ((v7[17] & 2) != 0)
      {
        int v237 = v13;
        uint64_t v140 = sub_10001DA6C(*((void *)v7 + 3), &v237, 4u);
        uint64_t v16 = (unsigned __int16 *)(v7 + 144);
        uint64_t v14 = (_WORD **)(v7 + 136);
        *((void *)v7 + 3) = v140;
      }

      LODWORD(v15) = 0;
      unint64_t v13 = 0LL;
      *(_DWORD *)uint64_t v7 = 3;
LABEL_216:
      unint64_t v12 = v15;
      do
      {
        if (!(_DWORD)v17) {
          goto LABEL_363;
        }
        unsigned int v141 = *v10++;
        unint64_t v17 = (v17 - 1);
        v13 += (unint64_t)v141 << v12;
        BOOL v175 = v12 >= 8;
        v12 += 8LL;
      }

      while (!v175);
LABEL_220:
      uint64_t v142 = *((void *)v7 + 5);
      if (v142)
      {
        *(_DWORD *)(v142 + 16) = v13;
        *(_DWORD *)(v142 + 20) = v13 >> 8;
      }

      if ((v7[17] & 2) != 0)
      {
        LOWORD(v237) = v13;
        uint64_t v143 = sub_10001DA6C(*((void *)v7 + 3), &v237, 2u);
        uint64_t v16 = (unsigned __int16 *)(v7 + 144);
        uint64_t v14 = (_WORD **)(v7 + 136);
        *((void *)v7 + 3) = v143;
      }

      unint64_t v13 = 0LL;
      LODWORD(v15) = 0;
      unint64_t v30 = 0LL;
      *(_DWORD *)uint64_t v7 = 4;
      int v29 = *((_DWORD *)v7 + 4);
      unsigned int v236 = v28;
      unint64_t v12 = a2;
      a2 = v235;
      a6 = &jpt_10001C19C;
      if ((v29 & 0x400) == 0) {
        goto LABEL_225;
      }
      goto LABEL_227;
    case 2:
      a2 = v12;
      unsigned int v28 = v236;
      goto LABEL_207;
    case 3:
      a2 = v12;
      unsigned int v28 = v236;
      goto LABEL_216;
    case 4:
      int v29 = *((_DWORD *)v7 + 4);
      if ((v29 & 0x400) != 0)
      {
        if (v15 <= 0xF)
        {
LABEL_227:
          unint64_t v145 = v12;
          unint64_t v12 = v15;
          while ((_DWORD)v17)
          {
            unsigned int v146 = *v10++;
            unint64_t v17 = (v17 - 1);
            v13 += (unint64_t)v146 << v12;
            BOOL v175 = v12 >= 8;
            v12 += 8LL;
            if (v175)
            {
              unint64_t v12 = v145;
              goto LABEL_232;
            }
          }

          LODWORD(v15) = v12;
          unsigned int v19 = v234;
          LODWORD(v12) = v145;
          goto LABEL_373;
        }

LABEL_232:
        *((_DWORD *)v7 + 21) = v13;
        uint64_t v147 = *((void *)v7 + 5);
        if (v147) {
          *(_DWORD *)(v147 + 32) = v13;
        }
        if ((v29 & 0x200) != 0)
        {
          LOWORD(v237) = v13;
          uint64_t v148 = a6;
          uint64_t v149 = sub_10001DA6C(*((void *)v7 + 3), &v237, 2u);
          a6 = v148;
          uint64_t v16 = (unsigned __int16 *)(v7 + 144);
          uint64_t v14 = (_WORD **)(v7 + 136);
          unint64_t v13 = 0LL;
          unint64_t v30 = 0LL;
          *((void *)v7 + 3) = v149;
        }

        else
        {
          unint64_t v13 = 0LL;
          unint64_t v30 = 0LL;
        }
      }

      else
      {
        unint64_t v30 = v15;
LABEL_225:
        uint64_t v144 = *((void *)v7 + 5);
        if (v144) {
          *(void *)(v144 + 24) = 0LL;
        }
      }

      *(_DWORD *)uint64_t v7 = 5;
      unint64_t v15 = v30;
LABEL_238:
      int v150 = *((_DWORD *)v7 + 4);
      if ((v150 & 0x400) != 0)
      {
        unsigned int v151 = *((_DWORD *)v7 + 21);
        else {
          unsigned int v152 = *((_DWORD *)v7 + 21);
        }
        if (v152)
        {
          uint64_t v153 = *((void *)v7 + 5);
          if (v153)
          {
            uint64_t v154 = *(void *)(v153 + 24);
            if (v154)
            {
              int v155 = *(_DWORD *)(v153 + 32);
              unsigned int v156 = *(_DWORD *)(v153 + 36);
              uint64_t v157 = v155 - v151;
              uint64_t v158 = (void *)(v154 + v157);
              unsigned int v159 = v157 + v152;
              unsigned int v160 = v156 - v157;
              if (v159 <= v156) {
                size_t v161 = v152;
              }
              else {
                size_t v161 = v160;
              }
              unint64_t v162 = v12;
              unint64_t v163 = v15;
              uint64_t v164 = a6;
              memcpy(v158, v10, v161);
              a6 = v164;
              unint64_t v15 = v163;
              unint64_t v12 = v162;
              a2 = v235;
              uint64_t v16 = (unsigned __int16 *)(v7 + 144);
              uint64_t v14 = (_WORD **)(v7 + 136);
              int v150 = *((_DWORD *)v7 + 4);
            }
          }

          if ((v150 & 0x200) != 0)
          {
            unint64_t v165 = v12;
            unint64_t v166 = v15;
            uint64_t v167 = a6;
            uint64_t v168 = sub_10001DA6C(*((void *)v7 + 3), (int *)v10, v152);
            a6 = v167;
            unint64_t v15 = v166;
            unint64_t v12 = v165;
            a2 = v235;
            uint64_t v16 = (unsigned __int16 *)(v7 + 144);
            uint64_t v14 = (_WORD **)(v7 + 136);
            *((void *)v7 + 3) = v168;
          }

          unint64_t v17 = v17 - v152;
          v10 += v152;
          unsigned int v151 = *((_DWORD *)v7 + 21) - v152;
          *((_DWORD *)v7 + 21) = v151;
        }

        if (v151) {
          goto LABEL_372;
        }
      }

      *((_DWORD *)v7 + 21) = 0;
      *(_DWORD *)uint64_t v7 = 6;
LABEL_254:
      if ((v7[17] & 8) != 0)
      {
        if (!(_DWORD)v17) {
          goto LABEL_372;
        }
        unsigned int v232 = v12;
        unint64_t v170 = 0LL;
        do
        {
          int v171 = v10[v170];
          uint64_t v172 = *((void *)v7 + 5);
          if (v172)
          {
            uint64_t v173 = *(void *)(v172 + 40);
            if (v173)
            {
              uint64_t v174 = *((unsigned int *)v7 + 21);
              if (v174 < *(_DWORD *)(v172 + 48))
              {
                *((_DWORD *)v7 + 21) = v174 + 1;
                *(_BYTE *)(v173 + v174) = v171;
              }
            }
          }

          ++v170;
          if (v171) {
            BOOL v175 = v170 >= v17;
          }
          else {
            BOOL v175 = 1;
          }
        }

        while (!v175);
        if ((v7[17] & 2) != 0)
        {
          unint64_t v176 = v15;
          uint64_t v177 = sub_10001DA6C(*((void *)v7 + 3), (int *)v10, v170);
          unint64_t v15 = v176;
          uint64_t v16 = (unsigned __int16 *)(v7 + 144);
          uint64_t v14 = (_WORD **)(v7 + 136);
          *((void *)v7 + 3) = v177;
        }

        v10 += v170;
        if (v171) {
          goto LABEL_370;
        }
        unint64_t v17 = v17 - v170;
        a2 = v235;
        unint64_t v12 = v232;
        a6 = &jpt_10001C19C;
      }

      else
      {
        uint64_t v169 = *((void *)v7 + 5);
        if (v169) {
          *(void *)(v169 + 40) = 0LL;
        }
      }

      *((_DWORD *)v7 + 21) = 0;
      *(_DWORD *)uint64_t v7 = 7;
LABEL_273:
      if ((v7[17] & 0x10) == 0)
      {
        uint64_t v178 = *((void *)v7 + 5);
        if (v178) {
          *(void *)(v178 + 56) = 0LL;
        }
        goto LABEL_291;
      }

      if ((_DWORD)v17)
      {
        unsigned int v232 = v12;
        unint64_t v170 = 0LL;
        do
        {
          int v179 = v10[v170];
          uint64_t v180 = *((void *)v7 + 5);
          if (v180)
          {
            uint64_t v181 = *(void *)(v180 + 56);
            if (v181)
            {
              uint64_t v182 = *((unsigned int *)v7 + 21);
              if (v182 < *(_DWORD *)(v180 + 64))
              {
                *((_DWORD *)v7 + 21) = v182 + 1;
                *(_BYTE *)(v181 + v182) = v179;
              }
            }
          }

          ++v170;
          if (v179) {
            BOOL v183 = v170 >= v17;
          }
          else {
            BOOL v183 = 1;
          }
        }

        while (!v183);
        if ((v7[17] & 2) != 0)
        {
          unint64_t v184 = v15;
          uint64_t v185 = sub_10001DA6C(*((void *)v7 + 3), (int *)v10, v170);
          unint64_t v15 = v184;
          uint64_t v16 = (unsigned __int16 *)(v7 + 144);
          uint64_t v14 = (_WORD **)(v7 + 136);
          *((void *)v7 + 3) = v185;
        }

        v10 += v170;
        if (!v179)
        {
          unint64_t v17 = v17 - v170;
          a2 = v235;
          unint64_t v12 = v232;
          a6 = &jpt_10001C19C;
LABEL_291:
          *(_DWORD *)uint64_t v7 = 8;
LABEL_292:
          unsigned int v186 = *((_DWORD *)v7 + 4);
          if ((v186 & 0x200) != 0)
          {
            if (v15 <= 0xF)
            {
              uint64_t v21 = 0LL;
              do
              {
                if (!(_DWORD)v17) {
                  goto LABEL_362;
                }
                unint64_t v17 = (v17 - 1);
                unsigned int v187 = *v10++;
                v13 += (unint64_t)v187 << (v15 + v21);
                v21 += 8LL;
              }

              while ((unint64_t)v15 + v21 - 8 < 8);
              unint64_t v15 = (v15 + v21);
            }

            if (v13 != *((unsigned __int16 *)v7 + 12))
            {
              uint64_t v27 = "header crc mismatch";
              goto LABEL_350;
            }

            unint64_t v13 = 0LL;
            unint64_t v15 = 0LL;
          }

          stat v188 = a6;
          unint64_t v189 = v15;
          uint64_t v190 = *((void *)v7 + 5);
          if (v190)
          {
            *(_DWORD *)(v190 + 68) = (v186 >> 9) & 1;
            *(_DWORD *)(v190 + 72) = 1;
          }

          uint64_t v191 = sub_10001DA6C(0, 0LL, 0);
          *((void *)v7 + 3) = v191;
          *(void *)(v6 + 96) = v191;
          *(_DWORD *)uint64_t v7 = 11;
          uint64_t v16 = (unsigned __int16 *)(v7 + 144);
          uint64_t v14 = (_WORD **)(v7 + 136);
          unint64_t v15 = v189;
          a6 = v188;
          goto LABEL_352;
        }

LABEL_370:
        LODWORD(v17) = v17 - v170;
        unsigned int v19 = v234;
        LODWORD(a2) = v235;
        LODWORD(v12) = v232;
        goto LABEL_373;
      }

LABEL_372:
      unsigned int v19 = v234;
      goto LABEL_373;
    case 5:
      goto LABEL_238;
    case 6:
      goto LABEL_254;
    case 7:
      goto LABEL_273;
    case 8:
      goto LABEL_292;
    case 9:
      unint64_t v31 = v12;
      unint64_t v12 = v15;
      do
      {
        if (!(_DWORD)v17)
        {
          LODWORD(v15) = v12;
          unsigned int v19 = v234;
          LODWORD(v12) = v31;
          goto LABEL_373;
        }

        unsigned int v32 = *v10++;
        unint64_t v17 = (v17 - 1);
        v13 += (unint64_t)v32 << v12;
        BOOL v175 = v12 >= 0x18;
        v12 += 8LL;
      }

      while (!v175);
LABEL_37:
      LODWORD(v15) = 0;
      uint64_t v33 = bswap32(v13);
      *((void *)v7 + 3) = v33;
      *(void *)(v6 + 96) = v33;
      *(_DWORD *)uint64_t v7 = 10;
      unint64_t v13 = 0LL;
      unint64_t v12 = v31;
LABEL_38:
      if (!*((_DWORD *)v7 + 3))
      {
        *(void *)(v6 + 24) = v8;
        *(_DWORD *)(v6 + 32) = v236;
        *(void *)uint64_t v6 = v10;
        *(_DWORD *)(v6 + 8) = v17;
        *((void *)v7 + 9) = v13;
        uint64_t result = 2LL;
        *((_DWORD *)v7 + 20) = v15;
        return result;
      }

      unint64_t v34 = a2;
      unint64_t v35 = v12;
      int v36 = v15;
      int v37 = a6;
      uint64_t v38 = sub_100013130(0, 0LL, 0);
      a6 = v37;
      LODWORD(v15) = v36;
      unint64_t v12 = v35;
      a2 = v34;
      uint64_t v16 = (unsigned __int16 *)(v7 + 144);
      uint64_t v14 = (_WORD **)(v7 + 136);
      *((void *)v7 + 3) = v38;
      *(void *)(v6 + 96) = v38;
      *(_DWORD *)uint64_t v7 = 11;
LABEL_40:
      if ((_DWORD)a2 == 5) {
        goto LABEL_372;
      }
LABEL_41:
      if (*((_DWORD *)v7 + 1))
      {
        v13 >>= v15 & 7;
        unint64_t v15 = v15 & 0xFFFFFFF8;
        int v39 = 24;
        goto LABEL_351;
      }

      if (v15 >= 3)
      {
LABEL_46:
        *((_DWORD *)v7 + 1) = v13 & 1;
        __asm { BR              X11 }
      }

      if ((_DWORD)v17)
      {
        v13 += (unint64_t)*v10 << v15;
        goto LABEL_46;
      }

      int v18 = v234;
LABEL_404:
      unsigned int v19 = v18;
      goto LABEL_373;
    case 10:
      goto LABEL_38;
    case 11:
      goto LABEL_40;
    case 12:
      goto LABEL_41;
    case 13:
      v13 >>= v15 & 7;
      uint64_t v40 = v15 & 0xFFFFFFF8;
      if (v40 <= 0x1F)
      {
        uint64_t v41 = 0LL;
        while ((_DWORD)v17)
        {
          unint64_t v17 = (v17 - 1);
          unsigned int v42 = *v10++;
          v13 += (unint64_t)v42 << ((v15 & 0xF8u) + v41);
          v41 += 8LL;
          if ((unint64_t)(v40 + v41 - 8) >= 0x18)
          {
            unint64_t v15 = (v40 + v41);
            goto LABEL_102;
          }
        }

        LODWORD(v15) = (v15 & 0xFFFFFFF8) + v41;
        goto LABEL_372;
      }

      unint64_t v15 = v15 & 0xFFFFFFF8;
LABEL_102:
      if (((v13 >> 16) ^ 0xFFFF) != (unsigned __int16)v13)
      {
        uint64_t v27 = "invalid stored block lengths";
        goto LABEL_350;
      }

      unint64_t v15 = 0LL;
      unsigned int v43 = (unsigned __int16)v13;
      *((_DWORD *)v7 + 21) = (unsigned __int16)v13;
      *(_DWORD *)uint64_t v7 = 14;
      unint64_t v13 = 0LL;
      if (v43)
      {
LABEL_104:
        if (v43 >= v236) {
          size_t v69 = v236;
        }
        else {
          size_t v69 = v43;
        }
        if ((_DWORD)v69)
        {
          uint64_t v231 = v6;
          unint64_t v70 = v12;
          unint64_t v71 = a2;
          unint64_t v72 = v70;
          unint64_t v73 = v15;
          uint64_t v74 = a6;
          memcpy(v8, v10, v69);
          a6 = v74;
          unint64_t v15 = v73;
          unint64_t v75 = v72;
          a2 = v71;
          unint64_t v12 = v75;
          uint64_t v6 = v231;
          uint64_t v16 = (unsigned __int16 *)(v7 + 144);
          uint64_t v14 = (_WORD **)(v7 + 136);
          unint64_t v17 = (v17 - v69);
          v10 += v69;
          v236 -= v69;
          v8 += v69;
          *((_DWORD *)v7 + 21) -= v69;
          goto LABEL_352;
        }

        goto LABEL_372;
      }

      goto LABEL_325;
    case 14:
      unsigned int v43 = *((_DWORD *)v7 + 21);
      if (!v43) {
        goto LABEL_325;
      }
      goto LABEL_104;
    case 15:
      uint64_t v21 = 0LL;
      do
      {
        if (!(_DWORD)v17)
        {
LABEL_362:
          LODWORD(v15) = v15 + v21;
          goto LABEL_372;
        }

        unint64_t v17 = (v17 - 1);
        unsigned int v44 = *v10++;
        v13 += (unint64_t)v44 << (v15 + v21);
        v21 += 8LL;
      }

      while ((unint64_t)v15 + v21 - 8 < 6);
      LODWORD(v15) = v15 + v21;
LABEL_59:
      unint64_t v45 = v13 & 0x1F;
      unint64_t v46 = (v13 >> 5) & 0x1F;
      *((_DWORD *)v7 + 31) = (v13 & 0x1F) + 257;
      *((_DWORD *)v7 + 32) = v46 + 1;
      unint64_t v47 = ((v13 >> 10) & 0xF) + 4;
      *((_DWORD *)v7 + 30) = v47;
      v13 >>= 14;
      unint64_t v15 = (v15 - 14);
      if (v45 > 0x1D || v46 >= 0x1E)
      {
        uint64_t v27 = "too many length or distance symbols";
        goto LABEL_350;
      }

      a2 = v12;
      unsigned int v28 = v236;
      unint64_t v48 = 0LL;
      *((_DWORD *)v7 + 33) = 0;
      *(_DWORD *)uint64_t v7 = 16;
LABEL_63:
      LODWORD(v12) = v15;
      while (2)
      {
        if (v12 > 2)
        {
LABEL_67:
          uint64_t v50 = word_1000450CA[v48];
          *((_DWORD *)v7 + 33) = v48 + 1;
          *(_WORD *)&v7[2 * v50 + 144] = v13 & 7;
          v13 >>= 3;
          unint64_t v12 = (v12 - 3);
          if (v47 != ++v48) {
            continue;
          }
          unint64_t v15 = v12;
          unint64_t v48 = v47;
LABEL_69:
          unint64_t v51 = v15;
          if (v48 <= 0x12)
          {
            do
              *(_WORD *)&v7[2 * word_1000450CA[v48++] + 144] = 0;
            while ((_DWORD)v48 != 19);
            *((_DWORD *)v7 + 33) = 19;
          }

          *((void *)v7 + 17) = v230;
          *((void *)v7 + 12) = v230;
          *((_DWORD *)v7 + 28) = 7;
          unsigned int v52 = sub_100024688(0, v16, 0x13u, v14, v229, v228);
          unsigned int v236 = v28;
          if (v52)
          {
            unsigned int v234 = v52;
            *(void *)(v6 + 48) = "invalid code lengths set";
            *(_DWORD *)uint64_t v7 = 27;
            unint64_t v12 = a2;
            a2 = v235;
            uint64_t v16 = (unsigned __int16 *)(v7 + 144);
            uint64_t v14 = (_WORD **)(v7 + 136);
            a6 = &jpt_10001C19C;
            unint64_t v15 = v51;
            goto LABEL_352;
          }

          unsigned int v53 = 0;
          unsigned int v234 = 0;
          *((_DWORD *)v7 + 33) = 0;
          *(_DWORD *)uint64_t v7 = 17;
          unint64_t v12 = a2;
          a2 = v235;
          uint64_t v16 = (unsigned __int16 *)(v7 + 144);
          uint64_t v14 = (_WORD **)(v7 + 136);
          a6 = &jpt_10001C19C;
          unint64_t v15 = v51;
LABEL_112:
          unsigned int v76 = *((_DWORD *)v7 + 31);
          unsigned int v77 = *((_DWORD *)v7 + 32) + v76;
          if (v53 >= v77) {
            goto LABEL_151;
          }
          uint64_t v78 = *((void *)v7 + 12);
          int v79 = ~(-1 << *((_DWORD *)v7 + 28));
          while (2)
          {
            uint64_t v80 = v79 & v13;
            LODWORD(v81) = *(unsigned __int8 *)(v78 + 4LL * v80 + 1);
            if (v15 < v81)
            {
              uint64_t v82 = 0LL;
              LODWORD(v83) = v17;
              uint64_t v84 = v10;
              do
              {
                if (!(_DWORD)v83) {
                  goto LABEL_361;
                }
                unint64_t v83 = (v83 - 1);
                unsigned int v85 = *v84++;
                v13 += (unint64_t)v85 << (v15 + v82);
                uint64_t v80 = v79 & v13;
                unint64_t v81 = *(unsigned __int8 *)(v78 + 4LL * v80 + 1);
                v82 += 8LL;
              }

              while ((unint64_t)v15 + v82 < v81);
              LODWORD(v15) = v15 + v82;
              int v10 = v84;
              unint64_t v17 = v83;
            }

            unsigned int v86 = *(unsigned __int16 *)(v78 + 4 * v80 + 2);
            if (v86 > 0xF)
            {
              if (v86 != 16)
              {
                if (v86 == 17)
                {
                  unint64_t v90 = (v81 + 3);
                  if (v15 < v90)
                  {
                    uint64_t v91 = 0LL;
                    do
                    {
                      if (!(_DWORD)v17) {
                        goto LABEL_369;
                      }
                      unsigned int v92 = *v10++;
                      unint64_t v17 = (v17 - 1);
                      v13 += (unint64_t)v92 << (v15 + v91);
                      v91 += 8LL;
                    }

                    while ((unint64_t)v15 + v91 < v90);
                    LODWORD(v15) = v15 + v91;
                  }

                  __int16 v93 = 0;
                  int v94 = ((v13 >> v81) & 7) + 3;
                  unint64_t v13 = v13 >> v81 >> 3;
                  unint64_t v15 = (v15 - v81 - 3);
                }

                else
                {
                  unint64_t v97 = (v81 + 7);
                  if (v15 < v97)
                  {
                    uint64_t v91 = 0LL;
                    do
                    {
                      if (!(_DWORD)v17) {
                        goto LABEL_369;
                      }
                      unsigned int v98 = *v10++;
                      unint64_t v17 = (v17 - 1);
                      v13 += (unint64_t)v98 << (v15 + v91);
                      v91 += 8LL;
                    }

                    while ((unint64_t)v15 + v91 < v97);
                    LODWORD(v15) = v15 + v91;
                  }

                  __int16 v93 = 0;
                  int v94 = ((v13 >> v81) & 0x7F) + 11;
                  unint64_t v13 = v13 >> v81 >> 7;
                  unint64_t v15 = (v15 - v81 - 7);
                }

LABEL_353:
                  uint64_t v27 = "invalid bit length repeat";
LABEL_350:
                  *(void *)(v6 + 48) = v27;
                  int v39 = 27;
LABEL_351:
                  *(_DWORD *)uint64_t v7 = v39;
                  goto LABEL_352;
                }
              }

LABEL_369:
              LODWORD(v15) = v15 + v91;
              goto LABEL_372;
            }

            uint64_t v87 = 0LL;
            while (2)
            {
              if (!(_DWORD)v17)
              {
                LODWORD(v15) = v15 + v87;
                goto LABEL_372;
              }

              unsigned int v88 = *v10++;
              unint64_t v17 = (v17 - 1);
              v13 += (unint64_t)v88 << (v15 + v87);
              v87 += 8LL;
              break;
            }

            LODWORD(v15) = v15 + v87;
LABEL_125:
            v13 >>= v81;
            unint64_t v15 = (v15 - v81);
            int v89 = &v7[2 * v53++];
            *((_DWORD *)v7 + 33) = v53;
            *((_WORD *)v89 + 72) = v86;
LABEL_150:
            if (v53 < v77) {
              continue;
            }
            break;
          }

LABEL_151:
          unint64_t v227 = v15;
          *((void *)v7 + 17) = v230;
          *((void *)v7 + 12) = v230;
          *((_DWORD *)v7 + 28) = 9;
          uint64_t v100 = v14;
          uint64_t v101 = v16;
          unsigned int v102 = sub_100024688(1, v16, v76, v14, v229, v228);
          if (v102)
          {
            unsigned int v234 = v102;
            *(void *)(v6 + 48) = "invalid literal/lengths set";
            *(_DWORD *)uint64_t v7 = 27;
            uint64_t v14 = v100;
            uint64_t v16 = v101;
            goto LABEL_194;
          }

          *((void *)v7 + 13) = *((void *)v7 + 17);
          *((_DWORD *)v7 + 29) = 6;
          unsigned int v130 = sub_100024688( 2,  &v101[*((unsigned int *)v7 + 31)],  *((_DWORD *)v7 + 32),  v100,  (unsigned int *)v7 + 29,  v228);
          if (!v130)
          {
            unsigned int v234 = 0;
            *(_DWORD *)uint64_t v7 = 18;
            uint64_t v16 = (unsigned __int16 *)(v7 + 144);
            uint64_t v14 = (_WORD **)(v7 + 136);
            a6 = &jpt_10001C19C;
            a2 = v235;
            LODWORD(v15) = v227;
            unint64_t v12 = v12;
LABEL_305:
            if (v17 >= 6 && v236 > 0x101)
            {
              *(void *)(v6 + 24) = v8;
              *(_DWORD *)(v6 + 32) = v236;
              *(void *)uint64_t v6 = v10;
              *(_DWORD *)(v6 + 8) = v17;
              *((void *)v7 + 9) = v13;
              *((_DWORD *)v7 + 20) = v15;
              __int16 v192 = a6;
              sub_100027FB0(v6, v12);
              a6 = v192;
              uint64_t v16 = (unsigned __int16 *)(v7 + 144);
              uint64_t v14 = (_WORD **)(v7 + 136);
              uint64_t v8 = *(unsigned __int8 **)(v6 + 24);
              unsigned int v236 = *(_DWORD *)(v6 + 32);
              int v10 = *(unsigned __int8 **)v6;
              unint64_t v17 = *(unsigned int *)(v6 + 8);
              unint64_t v13 = *((void *)v7 + 9);
              unint64_t v15 = *((unsigned int *)v7 + 20);
              goto LABEL_352;
            }

            uint64_t v193 = *((void *)v7 + 12);
            int v194 = -1 << *((_DWORD *)v7 + 28);
            v195 = (unsigned __int8 *)(v193 + 4LL * (v13 & ~v194));
            LODWORD(v196) = v195[1];
            if (v15 < v196)
            {
              uint64_t v197 = 0LL;
              int v198 = ~v194;
              LODWORD(v199) = v17;
              int v200 = v10;
              do
              {
                if (!(_DWORD)v199) {
                  goto LABEL_361;
                }
                unint64_t v199 = (v199 - 1);
                unsigned int v201 = *v200++;
                v13 += (unint64_t)v201 << (v15 + v197);
                v195 = (unsigned __int8 *)(v193 + 4LL * (v198 & v13));
                unint64_t v196 = v195[1];
                v197 += 8LL;
              }

              while ((unint64_t)v15 + v197 < v196);
              LODWORD(v15) = v15 + v197;
              int v10 = v200;
              unint64_t v17 = v199;
            }

            int v202 = *((unsigned __int16 *)v195 + 1);
            int v203 = *v195;
            if ((v203 - 1) <= 0xE)
            {
              int v204 = -1 << (v196 + v203);
              v205 = (unsigned __int8 *)(v193 + 4LL * (((v13 & ~v204) >> v196) + v202));
              int v206 = v205[1];
              if ((int)v196 + v206 > v15)
              {
                uint64_t v207 = 0LL;
                int v208 = ~v204;
                LODWORD(v209) = v17;
                v210 = v10;
                do
                {
                  if (!(_DWORD)v209) {
                    goto LABEL_361;
                  }
                  unsigned int v211 = *v210++;
                  unint64_t v209 = (v209 - 1);
                  v13 += (unint64_t)v211 << (v15 + v207);
                  v205 = (unsigned __int8 *)(v193 + 4LL * (((v13 & v208) >> v196) + v202));
                  int v206 = v205[1];
                  v207 += 8LL;
                }

                while ((unint64_t)v15 + v207 < (v196 + v206));
                LODWORD(v15) = v15 + v207;
                int v10 = v210;
                unint64_t v17 = v209;
              }

              int v202 = *((unsigned __int16 *)v205 + 1);
              int v203 = *v205;
              v13 >>= v196;
              LODWORD(v15) = v15 - v196;
              LODWORD(v196) = v206;
            }

            v13 >>= v196;
            unint64_t v15 = (v15 - v196);
            *((_DWORD *)v7 + 21) = v202;
            if (!v203)
            {
              int v39 = 23;
              goto LABEL_351;
            }

            if ((v203 & 0x20) != 0)
            {
LABEL_325:
              int v39 = 11;
              goto LABEL_351;
            }

            if ((v203 & 0x40) != 0)
            {
              uint64_t v27 = "invalid literal/length code";
              goto LABEL_350;
            }

            unsigned int v54 = v203 & 0xF;
            *((_DWORD *)v7 + 23) = v54;
            *(_DWORD *)uint64_t v7 = 19;
            if ((v203 & 0xF) != 0)
            {
LABEL_76:
              if (v15 >= v54)
              {
                __darwin_ct_rune_t v57 = v10;
                unint64_t v56 = v17;
                unsigned int v55 = v15;
LABEL_157:
                *((_DWORD *)v7 + 21) += v13 & ~(-1 << v54);
                v13 >>= v54;
                LODWORD(v15) = v55 - v54;
                int v10 = v57;
                unint64_t v17 = v56;
                goto LABEL_158;
              }

              unsigned int v55 = v15;
              LODWORD(v56) = v17;
              __darwin_ct_rune_t v57 = v10;
              while ((_DWORD)v56)
              {
                unint64_t v56 = (v56 - 1);
                unsigned int v58 = *v57++;
                v13 += (unint64_t)v58 << v55;
                v55 += 8;
                if (v55 >= v54) {
                  goto LABEL_157;
                }
              }
            }

            else
            {
LABEL_158:
              *(_DWORD *)uint64_t v7 = 20;
LABEL_159:
              uint64_t v103 = *((void *)v7 + 13);
              int v104 = -1 << *((_DWORD *)v7 + 29);
              int v105 = (unsigned __int8 *)(v103 + 4LL * (v13 & ~v104));
              LODWORD(v106) = v105[1];
              if (v15 < v106)
              {
                uint64_t v107 = 0LL;
                int v108 = ~v104;
                LODWORD(v109) = v17;
                uint64_t v110 = v10;
                do
                {
                  if (!(_DWORD)v109) {
                    goto LABEL_361;
                  }
                  unint64_t v109 = (v109 - 1);
                  unsigned int v111 = *v110++;
                  v13 += (unint64_t)v111 << (v15 + v107);
                  int v105 = (unsigned __int8 *)(v103 + 4LL * (v108 & v13));
                  unint64_t v106 = v105[1];
                  v107 += 8LL;
                }

                while ((unint64_t)v15 + v107 < v106);
                LODWORD(v15) = v15 + v107;
                int v10 = v110;
                unint64_t v17 = v109;
              }

              int v112 = *((unsigned __int16 *)v105 + 1);
              LODWORD(v113) = *v105;
              if (v113 <= 0xF)
              {
                int v114 = -1 << (v106 + v113);
                uint64_t v113 = v103 + 4LL * (((v13 & ~v114) >> v106) + v112);
                int v115 = *(unsigned __int8 *)(v113 + 1);
                if ((int)v106 + v115 > v15)
                {
                  uint64_t v116 = 0LL;
                  int v117 = ~v114;
                  LODWORD(v118) = v17;
                  uint64_t v119 = v10;
                  do
                  {
                    if (!(_DWORD)v118) {
                      goto LABEL_361;
                    }
                    unsigned int v120 = *v119++;
                    unint64_t v118 = (v118 - 1);
                    v13 += (unint64_t)v120 << (v15 + v116);
                    uint64_t v113 = v103 + 4LL * (((v13 & v117) >> v106) + v112);
                    int v115 = *(unsigned __int8 *)(v113 + 1);
                    v116 += 8LL;
                  }

                  while ((unint64_t)v15 + v116 < (v106 + v115));
                  LODWORD(v15) = v15 + v116;
                  int v10 = v119;
                  unint64_t v17 = v118;
                }

                int v112 = *(unsigned __int16 *)(v113 + 2);
                LOBYTE(v113) = *(_BYTE *)v113;
                v13 >>= v106;
                LODWORD(v15) = v15 - v106;
                LODWORD(v106) = v115;
              }

              v13 >>= v106;
              unint64_t v15 = (v15 - v106);
              if ((v113 & 0x40) != 0)
              {
                uint64_t v27 = "invalid distance code";
                goto LABEL_350;
              }

              unsigned int v59 = v113 & 0xF;
              *((_DWORD *)v7 + 22) = v112;
              *((_DWORD *)v7 + 23) = v59;
              *(_DWORD *)uint64_t v7 = 21;
              if ((v113 & 0xF) == 0)
              {
LABEL_173:
                unsigned int v68 = *((_DWORD *)v7 + 22);
LABEL_174:
                if (v68 > v12 - v236 + *((_DWORD *)v7 + 14))
                {
                  uint64_t v27 = "invalid distance too far back";
                  goto LABEL_350;
                }

                *(_DWORD *)uint64_t v7 = 22;
LABEL_177:
                if (v236)
                {
                  uint64_t v121 = *((unsigned int *)v7 + 22);
                  if (v121 <= v12 - v236)
                  {
                    uint64_t v126 = &v8[-v121];
                    unsigned int v127 = *((_DWORD *)v7 + 21);
                    unsigned int v124 = v127;
                  }

                  else
                  {
                    unsigned int v122 = v121 - (v12 - v236);
                    unsigned int v123 = *((_DWORD *)v7 + 15);
                    unsigned int v124 = v122 - v123;
                    if (v122 <= v123)
                    {
                      unsigned int v125 = v123 - v122;
                      unsigned int v124 = v122;
                    }

                    else
                    {
                      unsigned int v125 = *((_DWORD *)v7 + 13) - v124;
                    }

                    uint64_t v126 = (unsigned __int8 *)(*((void *)v7 + 8) + v125);
                    unsigned int v127 = *((_DWORD *)v7 + 21);
                    if (v124 >= v127) {
                      unsigned int v124 = *((_DWORD *)v7 + 21);
                    }
                  }

                  if (v124 >= v236) {
                    unsigned int v124 = v236;
                  }
                  *((_DWORD *)v7 + 21) = v127 - v124;
                  unsigned int v128 = v124;
                  do
                  {
                    unsigned __int8 v129 = *v126++;
                    *v8++ = v129;
                    --v128;
                  }

                  while (v128);
                  v236 -= v124;
                  if (*((_DWORD *)v7 + 21)) {
                    goto LABEL_352;
                  }
LABEL_191:
                  int v39 = 18;
                  goto LABEL_351;
                }

LABEL_371:
                unsigned int v236 = 0;
                goto LABEL_372;
              }

LABEL_82:
              if (v15 >= v59)
              {
                __darwin_ct_rune_t v62 = v10;
                unint64_t v61 = v17;
                unsigned int v60 = v15;
LABEL_98:
                unsigned int v68 = *((_DWORD *)v7 + 22) + (v13 & ~(-1 << v59));
                *((_DWORD *)v7 + 22) = v68;
                v13 >>= v59;
                unint64_t v15 = v60 - v59;
                int v10 = v62;
                unint64_t v17 = v61;
                goto LABEL_174;
              }

              unsigned int v60 = v15;
              LODWORD(v61) = v17;
              __darwin_ct_rune_t v62 = v10;
              while ((_DWORD)v61)
              {
                unint64_t v61 = (v61 - 1);
                unsigned int v63 = *v62++;
                v13 += (unint64_t)v63 << v60;
                v60 += 8;
                if (v60 >= v59) {
                  goto LABEL_98;
                }
              }
            }

LABEL_361:
            LODWORD(v15) = v15 + 8 * v17;
            unsigned int v19 = v234;
            v10 += v17;
            LODWORD(v17) = 0;
            goto LABEL_373;
          }

          unsigned int v234 = v130;
          *(void *)(v6 + 48) = "invalid distances set";
          *(_DWORD *)uint64_t v7 = 27;
          uint64_t v16 = (unsigned __int16 *)(v7 + 144);
          uint64_t v14 = (_WORD **)(v7 + 136);
LABEL_194:
          a6 = &jpt_10001C19C;
          a2 = v235;
          unint64_t v15 = v227;
          unint64_t v12 = v12;
LABEL_352:
          int v11 = *(_DWORD *)v7;
          goto LABEL_8;
        }

        break;
      }

      if ((_DWORD)v17)
      {
        unint64_t v17 = (v17 - 1);
        unsigned int v49 = *v10++;
        v13 += (unint64_t)v49 << v12;
        LODWORD(v12) = v12 + 8;
        goto LABEL_67;
      }

LABEL_363:
      LODWORD(v15) = v12;
      unsigned int v236 = v28;
      LODWORD(v12) = a2;
      unsigned int v19 = v234;
      LODWORD(a2) = v235;
LABEL_373:
      *(void *)(v6 + 24) = v8;
      *(_DWORD *)(v6 + 32) = v236;
      *(void *)uint64_t v6 = v10;
      *(_DWORD *)(v6 + 8) = v17;
      *((void *)v7 + 9) = v13;
      *((_DWORD *)v7 + 20) = v15;
      if (!*((_DWORD *)v7 + 13) && (*(_DWORD *)v7 > 0x17u || (_DWORD)v12 == v236)) {
        goto LABEL_382;
      }
      if (!sub_10001D900(v6, v12))
      {
        LODWORD(v17) = *(_DWORD *)(v6 + 8);
        unsigned int v236 = *(_DWORD *)(v6 + 32);
LABEL_382:
        uint64_t v220 = v12 - v236;
        *(void *)(v6 + 16) += v233 - v17;
        *(void *)(v6 + 40) += v220;
        *((void *)v7 + 4) += v220;
        if (*((_DWORD *)v7 + 2) && (_DWORD)v12 != v236)
        {
          uint64_t v221 = *((void *)v7 + 3);
          uint64_t v222 = (int *)(*(void *)(v6 + 24) - v220);
          if (*((_DWORD *)v7 + 4)) {
            uint64_t v223 = sub_10001DA6C(v221, v222, v220);
          }
          else {
            uint64_t v223 = sub_100013130(v221, (unsigned __int8 *)v222, v220);
          }
          *((void *)v7 + 3) = v223;
          *(void *)(v6 + 96) = v223;
        }

        *(_DWORD *)(v6 + 88) = *((_DWORD *)v7 + 20) + ((*((_DWORD *)v7 + 1) != 0) << 6) + ((*(_DWORD *)v7 == 11) << 7);
        if (((_DWORD)v12 == v236 && v233 == (_DWORD)v17 || (_DWORD)a2 == 4) && v19 == 0) {
          return 4294967291LL;
        }
        else {
          return v19;
        }
      }

      *(_DWORD *)uint64_t v7 = 28;
      return 4294967292LL;
    case 16:
      a2 = v12;
      unsigned int v28 = v236;
      unint64_t v47 = *((unsigned int *)v7 + 30);
      unint64_t v48 = *((unsigned int *)v7 + 33);
      if (v48 < v47) {
        goto LABEL_63;
      }
      goto LABEL_69;
    case 17:
      unsigned int v53 = *((_DWORD *)v7 + 33);
      goto LABEL_112;
    case 18:
      goto LABEL_305;
    case 19:
      unsigned int v54 = *((_DWORD *)v7 + 23);
      if (v54) {
        goto LABEL_76;
      }
      goto LABEL_158;
    case 20:
      goto LABEL_159;
    case 21:
      unsigned int v59 = *((_DWORD *)v7 + 23);
      if (v59) {
        goto LABEL_82;
      }
      goto LABEL_173;
    case 22:
      goto LABEL_177;
    case 23:
      if (!v236) {
        goto LABEL_371;
      }
      *v8++ = *((_DWORD *)v7 + 21);
      --v236;
      goto LABEL_191;
    case 24:
      if (!*((_DWORD *)v7 + 2)) {
        goto LABEL_334;
      }
      uint64_t v25 = 0LL;
      while ((_DWORD)v17)
      {
        unint64_t v17 = (v17 - 1);
        unsigned int v64 = *v10++;
        v13 += (unint64_t)v64 << (v15 + v25);
        v25 += 8LL;
        if ((unint64_t)v15 + v25 - 8 >= 0x18)
        {
          unint64_t v15 = (v15 + v25);
LABEL_95:
          int v65 = *((_DWORD *)v7 + 4);
          uint64_t v66 = v12 - v236;
          *(void *)(v6 + 40) += v66;
          *((void *)v7 + 4) += v66;
          if ((_DWORD)v12 == v236)
          {
            uint64_t v67 = *((void *)v7 + 3);
          }

          else
          {
            uint64_t v132 = a6;
            unint64_t v133 = v15;
            uint64_t v134 = *((void *)v7 + 3);
            uint64_t v135 = (int *)&v8[-v66];
            if (v65) {
              uint64_t v67 = sub_10001DA6C(v134, v135, v66);
            }
            else {
              uint64_t v67 = sub_100013130(v134, (unsigned __int8 *)v135, v66);
            }
            *((void *)v7 + 3) = v67;
            *(void *)(v6 + 96) = v67;
            int v65 = *((_DWORD *)v7 + 4);
            uint64_t v16 = (unsigned __int16 *)(v7 + 144);
            uint64_t v14 = (_WORD **)(v7 + 136);
            unint64_t v15 = v133;
            a6 = v132;
          }

          unint64_t v212 = bswap32(v13);
          if (v65) {
            unint64_t v213 = v13;
          }
          else {
            unint64_t v213 = v212;
          }
          if (v213 != v67)
          {
            *(void *)(v6 + 48) = "incorrect data check";
            *(_DWORD *)uint64_t v7 = 27;
            unint64_t v12 = v236;
            goto LABEL_352;
          }

          unint64_t v13 = 0LL;
          unint64_t v15 = 0LL;
          unint64_t v12 = v236;
LABEL_334:
          *(_DWORD *)uint64_t v7 = 25;
LABEL_335:
          if (*((_DWORD *)v7 + 2) && *((_DWORD *)v7 + 4))
          {
            if (v15 <= 0x1F)
            {
              uint64_t v25 = 0LL;
              do
              {
                if (!(_DWORD)v17) {
                  goto LABEL_364;
                }
                unint64_t v17 = (v17 - 1);
                unsigned int v214 = *v10++;
                v13 += (unint64_t)v214 << (v15 + v25);
                v25 += 8LL;
              }

              while ((unint64_t)v15 + v25 - 8 < 0x18);
              unint64_t v15 = (v15 + v25);
            }

            if (v13 != *((_DWORD *)v7 + 8))
            {
              uint64_t v27 = "incorrect length check";
              goto LABEL_350;
            }

            unint64_t v13 = 0LL;
            LODWORD(v15) = 0;
          }

          *(_DWORD *)uint64_t v7 = 26;
          unsigned int v19 = 1;
          goto LABEL_373;
        }
      }

LABEL_364:
      LODWORD(v15) = v15 + v25;
      goto LABEL_372;
    case 25:
      goto LABEL_335;
    case 26:
      goto LABEL_373;
    case 27:
      goto LABEL_404;
    case 28:
      return 4294967292LL;
    default:
      return 4294967294LL;
  }

uint64_t sub_10001D900(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(char **)(v4 + 64);
  if (v5
    || (uint64_t v6 = 1LL,
        uint64_t v5 = (char *)(*(uint64_t (**)(void, void, uint64_t))(a1 + 64))( *(void *)(a1 + 80),  (1 << *(_DWORD *)(v4 + 48)),  1LL),  (*(void *)(v4 + 64) = v5) != 0LL))
  {
    unsigned int v7 = *(_DWORD *)(v4 + 52);
    if (!v7)
    {
      unsigned int v7 = 1 << *(_DWORD *)(v4 + 48);
      *(void *)(v4 + 56) = 0LL;
      *(_DWORD *)(v4 + 52) = v7;
    }

    unsigned int v8 = a2 - *(_DWORD *)(a1 + 32);
    if (v8 >= v7)
    {
      memcpy(v5, (const void *)(*(void *)(a1 + 24) - v7), v7);
      uint64_t v6 = 0LL;
      int v13 = *(_DWORD *)(v4 + 52);
      *(_DWORD *)(v4 + 60) = 0;
      goto LABEL_16;
    }

    uint64_t v9 = *(unsigned int *)(v4 + 60);
    unsigned int v10 = v7 - v9;
    else {
      size_t v11 = v10;
    }
    memcpy(&v5[v9], (const void *)(*(void *)(a1 + 24) - v8), v11);
    if (v8 > v10)
    {
      size_t v12 = v8 - v11;
      memcpy(*(void **)(v4 + 64), (const void *)(*(void *)(a1 + 24) - v12), v12);
      uint64_t v6 = 0LL;
      int v13 = *(_DWORD *)(v4 + 52);
      *(_DWORD *)(v4 + 60) = v12;
LABEL_16:
      *(_DWORD *)(v4 + 56) = v13;
      return v6;
    }

    uint64_t v6 = 0LL;
    int v14 = *(_DWORD *)(v4 + 60) + v11;
    unsigned int v16 = *(_DWORD *)(v4 + 52);
    unsigned int v15 = *(_DWORD *)(v4 + 56);
    if (v14 == v16) {
      int v14 = 0;
    }
    *(_DWORD *)(v4 + 60) = v14;
    if (v15 < v16)
    {
      uint64_t v6 = 0LL;
      int v13 = v15 + v11;
      goto LABEL_16;
    }
  }

  return v6;
}

uint64_t sub_10001DA34(uint64_t a1)
{
  if (!a1) {
    return 4294967294LL;
  }
  uint64_t v1 = *(_DWORD **)(a1 + 56);
  if (!v1) {
    return 4294967294LL;
  }
  if (*v1 == 13) {
    return v1[20] == 0;
  }
  return 0LL;
}

uint64_t sub_10001DA6C(int a1, int *a2, unsigned int a3)
{
  if (!a2) {
    return 0LL;
  }
  unsigned int v3 = ~a1;
  if (a3 && (a2 & 3) != 0)
  {
    uint64_t v4 = (char *)a2 + 1;
    do
    {
      char v5 = *(_BYTE *)a2;
      a2 = (int *)((char *)a2 + 1);
      unsigned int v3 = *((void *)&unk_100045970 + (v5 ^ v3)) ^ (v3 >> 8);
      if (!--a3) {
        break;
      }
    }

    while ((unint64_t)(v4++ & 3));
  }

  if (a3 >= 0x20)
  {
    unsigned int v7 = (char *)&unk_100045970 + &unk_100001800;
    do
    {
      unsigned int v8 = *a2 ^ v3;
      int v9 = qword_100046170[BYTE1(v8) + 256] ^ *(void *)&v7[8 * (*(_BYTE *)a2 ^ v3)];
      unsigned int v10 = a2[1] ^ v9 ^ qword_100046170[BYTE2(v8)] ^ *((void *)&unk_100045970 + HIBYTE(v8));
      unsigned int v11 = a2[2] ^ qword_100046170[BYTE1(v10) + 256] ^ *(void *)&v7[8
                                                                     * (*((_BYTE *)a2 + 4) ^ v9 ^ qword_100046170[BYTE2(v8)] ^ *((void *)&unk_100045970 + HIBYTE(v8)))] ^ qword_100046170[BYTE2(v10)] ^ *((void *)&unk_100045970 + HIBYTE(v10));
      unsigned int v12 = a2[3] ^ qword_100046170[BYTE1(v11) + 256] ^ *(void *)&v7[8 * v11] ^ qword_100046170[BYTE2(v11)] ^ *((void *)&unk_100045970 + HIBYTE(v11));
      unsigned int v13 = a2[4] ^ qword_100046170[BYTE1(v12) + 256] ^ *(void *)&v7[8 * v12] ^ qword_100046170[BYTE2(v12)] ^ *((void *)&unk_100045970 + HIBYTE(v12));
      unsigned int v14 = a2[5] ^ qword_100046170[BYTE1(v13) + 256] ^ *(void *)&v7[8 * v13] ^ qword_100046170[BYTE2(v13)] ^ *((void *)&unk_100045970 + HIBYTE(v13));
      unsigned int v15 = a2[6] ^ qword_100046170[BYTE1(v14) + 256] ^ *(void *)&v7[8 * v14] ^ qword_100046170[BYTE2(v14)] ^ *((void *)&unk_100045970 + HIBYTE(v14));
      int v16 = qword_100046170[BYTE1(v15) + 256] ^ *(void *)&v7[8 * v15] ^ qword_100046170[BYTE2(v15)] ^ *((void *)&unk_100045970 + HIBYTE(v15));
      unint64_t v17 = a2 + 8;
      unsigned int v18 = a2[7] ^ v16;
      unsigned int v3 = qword_100046170[BYTE1(v18) + 256] ^ *(void *)&v7[8 * v18] ^ qword_100046170[BYTE2(v18)] ^ *((void *)&unk_100045970 + HIBYTE(v18));
      a3 -= 32;
      a2 += 8;
    }

    while (a3 > 0x1F);
    a2 = v17;
  }

  if (a3 >= 4)
  {
    do
    {
      int v19 = *a2++;
      unsigned int v3 = *((_DWORD *)&unk_100045970 + 2 * ((unsigned __int16)(v19 ^ v3) >> 8) + 1024) ^ *((_DWORD *)&unk_100045970 + 2 * (v19 ^ v3) + 1536) ^ *((_DWORD *)&unk_100045970 + 2 * ((v19 ^ v3) >> 16) + 512) ^ *((void *)&unk_100045970 + ((v19 ^ v3) >> 24));
      a3 -= 4;
    }

    while (a3 > 3);
  }

  for (; a3; --a3)
  {
    char v20 = *(_BYTE *)a2;
    a2 = (int *)((char *)a2 + 1);
    unsigned int v3 = *((void *)&unk_100045970 + (v20 ^ v3)) ^ (v3 >> 8);
  }

  return ~v3;
}

uint64_t sub_10001DCF8(uint64_t result, uint64_t a2)
{
  unint64_t v2 = (result & 0xF000) - 4096;
  else {
    char v3 = aPcDBLSW[v2 >> 12];
  }
  *(_BYTE *)a2 = v3;
  char v4 = 45;
  if ((result & 0x100) != 0) {
    char v5 = 114;
  }
  else {
    char v5 = 45;
  }
  *(_BYTE *)(a2 + 1) = v5;
  if ((result & 0x80) != 0) {
    char v6 = 119;
  }
  else {
    char v6 = 45;
  }
  *(_BYTE *)(a2 + 2) = v6;
  if (((unsigned __int16)result & 0x840u) > 0x7FF)
  {
    if ((result & 0x840) == 0x800) {
      char v4 = 83;
    }
    else {
      char v4 = 115;
    }
  }

  else if ((result & 0x840) != 0)
  {
    char v4 = 120;
  }

  *(_BYTE *)(a2 + 3) = v4;
  char v7 = 45;
  if ((result & 0x20) != 0) {
    char v8 = 114;
  }
  else {
    char v8 = 45;
  }
  *(_BYTE *)(a2 + 4) = v8;
  if ((result & 0x10) != 0) {
    char v9 = 119;
  }
  else {
    char v9 = 45;
  }
  *(_BYTE *)(a2 + 5) = v9;
  if (((unsigned __int16)result & 0x408u) > 0x3FF)
  {
    if ((result & 0x408) == 0x400) {
      char v7 = 83;
    }
    else {
      char v7 = 115;
    }
  }

  else if ((result & 0x408) != 0)
  {
    char v7 = 120;
  }

  *(_BYTE *)(a2 + 6) = v7;
  char v10 = 45;
  if ((result & 4) != 0) {
    char v11 = 114;
  }
  else {
    char v11 = 45;
  }
  *(_BYTE *)(a2 + 7) = v11;
  if ((result & 2) != 0) {
    char v12 = 119;
  }
  else {
    char v12 = 45;
  }
  *(_BYTE *)(a2 + 8) = v12;
  if (((unsigned __int16)result & 0x201u) > 0x1FF)
  {
    if ((result & 0x201) == 0x200) {
      char v10 = 84;
    }
    else {
      char v10 = 116;
    }
  }

  else if ((result & 0x201) != 0)
  {
    char v10 = 120;
  }

  *(_BYTE *)(a2 + 9) = v10;
  *(_WORD *)(a2 + 10) = 32;
  return result;
}

uint64_t sub_10001DE3C(uint64_t a1, unint64_t a2)
{
  if (a2 < 5)
  {
    LOWORD(v5) = 0;
    unsigned __int16 v4 = 0;
    unint64_t v3 = 0LL;
  }

  else
  {
    unint64_t v3 = 0LL;
    unsigned __int16 v4 = 0;
    int v5 = 0;
    do
    {
      int v6 = v5 + *(char *)(a1 + v3);
      int v7 = *(char *)(a1 + v3 + 1);
      int v8 = *(char *)(a1 + v3 + 2);
      int v9 = *(char *)(a1 + v3 + 3);
      v4 += 3 * v7 + 4 * v6 + 2 * v8 + v9;
      int v5 = v6 + v7 + v8 + v9;
      v3 += 4LL;
    }

    while (v3 < a2 - 4);
  }

  unint64_t v10 = a2 - v3;
  if (a2 > v3)
  {
    char v11 = (char *)(a1 + v3);
    do
    {
      __int16 v12 = *v11++;
      LOWORD(v5) = v5 + v12;
      v4 += v5;
      --v10;
    }

    while (v10);
  }

  return (unsigned __int16)v5 | (v4 << 16);
}

uint64_t sub_10001DED4(char *a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  int v9 = *(_DWORD *)(a4 + 12);
  CC_MD4_Init(&c);
  for (; a2; a2 -= v7)
  {
    if (a2 >= 0xFFFFFFFF) {
      uint64_t v7 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v7 = a2;
    }
    CC_MD4_Update(&c, a1, v7);
    a1 += v7;
  }

  CC_MD4_Update(&c, &v9, 4u);
  return CC_MD4_Final(a3, &c);
}

uint64_t sub_10001DF68(char *a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (a4)
  {
    int v10 = *(_DWORD *)(a4 + 12);
    CC_MD4_Update(&c, &v10, 4u);
  }

  for (; a2; a2 -= v8)
  {
    if (a2 >= 0xFFFFFFFF) {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v8 = a2;
    }
    CC_MD4_Update(&c, a1, v8);
    a1 += v8;
  }

  return CC_MD4_Final(a3, &c);
}

uint64_t sub_10001E004(int a1, const char *a2, size_t a3, unsigned __int8 *a4)
{
  uint64_t result = openat(a1, a2, 256);
  if ((_DWORD)result != -1)
  {
    int v8 = result;
    int v9 = sub_100012F30(result, a3, 1);
    if (v9)
    {
      if (qword_100058F00) {
        BOOL v10 = qword_100058F08 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10) {
        sub_10003FED0();
      }
      char v11 = v9;
      if (qword_100058F00) {
        qword_100058F08 = qword_100058F00;
      }
      if (sigsetjmp(dword_100058F10, 0) < 1)
      {
        qword_100058F00 = (uint64_t)v11;
        unsigned int v15 = (char *)sub_100013094(v11, 0LL);
        sub_10001DF68(v15, a3, a4, 0LL);
        if ((void *)qword_100058F00 != v11) {
          sub_10003FEF8();
        }
        qword_100058F00 = qword_100058F08;
        qword_100058F08 = 0LL;
      }

      else
      {
        qword_100058F00 = qword_100058F08;
        qword_100058F08 = 0LL;
        if (dword_100058FD8)
        {
          int v12 = *__error();
          unsigned int v13 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003FF20((uint64_t)a2, v13);
          }
          *__error() = v12;
        }

        sub_100021850("%s: file truncated while hashing", a2);
      }

      sub_1000130B0((uint64_t)v11);
      close(v8);
      return 0LL;
    }

    else
    {
      int v14 = *__error();
      close(v8);
      *__error() = v14;
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

void sub_10001E1A8(void **a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = a2;
    if (a2)
    {
      unsigned __int16 v4 = a1 + 1;
      do
      {
        int v5 = *v4;
        v4 += 2;
        free(v5);
        --v2;
      }

      while (v2);
    }

    free(a1);
  }

uint64_t sub_10001E1F4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(_DWORD *)(*(void *)result + 120LL)) {
    sub_10003FF94();
  }
  if (a3)
  {
    for (uint64_t i = 0LL; i != a3; ++i)
    {
      uint64_t v6 = a2 + 152 * i;
      int v9 = *(_DWORD *)(v6 + 32);
      uint64_t v7 = (_DWORD *)(v6 + 32);
      int v8 = v9;
      if (v9) {
        BOOL v10 = a5 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10)
      {
        uint64_t v11 = a5;
        int v12 = (_DWORD *)(a4 + 4);
        while (v8 != *(v12 - 1))
        {
          v12 += 4;
          if (!--v11) {
            goto LABEL_13;
          }
        }

        *uint64_t v7 = *v12;
      }

LABEL_13:
      ;
    }
  }

  return result;
}

      ;
    }
  }

  return result;
}

    sub_1000402B4();
    goto LABEL_14;
  }

  uint64_t v11 = v18;
  int v12 = v18 & 0xFFFFFFLL;
  a1[17] = v12;
  unsigned int v13 = (v11 >> 24) - 7;
  if (v11 >> 24 == 7) {
    return 1LL;
  }
  if (v12 >= 0x401)
  {
    if (dword_100058FD8)
    {
      int v14 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_1000402E0();
      }
      *__error() = v14;
    }

    sub_100021850("multiplex buffer overflow");
    return 0LL;
  }

  if (!(_DWORD)v12)
  {
    int v12 = 0LL;
    goto LABEL_23;
  }

  if (!sub_10001F988(a2, v19, v12))
  {
    if (!dword_100058FD8) {
      goto LABEL_15;
    }
    unsigned int v15 = *__error();
    if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  if (v19[v12 - 1] == 10) {
    v19[--v12] = 0;
  }
  a1[17] = 0LL;
LABEL_23:
  int v16 = &qword_1000587F0;
  while (1)
  {
    int v16 = (uint64_t *)*v16;
    if (!v16) {
      break;
    }
    if (*((_DWORD *)v16 + 6) == v13) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v16[1])(v16[2], v19, v12);
    }
  }

  if (v12) {
    sub_100021744(-1, "%.*s", v5, v6, v7, v8, v9, v10, v12);
  }
  if ((v13 & 0xFFFFFFFD) != 1) {
    return 1LL;
  }
  ++a1[30];
  if (v11 >> 24 == 8 || *(_DWORD *)(*a1 + 568LL)) {
    return 1LL;
  }
  if (dword_100058FD8)
  {
    unint64_t v17 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10004030C();
    }
    *__error() = v17;
  }

  sub_100021980("error from remote host");
  return 0LL;
}

  sub_100021980("io_write_int");
  return 0LL;
}

    uint64_t result = v7 != a2;
    goto LABEL_14;
  }

  uint64_t result = 1LL;
  if (!a2 || a2 == 47) {
    goto LABEL_14;
  }
  int v12 = *v6;
  uint64_t v27 = v7;
  if (v12 == 94 || v12 == 33)
  {
    LOBYTE(v12) = v4[2];
    unsigned int v28 = 1;
    unsigned int v13 = 2LL;
  }

  else
  {
    unsigned int v28 = 0;
    unsigned int v13 = 1LL;
  }

  int v14 = 0;
  unsigned int v15 = (char *)&v4[v13 + 1];
  unsigned int v26 = a2;
  int v16 = "alnum";
  unint64_t v17 = &off_100055C00;
  do
  {
    if (v12 == 92)
    {
      uint64_t v23 = *v15++;
      LOBYTE(v12) = v23;
LABEL_33:
      if (!(_BYTE)v12) {
        goto LABEL_62;
      }
      unsigned int v18 = *v15;
LABEL_37:
      if (v18 != 45) {
        goto LABEL_44;
      }
      uint64_t v24 = v15[1];
      if (!v15[1] || v24 == 93) {
        goto LABEL_44;
      }
      if (v24 == 92)
      {
        LOBYTE(v24) = v15[2];
        if (!(_BYTE)v24)
        {
LABEL_62:
          uint64_t v7 = v27;
          goto LABEL_13;
        }

        char v20 = v15 + 3;
      }

      else
      {
        char v20 = v15 + 2;
      }

      goto LABEL_47;
    }

    unsigned int v18 = *v15;
    if (v18 != 58)
    {
      LOBYTE(v12) = 91;
      goto LABEL_37;
    }

    int v19 = strchr(v15 + 1, 58);
    if (!v19 || v19[1] != 93)
    {
      LOBYTE(v12) = 91;
LABEL_44:
      char v20 = v15;
      goto LABEL_47;
    }

    char v20 = v19 + 2;
    uint64_t v21 = v19 - (v15 + 1);
    while (strncmp(v15 + 1, v16, v21) || v16[v21])
    {
      unsigned int v22 = *v17;
      v17 += 2;
      int v16 = v22;
      if (!v22)
      {
        LOBYTE(v12) = 91;
        int v16 = "alnum";
        unint64_t v17 = &off_100055C00;
        goto LABEL_44;
      }
    }

    int v16 = "alnum";
    unint64_t v17 = &off_100055C00;
LABEL_47:
    LOBYTE(v12) = *v20;
    unsigned int v15 = v20 + 1;
  }

  while (*v20 != 93);
  if (v14 == v28)
  {
    uint64_t v6 = (unsigned __int8 *)(v20 + 1);
LABEL_61:
    uint64_t result = 1LL;
    goto LABEL_14;
  }

  uint64_t result = 0LL;
  uint64_t v6 = (unsigned __int8 *)(v20 + 1);
LABEL_14:
  *a1 = v6;
  return result;
}

uint64_t sub_10001E270(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(_DWORD *)(*(void *)result + 120LL)) {
    sub_10003FFBC();
  }
  if (a3)
  {
    for (uint64_t i = 0LL; i != a3; ++i)
    {
      uint64_t v6 = a2 + 152 * i;
      int v9 = *(_DWORD *)(v6 + 28);
      uint64_t v7 = (_DWORD *)(v6 + 28);
      int v8 = v9;
      if (v9) {
        BOOL v10 = a5 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10)
      {
        uint64_t v11 = a5;
        int v12 = (_DWORD *)(a4 + 4);
        while (v8 != *(v12 - 1))
        {
          v12 += 4;
          if (!--v11) {
            goto LABEL_13;
          }
        }

        *uint64_t v7 = *v12;
      }

void sub_10001E2EC(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)(*(void *)a1 + 120LL)) {
    sub_10004000C();
  }
  uint64_t v4 = a4;
  if (a4)
  {
    uint64_t v6 = a3 + 4;
    do
    {
      if (!*(_DWORD *)(v6 - 4)) {
        sub_10003FFE4();
      }
      uint64_t v7 = *(const char **)(v6 + 4);
      if (a2)
      {
        int v8 = getgrnam(v7);
        if (v8) {
          goto LABEL_7;
        }
      }

      else
      {
        int v8 = getpwnam(v7);
        if (v8)
        {
LABEL_7:
          int v15 = 0;
          int v16 = v8[4];
          goto LABEL_10;
        }
      }

      int v16 = 0;
      int v15 = 1;
LABEL_10:
      unint64_t v17 = *(_BYTE **)(v6 + 4);
      if (*v17 && !v15) {
        *(_DWORD *)uint64_t v6 = v16;
      }
      else {
        *(_DWORD *)uint64_t v6 = *(_DWORD *)(v6 - 4);
      }
      sub_100021744(3, "remapped identifier %s: %d -> %d", v9, v10, v11, v12, v13, v14, (char)v17);
      v6 += 16LL;
      --v4;
    }

    while (v4);
  }

uint64_t sub_10001E3C0(int a1, void **a2, uint64_t *a3, uint64_t a4)
{
  if (!(_DWORD)a4) {
    return 1LL;
  }
  uint64_t v8 = *a3;
  if (*a3)
  {
    uint64_t v9 = (int *)*a2;
    do
    {
      int v10 = *v9;
      v9 += 4;
      if (v10 == (_DWORD)a4) {
        return 1LL;
      }
    }

    while (--v8);
  }

  *__error() = 0;
  if (a1)
  {
    uint64_t v11 = (const char **)getgrgid(a4);
    if (!v11)
    {
      if (*__error())
      {
        if (dword_100058FD8)
        {
          int v19 = *__error();
          char v20 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_1000401AC(a4, v20, v21, v22, v23, v24, v25, v26);
          }
          *__error() = v19;
        }

        sub_1000218D4("%u: unknown gid", v12, v13, v14, v15, v16, v17, v18, a4);
        return 0LL;
      }

      return 1LL;
    }
  }

  else
  {
    uint64_t v11 = (const char **)getpwuid(a4);
    if (!v11)
    {
      if (*__error())
      {
        if (dword_100058FD8)
        {
          int v49 = *__error();
          uint64_t v50 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_100040034(a4, v50, v51, v52, v53, v54, v55, v56);
          }
          *__error() = v49;
        }

        sub_1000218D4("%u: unknown uid", v42, v43, v44, v45, v46, v47, v48, a4);
        return 0LL;
      }

      return 1LL;
    }
  }

  unsigned int v28 = *v11;
  size_t v29 = strlen(*v11);
  if (v29 >= 0x100)
  {
    if (dword_100058FD8)
    {
      int v30 = *__error();
      unint64_t v31 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040098((uint64_t)v28, a4, v31);
      }
      *__error() = v30;
    }

    sub_100021850("%u: name too long: %s");
    return 0LL;
  }

  if (!v29)
  {
    if (dword_100058FD8)
    {
      int v57 = *__error();
      unsigned int v58 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10004011C(a4, v58, v59, v60, v61, v62, v63, v64);
      }
      *__error() = v57;
    }

    sub_100021850("%u: zero-length name");
    return 0LL;
  }

  unsigned int v32 = (char *)sub_100006FD4(*a2, *a3 + 1, 0x10uLL);
  if (v32)
  {
    *a2 = v32;
    uint64_t v40 = *a3;
    uint64_t v41 = &v32[16 * *a3];
    *(_DWORD *)uint64_t v41 = a4;
    *((void *)v41 + 1) = strdup(v28);
    if (*((void *)*a2 + 2 * v40 + 1))
    {
      sub_100021744( 3,  "adding identifier to list: %s (%u)",  v34,  v35,  v36,  v37,  v38,  v39,  *((void *)*a2 + 2 * v40 + 1));
      ++*a3;
      return 1LL;
    }

    if (dword_100058FD8)
    {
      int v67 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003CD2C();
      }
      *__error() = v67;
    }

    uint64_t v66 = "strdup";
  }

  else
  {
    if (dword_100058FD8)
    {
      int v65 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040180();
      }
      *__error() = v65;
    }

    uint64_t v66 = "reallocarray";
  }

  sub_1000218D4(v66, v33, v34, v35, v36, v37, v38, v39, v68);
  return 0LL;
}

uint64_t sub_10001E718(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = a4;
    uint64_t v7 = (const char **)(a3 + 8);
    while (1)
    {
      if (!*v7) {
        sub_100040210();
      }
      int v8 = *((_DWORD *)v7 - 2);
      if (!v8) {
        sub_100040238();
      }
      size_t v9 = strlen(*v7);
      if (v9 - 256 <= 0xFFFFFFFFFFFFFF00LL) {
        sub_100040260();
      }
      size_t v10 = v9;
      if (!sub_10001FFB4(a1, a2, v8))
      {
        if (!dword_100058FD8)
        {
          sub_100021980("io_write_uint");
          return 0LL;
        }

        int v12 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003F158();
        }
        uint64_t v13 = "io_write_uint";
        goto LABEL_28;
      }

      if (!sub_10001F820(a1, a2, v10))
      {
        if (!dword_100058FD8)
        {
          sub_100021980("io_write_byte");
          return 0LL;
        }

        int v12 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10003C178();
        }
        uint64_t v13 = "io_write_byte";
        goto LABEL_28;
      }

      v7 += 2;
      if (!--v6) {
        goto LABEL_10;
      }
    }

    if (!dword_100058FD8)
    {
      sub_100021980("io_write_buf");
      return 0LL;
    }

    int v12 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003D5F8();
    }
    uint64_t v13 = "io_write_buf";
  }

  else
  {
LABEL_10:
    if (!dword_100058FD8)
    {
      sub_100021980("io_write_int");
      return 0LL;
    }

    int v12 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C7BC();
    }
    uint64_t v13 = "io_write_int";
  }

uint64_t sub_10001E95C(uint64_t a1, int a2, void **a3, uint64_t *a4)
{
  if (sub_100020800(a1, a2, &v31))
  {
    while (1)
    {
      if (!v31) {
        return 1LL;
      }
      int v8 = (char *)sub_100006FD4(*a3, *a4 + 1, 0x10uLL);
      if (!v8)
      {
        if (dword_100058FD8)
        {
          int v24 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_100040180();
          }
          *__error() = v24;
        }

        uint64_t v25 = "reallocarray";
        goto LABEL_35;
      }

      *a3 = v8;
      uint64_t v16 = &v8[16 * *a4];
      *(void *)uint64_t v16 = 0LL;
      *((void *)v16 + 1) = 0LL;
      unsigned int v17 = v30;
      if (!v30)
      {
        if (dword_100058FD8)
        {
          int v18 = *__error();
          int v19 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            v29[0] = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "zero-length name in identifier list",  (uint8_t *)v29,  2u);
          }

          *__error() = v18;
        }

        sub_100021AB0("zero-length name in identifier list");
        unsigned int v17 = v30;
      }

      *((_DWORD *)*a3 + 4 * *a4) = v31;
      char v20 = calloc(v17 + 1LL, 1uLL);
      uint64_t v21 = *a4;
      *((void *)*a3 + 2 * *a4 + 1) = v20;
      size_t v10 = (char *)*((void *)*a3 + 2 * v21 + 1);
      if (!v10)
      {
        if (dword_100058FD8)
        {
          int v27 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003C370();
          }
          *__error() = v27;
        }

        uint64_t v25 = "calloc";
LABEL_35:
        sub_1000218D4(v25, v9, (uint64_t)v10, v11, v12, v13, v14, v15, v29[0]);
        return 0LL;
      }

      if (!sub_10001FC1C(a1, a2, v10, v30))
      {
        if (dword_100058FD8)
        {
          int v28 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003F3E8();
          }
          *__error() = v28;
        }

        sub_100021980("io_read_buf");
        return 0LL;
      }

      ++*a4;
    }

    if (dword_100058FD8)
    {
      int v26 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F2B4();
      }
      *__error() = v26;
    }

    sub_100021980("io_read_byte");
  }

  else
  {
LABEL_14:
    if (dword_100058FD8)
    {
      int v22 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F508();
      }
      *__error() = v22;
    }

    sub_100021980("io_read_uint");
  }

  return 0LL;
}

void sub_10001EC6C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_10001EC7C(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 136);
  uint64_t result = 1LL;
  if (!v2)
  {
    v13.fd = a2;
    v13.events = 1;
    if (poll(&v13, 1u, 0) == -1)
    {
      if (dword_100058FD8)
      {
        int v11 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100040288();
        }
        *__error() = v11;
      }

      sub_1000218D4("poll", v4, v5, v6, v7, v8, v9, v10, v12);
      return 0xFFFFFFFFLL;
    }

    else
    {
      return v13.revents & 1;
    }
  }

  return result;
}

uint64_t sub_10001ED2C(void *a1, int a2)
{
  v8.fd = a2;
  v8.events = 1;
  while (1)
  {
    do
      int v4 = poll(&v8, 1u, -1);
    while (v4 == -1);
    if (!v4 && *__error() != 4)
    {
LABEL_13:
      uint64_t v5 = 0LL;
      goto LABEL_15;
    }

    if ((v8.revents & 1) != 0) {
      break;
    }
    int v7 = -1;
    if ((v8.revents & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_11:
  }

  if (ioctl(a2, 0x4004667FuLL, &v7) == -1) {
    goto LABEL_13;
  }
  if (v7 && (v8.revents & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_14:
  uint64_t v5 = 1LL;
LABEL_15:
  close(a2);
  return v5;
}

uint64_t sub_10001EE0C(void *a1, int a2)
{
  if (a1[17]) {
    return 1LL;
  }
  if (!sub_10001F988(a2, (char *)&v18, 4uLL))
  {
    if (!dword_100058FD8)
    {
LABEL_15:
      sub_100021980("io_read_blocking");
      return 0LL;
    }

    int v15 = *__error();
    if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      *__error() = v15;
      goto LABEL_15;
    }

uint64_t sub_10001F0C8(uint64_t a1, int a2, char *a3, size_t a4)
{
  *(void *)(a1 + 48) += a4;
  int v5 = *(_DWORD *)(a1 + 188);
  if (v5 == -1) {
    return 1LL;
  }
  int v6 = *(_DWORD *)(a1 + 8);
  BOOL v7 = v5 != a2 && v6 == 0;
  if (dword_100058FD8)
  {
    int v9 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_100040338();
    }
    *__error() = v9;
  }

  sub_100021850("write outgoing to batch");
  return 0LL;
}

uint64_t sub_10001F17C(int a1, char *a2, size_t a3)
{
  if (!a3) {
    return 1LL;
  }
  size_t v3 = a3;
  while (1)
  {
    v26.fd = a1;
    v26.events = 4;
    int v6 = poll(&v26, 1u, dword_100058FF0);
    if (!v6) {
      break;
    }
    if (v6 == -1)
    {
      if (dword_100058FD8)
      {
        int v17 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10004046C();
        }
        *__error() = v17;
      }

      int v18 = "poll";
      goto LABEL_43;
    }

    if ((v26.revents & 0x28) != 0)
    {
      if (dword_100058FD8)
      {
        int v19 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100040440();
        }
        *__error() = v19;
      }

      sub_100021850("poll: bad fd");
      goto LABEL_44;
    }

    if ((v26.revents & 0x10) != 0)
    {
      if (dword_100058FD8)
      {
        int v20 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100040414();
        }
        *__error() = v20;
      }

      sub_100021850("poll: hangup");
      goto LABEL_44;
    }

    if ((v26.revents & 4) == 0)
    {
      if (dword_100058FD8)
      {
        int v21 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100040390();
        }
        *__error() = v21;
      }

      sub_100021850("poll: unknown event");
      goto LABEL_44;
    }

    ssize_t v14 = write(a1, a2, v3);
    if (v14 == -1)
    {
      if (dword_100058FD8)
      {
        int v22 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_1000403BC();
        }
        *__error() = v22;
      }

      int v18 = "write";
LABEL_43:
      sub_1000218D4(v18, v7, v8, v9, v10, v11, v12, v13, v25);
      goto LABEL_44;
    }

    if (!v14)
    {
      if (dword_100058FD8)
      {
        int v24 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_1000403E8();
        }
        *__error() = v24;
      }

      sub_100021850("io_write_nonblocking: short write");
      return 0LL;
    }

    a2 += v14;
    v3 -= v14;
    if (!v3) {
      return 1LL;
    }
  }

  if (dword_100058FD8)
  {
    int v16 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_100040498();
    }
    *__error() = v16;
  }

  sub_100021850("poll: timeout");
LABEL_44:
  if (dword_100058FD8)
  {
    int v23 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_100040364();
    }
    *__error() = v23;
  }

  sub_100021980("io_write_nonblocking");
  return 0LL;
}

uint64_t sub_10001F4E8(uint64_t a1, int a2, char *a3, size_t a4, int a5)
{
  size_t v6 = a4;
  uint64_t v7 = a3;
  int v10 = *(_DWORD *)(a1 + 188);
  if (v10 != -1)
  {
    BOOL v11 = v10 != a2 && (*(_DWORD *)(a1 + 8) | a5) == 0;
    if (v11 && !sub_10001F17C(v10, a3, a4))
    {
      if (dword_100058FD8)
      {
        int v16 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100040518();
        }
        *__error() = v16;
      }

      sub_100021850("write outgoing to batch");
      return 0LL;
    }
  }

  if (*(_DWORD *)(a1 + 144))
  {
    if (!v6) {
      return 1LL;
    }
    int v12 = (a5 << 24) + 117440512;
    while (1)
    {
      size_t v13 = v6 >= 0xFFFFFF ? 0xFFFFFFLL : v6;
      int v17 = v12 | v13;
      if (!sub_10001F17C(a2, v7, v13))
      {
        if (!dword_100058FD8) {
          goto LABEL_32;
        }
        int v15 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_30;
        }
        goto LABEL_31;
      }

      *(void *)(a1 + 48) += v13;
      v7 += v13;
      v6 -= v13;
      if (!v6) {
        return 1LL;
      }
    }

    if (!dword_100058FD8) {
      goto LABEL_32;
    }
    int v15 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_30:
    }
      sub_1000404EC();
LABEL_31:
    *__error() = v15;
LABEL_32:
    sub_100021980("io_write_blocking");
    return 0LL;
  }

  if (a5) {
    sub_1000404C4();
  }
  uint64_t result = sub_10001F17C(a2, v7, v6);
  *(void *)(a1 + 48) += v6;
  return result;
}

uint64_t sub_10001F6EC(uint64_t a1, int a2, char *a3, size_t a4)
{
  return sub_10001F4E8(a1, a2, a3, a4, 0);
}

uint64_t sub_10001F6F4(uint64_t a1, int a2, char *__s)
{
  size_t v6 = strlen(__s);
  if (sub_10001F4E8(a1, a2, __s, v6, 0))
  {
    if (!dword_100058FD8)
    {
      uint64_t v9 = "io_write_byte";
      goto LABEL_15;
    }

    int v8 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C178();
    }
    uint64_t v9 = "io_write_byte";
LABEL_12:
    *__error() = v8;
LABEL_15:
    sub_100021980(v9);
    return 0LL;
  }

  if (dword_100058FD8)
  {
    int v8 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003D5F8();
    }
    uint64_t v9 = "io_write_buf";
    goto LABEL_12;
  }

  sub_100021980("io_write_buf");
  return 0LL;
}

uint64_t sub_10001F820(uint64_t a1, int a2, char a3)
{
  char v6 = a3;
  uint64_t v3 = 1LL;
  if (!sub_10001F4E8(a1, a2, &v6, 1uLL, 0))
  {
    if (dword_100058FD8)
    {
      int v4 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D5F8();
      }
      *__error() = v4;
    }

    sub_100021980("io_write_buf");
    return 0LL;
  }

  return v3;
}

uint64_t sub_10001F8B8(int a1, uint64_t a2, uint64_t a3)
{
  char v6 = &qword_1000587F0;
  while (1)
  {
    char v6 = (uint64_t *)*v6;
    if (!v6) {
      break;
    }
    if (*((_DWORD *)v6 + 6) == a1) {
      sub_100040544();
    }
  }

  uint64_t v7 = malloc(0x20uLL);
  if (v7)
  {
    v7[1] = a2;
    v7[2] = a3;
    *((_DWORD *)v7 + 6) = a1;
    *uint64_t v7 = qword_1000587F0;
    qword_1000587F0 = (uint64_t)v7;
    return 1LL;
  }

  else
  {
    if (dword_100058FD8)
    {
      int v16 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F3BC();
      }
      *__error() = v16;
    }

    sub_1000218D4("malloc", v8, v9, v10, v11, v12, v13, v14, v17);
    return 0LL;
  }

uint64_t sub_10001F988(int a1, char *a2, size_t a3)
{
  if (!a3) {
    return 1LL;
  }
  size_t v3 = a3;
  while (sub_100020FB4(a1, a2, v3, &v9, 0))
  {
    if (!v9)
    {
      if (dword_100058FD8)
      {
        int v8 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100040598();
        }
        *__error() = v8;
      }

      sub_100021850("io_read_nonblocking: short read");
      return 0LL;
    }

    a2 += v9;
    v3 -= v9;
    if (!v3) {
      return 1LL;
    }
  }

  if (dword_100058FD8)
  {
    int v7 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10004056C();
    }
    *__error() = v7;
  }

  sub_100021980("io_read_nonblocking");
  return 0LL;
}

uint64_t sub_10001FAB0(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4 = *a4;
  if (!*a4) {
    return 1LL;
  }
  uint64_t v9 = 0LL;
  while (sub_10001FB98(a1, a2, &v12))
  {
    if (v12 == 10)
    {
      *(_BYTE *)(a3 + v9) = 0;
      *a4 = v9;
      return 1LL;
    }

    *(_BYTE *)(a3 + v9++) = v12;
    if (v4 == v9) {
      return 1LL;
    }
  }

  if (dword_100058FD8)
  {
    int v10 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F2B4();
    }
    *__error() = v10;
  }

  sub_100021980("io_read_byte");
  return 0LL;
}

uint64_t sub_10001FB98(uint64_t a1, int a2, char *a3)
{
  uint64_t v3 = 1LL;
  if (!sub_10001FC1C(a1, a2, a3, 1uLL))
  {
    if (dword_100058FD8)
    {
      int v4 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F3E8();
      }
      *__error() = v4;
    }

    sub_100021980("io_read_buf");
    return 0LL;
  }

  return v3;
}

uint64_t sub_10001FC1C(uint64_t a1, int a2, char *a3, size_t a4)
{
  if (*(_DWORD *)(a1 + 128))
  {
    if (a4)
    {
      int v8 = a3;
      size_t v9 = a4;
      while (1)
      {
        while (1)
        {
          size_t v10 = *(void *)(a1 + 136);
          if (v10) {
            break;
          }
          if (!sub_10001EE0C((void *)a1, a2))
          {
            if (dword_100058FD8)
            {
              int v14 = *__error();
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                sub_100040618();
              }
              *__error() = v14;
            }

            sub_100021980("io_read_flush");
            return 0LL;
          }
        }

        size_t v11 = v10 >= v9 ? v9 : *(void *)(a1 + 136);
        *(void *)(a1 + 136) -= v11;
        v8 += v11;
        *(void *)(a1 + 24) += v11;
        v9 -= v11;
        if (!v9) {
          goto LABEL_15;
        }
      }

      if (dword_100058FD8)
      {
        int v16 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_1000402B4();
        }
        *__error() = v16;
      }

      sub_100021980("io_read_blocking");
      return 0LL;
    }

LABEL_15:
    int v13 = *(_DWORD *)(a1 + 188);
    if (dword_100058FD8)
    {
      int v15 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_1000405C4();
      }
      *__error() = v15;
    }

    sub_100021850("write incoming to batch");
    return 0LL;
  }

  if (*(void *)(a1 + 136)) {
    sub_1000405F0();
  }
  uint64_t result = sub_10001F988(a2, a3, a4);
  *(void *)(a1 + 24) += a4;
  if ((_DWORD)result) {
    goto LABEL_15;
  }
  return result;
}

uint64_t sub_10001FE30(uint64_t a1, int a2, unint64_t a3)
{
  if (!(a3 >> 31))
  {
    if (!sub_10001FFC0(a1, a2, a3, 0))
    {
      if (dword_100058FD8)
      {
        int v5 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        goto LABEL_12;
      }

      goto LABEL_13;
    }

    return 1LL;
  }

  unint64_t v8 = a3;
  if (sub_10001FFC0(a1, a2, -1, 0))
  {
    if (!sub_10001F4E8(a1, a2, (char *)&v8, 8uLL, 0))
    {
      if (!dword_100058FD8)
      {
        sub_100021980("io_write_buf");
        return 0LL;
      }

      int v5 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003D5F8();
      }
      int v7 = "io_write_buf";
      goto LABEL_18;
    }

    return 1LL;
  }

  if (dword_100058FD8)
  {
    int v5 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
LABEL_11:
    }
      sub_10003C7BC();
LABEL_12:
    int v7 = "io_write_int";
LABEL_18:
    *__error() = v5;
    sub_100021980(v7);
    return 0LL;
  }

uint64_t sub_10001FFB4(uint64_t a1, int a2, int a3)
{
  return sub_10001FFC0(a1, a2, a3, 0);
}

uint64_t sub_10001FFC0(uint64_t a1, int a2, int a3, int a4)
{
  int v6 = a3;
  if (dword_100058FD8)
  {
    int v5 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003D5F8();
    }
    *__error() = v5;
  }

  sub_100021980("io_write_buf");
  return 0LL;
}

uint64_t sub_10002005C(uint64_t a1, int a2, __int16 a3)
{
  __int16 v4 = a3;
  return sub_10001F4E8(a1, a2, (char *)&v4, 2uLL, 0);
}

void *sub_100020088(uint64_t a1, void *a2, size_t a3, void *__src, size_t __n)
{
  if (*a2 + __n > a3) {
    sub_100040644();
  }
  uint64_t result = memcpy((void *)(a1 + *a2), __src, __n);
  *a2 += __n;
  return result;
}

_DWORD *sub_1000200D8(_DWORD *result, uint64_t a2, void *a3, size_t a4, void *__src, size_t __n)
{
  if (__n)
  {
    if (result[36])
    {
      if (__n + *a3 + 4 > a4) {
        sub_10004066C();
      }
      if (__n >> 24) {
        sub_100040694();
      }
      int __srca = __n + 117440512;
      sub_100020088(a2, a3, a4, &__srca, 4uLL);
    }

    return sub_100020088(a2, a3, a4, __src, __n);
  }

  return result;
}

void *sub_10002019C(uint64_t a1, void *a2, size_t a3, int a4)
{
  __srCC_MD4_CTX c = a4;
  return sub_100020088(a1, a2, a3, &__src, 4uLL);
}

_DWORD *sub_1000201C4(_DWORD *result, uint64_t a2, void *a3, size_t a4, void *a5, size_t a6)
{
  if (a6)
  {
    if (result[36])
    {
      if (a6 + *a3 + 4 > a4) {
        sub_1000406BC();
      }
      if (a6 >> 24) {
        sub_1000406E4();
      }
      if (a6 <= 0x7F) {
        int v11 = 1;
      }
      else {
        int v11 = 2;
      }
      __srCC_MD4_CTX c = a6 + 117440512 + v11;
      sub_100020088(a2, a3, a4, &__src, 4uLL);
    }

    return sub_100020298(a2, a3, a4, a5, a6);
  }

  return result;
}

void *sub_100020298(uint64_t a1, void *a2, size_t a3, void *a4, size_t a5)
{
  if (a5 >= 0x8000) {
    sub_10004070C();
  }
  if (a5 >= 0x80)
  {
    __srCC_MD4_CTX c = BYTE1(a5) ^ 0x80;
    sub_100020088(a1, a2, a3, &__src, 1uLL);
  }

  char v12 = a5;
  sub_100020088(a1, a2, a3, &v12, 1uLL);
  return sub_100020088(a1, a2, a3, a4, a5);
}

uint64_t sub_100020344(uint64_t a1, void **a2, size_t *a3, size_t *a4, uint64_t a5)
{
  uint64_t v7 = a5 + 4LL * (*(_DWORD *)(a1 + 144) != 0);
  size_t v8 = v7 + *a3;
  if (v8 <= *a4) {
    goto LABEL_4;
  }
  size_t v10 = realloc(*a2, v8);
  if (v10)
  {
    *a2 = v10;
    *a4 = v7 + *a3;
    size_t v8 = v7 + *a3;
LABEL_4:
    *a3 = v8;
    return 1LL;
  }

  if (dword_100058FD8)
  {
    int v19 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_100040734();
    }
    *__error() = v19;
  }

  sub_1000218D4("realloc", v11, v12, v13, v14, v15, v16, v17, v20);
  return 0LL;
}

_DWORD *sub_10002041C(_DWORD *a1, uint64_t a2, void *a3, size_t a4, int a5)
{
  __srCC_MD4_CTX c = a5;
  return sub_1000200D8(a1, a2, a3, a4, &__src, 4uLL);
}

_DWORD *sub_100020444(_DWORD *a1, uint64_t a2, void *a3, size_t a4, char a5)
{
  __srCC_MD4_CTX c = a5;
  return sub_1000200D8(a1, a2, a3, a4, &__src, 1uLL);
}

_DWORD *sub_10002046C(_DWORD *a1, uint64_t a2, void *a3, size_t a4, __int16 a5)
{
  __srCC_MD4_CTX c = a5;
  return sub_1000200D8(a1, a2, a3, a4, &__src, 2uLL);
}

void *sub_100020494(uint64_t a1, void *a2, size_t a3, __int16 a4)
{
  __srCC_MD4_CTX c = a4;
  return sub_100020088(a1, a2, a3, &__src, 2uLL);
}

void *sub_1000204BC(uint64_t a1, void *a2, size_t a3, char a4)
{
  __srCC_MD4_CTX c = a4;
  return sub_100020088(a1, a2, a3, &__src, 1uLL);
}

uint64_t sub_1000204E4(uint64_t a1, int a2, void *a3)
{
  if (sub_1000205E8(a1, a2, &v8))
  {
    uint64_t v4 = v8;
    *a3 = v8;
    if ((v4 & 0x8000000000000000LL) == 0) {
      return 1LL;
    }
    if (!dword_100058FD8)
    {
      uint64_t v7 = "io_read_long negative";
      goto LABEL_15;
    }

    int v6 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_100040760();
    }
    uint64_t v7 = "io_read_long negative";
LABEL_12:
    *__error() = v6;
LABEL_15:
    sub_100021980(v7);
    return 0LL;
  }

  if (dword_100058FD8)
  {
    int v6 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F4DC();
    }
    uint64_t v7 = "io_read_long";
    goto LABEL_12;
  }

  sub_100021980("io_read_long");
  return 0LL;
}

uint64_t sub_1000205E8(uint64_t a1, int a2, void *a3)
{
  if (sub_100020800(a1, a2, &v10))
  {
    uint64_t v6 = v10;
    if (v10 != -1)
    {
LABEL_5:
      *a3 = v6;
      return 1LL;
    }

    if (sub_10001FC1C(a1, a2, (char *)&v11, 8uLL))
    {
      uint64_t v6 = v11;
      goto LABEL_5;
    }

    if (dword_100058FD8)
    {
      int v9 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F3E8();
      }
      *__error() = v9;
    }

    sub_100021980("io_read_buf");
  }

  else
  {
    if (dword_100058FD8)
    {
      int v8 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C7E8();
      }
      *__error() = v8;
    }

    sub_100021980("io_read_int");
  }

  return 0LL;
}

uint64_t sub_10002070C(uint64_t a1, int a2, void *a3)
{
  if (sub_100020800(a1, a2, &v7))
  {
    if ((v7 & 0x80000000) == 0)
    {
      *a3 = v7;
      return 1LL;
    }

    if (dword_100058FD8)
    {
      int v6 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10004078C();
      }
      *__error() = v6;
    }

    sub_100021850("io_read_size: negative value");
  }

  else
  {
    if (dword_100058FD8)
    {
      int v5 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003C7E8();
      }
      *__error() = v5;
    }

    sub_100021980("io_read_int");
  }

  return 0LL;
}

uint64_t sub_100020800(uint64_t a1, int a2, _DWORD *a3)
{
  if (sub_10001FC1C(a1, a2, (char *)&v6, 4uLL))
  {
    *a3 = v6;
    return 1LL;
  }

  else
  {
    if (dword_100058FD8)
    {
      int v5 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F3E8();
      }
      *__error() = v5;
    }

    sub_100021980("io_read_buf");
    return 0LL;
  }

uint64_t sub_10002089C(uint64_t a1, int a2, _DWORD *a3)
{
  if (sub_10001FC1C(a1, a2, (char *)&v6, 2uLL))
  {
    *a3 = v6;
    return 1LL;
  }

  else
  {
    if (dword_100058FD8)
    {
      int v5 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10003F3E8();
      }
      *__error() = v5;
    }

    sub_100021980("io_read_buf");
    return 0LL;
  }

void *sub_10002093C(uint64_t a1, void *a2, size_t a3, void *__dst, size_t __n)
{
  if (*a2 + __n > a3) {
    sub_1000407B8();
  }
  uint64_t result = memcpy(__dst, (const void *)(a1 + *a2), __n);
  *a2 += __n;
  return result;
}

void *sub_10002098C(uint64_t a1, void *a2, size_t a3, _DWORD *a4)
{
  uint64_t result = sub_10002093C(a1, a2, a3, &__dst, 4uLL);
  *a4 = __dst;
  return result;
}

uint64_t sub_1000209C4(uint64_t a1, void *a2, size_t a3, void *a4)
{
  if ((__dst & 0x80000000) != 0)
  {
    if (dword_100058FD8)
    {
      int v6 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_1000407E0();
      }
      *__error() = v6;
    }

    sub_100021850("io_unbuffer_size: negative value");
    return 0LL;
  }

  else
  {
    *a4 = __dst;
    return 1LL;
  }

uint64_t sub_100020A60(uint64_t a1, int a2, char *a3, unint64_t a4)
{
  if (!sub_10001FB98(a1, a2, (char *)&v16))
  {
    if (!dword_100058FD8)
    {
LABEL_8:
      sub_100021980("io_read_vstring byte 1");
      return 0LL;
    }

    int v10 = *__error();
    if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      *__error() = v10;
      goto LABEL_8;
    }

uint64_t sub_100020C5C(uint64_t a1, void **a2, unint64_t a3)
{
  int v5 = a2[3];
  unint64_t v6 = v5 - (_BYTE *)a2[2];
  BOOL v7 = a3 > v6;
  unint64_t v8 = a3 - v6;
  if (!v7) {
    return 1LL;
  }
  uint64_t v9 = realloc(*a2, (size_t)&v5[v8]);
  if (v9)
  {
    *a2 = v9;
    a2[3] = (char *)a2[3] + v8;
    return 1LL;
  }

  if (dword_100058FD8)
  {
    int v18 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_100040734();
    }
    *__error() = v18;
  }

  sub_1000218D4("realloc", v10, v11, v12, v13, v14, v15, v16, v19);
  return 0LL;
}

uint64_t sub_100020D14(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_100020D1C(uint64_t a1, void *a2, int a3)
{
  if (!a2[3]) {
    sub_1000408E4();
  }
  sub_100020F78(a2);
  LOBYTE(v6) = 0;
  do
  {
    while (1)
    {
      int v7 = sub_10001EC7C(a1, a3);
      if (v7 < 1) {
        goto LABEL_32;
      }
      if (!*(_DWORD *)(a1 + 128))
      {
        uint64_t v9 = a2[2] + a2[1];
        uint64_t v10 = a2[3];
        size_t v11 = v10 - v9;
        if (v10 == v9) {
          goto LABEL_32;
        }
        goto LABEL_14;
      }

      unint64_t v8 = *(void *)(a1 + 136);
      if (!v8) {
        break;
      }
      uint64_t v9 = a2[2] + a2[1];
      unint64_t v12 = a2[3] - v9;
      if (!v12) {
        goto LABEL_32;
      }
      if (v12 >= v8) {
        size_t v11 = *(void *)(a1 + 136);
      }
      else {
        size_t v11 = a2[3] - v9;
      }
LABEL_14:
      if (!sub_100020FB4(a3, (void *)(*a2 + v9), v11, (ssize_t *)&v21, 1))
      {
        if (dword_100058FD8)
        {
          int v19 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10004056C();
          }
          char v20 = "io_read_nonblocking";
LABEL_40:
          *__error() = v19;
          goto LABEL_43;
        }

        sub_100021980("io_read_nonblocking");
LABEL_44:
        unsigned int v6 = 0;
LABEL_33:
        if (v7 >= 0) {
          return v6;
        }
        else {
          return 0LL;
        }
      }

      unint64_t v13 = v21;
      if (!v21)
      {
        if ((v6 & 1) != 0)
        {
LABEL_32:
          unsigned int v6 = 1;
          goto LABEL_33;
        }

        if (dword_100058FD8)
        {
          int v19 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10004090C();
          }
          char v20 = "unexpected eof";
          goto LABEL_40;
        }

        char v20 = "unexpected eof";
LABEL_43:
        sub_100021980(v20);
        goto LABEL_44;
      }

      a2[2] += v21;
      *(void *)(a1 + 24) += v13;
      unint64_t v14 = *(void *)(a1 + 136);
      if (v14)
      {
        BOOL v15 = v14 >= v13;
        unint64_t v16 = v14 - v13;
        if (!v15) {
          sub_100040938();
        }
        *(void *)(a1 + 136) = v16;
      }

      unsigned int v6 = 1;
      if (v13 == v11) {
        goto LABEL_33;
      }
    }
  }

  while (sub_10001EE0C((void *)a1, a3));
  if (dword_100058FD8)
  {
    int v17 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_100040618();
    }
    *__error() = v17;
  }

  sub_100021980("io_read_flush");
  return 0LL;
}

void *sub_100020F78(void *result)
{
  uint64_t v1 = result[1];
  if (v1)
  {
    uint64_t v2 = result;
    size_t v3 = result[2];
    if (v3) {
      uint64_t result = memmove((void *)*result, (const void *)(*result + v1), v3);
    }
    v2[1] = 0LL;
  }

  return result;
}

uint64_t sub_100020FB4(int a1, void *a2, size_t a3, ssize_t *a4, char a5)
{
  *a4 = 0LL;
  uint64_t result = 1LL;
  if (a3)
  {
    v28.fd = a1;
    v28.events = 1;
    int v11 = poll(&v28, 1u, dword_100058FF0);
    if (!v11)
    {
      if (dword_100058FD8)
      {
        int v21 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100040498();
        }
        *__error() = v21;
      }

      sub_100021850("poll: timeout");
      return 0LL;
    }

    if (v11 == -1)
    {
      if (dword_100058FD8)
      {
        int v19 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10004046C();
        }
        *__error() = v19;
      }

      char v20 = "poll";
LABEL_9:
      sub_1000218D4(v20, v12, v13, v14, v15, v16, v17, v18, v27);
      return 0LL;
    }

    if ((v28.revents & 0x28) != 0)
    {
      if (dword_100058FD8)
      {
        int v22 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100040440();
        }
        *__error() = v22;
      }

      sub_100021850("poll: bad fd");
      return 0LL;
    }

    if ((v28.revents & 0x11) == 0)
    {
      if (dword_100058FD8)
      {
        int v25 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100040390();
        }
        *__error() = v25;
      }

      sub_100021850("poll: unknown event");
      return 0LL;
    }

    ssize_t v23 = read(a1, a2, a3);
    if (v23)
    {
      if (v23 == -1)
      {
        if (dword_100058FD8)
        {
          int v24 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_100040960();
          }
          *__error() = v24;
        }

        char v20 = "read";
        goto LABEL_9;
      }
    }

    else if ((a5 & 1) == 0)
    {
      if (dword_100058FD8)
      {
        int v26 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_10004098C();
        }
        *__error() = v26;
      }

      sub_100021850("unexpected end of file");
      return 0LL;
    }

    *a4 = v23;
    return 1LL;
  }

  return result;
}

void *sub_100021278(void *a1, void *a2, size_t a3)
{
  uint64_t result = sub_1000212B8(a1, a2, a3);
  size_t v6 = a1[2] - a3;
  a1[2] = v6;
  if (v6) {
    size_t v6 = a1[1] + a3;
  }
  a1[1] = v6;
  return result;
}

void *sub_1000212B8(void *a1, void *__dst, size_t a3)
{
  if (a1[2] < a3) {
    sub_1000409B8();
  }
  return memcpy(__dst, (const void *)(*a1 + a1[1]), a3);
}

void *sub_1000212E8(void *a1, void *a2)
{
  uint64_t result = sub_1000212B8(a1, a2, 1uLL);
  uint64_t v4 = a1[2] - 1LL;
  a1[2] = v4;
  if (v4) {
    uint64_t v4 = a1[1] + 1LL;
  }
  a1[1] = v4;
  return result;
}

uint64_t sub_100021328(void *a1)
{
  return __dst;
}

void *sub_100021350(void *a1, _DWORD *a2)
{
  uint64_t result = sub_1000212B8(a1, &__dst, 4uLL);
  uint64_t v5 = a1[2] - 4LL;
  a1[2] = v5;
  if (v5) {
    uint64_t v5 = a1[1] + 4LL;
  }
  a1[1] = v5;
  *a2 = __dst;
  return result;
}

void *sub_1000213A8(void *a1, _DWORD *a2)
{
  uint64_t result = sub_1000212B8(a1, &__dst, 2uLL);
  uint64_t v5 = a1[2] - 2LL;
  a1[2] = v5;
  if (v5) {
    uint64_t v5 = a1[1] + 2LL;
  }
  a1[1] = v5;
  *a2 = __dst;
  return result;
}

uint64_t sub_100021404(void *a1, void *a2)
{
  if ((v6 & 0x80000000) != 0)
  {
    if (dword_100058FD8)
    {
      int v4 = *__error();
      uint64_t v5 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_1000409E0(v5);
      }
      *__error() = v4;
    }

    sub_100021850("%s: negative value", "iobuf_read_size");
    return 0LL;
  }

  else
  {
    *a2 = v6;
    return 1LL;
  }

uint64_t sub_1000214A8(void *a1, char **a2)
{
  unint64_t v2 = a1[2];
  if (!v2) {
    return 0LL;
  }
  uint64_t v5 = *a2;
  if (*a2)
  {
    size_t v6 = (size_t)a2[2];
LABEL_4:
    int v7 = a2[1];
    else {
      size_t v8 = v2;
    }
    sub_1000212B8(a1, &v7[(void)v5], v8);
    size_t v9 = a1[2] - v8;
    a1[2] = v9;
    if (v9) {
      size_t v9 = a1[1] + v8;
    }
    a1[1] = v9;
    uint64_t v10 = a2[2];
    size_t v11 = (size_t)&a2[1][v8];
    a2[1] = (char *)v11;
    return v11 == (void)v10;
  }

  if (v2 < 2) {
    return 0LL;
  }
  sub_1000212B8(a1, &__dst, 1uLL);
  uint64_t v13 = a1[2];
  unint64_t v2 = v13 - 1;
  a1[2] = v13 - 1;
  if (v13 == 1) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = a1[1] + 1LL;
  }
  a1[1] = v14;
  unsigned __int8 v15 = __dst;
  if ((char)__dst < 0)
  {
    uint64_t v16 = (__dst << 8) - 0x8000;
    sub_1000212B8(a1, &__dst, 1uLL);
    uint64_t v17 = a1[2];
    unint64_t v2 = v17 - 1;
    a1[2] = v17 - 1;
    if (v17 == 1) {
      uint64_t v18 = 0LL;
    }
    else {
      uint64_t v18 = a1[1] + 1LL;
    }
    a1[1] = v18;
    unsigned __int8 v15 = __dst;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  size_t v6 = v16 | v15;
  a2[2] = (char *)v6;
  uint64_t v5 = (char *)malloc(v6);
  *a2 = v5;
  if (v5) {
    goto LABEL_4;
  }
  if (dword_100058FD8)
  {
    int v26 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003F3BC();
    }
    *__error() = v26;
  }

  sub_1000218D4("malloc", v19, v20, v21, v22, v23, v24, v25, v27);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10002164C(char *a1)
{
  uint64_t v2 = 0LL;
  while (!strcasecmp((&off_100054920)[v2], a1))
  {
    v2 += 2LL;
    if (v2 == 36)
    {
      *__error() = 2;
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t result = 0LL;
  dword_100058668 = (int)(&off_100054920)[v2 + 1];
  return result;
}

void sub_1000216C0(uint64_t a1)
{
  uint64_t v2 = (FILE *)qword_1000587F8;
  qword_1000587F8 = a1;
  if (v2) {
    BOOL v3 = __stderrp == v2;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    fclose(v2);
  }
  if (a1 || !v2)
  {
    if (a1)
    {
      if (!v2) {
        closelog();
      }
    }
  }

  else
  {
    openlog("openrsyncd", 9, dword_100058668);
  }

void sub_100021744( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v23 = 0LL;
  if (dword_100058FDC > a1)
  {
    if (!a2) {
      goto LABEL_7;
    }
    if (a1 <= 0 && v23)
    {
      sub_10002180C(6, "%s\n", v10, v11, v12, v13, v14, v15, (char)v23);
    }

    else
    {
LABEL_7:
      if (a1 >= 1)
      {
        char v16 = getprogname();
        sub_10002180C(6, "%s: %s%s\n", v17, v18, v19, v20, v21, v22, v16);
      }
    }

    free(v23);
  }

void sub_10002180C( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (qword_1000587F8) {
    vfprintf((FILE *)qword_1000587F8, a2, &a9);
  }
  else {
    vsyslog(a1, a2, &a9);
  }
}

void sub_100021850(char *a1, ...)
{
  size_t v8 = 0LL;
  if (!a1 || vasprintf(&v8, a1, va) != -1)
  {
    char v1 = getprogname();
    sub_10002180C(3, "%s: error%s%s\n", v2, v3, v4, v5, v6, v7, v1);
    free(v8);
  }

void sub_1000218D4( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v18 = 0LL;
  int v10 = *__error();
  if (!a1 || vasprintf(&v18, a1, &a9) != -1)
  {
    char v11 = getprogname();
    strerror(v10);
    sub_10002180C(3, "%s: error%s%s: %s\n", v12, v13, v14, v15, v16, v17, v11);
    free(v18);
  }

void sub_100021980(char *a1, ...)
{
  size_t v8 = 0LL;
  if (dword_100058FDC >= 1 && (!a1 || vasprintf(&v8, a1, va) != -1))
  {
    char v1 = getprogname();
    sub_10002180C(3, "%s: error%s%s\n", v2, v3, v4, v5, v6, v7, v1);
    free(v8);
  }

void sub_100021A18(char *a1, ...)
{
  size_t v8 = 0LL;
  if (dword_100058FDC >= 1 && (!a1 || vasprintf(&v8, a1, va) != -1))
  {
    char v1 = getprogname();
    sub_10002180C(4, "%s: warning%s%s\n", v2, v3, v4, v5, v6, v7, v1);
    free(v8);
  }

void sub_100021AB0(char *a1, ...)
{
  size_t v8 = 0LL;
  if (!a1 || vasprintf(&v8, a1, va) != -1)
  {
    char v1 = getprogname();
    sub_10002180C(4, "%s: warning%s%s\n", v2, v3, v4, v5, v6, v7, v1);
    free(v8);
  }

void sub_100021B34( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v20 = 0LL;
  char v11 = __error();
  if (dword_100058FDC >= a1)
  {
    int v12 = *v11;
    if (!a2 || vasprintf(&v20, a2, &a9) != -1)
    {
      char v13 = getprogname();
      strerror(v12);
      sub_10002180C(4, "%s: warning%s%s: %s\n", v14, v15, v16, v17, v18, v19, v13);
      free(v20);
    }
  }

uint64_t sub_100021BF8(uint64_t a1, char *a2, _BYTE *a3)
{
  if (*(_DWORD *)(*(void *)a1 + 212LL)) {
    return fprintf(*(FILE **)(*(void *)a1 + 456LL), a2, a3);
  }
  uint64_t v7 = usbuf_new(0LL, 0LL, 0LL, 1LL);
  __darwin_ct_rune_t v8 = *a3;
  if (*a3)
  {
    size_t v9 = a3 + 1;
    do
    {
      if ((v8 & 0x80) != 0) {
        __uint32_t v10 = __maskrune(v8, 0x40000uLL);
      }
      else {
        __uint32_t v10 = _DefaultRuneLocale.__runetype[v8] & 0x40000;
      }
      if (v8 == 9 || v10) {
        usbuf_putc(v7, (char)*(v9 - 1));
      }
      else {
        usbuf_printf(v7, "\\#%03o", v8);
      }
      __darwin_ct_rune_t v11 = *v9++;
      __darwin_ct_rune_t v8 = v11;
    }

    while (v11);
  }

  usbuf_finish(v7);
  int v12 = *(FILE **)(*(void *)a1 + 456LL);
  uint64_t v13 = usbuf_data(v7);
  fprintf(v12, a2, v13);
  return usbuf_delete(v7);
}

uint64_t sub_100021D28(void *a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(const char **)(*a1 + 448LL);
  if (!v3) {
    return 0LL;
  }
  size_t v7 = strlen(*(const char **)(*a1 + 448LL));
  unsigned int v11 = 0;
  if (*v3)
  {
    __darwin_ct_rune_t v8 = &v3[v7];
    do
    {
LABEL_4:
      size_t v9 = v3;
      while (v3 < v8)
      {
        if (*v3 == 37)
        {
          if (a3)
          {
            fwrite(v9, 1uLL, v3 - v9, *(FILE **)(*a1 + 456LL));
            if (v3[1] == 37)
            {
              fputc(37, *(FILE **)(*a1 + 456LL));
LABEL_16:
              v3 += 2;
              goto LABEL_4;
            }
          }

          else if (v3[1] == 37)
          {
            goto LABEL_16;
          }

          size_t v9 = sub_100021E70(v3, (int *)&v11, a1, a2, a3);
          if (!v9) {
            return v11;
          }
          uint64_t v3 = v9;
          if (!*v9) {
            return v11;
          }
        }

        else
        {
          ++v3;
        }
      }

      if (a3) {
        fwrite(v9, 1uLL, v3 - v9, *(FILE **)(*a1 + 456LL));
      }
    }

    while (*v3);
  }

  if (a3) {
    fputc(10, *(FILE **)(*a1 + 456LL));
  }
  a1[4] = a1[3];
  a1[7] = a1[6];
  return v11;
}

const char *sub_100021E70(const char *a1, int *a2, void *a3, uint64_t a4, int a5)
{
  __uint32_t v10 = &v89[-((__chkstk_darwin() + 16) & 0xFFFFFFFFFFFFFFF0LL)];
  *(_WORD *)__uint32_t v10 = 37;
  unsigned int v11 = v10 + 1;
  int v12 = a1 + 1;
  char v94 = 37;
  size_t v13 = strspn(v12, "'+- 0123456789");
  if (v13 - 8188 <= 0xFFFFFFFFFFFFDFFELL)
  {
    if (dword_100058FD8)
    {
      int v14 = *__error();
      uint64_t v15 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040A5C(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      *__error() = v14;
    }

    sub_100021850("Insufficient buffer for width format");
    return 0LL;
  }

  size_t v23 = v13;
  __strlcpy_chk(v95, v12, v13 + 1, 0x1FFFLL);
  if (strchr(&v94, 39))
  {
    size_t v24 = strlen(&v94);
    uint64_t v25 = malloc(v24);
    if (v25)
    {
      uint64_t v33 = v25;
      unint64_t v90 = a3;
      int v34 = 0;
      uint64_t v35 = &v94;
      uint64_t v36 = v25;
      while (1)
      {
        int v37 = *v35;
        if (v37 == 39)
        {
          ++v34;
        }

        else
        {
          if (!*v35)
          {
            uint64_t v91 = a4;
            _BYTE *v36 = 0;
            __strlcpy_chk(&v94, v25, v23 + 1, 0x2000LL);
            v23 -= v34;
            free(v33);
            goto LABEL_17;
          }

          *v36++ = v37;
        }

        ++v35;
      }
    }

    if (dword_100058FD8)
    {
      int v58 = *__error();
      uint64_t v59 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040ABC(v59, v60, v61, v62, v63, v64, v65, v66);
      }
      *__error() = v58;
    }

    sub_1000218D4("malloc", v26, v27, v28, v29, v30, v31, v32, v89[0]);
    return 0LL;
  }

  unint64_t v90 = a3;
  uint64_t v91 = a4;
  int v34 = 0;
LABEL_17:
  char v38 = *v12;
  if (!*v12)
  {
LABEL_20:
    if (dword_100058FD8)
    {
      int v41 = *__error();
      uint64_t v42 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040A8C(v42, v43, v44, v45, v46, v47, v48, v49);
      }
      *__error() = v41;
    }

    sub_100021850("missing format character");
    return 0LL;
  }

  while (1)
  {
    int v39 = v38;
    if (!memchr("'-+ 0", v38, 6uLL)) {
      break;
    }
    int v40 = *(unsigned __int8 *)++v12;
    *unsigned int v11 = v38;
    *++unsigned int v11 = 0;
    char v38 = v40;
    if (!v40) {
      goto LABEL_20;
    }
  }

  if ((v38 - 48) <= 9)
  {
    do
    {
      uint64_t v52 = v11;
      int v53 = *++v12;
      int v39 = v53;
      *++unsigned int v11 = 0;
      *uint64_t v52 = v38;
      char v38 = v53;
    }

    while ((v53 - 48) < 0xA);
  }

  *unsigned int v11 = v38;
  v11[1] = 0;
  uint64_t v50 = v12 + 1;
  if (v39 > 76)
  {
    uint64_t v54 = v91;
    switch(v39)
    {
      case 'b':
        *a2 |= 2u;
        if (a5)
        {
          uint64_t v55 = v90;
          uint64_t v56 = (char *)(v90[3] + v90[6] - (v90[4] + v90[7]));
          switch(v34)
          {
            case 0:
            case 1:
              strcpy(&v95[v23], "ld");
              int v57 = *(FILE **)(*v55 + 456LL);
              uint64_t v87 = v56;
              goto LABEL_84;
            case 2:
              uint64_t v84 = 3LL;
              goto LABEL_87;
            case 3:
              uint64_t v84 = 11LL;
LABEL_87:
              humanize_number(v93, 5LL, v56, "", 32LL, v84);
              *(_WORD *)&v95[v23] = 115;
              uint64_t v82 = *v55;
              goto LABEL_79;
            default:
              return v50;
          }
        }

        return v50;
      case 'c':
        int v78 = *a2 | 2;
        goto LABEL_60;
      case 'd':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'o':
      case 'q':
      case 'r':
      case 's':
        return v50;
      case 'f':
        if (!a5) {
          return v50;
        }
        *(_WORD *)&v95[v23] = 115;
        size_t v69 = *(char **)v54;
        goto LABEL_69;
      case 'i':
        int v78 = *a2 | 1;
LABEL_60:
        *a2 = v78;
        return v50;
      case 'l':
        if (a5)
        {
          switch(v34)
          {
            case 0:
              strcpy(&v95[v23], "ld");
              goto LABEL_89;
            case 1:
              *(_DWORD *)&v95[v23] = 6581287;
LABEL_89:
              int v57 = *(FILE **)(*v90 + 456LL);
              unint64_t v71 = *(char **)(v54 + 40);
              goto LABEL_83;
            case 2:
              uint64_t v85 = *(void *)(v91 + 40);
              uint64_t v86 = 3LL;
              goto LABEL_92;
            case 3:
              uint64_t v85 = *(void *)(v91 + 40);
              uint64_t v86 = 11LL;
LABEL_92:
              humanize_number(v93, 5LL, v85, "", 32LL, v86);
              goto LABEL_78;
            default:
              return v50;
          }
        }

        return v50;
      case 'n':
        if (!a5) {
          return v50;
        }
        *(_WORD *)&v95[v23] = 115;
        if ((*(_WORD *)(v54 + 24) & 0xF000) == 0x4000) {
          snprintf(v93, 0x2000uLL, "%s/");
        }
        else {
          snprintf(v93, 0x2000uLL, "%s");
        }
        size_t v69 = v93;
LABEL_69:
        uint64_t v70 = (uint64_t)v90;
        goto LABEL_70;
      case 'p':
        if (a5)
        {
          *(_WORD *)&v95[v23] = 100;
          int v79 = *(FILE **)(*v90 + 456LL);
          uint64_t v88 = getpid();
          fprintf(v79, &v94, v88);
        }

        return v50;
      case 't':
        if (!a5) {
          return v50;
        }
        time(&v92);
        uint64_t v80 = &v92;
        goto LABEL_77;
      default:
        if (v39 == 77)
        {
          if (!a5) {
            return v50;
          }
          uint64_t v80 = (const time_t *)(v91 + 48);
LABEL_77:
          unint64_t v81 = localtime(v80);
          strftime(v93, 0x2000uLL, "%Y/%m/%d-%H:%M:%S", v81);
          goto LABEL_78;
        }

        if (v39 != 85 || !a5) {
          return v50;
        }
        unint64_t v71 = (char *)*(unsigned int *)(v91 + 28);
        size_t v72 = v23 + 1;
        size_t v73 = v23 + 2;
        if ((_DWORD)v71)
        {
          v95[v72 - 1] = 100;
          v95[v73 - 1] = 0;
          uint64_t v74 = *v90;
          goto LABEL_55;
        }

        v95[v72 - 1] = 115;
        v95[v73 - 1] = 0;
        uint64_t v83 = *v90;
        break;
    }

    goto LABEL_82;
  }

  if (v39 == 66)
  {
    if (!a5) {
      return v50;
    }
    sub_10001DCF8(*(unsigned __int16 *)(v91 + 24), (uint64_t)v93);
LABEL_78:
    *(_WORD *)&v95[v23] = 115;
    uint64_t v82 = *v90;
LABEL_79:
    int v57 = *(FILE **)(v82 + 456);
    uint64_t v87 = v93;
LABEL_84:
    fprintf(v57, &v94, v87);
    return v50;
  }

  if (v39 == 71)
  {
    unint64_t v75 = v90;
    if (!a5) {
      return v50;
    }
    unint64_t v71 = (char *)*(unsigned int *)(v91 + 32);
    size_t v76 = v23 + 1;
    size_t v77 = v23 + 2;
    if ((_DWORD)v71)
    {
      v95[v76 - 1] = 100;
      v95[v77 - 1] = 0;
      uint64_t v74 = *v75;
LABEL_55:
      int v57 = *(FILE **)(v74 + 456);
      goto LABEL_83;
    }

    v95[v76 - 1] = 115;
    v95[v77 - 1] = 0;
    uint64_t v83 = *v75;
LABEL_82:
    int v57 = *(FILE **)(v83 + 456);
    unint64_t v71 = "DEFAULT";
LABEL_83:
    uint64_t v87 = v71;
    goto LABEL_84;
  }

  int v67 = v90;
  if (v39 == 76)
  {
    if (a5)
    {
      char v68 = *(const char **)(v91 + 88);
      if (v68)
      {
        snprintf(v93, 0x2000uLL, "-> %s", v68);
        *(_WORD *)&v95[v23] = 115;
        size_t v69 = v93;
        uint64_t v70 = (uint64_t)v67;
LABEL_70:
        sub_100021BF8(v70, &v94, v69);
      }
    }
  }

  return v50;
}

uint64_t sub_100022618(uint64_t a1, char *a2, size_t a3, uint64_t a4)
{
  int v7 = *(_DWORD *)(*(void *)a1 + 176LL);
  if (v7 == 2)
  {
    uint64_t v8 = 10LL;
    uint64_t v9 = a4;
    uint64_t v10 = 32LL;
    uint64_t v11 = 17LL;
  }

  else if (v7 == 1)
  {
    uint64_t v8 = 9LL;
    uint64_t v9 = a4;
    uint64_t v10 = 32LL;
    uint64_t v11 = 9LL;
  }

  else
  {
    if (v7) {
      goto LABEL_8;
    }
    uint64_t v8 = 32LL;
    uint64_t v9 = a4;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
  }

  humanize_number(v13, v8, v9, "B", v10, v11);
  size_t v4 = snprintf(a2, a3, "%s", v13);
LABEL_8:
  if (v4 < a3) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_10002271C(void *a1, unsigned int a2, int a3, int a4, int a5, unsigned int a6, _BYTE *a7, int a8)
{
  if (a7 && a8 == 112 && *a7 == 49 && a1)
  {
    a1[6] = 0LL;
    uint64_t v11 = (void *(*)(uint64_t, int, int))a1[8];
    if (!v11)
    {
      uint64_t v11 = sub_100028474;
      a1[8] = sub_100028474;
      a1[10] = 0LL;
    }

    if (!a1[9]) {
      a1[9] = sub_10002847C;
    }
    if (a2 == -1) {
      unsigned int v12 = 6;
    }
    else {
      unsigned int v12 = a2;
    }
    unsigned int v13 = a4 - 16;
    if (a4 > 0xF)
    {
      int v14 = 2;
    }

    else
    {
      unsigned int v13 = a4;
      int v14 = 1;
    }

    if (a4 < 0) {
      unsigned int v15 = -a4;
    }
    else {
      unsigned int v15 = v13;
    }
    if (a4 < 0) {
      int v16 = 0;
    }
    else {
      int v16 = v14;
    }
    if (a6 <= 4 && v12 <= 9 && a3 == 8 && (a5 - 10) >= 0xFFFFFFF7 && v15 >= 8 && v15 <= 0xF)
    {
      uint64_t v17 = (uint64_t)v11(a1[10], 1, 5928);
      if (v17)
      {
        uint64_t v18 = v17;
        if (v15 == 8) {
          int v19 = 9;
        }
        else {
          int v19 = v15;
        }
        a1[7] = v17;
        *(void *)uint64_t v17 = a1;
        *(_DWORD *)(v17 + 44) = v16;
        *(void *)(v17 + 48) = 0LL;
        *(_DWORD *)(v17 + 68) = 1 << v19;
        *(_DWORD *)(v17 + 72) = v19;
        *(_DWORD *)(v17 + 76) = (1 << v19) - 1;
        *(_DWORD *)(v17 + 116) = 128 << a5;
        *(_DWORD *)(v17 + 120) = a5 + 7;
        *(_DWORD *)(v17 + 124) = (128 << a5) - 1;
        *(_DWORD *)(v17 + 128) = (a5 + 9) / 3u;
        *(void *)(v17 + 80) = ((uint64_t (*)(void))a1[8])(a1[10]);
        *(void *)(v18 + 96) = ((uint64_t (*)(void, void, uint64_t))a1[8])( a1[10],  *(unsigned int *)(v18 + 68),  2LL);
        *(void *)(v18 + 104) = ((uint64_t (*)(void, void, uint64_t))a1[8])( a1[10],  *(unsigned int *)(v18 + 116),  2LL);
        *(_DWORD *)(v18 + 5880) = 64 << a5;
        uint64_t v20 = ((uint64_t (*)(void))a1[8])(a1[10]);
        uint64_t v21 = *(unsigned int *)(v18 + 5880);
        *(void *)(v18 + 16) = v20;
        *(void *)(v18 + 24) = 4 * v21;
        if (*(void *)(v18 + 80) && *(void *)(v18 + 96) && *(void *)(v18 + 104) && v20)
        {
          *(void *)(v18 + 5888) = v20 + (v21 & 0xFFFFFFFE);
          *(void *)(v18 + 5872) = v20 + 3 * v21;
          *(_DWORD *)(v18 + 180) = v12;
          *(_DWORD *)(v18 + 184) = a6;
          *(_BYTE *)(v18 + 60) = 8;
          sub_100022A68((uint64_t)a1);
        }

        else
        {
          *(_DWORD *)(v18 + 8) = 666;
          a1[6] = "insufficient memory";
          sub_10002297C((uint64_t)a1);
        }
      }
    }
  }

uint64_t sub_10002297C(uint64_t a1)
{
  if (!a1) {
    return 4294967294LL;
  }
  uint64_t v2 = *(void *)(a1 + 56);
  if (!v2) {
    return 4294967294LL;
  }
  int v3 = *(_DWORD *)(v2 + 8);
  BOOL v4 = (v3 - 69) > 0x2C || ((1LL << (v3 - 69)) & 0x100400400011LL) == 0;
  if (v4 && v3 != 666 && v3 != 42) {
    return 4294967294LL;
  }
  if (*(void *)(v2 + 16))
  {
    (*(void (**)(void, void))(a1 + 72))(*(void *)(a1 + 80), *(void *)(v2 + 16));
    uint64_t v2 = *(void *)(a1 + 56);
  }

  if (*(void *)(v2 + 104))
  {
    (*(void (**)(void, void))(a1 + 72))(*(void *)(a1 + 80), *(void *)(v2 + 104));
    uint64_t v2 = *(void *)(a1 + 56);
  }

  if (*(void *)(v2 + 96))
  {
    (*(void (**)(void, void))(a1 + 72))(*(void *)(a1 + 80), *(void *)(v2 + 96));
    uint64_t v2 = *(void *)(a1 + 56);
  }

  if (*(void *)(v2 + 80))
  {
    (*(void (**)(void, void))(a1 + 72))(*(void *)(a1 + 80), *(void *)(v2 + 80));
    uint64_t v2 = *(void *)(a1 + 56);
  }

  (*(void (**)(void, uint64_t))(a1 + 72))(*(void *)(a1 + 80), v2);
  *(void *)(a1 + 56) = 0LL;
  if (v3 == 113) {
    return 4294967293LL;
  }
  else {
    return 0LL;
  }
}

double sub_100022A68(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 56);
    if (v2)
    {
      if (*(void *)(a1 + 64) && *(void *)(a1 + 72))
      {
        *(void *)(a1 + 16) = 0LL;
        *(void *)(a1 + 40) = 0LL;
        *(void *)(a1 + 48) = 0LL;
        *(_DWORD *)(a1 + 88) = 2;
        *(_DWORD *)(v2 + 40) = 0;
        *(void *)(v2 + 32) = *(void *)(v2 + 16);
        int v3 = *(_DWORD *)(v2 + 44);
        if (v3 < 0)
        {
          int v3 = -v3;
          *(_DWORD *)(v2 + 44) = v3;
        }

        if (v3) {
          int v4 = 42;
        }
        else {
          int v4 = 113;
        }
        *(_DWORD *)(v2 + 8) = v4;
        if (v3 == 2) {
          uint64_t v5 = sub_10001DA6C(0, 0LL, 0);
        }
        else {
          uint64_t v5 = sub_100013130(0, 0LL, 0);
        }
        *(void *)(a1 + 96) = v5;
        *(_DWORD *)(v2 + 64) = 0;
        sub_10003A7DC(v2);
        *(void *)(v2 + 88) = 2LL * *(unsigned int *)(v2 + 68);
        uint64_t v6 = *(char **)(v2 + 104);
        size_t v7 = 2LL * (*(_DWORD *)(v2 + 116) - 1);
        *(_WORD *)&v6[v7] = 0;
        bzero(v6, v7);
        uint64_t v8 = (unsigned __int16 *)((char *)&unk_100054A40 + 16 * *(int *)(v2 + 180));
        int v9 = v8[2];
        *(_DWORD *)(v2 + 188) = *v8;
        *(_DWORD *)(v2 + 192) = v9;
        int v10 = v8[1];
        *(_DWORD *)(v2 + 172) = v8[3];
        *(_DWORD *)(v2 + 176) = v10;
        *(void *)(v2 + 136) = 0LL;
        *(void *)&double result = 0x200000000LL;
        *(void *)(v2 + 164) = 0x200000000LL;
        *(_DWORD *)(v2 + 144) = 2;
        *(void *)(v2 + 152) = 0LL;
        *(_DWORD *)(v2 + memset(&v55[1], 0, 112) = 0;
      }
    }
  }

  return result;
}

uint64_t sub_100022B9C(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 4294967294LL;
  }
  uint64_t result = 4294967294LL;
  if (a2 <= 6)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      if (!*(void *)(a1 + 24)
        || !*(void *)a1 && *(_DWORD *)(a1 + 8)
        || (int v6 = *(_DWORD *)(v5 + 8), (_DWORD)a2 != 4) && v6 == 666)
      {
        *(void *)(a1 + 48) = "stream error";
        return result;
      }

      if (!*(_DWORD *)(a1 + 32)) {
        goto LABEL_136;
      }
      *(void *)uint64_t v5 = a1;
      int v7 = *(_DWORD *)(v5 + 64);
      *(_DWORD *)(v5 + 64) = a2;
      if (v6 == 42)
      {
        if (*(_DWORD *)(v5 + 44) == 2)
        {
          *(void *)(a1 + 96) = sub_10001DA6C(0, 0LL, 0);
          uint64_t v8 = *(void *)(v5 + 16);
          uint64_t v9 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v9 + 1;
          *(_BYTE *)(v8 + v9) = 31;
          uint64_t v10 = *(void *)(v5 + 16);
          uint64_t v11 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v11 + 1;
          *(_BYTE *)(v10 + v11) = -117;
          uint64_t v12 = *(void *)(v5 + 16);
          uint64_t v13 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v13 + 1;
          *(_BYTE *)(v12 + v13) = 8;
          uint64_t v14 = *(void *)(v5 + 48);
          if (!v14)
          {
            uint64_t v52 = *(void *)(v5 + 16);
            uint64_t v53 = *(unsigned int *)(v5 + 40);
            *(_DWORD *)(v5 + 40) = v53 + 1;
            *(_BYTE *)(v52 + v53) = 0;
            uint64_t v54 = *(void *)(v5 + 16);
            uint64_t v55 = *(unsigned int *)(v5 + 40);
            *(_DWORD *)(v5 + 40) = v55 + 1;
            *(_BYTE *)(v54 + v55) = 0;
            uint64_t v56 = *(void *)(v5 + 16);
            uint64_t v57 = *(unsigned int *)(v5 + 40);
            *(_DWORD *)(v5 + 40) = v57 + 1;
            *(_BYTE *)(v56 + v57) = 0;
            uint64_t v58 = *(void *)(v5 + 16);
            uint64_t v59 = *(unsigned int *)(v5 + 40);
            *(_DWORD *)(v5 + 40) = v59 + 1;
            *(_BYTE *)(v58 + v59) = 0;
            uint64_t v60 = *(void *)(v5 + 16);
            uint64_t v61 = *(unsigned int *)(v5 + 40);
            *(_DWORD *)(v5 + 40) = v61 + 1;
            *(_BYTE *)(v60 + v61) = 0;
            int v62 = *(_DWORD *)(v5 + 180);
            if (v62 == 9)
            {
              char v63 = 2;
            }

            else if (*(int *)(v5 + 184) > 1 || v62 < 2)
            {
              char v63 = 4;
            }

            else
            {
              char v63 = 0;
            }

            uint64_t v112 = *(void *)(v5 + 16);
            uint64_t v113 = *(unsigned int *)(v5 + 40);
            *(_DWORD *)(v5 + 40) = v113 + 1;
            *(_BYTE *)(v112 + v113) = v63;
            uint64_t v114 = *(void *)(v5 + 16);
            uint64_t v115 = *(unsigned int *)(v5 + 40);
            *(_DWORD *)(v5 + 40) = v115 + 1;
            *(_BYTE *)(v114 + v115) = 7;
LABEL_127:
            *(_DWORD *)(v5 + 8) = 113;
            goto LABEL_128;
          }

          char v15 = (*(_DWORD *)v14 != 0) | (2 * (*(_DWORD *)(v14 + 68) != 0)) | (4 * (*(void *)(v14 + 24) != 0LL)) | (8 * (*(void *)(v14 + 40) != 0LL)) | (16 * (*(void *)(v14 + 56) != 0LL));
          uint64_t v16 = *(void *)(v5 + 16);
          uint64_t v17 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v17 + 1;
          *(_BYTE *)(v16 + v17) = v15;
          uint64_t v18 = *(void *)(*(void *)(v5 + 48) + 8LL);
          uint64_t v19 = *(void *)(v5 + 16);
          uint64_t v20 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v20 + 1;
          *(_BYTE *)(v19 + v20) = v18;
          uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8LL) >> 8;
          uint64_t v22 = *(void *)(v5 + 16);
          uint64_t v23 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v23 + 1;
          *(_BYTE *)(v22 + v23) = v21;
          uint64_t v24 = *(void *)(*(void *)(v5 + 48) + 8LL) >> 16;
          uint64_t v25 = *(void *)(v5 + 16);
          uint64_t v26 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v26 + 1;
          *(_BYTE *)(v25 + v26) = v24;
          uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8LL) >> 24;
          uint64_t v28 = *(void *)(v5 + 16);
          uint64_t v29 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v29 + 1;
          *(_BYTE *)(v28 + v29) = v27;
          int v30 = *(_DWORD *)(v5 + 180);
          if (v30 == 9)
          {
            char v31 = 2;
          }

          else if (*(int *)(v5 + 184) > 1 || v30 < 2)
          {
            char v31 = 4;
          }

          else
          {
            char v31 = 0;
          }

          uint64_t v65 = *(void *)(v5 + 16);
          uint64_t v66 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v66 + 1;
          *(_BYTE *)(v65 + v66) = v31;
          char v67 = *(_DWORD *)(*(void *)(v5 + 48) + 20LL);
          uint64_t v68 = *(void *)(v5 + 16);
          uint64_t v69 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v69 + 1;
          *(_BYTE *)(v68 + v69) = v67;
          uint64_t v70 = *(void *)(v5 + 48);
          if (*(void *)(v70 + 24))
          {
            char v71 = *(_DWORD *)(v70 + 32);
            uint64_t v72 = *(void *)(v5 + 16);
            uint64_t v73 = *(unsigned int *)(v5 + 40);
            *(_DWORD *)(v5 + 40) = v73 + 1;
            *(_BYTE *)(v72 + v73) = v71;
            int v74 = *(_DWORD *)(*(void *)(v5 + 48) + 32LL) >> 8;
            uint64_t v75 = *(void *)(v5 + 16);
            uint64_t v76 = *(unsigned int *)(v5 + 40);
            *(_DWORD *)(v5 + 40) = v76 + 1;
            *(_BYTE *)(v75 + v76) = v74;
            uint64_t v70 = *(void *)(v5 + 48);
          }

          if (*(_DWORD *)(v70 + 68)) {
            *(void *)(a1 + 96) = sub_10001DA6C(*(void *)(a1 + 96), *(int **)(v5 + 16), *(_DWORD *)(v5 + 40));
          }
          *(_DWORD *)(v5 + 56) = 0;
          *(_DWORD *)(v5 + 8) = 69;
LABEL_49:
          uint64_t v77 = *(void *)(v5 + 48);
          if (!*(void *)(v77 + 24)) {
            goto LABEL_68;
          }
          unsigned int v78 = *(_DWORD *)(v5 + 40);
          unsigned int v79 = *(_DWORD *)(v5 + 56);
          while (1)
          {
            uint64_t v80 = *(unsigned int *)(v5 + 40);
            if (*(void *)(v5 + 24) == v80)
            {
              if (*(_DWORD *)(v77 + 68)) {
                BOOL v81 = v80 > v78;
              }
              else {
                BOOL v81 = 0;
              }
              if (v81) {
                *(void *)(a1 + 96) = sub_10001DA6C( *(void *)(a1 + 96),  (int *)(*(void *)(v5 + 16) + v78),  v80 - v78);
              }
              sub_100023674((void *)a1);
              uint64_t v80 = *(unsigned int *)(v5 + 40);
              uint64_t v77 = *(void *)(v5 + 48);
              if (*(void *)(v5 + 24) == v80)
              {
                unsigned int v78 = *(_DWORD *)(v5 + 40);
LABEL_63:
                if (*(_DWORD *)(v77 + 68))
                {
                  unsigned int v84 = *(_DWORD *)(v5 + 40);
                  if (v84 > v78)
                  {
                    *(void *)(a1 + 96) = sub_10001DA6C( *(void *)(a1 + 96),  (int *)(*(void *)(v5 + 16) + v78),  v84 - v78);
                    uint64_t v77 = *(void *)(v5 + 48);
                  }
                }

                if (*(_DWORD *)(v5 + 56) == *(_DWORD *)(v77 + 32))
                {
                  *(_DWORD *)(v5 + 56) = 0;
LABEL_68:
                  *(_DWORD *)(v5 + 8) = 73;
LABEL_72:
                  if (*(void *)(v77 + 40))
                  {
                    unsigned int v85 = *(_DWORD *)(v5 + 40);
                    do
                    {
                      uint64_t v86 = *(unsigned int *)(v5 + 40);
                      uint64_t v87 = *(void *)(v5 + 48);
                      if (*(void *)(v5 + 24) == v86)
                      {
                        if (*(_DWORD *)(v87 + 68)) {
                          BOOL v88 = v86 > v85;
                        }
                        else {
                          BOOL v88 = 0;
                        }
                        if (v88) {
                          *(void *)(a1 + 96) = sub_10001DA6C( *(void *)(a1 + 96),  (int *)(*(void *)(v5 + 16) + v85),  v86 - v85);
                        }
                        sub_100023674((void *)a1);
                        uint64_t v86 = *(unsigned int *)(v5 + 40);
                        if (*(void *)(v5 + 24) == v86)
                        {
                          char v92 = 0;
                          goto LABEL_86;
                        }

                        uint64_t v87 = *(void *)(v5 + 48);
                        unsigned int v85 = *(_DWORD *)(v5 + 40);
                      }

                      uint64_t v89 = *(void *)(v87 + 40);
                      uint64_t v90 = *(unsigned int *)(v5 + 56);
                      *(_DWORD *)(v5 + 56) = v90 + 1;
                      LODWORD(v89) = *(unsigned __int8 *)(v89 + v90);
                      uint64_t v91 = *(void *)(v5 + 16);
                      *(_DWORD *)(v5 + 40) = v86 + 1;
                      *(_BYTE *)(v91 + v86) = v89;
                    }

                    while ((_DWORD)v89);
                    char v92 = 1;
                    LODWORD(v86) = v85;
LABEL_86:
                    if (*(_DWORD *)(*(void *)(v5 + 48) + 68LL))
                    {
                      unsigned int v93 = *(_DWORD *)(v5 + 40);
                      if (v93 > v86) {
                        *(void *)(a1 + 96) = sub_10001DA6C( *(void *)(a1 + 96),  (int *)(*(void *)(v5 + 16) + v86),  v93 - v86);
                      }
                    }

                    if ((v92 & 1) != 0)
                    {
                      *(_DWORD *)(v5 + 56) = 0;
                      goto LABEL_91;
                    }

                    int v6 = *(_DWORD *)(v5 + 8);
LABEL_93:
                    if (v6 != 91) {
                      goto LABEL_114;
                    }
                  }

                  else
                  {
LABEL_91:
                    *(_DWORD *)(v5 + 8) = 91;
                  }

                  if (!*(void *)(*(void *)(v5 + 48) + 56LL)) {
                    goto LABEL_112;
                  }
                  unsigned int v94 = *(_DWORD *)(v5 + 40);
                  while (1)
                  {
                    uint64_t v95 = *(unsigned int *)(v5 + 40);
                    uint64_t v96 = *(void *)(v5 + 48);
                    if (*(void *)(v5 + 24) == v95)
                    {
                      if (*(_DWORD *)(v96 + 68)) {
                        BOOL v97 = v95 > v94;
                      }
                      else {
                        BOOL v97 = 0;
                      }
                      if (v97) {
                        *(void *)(a1 + 96) = sub_10001DA6C( *(void *)(a1 + 96),  (int *)(*(void *)(v5 + 16) + v94),  v95 - v94);
                      }
                      sub_100023674((void *)a1);
                      uint64_t v95 = *(unsigned int *)(v5 + 40);
                      if (*(void *)(v5 + 24) == v95)
                      {
                        char v101 = 0;
LABEL_108:
                        if (*(_DWORD *)(*(void *)(v5 + 48) + 68LL))
                        {
                          unsigned int v102 = *(_DWORD *)(v5 + 40);
                          if (v102 > v95) {
                            *(void *)(a1 + 96) = sub_10001DA6C( *(void *)(a1 + 96),  (int *)(*(void *)(v5 + 16) + v95),  v102 - v95);
                          }
                        }

                        if ((v101 & 1) != 0)
                        {
LABEL_112:
                          *(_DWORD *)(v5 + 8) = 103;
                          goto LABEL_115;
                        }

                        int v6 = *(_DWORD *)(v5 + 8);
LABEL_114:
                        if (v6 == 103)
                        {
LABEL_115:
                          if (!*(_DWORD *)(*(void *)(v5 + 48) + 68LL)) {
                            goto LABEL_127;
                          }
                          unsigned int v103 = *(_DWORD *)(v5 + 40);
                          unint64_t v104 = v103 + 2;
                          unint64_t v105 = *(void *)(v5 + 24);
                          if (v105 < v104)
                          {
                            sub_100023674((void *)a1);
                            unsigned int v103 = *(_DWORD *)(v5 + 40);
                            unint64_t v105 = *(void *)(v5 + 24);
                            unint64_t v104 = v103 + 2;
                          }

                          if (v105 >= v104)
                          {
                            uint64_t v106 = *(void *)(a1 + 96);
                            uint64_t v107 = *(void *)(v5 + 16);
                            *(_DWORD *)(v5 + 40) = v103 + 1;
                            *(_BYTE *)(v107 + v103) = v106;
                            uint64_t v108 = *(void *)(a1 + 96) >> 8;
                            uint64_t v109 = *(void *)(v5 + 16);
                            uint64_t v110 = *(unsigned int *)(v5 + 40);
                            *(_DWORD *)(v5 + 40) = v110 + 1;
                            *(_BYTE *)(v109 + v110) = v108;
                            *(void *)(a1 + 96) = sub_10001DA6C(0, 0LL, 0);
                            goto LABEL_127;
                          }
                        }

LABEL_128:
                        if (*(_DWORD *)(v5 + 40))
                        {
                          sub_100023674((void *)a1);
                          if (*(_DWORD *)(a1 + 32)) {
                            goto LABEL_130;
                          }
LABEL_155:
                          uint64_t result = 0LL;
                          *(_DWORD *)(v5 + 64) = -1;
                          return result;
                        }

                        if (!*(_DWORD *)(a1 + 8) && (_DWORD)a2 != 4 && v7 >= (int)a2)
                        {
LABEL_136:
                          *(void *)(a1 + 48) = "buffer error";
                          return 4294967291LL;
                        }

LABEL_130:
                        int v116 = *(_DWORD *)(v5 + 8);
                        int v117 = *(_DWORD *)(a1 + 8);
                        if (v116 != 666)
                        {
                          if (!v117) {
                            goto LABEL_138;
                          }
                          goto LABEL_139;
                        }

                        if (v117) {
                          goto LABEL_136;
                        }
LABEL_138:
                        if (*(_DWORD *)(v5 + 164))
                        {
LABEL_139:
                          int v118 = (*((uint64_t (**)(uint64_t, uint64_t))&unk_100054A40
                                  + 2 * *(int *)(v5 + 180)
                                  + 1))( v5,  a2);
                          if ((v118 & 0xFFFFFFFE) == 2) {
                            *(_DWORD *)(v5 + 8) = 666;
                          }
                          if ((v118 & 0xFFFFFFFD) != 0)
                          {
                            if (v118 == 1)
                            {
                              if ((_DWORD)a2 == 1)
                              {
                                sub_10003A9C4(v5);
                              }

                              else
                              {
                                sub_10003A890(v5, 0LL, 0, 0);
                                if ((_DWORD)a2 == 3)
                                {
                                  uint64_t v119 = *(char **)(v5 + 104);
                                  size_t v120 = 2LL * (*(_DWORD *)(v5 + 116) - 1);
                                  *(_WORD *)&v119[v120] = 0;
                                  bzero(v119, v120);
                                }
                              }

                              sub_100023674((void *)a1);
                              if (!*(_DWORD *)(a1 + 32)) {
                                goto LABEL_155;
                              }
                            }

                            goto LABEL_153;
                          }

                          if (!*(_DWORD *)(a1 + 32)) {
                            goto LABEL_155;
                          }
                        }

                        else if ((_DWORD)a2)
                        {
                          if (v116 != 666) {
                            goto LABEL_139;
                          }
LABEL_153:
                          if ((_DWORD)a2 == 4)
                          {
                            int v121 = *(_DWORD *)(v5 + 44);
                            if (v121 < 1) {
                              return 1LL;
                            }
                            unint64_t v122 = *(void *)(a1 + 96);
                            if (v121 == 2)
                            {
                              uint64_t v123 = *(void *)(v5 + 16);
                              uint64_t v124 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v124 + 1;
                              *(_BYTE *)(v123 + v124) = v122;
                              uint64_t v125 = *(void *)(a1 + 96) >> 8;
                              uint64_t v126 = *(void *)(v5 + 16);
                              uint64_t v127 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v127 + 1;
                              *(_BYTE *)(v126 + v127) = v125;
                              uint64_t v128 = *(void *)(a1 + 96) >> 16;
                              uint64_t v129 = *(void *)(v5 + 16);
                              uint64_t v130 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v130 + 1;
                              *(_BYTE *)(v129 + v130) = v128;
                              uint64_t v131 = *(void *)(a1 + 96) >> 24;
                              uint64_t v132 = *(void *)(v5 + 16);
                              uint64_t v133 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v133 + 1;
                              *(_BYTE *)(v132 + v133) = v131;
                              uint64_t v134 = *(void *)(a1 + 16);
                              uint64_t v135 = *(void *)(v5 + 16);
                              uint64_t v136 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v136 + 1;
                              *(_BYTE *)(v135 + v136) = v134;
                              uint64_t v137 = *(void *)(a1 + 16) >> 8;
                              uint64_t v138 = *(void *)(v5 + 16);
                              uint64_t v139 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v139 + 1;
                              *(_BYTE *)(v138 + v139) = v137;
                              uint64_t v140 = *(void *)(a1 + 16) >> 16;
                              uint64_t v141 = *(void *)(v5 + 16);
                              uint64_t v142 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v142 + 1;
                              *(_BYTE *)(v141 + v142) = v140;
                              uint64_t v143 = *(void *)(a1 + 16) >> 24;
                            }

                            else
                            {
                              unint64_t v144 = v122 >> 16;
                              uint64_t v145 = *(void *)(v5 + 16);
                              uint64_t v146 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v146 + 1;
                              *(_BYTE *)(v145 + v146) = BYTE3(v122);
                              uint64_t v147 = *(void *)(v5 + 16);
                              uint64_t v148 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v148 + 1;
                              *(_BYTE *)(v147 + v148) = v144;
                              uint64_t v143 = *(void *)(a1 + 96);
                              uint64_t v149 = *(void *)(v5 + 16);
                              uint64_t v150 = *(unsigned int *)(v5 + 40);
                              *(_DWORD *)(v5 + 40) = v150 + 1;
                              *(_BYTE *)(v149 + v150) = BYTE1(v143);
                            }

                            uint64_t v151 = *(void *)(v5 + 16);
                            uint64_t v152 = *(unsigned int *)(v5 + 40);
                            *(_DWORD *)(v5 + 40) = v152 + 1;
                            *(_BYTE *)(v151 + v152) = v143;
                            sub_100023674((void *)a1);
                            int v153 = *(_DWORD *)(v5 + 44);
                            if (v153 >= 1) {
                              *(_DWORD *)(v5 + 44) = -v153;
                            }
                            return *(_DWORD *)(v5 + 40) == 0;
                          }
                        }

                        return 0LL;
                      }

                      uint64_t v96 = *(void *)(v5 + 48);
                      unsigned int v94 = *(_DWORD *)(v5 + 40);
                    }

                    uint64_t v98 = *(void *)(v96 + 56);
                    uint64_t v99 = *(unsigned int *)(v5 + 56);
                    *(_DWORD *)(v5 + 56) = v99 + 1;
                    LODWORD(v98) = *(unsigned __int8 *)(v98 + v99);
                    uint64_t v100 = *(void *)(v5 + 16);
                    *(_DWORD *)(v5 + 40) = v95 + 1;
                    *(_BYTE *)(v100 + v95) = v98;
                    if (!(_DWORD)v98)
                    {
                      char v101 = 1;
                      LODWORD(v95) = v94;
                      goto LABEL_108;
                    }
                  }
                }

                int v6 = *(_DWORD *)(v5 + 8);
LABEL_70:
                if (v6 == 73)
                {
                  uint64_t v77 = *(void *)(v5 + 48);
                  goto LABEL_72;
                }

                goto LABEL_93;
              }

              unsigned int v79 = *(_DWORD *)(v5 + 56);
              unsigned int v78 = *(_DWORD *)(v5 + 40);
            }

            char v82 = *(_BYTE *)(*(void *)(v77 + 24) + v79);
            uint64_t v83 = *(void *)(v5 + 16);
            *(_DWORD *)(v5 + 40) = v80 + 1;
            *(_BYTE *)(v83 + v80) = v82;
            unsigned int v79 = *(_DWORD *)(v5 + 56) + 1;
            *(_DWORD *)(v5 + 56) = v79;
            uint64_t v77 = *(void *)(v5 + 48);
          }
        }

        if (*(int *)(v5 + 184) <= 1)
        {
          int v33 = *(_DWORD *)(v5 + 180);
          if (v33 == 6) {
            int v34 = 128;
          }
          else {
            int v34 = 192;
          }
          else {
            int v35 = 64;
          }
          if (v33 >= 2) {
            int v32 = v35;
          }
          else {
            int v32 = 0;
          }
        }

        else
        {
          int v32 = 0;
        }

        unsigned int v36 = v32 | ((*(_DWORD *)(v5 + 72) << 12) - 30720);
        if (*(_DWORD *)(v5 + 156)) {
          v36 |= 0x20u;
        }
        *(_DWORD *)(v5 + 8) = 113;
        uint64_t v37 = *(void *)(v5 + 16);
        uint64_t v38 = *(unsigned int *)(v5 + 40);
        *(_DWORD *)(v5 + 40) = v38 + 1;
        *(_BYTE *)(v37 + v38) = BYTE1(v36);
        uint64_t v39 = *(void *)(v5 + 16);
        uint64_t v40 = *(unsigned int *)(v5 + 40);
        *(_DWORD *)(v5 + 40) = v40 + 1;
        *(_BYTE *)(v39 + v40) = ((v36 % 0x1F) | v36) ^ 0x1F;
        if (*(_DWORD *)(v5 + 156))
        {
          unint64_t v41 = *(void *)(a1 + 96);
          unint64_t v42 = v41 >> 16;
          uint64_t v43 = *(void *)(v5 + 16);
          uint64_t v44 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v44 + 1;
          *(_BYTE *)(v43 + v44) = BYTE3(v41);
          uint64_t v45 = *(void *)(v5 + 16);
          uint64_t v46 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v46 + 1;
          *(_BYTE *)(v45 + v46) = v42;
          uint64_t v47 = *(void *)(a1 + 96);
          uint64_t v48 = *(void *)(v5 + 16);
          uint64_t v49 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v49 + 1;
          *(_BYTE *)(v48 + v49) = BYTE1(v47);
          uint64_t v50 = *(void *)(v5 + 16);
          uint64_t v51 = *(unsigned int *)(v5 + 40);
          *(_DWORD *)(v5 + 40) = v51 + 1;
          *(_BYTE *)(v50 + v51) = v47;
        }

        *(void *)(a1 + 96) = sub_100013130(0, 0LL, 0);
        int v6 = *(_DWORD *)(v5 + 8);
      }

      if (v6 != 69) {
        goto LABEL_70;
      }
      goto LABEL_49;
    }
  }

  return result;
}

void *sub_100023674(void *result)
{
  uint64_t v1 = *((void *)result + 7);
  unsigned int v2 = *(_DWORD *)(v1 + 40);
  unsigned int v3 = *((_DWORD *)result + 8);
  if (v2 >= v3) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = v2;
  }
  if ((_DWORD)v4)
  {
    uint64_t v5 = result;
    uint64_t result = memcpy(*((void **)result + 3), *(const void **)(v1 + 32), v4);
    v5[3] += v4;
    uint64_t v6 = v5[7];
    *(void *)(v6 + 32) += v4;
    v5[5] += v4;
    *((_DWORD *)v5 + 8) -= v4;
    int v7 = *(_DWORD *)(v6 + 40) - v4;
    *(_DWORD *)(v6 + 40) = v7;
    if (!v7) {
      *(void *)(v6 + 32) = *(void *)(v6 + 16);
    }
  }

  return result;
}

uint64_t sub_100023704(uint64_t a1, int a2)
{
  else {
    uint64_t v4 = *(void *)(a1 + 24) - 5LL;
  }
  while (1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 164);
    if (v5 <= 1)
    {
      sub_100024124((unsigned int *)a1);
      unsigned int v5 = *(_DWORD *)(a1 + 164);
      if (!(v5 | a2)) {
        return 0LL;
      }
      if (!v5) {
        break;
      }
    }

    unint64_t v6 = *(_DWORD *)(a1 + 156) + v5;
    *(_DWORD *)(a1 + 156) = v6;
    *(_DWORD *)(a1 + 164) = 0;
    if (a2 == 6)
    {
      *(void *)(a1 + 136) = v6;
    }

    else
    {
      uint64_t v7 = *(void *)(a1 + 136);
      unint64_t v8 = v7 + v4;
      if ((_DWORD)v6) {
        BOOL v9 = v8 > v6;
      }
      else {
        BOOL v9 = 0;
      }
      if (!v9)
      {
        *(_DWORD *)(a1 + 164) = v6 - v8;
        *(_DWORD *)(a1 + 156) = v8;
        if (v7 < 0) {
          uint64_t v10 = 0LL;
        }
        else {
          uint64_t v10 = (char *)(*(void *)(a1 + 80) + v7);
        }
        sub_10003AC34(a1, v10, (v7 + v4) - v7, 0);
        *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
        sub_100023674(*(void **)a1);
        if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
          return 0LL;
        }
        LODWORD(v6) = *(_DWORD *)(a1 + 156);
        uint64_t v7 = *(void *)(a1 + 136);
      }

      if ((int)v6 - (int)v7 >= (*(_DWORD *)(a1 + 68) - 262))
      {
        uint64_t v11 = v7 < 0 ? 0LL : (char *)(*(void *)(a1 + 80) + v7);
        sub_10003AC34(a1, v11, v6 - v7, 0);
        *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
        sub_100023674(*(void **)a1);
        if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
          return 0LL;
        }
      }
    }
  }

  if (a2 == 6)
  {
    uint64_t result = 0LL;
    *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  }

  else
  {
    uint64_t v13 = *(void *)(a1 + 136);
    if (v13 < 0) {
      uint64_t v14 = 0LL;
    }
    else {
      uint64_t v14 = (char *)(*(void *)(a1 + 80) + v13);
    }
    sub_10003AC34(a1, v14, *(unsigned int *)(a1 + 156) - v13, a2 == 4);
    *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
    sub_100023674(*(void **)a1);
    if (*(_DWORD *)(*(void *)a1 + 32LL))
    {
      if (a2 == 4) {
        return 3LL;
      }
      else {
        return 1LL;
      }
    }

    else
    {
      return 2 * (a2 == 4);
    }
  }

  return result;
}

uint64_t sub_1000238D0(uint64_t a1, int a2)
{
  unsigned int v4 = 0;
  while (1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 164);
    if (v5 > 0x105)
    {
LABEL_7:
      unsigned int v6 = *(_DWORD *)(a1 + 156);
      unsigned int v7 = ((*(_DWORD *)(a1 + 112) << *(_DWORD *)(a1 + 128)) ^ *(unsigned __int8 *)(*(void *)(a1 + 80) + v6 + 2)) & *(_DWORD *)(a1 + 124);
      *(_DWORD *)(a1 + memset(&v55[1], 0, 112) = v7;
      uint64_t v8 = *(void *)(a1 + 104);
      unsigned int v4 = *(unsigned __int16 *)(v8 + 2LL * v7);
      *(_WORD *)(*(void *)(a1 + 96) + 2LL * (*(_DWORD *)(a1 + 76) & v6)) = v4;
      *(_WORD *)(v8 + 2LL * v7) = v6;
      goto LABEL_8;
    }

    sub_100024124((unsigned int *)a1);
    unsigned int v5 = *(_DWORD *)(a1 + 164);
    if (!a2 && v5 < 0x106) {
      return 0LL;
    }
    if (!v5) {
      break;
    }
    if (v5 >= 3) {
      goto LABEL_7;
    }
LABEL_8:
    if (a2 == 6)
    {
      ++*(_DWORD *)(a1 + 156);
      *(_DWORD *)(a1 + 164) = v5 - 1;
    }

    else
    {
      if (!v4) {
        goto LABEL_12;
      }
      unsigned int v9 = *(_DWORD *)(a1 + 156) - v4;
      if (v9 > *(_DWORD *)(a1 + 68) - 262) {
        goto LABEL_12;
      }
      int v11 = *(_DWORD *)(a1 + 184);
      if ((v11 & 0xFFFFFFFE) == 2)
      {
        if (v9 != 1 || v11 != 3)
        {
LABEL_12:
          unsigned int v10 = *(_DWORD *)(a1 + 144);
          goto LABEL_22;
        }

        unsigned int v10 = sub_100024518(a1, v4);
      }

      else
      {
        unsigned int v10 = sub_100024304(a1, v4);
      }

      *(_DWORD *)(a1 + 144) = v10;
LABEL_22:
      if (v10 < 3)
      {
        uint64_t v33 = *(unsigned __int8 *)(*(void *)(a1 + 80) + *(unsigned int *)(a1 + 156));
        uint64_t v34 = *(unsigned int *)(a1 + 5884);
        *(_WORD *)(*(void *)(a1 + 5888) + 2 * v34) = 0;
        uint64_t v35 = *(void *)(a1 + 5872);
        *(_DWORD *)(a1 + 5884) = v34 + 1;
        *(_BYTE *)(v35 + v34) = v33;
        ++*(_WORD *)(a1 + 4 * v33 + 196);
        int v20 = *(_DWORD *)(a1 + 5884);
        int v21 = *(_DWORD *)(a1 + 5880) - 1;
        --*(_DWORD *)(a1 + 164);
        unsigned int v32 = *(_DWORD *)(a1 + 156) + 1;
LABEL_31:
        *(_DWORD *)(a1 + 156) = v32;
        goto LABEL_33;
      }

      int v13 = *(_DWORD *)(a1 + 156) - *(_DWORD *)(a1 + 160);
      uint64_t v14 = *(unsigned int *)(a1 + 5884);
      *(_WORD *)(*(void *)(a1 + 5888) + 2 * v14) = v13;
      uint64_t v15 = *(void *)(a1 + 5872);
      *(_DWORD *)(a1 + 5884) = v14 + 1;
      *(_BYTE *)(v15 + v14) = v10 - 3;
      unsigned __int16 v16 = v13 - 1;
      uint64_t v17 = a1 + 4LL * byte_10004A040[(v10 - 3)];
      ++*(_WORD *)(v17 + 1224);
      unsigned __int16 v18 = (v16 >> 7) + 256;
      if ((v16 & 0xFF00) == 0) {
        unsigned __int16 v18 = v16;
      }
      uint64_t v19 = a1 + 4LL * byte_100049E40[v18];
      ++*(_WORD *)(v19 + 2488);
      int v20 = *(_DWORD *)(a1 + 5884);
      int v21 = *(_DWORD *)(a1 + 5880) - 1;
      unsigned int v22 = *(_DWORD *)(a1 + 144);
      unsigned int v23 = *(_DWORD *)(a1 + 164) - v22;
      *(_DWORD *)(a1 + 164) = v23;
      if (v22 <= *(_DWORD *)(a1 + 176) && v23 >= 3)
      {
        *(_DWORD *)(a1 + 144) = v22 - 1;
        uint64_t v24 = *(void *)(a1 + 80);
        int v26 = *(_DWORD *)(a1 + 124);
        int v25 = *(_DWORD *)(a1 + 128);
        uint64_t v28 = *(void *)(a1 + 96);
        uint64_t v27 = *(void *)(a1 + 104);
        int v29 = *(_DWORD *)(a1 + 76);
        unsigned int v30 = *(_DWORD *)(a1 + 112);
        unsigned int v31 = v22 - 2;
        unsigned int v32 = *(_DWORD *)(a1 + 156) + 1;
        do
        {
          *(_DWORD *)(a1 + 156) = v32;
          unsigned int v30 = ((v30 << v25) ^ *(unsigned __int8 *)(v24 + v32 + 2)) & v26;
          *(_DWORD *)(a1 + memset(&v55[1], 0, 112) = v30;
          unsigned int v4 = *(unsigned __int16 *)(v27 + 2LL * v30);
          *(_WORD *)(v28 + 2LL * (v29 & v32)) = v4;
          *(_WORD *)(v27 + 2LL * v30) = v32;
          *(_DWORD *)(a1 + 144) = v31--;
          ++v32;
        }

        while (v31 != -1);
        goto LABEL_31;
      }

      unsigned int v32 = *(_DWORD *)(a1 + 156) + v22;
      *(_DWORD *)(a1 + 156) = v32;
      *(_DWORD *)(a1 + 144) = 0;
      uint64_t v36 = *(void *)(a1 + 80);
      int v37 = *(unsigned __int8 *)(v36 + v32);
      *(_DWORD *)(a1 + memset(&v55[1], 0, 112) = v37;
      *(_DWORD *)(a1 + memset(&v55[1], 0, 112) = ((v37 << *(_DWORD *)(a1 + 128)) ^ *(unsigned __int8 *)(v36 + v32 + 1)) & *(_DWORD *)(a1 + 124);
LABEL_33:
      if (v20 == v21)
      {
        uint64_t v38 = *(void *)(a1 + 136);
        uint64_t v39 = v38 < 0 ? 0LL : (char *)(*(void *)(a1 + 80) + v38);
        sub_10003AC34(a1, v39, v32 - v38, 0);
        *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
        sub_100023674(*(void **)a1);
        if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
          return 0LL;
        }
      }
    }
  }

  if (a2 == 6)
  {
    uint64_t result = 0LL;
    *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  }

  else
  {
    uint64_t v41 = *(void *)(a1 + 136);
    if (v41 < 0) {
      unint64_t v42 = 0LL;
    }
    else {
      unint64_t v42 = (char *)(*(void *)(a1 + 80) + v41);
    }
    sub_10003AC34(a1, v42, *(unsigned int *)(a1 + 156) - v41, a2 == 4);
    *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
    sub_100023674(*(void **)a1);
    if (*(_DWORD *)(*(void *)a1 + 32LL))
    {
      if (a2 == 4) {
        return 3LL;
      }
      else {
        return 1LL;
      }
    }

    else
    {
      return 2 * (a2 == 4);
    }
  }

  return result;
}

uint64_t sub_100023C80(uint64_t a1, int a2)
{
  unsigned int v4 = 0;
  while (1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 164);
    if (v5 <= 0x105) {
      break;
    }
LABEL_7:
    unsigned int v6 = *(_DWORD *)(a1 + 156);
    unsigned int v7 = ((*(_DWORD *)(a1 + 112) << *(_DWORD *)(a1 + 128)) ^ *(unsigned __int8 *)(*(void *)(a1 + 80) + v6 + 2)) & *(_DWORD *)(a1 + 124);
    *(_DWORD *)(a1 + memset(&v55[1], 0, 112) = v7;
    uint64_t v8 = *(void *)(a1 + 104);
    unsigned int v4 = *(unsigned __int16 *)(v8 + 2LL * v7);
    *(_WORD *)(*(void *)(a1 + 96) + 2LL * (*(_DWORD *)(a1 + 76) & v6)) = v4;
    *(_WORD *)(v8 + 2LL * v7) = v6;
LABEL_8:
    if (a2 == 6)
    {
      ++*(_DWORD *)(a1 + 156);
      goto LABEL_10;
    }

    unsigned int v9 = *(_DWORD *)(a1 + 144);
    *(_DWORD *)(a1 + 168) = v9;
    int v10 = *(_DWORD *)(a1 + 160);
    unsigned int v11 = 2;
    *(_DWORD *)(a1 + 144) = 2;
    *(_DWORD *)(a1 + 148) = v10;
    if (!v4) {
      goto LABEL_30;
    }
    if (v9 < *(_DWORD *)(a1 + 176))
    {
      unsigned int v12 = *(_DWORD *)(a1 + 156) - v4;
      if (v12 <= *(_DWORD *)(a1 + 68) - 262)
      {
        int v13 = *(_DWORD *)(a1 + 184);
        if ((v13 & 0xFFFFFFFE) == 2)
        {
          if (v12 != 1 || v13 != 3)
          {
            if (v13 != 1) {
              goto LABEL_29;
            }
LABEL_25:
            unsigned int v11 = 2;
            *(_DWORD *)(a1 + 144) = 2;
            goto LABEL_29;
          }

          unsigned int v11 = sub_100024518(a1, v4);
        }

        else
        {
          unsigned int v11 = sub_100024304(a1, v4);
        }

        *(_DWORD *)(a1 + 144) = v11;
        if (v11 <= 5)
        {
          if (*(_DWORD *)(a1 + 184) != 1)
          {
            if (v11 != 3) {
              goto LABEL_29;
            }
            if ((*(_DWORD *)(a1 + 156) - *(_DWORD *)(a1 + 160)) <= 0x1000)
            {
              unsigned int v11 = 3;
              goto LABEL_29;
            }
          }

          goto LABEL_25;
        }
      }
    }

LABEL_29:
    unsigned int v9 = *(_DWORD *)(a1 + 168);
LABEL_30:
    unsigned __int8 v15 = v9 - 3;
    if (v9 < 3 || v11 > v9)
    {
      if (*(_DWORD *)(a1 + 152))
      {
        uint64_t v33 = *(unsigned __int8 *)(*(void *)(a1 + 80) + (*(_DWORD *)(a1 + 156) - 1));
        uint64_t v34 = *(unsigned int *)(a1 + 5884);
        *(_WORD *)(*(void *)(a1 + 5888) + 2 * v34) = 0;
        uint64_t v35 = *(void *)(a1 + 5872);
        *(_DWORD *)(a1 + 5884) = v34 + 1;
        *(_BYTE *)(v35 + v34) = v33;
        ++*(_WORD *)(a1 + 4 * v33 + 196);
        if (*(_DWORD *)(a1 + 5884) == *(_DWORD *)(a1 + 5880) - 1)
        {
          uint64_t v36 = *(void *)(a1 + 136);
          if (v36 < 0) {
            int v37 = 0LL;
          }
          else {
            int v37 = (char *)(*(void *)(a1 + 80) + v36);
          }
          sub_10003AC34(a1, v37, *(unsigned int *)(a1 + 156) - v36, 0);
          *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
          sub_100023674(*(void **)a1);
        }

        ++*(_DWORD *)(a1 + 156);
        --*(_DWORD *)(a1 + 164);
        goto LABEL_51;
      }

      int v38 = *(_DWORD *)(a1 + 156) + 1;
      *(_DWORD *)(a1 + 152) = 1;
      *(_DWORD *)(a1 + 156) = v38;
      unsigned int v5 = *(_DWORD *)(a1 + 164);
LABEL_10:
      *(_DWORD *)(a1 + 164) = v5 - 1;
    }

    else
    {
      int v16 = *(_DWORD *)(a1 + 156);
      int v17 = v16 + *(_DWORD *)(a1 + 164);
      int v18 = v16 + ~*(_DWORD *)(a1 + 148);
      uint64_t v19 = *(unsigned int *)(a1 + 5884);
      *(_WORD *)(*(void *)(a1 + 5888) + 2 * v19) = v18;
      uint64_t v20 = *(void *)(a1 + 5872);
      *(_DWORD *)(a1 + 5884) = v19 + 1;
      *(_BYTE *)(v20 + v19) = v15;
      unsigned __int16 v21 = v18 - 1;
      uint64_t v22 = a1 + 4LL * byte_10004A040[v15];
      ++*(_WORD *)(v22 + 1224);
      unsigned __int16 v23 = (v21 >> 7) + 256;
      if ((v21 & 0xFF00) == 0) {
        unsigned __int16 v23 = v21;
      }
      unsigned int v24 = v17 - 3;
      uint64_t v28 = a1 + 4LL * byte_100049E40[v23];
      ++*(_WORD *)(v28 + 2488);
      int v25 = *(_DWORD *)(a1 + 5884);
      int v26 = *(_DWORD *)(a1 + 5880) - 1;
      LODWORD(v28) = *(_DWORD *)(a1 + 168);
      *(_DWORD *)(a1 + 164) = *(_DWORD *)(a1 + 164) - v28 + 1;
      *(_DWORD *)(a1 + 168) = v28 - 2;
      int v27 = v28 - 3;
      LODWORD(v28) = *(_DWORD *)(a1 + 156) + 1;
      do
      {
        *(_DWORD *)(a1 + 156) = v28;
        if (v28 <= v24)
        {
          *(_DWORD *)(a1 + memset(&v55[1], 0, 112) = v29;
          uint64_t v30 = *(void *)(a1 + 104);
          unsigned int v4 = *(unsigned __int16 *)(v30 + 2LL * v29);
          *(_WORD *)(*(void *)(a1 + 96) + 2LL * (*(_DWORD *)(a1 + 76) & v28)) = v4;
          *(_WORD *)(v30 + 2LL * v29) = v28;
        }

        *(_DWORD *)(a1 + 168) = v27--;
        uint64_t v28 = (v28 + 1);
      }

      while (v27 != -1);
      *(_DWORD *)(a1 + 144) = 2;
      *(_DWORD *)(a1 + 152) = 0;
      *(_DWORD *)(a1 + 156) = v28;
      if (v25 == v26)
      {
        uint64_t v31 = *(void *)(a1 + 136);
        if (v31 < 0) {
          unsigned int v32 = 0LL;
        }
        else {
          unsigned int v32 = (char *)(*(void *)(a1 + 80) + v31);
        }
        sub_10003AC34(a1, v32, v28 - v31, 0);
        *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
        sub_100023674(*(void **)a1);
LABEL_51:
        if (!*(_DWORD *)(*(void *)a1 + 32LL)) {
          return 0LL;
        }
      }
    }
  }

  sub_100024124((unsigned int *)a1);
  unsigned int v5 = *(_DWORD *)(a1 + 164);
  if (!a2 && v5 < 0x106) {
    return 0LL;
  }
  if (v5)
  {
    if (v5 < 3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  if (a2 == 6)
  {
    uint64_t result = 0LL;
    *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
  }

  else
  {
    if (*(_DWORD *)(a1 + 152))
    {
      uint64_t v40 = *(unsigned __int8 *)(*(void *)(a1 + 80) + (*(_DWORD *)(a1 + 156) - 1));
      uint64_t v41 = *(unsigned int *)(a1 + 5884);
      *(_WORD *)(*(void *)(a1 + 5888) + 2 * v41) = 0;
      uint64_t v42 = *(void *)(a1 + 5872);
      *(_DWORD *)(a1 + 5884) = v41 + 1;
      *(_BYTE *)(v42 + v41) = v40;
      ++*(_WORD *)(a1 + 4 * v40 + 196);
      *(_DWORD *)(a1 + 152) = 0;
    }

    uint64_t v43 = *(void *)(a1 + 136);
    if (v43 < 0) {
      uint64_t v44 = 0LL;
    }
    else {
      uint64_t v44 = (char *)(*(void *)(a1 + 80) + v43);
    }
    sub_10003AC34(a1, v44, *(unsigned int *)(a1 + 156) - v43, a2 == 4);
    *(void *)(a1 + 136) = *(unsigned int *)(a1 + 156);
    sub_100023674(*(void **)a1);
    if (*(_DWORD *)(*(void *)a1 + 32LL))
    {
      if (a2 == 4) {
        return 3LL;
      }
      else {
        return 1LL;
      }
    }

    else
    {
      return 2 * (a2 == 4);
    }
  }

  return result;
}

unsigned int *sub_100024124(unsigned int *result)
{
  uint64_t v1 = result;
  size_t v2 = result[17];
  unsigned int v3 = result[41];
  int32x2_t v4 = vdup_n_s32(v2);
  do
  {
    unsigned int v5 = v1[39];
    LODWORD(v6) = v1[22] - (v3 + v5);
    if (v5 >= (_DWORD)v2 - 262 + v1[17])
    {
      uint64_t result = (unsigned int *)memcpy(*((void **)v1 + 10), (const void *)(*((void *)v1 + 10) + v2), v2);
      int32x2_t v7 = vsub_s32(*(int32x2_t *)(v1 + 39), v4);
      *(int32x2_t *)(v1 + 39) = v7;
      *((void *)v1 + 17) -= v2;
      uint64_t v8 = v1[29];
      unsigned int v9 = (_WORD *)(*((void *)v1 + 13) + 2 * v8 - 2);
      do
      {
        unsigned int v10 = (unsigned __int16)*v9;
        BOOL v11 = v10 >= v2;
        __int16 v12 = v10 - v2;
        if (!v11) {
          __int16 v12 = 0;
        }
        *v9-- = v12;
        LODWORD(v8) = v8 - 1;
      }

      while ((_DWORD)v8);
      int v13 = (_WORD *)(*((void *)v1 + 12) + 2 * v2 - 2);
      int v14 = v2;
      do
      {
        unsigned int v15 = (unsigned __int16)*v13;
        BOOL v11 = v15 >= v2;
        __int16 v16 = v15 - v2;
        if (!v11) {
          __int16 v16 = 0;
        }
        *v13-- = v16;
        --v14;
      }

      while (v14);
      LODWORD(v6) = v2 + v6;
      unsigned int v5 = v7.i32[0];
    }

    uint64_t v17 = *(void *)v1;
    unsigned int v18 = *(_DWORD *)(*(void *)v1 + 8LL);
    if (!v18) {
      break;
    }
    uint64_t v19 = v1[41];
    else {
      size_t v6 = v18;
    }
    if (!(_DWORD)v6) {
      goto LABEL_23;
    }
    uint64_t v20 = *((void *)v1 + 10);
    *(_DWORD *)(v17 + 8) = v18 - v6;
    int v21 = *(_DWORD *)(*(void *)(v17 + 56) + 44LL);
    if (v21 == 2)
    {
      uint64_t v22 = sub_10001DA6C(*(void *)(v17 + 96), *(int **)v17, v6);
      goto LABEL_21;
    }

    if (v21 == 1)
    {
      uint64_t v22 = sub_100013130(*(void *)(v17 + 96), *(unsigned __int8 **)v17, v6);
LABEL_21:
      *(void *)(v17 + 96) = v22;
    }

    uint64_t result = (unsigned int *)memcpy((void *)(v20 + v5 + v19), *(const void **)v17, v6);
    *(void *)v17 += v6;
    *(void *)(v17 + 16) += v6;
    LODWORD(v19) = v1[41];
LABEL_23:
    unsigned int v3 = v19 + v6;
    v1[41] = v19 + v6;
    if ((v19 + v6) >= 3)
    {
      uint64_t v23 = *((void *)v1 + 10);
      uint64_t v24 = v1[39];
      unsigned int v25 = *(unsigned __int8 *)(v23 + v24);
      v1[28] = v25;
      v1[28] = ((v25 << v1[32]) ^ *(unsigned __int8 *)(v23 + (v24 + 1))) & v1[31];
      if (v3 > 0x105) {
        return result;
      }
    }
  }

  while (*(_DWORD *)(*(void *)v1 + 8LL));
  return result;
}

uint64_t sub_100024304(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 172);
  uint64_t v3 = *(int *)(a1 + 168);
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = *(unsigned int *)(a1 + 156);
  size_t v6 = (unsigned __int8 *)(v4 + v5);
  unsigned int v7 = *(_DWORD *)(a1 + 68) - 262;
  BOOL v8 = v5 >= v7;
  unsigned int v9 = v5 - v7;
  if (!v8) {
    unsigned int v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 96);
  unsigned int v11 = *(_DWORD *)(a1 + 76);
  unsigned int v12 = *(_DWORD *)(a1 + 164);
  int v13 = v6[v3 - 1];
  int v14 = v6[v3];
  unsigned int v15 = *(_DWORD *)(a1 + 192);
  if (v15 >= v12) {
    unsigned int v15 = *(_DWORD *)(a1 + 164);
  }
  while (1)
  {
    __int16 v16 = (unsigned __int8 *)(v4 + a2);
    uint64_t v17 = 0LL;
    uint64_t v18 = v4 + 5 + a2;
    while (1)
    {
      uint64_t v19 = &v6[v17];
      if (v6[v17 + 3] != *(unsigned __int8 *)(v18 + v17 - 2))
      {
        int v25 = (_DWORD)v19 + 3;
        goto LABEL_29;
      }

      if (v19[4] != *(unsigned __int8 *)(v18 + v17 - 1))
      {
        int v25 = (_DWORD)v6 + v17 + 4;
        goto LABEL_29;
      }

      uint64_t v20 = &v6[v17];
      if (v6[v17 + 5] != *(unsigned __int8 *)(v18 + v17))
      {
        int v25 = (_DWORD)v20 + 5;
        goto LABEL_29;
      }

      if (v20[6] != *(unsigned __int8 *)(v18 + v17 + 1))
      {
        int v25 = (_DWORD)v6 + v17 + 6;
        goto LABEL_29;
      }

      int v21 = &v6[v17];
      if (v6[v17 + 7] != *(unsigned __int8 *)(v18 + v17 + 2))
      {
        int v25 = (_DWORD)v21 + 7;
        goto LABEL_29;
      }

      if (v21[8] != *(unsigned __int8 *)(v18 + v17 + 3))
      {
        int v25 = (_DWORD)v6 + v17 + 8;
        goto LABEL_29;
      }

      uint64_t v22 = &v6[v17];
      int v23 = v17 + 8;
      if ((unint64_t)(v17 + 2) <= 0xF9)
      {
        int v24 = *(unsigned __int8 *)(v18 + v17 + 5);
        v17 += 8LL;
        if (v22[10] == v24) {
          continue;
        }
      }

      int v25 = (_DWORD)v6 + v23 + 2;
      goto LABEL_29;
    }

    int v25 = (_DWORD)v22 + 9;
LABEL_29:
    int v26 = v25 - ((_DWORD)v6 + 258);
    int v27 = v25 - (_DWORD)v6;
    *(_DWORD *)(a1 + 160) = a2;
    int v13 = v6[v26 + 257];
    int v14 = v6[v27];
    LODWORD(v3) = v27;
LABEL_32:
    a2 = *(unsigned __int16 *)(v10 + 2LL * (a2 & v11));
    --v2;
    if (v9 >= a2 || v2 == 0) {
      goto LABEL_37;
    }
  }

  LODWORD(v3) = v27;
LABEL_37:
  else {
    return v3;
  }
}

uint64_t sub_100024518(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = (unsigned __int8 *)(v2 + *(unsigned int *)(a1 + 156));
  uint64_t v4 = (unsigned __int8 *)(v2 + a2);
  if (*v4 != *v3 || v4[1] != v3[1]) {
    return 2LL;
  }
  uint64_t v5 = 0LL;
  int v6 = (_DWORD)v3 + 258;
  uint64_t v7 = a2 + v2 + 5;
  while (1)
  {
    BOOL v8 = &v3[v5];
    if (v3[v5 + 3] != *(unsigned __int8 *)(v7 + v5 - 2))
    {
      int v14 = (_DWORD)v8 + 3;
      goto LABEL_21;
    }

    if (v8[4] != *(unsigned __int8 *)(v7 + v5 - 1))
    {
      int v14 = (_DWORD)v3 + v5 + 4;
      goto LABEL_21;
    }

    unsigned int v9 = &v3[v5];
    if (v3[v5 + 5] != *(unsigned __int8 *)(v7 + v5))
    {
      int v14 = (_DWORD)v9 + 5;
      goto LABEL_21;
    }

    if (v9[6] != *(unsigned __int8 *)(v7 + v5 + 1))
    {
      int v14 = (_DWORD)v3 + v5 + 6;
      goto LABEL_21;
    }

    uint64_t v10 = &v3[v5];
    if (v3[v5 + 7] != *(unsigned __int8 *)(v7 + v5 + 2))
    {
      int v14 = (_DWORD)v10 + 7;
      goto LABEL_21;
    }

    if (v10[8] != *(unsigned __int8 *)(v7 + v5 + 3))
    {
      int v14 = (_DWORD)v3 + v5 + 8;
      goto LABEL_21;
    }

    unsigned int v11 = &v3[v5];
    int v12 = v5 + 8;
    if ((unint64_t)(v5 + 2) <= 0xF9)
    {
      int v13 = *(unsigned __int8 *)(v7 + v5 + 5);
      v5 += 8LL;
      if (v11[10] == v13) {
        continue;
      }
    }

    int v14 = (_DWORD)v3 + v12 + 2;
    goto LABEL_21;
  }

  int v14 = (_DWORD)v11 + 9;
LABEL_21:
  int v15 = v14 - v6 + 258;
  if (v15 < 3) {
    return 2LL;
  }
  *(_DWORD *)(a1 + 160) = a2;
  unsigned int v17 = *(_DWORD *)(a1 + 164);
  if (v15 >= v17) {
    return v17;
  }
  else {
    return v15;
  }
}

uint64_t sub_100024688( int a1, unsigned __int16 *a2, unsigned int a3, _WORD **a4, unsigned int *a5, _WORD *a6)
{
  if (a3)
  {
    uint64_t v7 = a3;
    BOOL v8 = a2;
    do
    {
      unsigned int v9 = *v8++;
      ++*((_WORD *)v55 + v9);
      --v7;
    }

    while (v7);
  }

  unsigned int v10 = *a5;
  unsigned int v11 = 15;
  while (!*((_WORD *)v55 + v11))
  {
    if (!--v11)
    {
      int v12 = *a4;
      *a4 += 2;
      *int v12 = 320;
      v12[1] = 0;
      int v13 = *a4;
      *a4 += 2;
      *int v13 = 320;
      v13[1] = 0;
      unsigned int v10 = 1;
LABEL_77:
      uint64_t result = 0LL;
      *a5 = v10;
      return result;
    }
  }

  if (v10 >= v11) {
    unsigned int v10 = v11;
  }
  for (uint64_t i = 1LL; i != 16; ++i)
  {
    if (*((_WORD *)v55 + i)) {
      break;
    }
  }

  int v15 = 1;
  for (uint64_t j = 2LL; j != 32; j += 2LL)
  {
    int v15 = 2 * v15 - *(unsigned __int16 *)((char *)v55 + j);
    if (v15 < 0) {
      return 0xFFFFFFFFLL;
    }
  }

  if (!v15 || (uint64_t result = 0xFFFFFFFFLL, a1) && v11 == 1)
  {
    uint64_t v18 = 0LL;
    int v19 = 0;
    v54[1] = 0;
    do
    {
      v19 += *(unsigned __int16 *)((char *)v55 + v18 * 2 + 2);
      v54[v18 + 2] = v19;
      ++v18;
    }

    while (v18 != 14);
    if (a3)
    {
      for (uint64_t k = 0LL; k != a3; ++k)
      {
        uint64_t v21 = a2[k];
        if (a2[k])
        {
          uint64_t v22 = (unsigned __int16)v54[v21];
          v54[v21] = v22 + 1;
          a6[v22] = k;
        }
      }
    }

    if (a1)
    {
      if (a1 == 1)
      {
        uint64_t result = 1LL;
        if (v10 > 0xA) {
          return result;
        }
        int v23 = &unk_1000497C6;
        int v24 = &unk_100049804;
        int v25 = 256;
      }

      else
      {
        LOBYTE(result) = 0;
        int v23 = &unk_100049A44;
        int v25 = -1;
        int v24 = &unk_100049A84;
      }
    }

    else
    {
      LOBYTE(result) = 0;
      int v25 = 19;
      int v24 = a6;
      int v23 = a6;
    }

    int v26 = 0;
    unsigned int v27 = 0;
    unsigned int v28 = 0;
    unsigned int v29 = 1 << v10;
    int v30 = (1 << v10) - 1;
    uint64_t v31 = *a4;
    char v32 = v10;
    int v33 = -1;
    while (2)
    {
      unsigned int v34 = 1 << v32;
      do
      {
        uint64_t v35 = (unsigned __int16)a6[v26];
        if (v25 <= (int)v35)
        {
          if (v25 >= (int)v35)
          {
            LOWORD(v35) = 0;
            char v36 = 96;
          }

          else
          {
            char v36 = v24[2 * v35];
            LOWORD(v35) = v23[v35];
          }
        }

        else
        {
          char v36 = 0;
        }

        char v37 = i - v27;
        int v38 = -1 << (i - v27);
        unsigned int v39 = v34;
        do
        {
          uint64_t v40 = &v31[2 * (v28 >> v27) + 2 * v38 + 2 * v39];
          *(_BYTE *)uint64_t v40 = v36;
          *((_BYTE *)v40 + 1) = v37;
          v40[1] = v35;
          v39 += v38;
        }

        while (v39);
        unsigned int v41 = 1 << (i - 1);
        do
        {
          unsigned int v42 = v41;
          v41 >>= 1;
        }

        while ((v42 & v28) != 0);
        unsigned int v43 = ((v42 - 1) & v28) + v42;
        if (v42) {
          unsigned int v28 = ((v42 - 1) & v28) + v42;
        }
        else {
          unsigned int v28 = 0;
        }
        ++v26;
        __int16 v44 = *((_WORD *)v55 + i) - 1;
        *((_WORD *)v55 + i) = v44;
        if (!v44)
        {
          if ((_DWORD)i == v11)
          {
            if (v28)
            {
              do
              {
                if (v27 && (v43 & v30) != v33)
                {
                  unsigned int v27 = 0;
                  uint64_t v31 = *a4;
                  LOBYTE(v11) = v10;
                  char v37 = v10;
                }

                uint64_t v51 = &v31[2 * (v43 >> v27)];
                *(_BYTE *)uint64_t v51 = 64;
                *((_BYTE *)v51 + 1) = v37;
                v51[1] = 0;
                unsigned int v52 = 1 << (v11 - 1);
                do
                {
                  unsigned int v53 = v52;
                  v52 >>= 1;
                }

                while ((v53 & v43) != 0);
                if (!v53) {
                  break;
                }
                unsigned int v43 = ((v53 - 1) & v43) + v53;
              }

              while (v43);
            }

            *a4 += 2 * v29;
            goto LABEL_77;
          }

          LODWORD(i) = a2[(unsigned __int16)a6[v26]];
        }
      }

      while (i <= v10 || (v28 & v30) == v33);
      if (!v27) {
        unsigned int v27 = v10;
      }
      char v32 = i - v27;
      int v45 = 1 << (i - v27);
      if (i < v11)
      {
        char v32 = v11 - v27;
        unsigned int v46 = i;
        while (1)
        {
          int v47 = v45 - *((unsigned __int16 *)v55 + v46);
          if (v47 < 1) {
            break;
          }
          int v45 = 2 * v47;
          if (++v46 >= v11) {
            goto LABEL_62;
          }
        }

        char v32 = v46 - v27;
LABEL_62:
        int v45 = 1 << v32;
      }

      v29 += v45;
      if (v29 > 0x5AF) {
        char v48 = result;
      }
      else {
        char v48 = 0;
      }
      if ((v48 & 1) == 0)
      {
        v31 += 2 * v34;
        uint64_t v49 = *a4;
        uint64_t v50 = (uint64_t)&(*a4)[2 * (v28 & v30)];
        *(_BYTE *)uint64_t v50 = v32;
        *(_BYTE *)(v50 + 1) = v10;
        *(_WORD *)(v50 + 2) = ((_DWORD)v31 - (_DWORD)v49) >> 2;
        int v33 = v28 & v30;
        continue;
      }

      return 1LL;
    }
  }

  return result;
}

uint64_t sub_100024ABC(const char *a1, uint64_t *a2, int a3)
{
  unsigned int v11 = 0LL;
  size_t v6 = strlen(a1);
  uint64_t v7 = 0LL;
  if (v6)
  {
    if ((a1[v6 - 1] & 0x80000000) == 0 && a1[v6 - 1] - 48 <= 9)
    {
      asprintf(&v11, "%s%c", a1, a3);
      uint64_t v7 = v11;
      if (!v11) {
        sub_100040AEC();
      }
    }
  }

  if (v7) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = (char *)a1;
  }
  uint64_t v9 = sub_10000715C(v8, a2);
  free(v11);
  return v9;
}

uint64_t sub_100024B60(const char *a1, _WORD *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = strdup(a1);
  __stringp = v3;
  if (!v3) {
    return *__error();
  }
  uint64_t v4 = v3;
  while (2)
  {
    uint64_t v5 = strsep(&__stringp, ",");
    if (!v5) {
      break;
    }
    int v6 = 0;
    int v7 = *v5;
    if ((v7 | 2) == 0x46) {
      BOOL v8 = v5 + 1;
    }
    else {
      BOOL v8 = v5;
    }
    if ((v7 | 2) == 0x46) {
      int v9 = *v5;
    }
    else {
      int v9 = 0;
    }
    unsigned int v10 = v8 + 1;
    for (uint64_t i = (unsigned __int8 *)(v8 + 2); ; ++i)
    {
      int v12 = *(v10 - 1);
      if (v12 <= 102) {
        break;
      }
      switch(v12)
      {
        case 'g':
          int v13 = 1080;
          break;
        case 'o':
          int v13 = 7;
          break;
        case 'u':
          int v13 = 2496;
          break;
        default:
          goto LABEL_69;
      }

LABEL_22:
      v6 |= v13;
      ++v10;
    }

    if (v12 > 96)
    {
      if (v12 != 97) {
        goto LABEL_69;
      }
      int v13 = 511;
      goto LABEL_22;
    }

    if (v12 != 43 && v12 != 45 && v12 != 61)
    {
LABEL_69:
      uint64_t v25 = 22LL;
      goto LABEL_70;
    }

    __int16 v14 = v6;
    if (!v6)
    {
      mode_t v15 = umask(0);
      umask(v15);
      __int16 v14 = ~v15;
    }

    char v16 = *v10;
    if (!*v10) {
      goto LABEL_66;
    }
    int v17 = 0;
    __int16 v18 = 0;
    int v19 = v14 & 0x49;
    do
    {
      switch(v16)
      {
        case 'r':
          v17 |= v14 & 0x124;
          break;
        case 's':
          v17 |= v14 & 0xC00;
          break;
        case 't':
          v17 |= 0x200u;
          break;
        case 'u':
        case 'v':
          goto LABEL_69;
        case 'w':
          v17 |= v14 & 0x92;
          break;
        case 'x':
          v17 |= v19;
          break;
        default:
          if (v16 != 88) {
            goto LABEL_69;
          }
          v18 |= v19;
          break;
      }

      int v20 = *i++;
      char v16 = v20;
    }

    while (v20);
    if (!a2) {
      goto LABEL_66;
    }
    int v21 = *(v10 - 1);
    if (v21 == 61)
    {
      if (v9)
      {
        if (v9 == 70)
        {
LABEL_62:
          __int16 v24 = v14 & 0x1FF;
          if (!v6) {
            __int16 v24 = 4095;
          }
          a2[107] = v24;
          goto LABEL_65;
        }

        if (v9 != 68) {
          goto LABEL_66;
        }
      }

      if (v6) {
        a2[107] = v14 & 0x777;
      }
      else {
        a2[104] = 4095;
      }
      a2[105] = v17;
      if (v9) {
        goto LABEL_66;
      }
      goto LABEL_62;
    }

    if (v21 == 45)
    {
      if (!v9 || v9 == 68)
      {
        a2[104] |= v17;
        __int16 v23 = ~(_WORD)v17;
        a2[105] &= ~(_WORD)v17;
        if (v9) {
          goto LABEL_66;
        }
      }

      else
      {
        if (v9 != 70) {
          goto LABEL_66;
        }
        __int16 v23 = ~(_WORD)v17;
      }

      a2[107] |= v17;
      LOWORD(v17) = a2[108] & v23;
LABEL_65:
      a2[108] = v17;
      goto LABEL_66;
    }

    if (v21 != 43) {
      goto LABEL_69;
    }
    if (!v9 || v9 == 68)
    {
      __int16 v22 = ~(_WORD)v17;
      a2[104] &= ~(_WORD)v17;
      a2[105] |= v17;
      a2[106] |= v18;
      if (!v9)
      {
LABEL_57:
        a2[107] &= v22;
        a2[108] |= v17;
        a2[109] |= v18;
      }
    }

    else if (v9 == 70)
    {
      __int16 v22 = ~(_WORD)v17;
      goto LABEL_57;
    }

LABEL_66:
    if (__stringp) {
      continue;
    }
    break;
  }

  uint64_t v25 = 0LL;
LABEL_70:
  free(v4);
  return v25;
}

void *sub_100024E80(int a1, char *const *a2, uint64_t (*a3)(uint64_t, void, char **), uint64_t a4)
{
  int v103 = 0;
  int v101 = 0;
  uint64_t v104 = 0LL;
  unint64_t v102 = 0LL;
  int v108 = -1;
  dword_100058A2C = -1;
  int v105 = -1;
  uint64_t v106 = 0LL;
  dword_100058A00 = -1;
  qword_1000588E0 = -1LL;
  qword_1000588E8 = -1LL;
  qword_1000589C8 = (uint64_t)__stderrp;
  dword_100058870 = 1;
  dword_100058808 = 29;
  while (1)
  {
    uint64_t v8 = getopt_long(a1, a2, "0468B:CDEFHIKLOPRSVWabcde:f:ghklnopqrtuvxyz", (const option *)&off_100054AE0, &v108);
    if ((_DWORD)v8 == -1) {
      break;
    }
    int v9 = v8;
    if (!a3) {
      goto LABEL_21;
    }
    if (v108 == -1)
    {
      unsigned int v10 = &off_100054AE0;
      while (v10[2] || *((_DWORD *)v10 + 6) != (_DWORD)v8)
      {
        int v13 = v10[4];
        v10 += 4;
        if (!v13)
        {
          unsigned int v10 = 0LL;
          break;
        }
      }

      char v14 = v8;
    }

    else
    {
      unsigned int v10 = &(&off_100054AE0)[4 * v108];
      uint64_t v11 = *((unsigned int *)v10 + 6);
      else {
        __uint32_t v12 = _DefaultRuneLocale.__runetype[v11] & 0x40000;
      }
      if (v12) {
        char v14 = v11;
      }
      else {
        char v14 = 0;
      }
    }

    uint64_t v8 = a3(a4, v14, v10);
    int v15 = v8 == 0;
    if (v15 != 2)
    {
      if (v15) {
        return 0LL;
      }
LABEL_21:
      switch(v9)
      {
        case 0:
        case 176:
          goto LABEL_168;
        case 48:
          dword_1000589B8 = 1;
          goto LABEL_168;
        case 52:
          char v16 = &off_100058000;
          int v17 = 4;
          goto LABEL_27;
        case 54:
          char v16 = &off_100058000;
          int v17 = 6;
LABEL_27:
          *((_DWORD *)v16 + 652) = v17;
          goto LABEL_168;
        case 56:
        case 174:
          ++dword_1000588D4;
          goto LABEL_168;
        case 66:
          uint64_t v18 = sub_10000715C(optarg, &v110);
          if ((_DWORD)v18 == -1) {
            sub_100040D3C(v18);
          }
          if (v110 < 0) {
            sub_100040D64(v18);
          }
          qword_1000589E8 = v110;
          goto LABEL_168;
        case 67:
          HIDWORD(v104) = 1;
          goto LABEL_168;
        case 68:
          qword_100058868 = 0x100000001LL;
          goto LABEL_168;
        case 69:
          dword_100058A58 = 1;
          goto LABEL_168;
        case 70:
          if (v101)
          {
            if (v101 != 1)
            {
              ++v101;
              goto LABEL_168;
            }

            int v19 = "- .rsync-filter";
          }

          else
          {
            int v19 = ": /.rsync-filter";
          }

          if (dword_1000589B8) {
            unsigned int v38 = 0;
          }
          else {
            unsigned int v38 = 10;
          }
          ++v101;
LABEL_168:
          int v108 = -1;
          break;
        case 72:
          dword_1000588C8 = 1;
          goto LABEL_168;
        case 73:
          ++dword_100058884;
          goto LABEL_168;
        case 75:
          dword_100058850 = 1;
          goto LABEL_168;
        case 76:
          dword_100058840 = 1;
          goto LABEL_168;
        case 79:
          dword_100058880 = 1;
          goto LABEL_168;
        case 80:
          dword_10005882C = 1;
          ++dword_100058888;
          goto LABEL_168;
        case 82:
          ++dword_1000588BC;
          goto LABEL_168;
        case 83:
        case 145:
          ++dword_100058890;
          goto LABEL_168;
        case 84:
          free((void *)qword_100058A20);
          qword_100058A20 = (uint64_t)strdup(optarg);
          if (!qword_100058A20) {
            sub_100040D1C();
          }
          goto LABEL_168;
        case 86:
          printf("openrsync: protocol version %u\n", 29);
          puts("rsync version 2.6.9 compatible");
          exit(0);
        case 87:
          dword_100058A00 = 1;
          goto LABEL_168;
        case 97:
          dword_100058820 = 1;
          qword_100058838 = 0x100000001LL;
          *(void *)&dword_100058854 = 0x100000001LL;
          LODWORD(v104) = 1;
          dword_10005885C = 1;
          qword_100058868 = 0x100000001LL;
          goto LABEL_168;
        case 98:
          ++dword_100058898;
          goto LABEL_168;
        case 99:
          dword_100058810 = 1;
          goto LABEL_168;
        case 100:
          dword_1000588C0 = 2;
          goto LABEL_168;
        case 101:
          qword_1000588F8 = (uint64_t)optarg;
          goto LABEL_168;
        case 102:
          if (dword_1000589B8) {
            unsigned int v20 = 0;
          }
          else {
            unsigned int v20 = 10;
          }
          uint64_t v21 = sub_10002B150(optarg, 0, v20);
          if ((_DWORD)v21 == -1) {
            sub_100040DB4(v21);
          }
          goto LABEL_168;
        case 103:
          dword_100058858 = 1;
          goto LABEL_168;
        case 104:
          if (a1 == 2) {
            goto LABEL_332;
          }
          ++dword_1000588B0;
          goto LABEL_168;
        case 107:
          dword_10005884C = 1;
          goto LABEL_168;
        case 108:
          dword_100058854 = 1;
          goto LABEL_168;
        case 110:
          dword_100058824 = 2;
          goto LABEL_168;
        case 111:
          dword_10005885C = 1;
          goto LABEL_168;
        case 112:
          HIDWORD(qword_100058838) = 1;
          goto LABEL_168;
        case 113:
          ++dword_100058A48;
          goto LABEL_168;
        case 114:
          LODWORD(v104) = 0;
          dword_100058820 = 1;
          goto LABEL_168;
        case 116:
          LODWORD(qword_100058838) = 1;
          goto LABEL_168;
        case 117:
          ++dword_100058894;
          goto LABEL_168;
        case 118:
          ++dword_100058FDC;
          goto LABEL_168;
        case 120:
          ++dword_10005887C;
          goto LABEL_168;
        case 121:
          dword_100058A44 = 1;
          goto LABEL_168;
        case 122:
          ++dword_100058A28;
          goto LABEL_168;
        case 128:
          qword_100058908 = (uint64_t)optarg;
          goto LABEL_168;
        case 129:
          qword_100058900 = (uint64_t)optarg;
          goto LABEL_168;
        case 130:
          qword_1000588F0 = (uint64_t)optarg;
          goto LABEL_168;
        case 131:
          int v105 = strtonum(optarg, 0LL, 3600LL, (const char **)&__errstrp);
          if (__errstrp) {
            sub_100040DDC((uint64_t)__errstrp);
          }
          goto LABEL_168;
        case 132:
          dword_100058FE0 = strtonum(optarg, 0LL, 3600LL, (const char **)&__errstrp);
          if (__errstrp) {
            sub_100040DDC((uint64_t)__errstrp);
          }
          goto LABEL_168;
        case 133:
          int v98 = sub_10000A738(a1, a2, (uint64_t)&unk_100058800);
          exit(v98);
        case 134:
          uint64_t v22 = sub_10002B150(optarg, 1, 0);
          if ((_DWORD)v22 == -1) {
            sub_100040E04(v22);
          }
          goto LABEL_168;
        case 135:
          qword_100058868 = 0LL;
          goto LABEL_168;
        case 136:
          uint64_t v23 = sub_10002B150(optarg, 2, 0);
          if ((_DWORD)v23 == -1) {
            sub_100040E2C(v23);
          }
          goto LABEL_168;
        case 137:
          __int16 v24 = optarg;
          if (dword_1000589B8) {
            uint64_t v25 = 0LL;
          }
          else {
            uint64_t v25 = 10LL;
          }
          uint64_t v26 = 1LL;
          goto LABEL_157;
        case 138:
          __int16 v24 = optarg;
          if (dword_1000589B8) {
            uint64_t v25 = 0LL;
          }
          else {
            uint64_t v25 = 10LL;
          }
          uint64_t v26 = 2LL;
LABEL_157:
          sub_10002B170(v24, v26, v25);
          goto LABEL_168;
        case 139:
          int v27 = 1;
          goto LABEL_94;
        case 140:
          if ((dword_10005888C & 0xFFFFFFFD) != 0) {
            sub_100040E54((uint64_t)&v108, dword_10005888C);
          }
          int v27 = 2;
          goto LABEL_94;
        case 141:
          int v27 = 3;
          if (dword_10005888C && dword_10005888C != 3) {
            sub_100040E54((uint64_t)&v108, dword_10005888C);
          }
LABEL_94:
          dword_10005888C = v27;
          if (v102 >= 0x14) {
            sub_100040E88((uint64_t)&v108);
          }
          *((void *)&unk_100058800 + v102++ + 34) = optarg;
          goto LABEL_168;
        case 142:
          uint64_t v28 = sub_10000715C(optarg, &v110);
          if ((_DWORD)v28 == -1) {
            sub_100040ECC(v28);
          }
          qword_1000588E0 = v110;
          goto LABEL_168;
        case 143:
          uint64_t v29 = sub_10000715C(optarg, &v110);
          if ((_DWORD)v29 == -1) {
            sub_100040EE0(v29);
          }
          qword_1000588E8 = v110;
          goto LABEL_168;
        case 144:
          dword_100058878 = 2;
          goto LABEL_168;
        case 146:
          qword_1000589D0 = (uint64_t)optarg;
          goto LABEL_168;
        case 147:
          ++dword_1000588B4;
          goto LABEL_168;
        case 148:
          ++dword_1000588B8;
          goto LABEL_168;
        case 149:
          if (dword_100058860) {
            goto LABEL_168;
          }
          int v30 = 1;
LABEL_167:
          dword_100058860 = v30;
          goto LABEL_168;
        case 150:
          int v30 = 2;
          goto LABEL_167;
        case 151:
          int v30 = 3;
          goto LABEL_167;
        case 152:
          int v30 = 4;
          goto LABEL_167;
        case 153:
          int v30 = 5;
          goto LABEL_167;
        case 154:
          uint64_t v31 = sub_100024ABC(optarg, &v110, 107);
          if ((_DWORD)v31 == -1) {
            sub_100040EF4(v31);
          }
          qword_1000589D8 = v110;
          goto LABEL_168;
        case 155:
          dword_1000588BC = 0;
          LODWORD(v106) = v106 + 1;
          goto LABEL_168;
        case 156:
          dword_1000588C0 = 0;
          ++HIDWORD(v106);
          goto LABEL_168;
        case 157:
          qword_1000589B0 = (uint64_t)optarg;
          goto LABEL_168;
        case 158:
          ++dword_10005880C;
          goto LABEL_168;
        case 159:
          dword_10005882C = 1;
          free((void *)qword_100058830);
          qword_100058830 = (uint64_t)strdup(optarg);
          if (!qword_100058830) {
            sub_100040D1C();
          }
          goto LABEL_168;
        case 160:
          if (*optarg)
          {
            *__error() = 0;
            uint64_t v32 = strtoll(optarg, (char **)__endptr, 0);
            uint64_t v110 = v32;
            if (**(_BYTE **)__endptr) {
              sub_100040F60(v32);
            }
            if (v32 >= 0x80000000LL) {
              sub_100040F34(v32);
            }
            if (!v32) {
              LODWORD(v32) = time(0LL);
            }
            dword_100058814 = v32;
          }

          goto LABEL_168;
        case 161:
          qword_100058818 = (uint64_t)optarg;
          goto LABEL_168;
        case 162:
          free((void *)qword_1000588A0);
          qword_1000588A0 = (uint64_t)strdup(optarg);
          if (!qword_1000588A0) {
            sub_100040D1C();
          }
          goto LABEL_168;
        case 163:
          if (strchr(optarg, 47)) {
            errx(1, "--suffix cannot contain slashes: %s\n");
          }
          free((void *)qword_1000588A8);
          qword_1000588A8 = (uint64_t)strdup(optarg);
          if (!qword_1000588A8) {
            sub_100040D1C();
          }
          goto LABEL_168;
        case 164:
          dword_100058844 = 1;
          goto LABEL_168;
        case 166:
          ++dword_100058A34;
          goto LABEL_168;
        case 167:
          ++dword_100058A38;
          goto LABEL_168;
        case 168:
          qword_100058A18 = (uint64_t)optarg;
          goto LABEL_168;
        case 169:
          if (*optarg)
          {
            uint64_t v33 = strtoll(optarg, &v107, 0);
            if (*v107) {
              sub_100040FBC(v33);
            }
            int v34 = v33;
            if (v33 >= 0x1E)
            {
              if (dword_100058FD8)
              {
                int v100 = *__error();
                uint64_t v35 = (os_log_s *)qword_100058FE8;
                if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)__endptr = 136315650;
                  *(void *)&__endptr[4] = optarg;
                  __int16 v112 = 1024;
                  LODWORD(v113[0]) = 27;
                  WORD2(v113[0]) = 1024;
                  *(_DWORD *)((char *)v113 + 6) = 40;
                  _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "--protocol=%s: is not supported by this version of openrsync. min: %d, max: %d",  __endptr,  0x18u);
                }

                *__error() = v100;
              }

              sub_100021AB0( "--protocol=%s: is not supported by this version of openrsync. min: %d, max: %d",  optarg,  27,  40);
            }

            dword_100058808 = v34;
          }

          goto LABEL_168;
        case 170:
          qword_100058A08 = (uint64_t)optarg;
          goto LABEL_168;
        case 171:
          goto LABEL_140;
        case 172:
          int v103 = 1;
LABEL_140:
          qword_100058A10 = (uint64_t)optarg;
          goto LABEL_168;
        case 173:
          qword_1000589C0 = (uint64_t)optarg;
          goto LABEL_168;
        case 175:
LABEL_332:
          sub_100026468(0);
        case 177:
          dword_100058A40 = atoi(optarg);
          goto LABEL_168;
        case 178:
          if (*optarg)
          {
            *__error() = 0;
            uint64_t v36 = strtoll(optarg, (char **)__endptr, 0);
            if (**(_BYTE **)__endptr) {
              sub_100041064(v36);
            }
            qword_100058A50 = (int)v36;
          }

          goto LABEL_168;
        case 179:
          ++dword_1000588D8;
          goto LABEL_168;
        case 180:
          if (*optarg)
          {
            *__error() = 0;
            uint64_t v37 = strtoll(optarg, (char **)__endptr, 0);
            if (**(_BYTE **)__endptr) {
              sub_10004103C(v37);
            }
            dword_100058A2C = v37;
            if (!(_DWORD)v37) {
              dword_100058A28 = 0;
            }
          }

          goto LABEL_168;
        case 181:
          dword_100058A3C = 1;
          goto LABEL_168;
        default:
          sub_100026468(1);
      }
    }
  }

  if (dword_100058A48 >= 1) {
    dword_100058FDC = 0;
  }
  BOOL v39 = dword_100058A30 > 6 || ((1 << dword_100058A30) & 0x51) == 0;
  uint64_t v40 = &unk_100058800;
  if (v39) {
    sub_100040B00();
  }
  if (dword_100058828)
  {
    if (qword_100058830) {
      sub_100040D28(v8);
    }
    dword_10005882C = 1;
  }

  else
  {
    __int16 v44 = (char *)qword_100058830;
    if (!dword_10005882C || qword_100058830)
    {
      if (!qword_100058830) {
        goto LABEL_190;
      }
    }

    else
    {
      uint64_t v8 = (uint64_t)getenv("RSYNC_PARTIAL_DIR");
      if (!v8 || !*(_BYTE *)v8) {
        goto LABEL_190;
      }
      __int16 v44 = strdup((const char *)v8);
      qword_100058830 = (uint64_t)v44;
      if (!v44) {
        sub_100040D1C();
      }
    }

    if (!*v44 || !strcmp(v44, "."))
    {
      free(v44);
      qword_100058830 = 0LL;
    }

    else
    {
      int64_t v45 = strlen(v44) - 1;
      if (v45 >= 1)
      {
        unsigned int v46 = &v44[v45];
        int v47 = &v44[v45];
        do
        {
          int v48 = *--v47;
          if (v48 != 47) {
            break;
          }
          *unsigned int v46 = 0;
          unsigned int v46 = v47;
        }

        while (v47 > v44);
      }

      uint64_t v8 = sub_10002B150(v44, 1, 0);
      if ((_DWORD)v8 == -1) {
        errx(1, "syntax error in exclude: %s");
      }
    }
  }

LABEL_272:
        uint64_t v64 = "malloc hostspec";
        goto LABEL_273;
      }

      char v62 = (char)v81;
      qword_1000589F8 = (uint64_t)strdup(v80 + 1);
      if (!qword_1000589F8)
      {
        if (dword_100058FD8)
        {
          int v97 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_100040C7C();
          }
          *__error() = v97;
        }

        uint64_t v77 = "malloc hostspec path";
        goto LABEL_324;
      }
    }

LABEL_258:
    if (dword_100058FD8)
    {
      int v82 = *__error();
      uint64_t v83 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__endptr = 136315394;
        *(void *)&__endptr[4] = qword_1000589F0;
        __int16 v112 = 2080;
        v113[0] = qword_1000589F8;
        _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_INFO,  "remote file for filesfrom: '%s' '%s'\n",  __endptr,  0x16u);
      }

      *__error() = v82;
      char v62 = qword_1000589F0;
    }

    sub_100021744(1, "remote file for filesfrom: '%s' '%s'\n", v56, v57, v58, v59, v60, v61, v62);
    if (!(_DWORD)v106) {
      goto LABEL_276;
    }
    goto LABEL_277;
  }

  uint64_t v54 = strdup("");
  qword_1000589F0 = (uint64_t)v54;
  if (!v54)
  {
    if (dword_100058FD8)
    {
      int v78 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_270;
      }
      goto LABEL_271;
    }

    goto LABEL_272;
  }

  char v62 = (char)v54;
  qword_1000589F8 = (uint64_t)strdup(v53 + 1);
  if (qword_1000589F8) {
    goto LABEL_258;
  }
  if (dword_100058FD8)
  {
    int v63 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_100040C50();
    }
    *__error() = v63;
  }

  uint64_t v64 = "malloc path";
LABEL_273:
  sub_1000218D4(v64, v55, v56, v57, v58, v59, v60, v61, v99);
LABEL_274:
  unsigned int v42 = strdup((const char *)qword_1000589B0);
  qword_1000589F8 = (uint64_t)v42;
  if (!v42)
  {
    if (dword_100058FD8)
    {
      int v93 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040BF8();
      }
      *__error() = v93;
    }

    sub_1000218D4("strdup filesfrom no host", v84, v85, v86, v87, v88, v89, v90, v99);
    return 0LL;
  }

  qword_1000589F0 = 0LL;
  if (!(_DWORD)v106) {
LABEL_276:
  }
    dword_1000588BC = 1;
LABEL_277:
  if (!HIDWORD(v106)) {
    dword_1000588C0 = 1;
  }
  if ((_DWORD)v104) {
    dword_100058820 = 0;
  }
LABEL_281:
  if (dword_1000588BC && (_DWORD)v106)
  {
    if (dword_100058FD8)
    {
      int v91 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040BCC();
      }
      *__error() = v91;
    }

    sub_100021980("Cannot use --relative and --no-relative at the same time");
  }

  if (dword_1000588C0 && HIDWORD(v106))
  {
    if (dword_100058FD8)
    {
      int v92 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100040BA0();
      }
      *__error() = v92;
    }

    sub_100021980("Cannot use --dirs and --no-dirs at the same time");
  }

  if (dword_100058860 == 1) {
    dword_100058860 = 2;
  }
  if (qword_100058A10 && qword_100058A08) {
    sub_100040B3C((uint64_t)v42);
  }
  if (dword_100058824) {
    qword_100058A10 = 0LL;
  }
  else {
    dword_100058824 = v103 != 0;
  }
  if (!dword_100058804 && HIDWORD(v104))
  {
    return &unk_100058800;
  }

  return v40;
}

void sub_100026468(int a1)
{
  uint64_t v2 = &__stdoutp;
  if (a1) {
    uint64_t v2 = &__stderrp;
  }
  uint64_t v3 = *v2;
  uint64_t v4 = getprogname();
  fprintf( v3,  "usage: %s [-0468BCDEFHIKLOPRSTWVabcdghklnopqrtuvxyz] [-e program] [-f filter]\n \t[--8-bit-output] [--address=sourceaddr]\n \t[--append] [--backup-dir=dir] [--bwlimit=limit] [--cache | --no-cache]\n \t[--compare-dest=dir] [--contimeout] [--copy-dest=dir] [--copy-unsafe-links]\n \t[--del | --delete-after | --delete-before | --delete-during]\n \t[--delay-updates] [--dirs] [--no-dirs]\n \t[--exclude] [--exclude-from=file]\n \t[--extended-attributes]\n \t[--existing] [--force] [--ignore-errors]\n \t[--ignore-existing] [--ignore-non-existing] [--include]\n \t[--include-from=file] [--inplace] [--keep-dirlinks] [--link-dest=dir]\n \t[--max-delete=NUM] [--max-size=SIZE] [--min-size=SIZE]\n \t[--modify-window=sec] [--no-motd] [--numeric-ids]\n \t[--out-format=FMT] [--partial] [--password-file=pwfile] [--port=portnumber]\n \t[--progress] [--protocol] [--read-batch=file]\n \t[--remove-source-files] [--rsync-path=program] [--safe-links] [--size-only]\n \t[--sockopts=sockopts] [--specials] [--suffix] [--super] [--timeout=seconds]\n \t[--only-write-batch=file | --write-batch=file]\n \tsource ... directory\n",  v4);
  exit(a1);
}

void start(int a1, const char **a2)
{
  unsigned int v138 = -1;
  setprogname(*a2);
  sub_1000216C0((uint64_t)__stderrp);
  if (os_variant_has_internal_content("com.apple.rsync"))
  {
    dword_100058FD8 = 1;
  }

  else if (!dword_100058FD8)
  {
    goto LABEL_5;
  }

  qword_100058FE8 = (uint64_t)os_log_create("com.apple.rsync", "trace");
LABEL_5:
  setlocale(0, "");
  setlocale(2, "");
  setlocale(4, "");
  if (!sub_100024E80(a1, (char *const *)a2, 0LL, 0LL)
    || (uint64_t v4 = optind, v5 = (a1 - optind), !qword_100058A08) && !dword_100058804 && (int)v5 <= 1
    || (int)v5 < 1)
  {
    sub_100026468(1);
  }

  int v121 = &dword_100058800;
  char v6 = sub_100021D28(&v121, 0LL, 0);
  if ((v6 & 1) != 0) {
    DWORD2(v131) = 1;
  }
  if ((v6 & 2) != 0) {
    HIDWORD(v131) = 1;
  }
  uint64_t v7 = (uint64_t)&a2[v4];
  if (dword_100058FD8)
  {
    int v8 = *__error();
    int v9 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)stat buf = 67109632;
      LODWORD(v120) = getpid();
      WORD2(v120) = 1024;
      *(_DWORD *)((char *)&v120 + 6) = DWORD2(v131);
      WORD5(v120) = 1024;
      HIDWORD(v120) = HIDWORD(v131);
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Printing(%d): itemize %d late %d",  buf,  0x14u);
    }

    *__error() = v8;
  }

  char v10 = getpid();
  uint64_t v115 = DWORD2(v131);
  uint64_t v116 = HIDWORD(v131);
  sub_100021744(2, "Printing(%d): itemize %d late %d", v11, v12, v13, v14, v15, v16, v10);
  sub_1000320D4((uint64_t)off_1000586D8);
  if (dword_100058804)
  {
    if (dword_100058A00 < 0) {
      dword_100058A00 = 0;
    }
    int v18 = sub_100030CAC(off_1000586D8, &dword_100058800, v5, v7);
    exit(v18);
  }

  pid_t v17 = getpid();
  if (setpgid(0, v17) == -1) {
    err(14, "setpgid");
  }
  int v19 = calloc(1uLL, 0x38uLL);
  if (!v19) {
    goto LABEL_34;
  }
  uint64_t v20 = (uint64_t)v19;
  size_t v21 = v5 - 1;
  v19[3] = v21;
  if (v21)
  {
    uint64_t v22 = calloc(v21, 8uLL);
    *(void *)(v20 + 16) = v22;
    if (v22)
    {
      uint64_t v23 = 0LL;
      while (1)
      {
        __int16 v24 = strdup(*(const char **)(v7 + 8 * v23));
        *(void *)(*(void *)(v20 + 16) + 8 * v23) = v24;
        if (!v24) {
          break;
        }
        if (v21 == ++v23) {
          goto LABEL_33;
        }
      }
    }

LABEL_34:
    err(22, 0LL);
  }

  if (!qword_100058A08) {
    errx(1, "One argument without --read-batch not yet supported");
  }
LABEL_33:
  uint64_t v25 = strdup(*(const char **)(v7 + 8 * v21));
  *(void *)(v20 + 32) = v25;
  if (!v25) {
    goto LABEL_34;
  }
  uint64_t v26 = v25;
  if (qword_100058A08)
  {
    if (v25[strcspn(v25, ":/")] == 58) {
      errx(1, "rsync --read-batch destination must be local", v113);
    }
LABEL_108:
    sub_100032238((uint64_t)off_1000586D8, v20);
    if (qword_100058A08)
    {
      int v65 = sub_100009B28(off_1000586D8, (uint64_t)&dword_100058800, v20);
      exit(v65);
    }

    char v62 = qword_1000589F0;
    if (qword_1000589F0)
    {
      if (!*(void *)(v20 + 8))
      {
        if (dword_100058FD8)
        {
          int v63 = *__error();
          uint64_t v64 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)stat buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "Remote --files-from with a local transfer is not valid",  buf,  2u);
          }

          *__error() = v63;
        }

        sub_100021850("Remote --files-from with a local transfer is not valid");
        goto LABEL_116;
      }

      if (dword_100058FD8)
      {
        int v66 = *__error();
        char v67 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 136315138;
          *(void *)&__int128 v120 = qword_1000589F0;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "--files-from host '%s'", buf, 0xCu);
        }

        *__error() = v66;
        char v62 = qword_1000589F0;
      }

      sub_100021744(1, "--files-from host '%s'", v56, v57, v58, v59, v60, v61, v62);
      if (*(_BYTE *)qword_1000589F0)
      {
        if (strcmp((const char *)qword_1000589F0, *(const char **)(v20 + 8)))
        {
          if (dword_100058FD8)
          {
            int v83 = *__error();
            uint64_t v84 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)stat buf = 0;
              _os_log_error_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "Cannot have different hostnames for --files-from and paths.",  buf,  2u);
            }

            *__error() = v83;
          }

          sub_100021850("Cannot have different hostnames for --files-from and paths.");
LABEL_116:
          exit(2);
        }
      }

      else
      {
        if (dword_100058FD8)
        {
          int v74 = *__error();
          uint64_t v75 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)stat buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_INFO,  "Inheriting --files-from remote side",  buf,  2u);
          }

          *__error() = v74;
        }

        sub_100021744(1, "Inheriting --files-from remote side", v68, v69, v70, v71, v72, v73, v114);
      }
    }

    if (*(void *)(v20 + 8))
    {
      int v76 = dword_100058A00;
    }

    else
    {
      int v76 = dword_100058A00;
      if (!*(_DWORD *)(v20 + 44) && dword_100058A00 < 0)
      {
        int v77 = 1;
        goto LABEL_136;
      }
    }

    if ((v76 & 0x80000000) == 0)
    {
LABEL_137:
      if (*(_DWORD *)(v20 + 44) && !qword_1000588F8)
      {
        int v78 = sub_100032468((uint64_t)&dword_100058800, (int *)&v138, v20);
        if (!v78)
        {
          int v78 = sub_100033D58(off_1000586D8, (uint64_t)&dword_100058800, v138, v20);
          close(v138);
        }

        exit(v78);
      }

      if (socketpair(1, 1, 0, &v139) == -1) {
        err(14, "socketpair");
      }
      int v79 = v139;
      int v80 = fcntl(v139, 3, 0LL, v115, v116);
      if (fcntl(v79, 4, v80 | 4u) == -1 || (int v81 = v140, v82 = fcntl(v140, 3, 0LL), fcntl(v81, 4, v82 | 4u) == -1)) {
        err(14, "fcntl");
      }
      pid_t v85 = fork();
      if (v85)
      {
        pid_t v86 = v85;
        if (v85 == -1) {
          err(14, "fork");
        }
        sub_100032240((uint64_t)off_1000586D8, v85);
        close(v140);
        if (*(_DWORD *)(v20 + 44)) {
          int v101 = sub_100033D58(off_1000586D8, (uint64_t)&dword_100058800, v139, v20);
        }
        else {
          int v101 = sub_1000067A0(off_1000586D8, (uint64_t)&dword_100058800, v139, v20);
        }
        int v102 = v101;
        close(v139);
        sub_100032240((uint64_t)off_1000586D8, 0);
        if (!v102)
        {
          if ((buf[0] & 0x7F) == 0x7F)
          {
            int v102 = 21;
          }

          else if ((buf[0] & 0x7F) == 0x1F)
          {
            int v102 = 0;
          }

          else if ((buf[0] & 0x7F) != 0)
          {
            int v102 = 16;
          }

          else
          {
            int v102 = buf[1];
          }
        }

        free((void *)qword_1000589F0);
        free((void *)qword_1000589F8);
        exit(v102);
      }

      close(v139);
      __int128 v122 = 0u;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      __int128 v125 = 0u;
      __int128 v126 = 0u;
      __int128 v127 = 0u;
      __int128 v128 = 0u;
      __int128 v129 = 0u;
      __int128 v130 = 0u;
      __int128 v131 = 0u;
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      __int128 v134 = 0u;
      __int128 v135 = 0u;
      __int128 v136 = 0u;
      __int128 v137 = 0u;
      int v121 = &dword_100058800;
      DWORD1(v122) = dword_100058814;
      sub_10003225C(off_1000586D8, (uint64_t)&v121);
      sub_100032094((uint64_t)off_1000586D8);
      int v95 = (const char **)sub_1000134A0(&v121, v20, 0LL);
      if (*v95)
      {
        uint64_t v96 = 0LL;
        do
        {
          if (dword_100058FD8)
          {
            int v97 = *__error();
            int v98 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
            {
              char v99 = v95[v96];
              *(_DWORD *)stat buf = 67109378;
              LODWORD(v120) = v96;
              WORD2(v120) = 2080;
              *(void *)((char *)&v120 + 6) = v99;
              _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "exec[%d] = %s", buf, 0x12u);
            }

            *__error() = v97;
          }

          sub_100021744(1, "exec[%d] = %s", v89, v90, v91, v92, v93, v94, v96);
          int v100 = &v95[v96++];
        }

        while (v100[1]);
      }

      if (dup2(v140, 0) == -1 || dup2(v140, 1) == -1) {
        err(14, "dup2");
      }
      if (execvp(*v95, (char *const *)v95) == -1)
      {
        if (dword_100058FD8)
        {
          int v110 = *__error();
          unsigned int v111 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
          {
            __int16 v112 = *v95;
            *(_DWORD *)stat buf = 136315138;
            *(void *)&__int128 v120 = v112;
            _os_log_error_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "exec on '%s'", buf, 0xCu);
          }

          *__error() = v110;
        }

        sub_1000218D4("exec on '%s'", v103, v104, v105, v106, v107, v108, v109, (char)*v95);
      }

      _exit(14);
    }

    int v77 = 0;
LABEL_136:
    dword_100058A00 = v77;
    goto LABEL_137;
  }

  *(_DWORD *)(v20 + 40) = 0;
  if (v25[strcspn(v25, ":/")] == 58)
  {
    int v27 = strdup(v26);
    *(void *)(v20 + 8) = v27;
    if (!v27) {
      goto LABEL_34;
    }
  }

  else
  {
    int v27 = *(char **)(v20 + 8);
  }

  uint64_t v28 = **(const char ***)(v20 + 16);
  if (v28[strcspn(v28, ":/")] == 58)
  {
    if (v27) {
      errx(1, "both source and destination cannot be remote files", v113);
    }
    *(_DWORD *)(v20 + 40) = 1;
    int v27 = strdup(v28);
    *(void *)(v20 + 8) = v27;
    if (!v27) {
      goto LABEL_34;
    }
  }

  else if (!v27)
  {
    uint64_t v29 = 0LL;
    if (!*(_DWORD *)(v20 + 44)) {
      goto LABEL_48;
    }
    goto LABEL_80;
  }

  if (!strncasecmp(v27, "rsync://", 8uLL))
  {
    *(_DWORD *)(v20 + 44) = 1;
    uint64_t v32 = v27 + 8;
    uint64_t v33 = strchr(v27 + 8, 64);
    if (v33)
    {
      unsigned int v38 = v33;
      BOOL v39 = strndup(v27 + 8, v33 - v32);
      *(void *)uint64_t v20 = v39;
      if (!v39) {
        goto LABEL_34;
      }
      uint64_t v32 = v38 + 1;
      size_t v34 = strlen(v38 + 1);
    }

    else
    {
      size_t v34 = strlen(v27) - 8;
    }

    memmove(v27, v32, v34 + 1);
    uint64_t v40 = strchr(*(const char **)(v20 + 8), 47);
    if (!v40) {
      errx(1, "rsync protocol requires a module name", v113);
    }
    char *v40 = 0;
    unsigned int v43 = v40 + 1;
    *(void *)(v20 + 48) = v43;
    __int16 v44 = strchr(v43, 47);
    if (v44) {
      *__int16 v44 = 0;
    }
    int64_t v45 = strchr(*(const char **)(v20 + 8), 58);
    if (v45)
    {
      *int64_t v45 = 0;
      qword_100058900 = (uint64_t)(v45 + 1);
    }
  }

  else
  {
    uint64_t v35 = strchr(v27, 58);
    if (!v35) {
      __assert_rtn("fargs_parse", "main.c", 351, "cp != NULL");
    }
    char *v35 = 0;
    if (v35[1] == 58)
    {
      *(_DWORD *)(v20 + 44) = 1;
      uint64_t v36 = v35 + 2;
      *(void *)(v20 + 48) = v36;
      uint64_t v37 = strchr(v36, 47);
      if (v37) {
        *uint64_t v37 = 0;
      }
    }
  }

  size_t v46 = strlen(*(const char **)(v20 + 8));
  if (!v46) {
    errx(1, "empty remote host", v113);
  }
  int v27 = (char *)v46;
  if (!*(_DWORD *)(v20 + 44))
  {
    uint64_t v117 = *(void *)(v20 + 8);
    int v31 = *(_DWORD *)(v20 + 40);
    if (v31 == 1)
    {
      uint64_t v51 = *(void *)(v20 + 24);
      if (v51)
      {
        int v52 = *(const char ***)(v20 + 16);
        do
        {
          unsigned int v53 = *v52;
          if (v53[strcspn(*v52, ":/")] != 58 || sub_1000272B0(v53))
          {
            if (!sub_1000272B0(v53)) {
              errx(1, "local file in list of remote sources: %s");
            }
            errx(1, "remote daemon in list of remote sources: %s");
          }

          ++v52;
          --v51;
        }

        while (v51);
      }

      int v31 = 1;
LABEL_98:
      uint64_t v29 = v117;
      goto LABEL_99;
    }

    uint64_t v29 = *(void *)(v20 + 8);
    if (v31)
    {
LABEL_99:
      if (!v29) {
        goto LABEL_108;
      }
      if (v31 != 1)
      {
        if (!v31)
        {
          if (!v27) {
            __assert_rtn("fargs_parse", "main.c", 420, "hostlen > 0");
          }
          size_t v54 = strlen(*(const char **)(v20 + 32));
          memmove(*(void **)(v20 + 32), &v27[*(void *)(v20 + 32) + 1], v54 - (void)v27);
        }

        goto LABEL_108;
      }

      if (v27) {
        goto LABEL_105;
      }
      goto LABEL_197;
    }

LABEL_197:
    __assert_rtn("fargs_parse", "main.c", 429, "hostlen > 0");
  }

  uint64_t v118 = v29;
  int v49 = *(const char ***)(v20 + 16);
  do
  {
    int v50 = *v49;
    if (v50[strcspn(*v49, ":/")] == 58) {
LABEL_91:
    }
      errx(1, "remote file in list of local sources: %s");
    ++v49;
    --v48;
  }

  while (v48);
  int v47 = 0;
  uint64_t v29 = v118;
  goto LABEL_87;
}

BOOL sub_1000272B0(const char *a1)
{
  if (!strncasecmp(a1, "rsync://", 8uLL)) {
    return 1LL;
  }
  size_t v2 = strcspn(a1, ":/");
  return a1[v2] == 58 && a1[v2 + 1] == 58;
}

void *sub_10002731C(uint64_t a1, char *__s, size_t a3)
{
  size_t v6 = strlen(__s);
  if (*(_DWORD *)(a1 + 44))
  {
    if (!strncasecmp(__s, "rsync://", 8uLL))
    {
      char v10 = __s + 8;
      uint64_t v11 = strchr(__s + 8, 64);
      if (v11) {
        char v10 = v11 + 1;
      }
      uint64_t v12 = strchr(v10, 58);
      uint64_t v13 = v10;
      if (v12)
      {
        *uint64_t v12 = 0;
        uint64_t v13 = v12 + 1;
      }

      uint64_t v14 = strchr(v13 + 1, 47);
      if (v14) {
        uint64_t v15 = v14 + 1;
      }
      else {
        uint64_t v15 = &v13[strlen(v13) - 1];
      }
      if (!strncmp(v10, *(const char **)(a1 + 8), a3) && (!v10[a3] || v10[a3] == 47))
      {
        size_t v8 = strlen(v15) + 1;
        int v9 = __s;
        uint64_t v7 = (char *)v15;
        return memmove(v9, v7, v8);
      }
    }

    else
    {
      if (!strncmp(__s, "::", 2uLL))
      {
        uint64_t v7 = __s + 2;
        size_t v8 = v6 - 1;
        goto LABEL_21;
      }

      if (!strncmp(__s, *(const char **)(a1 + 8), a3) && (!__s[a3] || __s[a3] == 58))
      {
        uint64_t v7 = &__s[a3 + 2];
        size_t v8 = v6 + ~a3;
LABEL_21:
        int v9 = __s;
        return memmove(v9, v7, v8);
      }
    }

    goto LABEL_28;
  }

  if (*__s != 58)
  {
    if (!strncmp(__s, *(const char **)(a1 + 8), a3) && (!__s[a3] || __s[a3] == 58))
    {
      uint64_t v7 = &__s[a3 + 1];
      size_t v8 = v6 - a3;
      goto LABEL_21;
    }

void sub_1000274DC(uint64_t a1, const char *a2)
{
}

void sub_1000274E4()
{
}

char *sub_1000274F0(uint64_t a1, int a2)
{
  return sub_10001345C(a2);
}

void sub_1000274FC(uint64_t a1, const char *a2)
{
}

char *sub_100027504( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v16[1] = &a9;
  unint64_t v10 = *(unsigned int *)(a1 + 12);
  uint64_t v11 = *(char **)a1;
  if (*(void *)a1)
  {
    unsigned int v12 = (_DWORD)v10 << (*(_DWORD *)(a1 + 8) + 2 >= v10);
  }

  else
  {
    *(_DWORD *)(a1 + 8) = 0;
    unsigned int v12 = 32;
  }

  uint64_t result = sub_100007014(v11, v10, v12, 8uLL);
  *(void *)a1 = result;
  if (!result) {
    sub_100040AEC();
  }
  uint64_t v14 = v16[0];
  uint64_t v15 = *(unsigned int *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v15 + 1;
  *(_DWORD *)(a1 + 12) = v12;
  *(void *)&result[8 * v15] = v14;
  *(void *)(*(void *)a1 + 8LL * (v15 + 1)) = 0LL;
  return result;
}

uint64_t sub_1000275A8(uint64_t a1, unint64_t a2)
{
  else {
    return 0LL;
  }
}

uint64_t sub_1000275CC(uint64_t a1, int a2)
{
  if (fstat(a2, &v36) == -1)
  {
    if (dword_100058FD8)
    {
      int v18 = *__error();
      int v19 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_1000410A4(a1, v19, v20, v21, v22, v23, v24, v25);
      }
      *__error() = v18;
    }

    sub_1000218D4("%s: fstat", v3, v4, v5, v6, v7, v8, v9, a1);
    return 0LL;
  }

  if ((v36.st_mode & 7) != 0)
  {
    if (dword_100058FD8)
    {
      int v10 = *__error();
      uint64_t v11 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10004116C(a1, v11, v12, v13, v14, v15, v16, v17);
      }
      *__error() = v10;
    }

    sub_100021850("%s: strict mode violation (other permission bits set)");
    return 0LL;
  }

  uid_t v26 = geteuid();
  uint64_t result = 1LL;
  if (!v26 && v36.st_uid)
  {
    if (dword_100058FD8)
    {
      int v28 = *__error();
      uint64_t v29 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100041108(a1, v29, v30, v31, v32, v33, v34, v35);
      }
      *__error() = v28;
    }

    sub_100021850("%s: strict mode violation (root process, file not owned by root)");
    return 0LL;
  }

  return result;
}

uint64_t sub_100027750(char *__s, mode_t a2)
{
  for (uint64_t i = __s; ; *uint64_t i = 47)
  {
    uint64_t v5 = &i[strspn(i, "/")];
    uint64_t i = (char *)&v5[strcspn(v5, "/")];
    int v6 = *i;
    *uint64_t i = 0;
    if (mkdir(__s, a2))
    {
      int v7 = *__error();
      if (stat(__s, &v9) == -1) {
        goto LABEL_9;
      }
      if ((v9.st_mode & 0xF000) != 0x4000) {
        break;
      }
    }

    if (!v6) {
      return 0LL;
    }
  }

  int v7 = 20;
LABEL_9:
  *__error() = v7;
  *uint64_t i = 47;
  return 0xFFFFFFFFLL;
}

uint64_t sub_100027830(int a1, char *__s, mode_t a3)
{
  for (uint64_t i = __s; ; *uint64_t i = 47)
  {
    int v7 = &i[strspn(i, "/")];
    uint64_t i = (char *)&v7[strcspn(v7, "/")];
    int v8 = *i;
    *uint64_t i = 0;
    if (mkdirat(a1, __s, a3))
    {
      int v9 = *__error();
      if (fstatat(a1, __s, &v11, 0) == -1) {
        goto LABEL_9;
      }
      if ((v11.st_mode & 0xF000) != 0x4000) {
        break;
      }
    }

    if (!v8) {
      return 0LL;
    }
  }

  int v9 = 20;
LABEL_9:
  *__error() = v9;
  *uint64_t i = 47;
  return 0xFFFFFFFFLL;
}

uint64_t sub_100027920(int a1, char *a2)
{
  return sub_100027934(a1, a2, 1, 0LL, 0, 0);
}

uint64_t sub_100027934(int a1, char *__s, int a3, const char *a4, __int16 a5, dev_t a6)
{
  size_t v10 = strlen(__s);
  if (v10 <= 5) {
    goto LABEL_6;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = &__s[v10];
  do
  {
    uint64_t v13 = v11;
    uint64_t v14 = &v12[v11];
    if (&v12[v11] <= __s) {
      break;
    }
    --v11;
  }

  while (*(v14 - 1) == 88);
  if (-v13 >= 6)
  {
    int v18 = 0x7FFFFFFF;
    int v19 = a3 - 1;
    while (2)
    {
      uint64_t v20 = v14;
      do
      {
        arc4random_buf(__buf, 0x20uLL);
        if (v20 == v12) {
          break;
        }
        unint64_t v21 = 0LL;
        do
        {
          v20[v21] = aAbcdefghijklmn[__buf[v21] % 0x3Eu];
          uint64_t v22 = (uint64_t)&v20[v21 + 1];
          unint64_t v23 = v21 + 1;
          if (v21 > 0xE) {
            break;
          }
          ++v21;
        }

        while ((char *)v22 != v12);
        v20 += v23;
      }

      while ((char *)v22 != v12);
      switch(v19)
      {
        case 0:
          uint64_t result = openat(a1, __s, 2562, 384LL);
          if ((_DWORD)result == -1) {
            goto LABEL_30;
          }
          break;
        case 1:
          uint64_t result = mkdirat(a1, __s, 0x1C0u);
          if ((_DWORD)result) {
            goto LABEL_30;
          }
          break;
        case 2:
          uint64_t result = symlinkat(a4, a1, __s);
          if ((_DWORD)result) {
            goto LABEL_30;
          }
          break;
        case 3:
          uint64_t result = mkfifoat(a1, __s, 0x180u);
          if ((_DWORD)result) {
            goto LABEL_30;
          }
          break;
        case 4:
          if ((a5 & 0xBFFF) != 0x2000) {
            goto LABEL_6;
          }
          uint64_t result = mknodat(a1, __s, a5 | 0x180, a6);
          if ((_DWORD)result) {
            goto LABEL_30;
          }
          break;
        case 5:
          uint64_t result = sub_100027E0C((uint64_t)a4, (uint64_t)__s);
          if ((_DWORD)result)
          {
LABEL_30:
            if (*__error() != 17) {
              return 0xFFFFFFFFLL;
            }
            goto LABEL_31;
          }

          break;
        default:
LABEL_31:
          if (--v18) {
            continue;
          }
          uint64_t v15 = __error();
          int v16 = 17;
          goto LABEL_7;
      }

      break;
    }
  }

  else
  {
LABEL_6:
    uint64_t v15 = __error();
    int v16 = 22;
LABEL_7:
    *uint64_t v15 = v16;
    return 0xFFFFFFFFLL;
  }

  return result;
}

char *sub_100027B84(const char *a1, int a2, char *__s)
{
  else {
    return __s;
  }
}

char *sub_100027BC4(int a1, char *a2)
{
  else {
    return a2;
  }
}

char *sub_100027BFC(int a1, char *a2, __int16 a3, dev_t a4)
{
  else {
    return a2;
  }
}

char *sub_100027C34(const char *a1, char *a2)
{
  else {
    return a2;
  }
}

uint64_t sub_100027C70(char **a1, char *__s, int a3, int a4)
{
  if (!a4)
  {
    if (a3 && (uint64_t v25 = strrchr(__s, 47)) != 0LL)
    {
      uint64_t result = asprintf(a1, "%.*s/.%s.XXXXXXXXXX", (_DWORD)v25 - (_DWORD)__s, __s, &__s[(int)v25 - (int)__s + 1]);
      if ((_DWORD)result != -1) {
        return result;
      }
      if (!dword_100058FD8) {
        goto LABEL_20;
      }
      int v16 = *__error();
      uint64_t v17 = (os_log_s *)qword_100058FE8;
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
    }

    else
    {
      uint64_t result = asprintf(a1, ".%s.XXXXXXXXXX", __s);
      if ((_DWORD)result != -1) {
        return result;
      }
      if (!dword_100058FD8) {
        goto LABEL_20;
      }
      int v16 = *__error();
      uint64_t v17 = (os_log_s *)qword_100058FE8;
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
    }

    goto LABEL_18;
  }

  int v6 = strrchr(__s, 47);
  if (v6) {
    int v7 = v6 + 1;
  }
  else {
    int v7 = __s;
  }
  uint64_t result = asprintf(a1, ".%s.XXXXXXXXXX", v7);
  if ((_DWORD)result == -1)
  {
    if (!dword_100058FD8)
    {
LABEL_20:
      sub_1000218D4("asprintf", v9, v10, v11, v12, v13, v14, v15, v26);
      *a1 = 0LL;
      return 0xFFFFFFFFLL;
    }

    int v16 = *__error();
    uint64_t v17 = (os_log_s *)qword_100058FE8;
    if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
    {
LABEL_19:
      *__error() = v16;
      goto LABEL_20;
    }

uint64_t sub_100027E0C(uint64_t a1, uint64_t a2)
{
  __int128 v13 = 0u;
  memset(v14, 0, sizeof(v14));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  sockaddr v9 = (sockaddr)0;
  __int128 v10 = 0u;
  v9.int sa_family = 1;
  unint64_t v3 = __strlcpy_chk(v9.sa_data, a1, 104LL, 104LL);
  if (v3 >= 0x68
    || v9.sa_data[v3] != 47 && (unint64_t)__strlcat_chk(v9.sa_data, "/", 104LL, 104LL) >= 0x68
    || (unint64_t)__strlcat_chk(v9.sa_data, a2, 104LL, 104LL) >= 0x68)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

  uint64_t result = socket(1, 1, 0);
  if ((_DWORD)result != -1)
  {
    int v5 = result;
    int v6 = fcntl(result, 3, 0LL);
    uint64_t result = fcntl(v5, 4, v6 | 4u);
    if ((_DWORD)result != -1)
    {
      int v7 = fcntl(v5, 1, 0LL);
      uint64_t result = fcntl(v5, 2, v7 | 1u);
      if ((_DWORD)result != -1)
      {
        if (!bind(v5, &v9, 0x6Au))
        {
          close(v5);
          return 0LL;
        }

        int v8 = *__error();
        close(v5);
        *__error() = v8;
        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t sub_100027FB0(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 56);
  unint64_t v3 = *(void *)result - 1LL;
  unint64_t v4 = v3 + (*(_DWORD *)(result + 8) - 5);
  int v5 = (_BYTE *)(*(void *)(result + 24) - 1LL);
  int v6 = *(_DWORD *)(result + 32);
  int v7 = (_DWORD)v5 - (a2 - v6);
  int v8 = &v5[v6 - 257];
  int v9 = *(_DWORD *)(v2 + 52);
  unsigned int v10 = *(_DWORD *)(v2 + 56);
  unsigned int v11 = *(_DWORD *)(v2 + 60);
  uint64_t v12 = *(void *)(v2 + 64);
  unint64_t v13 = *(void *)(v2 + 72);
  unsigned int v14 = *(_DWORD *)(v2 + 80);
  uint64_t v15 = ~(-1 << *(_DWORD *)(v2 + 112));
  uint64_t v16 = *(void *)(v2 + 96);
  uint64_t v17 = *(void *)(v2 + 104);
  uint64_t v18 = ~(-1 << *(_DWORD *)(v2 + 116));
  uint64_t v19 = "invalid distance too far back";
  while (2)
  {
    if (v14 <= 0xE)
    {
      unsigned int v20 = *(unsigned __int8 *)(v3 + 2);
      v3 += 2LL;
      v14 += 16;
    }

    uint64_t v21 = (unsigned __int8 *)(v16 + 4 * (v13 & v15));
    int v22 = *v21;
    int v23 = v21[1];
    for (unsigned int i = *((unsigned __int16 *)v21 + 1); ; unsigned int i = *((unsigned __int16 *)v25 + 1))
    {
      v13 >>= v23;
      v14 -= v23;
      if (!v22)
      {
        *++int v5 = i;
        goto LABEL_10;
      }

      if ((v22 & 0x10) != 0) {
        break;
      }
      if ((v22 & 0x40) != 0)
      {
        if ((v22 & 0x20) != 0)
        {
          int v58 = 11;
        }

        else
        {
          uint64_t v19 = "invalid literal/length code";
LABEL_65:
          *(void *)(result + 48) = v19;
          int v58 = 27;
        }

        *(_DWORD *)uint64_t v2 = v58;
        goto LABEL_67;
      }

      uint64_t v25 = (unsigned __int8 *)(v16 + 4 * ((v13 & ~(-1 << v22)) + (unint64_t)i));
      int v22 = *v25;
      int v23 = v25[1];
    }

    unsigned int v26 = v22 & 0xF;
    if (v26)
    {
      if (v14 < v26)
      {
        unsigned int v27 = *(unsigned __int8 *)++v3;
        v13 += (unint64_t)v27 << v14;
        v14 += 8;
      }

      i += v13 & ~(-1 << v26);
      v13 >>= v26;
      unsigned int v28 = v14 - v26;
    }

    else
    {
      unsigned int v28 = v14;
    }

    if (v28 <= 0xE)
    {
      unsigned int v29 = *(unsigned __int8 *)(v3 + 2);
      v3 += 2LL;
      v28 += 16;
    }

    uint64_t v30 = (char *)(v17 + 4 * (v13 & v18));
    char v31 = *v30;
    int v32 = v30[1];
    for (unsigned int j = *((unsigned __int16 *)v30 + 1); ; unsigned int j = *((unsigned __int16 *)v34 + 1))
    {
      v13 >>= v32;
      v28 -= v32;
      if ((v31 & 0x10) != 0) {
        break;
      }
      if ((v31 & 0x40) != 0)
      {
        uint64_t v19 = "invalid distance code";
        unsigned int v14 = v28;
        goto LABEL_65;
      }

      uint64_t v34 = (char *)(v17 + 4 * ((v13 & ~(-1 << v31)) + (unint64_t)j));
      char v31 = *v34;
      int v32 = v34[1];
    }

    unsigned int v35 = v31 & 0xF;
    if (v28 >= v35)
    {
      unsigned int v36 = v28;
    }

    else
    {
      v13 += (unint64_t)*(unsigned __int8 *)(v3 + 1) << v28;
      unsigned int v36 = v28 + 8;
      if (v28 + 8 >= v35)
      {
        ++v3;
      }

      else
      {
        unsigned int v37 = *(unsigned __int8 *)(v3 + 2);
        v3 += 2LL;
        v13 += (unint64_t)v37 << v36;
        unsigned int v36 = v28 + 16;
      }
    }

    unsigned int v38 = (v13 & ~(-1 << v35)) + j;
    v13 >>= v35;
    unsigned int v14 = v36 - v35;
    unsigned int v39 = v38 - ((_DWORD)v5 - v7);
    if (v38 <= (int)v5 - v7)
    {
      uint64_t v46 = 0LL;
      uint64_t v47 = 0LL;
      uint64_t v48 = &v5[-v38];
      do
      {
        int v49 = &v5[v47];
        v49[1] = v48[v47 + 1];
        v49[2] = v48[v47 + 2];
        v49[3] = v48[v47 + 3];
        v47 += 3LL;
        v46 -= 3LL;
      }

      while (i + v46 > 2);
      int v50 = &v5[v47];
      if (i == (_DWORD)v47 || (v50[1] = v48[v47 + 1], ++v50, i - 1 == (_DWORD)v47))
      {
        int v5 = v50;
      }

      else
      {
        uint64_t v57 = &v5[v47];
        v57[2] = v48[v47 + 2];
        int v5 = v57 + 2;
      }

      goto LABEL_10;
    }

    if (v39 > v10) {
      goto LABEL_65;
    }
    if (!v11)
    {
      uint64_t v40 = v9 - v39;
      unsigned int v51 = i - v39;
      if (i > v39)
      {
        int v52 = (char *)(v12 + v40);
        do
        {
          char v53 = *v52++;
          *++int v5 = v53;
          --v39;
        }

        while (v39);
        goto LABEL_52;
      }

LABEL_53:
      __int16 v44 = (_BYTE *)(v12 - 1 + v40);
      goto LABEL_54;
    }

    if (v39 > v11)
    {
      uint64_t v40 = v11 + v9 - v39;
      unsigned int v41 = i - (v39 - v11);
      if (i > v39 - v11)
      {
        unsigned int v42 = (char *)(v12 + v40);
        do
        {
          char v43 = *v42++;
          *++int v5 = v43;
          --v39;
        }

        while (v11 != v39);
        unsigned int i = v41;
        __int16 v44 = (_BYTE *)(v12 - 1);
        if (v41 > v11)
        {
          uint64_t v45 = 0LL;
          do
          {
            v5[v45 + 1] = *(_BYTE *)(v12 + v45);
            ++v45;
          }

          while (v11 != (_DWORD)v45);
          unsigned int i = v41 - v11;
          v5 += v45;
          __int16 v44 = &v5[-v38];
        }

        goto LABEL_54;
      }

      goto LABEL_53;
    }

    uint64_t v40 = v11 - v39;
    unsigned int v51 = i - v39;
    if (i <= v39) {
      goto LABEL_53;
    }
    size_t v54 = (char *)(v12 + v40);
    do
    {
      char v55 = *v54++;
      *++int v5 = v55;
      --v39;
    }

    while (v39);
LABEL_52:
    __int16 v44 = &v5[-v38];
    unsigned int i = v51;
LABEL_54:
    if (i >= 3)
    {
      do
      {
        v5[1] = v44[1];
        v5[2] = v44[2];
        char v56 = v44[3];
        v44 += 3;
        v5[3] = v56;
        v5 += 3;
        i -= 3;
      }

      while (i > 2);
    }

    if (i)
    {
      v5[1] = v44[1];
      if (i == 1)
      {
        ++v5;
      }

      else
      {
        v5[2] = v44[2];
        v5 += 2;
      }
    }

LABEL_10:
    if (v3 < v4 && v5 < v8) {
      continue;
    }
    break;
  }

void *sub_100028474(uint64_t a1, int a2, int a3)
{
  return malloc((a3 * a2));
}

void sub_10002847C(int a1, void *a2)
{
}

uint64_t sub_100028484(uint64_t a1, int a2, int __fd, uint64_t *a4, char a5)
{
  if (!a2 && (a4[3] & 0xF000) == 0x8000 && *(_DWORD *)(*(void *)a1 + 572LL) && !*(_DWORD *)(*(void *)a1 + 60LL))
  {
    if (fstat(__fd, &v52) == -1)
    {
      uint64_t v10 = 1LL;
      if (*__error() == 2) {
        return v10;
      }
    }

    else
    {
      LODWORD(v10) = 1;
    }
  }

  else
  {
    LODWORD(v10) = 0;
  }

  unsigned int v11 = *(_DWORD **)a1;
  if (*(_DWORD *)(*(void *)a1 + 56LL) && ((a4[3] & 0xF000) != 0x4000 || !v11[32]))
  {
    uint64_t v12 = a4[6];
    __times.tv_nseCC_MD4_CTX c = -1LL;
    uint64_t v60 = v12;
    uint64_t v61 = 0LL;
    if (futimens(__fd, &__times) == -1)
    {
      if (dword_100058FD8)
      {
        int v38 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100041200();
        }
        *__error() = v38;
      }

      sub_1000218D4("%s: futimens", v13, v14, v15, v16, v17, v18, v19, a5);
      return 0LL;
    }

    sub_100021744(3, "%s: updated date", v14, v15, v16, v17, v18, v19, *a4);
    unsigned int v11 = *(_DWORD **)a1;
  }

  if ((v11[52] == 1 || (v20 = geteuid(), unsigned int v11 = *(_DWORD **)a1, !v20)) && v11[23] && v11[52] != 2) {
    uid_t v21 = *((_DWORD *)a4 + 7);
  }
  else {
    uid_t v21 = -1;
  }
  if (v11[22]) {
    gid_t v22 = *((_DWORD *)a4 + 8);
  }
  else {
    gid_t v22 = -1;
  }
  mode_t v23 = *((_WORD *)a4 + 12);
  if (v21 != -1 || v22 != -1)
  {
    if (fchown(__fd, v21, v22) == -1)
    {
      if (*__error() != 1)
      {
        if (dword_100058FD8)
        {
          int v49 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003EA2C();
          }
          *__error() = v49;
        }

        sub_1000218D4("%s: fchown", v39, v40, v41, v42, v43, v44, v45, a5);
        return 0LL;
      }

      if (!geteuid())
      {
        if (dword_100058FD8)
        {
          int v51 = *__error();
          uint64_t v46 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            uint64_t v47 = *a4;
            *(_DWORD *)stat buf = 136315650;
            uint64_t v54 = v47;
            __int16 v55 = 1024;
            uid_t v56 = v21;
            __int16 v57 = 1024;
            gid_t v58 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "%s: identity unknown or not available to user.group: %u.%u",  buf,  0x18u);
          }

          *__error() = v51;
        }

        sub_100021AB0("%s: identity unknown or not available to user.group: %u.%u", (const char *)*a4, v21, v22);
      }
    }

    else
    {
      sub_100021744(3, "%s: updated uid and/or gid", v24, v25, v26, v27, v28, v29, *a4);
    }
  }

  if (a2 || *(_DWORD *)(*(void *)a1 + 60LL))
  {
    if (fchmod(__fd, v23) != -1) {
      goto LABEL_27;
    }
    if (!dword_100058FD8) {
      goto LABEL_33;
    }
    int v37 = *__error();
    if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }

  if (!(_DWORD)v10 || ((v23 & 0x49) != 0) != ((v52.st_mode & 0x49) == 0)) {
    return 1LL;
  }
  int v48 = (v23 & 0x49) != 0 ? (v52.st_mode >> 2) & 0x49 | v52.st_mode : v52.st_mode & 0xFFB6;
  if (!v48) {
    return 1LL;
  }
  if (fchmod(__fd, v48) == -1)
  {
    if (!dword_100058FD8) {
      goto LABEL_33;
    }
    int v37 = *__error();
    if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
    {
LABEL_32:
      *__error() = v37;
LABEL_33:
      sub_1000218D4("%s: fchmod", v30, v31, v32, v33, v34, v35, v36, a5);
      return 0LL;
    }

uint64_t sub_100028914(uint64_t a1, int a2, int __fd, const char **a4, char *__path)
{
  if (a2)
  {
    uint64_t v10 = *(_DWORD **)a1;
    goto LABEL_6;
  }

  uint64_t v10 = *(_DWORD **)a1;
  if (((_WORD)a4[3] & 0xF000) != 0x8000 || !v10[143] || v10[15])
  {
LABEL_6:
    int v11 = 0;
    if (!v10[46]) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  int v11 = 1;
LABEL_7:
  if (fstatat(__fd, *a4, &v62, 32) == -1 && *__error() == 2) {
    return 1LL;
  }
LABEL_9:
  uint64_t v12 = *(_DWORD **)a1;
  if (*(_DWORD *)(*(void *)a1 + 56LL) && (((_WORD)a4[3] & 0xF000) != 0x4000 || !v12[32]))
  {
    uint64_t v13 = a4[6];
    __times.tv_nseCC_MD4_CTX c = -1LL;
    uint64_t v70 = v13;
    uint64_t v71 = 0LL;
    if (utimensat(__fd, __path, &__times, 32) == -1)
    {
      if (dword_100058FD8)
      {
        int v47 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_1000413BC();
        }
        *__error() = v47;
      }

      sub_1000218D4("%s: utimensat (2)", v14, v15, v16, v17, v18, v19, v20, (char)__path);
      return 0LL;
    }

    sub_100021744(3, "%s: updated date", v15, v16, v17, v18, v19, v20, (char)*a4);
    uint64_t v12 = *(_DWORD **)a1;
  }

  if ((v12[52] == 1 || (v21 = geteuid(), uint64_t v12 = *(_DWORD **)a1, !v21)) && v12[23] && v12[52] != 2) {
    uid_t v22 = *((_DWORD *)a4 + 7);
  }
  else {
    uid_t v22 = -1;
  }
  if (v12[22]) {
    gid_t v23 = *((_DWORD *)a4 + 8);
  }
  else {
    gid_t v23 = -1;
  }
  mode_t v24 = *((_WORD *)a4 + 12);
  if (v22 != -1 || v23 != -1)
  {
    if (fchownat(__fd, __path, v22, v23, 32) == -1)
    {
      if (*__error() != 1)
      {
        if (dword_100058FD8)
        {
          int v60 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10004135C();
          }
          *__error() = v60;
        }

        sub_1000218D4("%s: fchownat", v48, v49, v50, v51, v52, v53, v54, (char)__path);
        return 0LL;
      }

      if (!geteuid())
      {
        if (dword_100058FD8)
        {
          int v61 = *__error();
          __int16 v55 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
          {
            uid_t v56 = *a4;
            *(_DWORD *)stat buf = 136315650;
            uint64_t v64 = v56;
            __int16 v65 = 1024;
            uid_t v66 = v22;
            __int16 v67 = 1024;
            gid_t v68 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_INFO,  "%s: identity unknown or not available to user.group: %u.%u",  buf,  0x18u);
          }

          *__error() = v61;
        }

        sub_100021AB0("%s: identity unknown or not available to user.group: %u.%u", *a4, v22, v23);
      }
    }

    else
    {
      sub_100021744(3, "%s: updated uid and/or gid", v25, v26, v27, v28, v29, v30, (char)*a4);
    }
  }

  if (!a2 && !*(_DWORD *)(*(void *)a1 + 60LL))
  {
    if (!v11 || ((v24 & 0x49) != 0) != ((v62.st_mode & 0x49) == 0)) {
      return 1LL;
    }
    int v57 = (v24 & 0x49) != 0 ? (v62.st_mode >> 2) & 0x49 | v62.st_mode : v62.st_mode & 0xFFB6;
    if (!v57) {
      return 1LL;
    }
    if (fchmodat(__fd, __path, v57, 32) == -1)
    {
      if (dword_100058FD8)
      {
        int v59 = *__error();
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
          sub_100041260();
        }
        *__error() = v59;
      }

      sub_1000218D4("%s: fchmodat", v58, v31, v32, v33, v34, v35, v36, (char)__path);
      return 0LL;
    }

    goto LABEL_30;
  }

  if (fchmodat(__fd, __path, v24, 32) != -1 || ((_WORD)a4[3] & 0xF000) == 0xA000 && *__error() == 102)
  {
LABEL_30:
    sub_100021744(3, "%s: updated permissions", v31, v32, v33, v34, v35, v36, (char)*a4);
    return 1LL;
  }

  if (dword_100058FD8)
  {
    int v38 = *__error();
    uint64_t v39 = (os_log_s *)qword_100058FE8;
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_1000412C0((uint64_t)__path, v39);
    }
    *__error() = v38;
  }

  __error();
  sub_1000218D4("%s: fchmodat (1) %d", v40, v41, v42, v43, v44, v45, v46, (char)__path);
  return 0LL;
}

uint64_t sub_100028E10(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = a2[2];
  if ((int)v2 >= 1)
  {
    uint64_t result = 0LL;
    int v5 = 0;
    int v6 = (uint64_t *)(*(void *)a2 + 16LL);
    do
    {
      if (*(void *)(a1 + 72) == *(v6 - 1) && *(void *)(a1 + 64) == *(v6 - 2))
      {
        if (v5) {
          return result;
        }
        uint64_t result = *v6;
        if (*v6 == a1) {
          return 0LL;
        }
        int v5 = 1;
      }

      v6 += 3;
      --v2;
    }

    while (v2);
  }

  return 0LL;
}

uint64_t sub_100028E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  int v5 = a5;
  int v215 = 0LL;
  uint64_t v216 = 0LL;
  size_t v212 = 0LL;
  unint64_t v213 = 0LL;
  else {
    int v10 = 2;
  }
  v217[0] = 0LL;
  v217[1] = 0LL;
  LODWORD(v217[0]) = *(_DWORD *)(*(void *)a1 + 12LL);
  *(void *)(a1 + 200) = v217;
  BOOL v11 = stat(a5, &v210) == -1 && *__error() == 2;
  uint64_t v12 = *(void *)a1;
  if (*(_DWORD *)(*(void *)a1 + 4LL)
    || !*(void *)(v12 + 520)
    && (sub_10002B2F0((_DWORD *)a1, a4), uint64_t v12 = *(void *)a1, *(_DWORD *)(*(void *)a1 + 4LL)))
  {
    if (!*(_DWORD *)(v12 + 96)
      || *(_DWORD *)(v12 + 100) && *(int *)(a1 + 260) < 29
      || (sub_10002B5D0(a1, a3), uint64_t v12 = *(void *)a1, *(_DWORD *)(*(void *)a1 + 4LL)))
    {
      if (*(void *)(v12 + 432))
      {
        sub_100019220(a1);
        uint64_t __buf = 0LL;
        if (*(void *)(a1 + 176))
        {
          unint64_t v13 = 0LL;
          while (1)
          {
            uint64_t v14 = *(const char **)(*(void *)(a1 + 168) + 8 * v13);
            size_t v15 = strlen(v14);
            if (v14[v15 - 1] == 10)
            {
              v14[v15 - 1] = 0;
              uint64_t v14 = *(const char **)(*(void *)(a1 + 168) + 8 * __buf);
              --v15;
            }

            if (write(a4, v14, v15 + 1) < 0) {
              break;
            }
            unint64_t v13 = __buf + 1;
            uint64_t __buf = v13;
            if (v13 >= *(void *)(a1 + 176)) {
              goto LABEL_19;
            }
          }

          if (dword_100058FD8)
          {
            int v53 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_1000416C4();
            }
            *__error() = v53;
          }

          mode_t v24 = "write files-from remote file";
          goto LABEL_67;
        }

LABEL_19:
        uint64_t __buf = 0LL;
        if (write(a4, &__buf, 1uLL) < 0)
        {
          if (dword_100058FD8)
          {
            int v23 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_100041698();
            }
            *__error() = v23;
          }

          mode_t v24 = "write files-from remote file terminator";
LABEL_67:
          sub_1000218D4(v24, v16, v17, v18, v19, v20, v21, v22, v197);
          return 0LL;
        }
      }
    }
  }

  uint64_t v25 = *(void *)(a1 + 24);
  if (!sub_100015870(a1, a3, a4, &v216, &v213))
  {
    if (dword_100058FD8)
    {
      int v45 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_10004141C();
      }
      *__error() = v45;
    }

    sub_100021980("flist_recv");
    goto LABEL_57;
  }

  uint64_t v26 = (char *)sub_100006FD4(0LL, v213, 0x18uLL);
  if (!v26)
  {
    if (dword_100058FD8)
    {
      int v46 = *__error();
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        sub_100041448();
      }
      *__error() = v46;
    }

    sub_100021980("reallocarray receiver");
LABEL_57:
    uint64_t v27 = 0LL;
    goto LABEL_58;
  }

  uint64_t v27 = v26;
  unint64_t v28 = v213;
  *(void *)(a1 + 64) = v213;
  *(void *)(a1 + 104) = *(void *)(a1 + 24) - v25;
  int v29 = 0;
  if (v28)
  {
    uint64_t v30 = v216;
    do
    {
      if (v30[4] != 0)
      {
        uint64_t v31 = &v26[24 * v29];
        *(_OWORD *)uint64_t v31 = v30[4];
        ++v29;
        *((void *)v31 + 2) = v30;
      }

      uint64_t v30 = (__int128 *)((char *)v30 + 152);
      --v28;
    }

    while (v28);
  }

  qsort(v26, v29, 0x18uLL, (int (__cdecl *)(const void *, const void *))sub_10002A4D0);
  int v209 = v29;
  int v208 = v27;
  if (sub_100020708(a1, a3, &v211))
  {
    char v38 = v211;
    if (v211)
    {
      if (dword_100058FD8)
      {
        int v39 = *__error();
        uint64_t v40 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 67109120;
          LODWORD(v225) = v211;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Got ioerror=%d", buf, 8u);
        }

        *__error() = v39;
        char v38 = v211;
      }

      sub_100021744(1, "Got ioerror=%d", v32, v33, v34, v35, v36, v37, v38);
      ++*(void *)(a1 + 240);
    }

    char v41 = v213;
    int v42 = *(_DWORD *)(*(void *)a1 + 4LL);
    if (v213)
    {
      if (!v42)
      {
        if (dword_100058FD8)
        {
          int v43 = *__error();
          uint64_t v44 = (os_log_s *)qword_100058FE8;
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)stat buf = 134217984;
            unint64_t v225 = v213;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Transfer starting: %zu files",  buf,  0xCu);
          }

          *__error() = v43;
          char v41 = v213;
        }

        sub_100021744(0, "Transfer starting: %zu files", v32, v33, v34, v35, v36, v37, v41);
      }
    }

    else if (!v42)
    {
      if (dword_100058FD8)
      {
        int v136 = *__error();
        __int128 v137 = (os_log_s *)qword_100058FE8;
        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v137,  OS_LOG_TYPE_INFO,  "receiver has empty file list: exiting",  buf,  2u);
        }

        *__error() = v136;
      }

      sub_100021AB0("receiver has empty file list: exiting");
      goto LABEL_165;
    }

    if (dword_100058FD8)
    {
      int v55 = *__error();
      uid_t v56 = (os_log_s *)qword_100058FE8;
      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 136315138;
        unint64_t v225 = (unint64_t)v5;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s: receiver destination", buf, 0xCu);
      }

      *__error() = v55;
    }

    sub_100021744(1, "%s: receiver destination", v32, v33, v34, v35, v36, v37, (char)v5);
    uint64_t v57 = *(void *)a1;
    if (*(_DWORD *)(*(void *)a1 + 36LL) || !v213)
    {
      uint64_t v207 = 0LL;
LABEL_92:
      mode_t v61 = umask(0);
      int v52 = open(v5, 0x100000, 0LL);
      uint64_t v69 = *(void *)a1;
      if (v52 == -1)
      {
        int v86 = *(_DWORD *)(v69 + 36);
        if (!v86 && v213)
        {
          if (dword_100058FD8)
          {
            int v87 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10003DD98();
            }
            *__error() = v87;
          }

          sub_1000218D4("%s: open", v62, v63, v64, v65, v66, v67, v68, (char)v5);
          int v47 = 0LL;
          uint64_t v48 = 0LL;
          uint64_t v49 = 0LL;
          int v51 = -1;
          goto LABEL_108;
        }

        if (!v86)
        {
          if (dword_100058FD8)
          {
            int v205 = v10;
            int v134 = *__error();
            __int128 v135 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)stat buf = 136315138;
              unint64_t v225 = (unint64_t)v5;
              _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_INFO, "%s: open", buf, 0xCu);
            }

            *__error() = v134;
            int v10 = v205;
          }

          sub_100021B34(0, "%s: open", v63, v64, v65, v66, v67, v68, (char)v5);
          uint64_t v69 = *(void *)a1;
        }
      }

      uint64_t v70 = *(const char **)(v69 + 544);
      if (v70)
      {
        int v51 = open(v70, 0x100000, 0LL);
        uint64_t v69 = *(void *)a1;
        if (v52 == -1 && !*(_DWORD *)(v69 + 36))
        {
          if (dword_100058FD8)
          {
            int v78 = *__error();
            int v79 = (os_log_s *)qword_100058FE8;
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_10004162C(a1, v79, v80, v81, v82, v83, v84, v85);
            }
            *__error() = v78;
            uint64_t v69 = *(void *)a1;
          }

          sub_1000218D4("%s: open", v71, v72, v73, v74, v75, v76, v77, *(void *)(v69 + 544));
          int v47 = 0LL;
          uint64_t v48 = 0LL;
          uint64_t v49 = 0LL;
LABEL_108:
          int v52 = -1;
LABEL_195:
          uint64_t v50 = v207;
          goto LABEL_196;
        }
      }

      else
      {
        int v51 = -1;
      }

      if (*(_DWORD *)(v69 + 96) != 2 || v52 == -1 || !*(_DWORD *)(v69 + 32)) {
        goto LABEL_115;
      }
      if (!sub_100017D88((int *)a1, v5, (void **)&v215, &v212, (uint64_t)v216, v213))
      {
        if (dword_100058FD8)
        {
          int v141 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_100041474();
          }
          *__error() = v141;
        }

        sub_100021980("flist_gen_dels");
        goto LABEL_192;
      }

      if (!sub_100018A20((void *)a1, v52, (uint64_t)v215, v212, v88, v89, v90, v91))
      {
        if (dword_100058FD8)
        {
          int v142 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_1000414A0();
          }
          *__error() = v142;
        }

        sub_100021980("flist_del");
      }

      else
      {
LABEL_115:
        *(_DWORD *)stat buf = a3;
        HIDWORD(v225) = -1;
        int v228 = -1;
        int v231 = a4;
        LOWORD(v225) = 1;
        __int16 v226 = 1;
        __int16 v229 = 1;
        __int16 v232 = 4;
        uint64_t v92 = (void **)sub_100035544(v5, v52, v51, a4, 2LL, (uint64_t)v216, v213, v61);
        if (v92)
        {
          int v47 = v92;
          int v204 = v10;
          uint64_t v93 = (void **)sub_10000DCEC(a1, a3, (uint64_t)v216, v213, v52, v51);
          if (v93)
          {
            uint64_t v48 = v93;
            sub_100032264(a2, (uint64_t)v93);
            if (dword_100058FD8)
            {
              int v206 = *__error();
              log = (os_log_s *)qword_100058FE8;
              if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int v218 = 136315138;
                uint64_t v219 = v5;
                _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: ready for phase 1 data",  v218,  0xCu);
              }

              *__error() = v206;
            }

            sub_100021744(1, "%s: ready for phase 1 data", v94, v95, v96, v97, v98, v99, (char)v5);
            int loga = 0;
            while (2)
            {
              int v100 = poll((pollfd *)buf, 4u, dword_100058FF0);
              if (v100 == -1)
              {
                if (dword_100058FD8)
                {
                  int v170 = *__error();
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                    sub_10004046C();
                  }
                  *__error() = v170;
                }

                sub_1000218D4("poll", v101, v102, v103, v104, v105, v106, v107, v199);
              }

              else if (v100)
              {
                uint64_t v108 = 0LL;
                uint64_t v109 = (__int16 *)&v225 + 1;
                do
                {
                  __int16 v111 = *v109;
                  v109 += 4;
                  char v110 = v111;
                  if ((v111 & 0x28) != 0)
                  {
                    uint64_t __buf = v108;
                    if (dword_100058FD8)
                    {
                      int v139 = *__error();
                      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                        sub_100040440();
                      }
                      *__error() = v139;
                    }

                    sub_100021850("poll: bad fd");
                    goto LABEL_194;
                  }

                  if ((v110 & 0x10) != 0)
                  {
                    uint64_t __buf = v108;
                    if (dword_100058FD8)
                    {
                      int v140 = *__error();
                      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                        sub_100041600();
                      }
                      *__error() = v140;
                    }

                    sub_100021850("poll: hangup");
                    goto LABEL_194;
                  }

                  ++v108;
                }

                while (v108 != 4);
                uint64_t __buf = 4LL;
                if (*(_DWORD *)(a1 + 128) && (v225 & 0x10000) != 0)
                {
                  if (!sub_10001EE0C((void *)a1, a3))
                  {
                    if (dword_100058FD8)
                    {
                      int v177 = *__error();
                      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                        sub_100040618();
                      }
                      *__error() = v177;
                    }

                    sub_100021980("io_read_flush");
                    goto LABEL_194;
                  }

                  if (!*(void *)(a1 + 136)) {
                    WORD1(v225) &= ~1u;
                  }
                }

                if (((v227 & 1) != 0 || (v233 & 4) != 0)
                  && (sub_100035888((uint64_t)v47, (char *)&v225 + 4, a1, &v231, (unsigned int *)&v208, v105, v106, v107) & 0x80000000) != 0)
                {
                  if (dword_100058FD8)
                  {
                    int v174 = *__error();
                    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                      sub_1000415D4();
                    }
                    *__error() = v174;
                  }

                  sub_100021980("rsync_uploader");
                }

                else
                {
                  if ((v225 & 0x10000) == 0 && (v230 & 1) == 0) {
                    continue;
                  }
                  int v112 = sub_10000E6C4((uint64_t)v48, (void *)a1, &v228, v213, (unsigned int *)&v208);
                  if (v112 < 0)
                  {
                    if (dword_100058FD8)
                    {
                      int v175 = *__error();
                      if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                        sub_100041524();
                      }
                      *__error() = v175;
                    }

                    sub_100021980("rsync_downloader");
                  }

                  else
                  {
                    if (v112) {
                      continue;
                    }
                    if (*(int *)(a1 + 260) < 29 || loga == 2)
                    {
                      sub_10000E2D8((void **)a1, v113, v114, v115, v116, v117, v118, v119);
                      free(*(void **)(a1 + 192));
                      *(void *)(a1 + 192) = 0LL;
                    }

                    sub_10003578C((uint64_t)v47, a1, a4);
                    if (loga != v204)
                    {
                      if (dword_100058FD8)
                      {
                        int v201 = *__error();
                        int v200 = (os_log_s *)qword_100058FE8;
                        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
                        {
                          uint64_t v126 = sub_10000DEC0((uint64_t)v48);
                          *(_DWORD *)int v218 = 136315650;
                          uint64_t v219 = v5;
                          __int16 v220 = 1024;
                          int v221 = loga + 2;
                          __int16 v222 = 2048;
                          uint64_t v223 = v126;
                          _os_log_impl( (void *)&_mh_execute_header,  v200,  OS_LOG_TYPE_INFO,  "%s: receiver ready for phase %d data (%zu to redo)",  v218,  0x1Cu);
                        }

                        *__error() = v201;
                      }

                      sub_10000DEC0((uint64_t)v48);
                      sub_100021744( 1,  "%s: receiver ready for phase %d data (%zu to redo)",  v127,  v128,  v129,  v130,  v131,  v132,  (char)v5);
                      **(_DWORD **)(a1 + 200) = 0;
                      sub_10003570C((uint64_t)v47);
                      int v231 = a4;
                      ++loga;
                      continue;
                    }

                    int v178 = *(_DWORD *)(*(void *)a1 + 96LL);
                    if (v178 == 4)
                    {
                      if (!sub_100035500((uint64_t)v47, (void *)a1))
                      {
                        if (dword_100058FD8)
                        {
                          int v194 = *__error();
                          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                            sub_1000415A8();
                          }
                          *__error() = v194;
                        }

                        sub_100021980("upload_del");
                        goto LABEL_194;
                      }
                    }

                    else if (v178 == 5 && v52 != -1 && *(_DWORD *)(*(void *)a1 + 32LL))
                    {
                      if (!sub_100017D88((int *)a1, v5, (void **)&v215, &v212, (uint64_t)v216, v213))
                      {
                        if (dword_100058FD8)
                        {
                          int v195 = *__error();
                          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                            sub_100041474();
                          }
                          *__error() = v195;
                        }

                        sub_100021980("flist_gen_dels");
                        goto LABEL_194;
                      }

                      if (!sub_100018A20((void *)a1, v52, (uint64_t)v215, v212, v179, v180, v181, v182))
                      {
                        if (dword_100058FD8)
                        {
                          int v183 = *__error();
                          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                            sub_1000414A0();
                          }
                          *__error() = v183;
                        }

                        sub_100021980("flist_del");
                        goto LABEL_194;
                      }
                    }

                    if (sub_100038AF4((uint64_t)v47, a1, v120, v121, v122, v123, v124, v125))
                    {
                      if (sub_100031DA8(a1, a3))
                      {
                        if (*(void *)(*(void *)a1 + 520LL) || sub_10001FFB4(a1, a4, -1))
                        {
                          if (dword_100058FD8)
                          {
                            int v190 = *__error();
                            uint64_t v191 = (os_log_s *)qword_100058FE8;
                            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_INFO))
                            {
                              *(_WORD *)int v218 = 0;
                              _os_log_impl( (void *)&_mh_execute_header,  v191,  OS_LOG_TYPE_INFO,  "receiver finished updating",  v218,  2u);
                            }

                            *__error() = v190;
                          }

                          uint64_t v49 = 1LL;
                          sub_100021744(1, "receiver finished updating", v184, v185, v186, v187, v188, v189, v199);
                          goto LABEL_195;
                        }

                        if (dword_100058FD8)
                        {
                          int v196 = *__error();
                          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                            sub_10003C7BC();
                          }
                          *__error() = v196;
                        }

                        sub_100021980("io_write_int");
                      }

                      else
                      {
                        if (dword_100058FD8)
                        {
                          int v193 = *__error();
                          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                            sub_10004157C();
                          }
                          *__error() = v193;
                        }

                        sub_100021980("sess_stats_recv");
                      }
                    }

                    else
                    {
                      if (dword_100058FD8)
                      {
                        int v192 = *__error();
                        if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                          sub_100041550();
                        }
                        *__error() = v192;
                      }

                      sub_100021980("rsync_uploader_tail");
                    }
                  }
                }
              }

              else
              {
                if (dword_100058FD8)
                {
                  int v171 = *__error();
                  if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
                    sub_100040498();
                  }
                  *__error() = v171;
                }

                sub_100021850("poll: timeout");
              }

              goto LABEL_194;
            }
          }

          if (dword_100058FD8)
          {
            int v138 = *__error();
            if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
              sub_1000414F8();
            }
            *__error() = v138;
          }

          sub_100021980("download_alloc");
LABEL_193:
          uint64_t v48 = 0LL;
LABEL_194:
          uint64_t v49 = 0LL;
          goto LABEL_195;
        }

        if (dword_100058FD8)
        {
          int v133 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_1000414CC();
          }
          *__error() = v133;
        }

        sub_100021980("upload_alloc");
      }

LABEL_192:
      int v47 = 0LL;
      goto LABEL_193;
    }

    if (v213 > 1
      || *(_DWORD *)(v57 + 188) && strchr(*(const char **)v216, 47)
      || v5[strlen(v5) - 1] == 47
      || *(void *)(v57 + 432)
      || (uint64_t v58 = (void **)v216, (*((_WORD *)v216 + 12) & 0xF000) == 0x4000)
      || !v11 && (v210.st_mode & 0xF000) == 0x4000)
    {
      int v59 = strdup(v5);
      if (!v59) {
        sub_100040AEC();
      }
      int v60 = v59;
      if ((sub_100027750(v59, 0x1EDu) & 0x80000000) != 0) {
        err(11, "%s: mkpath", v60);
      }
      free(v60);
      uint64_t v207 = 0LL;
      goto LABEL_92;
    }

    uint64_t v151 = strrchr(v5, 47);
    if (v151)
    {
      uint64_t v152 = v151 + 1;
      int v153 = strndup(v5, v151 + 1 - v5);
      if (v153)
      {
        uint64_t v207 = v153;
        size_t v161 = strdup(v152);
        if (v161)
        {
          uint64_t v169 = v161;
          int v5 = v207;
LABEL_218:
          free(*v58);
          *(void *)uint64_t v216 = v169;
          *((void *)v216 + 2) = v169;
          goto LABEL_92;
        }

        if (dword_100058FD8)
        {
          int v176 = *__error();
          if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
            sub_10003CD2C();
          }
          *__error() = v176;
        }

        sub_1000218D4("strdup", v162, v163, v164, v165, v166, v167, v168, v198);
        free(v207);
        uint64_t v50 = v207;
        int v47 = 0LL;
        uint64_t v48 = 0LL;
        goto LABEL_166;
      }

      if (!dword_100058FD8) {
        goto LABEL_241;
      }
      int v173 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_240;
      }
    }

    else
    {
      uint64_t v172 = strdup(v5);
      if (v172)
      {
        uint64_t v169 = v172;
        uint64_t v207 = 0LL;
        int v5 = ".";
        goto LABEL_218;
      }

      if (!dword_100058FD8) {
        goto LABEL_241;
      }
      int v173 = *__error();
      if (!os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR))
      {
LABEL_240:
        *__error() = v173;
LABEL_241:
        sub_1000218D4("strdup", v154, v155, v156, v157, v158, v159, v160, v198);
LABEL_165:
        int v47 = 0LL;
        uint64_t v48 = 0LL;
        uint64_t v50 = 0LL;
LABEL_166:
        uint64_t v49 = 1LL;
        goto LABEL_59;
      }
    }

    sub_10003CD2C();
    goto LABEL_240;
  }

  if (dword_100058FD8)
  {
    int v54 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100058FE8, OS_LOG_TYPE_ERROR)) {
      sub_10003C7E8();
    }
    *__error() = v54;
  }

  sub_100021980("io_read_int");
LABEL_58:
  int v47 = 0LL;
  uint64_t v48 = 0LL;
  uint64_t v49 = 0LL;
  uint64_t v50 = 0LL;
LABEL_59:
  int v51 = -1;
  int v52 = -1;
LABEL_196:
  free(v50);
  sub_10000E2D8((void **)a1, v143, v144, v145, v146, v147, v148, v149);
  free(*(void **)(a1 + 192));
  *(void *)(a1 + 192) = 0LL;
  free(v27);
  sub_10003574C(v47);
  sub_100032028(a2);
  sub_10000DEC8(a1, v48);
  sub_100032264(a2, 0LL);
  sub_100032094(a2);
  if (v52 != -1) {
    close(v52);
  }
  if (v51 != -1) {
    close(v51);
  }
  sub_1000148EC((char *)v216, v213);
  sub_1000148EC(v215, v212);
  return v49;
}

uint64_t sub_10002A4D0(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  if (v2 != v3) {
    goto LABEL_6;
  }
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  if (*a1 > *a2) {
    return 1LL;
  }
LABEL_6:
  BOOL v5 = v2 < v3;
  BOOL v6 = v2 > v3;
  if (v5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v6;
  }
}

BOOL sub_10002A518(unsigned __int8 *a1, char *__s, int a3)
{
  int v5 = *a1;
  int v6 = *__s;
  if (!*a1) {
    return v6 && (!a3 || v6 != 47);
  }
  int v7 = __s;
  int v8 = a1;
  int v9 = 0LL;
  while (1)
  {
    if (!v6) {
      return 1LL;
    }
    if (v5 == 92 && v8[1] == 47) {
      ++v8;
    }
    if (v6 == 47 && *v8 == 47)
    {
      ++v8;
      ++v7;
    }

    int v10 = strchr(v7, 47);
    if (!v10) {
      int v10 = (char *)&v7[strlen(v7)];
    }
LABEL_12:
    int v5 = *v8;
    if (*v8) {
      break;
    }
LABEL_66:
    int v6 = *(unsigned __int8 *)v7;
    BOOL v26 = v6 == 47 || v6 == 0;
    if (!v26)
    {
      while (1)
      {
LABEL_73:
        if (!v9) {
          return 1LL;
        }
        if (*v3 == 47) {
          int v7 = v3 + 1;
        }
        else {
          int v7 = v3;
        }
        int v10 = strchr(v7, 47);
        if (!v10) {
          int v10 = (char *)&v7[strlen(v7)];
        }
        uint64_t v11 = 1LL;
        int v8 = v9;
        uint64_t v3 = v10;
        if (v7 >= v10) {
          return v11;
        }
LABEL_28:
        if (v7 >= v10)
        {
LABEL_64:
          if (v7 < v10) {
            goto LABEL_12;
          }
          int v5 = *v8;
          if (v5 == 42) {
            goto LABEL_12;
          }
          goto LABEL_66;
        }

        unint64_t v28 = v8;
        int v29 = v8;
        uint64_t v14 = v10;
        size_t v15 = v8;
        while (1)
        {
          unsigned int v16 = *v15;
          if (v16 > 0x5B) {
            break;
          }
          if (!*v15 || v16 == 42)
          {
            int v17 = v11;
            uint64_t v18 = v7;
            goto LABEL_41;
          }

          if (v16 == 47) {
            goto LABEL_39;
          }
LABEL_37:
          sub_10002A820(&v28, 32);
          size_t v15 = v28;
          --v14;
        }

        if (v16 != 92 || v15[1] != 47) {
          goto LABEL_37;
        }
LABEL_39:
        int v17 = 0;
        uint64_t v18 = v7;
        if ((_DWORD)v11)
        {
          int v17 = 0;
          uint64_t v18 = v14;
          if (v7 > v14) {
            continue;
          }
        }

LABEL_56:
            if (v7 >= v10) {
              goto LABEL_73;
            }
            if (sub_10002A820(&v29, *v7)) {
              break;
            }
            ++v7;
          }

          if ((v21 & 1) == 0)
          {
            ++v22;
            int v29 = v8;
            int v7 = v22;
            if (v22 <= v14) {
              continue;
            }
          }

          goto LABEL_73;
        }
      }
    }

    if (v5 != 47)
    {
      if (v5) {
        goto LABEL_73;
      }
      return v6 && (!a3 || v6 != 47);
    }
  }

  LODWORD(v11) = 0;
  int v12 = 0;
  while (v5 == 63)
  {
    if (v12)
    {
      uint64_t v3 = v10;
      int v9 = v8;
      goto LABEL_28;
    }

    if (v7 >= v10 || *v7 == 47) {
      return 1LL;
    }
    int v12 = 0;
    ++v7;
LABEL_23:
    int v13 = *++v8;
    int v5 = v13;
  }

  if (v5 == 42)
  {
    if (v8[1] == 42)
    {
      ++v8;
      int v12 = 1;
    }

    LODWORD(v11) = 1;
    goto LABEL_23;
  }

  if (!v12) {
    goto LABEL_28;
  }
  uint64_t v3 = v10;
  int v9 = v8;
  if (v5) {
    goto LABEL_28;
  }
  return 0LL;
}

BOOL sub_10002A820(unsigned __int8 **a1, int a2)
{
  unint64_t v4 = *a1;
  int v6 = *a1 + 1;
  int v5 = (char)**a1;
  if (v5 == 92)
  {
    int v10 = v4 + 2;
    int v11 = v4[1];
    if (v11)
    {
      int v6 = v10;
      int v7 = v11;
    }

    else
    {
      int v7 = 92;
    }

    goto LABEL_13;
  }

  int v7 = **a1;
  if (v5 != 91)
  {
    if (v5 == 63)
    {
      BOOL result = a2 == 47 || a2 == 0;
      goto LABEL_14;
    }

uint64_t sub_10002AA98(char *a1, int a2, unsigned int a3)
{
  return sub_10002AAB8((uint64_t)&unk_100058670, a1, a2, 4096, a3);
}

uint64_t sub_10002AAB8(uint64_t a1, char *a2, int a3, int a4, unsigned int a5)
{
  unsigned int v42 = 0;
  char v5 = *a2;
  if (!*a2) {
    return 0LL;
  }
  __int16 v6 = a4;
  int v8 = a2;
  unsigned int v41 = a4 & 0xFFFFE07F;
  while (2)
  {
    if ((v6 & 0x1000) != 0)
    {
      int v10 = v8 - 1;
      do
      {
        __darwin_ct_rune_t v11 = v10[1];
        if (v11 < 0) {
          __uint32_t v12 = __maskrune(v11, 0x4000uLL);
        }
        else {
          __uint32_t v12 = _DefaultRuneLocale.__runetype[v11] & 0x4000;
        }
        ++v10;
      }

      while (v12);
      char v5 = *v10;
    }

    else
    {
      int v10 = v8;
    }

    if (v5 == 35 || (uint64_t result = v5, (_DWORD)result == 59))
    {
      if ((v6 & 0x1000) == 0) {
        return 0LL;
      }
    }

    else if (!v5)
    {
      return result;
    }

    unsigned int v42 = 0;
    if (!a3 || !strncmp(v10, "- ", 2uLL) || !strncmp(v10, "+ ", 2uLL) || !strcmp(v10, "!"))
    {
      size_t v15 = strcspn(v10, " _");
      int v16 = sub_10002C188((unsigned __int8 *)v10, v15, &v42);
      if (v16)
      {
        int v14 = v16;
        if (v10[v15]) {
          v10 += v15 + 1;
        }
        else {
          v10 += v15;
        }
      }

      else
      {
        int v14 = a3;
        if (!a3) {
          return 0xFFFFFFFFLL;
        }
      }
    }

    else
    {
      int v14 = a3;
    }

    if ((v14 & 0xFFFFFFFE) == 4) {
      int v17 = 8187;
    }
    else {
      int v17 = 7679;
    }
    if ((v14 - 1) < 2)
    {
      int v18 = 127;
    }

    else if ((v14 - 4) > 1)
    {
      int v18 = 0;
    }

    else
    {
      if ((~v42 & 0x180) == 0) {
        return 0xFFFFFFFFLL;
      }
      int v18 = 0x1FFF;
    }

    v42 &= v17 & v18;
    if ((v6 & 0x1000) != 0)
    {
      int v8 = v10 - 1;
      do
      {
        int v19 = v8[1];
        if (v19 < 0) {
          __uint32_t v20 = __maskrune(v8[1], 0x4000uLL);
        }
        else {
          __uint32_t v20 = _DefaultRuneLocale.__runetype[v19] & 0x4000;
        }
        ++v8;
        if (v19) {
          BOOL v21 = v20 == 0;
        }
        else {
          BOOL v21 = 0;
        }
      }

      while (v21);
    }

    else
    {
      int v8 = &v10[strlen(v10)];
    }

    if (v14 == 5 && v8 == v10 && (v42 & 0x200) != 0) {
      uint64_t v22 = strdup(".cvsignore");
    }
    else {
      uint64_t v22 = strndup(v10, v8 - v10);
    }
    char v23 = v22;
    if (!v22) {
      sub_1000416F0(0LL);
    }
    int v24 = v42;
    BOOL v25 = v14 == 3 || v14 == 1 && (v42 & 4) != 0;
    if (v25 != (*v22 == 0))
    {
      free(v22);
      return 0xFFFFFFFFLL;
    }

    int v26 = v24 | v41;
    unsigned int v42 = v26;
    if (v26 && (v14 - 4) >= 2)
    {
      if (v14 == 2)
      {
        if ((~v26 & 0x18) != 0)
        {
          if ((v26 & 8) != 0)
          {
            int v14 = 6;
          }

          else if ((v26 & 0x10) != 0)
          {
            int v14 = 9;
          }

          else
          {
            int v14 = 2;
          }
        }

        else
        {
          int v14 = 2;
        }
      }

      else
      {
        if (v14 != 1)
        {
          int v26 = 0;
LABEL_79:
          unsigned int v42 = v26;
          goto LABEL_80;
        }

        if ((~v26 & 0x18) != 0)
        {
          if ((v26 & 8) != 0)
          {
            int v14 = 7;
          }

          else if ((v26 & 0x10) != 0)
          {
            int v14 = 8;
          }

          else
          {
            int v14 = 1;
          }
        }

        else
        {
          int v14 = 1;
        }
      }

      v26 &= 0xFFFFFFE7;
      goto LABEL_79;
    }