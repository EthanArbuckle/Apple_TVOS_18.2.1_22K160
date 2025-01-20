uint64_t start(int a1, char **a2)
{
  uint64_t *v4;
  __CFDictionary *Mutable;
  const char *v6;
  uint64_t v7;
  const char *v8;
  int v9;
  const char *v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  char *v15;
  const char *v16;
  CFStringRef v17;
  CFStringRef v18;
  CFTypeID v19;
  char *v20;
  int Value;
  CFNumberRef v22;
  uint64_t v23;
  uint64_t i;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  __CFDictionary *v29;
  CFDataRef v30;
  CFDataRef v31;
  const CFBooleanRef *v32;
  const void *v33;
  CFTypeID v34;
  CFNumberRef v35;
  CFTypeID v36;
  CFNumberRef v37;
  CFUUIDRef v38;
  CFUUIDRef v39;
  CFStringRef v40;
  const char *v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  const char *v46;
  size_t v47;
  CFDataRef v48;
  CFDataRef v49;
  CFStringRef v50;
  CFStringRef v51;
  CFURLRef v52;
  CFURLRef v53;
  CFStringRef v54;
  CFStringRef v55;
  CFArrayRef v56;
  __CFDictionary *v57;
  __CFDictionary *v58;
  CFDictionaryRef v59;
  io_service_t MatchingService;
  io_object_t v61;
  kern_return_t MatchingServices;
  CFDictionaryRef v63;
  CFDictionaryRef v64;
  io_service_t v65;
  io_object_t v66;
  uint64_t v67;
  CFDataRef Data;
  CFDataRef v69;
  io_registry_entry_t v70;
  kern_return_t v71;
  IONotificationPortRef v72;
  IONotificationPort *v73;
  CFDictionaryRef v74;
  kern_return_t v75;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *v78;
  __CFRunLoopSource *v79;
  uint64_t Count;
  CFIndex j;
  CFDictionaryRef ValueAtIndex;
  CFStringRef v83;
  CFStringRef v84;
  const char *v85;
  char *v86;
  const char *v87;
  char *v88;
  kern_return_t v89;
  const void *v90;
  uint64_t v92;
  uint64_t v93;
  CFNumberRef cf;
  char *v95;
  CFNumberRef v96;
  char *v97;
  __CFDictionary *theDict;
  void *values;
  _BYTE outputStruct[4];
  stat __endptr;
  mach_timespec_t valuePtr[3];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  CFRange v118;
  v97 = basename(*a2);
  v4 = &qword_100008000;
  if (a1 <= 1)
  {
    warnx("no image specified");
    Mutable = 0LL;
LABEL_177:
    v45 = 22LL;
    goto LABEL_178;
  }

  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  v6 = 0LL;
  LODWORD(v7) = 1;
  theDict = Mutable;
  do
  {
    v8 = v6;
    v6 = a2[(int)v7];
    if (!strcasecmp(v6, "-help") || !strcasecmp(v6, "-h"))
    {
      sub_1000032A8(v97);
      exit(0);
    }

    v9 = v7;
    if (!strcasecmp(v6, "-e"))
    {
      if ((_DWORD)v7 + 1 == a1 || (v41 = a2[(int)v7 + 1], *v41 == 45))
      {
        warnx("you must specify a device to eject", v92);
        goto LABEL_177;
      }

      if (geteuid()) {
        goto LABEL_99;
      }
      if (!strncmp(v41, "/dev/", 5uLL))
      {
        if (stat(v41, (stat *)valuePtr))
        {
          warn("%s", v41);
          v45 = 3758097136LL;
          goto LABEL_165;
        }

        if ((valuePtr[0].tv_nsec & 0x6000) != 0)
        {
          v42 = open(v41, 0);
          if (v42 == -1)
          {
            warn("could not open %s", v41);
            v45 = 5LL;
            goto LABEL_165;
          }

          v43 = v42;
          v44 = ioctl(v42, 0x20006415uLL, 0LL);
          if (v44 == -1)
          {
            warn("could not eject %s", v41);
            v45 = 5LL;
            if (v43 < 0)
            {
LABEL_75:
              if (v44 != -1) {
                goto LABEL_161;
              }
LABEL_165:
              warnx("eject failed: error 0x%x = %d");
              goto LABEL_178;
            }
          }

          else
          {
            fprintf(__stdoutp, "%s ejected successfully.\n", v41);
            v45 = 0LL;
            if (v43 < 0) {
              goto LABEL_75;
            }
          }

          close(v43);
          goto LABEL_75;
        }

        warn("%s doesn't appear to be a device node");
      }

      else
      {
        warn("eject requires input of the form %sdiskX");
      }

      v45 = 3758097090LL;
      goto LABEL_165;
    }

    if (!strcasecmp(v6, "-shadow"))
    {
      warnx("-shadow option not supported", v92);
      goto LABEL_177;
    }

    if (!strcasecmp(v6, "-nomount"))
    {
      CFDictionarySetValue(Mutable, @"autodiskmount", kCFBooleanFalse);
      v6 = v8;
      goto LABEL_61;
    }

    if (!strcasecmp(v6, "-drivekey"))
    {
      v7 = (int)v7 + 1LL;
      if (v9 + 1 == a1)
      {
        warnx("missing -drivekey parameter", v92);
        goto LABEL_177;
      }

      v10 = a2[v7];
      v11 = strchr(v10, 61);
      if (!v11 || v11 == v10 || !v11[1] || (v12 = strlen(v10) + 1, (v13 = (char *)malloc(v12)) == 0LL))
      {
        warnx("unable to process -drivekey parameter %s", v10);
        v45 = 22LL;
        goto LABEL_160;
      }

      v14 = v13;
      strlcpy(v13, v10, v12);
      v15 = strchr(v14, 61);
      *v15 = 0;
      v16 = v15 + 1;
      v17 = CFStringCreateWithCString(kCFAllocatorDefault, v14, 0x8000100u);
      v18 = CFStringCreateWithCString(kCFAllocatorDefault, v16, 0x8000100u);
      if (CFStringCompare(v18, @"yes", 1uLL) && CFStringCompare(v18, @"true", 1uLL))
      {
        if (CFStringCompare(v18, @"no", 1uLL) && CFStringCompare(v18, @"false", 1uLL))
        {
          v19 = CFGetTypeID(v18);
          if (v19 == CFStringGetTypeID())
          {
            v20 = (char *)sub_1000035BC(v18, 0x600u);
            if (v20)
            {
              if (*v20)
              {
                v95 = v20;
                Value = 0;
                valuePtr[0] = (mach_timespec_t)strtouq(v20, (char **)&__endptr, 0);
                v20 = v95;
                if (!**(_BYTE **)&__endptr.st_dev)
                {
                  v22 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, valuePtr);
                  if (v22)
                  {
                    cf = v22;
                    Value = CFNumberGetValue(v22, kCFNumberSInt64Type, &values);
                    CFRelease(cf);
                  }

                  else
                  {
                    Value = 0;
                  }

                  v20 = v95;
                }
              }

              else
              {
                Value = 0;
              }

              free(v20);
LABEL_52:
              if (Value)
              {
                v37 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &values);
                if (v37)
                {
                  v33 = v37;
                  goto LABEL_41;
                }
              }

              goto LABEL_55;
            }
          }

          else
          {
            v34 = CFGetTypeID(v18);
            if (v34 != CFBooleanGetTypeID())
            {
              v36 = CFGetTypeID(v18);
              if (v36 != CFNumberGetTypeID()) {
                goto LABEL_55;
              }
              Value = CFNumberGetValue((CFNumberRef)v18, kCFNumberSInt64Type, &values);
              goto LABEL_52;
            }

            valuePtr[0].tv_sec = CFBooleanGetValue((CFBooleanRef)v18) != 0;
            v35 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, valuePtr);
            if (v35)
            {
              v96 = v35;
              Value = CFNumberGetValue(v35, kCFNumberSInt64Type, &values);
              CFRelease(v96);
              goto LABEL_52;
            }
          }

          Value = 0;
          goto LABEL_52;
        }

        v32 = &kCFBooleanFalse;
      }

      else
      {
        v32 = &kCFBooleanTrue;
      }

      v33 = *v32;
      if (*v32)
      {
LABEL_41:
        CFDictionarySetValue(theDict, v17, v33);
        CFRelease(v33);
LABEL_56:
        v4 = &qword_100008000;
        if (v17) {
          CFRelease(v17);
        }
        if (v18) {
          CFRelease(v18);
        }
        free(v14);
        v6 = v8;
        Mutable = theDict;
        goto LABEL_61;
      }

