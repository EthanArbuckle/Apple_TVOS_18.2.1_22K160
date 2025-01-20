uint64_t findPIDForProcName(const char *a1, int *a2)
{
  uint64_t v2;
  void *v5;
  int v6;
  void *v7;
  int v8;
  BOOL v9;
  int v10;
  char v11;
  unint64_t v12;
  FILE **v13;
  int *v14;
  int v15;
  int v16;
  char buffer[33];
  uint64_t v19;
  v19 = *MEMORY[0x1895F89C0];
  v2 = 22LL;
  if (a1 && a2)
  {
    v5 = 0LL;
    v6 = 2048;
    do
    {
      v7 = reallocf(v5, v6);
      if (!v7) {
        return 3LL;
      }
      v5 = v7;
      v8 = proc_listpids(1u, 0, v7, v6);
      v9 = v8 < v6;
      v6 = 2 * v8;
    }

    while (!v9);
    if (v8 >= 4)
    {
      v11 = 0;
      else {
        v12 = (unint64_t)v8 >> 2;
      }
      v10 = -1;
      v13 = (FILE **)MEMORY[0x1895F89D0];
      v14 = (int *)v5;
      do
      {
        v16 = *v14++;
        v15 = v16;
        if (proc_name(v16, buffer, 0x21u) >= 1 && !strcmp(buffer, a1))
        {
          if (v10 != -1)
          {
            if ((v11 & 1) == 0)
            {
              warnx("%s: multiple matching processes:", a1);
              fprintf(*v13, "%9d %s\n", v10, a1);
            }

            fprintf(*v13, "%9d %s\n", v15, buffer);
            v11 = 1;
          }

          v10 = v15;
        }

        --v12;
      }

      while (v12);
      if ((v11 & 1) != 0)
      {
        v2 = 84LL;
LABEL_28:
        free(v5);
        return v2;
      }

      if (v10 == -1) {
        v2 = 3LL;
      }
      else {
        v2 = 0LL;
      }
    }

    else
    {
      v2 = 3LL;
      v10 = -1;
    }

    *a2 = v10;
    goto LABEL_28;
  }

  return v2;
}

uint64_t is_monotonic_active()
{
  if (is_monotonic_active_got_monotonic != -1) {
    dispatch_once(&is_monotonic_active_got_monotonic, &__block_literal_global);
  }
  return is_monotonic_active_monotonic_on;
}

uint64_t __is_monotonic_active_block_invoke()
{
  v2[37] = *(rusage_info_t *)MEMORY[0x1895F89C0];
  pid_t v0 = getpid();
  uint64_t result = proc_pid_rusage(v0, 4, v2);
  if (!(_DWORD)result)
  {
    if (v2[31]) {
      is_monotonic_active_monotonic_on = 1;
    }
  }

  return result;
}

uint64_t writeCFObjToFile(CFPropertyListRef propertyList, const char *a2, CFPropertyListFormat a3)
{
  uint64_t v3 = 22LL;
  if (propertyList && a2)
  {
    Data = CFPropertyListCreateData(0LL, propertyList, a3, 0LL, 0LL);
    if (Data)
    {
      v6 = Data;
      BytePtr = CFDataGetBytePtr(Data);
      if (!BytePtr)
      {
        uint64_t v3 = 14LL;
        goto LABEL_10;
      }

      v8 = BytePtr;
      if (!strcmp(a2, "-"))
      {
        int v9 = 1;
      }

      else
      {
        int v9 = open(a2, 1537, 420LL);
        if (v9 == -1)
        {
          uint64_t v3 = *__error();
LABEL_10:
          CFRelease(v6);
          return v3;
        }
      }

      size_t Length = CFDataGetLength(v6);
      if (write(v9, v8, Length) == Length) {
        uint64_t v3 = 0LL;
      }
      else {
        uint64_t v3 = *__error();
      }
      CFRelease(v6);
      if (v9 != 1) {
        close(v9);
      }
    }

    else
    {
      return 12LL;
    }
  }

  return v3;
}

uint64_t createCFObjFromFile(const char *a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  if (!strcmp(a1, "-"))
  {
    int v6 = 0;
  }

  else
  {
    int v6 = open(a1, 0);
    if (v6 == -1) {
      return *__error();
    }
  }

  v8 = malloc(0x10000uLL);
  if (v8)
  {
    CFMutableDataRef Mutable = CFDataCreateMutable(0LL, 0LL);
    if (Mutable)
    {
      v10 = Mutable;
      ssize_t v11 = read(v6, v8, 0x10000uLL);
      if (v11 >= 1)
      {
        do
        {
          CFDataAppendBytes(v10, (const UInt8 *)v8, v11);
          ssize_t v11 = read(v6, v8, 0x10000uLL);
        }

        while (v11 > 0);
      }

      if (v11 != -1)
      {
        if (CFDataGetLength(v10))
        {
          CFPropertyListRef v12 = CFPropertyListCreateWithData(0LL, v10, 1uLL, 0LL, 0LL);
          if (v12)
          {
            v13 = v12;
            if (CFGetTypeID(v12) == a2)
            {
              uint64_t v7 = 0LL;
              *a3 = v13;
LABEL_23:
              CFRelease(v10);
              goto LABEL_24;
            }

            if (!*a3) {
              CFRelease(v13);
            }
          }
        }

        uint64_t v7 = 79LL;
        goto LABEL_23;
      }

      uint64_t v7 = *__error();
      goto LABEL_23;
    }
  }

  warn("allocation failure");
  if (*__error())
  {
    uint64_t v7 = *__error();
    if (v8) {
LABEL_24:
    }
      free(v8);
  }

  else
  {
    uint64_t v7 = 12LL;
    if (v8) {
      goto LABEL_24;
    }
  }

  return v7;
}

CFStringRef copyHardwareModel(int *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)int v6 = 0x200000006LL;
  size_t v5 = 64LL;
  int v2 = sysctl(v6, 2u, cStr, &v5, 0LL, 0LL);
  if (v2)
  {
    int v3 = v2;
    CFStringRef result = 0LL;
    if (!a1) {
      return result;
    }
    goto LABEL_8;
  }

  cStr[63] = 0;
  CFStringRef result = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (result) {
    int v3 = 0;
  }
  else {
    int v3 = 12;
  }
  if (a1)
  {
LABEL_8:
    if (v3) {
      *a1 = v3;
    }
  }

  return result;
}

double abstime_to_msec_diff(uint64_t a1, uint64_t a2)
{
  if (abstime_to_ns_have_factor != -1) {
    dispatch_once(&abstime_to_ns_have_factor, &__block_literal_global_6);
  }
  return *(double *)&abstime_to_ns_to_ns_factor * (double)a2 / 1000000.0
       - *(double *)&abstime_to_ns_to_ns_factor * (double)a1 / 1000000.0;
}

double abstime_to_msec(uint64_t a1)
{
  if (abstime_to_ns_have_factor != -1) {
    dispatch_once(&abstime_to_ns_have_factor, &__block_literal_global_6);
  }
  return *(double *)&abstime_to_ns_to_ns_factor * (double)a1 / 1000000.0;
}

double abstime_to_ns(uint64_t a1)
{
  if (abstime_to_ns_have_factor != -1) {
    dispatch_once(&abstime_to_ns_have_factor, &__block_literal_global_6);
  }
  return *(double *)&abstime_to_ns_to_ns_factor * (double)a1;
}

double __abstime_to_ns_block_invoke()
{
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1;
    abstime_to_ns_to_ns_factor = *(void *)&result;
  }

  return result;
}

uint64_t walkargstr(char *a1, int a2, uint64_t a3)
{
  __stringp = a1;
  if (!a1) {
    return 107LL;
  }
  if (a2) {
    v4 = a1;
  }
  else {
    v4 = 0LL;
  }
  while (1)
  {
    size_t v5 = strsep(&__stringp, " \t");
    if (v5)
    {
      if (*v5)
      {
        uint64_t v6 = (*(uint64_t (**)(uint64_t, char *))(a3 + 16))(a3, v5);
        if ((_DWORD)v6) {
          break;
        }
      }
    }

    if (!__stringp)
    {
      uint64_t v7 = 0LL;
      if (!v4) {
        return v7;
      }
      goto LABEL_13;
    }
  }

  uint64_t v7 = v6;
  if (!v4) {
    return v7;
  }
LABEL_13:
  free(v4);
  return v7;
}

uint64_t pc_errnum_to_excode(int a1)
{
  if (a1 > 21)
  {
    if (a1 > 83)
    {
      if (a1 != 84)
      {
        if (a1 == 93) {
          return 78LL;
        }
        if (a1 == 148) {
          return 42LL;
        }
        return 71LL;
      }
    }

    else if (a1 != 22)
    {
      if (a1 != 34)
      {
        if (a1 == 79) {
          return 65LL;
        }
        return 71LL;
      }

      return 70LL;
    }

    return 64LL;
  }

  uint64_t result = 77LL;
  if (a1 <= 1)
  {
    if (!a1) {
      return 0LL;
    }
    if (a1 != 1) {
      return 71LL;
    }
  }

  else
  {
    if (a1 == 2) {
      return 66LL;
    }
    if (a1 != 13)
    {
      if (a1 != 14) {
        return 71LL;
      }
      return 70LL;
    }
  }

  return result;
}

uint64_t measure_proc_snapshot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
LABEL_47:
    uint64_t v8 = 22LL;
    goto LABEL_48;
  }

  *(_DWORD *)a4 = a2;
  int v7 = a2;
  if (a3)
  {
    __strlcpy_chk();
    int v7 = *(_DWORD *)a4;
  }

  if (proc_pid_rusage(v7, 4, buffer))
  {
LABEL_5:
    uint64_t v8 = *__error();
    if ((_DWORD)v8) {
      goto LABEL_48;
    }
    return v8;
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  while (1)
  {
    uint64_t v11 = *(void *)(a4 + 48);
    uint64_t v12 = *(void *)(v11 + v9);
    if (v12 <= 0x6C6966657065616ALL) {
      break;
    }
    if (v12 > 0x72636E747065616ALL)
    {
      if (v12 == 0x72636E747065616BLL)
      {
        uint64_t v18 = v30;
        if (!v30) {
          uint64_t v18 = v25;
        }
        double v16 = (double)(v18 / 1024);
        goto LABEL_36;
      }

      if (v12 == 0x73746F7264697274LL)
      {
        unint64_t v17 = v27;
        goto LABEL_30;
      }

      goto LABEL_40;
    }

    if (v12 == 0x6C6966657065616BLL)
    {
      unint64_t v17 = v28;
      goto LABEL_30;
    }

    if (v12 != 0x7065616B646C7461LL) {
      goto LABEL_40;
    }
    if (*(void *)(a1 + 192))
    {
      uint64_t v14 = v11 + v9;
      *(void *)(v11 + v9) = 0x72636E747065616BLL;
      uint64_t v15 = v30;
      if (!v30) {
        uint64_t v15 = v25;
      }
      double v16 = (double)(v15 / 1024);
      goto LABEL_37;
    }

    *(void *)(v11 + v9) = 0LL;
LABEL_38:
    ++v10;
    v9 += 96LL;
  }

  if (v12 > 0x63707574696D64FFLL)
  {
    if (v12 == 0x63707574696D6500LL)
    {
      double v16 = abstime_to_ns((uint64_t)buffer[3] + (unint64_t)buffer[2]);
      goto LABEL_36;
    }

    if (v12 == 0x6375726D656D0000LL)
    {
      if (v26) {
        *(_BYTE *)(a4 + 37) = 1;
      }
      unint64_t v17 = v25;
LABEL_30:
      unint64_t v13 = v17 >> 10;
LABEL_31:
      double v16 = (double)v13;
LABEL_36:
      uint64_t v14 = v11 + v9;
LABEL_37:
      *(double *)(v14 + 88) = v16;
      goto LABEL_38;
    }
  }

  else
  {
    if (!v12) {
      goto LABEL_38;
    }
    if (v12 == 0x637075696E737472LL)
    {
      unint64_t v13 = v29 / 0x3E8;
      goto LABEL_31;
    }
  }

LABEL_40:
  custom_metric_id = session_find_custom_metric_id(a1, *(void *)(v11 + v9));
  if (!custom_metric_id) {
    goto LABEL_47;
  }
  v20 = custom_metric_id;
  uint64_t v21 = custom_metric_id[5];
  if (!v21) {
    goto LABEL_47;
  }
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 16))( v21,  a1,  v12,  a2,  v11 + v9 + 88);
  if (!(_DWORD)v22) {
    goto LABEL_38;
  }
  uint64_t v8 = v22;
  if (v20[2])
  {
    warnc(v22, "error measuring metric %s for PID %d");
    return v8;
  }

  unint64_t v29 = updated;

  return v29;
}

LABEL_48:
  warnc(v8, "PID %d");
  return v8;
}

uint64_t print_metric_value( uint64_t a1, uint64_t a2, const char **a3, double a4, uint64_t a5, double *a6, _BYTE *a7)
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  strcpy(v76, "..");
  *(void *)v77 = 0LL;
  uint64_t v78 = 0LL;
  int v80 = 0;
  uint64_t v79 = 0LL;
  if (a6)
  {
    double v12 = *a6;
    BOOL v13 = (*(_DWORD *)(a1 + 184) & 1) == 0 || *(void *)(a1 + 168) != 0LL;
    double v15 = a4 - v12;
    int v62 = v13;
    unsigned int v14 = !v13 | ((*(_DWORD *)(a1 + 184) & 4u) >> 2);
    int v58 = v14 ^ 1;
  }

  else
  {
    unsigned int v14 = 0;
    int v58 = 0;
    int v62 = 1;
    double v12 = 0.0;
    double v15 = 0.0;
  }

  __strlcpy_chk();
  for (i = strchr(__s, 32); i; i = strchr(__s, 32))
    char *i = 95;
  v59 = a3;
  unsigned int v60 = v14;
  __strlcpy_chk();
  for (j = strchr(__s, 32); j; j = strchr(__s, 32))
    char *j = 95;
  int v18 = isatty(2);
  uint64_t v19 = 0LL;
  int v20 = 0;
  char v21 = 0;
  char v22 = 0;
  char v23 = 0;
  v24 = "";
  if (v18) {
    unint64_t v25 = "\x1B[01m\x1B[31m";
  }
  else {
    unint64_t v25 = "";
  }
  double v26 = 0.0;
  do
  {
    uint64_t v27 = *(void *)(a2 + v19 + 40);
    double v28 = *(double *)(a2 + v19 + 48);
    if (v27 == 3 && v28 == 0.0)
    {
      int v20 = 1;
LABEL_23:
      BOOL v32 = v28 <= a4;
      BOOL v30 = v28 < a4;
LABEL_24:
      BOOL v31 = !v32;
      goto LABEL_27;
    }

    uint64_t v29 = v27 & 0x18000;
    if ((v27 & 0x18000) == 0) {
      goto LABEL_23;
    }
    if (v29 == 0x8000)
    {
      if (a6)
      {
        BOOL v30 = v28 + *a6 < a4;
        BOOL v32 = *a6 - v28 <= a4;
        goto LABEL_24;
      }

LABEL_45:
      BOOL v30 = 0;
      BOOL v31 = 0;
LABEL_27:
      if ((v27 & 3) != 0)
      {
        BOOL v33 = (*(void *)(a2 + v19 + 40) & 0xCLL) != 0;
        if (*(_BYTE *)(a2 + 24))
        {
          if (v31) {
            char v22 = 1;
          }
          int v35 = v33 && v30;
          BOOL v34 = v35 == 0;
          int v36 = v35 | v31;
        }

        else
        {
          if (v30) {
            char v22 = 1;
          }
          int v37 = v33 && v31;
          BOOL v34 = v37 == 0;
          int v36 = v37 | v30;
        }

        if (!v34) {
          char v23 = 1;
        }
        if (v36) {
          char v21 = 1;
        }
      }

      goto LABEL_39;
    }

    if (v29 == 98304)
    {
      if (!a6) {
        goto LABEL_45;
      }
      BOOL v30 = (v28 / 100.0 + 1.0) * *a6 < a4;
      BOOL v31 = (1.0 - v28 / 100.0) * *a6 > a4;
      double v26 = *(double *)(a2 + v19 + 48);
      goto LABEL_27;
    }

    if (v27)
    {
      int v57 = v18;
      v38 = v24;
      warnx("ignoring threshold type %llx", *(void *)(a2 + v19 + 40));
      int v18 = v57;
      v24 = v38;
    }

LABEL_39:
    v19 += 16LL;
  }

  while (v19 != 48);
  if (v18) {
    v39 = "\x1B[0m";
  }
  else {
    v39 = v24;
  }
  v40 = "\x1B[01m\x1B[32m";
  if (!v18) {
    v40 = v24;
  }
  if (!v23) {
    v40 = v39;
  }
  if (v22) {
    v41 = v25;
  }
  else {
    v41 = v40;
  }
  v42 = *(FILE **)(a1 + 168);
  if (v21) {
    BOOL v43 = v42 == 0LL;
  }
  else {
    BOOL v43 = 1;
  }
  if (!v43 || ((v60 ^ 1 | v62) & 1) == 0)
  {
    snprintf((char *)&__str, 5uLL, "(%s)", v76);
    snprintf(v77, 0x1CuLL, "%20s %-4s", __s, (const char *)&__str);
    v42 = *(FILE **)(a1 + 168);
  }

  if (v42 && v21)
  {
    v44 = v59[4];
    if (v44)
    {
      if (strcmp(v59[1], v44))
      {
        fputc(10, v42);
        goto LABEL_69;
      }
    }

    else
    {
      fprintf(v42, "* Regression from build %s\n\n", "<baseline build>");
LABEL_69:
      int v45 = fprintf(*(FILE **)(a1 + 168), "%s\n", v59[1]);
      if (v45 >= 80) {
        int v46 = 80;
      }
      else {
        int v46 = v45;
      }
      if (v46 >= 2)
      {
        unsigned int v47 = v46 + 1;
        do
        {
          fputc(45, *(FILE **)(a1 + 168));
          --v47;
        }

        while (v47 > 2);
      }

      fputc(10, *(FILE **)(a1 + 168));
      v59[4] = v59[1];
    }

    v48 = *(const char **)(a2 + 32);
    if (v48)
    {
      v49 = v59[5];
      if (!v49) {
        goto LABEL_80;
      }
      if (strcmp(v48, v49))
      {
        fputc(10, *(FILE **)(a1 + 168));
        v48 = *(const char **)(a2 + 32);
LABEL_80:
        fprintf(*(FILE **)(a1 + 168), "%s\n", v48);
        v59[5] = *(const char **)(a2 + 32);
      }
    }

    fprintf(*(FILE **)(a1 + 168), "%s %s; exceeded threshold of %g%%\n", v77, "  <-- out of spec", v26);
  }

  v50 = *(const char **)(a2 + 32);
  v51 = (FILE **)MEMORY[0x1895F89D0];
  if (v50)
  {
    v52 = v59[2];
    if (!v52) {
      goto LABEL_86;
    }
    if (strcmp(v50, v52))
    {
      fputc(10, *v51);
      v50 = *(const char **)(a2 + 32);
LABEL_86:
      fprintf(*v51, "%s\n", v50);
      v59[2] = *(const char **)(a2 + 32);
    }
  }

  if (v58)
  {
    if (a4 <= 100.0) {
      v53 = "%10.4g %-2s %-15s(%s%+.4g %s%s)";
    }
    else {
      v53 = "%10.0f %-2s %-15s(%s%+.0f %s%s)";
    }
    fprintf(*v51, v53, *(void *)&a4, v76, __s, v41, *(void *)&v15, v76, v39);
LABEL_96:
    int v54 = 1;
    if (v60) {
      goto LABEL_97;
    }
LABEL_104:
    if (v21) {
      fputs("  <-- out of spec", *v51);
    }
  }

  else
  {
    if (v62)
    {
      if (a4 <= 100.0) {
        fprintf(*v51, "%10.4g %-2s %-15s");
      }
      else {
        fprintf(*v51, "%10.0f %-2s %-15s");
      }
      goto LABEL_96;
    }

    fputs(v77, *v51);
    int v54 = 5;
    if (!v60) {
      goto LABEL_104;
    }
LABEL_97:
    v74[0] = 0LL;
    v74[1] = v74;
    v74[2] = 0x2000000000LL;
    int v75 = 0;
    if (a4 < 0.0 || v12 <= 0.0 || v12 == a4 && v26 == 0.0)
    {
      *(double *)&__int128 __str = v26;
      *((double *)&__str + 1) = v12;
      double v71 = v12;
      double v72 = v12;
      double v73 = v26;
      _printDummyGraph(v54, (double *)&__str, v20 != 0, v21 != 0, a4, v12);
    }

    else
    {
      v67[0] = MEMORY[0x1895F87A8];
      v67[1] = 0x40000000LL;
      v67[2] = __print_metric_value_block_invoke;
      v67[3] = &unk_189E3E108;
      v67[4] = v74;
      int v68 = v54;
      char v69 = v21;
      *(double *)&__int128 __str = v26;
      *((double *)&__str + 1) = v12;
      double v71 = v12;
      double v72 = v12;
      double v73 = v26;
      *(double *)&__int128 v63 = v26;
      *((double *)&v63 + 1) = v12;
      double v64 = v12;
      double v65 = v12;
      double v66 = v26;
      int v56 = pc_measurement_graph(&__str, &v63, 31LL, 12LL, (uint64_t)v67, a4, a4, a4, 0.0);
      if (v56) {
        print_metric_value_cold_1(v56);
      }
    }

    _Block_object_dispose(v74, 8);
  }

  uint64_t result = fputc(10, *v51);
  if (a7)
  {
    if (v21) {
      *a7 = 1;
    }
  }

  return result;
}

