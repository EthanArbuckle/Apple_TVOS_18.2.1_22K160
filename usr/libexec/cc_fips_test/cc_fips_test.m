__int128 *sub_100003428(int a1)
{
  int v1;
  strcpy((char *)&qword_100008108, "Apple ARM");
  dword_100008100 = 3230803;
  switch(a1)
  {
    case 0:
      snprintf((char *)&xmmword_100008000, 0x100uLL, "%s v%s [%s, %s, %s, %s]", "Apple corecrypto Module");
      break;
    case 1:
      strcpy((char *)&xmmword_100008000, "Apple corecrypto Module");
      break;
    case 2:
      BYTE4(xmmword_100008000) = 0;
      v1 = 808334385;
      goto LABEL_7;
    case 3:
      BYTE4(xmmword_100008000) = 0;
      v1 = 1919251285;
LABEL_7:
      LODWORD(xmmword_100008000) = v1;
      break;
    case 4:
      strcpy((char *)&xmmword_100008000, "Software");
      break;
    case 5:
    case 6:
      snprintf((char *)&xmmword_100008000, 0x100uLL, "%s");
      break;
    default:
      strcpy((char *)&xmmword_100008000, "INVALID Module ID");
      break;
  }

  return &xmmword_100008000;
}

uint64_t start(int a1, const char **a2)
{
  uint64_t v18 = 0LL;
  __filename = 0LL;
  cc_clear(16LL, &v18);
  if (a1 >= 2)
  {
    LODWORD(v4) = 1;
    while (1)
    {
      v5 = a2[(int)v4];
      if (strcmp(v5, "-v") && strcmp(v5, "--verbose") && strcmp(v5, "-f") && strcmp(v5, "--force"))
      {
        if (!strcmp(v5, "-b") || !strcmp(v5, "--boot-arg"))
        {
          sub_1000039B4(&v18);
        }

        else
        {
          if (!strcmp(v5, "-d") || !strcmp(v5, "--disable"))
          {
            int v6 = v18 | 4;
          }

          else if (!strcmp(v5, "-F") || !strcmp(v5, "--fail"))
          {
            int v6 = v18 | 0x10;
          }

          else
          {
            if (strcmp(v5, "-N") && strcmp(v5, "--nointegrity"))
            {
              if (!strcmp(v5, "-m") || !strcmp(v5, "--mode"))
              {
                uint64_t v4 = (int)v4 + 1LL;
                LODWORD(v18) = strtoll(a2[v4], 0LL, 10);
              }

              else
              {
                if (strcmp(v5, "-t") && strcmp(v5, "--trace")) {
                  sub_100003A14(a2);
                }
                LODWORD(v18) = v18 | 0x80;
                uint64_t v4 = (int)v4 + 1LL;
                __filename = (char *)a2[v4];
              }

              goto LABEL_25;
            }

            int v6 = v18 | 0x40;
          }

          LODWORD(v18) = v6;
        }
      }

LABEL_25:
      LODWORD(v4) = v4 + 1;
    }
  }

  sub_1000039B4(&v18);
LABEL_29:
  uint64_t v7 = v18;
  uint64_t v8 = fipspost_trace_vtable;
  fwrite("About to call the FIPS_POST function in the corecrypto.dylib\n", 0x3DuLL, 1uLL, __stderrp);
  if ((v7 & 0x80) != 0)
  {
    if (v8)
    {
      v11 = __stderrp;
      if (__filename)
      {
        fwrite("Tracing: enabled\n", 0x11uLL, 1uLL, __stderrp);
        v10 = fopen(__filename, "w");
        (*(void (**)(uint64_t, uint64_t (*)(FILE *, void *, size_t), FILE *))v8)( v7,  sub_100003A58,  v10);
        goto LABEL_36;
      }

      v17 = "Tracing: disabled, no trace file.\n";
    }

    else
    {
      v11 = __stderrp;
      v17 = "Tracing: disabled, not available.\n";
    }

    fwrite(v17, 0x22uLL, 1uLL, v11);
    fwrite("Tracing required by test parameters; exiting.\n", 0x2EuLL, 1uLL, __stderrp);
    exit(-1);
  }

  v9 = ", but available.";
  if (!v8) {
    v9 = "";
  }
  fprintf(__stderrp, "Tracing: disabled%s\n", v9);
  v10 = 0LL;
LABEL_36:
  memset(&v20, 0, sizeof(v20));
  if (dladdr(&_fipspost_post, &v20))
  {
    dli_fbase = v20.dli_fbase;
  }

  else
  {
    fwrite("dladdr failed\n", 0xEuLL, 1uLL, __stderrp);
    dli_fbase = 0LL;
  }

  uint64_t v13 = fipspost_post(v7, dli_fbase);
  v14 = "false";
  if (!(_DWORD)v13) {
    v14 = "true";
  }
  fprintf(__stderrp, "Returned from calling the FIPS_POST function in the corecrypto.dylib: result = %s\n", v14);
  if ((_DWORD)v13) {
    fwrite("FIPS_POST failed!\n", 0x12uLL, 1uLL, __stderrp);
  }
  if (v10)
  {
    int v15 = (*(uint64_t (**)(uint64_t))(v8 + 8))(v13);
    fprintf(__stderrp, "Tracing returned: %d\n", v15);
    fclose(v10);
  }

  return v13;
}

uint64_t sub_1000039B4(_DWORD *a1)
{
  uint64_t v4 = 0LL;
  uint64_t result = os_parse_boot_arg_int("fips_mode", &v4);
  if ((_DWORD)result)
  {
    int v3 = v4;
    *a1 = v4;
    return fprintf(__stderrp, "A fips_mode boot arg was set: 0x%x\n", v3);
  }

  return result;
}

void sub_100003A14(const char **a1)
{
  v1 = __stderrp;
  v2 = *a1;
  int v3 = sub_100003428(0);
  fprintf( v1,  "Usage: %s [-dFN] [-m mode] [-t trace.out]\n \n Execute the FIPS POST tests under a variety of conditions.\n \t-b,--boot-arg   \tRead the fips_mode boot arg.\n \t-d,--disable    \tDisable testing and return success.\n \t-F,--fail       \tForce tests to fail, but continue testing.\n \t-N,--nointegrity\tBypass the integrity checks.\n \t-m,--mode mode  \tSpecify a discrete numerical fips_mode to test.\n \t-t,--trace file \tLog tracing output, if available, to the filename.\n \t                \tReturn an error if tracing is disabled.\n %s\n",  v2,  (const char *)v3);
  exit(-1);
}

uint64_t sub_100003A58(FILE *__stream, void *__ptr, size_t a3)
{
  if (fwrite(__ptr, 1uLL, a3, __stream) == a3) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}