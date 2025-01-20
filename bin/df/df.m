void start(uint64_t a1, char *const *a2)
{
  uint64_t *v4;
  const char *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  const char **v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  int v16;
  int v17;
  int v18;
  char *v19;
  _WORD *v20;
  char *v21;
  uint64_t v22;
  char **v23;
  char *v24;
  char *v25;
  uint64_t *v26;
  const char *v27;
  int v28;
  int v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  size_t v35;
  const char *v36;
  int v37;
  const char *v38;
  char *v39;
  const char *v40;
  uint64_t v41;
  int v42;
  signed int v43;
  int v44;
  int v45;
  int v46;
  signed int v47;
  signed int v48;
  unint64_t v49;
  size_t v50;
  const char *v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  const char *v56;
  unint64_t v57;
  BOOL v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  size_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  int v72;
  int64x2_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  const char *v80;
  int v81;
  int __s1;
  void *v83;
  int v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  int v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int64x2_t v93;
  uint64_t v94;
  statfs __src;
  stat v96;
  size_t v97;
  int v98[3];
  v4 = &qword_100008000;
  LODWORD(qword_100008000) = compat_mode("bin/df", "unix2003");
  if ((_DWORD)qword_100008000)
  {
    BYTE4(qword_100008000) = 1;
    v5 = "+abcgHhIiklmnPtT:Y,";
  }

  else
  {
    v5 = "+abcgHhIiklmnPt:T:Y,";
  }

  setlocale(0, (const char *)&unk_100003B31);
  v86 = 0LL;
  v87 = 0LL;
  v85 = 0LL;
  v88 = 0;
  bzero(&v89, 0x878uLL);
  v89 = 512;
  __strlcpy_chk(&v94, "total", 1024LL, 1024LL);
  v6 = xo_parse_args(a1, a2);
  if (v6 < 0) {
    exit(1);
  }
  v7 = v6;
  v8 = 0LL;
  v9 = &qword_100008000;
  v10 = &qword_100008000;
  v11 = (const char **)&qword_100008000;
  while (1)
  {
    while (1)
    {
      v12 = v8;
      v13 = getopt_long(v7, a2, v5, (const option *)&off_100004150, 0LL);
      switch((_DWORD)v13)
      {
        case 0x2C:
          byte_100008040 = 1;
          v8 = v12;
          break;
        case 0x48:
          HIDWORD(qword_100008008) = 1;
          v8 = v12;
          break;
        case 0xFFFFFFFF:
          v26 = v9;
          v9 = (uint64_t *)optind;
          v11 = (const char **)&a2[optind];
          if (v26[6] || !(_DWORD)v12) {
            goto LABEL_64;
          }
          if (*v11)
          {
            if (stat(*v11, &v96) < 0 && *__error() == 2)
            {
              v27 = *v11++;
              qword_100008030 = (uint64_t)sub_100002E88(v27, &dword_100008038);
            }

LABEL_64:
            if (*v11) {
              goto LABEL_74;
            }
          }

          v28 = getmntinfo((statfs **)&v97, 2);
          v29 = v28;
          if (qword_100008020 | qword_100008030)
          {
            if (v28 < 1) {
              goto LABEL_87;
            }
            v33 = 0LL;
            v34 = v28;
            v35 = v97;
            v36 = (const char *)(v97 + 88);
            v29 = 0;
            do
            {
              if (!sub_100002FD4((char *)v36 - 16))
              {
                v37 = statfs(v36, (statfs *)(v35 + 2168LL * v29));
                if (byte_100008028 & 1 | (v37 < 0) && v33 != v29)
                {
                  if (v37 < 0) {
                    xo_warnx("%s stats possibly stale", v36);
                  }
                  memcpy((void *)(v35 + 2168LL * v29), v36 - 88, 0x878uLL);
                }

                ++v29;
              }

              ++v33;
              v36 += 2168;
            }

            while (v34 != v33);
          }

          else if ((byte_100008028 & 1) == 0)
          {
            v29 = getmntinfo((statfs **)&v97, 1);
          }

LABEL_88:
          xo_open_container("storage-system-information");
          xo_open_list("filesystem");
          v38 = *v11;
          if (!*v11)
          {
            LODWORD(v12) = 0;
LABEL_104:
            v85 = 0LL;
            v86 = 0LL;
            v88 = 0;
            v87 = 0LL;
            if (v29 >= 1)
            {
              v77 = v12;
              v41 = 0LL;
              v42 = 0;
              v43 = 0;
              v44 = 0;
              v45 = 0;
              v46 = 0;
              v47 = 0;
              v48 = 0;
              v78 = v29;
              v49 = qword_100008068;
              do
              {
                v81 = v42;
                __s1 = v44;
                v84 = v43;
                v50 = v97;
                if (!v49)
                {
                  getbsize(v98, &qword_100008068);
                  v49 = qword_100008068;
                }

                v51 = (const char *)(v50 + 2168 * v41);
                v52 = strlen(v51 + 1112);
                if (v48 <= v52) {
                  v48 = v52;
                }
                v79 = v48;
                v53 = strlen(v51 + 72);
                if (v47 <= v53) {
                  v54 = v53;
                }
                else {
                  v54 = v47;
                }
                v55 = *((void *)v51 + 1);
                v56 = v51 + 88;
                if (v55 < 0)
                {
                  xo_warnx("negative filesystem block count/size from fs %s", v51 + 88);
                  v55 = *((void *)v51 + 1);
                  v57 = *(unsigned int *)v51;
                  v60 = 1;
                  v49 = qword_100008068;
                }

                else
                {
                  v57 = *(unsigned int *)v51;
                  if ((_DWORD)v57) {
                    v58 = v49 > v57;
                  }
                  else {
                    v58 = 0;
                  }
                  if (v58) {
                    v59 = v55 / (uint64_t)(v49 / v57);
                  }
                  else {
                    v59 = v57 / v49 * v55;
                  }
                  v60 = v59 < 1;
                  if (v59)
                  {
                    if (v59 < 0) {
                      v59 = -v59;
                    }
                    do
                    {
                      ++v60;
                      v58 = (unint64_t)v59 > 9;
                      v59 /= 0xAuLL;
                    }

                    while (v58);
                  }
                }

                if (v46 <= v60) {
                  v46 = v60;
                }
                v61 = v55 - *(void *)(v50 + 2168 * v41 + 16);
                if (v61 < 0)
                {
                  xo_warnx("negative filesystem block count/size from fs %s", v56);
                  v57 = *(unsigned int *)v51;
                  v49 = qword_100008068;
                  v63 = 1;
                }

                else
                {
                  if (v49 > v57 && (_DWORD)v57) {
                    v62 = v61 / (uint64_t)(v49 / v57);
                  }
                  else {
                    v62 = v57 / v49 * v61;
                  }
                  v63 = v62 < 1;
                  if (v62)
                  {
                    if (v62 < 0) {
                      v62 = -v62;
                    }
                    do
                    {
                      ++v63;
                      v58 = (unint64_t)v62 > 9;
                      v62 /= 0xAuLL;
                    }

                    while (v58);
                  }
                }

                if (v45 <= v63) {
                  v45 = v63;
                }
                v64 = *(void *)(v50 + 2168 * v41 + 24);
                if (v64 < 0)
                {
                  xo_warnx("negative filesystem block count/size from fs %s", v56);
                  v49 = qword_100008068;
                  v66 = 1;
                  v47 = v54;
                  v48 = v79;
                  v42 = v81;
                  v43 = v84;
                  v44 = __s1;
                }

                else
                {
                  if (v49 > v57 && (_DWORD)v57) {
                    v65 = v64 / (uint64_t)(v49 / v57);
                  }
                  else {
                    v65 = v57 / v49 * v64;
                  }
                  v47 = v54;
                  v48 = v79;
                  v42 = v81;
                  v43 = v84;
                  v44 = __s1;
                  v66 = v65 < 1;
                  if (v65)
                  {
                    if (v65 < 0) {
                      v65 = -v65;
                    }
                    do
                    {
                      ++v66;
                      v58 = (unint64_t)v65 > 9;
                      v65 /= 0xAuLL;
                    }

                    while (v58);
                  }
                }

                if (v44 <= v66) {
                  v44 = v66;
                }
                v67 = v50 + 2168 * v41;
                v69 = *(void *)(v67 + 32);
                v68 = *(void *)(v67 + 40);
                v70 = v69 - v68 < 1;
                v71 = v69 - v68;
                if (v71)
                {
                  if (v71 < 0) {
                    v71 = -v71;
                  }
                  do
                  {
                    ++v70;
                    v58 = (unint64_t)v71 > 9;
                    v71 /= 0xAuLL;
                  }

                  while (v58);
                }

                if (v43 <= v70) {
                  v43 = v70;
                }
                v72 = v68 < 1;
                if (v68)
                {
                  if (v68 < 0) {
                    v68 = -v68;
                  }
                  do
                  {
                    ++v72;
                    v58 = (unint64_t)v68 > 9;
                    v68 /= 0xAuLL;
                  }

                  while (v58);
                }

                if (v42 <= v72) {
                  v42 = v72;
                }
                if (byte_100008010 == 1)
                {
                  v73 = (int64x2_t *)(v97 + 2168 * v41);
                  v74 = v73->i32[0] / v89;
                  v90 += v73->i64[1] * v74;
                  v91 += v73[1].i64[0] * v74;
                  v92 += v73[1].i64[1] * v74;
                  v93 = vaddq_s64(v93, v73[2]);
                }

                ++v41;
              }

              while (v41 != v78);
              v75 = 0LL;
              v86 = __PAIR64__(v45, v46);
              v87 = __PAIR64__(v43, v44);
              v88 = v42;
              v85 = __PAIR64__(v47, v48);
              v10 = &qword_100008000;
              LODWORD(v12) = v77;
              do
              {
                sub_1000030D4((unsigned int *)(v97 + v75), &v85);
                v75 += 2168LL;
              }

              while (2168LL * v78 != v75);
            }

            xo_close_list("filesystem");
            if (*((_BYTE *)v10 + 16) == 1) {
              sub_1000030D4(&v89, &v85);
            }
            v76 = xo_close_container("storage-system-information");
            if (xo_finish(v76) < 0)
            {
              v32 = "stdout";
LABEL_172:
              xo_err(1LL, v32);
            }

            exit(v12);
          }

          LODWORD(v12) = 0;
          while (2)
          {
            if (stat(v38, &v96) < 0)
            {
              v39 = sub_100002F64(*v11);
              if (v39) {
                goto LABEL_98;
              }
              xo_warn("%s", *v11);
            }

            else
            {
              if ((v96.st_mode & 0xB000 | 0x4000) == 0x6000)
              {
                v39 = sub_100002F64(*v11);
                if (!v39)
                {
                  xo_warnx("%s: not mounted", *v11);
                  goto LABEL_102;
                }
              }

              else
              {
                v39 = (char *)*v11;
              }

LABEL_98:
              if (statfs(v39, &__src) < 0)
              {
                xo_warn("%s", v39);
              }

              else if (!sub_100002FD4(__src.f_fstypename))
              {
                memcpy((void *)(v97 + 2168LL * v29++), &__src, 0x878uLL);
                goto LABEL_103;
              }
            }

LABEL_102:
            LODWORD(v12) = 1;
LABEL_103:
            v40 = v11[1];
            ++v11;
            v38 = v40;
            if (!v40) {
              goto LABEL_104;
            }
            continue;
          }

        default:
LABEL_68:
          v30 = "t";
          if (*(_DWORD *)v4) {
            v30 = (const char *)&unk_100003B31;
          }
          v31 = " [-t type]";
          if (!*(_DWORD *)v4) {
            v31 = (const char *)&unk_100003B31;
          }
          xo_error( "usage: df [--libxo] [-b | -g | -H | -h | -k | -m | -P] [-acIiln%sY] [-,] [-T type]%s\n [file | filesystem ...]\n",  v30,  v31);
          exit(64);
      }
    }

    v8 = v12;
    switch((int)v13)
    {
      case 'P':
      case 'b':
        if (*(_DWORD *)v4) {
          BYTE4(qword_100008000) = 0;
        }
        v8 = v12;
        if ((_DWORD)qword_100008008) {
          continue;
        }
        v14 = "512";
LABEL_30:
        setenv("BLOCKSIZE", v14, 1);
        HIDWORD(qword_100008008) = 0;
        v8 = v12;
        continue;
      case 'Q':
      case 'R':
      case 'S':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'd':
      case 'e':
      case 'f':
      case 'j':
        goto LABEL_68;
      case 'T':
        goto LABEL_19;
      case 'Y':
        byte_10000803C = 1;
        v8 = v12;
        continue;
      case 'a':
        continue;
      case 'c':
        *((_BYTE *)v10 + 16) = 1;
        v8 = v12;
        continue;
      case 'g':
        v14 = "1g";
        goto LABEL_30;
      case 'h':
        HIDWORD(qword_100008008) = 2;
        v8 = v12;
        continue;
      case 'i':
        BYTE4(qword_100008000) = 1;
        v8 = v12;
        continue;
      case 'k':
        LODWORD(qword_100008008) = qword_100008008 + 1;
        v14 = "1024";
        goto LABEL_30;
      case 'l':
        v8 = v12;
        if ((byte_100008014 & 1) != 0) {
          continue;
        }
        *(void *)&v96.st_dev = 3LL;
        LODWORD(v96.st_ino) = 1;
        v97 = 4LL;
        if (sysctl(&v96.st_dev, 3u, v98, &v97, 0LL, 0LL))
        {
          xo_warn("sysctl failed");
          v15 = 0LL;
          goto LABEL_56;
        }

        v16 = v98[0];
        v83 = malloc(8LL * v98[0]);
        if (!v83)
        {
          xo_warnx("malloc failed");
          v15 = 0LL;
          goto LABEL_55;
        }

        v97 = 40LL;
        LODWORD(v96.st_ino) = 2;
        if (v16 < 1) {
          goto LABEL_54;
        }
        v17 = 0;
        v18 = 0;
        do
        {
          HIDWORD(v96.st_ino) = v17;
          if (sysctl(&v96.st_dev, 4u, &__src, &v97, 0LL, 0LL))
          {
            if (*__error() != 45) {
              xo_warn("sysctl failed");
            }
          }

          else if ((__src.f_bavail & 0x100000000000LL) == 0)
          {
            v19 = strdup((const char *)&__src.f_iosize);
            v83[v18] = v19;
            if (!v19) {
              goto LABEL_53;
            }
            ++v18;
          }

          ++v17;
        }

        while (v17 < v98[0]);
        if (!v18) {
          goto LABEL_54;
        }
        v20 = malloc(33 * v18 + 2);
        if (!v20)
        {
          if (v18 >= 1) {
LABEL_53:
          }
            xo_warnx("malloc failed");
LABEL_54:
          free(v83);
          v15 = 0LL;
          v4 = &qword_100008000;
LABEL_55:
          v9 = &qword_100008000;
          goto LABEL_56;
        }

        *v20 = 28526;
        v21 = (char *)(v20 + 1);
        v80 = (const char *)v20;
        if (v18 >= 1)
        {
          v22 = v18;
          v23 = (char **)v83;
          do
          {
            v24 = *v23++;
            strlcpy(v21, v24, 0x20uLL);
            v25 = &v21[strlen(v24)];
            *v25 = 44;
            v21 = v25 + 1;
            free(v24);
            --v22;
          }

          while (v22);
        }

        *(v21 - 1) = 0;
        free(v83);
        v10 = &qword_100008000;
        v11 = (const char **)&qword_100008000;
        v4 = &qword_100008000;
        v9 = &qword_100008000;
        v15 = v80;
LABEL_56:
        qword_100008020 = (uint64_t)sub_100002E88(v15, &dword_100008018);
        byte_100008014 = 1;
        v8 = v12;
        break;
      case 'm':
        v14 = "1m";
        goto LABEL_30;
      case 'n':
        *((_BYTE *)v11 + 40) = 1;
        v8 = v12;
        continue;
      default:
        if ((_DWORD)v13 == 73)
        {
          BYTE4(qword_100008000) = 0;
          v8 = v12;
        }

        else
        {
          if ((_DWORD)v13 != 116) {
            goto LABEL_68;
          }
          v8 = 1LL;
          if (!*(_DWORD *)v4)
          {
LABEL_19:
            if (v9[6])
            {
              xo_errx(1LL, "only one -%c option may be specified", v13);
LABEL_74:
              v97 = (size_t)malloc(2168 * (v7 - (void)v9));
              if (!v97)
              {
                v32 = "malloc()";
                goto LABEL_172;
              }

LABEL_87:
              v29 = 0;
              goto LABEL_88;
            }

            v9[6] = (uint64_t)sub_100002E88(optarg, &dword_100008038);
            v8 = v12;
          }
        }

        continue;
    }
  }

  xo_emit("\n");
  return xo_close_instance("filesystem");
}
}

