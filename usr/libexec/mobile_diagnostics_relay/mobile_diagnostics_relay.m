void sub_100003C78(uint64_t a1, __CFDictionary *a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  CFStringRef v10;
  CFStringRef v11;
  __CFDictionary *v12;
  __CFArray *v13;
  __CFArray *v14;
  __CFDictionary *v15;
  CFDictionaryRef v16;
  CFIndex Count;
  CFIndex v18;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v21;
  const void *Value;
  const void *v23;
  const void *v24;
  const void *v25;
  uint64_t v26;
  CFDictionaryRef theDict;
  CFMutableDictionaryRef properties;
  properties = 0LL;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    sub_1000040D0((uint64_t)"gather_gas_gauge_info", @"Could not create empty dictionary");
    return;
  }

  v4 = Mutable;
  CFDictionarySetValue(Mutable, @"Status", @"Failure");
  v5 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v6 = v5;
  if (v5)
  {
    CFDictionarySetValue(v5, @"built-in", kCFBooleanTrue);
    v7 = IOServiceMatching("IOPMPowerSource");
    v8 = v7;
    if (v7)
    {
      CFDictionarySetValue(v7, @"IOPropertyMatch", v6);
      MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v8);
      LODWORD(v8) = MatchingService;
      if (MatchingService)
      {
        if (!IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0))
        {
          theDict = properties;
          v13 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
          if (v13)
          {
            v14 = v13;
            CFArrayAppendValue(v13, @"CycleCount");
            CFArrayAppendValue(v14, @"DesignCapacity");
            CFArrayAppendValue(v14, @"MaxCapacity");
            v15 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            if (v15)
            {
              v16 = v15;
              CFDictionarySetValue(v15, @"MaxCapacity", @"FullChargeCapacity");
              Count = CFArrayGetCount(v14);
              if (Count >= 1)
              {
                v18 = Count;
                for (i = 0LL; i != v18; ++i)
                {
                  ValueAtIndex = CFArrayGetValueAtIndex(v14, i);
                  if (ValueAtIndex)
                  {
                    v21 = ValueAtIndex;
                    Value = CFDictionaryGetValue(theDict, ValueAtIndex);
                    if (Value)
                    {
                      v23 = Value;
                      v24 = CFDictionaryGetValue(v16, v21);
                      if (v24) {
                        v25 = v24;
                      }
                      else {
                        v25 = v21;
                      }
                      CFDictionarySetValue(v4, v25, v23);
                    }

                    else
                    {
                      sub_1000040D0((uint64_t)"filter_properties", @"Could not lookup value for %@", v21, v26);
                    }
                  }

                  else
                  {
                    sub_1000040D0((uint64_t)"filter_properties", @"Could not extract key %d of %d", i, v18);
                  }
                }
              }

              CFRelease(v16);
            }

            else
            {
              sub_1000040D0((uint64_t)"filter_properties", @"Could not create empty dictionary for key map");
            }

            CFRelease(v14);
          }

          else
          {
            sub_1000040D0((uint64_t)"filter_properties", @"Could not create empty array for desired keys");
          }

          CFDictionarySetValue(v4, @"Status", @"Success");
          v10 = @"GasGauge";
          v12 = a2;
          v11 = (const __CFString *)v4;
          goto LABEL_12;
        }

        sub_1000040D0((uint64_t)"gather_gas_gauge_info", @"Could not create properties\n");
        v10 = @"Status";
        v11 = @"CreatePropertiesFailed";
      }

      else
      {
        sub_1000040D0((uint64_t)"gather_gas_gauge_info", @"Could not find the %s service", "IOPMPowerSource");
        v10 = @"Status";
        v11 = @"ServiceLookupFailed";
      }
    }

    else
    {
      sub_1000040D0((uint64_t)"gather_gas_gauge_info", @"Could not create matching dictionary");
      v10 = @"Status";
      v11 = @"ServiceMatchingFailed";
    }

    v12 = v4;
LABEL_12:
    CFDictionarySetValue(v12, v10, v11);
    goto LABEL_13;
  }

  sub_1000040D0((uint64_t)"gather_gas_gauge_info", @"Could not create service matching properties");
  LODWORD(v8) = 0;
LABEL_13:
  if (properties) {
    CFRelease(properties);
  }
  if ((_DWORD)v8) {
    IOObjectRelease((io_object_t)v8);
  }
  if (v6) {
    CFRelease(v6);
  }
  CFRelease(v4);
}

void sub_100004030(uint64_t a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v4 = Mutable;
    sub_1000040D0( (uint64_t)"gather_nand_info",  @"Could not gather the NAND information as this function has been deprecated");
    CFDictionarySetValue(v4, @"Status", @"NANDInfoDeprecated");
    CFDictionarySetValue(a2, @"NAND", v4);
    CFRelease(v4);
  }

  else
  {
    sub_1000040D0((uint64_t)"gather_nand_info", @"Could not create dictionary to contain NAND information");
  }
}

void sub_1000040D0(uint64_t a1, CFStringRef format, ...)
{
  v3 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, format, va);
  if (v3)
  {
    v4 = v3;
    CFStringGetCString(v3, buffer, 1024LL, 0x8000100u);
    CFRelease(v4);
  }

  if (a1) {
    syslog(3, "%s: %s");
  }
  else {
    syslog(3, "%s");
  }
}

char *sub_10000419C(const __CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v4 = (char *)malloc(v3);
  CFStringGetCString(a1, v4, v3, 0x8000100u);
  return v4;
}

