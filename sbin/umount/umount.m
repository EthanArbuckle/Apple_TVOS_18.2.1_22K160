void start(int a1, char **a2)
{
  int v4;
  const char **v5;
  int v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  char *v10;
  char **v11;
  char *v12;
  FILE *v13;
  int *v14;
  unint64_t v15;
  pid_t v16;
  statfs *v17;
  v4 = 0;
  v5 = 0LL;
  while (1)
  {
    while (1)
    {
      v6 = getopt(a1, a2, "AaFfh:t:v");
      if (v6 > 101) {
        break;
      }
      if (v6 <= 69)
      {
        if (v6 != 65)
        {
          if (v6 == -1 && (v7 = optind, (v4 != 0) == (optind == a1)))
          {
            if (qword_100008018 && !v5) {
              v5 = (const char **)makevfslist("nfs");
            }
            if ((dword_100008014 & 0x80000) != 0)
            {
              v16 = getpid();
              if (sysctlbyname("vfs.generic.noremotehang", 0LL, 0LL, &v16, 4uLL))
              {
                if (dword_100008020) {
                  warn("sysctl vfs.generic.noremotehang");
                }
              }
            }

            if (v4 == 2)
            {
              v8 = getmntinfo(&v17, 2);
              if (!v8)
              {
                warn("getmntinfo");
                v9 = 1;
                goto LABEL_33;
              }

              if (v8 >= 2)
              {
                v9 = 0;
                v15 = v8 + 1LL;
                do
                {
                  if (!checkvfsname(v17[(v15 - 2)].f_fstypename, v5)
                    && sub_100002D48(v17[(v15 - 2)].f_mntonname, v5))
                  {
                    v9 = 1;
                  }

                  --v15;
                }

                while (v15 > 2);
                goto LABEL_33;
              }

              goto LABEL_53;
            }

            if (v4 != 1)
            {
              v10 = a2[v7];
              if (v10)
              {
                v9 = 0;
                v11 = &a2[v7 + 1];
                do
                {
                  v12 = *v11++;
                  v10 = v12;
                }

                while (v12);
LABEL_33:
                exit(v9);
              }

LABEL_53:
              v9 = 0;
              goto LABEL_33;
            }

            if (setfsent())
            {
              v9 = sub_100003350(v5);
              goto LABEL_33;
            }

            v13 = __stderrp;
            v14 = __error();
            strerror(*v14);
            fprintf(v13, "Can't get filesystem checklist: %s\n");
          }

          else
          {
LABEL_34:
            fprintf(__stderrp, "usage: %s\n       %s\n");
          }

          exit(1);
        }

LABEL_15:
        v4 = 2;
      }

      else if (v6 == 70)
      {
        dword_100008010 = 1;
      }

      else
      {
        if (v6 != 97) {
          goto LABEL_34;
        }
        v4 = 1;
      }
    }

    if (v6 > 115)
    {
      if (v6 == 118)
      {
        dword_100008020 = 1;
      }

      else
      {
        if (v6 != 116) {
          goto LABEL_34;
        }
        if (v5) {
          errx(1, "only one -t option may be specified.");
        }
        v5 = (const char **)makevfslist(optarg);
      }
    }

    else
    {
      if (v6 != 102)
      {
        if (v6 != 104) {
          goto LABEL_34;
        }
        qword_100008018 = (uint64_t)optarg;
        goto LABEL_15;
      }

      dword_100008014 = 0x80000;
    }
  }
}

