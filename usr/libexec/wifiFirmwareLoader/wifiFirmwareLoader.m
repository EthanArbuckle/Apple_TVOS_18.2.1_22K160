void sub_100001FF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_log_s *v8;
  __int128 v9;
  tm *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  IONotificationPort *v17;
  os_log_s *v18;
  __int128 v19;
  tm *v20;
  __CFRunLoopSource *RunLoopSource;
  CFDictionaryRef v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_s *v29;
  __int128 v30;
  tm *v31;
  __int128 v32;
  tm *v33;
  __CFRunLoop *Current;
  __CFRunLoop *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_s *v42;
  __int128 v43;
  tm *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  os_log_s *v51;
  __int128 v52;
  tm *v53;
  __CFRunLoop *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  os_log_s *v63;
  __int128 v64;
  tm *v65;
  char v66;
  char v67;
  char v68;
  uint64_t v69;
  char v70;
  const char *v71;
  void block[4];
  io_iterator_t v73;
  io_iterator_t v74;
  time_t v75;
  io_iterator_t notification[2];
  char v77[16];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  *(void *)notification = 0LL;
  if (qword_100010218) {
    v8 = (os_log_s *)qword_100010218;
  }
  else {
    v8 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v8, "Going to discover services \n", a3, a4, a5, a6, a7, a8, v66);
  if (dword_100010220)
  {
    *(void *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v83 = v9;
    v84 = v9;
    v82 = v9;
    v80 = v9;
    v81 = v9;
    v78 = v9;
    v79 = v9;
    *(_OWORD *)v77 = v9;
    v75 = 0xAAAAAAAAAAAAAAAALL;
    time(&v75);
    v10 = localtime(&v75);
    strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v10);
    dprintf(dword_100010220, "%s ", v77);
    dprintf(dword_100010220, "Going to discover services \n");
  }

  v17 = IONotificationPortCreate(kIOMainPortDefault);
  if (qword_100010218) {
    v18 = (os_log_s *)qword_100010218;
  }
  else {
    v18 = (os_log_s *)&_os_log_default;
  }
  if (v17)
  {
    v71 = "com.apple.driver.AppleBCMWLANCore";
    sub_100008620( v18,  "Matching with -> Core match:'%s', Bundle ID match:'%s'\n",  v11,  v12,  v13,  v14,  v15,  v16,  (char)"AppleBCMWLANCore");
    if (dword_100010220)
    {
      *(void *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v83 = v19;
      v84 = v19;
      v82 = v19;
      v80 = v19;
      v81 = v19;
      v78 = v19;
      v79 = v19;
      *(_OWORD *)v77 = v19;
      v75 = 0xAAAAAAAAAAAAAAAALL;
      time(&v75);
      v20 = localtime(&v75);
      strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v20);
      dprintf(dword_100010220, "%s ", v77);
      dprintf( dword_100010220,  "Matching with -> Core match:'%s', Bundle ID match:'%s'\n",  "AppleBCMWLANCore",  "com.apple.driver.AppleBCMWLANCore");
    }

    RunLoopSource = IONotificationPortGetRunLoopSource(v17);
    v22 = IOServiceNameMatching("AppleBCMWLANCore");
    if (IOServiceAddMatchingNotification( v17,  "IOServiceFirstMatch",  v22,  (IOServiceMatchingCallback)sub_1000025B4,  notification,  &notification[1]))
    {
      if (qword_100010218) {
        v29 = (os_log_s *)qword_100010218;
      }
      else {
        v29 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v29, "Failed to add matching notification\n", v23, v24, v25, v26, v27, v28, v68);
      if (dword_100010220)
      {
        *(void *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v83 = v30;
        v84 = v30;
        v82 = v30;
        v80 = v30;
        v81 = v30;
        v78 = v30;
        v79 = v30;
        *(_OWORD *)v77 = v30;
        v75 = 0xAAAAAAAAAAAAAAAALL;
        time(&v75);
        v31 = localtime(&v75);
        strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v31);
        dprintf(dword_100010220, "%s ", v77);
        dprintf(dword_100010220, "Failed to add matching notification\n", v69, v71);
      }
    }

    else
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
      v35 = CFRunLoopGetCurrent();
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_100002CCC;
      block[3] = &unk_10000C3F8;
      v73 = notification[0];
      v74 = notification[1];
      CFRunLoopPerformBlock(v35, kCFRunLoopDefaultMode, block);
      if (qword_100010218) {
        v42 = (os_log_s *)qword_100010218;
      }
      else {
        v42 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v42, "Waiting for firmware to load\n", v36, v37, v38, v39, v40, v41, v68);
      if (dword_100010220)
      {
        *(void *)&v43 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v83 = v43;
        v84 = v43;
        v82 = v43;
        v80 = v43;
        v81 = v43;
        v78 = v43;
        v79 = v43;
        *(_OWORD *)v77 = v43;
        v75 = 0xAAAAAAAAAAAAAAAALL;
        time(&v75);
        v44 = localtime(&v75);
        strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v44);
        dprintf(dword_100010220, "%s ", v77);
        dprintf(dword_100010220, "Waiting for firmware to load\n");
      }

      if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 300.0, 0) == kCFRunLoopRunTimedOut)
      {
        v51 = qword_100010218 ? (os_log_s *)qword_100010218 : (os_log_s *)&_os_log_default;
        sub_100008620(v51, "Runloop timed out\n", v45, v46, v47, v48, v49, v50, v70);
        if (dword_100010220)
        {
          *(void *)&v52 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v83 = v52;
          v84 = v52;
          v82 = v52;
          v80 = v52;
          v81 = v52;
          v78 = v52;
          v79 = v52;
          *(_OWORD *)v77 = v52;
          v75 = 0xAAAAAAAAAAAAAAAALL;
          time(&v75);
          v53 = localtime(&v75);
          strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v53);
          dprintf(dword_100010220, "%s ", v77);
          dprintf(dword_100010220, "Runloop timed out\n");
        }
      }

      v54 = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(v54, RunLoopSource, kCFRunLoopDefaultMode);
      IONotificationPortDestroy(v17);
      v61 = dword_100010118 == 2 && dword_100010114 == 1 || dword_100010190 == 2 && dword_10001018C == 1;
      HIDWORD(qword_100010100) = v61;
      if (qword_100010218) {
        v63 = (os_log_s *)qword_100010218;
      }
      else {
        v63 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v63, "wifiFirmwareLoaderThread exiting with %d\n", v55, v56, v57, v58, v59, v60, v61);
      if (dword_100010220)
      {
        *(void *)&v64 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v83 = v64;
        v84 = v64;
        v82 = v64;
        v80 = v64;
        v81 = v64;
        v78 = v64;
        v79 = v64;
        *(_OWORD *)v77 = v64;
        v75 = 0xAAAAAAAAAAAAAAAALL;
        time(&v75);
        v65 = localtime(&v75);
        strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v65);
        dprintf(dword_100010220, "%s ", v77);
        dprintf(dword_100010220, "wifiFirmwareLoaderThread exiting with %d\n");
      }
    }
  }

  else
  {
    sub_100008620(v18, "Failed to create notification port\n", v11, v12, v13, v14, v15, v16, v67);
    if (dword_100010220)
    {
      *(void *)&v32 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v83 = v32;
      v84 = v32;
      v82 = v32;
      v80 = v32;
      v81 = v32;
      v78 = v32;
      v79 = v32;
      *(_OWORD *)v77 = v32;
      v75 = 0xAAAAAAAAAAAAAAAALL;
      time(&v75);
      v33 = localtime(&v75);
      strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v33);
      dprintf(dword_100010220, "%s ", v77);
      dprintf(dword_100010220, "Failed to create notification port\n");
    }
  }
}

uint64_t sub_1000025B4(io_registry_entry_t *a1, io_iterator_t a2)
{
  v2 = a1;
  v3 = &stru_100010000;
  while (1)
  {
    uint64_t result = IOIteratorNext(a2);
    if (!(_DWORD)result) {
      return result;
    }
    io_registry_entry_t v5 = result;
    __strlcpy_chk(&xmmword_100010011, "Unknown", 64LL, 64LL);
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty( v5,  @"DriverKitDriverPlatformType",  kCFAllocatorDefault,  0);
    if (CFProperty)
    {
      v7 = CFProperty;
      CFTypeID TypeID = CFStringGetTypeID();
      BOOL v9 = TypeID == CFGetTypeID(v7);
      v3 = &stru_100010000;
      if (v9)
      {
        xmmword_100010031 = 0u;
        unk_100010041 = 0u;
        xmmword_100010011 = 0u;
        unk_100010021 = 0u;
        CFIndex v78 = 0LL;
        v87.length = CFStringGetLength(v7);
        v87.location = 0LL;
        if (!CFStringGetBytes(v7, v87, 0x8000100u, 0, 0, (UInt8 *)&xmmword_100010011, 64LL, &v78))
        {
          v16 = qword_100010218 ? (os_log_s *)qword_100010218 : (os_log_s *)&_os_log_default;
          sub_100008620( v16,  "%s failed, no characters converted\n",  v10,  v11,  v12,  v13,  v14,  v15,  (char)"__serviceCallback");
          if (dword_100010220)
          {
            *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
            __int128 v85 = v17;
            __int128 v86 = v17;
            __int128 v83 = v17;
            __int128 v84 = v17;
            __int128 v81 = v17;
            __int128 v82 = v17;
            *(_OWORD *)v79 = v17;
            __int128 v80 = v17;
            time_t v77 = 0xAAAAAAAAAAAAAAAALL;
            time(&v77);
            v18 = localtime(&v77);
            strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v18);
            dprintf(dword_100010220, "%s ", v79);
            dprintf(dword_100010220, "%s failed, no characters converted\n", "__serviceCallback");
          }
        }

        CFRelease(v7);
      }
    }

    v19 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v5, @"DriverKitDriver", kCFAllocatorDefault, 0);
    if (v19)
    {
      v26 = v19;
      LOBYTE(v3[1].__sig) = CFBooleanGetValue(v19) != 0;
      CFRelease(v26);
    }

    if (qword_100010218) {
      v27 = (os_log_s *)qword_100010218;
    }
    else {
      v27 = (os_log_s *)&_os_log_default;
    }
    if (LOBYTE(v3[1].__sig))
    {
      sub_100008620(v27, "We are using driverkit driver\n", v20, v21, v22, v23, v24, v25, (char)usedBufLen);
      if (dword_100010220)
      {
        *(void *)&__int128 v28 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v85 = v28;
        __int128 v86 = v28;
        __int128 v83 = v28;
        __int128 v84 = v28;
        __int128 v81 = v28;
        __int128 v82 = v28;
        *(_OWORD *)v79 = v28;
        __int128 v80 = v28;
        CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v29 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v29);
        dprintf(dword_100010220, "%s ", v79);
        dprintf(dword_100010220, "We are using driverkit driver\n");
      }

      v36 = (const __CFString *)IORegistryEntryCreateCFProperty(v5, @"IOUserClass", kCFAllocatorDefault, 0);
      if (!v36)
      {
        if (qword_100010218) {
          v37 = (os_log_s *)qword_100010218;
        }
        else {
          v37 = (os_log_s *)&_os_log_default;
        }
        sub_100008620(v37, "Property read for %s returned NULL\n", v30, v31, v32, v33, v34, v35, (char)"IOUserClass");
        if (dword_100010220)
        {
          *(void *)&__int128 v38 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
          __int128 v85 = v38;
          __int128 v86 = v38;
          __int128 v83 = v38;
          __int128 v84 = v38;
          __int128 v81 = v38;
          __int128 v82 = v38;
          *(_OWORD *)v79 = v38;
          __int128 v80 = v38;
          CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
          time(&v78);
          v39 = localtime(&v78);
          strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v39);
          dprintf(dword_100010220, "%s ", v79);
          dprintf(dword_100010220, "Property read for %s returned NULL\n", "IOUserClass");
        }

        goto LABEL_51;
      }
    }

    else
    {
      sub_100008620(v27, "We are using IOKit driver\n", v20, v21, v22, v23, v24, v25, (char)usedBufLen);
      if (dword_100010220)
      {
        *(void *)&__int128 v40 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v85 = v40;
        __int128 v86 = v40;
        __int128 v83 = v40;
        __int128 v84 = v40;
        __int128 v81 = v40;
        __int128 v82 = v40;
        *(_OWORD *)v79 = v40;
        __int128 v80 = v40;
        CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v41 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v41);
        dprintf(dword_100010220, "%s ", v79);
        dprintf(dword_100010220, "We are using IOKit driver\n");
      }

      v36 = IOObjectCopyClass(v5);
      if (!v36) {
        goto LABEL_51;
      }
    }

    if (CFStringCompare(v36, @"AppleBCMWLANCore", 0LL) == kCFCompareEqualTo)
    {
      uint64_t v42 = qword_100010218;
      char CStringPtr = CFStringGetCStringPtr(v36, 0);
      v50 = (os_log_s *)&_os_log_default;
      if (v42) {
        v50 = (os_log_s *)v42;
      }
      sub_100008620(v50, "Matched class name '%s', starting ...\n", v44, v45, v46, v47, v48, v49, CStringPtr);
      if (dword_100010220)
      {
        *(void *)&__int128 v57 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v85 = v57;
        __int128 v86 = v57;
        __int128 v83 = v57;
        __int128 v84 = v57;
        __int128 v81 = v57;
        __int128 v82 = v57;
        *(_OWORD *)v79 = v57;
        __int128 v80 = v57;
        CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v58 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v58);
        dprintf(dword_100010220, "%s ", v79);
        int v59 = dword_100010220;
        v60 = CFStringGetCStringPtr(v36, 0);
        dprintf(v59, "Matched class name '%s', starting ...\n", v60);
      }

      if (qword_100010218) {
        v61 = (os_log_s *)qword_100010218;
      }
      else {
        v61 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v61, "%s()\n", v51, v52, v53, v54, v55, v56, (char)"startWiFiFirmwareLoaderService");
      if (dword_100010220)
      {
        *(void *)&__int128 v68 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v68 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v85 = v68;
        __int128 v86 = v68;
        __int128 v83 = v68;
        __int128 v84 = v68;
        __int128 v81 = v68;
        __int128 v82 = v68;
        *(_OWORD *)v79 = v68;
        __int128 v80 = v68;
        CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v69 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v69);
        dprintf(dword_100010220, "%s ", v79);
        usedBufLen = (CFIndex *)"startWiFiFirmwareLoaderService";
        dprintf(dword_100010220, "%s()\n");
      }

      v3 = &stru_100010000;
      if ((_DWORD)qword_100010100 == 2)
      {
        if (qword_100010218) {
          v70 = (os_log_s *)qword_100010218;
        }
        else {
          v70 = (os_log_s *)&_os_log_default;
        }
        sub_100008620(v70, "No free interface slot, ignoring service..", v62, v63, v64, v65, v66, v67, (char)usedBufLen);
        v2 = a1;
        if (dword_100010220)
        {
          *(void *)&__int128 v71 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v71 + 1) = 0xAAAAAAAAAAAAAAAALL;
          __int128 v85 = v71;
          __int128 v86 = v71;
          __int128 v83 = v71;
          __int128 v84 = v71;
          __int128 v81 = v71;
          __int128 v82 = v71;
          *(_OWORD *)v79 = v71;
          __int128 v80 = v71;
          CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
          time(&v78);
          v72 = localtime(&v78);
          strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v72);
          dprintf(dword_100010220, "%s ", v79);
          dprintf(dword_100010220, "No free interface slot, ignoring service..");
        }
      }

      else
      {
        if (qword_100010100 >= 2)
        {
          __break(0x5512u);
LABEL_55:
          __break(0x5513u);
LABEL_56:
          __break(0x5500u);
        }

        v2 = a1;
        v73 = (char *)&unk_100010058 + 120 * qword_100010100;
        *((_DWORD *)v73 + 48) = 1;
        *((_DWORD *)v73 + 46) = v5;
        pthread_create((pthread_t *)v73 + 22, 0LL, (void *(__cdecl *)(void *))sub_100002CDC, v73 + 176);
        if (__OFADD__((_DWORD)qword_100010100, 1)) {
          goto LABEL_56;
        }
        LODWORD(qword_100010100) = qword_100010100 + 1;
      }
    }

    CFRelease(v36);
LABEL_51:
    if (!*v2) {
      io_registry_entry_t *v2 = v5;
    }
  }