void sub_100004208(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t start()
{
  uint64_t v43 = 0LL;
  openlog("mobile_diagnostics_relay", 1, 24);
  if (secure_lockdown_checkin(&v43, 0LL, 0LL) || !v43)
  {
    sub_1000040D0((uint64_t)"main", @"Could not checkin with lockdown.");
    return 0LL;
  }

  v0 = @"Received request.";
  v1 = &kCFTypeDictionaryKeyCallBacks;
  while (1)
  {
    CFTypeRef cf = 0LL;
    int v2 = lockdown_receive_message(v43, &cf);
    CFIndex v3 = (const __CFDictionary *)cf;
    if (v2 || cf == 0LL) {
      break;
    }
    CFTypeID v5 = CFGetTypeID(cf);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFIndex v3 = (const __CFDictionary *)cf;
    if (v5 != TypeID) {
      break;
    }
    sub_1000040D0((uint64_t)"main", v0);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, v1, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v8 = Mutable;
      CFMutableDictionaryRef v9 = CFDictionaryCreateMutable(0LL, 0LL, v1, &kCFTypeDictionaryValueCallBacks);
      if (!v9)
      {
        sub_1000040D0((uint64_t)"main", @"Could not create empty diagnostics dictionary.");
        int v15 = 1;
        goto LABEL_38;
      }

      CFMutableDictionaryRef v10 = v9;
      CFDictionarySetValue(v8, @"Status", @"Success");
      Value = (const __CFString *)CFDictionaryGetValue(v3, @"Request");
      if (Value)
      {
        v12 = Value;
        v13 = sub_10000419C(Value);
        if (v13)
        {
          v14 = v13;
          sub_1000040D0((uint64_t)"main", @"Request Key received: %s", v13);
          free(v14);
        }

        if (CFEqual(v12, @"Goodbye"))
        {
          int v15 = 1;
LABEL_27:
          if (CFDictionaryGetCount(v10)) {
            CFDictionarySetValue(v8, @"Diagnostics", v10);
          }
          Data = CFPropertyListCreateData(kCFAllocatorDefault, v8, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
          if (Data)
          {
            v17 = Data;
            v40 = v10;
            v18 = v1;
            v19 = v0;
            unint64_t Length = CFDataGetLength(Data);
            BytePtr = CFDataGetBytePtr(v17);
            LODWORD(valuePtr) = bswap32(Length);
            if (lockdown_send(v43, &valuePtr, 4LL) != 4) {
              sub_1000040D0((uint64_t)"main", @"Could not send message size %d.", Length);
            }
            if (Length)
            {
              unint64_t v22 = 0LL;
              do
              {
                uint64_t v23 = lockdown_send(v43, BytePtr, Length - v22);
                v22 += v23;
                BytePtr += v23;
              }

              while (v22 < Length);
            }

            CFRelease(v17);
            v0 = v19;
            v1 = v18;
            CFMutableDictionaryRef v10 = v40;
          }

          else
          {
            sub_1000040D0((uint64_t)"main", @"Could not create CFData.");
            int v15 = 1;
          }

          CFRelease(v10);
          if (!v8) {
            goto LABEL_39;
          }
LABEL_38:
          CFRelease(v8);
          goto LABEL_39;
        }

        if (CFEqual(v12, @"All"))
        {
          sub_100003C78((uint64_t)v3, v10);
          sub_100004030((uint64_t)v3, v10);
          sub_100006268((uint64_t)v3, v10);
          goto LABEL_21;
        }

        if (CFEqual(v12, @"GasGauge"))
        {
          sub_100003C78((uint64_t)v3, v10);
          goto LABEL_26;
        }

        if (CFEqual(v12, @"WiFi"))
        {
          sub_100006268((uint64_t)v3, v10);
          goto LABEL_26;
        }

        if (!CFEqual(v12, @"HDMI"))
        {
          if (!CFEqual(v12, @"Shutdown") && !CFEqual(v12, @"Restart"))
          {
            if (CFEqual(v12, @"Sleep"))
            {
              LODWORD(valuePtr) = sub_100004C68();
              if ((_DWORD)valuePtr)
              {
                CFDictionarySetValue(v8, @"Status", @"Failure");
                CFNumberRef v36 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
                CFDictionarySetValue(v8, @"ErrorCode", v36);
                CFRelease(v36);
              }
            }

            else if (CFEqual(v12, @"MobileGestalt"))
            {
              sub_1000050EC(v3, v10);
            }

            else
            {
              if (!CFEqual(v12, @"NAND"))
              {
                if (CFEqual(v12, @"IORegistry"))
                {
                  sub_10000535C(v3, v10);
                  int v15 = 0;
                }

                else
                {
                  if (CFEqual(v12, @"Obliterate"))
                  {
                    LODWORD(valuePtr) = sub_100006308(v3);
                    if ((_DWORD)valuePtr)
                    {
                      CFDictionarySetValue(v8, @"Status", @"Failure");
                      CFNumberRef v37 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
                      CFDictionarySetValue(v8, @"ErrorCode", v37);
                      CFRelease(v37);
                    }
                  }

                  else
                  {
                    CFDictionarySetValue(v8, @"Status", @"UnknownRequest");
                  }

                  int v15 = 0;
                }

                goto LABEL_27;
              }

              sub_100004030((uint64_t)v3, v10);
            }

            goto LABEL_26;
          }

          int v39 = CFEqual(v12, @"Shutdown");
          syslog(7, "sending response early");
          int v24 = lockdown_send_message(v43, v8, 100LL);
          syslog(7, "lockdown_send_message returned %d", v24);
          CFRelease(v8);
          syslog(7, "waiting for goodbye request");
          int v25 = lockdown_receive_message(v43, &cf);
          syslog(7, "lockdown_receive_message returned %d", v25);
          if (!v25 && cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0LL;
          }

          syslog(7, "sending goodbye reply");
          v26 = CFDictionaryCreateMutable(0LL, 0LL, v1, &kCFTypeDictionaryValueCallBacks);
          if (v26)
          {
            v27 = v26;
            CFDictionarySetValue(v26, @"Status", @"Success");
            int v28 = lockdown_send_message(v43, v27, 100LL);
            syslog(7, "lockdown_send_message returned %d", v28);
            CFRelease(v27);
          }

          else
          {
            syslog(7, "cannot create goodbye reply dictionary");
          }

          if (CFDictionaryGetValue(v3, @"WaitForDisconnect"))
          {
            if (CFDictionaryGetValue(v3, @"DisplayPass"))
            {
              if (v39) {
                v29 = @"Please disconnect the USB cable in order to shutdown your device.\n\n请拔出USB线以关机";
              }
              else {
                v29 = @"Please disconnect the USB cable in order to restart your device.\n\n请拔出USB线以重新启动";
              }
              if (v39) {
                v30 = @"Shutdown/关机";
              }
              else {
                v30 = @"Restart/重新启动";
              }
              v31 = @"*** OK / 通过 ***";
              goto LABEL_69;
            }

            v32 = CFDictionaryGetValue(v3, @"DisplayFail");
            if (v39) {
              v29 = @"Please disconnect the USB cable in order to shutdown your device.\n\n请拔出USB线以关机";
            }
            else {
              v29 = @"Please disconnect the USB cable in order to restart your device.\n\n请拔出USB线以重新启动";
            }
            if (v39) {
              v30 = @"Shutdown/关机";
            }
            else {
              v30 = @"Restart/重新启动";
            }
            if (v32)
            {
              v31 = @"--- FAIL / 失败 ---";
LABEL_69:
              syslog(7, "preparing CFUserNotification");
              v33 = CFDictionaryCreateMutable(0LL, 0LL, v1, &kCFTypeDictionaryValueCallBacks);
              if (v33)
              {
                v34 = v33;
                CFDictionarySetValue(v33, kCFUserNotificationAlertHeaderKey, v31);
                CFDictionarySetValue(v34, kCFUserNotificationAlertMessageKey, v29);
                CFDictionarySetValue(v34, kCFUserNotificationDefaultButtonTitleKey, v30);
                CFDictionarySetValue(v34, @"SBUserNotificationDontDismissOnUnlock", kCFBooleanTrue);
                CFDictionarySetValue(v34, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
                CFDictionarySetValue(v34, @"Request", v12);
                pthread_create(&valuePtr, 0LL, (void *(__cdecl *)(void *))sub_100004ADC, v34);
              }
            }

            syslog(7, "waiting until disconnect");
            int v35 = lockdown_recv(v43, &valuePtr, 8LL);
            syslog(7, "lockdown_recv returned %d", v35);
          }

          if (v39) {
            sub_100005040();
          }
          else {
            sub_100004D08();
          }
          v8 = 0LL;
          goto LABEL_26;
        }

LABEL_21:
        sub_100006584((uint64_t)v3, v10);
      }

      else
      {
        sub_1000040D0((uint64_t)"main", @"The message did not contain a request element.");
        CFDictionarySetValue(v8, @"Status", @"InvalidRequest");
      }

    sub_1000040D0((uint64_t)"gather_ioreg_info", @"Can't create ioreg dict.");
    goto LABEL_22;
  }

  sub_1000040D0((uint64_t)"gather_ioreg_info", @"Can't get root entry.");
}

LABEL_26:
      int v15 = 0;
      goto LABEL_27;
    }

    sub_1000040D0((uint64_t)"main", @"Could not create empty response.");
    int v15 = 1;
LABEL_39:
    if (v3) {
      CFRelease(v3);
    }
    if (v15) {
      goto LABEL_94;
    }
  }

  if (v3) {
    CFRelease(v3);
  }
  sub_1000040D0((uint64_t)"main", @"Could not receive message from client.");
LABEL_94:
  lockdown_disconnect(v43);
  return 0LL;
}

