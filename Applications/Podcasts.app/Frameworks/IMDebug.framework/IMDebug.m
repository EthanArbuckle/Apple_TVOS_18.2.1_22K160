uint64_t change_file_date(const char *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  tm v6;
  utimbuf v7;
  *(_OWORD *)&v6.tm_sec = *(_OWORD *)a3;
  v4 = *(_DWORD *)(a3 + 20);
  if (v4 > 0x76C) {
    v4 -= 1900;
  }
  v6.tm_mon = *(_DWORD *)(a3 + 16);
  v6.tm_year = v4;
  v6.tm_isdst = -1;
  v7.actime = mktime(&v6);
  v7.modtime = v7.actime;
  return utime(a1, &v7);
}

uint64_t mymkdir()
{
  return 0LL;
}

BOOL makedir(const char *a1)
{
  return (int)strlen(a1) > 0;
}

uint64_t do_banner()
{
  return puts("more info at http://www.winimage.com/zLibDll/unzip.html\n");
}

uint64_t do_help()
{
  return puts( "Usage : miniunz [-e] [-x] [-v] [-l] [-o] [-p password] file.zip [file_to_extr.] [-d extractdir]\n \n -e  Extract without pathname (junk paths)\n -x  Extract with pathname\n -v  list files\n -l  list files\n -d  directory to extract into\n -o  overwrite files without prompting\n -p  extract crypted file using password\n");
}

uint64_t do_list(void *a1)
{
  int GlobalInfo = unzGetGlobalInfo((uint64_t)a1, &v21);
  if (GlobalInfo) {
    printf("error %d with zipfile in unzGetGlobalInfo \n", GlobalInfo);
  }
  puts(" Length  Method   Size  Ratio   Date    Time   CRC-32     Name");
  puts(" ------  ------   ----  -----   ----    ----   ------     ----");
  if ((void)v21)
  {
    unint64_t v3 = 0LL;
    do
    {
      if (unzGetCurrentFileInfo((uint64_t)a1, (uint64_t)v10, (uint64_t)v22, 0x100uLL, 0LL, 0LL, 0LL, 0LL))
      {
        printf("error %d with zipfile in unzGetCurrentFileInfo\n");
        return 0LL;
      }

      if (v15) {
        unint64_t v4 = 100 * v14 / v15;
      }
      else {
        unint64_t v4 = 0LL;
      }
      if ((v11 & 1) != 0) {
        uint64_t v5 = 42LL;
      }
      else {
        uint64_t v5 = 32LL;
      }
      if (v12)
      {
        if (v12 == 12)
        {
          v7 = "BZip2 ";
        }

        else if (v12 == 8)
        {
          unsigned int v6 = (v11 >> 1) & 3;
          if (v6)
          {
            if (v6 == 1)
            {
              v7 = "Defl:X";
            }

            else
            {
              v7 = "Defl:F";
              if ((v11 & 4) == 0) {
                v7 = "Unkn. ";
              }
            }
          }

          else
          {
            v7 = "Defl:N";
          }
        }

        else
        {
          v7 = "Unkn. ";
        }
      }

      else
      {
        v7 = "Stored";
      }

      printf( "%7lu  %6s%c%7lu %3lu%%  %2.2lu-%2.2lu-%2.2lu  %2.2lu:%2.2lu  %8.8lx   %s\n",  v15,  v7,  v5,  v14,  v4,  v19 + 1LL,  v18,  v20 % 0x64,  v17,  v16,  v13,  v22);
      ++v3;
      unint64_t v8 = v21;
      if (v3 < (unint64_t)v21)
      {
        if (unzGoToNextFile(a1))
        {
          printf("error %d with zipfile in unzGoToNextFile\n");
          return 0LL;
        }

        unint64_t v8 = v21;
      }
    }

    while (v3 < v8);
  }

  return 0LL;
}

uint64_t do_extract_currentfile(uint64_t a1, int *a2, _DWORD *a3, _BYTE *a4)
{
  uint64_t CurrentFileInfo = unzGetCurrentFileInfo(a1, (uint64_t)v27, (uint64_t)&v32, 0x100uLL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)CurrentFileInfo)
  {
    uint64_t v9 = CurrentFileInfo;
    printf("error %d with zipfile in unzGetCurrentFileInfo\n", CurrentFileInfo);
    return v9;
  }

  v10 = malloc(0x2000uLL);
  if (!v10)
  {
    puts("Error allocating memory");
    return 4294967192LL;
  }

  uint64_t v11 = v10;
  uint64_t v12 = &v32;
  for (i = v33; ; ++i)
  {
    int v14 = *(i - 1);
    if (v14 != 47 && v14 != 92) {
      break;
    }
    uint64_t v12 = i;
LABEL_10:
    ;
  }

  if (*(i - 1)) {
    goto LABEL_10;
  }
  int v15 = *a2;
  if (*v12)
  {
    if (v15) {
      unsigned int v16 = v12;
    }
    else {
      unsigned int v16 = &v32;
    }
    uint64_t v17 = unzOpenCurrentFilePassword(a1, a4);
    uint64_t v9 = v17;
    if ((_DWORD)v17) {
      printf("error %d with zipfile in unzOpenCurrentFilePassword\n", v17);
    }
    if (!(*a3 | v9))
    {
      unsigned int v19 = fopen(v16, "rb");
      if (v19)
      {
        fclose(v19);
        while (1)
        {
          printf("The file %s exists. Overwrite ? [y]es, [n]o, [A]ll: ", v16);
          if (scanf("%1s", &v30) != 1) {
            exit(1);
          }
          char v20 = v30;
          if (v20 == 89) {
            break;
          }
          if (v20 == 78)
          {
            int v18 = 1;
            goto LABEL_19;
          }

          if (v20 == 65)
          {
            int v18 = 0;
            *a3 = 1;
            goto LABEL_19;
          }
        }
      }
    }

    int v18 = 0;
LABEL_19:
    if (v18 | v9)
    {
LABEL_20:
      if (!(_DWORD)v9) {
        goto LABEL_49;
      }
LABEL_47:
      unzCloseCurrentFile(a1);
    }

    else
    {
      __int128 v21 = fopen(v16, "wb");
      if (!v21)
      {
        if (*a2
          || v12 == &v32
          || (v23 = *(v12 - 1), *(v12 - 1) = 0, makedir(v16), *(v12 - 1) = v23, (__int128 v21 = fopen(v16, "wb")) == 0LL))
        {
          printf("error opening %s\n", v16);
          goto LABEL_20;
        }
      }

      printf(" extracting: %s\n", v16);
      while (1)
      {
        uint64_t CurrentFile = unzReadCurrentFile(a1, (uint64_t)v11, 0x2000u);
        uint64_t v9 = CurrentFile;
        if ((CurrentFile & 0x80000000) != 0)
        {
          printf("error %d with zipfile in unzReadCurrentFile\n", CurrentFile);
          goto LABEL_46;
        }

        if (!(_DWORD)CurrentFile) {
          break;
        }
        if (fwrite(v11, CurrentFile, 1uLL, v21) != 1)
        {
          puts("error in writing extracted file");
          uint64_t v9 = 0xFFFFFFFFLL;
LABEL_46:
          fclose(v21);
          goto LABEL_47;
        }
      }

      fclose(v21);
      __int128 v30 = v28;
      uint64_t v31 = v29;
      change_file_date(v16, v24, (uint64_t)&v30);
LABEL_49:
      uint64_t v25 = unzCloseCurrentFile(a1);
      uint64_t v9 = v25;
      if ((_DWORD)v25) {
        printf("error %d with zipfile in unzCloseCurrentFile\n", v25);
      }
    }
  }

  else
  {
    if (!v15) {
      printf("creating directory: %s\n", &v32);
    }
    uint64_t v9 = 0LL;
  }

  free(v11);
  return v9;
}

uint64_t do_extract(void *a1, int a2, int a3, _BYTE *a4)
{
  int v12 = a3;
  int v13 = a2;
  int GlobalInfo = unzGetGlobalInfo((uint64_t)a1, &v11);
  if (GlobalInfo) {
    printf("error %d with zipfile in unzGetGlobalInfo \n", GlobalInfo);
  }
  if ((void)v11)
  {
    unint64_t v7 = 0LL;
    while (!do_extract_currentfile((uint64_t)a1, &v13, &v12, a4))
    {
      ++v7;
      unint64_t v8 = v11;
      if (v7 < (unint64_t)v11)
      {
        int File = unzGoToNextFile(a1);
        if (File)
        {
          printf("error %d with zipfile in unzGoToNextFile\n", File);
          return 0LL;
        }

        unint64_t v8 = v11;
      }

      if (v7 >= v8) {
        return 0LL;
      }
    }
  }

  return 0LL;
}

uint64_t do_extract_onefile(uint64_t a1, char *a2, int a3, int a4, _BYTE *a5)
{
  int v9 = a4;
  int v10 = a3;
  printf("file %s not found in the zipfile\n", a2);
  return 2LL;
}

int main(int argc, const char **argv, const char **envp)
{
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  *(_OWORD *)__dst = 0u;
  puts("MiniUnz 1.01b, demo of zLib + Unz package written by Gilles Vollant");
  puts("more info at http://www.winimage.com/zLibDll/unzip.html\n");
  if (argc != 1)
  {
    if (argc < 2)
    {
      int v13 = 0LL;
    }

    else
    {
      unsigned int v6 = 0LL;
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      __int128 v11 = 0LL;
      int v12 = 0LL;
      int v13 = 0LL;
      int v14 = 1;
      do
      {
        int v15 = argv[v14];
        if (*v15 == 45)
        {
          char v16 = v15[1];
          if (v16)
          {
            uint64_t v17 = (unsigned __int8 *)(v15 + 2);
            do
            {
              int v18 = v16 & 0xDF;
              if (v18 == 76 || v18 == 86) {
                int v10 = 1;
              }
              if (v18 == 69) {
                int v9 = 1;
              }
              if (v18 == 79) {
                int v8 = 1;
              }
              if (v18 == 80)
              {
                uint64_t v20 = v14 + 1LL;
                if ((int)v20 < argc)
                {
                  __int128 v11 = (char *)argv[v20];
                  ++v14;
                }
              }

              else if (v18 == 68)
              {
                unsigned int v6 = argv[v14 + 1];
                int v7 = 1;
              }

              int v21 = *v17++;
              char v16 = v21;
            }

            while (v21);
          }
        }

        else
        {
          if (v12) {
            BOOL v22 = 0;
          }
          else {
            BOOL v22 = v7 == 0;
          }
          if (v22) {
            char v23 = argv[v14];
          }
          else {
            char v23 = v12;
          }
          if (v22) {
            int v24 = 0;
          }
          else {
            int v24 = v7;
          }
          BOOL v25 = v13 == 0LL;
          if (v13) {
            int v12 = (char *)v23;
          }
          else {
            int v13 = argv[v14];
          }
          if (!v25) {
            int v7 = v24;
          }
        }

        ++v14;
      }

      while (v14 < argc);
      if (v13)
      {
        strncpy(__dst, v13, 0xFFuLL);
        LOBYTE(v44) = 0;
        v26 = unzOpen((uint64_t)v13);
        if (v26 || (__strcat_chk(__dst, ".zip", 272LL), (v26 = unzOpen((uint64_t)__dst)) != 0LL))
        {
          printf("%s opened\n", __dst);
          if (v10 == 1)
          {
            do_list(v26);
          }

          else
          {
            if (v7 && chdir(v6))
            {
              printf("Error changing into %s, aborting\n", v6);
              exit(-1);
            }

            if (v12)
            {
              int onefile = do_extract_onefile((uint64_t)v26, v12, v9, v8, v11);
LABEL_53:
              unzClose((uint64_t)v26);
              return onefile;
            }

            do_extract(v26, v9, v8, v11);
          }

          int onefile = 0;
          goto LABEL_53;
        }
      }
    }

    printf("Cannot open %s or %s.zip\n", v13, v13);
    return 1;
  }

  puts( "Usage : miniunz [-e] [-x] [-v] [-l] [-o] [-p password] file.zip [file_to_extr.] [-d extractdir]\n \n -e  Extract without pathname (junk paths)\n -x  Extract with pathname\n -v  list files\n -l  list files\n -d  directory to extract into\n -o  overwrite files without prompting\n -p  extract crypted file using password\n");
  return 0;
}

