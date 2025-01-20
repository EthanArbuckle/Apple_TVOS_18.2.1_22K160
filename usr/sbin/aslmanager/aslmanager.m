uint64_t *sub_1000040D0(char a1)
{
  unsigned int v1;
  v1 = 0;
  byte_100010010 = 0;
  qword_100010008 = 0LL;
  if ((a1 & 1) != 0)
  {
    LOBYTE(qword_100010008) = 48;
    v1 = &_mh_execute_header.magic + 1;
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_BYTE *)&qword_100010008 + v1++) = 49;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

LABEL_13:
  *((_BYTE *)&qword_100010008 + v1++) = 50;
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }

  if (a3) {
    *a3 = atoi(v5);
  }
  return 2LL;
}

LABEL_14:
  *((_BYTE *)&qword_100010008 + v1++) = 51;
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }

LABEL_15:
  *((_BYTE *)&qword_100010008 + v1++) = 52;
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }

LABEL_16:
  *((_BYTE *)&qword_100010008 + v1++) = 53;
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    *((_BYTE *)&qword_100010008 + v1) = 55;
    return &qword_100010008;
  }

LABEL_17:
  *((_BYTE *)&qword_100010008 + v1++) = 54;
  if (a1 < 0) {
    goto LABEL_18;
  }
LABEL_9:
  if (!v1) {
    LOBYTE(qword_100010008) = 45;
  }
  return &qword_100010008;
}

const char *sub_1000041A0(const char *result, char *a2)
{
  int v2 = (int)result;
  if (a2)
  {
    int v3 = *a2;
    if ((v3 | 0x20) == 0x6C)
    {
      result = a2 + 1;
      if ((a2[1] & 0xF8) == 0x30 && !a2[2])
      {
        result = (const char *)atoi(result);
LABEL_13:
        else {
          int v5 = (int)result;
        }
        int v4 = v5 & ~(v5 >> 31);
        goto LABEL_9;
      }
    }

    else if ((v3 & 0xF8) == 0x30 && !a2[1])
    {
      result = (const char *)(atoi(a2) + 2);
      goto LABEL_13;
    }
  }

  int v4 = 3;
LABEL_9:
  if (v4 <= (dword_100010048 & 0xF)) {
    int v4 = dword_100010048 & 0xF;
  }
  dword_100010048 = dword_100010048 & 0xFFFFFFF0 | v2 | v4;
  return result;
}

void sub_100004254( unsigned int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  time_t v18 = time(0LL);
  *(_OWORD *)__s = 0u;
  __int128 v21 = 0u;
  v11 = localtime(&v18);
  strftime(__s, 0x20uLL, "%b %e %T", v11);
  char v12 = dword_100010048;
  if ((dword_100010048 & 0x20) != 0 && (dword_100010048 & 0xFu) >= a1)
  {
    fprintf(__stderrp, "%s: ", __s);
    v19 = &a9;
    vfprintf(__stderrp, a2, &a9);
    char v12 = dword_100010048;
  }

  if ((v12 & 0x10) != 0 && qword_100010050)
  {
    fprintf((FILE *)qword_100010050, "%s: ", __s);
    v19 = &a9;
    vfprintf((FILE *)qword_100010050, a2, &a9);
    char v12 = dword_100010048;
  }

  if ((v12 & 0x40) != 0)
  {
    v17 = 0LL;
    if (!qword_100010018)
    {
      qword_100010018 = (uint64_t)asl_open("aslmanager", "syslog", 0);
      v13 = (__asl_object_s *)asl_msg_new(0LL);
      asl_msg_set_key_val(v13, "Message", "Status Report");
      asl_msg_set_key_val(v13, "Level", "Notice");
      asl_create_auxiliary_file(v13, "Status Report", "public.text", &dword_100010000);
      asl_msg_release(v13);
    }

    v19 = &a9;
    vasprintf(&v17, a2, &a9);
    if (v17)
    {
      size_t v14 = strlen(__s);
      write(dword_100010000, __s, v14);
      size_t v15 = strlen(v17);
      write(dword_100010000, v17, v15);
      v16 = v17;
    }

    else
    {
      v16 = 0LL;
    }

    free(v16);
  }
}

uint64_t sub_100004480()
{
  if ((dword_100010000 & 0x80000000) == 0) {
    asl_close_auxiliary_file(dword_100010000);
  }
  uint64_t result = qword_100010050;
  if (qword_100010050) {
    return fclose((FILE *)qword_100010050);
  }
  return result;
}

const char **sub_1000044B8(const char **a1, const char *a2, char *a3, int a4)
{
  if (!a2) {
    return a1;
  }
  v8 = (char **)calloc(1uLL, 0x20uLL);
  if (!v8) {
    return 0LL;
  }
  v9 = v8;
  v10 = strdup(a2);
  *v9 = v10;
  if (!v10)
  {
    free(v9);
    return 0LL;
  }

  v9[1] = a3;
  *((_DWORD *)v9 + 4) = a4;
  if (!a1) {
    return (const char **)v9;
  }
  v11 = v10;
  if (strcmp(v10, *a1) < 1)
  {
    v9[3] = (char *)a1;
    return (const char **)v9;
  }

  v13 = a1;
  do
  {
    size_t v14 = v13;
    v13 = (const char **)v13[3];
  }

  while (v13 && strcmp(v11, *v13) > 0);
  v9[3] = (char *)v13;
  v14[3] = (const char *)v9;
  return a1;
}

void sub_100004584(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = *(void *)(v1 + 24);
      free(*(void **)v1);
      free((void *)v1);
      uint64_t v1 = v2;
    }

    while (v2);
  }

uint64_t sub_1000045C0(uint64_t a1, const char *a2, const char *a3)
{
  int v5 = open(a2, 0);
  if (v5 < 0) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  uint64_t v7 = open(a3, 513, *(_WORD *)(a1 + 116) & 0x1B6);
  if ((v7 & 0x80000000) != 0 || (int v8 = asl_out_dst_set_access(v7, a1), v8 < 0))
  {
    int v15 = v6;
LABEL_10:
    close(v15);
    return 0xFFFFFFFFLL;
  }

  int v9 = v8;
  gzFile v10 = gzdopen(v8, "w");
  if (!v10)
  {
    close(v6);
    int v15 = v9;
    goto LABEL_10;
  }

  v11 = v10;
  do
  {
    ssize_t v12 = read(v6, buf, 0x1000uLL);
    if (!v12) {
      break;
    }
    ssize_t v13 = v12;
    gzwrite(v11, buf, v12);
  }

  while (v13 == 4096);
  gzclose(v11);
  close(v6);
  close(v9);
  return 0LL;
}

void sub_100004700( const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!byte_100010058)
  {
    int v10 = rename(a1, a2);
    if (v10)
    {
      char v11 = v10;
      __error();
      ssize_t v12 = __error();
      strerror(*v12);
      sub_100004254(3u, "  FAILED status %d errno %d [%s] rename %s ---> %s\n", v13, v14, v15, v16, v17, v18, v11);
    }
  }

void sub_100004798( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!byte_100010058)
  {
    int v9 = unlink(a1);
    if (v9)
    {
      char v10 = v9;
      __error();
      char v11 = __error();
      strerror(*v11);
      sub_100004254(3u, "  FAILED status %d errno %d [%s] unlink %s\n", v12, v13, v14, v15, v16, v17, v10);
    }
  }

void sub_100004824( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!byte_100010058)
  {
    int v9 = truncate(a1, 0LL);
    if (v9)
    {
      char v10 = v9;
      __error();
      char v11 = __error();
      strerror(*v11);
      sub_100004254(3u, "  FAILED status %d errno %d [%s] unlink %s\n", v12, v13, v14, v15, v16, v17, v10);
    }
  }

void sub_1000048B4( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!byte_100010058)
  {
    int v9 = rmdir(a1);
    if (v9)
    {
      char v10 = v9;
      __error();
      char v11 = __error();
      strerror(*v11);
      sub_100004254(3u, "  FAILED status %d errno %d [%s] rmdir %s\n", v12, v13, v14, v15, v16, v17, v10);
    }
  }

uint64_t sub_100004940(uint64_t a1, char *__s, const char *a3, __int16 a4)
{
  uint64_t result = 0LL;
  if (__s && a3)
  {
    int v9 = strrchr(__s, 46);
    if (v9 && !strcmp(v9, ".gz")) {
      a4 &= ~0x10u;
    }
    if ((a4 & 0x10) != 0)
    {
      if ((a4 & 0x1000) == 0)
      {
        sub_100004254(5u, "  copy compress %s ---> %s.gz\n", v10, v11, v12, v13, v14, v15, (char)__s);
        if (byte_100010058) {
          return 0LL;
        }
        snprintf(__str, 0x400uLL, "%s.gz", a3);
        if (sub_1000045C0(a1, __s, __str))
        {
          __error();
          v25 = __error();
          strerror(*v25);
          sub_100004254( 3u,  "  FAILED status %d errno %d [%s] copy & compress %s ---> %s\n",  v26,  v27,  v28,  v29,  v30,  v31,  -1);
          return 0LL;
        }

        return 1LL;
      }
    }

    else
    {
      uint64_t result = strcmp(__s, a3);
      if (!(_DWORD)result) {
        return result;
      }
      if ((a4 & 0x1000) == 0)
      {
        sub_100004254(5u, "  copy %s ---> %s\n", v10, v11, v12, v13, v14, v15, (char)__s);
        if (byte_100010058) {
          return 0LL;
        }
        int v16 = copyfile(__s, a3, 0LL, 0x800Fu);
        if (v16)
        {
          char v17 = v16;
          __error();
          uint64_t v18 = __error();
          strerror(*v18);
          sub_100004254(3u, "  FAILED status %d errno %d [%s] copy %s ---> %s\n", v19, v20, v21, v22, v23, v24, v17);
          return 0LL;
        }

        return 1LL;
      }
    }

    sub_100004254(5u, "  copy asl %s ---> %s\n", v10, v11, v12, v13, v14, v15, (char)__s);
    if (byte_100010058) {
      return 0LL;
    }
    uint64_t v32 = *(unsigned __int16 *)(a1 + 116);
    *(void *)__str = 0LL;
    uint64_t v33 = asl_file_open_read(__s, __str);
    if ((_DWORD)v33)
    {
      uint64_t v34 = v33;
      goto LABEL_23;
    }

    uint64_t v45 = 0LL;
    uint64_t v35 = asl_file_open_write(a3, v32, 0xFFFFFFFFLL, 0xFFFFFFFFLL, &v45);
    if ((_DWORD)v35)
    {
      uint64_t v34 = v35;
    }

    else
    {
      if (v45)
      {
        *(_DWORD *)(v45 + 8) = 8;
        if (!asl_file_read_set_position(*(void *)__str, 0LL))
        {
          while (1)
          {
            v44[0] = 0LL;
            v44[1] = 0LL;
            uint64_t next = asl_file_fetch_next(*(void *)__str, v44);
            if (!v44[0]) {
              break;
            }
            uint64_t v34 = next;
            if (!(_DWORD)next)
            {
              uint64_t v34 = asl_file_save(v45);
              asl_msg_release(v44[0]);
              if (!(_DWORD)v34) {
                continue;
              }
            }

            goto LABEL_33;
          }

          uint64_t v34 = 0LL;
LABEL_33:
          asl_file_close(*(void *)__str);
          asl_file_close(v45);
          if (!(_DWORD)v34) {
            return 1LL;
          }
LABEL_23:
          asl_core_error(v34);
          sub_100004254(3u, "  FAILED status %u [%s] asl copy %s ---> %s\n", v37, v38, v39, v40, v41, v42, v34);
          return 0LL;
        }

        asl_file_close(*(void *)__str);
        uint64_t v34 = 7LL;
        v36 = (char *)&v45;
LABEL_22:
        asl_file_close(*(void *)v36);
        goto LABEL_23;
      }

      uint64_t v34 = 9999LL;
    }

    v36 = __str;
    goto LABEL_22;
  }

  return result;
}

uint64_t sub_100004C18( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v11[1] = 0LL;
  v11[2] = 0LL;
  v11[0] = 0x20000000005LL;
  v10[1] = 0LL;
  v10[0] = time(0LL);
  return setattrlist(a1, v11, v10, 0x10uLL, 0);
}

uint64_t sub_100004C90(const char *a1)
{
  uint64_t v2 = opendir(a1);
  if (v2)
  {
    int v3 = v2;
    for (i = readdir(v2); i; i = readdir(v3))
    {
      d_name = i->d_name;
      if (strcmp(i->d_name, "."))
      {
        if (strcmp(d_name, ".."))
        {
          asprintf(&v21, "%s/%s", a1, d_name);
          if (v21)
          {
            sub_100004798(v21, v6, v7, v8, v9, v10, v11, v12);
            free(v21);
            uint64_t v21 = 0LL;
          }
        }
      }
    }

    closedir(v3);
    sub_1000048B4(a1, v13, v14, v15, v16, v17, v18, v19);
  }

  return 0LL;
}

uint64_t sub_100004D5C(const char *a1)
{
  uint64_t v2 = opendir(a1);
  if (!v2) {
    return 0LL;
  }
  int v3 = v2;
  int v4 = readdir(v2);
  for (i = 0LL; v4; int v4 = readdir(v3))
  {
    d_name = v4->d_name;
    if (strcmp(v4->d_name, "."))
    {
      if (strcmp(d_name, ".."))
      {
        memset(&v9, 0, sizeof(v9));
        uint64_t v8 = 0LL;
        asprintf(&v8, "%s/%s", a1, d_name);
        if (v8)
        {
          if (!stat(v8, &v9) && (v9.st_mode & 0xF000) == 0x8000)
          {
            i += v9.st_size;
            free(v8);
          }
        }
      }
    }
  }

  closedir(v3);
  return i;
}

time_t sub_100004E74(const char *a1)
{
  if (!a1) {
    return -1LL;
  }
  int v1 = *(unsigned __int8 *)a1;
  if ((v1 | 0x20) == 0x74)
  {
    uint64_t v2 = a1 + 1;
    uint64_t v3 = atol(a1 + 1);
    if (v3 || *v2 == 48)
    {
      if (strchr(v2, 46)) {
        return v3;
      }
      else {
        return -1LL;
      }
    }

    return -1LL;
  }

  memset(&v48, 0, sizeof(v48));
  int v5 = *((unsigned __int8 *)a1 + 1);
  int v6 = *((unsigned __int8 *)a1 + 2);
  int v7 = *((unsigned __int8 *)a1 + 3);
  uint64_t v8 = (unsigned __int8 *)(a1 + 5);
  int v11 = *((unsigned __int8 *)a1 + 4);
  stat v9 = (unsigned __int8 *)(a1 + 4);
  int v10 = v11;
  v48.tm_year = 10 * v6 + 100 * v5 + 1000 * v1 + v7 - 55228;
  uint64_t v12 = v11 == 45 ? v8 : v9;
  uint64_t v13 = v10 == 46 ? v8 : v12;
  int v14 = *v13;
  int v15 = v13[1];
  v48.tm_mon = v15 + 10 * v14 - 529;
  uint64_t v16 = v13 + 2;
  uint64_t v17 = 2LL;
  if (v13[2] - 45 < 2)
  {
    uint64_t v17 = 3LL;
    uint64_t v16 = v13 + 3;
  }

  int v18 = v13[v17];
  int v19 = 10 * v18;
  v48.tm_mday = v19 - 480;
  int v20 = v16[1];
  v48.tm_mday = v19 + v20 - 528;
  int v21 = v16[2];
  if (v10 == 46)
  {
    if (v21 == 46 || !v16[2])
    {
      *(void *)&v48.tm_sec = 0LL;
      v48.tm_hour = 24;
      v48.tm_isdst = -1;
      return mktime(&v48);
    }

    return -1LL;
  }

  if ((v21 | 0x20) != 0x74) {
    return 1LL;
  }
  int v22 = v16[3];
  int v23 = 10 * v22;
  v48.tm_hour = v23 - 480;
  int v24 = v16[4];
  v48.tm_hour = v23 + v24 - 528;
  v25 = v16 + 5;
  uint64_t v26 = 5LL;
  if (v16[5] == 58)
  {
    uint64_t v26 = 6LL;
    v25 = v16 + 6;
  }

  int v27 = v16[v26];
  int v28 = 10 * v27;
  v48.tm_min = v28 - 480;
  int v29 = v25[1];
  v48.tm_min = v28 + v29 - 528;
  uint64_t v30 = v25[2] == 58 ? 3LL : 2LL;
  uint64_t v31 = (uint64_t)(v25[2] == 58 ? v25 + 3 : v25 + 2);
  int v32 = v25[v30];
  int v33 = 10 * v32;
  v48.tm_sec = v33 - 480;
  int v34 = *(unsigned __int8 *)(v31 + 1);
  int v35 = v33 + v34 - 528;
  v48.tm_sec = v35;
  unsigned int v36 = *(unsigned __int8 *)(v31 + 2);
  time_t result = 1LL;
  if (v36 > 0x59)
  {
    if (v36 == 122 || v36 == 90) {
      return timegm(&v48);
    }
  }

  else if (v36 == 43 || v36 == 45)
  {
    int v37 = *(unsigned __int8 *)(v31 + 3);
    if ((v37 - 58) >= 0xFFFFFFF6)
    {
      int v38 = v37 - 48;
      int v40 = *(char *)(v31 + 4);
      uint64_t v39 = (unsigned __int8 *)(v31 + 4);
      int v41 = v40 + 10 * v38 - 48;
      if ((v40 - 58) >= 0xF6u)
      {
        int v38 = v41;
        ++v39;
      }

      if (v38 <= 23)
      {
        int v42 = *v39;
        if ((v42 - 48) > 0xA)
        {
          unsigned int v45 = 0;
        }

        else
        {
          int v43 = v39[1];
          int v44 = v42 == 58 ? -48 : 10 * v42 - 528;
          unsigned int v45 = v44 + v43;
          if (v45 > 0x3B) {
            return -1LL;
          }
          v39 += 2;
        }

        int v46 = 3600 * v38;
        if (v36 == 45) {
          int v47 = v46;
        }
        else {
          int v47 = -v46;
        }
        v48.tm_sec = v47 + v35 + 60 * v45;
        if (*v39 != 46 && *v39) {
          return -1LL;
        }
        return timegm(&v48);
      }
    }

    return 1LL;
  }

  return result;
}