uint64_t sub_100004ADC(const __CFDictionary *a1)
{
  if (a1)
  {
    Value = CFDictionaryGetValue(a1, @"Request");
    if (Value
      && (int v3 = CFEqual(Value, @"Shutdown"),
          v4 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, a1),
          syslog(7, "creating notification returned %d", error),
          v4)
      && (v3 ? (CFTypeID v5 = sub_100004C28) : (CFTypeID v5 = sub_100004C48),
          RunLoopSource = CFUserNotificationCreateRunLoopSource( kCFAllocatorDefault,  v4,  (CFUserNotificationCallBack)v5,  0LL),  CFRelease(v4),  RunLoopSource))
    {
      syslog(7, "about to put up CFUserNotification now");
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
      CFRelease(RunLoopSource);
      CFRelease(a1);
      syslog(7, "running runloop");
      CFRunLoopRun();
      syslog(7, "exiting cfUserNotificationThread");
    }

    else
    {
      CFRelease(a1);
    }
  }

  return 0LL;
}

uint64_t sub_100004C28()
{
  return sub_100005040();
}

uint64_t sub_100004C48()
{
  return sub_100004D08();
}

uint64_t sub_100004C68()
{
  uint64_t v0 = IOMasterPort(bootstrap_port, &mainPort);
  if (!(_DWORD)v0)
  {
    io_connect_t v2 = IOPMFindPowerManagement(mainPort);
    if (v2)
    {
      uint64_t v0 = IOPMSleepSystem(v2);
      if ((_DWORD)v0) {
        fprintf(__stderrp, "sleep failed (0x%08x)\n", v0);
      }
    }

    else
    {
      uint64_t v0 = 3758097136LL;
      fprintf(__stderrp, "sleep failed - cannot find power management (0x%08x)\n", -536870160);
    }
  }

  return v0;
}

