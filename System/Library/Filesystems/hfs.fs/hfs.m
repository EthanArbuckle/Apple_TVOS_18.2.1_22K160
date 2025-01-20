void start(int a1, uint64_t a2)
{
  _BYTE *v4;
  _BYTE *v5;
  unsigned int v6;
  int v7;
  char *v8;
  int v9;
  const char *v10;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  const char *v15;
  const char *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *v20;
  int v21;
  int v22;
  const char *v23;
  int v24;
  size_t v25;
  int v26;
  _DWORD *v27;
  const char *v28;
  int v29;
  int v30;
  unsigned __int16 *v31;
  pid_t v32;
  pid_t v33;
  int v34;
  _DWORD *v35;
  int v36;
  int v37;
  unsigned __int16 *v39;
  int v40;
  unsigned int *v41;
  pid_t v42;
  char *v43;
  char *v44;
  char *v45;
  passwd *v46;
  int v47;
  int v48;
  int v49;
  ssize_t v50;
  unint64_t v51;
  unsigned int *v52;
  int v53;
  unsigned int v54;
  char *v55;
  char *v56;
  __int128 v57;
  __int128 v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  char *v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  unsigned int v68;
  _WORD *v69;
  size_t v70;
  size_t v71;
  int v72;
  char *v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  __int128 v78;
  __int128 v79;
  unsigned int v80;
  void *v81;
  unint64_t v82;
  uint64_t v83;
  _WORD *v84;
  char *v85;
  uint64_t v86;
  unsigned int v87;
  CFStringRef v88;
  unsigned __int16 *v89;
  unsigned int *v90;
  int v91;
  uint64_t v92;
  unsigned int v93;
  uint64_t v94;
  char v95[1024];
  char __str[1024];
  uint64_t v97;
  _DWORD *v98;
  size_t __size[2];
  char *__endptr[129];
  unsigned __int8 uu[8];
  uint64_t v102;
  openlog("hfs.util", 1, 24);
  if (a1 < 3) {
    goto LABEL_25;
  }
  v4 = *(_BYTE **)(a2 + 8);
  if (*v4 != 45) {
    goto LABEL_25;
  }
  v5 = 0LL;
  v6 = 0;
  v7 = (char)v4[1];
  v8 = aNodev_0;
  LOBYTE(v9) = 1;
  if (v7 > 99)
  {
    v8 = (char *)1;
    switch(v4[1])
    {
      case 'k':
      case 's':
        break;
      case 'l':
      case 'n':
      case 'o':
      case 'q':
      case 'r':
      case 't':
        goto LABEL_25;
      case 'm':
LABEL_11:
        LOBYTE(v9) = 0;
        v6 = 4;
LABEL_13:
        v5 = *(_BYTE **)(a2 + 24);
        LOBYTE(v8) = v9;
        break;
      case 'p':
        v5 = 0LL;
        LOBYTE(v9) = 0;
        v6 = 3;
        break;
      case 'u':
        goto LABEL_13;
      default:
        if (v7 != 100)
        {
          v9 = 0;
          if (v7 != 101) {
            goto LABEL_25;
          }
LABEL_56:
          v20 = *(const char **)(a2 + 16);
          if (!strncmp(v20, "disk", 4uLL))
          {
            snprintf(__str, 0x400uLL, "/dev/r%s", v20);
            snprintf(v95, 0x400uLL, "/dev/%s", *(const char **)(a2 + 16));
          }

          else if (!strncmp(v20, "/dev/fd/", 8uLL))
          {
            v21 = v4[1];
            if (v21 != 112 && v21 != 107) {
              goto LABEL_26;
            }
            __strlcpy_chk(__str, v20, 1024LL, 1024LL);
          }

          v22 = (char)v4[1];
          if (v22 <= 99)
          {
            switch(v4[1])
            {
              case 'E':
                v23 = *(const char **)(a2 + 24);
                v24 = 0;
                goto LABEL_74;
              case 'F':
              case 'G':
              case 'H':
              case 'K':
              case 'L':
                goto LABEL_25;
              case 'I':
                v26 = sub_100005CE4(*(const char **)(a2 + 16));
                goto LABEL_115;
              case 'J':
                if (dword_10000C064) {
                  v28 = *(const char **)(a2 + 24);
                }
                else {
                  v28 = *(const char **)(a2 + 16);
                }
                v26 = sub_100004E40(v28, dword_10000C064);
                goto LABEL_115;
              case 'M':
                goto LABEL_75;
              case 'N':
                v26 = sub_100005F64(*(const char **)(a2 + 16));
                goto LABEL_115;
              default:
                if (v22 == 85)
                {
                  v26 = sub_100005678(*(const char **)(a2 + 16));
                }

                else
                {
                  if (v22 != 97) {
                    goto LABEL_25;
                  }
                  v26 = sub_1000034E8(v95, __str);
                }

                break;
            }

            goto LABEL_115;
          }

          switch(v4[1])
          {
            case 'k':
              v14 = sub_100003E1C(v95, __str, uu, 0);
              if (v14 == -3)
              {
                uuid_unparse(uu, (char *)__endptr);
                v25 = strlen((const char *)__endptr);
                write(1, __endptr, v25);
              }

              goto LABEL_27;
            case 'l':
            case 'n':
            case 'o':
            case 'q':
            case 'r':
            case 't':
              goto LABEL_25;
            case 'm':
LABEL_75:
              *(void *)uu = 0LL;
              v102 = 0LL;
              v98 = 0LL;
              if (!v5 || !*v5) {
                goto LABEL_152;
              }
              v97 = 0LL;
              if (sub_100003E1C(v95, __str, (unsigned __int8 *)__size, 0) != -3
                || uuid_is_null((const unsigned __int8 *)__size))
              {
                if (dword_10000C060)
                {
                  v97 = 0LL;
                  goto LABEL_129;
                }

                sub_1000034E8(v95, __str);
              }

              else if (!sub_100003890(&v98))
              {
                v27 = v98;
                sub_100003DCC(v27);
LABEL_129:
                v42 = fork();
                if (v42 == -1) {
                  goto LABEL_152;
                }
                v33 = v42;
                if (!v42)
                {
                  if (v6) {
                    v43 = aR;
                  }
                  else {
                    v43 = aW;
                  }
                  if (v9) {
                    v44 = aSuid_0;
                  }
                  else {
                    v44 = aNosuid_0;
                  }
                  if ((v97 & 1) != 0) {
                    v45 = aPerm;
                  }
                  else {
                    v45 = aNoperm;
                  }
                  v46 = getpwuid(0);
                  v47 = 0;
                  if (v46)
                  {
                    __strlcpy_chk(__endptr, v46->pw_dir, 1025LL, 1025LL);
                    __strlcat_chk(__endptr, "/.CFUserTextEncoding", 1025LL, 1025LL);
                    v48 = open((const char *)__endptr, 0, 0LL);
                    if (v48 > 0)
                    {
                      v49 = v48;
                      v50 = read(v48, __endptr, 0x400uLL);
                      *((_BYTE *)__endptr + (v50 & ~(v50 >> 63))) = 0;
                      close(v49);
                      v51 = strtol((const char *)__endptr, 0LL, 0);
                      if (HIDWORD(v51)) {
                        __assert_rtn( "__CFStringGetDefaultEncodingForHFSUtil",  "hfsutil_main.c",  292,  "encoding > -1 && encoding <= UINT_MAX");
                      }
                      v47 = v51;
                    }

                    else
                    {
                      v47 = 0;
                    }
                  }

                  snprintf((char *)uu, 0x10uLL, "-e=%d", v47);
                  execl( aSbinMount,  aSbinMount,  v43,  "-o",  v44,  "-o",  v8,  "-o",  uu,  "-o",  v45,  "-o",  "-u=unknown,-g=unknown,-m=0777",  "-t",  &unk_10000C000,  v95,  v5,  0LL);
                  goto LABEL_152;
                }

LABEL_143:
                if (wait4(v33, (int *)__endptr, 0, 0LL) != v33)
                {
LABEL_152:
                  v14 = -4;
                  goto LABEL_27;
                }

                v14 = -4;
                if (((uint64_t)__endptr[0] & 0x7F) == 0)
                {
                  else {
                    v14 = -3;
                  }
                }

LABEL_27:
                exit(v14);
              }

              v97 = 1LL;
              goto LABEL_129;
            case 'p':
              v29 = sub_100004354(__str, v95);
              if (v29 < 0) {
                goto LABEL_152;
              }
              v30 = v29;
              v31 = (unsigned __int16 *)malloc(0x200uLL);
              if (!v31)
              {
                v14 = -2;
                goto LABEL_186;
              }

              v39 = v31;
              v14 = -4;
              if ((sub_1000045D0(v30, v31, 1024LL, 0x200uLL) & 0xFFFFFFFDLL) == 0xFFFFFFFCLL) {
                goto LABEL_185;
              }
              v94 = 0LL;
              v40 = *v39;
              if (v40 == 11080 || v40 == 22600) {
                goto LABEL_125;
              }
              if (v40 != 17474 || v39[62] != 11080)
              {
                v14 = -2;
                goto LABEL_185;
              }

LABEL_125:
              v41 = (unsigned int *)malloc(0x200uLL);
              if (!v41)
              {
                v14 = -4;
LABEL_185:
                free(v39);
LABEL_186:
                if (v30 >= 1) {
                  close(v30);
                }
                goto LABEL_27;
              }

              v52 = v41;
              if ((sub_1000045D0(v30, v41, v94 + 1024, 0x200uLL) & 0xFFFFFFFDLL) == 0xFFFFFFFCLL)
              {
                v14 = -4;
LABEL_182:
                free(v52);
LABEL_183:
                if (v14 == -3)
                {
                  v70 = strlen((const char *)__endptr);
                  write(1, __endptr, v70);
                  v14 = -1;
                }

                goto LABEL_185;
              }

              v53 = *(unsigned __int16 *)v52;
              if (v53 != 22600 && v53 != 11080 || (v54 = v52[10], (v55 = (char *)malloc(0x40uLL)) == 0LL))
              {
                v14 = -4;
                goto LABEL_182;
              }

              v56 = v55;
              v89 = v39;
              v90 = v52;
              v91 = v30;
              v93 = bswap32(v54);
              v57 = *((_OWORD *)v52 + 19);
              *(_OWORD *)v55 = *((_OWORD *)v52 + 18);
              *((_OWORD *)v55 + 1) = v57;
              v58 = *((_OWORD *)v52 + 21);
              *((_OWORD *)v55 + 2) = *((_OWORD *)v52 + 20);
              *((_OWORD *)v55 + 3) = v58;
              if (*((_DWORD *)v55 + 15))
              {
                v59 = 8;
                v92 = (uint64_t)(v52 + 52);
                v14 = sub_1000046C4( v30,  v94,  v93,  8u,  (uint64_t)(v52 + 52),  (unsigned int *)__endptr,  (unsigned int *)uu);
                if (v14 == -3)
                {
                  v60 = *(_DWORD *)uu;
                  if (*(_DWORD *)uu)
                  {
                    v61 = LODWORD(__endptr[0]);
                    v62 = (char *)malloc(LODWORD(__endptr[0]));
                    if (!v62)
                    {
                      free(v52);
                      v14 = -4;
LABEL_180:
                      free(v56);
LABEL_181:
                      v52 = (unsigned int *)v62;
                      v30 = v91;
                      v39 = v89;
                      if (!v62) {
                        goto LABEL_183;
                      }
                      goto LABEL_182;
                    }

                    v63 = sub_10000479C(v30, v62, v61 * (unint64_t)v60, v61, v94, v93, 8u, v92);
                    if (v63 != -4)
                    {
                      v14 = v63;
                      v71 = 64LL;
                      v72 = v91;
                      while (v62[8] == 255)
                      {
                        if (*((_WORD *)v62 + 5))
                        {
                          v73 = &v62[bswap32(*(unsigned __int16 *)&v62[v61 - 2]) >> 16];
                          if (*((_DWORD *)v73 + 1) != 0x4000000) {
                            goto LABEL_167;
                          }
                          v71 += 64LL;
                          v74 = __rev16(*((unsigned __int16 *)v62 + 5)) - 1LL;
                          v75 = &v62[v61 - 4];
                          while (1)
                          {
                            v56 = (char *)realloc(v56, v71);
                            v76 = &v56[8 * v59];
                            v77 = &v73[bswap32(*(unsigned __int16 *)v73) >> 16];
                            v78 = *(_OWORD *)(v77 + 18);
                            *(_OWORD *)v76 = *(_OWORD *)(v77 + 2);
                            *((_OWORD *)v76 + 1) = v78;
                            v79 = *(_OWORD *)(v77 + 50);
                            *((_OWORD *)v76 + 2) = *(_OWORD *)(v77 + 34);
                            *((_OWORD *)v76 + 3) = v79;
                            v59 += 8;
                            if (!v74) {
                              break;
                            }
                            v80 = *(unsigned __int16 *)v75;
                            v75 -= 2;
                            v73 = &v62[bswap32(v80) >> 16];
                            v71 += 64LL;
                            --v74;
                            if (*((_DWORD *)v73 + 1) != 0x4000000) {
                              goto LABEL_167;
                            }
                          }

                          v72 = v91;
                        }

                        if (!*(_DWORD *)v62) {
                          goto LABEL_167;
                        }
                        v14 = sub_10000479C( v72,  v62,  v61 * (unint64_t)bswap32(*(_DWORD *)v62),  v61,  v94,  v93,  8u,  v92);
                        if (v14 == -4) {
                          break;
                        }
                      }
                    }

                    v14 = -4;
LABEL_167:
                    free(v62);
                  }
                }

                if (v14 != -3) {
                  goto LABEL_178;
                }
              }

              else
              {
                v59 = 8;
              }

              v64 = sub_1000046C4(v91, v94, v93, v59, (uint64_t)v56, (unsigned int *)__size, (unsigned int *)&v98);
              if (v64 == -3)
              {
                v65 = LODWORD(__size[0]);
                v62 = (char *)malloc(LODWORD(__size[0]));
                if (v62
                  && sub_10000479C( v91,  v62,  v98 * (unint64_t)v65,  v65,  v94,  v93,  v59,  (uint64_t)v56) != -4 && *((_WORD *)v62 + 5)
                  && (v66 = bswap32(*(unsigned __int16 *)&v62[v65 - 2]) >> 16,
                      v67 = &v62[v66],
                      *(_DWORD *)&v62[v66 + 2] == 0x1000000)
                  && (v68 = *((unsigned __int16 *)v67 + 3), !*((_WORD *)v67 + 3))
                  && (v69 = malloc(0x200uLL)) != 0LL)
                {
                  v81 = v69;
                  v82 = __rev16(v68);
                  *v69 = v82;
                  if (v68)
                  {
                    if (v82 <= 1) {
                      v83 = 1LL;
                    }
                    else {
                      v83 = v82;
                    }
                    v84 = v69 + 1;
                    v85 = &v62[v66 + 8];
                    v86 = v83;
                    do
                    {
                      v87 = *(unsigned __int16 *)v85;
                      v85 += 2;
                      *v84++ = bswap32(v87) >> 16;
                      --v86;
                    }

                    while (v86);
                  }

                  else
                  {
                    v83 = 0LL;
                    v82 = 0LL;
                  }

                  v69[v83 + 1] = 0;
                  v88 = CFStringCreateWithCharacters(kCFAllocatorDefault, v69 + 1, v82);
                  CFStringGetCString(v88, (char *)__endptr, 766LL, 0x8000100u);
                  CFRelease(v88);
                  free(v81);
                  v14 = -3;
                }

                else
                {
                  v14 = -4;
                }

LABEL_179:
                free(v90);
                if (!v56) {
                  goto LABEL_181;
                }
                goto LABEL_180;
              }

              v14 = v64;
LABEL_178:
              v62 = 0LL;
              goto LABEL_179;
            case 's':
              arc4random_buf(uu, 8uLL);
              __endptr[0] = 0LL;
              v14 = sub_10000405C(v95, __endptr);
              if (v14 != -3) {
                goto LABEL_27;
              }
              if (__endptr[0]) {
                v26 = sub_100004104(__endptr[0], (int8x8_t *)uu);
              }
              else {
                v26 = sub_10000419C(v95, (int8x8_t *)uu);
              }
              goto LABEL_115;
            case 'u':
              if (!v5) {
                goto LABEL_152;
              }
              if (!*v5) {
                goto LABEL_152;
              }
              v32 = fork();
              if (v32 == -1) {
                goto LABEL_152;
              }
              v33 = v32;
              if (v32) {
                goto LABEL_143;
              }
              execl(aSbinUmount, aSbinUmount, v5, 0LL);
              goto LABEL_152;
            default:
              if (v22 != 100)
              {
                if (v22 != 101) {
                  goto LABEL_25;
                }
                v23 = *(const char **)(a2 + 24);
                v24 = 1;
LABEL_74:
                v26 = sub_100006498(v23, v24);
LABEL_115:
                v14 = v26;
                goto LABEL_27;
              }

              *(void *)uu = 0LL;
              v14 = sub_100003E1C(v95, __str, (unsigned __int8 *)__endptr, 1);
              if (v14 == -3)
              {
                v34 = sub_100003890(uu);
                v35 = *(_DWORD **)uu;
                if (!v34)
                {
                  sub_100003A68(*(uint64_t *)uu, (unsigned __int8 *)__endptr, (uint64_t *)__size);
                  v36 = sub_100003C8C((uint64_t)v35, (unsigned __int8 *)__endptr, 0LL);
                  if (v36) {
                    v34 = v36;
                  }
                  else {
                    v34 = -3;
                  }
                }

                if (v35)
                {
                  v37 = sub_100003DCC(v35);
                  if (v34 == -3) {
                    v34 = v37;
                  }
                }

                if (v34 == -3 || v34 == 0) {
                  v14 = v34;
                }
                else {
                  v14 = -4;
                }
              }

              goto LABEL_27;
          }
        }

        LOBYTE(v8) = 1;
        break;
    }
  }

  else
  {
    v9 = 0;
    switch(v4[1])
    {
      case 'E':
      case 'I':
      case 'N':
        goto LABEL_56;
      case 'F':
      case 'G':
      case 'H':
      case 'K':
      case 'L':
        goto LABEL_25;
      case 'J':
        v10 = *(const char **)(a2 + 16);
        if ((*v10 - 48) <= 9)
        {
          v11 = strtoul(v10, __endptr, 0);
          if (v11 >= 0x7FFFFFFF) {
            __assert_rtn("ParseArgs", "hfsutil_main.c", 1230, "size < INT_MAX");
          }
          dword_10000C064 = v11;
          if (__endptr[0])
          {
            v12 = __tolower(*__endptr[0]) - 103;
            else {
              v13 = dword_100006C20[v12];
            }
            dword_10000C064 *= v13;
          }
        }

        v5 = 0LL;
        v6 = 0;
        v9 = 0;
        goto LABEL_56;
      case 'M':
        goto LABEL_11;
      default:
        if (v7 == 85)
        {
          v9 = 0;
          goto LABEL_56;
        }

        LOBYTE(v8) = 1;
        if (v7 != 97) {
          goto LABEL_25;
        }
        break;
    }
  }

  if (strlen(*(const char **)(a2 + 16)) - 256 <= 0xFFFFFFFFFFFFFF02LL)
  {
LABEL_25:
    sub_1000035B0((const char **)a2);
LABEL_26:
    v14 = -6;
    goto LABEL_27;
  }

  if ((v9 & 1) != 0)
  {
    v6 = 0;
    v9 = 0;
    v8 = aNodev_0;
    goto LABEL_56;
  }

  v15 = *(const char **)(a2 + 8LL * v6);
  if (!strcmp(v15, "removable"))
  {
    dword_10000C060 = 1;
  }

  else if (!strcmp(v15, "fixed"))
  {
    dword_10000C060 = 0;
  }

  else
  {
    printf("hfs.util: ERROR: unrecognized flag (removable/fixed) argv[%d]='%s'\n", v6, v15);
  }

  v16 = *(const char **)(a2 + 8LL * (v6 + 1));
  if (!strcmp(v16, "readonly"))
  {
    v17 = 1;
  }

  else
  {
    if (strcmp(v16, "writable")) {
      printf("hfs.util: ERROR: unrecognized flag (readonly/writable) argv[%d]='%s'\n", v6, v16);
    }
    v17 = 0;
  }

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }

  else
  {
    v18 = *(const char **)(a2 + 8LL * (v6 + 2));
    if (!strcmp(v18, "suid"))
    {
      v9 = 1;
    }

    else
    {
      if (strcmp(v18, "nosuid")) {
        printf("hfs.util: ERROR: unrecognized flag (suid/nosuid) argv[%d]='%s'\n", v6, v18);
      }
      v9 = 0;
    }

    v19 = *(const char **)(a2 + 8LL * (v6 + 3));
    if (!strcmp(v19, "dev"))
    {
      v8 = aDev_1;
LABEL_52:
      v6 = v17;
      goto LABEL_56;
    }

    if (strcmp(v19, "nodev")) {
      printf("hfs.util: ERROR: unrecognized flag (dev/nodev) argv[%d]='%s'\n", v6, v19);
    }
  }

  v8 = aNodev_0;
  goto LABEL_52;
}

