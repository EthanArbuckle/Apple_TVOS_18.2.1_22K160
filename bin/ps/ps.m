uint64_t sub_10000316C()
{
  const char *v0;
  int v1;
  const char *v2;
  char **v3;
  int v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  const char *v8;
  int v9;
  const char *v10;
  char *v11;
  uint64_t __key;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  v0 = off_10000C000[0];
  if (*off_10000C000[0])
  {
    v1 = 0;
    v2 = (const char *)&unk_1000076FA;
    v3 = off_10000C058;
    do
    {
      v4 = strlen(v0);
      v5 = (uint64_t)*(v3 - 9);
      if (!v5
        || (v17 = 0u,
            v18 = 0u,
            v15 = 0u,
            v16 = 0u,
            v14 = 0u,
            __key = v5,
            bsearch(&__key, off_10000C000, 0x59uLL, 0x58uLL, (int (__cdecl *)(const void *, const void *))sub_10000328C)))
      {
        v6 = v1 + v4 + 1;
        v7 = v6 <= dword_10000E128;
        if (v6 <= dword_10000E128) {
          v8 = v2;
        }
        else {
          v8 = "\n";
        }
        if (v7) {
          v9 = v1 + v4 + 1;
        }
        else {
          v9 = v4;
        }
        if (dword_10000E128) {
          v10 = v8;
        }
        else {
          v10 = v2;
        }
        if (dword_10000E128) {
          v1 = v9;
        }
        printf("%s%s", v10, v0);
        v2 = " ";
      }

      v11 = *v3;
      v3 += 11;
      v0 = v11;
    }

    while (*v11);
  }

  return putchar(10);
}

uint64_t sub_10000328C(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void sub_100003298(const char *a1, uint64_t a2)
{
  v3 = strdup(a1);
  v4 = v3;
  __stringp = v3;
  if (v3)
  {
    v5 = v3;
    do
    {
      if (!*v5) {
        break;
      }
      while (1)
      {
        v6 = strsep(&__stringp, " \t,\n");
        if (!v6) {
          break;
        }
        if (*v6)
        {
          v7 = sub_1000033CC(v6, a2, (const char **)&__s1);
          if (v7)
          {
            v8 = v7;
            if ((_DWORD)a2 || !sub_100006BE4(v7))
            {
              v9 = malloc(0x18uLL);
              if (!v9) {
                sub_100007148();
              }
              v10 = v9;
              v9[1] = v8[1];
              if (__s1)
              {
                v11 = strdup(__s1);
                __s1 = v11;
                if (v11) {
                  v10[1] = v11;
                }
              }

              v12 = malloc(0x58uLL);
              v10[2] = v12;
              if (!v12) {
                sub_100007148();
              }
              __int128 v13 = *((_OWORD *)v8 + 1);
              _OWORD *v12 = *(_OWORD *)v8;
              v12[1] = v13;
              __int128 v14 = *((_OWORD *)v8 + 2);
              __int128 v15 = *((_OWORD *)v8 + 3);
              __int128 v16 = *((_OWORD *)v8 + 4);
              *((void *)v12 + 10) = v8[10];
              v12[3] = v15;
              v12[4] = v16;
              v12[2] = v14;
              void *v10 = 0LL;
              *off_10000DEC8 = v10;
              off_10000DEC8 = (_UNKNOWN **)v10;
            }
          }

          break;
        }
      }

      v5 = __stringp;
    }

    while (__stringp);
  }

  free(v4);
  if (!off_10000DEC0) {
    sub_100007128();
  }
}

const char **sub_1000033CC(const char *a1, uint64_t a2, const char **a3)
{
  v6 = strchr(a1, 61);
  v7 = v6;
  if (v6)
  {
    char *v6 = 0;
    v7 = v6 + 1;
  }

  __key = a1;
  v8 = (const char **)bsearch( &__key,  off_10000C000,  0x59uLL,  0x58uLL,  (int (__cdecl *)(const void *, const void *))sub_10000328C);
  v9 = v8;
  if (v8)
  {
    v10 = v8[2];
    if (v10)
    {
      if (v7)
      {
        size_t v11 = strlen(v8[2]);
        size_t v12 = v11 + strlen(v7) + 2;
        __int128 v13 = (char *)malloc(v12);
        snprintf(v13, v12, "%s=%s", v10, v7);
        __int128 v14 = v13;
      }

      else
      {
        __int128 v14 = (char *)v8[2];
      }

      sub_100003298(v14, a2);
      return 0LL;
    }
  }

  else
  {
    warnx("%s: keyword not found", a1);
    dword_10000E138 = 1;
  }

  if (a3) {
    *a3 = v7;
  }
  return v9;
}

uint64_t sub_1000034D8()
{
  *(void *)v3 = 0x1800000006LL;
  size_t v2 = 8LL;
  int v0 = sysctl(v3, 2u, &qword_10000E100, &v2, 0LL, 0LL);
  uint64_t result = 1LL;
  if (v0 != -1)
  {
    dword_10000E108 = 100;
    dword_10000E10C = 1;
    return 0LL;
  }

  return result;
}

void sub_100003578()
{
  int v0 = &off_10000DEC0;
  while (1)
  {
    int v0 = (_UNKNOWN **)*v0;
    if (!v0) {
      break;
    }
    if (*(_BYTE *)v0[1])
    {
      v1 = off_10000DEC0;
      if (off_10000DEC0)
      {
        do
        {
          if ((*(_BYTE *)(v1[2] + 24LL) & 2) != 0)
          {
            if (*v1) {
              printf("%-*s");
            }
            else {
              printf("%s");
            }
          }

          else
          {
            printf("%*s");
          }

          if (!*v1) {
            break;
          }
          putchar(32);
          v1 = (void *)*v1;
        }

        while (v1);
      }

      putchar(10);
      return;
    }
  }
}

char *sub_10000365C(uint64_t a1, int a2, int a3)
{
  if (dword_10000E114)
  {
    if (!dword_10000E11C || dword_10000E118 != 0) {
      return strdup((const char *)&unk_1000076FA);
    }
  }

  if (*(_BYTE *)(*(void *)a1 + 36LL) == 5)
  {
    int v8 = asprintf(&v35, "<defunct>");
  }

  else
  {
    *(void *)&__size[1] = 0x800000001LL;
    size_t v36 = 4LL;
    if (sysctl(&__size[1], 2u, __size, &v36, 0LL, 0LL) != -1)
    {
      size_t v9 = __size[0];
      v10 = malloc(__size[0]);
      if (v10)
      {
        size_t v11 = v10;
        *(void *)&__size[1] = 0x3100000001LL;
        __size[3] = *(_DWORD *)(*(void *)a1 + 40LL);
        size_t v36 = v9;
        if (sysctl(&__size[1], 3u, v10, &v36, 0LL, 0LL) != -1)
        {
          __int128 v13 = (const char *)(v11 + 1);
          int v12 = *v11;
          size_t v14 = v36;
          __int128 v15 = (char *)v11 + v36;
          if ((uint64_t)v36 >= 5)
          {
            do
            {
              if (!*v13) {
                break;
              }
              ++v13;
            }

            while (v13 < v15);
          }

          if (v13 != v15)
          {
            if (v13 < v15)
            {
              int64_t v16 = (char *)v11 + v36 - v13;
              while (!*v13)
              {
                ++v13;
                if (!--v16)
                {
                  __int128 v13 = (char *)v11 + v36;
                  break;
                }
              }
            }

            if (v13 != v15)
            {
              v17 = 0LL;
              int v18 = 0;
              v19 = v13;
              if (v12 >= 1 && v13 < v15)
              {
                uint64_t v20 = 0LL;
                int v18 = 0;
                v17 = 0LL;
                int v21 = 0;
                while (1)
                {
                  if (!v13[v20])
                  {
                    if (v17)
                    {
                      char *v17 = 32;
                      if (!a3) {
                        goto LABEL_50;
                      }
                    }

                    else
                    {
                      int v18 = v20;
                      if (!a3)
                      {
LABEL_50:
                        v17 = (char *)&v13[v20];
                        goto LABEL_52;
                      }
                    }

                    ++v21;
                    size_t v14 = v36;
                    v17 = (char *)&v13[v20];
                  }

                  ++v20;
                  if (v21 >= v12 || &v13[v20] >= (const char *)v11 + v14)
                  {
                    v19 = &v13[v20];
                    break;
                  }
                }
              }

              if (a3 && dword_10000E110)
              {
                if (getuid())
                {
                  int v22 = *(_DWORD *)(*(void *)a1 + 392LL);
                  uid_t v23 = getuid();
                  size_t v24 = v36;
                  if (v22 == v23 && v19 < (const char *)v11 + v36)
                  {
                    do
                    {
LABEL_44:
                      v26 = v17;
                      if (!*v19)
                      {
                        v17 = (char *)v19;
                        if (v26)
                        {
                          if (v19 == v26 + 1)
                          {
                            v17 = v26;
                            break;
                          }

                          char *v26 = 32;
                          size_t v24 = v36;
                          v17 = (char *)v19;
                        }
                      }

                      ++v19;
                    }

                    while (v19 < (const char *)v11 + v24);
                  }
                }

                else
                {
                  size_t v24 = v36;
                }
              }

LABEL_52:
              if (v17 && v17 != v13)
              {
                int v27 = asprintf(&v35, "%s", v13);
                free(v11);
                goto LABEL_58;
              }
            }
          }
        }

        free(v11);
      }
    }

    int v8 = asprintf(&v35, "(%s)");
  }

  int v27 = v8;
  int v18 = v8;
LABEL_58:
  if (!dword_10000E130)
  {
    v28 = v35;
LABEL_64:
    if (a2) {
      goto LABEL_68;
    }
    goto LABEL_65;
  }

  v28 = &v35[v27 - 1];
  if (v27 < 2) {
    goto LABEL_64;
  }
  while (*v28 != 47)
  {
    if (--v28 <= v35) {
      goto LABEL_64;
    }
  }

  ++v28;
  if (a2) {
    goto LABEL_68;
  }
LABEL_65:
  v29 = &v28[v18];
  int v31 = *v29;
  v30 = v29 + 1;
  if (v31) {
    v28 = v30;
  }
  else {
    v28 += v18;
  }
LABEL_68:
  size_t v32 = strlen(v28);
  v33 = (char *)malloc((4 * v32) | 1);
  if (!v33) {
    sub_100007160();
  }
  v34 = v33;
  strvis(v33, v28, 88);
  free(v35);
  return v34;
}

void sub_100003A68(uint64_t a1, void *a2, int a3, int a4, int a5)
{
  uint64_t v7 = a2[2];
  int v8 = sub_10000365C(a1, a3, a4);
  size_t v9 = v8;
  if (*a2)
  {
    printf("%-*.*s", *(__int16 *)(v7 + 48), *(__int16 *)(v7 + 48), v8);
  }

  else if (dword_10000E128)
  {
    int v10 = *(__int16 *)(v7 + 48) - dword_10000E13C + dword_10000E128;
    if (v10 < 1 || a5 != 0) {
      int v10 = *(__int16 *)(v7 + 48);
    }
    if (v10 >= 1)
    {
      int v12 = v10 + 1;
      __int128 v13 = v8;
      do
      {
        int v14 = *v13;
        if (!*v13) {
          break;
        }
        ++v13;
        putchar(v14);
        --v12;
      }

      while (v12 > 1);
    }
  }

  else
  {
    fputs(v8, __stdoutp);
  }

  free(v9);
}

size_t sub_100003B4C(uint64_t a1)
{
  v1 = sub_10000365C(a1, 1, dword_10000E130 == 0);
  size_t v2 = strlen(v1);
  free(v1);
  return v2;
}

size_t sub_100003B98(uint64_t a1)
{
  v1 = sub_10000365C(a1, 1, 1);
  size_t v2 = strlen(v1);
  free(v1);
  return v2;
}

size_t sub_100003BD4(uint64_t a1)
{
  v1 = sub_10000365C(a1, 1, 0);
  size_t v2 = strlen(v1);
  free(v1);
  return v2;
}

void sub_100003C10(uint64_t a1, void *a2)
{
  sub_100003A68(a1, a2, 1, dword_10000E130 == 0, 0);
}

void sub_100003C30(uint64_t a1, void *a2)
{
}

void sub_100003C40(uint64_t a1, void *a2)
{
}

uint64_t sub_100003C50(uint64_t a1, uint64_t a2)
{
  return printf("%-*s", *(__int16 *)(*(void *)(a2 + 16) + 48LL), (const char *)(*(void *)a1 + 243LL));
}

uint64_t sub_100003C88(uint64_t a1, uint64_t a2)
{
  int v2 = *(__int16 *)(*(void *)(a2 + 16) + 48LL);
  v3 = getpwuid(*(__int16 *)(*(void *)a1 + 420LL));
  if (v3) {
    pw_name = v3->pw_name;
  }
  else {
    pw_name = "UNKNOWN";
  }
  if (!*pw_name) {
    pw_name = "-";
  }
  return printf("%-*s", v2, pw_name);
}

uint64_t sub_100003CF4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!dword_10000E114)
  {
    uint64_t v4 = *a1;
    int v5 = *(char *)(*a1 + 36);
    if (v5 == 5)
    {
      char v6 = 90;
    }

    else if (v5 == 4)
    {
      char v6 = 84;
    }

    else
    {
      char v6 = aRusith[*((int *)a1 + 85)];
    }

    char v14 = v6;
    int v9 = *(_DWORD *)(v4 + 32);
    int v10 = *(char *)(v4 + 242);
    if (v10 < 0)
    {
      char v11 = 60;
    }

    else
    {
      if (!v10)
      {
        int v12 = &v15;
        if ((v9 & 0x800) == 0)
        {
LABEL_16:
          if ((v9 & 0x10) != 0) {
            *v12++ = 86;
          }
          if ((v9 & 0x200) != 0) {
            *v12++ = 76;
          }
          if ((*(_BYTE *)(*a1 + 612) & 2) != 0) {
            *v12++ = 115;
          }
          if ((v9 & 2) != 0 && *(_DWORD *)(*a1 + 564) == *(_DWORD *)(*a1 + 576)) {
            *v12++ = 43;
          }
          char *v12 = 0;
          goto LABEL_29;
        }

LABEL_15:
        *v12++ = 88;
        goto LABEL_16;
      }

      char v11 = 78;
    }

    int v12 = v16;
    char v15 = v11;
    if ((v9 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  if (dword_10000E11C)
  {
    uint64_t v3 = a1[57] + 60LL * dword_10000E118;
    char v14 = aRusith[(int)sub_100006C9C(*(unsigned int *)(v3 + 24), *(unsigned int *)(v3 + 36))];
    char v15 = 0;
LABEL_29:
    int v7 = *(__int16 *)(v2 + 48);
    int v8 = &v14;
    return printf("%-*s", v7, v8);
  }

  int v7 = *(__int16 *)(v2 + 48);
  int v8 = " ";
  return printf("%-*s", v7, v8);
}

  char v6 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
  {
    sub_100006C28(a1);
    char v6 = *(_DWORD *)a1;
  }

  st_rdev = v10.st_rdev;
  int v8 = *(void *)(a1 + 32);
  *(_DWORD *)a1 = v6 + 1;
  *(_DWORD *)(v8 + 4LL * v6) = st_rdev;
  return 1LL;
}

uint64_t sub_100003EAC()
{
  if (dword_10000E114 && dword_10000E11C) {
    return printf("%*d%c");
  }
  else {
    return printf("%*d");
  }
}

uint64_t sub_100003FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (dword_10000E114)
  {
    if (!dword_10000E11C || dword_10000E118 != 0) {
      return printf("%-*s", *(__int16 *)(v2 + 48), " ");
    }
  }

  int v5 = *(__int16 *)(v2 + 48);
  char v6 = user_from_uid(*(_DWORD *)(*(void *)a1 + 420LL), 0);
  return printf("%-*s", v5, v6);
}