uint64_t sub_100002CCC(uint64_t a1)
{
  return sub_1000025B4((io_registry_entry_t *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

void sub_100002CDC(unint64_t a1)
{
  kern_return_t v505;
  os_log_s *v506;
  __int128 v507;
  tm *v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  os_log_s *v516;
  __int128 v517;
  tm *v518;
  os_log_s *v519;
  __int128 v520;
  tm *v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  os_log_s *v528;
  __int128 v529;
  tm *v530;
  IOPMAssertionID v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  IOReturn v538;
  os_log_s *v539;
  __int128 v540;
  tm *v541;
  const void *v542;
  const void *v543;
  const void *v544;
  const void *v545;
  const void *v546;
  const void *v547;
  const void *v548;
  const void *v549;
  const void *v550;
  io_object_t v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  kern_return_t v576;
  os_log_s *v577;
  __int128 v578;
  tm *v579;
  __int128 v580;
  tm *v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  os_log_s *v588;
  __int128 v589;
  tm *v590;
  os_log_s *v591;
  __int128 v592;
  tm *v593;
  os_log_s *v594;
  __int128 v595;
  tm *v596;
  os_log_s *v597;
  __int128 v598;
  tm *v599;
  os_log_s *v600;
  __int128 v601;
  tm *v602;
  char outputStruct;
  char outputStructa;
  char outputStructb;
  char outputStructc;
  char outputStructd;
  char outputStructe;
  io_registry_entry_t entry;
  CFURLRef v610;
  CFStringRef v611;
  CFStringRef v612;
  unint64_t v613;
  unint64_t v614;
  BOOL v615;
  CFStringRef v616;
  __CFReadStream *stream;
  io_registry_entry_t streama;
  CFAllocatorRef allocator;
  uint64_t v620;
  int v621;
  const char *v622;
  time_t valuePtr;
  time_t v624;
  CFIndex length;
  size_t __size[2];
  __int128 v627;
  _BYTE v628[32];
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 outputStructCnt;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  char cStr[32];
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  unint64_t v1 = a1;
  *(void *)(a1 + 12) = 0x100000001LL;
  if (byte_100010010) {
    v2 = @"/System/Library/DriverExtensions/com.apple.DriverKit-AppleBCMWLAN.dext/Firmware/";
  }
  else {
    v2 = @"/usr/share/firmware/wifi/";
  }
  v616 = v2;
  if (qword_1000100A8)
  {
    v3 = kCFAllocatorDefault;
    MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 255LL, (CFStringRef)qword_1000100A8);
    *(void *)(v1 + 112) = MutableCopy;
    if (!MutableCopy) {
      goto LABEL_15;
    }
    io_registry_entry_t v5 = *(_DWORD *)(v1 + 8);
    v662 = 0u;
    v663 = 0u;
    v660 = 0u;
    v661 = 0u;
    v658 = 0u;
    v659 = 0u;
    v656 = 0u;
    v657 = 0u;
    v654 = 0u;
    v655 = 0u;
    v652 = 0u;
    v653 = 0u;
    v650 = 0u;
    v651 = 0u;
    memset(cStr, 0, sizeof(cStr));
    __size[0] = 0LL;
    if (!v5) {
      goto LABEL_15;
    }
    if (!CFStringGetCStringPtr(MutableCopy, 0)) {
      goto LABEL_15;
    }
    char CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(v1 + 112), 0);
    __strlcpy_chk(cStr, CStringPtr, 255LL, 256LL);
    CFIndex v13 = __size[0];
    if (__size[0] - 0x2000 <= 0xFFFFFFFFFFFFE080LL)
    {
      if (qword_100010218) {
        v227 = (os_log_s *)qword_100010218;
      }
      else {
        v227 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v227, "msf cal file is too big or too small\n", v7, v8, v9, v10, v11, v12, outputStruct);
      if (dword_100010220)
      {
        *(void *)&__int128 v228 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v228 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v228;
        v640 = v228;
        v637 = v228;
        v638 = v228;
        v635 = v228;
        v636 = v228;
        outputStructCnt = v228;
        v634 = v228;
        length = 0xAAAAAAAAAAAAAAAALL;
        time(&length);
        v229 = localtime(&length);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v229);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "msf cal file is too big or too small\n");
      }
    }

    else
    {
      uint64_t v14 = (UInt8 *)malloc(__size[0]);
      if (v14)
      {
        uint64_t v21 = v14;
        length = v13;
        if ((sub_1000088DC(cStr, v14, &length) & 1) != 0)
        {
          CFDataRef v28 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v21, length, kCFAllocatorNull);
          if (v28)
          {
            CFDataRef v35 = v28;
            IORegistryEntrySetCFProperty(v5, @"WiFiMSFCal", v28);
            free(v21);
            CFRelease(v35);
            goto LABEL_15;
          }

          if (qword_100010218) {
            v236 = (os_log_s *)qword_100010218;
          }
          else {
            v236 = (os_log_s *)&_os_log_default;
          }
          sub_100008620(v236, "failed to create MSF Data Ref\n", v29, v30, v31, v32, v33, v34, outputStruct);
          if (dword_100010220)
          {
            *(void *)&__int128 v237 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v237 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v639 = v237;
            v640 = v237;
            v637 = v237;
            v638 = v237;
            v635 = v237;
            v636 = v237;
            outputStructCnt = v237;
            v634 = v237;
            v624 = 0xAAAAAAAAAAAAAAAALL;
            time(&v624);
            v238 = localtime(&v624);
            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v238);
            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
            dprintf(dword_100010220, "failed to create MSF Data Ref\n");
          }
        }

        else
        {
          if (qword_100010218) {
            v233 = (os_log_s *)qword_100010218;
          }
          else {
            v233 = (os_log_s *)&_os_log_default;
          }
          sub_100008620(v233, "copy MSF CAL failed\n", v22, v23, v24, v25, v26, v27, outputStruct);
          if (dword_100010220)
          {
            *(void *)&__int128 v234 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v234 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v639 = v234;
            v640 = v234;
            v637 = v234;
            v638 = v234;
            v635 = v234;
            v636 = v234;
            outputStructCnt = v234;
            v634 = v234;
            v624 = 0xAAAAAAAAAAAAAAAALL;
            time(&v624);
            v235 = localtime(&v624);
            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v235);
            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
            dprintf(dword_100010220, "copy MSF CAL failed\n");
          }
        }

        free(v21);
      }

      else
      {
        if (qword_100010218) {
          v230 = (os_log_s *)qword_100010218;
        }
        else {
          v230 = (os_log_s *)&_os_log_default;
        }
        sub_100008620(v230, "failed to alloc memory for msf cal\n", v15, v16, v17, v18, v19, v20, outputStruct);
        if (dword_100010220)
        {
          *(void *)&__int128 v231 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v231 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v639 = v231;
          v640 = v231;
          v637 = v231;
          v638 = v231;
          v635 = v231;
          v636 = v231;
          outputStructCnt = v231;
          v634 = v231;
          length = 0xAAAAAAAAAAAAAAAALL;
          time(&length);
          v232 = localtime(&length);
          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v232);
          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
          dprintf(dword_100010220, "failed to alloc memory for msf cal\n");
        }
      }
    }
  }

  else
  {
    *(void *)(a1 + 112) = 0LL;
    v3 = kCFAllocatorDefault;
  }

LABEL_15:
  if (qword_1000100A0) {
    CFMutableStringRef v36 = CFStringCreateMutableCopy(v3, 255LL, (CFStringRef)qword_1000100A0);
  }
  else {
    CFMutableStringRef v36 = 0LL;
  }
  *(void *)(v1 + 104) = v36;
  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(*(_DWORD *)(v1 + 8), @"FirmwareLoaded", v3, 0);
  if (CFProperty)
  {
    __int128 v38 = CFProperty;
    BOOL v39 = CFBooleanGetValue(CFProperty) != 0;
    CFRelease(v38);
  }

  else
  {
    BOOL v39 = 0;
  }

  io_registry_entry_t v40 = *(_DWORD *)(v1 + 8);
  length = 0LL;
  __size[0] = 0LL;
  *(void *)&__int128 v41 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v662 = v41;
  v663 = v41;
  v660 = v41;
  v661 = v41;
  v658 = v41;
  v659 = v41;
  v656 = v41;
  v657 = v41;
  v654 = v41;
  v655 = v41;
  v652 = v41;
  v653 = v41;
  v650 = v41;
  v651 = v41;
  *(_OWORD *)cStr = v41;
  *(_OWORD *)&cStr[16] = v41;
  uint64_t v42 = *(const __CFString **)(v1 + 104);
  allocator = v3;
  if (v42)
  {
    v43 = CFStringGetCStringPtr(v42, 0);
    __strlcpy_chk(cStr, v43, 255LL, 256LL);
    uint64_t v44 = 0LL;
  }

  else
  {
    uint64_t v45 = (const __CFString *)IORegistryEntryCreateCFProperty(v40, @"PlatformConfigFileName", v3, 0);
    if (!v45)
    {
      if (qword_100010218) {
        v239 = (os_log_s *)qword_100010218;
      }
      else {
        v239 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v239, "no PlatformConfigFileName in ioreg\n", v46, v47, v48, v49, v50, v51, outputStruct);
      if (dword_100010220)
      {
        *(void *)&__int128 v240 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v240 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v240;
        v640 = v240;
        v637 = v240;
        v638 = v240;
        v635 = v240;
        v636 = v240;
        outputStructCnt = v240;
        v634 = v240;
        v624 = 0xAAAAAAAAAAAAAAAALL;
        time(&v624);
        v241 = localtime(&v624);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v241);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        uint64_t v44 = 0LL;
        stream = 0LL;
        v95 = 0LL;
        v103 = 0LL;
        dprintf(dword_100010220, "no PlatformConfigFileName in ioreg\n");
        goto LABEL_173;
      }

      uint64_t v44 = 0LL;
      goto LABEL_177;
    }

    uint64_t v44 = v45;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(v44))
    {
      if (qword_100010218) {
        v242 = (os_log_s *)qword_100010218;
      }
      else {
        v242 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v242, "PlatformConfigFileName is not CFstring!\n", v53, v54, v55, v56, v57, v58, outputStruct);
      if (dword_100010220)
      {
        *(void *)&__int128 v243 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v243 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v243;
        v640 = v243;
        v637 = v243;
        v638 = v243;
        v635 = v243;
        v636 = v243;
        outputStructCnt = v243;
        v634 = v243;
        v624 = 0xAAAAAAAAAAAAAAAALL;
        time(&v624);
        v244 = localtime(&v624);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v244);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        stream = 0LL;
        v95 = 0LL;
        v103 = 0LL;
        dprintf(dword_100010220, "PlatformConfigFileName is not CFstring!\n");
        goto LABEL_173;
      }

      goto LABEL_177;
    }

    if (byte_100010010)
    {
      __strlcpy_chk( cStr,  "/System/Library/DriverExtensions/com.apple.DriverKit-AppleBCMWLAN.dext/PlatformConfig/",  255LL,  256LL);
      __strlcat_chk(cStr, &xmmword_100010011, 255LL, 256LL);
      __strlcat_chk(cStr, "/", 255LL, 256LL);
      if (qword_100010218) {
        uint64_t v65 = (os_log_s *)qword_100010218;
      }
      else {
        uint64_t v65 = (os_log_s *)&_os_log_default;
      }
      sub_100008620( v65,  "platformType:'%s' platformConfig path:'%s'\n",  v59,  v60,  v61,  v62,  v63,  v64,  (char)&xmmword_100010011);
      if (dword_100010220)
      {
        *(void *)&__int128 v66 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v66 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v66;
        v640 = v66;
        v637 = v66;
        v638 = v66;
        v635 = v66;
        v636 = v66;
        outputStructCnt = v66;
        v634 = v66;
        v624 = 0xAAAAAAAAAAAAAAAALL;
        time(&v624);
        uint64_t v67 = localtime(&v624);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v67);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "platformType:'%s' platformConfig path:'%s'\n", (const char *)&xmmword_100010011, cStr);
      }
    }

    else
    {
      __strlcpy_chk(cStr, "/usr/share/firmware/wifi/", 255LL, 256LL);
    }

    __int128 v68 = CFStringGetCStringPtr(v44, 0);
    __strlcat_chk(cStr, v68, 255LL, 256LL);
  }

  int v75 = sub_1000081C0(cStr, &length);
  if (qword_100010218) {
    v76 = (os_log_s *)qword_100010218;
  }
  else {
    v76 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v76, "config full name %s size %zu\n", v69, v70, v71, v72, v73, v74, (char)cStr);
  if (dword_100010220)
  {
    *(void *)&__int128 v83 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v83 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v639 = v83;
    v640 = v83;
    v637 = v83;
    v638 = v83;
    v635 = v83;
    v636 = v83;
    outputStructCnt = v83;
    v634 = v83;
    v624 = 0xAAAAAAAAAAAAAAAALL;
    time(&v624);
    __int128 v84 = localtime(&v624);
    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v84);
    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
    dprintf(dword_100010220, "config full name %s size %zu\n", cStr, length);
  }

  if (!v75)
  {
LABEL_177:
    v245 = 0LL;
    v95 = 0LL;
    goto LABEL_178;
  }

  if (qword_100010218) {
    __int128 v85 = (os_log_s *)qword_100010218;
  }
  else {
    __int128 v85 = (os_log_s *)&_os_log_default;
  }
  if ((unint64_t)(length - 0x2000) <= 0xFFFFFFFFFFFFE080LL)
  {
    sub_100008620(v85, "Platform config file is too big or too small\n", v77, v78, v79, v80, v81, v82, outputStructa);
    if (dword_100010220)
    {
      *(void *)&__int128 v202 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v202 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v202;
      v640 = v202;
      v637 = v202;
      v638 = v202;
      v635 = v202;
      v636 = v202;
      outputStructCnt = v202;
      v634 = v202;
      v624 = 0xAAAAAAAAAAAAAAAALL;
      time(&v624);
      v203 = localtime(&v624);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v203);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0LL;
      v95 = 0LL;
      v103 = 0LL;
      dprintf(dword_100010220, "Platform config file is too big or too small\n");
LABEL_173:
      v245 = stream;
      goto LABEL_179;
    }

    goto LABEL_177;
  }

  sub_100008620(v85, "config full name %s\n", v77, v78, v79, v80, v81, v82, (char)cStr);
  if (dword_100010220)
  {
    *(void *)&__int128 v86 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v86 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v639 = v86;
    v640 = v86;
    v637 = v86;
    v638 = v86;
    v635 = v86;
    v636 = v86;
    outputStructCnt = v86;
    v634 = v86;
    v624 = 0xAAAAAAAAAAAAAAAALL;
    time(&v624);
    CFRange v87 = localtime(&v624);
    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v87);
    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
    dprintf(dword_100010220, "config full name %s\n", cStr);
  }

  v88 = CFStringCreateWithCString(0LL, cStr, 0);
  if (!v88)
  {
    if (qword_100010218) {
      v204 = (os_log_s *)qword_100010218;
    }
    else {
      v204 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v204, "fail to create CFStringRef for file w path\n", v89, v90, v91, v92, v93, v94, outputStructb);
    if (dword_100010220)
    {
      *(void *)&__int128 v205 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v205 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v205;
      v640 = v205;
      v637 = v205;
      v638 = v205;
      v635 = v205;
      v636 = v205;
      outputStructCnt = v205;
      v634 = v205;
      v624 = 0xAAAAAAAAAAAAAAAALL;
      time(&v624);
      v206 = localtime(&v624);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v206);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0LL;
      v95 = 0LL;
      v103 = 0LL;
      dprintf(dword_100010220, "fail to create CFStringRef for file w path\n");
      goto LABEL_173;
    }

    goto LABEL_177;
  }

  v95 = v88;
  v96 = CFURLCreateWithFileSystemPath(v3, v88, kCFURLPOSIXPathStyle, 0);
  if (!v96)
  {
    if (qword_100010218) {
      v207 = (os_log_s *)qword_100010218;
    }
    else {
      v207 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v207, "fail to create fileURL\n", v97, v98, v99, v100, v101, v102, outputStructb);
    if (dword_100010220)
    {
      *(void *)&__int128 v208 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v208 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v208;
      v640 = v208;
      v637 = v208;
      v638 = v208;
      v635 = v208;
      v636 = v208;
      outputStructCnt = v208;
      v634 = v208;
      v624 = 0xAAAAAAAAAAAAAAAALL;
      time(&v624);
      v209 = localtime(&v624);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v209);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0LL;
      v103 = 0LL;
      dprintf(dword_100010220, "fail to create fileURL\n");
      goto LABEL_173;
    }

    v245 = 0LL;
LABEL_178:
    v103 = 0LL;
    goto LABEL_179;
  }

  v103 = v96;
  v104 = CFReadStreamCreateWithFile(v3, v96);
  if (!v104)
  {
    if (qword_100010218) {
      v210 = (os_log_s *)qword_100010218;
    }
    else {
      v210 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v210, "fail to create fileStream\n", v105, v106, v107, v108, v109, v110, outputStructb);
    if (dword_100010220)
    {
      *(void *)&__int128 v211 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v211 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v211;
      v640 = v211;
      v637 = v211;
      v638 = v211;
      v635 = v211;
      v636 = v211;
      outputStructCnt = v211;
      v634 = v211;
      v624 = 0xAAAAAAAAAAAAAAAALL;
      time(&v624);
      v212 = localtime(&v624);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v212);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0LL;
      dprintf(dword_100010220, "fail to create fileStream\n");
      goto LABEL_173;
    }

    v245 = 0LL;