uint64_t sub_100005240(const char *a1, time_t a2, int *a3, int *a4)
{
  if (!a1) {
    return 0LL;
  }
  time_t v6 = a2;
  if (!a2) {
    time_t v6 = time(0LL);
  }
  time_t v8 = sub_100004E74(a1);
  uint64_t v9 = 0LL;
  if ((v8 & 0x8000000000000000LL) == 0 && v6 >= v8)
  {
    uint64_t v9 = (v6 - v8);
    if (a3)
    {
      *a3 = -1;
      int v10 = strchr(a1, 85);
      if (v10) {
        *a3 = atoi(v10 + 1);
      }
    }

    if (a4)
    {
      *a4 = -1;
      int v11 = strchr(a1, 71);
      if (v11) {
        *a4 = atoi(v11 + 1);
      }
    }
  }

  return v9;
}

uint64_t sub_100005304(const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v35 = 0LL;
  int v34 = 0;
  *(_DWORD *)&v36[strlen(__str) - 3] = 7368052;
  sub_1000040D0(a3);
  sub_100004254(5u, "  filter %s %s ---> %s\n", v14, v15, v16, v17, v18, v19, (char)__str);
  if (byte_100010058)
  {
    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v12 = asl_file_open_read(a1, &v35);
    if ((_DWORD)v12) {
      return v12;
    }
    uint64_t v12 = asl_file_filter_level(v35, v36, a3, a4, a5, a6, &v34, sub_1000054AC);
    asl_file_close(v35);
  }

  sub_100004798(__str, v20, v21, v22, v23, v24, v25, v26);
  if ((_DWORD)v12 || !v34)
  {
    sub_100004798(v36, v27, v28, v29, v30, v31, v32, v33);
  }

  else
  {
    sub_100004700(v36, __str, v28, v29, v30, v31, v32, v33);
    return 0LL;
  }

  return v12;
}

void sub_1000054AC(const char *a1)
{
  if (a1)
  {
    if (!strncmp(a1, "file:///var/log/asl/", 0x14uLL)) {
      sub_100004798(a1 + 7, v2, v3, v4, v5, v6, v7, v8);
    }
  }

uint64_t sub_1000054F0( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!result) {
    return result;
  }
  uint64_t v8 = result;
  if (!*(void *)(result + 8)) {
    return 0LL;
  }
  unsigned int v9 = *(_DWORD *)(result + 112);
  if (a2)
  {
    if (*(_DWORD *)(a2 + 112)) {
      unsigned int v9 = *(_DWORD *)(a2 + 112);
    }
    if (*(void *)(a2 + 160)) {
      unint64_t v10 = *(void *)(a2 + 160);
    }
    else {
      unint64_t v10 = *(void *)(result + 160);
    }
  }

  else
  {
    unint64_t v10 = *(void *)(result + 160);
  }

  sub_100004254(5u, "----------------------------------------\n", a3, a4, a5, a6, a7, a8, v229);
  sub_100004254(5u, "Processing data store %s\n", v11, v12, v13, v14, v15, v16, *(void *)(v8 + 8));
  uint64_t v17 = *(const char **)(v8 + 32);
  if (v17)
  {
    memset(&v253, 0, sizeof(v253));
    if (stat(v17, &v253))
    {
      uint64_t v24 = __error();
      uint64_t v25 = *(void *)(v8 + 32);
      if (*v24 != 2)
      {
        v53 = __error();
        strerror(*v53);
        sub_100004254(3u, "aslmanager error: can't stat archive %s: %s\n", v54, v55, v56, v57, v58, v59, v25);
        return 0xFFFFFFFFLL;
      }

      if (mkdir(*(const char **)(v8 + 32), 0x1EDu))
      {
        uint64_t v26 = *(void *)(v8 + 32);
        uint64_t v27 = __error();
        strerror(*v27);
        sub_100004254(3u, "aslmanager error: can't create archive %s: %s\n", v28, v29, v30, v31, v32, v33, v26);
        return 0xFFFFFFFFLL;
      }
    }

    else if ((v253.st_mode & 0xF000) != 0x4000)
    {
      sub_100004254( 3u,  "aslmanager error: archive %s is not a directory",  v18,  v19,  v20,  v21,  v22,  v23,  *(void *)(v8 + 32));
      return 0xFFFFFFFFLL;
    }
  }

  chdir(*(const char **)(v8 + 8));
  time_t v255 = time(0LL);
  localtime_r(&v255, &v252);
  *(void *)&v252.tm_sec = 0LL;
  v252.tm_hour = 0;
  time_t v34 = mktime(&v252);
  time_t v35 = v255;
  unsigned int v36 = opendir(*(const char **)(v8 + 8));
  if (!v36) {
    return 0xFFFFFFFFLL;
  }
  int v37 = v36;
  time_t v243 = v35;
  time_t v244 = v34;
  int v38 = readdir(v36);
  if (v38)
  {
    uint64_t v39 = v38;
    v248 = 0LL;
    v249 = 0LL;
    v246 = 0LL;
    v247 = 0LL;
    unint64_t v40 = 0LL;
    while (1)
    {
      d_name = v39->d_name;
      memset(&v253, 0, sizeof(v253));
      if (stat(v39->d_name, &v253)) {
        off_t st_size = 0LL;
      }
      else {
        off_t st_size = v253.st_size;
      }
      int v43 = strrchr(v39->d_name, 46);
      if (v43) {
        BOOL v44 = strcmp(v43, ".gz") == 0;
      }
      else {
        BOOL v44 = 0;
      }
      int v45 = *(unsigned __int8 *)d_name;
      if ((v45 - 48) <= 9
        || (v45 | 0x20) == 0x74 && v39->d_name[1] - 48 <= 9)
      {
        v249 = sub_1000044B8(v249, v39->d_name, (char *)st_size, v44);
      }

      else
      {
        if (!strncmp(v39->d_name, "AUX.", 4uLL)
          && v39->d_name[4] - 48 <= 9
          && (v253.st_mode & 0xF000) == 0x4000)
        {
          uint64_t v46 = sub_100004D5C(v39->d_name);
          v247 = sub_1000044B8(v247, d_name, (char *)v46, v44);
LABEL_40:
          v40 += v46;
          goto LABEL_30;
        }

        if (!strncmp(v39->d_name, "BB.AUX.", 7uLL)
          && v39->d_name[7] - 48 <= 9
          && (v253.st_mode & 0xF000) == 0x4000)
        {
          uint64_t v46 = sub_100004D5C(v39->d_name);
          v246 = sub_1000044B8(v246, d_name, (char *)v46, v44);
          goto LABEL_40;
        }

        if (strncmp(v39->d_name, "BB.", 3uLL) || v39->d_name[3] - 48 > 9)
        {
          if (strcmp(v39->d_name, ".")
            && strcmp(v39->d_name, "..")
            && strcmp(v39->d_name, "StoreData")
            && strcmp(v39->d_name, "SweepStore")
            && strcmp(v39->d_name, "Logs"))
          {
            sub_100004254( 3u,  "aslmanager: unexpected file %s in ASL data store\n",  v47,  v48,  v49,  v50,  v51,  v52,  (_BYTE)v39 + 21);
          }

          goto LABEL_30;
        }

        v248 = sub_1000044B8(v248, v39->d_name, (char *)st_size, v44);
      }

      v40 += st_size;
LABEL_30:
      uint64_t v39 = readdir(v37);
      if (!v39) {
        goto LABEL_52;
      }
    }
  }

  unint64_t v40 = 0LL;
  v246 = 0LL;
  v247 = 0LL;
  v248 = 0LL;
  v249 = 0LL;
LABEL_52:
  unint64_t v245 = v10;
  closedir(v37);
  sub_100004254(5u, "Data Store Size = %lu\n", v60, v61, v62, v63, v64, v65, v40);
  asl_core_time_to_str(v9, v257, 128LL);
  sub_100004254(5u, "Data Store YMD Files (TTL = %s)\n", v66, v67, v68, v69, v70, v71, &vars0 + 32);
  if (v249)
  {
    v78 = v249;
    do
    {
      unsigned int v79 = sub_100005240(*v78, v255, 0LL, 0LL);
      asl_core_time_to_str(v79, v257, 128LL);
      sub_100004254(5u, "  %s   %lu (age %s%s)\n", v80, v81, v82, v83, v84, v85, (char)*v78);
      v78 = (const char **)v78[3];
    }

    while (v78);
  }

  sub_100004254(5u, "Data Store AUX Directories\n", v72, v73, v74, v75, v76, v77, v230);
  if (v247)
  {
    v92 = v247;
    do
    {
      unsigned int v93 = sub_100005240(*v92 + 4, v255, 0LL, 0LL) / 0x15180;
      asl_core_time_to_str(v93, v257, 128LL);
      sub_100004254(5u, "  %s   %lu (age %s)\n", v94, v95, v96, v97, v98, v99, (char)*v92);
      v92 = (const char **)v92[3];
    }

    while (v92);
  }

  sub_100004254(5u, "Data Store BB.AUX Directories\n", v86, v87, v88, v89, v90, v91, v231);
  if (v246)
  {
    v106 = v246;
    do
    {
      unsigned int v107 = sub_100005240(*v106 + 7, v255, 0LL, 0LL);
      asl_core_time_to_str(v107, v257, 128LL);
      sub_100004254(5u, "  %s   %lu (age %s)\n", v108, v109, v110, v111, v112, v113, (char)*v106);
      v106 = (const char **)v106[3];
    }

    while (v106);
  }

  sub_100004254(5u, "Data Store BB Files\n", v100, v101, v102, v103, v104, v105, v232);
  if (v248)
  {
    v120 = v248;
    do
    {
      unsigned int v121 = sub_100005240(*v120 + 3, v255, 0LL, 0LL);
      asl_core_time_to_str(v121 / 0x15180, v257, 128LL);
      sub_100004254(5u, "  %s   %lu (age %s)\n", v122, v123, v124, v125, v126, v127, (char)*v120);
      v120 = (const char **)v120[3];
    }

    while (v120);
  }

  sub_100004254(5u, "Start YMD File Scan\n", v114, v115, v116, v117, v118, v119, v233);
  for (uint64_t i = v249; i; uint64_t i = (const char **)i[3])
  {
    unsigned int v250 = -1;
    unsigned int v251 = -1;
    unsigned int v135 = sub_100005240(*i, v255, (int *)&v251, (int *)&v250);
    if (v135 <= v9)
    {
      if (((_BYTE)i[2] & 1) == 0)
      {
        unsigned int v138 = v135;
        if (v135)
        {
          uint64_t v139 = 0LL;
          int v140 = 1;
          LODWORD(v141) = 255;
          do
          {
            if (*(_DWORD *)(v8 + 80 + v139) - 1 < v135) {
              int v142 = ~v140;
            }
            else {
              int v142 = -1;
            }
            uint64_t v141 = v142 & v141;
            v140 *= 2;
            v139 += 4LL;
          }

          while (v139 != 32);
          memset(&v253, 0, sizeof(v253));
          int v143 = stat(*i, &v253);
          if ((_DWORD)v141 != 255)
          {
            if (v143) {
              uint64_t v144 = 384LL;
            }
            else {
              uint64_t v144 = v253.st_mode & 0x1FF;
            }
            sub_100005304(*i, *(const char **)(v8 + 8), v141, v144, v251, v250);
          }
        }

        if (v243 - v244 < v138 && (*(_BYTE *)(v8 + 72) & 0x10) != 0)
        {
          snprintf(__str, 0x400uLL, "%s.gz", *i);
          sub_100004254(5u, "  compress %s ---> %s\n", v145, v146, v147, v148, v149, v150, (char)*i);
          if (!byte_100010058)
          {
            if (sub_1000045C0(v8, *i, __str))
            {
              __error();
              v222 = __error();
              strerror(*v222);
              sub_100004254( 3u,  "  FAILED status %d errno %d [%s] compress %s ---> %s\n",  v223,  v224,  v225,  v226,  v227,  v228,  -1);
              return 0LL;
            }

            sub_100004798(*i, v151, v152, v153, v154, v155, v156, v157);
          }
        }
      }
    }

    else
    {
      v137 = *(const char **)(v8 + 32);
      if (v137)
      {
        v254 = 0LL;
        asprintf(&v254, "%s/%s", v137, *i);
        if (!v254) {
          return 0xFFFFFFFFLL;
        }
        sub_100004940(v8, (char *)*i, v254, 0);
        free(v254);
      }

      sub_100004798(*i, v136, v128, v129, v130, v131, v132, v133);
      v40 -= (unint64_t)i[1];
      i[1] = 0LL;
    }
  }

  sub_100004254(5u, "Finished YMD File Scan\n", v128, v129, v130, v131, v132, v133, v234);
  sub_100004254(5u, "Start AUX Directory Scan\n", v158, v159, v160, v161, v162, v163, v235);
  if (v247)
  {
    v170 = v247;
    unint64_t v171 = v245;
    do
    {
      if (sub_100005240(*v170 + 4, v255, 0LL, 0LL) > v9)
      {
        v172 = *(const char **)(v8 + 32);
        if (v172)
        {
          v254 = 0LL;
          asprintf(&v254, "%s/%s", v172, *v170);
          if (!v254) {
            return 0xFFFFFFFFLL;
          }
          sub_100004940(v8, (char *)*v170, v254, 0);
          free(v254);
        }

        sub_100004C90(*v170);
        v40 -= (unint64_t)v170[1];
        v170[1] = 0LL;
      }

      v170 = (const char **)v170[3];
    }

    while (v170);
  }

  else
  {
    unint64_t v171 = v245;
  }

  sub_100004254(5u, "Finished AUX Directory Scan\n", v164, v165, v166, v167, v168, v169, v236);
  sub_100004254(5u, "Start BB.AUX Directory Scan\n", v173, v174, v175, v176, v177, v178, v237);
  if (v246)
  {
    v185 = v246;
    uint64_t v186 = (uint64_t)v248;
    do
    {
      if (sub_100005240(*v185 + 7, v255, 0LL, 0LL))
      {
        v187 = *(const char **)(v8 + 32);
        if (v187)
        {
          v254 = 0LL;
          asprintf(&v254, "%s/%s", v187, *v185);
          if (!v254) {
            return 0xFFFFFFFFLL;
          }
          sub_100004940(v8, (char *)*v185, v254, 0);
          free(v254);
        }

        sub_100004C90(*v185);
        v40 -= (unint64_t)v185[1];
        v185[1] = 0LL;
      }

      v185 = (const char **)v185[3];
    }

    while (v185);
  }

  else
  {
    uint64_t v186 = (uint64_t)v248;
  }

  sub_100004254(5u, "Finished BB.AUX Directory Scan\n", v179, v180, v181, v182, v183, v184, v238);
  sub_100004254(5u, "Start BB Scan\n", v188, v189, v190, v191, v192, v193, v239);
  if (v186)
  {
    v200 = (const char **)v186;
    do
    {
      if (sub_100005240(*v200 + 3, v255, 0LL, 0LL))
      {
        v202 = *(const char **)(v8 + 32);
        if (v202)
        {
          v254 = 0LL;
          asprintf(&v254, "%s/%s", v202, *v200);
          if (!v254) {
            return 0xFFFFFFFFLL;
          }
          sub_100004940(v8, (char *)*v200, v254, 0);
          free(v254);
        }

        sub_100004798(*v200, v201, v194, v195, v196, v197, v198, v199);
        v40 -= (unint64_t)v200[1];
        v200[1] = 0LL;
      }

      v200 = (const char **)v200[3];
    }

    while (v200);
  }

  sub_100004254(5u, "Finished BB Scan\n", v194, v195, v196, v197, v198, v199, v240);
  if (!v171) {
    goto LABEL_147;
  }
  if (v40 <= v171) {
    goto LABEL_135;
  }
  sub_100004254(5u, "Additional YMD Scan\n", v204, v205, v206, v207, v208, v209, v241);
  v210 = v249;
  if (!v249) {
    goto LABEL_134;
  }
  do
  {
    while (1)
    {
      if (!v210[1]) {
        goto LABEL_129;
      }
      v210 = (const char **)v210[3];
      if (!v210) {
        goto LABEL_134;
      }
    }

    v211 = *(const char **)(v8 + 32);
    if (v211)
    {
      v254 = 0LL;
      asprintf(&v254, "%s/%s", v211, *v210);
      if (!v254) {
        return 0xFFFFFFFFLL;
      }
      sub_100004940(v8, (char *)*v210, v254, 0);
      free(v254);
    }

    sub_100004798(*v210, v203, v204, v205, v206, v207, v208, v209);
    v40 -= (unint64_t)v210[1];
    v210[1] = 0LL;
LABEL_129:
    v210 = (const char **)v210[3];
    if (v210) {
      BOOL v212 = v40 > v171;
    }
    else {
      BOOL v212 = 0;
    }
  }

  while (v212);
  if (v40 > v171) {
LABEL_134:
  }
    sub_100004254(5u, "Additional BB Scan\n", v204, v205, v206, v207, v208, v209, v242);
LABEL_135:
  if (v186 && v40 > v171)
  {
    v213 = (const char **)v186;
    do
    {
      if (v213[1])
      {
        v214 = *(const char **)(v8 + 32);
        if (v214)
        {
          v254 = 0LL;
          asprintf(&v254, "%s/%s", v214, *v213);
          if (!v254) {
            return 0xFFFFFFFFLL;
          }
          sub_100004940(v8, (char *)*v213, v254, 0);
          free(v254);
        }

        sub_100004798(*v213, v203, v204, v205, v206, v207, v208, v209);
        v40 -= (unint64_t)v213[1];
        v213[1] = 0LL;
      }

      v213 = (const char **)v213[3];
      if (v213) {
        BOOL v215 = v40 > v171;
      }
      else {
        BOOL v215 = 0;
      }
    }

    while (v215);
  }

LABEL_147:
  sub_100004584((uint64_t)v249);
  sub_100004584(v186);
  sub_100004584((uint64_t)v247);
  sub_100004584((uint64_t)v246);
  sub_100004254(5u, "Data Store Size = %lu\n", v216, v217, v218, v219, v220, v221, v40);
  return 0LL;
}