size_t sub_100004038(uint64_t a1)
{
  v1 = user_from_uid(*(_DWORD *)(*(void *)a1 + 420LL), 0);
  return strlen(v1);
}

uint64_t sub_10000405C(uint64_t a1, uint64_t a2)
{
  int v2 = *(__int16 *)(*(void *)(a2 + 16) + 48LL);
  uint64_t v3 = user_from_uid(*(_DWORD *)(*(void *)a1 + 392LL), 0);
  return printf("%-*s", v2, v3);
}

size_t sub_1000040A4(uint64_t a1)
{
  v1 = user_from_uid(*(_DWORD *)(*(void *)a1 + 392LL), 0);
  return strlen(v1);
}

uint64_t sub_1000040C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  unsigned int v3 = *(_DWORD *)(*(void *)a1 + 572LL);
  if (v3 == -1) {
    return printf("%*s", *(__int16 *)(v2 + 48), "??");
  }
  snprintf(__str, 0x10uLL, "%d/%d", HIBYTE(v3), v3 & 0xFFFFFF);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_100004178(uint64_t a1)
{
  if (dword_10000E114)
  {
    if (!dword_10000E11C || dword_10000E118 != 0) {
      return printf("%*s ");
    }
  }

  dev_t v2 = *(_DWORD *)(*(void *)a1 + 572LL);
  if (v2 == -1) {
    return printf("%*s ");
  }
  unsigned int v3 = devname(v2, 0x2000u);
  if (!v3) {
    return printf("%*s ");
  }
  uint64_t v4 = v3;
  if (strncmp(v3, "tty", 3uLL)) {
    strncmp(v4, "cua", 3uLL);
  }
  return printf("%*.*s%c");
}

