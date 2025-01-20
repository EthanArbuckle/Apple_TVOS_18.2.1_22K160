uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  char v5;
  const char **v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  Dl_info v11;
  v4 = objc_autoreleasePoolPush();
  openlog("MIDIServer", 9, 8);
  if (dladdr(start, &v11))
  {
    if (a1 < 2)
    {
      v5 = 0;
    }

    else
    {
      v5 = 0;
      v6 = (const char **)(a2 + 8);
      v7 = a1 - 1LL;
      do
      {
        v8 = *v6;
        if (!strcmp(*v6, "-n")) {
          v5 = 1;
        }
        else {
          fprintf(__stderrp, "unknown argument: %s\n", v8);
        }
        ++v6;
        --v7;
      }

      while (v7);
    }

    MIDIServerRun(v11.dli_fname, v5 & 1);
    v9 = 0LL;
  }

  else
  {
    v9 = 1LL;
    fwrite("dladdr(main) failed\n", 0x14uLL, 1uLL, __stderrp);
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}