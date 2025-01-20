uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  kern_return_t v5;
  unint64_t v6;
  FILE *v7;
  FILE *v8;
  const char *v9;
  const char *v10;
  const char *v12;
  const char *v13;
  mach_msg_type_number_t init_port_setCnt;
  mach_port_array_t init_port_set;
  v4 = objc_autoreleasePoolPush();
  init_port_set = 0LL;
  init_port_setCnt = 0;
  v5 = mach_ports_lookup(mach_task_self_, &init_port_set, &init_port_setCnt);
  if (v5)
  {
    sub_100002FE8(v5);
  }

  else
  {
    if (!init_port_setCnt) {
      goto LABEL_17;
    }
    v6 = 0LL;
    v7 = (FILE *)qword_100008038;
    do
    {
      if (v7
        || (v7 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
            (qword_100008038 = (uint64_t)v7) != 0))
      {
        fprintf(v7, "%d Found valid port: %d Valid: %d\n", v6, init_port_set[v6], init_port_set[v6] - 1 < 0xFFFFFFFE);
        fprintf( __stderrp,  "%d Found valid port: %d Valid: %d\n",  v6,  init_port_set[v6],  init_port_set[v6] - 1 < 0xFFFFFFFE);
        v7 = (FILE *)qword_100008038;
      }

      ++v6;
    }

    while (v6 < init_port_setCnt);
    if (!init_port_setCnt) {
LABEL_17:
    }
      sub_100002F64();
    dword_100008040 = *init_port_set;
    if (a1 == 3)
    {
      v9 = *(const char **)(a2 + 8);
      v10 = *(const char **)(a2 + 16);
LABEL_16:
      sub_100002484(v9, v10);
      objc_autoreleasePoolPop(v4);
      return 0LL;
    }

    if (a1 == 1)
    {
      v8 = (FILE *)qword_100008038;
      if (qword_100008038
        || (v8 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
            (qword_100008038 = (uint64_t)v8) != 0))
      {
        fwrite("Using default cache paths\n", 0x1AuLL, 1uLL, v8);
        fwrite("Using default cache paths\n", 0x1AuLL, 1uLL, __stderrp);
      }

      v9 = "/System/Library/xpc/launchd.plist";
      v10 = "/System/Library/xpc/launchd.plist.sig";
      goto LABEL_16;
    }
  }

  v12 = (const char *)sub_100002F78();
  return sub_100002484(v12, v13);
}