uint64_t sub_1000034E8(const char *a1, const char *a2)
{
  v9 = 0LL;
  uint64_t result = sub_100003E1C(a1, a2, v10, 1);
  if ((_DWORD)result == -3)
  {
    unsigned int v3 = sub_100003890(&v9);
    v4 = v9;
    if (!v3)
    {
      sub_100003A68((uint64_t)v9, v10, &v8);
      unsigned int v5 = sub_100003C8C((uint64_t)v4, v10, 1uLL);
      if (v5) {
        unsigned int v3 = v5;
      }
      else {
        unsigned int v3 = -3;
      }
    }

    if (v4)
    {
      unsigned int v6 = sub_100003DCC(v4);
      if (v3 == -3) {
        unsigned int v3 = v6;
      }
    }

    if (v3 == -3 || v3 == 0) {
      return v3;
    }
    else {
      return 4294967292LL;
    }
  }

  return result;
}

uint64_t sub_1000035B0(const char **a1)
{
  return printf("       %s -m disk0s2 /my/hfs removable readonly nosuid nodev\n", *a1);
}

void sub_1000037A0(unsigned int *a1, uuid_t uu)
{
  if (*a1 && (unsigned int v3 = a1[1]) != 0)
  {
    data[0] = bswap32(*a1);
    data[1] = bswap32(v3);
    CC_MD5_Init(&c);
    CC_MD5_Update(&c, &unk_100006C0E, 0x10u);
    CC_MD5_Update(&c, data, 8u);
    CC_MD5_Final(uu, &c);
    uu[6] = uu[6] & 0xF | 0x30;
    uu[8] = uu[8] & 0x3F | 0x80;
  }

  else
  {
    uuid_clear(uu);
  }
}