LABEL_179:
    LOBYTE(v153) = 0;
    v126 = 0LL;
    v152 = 0LL;
    stream = v245;
    BOOL v198 = v245 != 0LL;
    if (!v44) {
      goto LABEL_181;
    }
    goto LABEL_180;
  }

  v111 = v104;
  int v112 = CFReadStreamOpen(v104);
  stream = v111;
  if (!v112)
  {
    if (qword_100010218) {
      v213 = (os_log_s *)qword_100010218;
    }
    else {
      v213 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v213, "fail to open fileStream\n", v113, v114, v115, v116, v117, v118, outputStructb);
    if (dword_100010220)
    {
      *(void *)&__int128 v214 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v214 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v214;
      v640 = v214;
      v637 = v214;
      v638 = v214;
      v635 = v214;
      v636 = v214;
      outputStructCnt = v214;
      v634 = v214;
      v624 = 0xAAAAAAAAAAAAAAAALL;
      time(&v624);
      v215 = localtime(&v624);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v215);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "fail to open fileStream\n");
    }

    goto LABEL_173;
  }

  int v119 = v112;
  entry = v40;
  v126 = (pthread_once_t *)CFPropertyListCreateWithStream(v3, v111, 0LL, 2uLL, 0LL, (CFErrorRef *)__size);
  if (!v126)
  {
    CFReadStreamClose(v111);
LABEL_132:
    LOBYTE(v153) = 0;
    v152 = 0LL;
    goto LABEL_91;
  }

  if (qword_100010218) {
    v127 = (os_log_s *)qword_100010218;
  }
  else {
    v127 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v127, "Setting property list  errorCode:%d, status:%u\n", v120, v121, v122, v123, v124, v125, 0);
  if (dword_100010220)
  {
    *(void *)&__int128 v134 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v134 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v639 = v134;
    v640 = v134;
    v637 = v134;
    v638 = v134;
    v635 = v134;
    v636 = v134;
    outputStructCnt = v134;
    v634 = v134;
    v624 = 0xAAAAAAAAAAAAAAAALL;
    time(&v624);
    v135 = localtime(&v624);
    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v135);
    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
    dprintf(dword_100010220, "Setting property list  errorCode:%d, status:%u\n", 0, v119);
  }

  if (__size[0])
  {
    if (qword_100010218) {
      v216 = (os_log_s *)qword_100010218;
    }
    else {
      v216 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v216, "fail to create property list\n", v128, v129, v130, v131, v132, v133, outputStructc);
    if (dword_100010220)
    {
      *(void *)&__int128 v217 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v217 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v217;
      v640 = v217;
      v637 = v217;
      v638 = v217;
      v635 = v217;
      v636 = v217;
      outputStructCnt = v217;
      v634 = v217;
      v624 = 0xAAAAAAAAAAAAAAAALL;
      time(&v624);
      v218 = localtime(&v624);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v218);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "fail to create property list\n");
    }

    goto LABEL_132;
  }

  CFTypeID v136 = CFDictionaryGetTypeID();
  if (v136 != CFGetTypeID(v126))
  {
    if (qword_100010218) {
      v219 = (os_log_s *)qword_100010218;
    }
    else {
      v219 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v219, "Propery list is not CFDictionary!\n", v137, v138, v139, v140, v141, v142, outputStructc);
    if (dword_100010220)
    {
      *(void *)&__int128 v220 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v220 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v220;
      v640 = v220;
      v637 = v220;
      v638 = v220;
      v635 = v220;
      v636 = v220;
      outputStructCnt = v220;
      v634 = v220;
      v624 = 0xAAAAAAAAAAAAAAAALL;
      time(&v624);
      v221 = localtime(&v624);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v221);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "Propery list is not CFDictionary!\n");
    }

    goto LABEL_132;
  }

  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)v126);
  unsigned int v144 = Count;
  v612 = v44;
  if (Count << 32 < 0)
  {
LABEL_557:
    __break(0x550Cu);
    return;
  }

  v145 = (const void **)malloc((8 * Count) & 0x7FFFFFFFFLL);
  if (v145)
  {
    v152 = v145;
    v610 = v103;
    v611 = v95;
    v613 = v1;
    CFDictionaryGetKeysAndValues((CFDictionaryRef)v126, v145, 0LL);
    int v153 = 0;
    CFIndex v154 = 0LL;
    v620 = v144;
    unint64_t v1 = ~(unint64_t)v152;
    while (v154 < CFDictionaryGetCount((CFDictionaryRef)v126))
    {
      if (v1 < 8 * v154)
      {
        __break(0x5513u);
LABEL_539:
        __break(1u);
        goto LABEL_540;
      }

      if (v154 == v620) {
        goto LABEL_539;
      }
      int v161 = v153;
      v162 = v126;
      v163 = (int *)v152;
      v164 = CFStringGetCStringPtr((CFStringRef)v152[v154], 0);
      uint64_t v165 = 0LL;
      uint64_t v166 = qword_100010218;
      do
      {
        if (!strcmp(v164, off_10000C458[v165])) {
          break;
        }
        ++v165;
      }

      while (v165 != 50);
      if (v166) {
        v173 = (os_log_s *)v166;
      }
      else {
        v173 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v173, "%5ld: %s allow: %d\n", v167, v168, v169, v170, v171, v172, v154);
      if (dword_100010220)
      {
        *(void *)&__int128 v174 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v174 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v174;
        v640 = v174;
        v637 = v174;
        v638 = v174;
        v635 = v174;
        v636 = v174;
        outputStructCnt = v174;
        v634 = v174;
        v624 = 0xAAAAAAAAAAAAAAAALL;
        time(&v624);
        v175 = localtime(&v624);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v175);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        unint64_t v176 = 0LL;
        int v177 = dword_100010220;
        BOOL v178 = 1;
        do
        {
          if (!strcmp(v164, off_10000C458[v176])) {
            break;
          }
          BOOL v178 = v176++ < 0x31;
        }

        while (v176 != 50);
        dprintf(v177, "%5ld: %s allow: %d\n", v154, v164, v178);
      }

      unint64_t v179 = 0LL;
      BOOL v180 = 1;
      do
      {
        if (!strcmp(v164, off_10000C458[v179])) {
          break;
        }
        BOOL v180 = v179++ < 0x31;
      }

      while (v179 != 50);
      v126 = v162;
      if (!v180)
      {
        if (qword_100010218) {
          v199 = (os_log_s *)qword_100010218;
        }
        else {
          v199 = (os_log_s *)&_os_log_default;
        }
        sub_100008620(v199, "key not in allowList\n", v181, v182, v183, v184, v185, v186, outputStructc);
        LOBYTE(v153) = v161;
        v152 = (const void **)v163;
        if (dword_100010220)
        {
          *(void *)&__int128 v200 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v200 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v639 = v200;
          v640 = v200;
          v637 = v200;
          v638 = v200;
          v635 = v200;
          v636 = v200;
          outputStructCnt = v200;
          v634 = v200;
          v624 = 0xAAAAAAAAAAAAAAAALL;
          time(&v624);
          v201 = localtime(&v624);
          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v201);
          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
          dprintf(dword_100010220, "key not in allowList\n");
        }

        uint64_t v44 = v612;
        unint64_t v1 = v613;
        v3 = allocator;
LABEL_90:
        v103 = v610;
        v95 = v611;
        goto LABEL_91;
      }

      if (!strncmp(v164, "wlan.is.fdr.cal", 0x10uLL)) {
        int v153 = 1;
      }
      else {
        int v153 = v161;
      }
      ++v154;
      v152 = (const void **)v163;
    }

    CFTypeID v187 = CFDictionaryGetTypeID();
    CFTypeID v194 = CFGetTypeID(v126);
    if (qword_100010218) {
      v195 = (os_log_s *)qword_100010218;
    }
    else {
      v195 = (os_log_s *)&_os_log_default;
    }
    uint64_t v44 = v612;
    if (v187 == v194)
    {
      sub_100008620(v195, "%s isFdrCal %d\n", v188, v189, v190, v191, v192, v193, (char)"writePlatformConfig");
      unint64_t v1 = v613;
      v3 = allocator;
      if (dword_100010220)
      {
        *(void *)&__int128 v196 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v196 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v196;
        v640 = v196;
        v637 = v196;
        v638 = v196;
        v635 = v196;
        v636 = v196;
        outputStructCnt = v196;
        v634 = v196;
        v624 = 0xAAAAAAAAAAAAAAAALL;
        time(&v624);
        v197 = localtime(&v624);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v197);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "%s isFdrCal %d\n", "writePlatformConfig", v153);
      }

      IORegistryEntrySetCFProperty(entry, @"PlatformConfig", v126);
      goto LABEL_90;
    }

    sub_100008620(v195, "Propery list is not CFDictionary!\n", v188, v189, v190, v191, v192, v193, outputStructc);
    unint64_t v1 = v613;
    v3 = allocator;
    v103 = v610;
    v95 = v611;
    if (dword_100010220)
    {
      *(void *)&__int128 v225 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v225 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v225;
      v640 = v225;
      v637 = v225;
      v638 = v225;
      v635 = v225;
      v636 = v225;
      outputStructCnt = v225;
      v634 = v225;
      v624 = 0xAAAAAAAAAAAAAAAALL;
      time(&v624);
      v226 = localtime(&v624);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v226);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "Propery list is not CFDictionary!\n");
    }
  }

  else
  {
    if (qword_100010218) {
      v222 = (os_log_s *)qword_100010218;
    }
    else {
      v222 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v222, "fail to allocate memory for keys\n", v146, v147, v148, v149, v150, v151, outputStructc);
    if (dword_100010220)
    {
      *(void *)&__int128 v223 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v223 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v223;
      v640 = v223;
      v637 = v223;
      v638 = v223;
      v635 = v223;
      v636 = v223;
      outputStructCnt = v223;
      v634 = v223;
      v624 = 0xAAAAAAAAAAAAAAAALL;
      time(&v624);
      v224 = localtime(&v624);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v224);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "fail to allocate memory for keys\n");
    }

    LOBYTE(v153) = 0;
    v152 = 0LL;
  }

LABEL_91:
  CFReadStreamClose(stream);
  BOOL v198 = 1;
  if (v44) {
LABEL_180:
  }
    CFRelease(v44);
LABEL_181:
  if (v95) {
    CFRelease(v95);
  }
  if (v103) {
    CFRelease(v103);
  }
  if (v198) {
    CFRelease(stream);
  }
  if (__size[0]) {
    CFRelease((CFTypeRef)__size[0]);
  }
  __size[0] = 0LL;
  if (v126) {
    CFRelease(v126);
  }
  if (v152) {
    free(v152);
  }
  io_service_t v246 = *(_DWORD *)(v1 + 8);
  if (!qword_100010210) {
    pthread_once(&stru_100010000, (void (*)(void))sub_100007F9C);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(0LL);
  v126 = &stru_100010000;
  if (!Instance) {
    goto LABEL_528;
  }
  uint64_t v254 = Instance;
  *(void *)(Instance + 20) = 0LL;
  v255 = (mach_port_t *)(Instance + 20);
  *(_DWORD *)(Instance + 16) = v246;
  if (IOServiceOpen(v246, mach_task_self_, 0x57694669u, (io_connect_t *)(Instance + 20))
    || IOConnectCallScalarMethod(*v255, 0, 0LL, 0, 0LL, 0LL))
  {
    CFRelease((CFTypeRef)v254);
LABEL_528:
    *(void *)(v1 + 24) = 0LL;
    goto LABEL_453;
  }

  *(_BYTE *)(v254 + 24) = 1;
  *(void *)(v1 + 24) = v254;
  CFTypeRef v256 = IORegistryEntryCreateCFProperty(*(_DWORD *)(v254 + 16), @"RequestedFiles", v3, 0);
  *(void *)(v1 + 32) = v256;
  if (!v256) {
    goto LABEL_453;
  }
  *(void *)(v1 + 40) = IORegistryEntryCreateCFProperty( *(_DWORD *)(*(void *)(v1 + 24) + 16LL),  @"FileExtensions",  v3,  0);
  v257 = (const __CFDictionary *)IORegistryEntryCreateCFProperty( *(_DWORD *)(*(void *)(v1 + 24) + 16LL),  @"RequestedFilesOverride",  v3,  0);
  *(void *)(v1 + 48) = v257;
  v258 = *(const __CFArray **)(v1 + 32);
  if (v257)
  {
    Value = (const __CFData *)CFDictionaryGetValue(v257, @"wifi-fw-path");
    v260 = (const __CFString *)*((void *)&xmmword_100010070 + 1);
    if (!*((void *)&xmmword_100010070 + 1))
    {
      v261 = Value;
      if (Value)
      {
        CFTypeID v262 = CFGetTypeID(Value);
        if (v262 == CFDataGetTypeID())
        {
          v263 = CFStringCreateFromExternalRepresentation(v3, v261, 0);
          goto LABEL_207;
        }
      }

      goto LABEL_206;
    }

LABEL_205:
    v263 = CFStringCreateMutableCopy(v3, 255LL, v260);
    goto LABEL_207;
  }

  v260 = (const __CFString *)*((void *)&xmmword_100010070 + 1);
  if (*((void *)&xmmword_100010070 + 1)) {
    goto LABEL_205;
  }
LABEL_206:
  v263 = sub_1000090F0(v258, @"Firmware", dword_1000100E8, v616);
LABEL_207:
  v270 = v263;
  if (BYTE1(dword_1000100B0))
  {
    v271 = CFStringGetCStringPtr(v263, 0);
    v272 = "";
    if (v271) {
      v272 = v271;
    }
    fprintf(__stdoutp, "Resolved to Firmware file path: %s\n", v272);
  }

  *(void *)(v1 + 64) = v270;
  if (!v270)
  {
    IOConnectCallScalarMethod(*(_DWORD *)(*(void *)(v1 + 24) + 20LL), 4u, 0LL, 0, 0LL, 0LL);
    goto LABEL_453;
  }

  if (qword_100010218) {
    v273 = (os_log_s *)qword_100010218;
  }
  else {
    v273 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v273, "%s: enter\n", v264, v265, v266, v267, v268, v269, (char)"handleFdr");
  v152 = (const void **)&stru_100010000;
  if (dword_100010220)
  {
    *(void *)&__int128 v280 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v280 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v654 = v280;
    v655 = v280;
    v652 = v280;
    v653 = v280;
    v650 = v280;
    v651 = v280;
    *(_OWORD *)cStr = v280;
    *(_OWORD *)&cStr[16] = v280;
    *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&outputStructCnt);
    v281 = localtime((const time_t *)&outputStructCnt);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v281);
    dprintf(dword_100010220, "%s ", cStr);
    dprintf(dword_100010220, "%s: enter\n", "handleFdr");
  }

  if ((_BYTE)v153)
  {
    if (qword_100010218) {
      v282 = (os_log_s *)qword_100010218;
    }
    else {
      v282 = (os_log_s *)&_os_log_default;
    }
    if (BYTE1(dword_1000100B0))
    {
      sub_100008620( v282,  "%s: showFilesOnly mode does not need FDR.\n",  v274,  v275,  v276,  v277,  v278,  v279,  (char)"handleFdr");
      if (dword_100010220)
      {
        *(void *)&__int128 v289 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v289 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v654 = v289;
        v655 = v289;
        v652 = v289;
        v653 = v289;
        v650 = v289;
        v651 = v289;
        *(_OWORD *)cStr = v289;
        *(_OWORD *)&cStr[16] = v289;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v290 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v290);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "%s: showFilesOnly mode does not need FDR.\n");
      }

      goto LABEL_295;
    }

    sub_100008620(v282, "%s enter\n", v274, v275, v276, v277, v278, v279, (char)"getFDRCal");
    if (dword_100010220)
    {
      *(void *)&__int128 v300 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v300 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v654 = v300;
      v655 = v300;
      v652 = v300;
      v653 = v300;
      v650 = v300;
      v651 = v300;
      *(_OWORD *)cStr = v300;
      *(_OWORD *)&cStr[16] = v300;
      *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&outputStructCnt);
      v301 = localtime((const time_t *)&outputStructCnt);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v301);
      dprintf(dword_100010220, "%s ", cStr);
      dprintf(dword_100010220, "%s enter\n", "getFDRCal");
    }

    LODWORD(v624) = 0;
    if (qword_100010218) {
      v302 = (os_log_s *)qword_100010218;
    }
    else {
      v302 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v302, "%s enter\n", v294, v295, v296, v297, v298, v299, (char)"findHwIdentifiersPolling");
    *(void *)&__int128 v303 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v303 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v654 = v303;
    v655 = v303;
    v652 = v303;
    v653 = v303;
    v650 = v303;
    v651 = v303;
    *(_OWORD *)cStr = v303;
    *(_OWORD *)&cStr[16] = v303;
    if (dword_100010220)
    {
      v639 = v303;
      v640 = v303;
      v637 = v303;
      v638 = v303;
      v635 = v303;
      v636 = v303;
      outputStructCnt = v303;
      v634 = v303;
      __size[0] = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)__size);
      v304 = localtime((const time_t *)__size);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v304);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "%s enter\n", "findHwIdentifiersPolling");
    }

    streama = IORegistryGetRootEntry(kIOMainPortDefault);
    v615 = v39;
    if (!streama || IORegistryCreateIterator(kIOMainPortDefault, "IOService", 0, (io_iterator_t *)&v624))
    {
      v621 = 1;
      v126 = &stru_100010000;
    }

    else
    {
      v614 = v1;
      int v311 = 1;
      v621 = 1;
      while (1)
      {
        io_object_t v312 = IOIteratorNext(v624);
        if (!v312) {
          break;
        }
        io_registry_entry_t v313 = v312;
        strcpy(cStr, "IOPlatformExpertDevice");
        if (IOObjectConformsTo(v312, cStr))
        {
          do
          {
            if (qword_100010218) {
              v320 = (os_log_s *)qword_100010218;
            }
            else {
              v320 = (os_log_s *)&_os_log_default;
            }
            sub_100008620( v320,  "%s Find HWIdentifiers...%d\n",  v314,  v315,  v316,  v317,  v318,  v319,  (char)"findHwIdentifiersPolling");
            if (dword_100010220)
            {
              *(void *)&__int128 v321 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v321 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v639 = v321;
              v640 = v321;
              v637 = v321;
              v638 = v321;
              v635 = v321;
              v636 = v321;
              outputStructCnt = v321;
              v634 = v321;
              __size[0] = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)__size);
              v322 = localtime((const time_t *)__size);
              strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v322);
              dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
              dprintf(dword_100010220, "%s Find HWIdentifiers...%d\n", "findHwIdentifiersPolling", v311);
            }

            v323 = (const __CFDictionary *)IORegistryEntrySearchCFProperty( v313,  "IOService",  @"HWIdentifiers",  allocator,  1u);
            v324 = v323;
            if (v311 <= 2 && !v323) {
              usleep(0x222E0u);
            }
            int v325 = v311 + 1;
            if (__OFADD__(v311, 1)) {
              __break(0x5500u);
            }
            if (v325 > 3) {
              break;
            }
            ++v311;
          }

          while (!v324);
          if (v324)
          {
            v326 = (const __CFString *)CFDictionaryGetValue(v324, @"P");
            *(void *)&__int128 v327 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v327 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)&v628[12] = v327;
            v627 = v327;
            *(_OWORD *)v628 = v327;
            *(_OWORD *)__size = v327;
            CFStringGetCString(v326, (char *)__size, 60LL, 0x8000100u);
            v328 = (const __CFNumber *)CFDictionaryGetValue(v324, @"C");
            LODWORD(valuePtr) = -1431655766;
            CFNumberGetValue(v328, kCFNumberIntType, &valuePtr);
            if (qword_100010218) {
              v335 = (os_log_s *)qword_100010218;
            }
            else {
              v335 = (os_log_s *)&_os_log_default;
            }
            sub_100008620( v335,  "%s HWIdentifiers: chipNumber %d platformName %s\n",  v329,  v330,  v331,  v332,  v333,  v334,  (char)"findHwIdentifiersPolling");
            if (dword_100010220)
            {
              *(void *)&__int128 v336 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v336 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v639 = v336;
              v640 = v336;
              v637 = v336;
              v638 = v336;
              v635 = v336;
              v636 = v336;
              outputStructCnt = v336;
              v634 = v336;
              length = 0xAAAAAAAAAAAAAAAALL;
              time(&length);
              v337 = localtime(&length);
              strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v337);
              dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
              dprintf( dword_100010220,  "%s HWIdentifiers: chipNumber %d platformName %s\n",  "findHwIdentifiersPolling",  valuePtr,  (const char *)__size);
            }

            v621 = 0;
          }

          else
          {
            if (qword_100010218) {
              v338 = (os_log_s *)qword_100010218;
            }
            else {
              v338 = (os_log_s *)&_os_log_default;
            }
            sub_100008620( v338,  "%s No %s in ioreg\n",  v314,  v315,  v316,  v317,  v318,  v319,  (char)"findHwIdentifiersPolling");
            if (dword_100010220)
            {
              *(void *)&__int128 v339 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v339 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v639 = v339;
              v640 = v339;
              v637 = v339;
              v638 = v339;
              v635 = v339;
              v636 = v339;
              outputStructCnt = v339;
              v634 = v339;
              __size[0] = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)__size);
              v340 = localtime((const time_t *)__size);
              strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v340);
              dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
              dprintf(dword_100010220, "%s No %s in ioreg\n", "findHwIdentifiersPolling", "HWIdentifiers");
            }
          }

          IOObjectRelease(v313);
          int v311 = v325;
        }
      }

      unint64_t v1 = v614;
      if (v311 >= 3) {
        IORegistryEntrySetCFProperty(*(_DWORD *)(v614 + 8), @"HWIdentifiersLate", kCFBooleanTrue);
      }
      v3 = allocator;
      v126 = &stru_100010000;
      v152 = (const void **)&stru_100010000;
    }

    if ((_DWORD)v624) {
      IOObjectRelease(v624);
    }
    if (streama) {
      IOObjectRelease(streama);
    }
    if (!v621)
    {
      if (qword_100010218) {
        v446 = (os_log_s *)qword_100010218;
      }
      else {
        v446 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v446, "%s dataClass %s\n", v305, v306, v307, v308, v309, v310, (char)"getFDRCal");
      if (dword_100010220)
      {
        *(void *)&__int128 v447 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v447 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v654 = v447;
        v655 = v447;
        v652 = v447;
        v653 = v447;
        v650 = v447;
        v651 = v447;
        *(_OWORD *)cStr = v447;
        *(_OWORD *)&cStr[16] = v447;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v448 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v448);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "%s dataClass %s\n", "getFDRCal", "BWCl");
      }

      CFStringRef v449 = CFStringCreateWithCString(0LL, "BWCl", 0);
      *(void *)&outputStructCnt = 0LL;
      v456 = (const __CFDictionary *)AMFDRSealingMapCopyLocalDictForClass(v449, 0LL, &outputStructCnt);
      v457 = (const void *)outputStructCnt;
      int v458 = 1;
      v126 = &stru_100010000;
      if (v456 && !(void)outputStructCnt)
      {
        if (qword_100010218) {
          v459 = (os_log_s *)qword_100010218;
        }
        else {
          v459 = (os_log_s *)&_os_log_default;
        }
        sub_100008620(v459, "%s successful fdr\n", v450, v451, v452, v453, v454, v455, (char)"getFDRCal");
        if (dword_100010220)
        {
          *(void *)&__int128 v460 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v460 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v654 = v460;
          v655 = v460;
          v652 = v460;
          v653 = v460;
          v650 = v460;
          v651 = v460;
          *(_OWORD *)cStr = v460;
          *(_OWORD *)&cStr[16] = v460;
          __size[0] = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)__size);
          v461 = localtime((const time_t *)__size);
          strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v461);
          dprintf(dword_100010220, "%s ", cStr);
          dprintf(dword_100010220, "%s successful fdr\n", "getFDRCal");
        }

        v468 = CFDictionaryGetValue(v456, @"WCAL");
        if (qword_100010218) {
          v469 = (os_log_s *)qword_100010218;
        }
        else {
          v469 = (os_log_s *)&_os_log_default;
        }
        if (v468)
        {
          sub_100008620(v469, "%s add fdr cal\n", v462, v463, v464, v465, v466, v467, (char)"getFDRCal");
          if (dword_100010220)
          {
            *(void *)&__int128 v470 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v470 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v654 = v470;
            v655 = v470;
            v652 = v470;
            v653 = v470;
            v650 = v470;
            v651 = v470;
            *(_OWORD *)cStr = v470;
            *(_OWORD *)&cStr[16] = v470;
            __size[0] = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)__size);
            v471 = localtime((const time_t *)__size);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v471);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s add fdr cal\n", "getFDRCal");
          }

          IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), @"WiFiFdrCal", v468);
          int v458 = 0;
        }

        else
        {
          sub_100008620(v469, "%s failed dict get value\n", v462, v463, v464, v465, v466, v467, (char)"getFDRCal");
          if (dword_100010220)
          {
            *(void *)&v580 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v580 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v654 = v580;
            v655 = v580;
            v652 = v580;
            v653 = v580;
            v650 = v580;
            v651 = v580;
            *(_OWORD *)cStr = v580;
            *(_OWORD *)&cStr[16] = v580;
            __size[0] = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)__size);
            v581 = localtime((const time_t *)__size);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v581);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s failed dict get value\n", "getFDRCal");
          }

          int v458 = 1;
        }

        BOOL v39 = v615;
        v457 = (const void *)outputStructCnt;
      }

      if (v457) {
        CFRelease(v457);
      }
      *(void *)&outputStructCnt = 0LL;
      if (v449) {
        CFRelease(v449);
      }
      if (v456) {
        CFRelease(v456);
      }
      CFRelease(@"WCAL");
      if (!v458)
      {
        v355 = "fdr";
        goto LABEL_288;
      }

      if (qword_100010218) {
        v588 = (os_log_s *)qword_100010218;
      }
      else {
        v588 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v588, "%s failed\n", v582, v583, v584, v585, v586, v587, (char)"getFDRCal");
      if (dword_100010220)
      {
        *(void *)&v589 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v589 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v654 = v589;
        v655 = v589;
        v652 = v589;
        v653 = v589;
        v650 = v589;
        v651 = v589;
        *(_OWORD *)cStr = v589;
        *(_OWORD *)&cStr[16] = v589;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v590 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v590);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "%s failed\n", "getFDRCal");
      }
    }

    v662 = 0u;
    v663 = 0u;
    v660 = 0u;
    v661 = 0u;
    v658 = 0u;
    v659 = 0u;
    v656 = 0u;
    v657 = 0u;
    v654 = 0u;
    v655 = 0u;
    v652 = 0u;
    v653 = 0u;
    v650 = 0u;
    v651 = 0u;
    memset(cStr, 0, sizeof(cStr));
    length = 0LL;
    v647 = 0u;
    v648 = 0u;
    v645 = 0u;
    v646 = 0u;
    v643 = 0u;
    v644 = 0u;
    v641 = 0u;
    v642 = 0u;
    v639 = 0u;
    v640 = 0u;
    v637 = 0u;
    v638 = 0u;
    v635 = 0u;
    v636 = 0u;
    outputStructCnt = 0u;
    v634 = 0u;
    if (byte_100010010)
    {
LABEL_287:
      v355 = "genCal";
      goto LABEL_288;
    }

    if (!sub_10000686C(v1, cStr, "cal")
      && sub_1000081C0(cStr, &length)
      && (CFIndex v341 = length, (unint64_t)(length - 0x2000) >= 0xFFFFFFFFFFFFE081LL)
      && (v342 = (UInt8 *)malloc(length)) != 0LL)
    {
      v343 = v342;
      v624 = v341;
      if (sub_1000088DC(cStr, v342, &v624))
      {
        CFDataRef v344 = CFDataCreateWithBytesNoCopy(v3, v343, v624, kCFAllocatorNull);
        if (v344)
        {
          CFDataRef v351 = v344;
          if (qword_100010218) {
            v352 = (os_log_s *)qword_100010218;
          }
          else {
            v352 = (os_log_s *)&_os_log_default;
          }
          sub_100008620( v352,  "%s writes %s size %zu to %s\n",  v345,  v346,  v347,  v348,  v349,  v350,  (char)"getGenericCalibrationData");
          if (dword_100010220)
          {
            *(void *)&__int128 v353 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v353 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v632 = v353;
            v630 = v353;
            v631 = v353;
            *(_OWORD *)&v628[16] = v353;
            v629 = v353;
            v627 = v353;
            *(_OWORD *)v628 = v353;
            *(_OWORD *)__size = v353;
            valuePtr = 0xAAAAAAAAAAAAAAAALL;
            time(&valuePtr);
            v354 = localtime(&valuePtr);
            strftime((char *)__size, 0x80uLL, "%b %d %H:%M:%S", v354);
            dprintf(dword_100010220, "%s ", (const char *)__size);
            dprintf( dword_100010220,  "%s writes %s size %zu to %s\n",  "getGenericCalibrationData",  cStr,  length,  "wifi-calibration-gen");
          }

          IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), @"WiFiGenericCal", v351);
          v152 = (const void **)&stru_100010000;
          v126 = &stru_100010000;
          if (!sub_10000686C(v1, (char *)&outputStructCnt, "clmb"))
          {
            HIBYTE(dword_1000100B0) = 1;
            qword_100010088 = (uint64_t)CFStringCreateWithCString(0LL, (const char *)&outputStructCnt, 0);
            free(v343);
            goto LABEL_287;
          }
        }
      }

      free(v343);
      v355 = "unavailable";
    }

    else
    {
      v355 = "unavailable";
    }