uint64_t sub_10000610C(uint64_t a1)
{
  if (!a1 || !*(void *)(a1 + 8)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = asl_list_src_files(a1);
  if (!v2) {
    goto LABEL_30;
  }
  unsigned int v9 = v2;
  if (LODWORD(v2->__dd_loc)) {
    goto LABEL_11;
  }
  if ((*(_BYTE *)(a1 + 72) & 0x40) == 0)
  {
    unint64_t v10 = "    ignore src file %s since it is internal and syslogd will checkpoint it when it needs to be renamed\n";
    goto LABEL_10;
  }

  if (time(0LL) - v2->__dd_size > 86399)
  {
LABEL_11:
    sub_100004254(6u, "    src files\n", v3, v4, v5, v6, v7, v8, v74);
    int v19 = 0;
    uint64_t v20 = v9;
    do
    {
      sub_100004254(6u, "      %s\n", v13, v14, v15, v16, v17, v18, *(void *)&v20->__dd_fd);
      ++v19;
      uint64_t v20 = (DIR *)v20->__dd_seek;
    }

    while (v20);
    uint64_t v21 = asl_list_dst_files(a1);
    uint64_t v28 = v21;
    uint64_t v29 = *(const char **)(a1 + 32);
    if (!v29) {
      uint64_t v29 = *(const char **)a1;
    }
    uint64_t v76 = (uint64_t)v21;
    if (v21)
    {
      sub_100004254(6u, "    dst files\n", v22, v23, v24, v25, v26, v27, v75);
      unsigned int v36 = v28;
      do
      {
        sub_100004254(6u, "      %s\n", v30, v31, v32, v33, v34, v35, *(void *)&v36->__dd_fd);
        unsigned int v36 = (DIR *)v36->__dd_seek;
      }

      while (v36);
      int v37 = (int *)(a1 + 64);
      if ((*(_BYTE *)(a1 + 64) & 2) != 0)
      {
        int v38 = v28;
        do
        {
          uint64_t v39 = *(const char **)&v38->__dd_fd;
          unint64_t v40 = strrchr(*(const char **)&v38->__dd_fd, 46);
          if (v40) {
            strcmp(v40, ".gz");
          }
          snprintf(__str, 0x400uLL, "%s/%s", v29, v39);
          int v47 = *v37;
          if ((*v37 & 0x10000000) != 0)
          {
            snprintf(v78, 0x400uLL, "%s/%s.%d%s");
          }

          else if ((v47 & 0x20000000) != 0)
          {
            snprintf(v78, 0x400uLL, "%s/%s.%s.%d%s");
          }

          else if ((v47 & 0x40000000) != 0)
          {
            snprintf(v78, 0x400uLL, "%s/%s.%d.%s%s");
          }

          sub_100004700(__str, v78, v41, v42, v43, v44, v45, v46);
          int v38 = (DIR *)v38->__dd_seek;
        }

        while (v38);
        goto LABEL_49;
      }
    }

    else
    {
      sub_100004254(6u, "    no dst files\n", v22, v23, v24, v25, v26, v27, v75);
      int v37 = (int *)(a1 + 64);
      if ((*(_BYTE *)(a1 + 64) & 2) != 0)
      {
LABEL_49:
        int v57 = 0;
        uint64_t v58 = v9;
        do
        {
          snprintf(__str, 0x400uLL, "%s/%s", *(const char **)a1, *(const char **)&v58->__dd_fd);
          int v59 = *(_DWORD *)(a1 + 64);
          if ((v59 & 0x10000000) != 0)
          {
            snprintf(v78, 0x400uLL, "%s/%s.%d");
          }

          else if ((v59 & 0x20000000) != 0)
          {
            snprintf(v78, 0x400uLL, "%s/%s.%s.%d");
          }

          else if ((v59 & 0x40000000) != 0)
          {
            snprintf(v78, 0x400uLL, "%s/%s.%d.%s");
          }

          if (sub_100004940(a1, __str, v78, *(_DWORD *)(a1 + 72)))
          {
            if ((*(_BYTE *)(a1 + 72) & 0x80) != 0)
            {
              sub_100004824(__str, v60, v61, v62, v63, v64, v65, v66);
              sub_100004C18(__str, v67, v68, v69, v70, v71, v72, v73);
            }

            else
            {
              sub_100004798(__str, v60, v61, v62, v63, v64, v65, v66);
            }
          }

          uint64_t v58 = (DIR *)v58->__dd_seek;
          ++v57;
        }

        while (v58);
LABEL_61:
        asl_out_file_list_free((uint64_t)v9);
        asl_out_file_list_free(v76);
        return 0LL;
      }
    }

    uint64_t v48 = v9;
    do
    {
      if ((*(_BYTE *)(a1 + 73) & 1) != 0 && !v48->__dd_seek) {
        break;
      }
      snprintf(__str, 0x400uLL, "%s/%s", *(const char **)a1, *(const char **)&v48->__dd_fd);
      if ((*(_BYTE *)(a1 + 72) & 0x40) != 0)
      {
        asl_make_timestamp(v48->__dd_size, *v37, v77, 0x20uLL);
        int v49 = *v37;
        if ((*v37 & 0x10000000) != 0)
        {
          snprintf(v78, 0x400uLL, "%s/%s.%s");
        }

        else if ((v49 & 0x20000000) != 0 || (v49 & 0x40000000) != 0)
        {
          snprintf(v78, 0x400uLL, "%s/%s.%s.%s");
        }
      }

      else
      {
        snprintf(v78, 0x400uLL, "%s/%s");
      }

      if (sub_100004940(a1, __str, v78, *(_DWORD *)(a1 + 72)))
      {
        if ((*(_BYTE *)(a1 + 72) & 0x80) != 0) {
          sub_100004824(__str, v50, v51, v52, v53, v54, v55, v56);
        }
        else {
          sub_100004798(__str, v50, v51, v52, v53, v54, v55, v56);
        }
      }

      uint64_t v48 = (DIR *)v48->__dd_seek;
    }

    while (v48);
    goto LABEL_61;
  }

  unint64_t v10 = "    ignore src file %s since it is external and less than a day old\n";
LABEL_10:
  sub_100004254(6u, v10, v3, v4, v5, v6, v7, v8, *(void *)&v9->__dd_fd);
  dd_seek = (DIR *)v9->__dd_seek;
  v9->__dd_seek = 0LL;
  asl_out_file_list_free((uint64_t)v9);
  unsigned int v9 = dd_seek;
  if (dd_seek) {
    goto LABEL_11;
  }
LABEL_30:
  sub_100004254(6u, "    no src files\n", v3, v4, v5, v6, v7, v8, v74);
  return 0LL;
}

uint64_t sub_100006604(uint64_t a1, uint64_t a2)
{
  if (!a1 || !*(void *)(a1 + 8)) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 112);
  if (!v3) {
    return 0LL;
  }
  if (a2 && *(_DWORD *)(a2 + 112)) {
    unsigned int v3 = *(_DWORD *)(a2 + 112);
  }
  time_t v4 = time(0LL);
  if (v4 < v3) {
    return 0LL;
  }
  time_t v6 = v4;
  uint64_t v7 = strrchr(*(const char **)(a1 + 8), 47);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = v7;
  unsigned int v9 = asl_list_dst_files(a1);
  uint64_t v16 = v9;
  *uint64_t v8 = 0;
  uint64_t v17 = *(const char **)(a1 + 32);
  if (!v17) {
    uint64_t v17 = *(const char **)a1;
  }
  if (v9)
  {
    time_t v18 = v3;
    sub_100004254(6u, "    dst files\n", v10, v11, v12, v13, v14, v15, v33);
    uint64_t v34 = v16;
    do
    {
      asl_core_time_to_str(v6 - v16->__dd_size, __str, 150LL);
      sub_100004254(6u, "      %s (age %s%s)\n", v19, v20, v21, v22, v23, v24, *(void *)&v16->__dd_fd);
      uint64_t v16 = (DIR *)v16->__dd_seek;
    }

    while (v16);
    uint64_t v16 = v34;
    uint64_t v25 = v34;
    do
    {
      if (v6 - v25->__dd_size > v18)
      {
        snprintf(__str, 0x400uLL, "%s/%s", v17, *(const char **)&v25->__dd_fd);
        sub_100004798(__str, v26, v27, v28, v29, v30, v31, v32);
      }

      uint64_t v25 = (DIR *)v25->__dd_seek;
    }

    while (v25);
  }

  else
  {
    sub_100004254(6u, "    no dst files\n", v10, v11, v12, v13, v14, v15, v33);
  }

  asl_out_file_list_free((uint64_t)v16);
  uint64_t result = 0LL;
  *uint64_t v8 = 47;
  return result;
}

uint64_t sub_1000067D4(const char **a1, uint64_t a2, char a3, unint64_t *a4)
{
  uint64_t v7 = a1[20];
  if (a2 && *(void *)(a2 + 160)) {
    uint64_t v7 = *(const char **)(a2 + 160);
  }
  if (!a1[1]) {
    return 0xFFFFFFFFLL;
  }
  if (v7)
  {
    uint64_t v8 = asl_list_dst_files((uint64_t)a1);
    if (v8)
    {
      uint64_t v15 = (uint64_t)v8;
      uint64_t v16 = a1[4];
      if (!v16) {
        uint64_t v16 = *a1;
      }
      sub_100004254(6u, "    dst files\n", v9, v10, v11, v12, v13, v14, v38);
      uint64_t v23 = (void *)v15;
      do
      {
        sub_100004254(6u, "      %s size %lu\n", v17, v18, v19, v20, v21, v22, *v23);
        uint64_t v23 = (void *)v23[5];
      }

      while (v23);
      unint64_t v24 = 0LL;
      uint64_t v25 = v15;
      do
      {
        uint64_t v26 = *(void *)(v25 + 32);
        uint64_t v25 = *(void *)(v25 + 40);
        v24 += v26;
      }

      while (v25);
      if ((a3 & 1) == 0 && v24 > (unint64_t)v7)
      {
        uint64_t v27 = v15;
        do
        {
          snprintf(__str, 0x400uLL, "%s/%s", v16, *(const char **)v27);
          sub_100004798(__str, v28, v29, v30, v31, v32, v33, v34);
          uint64_t v35 = *(void *)(v27 + 32);
          uint64_t v27 = *(void *)(v27 + 40);
          v24 -= v35;
        }

        while (v24 > (unint64_t)v7 && v27 != 0);
      }

      if (a4) {
        *a4 = v24;
      }
      asl_out_file_list_free(v15);
    }

    else
    {
      sub_100004254(6u, "    no dst files\n", v9, v10, v11, v12, v13, v14, v38);
    }
  }

  return 0LL;
}

uint64_t sub_10000694C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10 = *(_DWORD *)(a1 + 112);
  if (a2)
  {
    if (*(_DWORD *)(a2 + 112)) {
      unsigned int v10 = *(_DWORD *)(a2 + 112);
    }
    if (*(void *)(a2 + 160)) {
      uint64_t v11 = *(void *)(a2 + 160);
    }
    else {
      uint64_t v11 = *(void *)(a1 + 160);
    }
  }

  else
  {
    uint64_t v11 = *(void *)(a1 + 160);
  }

  int v12 = *(_DWORD *)(a1 + 72);
  if ((v12 & 4) != 0)
  {
    sub_100004254(5u, "Checking file %s\n", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 8));
    sub_100004254( 5u,  "- Rename, move to destination directory, and compress as required\n",  v13,  v14,  v15,  v16,  v17,  v18,  v32);
    sub_10000610C(a1);
    if (v10 && (*(_BYTE *)(a1 + 73) & 0x80) == 0)
    {
      asl_core_time_to_str(v10, v33, 150LL);
      sub_100004254(5u, "- Check for expired files - TTL = %s\n", v25, v26, v27, v28, v29, v30, (char)v33);
      sub_100006604(a1, a2);
    }

    if (v11)
    {
      sub_100004254(5u, "- Check total storage used - MAX = %lu\n", v19, v20, v21, v22, v23, v24, v11);
      sub_1000067D4((const char **)a1, a2, 0, 0LL);
    }
  }

  else if ((v12 & 0x2000) != 0 && v10)
  {
    sub_1000054F0(a1, a2, a3, a4, a5, a6, a7, a8);
  }

  return 0LL;
}