void sub_230C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
}

void sub_24C4(_Unwind_Exception *a1)
{
}
}

uint64_t unzRepair(const char *a1, const char *a2, const char *a3, void *a4, void *a5)
{
  int v9 = fopen(a1, "rb");
  int v10 = fopen(a2, "wb");
  uint64_t v11 = fopen(a3, "wb");
  uint64_t v12 = 4294967294LL;
  if (!v9 || !v10) {
    return v12;
  }
  __filename = (char *)a3;
  v49 = v11;
  int v13 = 0;
  if (fread(&__ptr, 1uLL, 0x1EuLL, v9) != 30)
  {
    unsigned int v31 = 0;
    unsigned int v22 = 0;
    uint64_t v42 = 0LL;
LABEL_30:
    LODWORD(v12) = 0;
    goto LABEL_42;
  }

  uint64_t v42 = 0LL;
  int v14 = 0;
  unsigned int v15 = 0;
  v16.i64[1] = -63738LL;
  __stream = v9;
  while (1)
  {
    unsigned int v48 = v15;
    if (__ptr != 67324752)
    {
      LODWORD(v12) = 0;
LABEL_35:
      unsigned int v22 = v14;
      goto LABEL_41;
    }

    v16.i64[0] = v77;
    int8x16_t v45 = v16;
    __int16 v46 = v78;
    __int32 v47 = v79;
    int v17 = v80;
    int v55 = v82;
    int v56 = v81;
    int v53 = v84;
    int v54 = v83;
    int v51 = v86;
    int v52 = v85;
    int v50 = v87;
    int v18 = v88;
    int v19 = v89;
    int v20 = v90;
    int v57 = v91;
    v74[0] = 0;
    v75[0] = 0;
    if (fwrite(&__ptr, 1uLL, 0x1EuLL, v10) != 30)
    {
      LODWORD(v12) = -1;
      goto LABEL_35;
    }

    char v43 = v19;
    char v44 = v18;
    size_t v21 = v18 | (v19 << 8);
    unsigned int v22 = v14 + 30;
    if (!(_DWORD)v21)
    {
      LODWORD(v12) = -2;
      goto LABEL_41;
    }

    if (fread(v75, 1uLL, v21, v9) != v21 || fwrite(v75, 1uLL, v21, v10) != v21)
    {
LABEL_31:
      LODWORD(v12) = -1;
      goto LABEL_41;
    }

    char v40 = v20;
    size_t v23 = v20 | (v57 << 8);
    v22 += v21;
    if ((_DWORD)v23)
    {
      v22 += v23;
    }

    unsigned int v24 = v17 | (v56 << 8) | (v55 << 16) | (v54 << 24);
    size_t v25 = v24 ? v24 : v53 | (v52 << 8) | (v51 << 16) | (v50 << 24);
LABEL_22:
    int v58 = 33639248;
    int8x16_t v30 = vqtbl1q_s8(v45, (int8x16_t)xmmword_A090);
    v30.i16[5] = v46;
    v30.i32[3] = v47;
    v30.i16[1] = v30.i16[0];
    int8x16_t v59 = v30;
    LOBYTE(v60) = v17;
    HIBYTE(v60) = v56;
    char v61 = v55;
    char v62 = v54;
    char v63 = v53;
    char v64 = v52;
    char v65 = v51;
    char v66 = v50;
    char v67 = v44;
    char v68 = v43;
    char v69 = v40;
    char v70 = v57;
    uint64_t v71 = 0LL;
    __int16 v72 = 0;
    int v73 = v14;
    int v9 = __stream;
    if (fwrite(&v58, 1uLL, 0x2EuLL, v49) != 46)
    {
      unsigned int v15 = v48;
LABEL_38:
      unsigned int v31 = v15;
      LODWORD(v12) = -1;
      goto LABEL_42;
    }

    unsigned int v15 = v48 + 46;
    if (fwrite(v75, 1uLL, v21, v49) != v21) {
      goto LABEL_38;
    }
    v15 += v21;
    if ((_DWORD)v23)
    {
      v15 += v23;
    }

    ++v13;
    int v14 = v22;
    if (fread(&__ptr, 1uLL, 0x1EuLL, __stream) != 30)
    {
      unsigned int v31 = v15;
      goto LABEL_30;
    }
  }

  int v38 = v13;
  v26 = a4;
  v27 = a5;
  __int128 v28 = malloc(v25);
  if (v28)
  {
    __int128 v29 = v28;
    if ((_DWORD)v25 != fread(v28, 1uLL, v25, __stream)
      || (_DWORD)v25 != fwrite(v29, 1uLL, v25, v10))
    {
      free(v29);
      LODWORD(v12) = -1;
      goto LABEL_40;
    }

    v22 += v25;
    v42 += v25;
    free(v29);
    a5 = v27;
    a4 = v26;
    int v13 = v38;
    goto LABEL_22;
  }

  LODWORD(v12) = -4;
LABEL_40:
  a5 = v27;
  a4 = v26;
  int v9 = __stream;
  int v13 = v38;
LABEL_41:
  unsigned int v31 = v48;
LABEL_42:
  int v58 = 101010256;
  if (v13 >= 0xFFFF) {
    __int16 v32 = -1;
  }
  else {
    __int16 v32 = v13;
  }
  v59.i32[0] = 0;
  v59.i16[2] = v32;
  v59.i16[3] = v32;
  v59.i64[1] = __PAIR64__(v22, v31);
  __int16 v60 = 0;
  if (fwrite(&v58, 1uLL, 0x16uLL, v49) == 22) {
    uint64_t v12 = v12;
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  fclose(v49);
  if (!(_DWORD)v12)
  {
    int v33 = v13;
    __int128 v34 = fopen(__filename, "rb");
    if (v34)
    {
      __int128 v35 = v34;
      while (1)
      {
        int v36 = fread(&v58, 1uLL, 0x2000uLL, v35);
        if (v36 < 1) {
          break;
        }
        if (fwrite(&v58, 1uLL, v36, v10) != v36)
        {
          uint64_t v12 = 0xFFFFFFFFLL;
          goto LABEL_56;
        }
      }

      uint64_t v12 = 0LL;
LABEL_56:
      fclose(v35);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    int v13 = v33;
  }

  fclose(v9);
  fclose(v10);
  remove(__filename);
  if (!(_DWORD)v12)
  {
    if (a4) {
      *a4 = v13;
    }
    if (a5) {
      *a5 = v42;
    }
  }

  return v12;
}

void sub_33E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t unzStringFileNameCompare(const char *a1, const char *a2, unsigned int a3)
{
  if (a3 < 2) {
    return strcmp(a1, a2);
  }
  while (1)
  {
    int v5 = *(unsigned __int8 *)a1++;
    int v4 = v5;
    int v7 = *(unsigned __int8 *)a2++;
    int v6 = v7;
    if (!(_BYTE)v4) {
      break;
    }
    if (!(_BYTE)v6) {
      return 1LL;
    }
  }

  if ((_BYTE)v6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

void *unzOpen2(uint64_t a1, _OWORD *a2)
{
  if (a2)
  {
    __int128 v3 = a2[1];
    __src[0] = *a2;
    __src[1] = v3;
    __int128 v4 = a2[3];
    __src[2] = a2[2];
    __src[3] = v4;
    uint64_t v5 = (*(uint64_t (**)(void, uint64_t, uint64_t))&__src[0])(*((void *)&v4 + 1), a1, 5LL);
  }

  else
  {
    fill_fopen_filefunc((FILE *(**)(int, char *, char))__src);
    uint64_t v5 = (*(uint64_t (**)(void, uint64_t, uint64_t))&__src[0])(*((void *)&__src[3] + 1), a1, 5LL);
  }

  int v6 = (void *)v5;
  *(void *)&__src[4] = v5;
  if (v5)
  {
    if (!(*(uint64_t (**)(void, uint64_t, void, uint64_t))&__src[2])( *((void *)&__src[3] + 1),  v5,  0LL,  2LL))
    {
      unint64_t v7 = (*((uint64_t (**)(void, void *))&__src[1] + 1))(*((void *)&__src[3] + 1), v6);
      unint64_t v8 = v7;
      unint64_t v9 = v7 >= 0xFFFF ? 0xFFFFLL : v7;
      int v10 = (char *)malloc(0x404uLL);
      if (v10)
      {
        uint64_t v11 = v10;
        if (v9 >= 5)
        {
          uint64_t v12 = v10 + 1;
          uint64_t v13 = 4LL;
          do
          {
            unint64_t v14 = v13 + 1024;
            unint64_t v15 = v13 + 1024 >= v9 ? v9 : v13 + 1024;
            unint64_t v16 = v15 >= 0x404 ? 1028LL : v15;
            if ((*(uint64_t (**)(void, void *, unint64_t, void))&__src[2])( *((void *)&__src[3] + 1),  v6,  v8 - v15,  0LL)
              || (*((uint64_t (**)(void, void *, _BYTE *, unint64_t))&__src[0] + 1))( *((void *)&__src[3] + 1),  v6,  v11,  v16) != v16)
            {
              break;
            }

            if (v16 >= 4)
            {
              uint64_t v17 = (v16 - 4);
              while (v11[v17] != 80 || v12[v17] != 75 || v12[v17 + 1] != 5 || v12[v17 + 2] != 6)
              {
                if (v17-- <= 0) {
                  goto LABEL_28;
                }
              }

              if (v8 - v15 + v17)
              {
                free(v11);
                unint64_t v19 = v13 + 1024;
                if (v8 < v13 + 1024) {
                  unint64_t v19 = v8;
                }
                if (v19 >= 0xFFFF) {
                  unint64_t v19 = 0xFFFFLL;
                }
                unint64_t v20 = v8 - v19 + v17;
                int v37 = 1;
                goto LABEL_38;
              }
            }

LABEL_28:
            uint64_t v13 = v15;
          }

          while (v9 > v14);
        }

        free(v11);
      }
    }

    unint64_t v20 = 0LL;
    int v37 = 0;
LABEL_38:
    uint64_t v33 = (*(uint64_t (**)(void, void, unint64_t, void))&__src[2])( *((void *)&__src[3] + 1),  *(void *)&__src[4],  v20,  0LL);
    int Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v41);
    int Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v40);
    int v36 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v39);
    int v21 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], (void *)&__src[4] + 1);
    int v22 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v38);
    uint64_t v24 = v38;
    uint64_t v23 = v39;
    uint64_t v25 = v40;
    uint64_t v26 = *((void *)&__src[4] + 1);
    int v27 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8]);
    int v28 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8] + 1);
    int v29 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &__src[5]);
    if (v20 < *(void *)&__src[8] + *((void *)&__src[8] + 1)
      || v29
      || v28
      || v27
      || v24 != v26
      || v23
      || v25
      || !v37
      || v22
      || v21
      || v36
      || Short
      || Long
      || v33)
    {
      (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
      return 0LL;
    }

    else
    {
      *((void *)&__src[5] + 1) = v20 - (*(void *)&__src[8] + *((void *)&__src[8] + 1));
      *((void *)&__src[7] + 1) = v20;
      *(void *)&__src[18] = 0LL;
      DWORD2(__src[18]) = 0;
      int8x16_t v30 = malloc(0x150uLL);
      int v6 = v30;
      if (v30)
      {
        memcpy(v30, __src, 0x150uLL);
        uint64_t v31 = v6[17];
        v6[12] = 0LL;
        v6[13] = v31;
        v6[14] = unzlocal_GetCurrentFileInfoInternal( (uint64_t)v6,  (uint64_t)(v6 + 18),  v6 + 35,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL) == 0;
      }
    }
  }

  return v6;
}