LABEL_288:
    size_t v356 = strlen(v355);
    CFStringRef v363 = CFStringCreateWithBytes(v3, (const UInt8 *)v355, v356, 0x8000100u, 0);
    if (qword_100010218) {
      v364 = (os_log_s *)qword_100010218;
    }
    else {
      v364 = (os_log_s *)&_os_log_default;
    }
    if (v363)
    {
      sub_100008620(v364, "%s add msfSource %s\n", v357, v358, v359, v360, v361, v362, (char)"handleFdr");
      if (dword_100010220)
      {
        *(void *)&__int128 v365 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v365 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v654 = v365;
        v655 = v365;
        v652 = v365;
        v653 = v365;
        v650 = v365;
        v651 = v365;
        *(_OWORD *)cStr = v365;
        *(_OWORD *)&cStr[16] = v365;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v366 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v366);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "%s add msfSource %s\n", "handleFdr", v355);
      }

      IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), @"WiFiMSFSource", v363);
    }

    else
    {
      sub_100008620(v364, "%s failed to create msfSourceRef\n", v357, v358, v359, v360, v361, v362, (char)"handleFdr");
      if (dword_100010220)
      {
        *(void *)&__int128 v472 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v472 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v654 = v472;
        v655 = v472;
        v652 = v472;
        v653 = v472;
        v650 = v472;
        v651 = v472;
        *(_OWORD *)cStr = v472;
        *(_OWORD *)&cStr[16] = v472;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v473 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v473);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "%s failed to create msfSourceRef\n");
      }
    }

    goto LABEL_295;
  }

  if (qword_100010218) {
    v291 = (os_log_s *)qword_100010218;
  }
  else {
    v291 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v291, "%s: platform does not need FDR.\n", v274, v275, v276, v277, v278, v279, (char)"handleFdr");
  if (dword_100010220)
  {
    *(void *)&__int128 v292 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v292 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v654 = v292;
    v655 = v292;
    v652 = v292;
    v653 = v292;
    v650 = v292;
    v651 = v292;
    *(_OWORD *)cStr = v292;
    *(_OWORD *)&cStr[16] = v292;
    *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&outputStructCnt);
    v293 = localtime((const time_t *)&outputStructCnt);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v293);
    dprintf(dword_100010220, "%s ", cStr);
    dprintf(dword_100010220, "%s: platform does not need FDR.\n");
  }

LABEL_295:
  if (BYTE2(dword_1000100B0)) {
    BOOL v367 = 0;
  }
  else {
    BOOL v367 = v39;
  }
  if (v367 && !BYTE1(dword_1000100B0))
  {
    if (qword_100010218) {
      v368 = (os_log_s *)qword_100010218;
    }
    else {
      v368 = (os_log_s *)&_os_log_default;
    }
    sub_100008620( v368,  "Already loaded, bailing use '-r' to force load\n",  v283,  v284,  v285,  v286,  v287,  v288,  outputStructd);
    if (dword_100010220)
    {
      *(void *)&__int128 v369 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v369 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v654 = v369;
      v655 = v369;
      v652 = v369;
      v653 = v369;
      v650 = v369;
      v651 = v369;
      *(_OWORD *)cStr = v369;
      *(_OWORD *)&cStr[16] = v369;
      *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&outputStructCnt);
      v370 = localtime((const time_t *)&outputStructCnt);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v370);
      dprintf(dword_100010220, "%s ", cStr);
      dprintf(dword_100010220, "Already loaded, bailing use '-r' to force load\n");
    }

    fwrite("Already loaded, bailing, use '-r' to force load\n", 0x30uLL, 1uLL, __stderrp);
LABEL_306:
    *(_DWORD *)(v1 + 12) = 0;
    goto LABEL_453;
  }

  if (byte_1000101F8)
  {
    else {
      v371 = off_10000C5E8[(qword_1000101FC - 1)];
    }
    int v372 = HIDWORD(qword_1000101FC);
    double v373 = (double)SHIDWORD(qword_1000101FC);
    uint64_t v374 = qword_100010218;
    char v375 = CFStringGetCStringPtr(v371, 0);
    CFStringGetCStringPtr(@"com.apple.wifiFirmwareLoader.IOPMAssertion.loading-firmware", 0);
    CFStringGetCStringPtr(@"wifiFirmwareLoader: IOPMAssertion: Loading firmware", 0);
    CFStringGetCStringPtr(@"TimeoutActionTurnOff", 0);
    v382 = (os_log_s *)&_os_log_default;
    if (v374) {
      v382 = (os_log_s *)v374;
    }
    sub_100008620( v382,  "_createIOPMHelperCreateAssertion assertionType[%s] assertionName[%s] details[%s] reason[%s] bundle[%s] timeout[%f sec] assertionID[%p] assertionLevel[0x%08x]\n",  v376,  v377,  v378,  v379,  v380,  v381,  v375);
    if (dword_100010220)
    {
      *(void *)&__int128 v389 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v389 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v654 = v389;
      v655 = v389;
      v652 = v389;
      v653 = v389;
      v650 = v389;
      v651 = v389;
      *(_OWORD *)cStr = v389;
      *(_OWORD *)&cStr[16] = v389;
      *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&outputStructCnt);
      v390 = localtime((const time_t *)&outputStructCnt);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v390);
      dprintf(dword_100010220, "%s ", cStr);
      int v391 = dword_100010220;
      v392 = CFStringGetCStringPtr(v371, 0);
      v393 = CFStringGetCStringPtr(@"com.apple.wifiFirmwareLoader.IOPMAssertion.loading-firmware", 0);
      v394 = CFStringGetCStringPtr(@"wifiFirmwareLoader: IOPMAssertion: Loading firmware", 0);
      v395 = CFStringGetCStringPtr(@"TimeoutActionTurnOff", 0);
      dprintf( v391,  "_createIOPMHelperCreateAssertion assertionType[%s] assertionName[%s] details[%s] reason[%s] bundle[%s] timeout[% f sec] assertionID[%p] assertionLevel[0x%08x]\n",  v392,  v393,  v394,  "",  "",  v373,  v395,  0);
    }

    if (v372 <= 0)
    {
      v126 = &stru_100010000;
      IOReturn v402 = -536870911;
      v3 = allocator;
    }

    else
    {
      LODWORD(__size[0]) = 0;
      IOReturn v402 = IOPMAssertionCreateWithDescription( v371,  @"com.apple.wifiFirmwareLoader.IOPMAssertion.loading-firmware",  @"wifiFirmwareLoader: IOPMAssertion: Loading firmware",  0LL,  0LL,  v373,  @"TimeoutActionTurnOff",  (IOPMAssertionID *)__size);
      if (qword_100010218) {
        v403 = (os_log_s *)qword_100010218;
      }
      else {
        v403 = (os_log_s *)&_os_log_default;
      }
      sub_100008620( v403,  "_createIOPMHelperCreateAssertion 'IOPMAssertionCreateWithDescription': return [0x%08x], id[0x%08x]\n",  v396,  v397,  v398,  v399,  v400,  v401,  v402);
      v3 = allocator;
      v126 = &stru_100010000;
      if (dword_100010220)
      {
        *(void *)&__int128 v404 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v404 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v654 = v404;
        v655 = v404;
        v652 = v404;
        v653 = v404;
        v650 = v404;
        v651 = v404;
        *(_OWORD *)cStr = v404;
        *(_OWORD *)&cStr[16] = v404;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v405 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v405);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf( dword_100010220,  "_createIOPMHelperCreateAssertion 'IOPMAssertionCreateWithDescription': return [0x%08x], id[0x%08x]\n",  v402,  LODWORD(__size[0]));
      }

      dword_100010208 = __size[0];
    }

    if (qword_100010218) {
      v406 = (os_log_s *)qword_100010218;
    }
    else {
      v406 = (os_log_s *)&_os_log_default;
    }
    sub_100008620( v406,  "wifiFirmwareLoaderServiceThread: _createIOPMHelperCreateAssertion return[0x%08x], id[0x%08x]\n",  v383,  v384,  v385,  v386,  v387,  v388,  v402);
    if (dword_100010220)
    {
      *(void *)&__int128 v407 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v407 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v654 = v407;
      v655 = v407;
      v652 = v407;
      v653 = v407;
      v650 = v407;
      v651 = v407;
      *(_OWORD *)cStr = v407;
      *(_OWORD *)&cStr[16] = v407;
      *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&outputStructCnt);
      v408 = localtime((const time_t *)&outputStructCnt);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v408);
      dprintf(dword_100010220, "%s ", cStr);
      dprintf( dword_100010220,  "wifiFirmwareLoaderServiceThread: _createIOPMHelperCreateAssertion return[0x%08x], id[0x%08x]\n",  v402,  dword_100010208);
    }
  }

  v415 = CFStringGetCStringPtr(*(CFStringRef *)(v1 + 64), 0);
  if (qword_100010218) {
    v416 = (os_log_s *)qword_100010218;
  }
  else {
    v416 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v416, "full path firmwareName is %s\n", v409, v410, v411, v412, v413, v414, (char)v415);
  if (dword_100010220)
  {
    *(void *)&__int128 v417 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v654 = v417;
    v655 = v417;
    v652 = v417;
    v653 = v417;
    v650 = v417;
    v651 = v417;
    *(_OWORD *)cStr = v417;
    *(_OWORD *)&cStr[16] = v417;
    *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&outputStructCnt);
    v418 = localtime((const time_t *)&outputStructCnt);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v418);
    dprintf(dword_100010220, "%s ", cStr);
    dprintf(dword_100010220, "full path firmwareName is %s\n", v415);
  }

  if ((sub_1000081C0(v415, qword_1000100B8) & 1) == 0) {
    goto LABEL_526;
  }
  v419 = *(const __CFArray **)(v1 + 32);
  v420 = *(const __CFDictionary **)(v1 + 48);
  if (v420)
  {
    v421 = (const __CFData *)CFDictionaryGetValue(v420, @"wifi-nvram-path");
    v422 = (const __CFString *)xmmword_100010070;
    if (!(void)xmmword_100010070)
    {
      v423 = v421;
      if (v421)
      {
        CFTypeID v424 = CFGetTypeID(v421);
        if (v424 == CFDataGetTypeID())
        {
          v425 = CFStringCreateFromExternalRepresentation(v3, v423, 0);
          goto LABEL_342;
        }
      }

      goto LABEL_341;
    }

LABEL_340:
    v425 = CFStringCreateMutableCopy(v3, 255LL, v422);
    goto LABEL_342;
  }

  v422 = (const __CFString *)xmmword_100010070;
  if ((void)xmmword_100010070) {
    goto LABEL_340;
  }
LABEL_341:
  v425 = sub_1000090F0(v419, @"NVRAM", dword_1000100F0, v616);