void *sub_100002E88(const char *a1, _DWORD *a2)
{
  if (!a1) {
    return 0LL;
  }
  v2 = a1;
  *a2 = 0;
  if (*a1 == 110 && a1[1] == 111)
  {
    v2 = a1 + 2;
    *a2 = 1;
  }

  int v3 = 0;
  for (i = v2; *i == 44; ++i)
  {
    ++v3;
LABEL_10:
    ;
  }

  if (*i) {
    goto LABEL_10;
  }
  v5 = malloc(8LL * (v3 + 2));
  v6 = v5;
  if (v5)
  {
    void *v5 = v2;
    v7 = strchr(v2, 44);
    uint64_t v8 = 1LL;
    if (v7)
    {
      do
      {
        char *v7 = 0;
        v9 = v7 + 1;
        uint64_t v10 = v8 + 1;
        v6[v8] = v9;
        v7 = strchr(v9, 44);
        uint64_t v8 = v10;
      }

      while (v7);
      uint64_t v8 = v10;
    }

    v6[v8] = 0LL;
  }

  else
  {
    xo_warnx("malloc failed");
  }

  return v6;
}

char *sub_100002F64(const char *a1)
{
  int v2 = getmntinfo(&v6, 2);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  for (i = v6->f_mntfromname; strcmp(i, a1); i += 2168)
  {
    if (!--v3) {
      return 0LL;
    }
  }

  return i - 1024;
}

