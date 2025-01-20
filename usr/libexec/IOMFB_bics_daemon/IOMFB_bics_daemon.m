uint64_t start()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFDataRef CFProperty;
  uint64_t Length;
  size_t v4;
  timespec v5;
  int v6;
  const char *v7;
  int v8;
  int v10;
  timespec v11;
  char *v12;
  size_t v13;
  int v14;
  stat v15;
  mach_port_t mainPort[4];
  timespec v17;
  timespec v18;
  timespec v19;
  timespec v20;
  CFRange v21;
  puts("checking in");
  if ((chdir(off_100014008) & 0x80000000) == 0)
  {
LABEL_2:
    fflush(__stdoutp);
    mainPort[0] = -1431655766;
    if (!IOMainPort(0, mainPort))
    {
      v0 = IORegistryEntryFromPath(mainPort[0], "IODeviceTree:/chosen");
      if (v0)
      {
        v1 = v0;
        CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( v0,  @"osenvironment",  kCFAllocatorDefault,  0);
        Length = CFDataGetLength(CFProperty);
        if (CFProperty && (v4 = Length, Length <= 64))
        {
          v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          v15.st_atimespec = v5;
          v15.st_mtimespec = v5;
          *(timespec *)&v15.st_dev = v5;
          *(timespec *)&v15.st_uid = v5;
          v21.location = 0LL;
          v21.length = Length;
          CFDataGetBytes(CFProperty, v21, (UInt8 *)&v15);
          v6 = strncmp("darwinos-ramdisk", (const char *)&v15, v4);
          CFRelease(CFProperty);
          IOObjectRelease(v1);
          if (!v6)
          {
            *(_OWORD *)&v15.st_dev = off_100010440;
            sigaction(31, (const sigaction *)&v15, 0LL);
            while (1)
              usleep(0xF4240u);
          }
        }

        else
        {
          if (CFProperty) {
            CFRelease(CFProperty);
          }
          IOObjectRelease(v1);
        }
      }
    }

    *(_OWORD *)&v15.st_dev = off_100010450;
    sigaction(15, (const sigaction *)&v15, 0LL);
    sigaction(3, (const sigaction *)&v15, 0LL);
    sigaction(2, (const sigaction *)&v15, 0LL);
    xpc_activity_register("com.apple.iomfb_bics_daemon", XPC_ACTIVITY_CHECK_IN, &stru_100010480);
    dispatch_main();
  }

  v7 = off_100014000[0];
  v8 = *off_100014000[0];
  if (v8 == 47)
  {
    if (chdir("/")) {
      goto LABEL_11;
    }
    v10 = *(unsigned __int8 *)++v7;
    v8 = v10;
  }

  if (!v8) {
    goto LABEL_2;
  }
  while (1)
  {
    v11.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v11.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    v19 = v11;
    v20 = v11;
    v17 = v11;
    v18 = v11;
    *(timespec *)mainPort = v11;
    *(timespec *)&v15.st_blksize = v11;
    *(timespec *)v15.st_qspare = v11;
    v15.st_birthtimespec = v11;
    *(timespec *)&v15.st_size = v11;
    v15.st_mtimespec = v11;
    v15.st_ctimespec = v11;
    *(timespec *)&v15.st_uid = v11;
    v15.st_atimespec = v11;
    *(timespec *)&v15.st_dev = v11;
    v12 = strchr(v7, 47);
    v13 = v12 ? v12 - v7 : strlen(v7);
    if (v13 - 80 < 0xFFFFFFFFFFFFFFAFLL) {
      break;
    }
    __strncpy_chk(mainPort, v7, v13, 80LL);
    *((_BYTE *)mainPort + v13) = 0;
    if (stat((const char *)mainPort, &v15))
    {
    }

    v7 = &v7[v13 - 1];
    do
      v14 = *(unsigned __int8 *)++v7;
    while (v14 == 47);
    if (!*v7) {
      goto LABEL_2;
    }
  }

LABEL_11:
  printf("failed to connect to working directory");
  return 1LL;
}

void sub_100004224()
{
  do
    unint64_t v0 = __ldaxr((unint64_t *)&dword_100014010);
  while (__stlxr(v0 | 1, (unint64_t *)&dword_100014010));
  if ((v0 & 1) != 0) {
    unsigned int v1 = 3;
  }
  else {
    unsigned int v1 = v0 >> 1;
  }
  if (v1 - 2 >= 2)
  {
    if (!v1) {
      sub_100004988((char *)qword_100014258);
    }
    exit(0);
  }
}

void sub_100004280(id a1, OS_xpc_object *a2)
{
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  if (state == 2)
  {
    if (qword_100014258)
    {
      do
        unint64_t v4 = __ldaxr((unint64_t *)&dword_100014010);
      while (__stlxr(v4 | 4, (unint64_t *)&dword_100014010));
      if (v4 >= 2)
      {
        puts("State transition error");
        exit(1);
      }

      if ((dword_100014010 & 0xFFFFFFFE) != 4) {
        printf("%s(%d), op failed\n", "set_state", 2);
      }
      if (!(_DWORD)v4)
      {
        puts("woke");
        fflush(__stdoutp);
        sub_100004A20((char *)qword_100014258);
      }

      do
        char v5 = __ldaxr((unint64_t *)&dword_100014010);
      while (__stlxr(v5 & 1, (unint64_t *)&dword_100014010));
      if ((v5 & 1) != 0) {
        exit(0);
      }
      goto LABEL_21;
    }
  }

  else
  {
    if (state)
    {
      printf("xpc_activity_state_t state = %lld, d=%d\n");
LABEL_21:
      puts("sleeping");
      fflush(__stdoutp);
      return;
    }

    if (!qword_100014258)
    {
      puts("starting");
      fflush(__stdoutp);
      qword_100014258 = (uint64_t)sub_100004714(0LL);
      if (qword_100014258)
      {
        do
          char v3 = __ldaxr((unint64_t *)&dword_100014010);
        while (__stlxr(v3 & 1, (unint64_t *)&dword_100014010));
        goto LABEL_21;
      }

      puts("failed to start properly");
      xpc_activity_unregister("com.apple.iomfb_bics_daemon");
    }
  }

uint64_t sub_100004480(int a1)
{
  return ((a1 + 217) & 0xFFFFFFFC) + 4;
}

uint64_t sub_100004490(_DWORD *a1)
{
  if (*a1 == 1) {
    return 14LL;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000044A4(uint64_t result, int a2)
{
  if (result)
  {
    if (*(_DWORD *)result == 1
      && (int v2 = *(_DWORD *)(result + 8) + *(unsigned __int16 *)(result + 4) * *(unsigned __int16 *)(result + 6), v2 != -14))
    {
      unsigned int v3 = (v2 + 17) & 0xFFFFFFFC;
      if (a2) {
        int v4 = 4;
      }
      else {
        int v4 = 0;
      }
      return v3 + v4;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

_DWORD *sub_1000044F0(_DWORD *result)
{
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)(result[2] + 14);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

BOOL sub_100004514(const char *a1, size_t __n, char *__s2, int a4)
{
  return (_DWORD)__n == a4 && strncmp(a1, __s2, __n) == 0;
}

int *sub_10000454C(int *result, int a2, int *a3)
{
  for (int i = *a3; a2; --a2)
  {
    int v4 = *result++;
    int i = v4 ^ __ROR4__(i, 15);
  }

  *a3 = i;
  return result;
}

void sub_10000456C(int a1, int a2, uint64_t a3, intptr_t notificationID)
{
  switch((_DWORD)a3)
  {
    case 0xE0000320:
      byte_100014019 = 0;
      (*(void (**)(uint64_t, void, uint64_t, intptr_t))(*(void *)qword_100014700 + 64LL))( qword_100014700,  0LL,  a3,  notificationID);
      if (byte_10001401C) {
        BOOL v5 = byte_10001401B == 0;
      }
      else {
        BOOL v5 = 1;
      }
      if (!v5)
      {
        sub_10000587C("Woke up: resuming pending tasks.\n");
        uint64_t v7 = 1LL;
        IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v7);
        uint64_t v7 = 0LL;
        IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v7);
      }

      break;
    case 0xE0000280:
      if (byte_10001401A) {
        v6 = (const char *)&unk_10000B903;
      }
      else {
        v6 = "not ";
      }
      sub_10000587C("going to sleep, %sbusy", v6);
      (*(void (**)(uint64_t, uint64_t))(*(void *)qword_100014700 + 64LL))(qword_100014700, 1LL);
      pthread_mutex_lock(&stru_100014020);
      if (byte_10001401A)
      {
        byte_100014019 = 1;
        pthread_cond_wait(&stru_100014060, &stru_100014020);
      }

      pthread_mutex_unlock(&stru_100014020);
      sub_10000587C("allowing sleep");
      goto LABEL_19;
    case 0xE0000270:
LABEL_19:
      IOAllowPowerChange(dword_10001470C, notificationID);
      break;
  }

char *sub_100004714(uint64_t a1)
{
  qword_100014700 = 0LL;
  io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject(qword_100014098);
  unsigned int v3 = sub_100005510(ServiceObject, "IOMFBBICSType");
  if (v3 == 2)
  {
    sub_10000587C("BICS backlight support");
    int v4 = (uint64_t (***)(void *, uint64_t, uint64_t, __n128))operator new(0x128uLL);
    sub_1000096B0((uint64_t)v4);
LABEL_7:
    qword_100014700 = (uint64_t)v4;
    if (((**v4)(v4, qword_100014098, a1, v5) & 1) != 0)
    {
      byte_10001401C = sub_100005510(ServiceObject, "BICSSaveYielding") != 0;
      *(_BYTE *)(qword_100014700 + 8) = byte_10001401C;
      uint64_t v8 = 1LL;
      IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v8);
      if (sub_10000AC20("iomfb_bics_daemon.started"))
      {
        sub_10000587C("daemon already started");
LABEL_16:
        v6 = &byte_100014018;
        uint64_t v8 = 0LL;
        IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v8);
        sub_10000B0F0(&qword_100014090);
        byte_100014018 = 1;
        byte_10001401B = 0;
        return v6;
      }

      sub_10000587C("Daemon hasn't yet started");
      if ((*(unsigned int (**)(uint64_t, char *, char *))(*(void *)qword_100014700 + 8LL))( qword_100014700,  off_100014000[0],  off_100014008))
      {
        sub_10000AC5C("iomfb_bics_daemon.started");
        sub_10000587C("start declared");
        (*(void (**)(uint64_t))(*(void *)qword_100014700 + 32LL))(qword_100014700);
        goto LABEL_16;
      }

      uint64_t v8 = 0LL;
      IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v8);
    }

    goto LABEL_11;
  }

  if (v3 == 1)
  {
    sub_10000587C("BICS pixel support");
    int v4 = (uint64_t (***)(void *, uint64_t, uint64_t, __n128))operator new(0x98uLL);
    v5.n128_f64[0] = sub_1000062A4((uint64_t)v4);
    goto LABEL_7;
  }

  sub_10000587C("BICS no support");
  qword_100014700 = 0LL;
LABEL_11:
  sub_100004944();
  return 0LL;
}

void sub_10000492C(_Unwind_Exception *a1)
{
}

void sub_100004944()
{
  if (qword_100014098) {
    CFRelease((CFTypeRef)qword_100014098);
  }
  qword_100014098 = 0LL;
  if (qword_100014700)
  {
    unint64_t v0 = (void *)nullsub_2();
    operator delete(v0);
  }

  qword_100014700 = 0LL;
}

uint64_t sub_100004988(char *a1)
{
  if (a1 == &byte_100014018)
  {
    uint64_t v3 = 1LL;
    IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v3);
    uint64_t v1 = sub_100005330(qword_100014700);
    uint64_t v3 = 0LL;
    IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v3);
  }

  else
  {
    syslog(5, "totally bogus daemon pointer.");
    return 3758097084LL;
  }

  return v1;
}

uint64_t sub_100004A20(char *a1)
{
  if (a1 == &byte_100014018)
  {
    pthread_mutex_lock(&stru_100014020);
    if (byte_100014019)
    {
      pthread_mutex_unlock(&stru_100014020);
      return 0LL;
    }

    else
    {
      byte_10001401A = 1;
      pthread_mutex_unlock(&stru_100014020);
      uint64_t v5 = 1LL;
      IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v5);
      uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)qword_100014700 + 24LL))(qword_100014700);
      if ((_DWORD)v1 == -536870165) {
        byte_10001401B = 1;
      }
      uint64_t v5 = 0LL;
      IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v5);
      pthread_mutex_lock(&stru_100014020);
      byte_10001401A = 0;
      if (byte_100014019)
      {
        byte_100014019 = 0;
        pthread_cond_signal(&stru_100014060);
      }

      pthread_mutex_unlock(&stru_100014020);
      sub_10000587C("done");
      int v2 = sem_open("iomfb_bics_daemon.started", 0);
      if (v2 == (sem_t *)-1LL)
      {
        sub_10000587C("Couldn't open semaphore to notify");
      }

      else
      {
        uint64_t v3 = v2;
        sem_post(v2);
        sem_close(v3);
      }
    }
  }

  else
  {
    uint64_t v1 = 3758097084LL;
    syslog(5, "totally bogus daemon pointer.");
  }

  return v1;
}

char *sub_100004B90()
{
  byte_100014708 = 1;
  byte_100014709 = 1;
  result = sub_100004714(1LL);
  if (result)
  {
    int v6 = -1431655766;
    *(void *)&__int128 v1 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v5[4] = v1;
    v5[5] = v1;
    v5[2] = v1;
    v5[3] = v1;
    v5[0] = v1;
    v5[1] = v1;
    uint64_t v4 = 1LL;
    IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v4);
    (*(void (**)(uint64_t, _OWORD *))(*(void *)qword_100014700 + 40LL))(qword_100014700, v5);
    uint64_t v4 = 0LL;
    IOMobileFramebufferSetParameter(qword_100014098, 11LL, 1LL, &v4);
    int v2 = fopen("/var/hardware/done", "w");
    if (!v2)
    {
      sub_100004D6C("Couldn't open 'done' file");
      exit(-1);
    }

    uint64_t v3 = v2;
    fprintf(v2, "%s\n", (const char *)v5);
    return (char *)fclose(v3);
  }

  return result;
}

uint64_t sub_100004CB8(uint64_t result)
{
  *(void *)result = off_1000104B0;
  *(void *)(result + 16) = 0LL;
  *(_DWORD *)(result + 25) = 0;
  return result;
}

uint64_t sub_100004CD4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  return 1LL;
}

uint64_t sub_100004CE0(uint64_t a1, const __CFString *a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults");
  if (v3)
  {
    io_object_t v4 = v3;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v3, a2, kCFAllocatorDefault, 0);
    IOObjectRelease(v4);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      char v6 = 1;
    }

    else
    {
      char v6 = 0;
    }
  }

  else
  {
    sub_100004D6C("unable to find /defaults node\n");
  }

  return v6 & 1;
}

void sub_100004D6C(char *a1, ...)
{
  if (byte_10001470A)
  {
    vprintf(a1, va);
    fputc(10, __stdoutp);
  }

uint64_t sub_100004DD4(uint64_t a1)
{
  uint64_t result = sub_100004CE0(a1, @"ean-storage-present");
  *(_BYTE *)(a1 + 25) = result;
  return result;
}

uint64_t sub_100004E00(uint64_t a1)
{
  uint64_t result = sub_100004CE0(a1, @"display-storage-present");
  *(_BYTE *)(a1 + 24) = result;
  return result;
}

uint64_t sub_100004E2C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
}