uint64_t sub_100002D48(char *a1, const char **a2)
{
  v4 = (char *)sub_100003468(a1, 0, &__s1);
  v5 = a1;
  if (!v4 && (v5 = (char *)sub_100003468(a1, 1, &__s1), (v4 = a1) == 0LL) || !v5)
  {
    v5 = (char *)&v45;
    if (!realpath_DARWIN_EXTSN(a1, (char *)&v45))
    {
      v5 = a1;
      if (dword_100008020)
      {
        warn("realpath(%s)", (const char *)&v45);
        v5 = a1;
      }
    }

    if (stat(v5, &v46) < 0)
    {
      if (dword_100008020) {
        warn("stat(%s)", v5);
      }
      uint64_t v7 = sub_100003468(v5, 0, &__s1);
      if (v7) {
        goto LABEL_25;
      }
    }

    else
    {
      int v6 = v46.st_mode & 0xF000;
      if (v6 != 0x4000)
      {
        if (v6 != 24576)
        {
          warnx("%s: not a directory or special device", v5);
          if (v5)
          {
LABEL_17:
            if (!strcmp(v5, a1)) {
              goto LABEL_113;
            }
          }

LABEL_27:
          uint64_t v10 = sub_100003468(a1, 0, &__s1);
          if (v10)
          {
            v4 = (char *)v10;
            goto LABEL_29;
          }

          uint64_t v30 = sub_100003468(a1, 1, &__s1);
          if (v30)
          {
            v5 = (char *)v30;
            v4 = a1;
            goto LABEL_30;
          }

LABEL_113:
          warnx("%s: not currently mounted", a1);
          return 1LL;
        }

        uint64_t v7 = sub_100003468(v5, 0, &__s1);
        if (!v7)
        {
          if (v5) {
            goto LABEL_17;
          }
          goto LABEL_27;
        }

LABEL_25:
        v4 = (char *)v7;
        goto LABEL_30;
      }
    }

    v4 = v5;
    v5 = (char *)sub_100003468(v5, 1, &__s1);
    if (v5) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }

  if ((dword_100008014 & 0x80000) == 0)
  {
LABEL_29:
    v5 = a1;
    goto LABEL_30;
  }

  memset(&v46.st_ino, 0, 40);
  *(void *)&v46.st_dev = 1018212795LL;
  memset(v45.__opaque, 0, sizeof(v45.__opaque));
  v45.__sig = 850045863LL;
  *(void *)v39 = v4;
  int v40 = 0;
  v41 = &v46;
  v42 = &v45;
  v38.tv_sec = time(0LL) + 10;
  v38.tv_nsec = 0LL;
  if (!pthread_create(&v43, 0LL, (void *(__cdecl *)(void *))sub_100003654, v39) && !pthread_mutex_lock(&v45))
  {
    if (v40)
    {
      pthread_mutex_unlock(&v45);
    }

    else
    {
      do
        int v8 = pthread_cond_timedwait((pthread_cond_t *)&v46, &v45, &v38);
      while (!(v40 | v8));
      int v9 = v8;
      pthread_mutex_unlock(&v45);
      if (v9)
      {
        *__error() = v9;
        warn("pthread_cond_timeout failed; continuing with unmount");
      }
    }
  }

LABEL_30:
  if (qword_100008018)
  {
    int v12 = strncmp("ftp://", v5, 6uLL);
    int v13 = strcmp(__s1, "nfs");
    uint64_t v14 = 0LL;
    if (!v12)
    {
      uint64_t v15 = 0LL;
      goto LABEL_82;
    }

    uint64_t v15 = 0LL;
    if (v13) {
      goto LABEL_82;
    }
    if (*v5 == 91)
    {
      v16 = 0LL;
      v17 = 0LL;
      v18 = v5;
LABEL_37:
      v19 = v18 + 1;
      while (1)
      {
        BOOL v20 = (*v19 & 0x80000000) == 0 && _DefaultRuneLocale.__runetype[*v19] & 0x10000;
        int v21 = *v19;
        if (v21 != 58 && !v20) {
          break;
        }
        ++v19;
        if (v21 == 58)
        {
          v18 = v19 - 1;
          if (!v16) {
            v16 = v19 - 1;
          }
          if (!v17)
          {
            int v24 = *v19;
            v23 = v19 - 1;
            if (v24 == 47) {
              v17 = v23;
            }
            else {
              v17 = 0LL;
            }
            v18 = v23;
          }

          goto LABEL_37;
        }
      }

      if (v21 == 93 && v19[1] == 58)
      {
        char *v19 = 0;
        v25 = v5 + 1;
        int v26 = inet_pton(30, v5 + 1, v39);
        char *v19 = 93;
        if (v26) {
          goto LABEL_81;
        }
      }
    }

    else
    {
      v16 = 0LL;
      v17 = 0LL;
      v19 = v5;
    }

    int v27 = *v19;
    if (*v19)
    {
      while (!v16 || !v17)
      {
        if (v27 == 58)
        {
          if (!v16) {
            v16 = v19;
          }
          if (!v17)
          {
            if (v19[1] == 47) {
              v17 = v19;
            }
            else {
              v17 = 0LL;
            }
          }
        }

        int v28 = *++v19;
        int v27 = v28;
        if (!v28) {
          goto LABEL_69;
        }
      }

      v19 = v17;
    }

    else
    {
LABEL_69:
      if (v16) {
        v29 = v16;
      }
      else {
        v29 = v19;
      }
      if (v17) {
        v19 = v17;
      }
      else {
        v19 = v29;
      }
      if (!((unint64_t)v17 | (unint64_t)v16))
      {
        uint64_t v14 = 0LL;
        uint64_t v15 = 0LL;
        goto LABEL_82;
      }
    }

    v25 = v5;
LABEL_81:
    unsigned __int8 v31 = *v19;
    char *v19 = 0;
    uint64_t v15 = (uint64_t)getipnodebyname(v25, 2, 0, v39);
    uint64_t v14 = (uint64_t)getipnodebyname(v25, 30, 0, v39);
    char *v19 = v31;
LABEL_82:
    if (qword_100008018) {
      BOOL v32 = (v15 | v14) == 0;
    }
    else {
      BOOL v32 = 1;
    }
    if (v32) {
      goto LABEL_87;
    }
    if (sub_1000036C0(v15))
    {
      BOOL v34 = 1;
      if (!v15) {
        goto LABEL_95;
      }
    }

    else
    {
      BOOL v34 = sub_1000036C0(v14) != 0;
      if (!v15)
      {
LABEL_95:
        if (v14) {
          freehostent((hostent *)v14);
        }
        if (!v34) {
          return 1LL;
        }
        goto LABEL_87;
      }
    }

    freehostent((hostent *)v15);
    goto LABEL_95;
  }

LABEL_87:
  if (dword_100008020) {
    printf("%s unmount from %s\n", v5, v4);
  }
  if (dword_100008010 || (unmount(v4, dword_100008014) & 0x80000000) == 0) {
    return 0LL;
  }
  if (getuid() || *__error() != 70 && *__error() != 2 && (dword_100008014 & 0x80000) == 0)
  {
    if (*__error() == 16)
    {
      v35 = __stderrp;
      v36 = __error();
      v37 = strerror(*v36);
      fprintf(v35, "umount(%s): %s -- try 'diskutil unmount'\n", v4, v37);
      return 1LL;
    }

LABEL_110:
    warn("unmount(%s)", v4);
    return 1LL;
  }

  if (dword_100008020) {
    warn("unmount(%s)", v4);
  }
  if ((sub_10000378C(v4, dword_100008014) & 0x80000000) != 0) {
    goto LABEL_110;
  }
  return 0LL;
}