LABEL_55:
      CFDictionarySetValue(theDict, v17, v18);
      goto LABEL_56;
    }

    if (!strcasecmp(v6, "-encryption"))
    {
      v7 = (int)v7 + 1LL;
      if (v9 + 1 == a1)
      {
        warnx("missing <encryption-key+hmacsha1-key> parameter", v92);
      }

      else if (strlen(a2[v7]) == 72)
      {
        printf("encryption-key:");
        v23 = 0LL;
        for (i = 0LL; i != 16; ++i)
        {
          v25 = sscanf(&a2[v7][v23], "%02hhx", &values);
          printf("%02x", values);
          fflush(0LL);
          if (v25 != 1)
          {
            Mutable = theDict;
            warnx("improper encryption-key portion of string", v93);
            goto LABEL_177;
          }

          *((_BYTE *)&__endptr.st_dev + i) = (_BYTE)values;
          v23 += 2LL;
        }

        putchar(10);
        printf("hmacsha1-key:");
        v26 = 0LL;
        v27 = 32LL;
        while (1)
        {
          v28 = sscanf(&a2[v7][v27], "%02hhx", &values);
          printf("%02x", values);
          if (v28 != 1) {
            break;
          }
          *((_BYTE *)&valuePtr[0].tv_sec + v26++) = (_BYTE)values;
          v27 += 2LL;
          if (v26 == 20)
          {
            putchar(10);
            Mutable = theDict;
            CFDictionarySetValue(theDict, @"image-encrypted", kCFBooleanTrue);
            v29 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            v30 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&__endptr, 16LL);
            CFDictionarySetValue(v29, @"encryption-key", v30);
            CFRelease(v30);
            v31 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)valuePtr, 20LL);
            CFDictionarySetValue(v29, @"hmacsha1-key", v31);
            CFRelease(v31);
            CFDictionarySetValue(theDict, @"image-secrets", v29);
            CFRelease(v29);
            v6 = v8;
            v4 = &qword_100008000;
            goto LABEL_61;
          }
        }

        Mutable = theDict;
        v4 = &qword_100008000;
        warnx("improper hmacsha1-key portion of string", v92);
      }

      else
      {
        warnx("<encryption-key+hmacsha1-key> must be 72 ASCII chars", v92);
      }

      goto LABEL_177;
    }

    if (*v6 == 45)
    {
      warnx("unknown option %s");
      goto LABEL_177;
    }

    if (v8)
    {
      warnx("only one image may be specified", v92);
      goto LABEL_177;
    }