void sub_100004E58(uint64_t a1)
{
  time_t v2 = time(0LL);
  bzero(&v44[3], 0x5ECuLL);
  v44[0] = 1;
  *(void *)&v44[1] = v2;
  *(void *)&v44[5] = v2;
  memcpy(v43, &unk_10000CF20, sizeof(v43));
  memcpy(__dst, &unk_10000D120, sizeof(__dst));
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v40[12] = v3;
  __int128 v39 = v3;
  *(_OWORD *)v40 = v3;
  __int128 v36 = xmmword_10000FB50;
  __int128 v37 = unk_10000FB60;
  __int128 v38 = xmmword_10000FB70;
  int v35 = -1;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  v33 = 0LL;
  uint64_t v32 = 0LL;
  unsigned int v31 = 0;
  v41[1] = 0LL;
  v41[0] = 0LL;
  io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject(*(void *)(a1 + 16));
  unsigned int v5 = sub_100005510(ServiceObject, "ean-mode-caching");
  unsigned int v6 = sub_100005510(ServiceObject, "ean-mode-update-thesh");
  if (v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 172800LL;
  }
  if (v5 && *(_BYTE *)(a1 + 25))
  {
    if (!sub_1000055B8(0x50525354u, (void **)&v33, (_DWORD *)&v32 + 1))
    {
      if (HIDWORD(v32) > 0x3FF)
      {
        uint64_t v8 = v33;
        if (v33)
        {
          v9 = (uint64_t *)(v33 + 5);
          if (*(void *)(v33 + 5))
          {
            sub_10000454C(v33 + 5, 2, (int *)&v32);
            if (*(void *)(v8 + 7) == v32)
            {
              uint64_t v10 = *v9;
              if (v2 != *v9)
              {
                if ((v2 - *v9) / (unint64_t)(*(void *)(v8 + 3) + 1LL) < v7)
                {
LABEL_44:
                  free(v8);
                  return;
                }

                *(void *)&v44[3] = *(void *)(v8 + 3) + 1LL;
                *(void *)&v44[5] = v10;
              }
            }
          }
        }
      }

      else
      {
        sub_100004D6C("modeInfoUpdate: size mismatch\n");
        sub_100005710(0x50525354u);
      }
    }

    uint64_t v11 = 0LL;
    v12 = v43;
    while (1)
    {
      HIDWORD(v41[0]) = v11;
      ++v11;
      v12 += 64;
      if (v11 == 8)
      {
        *(void *)&v44[129] = 4LL;
        break;
      }
    }

    uint64_t v13 = 153LL;
    v14 = &dword_10000FB80;
    do
    {
      unsigned int v15 = *v14++;
      v16 = &v43[64 * (unint64_t)v15];
      __int128 v17 = v16[1];
      v30[0] = *v16;
      v30[1] = v17;
      __int128 v18 = v16[3];
      v30[2] = v16[2];
      v30[3] = v18;
      sub_100005440(&v44[v13], v30);
      v13 += 16LL;
    }

    while (v13 != 249);
    uint64_t v19 = 0LL;
    v20 = __dst;
    do
    {
      HIDWORD(v41[0]) = v19;
      int Block = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), 51LL, v20, 600LL, v41, 4LL);
      if (*((_DWORD *)v20 + 2) == 8)
      {
        uint64_t v8 = v33;
        goto LABEL_43;
      }

      int v22 = Block;
      if (Block) {
        BOOL v23 = 1;
      }
      else {
        BOOL v23 = v19 == 17;
      }
      ++v19;
      v20 += 75;
    }

    while (!v23);
    uint64_t v24 = 249LL;
    v25 = &dword_10000FB98;
    do
    {
      unsigned int v26 = *v25++;
      memcpy(v29, &__dst[75 * v26], sizeof(v29));
      sub_1000054A4((uint64_t)&v44[v24], (uint64_t)v29);
      v24 += 16LL;
    }

    while (v24 != 377);
    if (!v22) {
      *(void *)&v44[129] |= 8uLL;
    }
    *(_OWORD *)&v44[131] = v39;
    *(_OWORD *)&v44[135] = *(_OWORD *)v40;
    *(void *)&v44[139] = *(void *)&v40[16];
    v44[141] = v36;
    LOWORD(v44[143]) = WORD4(v36);
    *(_OWORD *)&v44[145] = v37;
    *(_OWORD *)&v44[149] = v38;
    v44[377] = v34;
    LOBYTE(v44[378]) = BYTE4(v34);
    v44[379] = v35;
    sub_10000454C(&v44[129], 252, &v44[381]);
    uint64_t v8 = v33;
    if (v33 && v44[381] == v33[381]) {
      goto LABEL_44;
    }
    sub_10000454C(&v44[5], 2, (int *)&v31);
    *(void *)&v44[7] = v31;
    v27 = malloc(0x1000uLL);
    if (v27)
    {
      v28 = v27;
      bzero(v27, 0x1000uLL);
      memcpy(v28, v44, 0x5F8uLL);
      sub_1000057A0(0x50525354u, (uint64_t)v28, 0x400u);
      free(v28);
    }

LABEL_43:
    if (!v8) {
      return;
    }
    goto LABEL_44;
  }

uint64_t sub_100005330(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  (*(void (**)(uint64_t, void))(*(void *)a1 + 72LL))(a1, 0LL);
  sub_1000053A8(a1, 0);
  sub_100004E58(a1);
  return v2;
}

uint64_t sub_1000053A8(uint64_t a1, unsigned int a2)
{
  io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject(*(void *)(a1 + 16));
  uint64_t v7 = a2;
  uint64_t v5 = IOMobileFramebufferSetParameter(*(void *)(a1 + 16), 24LL, 1LL, &v7);
  sub_10000587C("request_disp_perf_boost( %d) -> %d\n", a2, v5);
  return v5;
}

double sub_100005424(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  double result = *(double *)(a2 + 32);
  *(double *)(a1 + 32) = result;
  return result;
}

float sub_100005440(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2 = 0LL;
  __int128 v3 = a2 + 13;
  *a1 = *a2;
  do
  {
    io_object_t v4 = &a1[v2 + 13];
    *(v4 - 12) = v3[v2 - 12];
    *io_object_t v4 = v3[v2++];
  }

  while (v2 != 3);
  for (uint64_t i = 4LL; i != 13; ++i)
  {
    float result = *(float *)&a2[i];
    *(float *)&a1[i] = result;
  }

  return result;
}

uint64_t sub_100005494(uint64_t result)
{
  else {
    return result;
  }
}

float sub_1000054A4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  int v2 = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(void *)(a1 + 28) = *(void *)(a2 + 28);
  float result = *(float *)(a2 + 36);
  *(float *)(a1 + 36) = result;
  return result;
}

uint64_t sub_1000054FC(int a1, int a2)
{
  return (a1 + a2 - 1) & -a2;
}

CFStringRef sub_100005510(io_registry_entry_t a1, const char *a2)
{
  float result = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  if (result)
  {
    io_object_t v4 = result;
    CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, result, kCFAllocatorDefault, 0);
    CFRelease(v4);
    if (CFProperty)
    {
      unsigned int valuePtr = -1431655766;
      if (!CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr)) {
        unsigned int valuePtr = 0;
      }
      CFRelease(CFProperty);
      return (const __CFString *)valuePtr;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000055B8(unsigned int a1, void **a2, _DWORD *a3)
{
  mach_port_t connection = -1431655766;
  uint64_t v6 = sub_10000AB30(&connection);
  if ((_DWORD)v6) {
    return v6;
  }
  *a2 = 0LL;
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint64_t input = a1;
  uint32_t outputCnt = 1;
  uint64_t v6 = IOConnectCallMethod(connection, 3u, &input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  if (!(_DWORD)v6)
  {
    size_t v8 = output;
    *a3 = output >> 2;
    v9 = malloc(v8);
    *a2 = v9;
    if (v9)
    {
      v14[0] = a1;
      v14[1] = (uint64_t)v9;
      v14[2] = v8;
      uint64_t v6 = IOConnectCallMethod(connection, 4u, v14, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      IOServiceClose(connection);
      if (!(_DWORD)v6) {
        return v6;
      }
      goto LABEL_4;
    }

    uint64_t v6 = 3758097085LL;
  }

  IOServiceClose(connection);
LABEL_4:
  if (*a2) {
    free(*a2);
  }
  *a2 = 0LL;
  sub_100004D6C("EAN read failed: 0x%X", v6);
  return v6;
}

uint64_t sub_100005710(unsigned int a1)
{
  io_connect_t v5 = -1431655766;
  uint64_t v2 = sub_10000AB30(&v5);
  if (!(_DWORD)v2)
  {
    uint64_t input = a1;
    uint64_t v2 = IOConnectCallMethod(v5, 5u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    IOServiceClose(v5);
    if ((_DWORD)v2) {
      sub_100004D6C("EAN erase failed: 0x%X", v2);
    }
  }

  return v2;
}

uint64_t sub_1000057A0(unsigned int a1, uint64_t a2, unsigned int a3)
{
  uint64_t output = 0LL;
  mach_port_t connection = -1431655766;
  uint32_t outputCnt = 1;
  uint64_t v6 = sub_10000AB30(&connection);
  if (!(_DWORD)v6)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = 4LL * a3;
    uint64_t v6 = IOConnectCallMethod(connection, 2u, input, 3u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
    IOServiceClose(connection);
    if ((_DWORD)v6) {
      sub_100004D6C("EAN update failed: 0x%X", v6);
    }
  }

  return v6;
}

void sub_10000587C(char *a1, ...)
{
  if (byte_10001470A)
  {
    vprintf(a1, va);
    fputc(10, __stdoutp);
  }

uint64_t sub_1000058E4(uint64_t a1)
{
  uint64_t v5 = 0LL;
  if (*(_BYTE *)(a1 + 24))
  {
    __int128 v1 = 0LL;
    uint64_t v2 = &v5;
  }

  else
  {
    uint64_t v2 = 0LL;
    if (*(_BYTE *)(a1 + 136)) {
      __int128 v1 = (FILE *)"migrate_history";
    }
    else {
      __int128 v1 = *(FILE **)(a1 + 16LL * (*(_DWORD *)(a1 + 112) != 0) + 32);
    }
  }

  int v4 = -1431655766;
  return sub_100008074( a1,  14LL,  1,  1,  *(FILE **)(a1 + 16LL * (*(_DWORD *)(a1 + 112) != 0) + 40),  v1,  "history",  4,  (uint64_t)v2,  (uint64_t)&v4,  0);
}

uint64_t sub_100005988(uint64_t a1)
{
  int v3 = 120;
  while (1)
  {
    uint64_t v4 = IOMobileFramebufferSetParameter(*(void *)(a1 + 16), 5LL, 0LL, 0LL);
    uint64_t v5 = sub_100007B68(v4);
    sub_10000587C("%s: Update_BIC => %s", "update_bic", v5);
    if ((_DWORD)v4 == -536870184 || (_DWORD)v4 == -536870187) {
      usleep(0xF4240u);
    }
    else {
      uint64_t v1 = v4;
    }
    if ((_DWORD)v4 != -536870184 && (_DWORD)v4 != -536870187) {
      break;
    }
    if (!--v3) {
      return 3758097084LL;
    }
  }

  return v1;
}

uint64_t sub_100005A50(uint64_t a1)
{
  size_t v8 = 0LL;
  unsigned int v7 = 0;
  sub_10000587C("%s", "save_bic");
  uint64_t v2 = &v8;
  if (!*(_BYTE *)(a1 + 25)) {
    uint64_t v2 = 0LL;
  }
  uint64_t v3 = sub_100008074( a1,  13LL,  1,  1,  *(FILE **)(a1 + 72),  *(FILE **)(a1 + 64),  "BIC",  0,  (uint64_t)v2,  (uint64_t)&v7,  4096);
  uint64_t v4 = (const char *)&unk_10000B903;
  if (*(_BYTE *)(a1 + 25)) {
    uint64_t v5 = (const char *)&unk_10000B903;
  }
  else {
    uint64_t v5 = "not ";
  }
  if (!v8) {
    uint64_t v4 = "not ";
  }
  sub_10000587C("ean %spresent, membuf %sallocated\n", v5, v4);
  if (v8)
  {
    sub_1000057A0(0x64424943u, (uint64_t)v8, v7);
    free(v8);
  }

  return v3;
}

uint64_t sub_100005B38(uint64_t a1)
{
  float v8 = NAN;
  while (1)
  {
    uint64_t Block = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), 119LL, &v8, 4LL, 0LL, 0LL);
    if ((_DWORD)Block != -536870187 && (_DWORD)Block != -536870184) {
      break;
    }
    usleep(0xF4240u);
  }

  uint64_t v4 = Block;
  if ((_DWORD)Block)
  {
    sub_10000587C(">> BICAB read failed");
  }

  else
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v5)
    {
      uint64_t v6 = v5;
      xpc_dictionary_set_double(v5, "boost", v8);
      analytics_send_event("com.apple.iomfb.bicab", v6);
      xpc_release(v6);
      uint64_t v4 = 0LL;
      sub_10000587C("BICAB saved");
    }

    else
    {
      return 3758097084LL;
    }
  }

  return v4;
}

uint64_t sub_100005C2C(uint64_t a1)
{
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  float v9 = NAN;
  while (1)
  {
    uint64_t Block = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), 70LL, &v8, 12LL, 0LL, 0LL);
    if ((_DWORD)Block != -536870187 && (_DWORD)Block != -536870184) {
      break;
    }
    usleep(0xF4240u);
  }

  uint64_t v4 = Block;
  if ((_DWORD)Block)
  {
    sub_10000587C(">> UA Boost read failed", v8);
  }

  else if (BYTE4(v8))
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v5)
    {
      uint64_t v6 = v5;
      xpc_dictionary_set_double(v5, "uaboost", v9);
      analytics_send_event("com.apple.iomfb.uaboost", v6);
      xpc_release(v6);
      uint64_t v4 = 0LL;
      sub_10000587C("UA Boost saved", v8);
    }

    else
    {
      return 3758097084LL;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
    sub_10000587C("UA Boost factor not valid", v8);
  }

  return v4;
}