BOOL sub_100003350(const char **a1)
{
  v2 = getfsent();
  if (!v2) {
    return 0LL;
  }
  v3 = v2;
  while (1)
  {
    fs_file = v3->fs_file;
    if (strcmp(fs_file, "/"))
    {
      fs_type = v3->fs_type;
      if (!strcmp(fs_type, "rw") || !strcmp(fs_type, "ro") || !strcmp(fs_type, "rq")) {
        break;
      }
    }

    v3 = getfsent();
    if (!v3) {
      return 0LL;
    }
  }

  size_t v7 = strlen(fs_file) + 1;
  int v8 = (char *)malloc(v7);
  if (!v8) {
    sub_100003B28();
  }
  int v9 = v8;
  strlcpy(v8, fs_file, v7);
  int v10 = sub_100003350(a1);
  BOOL v6 = (sub_100002D48(v9, a1) | v10) != 0;
  free(v9);
  return v6;
}

uint64_t sub_100003468(char *__s2, int a2, void *a3)
{
  if (qword_100008000)
  {
    int v6 = dword_100008008;
  }

  else
  {
    int v6 = getmntinfo((statfs **)&qword_100008000, 2);
    dword_100008008 = v6;
    if (!v6)
    {
      warn("getmntinfo");
      return 0LL;
    }
  }

  if (v6 < 1) {
    return 0LL;
  }
  uint64_t v7 = qword_100008000;
  __s = __s2 + 5;
  uint64_t v8 = v6 + 1LL;
  while (1)
  {
    unsigned int v9 = v8 - 2;
    if (a2 == 1) {
      break;
    }
    if (!a2)
    {
      unsigned int v10 = v8 - 2;
      v11 = (const char *)(v7 + 2168LL * v9 + 1112);
      if (!strcmp(v11, __s2)
        || !strncmp(__s2, "/dev/", 5uLL)
        && (int v12 = strstr(v11, "://")) != 0LL
        && (int v13 = v12, strlen(v12) >= 4)
        && (uint64_t v14 = v13 + 3, (v15 = strchr(v14, 47)) != 0LL)
        && (v16 = v15, size_t v17 = strlen(__s), v17 == v16 - v14)
        && !strncmp(v14, __s, v17))
      {
        if (a3)
        {
          *a3 = v7 + 2168LL * v10 + 72;
          uint64_t v7 = qword_100008000;
        }

        return v7 + 2168LL * v10 + 88;
      }
    }

LABEL_17:
  }

  unsigned int v18 = v8 - 2;
  if (a3)
  {
    *a3 = v7 + 2168LL * v18 + 72;
    uint64_t v7 = qword_100008000;
  }

  return v7 + 2168LL * v18 + 1112;
}

