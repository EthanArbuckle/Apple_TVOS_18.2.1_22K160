uint64_t sub_1000040D4()
{
  return 45LL;
}

uint64_t sub_1000040DC(uint64_t a1)
{
  v2 = *(char **)(a1 + 8);
  v3 = "/.b/8/";
  if (sub_1000047C0("/.b/8/", 0))
  {
    if (dword_10000C054) {
      fprintf(__stderrp, "Default mount %s is not available. Using backup %s.\n", "/.b/8/", "/private/system_data/");
    }
    v3 = "/private/system_data/";
    if (sub_1000047C0("/private/system_data/", 0))
    {
      fwrite("Mountpoints not available. Exiting.\n", 0x24uLL, 1uLL, __stderrp);
      return 2LL;
    }
  }

  v5 = *(const char **)(a1 + 24);
  if (!v5)
  {
    v6 = __stderrp;
    v7 = "No mnt_opts provided to mount preflight.\n";
    size_t v8 = 41LL;
LABEL_19:
    fwrite(v7, v8, 1uLL, v6);
LABEL_20:
    fwrite("Failed mount preflight. Exiting.\n", 0x21uLL, 1uLL, __stderrp);
    return 22LL;
  }

  if (sub_1000047C0("/sbin/mount_tmpfs", 1))
  {
    fprintf(__stderrp, "Failed to find executable: %s \n");
    goto LABEL_20;
  }

  v9 = strdup(v5);
  v10 = strtok(v9, ",");
  if (!v10)
  {
LABEL_18:
    free(v9);
    v6 = __stderrp;
    v7 = "Ramdisk fstab not in expected format.\n";
    size_t v8 = 38LL;
    goto LABEL_19;
  }

  v11 = v10;
  while (1)
  {
    size_t v12 = strlen(v11);
    if (v12 >= 6)
    {
      unint64_t v13 = v12;
      if (!strncmp("size=", v11, 5uLL) || v13 >= 0xA && !strncmp("template=", v11, 9uLL)) {
        break;
      }
    }

    v11 = strtok(0LL, ",");
    if (!v11) {
      goto LABEL_18;
    }
  }

  v15 = &v5[v11 - v9];
  *((_BYTE *)v15 - 1) = 0;
  free(v9);
  v16 = sub_100004820(v15, "size=");
  if (!v16)
  {
    fprintf(__stderrp, "Unexpected mount size %zu\n");
    goto LABEL_20;
  }

  v17 = v16;
  uint64_t v18 = strtol(v16, __endptr, 0);
  if (__endptr[0] == v17 || *__endptr[0] || (uint64_t v19 = v18, v18 <= 0))
  {
    fprintf(__stderrp, "Unexpected size string: %s\n", v17);
    free(v17);
    goto LABEL_20;
  }

  free(v17);
  v20 = sub_100004820(v15, "template=");
  if (v20)
  {
    v21 = v20;
    __strlcpy_chk(from, v20, 1024LL, 1024LL);
    free(v21);
  }

  uint64_t v22 = v19 << 9;
  if (dword_10000C054) {
    fprintf(__stdoutp, "Mounting tmpfs volume at tmp location %s\n", v3);
  }
  if ((int)sub_10000466C(v3, v19 << 9) >= 1)
  {
    fprintf(__stderrp, "Initial mount to %s failed with %d\n");
    goto LABEL_53;
  }

  v23 = copyfile_state_alloc();
  copyfile_state_set(v23, 6u, sub_100004744);
  if (copyfile(from, v3, v23, 0x800Fu) < 0)
  {
    v31 = __stderrp;
    v32 = __error();
    strerror(*v32);
    fprintf(v31, "Failed to copy contents from %s to %s with error: %s\n");
    goto LABEL_53;
  }

  copyfile_state_free(v23);
  if (dword_10000C054) {
    fprintf(__stdoutp, "Mounting tmpfs volume at %s\n", v2);
  }
  uint64_t v4 = sub_10000466C(v2, v22);
  if ((int)v4 >= 1)
  {
    fprintf(__stderrp, "Final mount to %s failed with %d\n");
    goto LABEL_53;
  }

  v24 = copyfile_state_alloc();
  copyfile_state_set(v24, 6u, sub_100004744);
  if (copyfile(v3, v2, v24, 0x800Fu) < 0)
  {
    v33 = __stderrp;
    v34 = __error();
    strerror(*v34);
    fprintf(v33, "Failed to copy contents from %s to %s with error: %s\n");
LABEL_53:
    v35 = __error();
    int v36 = sub_1000051EC(*v35, 0xFFFFFFFF);
    exit(v36);
  }

  copyfile_state_free(v24);
  LODWORD(err) = -1;
  __endptr[0] = "/sbin/umount";
  __endptr[1] = "-f";
  __endptr[2] = v3;
  __endptr[3] = 0LL;
  if ((sub_1000048A8(__endptr, &err) & 0x80000000) != 0)
  {
    fprintf(__stderrp, "Failed to execute command %s\n", __endptr[0]);
    v26 = __error();
    int v25 = sub_1000051EC(*v26, 0xFFFFFFFF);
  }

  else
  {
    int v25 = (int)err;
  }

  if (v25)
  {
    v27 = __stderrp;
    v28 = __error();
    fprintf(v27, "Failed to unmount %s (errno %d).\n", v3, *v28);
  }

  if (sub_100005174())
  {
    CFErrorRef err = 0LL;
    if ((UMLCreatePrimaryUserLayout(@"/", @"/private/var/mobile", 0LL, &err) & 1) != 0)
    {
      puts("UMLCreatePrimaryUserLayout passed without error");
    }

    else
    {
      v29 = CFErrorCopyDescription(err);
      CFIndex Code = CFErrorGetCode(err);
      CFStringGetCString(v29, (char *)__endptr, 256LL, 0x8000100u);
      fprintf(__stderrp, "Failed to copy user template: %s (%ld).\n", (const char *)__endptr, Code);
      CFRelease(err);
      CFRelease(v29);
    }
  }

  if (dword_10000C054) {
    sub_100006714(0LL);
  }
  return v4;
}