uint64_t sub_100004294(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  dev_t v3 = *(_DWORD *)(*(void *)a1 + 572LL);
  uint64_t v4 = "??";
  if (v3 != -1)
  {
    int v5 = devname(v3, 0x2000u);
    if (v5) {
      uint64_t v4 = v5;
    }
  }

  return printf("%-*s", *(__int16 *)(v2 + 48), v4);
}

uint64_t sub_1000042F4(time_t **a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (dword_10000DE98 < 0) {
    dword_10000DE98 = *nl_langinfo(4) != 0;
  }
  time_t v11 = **a1;
  uint64_t v4 = localtime(&v11);
  uint64_t v5 = qword_10000E120 - **a1;
  if (v5 > 86399)
  {
    if ((unint64_t)v5 > 0x93A7F)
    {
      int v9 = "%e%b%y";
      goto LABEL_11;
    }

    int v6 = dword_10000DE98;
    int v7 = "%a%I%p";
    int v8 = "%a%H  ";
  }

  else
  {
    int v6 = dword_10000DE98;
    int v7 = "%l:%M%p";
    int v8 = "%k:%M  ";
  }

  if (v6) {
    int v9 = v7;
  }
  else {
    int v9 = v8;
  }
LABEL_11:
  strftime(v12, 0x64uLL, v9, v4);
  return printf("%-*s", *(__int16 *)(v3 + 48), v12);
}

uint64_t sub_100004428(time_t **a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  time_t v5 = **a1;
  uint64_t v3 = localtime(&v5);
  strftime(v6, 0x63uLL, "%c", v3);
  return printf("%-*s", *(__int16 *)(v2 + 48), v6);
}

char *sub_1000044BC(void **a1)
{
  __darwin_time_t v2 = v5.tv_sec - **a1;
  if (v2 < 8640001)
  {
    if (v2 <= 86400)
    {
      if (v2 < 3601) {
        asprintf(&v4, "%02ld:%02ld");
      }
      else {
        asprintf(&v4, "%02ld:%02ld:%02ld");
      }
    }

    else
    {
      asprintf(&v4, "%02ld-%02ld:%02ld:%02ld");
    }
  }

  else
  {
    asprintf(&v4, "%ld-%02ld:%02ld:%02ld");
  }

  return v4;
}

void sub_1000046B0(void **a1, uint64_t a2)
{
  uint64_t v3 = sub_1000044BC(a1);
  printf("%*s", *(__int16 *)(*(void *)(a2 + 16) + 48LL), v3);
  free(v3);
}

size_t sub_1000046F8(void **a1)
{
  v1 = sub_1000044BC(a1);
  size_t v2 = strlen(v1);
  free(v1);
  return v2;
}

uint64_t sub_10000472C(uint64_t a1)
{
  if (!*(void *)(*(void *)a1 + 96LL)) {
    return printf("%-*s");
  }
  if (*(void *)(*(void *)a1 + 104LL)) {
    return printf("%-*.*s");
  }
  return printf("%-*lx");
}

uint64_t sub_1000047A4(uint64_t a1, uint64_t a2)
{
  return printf("%*lu", *(__int16 *)(*(void *)(a2 + 16) + 48LL), *(void *)(a1 + 364) >> 10);
}

uint64_t sub_1000047E0(uint64_t a1, uint64_t a2)
{
  return printf("%*lu", *(__int16 *)(*(void *)(a2 + 16) + 48LL), *(void *)(a1 + 372) >> 10);
}

uint64_t sub_10000481C(_DWORD *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  int v3 = a1[101] + a1[96];
  BOOL v4 = v3 <= 999999;
  if (v3 > 999999) {
    v3 -= 1000000;
  }
  int v5 = a1[103] + a1[98];
  int v6 = a1[97] + a1[95] + a1[100];
  if (!v4) {
    ++v6;
  }
  if (v5 <= 999999) {
    int v7 = a1[103] + a1[98];
  }
  else {
    int v7 = v5 - 1000000;
  }
  int v8 = v7 + v3;
  int v9 = v6 + a1[102];
  if (v5 > 999999) {
    ++v9;
  }
  if (v8 > 999999)
  {
    v8 -= 1000000;
    ++v9;
  }

  snprintf( __str,  0x80uLL,  "%3ld:%02ld.%02ld",  ((v8 + 5000LL) / 1000000 + v9) / 60,  ((v8 + 5000LL) / 1000000 + v9) % 60,  (v8 + 5000) / 10000 % 100);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_1000049A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (dword_10000E114)
  {
    int v3 = dword_10000E11C;
    if (dword_10000E11C)
    {
      BOOL v4 = (int *)(*(void *)(a1 + 456) + 60LL * dword_10000E118);
      int v3 = *v4;
      int v5 = v4[1];
    }

    else
    {
      int v5 = 0;
    }
  }

  else
  {
    int v5 = *(_DWORD *)(a1 + 404) + *(_DWORD *)(a1 + 384);
    int v3 = *(_DWORD *)(a1 + 400) + *(_DWORD *)(a1 + 380);
    if (v5 >= 1000000)
    {
      v5 -= 1000000;
      ++v3;
    }
  }

  snprintf( __str,  0x80uLL,  "%3ld:%02ld.%02ld",  ((v5 + 5000LL) / 1000000 + v3) / 60,  ((v5 + 5000LL) / 1000000 + v3) % 60,  (v5 + 5000) / 10000 % 100);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_100004B28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (dword_10000E114)
  {
    int v3 = dword_10000E11C;
    if (dword_10000E11C)
    {
      uint64_t v4 = *(void *)(a1 + 456) + 60LL * dword_10000E118;
      int v3 = *(_DWORD *)(v4 + 8);
      int v5 = *(_DWORD *)(v4 + 12);
    }

    else
    {
      int v5 = 0;
    }
  }

  else
  {
    int v5 = *(_DWORD *)(a1 + 412) + *(_DWORD *)(a1 + 392);
    int v3 = *(_DWORD *)(a1 + 408) + *(_DWORD *)(a1 + 388);
    if (v5 >= 1000000)
    {
      v5 -= 1000000;
      ++v3;
    }
  }

  snprintf( __str,  0x80uLL,  "%3ld:%02ld.%02ld",  ((v5 + 5000LL) / 1000000 + v3) / 60,  ((v5 + 5000LL) / 1000000 + v3) % 60,  (v5 + 5000) / 10000 % 100);
  return printf("%*s", *(__int16 *)(v2 + 48), __str);
}

uint64_t sub_100004CB0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 344);
}

uint64_t sub_100004CB8(uint64_t a1, uint64_t a2)
{
  if (dword_10000E114)
  {
    int v2 = dword_10000E11C;
    if (dword_10000E11C) {
      int v2 = *(_DWORD *)(*(void *)(a1 + 456) + 60LL * dword_10000E118 + 16);
    }
  }

  else
  {
    int v2 = *(_DWORD *)(a1 + 344);
  }

  return printf("%*.1f", *(__int16 *)(*(void *)(a2 + 16) + 48LL), (double)v2 * 100.0 / 1000.0);
}

double sub_100004D4C(uint64_t a1)
{
  if (dword_10000E10C)
  {
    int v2 = dword_10000E140;
  }

  else
  {
    int v2 = sub_1000034D8();
    dword_10000E140 = v2;
  }

  double result = 0.0;
  if (!v2) {
    return (float)*(unint64_t *)(a1 + 372) / (double)(unint64_t)qword_10000E100 * 100.0;
  }
  return result;
}

uint64_t sub_100004DC8(uint64_t a1, uint64_t a2)
{
  int v2 = *(__int16 *)(*(void *)(a2 + 16) + 48LL);
  double v3 = sub_100004D4C(a1);
  return printf("%*.1f", v2, v3);
}

uint64_t sub_100004E08(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 313)) {
    uint64_t v2 = *(void *)(a1 + 96);
  }
  else {
    uint64_t v2 = 0LL;
  }
  return printf("%*ld", *(__int16 *)(*(void *)(a2 + 16) + 48LL), v2);
}

uint64_t sub_100004E4C(uint64_t a1, uint64_t a2)
{
  return printf("%*s", *(__int16 *)(*(void *)(a2 + 16) + 48LL), "-");
}

uint64_t sub_100004E84(uint64_t a1, uint64_t a2)
{
  return printf("%*ld", *(__int16 *)(*(void *)(a2 + 16) + 48LL), 0LL);
}

uint64_t sub_100004EB4(void *a1, uint64_t a2)
{
  return sub_100004EC8((unsigned __int8 *)(*a1 + *(void *)(*(void *)(a2 + 16) + 56LL)), *(void *)(a2 + 16));
}