uint64_t sub_100003654(uint64_t a1)
{
  int v4 = 2;
  fsctl(*(const char **)a1, 0x80044101uLL, &v4, 0);
  v2 = *(pthread_mutex_t **)(a1 + 24);
  pthread_mutex_lock(v2);
  *(_DWORD *)(a1 + 8) = 1;
  pthread_cond_signal(*(pthread_cond_t **)(a1 + 16));
  pthread_mutex_unlock(v2);
  return 0LL;
}

uint64_t sub_1000036C0(uint64_t a1)
{
  v1 = (const char *)qword_100008018;
  if (qword_100008018)
  {
    if (!a1) {
      return 0LL;
    }
    v3 = *(const char **)a1;
    if (strcasecmp((const char *)qword_100008018, *(const char **)a1))
    {
      int v4 = strchr(v3, 46);
      if (!v4
        || (char *v4 = 0, v1 = (const char *)qword_100008018, strcasecmp((const char *)qword_100008018, *(const char **)a1)))
      {
        v5 = *(const char ***)(a1 + 8);
        int v6 = *v5;
        if (*v5)
        {
          uint64_t v7 = v5 + 1;
          while (strcasecmp(v1, v6))
          {
            uint64_t v8 = strchr(v6, 46);
            if (v8)
            {
              *uint64_t v8 = 0;
              v1 = (const char *)qword_100008018;
            }

            unsigned int v9 = *v7++;
            int v6 = v9;
            if (!v9) {
              return 0LL;
            }
          }

          return 1LL;
        }

        return 0LL;
      }
    }
  }

  return 1LL;
}