uint64_t _printDummyGraph(int a1, double *a2, int a3, int a4, double a5, double a6)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v11 = (FILE **)MEMORY[0x1895F89D0];
  fprintf((FILE *)*MEMORY[0x1895F89D0], "%*s", a1, " ");
  if (a5 != 0.0 || a6 != 0.0)
  {
    if (a5 == a6 && a3 != 0)
    {
      fprintf(*v11, " 0 : ____________________* %.0f ", a5);
      if (a4) {
        fwrite("  <-- out of spec", 0x11uLL, 1uLL, *v11);
      }
      fputc(10, *v11);
      double v12 = "     ____________________B     ";
      goto LABEL_17;
    }

    if (a5 < a6) {
      int v14 = -1;
    }
    else {
      int v14 = a5 > a6;
    }
    if (a5 >= 0.0)
    {
      if (a5 <= 0.0)
      {
        double v15 = "(bug)";
        if (a5 > a6) {
          double v15 = ": 0 ";
        }
        if (a5 < a6) {
          double v15 = " 0 :";
        }
      }

      else
      {
        double v15 = " >0 ";
      }
    }

    else
    {
      double v15 = " <0 ";
    }

    if (a6 >= 0.0)
    {
      unint64_t v17 = " >0 ";
      int v18 = "(bug)";
      if (a5 > a6) {
        int v18 = " 0 :";
      }
      if (a5 < a6) {
        int v18 = ": 0 ";
      }
      if (a6 <= 0.0) {
        unint64_t v17 = v18;
      }
    }

    else
    {
      unint64_t v17 = " <0 ";
    }

    if (v14 == 1)
    {
      fprintf(*v11, "%4s ____________________* %4s", v17, v15);
      uint64_t v19 = "     B____________________     ";
    }

    else
    {
      if (!v14)
      {
        double v22 = *a2;
        double v23 = a2[4];
        fprintf(*v11, "%4s __________*__________ %4s", "-10%", "+10%");
        uint64_t v24 = 95LL;
        uint64_t v25 = 93LL;
        if (v23 == 0.0) {
          uint64_t v25 = 95LL;
        }
        if (v22 != 0.0) {
          uint64_t v24 = 91LL;
        }
        snprintf(__str, 0x20uLL, "     %c_________B_________%c     ", v24, v25);
        if (!a4) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }

      fprintf(*v11, "%4s *____________________ %4s", v15, v17);
      uint64_t v19 = "     ____________________B     ";
    }

    __int128 v20 = *((_OWORD *)v19 + 1);
    *(_OWORD *)__int128 __str = *(_OWORD *)v19;
    __int128 v27 = v20;
    if (!a4)
    {
LABEL_38:
      fputc(10, *v11);
      return fprintf(*v11, "%*s", 61, __str);
    }

LABEL_37:
    fwrite("  <-- out of spec", 0x11uLL, 1uLL, *v11);
    goto LABEL_38;
  }

  fwrite(" 0 : *____________________ n/a ", 0x1FuLL, 1uLL, *v11);
  fputc(10, *v11);
  double v12 = "     B____________________     ";
LABEL_17:
  __int128 v16 = *((_OWORD *)v12 + 1);
  *(_OWORD *)__int128 __str = *(_OWORD *)v12;
  __int128 v27 = v16;
  return fprintf(*v11, "%*s", 61, __str);
}

uint64_t __print_metric_value_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  int v4 = *(_DWORD *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  size_t v5 = (FILE **)MEMORY[0x1895F89D0];
  uint64_t v6 = (FILE *)*MEMORY[0x1895F89D0];
  if (v4) {
    return fprintf(v6, "%*s", 61, a2);
  }
  fprintf(v6, "%*s%s", *(_DWORD *)(a1 + 40), " ", a2);
  if (*(_BYTE *)(a1 + 44)) {
    fputs("  <-- out of spec", *v5);
  }
  return fputc(10, *v5);
}

uint64_t dump_compare_metrics(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v22 = 0LL;
  unsigned int v21 = 0;
  char v20 = 0;
  uint64_t v3 = copy_meas_session(a1, a2, &v22, (_DWORD *)&v22 + 1);
  if (v3)
  {
    int v4 = v3;
    size_t v5 = *(const char **)(a1 + 176);
    if (!v5) {
      goto LABEL_9;
    }
    if (has_perfdata_v1_ext(v5))
    {
      int v6 = emit_perfdata_v1(a1, *(char **)(a1 + 176));
      HIDWORD(v22) = v6;
      if (!v6)
      {
        __strlcpy_chk();
        int v7 = strstr(__big, ".perfdata");
        if (!v7) {
          goto LABEL_9;
        }
        *(_DWORD *)(v7 + 1) = 6972528;
        int v6 = pc_session_record_pdfile(a1, __big);
        HIDWORD(v22) = v6;
        if (!v6)
        {
          warnx("Warning '%s' deprecated: also wrote perfdata v2 to %s", ".perfdata", __big);
          goto LABEL_9;
        }
      }
    }

    else
    {
      int v6 = pc_session_record_pdfile(a1, *(char **)(a1 + 176));
      HIDWORD(v22) = v6;
      if (!v6)
      {
LABEL_9:
        if (!MEMORY[0x189602C30])
        {
LABEL_10:
          HIDWORD(v22) = _print_compare_meas(a1, (uint64_t)v4, v22, 0LL, 0, 0LL);
LABEL_40:
          free(v4);
          return HIDWORD(v22);
        }

        uint64_t v8 = *(const char **)(a1 + 80);
        if (v8)
        {
          meas_epbfile = create_meas_epbfile(v8, *(const char **)(a1 + 104), (float *)&v21, (_DWORD *)&v22 + 1);
          if (!meas_epbfile)
          {
            if (HIDWORD(v22) != 93 || !*(void *)(a1 + 96)) {
              goto LABEL_40;
            }
            goto LABEL_10;
          }

          uint64_t v10 = meas_epbfile;
          if ((int)v22 >= 1 && (int)v21 >= 1)
          {
            uint64_t v11 = 0LL;
            unint64_t v12 = 0LL;
            else {
              unint64_t v13 = v22;
            }
            while (1)
            {
              uint64_t v14 = *(void *)&v4[v11];
              BOOL v15 = v14 == 0x6D656D64656C7461LL || v14 == 0x6375726D656D0000LL;
              if (v15 && v14 != *(void *)&meas_epbfile[v11]) {
                break;
              }
              ++v12;
              v11 += 96LL;
              if (v12 >= v13) {
                goto LABEL_25;
              }
            }

            int v18 = *(const char **)&v4[v11 + 8];
            uint64_t v19 = *(const char **)&meas_epbfile[v11 + 8];
            HIDWORD(v22) = 93;
            warnx("can't compare '%s' to '%s'", v18, v19);
            goto LABEL_38;
          }

LABEL_25:
          HIDWORD(v22) = _print_compare_meas(a1, (uint64_t)v4, v22, (uint64_t)meas_epbfile, v21, &v20);
          if (HIDWORD(v22))
          {
LABEL_37:
            if (!v10) {
              goto LABEL_40;
            }
LABEL_38:
            free(v10);
            goto LABEL_40;
          }
        }

        else
        {
          HIDWORD(v22) = _print_compare_meas(a1, (uint64_t)v4, v22, 0LL, 0, &v20);
          if (HIDWORD(v22)) {
            goto LABEL_40;
          }
          uint64_t v10 = 0LL;
        }

        if (v20)
        {
          HIDWORD(v22) = 148;
        }

        else
        {
          __int128 v16 = *(const char **)(a1 + 88);
        }

        goto LABEL_37;
      }
    }

    warnc(v6, "%s", *(const char **)(a1 + 176));
    goto LABEL_40;
  }

  return HIDWORD(v22);
}

      char v20 = 84;
LABEL_26:
      BOOL v31 = v20;
      goto LABEL_27;
    }
  }

  if (!v31) {
    return v31;
  }
  unint64_t v12 = 0LL;
LABEL_22:
  if (v10) {
LABEL_27:
  }
    pc_snapshot_destroy(v10);
  if (v12) {
    pc_snapshot_destroy(v12);
  }
LABEL_6:
  if (a1) {
    goto LABEL_7;
  }
  return v31;
}

uint64_t _print_compare_meas(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _BYTE *a6)
{
  char v26 = 0;
  memset(v25, 0, sizeof(v25));
  unint64_t v12 = pc_session_copy_description(a1, *(_DWORD *)(a1 + 184) & 1, 0LL);
  if (v12)
  {
    unint64_t v13 = v12;
    uint64_t v14 = (FILE **)MEMORY[0x1895F89D0];
    int v15 = fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v12);
    free(v13);
    if (v15 >= 81) {
      int v16 = 81;
    }
    else {
      int v16 = v15;
    }
    if (v16 >= 2)
    {
      unsigned int v17 = v16 + 1;
      do
      {
        fputc(45, *v14);
        --v17;
      }

      while (v17 > 2);
    }

    fputc(10, *v14);
  }

  if (a4)
  {
    LODWORD(v18) = 0;
    if (a3 >= 1 && a5 >= 1)
    {
      uint64_t v24 = a6;
      unint64_t v18 = 0LL;
      int v19 = 0;
      while (1)
      {
        uint64_t v20 = a4 + 96LL * v19;
        uint64_t v21 = *(void *)a2;
        if (*(void *)a2)
        {
          if (v21 == 0x7065616B646C7461LL)
          {
            if (*(void *)v20 != 0x7065616B646C7461LL) {
              uint64_t v20 = 0LL;
            }
          }

          else if (v21 != *(void *)v20)
          {
            warnx("can't compare '%s' to '%s'", *(const char **)(a2 + 8), *(const char **)(v20 + 8));
            return 93LL;
          }
        }

        uint64_t result = _print_meas(a1, (uint64_t)v25, a2, v20, &v26);
        if ((_DWORD)result) {
          return result;
        }
        ++v18;
        if (v20) {
          ++v19;
        }
        if (v18 < a3)
        {
          a2 += 96LL;
          if (v19 < a5) {
            continue;
          }
        }

        a6 = v24;
        break;
      }
    }

    if ((_DWORD)v18 != a3)
    {
      warnx("unable to compare all expected measurements");
      return 14LL;
    }

    goto LABEL_31;
  }

  if (a3 < 1)
  {
LABEL_31:
    uint64_t result = 0LL;
    if (a6) {
      *a6 = v26;
    }
    return result;
  }

  uint64_t v23 = a3;
  while (1)
  {
    uint64_t result = _print_meas(a1, (uint64_t)v25, a2, 0LL, 0LL);
    if ((_DWORD)result) {
      return result;
    }
    a2 += 96LL;
    if (!--v23) {
      goto LABEL_31;
    }
  }
}

int *create_epmetrics(int *result, int *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v7 = 0LL;
  v8[0] = xmmword_1862F1020;
  v8[1] = xmmword_1862F1030;
  uint64_t v9 = 0x73746F7264697274LL;
  if (result)
  {
    uint64_t v3 = result;
    for (uint64_t i = 0LL; i != 40; i += 8LL)
    {
      int v5 = add_metric(*(void *)((char *)v8 + i), &v7, v3, 0LL);
      if (v5 == 78) {
        int v5 = add_metric(0LL, &v7, v3, 0LL);
      }
      if (v5)
      {
        uint64_t result = 0LL;
        int v6 = v7;
        goto LABEL_11;
      }
    }

    int v6 = v7;
    uint64_t result = (int *)v7;
    if (v7) {
      goto LABEL_13;
    }
LABEL_11:
    if (v6)
    {
      free(v6);
      uint64_t result = 0LL;
    }
  }

  else
  {
    int v5 = 22;
  }

LABEL_13:
  if (a2)
  {
    if (v5) {
      *a2 = v5;
    }
  }

  return result;
}

uint64_t pc_print_ep_usage(const char *a1, FILE *a2)
{
  int v4 = getprogname();
  int v5 = getprogname();
  return fprintf( a2,  "%s\n -h, --help                         Print this message\n -p, --process <pid | pname>        Measure a process\n -c, --command <cmd> [<args> ...]   Run <cmd>, measuring it if no -p\n \n -b, --compare <prevGM.epb>         Compare to baseline\n -t, --test-name <name>             Use <name> within baseline\n \n -s, --sleep <secs>                 Measure over given period\n -i, --interact                     Measure until interrupt\n 'man %s' for details and more options\n ('xcrun -sdk %s man %s' if SDK is newer than main OS)\n",  a1,  v4,  "macosx10.15internal",  v5);
}

uint64_t pc_handle_ep_help_args(int a1, const char **a2, const char *a3, char *a4)
{
  if (a1 < 1) {
    return 0LL;
  }
  uint64_t v8 = a1;
  while (1)
  {
    uint64_t v9 = *a2;
    if (**a2 == 45 && v9[1] == 45) {
      ++v9;
    }
    if (!strcmp(v9, "-c") || !strcasecmp(v9, "-command"))
    {
LABEL_11:
      if (a1 != 1) {
        return 0LL;
      }
      goto LABEL_19;
    }

    if (!strcmp(v9, "-h") || !strcasecmp(v9, "-help")) {
      break;
    }
    ++a2;
    if (!--v8) {
      goto LABEL_11;
    }
  }

  if (a1 == 2)
  {
    pc_print_ep_usage(a3, (FILE *)*MEMORY[0x1895F89E0]);
    if (!a4) {
      return 1LL;
    }
    char v11 = 0;
    goto LABEL_21;
  }

  if (a1 >= 2) {
    warnx("ignoring extra argument with %s", *a2);
  }
LABEL_19:
  pc_print_ep_usage(a3, (FILE *)*MEMORY[0x1895F89D0]);
  if (!a4) {
    return 1LL;
  }
  char v11 = 64;
LABEL_21:
  *a4 = v11;
  return 1LL;
}

uint64_t pc_session_config_with_ep_args(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  uint64_t v8 = getenv("PERFCHECK_TESTING");
  BOOL v60 = v8 != 0LL;
  uint64_t v9 = a3;
  if (v8)
  {
    uint64_t v10 = calloc(a2, 8uLL);
    if (!v10) {
      return *__error();
    }
    uint64_t v9 = v10;
    if (a2 < 1) {
      goto LABEL_145;
    }
    uint64_t v11 = 0LL;
    do
    {
      unint64_t v12 = strdup((const char *)a3[v11]);
      v9[v11] = v12;
      if (!v12)
      {
        uint64_t v25 = 0LL;
        uint64_t v58 = *__error();
        goto LABEL_187;
      }

      ++v11;
    }

    while (a2 != v11);
  }

  if (a2 < 1)
  {
LABEL_145:
    LODWORD(v13) = 0;
LABEL_146:
    if (a4) {
LABEL_147:
    }
      *a4 = v13;
    goto LABEL_148;
  }

  LODWORD(v13) = 0;
  while (1)
  {
    uint64_t v14 = (const char *)v9[(int)v13];
    if (!v14) {
      goto LABEL_184;
    }
    int v15 = (const char *)v9[(int)v13];
    if (*v14 == 45)
    {
      if (v14[1] == 45) {
        int v15 = v14 + 1;
      }
      else {
        int v15 = (const char *)v9[(int)v13];
      }
    }

    int v16 = v13;
    if (!strcmp(v15, "-p") || !strcasecmp(v15, "-process"))
    {
      uint64_t v13 = (int)v13 + 1LL;
      if (v16 + 1 >= a2)
      {
        warnx("%s requires an argument");
        goto LABEL_207;
      }

      uint64_t v20 = v9[v13];
      if (*(_BYTE *)v20 == 45)
      {
        if (*(_BYTE *)(v20 + 1))
        {
          warnx("%s argument '%s' looks like another flag", v14, (const char *)v20);
          fprintf((FILE *)*MEMORY[0x1895F89D0], "          (use ./%s for a filename)\n", (const char *)v20);
          goto LABEL_207;
        }
      }

      else if (!*(_BYTE *)v20)
      {
        warnx("empty argument to %s");
        goto LABEL_207;
      }

      if (*(_DWORD *)(a1 + 12) == -1 && !*(_BYTE *)(a1 + 16))
      {
        int v21 = strtol((const char *)v9[v13], &__endptr, 10);
        if (*__endptr)
        {
          uint64_t v22 = pc_session_set_procname(a1, (char *)v20);
          if ((_DWORD)v22) {
            goto LABEL_165;
          }
        }

        else
        {
          uint64_t v22 = pc_session_set_procpid(a1, v21);
          if ((_DWORD)v22) {
            goto LABEL_165;
          }
        }

        goto LABEL_111;
      }

      warnx("%s already specified");
LABEL_207:
      uint64_t v58 = 22LL;
      goto LABEL_166;
    }

    if (!strcmp(v15, "-c") || !strcasecmp(v15, "-command"))
    {
      int v48 = a2 - (v13 + 1);
      if (a2 <= (int)v13 + 1)
      {
LABEL_179:
        warnx("%s requires an argument");
        goto LABEL_184;
      }

      v49 = &v9[(int)v13 + 1];
      v50 = (_BYTE *)*v49;
      if (*(_BYTE *)*v49 == 45)
      {
        if (v50[1])
        {
          warnx("%s argument '%s' looks like another flag", v14, v50);
          fprintf((FILE *)*MEMORY[0x1895F89D0], "          (use ./%s for a filename)\n", v50);
          goto LABEL_184;
        }
      }

      else if (!*(_BYTE *)*v49)
      {
LABEL_160:
        warnx("empty argument to %s");
        goto LABEL_184;
      }

      if (*(void *)(a1 + 56))
      {
LABEL_180:
        warnx("%s already specified");
        goto LABEL_184;
      }

      uint64_t v51 = pc_session_set_exeargs(a1, v48, (uint64_t)v49);
      if ((_DWORD)v51)
      {
        uint64_t v58 = v51;
        warnx("couldn't copy arguments");
        goto LABEL_166;
      }

      LODWORD(v13) = a2;
      if (a4) {
        goto LABEL_147;
      }
LABEL_148:
      if (*(void *)(a1 + 80) && *(void *)(a1 + 88))
      {
LABEL_175:
        warnx("--record incompatible with --compare and --project-baseline", v59);
        goto LABEL_184;
      }

      if (*(void *)(a1 + 56))
      {
LABEL_163:
        if (*(_DWORD *)(a1 + 12) != -1)
        {
          uint64_t v22 = pc_session_add_metric(a1, 0x7065616B646C7461LL);
          if ((_DWORD)v22)
          {
LABEL_165:
            uint64_t v58 = v22;
            goto LABEL_166;
          }
        }
      }

      else
      {
        if (*(_DWORD *)(a1 + 68))
        {
          if (*(_BYTE *)(a1 + 72))
          {
            warnx("pass exactly one of --sleep or --interact", v59);
            goto LABEL_184;
          }

          if (!*(_BYTE *)(a1 + 16))
          {
            warnx("--sleep requires --process", v59);
LABEL_184:
            uint64_t v25 = 0LL;
LABEL_185:
            uint64_t v58 = 22LL;
            goto LABEL_186;
          }

          goto LABEL_163;
        }

        if (*(_BYTE *)(a1 + 72))
        {
          if (!*(_BYTE *)(a1 + 16))
          {
            warnx("--interact requires --process");
            goto LABEL_184;
          }

          goto LABEL_163;
        }

        if (*(_BYTE *)(a1 + 16) && *(_DWORD *)(a1 + 12) == -1)
        {
          uint64_t v58 = 3LL;
          warnc(3, "%s");
          goto LABEL_166;
        }
      }

      uint64_t v25 = 0LL;
      uint64_t v58 = 0LL;
      goto LABEL_186;
    }

    if (!strcmp(v15, "-b") || !strcasecmp(v15, "-compare"))
    {
      uint64_t v13 = (int)v13 + 1LL;
      if (v16 + 1 >= a2) {
        goto LABEL_179;
      }
      uint64_t v23 = (char *)v9[v13];
      if (*v23 == 45)
      {
        if (v23[1]) {
          goto LABEL_210;
        }
      }

      else if (!*v23)
      {
        goto LABEL_160;
      }

      if (*(void *)(a1 + 80))
      {
        if ((*(_BYTE *)(a1 + 184) & 1) == 0) {
          warnx("%s: ignoring additional baseline");
        }
        goto LABEL_111;
      }

      uint64_t v22 = pc_session_set_baseline_file(a1, (char *)v9[v13]);
      if ((_DWORD)v22) {
        goto LABEL_165;
      }
      if (!*(void *)(a1 + 96) || (*(_BYTE *)(a1 + 184) & 1) != 0) {
        goto LABEL_111;
      }
LABEL_65:
      warnx("%s: overrides any project '%s' baselines");
      goto LABEL_111;
    }

    if (!strcmp(v15, "-T") || !strcasecmp(v15, "-threshold"))
    {
      uint64_t v24 = (int)v13 + 1LL;
      uint64_t v23 = (char *)v9[v24];
      if (*v23 == 45)
      {
        if (v23[1]) {
          goto LABEL_210;
        }
      }

      else if (!*v23)
      {
        goto LABEL_160;
      }

      uint64_t v25 = strdup((const char *)v9[v24]);
      char v26 = strchr(v25, 61);
      if (!v26) {
        goto LABEL_209;
      }
      __int128 v27 = v26;
      int v30 = v26[1];
      uint64_t v28 = v26 + 1;
      int v29 = v30;
      *__int128 v27 = 0;
      if (v30 == 43)
      {
        LOBYTE(v29) = v27[2];
        int v31 = 1;
        uint64_t v28 = v27 + 2;
      }

      else
      {
        if (!v29) {
          goto LABEL_209;
        }
        int v31 = 0;
      }

      if (((char)v29 - 48) > 9)
      {
LABEL_209:
        warnx("-%s <metric>=[+]<thresh>[%%]");
        goto LABEL_185;
      }

      uint64_t v32 = strtol(v28, &__endptr, 0);
      if (*__endptr)
      {
        if (*__endptr == 37) {
          char v33 = v31;
        }
        else {
          char v33 = 0;
        }
        if ((v33 & 1) == 0) {
          goto LABEL_209;
        }
        uint64_t v34 = 98307LL;
      }

      else if (v31)
      {
        uint64_t v34 = 32771LL;
      }

      else
      {
        uint64_t v34 = 3LL;
      }

      uint64_t metricid_name = get_metricid_name(a1, v25);
      if (!metricid_name)
      {
        warnx("unknown metric '%s'");
        goto LABEL_185;
      }

      uint64_t v36 = pc_session_set_threshold(a1, metricid_name, v34, (double)v32);
      if ((_DWORD)v36)
      {
        uint64_t v58 = v36;
        goto LABEL_186;
      }

      LODWORD(v13) = v24;
      if (v25) {
        goto LABEL_103;
      }
      goto LABEL_111;
    }

    if (!strcasecmp(v15, "-record"))
    {
      uint64_t v13 = (int)v13 + 1LL;
      if (v16 + 1 >= a2) {
        goto LABEL_179;
      }
      uint64_t v23 = (char *)v9[v13];
      int v37 = *v23;
      if (v37 == 45)
      {
        if (v23[1]) {
          goto LABEL_210;
        }
      }

      else if (!*v23)
      {
        goto LABEL_160;
      }

      if (*(void *)(a1 + 88)) {
        goto LABEL_180;
      }
      if (*(void *)(a1 + 96)) {
        goto LABEL_175;
      }
      if (v37 == 45 && !v23[1]) {
        uint64_t v23 = "/dev/stdout";
      }
      session_set_record_path(a1, v23);
      goto LABEL_111;
    }

    if (!strcmp(v15, "-t") || !strcasecmp(v15, "-test-name"))
    {
      uint64_t v24 = (int)v13 + 1LL;
      uint64_t v23 = (char *)v9[v24];
      if (*v23 == 45)
      {
        if (v23[1]) {
          goto LABEL_210;
        }
      }

      else if (!*v23)
      {
        goto LABEL_160;
      }

      if (*(void *)(a1 + 104)) {
        goto LABEL_180;
      }
      v38 = strdup((const char *)v9[v24]);
      uint64_t v25 = v38;
      if (!v38)
      {
        uint64_t v58 = *__error();
        goto LABEL_186;
      }

      v39 = strchr(v38, 44);
      if (v39 && (v40 = v39, int v42 = v39[1], v41 = v39 + 1, v42))
      {
        int v43 = strtol(v41, &__endptr, 10);
        if (v43)
        {
          if (*__endptr) {
            goto LABEL_101;
          }
          char *v40 = 0;
        }
      }

      else
      {
LABEL_101:
        int v43 = 0;
      }

      uint64_t v44 = pc_session_set_testid(a1, 0LL, v25, v43);
      if ((_DWORD)v44)
      {
        uint64_t v58 = v44;
        warnx("couldn't set test name");
        goto LABEL_186;
      }

LABEL_103:
      free(v25);
      LODWORD(v13) = v24;
      goto LABEL_111;
    }

    if (!strcasecmp(v15, "-project-baseline") || !strcmp(v15, "-P")) {
      break;
    }
    if (!strcmp(v15, "-s") || !strcasecmp(v15, "-sleep"))
    {
      uint64_t v46 = (int)v13 + 1LL;
      uint64_t v23 = (char *)v9[v46];
      if (*v23 == 45)
      {
        if (v23[1]) {
          goto LABEL_210;
        }
      }

      else if (!*v23)
      {
        goto LABEL_160;
      }

      if (*(_DWORD *)(a1 + 68)) {
        goto LABEL_180;
      }
      int v47 = strtol((const char *)v9[v46], 0LL, 10);
      *(_DWORD *)(a1 + 68) = v47;
      LODWORD(v13) = v13 + 1;
      if (!v47)
      {
        warnx("invalid sleep interval '%s'");
        goto LABEL_184;
      }
    }

    else if (!strcmp(v15, "-i") || !strcasecmp(v15, "-interact"))
    {
      if (*(_BYTE *)(a1 + 72)) {
        goto LABEL_180;
      }
      *(_BYTE *)(a1 + 72) = 1;
    }

    else
    {
      if (!strcasecmp(v15, "-perfdata"))
      {
        uint64_t v13 = (int)v13 + 1LL;
        if (v16 + 1 >= a2) {
          goto LABEL_179;
        }
        uint64_t v23 = (char *)v9[v13];
        if (*v23 == 45)
        {
          if (v23[1])
          {
LABEL_210:
            warnx("%s argument '%s' looks like another flag", v14, v23);
            fprintf((FILE *)*MEMORY[0x1895F89D0], "          (use ./%s for a filename)\n", v23);
            goto LABEL_184;
          }

          if (*(void *)(a1 + 176)) {
            goto LABEL_180;
          }
          if (!v23[1]) {
            uint64_t v23 = "/dev/stdout";
          }
        }

        else
        {
          if (!*v23) {
            goto LABEL_160;
          }
          if (*(void *)(a1 + 176)) {
            goto LABEL_180;
          }
        }

        pc_session_set_perfdata_file(a1, v23);
        goto LABEL_111;
      }

      if (strcasecmp(v15, "-failtracer")) {
        goto LABEL_146;
      }
      int v17 = *(_DWORD *)(a1 + 184);
      if ((v17 & 1) != 0) {
        goto LABEL_180;
      }
      *(_DWORD *)(a1 + 184) = v17 | 1;
      unint64_t v18 = (_BYTE *)v9[(int)v13 + 1];
      if (v18)
      {
        if (*v18 != 45)
        {
          uint64_t v19 = pc_session_set_failtracer_file(a1, (char *)v9[(int)v13 + 1]);
          LODWORD(v13) = v13 + 1;
          if ((_DWORD)v19)
          {
            uint64_t v58 = v19;
            warnc(v19, "%s");
            goto LABEL_166;
          }
        }
      }
    }

LABEL_111:
    LODWORD(v13) = v13 + 1;
  }

  uint64_t v13 = (int)v13 + 1LL;
  if (v16 + 1 >= a2) {
    goto LABEL_179;
  }
  uint64_t v23 = (char *)v9[v13];
  if (*v23 == 45)
  {
    if (v23[1]) {
      goto LABEL_210;
    }
  }

  else if (!*v23)
  {
    goto LABEL_160;
  }

  if (*(void *)(a1 + 96)) {
    goto LABEL_180;
  }
  if (*(void *)(a1 + 88)) {
    goto LABEL_175;
  }
  uint64_t v45 = pc_session_set_project_baseline(a1, (char *)v9[v13]);
  if (!(_DWORD)v45)
  {
    if (!*(void *)(a1 + 80) || (*(_BYTE *)(a1 + 184) & 1) != 0) {
      goto LABEL_111;
    }
    goto LABEL_65;
  }

  uint64_t v58 = v45;
  warnx("couldn't set project name");
LABEL_166:
  uint64_t v25 = 0LL;
LABEL_186:
  if (v60)
  {
LABEL_187:
    if (v9)
    {
      if (a2 >= 1)
      {
        uint64_t v52 = 0LL;
        do
        {
          v53 = (const char *)v9[v52];
          if (v53)
          {
            int v54 = (const char *)a3[v52];
            if (strcmp((const char *)v9[v52], v54))
            {
              warnx("pc_session_config_with_ep_args changed arg '%s' to '%s'", v54, v53);
              if ((_DWORD)v58) {
                uint64_t v58 = v58;
              }
              else {
                uint64_t v58 = 14LL;
              }
            }

            if (*v53)
            {
              v55 = (unsigned __int8 *)(v53 + 1);
              do
                *(v55 - 1) = 0;
              while (*v55++);
            }

            free((void *)v9[v52]);
          }

          ++v52;
        }

        while (v52 != a2);
      }

      free(v9);
    }
  }

  if (v25) {
    free(v25);
  }
  return v58;
}