uint64_t sub_100004D08()
{
  if (!access("/sbin/reboot", 0))
  {
    v2[0] = "/sbin/reboot";
    v2[1] = 0LL;
    int v0 = sub_100004DB4(v2);
    if (!v0) {
      return 0LL;
    }
LABEL_5:
    fprintf(__stderrp, "unable to restart, error code: %d - exiting\n", v0);
    exit(1);
  }

  int v0 = reboot3(0LL);
  if (v0) {
    goto LABEL_5;
  }
  return 0LL;
}

uint64_t sub_100004DB4(const char **a1)
{
  if (pipe((int *)v25) != -1)
  {
    pid_t v2 = fork();
    if (v2 == -1)
    {
      v12 = __stderrp;
      v13 = *a1;
      v14 = __error();
      int v15 = strerror(*v14);
      fprintf(v12, "fork %s failed: %s\n", v13, v15);
      close(*(int *)v25);
LABEL_11:
      close(*(int *)&v25[4]);
      return 0xFFFFFFFFLL;
    }

    pid_t v3 = v2;
    if (!v2)
    {
      close(*(int *)v25);
      if (execv(*a1, (char *const *)a1) == -1)
      {
        v4 = __stderrp;
        CFTypeID v5 = *a1;
        v6 = __error();
        v7 = strerror(*v6);
        fprintf(v4, "execv: %s: %s", v5, v7);
LABEL_8:
        _exit(1);
      }

      goto LABEL_11;
    }

    int v18 = *(_DWORD *)v25;
    close(*(int *)&v25[4]);
    if (v18 == -1) {
      return 0xFFFFFFFFLL;
    }
    ssize_t v19 = read(v18, v25, 0x3FFuLL);
    if (v19 >= 1)
    {
      do
      {
        v25[v19] = 0;
        fputs(v25, __stderrp);
        ssize_t v19 = read(v18, v25, 0x3FFuLL);
      }

      while (v19 > 0);
    }

    if (waitpid(v3, &v24, 0) != -1)
    {
      if ((v24 & 0x7F) == 0x7F)
      {
        fprintf(__stderrp, "%s was stopped by signal %d\n");
      }

      else
      {
        if ((v24 & 0x7F) == 0)
        {
          uint64_t v16 = BYTE1(v24);
LABEL_25:
          close(v18);
          return v16;
        }

        fprintf(__stderrp, "%s was terminated by signal %d\n");
      }

      uint64_t v16 = 0xFFFFFFFFLL;
      goto LABEL_25;
    }

    uint64_t v16 = *__error();
    v20 = __stderrp;
    v21 = *a1;
    unint64_t v22 = __error();
    uint64_t v23 = strerror(*v22);
    fprintf(v20, "waitpid failed for %s: %s\n", v21, v23);
    goto LABEL_25;
  }

  v8 = __stderrp;
  CFMutableDictionaryRef v9 = *a1;
  CFMutableDictionaryRef v10 = __error();
  v11 = strerror(*v10);
  fprintf(v8, "pipe failed while preparing to execute %s: %s\n", v9, v11);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100005040()
{
  if (!access("/sbin/halt", 0))
  {
    __int128 v2 = off_1000083B0;
    int v0 = sub_100004DB4((const char **)&v2);
    if (!v0) {
      return 0LL;
    }
LABEL_5:
    fprintf(__stderrp, "unable to shutdown, return code:%d - exiting\n", v0);
    exit(1);
  }

  int v0 = reboot3(8LL);
  if (v0) {
    goto LABEL_5;
  }
  return 0LL;
}

void sub_1000050EC(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFTypeID v5 = Mutable;
    CFDictionarySetValue(Mutable, @"Status", @"Success");
    if (!a2)
    {
LABEL_18:
      CFDictionarySetValue(a2, @"MobileGestalt", v5);
      CFRelease(v5);
      return;
    }

    if (!a1) {
      goto LABEL_16;
    }
    Value = CFDictionaryGetValue(a1, @"MobileGestaltKeys");
    if (!Value)
    {
      sub_1000040D0((uint64_t)"gather_mobile_gestalt_info", @"Did not find any keys to lookup");
      goto LABEL_16;
    }

    v7 = Value;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID != CFGetTypeID(v7))
    {
      sub_1000040D0((uint64_t)"gather_mobile_gestalt_info", @"Keys passed in are not an array");
      goto LABEL_16;
    }

    CFIndex Count = CFArrayGetCount((CFArrayRef)v7);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v7, 0LL);
      CFTypeID v12 = CFStringGetTypeID();
      if (v12 != CFGetTypeID(ValueAtIndex))
      {
LABEL_12:
        sub_1000040D0((uint64_t)"gather_mobile_gestalt_info", @"Keys passed in are not all strings");
        goto LABEL_16;
      }

      CFIndex v13 = 1LL;
      while (v10 != v13)
      {
        v14 = CFArrayGetValueAtIndex((CFArrayRef)v7, v13);
        CFTypeID v15 = CFStringGetTypeID();
        ++v13;
        if (v15 != CFGetTypeID(v14))
        {
          if (v13 - 1 >= v10) {
            break;
          }
          goto LABEL_12;
        }
      }
    }

    uint64_t v17 = MGCopyAnswer(@"InternalBuild", 0LL);
    if (!v17
      || (int v18 = (const void *)v17, v19 = CFBooleanGetTypeID(), v19 != CFGetTypeID(v18))
      || !CFBooleanGetValue((CFBooleanRef)v18))
    {
      sub_1000040D0((uint64_t)"gather_mobile_gestalt_info", @"MobileGestalt query function has been deprecated");
      uint64_t v16 = @"MobileGestaltDeprecated";
      goto LABEL_17;
    }

    CFRelease(v18);
    v20 = (const __CFDictionary *)MGCopyMultipleAnswers(v7, 0LL);
    if (v20)
    {
      v21 = v20;
      CFDictionaryApplyFunction(v20, (CFDictionaryApplierFunction)sub_100005348, v5);
      CFRelease(v21);
      goto LABEL_18;
    }

    sub_1000040D0((uint64_t)"gather_mobile_gestalt_info", @"MobileGestalt didn't return anything");