LABEL_342:
  v426 = v425;
  if (BYTE1(dword_1000100B0))
  {
    v427 = CFStringGetCStringPtr(v425, 0);
    v428 = "";
    if (v427) {
      v428 = v427;
    }
    fprintf(__stdoutp, "Resolved to NVRAM file path: %s\n", v428);
  }

  *(void *)(v1 + 56) = v426;
  if (!v426) {
    goto LABEL_526;
  }
  v435 = CFStringGetCStringPtr(v426, 0);
  if (qword_100010218) {
    v436 = (os_log_s *)qword_100010218;
  }
  else {
    v436 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v436, "full path NVRAM is %s\n", v429, v430, v431, v432, v433, v434, (char)v435);
  if (dword_100010220)
  {
    *(void *)&__int128 v437 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v437 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v654 = v437;
    v655 = v437;
    v652 = v437;
    v653 = v437;
    v650 = v437;
    v651 = v437;
    *(_OWORD *)cStr = v437;
    *(_OWORD *)&cStr[16] = v437;
    *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&outputStructCnt);
    v438 = localtime((const time_t *)&outputStructCnt);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v438);
    dprintf(dword_100010220, "%s ", cStr);
    dprintf(dword_100010220, "full path NVRAM is %s\n", v435);
  }

  if ((sub_1000081C0(v435, &qword_1000100C8) & 1) == 0) {
    goto LABEL_526;
  }
  if ((_BYTE)dword_1000100B0 && !HIBYTE(dword_1000100B0))
  {
    v439 = 0LL;
    goto LABEL_405;
  }

  if (qword_100010088)
  {
    CFMutableStringRef v440 = CFStringCreateMutableCopy(allocator, 255LL, (CFStringRef)qword_100010088);
LABEL_358:
    v441 = v440;
    goto LABEL_366;
  }

  if (!*(void *)(v1 + 40))
  {
    CFMutableStringRef v440 = sub_1000090F0(*(const __CFArray **)(v1 + 32), @"Regulatory", &qword_1000100F8, v616);
    goto LABEL_358;
  }

  if (qword_100010218) {
    v442 = (os_log_s *)qword_100010218;
  }
  else {
    v442 = (os_log_s *)&_os_log_default;
  }
  sub_10000877C(v442, "Deprecated feature\n", 0LL, v249, v250, v251, v252, v253, outputStructe);
  if (dword_100010220)
  {
    *(void *)&__int128 v443 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v443 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v654 = v443;
    v655 = v443;
    v652 = v443;
    v653 = v443;
    v650 = v443;
    v651 = v443;
    *(_OWORD *)cStr = v443;
    *(_OWORD *)&cStr[16] = v443;
    *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&outputStructCnt);
    v444 = localtime((const time_t *)&outputStructCnt);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v444);
    dprintf(dword_100010220, "%s ", cStr);
    dprintf(dword_100010220, "Deprecated feature\n");
  }

  v441 = 0LL;
LABEL_366:
  if (BYTE1(dword_1000100B0))
  {
    if (v441) {
      v445 = CFStringGetCStringPtr(v441, 0);
    }
    else {
      v445 = 0LL;
    }
    v474 = "";
    if (v445) {
      v474 = v445;
    }
    fprintf(__stdoutp, "Resolved to Regulatory file path: %s\n", v474);
  }

  *(void *)(v1 + 80) = v441;
  if (v441)
  {
    v439 = CFStringGetCStringPtr(v441, 0);
    if (qword_100010218) {
      v481 = (os_log_s *)qword_100010218;
    }
    else {
      v481 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v481, "full path Regulatory is %s\n", v475, v476, v477, v478, v479, v480, (char)v439);
    if (dword_100010220)
    {
      *(void *)&__int128 v482 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v482 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v654 = v482;
      v655 = v482;
      v652 = v482;
      v653 = v482;
      v650 = v482;
      v651 = v482;
      *(_OWORD *)cStr = v482;
      *(_OWORD *)&cStr[16] = v482;
      *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&outputStructCnt);
      v483 = localtime((const time_t *)&outputStructCnt);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v483);
      dprintf(dword_100010220, "%s ", cStr);
      dprintf(dword_100010220, "full path Regulatory is %s\n", v439);
    }

    if ((sub_1000081C0(v439, &qword_1000100D0) & 1) == 0
      || (unint64_t)qword_1000100D0 >= 0x19000
      || (unint64_t)qword_1000100D0 <= 0x20)
    {
      goto LABEL_526;
    }
  }

  else
  {
    v439 = 0LL;
    qword_1000100F8 = -1LL;
  }

LABEL_405:
  if ((_BYTE)dword_1000100B0 && !(_BYTE)word_1000100B4)
  {
    v484 = 0LL;
    goto LABEL_427;
  }

  if ((void)xmmword_100010090) {
    v485 = CFStringCreateMutableCopy(allocator, 255LL, (CFStringRef)xmmword_100010090);
  }
  else {
    v485 = sub_1000090F0(*(const __CFArray **)(v1 + 32), @"TxCap", cStr, v616);
  }
  v484 = (const char *)v485;
  if (BYTE1(dword_1000100B0))
  {
    if (v485) {
      v486 = CFStringGetCStringPtr(v485, 0);
    }
    else {
      v486 = 0LL;
    }
    v487 = "";
    if (v486) {
      v487 = v486;
    }
    fprintf(__stdoutp, "Resolved to TxCap file path: %s\n", v487);
  }

  *(void *)(v1 + 88) = v484;
  if (v484)
  {
    v484 = CFStringGetCStringPtr((CFStringRef)v484, 0);
    if (qword_100010218) {
      v494 = (os_log_s *)qword_100010218;
    }
    else {
      v494 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v494, "full path TxCap is %s\n", v488, v489, v490, v491, v492, v493, (char)v484);
    if (dword_100010220)
    {
      *(void *)&__int128 v495 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v495 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v654 = v495;
      v655 = v495;
      v652 = v495;
      v653 = v495;
      v650 = v495;
      v651 = v495;
      *(_OWORD *)cStr = v495;
      *(_OWORD *)&cStr[16] = v495;
      *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&outputStructCnt);
      v496 = localtime((const time_t *)&outputStructCnt);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v496);
      dprintf(dword_100010220, "%s ", cStr);
      dprintf(dword_100010220, "full path TxCap is %s\n", v484);
    }

    if ((sub_1000081C0(v484, qword_1000100D8) & 1) == 0
      || qword_1000100D8[0] >= 0x8000uLL
      || qword_1000100D8[0] <= 0x20uLL)
    {
LABEL_526:
      IOConnectCallScalarMethod(*(_DWORD *)(*(void *)(v1 + 24) + 20LL), 4u, 0LL, 0, 0LL, 0LL);
      goto LABEL_453;
    }
  }

LABEL_427:
  if (BYTE1(dword_1000100B0))
  {
    *(_DWORD *)(v1 + 12) = 0;
    goto LABEL_453;
  }

  v622 = v439;
  v654 = 0u;
  v655 = 0u;
  v652 = 0u;
  v653 = 0u;
  v650 = 0u;
  v651 = 0u;
  memset(cStr, 0, sizeof(cStr));
  if (!byte_100010010)
  {
    v509 = *(void *)(v1 + 24);
    *(void *)&outputStructCnt = 128LL;
    v505 = IOConnectCallMethod( *(_DWORD *)(v509 + 20),  2u,  0LL,  0,  qword_1000100B8,  0x48uLL,  0LL,  0LL,  cStr,  (size_t *)&outputStructCnt);
    if (qword_100010218) {
      v516 = (os_log_s *)qword_100010218;
    }
    else {
      v516 = (os_log_s *)&_os_log_default;
    }
    sub_100008620( v516,  "WiFiUserClientPrepareMapping return %x firmwarebuffer len %lld nvrambuffer len %lld reg len %lld\n",  v510,  v511,  v512,  v513,  v514,  v515,  v505);
    if (dword_100010220)
    {
      *(void *)&v517 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v517 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v517;
      v640 = v517;
      v637 = v517;
      v638 = v517;
      v635 = v517;
      v636 = v517;
      outputStructCnt = v517;
      v634 = v517;
      __size[0] = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)__size);
      v518 = localtime((const time_t *)__size);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v518);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf( dword_100010220,  "WiFiUserClientPrepareMapping return %x firmwarebuffer len %lld nvrambuffer len %lld reg len %lld\n",  v505,  *(void *)&cStr[8],  (void)v650,  *((void *)&v653 + 1));
    }

    goto LABEL_452;
  }

  *(void *)&__int128 v497 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v497 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v639 = v497;
  v640 = v497;
  v637 = v497;
  v638 = v497;
  v635 = v497;
  v636 = v497;
  outputStructCnt = v497;
  v634 = v497;
  uint64_t v498 = *(void *)(v1 + 24);
  __size[0] = 128LL;
  v505 = IOConnectCallMethod( *(_DWORD *)(v498 + 20),  2u,  0LL,  0,  qword_1000100B8,  0x48uLL,  0LL,  0LL,  &outputStructCnt,  __size);
  if (qword_100010218) {
    v506 = (os_log_s *)qword_100010218;
  }
  else {
    v506 = (os_log_s *)&_os_log_default;
  }
  sub_100008620( v506,  "WiFiUserClientPrepareMappingDK return %x firmware len %lld nvram len %lld reg len %lld txcap len %lld signature len %lld platcfg len %lld\n",  v499,  v500,  v501,  v502,  v503,  v504,  v505);
  if (dword_100010220)
  {
    *(void *)&v507 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v507 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v632 = v507;
    v630 = v507;
    v631 = v507;
    *(_OWORD *)&v628[16] = v507;
    v629 = v507;
    v627 = v507;
    *(_OWORD *)v628 = v507;
    *(_OWORD *)__size = v507;
    length = 0xAAAAAAAAAAAAAAAALL;
    time(&length);
    v508 = localtime(&length);
    strftime((char *)__size, 0x80uLL, "%b %d %H:%M:%S", v508);
    dprintf(dword_100010220, "%s ", (const char *)__size);
    dprintf( dword_100010220,  "WiFiUserClientPrepareMappingDK return %x firmware len %lld nvram len %lld reg len %lld txcap len %lld signature le n %lld platcfg len %lld\n",  v505,  *((void *)&outputStructCnt + 1),  (void)v635,  *((void *)&v638 + 1),  (void)v640,  (void)v636,  (void)v637);
  }

  if (*((void *)&outputStructCnt + 1))
  {
    if (DWORD1(outputStructCnt)) {
      goto LABEL_556;
    }
    *(void *)cStr = sub_10000809C( *(_DWORD *)(*(void *)(v1 + 24) + 20LL),  outputStructCnt,  (mach_vm_size_t *)&cStr[8]);
    *(_DWORD *)&cStr[16] = v634;
  }

  if ((void)v635)
  {
    if (HIDWORD(v634)) {
      goto LABEL_556;
    }
    *(void *)&cStr[24] = sub_10000809C( *(_DWORD *)(*(void *)(v1 + 24) + 20LL),  DWORD2(v634),  (mach_vm_size_t *)&v650);
  }

  if (!*((void *)&v638 + 1)) {
    goto LABEL_444;
  }
  if (DWORD1(v638))
  {
LABEL_556:
    __break(0x5507u);
    goto LABEL_557;
  }

  *(void *)&v653 = sub_10000809C(*(_DWORD *)(*(void *)(v1 + 24) + 20LL), v638, (mach_vm_size_t *)&v653 + 1);
  LOBYTE(v654) = v639;
LABEL_444:
  if ((void)v640)
  {
    if (!HIDWORD(v639))
    {
      *((void *)&v654 + 1) = sub_10000809C( *(_DWORD *)(*(void *)(v1 + 24) + 20LL),  DWORD2(v639),  (mach_vm_size_t *)&v655);
      BYTE8(v655) = BYTE8(v640);
      goto LABEL_452;
    }

    goto LABEL_556;
  }

LABEL_452:
  if (!v505)
  {
    if ((sub_1000088DC(v415, *(void **)cStr, (off_t *)&cStr[8]) & 1) == 0)
    {
      if (qword_100010218) {
        v591 = (os_log_s *)qword_100010218;
      }
      else {
        v591 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v591, "copy FW to image map fail\n", v552, v553, v554, v555, v556, v557, outputStructc);
      if (dword_100010220)
      {
        *(void *)&v592 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v592 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v592;
        v640 = v592;
        v637 = v592;
        v638 = v592;
        v635 = v592;
        v636 = v592;
        outputStructCnt = v592;
        v634 = v592;
        __size[0] = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)__size);
        v593 = localtime((const time_t *)__size);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v593);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "copy FW to image map fail\n");
      }

      goto LABEL_453;
    }

    if (*((void *)&v653 + 1) && (void)v653 && (sub_1000088DC(v622, (void *)v653, (off_t *)&v653 + 1) & 1) == 0)
    {
LABEL_540:
      if (qword_100010218) {
        v594 = (os_log_s *)qword_100010218;
      }
      else {
        v594 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v594, "copy RegTable to image map fail\n", v155, v156, v157, v158, v159, v160, outputStructc);
      if (*((_DWORD *)v152 + 136))
      {
        *(void *)&v595 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v595 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v595;
        v640 = v595;
        v637 = v595;
        v638 = v595;
        v635 = v595;
        v636 = v595;
        outputStructCnt = v595;
        v634 = v595;
        __size[0] = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)__size);
        v596 = localtime((const time_t *)__size);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v596);
        dprintf(*((_DWORD *)v152 + 136), "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "copy RegTable to image map fail\n");
      }

      goto LABEL_453;
    }

    if ((void)v655 && *((void *)&v654 + 1) && (sub_1000088DC(v484, *((void **)&v654 + 1), (off_t *)&v655) & 1) == 0)
    {
      if (qword_100010218) {
        v597 = (os_log_s *)qword_100010218;
      }
      else {
        v597 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v597, "copy txCapTable to image map fail\n", v558, v559, v560, v561, v562, v563, outputStructc);
      if (dword_100010220)
      {
        *(void *)&v598 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v598 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v598;
        v640 = v598;
        v637 = v598;
        v638 = v598;
        v635 = v598;
        v636 = v598;
        outputStructCnt = v598;
        v634 = v598;
        __size[0] = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)__size);
        v599 = localtime((const time_t *)__size);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v599);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "copy txCapTable to image map fail\n");
      }

      goto LABEL_453;
    }

    if ((void)v650 && *(void *)&cStr[24] && (sub_1000088DC(v435, *(void **)&cStr[24], (off_t *)&v650) & 1) == 0)
    {
      if (qword_100010218) {
        v600 = (os_log_s *)qword_100010218;
      }
      else {
        v600 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v600, "copy NVRAM to image map fail\n", v564, v565, v566, v567, v568, v569, outputStructc);
      if (dword_100010220)
      {
        *(void *)&v601 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v601 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v639 = v601;
        v640 = v601;
        v637 = v601;
        v638 = v601;
        v635 = v601;
        v636 = v601;
        outputStructCnt = v601;
        v634 = v601;
        __size[0] = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)__size);
        v602 = localtime((const time_t *)__size);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v602);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "copy NVRAM to image map fail\n");
      }

      goto LABEL_453;
    }

    *(_DWORD *)&cStr[16] = dword_1000100B0;
    LOBYTE(v654) = HIBYTE(dword_1000100B0);
    BYTE8(v652) = HIBYTE(word_1000100B4);
    BYTE8(v655) = word_1000100B4;
    v576 = IOConnectCallMethod(*(_DWORD *)(*(void *)(v1 + 24) + 20LL), 3u, 0LL, 0, cStr, 0x80uLL, 0LL, 0LL, 0LL, 0LL);
    if (qword_100010218) {
      v577 = (os_log_s *)qword_100010218;
    }
    else {
      v577 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v577, "WiFiUserClientCompleteMapping return %x\n", v570, v571, v572, v573, v574, v575, v576);
    if (dword_100010220)
    {
      *(void *)&v578 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v578 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v639 = v578;
      v640 = v578;
      v637 = v578;
      v638 = v578;
      v635 = v578;
      v636 = v578;
      outputStructCnt = v578;
      v634 = v578;
      __size[0] = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)__size);
      v579 = localtime((const time_t *)__size);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v579);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "WiFiUserClientCompleteMapping return %x\n", v576);
    }

    if (!v576) {
      goto LABEL_306;
    }
  }

LABEL_453:
  if (*(_DWORD *)v126[32].__opaque)
  {
    if (dword_100010204)
    {
      if (qword_100010218) {
        v519 = (os_log_s *)qword_100010218;
      }
      else {
        v519 = (os_log_s *)&_os_log_default;
      }
      sub_100008620( v519,  "wifiFirmwareLoaderServiceThread: delay[%u sec] - started\n",  v248,  v249,  v250,  v251,  v252,  v253,  dword_100010204);
      if (dword_100010220)
      {
        *(void *)&v520 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v520 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v654 = v520;
        v655 = v520;
        v652 = v520;
        v653 = v520;
        v650 = v520;
        v651 = v520;
        *(_OWORD *)cStr = v520;
        *(_OWORD *)&cStr[16] = v520;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v521 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v521);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: delay[%u sec] - started\n", dword_100010204);
      }

      sleep(dword_100010204);
      if (qword_100010218) {
        v528 = (os_log_s *)qword_100010218;
      }
      else {
        v528 = (os_log_s *)&_os_log_default;
      }
      sub_100008620( v528,  "wifiFirmwareLoaderServiceThread: delay[%u sec] - ended\n",  v522,  v523,  v524,  v525,  v526,  v527,  dword_100010204);
      if (dword_100010220)
      {
        *(void *)&v529 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v529 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v654 = v529;
        v655 = v529;
        v652 = v529;
        v653 = v529;
        v650 = v529;
        v651 = v529;
        *(_OWORD *)cStr = v529;
        *(_OWORD *)&cStr[16] = v529;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v530 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v530);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: delay[%u sec] - ended\n", dword_100010204);
      }
    }

    v531 = *(_DWORD *)v126[32].__opaque;
    v538 = IOPMAssertionRelease(v531);
    *(_DWORD *)v126[32].__opaque = 0;
    if (qword_100010218) {
      v539 = (os_log_s *)qword_100010218;
    }
    else {
      v539 = (os_log_s *)&_os_log_default;
    }
    sub_100008620( v539,  "wifiFirmwareLoaderServiceThread: _releaseIOPMHelperAssertionRelease return[0x%08x], id[0x%08x], release id[0x%08x]\n",  v532,  v533,  v534,  v535,  v536,  v537,  v538);
    if (dword_100010220)
    {
      *(void *)&v540 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v540 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v654 = v540;
      v655 = v540;
      v652 = v540;
      v653 = v540;
      v650 = v540;
      v651 = v540;
      *(_OWORD *)cStr = v540;
      *(_OWORD *)&cStr[16] = v540;
      *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&outputStructCnt);
      v541 = localtime((const time_t *)&outputStructCnt);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v541);
      dprintf(dword_100010220, "%s ", cStr);
      dprintf( dword_100010220,  "wifiFirmwareLoaderServiceThread: _releaseIOPMHelperAssertionRelease return[0x%08x], id[0x%08x], release id[0x%08x]\n",  v538,  v531,  *(_DWORD *)v126[32].__opaque);
    }
  }

  *(_DWORD *)(v1 + 16) = 2;
  v542 = *(const void **)(v1 + 24);
  if (v542) {
    CFRelease(v542);
  }
  *(void *)(v1 + 24) = 0LL;
  v543 = *(const void **)(v1 + 32);
  if (v543) {
    CFRelease(v543);
  }
  *(void *)(v1 + 32) = 0LL;
  v544 = *(const void **)(v1 + 40);
  if (v544) {
    CFRelease(v544);
  }
  *(void *)(v1 + 40) = 0LL;
  v545 = *(const void **)(v1 + 48);
  if (v545) {
    CFRelease(v545);
  }
  *(void *)(v1 + 48) = 0LL;
  v546 = *(const void **)(v1 + 64);
  if (v546) {
    CFRelease(v546);
  }
  *(void *)(v1 + 64) = 0LL;
  v547 = *(const void **)(v1 + 56);
  if (v547) {
    CFRelease(v547);
  }
  *(void *)(v1 + 56) = 0LL;
  v548 = *(const void **)(v1 + 80);
  if (v548) {
    CFRelease(v548);
  }
  *(void *)(v1 + 80) = 0LL;
  v549 = *(const void **)(v1 + 88);
  if (v549) {
    CFRelease(v549);
  }
  *(void *)(v1 + 88) = 0LL;
  v550 = *(const void **)(v1 + 96);
  if (v550) {
    CFRelease(v550);
  }
  *(void *)(v1 + 96) = 0LL;
  v551 = *(_DWORD *)(v1 + 8);
  if (v551)
  {
    IOObjectRelease(v551);
    *(_DWORD *)(v1 + 8) = 0;
  }

  CFRunLoopStop((CFRunLoopRef)qword_100010060);
}