uint64_t sub_100006A94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    int v10 = *(_DWORD *)(a2 + 72);
  }
  else {
    int v10 = 0;
  }
  sub_100004254(5u, "----------------------------------------\n", a3, a4, a5, a6, a7, a8, v28);
  uint64_t v18 = *(const char **)a1;
  if (!*(void *)a1) {
    uint64_t v18 = "asl.conf";
  }
  sub_100004254(5u, "Processing module %s\n", v12, v13, v14, v15, v16, v17, (char)v18);
  for (uint64_t i = *(void *)(a1 + 16); i; uint64_t i = *(void *)(i + 40))
  {
    if (*(_DWORD *)(i + 8) == 2)
    {
      uint64_t v26 = *(void *)(i + 24);
      if (!v10 || (*(_DWORD *)(v26 + 72) & v10) != 0) {
        sub_10000694C(v26, a2, v19, v20, v21, v22, v23, v24);
      }
    }
  }

  uint64_t v27 = *(const char **)a1;
  if (!*(void *)a1) {
    uint64_t v27 = "asl.conf";
  }
  sub_100004254(5u, "Finished processing module %s\n", v19, v20, v21, v22, v23, v24, (char)v27);
  return 0LL;
}

uint64_t sub_100006B7C(uint64_t a1)
{
  if (!dword_100010020
    && bootstrap_look_up2(bootstrap_port, "com.apple.system.logger", &dword_100010020, 0LL, 8LL))
  {
    uint64_t v4 = 0LL;
    dword_100010020 = 0;
    return v4;
  }

  uint64_t v2 = (const char *)asl_msg_to_string(a1, &size_4);
  uint64_t v12 = 0LL;
  if (v2)
  {
    unsigned int v3 = (char *)v2;
    asprintf(&v12, "1\n%s [= ASLOption control]\n", v2);
    free(v3);
  }

  else
  {
    asprintf(&v12, "1\nQ [= ASLOption control]\n");
  }

  if (!v12) {
    return 0LL;
  }
  unsigned int size = 0;
  unsigned int size_4 = strlen(v12) + 1;
  uint64_t v7 = 0LL;
  vm_address_t v11 = 0LL;
  uint64_t v4 = 0LL;
  if (!vm_allocate(mach_task_self_, &address, size_4, 1358954497))
  {
    memmove((void *)address, v12, size_4);
    free(v12);
    int v8 = 0;
    uint64_t v4 = 0LL;
    if (!_asl_server_query_2(dword_100010020, address, size_4, 0LL, 1, 0, &v11, &size, &v7, &v8))
    {
      if (v11)
      {
        uint64_t v4 = asl_msg_list_from_string();
        vm_deallocate(mach_task_self_, v11, size);
        return v4;
      }

      return 0LL;
    }
  }

  return v4;
}

uint64_t sub_100006CF4( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    int v8 = a1;
  }
  else {
    int v8 = "*";
  }
  sub_100004254(5u, "Checkpoint module %s\n", a3, a4, a5, a6, a7, a8, (char)v8);
  if (!byte_100010058)
  {
    uint64_t v9 = asl_msg_new(1LL);
    uint64_t v12 = 0LL;
    asprintf(&v12, "%s checkpoint", v8);
    asl_msg_set_key_val_op(v9, "action", v12, 1LL);
    free(v12);
    uint64_t v10 = sub_100006B7C(v9);
    asl_msg_list_release(v10);
  }

  return 0LL;
}

uint64_t sub_100006D98(int a1, uint64_t a2)
{
  if (geteuid())
  {
    if (a1) {
      int v88 = 32;
    }
    else {
      int v88 = 64;
    }
    dword_100010048 = v88;
    sub_100004254(3u, "aslmanager must be run by root\n", v4, v5, v6, v7, v8, v9, v89);
    exit(1);
  }

  uint64_t v10 = 0LL;
  __int128 v107 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v103 = 0u;
  memset(v102, 0, sizeof(v102));
  LODWORD(v103) = 604800;
  __int128 v96 = 0u;
  LODWORD(v96) = 604800;
  uint64_t v108 = 0LL;
  __int128 v106 = 0x8F0D180uLL;
  memset(v95, 0, sizeof(v95));
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v100 = 0u;
  uint64_t v101 = 0LL;
  __int128 v99 = 0x8F0D180uLL;
  if (a1 < 2) {
    goto LABEL_16;
  }
  char v11 = 0;
  uint64_t v10 = 0LL;
  int v12 = 1;
  do
  {
    uint64_t v13 = *(const char **)(a2 + 8LL * v12);
    if (!strcmp(v13, "-q") || !strcmp(v13, "-dd"))
    {
      char v11 = 1;
    }

    else
    {
      int v14 = strcmp(v13, "-s");
      uint64_t v15 = v12 + 1LL;
      if (v14) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = (int)v15 < a1;
      }
      if (v16)
      {
        uint64_t v17 = *(const char **)(a2 + 8 * v15);
        if (*v17 != 45)
        {
          *((void *)&v102[0] + 1) = strdup(v17);
          uint64_t v10 = v102;
          ++v12;
        }
      }
    }

    ++v12;
  }

  while (v12 < a1);
  if ((v11 & 1) == 0)
  {
LABEL_16:
    uint64_t v94 = 0LL;
    if (!asl_make_database_dir(0LL, 0LL) && !asl_make_database_dir("Logs", (char **)&v94))
    {
      __filename = 0LL;
      time_t v18 = time(0LL);
      asl_make_timestamp(v18, 32, __str, 0x20uLL);
      asprintf(&__filename, "%s/aslmanager.%s", (const char *)v94, __str);
      if (__filename)
      {
        qword_100010050 = (uint64_t)fopen(__filename, "w");
        if (qword_100010050) {
          dword_100010048 |= 0x10u;
        }
        free(__filename);
      }
    }

    free(v94);
  }

  uint64_t v19 = asl_out_module_init();
  uint64_t v26 = v19;
  if (v19)
  {
    uint64_t v27 = *((void *)v19 + 2);
    if (v27 && !v10)
    {
      do
      {
        uint64_t v28 = *(void *)(v27 + 24);
        if (v28
          && *(_DWORD *)(v27 + 8) == 2
          && (uint64_t v29 = *(const char **)(v28 + 8), v30 = (const char *)asl_filesystem_path(0LL), !strcmp(v29, v30)))
        {
          uint64_t v10 = *(_OWORD **)(v27 + 24);
        }

        else
        {
          uint64_t v10 = 0LL;
        }

        uint64_t v27 = *(void *)(v27 + 40);
        if (v27) {
          BOOL v31 = v10 == 0LL;
        }
        else {
          BOOL v31 = 0;
        }
      }

      while (v31);
      uint64_t v27 = *((void *)v26 + 2);
    }

    for (; v27; uint64_t v27 = *(void *)(v27 + 40))
    {
      if (*(_DWORD *)(v27 + 8) == 1 && !*(void *)v27)
      {
        char v32 = *(_BYTE **)(v27 + 16);
        if (v32)
        {
          if (*v32)
          {
            for (uint64_t i = *v32 == 61 ? v32 + 1 : *(unsigned __int8 **)(v27 + 16); ; ++i)
            {
              int v34 = *i;
              if (v34 != 32 && v34 != 9) {
                break;
              }
            }

            unsigned int v36 = (const char **)explode(i, " \t");
            if (v36)
            {
              int v37 = v36;
              unsigned int v38 = -1;
              do
                ++v38;
              while (v36[v38]);
              if (v38 >= 2)
              {
                uint64_t v39 = *v36;
                if (!strcasecmp(*v36, "aslmanager_debug"))
                {
                  sub_1000041A0((const char *)0x40, (char *)v37[1]);
                }

                else if (!strcasecmp(v39, "store_ttl"))
                {
                  *((_DWORD *)v10 + 28) = asl_core_str_to_time(v37[1], 86400LL);
                }

                else if (!strcasecmp(v39, "module_ttl"))
                {
                  asl_core_str_to_time(v37[1], 86400LL);
                }

                else if (!strcasecmp(v39, "max_store_size"))
                {
                  *((void *)v10 + 20) = asl_core_str_to_size(v37[1]);
                }

                else if (!strcasecmp(v39, "archive"))
                {
                  free(*((void **)v10 + 4));
                  *((void *)v10 + 4) = 0LL;
                  if (!strcmp(v37[1], "1"))
                  {
                    uint64_t v41 = v37[2];
                    if (!v41) {
                      uint64_t v41 = (const char *)asl_filesystem_path(1LL);
                    }
                    *((void *)v10 + 4) = strdup(v41);
                  }
                }

                else if (!strcasecmp(v39, "store_path"))
                {
                  free(*((void **)v10 + 1));
                  *((void *)v10 + 1) = strdup(v37[1]);
                }

                else if (!strcasecmp(v39, "archive_mode"))
                {
                  __int16 v40 = strtol(v37[1], 0LL, 0);
                  *((_WORD *)v10 + 58) = v40;
                  if (!v40 && *__error() == 22) {
                    *((_WORD *)v10 + 58) = 256;
                  }
                }
              }

              free_string_list((void **)v37);
            }
          }
        }
      }
    }
  }

  uint64_t v91 = (uint64_t)v26;
  if (a1 >= 2)
  {
    uint64_t v42 = 0LL;
    int v92 = 3;
    int v43 = 1;
    while (1)
    {
      uint64_t v44 = *(const char **)(a2 + 8LL * v43);
      if (!strcmp(v44, "-a"))
      {
        if (v10) {
          uint64_t v48 = v10;
        }
        else {
          uint64_t v48 = v102;
        }
        uint64_t v49 = v43 + 1LL;
        if ((int)v49 >= a1 || (uint64_t v50 = *(const char **)(a2 + 8 * v49), *v50 == 45))
        {
          uint64_t v51 = (const char *)asl_filesystem_path(1LL);
          uint64_t v52 = strdup(v51);
        }

        else
        {
          uint64_t v52 = strdup(v50);
          ++v43;
        }

        if (v10) {
          uint64_t v56 = v10;
        }
        else {
          uint64_t v56 = v102;
        }
        *((void *)v56 + 4) = v52;
        *((_WORD *)v56 + 58) = 256;
        uint64_t v10 = v48;
        goto LABEL_128;
      }

      if (!strcmp(v44, "-store_ttl"))
      {
        uint64_t v45 = v43 + 1LL;
        uint64_t v53 = *(_BYTE **)(a2 + 8 * v45);
        if (*v53 == 45) {
          goto LABEL_128;
        }
        if (!v10) {
          uint64_t v10 = v102;
        }
        int v54 = asl_core_str_to_time(v53, 86400LL);
        goto LABEL_114;
      }

      if (!strcmp(v44, "-module_ttl"))
      {
        uint64_t v45 = v43 + 1LL;
        uint64_t v55 = *(_BYTE **)(a2 + 8 * v45);
        if (*v55 == 45) {
          goto LABEL_128;
        }
        asl_core_str_to_time(v55, 86400LL);
        goto LABEL_115;
      }

      if (!strcmp(v44, "-ttl")) {
        break;
      }
      if (!strcmp(v44, "-size"))
      {
        uint64_t v45 = v43 + 1LL;
        uint64_t v58 = *(_BYTE **)(a2 + 8 * v45);
        if (*v58 == 45) {
          goto LABEL_128;
        }
        uint64_t v59 = asl_core_str_to_size(v58);
        *(void *)&__int128 v99 = v59;
        if (!v10) {
          uint64_t v10 = v102;
        }
        *((void *)v10 + 20) = v59;
        goto LABEL_115;
      }

      if (!strcmp(v44, "-checkpoint"))
      {
        int v60 = v92 | 4;
LABEL_127:
        int v92 = v60;
        goto LABEL_128;
      }

      if (!strcmp(v44, "-module"))
      {
        v92 &= ~1u;
        uint64_t v61 = v43 + 1LL;
        if (v43 + 1 < a1 && **(_BYTE **)(a2 + 8 * v61) != 45)
        {
          ++v43;
          uint64_t v42 = *(const char **)(a2 + 8 * v61);
        }

        goto LABEL_128;
      }

      if (!strcmp(v44, "-asldb"))
      {
        int v60 = 1;
        goto LABEL_127;
      }

      if (!strcmp(v44, "-d"))
      {
        if (a1 <= 2 * v43 || (uint64_t v45 = v43 + 1LL, v46 = *(char **)(a2 + 8 * v45), *v46 == 45))
        {
          int v47 = 0LL;
          goto LABEL_133;
        }

LABEL_134:
        sub_1000041A0((const char *)0x20, v46);
        goto LABEL_115;
      }

      if (!strcmp(v44, "-dd"))
      {
        byte_100010058 = 1;
        if (a1 <= 2 * v43 || (uint64_t v45 = v43 + 1LL, v46 = *(char **)(a2 + 8 * v45), *v46 == 45))
        {
          int v47 = "l7";
LABEL_133:
          sub_1000041A0((const char *)0x20, v47);
          goto LABEL_128;
        }

        goto LABEL_134;
      }

LABEL_128:
      if (++v43 >= a1) {
        goto LABEL_136;
      }
    }

    uint64_t v45 = v43 + 1LL;
    int v57 = *(_BYTE **)(a2 + 8 * v45);
    if (*v57 == 45) {
      goto LABEL_128;
    }
    int v54 = asl_core_str_to_time(v57, 86400LL);
    LODWORD(v96) = v54;
    if (!v10) {
      uint64_t v10 = v102;
    }
LABEL_114:
    *((_DWORD *)v10 + 28) = v54;
LABEL_115:
    int v43 = v45;
    goto LABEL_128;
  }

  uint64_t v42 = 0LL;
  LOBYTE(v92) = 3;
LABEL_136:
  if (v10 && !*((void *)v10 + 1))
  {
    uint64_t v62 = (const char *)asl_filesystem_path(0LL);
    *((void *)v10 + 1) = strdup(v62);
  }

  if (byte_100010058) {
    uint64_t v63 = " dryrun";
  }
  else {
    uint64_t v63 = (const char *)&unk_10000B4B7;
  }
  sub_100004254(3u, "aslmanager starting%s\n", v20, v21, v22, v23, v24, v25, (char)v63);
  if ((v92 & 1) != 0) {
    sub_1000054F0((uint64_t)v10, (uint64_t)v95, v65, v66, v67, v68, v69, v70);
  }
  if ((v92 & 2) != 0)
  {
    if ((v92 & 4) != 0) {
      sub_100006CF4(v42, v64, v65, v66, v67, v68, v69, v70);
    }
    if (v91)
    {
      uint64_t v71 = v91;
      do
      {
        if (v42)
        {
          uint64_t v72 = v95;
          uint64_t v73 = v71;
        }

        else
        {
          uint64_t v73 = v71;
          uint64_t v72 = 0LL;
        }

        sub_100006A94(v73, (uint64_t)v72, v65, v66, v67, v68, v69, v70);
LABEL_155:
        uint64_t v71 = *(void *)(v71 + 24);
      }

      while (v71);
    }
  }

  asl_out_module_free(v91);
  sub_100004254(5u, "----------------------------------------\n", v74, v75, v76, v77, v78, v79, v90);
  if (byte_100010058) {
    uint64_t v86 = " dryrun";
  }
  else {
    uint64_t v86 = (const char *)&unk_10000B4B7;
  }
  sub_100004254(3u, "aslmanager finished%s\n", v80, v81, v82, v83, v84, v85, (char)v86);
  sub_100004480();
  return 0LL;
}

