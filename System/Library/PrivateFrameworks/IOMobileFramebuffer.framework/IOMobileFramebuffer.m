uint64_t AppleDisplayManagerGetTypeID()
{
  uint64_t result;
  result = kAppleDisplayManagerID;
  if (!kAppleDisplayManagerID)
  {
    pthread_once(&AppleDisplayManagerGetTypeID_once, (void (*)(void))appleDisplayManageClassInitialize);
    return kAppleDisplayManagerID;
  }

  return result;
}

uint64_t appleDisplayManageClassInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kAppleDisplayManagerID = result;
  return result;
}

uint64_t AppleDisplayManagerOpen(io_service_t a1, task_port_t a2, uint32_t a3, uint64_t a4)
{
  if (a4)
  {
    if (!kAppleDisplayManagerID) {
      pthread_once(&AppleDisplayManagerGetTypeID_once, (void (*)(void))appleDisplayManageClassInitialize);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    *(_DWORD *)(Instance + 20) = 0;
    pthread_mutex_init((pthread_mutex_t *)(Instance + 24), 0LL);
    *(void *)a4 = Instance;
    *(_DWORD *)(Instance + 16) = a1;
    uint64_t v9 = IOServiceOpen(a1, a2, a3, (io_connect_t *)(Instance + 20));
    v10 = *(void **)a4;
    if ((_DWORD)v9)
    {
      CFRelease(v10);
      *(void *)a4 = 0LL;
      syslog(3, " %s:  failed IOServiceOpen. return %d \n", "AppleDisplayManagerOpen", v9);
    }

    else
    {
      v10[11] = kern_DisplayWallEnumerate;
      *(void *)(*(void *)a4 + 96LL) = kern_DisplayWallValidateConfig;
      *(void *)(*(void *)a4 + 104LL) = kern_DisplayWallEnable;
      *(void *)(*(void *)a4 + 112LL) = kern_DisplayWallDisable;
      *(void *)(*(void *)a4 + 120LL) = kern_DisplayWallStatus;
      syslog(3, " %s:  success, return %d \n");
    }
  }

  else
  {
    uint64_t v9 = 3758097090LL;
    syslog(3, " %s:  failed, bad argument return %d \n");
  }

  return v9;
}

uint64_t kern_DisplayWallEnumerate(uint64_t a1, void *a2)
{
  uint64_t v2 = 3758097090LL;
  size_t outputStructCnt = 644LL;
  if (a1 && a2)
  {
    v5 = (pthread_mutex_t *)(a1 + 24);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
    unsigned int v6 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 3u, 0LL, 0LL, a2, &outputStructCnt);
    if (outputStructCnt == 644) {
      unsigned int v7 = 0;
    }
    else {
      unsigned int v7 = -536870199;
    }
    if (v6) {
      uint64_t v2 = v6;
    }
    else {
      uint64_t v2 = v7;
    }
    pthread_mutex_unlock(v5);
    syslog(5, "kern_DisplayWallEnumerate called \n");
  }

  return v2;
}

uint64_t kern_DisplayWallValidateConfig(uint64_t a1, const void *a2)
{
  if (!a1 || !a2) {
    return 3758097090LL;
  }
  v4 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  uint64_t v5 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 4u, a2, 0x28uLL, 0LL, 0LL);
  pthread_mutex_unlock(v4);
  syslog(5, "kern_DisplayWallValidateConfig called \n");
  return v5;
}

uint64_t kern_DisplayWallEnable(uint64_t a1, const void *a2)
{
  if (!a1 || !a2) {
    return 3758097090LL;
  }
  v4 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  uint64_t v5 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 5u, a2, 0x28uLL, 0LL, 0LL);
  pthread_mutex_unlock(v4);
  syslog(5, "kern_DisplayWallEnable called \n");
  return v5;
}

uint64_t kern_DisplayWallDisable(uint64_t a1, unsigned int a2)
{
  uint64_t input = a2;
  if (!a1) {
    return 3758097090LL;
  }
  v3 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  uint64_t v4 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 6u, &input, 1u, 0LL, 0LL);
  pthread_mutex_unlock(v3);
  syslog(5, "kern_DisplayWallDisable called \n");
  return v4;
}

uint64_t kern_DisplayWallStatus(uint64_t a1, unsigned int a2)
{
  uint64_t input = a2;
  if (!a1) {
    return 3758097090LL;
  }
  v3 = (pthread_mutex_t *)(a1 + 24);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  uint64_t v4 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 7u, &input, 1u, 0LL, 0LL);
  pthread_mutex_unlock(v3);
  syslog(5, "kern_DisplayWallStatus called \n");
  return v4;
}

uint64_t AppleDisplayManagerOpenDefault(uint64_t a1)
{
  if (!s_notification_port)
  {
    s_notification_port = (uint64_t)IONotificationPortCreate(*MEMORY[0x1896086A8]);
    if (!s_notification_port) {
      return 0LL;
    }
  }

  uint64_t v2 = 3758097084LL;
  v3 = IOServiceMatching("AppleDisplayManager");
  if (v3)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086B0], v3);
    uint64_t v5 = (FILE *)*MEMORY[0x1895F89E0];
    if (MatchingService)
    {
      int v6 = MatchingService;
      fwrite("Found ADM service\n", 0x12uLL, 1uLL, v5);
      s_adm_info_0 = v6;
      RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)s_notification_port);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1896051A8]);
      return AppleDisplayManagerOpen(s_adm_info_0, *MEMORY[0x1895FBBE0], 0, a1);
    }

    fwrite("Didn't find ADM service \n", 0x19uLL, 1uLL, v5);
    return 3758097090LL;
  }

  return v2;
}