uint64_t unzlocal_getLong(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v11 = 0;
  if (unzlocal_getByte(a1, a2, &v11)
    || (uint64_t v6 = v11, unzlocal_getByte(a1, a2, &v11))
    || (uint64_t v7 = v11, unzlocal_getByte(a1, a2, &v11)))
  {
    uint64_t v8 = 0LL;
    uint64_t result = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v10 = v6 + (v7 << 8) + ((uint64_t)v11 << 16);
    uint64_t result = unzlocal_getByte(a1, a2, &v11);
    uint64_t v8 = v10 + ((uint64_t)v11 << 24);
    if ((_DWORD)result) {
      uint64_t v8 = 0LL;
    }
  }

  *a3 = v8;
  return result;
}

uint64_t unzlocal_getShort(uint64_t a1, uint64_t a2, void *a3)
{
  int v9 = 0;
  if (unzlocal_getByte(a1, a2, &v9))
  {
    uint64_t v6 = 0LL;
    uint64_t result = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v8 = v9;
    uint64_t result = unzlocal_getByte(a1, a2, &v9);
    uint64_t v6 = v8 + ((uint64_t)v9 << 8);
    if ((_DWORD)result) {
      uint64_t v6 = 0LL;
    }
  }

  *a3 = v6;
  return result;
}

uint64_t unzGoToFirstFile(void *a1)
{
  if (!a1) {
    return 4294967194LL;
  }
  uint64_t v2 = a1[17];
  a1[12] = 0LL;
  a1[13] = v2;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  a1[14] = (_DWORD)result == 0;
  return result;
}

void *unzOpen(uint64_t a1)
{
  return unzOpen2(a1, 0LL);
}

uint64_t unzClose(uint64_t a1)
{
  if (!a1) {
    return 4294967194LL;
  }
  if (*(void *)(a1 + 288)) {
    unzCloseCurrentFile(a1);
  }
  (*(void (**)(void, void))(a1 + 40))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  free((void *)a1);
  return 0LL;
}

uint64_t unzCloseCurrentFile(uint64_t a1)
{
  if (!a1) {
    return 4294967194LL;
  }
  uint64_t v2 = *(void *)(a1 + 288);
  if (!v2) {
    return 4294967194LL;
  }
  if (*(void *)(v2 + 184) || *(_DWORD *)(v2 + 280))
  {
    uint64_t v3 = 0LL;
  }

  else if (*(void *)(v2 + 160) == *(void *)(v2 + 168))
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v3 = 4294967191LL;
  }

  if (*(void *)v2) {
    free(*(void **)v2);
  }
  *(void *)uint64_t v2 = 0LL;
  if (*(void *)(v2 + 128) == 8LL) {
    inflateEnd((z_streamp)(v2 + 8));
  }
  free((void *)v2);
  *(void *)(a1 + 28_Block_object_dispose(va, 8) = 0LL;
  return v3;
}

uint64_t unzGetGlobalInfo(uint64_t a1, _OWORD *a2)
{
  if (!a1) {
    return 4294967194LL;
  }
  uint64_t result = 0LL;
  *a2 = *(_OWORD *)(a1 + 72);
  return result;
}

uint64_t unzGetCurrentFileInfo( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  return unzlocal_GetCurrentFileInfoInternal(a1, a2, 0LL, a3, a4, a5, a6, a7, a8);
}

uint64_t unzlocal_GetCurrentFileInfoInternal( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  if (!a1) {
    return 4294967194LL;
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 88) + *(void *)(a1 + 104),  0LL)
    || unzlocal_getLong(a1, *(void *)(a1 + 64), &v54))
  {
    int v10 = -1;
  }

  else if (v54 == 33639248)
  {
    int v10 = 0;
  }

  else
  {
    int v10 = -103;
  }

  unsigned int v50 = v10;
  int Short = unzlocal_getShort(a1, *(void *)(a1 + 64), &v56);
  int v48 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v56 + 1);
  int v47 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v57);
  int v46 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v57 + 1);
  int Long = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v58);
  LODWORD(v64) = ((v58 >> 21) & 0xF) - 1;
  HIDWORD(v64) = (v58 >> 25) + 1980;
  v11.i32[0] = v58;
  int8x16_t v12 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v58), (uint32x4_t)xmmword_A0C0);
  v12.i32[0] = vshlq_u32(v11, (uint32x4_t)xmmword_A0B0).u32[0];
  int8x16_t v63 = vandq_s8(v12, (int8x16_t)xmmword_A0D0);
  int v13 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v58 + 1);
  int v14 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v59);
  int v15 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v59 + 1);
  int v16 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v60);
  int v17 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v60 + 1);
  int v18 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v61);
  int v19 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v61 + 1);
  int v20 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v62);
  int v21 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v62 + 1);
  else {
    uint64_t v22 = v50;
  }
  unint64_t v23 = v60;
  if (a4)
  {
    unint64_t v25 = a7;
    uint64_t v24 = a6;
    if ((_DWORD)v22)
    {
      uint64_t v28 = a2;
      int v27 = a3;
      uint64_t v29 = a8;
    }

    else
    {
      unint64_t v26 = a5;
      if ((unint64_t)v60 < a5)
      {
        *(_BYTE *)(a4 + v60) = 0;
        unint64_t v26 = v23;
      }

      uint64_t v22 = 0LL;
      if (a5)
      {
        uint64_t v28 = a2;
        int v27 = a3;
        uint64_t v29 = a8;
        if (v23)
        {
          else {
            uint64_t v22 = 0xFFFFFFFFLL;
          }
        }
      }

      else
      {
        uint64_t v28 = a2;
        int v27 = a3;
        uint64_t v29 = a8;
      }

      v23 -= v26;
    }
  }

  else
  {
    uint64_t v28 = a2;
    int v27 = a3;
    uint64_t v29 = a8;
    unint64_t v25 = a7;
    uint64_t v24 = a6;
  }

  uint64_t v30 = *((void *)&v60 + 1);
  if (!v24 || (_DWORD)v22)
  {
    unint64_t v33 = *((void *)&v60 + 1) + v23;
    if (!v29) {
      goto LABEL_60;
    }
    goto LABEL_46;
  }

  if (*((void *)&v60 + 1) >= v25) {
    unint64_t v31 = v25;
  }
  else {
    unint64_t v31 = *((void *)&v60 + 1);
  }
  if (!v23)
  {
    uint64_t v22 = 0LL;
    if (!v25) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }

  uint64_t v32 = (*(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v23,  1LL);
  if (v32) {
    uint64_t v22 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v22 = 0LL;
  }
  if (!v32) {
    unint64_t v23 = 0LL;
  }
  if (v25)
  {
LABEL_41:
    if (v30)
    {
      if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v24,  v31) == v31) {
        uint64_t v22 = v22;
      }
      else {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
    }
  }

LABEL_45:
  unint64_t v33 = v30 - v31 + v23;
  if (!v29) {
    goto LABEL_60;
  }
LABEL_46:
  if (!(_DWORD)v22)
  {
    unint64_t v34 = v61;
    unint64_t v35 = a9;
    if ((unint64_t)v61 < a9)
    {
      *(_BYTE *)(v29 + v61) = 0;
      unint64_t v35 = v34;
    }

    if (v33)
    {
      if ((*(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v33,  1LL))
      {
        uint64_t v22 = 0xFFFFFFFFLL;
      }

      else
      {
        uint64_t v22 = 0LL;
      }

      if (!a9) {
        goto LABEL_60;
      }
LABEL_56:
      if (v34)
      {
        if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v29,  v35) == v35) {
          uint64_t v22 = v22;
        }
        else {
          uint64_t v22 = 0xFFFFFFFFLL;
        }
      }

      goto LABEL_60;
    }

    uint64_t v22 = 0LL;
    if (a9) {
      goto LABEL_56;
    }
  }

LABEL_60:
  if (v28 && !(_DWORD)v22)
  {
    int8x16_t v36 = v63;
    *(_OWORD *)(v28 + 96) = v62;
    *(int8x16_t *)(v28 + 112) = v36;
    *(void *)(v28 + 12_Block_object_dispose(va, 8) = v64;
    __int128 v37 = v59;
    *(_OWORD *)(v28 + 32) = v58;
    *(_OWORD *)(v28 + 4_Block_object_dispose(va, 8) = v37;
    __int128 v38 = v61;
    *(_OWORD *)(v28 + 64) = v60;
    *(_OWORD *)(v28 + 80) = v38;
    __int128 v39 = v57;
    *(_OWORD *)uint64_t v28 = v56;
    *(_OWORD *)(v28 + 16) = v39;
  }

  if (v27 && !(_DWORD)v22) {
    void *v27 = v55;
  }
  return v22;
}

uint64_t unzGoToNextFile(void *a1)
{
  if (!a1) {
    return 4294967194LL;
  }
  if (!a1[14]) {
    return 4294967196LL;
  }
  uint64_t v2 = a1[9];
  uint64_t v3 = a1[12] + 1LL;
  if (v2 != 0xFFFF && v3 == v2) {
    return 4294967196LL;
  }
  uint64_t v5 = a1[26] + a1[27] + a1[28] + a1[13] + 46LL;
  a1[12] = v3;
  a1[13] = v5;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  a1[14] = (_DWORD)result == 0;
  return result;
}

uint64_t unzLocateFile(uint64_t a1, char *__s, unsigned int a3)
{
  if (!a1 || strlen(__s) > 0xFF) {
    return 4294967194LL;
  }
  if (!*(void *)(a1 + 112)) {
    return 4294967196LL;
  }
  uint64_t v7 = *(void *)(a1 + 96);
  uint64_t v8 = *(void *)(a1 + 104);
  __int128 v17 = *(_OWORD *)(a1 + 240);
  __int128 v18 = *(_OWORD *)(a1 + 256);
  uint64_t v9 = *(void *)(a1 + 280);
  uint64_t v19 = *(void *)(a1 + 272);
  __int128 v13 = *(_OWORD *)(a1 + 176);
  __int128 v14 = *(_OWORD *)(a1 + 192);
  __int128 v15 = *(_OWORD *)(a1 + 208);
  __int128 v16 = *(_OWORD *)(a1 + 224);
  __int128 v11 = *(_OWORD *)(a1 + 144);
  __int128 v12 = *(_OWORD *)(a1 + 160);
  uint64_t v10 = *(void *)(a1 + 136);
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 104) = v10;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal(a1, a1 + 144, (void *)(a1 + 280), 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  for (*(void *)(a1 + 112) = (_DWORD)result == 0; !(_DWORD)result; uint64_t result = unzGoToNextFile((void *)a1))
  {
    uint64_t result = unzlocal_GetCurrentFileInfoInternal(a1, 0LL, 0LL, (uint64_t)v20, 0x100uLL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)result) {
      break;
    }
    uint64_t result = unzStringFileNameCompare(v20, __s, a3);
    if (!(_DWORD)result) {
      return result;
    }
  }

  *(void *)(a1 + 96) = v7;
  *(void *)(a1 + 104) = v8;
  *(_OWORD *)(a1 + 240) = v17;
  *(_OWORD *)(a1 + 256) = v18;
  *(void *)(a1 + 272) = v19;
  *(_OWORD *)(a1 + 176) = v13;
  *(_OWORD *)(a1 + 192) = v14;
  *(_OWORD *)(a1 + 20_Block_object_dispose(va, 8) = v15;
  *(_OWORD *)(a1 + 224) = v16;
  *(_OWORD *)(a1 + 144) = v11;
  *(_OWORD *)(a1 + 160) = v12;
  *(void *)(a1 + 280) = v9;
  return result;
}

uint64_t unzGetFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result = 4294967194LL;
  if (a1 && a2)
  {
    if (a1[7].i64[0])
    {
      uint64_t result = 0LL;
      *a2 = vextq_s8(a1[6], a1[6], 8uLL);
    }

    else
    {
      return 4294967196LL;
    }
  }

  return result;
}