uint64_t run_easyperf(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2 = 22LL;
  if (!a1 || !a2) {
    return v2;
  }
  *a2 = 0;
  int v5 = (const char *)(a1 + 16);
  if (!*(_BYTE *)(a1 + 16) && *(_DWORD *)(a1 + 12) == -1)
  {
    int v7 = 0;
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 0x40000000LL;
    v23[2] = __run_easyperf_block_invoke;
    v23[3] = &__block_descriptor_tmp_73;
    v23[4] = a1;
    int v6 = v23;
  }

  else
  {
    uint64_t v2 = pc_session_begin(a1);
    if ((_DWORD)v2) {
      return v2;
    }
    int v6 = 0LL;
    int v7 = 1;
  }

  uint64_t v8 = *(const char ***)(a1 + 56);
  if (v8)
  {
    uint64_t v29 = 0LL;
    int v30 = &v29;
    uint64_t v31 = 0x2000000000LL;
    int v32 = 107;
    uint64_t v25 = 0LL;
    char v26 = (pid_t *)&v25;
    uint64_t v27 = 0x2000000000LL;
    int v28 = -1;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    if (v9)
    {
      uint64_t v10 = v9;
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
      if (v11)
      {
        unint64_t v12 = v11;
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        if (global_queue)
        {
          uint64_t v14 = dispatch_source_create(MEMORY[0x1895F8B68], 0x14uLL, 0LL, global_queue);
          if (v14)
          {
            int v15 = v14;
            handler[0] = MEMORY[0x1895F87A8];
            handler[1] = 0x40000000LL;
            handler[2] = ___spawnAndAtCHLD_block_invoke;
            handler[3] = &unk_189E3E150;
            handler[4] = v6;
            handler[5] = &v29;
            handler[6] = &v25;
            handler[7] = v10;
            handler[8] = a2;
            handler[9] = v12;
            dispatch_source_set_event_handler(v14, handler);
            dispatch_activate(v15);
            int v16 = posix_spawnp(v26 + 6, *v8, 0LL, 0LL, (char *const *)v8, (char *const *)*MEMORY[0x1895FB100]);
            *((_DWORD *)v30 + 6) = v16;
            if (v16)
            {
              warnc(v16, "%s", *v8);
              *a2 = pc_errnum_to_excode(*((_DWORD *)v30 + 6));
            }

            else
            {
              dispatch_semaphore_signal(v10);
              dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
            }

            dispatch_release(v15);
          }
        }

        dispatch_release(v12);
      }

      dispatch_release(v10);
    }

    uint64_t v2 = *((unsigned int *)v30 + 6);
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v29, 8);
    if ((_DWORD)v2) {
      return v2;
    }
    if ((*(_BYTE *)(a1 + 184) & 1) != 0 && *a2)
    {
      warnx("'%s' failed with exit code %d", v5, *a2);
      warnx("-%s hides failed commands' resource consumption");
      return 0LL;
    }

LABEL_24:
    if (v7) {
      goto LABEL_25;
    }
    goto LABEL_42;
  }

  unsigned int v17 = *(_DWORD *)(a1 + 68);
  if (v17)
  {
    sleep(v17);
    goto LABEL_24;
  }

  if (*(_BYTE *)(a1 + 72))
  {
    still_running = 1;
    signal(2, (void (__cdecl *)(int))_easyperf_sigint_handler);
    while (still_running)
      pause();
    putchar(10);
    if (v7)
    {
LABEL_25:
      uint64_t v18 = pc_session_end(a1);
      if ((_DWORD)v18)
      {
        uint64_t v2 = v18;
        if ((_DWORD)v18 == 3)
        {
          if (*(int *)(a1 + 8) < 1)
          {
            return 3LL;
          }

          else
          {
            uint64_t v19 = 0LL;
            uint64_t v20 = 8LL;
            uint64_t v21 = 16LL;
            do
            {
              if (*(_DWORD *)(a1 + 4 * v19 + 12) == -1)
              {
                strerror(3);
                warnx("%s: %s");
              }

              else if (*(_DWORD *)(*(void *)(a1 + 200) + v20) == -1)
              {
                warnx("%s[%d] disappeared");
              }

              ++v19;
              v20 += 56LL;
              v21 += 33LL;
              uint64_t v2 = 3LL;
            }

            while (v19 < *(int *)(a1 + 8));
          }
        }

        return v2;
      }
    }
  }

  else if (*(_DWORD *)(a1 + 12) == -1)
  {
    warnx("nothing to measure");
    return 22LL;
  }

LABEL_42:
  uint64_t v2 = pc_session_process(a1);
  if (!(_DWORD)v2)
  {
    if (*a2 && (*(_BYTE *)(a1 + 184) & 1) == 0) {
      warnx("Warning: '%s' failed with exit code %d");
    }
    return 0LL;
  }

  return v2;
}

uint64_t __run_easyperf_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  *(_DWORD *)(v3 + 12) = a2;
  uint64_t result = pc_session_set_procname(v3, **(char ***)(v3 + 56));
  if (!(_DWORD)result) {
    return pc_session_begin(*(void *)(a1 + 32));
  }
  return result;
}

int *ep_session_create(int *a1)
{
  return pc_session_create(a1, *MEMORY[0x1895F89D0], *MEMORY[0x1895F89D0]);
}

uint64_t ep_session_set_testname(uint64_t a1, char *__s1)
{
  return pc_session_set_testid(a1, 0LL, __s1, 0);
}

uint64_t ep_session_config_with_argstr(char **a1, char *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v5 = pc_session_config_with_ep_argstr(a1, a2);
  uint64_t v6 = v5;
  if (a4) {
    *a4 = pc_errnum_to_excode(v5);
  }
  return v6;
}

uint64_t ep_session_process(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v5 = pc_session_process(a1);
  uint64_t v6 = v5;
  if (a4) {
    *a4 = pc_errnum_to_excode(v5);
  }
  return v6;
}

uint64_t _print_meas(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (!*(void *)a3) {
    return 0LL;
  }
  if (a4)
  {
    double v9 = *(double *)(a4 + 88);
    uint64_t v10 = (double *)&v15;
  }

  else
  {
    uint64_t v10 = 0LL;
    double v9 = 0.0;
  }

  unint64_t v12 = scaled_unitstr(*(void *)(a3 + 16), &v14, v10, *(double *)(a3 + 88), v9);
  uint64_t v13 = pc_session_copy_description(a1, 1, (int *)&v16);
  *(void *)(a2 + 8) = v13;
  if (v13)
  {
    print_metric_value(a1, a3, (const char **)a2, v14, (uint64_t)v12, v10, a5);
    free(*(void **)(a2 + 8));
    uint64_t result = 0LL;
    *(void *)(a2 + 8) = 0LL;
  }

  else
  {
    warnx("couldn't create test name");
    return v16;
  }

  return result;
}

void _easyperf_sigint_handler()
{
  still_running = 0;
}

uint64_t ___spawnAndAtCHLD_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (*(uint64_t (**)(uint64_t, void))(v2 + 16))( v2,  *(unsigned int *)(*(void *)(*(void *)(a1 + 48)
  }
                                                                                                + 8LL)
                                                                                    + 24LL));
  pid_t v3 = waitpid(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL), &v5, 0);
  if (v3 == *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    if ((v5 & 0x7F) != 0)
    {
      if ((v5 & 0x7F) == 0x7F)
      {
        warnx("%d has not yet exited or been signaled", v3);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 67;
      }

      else
      {
        **(_BYTE **)(a1 + 64) = 69;
      }
    }

    else
    {
      **(_BYTE **)(a1 + 64) = BYTE1(v5);
    }
  }

  else
  {
    warn("Warning: waitpid(%d)", *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

char *snapshot_create(uint64_t a1, int *a2)
{
  if (!a1)
  {
    int v20 = 22;
    goto LABEL_30;
  }

  int v4 = (char *)calloc(1uLL, 56LL * *(int *)(a1 + 8) + 8);
  if (!v4)
  {
    int v20 = *__error();
    goto LABEL_30;
  }

  int v5 = v4;
  int v6 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)int v4 = v6;
  if (v6 >= 1)
  {
    uint64_t v7 = 0LL;
    do
    {
      size_t v8 = *(int *)(a1 + 128);
      double v9 = (int *)&v5[56 * v7];
      v9[12] = v8;
      uint64_t v10 = calloc(v8, 0x60uLL);
      *((void *)v9 + 7) = v10;
      dispatch_semaphore_t v11 = v9 + 14;
      if (v10)
      {
        if ((int)v8 >= 1)
        {
          uint64_t v12 = 0LL;
          uint64_t v13 = 0LL;
          do
          {
            uint64_t v14 = *v11 + v13;
            uint64_t v15 = *(void *)(a1 + 120) + v12;
            __int128 v17 = *(_OWORD *)(v15 + 48);
            __int128 v16 = *(_OWORD *)(v15 + 64);
            __int128 v18 = *(_OWORD *)(v15 + 32);
            *(void *)(v14 + 80) = *(void *)(v15 + 80);
            *(_OWORD *)(v14 + 48) = v17;
            *(_OWORD *)(v14 + 64) = v16;
            *(_OWORD *)(v14 + 32) = v18;
            __int128 v19 = *(_OWORD *)(v15 + 16);
            *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
            *(_OWORD *)(v14 + 16) = v19;
            v13 += 96LL;
            v12 += 88LL;
          }

          while (96LL * v8 != v13);
        }
      }

      else
      {
        int v20 = *__error();
        if (v20) {
          goto LABEL_29;
        }
      }

      ++v7;
    }

    while (v7 < *(int *)v5);
  }

  if (*(int *)(a1 + 8) >= 1)
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = (const char *)(a1 + 16);
    uint64_t v23 = (uint64_t)(v5 + 8);
    uint64_t v24 = (int *)(a1 + 12);
    do
    {
      uint64_t v25 = *v24;
      if ((_DWORD)v25 == -1)
      {
        if (!*v22)
        {
          int v20 = 3;
LABEL_29:
          pc_snapshot_destroy(v5);
LABEL_30:
          int v5 = 0LL;
          if (a2 && v20)
          {
            int v5 = 0LL;
            *a2 = v20;
          }

          return v5;
        }

        if (!findPIDForProcName(v22, v24))
        {
          uint64_t v25 = *v24;
          if ((v25 & 0x80000000) == 0)
          {
LABEL_21:
          }
        }
      }

      else
      {
        if ((_DWORD)v25 == -2)
        {
          int v20 = 45;
          goto LABEL_29;
        }

        if ((v25 & 0x80000000) == 0) {
          goto LABEL_21;
        }
      }

      ++v21;
      v22 += 33;
      v23 += 56LL;
      ++v24;
    }

    while (v21 < *(int *)(a1 + 8));
  }

  return v5;
}

uint64_t pc_snapshot_destroy(char *a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)a1;
    if (*(int *)a1 >= 1)
    {
      uint64_t v3 = 0LL;
      uint64_t v4 = 56LL;
      do
      {
        int v5 = *(void **)&a1[v4];
        if (v5)
        {
          free(v5);
          int v2 = *(_DWORD *)a1;
        }

        ++v3;
        v4 += 56LL;
      }

      while (v3 < v2);
    }

    free(a1);
  }

  return 0LL;
}

uint64_t pc_session_get_value(uint64_t a1, int a2, uint64_t a3, double *a4, uint64_t *a5, const char **a6)
{
  uint64_t v64 = 0x43E0000000000000LL;
  uint64_t result = 22LL;
  if (a1 && a4 && a5)
  {
    uint64_t v10 = *(_DWORD **)(a1 + 192);
    if (!v10) {
      return 45LL;
    }
    if (*v10 <= a2) {
      return 34LL;
    }
    if (a3 <= 0x6D656D64656C7460LL)
    {
      if (!a3) {
        return 93LL;
      }
      if (a3 == 0x6375726D656D0000LL)
      {
        if (*(void *)(a1 + 200)) {
          uint64_t v20 = *(void *)(a1 + 200);
        }
        else {
          uint64_t v20 = *(void *)(a1 + 192);
        }
        if (*(_BYTE *)(v20 + 56LL * a2 + 45)) {
          return 93LL;
        }
        uint64_t v21 = *(unsigned int *)(v20 + 56LL * a2 + 48);
        __int128 v16 = 0LL;
        uint64_t v22 = *(void **)(v20 + 56LL * a2 + 56);
        uint64_t v23 = v22;
        do
        {
          uint64_t v24 = *v23;
          v23 += 12;
          if (v24 == 0x6375726D656D0000LL) {
            __int128 v16 = (double *)v22;
          }
          uint64_t v22 = v23;
          --v21;
        }

        while (v21);
LABEL_72:
        if (v16)
        {
LABEL_73:
          double v55 = v16[11];
LABEL_90:
          uint64_t v64 = *(void *)&v55;
LABEL_91:
          uint64_t v62 = *((void *)v16 + 2);
          *a4 = v55;
          *a5 = v62;
          if (!a6) {
            return 0LL;
          }
          __int128 v63 = pdunit_iorunit(v62);
          uint64_t result = 0LL;
          *a6 = v63;
          return result;
        }

        return 93LL;
      }

      uint64_t v13 = 0x6C6966657065616BLL;
      goto LABEL_15;
    }

    if (a3 == 0x6D656D64656C7461LL)
    {
      uint64_t v25 = *(void *)(a1 + 200);
      if (!v25) {
        return 93LL;
      }
      uint64_t v26 = *(unsigned int *)(v25 + 56LL * a2 + 48);
      uint64_t v27 = 0LL;
      int v28 = *(void **)(v25 + 56LL * a2 + 56);
      uint64_t v29 = v28;
      do
      {
        uint64_t v30 = *v29;
        v29 += 12;
        if (v30 == 0x6375726D656D0000LL) {
          uint64_t v27 = (double *)v28;
        }
        int v28 = v29;
        --v26;
      }

      while (v26);
      if (!v27) {
        return 93LL;
      }
      uint64_t v31 = v10[14 * a2 + 12];
      __int128 v16 = 0LL;
      int v32 = *(void **)&v10[14 * a2 + 14];
      char v33 = v32;
      do
      {
        uint64_t v34 = *v33;
        v33 += 12;
        if (v34 == 0x6375726D656D0000LL) {
          __int128 v16 = (double *)v32;
        }
        int v32 = v33;
        --v31;
      }

      while (v31);
    }

    else
    {
      if (a3 != 0x7065616B646C7461LL)
      {
        uint64_t v13 = 0x72636E747065616BLL;
LABEL_15:
        if (a3 == v13)
        {
          uint64_t v14 = *(void *)(a1 + 200);
          if (v14)
          {
            uint64_t v15 = *(unsigned int *)(v14 + 56LL * a2 + 48);
            __int128 v16 = 0LL;
            __int128 v17 = *(void **)(v14 + 56LL * a2 + 56);
            __int128 v18 = v17;
            do
            {
              uint64_t v19 = *v18;
              v18 += 12;
              if (v19 == a3) {
                __int128 v16 = (double *)v17;
              }
              __int128 v17 = v18;
              --v15;
            }

            while (v15);
          }

          else
          {
            uint64_t v51 = v10[14 * a2 + 12];
            __int128 v16 = 0LL;
            uint64_t v52 = *(void **)&v10[14 * a2 + 14];
            v53 = v52;
            do
            {
              uint64_t v54 = *v53;
              v53 += 12;
              if (v54 == a3) {
                __int128 v16 = (double *)v52;
              }
              uint64_t v52 = v53;
              --v51;
            }

            while (v51);
          }

          goto LABEL_72;
        }

        uint64_t v45 = *(void *)(a1 + 200);
        if (v45 && (uint64_t v46 = *(unsigned int *)(v45 + 56LL * a2 + 48), (int)v46 >= 1))
        {
          int v47 = 0LL;
          int v48 = *(void **)(v45 + 56LL * a2 + 56);
          v49 = v48;
          do
          {
            uint64_t v50 = *v49;
            v49 += 12;
            if (v50 == a3) {
              int v47 = (double *)v48;
            }
            int v48 = v49;
            --v46;
          }

          while (v46);
        }

        else
        {
          int v47 = 0LL;
        }

        uint64_t v56 = v10[14 * a2 + 12];
        __int128 v16 = 0LL;
        int v57 = *(void **)&v10[14 * a2 + 14];
        uint64_t v58 = v57;
        do
        {
          uint64_t v59 = *v58;
          v58 += 12;
          if (v59 == a3) {
            __int128 v16 = (double *)v57;
          }
          int v57 = v58;
          --v56;
        }

        while (v56);
        if (!v16) {
          return 93LL;
        }
        if (!v47) {
          goto LABEL_73;
        }
        custom_metric_id = session_find_custom_metric_id(a1, a3);
        if (custom_metric_id)
        {
          uint64_t v61 = custom_metric_id[6];
          if (v61)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, double, double))(v61 + 16))( v61,  a1,  a3,  &v64,  v16[11],  v47[11]);
            if ((_DWORD)result) {
              return result;
            }
            double v55 = *(double *)&v64;
            goto LABEL_91;
          }
        }

        double v44 = v47[11];
LABEL_89:
        double v55 = v44 - v16[11];
        goto LABEL_90;
      }

      uint64_t v35 = *(void *)(a1 + 200);
      if (!v35) {
        return 93LL;
      }
      uint64_t v36 = *(unsigned int *)(v35 + 56LL * a2 + 48);
      uint64_t v27 = 0LL;
      int v37 = *(void **)(v35 + 56LL * a2 + 56);
      v38 = v37;
      do
      {
        uint64_t v39 = *v38;
        v38 += 12;
        if (v39 == 0x72636E747065616BLL) {
          uint64_t v27 = (double *)v37;
        }
        int v37 = v38;
        --v36;
      }

      while (v36);
      if (!v27) {
        return 93LL;
      }
      uint64_t v40 = v10[14 * a2 + 12];
      __int128 v16 = 0LL;
      v41 = *(void **)&v10[14 * a2 + 14];
      int v42 = v41;
      do
      {
        uint64_t v43 = *v42;
        v42 += 12;
        if (v43 == 0x6375726D656D0000LL) {
          __int128 v16 = (double *)v41;
        }
        v41 = v42;
        --v40;
      }

      while (v40);
    }

    if (!v16) {
      return 93LL;
    }
    double v44 = v27[11];
    goto LABEL_89;
  }

  return result;
}