void sub_100007640()
{
  if ((byte_100010028 & 1) == 0)
  {
    byte_100010028 = 1;
    uint64_t v0 = os_transaction_create("com.apple.aslmanager");
    if ((byte_100010029 & 1) != 0)
    {
      v2[0] = _NSConcreteStackBlock;
      v2[1] = 0x40000000LL;
      v2[2] = sub_100007760;
      v2[3] = &unk_10000C438;
      v2[4] = v0;
      dispatch_async((dispatch_queue_t)qword_100010060, v2);
    }

    else
    {
      byte_100010029 = 1;
      dispatch_time_t v1 = dispatch_walltime(0LL, 300000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_10000772C;
      block[3] = &unk_10000C418;
      block[4] = v0;
      dispatch_after(v1, (dispatch_queue_t)qword_100010060, block);
    }
  }

void sub_10000772C(uint64_t a1)
{
  byte_100010028 = 0;
  os_release(*(void **)(a1 + 32));
}

void sub_100007760(uint64_t a1)
{
  byte_100010028 = 0;
  os_release(*(void **)(a1 + 32));
}

uint64_t start(int a1, uint64_t a2)
{
  uint64_t v5 = 0LL;
  vproc_swap_integer(0LL, 5LL, 0LL, &v5);
  if (v5)
  {
    setiopolicy_np(0, 0, 3);
    qword_100010030 = (uint64_t)dispatch_queue_create("aslmanager", 0LL);
    qword_100010060 = (uint64_t)dispatch_queue_create("work queue", 0LL);
    signal(15, (void (__cdecl *)(int))1);
    qword_100010038 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  &_dispatch_main_q);
    dispatch_source_set_event_handler((dispatch_source_t)qword_100010038, &stru_10000C478);
    dispatch_resume((dispatch_object_t)qword_100010038);
    qword_100010040 = (uint64_t)xpc_connection_create_mach_service( "com.apple.aslmanager",  (dispatch_queue_t)qword_100010030,  1uLL);
    xpc_connection_set_event_handler((xpc_connection_t)qword_100010040, &stru_10000C4B8);
    xpc_connection_resume((xpc_connection_t)qword_100010040);
    dispatch_main();
  }

  sub_100006D98(a1, a2);
  return 0LL;
}

void sub_1000078A4(id a1)
{
}

void sub_1000078C4(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_100007944;
    handler[3] = &unk_10000C4D8;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }

void sub_100007944(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
    xpc_object_t reply = xpc_dictionary_create_reply(object);
    if (reply)
    {
      uint64_t v6 = reply;
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
      xpc_release(v6);
    }

    if (euid == geteuid()) {
      sub_100007640();
    }
  }

  else
  {
    xpc_get_type(object);
  }

char *explode(unsigned __int8 *a1, char *__s)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = a1;
  LOBYTE(v3) = *a1;
  if (!*a1) {
    return 0LL;
  }
  unsigned __int8 v5 = 0;
  uint64_t v6 = 0LL;
  do
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      if (v5)
      {
        goto LABEL_16;
      }

      else {
        char v8 = 0;
      }
      else {
        unsigned __int8 v5 = v8;
      }
LABEL_16:
      uint64_t v9 = v7 + 1;
      int v3 = v2[++v7];
      if (!v3)
      {
        size_t v10 = v9;
        uint64_t v7 = v9;
        goto LABEL_19;
      }
    }

    unsigned __int8 v5 = 0;
    size_t v10 = v7;
LABEL_19:
    size_t v11 = v10 + 1;
    int v12 = (char *)malloc(v10 + 1);
    if (!v12) {
      return 0LL;
    }
    uint64_t v13 = v12;
    if (v10) {
      memcpy(v12, v2, v10);
    }
    v13[v7] = 0;
    uint64_t v6 = (char *)sub_100007B28(v13, v6);
    free(v13);
    int v14 = &v2[v10];
    if (!v2[v10]) {
      break;
    }
    int v3 = v2[v11];
    if (!v2[v11])
    {
      uint64_t v6 = (char *)sub_100007B28((const char *)&unk_10000B4B7, v6);
      int v3 = v14[1];
    }

    uint64_t v2 = v14 + 1;
  }

  while (v3);
  return v6;
}

void *sub_100007B28(const char *a1, char *__ptr)
{
  uint64_t v2 = __ptr;
  if (a1)
  {
    if (!__ptr)
    {
      uint64_t v2 = malloc(0x10uLL);
      if (!v2) {
        return v2;
      }
      char v8 = strdup(a1);
      *uint64_t v2 = v8;
      if (v8)
      {
        v2[1] = 0LL;
        return v2;
      }

      goto LABEL_11;
    }

    uint64_t v4 = 0LL;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)&__ptr[v4 * 8];
      ++v5;
      ++v4;
    }

    while (v6);
    uint64_t v2 = reallocf(__ptr, (v4 * 8 + 8) & 0x7FFFFFFF8LL);
    if (v2)
    {
      uint64_t v7 = strdup(a1);
      v2[v4 - 1] = v7;
      if (v7)
      {
        v2[v5] = 0LL;
        return v2;
      }

LABEL_11:
      free(v2);
      return 0LL;
    }
  }

  return v2;
}

void free_string_list(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      int v3 = a1 + 1;
      do
      {
        free(v2);
        uint64_t v4 = *v3++;
        uint64_t v2 = v4;
      }

      while (v4);
    }

    free(a1);
  }

_BYTE *get_line_from_file(FILE *a1)
{
  uint64_t v1 = fgetln(a1, &v8);
  if (!v1) {
    return 0LL;
  }
  size_t v2 = v8;
  if (!v8) {
    return 0LL;
  }
  int v3 = v1;
  uint64_t v4 = malloc(v8 + 1);
  int v5 = v4;
  if (v4)
  {
    memcpy(v4, v3, v2);
    size_t v6 = v2 - 1;
    if (v5[v2 - 1] != 10) {
      size_t v6 = v2;
    }
    v5[v6] = 0;
  }

  return v5;
}

_BYTE *next_word_from_string(unsigned __int8 **a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = *a1;
  if (!*a1) {
    return 0LL;
  }
  int v2 = *v1;
  BOOL v3 = v2 == 39;
  uint64_t v4 = v2 == 39 ? v1 + 1 : *a1;
  BOOL v5 = *v4 == 34;
  size_t v6 = *v4 == 34 ? v4 + 1 : v4;
  int v7 = *v4 == 34 ? v3 + 1 : v2 == 39;
  int v8 = -(int)v1 - v7;
  uint64_t v9 = v6;
  while (1)
  {
    int64_t v10 = ((unint64_t)~(_DWORD)v6 << 32) + ((void)v9 << 32);
    for (int i = v8 + (_DWORD)v9++; ; i += 2)
    {
      int v12 = *(v9 - 1);
      if (v12 != 92) {
        break;
      }
      if (!*v9) {
        goto LABEL_30;
      }
      v9 += 2;
      v10 += 0x200000000LL;
    }

    if (!*(v9 - 1)) {
      break;
    }
    if (v12 == 39)
    {
      BOOL v3 = !v3;
    }

    else
    {
      if (v12 == 34) {
        BOOL v5 = !v5;
      }
      if (v12 == 32)
      {
        if (!v3 && !v5) {
          goto LABEL_30;
        }
      }

      else if (v12 == 9 && !v3 && !v5)
      {
        goto LABEL_30;
      }
    }
  }

  --v9;
LABEL_30:
  *a1 = v9;
  if (v2 == 34 || v2 == 39) {
    i -= v2 == v6[v10 >> 32];
  }
  if (!i) {
    return 0LL;
  }
  uint64_t v13 = malloc(i + 1);
  int v14 = v13;
  if (v13)
  {
    memcpy(v13, v6, i);
    v14[i] = 0;
  }

  return v14;
}

uint64_t asl_make_database_dir(const char *a1, char **a2)
{
  size_t v11 = 0LL;
  if (a2) {
    *a2 = 0LL;
  }
  uint64_t v4 = asl_filesystem_path(0LL);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  BOOL v5 = (char *)v4;
  if (a1)
  {
    if (strchr(a1, 47)) {
      return 0xFFFFFFFFLL;
    }
    asprintf(&v11, "%s/%s", v5, a1);
    BOOL v5 = v11;
    if (!v11) {
      return 0xFFFFFFFFLL;
    }
  }

  memset(&v10, 0, sizeof(v10));
  if (!stat(v5, &v10))
  {
    int v8 = v11;
    if ((v10.st_mode & 0xF000) == 0x4000) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }

  if (*__error() != 2)
  {
    int v8 = v11;
LABEL_15:
    free(v8);
    return 0xFFFFFFFFLL;
  }

  mode_t v6 = umask(0);
  uint64_t v7 = mkdir(v5, 0x1EDu);
  umask(v6);
  int v8 = v11;
  if ((_DWORD)v7)
  {
    free(v11);
    return v7;
  }

LABEL_12:
  if (a2)
  {
    uint64_t v7 = 0LL;
    *a2 = v8;
  }

  else
  {
    free(v8);
    return 0LL;
  }

  return v7;
}

time_t asl_make_timestamp(time_t result, char a2, char *__str, size_t __size)
{
  time_t v38 = result;
  if (__str)
  {
    if ((a2 & 4) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d-%02d-%02dT%02d:%02d:%02dZ", (v37.tm_year + 1900));
    }

    if ((a2 & 8) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d%02d%02dT%02d%02d%02dZ", (v37.tm_year + 1900));
    }

    if ((a2 & 0x10) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v6) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        uint64_t v6 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        uint64_t v7 = 45LL;
      }

      else
      {
        uint64_t v7 = 43LL;
      }

      unint64_t v10 = v6 / 0xE10uLL;
      unsigned int v11 = v6 % 0xE10;
      unsigned __int16 v12 = v6 % 0xE10;
      uint64_t v13 = v12 / 0x3Cu;
      unsigned __int16 v14 = v12 % 0x3Cu;
      uint64_t v15 = (v37.tm_year + 1900);
      uint64_t v16 = (v37.tm_mon + 1);
      uint64_t tm_hour = v37.tm_hour;
      uint64_t tm_mday = v37.tm_mday;
      if (v12 % 0x3Cu)
      {
        uint64_t v32 = v7;
        unint64_t v34 = v10;
        uint64_t tm_min = v37.tm_min;
        uint64_t tm_sec = v37.tm_sec;
        uint64_t v26 = v37.tm_mday;
        uint64_t v27 = v37.tm_hour;
        uint64_t v24 = (v37.tm_year + 1900);
        uint64_t v25 = (v37.tm_mon + 1);
        uint64_t v19 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u:%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }

      if (v11 >= 0x3C)
      {
        unint64_t v35 = v10;
        uint64_t v36 = v12 / 0x3Cu;
        uint64_t v31 = v37.tm_sec;
        uint64_t v33 = v7;
        uint64_t v29 = v37.tm_min;
        uint64_t v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u";
      }

      else
      {
        uint64_t v33 = v7;
        unint64_t v35 = v10;
        uint64_t v29 = v37.tm_min;
        uint64_t v31 = v37.tm_sec;
        uint64_t v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u";
      }
    }

    else
    {
      if ((a2 & 0x20) == 0) {
        return snprintf(__str, __size, "%c%llu");
      }
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v8) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        uint64_t v8 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        uint64_t v9 = 45LL;
      }

      else
      {
        uint64_t v9 = 43LL;
      }

      unint64_t v21 = v8 / 0xE10uLL;
      unsigned int v22 = v8 % 0xE10;
      unsigned __int16 v23 = v8 % 0xE10;
      uint64_t v13 = v23 / 0x3Cu;
      unsigned __int16 v14 = v23 % 0x3Cu;
      uint64_t v15 = (v37.tm_year + 1900);
      uint64_t v16 = (v37.tm_mon + 1);
      uint64_t tm_hour = v37.tm_hour;
      uint64_t tm_mday = v37.tm_mday;
      if (v23 % 0x3Cu)
      {
        uint64_t v32 = v9;
        unint64_t v34 = v21;
        uint64_t tm_min = v37.tm_min;
        uint64_t tm_sec = v37.tm_sec;
        uint64_t v26 = v37.tm_mday;
        uint64_t v27 = v37.tm_hour;
        uint64_t v24 = (v37.tm_year + 1900);
        uint64_t v25 = (v37.tm_mon + 1);
        uint64_t v19 = "%d%02d%02dT%02d%02d%02d%c%02u%02u%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }

      if (v22 >= 0x3C)
      {
        unint64_t v35 = v21;
        uint64_t v36 = v23 / 0x3Cu;
        uint64_t v31 = v37.tm_sec;
        uint64_t v33 = v9;
        uint64_t v29 = v37.tm_min;
        uint64_t v20 = "%d%02d%02dT%02d%02d%02d%c%02u%02u";
      }

      else
      {
        uint64_t v33 = v9;
        unint64_t v35 = v21;
        uint64_t v29 = v37.tm_min;
        uint64_t v31 = v37.tm_sec;
        uint64_t v20 = "%d%02d%02dT%02d%02d%02d%c%02u";
      }
    }

    return snprintf(__str, __size, v20, v15, v16, tm_mday, tm_hour, v29, v31, v33, v35, v36);
  }

  return result;
}

void asl_out_dst_data_release(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 168);
    if (!v2 || (int v3 = v2 - 1, (*(_DWORD *)(a1 + 168) = v3) == 0))
    {
      free(*(void **)a1);
      free(*(void **)(a1 + 8));
      free(*(void **)(a1 + 16));
      free(*(void **)(a1 + 40));
      free(*(void **)(a1 + 48));
      free(*(void **)(a1 + 32));
      free(*(void **)(a1 + 24));
      free(*(void **)(a1 + 120));
      free(*(void **)(a1 + 136));
      free((void *)a1);
    }
  }

uint64_t asl_out_dst_set_access(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if ((a1 & 0x80000000) == 0 && a2)
  {
    uid_t v4 = *(_DWORD *)(a2 + 128);
    if (v4) {
      uid_t v4 = **(_DWORD **)(a2 + 120);
    }
    if (*(_DWORD *)(a2 + 144)) {
      gid_t v5 = **(_DWORD **)(a2 + 136);
    }
    else {
      gid_t v5 = 80;
    }
    fchown(a1, v4, v5);
    return a1;
  }

  return result;
}

void asl_out_module_free(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = *(void *)(v1 + 24);
      free(*(void **)v1);
      int v3 = *(void **)(v1 + 16);
      if (v3)
      {
        do
        {
          uid_t v4 = (void *)v3[5];
          uint64_t v5 = v3[3];
          if (v5) {
            asl_out_dst_data_release(v5);
          }
          if (*v3) {
            asl_msg_release(*v3);
          }
          free((void *)v3[2]);
          free(v3);
          int v3 = v4;
        }

        while (v4);
      }

      free((void *)v1);
      uint64_t v1 = v2;
    }

    while (v2);
  }

_DWORD *asl_out_module_new(const char *a1)
{
  uint64_t v2 = calloc(1uLL, 0x20uLL);
  uint64_t result = 0LL;
  if (a1 && v2)
  {
    uid_t v4 = strdup(a1);
    *(void *)uint64_t v2 = v4;
    if (v4)
    {
      v2[2] = 1;
      return v2;
    }

    else
    {
      free(v2);
      return 0LL;
    }
  }

  return result;
}