uint64_t AppleDisplayManagerDisplayWallEnumerate(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t AppleDisplayManageDisplayWallValidateConfig(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t AppleDisplayManageDisplayWallEnable(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t AppleDisplayManageDisplayWallDisable(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t AppleDisplayManageDisplayWallStatus(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t appleDisplayManagerFinalize(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 20) = 0;
  }

  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
}

CFStringRef appleDisplayManagerCopyFormatDescription(const void *a1, const __CFDictionary *a2)
{
  CFIndex v4 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0LL, a2, @"<AppleDisplayManager %p refcnt=%d>", a1, v4);
}

uint64_t appleDisplayManagerCopyDebugDescription()
{
  return 0LL;
}

uint64_t IOMobileFramebufferGetFrameworkInfo(void *a1)
{
  uint64_t result = 3758097090LL;
  if (a1)
  {
    *a1 = 0LL;
    return 3758097136LL;
  }

  return result;
}

uint64_t IOMobileFramebufferGetLayerDefaultSurface(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferCopyLayerDisplayedSurface(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetDisplaySize(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetCanvasSizes(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 3758097090LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        *(_DWORD *)(a1 + 1432) = 0;
        unsigned int v7 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2008);
        if (v7)
        {
          uint64_t result = v7(a1, a1 + 1400);
          if (!(_DWORD)result)
          {
            int v8 = *(_DWORD *)(a1 + 1432);
            int v9 = v8 + 1;
            *(_DWORD *)(a1 + 1432) = v8 + 1;
            unsigned int v10 = *(_DWORD *)(a1 + 1436);
            if (v10 && (unsigned int v11 = *(_DWORD *)(a1 + 1440)) != 0)
            {
              double v12 = (double)v11;
              *(double *)(a1 + 1416) = (double)v10;
            }

            else
            {
              *(void *)(a1 + 1416) = 0x4093680000000000LL;
              double v12 = 2208.0;
            }

            *(double *)(a1 + 1424) = v12;
            int v9 = v8 + 2;
            *(_DWORD *)(a1 + 1432) = v8 + 2;
LABEL_13:
            uint64_t result = 0LL;
            *a2 = a1 + 1400;
            *a3 = v9;
          }
        }
      }
    }
  }

  return result;
}

uint64_t IOMobileFramebufferSetCanvasSize(_DWORD *a1, double a2, double a3)
{
  input[2] = *MEMORY[0x1895F89C0];
  unsigned int v14 = a3;
  unsigned int valuePtr = a2;
  CFIndex v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v6 = CFNumberCreate(v4, kCFNumberSInt32Type, &v14);
  CFNumberRef v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    unsigned int v12 = v14;
    input[0] = valuePtr;
    input[1] = v14;
    a1[359] = valuePtr;
    a1[360] = v12;
    CFPreferencesSetAppValue(@"canvas_width", v5, @"com.apple.iokit.IOMobileGraphicsFamily");
    CFPreferencesSetAppValue(@"canvas_height", v7, @"com.apple.iokit.IOMobileGraphicsFamily");
    CFPreferencesAppSynchronize(@"com.apple.iokit.IOMobileGraphicsFamily");
    mach_port_t v13 = a1[5];
    if (v13) {
      uint64_t v9 = IOConnectCallScalarMethod(v13, 0x35u, input, 2u, 0LL, 0LL);
    }
    else {
      uint64_t v9 = 0LL;
    }
LABEL_13:
    CFRelease(v5);
    uint64_t v10 = v9;
    if (!v7) {
      return v10;
    }
    goto LABEL_8;
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  if (v5) {
    goto LABEL_13;
  }
  if (v6) {
LABEL_8:
  }
    CFRelease(v7);
  return v10;
}

uint64_t IOMobileFramebufferGetID(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferCopyProperty(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferSwapSetLayer(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetEventWait(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetEventSignalOnGlass(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetEventSignal(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetBlit(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 2064))();
}

uint64_t IOMobileFramebufferSwapDebugInfo(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapActiveRegion( uint64_t a1, unsigned int a2, double a3, double a4, double a5, double a6)
{
  uint64_t result = 3758097090LL;
  if (a1 && a2 <= 3)
  {
    uint64_t v8 = a1 + 4LL * a2;
    int v9 = *(_DWORD *)(v8 + 416);
    if (v9 == 4) {
      return 3758097128LL;
    }
    uint64_t v10 = (_DWORD *)(v8 + 416);
    _DWORD *v10 = v9 + 1;
    unsigned int v11 = (_DWORD *)(a1 + ((unint64_t)a2 << 6) + 16LL * v9);
    float v12 = a3;
    signed int v13 = vcvtas_u32_f32(v12);
    float v14 = a4;
    signed int v15 = vcvtas_u32_f32(v14);
    v11[108] = v13;
    v11[109] = v15;
    float v16 = a5;
    unsigned int v17 = vcvtas_u32_f32(v16);
    v11[110] = v17;
    float v18 = a6;
    unsigned int v19 = vcvtas_u32_f32(v18);
    v11[111] = v19;
    if (v17) {
      BOOL v20 = v19 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (!v20)
    {
      if (v9 < 1) {
        return 0LL;
      }
      unsigned int v21 = v13 + v17;
      unsigned int v22 = v15 + v19;
      for (i = (_DWORD *)(a1 + ((unint64_t)a2 << 6) + 444); ; i += 4)
      {
        int v24 = *(i - 3);
        if (*(i - 1) + v24 > v13)
        {
          int v25 = *(i - 2);
          if (*i + v25 > v15)
          {
            BOOL v27 = __OFSUB__(v24, v21);
            BOOL v26 = (int)(v24 - v21) < 0;
          }

          else
          {
            BOOL v27 = 0;
            BOOL v26 = 0;
          }

          if (v26 != v27)
          {
            BOOL v29 = __OFSUB__(v25, v22);
            BOOL v28 = (int)(v25 - v22) < 0;
          }

          else
          {
            BOOL v29 = 0;
            BOOL v28 = 0;
          }

          if (v28 != v29) {
            break;
          }
        }

        if (!--v9) {
          return 0LL;
        }
      }
    }

    --*v10;
  }

  return result;
}

uint64_t IOMobileFramebufferSwapDirtyRegion(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t result = 3758097090LL;
  if (a1)
  {
    *(_DWORD *)(a1 + 688) = (int)a2;
    *(_DWORD *)(a1 + 692) = (int)a3;
    unsigned int v7 = vcvtpd_s64_f64(a4 + a2 - (double)(int)a2);
    *(_DWORD *)(a1 + 696) = v7;
    unsigned int v8 = vcvtpd_s64_f64(a5 + a3 - (double)(int)a3);
    *(_DWORD *)(a1 + 700) = v8;
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      uint64_t result = 0LL;
      *(_BYTE *)(a1 + 740) = 1;
    }
  }

  return result;
}

uint64_t IOMobileFramebufferSwapSubtitleRegion(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetTimestamp(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferAnnounceNextSwapTimestamp(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetParams(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a1 && a4 <= 4) {
    return (*(uint64_t (**)(void))(a1 + 2112))();
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetTimestamps(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapWorkaroundSettings(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetBrightness(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSwapSetIndicatorBrightness(uint64_t a1)
{
  if (a1 && *(void *)(a1 + 2120)) {
    return (*(uint64_t (**)(void))(a1 + 2128))();
  }
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSwapSetSecureAnimation(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSwapSetIndicatorBrightnessLimit(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSwapSetBrightnessLimit(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSwapSetDisplayEdr(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSwapSetDisplayEdrHeadroom(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSwapSetAmbientLux(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFrameBufferSwapSetContrastEnhancerStrength(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFrameBufferSwapSetUserLuminanceAdjustment(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSwapBegin(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapEnd(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetColorMatrix(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSignal(uint64_t a1)
{
  uint64_t result = 3758097090LL;
  if (a1)
  {
    if (*(void *)(a1 + 2232)) {
      return 3758097095LL;
    }
    else {
      return 3758097090LL;
    }
  }

  return result;
}

uint64_t IOMobileFramebufferSwapWait(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapWaitWithTimeout(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapCancel(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapCancelAll(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferWaitSurface(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 176)) {
    return 0LL;
  }
  v1 = *(uint64_t (**)(void))(a1 + 2240);
  if (v1) {
    return v1();
  }
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSurfaceIsReplaceable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 3758097090LL;
  if (a1 && a2 && a4)
  {
    CFNumberRef v6 = *(uint64_t (**)(uint64_t))(a1 + 2272);
    if (v6) {
      return v6(a1);
    }
    else {
      return 3758097095LL;
    }
  }

  return result;
}

uint64_t IOMobileFramebufferSetIdleBuffer(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetIdleBufferEvent(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetVSyncRunLoopSource(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferEnableVSyncNotifications(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferDisableVSyncNotifications(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetTVOutMode(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetTVOutSignalType(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetWSSInfo(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferRequestPowerChange(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetWhiteOnBlackMode(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetColorRemapMode(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetColorRemapMode(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetColorRemapMode(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetBrightnessCorrection(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferEnableStatistics(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetDebugFlags(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetFlags(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetGammaTable(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetGammaTable(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetMatrix(uint64_t a1, unsigned int a2, void *inputStruct)
{
  uint64_t input = a2;
  uint64_t result = 3758097090LL;
  if (a1)
  {
    if (inputStruct) {
      return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x37u, &input, 1u, inputStruct, 0x48uLL, 0LL, 0LL, 0LL, 0LL);
    }
  }

  return result;
}

uint64_t IOMobileFramebufferGetMatrix(uint64_t a1, unsigned int a2, void *outputStruct)
{
  uint64_t v3 = 3758097090LL;
  size_t v8 = 72LL;
  uint64_t input = a2;
  if (a1 && outputStruct)
  {
    unsigned int v4 = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x36u, &input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v8);
    if (v8 != 72 && v4 == 0) {
      return 3758097097LL;
    }
    else {
      return v4;
    }
  }

  return v3;
}

uint64_t IOMobileFramebufferSetDisplayDevice(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetDigitalOutMode(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetDigitalOutMode(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 3758097095LL;
  memset(v9, 0, 44);
  if (a1)
  {
    CFNumberRef v5 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, void, void))(a1 + 2656);
    if (v5)
    {
      uint64_t result = v5(a1, 64LL, v9, 44LL, 0LL, 0LL);
      if (!(_DWORD)result)
      {
        int v8 = DWORD2(v9[0]);
        *a2 = DWORD1(v9[0]);
        *a3 = v8;
      }
    }
  }

  return result;
}

uint64_t IOMobileFramebufferGetDigitalOutState(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetClamshellState(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetSupportedDigitalOutModes(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

double IOMobileFramebufferGetBandwidth(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  __int128 v5 = 0u;
  __int128 v6 = 0u;
  if (a1)
  {
    uint64_t v3 = *(unsigned int (**)(uint64_t, uint64_t, __int128 *, uint64_t, void, void))(a1 + 2656);
    if (v3)
    {
      if (!v3(a1, 115LL, &v5, 32LL, 0LL, 0LL))
      {
        *(_OWORD *)a2 = v5;
        *(void *)(a2 + 16) = v6;
        double result = *((double *)&v6 + 1);
        *(void *)(a2 + 24) = *((void *)&v6 + 1);
      }
    }
  }

  return result;
}

uint64_t IOMobileFramebufferGetHotPlugRunLoopSource(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferEnablePowerNotifications(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferDisablePowerNotifications(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferEnableHotPlugDetectNotifications(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferDisableHotPlugDetectNotifications(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetHDCPDownstreamState(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetHDCPRunLoopSource(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferGetHDCPAuthenticationProtocol(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferHDCPSendRequest(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferHDCPGetReply(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetProtectionOptions(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFrameBufferprintDisplayRegs(uint64_t result)
{
  if (result)
  {
    v1 = *(uint64_t (**)(void))(result + 2504);
    if (v1) {
      return v1();
    }
  }

  return result;
}

uint64_t IOMobileFramebufferGetDotPitch(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetDotPitchFloat(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetDisplayArea(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferEnableDisableDithering(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetUnderrunColor(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetCRCRunLoopSource(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferGetCRCNotifyMessageCount(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferEnableCRCNotifications(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferDisableCRCNotifications(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetRunLoopSource(uint64_t a1, unsigned int a2)
{
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferEnableDisableVideoPowerSavings(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetVideoDACGain(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSetLine21Data(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFrameBufferGetDebugTraces(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFrameBufferEnableDebugTracing(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFrameBufferEnableVBLTraces(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFrameBufferPrintDebugTraces(uint64_t result)
{
  if (result)
  {
    v1 = *(uint64_t (**)(void))(result + 2616);
    if (v1) {
      return v1();
    }
  }

  return result;
}

uint64_t IOMobileFrameBufferSetLogLevel(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSPLCSetBrightness(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSPLCGetBrightness(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferSwapSetToneMapConfig( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 3758097095LL;
  if (a1)
  {
    BOOL v9 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, int *, uint64_t, uint64_t, uint64_t))(a1 + 2648);
    if (v9)
    {
      __int128 v10 = *(_OWORD *)(a2 + 48);
      v13[2] = *(_OWORD *)(a2 + 32);
      v13[3] = v10;
      uint64_t v14 = *(void *)(a2 + 64);
      __int128 v11 = *(_OWORD *)(a2 + 16);
      v13[0] = *(_OWORD *)a2;
      v13[1] = v11;
      int v15 = a3;
      return v9(a1, 107LL, v13, 72LL, &v15, 1LL, a7, a8);
    }
  }

  return v8;
}

uint64_t IOMobileFramebufferSetBlock(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferGetBlock(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferGetBufBlock(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSwapSetICCMatrix(uint64_t a1, int a2, int a3, __int128 *a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097095LL;
  int v8 = 1;
  if (a1)
  {
    __int128 v5 = *(uint64_t (**)(void))(a1 + 2648);
    if (v5)
    {
      __int128 v6 = a4[1];
      __int128 v9 = *a4;
      __int128 v10 = v6;
      *(_OWORD *)__int128 v11 = a4[2];
      *(_OWORD *)&v11[12] = *(__int128 *)((char *)a4 + 44);
      int v12 = *(_DWORD *)(a1 + 176);
      int v13 = a2;
      int v14 = a3;
      return v5();
    }
  }

  return v4;
}

uint64_t IOMobileFramebufferSwapSetICCCurve(uint64_t a1, int a2, int a3, int a4, int *a5)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 3758097095LL;
  bzero(v14, 0x258uLL);
  v14[0] = 1;
  if (a1)
  {
    __int128 v11 = *(uint64_t (**)(uint64_t, uint64_t, _DWORD *, uint64_t, _DWORD *, uint64_t))(a1 + 2648);
    if (v11)
    {
      int v12 = *a5;
      v14[2] = *a5;
      if (a2 == 17 && !*(_DWORD *)(a1 + 1944))
      {
        return 3758097126LL;
      }

      else
      {
        switch(v12)
        {
          case 8:
            int v16 = a5[3];
            int v17 = a5[2];
            uint64_t v18 = *((void *)a5 + 2);
            int v19 = 4 * v17;
            goto LABEL_7;
          case 9:
            int v16 = a5[6];
            int v17 = a5[2];
            uint64_t v18 = *((void *)a5 + 4);
            int v19 = 4 * v17;
            break;
          case 12:
            memcpy(v20, a5 + 2, sizeof(v20));
            break;
          case 17:
            __int128 v21 = *(_OWORD *)(a5 + 2);
            break;
          default:
LABEL_7:
            *(_OWORD *)uint64_t v15 = *(_OWORD *)(a5 + 2);
            *(_OWORD *)&v15[12] = *(_OWORD *)(a5 + 5);
            break;
        }

        v22[0] = *(_DWORD *)(a1 + 176);
        v22[1] = a2;
        v22[2] = a4;
        v22[3] = a3;
        return v11(a1, 51LL, v14, 600LL, v22, 4LL);
      }
    }
  }

  return v10;
}

uint64_t IOMobileFramebufferSetPreset(uint64_t a1)
{
  else {
    return 3758097095LL;
  }
}

uint64_t IOMobileFramebufferSetParameter(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferCreateStatistics(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferFactoryPortal(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetCurrentAbsoluteTime(uint64_t a1)
{
  else {
    return 3758097090LL;
  }
}

uint64_t IOMobileFramebufferGetLinkQuality(uint64_t a1)
{
  else {
    return 0x80000000LL;
  }
}

uint64_t IOMobileFramebufferSetDroppable(uint64_t a1, char a2)
{
  if (!a1) {
    return 3758097090LL;
  }
  uint64_t result = 0LL;
  *(_BYTE *)(a1 + 869) = a2;
  return result;
}

uint64_t IOMobileFramebufferGetBrightnessControlInfo(uint64_t a1, uint64_t a2)
{
  uint64_t result = 3758097090LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 3273))
    {
      uint64_t result = 0LL;
      __int128 v4 = *(_OWORD *)(a1 + 3280);
      *(void *)(a2 + 16) = *(void *)(a1 + 3296);
      *(_OWORD *)a2 = v4;
    }

    else
    {
      return 3758097088LL;
    }
  }

  return result;
}

uint64_t IOMobileFramebufferSetBrightnessControlCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 3758097095LL;
  uint64_t v9 = 0LL;
  if (a1[265])
  {
    if (a1[266])
    {
      pthread_once(&s_bc_once, iomfb_bc_load_lib);
      if (s_bc_9 == 1)
      {
        a1[413] = a2;
        a1[414] = a3;
        if (a2)
        {
          unsigned int v7 = (const void *)a1[415];
          if (v7) {
            CFRelease(v7);
          }
          uint64_t v3 = 0LL;
          a1[415] = s_bc_0(iomfb_bc_up, a1, &v9);
        }

        else
        {
          iomfb_bc_invalid((uint64_t)a1);
          return 0LL;
        }
      }
    }
  }

  return v3;
}

void iomfb_bc_load_lib()
{
  v0 = dlopen("/System/Library/PrivateFrameworks/BrightnessControl.framework/BrightnessControl", 2);
  s_bc_lib = (uint64_t)v0;
  if (v0)
  {
    s_bc_0 = dlsym(v0, "BCBrtControlNewMonitorForAllDisplaysWithHandler");
    s_bc_1 = dlsym((void *)s_bc_lib, "BCBrtControlGetContainerID");
    s_bc_2 = dlsym((void *)s_bc_lib, "BCBrtControlGetMinNits");
    s_bc_3 = dlsym((void *)s_bc_lib, "BCBrtControlGetMaxNits");
    s_bc_4 = dlsym((void *)s_bc_lib, "BCBrtControlGetCapabilities");
    s_bc_5 = dlsym((void *)s_bc_lib, "BCBrtControlGetIsValid");
    s_bc_6 = dlsym((void *)s_bc_lib, "BCBrtControlSetDisplayInvalidHandler");
    s_bc_7 = dlsym((void *)s_bc_lib, "BCBrtControlSetNits");
    v1 = dlsym((void *)s_bc_lib, "BCBrtControlSetDisplayService");
    s_bc_8 = v1;
    if (s_bc_0 && s_bc_1 && s_bc_2 && s_bc_3 && s_bc_4 && s_bc_5 && s_bc_6 && s_bc_7) {
      s_bc_9 = 1;
    }
    if (!v1) {
  }
    }

  else
  {
    syslog(3, "IOMFB: %s not found\n");
  }
}

void iomfb_bc_up(uint64_t a1, const void *a2)
{
  if (!a2) {
    return;
  }
  if (*(_DWORD *)(a1 + 1944) == 2) {
    return;
  }
  __int128 v4 = (const __CFDictionary *)s_bc_4(a2);
  if (!v4) {
    return;
  }
  __int128 v5 = v4;
  Value = (const __CFNumber *)CFDictionaryGetValue(v4, @"BuiltIn");
  if (!Value) {
    goto LABEL_13;
  }
  unsigned int v7 = Value;
  CFTypeID v8 = CFGetTypeID(Value);
  if (v8 == CFNumberGetTypeID())
  {
    int valuePtr = 0;
    CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
    BOOL v9 = valuePtr == 0;
    goto LABEL_10;
  }

  CFTypeID v10 = CFGetTypeID(v7);
  if (v10 != CFBooleanGetTypeID())
  {
LABEL_13:
    char v11 = 0;
    goto LABEL_14;
  }

  BOOL v9 = v7 == (const __CFNumber *)*MEMORY[0x189604DE0];
LABEL_10:
  char v11 = !v9;
LABEL_14:
  int v12 = *(_DWORD *)(a1 + 1944);
  if (!v12)
  {
    if ((v11 & 1) != 0)
    {
      int v14 = 0LL;
      uint64_t v15 = 0LL;
      syslog(6, "matched IOMFB (%p) to BC (%p) for embedded panel");
      goto LABEL_33;
    }

LABEL_21:
    int v16 = *(uint64_t (**)(uint64_t, const __CFString *))(a1 + 2024);
    if (v16) {
      uint64_t v15 = (const __CFString *)v16(a1, @"DisplayContainerID");
    }
    else {
      uint64_t v15 = 0LL;
    }
    int v17 = (const __CFUUID *)s_bc_1(a2);
    if (!v17)
    {
      int v14 = 0LL;
      goto LABEL_42;
    }

    uint64_t v18 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x189604DB0], v17);
    int v14 = v18;
    if (!v15 || !v18)
    {
LABEL_42:
      if (!v15) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }

    if (CFStringCompare(v15, v18, 0LL) == kCFCompareEqualTo
      || (int v19 = (const __CFString *)CFDictionaryGetValue(v5, @"kUSBContainerID")) != 0LL
      && CFStringCompare(v15, v19, 1uLL) == kCFCompareEqualTo)
    {
      if (!isServicingTwoExternalDisplay(*(_DWORD *)(a1 + 16)) || *(_DWORD *)(a1 + 1944))
      {
        syslog(6, "matched IOMFB (%p) to BC (%p) for external display");
        goto LABEL_33;
      }

      CStringPtr = CFStringGetCStringPtr(v15, 0x600u);
      syslog( 6,  "Warning: tried to match BC (%p) to IOMFB (%p) disp type (%d) with container ID (%s) - skip",  a2,  (const void *)a1,  0,  CStringPtr);
    }

LABEL_43:
    CFRelease(v15);
LABEL_44:
    if (v14) {
      CFRelease(v14);
    }
    return;
  }

  if (v12 != 3) {
    goto LABEL_21;
  }
  int v13 = (const __CFBoolean *)CFDictionaryGetValue(v5, @"DFR");
  if (v13 && CFBooleanGetValue(v13))
  {
    int v14 = 0LL;
    uint64_t v15 = 0LL;
    syslog(6, "matched IOMFB (%p) to BC (%p) for DFR");
LABEL_33:
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
    BOOL v20 = *(const void **)(a1 + 3328);
    if (v20)
    {
      if (s_bc_8)
      {
        ((void (*)(void))s_bc_8)();
        BOOL v20 = *(const void **)(a1 + 3328);
      }

      CFRelease(v20);
    }

    *(_BYTE *)(a1 + 3273) = 1;
    *(void *)(a1 + 3328) = a2;
    CFRetain(a2);
    *(_DWORD *)(a1 + 3280) = 1;
    *(double *)(a1 + 3288) = s_bc_3(a2);
    *(double *)(a1 + 3296) = s_bc_2(a2);
    s_bc_6(a2, iomfb_bc_invalid, a1);
    if (s_bc_8) {
      ((void (*)(const void *, void))s_bc_8)(a2, *(unsigned int *)(a1 + 16));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 1872));
    __int128 v21 = *(void (**)(uint64_t, uint64_t, void))(a1 + 3304);
    if (v21) {
      v21(a1, 1LL, *(void *)(a1 + 3312));
    }
    goto LABEL_42;
  }

    BOOL v26 = v52;
    if (!v52) {
      return IsMainDisplay;
    }
    goto LABEL_68;
  }

  if (a2 != 16908290)
  {
LABEL_33:
    if (!a3 && !a4) {
      return 3758097090LL;
    }
    if (a2 > 16842751)
    {
      if (a2 <= 16908287)
      {
        IsMainDisplay = 3758097090LL;
        switch(a2)
        {
          case 16842752:
          case 16842753:
          case 16842754:
          case 16842756:
            return UserCalibration_SetCalibrationData(a1, a3, a4, 1);
          case 16842755:
            IsMainDisplay = UserCalibration_SetCalibrationData(a1, a3, a4, 1);
            if ((_DWORD)IsMainDisplay) {
              return IsMainDisplay;
            }
            IsMainDisplay = UserCalibration_WriteEAN(a3, a4);
            if ((_DWORD)IsMainDisplay) {
              return IsMainDisplay;
            }
            v34 = 2LL;
            goto LABEL_59;
          case 16842757:
          case 16842758:
            return IsMainDisplay;
          case 16842759:
            LODWORD(input[0]) = *a3;
            v31 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, input);
            v32 = *(_DWORD *)(a1 + 16);
            v33 = @"CMDegammaMethod";
            goto LABEL_73;
          default:
            return 3758097090LL;
        }
      }

      if (a2 == 16908288)
      {
        if (*a3) {
          v45 = (const void **)MEMORY[0x189604DE8];
        }
        else {
          v45 = (const void **)MEMORY[0x189604DE0];
        }
        v42 = *v45;
        v43 = *(_DWORD *)(a1 + 16);
        v44 = @"IOMFBTemperatureCompensationEnable";
      }

      else
      {
        if (a2 != 16908291)
        {
          IsMainDisplay = 3758097090LL;
          if (a2 != 16908289) {
            return IsMainDisplay;
          }
          IsMainDisplay = 0LL;
          v30 = *a3;
          LODWORD(input[0]) = v30;
          if (v30 == 1 || v30 > 0xA) {
            return IsMainDisplay;
          }
          v31 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, input);
          v32 = *(_DWORD *)(a1 + 16);
          v33 = @"APTFixedRR";
LABEL_73:
          v39 = IORegistryEntrySetCFProperty(v32, v33, v31);
          if (v31) {
            CFRelease(v31);
          }
          v40 = v39 == 0;
          goto LABEL_93;
        }

        if (*a3) {
          v46 = (const void **)MEMORY[0x189604DE8];
        }
        else {
          v46 = (const void **)MEMORY[0x189604DE0];
        }
        v42 = *v46;
        v43 = *(_DWORD *)(a1 + 16);
        v44 = @"NormalModeEnable";
      }

uint64_t iomfb_bc_invalid(uint64_t a1)
{
  io_connect_t v2 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  *(_BYTE *)(a1 + 3273) = 0;
  uint64_t v3 = *(const void **)(a1 + 3328);
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1 + 3328) = 0LL;
  *(void *)(a1 + 3280) = 0LL;
  *(void *)(a1 + 3296) = 0LL;
  *(void *)(a1 + 3288) = 0LL;
  uint64_t result = pthread_mutex_unlock(v2);
  __int128 v5 = *(uint64_t (**)(uint64_t, void, void))(a1 + 3304);
  if (v5) {
    return v5(a1, 0LL, *(void *)(a1 + 3312));
  }
  return result;
}

uint64_t IOMobileFramebufferGetBrightnessControlCapabilities(uint64_t a1)
{
  if (s_bc_9 == 1 && *(_BYTE *)(a1 + 3273) && (uint64_t v2 = *(void *)(a1 + 3328)) != 0) {
    return s_bc_4(v2);
  }
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferScheduleWithDispatchQueue(uint64_t a1, uint64_t a2, dispatch_queue_s *a3)
{
  uint64_t v6 = 3758097084LL;
  uint64_t v7 = a2;
  InfoKeyInitialize(a1);
  CFTypeID v8 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  uint64_t v9 = a1 + (v7 << 6);
  if (!*(void *)(v9 + 1472) && !*(void *)(v9 + 1464))
  {
    uint64_t v10 = a1 + (v7 << 6);
    if (!*(void *)(v10 + 1456) || !*(void *)(v10 + 1488))
    {
      if ((_DWORD)a2 == 3 && *(_DWORD *)(a1 + 3592) == 1)
      {
        uint64_t NotificationPort = IODataQueueAllocateNotificationPort();
        uint64_t v12 = a1 + (v7 << 6);
        *(_DWORD *)(v12 + 1480) = NotificationPort;
        if (!(_DWORD)NotificationPort)
        {
          syslog(3, "IODataQueueAllocateNotificationPort failed\n");
          uint64_t v6 = 0LL;
          goto LABEL_14;
        }

        uint64_t v13 = MEMORY[0x186E19544](*(unsigned int *)(a1 + 20), 3LL, NotificationPort, 0LL);
        if ((_DWORD)v13)
        {
          uint64_t v6 = v13;
          syslog(3, "IOConnectSetNotificationPort failed, error: %d\n", v13);
          goto LABEL_14;
        }

        uint64_t v21 = a1 + (v7 << 6);
        *(void *)(v21 + 1488) = 0LL;
        unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v22 = MEMORY[0x186E19538](*(unsigned int *)(a1 + 20), 3LL, *MEMORY[0x1895FBBE0], &v25, &v24, 1LL);
        if ((_DWORD)v22)
        {
          uint64_t v6 = v22;
          syslog(3, "IOConnectMapMemory failed, error: %d\n", v22);
          goto LABEL_14;
        }

        *(void *)(v21 + 1488) = v25;
        dispatch_source_t v23 = dispatch_source_create(MEMORY[0x1895F8B40], *(unsigned int *)(v12 + 1480), 0LL, a3);
        dispatch_set_context(v23, (void *)a1);
        dispatch_source_set_event_handler_f(v23, (dispatch_function_t)FrameInfoNotifyFuncIOShqDispatchQueue);
        dispatch_source_set_cancel_handler_f(v23, (dispatch_function_t)DispatchQueueCancelHandler);
        dispatch_resume(v23);
      }

      else
      {
        int v14 = (IONotificationPortRef *)(v10 + 1456);
        uint64_t v15 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
        *int v14 = v15;
        LODWORD(v25) = notificationLimit[v7];
        uint64_t v16 = *MEMORY[0x1895FBBE0];
        uint64_t MachPort = IONotificationPortGetMachPort(v15);
        uint64_t v18 = *(unsigned int *)(a1 + 20);
        uint64_t v19 = IONotificationPortGetMachPort(*v14);
        MEMORY[0x186E19544](v18, a2, v19, 0LL);
        IONotificationPortSetDispatchQueue(*v14, a3);
      }
    }

    uint64_t v6 = 0LL;
    *(void *)(v9 + 1472) = a3;
  }

LABEL_14:
  pthread_mutex_unlock(v8);
  return v6;
}

uint64_t InfoKeyInitialize(uint64_t result)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(result + 1840))
  {
    uint64_t v1 = result;
    if (*(void *)(result + 2688))
    {
      pthread_mutex_lock((pthread_mutex_t *)(result + 1872));
      while (!*(_BYTE *)(v1 + 1840))
      {
        *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v14 = v2;
        __int128 v15 = v2;
        *(_OWORD *)__s1 = v2;
        __int128 v13 = v2;
        int v10 = 0;
        int v11 = -1431655766;
        *(_BYTE *)(v1 + 1840) = 1;
        int v3 = (*(uint64_t (**)(uint64_t, void, int *, char *, int *))(v1 + 2688))(v1, 0LL, &v11, __s1, &v10);
        int v4 = v11;
        if (v3) {
          BOOL v5 = 1;
        }
        else {
          BOOL v5 = v11 == 0;
        }
        if (v5) {
          break;
        }
        *(_DWORD *)(v1 + 1844) = v11;
        uint64_t v6 = calloc((v4 + 1), 8uLL);
        *(void *)(v1 + 1832) = v6;
        *uint64_t v6 = strndup(__s1, 0x40uLL);
        *(_DWORD *)(v1 + 3592) = v10;
        if (*(_DWORD *)(v1 + 1844) >= 2u)
        {
          uint64_t v7 = 1LL;
          while (1)
          {
            CFTypeID v8 = (*(unsigned int (**)(uint64_t, uint64_t, int *, char *, int *))(v1 + 2688))( v1,  v7,  &v11,  __s1,  &v10)
               ? 0LL
               : strndup(__s1, 0x40uLL);
            *(void *)(*(void *)(v1 + 1832) + 8 * v7) = v8;
            if (!*(void *)(*(void *)(v1 + 1832) + 8 * v7)) {
              break;
            }
          }

          uint64_t v9 = 0LL;
          do
            free(*(void **)(*(void *)(v1 + 1832) + 8 * v9++));
          while (v7 != v9);
          free(*(void **)(v1 + 1832));
          *(_DWORD *)(v1 + 1844) = 0;
        }

LABEL_19:
        ;
      }

      return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 1872));
    }
  }

  return result;
}

void FrameInfoNotifyFuncIOShqDispatchQueue(uintptr_t a1)
{
  uint32_t dataSize = 0;
  __int128 v2 = *(IODataQueueMemory **)(a1 + 1680);
  if (v2)
  {
    int v3 = IODataQueuePeek(v2);
    if (v3)
    {
      int v4 = v3;
      unsigned int v5 = 1;
      do
      {
        memcpy((void *)(a1 + 3336), v4->data, v4->size);
        PackAndDispatchFrameInfoNotifictionData(a1, v5);
        IODataQueueDequeue(*(IODataQueueMemory **)(a1 + 1680), 0LL, &dataSize);
        int v4 = IODataQueuePeek(*(IODataQueueMemory **)(a1 + 1680));
        ++v5;
      }

      while (v4);
    }
  }

  else
  {
    syslog(3, "FrameInfoNotifyFuncIOShqDispatchQueue IO Data Queue not available");
  }

uint64_t DispatchQueueCancelHandler(uint64_t result)
{
  uint64_t v1 = result;
  __int128 v2 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  if (*(void *)(result + 1680))
  {
    uint64_t result = MEMORY[0x186E19550](*(unsigned int *)(result + 20), 3LL, *MEMORY[0x1895FBBE0]);
    *(void *)(v1 + 1680) = 0LL;
  }

  mach_port_name_t v3 = *(_DWORD *)(v1 + 1672);
  if (v3)
  {
    uint64_t result = mach_port_mod_refs(*v2, v3, 1u, -1);
    *(_DWORD *)(v1 + 1672) = 0;
  }

  return result;
}

uint64_t IOMobileFramebufferUnscheduleFromDispatchQueue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 3758097084LL;
  uint64_t v7 = a2;
  CFTypeID v8 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  uint64_t v9 = a1 + (v7 << 6);
  int v10 = *(IONotificationPort **)(v9 + 1456);
  if (v10 && *(void *)(v9 + 1472) == a3)
  {
    IONotificationPortSetDispatchQueue(v10, 0LL);
    uint64_t v11 = a1 + (v7 << 6);
    uint64_t v12 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    if (*(void *)(v11 + 1488))
    {
      MEMORY[0x186E19550](*(unsigned int *)(a1 + 20), a2, *MEMORY[0x1895FBBE0]);
      *(void *)(v11 + 1488) = 0LL;
    }

    mach_port_name_t v13 = *(_DWORD *)(v11 + 1480);
    if (v13)
    {
      mach_port_mod_refs(*v12, v13, 1u, -1);
      *(_DWORD *)(v11 + 1480) = 0;
    }

    uint64_t v6 = 0LL;
    *(void *)(v9 + 1472) = 0LL;
  }

  pthread_mutex_unlock(v8);
  return v6;
}

uint64_t IOMobileFramebufferSupportedFrameInfo(uint64_t a1)
{
  if (!*(void *)(a1 + 2688)) {
    return 0LL;
  }
  InfoKeyInitialize(a1);
  return *(void *)(a1 + 1832);
}

uint64_t IOMobileFramebufferFrameInfo( uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  if (a2 && a4)
  {
    uint64_t result = 3758097090LL;
    if (a1)
    {
      if (*(void *)(a1 + 2296))
      {
        if (*(void *)(a1 + 2680))
        {
          if (*(void *)(a1 + 2688))
          {
            InfoKeyInitialize(a1);
            *(_DWORD *)(a1 + 1848) = 0;
            uint64_t result = figure_frame_info_mask(a1, 1, &a9);
            if (!(_DWORD)result)
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2296))(a1, 3LL, a2, a3);
              if (!(_DWORD)result) {
                return (*(uint64_t (**)(uint64_t, void))(a1 + 2680))(a1, *(unsigned int *)(a1 + 1848));
              }
            }
          }
        }
      }
    }
  }

  else
  {
    uint64_t result = 3758097090LL;
    if (a1)
    {
      mach_port_name_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2304);
      if (v13) {
        return v13(a1, 3LL);
      }
    }
  }

  return result;
}

uint64_t figure_frame_info_mask(uint64_t a1, int a2, const char **a3)
{
  mach_port_name_t v13 = a3 + 1;
  unsigned int v5 = *a3;
  if (*a3)
  {
    int v6 = 0;
    uint64_t v7 = *(const char ***)(a1 + 1832);
    while (v7)
    {
      CFTypeID v8 = *v7;
      if (!*v7) {
        break;
      }
      uint64_t v9 = 0LL;
      while (strncmp(v8, v5, 0x40uLL))
      {
        CFTypeID v8 = v7[++v9];
        if (!v8) {
          return 3758097090LL;
        }
      }

      v6 |= 1 << v9;
      int v10 = v13++;
      unsigned int v5 = *v10;
      if (!*v10) {
        goto LABEL_13;
      }
    }

    return 3758097090LL;
  }

  else
  {
    int v6 = 0;
LABEL_13:
    uint64_t result = 0LL;
    if (a2) {
      int v12 = *(_DWORD *)(a1 + 1848) | v6;
    }
    else {
      int v12 = *(_DWORD *)(a1 + 1848) & ~v6;
    }
    *(_DWORD *)(a1 + 1848) = v12;
  }

  return result;
}

uint64_t IOMobileFramebufferChangeFrameInfo( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  uint64_t result = 3758097090LL;
  if (a1)
  {
    if (*(void *)(a1 + 2680))
    {
      if (*(void *)(a1 + 2688))
      {
        InfoKeyInitialize(a1);
        uint64_t result = figure_frame_info_mask(a1, a2 != 0, &a9);
        int v12 = *(uint64_t (**)(uint64_t, void))(a1 + 2680);
        if (v12)
        {
          if (!(_DWORD)result) {
            return v12(a1, *(unsigned int *)(a1 + 1848));
          }
        }
      }
    }
  }

  return result;
}

uint64_t IOMobileFramebufferGetTypeID()
{
  uint64_t result = kIOMobileFramebufferID;
  if (!kIOMobileFramebufferID)
  {
    pthread_once(&IOMobileFramebufferGetTypeID_once, (void (*)(void))ioMobileFramebufferClassInitialize);
    return kIOMobileFramebufferID;
  }

  return result;
}

uint64_t ioMobileFramebufferClassInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kIOMobileFramebufferID = result;
  return result;
}

uint64_t IOMobileFramebufferOpen(io_service_t a1, task_port_t a2, uint32_t a3, uint64_t *a4)
{
  if (a4)
  {
    uint64_t v8 = _ioMobileFramebufferAlloc();
    *a4 = v8;
    if (v8)
    {
      *(_DWORD *)(v8 + 16) = a1;
      uint64_t v9 = IOServiceOpen(a1, a2, a3, (io_connect_t *)(v8 + 20));
      uint64_t v10 = *a4;
      if ((_DWORD)v9)
      {
        CFRelease((CFTypeRef)v10);
        *a4 = 0LL;
        syslog(3, " %s:  failed IOServiceOpen. return %d \n");
      }

      else
      {
        if (!*(_DWORD *)(v10 + 1436) || !*(_DWORD *)(v10 + 1440))
        {
          int v14 = 0;
          int v15 = 0;
          getEDTProperty(v10, @"canvas-width", (UInt8 *)&v15);
          getEDTProperty(*a4, @"canvas-height", (UInt8 *)&v14);
          uint64_t v10 = *a4;
          if (v15) {
            *(_DWORD *)(v10 + 1436) = v15;
          }
          if (v14) {
            *(_DWORD *)(v10 + 1440) = v14;
          }
        }

        if (*(_DWORD *)(v10 + 3224) == -1)
        {
          CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( *(_DWORD *)(v10 + 16),  @"GainMapVersion",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
          int v12 = CFProperty;
          if (!CFProperty) {
            goto LABEL_19;
          }
          int valuePtr = -1431655766;
          if (!CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr)) {
            int valuePtr = 0;
          }
          CFRelease(v12);
          LODWORD(v12) = valuePtr;
          if (valuePtr == -1) {
            LODWORD(v12) = 0;
          }
          else {
LABEL_19:
          }
            IOMFBgainencoder_set_map_version(v12);
          uint64_t v10 = *a4;
          *(_DWORD *)(*a4 + 3224) = (_DWORD)v12;
        }

        if (*(_BYTE *)(v10 + 3272))
        {
          *(void *)(v10 + 2072) = benchmark_SwapDebugInfo;
          *(void *)(*a4 + 2032) = benchmark_SwapSetLayer;
          *(void *)(*a4 + 2040) = benchmark_SwapSetEventWait;
          *(void *)(*a4 + 2048) = benchmark_SwapSetEventSignalOnGlass;
          *(void *)(*a4 + 2056) = benchmark_SwapSetEventSignal;
          *(void *)(*a4 + 2080) = benchmark_SwapSubtitleRegion;
          *(void *)(*a4 + 2112) = benchmark_SwapSetParams;
          *(void *)(*a4 + 2120) = benchmark_SwapSetBrightness;
          *(void *)(*a4 + 2128) = benchmark_SwapSetIndicatorBrightness;
          *(void *)(*a4 + 2136) = benchmark_SwapSetSecureAnimation;
          *(void *)(*a4 + 2144) = benchmark_SwapSetIndicatorBrightnessLimit;
          *(void *)(*a4 + 2152) = benchmark_SwapSetBrightnessLimit;
          *(void *)(*a4 + 2160) = benchmark_SwapSetDisplayEdr;
          *(void *)(*a4 + 2200) = benchmark_SwapBegin;
          *(void *)(*a4 + 2208) = benchmark_SwapEnd;
          *(void *)(*a4 + 2216) = benchmark_SwapSetColorMatrix;
          *(void *)(*a4 + 2232) = benchmark_SwapSignal;
          *(void *)(*a4 + 2240) = benchmark_SwapWait;
          *(void *)(*a4 + 2248) = benchmark_SwapWaitWithTimeout;
          *(void *)(*a4 + 2256) = benchmark_SwapCancel;
          *(void *)(*a4 + 2264) = benchmark_SwapCancelAll;
          *(void *)(*a4 + 2280) = benchmark_SetIdleBuffer;
          *(void *)(*a4 + 2288) = benchmark_SetIdleBufferEvent;
          *(void *)(*a4 + 2296) = benchmark_EnableNotifications;
          *(void *)(*a4 + 2304) = benchmark_DisableNotifications;
          *(void *)(*a4 + 2680) = benchmark_ChangeFrameInfo;
          *(void *)(*a4 + 2688) = benchmark_SupportedFrameInfo;
        }

        else
        {
          *(void *)(v10 + 2072) = kern_SwapDebugInfo;
          *(void *)(*a4 + 2032) = kern_SwapSetLayer;
          *(void *)(*a4 + 2040) = kern_SwapSetEventWait;
          *(void *)(*a4 + 2048) = kern_SwapSetEventSignalOnGlass;
          *(void *)(*a4 + 2056) = kern_SwapSetEventSignal;
          *(void *)(*a4 + 2080) = kern_SwapSubtitleRegion;
          *(void *)(*a4 + 2112) = kern_SwapSetParams;
          *(void *)(*a4 + 2120) = kern_SwapSetBrightness;
          *(void *)(*a4 + 2128) = kern_SwapSetIndicatorBrightness;
          *(void *)(*a4 + 2136) = kern_SwapSetSecureAnimation;
          *(void *)(*a4 + 2144) = kern_SwapSetIndicatorBrightnessLimit;
          *(void *)(*a4 + 2152) = kern_SwapSetBrightnessLimit;
          *(void *)(*a4 + 2160) = kern_SwapSetDisplayEdr;
          *(void *)(*a4 + 2168) = kern_SwapSetDisplayEdrHeadroom;
          *(void *)(*a4 + 2176) = kern_SwapSetUserLuminanceAdjustment;
          *(void *)(*a4 + 2184) = kern_SwapSetAmbientLux;
          *(void *)(*a4 + 2192) = kern_SwapSetCEStrength;
          *(void *)(*a4 + 2200) = kern_SwapBegin;
          *(void *)(*a4 + 2208) = kern_SwapEnd;
          *(void *)(*a4 + 2216) = kern_SwapSetColorMatrix;
          *(void *)(*a4 + 2232) = kern_SwapSignal;
          *(void *)(*a4 + 2240) = kern_SwapWait;
          *(void *)(*a4 + 2248) = kern_SwapWaitWithTimeout;
          *(void *)(*a4 + 2256) = kern_SwapCancel;
          *(void *)(*a4 + 2264) = kern_SwapCancelAll;
          *(void *)(*a4 + 2280) = kern_SetIdleBuffer;
          *(void *)(*a4 + 2288) = kern_SetIdleBufferEvent;
          *(void *)(*a4 + 2296) = kern_EnableNotifications;
          *(void *)(*a4 + 2304) = kern_DisableNotifications;
          *(void *)(*a4 + 2680) = kern_ChangeFrameInfo;
          *(void *)(*a4 + 2688) = kern_SupportedFrameInfo;
          *(void *)(*a4 + 2224) = kern_SetColorRemapMode;
        }

        *(void *)(*a4 + 2064) = kern_SwapSetBlit;
        *(void *)(*a4 + 2088) = iomfb_SwapSetTimestamp;
        *(void *)(*a4 + 2096) = iomfb_AnnounceNextSwapTimestamp;
        *(void *)(*a4 + 2104) = iomfb_SwapSetTimestamps;
        *(void *)(*a4 + 1992) = kern_GetLayerDefaultSurface;
        *(void *)(*a4 + 2000) = kern_CopyLayerDisplayedSurface;
        *(void *)(*a4 + 2008) = kern_GetDisplaySize;
        *(void *)(*a4 + 2016) = kern_GetID;
        *(void *)(*a4 + 2024) = kern_CopyProperty;
        *(void *)(*a4 + 2272) = kern_SurfaceIsReplaceable;
        *(void *)(*a4 + 2552) = kern_GetRunLoopSource;
        *(void *)(*a4 + 2312) = kern_SetTVOutMode;
        *(void *)(*a4 + 2320) = kern_SetTVOutSignalType;
        *(void *)(*a4 + 2328) = kern_SetWSSInfo;
        *(void *)(*a4 + 2336) = kern_RequestPowerChange;
        *(void *)(*a4 + 2344) = kern_SetWhiteOnBlackMode;
        *(void *)(*a4 + 2352) = kern_SetColorRemapMode;
        *(void *)(*a4 + 2360) = kern_GetColorRemapMode;
        *(void *)(*a4 + 2368) = kern_SetBrightnessCorrection;
        *(void *)(*a4 + 2376) = kern_EnableStatistics;
        *(void *)(*a4 + 2384) = kern_SetDebugFlags;
        *(void *)(*a4 + 2392) = kern_SetFlags;
        *(void *)(*a4 + 2400) = kern_SetGammaTable;
        *(void *)(*a4 + 2408) = kern_SetContrast;
        *(void *)(*a4 + 2416) = kern_GetGammaTable;
        *(void *)(*a4 + 2424) = kern_SetDisplayDevice;
        *(void *)(*a4 + 2432) = kern_SetDigitalOutMode;
        *(void *)(*a4 + 2440) = kern_GetDigitalOutState;
        *(void *)(*a4 + 2456) = kern_GetSupportedDigitalOutModes;
        *(void *)(*a4 + 2472) = kern_GetHDCPDownstreamState;
        *(void *)(*a4 + 2464) = iomfb_GetHDCPAuthenticationProtocol;
        *(void *)(*a4 + 2480) = kern_HDCPSendRequest;
        *(void *)(*a4 + 2488) = kern_HDCPGetReply;
        *(void *)(*a4 + 2504) = kern_printDisplayRegs;
        *(void *)(*a4 + 2512) = kern_GetDotPitch;
        *(void *)(*a4 + 2520) = kern_GetDotPitchFloat;
        *(void *)(*a4 + 2528) = kern_GetDisplayArea;
        *(void *)(*a4 + 2536) = kern_EnableDisableDithering;
        *(void *)(*a4 + 2544) = kern_SetUnderrunColor;
        *(void *)(*a4 + 2560) = kern_GetCRCNotifyMessageCount;
        *(void *)(*a4 + 2568) = kern_EnableDisableVideoPowerSavings;
        *(void *)(*a4 + 2576) = kern_SetVideoDACGain;
        *(void *)(*a4 + 2584) = kern_SetLine21Data;
        *(void *)(*a4 + 2592) = kern_GetDebugTraces;
        *(void *)(*a4 + 2600) = kern_EnableDebugTracing;
        *(void *)(*a4 + 2608) = kern_EnableVBLTraces;
        *(void *)(*a4 + 2616) = kern_PrintDebugTraces;
        *(void *)(*a4 + 2624) = kern_SetLogLevel;
        *(void *)(*a4 + 2632) = kern_SPLCSetBrightness;
        *(void *)(*a4 + 2640) = kern_SPLCGetBrightness;
        *(void *)(*a4 + 2648) = kern_SetBlock;
        *(void *)(*a4 + 2656) = kern_GetBlock;
        *(void *)(*a4 + 2664) = kern_SetParameter;
        *(void *)(*a4 + 2672) = kern_CreateStatistics;
        *(void *)(*a4 + 2696) = kern_FactoryPortal;
        *(void *)(*a4 + 2704) = kern_GetCurrentAbsoluteTime;
        *(void *)(*a4 + 2712) = kern_SwapWARSettings;
        *(void *)(*a4 + 2720) = kern_GetLinkQuality;
        *(void *)(*a4 + 2496) = kern_GetProtectionOptions;
        *(void *)(*a4 + 2728) = kern_GetBufBlock;
        *(void *)(*a4 + 2448) = kern_SetClamshellState;
        *(void *)(*a4 + 2736) = kern_ingest_timestamp;
        *(void *)(*a4 + 2744) = kern_egest_timestamp;
        syslog(3, " %s:  success, return %d \n", "IOMobileFramebufferOpen", 0);
        return 0LL;
      }
    }

    else
    {
      uint64_t v9 = 3758097085LL;
      syslog(3, " %s:  failed _ioMobileFramebufferAlloc return %d \n");
    }
  }

  else
  {
    uint64_t v9 = 3758097090LL;
    syslog(3, " %s:  failed, bad argument return %d \n", "IOMobileFramebufferOpen", -536870206);
  }

  return v9;
}

uint64_t _ioMobileFramebufferAlloc()
{
  if (!kIOMobileFramebufferID) {
    pthread_once(&IOMobileFramebufferGetTypeID_once, (void (*)(void))ioMobileFramebufferClassInitialize);
  }
  Boolean keyExistsAndHasValidFormat = -86;
  uint64_t Instance = _CFRuntimeCreateInstance();
  *(_DWORD *)(Instance + 20) = 0;
  *(_DWORD *)(Instance + 2776) = 1;
  *(void *)(Instance + 1432) = 0LL;
  *(_DWORD *)(Instance + 1440) = 0;
  *(_OWORD *)(Instance + 1328) = 0u;
  *(_OWORD *)(Instance + 1344) = 0u;
  *(_OWORD *)(Instance + 1360) = 0u;
  *(_BYTE *)(Instance + 1376) = 0;
  *(_OWORD *)(Instance + 1384) = 0u;
  *(_OWORD *)(Instance + 1400) = 0u;
  *(_OWORD *)(Instance + 1448) = 0u;
  *(_OWORD *)(Instance + 1464) = 0u;
  *(_OWORD *)(Instance + 1480) = 0u;
  *(_OWORD *)(Instance + 1496) = 0u;
  *(_OWORD *)(Instance + 1512) = 0u;
  *(_OWORD *)(Instance + 1528) = 0u;
  *(_OWORD *)(Instance + 1544) = 0u;
  *(_OWORD *)(Instance + 1560) = 0u;
  *(_OWORD *)(Instance + 1576) = 0u;
  *(_OWORD *)(Instance + 1592) = 0u;
  *(_OWORD *)(Instance + 1608) = 0u;
  *(_OWORD *)(Instance + 1624) = 0u;
  *(_OWORD *)(Instance + 1640) = 0u;
  *(_OWORD *)(Instance + 1656) = 0u;
  *(_OWORD *)(Instance + 1672) = 0u;
  *(_OWORD *)(Instance + 1688) = 0u;
  *(_OWORD *)(Instance + 1704) = 0u;
  *(_OWORD *)(Instance + 1720) = 0u;
  *(_OWORD *)(Instance + 1736) = 0u;
  *(_OWORD *)(Instance + 1752) = 0u;
  *(_OWORD *)(Instance + 1768) = 0u;
  *(_OWORD *)(Instance + 1784) = 0u;
  *(_OWORD *)(Instance + 1800) = 0u;
  *(_OWORD *)(Instance + 1816) = 0u;
  *(_DWORD *)(Instance + 1864) = 1;
  *(_OWORD *)(Instance + 1936) = xmmword_182E76C50;
  *(void *)(Instance + 3216) = 0LL;
  *(_OWORD *)(Instance + 1952) = 0u;
  *(_DWORD *)(Instance + 1968) = 0;
  *(_OWORD *)(Instance + 1976) = 0u;
  *(_OWORD *)(Instance + 3320) = 0u;
  *(_OWORD *)(Instance + 3336) = 0u;
  *(_OWORD *)(Instance + 3352) = 0u;
  *(_DWORD *)(Instance + 3592) = 0;
  *(_DWORD *)(Instance + 3224) = -1;
  pthread_mutex_init((pthread_mutex_t *)(Instance + 1872), 0LL);
  *(_BYTE *)(Instance + 1840) = 0;
  int AppIntegerValue = CFPreferencesGetAppIntegerValue( @"canvas_width",  @"com.apple.iokit.IOMobileGraphicsFamily",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    *(_DWORD *)(Instance + 1436) = AppIntegerValue;
  }
  int v2 = CFPreferencesGetAppIntegerValue( @"canvas_height",  @"com.apple.iokit.IOMobileGraphicsFamily",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    *(_DWORD *)(Instance + 1440) = v2;
  }
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"enable_ktrace",  @"com.apple.iokit.IOMobileGraphicsFamily",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 0;
  }
  char v5 = !v4;
  *(_BYTE *)(Instance + 3264) = v5;
  unsigned int v6 = CFPreferencesGetAppIntegerValue( @"override_display_width",  @"com.apple.iokit.IOMobileGraphicsFamily",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    *(_BYTE *)(Instance + 1376) = 1;
    *(double *)(Instance + 1360) = (double)v6;
  }

  unsigned int v7 = CFPreferencesGetAppIntegerValue( @"override_display_height",  @"com.apple.iokit.IOMobileGraphicsFamily",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    *(double *)(Instance + 1368) = (double)v7;
  }
  unsigned int v8 = CFPreferencesGetAppIntegerValue( @"override_panel_width",  @"com.apple.iokit.IOMobileGraphicsFamily",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    *(double *)(Instance + 1384) = (double)v8;
  }
  unsigned int v9 = CFPreferencesGetAppIntegerValue( @"override_panel_height",  @"com.apple.iokit.IOMobileGraphicsFamily",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    *(double *)(Instance + 1392) = (double)v9;
  }
  *(_BYTE *)(Instance + 3272) = 0;
  int v10 = CFPreferencesGetAppBooleanValue( @"benchmark",  @"com.apple.iokit.IOMobileGraphicsFamily",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    *(_BYTE *)(Instance + 3272) = v10 != 0;
  }
  return Instance;
}

void getEDTProperty(uint64_t a1, const __CFString *a2, UInt8 *a3)
{
  io_registry_entry_t parent = -1431655766;
  IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent);
  char v5 = (const __CFData *)IORegistryEntrySearchCFProperty( parent,  "IOService",  a2,  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (v5)
  {
    unsigned int v6 = v5;
    if (CFDataGetLength(v5) <= 4) {
      v7.length = CFDataGetLength(v6);
    }
    else {
      v7.length = 4LL;
    }
    v7.location = 0LL;
    CFDataGetBytes(v6, v7, a3);
    CFRelease(v6);
  }

uint64_t benchmark_SwapDebugInfo()
{
  return 3758097095LL;
}

uint64_t benchmark_SwapSetLayer()
{
  return 0LL;
}

uint64_t benchmark_SwapSetEventWait()
{
  return 0LL;
}

uint64_t benchmark_SwapSetEventSignalOnGlass()
{
  return 0LL;
}

uint64_t benchmark_SwapSetEventSignal()
{
  return 0LL;
}

uint64_t benchmark_SwapSubtitleRegion()
{
  return 0LL;
}

uint64_t benchmark_SwapSetParams()
{
  return 0LL;
}

uint64_t benchmark_SwapSetBrightness()
{
  return 0LL;
}

uint64_t benchmark_SwapSetIndicatorBrightness()
{
  return 0LL;
}

uint64_t benchmark_SwapSetSecureAnimation()
{
  return 0LL;
}

uint64_t benchmark_SwapSetIndicatorBrightnessLimit()
{
  return 0LL;
}

uint64_t benchmark_SwapSetBrightnessLimit()
{
  return 0LL;
}

uint64_t benchmark_SwapSetDisplayEdr()
{
  return 0LL;
}

uint64_t benchmark_SwapBegin(uint64_t a1, int *a2)
{
  int v4 = benchmark_SwapBegin_s_swapid++;
  *(_DWORD *)(a1 + 176) = v4;
  if (a2) {
    *a2 = v4;
  }
  char v5 = *(unsigned int **)(a1 + 3216);
  if (v5)
  {
    IOMFBGainMapRelease(a1, v5);
    *(void *)(a1 + 3216) = 0LL;
  }

  return 0LL;
}

uint64_t benchmark_SwapEnd(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 176);
  uint64_t v3 = *(void *)(a1 + 1696);
  uint64_t v4 = *(void *)(a1 + 1640);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 0x40000000LL;
  v7[2] = __benchmark_SwapEnd_block_invoke;
  v7[3] = &__block_descriptor_tmp;
  v7[4] = v3;
  v7[5] = a1;
  int v8 = v2;
  v7[6] = v4;
  dispatch_async(global_queue, v7);
  return 0LL;
}

uint64_t benchmark_SwapSetColorMatrix()
{
  return 0LL;
}

uint64_t benchmark_SwapSignal()
{
  return 0LL;
}

uint64_t benchmark_SwapWait()
{
  return 0LL;
}

uint64_t benchmark_SwapWaitWithTimeout()
{
  return 0LL;
}

uint64_t benchmark_SwapCancel()
{
  return 0LL;
}

uint64_t benchmark_SwapCancelAll()
{
  return 0LL;
}

uint64_t benchmark_SetIdleBuffer()
{
  return 0LL;
}

uint64_t benchmark_SetIdleBufferEvent()
{
  return 0LL;
}

uint64_t benchmark_EnableNotifications(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1 + ((unint64_t)a2 << 6);
  *(void *)(v4 + 1504) = a3;
  *(void *)(v4 + 1448) = a4;
  return 0LL;
}

uint64_t benchmark_DisableNotifications(uint64_t a1, unsigned int a2)
{
  int v2 = (_OWORD *)(a1 + ((unint64_t)a2 << 6) + 1448);
  v2[2] = 0u;
  v2[3] = 0u;
  *int v2 = 0u;
  v2[1] = 0u;
  return 0LL;
}

uint64_t benchmark_ChangeFrameInfo()
{
  return 0LL;
}

uint64_t benchmark_SupportedFrameInfo(int a1, unsigned int a2, unsigned int *a3, char *__dst, _DWORD *a5)
{
  *a3 = 5;
  *a5 = 0;
  if (*a3 <= a2) {
    return 3758097090LL;
  }
  strncpy(__dst, benchmark_SupportedFrameInfo_names[a2], 0x40uLL);
  return 0LL;
}

uint64_t kern_SwapDebugInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 88) = a2;
  *(void *)(a1 + 96) = a3;
  return 0LL;
}

uint64_t kern_SwapSetLayer( uint64_t a1, unsigned int a2, IOSurfaceRef buffer, int a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  __int128 v75 = 0u;
  if (a2 >= 4)
  {
    syslog( 3,  "%s - layer index too large: %d\n",  "IOReturn kern_SwapSetLayer(IOMobileFramebufferRef, uint32_t, IOSurfaceRef, CGRect, CGRect, uint32_t)",  a2);
    return 3758097090LL;
  }

  uint64_t v21 = a1 + 356;
  if (buffer)
  {
    uint64_t v22 = 0LL;
    int v23 = 0;
    do
    {
      if (4LL * a2 != v22 && *(_DWORD *)(a1 + 180 + v22)) {
        ++v23;
      }
      v22 += 4LL;
    }

    while (v22 != 16);
    double v24 = a12;
    double v25 = a11;
    if (v23 > 2) {
      syslog( 3,  "%s - too many active layers: %d\n",  "IOReturn kern_SwapSetLayer(IOMobileFramebufferRef, uint32_t, IOSurfaceRef, CGRect, CGRect, uint32_t)",  v23 + 1);
    }
    *(_DWORD *)(a1 + 4LL * a2 + 180) = IOSurfaceGetID(buffer);
    double v26 = *(double *)(a1 + 1384);
    double v27 = 1.0;
    if (v26 == 0.0)
    {
      double v29 = 1.0;
    }

    else
    {
      double v28 = *(double *)(a1 + 1392);
      double v29 = 1.0;
      if (v28 != 0.0)
      {
        double v29 = v26 / *(double *)(a1 + 1360);
        double v27 = v28 / *(double *)(a1 + 1368);
        a9 = a9 * v29;
        a10 = a10 * v27;
        double v25 = v25 * v29;
        double v24 = v24 * v27;
      }
    }

    *(_DWORD *)(a1 + 356) |= 1 << a2;
    *(_DWORD *)(a1 + 360) &= ~(1 << a2);
  }

  else
  {
    double v24 = a12;
    double v25 = a11;
    *(int8x8_t *)uint64_t v21 = vorr_s8(*(int8x8_t *)v21, (int8x8_t)vdup_n_s32(1 << a2));
    double v29 = 1.0;
    double v27 = 1.0;
  }

  uint64_t v30 = (a4 & 0xF) - 2LL;
  else {
    unsigned int v31 = dword_182E76C14[v30];
  }
  *(_DWORD *)(a1 + 4LL * a2 + 372) = v31;
  if ((a4 & 0x20) != 0)
  {
    *(_BYTE *)(a1 + 846) = 1;
    if ((a4 & 0x80000000) == 0)
    {
LABEL_22:
      if ((a4 & 0x40) == 0) {
        goto LABEL_23;
      }
LABEL_39:
      *(_BYTE *)(a1 + 871) = 1;
      if ((a4 & 0x80) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }

  else if ((a4 & 0x80000000) == 0)
  {
    goto LABEL_22;
  }

  *(_BYTE *)(a1 + 848) = 1;
  if ((a4 & 0x40) != 0) {
    goto LABEL_39;
  }
LABEL_23:
  if ((a4 & 0x80) != 0) {
LABEL_24:
  }
    *(_BYTE *)(a1 + 873) = 1;
LABEL_25:
  if ((a4 & 0x100) != 0) {
    *(_BYTE *)(a1 + 875) = 1;
  }
  double v72 = a8;
  if ((a4 & 0x200) != 0) {
    *(_BYTE *)(a1 + a2 + 1316) = 1;
  }
  double v32 = 0.0;
  double v33 = 0.0;
  double v34 = 0.0;
  v35 = *(void (**)(uint64_t, __int128 *, double, double, double, double))(a1 + 2008);
  if (v35)
  {
    v35(a1, &v75, 0.0, 0.0, 0.0, 0.0);
    double v33 = *((double *)&v75 + 1);
    double v34 = *(double *)&v75;
  }

  double v80 = v29 * 0.0;
  double v81 = v27 * 0.0;
  double v82 = v29 * v34;
  double v83 = v27 * v33;
  double v76 = a9;
  double v77 = a10;
  double v78 = v25;
  double v79 = v24;
  double v36 = v24;
  double v37 = fabs(v81);
  if (fabs(v29 * 0.0) == INFINITY || v37 == INFINITY)
  {
    double v39 = 0.0;
    double v40 = 0.0;
    double v41 = 0.0;
    double v42 = a5;
  }

  else
  {
    double v42 = a5;
    if (fabs(a9) == INFINITY
      || fabs(a10) == INFINITY
      || (__CGRectStandardize(&v80),
          __CGRectStandardize(&v76),
          double v43 = fmax(v80, v76),
          double v44 = fmin(v80 + v82, v76 + v78),
          v43 > v44))
    {
      double v39 = 0.0;
      double v40 = 0.0;
      double v41 = 0.0;
    }

    else
    {
      double v49 = fmax(v81, v77);
      double v50 = fmin(v83 + v81, v79 + v77);
      double v39 = 0.0;
      double v40 = 0.0;
      double v41 = 0.0;
      if (v49 <= v50)
      {
        double v39 = v44 - v43;
        double v32 = v50 - v49;
        double v40 = v49;
        double v41 = v43;
      }
    }
  }

  if (!buffer
    || fabs(v40) == INFINITY
    || fabs(v41) == INFINITY
    || v32 == 0.0
    || v39 == 0.0
    || fabs(v42) == INFINITY
    || fabs(a6) == INFINITY
    || a7 == 0.0
    || v72 == 0.0)
  {
    uint64_t result = 0LL;
    v48 = (void *)(a1 + 16LL * a2);
    *(void *)((char *)v48 + 204) = 0LL;
    *(void *)((char *)v48 + 196) = 0LL;
    v48 = (void *)((char *)v48 + 292);
    void *v48 = 0LL;
    v48[1] = 0LL;
  }

  else
  {
    if (v31 <= 7 && ((1 << v31) & 0xCA) != 0)
    {
      double v45 = v36;
      double v46 = v32;
      double v47 = v39;
    }

    else
    {
      double v45 = v25;
      double v25 = v36;
      double v46 = v39;
      double v47 = v32;
    }

    double v51 = v42 + (v41 - a9) * (a7 / v45);
    double v52 = a6 + (v40 - a10) * (v72 / v25);
    double v53 = v42 + (v46 + v41 - a9) * (a7 / v45) - v51;
    double v54 = a6 + (v47 + v40 - a10) * (v72 / v25);
    uint64_t v55 = a1 + 16LL * a2;
    *(float *)&double v51 = v51;
    unsigned int v56 = llroundf(*(float *)&v51);
    *(float *)&double v51 = v52;
    unsigned int v57 = llroundf(*(float *)&v51);
    *(_DWORD *)(v55 + 200) = v57;
    v58 = (_DWORD *)(v55 + 200);
    *(v58 - 1) = v56;
    if (a7 / v45 <= 1.0)
    {
      float v61 = v53 + -0.001;
      float v60 = ceilf(v61);
    }

    else
    {
      float v59 = v53 + 0.001;
      float v60 = floorf(v59);
    }

    double v62 = v54 - v52;
    *(_DWORD *)(a1 + 16LL * a2 + 204) = (int)v60;
    if (v72 / v25 <= 1.0)
    {
      float v65 = v62 + -0.001;
      float v64 = ceilf(v65);
    }

    else
    {
      float v63 = v62 + 0.001;
      float v64 = floorf(v63);
    }

    int v66 = (int)v64;
    *(_DWORD *)(a1 + 16LL * a2 + 208) = (int)v64;
    unsigned int v67 = (v42 + a7);
    unsigned int v68 = (a6 + v72);
    if (v66 + v57 > v68) {
      _DWORD *v58 = v68 - v66;
    }
    uint64_t result = 0LL;
    v69 = (_DWORD *)(a1 + 24 + 16LL * a2);
    v69[67] = (int)v41;
    v69[68] = (int)v40;
    v69[69] = (int)v39;
    v69[70] = (int)v32;
    uint64_t v70 = a1 + 24 + 4LL * a2;
    *(_DWORD *)(v70 + 236) = 1;
    *(_DWORD *)(v70 + 252) = 0;
    if (a2 == 2)
    {
      uint64_t result = 0LL;
      *(void *)&__int128 v71 = 0xFC00FC00FC00FC00LL;
      *((void *)&v71 + 1) = 0xFC00FC00FC00FC00LL;
      *(_OWORD *)(v21 + 32) = v71;
    }
  }

  return result;
}

uint64_t kern_SwapSetEventWait(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a1 + 24 + 4LL * a2 + 680) = MEMORY[0x186E196C4](a3);
  *(void *)(a1 + 24 + 8LL * a2 + 80) = a4;
  return 0LL;
}

uint64_t kern_SwapSetEventSignalOnGlass(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 720) = MEMORY[0x186E196C4](a2);
  *(void *)(a1 + 136) = a3;
  return 0LL;
}

uint64_t kern_SwapSetEventSignal(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a1 + 24 + 4LL * a2 + 700) = MEMORY[0x186E196C4](a3);
  *(void *)(a1 + 24 + 8LL * a2 + 120) = a4;
  return 0LL;
}

uint64_t kern_SwapSubtitleRegion(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6 = 0LL;
  while (1)
  {
    uint64_t v7 = a1 + v6;
    if (!*(_BYTE *)(a1 + v6 + 761)) {
      break;
    }
    v6 += 21LL;
    if (v6 == 105)
    {
      syslog(3, "%s no more available region!\n", "kern_SwapSubtitleRegion");
      return 3758097090LL;
    }
  }

  uint64_t result = 0LL;
  *(_DWORD *)(v7 + 757) = a2;
  *(_BYTE *)(v7 + 761) = 1;
  *(_DWORD *)(v7 + 741) = a3;
  *(_DWORD *)(v7 + 745) = a4;
  *(_DWORD *)(v7 + 749) = a5;
  *(_DWORD *)(v7 + 753) = a6;
  return result;
}

uint64_t kern_SwapSetParams(uint64_t a1, uint64_t *a2, unint64_t a3, int a4)
{
  int v8 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  switch(a4)
  {
    case 0:
      if (a2 && a3 != 524) {
        goto LABEL_10;
      }
      uint64_t v9 = 0LL;
      *(_BYTE *)(a1 + 870) = 1;
      *(void *)(a1 + 80) = a2;
      break;
    case 1:
      uint64_t v9 = 3758097090LL;
      if (a2 && a3 <= 0xC)
      {
        uint64_t v9 = 0LL;
        *(_BYTE *)(a1 + 933) = 1;
        uint64_t v10 = *a2;
        *(_DWORD *)(a1 + 942) = *((_DWORD *)a2 + 2);
        *(void *)(a1 + 934) = v10;
      }

      break;
    case 2:
      if (!a2 || a3 == 73)
      {
        uint64_t v9 = 0LL;
        *(_BYTE *)(a1 + 946) = 1;
        *(_OWORD *)(a1 + 947) = *(_OWORD *)a2;
        __int128 v11 = *((_OWORD *)a2 + 1);
        __int128 v12 = *((_OWORD *)a2 + 2);
        __int128 v13 = *((_OWORD *)a2 + 3);
        *(_OWORD *)(a1 + 1004) = *(_OWORD *)((char *)a2 + 57);
        *(_OWORD *)(a1 + 979) = v12;
        *(_OWORD *)(a1 + 995) = v13;
        *(_OWORD *)(a1 + 963) = v11;
      }

      else
      {
LABEL_10:
        uint64_t v9 = 3758097090LL;
      }

      break;
    case 3:
      uint64_t v9 = 0LL;
      *(_BYTE *)(a1 + 1320) = 1;
      break;
    case 4:
      uint64_t v9 = 0LL;
      *(_BYTE *)(a1 + 1321) = 1;
      break;
    default:
      uint64_t v9 = 0LL;
      break;
  }

  pthread_mutex_unlock(v8);
  return v9;
}

uint64_t kern_SwapSetBrightness(uint64_t a1, double a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (*(_BYTE *)(a1 + 3273))
  {
    CFTypeRef cf = 0LL;
    s_bc_7(*(void *)(a1 + 3328), &cf, a2);
    if (cf) {
      CFRelease(cf);
    }
    *(_BYTE *)(a1 + 876) = 1;
    *(double *)(a1 + 885) = a2;
  }

  else
  {
    syslog(5, "SwapSetBrightness: Brightness control is not enabled\n");
  }

  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t kern_SwapSetIndicatorBrightness(uint64_t a1, int a2, double a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (*(_BYTE *)(a1 + 3273))
  {
    *(_BYTE *)(a1 + 878) = 1;
    *(_BYTE *)(a1 + 877) = a2;
    double v7 = 0.0;
    if (a2) {
      double v7 = a3;
    }
    *(double *)(a1 + 893) = v7;
  }

  else
  {
    syslog(5, "SwapSetIndicatorBrightness: Brightness control is not enabled\n");
  }

  pthread_mutex_unlock(v6);
  return 0LL;
}

uint64_t kern_SwapSetSecureAnimation(uint64_t a1, char a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  *(_BYTE *)(a1 + 879) = a2;
  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t kern_SwapSetIndicatorBrightnessLimit(uint64_t a1, double a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (*(_BYTE *)(a1 + 3273))
  {
    *(_BYTE *)(a1 + 880) = 1;
    *(double *)(a1 + 901) = a2;
  }

  else
  {
    syslog(5, "SwapSetIndicatorBrightnessLimit: Brightness control is not enabled\n");
  }

  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t kern_SwapSetBrightnessLimit(uint64_t a1, double a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (*(_BYTE *)(a1 + 3273))
  {
    *(_BYTE *)(a1 + 881) = 1;
    *(double *)(a1 + 909) = a2;
  }

  else
  {
    syslog(5, "SwapSetBrightnessLimit: Brightness control is not enabled\n");
  }

  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t kern_SwapSetDisplayEdr(uint64_t a1, double a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (*(_BYTE *)(a1 + 3273))
  {
    *(_BYTE *)(a1 + 882) = 1;
    *(double *)(a1 + 917) = a2;
  }

  else
  {
    syslog(5, "SwapSetDisplayEdr: Brightness control is not enabled\n");
  }

  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t kern_SwapSetDisplayEdrHeadroom(uint64_t a1, double a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (*(_BYTE *)(a1 + 3273))
  {
    *(_BYTE *)(a1 + 884) = 1;
    *(double *)(a1 + 1020) = a2;
  }

  else
  {
    syslog(5, "SwapSetDisplayEdrHeadroom: Brightness control is not enabled\n");
  }

  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t kern_SwapSetUserLuminanceAdjustment(uint64_t a1, double a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (a2 == 0.0)
  {
    uint64_t v5 = 3758097090LL;
  }

  else if (*(_BYTE *)(a1 + 3273))
  {
    uint64_t v5 = 0LL;
    *(_BYTE *)(a1 + 883) = 1;
    *(double *)(a1 + 925) = a2;
  }

  else
  {
    syslog(5, "SwapSetUserLuminanceAdjustmen: Brightness control is not enabled\n");
    uint64_t v5 = 0LL;
  }

  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t kern_SwapSetAmbientLux(uint64_t a1, float a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  *(_BYTE *)(a1 + 1048) = 1;
  *(float *)(a1 + 1052) = a2;
  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t kern_SwapSetCEStrength(uint64_t a1, double a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  *(_BYTE *)(a1 + 1056) = 1;
  float v5 = a2;
  *(float *)(a1 + 1060) = v5;
  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t kern_SwapBegin(uint64_t a1, _DWORD *a2)
{
  output[2] = *MEMORY[0x1895F89C0];
  output[0] = 0xAAAAAAAAAAAAAAAALL;
  output[1] = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 4u, 0LL, 0, output, &outputCnt)) {
    return 3758097084LL;
  }
  bzero((void *)(a1 + 24), 0x514uLL);
  float v5 = *(unsigned int **)(a1 + 3216);
  if (v5)
  {
    IOMFBGainMapRelease(a1, v5);
    *(void *)(a1 + 3216) = 0LL;
  }

  int v6 = output[0];
  *(_DWORD *)(a1 + 176) = output[0];
  if (a2) {
    *a2 = v6;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 404) = 0;
  return result;
}

uint64_t kern_SwapEnd(uint64_t a1)
{
  uint64_t v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 5u, (const void *)(a1 + 24), 0x514uLL, 0LL, 0LL);
  uint64_t v3 = *(unsigned int **)(a1 + 3216);
  if (v3)
  {
    IOMFBGainMapRelease(a1, v3);
    *(void *)(a1 + 3216) = 0LL;
  }

  unsigned int v4 = *(_DWORD *)(a1 + 1968) + 1;
  *(_DWORD *)(a1 + 1968) = v4;
  if (v4 >= 0x3E && core_analytics_send_data(a1, 0, (uint64_t)"com.apple.iomfb.underrun"))
  {
    if (core_analytics_send_data(a1, 4, (uint64_t)"com.apple.iomfb.underrunType"))
    {
      uint64_t v6 = 4LL;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2664))(a1, 17LL, 1LL, &v6);
    }

    uint64_t v6 = 0LL;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2664))(a1, 17LL, 1LL, &v6);
    *(_DWORD *)(a1 + 1968) = 0;
  }

  return v2;
}

uint64_t kern_SwapSetColorMatrix(uint64_t a1, uint64_t a2, int a3, int a4)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[4] = v4;
  v11[5] = v4;
  v11[2] = v4;
  v11[3] = v4;
  v11[0] = v4;
  v11[1] = v4;
  v10[0] = v4;
  v10[1] = v4;
  *(_BYTE *)(a1 + 847) = 1;
  LOBYTE(v10[0]) = a2 == 0;
  int v12 = a3;
  int v13 = a4;
  if (a2)
  {
    for (uint64_t i = 0LL; i != 3; ++i)
    {
      uint64_t v6 = (float *)(a2 + 4 * i);
      double v7 = (char *)v10 + 8 * i;
      *((void *)v7 + 1) = vcvts_n_s32_f32(*v6, 0x20uLL);
      *((void *)v7 + 13) = vcvts_n_s32_f32(v6[12], 0x20uLL);
    }

    for (uint64_t j = 0LL; j != 9; ++j)
      *((void *)v11 + j) = vcvts_n_s32_f32(*(float *)(a2 + 12 + 4 * j), 0x20uLL);
  }

  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x45u, v10, 0x88uLL, 0LL, 0LL);
}

uint64_t kern_SwapSignal(uint64_t a1, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x14u, input, 2u, 0LL, 0LL);
}

uint64_t kern_SwapWait(uint64_t a1, unsigned int a2, unsigned int a3)
{
  v4[3] = *MEMORY[0x1895F89C0];
  v4[0] = a2;
  v4[1] = a3;
  v4[2] = 0LL;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 6u, v4, 3u, 0LL, 0LL);
}

uint64_t kern_SwapWaitWithTimeout(uint64_t a1, unsigned int a2, unsigned int a3, double a4)
{
  input[4] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  input[2] = (unint64_t)(a4 * 1000.0);
  uint64_t input[3] = 0xAAAAAAAAAAAAAAAALL;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 6u, input, 3u, 0LL, 0LL);
}

uint64_t kern_SwapCancel(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x34u, v3, 1u, 0LL, 0LL);
}

uint64_t kern_SwapCancelAll(uint64_t a1)
{
  input[2] = *MEMORY[0x1895F89C0];
  unint64_t v2 = (*(uint64_t (**)(void))(a1 + 2736))();
  input[0] = HIDWORD(v2);
  input[1] = v2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x51u, input, 2u, 0LL, 0LL);
}

uint64_t kern_SetIdleBuffer(uint64_t a1, __IOSurface *a2)
{
  uint64_t result = setIdleBuffer(a1, a2);
  if (!(_DWORD)result)
  {
    uint64_t result = 3758097090LL;
    if (a1)
    {
      __int128 v4 = *(uint64_t (**)(uint64_t))(a1 + 2208);
      if (v4) {
        return v4(a1);
      }
    }
  }

  return result;
}

uint64_t kern_SetIdleBufferEvent(uint64_t a1, __IOSurface *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = setIdleBuffer(a1, a2);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a1 + 704) = MEMORY[0x186E196C4](a3);
    *(_DWORD *)(a1 + 724) = MEMORY[0x186E196C4](a3);
    *(void *)(a1 + 104) = a4;
    *(void *)(a1 + 144) = a5;
    uint64_t v10 = *(uint64_t (**)(uint64_t))(a1 + 2208);
    if (v10) {
      return v10(a1);
    }
    else {
      return 3758097090LL;
    }
  }

  return result;
}

uint64_t kern_EnableNotifications(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  input[4] = *MEMORY[0x1895F89C0];
  input[0] = (uint64_t)NotifyCallbackFuncs[a2];
  input[1] = a1;
  input[2] = a2;
  uint64_t input[3] = 0LL;
  uint64_t v4 = a1 + ((unint64_t)a2 << 6);
  *(void *)(v4 + 1504) = a3;
  *(void *)(v4 + 1448) = a4;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x48u, input, 4u, 0LL, 0LL);
}

uint64_t kern_DisableNotifications(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3[0] = 0u;
  v3[1] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x48u, (const uint64_t *)v3, 4u, 0LL, 0LL);
}

uint64_t kern_ChangeFrameInfo(uint64_t a1, unsigned int a2)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = 3LL;
  input[1] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x49u, input, 2u, 0LL, 0LL);
}

uint64_t kern_SupportedFrameInfo(uint64_t a1, unsigned int a2, _DWORD *a3, void *outputStruct, _DWORD *a5)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  size_t v10 = 64LL;
  uint32_t outputCnt = 2;
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = IOConnectCallMethod( *(_DWORD *)(a1 + 20),  0x4Au,  input,  1u,  0LL,  0LL,  &output,  &outputCnt,  outputStruct,  &v10);
  int v8 = v12;
  *a3 = output;
  *a5 = v8;
  return result;
}

uint64_t kern_SetColorRemapMode(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x33u, v3, 1u, 0LL, 0LL);
}

uint64_t kern_SwapSetBlit( uint64_t a1, IOSurfaceRef buffer, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  unsigned int v10 = *(_DWORD *)(a1 + 1096);
  uint64_t v11 = 3758097090LL;
  if (v10 < 6)
  {
    if (buffer)
    {
      double v15 = fabs(a4);
      BOOL v16 = fabs(a3) == INFINITY || v15 == INFINITY;
      if (!v16 && a5 != 0.0 && a6 != 0.0 && fabs(a7) != INFINITY && fabs(a8) != INFINITY && a9 != 0.0 && a10 != 0.0)
      {
        IOSurfaceID ID = IOSurfaceGetID(buffer);
        uint64_t v11 = 0LL;
        double v24 = (_DWORD *)(a1 + 36LL * v10);
        v24[275] = ID;
        v24[276] = (int)a3;
        v24[277] = (int)a4;
        v24[278] = (int)a5;
        v24[279] = (int)a6;
        v24[280] = (int)a7;
        v24[281] = (int)a8;
        v24[282] = (int)a9;
        v24[283] = (int)a10;
        ++*(_DWORD *)(a1 + 1096);
      }
    }
  }

  else
  {
    syslog( 3,  "%s - exceeded max number of blits: %d\n",  "IOReturn kern_SwapSetBlit(IOMobileFramebufferRef, IOSurfaceRef, CGRect, CGRect, uint32_t)",  6);
  }

  return v11;
}

uint64_t iomfb_SwapSetTimestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return iomfb_SwapSetTimestamps(a1, &iomfb_SwapSetTimestamp_type, &v3, 1);
}

uint64_t iomfb_AnnounceNextSwapTimestamp(uint64_t a1)
{
  uint64_t input = (*(uint64_t (**)(void))(a1 + 2736))();
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x57u, &input, 1u, 0LL, 0LL);
}

uint64_t iomfb_SwapSetTimestamps(uint64_t a1, int *a2, uint64_t *a3, int a4)
{
  uint64_t v4 = 3758097090LL;
  if (a1)
  {
    float v5 = a2;
    if (a2)
    {
      uint64_t v6 = a3;
      if (a3)
      {
        LODWORD(v7) = a4;
        if (a4)
        {
          int v14 = (pthread_mutex_t *)(a1 + 1872);
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
          uint64_t v7 = v7;
          while (2)
          {
            int v10 = *v5++;
            int v9 = v10;
            uint64_t v11 = (void *)(a1 + 24);
            switch(v10)
            {
              case 1:
                goto LABEL_13;
              case 2:
                uint64_t v11 = (void *)(a1 + 32);
                goto LABEL_13;
              case 3:
                uint64_t v11 = (void *)(a1 + 40);
                goto LABEL_13;
              case 4:
                uint64_t v11 = (void *)(a1 + 48);
                goto LABEL_13;
              case 5:
                uint64_t v11 = (void *)(a1 + 56);
                goto LABEL_13;
              case 6:
                uint64_t v11 = (void *)(a1 + 64);
                goto LABEL_13;
              case 7:
                uint64_t v11 = (void *)(a1 + 72);
LABEL_13:
                uint64_t v12 = *v6++;
                *uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2736))(a1, v12);
                if (--v7) {
                  continue;
                }
                uint64_t v4 = 0LL;
LABEL_15:
                pthread_mutex_unlock(v14);
                break;
              default:
                syslog(4, "IOMFB: unknown timestamp type: %d\n", v9);
                uint64_t v4 = 3758097090LL;
                goto LABEL_15;
            }

            break;
          }
        }
      }
    }
  }

  return v4;
}

uint64_t kern_GetLayerDefaultSurface(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  input[0] = 0xAAAAAAAAAAAAAAAALL;
  input[1] = 0xAAAAAAAAAAAAAAAALL;
  uint32_t v11 = 1;
  if (!a2)
  {
    io_connect_t connect = -1431655766;
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v6 = (pthread_mutex_t *)(a1 + 1872);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
    if (!*(void *)(a1 + 1328))
    {
      uint64_t v7 = *(void *)(a1 + 1436);
      *(void *)&__int128 v8 = v7;
      *((void *)&v8 + 1) = HIDWORD(v7);
      *(_OWORD *)uint64_t input = v8;
      uint64_t v3 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 3u, input, 2u, &output, &v11);
      if ((_DWORD)v3) {
        goto LABEL_6;
      }
      mach_port_name_t v10 = output;
      io_connect_t connect = output;
      if (!(_DWORD)output)
      {
        uint64_t v3 = IOServiceOpen(*(_DWORD *)(a1 + 16), *MEMORY[0x1895FBBE0], 3u, &connect);
        if (!(_DWORD)v3)
        {
          *(void *)(a1 + 1328) = IOSurfaceLookupFromMachPort(connect);
          IOServiceClose(connect);
        }

        goto LABEL_6;
      }

      *(void *)(a1 + 1328) = IOSurfaceLookupFromMachPort(output);
      mach_port_deallocate(*MEMORY[0x1895FBBE0], v10);
    }

    uint64_t v3 = 0LL;
LABEL_6:
    *a3 = *(void *)(a1 + 1328);
    pthread_mutex_unlock(v6);
    return v3;
  }

  return 3758097084LL;
}

uint64_t kern_CopyLayerDisplayedSurface(uint64_t a1, unsigned int a2, IOSurfaceRef *a3)
{
  uint64_t v3 = 3758097090LL;
  if (a2 <= 3 && a1 && a3)
  {
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v7 = (pthread_mutex_t *)(a1 + 1872);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
    uint32_t outputCnt = 1;
    uint64_t input = a2;
    uint64_t v3 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x53u, &input, 1u, &output, &outputCnt);
    if (!(_DWORD)v3)
    {
      mach_port_name_t v8 = output;
      IOSurfaceRef v9 = IOSurfaceLookupFromMachPort(output);
      mach_port_deallocate(*MEMORY[0x1895FBBE0], v8);
      *a3 = v9;
    }

    pthread_mutex_unlock(v7);
  }

  return v3;
}

uint64_t kern_GetDisplaySize(uint64_t a1, float64x2_t *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  float v5 = (float64x2_t *)(a1 + 1360);
  if (*(double *)(a1 + 1360) == 0.0)
  {
    output.i64[0] = 0xAAAAAAAAAAAAAAAALL;
    output.i64[1] = 0xAAAAAAAAAAAAAAAALL;
    uint32_t outputCnt = 2;
    uint64_t v6 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 8u, 0LL, 0, (uint64_t *)&output, &outputCnt);
    if (!(_DWORD)v6) {
      float64x2_t *v5 = vcvtq_f64_u64(output);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  pthread_mutex_unlock(v4);
  *a2 = *v5;
  return v6;
}

uint64_t kern_GetID(uint64_t a1, _DWORD *a2)
{
  uint32_t outputCnt = 1;
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (*(_DWORD *)(a1 + 1936))
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 7u, 0LL, 0, &output, &outputCnt);
    if (!(_DWORD)v5) {
      *(_DWORD *)(a1 + 1936) = output;
    }
  }

  pthread_mutex_unlock(v4);
  *a2 = *(_DWORD *)(a1 + 1936);
  return v5;
}

CFTypeRef kern_CopyProperty(uint64_t a1, CFStringRef key)
{
  CFTypeRef v3 = IORegistryEntrySearchCFProperty(*(_DWORD *)(a1 + 16), "IOService", key, 0LL, 0);
  if (!v3)
  {
    CFStringEncoding FastestEncoding = CFStringGetFastestEncoding(key);
    CStringPtr = CFStringGetCStringPtr(key, FastestEncoding);
    if (key != @"underrun") {
      syslog(3, " %s key : %s not found \n", "kern_CopyProperty", CStringPtr);
    }
  }

  return v3;
}

uint64_t kern_SurfaceIsReplaceable(uint64_t a1, IOSurfaceRef buffer, uint64_t a3, BOOL *a4)
{
  uint64_t output = 0LL;
  uint64_t input = IOSurfaceGetID(buffer);
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x31u, &input, 1u, &output, &outputCnt);
  *a4 = output != 0;
  return result;
}

uint64_t kern_GetRunLoopSource(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  Boolean shouldFreeInfo = -86;
  memset(&context, 0, sizeof(context));
  InfoKeyInitialize(a1);
  uint64_t v5 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  uint64_t v6 = a1 + (v4 << 6);
  if (!*(void *)(v6 + 1472) && !*(void *)(v6 + 1464))
  {
    if ((_DWORD)a2 == 3 && *(_DWORD *)(a1 + 3592) == 1)
    {
      uint64_t NotificationPort = IODataQueueAllocateNotificationPort();
      uint64_t v8 = a1 + (v4 << 6);
      *(_DWORD *)(v8 + 1480) = NotificationPort;
      if (!(_DWORD)NotificationPort)
      {
        syslog(3, "IODataQueueAllocateNotificationPort failed\n");
        goto LABEL_15;
      }

      if (MEMORY[0x186E19544](*(unsigned int *)(a1 + 20), 3LL, NotificationPort, 0LL))
      {
        syslog(3, "IOConnectSetNotificationPort failed, error: %d\n");
        goto LABEL_15;
      }

      uint64_t v16 = a1 + (v4 << 6);
      *(void *)(v16 + 1488) = 0LL;
      unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
      if (MEMORY[0x186E19538]( *(unsigned int *)(a1 + 20),  3LL,  *MEMORY[0x1895FBBE0],  &v21,  &v20,  1LL))
      {
        syslog(3, "IOConnectMapMemory failed, error: %d\n");
        goto LABEL_15;
      }

      *(void *)(v16 + 1488) = v21;
      context.info = (void *)a1;
      uint64_t v18 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      uint64_t v19 = CFMachPortCreateWithPort( (CFAllocatorRef)*MEMORY[0x189604DB0],  *(_DWORD *)(v8 + 1480),  (CFMachPortCallBack)FrameInfoNotifyFuncIOShq,  &context,  &shouldFreeInfo);
      *(void *)(v16 + 1496) = v19;
      CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(v18, v19, 0LL);
    }

    else
    {
      IOSurfaceRef v9 = IONotificationPortCreate(*MEMORY[0x1896086B0]);
      uint64_t v10 = (IONotificationPortRef *)(a1 + (v4 << 6) + 1456);
      IONotificationPortRef *v10 = v9;
      LODWORD(v21) = notificationLimit[v4];
      uint64_t v11 = *MEMORY[0x1895FBBE0];
      uint64_t MachPort = IONotificationPortGetMachPort(v9);
      uint64_t v13 = *(unsigned int *)(a1 + 20);
      uint64_t v14 = IONotificationPortGetMachPort(*v10);
      MEMORY[0x186E19544](v13, a2, v14, 0LL);
      CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(*v10);
    }

    *(void *)(v6 + 1464) = RunLoopSource;
  }

LABEL_15:
  pthread_mutex_unlock(v5);
  return *(void *)(v6 + 1464);
}

uint64_t kern_SetTVOutMode(uint64_t a1, unsigned int a2)
{
  v7[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (!*(_BYTE *)(a1 + 1376)) {
    *(_OWORD *)(a1 + 1360) = 0u;
  }
  v7[0] = a2;
  uint64_t v5 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xAu, v7, 1u, 0LL, 0LL);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t kern_SetTVOutSignalType(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x10u, v3, 1u, 0LL, 0LL);
}

uint64_t kern_SetWSSInfo(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xBu, input, 2u, 0LL, 0LL);
}

uint64_t kern_RequestPowerChange(uint64_t a1, unsigned int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  if (!a2
    && core_analytics_send_data(a1, 3, (uint64_t)"com.apple.TritiumVSHCompensation.CumulativeOnTime"))
  {
    uint64_t v4 = 3LL;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2664))(a1, 17LL, 1LL, &v4);
  }

  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xCu, input, 1u, 0LL, 0LL);
}

uint64_t kern_SetWhiteOnBlackMode(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x13u, v3, 1u, 0LL, 0LL);
}

uint64_t kern_GetColorRemapMode(uint64_t a1, int *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  uint32_t outputCnt = 1;
  if (!a2) {
    return 3758097090LL;
  }
  output[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x39u, 0LL, 0, output, &outputCnt);
  int v4 = output[0];
  if ((_DWORD)result) {
    int v4 = 6;
  }
  *a2 = v4;
  return result;
}

uint64_t kern_SetBrightnessCorrection(uint64_t a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(unsigned int *)(a1 + 1944);
  input[0] = a2;
  input[1] = v2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x32u, input, 2u, 0LL, 0LL);
}

uint64_t kern_EnableStatistics(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xDu, v3, 1u, 0LL, 0LL);
}

uint64_t kern_SetDebugFlags(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint32_t outputCnt = 1;
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  uint64_t result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xFu, input, 2u, &output, &outputCnt);
  if (a4) {
    *a4 = output;
  }
  return result;
}

uint64_t kern_SetFlags(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint32_t outputCnt = 1;
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  input[0] = a2;
  input[1] = a3;
  uint64_t result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xEu, input, 2u, &output, &outputCnt);
  if (a4) {
    *a4 = output;
  }
  return result;
}

uint64_t kern_SetGammaTable(uint64_t a1, void *inputStruct)
{
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x11u, inputStruct, 0xC0CuLL, 0LL, 0LL);
}

uint64_t kern_SetContrast(uint64_t a1, float a2)
{
  float inputStruct = a2;
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x54u, &inputStruct, 4uLL, 0LL, 0LL);
}

uint64_t kern_GetGammaTable(uint64_t a1, void *a2)
{
  uint64_t v2 = 3758097085LL;
  if (a2)
  {
    uint64_t v5 = (pthread_mutex_t *)(a1 + 1872);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
    uint64_t v6 = *(void **)(a1 + 1952);
    if (v6)
    {
LABEL_3:
      memcpy(a2, v6, 0xC0CuLL);
      uint64_t v2 = 0LL;
LABEL_16:
      pthread_mutex_unlock(v5);
      return v2;
    }

    uint64_t v7 = malloc(0xC0CuLL);
    *(void *)(a1 + 1952) = v7;
    if (v7)
    {
      size_t outputStructCnt = 3084LL;
      unsigned int v8 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x1Bu, 0LL, 0LL, v7, &outputStructCnt);
      unsigned int v9 = -536870199;
      if (outputStructCnt == 3084) {
        unsigned int v9 = 0;
      }
      if (v8) {
        uint64_t v2 = v8;
      }
      else {
        uint64_t v2 = v9;
      }
      uint64_t v6 = *(void **)(a1 + 1952);
      if (!v8 && outputStructCnt == 3084) {
        goto LABEL_3;
      }
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    free(v6);
    *(void *)(a1 + 1952) = 0LL;
    goto LABEL_16;
  }

  return 3758097090LL;
}

uint64_t kern_SetDisplayDevice(uint64_t a1, unsigned int a2)
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (a2 > 4) {
    return 3758097090LL;
  }
  uint64_t v5 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (!*(_BYTE *)(a1 + 1376)) {
    *(_OWORD *)(a1 + 1360) = 0u;
  }
  v7[0] = a2;
  uint64_t v2 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x16u, v7, 1u, 0LL, 0LL);
  pthread_mutex_unlock(v5);
  return v2;
}

uint64_t kern_SetDigitalOutMode(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v6 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (!*(_BYTE *)(a1 + 1376)) {
    *(_OWORD *)(a1 + 1360) = 0u;
  }
  input[0] = a2;
  input[1] = a3;
  uint64_t v7 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x17u, input, 2u, 0LL, 0LL);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t kern_GetDigitalOutState(uint64_t a1, _DWORD *a2)
{
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x19u, 0LL, 0, &output, &outputCnt);
  if (!(_DWORD)result) {
    *a2 = output;
  }
  return result;
}

uint64_t kern_GetSupportedDigitalOutModes(uint64_t a1, void *a2, void *a3)
{
  *a2 = 0LL;
  *a3 = 0LL;
  uint64_t v6 = *(const void **)(a1 + 1960);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 1960) = 0LL;
  }

  uint64_t v7 = 3758097084LL;
  io_registry_entry_t v8 = *(_DWORD *)(a1 + 16);
  if (!v8) {
    return 3758097090LL;
  }
  unsigned int v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  2LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  *(void *)(a1 + 1960) = Mutable;
  if (Mutable)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, @"ColorElements", v9, 0);
    if (CFProperty)
    {
      uint64_t v12 = CFProperty;
      CFTypeID v13 = CFGetTypeID(CFProperty);
      TypeIOSurfaceID ID = CFArrayGetTypeID();
      uint64_t v15 = *(void **)(a1 + 1960);
      if (v13 != TypeID)
      {
        CFRelease(v15);
        *(void *)(a1 + 1960) = 0LL;
        unint64_t v21 = v12;
        goto LABEL_14;
      }

      CFDictionarySetValue((CFMutableDictionaryRef)v15, @"ColorElements", v12);
      *a2 = v12;
      CFRelease(v12);
      CFTypeRef v16 = IORegistryEntryCreateCFProperty(v8, @"TimingElements", v9, 0);
      if (v16)
      {
        int v17 = v16;
        CFTypeID v18 = CFGetTypeID(v16);
        CFTypeID v19 = CFArrayGetTypeID();
        unint64_t v20 = *(__CFDictionary **)(a1 + 1960);
        if (v18 == v19)
        {
          CFDictionarySetValue(v20, @"TimingElements", v17);
          *a3 = v17;
          CFRelease(v17);
          return 0LL;
        }

        CFRelease(v20);
        *(void *)(a1 + 1960) = 0LL;
        unint64_t v21 = v17;
LABEL_14:
        CFRelease(v21);
        return v7;
      }
    }

    CFRelease(*(CFTypeRef *)(a1 + 1960));
    *(void *)(a1 + 1960) = 0LL;
  }

  return v7;
}

uint64_t kern_GetHDCPDownstreamState(uint64_t a1, void *outputStruct)
{
  if (!outputStruct) {
    return 3758097090LL;
  }
  size_t outputStructCnt = 16LL;
  if (IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x18u, 0LL, 0LL, outputStruct, &outputStructCnt))
  {
    int v4 = *(void *)(a1 + 1960) != 0LL;
    *outputStruct = 0x1000150434448LL;
    outputStruct[1] = (v4 << 27);
  }

  return 0LL;
}

uint64_t iomfb_GetHDCPAuthenticationProtocol(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1864);
}

uint64_t kern_HDCPSendRequest(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  input[4] = *MEMORY[0x1895F89C0];
  uint64_t v5 = 3758097090LL;
  if (a1 && a2 && a4)
  {
    if (*(_DWORD *)(a1 + 1864) == 1)
    {
      a4();
      return 0LL;
    }

    else
    {
      input[0] = a2;
      input[1] = a3;
      uint64_t input[2] = (uint64_t)IOMobileFramebufferHdcpNotifyFunc;
      uint64_t input[3] = a1;
      *(void *)(a1 + 1632) = a4;
      *(void *)(a1 + 1576) = a5;
      return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x2Fu, input, 4u, 0LL, 0LL);
    }
  }

  return v5;
}

uint64_t kern_HDCPGetReply(uint64_t a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t HDCPDownstreamState = 3758097090LL;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a1 + 1864) == 1)
    {
      input[0] = 0xAAAAAAAAAAAAAAAALL;
      input[1] = 0xAAAAAAAAAAAAAAAALL;
      if (*a3 < 0x10)
      {
        syslog(4, "IOMFB: hdcp reply too small for upstread header\n");
      }

      else
      {
        *a3 = 16LL;
        uint64_t HDCPDownstreamState = kern_GetHDCPDownstreamState(a1, input);
        if (!(_DWORD)HDCPDownstreamState) {
          *a2 = *(_OWORD *)input;
        }
      }
    }

    else
    {
      uint64_t output = 0xAAAAAAAAAAAAAAAALL;
      input[0] = (uint64_t)a2;
      *(void *)(a1 + 1632) = 0LL;
      *(void *)(a1 + 1576) = 0LL;
      input[1] = *a3;
      uint32_t outputCnt = 1;
      uint64_t HDCPDownstreamState = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x30u, input, 2u, &output, &outputCnt);
      if (!(_DWORD)HDCPDownstreamState) {
        *a3 = output;
      }
    }
  }

  return HDCPDownstreamState;
}

uint64_t kern_printDisplayRegs(uint64_t a1)
{
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x1Au, 0LL, 0, 0LL, 0LL);
}

uint64_t kern_GetDotPitch(uint64_t a1, _DWORD *a2)
{
  uint32_t outputCnt = 1;
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x1Cu, 0LL, 0, &output, &outputCnt);
  if (!(_DWORD)result) {
    *a2 = output;
  }
  return result;
}

uint64_t kern_GetDotPitchFloat(uint64_t a1, float *a2)
{
  uint32_t outputCnt = 1;
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x5Au, 0LL, 0, &output, &outputCnt);
  if (!(_DWORD)result) {
    *a2 = (float)output;
  }
  return result;
}

uint64_t kern_GetDisplayArea(uint64_t a1, void *outputStruct)
{
  if (!outputStruct) {
    return 3758097090LL;
  }
  size_t outputStructCnt = 8LL;
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x1Du, 0LL, 0LL, outputStruct, &outputStructCnt);
}

uint64_t kern_EnableDisableDithering(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x1Eu, v3, 1u, 0LL, 0LL);
}

uint64_t kern_SetUnderrunColor(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x1Fu, v3, 1u, 0LL, 0LL);
}

IONotificationPort *kern_GetCRCNotifyMessageCount(uint64_t a1)
{
  return iomfb_GetMachMessageCount(*(IONotificationPort **)(a1 + 1712));
}

uint64_t kern_EnableDisableVideoPowerSavings(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x21u, v3, 1u, 0LL, 0LL);
}

uint64_t kern_SetVideoDACGain(uint64_t a1, float a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = vcvtd_n_u64_f64(a2, 0xBuLL);
  if (v3[0] <= 0xFFF) {
    return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x22u, v3, 1u, 0LL, 0LL);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t kern_SetLine21Data(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x23u, v3, 1u, 0LL, 0LL);
}

uint64_t kern_GetDebugTraces()
{
  return 3758097095LL;
}

uint64_t kern_EnableDebugTracing()
{
  return 3758097095LL;
}

uint64_t kern_EnableVBLTraces()
{
  return 3758097095LL;
}

uint64_t kern_SetLogLevel()
{
  return 3758097095LL;
}

uint64_t kern_SPLCSetBrightness(uint64_t a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(unsigned int *)(a1 + 1944);
  input[0] = a2;
  input[1] = v2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x42u, input, 2u, 0LL, 0LL);
}

uint64_t kern_SPLCGetBrightness(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  uint32_t outputCnt = 1;
  output[0] = 0LL;
  uint64_t result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x43u, 0LL, 0, output, &outputCnt);
  if (!(_DWORD)result)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = output[0];
    }

    else
    {
      return 3758097090LL;
    }
  }

  return result;
}

uint64_t kern_SetBlock(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6)
{
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v12 = (a6 + 2);
  MEMORY[0x1895F8858]();
  uint64_t v14 = (char *)v24 - v13;
  if ((_DWORD)v12)
  {
    memset((char *)v24 - v13, 170, 8 * v12);
    *(void *)uint64_t v14 = a2;
    *((void *)v14 + 1) = 0LL;
    uint64_t v15 = (unint64_t *)(v14 + 8);
    if (!a6)
    {
      unint64_t v16 = 0LL;
      goto LABEL_8;
    }
  }

  else
  {
    *(void *)uint64_t v14 = a2;
    *((void *)v14 + 1) = 0LL;
    uint64_t v15 = (unint64_t *)(v14 + 8);
  }

  uint64_t v17 = 0LL;
  do
  {
    *(void *)&v14[8 * (v17 + 2)] = *(unsigned int *)(a5 + 4 * v17);
    ++v17;
  }

  while (a6 != v17);
  unint64_t v16 = *v15;
LABEL_8:
  if (v16 >= a4) {
    return 0LL;
  }
  do
  {
    CFTypeID v18 = (const void *)(v16 + a3);
    unint64_t v19 = v16 + 4096;
    size_t v20 = a4 - v16;
    if (v19 <= a4) {
      size_t v21 = 4096LL;
    }
    else {
      size_t v21 = v20;
    }
    uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x4Eu, (const uint64_t *)v14, v12, v18, v21, 0LL, 0LL, 0LL, 0LL);
    unint64_t v16 = *((void *)v14 + 1) + 4096LL;
    *((void *)v14 + 1) = v16;
  }

  while (v16 < a4 && (_DWORD)result == 0);
  return result;
}

uint64_t kern_GetBlock(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6)
{
  v23[1] = *MEMORY[0x1895F89C0];
  uint64_t v12 = (a6 + 2);
  MEMORY[0x1895F8858]();
  uint64_t v14 = (char *)v23 - v13;
  if ((_DWORD)v12)
  {
    memset((char *)v23 - v13, 170, 8 * v12);
    *(void *)uint64_t v14 = a2;
    *((void *)v14 + 1) = 0LL;
    uint64_t v15 = (unint64_t *)(v14 + 8);
    if (!a6)
    {
      unint64_t v16 = 0LL;
      goto LABEL_8;
    }
  }

  else
  {
    *(void *)uint64_t v14 = a2;
    *((void *)v14 + 1) = 0LL;
    uint64_t v15 = (unint64_t *)(v14 + 8);
  }

  uint64_t v17 = 0LL;
  do
  {
    *(void *)&v14[8 * (v17 + 2)] = *(unsigned int *)(a5 + 4 * v17);
    ++v17;
  }

  while (a6 != v17);
  unint64_t v16 = *v15;
LABEL_8:
  if (v16 >= a4) {
    return 0LL;
  }
  do
  {
    CFTypeID v18 = (void *)(v16 + a3);
    unint64_t v19 = v16 + 4096;
    size_t v20 = a4 - v16;
    if (v19 <= a4) {
      size_t v20 = 4096LL;
    }
    v23[0] = v20;
    uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x4Fu, (const uint64_t *)v14, v12, 0LL, 0LL, 0LL, 0LL, v18, v23);
    unint64_t v16 = *((void *)v14 + 1) + 4096LL;
    *((void *)v14 + 1) = v16;
  }

  while (v16 < a4 && (_DWORD)result == 0);
  return result;
}

uint64_t kern_SetParameter(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *inputStruct)
{
  uint64_t v4 = 3758097090LL;
  if (a1)
  {
    BOOL v7 = a3 && inputStruct == 0LL;
    BOOL v8 = v7;
    if (a3 <= 0x20 && !v8)
    {
      if (a2 != 8)
      {
        mach_port_t v11 = *(_DWORD *)(a1 + 20);
        uint64_t input = a2;
        uint64_t v12 = IOConnectCallMethod(v11, 0x44u, &input, 1u, inputStruct, 8LL * a3, 0LL, 0LL, 0LL, 0LL);
        if (a2 == 10)
        {
          if (!a3) {
            return v4;
          }
          if (*inputStruct == 3)
          {
            if (core_analytics_send_data(a1, 2, (uint64_t)"com.apple.TritiumVSHCompensation.Status"))
            {
              if (get_vsh_update_status((void *)a1) == 1
                && core_analytics_send_data(a1, 1, (uint64_t)"com.apple.TritiumVSHCompensation.CalibStop"))
              {
                uint64_t v15 = 1LL;
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2664))(a1, 17LL, 1LL, &v15);
              }

              uint64_t v15 = 2LL;
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2664))(a1, 17LL, 1LL, &v15);
            }

            if (core_analytics_send_data( a1,  3,  (uint64_t)"com.apple.TritiumVSHCompensation.CumulativeOnTime"))
            {
              uint64_t v15 = 3LL;
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2664))(a1, 17LL, 1LL, &v15);
            }
          }
        }

        return v12;
      }

      if (a3 == 1 && *inputStruct <= 1u)
      {
        uint64_t v4 = 0LL;
        *(_DWORD *)(a1 + 1948) = *inputStruct;
      }
    }
  }

  return v4;
}