uint64_t sub_100005D48(uint64_t a1)
{
  __int128 v18 = 0LL;
  sub_10000587C("%s", "save_recovery_lth");
  sub_100008B24(a1);
  int v2 = *(unsigned __int16 *)(a1 + 140);
  if (*(_WORD *)(a1 + 140) && (int v3 = *(unsigned __int16 *)(a1 + 142), *(_WORD *)(a1 + 142)) && *(_DWORD *)(a1 + 144))
  {
    unsigned int v17 = -1431655766;
    int v4 = *(unsigned __int8 *)(a1 + 25);
    int v5 = *(_BYTE *)(a1 + 25) != 0;
    if (*(_BYTE *)(a1 + 25)) {
      int v6 = -4096;
    }
    else {
      int v6 = 0;
    }
    int v7 = v5 << 12;
    int v8 = 2 * v4;
    uint64_t v9 = sub_100008308(a1, 14LL, v2, v3, &v18, &v17, "recovery LTH", 2 * v4, v5 << 12);
    if ((_DWORD)v9)
    {
      uint64_t v10 = v9;
      sub_10000587C("Could not fetch bis data %s %d");
    }

    else
    {
      uint64_t v11 = v17;
      if (v17 <= *(_DWORD *)(a1 + 144))
      {
        if (*(_BYTE *)(a1 + 25))
        {
          v12 = v18;
          *(_DWORD *)__int128 v18 = -2147483646;
          v12[1] = v11;
          uint64_t v10 = sub_1000057A0(0x644C5448u, (uint64_t)v12, ((v7 + 4 * ((_DWORD)v11 + v8) - 1) & v6) >> 2);
          sub_10000587C("dLTH saved to ean - ret: %d, buf_size %d, recovery.nwords %d, version %d");
        }

        else
        {
          *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          __int128 v33 = v13;
          __int128 v34 = v13;
          __int128 v31 = v13;
          __int128 v32 = v13;
          __int128 v29 = v13;
          __int128 v30 = v13;
          __int128 v27 = v13;
          __int128 v28 = v13;
          __int128 v25 = v13;
          __int128 v26 = v13;
          __int128 v23 = v13;
          __int128 v24 = v13;
          __int128 v21 = v13;
          __int128 v22 = v13;
          *(_OWORD *)uint64_t v19 = v13;
          __int128 v20 = v13;
          if ((sub_100008670(v9, v19, 0x100uLL) & 1) != 0)
          {
            int v14 = sub_100008C64(v18, 4 * v11, v19);
            if (v14)
            {
              uint64_t v10 = 3758097098LL;
              strerror(v14);
              sub_10000587C("Unable to write %s - %s");
            }

            else if (sub_100008A8C())
            {
              uint64_t v10 = 3758097098LL;
              sub_10000587C("Unable to commit BIS.", v16);
            }

            else
            {
              uint64_t v10 = 0LL;
            }
          }

          else
          {
            uint64_t v10 = 3758097098LL;
            sub_10000587C("Unable to find BIS device", v16);
          }
        }
      }

      else
      {
        uint64_t v10 = 3758097098LL;
        sub_10000587C("Read %X words, expected %X");
      }
    }
  }

  else
  {
    sub_10000587C("Params missing in %s", "save_recovery_lth");
    uint64_t v10 = 3758097084LL;
  }

  if (v18) {
    free(v18);
  }
  return v10;
}

uint64_t sub_100005FAC(uint64_t a1)
{
  int v23 = -1431655766;
  if ((MGGetBoolAnswer(@"3kmXfug8VcxLI5yEmsqQKw") & 1) != 0) {
    return 0LL;
  }
  memset(__b, 170, sizeof(__b));
  while (1)
  {
    uint64_t Block = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), 16LL, __b, 648LL, 0LL, 0LL);
    if ((_DWORD)Block != -536870187 && (_DWORD)Block != -536870184) {
      break;
    }
    usleep(0xF4240u);
  }

  uint64_t v2 = Block;
  if ((_DWORD)Block)
  {
    sub_10000587C(">> burn in metric read failed.");
  }

  else
  {
    __int16 v15 = 16897;
    time_t v16 = time(0LL);
    int v17 = __b[1];
    unsigned __int16 v18 = __b[2];
    int v19 = *(_DWORD *)((char *)&__b[2] + 2);
    unsigned __int16 v20 = HIWORD(__b[3]);
    int v21 = __b[4];
    unsigned __int16 v22 = __b[5];
    uint64_t v5 = sub_10000A9CC(0xFFFFFFFFLL, (char *)&v15, 28LL);
    BOOL v6 = sub_1000090C4(v5, "min", 0, (unsigned __int16)v17);
    BOOL v7 = sub_1000090C4(v6, "min", 1u, HIWORD(v17));
    BOOL v8 = sub_1000090C4(v7, "min", 2u, v18);
    BOOL v9 = sub_1000090C4(v8, "median", 0, (unsigned __int16)v19);
    BOOL v10 = sub_1000090C4(v9, "median", 1u, HIWORD(v19));
    BOOL v11 = sub_1000090C4(v10, "median", 2u, v20);
    BOOL v12 = sub_1000090C4(v11, "max", 0, (unsigned __int16)v21);
    BOOL v13 = sub_1000090C4(v12, "max", 1u, HIWORD(v21));
    sub_1000090C4(v13, "max", 2u, v22);
    return 19LL;
  }

  return v2;
}

uint64_t sub_10000618C(uint64_t a1)
{
  while (1)
  {
    uint64_t Block = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), 19LL, __b, 3608LL, 0LL, 0LL);
    if ((_DWORD)Block != -536870187 && (_DWORD)Block != -536870184) {
      break;
    }
    usleep(0x3D090u);
  }

  uint64_t v4 = Block;
  if ((_DWORD)Block)
  {
    sub_10000587C(">> tiled BIM read failed.");
  }

  else if (__b[0] == 2)
  {
    if (__b[1])
    {
      unsigned int v5 = 0;
      while (1)
      {
        LOBYTE(Block) = sub_100009164(Block, 0, (uint64_t)__b, v5);
        if ((Block & 1) == 0) {
          return 3758097084LL;
        }
        if (++v5 >= __b[1]) {
          goto LABEL_14;
        }
      }
    }

    else
    {
LABEL_14:
      sub_10000587C("TBIM saved");
      return 0LL;
    }
  }

  else
  {
    uint64_t v4 = 3758097084LL;
    sub_10000587C(">> unexpected tbim version (wanted 2, got %d)");
  }

  return v4;
}

double sub_1000062A4(uint64_t a1)
{
  *(void *)(a1 + 16) = 0LL;
  *(_DWORD *)(a1 + 25) = 0;
  *(void *)a1 = off_100010518;
  *(_BYTE *)(a1 + 29) = 0;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)&off_100010598;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)&off_1000105A8;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)&off_1000105B8;
  double result = COERCE_DOUBLE("unsecure_history");
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&off_100010578;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)&off_100010588;
  *(_DWORD *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 116) = 0;
  *(void *)(a1 + 120) = 0LL;
  *(void *)(a1 + 128) = 0LL;
  *(_WORD *)(a1 + 136) = 0;
  return result;
}

BOOL sub_1000062F0(uint64_t a1)
{
  io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject(*(void *)(a1 + 16));
  BOOL result = sub_100006324(ServiceObject, "TBICSSupported");
  *(_BYTE *)(a1 + 137) = result;
  return result;
}

BOOL sub_100006324(io_registry_entry_t a1, const char *a2)
{
  int v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  CFTypeRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, v3, kCFAllocatorDefault, 0);
  CFRelease(v4);
  if (!CFProperty) {
    return 0LL;
  }
  BOOL v6 = CFBooleanGetValue(CFProperty) != 0;
  CFRelease(CFProperty);
  return v6;
}

uint64_t sub_1000063B4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  io_registry_entry_t ServiceObject = IOMobileFramebufferGetServiceObject(a2);
  *(_DWORD *)(a1 + 112) = sub_100005510(ServiceObject, "bics_mode");
  bzero((void *)(a1 + 140), 8uLL);
  *(_BYTE *)(a1 + 116) = 0;
  uint64_t v5 = sub_100004CE0(v4, @"ean-storage-present");
  *(_BYTE *)(a1 + 25) = v5;
  *(_BYTE *)(a1 + 24) = sub_100004CE0(v5, @"display-storage-present");
  io_registry_entry_t v6 = IOMobileFramebufferGetServiceObject(*(void *)(a1 + 16));
  *(_BYTE *)(a1 + 137) = sub_100006324(v6, "TBICSSupported");
  return 1LL;
}

uint64_t sub_100006438(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 25) && *(_BYTE *)(a1 + 26))
  {
    sub_100005988(a1);
    *(_BYTE *)(a1 + 26) = 0;
  }

  return 0LL;
}

uint64_t sub_100006474(_BYTE *a1, char *a2, const char *a3)
{
  if (byte_100014709) {
    sub_100006AAC((uint64_t)a1);
  }
  if (sub_100006B04((uint64_t)a1))
  {
    sub_10000587C("Failed to load LTH");
    return 0LL;
  }

  if (a1[137] && sub_100006C8C((uint64_t)a1))
  {
    sub_10000587C("Failed to upload TBICS LTH");
    return 0LL;
  }

  if (a1[26])
  {
    sub_100006E6C((uint64_t)a1);
    sub_1000058E4((uint64_t)a1);
    if (a1[29]) {
      sub_100006F00((uint64_t)a1);
    }
  }

  else
  {
    sub_100007074((uint64_t)a1);
  }

  sub_100006E6C((uint64_t)a1);
  return 1LL;
}

uint64_t sub_100006530(uint64_t a1, char *a2, const char *a3)
{
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  timespec v51 = v6;
  timespec v52 = v6;
  timespec v49 = v6;
  timespec v50 = v6;
  timespec v47 = v6;
  timespec v48 = v6;
  timespec v45 = v6;
  timespec v46 = v6;
  timespec v43 = v6;
  timespec v44 = v6;
  timespec v41 = v6;
  timespec v42 = v6;
  timespec v39 = v6;
  timespec v40 = v6;
  *(timespec *)__str = v6;
  timespec v38 = v6;
  timespec v35 = v6;
  timespec v36 = v6;
  timespec v33 = v6;
  timespec v34 = v6;
  timespec v31 = v6;
  timespec v32 = v6;
  timespec v29 = v6;
  timespec v30 = v6;
  timespec v27 = v6;
  timespec v28 = v6;
  timespec v25 = v6;
  timespec v26 = v6;
  timespec v23 = v6;
  timespec v24 = v6;
  *(timespec *)to = v6;
  timespec v22 = v6;
  *(timespec *)&v20.st_blksize = v6;
  *(timespec *)v20.st_qspare = v6;
  v20.st_birthtimespec = v6;
  *(timespec *)&v20.st_size = v6;
  v20.st_mtimespec = v6;
  v20.st_ctimespec = v6;
  *(timespec *)&v20.st_uid = v6;
  v20.st_atimespec = v6;
  *(timespec *)v19.st_qspare = v6;
  *(timespec *)&v20.st_dev = v6;
  *(timespec *)&v19.st_size = v6;
  *(timespec *)&v19.st_blksize = v6;
  v19.st_ctimespec = v6;
  v19.st_birthtimespec = v6;
  v19.st_atimespec = v6;
  v19.st_mtimespec = v6;
  *(timespec *)&v19.st_dev = v6;
  *(timespec *)&v19.st_uid = v6;
  if (stat(a2, &v20) < 0 || stat(a3, &v19) < 0) {
    return 0LL;
  }
  sub_10000587C("Daemon migrating from %s to %s", a2, a3);
  uint64_t v7 = 0LL;
  char v18 = 1;
  do
  {
    if (v7 != 2)
    {
      uint64_t v8 = 0LL;
      char v9 = 1;
      do
      {
        char v10 = v9;
        uint64_t v11 = a1 + 16 * v7 + 8 * v8;
        snprintf(__str, 0x100uLL, "%s/%s", a2, *(const char **)(v11 + 32));
        snprintf(to, 0x100uLL, "%s/%s", a3, *(const char **)(v11 + 32));
        if ((stat(__str, &v20) & 0x80000000) == 0)
        {
          if (stat(to, &v19))
          {
            sub_10000587C("Daemon copying from %s to %s", __str, to);
            if (copyfile(__str, to, 0LL, 0xAu) < 0)
            {
              sub_10000587C("Daemon copying from %s to %s failed", __str, to);
              char v18 = 0;
            }
          }
        }

        char v9 = 0;
        uint64_t v8 = 1LL;
      }

      while ((v10 & 1) != 0);
    }

    ++v7;
  }

  while (v7 != 5);
  if ((v18 & 1) != 0)
  {
    for (uint64_t i = 0LL; i != 5; ++i)
    {
      uint64_t v13 = 0LL;
      char v14 = 1;
      do
      {
        char v15 = v14;
        snprintf(__str, 0x100uLL, "%s/%s", a2, *(const char **)(a1 + 16 * i + 8 * v13 + 32));
        if ((stat(__str, &v20) & 0x80000000) == 0)
        {
          sub_10000587C("Daemon unlinking %s", __str);
          unlink(__str);
        }

        char v14 = 0;
        uint64_t v13 = 1LL;
      }

      while ((v15 & 1) != 0);
    }

    remove(a2);
    uint64_t v16 = 0LL;
    sub_10000587C("Daemon migrating completed");
  }

  else
  {
    uint64_t v16 = 0xFFFFFFFFLL;
    sub_10000587C("Daemon migrating failed");
  }

  return v16;
}

void sub_1000067DC(uint64_t a1)
{
  if (byte_100014708) {
    return;
  }
  __int128 v14 = unk_10000FC08;
  __int128 __size = xmmword_10000FC18;
  __int128 v16 = unk_10000FC28;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  v18[11] = v2;
  timespec v19 = v2;
  v18[9] = v2;
  v18[10] = v2;
  v18[7] = v2;
  v18[8] = v2;
  v18[5] = v2;
  v18[6] = v2;
  v18[3] = v2;
  v18[4] = v2;
  v18[1] = v2;
  v18[2] = v2;
  v18[0] = v2;
  *(timespec *)&v12.st_dev = v2;
  *(timespec *)&v12.st_uid = v2;
  v12.st_atimespec = v2;
  v12.st_mtimespec = v2;
  v12.st_ctimespec = v2;
  v12.st_birthtimespec = v2;
  *(timespec *)&v12.st_size = v2;
  *(timespec *)&v12.st_blksize = v2;
  *(timespec *)v12.st_qspare = v2;
  memset(v13, 170, sizeof(v13));
  int v11 = -1431655766;
  if (!stat("force_panel_reset", &v12) && (__int16)v12.st_mode < 0)
  {
    if (unlink("force_panel_reset"))
    {
      sub_100004D6C("Could not delete %s; skipping reset\n", "force_panel_reset");
      return;
    }

    timespec v6 = 0LL;
    int v4 = 0;
    goto LABEL_14;
  }

  int v3 = open(*(const char **)(a1 + 64), 0);
  if (v3 < 0) {
    return;
  }
  int v4 = v3;
  if (read(v3, &v11, 4uLL) != 4) {
    goto LABEL_30;
  }
  int v5 = v11;
  if (v11 == 1112097568)
  {
    if (read(v4, v13, 4uLL) != 4) {
      goto LABEL_30;
    }
    int v5 = v13[0];
  }

  else
  {
    v13[0] = v11;
  }

  unsigned int v7 = v5 - 1;
  if (v7 >= 4)
  {
    sub_10000587C("unknown BIC header version; panelID verification skipped");
    goto LABEL_30;
  }

  size_t v8 = *(void *)&aD[8 * v7];
  if (v8 != read(v4, &v13[1], v8)) {
    goto LABEL_30;
  }
  size_t v9 = __size;
  if ((_DWORD)__size != HIDWORD(v19.tv_nsec))
  {
    timespec v6 = 0LL;
    goto LABEL_14;
  }

  char v10 = malloc(__size);
  if (!v10)
  {
LABEL_30:
    close(v4);
    return;
  }

  timespec v6 = v10;
  if (read(v4, v10, v9) != v9 || !memcmp(v6, (char *)v18 + 4, HIDWORD(v19.tv_nsec)))
  {
    close(v4);
LABEL_20:
    free(v6);
    return;
  }

LABEL_14:
  sub_10000587C("new panel detected; invalidate stored LTH & BIC");
  if (*(_BYTE *)(a1 + 24)) {
    sub_1000071F0();
  }
  else {
    unlink(*(const char **)(a1 + 16LL * (*(_DWORD *)(a1 + 112) != 0) + 32));
  }
  unlink(*(const char **)(a1 + 64));
  sub_1000073E4(a1);
  if (*(_BYTE *)(a1 + 25)) {
    sub_100005710(0x64424943u);
  }
  *(_BYTE *)(a1 + 26) = 1;
  close(v4);
  if (v6) {
    goto LABEL_20;
  }
}

