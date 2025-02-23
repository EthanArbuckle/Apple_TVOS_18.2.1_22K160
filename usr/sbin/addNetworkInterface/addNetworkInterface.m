int main(int argc, const char **argv, const char **envp)
{
  int v3;
  const char **v4;
  uint64_t i;
  const char *v6;
  CFStringEncoding v7;
  CFStringRef v8;
  CFStringRef v9;
  __CFArray *v10;
  CFStringEncoding SystemEncoding;
  CFStringRef v12;
  CFStringRef v13;
  __CFArray *Mutable;
  uint64_t v15;
  CFStringRef v16;
  CFStringRef v17;
  CFDictionaryRef v18;
  kern_return_t MatchingServices;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  int v22;
  if (argc >= 2)
  {
    v3 = 0;
    v4 = argv + 1;
    for (i = argc - 1LL; i; --i)
    {
      v6 = *v4;
      if (strcmp(*v4, "-i"))
      {
        if (!strcmp(v6, "-c")) {
          goto LABEL_37;
        }
        if (!strcmp(v6, "-p"))
        {
          if (byte_100008000 == 1) {
            syslog(1, "Will persist\n");
          }
          else {
            puts("Will persist");
          }
          byte_100008001 = 1;
          goto LABEL_38;
        }

        if (!strcmp(v6, "-x"))
        {
          if (byte_100008000 == 1) {
            syslog(1, "XPC support\n");
          }
          else {
            puts("XPC support");
          }
          byte_100008002 = 1;
          goto LABEL_38;
        }

        if (!strcmp(v6, "-s"))
        {
          puts("Routing debug output to syslog");
          if (byte_100008000 == 1) {
            syslog(1, "Routing debug output to syslog\n");
          }
          else {
            puts("Routing debug output to syslog");
          }
          byte_100008000 = 1;
          goto LABEL_38;
        }

        if (v3 == 2)
        {
          SystemEncoding = CFStringGetSystemEncoding();
          v12 = CFStringCreateWithCString(kCFAllocatorDefault, v6, SystemEncoding);
          if (v12)
          {
            v13 = v12;
            Mutable = (__CFArray *)qword_100008010;
            if (qword_100008010
              || (Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks),
                  (qword_100008010 = (uint64_t)Mutable) != 0))
            {
              CFArrayAppendValue(Mutable, v13);
              if (byte_100008000 == 1) {
                syslog(1, "Looking for controller %s\n", *v4);
              }
              else {
                printf("Looking for controller %s\n", *v4);
              }
            }

            CFRelease(v13);
          }

LABEL_37:
          v3 = 2;
          goto LABEL_38;
        }

        if (v3 != 1)
        {
          puts("options:\n");
          puts("\t[-i <interface>]");
          puts("\t[-c <controller>]");
          puts("\t[-p] persistent host detection");
          puts("\t[-s] route logging to syslog");
          puts("\t[-x] register xpc");
          goto LABEL_69;
        }

        v7 = CFStringGetSystemEncoding();
        v8 = CFStringCreateWithCString(kCFAllocatorDefault, v6, v7);
        if (v8)
        {
          v9 = v8;
          v10 = (__CFArray *)qword_100008008;
          if (qword_100008008
            || (v10 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks),
                (qword_100008008 = (uint64_t)v10) != 0))
          {
            CFArrayAppendValue(v10, v9);
            if (byte_100008000 == 1) {
              syslog(1, "Looking for interface %s\n", *v4);
            }
            else {
              printf("Looking for interface %s\n", *v4);
            }
          }

          CFRelease(v9);
        }
      }

      v3 = 1;
LABEL_38:
      ++v4;
    }
  }

  if (!qword_100008008)
  {
    if (byte_100008000 == 1) {
      syslog(1, "Looking for all interfaces\n", envp);
    }
    else {
      puts("Looking for all interfaces");
    }
  }

  if (!qword_100008010)
  {
    if (byte_100008000 == 1) {
      syslog(1, "Looking for all controllers\n", envp);
    }
    else {
      puts("Looking for all controllers");
    }
  }

  if (byte_100008002 == 1) {
    xpc_set_event_stream_handler("com.apple.iokit.matching", &_dispatch_main_q, &stru_100004268);
  }
  v15 = getpid();
  v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"addNetworkInterface-%d", v15);
  if (v16)
  {
    v17 = v16;
    qword_100008018 = (uint64_t)SCPreferencesCreate(kCFAllocatorDefault, v16, 0LL);
    if (!qword_100008018) {
      goto LABEL_70;
    }
    if (byte_100008000 == 1) {
      syslog(1, "Looking for network interfaces...\n");
    }
    else {
      puts("Looking for network interfaces...");
    }
    v18 = IOServiceMatching("IONetworkInterface");
    if (!v18)
    {
      if (byte_100008000 == 1) {
        syslog(1, "Can't create a service matching dictionary\n");
      }
      else {
        puts("Can't create a service matching dictionary");
      }
      goto LABEL_61;
    }

    if (byte_100008001 == 1)
    {
      MatchingServices = IOServiceAddMatchingNotification( (IONotificationPortRef)qword_100008020,  "IOServiceMatched",  v18,  (IOServiceMatchingCallback)sub_100002994,  0LL,  (io_iterator_t *)&dword_100008028);
      if (MatchingServices)
      {
        if (byte_100008000 == 1) {
          syslog(1, "IOServiceAddMatchingNotification failed: 0x%x\n");
        }
        else {
          printf("IOServiceAddMatchingNotification failed: 0x%x\n");
        }
        goto LABEL_61;
      }
    }

    else
    {
      MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v18, (io_iterator_t *)&dword_100008028);
      if (MatchingServices)
      {
        if (byte_100008000 == 1) {
          syslog(1, "IOServiceGetMatchingServices failed: 0x%x\n");
        }
        else {
          printf("IOServiceGetMatchingServices failed: 0x%x\n");
        }
        goto LABEL_61;
      }
    }

    sub_100002994(MatchingServices, dword_100008028);