uint64_t sub_100002FD4(char *__s1)
{
  if (qword_100008030)
  {
    uint64_t v2 = dword_100008038;
    uint64_t v3 = *(const char **)qword_100008030;
    if (*(void *)qword_100008030)
    {
      v4 = (const char **)(qword_100008030 + 8);
      while (strcmp(__s1, v3))
      {
        v5 = *v4++;
        uint64_t v3 = v5;
        if (!v5) {
          goto LABEL_6;
        }
      }

      uint64_t v6 = v2;
    }

    else
    {
LABEL_6:
      uint64_t v6 = (_DWORD)v2 == 0;
    }

    if (qword_100008020)
    {
      int v10 = dword_100008018;
      v11 = *(const char **)qword_100008020;
      if (*(void *)qword_100008020)
      {
        v12 = (const char **)(qword_100008020 + 8);
        while (strcmp(__s1, v11))
        {
          v13 = *v12++;
          v11 = v13;
          if (!v13) {
            goto LABEL_19;
          }
        }
      }

      else
      {
LABEL_19:
        int v10 = v10 == 0;
      }

      if (v10 == (_DWORD)v2) {
        return v2;
      }
      else {
        return v6;
      }
    }
  }

  else if (qword_100008020)
  {
    uint64_t v6 = dword_100008018;
    v7 = *(const char **)qword_100008020;
    if (*(void *)qword_100008020)
    {
      uint64_t v8 = (const char **)(qword_100008020 + 8);
      while (strcmp(__s1, v7))
      {
        v9 = *v8++;
        v7 = v9;
        if (!v9) {
          return (_DWORD)v6 == 0;
        }
      }
    }

    else
    {
      return (_DWORD)v6 == 0;
    }
  }

  else
  {
    return 0LL;
  }

  return v6;
}