uint64_t sub_10000378C(char *a1, int a2)
{
  int v5 = a2;
  if ((sub_100003804(a1, &v4) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (dword_100008020) {
    printf("attempting to unmount %s by fsid\n", a1);
  }
  return sub_1000038B8(65538, &v4, 0LL, 0LL, (uint64_t)&v5, 4LL);
}

uint64_t sub_100003804(char *__s2, void *a2)
{
  uint64_t v4 = qword_100008000;
  if (qword_100008000)
  {
    unsigned int v5 = dword_100008008;
  }

  else
  {
    unsigned int v5 = getmntinfo((statfs **)&qword_100008000, 2);
    dword_100008008 = v5;
    if (!v5)
    {
      warn("getmntinfo");
      return 0xFFFFFFFFLL;
    }

    uint64_t v4 = qword_100008000;
  }

  unsigned int v6 = v5 + 1;
  uint64_t v7 = (const char *)(v4 + 2168LL * v5 - 2080);
  while ((int)--v6 >= 1)
  {
    uint64_t v8 = v7 - 2168;
    int v9 = strcmp(v7, __s2);
    uint64_t v7 = v8;
    if (!v9)
    {
      uint64_t result = 0LL;
      *a2 = *((void *)v8 + 266);
      return result;
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_1000038B8(int a1, void *a2, void *a3, size_t *a4, uint64_t a5, uint64_t a6)
{
  size_t v20 = 14LL;
  if (sysctlnametomib("vfs.generic.ctlbyfsid", v21, &v20) == -1)
  {
    warn("sysctlnametomib(%s)", "vfs.generic.ctlbyfsid");
    return 0xFFFFFFFFLL;
  }

  else
  {
    int v12 = v20;
    v21[v20] = a1;
    *(_OWORD *)&v15[4] = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v19 = 0LL;
    int v14 = 1;
    *(void *)uint64_t v15 = *a2;
    *(void *)&v15[12] = a5;
    *(void *)&__int128 v16 = a6;
    return sysctl(v21, v12 + 1, a3, a4, &v14, 0x50uLL);
  }

uint64_t checkvfsname(char *__s1, const char **a2)
{
  v2 = a2;
  if (a2)
  {
    v3 = *a2;
    if (*v2)
    {
      unsigned int v5 = v2 + 1;
      while (strcmp(__s1, v3))
      {
        unsigned int v6 = *v5++;
        v3 = v6;
        if (!v6) {
          goto LABEL_6;
        }
      }

      LOBYTE(v2) = byte_10000800C;
    }

    else
    {
LABEL_6:
      LOBYTE(v2) = byte_10000800C ^ 1;
    }
  }

  return v2 & 1;
}

void *makevfslist(const char *a1)
{
  if (!a1) {
    return 0LL;
  }
  v1 = a1;
  if (strchr(a1, 47)) {
    sub_100003B04();
  }
  if (*v1 == 110 && v1[1] == 111)
  {
    v1 += 2;
    byte_10000800C = 1;
  }

  int v2 = 0;
  for (i = v1; *i == 44; ++i)
  {
    ++v2;
LABEL_11:
    ;
  }

  if (*i) {
    goto LABEL_11;
  }
  uint64_t v4 = malloc(8LL * (v2 + 2));
  unsigned int v5 = v4;
  if (v4)
  {
    void *v4 = v1;
    unsigned int v6 = strchr(v1, 44);
    uint64_t v7 = 1LL;
    if (v6)
    {
      do
      {
        *unsigned int v6 = 0;
        uint64_t v8 = v6 + 1;
        uint64_t v9 = v7 + 1;
        v5[v7] = v8;
        unsigned int v6 = strchr(v8, 44);
        uint64_t v7 = v9;
      }

      while (v6);
      uint64_t v7 = v9;
    }

    v5[v7] = 0LL;
  }

  else
  {
    warn(0LL);
  }

  return v5;
}

void sub_100003B04()
{
  *__error() = 22;
  err(1, "invalid fstype");
}

void sub_100003B28()
{
}