void *asl_out_module_parse_line(uint64_t a1, char *a2)
{
  while (1)
  {
    unsigned int v4 = *a2;
    if (v4 > 0x1F) {
      break;
    }
    if (v4 != 9) {
      return 0LL;
    }
LABEL_6:
    ++a2;
  }

  if (*a2 <= 0x29u)
  {
    if (v4 != 32) {
      return 0LL;
    }
    goto LABEL_6;
  }

  if (*a2 > 0x3Du)
  {
    if (v4 != 62)
    {
      if (v4 != 63 && v4 != 81) {
        return 0LL;
      }
LABEL_20:
      if (!a1) {
        return 0LL;
      }
      uint64_t v6 = calloc(1uLL, 0x30uLL);
      if (!v6) {
        return v6;
      }
      uint64_t v9 = (const char *)sub_10000A1E8((uint64_t)a2);
      if (!v9) {
        return 0LL;
      }
      unint64_t v10 = v9;
      unsigned int v11 = strchr(v9, 32);
      if (v11 || (unsigned int v11 = strchr(v10, 9)) != 0LL)
      {
        char v12 = 0;
        char *v11 = 0;
      }

      else
      {
        char v12 = 1;
      }

      if (!strcasecmp(v10, "ignore"))
      {
        int v13 = 3;
      }

      else if (!strcasecmp(v10, "skip"))
      {
        int v13 = 4;
      }

      else if (!strcasecmp(v10, "claim"))
      {
        int v13 = 5;
      }

      else if (!strcasecmp(v10, "notify"))
      {
        int v13 = 6;
      }

      else if (!strcasecmp(v10, "file"))
      {
        int v13 = 14;
      }

      else if (!strcasecmp(v10, "asl_file"))
      {
        int v13 = 12;
      }

      else if (!strcasecmp(v10, "directory") {
             || !strcasecmp(v10, "dir")
      }
             || !strcasecmp(v10, "asl_directory")
             || !strcasecmp(v10, "asl_dir")
             || !strcasecmp(v10, "store_dir")
             || !strcasecmp(v10, "store_directory"))
      {
        int v13 = 13;
      }

      else if (!strcasecmp(v10, "control"))
      {
        int v13 = 16;
      }

      else if (!strcasecmp(v10, "save") || !strcasecmp(v10, "store"))
      {
        int v13 = 11;
      }

      else if (!strcasecmp(v10, "access"))
      {
        int v13 = 8;
      }

      else if (!strcasecmp(v10, "set"))
      {
        int v13 = 9;
      }

      else if (!strcasecmp(v10, "unset"))
      {
        int v13 = 10;
      }

      else
      {
        if (strcasecmp(v10, "broadcast"))
        {
          if (!strcasecmp(v10, "forward"))
          {
            int v13 = 15;
            goto LABEL_80;
          }

LABEL_81:
          if (*((_DWORD *)v6 + 2))
          {
            if ((v12 & 1) != 0) {
              goto LABEL_91;
            }
            for (int i = v11 + 1; ; ++i)
            {
              int v24 = *(i - 1);
              if (v24 != 32 && v24 != 9) {
                break;
              }
            }

            uint64_t v26 = sub_10000A260(i);
            *((void *)v6 + 2) = v26;
            if (v26)
            {
LABEL_91:
              *((_BYTE *)v10 - 1) = 0;
              if (*a2 == 42)
              {
                uint64_t v27 = asl_msg_new(1LL);
              }

              else
              {
                *a2 = 81;
                uint64_t v27 = asl_msg_from_string(a2);
              }

              *(void *)uint64_t v6 = v27;
              if (v27)
              {
                if (*((_DWORD *)v6 + 2) != 11) {
                  goto LABEL_108;
                }
                uint64_t v28 = (unsigned __int8 *)*((void *)v6 + 2);
                if (v28)
                {
                  if (strncmp(*((const char **)v6 + 2), "/var/log/asl", 0xCuLL))
                  {
                    *((_DWORD *)v6 + 2) = 12;
                    goto LABEL_108;
                  }

                  uint64_t v31 = a1;
                  uint64_t v30 = v28;
                }

                else
                {
                  uint64_t v30 = "/var/log/asl";
                  uint64_t v31 = a1;
                }

                uint64_t v32 = sub_100008A58(v31, v30, 493);
                if (v32) {
                  ++v32[42];
                }
                *((void *)v6 + 3) = v32;
LABEL_108:
                int v33 = *((_DWORD *)v6 + 2);
                if (v33 == 13) {
                  __int16 v34 = 493;
                }
                else {
                  __int16 v34 = 420;
                }
                unint64_t v35 = sub_100008A58(a1, *((unsigned __int8 **)v6 + 2), v34);
                if (!v35)
                {
                  *((void *)v6 + 3) = 0LL;
                  *((_DWORD *)v6 + 2) = 0;
                  return v6;
                }

                uint64_t v36 = v35;
                ++v35[42];
                *((void *)v6 + 3) = v35;
                if (*((_WORD *)v35 + 58) == 4096) {
                  *((_WORD *)v35 + 58) = v34;
                }
                int v37 = *((_DWORD *)v6 + 2);
                if (v37 == 12)
                {
LABEL_121:
                  unsigned int v39 = v36[18] | 0x1000;
                }

                else
                {
                  if (v37 == 13)
                  {
                    unsigned int v40 = v35[18];
                    unsigned int v41 = v40 & 0xFFFFDFF7 | 0x2000;
                  }

                  else
                  {
                    if (v37 == 14)
                    {
                      time_t v38 = (const char *)*((void *)v35 + 3);
                      if (v38 && !strcasecmp(v38, "asl"))
                      {
                        *((_DWORD *)v6 + 2) = 12;
                        goto LABEL_121;
                      }

LABEL_129:
                      if (!v36[32])
                      {
                        sub_10000A2FC(v36, "0");
                        uint64_t v36 = (unsigned int *)*((void *)v6 + 3);
                      }

                      if (!v36[36]) {
                        sub_10000A3A4(v36, "80");
                      }
LABEL_133:
                      uint64_t v42 = *(void *)(a1 + 16);
                      if (v42)
                      {
                        do
                        {
                          uint64_t v22 = v42;
                          uint64_t v42 = *(void *)(v42 + 40);
                        }

                        while (v42);
                        goto LABEL_135;
                      }

LABEL_136:
                      *(void *)(a1 + 16) = v6;
                      return v6;
                    }

                    unsigned int v41 = v35[18];
                  }

                  unsigned int v39 = v41 & 0xFFFFFFFB;
                }

                v36[18] = v39;
                goto LABEL_129;
              }

LABEL_99:
              free(*((void **)v6 + 2));
            }
          }

LABEL_100:
          free(v6);
          return 0LL;
        }

        int v13 = 7;
      }

LABEL_80:
      *((_DWORD *)v6 + 2) = v13;
      goto LABEL_81;
    }

    sub_100008A58(a1, (unsigned __int8 *)a2 + 1, 4096);
    return 0LL;
  }

  if (v4 == 42) {
    goto LABEL_20;
  }
  if (v4 != 61 || !a1) {
    return 0LL;
  }
  uint64_t v5 = calloc(1uLL, 0x30uLL);
  uint64_t v6 = v5;
  if (!v5) {
    return v6;
  }
  for (j = a2 + 1; ; ++j)
  {
    int v8 = *j;
    if (v8 != 39 && v8 != 32) {
      break;
    }
  }

  *((_DWORD *)v5 + 2) = 1;
  if (*j != 91)
  {
    uint64_t v17 = strchr(a2, 91);
    if (!v17)
    {
      *((void *)v6 + 2) = sub_10000A260(j);
      goto LABEL_76;
    }

    time_t v18 = v17;
    if (!strncmp(v17, "[File ", 6uLL) || !strncmp(v18, "[File\t", 6uLL))
    {
      int v19 = 17;
    }

    else if (!strncmp(v18, "[Plist ", 7uLL) || !strncmp(v18, "[Plist\t", 7uLL))
    {
      int v19 = 18;
    }

    else
    {
      if (strncmp(v18, "[Profile ", 9uLL) && strncmp(v18, "[Profile\t", 9uLL)) {
        goto LABEL_74;
      }
      int v19 = 19;
    }

    *((_DWORD *)v6 + 2) = v19;
LABEL_74:
    *((_BYTE *)v18 - 1) = 0;
    *((void *)v6 + 2) = sub_10000A260(j);
    *((_WORD *)v18 - 1) = 8273;
    a2 = (char *)(v18 - 2);
    goto LABEL_75;
  }

  unsigned __int16 v14 = (char *)sub_10000A1E8((uint64_t)a2);
  if (!v14) {
    goto LABEL_100;
  }
  uint64_t v15 = v14;
  *((void *)v6 + 2) = sub_10000A260(v14);
  if (*(v15 - 1) == 93) {
    uint64_t v16 = 0LL;
  }
  else {
    uint64_t v16 = -1LL;
  }
  v15[v16] = 0;
  *a2 = 81;
LABEL_75:
  uint64_t v20 = asl_msg_from_string(a2);
  *(void *)uint64_t v6 = v20;
  if (!v20) {
    goto LABEL_99;
  }
LABEL_76:
  uint64_t v21 = *(void *)(a1 + 16);
  if (!v21) {
    goto LABEL_136;
  }
  do
  {
    uint64_t v22 = v21;
    uint64_t v21 = *(void *)(v21 + 40);
  }

  while (v21);
LABEL_135:
  *(void *)(v22 + 40) = v6;
  return v6;
}

unsigned int *sub_100008A58(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  int v3 = 0LL;
  if (!a1 || !a2) {
    return v3;
  }
  while (1)
  {
    int v6 = *a2;
    if (v6 != 32 && v6 != 9) {
      break;
    }
    ++a2;
  }

  uint64_t v59 = a2;
  int v8 = next_word_from_string(&v59);
  __s = v8;
  if (!v8) {
    return 0LL;
  }
  uint64_t v57 = a1;
  uint64_t v9 = (void **)explode((unsigned __int8 *)v8, "/");
  uint64_t v10 = asl_string_new(0LL);
  uint64_t v11 = v10;
  BOOL v12 = 0;
  int v13 = 5;
  __int16 v56 = a3;
  if (v9 && v10)
  {
    int v14 = 5;
    while (1)
    {
      uint64_t v15 = (const char *)*v9;
      if (*v9) {
        break;
      }
      BOOL v12 = 0;
      int v16 = 0;
LABEL_33:
      free_string_list(v9);
      if (v16 != 1 || v12)
      {
        uint64_t v9 = 0LL;
        int v13 = v14;
        goto LABEL_40;
      }

      free(__s);
      __s = (char *)asl_string_release_return_bytes(v11);
      uint64_t v11 = asl_string_new(0LL);
      int v24 = explode((unsigned __int8 *)__s, "/");
      uint64_t v9 = (void **)v24;
      int v13 = v14 - 1;
      if (v14 >= 2)
      {
        if (v24)
        {
          --v14;
          if (v11) {
            continue;
          }
        }
      }

      goto LABEL_40;
    }

    int v16 = 0;
    BOOL v12 = 0;
    unsigned int v17 = 1;
    time_t v18 = (const char **)v9;
    while (strncmp(v15, "$ENV(", 5uLL))
    {
      if (v17 == 1)
      {
        if (!*(_BYTE *)*v9) {
          goto LABEL_25;
        }
        uint64_t v19 = v11;
        uint64_t v20 = v15;
      }

      else
      {
        asl_string_append_char_no_encoding(v11, 47LL);
        uint64_t v20 = *v18;
        uint64_t v19 = v11;
      }

      asl_string_append_no_encoding(v19, v20);
      if (!v12)
      {
LABEL_29:
        BOOL v12 = strcmp(*v18, "..") == 0;
        goto LABEL_30;
      }

LABEL_26:
      BOOL v12 = 1;
LABEL_30:
      time_t v18 = (const char **)&v9[v17];
      uint64_t v15 = *v18;
      ++v17;
      if (!*v18) {
        goto LABEL_33;
      }
    }

    uint64_t v21 = strchr(v15, 41);
    if (v21)
    {
      *uint64_t v21 = 0;
      uint64_t v15 = *v18;
    }

    uint64_t v22 = getenv(v15 + 5);
    if (v22)
    {
      unsigned __int16 v23 = v22;
      if (*v22 != 47) {
        asl_string_append_char_no_encoding(v11, 47LL);
      }
      asl_string_append_no_encoding(v11, v23);
      int v16 = 1;
    }

LABEL_25:
    if (!v12) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }

LABEL_40:
  free(__s);
  free_string_list(v9);
  if (v12 || !v13)
  {
    asl_string_release(v11);
    return 0LL;
  }

  unint64_t v25 = asl_string_release_return_bytes(v11);
  __s = (char *)v25;
  uint64_t v26 = v57;
  for (uint64_t i = *(void *)(v57 + 16); i; uint64_t i = *(void *)(i + 40))
  {
    if (*(_DWORD *)(i + 8) == 2)
    {
      int v3 = *(unsigned int **)(i + 24);
      if (v3)
      {
        uint64_t v28 = (const char *)*((void *)v3 + 1);
        if (v25 && v28)
        {
          if (*(_BYTE *)v25 != 47)
          {
            uint64_t v29 = strrchr(*((const char **)v3 + 1), 47);
            if (v29) {
              uint64_t v28 = v29 + 1;
            }
          }

          if (!strcmp((const char *)v25, v28))
          {
LABEL_178:
            free((void *)v25);
            return v3;
          }
        }

        else if (!(v25 | (unint64_t)v28))
        {
          goto LABEL_178;
        }
      }
    }
  }

  if (*(_BYTE *)v25 == 47)
  {
    int v30 = 8;
    if (strncmp((const char *)v25, "/var/log/", 9uLL))
    {
      else {
        int v30 = 40;
      }
    }
  }

  else
  {
    else {
      asprintf(&__s, "%s/module/%s/%s");
    }
    free((void *)v25);
    int v30 = 8;
  }

  uint64_t v31 = calloc(1uLL, 0x30uLL);
  uint64_t v32 = (unsigned int *)calloc(1uLL, 0xC8uLL);
  int v3 = v32;
  if (!v31 || !v32)
  {
    free(__s);
    free(v31);
    free(v3);
    return 0LL;
  }

  v32[42] = 1;
  int v33 = __s;
  *((void *)v32 + 1) = __s;
  __int16 v34 = strrchr(v33, 47);
  if (v34)
  {
    unint64_t v35 = v34;
    *__int16 v34 = 0;
    *(void *)int v3 = strdup(*((const char **)v3 + 1));
    *unint64_t v35 = 47;
    int v33 = __s;
  }

  *((_WORD *)v3 + 58) = v56;
  v3[28] = 604800;
  v3[18] = v30;
  uint64_t v36 = strrchr(v33, 47);
  if (v36) {
    int v37 = v36 + 1;
  }
  else {
    int v37 = v33;
  }
  time_t v38 = strrchr(v33, 46);
  if (v38)
  {
    unsigned int v39 = v38;
    *time_t v38 = 0;
    *((void *)v3 + 6) = strdup(v38 + 1);
    *((void *)v3 + 5) = strdup(v37);
    *unsigned int v39 = 46;
  }

  else
  {
    *((void *)v3 + 5) = strdup(v37);
  }

  unsigned int v41 = next_word_from_string(&v59);
  if (v41)
  {
    uint64_t v42 = v41;
    do
    {
      if (!strncasecmp(v42, "mode=", 5uLL))
      {
        *((_WORD *)v3 + 58) = strtol(v42 + 5, 0LL, 0);
      }

      else if (!strncasecmp(v42, "uid=", 4uLL))
      {
        sub_10000A2FC(v3, v42 + 4);
      }

      else if (!strncasecmp(v42, "gid=", 4uLL))
      {
        sub_10000A3A4(v3, v42 + 4);
      }

      else
      {
        if (!strncasecmp(v42, "fmt=", 4uLL))
        {
          uint64_t v44 = v42 + 4;
LABEL_109:
          *((void *)v3 + 3) = sub_10000A44C(v44);
          goto LABEL_124;
        }

        if (!strncasecmp(v42, "format=", 7uLL))
        {
          uint64_t v44 = v42 + 7;
          goto LABEL_109;
        }

        if (!strncasecmp(v42, "dest=", 5uLL))
        {
          uint64_t v45 = v42 + 5;
LABEL_112:
          *((void *)v3 + 4) = sub_10000A260(v45);
          goto LABEL_124;
        }

        if (!strncasecmp(v42, "dst=", 4uLL))
        {
          uint64_t v45 = v42 + 4;
          goto LABEL_112;
        }

        if (!strncasecmp(v42, "coalesce=", 9uLL))
        {
          if (!strncasecmp(v42 + 9, "0", 1uLL) || !strncasecmp(v42 + 9, "off", 3uLL))
          {
            v3[18] &= ~8u;
            uint64_t v26 = v57;
          }

          else
          {
            uint64_t v26 = v57;
            if (!strncasecmp(v42 + 9, "false", 5uLL))
            {
              unsigned int v43 = v3[18] & 0xFFFFFFF7;
              goto LABEL_123;
            }
          }
        }

        else
        {
          if (!strncasecmp(v42, "compress", 8uLL))
          {
            unsigned int v43 = v3[18] | 0x10;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "extern", 6uLL))
          {
            unsigned int v43 = v3[18] | 0x40;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "truncate", 8uLL))
          {
            unsigned int v43 = v3[18] | 0x80;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "dir", 3uLL))
          {
            unsigned int v43 = v3[18] | 0x2000;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "soft", 4uLL))
          {
            unsigned int v43 = v3[18] | 0x800;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "file_max=", 9uLL))
          {
            *((void *)v3 + 19) = asl_core_str_to_size(v42 + 9);
            goto LABEL_124;
          }

          if (!strncasecmp(v42, "all_max=", 8uLL))
          {
            *((void *)v3 + 20) = asl_core_str_to_size(v42 + 8);
            goto LABEL_124;
          }

          if (!strncasecmp(v42, "style=", 6uLL) || !strncasecmp(v42, "rotate=", 7uLL))
          {
            uint64_t v46 = 6LL;
            if (*v42 == 114) {
              uint64_t v46 = 7LL;
            }
LABEL_136:
            unsigned int v43 = v3[18] | 4;
LABEL_123:
            v3[18] = v43;
            goto LABEL_124;
          }

          if (!strncasecmp(v42, "rotate", 6uLL))
          {
            if (*((void *)v3 + 6)) {
              int v47 = 536870913;
            }
            else {
              int v47 = 268435457;
            }
            v3[16] = v47;
            goto LABEL_136;
          }

          if (!strncasecmp(v42, "crashlog", 8uLL))
          {
            unsigned int v43 = v3[18] & 0xFFFFFAF3 | 0x504;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "basestamp", 9uLL))
          {
            unsigned int v43 = v3[18] | 0x100;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "link", 4uLL) || !strncasecmp(v42, "symlink", 7uLL))
          {
            unsigned int v43 = v3[18] | 0x200;
            goto LABEL_123;
          }

          if (!strncasecmp(v42, "ttl", 3uLL))
          {
            uint64_t v48 = (char)v42[3];
            if (v48 == 61)
            {
              v3[28] = asl_core_str_to_time(v42 + 4, 86400LL);
              uint64_t v26 = v57;
            }

            else
            {
              uint64_t v26 = v57;
              if ((v48 & 0xFFFFFFF8) == 0x30 && v42[4] == 61) {
                v3[(v48 - 48) + 20] = asl_core_str_to_time(v42 + 5, 86400LL);
              }
            }

            goto LABEL_124;
          }

          uint64_t v26 = v57;
          if (!strncasecmp(v42, "size_only", 9uLL))
          {
            unsigned int v43 = v3[18] | 0x8000;
            goto LABEL_123;
          }
        }
      }