uint64_t sub_10000686C(uint64_t a1, char *a2, const char *a3)
{
  if (!CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0)) {
    return 1LL;
  }
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(a1 + 64));
  if (__OFSUB__(Length, 4LL))
  {
    __break(0x5515u);
LABEL_12:
    __break(0x5500u);
  }

  size_t v7 = Length - 3;
  if (Length == 3) {
    goto LABEL_12;
  }
  char CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0);
  strlcpy(a2, CStringPtr, v7);
  strlcat(a2, "_gen.", 0xFFuLL);
  strlcat(a2, a3, 0xFFuLL);
  uint64_t v9 = qword_100010218;
  CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0);
  uint64_t v16 = (os_log_s *)&_os_log_default;
  if (v9) {
    uint64_t v16 = (os_log_s *)v9;
  }
  sub_100008620(v16, "%s %s from FW path %s\n", v10, v11, v12, v13, v14, v15, (char)"createGenericPath");
  if (dword_100010220)
  {
    *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v29 = v17;
    __int128 v30 = v17;
    __int128 v27 = v17;
    __int128 v28 = v17;
    __int128 v25 = v17;
    __int128 v26 = v17;
    *(_OWORD *)uint64_t v23 = v17;
    __int128 v24 = v17;
    time_t v22 = 0xAAAAAAAAAAAAAAAALL;
    time(&v22);
    uint64_t v18 = localtime(&v22);
    strftime(v23, 0x80uLL, "%b %d %H:%M:%S", v18);
    dprintf(dword_100010220, "%s ", v23);
    int v19 = dword_100010220;
    uint64_t v20 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0);
    dprintf(v19, "%s %s from FW path %s\n", "createGenericPath", a2, v20);
  }

  return 0LL;
}

uint64_t start(int a1, char *const *a2)
{
  errorbuf = 0LL;
  if (sandbox_init("wifiFirmwareLoader", 1uLL, &errorbuf) == -1)
  {
    fprintf(__stderrp, "wifiFirmwareLoader sandbox_init: %s, attempting default compiled profile\n", errorbuf);
    sandbox_free_error(errorbuf);
    if (qword_100010218) {
      uint64_t v10 = (os_log_s *)qword_100010218;
    }
    else {
      uint64_t v10 = (os_log_s *)&_os_log_default;
    }
    sub_100008620( v10,  "Sandboxing init issue, couldn't find profile in default paths, attempting default compiled profile",  v4,  v5,  v6,  v7,  v8,  v9,  v213);
    if (dword_100010220)
    {
      *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v225 = v11;
      __int128 v226 = v11;
      __int128 v223 = v11;
      __int128 v224 = v11;
      __int128 v221 = v11;
      __int128 v222 = v11;
      *(_OWORD *)valuePtr = v11;
      __int128 v220 = v11;
      time_t v217 = 0xAAAAAAAAAAAAAAAALL;
      time(&v217);
      uint64_t v12 = localtime(&v217);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v12);
      dprintf(dword_100010220, "%s ", valuePtr);
      dprintf( dword_100010220,  "Sandboxing init issue, couldn't find profile in default paths, attempting default compiled profile");
    }

    if (sandbox_init( "(version 1)(deny default)(import system.sb)(allow file-read-metadata (literal /Library/Preferences))( allow file-read-data (literal /private/var/preferences/SystemConfiguration/com.apple.wifi.plist))(allow f ile-read-data (literal /Library/Managed Preferences/mobile/com.apple.wifiFirmwareLoader.plist))(allow mac h-lookup (global-name com.apple.system.logger))(allow mach-lookup (global-name com.apple.system.notific ation_center))(allow mach-lookup (global-name com.apple.corecaptured))(allow mach-lookup (global-name  com.apple.PowerManagement.control))(allow ipc-posix-shm-read-data (ipc-posix-name apple.shm.notification_ center))(allow sysctl-read)(allow iokit-open (iokit-user-client-class IOUserUserClient))(allow iokit-op en (iokit-user-client-class AppleBCMWLANUserClient))(allow iokit-open (iokit-user-client-class AppleKey StoreUserClient))(allow iokit-set-properties (iokit-property PlatformConfig))(allow iokit-set-propertie s (iokit-property WiFiMSFCal))(allow iokit-set-properties (iokit-property WiFiFdrCal))(allow iokit-se t-properties (iokit-property WiFiGenericCal))(allow iokit-set-properties (iokit-property WiFiMSFSource))(allow iokit-set-properties (iokit-property HWIdentifiersLate))(allow file-read* (subpath /usr/share/ firmware/wifi))(allow file-read* (subpath /usr/local/share/firmware))(allow file-read* (subpath /Appl eInternal))(allow file-read-metadata (literal /usr))(allow file-read-metadata (regex #^/usr/.*$))(a llow file-read-metadata (literal /var))(allow file-write* (literal /private/var/logs/wifiFirmwareLoader .log))(allow file-read* (literal /private/var/logs/wifiFirmwareLoader.log))(allow file-read-metadata (r egex #^/private/var/db/timezone/.*$))(allow file-read-data (regex #^/usr/share/zoneinfo.default/.*$)) (allow file-read-data (literal /Library/Preferences/SystemConfiguration/com.apple.wifiFirmwareLoader.plist))",  0LL,  &errorbuf) == -1)
    {
      time_t v22 = errorbuf;
      if (!errorbuf) {
        time_t v22 = "";
      }
      fprintf( __stderrp,  "wifiFirmwareLoader sandbox_init: %s \nwifiFirmwareLoader failed to run, check profile\n",  v22);
      sandbox_free_error(errorbuf);
      if (qword_100010218) {
        __int128 v29 = (os_log_s *)qword_100010218;
      }
      else {
        __int128 v29 = (os_log_s *)&_os_log_default;
      }
      sub_100008620( v29,  "Sandboxing init issue failed, wifiFirmwareLoader failed to run, check profile",  v23,  v24,  v25,  v26,  v27,  v28,  v215);
      if (dword_100010220)
      {
        *(void *)&__int128 v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v30;
        __int128 v226 = v30;
        __int128 v223 = v30;
        __int128 v224 = v30;
        __int128 v221 = v30;
        __int128 v222 = v30;
        *(_OWORD *)valuePtr = v30;
        __int128 v220 = v30;
        time_t v217 = 0xAAAAAAAAAAAAAAAALL;
        time(&v217);
        uint64_t v31 = localtime(&v217);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v31);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "Sandboxing init issue failed, wifiFirmwareLoader failed to run, check profile");
      }
    }

    else
    {
      fwrite("wifiFirmwareLoader sandbox_init: Success\n", 0x29uLL, 1uLL, __stderrp);
      if (qword_100010218) {
        int v19 = (os_log_s *)qword_100010218;
      }
      else {
        int v19 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v19, "Sandboxing init issue resolved: Success", v13, v14, v15, v16, v17, v18, v214);
      if (dword_100010220)
      {
        *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v20;
        __int128 v226 = v20;
        __int128 v223 = v20;
        __int128 v224 = v20;
        __int128 v221 = v20;
        __int128 v222 = v20;
        *(_OWORD *)valuePtr = v20;
        __int128 v220 = v20;
        time_t v217 = 0xAAAAAAAAAAAAAAAALL;
        time(&v217);
        uint64_t v21 = localtime(&v217);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v21);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "Sandboxing init issue resolved: Success");
      }
    }
  }

  char v32 = 0;
  qword_100010100 = (uint64_t)&_mh_execute_header;
  dword_100010110 = 0;
  dword_100010118 = 0;
  dword_100010188 = 0;
  dword_100010190 = 0;
  *(_OWORD *)qword_1000100B8 = 0u;
  *(_OWORD *)&qword_1000100C8 = 0u;
  *(_OWORD *)qword_1000100D8 = 0u;
  dword_1000100B0 = 0;
  word_1000100B4 = 0;
  xmmword_100010070 = 0u;
  unk_100010080 = 0u;
  xmmword_100010090 = 0u;
  qword_1000100A0 = 0LL;
  while (1)
  {
    int v33 = getopt(a1, a2, "fF:N:C:rR:T:MmP:");
    if (v33 < 0) {
      break;
    }
    if (v33 > 101)
    {
      switch(v33)
      {
        case 'r':
          BYTE2(dword_1000100B0) = 1;
          break;
        case 'm':
LABEL_31:
          LOBYTE(dword_1000100B0) = v33 == 77;
          char v32 = 1;
          break;
        case 'f':
          BYTE1(dword_1000100B0) = 1;
          break;
        default:
LABEL_50:
          puts( "\n Usage:\n \n -F <filename> [mfg]\n uploads firmware data from a file \n <filename>  specifies the path to a binary image of firmware.\n mfg denotes a manufacturing firmware; if given the driver will omit initial setup af"
            "ter writing the firmware.\n"
            "  -N <filename>     uploads nvram data from a file\n"
            "                    <filename>  specifies the path to a text file of NVRAM data\n"
            "  -R <filename>     uploads regulatory table from a file\n"
            "                    <filename>  specifies the path to a text file of clmb data\n"
            "  -T <filename>     uploads tx cap table from a file\n"
            "                    <filename>  specifies the path to a text file of cap tx table\n"
            "  -P <filename>     Sets the Platform Config from a file\n"
            "                    <filename>  specifies the path to a the PlatformConfig file\n"
            "  -f                Prints the file paths for Firmware image and NVRAM file (doesn't perform an upload).\n"
            "  -r                Force to load Firmware\n"
            "  -M                Set MFG firmware flag\n"
            "  -m                Clear MFG firmware flag\n");
          return 1LL;
      }
    }

    else
    {
      switch(v33)
      {
        case 'F':
          if (!optarg) {
            goto LABEL_50;
          }
          *((void *)&xmmword_100010070 + 1) = CFStringCreateWithCString(0LL, optarg, 0);
          if ((v32 & 1) != 0) {
            int v34 = dword_1000100B0;
          }
          else {
            int v34 = strcasestr(optarg, "mfg") != 0LL;
          }
          LOBYTE(dword_1000100B0) = v34 != 0;
          break;
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'L':
        case 'O':
        case 'Q':
        case 'S':
          goto LABEL_50;
        case 'M':
          goto LABEL_31;
        case 'N':
          if (!optarg) {
            goto LABEL_50;
          }
          *(void *)&xmmword_100010070 = CFStringCreateWithCString(0LL, optarg, 0);
          break;
        case 'P':
          if (!optarg) {
            goto LABEL_50;
          }
          qword_1000100A0 = (uint64_t)CFStringCreateWithCString(0LL, optarg, 0);
          break;
        case 'R':
          if (!optarg) {
            goto LABEL_50;
          }
          qword_100010088 = (uint64_t)CFStringCreateWithCString(0LL, optarg, 0);
          HIBYTE(dword_1000100B0) = 1;
          break;
        case 'T':
          if (!optarg) {
            goto LABEL_50;
          }
          *(void *)&xmmword_100010090 = CFStringCreateWithCString(0LL, optarg, 0);
          LOBYTE(word_1000100B4) = 1;
          break;
        default:
          if (v33 != 67 || !optarg) {
            goto LABEL_50;
          }
          qword_1000100A8 = (uint64_t)CFStringCreateWithCString(0LL, optarg, 0);
          break;
      }
    }
  }

  CFDataRef v35 = SCPreferencesCreate( 0LL,  @"com.apple.wifiFirmwareLoader",  @"/Library/Managed Preferences/mobile/com.apple.wifiFirmwareLoader.plist");
  *(_DWORD *)valuePtr = 0;
  if (v35)
  {
    CFMutableStringRef v36 = v35;
    Value = (const __CFNumber *)SCPreferencesGetValue(v35, @"LoggingEnabled");
    if (!Value) {
      goto LABEL_56;
    }
    __int128 v38 = Value;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v38))
    {
      CFNumberGetValue(v38, kCFNumberIntType, valuePtr);
      goto LABEL_56;
    }

    CFTypeID v41 = CFBooleanGetTypeID();
    if (v41 == CFGetTypeID(v38))
    {
      SInt32 IntValue = CFEqual(v38, kCFBooleanTrue);
    }

    else
    {
      CFTypeID v43 = CFStringGetTypeID();
      if (v43 != CFGetTypeID(v38)) {
        goto LABEL_56;
      }
      SInt32 IntValue = CFStringGetIntValue((CFStringRef)v38);
    }

    *(_DWORD *)valuePtr = IntValue;