uint64_t sub_10000466C(char *a1, uint64_t a2)
{
  unsigned int v5 = -1;
  snprintf(__str, 0x40uLL, "%zu", a2);
  v6[0] = "/sbin/mount_tmpfs";
  v6[1] = "-s";
  v6[2] = __str;
  v6[3] = a1;
  v6[4] = 0LL;
  if ((sub_1000048A8(v6, &v5) & 0x80000000) == 0) {
    return v5;
  }
  fprintf(__stderrp, "Failed to execute command %s\n", v6[0]);
  uint64_t v4 = __error();
  return sub_1000051EC(*v4, 0xFFFFFFFF);
}

uint64_t sub_100004744(int a1, int a2)
{
  if (a2 == 1 && dword_10000C054)
  {
    if (a1 == 2)
    {
      fprintf(__stderrp, "Creating %s/\n");
    }

    else if (a1 == 1)
    {
      fprintf(__stderrp, "Copying %s -> %s\n");
    }
  }

  return 0LL;
}

uint64_t sub_1000047C0(const char *a1, int a2)
{
  uint64_t result = access(a1, a2);
  if ((_DWORD)result)
  {
    uint64_t v4 = __stderrp;
    unsigned int v5 = __error();
    v6 = strerror(*v5);
    fprintf(v4, "Failed access check for %s with issue %s\n", a1, v6);
    return *__error();
  }

  return result;
}

char *sub_100004820(const char *a1, const char *a2)
{
  v3 = strstr(a1, a2);
  size_t v4 = strlen(a2);
  if (!v3) {
    return 0LL;
  }
  size_t v5 = v4;
  if (strlen(v3) <= v4) {
    return 0LL;
  }
  v6 = &v3[v5];
  size_t v7 = strcspn(v6, ",");
  if (v7 - 1 > 0x3FE) {
    return 0LL;
  }
  size_t v8 = v7;
  v9 = (char *)calloc(1uLL, v7 + 1);
  return strncpy(v9, v6, v8);
}

uint64_t sub_1000048A8(char **a1, _DWORD *a2)
{
  v2 = a1;
  int v51 = -1;
  posix_spawn_file_actions_t v49 = 0LL;
  *(void *)v52 = -1LL;
  if (!a1)
  {
    fwrite("command_argv is NULL\n", 0x15uLL, 1uLL, __stderrp);
    v6 = 0LL;
    *__error() = 22;
LABEL_22:
    uint64_t v27 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }

  if (pipe(v52))
  {
    size_t v4 = __stderrp;
    __error();
    size_t v5 = __error();
    strerror(*v5);
    fprintf(v4, "Failed to create pipe for command output: %d (%s)\n");
LABEL_20:
    v2 = 0LL;
LABEL_21:
    v6 = 0LL;
    goto LABEL_22;
  }

  int v7 = posix_spawn_file_actions_init(&v49);
  if (v7)
  {
    *__error() = v7;
    size_t v8 = __stderrp;
    __error();
    v9 = __error();
    strerror(*v9);
    fprintf(v8, "posix_spawn_file_actions_init failed: %d (%s)\n");
    goto LABEL_20;
  }

  int v10 = posix_spawn_file_actions_addclose(&v49, v52[0]);
  if (v10)
  {
    *__error() = v10;
    v11 = __stderrp;
    __error();
    size_t v12 = __error();
    strerror(*v12);
    fprintf(v11, "posix_spawn_file_actions_addclose output_pipe[0] failed: %d (%s)\n");
    goto LABEL_20;
  }

  int v13 = posix_spawn_file_actions_adddup2(&v49, v52[1], 1);
  if (v13)
  {
    *__error() = v13;
    v14 = __stderrp;
    __error();
    v15 = __error();
    strerror(*v15);
    fprintf(v14, "posix_spawn_file_actions_adddup2 output_pipe[1] failed: %d (%s)\n");
    goto LABEL_20;
  }

  int v16 = posix_spawn_file_actions_addclose(&v49, v52[1]);
  if (v16)
  {
    *__error() = v16;
    v17 = __stderrp;
    __error();
    uint64_t v18 = __error();
    strerror(*v18);
    fprintf(v17, "posix_spawn_file_actions_addclose output_pipe[1] failed: %d (%s)\n");
    goto LABEL_20;
  }

  if (dword_10000C054)
  {
    fwrite("Executing command: ", 0x13uLL, 1uLL, __stdoutp);
    uint64_t v19 = *v2;
    if (*v2)
    {
      v20 = (const char **)(v2 + 1);
      do
      {
        fprintf(__stdoutp, "%s ", v19);
        v21 = *v20++;
        uint64_t v19 = v21;
      }

      while (v21);
    }

    fputc(10, __stdoutp);
  }

  uint64_t v22 = *v2;
  v23 = _NSGetEnviron();
  int v24 = posix_spawn(&v50, v22, &v49, 0LL, v2, *v23);
  if (v24)
  {
    *__error() = v24;
    int v25 = __stderrp;
    __error();
    v26 = __error();
    strerror(*v26);
    fprintf(v25, "posix_spawn failed: %d (%s)\n");
    goto LABEL_20;
  }

  close(v52[1]);
  v52[1] = -1;
  v30 = (char **)calloc(0x400uLL, 1uLL);
  if (!v30)
  {
    v39 = __stderrp;
    __error();
    v40 = __error();
    strerror(*v40);
    fprintf(v39, "calloc failed: %d (%s)\n");
    goto LABEL_20;
  }

  v2 = v30;
  v31 = fdopen(v52[0], "r");
  if (!v31)
  {
    v41 = __stderrp;
    __error();
    v42 = __error();
    strerror(*v42);
    fprintf(v41, "fdopen failed: %d (%s)\n");
    goto LABEL_21;
  }

  v6 = v31;
  v32 = fgetln(v31, &v48);
  if (v32)
  {
    v33 = v32;
    size_t v34 = 0LL;
    do
    {
      if (v34 >= 1023 - v48) {
        break;
      }
      __strncat_chk(v2, v33);
      v34 += v48;
      v33 = fgetln(v6, &v48);
    }

    while (v33);
  }

  if (ferror(v6))
  {
    v35 = __stderrp;
    int v36 = *__error();
    v37 = __error();
    v38 = strerror(*v37);
    fprintf(v35, "fgetln failed: %d (%s)\n", v36, v38);
    goto LABEL_22;
  }

  if (fclose(v6))
  {
    v43 = __stderrp;
    __error();
    v44 = __error();
    strerror(*v44);
    fprintf(v43, "fclose failed: %d (%s)\n");
    goto LABEL_21;
  }

  close(v52[0]);
  v52[0] = -1;
  while (waitpid(v50, &v51, 0) < 0)
  {
    if (*__error() != 4)
    {
      v45 = __stderrp;
      __error();
      v46 = __error();
      strerror(*v46);
      fprintf(v45, "waitpid failed: %d (%s)\n");
      goto LABEL_21;
    }
  }

  if (dword_10000C054) {
    fprintf(__stdoutp, "Command output:\n%s\n", (const char *)v2);
  }
  if ((v51 & 0x7F) == 0x7F) {
    goto LABEL_59;
  }
  if ((v51 & 0x7F) != 0)
  {
    if (a2) {
      *a2 = 0;
    }
    fprintf(__stderrp, "Command signaled: %d\n");
    goto LABEL_63;
  }

  int v47 = BYTE1(v51);
  if (a2) {
    *a2 = BYTE1(v51);
  }
  if (!v47)
  {
LABEL_59:
    v6 = 0LL;
    uint64_t v27 = 0LL;
    goto LABEL_23;
  }

  fprintf(__stderrp, "Command failed: %d\n");
LABEL_63:
  v6 = 0LL;
  uint64_t v27 = 1LL;
LABEL_23:
  int v28 = *__error();
  if (v49) {
    posix_spawn_file_actions_destroy(&v49);
  }
  if (v6) {
    fclose(v6);
  }
  if ((v52[0] & 0x80000000) == 0) {
    close(v52[0]);
  }
  if ((v52[1] & 0x80000000) == 0) {
    close(v52[1]);
  }
  if (v2) {
    free(v2);
  }
  *__error() = v28;
  return v27;
}