uint64_t pc_session_get_values(uint64_t a1, uint64_t a2)
{
  uint64_t result = 22LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 192))
    {
      int v5 = *(_DWORD *)(a1 + 8);
      if (v5 < 1)
      {
        return 0LL;
      }

      else
      {
        uint64_t v6 = 0LL;
        int v7 = *(_DWORD *)(a1 + 128);
        do
        {
          if (v7 >= 1)
          {
            uint64_t v8 = 0LL;
            uint64_t v9 = 0LL;
            uint64_t v10 = *(unsigned int *)(a1 + 4 * v6 + 12);
            do
            {
              dispatch_semaphore_t v11 = (uint64_t *)(*(void *)(a1 + 120) + v8);
              uint64_t v12 = *v11;
              if (*v11)
              {
                uint64_t v13 = v11[1];
                uint64_t result = pc_session_get_value(a1, v6, *v11, &v16, &v15, &v14);
                if ((_DWORD)result) {
                  return result;
                }
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, const char *, double))(a2 + 16))( a2,  v6,  a1 + 33 * v6 + 16,  v10,  v12,  v13,  v15,  v14,  v16);
                int v7 = *(_DWORD *)(a1 + 128);
              }

              ++v9;
              v8 += 88LL;
            }

            while (v9 < v7);
            int v5 = *(_DWORD *)(a1 + 8);
          }

          uint64_t result = 0LL;
          ++v6;
        }

        while (v6 < v5);
      }
    }

    else
    {
      return 45LL;
    }
  }

  return result;
}

char *copy_meas_session(uint64_t a1, int a2, _DWORD *a3, _DWORD *a4)
{
  if (!a1 || !a3)
  {
    uint64_t v9 = 0LL;
    int v14 = 22;
    if (a4) {
      goto LABEL_16;
    }
    return v9;
  }

  uint64_t v8 = create_meas_metrics(*(void *)(a1 + 120), *(_DWORD *)(a1 + 128), &v14);
  uint64_t v9 = v8;
  if (!v8)
  {
LABEL_15:
    if (a4) {
      goto LABEL_16;
    }
    return v9;
  }

  if (*(int *)(a1 + 128) < 1)
  {
    LODWORD(v10) = 0;
LABEL_14:
    *a3 = v10;
    int v14 = 0;
    goto LABEL_15;
  }

  uint64_t v10 = 0LL;
  dispatch_semaphore_t v11 = (double *)(v8 + 88);
  while (1)
  {
    int value = pc_session_get_value(a1, a2, *((void *)v11 - 11), v11, (uint64_t *)v11 - 9, 0LL);
    if (value) {
      break;
    }
LABEL_9:
    ++v10;
    v11 += 12;
  }

  if (value == 93)
  {
    *(v11 - 11) = 0.0;
    goto LABEL_9;
  }

  int v14 = value;
  free(v9);
  uint64_t v9 = 0LL;
  if (!a4) {
    return v9;
  }
LABEL_16:
  if (v14) {
    *a4 = v14;
  }
  return v9;
}

__CFDictionary *create_dict_epmeas(void *a1)
{
  CFMutableDataRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605238], MEMORY[0x189605248]);
  if (!Mutable) {
    return Mutable;
  }
  uint64_t valuePtr = 0LL;
  uint64_t v3 = a1[24];
  if (v3 == 0x6D656D64656C7461LL)
  {
    uint64_t v4 = 2LL;
    goto LABEL_6;
  }

  if (v3 == 0x6375726D656D0000LL)
  {
    uint64_t v4 = 1LL;
LABEL_6:
    uint64_t valuePtr = v4;
  }

  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, @"Run_mode", v5);
  CFRelease(v5);
  uint64_t v17 = a1[11];
  CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberDoubleType, &v17);
  if (!v6) {
    goto LABEL_13;
  }
  CFNumberRef v7 = v6;
  CFDictionarySetValue(Mutable, @"cpu_time", v6);
  CFRelease(v7);
  uint64_t v17 = a1[23];
  CFNumberRef v8 = CFNumberCreate(0LL, kCFNumberDoubleType, &v17);
  if (!v8) {
    goto LABEL_13;
  }
  CFNumberRef v9 = v8;
  CFDictionarySetValue(Mutable, @"Cpu_instructions", v8);
  CFRelease(v9);
  uint64_t v17 = a1[35];
  CFNumberRef v10 = CFNumberCreate(0LL, kCFNumberDoubleType, &v17);
  if (!v10) {
    goto LABEL_13;
  }
  CFNumberRef v11 = v10;
  CFDictionarySetValue(Mutable, @"Phys_footprint", v10);
  CFRelease(v11);
  uint64_t v17 = a1[47];
  CFNumberRef v12 = CFNumberCreate(0LL, kCFNumberDoubleType, &v17);
  if (!v12) {
    goto LABEL_13;
  }
  CFNumberRef v13 = v12;
  CFDictionarySetValue(Mutable, @"Peak_phys_footprint", v12);
  CFRelease(v13);
  uint64_t v17 = a1[59];
  CFNumberRef v14 = CFNumberCreate(0LL, kCFNumberDoubleType, &v17);
  if (v14)
  {
    CFNumberRef v15 = v14;
    CFDictionarySetValue(Mutable, @"Logical_writes", v14);
    CFRelease(v15);
  }

  else
  {
LABEL_13:
    CFRelease(Mutable);
    return 0LL;
  }

  return Mutable;
}

char *create_meas_epbfile(const char *a1, const char *a2, float *a3, _DWORD *a4)
{
  CFIndex v46 = -1LL;
  if (!a1)
  {
    double v16 = 0LL;
    int v17 = 22;
    goto LABEL_10;
  }

  *(double *)&CFDictionaryRef theDict = 0.0;
  float valuePtr = 0.0;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  int v9 = createCFObjFromFile(a1, TypeID, &theDict);
  int v47 = v9;
  if (v9)
  {
    warnc(v9, "%s", a1);
    CFNumberRef v14 = 0LL;
    CFNumberRef v13 = 0LL;
    goto LABEL_22;
  }

  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"version");
  if (!Value)
  {
    float v12 = 0.0;
LABEL_21:
    warnc(79, "%s: version %g baselines not supported", a1, v12);
    CFNumberRef v14 = 0LL;
    CFNumberRef v13 = 0LL;
    int v47 = 79;
    goto LABEL_22;
  }

  int v11 = CFNumberGetValue(Value, kCFNumberFloatType, &valuePtr);
  float v12 = valuePtr;
  if (!v11 || valuePtr != 0.625) {
    goto LABEL_21;
  }
  if (a2)
  {
    CFNumberRef v13 = CFStringCreateWithCString(0LL, a2, 0x8000100u);
    if (!v13)
    {
      CFNumberRef v14 = 0LL;
      int v15 = 12;
LABEL_18:
      int v47 = v15;
      goto LABEL_22;
    }
  }

  else
  {
    CFNumberRef v13 = CFRetain(@"_Easyperf_Default_");
  }

  __int128 v18 = CFDictionaryGetValue(theDict, v13);
  CFNumberRef v14 = v18;
  if (v18)
  {
    CFTypeID v19 = CFGetTypeID(v18);
    if (v19 != CFArrayGetTypeID())
    {
      CFNumberRef v14 = 0LL;
      int v15 = 79;
      goto LABEL_18;
    }

    CFRetain(v14);
  }

  else
  {
    int v47 = 0;
  }

LABEL_22:
  if (v13) {
    CFRelease(v13);
  }
  if (v14)
  {
    uint64_t v20 = copyHardwareModel(&v47);
    if (!v20)
    {
      warnx("couldn't get device model");
      CFRelease(v14);
      goto LABEL_43;
    }

    uint64_t v21 = v20;
    results_for_device = _get_results_for_device((const __CFArray *)v14, v20, &v46, &v47);
    if (results_for_device)
    {
      uint64_t v23 = (const __CFDictionary *)CFDictionaryGetValue(results_for_device, @"ep_metrics");
      if (v23)
      {
        uint64_t v24 = v23;
        CFTypeID v25 = CFGetTypeID(v23);
        if (v25 == CFDictionaryGetTypeID())
        {
          uint64_t v26 = create_epmetrics((int *)&valuePtr, &v47);
          uint64_t v27 = v26;
          if (!v26)
          {
            double v16 = 0LL;
            int v28 = 0LL;
            goto LABEL_37;
          }

          int v28 = create_meas_metrics((uint64_t)v26, SLODWORD(valuePtr), &v47);
          if (!v28)
          {
            double v16 = 0LL;
            goto LABEL_37;
          }

          if (SLODWORD(valuePtr) < 5)
          {
            int v29 = 22;
LABEL_79:
            double v16 = 0LL;
            goto LABEL_36;
          }

          if (CFDictionaryContainsKey(v24, @"cpu_time"))
          {
            int v32 = CFDictionaryGetValue(v24, @"cpu_time");
            CFTypeID v33 = CFGetTypeID(v32);
            if (v33 != CFNumberGetTypeID()) {
              goto LABEL_78;
            }
            CFNumberGetValue((CFNumberRef)v32, kCFNumberDoubleType, v28 + 88);
          }

          if (CFDictionaryContainsKey(v24, @"Cpu_instructions"))
          {
            uint64_t v34 = CFDictionaryGetValue(v24, @"Cpu_instructions");
            CFTypeID v35 = CFGetTypeID(v34);
            if (v35 != CFNumberGetTypeID()) {
              goto LABEL_78;
            }
            CFNumberGetValue((CFNumberRef)v34, kCFNumberDoubleType, v28 + 184);
          }

          if (CFDictionaryContainsKey(v24, @"Phys_footprint"))
          {
            uint64_t v36 = CFDictionaryGetValue(v24, @"Phys_footprint");
            CFTypeID v37 = CFGetTypeID(v36);
            if (v37 != CFNumberGetTypeID()) {
              goto LABEL_78;
            }
            CFNumberGetValue((CFNumberRef)v36, kCFNumberDoubleType, v28 + 280);
          }

          if (CFDictionaryContainsKey(v24, @"Peak_phys_footprint"))
          {
            v38 = CFDictionaryGetValue(v24, @"Peak_phys_footprint");
            CFTypeID v39 = CFGetTypeID(v38);
            if (v39 != CFNumberGetTypeID()) {
              goto LABEL_78;
            }
            CFNumberGetValue((CFNumberRef)v38, kCFNumberDoubleType, v28 + 376);
          }

          *(double *)&CFDictionaryRef theDict = 0.0;
          uint64_t v40 = CFDictionaryGetValue(v24, @"Run_mode");
          CFTypeID v41 = CFGetTypeID(v40);
          if (v41 != CFNumberGetTypeID()) {
            goto LABEL_78;
          }
          CFNumberGetValue((CFNumberRef)v40, kCFNumberDoubleType, &theDict);
          if (*(double *)&theDict == 1.0)
          {
            uint64_t v42 = 0x6375726D656D0000LL;
            uint64_t v43 = "current_mem";
          }

          else
          {
            if (*(double *)&theDict != 2.0)
            {
              *((void *)v28 + 24) = 0LL;
              goto LABEL_74;
            }

            uint64_t v42 = 0x6D656D64656C7461LL;
            uint64_t v43 = "mem_delta";
          }

          *((void *)v28 + 24) = v42;
          *((void *)v28 + 25) = v43;
LABEL_74:
          if (!CFDictionaryContainsKey(v24, @"Logical_writes"))
          {
LABEL_77:
            *a3 = valuePtr;
            int v47 = 0;
            double v16 = v28;
            goto LABEL_37;
          }

          double v44 = CFDictionaryGetValue(v24, @"Logical_writes");
          CFTypeID v45 = CFGetTypeID(v44);
          if (v45 == CFNumberGetTypeID())
          {
            CFNumberGetValue((CFNumberRef)v44, kCFNumberDoubleType, v28 + 472);
            goto LABEL_77;
          }

LABEL_78:
          int v29 = 79;
          goto LABEL_79;
        }
      }

      uint64_t v27 = 0LL;
      double v16 = 0LL;
      int v28 = 0LL;
      int v29 = 79;
    }

    else
    {
      CStringPtr = CFStringGetCStringPtr(v21, 0x8000100u);
      warnx("%s: no baseline for current system model", CStringPtr);
      uint64_t v27 = 0LL;
      double v16 = 0LL;
      int v28 = 0LL;
      int v29 = 93;
    }

LABEL_36:
    int v47 = v29;
LABEL_37:
    CFRelease(v21);
    CFRelease(v14);
    if (v27) {
      free(v27);
    }
    if (v16 || !v28)
    {
LABEL_44:
      if (!a4) {
        return v16;
      }
      goto LABEL_45;
    }

    free(v28);
LABEL_43:
    double v16 = 0LL;
    goto LABEL_44;
  }

  if (v47) {
    goto LABEL_43;
  }
  if (a2) {
    warnx("%s: no baseline for '%s'");
  }
  else {
    warnx("%s: no baseline for unspecified test name");
  }
  double v16 = 0LL;
  int v17 = 93;
LABEL_10:
  int v47 = v17;
  if (!a4) {
    return v16;
  }
LABEL_45:
  if (v47) {
    *a4 = v47;
  }
  return v16;
}

  warnc(v15, "%s", a2);
  double v16 = 0LL;
  if (a3) {
    *a3 = v15;
  }
LABEL_38:
  uint64_t v27 = v16;

  return v27;
}

CFDictionaryRef _get_results_for_device( const __CFArray *a1, const __CFString *a2, CFIndex *a3, int *a4)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (!a3 || !a4)
  {
    if (a4)
    {
      CFNumberRef v13 = 0LL;
      int v21 = 22;
LABEL_19:
      *a4 = v21;
      return v13;
    }

    return 0LL;
  }

  CFIndex v9 = Count;
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v10 = 0LL;
  while (1)
  {
    CFTypeID v11 = CFGetTypeID(a1);
    if (v11 != CFArrayGetTypeID()) {
      goto LABEL_18;
    }
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
    if (!ValueAtIndex) {
      goto LABEL_18;
    }
    CFNumberRef v13 = ValueAtIndex;
    CFTypeID v14 = CFGetTypeID(ValueAtIndex);
    if (v14 != CFDictionaryGetTypeID()
      || (Value = (const __CFDictionary *)CFDictionaryGetValue(v13, @"device_config")) == 0LL
      || (double v16 = Value, v17 = CFGetTypeID(Value), v17 != CFDictionaryGetTypeID())
      || (__int128 v18 = (const __CFString *)CFDictionaryGetValue(v16, @"model")) == 0LL
      || (CFTypeID v19 = v18, v20 = CFGetTypeID(v18), v20 != CFStringGetTypeID()))
    {
LABEL_18:
      CFNumberRef v13 = 0LL;
      int v21 = 79;
      goto LABEL_19;
    }

    if (CFStringCompare(v19, a2, 0LL) == kCFCompareEqualTo) {
      break;
    }
    if (v9 == ++v10) {
      return 0LL;
    }
  }

  *a3 = v10;
  return v13;
}

uint64_t record_basemeas(void *a1, const char *a2, const char *a3)
{
  int valuePtr = 1059061760;
  unsigned int v34 = 107;
  CFDictionaryRef theDict = 0LL;
  CFIndex idx = -1LL;
  CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberFloatType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    if (a3)
    {
      CFNumberRef v8 = CFStringCreateWithCString(0LL, a3, 0x8000100u);
      if (!v8)
      {
        unsigned int v34 = 12;
LABEL_43:
        CFRelease(v7);
        return v34;
      }
    }

    else
    {
      CFNumberRef v8 = CFRetain(@"_Easyperf_Default_");
    }

    CFStringRef v9 = copyHardwareModel((int *)&v34);
    if (!v9)
    {
      warnx("couldn't get device model");
      if (!v8) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }

    CFIndex v10 = v9;
    dict_epmeas = create_dict_epmeas(a1);
    if (!dict_epmeas)
    {
      warnx("couldn't create the metrics dictionary\n");
      unsigned int v34 = 12;
      goto LABEL_41;
    }

    float v12 = dict_epmeas;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    int v14 = createCFObjFromFile(a2, TypeID, &theDict);
    unsigned int v34 = v14;
    BOOL v15 = v14 != 0;
    if (v14)
    {
      if (v14 != 2)
      {
        warnc(v14, "%s", a2);
        BOOL v15 = 0;
        CFMutableDataRef Mutable = 0LL;
        BOOL v24 = 0;
        goto LABEL_29;
      }

      CFDictionaryRef theDict = CFDictionaryCreateMutable(0LL, 5LL, MEMORY[0x189605238], MEMORY[0x189605248]);
      if (!theDict)
      {
        BOOL v15 = 0;
        CFMutableDataRef Mutable = 0LL;
        goto LABEL_27;
      }

      int v16 = 1;
    }

    else
    {
      Value = (const __CFArray *)CFDictionaryGetValue(theDict, v8);
      if (Value)
      {
        CFMutableDataRef Mutable = Value;
        CFTypeID v19 = CFGetTypeID(Value);
        if (v19 == CFArrayGetTypeID())
        {
          results_for_device = _get_results_for_device(Mutable, v10, &idx, (int *)&v34);
          if (results_for_device)
          {
            int v21 = results_for_device;
            CFDictionarySetValue(results_for_device, @"ep_metrics", v12);
            CFArraySetValueAtIndex(Mutable, idx, v21);
            uint64_t v22 = 0LL;
            int v23 = 0;
            int v30 = 0;
            BOOL v24 = 0;
            goto LABEL_22;
          }

          int v16 = 0;
          BOOL v24 = 0;
          goto LABEL_19;
        }
      }

      int v16 = 0;
    }

    CFMutableDataRef Mutable = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605220]);
    if (Mutable)
    {
      BOOL v24 = 1;
LABEL_19:
      CFMutableDictionaryRef v25 = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605238], MEMORY[0x189605248]);
      if (v25)
      {
        int v21 = v25;
        int v23 = v16;
        CFMutableDictionaryRef v26 = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605238], MEMORY[0x189605248]);
        if (!v26)
        {
          unsigned int v34 = 12;
          BOOL v15 = v16 != 0;
          uint64_t v22 = v12;
          goto LABEL_31;
        }

        uint64_t v22 = v26;
        CFDictionarySetValue(theDict, @"version", v7);
        CFDictionarySetValue(v22, @"model", v10);
        CFDictionarySetValue(v21, @"device_config", v22);
        CFDictionarySetValue(v21, @"ep_metrics", v12);
        CFArrayAppendValue(Mutable, v21);
        CFDictionarySetValue(theDict, v8, Mutable);
        int v30 = 1;
LABEL_22:
        int v27 = writeCFObjToFile(theDict, a2, kCFPropertyListBinaryFormat_v1_0);
        unsigned int v34 = v27;
        BOOL v15 = v23 != 0;
        BOOL v24 = v24;
        if (v27)
        {
          warnc(v27, "%s", a2);
          CFRelease(v12);
          if ((v30 & 1) == 0)
          {
LABEL_33:
            if (v24 && Mutable) {
              CFRelease(Mutable);
            }
            if (theDict) {
              BOOL v28 = v15;
            }
            else {
              BOOL v28 = 0;
            }
            if (v28) {
              CFRelease(theDict);
            }
LABEL_41:
            CFRelease(v10);
            if (!v8) {
              goto LABEL_43;
            }
LABEL_42:
            CFRelease(v8);
            goto LABEL_43;
          }
        }

        else
        {
          CFRelease(v12);
          if (!v30) {
            goto LABEL_33;
          }
        }

        if (!v22)
        {
LABEL_32:
          CFRelease(v21);
          goto LABEL_33;
        }

LABEL_31:
        CFRelease(v22);
        goto LABEL_32;
      }

      unsigned int v34 = 12;
      BOOL v15 = v16 != 0;
LABEL_29:
      int v21 = v12;
      goto LABEL_32;
    }

        ++v21;
      }

      while (v21 != v36);
      CFTypeID v19 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
      if (!v19)
      {
LABEL_33:

        CFNumberRef v6 = v59;
        CFIndex v46 = v61;
        [v59 appendString:v61];
        if ([v63 length]) {
          [v59 appendFormat:@"           (baseline)\n%@", v63];
        }
        uint64_t v4 = v60;
        CFNumberRef v5 = v58;
        if ([v62 length]) {
          [v59 appendFormat:@"           (current)\n%@", v62];
        }

        goto LABEL_46;
      }
    }
  }

  [v7 allKeys];
  int v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v47 sortedArrayUsingSelector:sel_localizedStandardCompare_];
  int v48 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v78 = 0u;
  uint64_t v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  CFIndex v46 = v48;
  v49 = [v46 countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v77;
    do
    {
      for (j = 0LL; j != v50; ++j)
      {
        if (*(void *)v77 != v51) {
          objc_enumerationMutation(v46);
        }
        v53 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        [v8 objectForKeyedSubscript:v53];
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
        _variableDisplayString(v53, v54);
        double v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 appendString:v55];
      }

      uint64_t v50 = [v46 countByEnumeratingWithState:&v76 objects:v85 count:16];
    }

    while (v50);
  }

  CFTypeID v17 = v46;
LABEL_46:

  return v6;
}

LABEL_27:
    BOOL v24 = 0;
    unsigned int v34 = 12;
    goto LABEL_29;
  }

  warnx("couldn't create version number");
  return 12LL;
}

int *pc_session_create(int *a1, uint64_t a2, uint64_t a3)
{
  CFNumberRef v6 = (int *)calloc(1uLL, 0xD8uLL);
  if (!v6)
  {
    if (a1)
    {
      CFNumberRef v7 = 0LL;
      *a1 = *__error();
      return v7;
    }

    return 0LL;
  }

  CFNumberRef v7 = v6;
  *((void *)v6 + 1) = 0xFFFFFFFF00000001LL;
  epmetrics = create_epmetrics(v6 + 32, 0LL);
  *((void *)v7 + 15) = epmetrics;
  if (!epmetrics)
  {
    pc_session_destroy(v7);
    return 0LL;
  }

  *((void *)v7 + 19) = a2;
  *((void *)v7 + 20) = a3;
  if (a1) {
    *a1 = 0;
  }
  return v7;
}