uint64_t sub_100002484(const char *a1, const char *a2)
{
  kern_return_t v22;
  FILE *v23;
  id v24;
  FILE *v25;
  id v26;
  const __SecCode *v27;
  FILE *v28;
  int v30;
  void *v31;
  const char *v32;
  char *v33;
  CFDictionaryRef information;
  SecStaticCodeRef staticCode;
  io_connect_t connect;
  uint64_t input[16];
  v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    fprintf(v4, "Code: %s Sig: %s\n", a1, a2);
    fprintf(__stderrp, "Code: %s Sig: %s\n", a1, a2);
  }

  v33 = 0LL;
  if (sub_100002C9C("kern.bootargs", &v33) && v33)
  {
    if (sub_100002E28(v33, "launchd_unsecure_cache=", 0LL))
    {
      v5 = (FILE *)qword_100008038;
      if (qword_100008038
        || (v5 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
            (qword_100008038 = (uint64_t)v5) != 0))
      {
        fprintf(v5, "Using unsecure cache: %s\n", a1);
        fprintf(__stderrp, "Using unsecure cache: %s\n", a1);
      }

      return sub_100002954(a1);
    }
  }

  else
  {
    v6 = (FILE *)qword_100008038;
    if (qword_100008038
      || (v6 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
          (qword_100008038 = (uint64_t)v6) != 0))
    {
      fwrite("No boot-args\n", 0xDuLL, 1uLL, v6);
      fwrite("No boot-args\n", 0xDuLL, 1uLL, __stderrp);
    }
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  a1,  0LL,  0LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  a2,  0LL,  0LL));
  staticCode = 0LL;
  uint64_t v9 = SecStaticCodeCreateWithPath((CFURLRef)v7, 0, &staticCode);
  if ((_DWORD)v9)
  {
    uint64_t v11 = sub_100003438(input, v9);
    goto LABEL_36;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v8));
  uint64_t v11 = SecCodeSetDetachedSignature(staticCode, v10, 0LL);
  if ((_DWORD)v11)
  {
LABEL_36:
    uint64_t v14 = sub_1000033C0(input, v11);
LABEL_37:
    sub_100003348(input, v14);
    goto LABEL_38;
  }

  uint64_t v12 = SecStaticCodeCheckValidity(staticCode, 6u, 0LL);
  if ((_DWORD)v12 != -66996)
  {
    uint64_t v13 = v12;
    if ((_DWORD)v12) {
      goto LABEL_42;
    }
  }

  information = 0LL;
  uint64_t v14 = SecCodeCopySigningInformation(staticCode, 0, &information);
  if ((_DWORD)v14) {
    goto LABEL_37;
  }
  CFDictionaryRef v15 = information;
  id v16 = (id)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( information,  "objectForKeyedSubscript:",  kSecCodeInfoUnique));
  v17 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v17);
  if (!MatchingService)
  {
LABEL_38:
    sub_1000030D4();
    goto LABEL_39;
  }

  io_object_t v19 = MatchingService;
  connect = 0;
  if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
  {
LABEL_39:
    sub_1000032D8();
    goto LABEL_40;
  }

  input[0] = 1LL;
  io_connect_t v20 = connect;
  id v21 = v16;
  v22 = IOConnectCallMethod( v20,  6u,  input,  1u,  [v21 bytes],  (size_t)objc_msgSend(v21, "length"),  0,  0,  0,  0);
  if (v22)
  {
    v30 = v22;
    v31 = v21;
    if (v30 == -536870160) {
      sub_10000324C(v21);
    }
    goto LABEL_41;
  }

  v23 = (FILE *)qword_100008038;
  if (qword_100008038
    || (v23 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
        (qword_100008038 = (uint64_t)v23) != 0))
  {
    v24 = objc_claimAutoreleasedReturnValue([v21 description]);
    fprintf(v23, "cdhash: %s is trusted\n", (const char *)[v24 UTF8String]);

    v25 = __stderrp;
    v26 = objc_claimAutoreleasedReturnValue([v21 description]);
    fprintf(v25, "cdhash: %s is trusted\n", (const char *)[v26 UTF8String]);
  }

  if (!connect) {
    sub_100002F64();
  }
  IOServiceClose(connect);
  IOObjectRelease(v19);

  v27 = staticCode;
  if (!v27) {
    sub_100002F64();
  }
  uint64_t v7 = SecCodeMapMemory(v27, 0);
  CFRelease(v27);
  if (!(_DWORD)v7)
  {
    v28 = (FILE *)qword_100008038;
    if (qword_100008038
      || (v28 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"),
          (qword_100008038 = (uint64_t)v28) != 0))
    {
      fwrite("Attached signature to file, checking ...\n", 0x29uLL, 1uLL, v28);
      fwrite("Attached signature to file, checking ...\n", 0x29uLL, 1uLL, __stderrp);
    }

    return sub_100002954(a1);
  }

LABEL_40:
  v31 = (void *)sub_1000031D4(input, v7);
LABEL_41:
  sub_100003144(v31, v30);
LABEL_42:
  v32 = (const char *)sub_10000305C(input, v13);
  return sub_100002954(v32);
}