uint64_t sub_100004EC8(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned __int8 **)(a2 + 72);
  int v5 = &byte_10000DE9D;
  if ((*(_BYTE *)(a2 + 24) & 2) != 0)
  {
    byte_10000DE9D = 45;
    int v5 = &byte_10000DE9E;
  }

  char *v5 = 42;
  int v6 = v5 + 1;
  do
  {
    int v7 = *v4++;
    *v6++ = v7;
  }

  while (v7);
  switch(*(_DWORD *)(a2 + 64))
  {
    case 0:
      int v8 = fmtcheck(asc_10000DE9C, "%*hhd");
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = (char)*a1;
      return printf(v8, v9, v10);
    case 1:
      int v8 = fmtcheck(asc_10000DE9C, "%*hhu");
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *a1;
      return printf(v8, v9, v10);
    case 2:
      int v8 = fmtcheck(asc_10000DE9C, "%*hd");
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *(__int16 *)a1;
      return printf(v8, v9, v10);
    case 3:
      int v8 = fmtcheck(asc_10000DE9C, "%*hu");
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *(unsigned __int16 *)a1;
      return printf(v8, v9, v10);
    case 4:
      time_t v11 = "%*d";
      goto LABEL_12;
    case 5:
      time_t v11 = "%*u";
LABEL_12:
      int v8 = fmtcheck(asc_10000DE9C, v11);
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *(unsigned int *)a1;
      return printf(v8, v9, v10);
    case 6:
      int v12 = "%*ld";
      goto LABEL_16;
    case 7:
      int v12 = "%*lu";
      goto LABEL_16;
    case 8:
      int v12 = "%*lx";
LABEL_16:
      int v8 = fmtcheck(asc_10000DE9C, v12);
      uint64_t v9 = *(__int16 *)(a2 + 48);
      uint64_t v10 = *(void *)a1;
      return printf(v8, v9, v10);
    default:
      errx(1, "unknown type %d", *(_DWORD *)(a2 + 64));
  }

uint64_t sub_100005058(void *a1, uint64_t a2)
{
  return sub_100004EC8( (unsigned __int8 *)(*a1 + *(void *)(*(void *)(a2 + 16) + 56LL) + 296LL),  *(void *)(a2 + 16));
}

uint64_t sub_100005070(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (*(_BYTE *)(a1 + 313)) {
    return sub_100004EC8((unsigned __int8 *)(a1 + *(void *)(v2 + 56) + 24), v2);
  }
  else {
    return printf("%*s", *(__int16 *)(v2 + 48), "-");
  }
}

uint64_t sub_1000050C8(uint64_t a1, uint64_t a2)
{
  int v3 = proc_pidinfo(*(_DWORD *)(*(void *)a1 + 40LL), 12, 0LL, &buffer, 16);
  uint64_t v4 = *(const char ***)(a2 + 16);
  if (v3 != 16) {
    return printf("%*s");
  }
  int v5 = *v4;
  if (!strcmp(*v4, "wql")) {
    return printf("%*s");
  }
  if (strcmp(v5, "wqr")) {
    strcmp(v5, "wqb");
  }
  return printf("%*d");
}

uint64_t sub_1000051CC(uint64_t a1)
{
  uint64_t v24 = 0LL;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v19 = 0u;
  __int128 v18 = 0u;
  __int128 v17 = 0u;
  __int128 v16 = 0u;
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v5 = 0u;
  __int128 v6 = 0u;
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  int v2 = 1;
  else {
    return printf("%*u");
  }
}