uint64_t pc_session_destroy(int *a1)
{
  if (!a1) {
    return 22LL;
  }
  int v2 = *(void **)a1;
  if (v2) {
    free(v2);
  }
  uint64_t v3 = (void *)*((void *)a1 + 7);
  if (v3)
  {
    if ((a1[16] & 0x80000000) == 0)
    {
      uint64_t v4 = 0LL;
      do
        free(*(void **)(*((void *)a1 + 7) + 8 * v4));
      while (v4++ < a1[16]);
      uint64_t v3 = (void *)*((void *)a1 + 7);
    }

    free(v3);
  }

  CFNumberRef v6 = (void *)*((void *)a1 + 10);
  if (v6) {
    free(v6);
  }
  CFNumberRef v7 = (void *)*((void *)a1 + 11);
  if (v7) {
    free(v7);
  }
  CFNumberRef v8 = (void *)*((void *)a1 + 13);
  if (v8) {
    free(v8);
  }
  CFStringRef v9 = (void *)*((void *)a1 + 12);
  if (v9) {
    free(v9);
  }
  CFIndex v10 = (void *)*((void *)a1 + 15);
  if (v10) {
    free(v10);
  }
  CFTypeID v11 = (void *)*((void *)a1 + 17);
  if (v11)
  {
    if (a1[36] >= 1)
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      do
      {
        custom_metric_clean_up(*((void *)a1 + 17) + v12);
        ++v13;
        v12 += 56LL;
      }

      while (v13 < a1[36]);
      CFTypeID v11 = (void *)*((void *)a1 + 17);
    }

    free(v11);
  }

  int v14 = (void *)*((void *)a1 + 22);
  if (v14) {
    free(v14);
  }
  BOOL v15 = (FILE *)*((void *)a1 + 21);
  if (v15) {
    fclose(v15);
  }
  int v16 = (char *)*((void *)a1 + 24);
  if (v16) {
    pc_snapshot_destroy(v16);
  }
  CFTypeID v17 = (char *)*((void *)a1 + 25);
  if (v17) {
    pc_snapshot_destroy(v17);
  }
  free(a1);
  return 0LL;
}

uint64_t pc_session_set_snapshots_bufs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v31 = -2;
  if (!a2 || !a3)
  {
    unsigned int v31 = 22;
    goto LABEL_6;
  }

  if (*(void *)(a1 + 192))
  {
    unsigned int v31 = 37;
LABEL_7:
    *(void *)(a1 + 192) = 0LL;
    *(void *)(a1 + 200) = 0LL;
    return v31;
  }

  CFStringRef v9 = snapshot_create_with_buf(a1, a2, a3, (int *)&v31);
  CFIndex v10 = v9;
  if (v9)
  {
    *(void *)(a1 + 192) = v9;
    if (*(_DWORD *)v9 != 1)
    {
      uint64_t v12 = 0LL;
      goto LABEL_25;
    }

    if (!a4)
    {
      uint64_t v12 = 0LL;
      int v13 = *((_DWORD *)v9 + 12);
LABEL_31:
      if (v13 >= 1)
      {
        uint64_t v21 = 0LL;
        uint64_t v22 = 0LL;
        do
        {
          unsigned int v31 = add_metric(*(void *)(*((void *)v10 + 7) + v21), (void **)(a1 + 120), (int *)(a1 + 128), a1);
          if (v31) {
            goto LABEL_27;
          }
          ++v22;
          v21 += 96LL;
        }

        while (v22 < *((int *)v10 + 12));
      }

LABEL_35:
      if (*(int *)(a1 + 128) >= 1)
      {
        uint64_t v23 = 0LL;
        uint64_t v24 = 0LL;
        do
        {
          uint64_t v25 = *(void *)(a1 + 120);
          uint64_t v26 = *(void *)(v25 + v23);
          if (a4 && v26 == 0x6375726D656D0000LL)
          {
            int v27 = (void *)(v25 + v23);
            *int v27 = 0x6D656D64656C7461LL;
            v27[1] = "mem_delta";
            uint64_t v26 = 0x6D656D64656C7461LL;
          }

          unsigned int value = pc_session_get_value(a1, 0, v26, &v30, &v29, 0LL);
          unsigned int v31 = value;
          if (value)
          {
            if (value != 93) {
              goto LABEL_22;
            }
            unsigned int v31 = 0;
            *(void *)(v25 + v23) = 0LL;
          }

          ++v24;
          v23 += 88LL;
        }

        while (v24 < *(int *)(a1 + 128));
      }

      if ((pc_session_get_value(a1, 0, 0x72636E747065616BLL, &v30, &v29, 0LL)
         || (unsigned int v31 = add_metric(0x72636E747065616BLL, (void **)(a1 + 120), (int *)(a1 + 128), 0LL)) == 0)
        && (pc_session_get_value(a1, 0, 0x7065616B646C7461LL, &v30, &v29, 0LL)
         || (unsigned int v31 = add_metric(0x7065616B646C7461LL, (void **)(a1 + 120), (int *)(a1 + 128), 0LL)) == 0))
      {
        *(_DWORD *)(a1 + 8) = *(_DWORD *)v10;
        __strlcpy_chk();
        *(_DWORD *)(a1 + 12) = -2;
        return 0;
      }

      goto LABEL_22;
    }

    CFTypeID v11 = snapshot_create_with_buf(a1, a4, a5, (int *)&v31);
    if (v11)
    {
      uint64_t v12 = v11;
      *(void *)(a1 + 200) = v11;
      if (*(_DWORD *)v11 == *(_DWORD *)v10)
      {
        int v13 = *((_DWORD *)v11 + 12);
        if (v13 == *((_DWORD *)v10 + 12))
        {
          if (v13 >= 1)
          {
            int v14 = (uint64_t *)*((void *)v11 + 7);
            BOOL v15 = (uint64_t *)*((void *)v10 + 7);
            uint64_t v16 = *((unsigned int *)v11 + 12);
            while (1)
            {
              uint64_t v18 = *v14;
              v14 += 12;
              uint64_t v17 = v18;
              uint64_t v19 = *v15;
              v15 += 12;
              if (v17 != v19) {
                break;
              }
              if (!--v16) {
                goto LABEL_31;
              }
            }

            unsigned int v20 = 22;
            goto LABEL_26;
          }

          goto LABEL_35;
        }
      }

uint64_t pc_session_config_with_ep_argstr(char **a1, char *__s1)
{
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2000000000LL;
  int v20 = 0;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  int v18 = 0;
  uint64_t v2 = 22LL;
  if (a1 && __s1)
  {
    if (a1[24] || *a1)
    {
      uint64_t v2 = 37LL;
    }

    else
    {
      CFNumberRef v6 = strdup(__s1);
      uint64_t v7 = MEMORY[0x1895F87A8];
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 0x40000000LL;
      v13[2] = __pc_session_config_with_ep_argstr_block_invoke;
      v13[3] = &unk_189E3E178;
      v13[4] = &v15;
      uint64_t v2 = walkargstr(v6, 1, (uint64_t)v13);
      if (!(_DWORD)v2)
      {
        size_t v8 = *((int *)v16 + 6);
        if ((_DWORD)v8 && (CFStringRef v9 = calloc(v8, 8uLL)) != 0LL)
        {
          CFIndex v10 = v9;
          CFTypeID v11 = strdup(__s1);
          *a1 = v11;
          v12[0] = v7;
          v12[1] = 0x40000000LL;
          v12[2] = __pc_session_config_with_ep_argstr_block_invoke_2;
          v12[3] = &unk_189E3E1A0;
          v12[4] = v19;
          v12[5] = &v15;
          v12[6] = v10;
          uint64_t v2 = walkargstr(v11, 0, (uint64_t)v12);
          if (!(_DWORD)v2) {
            uint64_t v2 = pc_session_config_with_ep_args((uint64_t)a1, *((_DWORD *)v16 + 6), v10, &v14);
          }
          free(v10);
        }

        else
        {
          uint64_t v2 = 0LL;
        }
      }
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);
  return v2;
}

uint64_t __pc_session_config_with_ep_argstr_block_invoke(uint64_t a1)
{
  return 0LL;
}

uint64_t __pc_session_config_with_ep_argstr_block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1[4] + 8LL);
  uint64_t v3 = *(int *)(v2 + 24);
  uint64_t result = 0LL;
  uint64_t v6 = a1[6];
  *(_DWORD *)(v2 + 24) = v3 + 1;
  *(void *)(v6 + 8 * v3) = a2;
  return result;
}

uint64_t pc_session_set_procpid(uint64_t a1, int pid)
{
  if (!a1) {
    return 22LL;
  }
  if (*(void *)(a1 + 192)) {
    return 37LL;
  }
  *(_DWORD *)(a1 + 12) = pid;
  CFNumberRef v5 = __error();
  uint64_t v2 = *v5;
  warnc(*v5, "PID %d", pid);
  return v2;
}

uint64_t pc_session_set_exeargs(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = 22LL;
  if (a1 && a3)
  {
    LODWORD(v6) = a2;
    *(_DWORD *)(a1 + 64) = a2;
    uint64_t v7 = calloc(a2 + 1, 8uLL);
    *(void *)(a1 + 56) = v7;
    if (!v7) {
      return *__error();
    }
    size_t v8 = v7;
    if ((int)v6 >= 1)
    {
      uint64_t v9 = 0LL;
      uint64_t v6 = v6;
      while (1)
      {
        v8[v9] = strdup(*(const char **)(a3 + v9 * 8));
        size_t v8 = *(void **)(a1 + 56);
        if (!v8[v9]) {
          return *__error();
        }
      }
    }

    uint64_t v6 = 0LL;
LABEL_11:
    uint64_t result = 0LL;
    v8[v6] = 0LL;
  }

  return result;
}

uint64_t pc_session_set_procname(uint64_t a1, char *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 22LL;
  }
  if (*(void *)(a1 + 192)) {
    return 37LL;
  }
  basename_r(a2, v8);
  CFNumberRef v5 = (const char *)(a1 + 16);
  int v7 = *(_DWORD *)(a1 + 12);
  uint64_t v6 = (int *)(a1 + 12);
  if (v7 != -1) {
    return 0LL;
  }
  uint64_t result = findPIDForProcName(v5, v6);
  if ((_DWORD)result != 84) {
    return 0LL;
  }
  return result;
}

uint64_t pc_session_get_procname(uint64_t a1)
{
  if (a1) {
    return a1 + 16;
  }
  else {
    return 0LL;
  }
}

uint64_t pc_session_set_baseline_file(uint64_t a1, char *a2)
{
  if (a1 && a2) {
    return _copy_str((void **)(a1 + 80), a2);
  }
  else {
    return 22LL;
  }
}

uint64_t _copy_str(void **a1, char *__s1)
{
  uint64_t result = 22LL;
  if (a1 && __s1)
  {
    if (*a1) {
      free(*a1);
    }
    CFNumberRef v5 = strdup(__s1);
    *a1 = v5;
    if (v5) {
      return 0LL;
    }
    else {
      return *__error();
    }
  }

  return result;
}

uint64_t session_set_record_path(uint64_t a1, char *a2)
{
  if (a1 && a2) {
    return _copy_str((void **)(a1 + 88), a2);
  }
  else {
    return 22LL;
  }
}

uint64_t pc_session_set_project_baseline(uint64_t a1, char *a2)
{
  if (a1 && a2) {
    return _copy_str((void **)(a1 + 96), a2);
  }
  else {
    return 22LL;
  }
}

uint64_t pc_session_set_testid(uint64_t a1, const char *a2, char *__s1, int a4)
{
  size_t v8 = 0LL;
  uint64_t v4 = 22LL;
  if (!a1 || !__s1) {
    return v4;
  }
  if (!a2) {
    goto LABEL_6;
  }
  if (asprintf(&v8, "%s.%s", a2, __s1) != -1)
  {
    __s1 = v8;
LABEL_6:
    *(_DWORD *)(a1 + 112) = a4;
    uint64_t v4 = _copy_str((void **)(a1 + 104), __s1);
    goto LABEL_8;
  }

  uint64_t v4 = *__error();
LABEL_8:
  if (v8) {
    free(v8);
  }
  return v4;
}

uint64_t pc_session_get_test_name(uint64_t a1, void *a2, _DWORD *a3)
{
  if (!a1) {
    return 22LL;
  }
  if (a2) {
    *a2 = *(void *)(a1 + 104);
  }
  uint64_t result = 0LL;
  if (a3) {
    *a3 = *(_DWORD *)(a1 + 112);
  }
  return result;
}

uint64_t pc_session_get_perfdata_file(uint64_t result)
{
  if (result) {
    return *(void *)(result + 176);
  }
  return result;
}

uint64_t pc_session_set_perfdata_file(uint64_t a1, char *a2)
{
  if (a1 && a2) {
    return _copy_str((void **)(a1 + 176), a2);
  }
  else {
    return 22LL;
  }
}

uint64_t pc_session_setopts(uint64_t a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  if (*(void *)(a1 + 192)) {
    return 37LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 184) = a2;
  return result;
}

uint64_t pc_session_set_failtracer_file(uint64_t a1, char *__filename)
{
  uint64_t result = 22LL;
  if (a1 && __filename)
  {
    CFNumberRef v5 = *(FILE **)(a1 + 168);
    if (v5) {
      fclose(v5);
    }
    uint64_t v6 = fopen(__filename, "w");
    *(void *)(a1 + 168) = v6;
    if (v6) {
      return 0LL;
    }
    else {
      return *__error();
    }
  }

  return result;
}

uint64_t pc_session_getopts(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 184);
  }
  return result;
}

uint64_t pc_session_get_context(uint64_t result)
{
  if (result) {
    return *(void *)(result + 208);
  }
  return result;
}

uint64_t pc_session_set_context(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 208) = a2;
  return result;
}

uint64_t pc_session_begin(uint64_t a1)
{
  unsigned int v4 = 107;
  if (!a1) {
    return 22LL;
  }
  if (*(void *)(a1 + 192)) {
    return 37LL;
  }
  uint64_t v3 = snapshot_create(a1, (int *)&v4);
  *(void *)(a1 + 192) = v3;
  if (v3) {
    return 0LL;
  }
  else {
    return v4;
  }
}

uint64_t pc_session_end(uint64_t a1)
{
  int v9 = 107;
  if (!a1) {
    return 22;
  }
  if (!*(void *)(a1 + 192)) {
    return 45;
  }
  uint64_t v2 = snapshot_create(a1, &v9);
  *(void *)(a1 + 200) = v2;
  if (v2)
  {
    int v3 = *(_DWORD *)(a1 + 8);
    if (*((_DWORD *)v2 + 1) == v3)
    {
      uint64_t v4 = *(unsigned int *)(a1 + 128);
      if ((int)v4 >= 1)
      {
        CFNumberRef v5 = *(void **)(a1 + 120);
        do
        {
          if (*v5 == 0x6375726D656D0000LL)
          {
            *CFNumberRef v5 = 0x6D656D64656C7461LL;
            v5[1] = "mem_delta";
          }

          v5 += 11;
          --v4;
        }

        while (v4);
      }

      return 0;
    }

    else
    {
      int v9 = 3;
      if (v3 >= 1)
      {
        for (uint64_t i = 0LL; i < v3; ++i)
        {
          if (*(_DWORD *)(a1 + 12 + 4 * i) == -1)
          {
            warnc(v9, "%s", (const char *)(a1 + 16));
            int v3 = *(_DWORD *)(a1 + 8);
          }
        }
      }
    }
  }

  return v9;
}

char *pc_session_copy_description(uint64_t a1, char a2, int *a3)
{
  int v7 = 0LL;
  if ((a2 & 1) != 0 || (*(_DWORD *)(a1 + 12) & 0x80000000) != 0) {
    int v4 = asprintf(&v7, "%s %s");
  }
  else {
    int v4 = asprintf(&v7, "%s[%d] %s");
  }
  if (v4 == -1)
  {
    int v5 = *__error();
    if (v5 && v7) {
      free(v7);
    }
    if (a3 && v5) {
      *a3 = v5;
    }
  }

  return v7;
}

uint64_t pc_session_get_sleep_interval(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 68);
  }
  return result;
}

uint64_t pc_session_set_sleep_interval(uint64_t a1, int a2)
{
  if (!a1 || a2 && *(_BYTE *)(a1 + 72)) {
    return 22LL;
  }
  if (*(void *)(a1 + 192)) {
    return 37LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 68) = a2;
  return result;
}

BOOL pc_session_get_interactive(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 72) != 0;
  }
  return result;
}

uint64_t pc_session_set_interactive(uint64_t a1, int a2)
{
  if (!a1 || a2 && *(_DWORD *)(a1 + 68)) {
    return 22LL;
  }
  if (*(void *)(a1 + 192)) {
    return 37LL;
  }
  uint64_t result = 0LL;
  *(_BYTE *)(a1 + 72) = a2;
  return result;
}

uint64_t pc_session_get_exeargs(uint64_t a1, _DWORD *a2, void *a3)
{
  uint64_t result = 22LL;
  if (a2 && a1)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a2 = *(_DWORD *)(a1 + 64);
      *a3 = *(void *)(a1 + 56);
    }
  }

  return result;
}

uint64_t pc_session_get_procpids(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 22LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a2 = a1 + 12;
      *a3 = *(_DWORD *)(a1 + 8);
    }
  }

  return result;
}

uint64_t session_putc(uint64_t a1, int a2)
{
  if (a1 && (uint64_t v2 = *(FILE **)(a1 + 152)) != 0LL) {
    return fputc(a2, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t pc_measurement_graph( __int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  if (a6 > a7 || a7 > a8) {
    return 22LL;
  }
  if (a9 <= 0.0 && (a4 & 8) == 0) {
    return 22LL;
  }
  if ((a4 & 4) == 0)
  {
    __int128 v19 = a2[1];
    __int128 v80 = *a2;
    *(_OWORD *)v81 = v19;
    *(void *)&v81[16] = *((void *)a2 + 4);
  }

  if ((a4 & 2) == 0)
  {
    __int128 v20 = a1[1];
    __int128 v80 = *a1;
    *(_OWORD *)v81 = v20;
    *(void *)&v81[16] = *((void *)a1 + 4);
  }

  if ((a4 & 0xFFFFFFFFFFFFFFF1LL) != 0) {
    return 45LL;
  }
  uint64_t v22 = a3 + 1;
  MEMORY[0x1895F8858]();
  uint64_t v24 = (char *)&v72 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL);
  double v25 = *((double *)a1 + 2);
  double v26 = fmin(a6, a9);
  if ((a4 & 8) != 0) {
    double v26 = a6;
  }
  if ((a4 & 2) == 0)
  {
    double v27 = *((double *)a1 + 2);
    double v26 = fmin(v26, v27);
  }

  double v28 = *((double *)a2 + 2);
  if ((a4 & 4) == 0)
  {
    double v29 = *((double *)a2 + 2);
    double v26 = fmin(v26, v29);
  }

  double v30 = fmax(a8, a9);
  if ((a4 & 8) != 0) {
    double v30 = a8;
  }
  if ((a4 & 2) == 0)
  {
    double v31 = *((double *)a1 + 4);
    double v32 = *((double *)a1 + 2);
    if (v31 != 0.0) {
      double v32 = v25 * (v31 + 100.0) / 100.0;
    }
    double v30 = fmax(v30, v32);
  }

  if ((a4 & 4) == 0)
  {
    double v33 = *((double *)a2 + 4);
    if (v33 != 0.0) {
      double v28 = v28 * (v33 + 100.0) / 100.0;
    }
    double v30 = fmax(v30, v28);
  }

  double v34 = fmax(ceil((v25 - v26) / v25 * 100.0), ceil((v30 - v25) / v25 * 100.0));
  unint64_t v35 = a3 - 10;
  if (v34 < 100.0)
  {
    if (v35 >= 0xA)
    {
      double v73 = a1;
      uint64_t v74 = v23;
      uint64_t v75 = a5;
      double v36 = v25 * (100.0 - v34) / 100.0;
      int v37 = snprintf((char *)&v72 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL), a3 + 1, "-%.0f%% ", v34);
      uint64_t v38 = v37;
      double v72 = a2;
      if (v34 < 10.0) {
        uint64_t v38 = v37 + (uint64_t)snprintf(&v24[v37], v22 - v37, " ");
      }
      goto LABEL_46;
    }

    return 34LL;
  }

  if (v35 < 0xA) {
    return 34LL;
  }
  double v73 = a1;
  uint64_t v74 = v23;
  uint64_t v75 = a5;
  double v72 = a2;
  if (a6 == 0.0) {
    int v39 = snprintf((char *)&v72 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL), a3 + 1, " 0 : ", v72);
  }
  else {
    int v39 = snprintf((char *)&v72 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0LL), a3 + 1, " <1%% ", v72);
  }
  uint64_t v38 = v39;
  double v36 = 0.0;
LABEL_46:
  unint64_t v40 = 0LL;
  double v41 = v25 * (v34 + 100.0) / 100.0;
  uint64_t v42 = a3 - 11;
  double v43 = (v41 - v36) / (double)v35;
  *(void *)&__int128 v76 = a3 - 12;
  do
  {
    unint64_t v44 = v40 + 1;
    double v45 = v36 + v43 * (double)v40;
    double v46 = v36 + v43 * (double)(v40 + 1);
    BOOL v47 = v42 == v40;
    if (v46 > a6) {
      BOOL v47 = 1;
    }
    if (v45 > a6) {
      BOOL v47 = 0;
    }
    BOOL v49 = v46 > a8 || v42 == v40;
    if (v42 == v40) {
      char v50 = 42;
    }
    else {
      char v50 = 95;
    }
    if (v46 < a6) {
      char v50 = 95;
    }
    if (v46 > a6) {
      char v50 = 42;
    }
    if (v45 > a8)
    {
      BOOL v49 = 0;
      char v50 = 95;
    }

    BOOL v51 = v35 == v40;
    if (v45 > a6) {
      BOOL v51 = 1;
    }
    if (v46 <= a8) {
      BOOL v52 = v36 + v43 * (double)(v40 + 2) <= a8 && (void)v76 != v40;
    }
    else {
      BOOL v52 = 1;
    }
    int v53 = !v47 || v52 && !v49;
    if (v49) {
      char v50 = 93;
    }
    if (v47) {
      unsigned __int8 v54 = 91;
    }
    else {
      unsigned __int8 v54 = v50;
    }
    if (v49 && v51) {
      unsigned __int8 v54 = 42;
    }
    if (!v53) {
      unsigned __int8 v54 = 42;
    }
    if ((a4 & 8) == 0 && v45 <= a9 && (v46 > a9 || v42 == v40))
    {
      if (v54 == 95) {
        unsigned __int8 v54 = 84;
      }
      else {
        unsigned __int8 v54 = 33;
      }
    }

    v38 += snprintf(&v24[v38], v22 - v38, "%c", v54);
    unint64_t v40 = v44;
  }

  while (v35 != v44);
  if (v34 >= 9800.0)
  {
    snprintf(&v24[v38], v22 - v38, " >99x");
    uint64_t v58 = v75;
    double v55 = v73;
  }

  else
  {
    double v55 = v73;
    if (v34 >= 900.0 || __ROR8__(0x8F5C28F5C28F5C29LL * (unint64_t)v34, 2) <= 0x28F5C28F5C28F5CuLL)
    {
      snprintf(&v24[v38], v22 - v38, " %.0fx");
    }

    else
    {
      uint64_t v56 = &v24[v38];
      size_t v57 = v22 - v38;
      if (v34 >= 100.0) {
        snprintf(v56, v57, " %.1fx");
      }
      else {
        snprintf(v56, v57, " +%.0f%%");
      }
    }

    uint64_t v58 = v75;
  }

  (*(void (**)(uint64_t, char *))(v58 + 16))(v58, v24);
  if ((a4 & 2) == 0)
  {
    uint64_t v59 = 0LL;
    uint64_t v60 = 5LL;
    do
    {
      v59 += snprintf(&v24[v59], v22 - v59, " ", v72);
      --v60;
    }

    while (v60);
    unint64_t v61 = 0LL;
    __int128 v76 = xmmword_1862F1060;
    do
    {
      *(double *)&__int128 v80 = v36;
      *((double *)&v80 + 1) = v41;
      *(double *)v81 = v34;
      *(_OWORD *)&v81[8] = v76;
      unint64_t v82 = v35;
      __int128 v62 = v55[1];
      __int128 v77 = *v55;
      __int128 v78 = v62;
      uint64_t v79 = *((void *)v55 + 4);
      unsigned __int8 v63 = _threshold_char((uint64_t)&v80, (double *)&v77, v61, 66);
      v59 += snprintf(&v24[v59], v22 - v59, "%c", v63);
      ++v61;
    }

    while (v35 != v61);
    uint64_t v64 = 5LL;
    do
    {
      v59 += snprintf(&v24[v59], v22 - v59, " ");
      --v64;
    }

    while (v64);
    (*(void (**)(uint64_t, char *))(v58 + 16))(v58, v24);
  }

  if ((a4 & 4) == 0)
  {
    uint64_t v65 = 0LL;
    uint64_t v66 = 5LL;
    do
    {
      v65 += snprintf(&v24[v65], v22 - v65, " ", v72);
      --v66;
    }

    while (v66);
    unint64_t v67 = 0LL;
    __int128 v76 = xmmword_1862F1060;
    int v68 = v72;
    do
    {
      *(double *)&__int128 v80 = v36;
      *((double *)&v80 + 1) = v41;
      *(double *)v81 = v34;
      *(_OWORD *)&v81[8] = v76;
      unint64_t v82 = v35;
      __int128 v69 = v68[1];
      __int128 v77 = *v68;
      __int128 v78 = v69;
      uint64_t v79 = *((void *)v68 + 4);
      unsigned __int8 v70 = _threshold_char((uint64_t)&v80, (double *)&v77, v67, 82);
      v65 += snprintf(&v24[v65], v22 - v65, "%c", v70);
      ++v67;
    }

    while (v35 != v67);
    uint64_t v71 = 5LL;
    do
    {
      v65 += snprintf(&v24[v65], v22 - v65, " ");
      --v71;
    }

    while (v71);
    (*(void (**)(uint64_t, char *))(v58 + 16))(v58, v24);
  }

  return 0LL;
}

