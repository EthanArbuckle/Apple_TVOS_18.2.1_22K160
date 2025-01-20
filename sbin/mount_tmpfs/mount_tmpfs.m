uint64_t start(int a1, char *const *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  const char *v13;
  pid_t v14;
  uint64_t v15;
  FILE *v16;
  char *v17;
  uint64_t v18;
  vm_size_t v20;
  unint64_t v21;
  FILE *v22;
  int v23;
  int *v24;
  char *v25;
  vm_size_t v26;
  vm_size_t v27;
  uint64_t v28;
  int *v29;
  int v30[2];
  int v31[2];
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  unint64_t v35;
  vfsconf __endptr;
  v4 = getopt(a1, a2, "io:en:s:h") << 24;
  if (v4 == -16777216)
  {
    *(void *)v30 = 0LL;
    LODWORD(v5) = 0;
    v6 = 0LL;
    v7 = 0LL;
LABEL_33:
    if (optind != a1 - 1 || (v30[1] & v5 & 1) != 0)
    {
LABEL_35:
      puts("usage: mount_tmpfs [-o options] [-i | -e] [-n max_nodes] [-s max_mem_size] <directory>");
      return 64LL;
    }

    v13 = a2[optind];
    if (getvfsbyname("tmpfs", &__endptr))
    {
      v14 = fork();
      if (v14 == -1) {
        goto LABEL_41;
      }
      if (!v14)
      {
        execl("/sbin/kextload", "/sbin/kextload", "/System/Library/Extensions/tmpfs.kext", 0LL);
        v29 = __error();
        exit(*v29);
      }

      if (wait4(v14, v31, 0, 0LL) != v14 || (v31[0] & 0x7F) != 0)
      {
LABEL_41:
        v15 = *__error();
        if ((_DWORD)v15)
        {
LABEL_42:
          fprintf(__stderrp, "could not load kernel extension, return code %d\n", v15);
          return v15;
        }
      }

      else
      {
        v15 = BYTE1(v31[0]);
        if (BYTE1(v31[0])) {
          goto LABEL_42;
        }
      }

      if (getvfsbyname("tmpfs", &__endptr)) {
        sub_100003C4C();
      }
    }

    v35 = 0LL;
    v20 = vm_kernel_page_size;
    v34 = 8LL;
    if (sysctlbyname("hw.memsize", &v35, &v34, 0LL, 0LL))
    {
      v21 = 1000000 * v20;
      v22 = __stderrp;
      v23 = *__error();
      v24 = __error();
      v25 = strerror(*v24);
      fprintf(v22, "Could not get the hw memory size, errno = %d (%s)\n", v23, v25);
    }

    else
    {
      v21 = v35 >> 1;
    }

    v26 = vm_kernel_page_size;
    if (v6)
    {
      v27 = (v6 + vm_kernel_page_size - 1) / vm_kernel_page_size * vm_kernel_page_size;
      if (v27 <= v21)
      {
        v21 = (v6 + vm_kernel_page_size - 1) / vm_kernel_page_size * vm_kernel_page_size;
      }

      else
      {
        fprintf(__stderrp, "Desired memsize %lld too large - defaulting to %lld bytes\n", v27, v21);
        v26 = vm_kernel_page_size;
      }
    }

    v28 = 100000LL;
    if (v7) {
      v28 = v7;
    }
    *(void *)v31 = v21 / v26;
    v32 = v28;
    v33 = (LOBYTE(v30[1]) ^ 1) & 1;
    if (mount("tmpfs", v13, v30[0], v31)) {
      sub_100003C34();
    }
    return 0LL;
  }

  v7 = 0LL;
  v6 = 0LL;
  v8 = 0LL;
  *(void *)v30 = 0LL;
  while (2)
  {
    v5 = 1LL;
    switch(v4 >> 24)
    {
      case 'e':
        v30[1] = 1;
        goto LABEL_15;
      case 'h':
        puts("usage: mount_tmpfs [-o options] [-i | -e] [-n max_nodes] [-s max_mem_size] <directory>");
        return 0LL;
      case 'i':
        goto LABEL_32;
      case 'n':
        v7 = strtoll(optarg, 0LL, 10);
        v5 = v8;
        if (v7 > 0) {
          goto LABEL_32;
        }
        v16 = __stderrp;
        v17 = optarg;
        v18 = 110LL;
        goto LABEL_45;
      case 'o':
        __endptr.vfc_reserved1 = 0;
        v31[0] = 0;
        getmnt_silent = 0;
        if (!getmntopts(optarg, &off_100008000, &__endptr, v31)) {
          err(1, "error parsing mount options");
        }
        v30[0] = __endptr.vfc_reserved1;
        freemntopts();
LABEL_15:
        v5 = v8;
        goto LABEL_32;
      case 's':
        v9 = optarg;
        v10 = strtoll(optarg, (char **)&__endptr, 10);
        v6 = v10;
        v11 = *(char **)&__endptr.vfc_reserved1;
        v12 = **(unsigned __int8 **)&__endptr.vfc_reserved1;
        if (v12 > 0x66)
        {
          if (**(unsigned __int8 **)&__endptr.vfc_reserved1 <= 0x6Cu)
          {
            if (v12 != 103)
            {
              if (v12 != 107) {
                goto LABEL_29;
              }
              goto LABEL_19;
            }

            goto LABEL_26;
          }

          if (v12 != 109)
          {
            if (v12 != 116) {
              goto LABEL_29;
            }
            goto LABEL_25;
          }

LABEL_27:
          v6 = v10 << 20;
          goto LABEL_28;
        }

        if (**(unsigned __int8 **)&__endptr.vfc_reserved1 > 0x4Cu)
        {
          if (v12 != 77)
          {
            if (v12 != 84) {
              goto LABEL_29;
            }
LABEL_25:
            v6 = v10 << 40;
            goto LABEL_28;
          }

          goto LABEL_27;
        }

        if (v12 != 71)
        {
          if (v12 != 75) {
            goto LABEL_29;
          }
LABEL_19:
          v6 = v10 << 10;
          goto LABEL_28;
        }

LABEL_26:
        v6 = v10 << 30;
LABEL_28:
        v11 = (char *)(*(void *)&__endptr.vfc_reserved1 + 1LL);
LABEL_29:
        if (v11 != v9 && !*v11)
        {
          v5 = v8;
          if (v6 > 0)
          {
LABEL_32:
            v4 = getopt(a1, a2, "io:en:s:h") << 24;
            v8 = v5;
            if (v4 == -16777216) {
              goto LABEL_33;
            }
            continue;
          }
        }

        v16 = __stderrp;
        v17 = optarg;
        v18 = 115LL;
LABEL_45:
        fprintf(v16, "invalid value for '-%c': %s\n", v18, v17);
        return 64LL;
      default:
        goto LABEL_35;
    }
  }
}

void sub_100003C34()
{
}

void sub_100003C4C()
{
}