LABEL_61:
    LODWORD(v7) = v7 + 1;
  }

  while ((int)v7 < a1);
  if (geteuid())
  {
LABEL_99:
    warnx("must be run by root");
    v45 = 1LL;
    goto LABEL_178;
  }

  v38 = CFUUIDCreate(kCFAllocatorDefault);
  if (v38)
  {
    v39 = v38;
    v40 = CFUUIDCreateString(kCFAllocatorDefault, v38);
    CFRelease(v39);
  }

  else
  {
    v40 = 0LL;
  }

  qword_100008000 = (uint64_t)v40;
  CFDictionarySetValue(Mutable, @"hdik-unique-identifier", v40);
  v46 = (const char *)valuePtr;
  v47 = strlen(v46);
  v48 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v46, v47);
  CFDictionarySetValue(Mutable, @"image-path", v48);
  if (v48) {
    CFRelease(v48);
  }
  values = 0LL;
  v49 = (const __CFData *)CFDictionaryGetValue(Mutable, @"image-path");
  if (!v49)
  {
    v45 = 22LL;
LABEL_133:
    warnx("couldn't construct backing store identifier");
    goto LABEL_178;
  }

  v50 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v49, 0x8000100u);
  if (!v50)
  {
LABEL_105:
    v45 = 12LL;
    goto LABEL_133;
  }

  v51 = v50;
  v52 = CFURLCreateWithString(kCFAllocatorDefault, v50, 0LL);
  if (!v52)
  {
    CFRelease(v51);
    goto LABEL_105;
  }

  v53 = v52;
  v54 = CFURLCopyScheme(v52);
  v55 = v54;
  if (v54 && CFStringCompare(v54, @"file", 0LL))
  {
    CFRelease(v51);
    v45 = 0LL;
    v56 = 0LL;
    v57 = 0LL;
    goto LABEL_113;
  }

  if (!CFURLGetFileSystemRepresentation(v53, 1u, (UInt8 *)valuePtr, 1024LL)
    || stat((const char *)valuePtr, &__endptr) < 0)
  {
    v57 = 0LL;
    v56 = 0LL;
    v45 = 2LL;
  }

  else
  {
    values = (void *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"d%d:i%llu",  __endptr.st_dev,  __endptr.st_ino);
    if (values)
    {
      v56 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
      if (v56)
      {
        v58 = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        v57 = v58;
        if (v58)
        {
          CFDictionarySetValue(v58, @"writeable-components", v56);
          CFDictionarySetValue(Mutable, @"backingstore-id", v57);
          v45 = 0LL;
          goto LABEL_112;
        }
      }

      else
      {
        v57 = 0LL;
      }
    }

    else
    {
      v57 = 0LL;
      v56 = 0LL;
    }

    v45 = 12LL;
  }