uint64_t sub_100002954(const char *a1)
{
  int v1 = open(a1, 0);
  if (v1 == -1)
  {
    sub_1000034B0();
LABEL_24:
    sub_1000036B0();
  }

  int v2 = v1;
  memset(&v12, 0, sizeof(v12));
  if (fstat(v1, &v12)) {
    goto LABEL_24;
  }
  v3 = mmap(0LL, v12.st_size, 1, 2, v2, 0LL);
  if (v3 == (void *)-1LL)
  {
    sub_100003530();
LABEL_26:
    sub_100003640();
  }

  int v4 = dword_100008040;
  v5 = v3;
  v6 = (FILE *)qword_100008038;
  if (!qword_100008038)
  {
    v6 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w");
    qword_100008038 = (uint64_t)v6;
    if (!v6) {
      goto LABEL_9;
    }
    int v4 = dword_100008040;
  }

  fprintf(v6, "Trying to send bytes to launchd: %d %lu\n", v4, vm_page_size);
  fprintf(__stderrp, "Trying to send bytes to launchd: %d %lu\n", dword_100008040, vm_page_size);
LABEL_9:
  __dst = 0LL;
  int v7 = sub_100002E94( dword_100008040,  (v12.st_size + vm_page_size - 1) & -(uint64_t)vm_page_size,  (mach_vm_address_t *)&__dst,  1);
  if (v7) {
    sub_1000035CC(v7);
  }
  v8 = (FILE *)qword_100008038;
  if (qword_100008038
    || (v8 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v8) != 0))
  {
    fwrite("Sending validated cache to launchd\n", 0x23uLL, 1uLL, v8);
    fwrite("Sending validated cache to launchd\n", 0x23uLL, 1uLL, __stderrp);
  }

  memcpy(__dst, v5, v12.st_size);
  uint64_t v9 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v9 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v9) != 0))
  {
    fwrite("Cache sent to launchd successfully\n", 0x23uLL, 1uLL, v9);
    fwrite("Cache sent to launchd successfully\n", 0x23uLL, 1uLL, __stderrp);
  }

  if (!v5) {
    sub_100002F64();
  }
  if (munmap(v5, v12.st_size) == -1) {
    sub_1000035B0();
  }
  uint64_t result = close(v2);
  if ((_DWORD)result == -1) {
    return sub_1000035B0();
  }
  return result;
}

uint64_t sub_100002BA4()
{
  return abort_with_reason(7LL, 1LL, v0, 0LL);
}

uint64_t sub_100002BB8(_OWORD *a1, uint64_t a2)
{
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return DebugGetErrorString(a2, a1, 128LL);
}

uint64_t sub_100002BE4(FILE *a1)
{
  return fprintf(a1, v1);
}

uint64_t sub_100002BEC()
{
  return _os_assert_log(0LL);
}

char *sub_100002BF4(int *a1)
{
  return strerror(*a1);
}

int *sub_100002BFC()
{
  return __error();
}

uint64_t sub_100002C08()
{
  return 1LL;
}

char *sub_100002C24(char *a1, ...)
{
  int v4 = 0LL;
  while (1)
  {
    vasprintf(&v4, a1, va);
    uint64_t result = v4;
    if (v4) {
      break;
    }
    if (*__error() != 12)
    {
      int v3 = *__error();
      if (v3) {
        sub_100003730(v3);
      }
    }

    sub_100002C08();
  }

  return result;
}

uint64_t sub_100002C94(int a1)
{
  return _os_assert_log(a1);
}

size_t sub_100002C9C(const char *a1, char **a2)
{
  *__error() = 0;
  memset(v12, 0, sizeof(v12));
  size_t __size = 128LL;
  int v4 = sysctlbyname(a1, v12, &__size, 0LL, 0LL);
  int v5 = v4;
  if (__size)
  {
    if (!v4) {
      goto LABEL_6;
    }
  }

  else
  {
    size_t __size = 128LL;
    *__error() = 12;
    if (!v5) {
      goto LABEL_6;
    }
  }

  if (*__error() != 12) {
    return 0LL;
  }
LABEL_6:
  if (__size != 128 || *__error() != 12)
  {
    v10 = 0LL;
    v8 = (char *)v12;
    if (v5) {
      goto LABEL_13;
    }
LABEL_16:
    *a2 = strdup(v8);
    goto LABEL_17;
  }

  int v6 = sysctlbyname(a1, 0LL, &__size, 0LL, 0LL);
  size_t result = 0LL;
  if (v6) {
    return result;
  }
  if (__size < 0x81)
  {
    v10 = 0LL;
    v8 = (char *)v12;
    goto LABEL_16;
  }

  v8 = (char *)sub_100002F08(__size);
  int v9 = sysctlbyname(a1, v8, &__size, 0LL, 0LL);
  v10 = v8;
  if (!v9) {
    goto LABEL_16;
  }
LABEL_13:
  size_t __size = 0LL;
LABEL_17:
  free(v10);
  return __size;
}