BOOL _check_threshold(double *a1)
{
  double v2 = a1[1];
  double v1 = a1[2];
  double v3 = a1[3];
  if (v1 == 0.0 || v2 > v1 || v1 > v3) {
    return 0LL;
  }
  double v6 = *a1;
  if (*a1 < 0.0) {
    return 0LL;
  }
  double v7 = a1[4];
  if (v7 < 0.0) {
    return 0LL;
  }
  double v8 = a1[2];
  if (v6 != 0.0) {
    double v8 = (100.0 - v6) * v1 / 100.0;
  }
  if (v8 > v2) {
    return 0LL;
  }
  if (v7 != 0.0) {
    double v1 = v1 * (v7 + 100.0) / 100.0;
  }
  return v1 >= v3;
}

uint64_t _threshold_char(uint64_t a1, double *a2, unint64_t a3, char a4)
{
  double v4 = a2[1];
  double v5 = a2[2];
  if (*a2 == 0.0) {
    double v6 = a2[2];
  }
  else {
    double v6 = (100.0 - *a2) * v5 / 100.0;
  }
  double v7 = a2[4];
  BOOL v8 = v7 == 0.0;
  double v9 = v5 * (v7 + 100.0) / 100.0;
  if (v8) {
    double v9 = a2[2];
  }
  double v10 = *(double *)a1;
  unint64_t v11 = *(void *)(a1 + 40);
  double v12 = (*(double *)(a1 + 8) - *(double *)a1) / (double)v11;
  double v13 = *(double *)a1 + v12 * (double)a3;
  double v14 = *(double *)a1 + v12 * (double)(a3 + 1);
  unint64_t v15 = v11 - 1;
  int v16 = v14 > v6 || v11 - 1 == a3;
  if (v13 > v6) {
    int v16 = 0;
  }
  BOOL v17 = v14 > v9;
  BOOL v18 = v15 == a3;
  if (v15 == a3) {
    BOOL v17 = 1;
  }
  if (v14 < v6) {
    BOOL v18 = 0;
  }
  if (v14 > v6) {
    BOOL v18 = 1;
  }
  if (v13 > v9)
  {
    BOOL v17 = 0;
    BOOL v18 = 0;
  }

  if (v15 == a3) {
    char v19 = a4;
  }
  else {
    char v19 = 95;
  }
  if (v14 < v4) {
    char v19 = 95;
  }
  if (v14 > v4) {
    char v19 = a4;
  }
  if (v13 > a2[3]) {
    char v19 = 95;
  }
  BOOL v20 = v11 != a3;
  if (v13 > v6) {
    BOOL v20 = 0;
  }
  int v21 = v10 + v12 * (double)(a3 - 1) > v6 || v20;
  if (v14 <= v9) {
    BOOL v22 = v10 + v12 * (double)(a3 + 2) <= v9 && v11 != a3 + 2;
  }
  else {
    BOOL v22 = 1;
  }
  int v23 = (!v17 && v22) | ~v16;
  int v24 = !v17 | v21;
  if (v18) {
    char v25 = v19;
  }
  else {
    char v25 = 95;
  }
  if (v17) {
    char v26 = 93;
  }
  else {
    char v26 = v25;
  }
  if (v16) {
    char v27 = 91;
  }
  else {
    char v27 = v26;
  }
  if ((v23 & v24) == 0) {
    return v19;
  }
  return v27;
}

uint64_t pc_session_process(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 192))
    {
      LODWORD(result) = _update_compare_path(a1);
      if (!(_DWORD)result)
      {
        if (*(int *)(a1 + 8) < 1)
        {
          LODWORD(result) = 0;
        }

        else
        {
          int v3 = 0;
          do
            LODWORD(result) = dump_compare_metrics(a1, v3++);
          while (v3 < *(_DWORD *)(a1 + 8));
        }
      }
    }

    else
    {
      LODWORD(result) = 45;
    }
  }

  else
  {
    LODWORD(result) = 22;
  }

  if ((*(_BYTE *)(a1 + 184) & ((_DWORD)result != 148)) != 0) {
    return 0LL;
  }
  else {
    return result;
  }
}

uint64_t _update_compare_path(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 80)) {
    return 0LL;
  }
  int v3 = getenv("PERFCHECK_COMPARE_PATH");
  if (v3) {
    return pc_session_set_baseline_file(a1, v3);
  }
  double v4 = *(const char **)(a1 + 96);
  if (!v4) {
    return 0LL;
  }
  if (access(__str, 4)) {
    return 0LL;
  }
  else {
    return pc_session_set_baseline_file(a1, __str);
  }
}

uint64_t pc_session_process_pdfile(uint64_t a1, const char *a2, unsigned __int8 *a3)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  unsigned __int8 v45 = 0;
  makePDContainers(a1, a2, (int *)&updated);
  int v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    unsigned int updated = _update_compare_path(a1);
    if (!updated)
    {
      int v3 = *(const char **)(a1 + 80);
      if (v3)
      {
        makePDContainers(a1, v3, (int *)&updated);
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38) {
          goto LABEL_40;
        }
      }

      else
      {
        uint64_t v38 = 0LL;
      }

      unsigned int updated = 0;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      [v39 allKeys];
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v73 count:16];
      if (v4)
      {
        id v5 = 0LL;
        int v6 = 0;
        uint64_t v36 = *(void *)v42;
LABEL_9:
        uint64_t v7 = 0LL;
        int v37 = -v6;
        uint64_t v35 = v4;
        int v31 = v6 + v4;
        BOOL v8 = v5;
        while (1)
        {
          if (*(void *)v42 != v36) {
            objc_enumerationMutation(obj);
          }
          id v5 = *(id *)(*((void *)&v41 + 1) + 8 * v7);

          [v39 objectForKeyedSubscript:v5];
          double v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v38 objectForKeyedSubscript:v5];
          double v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            if (([v9 isComparableTo:v10] & 1) == 0)
            {
              int v24 = *(FILE **)(a1 + 160);
              id v25 = [v9 name];
              char v26 = (const char *)[v25 UTF8String];
              char v27 = *(const char **)(a1 + 80);
              id v28 = [v10 name];

              unsigned int updated = 93;
LABEL_38:

              goto LABEL_39;
            }
          }

          else if (v38 && (*(_BYTE *)(a1 + 184) & 1) == 0)
          {
            BOOL v17 = *(FILE **)(a1 + 160);
            id v18 = [v9 name];
            fprintf( v17,  "Warning: '%s': no baseline in %s\n",  (const char *)[v18 UTF8String],  *(const char **)(a1 + 80));
          }

          if (v37 != (_DWORD)v7) {
            session_putc(a1, 10);
          }
          id v11 = v9;
          id v12 = v10;
          uint64_t v69 = 0LL;
          unsigned __int8 v70 = &v69;
          uint64_t v71 = 0x2020000000LL;
          v67[0] = 0LL;
          v67[1] = v67;
          v67[2] = 0x3032000000LL;
          v67[3] = __Block_byref_object_copy_;
          v67[4] = __Block_byref_object_dispose_;
          id v68 = 0LL;
          v65[0] = 0LL;
          v65[1] = v65;
          v65[2] = 0x3032000000LL;
          v65[3] = __Block_byref_object_copy_;
          v65[4] = __Block_byref_object_dispose_;
          id v66 = 0LL;
          v61[0] = 0LL;
          v61[1] = v61;
          v61[2] = 0x5010000000LL;
          v61[3] = "";
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          if (v10)
          {
            [MEMORY[0x189603FC0] dictionaryWithCapacity:0];
            double v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              id v15 = 0LL;
              id v20 = 0LL;
              BOOL v22 = v70;
              unsigned int v21 = 12;
              goto LABEL_28;
            }

            id v60 = 0LL;
            v55[0] = MEMORY[0x1895F87A8];
            v55[1] = 3221225472LL;
            v55[2] = ___processContainer_block_invoke;
            v55[3] = &unk_189E3E1C8;
            size_t v57 = v67;
            uint64_t v58 = &v69;
            id v14 = v13;
            id v56 = v14;
            uint64_t v59 = a1;
            [v12 enumerateMeasurementsWithError:&v60 usingBlock:v55];
            id v15 = v60;

            int v16 = v70 + 3;
          }

          else
          {
            id v15 = 0LL;
            id v14 = 0LL;
            int v16 = &v72;
          }

          *(_DWORD *)int v16 = 0;
          v47[0] = MEMORY[0x1895F87A8];
          v47[1] = 3221225472LL;
          v47[2] = ___processContainer_block_invoke_2;
          v47[3] = &unk_189E3E1F0;
          id v19 = v11;
          uint64_t v53 = a1;
          id v48 = v19;
          char v50 = &v69;
          id v20 = v14;
          id v49 = v20;
          BOOL v51 = v65;
          BOOL v52 = v61;
          unsigned __int8 v54 = &v45;
          LOBYTE(v19) = [v19 enumerateMeasurementsWithError:0 usingBlock:v47];

          if ((v19 & 1) != 0)
          {
            unsigned int v21 = 0;
            *((_DWORD *)v70 + 6) = 0;
          }

          else
          {
            unsigned int v21 = *((_DWORD *)v70 + 6);
            if (!v21)
            {
              unsigned int v21 = [v15 code];
              BOOL v22 = v70;
LABEL_28:
              *((_DWORD *)v22 + 6) = v21;
            }
          }

          _Block_object_dispose(v61, 8);
          _Block_object_dispose(v65, 8);

          _Block_object_dispose(v67, 8);
          _Block_object_dispose(&v69, 8);

          unsigned int updated = v21;
          if (v21) {
            goto LABEL_38;
          }

          ++v7;
          BOOL v8 = v5;
          if (v35 == v7)
          {
            uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v73 count:16];
            int v6 = v31;
            if (v4) {
              goto LABEL_9;
            }

            break;
          }
        }
      }

      int v23 = v45;
      if (a3) {
        *a3 = v45;
      }
      if (v23) {
        unsigned int updated = 148;
      }
      else {
        unsigned int updated = 0;
      }
LABEL_39:
    }
  }

void sub_1862ED0A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void *pc_session_create_snapshot_buf(uint64_t a1, void *a2, _DWORD *a3)
{
  int v45 = -2;
  if (!a1 || !a2)
  {
    uint64_t v35 = 0LL;
    int v45 = 22;
    goto LABEL_35;
  }

  id v5 = snapshot_create(a1, &v45);
  if (!v5)
  {
    uint64_t v35 = 0LL;
    goto LABEL_35;
  }

  int v6 = v5;
  uint64_t v7 = [MEMORY[0x189603FB0] arrayWithCapacity:0];
  BOOL v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v35 = 0LL;
    int v45 = 12;
    goto LABEL_34;
  }

  int v37 = a2;
  if (*(int *)v6 < 1)
  {
LABEL_21:
    double v30 = (void *)MEMORY[0x186E37094]();
    id v44 = 0LL;
    int v31 = v8;
    [MEMORY[0x1896079E8] dataWithPropertyList:v8 format:200 options:0 error:&v44];
    double v32 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = v44;
    double v34 = v33;
    if (v32)
    {
      uint64_t v35 = malloc([v32 length]);
      if (v35)
      {
        objc_msgSend(v32, "getBytes:length:", v35, objc_msgSend(v32, "length"));
        *int v37 = [v32 length];
        int v45 = 0;
      }

      else
      {
        int v45 = *__error();
      }
    }

    else
    {
      uint64_t v35 = 0LL;
      int v45 = [v33 code];
    }

    objc_autoreleasePoolPop(v30);
    BOOL v8 = v31;
    goto LABEL_34;
  }

  uint64_t v9 = 0LL;
  unint64_t v10 = 0x189603000uLL;
  int v39 = v6;
  unint64_t v40 = a3;
  uint64_t v38 = (void *)v7;
  while (1)
  {
    [*(id *)(v10 + 4032) dictionaryWithCapacity:3];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11
      || ([v8 addObject:v11],
          [NSString stringWithUTF8String:&v6[56 * v9 + 12]],
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      int v45 = 12;
      goto LABEL_30;
    }

    double v13 = (void *)v12;
    [v11 setObject:v12 forKeyedSubscript:@"pname"];
    uint64_t v14 = [MEMORY[0x189607968] numberWithBool:v6[56 * v9 + 45]];
    if (!v14)
    {
      int v45 = 12;
LABEL_41:

      goto LABEL_30;
    }

    __int128 v43 = (void *)v14;
    [v11 setObject:v14 forKeyedSubscript:@"exited"];
    id v15 = &v6[56 * v9];
    uint64_t v17 = *((int *)v15 + 12);
    int v16 = (int *)(v15 + 48);
    uint64_t v18 = [*(id *)(v10 + 4032) dictionaryWithCapacity:v17];
    if (!v18)
    {
      int v45 = 12;

      goto LABEL_41;
    }

    id v19 = (void *)v18;
    __int128 v42 = v13;
    [v11 setObject:v18 forKeyedSubscript:@"meas"];
    int v20 = *v16;
    if (*v16 >= 1) {
      break;
    }
    int v24 = 0LL;
LABEL_20:
  }

  __int128 v41 = v11;
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  int v23 = 0LL;
  int v24 = 0LL;
  id v25 = &v6[56 * v9 + 56];
  while (1)
  {
    uint64_t v26 = *(void *)v25;
    if (*(void *)(*(void *)v25 + v21)) {
      break;
    }
LABEL_17:
    ++v22;
    v21 += 96LL;
    if (v22 >= v20)
    {

      int v6 = v39;
      a3 = v40;
      BOOL v8 = v38;
      id v11 = v41;
      unint64_t v10 = 0x189603000LL;
      goto LABEL_20;
    }
  }

  uint64_t v27 = v26 + v21;
  [NSString stringWithUTF8String:*(void *)(v26 + v21 + 8)];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    int v45 = 12;

    goto LABEL_29;
  }

  uint64_t v29 = [MEMORY[0x189607968] numberWithDouble:*(double *)(v27 + 88)];

  if (v29)
  {
    [v19 setObject:v29 forKeyedSubscript:v28];
    int v20 = *v16;
    int v24 = (void *)v29;
    int v23 = v28;
    goto LABEL_17;
  }

  int v45 = 12;

LABEL_29:
  int v6 = v39;
  a3 = v40;
  BOOL v8 = v38;
  id v11 = v41;
LABEL_30:

  uint64_t v35 = 0LL;
LABEL_34:
  pc_snapshot_destroy(v6);

LABEL_35:
  if (a3) {
    *a3 = v45;
  }
  return v35;
}

char *snapshot_create_with_buf(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  id v5 = 0LL;
  uint64_t v64 = *MEMORY[0x1895F89C0];
  int v6 = 22;
  if (!a2)
  {
    uint64_t v7 = 0LL;
    BOOL v8 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_41;
  }

  uint64_t v7 = 0LL;
  BOOL v8 = 0LL;
  uint64_t v9 = 0LL;
  if (!a3) {
    goto LABEL_41;
  }
  [MEMORY[0x189603F40] dataWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    id v5 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v9 = 0LL;
    int v6 = 12;
    goto LABEL_41;
  }

  id v62 = 0LL;
  [MEMORY[0x1896079E8] propertyListWithData:v8 options:0 format:0 error:&v62];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v62;
  uint64_t v7 = v11;
  if (!v9)
  {
    int v6 = [v11 code];
    goto LABEL_40;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = 0LL;
    int v6 = 79;
    goto LABEL_41;
  }

  int v12 = [v9 count];
  double v13 = (char *)calloc(1uLL, 56LL * v12 + 8);
  id v5 = v13;
  if (!v13)
  {
    int v6 = *__error();
    goto LABEL_41;
  }

  *(_DWORD *)double v13 = v12;
  if (v12 < 1) {
    goto LABEL_29;
  }
  uint64_t v14 = 0LL;
  uint64_t v45 = v12;
  while (1)
  {
    [v9 objectAtIndexedSubscript:v14];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 objectForKeyedSubscript:@"pname"];
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([v15 objectForKeyedSubscript:@"exited"],
          (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v30 = 0LL;
      double v55 = 0LL;
      int v6 = 79;
      goto LABEL_39;
    }

    uint64_t v18 = (void *)v17;
    objc_opt_class();
    id v49 = v18;
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (uint64_t v47 = v14,
          [v15 objectForKeyedSubscript:@"meas"],
          (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      double v55 = 0LL;
LABEL_47:
      int v6 = 79;
      id v30 = v49;
      goto LABEL_39;
    }

    int v20 = (void *)v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v55 = v20;
      goto LABEL_47;
    }

    id v48 = v15;
    uint64_t v21 = &v5[56 * v47];
    id v46 = v16;
    [v46 UTF8String];
    __strlcpy_chk();
    v21[45] = [v18 BOOLValue];
    int v22 = [v20 count];
    *((_DWORD *)v21 + 12) = v22;
    int v23 = calloc(v22, 0x60uLL);
    *((void *)v21 + 7) = v23;
    BOOL v52 = v21 + 56;
    if (!v23) {
      break;
    }
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    [v20 allKeys];
    int v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = v48;
    uint64_t v53 = [v24 countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (!v53) {
      goto LABEL_28;
    }
    id obj = v24;
    uint64_t v51 = a1;
    id v44 = a4;
    int v26 = 0;
    id v27 = 0LL;
    uint64_t v54 = *(void *)v59;
    double v55 = v20;
    while (2)
    {
      uint64_t v28 = 0LL;
      int v43 = v26;
      uint64_t v29 = 96LL * v26;
      do
      {
        if (*(void *)v59 != v54) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(id *)(*((void *)&v58 + 1) + 8 * v28);

        size_t v57 = 0LL;
        int v56 = 0;
        [v55 objectForKeyedSubscript:v30];
        int v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          int v6 = 79;
LABEL_38:

          a4 = v44;
          id v15 = v48;
          int v16 = v46;
          goto LABEL_39;
        }

        id v27 = v30;
        uint64_t metricid_name = get_metricid_name(v51, (char *)[v27 UTF8String]);
        if (!metricid_name)
        {
          int v6 = 93;
          goto LABEL_38;
        }

        int v33 = add_metric(metricid_name, &v57, &v56, v51);
        if (v33)
        {
          int v6 = v33;
          goto LABEL_38;
        }

        uint64_t v34 = *v52 + v29;
        uint64_t v35 = v57;
        __int128 v36 = *((_OWORD *)v57 + 1);
        *(_OWORD *)uint64_t v34 = *(_OWORD *)v57;
        *(_OWORD *)(v34 + 16) = v36;
        __int128 v38 = v35[3];
        __int128 v37 = v35[4];
        __int128 v39 = v35[2];
        *(void *)(v34 + 80) = *((void *)v35 + 10);
        *(_OWORD *)(v34 + 4_Block_object_dispose(&STACK[0x220], 8) = v38;
        *(_OWORD *)(v34 + 64) = v37;
        *(_OWORD *)(v34 + 32) = v39;
        [v31 doubleValue];
        *(void *)(v34 + 8_Block_object_dispose(&STACK[0x220], 8) = v40;
        free(v57);

        ++v28;
        v29 += 96LL;
      }

      while (v53 != v28);
      uint64_t v41 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      int v26 = v43 + v28;
      uint64_t v53 = v41;
      if (v41) {
        continue;
      }
      break;
    }

    a4 = v44;
    int v24 = obj;
    a1 = v51;
    id v25 = v48;
    int v20 = v55;
LABEL_28:

    uint64_t v14 = v47 + 1;
    if (v47 + 1 == v45)
    {
LABEL_29:
      int v6 = 0;
      goto LABEL_41;
    }
  }

  double v55 = v20;
  int v6 = *__error();
  id v15 = v48;
  id v30 = v49;
LABEL_39:

  pc_snapshot_destroy(v5);
LABEL_40:
  id v5 = 0LL;
LABEL_41:
  if (a4) {
    *a4 = v6;
  }

  return v5;
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

void ___processContainer_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v10 = a2;
  uint64_t v5 = makeMetricDesc(v10);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 56);
      if ((*(_BYTE *)(v9 + 184) & 1) == 0) {
        fprintf( *(FILE **)(v9 + 160), "ignoring (38284416) duplicate baseline:\n\t%s\n", (const char *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) UTF8String]);
      }
    }

    else
    {
      [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 12;
    *a3 = 1;
  }
}