LABEL_16:
    uint64_t v16 = @"MobileGestaltFailed";
LABEL_17:
    CFDictionarySetValue(v5, @"Status", v16);
    goto LABEL_18;
  }

void sub_100005348(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void sub_10000535C(const __CFDictionary *a1, __CFDictionary *a2)
{
  mach_port_t mainPort = 0;
  if (!a1)
  {
    sub_1000040D0((uint64_t)"gather_ioreg_info", @"Request message is not valid.");
    return;
  }

  if (!a2)
  {
    sub_1000040D0((uint64_t)"gather_ioreg_info", @"%s, Bad parameter.", "gather_ioreg_info");
    return;
  }

  if (IOMasterPort(bootstrap_port, &mainPort)) {
    sub_1000040D0((uint64_t)"gather_ioreg_info", @"can't obtain I/O Kit's master port");
  }
  uint64_t RootEntry = IORegistryGetRootEntry(mainPort);
  if ((_DWORD)RootEntry)
  {
    uint64_t v5 = RootEntry;
    Value = (const __CFString *)CFDictionaryGetValue(a1, @"CurrentPlane");
    v7 = (const __CFString *)CFDictionaryGetValue(a1, @"EntryName");
    v8 = (const __CFString *)CFDictionaryGetValue(a1, @"EntryClass");
    if (Value)
    {
      if (!CFStringGetCString(Value, buffer, 128LL, 0x8000100u))
      {
        sub_1000040D0((uint64_t)"gather_ioreg_info", @"Can't convert plane name to io_name_t");
        goto LABEL_21;
      }

      sub_1000040D0((uint64_t)"gather_ioreg_info", @"IOReg query plane %s", buffer);
      CFMutableDictionaryRef v9 = sub_10000557C(v5, buffer);
    }

    else
    {
      if (v7)
      {
        v8 = v7;
        int v10 = 0;
      }

      else
      {
        if (!v8) {
          goto LABEL_21;
        }
        int v10 = 1;
      }

      CFMutableDictionaryRef v9 = sub_100005A74(v8, v10);
    }

    v11 = v9;
    if (v9)
    {
      CFDictionarySetValue(a2, @"IORegistry", v9);
      CFRelease(v11);
LABEL_22:
      IOObjectRelease(v5);
      return;
    }

__CFDictionary *sub_10000557C(uint64_t a1, const char *a2)
{
  io_registry_entry_t valuePtr = a1;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  uint64_t NameInPlane = IORegistryEntryGetNameInPlane(a1, a2, name);
  if ((_DWORD)NameInPlane)
  {
    sub_1000040D0( (uint64_t)"create_ioreg_dict",  @"IORegistryEntryGetNameInPlane has failed with error %d.",  NameInPlane);
    goto LABEL_8;
  }

  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, name, 0x8000100u);
  if (v7)
  {
    CFStringRef v8 = v7;
    CFDictionarySetValue(Mutable, @"name", v7);
    CFRelease(v8);
  }

  else
  {
    sub_1000040D0((uint64_t)"create_ioreg_dict", @"Can't create CFString for entry name.");
  }

  uint64_t Class = IOObjectGetClass(a1, className);
  if ((_DWORD)Class)
  {
    sub_1000040D0((uint64_t)"create_ioreg_dict", @"IOObjectGetClass has failed with error %d.", Class);
    goto LABEL_8;
  }

  CFStringRef v12 = CFStringCreateWithCString(kCFAllocatorDefault, className, 0x8000100u);
  if (v12)
  {
    CFIndex v13 = v12;
    CFDictionarySetValue(Mutable, @"className", v12);
    v14 = CFStringCreateMutable(kCFAllocatorDefault, 512LL);
    Copy = CFStringCreateCopy(0LL, v13);
    CFStringInsert(v14, 0LL, Copy);
    uint64_t v16 = IOObjectCopySuperclassForClass(Copy);
    CFRelease(Copy);
    if (v16)
    {
      do
      {
        CFStringInsert(v14, 0LL, @" : ");
        CFStringInsert(v14, 0LL, v16);
        CFStringRef v17 = IOObjectCopySuperclassForClass(v16);
        CFRelease(v16);
        uint64_t v16 = v17;
      }

      while (v17);
    }

    CFRelease(v13);
    if (v14)
    {
      CFDictionarySetValue(Mutable, @"inheritance", v14);
      CFRelease(v14);
    }

    else
    {
      sub_1000040D0((uint64_t)"create_ioreg_dict", @"Can't create inheritance string.");
    }
  }

  else
  {
    sub_1000040D0((uint64_t)"create_ioreg_dict", @"Can't create CFString for className.");
  }

  int v18 = (char *)malloc(0xC800uLL);
  int v10 = v18;
  if (!v18)
  {
    sub_1000040D0((uint64_t)"create_ioreg_dict", @"Failed to get space for state string.");
    goto LABEL_25;
  }

  char *v18 = 0;
  CFTypeID v19 = v18;
  if (!IOObjectConformsTo(a1, "IOService"))
  {
LABEL_38:
    RetainCFIndex Count = IOObjectGetRetainCount(a1);
    sprintf(v19, "retain %d", RetainCount);
    CFStringRef v27 = CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
    if (v27)
    {
      CFStringRef v28 = v27;
      CFDictionarySetValue(Mutable, @"state", v27);
      CFRelease(v28);
    }

    else
    {
      sub_1000040D0((uint64_t)"create_ioreg_dict", @"Can't create CFString for state.");
    }

    free(v10);
    CFNumberRef v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v29)
    {
      CFNumberRef v30 = v29;
      CFDictionarySetValue(Mutable, @"regEntry", v29);
      CFRelease(v30);
    }

    else
    {
      sub_1000040D0((uint64_t)"create_ioreg_dict", @"Can't create CFNumber for regEntry");
    }

    uint64_t ChildIterator = IORegistryEntryGetChildIterator(valuePtr, a2, &iterator);
    if ((_DWORD)ChildIterator)
    {
      sub_1000040D0( (uint64_t)"create_ioreg_dict",  @"IORegistryEntryGetChildIterator has failed with error %d.",  ChildIterator);
    }

    else
    {
      uint64_t v32 = IOIteratorNext(iterator);
      if ((_DWORD)v32)
      {
        uint64_t v33 = v32;
        do
        {
          v34 = (const void *)sub_10000557C(v33, a2);
          CFArrayAppendValue(v5, v34);
          IOObjectRelease(v33);
          uint64_t v33 = IOIteratorNext(iterator);
        }

        while ((_DWORD)v33);
      }

      IOObjectRelease(iterator);
      if (CFArrayGetCount(v5)) {
        CFDictionarySetValue(Mutable, @"children", v5);
      }
    }

LABEL_8:
    int v10 = 0LL;
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  uint64_t State = IOServiceGetState(a1, &v36);
  if ((_DWORD)State)
  {
    sub_1000040D0((uint64_t)"create_ioreg_dict", @"IOServiceGetState has failed with error %d.", State);
    goto LABEL_25;
  }

  v21 = "!";
  if ((v36 & 2) != 0) {
    unint64_t v22 = (const char *)&unk_1000078B3;
  }
  else {
    unint64_t v22 = "!";
  }
  if ((v36 & 4) != 0) {
    v21 = (const char *)&unk_1000078B3;
  }
  if ((v36 & 1) != 0) {
    uint64_t v23 = "in";
  }
  else {
    uint64_t v23 = (const char *)&unk_1000078B3;
  }
  int v24 = __sprintf_chk(v10, 0, 0xC800uLL, "%sregistered, %smatched, %sactive, ", v22, v21, v23);
  uint64_t v25 = IOServiceGetBusyState(a1, &busyState);
  if (!(_DWORD)v25)
  {
    CFTypeID v19 = &v10[v24 + sprintf(&v10[v24], "busy %d, ", busyState)];
    goto LABEL_38;
  }

  sub_1000040D0((uint64_t)"create_ioreg_dict", @"IOServiceGetBusyState has failed with error %d.", v25);
LABEL_25:
  if (v5) {
LABEL_9:
  }
    CFRelease(v5);
LABEL_10:
  if (v10) {
    free(v10);
  }
  return Mutable;
}

CFMutableDictionaryRef sub_100005A74(const __CFString *a1, int a2)
{
  v4 = (char *)malloc(0x80uLL);
  CFMutableDictionaryRef properties = 0LL;
  CFStringGetCString(a1, v4, 128LL, 0x8000100u);
  if (v4)
  {
    if (a2)
    {
      sub_1000040D0((uint64_t)"copy_prop_matches_name", @"IOReg query class %s", v4);
      uint64_t v5 = IOServiceMatching(v4);
    }

    else
    {
      sub_1000040D0((uint64_t)"copy_prop_matches_name", @"IOReg query entry %s", v4);
      uint64_t v5 = IOServiceNameMatching(v4);
    }

    if (v5)
    {
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
      if (MatchingService)
      {
        io_object_t v8 = MatchingService;
        if (IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0)) {
          sub_1000040D0((uint64_t)"copy_prop_matches_name", @"Could not create property.");
        }
        IOObjectRelease(v8);
        CFMutableDictionaryRef v6 = properties;
        goto LABEL_14;
      }

      sub_1000040D0((uint64_t)"copy_prop_matches_name", @"Could not get service.");
    }

    else
    {
      sub_1000040D0((uint64_t)"copy_prop_matches_name", @"Could not get name matching dictionary.");
    }

    CFMutableDictionaryRef v6 = 0LL;
LABEL_14:
    free(v4);
    return v6;
  }

  sub_1000040D0((uint64_t)"copy_prop_matches_name", @"Could not get ioreg entry name.");
  return 0LL;
}

void sub_100005BCC(const __CFDictionary *a1)
{
  v1[2] = __stderrp;
  v1[0] = 0LL;
  v1[1] = "\t";
  sub_100005C94(a1, v1);
}

void sub_100005C08(const __CFDictionary *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[0] = 0LL;
  v2[1] = "\t";
  sub_100005C94(a1, v2);
}

void sub_100005C38(const __CFDictionary *a1, uint64_t a2)
{
  v2[0] = 0LL;
  v2[1] = a2;
  v2[2] = __stderrp;
  sub_100005C94(a1, v2);
}

void sub_100005C6C(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  v3[0] = 0LL;
  v3[1] = a3;
  v3[2] = a2;
  sub_100005C94(a1, v3);
}

void sub_100005C94(const __CFDictionary *a1, void *a2)
{
  if (a1)
  {
    pid_t v3 = a1;
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFDictionaryGetTypeID())
    {
      CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_100005DF0, a2);
      return;
    }

    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
    {
      v8.length = CFArrayGetCount(v3);
      v8.location = 0LL;
      CFArrayApplyFunction(v3, v8, (CFArrayApplierFunction)sub_100005E44, a2);
      return;
    }

    CFTypeID v6 = CFGetTypeID(v3);
    if (v6 == CFTreeGetTypeID())
    {
      sub_100005ED4(v3, (uint64_t)a2);
      return;
    }

    CFTypeID v7 = CFGetTypeID(v3);
    if (v7 == CFBagGetTypeID())
    {
      CFBagApplyFunction(v3, (CFBagApplierFunction)sub_100005F40, a2);
      return;
    }

    a1 = v3;
  }

  sub_100005DAC(a1, (uint64_t)a2);
}