CFTypeRef kern_CreateStatistics(uint64_t a1, CFAllocatorRef allocator)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), @"PerformanceStatistics", allocator, 0);
}

uint64_t kern_FactoryPortal(uint64_t a1, void *inputStruct)
{
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x4Bu, inputStruct, 0x8008uLL, 0LL, 0LL);
}

uint64_t kern_GetCurrentAbsoluteTime(uint64_t a1, uint64_t *output)
{
  uint32_t outputCnt = 1;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x4Du, 0LL, 0, output, &outputCnt);
}

uint64_t kern_SwapWARSettings(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v6 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  *(_DWORD *)(a1 + 849) = a2;
  *(_OWORD *)(a1 + 853) = *a3;
  pthread_mutex_unlock(v6);
  return 0LL;
}

uint64_t kern_GetLinkQuality(uint64_t a1)
{
  output[1] = *MEMORY[0x1895F89C0];
  uint32_t outputCnt = 1;
  output[0] = 0LL;
  if (IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x50u, 0LL, 0, output, &outputCnt)) {
    return 0x80000000LL;
  }
  else {
    return LODWORD(output[0]);
  }
}

uint64_t kern_GetProtectionOptions(uint64_t a1, uint64_t *a2)
{
  uint64_t result = 3758097090LL;
  if (a1 && a2)
  {
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x52u, 0LL, 0, &output, &outputCnt);
    if (!(_DWORD)result) {
      *a2 = output;
    }
  }

  return result;
}

