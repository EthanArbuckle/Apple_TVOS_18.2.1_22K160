uint64_t start(int a1, char **a2)
{
  char v4;
  char v5;
  int v6;
  mach_error_t v7;
  FILE *v8;
  FILE *v9;
  void *v10;
  mach_error_t Diag;
  unint64_t v12;
  void *v13;
  mach_error_t v15;
  FILE *v16;
  FILE *v17;
  FILE *v18;
  uint64_t v19;
  int v20;
  tm v21;
  time_t v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  v4 = 0;
  v20 = 0;
  v19 = 0LL;
  do
  {
    v5 = v4;
    v6 = getopt_long(a1, a2, "fh", (const option *)&off_100008000, &v20);
    v4 = 1;
  }

  while (v6 == 102);
  if (v6 != -1)
  {
    sub_100003C04(*a2);
    goto LABEL_21;
  }

  v7 = IOSurfaceAcceleratorCreate(kCFAllocatorDefault, 0LL, &v19);
  if (v7)
  {
    v15 = v7;
    puts("Could not create IOSA client");
    v16 = __stderrp;
    mach_error_string(v15);
    fprintf(v16, "%s %s (%#x)\n");
    goto LABEL_21;
  }

  if (v19)
  {
    v22[0] = 0LL;
    time(v22);
    localtime_r(v22, &v21);
    v26 = 0LL;
    v24 = 0u;
    v25 = 0u;
    *(_OWORD *)v22 = 0u;
    v23 = 0u;
    strftime((char *)v22, 0x48uLL, "/tmp/com.apple.AppleM2ScalerCSC.IOSADiagnose_%F_%H-%M-%S.txt", &v21);
    v8 = 0LL;
    if ((v5 & 1) != 0)
    {
      printf("report written to %s\n", (const char *)v22);
      v8 = fopen((const char *)v22, "w+");
    }

    if (v8) {
      v9 = v8;
    }
    else {
      v9 = __stdoutp;
    }
    strftime((char *)v22, 0x48uLL, "Report date: %F %H:%M:%S", &v21);
    fprintf(v9, "%s\n", (const char *)v22);
    v10 = calloc(0x8B820uLL, 1uLL);
    *v10 = 0xFF6944506BLL;
    v10[3] = 255LL;
    Diag = IOSurfaceAcceleratorGetDiag(v19, v10);
    if (!Diag)
    {
      v18 = v8;
      fwrite("IOSADIAGNOSESTREAM = { \n", 0x18uLL, 1uLL, v9);
      fprintf( v9,  "    { 0x%x, %ld, %d, %d, },\n",  *((_DWORD *)v10 + 1),  v10[3],  *((unsigned __int16 *)v10 + 10),  *((unsigned __int16 *)v10 + 11));
      fwrite("    { \n", 7uLL, 1uLL, v9);
      if (*((unsigned __int16 *)v10 + 11) + *((unsigned __int16 *)v10 + 10))
      {
        v12 = 0LL;
        v13 = (void *)((char *)v10 + 76);
        do
        {
          fwrite("        { ", 0xAuLL, 1uLL, v9);
          fprintf(v9, "0x%x, ", *((unsigned __int8 *)v13 - 44));
          fprintf(v9, "%d, ", *((unsigned __int8 *)v13 - 43));
          fprintf(v9, "0x%012llx, ", *(v13 - 5));
          fprintf(v9, "0x%04x, ", *((_DWORD *)v13 - 6));
          fprintf(v9, "%04d, ", *((unsigned __int16 *)v13 - 21));
          fprintf(v9, "%llu, ", *(v13 - 4));
          fprintf(v9, "0x%08llx, ", *(void *)((char *)v13 - 20));
          fprintf(v9, "0x%016llx, ", *(void *)((char *)v13 - 12));
          fprintf(v9, "0x%x, ", *((_DWORD *)v13 - 1));
          fprintf(v9, "0x%llx, ", *v13);
          fprintf(v9, "0x%llx, ", v13[1]);
          fprintf(v9, "0x%016llx, ", v13[2]);
          fprintf(v9, "0x%016llx, ", v13[3]);
          fprintf(v9, "0x%016llx, ", v13[4]);
          fprintf(v9, "0x%016llx, ", v13[5]);
          fprintf(v9, "0x%016llx, ", v13[6]);
          fprintf(v9, "0x%016llx, ", v13[7]);
          fprintf(v9, "0x%016llx, ", v13[8]);
          fprintf(v9, "%lld, ", v13[9]);
          fwrite("},\n", 3uLL, 1uLL, v9);
          ++v12;
          v13 = (void *)((char *)v13 + 124);
        }

        while (v12 < *((unsigned __int16 *)v10 + 11) + (unint64_t)*((unsigned __int16 *)v10 + 10));
      }

      fwrite("    }\n", 6uLL, 1uLL, v9);
      fwrite("};\n", 3uLL, 1uLL, v9);
      Diag = 0;
      v8 = v18;
    }

    free(v10);
    fflush(v9);
    if (v8) {
      fclose(v8);
    }
    if (Diag)
    {
      v17 = __stderrp;
      mach_error_string(Diag);
      fprintf(v17, "%s %s (%#x)\n");
LABEL_21:
      exit(1);
    }
  }

  return 0LL;
}

uint64_t sub_100003C04(const char *a1)
{
  return fflush(__stdoutp);
}