LABEL_61:
    if (byte_100008001 != 1)
    {
LABEL_64:
      v22 = 0;
LABEL_65:
      CFRelease(v17);
      goto LABEL_66;
    }

    qword_100008020 = (uint64_t)IONotificationPortCreate(kIOMasterPortDefault);
    if (qword_100008020)
    {
      Current = CFRunLoopGetCurrent();
      RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_100008020);
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
      CFRunLoopRun();
      goto LABEL_64;
    }

LABEL_70:
    v22 = -1;
    goto LABEL_65;
  }

LABEL_69:
  v22 = -1;
LABEL_66:
  if (byte_100008002 == 1) {
    dispatch_main();
  }
  return v22;
}

void sub_100002918(id a1, void *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  uint64_t uint64 = xpc_dictionary_get_uint64(a2, "IOMatchLaunchServiceID");
  if (byte_100008000 == 1) {
    syslog(1, "Kicked on behalf of com.apple.iokit.matching: event=%s id=%lld\n", string, uint64);
  }
  else {
    printf("Kicked on behalf of com.apple.iokit.matching: event=%s id=%lld\n", string, uint64);
  }
  exit(0);
}

uint64_t sub_100002994(int a1, io_iterator_t iterator)
{
  io_iterator_t v2 = iterator;
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    uint64_t v4 = result;
    io_iterator_t v77 = v2;
    while (1)
    {
      *(void *)buffer = 0LL;
      uint64_t v90 = 0LL;
      memset(className, 0, sizeof(className));
      *(void *)parent = 0LL;
      memset(v87, 0, sizeof(v87));
      if (!IORegistryEntryGetParentEntry(v4, "IOService", &parent[1])
        && !IOObjectGetClass(parent[1], className)
        && !IORegistryEntryGetParentEntry(parent[1], "IOService", parent)
        && !IOObjectGetClass(parent[0], v87))
      {
        if (!qword_100008010) {
          goto LABEL_20;
        }
        if (CFArrayGetCount((CFArrayRef)qword_100008010) >= 1) {
          break;
        }
      }

LABEL_55:
      if (parent[1]) {
        IOObjectRelease(parent[1]);
      }
      if (parent[0]) {
        IOObjectRelease(parent[0]);
      }
      IOObjectRelease(v4);
      uint64_t result = IOIteratorNext(v2);
      uint64_t v4 = result;
      if (!(_DWORD)result) {
        return result;
      }
    }

    CFIndex v5 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100008010, v5);
      if (ValueAtIndex)
      {
        v7 = ValueAtIndex;
        io_object_t v8 = parent[1];
        CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
        CStringPtr = CFStringGetCStringPtr(v7, SystemEncoding);
        BOOL v11 = IOObjectConformsTo(v8, CStringPtr) != 0;
        io_object_t v12 = parent[0];
        CFStringEncoding v13 = CFStringGetSystemEncoding();
        v14 = CFStringGetCStringPtr(v7, v13);
        int v15 = IOObjectConformsTo(v12, v14) | v11;
        BOOLean_t v16 = IOObjectConformsTo(parent[0], "IOUserNetworkWLAN");
        BOOL v17 = v15 && v16 == 0;
        if (v17) {
          break;
        }
      }

      if (CFArrayGetCount((CFArrayRef)qword_100008010) <= ++v5) {
        goto LABEL_55;
      }
    }

    int v18 = byte_100008000;
    CFStringEncoding v19 = CFStringGetSystemEncoding();
    v20 = CFStringGetCStringPtr(v7, v19);
    if (v18 == 1) {
      syslog(1, "found %s controller \n", v20);
    }
    else {
      printf("found %s controller \n", v20);
    }