LABEL_112:
  CFRelease(v51);
  if (v55) {
LABEL_113:
  }
    CFRelease(v55);
  CFRelease(v53);
  if (values)
  {
    CFRelease(values);
    values = 0LL;
  }

  if (v56) {
    CFRelease(v56);
  }
  if (v57) {
    CFRelease(v57);
  }
  if ((_DWORD)v45) {
    goto LABEL_133;
  }
  __endptr.st_dev = 0;
  v59 = IOServiceMatching("IOHDIXController");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v59);
  if (MatchingService)
  {
    v61 = MatchingService;
    goto LABEL_123;
  }

  v63 = IOServiceMatching("IOResources");
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v63, (io_iterator_t *)&__endptr);
  if (!MatchingServices)
  {
    if (!IOIteratorIsValid(__endptr.st_dev)) {
      IOIteratorReset(__endptr.st_dev);
    }
    v70 = IOIteratorNext(__endptr.st_dev);
    if (v70)
    {
      v61 = v70;
      v71 = IORegistryEntrySetCFProperty(v70, @"com.apple.AppleDiskImageController.load", kCFBooleanTrue);
      if (v71)
      {
        MatchingServices = v71;
      }

      else
      {
        valuePtr[0] = (mach_timespec_t)5LL;
        v89 = IOKitWaitQuiet(kIOMasterPortDefault, valuePtr);
        if (v89) {
          warnx("IOKit timed out waiting for driver to load: error %08x.", v89);
        }
LABEL_123:
        MatchingServices = 0;
      }

      IOObjectRelease(v61);
    }

    else
    {
      MatchingServices = -536870208;
    }
  }

  if (__endptr.st_dev) {
    IOObjectRelease(__endptr.st_dev);
  }
  if (MatchingServices)
  {
    warnx("unable to load driver", v92);
    goto LABEL_177;
  }

  LODWORD(values) = 0;
  v64 = IOServiceMatching("IOHDIXController");
  v65 = IOServiceGetMatchingService(kIOMasterPortDefault, v64);
  if (!v65)
  {
    v67 = 3758097088LL;
LABEL_167:
    warnx("attach failed: error 0x%x = %d", v67, v67);
    v45 = v67;
    goto LABEL_178;
  }

  v66 = v65;
  v67 = IOServiceOpen(v65, mach_task_self_, 0, (io_connect_t *)&values);
  if (!(_DWORD)v67)
  {
    Data = CFPropertyListCreateData(kCFAllocatorDefault, Mutable, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
    if (Data)
    {
      v69 = Data;
      v117 = 0LL;
      v116 = 0u;
      v115 = 0u;
      v114 = 0u;
      v113 = 0u;
      v112 = 0u;
      v111 = 0u;
      v110 = 0u;
      v109 = 0u;
      v108 = 0u;
      v107 = 0u;
      v106 = 0u;
      v105 = 0u;
      v104 = 0u;
      v103 = 0u;
      valuePtr[0] = (mach_timespec_t)0x1BEEFFEEDLL;
      valuePtr[1] = (mach_timespec_t)CFDataGetBytePtr(Data);
      valuePtr[2] = (mach_timespec_t)CFDataGetLength(v69);
      *(void *)&__endptr.st_dev = 4LL;
      v67 = IOConnectCallStructMethod((mach_port_t)values, 0, valuePtr, 0x100uLL, outputStruct, (size_t *)&__endptr);
      CFRelease(v69);
    }

    else
    {
      v67 = 4LL;
    }
  }

  IOObjectRelease(v66);
  if ((_DWORD)values) {
    IOServiceClose((io_connect_t)values);
  }
  if ((_DWORD)v67) {
    goto LABEL_167;
  }
  v4[2] = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  valuePtr[0].tv_sec = 0;
  v72 = IONotificationPortCreate(kIOMasterPortDefault);
  if (!v72) {
    goto LABEL_162;
  }
  v73 = v72;
  v74 = IOServiceMatching("IOMedia");
  v75 = IOServiceAddMatchingNotification( v73,  "IOServiceMatched",  v74,  (IOServiceMatchingCallback)sub_10000336C,  0LL,  (io_iterator_t *)valuePtr);
  if (!v75)
  {
    sub_10000336C(0, valuePtr[0].tv_sec);
    if (!byte_100008008)
    {
      Current = CFRunLoopGetCurrent();
      RunLoopSource = IONotificationPortGetRunLoopSource(v73);
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
      v78 = CFRunLoopGetCurrent();
      v79 = IONotificationPortGetRunLoopSource(v73);
      CFRunLoopRemoveSource(v78, v79, kCFRunLoopDefaultMode);
    }
  }

  IONotificationPortDestroy(v73);
  if (valuePtr[0].tv_sec) {
    IOObjectRelease(valuePtr[0].tv_sec);
  }
  if (v75)
  {
LABEL_162:
    warnx("unable to locate attached image");
    v45 = 2LL;
    goto LABEL_178;
  }

  Count = CFArrayGetCount((CFArrayRef)v4[2]);
  v118.location = 0LL;
  v118.length = Count;
  CFArraySortValues((CFMutableArrayRef)v4[2], v118, (CFComparatorFunction)sub_10000356C, 0LL);
  if (Count < 1)
  {
LABEL_161:
    v45 = 0LL;
    goto LABEL_178;
  }

  for (j = 0LL; j != Count; ++j)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v4[2], j);
    v83 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"dev-entry");
    v84 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"content-hint");
    v85 = (const char *)sub_1000035BC(v83, 0x8000100u);
    if (v85)
    {
      v86 = (char *)v85;
      printf("%-20.20s", v85);
      free(v86);
    }

    else
    {
      printf("%-20.20s", " ");
    }

    putchar(9);
    v87 = (const char *)sub_1000035BC(v84, 0x8000100u);
    if (v87)
    {
      v88 = (char *)v87;
      printf("%-31.31s", v87);
      free(v88);
    }

    else
    {
      printf("%-31.31s", " ");
    }

    putchar(9);
    putchar(10);
  }

  v45 = 0LL;