uint64_t kern_GetBufBlock(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6)
{
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v12 = (a6 + 2);
  MEMORY[0x1895F8858]();
  uint64_t v14 = (char *)v24 - v13;
  if ((_DWORD)v12)
  {
    memset((char *)v24 - v13, 170, 8 * v12);
    *(void *)uint64_t v14 = a2;
    *((void *)v14 + 1) = 0LL;
    uint64_t v15 = (unint64_t *)(v14 + 8);
    if (!a6)
    {
      unint64_t v16 = 0LL;
      goto LABEL_8;
    }
  }

  else
  {
    *(void *)uint64_t v14 = a2;
    *((void *)v14 + 1) = 0LL;
    uint64_t v15 = (unint64_t *)(v14 + 8);
  }

  uint64_t v17 = 0LL;
  do
  {
    *(void *)&v14[8 * (v17 + 2)] = *(unsigned int *)(a5 + 4 * v17);
    ++v17;
  }

  while (a6 != v17);
  unint64_t v16 = *v15;
LABEL_8:
  if (v16 >= a4) {
    return 0LL;
  }
  do
  {
    CFTypeID v18 = (const void *)(v16 + a3);
    unint64_t v19 = v16 + 4096;
    size_t v20 = a4 - v16;
    if (v19 <= a4) {
      size_t v21 = 4096LL;
    }
    else {
      size_t v21 = v20;
    }
    uint64_t result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x55u, (const uint64_t *)v14, v12, v18, v21, 0LL, 0LL, 0LL, 0LL);
    unint64_t v16 = *((void *)v14 + 1) + 4096LL;
    *((void *)v14 + 1) = v16;
  }

  while (v16 < a4 && (_DWORD)result == 0);
  return result;
}

uint64_t kern_SetClamshellState(uint64_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x59u, v3, 1u, 0LL, 0LL);
}

uint64_t kern_ingest_timestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 && !*(_DWORD *)(a1 + 1948))
  {
    uint64_t v3 = mach_continuous_time();
    return v3 + v2 - mach_absolute_time();
  }

  return v2;
}

uint64_t kern_egest_timestamp(uint64_t a1, uint64_t a2)
{
  if (!a2 || *(_DWORD *)(a1 + 1948)) {
    return a2;
  }
  uint64_t v4 = mach_continuous_time();
  uint64_t v5 = mach_absolute_time();
  return (a2 - v4 + v5) & ~((uint64_t)(a2 - v4 + v5) >> 63);
}