uint64_t start(int a1, uint64_t a2)
{
  *(_OWORD *)v154 = xmmword_1000076E0;
  size_t __size = 0LL;
  BOOL v4 = compat_mode("bin/ps", "unix2003");
  setlocale(0, (const char *)&unk_1000076FA);
  time(&qword_10000E120);
  __int128 v5 = getenv("COLUMNS");
  if (v5 && *v5)
  {
    int v7 = atoi(v5);
    goto LABEL_12;
  }

  if (ioctl(1, 0x40087468uLL, &v124) != -1 || ioctl(2, 0x40087468uLL, &v124) != -1)
  {
    int v8 = v125;
    if (!v125)
    {
      int v7 = 79;
      goto LABEL_12;
    }

    goto LABEL_10;
  }

  int v6 = ioctl(0, 0x40087468uLL, &v124);
  int v7 = 79;
  if (v6 != -1)
  {
    int v8 = v125;
    if (v125) {
LABEL_10:
    }
      int v7 = v8 - 1;
  }

LABEL_12:
  dword_10000E128 = v7;
  if (a1 < 2) {
    goto LABEL_48;
  }
  BOOL v121 = v4;
  if (v4) {
    __int128 v9 = "aACcdeEfg:G:hjLlMmO:o:p:rSTt:U:u:vwx";
  }
  else {
    __int128 v9 = "aACcdeEgG:hjLlMmO:o:p:rSTt:U:uvwx";
  }
  __int128 v10 = *(const char **)(a2 + 8);
  __int128 v11 = *(unsigned __int8 **)(a2 + 16);
  int v12 = *(unsigned __int8 *)v10;
  if (*v10)
  {
    char v13 = *v10;
    __int128 v14 = *(char **)(a2 + 8);
    while (1)
    {
      __int128 v15 = strchr(v9, v13);
      if (v15)
      {
        if (v15[1] == 58) {
          break;
        }
      }

      int v16 = *++v14;
      char v13 = v16;
      if (!v16) {
        goto LABEL_21;
      }
    }

    if (v12 == 45) {
      goto LABEL_45;
    }
    int v17 = 0;
  }

  else
  {
LABEL_21:
    __int128 v14 = 0LL;
    int v17 = 1;
  }

  size_t v18 = strlen(v10);
  __int128 v20 = &v10[v18 - 1];
  int v19 = *(unsigned __int8 *)v20;
  if (v19 == 116)
  {
    if (v12 != 45 && v20 == v14)
    {
      if (v11)
      {
        int v57 = *v11;
      }

      *__int128 v14 = 84;
      int v12 = *(unsigned __int8 *)v10;
    }
  }

  else
  {
    else {
      int v21 = 0;
    }
    if (v21 == 1)
    {
      while (v20 >= v10)
      {
        int v22 = *(unsigned __int8 *)v20;
        BOOL v23 = v22 != 44 && (v22 - 48) > 9;
        if (v23) {
          break;
        }
        --v20;
      }

      uint64_t v24 = (char *)malloc(v18 + 3);
      if (v24)
      {
        v25 = v24;
        v26 = (unsigned __int8 *)(v20 + 1);
        int v27 = v24;
        if (v12 != 45)
        {
          BOOL v121 = 0;
          *uint64_t v24 = 45;
          int v27 = v24 + 1;
        }

        memcpy(v27, v10, v26 - (unsigned __int8 *)v10);
        v27[v26 - (unsigned __int8 *)v10] = 112;
        strcpy(&v27[v26 - (unsigned __int8 *)v10 + 1], v20 + 1);
        goto LABEL_46;
      }

LABEL_277:
      sub_100007174((uint64_t)v24);
    }
  }

  if (v12 == 45)
  {
LABEL_45:
    v25 = v10;
LABEL_46:
    BOOL v4 = v121;
    goto LABEL_47;
  }

LABEL_38:
  uint64_t v24 = (char *)malloc(v18 + 3);
  if (!v24) {
    goto LABEL_277;
  }
  v25 = v24;
  *uint64_t v24 = 45;
  strcpy(v24 + 1, v10);
  BOOL v4 = 0;
LABEL_47:
  *(void *)(a2 + 8) = v25;
LABEL_48:
  byte_10000E148 = 0;
  v150[0] = 0LL;
  LODWORD(v150[1]) = 4;
  v151 = sub_100006304;
  v152 = "group";
  v153 = 0LL;
  v146[0] = 0LL;
  LODWORD(v146[1]) = 4;
  v147 = sub_100006444;
  v148 = "process group";
  v149 = 0LL;
  uint64_t v141 = 0LL;
  int v142 = 4;
  v143 = sub_100006444;
  v144 = "process id";
  v145 = 0LL;
  uint64_t v136 = 0LL;
  int v137 = 4;
  v138 = sub_100006550;
  v139 = "ruser";
  v140 = 0LL;
  uint64_t v131 = 0LL;
  int v132 = 4;
  v133 = sub_100006688;
  v134 = "tty";
  v135 = 0LL;
  uint64_t v126 = 0LL;
  int v127 = 4;
  v128 = sub_100006550;
  v129 = "user";
  if (v4) {
    v28 = "aACcdeEfg:G:hjLlMmO:o:p:rSTt:U:u:vwx";
  }
  else {
    v28 = "aACcdeEgG:hjLlMmO:o:p:rSTt:U:uvwx";
  }
  v130 = 0LL;
  int v29 = getopt(a1, (char *const *)a2, v28);
  if (v29 != -1)
  {
    int v32 = 0;
    int v122 = 0;
    int v31 = 0;
    int v118 = 0;
    int v30 = 0;
    v34 = aUidPidPpidFlag;
    if (!v4) {
      v34 = aUidPidPpidCpuP;
    }
    v115 = v34;
    uint64_t v116 = 0LL;
    uint64_t v35 = 0xFFFFFFFFLL;
    while (2)
    {
      uint64_t v33 = 0LL;
      switch((char)v29)
      {
        case 'A':
          goto LABEL_69;
        case 'C':
          dword_10000E12C = 1;
          goto LABEL_104;
        case 'E':
          goto LABEL_71;
        case 'G':
          size_t v36 = optarg;
          v37 = v150;
          goto LABEL_92;
        case 'L':
          sub_10000316C();
          exit(0);
        case 'M':
          sub_100003298(aUserPidTtCpuSt, 0LL);
          aUserPidTtCpuSt[0] = 0;
          int v118 = 1;
          dword_10000E114 = 1;
          goto LABEL_104;
        case 'O':
          int v118 = 1;
          sub_100003298(aPid_1, 1LL);
          sub_100003298(optarg, 1LL);
          sub_100003298(aTtStateTimeCom, 1LL);
          aTtStateTimeCom[0] = 0;
          aPid_1[0] = 0;
          goto LABEL_104;
        case 'S':
          dword_10000E134 = 1;
          goto LABEL_104;
        case 'T':
          size_t v36 = ttyname(0);
          optarg = v36;
          if (!v36) {
            sub_1000071A0(0LL);
          }
          goto LABEL_89;
        case 'U':
          size_t v36 = optarg;
          v37 = &v136;
          goto LABEL_92;
        case 'X':
          goto LABEL_105;
        case 'a':
          ++v31;
          int v30 = 1;
          goto LABEL_104;
        case 'c':
          dword_10000E130 = 1;
          goto LABEL_104;
        case 'd':
          LODWORD(v116) = 1;
          goto LABEL_69;
        case 'e':
          if (!v4)
          {
LABEL_71:
            dword_10000E110 = 1;
            goto LABEL_104;
          }

LABEL_69:
          ++v31;
          int v30 = 1;
LABEL_70:
          uint64_t v33 = 1LL;
          goto LABEL_105;
        case 'f':
          dword_10000E128 = 0;
          if (!v4 || (_DWORD)v126)
          {
            sub_100003298(aUserPidPpidCpu, 0LL);
          }

          else
          {
            sub_100003298(aUidPidPpidCpuC, 0LL);
            v38 = sub_1000033CC("command", 0LL, 0LL);
            if (v38) {
              *((_WORD *)v38 + 24) = 64;
            }
          }

          goto LABEL_99;
        case 'g':
          if (!v4) {
            goto LABEL_104;
          }
          size_t v36 = optarg;
          v37 = v146;
          goto LABEL_92;
        case 'h':
          int v39 = v124;
          if (v124 <= 5u) {
            int v39 = 22;
          }
          int v122 = v39;
          goto LABEL_104;
        case 'j':
          v40 = aUserPidPpidPgi;
          sub_100003298(aUserPidPpidPgi, 0LL);
          goto LABEL_98;
        case 'l':
          sub_100003298(v115, 0LL);
          aUidPidPpidCpuP[0] = 0;
          goto LABEL_99;
        case 'm':
          v41 = aUserPidPpidPgi + 37;
          int v42 = 1;
          goto LABEL_87;
        case 'o':
          int v118 = 1;
          sub_100003298(optarg, 1LL);
          goto LABEL_104;
        case 'p':
          sub_1000068C4((uint64_t)&v141, optarg);
          ++v31;
          goto LABEL_104;
        case 'r':
          v41 = &aUserPidPpidPgi[37];
          int v42 = 2;
LABEL_87:
          *((_DWORD *)v41 + 83) = v42;
          goto LABEL_104;
        case 't':
          size_t v36 = optarg;
LABEL_89:
          v37 = &v131;
          goto LABEL_92;
        case 'u':
          if (v4)
          {
            size_t v36 = optarg;
            v37 = &v126;
LABEL_92:
            sub_1000068C4((uint64_t)v37, v36);
            ++v31;
            int v32 = 1;
          }

          else
          {
            v40 = aUserPidCpuMemV;
            sub_100003298(aUserPidCpuMemV, 0LL);
            dword_10000E14C = 2;
LABEL_98:
            char *v40 = 0;
LABEL_99:
            int v118 = 1;
          }

          goto LABEL_104;
        case 'v':
          sub_100003298(aPidStateTimeSl, 0LL);
          int v118 = 1;
          dword_10000E14C = 1;
          aPidStateTimeSl[0] = 0;
          goto LABEL_104;
        case 'w':
          if (HIDWORD(v116))
          {
            int v43 = 0;
          }

          else
          {
            if (dword_10000E128 > 130) {
              goto LABEL_103;
            }
            int v43 = 131;
          }

          dword_10000E128 = v43;
LABEL_103:
          ++HIDWORD(v116);
LABEL_104:
          uint64_t v33 = v35;
LABEL_105:
          int v29 = getopt(a1, (char *const *)a2, v28);
          uint64_t v35 = v33;
          if (v29 == -1) {
            goto LABEL_106;
          }
          continue;
        case 'x':
          goto LABEL_70;
        default:
          goto LABEL_170;
      }
    }
  }

  int v30 = 0;
  int v118 = 0;
  int v31 = 0;
  int v122 = 0;
  int v32 = 0;
  LODWORD(v116) = 0;
  LODWORD(v33) = -1;
LABEL_106:
  int v44 = v32;
  uint64_t v45 = optind;
  if (!isatty(1)) {
    dword_10000E128 = 0;
  }
  v46 = *(const char **)(a2 + 8 * v45);
  if (v46)
  {
    v47 = (const char **)(a2 + 8 * v45 + 8);
    do
    {
      if (*(unsigned __int8 *)v46 - 48 > 9)
      {
        v65 = __stderrp;
        v66 = getprogname();
        fprintf(v65, "%s: illegal argument: %s\n", v66, *(v47 - 1));
LABEL_170:
        sub_100006A90(v4);
      }

      sub_1000068C4((uint64_t)&v141, v46);
      v48 = *v47++;
      v46 = v48;
    }

    while (v48);
  }

  if (byte_10000E148 == 1) {
    goto LABEL_173;
  }
  else {
    int v49 = v44;
  }
  int v117 = v49;
  if (!v118)
  {
    if (v4 && (_DWORD)v126) {
      sub_100003298("uid", 0LL);
    }
    if (v4) {
      v50 = aPidTtyTimeComm;
    }
    else {
      v50 = aPidTtStateTime;
    }
    sub_100003298(v50, 0LL);
  }

  if (!v31)
  {
    v130 = malloc(4uLL);
    if (!v130) {
      sub_100007174(0LL);
    }
    uint64_t v126 = 0x100000001LL;
    *(_DWORD *)v130 = getuid();
    int v31 = 1;
  }

  v51 = off_10000DEC0;
  if (off_10000DEC0)
  {
    do
    {
      uint64_t v52 = v51[2];
      int v53 = *(_DWORD *)(v52 + 24);
      if ((v53 & 8) != 0)
      {
        *(_WORD *)(v52 + 80) = *(_WORD *)(v52 + 48);
        *(_WORD *)(v52 + 48) = 0;
      }

      if ((v53 & 4) != 0) {
        byte_10000E158 = 1;
      }
      v51 = (void *)*v51;
    }

    while (v51);
  }

  int v54 = 0;
  if (v31 != 1)
  {
    int v55 = 0;
    goto LABEL_153;
  }

  int v55 = 0;
  if (LODWORD(v150[0]) == 1) {
    goto LABEL_153;
  }
  if (LODWORD(v146[0]) == 1)
  {
    v56 = (void **)&v149;
    int v55 = 2;
LABEL_152:
    int v31 = 0;
    int v54 = *(_DWORD *)*v56;
    goto LABEL_153;
  }

  int v55 = v141;
  if ((_DWORD)v141 == 1)
  {
    v56 = &v145;
    goto LABEL_152;
  }

  if ((_DWORD)v136 == 1)
  {
    v56 = &v140;
    int v55 = 6;
    goto LABEL_152;
  }

  if ((_DWORD)v131 == 1)
  {
    v56 = &v135;
    int v55 = 4;
    goto LABEL_152;
  }

  if ((_DWORD)v126 == 1)
  {
    v56 = &v130;
    if (v117) {
      int v55 = 6;
    }
    else {
      int v55 = 5;
    }
    goto LABEL_152;
  }

  int v54 = 0;
  int v55 = 0;
  int v31 = 1;
LABEL_153:
  *(void *)v154 = 0xE00000001LL;
  v154[2] = v55;
  v154[3] = v54;
  if ((sysctl(v154, 4u, 0LL, &__size, 0LL, 0LL) & 0x80000000) == 0)
  {
    size_t v59 = __size;
    v60 = malloc(__size);
    for (unsigned int i = 0; ; ++i)
    {
      size_t __size = v59;
      int v62 = sysctl(v154, 4u, v60, &__size, 0LL, 0LL);
      if ((v62 & 0x80000000) == 0) {
        break;
      }
      if (i > 0x3E7) {
        goto LABEL_154;
      }
      if (*__error() != 12 || sysctl(v154, 4u, 0LL, &__size, 0LL, 0LL)) {
        goto LABEL_162;
      }
      v60 = realloc(v60, __size);
      size_t v59 = __size;
LABEL_163:
      ;
    }

    if (!v62)
    {
      int v63 = v30;
      size_t v64 = __size / 0x288;
      if ((int)(__size / 0x288) >= 1)
      {
        qword_10000E150 = (uint64_t)calloc((__size / 0x288), 0x1D8uLL);
        if (!qword_10000E150) {
          sub_100007174(0LL);
        }
        int v67 = 0;
        if (v63) {
          BOOL v76 = 1;
        }
        else {
          BOOL v76 = v31 == 0;
        }
        char v77 = v76;
        char v120 = v77;
        v78 = v60;
        while (1)
        {
          int v79 = v78[10];
          if (v79 && (!(_DWORD)v116 || v79 != v78[141]))
          {
            uint64_t v80 = v141;
            if ((int)v141 >= 1)
            {
              v81 = (int *)v145;
              do
              {
                int v82 = *v81++;
                if (v79 == v82) {
                  goto LABEL_213;
                }
              }

              while (--v80);
            }

            if (v117 || (dev_t v95 = v78[143], v95 != -1) && (v78[8] & 2) != 0 && devname(v95, 0x2000u))
            {
              if ((v120 & 1) != 0) {
                goto LABEL_213;
              }
              uint64_t v96 = LODWORD(v150[0]);
              if (SLODWORD(v150[0]) >= 1)
              {
                v97 = v153;
                do
                {
                  int v98 = *v97++;
                  if (v78[100] == v98) {
                    goto LABEL_213;
                  }
                }

                while (--v96);
              }

              uint64_t v99 = LODWORD(v146[0]);
              if (SLODWORD(v146[0]) >= 1)
              {
                v100 = v149;
                do
                {
                  int v101 = *v100++;
                  if (v78[141] == v101) {
                    goto LABEL_213;
                  }
                }

                while (--v99);
              }

              uint64_t v102 = v136;
              if ((int)v136 >= 1)
              {
                v103 = (int *)v140;
                do
                {
                  int v104 = *v103++;
                  if (v78[98] == v104) {
                    goto LABEL_213;
                  }
                }

                while (--v102);
              }

              uint64_t v105 = v131;
              if ((int)v131 >= 1)
              {
                v106 = (int *)v135;
                do
                {
                  int v107 = *v106++;
                  if (v78[143] == v107) {
                    goto LABEL_213;
                  }
                }

                while (--v105);
              }

              uint64_t v108 = v126;
              if ((int)v126 >= 1)
              {
                v109 = (int *)v130;
                while (1)
                {
                  int v110 = *v109++;
                  if (v78[105] == v110) {
                    break;
                  }
                  if (!--v108) {
                    goto LABEL_224;
                  }
                }

LABEL_213:
                uint64_t v83 = qword_10000E150;
                int v84 = v67;
                v85 = (void *)(qword_10000E150 + 472LL * v67);
                void *v85 = v78;
                sub_100006DBC((uint64_t)v85);
                if (byte_10000E158 == 1)
                {
                  uint64_t v86 = v83 + 472LL * v84;
                  *(_BYTE *)(v86 + 313) = 0;
                  v87 = (const char *)(*v85 + 243LL);
                  size_t v88 = strlen(v87);
                  v89 = (char *)malloc(v88 + 3);
                  *(void *)(v86 + 320) = v89;
                  strcpy(v89, v87);
                  v90 = malloc(0xAuLL);
                  *(void *)(v86 + 328) = v90;
                  _BYTE *v90 = 0;
                }

                v91 = off_10000DEC0;
                if (off_10000DEC0)
                {
                  do
                  {
                    uint64_t v92 = v91[2];
                    if ((*(_BYTE *)(v92 + 24) & 8) != 0)
                    {
                      int v93 = (*(uint64_t (**)(void *))(v92 + 40))(v85);
                      else {
                        *(_WORD *)(v92 + 48) = v93;
                      }
                      int v94 = *(__int16 *)(v92 + 80);
                    }

                    v91 = (void *)*v91;
                  }

                  while (v91);
                }

                int v67 = v84 + 1;
              }
            }
          }

LABEL_224:
          v78 += 162;
          BOOL v23 = (int)v64 <= 1;
          LODWORD(v64) = v64 - 1;
          if (v23) {
            goto LABEL_172;
          }
        }
      }

      int v67 = 0;
LABEL_172:
      sub_100006AF8();
      sub_100003578();
      if (v67)
      {
        qsort((void *)qword_10000E150, v67, 0x1D8uLL, (int (__cdecl *)(const void *, const void *))sub_100006B64);
        if (v67 <= 0)
        {
          v112 = (char *)qword_10000E150;
        }

        else
        {
          uint64_t v68 = 0LL;
          int v69 = 0;
          int v70 = v122 - 4;
          v71 = &aUserPidPpidPgi[37];
          uint64_t v119 = v67;
          do
          {
            if (dword_10000E114)
            {
              v72 = v71;
              *((_DWORD *)v71 + 71) = 1;
              if (*(_DWORD *)(qword_10000E150 + 472 * v68 + 440))
              {
                unsigned int v73 = 0;
                do
                {
                  dword_10000E118 = v73;
                  v74 = off_10000DEC0;
                  if (off_10000DEC0)
                  {
                    do
                    {
                      (*(void (**)(uint64_t, void *))(v74[2] + 32LL))(qword_10000E150 + 472 * v68, v74);
                      if (!*v74) {
                        break;
                      }
                      putchar(32);
                      v74 = (void *)*v74;
                    }

                    while (v74);
                  }

                  putchar(10);
                  if (v122)
                  {
                    if (v69 == v70)
                    {
                      putchar(10);
                      sub_100003578();
                      int v69 = 0;
                    }

                    else
                    {
                      ++v69;
                    }
                  }

                  ++v73;
                }

                while (v73 < *(_DWORD *)(qword_10000E150 + 472 * v68 + 440));
              }

              v71 = v72;
              *((_DWORD *)v72 + 71) = 0;
            }

            else
            {
              v75 = off_10000DEC0;
              if (off_10000DEC0)
              {
                do
                {
                  (*(void (**)(uint64_t, void *))(v75[2] + 32LL))(qword_10000E150 + 472 * v68, v75);
                  if (!*v75) {
                    break;
                  }
                  putchar(32);
                  v75 = (void *)*v75;
                }

                while (v75);
              }

              putchar(10);
              if (v122)
              {
                if (v69 == v70)
                {
                  putchar(10);
                  sub_100003578();
                  int v69 = 0;
                }

                else
                {
                  ++v69;
                }
              }
            }

            ++v68;
          }

          while (v68 != v119);
          uint64_t v111 = 0LL;
          v112 = (char *)qword_10000E150;
          do
          {
            if (!*(_DWORD *)&v112[v111 + 436] && *(_DWORD *)&v112[v111 + 440]) {
              free(*(void **)&v112[v111 + 456]);
            }
            v111 += 472LL;
          }

          while (472LL * v119 != v111);
        }

        free(v60);
        free(v112);
        memset(v150, 0, 12);
        if (v153) {
          free(v153);
        }
        v151 = 0LL;
        v152 = 0LL;
        v153 = 0LL;
        int v142 = 0;
        uint64_t v141 = 0LL;
        if (v145) {
          free(v145);
        }
        v143 = 0LL;
        v144 = 0LL;
        v145 = 0LL;
        memset(v146, 0, 12);
        if (v149) {
          free(v149);
        }
        v147 = 0LL;
        v148 = 0LL;
        v149 = 0LL;
        int v137 = 0;
        uint64_t v136 = 0LL;
        if (v140) {
          free(v140);
        }
        v138 = 0LL;
        v139 = 0LL;
        v140 = 0LL;
        int v132 = 0;
        uint64_t v131 = 0LL;
        if (v135) {
          free(v135);
        }
        v133 = 0LL;
        v134 = 0LL;
        v135 = 0LL;
        int v127 = 0;
        uint64_t v126 = 0LL;
        if (v130) {
          free(v130);
        }
        v128 = 0LL;
        v129 = 0LL;
        v130 = 0LL;
        int v113 = dword_10000E138;
        if (!dword_10000E138)
        {
          v114 = __stdoutp;
          if (ferror(__stdoutp) || fflush(v114)) {
            sub_100007188();
          }
          int v113 = dword_10000E138;
        }

        exit(v113);
      }

LABEL_173:
      exit(1);
    }

LABEL_162:
    sleep(1u);
    goto LABEL_163;
  }

LABEL_154:
  perror("Failure calling sysctl");
  return 0LL;
}