uint64_t sub_100006AAC(uint64_t a1)
{
  uint64_t v1 = IOMobileFramebufferSetParameter(*(void *)(a1 + 16), 18LL, 0LL, 0LL);
  timespec v2 = sub_100007B68(v1);
  sub_10000587C("%s: Update_BIC => %s", "enable_headless_migration", v2);
  return v1;
}

uint64_t sub_100006B04(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 26))
  {
    if (*(_BYTE *)(a1 + 24))
    {
    }

    else if (!sub_100007890( a1,  *(char **)(a1 + 16LL * (*(_DWORD *)(a1 + 112) != 0) + 32),  1,  1,  14LL,  1,  "history"))
    {
      return 0LL;
    }

    return 0LL;
  }

LABEL_2:
  int v8 = 1;
  unsigned int v7 = &_mh_execute_header;
  bzero(v5, 0xFBCuLL);
  sub_10000587C("%s: upload empty history", "upload_history");
  int v6 = 0;
  uint64_t v2 = IOMobileFramebufferSetBlock(*(void *)(a1 + 16), 14LL, v5, 4028LL, &v7, 3LL);
  int v3 = sub_100007B68(v2);
  sub_10000587C("%s: set block[0] => %s", "upload_history", v3);
  if ((_DWORD)v2 != -536870201 && (_DWORD)v2 != -536870174 && (_DWORD)v2) {
    sub_100004D6C("uploading empty history failed.");
  }
  return v2;
}

uint64_t sub_100006C8C(uint64_t a1)
{
  uint64_t v2 = *(const char **)(a1 + 96);
  int v16 = -1431655766;
  xpc_object_t v14 = 0LL;
  char v15 = 0LL;
  int v3 = open(v2, 0);
  int v4 = v3;
  if ((v3 & 0x80000000) == 0)
  {
    v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v13.st_blksize = v5;
    *(timespec *)v13.st_qspare = v5;
    v13.st_birthtimespec = v5;
    *(timespec *)&v13.unsigned int st_size = v5;
    v13.st_mtimespec = v5;
    v13.st_ctimespec = v5;
    *(timespec *)&v13.st_uid = v5;
    v13.st_atimespec = v5;
    *(timespec *)&v13.st_dev = v5;
    if (fstat(v3, &v13))
    {
      uint64_t v6 = 3758097084LL;
      sub_10000587C("%s: Could not stat %s", "upload_tbics_history", v2);
      close(v4);
      return v6;
    }

    unsigned int st_size = v13.st_size;
    if ((sub_100008490(v13.st_size, (uint64_t *)&v15, &v16) & 1) != 0)
    {
LABEL_10:
      ssize_t v11 = read(v4, v15, st_size);
      close(v4);
      if (v11 < st_size)
      {
        uint64_t v6 = 3758097084LL;
        goto LABEL_15;
      }

      goto LABEL_14;
    }

LABEL_12:
    close(v4);
    uint64_t v6 = 3758097085LL;
    goto LABEL_15;
  }

  *(void *)&v13.st_dev = 0xAAAAAAAAAAAAAAAALL;
  if (sub_100007A8C(0x544C5448u, &v14) || (xpc_object_t v7 = v14) == 0LL)
  {
    uint64_t v6 = 3758097084LL;
    sub_10000587C("%s: Could not read dstore", "upload_tbics_history");
    return v6;
  }

  data = xpc_dictionary_get_data(v14, "content", (size_t *)&v13);
  unsigned int st_size = v13.st_dev;
  if (!data) {
    goto LABEL_10;
  }
  memcpy(v15, data, st_size);
  xpc_release(v7);
  close(v4);
LABEL_14:
  uint64_t v6 = sub_100008504(*(void *)(a1 + 16), 129LL, (uint64_t)v15, st_size, "TBICS LTH", 0, v10);
LABEL_15:
  if (v15) {
    free(v15);
  }
  return v6;
}

uint64_t sub_100006E6C(uint64_t a1)
{
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = v2;
  v7[2] = v2;
  v7[0] = v2;
  int v3 = 79;
  do
  {
    usleep(0x3D090u);
    uint64_t result = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), 17LL, v7, 56LL, 0LL, 0LL);
    if ((_DWORD)result) {
      break;
    }
    if (LODWORD(v7[0]) != 1 || BYTE8(v7[0]) == 0) {
      break;
    }
  }

  while ((HIDWORD(v7[0]) & 0xFFFFFFFD) != 0 && v3-- != 0);
  return result;
}

uint64_t sub_100006F00(uint64_t a1)
{
  uint64_t v1 = 3758097084LL;
  if (!*(_BYTE *)(a1 + 25))
  {
    int v4 = "not ";
    goto LABEL_18;
  }

  int v3 = aligned_alloc(0x4000uLL, 0x4000uLL);
  int v4 = "not ";
  if (!v3)
  {
    uint64_t v1 = 3758097085LL;
    goto LABEL_18;
  }

  timespec v5 = v3;
  bzero(v3, 0x4000uLL);
  uint64_t v7 = sub_100008504(*(void *)(a1 + 16), 129LL, (uint64_t)v5, 7856, "TBICS LTH", 1, v6);
  if (!(_DWORD)v7)
  {
    unint64_t v8 = *(FILE **)(a1 + 96);
    size_t v9 = *(FILE **)(a1 + 104);
    v12[1] = v9;
    v12[2] = v8;
    __n128 v10 = fopen((const char *)v9, "w");
    v12[0] = v10;
    if (v10)
    {
      if (fwrite(v5, 1uLL, 0x1EB0uLL, v10))
      {
        if (sub_1000081D4((uint64_t)v12))
        {
          sub_1000072E8(0x544C5448u, v5, 0x7ACu);
          uint64_t v1 = 0LL;
        }

        goto LABEL_12;
      }
    }

    else
    {
      sub_100004D6C("Could not open temp file %s", (const char *)v9);
    }

    sub_1000082A0((uint64_t)v12);
LABEL_12:
    if (v12[0]) {
      fclose(v12[0]);
    }
    uint64_t v7 = v1;
  }

  free(v5);
  if (!(_DWORD)v7) {
    int v4 = (const char *)&unk_10000B903;
  }
  uint64_t v1 = v7;
LABEL_18:
  sub_10000587C("TBICS LTH %ssaved", v4);
  return v1;
}

void sub_10000705C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, FILE *a10)
{
  if (a10) {
    fclose(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007074(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 26))
  {
    if (!*(_BYTE *)(a1 + 25)) {
      goto LABEL_19;
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v9[1] = v3;
    v9[2] = v3;
    v9[0] = v3;
    BOOL v5 = !v4 || BYTE8(v9[0]) == 0;
    if (!v5 && BYTE9(v9[0]) == 0)
    {
LABEL_19:
      if (sub_100007890(a1, *(char **)(a1 + 64), 1, 1, 13LL, 0, "BIC"))
      {
        int v11 = 0;
        bzero(v9, 0xFBCuLL);
        sub_100006E6C(a1);
        int v7 = IOMobileFramebufferSetBlock(*(void *)(a1 + 16), 13LL, v9, 4028LL, &v11, 1LL);
        unint64_t v8 = sub_100007B68(v7);
        sub_10000587C("%s: upload empty bic => %s", "upload_bic", v8);
      }
    }
  }

  return 0LL;
}

uint64_t sub_100007178(xpc_connection_t *a1)
{
  __int128 v2 = dispatch_queue_create("com.apple.disp.store.client", 0LL);
  mach_service = xpc_connection_create_mach_service("display_storage_service", v2, 0LL);
  *a1 = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &stru_1000105E8);
    xpc_connection_resume(*a1);
    return 0LL;
  }

  else
  {
    sub_10000587C("Couldn't find Display Storage driver");
    return 5LL;
  }

uint64_t sub_1000071F0()
{
  xpc_connection_t v4 = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v0 = sub_100007178(&v4);
  if (!(_DWORD)v0)
  {
    xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v1, "command", "erase");
    __int128 v2 = v4;
    sub_100007284(v4, v1);
    xpc_release(v1);
    xpc_connection_cancel(v2);
    xpc_release(v2);
  }

  return v0;
}

uint64_t sub_100007284(_xpc_connection_s *a1, void *a2)
{
  if (qword_1000146F8 != -1) {
    dispatch_once(&qword_1000146F8, &stru_100010858);
  }
  xpc_connection_send_barrier(a1, &stru_100010898);
  return dispatch_semaphore_wait((dispatch_semaphore_t)qword_1000146F0, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000072E8(unsigned int a1, const void *a2, unsigned int a3)
{
  xpc_connection_t v10 = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = sub_100007178(&v10);
  if (!(_DWORD)v6)
  {
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v7, "command", "write");
    xpc_dictionary_set_uint64(v7, "key", a1);
    xpc_dictionary_set_data(v7, "content", a2, 4LL * a3);
    unint64_t v8 = v10;
    sub_100007284(v10, v7);
    xpc_release(v7);
    xpc_connection_cancel(v8);
    xpc_release(v8);
  }

  return v6;
}

uint64_t sub_1000073BC(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 8LL * a2 + 64);
}

uint64_t sub_1000073C8(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 16LL * (*(_DWORD *)(a1 + 112) != 0) + 8LL * a2 + 32);
}

void sub_1000073E4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 25))
  {
    sub_100005710(0x644C5448u);
  }

  else
  {
    *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v24 = v2;
    __int128 v25 = v2;
    __int128 v22 = v2;
    __int128 v23 = v2;
    __int128 v20 = v2;
    __int128 v21 = v2;
    __int128 v18 = v2;
    __int128 v19 = v2;
    __int128 v16 = v2;
    __int128 v17 = v2;
    __int128 v14 = v2;
    __int128 v15 = v2;
    __int128 v12 = v2;
    __int128 v13 = v2;
    *(_OWORD *)xpc_connection_t v10 = v2;
    __int128 v11 = v2;
    sub_100008B24(a1);
    if (*(_WORD *)(a1 + 140))
    {
      uint64_t v4 = *(unsigned int *)(a1 + 144);
      if ((sub_100008670(v3, v10, 0x100uLL) & 1) != 0)
      {
        int v5 = open(v10, 1);
        if (v5 < 0)
        {
          sub_10000587C("Unable to open DR LTH");
        }

        else
        {
          int v6 = v5;
          if (fcntl(v5, 48, 1LL) < 0)
          {
            sub_10000587C("Failed to set F_NOCACHE");
          }

          else
          {
            size_t v7 = 4 * v4;
            unint64_t v8 = malloc(v7);
            if (v8)
            {
              size_t v9 = v8;
              bzero(v8, v7);
              write(v6, v9, v7);
              free(v9);
            }
          }

          close(v6);
        }
      }

      else
      {
        sub_10000587C("Unable to find BIS device");
      }
    }
  }