LABEL_20:
    v21 = (const __CFBoolean *)IORegistryEntrySearchCFProperty( parent[1],  "IOService",  @"HiddenInterface",  kCFAllocatorDefault,  3u);
    v22 = v21;
    if (v21 && CFBooleanGetValue(v21))
    {
      if (byte_100008000 == 1) {
        syslog(1, "Skipping configuration on HiddenInterface\n");
      }
      else {
        puts("Skipping configuration on HiddenInterface");
      }
      v24 = 0LL;
      v29 = 0LL;
      v81 = 0LL;
      goto LABEL_48;
    }

    v23 = (const __CFString *)IORegistryEntrySearchCFProperty( parent[1],  "IOService",  @"InterfaceRole",  kCFAllocatorDefault,  3u);
    v24 = v23;
    if (v23 && CFStringCompare(v23, @"CarPlay", 0LL) == kCFCompareEqualTo)
    {
      if (byte_100008000 == 1) {
        syslog(1, "Skipping configuration on CarPlay interface\n");
      }
      else {
        puts("Skipping configuration on CarPlay interface");
      }
      v81 = 0LL;
      v29 = 0LL;
      goto LABEL_47;
    }

    cf = v24;
    v25 = (const __CFNumber *)IORegistryEntrySearchCFProperty( parent[1],  "IOService",  @"NetworkInterfaceFlags",  kCFAllocatorDefault,  0);
    v81 = v25;
    if (v25)
    {
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(v25, kCFNumberIntType, &valuePtr);
      unsigned int v79 = (valuePtr & 0x20000000) >> 29;
      if ((valuePtr & 0x20000000) != 0) {
        uint64_t v26 = 3LL;
      }
      else {
        uint64_t v26 = 0LL;
      }
    }

    else
    {
      uint64_t v26 = 0LL;
      LOBYTE(v79) = 0;
    }

    int v27 = 0;
    while (1)
    {
      v28 = (const __CFString *)IORegistryEntrySearchCFProperty( v4,  "IOService",  @"BSD Name",  kCFAllocatorDefault,  0);
      if (v28) {
        break;
      }
      usleep(0xC350u);
      if (++v27 == 50)
      {
        if (byte_100008000 == 1) {
          syslog(1, "%s didn't find a name after %d intervals\n", className, 50);
        }
        else {
          printf("%s didn't find a name after %d intervals\n", className, 50);
        }
        v29 = 0LL;
        goto LABEL_46;
      }
    }

    v29 = v28;
    CFStringEncoding v30 = CFStringGetSystemEncoding();
    CFStringGetCString(v29, buffer, 16LL, v30);
    if (byte_100008000 == 1) {
      syslog(1, "%s found name after %d intervals : %s\n", className, v27, buffer);
    }
    else {
      printf("%s found name after %d intervals : %s\n", className, v27, buffer);
    }
    if (qword_100008008)
    {
      if (CFArrayGetCount((CFArrayRef)qword_100008008) < 1)
      {
LABEL_46:
        v24 = cf;
        goto LABEL_47;
      }

      CFIndex v31 = 0LL;
      while (1)
      {
        v32 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100008008, v31);
        if (v32)
        {
          v33 = v32;
          if (CFEqual(v29, v32)) {
            break;
          }
        }

        if (CFArrayGetCount((CFArrayRef)qword_100008008) <= ++v31) {
          goto LABEL_46;
        }
      }

      int v34 = byte_100008000;
      CFStringEncoding v35 = CFStringGetSystemEncoding();
      v36 = CFStringGetCStringPtr(v33, v35);
      if (v34 == 1) {
        syslog(1, "found %s interface\n", v36);
      }
      else {
        printf("found %s interface\n", v36);
      }
    }

    v78 = v22;
    CFTypeRef cf2 = (CFTypeRef)_SCNetworkInterfaceCreateWithIONetworkInterfaceObject(v4);
    if (!cf2)
    {
      v38 = 0LL;
      theArray = 0LL;
      int v74 = 1001;
LABEL_157:
      int v75 = byte_100008000;
      v76 = SCErrorString(v74);
      if (v75 == 1) {
        syslog(1, "%s\n", v76);
      }
      else {
        puts(v76);
      }
      v22 = v78;
      goto LABEL_161;
    }

    if (!SCPreferencesLock((SCPreferencesRef)qword_100008018, 1u))
    {
      SCPreferencesSynchronize((SCPreferencesRef)qword_100008018);
      if (!SCPreferencesLock((SCPreferencesRef)qword_100008018, 1u))
      {
        theArray = 0LL;
        v38 = 0LL;
        goto LABEL_170;
      }
    }

    v37 = SCNetworkSetCopyAll((SCPreferencesRef)qword_100008018);
    v38 = v37;
    if (v37 && CFArrayGetCount(v37))
    {
      BOOL v39 = 0;
    }

    else
    {
      uint64_t valuePtr = _SCNetworkSetCreateDefault(qword_100008018);
      if (!valuePtr)
      {
        theArray = v38;
        v38 = 0LL;
        goto LABEL_154;
      }

      BOOL v39 = SCNetworkSetEstablishDefaultConfiguration() != 0;
      if (v38)
      {
        CFRelease(v38);
        CFArrayRef v40 = SCNetworkSetCopyAll((SCPreferencesRef)qword_100008018);
      }

      else
      {
        CFArrayRef v40 = CFArrayCreate(kCFAllocatorDefault, (const void **)&valuePtr, 1LL, &kCFTypeArrayCallBacks);
      }

      v38 = v40;
      if (!v40)
      {
        theArray = 0LL;
        goto LABEL_154;
      }
    }

    char v82 = v39;
    theArray = v38;
    v41 = SCNetworkServiceCopyAll((SCPreferencesRef)qword_100008018);
    if (v41)
    {
      v42 = v41;
      CFIndex Count = CFArrayGetCount(v41);
      if (Count >= 1)
      {
        CFIndex v44 = Count;
        CFIndex v45 = 0LL;
        while (1)
        {
          v46 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v42, v45);
          if (v46)
          {
            v38 = v46;
            SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(v46);
            if (Interface)
            {
              if (CFEqual(Interface, cf2)) {
                break;
              }
            }
          }

          if (v44 == ++v45) {
            goto LABEL_82;
          }
        }

        CFRetain(v38);
        CFRelease(v42);
        int PrimaryRank = SCNetworkServiceGetPrimaryRank(v38);
        int v52 = byte_100008000;
        CFStringRef ServiceID = SCNetworkServiceGetServiceID(v38);
        if (v52 == 1)
        {
          char v50 = v79;
          if (ServiceID)
          {
            v54 = SCNetworkServiceGetServiceID(v38);
            CFStringEncoding v55 = CFStringGetSystemEncoding();
            v56 = CFStringGetCStringPtr(v54, v55);
          }

          else
          {
            v56 = "NULL";
          }

          syslog(1, "Found existing service %s rank = %d.\n", v56, PrimaryRank);
        }

        else
        {
          char v50 = v79;
          if (ServiceID)
          {
            v57 = SCNetworkServiceGetServiceID(v38);
            CFStringEncoding v58 = CFStringGetSystemEncoding();
            v59 = CFStringGetCStringPtr(v57, v58);
          }

          else
          {
            v59 = "NULL";
          }

          printf("Found existing service %s rank = %d.\n", v59, PrimaryRank);
        }

        BOOL v17 = PrimaryRank == (_DWORD)v26;
        v48 = theArray;
        if (v17) {
          goto LABEL_103;
        }
        goto LABEL_98;
      }

