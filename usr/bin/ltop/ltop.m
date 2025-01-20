uint64_t start(int a1, char **a2)
{
  int *v4;
  int v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  int64_t v24;
  void *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  FILE *v48;
  const char *v49;
  size_t v50;
  int v51;
  int v52;
  size_t v53;
  int v54[8];
  uint64_t v55;
  int64_t v56;
  qword_100008040 = (uint64_t)*a2;
  v4 = &dword_100008000;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v5 = getopt(a1, a2, "g:hdLp:r:");
        if (v5 <= 103) {
          break;
        }
        switch(v5)
        {
          case 'p':
            dword_100008000 = atoi(optarg);
            break;
          case 'r':
            qword_100008010 = (uint64_t)optarg;
            break;
          case 'h':
            sub_1000037F0();
            goto LABEL_115;
          default:
LABEL_117:
            sub_1000037F0();
LABEL_110:
            exit(1);
        }
      }

      if (v5 <= 102) {
        break;
      }
      qword_100008008 = (uint64_t)optarg;
    }

    if (v5 != 100) {
      break;
    }
    dword_100008018 = 1;
  }

  if (v5 != -1)
  {
    if (v5 == 76)
    {
      sub_100003820();
      sub_1000038F4();
LABEL_115:
      exit(0);
    }

    goto LABEL_117;
  }

  if (optind == a1) {
    v51 = 0;
  }
  else {
    v51 = atoi(a2[optind]);
  }
  v6 = (const char *)qword_100008008;
  v7 = (const char *)qword_100008010;
  if (qword_100008008 && qword_100008010)
  {
    v48 = __stderrp;
    v49 = "Cannot specify both a resource and a group\n";
    v50 = 43LL;
LABEL_109:
    fwrite(v49, v50, 1uLL, v48);
    goto LABEL_110;
  }

  if (qword_100008008)
  {
    if (!qword_100008028)
    {
      sub_100003820();
      v6 = (const char *)qword_100008008;
    }

    v8 = dword_100008030;
    if (dword_100008030 < 1)
    {
LABEL_24:
      fprintf(__stderrp, "No such group: %s\n");
      goto LABEL_110;
    }

    v9 = (const char *)(qword_100008028 + 32);
    while (strcmp(v6, v9))
    {
      v9 += 96;
      if (!--v8) {
        goto LABEL_24;
      }
    }

    v7 = (const char *)qword_100008010;
  }

  if (!v7) {
    goto LABEL_34;
  }
  if (!qword_100008028)
  {
    sub_100003820();
    v7 = (const char *)qword_100008010;
  }

  v10 = dword_100008030;
  if (dword_100008030 < 1)
  {
LABEL_33:
    fprintf(__stderrp, "No such resource: %s\n");
    goto LABEL_110;
  }

  v11 = (const char *)qword_100008028;
  while (strcmp(v7, v11))
  {
    v11 += 96;
    if (!--v10) {
      goto LABEL_33;
    }
  }

  do
  {
LABEL_34:
    sub_100003820();
    if (*v4 < 0)
    {
      *(void *)v54 = 0x600000001LL;
      v53 = 4LL;
      if (sysctl(v54, 2u, &v52, &v53, 0LL, 0LL) < 0) {
        sub_100003B88();
      }
      v12 = v52;
    }

    else
    {
      v12 = 1;
    }

    LODWORD(v13) = 4 * v12;
    v14 = (unsigned int *)malloc(4 * v12);
    if (!v14) {
      sub_100003BA0();
    }
    v15 = v14;
    if (*v4 < 0)
    {
      v16 = v14;
      v17 = proc_listallpids(v14, 4 * v12);
      if ((v17 & 0x80000000) != 0) {
        sub_100003BB8();
      }
      v12 = v17;
      qsort(v15, v17, 4uLL, (int (__cdecl *)(const void *, const void *))sub_100003A1C);
    }

    else
    {
      v16 = v14;
      *v14 = *v4;
    }

    if (v12 >= 1)
    {
      v18 = 0LL;
      v19 = v12;
      do
      {
        v20 = v16[v18];
        if ((v20 & 0x80000000) == 0)
        {
          *__error() = 0;
          if ((ledger(0LL, v20, v54, 0LL) & 0x80000000) != 0)
          {
            if (*__error() != 2 && *__error() != 3) {
              sub_100003BD0();
            }
          }

          else
          {
            v21 = qword_100008038;
            if (qword_100008038)
            {
              v22 = qword_100008038;
              while (v55 != *(void *)v22)
              {
                v22 = *(void *)(v22 + 40);
                if (!v22) {
                  goto LABEL_51;
                }
              }

              v24 = *(void *)(v22 + 16);
            }

            else
            {
LABEL_51:
              v23 = malloc(0x30uLL);
              if (!v23)
              {
                v48 = __stderrp;
                v49 = "Out of memory";
                v50 = 13LL;
                goto LABEL_109;
              }

              v22 = (uint64_t)v23;
              v24 = v56;
              *(void *)v23 = v55;
              v23[2] = 0;
              *((void *)v23 + 4) = 0LL;
              *((void *)v23 + 5) = v21;
              *((void *)v23 + 2) = v24;
              *((void *)v23 + 3) = 0LL;
              qword_100008038 = (uint64_t)v23;
            }

            if (v24 >= dword_100008030) {
              v24 = dword_100008030;
            }
            v53 = v24;
            v25 = malloc(48 * v24);
            if ((ledger(1LL, v20, v25, &v53) & 0x80000000) != 0) {
              sub_100003BD0();
            }
            *(void *)(v22 + 24) = v25;
            *(_DWORD *)(v22 + 8) = 1;
            v13 = qword_100008020;
            if (qword_100008020)
            {
              while (*(_DWORD *)v13 != (_DWORD)v20)
              {
                v13 = *(void *)(v13 + 48);
                if (!v13) {
                  goto LABEL_63;
                }
              }
            }

            else
            {
LABEL_63:
              v26 = (char *)malloc(0x38uLL);
              if (!v26)
              {
                v48 = __stderrp;
                v49 = "Out of memory\n";
                v50 = 14LL;
                goto LABEL_109;
              }

              v13 = (uint64_t)v26;
              v27 = v26 + 8;
              if (!proc_name(v20, v26 + 8, 0x20u)) {
                __strlcpy_chk(v27, "Error", 32LL, 32LL);
              }
              *(_DWORD *)v13 = v20;
              v28 = qword_100008020;
              *(void *)(v13 + 40) = v22;
              *(void *)(v13 + 48) = v28;
              qword_100008020 = v13;
            }

            *(_DWORD *)(v13 + 4) = 1;
            v16 = v15;
          }
        }

        ++v18;
      }

      while (v18 != v19);
    }

    free(v16);
    printf( "\n%5s %32s %32s %10s  %10s  %10s  %10s  %10s \n",  "PID",  "COMMAND",  "RESOURCE",  "CREDITS",  "DEBITS",  "BALANCE",  "LIMIT",  "PERIOD");
    v29 = qword_100008020;
    if (!qword_100008020) {
      goto LABEL_115;
    }
    do
    {
      while (1)
      {
        if (!*(_DWORD *)(v29 + 4)) {
          goto LABEL_87;
        }
        printf("%5d %32s ", *(_DWORD *)v29, (const char *)(v29 + 8));
        v30 = *(uint64_t **)(v29 + 40);
        if (v30[2] >= 1) {
          break;
        }
        LODWORD(v13) = 0;
        v29 = *(void *)(v29 + 48);
        if (!v29) {
          goto LABEL_115;
        }
      }

      v31 = 0LL;
      v32 = 0LL;
      LODWORD(v13) = 0;
      v33 = v30[4];
      v34 = (const char *)qword_100008008;
      v35 = (uint64_t *)(v30[3] + 16);
      v36 = (void *)(v33 + 8);
      do
      {
        if ((!v34 || !strcmp(v34, (const char *)(qword_100008028 + v31 + 32)))
          && (!qword_100008010 || !strcmp((const char *)qword_100008010, (const char *)(qword_100008028 + v31))))
        {
          if ((_DWORD)v13) {
            printf("%5s %32s ", "", "");
          }
          printf("%32s ", (const char *)(qword_100008028 + v31));
          v37 = *(v35 - 1);
          if (v33)
          {
            sub_100003A2C(v37, v37 - *v36);
            sub_100003A2C(*v35, *v35 - v36[1]);
            v38 = *(v35 - 2);
            v39 = v38 - *(v36 - 1);
          }

          else
          {
            sub_100003A2C(v37, 0LL);
            sub_100003A2C(*v35, 0LL);
            v39 = 0LL;
            v38 = *(v35 - 2);
          }

          sub_100003A2C(v38, v39);
          v40 = v35[1];
          if (v40 == 0x7FFFFFFFFFFFFFFFLL)
          {
            printf("%10s  %10s", "none", "-");
          }

          else
          {
            sub_100003A2C(v40, 0LL);
            sub_100003A2C(v35[2], 0LL);
          }

          LODWORD(v13) = v13 + 1;
          putchar(10);
          v34 = (const char *)qword_100008008;
          v30 = *(uint64_t **)(v29 + 40);
        }

        ++v32;
        v31 += 96LL;
        v35 += 6;
        v36 += 6;
      }

      while (v30[2] > v32);
LABEL_87:
      v29 = *(void *)(v29 + 48);
    }

    while (v29);
    if (!(_DWORD)v13) {
      goto LABEL_115;
    }
    v41 = qword_100008020;
    v4 = &dword_100008000;
    if (qword_100008020)
    {
      do
      {
        v42 = *(void *)(v41 + 48);
        if (*(_DWORD *)(v41 + 4))
        {
          *(_DWORD *)(v41 + 4) = 0;
        }

        else
        {
          qword_100008020 = *(void *)(v41 + 48);
          free((void *)v41);
        }

        v41 = v42;
      }

      while (v42);
    }

    v43 = qword_100008038;
    if (qword_100008038)
    {
      do
      {
        v44 = *(void *)(v43 + 40);
        if (*(_DWORD *)(v43 + 8))
        {
          *(_DWORD *)(v43 + 8) = 0;
          free(*(void **)(v43 + 32));
          v45 = *(void *)(v43 + 24);
          *(void *)(v43 + 24) = 0LL;
          *(void *)(v43 + 32) = v45;
        }

        else
        {
          qword_100008038 = *(void *)(v43 + 40);
          free(*(void **)(v43 + 24));
          v46 = *(void **)(v43 + 32);
          if (v46) {
            free(v46);
          }
          free((void *)v43);
        }

        v43 = v44;
      }

      while (v44);
    }

    free((void *)qword_100008028);
    qword_100008028 = 0LL;
    sleep(v51);
  }

  while (v51);
  return 0LL;
}