LABEL_124:
      free(v42);
      uint64_t v42 = next_word_from_string(&v59);
    }

    while (v42);
  }

  uint64_t v49 = (const char *)*((void *)v3 + 1);
  if (!strncasecmp(v49, "/Library/Logs/CrashReporter", 0x1BuLL)
    || !strncasecmp(v49, "/var/mobile/Library/Logs/CrashReporter", 0x26uLL)
    || !strncasecmp(v49, "/private/var/mobile/Library/Logs/CrashReporter", 0x2EuLL))
  {
    v3[18] = v3[18] & 0xFFFFFAF3 | 0x504;
  }

  unsigned int v50 = v3[28];
  for (uint64_t j = 20LL; j != 28; ++j)
  {
    unsigned int v52 = v3[j];
    if (v52 > v50)
    {
      v3[28] = v52;
      unsigned int v50 = v52;
    }
  }

  uint64_t v53 = (char *)*((void *)v3 + 3);
  if (!v53)
  {
    uint64_t v53 = strdup("std");
    *((void *)v3 + 3) = v53;
  }

  if (strcmp(v53, "std") && strcmp(v53, "bsd")) {
    v3[18] &= ~8u;
  }
  if (!strcmp(v53, "std") || !strcmp(v53, "bsd") || !strcmp(v53, "msg"))
  {
    unsigned int v54 = v3[18] | 0x4000;
    v3[18] = v54;
  }

  else
  {
    unsigned int v54 = v3[18];
  }

  if ((~v54 & 0x102) == 0)
  {
    unsigned int v54 = v54 & 0xFFFFFFFC | 1;
    v3[18] = v54;
  }

  if (!strcmp(v53, "raw")) {
    *((void *)v3 + 7) = "sec";
  }
  if (!strcmp(v49, "/var/log/asl"))
  {
    unsigned int v54 = 0x2000;
    v3[18] = 0x2000;
  }

  uint64_t v55 = *((void *)v3 + 19);
  if (!v55)
  {
    uint64_t v55 = *((void *)v3 + 20);
    *((void *)v3 + 19) = v55;
  }

  if ((v54 & 0x8000) != 0 && (!v55 || !*((void *)v3 + 20)))
  {
    v54 &= ~0x8000u;
    v3[18] = v54;
  }

  if ((~v54 & 0x8400) == 0) {
    v3[18] = v54 & 0xFFFF7FFF;
  }
  *((_DWORD *)v31 + 2) = 2;
  *((void *)v31 + 3) = v3;
  *((void *)v31 + 5) = *(void *)(v26 + 16);
  *(void *)(v26 + 16) = v31;
  return v3;
}

_DWORD *asl_out_module_init_from_file(const char *a1, FILE *a2)
{
  if (!a2) {
    return 0LL;
  }
  int v3 = asl_out_module_new(a1);
  if (v3)
  {
    line_from_file = get_line_from_file(a2);
    if (line_from_file)
    {
      uint64_t v5 = line_from_file;
      do
      {
        asl_out_module_parse_line((uint64_t)v3, v5);
        free(v5);
        uint64_t v5 = get_line_from_file(a2);
      }

      while (v5);
    }
  }

  return v3;
}

_DWORD *asl_out_module_init()
{
  *(void *)uint64_t v5 = 0LL;
  sub_100009694((DIR *)v5, "/usr/local/etc/asl", 2);
  sub_100009694((DIR *)v5, "/etc/asl", 0);
  uint64_t v0 = *(void *)v5;
  if (!sub_100009828(*(uint64_t *)v5, "com.apple.asl"))
  {
    uint64_t v2 = fopen("/etc/asl.conf", "r");
    if (v2)
    {
      int v3 = v2;
      unsigned int v4 = asl_out_module_init_from_file("com.apple.asl", v2);
      fclose(v3);
      uint64_t v0 = *(void *)v5;
      if (v4)
      {
        *((void *)v4 + 3) = *(void *)v5;
        return v4;
      }
    }

    else
    {
      return *(_DWORD **)v5;
    }
  }

  return (_DWORD *)v0;
}

DIR *sub_100009694(DIR *result, char *a2, int a3)
{
  if (result && a2)
  {
    p_dd_fd = (uint64_t *)&result->__dd_fd;
    uint64_t v6 = *(void *)&result->__dd_fd;
    if (*(void *)&result->__dd_fd)
    {
      do
      {
        uint64_t v7 = (_DWORD *)v6;
        uint64_t v6 = *(void *)(v6 + 24);
      }

      while (v6);
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    uint64_t result = opendir(a2);
    if (result)
    {
      int v8 = result;
      uint64_t v9 = "%s/%s";
      while (1)
      {
        uint64_t v10 = readdir(v8);
        if (!v10) {
          break;
        }
        d_name = v10->d_name;
        if (v10->d_name[0] != 46 && !sub_100009828(*p_dd_fd, d_name))
        {
          BOOL v12 = v9;
          snprintf(__str, 0x400uLL, v9, a2, d_name);
          int v13 = fopen(__str, "r");
          if (v13 && (int v14 = v13, v15 = asl_out_module_init_from_file(d_name, v13), fclose(v14), v15))
          {
            v15[2] |= a3;
            int v16 = strcmp(d_name, "com.apple.asl");
            uint64_t v17 = *p_dd_fd;
            if (v16)
            {
              if (v17) {
                *((void *)v7 + 3) = v15;
              }
              else {
                uint64_t *p_dd_fd = (uint64_t)v15;
              }
            }

            else
            {
              *((void *)v15 + 3) = v17;
              uint64_t *p_dd_fd = (uint64_t)v15;
              if (v7) {
                uint64_t v15 = v7;
              }
            }
          }

          else
          {
            uint64_t v15 = v7;
          }

          uint64_t v7 = v15;
          uint64_t v9 = v12;
        }
      }

      return (DIR *)closedir(v8);
    }
  }

  return result;
}

uint64_t sub_100009828(uint64_t a1, char *__s2)
{
  uint64_t result = 0LL;
  if (a1 && __s2)
  {
    while (!*(void *)a1 || strcmp(*(const char **)a1, __s2))
    {
      a1 = *(void *)(a1 + 24);
      if (!a1) {
        return 0LL;
      }
    }

    return a1;
  }

  return result;
}

void asl_out_file_list_free(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      free(*(void **)v1);
      uint64_t v2 = *(void *)(v1 + 40);
      free((void *)v1);
      uint64_t v1 = v2;
    }

    while (v2);
  }