int *sub_100004E6C(_DWORD *a1)
{
  CFStringRef theString = 0LL;
  if (!(_BYTE)dword_10000C004)
  {
    io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems/fstab");
    if (v3)
    {
      io_object_t v4 = v3;
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"os_env_type", kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        v6 = CFProperty;
        v14.length = CFDataGetLength(CFProperty);
        v14.location = 0LL;
        CFDataGetBytes(v6, v14, (UInt8 *)&dword_10000C000);
        CFRelease(v6);
      }

      IOObjectRelease(v4);
      *a1 = dword_10000C000;
      int BootDevice = APFSContainerGetBootDevice(&theString);
      if (!BootDevice)
      {
LABEL_14:
        v2 = &dword_10000C004;
        strcpy((char *)&dword_10000C004, "/dev/");
        CFStringGetCString(theString, (char *)&word_10000C008 + 1, 27LL, 0x8000100u);
        CFRelease(theString);
        return v2;
      }

      int v8 = 5;
      while (1)
      {
        v9 = __stderrp;
        int v10 = dword_10000C000 == 1 ? "" : "warning: ";
        v11 = strerror(BootDevice & 0x3FFF);
        fprintf(v9, "%sfailed to get boot device - %s\n", v10, v11);
        if (dword_10000C000 == 1) {
          break;
        }
        sleep(1u);
        fprintf(__stderrp, "Retrying (%d retries left)...\n", v8);
        int BootDevice = APFSContainerGetBootDevice(&theString);
        --v8;
        if (!BootDevice) {
          goto LABEL_14;
        }
      }
    }

    else
    {
      fwrite("failed to get filesystem info\n", 0x1EuLL, 1uLL, __stderrp);
    }

    return 0LL;
  }

  *a1 = dword_10000C000;
  return &dword_10000C004;
}

char *sub_10000505C()
{
  CFArrayRef theArray = 0LL;
  v0 = &byte_10000C024;
  if (!byte_10000C024)
  {
    if ((_BYTE)dword_10000C004 || sub_100004E6C(&v7))
    {
      int v1 = APFSVolumeRoleFind();
      if (v1)
      {
        v2 = __stderrp;
        if (dword_10000C000 == 1) {
          io_registry_entry_t v3 = "";
        }
        else {
          io_registry_entry_t v3 = "warning: ";
        }
        io_object_t v4 = strerror(v1 & 0x3FFF);
        fprintf(v2, "%sfailed to lookup data volume - %s\n", v3, v4);
      }

      else
      {
        if (CFArrayGetCount(theArray) < 2)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0LL);
          CFStringGetCString(ValueAtIndex, &byte_10000C024, 32LL, 0x8000100u);
          CFRelease(theArray);
          return v0;
        }

        fwrite("found multiple data volumes\n", 0x1CuLL, 1uLL, __stderrp);
        CFRelease(theArray);
      }
    }

    return 0LL;
  }

  return v0;
}

BOOL sub_100005174()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems");
  if (!v0) {
    return 0LL;
  }
  io_object_t v1 = v0;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"e-apfs", kCFAllocatorDefault, 0);
  BOOL v3 = CFProperty != 0LL;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  IOObjectRelease(v1);
  return v3;
}

uint64_t sub_1000051EC(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = a1;
  if (a2 == -1) {
    a2 = sysexit_np(a1);
  }
  if (dword_10000C050) {
    return v2;
  }
  else {
    return a2;
  }
}