LABEL_56:
    CFRelease(v36);
    if (*(_DWORD *)valuePtr)
    {
      uint64_t v50 = (os_log_s *)qword_100010218;
      if (!qword_100010218)
      {
        qword_100010218 = (uint64_t)os_log_create("com.apple.wififirmwareloaderdaemon", "wififirmwareloader");
        char v212 = -92;
        dword_100010220 = open("/private/var/logs/wifiFirmwareLoader.log", 522);
        if (qword_100010218) {
          uint64_t v50 = (os_log_s *)qword_100010218;
        }
        else {
          uint64_t v50 = (os_log_s *)&_os_log_default;
        }
      }

      sub_100008620(v50, "WiFi Firmware Loader logging enabled\n", v44, v45, v46, v47, v48, v49, v212);
      if (dword_100010220)
      {
        *(void *)&__int128 v57 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v57;
        __int128 v226 = v57;
        __int128 v223 = v57;
        __int128 v224 = v57;
        __int128 v221 = v57;
        __int128 v222 = v57;
        *(_OWORD *)valuePtr = v57;
        __int128 v220 = v57;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v58 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v58);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "WiFi Firmware Loader logging enabled\n");
      }

      if (qword_100010218) {
        uint64_t v59 = (os_log_s *)qword_100010218;
      }
      else {
        uint64_t v59 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v59, "Kicking corecaptured to start logging...\n", v51, v52, v53, v54, v55, v56, v216);
      if (dword_100010220)
      {
        *(void *)&__int128 v60 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v60;
        __int128 v226 = v60;
        __int128 v223 = v60;
        __int128 v224 = v60;
        __int128 v221 = v60;
        __int128 v222 = v60;
        *(_OWORD *)valuePtr = v60;
        __int128 v220 = v60;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v61 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v61);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "Kicking corecaptured to start logging...\n");
      }

      if (&_CoreCaptureControlCreate) {
        uint64_t v62 = CoreCaptureControlCreate(kCFAllocatorDefault);
      }
      else {
        uint64_t v62 = 0LL;
      }
      if (&_CoreCaptureControlStart) {
        CoreCaptureControlStart(v62);
      }
    }
  }

  qword_1000101FC = 0xA00000002LL;
  dword_100010204 = 0;
  SCPreferencesRef v63 = SCPreferencesCreate( 0LL,  @"com.apple.wifiFirmwareLoader",  @"/Library/Managed Preferences/mobile/com.apple.wifiFirmwareLoader.plist");
  LODWORD(v217) = 0;
  if (v63)
  {
    uint64_t v70 = v63;
    if (qword_100010218) {
      uint64_t v71 = (os_log_s *)qword_100010218;
    }
    else {
      uint64_t v71 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v71, "WiFi Firmware processing preferences\n", v64, v65, v66, v67, v68, v69, v212);
    if (dword_100010220)
    {
      *(void *)&__int128 v72 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v72 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v225 = v72;
      __int128 v226 = v72;
      __int128 v223 = v72;
      __int128 v224 = v72;
      __int128 v221 = v72;
      __int128 v222 = v72;
      *(_OWORD *)valuePtr = v72;
      __int128 v220 = v72;
      errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&errorbuf);
      uint64_t v73 = localtime((const time_t *)&errorbuf);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v73);
      dprintf(dword_100010220, "%s ", valuePtr);
      dprintf(dword_100010220, "WiFi Firmware processing preferences\n");
    }

    CFPropertyListRef v74 = SCPreferencesGetValue(v70, @"assertionEnabled");
    if (v74)
    {
      int v75 = v74;
      CFTypeID v76 = CFBooleanGetTypeID();
      if (v76 == CFGetTypeID(v75)) {
        byte_1000101F8 = CFEqual(v75, kCFBooleanTrue) != 0;
      }
    }

    uint64_t v77 = (const __CFNumber *)SCPreferencesGetValue(v70, @"assertionType");
    if (v77)
    {
      uint64_t v78 = v77;
      CFTypeID v79 = CFNumberGetTypeID();
      if (v79 == CFGetTypeID(v78))
      {
        if (CFNumberGetValue(v78, kCFNumberIntType, &v217)) {
          LODWORD(qword_1000101FC) = v217;
        }
      }
    }

    CFPropertyListRef v80 = SCPreferencesGetValue(v70, @"assertionTimeout");
    if (v80)
    {
      uint64_t v81 = v80;
      CFTypeID v82 = CFNumberGetTypeID();
      if (v82 == CFGetTypeID(v81)
        && CFNumberGetValue((CFNumberRef)v81, kCFNumberIntType, &v217)
        && (int)v217 >= 1
        && (int)v217 <= 10)
      {
        HIDWORD(qword_1000101FC) = v217;
      }
    }

    __int128 v83 = (const __CFNumber *)SCPreferencesGetValue(v70, @"assertionReleaseDelay");
    if (v83)
    {
      __int128 v84 = v83;
      CFTypeID v85 = CFNumberGetTypeID();
      if (v85 == CFGetTypeID(v84))
      {
        uint64_t result = CFNumberGetValue(v84, kCFNumberIntType, &v217);
        if ((_DWORD)result)
        {
          if ((v217 & 0x80000000) == 0 && (int)v217 <= 3)
          {
            dword_100010204 = v217;
            if ((_DWORD)v217)
            {
              char v92 = BYTE4(qword_1000101FC) + v217;
              if (__OFADD__(HIDWORD(qword_1000101FC), (_DWORD)v217))
              {
                __break(0x5500u);
                return result;
              }

              HIDWORD(qword_1000101FC) += v217;
              if (qword_100010218) {
                uint64_t v93 = (os_log_s *)qword_100010218;
              }
              else {
                uint64_t v93 = (os_log_s *)&_os_log_default;
              }
              sub_100008620( v93,  "WiFi Firmware processing preferences, adjusting timeout -> timeout[%u sec], adjusted[%u sec]\n",  v86,  v87,  v88,  v89,  v90,  v91,  v92);
              if (dword_100010220)
              {
                *(void *)&__int128 v94 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v94 + 1) = 0xAAAAAAAAAAAAAAAALL;
                __int128 v225 = v94;
                __int128 v226 = v94;
                __int128 v223 = v94;
                __int128 v224 = v94;
                __int128 v221 = v94;
                __int128 v222 = v94;
                *(_OWORD *)valuePtr = v94;
                __int128 v220 = v94;
                errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
                time((time_t *)&errorbuf);
                v95 = localtime((const time_t *)&errorbuf);
                strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v95);
                dprintf(dword_100010220, "%s ", valuePtr);
                dprintf( dword_100010220,  "WiFi Firmware processing preferences, adjusting timeout -> timeout[%u sec], adjusted[%u sec]\n",  HIDWORD(qword_1000101FC),  dword_100010204);
              }
            }
          }
        }
      }
    }

    v96 = (os_log_s *)qword_100010218;
    char v97 = byte_1000101F8;
    if (qword_100010218)
    {
      switch((int)qword_1000101FC)
      {
        case 1:
          uint64_t v98 = @"PreventUserIdleDisplaySleep";
          break;
        case 2:
          uint64_t v98 = @"PreventSystemSleep";
          break;
        case 3:
          uint64_t v98 = @"NoIdleSleepAssertion";
          break;
        case 4:
          uint64_t v98 = @"NoDisplaySleepAssertion";
          break;
        default:
          goto LABEL_110;
      }
    }

    else if ((qword_1000101FC - 1) > 3)
    {
      v96 = (os_log_s *)&_os_log_default;
LABEL_110:
      uint64_t v98 = @"PreventUserIdleSystemSleep";
    }

    else
    {
      uint64_t v98 = off_10000C5E8[(qword_1000101FC - 1)];
      v96 = (os_log_s *)&_os_log_default;
    }

    CFStringGetCStringPtr(v98, 0);
    sub_100008620( v96,  "WiFi Firmware processing preferences using: assertionEnabled:%u, assertionType:%u mapped['%s'], timeout[%u sec], a ssertionReleaseDelay[%u sec]\n",  v99,  v100,  v101,  v102,  v103,  v104,  v97);
    if (dword_100010220)
    {
      *(void *)&__int128 v105 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v105 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v225 = v105;
      __int128 v226 = v105;
      __int128 v223 = v105;
      __int128 v224 = v105;
      __int128 v221 = v105;
      __int128 v222 = v105;
      *(_OWORD *)valuePtr = v105;
      __int128 v220 = v105;
      errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&errorbuf);
      uint64_t v106 = localtime((const time_t *)&errorbuf);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v106);
      dprintf(dword_100010220, "%s ", valuePtr);
      int v107 = dword_100010220;
      int v108 = byte_1000101F8;
      int v109 = qword_1000101FC;
      else {
        uint64_t v110 = off_10000C5E8[(qword_1000101FC - 1)];
      }
      char CStringPtr = CFStringGetCStringPtr(v110, 0);
      dprintf( v107,  "WiFi Firmware processing preferences using: assertionEnabled:%u, assertionType:%u mapped['%s'], timeout[%u sec], assertionReleaseDelay[%u sec]\n",  v108,  v109,  CStringPtr,  HIDWORD(qword_1000101FC),  dword_100010204);
    }

    CFRelease(v70);
  }

  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32( (int32x4_t)vceqzq_s64((int64x2_t)xmmword_100010070),  (int32x4_t)vceqzq_s64(*(int64x2_t *)&qword_100010088))))) & 1) != 0 || qword_1000100A0 || __PAIR128__(qword_1000100A8, 0LL) != *((unint64_t *)&xmmword_100010090 + 1))
  {
    if (qword_100010218) {
      int v112 = (os_log_s *)qword_100010218;
    }
    else {
      int v112 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v112, "Settings:\n", v64, v65, v66, v67, v68, v69, v212);
    if (dword_100010220)
    {
      *(void *)&__int128 v113 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v113 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v225 = v113;
      __int128 v226 = v113;
      __int128 v223 = v113;
      __int128 v224 = v113;
      __int128 v221 = v113;
      __int128 v222 = v113;
      *(_OWORD *)valuePtr = v113;
      __int128 v220 = v113;
      errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&errorbuf);
      uint64_t v114 = localtime((const time_t *)&errorbuf);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v114);
      dprintf(dword_100010220, "%s ", valuePtr);
      dprintf(dword_100010220, "Settings:\n");
    }

    if (qword_1000100A0 && CFStringGetCStringPtr((CFStringRef)qword_1000100A0, 0))
    {
      uint64_t v115 = (void *)qword_100010218;
      char v116 = CFStringGetCStringPtr((CFStringRef)qword_1000100A0, 0);
      uint64_t v123 = (os_log_s *)(v115 ? v115 : &_os_log_default);
      sub_100008620(v123, "    pathPlatformConfig: %s\n", v117, v118, v119, v120, v121, v122, v116);
      if (dword_100010220)
      {
        *(void *)&__int128 v124 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v124 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v124;
        __int128 v226 = v124;
        __int128 v223 = v124;
        __int128 v224 = v124;
        __int128 v221 = v124;
        __int128 v222 = v124;
        *(_OWORD *)valuePtr = v124;
        __int128 v220 = v124;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v125 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v125);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v126 = dword_100010220;
        v127 = CFStringGetCStringPtr((CFStringRef)qword_1000100A0, 0);
        dprintf(v126, "    pathPlatformConfig: %s\n", v127);
      }
    }

    if (*((void *)&xmmword_100010070 + 1) && CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010070 + 1), 0))
    {
      uint64_t v128 = qword_100010218;
      char v129 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010070 + 1), 0);
      if (v128) {
        CFTypeID v136 = (os_log_s *)v128;
      }
      else {
        CFTypeID v136 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v136, "          pathFirmware: %s\n", v130, v131, v132, v133, v134, v135, v129);
      if (dword_100010220)
      {
        *(void *)&__int128 v143 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v143 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v143;
        __int128 v226 = v143;
        __int128 v223 = v143;
        __int128 v224 = v143;
        __int128 v221 = v143;
        __int128 v222 = v143;
        *(_OWORD *)valuePtr = v143;
        __int128 v220 = v143;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        unsigned int v144 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v144);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v145 = dword_100010220;
        uint64_t v146 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010070 + 1), 0);
        dprintf(v145, "          pathFirmware: %s\n", v146);
      }

      if (qword_100010218) {
        uint64_t v147 = (os_log_s *)qword_100010218;
      }
      else {
        uint64_t v147 = (os_log_s *)&_os_log_default;
      }
      sub_100008620(v147, "                   mfg: %d\n", v137, v138, v139, v140, v141, v142, dword_1000100B0);
      if (dword_100010220)
      {
        *(void *)&__int128 v148 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v148 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v148;
        __int128 v226 = v148;
        __int128 v223 = v148;
        __int128 v224 = v148;
        __int128 v221 = v148;
        __int128 v222 = v148;
        *(_OWORD *)valuePtr = v148;
        __int128 v220 = v148;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v149 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v149);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "                   mfg: %d\n", dword_1000100B0);
      }
    }

    if ((void)xmmword_100010070 && CFStringGetCStringPtr((CFStringRef)xmmword_100010070, 0))
    {
      uint64_t v150 = (void *)qword_100010218;
      char v151 = CFStringGetCStringPtr((CFStringRef)xmmword_100010070, 0);
      uint64_t v158 = (os_log_s *)(v150 ? v150 : &_os_log_default);
      sub_100008620(v158, "             pathNVRAM: %s\n", v152, v153, v154, v155, v156, v157, v151);
      if (dword_100010220)
      {
        *(void *)&__int128 v159 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v159 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v159;
        __int128 v226 = v159;
        __int128 v223 = v159;
        __int128 v224 = v159;
        __int128 v221 = v159;
        __int128 v222 = v159;
        *(_OWORD *)valuePtr = v159;
        __int128 v220 = v159;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v160 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v160);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v161 = dword_100010220;
        v162 = CFStringGetCStringPtr((CFStringRef)xmmword_100010070, 0);
        dprintf(v161, "             pathNVRAM: %s\n", v162);
      }
    }

    if (qword_100010088 && CFStringGetCStringPtr((CFStringRef)qword_100010088, 0))
    {
      v163 = (void *)qword_100010218;
      char v164 = CFStringGetCStringPtr((CFStringRef)qword_100010088, 0);
      uint64_t v171 = (os_log_s *)(v163 ? v163 : &_os_log_default);
      sub_100008620(v171, "               pathReg: %s\n", v165, v166, v167, v168, v169, v170, v164);
      if (dword_100010220)
      {
        *(void *)&__int128 v172 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v172 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v172;
        __int128 v226 = v172;
        __int128 v223 = v172;
        __int128 v224 = v172;
        __int128 v221 = v172;
        __int128 v222 = v172;
        *(_OWORD *)valuePtr = v172;
        __int128 v220 = v172;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v173 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v173);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v174 = dword_100010220;
        v175 = CFStringGetCStringPtr((CFStringRef)qword_100010088, 0);
        dprintf(v174, "               pathReg: %s\n", v175);
      }
    }

    if ((void)xmmword_100010090 && CFStringGetCStringPtr((CFStringRef)xmmword_100010090, 0))
    {
      unint64_t v176 = (void *)qword_100010218;
      char v177 = CFStringGetCStringPtr((CFStringRef)xmmword_100010090, 0);
      uint64_t v184 = (os_log_s *)(v176 ? v176 : &_os_log_default);
      sub_100008620(v184, "             pathTxCap: %s\n", v178, v179, v180, v181, v182, v183, v177);
      if (dword_100010220)
      {
        *(void *)&__int128 v185 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v185 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v185;
        __int128 v226 = v185;
        __int128 v223 = v185;
        __int128 v224 = v185;
        __int128 v221 = v185;
        __int128 v222 = v185;
        *(_OWORD *)valuePtr = v185;
        __int128 v220 = v185;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v186 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v186);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v187 = dword_100010220;
        uint64_t v188 = CFStringGetCStringPtr((CFStringRef)xmmword_100010090, 0);
        dprintf(v187, "             pathTxCap: %s\n", v188);
      }
    }

    if (qword_1000100A8 && CFStringGetCStringPtr((CFStringRef)qword_1000100A8, 0))
    {
      uint64_t v189 = (void *)qword_100010218;
      char v190 = CFStringGetCStringPtr((CFStringRef)qword_1000100A8, 0);
      v197 = (os_log_s *)(v189 ? v189 : &_os_log_default);
      sub_100008620(v197, "             pathMSFCal: %s\n", v191, v192, v193, v194, v195, v196, v190);
      if (dword_100010220)
      {
        *(void *)&__int128 v198 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v198 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v225 = v198;
        __int128 v226 = v198;
        __int128 v223 = v198;
        __int128 v224 = v198;
        __int128 v221 = v198;
        __int128 v222 = v198;
        *(_OWORD *)valuePtr = v198;
        __int128 v220 = v198;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v199 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v199);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v200 = dword_100010220;
        v201 = CFStringGetCStringPtr((CFStringRef)qword_1000100A8, 0);
        dprintf(v200, "             pathMSFCal: %s\n", v201);
      }
    }
  }

  signal(2, (void (__cdecl *)(int))sub_100007D0C);
  signal(3, (void (__cdecl *)(int))sub_100007D0C);
  signal(15, (void (__cdecl *)(int))sub_100007D0C);
  signal(1, (void (__cdecl *)(int))sub_100007D0C);
  qword_100010060 = (uint64_t)CFRunLoopGetCurrent();
  os_transaction_create("com.apple.WiFiFirmwareLoader");
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v203 = CFRunLoopTimerCreate( kCFAllocatorDefault,  Current + 360.0,  0.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_100007D38,  0LL);
  qword_100010068 = (uint64_t)v203;
  if (v203)
  {
    CFRunLoopAddTimer((CFRunLoopRef)qword_100010060, v203, kCFRunLoopDefaultMode);
    sub_100001FF8(v204, v205, v206, v207, v208, v209, v210, v211);
    CFRunLoopRemoveTimer((CFRunLoopRef)qword_100010060, (CFRunLoopTimerRef)qword_100010068, kCFRunLoopDefaultMode);
    sub_100007D4C();
  }

  return HIDWORD(qword_100010100);
}

uint64_t sub_100007D0C(uint64_t result)
{
  return result;
}

void sub_100007D38()
{
  CFAbsoluteTime Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

void sub_100007D4C()
{
  if (qword_100010218) {
    uint64_t v6 = (os_log_s *)qword_100010218;
  }
  else {
    uint64_t v6 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v6, "Shutting down\n", v0, v1, v2, v3, v4, v5, v9);
  if (dword_100010220)
  {
    *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v17 = v7;
    __int128 v18 = v7;
    __int128 v15 = v7;
    __int128 v16 = v7;
    __int128 v13 = v7;
    __int128 v14 = v7;
    *(_OWORD *)__int128 v11 = v7;
    __int128 v12 = v7;
    time_t v10 = 0xAAAAAAAAAAAAAAAALL;
    time(&v10);
    uint64_t v8 = localtime(&v10);
    strftime(v11, 0x80uLL, "%b %d %H:%M:%S", v8);
    dprintf(dword_100010220, "%s ", v11);
    dprintf(dword_100010220, "Shutting down\n");
  }

  if ((void)xmmword_100010070) {
    CFRelease((CFTypeRef)xmmword_100010070);
  }
  *(void *)&xmmword_100010070 = 0LL;
  if (*((void *)&xmmword_100010070 + 1)) {
    CFRelease(*((CFTypeRef *)&xmmword_100010070 + 1));
  }
  *((void *)&xmmword_100010070 + 1) = 0LL;
  if (qword_100010088) {
    CFRelease((CFTypeRef)qword_100010088);
  }
  qword_100010088 = 0LL;
  if ((void)xmmword_100010090) {
    CFRelease((CFTypeRef)xmmword_100010090);
  }
  *(void *)&xmmword_100010090 = 0LL;
  if (dword_100010220)
  {
    close(dword_100010220);
    dword_100010220 = 0;
  }

  if (qword_100010218) {
    qword_100010218 = 0LL;
  }
  exit(SHIDWORD(qword_100010100));
}

void sub_100007EB4(id a1, void *a2)
{
  if (qword_100010218) {
    uint64_t v8 = (os_log_s *)qword_100010218;
  }
  else {
    uint64_t v8 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v8, "Woken up by IOKit matching\n", v2, v3, v4, v5, v6, v7, v11);
  if (dword_100010220)
  {
    *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v19 = v9;
    __int128 v20 = v9;
    __int128 v17 = v9;
    __int128 v18 = v9;
    __int128 v15 = v9;
    __int128 v16 = v9;
    *(_OWORD *)__int128 v13 = v9;
    __int128 v14 = v9;
    time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    time_t v10 = localtime(&v12);
    strftime(v13, 0x80uLL, "%b %d %H:%M:%S", v10);
    dprintf(dword_100010220, "%s ", v13);
    dprintf(dword_100010220, "Woken up by IOKit matching\n");
  }

uint64_t sub_100007F9C()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_10000C608);
  qword_100010210 = result;
  return result;
}

uint64_t sub_100007FC0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 24))
  {
    mach_port_t v2 = *(_DWORD *)(a1 + 20);
    if (v2) {
      IOConnectCallScalarMethod(v2, 1u, 0LL, 0, 0LL, 0LL);
    }
  }

  uint64_t result = *(unsigned int *)(a1 + 20);
  if ((_DWORD)result) {
    uint64_t result = IOServiceClose(result);
  }
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = 0LL;
  return result;
}

BOOL sub_100008018(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef sub_100008028(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, a2, @"WiFiUserClient@%p", a1);
}

CFStringRef sub_100008060(uint64_t a1)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"WiFiUserClient@%p", a1);
}

mach_vm_address_t sub_10000809C(io_connect_t a1, uint32_t a2, mach_vm_size_t *ofSize)
{
  kern_return_t v10;
  os_log_s *v11;
  __int128 v12;
  tm *v13;
  time_t v15;
  mach_vm_address_t atAddress;
  char v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  atAddress = 0xAAAAAAAAAAAAAAAALL;
  time_t v10 = IOConnectMapMemory(a1, a2, mach_task_self_, &atAddress, ofSize, 1u);
  if (qword_100010218) {
    char v11 = (os_log_s *)qword_100010218;
  }
  else {
    char v11 = (os_log_s *)&_os_log_default;
  }
  sub_100008620(v11, "WiFiUserClientGetMemoryDescriptorForType return %d for type %d\n", v4, v5, v6, v7, v8, v9, v10);
  if (dword_100010220)
  {
    *(void *)&time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v23 = v12;
    uint64_t v24 = v12;
    uint64_t v21 = v12;
    time_t v22 = v12;
    __int128 v19 = v12;
    __int128 v20 = v12;
    *(_OWORD *)__int128 v17 = v12;
    __int128 v18 = v12;
    __int128 v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    __int128 v13 = localtime(&v15);
    strftime(v17, 0x80uLL, "%b %d %H:%M:%S", v13);
    dprintf(dword_100010220, "%s ", v17);
    dprintf(dword_100010220, "WiFiUserClientGetMemoryDescriptorForType return %d for type %d\n", v10, a2);
  }

  return atAddress;
}