uint64_t IOMobileFramebufferGetServiceObject(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t IOMobileFramebufferSwapSetBackgroundColor(uint64_t a1, float a2, float a3, float a4)
{
  if (!a1) {
    return 3758097090LL;
  }
  uint64_t result = 0LL;
  int v6 = vcvtms_s32_f32((float)(a2 * 255.0) + 0.5);
  int v7 = vcvtms_s32_f32((float)(a3 * 255.0) + 0.5);
  int v8 = vcvtms_s32_f32((float)(a4 * 255.0) + 0.5);
  unsigned int v9 = v6 & ~(v6 >> 31);
  if (v9 >= 0xFF) {
    unsigned int v9 = 255;
  }
  unsigned int v10 = v7 & ~(v7 >> 31);
  if (v10 >= 0xFF) {
    unsigned int v10 = 255;
  }
  unsigned int v11 = v8 & ~(v8 >> 31);
  if (v11 >= 0xFF) {
    unsigned int v11 = 255;
  }
  *(_DWORD *)(a1 + 364) = (v11 << 16) | (v10 << 8) | v9 | 0xFF000000;
  *(void *)(a1 + 356) |= 0x8000000080000000LL;
  return result;
}

uint64_t IOMobileFramebufferSwapUIEdgeBlendMode(uint64_t a1, unsigned int a2, int a3, float a4)
{
  uint64_t result = 3758097090LL;
  if (a1 && a2 <= 1 && a4 >= -1.0 && a4 <= 0.0)
  {
    uint64_t v6 = a1 + 4LL * a2;
    *(_DWORD *)(v6 + 260) = a3;
    *(float *)(v6 + 276) = a4;
    syslog(5, "IOMFB framebuffer->transaction.uiEdgeMode[layerIndex] = %d d \n", a3);
    syslog(5, "IOMFB framebuffer->transaction.uiSoftEdgeCoverage[layerIndex] = %f f \n", *(float *)(v6 + 276));
    return 0LL;
  }

  return result;
}

uint64_t IOMobileFramebufferSwapSetUISubRegion()
{
  return 3758097095LL;
}

uint64_t IOMobileFramebufferSwapSetVideoDestEdgeAlpha(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 388) = a2;
  *(void *)(a1 + 396) = a3;
  return 0LL;
}

uint64_t IOMobileFramebufferSwapSetGammaTable(uint64_t a1, unsigned int a2)
{
  uint64_t result = 3758097090LL;
  if (a1)
  {
    if (a2 <= 2)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 368) = a2;
    }
  }

  return result;
}

uint64_t IOMobileFramebufferSetContrast()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t result = 3758097090LL;
  if (v0 && *(void *)(v0 + 2408))
  {
    float v3 = v1;
    memset(v32, 170, sizeof(v32));
    uint64_t v4 = *(unsigned int (**)(uint64_t, _DWORD *))(v0 + 2416);
    if (v4 && !v4(v0, v32))
    {
      memset(v35, 170, sizeof(v35));
      memset(v34, 170, sizeof(v34));
      memset(__b, 170, sizeof(__b));
      int v5 = vcvtms_u32_f32((float)(v3 * 0.5) * 257.0);
      int v6 = vcvtmd_u64_f64((1.0 - (float)(v3 * 0.5)) * 257.0);
      if (v5 >= 256) {
        int v7 = 256;
      }
      else {
        int v7 = v5;
      }
      uint64_t v8 = v7 & ~(v7 >> 31);
      if (v6 >= 256) {
        int v9 = 256;
      }
      else {
        int v9 = v6;
      }
      uint64_t v10 = v9 & ~(v9 >> 31);
      if (v7 < 1)
      {
        unsigned int v18 = 0;
      }

      else
      {
        int v11 = v32[0];
        int v12 = v32[257];
        uint64_t v13 = __b;
        uint64_t v14 = v34;
        uint64_t v15 = v35;
        uint64_t v16 = v8;
        int v17 = v32[514];
        do
        {
          *v15++ = v11;
          *v14++ = v12;
          *v13++ = v17;
          --v16;
        }

        while (v16);
        unsigned int v18 = v8;
      }

      uint64_t v19 = v18;
      if (v18 < v10)
      {
        float v20 = 257.0 / (float)(v10 - v8);
        uint64_t v21 = v10 - v18;
        uint64_t v22 = &__b[4 * v18];
        int v23 = &v34[4 * v19];
        double v24 = &v35[4 * v19];
        float v25 = 0.0;
        do
        {
          double v26 = &v32[vcvtms_u32_f32(v25)];
          *v24++ = *v26;
          *v23++ = v26[257];
          *v22++ = v26[514];
          float v25 = v20 + v25;
          --v21;
        }

        while (v21);
        uint64_t v19 = v10;
      }

      int v27 = v32[256];
      int v28 = v32[513];
      uint64_t v29 = 4 * v19;
      int v30 = v32[770];
      do
      {
        *(_DWORD *)&v35[v29] = v27;
        *(_DWORD *)&v34[v29] = v28;
        *(_DWORD *)&__b[v29] = v30;
        v29 += 4LL;
      }

      while (v29 != 1028);
      memcpy(v32, v35, 0x404uLL);
      memcpy(&v32[257], v34, 0x404uLL);
      memcpy(&v32[514], __b, 0x404uLL);
      unsigned int v31 = *(void (**)(uint64_t, _DWORD *))(v0 + 2400);
      if (v31) {
        v31(v0, v32);
      }
    }

    return (*(uint64_t (**)(uint64_t, float))(v0 + 2408))(v0, v3);
  }

  return result;
}

CFArrayRef IOMobileFramebufferCreateDisplayList(const __CFAllocator *a1)
{
  if (s_display_infos_len) {
    return CFArrayCreate(a1, (const void **)&s_displays, s_display_infos_len, 0LL);
  }
  else {
    return 0LL;
  }
}

uint64_t IOMobileFramebufferOpenByName(const __CFString *a1, uint64_t *a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  iomfb_populate_all_display_infos();
  if (!a1 || !a2)
  {
    syslog(3, " %s:  Bad Argument\n", "IOMobileFramebufferOpenByName");
    return 3758097090LL;
  }

  uint64_t v4 = 0LL;
  *a2 = 0LL;
  int v5 = &s_display_infos;
  while (1)
  {
    if (!*v5)
    {
      syslog(3, "\n%s: Name is null idx=%d", "IOMobileFramebufferOpenByName", v4);
LABEL_10:
      int v7 = 0;
LABEL_11:
      unsigned int v8 = -536870212;
      goto LABEL_31;
    }

    if (CFStringCompare(a1, (CFStringRef)*v5, 0LL) == kCFCompareEqualTo) {
      break;
    }
    ++v4;
    v5 += 20;
    if (v4 == 16) {
      goto LABEL_10;
    }
  }

  if (*((_DWORD *)v5 + 2) != 2)
  {
    unsigned int display = iomfb_get_display((uint64_t)v5, a2);
    if (!display)
    {
      uint64_t v11 = *a2;
LABEL_23:
      uint64_t v19 = *((unsigned int *)v5 + 2);
      *(_DWORD *)(v11 + 1944) = v19;
      if (s_thread_notified == 1)
      {
        input[0] = v19;
        mach_port_t v20 = *(_DWORD *)(v11 + 20);
      }

      else
      {
        sleep(3u);
        if (s_thread_notified != 1)
        {
          unsigned int v8 = 0;
          goto LABEL_30;
        }

        uint64_t v21 = *a2;
        input[0] = *((unsigned int *)v5 + 2);
        mach_port_t v20 = *(_DWORD *)(v21 + 20);
      }

      int v7 = 1;
      IOConnectCallScalarMethod(v20, 0x58u, input, 1u, 0LL, 0LL);
      unsigned int v8 = 0;
      goto LABEL_31;
    }

    unsigned int v8 = display;
    goto LABEL_30;
  }

  if (!s_virt_context_len)
  {
    syslog(3, "IOMFB: no virtual display context installed\n");
    int v7 = 1;
    goto LABEL_11;
  }

  uint64_t v9 = *((unsigned int *)v5 + 4);
  uint64_t v10 = _ioMobileFramebufferAlloc();
  if (!v10)
  {
    syslog(3, "IOMFB: framebuffer allocation failed\n");
    unsigned int v8 = -536870211;
    goto LABEL_30;
  }

  uint64_t v11 = v10;
  int v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v13 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
  uint64_t v14 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
  *(void *)(v10 + 2752) = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  *(void *)(v11 + 2760) = CFDictionaryCreateMutable(v12, 0LL, v13, v14);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v12, 0LL, v13, v14);
  *(void *)(v11 + 2768) = Mutable;
  unsigned int v8 = -536870211;
  if (!*(void *)(v11 + 2752))
  {
LABEL_30:
    int v7 = 1;
    goto LABEL_31;
  }

  CFMutableDictionaryRef v16 = Mutable;
  int v17 = *(__CFDictionary **)(v11 + 2760);
  int v7 = 1;
  if (v17 && v16)
  {
    setIntValue(v17, @"MaxSrcRectWidth", 1920LL);
    setIntValue(*(__CFDictionary **)(v11 + 2760), @"MaxSrcRectTotal", 2073600LL);
    setIntValue(*(__CFDictionary **)(v11 + 2760), @"MaxSrcBufferWidth", 1919LL);
    setIntValue(*(__CFDictionary **)(v11 + 2760), @"MaxSrcBufferHeight", 1079LL);
    setIntValue(*(__CFDictionary **)(v11 + 2768), @"RGBLayer_MinScaleFraction", 1LL);
    setIntValue(*(__CFDictionary **)(v11 + 2768), @"RGBLayer_MaxScale", 1LL);
    setIntValue(*(__CFDictionary **)(v11 + 2768), @"YUVLayer_MinScaleFraction", 1LL);
    setIntValue(*(__CFDictionary **)(v11 + 2768), @"YUVLayer_MaxScale", 1LL);
    CFDictionarySetValue( *(CFMutableDictionaryRef *)(v11 + 2752),  @"IOMFBMaxSrcPixels",  *(const void **)(v11 + 2760));
    CFDictionarySetValue( *(CFMutableDictionaryRef *)(v11 + 2752),  @"IOMFBScalingLimits",  *(const void **)(v11 + 2768));
    *(_OWORD *)(v11 + 3176) = 0u;
    *(_OWORD *)(v11 + 3192) = 0u;
    *(_OWORD *)(v11 + 3144) = 0u;
    *(_OWORD *)(v11 + 3160) = 0u;
    *(_OWORD *)(v11 + 3112) = 0u;
    *(_OWORD *)(v11 + 3128) = 0u;
    *(_OWORD *)(v11 + 3080) = 0u;
    *(_OWORD *)(v11 + 3096) = 0u;
    *(_OWORD *)(v11 + 3048) = 0u;
    *(_OWORD *)(v11 + 3064) = 0u;
    *(_OWORD *)(v11 + 3016) = 0u;
    *(_OWORD *)(v11 + 3032) = 0u;
    *(_OWORD *)(v11 + 2984) = 0u;
    *(_OWORD *)(v11 + 3000) = 0u;
    *(_OWORD *)(v11 + 2952) = 0u;
    *(_OWORD *)(v11 + 2968) = 0u;
    *(_OWORD *)(v11 + 2920) = 0u;
    *(_OWORD *)(v11 + 2936) = 0u;
    *(_OWORD *)(v11 + 2888) = 0u;
    *(_OWORD *)(v11 + 2904) = 0u;
    *(_OWORD *)(v11 + 2856) = 0u;
    *(_OWORD *)(v11 + 2872) = 0u;
    *(_OWORD *)(v11 + 2824) = 0u;
    *(_OWORD *)(v11 + 2840) = 0u;
    *(void *)(v11 + 2792) = &s_virt_funcs;
    *(void *)(v11 + 2784) = s_virt_contexts[v9];
    *(void *)(v11 + 2456) = virt_GetSupportedDigitalOutModes;
    *(void *)(v11 + 2432) = virt_SetDigitalOutMode;
    *(void *)(v11 + 1992) = virt_GetLayerDefaultSurface;
    *(void *)(v11 + 2008) = virt_GetDisplaySize;
    *(void *)(v11 + 2336) = kern_RequestPowerChange;
    *(void *)(v11 + 2016) = kern_GetID;
    *(void *)(v11 + 2024) = virt_CopyProperty;
    *(void *)(v11 + 2032) = virt_SwapSetLayer;
    *(void *)(v11 + 2040) = virt_SwapSetEventWait;
    *(void *)(v11 + 2048) = virt_SwapSetEventSignalOnGlass;
    *(void *)(v11 + 2056) = virt_SwapSetEventSignal;
    *(void *)(v11 + 2072) = virt_SwapDebugInfo;
    *(void *)(v11 + 2088) = iomfb_SwapSetTimestamp;
    *(void *)(v11 + 2104) = iomfb_SwapSetTimestamps;
    *(void *)(v11 + 2200) = virt_SwapBegin;
    *(void *)(v11 + 2208) = virt_SwapEnd;
    *(void *)(v11 + 2232) = virt_SwapSignal;
    *(void *)(v11 + 2240) = virt_SwapWait;
    *(void *)(v11 + 2248) = virt_SwapWaitWithTimeout;
    *(void *)(v11 + 2256) = virt_SwapCancel;
    *(void *)(v11 + 2552) = virt_GetRunLoopSource;
    *(void *)(v11 + 2296) = virt_EnableNotifications;
    *(void *)(v11 + 2304) = virt_DisableNotifications;
    *(void *)(v11 + 2472) = virt_GetHDCPDownstreamState;
    *(void *)(v11 + 2464) = iomfb_GetHDCPAuthenticationProtocol;
    *(void *)(v11 + 2480) = virt_HDCPSendRequest;
    *(void *)(v11 + 2488) = virt_HDCPGetReply;
    *(void *)(v11 + 2496) = virt_GetProtectionOptions;
    *(void *)(v11 + 2376) = virt_EnableStatistics;
    *(void *)(v11 + 2672) = virt_CreateStatistics;
    *(void *)(v11 + 2736) = virt_gest_timestamp;
    *(void *)(v11 + 2744) = virt_gest_timestamp;
    *(_DWORD *)(v11 + 16) = 0;
    *a2 = v11;
    goto LABEL_23;
  }

LABEL_31:
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  *(_OWORD *)uint64_t input = 0u;
  __int128 v23 = 0u;
  CFStringGetCString(a1, (char *)input, 128LL, 0x8000100u);
  syslog( 3,  " %s: Framebuffer found=%d return %d Name = %s\n",  "IOMobileFramebufferOpenByName",  v7,  v8,  (const char *)input);
  if (v7) {
    return v8;
  }
  else {
    return 3758097090LL;
  }
}

uint64_t iomfb_get_display(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = IOMobileFramebufferOpen(*(_DWORD *)(a1 + 20), *MEMORY[0x1895FBBE0], 0, a2);
  if (!(_DWORD)v4 && !*(_BYTE *)(a1 + 152))
  {
    if (*a2)
    {
      int v6 = *(uint64_t (**)(void))(*a2 + 2024);
      if (v6)
      {
        int v7 = (const __CFBoolean *)v6();
        if (v7)
        {
          unsigned int v8 = v7;
          CFTypeID v9 = CFGetTypeID(v7);
          if (v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8)) {
            *(_DWORD *)(*a2 + 1864) = 9;
          }
          CFRelease(v8);
        }
      }
    }
  }

  return v4;
}

uint64_t IOMobileFramebufferIsMainDisplay(uint64_t a1, _DWORD *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  uint32_t outputCnt = 1;
  *a2 = 0;
  if (!a1) {
    return 3758097090LL;
  }
  if (!*(_DWORD *)(a1 + 20)) {
    return 0LL;
  }
  output[0] = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  int v4 = *(_DWORD *)(a1 + 1940);
  if (v4 == -1)
  {
    uint64_t v5 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x12u, 0LL, 0, output, &outputCnt);
    if ((_DWORD)v5)
    {
      int v4 = *(_DWORD *)(a1 + 1940);
    }

    else
    {
      int v4 = LODWORD(output[0]) == 1;
      *(_DWORD *)(a1 + 1940) = v4;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  if (v4 == 1) {
    *a2 = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 1872));
  return v5;
}

uint64_t IOMobileFramebufferInstallVirtualDisplay(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  __int128 v4 = *a3;
  __int128 v5 = a3[2];
  xmmword_18C44ABE8 = a3[1];
  unk_18C44ABF8 = v5;
  s_virt_funcs = v4;
  __int128 v6 = a3[3];
  __int128 v7 = a3[4];
  __int128 v8 = a3[6];
  xmmword_18C44AC28 = a3[5];
  unk_18C44AC38 = v8;
  xmmword_18C44AC08 = v6;
  unk_18C44AC18 = v7;
  __int128 v9 = a3[7];
  __int128 v10 = a3[8];
  __int128 v11 = a3[10];
  xmmword_18C44AC68 = a3[9];
  unk_18C44AC78 = v11;
  xmmword_18C44AC48 = v9;
  unk_18C44AC58 = v10;
  s_virt_contexts = a4;
  s_virt_context_len = 1;
  return 0LL;
}

uint64_t IOMobileFramebufferInstallVirtualDisplays(__int128 *a1, const void *a2, unint64_t a3)
{
  if (a3 > 0xC) {
    return 3758097090LL;
  }
  __int128 v4 = *a1;
  __int128 v5 = a1[2];
  xmmword_18C44ABE8 = a1[1];
  unk_18C44ABF8 = v5;
  s_virt_funcs = v4;
  __int128 v6 = a1[3];
  __int128 v7 = a1[4];
  __int128 v8 = a1[6];
  xmmword_18C44AC28 = a1[5];
  unk_18C44AC38 = v8;
  xmmword_18C44AC08 = v6;
  unk_18C44AC18 = v7;
  __int128 v9 = a1[7];
  __int128 v10 = a1[8];
  __int128 v11 = a1[10];
  xmmword_18C44AC68 = a1[9];
  unk_18C44AC78 = v11;
  xmmword_18C44AC48 = v9;
  unk_18C44AC58 = v10;
  s_virt_context_len = a3;
  if ((_DWORD)a3) {
    memcpy(s_virt_contexts, a2, 8LL * a3);
  }
  return 0LL;
}

uint64_t IOMobileFramebufferGetMainDisplay(uint64_t *a1)
{
  uint64_t v2 = s_display_infos_len;
  if (!s_display_infos_len) {
    return 3758097088LL;
  }
  for (uint64_t i = &s_display_infos; !*((_BYTE *)i + 152); i += 20)
  {
    if (!--v2) {
      return 3758097088LL;
    }
  }

  return iomfb_get_display((uint64_t)i, a1);
}

uint64_t IOMobileFramebufferGetSecondaryDisplay(uint64_t *a1)
{
  uint64_t v2 = s_display_infos_len;
  if (!s_display_infos_len) {
    return 3758097088LL;
  }
  for (uint64_t i = &s_display_infos; *((_BYTE *)i + 152) || *((_DWORD *)i + 2) == 2; i += 20)
  {
    if (!--v2) {
      return 3758097088LL;
    }
  }

  return iomfb_get_display((uint64_t)i, a1);
}

uint64_t IOMobileFramebufferEnableMirroring(uint64_t a1, uint64_t a2, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  __int128 v8 = xmmword_182E76BFC;
  LODWORD(v9) = -1431655766;
  if (a1 && a2)
  {
    int v10 = -1431655766;
    uint64_t IsMainDisplay = IOMobileFramebufferIsMainDisplay(a1, &v10);
    if (!(_DWORD)IsMainDisplay)
    {
      uint64_t IsMainDisplay = 3758097090LL;
      if (v10)
      {
        if (!a3
          || (uint64_t IsMainDisplay = IOMobileFrameBufferGetMirroringCapability(a2, &v8), !(_DWORD)IsMainDisplay)
          && (uint64_t IsMainDisplay = 3758097090LL, (_BYTE)v8))
        {
          input[0] = a3;
          uint64_t IsMainDisplay = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x29u, input, 1u, 0LL, 0LL);
          if ((_DWORD)IsMainDisplay)
          {
            syslog(4, "IOMFB: mirror enable kernel failure\n");
LABEL_14:
            *(void *)(a2 + 3240) = 0LL;
            *(void *)(a1 + 3248) = 0LL;
            return IsMainDisplay;
          }

          if (!a3) {
            goto LABEL_14;
          }
          uint64_t IsMainDisplay = 0LL;
          *(void *)(a2 + 3240) = a1;
          *(void *)(a1 + 3248) = a2;
        }
      }
    }
  }

  else
  {
    uint64_t IsMainDisplay = 3758097090LL;
    syslog(4, "IOMFB: missing framebuffer for mirorr enable\n", v8, v9);
  }

  return IsMainDisplay;
}

uint64_t IOMobileFrameBufferGetMirroringCapability(uint64_t a1, void *a2)
{
  uint64_t v2 = 3758097090LL;
  if (a1 && a2)
  {
    int v6 = -1431655766;
    if (IOMobileFramebufferIsMainDisplay(a1, &v6) || !v6)
    {
      size_t outputStructCnt = 20LL;
      return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x2Au, 0LL, 0LL, a2, &outputStructCnt);
    }

    else
    {
      syslog(5, "Error -  IOMobileFrameBufferGetMirroringCapability called on internal framebuffer \n");
      return 3758097126LL;
    }
  }

  return v2;
}

uint64_t IOMobileFramebufferSetRenderingAngle(uint64_t a1, float *a2)
{
  if (a1 && a2)
  {
    int v10 = -1431655766;
    int IsMainDisplay = IOMobileFramebufferIsMainDisplay(a1, &v10);
    if (IsMainDisplay | v10)
    {
      float v5 = (float)(*a2 * 180.0) / 3.14159265;
      float inputStruct = v5;
      HIDWORD(v6) = -1527099483 * v5;
      LODWORD(v6) = HIDWORD(v6);
      if ((v6 >> 1) < 0x2D82D83)
      {
        uint64_t v7 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x2Bu, &inputStruct, 4uLL, 0LL, 0LL);
        if ((_DWORD)v7)
        {
          syslog(4, "IOMobileFramebufferSetRenderingAngle - kernel rejected the rendering angle trap\n");
          *(_DWORD *)(a1 + 3256) = 0;
        }

        else
        {
          *(_DWORD *)(a1 + 3256) = inputStruct;
        }
      }

      else
      {
        uint64_t v7 = 3758097126LL;
        syslog(4, "IOMobileFramebufferSetRenderingAngle error - angle needs to be a multiple of 90\n");
      }
    }

    else
    {
      uint64_t v7 = 3758097126LL;
      syslog(4, "IOMobileFramebufferSetRenderingAngle - can only set rending angle for internal display\n");
    }
  }

  else
  {
    syslog(4, "IOMobileFramebufferSetRenderingAngle - bad argument\n");
    return 3758097090LL;
  }

  return v7;
}

uint64_t IOMobileFramebufferSetMirrorContentRegion(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (!a1) {
    return 3758097090LL;
  }
  float v5 = a2;
  float v6 = a3;
  *(float *)int v10 = v5;
  *(float *)&v10[1] = v6;
  float v7 = a4;
  float v8 = a5;
  *(float *)&_OWORD v10[2] = v7;
  *(float *)&v10[3] = v8;
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x2Cu, v10, 0x10uLL, 0LL, 0LL);
}

uint64_t IOMobileFramebufferGetMirrorError(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = 3758097090LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 3240))
    {
      uint64_t v2 = 0LL;
      *a2 = 0;
    }

    else
    {
      syslog(3, "IOMobileFramebufferGetMirrorError - no mirror source\n");
    }
  }

  return v2;
}

uint64_t IOMobileFramebufferReadyForSwap(void *a1, BOOL *a2, uint64_t a3)
{
  double v13 = 0.0;
  double v14 = 0.0;
  uint64_t result = 3758097090LL;
  if (a1)
  {
    if (a2)
    {
      int v12 = -1431655766;
      uint64_t result = IOMobileFramebufferIsMainDisplay((uint64_t)a1, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          BOOL v7 = 1;
        }

        else
        {
          uint64_t v8 = a1[405];
          if (v8)
          {
            uint64_t v9 = *(unsigned int *)(v8 + 3256);
            int v10 = *(void (**)(void))(v8 + 2008);
            if (v10) {
              v10();
            }
          }

          else
          {
            __int128 v11 = (void (*)(void *, double *))a1[251];
            if (v11) {
              v11(a1, &v13);
            }
            uint64_t v9 = 0LL;
          }

          BOOL v7 = (*(unsigned int (**)(void, uint64_t, uint64_t, uint64_t, void, void, double, double))(a1[349] + 120LL))( a1[348],  v9,  a3,  1LL,  0LL,  0LL,  v13,  v14) == 0;
        }

        uint64_t result = 0LL;
        *a2 = v7;
      }
    }
  }

  return result;
}

uint64_t IOMobileFramebufferGetWirelessSurface( uint64_t a1, double a2, double a3, uint64_t a4, IOSurfaceRef *a5)
{
  uint64_t v9 = (*(uint64_t (**)(void))(a1 + 2744))();
  return IOMobileFramebufferGetWirelessSurfaceWithOptions(a1, v9, a5, 0, a2, a3);
}

uint64_t IOMobileFramebufferGetWirelessSurfaceWithOptions( uint64_t a1, uint64_t a2, IOSurfaceRef *a3, unsigned int a4, double a5, double a6)
{
  if (!a1) {
    return 3758097090LL;
  }
  int v24 = -1431655766;
  uint64_t result = IOMobileFramebufferIsMainDisplay(a1, &v24);
  if ((_DWORD)result) {
    return result;
  }
  if (v24) {
    return 3758097090LL;
  }
  uint64_t v13 = *(void *)(a1 + 3240);
  if (v13) {
    uint64_t v14 = *(unsigned int *)(v13 + 3256);
  }
  else {
    uint64_t v14 = 0LL;
  }
  uint64_t v15 = 0LL;
  while (1)
  {
    uint64_t v16 = a1 + v15;
    if (!*(void *)(a1 + v15 + 2840)) {
      break;
    }
    v15 += 24LL;
    if (v15 == 384) {
      return 3758097086LL;
    }
  }

  uint64_t v17 = *(void *)(a1 + 2792);
  if (!v17) {
    return 3758097084LL;
  }
  unsigned int v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, IOSurfaceID *, uint64_t, double, double))(v17 + 120);
  if (!v18) {
    return 3758097084LL;
  }
  uint64_t v19 = *(void (**)(void, void))(v17 + 112);
  if (v19)
  {
    v19(*(void *)(a1 + 2784), (a4 >> 1) & 1);
    unsigned int v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, IOSurfaceID *, uint64_t, double, double))(*(void *)(a1 + 2792) + 120LL);
  }

  uint64_t v20 = *(void *)(a1 + 2784);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2744))(a1, a2);
  uint64_t v22 = (IOSurfaceID *)(a1 + v15 + 2832);
  uint64_t result = v18(v20, v14, v21, 1LL, v22, v16 + 2840, a5, a6);
  if (!(_DWORD)result)
  {
    IOSurfaceRef v23 = IOSurfaceLookup(*v22);
    *(void *)(v16 + 2824) = v23;
    *a3 = v23;
    uint64_t result = 3758097084LL;
    if (*(void *)(v16 + 2824)) {
      return 0LL;
    }
  }

  *(void *)(v16 + 2840) = 0LL;
  return result;
}

uint64_t IOMobileFramebufferKernelTests(uint64_t a1, _DWORD *inputStruct)
{
  if (*inputStruct < 0x15u) {
    return IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x38u, inputStruct, 0x9CuLL, 0LL, 0LL);
  }
  syslog( 3,  "%s: passed %d surfaces, > %d\n",  "IOReturn IOMobileFramebufferKernelTests(IOMobileFramebufferRef, struct IOMFBKernelTestsArguments)",  *inputStruct,  20);
  return 3758097090LL;
}

uint64_t IOMFBGainEncoderCreate(int a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v9 = IOMFBgainencoder_new((int)a5, (int)a6, a1 != 0, 0);
  if (!v9) {
    return 3758097084LL;
  }
  int v10 = v9;
  IOMFBgainencoder_set_origin((uint64_t)v9, a3, a4);
  uint64_t result = 0LL;
  *a2 = v10;
  return result;
}

uint64_t IOMFBGainEncoderStartRow(_DWORD *a1)
{
  else {
    return 3758097084LL;
  }
}

uint64_t IOMFBGainEncoderEmitEmptyRows(_DWORD *a1, unsigned int a2)
{
  else {
    return 3758097084LL;
  }
}

uint64_t IOMFBGainEncoderRepeatPreviousRow()
{
  else {
    return 3758097084LL;
  }
}

uint64_t IOMFBGainEncoderEmitRun(uint64_t a1, int a2, uint64_t a3)
{
  else {
    return 3758097084LL;
  }
}

_DWORD *IOMFBGainEncoderFinishEncoding(uint64_t a1, unsigned int *a2)
{
  kern_return_t v17;
  uint32_t outputCnt;
  uint64_t output;
  __int128 inputStruct;
  __int128 v22;
  size_t __n[2];
  size_t v24[2];
  BOOL v25;
  __int128 v4 = malloc(8uLL);
  float v5 = v4;
  if (v4)
  {
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    uint32_t outputCnt = -1431655766;
    *(void *)__int128 v4 = 0LL;
    atomic_store(1u, v4 + 1);
    *(_OWORD *)__n = 0u;
    *(_OWORD *)int v24 = 0u;
    float inputStruct = 0u;
    uint64_t v22 = 0u;
    __int128 v25 = IOMFBgainencoder_row_1_coded((uint64_t)a2) != 0;
    IOMFBgainencoder_get_origin((uint64_t)a2, (_DWORD *)((unint64_t)&inputStruct | 0xC), &v22);
    IOMFBgainencoder_get_size((uint64_t)a2, (_DWORD *)&v22 + 1, (_DWORD *)&v22 + 2);
    BYTE11(inputStruct) = *(_BYTE *)(a1 + 3224);
    HIDWORD(v22) = IOMFBgainencoder_count(a2, 0);
    LODWORD(__n[1]) = IOMFBgainencoder_count(a2, 1);
    HIDWORD(v24[0]) = IOMFBgainencoder_count(a2, 2);
    HIDWORD(__n[0]) = IOMFBgainencoder_map_size((_DWORD **)a2, 0);
    LODWORD(v24[0]) = IOMFBgainencoder_map_size((_DWORD **)a2, 1);
    int v6 = IOMFBgainencoder_map_size((_DWORD **)a2, 2);
    int v7 = v6 + HIDWORD(__n[0]) + LODWORD(v24[0]) + 0x3FFF;
    unsigned int v8 = v7 & 0xFFFFC000;
    HIDWORD(v24[1]) = v6;
    DWORD2(inputStruct) = v7 & 0xFFC000 | (BYTE11(inputStruct) << 24);
    uint64_t v9 = aligned_alloc(0x4000uLL, v7 & 0xFFFFC000);
    *(void *)&float inputStruct = v9;
    if (v9)
    {
      int v10 = v9;
      LODWORD(__n[0]) = 0;
      __int128 v11 = (const void *)IOMFBgainencoder_map((uint64_t)a2, 0);
      uint64_t v12 = HIDWORD(__n[0]);
      uint64_t v13 = inputStruct;
      memcpy(v10, v11, HIDWORD(__n[0]));
      HIDWORD(__n[1]) = v12;
      uint64_t v14 = (const void *)IOMFBgainencoder_map((uint64_t)a2, 1);
      memcpy((void *)(v13 + v12), v14, LODWORD(v24[0]));
      LODWORD(v24[1]) = LODWORD(v24[0]) + HIDWORD(__n[1]);
      uint64_t v15 = (void *)(inputStruct + (LODWORD(v24[0]) + HIDWORD(__n[1])));
      uint64_t v16 = (const void *)IOMFBgainencoder_map((uint64_t)a2, 2);
      memcpy(v15, v16, HIDWORD(v24[1]));
      if (HIDWORD(v24[1]) + LODWORD(v24[1]) < v8) {
        bzero( (void *)(inputStruct + (HIDWORD(v24[1]) + LODWORD(v24[1]))),  v8 + ~HIDWORD(v24[1]) - LODWORD(v24[1]) + 1LL);
      }
      uint32_t outputCnt = 1;
      uint64_t v17 = IOConnectCallMethod( *(_DWORD *)(a1 + 20),  0x56u,  0LL,  0,  &inputStruct,  0x48uLL,  &output,  &outputCnt,  0LL,  0LL);
      free((void *)inputStruct);
      if (!v17)
      {
        _DWORD *v5 = output;
        return v5;
      }
    }

    free(v5);
    return 0LL;
  }

  return v5;
}