uint64_t unzGoToFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result = 4294967194LL;
  if (a1)
  {
    if (a2)
    {
      a1[6] = vextq_s8(*a2, *a2, 8uLL);
      uint64_t result = unzlocal_GetCurrentFileInfoInternal( (uint64_t)a1,  (uint64_t)a1[9].i64,  &a1[17].i64[1],  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
      a1[7].i64[0] = (_DWORD)result == 0;
    }
  }

  return result;
}

uint64_t unzOpenCurrentFile3(uint64_t a1, _DWORD *a2, int *a3, int a4, _BYTE *a5)
{
  if (!a1 || !*(void *)(a1 + 112)) {
    return 4294967194LL;
  }
  if (*(void *)(a1 + 288)) {
    unzCloseCurrentFile(a1);
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 88) + *(void *)(a1 + 280),  0LL))
  {
    return 4294967193LL;
  }

  int Long = unzlocal_getLong(a1, *(void *)(a1 + 64), v51);
  uint64_t v11 = v51[0];
  int Short = unzlocal_getShort(a1, *(void *)(a1 + 64), &v50);
  int v13 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v49);
  if (unzlocal_getShort(a1, *(void *)(a1 + 64), &v50))
  {
    int v14 = -1;
  }

  else
  {
    if (v11 == 67324752) {
      int v18 = 0;
    }
    else {
      int v18 = -103;
    }
    int v19 = v13 | Short | Long;
    if (v19) {
      int v14 = -1;
    }
    else {
      int v14 = v18;
    }
    if (!v19 && v11 == 67324752)
    {
      if (v50 == *(void *)(a1 + 168) && v50 <= 0xC && ((1LL << v50) & 0x1101) != 0) {
        int v14 = 0;
      }
      else {
        int v14 = -103;
      }
    }
  }

  int v15 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v50);
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v50))
  {
    int v16 = -1;
  }

  else
  {
    if (v15) {
      int v16 = -1;
    }
    else {
      int v16 = v14;
    }
    if (!v16)
    {
      if (v50 == *(void *)(a1 + 184))
      {
        int v16 = 0;
      }

      else if ((v49 & 8) != 0)
      {
        int v16 = 0;
      }

      else
      {
        int v16 = -103;
      }
    }
  }

  if (unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v50))
  {
    int v16 = -1;
  }

  else if (!v16)
  {
    if (v50 == *(void *)(a1 + 192))
    {
      int v16 = 0;
    }

    else if ((v49 & 8) != 0)
    {
      int v16 = 0;
    }

    else
    {
      int v16 = -103;
    }
  }

  if (unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v50))
  {
    int v16 = -1;
  }

  else if (!v16)
  {
    if (v50 == *(void *)(a1 + 200))
    {
      int v16 = 0;
    }

    else if ((v49 & 8) != 0)
    {
      int v16 = 0;
    }

    else
    {
      int v16 = -103;
    }
  }

  if (unzlocal_getShort(a1, *(void *)(a1 + 64), &v48))
  {
    int v16 = -1;
    uint64_t v20 = v48;
  }

  else
  {
    uint64_t v20 = v48;
    if (!v16)
    {
      if (v48 == *(void *)(a1 + 208)) {
        int v16 = 0;
      }
      else {
        int v16 = -103;
      }
    }
  }

  uint64_t v22 = *(void *)(a1 + 280);
  int v23 = v47;
  uint64_t v24 = (char *)malloc(0x120uLL);
  if (!v24) {
    return 4294967192LL;
  }
  unint64_t v25 = v24;
  unint64_t v26 = malloc(0x4000uLL);
  *(void *)unint64_t v25 = v26;
  *((void *)v25 + 17) = v20 + v22 + 30;
  *((_DWORD *)v25 + 36) = v23;
  *((void *)v25 + 19) = 0LL;
  *((_DWORD *)v25 + 70) = a4;
  if (!v26)
  {
    free(v25);
    return 4294967192LL;
  }

  *((void *)v25 + 16) = 0LL;
  if (a2) {
    *a2 = *(void *)(a1 + 168);
  }
  if (a3)
  {
    *a3 = 6;
    uint64_t v27 = *(void *)(a1 + 160) & 6LL;
    switch(v27)
    {
      case 2LL:
        int v28 = 9;
        break;
      case 6LL:
        int v28 = 1;
        break;
      case 4LL:
        int v28 = 2;
        break;
      default:
        goto LABEL_72;
    }

    *a3 = v28;
  }

LABEL_72:
  uint64_t v29 = *(void *)(a1 + 184);
  *((void *)v25 + 20) = 0LL;
  *((void *)v25 + 21) = v29;
  uint64_t v30 = *(void *)(a1 + 168);
  *((void *)v25 + 32) = *(void *)(a1 + 64);
  *((void *)v25 + 33) = v30;
  __int128 v31 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v25 + 12) = *(_OWORD *)a1;
  *((_OWORD *)v25 + 13) = v31;
  __int128 v32 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v25 + 14) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v25 + 15) = v32;
  *((void *)v25 + 34) = *(void *)(a1 + 88);
  *((void *)v25 + 6) = 0LL;
  if (a4 || v30 != 12)
  {
    if (!a4 && v30 == 8)
    {
      *((void *)v25 + 1) = 0LL;
      *((_DWORD *)v25 + 4) = 0;
      *((void *)v25 + 10) = 0LL;
      *((void *)v25 + 11) = 0LL;
      *((void *)v25 + 9) = 0LL;
      uint64_t v33 = inflateInit2_((z_streamp)(v25 + 8), -15, "1.2.12", 112);
      if ((_DWORD)v33)
      {
        uint64_t v17 = v33;
        free(v25);
        return v17;
      }

      *((void *)v25 + 16) = 8LL;
      uint64_t v22 = *(void *)(a1 + 280);
    }
  }

  else
  {
    *((_DWORD *)v25 + 70) = 1;
  }

  *((_OWORD *)v25 + 11) = *(_OWORD *)(a1 + 192);
  *((void *)v25 + 15) = v22 + (v23 + v20) + 30;
  *((_DWORD *)v25 + 4) = 0;
  *(void *)(a1 + 28_Block_object_dispose(va, 8) = v25;
  *(_DWORD *)(a1 + 296) = 0;
  if (!a5) {
    return 0LL;
  }
  unint64_t v34 = 878082192LL;
  crc_table = get_crc_table();
  *(_OWORD *)(a1 + 304) = xmmword_A0E0;
  *(void *)(a1 + 320) = 878082192LL;
  *(void *)(a1 + 32_Block_object_dispose(va, 8) = crc_table;
  int v36 = *a5;
  if (*a5)
  {
    __int128 v37 = a5 + 1;
    unint64_t v38 = 305419896LL;
    uint64_t v39 = 591751049LL;
    do
    {
      unint64_t v38 = crc_table[v36 ^ v38] ^ (v38 >> 8);
      uint64_t v39 = 134775813 * (v39 + v38) + 1;
      *(void *)(a1 + 304) = v38;
      *(void *)(a1 + 312) = v39;
      unint64_t v34 = crc_table[(v34 ^ BYTE3(v39))] ^ (v34 >> 8);
      *(void *)(a1 + 320) = v34;
      int v40 = *v37++;
      int v36 = v40;
    }

    while (v40);
  }

  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(*(void *)(a1 + 288) + 272LL) + *(void *)(*(void *)(a1 + 288) + 120LL),  0LL)
    || (unint64_t)(*(uint64_t (**)(void, void, uint64_t *, uint64_t))(a1 + 8))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v51,  12LL) < 0xC)
  {
    return 4294967192LL;
  }

  uint64_t v41 = 0LL;
  unint64_t v43 = *(void *)(a1 + 320);
  uint64_t v42 = *(void *)(a1 + 328);
  unint64_t v44 = *(void *)(a1 + 304);
  uint64_t v45 = *(void *)(a1 + 312);
  do
  {
    char v46 = *((_BYTE *)v51 + v41) ^ ((unsigned __int16)((v43 & 0xFFFD ^ 3) * (v43 | 2)) >> 8);
    *((_BYTE *)v51 + v41) = v46;
    unint64_t v44 = *(void *)(v42 + 8LL * (v46 ^ v44)) ^ (v44 >> 8);
    uint64_t v45 = 134775813 * (v45 + v44) + 1;
    *(void *)(a1 + 304) = v44;
    *(void *)(a1 + 312) = v45;
    unint64_t v43 = *(void *)(v42 + 8LL * (v43 ^ BYTE3(v45))) ^ (v43 >> 8);
    *(void *)(a1 + 320) = v43;
    ++v41;
  }

  while (v41 != 12);
  uint64_t v17 = 0LL;
  *(void *)(*(void *)(a1 + 288) + 120LL) += 12LL;
  *(_DWORD *)(a1 + 296) = 1;
  return v17;
}

uint64_t unzOpenCurrentFile(uint64_t a1)
{
  return unzOpenCurrentFile3(a1, 0LL, 0LL, 0, 0LL);
}

uint64_t unzOpenCurrentFilePassword(uint64_t a1, _BYTE *a2)
{
  return unzOpenCurrentFile3(a1, 0LL, 0LL, 0, a2);
}

uint64_t unzOpenCurrentFile2(uint64_t a1, _DWORD *a2, int *a3, int a4)
{
  return unzOpenCurrentFile3(a1, a2, a3, a4, 0LL);
}