uint64_t sub_100003890(void *a1)
{
  *a1 = 0LL;
  v2 = malloc(0x18uLL);
  if (!v2) {
    return 12LL;
  }
  unsigned int v3 = v2;
  v2[3] = 2;
  int v4 = open(aVarDbVolinfoDa, 514, 420LL);
  v3[2] = v4;
  if (v4 == -1 && (v3[3] = 0, int v5 = open(aVarDbVolinfoDa, 512, 420LL), v3[2] = v5, v5 == -1))
  {
    uint64_t v6 = *__error();
    free(v3);
  }

  else
  {
    *(void *)unsigned int v3 = 1972467511LL;
    *a1 = v3;
    sub_100003958((uint64_t)v3);
    return 0LL;
  }

  return v6;
}

uint64_t sub_100003958(uint64_t a1)
{
  if (*(void *)a1 != 1972467511LL) {
    return 22LL;
  }
  v1 = (int *)(a1 + 8);
  uint64_t v2 = flock(*(_DWORD *)(a1 + 8), 2);
  if (!(_DWORD)v2)
  {
    lseek(*v1, 0LL, 0);
    if (read(*v1, v6, 0x1BuLL) == 27 && v6[16] == 58 && v6[17] == 32 && v6[26] == 10)
    {
      uint64_t v2 = stat(aVarDbVolinfoDa, &v5);
      if (!(_DWORD)v2)
      {
        unsigned int v3 = malloc(0LL);
        if (v3) {
          sub_10000685C(v1, v3);
        }
        uint64_t v2 = 12LL;
      }
    }

    flock(*v1, 8);
  }

  return v2;
}

uint64_t sub_100003A68(uint64_t a1, unsigned __int8 *a2, uint64_t *a3)
{
  if (*(void *)a1 != 1972467511LL) {
    return 22LL;
  }
  uint64_t v6 = flock(*(_DWORD *)(a1 + 8), 1);
  if (!(_DWORD)v6)
  {
    if (sub_100003B88(a1, a2, v15))
    {
      uint64_t v6 = 0xFFFFFFFFLL;
    }

    else
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      do
      {
        int v9 = *((char *)&v15[2] + v7 + 7);
        if (!*((_BYTE *)&v15[2] + v7 + 7)) {
          break;
        }
        unsigned int v10 = v9 - 48;
        unsigned int v11 = v9 - 65;
        else {
          unsigned int v12 = v9 - 87;
        }
        unsigned int v13 = v9 - 55;
        if (v11 > 5) {
          unsigned int v13 = v12;
        }
        if (v10 <= 9) {
          unsigned int v13 = v10;
        }
        uint64_t v8 = 16 * v8 + v13;
        ++v7;
      }

      while (v7 != 8);
      uint64_t v6 = 0LL;
      *a3 = v8 | 0x80000000LL;
    }

    flock(*(_DWORD *)(a1 + 8), 8);
  }

  return v6;
}

uint64_t sub_100003B88(uint64_t a1, unsigned __int8 *uu, _OWORD *a3)
{
  do
  {
    *(void *)(a1 + 16) = lseek(*(_DWORD *)(a1 + 8), 0LL, 1);
    if (BYTE6(v13) != 32 || HIBYTE(v13) != 10) {
      return 0xFFFFFFFFLL;
    }
    __int128 v8 = v12[0];
    __int128 v9 = v12[1];
    __int128 v10 = v13;
  }

  while (strcmp((const char *)&v8, out));
  uint64_t result = 0LL;
  if (a3)
  {
    __int128 v7 = v9;
    *a3 = v8;
    a3[1] = v7;
    a3[2] = v10;
  }

  return result;
}

uint64_t sub_100003C8C(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  uint64_t result = 22LL;
  if (a3 <= 1 && *(void *)a1 == 1972467511LL)
  {
    unsigned int v5 = a3;
    uint64_t result = flock(*(_DWORD *)(a1 + 8), 2);
    if (!(_DWORD)result)
    {
      uuid_unparse(a2, out);
      __int16 v15 = 8250;
      uint64_t v7 = 39LL;
      do
      {
        unint64_t v8 = v5 >> 28;
        if (v8 >= 0xA) {
          char v9 = v8 + 55;
        }
        else {
          char v9 = v8 | 0x30;
        }
        out[v7] = v9;
        v5 *= 16;
        ++v7;
      }

      while ((_DWORD)v7 != 47);
      char v16 = 10;
      int v10 = sub_100003B88(a1, a2, 0LL);
      if (v10 == -1)
      {
        int v11 = *(_DWORD *)(a1 + 8);
        off_t v12 = 0LL;
        int v13 = 2;
      }

      else
      {
        if (v10)
        {
LABEL_14:
          flock(*(_DWORD *)(a1 + 8), 8);
          return 0LL;
        }

        int v11 = *(_DWORD *)(a1 + 8);
        off_t v12 = *(void *)(a1 + 16);
        int v13 = 0;
      }

      lseek(v11, v12, v13);
      write(*(_DWORD *)(a1 + 8), out, 0x30uLL);
      fsync(*(_DWORD *)(a1 + 8));
      goto LABEL_14;
    }
  }

  return result;
}