uint64_t sub_100006304(uint64_t a1, char *__s)
{
  if (!*__s)
  {
    warnx("Invalid (zero-length) %s name");
LABEL_17:
    uint64_t result = 0LL;
    byte_10000E148 = 1;
    return result;
  }

  if (strlen(__s) > 0xFE)
  {
    warnx("%s name too long: %s");
    goto LABEL_17;
  }

  *__error() = 0;
  unint64_t v4 = strtoul(__s, &__endptr, 10);
  if (*__error() || (!*__endptr ? (BOOL v5 = v4 >> 31 == 0) : (BOOL v5 = 0), !v5 || (v6 = getgrgid(v4)) == 0LL))
  {
    int v6 = getgrnam(__s);
    if (!v6)
    {
      warnx("No %s %s '%s'");
      goto LABEL_17;
    }
  }

  int v7 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
  {
    sub_100006C28(a1);
    int v7 = *(_DWORD *)a1;
  }

  gid_t gr_gid = v6->gr_gid;
  uint64_t v9 = *(void *)(a1 + 32);
  *(_DWORD *)a1 = v7 + 1;
  *(_DWORD *)(v9 + 4LL * v7) = gr_gid;
  return 1LL;
}

uint64_t sub_100006444(uint64_t a1, const char *a2)
{
  if (*a2)
  {
    *__error() = 0;
    unint64_t v4 = strtol(a2, &__endptr, 10);
    BOOL v5 = "Invalid %s: %s";
    BOOL v6 = __endptr != a2 && *__endptr == 0;
    if (!v6 || (v4 & 0x8000000000000000LL) != 0 || (int v7 = *__error(), v5 = "%s too large: %s", v7) || v4 >> 5 >= 0xC35)
    {
      warnx(v5, *(void *)(a1 + 24), a2);
      *__error() = 34;
    }

    if (*__error() == 34)
    {
      uint64_t result = 0LL;
      byte_10000E148 = 1;
    }

    else
    {
      int v9 = *(_DWORD *)a1;
      if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
      {
        sub_100006C28(a1);
        int v9 = *(_DWORD *)a1;
      }

      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)a1 = v9 + 1;
      *(_DWORD *)(v10 + 4LL * v9) = v4;
      return 1LL;
    }
  }

  else
  {
    sub_1000071B4();
    return 0LL;
  }

  return result;
}