uint64_t unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a1) {
    return 4294967194LL;
  }
  uint64_t v4 = *(void *)(a1 + 288);
  if (!v4) {
    return 4294967194LL;
  }
  if (!*(void *)v4) {
    return 4294967196LL;
  }
  if (!a3) {
    return 0LL;
  }
  *(void *)(v4 + 32) = a2;
  *(_DWORD *)(v4 + 40) = a3;
  unint64_t v5 = a3;
  unint64_t v6 = *(void *)(v4 + 184);
  if (v6 < a3 && !*(_DWORD *)(v4 + 280))
  {
    *(_DWORD *)(v4 + 40) = v6;
    a3 = v6;
  }

  uint64_t v7 = *(void *)(v4 + 176);
  uint64_t v8 = *(unsigned int *)(v4 + 16);
  if (v7 + v8 < v5 && *(_DWORD *)(v4 + 280))
  {
    a3 = v8 + v7;
    *(_DWORD *)(v4 + 40) = v8 + v7;
  }

  if (!a3) {
    return 0LL;
  }
  uint64_t v9 = 0LL;
  while (1)
  {
    LODWORD(v10) = *(_DWORD *)(v4 + 16);
    if (!(_DWORD)v10)
    {
      unint64_t v11 = *(void *)(v4 + 176);
      if (v11)
      {
        if (v11 >= 0x4000) {
          uint64_t v10 = 0x4000LL;
        }
        else {
          uint64_t v10 = *(void *)(v4 + 176);
        }
        if ((*(uint64_t (**)(void, void, void, void))(v4 + 224))( *(void *)(v4 + 248),  *(void *)(v4 + 256),  *(void *)(v4 + 272) + *(void *)(v4 + 120),  0LL)
          || (*(uint64_t (**)(void, void, void, uint64_t))(v4 + 200))( *(void *)(v4 + 248),  *(void *)(v4 + 256),  *(void *)v4,  v10) != v10)
        {
          return 0xFFFFFFFFLL;
        }

        if (*(_DWORD *)(a1 + 296))
        {
          uint64_t v12 = 0LL;
          do
          {
            uint64_t v13 = *(void *)(a1 + 328);
            uint64_t v15 = *(void *)(v13 + 8LL * (v14 ^ *(void *)(a1 + 304))) ^ (*(void *)(a1 + 304) >> 8);
            uint64_t v16 = 134775813 * (*(void *)(a1 + 312) + v15) + 1LL;
            *(void *)(a1 + 304) = v15;
            *(void *)(a1 + 312) = v16;
            *(void *)(a1 + 320) = *(void *)(v13 + 8LL * (*(void *)(a1 + 320) ^ BYTE3(v16))) ^ (*(void *)(a1 + 320) >> 8);
            *(_BYTE *)(*(void *)v4 + v12++) = v14;
          }

          while (v10 != v12);
        }

        *(void *)(v4 + 120) += v10;
        *(void *)(v4 + 176) -= v10;
        *(void *)(v4 + _Block_object_dispose(va, 8) = *(void *)v4;
        *(_DWORD *)(v4 + 16) = v10;
      }

      else
      {
        LODWORD(v10) = 0;
      }
    }

    uint64_t v17 = *(void *)(v4 + 264);
    if (!v17 || *(_DWORD *)(v4 + 280))
    {
      if (!(_DWORD)v10 && !*(void *)(v4 + 176)) {
        return v9;
      }
      unsigned int v18 = *(_DWORD *)(v4 + 40);
      else {
        uint64_t v10 = v18;
      }
      if ((_DWORD)v10)
      {
        for (uint64_t i = 0LL; i != v10; ++i)
          *(_BYTE *)(*(void *)(v4 + 32) + i) = *(_BYTE *)(*(void *)(v4 + 8) + i);
        uint64_t v20 = v10;
      }

      else
      {
        uint64_t v20 = 0LL;
      }

      *(void *)(v4 + 160) = crc32(*(void *)(v4 + 160), *(const Bytef **)(v4 + 32), v10);
      *(void *)(v4 + 184) -= v20;
      *(_DWORD *)(v4 + 16) -= v10;
      *(_DWORD *)(v4 + 40) -= v10;
      *(void *)(v4 + 32) += v20;
      *(void *)(v4 + 8) += v20;
      uint64_t v9 = (v10 + v9);
      *(void *)(v4 + 48) += v20;
      goto LABEL_38;
    }

    if (v17 != 12)
    {
      uint64_t v21 = *(void *)(v4 + 48);
      uint64_t v22 = *(const Bytef **)(v4 + 32);
      unsigned int v23 = inflate((z_streamp)(v4 + 8), 2);
      if ((v23 & 0x80000000) == 0 && *(void *)(v4 + 56))
      {
        uint64_t v26 = *(void *)(v4 + 48);
        uint64_t v27 = v26 - v21;
        *(void *)(v4 + 160) = crc32(*(void *)(v4 + 160), v22, (int)v26 - (int)v21);
        *(void *)(v4 + 184) -= v27;
        return 4294967293LL;
      }

      uint64_t v24 = *(void *)(v4 + 48) - v21;
      *(void *)(v4 + 160) = crc32(*(void *)(v4 + 160), v22, v24);
      *(void *)(v4 + 184) -= v24;
      uint64_t v9 = (v9 + v24);
      if (v23) {
        break;
      }
    }

LABEL_38:
    if (!*(_DWORD *)(v4 + 40)) {
      return v9;
    }
  }

  if (v23 == 1) {
    return v9;
  }
  else {
    return v23;
  }
}

uint64_t unztell(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 288)) != 0) {
    return *(void *)(v1 + 48);
  }
  else {
    return -102LL;
  }
}

uint64_t unzeof(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 288)) != 0) {
    return *(void *)(v1 + 184) == 0LL;
  }
  else {
    return 4294967194LL;
  }
}

unint64_t unzGetLocalExtrafield(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a1) {
    return 4294967194LL;
  }
  uint64_t v3 = *(void *)(a1 + 288);
  if (!v3) {
    return 4294967194LL;
  }
  uint64_t v5 = *(void *)(v3 + 152);
  unint64_t result = *(unsigned int *)(v3 + 144) - v5;
  if (a2)
  {
    if (result >= a3) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = result;
    }
    if ((_DWORD)v7)
    {
      if ((*(uint64_t (**)(void, void, uint64_t, void))(v3 + 224))( *(void *)(v3 + 248),  *(void *)(v3 + 256),  *(void *)(v3 + 136) + v5,  0LL))
      {
        return 0xFFFFFFFFLL;
      }

      else if ((*(uint64_t (**)(void, void, uint64_t, uint64_t))(v3 + 200))( *(void *)(v3 + 248),  *(void *)(v3 + 256),  a2,  v7) == v7)
      {
        return v7;
      }

      else
      {
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t unzGetGlobalComment(uint64_t a1, _BYTE *a2, unint64_t a3)
{
  if (!a1) {
    return 4294967194LL;
  }
  if (*(void *)(a1 + 80) >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = *(void *)(a1 + 80);
  }
  if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 32))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 120) + 22LL,  0LL))
  {
    return 0xFFFFFFFFLL;
  }

  if (v6)
  {
    *a2 = 0;
    if ((*(uint64_t (**)(void, void, _BYTE *, unint64_t))(a1 + 8))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  a2,  v6) != v6) {
      return 0xFFFFFFFFLL;
    }
  }

  else if (!a2)
  {
    return v6;
  }

  unint64_t v8 = *(void *)(a1 + 80);
  if (v8 < a3) {
    a2[v8] = 0;
  }
  return v6;
}

void *unzGetOffset(void *result)
{
  if (result)
  {
    if (result[14] && ((v1 = result[9]) != 0 ? (BOOL v2 = v1 == 0xFFFF) : (BOOL v2 = 1), v2 || result[12] != v1)) {
      return (void *)result[13];
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t unzSetOffset(void *a1, uint64_t a2)
{
  if (!a1) {
    return 4294967194LL;
  }
  a1[12] = a1[9];
  a1[13] = a2;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  a1[14] = (_DWORD)result == 0;
  return result;
}

uint64_t unzlocal_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))( *(void *)(a1 + 56),  a2,  &v7,  1LL) == 1)
  {
    uint64_t result = 0LL;
    *a3 = v7;
  }

  else if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), a2))
  {
    return 0xFFFFFFFFLL;
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void *zipOpen2(uint64_t a1, int a2, void *a3, _OWORD *a4)
{
  if (a4)
  {
    __int128 v7 = a4[1];
    __src[0] = *a4;
    __src[1] = v7;
    __int128 v8 = a4[3];
    __src[2] = a4[2];
    __src[3] = v8;
  }

  else
  {
    fill_fopen_filefunc((FILE *(**)(int, char *, char))__src);
  }

  if (a2) {
    uint64_t v9 = 7LL;
  }
  else {
    uint64_t v9 = 11LL;
  }
  uint64_t v10 = (*(uint64_t (**)(void, uint64_t, uint64_t))&__src[0])(*((void *)&__src[3] + 1), a1, v9);
  *(void *)&__src[4] = v10;
  if (!v10) {
    return 0LL;
  }
  uint64_t v11 = v10;
  if (a2 == 1)
  {
    (*(void (**)(void, uint64_t, void, uint64_t))&__src[2])(*((void *)&__src[3] + 1), v10, 0LL, 2LL);
    uint64_t v11 = *(void *)&__src[4];
  }

  *(void *)&__src[1044] = (*((uint64_t (**)(void, uint64_t))&__src[1] + 1))( *((void *)&__src[3] + 1),  v11);
  LODWORD(__src[13]) = 0;
  uint64_t v12 = malloc(0x4160uLL);
  *(_OWORD *)((char *)&__src[4] + _Block_object_dispose(va, 8) = 0u;
  DWORD2(__src[5]) = 0;
  *(_OWORD *)((char *)&__src[1044] + _Block_object_dispose(va, 8) = 0u;
  if (!v12)
  {
    (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
    return v12;
  }

  *((void *)&__src[1045] + 1) = 0LL;
  if (a2 == 2)
  {
    unint64_t v50 = a3;
    uint64_t v13 = *(void *)&__src[4];
    unint64_t v14 = 0LL;
    if (!(*(uint64_t (**)(void, void, void, uint64_t))&__src[2])( *((void *)&__src[3] + 1),  *(void *)&__src[4],  0LL,  2LL))
    {
      unint64_t v15 = (*((uint64_t (**)(void, uint64_t))&__src[1] + 1))(*((void *)&__src[3] + 1), v13);
      unint64_t v16 = v15;
      if (v15 >= 0xFFFF) {
        unint64_t v17 = 0xFFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      unsigned int v18 = malloc(0x404uLL);
      if (v18)
      {
        int v19 = v18;
        if (v17 >= 5)
        {
          uint64_t v20 = 4LL;
          do
          {
            unint64_t v21 = v20 + 1024;
            unint64_t v22 = v20 + 1024 >= v17 ? v17 : v20 + 1024;
            unint64_t v23 = v22 >= 0x404 ? 1028LL : v22;
            if ((*(uint64_t (**)(void, uint64_t, unint64_t, void))&__src[2])( *((void *)&__src[3] + 1),  v13,  v16 - v22,  0LL)
              || (*((uint64_t (**)(void, uint64_t, _BYTE *, unint64_t))&__src[0] + 1))( *((void *)&__src[3] + 1),  v13,  v19,  v23) != v23)
            {
              break;
            }

            if (v23 >= 4)
            {
              uint64_t v24 = (v23 - 4) + 1LL;
              while (v19[v24 - 1] != 80 || v19[v24] != 75 || v19[v24 + 1] != 5 || v19[v24 + 2] != 6)
              {
                if (v24-- <= 1) {
                  goto LABEL_35;
                }
              }

              if (v16 - v22 + v24 != 1)
              {
                unint64_t v26 = v20 + 1024;
                if (v16 < v20 + 1024) {
                  unint64_t v26 = v16;
                }
                if (v26 >= 0xFFFF) {
                  unint64_t v26 = 0xFFFFLL;
                }
                unint64_t v14 = v16 - v26 + v24 - 1;
                goto LABEL_51;
              }
            }

LABEL_35:
            uint64_t v20 = v22;
          }

          while (v17 > v21);
        }

        unint64_t v14 = 0LL;
LABEL_51:
        free(v19);
      }

      else
      {
        unint64_t v14 = 0LL;
      }
    }

    uint64_t v51 = (*(uint64_t (**)(void, void, unint64_t, void))&__src[2])( *((void *)&__src[3] + 1),  *(void *)&__src[4],  v14,  0LL);
    int Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v62);
    int Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v61);
    int v54 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v60);
    int v55 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v59);
    int v28 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v58);
    uint64_t v29 = v59;
    uint64_t v56 = v58;
    uint64_t v31 = v60;
    uint64_t v30 = v61;
    int v32 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&v64);
    int v33 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v63);
    int v34 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v57);
    uint64_t v36 = v63;
    unint64_t v35 = v64;
    BOOL v37 = v14 >= v64 + v63;
    unint64_t v38 = v14 - (v64 + v63);
    if (!v37 || v34 || v33 || v32 || v56 != v29 || v31 || v30 || v28 || v55 || v54 || Short || Long || v51)
    {
      (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
LABEL_83:
      free(v12);
      return 0LL;
    }

    uint64_t v39 = v57;
    if (v57)
    {
      int v40 = malloc(v57 + 1);
      *((void *)&__src[1045] + 1) = v40;
      if (v40)
      {
        uint64_t v41 = (*((uint64_t (**)(void, void, void *, uint64_t))&__src[0] + 1))( *((void *)&__src[3] + 1),  *(void *)&__src[4],  v40,  v39);
        *(_BYTE *)(*((void *)&__src[1045] + 1) + v41) = 0;
      }
    }

    *((void *)&__src[1044] + 1) = v38;
    uint64_t v42 = (char *)malloc(0xFF0uLL);
    unint64_t v43 = v38;
    unint64_t v44 = v38 + v36;
    uint64_t v45 = (*(uint64_t (**)(void, void, unint64_t, void))&__src[2])( *((void *)&__src[3] + 1),  *(void *)&__src[4],  v38 + v36,  0LL);
    if (v45) {
      int v46 = -1;
    }
    else {
      int v46 = 0;
    }
    if (v35 && !v45)
    {
      while (1)
      {
        unint64_t v47 = v35 >= 0xFF0 ? 4080LL : v35;
        if ((*((uint64_t (**)(void, void, char *, unint64_t))&__src[0] + 1))( *((void *)&__src[3] + 1),  *(void *)&__src[4],  v42,  v47) != v47) {
          break;
        }
        int v48 = add_data_in_datablock((void *)&__src[4] + 1, v42, v47);
        int v46 = v48;
        v35 -= v47;
        if (!v35 || v48) {
          goto LABEL_87;
        }
      }

      int v46 = -1;
    }

LABEL_87:
    if (v42) {
      free(v42);
    }
    *(void *)&__src[1044] = v43;
    *(void *)&__src[1045] = v56;
    if ((*(uint64_t (**)(void, void, unint64_t, void))&__src[2])( *((void *)&__src[3] + 1),  *(void *)&__src[4],  v44,  0LL))
    {
      int v27 = -1;
    }

    else
    {
      int v27 = v46;
    }

    a3 = v50;
    if (!v50) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }

  int v27 = 0;
  if (a3) {
LABEL_45:
  }
    *a3 = *((void *)&__src[1045] + 1);