uint64_t _check_file_name(const char *a1, char *__s, const char *a3, int a4, uint64_t a5, char **a6)
{
  uint64_t result = 0LL;
  if (!a1) {
    return result;
  }
  if (!__s) {
    return result;
  }
  uint64_t result = strlen(__s);
  if (!result) {
    return result;
  }
  size_t v13 = result;
  if (a3)
  {
    size_t v14 = strlen(a3);
    if (!a6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  size_t v14 = 0LL;
  if (a6) {
LABEL_6:
  }
    *a6 = 0LL;
LABEL_7:
  if (strncmp(a1, __s, v13)) {
    return 0LL;
  }
  uint64_t v15 = strrchr(a1, 46);
  int v16 = v15;
  if (v15) {
    BOOL v17 = strcmp(v15, ".gz") == 0;
  }
  else {
    BOOL v17 = 0;
  }
  time_t v18 = &a1[v13];
  if ((a4 & 0x10000000) == 0)
  {
    if ((a4 & 0x20000000) == 0)
    {
      if ((a4 & 0x40000000) == 0 || *v18 != 46) {
        return 0LL;
      }
      uint64_t v19 = v18 + 1;
      if (strncmp(v18 + 1, a3, v14) || (v19 += v14, uint64_t result = a5, *v19))
      {
        uint64_t v20 = v17 ? &v16[-v14] : v16 + 1;
        int v24 = strncmp(v20, a3, v14);
        uint64_t result = v24 == 0;
        if (a6)
        {
          if (!v24)
          {
            unsigned __int16 v23 = v19;
            goto LABEL_35;
          }
        }
      }

      return result;
    }

    if (*v18 != 46) {
      return 0LL;
    }
    uint64_t v21 = v18 + 1;
    if (strncmp(v18 + 1, a3, v14)) {
      return 0LL;
    }
    time_t v18 = &v21[v14];
  }

  uint64_t result = a5;
  if (*v18)
  {
    if (*v18 != 46) {
      return 0LL;
    }
    uint64_t v22 = v18 + 1;
    uint64_t result = v22 != v16;
    if (a6)
    {
      if (v22 != v16)
      {
        unsigned __int16 v23 = v22;
LABEL_35:
        unint64_t v25 = strdup(v23);
        *a6 = v25;
        uint64_t v26 = strchr(v25, 46);
        if (v26) {
          *uint64_t v26 = 0;
        }
        return 1LL;
      }
    }
  }

  return result;
}

uint64_t _parse_stamp_style(uint64_t result, char a2, int *a3, time_t *a4)
{
  if (!result) {
    return result;
  }
  uint64_t v5 = (const char *)result;
  if (*(_BYTE *)result == 84)
  {
    uint64_t v6 = (const char *)(result + 1);
    int v7 = atoi((const char *)(result + 1));
    if (v7 || !strcmp(v6, "0"))
    {
      if (a4) {
        *a4 = v7;
      }
      return 1LL;
    }

    return 0xFFFFFFFFLL;
  }

  uint64_t v10 = 0LL;
  do
  {
    int v11 = *(unsigned __int8 *)(result + v10);
    if (!*(_BYTE *)(result + v10)) {
      goto LABEL_13;
    }
    ++v10;
  }

  while ((v11 - 48) < 0xA);
  if (strcmp((const char *)(result + v10), ".gz"))
  {
    memset(&v20, 0, sizeof(v20));
    if ((a2 & 0x14) != 0)
    {
      int v12 = sscanf( v5,  "%d-%d-%dT%d:%d:%d%c%u:%u:%u",  &v20.tm_year,  &v20.tm_mon,  (unint64_t)&v20 | 0xC,  &v20.tm_hour);
    }

    else
    {
      if ((a2 & 0x28) == 0) {
        return 0xFFFFFFFFLL;
      }
      int v12 = sscanf( v5,  "%4d%2d%2dT%2d%2d%2d%c%2u%2u%2u",  &v20.tm_year,  &v20.tm_mon,  (unint64_t)&v20 | 0xC,  &v20.tm_hour);
    }

    if (v12 < 6) {
      return 0xFFFFFFFFLL;
    }
    if (v12 == 6)
    {
      int v13 = 0;
      int v14 = 74;
LABEL_28:
      *(int32x2_t *)&v20.tm_mon = vadd_s32(*(int32x2_t *)&v20.tm_mon, (int32x2_t)0xFFFFF894FFFFFFFFLL);
      v20.tm_sec += v13;
      v20.tm_isdst = -1;
      if ((v14 & 0xFFFFFFDF) == 0x4A) {
        time_t v15 = mktime(&v20);
      }
      else {
        time_t v15 = timegm(&v20);
      }
      if (a4) {
        *a4 = v15;
      }
      return 3LL;
    }

    int v14 = v19;
    if (v19 == 45 || v19 == 43)
    {
      int v13 = 0;
      if (v19 == 43) {
        int v13 = 0;
      }
      goto LABEL_28;
    }

    if (v19 - 65 > 0x19)
    {
      if (v19 <= 0x69u)
      {
        int v16 = -349200;
        goto LABEL_41;
      }

      if (v19 == 106 || v19 > 0x6Du)
      {
        if (v19 > 0x79u)
        {
          int v13 = 0;
          int v14 = 122;
          goto LABEL_28;
        }

        int v17 = -3600;
        int v18 = 392400;
      }

      else
      {
        int v17 = 3600;
        int v18 = -349200;
      }
    }

    else
    {
      if (v19 <= 0x49u)
      {
        int v16 = -234000;
LABEL_41:
        int v13 = v16 + 3600 * (char)v19 + 3600;
        goto LABEL_28;
      }

      if (v19 == 74 || v19 > 0x4Du)
      {
        if (v19 > 0x59u)
        {
          int v13 = 0;
          int v14 = 90;
          goto LABEL_28;
        }

        int v17 = -3600;
        int v18 = 277200;
      }

      else
      {
        int v17 = 3600;
        int v18 = -234000;
      }
    }

    int v13 = v18 + (char)v19 * v17;
    goto LABEL_28;
  }

DIR *asl_list_log_files(char *a1, char *a2, const char *a3, int a4, uint64_t a5)
{
  uint64_t result = 0LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = opendir(a1);
      if (result)
      {
        int v11 = result;
        int v12 = readdir(result);
        if (v12)
        {
          uint64_t v32 = 0LL;
          if ((a4 & 1) != 0) {
            int v13 = 1;
          }
          else {
            int v13 = 2;
          }
          if ((a4 & 0x3C) != 0) {
            int v14 = 3;
          }
          else {
            int v14 = 0;
          }
          if ((a4 & 3) == 0) {
            int v13 = v14;
          }
          int v31 = v13;
          while (1)
          {
            int v33 = 0LL;
            d_name = v12->d_name;
            unsigned int v36 = -1;
            time_t v35 = 0LL;
            int v16 = _parse_stamp_style((uint64_t)v33, a4, (int *)&v36, &v35);
            free(v33);
            if (v16 == -1) {
              goto LABEL_47;
            }
            snprintf(__str, 0x400uLL, "%s/%s", a1, d_name);
            memset(&v34, 0, sizeof(v34));
            int v17 = lstat(__str, &v34);
            if (!v17 && (v34.st_mode & 0xF000) == 0xA000) {
              goto LABEL_47;
            }
            BOOL v18 = v16 == 0;
            if (v16 == 1) {
              BOOL v18 = a5;
            }
            if (!v18 && v16 != v31) {
              goto LABEL_47;
            }
            unsigned __int8 v19 = a1;
            tm v20 = calloc(1uLL, 0x38uLL);
            if (!v20)
            {
              asl_out_file_list_free(v32);
              return 0LL;
            }

            uint64_t v21 = v20;
            *tm v20 = strdup(d_name);
            *((_DWORD *)v21 + 2) = v16;
            time_t v22 = v35;
            v21[2] = v35;
            unsigned int v23 = v36;
            *((_DWORD *)v21 + 6) = v36;
            if (v17) {
              break;
            }
            v21[4] = v34.st_size;
            uint64_t v24 = v32;
            if (v16 != 2) {
              goto LABEL_34;
            }
            __darwin_time_t tv_sec = v34.st_birthtimespec.tv_sec;
            v21[2] = v34.st_birthtimespec.tv_sec;
            if (tv_sec)
            {
LABEL_28:
              if (v24) {
                goto LABEL_29;
              }
              goto LABEL_43;
            }

            v21[2] = v34.st_mtimespec.tv_sec;
            if (v32)
            {
LABEL_29:
              if (v23 != -1)
              {
                uint64_t v26 = v24;
                if (v23 <= *(_DWORD *)(v24 + 24))
                {
                  do
                  {
                    uint64_t v27 = (void *)v26;
                    uint64_t v26 = *(void *)(v26 + 40);
                    if (!v26)
                    {
                      v27[5] = v21;
                      uint64_t v29 = v21;
                      uint64_t v21 = v27;
                      goto LABEL_45;
                    }
                  }

                  while (v23 <= *(_DWORD *)(v26 + 24));
                  v21[5] = v26;
                  v27[5] = v21;
                  v21[6] = v27;
LABEL_40:
                  uint64_t v29 = (void *)v21[5];
                  goto LABEL_45;
                }
              }

LABEL_36:
              v21[5] = v24;
              uint64_t v29 = (void *)v24;
              uint64_t v32 = (uint64_t)v21;
LABEL_45:
              v29[6] = v21;
              goto LABEL_46;
            }

LABEL_43:
            uint64_t v32 = (uint64_t)v21;
LABEL_46:
            a1 = v19;
LABEL_47:
            int v12 = readdir(v11);
            if (!v12) {
              goto LABEL_50;
            }
          }

          uint64_t v24 = v32;
          if (v16 == 2) {
            goto LABEL_28;
          }
LABEL_34:
          if (v24)
          {
            uint64_t v28 = v24;
            if (v22 < *(void *)(v24 + 16)) {
              goto LABEL_36;
            }
            while (1)
            {
              int v30 = (void *)v28;
              uint64_t v28 = *(void *)(v28 + 40);
              if (!v28) {
                break;
              }
              if (v22 < *(void *)(v28 + 16))
              {
                v21[5] = v28;
                v30[5] = v21;
                v21[6] = v30;
                goto LABEL_40;
              }
            }

            v30[5] = v21;
            uint64_t v29 = v21;
            uint64_t v21 = v30;
            goto LABEL_45;
          }

          goto LABEL_43;
        }

        uint64_t v32 = 0LL;
LABEL_50:
        closedir(v11);
        return (DIR *)v32;
      }
    }
  }

  return result;
}

DIR *asl_list_src_files(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(const char **)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  int v3 = *(char **)(a1 + 40);
  if (!v3) {
    return 0LL;
  }
  if ((*(_DWORD *)(a1 + 72) & 0x40) != 0)
  {
    memset(&v13, 0, sizeof(v13));
    int v8 = 0LL;
    if (!stat(v2, &v13) && (v13.st_mode & 0xF000) == 0x8000)
    {
      if (v13.st_size)
      {
        int v8 = calloc(1uLL, 0x38uLL);
        if (v8)
        {
          uint64_t v9 = *(const char **)(a1 + 8);
          uint64_t v10 = strrchr(v9, 47);
          int v11 = v10 ? v10 + 1 : v9;
          *int v8 = strdup(v11);
          __darwin_time_t tv_sec = v13.st_birthtimespec.tv_sec;
          v8[2] = v13.st_birthtimespec.tv_sec;
          if (!tv_sec) {
            v8[2] = v13.st_mtimespec.tv_sec;
          }
        }
      }
    }

    return (DIR *)v8;
  }

  if ((*(_DWORD *)(a1 + 72) & 0x110) == 0x100 && *(void *)(a1 + 32) == 0LL) {
    return 0LL;
  }
  int v5 = *(_DWORD *)(a1 + 64);
  if ((v5 & 2) != 0) {
    unsigned int v6 = v5 & 0xFFFFFFFC | 1;
  }
  else {
    unsigned int v6 = *(_DWORD *)(a1 + 64);
  }
  return asl_list_log_files(*(char **)a1, v3, *(const char **)(a1 + 48), v6, 1LL);
}

DIR *asl_list_dst_files(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  if (!*(void *)(a1 + 8)) {
    return 0LL;
  }
  uint64_t v1 = *(char **)(a1 + 40);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = *(char **)(a1 + 32);
  if (!v2) {
    uint64_t v2 = *(char **)a1;
  }
  return asl_list_log_files(v2, v1, *(const char **)(a1 + 48), *(_DWORD *)(a1 + 64), 0LL);
}

uint64_t sub_10000A1E8(uint64_t result)
{
  if (result)
  {
    do
    {
      while (1)
      {
        int v2 = *(unsigned __int8 *)++result;
        int v1 = v2;
        if (v2 <= 31) {
          break;
        }
        if (v1 != 32)
        {
          if (v1 != 91) {
            return result;
          }
          do
          {
            int v3 = *(unsigned __int8 *)(result + 1);
            if (v3 == 92)
            {
              int v4 = *(unsigned __int8 *)(result + 2);
              BOOL v5 = v4 == 93;
              if (v4 == 93) {
                uint64_t v6 = 3LL;
              }
              else {
                uint64_t v6 = 2LL;
              }
              int v3 = *(unsigned __int8 *)(result + v6);
              if (v5) {
                result += 3LL;
              }
              else {
                result += 2LL;
              }
            }

            else
            {
              ++result;
            }
          }

          while (v3 != 93);
        }
      }
    }

    while (v1 == 9);
    if (!v1) {
      return 0LL;
    }
  }

  return result;
}

_BYTE *sub_10000A260(char *__s)
{
  if (!__s) {
    return 0LL;
  }
  for (uint64_t i = __s; ; ++i)
  {
    int v2 = *(unsigned __int8 *)i;
    if (v2 != 32 && v2 != 9) {
      break;
    }
  }

  size_t v4 = strlen(i);
  if (!v4) {
    return 0LL;
  }
  size_t v5 = v4;
  while (1)
  {
    int v6 = i[v5 - 1];
    if (v6 != 32 && v6 != 9) {
      break;
    }
    if (!--v5) {
      return 0LL;
    }
  }

  uint64_t v10 = malloc(v5 + 1);
  int v8 = v10;
  if (v10)
  {
    memcpy(v10, i, v5);
    v8[v5] = 0;
  }

  return v8;
}

_DWORD *sub_10000A2FC(_DWORD *result, char *a2)
{
  if (result && a2)
  {
    int v2 = result;
    int pw_uid = atoi(a2);
    if (pw_uid == 501)
    {
      size_t v4 = getpwnam("mobile");
      if (v4) {
        int pw_uid = v4->pw_uid;
      }
      else {
        int pw_uid = 501;
      }
    }

    int v5 = v2[32];
    uint64_t result = (_DWORD *)*((void *)v2 + 15);
    if (v5)
    {
      uint64_t v6 = v2[32];
      int v7 = (int *)*((void *)v2 + 15);
      while (1)
      {
        int v8 = *v7++;
        if (v8 == pw_uid) {
          break;
        }
        if (!--v6) {
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
      uint64_t result = reallocf(result, 4LL * (v5 + 1));
      *((void *)v2 + 15) = result;
      if (result)
      {
        uint64_t v9 = v2[32];
        v2[32] = v9 + 1;
        result[v9] = pw_uid;
      }

      else
      {
        v2[32] = 0;
      }
    }
  }

  return result;
}

_DWORD *sub_10000A3A4(_DWORD *result, char *a2)
{
  if (result && a2)
  {
    int v2 = result;
    int pw_gid = atoi(a2);
    if (pw_gid == 501)
    {
      size_t v4 = getpwnam("mobile");
      if (v4) {
        int pw_gid = v4->pw_gid;
      }
      else {
        int pw_gid = 501;
      }
    }

    int v5 = v2[36];
    uint64_t result = (_DWORD *)*((void *)v2 + 17);
    if (v5)
    {
      uint64_t v6 = v2[36];
      int v7 = (int *)*((void *)v2 + 17);
      while (1)
      {
        int v8 = *v7++;
        if (v8 == pw_gid) {
          break;
        }
        if (!--v6) {
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
      uint64_t result = reallocf(result, 4LL * (v5 + 1));
      *((void *)v2 + 17) = result;
      if (result)
      {
        uint64_t v9 = v2[36];
        v2[36] = v9 + 1;
        result[v9] = pw_gid;
      }

      else
      {
        v2[36] = 0;
      }
    }
  }

  return result;
}

const char *sub_10000A44C(const char *result)
{
  if (!result) {
    return result;
  }
  int v1 = result;
  size_t v2 = strlen(result);
  size_t v3 = v2;
  if (v2 >= 2)
  {
    int v4 = *(unsigned __int8 *)v1;
    if (v4 != 39 && v4 != 34 || v1[v2 - 1] != v4)
    {
LABEL_8:
      uint64_t v5 = 0LL;
      uint64_t v6 = 0LL;
      do
      {
        if (v1[v6] == 92) {
          ++v5;
        }
        ++v6;
      }

      while (v3 != v6);
      char v7 = 0;
      goto LABEL_14;
    }

    ++v1;
    size_t v3 = v2 - 2;
  }

  if (v3) {
    goto LABEL_8;
  }
  uint64_t v5 = 0LL;
  char v7 = 1;
LABEL_14:
  uint64_t result = (const char *)malloc(v3 - v5 + 1);
  if (result)
  {
    uint64_t v8 = 0LL;
    if ((v7 & 1) == 0)
    {
      do
      {
        int v10 = *(unsigned __int8 *)v1++;
        char v9 = v10;
        if (v10 != 92) {
          result[v8++] = v9;
        }
        --v3;
      }

      while (v3);
    }

    result[v8] = 0;
  }

  return result;
}

uint64_t sub_10000A51C(uint64_t a1, const char *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (*a2 == 46)
  {
    int v4 = a2;
  }

  else
  {
    int v10 = *(const char **)(a1 + 40);
    if (!v10) {
      return 0xFFFFFFFFLL;
    }
    size_t v11 = strlen(*(const char **)(a1 + 40));
    if (strncmp(a2, v10, v11) || (int v4 = &a2[v11], a2[v11] != 46))
    {
      int v12 = sub_10000A6C0((uint64_t)a2);
      *(_DWORD *)(a1 + 64) = v12;
      if (v12)
      {
        int v13 = v12;
        uint64_t result = 0LL;
        if (*(void *)(a1 + 48)) {
          int v14 = 0x20000000;
        }
        else {
          int v14 = 0x10000000;
        }
        int v15 = v14 | v13;
        goto LABEL_26;
      }

      return 0xFFFFFFFFLL;
    }
  }

  uint64_t v5 = v4 + 1;
  for (uint64_t i = v4 + 2; ; ++i)
  {
    unsigned int v7 = *((unsigned __int8 *)i - 1);
    if (v7 <= 0x1F)
    {
      if (*(i - 1)) {
        BOOL v8 = v7 == 9;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
LABEL_24:
        int v16 = sub_10000A6C0((uint64_t)v5);
        *(_DWORD *)(a1 + 64) = v16;
        if (!v16) {
          return 0xFFFFFFFFLL;
        }
        int v17 = v16;
        uint64_t result = 0LL;
        int v15 = v17 | 0x10000000;
        goto LABEL_26;
      }

      continue;
    }

    if (v7 == 32) {
      goto LABEL_24;
    }
    if (v7 == 46) {
      break;
    }
  }

  BOOL v18 = *(const char **)(a1 + 48);
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  size_t v19 = strlen(*(const char **)(a1 + 48));
  if (strncmp(v5, v18, v19) || v5[v19] != 46)
  {
    if (!strncmp(i, v18, v19))
    {
      int v22 = sub_10000A6C0((uint64_t)v5);
      *(_DWORD *)(a1 + 64) = v22;
      if (v22)
      {
        int v23 = v22;
        uint64_t result = 0LL;
        int v15 = v23 | 0x40000000;
        goto LABEL_26;
      }
    }

    return 0xFFFFFFFFLL;
  }

  int v20 = sub_10000A6C0((uint64_t)i);
  *(_DWORD *)(a1 + 64) = v20;
  if (!v20) {
    return 0xFFFFFFFFLL;
  }
  int v21 = v20;
  uint64_t result = 0LL;
  int v15 = v21 | 0x20000000;
LABEL_26:
  *(_DWORD *)(a1 + 64) = v15;
  return result;
}

uint64_t sub_10000A6C0(uint64_t result)
{
  if (!result) {
    return result;
  }
  for (unint64_t i = 0LL; ; ++i)
  {
    int v2 = *(unsigned __int8 *)(result + i);
    if (i > 0xA) {
      goto LABEL_9;
    }
LABEL_8:
    *((_BYTE *)&v9 + i) = v2;
  }

  if (i <= 0xA && v2 == 45) {
    goto LABEL_8;
  }
LABEL_9:
  *((_BYTE *)&v9 + i) = 0;
  if ((_DWORD)v9 == 6514035 || v9 == 0x73646E6F636573LL) {
    return 1LL;
  }
  if ((_DWORD)v9 == 761492597 && WORD2(v9) == 98) {
    return 8LL;
  }
  BOOL v5 = (_DWORD)v9 == 1633906540 && WORD2(v9) == 108;
  if (v5 || (_DWORD)v9 == 7103340) {
    return 16LL;
  }
  if (v9 == 0x622D6C61636F6CLL) {
    return 32LL;
  }
  if ((_DWORD)v9 == 762078060 && WORD2(v9) == 98) {
    return 32LL;
  }
  if (v9 == 0x61622D6C61636F6CLL && v10 == 6515059) {
    return 32LL;
  }
  return 2 * ((v9 ^ 0x65636E6575716573LL | v10) == 0);
}

uint64_t _asl_server_query_2( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, void *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  int v19 = 1;
  uint64_t v20 = a2;
  int v21 = 16777473;
  int v22 = a3;
  NDR_record_t v23 = NDR_record;
  int v24 = a3;
  uint64_t v25 = a4;
  int v26 = a5;
  int v27 = a6;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x7900000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v14 = mach_msg(&msg, 3, 0x48u, 0x4Cu, reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v14)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v15 = 4294966988LL;
      }

      else if (msg.msgh_id == 221)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996LL;
          if (v19 == 1 && msg.msgh_size == 68 && !msg.msgh_remote_port && HIBYTE(v21) == 1)
          {
            int v16 = v22;
            if (v22 == v24)
            {
              uint64_t v15 = 0LL;
              *a7 = v20;
              *a8 = v16;
              *a9 = v25;
              *a10 = v26;
              return v15;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v15 = 4294966996LL;
          if (HIDWORD(v20))
          {
            if (msg.msgh_remote_port) {
              uint64_t v15 = 4294966996LL;
            }
            else {
              uint64_t v15 = HIDWORD(v20);
            }
          }
        }

        else
        {
          uint64_t v15 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v15 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v15;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v15;
}