uint64_t sub_100006550(uint64_t a1, char *__s)
{
  if (!*__s)
  {
    warnx("Invalid (zero-length) %s name");
    goto LABEL_17;
  }

  if (strlen(__s) > 0xFE)
  {
    warnx("%s name too long: %s");
    goto LABEL_17;
  }

  unint64_t v4 = getpwnam(__s);
  if (!v4)
  {
    *__error() = 0;
    unint64_t v5 = strtoul(__s, &__endptr, 10);
    if (*__error())
    {
      BOOL v6 = "No %s named '%s'";
    }

    else
    {
      BOOL v6 = "No %s named '%s'";
      if (!*__endptr && !(v5 >> 31))
      {
        unint64_t v4 = getpwuid(v5);
        if (v4) {
          goto LABEL_8;
        }
        BOOL v6 = "No %s name or ID matches '%s'";
      }
    }

    warnx(v6, *(void *)(a1 + 24), __s);
LABEL_17:
    uint64_t result = 0LL;
    byte_10000E148 = 1;
    return result;
  }

LABEL_8:
  int v7 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 >= *(_DWORD *)(a1 + 4))
  {
    sub_100006C28(a1);
    int v7 = *(_DWORD *)a1;
  }

  uid_t pw_uid = v4->pw_uid;
  uint64_t v9 = *(void *)(a1 + 32);
  *(_DWORD *)a1 = v7 + 1;
  *(_DWORD *)(v9 + 4LL * v7) = pw_uid;
  return 1LL;
}

