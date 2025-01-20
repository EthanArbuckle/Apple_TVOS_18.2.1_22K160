__CFDictionary *sub_2FC4()
{
  __CFDictionary *Mutable;
  ifaddrs *v1;
  const char *ifa_name;
  CFStringRef v3;
  in_addr v4;
  char *v5;
  CFStringRef v6;
  CFStringRef v7;
  BOOL v8;
  ifaddrs *v9;
  ifaddrs *v11;
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable || getifaddrs(&v11) == -1) {
    return Mutable;
  }
  v1 = v11;
  if (!v11)
  {
    v9 = 0LL;
    goto LABEL_20;
  }

  do
  {
    if (v1->ifa_addr->sa_family == 2 && (v1->ifa_flags & 9) == 1)
    {
      ifa_name = v1->ifa_name;
      if (strncmp("awdl", ifa_name, 4uLL))
      {
        v3 = CFStringCreateWithCString(kCFAllocatorDefault, ifa_name, 0);
        v4.s_addr = *(_DWORD *)&v1->ifa_addr->sa_data[2];
        v5 = inet_ntoa(v4);
        v6 = CFStringCreateWithCString(kCFAllocatorDefault, v5, 0);
        v7 = v6;
        if (v6) {
          v8 = v3 == 0LL;
        }
        else {
          v8 = 1;
        }
        if (v8)
        {
          if (!v6)
          {
            if (!v3) {
              goto LABEL_15;
            }
LABEL_14:
            CFRelease(v3);
            goto LABEL_15;
          }
        }

        else
        {
          CFDictionaryAddValue(Mutable, v3, v6);
        }

        CFRelease(v7);
        if (v3) {
          goto LABEL_14;
        }
      }
    }

LABEL_15:
    v1 = v1->ifa_next;
  }

  while (v1);
  v9 = v11;
LABEL_20:
  freeifaddrs(v9);
  if (!CFDictionaryGetCount(Mutable))
  {
    CFRelease(Mutable);
    return 0LL;
  }

  return Mutable;
}

  if (sbuf) {
    CFRelease(sbuf);
  }
  return v5;
}

  v20 = FigEndpointStreamResumeSync(*(void *)(v2 + 56), 0LL, 7000LL);
  if (!(_DWORD)v20 || (v21 = v20, (_DWORD)v20 == -16764))
  {
    *(_BYTE *)(*(void *)(v2 + 64) + 196LL) = 1;
    v3 = *(_DWORD *)(v2 + 96);
    goto LABEL_3;
  }

BOOL sub_3130()
{
  return qword_1C070 != 0;
}

void sub_3144(const void *a1)
{
  if (!qword_1C070)
  {
    qword_1C070 = (uint64_t)calloc(1uLL, 0x70uLL);
    unsigned int v38 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v38,  &type);
    uint64_t v3 = v38;
    uint64_t v4 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 & 0xFFFFFFFE;
    }
    if ((_DWORD)v5)
    {
      int v39 = 136315394;
      v40 = "FigOctaviaInitializeStevenote";
      __int16 v41 = 2048;
      uint64_t v42 = qword_1C070;
      v6 = (IOPMAssertionID *)_os_log_send_and_compose_impl( v5,  0LL,  AssertionID,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v4,  "<<< stevenote >>> %s: <Stevenote>: FigOctaviaInitializeStevenote called %p",  (const char *)&v39,  22);
      uint64_t v3 = v38;
    }

    else
    {
      v6 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v6, v6 != AssertionID, v3, 0LL);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.coremedia.Stevenote", 0LL);
    uint64_t v8 = qword_1C070;
    *(void *)qword_1C070 = v7;
    if (a1)
    {
      CFTypeRef v9 = CFRetain(a1);
      uint64_t v8 = qword_1C070;
    }

    else
    {
      CFTypeRef v9 = 0LL;
    }

    *(void *)(v8 + 104) = v9;
    BKSDisplayServicesSetCloneRotationDisabled(1LL);
    unsigned int v38 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v10 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v38, &type);
    uint64_t v11 = v38;
    uint64_t v12 = type;
    if (os_log_type_enabled(v10, type)) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v11 & 0xFFFFFFFE;
    }
    if ((_DWORD)v13)
    {
      int v39 = 136315138;
      v40 = "FigOctaviaInitializeStevenote";
      v14 = (IOPMAssertionID *)_os_log_send_and_compose_impl( v13,  0LL,  AssertionID,  128LL,  &dword_0,  v10,  v12,  "<<< stevenote >>> %s: <Stevenote>: BKSDisplayServicesSetCloneRotationDisabled completed",  (const char *)&v39);
      uint64_t v11 = v38;
    }

    else
    {
      v14 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v14, v14 != AssertionID, v11, 0LL);
    notify_register_dispatch( "com.apple.mobile.demo.mode-1",  (int *)(qword_1C070 + 36),  *(dispatch_queue_t *)qword_1C070,  &stru_18D88);
    notify_register_dispatch( "com.apple.mobile.demo.mode-2",  (int *)(qword_1C070 + 40),  *(dispatch_queue_t *)qword_1C070,  &stru_18DA8);
    notify_register_dispatch( "com.apple.mobile.demo.mode-3",  (int *)(qword_1C070 + 44),  *(dispatch_queue_t *)qword_1C070,  &stru_18DC8);
    notify_register_dispatch( "com.apple.mobile.demo.mode-4",  (int *)(qword_1C070 + 48),  *(dispatch_queue_t *)qword_1C070,  &stru_18DE8);
    if (!*(_DWORD *)(qword_1C070 + 68))
    {
      AssertionID[0] = 0;
      IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, @"coremedia-stevenote", AssertionID);
      *(_DWORD *)(qword_1C070 + 68) = AssertionID[0];
    }

    int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault( @"enableStevenoteNLC",  @"com.apple.coremedia",  0LL);
    uint64_t v16 = qword_1C070;
    *(_BYTE *)(qword_1C070 + 96) = CFPreferenceNumberWithDefault != 0;
    if (CFPreferenceNumberWithDefault)
    {
      unsigned int v38 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v17 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v38, &type);
      uint64_t v18 = v38;
      uint64_t v19 = type;
      if (os_log_type_enabled(v17, type)) {
        uint64_t v20 = v18;
      }
      else {
        uint64_t v20 = v18 & 0xFFFFFFFE;
      }
      if ((_DWORD)v20)
      {
        int v39 = 136315138;
        v40 = "FigOctaviaInitializeStevenote";
        v21 = (IOPMAssertionID *)_os_log_send_and_compose_impl( v20,  0LL,  AssertionID,  128LL,  &dword_0,  v17,  v19,  "<<< stevenote >>> %s: <Stevenote>: neroNLCInitialize",  (const char *)&v39);
        uint64_t v18 = v38;
      }

      else
      {
        v21 = 0LL;
      }

      fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v21, v21 != AssertionID, v18, 0LL);
      int v50 = 0;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      if (!sub_44D4())
      {
        *(void *)AssertionID = 21LL;
        uint64_t v51 = 13LL;
        int v52 = 1;
        uint64_t v53 = 0LL;
        uint64_t v54 = 0LL;
        int v55 = 60000;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        int v58 = 60000;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
      }

      unsigned int v38 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v22 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v38, &type);
      uint64_t v23 = v38;
      uint64_t v24 = type;
      if (os_log_type_enabled(v22, type)) {
        uint64_t v25 = v23;
      }
      else {
        uint64_t v25 = v23 & 0xFFFFFFFE;
      }
      if ((_DWORD)v25)
      {
        int v39 = 136315138;
        v40 = "FigOctaviaInitializeStevenote";
        v26 = (IOPMAssertionID *)_os_log_send_and_compose_impl( v25,  0LL,  AssertionID,  128LL,  &dword_0,  v22,  v24,  "<<< stevenote >>> %s: <Stevenote>: neroNLCInitialize completed",  (const char *)&v39);
        uint64_t v23 = v38;
      }

      else
      {
        v26 = 0LL;
      }

      fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v26, v26 != AssertionID, v23, 0LL);
      uint64_t v16 = qword_1C070;
    }

    if (!*(_DWORD *)(v16 + 8) && !*(_DWORD *)(v16 + 12))
    {
      io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort(1LL);
      uint64_t v28 = qword_1C070;
      *(_DWORD *)(qword_1C070 + 8) = ServiceWithPrimaryPort;
      if (!ServiceWithPrimaryPort
        || !IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, (io_connect_t *)(v28 + 12))
        && !*(_DWORD *)(qword_1C070 + 12))
      {
        FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      }
    }

    unsigned int v38 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v29 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v38, &type);
    uint64_t v30 = v38;
    uint64_t v31 = type;
    if (os_log_type_enabled(v29, type)) {
      uint64_t v32 = v30;
    }
    else {
      uint64_t v32 = v30 & 0xFFFFFFFE;
    }
    if ((_DWORD)v32)
    {
      int v39 = 136315138;
      v40 = "FigOctaviaInitializeStevenote";
      v33 = (IOPMAssertionID *)_os_log_send_and_compose_impl( v32,  0LL,  AssertionID,  128LL,  &dword_0,  v29,  v31,  "<<< stevenote >>> %s: <Stevenote>: neroIOAccessoryInitialize completed",  (const char *)&v39);
      uint64_t v30 = v38;
    }

    else
    {
      v33 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v33, v33 != AssertionID, v30, 0LL);
    uint64_t v34 = *(unsigned int *)(qword_1C070 + 12);
    if ((_DWORD)v34) {
      IOAccessoryManagerSetUSBCurrentLimitBase(v34, 2100LL);
    }
    else {
      FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  (const void *)qword_1C070,  (CFNotificationCallback)sub_38DC,  @"com.apple.coremedia.Stevenote-HUD.changed",  0LL,  (CFNotificationSuspensionBehavior)0LL);
    sub_38DC();
    *(_DWORD *)(qword_1C070 + 72) = -1;
    v36 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v36,  (const void *)qword_1C070,  (CFNotificationCallback)sub_3A04,  @"com.apple.coremedia.Stevenote3D.changed",  0LL,  (CFNotificationSuspensionBehavior)0LL);
    sub_3A04();
    sub_3AD8();
  }
}

void sub_381C(id a1, int a2)
{
}

void sub_3824(uint64_t a1)
{
  CMBlockBufferRef destinationBuffer = 0LL;
  uint64_t sourceBytes = a1;
  CMBlockBufferCreateWithMemoryBlock( kCFAllocatorDefault,  0LL,  8uLL,  kCFAllocatorDefault,  0LL,  0LL,  8uLL,  1u,  &destinationBuffer);
  uint64_t v1 = CMBlockBufferReplaceDataBytes(&sourceBytes, destinationBuffer, 0LL, 8uLL);
  uint64_t v2 = *(void *)(qword_1C070 + 104);
  uint64_t RemoteRootObject = FigTransportGetRemoteRootObject(v1);
  NeroTransportSendAsyncMessage(v2, RemoteRootObject, 1953854062LL, destinationBuffer);
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }
}

void sub_38C4(id a1, int a2)
{
}

void sub_38CC(id a1, int a2)
{
}

void sub_38D4(id a1, int a2)
{
}

void sub_38DC()
{
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault( @"enableStevenoteHUD",  @"com.apple.coremedia",  0LL);
  int v1 = CFPreferenceNumberWithDefault != 0;
  uint64_t v2 = qword_1C070;
  if (*(unsigned __int8 *)(qword_1C070 + 64) != v1)
  {
    *(_BYTE *)(qword_1C070 + 64) = v1;
    if (CFPreferenceNumberWithDefault)
    {
      if (!*(void *)(v2 + 16) && !*(_DWORD *)(v2 + 24))
      {
        uint64_t v3 = IONotificationPortCreate(kIOMainPortDefault);
        uint64_t v4 = (dispatch_queue_t *)qword_1C070;
        *(void *)(qword_1C070 + 16) = v3;
        IONotificationPortSetDispatchQueue(v3, *v4);
        IOServiceAddInterestNotification( *(IONotificationPortRef *)(qword_1C070 + 16),  *(_DWORD *)(qword_1C070 + 8),  "IOGeneralInterest",  (IOServiceInterestCallback)sub_46C0,  0LL,  (io_object_t *)(qword_1C070 + 24));
      }

      if (qword_1C088 != -1) {
        dispatch_once(&qword_1C088, &stru_18E68);
      }
      uint64_t v5 = (const __SCDynamicStore *)qword_1C090;
      v6 = (dispatch_queue_t *)qword_1C070;
      *(void *)(qword_1C070 + 56) = qword_1C090;
      if (v5) {
        SCDynamicStoreSetDispatchQueue(v5, *v6);
      }
    }

    else
    {
      sub_4324();
    }

    sub_3AD8();
  }

void sub_3A04()
{
  CFTypeRef cf = 0LL;
  CFPreferencesSynchronize(@"com.apple.coremedia", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault( @"Stevenote3D",  @"com.apple.coremedia",  0LL);
  int v4 = CFPreferenceNumberWithDefault;
  if (*(_DWORD *)(qword_1C070 + 72) != CFPreferenceNumberWithDefault)
  {
    *(_DWORD *)(qword_1C070 + 72) = CFPreferenceNumberWithDefault;
    objc_autoreleasePoolPop(objc_autoreleasePoolPush());
    uint64_t v1 = FigCreateBlockBufferCopyingMemoryBlock(kCFAllocatorDefault, &v4, 4LL, &cf);
    if (!(_DWORD)v1)
    {
      uint64_t v2 = *(void *)(qword_1C070 + 104);
      uint64_t RemoteRootObject = FigTransportGetRemoteRootObject(v1);
      NeroTransportSendAsyncMessage(v2, RemoteRootObject, 1936615014LL, cf);
    }
  }

  if (cf) {
    CFRelease(cf);
  }
}

void sub_3AD8()
{
  CFTypeRef cf = 0LL;
  if (!qword_1C070) {
    return;
  }
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    if (qword_1C098 != -1) {
      dispatch_once(&qword_1C098, &stru_18E88);
    }
    if (qword_1C0A0) {
      CFDictionaryAddValue(Mutable, @"DeviceUniqueID", (const void *)qword_1C0A0);
    }
    if (qword_1C0A8) {
      CFDictionaryAddValue(Mutable, @"DeviceModel", (const void *)qword_1C0A8);
    }
    if (qword_1C0B0) {
      CFDictionaryAddValue(Mutable, @"DeviceColor", (const void *)qword_1C0B0);
    }
    if (qword_1C0B8) {
      CFDictionaryAddValue(Mutable, @"DeviceEnclosureColor", (const void *)qword_1C0B8);
    }
    if (qword_1C0C0) {
      CFDictionaryAddValue(Mutable, @"iOS Build", (const void *)qword_1C0C0);
    }
    uint64_t v1 = sub_2FC4();
    if (v1) {
      CFDictionaryAddValue(Mutable, @"DeviceIP", v1);
    }
    int valuePtr = 0;
    uint64_t v2 = *(unsigned int *)(qword_1C070 + 8);
    if ((_DWORD)v2)
    {
      if (!IOAccessoryManagerGetUSBCurrentLimit(v2, &valuePtr))
      {
        CFNumberRef v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
        if (v3) {
          CFDictionaryAddValue(Mutable, @"Device Current", v3);
        }
        goto LABEL_22;
      }
    }

    else
    {
      FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }

    CFNumberRef v3 = 0LL;
LABEL_22:
    if (*(_BYTE *)(qword_1C070 + 64)) {
      int v4 = (const void **)&kCFBooleanTrue;
    }
    else {
      int v4 = (const void **)&kCFBooleanFalse;
    }
    CFDictionaryAddValue(Mutable, @"Enable ATV HUD", *v4);
    uint64_t v5 = FigRemote_CreateSerializedAtomDataBlockBufferForCFType(kCFAllocatorDefault, Mutable, &cf);
    if (!(_DWORD)v5)
    {
      uint64_t v6 = *(void *)(qword_1C070 + 104);
      uint64_t RemoteRootObject = FigTransportGetRemoteRootObject(v5);
      NeroTransportSendAsyncMessage(v6, RemoteRootObject, 1768842863LL, cf);
    }

    goto LABEL_27;
  }

  uint64_t v1 = 0LL;
  CFNumberRef v3 = 0LL;
LABEL_27:
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v1) {
    CFRelease(v1);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_3D3C()
{
  if (qword_1C070)
  {
    unsigned int v39 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v39,  &type);
    uint64_t v1 = v39;
    uint64_t v2 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v3 = v1;
    }
    else {
      uint64_t v3 = v1 & 0xFFFFFFFE;
    }
    if ((_DWORD)v3)
    {
      int v40 = 136315138;
      __int16 v41 = "FigOctaviaUninitializeStevenote";
      int v4 = (uint64_t *)_os_log_send_and_compose_impl( v3,  0LL,  &v42,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v2,  "<<< stevenote >>> %s: <Stevenote>: FigOctaviaUninitializeStevenote called",  (const char *)&v40);
      uint64_t v1 = v39;
    }

    else
    {
      int v4 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v4, v4 != &v42, v1, 0LL);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  (const void *)qword_1C070,  @"com.apple.coremedia.Stevenote-HUD.changed",  0LL);
    uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver( v6,  (const void *)qword_1C070,  @"com.apple.coremedia.Stevenote3D.changed",  0LL);
    dispatch_queue_t v7 = objc_autoreleasePoolPush();
    uint64_t v8 = qword_1C070;
    uint64_t v9 = *(void *)(qword_1C070 + 88);
    if (v9)
    {
      CFRunLoopRef Main = CFRunLoopGetMain();
      IOHIDEventSystemClientUnscheduleWithRunLoop(v9, Main, kCFRunLoopDefaultMode);
      IOHIDEventSystemClientUnregisterEventCallback(*(void *)(qword_1C070 + 88), sub_484C, 0LL, 0LL);
      uint64_t v8 = qword_1C070;
      uint64_t v11 = *(const void **)(qword_1C070 + 88);
      if (v11)
      {
        CFRelease(v11);
        uint64_t v8 = qword_1C070;
        *(void *)(qword_1C070 + 88) = 0LL;
      }
    }

    [*(id *)(v8 + 80) stopDeviceMotionUpdates];

    *(void *)(qword_1C070 + 80) = 0LL;
    objc_autoreleasePoolPop(v7);
    sub_4324();
    for (uint64_t i = 36LL; i != 52; i += 4LL)
      notify_cancel(*(_DWORD *)(qword_1C070 + i));
    dispatch_sync(*(dispatch_queue_t *)qword_1C070, &stru_18E28);
    BKSDisplayServicesSetCloneRotationDisabled(0LL);
    unsigned int v39 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v13 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v39, &type);
    uint64_t v14 = v39;
    uint64_t v15 = type;
    if (os_log_type_enabled(v13, type)) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = v14 & 0xFFFFFFFE;
    }
    if ((_DWORD)v16)
    {
      int v40 = 136315138;
      __int16 v41 = "FigOctaviaUninitializeStevenote";
      v17 = (uint64_t *)_os_log_send_and_compose_impl( v16,  0LL,  &v42,  128LL,  &dword_0,  v13,  v15,  "<<< stevenote >>> %s: <Stevenote>: BKSDisplayServicesSetCloneRotationDisabled completed",  (const char *)&v40);
      uint64_t v14 = v39;
    }

    else
    {
      v17 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v17, v17 != &v42, v14, 0LL);
    uint64_t v18 = qword_1C070;
    IOPMAssertionID v19 = *(_DWORD *)(qword_1C070 + 68);
    if (v19)
    {
      IOPMAssertionRelease(v19);
      uint64_t v18 = qword_1C070;
    }

    *(_DWORD *)(v18 + 68) = 0;
    if (*(_BYTE *)(v18 + 96))
    {
      unsigned int v39 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v20 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v39, &type);
      uint64_t v21 = v39;
      uint64_t v22 = type;
      if (os_log_type_enabled(v20, type)) {
        uint64_t v23 = v21;
      }
      else {
        uint64_t v23 = v21 & 0xFFFFFFFE;
      }
      if ((_DWORD)v23)
      {
        int v40 = 136315138;
        __int16 v41 = "FigOctaviaUninitializeStevenote";
        uint64_t v24 = (uint64_t *)_os_log_send_and_compose_impl( v23,  0LL,  &v42,  128LL,  &dword_0,  v20,  v22,  "<<< stevenote >>> %s: <Stevenote>: neroNLCUninitialize",  (const char *)&v40);
        uint64_t v21 = v39;
      }

      else
      {
        uint64_t v24 = 0LL;
      }

      fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v24, v24 != &v42, v21, 0LL);
      uint64_t v55 = 0LL;
      __int128 v54 = 0u;
      __int128 v53 = 0u;
      __int128 v52 = 0u;
      __int128 v51 = 0u;
      __int128 v50 = 0u;
      __int128 v49 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      if (sub_44D4())
      {
        if (*(_BYTE *)(qword_1C070 + 32))
        {
          uint64_t v42 = 0x100000015LL;
        }
      }

      unsigned int v39 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v25 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v39, &type);
      uint64_t v26 = v39;
      uint64_t v27 = type;
      if (os_log_type_enabled(v25, type)) {
        uint64_t v28 = v26;
      }
      else {
        uint64_t v28 = v26 & 0xFFFFFFFE;
      }
      if ((_DWORD)v28)
      {
        int v40 = 136315138;
        __int16 v41 = "FigOctaviaUninitializeStevenote";
        v29 = (uint64_t *)_os_log_send_and_compose_impl( v28,  0LL,  &v42,  128LL,  &dword_0,  v25,  v27,  "<<< stevenote >>> %s: <Stevenote>: neroNLCUninitialize completed",  (const char *)&v40);
        uint64_t v26 = v39;
      }

      else
      {
        v29 = 0LL;
      }

      fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v29, v29 != &v42, v26, 0LL);
      uint64_t v18 = qword_1C070;
    }

    io_connect_t v30 = *(_DWORD *)(v18 + 12);
    if (v30)
    {
      IOServiceClose(v30);
      uint64_t v18 = qword_1C070;
      *(_DWORD *)(qword_1C070 + 12) = 0;
    }

    io_object_t v31 = *(_DWORD *)(v18 + 8);
    if (v31)
    {
      IOObjectRelease(v31);
      *(_DWORD *)(qword_1C070 + 8) = 0;
    }

    unsigned int v39 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v32 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v39, &type);
    uint64_t v33 = v39;
    uint64_t v34 = type;
    if (os_log_type_enabled(v32, type)) {
      uint64_t v35 = v33;
    }
    else {
      uint64_t v35 = v33 & 0xFFFFFFFE;
    }
    if ((_DWORD)v35)
    {
      int v40 = 136315138;
      __int16 v41 = "FigOctaviaUninitializeStevenote";
      v36 = (uint64_t *)_os_log_send_and_compose_impl( v35,  0LL,  &v42,  128LL,  &dword_0,  v32,  v34,  "<<< stevenote >>> %s: <Stevenote>: neroIOAccessoryUninitialize completed",  (const char *)&v40);
      uint64_t v33 = v39;
    }

    else
    {
      v36 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v36, v36 != &v42, v33, 0LL);
    dispatch_release(*(dispatch_object_t *)qword_1C070);
    v37 = (void *)qword_1C070;
    if (*(void *)(qword_1C070 + 104))
    {
      CFRelease(*(CFTypeRef *)(qword_1C070 + 104));
      v37 = (void *)qword_1C070;
      *(void *)(qword_1C070 + 104) = 0LL;
    }

    free(v37);
    qword_1C070 = 0LL;
  }

uint64_t sub_4324()
{
  uint64_t v0 = qword_1C070;
  uint64_t v1 = *(const __SCDynamicStore **)(qword_1C070 + 56);
  if (v1)
  {
    SCDynamicStoreSetDispatchQueue(v1, 0LL);
    uint64_t v0 = qword_1C070;
  }

  *(void *)(v0 + 56) = 0LL;
  uint64_t v2 = *(IONotificationPort **)(v0 + 16);
  if (v2)
  {
    IONotificationPortDestroy(v2);
    uint64_t v0 = qword_1C070;
    *(void *)(qword_1C070 + 16) = 0LL;
  }

  uint64_t result = *(unsigned int *)(v0 + 24);
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(qword_1C070 + 24) = 0;
  }

  return result;
}

uint64_t sub_4388(uint64_t result, uint64_t a2, void *a3, BOOL *a4)
{
  *a3 = 0LL;
  *a4 = (_DWORD)result == 1852125503;
  return result;
}

CFDataRef sub_43A4()
{
  if (!qword_1C070) {
    return 0LL;
  }
  uint64_t v0 = objc_autoreleasePoolPush();
  id v1 = *(id *)(qword_1C070 + 80);
  if (v1 && (v2 = [v1 deviceMotion]) != 0 && (id v3 = objc_msgSend(v2, "attitude")) != 0)
  {
    [v3 quaternion];
    v10[0] = v4;
    v10[1] = v5;
    v10[2] = v6;
    v10[3] = v7;
    CFDataRef v8 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v10, 32LL);
  }

  else
  {
    CFDataRef v8 = 0LL;
  }

  objc_autoreleasePoolPop(v0);
  return v8;
}

uint64_t sub_4440(unsigned int a1)
{
  return BKSDisplayServicesSetCloneMirroringMode(a1);
}

uint64_t sub_4448()
{
  if (qword_1C080 != -1) {
    dispatch_once(&qword_1C080, &stru_18E48);
  }
  return byte_1C078;
}

void sub_4488(id a1)
{
  BOOL v1 = MGGetSInt32Answer(@"DeviceClassNumber", 0LL) == 7;
  byte_1C078 = FigGetCFPreferenceNumberWithDefault( @"forceAudioAccessory",  @"com.apple.coremedia",  v1) != 0;
}

BOOL sub_44D4()
{
  uint64_t v25 = 0LL;
  __int128 v24 = 0u;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v21 = 0u;
  __int128 v20 = 0u;
  __int128 v19 = 0u;
  __int128 v18 = 0u;
  __int128 v17 = 0u;
  __int128 v16 = 0u;
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  __int128 v13 = 0u;
  uint64_t v12 = 0x200000015LL;
  BOOL result = sub_4630((uint64_t)&v12);
  if (result)
  {
    uint64_t v1 = 0LL;
    LOBYTE(v2) = 1;
    while (1)
    {
      while (1)
      {
        id v3 = (char *)&v12 + 100 * v1;
        __int128 v4 = *(_OWORD *)(v3 + 8);
        __int128 v5 = *(_OWORD *)(v3 + 56);
        char v6 = v2;
        __int128 v7 = *(_OWORD *)(v3 + 88);
        v28[0] = *(_OWORD *)(v3 + 72);
        v28[1] = v7;
        int v29 = *((_DWORD *)v3 + 26);
        __int128 v8 = *(_OWORD *)(v3 + 24);
        __int128 v26 = v4;
        v27[0] = v8;
        v27[1] = *(_OWORD *)(v3 + 40);
        v27[2] = v5;
        if ((v2 & 1) != 0) {
          break;
        }
        uint64_t v9 = (float *)v27 + 3;
        if ((v26 & 4) != 0) {
          goto LABEL_5;
        }
LABEL_10:
        LOBYTE(v2) = 0;
        uint64_t v1 = 1LL;
        if ((v6 & 1) == 0) {
          return 0LL;
        }
      }

      uint64_t v9 = (float *)v28;
      if ((v26 & 8) == 0) {
        goto LABEL_10;
      }
LABEL_5:
      if (v9[2] != 0.0) {
        return 1LL;
      }
      int v2 = *((_DWORD *)v9 + 3);
      if (v2) {
        return 1LL;
      }
      int v10 = *(_DWORD *)v9;
      char v11 = (*(_DWORD *)v9 == 0) & v6;
      uint64_t v1 = 1LL;
      if ((v11 & 1) == 0) {
        return v10 != 0;
      }
    }
  }

  return result;
}

BOOL sub_4630(uint64_t a1)
{
  uint64_t v4 = 0LL;
  if (a1)
  {
    uint64_t v1 = a1;
    LODWORD(a1) = _nlc_connect(&v4);
    if ((_DWORD)a1 == 1)
    {
      int v2 = *(_DWORD *)(v1 + 4);
      if (v2)
      {
        if (v2 == 1)
        {
          _nlc_stop_simulation((uint64_t)&v4, (__int128 *)v1);
        }

        else if (v2 == 2)
        {
          _nlc_get_status((uint64_t)&v4, (_DWORD *)v1);
        }
      }

      else
      {
        _nlc_start_simulation((uint64_t)&v4, (__int128 *)v1);
      }

      LODWORD(a1) = _nlc_disconnect((mach_port_t *)&v4);
    }
  }

  return (_DWORD)a1 == 1;
}

void sub_46C0(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == -469794795) {
    sub_3AD8();
  }
}

void sub_46D8(id a1)
{
  qword_1C090 = (uint64_t)SCDynamicStoreCreate( kCFAllocatorDefault,  @"AddIPAddressListChangeCallbackSCF",  (SCDynamicStoreCallBack)sub_47C4,  0LL);
  if (!qword_1C090) {
    return;
  }
  Mutable = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetIPv4);
  CFStringRef v3 = NetworkServiceEntity;
  if (Mutable) {
    BOOL v4 = NetworkServiceEntity == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    CFArrayAppendValue(Mutable, NetworkServiceEntity);
    SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)qword_1C090, 0LL, Mutable);
    goto LABEL_10;
  }

  if (NetworkServiceEntity)
  {
LABEL_10:
    CFRelease(v3);
    if (Mutable) {
      goto LABEL_11;
    }
    return;
  }

  if (Mutable) {
LABEL_11:
  }
    CFRelease(Mutable);
}

void sub_47C8(id a1)
{
  qword_1C0A0 = MGCopyAnswer(@"UniqueDeviceID", 0LL);
  CFTypeRef ModelSpecificName = (CFTypeRef)CelestialGetModelSpecificName();
  if (ModelSpecificName) {
    CFTypeRef ModelSpecificName = CFRetain(ModelSpecificName);
  }
  qword_1C0A8 = (uint64_t)ModelSpecificName;
  qword_1C0B0 = MGCopyAnswer(@"DeviceColor", 0LL);
  qword_1C0B8 = MGCopyAnswer(@"DeviceEnclosureColor", 0LL);
  qword_1C0C0 = MGCopyAnswer(@"BuildVersion", 0LL);
}

void sub_484C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (IOHIDEventGetIntegerValue(a4, 196608LL) == 12 && IOHIDEventGetIntegerValue(a4, 196610LL))
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue(a4, 196609LL);
    if (IntegerValue == 233)
    {
      CFTypeRef cf = 0LL;
      int v13 = *(_DWORD *)(qword_1C070 + 72) ^ 1;
      *(_DWORD *)(qword_1C070 + 72) = v13;
      uint64_t v10 = FigCreateBlockBufferCopyingMemoryBlock(kCFAllocatorDefault, &v13, 4LL, &cf);
      if (!(_DWORD)v10)
      {
        uint64_t v11 = *(void *)(qword_1C070 + 104);
        uint64_t RemoteRootObject = FigTransportGetRemoteRootObject(v10);
        NeroTransportSendAsyncMessage(v11, RemoteRootObject, 1936615014LL, cf);
      }
    }

    else
    {
      if (IntegerValue != 234) {
        return;
      }
      CFDataRef v6 = sub_43A4();
      CFTypeRef cf = 0LL;
      uint64_t v7 = FigRemote_CreateSerializedAtomDataBlockBufferForCFType(kCFAllocatorDefault, v6, &cf);
      if (!(_DWORD)v7)
      {
        uint64_t v8 = *(void *)(qword_1C070 + 104);
        uint64_t v9 = FigTransportGetRemoteRootObject(v7);
        NeroTransportSendAsyncMessage(v8, v9, 1936028720LL, cf);
      }

      if (v6) {
        CFRelease(v6);
      }
    }

    if (cf) {
      CFRelease(cf);
    }
  }

uint64_t sub_4988(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2) {
    [v2 resetLines];
  }
  *(void *)(a1 + 24) = 0LL;
  return 0LL;
}

uint64_t sub_49B8(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  if (!*(void *)(a1 + 16)) {
    return -1LL;
  }
  if (a3) {
    __int128 v5 = a3;
  }
  else {
    __int128 v5 = @" ";
  }
  CFDataRef v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setValue:forKey:]( &OBJC_CLASS___CATransaction,  "setValue:forKey:",  kCFBooleanTrue,  kCATransactionDisableActions);
  id v7 = [*(id *)(a1 + 16) addLine:a2 withColorIndex:*(unsigned int *)(a1 + 24)];
  [*(id *)(a1 + 16) setValue:v5 atIndex:v7];
  uint64_t v8 = *(void **)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  if (v9 <= 16) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = 0LL;
  }
  *(void *)(a1 + 24) = v10;
  [v8 setNeedsDisplay];
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  -[NSAutoreleasePool drain](v6, "drain");
  return (uint64_t)v7;
}

uint64_t sub_4A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 16))
  {
    CFDataRef v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    +[CATransaction setValue:forKey:]( &OBJC_CLASS___CATransaction,  "setValue:forKey:",  kCFBooleanTrue,  kCATransactionDisableActions);
    [*(id *)(a1 + 16) setValue:a3 atIndex:a2];
    [*(id *)(a1 + 16) setNeedsDisplay];
    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    -[NSAutoreleasePool drain](v6, "drain");
  }

  return 0LL;
}

void sub_4B34(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    int v2 = (const __CFArray *)[v1 getValues];
    if (v2)
    {
      CFStringRef v3 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, v2, @" ");
      if (v3) {
        CFRelease(v3);
      }
    }
  }

void sub_4B7C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    int v2 = (const __CFArray *)[v1 getLabels];
    if (v2)
    {
      CFStringRef v3 = CFStringCreateByCombiningStrings(kCFAllocatorDefault, v2, @" ");
      if (v3) {
        CFRelease(v3);
      }
    }
  }

uint64_t sub_4BC4(uint64_t a1, const AudioStreamBasicDescription *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0LL;
  if (!a3) {
    return 4294950504LL;
  }
  uint64_t ClassID = FigEndpointAudioSinkGetClassID();
  uint64_t v7 = CMDerivedObjectCreate(a1, &unk_18EA8, ClassID, &cf);
  if ((_DWORD)v7
    || (uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf),
        uint64_t v7 = CMAudioFormatDescriptionCreate( kCFAllocatorDefault,  a2,  0LL,  0LL,  0LL,  0LL,  0LL,  (CMAudioFormatDescriptionRef *)DerivedStorage),  (_DWORD)v7))
  {
    if (cf) {
      CFRelease(cf);
    }
  }

  else
  {
    *(void *)(DerivedStorage + 40) = 0x20000LL;
    *(void *)(DerivedStorage + 32) = malloc(0x20000uLL);
    *(void *)(DerivedStorage + 24) = dispatch_queue_create("com.apple.coremedia.neroaudiosink", 0LL);
    sub_4CB8((uint64_t)cf);
    *a3 = cf;
  }

  return v7;
}

void sub_4CB8(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v2 = *(dispatch_queue_s **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_52E4;
  block[3] = &unk_18FC8;
  block[4] = DerivedStorage;
  dispatch_sync(v2, block);
}

void sub_4D14()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(void *)uint64_t DerivedStorage = 0LL;
  }

  free(*(void **)(DerivedStorage + 32));
  dispatch_release(*(dispatch_object_t *)(DerivedStorage + 24));
}

__CFString *sub_4D50(uint64_t a1)
{
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<FigNeroAudioSink %p>", a1);
  return Mutable;
}

uint64_t sub_4DA4(uint64_t a1, const void *a2, uint64_t a3, CFNumberRef *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, (const void *)(DerivedStorage + 8));
  uint64_t result = 0LL;
  *a4 = v7;
  return result;
}

uint64_t sub_4E18(uint64_t a1, const void *a2, const __CFNumber *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFNumberGetValue(a3, kCFNumberSInt32Type, (void *)(DerivedStorage + 8));
  return 0LL;
}

uint64_t sub_4E7C(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = (CMAudioFormatDescriptionRef *)CMBaseObjectGetDerivedStorage();
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*DerivedStorage);
  uint64_t v5 = *(void *)&StreamBasicDescription->mBitsPerChannel;
  __int128 v6 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
  *(_OWORD *)a2 = *(_OWORD *)&StreamBasicDescription->mSampleRate;
  *(_OWORD *)(a2 + 16) = v6;
  *(void *)(a2 + 32) = v5;
  return 0LL;
}

uint64_t sub_4EB8()
{
  *(_BYTE *)(CMBaseObjectGetDerivedStorage() + 16) = 0;
  return 0LL;
}

uint64_t sub_4ED4()
{
  *(_BYTE *)(CMBaseObjectGetDerivedStorage() + 16) = 1;
  return 0LL;
}

uint64_t sub_4EF4(uint64_t a1)
{
  return 0LL;
}

uint64_t sub_4F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFNumberRef v7 = *(dispatch_queue_s **)(DerivedStorage + 24);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000LL;
  v9[2] = sub_50CC;
  v9[3] = &unk_18F60;
  v9[4] = a1;
  v9[5] = DerivedStorage;
  v9[6] = a2;
  v9[7] = a3;
  dispatch_sync(v7, v9);
  return 0LL;
}

uint64_t sub_4F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  __int128 v6 = *(dispatch_queue_s **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_5160;
  block[3] = &unk_18F80;
  block[4] = DerivedStorage;
  void block[5] = a3;
  block[6] = a1;
  dispatch_sync(v6, block);
  return 0LL;
}

uint64_t sub_5000(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  unint64_t v7 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  uint64_t v14 = 0LL;
  if (!*(_BYTE *)(DerivedStorage + 17))
  {
    uint64_t v8 = *(dispatch_queue_s **)(DerivedStorage + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_51E4;
    block[3] = &unk_18FA8;
    block[4] = &v11;
    void block[5] = a1;
    block[6] = a3;
    void block[7] = DerivedStorage;
    block[8] = a2;
    dispatch_sync(v8, block);
    unint64_t v7 = v12[3];
  }

  if (a3 > v7) {
    bzero((void *)(a2 + v7), a3 - v7);
  }
  _Block_object_dispose(&v11, 8);
  return 0LL;
}

uint64_t sub_50CC(uint64_t a1)
{
  uint64_t result = CMBaseObjectGetDerivedStorage(*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(result + 64);
  uint64_t v4 = 40LL;
  if (v3 < *(void *)(result + 48)) {
    uint64_t v4 = 56LL;
  }
  uint64_t v5 = *(void *)(result + v4) - v3;
  __int128 v6 = *(void **)(a1 + 40);
  if ((unint64_t)v5 >= 0x4000)
  {
    uint64_t v7 = v6[8];
  }

  else
  {
    v6[8] = 0LL;
    uint64_t v5 = v6[7];
    uint64_t v7 = 0LL;
    if (v5 < 0x4000)
    {
      uint64_t v5 = 0x8000LL;
      v6[7] = 0x8000LL;
    }
  }

  **(void **)(a1 + 48) = v6[4] + v7;
  **(void **)(a1 + 56) = v5;
  return result;
}

void *sub_5160(void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = result[4];
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 64) + result[5];
  *(void *)(v2 + 64) = v4;
  if (v4 > v3) {
    *(void *)(v2 + 48) = v4;
  }
  if (v4 == *(void *)(v2 + 40)) {
    *(void *)(v2 + 64) = 0LL;
  }
  if (*(_BYTE *)(v2 + 17))
  {
    uint64_t result = (void *)CMBaseObjectGetDerivedStorage(result[6]);
    uint64_t v5 = result[6];
    uint64_t v6 = v5 - result[7];
    if (result[8] >= v5) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = result[8];
    }
    unint64_t v8 = v6 + v7;
    uint64_t v9 = v1[4];
  }

  return result;
}

void *sub_51E4(void *a1)
{
  uint64_t result = (void *)CMBaseObjectGetDerivedStorage(a1[5]);
  uint64_t v3 = result[6];
  uint64_t v4 = v3 - result[7];
  if (result[8] >= v3) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = result[8];
  }
  unint64_t v6 = v4 + v5;
  if (a1[6] < v6) {
    unint64_t v6 = a1[6];
  }
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = v6;
  size_t v7 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  if (v7)
  {
    unint64_t v8 = (void *)a1[7];
    int64_t v10 = v8[6];
    int64_t v9 = v8[7];
    char v11 = 1;
    do
    {
      size_t v12 = v10 - v9;
      if (v12 >= v7) {
        size_t v13 = v7;
      }
      else {
        size_t v13 = v12;
      }
      uint64_t result = memcpy( (void *)(a1[8] + *(void *)(*(void *)(a1[4] + 8LL) + 24LL) - v7),  (const void *)(v8[4] + v9),  v13);
      unint64_t v8 = (void *)a1[7];
      int64_t v9 = v8[7] + v13;
      v8[7] = v9;
      int64_t v10 = v8[6];
      if (v9 == v10)
      {
        int64_t v10 = v8[8];
        if (v9 <= v10)
        {
          v8[6] = 0LL;
          v8[7] = 0LL;
          v8[8] = 0LL;
          return result;
        }

        int64_t v9 = 0LL;
        v8[6] = v10;
        v8[7] = 0LL;
      }

      v7 -= v13;
      char v14 = (v7 != 0) & v11;
      char v11 = 0;
    }

    while ((v14 & 1) != 0);
  }

  return result;
}

uint64_t sub_52E4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  *(void *)(v1 + 48) = 0LL;
  *(void *)(v1 + 56) = 0LL;
  *(void *)(v1 + 64) = 0LL;
  *(_BYTE *)(v1 + 17) = 1;
  *(_DWORD *)(v1 + 12) = 28800;
  return result;
}

uint64_t sub_5304(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, const void *a6, CFTypeRef *a7)
{
  CFTypeRef cf = 0LL;
  int v30 = 0;
  if (!a6)
  {
    FigSignalErrorAt(4294950405LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    return 0LL;
  }

  uint64_t ClassID = FigHALAudioStreamGetClassID();
  uint64_t v15 = CMDerivedObjectCreate(a1, &unk_18FE8, ClassID, &cf);
  CFTypeRef v16 = cf;
  if ((_DWORD)v15 || (v15 = FigHALAudioObjectMapperAddMapping(a2, cf, &v30), CFTypeRef v16 = cf, (_DWORD)v15))
  {
    uint64_t v27 = v15;
  }

  else
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
    *(_DWORD *)uint64_t DerivedStorage = v30;
    *(_DWORD *)(DerivedStorage + 16) = a3;
    *(void *)(DerivedStorage + 8) = a5;
    if (a4) {
      CFTypeRef v18 = CFRetain(a4);
    }
    else {
      CFTypeRef v18 = 0LL;
    }
    *(void *)(DerivedStorage + 24) = v18;
    *(void *)(DerivedStorage + 48) = CFRetain(a6);
    CFTypeRef v19 = cf;
    uint64_t v20 = CMBaseObjectGetDerivedStorage(cf);
    __int128 v21 = *(const __CFData **)(*(void *)(v20 + 48) + 88LL);
    if (v21 && (unint64_t)CFDataGetLength(v21) >= 0x38)
    {
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(v20 + 48) + 88LL));
      __int128 v23 = *(_OWORD *)(BytePtr + 24);
      __int128 v32 = *(_OWORD *)(BytePtr + 8);
      __int128 v33 = v23;
      uint64_t v24 = *((void *)BytePtr + 5);
      uint64_t v25 = *(void *)(CMBaseObjectGetDerivedStorage(v19) + 48);
      *(void *)(v25 + 16) = v24;
      __int128 v26 = v32;
      *(_OWORD *)(v25 + 40) = v33;
      *(_OWORD *)(v25 + 24) = v26;
LABEL_10:
      uint64_t v27 = 0LL;
      *a7 = cf;
      return v27;
    }

    uint64_t v29 = FigSignalErrorAt(4294950405LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if (!(_DWORD)v29) {
      goto LABEL_10;
    }
    uint64_t v27 = v29;
    CFTypeRef v16 = cf;
  }

  if (v16) {
    CFRelease(v16);
  }
  return v27;
}

void sub_54C4(uint64_t a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v2 = (const void *)DerivedStorage[3];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[3] = 0LL;
  }

  uint64_t v3 = (const void *)DerivedStorage[6];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[6] = 0LL;
  }

  uint64_t v4 = (const void *)DerivedStorage[4];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[4] = 0LL;
  }

CFStringRef sub_5514(uint64_t a1)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"NeroAudioInputStream ID %d Owner %d EndpointStream %p AudioSink %p",  *DerivedStorage,  DerivedStorage[4],  *((void *)DerivedStorage + 3),  *((void *)DerivedStorage + 4));
}

uint64_t sub_5564(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!a4) {
    return 4294950405LL;
  }
  uint64_t v7 = DerivedStorage;
  if (!CFEqual(a2, kFigHALAudioStreamProperty_SupportedPCMFormats)) {
    return 4294954509LL;
  }
  unint64_t v8 = *(const void **)(*(void *)(v7 + 48) + 88LL);
  if (v8) {
    CFTypeRef v9 = CFRetain(v8);
  }
  else {
    CFTypeRef v9 = 0LL;
  }
  uint64_t result = 0LL;
  *a4 = v9;
  return result;
}

uint64_t sub_55E4(uint64_t a1)
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage(a1);
}

uint64_t sub_55FC(uint64_t a1, int *a2)
{
  uint64_t result = 0LL;
  int v3 = *a2;
  if (*a2 <= 1935762291)
  {
    if (v3 > 1870098019)
    {
      BOOL v4 = v3 == 1870098020 || v3 == 1885762592;
      int v5 = 1885762657;
    }

    else
    {
      BOOL v4 = v3 == 1650682995 || v3 == 1668047219;
      int v5 = 1819569763;
    }
  }

  else if (v3 <= 1936092512)
  {
    BOOL v4 = v3 == 1935762292 || v3 == 1935894638;
    int v5 = 1935960434;
  }

  else if (v3 > 1937007733)
  {
    BOOL v4 = v3 == 1952805485;
    int v5 = 1937007734;
  }

  else
  {
    BOOL v4 = v3 == 1936092513;
    int v5 = 1936092532;
  }

  if (v4 || v3 == v5) {
    return 1LL;
  }
  return result;
}

BOOL sub_56EC(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1885762592 || v2 == 1936092532 || v2 == 1935762292;
}

uint64_t sub_5720(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t result = 0LL;
  int v5 = *a2;
  if (*a2 > 1935894637)
  {
    if (v5 <= 1936092531)
    {
      if (v5 == 1935894638 || v5 == 1935960434) {
        return 4LL;
      }
      if (v5 != 1936092513) {
        return result;
      }
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 48) + 88LL)) / 0x38uLL);
    }

    if (v5 != 1936092532)
    {
      if (v5 == 1937007734) {
        return 4LL;
      }
      int v7 = 1952805485;
LABEL_21:
      if (v5 != v7) {
        return result;
      }
      return 4LL;
    }

    return 40LL;
  }

  if (v5 > 1885762591)
  {
    if (v5 != 1885762592)
    {
      if (v5 != 1885762657)
      {
        int v7 = 1935762292;
        goto LABEL_21;
      }

      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 48) + 88LL)) / 0x38uLL);
    }

    return 40LL;
  }

  if (v5 != 1650682995 && v5 != 1668047219)
  {
    int v7 = 1819569763;
    goto LABEL_21;
  }

  return 4LL;
}

uint64_t sub_586C(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, void *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v12 = *a2;
  uint64_t result = 2003332927LL;
  if (*a2 <= 1935894637)
  {
    if (v12 <= 1885762591)
    {
      if (v12 != 1650682995)
      {
        if (v12 != 1668047219)
        {
          if (v12 != 1819569763) {
            return result;
          }
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0LL;
            *(_DWORD *)a7 = 0;
            return result;
          }

          return 561211770LL;
        }

        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0LL;
          int v14 = 1634956402;
          goto LABEL_35;
        }

        return 561211770LL;
      }

      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t result = 0LL;
      int v14 = 1634689642;
      goto LABEL_35;
    }

    if (v12 != 1885762592)
    {
      if (v12 != 1885762657)
      {
        if (v12 != 1935762292) {
          return result;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t result = 0LL;
        int v14 = *(unsigned __int8 *)(DerivedStorage + 40);
        goto LABEL_35;
      }

      goto LABEL_25;
    }

LABEL_27:
    *a6 = 40;
    if (a5 >= 0x28)
    {
      uint64_t result = 0LL;
      uint64_t v17 = *(void *)(DerivedStorage + 48);
      __int128 v18 = *(_OWORD *)(v17 + 16);
      __int128 v19 = *(_OWORD *)(v17 + 32);
      a7[4] = *(void *)(v17 + 48);
      *(_OWORD *)a7 = v18;
      *((_OWORD *)a7 + 1) = v19;
      return result;
    }

    return 561211770LL;
  }

  if (v12 > 1936092531)
  {
    if (v12 != 1936092532)
    {
      if (v12 == 1937007734)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0LL;
          int v14 = *(_DWORD *)(DerivedStorage + 16);
          goto LABEL_35;
        }

        return 561211770LL;
      }

      if (v12 != 1952805485) {
        return result;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t result = 0LL;
      int v14 = 1936747378;
LABEL_35:
      *(_DWORD *)a7 = v14;
      return result;
    }

    goto LABEL_27;
  }

  if (v12 == 1935894638 || v12 == 1935960434)
  {
    *a6 = 4;
    if (a5 < 4) {
      return 561211770LL;
    }
    uint64_t result = 0LL;
    int v14 = 1;
    goto LABEL_35;
  }

  if (v12 == 1936092513)
  {
LABEL_25:
    size_t v15 = 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 48) + 88LL)) / 0x38uLL);
    *a6 = v15;
    if (v15 <= a5)
    {
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 48) + 88LL));
      memcpy(a7, BytePtr, v15);
      return 0LL;
    }

    return 561211770LL;
  }

  return result;
}

    mach_msg_destroy(&msg);
    return v7;
  }

  return 4294966989LL;
}

uint64_t sub_5B10(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, __int128 *a6)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  int64_t v10 = DerivedStorage;
  uint64_t v20 = 0LL;
  int v11 = *a2;
  if (*a2 != 1885762592 && v11 != 1936092532)
  {
    if (v11 != 1935762292)
    {
      uint64_t v14 = 0LL;
      uint64_t v13 = 2003332927LL;
      goto LABEL_16;
    }

    if (a5 == 4)
    {
      int v15 = *(_DWORD *)a6 != 0;
      if (*((unsigned __int8 *)DerivedStorage + 40) != v15)
      {
        *((_BYTE *)DerivedStorage + 40) = v15;
        FigHALAudioPropertySendOneChange( *((void *)DerivedStorage + 1),  *DerivedStorage,  1935762292LL,  a2[1],  a2[2]);
      }

      uint64_t v14 = 0LL;
      uint64_t v13 = 0LL;
      goto LABEL_16;
    }

LABEL_14:
    uint64_t v14 = 0LL;
    uint64_t v13 = 561211770LL;
    goto LABEL_16;
  }

  if (a5 != 40) {
    goto LABEL_14;
  }
  __int128 v17 = *a6;
  __int128 v18 = a6[1];
  uint64_t v19 = *((void *)a6 + 4);
  uint64_t v13 = FigHALAudioConfigChangeCreateRecord(*DerivedStorage, a2, &v20);
  uint64_t v14 = v20;
  if (!(_DWORD)v13)
  {
    *(_OWORD *)(v20 + 16) = v17;
    *(_OWORD *)(v14 + 32) = v18;
    *(void *)(v14 + 48) = v19;
    FigHALAudioConfigChangeSendRequest(*((void *)v10 + 1), v10[4], 1768321645LL);
    uint64_t v14 = 0LL;
    uint64_t v20 = 0LL;
  }

    uint64_t v14 = 0LL;
    uint64_t v13 = 561211770LL;
    goto LABEL_16;
  }

  if (a5 != 40) {
    goto LABEL_14;
  }
  __int128 v17 = *a6;
  __int128 v18 = a6[1];
  uint64_t v19 = *((void *)a6 + 4);
  uint64_t v13 = FigHALAudioConfigChangeCreateRecord(*DerivedStorage, a2, &v20);
  uint64_t v14 = v20;
  if (!(_DWORD)v13)
  {
    *(_OWORD *)(v20 + 16) = v17;
    *(_OWORD *)(v14 + 32) = v18;
    *(void *)(v14 + 48) = v19;
    FigHALAudioConfigChangeSendRequest(*((void *)v10 + 1), v10[4], 1868984941LL);
    uint64_t v14 = 0LL;
    uint64_t v20 = 0LL;
  }

  dword_1C120 = v11;
}

              *(double *)__s2 = v13;
              __int128 v22 = *(_OWORD *)(v21 + 24);
              *(_OWORD *)((char *)__s2 + 8) = *(_OWORD *)(v21 + 8);
              *(_OWORD *)((char *)&__s2[1] + 8) = v22;
              if (!memcmp(&v30, __s2, 0x28uLL)) {
                goto LABEL_19;
              }
              __int128 v23 = *((void *)v10 + 11);
              uint64_t v24 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v23) + 16) + 8LL);
              if (v24) {
                uint64_t v25 = v24(v23);
              }
              else {
                uint64_t v25 = 0LL;
              }
              uint64_t v27 = FigHALAudioConfigChangeCreateRecord(v25, a2, &v35);
              __int128 v26 = v35;
              if (!(_DWORD)v27)
              {
                uint64_t v28 = __s2[1];
                *(_OWORD *)(v35 + 16) = __s2[0];
                *(_OWORD *)(v26 + 32) = v28;
                *(void *)(v26 + 48) = *(void *)&__s2[2];
                FigHALAudioConfigChangeSendRequest(*((void *)v10 + 1), *v10, 1868984941LL);
                __int128 v26 = 0LL;
                uint64_t v35 = 0LL;
              }
            }
          }
        }

        else
        {
          __int128 v26 = 0LL;
          uint64_t v27 = 4294954514LL;
        }
      }
    }

    else
    {
      __int128 v26 = 0LL;
      uint64_t v27 = 561211770LL;
    }
  }

  else
  {
    __int128 v26 = 0LL;
    uint64_t v27 = 2003332927LL;
  }

LABEL_16:
  FigHALAudioConfigChangeDisposeRecord(v14);
  return v13;
}

  FigHALAudioConfigChangeDisposeRecord(v14);
  return v13;
}

uint64_t sub_5C54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a2 == 1768321645)
  {
    int v7 = (unsigned int *)DerivedStorage;
    uint64_t v8 = *(void *)(CMBaseObjectGetDerivedStorage(a1) + 48);
    __int128 v10 = *(_OWORD *)(a3 + 16);
    __int128 v9 = *(_OWORD *)(a3 + 32);
    *(void *)(v8 + 48) = *(void *)(a3 + 48);
    *(_OWORD *)(v8 + 16) = v10;
    *(_OWORD *)(v8 + 32) = v9;
    FigHALAudioPropertySendChanges(*((void *)v7 + 1), *v7, 1LL, a3 + 4);
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = FigSignalErrorAt(1852797029LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  FigHALAudioConfigChangeDisposeRecord(a3);
  return v11;
}

uint64_t sub_5D08(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!*(_BYTE *)(DerivedStorage + 40)) {
    return 0LL;
  }
  uint64_t v2 = DerivedStorage;
  uint64_t v3 = *(void *)(DerivedStorage + 48);
  *(void *)(v3 + 136) = 0LL;
  uint64_t result = sub_4BC4( (uint64_t)kCFAllocatorDefault,  (const AudioStreamBasicDescription *)(v3 + 16),  (CFTypeRef *)(DerivedStorage + 32));
  if (!(_DWORD)result)
  {
    uint64_t v5 = *(void *)(v2 + 24);
    uint64_t v6 = *(void *)(v2 + 32);
    uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(v5);
    uint64_t v8 = *(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(CMBaseObjectGetVTable(CMBaseObject) + 8) + 56LL);
    if (v8) {
      return v8(CMBaseObject, kFigEndpointStreamProperty_AudioSink, v6);
    }
    else {
      return 4294954514LL;
    }
  }

  return result;
}

uint64_t sub_5D9C(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v2 = *(const void **)(DerivedStorage + 32);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 32) = 0LL;
  }

  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(*(void *)(DerivedStorage + 24));
  BOOL v4 = *(uint64_t (**)(uint64_t, void, void))(*(void *)(CMBaseObjectGetVTable() + 8) + 56LL);
  if (v4) {
    return v4(CMBaseObject, kFigEndpointStreamProperty_AudioSink, 0LL);
  }
  else {
    return 4294954514LL;
  }
}

uint64_t sub_5E0C(uint64_t a1, int a2, unsigned int a3, uint64_t a4, void *a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v10 = *(void *)(DerivedStorage + 48);
  if (!*(_BYTE *)(v10 + 196)) {
    return 1937010544LL;
  }
  if (a2 != 1919246692) {
    return FigSignalErrorAt(1970171760LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  uint64_t v11 = *(void *)(DerivedStorage + 32);
  if (!v11) {
    return 561214578LL;
  }
  *(double *)(v10 + 136) = *(double *)(a4 + 80) + (double)a3;
  size_t v12 = *(_DWORD *)(v10 + 156) * a3;
  uint64_t v13 = *(uint64_t (**)(uint64_t, void *, size_t, void))(*(void *)(CMBaseObjectGetVTable(v11) + 16) + 56LL);
  if (!v13 || (uint64_t result = v13(v11, a5, v12, 0LL), (_DWORD)result))
  {
    bzero(a5, v12);
    return 0LL;
  }

  return result;
}

uint64_t sub_5F04(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a2)
  {
    uint64_t v4 = *(void *)(DerivedStorage + 48);
    __int128 v5 = *(_OWORD *)(v4 + 16);
    __int128 v6 = *(_OWORD *)(v4 + 32);
    *(void *)(a2 + 32) = *(void *)(v4 + 48);
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
  }

  return 0LL;
}

uint64_t sub_5F40(uint64_t a1, const __CFDictionary *a2, const void *a3, CFTypeRef *a4)
{
  CFTypeRef cf = 0LL;
  uint64_t ClassID = FigVirtualDisplaySinkGetClassID();
  uint64_t v9 = CMDerivedObjectCreate(a1, &unk_19110, ClassID, &cf);
  if ((_DWORD)v9)
  {
    if (cf) {
      CFRelease(cf);
    }
  }

  else
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
    if (a2)
    {
      Value = CFDictionaryGetValue(a2, kFigVirtualDisplaySinkProperty_IsValeria);
      *(_BYTE *)(DerivedStorage + 320) = FigCFEqual(kCFBooleanTrue, Value);
      size_t v12 = CFDictionaryGetValue(a2, kFigVirtualDisplaySinkProperty_ShouldUseStevenoteJPEG);
      *(_BYTE *)(DerivedStorage + 336) = FigCFEqual(kCFBooleanTrue, v12);
    }

    *(_OWORD *)(DerivedStorage + 160) = xmmword_16020;
    sub_617C((uint64_t)cf);
    uint64_t v13 = *(void *)(DerivedStorage + 40);
    v14.i64[0] = (int)v13;
    v14.i64[1] = SHIDWORD(v13);
    *(float64x2_t *)(DerivedStorage + 176) = vcvtq_f64_s64(v14);
    *(_BYTE *)(DerivedStorage + 200) = 0;
    *(void *)(DerivedStorage + 192) = FVDUtilsCreateDisplayUUID(0LL);
    *(void *)(DerivedStorage + 296) = -1LL;
    LOBYTE(keyExistsAndHasValidFormat.value) = 0;
    uint64_t v15 = CMBaseObjectGetDerivedStorage(cf);
    Appuint64_t IntegerValue = CFPreferencesGetAppIntegerValue( @"octavia_max_pending_frames",  @"com.apple.coremedia",  (Boolean *)&keyExistsAndHasValidFormat);
    if (LOBYTE(keyExistsAndHasValidFormat.value)) {
      *(void *)(v15 + 296) = AppIntegerValue;
    }
    CMTimeMake(&keyExistsAndHasValidFormat, 2LL, 30);
    *(CMTime *)(DerivedStorage + 340) = keyExistsAndHasValidFormat;
    uint64_t v17 = CMBaseObjectGetDerivedStorage(cf);
    float valuePtr = 0.0;
    __int128 v18 = (const __CFNumber *)CFPreferencesCopyAppValue( @"octavia_max_queue_duration",  @"com.apple.coremedia");
    if (v18)
    {
      uint64_t v19 = v18;
      CFTypeID v20 = CFGetTypeID(v18);
      if (v20 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v19, kCFNumberFloat32Type, &valuePtr);
        uint64_t v21 = v17 + 340;
        if (valuePtr <= 0.0)
        {
          *(_OWORD *)uint64_t v21 = *(_OWORD *)&kCMTimeInvalid.value;
          CMTimeEpoch epoch = kCMTimeInvalid.epoch;
        }

        else
        {
          CMTimeMakeWithSeconds(&keyExistsAndHasValidFormat, valuePtr, 1000000);
          *(_OWORD *)uint64_t v21 = *(_OWORD *)&keyExistsAndHasValidFormat.value;
          CMTimeEpoch epoch = keyExistsAndHasValidFormat.epoch;
        }

        *(void *)(v21 + 16) = epoch;
      }

      CFRelease(v19);
    }

    if (a3) {
      CFTypeRef v23 = CFRetain(a3);
    }
    else {
      CFTypeRef v23 = 0LL;
    }
    *(void *)(DerivedStorage + 392) = v23;
    *a4 = cf;
  }

  return v9;
}

void sub_617C(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  double v3 = *(double *)(DerivedStorage + 160);
  double v4 = *(double *)(DerivedStorage + 168);
  if (!sub_3130() && !*(_BYTE *)(DerivedStorage + 320))
  {
    __int128 v26 = (_OWORD *)(DerivedStorage + 40);
    int v27 = (int)v3;
    int v28 = (int)v4;
    double v29 = *(double *)(DerivedStorage + 160) / *(double *)(DerivedStorage + 168);
    if (v29 >= 1.5) {
      int v30 = &unk_16088;
    }
    else {
      int v30 = &unk_160F8;
    }
    BOOL v31 = FVDUtilsH264EncoderSupports1080p60() == 0;
    __int128 v32 = &v30[4 * v31];
    if (*(_DWORD *)v32 <= v27 && v30[4 * v31 + 1] <= v28)
    {
      _OWORD *v26 = *v32;
    }

    else
    {
      *(_DWORD *)(DerivedStorage + 40) = v27;
      *(_DWORD *)(DerivedStorage + 44) = v28;
      *(void *)(DerivedStorage + 48) = 100LL;
    }

    uint64_t v35 = 3LL;
    if (v29 >= 1.5) {
      uint64_t v35 = 5LL;
    }
    v36 = (char *)(v30 + 8);
    int v37 = 1;
    do
    {
      if (*(_DWORD *)v36 <= v27)
      {
        int v38 = *((_DWORD *)v36 + 1);
        if (v38 <= v28 && (*(_DWORD *)v36 != *(_DWORD *)v26 || v38 != *(_DWORD *)(DerivedStorage + 44))) {
          v26[v37++] = *(_OWORD *)v36;
        }
      }

      v36 += 16;
      --v35;
    }

    while (v35);
    goto LABEL_80;
  }

  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v7 = (const __CFArray *)CFPreferencesCopyValue( @"octavia_mirroring_resolution",  @"com.apple.coremedia",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  if (v7)
  {
    uint64_t v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFArrayGetTypeID() && CFArrayGetCount(v8) >= 2)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v8, 0LL);
      if (ValueAtIndex)
      {
        uint64_t v11 = ValueAtIndex;
        CFTypeID v12 = CFGetTypeID(ValueAtIndex);
        if (v12 == CFStringGetTypeID()) {
          double width = (double)CFStringGetIntValue(v11);
        }
      }

      uint64_t v13 = (const __CFString *)CFArrayGetValueAtIndex(v8, 1LL);
      if (v13)
      {
        int64x2_t v14 = v13;
        CFTypeID v15 = CFGetTypeID(v13);
        if (v15 == CFStringGetTypeID()) {
          double height = (double)CFStringGetIntValue(v14);
        }
      }
    }

    CFRelease(v8);
  }

  signed int v16 = (int)width;
  signed int v17 = (int)height;
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
LABEL_71:
    if (v16 <= v17) {
      signed int v44 = v17;
    }
    else {
      signed int v44 = v16;
    }
    if (*(_BYTE *)(DerivedStorage + 320)) {
      signed int v45 = v44;
    }
    else {
      signed int v45 = v16;
    }
    if (!*(_BYTE *)(DerivedStorage + 320)) {
      signed int v44 = v17;
    }
    *(_DWORD *)(DerivedStorage + 40) = v45;
    *(_DWORD *)(DerivedStorage + 44) = v44;
    *(void *)(DerivedStorage + 48) = 0x100000064LL;
    int v37 = 1;
LABEL_80:
    *(_DWORD *)(DerivedStorage + 152) = v37;
    return;
  }

  double v19 = *(double *)(DerivedStorage + 168);
  BOOL v20 = sub_3130();
  int v21 = *(unsigned __int8 *)(DerivedStorage + 336);
  CFTypeRef cf = 0LL;
  else {
    int SecondaryDisplay = IOMobileFramebufferGetMainDisplay(&cf);
  }
  int DisplaySize = SecondaryDisplay;
  if (!SecondaryDisplay)
  {
    CGSize v46 = CGSizeZero;
    int DisplaySize = IOMobileFramebufferGetDisplaySize(cf, &v46);
    if (!DisplaySize)
    {
      if (v46.height >= v46.width) {
        double v24 = v46.width;
      }
      else {
        double v24 = v46.height;
      }
      if (v46.height <= v46.width) {
        double v25 = v46.width;
      }
      else {
        double v25 = v46.height;
      }
      if (!v21 && v19 >= 2160.0 && v20 && FVDUtilsHEVCEncoderSupports4K60())
      {
        int DisplaySize = 0;
        signed int v17 = 2160;
        signed int v16 = 3840;
        goto LABEL_68;
      }

      double v33 = fabs(v25 / v24 + -1.33333333);
      if (v33 >= 0.1 || v24 <= 1200.0)
      {
        double v40 = v46.height;
        double v39 = v46.width;
        if (!v20) {
          goto LABEL_67;
        }
        if (v33 < 0.1) {
          goto LABEL_67;
        }
        double v41 = 720.0;
        if (v24 <= 720.0) {
          goto LABEL_67;
        }
        double v42 = 1080.0;
        if (v24 <= 1080.0) {
          double v42 = v24;
        }
        if (!v21) {
          double v41 = v42;
        }
        double v39 = v41 * v46.width / v24;
        v46.double width = v39;
        double v43 = v41 * v46.height;
      }

      else
      {
        if (v20 && v21) {
          double v34 = 900.0;
        }
        else {
          double v34 = dbl_16030[FVDUtilsH264EncoderSupports1080p60() == 0];
        }
        double v39 = v34 * v46.width / v24;
        v46.double width = v39;
        double v43 = v34 * v46.height;
      }

      double v40 = v43 / v24;
      v46.double height = v40;
LABEL_67:
      int DisplaySize = 0;
      signed int v16 = (int)(v39 + 0.5) & 0xFFFFFFFE;
      signed int v17 = (int)(v40 + 0.5) & 0xFFFFFFFE;
    }
  }

LABEL_68:
  if (cf) {
    CFRelease(cf);
  }
  if (!DisplaySize) {
    goto LABEL_71;
  }
}

    if (v51) {
      CFRelease(v51);
    }
    return v14;
  }

  return FigSignalErrorAt(4294950536LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sub_6574(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!*(_BYTE *)DerivedStorage)
  {
    uint64_t v2 = DerivedStorage;
    *(_BYTE *)uint64_t DerivedStorage = 1;
    if (*(void *)(DerivedStorage + 8))
    {
      uint64_t FigBaseObject = FigRenderPipelineGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v4 = FigBaseObject;
        __int128 v5 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(FigBaseObject) + 8) + 24LL);
        if (v5) {
          v5(v4);
        }
      }
    }

    __int128 v6 = *(opaqueCMBufferQueue **)(v2 + 16);
    if (v6) {
      CMBufferQueueReset(v6);
    }
  }

  return 0LL;
}

void sub_65E0(uint64_t a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  sub_6574(a1);
  double v3 = (const void *)DerivedStorage[1];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[1] = 0LL;
  }

  uint64_t v4 = (const void *)DerivedStorage[2];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[2] = 0LL;
  }

  __int128 v5 = (const void *)DerivedStorage[26];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[26] = 0LL;
  }

  __int128 v6 = (const void *)DerivedStorage[47];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[47] = 0LL;
  }

  int v7 = (const void *)DerivedStorage[48];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[48] = 0LL;
  }

  uint64_t v8 = (dispatch_object_s *)DerivedStorage[3];
  if (v8)
  {
    dispatch_release(v8);
    DerivedStorage[3] = 0LL;
  }

  CFTypeID v9 = (const void *)DerivedStorage[4];
  if (v9)
  {
    _Block_release(v9);
    DerivedStorage[4] = 0LL;
  }

  uint64_t v10 = (const void *)DerivedStorage[24];
  if (v10)
  {
    CFRelease(v10);
    DerivedStorage[24] = 0LL;
  }

  uint64_t v11 = (const void *)DerivedStorage[38];
  if (v11)
  {
    CFRelease(v11);
    DerivedStorage[38] = 0LL;
  }

  CFTypeID v12 = (const void *)DerivedStorage[41];
  if (v12)
  {
    CFRelease(v12);
    DerivedStorage[41] = 0LL;
  }

  uint64_t v13 = (const void *)DerivedStorage[49];
  if (v13)
  {
    CFRelease(v13);
    DerivedStorage[49] = 0LL;
  }

__CFString *sub_66BC(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  double v3 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v3, 0LL);
  CFIndex v5 = CFGetRetainCount(a1);
  if (*(_BYTE *)DerivedStorage) {
    __int128 v6 = " (invalidated)";
  }
  else {
    __int128 v6 = "";
  }
  CFAllocatorRef v7 = CFGetAllocator(a1);
  CFStringAppendFormat( Mutable,  0LL,  @"<FigVirtualDisplaySink %p retainCount: %ld%s allocator: %p, ",  a1,  v5,  v6,  v7);
  CFStringAppendFormat(Mutable, 0LL, @"renderPipeline %@", *(void *)(DerivedStorage + 8));
  CFStringAppendFormat(Mutable, 0LL, @">");
  return Mutable;
}

uint64_t sub_678C(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage(a1);
  if (*DerivedStorage) {
    return FigSignalErrorAt(4294954511LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  uint64_t v8 = DerivedStorage;
  if (CFEqual(kFigVirtualDisplaySinkProperty_Type, a2))
  {
    CFTypeID v9 = @"Octavia";
LABEL_13:
    CFTypeRef v12 = CFRetain(v9);
    uint64_t result = 0LL;
    *a4 = v12;
    return result;
  }

  if (CFEqual(kFigVirtualDisplaySinkProperty_IsStevenote, a2))
  {
    BOOL v10 = sub_3130();
    uint64_t v11 = &kCFBooleanTrue;
    if (!v10) {
      uint64_t v11 = &kCFBooleanFalse;
    }
LABEL_12:
    CFTypeID v9 = (const __CFString *)*v11;
    goto LABEL_13;
  }

  if (CFEqual(kFigVirtualDisplaySinkProperty_IsValeria, a2))
  {
    uint64_t v11 = &kCFBooleanTrue;
    if (!v8[320]) {
      uint64_t v11 = &kCFBooleanFalse;
    }
    goto LABEL_12;
  }

  return 4294954512LL;
}

uint64_t sub_68A0(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t DerivedStorage = (CGSize *)CMBaseObjectGetDerivedStorage(a1);
  if (LOBYTE(DerivedStorage->width)) {
    return FigSignalErrorAt(4294954511LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  uint64_t v8 = DerivedStorage;
  if (CFEqual(kFigVirtualDisplaySinkProperty_DeviceInfo, a2))
  {
    if (a3)
    {
      CFTypeID v9 = CFGetTypeID(a3);
      if (v9 == CFDictionaryGetTypeID())
      {
        CGSize v27 = CGSizeZero;
        Value = (const __CFBoolean *)CFDictionaryGetValue( (CFDictionaryRef)a3,  kFigVirtualDisplaySinkDeviceInfoKey_Overscanned);
        if (Value)
        {
          uint64_t v11 = Value;
          CFTypeID v12 = CFGetTypeID(Value);
          if (v12 == CFBooleanGetTypeID()) {
            LOBYTE(v8[12].height) = CFBooleanGetValue(v11);
          }
        }

        uint64_t v13 = (const __CFDictionary *)CFDictionaryGetValue( (CFDictionaryRef)a3,  kFigVirtualDisplaySinkDeviceInfoKey_DisplaySizeInPixels);
        if (v13)
        {
          int64x2_t v14 = v13;
          CFTypeID v15 = CFGetTypeID(v13);
          if (v15 == CFDictionaryGetTypeID()) {
            CGSizeMakeWithDictionaryRepresentation(v14, &v27);
          }
        }

        if (v27.width > 0.0 && v27.height > 0.0)
        {
          v8[10] = v27;
          sub_617C(a1);
          CGFloat height = v8[2].height;
          v17.i64[0] = SLODWORD(height);
          v17.i64[1] = SHIDWORD(height);
          v8[11] = (CGSize)vcvtq_f64_s64(v17);
        }
      }
    }

    return 0LL;
  }

  if (CFEqual(kFigVirtualDisplaySinkProperty_VirtualDisplayModeSize, a2))
  {
    if (a3)
    {
      CFTypeID v18 = CFGetTypeID(a3);
      if (v18 == CFDictionaryGetTypeID()) {
        CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)a3, v8 + 11);
      }
    }

    return 0LL;
  }

  if (CFEqual(kFigVirtualDisplaySinkProperty_FPSInfo, a2))
  {
    if (a3)
    {
      CFTypeID v19 = CFGetTypeID(a3);
      if (v19 == CFArrayGetTypeID()) {
        sub_6C74(a1, (const __CFArray *)a3);
      }
    }

    return 0LL;
  }

  if (CFEqual(kFigVirtualDisplaySinkProperty_FPS, a2))
  {
    if (a3)
    {
      CFTypeID v20 = CFGetTypeID(a3);
      if (v20 == CFArrayGetTypeID()) {
        sub_6D88(a1, (const __CFArray *)a3);
      }
    }

    return 0LL;
  }

  if (CFEqual(kFigVirtualDisplaySinkProperty_Bitrate, a2))
  {
    if (a3)
    {
      CFTypeID v21 = CFGetTypeID(a3);
      if (v21 == CFNumberGetTypeID()) {
        sub_6E5C(a1, (const __CFNumber *)a3);
      }
    }

    return 0LL;
  }

  if (CFEqual(kFigVirtualDisplaySinkProperty_Timestamps, a2))
  {
    if (a3)
    {
      CFTypeID v22 = CFGetTypeID(a3);
      if (v22 == CFArrayGetTypeID())
      {
        CGFloat width = v8[24].width;
        *(void *)&v8[24].CGFloat width = a3;
LABEL_35:
        CFRetain(a3);
        if (width != 0.0) {
          CFRelease(*(CFTypeRef *)&width);
        }
        return 0LL;
      }
    }

    return 0LL;
  }

  if (!CFEqual(kFigVirtualDisplaySinkProperty_TimestampInfo, a2))
  {
    if (CFEqual(kFigVirtualDisplaySinkProperty_UseEncryption, a2)
      || CFEqual(kFigVirtualDisplaySinkProperty_SubmitSurfaceTimestamp, a2)
      || CFEqual(kFigVirtualDisplaySinkProperty_ExtraInfo, a2))
    {
      return 0LL;
    }

    if (!CFEqual(kFigVirtualDisplaySinkProperty_NetworkInfo, a2)) {
      return 4294954512LL;
    }
    if (!a3) {
      return 0LL;
    }
    CFTypeID v26 = CFGetTypeID(a3);
    if (v26 != CFDictionaryGetTypeID()) {
      return 0LL;
    }
    CGFloat width = v8[20].height;
    *(void *)&v8[20].CGFloat height = a3;
    goto LABEL_35;
  }

  if (!a3) {
    return 0LL;
  }
  CFTypeID v24 = CFGetTypeID(a3);
  if (v24 != CFArrayGetTypeID()) {
    return 0LL;
  }
  CGFloat v25 = v8[23].height;
  *(void *)&v8[23].CGFloat height = a3;
  CFRetain(a3);
  if (v25 != 0.0) {
    CFRelease(*(CFTypeRef *)&v25);
  }
  uint64_t result = 0LL;
  LOBYTE(v8[23].width) = 1;
  return result;
}

void sub_6C74(uint64_t a1, const __CFArray *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v4 = *(void *)(DerivedStorage + 304);
  if (v4)
  {
    sub_4988(v4);
    *(void *)(DerivedStorage + 312) = -1LL;
    CFIndex Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0LL;
      uint64_t v8 = (const void *)kFigVirtualDisplaySinkFPSInfoKey_Name;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, v7);
        if (ValueAtIndex)
        {
          BOOL v10 = ValueAtIndex;
          CFTypeID v11 = CFGetTypeID(ValueAtIndex);
          if (v11 == CFDictionaryGetTypeID())
          {
            Value = CFDictionaryGetValue(v10, v8);
            if (Value)
            {
              uint64_t v13 = (uint64_t)Value;
              CFTypeID v14 = CFGetTypeID(Value);
              if (v14 == CFStringGetTypeID()) {
                sub_49B8(*(void *)(DerivedStorage + 304), v13, 0LL);
              }
            }
          }
        }

        ++v7;
      }

      while (v6 != v7);
    }

    *(void *)(DerivedStorage + 312) = sub_49B8(*(void *)(DerivedStorage + 304), (uint64_t)@"A-Mbp", 0LL);
    sub_4B7C(*(void *)(DerivedStorage + 304));
  }

void sub_6D88(uint64_t a1, const __CFArray *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (*(void *)(DerivedStorage + 304))
  {
    uint64_t v4 = DerivedStorage;
    CFIndex Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0LL; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
        if (ValueAtIndex)
        {
          CFTypeID v9 = ValueAtIndex;
          CFTypeID v10 = CFGetTypeID(ValueAtIndex);
          if (v10 == CFNumberGetTypeID())
          {
            CFStringRef v11 = CFStringCreateWithFormat(0LL, 0LL, @"%@", v9);
            sub_4A90(*(void *)(v4 + 304), i, (uint64_t)v11);
            if (v11) {
              CFRelease(v11);
            }
          }
        }
      }
    }
  }

void sub_6E5C(uint64_t a1, const __CFNumber *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (*(void *)(DerivedStorage + 304))
  {
    uint64_t v4 = DerivedStorage;
    double valuePtr = 0.0;
    if (CFNumberGetValue(a2, kCFNumberDoubleType, &valuePtr))
    {
      CFStringRef v5 = CFStringCreateWithFormat(0LL, 0LL, @"%.2f", valuePtr * 0.000000953674316);
      sub_4A90(*(void *)(v4 + 304), *(void *)(v4 + 312), (uint64_t)v5);
      if (v5) {
        CFRelease(v5);
      }
    }

    sub_4B34(*(void *)(v4 + 304));
  }

uint64_t sub_6EF4(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a3)
  {
    uint64_t v5 = DerivedStorage;
    CFIndex v6 = _Block_copy(a3);
    CFIndex v7 = *(dispatch_queue_s **)(v5 + 24);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000LL;
    v9[2] = sub_80C8;
    v9[3] = &unk_191E8;
    v9[4] = v6;
    int v10 = 0;
    dispatch_async(v7, v9);
  }

  return 0LL;
}

uint64_t sub_6F74(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a2)
  {
    uint64_t v4 = DerivedStorage;
    uint64_t v5 = _Block_copy(a2);
    CFIndex v6 = *(dispatch_queue_s **)(v4 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_80F8;
    block[3] = &unk_19210;
    block[4] = v5;
    dispatch_async(v6, block);
  }

  return 0LL;
}

uint64_t sub_6FF0( uint64_t a1, opaqueCMSampleBuffer *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8, double a9, double a10, double a11)
{
  uint64_t v20 = a1;
  int valuePtr = a3;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  v109.origin.x = a4;
  v109.origin.y = a5;
  v109.size.CGFloat width = a6;
  v109.size.CGFloat height = a7;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v109);
  CFNumberRef v23 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v24 = CGSizeCreateDictionaryRepresentation(*(CGSize *)(DerivedStorage + 176));
  double v26 = *(double *)(DerivedStorage + 176);
  double v25 = *(double *)(DerivedStorage + 184);
  if (a11 > v25 || a10 > v26)
  {
    double v28 = v25 / a11;
    if (v25 / a11 >= v26 / a10) {
      double v28 = v26 / a10;
    }
    a11 = a11 * v28;
    a10 = a10 * v28;
    a8 = (v26 - a10) * 0.5;
    a9 = (v25 - a11) * 0.5;
  }

  if (*(_BYTE *)(DerivedStorage + 320)) {
    double v29 = a4;
  }
  else {
    double v29 = a8;
  }
  if (*(_BYTE *)(DerivedStorage + 320)) {
    double v30 = a5;
  }
  else {
    double v30 = a9;
  }
  if (*(_BYTE *)(DerivedStorage + 320)) {
    double v31 = a6;
  }
  else {
    double v31 = a10;
  }
  if (*(_BYTE *)(DerivedStorage + 320)) {
    double v32 = a7;
  }
  else {
    double v32 = a11;
  }
  CFDictionaryRef v33 = CGRectCreateDictionaryRepresentation(*(CGRect *)&v29);
  CFDictionaryRef v34 = v33;
  uint64_t v35 = (void *)(DerivedStorage + 8);
  if (*(void *)(DerivedStorage + 8))
  {
    CFDictionaryRef cf = 0LL;
    goto LABEL_22;
  }

  v93 = DictionaryRepresentation;
  CFDictionaryRef v95 = v33;
  uint64_t v91 = v20;
  v67 = v24;
  v68 = v23;
  CMTimeMake(&v101, 3LL, 30);
  CMTimeMake(&v100, 5LL, 30);
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(a2);
  v108.value = v101.value;
  CMTimeFlags flags = v101.flags;
  v108.CMTimeScale timescale = v101.timescale;
  CMTimeEpoch epoch = v101.epoch;
  CMClockRef sourceClock = (CMClockRef)v100.value;
  CMTimeFlags v72 = v100.flags;
  CMTimeScale timescale = v100.timescale;
  CFTypeRef cfa = (CFTypeRef)v100.epoch;
  if (FormatDescription)
  {
    v107.value = kFigRenderPipelineOption_FormatDescription;
    time.value = (CMTimeValue)CFRetain(FormatDescription);
    unsigned int v73 = 1;
  }

  else
  {
    unsigned int v73 = 0;
  }

  if ((flags & 0x1D) == 1)
  {
    *(&v107.value + v73) = kFigRenderPipelineOption_PreparedQueueLowWaterLevel;
    v102.value = v108.value;
    v102.CMTimeScale timescale = v108.timescale;
    v102.CMTimeFlags flags = flags;
    v102.CMTimeEpoch epoch = epoch;
    *(&time.value + v73++) = (CMTimeValue)CMTimeCopyAsDictionary(&v102, kCFAllocatorDefault);
  }

  CFNumberRef v23 = v68;
  CFDictionaryRef v24 = v67;
  uint64_t v20 = v91;
  CFDictionaryRef DictionaryRepresentation = v93;
  CFDictionaryRef v34 = v95;
  if ((v72 & 0x1D) == 1)
  {
    *(&v107.value + v73) = kFigRenderPipelineOption_PreparedQueueHighWaterLevel;
    v102.value = (CMTimeValue)sourceClock;
    v102.CMTimeScale timescale = timescale;
    v102.CMTimeFlags flags = v72;
    v102.CMTimeEpoch epoch = (CMTimeEpoch)cfa;
    *(&time.value + v73) = (CMTimeValue)CMTimeCopyAsDictionary(&v102, kCFAllocatorDefault);
    CFIndex v74 = v73 + 1;
    CFDictionaryRef cf = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&v107,  (const void **)&time,  v74,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }

  else
  {
    CFIndex v74 = v73;
    CFDictionaryRef cf = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&v107,  (const void **)&time,  v73,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (!v73) {
      goto LABEL_75;
    }
  }

  p_CMTime time = &time;
  do
  {
    if (p_time->value) {
      CFRelease((CFTypeRef)p_time->value);
    }
    p_CMTime time = (CMTime *)((char *)p_time + 8);
    --v74;
  }

  while (v74);
LABEL_75:
  uint64_t v64 = FigOctaviaVideoRenderPipelineCreate( kCFAllocatorDefault,  cf,  *(void *)(DerivedStorage + 392),  DerivedStorage + 8);
  if ((_DWORD)v64) {
    goto LABEL_76;
  }
  uint64_t FigBaseObject = FigRenderPipelineGetFigBaseObject(*v35);
  if (v77) {
    v77(FigBaseObject, kFigRenderPipelineProperty_VideoEnqueueResetsSystemSleepTimer, kCFBooleanTrue);
  }
  uint64_t v78 = FigRenderPipelineGetFigBaseObject(*v35);
  v79 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(*(void *)(CMBaseObjectGetVTable(v78)
                                                                                             + 8)
                                                                                 + 48LL);
  if (!v79)
  {
    uint64_t v64 = 4294954514LL;
    CFDictionaryRef v65 = cf;
    goto LABEL_77;
  }

  uint64_t v64 = v79(v78, kFigRenderPipelineProperty_SourceSampleBufferQueue, kCFAllocatorDefault, DerivedStorage + 16);
  if ((_DWORD)v64)
  {
LABEL_76:
    CFDictionaryRef v65 = cf;
    goto LABEL_77;
  }

  uint64_t v80 = FigRenderPipelineGetFigBaseObject(*v35);
  v81 = *(void (**)(uint64_t, void, const CFBooleanRef))(*(void *)(CMBaseObjectGetVTable(v80) + 8) + 56LL);
  if (v81) {
    v81(v80, kFigRenderPipelineProperty_ObeyEmptyMediaMarkers, kCFBooleanTrue);
  }
  uint64_t v82 = FigRenderPipelineGetFigBaseObject(*v35);
  v83 = *(void (**)(uint64_t, void, const CFBooleanRef))(*(void *)(CMBaseObjectGetVTable(v82) + 8) + 56LL);
  if (v83) {
    v83(v82, kFigRenderPipelineProperty_RenderEmptyMedia, kCFBooleanFalse);
  }
  LODWORD(v102.value) = 0;
  LOBYTE(v108.value) = 0;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v102,  &v108);
  uint64_t value_low = LODWORD(v102.value);
  uint64_t v86 = LOBYTE(v108.value);
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v108.value)) {
    uint64_t v87 = value_low;
  }
  else {
    uint64_t v87 = value_low & 0xFFFFFFFE;
  }
  if ((_DWORD)v87)
  {
    LODWORD(time.value) = 136315138;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)"octaviaSink_PushFrame";
    v88 = (CMTime *)_os_log_send_and_compose_impl( v87,  0LL,  &v107,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v86,  "<<<< FigVirtualDisplaySinkOctavia >>>> %s: Started mirroring to Nero/Valeria",  (const char *)&time);
    uint64_t value_low = LODWORD(v102.value);
  }

  else
  {
    v88 = 0LL;
  }

  fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v88, v88 != &v107, value_low, 0LL);
  CFDictionaryRef v34 = v95;
LABEL_22:
  SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a2, 0);
  if (SampleAttachmentsArray)
  {
    int v37 = SampleAttachmentsArray;
    CFIndex Count = CFArrayGetCount(SampleAttachmentsArray);
    if (Count >= 1)
    {
      CFIndex v39 = Count;
      v92 = DictionaryRepresentation;
      uint64_t v90 = v20;
      v89 = v24;
      double v40 = v23;
      Mutable = 0LL;
      CFIndex v42 = 0LL;
      double v43 = (const void *)kVTSampleAttachmentKey_RequireAcknowledgementToken;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v37, v42);
        Value = CFDictionaryGetValue(ValueAtIndex, v43);
        if (Value)
        {
          CGSize v46 = Value;
          if (!Mutable)
          {
            Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
            if (!Mutable)
            {
              uint64_t v64 = 4294954510LL;
              CFNumberRef v23 = v40;
              CFDictionaryRef v24 = v89;
              uint64_t v20 = v90;
              CFDictionaryRef DictionaryRepresentation = v92;
              goto LABEL_76;
            }
          }

          CFArrayAppendValue(Mutable, v46);
        }

        ++v42;
      }

      while (v39 != v42);
      CFNumberRef v23 = v40;
      CFDictionaryRef v24 = v89;
      uint64_t v20 = v90;
      CFDictionaryRef DictionaryRepresentation = v92;
      if (!Mutable) {
        goto LABEL_33;
      }
      __int128 v47 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v47)
      {
        __int128 v48 = v47;
        CFDictionaryAddValue(v47, kFigVirtualDisplaySinkFramesAcknowledgedKey_Tokens, Mutable);
        sub_8814(v90, kFigVirtualDisplaySinkEvent_FramesAcknowledged, v48);
        CFRelease(Mutable);
        CFRelease(v48);
        goto LABEL_33;
      }

      CFRelease(Mutable);
      uint64_t v64 = 4294954510LL;
      goto LABEL_76;
    }
  }

LABEL_33:
  CMSetAttachment(a2, kFigSampleBufferAttachmentKey_SourceRect, DictionaryRepresentation, 1u);
  CMSetAttachment(a2, kFigSampleBufferAttachmentKey_DestRect, v34, 1u);
  CMSetAttachment(a2, kFigSampleBufferAttachmentKey_VirtualDisplaySizeForDestRect, v24, 1u);
  CMSetAttachment(a2, kFigSampleBufferAttachmentKey_SymmetricTransform, v23, 1u);
  if (*(void *)(DerivedStorage + 384))
  {
    __int128 v49 = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    __int128 v50 = v49;
    if (*(_BYTE *)(DerivedStorage + 368))
    {
      __int128 v51 = *(const void **)(DerivedStorage + 376);
      if (v51)
      {
        CFDictionarySetValue(v49, kFigVirtualDisplaySinkProperty_TimestampInfo, v51);
        *(_BYTE *)(DerivedStorage + 368) = 0;
      }
    }

    CFDictionarySetValue(v50, kFigVirtualDisplaySinkProperty_Timestamps, *(const void **)(DerivedStorage + 384));
    CMSetAttachment(a2, kCMSampleBufferAttachmentKey_ClientTimingInfo, v50, 1u);
    if (v50) {
      CFRelease(v50);
    }
  }

  if (!*(void *)(DerivedStorage + 208))
  {
    __int128 v52 = v34;
    uint64_t v53 = *(void *)(DerivedStorage + 8);
    uint64_t v54 = CMBaseObjectGetDerivedStorage(v20);
    CMTimebaseRef timebaseOut = 0LL;
    CMClockRef sourceClock = 0LL;
    __int128 v94 = *(_OWORD *)&kCMTimeInvalid.value;
    *(_OWORD *)&v102.value = *(_OWORD *)&kCMTimeInvalid.value;
    CMTimeEpoch v55 = kCMTimeInvalid.epoch;
    v102.CMTimeEpoch epoch = v55;
    BOOL v56 = *(_BYTE *)(v54 + 320) == 0;
    CMTime v101 = kCMTimeZero;
    int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault( @"octaviaFrameDelay",  @"com.apple.coremedia",  (4 * v56));
    CMTimeMake(&v101, CFPreferenceNumberWithDefault, 60);
    CMTime time = v101;
    CMTimeConvertScale(&v107, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    CMTime v101 = v107;
    uint64_t v58 = FigRenderPipelineGetFigBaseObject(v53);
    if (v59 && !v59(v58, kFigRenderPipelineProperty_PreferredClock, kCFAllocatorDefault, &sourceClock))
    {
      OSStatus v60 = CMTimebaseCreateWithSourceClock(kCFAllocatorDefault, sourceClock, &timebaseOut);
      CMTimebaseRef v61 = timebaseOut;
      if (!v60)
      {
        CFAllocatorRef allocator = (CFAllocatorRef)FigRenderPipelineGetFigBaseObject(v53);
        v62 = *(void (**)(CFAllocatorRef, void, CMTimebaseRef))(*(void *)(CMBaseObjectGetVTable(allocator)
                                                                                       + 8)
                                                                           + 56LL);
        if (v62) {
          v62(allocator, kFigRenderPipelineProperty_Timebase, v61);
        }
        CMClockGetTime(&v102, sourceClock);
        CMTime v100 = v102;
        CMTime v108 = v102;
        v63 = *(void (**)(uint64_t, CMTime *, CMTime *, float, float))(*(void *)(CMBaseObjectGetVTable(v53)
                                                                                           + 16)
                                                                               + 8LL);
        if (v63)
        {
          CMTime v107 = v100;
          CMTime time = v108;
          v63(v53, &v107, &time, 1.0, 1.0);
        }

        CMTimebaseRef v61 = timebaseOut;
        *(void *)(DerivedStorage + 208) = sourceClock;
        *(CMTime *)(DerivedStorage + 216) = v101;
      }

      if (v61) {
        CFRelease(v61);
      }
    }

    *(_OWORD *)(DerivedStorage + 240) = v94;
    *(void *)(DerivedStorage + 256) = v55;
    *(_OWORD *)(DerivedStorage + 264) = v94;
    *(void *)(DerivedStorage + 280) = v55;
    *(_BYTE *)(DerivedStorage + 288) = 0;
    CFDictionaryRef v34 = v52;
  }

  uint64_t v64 = sub_8124(v20, a2);
  CFDictionaryRef v65 = cf;
  if (!(_DWORD)v64)
  {
    if (!DictionaryRepresentation) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }

      CFTypeID v22 = NeroTransportCreate(v21, *(void *)cf, v16);
    }
  }

LABEL_77:
  sub_8814(v20, kFigVirtualDisplaySinkEvent_ForceKeyFrame, 0LL);
  if (DictionaryRepresentation) {
LABEL_53:
  }
    CFRelease(DictionaryRepresentation);
LABEL_54:
  if (v34) {
    CFRelease(v34);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v24) {
    CFRelease(v24);
  }
  if (v65) {
    CFRelease(v65);
  }
  return v64;
}

uint64_t sub_79EC(uint64_t a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  if (DerivedStorage[1])
  {
    uint64_t FigBaseObject = FigRenderPipelineGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v3 = FigBaseObject;
      uint64_t v4 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(FigBaseObject) + 8) + 24LL);
      if (v4) {
        v4(v3);
      }
    }
  }

  uint64_t v5 = (opaqueCMBufferQueue *)DerivedStorage[2];
  if (v5) {
    CMBufferQueueReset(v5);
  }
  CFIndex v6 = (const void *)DerivedStorage[1];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[1] = 0LL;
  }

  CFIndex v7 = (const void *)DerivedStorage[2];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[2] = 0LL;
  }

  uint64_t v8 = (const void *)DerivedStorage[26];
  if (v8)
  {
    CFRelease(v8);
    DerivedStorage[26] = 0LL;
  }

  return 0LL;
}

uint64_t sub_7A78()
{
  return 0LL;
}

uint64_t sub_7A80(uint64_t a1, const void *a2, uint64_t a3, const void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v8 = (const void *)kFigVirtualDisplaySinkProperty_DeviceInfo;
  if (CFEqual(a2, kFigVirtualDisplaySinkProperty_DeviceInfo) || CFEqual(a2, kFigVirtualDisplaySinkProperty_DisplayInfo))
  {
    uint64_t v9 = *(unsigned __int8 *)(DerivedStorage + 200);
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)(DerivedStorage + 176));
      if (DictionaryRepresentation)
      {
        CFDictionaryRef v12 = DictionaryRepresentation;
        if (CFEqual(a2, v8))
        {
          CFDictionarySetValue(Mutable, kFigVirtualDisplaySinkDeviceInfoKey_DisplaySizeInPixels, v12);
          uint64_t v13 = (const void *)kFigVirtualDisplaySinkDeviceInfoKey_Overscanned;
          CFTypeID v14 = &kCFBooleanFalse;
          if ((_DWORD)v9) {
            CFTypeID v14 = &kCFBooleanTrue;
          }
          CFBooleanRef v15 = *v14;
        }

        else
        {
          uint64_t v16 = CMBaseObjectGetDerivedStorage(a1);
          int64x2_t v17 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
          CFMutableArrayRef v18 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
          if (v17) {
            BOOL v19 = v18 == 0LL;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19)
          {
            Mutable = 0LL;
            uint64_t v24 = 4294954510LL;
            goto LABEL_28;
          }

          uint64_t v20 = v18;
          if (*(int *)(v16 + 152) >= 1)
          {
            uint64_t v21 = 0LL;
            CFTypeID v22 = (_DWORD *)(v16 + 52);
            while (1)
            {
              CFTypeRef cf = 0LL;
              value = 0LL;
              FigDisplayModes_BuildColorAndTimingModes( *(v22 - 3),  *(v22 - 2),  v9,  60LL,  *(v22 - 1),  *v22 != 0,  v21,  &value,  &cf);
              if (!value || !cf) {
                break;
              }
              CFArrayAppendValue(v17, value);
              CFArrayAppendValue(v20, cf);
              if (value) {
                CFRelease(value);
              }
              if (cf) {
                CFRelease(cf);
              }
              v22 += 4;
            }

            Mutable = 0LL;
            uint64_t v24 = 4294954510LL;
            goto LABEL_28;
          }

LABEL_22:
          CFDictionarySetValue(Mutable, kFigVirtualDisplaySinkDeviceInfoKey_ColorModes, v17);
          CFDictionarySetValue(Mutable, kFigVirtualDisplaySinkDeviceInfoKey_TimingModes, v20);
          CFRelease(v17);
          CFRelease(v20);
          CFNumberRef v23 = (const void **)&kCFBooleanFalse;
          if (!*(_BYTE *)(DerivedStorage + 320)) {
            CFNumberRef v23 = (const void **)&kCFBooleanTrue;
          }
          CFDictionarySetValue(Mutable, kFigVirtualDisplaySinkDeviceInfoKey_RotationSupport, *v23);
          CFBooleanRef v15 = *(CFBooleanRef *)(DerivedStorage + 192);
          if (!v15)
          {
LABEL_27:
            uint64_t v24 = 0LL;
LABEL_28:
            CFRelease(v12);
            goto LABEL_29;
          }

          uint64_t v13 = (const void *)kFigVirtualDisplaySinkDeviceInfoKey_DisplayUUID;
        }

        CFDictionarySetValue(Mutable, v13, v15);
        goto LABEL_27;
      }

      Mutable = 0LL;
    }

    uint64_t v24 = 4294954510LL;
    goto LABEL_29;
  }

  if (CFEqual(a2, kFigVirtualDisplaySinkProperty_NetworkInfo))
  {
    double v28 = *(const void **)(DerivedStorage + 328);
    if (v28)
    {
      Mutable = (__CFDictionary *)CFRetain(v28);
      uint64_t v24 = 0LL;
    }

    else
    {
      uint64_t v24 = 0LL;
      Mutable = 0LL;
    }
  }

  else
  {
    Mutable = 0LL;
    uint64_t v24 = 4294954512LL;
  }

  CFNumberRef v23 = *(void *)(v2 + 88);
  uint64_t v24 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v23) + 24) + 40LL);
  if (v24) {
    v24(v23);
  }
  double v25 = *(void *)(v2 + 80);
  if (v25)
  {
    double v26 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v25) + 24) + 40LL);
    if (v26) {
      v26(v25);
    }
  }

  return v21;
}

LABEL_29:
  double v25 = _Block_copy(a4);
  double v26 = *(dispatch_queue_s **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_8A88;
  block[3] = &unk_19260;
  int v30 = v24;
  block[4] = v25;
  void block[5] = Mutable;
  dispatch_async(v26, block);
  return v24;
}

          if (*(_BYTE *)(v26 + 49)) {
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ReceiverWants444H264, kCFBooleanTrue);
          }
          if (*(_BYTE *)(v26 + 50)) {
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ReceiverWants444HEVC, kCFBooleanTrue);
          }
          if (*(_BYTE *)(v26 + 51)) {
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ReceiverWants44410HEVC, kCFBooleanTrue);
          }
          if (*(_BYTE *)(v26 + 48))
          {
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ScreenRecording, kCFBooleanTrue);
            FigCFDictionarySetInt(Mutable, kFigVirtualDisplayOption_MirroringMode, 1LL);
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_DisplayLabel, @"iOSScreenCaptureForMac");
          }

          if (sub_3130())
          {
            FigCFDictionarySetInt(Mutable, kFigVirtualDisplayOption_MirroringMode, 1LL);
            CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_DisplayLabel, @"Stevenote");
          }

          CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_ClientName, @"NeroScreen");
          uint64_t v35 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          v36 = v35;
          if (*(_BYTE *)(v26 + 48)) {
            int v37 = kCFBooleanTrue;
          }
          else {
            int v37 = kCFBooleanFalse;
          }
          CFDictionarySetValue(v35, kFigVirtualDisplaySinkProperty_IsValeria, v37);
          if (v32) {
            int v38 = kCFBooleanFalse;
          }
          else {
            int v38 = kCFBooleanTrue;
          }
          CFDictionarySetValue(v36, kFigVirtualDisplaySinkProperty_ShouldUseStevenoteJPEG, v38);
          CFIndex v39 = sub_5F40((uint64_t)kCFAllocatorDefault, v36, *(const void **)(v26 + 72), (CFTypeRef *)(v26 + 64));
          if ((_DWORD)v39)
          {
            CFTypeID v14 = v39;
            double v40 = 0LL;
LABEL_59:
            if (Mutable) {
              CFRelease(Mutable);
            }
            if (v36) {
              CFRelease(v36);
            }
            if (v40) {
              CFRelease(v40);
            }
            if (cf) {
              CFRelease(cf);
            }
            if ((_DWORD)v14) {
              goto LABEL_68;
            }
            *a5 = v51;
            return v14;
          }

          if (!CGSizeMakeWithDictionaryRepresentation(*(CFDictionaryRef *)(v26 + 8), &size))
          {
            double v40 = 0LL;
LABEL_86:
            CFTypeID v14 = 4294950536LL;
            goto LABEL_59;
          }

          double v41 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          double v40 = v41;
          if (!v41)
          {
            CFTypeID v14 = 4294954510LL;
            goto LABEL_59;
          }

          CFDictionarySetValue(v41, kFigVirtualDisplaySinkDeviceInfoKey_DisplaySizeInPixels, *(const void **)(v26 + 8));
          CFDictionarySetValue(v40, kFigVirtualDisplaySinkDeviceInfoKey_Overscanned, *(const void **)(v26 + 16));
          uint64_t CMBaseObject = FigVirtualDisplaySinkGetCMBaseObject(*(void *)(v26 + 64));
          double v43 = *(uint64_t (**)(uint64_t, void, __CFDictionary *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                        + 8)
                                                                            + 56LL);
          if (v43)
          {
            signed int v44 = v43(CMBaseObject, kFigVirtualDisplaySinkProperty_DeviceInfo, v40);
            if ((_DWORD)v44)
            {
LABEL_51:
              CFTypeID v14 = v44;
              goto LABEL_59;
            }

            if (!*(void *)(v26 + 56))
            {
              if (sub_4448())
              {
                signed int v44 = FigVirtualDisplayProcessorAccessoryCreate(kCFAllocatorDefault, 0LL, &cf);
                if ((_DWORD)v44) {
                  goto LABEL_51;
                }
                CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_CustomProcessor, cf);
                signed int v44 = FigVirtualDisplaySourceNullCreate(kCFAllocatorDefault, &v55);
                if ((_DWORD)v44) {
                  goto LABEL_51;
                }
                Current = v55;
                goto LABEL_78;
              }

              Current = FigVirtualDisplaySourceScreenGetCurrent();
LABEL_77:
              CMTimeEpoch v55 = Current;
LABEL_78:
              __int128 v50 = (const void *)FigVirtualDisplaySessionActivateWithSourceAndSink( Current,  *(void *)(v26 + 64),  Mutable);
              *(void *)(v26 + 24) = v50;
              if (v50)
              {
                CFRetain(v50);
                if (*(_BYTE *)(v26 + 48)) {
                  g87kjbhgf(1LL);
                }
                CFTypeID v14 = 0LL;
                goto LABEL_59;
              }

              goto LABEL_86;
            }

            signed int v45 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            FigCFDictionarySetInt32(v45, kFigVirtualDisplaySinkNetworkInfoKey_RecommendedFPS, 30LL);
            FigCFDictionarySetInt32(v45, kFigVirtualDisplaySinkNetworkInfoKey_Bandwidth, 500000LL);
            CGSize v46 = FigVirtualDisplaySinkGetCMBaseObject(*(void *)(v26 + 64));
            __int128 v47 = *(uint64_t (**)(uint64_t, void, CFMutableDictionaryRef))(*(void *)(CMBaseObjectGetVTable(v46)
                                                                                                + 8)
                                                                                    + 56LL);
            if (v47)
            {
              signed int v44 = v47(v46, kFigVirtualDisplaySinkProperty_NetworkInfo, v45);
              if ((_DWORD)v44) {
                goto LABEL_51;
              }
              if (v45) {
                CFRelease(v45);
              }
              Current = *(void *)(v26 + 56);
              goto LABEL_77;
            }
          }

          CFTypeID v14 = 4294954514LL;
          goto LABEL_59;
        }
      }

      CFTypeID v14 = 4294950535LL;
    }

uint64_t sub_7DE0(uint64_t a1, const __CFString *a2, uint64_t a3, const void *a4)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  if (CFStringCompare(kFigVirtualDisplaySinkAction_ClearScreen, a2, 1uLL) == kCFCompareEqualTo
    && DerivedStorage[1]
    && DerivedStorage[2]
    && (HostTimeClock = CMClockGetHostTimeClock(),
        CMClockGetTime(&v16, HostTimeClock),
        CMSampleBufferRef v18 = 0LL,
        (v16.flags & 0x1D) == 1))
  {
    *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)&kCMTimeZero.value;
    sampleTimingArray.duration.CMTimeEpoch epoch = kCMTimeZero.epoch;
    sampleTimingArray.presentationTimeStamp = v16;
    sampleTimingArray.decodeTimeStamp = kCMTimeInvalid;
    uint64_t v8 = CMSampleBufferCreate(kCFAllocatorDefault, 0LL, 1u, 0LL, 0LL, 0LL, 0LL, 1LL, &sampleTimingArray, 0LL, 0LL, &v18);
    if (!(_DWORD)v8)
    {
      CMSetAttachment(v18, kCMSampleBufferAttachmentKey_EmptyMedia, kCFBooleanTrue, 1u);
      CMSetAttachment(v18, kCMSampleBufferAttachmentKey_DisplayEmptyMediaImmediately, kCFBooleanTrue, 1u);
    }

    CMSampleBufferRef v13 = v18;
    if (v18)
    {
      sub_8124(a1, v18);
      CFRelease(v13);
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (a4)
  {
    uint64_t v9 = _Block_copy(a4);
    int v10 = (dispatch_queue_s *)DerivedStorage[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_8AD8;
    block[3] = &unk_19288;
    block[4] = v9;
    int v15 = v8;
    dispatch_async(v10, block);
  }

  return v8;
}

uint64_t sub_7FB4(uint64_t a1, dispatch_queue_s *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!a2) {
    a2 = &_dispatch_main_q;
  }
  dispatch_retain(a2);
  uint64_t v4 = *(dispatch_object_s **)(DerivedStorage + 24);
  if (v4) {
    dispatch_release(v4);
  }
  *(void *)(DerivedStorage + 24) = a2;
  return 0LL;
}

uint64_t sub_8004(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v4 = _Block_copy(a2);
  uint64_t v5 = *(const void **)(DerivedStorage + 32);
  if (v5) {
    _Block_release(v5);
  }
  *(void *)(DerivedStorage + 32) = v4;
  return 0LL;
}

BOOL sub_8048(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if ((*(_BYTE *)(DerivedStorage + 352) & 1) == 0 || !*(void *)(DerivedStorage + 16)) {
    return 0LL;
  }
  uint64_t v2 = (CMTime *)(DerivedStorage + 340);
  CMBufferQueueGetDuration(&v6, *(CMBufferQueueRef *)(DerivedStorage + 16));
  CMTime time1 = v6;
  CMTime v4 = *v2;
  return CMTimeCompare(&time1, &v4) >= 0;
}

void sub_80C8(uint64_t a1)
{
}

void sub_80F8(uint64_t a1)
{
}

uint64_t sub_8124(uint64_t a1, opaqueCMSampleBuffer *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CMSampleBufferRef sampleBufferOut = 0LL;
  if (*(void *)(DerivedStorage + 208))
  {
    uint64_t v5 = DerivedStorage;
    CMSampleBufferGetOutputPresentationTimeStamp(&v44, a2);
    __int128 v38 = *(_OWORD *)&kCMTimeInvalid.value;
    *(_OWORD *)&v43.value = *(_OWORD *)&kCMTimeInvalid.value;
    CMTimeEpoch epoch = kCMTimeInvalid.epoch;
    v43.CMTimeEpoch epoch = epoch;
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    uint64_t v8 = *(const void **)(v5 + 208);
    time.CMTime duration = v44;
    CMSyncConvertTime(&v42, &time.duration, HostTimeClock, v8);
    CMTime duration = v42;
    CMTime v40 = kCMTimeZero;
    CMTime v39 = v40;
    uint64_t v9 = (_OWORD *)(v5 + 240);
    if ((*(_BYTE *)(v5 + 252) & 1) != 0)
    {
      time.CMTime duration = v44;
      *(_OWORD *)&rhs.value = *v9;
      rhs.CMTimeEpoch epoch = *(void *)(v5 + 256);
      CMTimeSubtract(&v43, &time.duration, &rhs);
      time.CMTime duration = v43;
      *(_OWORD *)&rhs.value = xmmword_16148;
      rhs.CMTimeEpoch epoch = 0LL;
      if (CMTimeCompare(&time.duration, &rhs) < 0)
      {
        time.duration.CMTimeEpoch epoch = *(void *)(v5 + 280);
        *(_OWORD *)&time.duration.value = *(_OWORD *)(v5 + 264);
        CMTime rhs = v43;
        CMTimeAdd(&duration, &time.duration, &rhs);
        time.CMTime duration = duration;
        CMTime rhs = v42;
        CMTimeSubtract(&v40, &time.duration, &rhs);
        time.CMTime duration = v40;
        *(_OWORD *)&rhs.value = xmmword_16160;
        rhs.CMTimeEpoch epoch = 0LL;
        if (CMTimeCompare(&time.duration, &rhs) < 1)
        {
          time.CMTime duration = v40;
          *(_OWORD *)&rhs.value = xmmword_16178;
          rhs.CMTimeEpoch epoch = 0LL;
          if (CMTimeCompare(&time.duration, &rhs) < 0)
          {
            CMTime rhs = duration;
            *(_OWORD *)&hostTime.value = xmmword_16160;
            hostTime.CMTimeEpoch epoch = 0LL;
            CMTimeAdd(&time.duration, &rhs, &hostTime);
            CMTime duration = time.duration;
          }
        }

        else
        {
          time.CMTime duration = v43;
          *(_OWORD *)&rhs.value = xmmword_16160;
          rhs.CMTimeEpoch epoch = 0LL;
          if (CMTimeCompare(&time.duration, &rhs) < 1)
          {
            if (!*(_BYTE *)(v5 + 288))
            {
              if (*(void *)(v5 + 32)) {
                sub_8814(a1, kFigVirtualDisplaySinkEvent_DropNextFrame, 0LL);
              }
              *(_BYTE *)(v5 + 288) = 1;
            }
          }

          else
          {
            CMTime rhs = duration;
            *(_OWORD *)&hostTime.value = xmmword_16160;
            hostTime.CMTimeEpoch epoch = 0LL;
            CMTimeSubtract(&time.duration, &rhs, &hostTime);
            CMTime duration = time.duration;
            *(_BYTE *)(v5 + 288) = 0;
          }
        }
      }
    }

    time.CMTime duration = duration;
    CMTime rhs = *(CMTime *)(v5 + 264);
    CMTimeSubtract(&v39, &time.duration, &rhs);
    if (*(_BYTE *)(v5 + 320))
    {
      time.CMTime duration = v39;
      *(_OWORD *)&rhs.value = xmmword_16190;
      rhs.CMTimeEpoch epoch = 0LL;
      if (CMTimeCompare(&time.duration, &rhs) < 0)
      {
        if (*(void *)(v5 + 32)) {
          sub_8814(a1, kFigVirtualDisplaySinkEvent_DropNextFrame, 0LL);
        }
        CMTime rhs = *(CMTime *)(v5 + 264);
        *(_OWORD *)&hostTime.value = xmmword_16160;
        hostTime.CMTimeEpoch epoch = 0LL;
        CMTimeAdd(&time.duration, &rhs, &hostTime);
        CMTime duration = time.duration;
      }
    }

    uint64_t v35 = a1;
    if (a2)
    {
      int v10 = *(const void **)(v5 + 208);
      if (v10)
      {
        CFStringRef v11 = (const __CFString *)kCMSampleBufferAttachmentKey_ClientTimingInfo;
        CFDictionaryRef v12 = (const __CFDictionary *)CMGetAttachment(a2, kCMSampleBufferAttachmentKey_ClientTimingInfo, 0LL);
        if (v12)
        {
          CMSampleBufferRef v13 = v12;
          CFTypeID v14 = CFGetTypeID(v12);
          if (v14 == CFDictionaryGetTypeID())
          {
            MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v13);
            CMTime v16 = (const void *)kFigVirtualDisplaySinkProperty_Timestamps;
            Value = (const __CFArray *)CFDictionaryGetValue(v13, kFigVirtualDisplaySinkProperty_Timestamps);
            if (Value && (CMSampleBufferRef v18 = Value, v19 = CFGetTypeID(Value), v19 == CFArrayGetTypeID()))
            {
              CMTimeEpoch v36 = epoch;
              target = a2;
              CFIndex Count = CFArrayGetCount(v18);
              CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
              if (CFArrayGetCount(v18) >= 1)
              {
                CFIndex v22 = 0LL;
                do
                {
                  valuePtr[0] = 0LL;
                  ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v18, v22);
                  if (ValueAtIndex)
                  {
                    uint64_t v24 = ValueAtIndex;
                    CFTypeID v25 = CFGetTypeID(ValueAtIndex);
                    if (v25 == CFNumberGetTypeID())
                    {
                      CFNumberGetValue(v24, kCFNumberSInt64Type, valuePtr);
                      if ((uint64_t)valuePtr[0] < 1)
                      {
                        uint64_t v28 = 0LL;
                      }

                      else
                      {
                        CMClockMakeHostTimeFromSystemUnits(&time.duration, valuePtr[0]);
                        CMClockRef v26 = CMClockGetHostTimeClock();
                        CMTime hostTime = time.duration;
                        CMSyncConvertTime(&rhs, &hostTime, v26, v10);
                        CMTime hostTime = rhs;
                        uint64_t v27 = CMClockConvertHostTimeToSystemUnits(&hostTime);
                        uint64_t v28 = FigHostTimeToNanoseconds(v27);
                      }

                      FigCFArrayAppendInt64(Mutable, v28);
                    }
                  }

                  ++v22;
                }

                while (v22 < CFArrayGetCount(v18));
              }

              CFDictionarySetValue(MutableCopy, v16, Mutable);
              a2 = target;
              CMSetAttachment(target, v11, MutableCopy, 1u);
              CMTimeEpoch epoch = v36;
            }

            else
            {
              CFMutableArrayRef Mutable = 0LL;
            }

            uint64_t v9 = (_OWORD *)(v5 + 240);
            if (MutableCopy) {
              CFRelease(MutableCopy);
            }
            if (Mutable) {
              CFRelease(Mutable);
            }
          }
        }
      }
    }

    *(CMTime *)uint64_t v9 = v44;
    __int128 v29 = *(_OWORD *)&duration.value;
    *(_OWORD *)(v5 + 264) = *(_OWORD *)&duration.value;
    CMTimeEpoch v30 = duration.epoch;
    *(void *)(v5 + 280) = duration.epoch;
    *(_OWORD *)&rhs.value = v29;
    rhs.CMTimeEpoch epoch = v30;
    CMTime hostTime = *(CMTime *)(v5 + 216);
    CMTimeAdd(&time.presentationTimeStamp, &rhs, &hostTime);
    CMTimeMake(&rhs, 1LL, 60);
    time.CMTime duration = rhs;
    *(_OWORD *)&time.decodeTimeStamp.value = v38;
    time.decodeTimeStamp.CMTimeEpoch epoch = epoch;
    uint64_t v31 = CMSampleBufferCreateCopyWithNewTiming(kCFAllocatorDefault, a2, 1LL, &time, &sampleBufferOut);
    if (!(_DWORD)v31) {
      uint64_t v31 = sub_88B4(v35, sampleBufferOut);
    }
    if (sampleBufferOut) {
      CFRelease(sampleBufferOut);
    }
    return v31;
  }

  else
  {
    SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a2, 1u);
    if (SampleAttachmentsArray)
    {
      CFDictionaryRef v34 = (__CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0LL);
      if (v34) {
        CFDictionarySetValue(v34, kCMSampleAttachmentKey_DisplayImmediately, kCFBooleanTrue);
      }
    }

    return sub_88B4(a1, a2);
  }

void sub_8814(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CMTime v6 = *(const void **)(DerivedStorage + 32);
  if (v6)
  {
    CFIndex v7 = _Block_copy(v6);
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    uint64_t v8 = *(dispatch_queue_s **)(DerivedStorage + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_8A34;
    block[3] = &unk_19238;
    block[4] = v7;
    void block[5] = a2;
    void block[6] = a3;
    dispatch_async(v8, block);
  }

uint64_t sub_88B4(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFDataRef v5 = sub_43A4();
  if (v5) {
    CMSetAttachment(a2, kFigVirtualDisplaySinkAttachment_Quaternion, v5, 1u);
  }
  if ((*(_BYTE *)(DerivedStorage + 352) & 1) != 0)
  {
    CMBufferQueueGetDuration(&v13, *(CMBufferQueueRef *)(DerivedStorage + 16));
    CMTime time1 = v13;
    CMTime v11 = *(CMTime *)(DerivedStorage + 340);
    if (CMTimeCompare(&time1, &v11) < 0)
    {
      int v8 = 1;
LABEL_10:
      *(_DWORD *)(DerivedStorage + 364) = v8;
      goto LABEL_11;
    }

    if (*(void *)(DerivedStorage + 32))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      FigCFDictionarySetInt32( Mutable,  kFigVirtualDisplaySinkDropNextFrameKey_FrameCount,  *(unsigned int *)(DerivedStorage + 364));
      sub_8814(a1, kFigVirtualDisplaySinkEvent_DropNextFrame, Mutable);
      CFRelease(Mutable);
      int v7 = *(_DWORD *)(DerivedStorage + 364);
      if (v7 <= 30) {
        int v8 = 2 * v7;
      }
      else {
        int v8 = 60;
      }
      goto LABEL_10;
    }
  }

LABEL_11:
  if (*(uint64_t *)(DerivedStorage + 296) >= 1
    && CMBufferQueueGetBufferCount(*(CMBufferQueueRef *)(DerivedStorage + 16)) >= *(void *)(DerivedStorage + 296))
  {
    uint64_t v9 = 0LL;
    if (!v5) {
      return v9;
    }
    goto LABEL_14;
  }

  uint64_t v9 = CMBufferQueueEnqueue(*(CMBufferQueueRef *)(DerivedStorage + 16), a2);
  if (v5) {
LABEL_14:
  }
    CFRelease(v5);
  return v9;
}

void sub_8A34(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
}

void sub_8A88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
    _Block_release(*(const void **)(a1 + 32));
  }

  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
}

void sub_8AD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned int *)(a1 + 40), 0LL);
    _Block_release(*(const void **)(a1 + 32));
  }

uint64_t sub_8B1C(uint64_t a1, const AudioStreamBasicDescription *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0LL;
  if (!a3) {
    return 4294950525LL;
  }
  uint64_t ClassID = FigEndpointAudioSourceGetClassID();
  uint64_t v7 = CMDerivedObjectCreate(a1, &unk_192A8, ClassID, &cf);
  if (!(_DWORD)v7)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
    uint64_t v9 = CMMemoryPoolCreate(0LL);
    *(void *)(DerivedStorage + 24) = v9;
    if (v9 && (CFAllocatorRef Allocator = CMMemoryPoolGetAllocator(v9), (*(void *)(DerivedStorage + 32) = Allocator) != 0LL))
    {
      CFRetain(Allocator);
      uint64_t v7 = CMAudioFormatDescriptionCreate( kCFAllocatorDefault,  a2,  0LL,  0LL,  0LL,  0LL,  0LL,  (CMAudioFormatDescriptionRef *)DerivedStorage);
      if (!(_DWORD)v7)
      {
        *a3 = cf;
        return v7;
      }
    }

    else
    {
      uint64_t v7 = 4294950526LL;
    }
  }

  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

uint64_t sub_8C08(uint64_t a1, dispatch_object_s *a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if ((a2 != 0LL) != (a3 != 0LL)) {
    return FigSignalErrorAt(4294950525LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  uint64_t v6 = DerivedStorage;
  uint64_t v7 = *(dispatch_object_s **)(DerivedStorage + 8);
  if (v7 != a2)
  {
    if (v7)
    {
      dispatch_release(v7);
      *(void *)(v6 + 8) = 0LL;
    }

    if (a2)
    {
      *(void *)(v6 + 8) = a2;
      dispatch_retain(a2);
    }
  }

  _Block_release(*(const void **)(v6 + 16));
  *(void *)(v6 + 16) = _Block_copy(a3);
  return 0LL;
}

void sub_8CC0(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v2 = *(const void **)(DerivedStorage + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 24) = 0LL;
  }

  uint64_t v3 = *(const void **)(DerivedStorage + 32);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(DerivedStorage + 32) = 0LL;
  }

  if (*(void *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(void *)uint64_t DerivedStorage = 0LL;
  }

  _Block_release(*(const void **)(DerivedStorage + 16));
  *(void *)(DerivedStorage + 16) = 0LL;
  CMTime v4 = *(dispatch_object_s **)(DerivedStorage + 8);
  if (v4)
  {
    dispatch_release(v4);
    *(void *)(DerivedStorage + 8) = 0LL;
  }

__CFString *sub_8D2C(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<FigNeroAudioSource %p>", a1);
  return Mutable;
}

uint64_t sub_8D80(const void *a1, const void *a2, size_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CMBlockBufferRef blockBufferOut = 0LL;
  if (!a2) {
    return 4294950525LL;
  }
  uint64_t v9 = DerivedStorage;
  if (*(void *)(DerivedStorage + 8) && *(void *)(DerivedStorage + 16))
  {
    uint64_t v10 = CMBlockBufferCreateWithMemoryBlock( kCFAllocatorDefault,  0LL,  a3,  kCFAllocatorDefault,  0LL,  0LL,  a3,  1u,  &blockBufferOut);
    if (!(_DWORD)v10)
    {
      uint64_t v10 = CMBlockBufferReplaceDataBytes(a2, blockBufferOut, 0LL, a3);
      if (!(_DWORD)v10)
      {
        CFRetain(a1);
        CFRetain(blockBufferOut);
        CMTime v11 = *(dispatch_queue_s **)(v9 + 8);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_8EAC;
        block[3] = &unk_193B0;
        block[4] = a1;
        void block[5] = blockBufferOut;
        void block[6] = a4;
        dispatch_async(v11, block);
      }
    }
  }

  else
  {
    uint64_t v10 = 4294950524LL;
  }

  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  return v10;
}

void sub_8EAC(uint64_t a1)
{
  uint64_t v2 = *(OpaqueCMBlockBuffer **)(a1 + 40);
  int64_t v3 = *(void *)(a1 + 48);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(*(void *)(a1 + 32));
  *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)&kCMTimeInvalid.value;
  sampleTimingArray.duration.CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  sampleTimingArray.presentationTimeStamp = sampleTimingArray.duration;
  sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
  CFTypeRef cf = 0LL;
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)DerivedStorage);
  uint64_t v6 = StreamBasicDescription;
  if (StreamBasicDescription->mFormatID == 1819304813) {
    int v7 = (StreamBasicDescription->mFormatFlags >> 5) & 1;
  }
  else {
    int v7 = 1;
  }
  CMTimeMake(&sampleTimingArray.presentationTimeStamp, v3, (int)StreamBasicDescription->mSampleRate);
  CMTimeMake(&v11, 1LL, (int)v6->mSampleRate);
  sampleTimingArray.CMTime duration = v11;
  unint64_t mBytesPerPacket = v6->mBytesPerPacket;
  v11.value = mBytesPerPacket;
  size_t DataLength = CMBlockBufferGetDataLength(v2);
  if (v7) {
    sampleSizeArray = 0LL;
  }
  else {
    sampleSizeArray = &v11;
  }
  if (!CMSampleBufferCreate( kCFAllocatorDefault,  v2,  1u,  0LL,  0LL,  *(CMFormatDescriptionRef *)DerivedStorage,  DataLength / mBytesPerPacket,  1LL,  &sampleTimingArray,  v7 ^ 1u,  (const size_t *)sampleSizeArray,  (CMSampleBufferRef *)&cf)) {
    (*(void (**)(void))(*(void *)(DerivedStorage + 16) + 16LL))();
  }
  if (cf) {
    CFRelease(cf);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t sub_9020(uint64_t a1, const void *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0LL;
  CFTypeRef v15 = 0LL;
  uint64_t v3 = 4294954516LL;
  CMBlockBufferRef theSourceBuffer = 0LL;
  if (a2 && a3)
  {
    uint64_t ClassID = FigEndpointMessengerGetClassID();
    uint64_t v8 = CMDerivedObjectCreate(a1, &unk_193D0, ClassID, &v15);
    if ((_DWORD)v8) {
      goto LABEL_15;
    }
    uint64_t DerivedStorage = (dispatch_queue_t *)CMBaseObjectGetDerivedStorage(v15);
    DerivedStorage[2] = (dispatch_queue_t)CFRetain(a2);
    *uint64_t DerivedStorage = dispatch_queue_create("NeroMessenger", 0LL);
    NeroTransportRegisterObject(DerivedStorage[2]);
    uint64_t v8 = FigTransportCreateBBufFromPointer(a1, v15, &cf);
    if ((_DWORD)v8
      || (dispatch_queue_t v10 = DerivedStorage[2],
          uint64_t RemoteRootObject = FigTransportGetRemoteRootObject(v8),
          uint64_t v8 = NeroTransportSendSyncMessageCreatingReply(v10, RemoteRootObject, 1668117362LL, cf, &theSourceBuffer),
          (_DWORD)v8))
    {
LABEL_15:
      uint64_t v3 = v8;
    }

    else
    {
      uint64_t v3 = CMBlockBufferCopyDataBytes(theSourceBuffer, 0LL, 8uLL, DerivedStorage + 3);
      if (!(_DWORD)v3)
      {
        *a3 = v15;
        CFTypeRef v15 = 0LL;
      }
    }
  }

  if (cf) {
    CFRelease(cf);
  }
  if (theSourceBuffer) {
    CFRelease(theSourceBuffer);
  }
  if (v15) {
    CFRelease(v15);
  }
  return v3;
}

void sub_9198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(*(void *)(a1 + 32));
  CFTypeRef cf = 0LL;
  uint64_t v6 = *(void *)(DerivedStorage + 8);
  if (v6)
  {
    if (a3)
    {
      uint64_t v6 = *(void *)(DerivedStorage + 8);
      CFTypeRef v7 = cf;
    }

    else
    {
      CFTypeRef v7 = 0LL;
    }

    (*(void (**)(uint64_t, uint64_t, CFTypeRef))(v6 + 16))(v6, a2, v7);
LABEL_7:
    if (cf) {
      CFRelease(cf);
    }
  }

void sub_922C(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  NeroTransportUnregisterObject(*(void *)(DerivedStorage + 16), a1);
  *(void *)(DerivedStorage + 24) = 0LL;
  _Block_release(*(const void **)(DerivedStorage + 8));
  *(void *)(DerivedStorage + 8) = 0LL;
  uint64_t v3 = *(const void **)(DerivedStorage + 16);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(DerivedStorage + 16) = 0LL;
  }

  if (*(void *)DerivedStorage)
  {
    dispatch_release(*(dispatch_object_t *)DerivedStorage);
    *(void *)uint64_t DerivedStorage = 0LL;
  }

__CFString *sub_928C(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<FigNeroMessenger %p>", a1);
  return Mutable;
}

uint64_t sub_92E0(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  _Block_release(*(const void **)(DerivedStorage + 8));
  *(void *)(DerivedStorage + 8) = _Block_copy(a2);
  return 0LL;
}

uint64_t sub_931C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFTypeRef cf = 0LL;
  if (a3)
  {
    uint64_t v6 = FigRemote_CreateSerializedAtomDataBlockBufferForCFType(kCFAllocatorDefault, a3, &cf);
    if ((_DWORD)v6) {
      goto LABEL_6;
    }
    CFTypeRef v7 = cf;
  }

  else
  {
    CFTypeRef v7 = 0LL;
  }

  uint64_t v6 = NeroTransportSendAsyncMessage(*(void *)(DerivedStorage + 16), *(void *)(DerivedStorage + 24), a2, v7);
LABEL_6:
  uint64_t v8 = v6;
  if (cf) {
    CFRelease(cf);
  }
  return v8;
}

uint64_t *FigOctaviaHALPlugin_Create(uint64_t a1, const void *a2)
{
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x44u,  0x3Au,  0xBAu,  0xB8u,  0xE7u,  0xB3u,  0x49u,  0x1Au,  0xB9u,  0x85u,  0xBEu,  0xB9u,  0x18u,  0x70u,  0x30u,  0xDBu);
  if (!CFEqual(a2, v4)) {
    return 0LL;
  }
  CFDataRef v5 = &qword_1C0C8;
  qword_1C0C8 = FigHALPluginDriverGetInterface();
  if (FigHALAudioObjectMapperCreate(&qword_1C0D4)
    || FigHALAudioCreateStandardPluginObject(a1, qword_1C0D4, sub_9488, sub_11CEC, &unk_1C0DC))
  {
    return 0LL;
  }

  FigAtomicIncrement32(&unk_1C0D0);
  return v5;
}

uint64_t sub_9488(uint64_t a1, void *a2)
{
  CFTypeRef cf = 0LL;
  uint64_t Shared = FigNeroEndpointManagerGetShared(&cf);
  CFTypeRef v4 = cf;
  if ((_DWORD)Shared)
  {
    if (cf) {
      CFRelease(cf);
    }
  }

  else
  {
    if (cf) {
      CFTypeRef v4 = CFRetain(cf);
    }
    *a2 = v4;
  }

  return Shared;
}

uint64_t sub_94E0(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, const void *a6, CFTypeRef *a7)
{
  CFTypeRef cf = 0LL;
  int v33 = 0;
  CFDictionaryRef dictionaryRepresentation = 0LL;
  if (!a6)
  {
    FigSignalErrorAt(4294950405LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v30 = 0LL;
    goto LABEL_25;
  }

  uint64_t ClassID = FigHALAudioStreamGetClassID();
  uint64_t v15 = CMDerivedObjectCreate(a1, &unk_19480, ClassID, &cf);
  if ((_DWORD)v15) {
    goto LABEL_30;
  }
  uint64_t v15 = FigHALAudioObjectMapperAddMapping(a2, cf, &v33);
  if ((_DWORD)v15) {
    goto LABEL_30;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
  *(_DWORD *)uint64_t DerivedStorage = v33;
  *(_DWORD *)(DerivedStorage + 16) = a3;
  *(void *)(DerivedStorage + 8) = a5;
  if (a4) {
    CFTypeRef v17 = CFRetain(a4);
  }
  else {
    CFTypeRef v17 = 0LL;
  }
  *(void *)(DerivedStorage + 24) = v17;
  *(void *)(DerivedStorage + 72) = CFRetain(a6);
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(*(void *)(DerivedStorage + 24));
  if (!v19)
  {
    uint64_t v30 = 4294954514LL;
    goto LABEL_25;
  }

  uint64_t v15 = v19(CMBaseObject, kFigEndpointStreamProperty_OutputLatency, kCFAllocatorDefault, &dictionaryRepresentation);
  if ((_DWORD)v15)
  {
LABEL_30:
    uint64_t v30 = v15;
    goto LABEL_25;
  }

  CMTimeMakeFromDictionary((CMTime *)v35, dictionaryRepresentation);
  *(_OWORD *)(DerivedStorage + 32) = *(_OWORD *)v35;
  *(void *)(DerivedStorage + 48) = *(void *)&v35[16];
  CFTypeRef v20 = cf;
  uint64_t v21 = CMBaseObjectGetDerivedStorage(cf);
  uint64_t v36 = 0LL;
  memset(v35, 0, sizeof(v35));
  CFIndex v22 = *(const __CFData **)(*(void *)(v21 + 72) + 88LL);
  if (v22 && (unint64_t Length = CFDataGetLength(v22), Length > 0x37))
  {
    unint64_t v24 = Length / 0x38;
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(v21 + 72) + 88LL));
    int v26 = 0;
    uint64_t v27 = BytePtr + 28;
    do
    {
      if (*((_DWORD *)v27 - 5) == 1819304813)
      {
        unsigned int v28 = *(_DWORD *)v27;
        if (*(_DWORD *)v27 <= 2u)
        {
          if (v28 > *(_DWORD *)&v35[28] || v28 == *(_DWORD *)&v35[28] && *((_DWORD *)v27 + 1) > v36)
          {
            *(_OWORD *)uint64_t v35 = *(_OWORD *)(v27 - 28);
            *(_OWORD *)&v35[16] = *(_OWORD *)(v27 - 12);
            uint64_t v36 = *(void *)(v27 + 4);
            *(void *)uint64_t v35 = *(void *)(v27 + 12);
          }

          int v26 = 1;
        }
      }

      v27 += 56;
      --v24;
    }

    while (v24);
    if (!v26)
    {
      uint64_t v30 = 4294950405LL;
      goto LABEL_25;
    }

    uint64_t v29 = sub_A120((uint64_t)v20, (uint64_t)v35);
  }

  else
  {
    uint64_t v29 = FigSignalErrorAt(4294950405LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  uint64_t v30 = v29;
  if (!(_DWORD)v29)
  {
    *a7 = cf;
    CFTypeRef cf = 0LL;
    goto LABEL_27;
  }

LABEL_25:
  if (cf) {
    CFRelease(cf);
  }
LABEL_27:
  if (dictionaryRepresentation) {
    CFRelease(dictionaryRepresentation);
  }
  return v30;
}

    *a6 = 40;
    if (a5 >= 0x28)
    {
      uint64_t result = 0LL;
      CFTypeID v19 = *(void *)(DerivedStorage + 72);
      CFTypeRef v20 = *(_OWORD *)(v19 + 16);
      uint64_t v21 = *(_OWORD *)(v19 + 32);
      a7[4] = *(void *)(v19 + 48);
      *(_OWORD *)a7 = v20;
      *((_OWORD *)a7 + 1) = v21;
      return result;
    }

    return 561211770LL;
  }

  if (v12 > 1936092531)
  {
    if (v12 != 1936092532)
    {
      if (v12 == 1937007734)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0LL;
          CMTime v16 = *(_DWORD *)(DerivedStorage + 16);
          goto LABEL_37;
        }

        return 561211770LL;
      }

      if (v12 != 1952805485) {
        return result;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t result = 0LL;
      CMTime v16 = 1936747378;
LABEL_37:
      *(_DWORD *)a7 = v16;
      return result;
    }

    goto LABEL_25;
  }

  switch(v12)
  {
    case 1935894638:
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t result = 0LL;
      CMTime v16 = 1;
      goto LABEL_37;
    case 1935960434:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0LL;
        *(_DWORD *)a7 = 0;
        return result;
      }

      return 561211770LL;
    case 1936092513:
LABEL_23:
      CFTypeRef v17 = 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 72) + 88LL)) / 0x38uLL);
      *a6 = v17;
      if (v17 <= a5)
      {
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 72) + 88LL));
        memcpy(a7, BytePtr, v17);
        return 0LL;
      }

      return 561211770LL;
  }

  return result;
}

    mach_msg_destroy(&v16);
    return v5;
  }

  return 4294966989LL;
}

    mach_msg_destroy(&v16);
    return v5;
  }

  return 4294966989LL;
}

void sub_9794(uint64_t a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v2 = (const void *)DerivedStorage[3];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[3] = 0LL;
  }

  uint64_t v3 = (const void *)DerivedStorage[9];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[9] = 0LL;
  }

  CFTypeRef v4 = (const void *)DerivedStorage[7];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[7] = 0LL;
  }

CFStringRef sub_97E4(uint64_t a1)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"NeroAudioOutputStream ID %d Owner %d EndpointStream %p AudioSource %p",  *DerivedStorage,  DerivedStorage[4],  *((void *)DerivedStorage + 3),  *((void *)DerivedStorage + 7));
}

uint64_t sub_9838(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!a4) {
    return 4294950405LL;
  }
  uint64_t v7 = DerivedStorage;
  if (!CFEqual(a2, kFigHALAudioStreamProperty_SupportedPCMFormats)) {
    return 4294954509LL;
  }
  uint64_t v8 = *(const void **)(*(void *)(v7 + 72) + 88LL);
  if (v8) {
    CFTypeRef v9 = CFRetain(v8);
  }
  else {
    CFTypeRef v9 = 0LL;
  }
  uint64_t result = 0LL;
  *a4 = v9;
  return result;
}

uint64_t sub_98B8(uint64_t a1)
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage(a1);
}

uint64_t sub_98D0(uint64_t a1, int *a2)
{
  uint64_t result = 0LL;
  int v3 = *a2;
  if (*a2 <= 1935762291)
  {
    if (v3 > 1870098019)
    {
      BOOL v4 = v3 == 1870098020 || v3 == 1885762592;
      int v5 = 1885762657;
    }

    else
    {
      BOOL v4 = v3 == 1650682995 || v3 == 1668047219;
      int v5 = 1819569763;
    }
  }

  else if (v3 <= 1936092512)
  {
    BOOL v4 = v3 == 1935762292 || v3 == 1935894638;
    int v5 = 1935960434;
  }

  else if (v3 > 1937007733)
  {
    BOOL v4 = v3 == 1952805485;
    int v5 = 1937007734;
  }

  else
  {
    BOOL v4 = v3 == 1936092513;
    int v5 = 1936092532;
  }

  if (v4 || v3 == v5) {
    return 1LL;
  }
  return result;
}

BOOL sub_99C0(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1885762592 || v2 == 1936092532 || v2 == 1935762292;
}

uint64_t sub_99F4(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t result = 0LL;
  int v5 = *a2;
  if (*a2 > 1935894637)
  {
    if (v5 <= 1936092531)
    {
      if (v5 == 1935894638 || v5 == 1935960434) {
        return 4LL;
      }
      if (v5 != 1936092513) {
        return result;
      }
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 72) + 88LL)) / 0x38uLL);
    }

    if (v5 != 1936092532)
    {
      if (v5 == 1937007734) {
        return 4LL;
      }
      int v7 = 1952805485;
LABEL_21:
      if (v5 != v7) {
        return result;
      }
      return 4LL;
    }

    return 40LL;
  }

  if (v5 > 1885762591)
  {
    if (v5 != 1885762592)
    {
      if (v5 != 1885762657)
      {
        int v7 = 1935762292;
        goto LABEL_21;
      }

      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 72) + 88LL)) / 0x38uLL);
    }

    return 40LL;
  }

  if (v5 != 1650682995 && v5 != 1668047219)
  {
    int v7 = 1819569763;
    goto LABEL_21;
  }

  return 4LL;
}

uint64_t sub_9B40(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, void *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v12 = *a2;
  uint64_t result = 2003332927LL;
  if (*a2 <= 1935894637)
  {
    if (v12 <= 1885762591)
    {
      if (v12 != 1650682995)
      {
        if (v12 != 1668047219)
        {
          if (v12 != 1819569763) {
            return result;
          }
          int32_t v14 = (int)*(double *)(*(void *)(DerivedStorage + 72) + 16LL);
          CMTime v22 = *(CMTime *)(DerivedStorage + 32);
          CMTimeConvertScale(&v23, &v22, v14, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          int value = v23.value;
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0LL;
            *(_DWORD *)a7 = value;
            return result;
          }

          return 561211770LL;
        }

        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0LL;
          int v16 = 1634956402;
          goto LABEL_37;
        }

        return 561211770LL;
      }

      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t result = 0LL;
      int v16 = 1634689642;
      goto LABEL_37;
    }

    if (v12 != 1885762592)
    {
      if (v12 != 1885762657)
      {
        if (v12 != 1935762292) {
          return result;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t result = 0LL;
        int v16 = *(unsigned __int8 *)(DerivedStorage + 64);
        goto LABEL_37;
      }

      goto LABEL_23;
    }

uint64_t sub_9E38(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, __int128 *a6)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  dispatch_queue_t v10 = DerivedStorage;
  uint64_t v20 = 0LL;
  int v11 = *a2;
  if (*a2 != 1885762592 && v11 != 1936092532)
  {
    if (v11 != 1935762292)
    {
      uint64_t v14 = 0LL;
      uint64_t v13 = 2003332927LL;
      goto LABEL_16;
    }

    if (a5 == 4)
    {
      int v15 = *(_DWORD *)a6 != 0;
      if (*((unsigned __int8 *)DerivedStorage + 64) != v15)
      {
        *((_BYTE *)DerivedStorage + 64) = v15;
        FigHALAudioPropertySendOneChange( *((void *)DerivedStorage + 1),  *DerivedStorage,  1935762292LL,  a2[1],  a2[2]);
      }

      uint64_t v14 = 0LL;
      uint64_t v13 = 0LL;
      goto LABEL_16;
    }

uint64_t sub_9F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a2 == 1868984941)
  {
    int v7 = (unsigned int *)DerivedStorage;
    sub_A120(a1, a3 + 16);
    FigHALAudioPropertySendChanges(*((void *)v7 + 1), *v7, 1LL, a3 + 4);
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = FigSignalErrorAt(1852797029LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  FigHALAudioConfigChangeDisposeRecord(a3);
  return v8;
}

uint64_t sub_A020(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!*(_BYTE *)(DerivedStorage + 64)) {
    return 0LL;
  }
  uint64_t v2 = DerivedStorage;
  uint64_t v3 = *(void *)(DerivedStorage + 72);
  *(void *)(v3 + 144) = 0LL;
  uint64_t result = sub_8B1C( (uint64_t)kCFAllocatorDefault,  (const AudioStreamBasicDescription *)(v3 + 96),  (CFTypeRef *)(DerivedStorage + 56));
  if (!(_DWORD)result)
  {
    uint64_t v5 = *(void *)(v2 + 24);
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(v5);
    uint64_t v8 = *(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(CMBaseObjectGetVTable(CMBaseObject) + 8) + 56LL);
    if (v8) {
      return v8(CMBaseObject, kFigEndpointStreamProperty_AudioSource, v6);
    }
    else {
      return 4294954514LL;
    }
  }

  return result;
}

uint64_t sub_A0B8(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v2 = *(const void **)(DerivedStorage + 56);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 56) = 0LL;
  }

  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(*(void *)(DerivedStorage + 24));
  BOOL v4 = *(void (**)(uint64_t, void, void))(*(void *)(CMBaseObjectGetVTable(CMBaseObject) + 8) + 56LL);
  if (v4) {
    v4(CMBaseObject, kFigEndpointStreamProperty_AudioSource, 0LL);
  }
  return 0LL;
}

uint64_t sub_A120(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v4 = DerivedStorage;
  CFTypeRef v19 = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v17 = *(void *)(a2 + 32);
  __int128 v5 = *(_OWORD *)(a2 + 16);
  v16[0] = *(_OWORD *)a2;
  __int128 v6 = v16[0];
  v16[1] = v5;
  uint64_t v7 = *(void *)(DerivedStorage + 72);
  *(void *)(v7 + 48) = v17;
  *(_OWORD *)(v7 + 16) = v6;
  *(_OWORD *)(v7 + 32) = v5;
  if (*(_DWORD *)(a2 + 8) == 1819304813) {
    HIDWORD(v16[0]) |= 0x40u;
  }
  uint64_t v8 = sub_10BD4(*(void *)(DerivedStorage + 24), v16, &v19, &cf);
  if (!(_DWORD)v8)
  {
    uint64_t v9 = *(void *)(v4 + 72);
    dispatch_queue_t v10 = *(const void **)(v9 + 56);
    CFTypeRef v11 = v19;
    *(void *)(v9 + 56) = v19;
    if (v11) {
      CFRetain(v11);
    }
    if (v10) {
      CFRelease(v10);
    }
    uint64_t v12 = *(void *)(v4 + 72);
    uint64_t v13 = *(const void **)(v12 + 64);
    CFTypeRef v14 = cf;
    *(void *)(v12 + 64) = cf;
    if (v14) {
      CFRetain(v14);
    }
    if (v13) {
      CFRelease(v13);
    }
  }

  if (v19) {
    CFRelease(v19);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v8;
}

uint64_t sub_A218(uint64_t a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v10 = *(void *)(DerivedStorage + 72);
  if (!*(_BYTE *)(v10 + 196)) {
    return 1937010544LL;
  }
  if (a2 != 1919513701) {
    return FigSignalErrorAt(1970171760LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  if (!*(_BYTE *)(DerivedStorage + 64)) {
    return 0LL;
  }
  double v11 = *(double *)(a4 + 144);
  *(double *)(v10 + 144) = v11 + (double)a3;
  int v12 = *(_DWORD *)(v10 + 156);
  uint64_t v13 = *(void *)(DerivedStorage + 56);
  CFTypeRef v14 = *(uint64_t (**)(uint64_t, uint64_t, void, unint64_t))(*(void *)(CMBaseObjectGetVTable(v13)
                                                                                         + 16)
                                                                             + 64LL);
  if (v14) {
    return v14(v13, a5, v12 * a3, (unint64_t)v11);
  }
  else {
    return 4294954514LL;
  }
}

uint64_t sub_A318(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a2)
  {
    uint64_t v4 = *(void *)(DerivedStorage + 72);
    __int128 v5 = *(_OWORD *)(v4 + 16);
    __int128 v6 = *(_OWORD *)(v4 + 32);
    *(void *)(a2 + 32) = *(void *)(v4 + 48);
    *(_OWORD *)a2 = v5;
    *(_OWORD *)(a2 + 16) = v6;
  }

  return 0LL;
}

uint64_t sub_A354(uint64_t a1, const void *a2, const __CFDictionary *a3, const void *a4, CFTypeRef *a5)
{
  CFTypeRef cf = 0LL;
  if (a5)
  {
    uint64_t ClassID = FigEndpointGetClassID();
    uint64_t v11 = CMDerivedObjectCreate(a1, &unk_195C0, ClassID, &cf);
    if (!(_DWORD)v11)
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
      dispatch_queue_t v13 = dispatch_queue_create("NeroEndpoint.queue", 0LL);
      *(void *)(DerivedStorage + 24) = v13;
      if (v13)
      {
        dispatch_queue_t v14 = dispatch_queue_create("NeroEndpoint.notification", 0LL);
        *(void *)(DerivedStorage + 32) = v14;
        if (v14)
        {
          if (a2) {
            CFTypeRef v15 = CFRetain(a2);
          }
          else {
            CFTypeRef v15 = 0LL;
          }
          *(void *)(DerivedStorage + 16) = v15;
          if (a3)
          {
            Value = CFDictionaryGetValue(a3, kFigTransportDiscoveryDeviceInfoKey_DeviceRef);
            if (Value) {
              Value = CFRetain(Value);
            }
            *(void *)(DerivedStorage + 40) = Value;
          }

          CFTypeRef v17 = a4 ? CFRetain(a4) : 0LL;
          *(void *)(DerivedStorage + 48) = v17;
          *(_WORD *)(DerivedStorage + 4) = 0;
          *(_BYTE *)(DerivedStorage + 6) = 0;
          *(void *)(DerivedStorage + 8) = 0LL;
          __int128 v18 = CFUUIDCreate(kCFAllocatorDefault);
          if (v18)
          {
            CFTypeRef v19 = v18;
            *(void *)(DerivedStorage + 56) = CFUUIDCreateString(kCFAllocatorDefault, v18);
            unsigned int v27 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v27,  &type);
            uint64_t v21 = v27;
            uint64_t v22 = type;
            if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
              uint64_t v23 = v21;
            }
            else {
              uint64_t v23 = v21 & 0xFFFFFFFE;
            }
            if ((_DWORD)v23)
            {
              int v29 = 136315394;
              uint64_t v30 = "FigNeroEndpointCreate";
              __int16 v31 = 2048;
              CFTypeRef v32 = cf;
              unint64_t v24 = (_BYTE *)_os_log_send_and_compose_impl( v23,  0LL,  v33,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v22,  "<<< neroendpoint >>> %s: [%p] successfully created nero endpoint",  (const char *)&v29,  22);
              uint64_t v21 = v27;
            }

            else
            {
              unint64_t v24 = 0LL;
            }

            fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v24, v24 != v33, v21, 0LL);
            *a5 = cf;
            CFTypeRef cf = 0LL;
            CFRelease(v19);
            return 0LL;
          }
        }
      }

      uint64_t v11 = 4294950575LL;
    }

    if (cf) {
      CFRelease(cf);
    }
    return v11;
  }

  return FigSignalErrorAt(4294950576LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

void sub_A610(const void *a1, int a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFRetain(a1);
  if (a3) {
    CFRetain(a3);
  }
  uint64_t v7 = *(dispatch_queue_s **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_A6A0;
  block[3] = &unk_195D8;
  int v9 = a2;
  block[4] = a1;
  void block[5] = a3;
  dispatch_async(v7, block);
}

void sub_A6A0(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
}

void sub_A6E8(const void *a1, int a2, uint64_t a3)
{
  if (!*(_BYTE *)CMBaseObjectGetDerivedStorage(a1))
  {
    if (a2 == 1684628836 || a2 == 1752196144)
    {
      sub_BA74(a1);
      return;
    }

    if (a2 != 1752196145) {
      return;
    }
    CFDictionaryRef theDict = 0LL;
    uint64_t DerivedStorage = (unsigned __int8 *)CMBaseObjectGetDerivedStorage(a1);
    unsigned int v32 = 0;
    HIBYTE(v31) = 0;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v32,  (char *)&v31 + 3);
    uint64_t v8 = v32;
    uint64_t v9 = HIBYTE(v31);
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, HIBYTE(v31))) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = v8 & 0xFFFFFFFE;
    }
    if ((_DWORD)v10)
    {
      int v11 = *DerivedStorage;
      uint64_t v12 = *((void *)DerivedStorage + 8);
      int v34 = 136315906;
      uint64_t v35 = "nendpoint_displayWasAttached";
      __int16 v36 = 2048;
      int v37 = a1;
      __int16 v38 = 1024;
      int v39 = v11;
      __int16 v40 = 2048;
      uint64_t v41 = v12;
      LODWORD(v30) = 38;
      dispatch_queue_t v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  block,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v9,  "<<< neroendpoint >>> %s: [%p] dissociated %d screenStream %p",  (const char *)&v34,  v30,  v31,  theDict);
      uint64_t v8 = v32;
    }

    else
    {
      dispatch_queue_t v13 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v13, v13 != block, v8, 0LL);
    if (*DerivedStorage
      || *((void *)DerivedStorage + 8)
      || FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer(kCFAllocatorDefault, a3, 0LL, &theDict))
    {
      goto LABEL_47;
    }

    DerivedStorage[1] = CFDictionaryContainsKey(theDict, @"Stevenote");
    Value = CFDictionaryGetValue(theDict, @"Valeria");
    int v15 = FigCFEqual(kCFBooleanTrue, Value);
    DerivedStorage[2] = v15;
    if (DerivedStorage[1])
    {
      sub_3144(*((const void **)DerivedStorage + 2));
      unsigned int v32 = 0;
      HIBYTE(v31) = 0;
      int v16 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v32,  (char *)&v31 + 3);
      uint64_t v17 = v32;
      uint64_t v18 = HIBYTE(v31);
      if (os_log_type_enabled(v16, HIBYTE(v31))) {
        uint64_t v19 = v17;
      }
      else {
        uint64_t v19 = v17 & 0xFFFFFFFE;
      }
      if ((_DWORD)v19)
      {
        int v34 = 136315394;
        uint64_t v35 = "nendpoint_displayWasAttached";
        __int16 v36 = 2048;
        int v37 = a1;
        LODWORD(v30) = 22;
        uint64_t v20 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  block,  128LL,  &dword_0,  v16,  v18,  "<<< neroendpoint >>> %s: <Stevenote>: FigOctaviaInitializeStevenote completed: [%p] ",  (const char *)&v34,  v30);
        uint64_t v17 = v32;
      }

      else
      {
        uint64_t v20 = 0LL;
      }

      fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v20, v20 != block, v17, 0LL);
      int v15 = DerivedStorage[2];
    }

    if (v15
      && FigGetCFPreferenceNumberWithDefault( @"statusbar_override_for_recording",  @"com.apple.coremedia",  1LL))
    {
      SBSSetStatusBarShowsOverridesForRecording(1LL);
    }

    if (DerivedStorage[1] || DerivedStorage[2])
    {
      sub_4440(1u);
      if (DerivedStorage[1])
      {
        unsigned int v32 = 0;
        HIBYTE(v31) = 0;
        uint64_t v21 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v32,  (char *)&v31 + 3);
        uint64_t v22 = v32;
        uint64_t v23 = HIBYTE(v31);
        if (os_log_type_enabled(v21, HIBYTE(v31))) {
          uint64_t v24 = v22;
        }
        else {
          uint64_t v24 = v22 & 0xFFFFFFFE;
        }
        if ((_DWORD)v24)
        {
          int v34 = 136315394;
          uint64_t v35 = "nendpoint_displayWasAttached";
          __int16 v36 = 2048;
          int v37 = a1;
          LODWORD(v30) = 22;
          CFTypeID v25 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  block,  128LL,  &dword_0,  v21,  v23,  "<<< neroendpoint >>> %s: <Stevenote>: FigOctaviaSetCloneMirroringMode completed: [%p] ",  (const char *)&v34,  v30);
          uint64_t v22 = v32;
        }

        else
        {
          CFTypeID v25 = 0LL;
        }

        fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v25, v25 != block, v22, 0LL);
      }
    }

    DerivedStorage[98] = 1;
    MutableCopy = (__CFDictionary *)FigCFDictionaryCreateMutableCopy(kCFAllocatorDefault, theDict);
    unsigned int v27 = MutableCopy;
    if (DerivedStorage[3]) {
      CFDictionarySetValue(MutableCopy, @"CameraPreview", kCFBooleanTrue);
    }
    if (sub_F79C( (uint64_t)kCFAllocatorDefault,  v27,  *((const void **)DerivedStorage + 6),  *((const void **)DerivedStorage + 2),  (CFTypeRef *)DerivedStorage + 8))
    {
LABEL_45:
      if (v27) {
        CFRelease(v27);
      }
LABEL_47:
      if (theDict) {
        CFRelease(theDict);
      }
      return;
    }

    if (*((void *)DerivedStorage + 4))
    {
      if (DerivedStorage[4])
      {
        uint64_t v28 = *((void *)DerivedStorage + 13);
        CFRetain(a1);
        int v29 = (dispatch_queue_s *)*((void *)DerivedStorage + 4);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_C7DC;
        block[3] = &unk_19880;
        block[4] = DerivedStorage;
        void block[5] = a1;
        void block[6] = v28;
        dispatch_async(v29, block);
LABEL_44:
        *((void *)DerivedStorage + 1) |= 1uLL;
        goto LABEL_45;
      }
    }

    else if (DerivedStorage[4])
    {
      goto LABEL_44;
    }

    DerivedStorage[5] = 1;
    goto LABEL_44;
  }

void sub_AC28(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(dispatch_queue_s **)(CMBaseObjectGetDerivedStorage(a1) + 24);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000LL;
  v9[2] = sub_ACA8;
  v9[3] = &unk_19600;
  int v10 = a2;
  void v9[5] = a1;
  v9[6] = a3;
  v9[4] = a4;
  dispatch_sync(v8, v9);
}

void sub_ACA8(uint64_t a1)
{
}

void sub_ACBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage(a1);
  CFTypeRef cf = 0LL;
  BOOL v10 = 0;
  if (*DerivedStorage)
  {
    CFTypeRef v9 = 0LL;
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 4294955260LL;
    if (DerivedStorage[1])
    {
      sub_4388(a2, a3, &cf, &v10);
      CFTypeRef v9 = cf;
      if (v10) {
        uint64_t v8 = 0LL;
      }
      else {
        uint64_t v8 = 4294955260LL;
      }
    }

    else
    {
      CFTypeRef v9 = 0LL;
    }
  }

  (*(void (**)(uint64_t, uint64_t, CFTypeRef))(a4 + 16))(a4, v8, v9);
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t sub_AD64(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  __int128 v5 = *(dispatch_queue_s **)(DerivedStorage + 24);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = sub_AE0C;
  v8[3] = &unk_19628;
  v8[4] = &v9;
  v8[5] = DerivedStorage;
  v8[6] = a1;
  v8[7] = a2;
  dispatch_sync(v5, v8);
  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_AE0C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(const void **)(a1 + 48);
  *(_BYTE *)(v3 + 3) = 1;
  int v4 = sub_AE84(v2, *(void *)(a1 + 56));
  uint64_t v5 = *(void *)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    *(_BYTE *)(v5 + 4) = 1;
  }
  if (*(_BYTE *)(v5 + 5))
  {
    sub_B370(*(const void **)(a1 + 48), 1LL, kFigEndpointNotification_CameraPreviewStreamChanged);
    *(_BYTE *)(*(void *)(a1 + 40) + 5LL) = 0;
  }

uint64_t sub_AE84(const void *a1, uint64_t a2)
{
  uint64_t DerivedStorage = (unsigned __int8 *)CMBaseObjectGetDerivedStorage(a1);
  if (*DerivedStorage) {
    return 4294950573LL;
  }
  uint64_t v5 = DerivedStorage;
  if (DerivedStorage[96]) {
    return 0LL;
  }
  if (DerivedStorage[1])
  {
    int valuePtr = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &valuePtr,  &type);
    uint64_t v7 = valuePtr;
    uint64_t v8 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v7 & 0xFFFFFFFE;
    }
    if ((_DWORD)v9)
    {
      int v10 = *v5;
      *(_DWORD *)CFTypeRef cf = 136315650;
      *(void *)&cf[4] = "nendpoint_activateInternal";
      __int16 v40 = 2048;
      uint64_t v41 = a1;
      __int16 v42 = 1024;
      int v43 = v10;
      LODWORD(v34) = 28;
      uint64_t v11 = (CFTypeRef *)_os_log_send_and_compose_impl( v9,  0LL,  v44,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v8,  "<<< neroendpoint >>> %s: <Stevenote>: nendpoint_activateInternal [%p] storage->dissociated %d",  cf,  v34,  v35);
      uint64_t v7 = valuePtr;
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v11, v11 != v44, v7, 0LL);
  }

  ++*((void *)v5 + 13);
  *((void *)v5 + 14) = a2;
  void block[16] = a1;
  block[17] = _NSConcreteStackBlock;
  block[18] = 0x40000000LL;
  block[19] = sub_C870;
  block[20] = &unk_198A0;
  block[21] = a1;
  block[11] = a1;
  block[12] = _NSConcreteStackBlock;
  block[13] = 0x40000000LL;
  block[14] = sub_CB5C;
  block[15] = &unk_198C0;
  void block[7] = _NSConcreteStackBlock;
  block[8] = 0x40000000LL;
  void block[9] = sub_CB64;
  block[10] = &unk_198E0;
  if (*((void *)v5 + 2))
  {
    if (v5[2]) {
      v5[97] = 1;
    }
    goto LABEL_14;
  }

  uint64_t v15 = CMBaseObjectGetDerivedStorage(a1);
  v44[0] = 0LL;
  *(void *)CFTypeRef cf = 0LL;
  uint64_t v16 = v15 + 16;
  if (*(void *)(v15 + 16))
  {
    uint64_t v12 = FigSignalErrorAt(4294950576LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v19 = 0LL;
    goto LABEL_35;
  }

  uint64_t v17 = v15;
  CFPropertyListRef v18 = CFPreferencesCopyValue( @"neroendpoint_ip",  @"com.apple.coremedia",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  uint64_t v19 = v18;
  if (!v18 || (CFTypeID v20 = CFGetTypeID(v18), v20 != CFStringGetTypeID()))
  {
    uint64_t v28 = *(void *)(v17 + 48);
    CFAllocatorRef v21 = kCFAllocatorDefault;
    if (v28)
    {
      uint64_t CMBaseObject = FigVirtualDisplaySourceGetCMBaseObject();
      if (v30)
      {
        v30(CMBaseObject, @"Destination", kCFAllocatorDefault, v44);
        if (v44[0])
        {
          uint64_t v22 = FigTransportConnectionIDSCreate(kCFAllocatorDefault, cf);
          if ((_DWORD)v22) {
            goto LABEL_34;
          }
        }
      }
    }

    goto LABEL_33;
  }

  CFAllocatorRef v21 = kCFAllocatorDefault;
  uint64_t v22 = FigTransportConnectionTCPCreate(kCFAllocatorDefault, cf);
  if (!(_DWORD)v22)
  {
    uint64_t v23 = NeroTransportConnectionGetCMBaseObject(*(void *)cf);
    uint64_t v24 = *(uint64_t (**)(uint64_t, void, const void *))(*(void *)(CMBaseObjectGetVTable(v23) + 8) + 56LL);
    if (!v24)
    {
      uint64_t v12 = 4294954514LL;
      goto LABEL_35;
    }

    uint64_t v22 = v24(v23, kFigTransportConnectionTCPProperty_IPAddress, v19);
    if (!(_DWORD)v22)
    {
      int valuePtr = FigGetCFPreferenceNumberWithDefault(@"neroendpoint_port", @"com.apple.coremedia", 0LL);
      if (valuePtr >= 1)
      {
        CFNumberRef v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        uint64_t v26 = NeroTransportConnectionGetCMBaseObject(*(void *)cf);
        unsigned int v27 = *(void (**)(uint64_t, void, CFNumberRef))(*(void *)(CMBaseObjectGetVTable(v26) + 8) + 56LL);
        if (v27) {
          v27(v26, kFigTransportConnectionTCPProperty_Port, v25);
        }
        CFRelease(v25);
      }

LABEL_34:
  uint64_t v12 = v22;
LABEL_35:
  if (v44[0]) {
    CFRelease(v44[0]);
  }
  if (v19) {
    CFRelease(v19);
  }
  uint64_t v31 = *(void *)cf;
  if (*(void *)cf) {
    CFRelease(*(CFTypeRef *)cf);
  }
  if ((_DWORD)v12) {
    return v12;
  }
  uint64_t v32 = *((void *)v5 + 2);
  FigTransportGetLocalRootObject(v31);
  uint64_t v12 = NeroTransportRegisterObject(v32);
  if ((_DWORD)v12) {
    return v12;
  }
  uint64_t v12 = NeroTransportConnectToReceiver(*((void *)v5 + 2), *((void *)v5 + 5));
  if ((_DWORD)v12) {
    return v12;
  }
  v5[97] = 1;
LABEL_14:
  uint64_t v12 = NeroTransportRegisterObjectWithFlags();
  if (!(_DWORD)v12)
  {
    v5[96] = 1;
    if (*((void *)v5 + 4) && !v5[3])
    {
      uint64_t v13 = *((void *)v5 + 13);
      CFRetain(a1);
      dispatch_queue_t v14 = (dispatch_queue_s *)*((void *)v5 + 4);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_CB6C;
      block[3] = &unk_19900;
      block[4] = a1;
      void block[5] = 0LL;
      void block[6] = v13;
      dispatch_async(v14, block);
    }

    return 0LL;
  }

  return v12;
}

void sub_B370(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v7 = *(void *)(DerivedStorage + 104);
  CFRetain(a1);
  uint64_t v8 = *(dispatch_queue_s **)(DerivedStorage + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000LL;
  v9[2] = sub_CC4C;
  v9[3] = &unk_19940;
  v9[4] = a1;
  void v9[5] = a2;
  v9[6] = v7;
  void v9[7] = a3;
  dispatch_async(v8, v9);
}

void sub_B400(const void *a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = (dispatch_object_s *)DerivedStorage[4];
  if (v3)
  {
    dispatch_release(v3);
    DerivedStorage[4] = 0LL;
  }

  sub_B7EC(a1);
  int v4 = (const void *)DerivedStorage[5];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[5] = 0LL;
  }

  uint64_t v5 = (const void *)DerivedStorage[6];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[6] = 0LL;
  }

  uint64_t v6 = (dispatch_object_s *)DerivedStorage[3];
  if (v6)
  {
    dispatch_release(v6);
    DerivedStorage[3] = 0LL;
  }

  uint64_t v7 = (const void *)DerivedStorage[7];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[7] = 0LL;
  }

__CFString *sub_B47C(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<FigNeroEndpoint %p>", a1);
  return Mutable;
}

uint64_t sub_B4D0(uint64_t a1, const void *a2, uint64_t a3, __CFArray **a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (CFEqual(a2, kFigEndpointProperty_Type))
  {
    uint64_t v7 = (const CFBooleanRef *)&kFigEndpointType_Nero;
LABEL_3:
    uint64_t v8 = (const __CFString *)*v7;
LABEL_4:
    uint64_t v9 = (__CFArray *)CFRetain(v8);
LABEL_5:
    int v10 = v9;
LABEL_6:
    uint64_t result = 0LL;
    *a4 = v10;
    return result;
  }

  if (*(_BYTE *)DerivedStorage) {
    return 4294950573LL;
  }
  if (CFEqual(a2, kFigEndpointProperty_Streams))
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    if (!Mutable) {
      return 4294950575LL;
    }
    uint64_t v13 = Mutable;
    dispatch_queue_t v14 = *(const void **)(DerivedStorage + 64);
    if (v14) {
      CFArrayAppendValue(Mutable, v14);
    }
    uint64_t v15 = *(const void **)(DerivedStorage + 72);
    if (v15) {
      CFArrayAppendValue(v13, v15);
    }
    uint64_t result = 0LL;
    *a4 = v13;
    return result;
  }

  if (CFEqual(a2, kFigEndpointProperty_ID))
  {
    uint64_t v8 = *(const __CFString **)(DerivedStorage + 56);
    if (!v8)
    {
      int v10 = 0LL;
      goto LABEL_6;
    }

    goto LABEL_4;
  }

  if (CFEqual(a2, kFigEndpointProperty_TransportType))
  {
    uint64_t v7 = (const CFBooleanRef *)&kFigEndpointTransportType_USB;
    goto LABEL_3;
  }

  if (CFEqual(a2, kFigEndpointProperty_Model))
  {
    int v16 = *(unsigned __int8 *)(DerivedStorage + 1);
    uint64_t v17 = @"Stevenote";
    goto LABEL_23;
  }

  if (CFEqual(a2, kFigEndpointProperty_Name))
  {
    if (!*(_BYTE *)(DerivedStorage + 1))
    {
      uint64_t v9 = (__CFArray *)sub_C204();
      goto LABEL_5;
    }

    goto LABEL_28;
  }

  if (CFEqual(a2, kFigEndpointProperty_IsActivated))
  {
    uint64_t v7 = &kCFBooleanTrue;
    int v18 = *(unsigned __int8 *)(DerivedStorage + 96);
    goto LABEL_31;
  }

  if (!CFEqual(a2, kFigEndpointProperty_Messenger))
  {
    if (CFEqual(a2, @"subType"))
    {
      if (*(_BYTE *)(DerivedStorage + 2))
      {
        uint64_t v8 = @"Valeria";
        goto LABEL_4;
      }

      if (!*(_BYTE *)(DerivedStorage + 1))
      {
        int v16 = *(unsigned __int8 *)(DerivedStorage + 80);
        uint64_t v17 = @"Messalina";
LABEL_23:
        if (v16) {
          uint64_t v8 = v17;
        }
        else {
          uint64_t v8 = @"Nero";
        }
        goto LABEL_4;
      }

LABEL_28:
      uint64_t v8 = @"Stevenote";
      goto LABEL_4;
    }

    if (CFEqual(a2, kFigEndpointProperty_AutoconnectEnabled))
    {
      uint64_t v7 = &kCFBooleanTrue;
      goto LABEL_3;
    }

    if (CFEqual(a2, kFigEndpointProperty_ActivatedFeatures))
    {
      uint64_t v19 = *(dispatch_queue_s **)(DerivedStorage + 24);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 0x40000000LL;
      v20[2] = sub_C258;
      v20[3] = &unk_19760;
      v20[4] = a4;
      v20[5] = DerivedStorage;
      dispatch_sync(v19, v20);
      return 0LL;
    }

    uint64_t v7 = &kCFBooleanTrue;
    if (*(_BYTE *)(DerivedStorage + 1)) {
      goto LABEL_3;
    }
    int v18 = *(unsigned __int8 *)(DerivedStorage + 2);
LABEL_31:
    if (!v18) {
      uint64_t v7 = &kCFBooleanFalse;
    }
    goto LABEL_3;
  }

  uint64_t v8 = *(const __CFString **)(DerivedStorage + 120);
  if (v8) {
    goto LABEL_4;
  }
  uint64_t result = sub_9020( (uint64_t)kCFAllocatorDefault,  *(const void **)(DerivedStorage + 16),  (CFTypeRef *)(DerivedStorage + 120));
  if (!(_DWORD)result)
  {
    uint64_t v8 = *(const __CFString **)(DerivedStorage + 120);
    goto LABEL_4;
  }

  return result;
}

void sub_B7EC(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (*(_BYTE *)(DerivedStorage + 96))
  {
    uint64_t v3 = (unsigned __int8 *)DerivedStorage;
    uint64_t v4 = *(void *)(DerivedStorage + 112);
    uint64_t v6 = (void *)(DerivedStorage + 104);
    uint64_t v5 = *(void *)(DerivedStorage + 104);
    if (*(_BYTE *)(DerivedStorage + 1))
    {
      unsigned int v28 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v28,  &type);
      uint64_t v8 = v28;
      uint64_t v9 = type;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = v8 & 0xFFFFFFFE;
      }
      if ((_DWORD)v10)
      {
        int v11 = *v3;
        uint64_t v12 = *((void *)v3 + 8);
        int v29 = 136315906;
        uint64_t v30 = "nendpoint_deactivateInternal";
        __int16 v31 = 2048;
        uint64_t v32 = a1;
        __int16 v33 = 1024;
        int v34 = v11;
        __int16 v35 = 2048;
        uint64_t v36 = v12;
        LODWORD(v19) = 38;
        uint64_t v13 = (_BYTE *)_os_log_send_and_compose_impl( v10,  0LL,  v37,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v9,  "<<< neroendpoint >>> %s: <Stevenote>: nendpoint_deactivateInternal [%p] storage->dissociated %d storage->screenStream %p",  (const char *)&v29,  v19,  (_DWORD)block,  (const void *)v21);
        uint64_t v8 = v28;
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v13, v13 != v37, v8, 0LL);
    }

    uint64_t v14 = sub_BA34((uint64_t)a1);
    uint64_t v15 = *((void *)v3 + 2);
    if (v15)
    {
      if (v3[97])
      {
        uint64_t v14 = NeroTransportDisconnectFromReceiver(*((void *)v3 + 2));
        uint64_t v15 = *((void *)v3 + 2);
      }

      uint64_t LocalRootObject = FigTransportGetLocalRootObject(v14);
      NeroTransportUnregisterObject(v15, LocalRootObject);
      NeroTransportUnregisterObject(*((void *)v3 + 2), a1);
      NeroTransportInvalidate(*((void *)v3 + 2));
      uint64_t v17 = (const void *)*((void *)v3 + 2);
      if (v17)
      {
        CFRelease(v17);
        *((void *)v3 + 2) = 0LL;
      }
    }

    sub_BA74(a1);
    sub_BE44(a1);
    v3[96] = 0;
    v3[4] = 0;
    *((void *)v3 + 1) = 0LL;
    void *v6 = 0LL;
    v6[1] = 0LL;
    if (*((void *)v3 + 4))
    {
      CFRetain(a1);
      int v18 = (dispatch_queue_s *)*((void *)v3 + 4);
      block = _NSConcreteStackBlock;
      uint64_t v21 = 0x40000000LL;
      uint64_t v22 = sub_BF08;
      uint64_t v23 = &unk_19700;
      uint64_t v24 = a1;
      uint64_t v25 = v4;
      uint64_t v26 = v5;
      dispatch_async(v18, &block);
    }
  }

uint64_t sub_BA34(uint64_t a1)
{
  uint64_t result = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v2 = *(void *)(result + 88);
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t result = NeroTransportSendAsyncMessage(*(void *)(result + 16), v2, 1919249523LL, 0LL);
    *(void *)(v3 + 88) = 0LL;
  }

  return result;
}

void sub_BA74(const void *a1)
{
  uint64_t DerivedStorage = (unsigned __int8 *)CMBaseObjectGetDerivedStorage(a1);
  unsigned int v34 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v34,  &type);
  uint64_t v4 = v34;
  uint64_t v5 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 & 0xFFFFFFFE;
  }
  if ((_DWORD)v6)
  {
    int v7 = *DerivedStorage;
    uint64_t v8 = *((void *)DerivedStorage + 8);
    int v35 = 136315906;
    uint64_t v36 = "nendpoint_displayWasDetached";
    __int16 v37 = 2048;
    __int16 v38 = a1;
    __int16 v39 = 1024;
    int v40 = v7;
    __int16 v41 = 2048;
    uint64_t v42 = v8;
    LODWORD(v25) = 38;
    uint64_t v9 = (_BYTE *)_os_log_send_and_compose_impl( v6,  0LL,  v43,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v5,  "<<< neroendpoint >>> %s: [%p] dissociated %d screenStream %p",  (const char *)&v35,  v25,  (_DWORD)block,  (const void *)v27);
    uint64_t v4 = v34;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v9, v9 != v43, v4, 0LL);
  if (DerivedStorage[98])
  {
    if (DerivedStorage[1] || DerivedStorage[2])
    {
      sub_4440(0);
      if (DerivedStorage[1])
      {
        unsigned int v34 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v10 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v34, &type);
        uint64_t v11 = v34;
        uint64_t v12 = type;
        if (os_log_type_enabled(v10, type)) {
          uint64_t v13 = v11;
        }
        else {
          uint64_t v13 = v11 & 0xFFFFFFFE;
        }
        if ((_DWORD)v13)
        {
          int v35 = 136315394;
          uint64_t v36 = "nendpoint_displayWasDetached";
          __int16 v37 = 2048;
          __int16 v38 = a1;
          LODWORD(v25) = 22;
          uint64_t v14 = (_BYTE *)_os_log_send_and_compose_impl( v13,  0LL,  v43,  128LL,  &dword_0,  v10,  v12,  "<<< neroendpoint >>> %s: <Stevenote>: FigOctaviaSetCloneMirroringMode completed: [%p] ",  (const char *)&v35,  v25);
          uint64_t v11 = v34;
        }

        else
        {
          uint64_t v14 = 0LL;
        }

        fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v14, v14 != v43, v11, 0LL);
      }
    }

    if (DerivedStorage[2]) {
      SBSSetStatusBarShowsOverridesForRecording(0LL);
    }
    if (DerivedStorage[1])
    {
      sub_3D3C();
      unsigned int v34 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v15 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v34, &type);
      uint64_t v16 = v34;
      uint64_t v17 = type;
      if (os_log_type_enabled(v15, type)) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v18)
      {
        int v35 = 136315394;
        uint64_t v36 = "nendpoint_displayWasDetached";
        __int16 v37 = 2048;
        __int16 v38 = a1;
        LODWORD(v25) = 22;
        uint64_t v19 = (_BYTE *)_os_log_send_and_compose_impl( v18,  0LL,  v43,  128LL,  &dword_0,  v15,  v17,  "<<< neroendpoint >>> %s: <Stevenote>: FigOctaviaUninitializeStevenote completed: [%p] ",  (const char *)&v35,  v25);
        uint64_t v16 = v34;
      }

      else
      {
        uint64_t v19 = 0LL;
      }

      fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v19, v19 != v43, v16, 0LL);
    }

    DerivedStorage[98] = 0;
  }

  uint64_t v20 = *((void *)DerivedStorage + 8);
  if (v20)
  {
    if (v21) {
      v21(v20);
    }
    uint64_t v22 = (const void *)*((void *)DerivedStorage + 8);
    if (v22)
    {
      CFRelease(v22);
      *((void *)DerivedStorage + 8) = 0LL;
    }

    if (*((void *)DerivedStorage + 4))
    {
      uint64_t v23 = *((void *)DerivedStorage + 13);
      CFRetain(a1);
      uint64_t v24 = (dispatch_queue_s *)*((void *)DerivedStorage + 4);
      block = _NSConcreteStackBlock;
      uint64_t v27 = 0x40000000LL;
      unsigned int v28 = sub_C024;
      int v29 = &unk_19720;
      uint64_t v30 = DerivedStorage;
      __int16 v31 = a1;
      uint64_t v32 = v23;
      dispatch_async(v24, &block);
    }
  }

  *((void *)DerivedStorage + 1) &= ~1uLL;
}

void sub_BE44(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = (void *)DerivedStorage;
  uint64_t v4 = *(void *)(DerivedStorage + 72);
  if (v4)
  {
    if (v5) {
      v5(v4);
    }
    uint64_t v6 = (const void *)v3[9];
    if (v6)
    {
      CFRelease(v6);
      v3[9] = 0LL;
    }

    if (v3[4])
    {
      uint64_t v7 = v3[13];
      CFRetain(a1);
      uint64_t v8 = (dispatch_queue_s *)v3[4];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000LL;
      v9[2] = sub_C190;
      v9[3] = &unk_19740;
      v9[4] = a1;
      void v9[5] = v7;
      dispatch_async(v8, v9);
    }
  }

  v3[1] &= ~2uLL;
}

void sub_BF08(uint64_t a1)
{
  CFMutableDictionaryRef v5 = 0LL;
  uint64_t v2 = sub_BF74(*(const void **)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), &v5);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v2);
  CFMutableDictionaryRef v4 = v5;
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointNotification_EndpointDeactivated,  *(void *)(a1 + 32),  v5,  0LL);
  if (v4) {
    CFRelease(v4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t sub_BF74(const void *a1, uint64_t a2, uint64_t a3, CFMutableDictionaryRef *a4)
{
  uint64_t v7 = CFGetAllocator(a1);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v7, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return FigSignalErrorAt(4294950575LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  CFMutableDictionaryRef v9 = Mutable;
  FigCFDictionarySetInt64(Mutable, kFigEndpointNotificationPayloadKey_ActivationSeed, a3);
  uint64_t result = FigCFDictionarySetInt64(v9, kFigEndpointNotificationPayloadKey_Features, a2);
  *a4 = v9;
  return result;
}

void sub_C024(uint64_t a1)
{
  CFMutableDictionaryRef v9 = 0LL;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(const void **)(a1 + 40);
  if (*(_BYTE *)(v3 + 3)) {
    CFMutableDictionaryRef v4 = (uint64_t *)&kFigEndpointNotification_CameraPreviewStreamChanged;
  }
  else {
    CFMutableDictionaryRef v4 = (uint64_t *)&kFigEndpointNotification_StreamsChanged;
  }
  uint64_t v5 = *v4;
  uint64_t v6 = sub_C0B8(v2, 1LL, 0, *(void *)(a1 + 48), &v9);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v6);
  CFMutableDictionaryRef v8 = v9;
  CMNotificationCenterPostNotification(DefaultLocalCenter, v5, *(void *)(a1 + 40), v9, 0LL);
  if (v8) {
    CFRelease(v8);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t sub_C0B8(const void *a1, uint64_t a2, unsigned int a3, uint64_t a4, CFMutableDictionaryRef *a5)
{
  CFMutableDictionaryRef v9 = CFGetAllocator(a1);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v9, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return FigSignalErrorAt(4294950575LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  CFMutableDictionaryRef v11 = Mutable;
  FigCFDictionarySetInt64(Mutable, kFigEndpointNotificationPayloadKey_Features, a2);
  FigCFDictionarySetInt64(v11, kFigEndpointNotificationPayloadKey_EnabledState, a3);
  uint64_t result = FigCFDictionarySetInt64(v11, kFigEndpointNotificationPayloadKey_ActivationSeed, a4);
  *a5 = v11;
  return result;
}

void sub_C190(uint64_t a1)
{
  CFMutableDictionaryRef v5 = 0LL;
  uint64_t v2 = sub_C0B8(*(const void **)(a1 + 32), 2LL, 0, *(void *)(a1 + 40), &v5);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v2);
  CFMutableDictionaryRef v4 = v5;
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointNotification_StreamsChanged,  *(void *)(a1 + 32),  v5,  0LL);
  if (v4) {
    CFRelease(v4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

CFStringRef sub_C204()
{
  if (qword_1C0E8 != -1) {
    dispatch_once(&qword_1C0E8, &stru_197A0);
  }
  return CFBundleCopyLocalizedString((CFBundleRef)qword_1C0F8, @"plou", @"plou", @"Localizable");
}

uint64_t sub_C258(uint64_t a1)
{
  uint64_t result = FigCFNumberCreateUInt64(kCFAllocatorDefault, *(void *)(*(void *)(a1 + 40) + 8LL));
  **(void **)(a1 + 32) = result;
  return result;
}

void sub_C294(id a1)
{
  qword_1C0F0 = (uint64_t)CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/Library/Audio/Plug-Ins/HAL/VirtualAudio.plugin",  kCFURLPOSIXPathStyle,  1u);
  CFBundleRef v1 = CFBundleCreate(kCFAllocatorDefault, (CFURLRef)qword_1C0F0);
  qword_1C0F8 = (uint64_t)v1;
  if (v1) {
    CFRetain(v1);
  }
  if (qword_1C0F0) {
    CFRelease((CFTypeRef)qword_1C0F0);
  }
}

uint64_t sub_C308(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFRetain(a1);
  uint64_t v10 = *(dispatch_queue_s **)(DerivedStorage + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_C4BC;
  block[3] = &unk_197E0;
  block[4] = a1;
  void block[5] = a2;
  void block[6] = a4;
  void block[7] = DerivedStorage;
  block[8] = a5;
  dispatch_async(v10, block);
  return 0LL;
}

uint64_t sub_C3A0(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFRetain(a1);
  CFMutableDictionaryRef v8 = *(dispatch_queue_s **)(DerivedStorage + 24);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000LL;
  v10[2] = sub_C5FC;
  v10[3] = &unk_19820;
  void v10[4] = a1;
  v10[5] = a3;
  v10[6] = DerivedStorage;
  v10[7] = a4;
  dispatch_async(v8, v10);
  return 0LL;
}

uint64_t sub_C428(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!*(_BYTE *)DerivedStorage)
  {
    uint64_t v3 = DerivedStorage;
    *(_BYTE *)uint64_t DerivedStorage = 1;
    CFMutableDictionaryRef v4 = *(const void **)(DerivedStorage + 120);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(v3 + 120) = 0LL;
    }

    CFRetain(a1);
    CFMutableDictionaryRef v5 = *(dispatch_queue_s **)(v3 + 24);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000LL;
    v7[2] = sub_C6D8;
    v7[3] = &unk_19860;
    v7[4] = v3;
    v7[5] = a1;
    dispatch_sync(v5, v7);
  }

  return 0LL;
}

void sub_C4BC(uint64_t a1)
{
  int v2 = sub_AE84(*(const void **)(a1 + 32), *(void *)(a1 + 40));
  if (*(void *)(a1 + 48))
  {
    int v3 = v2;
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 104LL);
    CFRetain(*(CFTypeRef *)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(dispatch_queue_s **)(*(void *)(a1 + 56) + 32LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000LL;
    v9[2] = sub_C5C8;
    v9[3] = &unk_197C0;
    uint64_t v7 = *(void *)(a1 + 32);
    v9[4] = v5;
    void v9[5] = v7;
    void v9[6] = 0LL;
    void v9[7] = v4;
    int v10 = v3;
    void v9[8] = *(void *)(a1 + 64);
    dispatch_async(v6, v9);
    if (!v3) {
      *(_BYTE *)(*(void *)(a1 + 56) + 4LL) = 1;
    }
  }

  uint64_t v8 = *(void *)(a1 + 56);
  if (*(_BYTE *)(v8 + 5))
  {
    sub_B370(*(const void **)(a1 + 32), 1LL, kFigEndpointNotification_StreamsChanged);
    uint64_t v8 = *(void *)(a1 + 56);
    *(_BYTE *)(v8 + 5) = 0;
  }

  if (*(_BYTE *)(v8 + 6))
  {
    sub_B370(*(const void **)(a1 + 32), 2LL, kFigEndpointNotification_StreamsChanged);
    *(_BYTE *)(*(void *)(a1 + 56) + 6LL) = 0;
  }

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_C5C8(uint64_t a1)
{
}

void sub_C5FC(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    CFRetain(*(CFTypeRef *)(a1 + 32));
    v7[0] = _NSConcreteStackBlock;
    v7[2] = sub_C6A4;
    v7[3] = &unk_19800;
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 32LL);
    v7[1] = 0x40000000LL;
    int8x16_t v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    uint64_t v9 = v4;
    uint64_t v10 = v3;
    int v12 = 0;
    uint64_t v11 = v5;
    dispatch_async(v6, v7);
  }

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_C6A4(uint64_t a1)
{
}

void sub_C6D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = *(void *)(v2 + 112);
  sub_B7EC(*(const void **)(a1 + 40));
  if (*(void *)(*(void *)(a1 + 32) + 32LL))
  {
    CFRetain(*(CFTypeRef *)(a1 + 40));
    block[0] = _NSConcreteStackBlock;
    block[2] = sub_C770;
    block[3] = &unk_19840;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 32LL);
    block[1] = 0x40000000LL;
    block[4] = v5;
    void block[5] = v4;
    void block[6] = v3;
    dispatch_async(v6, block);
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_C770(uint64_t a1)
{
  CFMutableDictionaryRef v5 = 0LL;
  uint64_t v2 = sub_BF74(*(const void **)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), &v5);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v2);
  CFMutableDictionaryRef v4 = v5;
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointNotification_Dissociated,  *(void *)(a1 + 32),  v5,  0LL);
  if (v4) {
    CFRelease(v4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_C7DC(uint64_t a1)
{
  CFMutableDictionaryRef v9 = 0LL;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(const void **)(a1 + 40);
  if (*(_BYTE *)(v3 + 3)) {
    CFMutableDictionaryRef v4 = (uint64_t *)&kFigEndpointNotification_CameraPreviewStreamChanged;
  }
  else {
    CFMutableDictionaryRef v4 = (uint64_t *)&kFigEndpointNotification_StreamsChanged;
  }
  uint64_t v5 = *v4;
  uint64_t v6 = sub_C0B8(v2, 1LL, 1u, *(void *)(a1 + 48), &v9);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v6);
  CFMutableDictionaryRef v8 = v9;
  CMNotificationCenterPostNotification(DefaultLocalCenter, v5, *(void *)(a1 + 40), v9, 0LL);
  if (v8) {
    CFRelease(v8);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_C870(uint64_t a1, int a2, OpaqueCMBlockBuffer *a3)
{
  uint64_t v5 = *(const void **)(a1 + 32);
  int destination = 0;
  if (!*(_BYTE *)CMBaseObjectGetDerivedStorage(v5))
  {
    if (a2 <= 1700885553)
    {
      if (a2 == 1651470958)
      {
        if (a3) {
          CMBlockBufferCopyDataBytes(a3, 0LL, 4uLL, &destination);
        }
        block[0] = 0LL;
        uint64_t v20 = 0LL;
        uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(v5);
        if (*(void *)(DerivedStorage + 88)) {
          sub_BA34((uint64_t)v5);
        }
        uint64_t BBufFromPointer = FigTransportCreateBBufFromPointer(kCFAllocatorDefault, v5, block);
        if (!(_DWORD)BBufFromPointer)
        {
          uint64_t v15 = *(void *)(DerivedStorage + 16);
          uint64_t RemoteRootObject = FigTransportGetRemoteRootObject(BBufFromPointer);
          if (!NeroTransportSendSyncMessageCreatingReply( v15,  RemoteRootObject,  1668771937LL,  block[0],  &v20)
            && CMBlockBufferGetDataLength(v20) == 8)
          {
            CMBlockBufferCopyDataBytes(v20, 0LL, 8uLL, (void *)(DerivedStorage + 88));
          }
        }

        if (block[0]) {
          CFRelease(block[0]);
        }
        goto LABEL_34;
      }

      if (a2 != 1684628836) {
        return;
      }
    }

    else
    {
      if (a2 == 1700885554)
      {
        uint64_t v12 = CMBaseObjectGetDerivedStorage(v5);
        sub_10E5C(*(void *)(v12 + 72), (uint64_t)a3);
        return;
      }

      if (a2 != 1752195376)
      {
        if (a2 != 1752195377) {
          return;
        }
        uint64_t v20 = 0LL;
        int value = 0LL;
        uint64_t v6 = CMBaseObjectGetDerivedStorage(v5);
        if (*(_BYTE *)v6) {
          goto LABEL_34;
        }
        uint64_t v7 = v6;
        if (!*(void *)(v6 + 88)
          || *(void *)(v6 + 72)
          || FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer(kCFAllocatorDefault, a3, 0LL, &v20))
        {
          goto LABEL_34;
        }

        CFMutableDictionaryRef v8 = *(const void **)(v7 + 56);
        CFMutableDictionaryRef v9 = CFDictionaryGetValue(v20, @"deviceUID");
        *(void *)(v7 + 56) = v9;
        if (v9) {
          CFRetain(v9);
        }
        if (v8) {
          CFRelease(v8);
        }
        if (sub_1082C( (uint64_t)kCFAllocatorDefault,  v20,  *(const void **)(v7 + 56),  *(void *)(v7 + 88),  *(const void **)(v7 + 16),  (CFTypeRef *)(v7 + 72))) {
          goto LABEL_34;
        }
        if (*(void *)(v7 + 32))
        {
          if (*(_BYTE *)(v7 + 4))
          {
            uint64_t v10 = *(const void **)(v7 + 104);
            CFRetain(v5);
            uint64_t v11 = *(dispatch_queue_s **)(v7 + 32);
            block[0] = _NSConcreteStackBlock;
            block[1] = (CFTypeRef)0x40000000;
            block[2] = sub_CBD8;
            block[3] = &unk_19920;
            block[4] = v5;
            void block[5] = v10;
            dispatch_async(v11, block);
LABEL_39:
            *(void *)(v7 + 8) |= 2uLL;
LABEL_34:
            if (v20) {
              CFRelease(v20);
            }
            return;
          }
        }

        else if (*(_BYTE *)(v7 + 4))
        {
          goto LABEL_39;
        }

        *(_BYTE *)(v7 + 6) = 1;
        goto LABEL_39;
      }
    }

    sub_BE44(v5);
  }

void sub_CB5C(uint64_t a1, int a2, uint64_t a3)
{
}

void sub_CB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_CB6C(uint64_t a1)
{
  CFMutableDictionaryRef v5 = 0LL;
  uint64_t v2 = sub_BF74(*(const void **)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), &v5);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v2);
  CFMutableDictionaryRef v4 = v5;
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointNotification_EndpointActivated,  *(void *)(a1 + 32),  v5,  0LL);
  if (v4) {
    CFRelease(v4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_CBD8(uint64_t a1)
{
  CFMutableDictionaryRef v5 = 0LL;
  uint64_t v2 = sub_C0B8(*(const void **)(a1 + 32), 2LL, 1u, *(void *)(a1 + 40), &v5);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v2);
  CFMutableDictionaryRef v4 = v5;
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointNotification_StreamsChanged,  *(void *)(a1 + 32),  v5,  0LL);
  if (v4) {
    CFRelease(v4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_CC4C(uint64_t a1)
{
  CFMutableDictionaryRef v5 = 0LL;
  uint64_t v2 = sub_C0B8(*(const void **)(a1 + 32), *(void *)(a1 + 40), 1u, *(void *)(a1 + 48), &v5);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v2);
  CFMutableDictionaryRef v4 = v5;
  CMNotificationCenterPostNotification(DefaultLocalCenter, *(void *)(a1 + 56), *(void *)(a1 + 32), v5, 0LL);
  if (v4) {
    CFRelease(v4);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t FigNeroEndpointManagerGetShared(void *a1)
{
  if (qword_1C100 == -1)
  {
    if (!a1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  dispatch_once(&qword_1C100, &stru_19980);
  if (a1) {
LABEL_3:
  }
    *a1 = qword_1C110;
LABEL_4:
  if (!dword_1C108) {
    return 0LL;
  }
  unsigned int v9 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v9,  &type);
  uint64_t v3 = v9;
  uint64_t v4 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 & 0xFFFFFFFE;
  }
  if ((_DWORD)v5)
  {
    int v10 = 136315394;
    uint64_t v11 = "FigNeroEndpointManagerGetShared";
    __int16 v12 = 1024;
    int v13 = dword_1C108;
    uint64_t v6 = (_BYTE *)_os_log_send_and_compose_impl( v5,  0LL,  v14,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v4,  "<<< neroendpointmanager >>> %s: Error creating endpoint manager: %d",  (const char *)&v10,  18);
    uint64_t v3 = v9;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v6, v6 != v14, v3, 0LL);
  return dword_1C108;
}

void sub_CE34(id a1)
{
  LODWORD(block[0]) = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  block,  type);
  uint64_t v2 = LODWORD(block[0]);
  uint64_t v3 = type[0];
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type[0])) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = v2 & 0xFFFFFFFE;
  }
  if ((_DWORD)v4)
  {
    LODWORD(v74) = 136315138;
    *(void *)((char *)&v74 + 4) = "FigNeroEndpointManagerGetShared_block_invoke";
    uint64_t v5 = (void *)_os_log_send_and_compose_impl( v4,  0LL,  v79,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v3,  "<<< neroendpointmanager >>> %s: Getting Nero Endpoint Manager",  (const char *)&v74);
    uint64_t v2 = LODWORD(block[0]);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v5, v5 != v79, v2, 0LL);
  if (FigIsAirplaydEnabled(v6))
  {
    uint64_t v7 = getprogname();
    if (!strcmp(v7, "audiomxd"))
    {
      LODWORD(block[0]) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      uint64_t v15 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, block, type);
      uint64_t v16 = LODWORD(block[0]);
      uint64_t v17 = type[0];
      if (os_log_type_enabled(v15, type[0])) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = v16 & 0xFFFFFFFE;
      }
      if ((_DWORD)v18)
      {
        LODWORD(v74) = 136315138;
        *(void *)((char *)&v74 + 4) = "FigNeroEndpointManagerGetShared_block_invoke";
        uint64_t v19 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  v79,  128LL,  &dword_0,  v15,  v17,  "<<< neroendpointmanager >>> %s: Remote Copy Fig Nero Endpoint Manager\n",  (const char *)&v74);
        uint64_t v16 = LODWORD(block[0]);
      }

      else
      {
        uint64_t v19 = 0LL;
      }

      fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v19, v19 != v79, v16, 0LL);
      int v52 = FigEndpointManagerRemoteCopyNeroManager(&qword_1C110);
      if (v52)
      {
        int v14 = v52;
        goto LABEL_66;
      }

LABEL_59:
      if ((_os_feature_enabled_impl("MediaExperience", "ExplicitInitializationForFigEndpointManagers") & 1) == 0)
      {
        int v14 = CMSessionMgrRegisterEndpointManager(qword_1C110);
        if (v14) {
          goto LABEL_66;
        }
      }

      uint64_t v58 = _os_feature_enabled_impl("CoreAudioServices", "audiomxd");
      if ((_DWORD)v58)
      {
        if (!FigIsAirplaydEnabled(v58))
        {
          goto LABEL_64;
        }

        if (FigServer_IsAirplayd()) {
LABEL_64:
        }
          FigTransportXPCConnectionServerStart();
      }

  if (theDict) {
    CFRelease(theDict);
  }
  if (v59) {
    CFRelease(v59);
  }
  if (cf1) {
    CFRelease(cf1);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v58) {
    CFRelease(v58);
  }
  if (v64) {
    CFRelease(v64);
  }
  return v56;
}

LABEL_65:
      int v14 = 0;
      goto LABEL_66;
    }
  }

  LODWORD(block[0]) = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  CFMutableDictionaryRef v8 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, block, type);
  uint64_t v9 = LODWORD(block[0]);
  uint64_t v10 = type[0];
  if (os_log_type_enabled(v8, type[0])) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v9 & 0xFFFFFFFE;
  }
  if ((_DWORD)v11)
  {
    LODWORD(v74) = 136315138;
    *(void *)((char *)&v74 + 4) = "FigNeroEndpointManagerGetShared_block_invoke";
    __int16 v12 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  v79,  128LL,  &dword_0,  v8,  v10,  "<<< neroendpointmanager >>> %s: Creating Fig Nero Endpoint Manager\n",  (const char *)&v74);
    uint64_t v9 = LODWORD(block[0]);
  }

  else
  {
    __int16 v12 = 0LL;
  }

  fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v12, v12 != v79, v9, 0LL);
  CFTypeRef cf = 0LL;
  if (!FigGetCFPreferenceNumberWithDefault(@"neroendpoint", @"com.apple.coremedia", 1LL))
  {
    int v14 = -12782;
    goto LABEL_66;
  }

  uint64_t ClassID = FigEndpointManagerGetClassID();
  int v14 = CMDerivedObjectCreate(kCFAllocatorDefault, &unk_199E0, ClassID, &cf);
  if (v14) {
    goto LABEL_17;
  }
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(cf);
  uint64_t v21 = dispatch_queue_create("NeroEndpointManager.queue", 0LL);
  DerivedStorage[1] = v21;
  if (v21)
  {
    dispatch_async(v21, &stru_19A18);
    dispatch_queue_t v22 = dispatch_queue_create("NeroEndpointManager.notification", 0LL);
    DerivedStorage[2] = v22;
    if (v22)
    {
      uint64_t SharedDiscovery = FigTransportDiscoveryGetSharedDiscovery();
      uint64_t v24 = DerivedStorage[1];
      *(void *)&__int128 v74 = _NSConcreteStackBlock;
      *((void *)&v74 + 1) = 0x40000000LL;
      v75 = sub_DBA4;
      v76 = &unk_19A38;
      CFTypeRef v77 = cf;
      uint64_t v78 = SharedDiscovery;
      DerivedStorage[4] = FigTransportDiscoveryAddEventHandler(SharedDiscovery, v24, &v74);
      if (FigGetCFPreferenceNumberWithDefault( @"neroendpoint_autopublish",  @"com.apple.coremedia",  0LL))
      {
        dispatch_time_t v25 = dispatch_time(0LL, 5000000000LL);
        uint64_t v26 = (dispatch_queue_s *)DerivedStorage[1];
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_DDA8;
        block[3] = &unk_19A58;
        block[4] = cf;
        dispatch_after(v25, v26, block);
      }

      CFTypeRef v27 = cf;
      v79[0] = 0LL;
      if (qword_1C148 != -1) {
        dispatch_once(&qword_1C148, &stru_19B80);
      }
      uint64_t Key = FigCFWeakReferenceTableAddValueAndGetKey(qword_1C140, v27, v79);
      DerivedStorage[10] = v79[0];
      dispatch_queue_t v29 = dispatch_queue_create("NeroEndpointManager.pluginregister", 0LL);
      DerivedStorage[3] = v29;
      if (v29)
      {
        CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
        uint64_t v69 = 0LL;
        CFStringAppendFormat( Mutable,  0LL,  @"/System/Library/Audio/Plug-Ins/HAL/%@",  @"OctaviaHalogen.driver");
        __int16 v31 = CFURLCreateWithFileSystemPath(0LL, Mutable, kCFURLPOSIXPathStyle, 1u);
        if (v31)
        {
          uint64_t v32 = v31;
          CFPlugInRef v33 = CFPlugInCreate(0LL, v31);
          if (v33)
          {
            unsigned int v34 = v33;
            int v35 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x44u,  0x3Au,  0xBAu,  0xB8u,  0xE7u,  0xB3u,  0x49u,  0x1Au,  0xB9u,  0x85u,  0xBEu,  0xB9u,  0x18u,  0x70u,  0x30u,  0xDBu);
            FactoriesForPlugInTypeInPlugIn = CFPlugInFindFactoriesForPlugInTypeInPlugIn(v35, v34);
            if (FactoriesForPlugInTypeInPlugIn)
            {
              __int16 v37 = FactoriesForPlugInTypeInPlugIn;
              if (CFArrayGetCount(FactoriesForPlugInTypeInPlugIn) <= 0)
              {
                *(_DWORD *)v68 = 0;
                os_log_type_t v67 = OS_LOG_TYPE_DEFAULT;
                __int128 v59 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  0LL,  v68,  &v67);
                uint64_t v60 = *(unsigned int *)v68;
                uint64_t v61 = v67;
                if (os_log_type_enabled(v59, v67)) {
                  uint64_t v62 = v60;
                }
                else {
                  uint64_t v62 = v60 & 0xFFFFFFFE;
                }
                if ((_DWORD)v62)
                {
                  *(_DWORD *)os_log_type_t type = 136315138;
                  v71 = "nmanager_createFigNeroHALDriver";
                  v63 = (void *)_os_log_send_and_compose_impl( v62,  0LL,  v79,  128LL,  &dword_0,  v59,  v61,  "<<< neroendpointmanager >>> %s: There are no factories for AudioServerPlugInType!\n",  (const char *)type);
                  uint64_t v60 = *(unsigned int *)v68;
                }

                else
                {
                  v63 = 0LL;
                }

                fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 0LL, 1LL, v63, v63 != v79, v60, 0LL);
              }

              else
              {
                ValueAtIndex = (const __CFUUID *)CFArrayGetValueAtIndex(v37, 0LL);
                if (ValueAtIndex)
                {
                  __int16 v39 = ValueAtIndex;
                  int v40 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x44u,  0x3Au,  0xBAu,  0xB8u,  0xE7u,  0xB3u,  0x49u,  0x1Au,  0xB9u,  0x85u,  0xBEu,  0xB9u,  0x18u,  0x70u,  0x30u,  0xDBu);
                  __int16 v41 = CFPlugInInstanceCreate(0LL, v39, v40);
                  if (v41)
                  {
                    uint64_t v42 = v41;
                    int v43 = *(void (**)(void *, void, void, uint64_t *))(*(void *)v41 + 8LL);
                    CMTime v44 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xEEu,  0xA5u,  0x77u,  0x3Du,  0xCCu,  0x43u,  0x49u,  0xF1u,  0x8Eu,  0,  0x8Fu,  0x96u,  0xE7u,  0xD2u,  0x3Bu,  0x17u);
                    CFUUIDBytes v45 = CFUUIDGetUUIDBytes(v44);
                    v43(v42, *(void *)&v45.byte0, *(void *)&v45.byte8, &v69);
                    (*(void (**)(void *))(*(void *)v42 + 24LL))(v42);
                  }
                }
              }

              CFRelease(v32);
            }

            else
            {
              __int16 v37 = v32;
            }

            CFRelease(v37);
          }

          else
          {
            unsigned int v34 = v32;
          }

          CFRelease(v34);
        }

        if (Mutable) {
          CFRelease(Mutable);
        }
        uint64_t v46 = v69;
        DerivedStorage[9] = v69;
        if (v46)
        {
          LODWORD(v69) = 0;
          v68[0] = OS_LOG_TYPE_DEFAULT;
          __int128 v47 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v69, v68);
          uint64_t v48 = v69;
          uint64_t v49 = v68[0];
          if (os_log_type_enabled(v47, v68[0])) {
            uint64_t v50 = v48;
          }
          else {
            uint64_t v50 = v48 & 0xFFFFFFFE;
          }
          if ((_DWORD)v50)
          {
            *(_DWORD *)os_log_type_t type = 136315394;
            v71 = "nmanager_create";
            __int16 v72 = 2048;
            CFTypeRef v73 = cf;
            LODWORD(byte15) = 22;
            __int128 v51 = (void *)_os_log_send_and_compose_impl( v50,  0LL,  v79,  128LL,  &dword_0,  v47,  v49,  "<<< neroendpointmanager >>> %s: [%p] Nero AudioHALDriver created successfully.\n",  (const char *)type,  byte15);
            uint64_t v48 = v69;
          }

          else
          {
            __int128 v51 = 0LL;
          }

          fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v51, v51 != v79, v48, 0LL);
          sub_DF84(cf, 0);
LABEL_56:
          CFTypeRef v53 = cf;
          uint64_t v54 = CMBaseObjectGetDerivedStorage(cf);
          if (!*(_BYTE *)(v54 + 40))
          {
            uint64_t v55 = v54;
            uint64_t v56 = FigTransportDiscoveryGetSharedDiscovery();
            __int128 v57 = *(dispatch_queue_s **)(v55 + 8);
            v79[0] = _NSConcreteStackBlock;
            v79[1] = 0x40000000LL;
            v79[2] = sub_F78C;
            v79[3] = &unk_19D60;
            v79[4] = v53;
            dispatch_async(v57, v79);
            FigTransportDiscoveryStart(v56);
            *(_BYTE *)(v55 + 40) = 1;
          }

          qword_1C110 = (uint64_t)cf;
          goto LABEL_59;
        }
      }
    }
  }

  int v14 = -16711;
LABEL_17:
  if (cf) {
    CFRelease(cf);
  }
LABEL_66:
  dword_1C108 = v14;
}

uint64_t FigNeroEndpointManagerForCameraPreviewGetShared(void *a1)
{
  if (qword_1C118 == -1)
  {
    if (!a1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  dispatch_once(&qword_1C118, &stru_199C0);
  if (a1) {
LABEL_3:
  }
    *a1 = qword_1C128;
LABEL_4:
  if (!dword_1C120) {
    return 0LL;
  }
  unsigned int v9 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v9,  &type);
  uint64_t v3 = v9;
  uint64_t v4 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 & 0xFFFFFFFE;
  }
  if ((_DWORD)v5)
  {
    int v10 = 136315394;
    uint64_t v11 = "FigNeroEndpointManagerForCameraPreviewGetShared";
    __int16 v12 = 1024;
    int v13 = dword_1C120;
    uint64_t v6 = (_BYTE *)_os_log_send_and_compose_impl( v5,  0LL,  v14,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v4,  "<<< neroendpointmanager >>> %s: Error creating endpoint manager: %d",  (const char *)&v10,  18);
    uint64_t v3 = v9;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v6, v6 != v14, v3, 0LL);
  return dword_1C120;
}

void sub_D8C4(id a1)
{
  if (qword_1C110)
  {
    unsigned int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v18,  &type);
    uint64_t v2 = v18;
    uint64_t v3 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v4 = v2;
    }
    else {
      uint64_t v4 = v2 & 0xFFFFFFFE;
    }
    if ((_DWORD)v4)
    {
      int v19 = 136315138;
      uint64_t v20 = "FigNeroEndpointManagerForCameraPreviewGetShared_block_invoke";
      uint64_t v5 = (CFTypeRef *)_os_log_send_and_compose_impl( v4,  0LL,  cf,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v3,  "<<< neroendpointmanager >>> %s: Using default NeroEndpointManager",  (const char *)&v19);
      uint64_t v2 = v18;
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v5, v5 != cf, v2, 0LL);
    int v11 = 0;
    qword_1C128 = qword_1C110;
  }

  else
  {
    unsigned int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v6 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v18, &type);
    uint64_t v7 = v18;
    uint64_t v8 = type;
    if (os_log_type_enabled(v6, type)) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v7 & 0xFFFFFFFE;
    }
    if ((_DWORD)v9)
    {
      int v19 = 136315138;
      uint64_t v20 = "FigNeroEndpointManagerForCameraPreviewGetShared_block_invoke";
      int v10 = (CFTypeRef *)_os_log_send_and_compose_impl( v9,  0LL,  cf,  128LL,  &dword_0,  v6,  v8,  "<<< neroendpointmanager >>> %s: Creating Nero Endpoint Manager for Camera Preview",  (const char *)&v19);
      uint64_t v7 = v18;
    }

    else
    {
      int v10 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v10, v10 != cf, v7, 0LL);
    cf[0] = 0LL;
    if (FigGetCFPreferenceNumberWithDefault(@"neroendpoint", @"com.apple.coremedia", 1LL))
    {
      uint64_t ClassID = FigEndpointManagerGetClassID();
      int v11 = CMDerivedObjectCreate(kCFAllocatorDefault, &unk_199E0, ClassID, cf);
      CFTypeRef v13 = cf[0];
      if (!v11)
      {
        uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf[0]);
        uint64_t v15 = dispatch_queue_create("NeroEndpointManager.queue", 0LL);
        *(void *)(DerivedStorage + 8) = v15;
        if (v15)
        {
          dispatch_async(v15, &stru_19DA0);
          dispatch_queue_t v16 = dispatch_queue_create("NeroEndpointManager.notification", 0LL);
          *(void *)(DerivedStorage + 16) = v16;
          CFTypeRef v13 = cf[0];
          if (v16)
          {
            int v11 = 0;
            qword_1C128 = (uint64_t)cf[0];
            goto LABEL_14;
          }

          int v11 = -16711;
        }

        else
        {
          int v11 = -16711;
          CFTypeRef v13 = cf[0];
        }
      }

      if (v13) {
        CFRelease(v13);
      }
    }

    else
    {
      int v11 = -12782;
    }
  }

void sub_DB9C(id a1)
{
}

void sub_DBA4(uint64_t a1, int a2, const __CFDictionary *a3)
{
  uint64_t v5 = *(const void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage(v5);
  if (!*DerivedStorage)
  {
    uint64_t v8 = DerivedStorage;
    switch(a2)
    {
      case 3:
        dispatch_time_t v14 = dispatch_time(0LL, 10000000000LL);
        uint64_t v15 = (dispatch_queue_s *)*((void *)v8 + 1);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_F2D4;
        block[3] = &unk_19CC0;
        block[4] = v6;
        dispatch_after(v14, v15, block);
        break;
      case 2:
        sub_ECFC(v5, 0);
        break;
      case 1:
        unsigned int v17 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v17,  &type);
        uint64_t v10 = v17;
        uint64_t v11 = type;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
          uint64_t v12 = v10;
        }
        else {
          uint64_t v12 = v10 & 0xFFFFFFFE;
        }
        if ((_DWORD)v12)
        {
          int v18 = 136315138;
          int v19 = "nmanager_discoveryHandler";
          CFTypeRef v13 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  block,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v11,  "<<< neroendpointmanager >>> %s: mediaserverd detected a Nero USB device",  (const char *)&v18);
          uint64_t v10 = v17;
        }

        else
        {
          CFTypeRef v13 = 0LL;
        }

        fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v13, v13 != block, v10, 0LL);
        if (!*((void *)v8 + 6)) {
          sub_DDC0(v5, 0, a3, 0LL, 0);
        }
        break;
    }
  }

void sub_DDA8(uint64_t a1)
{
}

void sub_DDC0(const void *a1, int a2, const __CFDictionary *a3, const void *a4, int a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v11 = DerivedStorage;
  if (!a2)
  {
    if (!a5)
    {
      sub_E624((uint64_t)a1);
      uint64_t v12 = 0LL;
      goto LABEL_11;
    }

    uint64_t v12 = 0LL;
LABEL_6:
    if (sub_A354((uint64_t)kCFAllocatorDefault, v12, a3, a4, (CFTypeRef *)(DerivedStorage + 56))
      || sub_AD64(*(void *)(v11 + 56), 1LL)
      || !*(void *)(v11 + 16))
    {
      goto LABEL_15;
    }

    CFRetain(a1);
    CFTypeRef v13 = *(dispatch_queue_s **)(v11 + 16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 0x40000000LL;
    v20[2] = sub_F2DC;
    v20[3] = &unk_19CE0;
    v20[4] = a1;
    dispatch_time_t v14 = v20;
    goto LABEL_14;
  }

  uint64_t v12 = *(const void **)(DerivedStorage + 64);
  *(void *)(DerivedStorage + 64) = 0LL;
  if (a5) {
    goto LABEL_6;
  }
LABEL_11:
  uint64_t v15 = sub_A354((uint64_t)kCFAllocatorDefault, v12, a3, a4, (CFTypeRef *)(v11 + 48));
  if ((_DWORD)v15) {
    goto LABEL_15;
  }
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v15);
  uint64_t v17 = CMNotificationCenterAddListener( DefaultLocalCenter,  a1,  sub_F11C,  kFigEndpointNotification_EndpointActivated,  *(void *)(v11 + 48),  0LL);
  uint64_t v18 = CMNotificationCenterGetDefaultLocalCenter(v17);
  CMNotificationCenterAddListener( v18,  a1,  sub_F11C,  kFigEndpointNotification_EndpointDeactivated,  *(void *)(v11 + 48),  0LL);
  if (!*(void *)(v11 + 16)) {
    goto LABEL_15;
  }
  CFRetain(a1);
  CFTypeRef v13 = *(dispatch_queue_s **)(v11 + 16);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 0x40000000LL;
  v19[2] = sub_F31C;
  v19[3] = &unk_19D00;
  v19[4] = a1;
  dispatch_time_t v14 = v19;
LABEL_14:
  dispatch_async(v13, v14);
LABEL_15:
  if (v12) {
    CFRelease(v12);
  }
}

void sub_DF84(const void *a1, unsigned int a2)
{
  if (a1)
  {
    CFRetain(a1);
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
    dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL * a2);
    uint64_t v6 = *(dispatch_queue_s **)(DerivedStorage + 24);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000LL;
    v7[2] = sub_F35C;
    v7[3] = &unk_19D40;
    void v7[4] = DerivedStorage;
    v7[5] = a1;
    dispatch_after(v5, v6, v7);
  }

uint64_t sub_E018(uint64_t a1)
{
  uint64_t SharedDiscovery = FigTransportDiscoveryGetSharedDiscovery();
  uint64_t DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage(a1);
  if (!*DerivedStorage)
  {
    uint64_t v4 = DerivedStorage;
    *uint64_t DerivedStorage = 1;
    if (SharedDiscovery)
    {
      uint64_t v5 = CMBaseObjectGetDerivedStorage(a1);
      if (*(_BYTE *)(v5 + 40))
      {
        uint64_t v6 = v5;
        uint64_t v7 = FigTransportDiscoveryGetSharedDiscovery();
        sub_E624(a1);
        FigTransportDiscoveryStop(v7);
        *(_BYTE *)(v6 + 40) = 0;
      }

      uint64_t v8 = (dispatch_queue_s *)v4[1];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 0x40000000LL;
      _OWORD v16[2] = sub_E614;
      v16[3] = &unk_19B00;
      v16[4] = SharedDiscovery;
      v16[5] = v4;
      dispatch_sync(v8, v16);
    }

    uint64_t v9 = v4[6];
    if (v9)
    {
      uint64_t v10 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v4[6]) + 16) + 32LL);
      if (v10) {
        v10(v9);
      }
      uint64_t v11 = (const void *)v4[6];
      if (v11)
      {
        CFRelease(v11);
        v4[6] = 0LL;
      }
    }

    uint64_t v12 = v4[7];
    if (v12)
    {
      CFTypeRef v13 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v4[7]) + 16) + 32LL);
      if (v13) {
        v13(v12);
      }
      dispatch_time_t v14 = (const void *)v4[7];
      if (v14)
      {
        CFRelease(v14);
        v4[7] = 0LL;
      }
    }
  }

  return 0LL;
}

void sub_E14C(uint64_t a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = (dispatch_object_s *)DerivedStorage[2];
  if (v3)
  {
    dispatch_release(v3);
    DerivedStorage[2] = 0LL;
  }

  sub_E018(a1);
  uint64_t v4 = (dispatch_object_s *)DerivedStorage[3];
  if (v4)
  {
    dispatch_release(v4);
    DerivedStorage[3] = 0LL;
  }

  uint64_t v5 = DerivedStorage[10];
  if (qword_1C148 != -1) {
    dispatch_once(&qword_1C148, &stru_19B80);
  }
  FigCFWeakReferenceTableRemoveValue(qword_1C140, v5);
  uint64_t v6 = DerivedStorage[9];
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 24LL))(v6);
    DerivedStorage[9] = 0LL;
  }

  uint64_t v7 = (dispatch_object_s *)DerivedStorage[1];
  if (v7)
  {
    dispatch_release(v7);
    DerivedStorage[1] = 0LL;
  }

__CFString *sub_E1FC(uint64_t a1)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<FigNeroEndpointManager %p>", a1);
  return Mutable;
}

uint64_t sub_E250(uint64_t a1, const void *a2, const __CFAllocator *a3, void *a4)
{
  uint64_t DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage(a1);
  if (*DerivedStorage) {
    return 4294950584LL;
  }
  uint64_t v8 = DerivedStorage;
  if (CFEqual(a2, kFigEndpointManagerProperty_AvailableEndpoints))
  {
    uint64_t v10 = *((void *)v8 + 6);
    uint64_t v9 = (const void **)(v8 + 48);
    if (v10)
    {
LABEL_4:
      uint64_t v11 = a3;
      uint64_t v12 = v9;
      CFIndex v13 = 1LL;
LABEL_8:
      SInt64 = CFArrayCreate(v11, v12, v13, &kCFTypeArrayCallBacks);
LABEL_9:
      uint64_t v16 = 0LL;
LABEL_10:
      *a4 = SInt64;
      return v16;
    }

LABEL_7:
    uint64_t v11 = a3;
    uint64_t v12 = 0LL;
    CFIndex v13 = 0LL;
    goto LABEL_8;
  }

  if (CFEqual(a2, kFigEndpointManagerProperty_AvailableCameraPreviewEndpoint))
  {
    uint64_t v14 = *((void *)v8 + 7);
    uint64_t v9 = (const void **)(v8 + 56);
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  if (CFEqual(a2, kFigEndpointManagerProperty_Name))
  {
    SInt64 = (void *)CFRetain(kFigEndpointManagerType_Nero);
    goto LABEL_9;
  }

  if (CFEqual(a2, kFigEndpointManagerProperty_SupportedFeatures))
  {
    uint64_t v19 = 0LL;
    uint64_t SupportedFeatures = FigEndpointManagerGetSupportedFeatures(kFigEndpointManagerType_Nero, 0LL, &v19);
  }

  else
  {
    uint64_t v19 = 0LL;
    uint64_t SupportedFeatures = FigEndpointManagerGetSupportedDiscoveryFeatures(kFigEndpointManagerType_Nero, &v19);
  }

  uint64_t v16 = SupportedFeatures;
  if (!(_DWORD)SupportedFeatures)
  {
    SInt64 = (void *)FigCFNumberCreateSInt64(kCFAllocatorDefault, v19);
    goto LABEL_10;
  }

  return v16;
}

uint64_t sub_E3D4(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (CFEqual(a2, @"ValeriaConnected"))
  {
    if (!a3 || (CFTypeID v7 = CFGetTypeID(a3), v7 != CFBooleanGetTypeID()))
    {
      unsigned int v19 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  0LL,  &v19,  &type);
      uint64_t v12 = v19;
      uint64_t v13 = type;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
        uint64_t v14 = v12;
      }
      else {
        uint64_t v14 = v12 & 0xFFFFFFFE;
      }
      if ((_DWORD)v14)
      {
        int v20 = 136315138;
        uint64_t v21 = "nmanager_SetProperty";
        uint64_t v15 = (_BYTE *)_os_log_send_and_compose_impl( v14,  0LL,  v22,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v13,  "<<< neroendpointmanager >>> %s: ValeriaConnected value not BOOLean",  (const char *)&v20);
        uint64_t v12 = v19;
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 0LL, 1LL, v15, v15 != v22, v12, 0LL);
      return 0LL;
    }

    uint64_t v8 = *(dispatch_queue_s **)(DerivedStorage + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_E884;
    block[3] = &unk_19BA0;
    block[4] = a3;
    void block[5] = a1;
    uint64_t v9 = block;
LABEL_5:
    dispatch_async(v8, v9);
    return 0LL;
  }

  if (CFEqual(a2, @"CustomEndpoint"))
  {
    if (qword_1C150 != -1) {
      dispatch_once(&qword_1C150, &stru_19BE0);
    }
    if ((byte_1C158 & 1) != 0) {
      return 0LL;
    }
    if (a3) {
      CFRetain(a3);
    }
    uint64_t v8 = *(dispatch_queue_s **)(DerivedStorage + 8);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    _OWORD v16[2] = sub_EAE4;
    v16[3] = &unk_19C00;
    v16[4] = a3;
    v16[5] = a1;
    uint64_t v9 = v16;
    goto LABEL_5;
  }

  return 4294954512LL;
}

uint64_t sub_E614(uint64_t a1)
{
  return FigTransportDiscoveryRemoveEventHandler(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 32LL));
}

void sub_E624(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (qword_1C138 != -1) {
    dispatch_once(&qword_1C138, &stru_19B40);
  }
  if ((byte_1C130 & 1) == 0 && *(void *)(DerivedStorage + 64))
  {
    uint64_t v2 = NeroTransportStopAcceptingConnections();
    uint64_t v3 = *(void *)(DerivedStorage + 64);
    uint64_t LocalRootObject = FigTransportGetLocalRootObject(v2);
    NeroTransportUnregisterObject(v3, LocalRootObject);
    NeroTransportInvalidate(*(void *)(DerivedStorage + 64));
    uint64_t v5 = *(const void **)(DerivedStorage + 64);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(DerivedStorage + 64) = 0LL;
    }
  }

void sub_E6B0(id a1)
{
  uint64_t v1 = MGCopyAnswer(@"InternalBuild", 0LL);
  if (v1)
  {
    uint64_t v2 = (const void *)v1;
    CFURLRef v3 = CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/AppleInternal/Applications/Stevenote.app/Stevenote",  kCFURLPOSIXPathStyle,  0);
    if (v3)
    {
      CFURLRef v4 = v3;
      CFRelease(v4);
    }

    CFRelease(v2);
  }

void sub_E734(id a1)
{
  int v1 = FigCFWeakReferenceTableCreate(kCFAllocatorDefault, 0LL, &qword_1C140);
  if (v1)
  {
    int v7 = v1;
    unsigned int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  0LL,  &v9,  &type);
    uint64_t v3 = v9;
    uint64_t v4 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 & 0xFFFFFFFE;
    }
    if ((_DWORD)v5)
    {
      int v10 = 136315394;
      uint64_t v11 = "nmanager_getWeakRefTable_block_invoke";
      __int16 v12 = 1024;
      int v13 = v7;
      uint64_t v6 = (_BYTE *)_os_log_send_and_compose_impl( v5,  0LL,  v14,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v4,  "<<< neroendpointmanager >>> %s: Can't create weak ref table, error: %d",  (const char *)&v10,  18);
      uint64_t v3 = v9;
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 0LL, 1LL, v6, v6 != v14, v3, 0LL);
    __break(1u);
  }

void sub_E884(uint64_t a1)
{
  uint64_t v2 = *(const __CFBoolean **)(a1 + 32);
  int v1 = *(const void **)(a1 + 40);
  if (v2 == kCFBooleanTrue) {
    sub_E8A4(v1);
  }
  else {
    sub_EA6C((uint64_t)v1);
  }
}

void sub_E8A4(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  unsigned int v11 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v11,  &type);
  uint64_t v4 = v11;
  uint64_t v5 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 & 0xFFFFFFFE;
  }
  if ((_DWORD)v6)
  {
    int v12 = 136315138;
    int v13 = "nmanager_valeriaConnected";
    int v7 = (_BYTE *)_os_log_send_and_compose_impl( v6,  0LL,  v14,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v5,  "<<< neroendpointmanager >>> %s: Valeria USB host detected",  (const char *)&v12);
    uint64_t v4 = v11;
  }

  else
  {
    int v7 = 0LL;
  }

  uint64_t v8 = (const __CFBoolean *)fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v7, v7 != v14, v4, 0LL);
  int v9 = 10;
  while (1)
  {
    uint64_t v8 = (const __CFBoolean *)lockdown_copy_trustedHostAttached(v8);
    if (v8 == kCFBooleanTrue) {
      break;
    }
    if (v8) {
      CFRelease(v8);
    }
    uint64_t v8 = (const __CFBoolean *)FigUSleep(200000LL);
    if (!--v9)
    {
      if (kCFBooleanTrue)
      {
        sub_EA6C((uint64_t)a1);
        return;
      }

      break;
    }
  }

  if (!*(void *)(DerivedStorage + 48))
  {
    if (FigIsAirplaydEnabled(v8))
    {
      sub_EE84(a1);
      NeroTransportSetAsConnected(*(void *)(DerivedStorage + 64));
    }

    sub_DDC0(a1, 1, 0LL, 0LL, 0);
  }

LABEL_20:
  if (kCFBooleanTrue) {
    CFRelease(kCFBooleanTrue);
  }
}

uint64_t sub_EA6C(uint64_t a1)
{
  uint64_t result = CMBaseObjectGetDerivedStorage(a1);
  if (result) {
    return sub_ECFC(a1, 0LL);
  }
  return result;
}

void sub_EAA4(id a1)
{
  if (!FigGetCFPreferenceNumberWithDefault( @"custom_nero_endpoints",  @"com.apple.coremedia",  1LL)) {
    byte_1C158 = 1;
  }
}

void sub_EAE4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    unsigned int v14 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v14,  &type);
    uint64_t v3 = v14;
    uint64_t v4 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 & 0xFFFFFFFE;
    }
    if ((_DWORD)v5)
    {
      int v15 = 136315138;
      uint64_t v16 = "nmanager_SetProperty_block_invoke_3";
      uint64_t v6 = (_BYTE *)_os_log_send_and_compose_impl( v5,  0LL,  v17,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v4,  "<<< neroendpointmanager >>> %s: publishing CustomEndpoint",  (const char *)&v15);
      uint64_t v3 = v14;
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v6, v6 != v17, v3, 0LL);
    sub_DDC0(*(const void **)(a1 + 40), 0, 0LL, *(const void **)(a1 + 32), 1);
  }

  else
  {
    unsigned int v14 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v7 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v14, &type);
    uint64_t v8 = v14;
    uint64_t v9 = type;
    if (os_log_type_enabled(v7, type)) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = v8 & 0xFFFFFFFE;
    }
    if ((_DWORD)v10)
    {
      int v15 = 136315138;
      uint64_t v16 = "nmanager_SetProperty_block_invoke";
      unsigned int v11 = (_BYTE *)_os_log_send_and_compose_impl( v10,  0LL,  v17,  128LL,  &dword_0,  v7,  v9,  "<<< neroendpointmanager >>> %s: unpublishing CustomEndpoint",  (const char *)&v15);
      uint64_t v8 = v14;
    }

    else
    {
      unsigned int v11 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v11, v11 != v17, v8, 0LL);
    sub_ECFC(*(const void **)(a1 + 40), 1);
  }

  int v12 = *(const void **)(a1 + 32);
  if (v12) {
    CFRelease(v12);
  }
}

void sub_ECFC(const void *a1, int a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v5 = DerivedStorage;
  if (a2)
  {
    uint64_t v6 = *(const void **)(DerivedStorage + 56);
    if (v6)
    {
      *(void *)(DerivedStorage + 56) = 0LL;
      int v7 = *(void (**)(const void *))(*(void *)(CMBaseObjectGetVTable(v6) + 16) + 32LL);
      if (v7) {
        v7(v6);
      }
      CFRelease(v6);
      if (*(void *)(v5 + 16))
      {
        CFRetain(a1);
        uint64_t v8 = *(dispatch_queue_s **)(v5 + 16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_F0DC;
        block[3] = &unk_19C60;
        block[4] = a1;
        dispatch_async(v8, block);
      }
    }
  }

  else
  {
    uint64_t v9 = *(const void **)(DerivedStorage + 48);
    if (v9)
    {
      *(void *)(DerivedStorage + 48) = 0LL;
      uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(DerivedStorage);
      uint64_t v11 = CMNotificationCenterRemoveListener( DefaultLocalCenter,  a1,  sub_F11C,  kFigEndpointNotification_EndpointActivated,  *(void *)(v5 + 48));
      uint64_t v12 = CMNotificationCenterGetDefaultLocalCenter(v11);
      CMNotificationCenterRemoveListener( v12,  a1,  sub_F11C,  kFigEndpointNotification_EndpointDeactivated,  *(void *)(v5 + 48));
      int v13 = *(void (**)(const void *))(*(void *)(CMBaseObjectGetVTable(v9) + 16) + 32LL);
      if (v13) {
        v13(v9);
      }
      CFRelease(v9);
      if (*(void *)(v5 + 16))
      {
        CFRetain(a1);
        unsigned int v14 = *(dispatch_queue_s **)(v5 + 16);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 0x40000000LL;
        v15[2] = sub_F1A4;
        v15[3] = &unk_19C80;
        v15[4] = a1;
        dispatch_async(v14, v15);
      }
    }

    sub_F204((uint64_t)a1);
  }

void sub_EE84(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v8 = 0LL;
  CFTypeRef v9 = 0LL;
  if (!*(void *)(DerivedStorage + 64))
  {
    uint64_t v2 = DerivedStorage;
    if (!FigTransportConnectionUSBCreate(kCFAllocatorDefault, &v9))
    {
      uint64_t CMBaseObject = NeroTransportConnectionGetCMBaseObject(v9);
      if (v4)
      {
        if (!v4( CMBaseObject,  kFigTransportConnectionUSBProperty_InterfaceName,  kFigTransportConnectionUSBInterfaceName_Valeria))
        {
          uint64_t v5 = NeroTransportCreate(kCFAllocatorDefault, v9, &v8);
          uint64_t v6 = v8;
          if ((_DWORD)v5 || (FigTransportGetLocalRootObject(v5), int v7 = NeroTransportRegisterObject(v6), v6 = v8, v7))
          {
            if (v6) {
              CFRelease(v6);
            }
          }

          else
          {
            *(void *)(v2 + 64) = v8;
            uint64_t v8 = 0LL;
          }
        }
      }
    }
  }

  if (v9) {
    CFRelease(v9);
  }
}

void sub_EFD0(uint64_t a1, int a2, const void *a3)
{
  uint64_t v5 = *(const void **)(a1 + 32);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(v5);
  if (!*(_BYTE *)DerivedStorage)
  {
    uint64_t v7 = DerivedStorage;
    if (a2 == 1684628836)
    {
      CFTypeRef v9 = *(const void **)(DerivedStorage + 48);
      if (v9) {
        sub_A610(v9, 1684628836, a3);
      }
      sub_EA6C((uint64_t)v5);
    }

    else
    {
      if (a2 == 1651470958) {
        sub_E8A4(v5);
      }
      uint64_t v8 = *(const void **)(v7 + 48);
      if (v8) {
        sub_A610(v8, a2, a3);
      }
    }
  }

void sub_F084(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(CMBaseObjectGetDerivedStorage(*(void *)(a1 + 32)) + 48);
  if (v7) {
    sub_AC28(v7, a2, a3, a4);
  }
}

void sub_F0DC(uint64_t a1)
{
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointManagerNotification_CameraPreviewEndpointChanged,  *(void *)(a1 + 32),  0LL,  0LL);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_F11C(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a2);
  if (*(void *)(DerivedStorage + 16))
  {
    uint64_t v5 = DerivedStorage;
    CFRetain(a2);
    uint64_t v6 = *(dispatch_queue_s **)(v5 + 16);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000LL;
    v7[2] = sub_F28C;
    v7[3] = &unk_19CA0;
    void v7[4] = a1;
    v7[5] = a2;
    dispatch_async(v6, v7);
  }

void sub_F1A4(uint64_t a1)
{
  uint64_t v2 = ((uint64_t (*)(void))CMNotificationCenterGetDefaultLocalCenter)();
  uint64_t v3 = CMNotificationCenterPostNotification( v2,  kFigEndpointManagerNotification_AvailableEndpointsChanged,  *(void *)(a1 + 32),  0LL,  0LL);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v3);
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointManagerNotification_ActivatedEndpointsChanged,  *(void *)(a1 + 32),  0LL,  0LL);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_F204(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!FigIsAirplaydEnabled(DerivedStorage) || !FigServer_IsAirplayd())
  {
    if (qword_1C138 != -1) {
      dispatch_once(&qword_1C138, &stru_19B40);
    }
    if ((byte_1C130 & 1) == 0 && !*(void *)(DerivedStorage + 64))
    {
      sub_EE84(a1);
      NeroTransportStartAcceptingConnections(*(void *)(DerivedStorage + 64));
    }
  }

void sub_F28C(uint64_t a1)
{
}

uint64_t sub_F2CC()
{
  return 0LL;
}

uint64_t sub_F2D4(uint64_t a1)
{
  return FigTransportDiscoveryStart(*(void *)(a1 + 32));
}

void sub_F2DC(uint64_t a1)
{
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(a1);
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointManagerNotification_CameraPreviewEndpointChanged,  *(void *)(a1 + 32),  0LL,  0LL);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_F31C(uint64_t a1)
{
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(a1);
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointManagerNotification_AvailableEndpointsChanged,  *(void *)(a1 + 32),  0LL,  0LL);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_F35C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(void *)(v2 + 80);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 0x40000000LL;
  v21[2] = sub_F5FC;
  v21[3] = &unk_19D20;
  v21[4] = v4;
  int v5 = AudioServerPlugInRegisterRemote(v3, v21);
  unsigned int v20 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v20,  &type);
  uint64_t v7 = v20;
  uint64_t v8 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v7 & 0xFFFFFFFE;
  }
  if ((_DWORD)v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    int v22 = 136315906;
    uint64_t v23 = "nmanager_asyncRegisterFigNeroHALDriver_block_invoke";
    __int16 v24 = 2048;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    CFTypeRef v27 = @"OctaviaHalogen.driver";
    __int16 v28 = 1024;
    int v29 = v5;
    uint64_t v11 = (_BYTE *)_os_log_send_and_compose_impl( v9,  0LL,  v30,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v8,  "<<< neroendpointmanager >>> %s: [%p] %@ remote registered err=%d\n",  &v22,  38);
    uint64_t v7 = v20;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v11, v11 != v30, v7, 0LL);
  if (v5)
  {
    unsigned int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v12 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v20, &type);
    uint64_t v13 = v20;
    uint64_t v14 = type;
    if (os_log_type_enabled(v12, type)) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = v13 & 0xFFFFFFFE;
    }
    if ((_DWORD)v15)
    {
      uint64_t v16 = *(void *)(a1 + 40);
      int v22 = 136315906;
      uint64_t v23 = "nmanager_asyncRegisterFigNeroHALDriver_block_invoke";
      __int16 v24 = 2048;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      CFTypeRef v27 = @"OctaviaHalogen.driver";
      __int16 v28 = 1024;
      int v29 = v5;
      LODWORD(v18) = 38;
      uint64_t v17 = (_BYTE *)_os_log_send_and_compose_impl( v15,  0LL,  v30,  128LL,  &dword_0,  v12,  v14,  "<<< neroendpointmanager >>> %s: [%p] Re-trying %@ remote registration due to err=%d\n",  &v22,  v18);
      uint64_t v13 = v20;
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v17, v17 != v30, v13, 0LL);
    sub_DF84(*(void *)(a1 + 40), 5LL);
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_F5FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (qword_1C148 != -1) {
    dispatch_once(&qword_1C148, &stru_19B80);
  }
  uint64_t v2 = FigCFWeakReferenceTableCopyValue(qword_1C140, v1);
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    unsigned int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v10,  &type);
    uint64_t v5 = v10;
    uint64_t v6 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 & 0xFFFFFFFE;
    }
    if ((_DWORD)v7)
    {
      int v11 = 136315650;
      uint64_t v12 = "nmanager_asyncRegisterFigNeroHALDriver_block_invoke_2";
      __int16 v13 = 2048;
      uint64_t v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = @"OctaviaHalogen.driver";
      uint64_t v8 = (_BYTE *)_os_log_send_and_compose_impl( v7,  0LL,  v17,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v6,  "<<< neroendpointmanager >>> %s: [%p] Audio server plugin interruption handler was called for %@\n",  &v11,  32);
      uint64_t v5 = v10;
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v8, v8 != v17, v5, 0LL);
    sub_DF84(v3, 5LL);
    CFRelease(v3);
  }

void sub_F78C(uint64_t a1)
{
}

void sub_F794(id a1)
{
}

uint64_t sub_F79C(uint64_t a1, CFDictionaryRef theDict, const void *a3, const void *a4, CFTypeRef *a5)
{
  CFTypeRef v51 = 0LL;
  if (a5)
  {
    Value = CFDictionaryGetValue(theDict, @"DisplaySize");
    if (!Value) {
      return 4294950536LL;
    }
    int v11 = Value;
    uint64_t v12 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"IsOverscanned");
    uint64_t ClassID = FigEndpointStreamGetClassID();
    uint64_t v14 = CMDerivedObjectCreate(a1, &unk_19DC0, ClassID, &v51);
    if (!(_DWORD)v14)
    {
      if (v12) {
        CFBooleanRef v15 = v12;
      }
      else {
        CFBooleanRef v15 = kCFBooleanFalse;
      }
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(v51);
      *(void *)(DerivedStorage + 8) = CFRetain(v11);
      *(void *)(DerivedStorage + 16) = CFRetain(v15);
      if (a3) {
        CFTypeRef v17 = CFRetain(a3);
      }
      else {
        CFTypeRef v17 = 0LL;
      }
      *(void *)(DerivedStorage + 56) = v17;
      *(void *)(DerivedStorage + 72) = a4;
      if (a4) {
        CFRetain(a4);
      }
      dispatch_queue_t v18 = dispatch_queue_create("NeroEndpointScreenStream.queue", 0LL);
      *(void *)(DerivedStorage + 32) = v18;
      if (v18)
      {
        dispatch_queue_t v19 = dispatch_queue_create("NeroEndpointScreenStream.notification", 0LL);
        *(void *)(DerivedStorage + 40) = v19;
        if (v19)
        {
          unsigned int v20 = CFDictionaryGetValue(theDict, @"Valeria");
          *(_BYTE *)(DerivedStorage + 48) = FigCFEqual(kCFBooleanTrue, v20);
          uint64_t v21 = CFDictionaryGetValue(theDict, @"CameraPreview");
          *(_BYTE *)(DerivedStorage + 80) = FigCFEqual(kCFBooleanTrue, v21);
          int v22 = CFDictionaryGetValue(theDict, @"H264DecoderSupports444");
          *(_BYTE *)(DerivedStorage + 49) = FigCFEqual(kCFBooleanTrue, v22);
          uint64_t v23 = CFDictionaryGetValue(theDict, @"HEVCDecoderSupports444");
          *(_BYTE *)(DerivedStorage + 50) = FigCFEqual(kCFBooleanTrue, v23);
          __int16 v24 = CFDictionaryGetValue(theDict, @"HEVCDecoderSupports44410");
          *(_BYTE *)(DerivedStorage + 51) = FigCFEqual(kCFBooleanTrue, v24);
          CFTypeRef v25 = v51;
          CGSize size = CGSizeZero;
          uint64_t v26 = CMBaseObjectGetDerivedStorage(v51);
          CFTypeRef cf = 0LL;
          uint64_t v55 = 0LL;
          unsigned int v53 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v53,  &type);
          uint64_t v28 = v53;
          uint64_t v29 = type;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
            uint64_t v30 = v28;
          }
          else {
            uint64_t v30 = v28 & 0xFFFFFFFE;
          }
          if ((_DWORD)v30)
          {
            int v57 = 136315394;
            uint64_t v58 = "nscreen_activateInternal";
            __int16 v59 = 2048;
            CFTypeRef v60 = v25;
            __int16 v31 = (_BYTE *)_os_log_send_and_compose_impl( v30,  0LL,  v61,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v29,  "<<< neroendpointscreenstream >>> %s: called [%p]",  (const char *)&v57,  22);
            uint64_t v28 = v53;
          }

          else
          {
            __int16 v31 = 0LL;
          }

          int v32 = 1;
          fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v31, v31 != v61, v28, 0LL);
          CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          if (!*(_BYTE *)(v26 + 80))
          {
            if (*(_BYTE *)(v26 + 48))
            {
              unsigned int v34 = (const void *)kFigVirtualDisplayUsage_Valeria;
            }

            else
            {
              if (!sub_3130()) {
                goto LABEL_29;
              }
              unsigned int v34 = (const void *)kFigVirtualDisplayUsage_Stevenote;
            }

            if (v34) {
              CFDictionarySetValue(Mutable, kFigVirtualDisplayOption_Usage, v34);
            }
          }

void sub_FF54(uint64_t a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = (dispatch_object_s *)DerivedStorage[5];
  if (v3)
  {
    dispatch_release(v3);
    DerivedStorage[5] = 0LL;
  }

  sub_10244(a1);
  uint64_t v4 = (const void *)DerivedStorage[3];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[3] = 0LL;
  }

  uint64_t v5 = (const void *)DerivedStorage[1];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[1] = 0LL;
  }

  uint64_t v6 = (const void *)DerivedStorage[2];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[2] = 0LL;
  }

  uint64_t v7 = (const void *)DerivedStorage[7];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[7] = 0LL;
  }

  uint64_t v8 = (const void *)DerivedStorage[8];
  if (v8)
  {
    CFRelease(v8);
    DerivedStorage[8] = 0LL;
  }

  uint64_t v9 = (const void *)DerivedStorage[9];
  if (v9)
  {
    CFRelease(v9);
    DerivedStorage[9] = 0LL;
  }

  unsigned int v10 = (dispatch_object_s *)DerivedStorage[4];
  if (v10)
  {
    dispatch_release(v10);
    DerivedStorage[4] = 0LL;
  }

__CFString *sub_10000(uint64_t a1)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<FigNeroEndpointScreenStream %p>", a1);
  return Mutable;
}

uint64_t sub_10054(uint64_t a1, const void *a2, uint64_t a3, __CFDictionary **a4)
{
  uint64_t DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage(a1);
  if (*DerivedStorage) {
    return 4294950534LL;
  }
  uint64_t v7 = DerivedStorage;
  if (CFEqual(a2, kFigEndpointStreamProperty_Type))
  {
    uint64_t v8 = (const CFBooleanRef *)&kFigEndpointStreamType_Screen;
LABEL_4:
    CFBooleanRef v9 = *v8;
LABEL_5:
    CFMutableStringRef Mutable = (__CFDictionary *)CFRetain(v9);
LABEL_6:
    uint64_t result = 0LL;
    *a4 = Mutable;
    return result;
  }

  uint64_t v12 = (const void *)kFigEndpointStreamProperty_DisplaySize;
  if (CFEqual(a2, kFigEndpointStreamProperty_DisplaySize))
  {
    CFBooleanRef v9 = (CFBooleanRef)*((void *)v7 + 1);
    if (v9) {
      goto LABEL_5;
    }
LABEL_15:
    CFMutableStringRef Mutable = 0LL;
    goto LABEL_6;
  }

  if (CFEqual(a2, kFigEndpointStreamProperty_DisplaySink))
  {
    CFBooleanRef v9 = (CFBooleanRef)*((void *)v7 + 8);
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

  if (CFEqual(a2, kFigEndpointStreamProperty_IsOverscanned))
  {
    CFBooleanRef v9 = (CFBooleanRef)*((void *)v7 + 2);
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

  __int16 v13 = (const void *)kFigEndpointStreamProperty_SupportsVideo;
  if (CFEqual(a2, kFigEndpointStreamProperty_SupportsVideo))
  {
    BOOL v14 = sub_3130();
    uint64_t v8 = &kCFBooleanFalse;
    if (!v14 && !v7[48]) {
      uint64_t v8 = &kCFBooleanTrue;
    }
    goto LABEL_4;
  }

  if (CFEqual(a2, kFigEndpointStreamProperty_NeroTransport))
  {
    CFBooleanRef v9 = (CFBooleanRef)*((void *)v7 + 9);
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }

  if (CFEqual(a2, kFigEndpointStreamProperty_NeroScreenStreamInfo))
  {
    CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    BOOL v15 = sub_3130();
    uint64_t v16 = (const void **)&kCFBooleanFalse;
    if (!v15 && !v7[48]) {
      uint64_t v16 = (const void **)&kCFBooleanTrue;
    }
    CFDictionarySetValue(Mutable, v13, *v16);
    CFDictionarySetValue(Mutable, v12, *((const void **)v7 + 1));
    goto LABEL_6;
  }

  return 4294954512LL;
}

uint64_t sub_1023C()
{
  return 4294954512LL;
}

void sub_10244(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  unsigned int v11 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v11,  &type);
  uint64_t v4 = v11;
  uint64_t v5 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 & 0xFFFFFFFE;
  }
  if ((_DWORD)v6)
  {
    int v12 = 136315394;
    __int16 v13 = "nscreen_deactivateInternal";
    __int16 v14 = 2048;
    uint64_t v15 = a1;
    uint64_t v7 = (_BYTE *)_os_log_send_and_compose_impl( v6,  0LL,  v16,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v5,  "<<< neroendpointscreenstream >>> %s: called [%p]",  (const char *)&v12,  22);
    uint64_t v4 = v11;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v7, v7 != v16, v4, 0LL);
  uint64_t v8 = *(void *)(DerivedStorage + 24);
  if (v8)
  {
    if (*(_BYTE *)(DerivedStorage + 48))
    {
      g87kjbhgf(0LL);
      uint64_t v8 = *(void *)(DerivedStorage + 24);
    }

    FigVirtualDisplaySessionDeactivate(v8);
    CFBooleanRef v9 = *(const void **)(DerivedStorage + 24);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(DerivedStorage + 24) = 0LL;
    }
  }

uint64_t sub_103AC(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFRetain(a1);
  uint64_t v8 = *(dispatch_queue_s **)(DerivedStorage + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000LL;
  v10[2] = sub_10528;
  v10[3] = &unk_19E88;
  void v10[4] = DerivedStorage;
  v10[5] = a3;
  v10[6] = a1;
  v10[7] = a4;
  dispatch_async(v8, v10);
  return 0LL;
}

uint64_t sub_10434(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFRetain(a1);
  uint64_t v8 = *(dispatch_queue_s **)(DerivedStorage + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000LL;
  v10[2] = sub_10644;
  v10[3] = &unk_19EC8;
  void v10[4] = DerivedStorage;
  v10[5] = a3;
  v10[6] = a1;
  v10[7] = a4;
  dispatch_async(v8, v10);
  return 0LL;
}

uint64_t sub_104BC(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = *(dispatch_queue_s **)(DerivedStorage + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000LL;
  v5[2] = sub_10758;
  v5[3] = &unk_19F08;
  v5[4] = DerivedStorage;
  v5[5] = a1;
  dispatch_sync(v3, v5);
  return 0LL;
}

void sub_10528(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)v2)
  {
    int v3 = -16762;
    goto LABEL_5;
  }

  if (*(_BYTE *)(v2 + 1)) {
    goto LABEL_4;
  }
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v5) + 16) + 24LL);
  if (v6)
  {
    int v3 = v6(v5);
    if (!v3)
    {
      uint64_t v2 = *(void *)(a1 + 32);
LABEL_4:
      int v3 = 0;
      *(_BYTE *)(v2 + 1) = 1;
    }
  }

  else
  {
    int v3 = -12782;
  }

LABEL_5:
  if (*(void *)(a1 + 40))
  {
    CFRetain(*(CFTypeRef *)(a1 + 48));
    uint64_t v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 40LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000LL;
    v7[2] = sub_10614;
    v7[3] = &unk_19E68;
    __int128 v8 = *(_OWORD *)(a1 + 40);
    int v10 = v3;
    uint64_t v9 = *(void *)(a1 + 56);
    dispatch_async(v4, v7);
  }

  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void sub_10614(uint64_t a1)
{
}

void sub_10644(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)v2)
  {
    int v3 = -16762;
    goto LABEL_9;
  }

  if (!*(_BYTE *)(v2 + 1))
  {
LABEL_7:
    int v3 = 0;
    *(_BYTE *)(v2 + 1) = 0;
    goto LABEL_9;
  }

  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v4) + 16) + 32LL);
  if (v5)
  {
    int v3 = v5(v4);
    if (v3) {
      goto LABEL_9;
    }
    uint64_t v2 = *(void *)(a1 + 32);
    goto LABEL_7;
  }

  int v3 = -12782;
LABEL_9:
  if (*(void *)(a1 + 40))
  {
    CFRetain(*(CFTypeRef *)(a1 + 48));
    uint64_t v6 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 40LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000LL;
    v7[2] = sub_10728;
    v7[3] = &unk_19EA8;
    __int128 v8 = *(_OWORD *)(a1 + 40);
    int v10 = v3;
    uint64_t v9 = *(void *)(a1 + 56);
    dispatch_async(v6, v7);
  }

  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void sub_10728(uint64_t a1)
{
}

void sub_10758(uint64_t a1)
{
  uint64_t v1 = *(_BYTE **)(a1 + 32);
  if (!*v1)
  {
    *uint64_t v1 = 1;
    sub_10244(*(void *)(a1 + 40));
    if (*(void *)(*(void *)(a1 + 32) + 40LL))
    {
      CFRetain(*(CFTypeRef *)(a1 + 40));
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 40LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_107EC;
      block[3] = &unk_19EE8;
      block[4] = v3;
      dispatch_async(v4, block);
    }
  }

void sub_107EC(uint64_t a1)
{
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(a1);
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointStreamNotification_Dissociated,  *(void *)(a1 + 32),  0LL,  0LL);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t sub_1082C(uint64_t a1, const void *a2, const void *a3, uint64_t a4, const void *a5, CFTypeRef *a6)
{
  CFTypeRef cf = 0LL;
  if (a2)
  {
    if (a3 && a6)
    {
      uint64_t ClassID = FigEndpointStreamGetClassID();
      uint64_t v13 = CMDerivedObjectCreate(a1, &unk_19F40, ClassID, &cf);
      if (!(_DWORD)v13)
      {
        uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
        dispatch_queue_t v15 = dispatch_queue_create("NeroEndpointAudioStream.notification", 0LL);
        *(void *)(DerivedStorage + 32) = v15;
        if (v15)
        {
          uint64_t v16 = FigDispatchQueueCreateWithPriority("NeroEndpointAudioStream.transport", 0LL, 32LL);
          *(void *)(DerivedStorage + 40) = v16;
          if (v16)
          {
            *(void *)(DerivedStorage + 104) = dispatch_queue_create("NeroEndpointAudioStream.silentAudioQueue", 0LL);
            *(void *)(DerivedStorage + 16) = CFRetain(a2);
            *(void *)(DerivedStorage + 24) = CFRetain(a3);
            *(void *)(DerivedStorage + 48) = a4;
            *(void *)(DerivedStorage + 96) = a5;
            if (a5) {
              CFRetain(a5);
            }
            Value = CFDictionaryGetValue((CFDictionaryRef)a2, @"deviceName");
            if (FigCFEqual(@"Valeria", Value))
            {
              *(_BYTE *)(DerivedStorage + 1) = 1;
              uint64_t v18 = CMBaseObjectGetDerivedStorage(cf);
              dispatch_queue_t v19 = *(dispatch_queue_s **)(v18 + 104);
              block[0] = _NSConcreteStackBlock;
              block[1] = 0x40000000LL;
              block[2] = sub_11C68;
              block[3] = &unk_1A138;
              block[4] = v18;
              dispatch_async(v19, block);
            }

            unsigned int v20 = (_BYTE *)CMBaseObjectGetDerivedStorage(cf);
            if (*v20)
            {
              uint64_t v13 = 4294950534LL;
            }

            else
            {
              uint64_t v13 = 0LL;
              if (!v20[2]) {
                v20[2] = 1;
              }
            }

            *a6 = cf;
            return v13;
          }
        }

        uint64_t v13 = 4294950535LL;
      }
    }

    else
    {
      uint64_t v13 = FigSignalErrorAt(4294950536LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }

    if (cf) {
      CFRelease(cf);
    }
    return v13;
  }

  return FigSignalErrorAt(4294950536LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sub_10A54(uint64_t a1, _DWORD *a2)
{
  uint64_t v16 = 0LL;
  CFTypeRef v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  int v19 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  uint64_t v15 = 0LL;
  double destination = 0.0;
  if (*(_BYTE *)DerivedStorage)
  {
    uint64_t v5 = v17;
    *((_DWORD *)v17 + 6) = -16762;
  }

  else
  {
    uint64_t v4 = *(dispatch_queue_s **)(DerivedStorage + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 0x40000000LL;
    v10[2] = sub_10B88;
    v10[3] = &unk_19F60;
    v10[5] = &v12;
    v10[6] = DerivedStorage;
    void v10[4] = &v16;
    dispatch_sync(v4, v10);
    uint64_t v5 = v17;
    if (!*((_DWORD *)v17 + 6))
    {
      OSStatus v6 = CMBlockBufferCopyDataBytes((CMBlockBufferRef)v13[3], 0LL, 8uLL, &destination);
      uint64_t v5 = v17;
      *((_DWORD *)v17 + 6) = v6;
      if (a2)
      {
        if (!v6) {
          *a2 = (destination + 0.5);
        }
      }
    }
  }

  uint64_t v7 = (const void *)v13[3];
  if (v7)
  {
    CFRelease(v7);
    uint64_t v5 = v17;
  }

  uint64_t v8 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v8;
}

uint64_t sub_10B88(void *a1)
{
  uint64_t result = NeroTransportSendSyncMessageCreatingReply( *(void *)(a1[6] + 96LL),  *(void *)(a1[6] + 48LL),  1936418167LL,  0LL,  *(void *)(a1[5] + 8LL) + 24LL);
  *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_10BD4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000LL;
  int v31 = 0;
  uint64_t DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage(a1);
  CMBlockBufferRef blockBufferOut = 0LL;
  uint64_t v23 = 0LL;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2000000000LL;
  uint64_t v26 = 0LL;
  CFDictionaryRef theDict = 0LL;
  if (*DerivedStorage)
  {
    *((_DWORD *)v29 + 6) = -16762;
  }

  else
  {
    uint64_t v8 = DerivedStorage;
    OSStatus v9 = CMBlockBufferCreateWithMemoryBlock( kCFAllocatorDefault,  a2,  0x28uLL,  kCFAllocatorNull,  0LL,  0LL,  0x28uLL,  0,  &blockBufferOut);
    *((_DWORD *)v29 + 6) = v9;
    if (!v9)
    {
      int v10 = (dispatch_queue_s *)*((void *)v8 + 5);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_10E10;
      block[3] = &unk_19F88;
      void block[6] = v8;
      void block[7] = blockBufferOut;
      block[4] = &v28;
      void block[5] = &v23;
      dispatch_sync(v10, block);
      if (!*((_DWORD *)v29 + 6))
      {
        int v11 = FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer(kCFAllocatorDefault, v24[3], 0LL, &theDict);
        *((_DWORD *)v29 + 6) = v11;
        if (!v11)
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Error");
          uint64_t v13 = v29 + 3;
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, v13);
            if (!*((_DWORD *)v29 + 6))
            {
              uint64_t v14 = CFDictionaryGetValue(theDict, @"DefaultAudioChannelLayout");
              uint64_t v15 = CFDictionaryGetValue(theDict, @"PreferredAudioChannelLayout");
              if (v14) {
                CFTypeRef v16 = CFRetain(v14);
              }
              else {
                CFTypeRef v16 = 0LL;
              }
              *a3 = v16;
              if (v15) {
                CFTypeRef v17 = CFRetain(v15);
              }
              else {
                CFTypeRef v17 = 0LL;
              }
              *a4 = v17;
            }
          }

          else
          {
            *uint64_t v13 = -16760;
          }
        }
      }
    }
  }

  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  uint64_t v18 = (const void *)v24[3];
  if (v18) {
    CFRelease(v18);
  }
  if (theDict) {
    CFRelease(theDict);
  }
  uint64_t v19 = *((unsigned int *)v29 + 6);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v28, 8);
  return v19;
}

uint64_t sub_10E10(void *a1)
{
  uint64_t result = NeroTransportSendSyncMessageCreatingReply( *(void *)(a1[6] + 96LL),  *(void *)(a1[6] + 48LL),  1634102644LL,  a1[7],  *(void *)(a1[5] + 8LL) + 24LL);
  *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_10E5C(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  size_t v21 = 0LL;
  double destination = 0LL;
  CMSampleBufferRef sbuf = 0LL;
  if (!*(void *)(DerivedStorage + 64))
  {
    LODWORD(v6) = 0;
    uint64_t v5 = 0LL;
    goto LABEL_12;
  }

  uint64_t v4 = FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer( kCFAllocatorDefault,  a2,  0LL,  DerivedStorage + 88,  0LL,  &sbuf);
  if ((_DWORD)v4) {
    goto LABEL_3;
  }
  uint64_t v7 = *(void *)(DerivedStorage + 64);
  uint64_t v8 = *(uint64_t (**)(uint64_t, void **, size_t *))(*(void *)(CMBaseObjectGetVTable(v7) + 16) + 40LL);
  if (!v8)
  {
    LODWORD(v6) = 0;
    goto LABEL_11;
  }

  uint64_t v4 = v8(v7, &destination, &v21);
  if ((_DWORD)v4)
  {
LABEL_3:
    uint64_t v5 = v4;
    LODWORD(v6) = 0;
    goto LABEL_12;
  }

  uint64_t v6 = *(unsigned int *)(DerivedStorage + 72);
  *(_DWORD *)(DerivedStorage + 72) += CMSampleBufferGetNumSamples(sbuf);
  DataBuffer = CMSampleBufferGetDataBuffer(sbuf);
  size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
  if (v21 < DataLength)
  {
    uint64_t v5 = 4294950536LL;
    goto LABEL_12;
  }

  size_t v11 = DataLength;
  uint64_t v12 = CMBlockBufferCopyDataBytes(DataBuffer, 0LL, DataLength, destination);
  if ((_DWORD)v12)
  {
    uint64_t v5 = v12;
    goto LABEL_12;
  }

  uint64_t v17 = *(void *)(DerivedStorage + 64);
  uint64_t v18 = destination;
  uint64_t v19 = *(uint64_t (**)(uint64_t, void *, size_t, uint64_t))(*(void *)(CMBaseObjectGetVTable(v17) + 16) + 48LL);
  if (!v19)
  {
LABEL_11:
    uint64_t v5 = 4294954514LL;
    goto LABEL_12;
  }

  uint64_t v5 = v19(v17, v18, v11, v6);
  if (!(_DWORD)v5)
  {
    double destination = 0LL;
    goto LABEL_15;
  }

LABEL_12:
  uint64_t v13 = destination;
  if (destination)
  {
    uint64_t v14 = *(void *)(DerivedStorage + 64);
    uint64_t v15 = *(void (**)(uint64_t, void *, void, void))(*(void *)(CMBaseObjectGetVTable(v14) + 16) + 48LL);
    if (v15) {
      v15(v14, v13, 0LL, v6);
    }
  }

void sub_11000(uint64_t a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = (dispatch_object_s *)DerivedStorage[4];
  if (v3)
  {
    dispatch_release(v3);
    DerivedStorage[4] = 0LL;
  }

  sub_11480(a1);
  uint64_t v4 = (const void *)DerivedStorage[7];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[7] = 0LL;
  }

  uint64_t v5 = (const void *)DerivedStorage[10];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[10] = 0LL;
  }

  uint64_t v6 = (const void *)DerivedStorage[11];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[11] = 0LL;
  }

  uint64_t v7 = (const void *)DerivedStorage[2];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[2] = 0LL;
  }

  uint64_t v8 = (const void *)DerivedStorage[3];
  if (v8)
  {
    CFRelease(v8);
    DerivedStorage[3] = 0LL;
  }

  OSStatus v9 = (dispatch_object_s *)DerivedStorage[5];
  if (v9)
  {
    dispatch_release(v9);
    DerivedStorage[5] = 0LL;
  }

  int v10 = (dispatch_object_s *)DerivedStorage[13];
  if (v10)
  {
    dispatch_release(v10);
    DerivedStorage[13] = 0LL;
  }

__CFString *sub_110AC(uint64_t a1)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<FigNeroEndpointAudioStream %p>", a1);
  return Mutable;
}

uint64_t sub_11100(uint64_t a1, const void *a2, const __CFAllocator *a3, CFDictionaryRef *a4)
{
  uint64_t DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage(a1);
  if (*DerivedStorage) {
    return 4294950534LL;
  }
  OSStatus v9 = DerivedStorage;
  if (CFEqual(a2, kFigEndpointStreamProperty_Type))
  {
    Value = (const void *)kFigEndpointStreamType_Audio;
LABEL_6:
    size_t v11 = (const __CFDictionary *)CFRetain(Value);
    uint64_t result = 0LL;
    *a4 = v11;
    return result;
  }

  if (CFEqual(a2, kFigEndpointStreamProperty_ID))
  {
    Value = (const void *)*((void *)v9 + 3);
    goto LABEL_6;
  }

  if (!CFEqual(a2, kFigEndpointStreamProperty_SupportedPCMFormats))
  {
    if (CFEqual(a2, @"edidAC3Support"))
    {
      Value = CFDictionaryGetValue(*((CFDictionaryRef *)v9 + 2), @"EDIDAC3Support");
      goto LABEL_6;
    }

    if (CFEqual(a2, kFigEndpointStreamProperty_OutputLatency))
    {
      sub_11518(a1, a3, a4);
    }

    else
    {
      if (!CFEqual(a2, @"screenLatency")) {
        return 4294954512LL;
      }
      sub_115C4(a1, a3, a4);
    }

    return 0LL;
  }

  uint64_t v13 = CMBaseObjectGetDerivedStorage(a1);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a3, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 4294950535LL;
  }
  uint64_t v15 = Mutable;
  CFTypeRef v16 = CFDictionaryGetValue(*(CFDictionaryRef *)(v13 + 16), @"formats");
  CFDictionarySetValue(v15, @"default", v16);
  uint64_t result = 0LL;
  *a4 = v15;
  return result;
}

uint64_t sub_112AC(uint64_t a1, const void *a2, const void *a3)
{
  if (*(_BYTE *)CMBaseObjectGetDerivedStorage(a1)) {
    return 4294950534LL;
  }
  if (!CFEqual(a2, kFigEndpointStreamProperty_AudioSource))
  {
    if (!a3 || (CFTypeID v12 = CFGetTypeID(a3), v12 == FigEndpointAudioSinkGetTypeID()))
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
      if (!*(_BYTE *)(DerivedStorage + 3))
      {
        uint64_t v14 = *(const void **)(DerivedStorage + 64);
        *(void *)(DerivedStorage + 64) = a3;
        if (a3) {
          CFRetain(a3);
        }
        if (v14) {
          CFRelease(v14);
        }
        return 0LL;
      }

      return FigSignalErrorAt(4294950524LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }

    return 4294950536LL;
  }

  if (a3)
  {
    CFTypeID v6 = CFGetTypeID(a3);
  }

  uint64_t v7 = CMBaseObjectGetDerivedStorage(a1);
  if (!*(_BYTE *)(v7 + 3))
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)(v7 + 56);
    if (v9)
    {
      sub_8C08(v9, 0LL, 0LL);
      CFRelease(*(CFTypeRef *)(v8 + 56));
    }

    *(void *)(v8 + 56) = a3;
    if (a3)
    {
      CFRetain(a3);
      uint64_t v10 = *(void *)(v8 + 56);
      size_t v11 = *(dispatch_object_s **)(v8 + 40);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 0x40000000LL;
      _OWORD v16[2] = sub_11670;
      v16[3] = &unk_1A058;
      v16[4] = a1;
      sub_8C08(v10, v11, v16);
    }

    return 0LL;
  }

  return FigSignalErrorAt(4294950524LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

void sub_11480(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v2 = *(dispatch_queue_s **)(DerivedStorage + 104);
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_114E0;
    block[3] = &unk_1A038;
    block[4] = DerivedStorage;
    dispatch_sync(v2, block);
  }

OpaqueAudioQueue *sub_114E0(uint64_t a1)
{
  uint64_t result = *(OpaqueAudioQueue **)(*(void *)(a1 + 32) + 8LL);
  if (result)
  {
    uint64_t result = (OpaqueAudioQueue *)AudioQueueDispose(result, 1u);
    *(void *)(*(void *)(a1 + 32) + 8LL) = 0LL;
  }

  return result;
}

CFDictionaryRef sub_11518(uint64_t a1, const __CFAllocator *a2, CFDictionaryRef *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CMTime v10 = kCMTimeZero;
  double valuePtr = 0.0;
  int64_t Value = (int64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 16), @"BufferAheadInterval");
  if (Value)
  {
    CFNumberGetValue((CFNumberRef)Value, kCFNumberDoubleType, &valuePtr);
    int64_t Value = (int)(valuePtr * 1000.0);
  }

  CMTimeMake(&v10, Value, 1000);
  CMTime v8 = v10;
  CFDictionaryRef result = CMTimeCopyAsDictionary(&v8, a2);
  *a3 = result;
  return result;
}

CFDictionaryRef sub_115C4(uint64_t a1, const __CFAllocator *a2, CFDictionaryRef *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CMTime v10 = kCMTimeZero;
  double valuePtr = 0.0;
  int64_t Value = (int64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 16), @"ScreenLatency");
  if (Value)
  {
    CFNumberGetValue((CFNumberRef)Value, kCFNumberDoubleType, &valuePtr);
    int64_t Value = (int)(valuePtr * 1000.0);
  }

  CMTimeMake(&v10, Value, 1000);
  CMTime v8 = v10;
  CFDictionaryRef result = CMTimeCopyAsDictionary(&v8, a2);
  *a3 = result;
  return result;
}

void sub_11670(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(*(void *)(a1 + 32));
  CFTypeRef cf = 0LL;
  if (!FigRemote_CreateSerializedAtomDataBlockBufferWithFlagsForSampleBuffer( kCFAllocatorDefault,  kCFAllocatorDefault,  a2,  0LL,  1LL,  &cf,  DerivedStorage + 80,  0LL)) {
    NeroTransportSendAsyncMessage(*(void *)(DerivedStorage + 96), *(void *)(DerivedStorage + 48), 1700885537LL, cf);
  }
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t sub_116F8(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFRetain(a1);
  CMTime v8 = *(dispatch_queue_s **)(DerivedStorage + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000LL;
  v10[2] = sub_118FC;
  v10[3] = &unk_1A098;
  void v10[4] = a1;
  v10[5] = a3;
  v10[6] = DerivedStorage;
  void v10[7] = a4;
  dispatch_async(v8, v10);
  return 0LL;
}

uint64_t sub_11780(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFRetain(a1);
  CMTime v8 = *(dispatch_queue_s **)(DerivedStorage + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000LL;
  v10[2] = sub_11A60;
  v10[3] = &unk_1A0D8;
  void v10[4] = a1;
  v10[5] = a3;
  v10[6] = DerivedStorage;
  void v10[7] = a4;
  dispatch_async(v8, v10);
  return 0LL;
}

uint64_t sub_11808(const void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!*(_BYTE *)DerivedStorage)
  {
    uint64_t v3 = (void *)DerivedStorage;
    *(_BYTE *)uint64_t DerivedStorage = 1;
    uint64_t v4 = *(dispatch_queue_s **)(DerivedStorage + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_11BEC;
    block[3] = &unk_1A0F8;
    block[4] = a1;
    dispatch_sync(v4, block);
    sub_11480((uint64_t)a1);
    uint64_t v5 = (const void *)v3[7];
    if (v5)
    {
      CFRelease(v5);
      v3[7] = 0LL;
    }

    v3[6] = 0LL;
    CFTypeID v6 = (const void *)v3[12];
    if (v6)
    {
      CFRelease(v6);
      v3[12] = 0LL;
    }

    if (v3[4])
    {
      CFRetain(a1);
      uint64_t v7 = (dispatch_queue_s *)v3[4];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000LL;
      v9[2] = sub_11C28;
      v9[3] = &unk_1A118;
      v9[4] = a1;
      dispatch_async(v7, v9);
    }
  }

  return 0LL;
}

void sub_118FC(int8x16_t *a1)
{
  int v2 = sub_11994(a1[2].i64[0]);
  if (a1[2].i64[1])
  {
    int v3 = v2;
    CFRetain((CFTypeRef)a1[2].i64[0]);
    v6[0] = _NSConcreteStackBlock;
    v6[2] = sub_11A30;
    v6[3] = &unk_1A078;
    uint64_t v4 = a1[3].i64[1];
    uint64_t v5 = *(dispatch_queue_s **)(a1[3].i64[0] + 32);
    v6[1] = 0x40000000LL;
    int8x16_t v7 = vextq_s8(a1[2], a1[2], 8uLL);
    int v9 = v3;
    uint64_t v8 = v4;
    dispatch_async(v5, v6);
  }

  CFRelease((CFTypeRef)a1[2].i64[0]);
}

uint64_t sub_11994(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CMBlockBufferRef theSourceBuffer = 0LL;
  unsigned int destination = 0;
  if (*(_BYTE *)(DerivedStorage + 3))
  {
    uint64_t v2 = DerivedStorage;
    uint64_t v3 = NeroTransportSendSyncMessageCreatingReply( *(void *)(DerivedStorage + 96),  *(void *)(DerivedStorage + 48),  1937010544LL,  0LL,  &theSourceBuffer);
    if (!(_DWORD)v3)
    {
      uint64_t v3 = CMBlockBufferCopyDataBytes(theSourceBuffer, 0LL, 4uLL, &destination);
      if (!(_DWORD)v3)
      {
        uint64_t v3 = destination;
        if (!destination) {
          *(_BYTE *)(v2 + 3) = 0;
        }
      }
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  if (theSourceBuffer) {
    CFRelease(theSourceBuffer);
  }
  return v3;
}

void sub_11A30(uint64_t a1)
{
}

void sub_11A60(uint64_t a1)
{
  uint64_t DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage(*(void *)(a1 + 32));
  uint64_t destination = 0LL;
  CMBlockBufferRef v13 = 0LL;
  CFTypeRef v11 = 0LL;
  if (*DerivedStorage)
  {
    OSStatus v4 = -16762;
  }

  else
  {
    uint64_t v3 = DerivedStorage;
    if (DerivedStorage[3])
    {
      OSStatus v4 = 0;
    }

    else
    {
      LODWORD(destination) = 1;
      OSStatus v4 = FigCreateBlockBufferCopyingMemoryBlock(kCFAllocatorDefault, &destination, 4LL, &v11);
      if (!v4)
      {
        OSStatus v4 = NeroTransportSendSyncMessageCreatingReply( *((void *)v3 + 12),  *((void *)v3 + 6),  1735336224LL,  v11,  &v13);
        if (!v4)
        {
          OSStatus v4 = CMBlockBufferCopyDataBytes(v13, 0LL, 4uLL, (char *)&destination + 4);
          if (!v4)
          {
            OSStatus v4 = HIDWORD(destination);
            if (!HIDWORD(destination)) {
              v3[3] = 1;
            }
          }
        }
      }
    }

    if (v11) {
      CFRelease(v11);
    }
  }

  if (v13) {
    CFRelease(v13);
  }
  if (*(void *)(a1 + 40))
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    block[0] = _NSConcreteStackBlock;
    block[2] = sub_11BBC;
    block[3] = &unk_1A0B8;
    uint64_t v5 = *(void *)(a1 + 56);
    CFTypeID v6 = *(dispatch_queue_s **)(*(void *)(a1 + 48) + 32LL);
    block[1] = 0x40000000LL;
    int8x16_t v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    OSStatus v10 = v4;
    uint64_t v9 = v5;
    dispatch_async(v6, block);
  }

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_11BBC(uint64_t a1)
{
}

uint64_t sub_11BEC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = CMBaseObjectGetDerivedStorage(v1);
  if (*(_BYTE *)(result + 2))
  {
    uint64_t v3 = result;
    uint64_t result = sub_11994(v1);
    *(_BYTE *)(v3 + 2) = 0;
  }

  return result;
}

void sub_11C28(uint64_t a1)
{
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(a1);
  CMNotificationCenterPostNotification( DefaultLocalCenter,  kFigEndpointStreamNotification_Dissociated,  *(void *)(a1 + 32),  0LL,  0LL);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t sub_11C68(uint64_t a1)
{
  inFormat.mSampleRate = 44100.0;
  *(_OWORD *)&inFormat.mFormatID = xmmword_161C0;
  *(_OWORD *)&inFormat.mBytesPerFrame = xmmword_161D0;
  uint64_t result = AudioQueueNewOutput( &inFormat,  (AudioQueueOutputCallback)nullsub_3,  0LL,  0LL,  0LL,  0,  (AudioQueueRef *)(*(void *)(a1 + 32) + 8LL));
  if (!(_DWORD)result) {
    return AudioQueueStart(*(AudioQueueRef *)(*(void *)(a1 + 32) + 8LL), 0LL);
  }
  return result;
}

uint64_t sub_11CEC( uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, const void *a5, uint64_t a6, CFTypeRef *a7)
{
  CFTypeRef v64 = 0LL;
  int v63 = 0;
  CFTypeRef cf1 = 0LL;
  CFTypeRef cf = 0LL;
  CFDictionaryRef v59 = 0LL;
  CFDictionaryRef theDict = 0LL;
  CFTypeRef v58 = 0LL;
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject(a4);
  uint64_t v14 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                                 + 8)
                                                                                     + 48LL);
  if (!v14) {
    goto LABEL_58;
  }
  uint64_t v15 = v14(CMBaseObject, kFigEndpointProperty_IsActivated, kCFAllocatorDefault, &cf);
  if ((_DWORD)v15)
  {
LABEL_73:
    uint64_t v56 = v15;
    goto LABEL_59;
  }

  if (cf != kCFBooleanTrue) {
    goto LABEL_72;
  }
  uint64_t v16 = FigEndpointStreamGetCMBaseObject(a5);
  uint64_t v17 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(*(void *)(CMBaseObjectGetVTable(v16)
                                                                                                 + 8)
                                                                                     + 48LL);
  if (!v17) {
    goto LABEL_58;
  }
  uint64_t v15 = v17(v16, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, &v58);
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  if (!FigCFEqual(v58, kFigEndpointStreamType_Audio))
  {
LABEL_72:
    uint64_t v15 = FigSignalErrorAt(4294950405LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_73;
  }

  uint64_t v18 = FigEndpointGetCMBaseObject(a4);
  if (!v19) {
    goto LABEL_58;
  }
  uint64_t v15 = v19(v18, @"subType", kCFAllocatorDefault, &cf1);
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  uint64_t ClassID = FigHALAudioDeviceGetClassID();
  uint64_t v15 = CMDerivedObjectCreate(a1, &unk_1A158, ClassID, &v64);
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  uint64_t v15 = FigHALAudioObjectMapperAddMapping(a2, v64, &v63);
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(v64);
  *(void *)(DerivedStorage + 8) = a3;
  *(void *)(DerivedStorage + 16) = a2;
  *(_DWORD *)uint64_t DerivedStorage = v63;
  if (a4) {
    CFTypeRef v22 = CFRetain(a4);
  }
  else {
    CFTypeRef v22 = 0LL;
  }
  *(void *)(DerivedStorage + 48) = v22;
  if (a5) {
    CFTypeRef v23 = CFRetain(a5);
  }
  else {
    CFTypeRef v23 = 0LL;
  }
  *(void *)(DerivedStorage + 56) = v23;
  *(_DWORD *)(DerivedStorage + 40) = 1751412073;
  if (CFEqual(cf1, @"Valeria"))
  {
    int v24 = 1986818665;
  }

  else
  {
    if (!CFEqual(cf1, @"Messalina")) {
      goto LABEL_22;
    }
    int v24 = 1970496032;
  }

  *(_DWORD *)(DerivedStorage + 40) = v24;
LABEL_22:
  if (qword_1C160 != -1) {
    dispatch_once(&qword_1C160, &stru_1A2E0);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(kCFAllocatorDefault, qword_1C168, 184LL, 0LL);
  if (Instance)
  {
    *(void *)(DerivedStorage + 64) = Instance;
  }

  else
  {
    uint64_t v56 = FigSignalErrorAt(4294950406LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v56) {
      goto LABEL_59;
    }
  }

  uint64_t v26 = FigDispatchQueueCreateWithPriority("FigHALNeroAudioDevice.timestamp", 0LL, 32LL);
  *(void *)(DerivedStorage + 72) = v26;
  if (!v26)
  {
    uint64_t v56 = 4294950406LL;
    goto LABEL_59;
  }

  uint64_t v27 = FigEndpointStreamGetCMBaseObject(a5);
  uint64_t v28 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(*(void *)(CMBaseObjectGetVTable(v27)
                                                                                             + 8)
                                                                                 + 48LL);
  if (!v28)
  {
LABEL_58:
    uint64_t v56 = 4294954514LL;
    goto LABEL_59;
  }

  uint64_t v15 = v28(v27, kFigEndpointStreamProperty_ID, kCFAllocatorDefault, DerivedStorage + 24);
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  if (!*(void *)(DerivedStorage + 24)) {
    goto LABEL_72;
  }
  uint64_t v29 = FigEndpointStreamGetCMBaseObject(a5);
  if (!v30) {
    goto LABEL_58;
  }
  uint64_t v31 = kFigEndpointStreamProperty_SupportedPCMFormats;
  uint64_t v15 = v30(v29, kFigEndpointStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, &theDict);
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  if (theDict)
  {
    int64_t Value = CFDictionaryGetValue(theDict, @"default");
    *(void *)(*(void *)(DerivedStorage + 64) + 80LL) = CFRetain(Value);
  }

  uint64_t v33 = FigEndpointStreamGetCMBaseObject(a5);
  if (!v34) {
    goto LABEL_58;
  }
  uint64_t v15 = v34(v33, v31, kCFAllocatorDefault, &v59);
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  if (!v59) {
    goto LABEL_72;
  }
  int v35 = CFDictionaryGetValue(v59, @"default");
  *(void *)(*(void *)(DerivedStorage + 64) + 72LL) = CFRetain(v35);
  CFTypeRef v36 = v64;
  uint64_t v37 = CMBaseObjectGetDerivedStorage(v64);
  CFBooleanRef v38 = *(void **)(v37 + 64);
  uint64_t v39 = (const void *)v38[11];
  if (v39)
  {
    CFRelease(v39);
    CFBooleanRef v38 = *(void **)(v37 + 64);
    v38[11] = 0LL;
  }

  int v40 = (const void *)v38[10];
  if (v40)
  {
    v38[11] = v40;
  }

  else
  {
    int v40 = (const void *)v38[9];
    v38[11] = v40;
    if (!v40) {
      goto LABEL_52;
    }
  }

  CFRetain(v40);
  uint64_t v41 = CMBaseObjectGetDerivedStorage(v36);
  uint64_t v42 = *(const __CFData **)(*(void *)(v41 + 64) + 88LL);
  if (v42)
  {
    uint64_t v43 = v41;
    MutableCopy = CFDataCreateMutableCopy(kCFAllocatorDefault, 0LL, v42);
    if (MutableCopy)
    {
      CFMutableDictionaryRef v45 = MutableCopy;
      unint64_t Length = CFDataGetLength(MutableCopy);
      if (Length <= 0x37)
      {
        FigSignalErrorAt(4294950405LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      }

      else
      {
        unint64_t v47 = Length / 0x38;
        uint64_t v48 = CFDataGetBytePtr(v45) + 12;
        do
        {
          if (*((_DWORD *)v48 - 1) == 1819304813) {
            *(_DWORD *)v48 &= ~0x40u;
          }
          v48 += 56;
          --v47;
        }

        while (v47);
        uint64_t v49 = *(void *)(v43 + 64);
        uint64_t v50 = *(const void **)(v49 + 88);
        *(void *)(v49 + 88) = v45;
        CFRetain(v45);
        if (v50) {
          CFRelease(v50);
        }
      }

      CFRelease(v45);
    }
  }

  else
  {
    FigSignalErrorAt(4294950405LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

LABEL_52:
  uint64_t v15 = sub_5304(a1, a2, v63, a5, a3, *(const void **)(DerivedStorage + 64), (CFTypeRef *)(DerivedStorage + 80));
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  uint64_t v51 = FigEndpointGetCMBaseObject(*(void *)(DerivedStorage + 48));
  int v52 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(*(void *)(CMBaseObjectGetVTable(v51)
                                                                                             + 8)
                                                                                 + 48LL);
  if (!v52) {
    goto LABEL_58;
  }
  uint64_t v15 = v52(v51, kFigEndpointProperty_Name, kCFAllocatorDefault, DerivedStorage + 32);
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  uint64_t v15 = sub_94E0(a1, a2, v63, a5, a3, *(const void **)(DerivedStorage + 64), (CFTypeRef *)(DerivedStorage + 88));
  if ((_DWORD)v15) {
    goto LABEL_73;
  }
  CFTypeRef v53 = v64;
  uint64_t v54 = CMBaseObjectGetDerivedStorage(v64);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v54);
  uint64_t v56 = FigNotificationCenterAddWeakListener( DefaultLocalCenter,  v53,  sub_1246C,  kFigEndpointStreamNotification_Dissociated,  *(void *)(v54 + 56),  0LL,  0LL);
  if (!(_DWORD)v56)
  {
    *a7 = v64;
    CFTypeRef v64 = 0LL;
  }

void sub_12338(uint64_t a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = CMBaseObjectGetDerivedStorage(a1);
  if (*(void *)(v3 + 56))
  {
    uint64_t v4 = v3;
    uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v3);
    FigNotificationCenterRemoveWeakListener( DefaultLocalCenter,  a1,  sub_1246C,  kFigEndpointStreamNotification_Dissociated,  *(void *)(v4 + 56));
  }

  CFTypeID v6 = (const void *)DerivedStorage[3];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[3] = 0LL;
  }

  int8x16_t v7 = (const void *)DerivedStorage[4];
  if (v7)
  {
    CFRelease(v7);
    DerivedStorage[4] = 0LL;
  }

  int8x16_t v8 = (const void *)DerivedStorage[6];
  if (v8)
  {
    CFRelease(v8);
    DerivedStorage[6] = 0LL;
  }

  uint64_t v9 = (const void *)DerivedStorage[7];
  if (v9)
  {
    CFRelease(v9);
    DerivedStorage[7] = 0LL;
  }

  OSStatus v10 = (const void *)DerivedStorage[11];
  if (v10)
  {
    CFRelease(v10);
    DerivedStorage[11] = 0LL;
  }

  CFTypeRef v11 = (const void *)DerivedStorage[10];
  if (v11)
  {
    CFRelease(v11);
    DerivedStorage[10] = 0LL;
  }

  CFTypeID v12 = (const void *)DerivedStorage[8];
  if (v12)
  {
    CFRelease(v12);
    DerivedStorage[8] = 0LL;
  }

  CMBlockBufferRef v13 = (dispatch_object_s *)DerivedStorage[9];
  if (v13)
  {
    dispatch_release(v13);
    DerivedStorage[9] = 0LL;
  }

CFStringRef sub_1241C(uint64_t a1)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"NeroAudioDevice ID %d UID %@ Endpoint %p EndpointStream %p",  *DerivedStorage,  *((void *)DerivedStorage + 3),  *((void *)DerivedStorage + 6),  *((void *)DerivedStorage + 7));
}

uint64_t sub_1246C(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a2);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(DerivedStorage);
  CMNotificationCenterPostNotification(DefaultLocalCenter, kFigHALAudioDeviceNotification_Unplugged, a2, 0LL, 0LL);
  *((_BYTE *)DerivedStorage + 100) = 1;
  uint64_t v5 = *((void *)DerivedStorage + 11);
  if (v5)
  {
    uint64_t v6 = *((void *)DerivedStorage + 2);
    if (v7) {
      uint64_t v8 = v7(v5);
    }
    else {
      uint64_t v8 = 0LL;
    }
    FigHALAudioObjectMapperRemoveMapping(v6, v8);
  }

  uint64_t v9 = *((void *)DerivedStorage + 10);
  if (v9)
  {
    uint64_t v10 = *((void *)DerivedStorage + 2);
    if (v11) {
      uint64_t v12 = v11(v9);
    }
    else {
      uint64_t v12 = 0LL;
    }
    FigHALAudioObjectMapperRemoveMapping(v10, v12);
  }

  return FigHALAudioObjectMapperRemoveMapping(*((void *)DerivedStorage + 2), *DerivedStorage);
}

uint64_t sub_12544(uint64_t a1)
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage(a1);
}

BOOL sub_1255C(uint64_t a1, int *a2)
{
  BOOL result = 0LL;
  int v3 = *a2;
  if (*a2 > 1819173228)
  {
    if (v3 <= 1935763059)
    {
      if (v3 > 1853059699)
      {
        if (v3 > 1870098019)
        {
          if (v3 == 1870098020) {
            return 1LL;
          }
          int v5 = 1919512167;
        }

        else
        {
          if (v3 == 1853059700) {
            return 1LL;
          }
          int v5 = 1869180523;
        }
      }

      else
      {
        if (v3 <= 1836411235)
        {
          if (v3 != 1819173229)
          {
            int v4 = 1819569763;
            goto LABEL_43;
          }

          return 1LL;
        }

        if (v3 == 1836411236) {
          return 1LL;
        }
        int v5 = 1853059619;
      }

LABEL_58:
      if (v3 != v5) {
        return result;
      }
      return 1LL;
    }

    if (v3 > 1937007733)
    {
      if (v3 > 1953653101)
      {
        if (v3 == 1969841184) {
          return 1LL;
        }
        int v5 = 1953653102;
      }

      else
      {
        if (v3 == 1937007734) {
          return 1LL;
        }
        int v5 = 1937009955;
      }

      goto LABEL_58;
    }

    if (v3 > 1936876643)
    {
      if (v3 != 1936876644)
      {
        int v4 = 1936879204;
LABEL_43:
        if (v3 != v4) {
          return result;
        }
      }
    }

    else if (v3 != 1935763060)
    {
      int v4 = 1936092276;
      goto LABEL_43;
    }

LABEL_44:
    int v8 = a2[1];
    return v8 == 1768845428 || v8 == 1869968496;
  }

  if (v3 > 1684236337)
  {
    if (v3 > 1735354733)
    {
      if (v3 > 1818850925)
      {
        if (v3 == 1818850926) {
          return 1LL;
        }
        int v5 = 1819107691;
      }

      else
      {
        if (v3 == 1735354734) {
          return 1LL;
        }
        int v5 = 1751737454;
      }

      goto LABEL_58;
    }

    if (v3 > 1698775858)
    {
      if (v3 == 1698775859) {
        return 1LL;
      }
      int v5 = 1718839674;
      goto LABEL_58;
    }

    if (v3 != 1684236338)
    {
      int v4 = 1684434036;
      goto LABEL_43;
    }

    goto LABEL_44;
  }

  if (v3 > 1668047218)
  {
    if (v3 > 1668575851)
    {
      if (v3 == 1668575852) {
        return 1LL;
      }
      int v5 = 1668641652;
    }

    else
    {
      if (v3 == 1668047219) {
        return 1LL;
      }
      int v5 = 1668049764;
    }

    goto LABEL_58;
  }

  if (v3 == 1634429294 || v3 == 1634759532 || v3 == 1650682995) {
    return 1LL;
  }
  return result;
}

BOOL sub_1282C(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1853059700;
}

CFDataRef sub_12844(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  BOOL result = 0LL;
  int v5 = *a2;
  if (*a2 > 1819569762)
  {
    if (v5 <= 1935763059)
    {
      if (v5 <= 1853059699)
      {
        int v16 = 1819569763;
        unsigned int v17 = 4;
        if (v5 == 1853059619) {
          int v22 = 32;
        }
        else {
          int v22 = 0;
        }
        if (v5 == 1836411236) {
          unsigned int v21 = 8;
        }
        else {
          unsigned int v21 = v22;
        }
LABEL_76:
        if (v5 == v16) {
          return (const __CFData *)v17;
        }
        else {
          return (const __CFData *)v21;
        }
      }

      if (v5 <= 1870098019)
      {
        int v16 = 1853059700;
        unsigned int v17 = 8;
        int v18 = 1869180523;
LABEL_47:
        BOOL v20 = v5 == v18;
        unsigned int v21 = 4;
        goto LABEL_74;
      }

      if (v5 != 1870098020)
      {
        int v19 = 1919512167;
LABEL_69:
        if (v5 == v19) {
          return (const __CFData *)&dword_4;
        }
        else {
          return 0LL;
        }
      }
    }

    else
    {
      if (v5 <= 1937007733)
      {
        if (v5 > 1936876643)
        {
          if (v5 == 1936876644)
          {
            BOOL result = *(const __CFData **)(*(void *)(DerivedStorage + 64) + 56LL);
            if (!result) {
              return result;
            }
          }

          else
          {
            if (v5 != 1936879204) {
              return result;
            }
            BOOL result = *(const __CFData **)(*(void *)(DerivedStorage + 64) + 64LL);
            if (!result) {
              return result;
            }
          }

          return (const __CFData *)CFDataGetLength(result);
        }

        int v16 = 1935763060;
        unsigned int v17 = 4;
        int v18 = 1936092276;
        goto LABEL_47;
      }

      if (v5 > 1953653101)
      {
        int v16 = 1953653102;
        unsigned int v17 = 4;
        int v23 = 1969841184;
LABEL_73:
        BOOL v20 = v5 == v23;
        unsigned int v21 = 8;
LABEL_74:
        if (!v20) {
          unsigned int v21 = 0;
        }
        goto LABEL_76;
      }

      if (v5 == 1937007734) {
        return (const __CFData *)&dword_4;
      }
      if (v5 != 1937009955) {
        return result;
      }
    }

    int v24 = a2[1];
    if (v24 != 1869968496)
    {
      if (v24 == 1768845428) {
        return (const __CFData *)(4 * (*(void *)(DerivedStorage + 80) != 0LL));
      }
      if (v24 != 1735159650) {
        return 0LL;
      }
      if (*(void *)(DerivedStorage + 80)) {
        return (const __CFData *)&dword_8;
      }
      return (const __CFData *)&dword_4;
    }

    return (const __CFData *)&dword_4;
  }

  if (v5 <= 1684434035)
  {
    if (v5 <= 1668047218)
    {
      if (v5 != 1634429294 && v5 != 1634759532 && v5 != 1650682995) {
        return result;
      }
      return (const __CFData *)&dword_4;
    }

    if (v5 <= 1668641651)
    {
      if (v5 != 1668047219)
      {
        int v19 = 1668049764;
        goto LABEL_69;
      }

      return (const __CFData *)&dword_4;
    }

    int v16 = 1668641652;
    unsigned int v17 = 24;
    int v23 = 1684236338;
    goto LABEL_73;
  }

  if (v5 == 1819173229) {
    int v6 = 8;
  }
  else {
    int v6 = 0;
  }
  if (v5 == 1819107691) {
    int v7 = 8;
  }
  else {
    int v7 = v6;
  }
  if (v5 == 1818850926) {
    int v8 = 4;
  }
  else {
    int v8 = 0;
  }
  if (v5 == 1751737454) {
    int v9 = 4;
  }
  else {
    int v9 = v8;
  }
  if (v5 <= 1819107690) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = v7;
  }
  if (v5 == 1735354734) {
    int v11 = 4;
  }
  else {
    int v11 = 0;
  }
  if (v5 == 1718839674) {
    int v12 = 4;
  }
  else {
    int v12 = v11;
  }
  if (v5 == 1698775859) {
    int v13 = 4;
  }
  else {
    int v13 = 0;
  }
  if (v5 == 1684434036) {
    int v14 = 4;
  }
  else {
    int v14 = v13;
  }
  if (v5 <= 1718839673) {
    unsigned int v15 = v14;
  }
  else {
    unsigned int v15 = v12;
  }
  if (v5 <= 1751737453) {
    return (const __CFData *)v15;
  }
  else {
    return (const __CFData *)v10;
  }
}

uint64_t sub_12BE4(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, int *a6, uint64_t a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v13 = DerivedStorage;
  int v14 = *a2;
  uint64_t v15 = 2003332927LL;
  if (*a2 > 1819173228)
  {
    if (v14 <= 1935763059)
    {
      if (v14 <= 1853059699)
      {
        if (v14 <= 1836411235)
        {
          if (v14 == 1819173229)
          {
            uint64_t v31 = *(const void **)(DerivedStorage + 32);
            if (!v31 || (CFTypeRef v32 = CFRetain(v31)) == 0LL) {
              CFTypeRef v32 = CFRetain(@"No Name Endpoint");
            }
            *a6 = 8;
            if (a5 < 8)
            {
              uint64_t v15 = 561211770LL;
            }

            else
            {
              uint64_t v15 = 0LL;
              *(void *)a7 = CFRetain(v32);
            }

            CFRelease(v32);
            return v15;
          }

          int v16 = 1819569763;
          goto LABEL_30;
        }

        if (v14 != 1836411236)
        {
          if (v14 != 1853059619) {
            return v15;
          }
          goto LABEL_109;
        }

LABEL_69:
        *a6 = 8;
        if (a5 < 8) {
          return 561211770LL;
        }
        int v23 = *(const __CFString **)(DerivedStorage + 24);
        if (!v23)
        {
LABEL_72:
          uint64_t v15 = 0LL;
          *(void *)a7 = v23;
          return v15;
        }

LABEL_71:
        int v23 = (const __CFString *)CFRetain(v23);
        goto LABEL_72;
      }

      if (v14 <= 1870098019)
      {
        if (v14 == 1853059700)
        {
          *a6 = 8;
          if (a5 >= 8)
          {
            uint64_t v15 = 0LL;
            *(void *)a7 = *(void *)(*(void *)(DerivedStorage + 64) + 16LL);
            return v15;
          }

          return 561211770LL;
        }

        if (v14 != 1869180523) {
          return v15;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t v15 = 0LL;
        unsigned int v18 = -1;
        goto LABEL_130;
      }

      if (v14 != 1870098020)
      {
        int v19 = 1919512167;
        goto LABEL_60;
      }

LABEL_73:
      int v24 = a2[1];
      if (v24 == 1869968496)
      {
        if (a5 < 4) {
          goto LABEL_143;
        }
        uint64_t v41 = *(void *)(DerivedStorage + 88);
      }

      else
      {
        unsigned int v25 = a5 >> 2;
        if (v24 != 1768845428)
        {
          if (v24 != 1735159650)
          {
LABEL_152:
            uint64_t v15 = 0LL;
LABEL_153:
            int v33 = 4 * v25;
            goto LABEL_154;
          }

          if (*(void *)(DerivedStorage + 80)) {
            unsigned int v26 = 2;
          }
          else {
            unsigned int v26 = 1;
          }
          if (v25 >= v26) {
            unsigned int v27 = v26;
          }
          else {
            unsigned int v27 = a5 >> 2;
          }
          if (v27)
          {
            uint64_t v28 = *(void *)(DerivedStorage + 88);
            uint64_t v29 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v28) + 16) + 8LL);
            if (v29) {
              int v30 = v29(v28);
            }
            else {
              int v30 = 0;
            }
            *(_DWORD *)a7 = v30;
            if (v27 >= 2)
            {
              uint64_t v44 = *(void *)(v13 + 80);
              if (v44)
              {
                if (v45) {
                  int v46 = v45(v44);
                }
                else {
                  int v46 = 0;
                }
                *(_DWORD *)(a7 + 4) = v46;
              }

              unsigned int v25 = 2;
              goto LABEL_152;
            }

            goto LABEL_151;
          }

LABEL_143:
          unsigned int v25 = 0;
          goto LABEL_152;
        }

        uint64_t v41 = *(void *)(DerivedStorage + 80);
        if (v25 >= (v41 != 0)) {
          unsigned int v25 = v41 != 0;
        }
        if (!v25) {
          goto LABEL_152;
        }
        if (!v41)
        {
LABEL_151:
          unsigned int v25 = 1;
          goto LABEL_152;
        }
      }

      uint64_t v42 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v41) + 16) + 8LL);
      if (v42) {
        int v43 = v42(v41);
      }
      else {
        int v43 = 0;
      }
      *(_DWORD *)a7 = v43;
      goto LABEL_151;
    }

    if (v14 <= 1937007733)
    {
      if (v14 <= 1936876643)
      {
        if (v14 == 1935763060) {
          goto LABEL_31;
        }
        int v17 = 1936092276;
LABEL_16:
        if (v14 != v17) {
          return v15;
        }
        goto LABEL_42;
      }

      if (v14 == 1936876644)
      {
        int v35 = *(const __CFData **)(*(void *)(DerivedStorage + 64) + 56LL);
        if (v35)
        {
          CFTypeRef v36 = *(const __CFData **)(*(void *)(v13 + 64) + 56LL);
          v49.length = CFDataGetLength(v36);
          v49.location = 0LL;
          CFDataGetBytes(v36, v49, (UInt8 *)a7);
          int v22 = *(const __CFData **)(*(void *)(v13 + 64) + 56LL);
          goto LABEL_108;
        }
      }

      else
      {
        if (v14 != 1936879204) {
          return v15;
        }
        BOOL v20 = *(const __CFData **)(*(void *)(DerivedStorage + 64) + 64LL);
        if (v20)
        {
          unsigned int v21 = *(const __CFData **)(*(void *)(v13 + 64) + 64LL);
          v48.length = CFDataGetLength(v21);
          v48.location = 0LL;
          CFDataGetBytes(v21, v48, (UInt8 *)a7);
          int v22 = *(const __CFData **)(*(void *)(v13 + 64) + 64LL);
LABEL_108:
          uint64_t v15 = 0LL;
          *a6 = CFDataGetLength(v22);
          return v15;
        }
      }

LABEL_109:
      uint64_t v15 = 0LL;
      *a6 = 0;
      return v15;
    }

    if (v14 <= 1953653101)
    {
      if (v14 != 1937007734)
      {
        if (v14 != 1937009955) {
          return v15;
        }
        goto LABEL_73;
      }

LABEL_42:
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t v15 = 0LL;
      unsigned int v18 = 1;
      goto LABEL_130;
    }

    if (v14 != 1953653102)
    {
      if (v14 != 1969841184) {
        return v15;
      }
      goto LABEL_69;
    }

    *a6 = 4;
    if (a5 < 4) {
      return 561211770LL;
    }
    uint64_t v15 = 0LL;
    unsigned int v18 = *(_DWORD *)(DerivedStorage + 40);
LABEL_130:
    *(_DWORD *)a7 = v18;
    return v15;
  }

  if (v14 <= 1684236337)
  {
    if (v14 <= 1668047218)
    {
      if (v14 == 1634429294)
      {
        *a6 = 4;
        if (a5 < 4) {
          return 0LL;
        }
        uint64_t v15 = 0LL;
        unsigned int v18 = *(_DWORD *)DerivedStorage;
        goto LABEL_130;
      }

      if (v14 != 1634759532)
      {
        if (v14 != 1650682995) {
          return v15;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t v15 = 0LL;
        unsigned int v18 = 1634689642;
        goto LABEL_130;
      }

      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      int v34 = sub_136E8(a1);
      goto LABEL_104;
    }

    if (v14 > 1668575851)
    {
      if (v14 != 1668575852)
      {
        if (v14 != 1668641652) {
          return v15;
        }
        *a6 = 24;
        if (a5 >= 0x18)
        {
          uint64_t v15 = 0LL;
          *(_OWORD *)a7 = *(_OWORD *)"lspawwar";
          *(void *)(a7 + 16) = 1918990199LL;
          return v15;
        }

        return 561211770LL;
      }

      uint64_t v15 = 0LL;
      unsigned int v25 = a5 >> 2;
      int v37 = a2[1];
      if (a5 >= 4) {
        unsigned int v38 = 0;
      }
      else {
        unsigned int v38 = a5 >> 2;
      }
      if (a5 >= 4) {
        unsigned int v39 = 0;
      }
      else {
        unsigned int v39 = a5 >> 2;
      }
      if (a5 >= 4) {
        unsigned int v40 = 0;
      }
      else {
        unsigned int v40 = a5 >> 2;
      }
      if (v37 == 1735159650) {
        unsigned int v25 = v40;
      }
      if (v37 == 1768845428) {
        unsigned int v25 = v39;
      }
      if (v37 == 1869968496) {
        unsigned int v25 = v38;
      }
      goto LABEL_153;
    }

    if (v14 == 1668047219)
    {
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t v15 = 0LL;
      unsigned int v18 = 1633969526;
      goto LABEL_130;
    }

    int v16 = 1668049764;
  }

  else
  {
    if (v14 <= 1735354733)
    {
      if (v14 <= 1698775858)
      {
        if (v14 == 1684236338)
        {
          if (a5 < 8) {
            return 561211770LL;
          }
          uint64_t v15 = 0LL;
          *(void *)a7 = 0x200000001LL;
          int v33 = 8;
LABEL_154:
          *a6 = v33;
          return v15;
        }

        int v17 = 1684434036;
        goto LABEL_16;
      }

      if (v14 != 1698775859)
      {
        int v19 = 1718839674;
LABEL_60:
        if (v14 != v19) {
          return v15;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t v15 = 0LL;
        unsigned int v18 = (*(double *)(*(void *)(DerivedStorage + 64) + 16LL) * 0.25);
        goto LABEL_130;
      }

      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      int v34 = sub_13660(a1);
LABEL_104:
      uint64_t v15 = 0LL;
      *(_DWORD *)a7 = v34;
      return v15;
    }

    if (v14 > 1818850925)
    {
      if (v14 != 1818850926)
      {
        if (v14 != 1819107691) {
          return v15;
        }
        *a6 = 8;
        if (a5 < 8) {
          return 561211770LL;
        }
        int v23 = @"Apple, Inc.";
        goto LABEL_71;
      }

      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t v15 = 0LL;
      unsigned int v18 = *(_BYTE *)(DerivedStorage + 100) == 0;
      goto LABEL_130;
    }

    if (v14 == 1735354734)
    {
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t v15 = 0LL;
      unsigned int v18 = *(_DWORD *)(DerivedStorage + 96) > 0;
      goto LABEL_130;
    }

    int v16 = 1751737454;
  }

LABEL_30:
  if (v14 == v16)
  {
LABEL_31:
    *a6 = 4;
    if (a5 >= 4)
    {
      uint64_t v15 = 0LL;
      *(_DWORD *)a7 = 0;
      return v15;
    }

    return 561211770LL;
  }

  return v15;
}

uint64_t sub_133E8(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, double *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFDataRef v34 = 0LL;
  uint64_t v35 = 0LL;
  if (*a2 == 1853059700)
  {
    unsigned int v10 = (unsigned int *)DerivedStorage;
    memset(__s2, 0, 40);
    uint64_t v11 = *(void *)(DerivedStorage + 64);
    __int128 v12 = *(_OWORD *)(v11 + 32);
    __int128 v30 = *(_OWORD *)(v11 + 16);
    __int128 v31 = v12;
    uint64_t v32 = *(void *)(v11 + 48);
    if (a5 == 8)
    {
      double v13 = *a6;
      if (*a6 == *(double *)&v30)
      {
LABEL_19:
        uint64_t v26 = 0LL;
        uint64_t v27 = 0LL;
      }

      else
      {
        uint64_t CMBaseObject = FigHALAudioStreamGetCMBaseObject(*(void *)(DerivedStorage + 88));
        if (v15)
        {
          uint64_t v16 = v15(CMBaseObject, kFigHALAudioStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, &v34);
          if ((_DWORD)v16)
          {
            uint64_t v27 = v16;
            uint64_t v26 = 0LL;
          }

          else
          {
            int v17 = v34;
            unint64_t Length = CFDataGetLength(v34);
            if (Length < 0x70)
            {
              uint64_t v26 = 0LL;
              uint64_t v27 = 4294950405LL;
            }

            else
            {
              unint64_t v19 = Length / 0x38;
              BytePtr = CFDataGetBytePtr(v17);
              unsigned int v21 = 0LL;
              do
              {
                if (*((double *)BytePtr + 5) <= v13 && *((double *)BytePtr + 6) >= v13)
                {
                  unsigned int v21 = BytePtr;
                  if (*((_DWORD *)BytePtr + 7) == HIDWORD(v31))
                  {
                    unsigned int v21 = BytePtr;
                    if (*((_DWORD *)BytePtr + 8) >= v32)
                    {
                      unsigned int v21 = BytePtr;
                      goto LABEL_14;
                    }
                  }
                }

                BytePtr += 56;
                --v19;
              }

              while (v19);
              if (!v21)
              {
                uint64_t v26 = 0LL;
                uint64_t v27 = 1970171760LL;
                goto LABEL_24;
              }

LABEL_24:
  FigHALAudioConfigChangeDisposeRecord(v26);
  if (v34) {
    CFRelease(v34);
  }
  return v27;
}

uint64_t sub_13660(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  unsigned int valuePtr = 0;
  CFNumberRef number = 0LL;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(*(void *)(DerivedStorage + 56));
  int v3 = *(unsigned int (**)(uint64_t, const __CFString *, const CFAllocatorRef, CFNumberRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject) + 8) + 48LL);
  if (!v3 || v3(CMBaseObject, @"edidAC3Support", kCFAllocatorDefault, &number)) {
    return 0LL;
  }
  CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  return valuePtr;
}

CMTimeValue sub_136E8(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CMTimeValue value = kCMTimeZero.value;
  CFDictionaryRef dictionaryRepresentation = 0LL;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(*(void *)(DerivedStorage + 56));
  int v4 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, CFDictionaryRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject) + 8) + 48LL);
  if (v4)
  {
    int v5 = v4(CMBaseObject, @"screenLatency", kCFAllocatorDefault, &dictionaryRepresentation);
    CFDictionaryRef v6 = dictionaryRepresentation;
    if (!v5)
    {
      CMTimeMakeFromDictionary(&v10, dictionaryRepresentation);
      __int128 v12 = *(_OWORD *)&v10.timescale;
      int32_t v7 = (int)*(double *)(*(void *)(DerivedStorage + 64) + 16LL);
      CMTime time = v10;
      CMTimeConvertScale(&v10, &time, v7, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      CMTimeValue value = v10.value;
      CFDictionaryRef v6 = dictionaryRepresentation;
    }

    if (v6) {
      CFRelease(v6);
    }
  }

  return value;
}

CFTypeRef sub_137BC(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage(a1) + 24);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_137E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFDictionaryRef v6 = (unsigned int *)DerivedStorage;
  uint64_t v13 = *(void *)(a3 + 4);
  int v14 = *(_DWORD *)(a3 + 12);
  if (a2 == 1868984941)
  {
    uint64_t v10 = *(void *)(DerivedStorage + 88);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(CMBaseObjectGetVTable(v10) + 24) + 16LL);
    if (v11) {
      uint64_t v12 = v11(v10, 1868984941LL, a3);
    }
    else {
      uint64_t v12 = 4294954514LL;
    }
    FigHALAudioPropertySendChanges(*((void *)v6 + 1), *v6, 1LL, &v13);
  }

  else
  {
    if (a2 != 1768321645) {
      return FigSignalErrorAt(1852797029LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
    uint64_t v7 = *(void *)(DerivedStorage + 80);
    if (v7)
    {
      int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(CMBaseObjectGetVTable(v7) + 24) + 16LL);
      if (v8) {
        return v8(v7, 1768321645LL, a3);
      }
      return 4294954514LL;
    }

    else
    {
      return 0LL;
    }
  }

  return v12;
}

uint64_t sub_13920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0LL;
}

uint64_t sub_1393C(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v2 = DerivedStorage;
  if (*(_BYTE *)(DerivedStorage + 100))
  {
    uint64_t v21 = FigSignalErrorAt(560227702LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if (!(_DWORD)v21) {
      return v21;
    }
    goto LABEL_22;
  }

  int v3 = *(_DWORD *)(DerivedStorage + 96);
  if (v3)
  {
LABEL_3:
    *(_DWORD *)(v2 + 96) = v3 + 1;
    unsigned int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v28,  &type);
    uint64_t v5 = v28;
    uint64_t v6 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 & 0xFFFFFFFE;
    }
    if ((_DWORD)v7)
    {
      int v8 = *(_DWORD *)(v2 + 96);
      int v29 = 136315394;
      __int128 v30 = "neroDevice_StartIO";
      __int16 v31 = 1024;
      int v32 = v8;
      int v9 = (_BYTE *)_os_log_send_and_compose_impl( v7,  0LL,  v33,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v6,  "<<< neroHALDevice >>> %s: called, startCount now %d",  (const char *)&v29,  18);
      uint64_t v5 = v28;
    }

    else
    {
      int v9 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v9, v9 != v33, v5, 0LL);
    return 0LL;
  }

  uint64_t v10 = *(void *)(DerivedStorage + 64);
  __int128 v11 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v10 + 96) = *(_OWORD *)(v10 + 16);
  *(_OWORD *)(v10 + 112) = v11;
  *(void *)(v10 + 128) = *(void *)(v10 + 48);
  uint64_t v12 = *(void *)(DerivedStorage + 64);
  int v13 = *(_DWORD *)(v12 + 120);
  double v14 = *(double *)(v12 + 96);
  *(_DWORD *)(v12 + 152) = v14;
  *(_DWORD *)(v12 + 156) = v13;
  *(_DWORD *)(v12 + 160) = v14;
  *(void *)(v12 + 172) = 0LL;
  if (*(_DWORD *)(v12 + 104) == 1819304813) {
    *(_DWORD *)(v12 + 108) |= 0x40u;
  }
  uint64_t v15 = *(void *)(DerivedStorage + 88);
  uint64_t v16 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v15) + 24) + 32LL);
  if (!v16) {
    goto LABEL_21;
  }
  uint64_t v17 = v16(v15);
  if ((_DWORD)v17) {
    goto LABEL_29;
  }
  uint64_t v18 = *(void *)(v2 + 80);
  if (v18)
  {
    unint64_t v19 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(*(void *)(v2 + 80)) + 24) + 32LL);
    if (v19)
    {
      uint64_t v17 = v19(v18);
      if (!(_DWORD)v17) {
        goto LABEL_15;
      }
LABEL_29:
      uint64_t v21 = v17;
      goto LABEL_22;
    }

LABEL_21:
    uint64_t v21 = 4294954514LL;
    goto LABEL_22;
  }

uint64_t sub_13BE8(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v2 = *(_DWORD *)(DerivedStorage + 96);
  if (v2 < 2)
  {
    if (v2 != 1)
    {
      uint64_t v9 = 0LL;
      goto LABEL_20;
    }
  }

  else
  {
    unsigned int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v23,  &type);
    uint64_t v4 = v23;
    uint64_t v5 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = v4 & 0xFFFFFFFE;
    }
    if ((_DWORD)v6)
    {
      int v7 = *(_DWORD *)(DerivedStorage + 96);
      int v24 = 136315394;
      uint64_t v25 = "neroDevice_StopIO";
      __int16 v26 = 1024;
      int v27 = v7;
      int v8 = (_BYTE *)_os_log_send_and_compose_impl( v6,  0LL,  v28,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v5,  "<<< neroHALDevice >>> %s: called, startCount is %d. Forcing to 1",  (const char *)&v24,  18);
      uint64_t v4 = v23;
    }

    else
    {
      int v8 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v8, v8 != v28, v4, 0LL);
  }

  *(_DWORD *)(DerivedStorage + 96) = 0;
  dispatch_sync(*(dispatch_queue_t *)(DerivedStorage + 72), &stru_1A280);
  unsigned int v10 = FigEndpointStreamSuspendSync(*(void *)(DerivedStorage + 56), 0LL, 3000LL);
  if (v10 == -16764) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = v10;
  }
  uint64_t v11 = *(void *)(DerivedStorage + 88);
  uint64_t v12 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v11) + 24) + 40LL);
  if (v12) {
    v12(v11);
  }
  uint64_t v13 = *(void *)(DerivedStorage + 80);
  if (v13)
  {
    if (v14) {
      v14(v13);
    }
  }

  *(_BYTE *)(*(void *)(DerivedStorage + 64) + 196LL) = 0;
LABEL_20:
  unsigned int v23 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  uint64_t v15 = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0LL, 1LL, &v23, &type);
  uint64_t v16 = v23;
  uint64_t v17 = type;
  if (os_log_type_enabled(v15, type)) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v16 & 0xFFFFFFFE;
  }
  if ((_DWORD)v18)
  {
    int v19 = *(_DWORD *)(DerivedStorage + 96);
    int v24 = 136315394;
    uint64_t v25 = "neroDevice_StopIO";
    __int16 v26 = 1024;
    int v27 = v19;
    uint64_t v20 = (_BYTE *)_os_log_send_and_compose_impl( v18,  0LL,  v28,  128LL,  &dword_0,  v15,  v17,  "<<< neroHALDevice >>> %s: called, startCount now %d",  (const char *)&v24,  18);
    uint64_t v16 = v23;
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v20, v20 != v28, v16, 0LL);
  return v9;
}

uint64_t sub_13E90(const void *a1, void *a2, void *a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v9 = *(void *)(DerivedStorage + 64);
  if (!*(_BYTE *)(v9 + 196)) {
    return 1937010544LL;
  }
  uint64_t v10 = DerivedStorage;
  int v11 = *(_DWORD *)(v9 + 152);
  int v12 = *(_DWORD *)(v9 + 160);
  unint64_t UpTime = FigGetUpTime();
  uint64_t v14 = *(void *)(v10 + 64);
  unint64_t v15 = *(void *)(v14 + 172);
  if (v15)
  {
    uint64_t v16 = *(void *)(v14 + 164);
  }

  else
  {
    uint64_t v16 = FigNanosecondsToHostTime(250000000LL);
    uint64_t v14 = *(void *)(v10 + 64);
    *(void *)(v14 + 164) = v16;
    *(void *)(v14 + 180) = UpTime;
    unint64_t v15 = v16 + UpTime;
    *(void *)(v14 + 172) = v16 + UpTime;
    *(void *)(v14 + 188) = 0LL;
  }

  if (UpTime <= v15 + 2 * v16)
  {
    if (UpTime >= v15)
    {
      *(void *)(v14 + 180) = v15;
      if (v11 != v12) {
        uint64_t v16 = (uint64_t)((double)v11 * (double)(unint64_t)v16 / (double)v12 + 0.5);
      }
      *(void *)(v14 + 172) = v16 + v15;
      *(double *)(v14 + 188) = *(double *)(v14 + 188) + (double)(v11 / 4);
      CFRetain(a1);
      __int16 v26 = *(dispatch_queue_s **)(v10 + 72);
      block = _NSConcreteStackBlock;
      uint64_t v30 = 0x40000000LL;
      __int16 v31 = sub_14294;
      int v32 = &unk_1A2A0;
      int v33 = a1;
      dispatch_async(v26, &block);
    }
  }

  else
  {
    unsigned int v35 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = (os_log_s *)fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type( 0LL,  1LL,  &v35,  &type);
    uint64_t v18 = v35;
    uint64_t v19 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v18 & 0xFFFFFFFE;
    }
    if ((_DWORD)v20)
    {
      uint64_t v21 = *(void *)(v10 + 64);
      uint64_t v22 = *(void *)(v21 + 180);
      uint64_t v23 = *(void *)(v21 + 172);
      uint64_t v24 = *(void *)(v21 + 164);
      int v36 = 136316418;
      int v37 = "neroDevice_GetZeroTimeStamp";
      __int16 v38 = 2048;
      unint64_t v39 = UpTime;
      __int16 v40 = 2048;
      uint64_t v41 = v22;
      __int16 v42 = 2048;
      uint64_t v43 = v23;
      __int16 v44 = 2048;
      unint64_t v45 = UpTime - v15;
      __int16 v46 = 2048;
      uint64_t v47 = v24;
      uint64_t v25 = (_BYTE *)_os_log_send_and_compose_impl( v20,  0LL,  v48,  128LL,  &dword_0,  os_log_and_send_and_compose_flags_and_os_log_type,  v19,  "<<< neroHALDevice >>> %s: nowTicks Discontinuity!!! nowTicks: %lld, currentHostTime %llu, nextHos tTime: %llu, nowTicksDelta: %llu, consumptionTicks: %llu",  (const char *)&v36,  62,  block,  v30,  v31,  v32);
      uint64_t v18 = v35;
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    fig_log_call_emit_and_clean_up_after_send_and_compose(0LL, 1LL, 1LL, v25, v25 != v48, v18, 0LL);
  }

  uint64_t result = 0LL;
  uint64_t v28 = *(void *)(v10 + 64);
  *a2 = *(void *)(v28 + 188);
  *a3 = *(void *)(v28 + 180);
  *a4 = 0LL;
  return result;
}

uint64_t sub_14144(uint64_t a1, int a2, _BYTE *a3, _BYTE *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!*(_BYTE *)(*(void *)(DerivedStorage + 64) + 196LL)) {
    return 1937010544LL;
  }
  if (a2 == 1919246692)
  {
    uint64_t v10 = *(void *)(DerivedStorage + 80);
    if (v10)
    {
      uint64_t v13 = 0LL;
      uint64_t v11 = *(void *)"tcasbolg";
      int v12 = 0;
      if (v8)
      {
        v8(v10, &v11, 0LL, 0LL, 4LL, &v13, (char *)&v13 + 4);
        LOBYTE(v8) = HIDWORD(v13) != 0;
      }
    }

    else
    {
      LOBYTE(v8) = 0;
    }
  }

  else
  {
    LOBYTE(v8) = a2 == 1919513701;
  }

  uint64_t result = 0LL;
  *a3 = (_BYTE)v8;
  *a4 = (_BYTE)v8;
  return result;
}

uint64_t sub_14230(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(CMBaseObjectGetDerivedStorage(a1) + 64) + 196LL)) {
    return 0LL;
  }
  else {
    return 1937010544LL;
  }
}

uint64_t sub_14260(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(CMBaseObjectGetDerivedStorage(a1) + 64) + 196LL)) {
    return 0LL;
  }
  else {
    return 1937010544LL;
  }
}

void sub_14294(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(DerivedStorage + 64);
  int v6 = *(_DWORD *)(v3 + 160);
  if (*(_BYTE *)(v3 + 196))
  {
    uint64_t v4 = DerivedStorage;
    sub_10A54(*(void *)(DerivedStorage + 56), &v6);
    if (v6)
    {
      uint64_t v5 = *(void *)(v4 + 64);
      if (v6 != *(_DWORD *)(v5 + 160)) {
        *(_DWORD *)(v5 + 160) = v6;
      }
    }
  }

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_14308(id a1)
{
  qword_1C168 = _CFRuntimeRegisterClass(&unk_1A300);
}

double sub_1432C(uint64_t a1)
{
  *(void *)(a1 + 192) = 0LL;
  double result = 0.0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void sub_14350(void *a1)
{
  int v2 = (const void *)a1[7];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[8];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)a1[11];
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = (const void *)a1[10];
  if (v5) {
    CFRelease(v5);
  }
  int v6 = (const void *)a1[9];
  if (v6) {
    CFRelease(v6);
  }
}

uint64_t _nlc_connect(_DWORD *a1)
{
  if (bootstrap_look_up(bootstrap_port, "com.apple.NetworkLinkConditioner", &sp))
  {
    puts("NLCd : Bootstrap failure");
    return 100LL;
  }

  else
  {
    mach_error_t v3 = nlc_connect(sp, a1, a1 + 1, &v5);
    if (v3) {
      mach_error("nlc_connect:", v3);
    }
    return v5;
  }

uint64_t _nlc_disconnect(mach_port_t *a1)
{
  mach_error_t v2 = nlc_disconnect(*a1, a1[1], &v4);
  if (v2) {
    mach_error("nlc_disconnect:", v2);
  }
  mach_port_deallocate(mach_task_self_, *a1);
  return v4;
}

uint64_t _nlc_start_simulation(uint64_t a1, __int128 *a2)
{
  *((_DWORD *)a2 + 1) = 0;
  __int128 v3 = a2[11];
  __int128 v28 = a2[10];
  __int128 v29 = v3;
  __int128 v30 = a2[12];
  __int128 v4 = a2[7];
  __int128 v24 = a2[6];
  __int128 v25 = v4;
  __int128 v5 = a2[9];
  __int128 v26 = a2[8];
  __int128 v27 = v5;
  __int128 v6 = a2[3];
  __int128 v20 = a2[2];
  __int128 v21 = v6;
  __int128 v7 = a2[5];
  __int128 v22 = a2[4];
  __int128 v23 = v7;
  __int128 v8 = a2[1];
  __int128 v18 = *a2;
  __int128 v19 = v8;
  mach_error_t v9 = nlc_simulate(*(_DWORD *)a1, (uint64_t)&v18, 0xD0u, *(_DWORD *)(a1 + 4), &v17);
  if (v9) {
    mach_error("_nlc_start_simulation:", v9);
  }
  __int128 v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  __int128 v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  __int128 v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  __int128 v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  __int128 v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  __int128 v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_stop_simulation(uint64_t a1, __int128 *a2)
{
  *((_DWORD *)a2 + 1) = 1;
  __int128 v3 = a2[11];
  __int128 v28 = a2[10];
  __int128 v29 = v3;
  __int128 v30 = a2[12];
  __int128 v4 = a2[7];
  __int128 v24 = a2[6];
  __int128 v25 = v4;
  __int128 v5 = a2[9];
  __int128 v26 = a2[8];
  __int128 v27 = v5;
  __int128 v6 = a2[3];
  __int128 v20 = a2[2];
  __int128 v21 = v6;
  __int128 v7 = a2[5];
  __int128 v22 = a2[4];
  __int128 v23 = v7;
  __int128 v8 = a2[1];
  __int128 v18 = *a2;
  __int128 v19 = v8;
  mach_error_t v9 = nlc_stop_simulation(*(_DWORD *)a1, (uint64_t)&v18, 0xD0u, *(_DWORD *)(a1 + 4), &v17);
  if (v9) {
    mach_error("_nlc_stop_simulation:", v9);
  }
  __int128 v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  __int128 v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  __int128 v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  __int128 v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  __int128 v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  __int128 v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_get_status(uint64_t a1, _DWORD *a2)
{
  a2[1] = 2;
  mach_msg_size_t __n = 208;
  __int128 v4 = *((_OWORD *)a2 + 11);
  v15[10] = *((_OWORD *)a2 + 10);
  v15[11] = v4;
  v15[12] = *((_OWORD *)a2 + 12);
  __int128 v5 = *((_OWORD *)a2 + 7);
  v15[6] = *((_OWORD *)a2 + 6);
  v15[7] = v5;
  __int128 v6 = *((_OWORD *)a2 + 9);
  v15[8] = *((_OWORD *)a2 + 8);
  v15[9] = v6;
  __int128 v7 = *((_OWORD *)a2 + 3);
  v15[2] = *((_OWORD *)a2 + 2);
  v15[3] = v7;
  __int128 v8 = *((_OWORD *)a2 + 5);
  v15[4] = *((_OWORD *)a2 + 4);
  void v15[5] = v8;
  __int128 v9 = *((_OWORD *)a2 + 1);
  v15[0] = *(_OWORD *)a2;
  v15[1] = v9;
  bzero(__src, 0x400uLL);
  mach_error_t status = nlc_get_status(*(_DWORD *)a1, (uint64_t)v15, 0xD0u, __src, &__n, *(_DWORD *)(a1 + 4), &__n_4);
  if (status) {
    mach_error("_nlc_get_status:", status);
  }
  memcpy(a2, __src, __n);
  return __n_4;
}

uint64_t nlc_connect(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_t reply_port = mig_get_reply_port();
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  v13.msgh_bits = 5395;
  *(void *)&v13.msgh_voucher_port = 0x9D4C00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v13);
    mach_port_t reply_port = v13.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&v13, 3, 0x18u, 0x40u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v13.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v9)
    {
      if (v13.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (v13.msgh_id == 40368)
      {
        if ((v13.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v14 == 1 && v13.msgh_size == 56 && !v13.msgh_remote_port && v17 << 16 == 1114112)
          {
            uint64_t v10 = 0LL;
            int v11 = v18;
            *a2 = v15;
            *a3 = v11;
            *a4 = v19;
            return v10;
          }
        }

        else if (v13.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (v16)
          {
            if (v13.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = v16;
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&v13);
      return v10;
    }

    mig_dealloc_reply_port(v13.msgh_local_port);
  }

  return v10;
}

uint64_t nlc_disconnect(mach_port_t a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  mach_port_t reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x9D4D00000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    mach_port_t reply_port = v10.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 40369)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = v13;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }

  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t nlc_simulate(mach_port_t a1, uint64_t a2, unsigned int a3, int a4, _DWORD *a5)
{
  NDR_record_t v17 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk(v19, a2, a3, 1028LL);
    unsigned int v18 = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(_DWORD *)((char *)&v16 + v10 + 36) = a4;
    mach_port_t reply_port = mig_get_reply_port();
    v16.msgh_remote_port = a1;
    v16.msgh_local_port = reply_port;
    v16.msgh_bits = 5395;
    *(void *)&v16.msgh_voucher_port = 0x9D4E00000000LL;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&v16);
      mach_port_t reply_port = v16.msgh_local_port;
    }

    uint64_t v13 = mach_msg(&v16, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(v16.msgh_local_port);
      return v5;
    }

    if ((_DWORD)v13)
    {
      mig_dealloc_reply_port(v16.msgh_local_port);
      return v5;
    }

    if (v16.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v16.msgh_id == 40370)
    {
      if ((v16.msgh_bits & 0x80000000) == 0)
      {
        if (v16.msgh_size == 40)
        {
          if (!v16.msgh_remote_port)
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = v19[0];
              return v5;
            }

            goto LABEL_25;
          }
        }

        else if (v16.msgh_size == 36)
        {
          if (v16.msgh_remote_port) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996LL;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }

      uint64_t v5 = 4294966996LL;
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

uint64_t nlc_stop_simulation(mach_port_t a1, uint64_t a2, unsigned int a3, int a4, _DWORD *a5)
{
  NDR_record_t v17 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk(v19, a2, a3, 1028LL);
    unsigned int v18 = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(_DWORD *)((char *)&v16 + v10 + 36) = a4;
    mach_port_t reply_port = mig_get_reply_port();
    v16.msgh_remote_port = a1;
    v16.msgh_local_port = reply_port;
    v16.msgh_bits = 5395;
    *(void *)&v16.msgh_voucher_port = 0x9D4F00000000LL;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&v16);
      mach_port_t reply_port = v16.msgh_local_port;
    }

    uint64_t v13 = mach_msg(&v16, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(v16.msgh_local_port);
      return v5;
    }

    if ((_DWORD)v13)
    {
      mig_dealloc_reply_port(v16.msgh_local_port);
      return v5;
    }

    if (v16.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v16.msgh_id == 40371)
    {
      if ((v16.msgh_bits & 0x80000000) == 0)
      {
        if (v16.msgh_size == 40)
        {
          if (!v16.msgh_remote_port)
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = v19[0];
              return v5;
            }

            goto LABEL_25;
          }
        }

        else if (v16.msgh_size == 36)
        {
          if (v16.msgh_remote_port) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996LL;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }

      uint64_t v5 = 4294966996LL;
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

uint64_t nlc_get_status( mach_port_t a1, uint64_t a2, unsigned int a3, void *a4, mach_msg_size_t *a5, int a6, _DWORD *a7)
{
  NDR_record_t v25 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk(&__n, a2, a3, 1040LL);
    unsigned int v26 = a3;
    uint64_t v14 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v15 = v14 + 40;
    *(_DWORD *)((char *)&msg + v14 + 36) = a6;
    mach_port_t reply_port = mig_get_reply_port();
    msg.msgh_remote_port = a1;
    msg.msgh_local_port = reply_port;
    msg.msgh_bits = 5395;
    *(void *)&msg.msgh_voucher_port = 0x9D5000000000LL;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&msg);
      mach_port_t reply_port = msg.msgh_local_port;
    }

    uint64_t v17 = mach_msg(&msg, 3, v15, 0x434u, reply_port, 0, 0);
    uint64_t v7 = v17;
    if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(msg.msgh_local_port);
      return v7;
    }

    if ((_DWORD)v17)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v7;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (msg.msgh_id == 40372)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size - 1069 <= 0xFFFFFBFE)
        {
          if (msg.msgh_remote_port) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = v26 == 0;
          }
          if (!v18 && msg.msgh_size == 36) {
            uint64_t v7 = v26;
          }
          else {
            uint64_t v7 = 4294966996LL;
          }
          goto LABEL_27;
        }

        if (!msg.msgh_remote_port)
        {
          uint64_t v7 = v26;
          if (v26) {
            goto LABEL_27;
          }
          mach_msg_size_t v21 = __n;
          if (__n <= 0x400)
          {
            uint64_t v7 = 4294966996LL;
            if (msg.msgh_size - 44 >= __n)
            {
              unsigned int v22 = (__n + 3) & 0xFFFFFFFC;
              if (msg.msgh_size == v22 + 44)
              {
                __int128 v23 = (char *)&msg + v22 - 1024;
                memcpy(a4, &__n_4, __n);
                uint64_t v7 = 0LL;
                *a5 = v21;
                *a7 = *((_DWORD *)v23 + 266);
                return v7;
              }
            }

            goto LABEL_27;
          }
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopDeviceMotionUpdates];
}