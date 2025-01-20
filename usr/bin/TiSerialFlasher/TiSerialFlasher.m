uint64_t sub_100003A6C(uint64_t result)
{
  if (dword_100008008) {
    return printf("<%3d%%>", result);
  }
  return result;
}

const char *sub_100003AA0(const char *result, va_list a2)
{
  if (dword_100008000) {
    return (const char *)vprintf(result, a2);
  }
  return result;
}

uint64_t sub_100003AB4()
{
  return puts("       -d <devicePath> to override the serial device used for firmware upgrade");
}

uint64_t start(int a1, char *const *a2)
{
  for (int i = getopt(a1, a2, "pqf:d:") << 24; i != -16777216; int i = getopt(a1, a2, "pqf:d:") << 24)
  {
    int v5 = i >> 24;
    if (v5 > 111)
    {
      if (v5 == 113)
      {
        dword_100008000 = 0;
      }

      else
      {
        if (v5 != 112) {
          goto LABEL_15;
        }
        dword_100008008 = 1;
      }
    }

    else if (v5 == 100)
    {
      qword_100008018 = (uint64_t)optarg;
    }

    else
    {
      if (v5 != 102) {
        goto LABEL_15;
      }
      qword_100008010 = (uint64_t)optarg;
    }
  }

  if (a1 > optind)
  {
    v6 = (const char **)&a2[optind];
    int v7 = a1 - optind;
    do
    {
      v8 = *v6++;
      printf("unrecognized non-option argument %s\n", v8);
      --v7;
    }

    while (v7);
LABEL_15:
    sub_100003AB4();
    uint64_t v9 = 12LL;
    goto LABEL_29;
  }

  v10 = dlopen("libTiSerialFlasher.dylib", 5);
  if (!v10)
  {
    printf("Error loading dynamic library %s!\n", "libTiSerialFlasher.dylib");
LABEL_28:
    uint64_t v9 = 13LL;
LABEL_29:
    printf("TiSerialFlasher FAILED - Exiting with status %d\n", v9);
    return v9;
  }

  v11 = v10;
  v12 = (uint64_t (*)(uint64_t (*)(uint64_t), const char *(*)(const char *, va_list), uint64_t, uint64_t, void))dlsym(v10, "TiSerialFlasher");
  if (!v12)
  {
    puts("Error finding lib function!");
    dlclose(v11);
    goto LABEL_28;
  }

  v13 = v12;
  if (dword_100008008) {
    v14 = sub_100003A6C;
  }
  else {
    v14 = 0LL;
  }
  if (dword_100008000) {
    v15 = sub_100003AA0;
  }
  else {
    v15 = 0LL;
  }
  uint64_t v9 = v13(v14, v15, qword_100008010, qword_100008018, 0LL);
  dlclose(v11);
  if ((_DWORD)v9) {
    goto LABEL_29;
  }
  puts("TiSerialFlasher success!");
  return v9;
}