unint64_t sub_100002E28(const char *a1, const char *a2, uint64_t a3)
{
  int v5 = strstr(a1, a2);
  if (v5)
  {
    __endptr = 0LL;
    int v6 = &v5[strlen(a2)];
    unint64_t v7 = strtoul(v6, &__endptr, 10);
    if (v6 != __endptr) {
      return v7;
    }
  }

  return a3;
}

uint64_t sub_100002E94(mem_entry_name_port_t object, mach_vm_size_t size, mach_vm_address_t *a3, int a4)
{
  mach_vm_address_t address = 0LL;
  uint64_t result = mach_vm_map(mach_task_self_, &address, size, 0LL, 1, object, 0LL, a4 ^ 1, 67, 67, 2u);
  if (!(_DWORD)result) {
    *a3 = address;
  }
  return result;
}

void *sub_100002F08(size_t __size)
{
  do
  {
    int v2 = calloc(1uLL, __size);
    if (v2) {
      break;
    }
    if (*__error() != 12)
    {
      int v3 = *__error();
      if (v3) {
        sub_100003744(v3);
      }
    }
  }

  while (sub_100002C08());
  return v2;
}

void sub_100002F64()
{
  uint64_t v0 = sub_100002BEC();
  _os_crash(v0);
  __break(1u);
}

uint64_t sub_100002F78()
{
  uint64_t v0 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v0 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v0) != 0))
  {
    sub_100002BE4(v0);
    sub_100002BE4(__stderrp);
  }

  uint64_t v1 = sub_100002BA4();
  return sub_100002FE8(v1);
}

uint64_t sub_100002FE8(int a1)
{
  uint64_t v1 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v1 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v1) != 0))
  {
    sub_100002BE4(v1);
    sub_100002BE4(__stderrp);
  }

  int v2 = (_OWORD *)sub_100002BA4();
  return sub_10000305C(v2, v3);
}

uint64_t sub_10000305C(_OWORD *a1, uint64_t a2)
{
  int v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    sub_100002BE4(v4);
    sub_100002BE4(__stderrp);
  }

  uint64_t v5 = sub_100002BA4();
  return sub_1000030D4(v5);
}

uint64_t sub_1000030D4()
{
  uint64_t v0 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v0 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v0) != 0))
  {
    sub_100002BE4(v0);
    sub_100002BE4(__stderrp);
  }

  uint64_t v1 = sub_100002BA4();
  return sub_100003144(v1);
}

uint64_t sub_100003144(void *a1, int a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_100002C24("Unknown error (%d) checking cdhash %s", a2, (const char *)[v3 UTF8String]);

  int v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    sub_100002BE4(v4);
    sub_100002BE4(__stderrp);
  }

  uint64_t v5 = sub_100002BA4();
  return sub_1000031D4(v5);
}

uint64_t sub_1000031D4(_OWORD *a1, uint64_t a2)
{
  int v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    sub_100002BE4(v4);
    sub_100002BE4(__stderrp);
  }

  uint64_t v5 = sub_100002BA4();
  return sub_10000324C(v5);
}