uint64_t IOMFBGainMapRetain(uint64_t result)
{
  if (result)
  {
    float v1 = (unsigned int *)(result + 4);
    do
      unsigned int v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }

  return result;
}

void IOMFBGainMapRelease(uint64_t a1, unsigned int *a2)
{
  if (a2)
  {
    float v3 = a2 + 1;
    do
    {
      unsigned int v4 = __ldaxr(v3);
      unsigned int v5 = v4 - 1;
    }

    while (__stlxr(v5, v3));
    if (!v5)
    {
      if (a1)
      {
        int v6 = *(void (**)(void))(a1 + 2664);
        if (v6) {
          v6();
        }
      }

      free(a2);
    }
  }

uint64_t IOMobileFramebufferSwapSetGainMap(uint64_t a1, _DWORD *a2)
{
  unsigned int v4 = *(unsigned int **)(a1 + 3216);
  if (v4) {
    IOMFBGainMapRelease(a1, v4);
  }
  *(_BYTE *)(a1 + 1032) = 1;
  if (a2)
  {
    unsigned int v5 = a2 + 1;
    *(_DWORD *)(a1 + 1028) = *a2;
    *(void *)(a1 + 3216) = a2;
    do
      unsigned int v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
  }

  else
  {
    *(_DWORD *)(a1 + 1028) = 0;
    *(void *)(a1 + 3216) = 0LL;
  }

  return 0LL;
}

uint64_t IOMobileFramebufferSetTwilightStrength(uint64_t a1, float a2)
{
  float v2 = 0.0;
  if (a2 >= 0.0) {
    float v2 = a2;
  }
  if (a2 <= 1.0) {
    float v3 = v2;
  }
  else {
    float v3 = 1.0;
  }
  *(_DWORD *)(a1 + 1040) = (2 * (v3 * 2147483650.0)) | 1;
  return 0LL;
}

uint64_t IOMobileFramebufferSetAmmoliteStrength(uint64_t a1, float a2)
{
  float v2 = 0.0;
  if (a2 >= 0.0) {
    float v2 = a2;
  }
  if (a2 <= 1.0) {
    float v3 = v2;
  }
  else {
    float v3 = 1.0;
  }
  *(_DWORD *)(a1 + 1044) = (2 * (v3 * 2147483650.0)) | 1;
  return 0LL;
}

uint64_t IOMobileFramebufferCalibrationBegin(uint64_t a1)
{
  if (!a1) {
    return 3758097090LL;
  }
  int v5 = -1431655766;
  uint64_t result = IOMobileFramebufferIsMainDisplay(a1, &v5);
  if (!(_DWORD)result)
  {
    if (v5)
    {
      uint64_t v4 = 1LL;
      float v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2664);
      if (v3) {
        v3(a1, 20LL, 1LL, &v4);
      }
      return 0LL;
    }

    else
    {
      syslog(3, "IOMobileFramebufferCalibrationBegin called on external framebuffer \n");
      return 3758097126LL;
    }
  }

  return result;
}

uint64_t IOMobileFramebufferCalibrationToolboxCommand( uint64_t a1, int a2, _DWORD *a3, size_t a4, _DWORD *a5, uint64_t a6)
{
  kern_return_t v17;
  kern_return_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t *, uint64_t, void, void);
  void (*v20)(uint64_t, uint64_t, uint64_t *, uint64_t, void, void);
  void *v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;
  __int128 v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t *, uint64_t, void, void);
  unsigned int v30;
  CFNumberRef v31;
  io_registry_entry_t v32;
  CFStringRef v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t *, uint64_t, void, void);
  kern_return_t v39;
  BOOL v40;
  const void **v41;
  const void *v42;
  io_registry_entry_t v43;
  CFStringRef v44;
  const void **v45;
  const void **v46;
  uint64_t input[2];
  void *v48;
  uint64_t v49;
  unint64_t v50;
  unsigned int v51;
  void *v52;
  int v53;
  io_connect_t connect;
  double v52 = 0LL;
  double v51 = 0;
  uint64_t v6 = 3758097090LL;
  if (!a1) {
    return 3758097090LL;
  }
  double v53 = -1431655766;
  uint64_t IsMainDisplay = IOMobileFramebufferIsMainDisplay(a1, &v53);
  if ((_DWORD)IsMainDisplay) {
    return IsMainDisplay;
  }
  if (!v53)
  {
    syslog(3, "IOMobileFramebufferCalibrationBegin called on external framebuffer \n");
    return 3758097126LL;
  }

  if (a2 <= 16908289)
  {
    if (a2 != 16842757)
    {
      if (a2 == 16842758)
      {
        uint64_t v14 = IOServiceMatching("AppleNVMeEAN");
        io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086B0], v14);
        if (!MatchingService) {
          return 3758097090LL;
        }
        io_object_t v16 = MatchingService;
        io_connect_t connect = -1431655766;
        uint64_t v17 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
        IOObjectRelease(v16);
        if (v17) {
          return 3758097090LL;
        }
        input[0] = 1430470988LL;
        unsigned int v18 = IOConnectCallMethod(connect, 5u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
        IOServiceClose(connect);
        if (v18)
        {
          syslog(3, "UserCalibration_EraseEAN   failed \n");
          return 3758097090LL;
        }

        double v34 = 4LL;
LABEL_59:
        input[0] = v34;
        v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2664);
        if (v35)
        {
          uint64_t v36 = a1;
          double v37 = 20LL;
LABEL_78:
          v35(v36, v37, 1LL, input);
          return 0LL;
        }

        return 0LL;
      }

      goto LABEL_33;
    }

    uint64_t IsMainDisplay = 0LL;
    LODWORD(input[0]) = 0;
    if (!a5 || a6 != 4) {
      return IsMainDisplay;
    }
    uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, void, void))(a1 + 2656);
    if (v20)
    {
      v20(a1, 99LL, input, 4LL, 0LL, 0LL);
      if (*(float *)input != 0.0)
      {
        uint64_t IsMainDisplay = 0LL;
        *a5 = input[0];
        return IsMainDisplay;
      }
    }

    uint64_t IsMainDisplay = UserCalibration_ReadEAN(&v52, &v51);
    uint64_t v21 = v52;
    if (!(_DWORD)IsMainDisplay)
    {
      uint64_t v22 = v51 < 0x25 ? 0LL : 4LL * *((unsigned int *)v52 + 2);
      uint64_t IsMainDisplay = UserCalibration_SetCalibrationData(a1, v52, v22, 0);
      if (!(_DWORD)IsMainDisplay)
      {
        v38 = *(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, void, void))(a1 + 2656);
        if (v38) {
          v38(a1, 99LL, input, 4LL, 0LL, 0LL);
        }
        uint64_t IsMainDisplay = 0LL;
        *a5 = input[0];
      }
    }

    if (v21)
    {
      __int128 v26 = v21;
      goto LABEL_68;
    }

    return IsMainDisplay;
  }

  if (a2 == 16908293)
  {
    uint64_t IsMainDisplay = 0LL;
    if (a5 && a6 == 8)
    {
      IOSurfaceRef v23 = UserCalibration_ReadEAN(&v52, &v51);
      if ((_DWORD)v23 == -536870160) {
        goto LABEL_41;
      }
      uint64_t IsMainDisplay = v23;
      if ((_DWORD)v23) {
        goto LABEL_43;
      }
      if (v51 < 0x25) {
LABEL_41:
      }
        int v24 = 0LL;
      else {
        int v24 = *(void *)((char *)v52 + 12);
      }
      uint64_t IsMainDisplay = 0LL;
      *(void *)a5 = v24;
    }

LABEL_92:
      double v40 = IORegistryEntrySetCFProperty(v43, v44, v42) == 0;
LABEL_93:
      if (v40) {
        return 0LL;
      }
      else {
        return 3758097090LL;
      }
    }

    if (a2 == 0x1000000)
    {
      input[0] = *a3;
      v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 2664);
      if (v35)
      {
        uint64_t v36 = a1;
        double v37 = 21LL;
        goto LABEL_78;
      }

      return 0LL;
    }

    if (a2 == 16777221)
    {
      if (*a3) {
        double v41 = (const void **)MEMORY[0x189604DE8];
      }
      else {
        double v41 = (const void **)MEMORY[0x189604DE0];
      }
      double v42 = *v41;
      double v43 = *(_DWORD *)(a1 + 16);
      double v44 = @"uniformity2D";
      goto LABEL_92;
    }

    uint64_t IsMainDisplay = 3758097090LL;
    if (a2 != 16777222) {
      return IsMainDisplay;
    }
    if (a4 != 11200) {
      return 0LL;
    }
    __int128 v27 = aligned_alloc(0x4000uLL, 0x4000uLL);
    memcpy(v27, a3, 0x2BC0uLL);
    *(void *)&__int128 v28 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t input = v28;
    double v49 = 0x4000LL;
    double v50 = 0xAAAAAAAAAAAA0000LL;
    LODWORD(input[0]) = 1;
    LOBYTE(input[1]) = 1;
    v48 = v27;
    __int128 v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, void, void))(a1 + 2648);
    if (v29) {
      uint64_t IsMainDisplay = v29(a1, 22LL, input, 40LL, 0LL, 0LL);
    }
    else {
      uint64_t IsMainDisplay = 3758097095LL;
    }
    __int128 v26 = v27;
LABEL_68:
    free(v26);
    return IsMainDisplay;
  }

  LODWORD(input[0]) = -1;
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, void, void))(a1 + 2656);
  if (v19) {
    v19(a1, 96LL, input, 4LL, 0LL, 0LL);
  }
  if (a5 && a6 == 4)
  {
    uint64_t v6 = 0LL;
    *a5 = input[0];
  }

  return v6;
}

uint64_t UserCalibration_ReadEAN(void **a1, _DWORD *a2)
{
  kern_return_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input;
  io_connect_t connect;
  uint64_t v17[4];
  v17[3] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097090LL;
  int v5 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086B0], v5);
  if (MatchingService)
  {
    io_object_t v7 = MatchingService;
    io_connect_t connect = -1431655766;
    unsigned int v8 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    IOObjectRelease(v7);
    if (!v8)
    {
      *a1 = 0LL;
      uint64_t output = 0xAAAAAAAAAAAAAAAALL;
      uint64_t input = 1430470988LL;
      uint32_t outputCnt = 1;
      uint64_t v9 = 3758097136LL;
      if (!IOConnectCallMethod(connect, 3u, &input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL))
      {
        int v10 = output;
        if (output)
        {
          *a2 = output >> 2;
          __int128 v11 = malloc(v10);
          *a1 = v11;
          if (v11)
          {
            v17[0] = 1430470988LL;
            v17[1] = (uint64_t)v11;
            v17[2] = v10;
            if (!IOConnectCallMethod(connect, 4u, v17, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL))
            {
              IOServiceClose(connect);
              return 0LL;
            }

            uint64_t v9 = 3758097136LL;
          }

          else
          {
            uint64_t v9 = 3758097085LL;
          }
        }
      }

      IOServiceClose(connect);
      if (*a1) {
        free(*a1);
      }
      *a1 = 0LL;
      syslog(3, "UserCalibration_ReadEAN failed: 0x%X", v9);
      return v9;
    }
  }

  return v4;
}

uint64_t UserCalibration_SetCalibrationData(uint64_t a1, const void *a2, size_t a3, int a4)
{
  if (a3 >> 19) {
    return 0LL;
  }
  if (a4)
  {
    uint64_t v8 = 3758097090LL;
    if (!a1 || (uint64_t v9 = *(uint64_t (**)(uint64_t, void))(a1 + 2336)) == 0LL || (v8 = v9(a1, 0LL), (_DWORD)v8))
    {
      syslog(3, "UserCalibration_SetCalibrationData Power up Failed with %x\n", v8);
      return v8;
    }
  }

  int v10 = aligned_alloc(0x4000uLL, (a3 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL);
  memcpy(v10, a2, a3);
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v16 = v11;
  int v19 = -1431655766;
  LODWORD(v16) = 1;
  DWORD2(v16) = a3;
  uint64_t v17 = v10;
  int v18 = (a3 + 0x3FFF) & 0xFFFFC000;
  if (!a1)
  {
    free(v10);
    uint64_t v8 = 3758097095LL;
    syslog(3, "UserCalibration_SetCalibrationData Failed with %x\n");
    return v8;
  }

  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t, void, void))(a1 + 2648);
  if (v12)
  {
    uint64_t v8 = v12(a1, 97LL, &v16, 32LL, 0LL, 0LL);
    free(v10);
    if (!(_DWORD)v8)
    {
      if (a4)
      {
        uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2336);
        if (v13)
        {
          uint64_t v8 = v13(a1, 1LL);
          if (!(_DWORD)v8) {
            return 0LL;
          }
        }

        else
        {
          uint64_t v8 = 3758097090LL;
        }

        syslog(3, "UserCalibration_SetCalibrationData Power up Failed with %x\n");
        return v8;
      }

      return 0LL;
    }
  }

  else
  {
    free(v10);
    uint64_t v8 = 3758097095LL;
  }

  syslog(3, "UserCalibration_SetCalibrationData Failed with %x\n", v8);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(a1 + 2336);
  if (v15) {
    v15(a1, 1LL);
  }
  return v8;
}

uint64_t UserCalibration_WriteEAN(const void *a1, size_t a2)
{
  kern_return_t v8;
  size_t v9;
  void *v10;
  kern_return_t v11;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint64_t input[4];
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097090LL;
  int v5 = IOServiceMatching("AppleNVMeEAN");
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086B0], v5);
  if (MatchingService)
  {
    io_object_t v7 = MatchingService;
    io_connect_t connect = -1431655766;
    uint64_t v8 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    IOObjectRelease(v7);
    if (!v8)
    {
      uint64_t output = 0LL;
      uint32_t outputCnt = 1;
      uint64_t v9 = (a2 + 4095) & 0xFFFFFFFFFFFFF000LL;
      int v10 = aligned_alloc(0x1000uLL, v9);
      memcpy(v10, a1, a2);
      input[0] = 1430470988LL;
      input[1] = (uint64_t)v10;
      uint64_t input[2] = v9;
      __int128 v11 = IOConnectCallMethod(connect, 2u, input, 3u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      free(v10);
      if (v11) {
        syslog(3, "UserCalibration_WriteEAN EANSize write failed  input_buffer_size 0x%zx ret 0x%x \n", v9, v11);
      }
      else {
        uint64_t v4 = 0LL;
      }
      IOServiceClose(connect);
    }
  }

  return v4;
}

uint64_t IOMobileFrameBufferGetAutoLuminanceBoost(uint64_t a1, int *a2)
{
  if (!a1) {
    return 3758097090LL;
  }
  int v6 = -1;
  int v7 = -1431655766;
  uint64_t result = IOMobileFramebufferIsMainDisplay(a1, &v7);
  if (!(_DWORD)result)
  {
    if (v7)
    {
      int v5 = *(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, void, void))(a1 + 2656);
      if (v5)
      {
        uint64_t result = v5(a1, 119LL, &v6, 4LL, 0LL, 0LL);
        if (!(_DWORD)result) {
          *a2 = v6;
        }
      }

      else
      {
        return 3758097095LL;
      }
    }

    else
    {
      return 3758097126LL;
    }
  }

  return result;
}

BOOL isServicingTwoExternalDisplay(io_registry_entry_t a1)
{
  if (!a1) {
    return 0LL;
  }
  float v1 = (const __CFBoolean *)IORegistryEntrySearchCFProperty( a1,  "IOService",  @"IOMFBIntDcpUsedForExtWhenLidClose",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (!v1) {
    return 0LL;
  }
  float v2 = v1;
  BOOL v3 = CFBooleanGetValue(v1) != 0;
  CFRelease(v2);
  return v3;
}

void PackAndDispatchFrameInfoNotifictionData(uintptr_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 3336);
  unsigned int v5 = *(_DWORD *)(a1 + 3344);
  int v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    CFMutableDictionaryRef v8 = Mutable;
    unsigned int arg2 = a2;
    unsigned int arg2_4 = v5;
    unsigned int v9 = v4 & 0x7FFFFFFF;
    if ((v4 & 0x7FFFFFFF) != 0)
    {
      unsigned int v10 = 0;
      unsigned int v11 = 2;
      do
      {
        unsigned int v12 = 1 << v10;
        BOOL v13 = ((1 << v10) & v9) == 0;
        if (1 << v10 < v9 && ((1 << v10) & v9) == 0)
        {
          do
          {
            ++v10;
            int v15 = v9 & (2 * v12);
            v12 *= 2;
            BOOL v13 = v15 == 0;
          }

          while (v12 < v9 && !v15);
        }

        if (v13) {
          break;
        }
        if ((v4 & 0x80000000) != 0)
        {
          uint64_t v17 = *(void *)(a1 + 3336 + 8LL * v11++);
          uint64_t v16 = v17 | (*(void *)(a1 + 3336 + 8LL * v11) << 32);
        }

        else
        {
          uint64_t v16 = *(void *)(a1 + 8LL * v11 + 3336);
        }

        CFStringRef v18 = CFStringCreateWithCString(v6, *(const char **)(*(void *)(a1 + 1832) + 8LL * v10), 0x600u);
        uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
        uint64_t valuePtr = adjust_ni_timestamp(a1, *(char **)(*(void *)(a1 + 1832) + 8LL * v10), v16);
        CFNumberRef v19 = CFNumberCreate(v6, kCFNumberLongLongType, &valuePtr);
        CFNumberRef v20 = v19;
        if (v18) {
          BOOL v21 = v19 == 0LL;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21)
        {
          CFRelease(v8);
          if (v18) {
            CFRelease(v18);
          }
          if (v20) {
            goto LABEL_23;
          }
          return;
        }

        v9 ^= v12;
        ++v11;
        CFDictionarySetValue(v8, v18, v19);
        CFRelease(v20);
        CFRelease(v18);
      }

      while (v9);
    }

    if (*(_BYTE *)(a1 + 3264)) {
      kdebug_signpost(0x31800100u, a1, arg2, 0LL, 0LL);
    }
    (*(void (**)(uintptr_t, void, CFMutableDictionaryRef, void))(a1 + 1696))( a1,  arg2_4,  v8,  *(void *)(a1 + 1640));
    CFNumberRef v20 = v8;
LABEL_23:
    CFRelease(v20);
  }

uint64_t adjust_ni_timestamp(uint64_t a1, char *__s2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 1948) == 1) {
    return a3;
  }
  int v6 = "Issued_time";
  int v7 = off_189C59808;
  while (strcmp(v6, __s2))
  {
    CFMutableDictionaryRef v8 = *v7++;
    int v6 = v8;
    if (!v8) {
      return a3;
    }
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2744))(a1, a3);
}

uint64_t ioMobileFramebufferFinalize(uint64_t a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = a1 + 1328;
  do
  {
    uint64_t v4 = *(const void **)(v3 + v2);
    if (v4) {
      CFRelease(v4);
    }
    v2 += 8LL;
  }

  while (v2 != 32);
  uint64_t v5 = 0LL;
  int v6 = (CFMachPortRef *)(a1 + 1496);
  int v7 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  do
  {
    CFMutableDictionaryRef v8 = *(v6 - 5);
    if (v8) {
      IONotificationPortDestroy(v8);
    }
    *(v6 - 5) = 0LL;
    if (*v6)
    {
      CFMachPortInvalidate(*v6);
      CFRelease(*v6);
    }

    mach_port_name_t v9 = *((_DWORD *)v6 - 4);
    if (v9)
    {
      mach_port_mod_refs(*v7, v9, 1u, -1);
      *((_DWORD *)v6 - 4) = 0;
    }

    if (*(v6 - 1))
    {
      MEMORY[0x186E19550](*(unsigned int *)(a1 + 20), v5, *v7);
      *(v6 - 1) = 0LL;
    }

    ++v5;
    v6 += 8;
  }

  while (v5 != 6);
  io_connect_t v10 = *(_DWORD *)(a1 + 20);
  if (v10)
  {
    IOServiceClose(v10);
    *(_DWORD *)(a1 + 20) = 0;
  }

  unsigned int v11 = *(void **)(a1 + 1952);
  if (v11)
  {
    free(v11);
    *(void *)(a1 + 1952) = 0LL;
  }

  unsigned int v12 = *(const void **)(a1 + 1960);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(a1 + 1960) = 0LL;
  }

  BOOL v13 = *(const void **)(a1 + 2760);
  if (v13)
  {
    CFRelease(v13);
    *(void *)(a1 + 2760) = 0LL;
  }

  uint64_t v14 = *(const void **)(a1 + 2768);
  if (v14)
  {
    CFRelease(v14);
    *(void *)(a1 + 2768) = 0LL;
  }

  int v15 = *(const void **)(a1 + 2752);
  if (v15)
  {
    CFRelease(v15);
    *(void *)(a1 + 2752) = 0LL;
  }

  if (*(_BYTE *)(a1 + 1840))
  {
    uint64_t v16 = *(void **)(a1 + 1832);
    if (v16)
    {
      unint64_t v17 = *(unsigned int *)(a1 + 1844);
      if ((_DWORD)v17)
      {
        for (unint64_t i = 0LL; i < v17; ++i)
        {
          CFNumberRef v19 = *(void **)(*(void *)(a1 + 1832) + 8 * i);
          if (v19)
          {
            free(v19);
            unint64_t v17 = *(unsigned int *)(a1 + 1844);
          }
        }

        uint64_t v16 = *(void **)(a1 + 1832);
      }

      free(v16);
      *(void *)(a1 + 1832) = 0LL;
      *(_DWORD *)(a1 + 1844) = 0;
      *(_BYTE *)(a1 + 1840) = 0;
    }
  }

  CFNumberRef v20 = *(const void **)(a1 + 3320);
  if (v20)
  {
    CFRelease(v20);
    *(void *)(a1 + 3320) = 0LL;
  }

  BOOL v21 = *(const void **)(a1 + 3328);
  if (v21)
  {
    CFRelease(v21);
    *(void *)(a1 + 3328) = 0LL;
  }

  *(_DWORD *)(a1 + 3592) = 0;
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 1872));
}

CFStringRef ioMobileFramebufferCopyFormatDescription(const void *a1, const __CFDictionary *a2)
{
  CFIndex v4 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0LL, a2, @"<IOMobileFramebuffer %p refcnt=%d>", a1, v4);
}

uint64_t ioMobileFramebufferCopyDebugDescription()
{
  return 0LL;
}

double *__CGRectStandardize(double *result)
{
  double v1 = result[2];
  if (v1 < 0.0 || result[3] < 0.0)
  {
    double v2 = result[1];
    double v3 = fabs(v2);
    double v4 = 0.0;
    BOOL v5 = fabs(*result) == INFINITY || v3 == INFINITY;
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    if (!v5)
    {
      double v9 = result[3];
      if (v1 >= 0.0) {
        double v6 = result[2];
      }
      else {
        double v6 = -v1;
      }
      if (v1 >= 0.0) {
        double v1 = -0.0;
      }
      double v8 = *result + v1;
      if (v9 >= 0.0) {
        double v4 = result[3];
      }
      else {
        double v4 = -v9;
      }
      if (v9 >= 0.0) {
        double v10 = -0.0;
      }
      else {
        double v10 = result[3];
      }
      double v7 = v2 + v10;
    }

    *uint64_t result = v8;
    result[1] = v7;
    result[2] = v6;
    result[3] = v4;
  }

  return result;
}

uint64_t core_analytics_send_data(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(void *)(a1 + 1976))
  {
    pthread_once(&open_core_analytics_s_ca_once, find_core_analytics);
    uint64_t v6 = s_core_analytics_send_event_fn;
    *(void *)(a1 + 1976) = s_core_analytics_send_event_fn;
    *(void *)(a1 + 1984) = s_core_analytics_lib;
    if (!v6) {
      return 0LL;
    }
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v7) {
    return 0LL;
  }
  double v8 = v7;
  switch(a2)
  {
    case 0:
      goto LABEL_29;
    case 1:
      if (!core_analytics_dict_insert(a1, @"CurrentCode", v7)
        || !core_analytics_dict_insert(a1, @"TimezeroDelta", v8)
        || !core_analytics_dict_insert(a1, @"SaturatePositiveCount", v8)
        || !core_analytics_dict_insert(a1, @"SaturateNegativeCount", v8)
        || !core_analytics_dict_insert(a1, @"SageUIImageType", v8)
        || !core_analytics_dict_insert(a1, @"SageUIBrightness", v8)
        || !core_analytics_dict_insert(a1, @"SageUIBrightnessDim", v8)
        || !core_analytics_dict_insert(a1, @"SageFCMTemp", v8)
        || !core_analytics_dict_insert(a1, @"SageSIPTemp", v8)
        || !core_analytics_dict_insert(a1, @"SageFCMSIPTempDelta", v8)
        || !core_analytics_dict_insert(a1, @"SageExpectedVoltPerNit", v8)
        || !core_analytics_dict_insert(a1, @"SageMeasuredVoltPerNit", v8))
      {
        goto LABEL_32;
      }

      double v9 = @"SageVoltDeltaPct";
      break;
    case 2:
      if (!core_analytics_dict_insert(a1, @"SageUIImageType", v7)
        || !core_analytics_dict_insert(a1, @"SageUIBrightness", v8)
        || !core_analytics_dict_insert(a1, @"SageFCMTemp", v8)
        || !core_analytics_dict_insert(a1, @"SageSIPTemp", v8)
        || (core_analytics_dict_insert(a1, @"SageFCMSIPTempDelta", v8) & 1) == 0
        || !core_analytics_dict_insert(a1, @"SageUpdateStatus", v8))
      {
        goto LABEL_32;
      }

      goto LABEL_31;
    case 3:
      double v9 = @"Time";
      break;
    case 4:
      char v11 = core_analytics_dict_insert(a1, @"decomp_fail", v7);
      char v12 = core_analytics_dict_insert(a1, @"downscale_fail", v8);
      if ((v11 & 1) != 0 || (v12 & 1) != 0) {
        goto LABEL_31;
      }
LABEL_29:
      double v9 = @"underrun";
      break;
    default:
      goto LABEL_32;
  }

  if ((core_analytics_dict_insert(a1, v9, v8) & 1) != 0)
  {
LABEL_31:
    (*(void (**)(uint64_t, void *))(a1 + 1976))(a3, v8);
    uint64_t v10 = 1LL;
  }

  else
  {
LABEL_32:
    uint64_t v10 = 0LL;
  }

  xpc_release(v8);
  return v10;
}

uint64_t core_analytics_dict_insert(uint64_t a1, const __CFString *a2, void *a3)
{
  if (a1)
  {
    double v3 = *(uint64_t (**)(void))(a1 + 2024);
    if (v3)
    {
      uint64_t v6 = v3();
      if (v6)
      {
        xpc_object_t v7 = (const void *)v6;
        CStringPtr = CFStringGetCStringPtr(a2, 0);
        uint64_t valuePtr = 0LL;
        CFTypeID v9 = CFGetTypeID(v7);
        if (v9 == CFBooleanGetTypeID())
        {
          if (CFBooleanGetValue((CFBooleanRef)v7))
          {
            uint64_t v10 = 1LL;
            xpc_dictionary_set_uint64(a3, CStringPtr, 1uLL);
LABEL_12:
            CFRelease(v7);
            return v10;
          }
        }

        else
        {
          CFTypeID v11 = CFGetTypeID(v7);
          if (v11 == CFNumberGetTypeID() && CFNumberGetValue((CFNumberRef)v7, kCFNumberSInt64Type, &valuePtr))
          {
            xpc_dictionary_set_uint64(a3, CStringPtr, valuePtr);
            uint64_t v10 = 1LL;
            goto LABEL_12;
          }
        }

        uint64_t v10 = 0LL;
        goto LABEL_12;
      }
    }
  }

  return 0LL;
}

void find_core_analytics()
{
  uint64_t v0 = dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 2);
  s_core_analytics_lib = (uint64_t)v0;
  if (v0)
  {
    s_core_analytics_send_event_fn = (uint64_t)dlsym(v0, "analytics_send_event");
    if (s_core_analytics_send_event_fn) {
      return;
    }
  }

  else
  {
    syslog(3, "IOMFB: %s not found\n", "/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics");
  }

  syslog(3, "IOMFB: %s not found\n", "analytics_send_event");
}