void ___processContainer_block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  makeMetricDesc(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = makeTestHeader(*(void **)(a1 + 32), v5);
  BOOL v8 = (void *)v7;
  uint64_t v62 = 0LL;
  __int128 v60 = 0u;
  memset(v61, 0, sizeof(v61));
  __int128 v59 = 0u;
  double v57 = 0.0;
  uint64_t v9 = *(void *)(a1 + 72);
  if (v6 && v7)
  {
    int v56 = (void *)v7;
    id v10 = v5;
    id v11 = [v10 metric];
    *((void *)&v59 + 1) = [v11 UTF8String];

    uint64_t metricid_name = get_metricid_name(v9, *((char **)&v59 + 1));
    *(void *)&__int128 v59 = metricid_name;
    BYTE8(v60) = [v10 largerBetter];
    [v10 variables];
    double v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 objectForKeyedSubscript:@"_pc_metric_group"];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0) {
        *(void *)&v61[0] = [v14 UTF8String];
      }
    }

    else
    {
    }

    if (get_thresholds(v9, metricid_name, v67, 0LL)) {
      __memcpy_chk();
    }
    [v10 variables];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 objectForKeyedSubscript:@"failure_threshold_pct"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v8 = v56;
    if (v18)
    {
      [v18 doubleValue];
      set_threshold((uint64_t)v61 + 8, 3, 98307LL, 0, v19);
    }

    [v10 variables];
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 objectForKeyedSubscript:@"_pc_failure_threshold"];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      [v21 doubleValue];
      set_threshold((uint64_t)v61 + 8, 3, 32771LL, 0, v22);
    }

    [v10 variables];
    int v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 objectForKeyedSubscript:@"_pc_failure_threshold_abs"];
    int v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      [v24 doubleValue];
      set_threshold((uint64_t)v61 + 8, 3, 3LL, 0, v25);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    int MeasValue = _getMeasValue(v10, &v58);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = MeasValue;
    if (MeasValue)
    {
      int v16 = 0LL;
      *a3 = 1;
    }

    else
    {
      [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if ((areMeasComparable(v10, v16) & 1) == 0)
        {
          id v27 = *(FILE **)(*(void *)(a1 + 72) + 160LL);
          uint64_t v28 = (const char *)[v6 UTF8String];
          id v29 = makeMetricDesc(v16);
          fprintf( v27,  "Measurement '%s'\n\tnot comparable to\n\tmeasurement '%s'\n",  v28,  (const char *)[v29 UTF8String]);
        }

        else {
          id v30 = &v57;
        }
      }

      else
      {
        id v30 = 0LL;
      }

      if ([v56 length]
        && [v56 compare:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)) {
          session_putc(*(void *)(a1 + 72), 10);
        }
        int v31 = *(FILE **)(*(void *)(a1 + 72) + 152LL);
        if (v31)
        {
          uint64_t v53 = v30;
          uint64_t v54 = v16;
          double v55 = v6;
          id v32 = v56;
          fprintf(v31, "%s\n", (const char *)[v32 UTF8String]);
          int v33 = *(FILE **)(*(void *)(a1 + 72) + 152LL);
          [v32 componentsSeparatedByString:@"\n"];
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v63 objects:v67 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            unint64_t v37 = 0LL;
            uint64_t v38 = *(void *)v64;
            do
            {
              for (uint64_t i = 0LL; i != v36; ++i)
              {
                if (*(void *)v64 != v38) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v40 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                if ([v40 length] > v37) {
                  unint64_t v37 = [v40 length];
                }
              }

              uint64_t v36 = [v34 countByEnumeratingWithState:&v63 objects:v67 count:16];
            }

            while (v36);
          }

          else
          {
            unint64_t v37 = 0LL;
          }

          if (v37 >= 0x50) {
            uint64_t v41 = 80LL;
          }
          else {
            uint64_t v41 = v37;
          }
          uint64_t v6 = v55;
          while (v41)
          {
            --v41;
            fputc(45, v33);
          }

          fputc(10, v33);

          BOOL v8 = v56;
          id v30 = v53;
          int v16 = v54;
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v8);
      }

      id v42 = [v10 unitString];
      int v43 = (const char *)[v42 UTF8String];

      if (!strcmp(v43, "ns"))
      {
        double v57 = v57 / 1000000.0;
        double v58 = v58 / 1000000.0;
        int v43 = "ms";
      }

      if (!strcmp(v43, "#none")) {
        id v44 = "";
      }
      else {
        id v44 = v43;
      }
      [v10 metric];
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v46 = [v45 length];

      if (strlen(v44) < 3)
      {
        if (v46 >= 0x10)
        {
          id v48 = *(FILE **)(*(void *)(a1 + 72) + 152LL);
          if (v48) {
            fprintf(v48, "  %s\n");
          }
        }
      }

      else
      {
        uint64_t v47 = *(FILE **)(*(void *)(a1 + 72) + 152LL);
        if (v47) {
          fprintf(v47, "  %s (%s)\n");
        }
      }

      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [v8 UTF8String];
      print_metric_value( *(void *)(a1 + 72),  (uint64_t)&v59,  (const char **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 32LL),  v58,  (uint64_t)v44,  v30,  *(_BYTE **)(a1 + 80));
      id v49 = *(FILE **)(*(void *)(a1 + 72) + 152LL);
      if (v49)
      {
        int v50 = fileno(v49);
        if (v50) {
          BOOL v51 = isatty(v50) != 0;
        }
        else {
          BOOL v51 = 0;
        }
        makeMeasurementFooter(v10, v16, v51);
        BOOL v52 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v52 length]) {
          fputs( (const char *)[v52 UTF8String], *(FILE **)(*(void *)(a1 + 72) + 152));
        }
      }
    }
  }

  else
  {
    fwrite("couldn't describe measurement\n", 0x1EuLL, 1uLL, *(FILE **)(v9 + 160));
    int v16 = 0LL;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 79;
    *a3 = 1;
  }
}

uint64_t _getMeasValue(void *a1, void *a2)
{
  id v3 = a1;
  [v3 value];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v3 value];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 mean];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      uint64_t v10 = 93LL;
      goto LABEL_6;
    }

    [v3 mean];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v7 = v5;
  [v5 doubleValue];
  uint64_t v9 = v8;

  uint64_t v10 = 0LL;
  *a2 = v9;
LABEL_6:

  return v10;
}

id makePDContainers(uint64_t a1, const char *a2, int *a3)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v5 = (void *)MEMORY[0x189603F40];
  [NSString stringWithUTF8String:a2];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v41 = 0LL;
  [v5 dataWithContentsOfFile:v6 options:0 error:&v41];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v41;

  if (v7)
  {
    id v40 = v8;
    [MEMORY[0x1896078D8] JSONObjectWithData:v7 options:3 error:&v40];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v40;

    if (v9)
    {
      [MEMORY[0x189603FC0] dictionaryWithCapacity:0];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        int v12 = 0LL;
        id v17 = 0LL;
        int v15 = 12;
        goto LABEL_36;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v39 = v10;
        [MEMORY[0x189612FF8] containerWithJSONDictionary:v9 error:&v39];
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v13 = v39;

        if (v12)
        {
          [v12 description];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 setObject:v12 forKey:v14];
LABEL_26:

          id v16 = v11;
          id v11 = v16;
          id v17 = 0LL;
          id v10 = v13;
          goto LABEL_38;
        }

        id v17 = 0LL;
        int v15 = 79;
        id v10 = v13;
        goto LABEL_36;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id obj = v9;
        uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          id v29 = v9;
          id v30 = a3;
          int v31 = v7;
          id v17 = 0LL;
          int v12 = 0LL;
          uint64_t v20 = *(void *)v36;
          while (2)
          {
            for (uint64_t i = 0LL; i != v19; ++i)
            {
              double v22 = v17;
              int v23 = v10;
              if (*(void *)v36 != v20) {
                objc_enumerationMutation(obj);
              }
              id v17 = *(id *)(*((void *)&v35 + 1) + 8 * i);

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_29;
              }
              id v34 = v10;
              [MEMORY[0x189612FF8] containerWithJSONDictionary:v17 error:&v34];
              int v24 = (void *)objc_claimAutoreleasedReturnValue();
              id v10 = v34;

              if (!v24)
              {
                int v12 = 0LL;
LABEL_29:
                uint64_t v9 = obj;

                int v15 = 79;
                a3 = v30;
                uint64_t v7 = v31;
                goto LABEL_36;
              }

              int v12 = v24;
              [v24 description];
              double v25 = (void *)objc_claimAutoreleasedReturnValue();
              [v11 objectForKeyedSubscript:v25];
              int v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                if ((*(_BYTE *)(a1 + 184) & 1) == 0) {
                  fprintf( *(FILE **)(a1 + 160), "%s: ignoring (38284416) duplicate result:\n\t%s\n", a2, (const char *)[v25 UTF8String]);
                }
              }

              else
              {
                [v11 setObject:v12 forKey:v25];
              }
            }

            uint64_t v19 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
            if (v19) {
              continue;
            }
            break;
          }

          id v13 = v10;
          uint64_t v7 = v31;
          uint64_t v9 = v29;
        }

        else
        {
          int v12 = 0LL;
          id v13 = v10;
        }

        uint64_t v14 = obj;
        goto LABEL_26;
      }

      int v12 = 0LL;
      id v17 = 0LL;
    }

    else
    {
      int v12 = 0LL;
      id v17 = 0LL;
      id v11 = 0LL;
    }

    int v15 = 79;
  }

  else
  {
    int v12 = 0LL;
    int v15 = *__error();
    if (!v15)
    {
      id v11 = 0LL;
      id v16 = 0LL;
      id v10 = v8;
      uint64_t v9 = 0LL;
      id v17 = 0LL;
      goto LABEL_38;
    }

    id v17 = 0LL;
    uint64_t v9 = 0LL;
    id v10 = v8;
    id v11 = 0LL;
  }

__CFString *makeTestHeader(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v3 variables];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607940] string];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  _outputVariableNames(v3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [MEMORY[0x189604018] setWithArray:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = 0LL;
  }

  uint64_t v24 = MEMORY[0x1895F87A8];
  uint64_t v25 = 3221225472LL;
  int v26 = __makeTestHeader_block_invoke;
  id v27 = &unk_189E3E218;
  id v9 = v8;
  id v28 = v9;
  id v10 = v6;
  id v29 = v10;
  [v5 enumerateKeysAndObjectsUsingBlock:&v24];
  [v4 testDescription];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 name];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = &stru_189E3E578;
  if (![v12 length]) {
    goto LABEL_8;
  }
  uint64_t v14 = v12;
  if ((-[__CFString isEqualToString:](v14, "isEqualToString:", @"perfcheck._default_") & 1) != 0
    || -[__CFString isEqualToString:](v14, "isEqualToString:", @"_libperfcheck_._default_"))
  {

LABEL_8:
    int v15 = 0;
    goto LABEL_9;
  }

  int v22 = -[__CFString hasPrefix:](v14, "hasPrefix:", @"perfcheck.daemon");

  int v15 = v22 ^ 1;
  if (!v22) {
    id v13 = v14;
  }
LABEL_9:
  id v16 = v13;
  if ([v11 length])
  {
    if (v15)
    {
      [NSString stringWithFormat:@"%@: %@", v12, v11, v24, v25, v26, v27, v28];
      id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v17 = v11;
    }

    uint64_t v18 = v17;

    id v16 = v18;
  }

  if ([v10 length])
  {
    if (-[__CFString length](v16, "length")) {
      [NSString stringWithFormat:@"%@\n     with %@", v16, v10];
    }
    else {
      [NSString stringWithFormat:@"     with %@", v10, v23];
    }
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v19 = v16;
  }

  uint64_t v20 = v19;

  return v20;
}

id _outputVariableNames(void *a1)
{
  double v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 objectForKeyedSubscript:@"_pc_output_variables"];
  double v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    warnx("ignoring non-string _pc_output_variables value");
LABEL_5:
    id v3 = 0LL;
    goto LABEL_6;
  }

  [v2 componentsSeparatedByString:@","];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v3;
}

void __makeTestHeader_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (objc_msgSend(v11, "compare:options:range:", @"_pc_", 0, 0, 4)
    && [v11 compare:@"failure_threshold_pct"]
    && ([*(id *)(a1 + 32) containsObject:v11] & 1) == 0)
  {
    if ([*(id *)(a1 + 40) length]) {
      [*(id *)(a1 + 40) appendString:@" "];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v6 = *(void **)(a1 + 40);
      [v5 doubleValue];
      [v6 appendFormat:@"%@=%g", v11, v7];
    }

    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v9 = *(void **)(a1 + 40);
      if ((isKindOfClass & 1) != 0) {
        [v9 appendFormat:@"%@=%@", v11, v5];
      }
      else {
        [v9 appendFormat:@"%@=(unknown type)", v5, v10];
      }
    }
  }
}

id makeMeasurementFooter(void *a1, void *a2, int a3)
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  id v4 = a1;
  id v5 = a2;
  [MEMORY[0x189607940] string];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  _outputVarValues(v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v5)
  {
    __int128 v59 = v6;
    id v60 = v4;
    id v58 = v5;
    _outputVarValues(v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607940] string];
    __int128 v61 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607940] string];
    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607940] string];
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (void *)MEMORY[0x189604018];
    [v8 allKeys];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setWithArray:v11];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 allKeys];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setByAddingObjectsFromArray:v13];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    double v57 = v14;
    [v14 allObjects];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 sortedArrayUsingSelector:sel_localizedStandardCompare_];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    id v17 = v9;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id obj = v16;
    uint64_t v18 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (!v18) {
      goto LABEL_33;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v73;
    uint64_t v68 = v8;
    uint64_t v69 = *(void *)v73;
    __int128 v64 = v9;
    while (1)
    {
      uint64_t v21 = 0LL;
      uint64_t v70 = v19;
      do
      {
        if (*(void *)v73 != v20) {
          objc_enumerationMutation(obj);
        }
        int v22 = *(void **)(*((void *)&v72 + 1) + 8 * v21);
        uint64_t v23 = v17;
        [v17 objectForKeyedSubscript:v22];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 objectForKeyedSubscript:v22];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [v24 count];
        uint64_t v27 = [v25 count];
        uint64_t v28 = v27;
        if (v26) {
          BOOL v29 = v27 == 0;
        }
        else {
          BOOL v29 = 1;
        }
        uint64_t v71 = v25;
        if (v29)
        {
          id v34 = 0LL;
        }

        else
        {
          [MEMORY[0x189607838] setWithArray:v24];
          uint64_t v30 = v28;
          v32 = int v31 = v22;
          [MEMORY[0x189607838] setWithArray:v25];
          int v33 = (void *)objc_claimAutoreleasedReturnValue();
          id v34 = (void *)v32;
          __int128 v35 = (void *)v32;
          int v22 = v31;
          uint64_t v28 = v30;
          [v35 intersectSet:v33];
        }

        id v17 = v23;
        uint64_t v20 = v69;
        uint64_t v36 = v70;
        if (v28 == v26)
        {
          unint64_t v67 = v24;
          id v37 = v34;
          __int128 v80 = 0u;
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          __int128 v83 = 0u;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v80 objects:v86 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            int v40 = 0;
            uint64_t v41 = *(void *)v81;
            do
            {
              for (uint64_t i = 0LL; i != v39; ++i)
              {
                if (*(void *)v81 != v41) {
                  objc_enumerationMutation(v37);
                }
                v40 += [v37 countForObject:*(void *)(*((void *)&v80 + 1) + 8 * i)];
              }

              uint64_t v39 = [v37 countByEnumeratingWithState:&v80 objects:v86 count:16];
            }

            while (v39);
          }

          else
          {
            int v40 = 0;
          }

          BOOL v29 = v26 == v40;
          id v17 = v64;
          uint64_t v20 = v69;
          uint64_t v36 = v70;
          uint64_t v24 = v67;
          if (v29)
          {
            uint64_t v43 = v71;
            _variableDisplayString(v22, v71);
            id v44 = (void *)objc_claimAutoreleasedReturnValue();
            [v61 appendString:v44];
            id v8 = v68;
LABEL_30:

            goto LABEL_31;
          }
        }

        if (v26)
        {
          _variableDisplayStringWithDiffs(v22, v24, v34, a3);
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
          [v63 appendString:v45];
        }

        id v8 = v68;
        uint64_t v43 = v71;
        if (v28)
        {
          _variableDisplayStringWithDiffs(v22, v71, v34, a3);
          id v44 = (void *)objc_claimAutoreleasedReturnValue();
          [v62 appendString:v44];
          goto LABEL_30;
        }

id _outputVarValues(void *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  _outputVariableNames(v1);
  double v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 variables];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC0] dictionary];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        [v3 objectForKeyedSubscript:v10];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ([v11 length])
          {
            [v11 componentsSeparatedByString:@","];
            int v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 setObject:v12 forKeyedSubscript:v10];
          }
        }

        else
        {
          _outputVarValues_cold_1(v10);
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v13 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v7 = v13;
    }

    while (v13);
  }

  return v4;
}

id _variableDisplayString(void *a1, void *a2)
{
  id v3 = (void *)NSString;
  id v4 = a1;
  [a2 componentsJoinedByString:@" "];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"           %@: %@\n", v4, v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id _variableDisplayStringWithDiffs(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = @"\x1B[1m";
  if (a4)
  {
    id v11 = @"\x1B[0m";
  }

  else
  {
    uint64_t v10 = &stru_189E3E578;
    id v11 = &stru_189E3E578;
  }

  uint64_t v28 = v10;
  int v12 = v11;
  [MEMORY[0x189607940] string];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = (void *)[v9 copy];
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v16)
  {

LABEL_19:
    [NSString stringWithFormat:@"           %@: %@\n", v7, v13, v24, v25];
    goto LABEL_20;
  }

  uint64_t v17 = v16;
  id v26 = v9;
  id v27 = v7;
  char v18 = 0;
  uint64_t v19 = *(void *)v30;
  do
  {
    for (uint64_t i = 0LL; i != v17; ++i)
    {
      if (*(void *)v30 != v19) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
      if ([v13 length]) {
        [v13 appendString:@" "];
      }
      if ([v14 containsObject:v21])
      {
        [v14 removeObject:v21];
        [v13 appendFormat:@"%@", v21];
      }

      else
      {
        [v13 appendFormat:@"%@%@%@", v28, v21, v12];
        char v18 = 1;
      }
    }

    uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }

  while (v17);

  id v9 = v26;
  id v7 = v27;
  if ((v18 & 1) == 0) {
    goto LABEL_19;
  }
  [NSString stringWithFormat:@"           %@%@%@: %@\n", v28, v27, v12, v13];
LABEL_20:
  int v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id makeMetricDesc(void *a1)
{
  id v1 = a1;
  _getIgnoredVars(v1);
  double v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 metricFilterIgnoringVariables:v2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _getIgnoredVars(void *a1)
{
  id v1 = a1;
  if (_getIgnoredVars_sInitIgnoredVars != -1) {
    dispatch_once(&_getIgnoredVars_sInitIgnoredVars, &__block_literal_global_0);
  }
  _outputVariableNames(v1);
  double v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    [(id)_getIgnoredVars_sIgnoredVars arrayByAddingObjectsFromArray:v2];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = (id)_getIgnoredVars_sIgnoredVars;
  }

  id v4 = v3;

  return v4;
}

uint64_t areMeasComparable(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x189604018];
  id v4 = a2;
  id v5 = a1;
  _getIgnoredVars(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setWithArray:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v8 = (void *)MEMORY[0x189603FD8];
  _getIgnoredVars(v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setWithArray:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 unionSet:v7];
  [v10 allObjects];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v5 isComparableTo:v4 ignoringVariables:v11];

  return v12;
}

BOOL has_perfdata_v1_ext(const char *a1)
{
  id v1 = strstr(a1, ".perfdata");
  return v1 && !v1[9];
}

uint64_t pc_session_record_values(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = a3;
  int v17 = 0;
  if (a1 && a2 && *(void *)(a1 + 192))
  {
    if (*(int *)(a1 + 8) <= 0)
    {
      unsigned int v18 = 0;
    }

    else
    {
      uint64_t v5 = 0LL;
      uint64_t v13 = a1;
      while (1)
      {
        uint64_t v16 = copy_meas_session(a1, v5, &v17, &v18);
        if (!v16) {
          break;
        }
        uint64_t v14 = v5;
        if (v17 >= 1)
        {
          uint64_t v6 = 0LL;
          id v7 = v16;
          do
          {
            id v8 = &v16[96 * v6];
            if (*(void *)v8)
            {
              pdunit_iorunit(*((void *)v8 + 2));
              pdwriter_new_value();
              if (v8[24]) {
                pdwriter_record_larger_better();
              }
              for (uint64_t i = 0LL; i != 48; i += 16LL)
              {
                uint64_t v10 = *(void *)&v7[i + 40];
                if (v10 == 3 || v10 == 98307 || v10 == 32771) {
                  pdwriter_record_variable_dbl();
                }
              }

              if (*((void *)v8 + 4)) {
                pdwriter_record_variable_str();
              }
              pdwriter_record_variable_str();
              if (v15) {
                (*((void (**)(id, void, void))v15 + 2))(v15, *(void *)v8, *((void *)v8 + 1));
              }
            }

            ++v6;
            v7 += 96;
          }

          while (v6 < v17);
        }

        a1 = v13;
        uint64_t v5 = v14 + 1;
        if (v14 + 1 >= *(int *)(v13 + 8))
        {
          unsigned int v18 = 0;
          free(v16);
          break;
        }
      }
    }
  }

  else
  {
    unsigned int v18 = 22;
  }

  uint64_t v11 = v18;

  return v11;
}

uint64_t pc_session_record_pdfile(uint64_t a1, char *__big)
{
  double v2 = __big;
  if (!__big)
  {
    double v2 = *(const char **)(a1 + 176);
    if (!v2) {
      return 22LL;
    }
  }

  id v4 = strstr(v2, ".perfdata");
  if (v4)
  {
    if (!v4[9]) {
      return 22LL;
    }
  }

  uint64_t v5 = pdwriter_open();
  if (!v5) {
    return *__error();
  }
  uint64_t v6 = v5;
  id v7 = pc_session_copy_description(a1, 0, (int *)&v10);
  if (v7)
  {
    id v8 = v7;
    pdwriter_set_description();
    unsigned int v10 = pc_session_record_values(a1, v6, 0LL);
    free(v8);
  }

  pdwriter_close();
  return v10;
}