LABEL_46:
  if (v27)
  {
    if (*((void *)&__src[1045] + 1)) {
      free(*((void **)&__src[1045] + 1));
    }
    goto LABEL_83;
  }

  memcpy(v12, __src, 0x4160uLL);
  return v12;
}

uint64_t add_data_in_datablock(void *a1, char *a2, unint64_t a3)
{
  if (!a1) {
    return 4294967192LL;
  }
  unint64_t v3 = a3;
  unint64_t v6 = (void *)a1[1];
  if (v6)
  {
    if (!a3) {
      return 0LL;
    }
  }

  else
  {
    __int128 v8 = (char *)malloc(0x1010uLL);
    if (!v8)
    {
      *a1 = 0LL;
      a1[1] = 0LL;
      return 4294967192LL;
    }

    unint64_t v6 = v8;
    *(void *)__int128 v8 = 0LL;
    *(_OWORD *)(v8 + _Block_object_dispose(va, 8) = xmmword_A150;
    *a1 = v8;
    a1[1] = v8;
    if (!v3) {
      return 0LL;
    }
  }

  unint64_t v9 = v6[1];
  while (v9)
  {
    uint64_t v10 = v6[2];
LABEL_13:
    if (v9 >= v3) {
      unsigned int v12 = v3;
    }
    else {
      unsigned int v12 = v9;
    }
    if (v12)
    {
      uint64_t v13 = (char *)v6 + v10 + 32;
      uint64_t v14 = v12;
      unint64_t v15 = a2;
      do
      {
        char v16 = *v15++;
        *v13++ = v16;
        --v14;
      }

      while (v14);
      unint64_t v9 = v6[1];
      uint64_t v10 = v6[2];
    }

    v9 -= v12;
    v6[1] = v9;
    v6[2] = v10 + v12;
    a2 += v12;
    v3 -= v12;
    if (!v3) {
      return 0LL;
    }
  }

  uint64_t v11 = (char *)malloc(0x1010uLL);
  if (v11)
  {
    uint64_t v10 = 0LL;
    *(void *)uint64_t v11 = 0LL;
    *(_OWORD *)(v11 + _Block_object_dispose(va, 8) = xmmword_A150;
    *unint64_t v6 = v11;
    unint64_t v9 = 4080LL;
    unint64_t v6 = v11;
    a1[1] = v11;
    goto LABEL_13;
  }

  *unint64_t v6 = 0LL;
  return 4294967192LL;
}

void *zipOpen(uint64_t a1, int a2)
{
  return zipOpen2(a1, a2, 0LL, 0LL);
}

uint64_t zipOpenNewFileInZip4( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *__s, int a9, int a10, int a11, int a12, int a13, int a14, _BYTE *a15, uint64_t a16, unint64_t a17, uint64_t a18)
{
  uint64_t result = 4294967194LL;
  if (!a1) {
    return result;
  }
  if ((a9 & 0xFFFFFFF7) != 0) {
    return result;
  }
  if (*(_DWORD *)(a1 + 88) == 1)
  {
    uint64_t result = zipCloseFileInZipRaw(a1, 0LL, 0LL);
    if ((_DWORD)result) {
      return result;
    }
  }

  unsigned int v97 = a5;
  if (a2) {
    int v27 = a2;
  }
  else {
    int v27 = "-";
  }
  if (__s) {
    unsigned int v28 = strlen(__s);
  }
  else {
    unsigned int v28 = 0;
  }
  unsigned int v98 = strlen(v27);
  if (a3)
  {
    unint64_t v29 = *(void *)(a3 + 24);
    if (!v29)
    {
      uint64_t v30 = *(unsigned int *)(a3 + 20);
      uint64_t v31 = v30 - 80;
      else {
        uint64_t v32 = v30 - 1980;
      }
      unint64_t v29 = ((32 * *(_DWORD *)(a3 + 4) + (*(_DWORD *)a3 >> 1))
    }
  }

  else
  {
    unint64_t v29 = 0LL;
  }

  *(void *)(a1 + 16640) = v29;
  if ((a10 & 0xFFFFFFFE) == 8) {
    uint64_t v33 = a18 | 2;
  }
  else {
    uint64_t v33 = a18;
  }
  *(void *)(a1 + 240) = v33;
  if (a10 == 2)
  {
    uint64_t v34 = 4LL;
  }

  else
  {
    if (a10 != 1) {
      goto LABEL_28;
    }
    uint64_t v34 = 6LL;
  }

  v33 |= v34;
  *(void *)(a1 + 240) = v33;
LABEL_28:
  if (a15) {
    *(void *)(a1 + 240) = v33 | 1;
  }
  *(void *)(a1 + 1664_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 16656) = 0;
  *(void *)(a1 + 20_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 24_Block_object_dispose(va, 8) = a9;
  *(_DWORD *)(a1 + 252) = a11;
  uint64_t v35 = (*(uint64_t (**)(void, void))(a1 + 24))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  *(void *)(a1 + 216) = v35;
  size_t v36 = a7 + v28 + v98 + 46;
  *(void *)(a1 + 232) = v36;
  BOOL v37 = (char *)malloc(v36);
  *(void *)(a1 + 224) = v37;
  *(_DWORD *)BOOL v37 = 33639248;
  *((_WORD *)v37 + 2) = a17;
  if (a17 >= 0x10000) {
    *((_WORD *)v37 + 2) = -1;
  }
  *((_WORD *)v37 + 3) = 20;
  unint64_t v38 = *(void *)(a1 + 240);
  *((_WORD *)v37 + 4) = v38;
  if (v38 >= 0x10000) {
    *((_WORD *)v37 + 4) = -1;
  }
  unsigned int v39 = *(_DWORD *)(a1 + 248);
  *((_WORD *)v37 + 5) = v39;
  if (v39 >= 0x10000) {
    *((_WORD *)v37 + 5) = -1;
  }
  uint64_t v40 = 0LL;
  uint64_t v41 = v37 + 12;
  unint64_t v42 = *(void *)(a1 + 16640);
  do
  {
    unint64_t v43 = v42;
    *((_BYTE *)v41 + v40) = v42;
    v42 >>= 8;
    ++v40;
  }

  while (v40 != 4);
  if (v43 >= 0x100) {
    *uint64_t v41 = -1;
  }
  *((void *)v37 + 2) = 0LL;
  *((_DWORD *)v37 + 6) = 0;
  *((_WORD *)v37 + 14) = v98;
  if (v98 >= 0x10000uLL) {
    *((_WORD *)v37 + 14) = -1;
  }
  *((_WORD *)v37 + 15) = a7;
  if (a7 >= 0x10000) {
    *((_WORD *)v37 + 15) = -1;
  }
  *((_WORD *)v37 + 16) = v28;
  if (v28 >= 0x10000) {
    *((_WORD *)v37 + 16) = -1;
  }
  *((_WORD *)v37 + 17) = 0;
  uint64_t v44 = v28;
  if (a3)
  {
    unint64_t v45 = *(void *)(a3 + 32);
    *((_WORD *)v37 + 1_Block_object_dispose(va, 8) = v45;
    if (v45 >= 0x10000) {
      *((_WORD *)v37 + 1_Block_object_dispose(va, 8) = -1;
    }
    uint64_t v46 = 0LL;
    unint64_t v47 = v37 + 38;
    unint64_t v48 = *(void *)(a3 + 40);
    do
    {
      unint64_t v49 = v48;
      *((_BYTE *)v47 + v46) = v48;
      v48 >>= 8;
      ++v46;
    }

    while (v46 != 4);
    if (v49 >= 0x100) {
      *unint64_t v47 = -1;
    }
  }

  else
  {
    *((_WORD *)v37 + 1_Block_object_dispose(va, 8) = 0;
    *(_DWORD *)(v37 + 3_Block_object_dispose(va, 8) = 0;
  }

  uint64_t v50 = 0LL;
  uint64_t v51 = v37 + 42;
  unint64_t v52 = v35 - *(void *)(a1 + 16712);
  do
  {
    unint64_t v53 = v52;
    *((_BYTE *)v51 + v50) = v52;
    v52 >>= 8;
    ++v50;
  }

  while (v50 != 4);
  if (v53 >= 0x100) {
    *uint64_t v51 = -1;
  }
  if (v98)
  {
    for (uint64_t i = 0LL; i != v98; ++i)
      *(_BYTE *)(*(void *)(a1 + 224) + i + 46) = v27[i];
  }

  if (a7)
  {
    uint64_t v55 = v98 + 46LL;
    uint64_t v56 = a7;
    do
    {
      char v57 = *a6++;
      *(_BYTE *)(*(void *)(a1 + 224) + v55++) = v57;
      --v56;
    }

    while (v56);
  }

  if (v28)
  {
    unint64_t v58 = a7 + (unint64_t)v98 + 46;
    do
    {
      char v59 = *__s++;
      *(_BYTE *)(*(void *)(a1 + 224) + v58++) = v59;
      --v44;
    }

    while (v44);
  }

  if (!*(void *)(a1 + 224)) {
    return 4294967192LL;
  }
  v99[0] = 67324752;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v99,  4LL) != 4) {
    goto LABEL_97;
  }
  LOWORD(v99[0]) = 20;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v99,  2LL) != 2) {
    goto LABEL_97;
  }
  uint64_t v60 = *(void *)(a1 + 64);
  unint64_t v61 = *(void *)(a1 + 240);
  LOWORD(v99[0]) = v61;
  if (v61 >= 0x10000) {
    LOWORD(v99[0]) = -1;
  }
  uint64_t v62 = *(void *)(a1 + 64);
  unsigned int v63 = *(_DWORD *)(a1 + 248);
  LOWORD(v99[0]) = v63;
  if (v63 >= 0x10000) {
    LOWORD(v99[0]) = -1;
  }
  uint64_t v64 = 0LL;
  uint64_t v65 = *(void *)(a1 + 64);
  unint64_t v66 = *(void *)(a1 + 16640);
  do
  {
    unint64_t v67 = v66;
    *((_BYTE *)v99 + v64) = v66;
    v66 >>= 8;
    ++v64;
  }

  while (v64 != 4);
  if (v67 >= 0x100) {
    v99[0] = -1;
  }
  v99[0] = 0;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v99,  4LL) != 4) {
    goto LABEL_97;
  }
  v99[0] = 0;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v99,  4LL) != 4) {
    goto LABEL_97;
  }
  v99[0] = 0;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v99,  4LL) != 4) {
    goto LABEL_97;
  }
  uint64_t v68 = *(void *)(a1 + 64);
  LOWORD(v99[0]) = v98;
  if (v98 >= 0x10000uLL) {
    LOWORD(v99[0]) = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v68, v99, 2LL) == 2)
  {
    uint64_t v69 = *(void *)(a1 + 64);
    LOWORD(v99[0]) = v97;
    if (v97 >= 0x10000) {
      LOWORD(v99[0]) = -1;
    }
    uint64_t v70 = (*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v69, v99, 2LL);
    int v71 = v70 != 2;
    if (v70 == 2 && v98) {
      int v71 = (*(uint64_t (**)(void, void, const char *, void))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v27,  v98) != v98;
    }
    int v72 = v71 << 31 >> 31;
    int v73 = (_DWORD *)(a1 + 16656);
    v74 = a15;
    if (v97 && (v71 & 1) == 0)
    {
      uint64_t v75 = (*(uint64_t (**)(void, void, uint64_t, void))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  a4,  v97);
      int v73 = (_DWORD *)(a1 + 16656);
      v74 = a15;
      if (v75 == v97) {
        int v72 = 0;
      }
      else {
        int v72 = -1;
      }
    }
  }

  else
  {
LABEL_97:
    int v72 = -1;
    int v73 = (_DWORD *)(a1 + 16656);
    v74 = a15;
  }

  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 12_Block_object_dispose(va, 8) = 0x4000;
  *(void *)(a1 + 112) = 0LL;
  *(void *)(a1 + 120) = a1 + 256;
  *(void *)(a1 + 136) = 0LL;
  *(_DWORD *)(a1 + 184) = 0;
  if (v72)
  {
    uint64_t result = 0xFFFFFFFFLL;
LABEL_100:
    v73[10] = 0;
    return result;
  }

  if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
  {
    if (a12 < 0) {
      int v96 = a12;
    }
    else {
      int v96 = -a12;
    }
    *(void *)(a1 + 160) = 0LL;
    *(void *)(a1 + 16_Block_object_dispose(va, 8) = 0LL;
    *(void *)(a1 + 176) = 0LL;
    uint64_t result = deflateInit2_((z_streamp)(a1 + 96), a10, 8, v96, a13, a14, "1.2.12", 112);
    int v73 = (_DWORD *)(a1 + 16656);
    if ((_DWORD)result) {
      goto LABEL_100;
    }
    *(_DWORD *)(a1 + 20_Block_object_dispose(va, 8) = 1;
    v74 = a15;
  }

  v73[10] = 0;
  if (!v74) {
    goto LABEL_112;
  }
  *int v73 = 1;
  crc_table = get_crc_table();
  *(void *)(a1 + 1668_Block_object_dispose(va, 8) = crc_table;
  if (!crypthead_calls++)
  {
    int v78 = time(0LL);
    srand(v78 ^ 0xBB40E64E);
  }

  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  for (uint64_t j = 0LL; j != 10; v102[j++] = ((unsigned __int16)((v81 & 0xFFFD ^ 3) * (v81 | 2)) >> 8) ^ (v80 >> 7))
  {
    unsigned int v80 = rand();
    unint64_t v81 = *(void *)(a1 + 16680);
    z_crc_t v82 = crc_table[(*(void *)(a1 + 16664) ^ (v80 >> 7))] ^ (*(void *)(a1 + 16664) >> 8);
    *(void *)(a1 + 16664) = v82;
    uint64_t v83 = 134775813 * (*(void *)(a1 + 16672) + v82) + 1LL;
    *(void *)(a1 + 16672) = v83;
    *(void *)(a1 + 16680) = crc_table[(v81 ^ BYTE3(v83))] ^ (v81 >> 8);
  }

  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  uint64_t v84 = 0LL;
  z_crc_t v85 = *(void *)(a1 + 16680);
  z_crc_t v86 = *(void *)(a1 + 16664);
  uint64_t v87 = *(void *)(a1 + 16672);
  do
  {
    __int16 v88 = (v85 & 0xFFFD ^ 3) * (v85 | 2);
    char v89 = v102[v84];
    z_crc_t v86 = crc_table[(v89 ^ v86)] ^ (v86 >> 8);
    *(void *)(a1 + 16664) = v86;
    uint64_t v87 = 134775813 * (v87 + v86) + 1;
    *(void *)(a1 + 16672) = v87;
    z_crc_t v85 = crc_table[(v85 ^ BYTE3(v87))] ^ (v85 >> 8);
    *(void *)(a1 + 16680) = v85;
    *((_BYTE *)v99 + v84++) = v89 ^ HIBYTE(v88);
  }

  while (v84 != 10);
  int v90 = ((v85 & 0xFFFFFFFD ^ 3) * (v85 | 2)) >> 8;
  z_crc_t v91 = crc_table[(v86 ^ BYTE2(a16))] ^ (v86 >> 8);
  *(void *)(a1 + 16664) = v91;
  uint64_t v92 = 134775813 * (v87 + v91) + 1;
  *(void *)(a1 + 16672) = v92;
  z_crc_t v93 = crc_table[(v85 ^ BYTE3(v92))] ^ (v85 >> 8);
  *(void *)(a1 + 16680) = v93;
  char v100 = v90 ^ BYTE2(a16);
  z_crc_t v94 = crc_table[v91 ^ BYTE3(a16)] ^ (v91 >> 8);
  *(void *)(a1 + 16664) = v94;
  uint64_t v95 = 134775813 * (v92 + v94) + 1;
  *(void *)(a1 + 16672) = v95;
  *(void *)(a1 + 16680) = crc_table[(v93 ^ BYTE3(v95))] ^ (v93 >> 8);
  char v101 = ((unsigned __int16)((v93 & 0xFFFD ^ 3) * (v93 | 2)) >> 8) ^ BYTE3(a16);
  *(_DWORD *)(a1 + 16696) = 12;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v99,  12LL) != 12) {
    return 0xFFFFFFFFLL;
  }
LABEL_112:
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = 1;
  return result;
}