uint64_t sub_10000324C(void *a1)
{
  id v1 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_100002C24("cdhash: %s is not in trust cache", (const char *)[v1 UTF8String]);

  int v2 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v2 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v2) != 0))
  {
    sub_100002BE4(v2);
    sub_100002BE4(__stderrp);
  }

  uint64_t v3 = sub_100002BA4();
  return sub_1000032D8(v3);
}

uint64_t sub_1000032D8()
{
  uint64_t v0 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v0 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v0) != 0))
  {
    sub_100002BE4(v0);
    sub_100002BE4(__stderrp);
  }

  uint64_t v1 = sub_100002BA4();
  return sub_100003348(v1);
}

uint64_t sub_100003348(_OWORD *a1, uint64_t a2)
{
  int v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    sub_100002BE4(v4);
    sub_100002BE4(__stderrp);
  }

  uint64_t v5 = sub_100002BA4();
  return sub_1000033C0(v5);
}

uint64_t sub_1000033C0(_OWORD *a1, uint64_t a2)
{
  int v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    sub_100002BE4(v4);
    sub_100002BE4(__stderrp);
  }

  uint64_t v5 = sub_100002BA4();
  return sub_100003438(v5);
}

uint64_t sub_100003438(_OWORD *a1, uint64_t a2)
{
  int v4 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v4 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v4) != 0))
  {
    sub_100002BE4(v4);
    sub_100002BE4(__stderrp);
  }

  sub_100002BA4();
  return sub_1000034B0();
}

uint64_t sub_1000034B0()
{
  uint64_t v1 = sub_100002BFC();
  int v2 = sub_100002BF4(v1);
  sub_100002C24("Failed to open fd [%d|%s]", v0, v2);
  uint64_t v3 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v3 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v3) != 0))
  {
    sub_100002BE4(v3);
    sub_100002BE4(__stderrp);
  }

  uint64_t v4 = sub_100002BA4();
  return sub_100003530(v4);
}

uint64_t sub_100003530()
{
  uint64_t v1 = sub_100002BFC();
  int v2 = sub_100002BF4(v1);
  sub_100002C24("failed mmap [%d|%s]", v0, v2);
  uint64_t v3 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v3 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v3) != 0))
  {
    sub_100002BE4(v3);
    sub_100002BE4(__stderrp);
  }

  sub_100002BA4();
  return sub_1000035B0();
}

uint64_t sub_1000035B0()
{
  int v0 = __error();
  return _os_assumes_log(*v0);
}

void sub_1000035CC(int a1)
{
  uint64_t v1 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v1 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v1) != 0))
  {
    sub_100002BE4(v1);
    sub_100002BE4(__stderrp);
  }

  uint64_t v2 = sub_100002BA4();
  sub_100003640(v2);
}

void sub_100003640()
{
  int v0 = (FILE *)qword_100008038;
  if (qword_100008038
    || (int v0 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v0) != 0))
  {
    sub_100002BE4(v0);
    sub_100002BE4(__stderrp);
  }

  uint64_t v1 = sub_100002BA4();
  sub_1000036B0(v1);
}

void sub_1000036B0()
{
  uint64_t v1 = sub_100002BFC();
  uint64_t v2 = sub_100002BF4(v1);
  sub_100002C24("failed to stat fd [%d|%s]", v0, v2);
  uint64_t v3 = (FILE *)qword_100008038;
  if (qword_100008038
    || (uint64_t v3 = fopen("/var/log/com.apple.xpc.launchd/launchd_cache_loader.log", "w"), (qword_100008038 = (uint64_t)v3) != 0))
  {
    sub_100002BE4(v3);
    sub_100002BE4(__stderrp);
  }

  int v4 = sub_100002BA4();
  sub_100003730(v4);
}

void sub_100003730(int a1)
{
  uint64_t v1 = sub_100002C94(a1);
  _os_crash(v1);
  __break(1u);
}

void sub_100003744(int a1)
{
  uint64_t v1 = _os_assert_log(a1);
  uint64_t v2 = (const void *)_os_crash(v1);
  __break(1u);
  CFRelease(v2);
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}