uint64_t sub_100003DCC(_DWORD *a1)
{
  if (*(void *)a1 != 1972467511LL) {
    return 22LL;
  }
  *(void *)a1 = 0LL;
  close(a1[2]);
  free(a1);
  return 0LL;
}

uint64_t sub_100003E1C(const char *a1, const char *a2, unsigned __int8 *a3, int a4)
{
  v14 = 0LL;
  uint64_t result = sub_10000405C(a1, &v14);
  if ((_DWORD)result != -3) {
    return result;
  }
  char v9 = v14;
  if (v14)
  {
    int v15 = 5;
    __int128 v16 = xmmword_100006C40;
    int v17 = 0;
    if (!getattrlist(v14, &v15, src, 0x24uLL, 0))
    {
      if (!v20 || !v21)
      {
        uuid_clear(a3);
        goto LABEL_13;
      }

      int v15 = 5;
      __int128 v16 = xmmword_100006C50;
      int v17 = 0;
      if (!getattrlist(v9, &v15, v22, 0x14uLL, 0))
      {
        uuid_copy(a3, (const unsigned __int8 *)v22 + 4);
LABEL_13:
        int v13 = -3;
        goto LABEL_20;
      }
    }
  }

  else
  {
    int v10 = (unsigned int *)malloc(0x200uLL);
    if (v10)
    {
      int v11 = v10;
      int v12 = sub_100004354(a2, a1);
      if (v12 > 0 || *__error() == 16 && (int v12 = open(a2, 0, 0LL), v12 >= 1))
      {
        if (sub_1000044C0(v12, v11, (unint64_t *)&v15, v22) == -3)
        {
          int8x8_t v18 = vrev32_s8(*(int8x8_t *)v22[0]);
          sub_1000037A0((unsigned int *)&v18, (unsigned __int8 *)src);
          uuid_copy(a3, (const unsigned __int8 *)src);
          int v13 = -3;
        }

        else
        {
          int v13 = -4;
        }

        close(v12);
        free(v11);
        goto LABEL_20;
      }

      free(v11);
    }
  }

  int v13 = -4;
LABEL_20:
  if (v13 != -3) {
    return 4294967292LL;
  }
  if (!a4 || !uuid_is_null(a3)) {
    return 4294967293LL;
  }
  arc4random_buf(src, 8uLL);
  if (v9) {
    return sub_100004104(v9, src);
  }
  else {
    return sub_10000419C(a1, src);
  }
}

uint64_t sub_10000405C(const char *a1, void *a2)
{
  *a2 = 0LL;
  int v4 = getmntinfo(&v8, 2);
  if (!v4) {
    return 4294967292LL;
  }
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    for (i = v8->f_mntfromname; strcmp(a1, i); i += 2168)
    {
      if (!--v5) {
        return 4294967293LL;
      }
    }

    if (strcmp(i - 1040, "hfs")) {
      return 4294967294LL;
    }
    *a2 = i - 1024;
  }

  return 4294967293LL;
}

uint64_t sub_100004104(const char *a1, int8x8_t *a2)
{
  int v8 = 5;
  __int128 v9 = xmmword_100006C40;
  int v10 = 0;
  uint64_t v4 = 4294967292LL;
  if (!getattrlist(a1, &v8, v6, 0x24uLL, 0))
  {
    v7[3] = vrev32_s8(*a2);
    if (setattrlist(a1, &v8, v7, 0x20uLL, 0)) {
      return 4294967292LL;
    }
    else {
      return 4294967293LL;
    }
  }

  return v4;
}

uint64_t sub_10000419C(const char *a1, int8x8_t *a2)
{
  uint64_t v4 = malloc(0x200uLL);
  if (!v4) {
    return 4294967292LL;
  }
  uint64_t v5 = v4;
  int v6 = open(a1, 2, 0LL);
  if (v6 <= 0)
  {
    free(v5);
    return 4294967292LL;
  }

  int v7 = v6;
  int v8 = sub_1000044C0(v6, (unsigned int *)v5, &v17, (unsigned __int16 **)&v16);
  if (v8 == -3)
  {
    *__int128 v16 = vrev32_s8(*a2);
    unint64_t v9 = v17;
    if (ioctl(v7, 0x40046418uLL, &v18) < 0
      || (off_t v10 = (uint64_t)(v9 + 1024) / v18 * v18,
          uint64_t v11 = (uint64_t)(v9 + 1024) % v18,
          int64_t v12 = (v11 + v18 + 511) / v18 * v18,
          (int v13 = (char *)malloc(v12)) == 0LL))
    {
      int v8 = -4;
    }

    else
    {
      v14 = v13;
      if (lseek(v7, v10, 0) != v10 || (v10 % v18 || v12 % v18) && read(v7, v14, v12) != v12)
      {
        int v8 = -4;
      }

      else
      {
        memmove(&v14[v11], v5, 0x200uLL);
        int v8 = -4;
        if (lseek(v7, v10, 0) == v10)
        {
          if (write(v7, v14, v12) == v12) {
            int v8 = -3;
          }
          else {
            int v8 = -4;
          }
        }
      }

      free(v14);
    }
  }

  close(v7);
  free(v5);
  if (v8 == -3) {
    return 4294967293LL;
  }
  else {
    return 4294967292LL;
  }
}

uint64_t sub_100004354(const char *a1, const char *a2)
{
  unint64_t v9 = 0LL;
  if (!strncmp(a1, "/dev/rdisk", 0xAuLL))
  {
    if (sub_10000405C(a2, &v9) == -3)
    {
      if (!v9) {
        return open(a1, 0, 0LL);
      }
      *(_DWORD *)__dst = 5;
      __int128 v12 = xmmword_100006C60;
      int v13 = 0;
      if (!getattrlist(v9, __dst, &v10, 0x40CuLL, 0)) {
        printf("%.*s", SLODWORD(v10.st_ino), (const char *)&v10.st_mode + *(int *)&v10.st_mode);
      }
    }

    return 0xFFFFFFFFLL;
  }

  if (strncmp(a1, "/dev/fd/", 8uLL)) {
    return 0xFFFFFFFFLL;
  }
  BYTE6(v12) = 0;
  uint64_t v4 = strncpy(__dst, a1 + 8, 0xAuLL);
  int v5 = strtol(v4, &__endptr, 10);
  if (*__endptr) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = v5;
  if (fstat(v5, &v10)) {
    return 0xFFFFFFFFLL;
  }
  if (lseek(v6, 0LL, 0) == -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v6;
  }
}

uint64_t sub_1000044C0(int a1, unsigned int *a2, unint64_t *a3, unsigned __int16 **a4)
{
  *a3 = 0LL;
  int v8 = *(unsigned __int16 *)a2;
  if (v8 != 17474) {
    goto LABEL_8;
  }
  if (*((_WORD *)a2 + 62) != 11080)
  {
LABEL_6:
    stat v10 = (unsigned __int16 *)(a2 + 29);
LABEL_11:
    *a4 = v10;
    return 4294967293LL;
  }

  *a3 = v9;
  int v8 = *(unsigned __int16 *)a2;
  if (v8 == 17474) {
    goto LABEL_6;
  }
LABEL_8:
  if (v8 == 22600 || v8 == 11080)
  {
    stat v10 = (unsigned __int16 *)(a2 + 26);
    goto LABEL_11;
  }

  return 4294967294LL;
}

uint64_t sub_1000045D0(int a1, void *a2, uint64_t a3, size_t a4)
{
  if (ioctl(a1, 0x40046418uLL, &v14) < 0) {
    return -4LL;
  }
  uint64_t v8 = a3 % v14;
  size_t v9 = (uint64_t)(v8 + a4 + v14 - 1) / v14 * v14;
  stat v10 = (char *)malloc(v9);
  if (!v10) {
    return -4LL;
  }
  uint64_t v11 = v10;
  if (lseek(a1, a3 - v8, 0) == a3 - v8 && read(a1, v11, v9) == v9)
  {
    memmove(a2, &v11[v8], a4);
    uint64_t v12 = -3LL;
  }

  else
  {
    uint64_t v12 = -4LL;
  }

  free(v11);
  return v12;
}

uint64_t sub_1000046C4( int a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, unsigned int *a6, unsigned int *a7)
{
  int v14 = (char *)malloc(0x200uLL);
  if (!v14) {
    return 4294967292LL;
  }
  int v15 = v14;
  uint64_t v16 = sub_10000479C(a1, v14, 0LL, 512LL, a2, a3, a4, a5);
  if ((_DWORD)v16 != -4)
  {
    if (v15[8] == 1)
    {
      *a6 = bswap32(*((unsigned __int16 *)v15 + 16)) >> 16;
      unsigned int v17 = *((_DWORD *)v15 + 5);
      if (v17) {
        unsigned int v17 = bswap32(*((_DWORD *)v15 + 6));
      }
      *a7 = v17;
    }

    else
    {
      uint64_t v16 = 4294967292LL;
    }
  }

  free(v15);
  return v16;
}