uint64_t setIdleBuffer(uint64_t a1, IOSurfaceRef buffer)
{
  uint64_t v2 = 3758097090LL;
  if (buffer)
  {
    if (IOSurfaceGetPlaneCount(buffer) < 2)
    {
      size_t Width = IOSurfaceGetWidth(buffer);
      size_t Height = IOSurfaceGetHeight(buffer);
    }

    else
    {
      size_t Width = IOSurfaceGetWidthOfPlane(buffer, 0LL);
      size_t Height = IOSurfaceGetHeightOfPlane(buffer, 0LL);
    }

    unint64_t v7 = Height;
    if (a1)
    {
      double v8 = *(uint64_t (**)(uint64_t, int *))(a1 + 2200);
      if (v8)
      {
        int v11 = -1431655766;
        uint64_t v2 = v8(a1, &v11);
        if (!(_DWORD)v2)
        {
          uint64_t v10 = *(uint64_t (**)(uint64_t, void, IOSurfaceRef, void, double, double, double, double, double, double, double, double))(a1 + 2032);
          uint64_t v2 = 3758097090LL;
          if (v10)
          {
            uint64_t v2 = v10(a1, 0LL, buffer, 0LL, 0.0, 0.0, (double)Width, (double)v7, 0.0, 0.0, (double)Width, (double)v7);
            if (!(_DWORD)v2)
            {
              *(_DWORD *)(a1 + 404) = 8;
              *(_DWORD *)(a1 + 360) |= 1u;
            }
          }
        }
      }
    }
  }

  return v2;
}

IONotificationPort *IOMobileFramebufferHotPlugNotifyFunc( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t result = iomfb_GetMachMessageCount(*(IONotificationPort **)(a1 + 1456));
  if ((int)result <= 0)
  {
    double v8 = *(uint64_t (**)(uint64_t, unint64_t, void))(a1 + 1504);
    if (v8) {
      return (IONotificationPort *)v8(a1, a3 | (unint64_t)(a4 << 32), *(void *)(a1 + 1448));
    }
  }

  return result;
}

IONotificationPort *IOMobileFramebufferPowerNotifyFunc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_OWORD *)(a1 + 1360) = 0u;
  uint64_t result = iomfb_GetMachMessageCount(*(IONotificationPort **)(a1 + 1520));
  if ((int)result <= 0) {
    return (IONotificationPort *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 1568))( a1,  a3,  a4,  *(void *)(a1 + 1512));
  }
  return result;
}

void FrameInfoNotifyFunc(uintptr_t a1, uint64_t a2, uint64_t *a3, unsigned int a4)
{
  if (a4 > 1)
  {
    uint64_t v7 = *a3;
    unsigned int v8 = *((_DWORD *)a3 + 2);
    CFTypeID v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    if (Mutable)
    {
      CFMutableDictionaryRef v11 = Mutable;
      unsigned int v28 = v8;
      int v29 = v7;
      unsigned int v12 = v7 & 0x7FFFFFFF;
      if ((v7 & 0x7FFFFFFF) != 0)
      {
        unsigned int v13 = 0;
        unsigned int v14 = 0;
        int v15 = a3 + 2;
        unsigned int v30 = a4 - 2;
        uint64_t v16 = v15;
        do
        {
          unsigned int v17 = 1 << v13;
          BOOL v18 = ((1 << v13) & v12) == 0;
          if (1 << v13 < v12 && ((1 << v13) & v12) == 0)
          {
            do
            {
              ++v13;
              int v20 = v12 & (2 * v17);
              v17 *= 2;
              BOOL v18 = v20 == 0;
            }

            while (v17 < v12 && !v20);
          }

          if (v18) {
            break;
          }
          CFStringRef v21 = CFStringCreateWithCString(v9, *(const char **)(*(void *)(a1 + 1832) + 8LL * v13), 0x600u);
          uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
          if (v14 >= v30)
          {
            uint64_t v23 = 0LL;
          }

          else
          {
            unsigned int v22 = v14 + 1;
            uint64_t v23 = v15[v14];
            if (v29 < 0)
            {
              v14 += 2;
              v23 |= v15[v22] << 32;
            }

            else
            {
              ++v14;
            }
          }

          uint64_t valuePtr = adjust_ni_timestamp(a1, *(char **)(*(void *)(a1 + 1832) + 8LL * v13), v23);
          CFNumberRef v24 = CFNumberCreate(v9, kCFNumberLongLongType, &valuePtr);
          CFNumberRef v25 = v24;
          if (v21) {
            BOOL v26 = v24 == 0LL;
          }
          else {
            BOOL v26 = 1;
          }
          if (v26)
          {
            CFRelease(v11);
            if (v21) {
              CFRelease(v21);
            }
            if (v25)
            {
              CFNumberRef v27 = v25;
              goto LABEL_27;
            }

            return;
          }

          v12 ^= v17;
          CFDictionarySetValue(v11, v21, v24);
          CFRelease(v25);
          CFRelease(v21);
          int v15 = v16;
        }

        while (v12);
      }

      if (*(_BYTE *)(a1 + 3264)) {
        kdebug_signpost(0x31800100u, a1, 0LL, 0LL, 0LL);
      }
      (*(void (**)(uintptr_t, void, CFMutableDictionaryRef, void))(a1 + 1696))( a1,  v28,  v11,  *(void *)(a1 + 1640));
      CFNumberRef v27 = v11;
LABEL_27:
      CFRelease(v27);
    }
  }

  else
  {
    syslog(3, "IOMFB: FrameInfoNotifyFunc dropped notification, numArgs is %u, expected %u", a4, 2);
  }

void IOMobileFramebufferCRCNotifyFunc(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  if (a4 == 3)
  {
    double v4 = *(void (**)(uint64_t, void, void, void, void))(a1 + 1760);
    if (v4) {
      v4(a1, *a3, a3[2], a3[4], *(void *)(a1 + 1704));
    }
  }

  else
  {
    syslog(3, "not enough values for callback %d != %d\n", a4, 3);
  }

IONotificationPort *IOMobileFramebufferVsyncNotifyFunc(IONotificationPort *arg1, uint64_t a2, void *a3)
{
  if (arg1)
  {
    double v4 = arg1;
    if (*((_BYTE *)arg1 + 3264)) {
      kdebug_signpost(0x31800100u, (uintptr_t)arg1, 0LL, 0LL, 0LL);
    }
    arg1 = iomfb_GetMachMessageCount(*((IONotificationPort **)v4 + 222));
    if (!(_DWORD)arg1)
    {
      uint64_t v5 = *a3 | (a3[1] << 32);
      uint64_t v6 = (*((uint64_t (**)(IONotificationPort *, void))v4 + 343))(v4, a3[2] | (a3[3] << 32));
      return (IONotificationPort *)(*((uint64_t (**)(IONotificationPort *, uint64_t, uint64_t, void, void))v4
                                    + 228))( v4,  v5,  v6,  a3[4] | (a3[5] << 32),  *((void *)v4 + 221));
    }
  }

  return arg1;
}

IONotificationPort *iomfb_GetMachMessageCount(IONotificationPort *result)
{
  if (result)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v1 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)port_info_out = v1;
    __int128 v6 = v1;
    mach_msg_type_number_t port_info_outCnt = 10;
    ipc_space_inspect_t v2 = *MEMORY[0x1895FBBE0];
    mach_port_t MachPort = IONotificationPortGetMachPort(result);
    if (mach_port_get_attributes(v2, MachPort, 2, port_info_out, &port_info_outCnt)) {
      return 0LL;
    }
    else {
      return (IONotificationPort *)v6;
    }
  }

  return result;
}

void FrameInfoNotifyFuncIOShq(uint64_t a1, uint64_t a2, uint64_t a3, uintptr_t a4)
{
  uint32_t dataSize = 0;
  double v4 = *(IODataQueueMemory **)(a4 + 1680);
  if (v4)
  {
    __int128 v6 = IODataQueuePeek(v4);
    if (v6)
    {
      unint64_t v7 = v6;
      unsigned int v8 = 1;
      do
      {
        memcpy((void *)(a4 + 3336), v7->data, v7->size);
        PackAndDispatchFrameInfoNotifictionData(a4, v8);
        IODataQueueDequeue(*(IODataQueueMemory **)(a4 + 1680), 0LL, &dataSize);
        unint64_t v7 = IODataQueuePeek(*(IODataQueueMemory **)(a4 + 1680));
        ++v8;
      }

      while (v7);
    }
  }

  else
  {
    syslog(3, "FrameInfoNotifyFunc IO Data Queue not available");
  }

IONotificationPort *IOMobileFramebufferHdcpNotifyFunc(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = iomfb_GetMachMessageCount(*(IONotificationPort **)(a1 + 1584));
  if ((int)result <= 0)
  {
    __int128 v6 = *(uint64_t (**)(uint64_t, void, BOOL))(a1 + 1632);
    if (v6) {
      return (IONotificationPort *)v6(a1, *(void *)(a1 + 1576), a3 != 0);
    }
  }

  return result;
}

void *get_vsh_update_status(void *result)
{
  if (result)
  {
    __int128 v1 = (uint64_t (*)(void))result[253];
    if (v1)
    {
      uint64_t result = (void *)v1();
      if (result)
      {
        ipc_space_inspect_t v2 = result;
        uint64_t valuePtr = 0LL;
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, &valuePtr);
        CFRelease(v2);
        return (void *)valuePtr;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void iomfb_populate_all_display_infos()
{
  if (iomfb_populate_all_display_infos_onceToken != -1) {
    dispatch_once(&iomfb_populate_all_display_infos_onceToken, &__block_literal_global);
  }
  int v0 = s_number_display_pipes;
  int v1 = s_number_display_instances;
  if (s_number_display_pipes < s_number_display_instances)
  {
    syslog( 3,  "%s: Reference FB count = %d < Enumerated FB count = %d - shouldn't happen - error\n",  "iomfb_populate_all_display_infos",  s_number_display_pipes,  s_number_display_instances);
    int v0 = s_number_display_pipes;
    int v1 = s_number_display_instances;
  }

  if (v0 == v1) {
    syslog(3, "%s: All Display Instances enumerated successfully - FB Count = %d\n");
  }
  else {
    syslog(3, "%s: All display instances are NOT enumerated: Disp_len %d, Ref_FB = %d, Act_FB = %d\n");
  }
}

void __iomfb_populate_all_display_infos_block_invoke()
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock(&s_cond_mutex);
  if (!s_number_display_pipes)
  {
    uint64_t v0 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/arm-io");
    if ((_DWORD)v0)
    {
      io_object_t v1 = v0;
      io_iterator_t iterator = 0;
      else {
        BOOL v2 = iterator == 0;
      }
      if (!v2)
      {
        io_object_t v3 = IOIteratorNext(iterator);
        if (v3)
        {
          io_object_t v4 = v3;
          uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          do
          {
            __int128 v6 = CFStringCreateWithCString(v5, "device_type", 0x600u);
            if (v6)
            {
              unint64_t v7 = v6;
              unsigned int v8 = (const __CFData *)IORegistryEntrySearchCFProperty(v4, "IODeviceTree", v6, v5, 0);
              if (v8)
              {
                CFTypeID v9 = v8;
                *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)&buffer[16] = v10;
                __int128 v28 = v10;
                *(_OWORD *)buffer = v10;
                else {
                  v11.length = 48LL;
                }
                v11.location = 0LL;
                CFDataGetBytes(v9, v11, buffer);
                BOOL v13 = *(void *)buffer == 0x2D79616C70736964LL
                   && *(void *)&buffer[8] == 0x6574737973627573LL
                   && buffer[16] == 109;
                if (v13
                  || (*(void *)buffer == 0x707369642D747865LL
                    ? (BOOL v14 = *(void *)&buffer[8] == 0x736275732D79616CLL)
                    : (BOOL v14 = 0),
                      v14 ? (BOOL v15 = *(void *)&buffer[13] == 0x6D65747379736275LL) : (BOOL v15 = 0),
                      v15))
                {
                  ++s_number_display_pipes;
                }

                CFRelease(v9);
              }

              CFRelease(v7);
            }

            uint64_t v16 = CFStringCreateWithCString(v5, "compatible", 0x600u);
            if (v16)
            {
              unsigned int v17 = v16;
              BOOL v18 = (const __CFData *)IORegistryEntrySearchCFProperty(v4, "IODeviceTree", v16, v5, 0);
              if (v18)
              {
                CFNumberRef v19 = v18;
                *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)&buffer[16] = v20;
                __int128 v28 = v20;
                *(_OWORD *)buffer = v20;
                else {
                  v21.length = 48LL;
                }
                v21.location = 0LL;
                CFDataGetBytes(v19, v21, buffer);
                if (*(void *)buffer == 0x7472697661726170LL
                  && *(void *)&buffer[8] == 0x6764657A696C6175LL
                  && *(void *)&buffer[16] == 0x2C73636968706172LL
                  && *(void *)&buffer[19] == 0x7570672C73636968LL)
                {
                  syslog(3, "%s: compatible: %s \n", "getDisplayListNumber", buffer);
                  ++s_number_display_pipes;
                }

                CFRelease(v19);
              }

              CFRelease(v17);
            }

            io_object_t v4 = IOIteratorNext(iterator);
          }

          while (v4);
        }

        IOObjectRelease(iterator);
      }

      IOObjectRelease(v1);
    }

    else
    {
      syslog(3, "%s: IORegistryEntryFromPath unable to find /arm-io node\n", "getDisplayListNumber");
    }
  }

  syslog(6, "%s: %d\n", "getDisplayListNumber", s_number_display_pipes);
  pthread_mutex_unlock(&s_cond_mutex);
  if (s_number_display_pipes > s_number_display_instances)
  {
    *(void *)buffer = 0xAAAAAAAAAAAAAAAALL;
    pthread_mutex_lock(&s_thr_init_mutex);
    int v25 = pthread_create((pthread_t *)buffer, 0LL, (void *(__cdecl *)(void *))iomfb_populate_thread, 0LL);
    pthread_dependency_init_np();
    pthread_mutex_unlock(&s_thr_init_mutex);
    syslog( 3,  "%s: Spawn separate thread and wait for all FBs to be enumerated\n",  "iomfb_populate_all_display_infos_block_invoke");
    if (v25) {
      syslog(3, "%s: pthread_create error %d\n", "iomfb_populate_all_display_infos_block_invoke", v25);
    }
    pthread_detach(*(pthread_t *)buffer);
    syslog( 3,  "%s: pthread_dependency_wait_np expect: %d current: %d \n",  "iomfb_populate_all_display_infos_block_invoke",  s_number_display_pipes,  s_number_display_instances);
    pthread_dependency_wait_np();
    if (s_number_display_pipes != s_number_display_instances) {
      syslog( 3,  "%s: Timeout: expect: %d current: %d\n",  "iomfb_populate_all_display_infos_block_invoke",  s_number_display_pipes,  s_number_display_instances);
    }
  }

uint64_t iomfb_populate_thread()
{
  io_iterator_t notification = 0;
  pthread_mutex_lock(&s_display_infos_mutex);
  if (!s_display_infos_len
    && (s_notification_port_0 || (s_notification_port_0 = (uint64_t)IONotificationPortCreate(*MEMORY[0x1896086A8])) != 0))
  {
    io_object_t v1 = IOServiceMatching("IOMobileFramebuffer");
    if (v1)
    {
      if (!IOServiceAddMatchingNotification( (IONotificationPortRef)s_notification_port_0,  "IOServiceFirstMatch",  v1,  (IOServiceMatchingCallback)iomfb_match_callback,  0LL,  &notification))
      {
        CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)s_notification_port_0);
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1896051A8]);
        if (s_virt_context_len)
        {
          unsigned int v4 = s_display_infos_len;
          if (s_display_infos_len <= 0xF)
          {
            unsigned int v5 = 1;
            __int128 v6 = (const __CFAllocator *)*MEMORY[0x189604DC8];
            do
            {
              unint64_t v7 = &s_display_infos[20 * v4];
              uint64_t v7[2] = v5 - 1;
              snprintf((char *)v7 + 24, 0x80uLL, "%s%d", "wireless", v5 - 1);
              *unint64_t v7 = (uint64_t)CFStringCreateWithCStringNoCopy(0LL, (const char *)v7 + 24, 0x600u, v6);
              *((_DWORD *)v7 + 2) = 2;
              int v8 = s_display_infos_len;
              s_displays[s_display_infos_len] = v7;
              unsigned int v4 = v8 + 1;
              s_display_infos_len = v4;
            }

            while (v4 <= 0xF && v5++ < s_virt_context_len);
          }
        }
      }
    }
  }

  pthread_mutex_unlock(&s_display_infos_mutex);
  if (notification)
  {
    syslog(3, "%s: Local call to iomfb_match_callback\n", "iomfb_populate_matched_displays");
    iomfb_match_callback(v0, notification);
  }

  pthread_mutex_unlock(&s_thr_init_mutex);
  if (s_number_display_pipes != s_number_display_instances)
  {
    syslog(3, "%s: Start Runloop for 30 seconds\n", "iomfb_populate_thread");
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x1896051B0], 30.0, 1u);
    pthread_mutex_lock(&s_cond_mutex);
    if (s_number_display_pipes == s_number_display_instances)
    {
      syslog( 3,  "%s: Runloop Timer expired: FBs enumerated, no signalling needed from here as Callback would have notified main thread\n");
    }

    else if ((s_thread_notified & 1) != 0)
    {
      syslog(3, "%s: Runloop Timer expired: FB mismatch but still main thread notified - so avoiding notify here\n");
    }

    else
    {
      s_thread_notified = 1;
      syslog(3, "%s: Runloop Timer expired: FB still not enumerated, notify main thread\n", "iomfb_populate_thread");
      pthread_dependency_fulfill_np();
    }

    pthread_mutex_unlock(&s_cond_mutex);
  }

  return 0LL;
}

void open_media_toolbox()
{
  char v0 = 0;
  uint64_t v1 = 0LL;
  char v2 = 1;
  do
  {
    while (1)
    {
      char v3 = v2;
      unsigned int v4 = (&off_189C59958)[v1];
      unsigned int v5 = dlopen(v4, 2);
      if (v5) {
        break;
      }
      syslog(3, "IOMFB: %s not found\n", v4);
      char v2 = 0;
      uint64_t v1 = 1LL;
      char v0 = 1;
      if ((v3 & 1) == 0) {
        goto LABEL_10;
      }
    }

    __int128 v6 = v5;
    unint64_t v7 = (void (*)(void))dlsym(v5, "FigInstallVirtualDisplay");
    int v8 = v7;
    if (v7) {
      v7();
    }
    dlclose(v6);
    char v2 = 0;
    char v9 = (v8 != 0LL) | v0;
    char v0 = 1;
    uint64_t v1 = 1LL;
  }

  while ((v9 & 1) == 0);
  if (v8) {
    return;
  }
LABEL_10:
  syslog(3, "IOMFB: FigInstallVirtualDisplay not found\n");
}

uint64_t iomfb_match_callback(uint64_t a1, io_iterator_t a2)
{
  unsigned int v2 = s_display_infos_len;
  if (s_display_infos_len <= 0xF)
  {
    char v3 = &s_display_infos;
    unsigned int v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    contentsDeallocator = (const __CFAllocator *)*MEMORY[0x189604DC8];
    do
    {
      io_object_t v5 = IOIteratorNext(a2);
      if (!v5) {
        break;
      }
      io_registry_entry_t v6 = v5;
      unint64_t v7 = v3;
      int v8 = (const __CFBoolean *)IORegistryEntrySearchCFProperty(v5, "IOService", @"dfr", v4, 0);
      if (v8)
      {
        char v9 = v8;
        BOOL v10 = CFBooleanGetValue(v8) != 0;
        CFRelease(v9);
      }

      else
      {
        BOOL v10 = 0;
      }

      CFRange v11 = (const __CFBoolean *)IORegistryEntrySearchCFProperty(v6, "IOService", @"AppleTV", v4, 0);
      if (v11 && (unsigned int v12 = v11, Value = CFBooleanGetValue(v11), CFRelease(v12), Value))
      {
        BOOL v14 = 1;
      }

      else
      {
        BOOL v15 = (const __CFBoolean *)IORegistryEntrySearchCFProperty(v6, "IOService", @"external", v4, 0);
        if (v15)
        {
          uint64_t v16 = v15;
          BOOL v14 = CFBooleanGetValue(v15) != 0;
          CFRelease(v16);
        }

        else
        {
          BOOL v14 = 0;
        }
      }

      char v3 = v7;
      unsigned int v17 = &v7[20 * v2];
      *((_DWORD *)v17 + 5) = v6;
      BOOL v18 = !v14 && !v10;
      *((_BYTE *)v17 + 152) = v18;
      if (!v10)
      {
        if (v14)
        {
          io_registry_entry_t parent = -1431655766;
          IORegistryEntryGetParentEntry(v6, "IOService", &parent);
          *(_DWORD *)buffer = 0;
          __int128 v20 = (const __CFData *)IORegistryEntrySearchCFProperty(parent, "IOService", @"external", v4, 0);
          if (v20)
          {
            CFRange v21 = v20;
            v35.location = 0LL;
            v35.length = 4LL;
            CFDataGetBytes(v20, v35, buffer);
            CFRelease(v21);
            int v22 = *(_DWORD *)buffer - 1;
            char v3 = v7;
            LODWORD(v7[20 * v2 + 2]) = *(_DWORD *)buffer - 1;
            ++iomfb_match_callback_s_num;
          }

          else
          {
            char v3 = v7;
            int v22 = v7[20 * v2 + 2];
          }

          snprintf((char *)&v3[20 * v2 + 3], 0x80uLL, "%s-%d", "external", v22);
          syslog(3, "%s: %s\n", "iomfb_match_callback", (const char *)&v3[20 * v2 + 3]);
        }

        else
        {
          uint64_t v23 = &v7[20 * v2];
          v23[3] = 0x7972616D697270LL;
          v23 += 3;
          *((_DWORD *)v23 - 2) = 0;
          syslog(3, "%s: %s\n", "iomfb_match_callback", (const char *)v23);
        }
      }

      else
      {
        CFNumberRef v19 = &v7[20 * v2];
        *((_DWORD *)v19 + 4) = 0;
        *((_DWORD *)v19 + 6) = 7497316;
      }

      CFNumberRef v24 = &v3[20 * v2];
      *CFNumberRef v24 = (uint64_t)CFStringCreateWithCStringNoCopy(0LL, (const char *)v24 + 24, 0x600u, contentsDeallocator);
      if (v10) {
        int v25 = 3;
      }
      else {
        int v25 = v14;
      }
      *((_DWORD *)v24 + 2) = v25;
      int v26 = s_display_infos_len;
      s_displays[s_display_infos_len] = v24;
      unsigned int v2 = v26 + 1;
      s_display_infos_len = v26 + 1;
      if (!v10)
      {
        if (isServicingTwoExternalDisplay(v6) && !*((_DWORD *)v24 + 2))
        {
          CFNumberRef v27 = &v3[20 * s_display_infos_len];
          int v28 = iomfb_match_callback_s_num++;
          *((_DWORD *)v27 + 4) = v28;
          snprintf((char *)v27 + 24, 0x80uLL, "%s-%d", "external", v28);
          *((_DWORD *)v27 + 5) = v6;
          *((_BYTE *)v27 + 152) = v18;
          syslog(3, "%s: %s service is 0x%x\n", "iomfb_match_callback", (const char *)v27 + 24, v6);
          *CFNumberRef v27 = (uint64_t)CFStringCreateWithCStringNoCopy(0LL, (const char *)v27 + 24, 0x600u, contentsDeallocator);
          *((_DWORD *)v27 + 2) = 1;
          int v29 = s_display_infos_len;
          s_displays[s_display_infos_len] = v27;
          s_display_infos_len = v29 + 1;
          ++s_number_display_instances;
          ++s_number_display_pipes;
        }

        pthread_mutex_lock(&s_cond_mutex);
        if (s_number_display_pipes == ++s_number_display_instances && (s_thread_notified & 1) == 0)
        {
          s_thread_notified = 1;
          syslog(3, "%s: Notify main thread as all FB callbacks hit\n", "iomfb_match_callback");
          pthread_dependency_fulfill_np();
        }

        pthread_mutex_unlock(&s_cond_mutex);
        unsigned int v2 = s_display_infos_len;
      }
    }

    while (v2 < 0x10);
  }

  return pthread_mutex_unlock(&s_display_infos_mutex);
}

void setIntValue(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

uint64_t virt_GetSupportedDigitalOutModes(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 2792) + 8LL))(*(void *)(a1 + 2784));
}

uint64_t virt_SetDigitalOutMode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  io_registry_entry_t v6 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (!*(_BYTE *)(a1 + 1376)) {
    *(_OWORD *)(a1 + 1360) = 0u;
  }
  syslog(5, "IOMFB setting virtual mode: %d %d\n", a2, a3);
  uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 2792) + 16LL))( *(void *)(a1 + 2784),  a2,  a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t virt_GetLayerDefaultSurface(uint64_t a1, int a2, void *a3)
{
  if (a2) {
    return 3758097084LL;
  }
  uint64_t result = 0LL;
  *a3 = *(void *)(a1 + 1328);
  return result;
}

uint64_t virt_GetDisplaySize(uint64_t a1, _OWORD *a2)
{
  unsigned int v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  CFNumberRef v5 = (_OWORD *)(a1 + 1360);
  *a2 = *v5;
  pthread_mutex_unlock(v4);
  return 0LL;
}

CFTypeRef virt_CopyProperty(void *a1, void *key)
{
  unsigned int v4 = (const __CFDictionary *)a1[344];
  if (v4)
  {
    int Value = CFDictionaryGetValue(v4, key);
    if (Value) {
      return CFRetain(Value);
    }
  }

  uint64_t v7 = *(uint64_t (**)(void, void *))(a1[349] + 136LL);
  if (v7) {
    return (CFTypeRef)v7(a1[348], key);
  }
  else {
    return 0LL;
  }
}

uint64_t virt_SwapSetLayer( uint64_t a1, unsigned int a2, __IOSurface *a3, int a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  uint64_t v13 = 3758097084LL;
  uint64_t result = 3758097090LL;
  if (a1 && a2 <= 3)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
    if (a3)
    {
      uint64_t v26 = 0LL;
      while (!*(_DWORD *)(a1 + 180 + v26))
      {
        v26 += 4LL;
        if (v26 == 16)
        {
          IOSurfaceID ID = IOSurfaceGetID(a3);
          uint64_t v13 = 0LL;
          uint64_t v28 = a1 + 24 + 4LL * a2;
          *(_DWORD *)(v28 + 156) = ID;
          *(_DWORD *)(v28 + 348) = a4;
          int v29 = (_DWORD *)(a1 + 24 + 16LL * a2);
          v29[43] = (int)a5;
          v29[44] = (int)a6;
          v29[45] = (int)a7;
          v29[46] = (int)a8;
          v29[67] = (int)a9;
          v29[68] = (int)a10;
          v29[69] = (int)a11;
          v29[70] = (int)a12;
          break;
        }
      }
    }

    else
    {
      uint64_t v13 = 0LL;
      *(_DWORD *)(a1 + 4LL * a2 + 180) = 0;
    }

    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 1872));
    return v13;
  }

  return result;
}

uint64_t virt_SwapSetEventWait()
{
  return 0LL;
}

uint64_t virt_SwapSetEventSignalOnGlass()
{
  return 0LL;
}

uint64_t virt_SwapSetEventSignal()
{
  return 0LL;
}

uint64_t virt_SwapDebugInfo()
{
  return 3758097095LL;
}

uint64_t virt_SwapBegin(uint64_t a1, int *a2)
{
  unsigned int v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  int v5 = *(_DWORD *)(a1 + 2776);
  else {
    int v6 = 1;
  }
  *(_DWORD *)(a1 + 2776) = v6;
  *(_BYTE *)(a1 + 3208) = 0;
  bzero((void *)(a1 + 24), 0x514uLL);
  uint64_t v7 = *(unsigned int **)(a1 + 3216);
  if (v7)
  {
    IOMFBGainMapRelease(a1, v7);
    *(void *)(a1 + 3216) = 0LL;
    int v6 = *(_DWORD *)(a1 + 2776);
  }

  *(_DWORD *)(a1 + 176) = v6;
  *a2 = v6;
  pthread_mutex_unlock(v4);
  return 0LL;
}

uint64_t virt_SwapEnd(uint64_t a1)
{
  unsigned int v2 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (*(_BYTE *)(a1 + 3208))
  {
    uint64_t v3 = 3758097084LL;
    syslog(6, "IOMFB: ignoring cancelled swap\n");
    goto LABEL_3;
  }

  uint64_t v5 = *(void *)(a1 + 24);
  if (!v5) {
    uint64_t v5 = mach_absolute_time();
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2736))(a1, v5);
  uint64_t v7 = 0LL;
  while (!*(_DWORD *)(a1 + 4 * v7 + 180))
  {
    if (++v7 == 4)
    {
      LODWORD(v7) = 0;
      break;
    }
  }

  uint64_t v8 = a1 + 4LL * v7;
  uint64_t v9 = *(unsigned int *)(v8 + 180);
  if (!(_DWORD)v9)
  {
LABEL_17:
    unsigned int v12 = (int *)(a1 + 24 + 16LL * v7);
    uint64_t v3 = (*(uint64_t (**)(void, void, uint64_t, void, uint64_t, void, double, double, double, double, double, double, double, double))(*(void *)(a1 + 2792) + 24LL))( *(void *)(a1 + 2784),  0LL,  v9,  *(unsigned int *)(a1 + 176),  v6,  *(unsigned int *)(a1 + 24 + 4LL * v7 + 348),  (double)v12[43],  (double)v12[44],  (double)v12[45],  (double)v12[46],  (double)v12[67],  (double)v12[68],  (double)v12[69],  (double)v12[70]);
    if (*(_DWORD *)(a1 + 2816)) {
      ++*(void *)(a1 + 2808);
    }
    if (!(_DWORD)v9) {
      goto LABEL_3;
    }
    goto LABEL_22;
  }

  IOSurfaceRef v10 = IOSurfaceLookup(*(_DWORD *)(v8 + 180));
  if (v10)
  {
    IOSurfaceRef v11 = v10;
    IOSurfaceSetTimestamp();
    if (*(void *)(a1 + 32))
    {
      (*(void (**)(uint64_t))(a1 + 2736))(a1);
      IOSurfaceSetTimestamp();
    }

    if (*(void *)(a1 + 40))
    {
      (*(void (**)(uint64_t))(a1 + 2736))(a1);
      IOSurfaceSetTimestamp();
    }

    CFRelease(v11);
    goto LABEL_17;
  }

  uint64_t v3 = 3758097084LL;
  syslog(3, "IOMFB: surface lookup failure for id: %d\n", v9);