LABEL_160:
  Mutable = theDict;
LABEL_178:
  v90 = (const void *)v4[2];
  if (v90)
  {
    CFRelease(v90);
    v4[2] = 0LL;
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  if ((_DWORD)v45 == 22)
  {
    sub_1000032A8(v97);
    exit(1);
  }

  return v45;
}

size_t sub_1000032A8(const char *a1)
{
  fwrite("\t    -drivekey <key>=<value>\n", 0x1DuLL, 1uLL, __stderrp);
  return fwrite("\t    -encryption <encryption-key+hmacsha1-key>\n", 0x2FuLL, 1uLL, __stderrp);
}

uint64_t sub_10000336C(int a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    io_registry_entry_t v4 = result;
    int v5 = 0;
    do
    {
      CFTypeRef v6 = IORegistryEntrySearchCFProperty(v4, "IOService", @"hdik-unique-identifier", kCFAllocatorDefault, 3u);
      if (v6)
      {
        v7 = v6;
        CFTypeID v8 = CFGetTypeID(v6);
        if (v8 == CFStringGetTypeID() && CFEqual((CFTypeRef)qword_100008000, v7))
        {
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, @"BSD Name", kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            v10 = CFProperty;
            v11 = (const __CFArray *)qword_100008010;
            v16.length = CFArrayGetCount((CFArrayRef)qword_100008010);
            v16.location = 0LL;
            if (!CFArrayContainsValue(v11, v16, v10))
            {
              Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"/dev/%@", v10);
              CFDictionarySetValue(Mutable, @"dev-entry", v13);
              if (v13) {
                CFRelease(v13);
              }
              CFTypeRef v14 = IORegistryEntryCreateCFProperty(v4, @"Content", kCFAllocatorDefault, 0);
              if (v14)
              {
                v15 = v14;
                CFDictionarySetValue(Mutable, @"content-hint", v14);
                CFRelease(v15);
              }

              CFArrayAppendValue((CFMutableArrayRef)qword_100008010, Mutable);
              if (Mutable) {
                CFRelease(Mutable);
              }
            }

            CFRelease(v10);
          }

          int v5 = 1;
        }

        IOObjectRelease(v4);
        CFRelease(v7);
      }

      else
      {
        IOObjectRelease(v4);
      }

      uint64_t result = IOIteratorNext(iterator);
      io_registry_entry_t v4 = result;
    }

    while ((_DWORD)result);
    if (v5) {
      byte_100008008 = 1;
    }
  }

  return result;
}

CFComparisonResult sub_10000356C(const __CFDictionary *a1, const __CFDictionary *a2)
{
  Value = (const __CFString *)CFDictionaryGetValue(a1, @"dev-entry");
  io_registry_entry_t v4 = (const __CFString *)CFDictionaryGetValue(a2, @"dev-entry");
  return CFStringCompare(Value, v4, 0LL);
}

void *sub_1000035BC(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, a2) + 1;
  CFTypeRef v6 = (char *)malloc(v5);
  if (v6)
  {
    v7 = v6;
    if (CFStringGetCString(a1, v6, v5, a2))
    {
      size_t v8 = strlen(v7) + 1;
      return reallocf(v7, v8);
    }

    free(v7);
  }

  return 0LL;
}