uint64_t sub_100006688(uint64_t a1, char *__s1)
{
  int v2 = __s1;
  v11[0] = 0;
  int v4 = *__s1;
  if (v4 != 47)
  {
    if (v4 == 99 && !strcmp(__s1, "co"))
    {
      int v2 = "/dev/console";
    }

    else
    {
      __strlcpy_chk(v12, "/dev/", 1024LL, 1024LL);
      __strlcat_chk(v12, v2, 1024LL, 1024LL);
      if (*(void *)v12 != 0x7974742F7665642FLL
        && (*(void *)v12 != 0x6E6F632F7665642FLL || *(void *)&v12[5] != 0x656C6F736E6F63LL))
      {
        __strlcpy_chk(v11, "/dev/tty", 1024LL, 1024LL);
        __strlcat_chk(v11, v2, 1024LL, 1024LL);
        if (!stat(v11, &v10) && (v10.st_mode & 0xF000) == 0x2000) {
          goto LABEL_15;
        }
      }

      int v2 = v12;
    }
  }

  if (access(v2, 0) == -1 || stat(v2, &v10) == -1)
  {
    if (v11[0]) {
      warn("%s and %s");
    }
    else {
      warn("%s");
    }
    goto LABEL_27;
  }

  if ((v10.st_mode & 0xF000) != 0x2000)
  {
    if (v11[0]) {
      warnx("%s and %s: Not a terminal");
    }
    else {
      warnx("%s: Not a terminal");
    }
LABEL_27:
    uint64_t result = 0LL;
    byte_10000E148 = 1;
    return result;
  }

void sub_1000068C4(uint64_t a1, const char *a2)
{
  int v2 = a2;
  LOBYTE(v4) = *a2;
  if (*a2 || ((*(void (**)(uint64_t, _BYTE *))(a1 + 16))(a1, v13), (LOBYTE(v4) = *v2) != 0))
  {
    while (1)
    {
      if (memchr(" \t", (char)v4, 3uLL))
      {
        int v5 = *(unsigned __int8 *)++v2;
        LOBYTE(v4) = v5;
        if (!v5) {
          goto LABEL_7;
        }
      }

      else
      {
        if (v4 != 44)
        {
          unint64_t v9 = 0LL;
          do
          {
            unint64_t v10 = v9;
            if (memchr(" \t,", (char)v4, 4uLL))
            {
              int v6 = &v13[v10];
              v2 += v10;
              goto LABEL_8;
            }

            unint64_t v9 = v10 + 1;
            v13[v10] = v4;
            int v4 = v2[v10 + 1];
          }

          while (v2[v10 + 1] && v10 < 0x3FF);
          __int128 v11 = &v2[v9];
          if (v10 < 0x3FF)
          {
            int v6 = &v13[v9];
            int v2 = v11;
            goto LABEL_8;
          }

          while (v4 && !memchr(" \t,", (char)v4, 4uLL))
          {
            int v12 = *(unsigned __int8 *)++v11;
            int v4 = v12;
          }

          warnx("Value too long: %.*s", (_DWORD)v11 - (_DWORD)v2, v2);
          byte_10000E148 = 1;
          int v2 = v11;
          goto LABEL_9;
        }

LABEL_7:
        int v6 = v13;
LABEL_8:
        _BYTE *v6 = 0;
        (*(void (**)(uint64_t, _BYTE *))(a1 + 16))(a1, v13);
LABEL_9:
        char v7 = *v2;
        if (*v2)
        {
          do
          {
            if (!memchr(" \t", v7, 3uLL)) {
              break;
            }
            int v8 = *(unsigned __int8 *)++v2;
            char v7 = v8;
          }

          while (v8);
        }

        if (v7 == 44) {
          ++v2;
        }
        LOBYTE(v4) = *v2;
        if (!*v2) {
          return;
        }
      }
    }
  }

void sub_100006A90(int a1)
{
  v1 = "          [-g grp[,grp...]] [-u [uid,uid...]]";
  if (!a1) {
    v1 = "          [-u]";
  }
  fprintf( __stderrp,  "%s\n%s\n%s\n%s\n",  "usage: ps [-AaCcEefhjlMmrSTvwXx] [-O fmt | -o fmt] [-G gid[,gid...]]",  v1,  "          [-p pid[,pid...]] [-t tty[,tty...]] [-U user[,user...]]",  "       ps [-L]");
  exit(1);
}

void sub_100006AF8()
{
  int v0 = dword_10000E13C;
  for (unsigned int i = off_10000DEC0; i; unsigned int i = *(void **)i)
  {
    uint64_t v2 = *((void *)i + 2);
    int v3 = strlen(*((const char **)i + 1));
    int v4 = *(__int16 *)(v2 + 48);
    if (v4 < v3)
    {
      *(_WORD *)(v2 + 48) = v3;
      int v4 = (__int16)v3;
    }

    v0 += v4 + 1;
    dword_10000E13C = v0;
  }

  dword_10000E13C = v0 - 1;
}

uint64_t sub_100006B64(_DWORD *a1, _DWORD *a2)
{
  if (dword_10000E14C == 1)
  {
    int v5 = a2[93];
    int v6 = a1[93];
    return (v5 - v6);
  }

  if (dword_10000E14C == 2)
  {
    int v3 = sub_100004CB0((uint64_t)a2);
    return v3 - sub_100004CB0((uint64_t)a1);
  }

  int v7 = *(_DWORD *)(*(void *)a1 + 572LL);
  int v8 = *(_DWORD *)(*(void *)a2 + 572LL);
  uint64_t result = (v7 - v8);
  if (v7 == v8)
  {
    int v5 = *(_DWORD *)(*(void *)a1 + 40LL);
    int v6 = *(_DWORD *)(*(void *)a2 + 40LL);
    return (v5 - v6);
  }

  return result;
}

_UNKNOWN **sub_100006BE4(const char **a1)
{
  uint64_t v2 = &off_10000DEC0;
  do
    uint64_t v2 = (_UNKNOWN **)*v2;
  while (v2 && strcmp(*(const char **)v2[2], *a1));
  return v2;
}

void *sub_100006C28(uint64_t a1)
{
  int v2 = 2 * *(_DWORD *)(a1 + 4) + 2;
  uint64_t result = realloc(*(void **)(a1 + 32), *(int *)(a1 + 8) * (uint64_t)v2);
  if (!result)
  {
    free(*(void **)(a1 + 32));
    errx(1, "realloc to %d %ss failed", v2, *(const char **)(a1 + 24));
  }

  *(_DWORD *)(a1 + 4) = v2;
  *(void *)(a1 + 32) = result;
  return result;
}

void sub_100006C94(uint64_t a1, const char *a2)
{
}

uint64_t sub_100006C9C(uint64_t result, uint64_t a2)
{
  switch((int)result)
  {
    case 1:
      return result;
    case 2:
      uint64_t result = 5LL;
      break;
    case 3:
      if (a2 <= 20) {
        uint64_t result = 3LL;
      }
      else {
        uint64_t result = 4LL;
      }
      break;
    case 4:
      uint64_t result = 2LL;
      break;
    case 5:
      uint64_t result = 6LL;
      break;
    default:
      uint64_t result = 7LL;
      break;
  }

  return result;
}

uint64_t sub_100006CF0(uint64_t a1, thread_inspect_t target_act, int a3, thread_info_t thread_info_out)
{
  if (a3 == 4)
  {
    mach_msg_type_number_t thread_info_outCnt = 4;
    thread_inspect_t v9 = target_act;
    thread_flavor_t v10 = 12;
LABEL_8:
    uint64_t result = thread_info(v9, v10, thread_info_out, &thread_info_outCnt);
    if ((_DWORD)result) {
      return result;
    }
    integer_t v7 = *(_DWORD *)(a1 + 348);
    integer_t v8 = thread_info_out[1];
    goto LABEL_10;
  }

  if (a3 == 2)
  {
    mach_msg_type_number_t thread_info_outCnt = 5;
    thread_inspect_t v9 = target_act;
    thread_flavor_t v10 = 11;
    goto LABEL_8;
  }

  if (a3 != 1) {
    return 5LL;
  }
  mach_msg_type_number_t thread_info_outCnt = 5;
  uint64_t result = thread_info(target_act, 0xAu, thread_info_out, &thread_info_outCnt);
  if ((_DWORD)result) {
    return result;
  }
  integer_t v7 = *(_DWORD *)(a1 + 348);
  integer_t v8 = thread_info_out[2];
LABEL_10:
  uint64_t result = 0LL;
  if (v7 < v8) {
    *(_DWORD *)(a1 + 348) = v8;
  }
  return result;
}

uint64_t sub_100006DBC(uint64_t a1)
{
  kern_return_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  vm_size_t v18;
  mach_port_t object_name;
  mach_vm_size_t size;
  mach_vm_address_t address;
  int info[9];
  mach_msg_type_number_t thread_info_outCnt;
  mach_msg_type_number_t task_info_outCnt;
  mach_msg_type_number_t thread_info_outCnt = 10;
  *(_DWORD *)(a1 + 340) = 7;
  int v2 = (vm_map_read_t *)(a1 + 336);
  task_info_outCnt = 10;
  if (task_info(*(_DWORD *)(a1 + 336), 0x12u, (task_info_t)(a1 + 360), &task_info_outCnt)) {
    goto LABEL_6;
  }
  address = 2415919104LL;
  task_info_outCnt = 9;
  if (!mach_vm_region(*v2, &address, &size, 10, info, &task_info_outCnt, &object_name))
  {
    if (info[4])
    {
      if (size == 0x10000000)
      {
        unint64_t v4 = *(void *)(a1 + 364);
        if (v4 >= 0x20000001) {
          *(void *)(a1 + 364) = v4 - 0x20000000;
        }
      }
    }
  }

  task_info_outCnt = 4;
  if (task_info(*(_DWORD *)(a1 + 336), 3u, (task_info_t)(a1 + 400), &task_info_outCnt)) {
    goto LABEL_6;
  }
  int v5 = *(_DWORD *)(a1 + 396);
  switch(v5)
  {
    case 4:
      task_info_outCnt = 4;
      task_name_t v7 = *(_DWORD *)(a1 + 336);
      integer_t v8 = (integer_t *)(a1 + 416);
      task_flavor_t v9 = 12;
      goto LABEL_18;
    case 2:
      task_info_outCnt = 5;
      task_name_t v7 = *(_DWORD *)(a1 + 336);
      integer_t v8 = (integer_t *)(a1 + 416);
      task_flavor_t v9 = 11;
LABEL_18:
      if (!task_info(v7, v9, v8, &task_info_outCnt))
      {
        int v6 = *(_DWORD *)(a1 + 420);
        *(_DWORD *)(a1 + 348) = v6;
        goto LABEL_20;
      }

LABEL_6:
      uint64_t result = 1LL;
      *(_DWORD *)(a1 + 436) = 1;
      return result;
    case 1:
      task_info_outCnt = 5;
      if (!task_info(*(_DWORD *)(a1 + 336), 0xAu, (task_info_t)(a1 + 416), &task_info_outCnt))
      {
        *(_DWORD *)(a1 + 348) = *(_DWORD *)(a1 + 424);
        int v6 = *(_DWORD *)(a1 + 420);
LABEL_20:
        *(_DWORD *)(a1 + 352) = v6;
        break;
      }

      goto LABEL_6;
  }

  *(_DWORD *)(a1 + 436) = 0;
  *(_DWORD *)(a1 + 344) = 0;
  if (task_threads(*(_DWORD *)(a1 + 336), (thread_act_array_t *)(a1 + 448), (mach_msg_type_number_t *)(a1 + 440)))
  {
    mach_port_deallocate(mach_task_self_, *v2);
    return 1LL;
  }

  *(_DWORD *)(a1 + 356) = 1;
  *(void *)(a1 + 456) = calloc(*(unsigned int *)(a1 + 440), 0x3CuLL);
  if (*(_DWORD *)(a1 + 440))
  {
    uint64_t v10 = 0LL;
    unint64_t v11 = 0LL;
    int v12 = 0;
    do
    {
      mach_msg_type_number_t thread_info_outCnt = 10;
      char v13 = thread_info( *(_DWORD *)(*(void *)(a1 + 448) + 4 * v11),  3u,  (thread_info_t)(*(void *)(a1 + 456) + v10),  &thread_info_outCnt);
      __int128 v14 = *(void *)(a1 + 456);
      if (v13) {
        int v12 = 1;
      }
      else {
        *(_DWORD *)(a1 + 344) += *(_DWORD *)(v14 + v10 + 16);
      }
      if (sub_100006CF0( a1,  *(_DWORD *)(*(void *)(a1 + 448) + 4 * v11),  *(_DWORD *)(v14 + v10 + 20),  (thread_info_t)(v14 + v10 + 40))) {
        int v12 = 1;
      }
      __int128 v15 = *(void *)(a1 + 456);
      int v16 = *(_DWORD *)(v15 + v10 + 24);
      switch(v16)
      {
        case 1:
          break;
        case 2:
          int v16 = 5;
          break;
        case 3:
          else {
            int v16 = 4;
          }
          break;
        case 4:
          int v16 = 2;
          break;
        case 5:
          int v16 = 6;
          break;
        default:
          int v16 = 7;
          break;
      }

      if (v16 < *(_DWORD *)(a1 + 340)) {
        *(_DWORD *)(a1 + 340) = v16;
      }
      if ((*(_BYTE *)(v15 + v10 + 28) & 1) == 0) {
        *(_DWORD *)(a1 + 356) = 0;
      }
      mach_port_deallocate(mach_task_self_, *(_DWORD *)(*(void *)(a1 + 448) + 4 * v11++));
      int v17 = *(unsigned int *)(a1 + 440);
      v10 += 60LL;
    }

    while (v11 < v17);
    size_t v18 = 4 * v17;
  }

  else
  {
    int v12 = 0;
    size_t v18 = 0LL;
  }

  *(_DWORD *)(a1 + 464) = v12;
  vm_deallocate(mach_task_self_, *(void *)(a1 + 448), v18);
  mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 336));
  return 0LL;
}

void sub_100007128()
{
}

void sub_100007148()
{
}

void sub_100007160()
{
}

void sub_100007174(uint64_t a1)
{
}

void sub_100007188()
{
}

void sub_1000071A0(uint64_t a1)
{
}

void sub_1000071B4()
{
  byte_10000E148 = 1;
}