uint64_t emit_perfdata_v1(uint64_t a1, char *__big)
{
  int v26 = 0;
  unsigned int v27 = -1;
  id v4 = strstr(__big, ".perfdata");
  if (!v4 || v4[9]) {
    return 22;
  }
  uint64_t v6 = copy_meas_session(a1, 0, &v26, &v27);
  if (!v6) {
    return v27;
  }
  id v7 = (uint64_t *)v6;
  if (v26 < 1)
  {
    int v25 = 14;
LABEL_46:
    unsigned int v27 = v25;
    free(v7);
    return v27;
  }

  id v8 = fopen(__big, "w");
  if (!v8)
  {
    int v25 = *__error();
    goto LABEL_46;
  }

  id v9 = v8;
  if (fputs("{\n  version : 1.0,\n  measurements : {\n    easyperf_metrics : {\n", v8) < 1
    || fprintf(v9, "      description : Easyperf metrics for '%s',\n", (const char *)(a1 + 16)) < 1)
  {
    goto LABEL_42;
  }

  if (v26 >= 1)
  {
    uint64_t v10 = 0LL;
    char v11 = 0;
    uint64_t v12 = (char *)(v7 + 1);
    do
    {
      if (*((void *)v12 - 1))
      {
        if ((v11 & 1) != 0) {
          int v13 = fprintf(v9, ", %s");
        }
        else {
          int v13 = fprintf(v9, "      names : [%s");
        }
        if (v13 <= 0) {
          goto LABEL_42;
        }
        char v11 = 1;
      }

      ++v10;
      v12 += 96;
    }

    while (v10 < v26);
  }

  if (v26 >= 1)
  {
    uint64_t v14 = 0LL;
    char v15 = 0;
    uint64_t v16 = v7;
    int v17 = v7;
    do
    {
      uint64_t v18 = *v17;
      v17 += 12;
      if (v18)
      {
        double v19 = *((double *)v16 + 11);
        if ((v15 & 1) != 0) {
          int v20 = fprintf(v9, ", %.0f", v19);
        }
        else {
          int v20 = fprintf(v9, "      data : [%.0f", v19);
        }
        if (v20 <= 0) {
          goto LABEL_42;
        }
        char v15 = 1;
      }

      ++v14;
      uint64_t v16 = v17;
    }

    while (v14 < v26);
  }

  if (v26 >= 1)
  {
    uint64_t v21 = 0LL;
    char v22 = 0;
    uint64_t v23 = v7 + 2;
    do
    {
      if (*(v23 - 2))
      {
        unitstr_iorunit(*v23);
        if ((v22 & 1) != 0) {
          int v24 = fprintf(v9, ", %s");
        }
        else {
          int v24 = fprintf(v9, "      units : [%s");
        }
        if (v24 <= 0) {
          goto LABEL_42;
        }
        char v22 = 1;
      }

      ++v21;
      v23 += 12;
    }

    while (v21 < v26);
  }

  if (fprintf(v9, "]\n") <= 0 || fputs("    }\n  }\n}\n", v9) <= 0) {
LABEL_42:
  }
    unsigned int v27 = *__error();
  else {
    unsigned int v27 = 0;
  }
  free(v7);
  fclose(v9);
  return v27;
}

void ___getIgnoredVars_block_invoke()
{
  pid_t v0 = (void *)_getIgnoredVars_sIgnoredVars;
  _getIgnoredVars_sIgnoredVars = (uint64_t)&unk_189E3E9B8;
}

void *session_find_custom_metric_id(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a1 + 136);
  if (result)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 144);
    if ((int)v4 < 1)
    {
      return 0LL;
    }

    else
    {
      while (*result != a2)
      {
        result += 7;
        if (!--v4) {
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t get_name_metricid(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    double v2 = *(void **)(a1 + 120);
    if (!v2) {
      return 0LL;
    }
    int v3 = *(_DWORD *)(a1 + 128);
  }

  else
  {
    double v2 = &s_all_known_metrics;
    int v3 = 8;
  }

  uint64_t v4 = v3;
  uint64_t v5 = (uint64_t)v2 + 88 * v3 + 8;
  uint64_t v6 = v4 + 1;
  while (--v6)
  {
    uint64_t v7 = v5 - 88;
    uint64_t v8 = *(void *)(v5 - 96);
    v5 -= 88LL;
    if (v8 == a2) {
      return *(void *)v7;
    }
  }

  return 0LL;
}

uint64_t get_metricid_name(uint64_t a1, char *__s1)
{
  if (a1)
  {
    int v3 = *(_DWORD *)(a1 + 128);
    if (v3 < 1) {
      return 0LL;
    }
    uint64_t v4 = *(char **)(a1 + 120);
  }

  else
  {
    uint64_t v4 = (char *)&s_all_known_metrics;
    int v3 = 8;
  }

  uint64_t v5 = v3;
  for (uint64_t i = (const char **)(v4 + 8); strcmp(__s1, *i); i += 11)
  {
    if (!--v5) {
      return 0LL;
    }
  }

  return (uint64_t)*(i - 1);
}

const char *pdunit_iorunit(uint64_t a1)
{
  uint64_t result = 0LL;
  if (a1 > 0x9008BFFFFFFFFFFLL)
  {
    if (a1 == 0x9008C0000000000LL)
    {
      uint64_t v3 = MEMORY[0x189613000];
      return *(const char **)v3;
    }

    if (a1 == 0x6600008200000000LL)
    {
      uint64_t v3 = MEMORY[0x189613008];
      return *(const char **)v3;
    }
  }

  else if (a1)
  {
    if (a1 == 0x100007600000000LL)
    {
      uint64_t v3 = MEMORY[0x189613010];
      return *(const char **)v3;
    }
  }

  else
  {
    return "#none";
  }

  return result;
}

const char *unitstr_iorunit(uint64_t a1)
{
  if (a1 > 0x9008BFFFFFFFFFFLL)
  {
    if (a1 != 0x9008C0000000000LL)
    {
      if (a1 == 0x6600008200000000LL) {
        return "kI";
      }
      return "unknown";
    }

    return "kB";
  }

  else
  {
    if (a1)
    {
      if (a1 == 0x100007600000000LL) {
        return "ns";
      }
      return "unknown";
    }

    return "";
  }

const char *scaled_unitstr(uint64_t a1, double *a2, double *a3, double a4, double a5)
{
  if (a1 > 0x9008BFFFFFFFFFFLL)
  {
    if (a1 == 0x9008C0000000000LL)
    {
      uint64_t result = "kB";
      if (a2) {
        goto LABEL_17;
      }
    }

    else
    {
      if (a1 != 0x6600008200000000LL)
      {
LABEL_16:
        uint64_t result = "unknown";
        if (!a2) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }

      uint64_t result = "kI";
      if (a2) {
        goto LABEL_17;
      }
    }

LABEL_18:
    if (!a3) {
      return result;
    }
    goto LABEL_19;
  }

  if (!a1)
  {
    uint64_t result = "";
    if (!a2) {
      goto LABEL_18;
    }
LABEL_17:
    *a2 = a4;
    goto LABEL_18;
  }

  if (a1 != 0x100007600000000LL) {
    goto LABEL_16;
  }
  if (a2) {
    *a2 = a4 / 1000000.0;
  }
  if (!a3) {
    return "ms";
  }
  uint64_t result = "ms";
  a5 = a5 / 1000000.0;
LABEL_19:
  *a3 = a5;
  return result;
}

uint64_t add_metric(uint64_t a1, void **a2, int *a3, uint64_t a4)
{
  return _add_metric(a4, a1, a2, a3, 0LL);
}

uint64_t _add_metric(uint64_t a1, uint64_t a2, void **a3, int *a4, char **a5)
{
  uint64_t v5 = 22LL;
  if (!a3) {
    return v5;
  }
  uint64_t v6 = a4;
  if (!a4) {
    return v5;
  }
  uint64_t v7 = a5;
  id v9 = (char *)*a3;
  if (*a3)
  {
    uint64_t v10 = *a4;
    char v11 = &v9[88 * (int)v10];
    uint64_t v12 = v10 + 1;
    while (--v12)
    {
      int v13 = v11 - 88;
      uint64_t v14 = *((void *)v11 - 11);
      v11 -= 88;
      if (v14 == a2)
      {
        if (!a5) {
          return 0LL;
        }
        uint64_t v5 = 0LL;
        *a5 = v13;
        return v5;
      }
    }
  }

  uint64_t v15 = 792LL;
  do
  {
    uint64_t v16 = v15 - 88;
    if (v15 == 88)
    {
      if (!a1) {
        return 22LL;
      }
      uint64_t v19 = *(void *)(a1 + 136);
      if (!v19) {
        return 22LL;
      }
      uint64_t v20 = *(unsigned int *)(a1 + 144);
      while (*(void *)v19 != a2)
      {
        v19 += 56LL;
        uint64_t v5 = 22LL;
        if (!--v20) {
          return v5;
        }
      }

      uint64_t v18 = 0LL;
      if (v9) {
        goto LABEL_24;
      }
      goto LABEL_27;
    }

    uint64_t v17 = *(void *)((char *)&s_all_known_metrics + v15 - 176);
    v15 -= 88LL;
  }

  while (v17 != a2);
  uint64_t v18 = (char *)&s_all_known_metrics + v16 - 88;
  if (a2 == 0x637075696E737472LL)
  {
    uint64_t v19 = 0LL;
    if (!*a3) {
      goto LABEL_27;
    }
LABEL_24:
    int v21 = *v6;
    goto LABEL_28;
  }

  uint64_t v19 = 0LL;
  if (v9) {
    goto LABEL_24;
  }
LABEL_27:
  int v21 = 0;
LABEL_28:
  char v22 = (char *)calloc(v21 + 1, 0x58uLL);
  if (!v22) {
    return *__error();
  }
  uint64_t v23 = v22;
  uint64_t v24 = v21;
  int v58 = v21 + 1;
  if (v21 < 1)
  {
    LODWORD(v25) = 0;
    if (v16)
    {
LABEL_39:
      uint64_t v38 = &v23[88 * v25];
      __int128 v39 = *((_OWORD *)v18 + 1);
      *(_OWORD *)uint64_t v38 = *(_OWORD *)v18;
      *((_OWORD *)v38 + 1) = v39;
      __int128 v40 = *((_OWORD *)v18 + 2);
      __int128 v41 = *((_OWORD *)v18 + 3);
      __int128 v42 = *((_OWORD *)v18 + 4);
      *((void *)v38 + 10) = *((void *)v18 + 10);
      *((_OWORD *)v38 + 3) = v41;
      *((_OWORD *)v38 + 4) = v42;
      *((_OWORD *)v38 + 2) = v40;
      goto LABEL_44;
    }
  }

  else
  {
    int v56 = v6;
    double v57 = v7;
    uint64_t v25 = 0LL;
    int v26 = v18;
    char v27 = 0;
    double v55 = v26;
    uint64_t v28 = (const char **)(v26 + 32);
    if (v16) {
      __int128 v29 = v28;
    }
    else {
      __int128 v29 = (const char **)(v19 + 24);
    }
    uint64_t v30 = 32LL;
    while (1)
    {
      __int128 v31 = (char *)*a3;
      int v32 = strcmp(*(const char **)((char *)*a3 + v30), *v29);
      if ((v27 & 1) != 0)
      {
        if (v32) {
          break;
        }
      }

      v27 |= v32 == 0;
      int v33 = &v23[v30];
      __int128 v34 = *(_OWORD *)&v31[v30 - 16];
      *((_OWORD *)v33 - 2) = *(_OWORD *)&v31[v30 - 32];
      *((_OWORD *)v33 - 1) = v34;
      __int128 v35 = *(_OWORD *)&v31[v30];
      __int128 v36 = *(_OWORD *)&v31[v30 + 16];
      __int128 v37 = *(_OWORD *)&v31[v30 + 32];
      *((void *)v33 + 6) = *(void *)&v31[v30 + 48];
      *((_OWORD *)v33 + 1) = v36;
      *((_OWORD *)v33 + 2) = v37;
      *(_OWORD *)int v33 = v35;
      ++v25;
      v30 += 88LL;
      if (v24 == v25)
      {
        LODWORD(v25) = v24;
        break;
      }
    }

    uint64_t v6 = v56;
    uint64_t v7 = v57;
    uint64_t v18 = v55;
    if (v16) {
      goto LABEL_39;
    }
  }

  if (v19)
  {
    uint64_t v43 = &v23[88 * v25];
    uint64_t v44 = *(void *)(v19 + 8);
    uint64_t v45 = *(void *)(v19 + 16);
    uint64_t v46 = *(void *)(v19 + 24);
    *(void *)uint64_t v43 = *(void *)v19;
    *((void *)v43 + 1) = v45;
    *((void *)v43 + 2) = v44;
    *((void *)v43 + 4) = v46;
    v43[24] = *(_BYTE *)(v19 + 32);
  }

LABEL_44:
  if ((int)v25 < (int)v24)
  {
    uint64_t v47 = 88LL * v25;
    do
    {
      uint64_t v48 = (uint64_t)&v23[v47 + 88];
      uint64_t v49 = (char *)*a3 + v47;
      __int128 v50 = *((_OWORD *)v49 + 1);
      *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
      *(_OWORD *)(v48 + 16) = v50;
      __int128 v51 = *((_OWORD *)v49 + 2);
      __int128 v52 = *((_OWORD *)v49 + 3);
      __int128 v53 = *((_OWORD *)v49 + 4);
      *(void *)(v48 + 80) = *((void *)v49 + 10);
      *(_OWORD *)(v48 + 4_Block_object_dispose(&STACK[0x220], 8) = v52;
      *(_OWORD *)(v48 + 64) = v53;
      *(_OWORD *)(v48 + 32) = v51;
      v47 += 88LL;
      LODWORD(v25) = v25 + 1;
    }

    while ((int)v24 > (int)v25);
  }

  if (*a3) {
    free(*a3);
  }
  *a3 = v23;
  int *v6 = v58;
  if (!v7) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  *uint64_t v7 = v18;
  return v5;
}

uint64_t pc_session_add_metric(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 192)) {
    return 37LL;
  }
  if (a2 == 0x6D656D64656C7461LL) {
    uint64_t v4 = 0x6375726D656D0000LL;
  }
  else {
    uint64_t v4 = a2;
  }
  if (v4 != 0x7065616B646C7461LL) {
    return _add_metric(a1, v4, (void **)(a1 + 120), (int *)(a1 + 128), 0LL);
  }
  uint64_t result = _add_metric(a1, 0x6375726D656D0000LL, (void **)(a1 + 120), (int *)(a1 + 128), 0LL);
  if (!(_DWORD)result) {
    return _add_metric(a1, v4, (void **)(a1 + 120), (int *)(a1 + 128), 0LL);
  }
  return result;
}

uint64_t set_threshold(uint64_t a1, int a2, uint64_t a3, int a4, double a5)
{
  uint64_t v5 = 22LL;
  if (!a1 || a2 < 3) {
    return v5;
  }
  unint64_t v6 = a3 & 0xFFFFFFFEFFFFFFFFLL;
  if ((uint64_t)(a3 & 0xFFFFFFFEFFFFFFFFLL) <= 32782)
  {
    if (v6 != 3)
    {
      uint64_t v7 = 32771LL;
      goto LABEL_9;
    }

    a1 += 32LL;
  }

  else if (v6 != 98319 && v6 != 98307)
  {
    uint64_t v7 = 32783LL;
LABEL_9:
    if (v6 != v7) {
      return v5;
    }
    a1 += 16LL;
  }

  if (*(void *)a1 && !a4) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  *(void *)a1 = a3;
  *(double *)(a1 + _Block_object_dispose(&STACK[0x220], 8) = a5;
  return v5;
}

uint64_t pc_session_set_threshold(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t result = 22LL;
  if (a1 && a2)
  {
    uint64_t v8 = *(void *)(a1 + 120);
    id v9 = (int *)(a1 + 128);
    if (v8)
    {
      uint64_t v10 = *v9;
      uint64_t v11 = v8 + 88LL * (int)v10;
      uint64_t v12 = v10 + 1;
      while (--v12)
      {
        int v13 = (char *)(v11 - 88);
        uint64_t v14 = *(void *)(v11 - 88);
        v11 -= 88LL;
        if (v14 == a2) {
          goto LABEL_10;
        }
      }
    }

    uint64_t v18 = 0LL;
    uint64_t result = _add_metric(a1, a2, (void **)(a1 + 120), v9, &v18);
    if (!(_DWORD)result)
    {
      int v13 = v18;
LABEL_10:
      unint64_t v15 = a3 & 0xFFFFFFFEFFFFFFFFLL;
      uint64_t result = 22LL;
      if ((uint64_t)(a3 & 0xFFFFFFFEFFFFFFFFLL) <= 32782)
      {
        if (v15 != 3)
        {
          uint64_t v17 = 32771LL;
          goto LABEL_16;
        }

        uint64_t v16 = v13 + 72;
      }

      else
      {
        uint64_t v16 = v13 + 40;
        if (v15 != 98319 && v15 != 98307)
        {
          uint64_t v17 = 32783LL;
LABEL_16:
          if (v15 != v17) {
            return result;
          }
          uint64_t v16 = v13 + 56;
        }
      }

      uint64_t result = 0LL;
      *(void *)uint64_t v16 = a3;
      *((double *)v16 + 1) = a4;
    }
  }

  return result;
}

uint64_t pc_session_set_default_thresholds(uint64_t a1)
{
  if (!a1) {
    return 22LL;
  }
  if (*(int *)(a1 + 128) >= 1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = (void *)(*(void *)(a1 + 120) + 48LL);
    do
    {
      if (*(v3 - 6) != 0x63707574696D6500LL || (is_monotonic_active() & 1) == 0)
      {
        *(v3 - 1) = 0x10001800FLL;
        *uint64_t v3 = 0x4024000000000000LL;
      }

      v3 += 11;
      ++v2;
    }

    while (v2 < *(int *)(a1 + 128));
  }

  return 0LL;
}

uint64_t pc_session_clear_thresholds(uint64_t a1)
{
  if (!a1) {
    return 22LL;
  }
  if (*(int *)(a1 + 128) >= 1)
  {
    uint64_t v1 = 0LL;
    uint64_t v2 = 40LL;
    do
    {
      uint64_t v3 = (_OWORD *)(*(void *)(a1 + 120) + v2);
      v3[1] = 0uLL;
      v3[2] = 0uLL;
      *uint64_t v3 = 0uLL;
      ++v1;
      v2 += 88LL;
    }

    while (v1 < *(int *)(a1 + 128));
  }

  return 0LL;
}

uint64_t get_thresholds(uint64_t a1, uint64_t a2, _DWORD *a3, int *a4)
{
  int v4 = 22;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 120);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 128);
      uint64_t v7 = v5 + 88LL * (int)v6 + 40;
      uint64_t v8 = v6 + 1;
      while (--v8)
      {
        uint64_t result = v7 - 88;
        uint64_t v10 = *(void *)(v7 - 128);
        v7 -= 88LL;
        if (v10 == a2)
        {
          *a3 = 3;
          return result;
        }
      }
    }

    int v4 = 93;
  }

  uint64_t result = 0LL;
  if (a4) {
    *a4 = v4;
  }
  return result;
}

char *create_meas_metrics(uint64_t a1, int a2, int *a3)
{
  if (a1)
  {
    uint64_t v5 = a1;
    uint64_t result = (char *)calloc(a2, 0x60uLL);
    if (result)
    {
      if (a2 >= 1)
      {
        uint64_t v7 = 0LL;
        do
        {
          uint64_t v8 = &result[v7];
          __int128 v9 = *(_OWORD *)(v5 + 16);
          *(_OWORD *)uint64_t v8 = *(_OWORD *)v5;
          *((_OWORD *)v8 + 1) = v9;
          __int128 v10 = *(_OWORD *)(v5 + 32);
          __int128 v11 = *(_OWORD *)(v5 + 64);
          uint64_t v12 = *(void *)(v5 + 80);
          *((_OWORD *)v8 + 3) = *(_OWORD *)(v5 + 48);
          *((_OWORD *)v8 + 4) = v11;
          *((_OWORD *)v8 + 2) = v10;
          *((void *)v8 + 10) = v12;
          *((void *)v8 + 11) = 0LL;
          v5 += 88LL;
          v7 += 96LL;
        }

        while (96LL * a2 != v7);
      }

      return result;
    }

    int v13 = *__error();
  }

  else
  {
    int v13 = 22;
  }

  uint64_t result = 0LL;
  if (a3 && v13)
  {
    uint64_t result = 0LL;
    *a3 = v13;
  }

  return result;
}

uint64_t custom_metric_clean_up(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 16);
    if (v2)
    {
      free(v2);
      *(void *)(a1 + 16) = 0LL;
    }

    uint64_t v3 = *(void **)(a1 + 24);
    if (v3)
    {
      free(v3);
      *(void *)(a1 + 24) = 0LL;
    }
  }

  return 0LL;
}

uint64_t pc_session_add_custom_metric( uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 22LL;
  if (a1 && a2 && a4 && a5 && a6)
  {
    uint64_t v14 = *(uint64_t **)(a1 + 136);
    int v15 = *(_DWORD *)(a1 + 144);
    if (v14 && v15 >= 1)
    {
      uint64_t v16 = *(unsigned int *)(a1 + 144);
      while (1)
      {
        uint64_t v17 = *v14;
        v14 += 7;
        if (v17 == a2) {
          return 37LL;
        }
        if (!--v16) {
          goto LABEL_11;
        }
      }
    }

    else
    {
LABEL_11:
      int v18 = *(_DWORD *)(a1 + 144);
      uint64_t v19 = calloc(v15 + 1LL, 0x38uLL);
      if (v19)
      {
        uint64_t v20 = v19;
        if (*(_DWORD *)(a1 + 144)) {
          memcpy(v19, *(const void **)(a1 + 136), 56LL * v15);
        }
        else {
          int v18 = v15;
        }
        int v21 = *(void **)(a1 + 136);
        if (v21) {
          free(v21);
        }
        *(void *)(a1 + 136) = v20;
        *(_DWORD *)(a1 + 144) = v15 + 1;
        v20[7 * v18] = a2;
        char v22 = &v20[7 * v18];
        v22[1] = a3;
        v22[2] = strdup(a4);
        v22[3] = strdup(a5);
        v22[5] = a6;
        v22[6] = a7;
        return pc_session_add_metric(a1, a2);
      }

      else
      {
        return *__error();
      }
    }
  }

  return result;
}

void print_metric_value_cold_1(int a1)
{
}

void _outputVarValues_cold_1(void *a1)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602650](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602668](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602688]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1896026A0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A70](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602AA0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB8](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B98](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BE8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602BF8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D38](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602E98](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F00]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F18](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FC8](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030E8](cf);
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033B8](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603460](alloc, cStr, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603508](theString, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603598]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895F95F8](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int pause(void)
{
  return MEMORY[0x1895FC770]();
}

uint64_t pdwriter_close()
{
  return MEMORY[0x189613018]();
}

uint64_t pdwriter_new_value()
{
  return MEMORY[0x189613020]();
}

uint64_t pdwriter_open()
{
  return MEMORY[0x189613028]();
}

uint64_t pdwriter_record_larger_better()
{
  return MEMORY[0x189613030]();
}

uint64_t pdwriter_record_variable_dbl()
{
  return MEMORY[0x189613038]();
}

uint64_t pdwriter_record_variable_str()
{
  return MEMORY[0x189613040]();
}

uint64_t pdwriter_set_description()
{
  return MEMORY[0x189613048]();
}

int posix_spawnp( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1895FC868](a1, a2, a3, a4, __argv, __envp);
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8C0](*(void *)&type, *(void *)&typeinfo, buffer, *(void *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1895FC8D0](*(void *)&pid, *(void *)&flavor, buffer);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x1895FC900]();
}

int putchar(int a1)
{
  return MEMORY[0x1895FCB88](*(void *)&a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1895FCF50](*(void *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1895FD128](__stringp, __delim);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1895FD638](*(void *)&a1, a2, *(void *)&a3);
}

void warn(const char *a1, ...)
{
}

void warnc(int a1, const char *a2, ...)
{
}

void warnx(const char *a1, ...)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}