uint64_t sub_100007574()
{
  size_t v3 = 128LL;
  if (sysctlbyname("hw.target", byte_100014260, &v3, 0LL, 0LL)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = 0LL;
  size_t v2 = v3 + 1;
  while (strncmp(byte_100014260, off_100010608[v1], v2))
  {
    if (++v1 == 20) {
      return 4LL;
    }
  }

  return 5LL;
}

uint64_t sub_100007618( uint64_t a1, void (***a2)(void), int a3, int a4, int a5, uint64_t a6, int a7, const char *a8)
{
  v29[0] = 0;
  v29[1] = a4;
  v29[2] = a5;
  if (a7) {
    uint64_t v13 = 3LL;
  }
  else {
    uint64_t v13 = 1LL;
  }
  bzero(v27, 0xFBCuLL);
  int v14 = *(unsigned __int8 *)(a1 + 136);
  sub_10000587C("%s (%s)", "upload_reader", a8);
  if (a3 < 1024 || (a3 & 3) != 0)
  {
    sub_10000587C("%s: bad file size (%d) for %s", "upload_reader", a3, a8);
    uint64_t v22 = 3758097084LL;
LABEL_21:
    sub_100004D6C("uploading %s failed.", a8);
  }

  else
  {
    __int128 v25 = a2;
    timespec v26 = a8;
    int v15 = 0;
    int v16 = v14 << 30;
    unsigned int v17 = a3 >> 2;
    unsigned int v18 = ((a3 >> 2) + 999) / 0x3E8;
    unsigned int v28 = v17;
    int v19 = 1000;
    unsigned int v24 = v17;
    while (2)
    {
      if (v15 == v18)
      {
        sub_10000587C("%s: Upload of %s successful", "upload_reader", v26);
      }

      else
      {
        v29[0] = v15 | v16;
        if (v18 == v15 + 1) {
          int v19 = v17 - v15 * v19;
        }
        (**a2)(a2);
        int v20 = 15;
        while (1)
        {
          uint64_t v21 = IOMobileFramebufferSetBlock(*(void *)(a1 + 16), a6, v27, 4028LL, v29, v13);
          uint64_t v22 = v21;
          if (v15 || (_DWORD)v21 != -536870187) {
            break;
          }
          usleep(0xF4240u);
          if (!--v20)
          {
            uint64_t v22 = 3758097109LL;
LABEL_20:
            sub_10000587C("%s: bad return stat %X", "upload_reader", v22);
            a8 = v26;
            goto LABEL_21;
          }
        }

        if (v15 || (_DWORD)v21 != -536870174)
        {
          ++v15;
          a2 = v25;
          unsigned int v17 = v24;
          int v16 = v14 << 30;
          if (!(_DWORD)v21) {
            continue;
          }
          goto LABEL_20;
        }
      }

      return 0LL;
    }
  }

  return v22;
}

uint64_t sub_10000785C(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7, const char *a8)
{
  size_t v9 = &off_1000108C8;
  int v11 = -1431655766;
  int v10 = a2;
  return sub_100007618(a1, (void (***)(void))&v9, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_100007890(uint64_t a1, char *a2, int a3, int a4, uint64_t a5, int a6, const char *a7)
{
  uint64_t v13 = 3758097084LL;
  int v14 = open(a2, 0);
  if ((v14 & 0x80000000) == 0)
  {
    int v15 = v14;
    v16.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v16.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v18.st_blksize = v16;
    *(timespec *)v18.st_qspare = v16;
    v18.st_birthtimespec = v16;
    *(timespec *)&v18.unsigned int st_size = v16;
    v18.st_mtimespec = v16;
    v18.st_ctimespec = v16;
    *(timespec *)&v18.st_uid = v16;
    v18.st_atimespec = v16;
    *(timespec *)&v18.st_dev = v16;
    if (fstat(v14, &v18))
    {
      sub_10000587C("%s: Could not stat %s", "upload_file", a7);
    }

    else
    {
      int v19 = &off_1000108C8;
      int v21 = -1431655766;
      int v20 = v15;
      uint64_t v13 = sub_100007618(a1, (void (***)(void))&v19, v18.st_size, a3, a4, a5, a6, a7);
    }

    close(v15);
  }

  return v13;
}

uint64_t sub_10000798C(uint64_t a1, unsigned int a2, int a3, int a4, uint64_t a5, int a6, const char *a7)
{
  size_t length = 0xAAAAAAAAAAAAAAAALL;
  xpc_object_t xdict = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  if (sub_100007A8C(a2, &xdict) || (xpc_object_t v13 = xdict) == 0LL)
  {
    sub_10000587C("%s: Could not read dstore", "upload_dstore");
    return 3758097084LL;
  }

  else
  {
    data = (void (**)(void))xpc_dictionary_get_data(xdict, "content", &length);
    int v19 = -1431655766;
    length >>= 2;
    v17[0] = (void (**)(void))&off_100010908;
    v17[1] = data;
    int v18 = length;
    uint64_t v15 = sub_100007618(a1, v17, 4 * (int)length, a3, a4, a5, a6, a7);
    xpc_release(v13);
  }

  return v15;
}

uint64_t sub_100007A8C(unsigned int a1, xpc_object_t *a2)
{
  xpc_connection_t connection = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = sub_100007178(&connection);
  if (!(_DWORD)result)
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v5, "command", "read");
    xpc_dictionary_set_uint64(v5, "key", a1);
    int v6 = connection;
    *a2 = xpc_connection_send_message_with_reply_sync(connection, v5);
    xpc_release(v5);
    xpc_connection_cancel(v6);
    xpc_release(v6);
    if (xpc_get_type(*a2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      return 0LL;
    }

    else
    {
      xpc_release(*a2);
      *a2 = 0LL;
      return 5LL;
    }
  }

  return result;
}

char *sub_100007B68(int a1)
{
  uint64_t v1 = 0LL;
  while (dword_100010768[v1] != a1)
  {
    v1 += 4LL;
    if (v1 == 36)
    {
      size_t v2 = byte_1000142E0;
      snprintf(byte_1000142E0, 0xCuLL, "%X", a1);
      return v2;
    }
  }

  return *(char **)&dword_100010768[v1 + 2];
}

unint64_t sub_100007BDC(uint64_t a1, _DWORD *a2, unint64_t a3, uint64_t a4, const void *a5)
{
  int v9 = sub_100007574();
  int v10 = sub_100007574();
  *a2 = v10;
  if (v10 == 4) {
    int v11 = 92;
  }
  else {
    int v11 = 84;
  }
  unint64_t v12 = (v11 + *(_DWORD *)(a4 + 96));
  a2[1] = v12;
  if (v12 <= a3)
  {
    uint64_t v13 = a4 + 13;
    uint64_t v14 = -3LL;
    do
    {
      uint64_t v15 = (char *)a2 + v14 + 14;
      *(v15 - 3) = *(_BYTE *)(v13 + v14 - 6);
      *uint64_t v15 = *(_BYTE *)(v13 + v14 - 3);
      v15[3] = *(_BYTE *)(v13 + v14);
      v15[6] = *(_BYTE *)(v13 + v14 + 3);
      v15[9] = *(_BYTE *)(v13 + v14 + 6);
      v15[12] = *(_BYTE *)(v13 + v14 + 9);
      v15[15] = *(_BYTE *)(v13 + v14 + 12);
    }

    while (!__CFADD__(v14++, 1LL));
    uint64_t v17 = 0LL;
    int v18 = a2 + 11;
    uint64_t v19 = -6LL;
    do
    {
      int v20 = (char *)v18 + v19;
      *((_WORD *)v20 - 4) = *(_WORD *)(a4 + v17 * 4 + 26);
      *((_WORD *)v20 - 1) = *(_WORD *)(a4 + v17 * 4 + 28);
      v18[v17] = *(_DWORD *)(a4 + v17 * 4 + 40);
      ++v17;
      v19 += 2LL;
    }

    while (v17 != 3);
    for (uint64_t i = 0LL; i != 3; ++i)
      a2[i + 14] = *(_DWORD *)(a4 + 52 + i * 4);
    if (v9 == 4)
    {
      for (uint64_t j = 0LL; j != 3; ++j)
        a2[j + 17] = *(_DWORD *)(a4 + 64 + j * 4);
      for (uint64_t k = 0LL; k != 3; ++k)
        a2[k + 20] = *(_DWORD *)(a4 + 76 + k * 4);
      unsigned int v24 = a2 + 23;
    }

    else
    {
      for (uint64_t m = 0LL; m != 3; ++m)
        a2[m + 17] = *(_DWORD *)(a4 + 76 + m * 4);
      a2[20] = *(_DWORD *)(a4 + 128);
      unsigned int v24 = a2 + 21;
    }

    memcpy(v24, a5, *(unsigned int *)(a4 + 96));
  }

  else
  {
    sub_100004D6C("Not enough space allocated for the ibic header");
    return 0LL;
  }

  return v12;
}

uint64_t sub_100007D98( uint64_t a1, uint64_t a2, int a3, int a4, const char *a5, uint64_t (*a6)(uint64_t, _DWORD *, uint64_t, uint64_t), uint64_t a7)
{
  v30[1] = a3;
  v30[2] = a4;
  int v31 = 0;
  int v9 = *(unsigned __int8 *)(a1 + 136) << 30;
  memset(__b, 170, sizeof(__b));
  int v10 = 0;
  int v11 = 0;
  while (1)
  {
    v30[0] = v10 | v9;
    uint64_t Block = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), a2, __b, 4028LL, v30, 4LL);
    uint64_t v13 = Block;
    if ((_DWORD)Block != -536870187) {
      break;
    }
LABEL_5:
    if (++v11 > 0x77)
    {
      sub_100004D6C("%s: max retries reached; bailing.");
      return v13;
    }

    sub_10000587C("%s: IOMFB busy, will retry", "fetch_machine");
LABEL_8:
    usleep(0xF4240u);
    int v10 = v30[0];
  }

  if ((_DWORD)Block)
  {
    if ((_DWORD)Block != -536870184)
    {
      uint64_t v14 = sub_100007B68(Block);
      sub_10000587C("%s: GetBlock[0] returned %s", "fetch_machine", v14);
LABEL_11:
      sub_100004D6C("failed to save %s -- IOMFB in a bad state");
      return v13;
    }

    goto LABEL_5;
  }

  int v31 = __b[1];
  sub_10000587C("%s: xfer id=%d, pending=%d, nwords=%d", "fetch_machine", __b[1], LOBYTE(__b[0]), __b[2]);
  if (LOBYTE(__b[0])) {
    goto LABEL_8;
  }
  int v15 = __b[2];
  else {
    uint64_t v16 = __b[2];
  }
  uint64_t v13 = ((uint64_t (*)(uint64_t, _DWORD *, void, uint64_t, void))a6)(a7, __b, 0LL, v16, __b[2]);
  if ((_DWORD)v13)
  {
LABEL_16:
    sub_100004D6C("%s: %s save failure [%X]");
    return v13;
  }

  int v31 = __b[1];
  if ((v15 + 999) >= 0x7D0)
  {
    int v18 = 0;
    unsigned int v19 = (v15 + 999) / 0x3E8u;
    unsigned int v25 = v19 - 2;
    if (v19 <= 2) {
      unsigned int v19 = 2;
    }
    unsigned int v20 = v19 - 1;
    int v21 = -1000;
    LODWORD(v22) = v16;
    while (1)
    {
      v30[0] = (v18 + 1) | v9;
      uint64_t v23 = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), a2, __b, 4028LL, v30, 4LL);
      if ((_DWORD)v23)
      {
        uint64_t v13 = v23;
        goto LABEL_11;
      }

      uint64_t v22 = v25 == v18 ? (v21 + __b[2]) : v22;
      uint64_t v24 = a6(a7, __b, v16, v22);
      if ((_DWORD)v24) {
        break;
      }
      uint64_t v16 = (v22 + v16);
      ++v18;
      v21 -= 1000;
      if (v20 == v18) {
        goto LABEL_28;
      }
    }

    uint64_t v13 = v24;
    goto LABEL_16;
  }

LABEL_28:
  sub_10000587C("%s: save of %s successful", "fetch_machine", a5);
  return 0LL;
}

uint64_t sub_100008074( uint64_t a1, uint64_t a2, int a3, int a4, FILE *a5, FILE *a6, const char *a7, int a8, uint64_t a9, uint64_t a10, int a11)
{
  v23[0] = a9;
  v23[1] = a10;
  int v25 = -1431655766;
  timespec v26 = a7;
  int v24 = a11;
  timespec v27 = 0LL;
  if (!a6)
  {
    uint64_t v21 = sub_100007D98( a1,  a2,  a3,  a4,  a7,  (uint64_t (*)(uint64_t, _DWORD *, uint64_t, uint64_t))sub_10000AEDC,  (uint64_t)v23);
    if (!(_DWORD)v21) {
      return v21;
    }
    goto LABEL_12;
  }

  unsigned int v19 = (FILE **)operator new(0x18uLL);
  sub_10000AE44(v19, a5, a6, a8);
  timespec v27 = v19;
  uint64_t v20 = sub_100007D98( a1,  a2,  a3,  a4,  a7,  (uint64_t (*)(uint64_t, _DWORD *, uint64_t, uint64_t))sub_10000AEDC,  (uint64_t)v23);
  if ((_DWORD)v20)
  {
    uint64_t v21 = v20;
    sub_1000082A0((uint64_t)v19);
  }

  else if (sub_1000081D4((uint64_t)v19))
  {
    uint64_t v21 = 0LL;
  }

  else
  {
    uint64_t v21 = 3758097084LL;
  }

  if (*v19) {
    fclose(*v19);
  }
  operator delete(v19);
  if ((_DWORD)v21) {
LABEL_12:
  }
    sub_100004D6C("%s save failure", a7);
  return v21;
}

void sub_1000081C0(_Unwind_Exception *a1)
{
}

BOOL sub_1000081D4(uint64_t a1)
{
  uint64_t v1 = *(FILE **)a1;
  if (!*(void *)a1) {
    return 0LL;
  }
  int v3 = ferror(*(FILE **)a1);
  fclose(v1);
  *(void *)a1 = 0LL;
  if (!*(void *)(a1 + 8)) {
    return 1LL;
  }
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v6.st_blksize = v4;
  *(timespec *)v6.st_qspare = v4;
  v6.st_birthtimespec = v4;
  *(timespec *)&v6.unsigned int st_size = v4;
  v6.st_mtimespec = v4;
  v6.st_ctimespec = v4;
  *(timespec *)&v6.st_uid = v4;
  v6.st_atimespec = v4;
  *(timespec *)&v6.st_dev = v4;
  if (v3)
  {
LABEL_4:
    unlink(*(const char **)(a1 + 8));
    return 0LL;
  }

  sync();
  if (stat(*(const char **)(a1 + 16), &v6))
  {
    if (*__error() != 2) {
      goto LABEL_4;
    }
  }

  else if (unlink(*(const char **)(a1 + 16)))
  {
    goto LABEL_4;
  }

  return rename(*(const char **)(a1 + 8), *(const char **)(a1 + 16)) == 0;
}

BOOL sub_1000082A0(uint64_t a1)
{
  uint64_t v1 = *(FILE **)a1;
  if (!*(void *)a1) {
    return 0LL;
  }
  int v3 = ferror(*(FILE **)a1);
  fclose(v1);
  *(void *)a1 = 0LL;
  timespec v4 = *(const char **)(a1 + 8);
  if (!v4) {
    timespec v4 = *(const char **)(a1 + 16);
  }
  return (unlink(v4) | v3) == 0;
}

uint64_t sub_100008308( uint64_t a1, uint64_t a2, int a3, int a4, void **a5, _DWORD *a6, const char *a7, int a8, int a9)
{
  v14[0] = a8;
  v14[1] = a9;
  uint64_t v16 = a7;
  unint64_t v15 = 0xAAAAAAAA00000000LL;
  uint64_t v17 = a5;
  *a5 = 0LL;
  uint64_t v12 = sub_100007D98( a1,  a2,  a3,  a4,  a7,  (uint64_t (*)(uint64_t, _DWORD *, uint64_t, uint64_t))sub_10000AFE4,  (uint64_t)v14);
  if ((_DWORD)v12)
  {
    sub_100004D6C("%s fetch failure", a7);
    if (*a5)
    {
      free(*a5);
      *a5 = 0LL;
    }
  }

  else
  {
    *a6 = v15;
  }

  return v12;
}

uint64_t sub_1000083A4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 25))
  {
    size_t v2 = aligned_alloc(0x4000uLL, 0x4000uLL);
    int v3 = "not ";
    if (v2)
    {
      timespec v4 = v2;
      bzero(v2, 0x4000uLL);
      uint64_t v6 = sub_100008504(*(void *)(a1 + 16), 130LL, (uint64_t)v4, 3968, "TBIC", 1, v5);
      if (!(_DWORD)v6)
      {
        else {
          uint64_t v6 = 0LL;
        }
      }

      free(v4);
      if (!(_DWORD)v6) {
        int v3 = (const char *)&unk_10000B903;
      }
    }

    else
    {
      uint64_t v6 = 3758097085LL;
    }
  }

  else
  {
    int v3 = "not ";
    uint64_t v6 = 3758097084LL;
  }

  sub_10000587C("TBICS BIC %ssaved", v3);
  return v6;
}

uint64_t sub_100008490(int a1, uint64_t *a2, _DWORD *a3)
{
  uint64_t result = 0LL;
  if (a1 && a2 && a3)
  {
    size_t v7 = (a1 + 0x3FFF) & 0xFFFFC000;
    *a3 = v7;
    uint64_t result = (uint64_t)aligned_alloc(0x4000uLL, v7);
    *a2 = result;
    if (result)
    {
      bzero((void *)result, v7);
      return 1LL;
    }

    else
    {
      *a3 = 0;
    }
  }

  return result;
}

uint64_t sub_100008504(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const char *a5, int a6, __n128 a7)
{
  a7.n128_u64[0] = 0xAAAAAAAA00000001LL;
  if (a6) {
    int v11 = "get";
  }
  else {
    int v11 = "set";
  }
  unint64_t v16 = 0xAAAAAAAA00000001LL;
  BYTE4(v16) = a6;
  int v17 = a4;
  uint64_t v18 = a3;
  for (int i = 119; ; --i)
  {
    uint64_t v13 = a6
        ? IOMobileFramebufferGetBufBlock(a1, a2, &v16, 20LL, 0LL, 0LL, a7)
        : IOMobileFramebufferSetBlock(a1, a2, &v16, 20LL, 0LL, 0LL);
    uint64_t v14 = v13;
    if ((_DWORD)v13 != -536870187 && (_DWORD)v13 != -536870184) {
      break;
    }
    if (!i)
    {
      sub_100004D6C("%s %s max retries reached -> bailing");
      return v14;
    }

    sub_10000587C("%s %s failed, will retry", v11, a5);
    usleep(0xF4240u);
  }

  if ((_DWORD)v13)
  {
    sub_100007B68(v13);
    sub_100004D6C("%s %s failed: %s");
  }

  return v14;
}

BOOL sub_100008634(FILE **a1, void *__ptr, size_t __size, size_t __nitems)
{
  return *a1 && fwrite(__ptr, __size, __nitems, *a1) != 0;
}