void sub_100005DAC(const void *a1, uint64_t a2)
{
  pid_t v3 = (char *)sub_100005F54(a1);
  sub_1000060C0(v3, 0LL, a2);
  if (v3) {
    free(v3);
  }
}

void sub_100005DF0(const void *a1, const void *a2, uint64_t a3)
{
  CFTypeID v5 = (char *)sub_100005F54(a1);
  sub_1000060C0(v5, a2, a3);
  if (v5) {
    free(v5);
  }
}

void sub_100005E44(const void *a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = v4 + 1;
  snprintf(__str, 0x100uLL, "%d", v4);
  sub_1000060C0(__str, a1, a2);
}

void sub_100005ED4(__CFTree *a1, uint64_t a2)
{
  int v4 = *(_DWORD *)a2 + 1;
  __int128 v6 = *(_OWORD *)(a2 + 8);
  v5[0] = v4;
  v5[1] = 0;
  CFTreeGetContext(a1, &context);
  sub_1000060C0((char *)&unk_1000078B3, context.info, a2);
  CFTreeApplyFunctionToChildren(a1, (CFTreeApplierFunction)sub_100005ED4, v5);
}

void sub_100005F40(const void *a1, uint64_t a2)
{
}

_WORD *sub_100005F54(const void *a1)
{
  if (a1
    && (CFTypeID TypeID = CFDataGetTypeID(), TypeID == CFGetTypeID(a1))
    && (CFIndex v3 = CFDataGetLength((CFDataRef)a1),
        BytePtr = CFDataGetBytePtr((CFDataRef)a1),
        size_t v5 = 2 * (int)v3 + 3,
        (__int128 v6 = (char *)malloc(v5)) != 0LL))
  {
    CFTypeID v7 = v6;
    strlcpy(v6, "0x", v5);
    CFRange v8 = v7 + 1;
    if (v3 >= 1)
    {
      do
      {
        int v9 = *BytePtr++;
        snprintf(__str, 3uLL, "%02hX", v9);
        *v8++ = *(_WORD *)__str;
        --v3;
      }

      while (v3);
    }

    *(_BYTE *)CFRange v8 = 0;
  }

  else
  {
    CFStringRef v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@", a1);
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = a1 == 0LL;
    }
    if (v11) {
      CFStringRef v12 = v10;
    }
    else {
      CFStringRef v12 = @"<error getting string representation>";
    }
    CFIndex Length = CFStringGetLength(v12);
    CFIndex v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    CFTypeID v7 = malloc(v14);
    if (v7 && !CFStringGetCString(v12, (char *)v7, v14, 0x8000100u))
    {
      free(v7);
      CFTypeID v7 = 0LL;
    }

    if (v12) {
      CFRelease(v12);
    }
  }

  return v7;
}