uint64_t sub_1000037F0()
{
  return printf("%s [-hdL] [-g group] [-p pid] [-r resource] [interval]\n", (const char *)qword_100008040);
}

uint64_t sub_100003820()
{
  int v5 = dword_100008030 + 5;
  v0 = malloc(96 * (dword_100008030 + 5LL));
  if (!v0)
  {
LABEL_6:
    fwrite("Out of memory\n", 0xEuLL, 1uLL, __stderrp);
    exit(1);
  }

  v1 = v0;
  while (1)
  {
    uint64_t result = ledger(2LL, v1, &v5, 0LL);
    if ((result & 0x80000000) != 0) {
      sub_100003BE8();
    }
    uint64_t v3 = dword_100008030;
    int v4 = dword_100008030 + 5;
    dword_100008030 = v5;
    if (v5 != v4) {
      break;
    }
    free(v1);
    int v5 = v3 + 10;
    v1 = malloc(96 * (v3 + 10));
    if (!v1) {
      goto LABEL_6;
    }
  }

  qword_100008028 = (uint64_t)v1;
  return result;
}

uint64_t sub_1000038F4()
{
  uint64_t result = printf("\t%10s  %15s  %8s\n", "GROUP", "RESOURCE", "UNITS");
  int v1 = dword_100008030;
  if (dword_100008030 >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
    uint64_t v4 = qword_100008028;
    do
    {
      if (*(_BYTE *)(v4 + 96 * v3) && v3 < v1)
      {
        int v5 = (const char *)(v4 + 96 * v3 + 32);
        int v6 = v3;
        uint64_t v7 = v2;
        do
        {
          uint64_t result = strcmp((const char *)(v4 + v7 + 32), v5);
          if (!(_DWORD)result)
          {
            uint64_t result = printf( "\t%10s  %15s  %8s\n",  (const char *)(v4 + v7 + 32),  (const char *)(v4 + v7),  (const char *)(v4 + v7 + 64));
            *(_BYTE *)(qword_100008028 + v7) = 0;
            uint64_t v4 = qword_100008028;
            int v1 = dword_100008030;
          }

          v7 += 96LL;
          ++v6;
        }

        while (v1 > v6);
      }

      ++v3;
      v2 += 96LL;
    }

    while (v3 < v1);
  }

  return result;
}

uint64_t sub_100003A1C(_DWORD *a1, _DWORD *a2)
{
  return (*a2 - *a1);
}

uint64_t sub_100003A2C(uint64_t a1, uint64_t a2)
{
  if (dword_100008018) {
    a1 = a2;
  }
  if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
    return printf("%10s  ");
  }
  if (a1 >= 0) {
    unint64_t v4 = a1;
  }
  else {
    unint64_t v4 = -a1;
  }
  int v5 = "";
  if (v4 >= 0x186A1) {
    int v5 = "K";
  }
  if (v4 >= 0x989681) {
    int v6 = "M";
  }
  else {
    int v6 = v5;
  }
  if (v4 >= 0x2540BE401LL) {
    uint64_t v7 = "G";
  }
  else {
    uint64_t v7 = v6;
  }
  strlen(v7);
  return printf("%*lld%s%c ");
}

void sub_100003B80()
{
}

void sub_100003B88()
{
}

void sub_100003BA0()
{
}

void sub_100003BB8()
{
}

void sub_100003BD0()
{
}

void sub_100003BE8()
{
}