uint64_t sub_100008670(uint64_t a1, char *a2, size_t a3)
{
  io_iterator_t iterator = 0;
  if (IORegistryCreateIterator(kIOMainPortDefault, "IOService", 1u, &iterator))
  {
    sub_10000587C("Failed to allocate iterator");
    return 0LL;
  }

  io_object_t v6 = IOIteratorNext(iterator);
  if (!v6)
  {
LABEL_13:
    uint64_t v5 = 0LL;
    goto LABEL_14;
  }

  io_object_t v7 = v6;
  size_t __size = a3;
  while (1)
  {
    if (!IOObjectConformsTo(v7, "IOMedia")
      || kCFBooleanTrue != IORegistryEntrySearchCFProperty( v7,  "IOService",  @"EmbeddedDeviceTypeBIS",  kCFAllocatorDefault,  3u))
    {
      goto LABEL_12;
    }

    CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    if (!IORegistryEntryCreateCFProperties(v7, &properties, kCFAllocatorDefault, 0)) {
      break;
    }
    sub_10000587C("Unable to obtain properties of IOMedia object");
LABEL_12:
    IOObjectRelease(v7);
    io_object_t v7 = IOIteratorNext(iterator);
    if (!v7) {
      goto LABEL_13;
    }
  }

  Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
  int v9 = (const __CFBoolean *)CFDictionaryGetValue(properties, @"Whole");
  if (!Value || v9 != kCFBooleanTrue)
  {
    CFRelease(properties);
    goto LABEL_12;
  }

  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v21 = v11;
  __int128 v22 = v11;
  __int128 v19 = v11;
  __int128 v20 = v11;
  __int128 v17 = v11;
  __int128 v18 = v11;
  *(_OWORD *)buffer = v11;
  __int128 v16 = v11;
  CFStringGetCString(Value, buffer, 128LL, 0x8000100u);
  snprintf(a2, __size, "%s%s", "/dev/", buffer);
  CFRelease(properties);
  IOObjectRelease(v7);
  uint64_t v5 = 1LL;
LABEL_14:
  IOObjectRelease(iterator);
  return v5;
}

uint64_t sub_100008890(uint64_t a1, char *a2, size_t a3)
{
  io_iterator_t iterator = 0;
  if (IORegistryCreateIterator(kIOMainPortDefault, "IOService", 1u, &iterator))
  {
    sub_10000587C("Failed to allocate iterator");
    return 0LL;
  }

  io_object_t v6 = IOIteratorNext(iterator);
  if (!v6)
  {
LABEL_12:
    uint64_t v5 = 0LL;
    goto LABEL_13;
  }

  io_object_t v7 = v6;
  while (1)
  {
    if (!IOObjectConformsTo(v7, "IOMedia")
      || kCFBooleanTrue != IORegistryEntrySearchCFProperty( v7,  "IOService",  @"EmbeddedDeviceTypeFirmware",  kCFAllocatorDefault,  3u))
    {
      goto LABEL_11;
    }

    CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    if (!IORegistryEntryCreateCFProperties(v7, &properties, kCFAllocatorDefault, 0)) {
      break;
    }
    sub_10000587C("Unable to obtain properties of IOMedia object");
LABEL_11:
    IOObjectRelease(v7);
    io_object_t v7 = IOIteratorNext(iterator);
    if (!v7) {
      goto LABEL_12;
    }
  }

  Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
  if (!Value)
  {
    CFRelease(properties);
    goto LABEL_11;
  }

  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v19 = v10;
  __int128 v20 = v10;
  __int128 v17 = v10;
  __int128 v18 = v10;
  __int128 v15 = v10;
  __int128 v16 = v10;
  *(_OWORD *)buffer = v10;
  __int128 v14 = v10;
  CFStringGetCString(Value, buffer, 128LL, 0x8000100u);
  snprintf(a2, a3, "%s%s", "/dev/", buffer);
  CFRelease(properties);
  IOObjectRelease(v7);
  uint64_t v5 = 1LL;
LABEL_13:
  IOObjectRelease(iterator);
  return v5;
}

uint64_t sub_100008A8C()
{
  uint64_t v0 = IOServiceMatching("AppleANS2NVMeController");
  if (!v0)
  {
    sub_10000587C("Can't create AppleANS2NVMeController dictionary");
    return 16LL;
  }

  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (!MatchingService)
  {
    sub_10000587C("Can't find AppleANS2NVMeController service");
    return 16LL;
  }

  io_object_t v2 = MatchingService;
  if (IORegistryEntrySetCFProperty(MatchingService, @"bis-write-done", kCFBooleanTrue)) {
    sub_10000587C("Failed to commit BIS");
  }
  IOObjectRelease(v2);
  return 0LL;
}

void sub_100008B24(uint64_t a1)
{
  int v2 = 5;
  while (!*(_WORD *)(a1 + 140))
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
    __int128 v5 = xmmword_10000FD30;
    v4[0] = xmmword_10000FC50;
    memset(&v4[1], 255, 208);
    int Block = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), 15LL, v4, 248LL, 0LL, 0LL);
    if (Block != -536870187 && Block != -536870184)
    {
      if (Block)
      {
        sub_10000587C(">> reading BICS params failed.");
      }

      else if (LODWORD(v4[0]) == 1)
      {
        *(_DWORD *)(a1 + 140) = HIDWORD(v5);
        *(_DWORD *)(a1 + 144) = v6;
        sub_10000587C("recovery scale %d %d, nwords=%X");
      }

      else
      {
        sub_10000587C("unexpected struct version for BICS parameters");
      }

      return;
    }

    usleep(0xF4240u);
    if (!--v2) {
      return;
    }
  }

uint64_t sub_100008C64(const void *a1, size_t a2, char *a3)
{
  uint64_t v3 = 22LL;
  if (a1 && a3)
  {
    int v7 = open(a3, 1);
    if ((v7 & 0x80000000) == 0)
    {
      int v8 = v7;
      if (fcntl(v7, 48, 1LL) < 0)
      {
        sub_10000587C("Failed to set F_NOCACHE", v12);
      }

      else
      {
        ssize_t v9 = write(v8, a1, a2);
        ssize_t v10 = v9;
        if ((v9 & 0x8000000000000000LL) == 0 && v9 == a2)
        {
          uint64_t v3 = 0LL;
LABEL_14:
          close(v8);
          return v3;
        }

        sub_10000587C("Failed to Write");
        if (v10 < 0) {
          sub_10000587C("Write Failed");
        }
        else {
          sub_10000587C("Wrong Buf_size %zd - %zd");
        }
      }

      uint64_t v3 = *__error();
      goto LABEL_14;
    }

    sub_10000587C("Failed to open %s", a3);
    return *__error();
  }

  return v3;
}

uint64_t sub_100008D64(uint64_t a1)
{
  if (!*(_WORD *)(a1 + 140) || !*(_WORD *)(a1 + 142) || !*(_DWORD *)(a1 + 144))
  {
    uint64_t v5 = 3758097084LL;
    sub_10000587C("Params missing in %s");
    return v5;
  }

  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[14] = v3;
  v24[15] = v3;
  v24[12] = v3;
  v24[13] = v3;
  v24[10] = v3;
  v24[11] = v3;
  v24[8] = v3;
  v24[9] = v3;
  v24[6] = v3;
  v24[7] = v3;
  v24[4] = v3;
  v24[5] = v3;
  v24[2] = v3;
  v24[3] = v3;
  v24[0] = v3;
  v24[1] = v3;
  if (*(_BYTE *)(a1 + 25))
  {
    uint64_t v23 = (char *)0xAAAAAAAAAAAAAAAALL;
    unsigned int v22 = -1431655766;
    uint64_t v4 = sub_1000055B8(0x644C5448u, (void **)&v23, &v22);
    if ((_DWORD)v4)
    {
      uint64_t v5 = v4;
      sub_10000587C("Failed to read dLTH from ean: ret- %d");
      return v5;
    }

    uint64_t v12 = v23;
    uint64_t v13 = v23 + 4;
    unsigned int v14 = *(_DWORD *)v23;
    if ((*(_DWORD *)v23 & 0x80000000) != 0)
    {
      int v15 = v14 & 0x7FFFFFFF;
      uint64_t v13 = v23 + 8;
      unsigned int v14 = *((_DWORD *)v23 + 1);
    }

    else
    {
      int v15 = 1;
    }

    sub_10000587C("dLTH version: %u\n", v15);
    unsigned int v16 = *(_DWORD *)(a1 + 144);
    if (v14 > v16 || v22 <= v14)
    {
      uint64_t v5 = 3758097084LL;
      sub_10000587C("Buffer size mismatch in %s: buf %d, recovery.nwords %d", "load_recovery_lth", v14, v16);
      free(v12);
      return v5;
    }

    sub_10000587C("dLTH size: %u\n", v14);
    unint64_t v19 = (unint64_t)v13;
    int v21 = -1431655766;
    __int128 v18 = (uint64_t (**)())&off_100010908;
    unsigned int v20 = v14;
    uint64_t v5 = sub_100007618( a1,  (void (***)(void))&v18,  4 * v14,  *(unsigned __int16 *)(a1 + 140),  *(unsigned __int16 *)(a1 + 142),  14LL,  1,  "recovery LTH");
    free(v12);
    int v8 = -1;
  }

  else
  {
    if ((sub_100008670(v2, (char *)v24, 0x100uLL) & 1) == 0)
    {
      sub_10000587C("Unable to find BIS device");
      return 3758097098LL;
    }

    sub_10000587C("LTH recovery path = %s", (const char *)v24);
    unsigned int v7 = sub_100009040((const char *)v24);
    if ((v7 & 0x80000000) != 0)
    {
      __int128 v17 = strerror(-536870212);
      sub_10000587C("Unable to read BIS LTH - %s", v17);
      return 3758097098LL;
    }

    int v8 = v7;
    int v9 = 4 * *(_DWORD *)(a1 + 144);
    int v10 = *(unsigned __int16 *)(a1 + 140);
    int v11 = *(unsigned __int16 *)(a1 + 142);
    __int128 v18 = &off_1000108C8;
    unint64_t v19 = v7 | 0xAAAAAAAA00000000LL;
    uint64_t v5 = sub_100007618(a1, (void (***)(void))&v18, v9, v10, v11, 14LL, 1, "recovery LTH");
  }

  if (!(_DWORD)v5) {
    sub_10000587C("Disaster recovery history uploaded");
  }
  if ((v8 & 0x80000000) == 0) {
    close(v8);
  }
  return v5;
}

uint64_t sub_100009040(const char *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = open(a1, 0);
  if ((v2 & 0x80000000) != 0) {
    sub_10000587C("Failed to open %s", a1);
  }
  return v2;
}

uint64_t sub_100009094()
{
  return 3758097095LL;
}

uint64_t sub_1000090A0(char *a1, uint64_t a2)
{
  return ~sub_10000A9CC(0xFFFFFFFFLL, a1, a2);
}

BOOL sub_1000090C4(uint64_t a1, const char *a2, unsigned int a3, unsigned int a4)
{
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int v8 = v7;
  if (v7)
  {
    xpc_dictionary_set_uint64(v7, "channel", a3);
    xpc_dictionary_set_string(v8, "value_type", a2);
    xpc_dictionary_set_uint64(v8, "value", a4);
    analytics_send_event("com.apple.bim", v8);
    xpc_release(v8);
  }

  return v8 != 0LL;
}

BOOL sub_100009164(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int v8 = v7;
  if (v7)
  {
    xpc_dictionary_set_uint64(v7, "tile", a4 + 1000 * a2);
    int v9 = (unsigned __int16 *)(a3 + 6LL * a4);
    xpc_dictionary_set_uint64(v8, "red_min", v9[4]);
    xpc_dictionary_set_uint64(v8, "red_median", v9[5]);
    xpc_dictionary_set_uint64(v8, "red_max", v9[6]);
    xpc_dictionary_set_uint64(v8, "green_min", v9[604]);
    xpc_dictionary_set_uint64(v8, "green_median", v9[605]);
    xpc_dictionary_set_uint64(v8, "green_max", v9[606]);
    xpc_dictionary_set_uint64(v8, "blue_min", v9[1204]);
    xpc_dictionary_set_uint64(v8, "blue_median", v9[1205]);
    xpc_dictionary_set_uint64(v8, "blue_max", v9[1206]);
    analytics_send_event("com.apple.tbim", v8);
    xpc_release(v8);
  }

  return v8 != 0LL;
}

uint64_t sub_10000929C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  else {
    return 0LL;
  }
}

uint64_t sub_1000092DC(_BYTE *a1)
{
  mach_timebase_info info = 0LL;
  (*(void (**)(_BYTE *, uint64_t))(*(void *)a1 + 72LL))(a1, 1LL);
  unint64_t v2 = byte_1000140A1;
  int v3 = byte_1000140A0[0];
  if (byte_1000140A1 >= byte_1000140A0[0])
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v4 = &byte_1000140A0[48 * byte_1000140A1 + 32];
    while (!a1[27])
    {
      mach_timebase_info(&info);
      uint64_t v5 = (uint64_t (*)(void *))*((void *)v4 - 2);
      uint64_t v6 = *((void *)v4 - 1);
      uint64_t v7 = mach_absolute_time();
      int v8 = &a1[v6 >> 1];
      if ((v6 & 1) != 0) {
        uint64_t v5 = *(uint64_t (**)(void *))(*v8 + v5);
      }
      uint64_t v9 = v5(v8);
      uint64_t v10 = (mach_absolute_time() - v7) * info.numer / info.denom / 0xF4240;
      sub_10000587C("Task %s took %llu millisec\n", v4, v10);
      *((void *)v4 - 3) = v10;
      byte_1000140A1 = ++v2;
      int v3 = byte_1000140A0[0];
      v4 += 48;
      if (v2 >= byte_1000140A0[0])
      {
        LODWORD(v2) = v2;
        goto LABEL_10;
      }
    }

    sub_10000587C("Interrupted by sleep at %s task!!\n", v4);
    LODWORD(v2) = byte_1000140A1;
    int v3 = byte_1000140A0[0];
    uint64_t v9 = 3758097131LL;
  }

LABEL_10:
  if ((_DWORD)v2 == v3)
  {
    sub_10000587C("Tasks completed!!\n");
    byte_1000140A1 = 0;
  }

  (*(void (**)(_BYTE *, void))(*(void *)a1 + 72LL))(a1, 0LL);
  return v9;
}

uint64_t sub_10000944C(_BYTE *a1)
{
  if (a1[8]) {
    return (*(uint64_t (**)(_BYTE *))(*(void *)a1 + 88LL))(a1);
  }
  LODWORD(v3) = sub_1000058E4((uint64_t)a1);
  int v4 = sub_100005988((uint64_t)a1);
  if (!(_DWORD)v3) {
    LODWORD(v3) = v4;
  }
  int v5 = sub_100005A50((uint64_t)a1);
  if (!(_DWORD)v3) {
    LODWORD(v3) = v5;
  }
  int v6 = sub_100005B38((uint64_t)a1);
  if (!(_DWORD)v3) {
    LODWORD(v3) = v6;
  }
  if (a1[29])
  {
    sub_100006F00((uint64_t)a1);
    sub_1000083A4((uint64_t)a1);
  }

  unsigned int v7 = sub_100005C2C((uint64_t)a1);
  if ((_DWORD)v3) {
    uint64_t v3 = v3;
  }
  else {
    uint64_t v3 = v7;
  }
  sub_100005D48((uint64_t)a1);
  sub_100005FAC((uint64_t)a1);
  sub_10000618C((uint64_t)a1);
  return v3;
}