void sub_1000060C0(char *a1, const void *a2, uint64_t a3)
{
  if (*(int *)a3 >= 1)
  {
    int v6 = 0;
    do
    {
      fputs(*(const char **)(a3 + 8), *(FILE **)(a3 + 16));
      ++v6;
    }

    while (v6 < *(_DWORD *)a3);
  }

  fputs(a1, *(FILE **)(a3 + 16));
  if (a2)
  {
    if (a1 && *a1) {
      fputc(58, *(FILE **)(a3 + 16));
    }
    CFTypeID v7 = CFGetTypeID(a2);
    if (v7 == CFDictionaryGetTypeID()
      || (CFTypeID v8 = CFGetTypeID(a2), v8 == CFArrayGetTypeID())
      || (CFTypeID v9 = CFGetTypeID(a2), v9 == CFTreeGetTypeID())
      || (CFTypeID v10 = CFGetTypeID(a2), v10 == CFBagGetTypeID()))
    {
      fputc(10, *(FILE **)(a3 + 16));
      v13[0] = *(_DWORD *)a3 + 1;
      v13[1] = 0;
      __int128 v14 = *(_OWORD *)(a3 + 8);
      sub_100005C94(a2, v13);
    }

    else
    {
      BOOL v11 = (char *)sub_100005F54(a2);
      if (a1 && *a1) {
        fputc(32, *(FILE **)(a3 + 16));
      }
      CFStringRef v12 = *(FILE **)(a3 + 16);
      if (v11)
      {
        fprintf(v12, "%s\n", v11);
        free(v11);
      }

      else
      {
        fwrite("(NULL)\n", 7uLL, 1uLL, v12);
      }
    }
  }

  else
  {
    fputc(10, *(FILE **)(a3 + 16));
  }

void sub_100006268(uint64_t a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    int v4 = Mutable;
    sub_1000040D0( (uint64_t)"gather_wifi_info",  @"Could not gather the Wifi information as this function has been deprecated");
    CFDictionarySetValue(v4, @"Status", @"WifiInfoDeprecated");
    CFDictionarySetValue(a2, @"WiFi", v4);
    CFRelease(v4);
  }

  else
  {
    sub_1000040D0((uint64_t)"gather_wifi_info", @"Could not create empty dictionary");
  }

uint64_t sub_100006308(const __CFDictionary *a1)
{
  uint64_t v2 = MGCopyAnswer(@"InternalBuild", 0LL);
  if (!v2)
  {
    sub_1000040D0((uint64_t)"do_obliterate", @"obliteration denied: not running internal build.");
    return 1LL;
  }

  CFIndex v3 = (const void *)v2;
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID == CFGetTypeID(v3) && CFBooleanGetValue((CFBooleanRef)v3))
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      int v6 = Mutable;
      if (a1)
      {
        Value = CFDictionaryGetValue(a1, @"DataPartitionOnly");
        if (!Value) {
          goto LABEL_18;
        }
      }

      else
      {
        Value = kCFBooleanFalse;
        if (!kCFBooleanFalse) {
          goto LABEL_18;
        }
      }

      CFTypeID v10 = CFBooleanGetTypeID();
      if (v10 == CFGetTypeID(Value) && CFBooleanGetValue((CFBooleanRef)Value))
      {
        BOOL v11 = (const void **)&kObliterateDataPartition;
LABEL_19:
        CFDictionarySetValue(v6, kObliterationTypeKey, *v11);
        CFDictionarySetValue(v6, kDisplayProgressBarKey, kCFBooleanTrue);
        int valuePtr = 3;
        sub_1000040D0((uint64_t)"do_obliterate", @"REPLY REQUESTED and delay set for %d secs\n", 3LL);
        CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        if (v12) {
          CFDictionarySetValue(v6, kObliterationDelayAfterReplyKey, v12);
        }
        else {
          sub_1000040D0((uint64_t)"do_obliterate", @"Can't set obliteration delay ");
        }
        CFRelease(v12);
        CFDictionarySetValue(v6, kObliterationMessageKey, @"MobileDiagnosticsRelay executed SIOP.");
        sub_1000040D0((uint64_t)"do_obliterate", @"obliteration starting: SIOP orders being transmitted.");
        uint64_t v13 = Mobile_Obliterate(v6);
        uint64_t v8 = v13;
        if ((_DWORD)v13) {
          sub_1000040D0((uint64_t)"do_obliterate", @"SIOP orders failed (%d): how did we end up here?", v13);
        }
        else {
          sub_1000040D0((uint64_t)"do_obliterate", @"SIOP orders accepted: welcome to the Stone Age.", v14);
        }
        CFRelease(v6);
        goto LABEL_10;
      }

LABEL_18:
      BOOL v11 = (const void **)&kObliterationTypeWipeAndBrick;
      goto LABEL_19;
    }

    sub_1000040D0((uint64_t)"do_obliterate", @"Could not create CFDictionary.");
  }

  else
  {
    sub_1000040D0((uint64_t)"do_obliterate", @"obliteration denied: not running internal build.");
  }

  uint64_t v8 = 1LL;