LABEL_22:
  uint64_t v13 = a1 + 2824;
  uint64_t v14 = -1LL;
  while (*(_DWORD *)(v13 + 8) != (_DWORD)v9)
  {
    v13 += 24LL;
  }

  (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 2792) + 128LL))( *(void *)(a1 + 2784),  v9,  *(void *)(v13 + 16),  v3);
  if (*(void *)v13) {
    CFRelease(*(CFTypeRef *)v13);
  }
  *(void *)uint64_t v13 = 0LL;
  *(void *)(v13 + 8) = 0LL;
  *(void *)(v13 + 16) = 0LL;
LABEL_3:
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t virt_SwapSignal()
{
  return 3758097084LL;
}

uint64_t virt_SwapWait(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 2792) + 32LL))(*(void *)(a1 + 2784), 0.0);
}

uint64_t virt_SwapWaitWithTimeout(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 2792) + 32LL))(*(void *)(a1 + 2784));
}

uint64_t virt_SwapCancel(uint64_t a1, int a2)
{
  unsigned int v4 = (pthread_mutex_t *)(a1 + 1872);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 1872));
  if (*(_DWORD *)(a1 + 176) == a2)
  {
    uint64_t v5 = 0LL;
    *(_BYTE *)(a1 + 3208) = 1;
  }

  else
  {
    uint64_t v5 = 3758097090LL;
  }

  uint64_t v6 = 0LL;
  while (!*(_DWORD *)(a1 + 180 + 4 * v6))
  {
    if (++v6 == 4)
    {
      LODWORD(v6) = 0;
      break;
    }
  }

  int v7 = *(_DWORD *)(a1 + 4LL * v6 + 180);
  if (v7)
  {
    uint64_t v8 = a1 + 2824;
    uint64_t v9 = -1LL;
    while (*(_DWORD *)(v8 + 8) != v7)
    {
      v8 += 24LL;
    }

    (*(void (**)(void))(*(void *)(a1 + 2792) + 128LL))(*(void *)(a1 + 2784));
    if (*(void *)v8) {
      CFRelease(*(CFTypeRef *)v8);
    }
    *(void *)uint64_t v8 = 0LL;
    *(void *)(v8 + 8) = 0LL;
    *(void *)(v8 + 16) = 0LL;
  }

LABEL_16:
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t virt_GetRunLoopSource(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1 + ((unint64_t)a2 << 6);
  uint64_t v3 = *(void *)(v2 + 1464);
  if (!v3)
  {
    unsigned int v4 = *(uint64_t (***)(void))(a1 + 2792);
    if (a2)
    {
      if (a2 == 2)
      {
        uint64_t v5 = v4 + 18;
      }

      else
      {
        if (a2 != 5) {
          return 0LL;
        }
        uint64_t v5 = v4 + 6;
      }
    }

    else
    {
      uint64_t v5 = v4 + 9;
    }

    uint64_t v6 = (uint64_t *)(v2 + 1464);
    uint64_t v3 = (*v5)(*(void *)(a1 + 2784));
    *uint64_t v6 = v3;
  }

  return v3;
}

uint64_t virt_EnableNotifications(void *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4 = &a1[8 * (unint64_t)a2];
  v4[188] = a3;
  v4[181] = a4;
  if (a2 == 5)
  {
    uint64_t v5 = (uint64_t (**)(void, void *, void *))(a1[349] + 56LL);
    uint64_t v6 = IOMobileFramebufferVirtualDisplayVSyncNotificationFunc;
    return (*v5)(a1[348], v6, a1);
  }

  if (!a2)
  {
    v4[188] = virt_interceptHotplugCallback;
    a1[232] = a3;
    uint64_t v5 = (uint64_t (**)(void, void *, void *))(a1[349] + 80LL);
    uint64_t v6 = IOMobileFramebufferVirtualDisplayHotPlugDetectNotificationFunc;
    return (*v5)(a1[348], v6, a1);
  }

  return 3758097090LL;
}

uint64_t virt_DisableNotifications(uint64_t a1, int a2)
{
  if (a2 == 5)
  {
    uint64_t v2 = (uint64_t (**)(void))(*(void *)(a1 + 2792) + 64LL);
    return (*v2)(*(void *)(a1 + 2784));
  }

  if (!a2)
  {
    uint64_t v2 = (uint64_t (**)(void))(*(void *)(a1 + 2792) + 88LL);
    return (*v2)(*(void *)(a1 + 2784));
  }

  return 3758097090LL;
}

uint64_t virt_GetHDCPDownstreamState(void *a1, void *a2)
{
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t result = (*(uint64_t (**)(void))(a1[349] + 96LL))(a1[348]);
  if ((_DWORD)result)
  {
    uint64_t result = 0LL;
    int v5 = a1[245] != 0LL;
    *a2 = 0x1000150434448LL;
    a2[1] = (v5 << 27);
  }

  return result;
}

uint64_t virt_HDCPSendRequest(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a1[349];
  a1[204] = a4;
  a1[197] = a5;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t), void *))(v5 + 152))( a1[348],  a2,  a3,  iomfb_VirtualDisplayHDCPCallback,  a1);
}

uint64_t virt_HDCPGetReply(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2792);
  else {
    return (*(uint64_t (**)(void))(v1 + 160))(*(void *)(a1 + 2784));
  }
}

uint64_t virt_GetProtectionOptions(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2792);
  else {
    return (*(uint64_t (**)(void))(v1 + 168))(*(void *)(a1 + 2784));
  }
}

uint64_t virt_EnableStatistics(uint64_t a1, int a2)
{
  *(_OWORD *)(a1 + 2800) = 0u;
  *(_DWORD *)(a1 + 2816) = a2;
  return 0LL;
}

CFDictionaryRef virt_CreateStatistics(uint64_t a1, const __CFAllocator *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  *(_OWORD *)keys = xmmword_189C59968;
  CFTypeRef cf = CFNumberCreate(0LL, kCFNumberCFIndexType, (const void *)(a1 + 2808));
  CFTypeRef v7 = CFNumberCreate(0LL, kCFNumberCFIndexType, (const void *)(a1 + 2800));
  CFDictionaryRef v4 = CFDictionaryCreate(a2, (const void **)keys, &cf, 2LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFRelease(cf);
  CFRelease(v7);
  return v4;
}

uint64_t virt_gest_timestamp(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t virt_interceptHotplugCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(a1 + 2336);
    if (v6) {
      v6(a1, a2);
    }
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1856))(a1, a2, a3);
}

uint64_t IOMobileFramebufferVirtualDisplayHotPlugDetectNotificationFunc(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 1504))(a2, a1, *(void *)(a2 + 1448));
}

uint64_t IOMobileFramebufferVirtualDisplayVSyncNotificationFunc( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)(a4 + 2816)) {
    ++*(void *)(a4 + 2800);
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(a4 + 1824);
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(a4 + 2744))(a4);
  return v9(a4, a1, v7, a3, *(void *)(a4 + 1768));
}

uint64_t iomfb_VirtualDisplayHDCPCallback(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t, void, uint64_t))(result + 1632);
  if (v2) {
    return v2(result, *(void *)(result + 1576), a2);
  }
  return result;
}

void IOMFBgainencoder_free(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    free(v2);
  }
  uint64_t v3 = a1[1];
  if (v3) {
    free(v3);
  }
  CFDictionaryRef v4 = a1[2];
  if (v4) {
    free(v4);
  }
  uint64_t v5 = a1[3];
  if (v5) {
    free(v5);
  }
  uint64_t v6 = a1[4];
  if (v6) {
    free(v6);
  }
  uint64_t v7 = a1[5];
  if (v7) {
    free(v7);
  }
  uint64_t v8 = a1[6];
  if (v8) {
    free(v8);
  }
  uint64_t v9 = a1[7];
  if (v9) {
    free(v9);
  }
  IOSurfaceRef v10 = a1[8];
  if (v10) {
    free(v10);
  }
  free(a1);
}

uint64_t IOMFBgainencoder_set_map_version(unsigned int a1)
{
  if (a1 > 1) {
    return 0LL;
  }
  map_version = a1;
  return 1LL;
}

void *IOMFBgainencoder_new(int a1, int a2, char a3, char a4)
{
  uint64_t v8 = malloc(0x138uLL);
  uint64_t v9 = v8;
  if (v8)
  {
    v8[38] = 0LL;
    *((_OWORD *)v8 + 17) = 0u;
    *((_OWORD *)v8 + 18) = 0u;
    *((_OWORD *)v8 + 15) = 0u;
    *((_OWORD *)v8 + 16) = 0u;
    *((_OWORD *)v8 + 13) = 0u;
    *((_OWORD *)v8 + 14) = 0u;
    *((_OWORD *)v8 + 11) = 0u;
    *((_OWORD *)v8 + 12) = 0u;
    *((_OWORD *)v8 + 9) = 0u;
    *((_OWORD *)v8 + 10) = 0u;
    *((_OWORD *)v8 + 7) = 0u;
    *((_OWORD *)v8 + 8) = 0u;
    *((_OWORD *)v8 + 5) = 0u;
    *((_OWORD *)v8 + 6) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *(_OWORD *)uint64_t v8 = 0u;
    *((_BYTE *)v8 + 301) = a4;
    *((_BYTE *)v8 + 300) = a3;
    if (a1 | a2)
    {
      if (a2 <= 16) {
        size_t v10 = 16LL;
      }
      else {
        size_t v10 = a2;
      }
      int v11 = 3 * a1 * a2;
      unsigned int v12 = malloc(v10);
      *uint64_t v9 = v12;
      uint64_t v13 = malloc(200 * a2);
      v9[1] = v13;
      uint64_t v14 = malloc(v11);
      v9[2] = v14;
      BOOL v15 = (char *)malloc(0x18uLL);
      _OWORD v9[3] = v15;
      *(_WORD *)(v15 + 13) = 0;
      v15[15] = 0;
      *((void *)v15 + 2) = v12;
      *((_DWORD *)v15 + 2) = v10;
      *(void *)BOOL v15 = 0xFFFFFFFFLL;
      v15[12] = 0;
      uint64_t v16 = (char *)malloc(0x18uLL);
      v9[4] = v16;
      *(_WORD *)(v16 + 13) = 0;
      v16[15] = 0;
      *((void *)v16 + 2) = v13;
      *((_DWORD *)v16 + 2) = 200 * a2;
      *(void *)uint64_t v16 = 0xFFFFFFFFLL;
      v16[12] = 0;
      unsigned int v17 = (char *)malloc(0x18uLL);
      v9[5] = v17;
      *(_WORD *)(v17 + 13) = 0;
      v17[15] = 0;
      *((void *)v17 + 2) = v14;
      *((_DWORD *)v17 + 2) = v11;
      *(void *)unsigned int v17 = 0xFFFFFFFFLL;
      v17[12] = 0;
      BOOL v18 = malloc(0x10uLL);
      v9[6] = v18;
      CFNumberRef v19 = malloc(0x10uLL);
      v9[7] = v19;
      __int128 v20 = malloc(0x10uLL);
      v9[8] = v20;
      *BOOL v18 = v17;
      v18[1] = 0LL;
      *CFNumberRef v19 = v17;
      v19[1] = 0LL;
      *__int128 v20 = v17;
      v20[1] = 0LL;
      *((_DWORD *)v9 + 66) = a1;
      *((_DWORD *)v9 + 67) = a2;
      *((_DWORD *)v9 + 70) = 0;
      *((_DWORD *)v9 + 61) = -1;
    }

    else
    {
      unsigned int v17 = 0LL;
    }

    *((_DWORD *)v9 + 59) = 255;
    if (map_version)
    {
      int v21 = *(_DWORD *)v17;
      if ((*(_DWORD *)v17 & 0x80000000) != 0)
      {
        int v21 = 0;
        int v22 = 0;
      }

      else
      {
        int v22 = 8 - *((_DWORD *)v17 + 1);
      }

      *((_DWORD *)v9 + 76) = v21;
      *((_DWORD *)v9 + 77) = v22;
      bw_set((unsigned int *)v17, 32, 0);
    }

    *(_OWORD *)(v9 + 27) = 0u;
    *(_OWORD *)(v9 + 25) = 0u;
    *(_OWORD *)(v9 + 23) = 0u;
    *(_OWORD *)(v9 + 21) = 0u;
    *(_OWORD *)(v9 + 19) = 0u;
    *(_OWORD *)(v9 + 17) = 0u;
    *(_OWORD *)(v9 + 15) = 0u;
    *(_OWORD *)(v9 + 13) = 0u;
    *(_OWORD *)(v9 + 11) = 0u;
    *(_OWORD *)(v9 + 9) = 0u;
  }

  return v9;
}

unsigned int *bw_set(unsigned int *result, int a2, int a3)
{
  if (*((_BYTE *)result + 13)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = a2 == 0;
  }
  if (!v3)
  {
    unsigned int v4 = 1 << (a2 - 1);
    int v5 = result[1];
    do
    {
      if (v5)
      {
        unsigned int v6 = *((unsigned __int8 *)result + 12);
      }

      else
      {
        int v7 = *result;
        unsigned int v8 = *result + 1;
        *uint64_t result = v8;
        if (v7 < -1 || v8 >= result[2])
        {
          *((_BYTE *)result + 13) = 1;
          return result;
        }

        *(_BYTE *)(*((void *)result + 2) + v8) = 0;
        int v5 = 8;
        result[1] = 8;
        unsigned int v6 = 128;
        *((_BYTE *)result + 12) = 0x80;
      }

      if ((v4 & a3) != 0)
      {
        *(_BYTE *)(*((void *)result + 2) + (int)*result) |= v6;
        int v5 = result[1];
        unsigned int v6 = *((unsigned __int8 *)result + 12);
      }

      result[1] = --v5;
      *((_BYTE *)result + 12) = v6 >> 1;
      v4 >>= 1;
      --a2;
    }

    while (a2);
  }

  return result;
}

uint64_t IOMFBgainencoder_map_size(_DWORD **a1, int a2)
{
  switch(a2)
  {
    case 2:
      uint64_t v2 = a1 + 5;
      return (**v2 + 1);
    case 1:
      uint64_t v2 = a1 + 4;
      return (**v2 + 1);
    case 0:
      uint64_t v2 = a1 + 3;
      return (**v2 + 1);
  }

  return 0LL;
}

uint64_t IOMFBgainencoder_row_1_coded(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 302);
}

uint64_t IOMFBgainencoder_count(unsigned int *a1, int a2)
{
  if (a2 == 2) {
    return a1[73];
  }
  if (a2 == 1) {
    return a1[72];
  }
  if (a2) {
    return 0LL;
  }
  return a1[71];
}

uint64_t IOMFBgainencoder_map(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
      return *(void *)a1;
    case 2:
      a1 += 16LL;
      return *(void *)a1;
    case 1:
      a1 += 8LL;
      return *(void *)a1;
  }

  return 0LL;
}

uint64_t IOMFBgainencoder_set_origin(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(result + 272) = a2;
  *(_DWORD *)(result + 276) = a3;
  return result;
}

uint64_t IOMFBgainencoder_get_origin(uint64_t result, _DWORD *a2, _DWORD *a3)
{
  *a2 = *(_DWORD *)(result + 272);
  *a3 = *(_DWORD *)(result + 276);
  return result;
}

uint64_t IOMFBgainencoder_get_size(uint64_t result, _DWORD *a2, _DWORD *a3)
{
  *a2 = *(_DWORD *)(result + 264);
  *a3 = *(_DWORD *)(result + 268);
  return result;
}

uint64_t IOMFBgainencoder_emit_run(uint64_t a1, int a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 280);
  if (!v3)
  {
    *(void *)(a1 + 248) = 0LL;
    *(_DWORD *)(a1 + 256) = 0;
    *(_DWORD *)(a1 + 240) = 0;
  }

  uint64_t v7 = 0LL;
  int v23 = -1431655766;
  unsigned __int16 v24 = -21846;
  do
  {
    *((_WORD *)&v23 + v7) = vcvts_n_s32_f32(*(float *)(a3 + 4 * v7), 8uLL);
    ++v7;
  }

  while (v7 != 3);
  int v8 = (unsigned __int16)v23;
  int v9 = HIWORD(v23);
  int v10 = v24;
  int v11 = (HIWORD(v23) << 9) | ((unsigned __int16)v23 << 18) | v24;
  if (v11) {
    int v12 = 3;
  }
  else {
    int v12 = 1;
  }
  if (v11 == 67240192) {
    int v13 = 2;
  }
  else {
    int v13 = v12;
  }
  if (*(_DWORD *)(a1 + 240))
  {
    if (!v3) {
      goto LABEL_25;
    }
LABEL_18:
    if (v11) {
      BOOL v15 = v11 == 67240192;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15 || v13 == *(_DWORD *)(a1 + 232)) {
      goto LABEL_39;
    }
    goto LABEL_25;
  }

  update_run_map((unsigned int *)a1, 1u);
  *(_DWORD *)(a1 + 240) = 1;
  int v14 = *(_DWORD *)(a1 + 280);
  if (v14)
  {
    *(_DWORD *)(a1 + 256) += v14;
    goto LABEL_18;
  }

LABEL_25:
  if (*(_DWORD *)(a1 + 252)
    || (v11 != 67240192 ? (BOOL v17 = v11 == 0) : (BOOL v17 = 1), !v17 ? (v18 = 0) : (v18 = 1), *(_DWORD *)(a1 + 256) && v18))
  {
    uint64_t result = update_pos_map(a1);
    if (!(_DWORD)result) {
      return result;
    }
  }

  if (v13 == 3)
  {
    *(_DWORD *)(a1 + 232) = 3;
    if (*(_DWORD *)(a1 + 240) != 1) {
      goto LABEL_47;
    }
    goto LABEL_41;
  }

  *(_DWORD *)(a1 + 260) = v13 != 1;
LABEL_39:
  *(_DWORD *)(a1 + 232) = v13;
  if (*(_DWORD *)(a1 + 240) != 1) {
    goto LABEL_47;
  }
  if (v13 != 3)
  {
    *(_DWORD *)(a1 + 256) += a2;
    goto LABEL_47;
  }

LABEL_41:
  for (int i = a2; i; --i)
  {
    append_gain_map(a1, v8, *(void *)(a1 + 48));
    append_gain_map(a1, v9, *(void *)(a1 + 56));
    if (!*(_BYTE *)(a1 + 300)) {
      append_gain_map(a1, v10, *(void *)(a1 + 64));
    }
    ++*(_DWORD *)(a1 + 252);
  }

LABEL_47:
  int v20 = *(_DWORD *)(a1 + 280) + a2;
  *(_DWORD *)(a1 + 280) = v20;
  if (v20 != *(_DWORD *)(a1 + 264)) {
    return 1LL;
  }
  if (!*(_DWORD *)(a1 + 240))
  {
    update_run_map((unsigned int *)a1, 0);
    return 1LL;
  }

  if (!*(_DWORD *)(a1 + 252) && !*(_DWORD *)(a1 + 256) || (uint64_t result = update_pos_map(a1), (_DWORD)result))
  {
    uint64_t v21 = *(int *)(a1 + 248);
    if ((int)v21 <= 19)
    {
      do
      {
        uint64_t v22 = a1 + 4 * v21;
        *(_DWORD *)(v22 + 152) = 0;
        *(_DWORD *)(v22 + 72) = 0;
        ++v21;
      }

      while ((_DWORD)v21 != 20);
    }

    return 1LL;
  }

  return result;
}

unsigned int *update_run_map(unsigned int *result, unsigned int a2)
{
  uint64_t v2 = result;
  unsigned int v3 = result[59];
  if (v3 == a2)
  {
    ++result[74];
  }

  else
  {
    if (v3 == 255) {
      *((_BYTE *)result + 302) = a2 == 1;
    }
    else {
      uint64_t result = append_run_map((uint64_t)result);
    }
    v2[74] = 1;
    v2[59] = a2;
    if (a2 == 1)
    {
      uint64_t v5 = 0LL;
      *(_OWORD *)(v2 + 34) = 0u;
      *(_OWORD *)(v2 + 30) = 0u;
      *(_OWORD *)(v2 + 26) = 0u;
      *(_OWORD *)(v2 + 22) = 0u;
      *(_OWORD *)(v2 + 18) = 0u;
      do
      {
        unsigned int v6 = &v2[v5 + 38];
        *(void *)unsigned int v6 = 0LL;
        *((void *)v6 + 1) = 0LL;
        v5 += 4LL;
      }

      while (v5 != 20);
    }
  }

  return result;
}

uint64_t update_pos_map(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 248);
  uint64_t v4 = a1 + 4 * v1;
  int v5 = *(_DWORD *)(v4 + 72);
  int v6 = *(_DWORD *)(a1 + 252);
  int v7 = *(_DWORD *)(a1 + 256);
  int v8 = *(_DWORD *)(a1 + 152 + 4 * v1);
  *(_DWORD *)(v4 + 72) = v7;
  *(_DWORD *)(a1 + 152 + 4LL * (int)(*(_DWORD *)(a1 + 248))++) = *(_DWORD *)(a1 + 252);
  bw_set(*(unsigned int **)(a1 + 32), 1, *(_DWORD *)(a1 + 260));
  egk_set(a1, v7 - v5);
  if (v7 != v5) {
    bw_set(*(unsigned int **)(a1 + 32), 1, v7 - v5 < 1);
  }
  egk_set(a1, v6 - v8);
  if (v6 != v8) {
    bw_set(*(unsigned int **)(a1 + 32), 1, v6 - v8 < 1);
  }
  ++*(_DWORD *)(a1 + 288);
  *(_DWORD *)(a1 + 252) = 0;
  *(_DWORD *)(a1 + 256) = 0;
  return 1LL;
}

uint64_t IOMFBgainencoder_start_row(_DWORD *a1)
{
  if ((a1[61] & 0x80000000) != 0) {
    goto LABEL_4;
  }
  uint64_t result = finish_row(a1);
  if (!(_DWORD)result) {
    return result;
  }
  unsigned int v3 = a1[61];
  if ((v3 & 0x80000000) != 0)
  {
LABEL_4:
    unsigned int v3 = 0;
    a1[61] = 0;
  }

  return v3 < a1[67];
}

uint64_t finish_row(_DWORD *a1)
{
  unsigned int v2 = a1[70];
  unsigned int v3 = a1[66];
  if (v3 <= v2 || (uint64_t result = IOMFBgainencoder_emit_run((uint64_t)a1, v3 - v2, (uint64_t)&finish_row_ones), (_DWORD)result))
  {
    ++a1[61];
    a1[70] = 0;
    return 1LL;
  }

  return result;
}

uint64_t IOMFBgainencoder_emit_empty_rows(_DWORD *a1, unsigned int a2)
{
  if (!a1[70] || (uint64_t result = IOMFBgainencoder_start_row(a1), (_DWORD)result))
  {
    if (a2)
    {
      uint64_t result = finish_row(a1);
      if ((_DWORD)result)
      {
        int v5 = 1;
        do
        {
          unsigned int v6 = v5;
          if (a2 == v5) {
            break;
          }
          int v7 = finish_row(a1);
          int v5 = v6 + 1;
        }

        while (v7);
        return v6 >= a2;
      }
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

uint64_t IOMFBgainencoder_repeat_row()
{
  return 0LL;
}

uint64_t IOMFBgainencoder_finish(uint64_t a1)
{
  while (*(_DWORD *)(a1 + 244) < *(_DWORD *)(a1 + 268))
  {
    uint64_t result = finish_row((_DWORD *)a1);
    if (!(_DWORD)result) {
      return result;
    }
  }

  append_run_map(a1);
  bw_pad_to_n_byte(*(unsigned int **)(a1 + 24));
  bw_pad_to_n_byte(*(unsigned int **)(a1 + 32));
  if (map_version)
  {
    unsigned int v3 = *(int **)(a1 + 40);
    int v4 = *v3;
    if (*v3 < 0)
    {
      int v4 = 0;
      int v5 = -32;
    }

    else
    {
      int v5 = -24 - v3[1];
    }

    int v6 = *(_DWORD *)(a1 + 304);
    int v7 = *(_DWORD *)(a1 + 308);
    __int128 v10 = *(_OWORD *)v3;
    uint64_t v11 = *((void *)v3 + 2);
    LODWORD(v10) = v6;
    DWORD1(v10) = 8 - v7;
    BYTE12(v10) = 1 << (7 - v7);
    unsigned int v8 = v6 + ((v7 + 31) >> 3);
    char v9 = *(_BYTE *)(v11 + v8);
    bw_set((unsigned int *)&v10, 32, v5 - v7 + 8 * (v4 - v6));
    *(_BYTE *)(v11 + v8) |= v9;
  }

  return !*(_BYTE *)(*(void *)(a1 + 24) + 13LL)
      && !*(_BYTE *)(*(void *)(a1 + 40) + 13LL)
      && *(_BYTE *)(*(void *)(a1 + 32) + 13LL) == 0;
}

unsigned int *append_run_map(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 296);
  if (map_version) {
    v2 |= *(_DWORD *)(a1 + 236) << 14;
  }
  uint64_t result = bw_set(*(unsigned int **)(a1 + 24), 16, v2);
  ++*(_DWORD *)(a1 + 284);
  return result;
}

unsigned int *bw_pad_to_n_byte(unsigned int *result)
{
  uint64_t v1 = result;
  int v2 = result[1];
  int v3 = *v1 + 1;
  BOOL v4 = -v3 < 0;
  int v5 = -v3 & 0xF;
  int v6 = v3 & 0xF;
  if (!v4) {
    int v6 = -v5;
  }
  if (v6)
  {
    unsigned int v7 = 0;
    unsigned int v8 = 16 - v6;
    do
    {
      uint64_t result = bw_set(v1, 8, 0);
      ++v7;
    }

    while (v8 > v7);
  }

  return result;
}

unsigned int *append_gain_map(uint64_t a1, int a2, uint64_t a3)
{
  BOOL v4 = *(unsigned int **)a3;
  if (*(_DWORD *)(a3 + 8) == a2)
  {
    uint64_t result = bw_set(v4, 1, 0);
  }

  else
  {
    bw_set(v4, 1, 1);
    unsigned int v8 = *(unsigned int **)a3;
    int v9 = 1;
    if (a2)
    {
      bw_set(v8, 1, 1);
      unsigned int v8 = *(unsigned int **)a3;
      int v10 = a2 - 1;
      int v9 = 8;
    }

    else
    {
      int v10 = 0;
    }

    uint64_t result = bw_set(v8, v9, v10);
    *(_DWORD *)(a3 + 8) = a2;
  }

  ++*(_DWORD *)(a1 + 292);
  return result;
}

unsigned int *egk_set(uint64_t a1, int a2)
{
  if (a2 >= 0) {
    int v3 = a2;
  }
  else {
    int v3 = -a2;
  }
  int v4 = v3 + 1;
  unsigned int v5 = __clz(v3 + 1);
  bw_set(*(unsigned int **)(a1 + 32), 32 - v5, 2 * ~(-1 << -(char)v5));
  return bw_set(*(unsigned int **)(a1 + 32), v5 ^ 0x1F, v4);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x189602D20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort( CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DC0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x189602F58](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602F98](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602FA0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x189603138]();
}

CFRunLoopRunResult CFRunLoopRunInMode( CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x189603198](mode, returnAfterSourceHandled, seconds);
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy( CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603470](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x189603530](theString);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallScalarMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x189607CC0]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallStructMethod( mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CC8]( *(void *)&connection,  *(void *)&selector,  inputStruct,  inputStructCnt,  outputStruct,  outputStructCnt);
}

kern_return_t IOConnectMapMemory( io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x189607CD8]( *(void *)&connect,  *(void *)&memoryType,  *(void *)&intoTask,  atAddress,  ofSize,  *(void *)&options);
}

kern_return_t IOConnectSetNotificationPort( io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x189607CF8](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectUnmapMemory( io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x189607D18](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x189607D68]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x189607D78](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x189607D80](dataQueue);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x189608340](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x189608348](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator( io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x189608498](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperty( io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x189608528](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddMatchingNotification( IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x189608548](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1896086B8](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1896086C0](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1896086C8](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1896086D0](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1896086D8](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1896086E0](buffer, planeIndex);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x1896086E8](*(void *)&csid);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x1896086F0](*(void *)&port);
}

uint64_t IOSurfaceSetTimestamp()
{
  return MEMORY[0x1896086F8]();
}

uint64_t IOSurfaceSharedEventGetMachPort()
{
  return MEMORY[0x189608700]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

void *__cdecl aligned_alloc(size_t __alignment, size_t __size)
{
  return (void *)MEMORY[0x1895F94A8](__alignment, __size);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x1895FAF50](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int kdebug_signpost(uint32_t code, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4)
{
  return MEMORY[0x1895FB8B8](*(void *)&code, arg1, arg2, arg3, arg4);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes( ipc_space_inspect_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1895FBB48](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_attributes( ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1895FBB90]( *(void *)&task,  *(void *)&name,  *(void *)&flavor,  port_info,  *(void *)&port_infoCnt);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

uint64_t pthread_dependency_fulfill_np()
{
  return MEMORY[0x1895FC9E0]();
}

uint64_t pthread_dependency_init_np()
{
  return MEMORY[0x1895FC9E8]();
}

uint64_t pthread_dependency_wait_np()
{
  return MEMORY[0x1895FC9F0]();
}

int pthread_detach(pthread_t a1)
{
  return MEMORY[0x1895FC9F8](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

void syslog(int a1, const char *a2, ...)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}