LABEL_82:
      CFRelease(v42);
      io_iterator_t v2 = v77;
    }

    if (byte_100008000 == 1) {
      syslog(1, "No existing service found. Creating new service.\n");
    }
    else {
      puts("No existing service found. Creating new service.");
    }
    v48 = theArray;
    v49 = SCNetworkServiceCreate((SCPreferencesRef)qword_100008018, (SCNetworkInterfaceRef)cf2);
    v38 = v49;
    if (v49)
    {
      SCNetworkServiceEstablishDefaultConfiguration(v49);
      char v50 = v79;
LABEL_98:
      if (byte_100008000 == 1) {
        syslog(1, "Setting Primary rank to %d.\n", v26);
      }
      else {
        printf("Setting Primary rank to %d.\n", v26);
      }
      if (!SCNetworkServiceSetPrimaryRank(v38, v26))
      {
        int v60 = SCError();
        int v61 = byte_100008000;
        if (v60)
        {
          v62 = SCErrorString(v60);
          if (v61) {
            syslog(1, "SCNetworkServiceSetPrimaryRank: %s\n");
          }
          else {
            printf("SCNetworkServiceSetPrimaryRank: %s\n", v62);
          }
        }

        else if (byte_100008000)
        {
          syslog(1, "SCNetworkServiceSetPrimaryRank: Failed but no error.\n");
        }

        else
        {
          puts("SCNetworkServiceSetPrimaryRank: Failed but no error.");
        }

        v48 = theArray;
        if ((v50 & 1) == 0) {
          goto LABEL_121;
        }
        goto LABEL_113;
      }

      char v82 = 1;
LABEL_103:
      if ((v50 & 1) == 0)
      {
LABEL_121:
        CFIndex v63 = CFArrayGetCount(v48);
        if (v63 >= 1)
        {
          CFIndex v64 = v63;
          for (CFIndex i = 0LL; i != v64; ++i)
          {
            v66 = (const __SCNetworkSet *)CFArrayGetValueAtIndex(theArray, i);
            v67 = v66;
            if (v66)
            {
              v68 = SCNetworkSetCopyServices(v66);
              if (v68)
              {
                v69 = v68;
                v91.length = CFArrayGetCount(v68);
                v91.location = 0LL;
                int v70 = CFArrayContainsValue(v69, v91, v38);
                CFRelease(v69);
                if (v70) {
                  continue;
                }
              }
            }

            if (SCNetworkSetAddService(v67, v38))
            {
              char v82 = 1;
            }

            else
            {
              int v71 = SCError();
              int v72 = byte_100008000;
              if (v71)
              {
                v73 = SCErrorString(v71);
                if (v72) {
                  syslog(1, "SCNetworkSetAddService: %s\n");
                }
                else {
                  printf("SCNetworkSetAddService: %s\n", v73);
                }
              }

              else if (byte_100008000)
              {
                syslog(1, "SCNetworkSetAddService: Failed but no error.  Probably already in the set.\n");
              }

              else
              {
                puts("SCNetworkSetAddService: Failed but no error.  Probably already in the set.");
              }
            }
          }
        }

        if ((v82 & 1) != 0)
        {
          io_iterator_t v2 = v77;
          if (SCPreferencesCommitChanges((SCPreferencesRef)qword_100008018)
            && SCPreferencesApplyChanges((SCPreferencesRef)qword_100008018))
          {
            int v74 = 0;
          }

          else
          {
            int v74 = SCError();
          }
        }

        else
        {
          int v74 = 0;
          io_iterator_t v2 = v77;
        }

LABEL_155:
        v22 = v78;
        if (SCPreferencesUnlock((SCPreferencesRef)qword_100008018))
        {
          if (v74) {
            goto LABEL_157;
          }
LABEL_161:
          if (v38) {
            CFRelease(v38);
          }
          v24 = cf;
          if (cf2) {
            CFRelease(cf2);
          }
          if (theArray) {
            CFRelease(theArray);
          }
          if (byte_100008000 == 1) {
            syslog(1, "%s: enabled %s\n", className, buffer);
          }
          else {
            printf("%s: enabled %s\n", className, buffer);
          }
LABEL_47:
          if (!v22)
          {
LABEL_49:
            if (v24) {
              CFRelease(v24);
            }
            if (v81) {
              CFRelease(v81);
            }
            if (v29) {
              CFRelease(v29);
            }
            goto LABEL_55;
          }

LABEL_48:
          CFRelease(v22);
          goto LABEL_49;
        }

LABEL_170:
        int v74 = SCError();
        if (v74) {
          goto LABEL_157;
        }
        goto LABEL_161;
      }

LABEL_113:
      if (!SCNetworkServiceGetEnabled(v38))
      {
        if (byte_100008000 == 1) {
          syslog(1, "Service should be enabled, but isn't! Force-enabling service.\n");
        }
        else {
          puts("Service should be enabled, but isn't! Force-enabling service.");
        }
        char v82 = 1;
        if (!SCNetworkServiceSetEnabled(v38, 1u))
        {
          if (byte_100008000 == 1)
          {
            char v82 = byte_100008000;
            syslog(1, "Failed to force enable service.\n");
          }

          else
          {
            puts("Failed to force enable service.");
            char v82 = 1;
          }
        }
      }

      goto LABEL_121;
    }

LABEL_154:
    int v74 = 1001;
    goto LABEL_155;
  }

  return result;
}