void start(int a1, char *const *a2)
{
  uint64_t v4 = 0LL;
  int v5 = 0;
  __s1 = 0LL;
  int v6 = 0;
  char v73 = 0;
  v72 = 0LL;
  int v7 = 0LL;
  while (1)
  {
    while (1)
    {
      uint64_t v8 = v4;
      int v9 = getopt(a1, a2, "headfFko:rwt:uvP:");
      if (v9 > 96)
      {
        uint64_t v4 = 1LL;
        switch(v9)
        {
          case 'a':
            continue;
          case 'd':
            dword_10000C048 = 1;
            uint64_t v4 = v8;
            continue;
          case 'e':
            dword_10000C050 = 1;
            uint64_t v4 = v8;
            continue;
          case 'f':
            v5 |= 0x80000u;
            uint64_t v4 = v8;
            continue;
          case 'k':
            v5 |= 0x8000000u;
            uint64_t v4 = v8;
            continue;
          case 'o':
            uint64_t v4 = v8;
            if (*optarg)
            {
              __s1 = sub_100005C64(__s1, optarg);
              if (strstr(optarg, "union")) {
                v5 |= 0x20u;
              }
              uint64_t v4 = v8;
            }

            continue;
          case 'r':
            v5 |= 1u;
            uint64_t v4 = v8;
            continue;
          case 't':
            if (v7)
            {
              if (dword_10000C050) {
                int v16 = 22;
              }
              else {
                int v16 = 64;
              }
              errx(v16, "only one -t option may be specified.");
            }

            int v7 = (const char **)makevfslist(optarg);
            v72 = optarg;
            uint64_t v4 = v8;
            continue;
          case 'u':
            v5 |= 0x10000u;
            uint64_t v4 = v8;
            continue;
          case 'v':
            dword_10000C054 = 1;
            uint64_t v4 = v8;
            continue;
          case 'w':
            v5 &= ~1u;
            uint64_t v4 = v8;
            continue;
          default:
            goto LABEL_80;
        }
      }

      if (v9 != 70) {
        break;
      }
      char v73 = 1;
      uint64_t v4 = v8;
    }

    if (v9 != 80) {
      break;
    }
    int v10 = strtol(optarg, &__endptr, 10);
    if (__endptr != optarg)
    {
      int v6 = v10;
      BOOL v11 = *__endptr || v10 < 1;
      BOOL v12 = !v11 && v10 < 3;
      uint64_t v4 = v8;
      if (v12) {
        continue;
      }
    }

    if (dword_10000C050) {
      int v13 = 22;
    }
    else {
      int v13 = 64;
    }
    errx(v13, "-P flag requires a valid mount phase number");
  }

  if (v9 != -1) {
    goto LABEL_80;
  }
  int v14 = a1 - optind;
  v15 = (const char **)&a2[optind];
  if ((v6 - 1) >= 2)
  {
    v17 = v7;
    uint64_t v18 = v72;
    if (!v6) {
      goto LABEL_43;
    }
  }

  else
  {
    dword_10000C04C = v6;
  }

  LODWORD(v8) = 1;
  dword_10000C054 = 1;
  uint64_t v18 = "nonfs";
  v17 = (const char **)makevfslist("nonfs");
LABEL_43:
  if (v14 != 2)
  {
    if (v14 != 1)
    {
      if (!v14)
      {
        if (!(_DWORD)v8)
        {
          if (!dword_10000C044) {
            sub_100006714(v17);
          }
          exit(0);
        }

        uint64_t v76 = 0LL;
        if (!setfsent())
        {
          if (*__error()) {
            uint64_t v24 = *__error();
          }
          else {
            uint64_t v24 = 6LL;
          }
          int v38 = sub_1000051EC(v24, 0xFFFFFFFF);
          errx(v38, "mount: can't get filesystem checklist");
        }

        v30 = sub_100004E6C(&v75);
        v31 = sub_10000505C();
        if (v31)
        {
          fprintf(__stdoutp, "mount: found boot container: %s, data volume: %s env: %u\n", (const char *)v30, v31, v75);
          v32 = __s1;
        }

        else
        {
          v32 = __s1;
          if (v75 == 1 && dword_10000C04C == 2)
          {
            if (*__error()) {
              uint64_t v39 = *__error();
            }
            else {
              uint64_t v39 = 6LL;
            }
            int v65 = sub_1000051EC(v39, 0xFFFFFFFF);
            errx(v65, "mount: missing data volume");
          }

          fprintf(__stdoutp, "mount: data volume missing, but not required in env: %u\n", v75);
        }

        int v47 = getfsent();
        if (v47)
        {
          posix_spawn_file_actions_t v49 = v47;
          int v48 = 0;
          do
          {
            fs_type = v49->fs_type;
            int v51 = strcmp(fs_type, "ro");
            if ((!v51 || !strcmp(fs_type, "rw") || !strcmp(fs_type, "rq"))
              && !checkvfsname(v49->fs_vfstype, v17)
              && !sub_100005D80(v49->fs_mntops, "noauto"))
            {
              if ((fs_vfstype = v49->fs_vfstype, strcmp(fs_vfstype, "nfs")) && strcmp(fs_vfstype, "url")
                || !sub_100005D80(v49->fs_mntops, "net")
                && v49->fs_spec
                && (fs_file = v49->fs_file) != 0LL
                && !sub_100005E64(v49->fs_spec, fs_file, 0LL))
              {
                if ((!dword_10000C04C || v49->fs_passno == dword_10000C04C)
                  && (!sub_100005E64(v49->fs_spec, v49->fs_file, &v76) || v51 && (v76 & 1) != 0))
                {
                  fs_spec = v49->fs_spec;
                  if (!strcmp(v49->fs_spec, "ramdisk"))
                  {
                    if (dword_10000C054) {
                      fwrite("mount: encountered ramdisk\n", 0x1BuLL, 1uLL, __stdoutp);
                    }
                    uint64_t v56 = sub_1000040DC((uint64_t)v49);
                    if ((_DWORD)v56)
                    {
                      int v71 = sub_1000051EC(v56, 0xFFFFFFFF);
                      errx(v71, "mount: failed to setup tmpfs mount");
                    }

                    int v48 = 0;
                  }

                  else
                  {
                    if (v49->fs_passno >= 2
                      && !strcmp(v49->fs_vfstype, "apfs")
                      && !strcmp(v49->fs_type, "rw")
                      && v31
                      && !dword_10000C048
                      && v75 == 1
                      && !strcmp(v31, fs_spec))
                    {
                      int v57 = APFSContainerMigrateMediaKeys(v30);
                      if (v57) {
                        fprintf(__stderrp, "mount: failed to migrate Media Keys, error = %x\n", v57);
                      }
                      else {
                        fwrite("mount: successfully migrated Media Keys\n", 0x28uLL, 1uLL, __stdoutp);
                      }
                    }

                    int v54 = sub_100005F08(v49->fs_vfstype, v49->fs_spec, v49->fs_file, v5, v32, v49->fs_mntops, v73 & 1);
                    if (v54) {
                      int v48 = v54;
                    }
                  }
                }
              }
            }

            posix_spawn_file_actions_t v49 = getfsent();
          }

          while (v49);
        }

        else
        {
          int v48 = 0;
        }

        endfsent();
        if (v6 == 2) {
          sub_1000066CC();
        }
        exit(v48);
      }

      goto LABEL_80;
    }

    uint64_t v22 = *v15;
    if (strlen(*v15) >= 0x401)
    {
      if (dword_10000C050) {
        int v23 = 22;
      }
      else {
        int v23 = 65;
      }
      errx(v23, "special file or file system %s too long.", v22);
    }

    if (!realpath_DARWIN_EXTSN(v22, v77))
    {
      int v28 = __error();
      int v29 = sub_1000051EC(*v28, 0xFFFFFFFF);
      errx(v29, "%s: invalid special file or file system.", *v15);
    }

    if (!v17)
    {
      if ((v5 & 0x10000) != 0)
      {
        int v40 = sub_100006798(v77, v5, __s1);
        exit(v40);
      }

      size_t v34 = getfsfile(v77);
      if (!v34)
      {
        size_t v34 = getfsspec(v77);
        if (!v34)
        {
          v35 = __error();
          int v36 = sub_1000051EC(*v35, 0xFFFFFFFF);
          errx(v36, "%s: unknown special file or file system.", *v15);
        }
      }

      v62 = v34->fs_type;
      if (strcmp(v62, "ro") && strcmp(v62, "rw") && strcmp(v62, "rq"))
      {
        if (dword_10000C050) {
          int v69 = 22;
        }
        else {
          int v69 = 65;
        }
        errx(v69, "%s has unknown file system type.", *v15);
      }

      if (!strcmp(v34->fs_vfstype, "nfs"))
      {
        if (sub_100005D80(v34->fs_mntops, "net"))
        {
          if (dword_10000C050) {
            int v68 = 22;
          }
          else {
            int v68 = 65;
          }
          errx(v68, "%s is owned by the automounter.", *v15);
        }

        if (sub_100005E64(v34->fs_spec, v34->fs_file, 0LL))
        {
          if (dword_10000C050) {
            int v70 = 37;
          }
          else {
            int v70 = 78;
          }
          errx(v70, "%s is already mounted at %s.", v34->fs_spec, v34->fs_file);
        }
      }

      v63 = v34->fs_spec;
      if (!strcmp(v34->fs_spec, "ramdisk"))
      {
        if (dword_10000C054) {
          fwrite("Found a ramdisk entry\n", 0x16uLL, 1uLL, __stdoutp);
        }
        int v64 = sub_1000040DC((uint64_t)v34);
        exit(v64);
      }

      f_mntonname = v34->fs_file;
      f_fstypename = v34->fs_vfstype;
      fs_mntops = v34->fs_mntops;
      int v41 = v73 & 1;
      f_mntfromname = (char *)v63;
      int v58 = v5;
      v59 = __s1;
LABEL_148:
      int v61 = sub_100005F08(f_fstypename, f_mntfromname, f_mntonname, v58, v59, fs_mntops, v41);
      exit(v61);
    }

LABEL_80:
    sub_100005D18();
  }

  uint64_t v19 = *v15;
  v20 = v15[1];
  if (strlen(v20) >= 0x401)
  {
    if (dword_10000C050) {
      int v21 = 63;
    }
    else {
      int v21 = 65;
    }
    errx(v21, "file system %s too long.", v20);
  }

  if ((v5 & 0x8000000) != 0)
  {
    int v25 = __s1;
    if ((unint64_t)__strlcpy_chk(v77, v20, 1024LL, 1024LL) >= 0x400)
    {
      if (dword_10000C050) {
        int v33 = 63;
      }
      else {
        int v33 = 65;
      }
      errx(v33, "file system %s too long.", v15[1]);
    }
  }

  else
  {
    int v25 = __s1;
    if (!realpath_DARWIN_EXTSN(v20, v77))
    {
      v26 = __error();
      int v27 = sub_1000051EC(*v26, 0xFFFFFFFF);
      errx(v27, "%s: invalid file system.", v15[1]);
    }
  }

  if (!v17 && strchr(*v15, 58))
  {
    if (sub_100005E64(v19, v77, 0LL))
    {
      if (dword_10000C050) {
        int v66 = 37;
      }
      else {
        int v66 = 78;
      }
      errx(v66, "%s is already mounted at %s.", v19, v77);
    }

    if ((v5 & 0x10000) == 0)
    {
      uint64_t v18 = "nfs";
LABEL_99:
      int v41 = v73 & 1;
      f_mntonname = v77;
      f_fstypename = v18;
      f_mntfromname = (char *)v19;
LABEL_147:
      int v58 = v5;
      v59 = v25;
      fs_mntops = 0LL;
      goto LABEL_148;
    }
  }

  else if ((v5 & 0x10000) == 0)
  {
    if (!v18)
    {
      if (dword_10000C050) {
        int v37 = 22;
      }
      else {
        int v37 = 64;
      }
      errx(v37, "You must specify a filesystem type with -t.");
    }

    goto LABEL_99;
  }

  v45 = sub_100006820(v77);
  if (!v45)
  {
    if (*__error()) {
      uint64_t v46 = *__error();
    }
    else {
      uint64_t v46 = 2LL;
    }
    int v67 = sub_1000051EC(v46, 0xFFFFFFFF);
    errx(v67, "unknown special file or file system %s.", *v15);
  }

  f_mntfromname = v45->f_mntfromname;
  f_mntonname = v45->f_mntonname;
  int v41 = v73 & 1;
  f_fstypename = v45->f_fstypename;
  goto LABEL_147;
}