uint64_t sub_100009508(uint64_t a1, uint64_t a2)
{
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v8.st_blksize = v4;
  *(timespec *)v8.st_qspare = v4;
  v8.st_birthtimespec = v4;
  *(timespec *)&v8.unsigned int st_size = v4;
  v8.st_mtimespec = v4;
  v8.st_ctimespec = v4;
  *(timespec *)&v8.st_uid = v4;
  v8.st_atimespec = v4;
  *(timespec *)&v8.st_dev = v4;
  if (!*(_BYTE *)(a1 + 24) && stat("migrate_history", &v8))
  {
    *(_BYTE *)(a1 + 136) = 1;
    uint64_t result = sub_1000058E4(a1);
    *(_BYTE *)(a1 + 136) = 0;
    if ((_DWORD)result) {
      return snprintf((char *)a2, 0x64uLL, "save migrate history [%X]");
    }
    *(_WORD *)(a2 + 16) = 108;
    unsigned int v7 = "export successful";
    goto LABEL_17;
  }

  sub_100006E6C(a1);
  *(_BYTE *)(a1 + 136) = 1;
  if (*(_BYTE *)(a1 + 24)) {
    int v5 = sub_10000798C(a1, 0x4C544820u, 1, 1, 14LL, 1, "history");
  }
  else {
    int v5 = sub_100007890(a1, "migrate_history", 1, 1, 14LL, 1, "migrate history");
  }
  *(_BYTE *)(a1 + 136) = 0;
  if (v5) {
    return snprintf((char *)a2, 0x64uLL, "import history failed [%X]");
  }
  if (!*(_BYTE *)(a1 + 24)) {
    unlink("migrate_history");
  }
  uint64_t result = sub_100005A50(a1);
  if (!(_DWORD)result)
  {
    *(_WORD *)(a2 + 16) = 108;
    unsigned int v7 = "import successful";
LABEL_17:
    *(_OWORD *)a2 = *(_OWORD *)v7;
    return result;
  }

  return snprintf((char *)a2, 0x64uLL, "save BIC failed [%X]");
}

uint64_t sub_1000096B0(uint64_t a1)
{
  *(void *)(a1 + 16) = 0LL;
  *(_DWORD *)(a1 + 25) = 0;
  *(void *)a1 = off_1000106B8;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)off_100010710;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)off_100010720;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)off_100010730;
  bzero((void *)(a1 + 80), 0xD6uLL);
  return a1;
}

uint64_t sub_100009708(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  *(_BYTE *)(a1 + 25) = sub_100004CE0(a1, @"ean-storage-present");
  return 1LL;
}

BOOL sub_10000973C(uint64_t a1)
{
  int Block = IOMobileFramebufferGetBlock(*(void *)(a1 + 16), 62LL, a1 + 80, 214LL, 0LL, 0LL);
  if (Block)
  {
    sub_10000587C("No LACS support");
  }

  else
  {
    int v4 = sub_100009A18(a1);
    if (v4)
    {
      if (v4 == -536870911)
      {
        sub_100009C24(a1);
        sub_100009C7C(a1, 0);
      }

      else
      {
        sub_10000587C("Failed to upload LAC");
      }
    }
  }

  return Block == 0;
}

uint64_t sub_1000097E4(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 293) & 1) != 0) {
    return 0LL;
  }
  unsigned int v17 = 0;
  __ptr = 0LL;
  int v2 = sub_100004480(22400);
  int v15 = (FILE *)0xAAAAAAAAAAAAAAAALL;
  sub_10000ABCC(&v15, *(char **)(a1 + 32));
  if (v15)
  {
    int v3 = sub_100009D00(a1, &v15, (char *)__ptr, v17, &v18, "file history");
    if (v3 == -536870911)
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      *(_OWORD *)__new = 0u;
      time_t v14 = time(0LL);
      unsigned int v7 = localtime(&v14);
      strftime(__new, 0x50uLL, "history_%R_%F", v7);
      if (v15) {
        fclose(v15);
      }
      int v15 = 0LL;
      rename(*(const char **)(a1 + 32), __new);
      sub_10000587C("corrupted history moved aside %s\n", __new);
    }

    else if (!v3)
    {
      uint64_t v5 = 0LL;
      goto LABEL_16;
    }
  }

  uint64_t v8 = sub_100009F34(a1, __ptr, v17, "recovery history");
  uint64_t v6 = v8;
  if ((_DWORD)v8)
  {
    if ((_DWORD)v8 == -536870911)
    {
      sub_100005710(0x724C4153u);
      uint64_t v6 = 3758096385LL;
    }

    goto LABEL_19;
  }

  uint64_t v5 = 1LL;
LABEL_16:
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = off_100010740[v5];
  uint64_t v11 = sub_100008504(v9, 58LL, (uint64_t)__ptr, v17, v10, 0, v4);
  uint64_t v6 = v11;
  if ((_DWORD)v11)
  {
    uint64_t v12 = sub_100007B68(v11);
    sub_100004D6C("upload %s failed: %s", v10, v12);
  }

  else
  {
    sub_10000587C("uploaded %s", v10);
    uint64_t v6 = 0LL;
  }

LABEL_19:
  if (__ptr) {
    free(__ptr);
  }
  if (v15) {
    fclose(v15);
  }
  return v6;
}