uint64_t sub_10000479C( int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  if (a4 < 1) {
    return 4294967293LL;
  }
  if (!a7) {
    return 4294967292LL;
  }
  int64_t v9 = a4;
  uint64_t v13 = a6;
  int v14 = (unsigned int *)(a8 + 4);
  uint64_t v15 = a7;
LABEL_4:
  uint64_t v16 = a3 / v13;
  uint64_t v17 = a3 % v13;
  uint64_t v18 = v15;
  for (i = v14; *i; i += 2)
  {
    unsigned int v20 = bswap32(*i);
    if (v16 < v20)
    {
      unsigned int v21 = bswap32(*(i - 1)) + v16;
      else {
        int64_t v22 = v13 * (unint64_t)(v20 - v16) - v17;
      }
      a3 += v22;
      a2 += v22;
      uint64_t result = 4294967293LL;
      BOOL v24 = v9 <= v22;
      v9 -= v22;
      if (v24) {
        return result;
      }
      goto LABEL_4;
    }

    LODWORD(v16) = v16 - v20;
    if (!--v18) {
      return 4294967292LL;
    }
  }

  return 4294967292LL;
}

uint64_t sub_1000048AC(const char *a1)
{
  v6[0] = 0x400000000005LL;
  v6[1] = 0LL;
  v6[2] = 0LL;
  uint64_t v5 = 0LL;
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  if (getattrlist(a1, v6, &v3, 0x28uLL, 0)) {
    return *__error();
  }
  if ((v4 & 0x4000) != 0)
  {
    printf("hide: %s is alreadly invisible\n", a1);
    return 0LL;
  }

  else
  {
    LOWORD(v4) = v4 | 0x4000;
    uint64_t result = setattrlist(a1, v6, (char *)&v3 + 8, 0x20uLL, 0);
    if ((_DWORD)result == -1) {
      return *__error();
    }
  }

  return result;
}

uint64_t sub_100004964(const char *a1)
{
  int v2 = open(a1, 0);
  if (v2 < 0) {
    return -1LL;
  }
  int v3 = v2;
  if (fstat(v2, &v11) < 0)
  {
    uint64_t v8 = __stderrp;
    int64_t v9 = __error();
    strerror(*v9);
    fprintf(v8, "can't stat %s (%s)\n");
    goto LABEL_16;
  }

  uint64_t st_blksize = v11.st_blksize;
  if (v11.st_size <= 0)
  {
    uint64_t v6 = 0LL;
LABEL_13:
    close(v3);
    if ((unint64_t)(v6 / st_blksize) >> 32)
    {
      fprintf(__stderrp, "%s : starting block is > 32bits!\n", a1);
      return -1LL;
    }

    return v6;
  }

  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  off_t v7 = 0LL;
  while (1)
  {
    memset(v12, 0, 20);
    lseek(v3, v7, 0);
    fcntl(v3, 49, v12);
    if (!v6)
    {
      uint64_t v6 = *(void *)((char *)&v12[1] + 4);
      uint64_t v5 = st_blksize;
      goto LABEL_9;
    }

    v5 += st_blksize;
LABEL_9:
    v7 += st_blksize;
    if (v7 >= v11.st_size) {
      goto LABEL_13;
    }
  }

  fprintf(__stderrp, "%s : is not contiguous!\n");
LABEL_16:
  close(v3);
  return -1LL;
}

uint64_t sub_100004ACC(const char *a1)
{
  v1 = (char *)a1;
  if (!stat(a1, &v25))
  {
    while ((v25.st_mode & 0xF000) != 0x2000)
    {
      if (statfs(v1, &v27))
      {
        stat v11 = __stderrp;
        uint64_t v12 = __error();
        strerror(*v12);
        fprintf(v11, "Can't find out any info about the fs for path %s (%s)\n");
        return -1LL;
      }

      v1 = __str;
      snprintf(__str, 0x100uLL, "/dev/r%s", &v27.f_mntfromname[5]);
      if (stat(__str, &v25)) {
        goto LABEL_2;
      }
    }

    int v6 = open(v1, 0);
    if (v6 < 0)
    {
      uint64_t v13 = __stderrp;
      int v14 = __error();
      strerror(*v14);
      fprintf(v13, "can't open: %s (%s)\n");
      return -1LL;
    }

    int v7 = v6;
    if (ioctl(v6, 0x40046418uLL, __size))
    {
      uint64_t v8 = __stderrp;
      int64_t v9 = __error();
      stat v10 = strerror(*v9);
      fprintf(v8, "can't get the device block size (%s). assuming 512\n", v10);
      __size[0] = 512;
LABEL_12:
      unint64_t v4 = -1LL;
LABEL_13:
      close(v7);
      return v4;
    }

    if (ioctl(v7, 0x40086419uLL, &__size[1]))
    {
      fwrite("failed to get block count. trying stat().\n", 0x2AuLL, 1uLL, __stderrp);
      if (fstat(v7, &v24)) {
        goto LABEL_12;
      }
      size_t v15 = __size[0];
      *(void *)&__size[1] = v24.st_size / __size[0];
    }

    else
    {
      size_t v15 = __size[0];
    }

    uint64_t v16 = (char *)malloc(v15);
    unint64_t v17 = pread(v7, v16, v15, 0x400 / v15 * v15);
    if (v17 != __size[0])
    {
      unsigned int v20 = __stderrp;
      unsigned int v21 = 0x400u / __size[0];
      int64_t v22 = __error();
      v23 = strerror(*v22);
      fprintf(v20, "failed to read volume header @ offset %d (%s)\n", v21, v23);
      unint64_t v4 = -1LL;
      if (!v16) {
        goto LABEL_13;
      }
      goto LABEL_33;
    }

    uint64_t v18 = &v16[1024 * (unint64_t)(__size[0] > 0x400u)];
    int v19 = *(unsigned __int16 *)v18;
    if (v19 != 11080)
    {
      if (v19 == 17474)
      {
        if (*((_WORD *)v18 + 62) == 11080) {
          goto LABEL_29;
        }
      }

      else
      {
        if (v19 == 22600) {
          goto LABEL_24;
        }
        puts("get_embedded_offset: invalid volume signature ");
      }

      unint64_t v4 = -1LL;
      goto LABEL_33;
    }

LABEL_24:
    if (*((_WORD *)v18 + 62) != 11080)
    {
      unint64_t v4 = 0LL;
LABEL_33:
      free(v16);
      goto LABEL_13;
    }

LABEL_29:
    if (v4 % v17)
    {
      fprintf( __stderrp,  "HFS Mount: embedded volume offset not a multiple of physical block size (%d); switching to 512\n",
        __size[0]);
      *(void *)&__size[1] *= (unint64_t)__size[0] >> 9;
      __size[0] = 512;
    }

    goto LABEL_33;
  }

LABEL_2:
  int v2 = __stderrp;
  int v3 = __error();
  strerror(*v3);
  fprintf(v2, "Could not access %s (%s)\n");
  return -1LL;
}