char *sub_100005C64(char *__s, char *__s1)
{
  if (!__s) {
    return strdup(__s1);
  }
  if (*__s)
  {
    size_t v4 = strlen(__s);
    size_t v5 = v4 + strlen(__s1) + 2;
    int v6 = (char *)malloc(v5);
    if (!v6) {
      sub_100006C74();
    }
    int v7 = v6;
    snprintf(v6, v5, "%s,%s", __s, __s1);
  }

  else
  {
    int v7 = strdup(__s1);
  }

  free(__s);
  return v7;
}

void sub_100005D18()
{
  if (dword_10000C050) {
    int v0 = 22;
  }
  else {
    int v0 = 64;
  }
  exit(v0);
}

uint64_t sub_100005D80(const char *a1, const char *a2)
{
  unsigned int v2 = a2;
  if (*a2 == 110)
  {
    BOOL v3 = *((unsigned __int8 *)a2 + 1) != 111;
    BOOL v4 = *((unsigned __int8 *)a2 + 1) == 111;
    if (a2[1] == 111) {
      unsigned int v2 = a2 + 2;
    }
  }

  else
  {
    BOOL v4 = 0;
    BOOL v3 = 1;
  }

  size_t v5 = strdup(a1);
  int v6 = strtok(v5, ",");
  for (i = 0LL; v6; int v6 = strtok(0LL, ","))
  {
    if (*v6 == 110)
    {
      BOOL v8 = v6[1] == 111;
      v6 += 2 * v8;
      if (v8) {
        BOOL v9 = v4;
      }
      else {
        BOOL v9 = v3;
      }
    }

    else
    {
      BOOL v9 = v3;
    }

    if (!strcasecmp(v6, v2)) {
      uint64_t i = v9;
    }
    else {
      uint64_t i = i;
    }
  }

  free(v5);
  return i;
}