uint64_t zipCloseFileInZip(uint64_t a1)
{
  return zipCloseFileInZipRaw(a1, 0LL, 0LL);
}

uint64_t zipOpenNewFileInZip2( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10, int a11)
{
  return zipOpenNewFileInZip4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, -15, 8, 0, 0LL, 0LL, 0LL, 0LL);
}

uint64_t zipOpenNewFileInZip3( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10, uint64_t a11, int a12, int a13, _BYTE *a14, uint64_t a15)
{
  return zipOpenNewFileInZip4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, SHIDWORD(a11), a12, a13, a14, a15, 0LL, 0LL);
}

uint64_t zipOpenNewFileInZip( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10)
{
  return zipOpenNewFileInZip4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, -15, 8, 0, 0LL, 0LL, 0LL, 0LL);
}

uint64_t zipWriteInFileInZip(uint64_t a1, const Bytef *a2, uInt a3)
{
  if (!a1) {
    return 4294967194LL;
  }
  if (!*(_DWORD *)(a1 + 88)) {
    return 4294967194LL;
  }
  *(void *)(a1 + 96) = a2;
  *(_DWORD *)(a1 + 104) = a3;
  *(void *)(a1 + 1664_Block_object_dispose(va, 8) = crc32(*(void *)(a1 + 16648), a2, a3);
  while (*(_DWORD *)(a1 + 104))
  {
    unsigned int v4 = *(_DWORD *)(a1 + 128);
    if (v4 {
      || (uint64_t result = zipFlushWriteBuffer(a1),
    }
          unsigned int v4 = 0x4000,
          *(_DWORD *)(a1 + 12_Block_object_dispose(va, 8) = 0x4000,
          *(void *)(a1 + 120) = a1 + 256,
          (_DWORD)result != -1))
    {
      if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
      {
        int v11 = *(_DWORD *)(a1 + 136);
        uint64_t result = deflate((z_streamp)(a1 + 96), 0);
        LODWORD(v7) = *(_DWORD *)(a1 + 136) - v11;
      }

      else
      {
        unsigned int v6 = *(_DWORD *)(a1 + 104);
        uint64_t v7 = v6 >= v4 ? v4 : v6;
        if ((_DWORD)v7)
        {
          for (uint64_t i = 0LL; i != v7; ++i)
            *(_BYTE *)(*(void *)(a1 + 120) + i) = *(_BYTE *)(*(void *)(a1 + 96) + i);
          unsigned int v6 = *(_DWORD *)(a1 + 104);
          unsigned int v4 = *(_DWORD *)(a1 + 128);
          uint64_t v9 = v7;
        }

        else
        {
          uint64_t v9 = 0LL;
        }

        uint64_t result = 0LL;
        *(_DWORD *)(a1 + 104) = v6 - v7;
        *(_DWORD *)(a1 + 12_Block_object_dispose(va, 8) = v4 - v7;
        *(void *)(a1 + 96) += v9;
        uint64_t v10 = *(void *)(a1 + 120) + v9;
        *(void *)(a1 + 112) += v9;
        *(void *)(a1 + 120) = v10;
        *(void *)(a1 + 136) += v9;
      }

      *(_DWORD *)(a1 + 212) += v7;
      if (!(_DWORD)result) {
        continue;
      }
    }

    return result;
  }

  return 0LL;
}

uint64_t zipFlushWriteBuffer(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 212);
  if (*(_DWORD *)(a1 + 16656) && v2)
  {
    unint64_t v3 = (_BYTE *)(a1 + 256);
    uint64_t v4 = *(unsigned int *)(a1 + 212);
    do
    {
      unint64_t v5 = *(void *)(a1 + 16680);
      uint64_t v6 = *(void *)(a1 + 16688);
      uint64_t v7 = *(void *)(v6 + 8LL * (*v3 ^ *(void *)(a1 + 16664))) ^ (*(void *)(a1 + 16664) >> 8);
      *(void *)(a1 + 16664) = v7;
      uint64_t v8 = 134775813 * (*(void *)(a1 + 16672) + v7) + 1LL;
      *(void *)(a1 + 16672) = v8;
      *(void *)(a1 + 16680) = *(void *)(v6 + 8LL * (v5 ^ BYTE3(v8))) ^ (v5 >> 8);
      *v3++ ^= (unsigned __int16)((v5 & 0xFFFD ^ 3) * (v5 | 2)) >> 8;
      --v4;
    }

    while (v4);
  }

  if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  a1 + 256,  v2) == *(_DWORD *)(a1 + 212)) {
    uint64_t result = 0LL;
  }
  else {
    uint64_t result = 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a1 + 212) = 0;
  return result;
}