uint64_t sub_100004E40(const char *a1, int a2)
{
  LODWORD(v2) = a2;
  if (statfs(a1, &v61))
  {
    unint64_t v4 = __stderrp;
    uint64_t v5 = __error();
    strerror(*v5);
    fprintf(v4, "Can't stat volume %s (%s).\n");
    return 10LL;
  }

  if (*(_DWORD *)v61.f_fstypename == 1719035236 && *(unsigned __int16 *)&v61.f_fstypename[4] == 115)
  {
    fprintf(__stderrp, "%s is a device node.  Journal enable only works on a mounted HFS+ volume.\n");
    return 10LL;
  }

  snprintf(byte_10000C068, 0x400uLL, "%s/is_vol_hfs_plus", a1);
  if (*(_DWORD *)v61.f_fstypename != 7562856 || symlink(byte_10000C068, byte_10000C068) && *__error() == 45)
  {
    fprintf(__stderrp, "%s is not an HFS+ volume.  Journaling only works on HFS+ volumes.\n");
    return 10LL;
  }

  unlink(byte_10000C068);
  if ((v61.f_flags & 0x800000) != 0)
  {
    fprintf(__stderrp, "Volume %s is already journaled.\n", a1);
    return 1LL;
  }

  if (!(_DWORD)v2)
  {
    if ((int)((((((LODWORD(v61.f_blocks) * (unint64_t)v61.f_bsize) >> 32)
                              * (unsigned __int128)0xA3D70A3D70A3D71uLL) >> 64) << 23)
             + 0x800000) >= 0x20000000)
      LODWORD(v2) = 0x20000000;
    else {
      LODWORD(v2) = (((((LODWORD(v61.f_blocks) * (unint64_t)v61.f_bsize) >> 32)
    }
  }

  if (chdir(a1))
  {
    uint64_t v8 = __stderrp;
    int64_t v9 = __error();
    strerror(*v9);
    fprintf(v8, "Can't locate volume %s to make it journaled (%s).\n");
    return 10LL;
  }

  uint64_t v10 = sub_100004ACC(a1);
  if (v10 < 0)
  {
    fprintf(__stderrp, "Can't calculate the embedded offset (if any) for %s.\n", a1);
    fwrite("Journal creation failure.\n", 0x1AuLL, 1uLL, __stderrp);
    return 15LL;
  }

  uint64_t v11 = v10;
  int v12 = open_dprotected_np(".journal", 1538, 4, 0, 0LL);
  if (v12 < 0)
  {
    uint64_t v16 = __stderrp;
    unint64_t v17 = __error();
    strerror(*v17);
    fprintf(v16, "Can't create journal file on volume %s (%s)\n");
    return 5LL;
  }

  int v13 = v12;
  if (fcntl(v12, 48, 1LL))
  {
    int v14 = __stderrp;
    size_t v15 = __error();
    strerror(*v15);
    fprintf(v14, "Can't create journal file (NC)  on volume %s (%s)\n");
    return 5LL;
  }

  fchmod(v13, 0);
  int64_t f_bsize = (int)v61.f_bsize;
  if ((int)v2 % (signed int)v61.f_bsize)
  {
    fprintf( __stderrp,  "Journal size %dk is not a multiple of volume %s block size (%d).\n",  (int)v2 / 1024,  a1,  v61.f_bsize);
    close(v13);
    unlink(".journal");
    return 5LL;
  }

  uint64_t v58 = 0LL;
  uint64_t v59 = (int)v2;
  uint64_t v60 = 0LL;
  uint64_t v57 = 0x300000006LL;
  if (fcntl(v13, 42, &v57) < 0)
  {
    while ((int)v2 >= 0x200000)
    {
      fprintf(__stderrp, "Not enough contiguous space for a %d k journal.  Retrying.\n", v2 >> 10);
      uint64_t v2 = v2 >> 1;
      ftruncate(v13, 0LL);
      uint64_t v60 = 0LL;
      uint64_t v58 = 0LL;
      uint64_t v59 = v2;
      uint64_t v57 = 0x300000006LL;
      if ((fcntl(v13, 42, &v57) & 0x80000000) == 0) {
        goto LABEL_33;
      }
    }

    fwrite("Disk too fragmented to enable journaling.\n", 0x2AuLL, 1uLL, __stderrp);
    fprintf(__stderrp, "Please run a defragmenter on %s.\n", a1);
    close(v13);
    unlink(".journal");
    return 10LL;
  }

LABEL_33:
  printf("Allocated %lldK for journal file.\n", v60 / 1024);
  int v19 = calloc(f_bsize, 1uLL);
  if (v19)
  {
    if ((int)v2 / (int)f_bsize < 1)
    {
      int v20 = 0;
    }

    else
    {
      int v20 = 0;
      while ((_DWORD)f_bsize == write(v13, v19, f_bsize))
      {
        if ((int)v2 / (int)f_bsize == ++v20)
        {
          int v20 = (int)v2 / (int)f_bsize;
          break;
        }
      }
    }

    if (v20 * (_DWORD)f_bsize != (_DWORD)v2)
    {
      v23 = __stderrp;
      stat v24 = __error();
      stat v25 = strerror(*v24);
      fprintf(v23, "Failed to write %dk to journal on volume %s (%s)\n", (int)v2 / 1024, a1, v25);
    }
  }

  else
  {
    unsigned int v21 = __error();
    int64_t v22 = strerror(*v21);
    printf("Could not allocate memory to write to the journal on volume %s (%s)\n", a1, v22);
  }

  fsync(v13);
  close(v13);
  sub_1000048AC(".journal");
  uint64_t v26 = sub_100004964(".journal");
  if (v26 == -1)
  {
    v34 = __stderrp;
    v35 = __error();
    v36 = strerror(*v35);
    fprintf(v34, "Failed to get start block for %s (%s)\n", ".journal", v36);
    v37 = ".journal";
LABEL_50:
    unlink(v37);
    if (v19) {
      free(v19);
    }
    return 20LL;
  }

  uint64_t v27 = v26;
  *(void *)&__int128 v28 = 0x5A5A5A5A5A5A5A5ALL;
  *((void *)&v28 + 1) = 0x5A5A5A5A5A5A5A5ALL;
  __int128 v70 = v28;
  __int128 v71 = v28;
  __int128 v62 = v28;
  __int128 v63 = v28;
  __int128 v64 = v28;
  __int128 v65 = v28;
  __int128 v66 = v28;
  __int128 v67 = v28;
  __int128 v68 = v28;
  __int128 v69 = v28;
  int v29 = open_dprotected_np(".journal_info_block", 1538, 4, 0, 0LL);
  if (v29 < 0)
  {
    v38 = __stderrp;
    v39 = __error();
    v40 = strerror(*v39);
    fprintf(v38, "Could not create journal info block file on volume %s (%s)\n", a1, v40);
    unlink(".journal");
    if (!v19) {
      return 5LL;
    }
LABEL_54:
    free(v19);
    return 5LL;
  }

  int v30 = v29;
  if (fcntl(v29, 48, 1LL))
  {
    v31 = __stderrp;
    v32 = __error();
    v33 = strerror(*v32);
    fprintf(v31, "Could not create journal info block (NC) file on volume %s (%s)\n", a1, v33);
    if (!v19) {
      return 5LL;
    }
    goto LABEL_54;
  }

  __int128 v41 = v71;
  *(_OWORD *)(v19 + 1) = v70;
  *(_OWORD *)(v19 + 5) = v41;
  __int128 v42 = v67;
  *(_OWORD *)(v19 + 29) = v66;
  *(_OWORD *)(v19 + 33) = v42;
  __int128 v43 = v69;
  *(_OWORD *)(v19 + 37) = v68;
  *(_OWORD *)(v19 + 41) = v43;
  __int128 v44 = v63;
  *(_OWORD *)(v19 + 13) = v62;
  *(_OWORD *)(v19 + 17) = v44;
  __int128 v45 = v65;
  *(_OWORD *)(v19 + 21) = v64;
  uint64_t v46 = v27 / f_bsize - v11 / f_bsize;
  *int v19 = 0x1000000;
  *(void *)(v19 + 9) = bswap64(v46 * (unint64_t)f_bsize);
  *(void *)(v19 + 11) = bswap64(v2);
  *(_OWORD *)(v19 + 25) = v45;
  if (write(v30, v19, f_bsize) != f_bsize)
  {
    v51 = __stderrp;
    v52 = __error();
    v53 = strerror(*v52);
    fprintf(v51, "Failed to write journal info block on volume %s (%s)!\n", a1, v53);
    unlink(".journal");
    if (v19) {
      free(v19);
    }
    return 10LL;
  }

  fsync(v30);
  close(v30);
  sub_1000048AC(".journal_info_block");
  uint64_t v47 = sub_100004964(".journal_info_block");
  if (v47 == -1)
  {
    v54 = __stderrp;
    v55 = __error();
    v56 = strerror(*v55);
    fprintf(v54, "Failed to get start block for %s (%s)\n", ".journal_info_block", v56);
    unlink(".journal");
    v37 = ".journal_info_block";
    goto LABEL_50;
  }

  uint64_t v73 = 0LL;
  v72[0] = 3;
  v72[1] = v61.f_fsid.val[1];
  v72[2] = 534889;
  v72[3] = v47 / f_bsize - v11 / f_bsize;
  v72[4] = v46;
  v72[5] = v2;
  if (sysctl(v72, 6u, 0LL, 0LL, 0LL, 0LL))
  {
    v48 = __stderrp;
    v49 = __error();
    v50 = strerror(*v49);
    fprintf(v48, "Failed to make volume %s journaled (%s)\n", a1, v50);
    unlink(".journal");
    v37 = ".journal_info_block";
    goto LABEL_50;
  }

  if (v19) {
    free(v19);
  }
  return 0LL;
}

uint64_t sub_100005678(const char *a1)
{
  if (statfs(a1, &v17))
  {
    uint64_t v2 = __stderrp;
    int v3 = __error();
    strerror(*v3);
    fprintf(v2, "Can't stat volume %s (%s).\n");
    return 10LL;
  }

  if (*(_DWORD *)v17.f_fstypename != 7562856)
  {
    fprintf(__stderrp, "Volume %s (%s) is not a HFS volume.\n");
    return 1LL;
  }

  if ((v17.f_flags & 0x800000) == 0)
  {
    fprintf(__stderrp, "Volume %s (%s) is not journaled.\n");
    return 1LL;
  }

  if (chdir(a1))
  {
    uint64_t v5 = __stderrp;
    int v6 = __error();
    strerror(*v6);
    fprintf(v5, "Can't locate volume %s to turn off journaling (%s).\n");
    return 10LL;
  }

  uint64_t v20 = 0LL;
  uint64_t v19 = 0LL;
  v18[0] = 3;
  v18[1] = v17.f_fsid.val[1];
  int v21 = 0;
  v18[2] = 201330;
  if (sysctl(v18, 3u, 0LL, 0LL, 0LL, 0LL))
  {
    int v7 = __stderrp;
    uint64_t v8 = __error();
    int64_t v9 = strerror(*v8);
    fprintf(v7, "Failed to make volume %s UN-journaled (%s)\n", a1, v9);
    return 20LL;
  }

  else
  {
    snprintf(__str, 0x400uLL, "%s/%s", a1, ".journal");
    if (unlink(__str))
    {
      uint64_t v10 = __stderrp;
      uint64_t v11 = __error();
      int v12 = strerror(*v11);
      fprintf(v10, "Failed to remove the journal %s (%s)\n", __str, v12);
    }

    snprintf(__str, 0x400uLL, "%s/%s", a1, ".journal_info_block");
    if (unlink(__str))
    {
      int v13 = __stderrp;
      int v14 = __error();
      size_t v15 = strerror(*v14);
      fprintf(v13, "Failed to remove the journal info block %s (%s)\n", __str, v15);
    }

    printf("Journaling disabled on %s mounted at %s.\n", v17.f_mntfromname, a1);
    return 0LL;
  }

uint64_t sub_1000058FC(const char *a1, uint64_t a2)
{
  int v4 = open(a1, 0);
  if (v4 < 0)
  {
    int64_t v9 = __error();
    uint64_t v10 = strerror(*v9);
    printf("can't open: %s (%s)\n", a1, v10);
    return 4294967291LL;
  }

  int v5 = v4;
  if (!ioctl(v4, 0x40046418uLL, &v41))
  {
    if (ioctl(v5, 0x40086419uLL, &v42))
    {
      puts("failed to get block count. trying stat().");
      if (fstat(v5, &v40)) {
        goto LABEL_4;
      }
      unsigned int v12 = v41;
      unint64_t v13 = v40.st_size / v41;
      unint64_t v42 = v13;
    }

    else
    {
      unint64_t v13 = v42;
      unsigned int v12 = v41;
    }

    if (v12 == 512 && v13 >> 31)
    {
      unsigned int v12 = 4096;
      unsigned int v41 = 4096;
    }

    int v14 = (char *)malloc(v12);
    size_t v15 = malloc(v12);
    unint64_t v16 = pread(v5, v14, v12, 0x400 / v12 * v12);
    unsigned int v17 = v41;
    if (v16 != v41)
    {
      unsigned int v26 = 0x400 / v41;
      uint64_t v27 = __error();
      __int128 v28 = strerror(*v27);
      printf("failed to read volume header @ offset %d (%s)\n", v26, v28);
      uint64_t v8 = 0xFFFFFFFFLL;
      if (!v14)
      {
LABEL_47:
        if (v15) {
          free(v15);
        }
        goto LABEL_5;
      }

      goto LABEL_46;
    }

    uint64_t v18 = &v14[1024 * (unint64_t)(v41 > 0x400)];
    unsigned int v19 = *(unsigned __int16 *)v18;
    if (v19 != 11080 && v19 != 17474 && v19 != 22600)
    {
      v32 = "get_journal_info: invalid volume signature";
LABEL_37:
      puts(v32);
LABEL_45:
      uint64_t v8 = 0xFFFFFFFFLL;
      goto LABEL_46;
    }

    *(_WORD *)uint64_t v18 = __rev16(v19);
    unsigned int v22 = *((unsigned __int16 *)v18 + 62);
    *((_WORD *)v18 + 62) = __rev16(v22);
    unsigned int v23 = bswap32(*((unsigned __int16 *)v18 + 14)) >> 16;
    *((_WORD *)v18 + 14) = v23;
    unsigned int v24 = bswap32(*((unsigned __int16 *)v18 + 63)) >> 16;
    *((_WORD *)v18 + 63) = v24;
    unsigned int v25 = bswap32(*((_DWORD *)v18 + 5));
    *((_DWORD *)v18 + 5) = v25;
    *((_WORD *)v18 + 64) = bswap32(*((unsigned __int16 *)v18 + 64)) >> 16;
    if (v19 == 17474)
    {
      if (v22 != 11080) {
        goto LABEL_40;
      }
    }

    else if (v22 != 11080)
    {
      unint64_t v29 = 0LL;
LABEL_39:
      if ((v18[6] & 0x20) == 0)
      {
LABEL_40:
        uint64_t v8 = 0LL;
        goto LABEL_46;
      }

      ssize_t v33 = pread(v5, v15, v17, v29 + bswap32(*((_DWORD *)v18 + 10)) * (unint64_t)bswap32(*((_DWORD *)v18 + 3)));
      if (v33 != v41)
      {
        v39 = __error();
        strerror(*v39);
        printf("failed to read the journal info block (%s).\n");
        goto LABEL_45;
      }

      *size_t v15 = bswap32(*v15);
      *(int8x16_t *)(v15 + 9) = vrev64q_s8(*(int8x16_t *)(v15 + 9));
      __int128 v34 = *((_OWORD *)v15 + 9);
      *(_OWORD *)(a2 + 128) = *((_OWORD *)v15 + 8);
      *(_OWORD *)(a2 + 144) = v34;
      *(_OWORD *)(a2 + 160) = *((_OWORD *)v15 + 10);
      *(_DWORD *)(a2 + 176) = v15[44];
      __int128 v35 = *((_OWORD *)v15 + 5);
      *(_OWORD *)(a2 + 64) = *((_OWORD *)v15 + 4);
      *(_OWORD *)(a2 + 80) = v35;
      __int128 v36 = *((_OWORD *)v15 + 7);
      *(_OWORD *)(a2 + 96) = *((_OWORD *)v15 + 6);
      *(_OWORD *)(a2 + 112) = v36;
      __int128 v37 = *((_OWORD *)v15 + 1);
      *(_OWORD *)a2 = *(_OWORD *)v15;
      *(_OWORD *)(a2 + 16) = v37;
      __int128 v38 = *((_OWORD *)v15 + 3);
      uint64_t v8 = 1LL;
      *(_OWORD *)(a2 + 32) = *((_OWORD *)v15 + 2);
      *(_OWORD *)(a2 + 48) = v38;
LABEL_46:
      free(v14);
      goto LABEL_47;
    }

    unint64_t v29 = ((unint64_t)v23 << 9) + v25 * (unint64_t)v24;
    if (v29 % v16)
    {
      printf("HFS Mount: embedded volume offset not a multiple of physical block size (%d); switching to 512\n", v17);
      v42 *= (unint64_t)v41 >> 9;
      unsigned int v17 = 512;
      unsigned int v41 = 512;
    }

    ssize_t v30 = pread(v5, v14, v17, (0x400 / v17 + (v29 / v17)) * v17);
    unsigned int v17 = v41;
    if (v30 != v41)
    {
      printf("failed to read the embedded vhp @ offset %d\n");
      goto LABEL_45;
    }

    uint64_t v18 = &v14[1024 * (unint64_t)(v41 > 0x400)];
    int v31 = *(unsigned __int16 *)v18;
    if (v31 != 11080 && v31 != 17474 && v31 != 22600)
    {
      v32 = "get_journal_info: invalid embedded volume signature ";
      goto LABEL_37;
    }

    goto LABEL_39;
  }

  int v6 = __error();
  int v7 = strerror(*v6);
  printf("can't get the device block size (%s). assuming 512\n", v7);
  unsigned int v41 = 512;
LABEL_4:
  uint64_t v8 = 0xFFFFFFFFLL;
LABEL_5:
  close(v5);
  return v8;
}

uint64_t sub_100005CE4(const char *a1)
{
  v1 = (statfs *)a1;
  if (!strncmp(a1, "/dev/", 5uLL)
    || !strncmp((const char *)v1, "disk", 4uLL)
    || !strncmp((const char *)v1, "rdisk", 5uLL))
  {
    if (!strncmp((const char *)v1, "disk", 4uLL) || !strncmp((const char *)v1, "rdisk", 5uLL))
    {
      int v7 = (const char *)v1;
      v1 = &v10;
      snprintf((char *)&v10, 0x100uLL, "/dev/%s", v7);
    }

    int v2 = sub_1000058FC((const char *)v1, (uint64_t)__str);
    if (v2)
    {
      if (v2 < 0)
      {
        printf("Volume %s does not appear to be an HFS+ volume.\n", (const char *)v1);
        return 10LL;
      }

      if ((__str[0] & 1) != 0)
      {
LABEL_16:
        printf("%s : journal size %lld k at offset 0x%llx\n");
        return 0LL;
      }

      printf("%s: external journal stored on partition with uuid %s on machine w/serial number %s\n");
    }

    else
    {
      printf("Volume %s is not journaled.\n");
    }

    return 0LL;
  }

  if (statfs((const char *)v1, &v10))
  {
    fprintf(__stderrp, "Unable to get fs info for %s\n", (const char *)v1);
    return 10LL;
  }

  if ((v10.f_flags & 0x800000) == 0)
  {
    fprintf(__stderrp, "Volume %s is not journaled.\n", (const char *)v1);
    return 1LL;
  }

  if (fsctl((const char *)v1, 0x40106811uLL, v8, 0))
  {
    int v4 = __stderrp;
    int v5 = __error();
    int v6 = strerror(*v5);
    fprintf(v4, "Failed to get journal info for volume %s (%s)\n", (const char *)v1, v6);
    return 20LL;
  }

  if (v8[0])
  {
    if (!v8[1])
    {
      printf("%s : not journaled.\n");
      return 0LL;
    }

    goto LABEL_16;
  }

  snprintf(__str, 0x100uLL, "/dev/r%s", &v10.f_mntfromname[5]);
  return sub_100005CE4(__str);
}

uint64_t sub_100005F64(const char *a1)
{
  if (stat(__str, &v43))
  {
LABEL_2:
    int v2 = __stderrp;
    int v3 = __error();
    strerror(*v3);
    fprintf(v2, "Could not access %s (%s)\n");
    return 0xFFFFFFFFLL;
  }

  while (1)
  {
    int v5 = v43.st_mode & 0xF000;
    if (v5 != 24576) {
      break;
    }
    snprintf(__str, 0x100uLL, "/dev/r%s", a1 + 5);
    if (stat(__str, &v43)) {
      goto LABEL_2;
    }
  }

  if (v5 == 0x2000)
  {
    snprintf(__s1, 0x100uLL, "/dev/%s", v47);
    int v6 = getmntinfo(&v42, 2);
    if (!v6)
    {
      fwrite("Error getting list of mounted filesystems\n", 0x2AuLL, 1uLL, __stderrp);
      return 0xFFFFFFFFLL;
    }

    uint64_t v7 = v6 + 1LL;
    f_mntonname = v42[v6].f_mntonname;
    while (--v7)
    {
      int64_t v9 = f_mntonname - 2168;
      int v10 = strcmp(__s1, f_mntonname - 1144);
      f_mntonname = v9;
      if (!v10)
      {
        uint64_t v11 = v9;
        return sub_100005678(v11);
      }
    }

    int v12 = open(__str, 2);
    if (v12 < 0)
    {
      unsigned int v17 = __stderrp;
      uint64_t v18 = __error();
      strerror(*v18);
      fprintf(v17, "can't open: %s (%s)\n");
      return 0xFFFFFFFFLL;
    }

    int v13 = v12;
    if (ioctl(v12, 0x40046418uLL, __size))
    {
      int v14 = __stderrp;
      size_t v15 = __error();
      unint64_t v16 = strerror(*v15);
      fprintf(v14, "can't get the device block size (%s). assuming 512\n", v16);
      __size[0] = 512;
LABEL_53:
      close(v13);
      return 0xFFFFFFFFLL;
    }

    if (ioctl(v13, 0x40086419uLL, &__size[1]))
    {
      if (fstat(v13, &v41)) {
        goto LABEL_53;
      }
      unsigned int v19 = __size[0];
      unint64_t v20 = v41.st_size / __size[0];
      *(void *)&__size[1] = v20;
    }

    else
    {
      unint64_t v20 = *(void *)&__size[1];
      unsigned int v19 = __size[0];
    }

    if (v19 == 512 && v20 >> 31)
    {
      unsigned int v19 = 4096;
      __size[0] = 4096;
    }

    size_t v21 = v19;
    unsigned int v22 = (char *)malloc(v19);
    off_t v23 = 0x400 / v19 * v19;
    unint64_t v24 = pread(v13, v22, v21, v23);
    unsigned int v25 = __size[0];
    if (v24 != __size[0])
    {
      int v31 = __stderrp;
      v32 = __error();
      ssize_t v33 = strerror(*v32);
      fprintf(v31, "RawDisableJournaling: failed to read volume header @ offset %lld (%s)\n", v23, v33);
      if (!v22) {
        goto LABEL_53;
      }
      goto LABEL_52;
    }

    unsigned int v26 = &v22[1024 * (unint64_t)(__size[0] > 0x400u)];
    int v27 = *(unsigned __int16 *)v26;
    if (v27 != 11080)
    {
      if (v27 == 17474)
      {
        if (*((_WORD *)v26 + 62) != 11080)
        {
          fwrite("disable_journaling: volume is only regular HFS, not HFS+\n", 0x39uLL, 1uLL, __stderrp);
          goto LABEL_52;
        }

        goto LABEL_38;
      }

      if (v27 != 22600)
      {
        __int128 v37 = "RawDisableJournaling: Invalid Volume Signature ";
        goto LABEL_46;
      }
    }

    if (*((_WORD *)v26 + 62) != 11080)
    {
      unint64_t v28 = (unint64_t)(__size[0] > 0x400u) << 10;
LABEL_33:
      unint64_t v29 = &v22[v28];
      int v30 = *((_DWORD *)v29 + 1);
      if ((v30 & 0x200000) != 0)
      {
        *((_DWORD *)v29 + 1) = v30 & 0xFFDFFFFF;
        int v38 = pwrite(v13, v22, v25, v23);
        v39 = __stderrp;
        if (__size[0] == v38)
        {
          fprintf(__stderrp, "Turned off the journaling bit for %s\n");
        }

        else
        {
          stat v40 = __error();
          strerror(*v40);
          fprintf(v39, "Update of super-block on %s failed! (%d != %d, %s)\n");
        }
      }

      else
      {
        fprintf(__stderrp, "disable_journaling: %s is not journaled.\n");
      }

      goto LABEL_52;
    }

LABEL_38:
    if (v34 % v24)
    {
      fprintf( __stderrp,  "HFS Mount: embedded volume offset not a multiple of physical block size (%d); switching to 512\n",
        __size[0]);
      *(void *)&__size[1] *= (unint64_t)__size[0] >> 9;
      unsigned int v25 = 512;
      __size[0] = 512;
    }

    off_t v23 = (0x400 / v25 + (v34 / v25)) * v25;
    ssize_t v35 = pread(v13, v22, v25, v23);
    unsigned int v25 = __size[0];
    if (v35 != __size[0])
    {
      fprintf(__stderrp, "failed to read the embedded vhp @ offset %d\n");
      goto LABEL_52;
    }

    unint64_t v28 = (unint64_t)(__size[0] > 0x400u) << 10;
    int v36 = *(unsigned __int16 *)&v22[v28];
    if (v36 == 11080 || v36 == 17474 || v36 == 22600) {
      goto LABEL_33;
    }
    __int128 v37 = "RawDisableJournaling: invalid embedded volume signature ";
LABEL_46:
    puts(v37);
LABEL_52:
    free(v22);
    goto LABEL_53;
  }

  uint64_t v11 = a1;
  return sub_100005678(v11);
}

uint64_t sub_100006498(const char *a1, int a2)
{
  int v4 = open(a1, 2);
  if (v4 < 0)
  {
    int64_t v9 = __error();
    int v10 = strerror(*v9);
    printf("can't open: %s (%s)\n", a1, v10);
    return 0xFFFFFFFFLL;
  }

  int v5 = v4;
  if (!ioctl(v4, 0x40046418uLL, &v33))
  {
    if (ioctl(v5, 0x40086419uLL, &v34))
    {
      puts("failed to get block count. trying stat().");
      if (fstat(v5, &v32)) {
        goto LABEL_4;
      }
      unsigned int v12 = v33;
      unint64_t v13 = v32.st_size / v33;
      unint64_t v34 = v13;
    }

    else
    {
      unsigned int v12 = v33;
      unint64_t v13 = v34;
    }

    if (v12 == 512 && v13 >> 31)
    {
      unsigned int v12 = 4096;
      unsigned int v33 = 4096;
    }

    int v14 = (char *)malloc(v12);
    size_t v15 = malloc(v12);
    unint64_t v16 = pread(v5, v14, v12, 0x400 / v12 * v12);
    unsigned int v17 = v33;
    if (v16 != v33)
    {
      unsigned int v25 = 0x400 / v33;
      unsigned int v26 = __error();
      int v27 = strerror(*v26);
      printf("failed to read volume header @ offset %d (%s)\n", v25, v27);
      uint64_t v8 = 0xFFFFFFFFLL;
      if (!v14)
      {
LABEL_42:
        if (v15) {
          free(v15);
        }
        goto LABEL_5;
      }

LABEL_41:
      free(v14);
      goto LABEL_42;
    }

    uint64_t v18 = &v14[1024 * (unint64_t)(v33 > 0x400)];
    int v19 = *(unsigned __int16 *)v18;
    if (v19 != 11080)
    {
      if (v19 == 17474)
      {
        if (*((_WORD *)v18 + 62) != 11080)
        {
LABEL_35:
          uint64_t v8 = 0LL;
          goto LABEL_41;
        }

LABEL_28:
        if (v20 % v16)
        {
          printf( "HFS Mount: embedded volume offset not a multiple of physical block size (%d); switching to 512\n",
            v33);
          v34 *= (unint64_t)v33 >> 9;
          unsigned int v17 = 512;
          unsigned int v33 = 512;
        }

        ssize_t v28 = pread(v5, v14, v17, (0x400 / v17 + (v20 / v17)) * v17);
        unsigned int v17 = v33;
        if (v28 != v33)
        {
          printf("failed to read the embedded vhp @ offset %d\n");
          goto LABEL_40;
        }

        uint64_t v18 = &v14[1024 * (unint64_t)(v33 > 0x400)];
        int v29 = *(unsigned __int16 *)v18;
        if (v29 == 11080 || v29 == 17474 || v29 == 22600)
        {
LABEL_21:
          if ((v18[6] & 0x20) != 0)
          {
            off_t v21 = v20 + bswap32(*((_DWORD *)v18 + 10)) * (unint64_t)bswap32(*((_DWORD *)v18 + 3));
            ssize_t v22 = pread(v5, v15, v17, v21);
            if (v22 != v33)
            {
              int v31 = __error();
              strerror(*v31);
              printf("failed to read the journal info block (%s).\n");
              goto LABEL_40;
            }

            *size_t v15 = bswap32(bswap32(*v15 & 0xFEFFFFFF) | (a2 != 0) | 4);
            ssize_t v23 = pwrite(v5, v15, v22, v21);
            if (v23 != v33)
            {
              unint64_t v24 = __error();
              strerror(*v24);
              printf("failed to re-write the journal info block (%s).\n");
LABEL_40:
              uint64_t v8 = 0xFFFFFFFFLL;
              goto LABEL_41;
            }
          }

          goto LABEL_35;
        }

        int v30 = "SetJournalInFSState: Invalid Embedded Volume Signature ";
LABEL_37:
        puts(v30);
        goto LABEL_40;
      }

      if (v19 != 22600)
      {
        int v30 = "SetJournalInFSState: Invalid Volume Signature ";
        goto LABEL_37;
      }
    }

    if (*((_WORD *)v18 + 62) != 11080)
    {
      unint64_t v20 = 0LL;
      goto LABEL_21;
    }

    goto LABEL_28;
  }

  int v6 = __error();
  uint64_t v7 = strerror(*v6);
  printf("can't get the device block size (%s). assuming 512\n", v7);
  unsigned int v33 = 512;
LABEL_4:
  uint64_t v8 = 0xFFFFFFFFLL;
LABEL_5:
  close(v5);
  return v8;
}

void sub_10000685C(int *a1, void *a2)
{
  int v4 = (unsigned __int8 *)read(*a1, a2, 0LL);
  __break(1u);
  CC_MD5_Final(v4, v5);
}