uint64_t sub_100005E64(const char *a1, const char *a2, void *a3)
{
  int v6 = getmntinfo(&v10, 2);
  if (!v6) {
    sub_100006CA4();
  }
  if (v6 < 1) {
    return 0LL;
  }
  int v7 = v10;
  uint64_t v8 = v6;
  while (strcmp(v7->f_mntfromname, a1) || strcmp(v7->f_mntonname, a2))
  {
    ++v7;
    if (!--v8) {
      return 0LL;
    }
  }

  if (a3) {
    *a3 = v7->f_flags;
  }
  return 1LL;
}

uint64_t sub_100005F08(const char *a1, char *a2, const char *a3, int a4, char *a5, const char *a6, int a7)
{
  if ((a4 & 0x8000000) != 0)
  {
  }

  else if (!realpath_DARWIN_EXTSN(a3, __s))
  {
    if (dword_10000C04C != 2
      || ((size_t v13 = strlen(__s), v13 >= 0xC) ? (v14 = 12LL) : (v14 = v13), strncmp(__s, "/private/var", v14)))
    {
      warn("realpath %s");
      goto LABEL_88;
    }

    if (mkdir(__s, 0x1C0u))
    {
      warn("mkdir %s");
      goto LABEL_88;
    }
  }

  if (a6) {
    v15 = a6;
  }
  else {
    v15 = "";
  }
  if (!a5)
  {
    a5 = *v15 ? (char *)v15 : "";
    if (*v15) {
      v15 = "";
    }
  }

  int v16 = strdup(v15);
  v17 = sub_100005C64(v16, a5);
  uint64_t v18 = v17;
  else {
    int v19 = a4 | 0x10000;
  }
  if ((v19 & 0x80000) != 0)
  {
    uint64_t v18 = sub_100005C64(v17, "force");
    if ((v19 & 1) == 0)
    {
LABEL_25:
      if ((v19 & 0x10000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_42;
    }
  }

  else if ((v19 & 1) == 0)
  {
    goto LABEL_25;
  }

  uint64_t v18 = sub_100005C64(v18, "ro");
  if ((v19 & 0x10000) == 0)
  {
LABEL_26:
    if ((v19 & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_43;
  }

LABEL_42:
  uint64_t v18 = sub_100005C64(v18, "update");
  if ((v19 & 0x100000) == 0)
  {
LABEL_27:
    if ((v19 & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

LABEL_43:
  uint64_t v18 = sub_100005C64(v18, "nobrowse");
  if ((v19 & 0x80) != 0) {
LABEL_28:
  }
    uint64_t v18 = sub_100005C64(v18, "protect");
LABEL_29:
  int v54 = strndup(v18, 0x400uLL);
  if ((v19 & 0x8000000) != 0) {
    uint64_t v18 = sub_100005C64(v18, "nofollow");
  }
  v20 = "/sbin";
  int v21 = &off_1000082F8;
  do
  {
    snprintf(__str, 0x401uLL, "%s/mount_%s", v20, a1);
    int v22 = stat(__str, (stat *)&v59);
    if (!v22)
    {
LABEL_37:
      if (v22 || (a7 & 1) != 0) {
        goto LABEL_47;
      }
      goto LABEL_50;
    }

    int v23 = *v21++;
    v20 = v23;
  }

  while (v23);
  uint64_t v24 = "/System/Library/Filesystems";
  int v25 = &off_100008310;
  while (1)
  {
    snprintf(__str, 0x401uLL, "%s/%s.fs/%s/mount_%s", v24, a1, "Contents/Resources", a1);
    if (!stat(__str, (stat *)&v59)) {
      break;
    }
    v26 = *v25++;
    uint64_t v24 = v26;
    if (!v26) {
      goto LABEL_37;
    }
  }

  if (a7)
  {
LABEL_47:
    int v56 = 1;
    v60 = (char *)a1;
    sub_100006A30(v54, &v56, (uint64_t)&v60, 97);
    int v28 = v56;
    int v29 = v56 + 1;
    (&v60)[v56] = a2;
    (&v60)[v29] = __s;
    (&v60)[v28 + 2] = 0LL;
    uint64_t result = sub_1000040D4();
    if (!(_DWORD)result || !a7)
    {
      if (!(_DWORD)result) {
        return result;
      }
      goto LABEL_50;
    }

    switch((_DWORD)result)
    {
      case 0x2D:
        warnx("FSKit unavailable");
        BOOL v39 = dword_10000C050 == 0;
        unsigned int v40 = 45;
        break;
      case 8:
        warnx("File system named %s unable to mount", a1);
        BOOL v39 = dword_10000C050 == 0;
        unsigned int v40 = 8;
        break;
      case 2:
        warnx("File system named %s not found", a1);
        BOOL v39 = dword_10000C050 == 0;
        unsigned int v40 = 2;
        break;
      default:
        warnx("Unable to invoke task");
        BOOL v39 = dword_10000C050 == 0;
        unsigned int v40 = 22;
        break;
    }

LABEL_95:
    unsigned int v41 = 69;
    goto LABEL_96;
  }

LABEL_50:
  int v56 = 1;
  v60 = (char *)a1;
  sub_100006A30(v18, &v56, (uint64_t)&v60, 97);
  int v30 = v56;
  int v31 = v56 + 1;
  (&v60)[v56] = a2;
  uint64_t v32 = (v30 + 2);
  int v56 = v30 + 2;
  (&v60)[v31] = __s;
  (&v60)[(int)v32] = 0LL;
  if (dword_10000C048)
  {
    printf("exec: mount_%s", a1);
    if ((v30 & 0x80000000) == 0)
    {
      int v33 = (const char **)&v61;
      uint64_t v34 = v32 - 1;
      do
      {
        v35 = *v33++;
        printf(" %s", v35);
        --v34;
      }

      while (v34);
    }

    putchar(10);
    return 0LL;
  }

  pid_t v36 = fork();
  if (v36 == -1)
  {
    warn("fork");
    free(v18);
    unsigned int v40 = *__error();
    BOOL v39 = dword_10000C050 == 0;
    unsigned int v41 = 71;
    goto LABEL_96;
  }

  pid_t v37 = v36;
  if (v36)
  {
    free(v18);
    free(v54);
    if (waitpid(v37, &v55, 0) < 0)
    {
      sub_100006CC0(&v59);
      return v59.f_bsize;
    }

    uint64_t v38 = v55 & 0x7F;
    if ((_DWORD)v38 != 127)
    {
      if ((v55 & 0x7F) != 0)
      {
        warnx("%s: %s", __s, sys_siglist[v38]);
        BOOL v39 = dword_10000C050 == 0;
        unsigned int v40 = 4;
        goto LABEL_95;
      }

      if (BYTE1(v55))
      {
        warnx("%s failed with %d", __s, BYTE1(v55));
        if (dword_10000C050) {
          return 4LL;
        }
        else {
          return BYTE1(v55);
        }
      }
    }

    if (!dword_10000C054) {
      return 0LL;
    }
    if ((statfs(__s, &v59) & 0x80000000) == 0)
    {
      sub_10000689C((uint64_t)&v59);
      return 0LL;
    }

    warn("statfs %s");
LABEL_88:
    unsigned int v51 = *__error();
    LODWORD(result) = sysexit_np(v51);
    if (dword_10000C050) {
      return v51;
    }
    else {
      return result;
    }
  }

  v42 = "/sbin";
  v43 = &off_1000082F8;
  do
  {
    snprintf(__str, 0x401uLL, "%s/mount_%s", v42, a1);
    v60 = __str;
    execv(__str, &v60);
    if (*__error() != 2) {
      warn("exec %s for %s", __str, __s);
    }
    v44 = *v43++;
    v42 = v44;
  }

  while (v44);
  char v45 = 0;
  uint64_t v46 = "/System/Library/Filesystems";
  int v47 = &off_100008310;
  do
  {
    snprintf(__str, 0x401uLL, "%s/%s.fs/%s/mount_%s", v46, a1, "Contents/Resources", a1);
    v60 = __str;
    execv(__str, &v60);
    if (*__error() == 2)
    {
      if ((v45 & 1) != 0) {
        goto LABEL_80;
      }
LABEL_79:
      int v56 = 1;
      v60 = (char *)a1;
      sub_100006A30(v54, &v56, (uint64_t)&v60, 97);
      int v48 = v56;
      int v49 = v56 + 1;
      (&v60)[v56] = a2;
      v48 += 2;
      int v56 = v48;
      (&v60)[v49] = __s;
      (&v60)[v48] = 0LL;
      goto LABEL_80;
    }

    warn("exec %s for %s", __str, __s);
    if ((v45 & 1) == 0) {
      goto LABEL_79;
    }
LABEL_80:
    pid_t v50 = *v47++;
    uint64_t v46 = v50;
    char v45 = 1;
  }

  while (v50);
  if (*__error() != 2)
  {
    v52 = __error();
    int v53 = sub_1000051EC(*v52, 0xFFFFFFFF);
    exit(v53);
  }

  warn("exec %s for %s", __str, __s);
  unsigned int v40 = *__error();
  BOOL v39 = dword_10000C050 == 0;
  unsigned int v41 = 72;
LABEL_96:
  if (v39) {
    return v41;
  }
  else {
    return v40;
  }
}

void sub_1000066CC()
{
  __argv[0] = "/System/Library/Filesystems/apfs.fs/apfs_boot_util";
  __argv[1] = "2";
  __argv[2] = 0LL;
  execv("/System/Library/Filesystems/apfs.fs/apfs_boot_util", __argv);
  int v0 = __error();
  int v1 = sub_1000051EC(*v0, 0xFFFFFFFF);
  errx(v1, "apfs_boot_util exec failed");
}

uint64_t sub_100006714(const char **a1)
{
  uint64_t result = getmntinfo(&v5, 2);
  if (!(_DWORD)result) {
    sub_100006CA4();
  }
  if ((int)result >= 1)
  {
    unint64_t v3 = 0LL;
    uint64_t v4 = 2168LL * result;
    do
    {
      uint64_t result = checkvfsname(v5[v3 / 0x878].f_fstypename, a1);
      if (!(_DWORD)result) {
        uint64_t result = sub_10000689C((uint64_t)&v5[v3 / 0x878]);
      }
      v3 += 2168LL;
    }

    while (v4 != v3);
  }

  return result;
}

uint64_t sub_100006798(const char *a1, int a2, char *a3)
{
  int v6 = sub_100006820(a1);
  if (!v6) {
    sub_100006D0C(a1);
  }
  int v7 = v6;
  f_mntfromname = v6->f_mntfromname;
  if (!strchr(v6->f_mntfromname, 47))
  {
    BOOL v9 = getfsfile(v7->f_mntonname);
    if (v9) {
      f_mntfromname = v9->fs_spec;
    }
  }

  return sub_100005F08(v7->f_fstypename, f_mntfromname, v7->f_mntonname, v7->f_flags & 0x80 | a2, a3, 0LL, 0);
}

statfs *sub_100006820(const char *a1)
{
  int v2 = getmntinfo(&v6, 2);
  if (v2 < 1) {
    return 0LL;
  }
  unint64_t v3 = v6;
  uint64_t v4 = v2;
  while (strcmp(v3->f_mntfromname, a1) && strcmp(v3->f_mntonname, a1))
  {
    ++v3;
    if (!--v4) {
      return 0LL;
    }
  }

  return v3;
}

uint64_t sub_10000689C(uint64_t a1)
{
  int v2 = (const char *)(a1 + 88);
  printf("%s on %s (%s", (const char *)(a1 + 1112), (const char *)(a1 + 88), (const char *)(a1 + 72));
  int v12 = 0;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = xmmword_100007F28;
  uint64_t v9 = 0LL;
  if (!getattrlist(v2, &v8, &v10, 0x24uLL, 0) && (BYTE7(v11) & 2) != 0 && (DWORD1(v10) & 0x2000000) != 0) {
    printf(", sealed");
  }
  unsigned int v3 = *(_DWORD *)(a1 + 64) & 0xDFF0F7FF;
  if (v3)
  {
    uint64_t v4 = &dword_100008320;
    do
    {
      if (!*v4) {
        break;
      }
      if ((*v4 & v3) != 0)
      {
        printf(", %s", *((const char **)v4 + 1));
        v3 &= ~*v4;
      }

      v4 += 6;
    }

    while (v3);
  }

  int v5 = *(_DWORD *)(a1 + 2136);
  if (v5)
  {
    int v6 = &dword_100008500;
    do
    {
      if (!*v6) {
        break;
      }
      if ((*v6 & v5) != 0)
      {
        printf(", %s", *((const char **)v6 + 1));
        v5 &= ~*v6;
      }

      v6 += 6;
    }

    while (v5);
  }

  if (*(_DWORD *)(a1 + 56))
  {
    printf(", mounted by ");
    if (getpwuid(*(_DWORD *)(a1 + 56))) {
      printf("%s");
    }
    else {
      printf("%d");
    }
  }

  return puts(")");
}

char *sub_100006A30(char *a1, int *a2, uint64_t a3, int a4)
{
  int v7 = *a2;
  __stringp = a1;
  while (1)
  {
    uint64_t result = strsep(&__stringp, ",");
    if (!result) {
      break;
    }
    if (*result)
    {
      if (*result != 45)
      {
        int v9 = v7 + 1;
        *(void *)(a3 + 8LL * v7) = "-o";
        goto LABEL_10;
      }

      if (result[1] != 45 || result[2])
      {
        int v9 = v7 + 1;
        *(void *)(a3 + 8LL * v7) = result;
        __int128 v10 = strchr(result, 61);
        if (v10)
        {
          char *v10 = 0;
          uint64_t result = v10 + 1;
LABEL_10:
          *(void *)(a3 + 8LL * v9) = result;
          int v9 = v7 + 2;
        }

        int v7 = v9;
        if (v9 >= a4) {
          sub_100006D38();
        }
      }
    }
  }

  *a2 = v7;
  return result;
}

uint64_t sub_100006B00(unsigned int *a1)
{
  return sub_1000051EC(*a1, 0xFFFFFFFF);
}

uint64_t checkvfsname(char *__s1, const char **a2)
{
  int v2 = a2;
  if (a2)
  {
    unsigned int v3 = *a2;
    if (*v2)
    {
      int v5 = v2 + 1;
      while (strcmp(__s1, v3))
      {
        int v6 = *v5++;
        unsigned int v3 = v6;
        if (!v6) {
          goto LABEL_6;
        }
      }

      LOBYTE(v2) = byte_10000C058;
    }

    else
    {
LABEL_6:
      LOBYTE(v2) = byte_10000C058 ^ 1;
    }
  }

  return v2 & 1;
}

void *makevfslist(const char *a1)
{
  if (!a1) {
    return 0LL;
  }
  int v1 = a1;
  if (strchr(a1, 47)) {
    sub_100006C50();
  }
  if (*v1 == 110 && v1[1] == 111)
  {
    v1 += 2;
    byte_10000C058 = 1;
  }

  int v2 = 0;
  for (uint64_t i = v1; *i == 44; ++i)
  {
    ++v2;
LABEL_11:
    ;
  }

  if (*i) {
    goto LABEL_11;
  }
  uint64_t v4 = malloc(8LL * (v2 + 2));
  int v5 = v4;
  if (v4)
  {
    *uint64_t v4 = v1;
    int v6 = strchr(v1, 44);
    uint64_t v7 = 1LL;
    if (v6)
    {
      do
      {
        char *v6 = 0;
        __int128 v8 = v6 + 1;
        uint64_t v9 = v7 + 1;
        v5[v7] = v8;
        int v6 = strchr(v8, 44);
        uint64_t v7 = v9;
      }

      while (v6);
      uint64_t v7 = v9;
    }

    v5[v7] = 0LL;
  }

  else
  {
    warn(0LL);
  }

  return v5;
}

void sub_100006C50()
{
  *__error() = 22;
  err(1, "invalid fstype");
}

void sub_100006C74()
{
  int v0 = *__error();
  if (dword_10000C050) {
    int v1 = v0;
  }
  else {
    int v1 = 75;
  }
  err(v1, "failed to allocate memory for arguments");
}

void sub_100006CA4()
{
  int v0 = __error();
  int v1 = sub_100006B00((unsigned int *)v0);
  err(v1, "getmntinfo");
}

uint64_t sub_100006CC0(_DWORD *a1)
{
  unsigned int v2 = *__error();
  uint64_t result = sysexit_np(v2);
  if (dword_10000C050) {
    int v4 = v2;
  }
  else {
    int v4 = result;
  }
  *a1 = v4;
  return result;
}

void sub_100006D0C(const char *a1)
{
  unsigned int v2 = __error();
  int v3 = sub_100006B00((unsigned int *)v2);
  errx(v3, "unknown special file or file system %s.", a1);
}

void sub_100006D38()
{
  if (dword_10000C050) {
    int v0 = 7;
  }
  else {
    int v0 = 64;
  }
  errc(v0, 7, "too many mount arguments");
}