uint64_t sub_1000030D4(unsigned int *a1, _DWORD *a2)
{
  if (!dword_100008054++)
  {
    int32x2_t v5 = vmax_s32(*(int32x2_t *)a2, (int32x2_t)0x40000000ALL);
    *(int32x2_t *)a2 = v5;
    if (byte_100008040 == 1)
    {
      int32x4_t v6 = *(int32x4_t *)(a2 + 2);
      v7.i64[0] = -1LL;
      v7.i64[1] = -1LL;
      int32x4_t v8 = vaddq_s32(v6, v7);
      int32x4_t v9 = vdupq_n_s32(0x55555556u);
      uint32x4_t v10 = (uint32x4_t)vuzp2q_s32( (int32x4_t)vmull_s32(*(int32x2_t *)v8.i8, *(int32x2_t *)v9.i8),  (int32x4_t)vmull_high_s32(v8, v9));
      *(int32x4_t *)(a2 + 2) = vaddq_s32((int32x4_t)vsraq_n_u32(v10, v10, 0x1FuLL), v6);
      a2[6] += (a2[6] - 1) / 3;
    }

    if (HIDWORD(qword_100008008))
    {
      qword_100008058 = (uint64_t)"   Size";
      a2[2] = 7;
      __int32 v11 = v5.i32[0];
      int32x2_t v12 = (int32x2_t)0x700000007LL;
      int v13 = 1;
    }

    else
    {
      qword_100008058 = (uint64_t)getbsize(&dword_100008050, &qword_100008048);
      int v14 = a2[2];
      if (v14 <= dword_100008050) {
        int v14 = dword_100008050;
      }
      a2[2] = v14;
      int v13 = HIDWORD(qword_100008008);
      int32x2_t v12 = *(int32x2_t *)(a2 + 3);
      __int32 v11 = *a2;
    }

    if ((_DWORD)qword_100008000) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15) {
      v16 = "Available";
    }
    else {
      v16 = "Avail";
    }
    if (v15) {
      __int32 v17 = 9;
    }
    else {
      __int32 v17 = 5;
    }
    v18.i32[0] = 4;
    v18.i32[1] = v17;
    *(int32x2_t *)(a2 + 3) = vmax_s32(v12, v18);
    xo_emit("{T:/%-*s}", v11, "Filesystem");
    if (byte_10000803C == 1) {
      xo_emit("  {T:/%-*s}", a2[1], "Type");
    }
    xo_emit(" {T:/%*s} {T:/%*s} {T:/%*s} {T:Capacity}", a2[2], (const char *)qword_100008058, a2[3], "Used", a2[4], v16);
    if (BYTE4(qword_100008000) == 1)
    {
      int v19 = 7;
      if (HIDWORD(qword_100008008))
      {
        int v20 = 0;
      }

      else
      {
        int v20 = a2[6];
        else {
          int v19 = a2[5];
        }
      }

      if (v20 <= 5) {
        int v20 = 5;
      }
      a2[5] = v19;
      a2[6] = v20;
      xo_emit(" {T:/%*s} {T:/%*s} {T:%iused}", v19 - 2, "iused", v20, "ifree", v42);
    }

    xo_emit("  {T:Mounted on}\n");
  }

  xo_open_instance("filesystem");
  if (!*a1)
  {
    xo_warnx("File system %s does not have a block size, assuming 512.", (const char *)a1 + 88);
    *a1 = 512;
  }

  xo_emit("{tk:name/%-*s}", *a2, (const char *)a1 + 1112);
  if (byte_10000803C == 1) {
    xo_emit("  {:type/%-*s}", a2[1], (const char *)a1 + 72);
  }
  if (*((void *)a1 + 1) <= *((void *)a1 + 2))
  {
    uint64_t v21 = 0LL;
  }

  else
  {
    if (!qword_100008060) {
      getbsize(&v47, &qword_100008060);
    }
    v45[2] = 0LL;
    memset(v46, 0, sizeof(v46));
    v45[0] = 5LL;
    v45[1] = 2155872256LL;
    if (getattrlist((const char *)a1 + 88, v45, v46, 0xCuLL, 0))
    {
      if (*__error() != 22) {
        xo_warn("getattrlist failed for %s", (const char *)a1 + 88);
      }
      uint64_t v21 = *((void *)a1 + 1) - *((void *)a1 + 2);
    }

    else
    {
      unint64_t v22 = *a1;
      if (!(_DWORD)v22) {
        unint64_t v22 = qword_100008060;
      }
      uint64_t v21 = *(void *)&v46[4] / v22;
    }
  }

  uint64_t v23 = *((void *)a1 + 3) + v21;
  if (HIDWORD(qword_100008008))
  {
    sub_1000037F4((uint64_t)"  {:blocks/%6s}", *((void *)a1 + 1) * *a1);
    sub_1000037F4((uint64_t)"  {:used/%6s}", v21 * *a1);
    sub_1000037F4((uint64_t)"  {:available/%6s}", *((void *)a1 + 3) * *a1);
  }

  else
  {
    if (byte_100008040) {
      v24 = " {t:total-blocks/%*j'd} {t:used-blocks/%*j'd} {t:available-blocks/%*j'd}";
    }
    else {
      v24 = " {t:total-blocks/%*jd} {t:used-blocks/%*jd} {t:available-blocks/%*jd}";
    }
    uint64_t v25 = *((void *)a1 + 1);
    uint64_t v43 = a2[2];
    v44 = v24;
    if (v25 < 0)
    {
      xo_warnx("negative filesystem block count/size from fs %s", (const char *)a1 + 88);
      uint64_t v29 = 0LL;
      unint64_t v26 = *a1;
      unint64_t v28 = qword_100008048;
      int v27 = *a1;
    }

    else
    {
      unint64_t v26 = *a1;
      int v27 = v26;
      unint64_t v28 = qword_100008048;
      if ((_DWORD)v26 && qword_100008048 > v26) {
        uint64_t v29 = v25 / (uint64_t)(qword_100008048 / v26);
      }
      else {
        uint64_t v29 = v26 / qword_100008048 * v25;
      }
    }

    uint64_t v30 = a2[3];
    if (v21 < 0)
    {
      xo_warnx("negative filesystem block count/size from fs %s", (const char *)a1 + 88);
      uint64_t v31 = 0LL;
      unint64_t v26 = *a1;
      unint64_t v28 = qword_100008048;
      int v27 = *a1;
    }

    else if (v27 && v28 > v26)
    {
      int v27 = 1;
      uint64_t v31 = v21 / (uint64_t)(v28 / v26);
    }

    else
    {
      uint64_t v31 = v26 / v28 * v21;
    }

    uint64_t v32 = a2[4];
    uint64_t v33 = *((void *)a1 + 3);
    if (v33 < 0)
    {
      xo_warnx("negative filesystem block count/size from fs %s", (const char *)a1 + 88);
      uint64_t v34 = 0LL;
    }

    else if (v27 && v28 > v26)
    {
      uint64_t v34 = v33 / (uint64_t)(v28 / v26);
    }

    else
    {
      uint64_t v34 = v26 / v28 * v33;
    }

    xo_emit(v44, v43, v29, v30, v31, v32, v34);
  }

  if ((_DWORD)qword_100008000)
  {
    if (v23)
    {
      double v35 = (double)v21 / (double)v23 * 100.0;
    }

    else
    {
      double v35 = 100.0;
    }

    double v36 = trunc(v35);
  }

  else if (v23)
  {
    double v36 = (double)v21 / (double)v23 * 100.0;
  }

  else
  {
    double v36 = 100.0;
  }

  xo_emit(" {:used-percent/%5.0f}{U:%%}", v36);
  if (BYTE4(qword_100008000) == 1)
  {
    uint64_t v38 = *((void *)a1 + 4);
    uint64_t v37 = *((void *)a1 + 5);
    uint64_t v39 = v38 - v37;
    if (HIDWORD(qword_100008008))
    {
      xo_emit("  ");
      sub_100003774((uint64_t)" {:inodes-used/%5s}", v39);
      sub_100003774((uint64_t)" {:inodes-free/%5s}", *((void *)a1 + 5));
      if (v38)
      {
LABEL_80:
        xo_emit(" {:inodes-used-percent/%4.0f}{U:%%} ");
        goto LABEL_87;
      }
    }

    else
    {
      if (byte_100008040) {
        xo_emit(" {:inodes-used/%*j'd} {:inodes-free/%*j'd}", a2[5], v38 - v37, a2[6], v37);
      }
      else {
        xo_emit(" {:inodes-used/%*jd} {:inodes-free/%*jd}");
      }
      if (v38) {
        goto LABEL_80;
      }
    }

    xo_emit(" {:inodes-used-percent/    -}{U:} ", v41);
  }

  else
  {
    xo_emit("  ", v41);
  }

uint64_t sub_100003774(uint64_t a1, uint64_t a2)
{
  if (a2 >= 0) {
    uint64_t v4 = 5LL;
  }
  else {
    uint64_t v4 = 6LL;
  }
  humanize_number(v6, v4, a2, &unk_100003B31, 32LL, 11LL);
  xo_attr("value", "%lld", a2);
  return xo_emit(a1);
}

uint64_t sub_1000037F4(uint64_t a1, uint64_t a2)
{
  if (a2 >= 0) {
    uint64_t v4 = 6LL;
  }
  else {
    uint64_t v4 = 7LL;
  }
  if (HIDWORD(qword_100008008) == 1) {
    uint64_t v5 = 15LL;
  }
  else {
    uint64_t v5 = 7LL;
  }
  if (HIDWORD(qword_100008008) == 1) {
    int32x4_t v6 = (const char *)&unk_100003B31;
  }
  else {
    int32x4_t v6 = "i";
  }
  humanize_number(v8, v4, a2, v6, 32LL, v5);
  xo_attr("value", "%lld", a2);
  return xo_emit(a1);
}