uint64_t sub_1000081C0(const char *a1, off_t *a2)
{
  if (!a1 || !a2)
  {
    if (qword_100010218) {
      uint64_t v54 = (os_log_s *)qword_100010218;
    }
    else {
      uint64_t v54 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v54, "'%s' failed !!\n", v4, v5, v6, v7, v8, v9, (char)"getSizeFromFile");
    if (dword_100010220)
    {
      *(void *)&__int128 v55 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v66 = v55;
      __int128 v67 = v55;
      __int128 v64 = v55;
      __int128 v65 = v55;
      __int128 v62 = v55;
      __int128 v63 = v55;
      *(_OWORD *)__int128 v60 = v55;
      __int128 v61 = v55;
      time_t v59 = 0xAAAAAAAAAAAAAAAALL;
      time(&v59);
      uint64_t v56 = localtime(&v59);
      strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v56);
      dprintf(dword_100010220, "%s ", v60);
      dprintf(dword_100010220, "'%s' failed !!\n");
    }

    return 0LL;
  }

  realpath_DARWIN_EXTSN(a1, v68);
  __int128 v16 = (os_log_s *)&_os_log_default;
  if (qword_100010218) {
    __int128 v17 = (os_log_s *)qword_100010218;
  }
  else {
    __int128 v17 = (os_log_s *)&_os_log_default;
  }
  uint64_t v58 = v68;
  sub_100008620(v17, "%s: path['%s'], resolved['%s']\n", v10, v11, v12, v13, v14, v15, (char)"getSizeFromFile");
  if (dword_100010220)
  {
    *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v66 = v18;
    __int128 v67 = v18;
    __int128 v64 = v18;
    __int128 v65 = v18;
    __int128 v62 = v18;
    __int128 v63 = v18;
    *(_OWORD *)__int128 v60 = v18;
    __int128 v61 = v18;
    time_t v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    __int128 v19 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v19);
    dprintf(dword_100010220, "%s ", v60);
    dprintf(dword_100010220, "%s: path['%s'], resolved['%s']\n", "getSizeFromFile", a1, v68);
  }

  if (lstat(v68, &v69))
  {
    __int128 v20 = (os_log_s *)qword_100010218;
    uint64_t v21 = __error();
    if (!v20) {
      __int128 v20 = (os_log_s *)&_os_log_default;
    }
    strerror(*v21);
    sub_10000877C(v20, "Error: Could not stat %s (%s)\n", v22, v23, v24, v25, v26, v27, (char)v68);
    if (!dword_100010220) {
      return 0LL;
    }
    *(void *)&__int128 v28 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v66 = v28;
    __int128 v67 = v28;
    __int128 v64 = v28;
    __int128 v65 = v28;
    __int128 v62 = v28;
    __int128 v63 = v28;
    *(_OWORD *)__int128 v60 = v28;
    __int128 v61 = v28;
    time_t v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    __int128 v29 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v29);
    dprintf(dword_100010220, "%s ", v60);
    int v30 = dword_100010220;
    uint64_t v31 = __error();
    __int128 v57 = strerror(*v31);
    char v32 = "Error: Could not stat %s (%s)\n";
    goto LABEL_13;
  }

  int v34 = open(v68, 0);
  if (qword_100010218) {
    __int128 v16 = (os_log_s *)qword_100010218;
  }
  if (v34 < 0)
  {
    uint64_t v44 = __error();
    strerror(*v44);
    sub_100008620(v16, "Could not Open file %s (%s)\n", v45, v46, v47, v48, v49, v50, (char)v68);
    if (!dword_100010220) {
      return 0LL;
    }
    *(void *)&__int128 v51 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v51 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v66 = v51;
    __int128 v67 = v51;
    __int128 v64 = v51;
    __int128 v65 = v51;
    __int128 v62 = v51;
    __int128 v63 = v51;
    *(_OWORD *)__int128 v60 = v51;
    __int128 v61 = v51;
    time_t v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    uint64_t v52 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v52);
    dprintf(dword_100010220, "%s ", v60);
    int v30 = dword_100010220;
    uint64_t v53 = __error();
    __int128 v57 = strerror(*v53);
    char v32 = "Could not Open file %s (%s)\n";
LABEL_13:
    dprintf(v30, v32, v68, v57, v58);
    return 0LL;
  }

  int v41 = v34;
  sub_100008620(v16, "Get size of %s, size = %d bytes\n", v35, v36, v37, v38, v39, v40, (char)v68);
  if (dword_100010220)
  {
    *(void *)&__int128 v42 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v66 = v42;
    __int128 v67 = v42;
    __int128 v64 = v42;
    __int128 v65 = v42;
    __int128 v62 = v42;
    __int128 v63 = v42;
    *(_OWORD *)__int128 v60 = v42;
    __int128 v61 = v42;
    time_t v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    CFTypeID v43 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v43);
    dprintf(dword_100010220, "%s ", v60);
    dprintf(dword_100010220, "Get size of %s, size = %d bytes\n", v68, LODWORD(v69.st_size));
  }

  *a2 = v69.st_size;
  close(v41);
  return 1LL;
}

void sub_100008620( os_log_s *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = mach_continuous_time();
  *(void *)info = 0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info((mach_timebase_info_t)info);
  else {
    unint64_t v12 = 0LL;
  }
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)info = 134218498;
    *(void *)&info[4] = v12 / 0x3B9ACA00;
    __int16 v14 = 2048;
    unint64_t v15 = v12 % 0x3B9ACA00 / 0x3E8;
    __int16 v16 = 2082;
    __int128 v17 = __str;
    _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEFAULT, "%06llu.%06llu %{public}s", info, 0x20u);
  }

void sub_10000877C( os_log_s *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = mach_continuous_time();
  *(void *)info = 0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info((mach_timebase_info_t)info);
  else {
    unint64_t v12 = 0LL;
  }
  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)info = 134218498;
    *(void *)&info[4] = v12 / 0x3B9ACA00;
    __int16 v14 = 2048;
    unint64_t v15 = v12 % 0x3B9ACA00 / 0x3E8;
    __int16 v16 = 2082;
    __int128 v17 = __str;
    _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "%06llu.%06llu %{public}s", info, 0x20u);
  }

uint64_t sub_1000088DC(const char *a1, void *a2, off_t *a3)
{
  if (!a2 || !a3)
  {
    if (qword_100010218) {
      uint64_t v26 = (os_log_s *)qword_100010218;
    }
    else {
      uint64_t v26 = (os_log_s *)&_os_log_default;
    }
    sub_10000877C(v26, "Error: copyDataFromFile data/datalength is null\n", v6, v7, v8, v9, v10, v11, v118);
    if (!dword_100010220) {
      return 0LL;
    }
    *(void *)&__int128 v27 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v128 = v27;
    __int128 v129 = v27;
    __int128 v126 = v27;
    __int128 v127 = v27;
    __int128 v124 = v27;
    __int128 v125 = v27;
    *(_OWORD *)uint64_t v122 = v27;
    __int128 v123 = v27;
    time_t v121 = 0xAAAAAAAAAAAAAAAALL;
    time(&v121);
    __int128 v28 = localtime(&v121);
    strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v28);
    dprintf(dword_100010220, "%s ", v122);
    int v25 = dword_100010220;
    uint64_t v24 = "Error: copyDataFromFile data/datalength is null\n";
    goto LABEL_14;
  }

  if (!lstat(a1, &v131))
  {
    uint64_t v31 = realpath_DARWIN_EXTSN(a1, v130);
    uint64_t v38 = qword_100010218;
    if (!v31)
    {
      uint64_t v54 = __error();
      if (v38) {
        __int128 v55 = (os_log_s *)v38;
      }
      else {
        __int128 v55 = (os_log_s *)&_os_log_default;
      }
      strerror(*v54);
      sub_10000877C(v55, "Error: Could not resolve path %s (%s)\n", v56, v57, v58, v59, v60, v61, (char)a1);
      if (!dword_100010220) {
        return 0LL;
      }
      *(void *)&__int128 v62 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v62 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v128 = v62;
      __int128 v129 = v62;
      __int128 v126 = v62;
      __int128 v127 = v62;
      __int128 v124 = v62;
      __int128 v125 = v62;
      *(_OWORD *)uint64_t v122 = v62;
      __int128 v123 = v62;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      __int128 v63 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v63);
      dprintf(dword_100010220, "%s ", v122);
      int v22 = dword_100010220;
      __int128 v64 = __error();
      uint64_t v119 = (char *)a1;
      uint64_t v120 = strerror(*v64);
      uint64_t v24 = "Error: Could not resolve path %s (%s)\n";
      goto LABEL_8;
    }

    if (qword_100010218) {
      uint64_t v39 = (os_log_s *)qword_100010218;
    }
    else {
      uint64_t v39 = (os_log_s *)&_os_log_default;
    }
    sub_100008620(v39, "%s: path['%s'], resolved['%s']\n", v32, v33, v34, v35, v36, v37, (char)"copyDataFromFile");
    if (dword_100010220)
    {
      *(void *)&__int128 v40 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v128 = v40;
      __int128 v129 = v40;
      __int128 v126 = v40;
      __int128 v127 = v40;
      __int128 v124 = v40;
      __int128 v125 = v40;
      *(_OWORD *)uint64_t v122 = v40;
      __int128 v123 = v40;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      int v41 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v41);
      dprintf(dword_100010220, "%s ", v122);
      dprintf(dword_100010220, "%s: path['%s'], resolved['%s']\n", "copyDataFromFile", a1, v130);
    }

    if (lstat(v130, &v131))
    {
      __int128 v42 = (os_log_s *)qword_100010218;
      CFTypeID v43 = __error();
      if (!v42) {
        __int128 v42 = (os_log_s *)&_os_log_default;
      }
      strerror(*v43);
      sub_10000877C(v42, "Error: Could not stat %s (%s)\n", v44, v45, v46, v47, v48, v49, (char)v130);
      if (!dword_100010220) {
        return 0LL;
      }
      *(void *)&__int128 v50 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v50 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v128 = v50;
      __int128 v129 = v50;
      __int128 v126 = v50;
      __int128 v127 = v50;
      __int128 v124 = v50;
      __int128 v125 = v50;
      *(_OWORD *)uint64_t v122 = v50;
      __int128 v123 = v50;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      __int128 v51 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v51);
      dprintf(dword_100010220, "%s ", v122);
      int v52 = dword_100010220;
      uint64_t v53 = __error();
      uint64_t v119 = v130;
      uint64_t v120 = strerror(*v53);
      uint64_t v24 = "Error: Could not stat %s (%s)\n";
LABEL_28:
      int v25 = v52;
      goto LABEL_14;
    }

    int v65 = open(v130, 0);
    if (qword_100010218) {
      __int128 v72 = (os_log_s *)qword_100010218;
    }
    else {
      __int128 v72 = (os_log_s *)&_os_log_default;
    }
    if (v65 < 0)
    {
      CFTypeID v85 = __error();
      strerror(*v85);
      sub_100008620(v72, "Could not Open file %s (%s)\n", v86, v87, v88, v89, v90, v91, (char)v130);
      if (!dword_100010220) {
        return 0LL;
      }
      *(void *)&__int128 v92 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v92 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v128 = v92;
      __int128 v129 = v92;
      __int128 v126 = v92;
      __int128 v127 = v92;
      __int128 v124 = v92;
      __int128 v125 = v92;
      *(_OWORD *)uint64_t v122 = v92;
      __int128 v123 = v92;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      uint64_t v93 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v93);
      dprintf(dword_100010220, "%s ", v122);
      int v52 = dword_100010220;
      __int128 v94 = __error();
      uint64_t v119 = v130;
      uint64_t v120 = strerror(*v94);
      uint64_t v24 = "Could not Open file %s (%s)\n";
      goto LABEL_28;
    }

    int v73 = v65;
    sub_100008620(v72, "Copying %s, file size = %d bytes\n", v66, v67, v68, v69, v70, v71, (char)v130);
    if (dword_100010220)
    {
      *(void *)&__int128 v79 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v79 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __int128 v128 = v79;
      __int128 v129 = v79;
      __int128 v126 = v79;
      __int128 v127 = v79;
      __int128 v124 = v79;
      __int128 v125 = v79;
      *(_OWORD *)uint64_t v122 = v79;
      __int128 v123 = v79;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      CFPropertyListRef v80 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v80);
      dprintf(dword_100010220, "%s ", v122);
      dprintf(dword_100010220, "Copying %s, file size = %d bytes\n", v130, LODWORD(v131.st_size));
    }

    off_t st_size = v131.st_size;
    if (v131.st_size > (unint64_t)*a3)
    {
      if (qword_100010218) {
        CFTypeID v82 = (os_log_s *)qword_100010218;
      }
      else {
        CFTypeID v82 = (os_log_s *)&_os_log_default;
      }
      sub_10000877C( v82,  "Error: copyDataFromFile ilestat.st_size %lld is bigger then supplied buffer %lld\n",  v131.st_size,  v74,  v75,  v76,  v77,  v78,  v131.st_size);
      if (dword_100010220)
      {
        *(void *)&__int128 v83 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v83 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v128 = v83;
        __int128 v129 = v83;
        __int128 v126 = v83;
        __int128 v127 = v83;
        __int128 v124 = v83;
        __int128 v125 = v83;
        *(_OWORD *)uint64_t v122 = v83;
        __int128 v123 = v83;
        time_t v121 = 0xAAAAAAAAAAAAAAAALL;
        time(&v121);
        __int128 v84 = localtime(&v121);
        strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v84);
        dprintf(dword_100010220, "%s ", v122);
        dprintf( dword_100010220,  "Error: copyDataFromFile ilestat.st_size %lld is bigger then supplied buffer %lld\n",  v131.st_size,  *a3);
      }

      close(v73);
      return 0LL;
    }

    *a3 = v131.st_size;
    ssize_t v95 = read(v73, a2, st_size);
    if (v95 < 0)
    {
      uint64_t v103 = (os_log_s *)qword_100010218;
      uint64_t v104 = __error();
      if (!v103) {
        uint64_t v103 = (os_log_s *)&_os_log_default;
      }
      strerror(*v104);
      sub_10000877C(v103, "Error: read %s (%s)\n", v105, v106, v107, v108, v109, v110, (char)a1);
      if (dword_100010220)
      {
        *(void *)&__int128 v111 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v111 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v128 = v111;
        __int128 v129 = v111;
        __int128 v126 = v111;
        __int128 v127 = v111;
        __int128 v124 = v111;
        __int128 v125 = v111;
        *(_OWORD *)uint64_t v122 = v111;
        __int128 v123 = v111;
        time_t v121 = 0xAAAAAAAAAAAAAAAALL;
        time(&v121);
        int v112 = localtime(&v121);
        strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v112);
        dprintf(dword_100010220, "%s ", v122);
        int v113 = dword_100010220;
        uint64_t v114 = __error();
        strerror(*v114);
        dprintf(v113, "Error: read %s (%s)\n");
      }
    }

    else
    {
      char v102 = v95;
      if (v95 == v131.st_size)
      {
        uint64_t v29 = 1LL;
LABEL_62:
        close(v73);
        return v29;
      }

      if (qword_100010218) {
        uint64_t v115 = (os_log_s *)qword_100010218;
      }
      else {
        uint64_t v115 = (os_log_s *)&_os_log_default;
      }
      sub_10000877C(v115, "Error: Only read %ld of %d files\n", v96, v97, v98, v99, v100, v101, v102);
      if (dword_100010220)
      {
        *(void *)&__int128 v116 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v116 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v128 = v116;
        __int128 v129 = v116;
        __int128 v126 = v116;
        __int128 v127 = v116;
        __int128 v124 = v116;
        __int128 v125 = v116;
        *(_OWORD *)uint64_t v122 = v116;
        __int128 v123 = v116;
        time_t v121 = 0xAAAAAAAAAAAAAAAALL;
        time(&v121);
        uint64_t v117 = localtime(&v121);
        strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v117);
        dprintf(dword_100010220, "%s ", v122);
        dprintf(dword_100010220, "Error: Only read %ld of %d files\n");
      }
    }

    uint64_t v29 = 0LL;
    goto LABEL_62;
  }

  unint64_t v12 = (os_log_s *)qword_100010218;
  uint64_t v13 = __error();
  if (!v12) {
    unint64_t v12 = (os_log_s *)&_os_log_default;
  }
  strerror(*v13);
  sub_10000877C(v12, "Error: Could not stat %s (%s)\n", v14, v15, v16, v17, v18, v19, (char)a1);
  if (!dword_100010220) {
    return 0LL;
  }
  *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v128 = v20;
  __int128 v129 = v20;
  __int128 v126 = v20;
  __int128 v127 = v20;
  __int128 v124 = v20;
  __int128 v125 = v20;
  *(_OWORD *)uint64_t v122 = v20;
  __int128 v123 = v20;
  time_t v121 = 0xAAAAAAAAAAAAAAAALL;
  time(&v121);
  uint64_t v21 = localtime(&v121);
  strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v21);
  dprintf(dword_100010220, "%s ", v122);
  int v22 = dword_100010220;
  uint64_t v23 = __error();
  uint64_t v119 = (char *)a1;
  uint64_t v120 = strerror(*v23);
  uint64_t v24 = "Error: Could not stat %s (%s)\n";
LABEL_8:
  int v25 = v22;
LABEL_14:
  dprintf(v25, v24, v119, v120);
  return 0LL;
}

CFMutableStringRef sub_1000090F0(const __CFArray *a1, const void *a2, _DWORD *a3, const __CFString *a4)
{
  *a3 = -1;
  if (!a1) {
    return 0LL;
  }
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v9 = Count;
  CFIndex v10 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
    if (!CFDictionaryGetValue(ValueAtIndex, a2)) {
      goto LABEL_12;
    }
    Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, a2);
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 255LL, Value);
    if (!MutableCopy) {
      goto LABEL_12;
    }
    uint64_t v14 = MutableCopy;
    CFTypeID v15 = CFGetTypeID(MutableCopy);
    if (v15 == CFStringGetTypeID())
    {
      off_t v19 = 0xAAAAAAAAAAAAAAAALL;
      CFMutableStringRef v16 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, a4);
      CFStringAppend(v16, v14);
      char CStringPtr = CFStringGetCStringPtr(v16, 0);
      if ((sub_1000081C0(CStringPtr, &v19) & 1) == 0)
      {
        CFRelease(v16);
        goto LABEL_11;
      }

      if (v16) {
        break;
      }
    }

LABEL_11:
    CFRelease(v14);
LABEL_12:
    if (v9 == ++v10) {
      return 0LL;
    }
  }

  CFRelease(v14);
  *a3 = v10;
  return v16;
}