void sub_1000099F0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, FILE *a12)
{
  if (a12) {
    fclose(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100009A18(uint64_t a1)
{
  char v2 = *(_BYTE *)(a1 + 80);
  unsigned int v12 = 0;
  __ptr = 0LL;
  int v3 = sub_100004480(5600);
  if ((*(_BYTE *)(a1 + 80) & 2) != 0
    && (uint64_t v10 = (FILE *)0xAAAAAAAAAAAAAAAALL, sub_10000ABCC(&v10, *(char **)(a1 + 64)), v10))
  {
    int v5 = sub_100009D00(a1, &v10, (char *)__ptr, v12, &v13, "test LAC");
    if (v10) {
      fclose(v10);
    }
    if (!v5)
    {
      uint64_t v6 = 2LL;
      goto LABEL_25;
    }
  }

  else if ((v2 & 1) != 0)
  {
    uint64_t v6 = 3LL;
    goto LABEL_24;
  }

  uint64_t v8 = sub_10000A138(a1, __ptr, v12, "iLAC");
  if ((_DWORD)v8)
  {
    uint64_t v7 = v8;
    if ((_DWORD)v8 == -536870911) {
      sub_100005710(0x694C4143u);
    }
    uint64_t v10 = (FILE *)0xAAAAAAAAAAAAAAAALL;
    sub_10000ABCC(&v10, *(char **)(a1 + 48));
    if (!v10) {
      goto LABEL_28;
    }
    uint64_t v7 = sub_100009D00(a1, &v10, (char *)__ptr, v12, &v13, "file LAC");
    if ((_DWORD)v7 == -536870911)
    {
      if (v10) {
        fclose(v10);
      }
      uint64_t v10 = 0LL;
      unlink(*(const char **)(a1 + 48));
    }

    if (v10) {
      fclose(v10);
    }
    if ((_DWORD)v7) {
      goto LABEL_28;
    }
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = 1LL;
  }

LABEL_24:
  if ((*(_BYTE *)(a1 + 80) & 1) == 0)
  {
LABEL_25:
    uint64_t v7 = sub_100008504(*(void *)(a1 + 16), 59LL, (uint64_t)__ptr, v12, "LAC", 0, v4);
    if (!(_DWORD)v7)
    {
      sub_10000587C("uploaded %s", off_100010750[v6]);
      *(_BYTE *)(a1 + 80) |= 1u;
    }

    goto LABEL_28;
  }

  uint64_t v7 = 0LL;
LABEL_28:
  if (__ptr) {
    free(__ptr);
  }
  return v7;
}

void sub_100009C08( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, FILE *a10)
{
  if (a10) {
    fclose(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100009C24(uint64_t a1)
{
  uint64_t v1 = IOMobileFramebufferSetParameter(*(void *)(a1 + 16), 12LL, 0LL, 0LL);
  char v2 = sub_100007B68(v1);
  sub_10000587C("%s: %s", "update_lac", v2);
  return v1;
}

uint64_t sub_100009C7C(uint64_t a1, int a2)
{
  int v4 = sub_100004480(5600);
  return sub_10000A4EC(a1, a2, 59LL, v4, *(FILE **)(a1 + 56), *(char **)(a1 + 48), 4, "lac", 0x694C4143u);
}

uint64_t sub_100009CDC(uint64_t a1)
{
  return IOMobileFramebufferSetParameter(*(void *)(a1 + 16), 13LL, 0LL, 0LL);
}

uint64_t sub_100009CF0(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 8LL * a2 + 32);
}

uint64_t sub_100009D00(uint64_t a1, FILE **a2, char *__ptr, unsigned int a4, _DWORD *a5, const char *a6)
{
  if (!*a2 || (int v12 = *(_DWORD *)(a1 + 89), fread(__ptr, 1uLL, 4uLL, *a2) != 4))
  {
    uint64_t v19 = 3758097084LL;
    sub_100004D6C("failed to read %s version");
    return v19;
  }

  int v13 = sub_100004490(__ptr);
  if (!v13)
  {
    sub_100004D6C("%s header version unknown %d");
    return 3758096385LL;
  }

  if (!*a2 || (int v14 = v13, fread(__ptr + 4, 1uLL, (v13 - 4), *a2) != v13 - 4))
  {
    uint64_t v19 = 3758097084LL;
    sub_100004D6C("failed to read %s header");
    return v19;
  }

  int v15 = sub_1000044A4((uint64_t)__ptr, 1);
  int v16 = v15;
  if (v15 - 1 >= a4)
  {
    uint64_t v19 = 3758097084LL;
    sub_100004D6C("bad %s size 0x%x buf 0x%x");
    return v19;
  }

  if (!*a2 || fread(&__ptr[v14], 1uLL, (v15 - v14), *a2) != v15 - v14)
  {
    uint64_t v19 = 3758097084LL;
    sub_100004D6C("failed to read %s content");
    return v19;
  }

  if (v12 && !sub_100004514(&__ptr[v14], *((unsigned int *)__ptr + 2), (char *)(a1 + 93), v12))
  {
    sub_100004D6C("%s panel mismatch", a6);
    *(_BYTE *)(a1 + 26) = 1;
    return 3758096385LL;
  }

  unsigned int v17 = (v16 - 4) >> 2;
  int v18 = *(_DWORD *)&__ptr[4 * v17];
  int v21 = 0;
  sub_10000454C((int *)__ptr, v17, &v21);
  if ((*(_BYTE *)(a1 + 80) & 2) == 0 && v21 != v18)
  {
    sub_100004D6C("%s CRC not valid 0x%x 0x%x");
    return 3758096385LL;
  }

  uint64_t v19 = 0LL;
  *a5 = v16;
  return v19;
}

FILE *sub_100009F08(FILE **a1)
{
  uint64_t result = *a1;
  if (result) {
    uint64_t result = (FILE *)fclose(result);
  }
  *a1 = 0LL;
  return result;
}

uint64_t sub_100009F34(uint64_t a1, _DWORD *a2, unsigned int a3, const char *a4)
{
  int v5 = *(_DWORD *)(a1 + 89);
  int v24 = 0LL;
  unsigned int v23 = 0;
  if (*(_BYTE *)(a1 + 25) && !sub_1000055B8(0x724C4153u, (void **)&v24, &v23))
  {
    uint64_t v10 = v24;
    int v22 = 0;
    if (*v24 <= *(_DWORD *)(a1 + 85) && sub_100004490(v24))
    {
      unsigned int v11 = sub_1000044A4((uint64_t)v10, 1);
      unsigned int v12 = v11;
      if (v11 - 1 >= a3 || 4 * (unint64_t)v23 < v11)
      {
        sub_100004D6C("%s has bad size hdr 0x%x ean 0x%x buf 0x%x");
      }

      else if (v5 && (unsigned int v13 = sub_100004490(v10), !sub_100004514((const char *)v10 + v13, v10[2], (char *)(a1 + 93), v5)))
      {
        sub_100004D6C("%s panel mismatch");
      }

      else
      {
        uint64_t v14 = (v12 >> 2) - 1;
        unsigned int v15 = v10[v14];
        if (v12 >> 2 != 1)
        {
          uint64_t v16 = (v12 >> 2) - 1;
          unsigned int v17 = a2;
          int v18 = (int *)v10;
          uint64_t v19 = (int *)v10;
          do
          {
            int v20 = *v19++;
            *v17++ = v20;
            sub_10000454C(v18, 1, &v22);
            int v18 = v19;
            --v16;
          }

          while (v16);
        }

        if ((*(_BYTE *)(a1 + 80) & 2) != 0 || v15 == v22)
        {
          uint64_t v9 = 0LL;
          a2[v14] = v15;
LABEL_18:
          free(v10);
          return v9;
        }

        sub_100004D6C("%s CRC not valid 0x%x 0x%x");
      }
    }

    else
    {
      sub_100004D6C("%s header version unknown %d support %d");
    }

    uint64_t v9 = 3758096385LL;
    goto LABEL_18;
  }

  sub_100004D6C("could not read %s from EAN\n", a4);
  return 3758097084LL;
}

FILE **sub_10000A108(FILE **a1)
{
  char v2 = *a1;
  if (v2) {
    fclose(v2);
  }
  *a1 = 0LL;
  return a1;
}

uint64_t sub_10000A138(uint64_t a1, _DWORD *a2, unsigned int a3, const char *a4)
{
  int v5 = *(_DWORD *)(a1 + 89);
  int v24 = 0LL;
  unsigned int v23 = 0;
  if (*(_BYTE *)(a1 + 25) && !sub_1000055B8(0x694C4143u, (void **)&v24, &v23))
  {
    uint64_t v10 = v24;
    int v22 = 0;
    if (*v24 <= *(_DWORD *)(a1 + 81) && sub_100004490(v24))
    {
      unsigned int v11 = sub_1000044A4((uint64_t)v10, 1);
      unsigned int v12 = v11;
      if (v11 - 1 >= a3 || 4 * (unint64_t)v23 < v11)
      {
        sub_100004D6C("%s has bad size hdr 0x%x ean 0x%x buf 0x%x");
      }

      else if (v5 && (unsigned int v13 = sub_100004490(v10), !sub_100004514((const char *)v10 + v13, v10[2], (char *)(a1 + 93), v5)))
      {
        sub_100004D6C("%s panel mismatch");
      }

      else
      {
        uint64_t v14 = (v12 >> 2) - 1;
        unsigned int v15 = v10[v14];
        if (v12 >> 2 != 1)
        {
          uint64_t v16 = (v12 >> 2) - 1;
          unsigned int v17 = a2;
          int v18 = (int *)v10;
          uint64_t v19 = (int *)v10;
          do
          {
            int v20 = *v19++;
            *v17++ = v20;
            sub_10000454C(v18, 1, &v22);
            int v18 = v19;
            --v16;
          }

          while (v16);
        }

        if ((*(_BYTE *)(a1 + 80) & 2) != 0 || v15 == v22)
        {
          uint64_t v9 = 0LL;
          a2[v14] = v15;
LABEL_18:
          free(v10);
          return v9;
        }

        sub_100004D6C("%s CRC not valid 0x%x 0x%x");
      }
    }

    else
    {
      sub_100004D6C("%s header version unknown %d support %d");
    }

    uint64_t v9 = 3758096385LL;
    goto LABEL_18;
  }

  sub_100004D6C("could not read %s from EAN\n", a4);
  return 3758097084LL;
}

uint64_t sub_10000A30C(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 8LL * a2 + 48);
}

uint64_t sub_10000A318(int a1, const void *a2, unsigned int a3, FILE *a4, FILE *a5, const char *a6, int a7)
{
  if (__stream[0] && fwrite(a2, 1uLL, a3, __stream[0]) && sub_1000081D4((uint64_t)__stream))
  {
    sub_10000587C("saved %s to file", a6);
    uint64_t v10 = 0LL;
  }

  else
  {
    sub_1000082A0((uint64_t)__stream);
    sub_100004D6C("%s save failure", a6);
    uint64_t v10 = 3758097084LL;
  }

  if (__stream[0]) {
    fclose(__stream[0]);
  }
  return v10;
}

void sub_10000A3DC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, FILE *a10)
{
  if (a10) {
    fclose(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A3F4(uint64_t a1, int a2, const void *a3, unsigned int a4, unsigned int a5, const char *a6)
{
  size_t v9 = (a2 + 4095) & 0xFFFFF000;
  if (v9 <= a4)
  {
    unsigned int v12 = 0LL;
  }

  else
  {
    unsigned int v11 = malloc((a2 + 4095) & 0xFFFFF000);
    if (!v11)
    {
      uint64_t v13 = 3758097084LL;
      sub_100004D6C("could not allocate memory to save %s to EAN", a6);
      return v13;
    }

    unsigned int v12 = v11;
    bzero(v11, v9);
    memcpy(v12, a3, a4);
    a3 = v12;
  }

  if (sub_1000057A0(a5, (uint64_t)a3, v9 >> 2))
  {
    uint64_t v13 = 3758097084LL;
    sub_100004D6C("save %s to EAN failed", a6);
    if (!v12) {
      return v13;
    }
    goto LABEL_9;
  }

  sub_10000587C("saved %s to EAN", a6);
  uint64_t v13 = 0LL;
  if (v12) {
LABEL_9:
  }
    free(v12);
  return v13;
}

uint64_t sub_10000A4EC( uint64_t a1, int a2, uint64_t a3, int a4, FILE *a5, char *a6, int a7, const char *a8, unsigned int a9)
{
  unsigned int v17 = (const char *)&unk_10000B903;
  if (a2) {
    unsigned int v17 = " with backup";
  }
  sub_10000587C("%s %s%s", "save_lac_data", a6, v17);
  timespec v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v19 = v27;
  uint64_t v20 = sub_100008504(*(void *)(a1 + 16), a3, (uint64_t)v27, SHIDWORD(v28), a8, 1, v18);
  if (!(_DWORD)v20)
  {
    unsigned int v21 = sub_1000044A4((uint64_t)v19, 0);
    int v22 = sub_10000454C((int *)v27, v21 >> 2, (int *)&v28);
    unsigned int v23 = v27;
    *(_DWORD *)((char *)v27 + v21) = v28;
    int v24 = v21 + 4;
    uint64_t v25 = sub_10000A318(v22, v23, v21 + 4, a5, (FILE *)a6, a8, a7);
    uint64_t v20 = v25;
    if (a2)
    {
      if (*(_BYTE *)(a1 + 25)) {
        uint64_t v20 = sub_10000A3F4(v25, v24, v27, HIDWORD(v28), a9, a8);
      }
      else {
        sub_100004D6C("could not access EAN");
      }
    }
  }

  if (v27) {
    free(v27);
  }
  return v20;
}

uint64_t sub_10000A658( uint64_t a1, int a2, uint64_t a3, int a4, FILE *a5, char *a6, int a7, const char *a8, unsigned int a9)
{
  unsigned int v17 = (const char *)&unk_10000B903;
  if (a2) {
    unsigned int v17 = " with backup";
  }
  sub_10000587C("%s %s%s", "save_lah_data", a6, v17);
  timespec v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v19 = v27;
  uint64_t v20 = sub_100008504(*(void *)(a1 + 16), a3, (uint64_t)v27, SHIDWORD(v28), a8, 1, v18);
  if (!(_DWORD)v20)
  {
    unsigned int v21 = sub_1000044A4((uint64_t)v19, 0);
    int v22 = sub_10000454C((int *)v27, v21 >> 2, (int *)&v28);
    unsigned int v23 = v27;
    *(_DWORD *)((char *)v27 + v21) = v28;
    int v24 = v21 + 4;
    uint64_t v25 = sub_10000A318(v22, v23, v21 + 4, a5, (FILE *)a6, a8, a7);
    uint64_t v20 = v25;
    if (a2)
    {
      if (*(_BYTE *)(a1 + 25)) {
        uint64_t v20 = sub_10000A3F4(v25, v24, v27, HIDWORD(v28), a9, a8);
      }
      else {
        sub_100004D6C("could not access EAN");
      }
    }
  }

  if (v27) {
    free(v27);
  }
  return v20;
}

uint64_t sub_10000A7C4(uint64_t a1, int a2)
{
  int v4 = sub_100004480(22400);
  return sub_10000A658(a1, a2, 58LL, v4, *(FILE **)(a1 + 40), *(char **)(a1 + 32), 4, "history", 0x724C4153u);
}

uint64_t sub_10000A824(uint64_t a1)
{
  return sub_10000A7C4(a1, 0);
}

uint64_t sub_10000A834(uint64_t a1)
{
  unsigned int v2 = sub_10000A7C4(a1, 1);
  unsigned int v3 = sub_100009C24(a1);
  if (!v2) {
    unsigned int v2 = v3;
  }
  LODWORD(result) = sub_100009C7C(a1, 1);
  if (v2) {
    return v2;
  }
  else {
    return result;
  }
}

BOOL sub_10000A880(FILE **a1, void *__ptr, size_t __nitems)
{
  return *a1 && fread(__ptr, 1uLL, __nitems, *a1) == __nitems;
}

void sub_10000A8C4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 4) == 1 && *(_DWORD *)a2 == 1 && !*(void *)(a2 + 8))
  {
    int v2 = IOMobileFramebufferSetParameter(*(void *)(a1 + 16), 13LL, 0LL, 0LL);
    if (v2)
    {
      unsigned int v3 = sub_100007B68(v2);
      sub_100004D6C("Couldn't reset history: %s", v3);
    }

    else
    {
      sub_10000587C("Cleared history in driver");
    }
  }

  else
  {
    sub_10000587C("Unsupported operation");
  }

uint64_t sub_10000A948(uint64_t result, int a2)
{
  for (uint64_t i = 0LL; i != 256; ++i)
  {
    int v3 = 8;
    unsigned int v4 = i;
    do
    {
      unsigned int v4 = ((int)(v4 << 31) >> 31) & a2 ^ (v4 >> 1);
      --v3;
    }

    while (v3);
    *(_DWORD *)(result + 4 * i) = v4;
  }

  return result;
}

void sub_10000A97C()
{
  for (uint64_t i = 0LL; i != 256; ++i)
  {
    int v1 = 8;
    unsigned int v2 = i;
    do
    {
      unsigned int v2 = ((int)(v2 << 31) >> 31) & 0xEDB88320 ^ (v2 >> 1);
      --v1;
    }

    while (v1);
    dword_1000142EC[i] = v2;
  }

  byte_1000146EC = 1;
}

uint64_t sub_10000A9CC(uint64_t result, char *a2, uint64_t a3)
{
  if ((byte_1000146EC & 1) == 0)
  {
    for (uint64_t i = 0LL; i != 256; ++i)
    {
      int v4 = 8;
      unsigned int v5 = i;
      do
      {
        unsigned int v5 = ((int)(v5 << 31) >> 31) & 0xEDB88320 ^ (v5 >> 1);
        --v4;
      }

      while (v4);
      dword_1000142EC[i] = v5;
    }

    byte_1000146EC = 1;
  }

  for (; a3; --a3)
  {
    char v6 = *a2++;
    uint64_t result = dword_1000142EC[(v6 ^ result)] ^ (result >> 8);
  }

  return result;
}

BOOL sub_10000AA44(int *a1, int *a2, unsigned int a3)
{
  unsigned int v3 = a3 >> 2;
  if (a3 >= 4)
  {
    unsigned int v5 = 0;
    if (v3 <= 1) {
      uint64_t v4 = 1LL;
    }
    else {
      uint64_t v4 = v3;
    }
    uint64_t v6 = v4;
    uint64_t v7 = a2;
    uint64_t v8 = a1;
    while (1)
    {
      int v10 = *v8++;
      int v9 = v10;
      int v11 = *v7++;
      if (v9 != v11) {
        break;
      }
      ++v5;
      if (!--v6) {
        return (_DWORD)v4 != v3;
      }
    }

    BOOL v12 = v5 >= 4;
    unsigned int v13 = v5 - 4;
    if (v12) {
      LODWORD(v4) = v13;
    }
    else {
      LODWORD(v4) = 0;
    }
    uint64_t v14 = &a1[v4];
    unsigned int v15 = &a2[v4];
    sub_10000587C( "a[%d/%d] = %08X %08X %08X %08X %08X %08X %08X %08X",  v4,  a3 >> 2,  *v14,  v14[1],  v14[2],  v14[3],  v14[4],  v14[5],  v14[6],  v14[7]);
    sub_10000587C( "b[%d/%d] = %08X %08X %08X %08X %08X %08X %08X %08X",  v4,  v3,  *v15,  v15[1],  v15[2],  v15[3],  v15[4],  v15[5],  v15[6],  v15[7]);
  }

  else
  {
    LODWORD(v4) = 0;
  }

  return (_DWORD)v4 != v3;
}

uint64_t sub_10000AB30(io_connect_t *a1)
{
  unsigned int v2 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    uint64_t v5 = IOServiceOpen(MatchingService, mach_task_self_, 0, a1);
    IOObjectRelease(v4);
    if ((_DWORD)v5) {
      sub_10000587C("IOServiceOpen on AppleNVMeEAN failed, ans = 0x%x \n", v5);
    }
  }

  else
  {
    sub_10000587C("Couldn't find AppleNVMeEAN object");
    return 5LL;
  }

  return v5;
}

FILE **sub_10000ABCC(FILE **a1, char *__filename)
{
  io_object_t v4 = fopen(__filename, "r");
  *a1 = v4;
  if (!v4) {
    sub_100004D6C("Could not open file %s", __filename);
  }
  return a1;
}

BOOL sub_10000AC20(const char *a1)
{
  int v1 = sem_open(a1, 0);
  unsigned int v2 = v1;
  if (v1 != (sem_t *)-1LL) {
    sem_close(v1);
  }
  return v2 != (sem_t *)-1LL;
}

void sub_10000AC5C(const char *a1)
{
  unsigned int v2 = sem_open(a1, 512, 256LL, 0LL);
  if (v2 == (sem_t *)-1LL)
  {
    unsigned int v3 = __error();
    sub_100004D6C("could not create semaphore %s (%d)", a1, *v3);
  }

  else
  {
    sem_close(v2);
  }

void sub_10000ACC0(const void *a1, unsigned int a2, const char *a3)
{
  size_t v6 = a2;
  if (a2 <= 0xC7) {
    size_t v7 = 200LL - a2;
  }
  else {
    size_t v7 = 0LL;
  }
  bzero(&__dst[a2], v7);
  memcpy(__dst, a1, v6);
  __dst[a2] = 0;
  sub_10000587C("%s %s len %d\n", a3, __dst, a2);
}

uint64_t sub_10000AD7C()
{
  return 1LL;
}

uint64_t sub_10000AD84()
{
  return 0LL;
}

uint64_t sub_10000AD8C()
{
  return 0LL;
}

uint64_t sub_10000AD94()
{
  return 0LL;
}

uint64_t sub_10000ADA8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 27) = a2;
  return result;
}

void sub_10000ADB8(id a1)
{
  qword_1000146F0 = (uint64_t)dispatch_semaphore_create(0LL);
}

void sub_10000ADD8(id a1)
{
}

ssize_t sub_10000ADE4(uint64_t a1, void *a2, unsigned int a3)
{
  return read(*(_DWORD *)(a1 + 8), a2, 4LL * a3);
}

void *sub_10000ADF0(uint64_t a1, void *__dst, unsigned int a3)
{
  if (*(_DWORD *)(a1 + 16) >= a3) {
    unsigned int v4 = a3;
  }
  else {
    unsigned int v4 = *(_DWORD *)(a1 + 16);
  }
  uint64_t result = memcpy(__dst, *(const void **)(a1 + 8), 4LL * v4);
  *(_DWORD *)(a1 + 16) -= v4;
  *(void *)(a1 + 8) += 4LL * v4;
  return result;
}

FILE **sub_10000AE44(FILE **a1, FILE *a2, FILE *a3, int a4)
{
  a1[1] = a2;
  a1[2] = a3;
  if (a4)
  {
    int v5 = open_dprotected_np((const char *)a2, 1537, a4, 0, 420LL);
    if (v5 < 0)
    {
      *a1 = 0LL;
LABEL_8:
      sub_100004D6C("Could not open temp file %s", (const char *)a1[1]);
      return a1;
    }

    size_t v6 = fdopen(v5, "w");
  }

  else
  {
    size_t v6 = fopen((const char *)a2, "w");
  }

  *a1 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  return a1;
}

uint64_t sub_10000AEDC(uint64_t a1, uint64_t a2, int a3, size_t __nitems, int a5)
{
  unsigned int v6 = __nitems;
  int v10 = *(FILE ***)(a1 + 32);
  if (v10 && (!*v10 || !fwrite((const void *)(a2 + 28), 4uLL, __nitems, *v10)))
  {
    sub_10000587C("%s: write failure", *(const char **)(a1 + 24));
    return 3758097084LL;
  }

  int v11 = *(void ***)a1;
  if (*(void *)a1)
  {
    if (a3)
    {
      BOOL v12 = *v11;
      if (!*v11) {
        return 0LL;
      }
    }

    else
    {
      int v14 = *(_DWORD *)(a1 + 16);
      if (v14) {
        size_t v15 = (4 * (a5 + 1) + v14 - 1) & -v14;
      }
      else {
        size_t v15 = 4LL * (a5 + 1);
      }
      *int v11 = malloc(v15);
      uint64_t v16 = *(void ***)a1;
      **(_DWORD **)(a1 + 8) = v15 >> 2;
      BOOL v12 = *v16;
      if (!*v16) {
        return 0LL;
      }
      _DWORD *v12 = a5;
    }

    memcpy(&v12[a3 + 1], (const void *)(a2 + 28), 4LL * v6);
  }

  return 0LL;
}

uint64_t sub_10000AFE4(unsigned int *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  if (!a3)
  {
    int v10 = (void **)*((void *)a1 + 3);
    if (!*v10)
    {
      a1[2] = a5;
      unsigned int v11 = a1[1];
      size_t v12 = v11 ? (v11 + 4 * (*a1 + a5) - 1) & -v11 : 4LL * (*a1 + a5);
      *int v10 = malloc(v12);
      if (!*((void *)a1 + 3)) {
        sub_10000587C("%s: failed to allocate buffer.", *((const char **)a1 + 2));
      }
    }
  }

  uint64_t v13 = 3758097084LL;
  int v14 = (void *)*((void *)a1 + 3);
  if (!v14) {
    return 3758097085LL;
  }
  if (a4 + a3 <= a5 && a1[2] == a5)
  {
    memcpy((void *)(*v14 + 4LL * a3 + 4LL * *a1), (const void *)(a2 + 28), 4LL * a4);
    return 0LL;
  }

  else
  {
    sub_10000587C("%s: inconsistent data from server.", *((const char **)a1 + 2));
  }

  return v13;
}

void sub_10000B0F0(pthread_t *a1)
{
}

uint64_t sub_10000B128()
{
  io_object_t notifier = 0;
  IONotificationPortRef notify = 0LL;
  io_connect_t v0 = IORegisterForSystemPower(0LL, &notify, (IOServiceInterestCallback)sub_10000456C, &notifier);
  dword_10001470C = v0;
  if (notify) {
    BOOL v1 = v0 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(notify);
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    CFRunLoopRun();
  }

  sub_100004D6C("power listener thread returning. :(");
  return 0LL;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}