uint64_t zipCloseFileInZipRaw(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a1 || !*(_DWORD *)(a1 + 88)) {
    return 4294967194LL;
  }
  *(_DWORD *)(a1 + 104) = 0;
  if (*(_DWORD *)(a1 + 248) != 8 || *(_DWORD *)(a1 + 252)) {
    goto LABEL_66;
  }
  do
  {
    if (!*(_DWORD *)(a1 + 128))
    {
      zipFlushWriteBuffer(a1);
      *(_DWORD *)(a1 + 12_Block_object_dispose(va, 8) = 0x4000;
      *(void *)(a1 + 120) = a1 + 256;
    }

    int v6 = *(_DWORD *)(a1 + 136);
    uint64_t v7 = deflate((z_streamp)(a1 + 96), 4);
    *(_DWORD *)(a1 + 212) += *(_DWORD *)(a1 + 136) - v6;
  }

  while (!(_DWORD)v7);
  uint64_t v8 = v7;
  if ((_DWORD)v7 == 1)
  {
LABEL_66:
    if (*(_DWORD *)(a1 + 212))
    {
      else {
        uint64_t v8 = 0LL;
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

  if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
  {
    unsigned int v9 = deflateEnd((z_streamp)(a1 + 96));
    if ((_DWORD)v8) {
      uint64_t v8 = v8;
    }
    else {
      uint64_t v8 = v9;
    }
    *(_DWORD *)(a1 + 20_Block_object_dispose(va, 8) = 0;
  }

  if (!*(_DWORD *)(a1 + 252))
  {
    a3 = *(void *)(a1 + 16648);
    a2 = *(void *)(a1 + 112);
  }

  uint64_t v10 = 0LL;
  uint64_t v11 = *(void *)(a1 + 136);
  uint64_t v12 = *(int *)(a1 + 16696);
  uint64_t v13 = (_DWORD *)(*(void *)(a1 + 224) + 16LL);
  unint64_t v14 = a3;
  do
  {
    unint64_t v15 = v14;
    *((_BYTE *)v13 + v10) = v14;
    v14 >>= 8;
    ++v10;
  }

  while (v10 != 4);
  unint64_t v16 = v11 + v12;
  if (v15 >= 0x100) {
    *uint64_t v13 = -1;
  }
  uint64_t v17 = 0LL;
  unsigned int v18 = (_DWORD *)(*(void *)(a1 + 224) + 20LL);
  unint64_t v19 = v11 + v12;
  do
  {
    unint64_t v20 = v19;
    *((_BYTE *)v18 + v17) = v19;
    v19 >>= 8;
    ++v17;
  }

  while (v17 != 4);
  if (v20 >= 0x100) {
    *unsigned int v18 = -1;
  }
  if (*(_DWORD *)(a1 + 184) == 1) {
    *(_WORD *)(*(void *)(a1 + 224) + 36LL) = 1;
  }
  uint64_t v21 = 0LL;
  unint64_t v22 = (_DWORD *)(*(void *)(a1 + 224) + 24LL);
  unint64_t v23 = a2;
  do
  {
    unint64_t v24 = v23;
    *((_BYTE *)v22 + v21) = v23;
    v23 >>= 8;
    ++v21;
  }

  while (v21 != 4);
  if (v24 >= 0x100) {
    *unint64_t v22 = -1;
  }
  if ((_DWORD)v8)
  {
    free(*(void **)(a1 + 224));
  }

  else
  {
    uint64_t v8 = add_data_in_datablock((void *)(a1 + 72), *(char **)(a1 + 224), *(void *)(a1 + 232));
    free(*(void **)(a1 + 224));
    if (!(_DWORD)v8)
    {
      uint64_t v25 = (*(uint64_t (**)(void, void))(a1 + 24))(*(void *)(a1 + 56), *(void *)(a1 + 64));
      if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 32))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 216) + 14LL,  0LL))
      {
        goto LABEL_58;
      }

      uint64_t v26 = 0LL;
      uint64_t v27 = *(void *)(a1 + 64);
      do
      {
        unint64_t v28 = a3;
        *((_BYTE *)&v37 + v26) = a3;
        a3 >>= 8;
        ++v26;
      }

      while (v26 != 4);
      if (v28 >= 0x100) {
        int v37 = -1;
      }
      uint64_t v29 = 0LL;
      uint64_t v30 = *(void *)(a1 + 64);
      do
      {
        unint64_t v31 = v16;
        *((_BYTE *)&v38 + v29) = v16;
        v16 >>= 8;
        ++v29;
      }

      while (v29 != 4);
      if (v31 >= 0x100) {
        int v38 = -1;
      }
      if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v30, &v38, 4LL) == 4)
      {
        uint64_t v32 = 0LL;
        uint64_t v33 = *(void *)(a1 + 64);
        do
        {
          unint64_t v34 = a2;
          *((_BYTE *)&v39 + v32) = a2;
          a2 >>= 8;
          ++v32;
        }

        while (v32 != 4);
        if (v34 >= 0x100) {
          int v39 = -1;
        }
        if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  v33,  &v39,  4LL) == 4) {
          unsigned int v35 = 0;
        }
        else {
          unsigned int v35 = -1;
        }
      }

      else
      {
LABEL_58:
        unsigned int v35 = -1;
      }

      if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 32))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v25,  0LL))
      {
        uint64_t v8 = 0xFFFFFFFFLL;
      }

      else
      {
        uint64_t v8 = v35;
      }
    }
  }

  ++*(void *)(a1 + 16720);
  *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = 0;
  return v8;
}

uint64_t zipClose(uint64_t a1, const char *a2)
{
  if (!a1) {
    return 4294967194LL;
  }
  unsigned int v2 = a2;
  if (*(_DWORD *)(a1 + 88) != 1)
  {
    unsigned int v4 = 0;
    if (!a2) {
      goto LABEL_7;
    }
LABEL_8:
    unsigned int v6 = strlen(v2);
    goto LABEL_9;
  }

  unsigned int v4 = zipCloseFileInZipRaw(a1, 0LL, 0LL);
  if (v2) {
    goto LABEL_8;
  }
LABEL_7:
  unsigned int v2 = *(const char **)(a1 + 16728);
  if (v2) {
    goto LABEL_8;
  }
  unsigned int v6 = 0;
LABEL_9:
  uint64_t v7 = (*(uint64_t (**)(void, void))(a1 + 24))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  if (!v4)
  {
    unsigned int v9 = *(void **)(a1 + 72);
    if (v9)
    {
      unint64_t v8 = 0LL;
      unsigned int v4 = 0;
      do
      {
        uint64_t v10 = v9[2];
        if (v4)
        {
          unsigned int v4 = -1;
        }

        else if (v10)
        {
          uint64_t v11 = (*(uint64_t (**)(void, void, void *))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v9 + 4);
          uint64_t v10 = v9[2];
          if (v11 == v10) {
            unsigned int v4 = 0;
          }
          else {
            unsigned int v4 = -1;
          }
        }

        else
        {
          unsigned int v4 = 0;
        }

        v8 += v10;
        unsigned int v9 = (void *)*v9;
      }

      while (v9);
      goto LABEL_21;
    }

    unsigned int v4 = 0;
  }

  unint64_t v8 = 0LL;
LABEL_21:
  uint64_t v12 = *(void **)(a1 + 72);
  if (v12)
  {
    do
    {
      uint64_t v13 = (void *)*v12;
      free(v12);
      uint64_t v12 = v13;
    }

    while (v13);
  }

  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  if (!v4)
  {
    int v31 = 101010256;
    if ((*(uint64_t (**)(void, void, int *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  &v31,  4LL) != 4) {
      goto LABEL_53;
    }
    LOWORD(v31) = 0;
    if ((*(uint64_t (**)(void, void, int *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  &v31,  2LL) != 2) {
      goto LABEL_53;
    }
    LOWORD(v31) = 0;
    if ((*(uint64_t (**)(void, void, int *, uint64_t))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  &v31,  2LL) != 2) {
      goto LABEL_53;
    }
    uint64_t v14 = *(void *)(a1 + 64);
    unint64_t v15 = *(void *)(a1 + 16720);
    LOWORD(v31) = v15;
    if (v15 >= 0x10000) {
      LOWORD(v31) = -1;
    }
    uint64_t v16 = *(void *)(a1 + 64);
    unint64_t v17 = *(void *)(a1 + 16720);
    LOWORD(v31) = v17;
    if (v17 >= 0x10000) {
      LOWORD(v31) = -1;
    }
    uint64_t v18 = 0LL;
    uint64_t v19 = *(void *)(a1 + 64);
    do
    {
      unint64_t v20 = v8;
      *((_BYTE *)&v31 + v1_Block_object_dispose(va, 8) = v8;
      v8 >>= 8;
      ++v18;
    }

    while (v18 != 4);
    if (v20 >= 0x100) {
      int v31 = -1;
    }
    uint64_t v21 = 0LL;
    uint64_t v22 = *(void *)(a1 + 64);
    unint64_t v23 = v7 - *(void *)(a1 + 16712);
    do
    {
      unint64_t v24 = v23;
      *((_BYTE *)&v31 + v21) = v23;
      v23 >>= 8;
      ++v21;
    }

    while (v21 != 4);
    if (v24 >= 0x100) {
      int v31 = -1;
    }
    if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v22, &v31, 4LL) == 4)
    {
      uint64_t v25 = *(void *)(a1 + 64);
      LOWORD(v31) = v6;
      if (v6 >= 0x10000) {
        LOWORD(v31) = -1;
      }
      uint64_t v26 = (*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v25, &v31, 2LL);
      if (v26 == 2) {
        unsigned int v4 = 0;
      }
      else {
        unsigned int v4 = -1;
      }
      if (v26 == 2 && v6)
      {
        if ((*(uint64_t (**)(void, void, const char *, void))(a1 + 16))( *(void *)(a1 + 56),  *(void *)(a1 + 64),  v2,  v6) == v6) {
          unsigned int v4 = 0;
        }
        else {
          unsigned int v4 = -1;
        }
      }
    }

    else
    {
LABEL_53:
      unsigned int v4 = -1;
    }
  }

  int v27 = (*(uint64_t (**)(void, void))(a1 + 40))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  if (v4) {
    unsigned int v28 = v4;
  }
  else {
    unsigned int v28 = -1;
  }
  if (v27) {
    uint64_t v5 = v28;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v29 = *(void **)(a1 + 16728);
  if (v29) {
    free(v29);
  }
  free((void *)a1);
  return v5;
}

_BYTE *init_keys(_BYTE *result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = 878082192LL;
  *(_OWORD *)a2 = xmmword_A0E0;
  *(void *)(a2 + 16) = 878082192LL;
  int v4 = *result;
  if (*result)
  {
    uint64_t v5 = result + 1;
    unint64_t v6 = 305419896LL;
    uint64_t v7 = 591751049LL;
    do
    {
      unint64_t v6 = *(void *)(a3 + 8LL * (v4 ^ v6)) ^ (v6 >> 8);
      uint64_t v7 = 134775813 * (v7 + v6) + 1;
      *(void *)a2 = v6;
      *(void *)(a2 + _Block_object_dispose(va, 8) = v7;
      unint64_t v3 = *(void *)(a3 + 8LL * (v3 ^ BYTE3(v7))) ^ (v3 >> 8);
      *(void *)(a2 + 16) = v3;
      int v8 = *v5++;
      int v4 = v8;
    }

    while (v8);
  }

  return result;
}

FILE *fopen_file_func(int a1, char *__filename, char a3)
{
  int v3 = a3 & 3;
  int v4 = "r+b";
  uint64_t v5 = "wb";
  if ((a3 & 8) == 0) {
    uint64_t v5 = 0LL;
  }
  if ((a3 & 4) != 0) {
    LOBYTE(v6) = 1;
  }
  else {
    int v6 = (a3 & 8) >> 3;
  }
  if ((a3 & 4) == 0) {
    int v4 = v5;
  }
  if (v3 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = v6;
  }
  if (v3 == 1) {
    int v8 = "rb";
  }
  else {
    int v8 = v4;
  }
  if (__filename && (v7 & 1) != 0) {
    return fopen(__filename, v8);
  }
  else {
    return 0LL;
  }
}

size_t fread_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fread(__ptr, 1uLL, __nitems, __stream);
}

size_t fwrite_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fwrite(__ptr, 1uLL, __nitems, __stream);
}

uint64_t ftell_file_func(int a1, FILE *a2)
{
  return ftell(a2);
}

uint64_t fseek_file_func(int a1, FILE *a2, uint64_t a3, unsigned int a4)
{
  if (a4 > 2) {
    return -1LL;
  }
  if (fseek(a2, a3, a4)) {
    return -1LL;
  }
  return 0LL;
}

uint64_t fclose_file_func(int a1, FILE *a2)
{
  return fclose(a2);
}

uint64_t ferror_file_func(int a1, FILE *a2)
{
  return ferror(a2);
}

FILE *(**fill_fopen_filefunc( FILE *(**result)(int a1, char *__filename, char a3)))(int a1, char *__filename, char a3)
{
  *uint64_t result = fopen_file_func;
  result[1] = (FILE *(*)(int, char *, char))fread_file_func;
  result[2] = (FILE *(*)(int, char *, char))fwrite_file_func;
  result[3] = (FILE *(*)(int, char *, char))ftell_file_func;
  result[4] = (FILE *(*)(int, char *, char))fseek_file_func;
  result[5] = (FILE *(*)(int, char *, char))fclose_file_func;
  result[6] = (FILE *(*)(int, char *, char))ferror_file_func;
  result[7] = 0LL;
  return result;
}

void sub_7BEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_805C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id objc_msgSend_initWithManagedObjectContext_episodePropertiesToReport_showPropertiesToReport_allEpisodes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithManagedObjectContext:episodePropertiesToReport:showPropertiesToReport:allEpisodes:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}