LABEL_10:
  CFRelease(v3);
  return v8;
}

void sub_100006584(uint64_t a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    sub_1000040D0((uint64_t)"gather_hdmi_info", @"Could not create empty dictionary");
    return;
  }

  int v4 = Mutable;
  CFDictionarySetValue(Mutable, @"Status", @"Failure");
  CFDictionarySetValue(v4, @"Connection", @"Unplugged");
  size_t v5 = IOServiceMatching("IOHDMIService");
  if (v5)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
    if (MatchingService)
    {
      io_object_t v7 = MatchingService;
      CFDictionarySetValue(v4, @"Connection", @"Plugged");
      uint64_t v8 = 0LL;
      CFTypeID v9 = @"Success";
LABEL_5:
      CFDictionarySetValue(v4, @"Status", v9);
      CFDictionarySetValue(a2, @"HDMI", v4);
      goto LABEL_6;
    }

    CFTypeID v10 = IOServiceMatching("AppleANX9836");
    if (v10)
    {
      io_service_t v11 = IOServiceGetMatchingService(kIOMasterPortDefault, v10);
      io_object_t v7 = v11;
      if (v11)
      {
        CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty( v11,  @"ds_plugged",  kCFAllocatorDefault,  0);
        uint64_t v8 = CFProperty;
        if (!CFProperty)
        {
          CFTypeID v9 = @"CreatePropertiesFailed";
          goto LABEL_5;
        }

        CFTypeID v13 = CFGetTypeID(CFProperty);
        if (v13 != CFBooleanGetTypeID())
        {
          CFTypeID v9 = @"GetPlugStatusTypeMismatch";
          goto LABEL_5;
        }

        int Value = CFBooleanGetValue(v8);
        CFTypeID v15 = "PLUGGED";
        if (!Value) {
          CFTypeID v15 = "UNPLUGGED";
        }
        sub_1000040D0((uint64_t)"gather_hdmi_info", @"downstream %s\n", v15);
        if (!CFBooleanGetValue(v8))
        {
          CFTypeID v9 = @"GetPlugStatusValueFailred";
          goto LABEL_5;
        }

        CFDictionarySetValue(v4, @"Connection", @"Plugged");
      }

      else
      {
        sub_1000040D0((uint64_t)"gather_hdmi_info", @"Could not find the AppleANX9836 service");
        uint64_t v8 = 0LL;
      }

      CFDictionarySetValue(v4, @"Status", @"Success");
      CFDictionarySetValue(a2, @"HDMI", v4);
      if (!v7)
      {
LABEL_7:
        if (v8) {
          CFRelease(v8);
        }
        goto LABEL_19;
      }

LABEL_6:
      IOObjectRelease(v7);
      goto LABEL_7;
    }
  }

  sub_1000040D0((uint64_t)"gather_hdmi_info", @"Could not create matching dictionary");
  CFDictionarySetValue(v4, @"Status", @"ServiceMatchingFailed");
  CFDictionarySetValue(a2, @"HDMI", v4);
LABEL_19:
  CFRelease(v4);
}