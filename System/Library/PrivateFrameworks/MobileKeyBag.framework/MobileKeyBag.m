uint64_t storeBlastableBytes(unsigned int a1, const void *a2, size_t a3)
{
  mach_port_t v5;
  CFDictionaryRef v6;
  io_service_t MatchingService;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char outputStruct;
  uint64_t input;
  io_connect_t connect;
  connect = 0;
  input = a1;
  v5 = *MEMORY[0x1896086A8];
  v6 = IOServiceMatching("AppleEffaceableStorage");
  MatchingService = IOServiceGetMatchingService(v5, v6);
  v14 = MatchingService;
  if (MatchingService)
  {
    v15 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    if ((_DWORD)v15)
    {
      v29 = v15;
      debuglog("storeBlastableBytes", @"Unable to open service: 0x%08x", v16, v17, v18, v19, v20, v21, v15);
    }

    else
    {
      v22 = IOConnectCallMethod(connect, 6u, &input, 1u, a2, a3, 0LL, 0LL, 0LL, 0LL);
      v29 = v22;
      if ((_DWORD)v22) {
        debuglog("storeBlastableBytes", @"Can't store blastable bytes: %08x", v23, v24, v25, v26, v27, v28, v22);
      }
    }
  }

  else
  {
    debuglog( "storeBlastableBytes",  @"Can't find EffaceableStorage kext!",  v8,  v9,  v10,  v11,  v12,  v13,  outputStruct);
    v29 = 3758097084LL;
  }

  if (connect) {
    IOServiceClose(connect);
  }
  if (v14) {
    IOObjectRelease(v14);
  }
  return v29;
}

uint64_t loadBlastableBytes(unsigned int a1, void *a2, size_t *a3)
{
  io_connect_t connect = 0;
  uint64_t input = a1;
  uint32_t outputCnt = 1;
  mach_port_t v5 = *MEMORY[0x1896086A8];
  v6 = IOServiceMatching("AppleEffaceableStorage");
  io_service_t MatchingService = IOServiceGetMatchingService(v5, v6);
  io_object_t v14 = MatchingService;
  if (MatchingService)
  {
    uint64_t v15 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    if ((_DWORD)v15)
    {
      uint64_t v29 = v15;
      debuglog("loadBlastableBytes", @"Unable to open service: 0x%08x", v16, v17, v18, v19, v20, v21, v15);
    }

    else
    {
      uint64_t v22 = IOConnectCallMethod(connect, 5u, &input, 1u, 0LL, 0LL, &output, &outputCnt, a2, a3);
      uint64_t v29 = v22;
      if ((_DWORD)v22) {
        debuglog("loadBlastableBytes", @"Can't load blastable bytes: %08x", v23, v24, v25, v26, v27, v28, v22);
      }
    }
  }

  else
  {
    debuglog( "loadBlastableBytes",  @"Can't find EffaceableStorage kext!",  v8,  v9,  v10,  v11,  v12,  v13,  outputStruct);
    uint64_t v29 = 3758097084LL;
  }

  if (connect) {
    IOServiceClose(connect);
  }
  if (v14) {
    IOObjectRelease(v14);
  }
  return v29;
}

uint64_t effaceBlastableBytes(unsigned int a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  bzero(v34, 0x400uLL);
  size_t v33 = 1024LL;
  io_connect_t connect = 0;
  uint64_t input = a1;
  uint32_t outputCnt = 1;
  mach_port_t v2 = *MEMORY[0x1896086A8];
  v3 = IOServiceMatching("AppleEffaceableStorage");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  io_object_t v11 = MatchingService;
  if (MatchingService)
  {
    uint64_t v12 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    if ((_DWORD)v12)
    {
      uint64_t v19 = v12;
      debuglog("effaceBlastableBytes", @"Unable to open service: 0x%08x", v13, v14, v15, v16, v17, v18, v12);
    }

    else
    {
      uint64_t v19 = IOConnectCallMethod(connect, 5u, &input, 1u, 0LL, 0LL, &output, &outputCnt, v34, &v33);
      if (!(_DWORD)v19)
      {
        uint64_t v20 = IOConnectCallMethod(connect, 7u, &input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
        uint64_t v19 = v20;
        if ((_DWORD)v20) {
          debuglog("effaceBlastableBytes", @"efface failed: 0x%x", v21, v22, v23, v24, v25, v26, v20);
        }
      }
    }
  }

  else
  {
    debuglog("effaceBlastableBytes", @"Can't find EffaceableStorage kext!", v5, v6, v7, v8, v9, v10, outputStruct);
    uint64_t v19 = 3758097084LL;
  }

  if (connect) {
    IOServiceClose(connect);
  }
  if (v11) {
    IOObjectRelease(v11);
  }
  return v19;
}

uint64_t libkeybaglog(uint64_t result, uint64_t a2)
{
  if (_logFunction) {
    return _logFunction(result, a2);
  }
  return result;
}

uint64_t _libkeybaglog(uint64_t result, uint64_t a2)
{
  mach_port_t v2 = _logFunction;
  if (_logFunction)
  {
    if (_logFunction_v) {
      mach_port_t v2 = (uint64_t (*)(uint64_t, uint64_t))_logFunction_v;
    }
    return v2(result, a2);
  }

  return result;
}

uint64_t (*KBSetLogger(uint64_t (*result)(void, void)))(void, void)
{
  _logFunction = result;
  return result;
}

uint64_t KBSetLogger_v(uint64_t result)
{
  _logFunction_v = result;
  return result;
}

CFDictionaryRef HealthPlistGetBuild(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DSEUN");
  }
  return result;
}

uint64_t HealthPlistSetBuild(CFMutableDictionaryRef theDict, void *value)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (theDict)
  {
    if (value)
    {
      CFDictionarySetValue(theDict, @"_DSEUN", value);
      return 0LL;
    }
  }

  return result;
}

CFDictionaryRef HealthPlistGetFailed(const __CFDictionary *result)
{
  uint64_t valuePtr = 0LL;
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"_DFAIL");
    if (result)
    {
      v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t HealthPlistSetFailed(__CFDictionary *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    debuglog("HealthPlistSetFailed", @"unable to allocate", v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }

  CFDictionarySetValue(a1, @"_DFAIL", v3);
  return 0LL;
}

uint64_t HealthPlistSetTTR(CFMutableDictionaryRef theDict, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (!theDict) {
    return 0xFFFFFFFFLL;
  }
  if (a2 < 1)
  {
    CFDictionaryRemoveValue(theDict, @"_DTTR");
    return 0LL;
  }

  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    debuglog("HealthPlistSetTTR", @"unable to allocate", v4, v5, v6, v7, v8, v9, v12);
    return 0xFFFFFFFFLL;
  }

  CFNumberRef v10 = v3;
  CFDictionarySetValue(theDict, @"_DTTR", v3);
  CFRelease(v10);
  return 0LL;
}

CFDictionaryRef HealthPlistGetTTR(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DTTR");
  }
  return result;
}

uint64_t HealthPlistConsumeTTR(CFDictionaryRef theDict, void *a2)
{
  uint64_t valuePtr = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  if (theDict && a2)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"_DTTR");
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr))
      {
        CFDictionaryRemoveValue(theDict, @"_DTTR");
        uint64_t result = 0LL;
        *a2 = valuePtr;
        return result;
      }

      debuglog("HealthPlistConsumeTTR", @"invalid ttr format", v6, v7, v8, v9, v10, v11, v12);
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

CFDictionaryRef HealthPlistGetVersion(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DVERS");
  }
  return result;
}

uint64_t HealthPlistSetVersion(__CFDictionary *a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, @"_DVERS", v3);
    return 0LL;
  }

  else
  {
    debuglog("HealthPlistSetVersion", @"cant allocate mem", v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
}

uint64_t HealthPlistSetCurrentVersion(__CFDictionary *a1)
{
  return HealthPlistSetVersion(a1, 7);
}

CFDictionaryRef HealthPlistGetTime(const __CFDictionary *result)
{
  uint64_t valuePtr = 0LL;
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"_DTIME");
    if (result)
    {
      v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t HealthPlistSetTime(__CFDictionary *a1, uint64_t a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, @"_DTIME", v3);
    return 0LL;
  }

  else
  {
    debuglog("HealthPlistSetTime", @"cant allocate mem", v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }

CFDictionaryRef HealthPlistGetData(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"_DDATA");
  }
  return result;
}

uint64_t HealthPlistSetData(__CFDictionary *a1, void *value)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFDictionarySetValue(a1, @"_DDATA", value);
  return 0LL;
}

uint64_t HealthPlistAddToData(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
  if (!v4)
  {
    debuglog("HealthPlistAddToData", @"unable to allocate", v5, v6, v7, v8, v9, v10, v21);
    return 0xFFFFFFFFLL;
  }

  CFNumberRef v11 = v4;
  Value = (__CFArray *)CFDictionaryGetValue(a1, @"_DDATA");
  if (Value)
  {
    Mutable = Value;
    CFRetain(Value);
  }

  else
  {
    Mutable = CFArrayCreateMutable(v3, 0LL, MEMORY[0x189605228]);
  }

  CFArrayAppendValue(Mutable, v11);
  if (CFArrayGetCount(Mutable) >= 15)
  {
    debuglog( "HealthPlistAddToData",  @"at capacity, forgetting oldest data entry",  v14,  v15,  v16,  v17,  v18,  v19,  v21);
    CFArrayRemoveValueAtIndex(Mutable, 0LL);
  }

  CFDictionarySetValue(a1, @"_DDATA", Mutable);
  CFRelease(v11);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return 0LL;
}

const char *_HealthPlistGetPlistPath()
{
  return "/var/root/.mkb_seshat_health";
}

CFDictionaryRef HealthPlistCopyOrCreateNew()
{
  binary_dict = (const __CFDictionary *)load_binary_dict("/var/root/.mkb_seshat_health");
  if (binary_dict)
  {
    Mutable = binary_dict;
    int valuePtr = 0;
    Value = (const __CFNumber *)CFDictionaryGetValue(binary_dict, @"_DVERS");
    if (!Value)
    {
      v54 = @"no version";
      goto LABEL_34;
    }

    uint64_t v15 = Value;
    CFTypeID v16 = CFGetTypeID(Value);
    if (v16 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
      {
        if (valuePtr != 7)
        {
          debuglog("validate_health_plist", @"non-current version %d", v9, v10, v11, v12, v13, v14, valuePtr);
          goto LABEL_28;
        }

        uint64_t v17 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"_DTIME");
        if (v17)
        {
          uint64_t v18 = v17;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 != CFNumberGetTypeID())
          {
            v54 = @"time stamp is of wrong type";
            goto LABEL_34;
          }

          if (!CFNumberGetValue(v18, kCFNumberLongType, v58))
          {
            v54 = @"invalid timestamp";
            goto LABEL_34;
          }
        }

        uint64_t v20 = (__CFArray *)CFDictionaryGetValue(Mutable, @"_DDATA");
        CFMutableArrayRef MutableCopy = v20;
        if (!v20)
        {
LABEL_17:
          uint64_t v26 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"_DFAIL");
          if (!v26) {
            goto LABEL_20;
          }
          uint64_t v27 = v26;
          CFTypeID v28 = CFGetTypeID(v26);
          if (v28 != CFNumberGetTypeID())
          {
            v55 = @"fail indicator is of wrong type";
            goto LABEL_47;
          }

          if (!CFNumberGetValue(v27, kCFNumberLongType, v57))
          {
            v55 = @"invalid fail indicator";
          }

          else
          {
LABEL_20:
            uint64_t v35 = CFDictionaryGetValue(Mutable, @"_DSEUN");
            if (v35 && (CFTypeID v36 = CFGetTypeID(v35), v36 != CFStringGetTypeID()))
            {
              v55 = @"build is of wrong type";
            }

            else
            {
              v37 = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"_DTTR");
              if (!v37) {
                goto LABEL_25;
              }
              v38 = v37;
              CFTypeID v39 = CFGetTypeID(v37);
              if (v39 == CFNumberGetTypeID())
              {
                if (CFNumberGetValue(v38, kCFNumberSInt64Type, v58))
                {
LABEL_25:
                  char v40 = 1;
                  if (!MutableCopy) {
                    goto LABEL_27;
                  }
                  goto LABEL_26;
                }

                v55 = @"invalid ttr timestamp";
              }

              else
              {
                v55 = @"ttr time stamp is of wrong type";
              }
            }
          }

LABEL_47:
          debuglog("validate_health_plist", v55, v29, v30, v31, v32, v33, v34, v56);
          char v40 = 0;
          if (!MutableCopy)
          {
LABEL_27:
            if ((v40 & 1) != 0) {
              goto LABEL_30;
            }
            goto LABEL_28;
          }

LABEL_26:
          CFRelease(MutableCopy);
          goto LABEL_27;
        }

        CFTypeID v22 = CFGetTypeID(v20);
        if (v22 == CFArrayGetTypeID())
        {
          if (CFArrayGetCount(MutableCopy) >= 1)
          {
            CFIndex v23 = 0LL;
            while (1)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, v23);
              if (!ValueAtIndex) {
                break;
              }
              CFTypeID v25 = CFGetTypeID(ValueAtIndex);
              if (v25 != CFNumberGetTypeID()) {
                break;
              }
              if (CFArrayGetCount(MutableCopy) <= ++v23) {
                goto LABEL_16;
              }
            }

            v54 = @"data inconsistent";
            goto LABEL_34;
          }

LABEL_16:
          CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MutableCopy);
          CFDictionarySetValue(Mutable, @"_DDATA", MutableCopy);
          goto LABEL_17;
        }

        v54 = @"data is of wrong type";
      }

      else
      {
        v54 = @"invalid version format";
      }
    }

    else
    {
      v54 = @"version is of wrong type";
    }

      uint64_t v6 = 4294967290LL;
LABEL_17:
      MKBFileClose(v5, v7, v8, v9, v10, v11, v12, v13);
      return v6;
    }

    uint64_t v14 = *((_DWORD *)v5 + 257);
    if (v14 == -1) {
      goto LABEL_16;
    }
  }

LABEL_34:
    debuglog("validate_health_plist", v54, v9, v10, v11, v12, v13, v14, v56);
LABEL_28:
    CFRelease(Mutable);
  }

  debuglog( "HealthPlistCopyOrCreateNew",  @"health plist doesnt exist or wrong version, creating new one",  v1,  v2,  v3,  v4,  v5,  v6,  v56);
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (!Mutable)
  {
    debuglog("HealthPlistCopyOrCreateNew", @"Can't create dict", v41, v42, v43, v44, v45, v46, v56);
    return Mutable;
  }

LABEL_30:
  if (HealthPlistSetVersion(Mutable, 7))
  {
    debuglog("HealthPlistCopyOrCreateNew", @"cant set version", v47, v48, v49, v50, v51, v52, v56);
    CFRelease(Mutable);
    return 0LL;
  }

  return Mutable;
}

uint64_t HealthPlistSerialize(const void *a1)
{
  else {
    return 0LL;
  }
}

uint64_t HealthPlistTest()
{
  New = HealthPlistCopyOrCreateNew();
  if (!New) {
    goto LABEL_88;
  }
  uint64_t v7 = New;
  if (CFDictionaryGetCount(New) != 1) {
    goto LABEL_89;
  }
  CFRelease(v7);
  uint64_t v14 = HealthPlistCopyOrCreateNew();
  if (!v14)
  {
LABEL_88:
    v72 = @"failed to copy health plist";
LABEL_95:
    debuglog("HealthPlistTest", v72, v1, v2, v3, v4, v5, v6, v76);
    return 0xFFFFFFFFLL;
  }

  uint64_t v7 = v14;
  if (CFDictionaryGetCount(v14) != 1)
  {
LABEL_89:
    debuglog("HealthPlistTest", @"unexpected contents", v8, v9, v10, v11, v12, v13, v76);
    goto LABEL_90;
  }

  CFRelease(v7);
  plist_with_version = _create_plist_with_version(8);
  if (!plist_with_version)
  {
LABEL_94:
    v72 = @"cant create dict";
    goto LABEL_95;
  }

  uint64_t v7 = plist_with_version;
  if (store_binary_dict(plist_with_version, "/var/root/.mkb_seshat_health"))
  {
LABEL_90:
    CFTypeID v28 = 0LL;
    goto LABEL_56;
  }

  CFRelease(v7);
  CFTypeID v16 = HealthPlistCopyOrCreateNew();
  if (!v16) {
    goto LABEL_88;
  }
  uint64_t v7 = v16;
  if (CFDictionaryGetCount(v16) != 1) {
    goto LABEL_89;
  }
  CFRelease(v7);
  uint64_t v17 = _create_plist_with_version(6);
  if (!v17) {
    goto LABEL_94;
  }
  uint64_t v7 = v17;
  CFRelease(v7);
  uint64_t v18 = HealthPlistCopyOrCreateNew();
  if (!v18) {
    goto LABEL_88;
  }
  uint64_t v7 = v18;
  if (CFDictionaryGetCount(v18) != 1) {
    goto LABEL_89;
  }
  CFRelease(v7);
  CFTypeID v19 = _create_plist_with_version(7);
  if (!v19) {
    goto LABEL_94;
  }
  uint64_t v7 = v19;
  CFRelease(v7);
  uint64_t v20 = HealthPlistCopyOrCreateNew();
  if (!v20) {
    goto LABEL_88;
  }
  uint64_t v7 = v20;
  if (CFDictionaryGetCount(v20) != 1) {
    goto LABEL_89;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue(v7, @"_DVERS");
  CFTypeID v28 = Value;
  if (!Value)
  {
    v73 = @"missing version";
    goto LABEL_110;
  }

  int valuePtr = 0;
  if (!CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
  {
    v73 = @"cant get version";
    goto LABEL_110;
  }

  if (valuePtr != 7)
  {
    v73 = @"version is invalid";
    goto LABEL_110;
  }

  CFRelease(v7);
  uint64_t v29 = _create_plist_with_version(7);
  if (!v29) {
    goto LABEL_96;
  }
  uint64_t v7 = v29;
  CFDictionarySetValue(v29, @"_DSEUN", @"15A123");
  CFRelease(v7);
  CFTypeID v36 = HealthPlistCopyOrCreateNew();
  if (!v36)
  {
LABEL_102:
    v75 = @"failed to copy health plist";
    goto LABEL_103;
  }

  uint64_t v7 = v36;
  if (CFDictionaryGetCount(v36) != 2)
  {
    v73 = @"unexpected contents";
    goto LABEL_110;
  }

  CFRelease(v7);
  v37 = _create_plist_with_version(7);
  if (!v37)
  {
LABEL_96:
    v75 = @"cant create dict";
LABEL_103:
    debuglog("HealthPlistTest", v75, v30, v31, v32, v33, v34, v35, v76);
    uint64_t v63 = 0xFFFFFFFFLL;
    goto LABEL_82;
  }

  uint64_t v7 = v37;
  if (HealthPlistAddToData(v37, 1LL) || HealthPlistAddToData(v7, 2LL))
  {
LABEL_97:
    v73 = @"cant add";
    goto LABEL_110;
  }

  CFRelease(v7);
  v38 = HealthPlistCopyOrCreateNew();
  if (!v38) {
    goto LABEL_102;
  }
  uint64_t v7 = v38;
  CFTypeID v39 = (const __CFArray *)CFDictionaryGetValue(v38, @"_DDATA");
  if (!v39)
  {
LABEL_92:
    v73 = @"failed to get data";
LABEL_110:
    debuglog("HealthPlistTest", v73, v22, v23, v24, v25, v26, v27, v76);
    goto LABEL_56;
  }

  if (CFArrayGetCount(v39) != 2)
  {
LABEL_98:
    v73 = @"invalid count";
    goto LABEL_110;
  }

  CFRelease(v7);
  char v40 = _create_plist_with_version(7);
  if (!v40) {
    goto LABEL_96;
  }
  uint64_t v7 = v40;
  for (uint64_t i = 0LL; i != 28; ++i)
  {
    if (HealthPlistAddToData(v7, i))
    {
      v71 = @"cant add";
LABEL_85:
      debuglog("HealthPlistTest", v71, v42, v43, v44, v45, v46, v47, v76);
LABEL_86:
      if (v7) {
        goto LABEL_56;
      }
LABEL_57:
      uint64_t v63 = 0xFFFFFFFFLL;
      if (v28) {
        goto LABEL_82;
      }
      return v63;
    }
  }

  CFRelease(v7);
  uint64_t v48 = HealthPlistCopyOrCreateNew();
  if (!v48) {
    goto LABEL_93;
  }
  uint64_t v7 = v48;
  v55 = (const __CFArray *)CFDictionaryGetValue(v48, @"_DDATA");
  if (!v55) {
    goto LABEL_92;
  }
  char v56 = v55;
  if (CFArrayGetCount(v55) != 14) {
    goto LABEL_98;
  }
  if (CFArrayGetCount(v56) != 14) {
    goto LABEL_98;
  }
  CFRelease(v7);
  v57 = _create_plist_with_version(7);
  if (!v57) {
    goto LABEL_99;
  }
  uint64_t v7 = v57;
  if (HealthPlistGetTime(v57))
  {
    v73 = @"no time";
    goto LABEL_110;
  }

  CFRelease(v7);
  v58 = HealthPlistCopyOrCreateNew();
  if (!v58)
  {
LABEL_93:
    v74 = @"failed to copy health plist";
LABEL_100:
    debuglog("HealthPlistTest", v74, v49, v50, v51, v52, v53, v54, v76);
    goto LABEL_57;
  }

  uint64_t v7 = v58;
  Time = HealthPlistGetTime(v58);
  if (Time != (const __CFDictionary *)123) {
    goto LABEL_91;
  }
  if (HealthPlistSetTime(v7, 1123LL))
  {
LABEL_104:
    v73 = @"cant set time";
    goto LABEL_110;
  }

  Time = HealthPlistGetTime(v7);
  if (Time != (const __CFDictionary *)1123)
  {
LABEL_91:
    if (Time) {
      goto LABEL_56;
    }
    goto LABEL_92;
  }

  CFRelease(v7);
  v60 = _create_plist_with_version(7);
  if (!v60) {
    goto LABEL_99;
  }
  uint64_t v7 = v60;
  if (CFDictionaryGetValue(v60, @"_DSEUN")
    || (CFDictionarySetValue(v7, @"_DSEUN", @"12A123"),
        CFDictionarySetValue(v7, @"_DSEUN", @"12A124"),
        store_binary_dict(v7, "/var/root/.mkb_seshat_health")))
  {
LABEL_56:
    CFRelease(v7);
    goto LABEL_57;
  }

  CFRelease(v7);
  v61 = HealthPlistCopyOrCreateNew();
  if (!v61) {
    goto LABEL_93;
  }
  uint64_t v7 = v61;
  v62 = (const __CFString *)CFDictionaryGetValue(v61, @"_DSEUN");
  if (!v62 || CFStringCompare(v62, @"12A124", 0LL)) {
    goto LABEL_56;
  }
  CFRelease(v7);
  v64 = _create_plist_with_version(7);
  if (!v64)
  {
LABEL_99:
    v74 = @"cant create dict";
    goto LABEL_100;
  }

  uint64_t v7 = v64;
  if (HealthPlistGetFailed(v64)
    || HealthPlistSetFailed(v7, -1LL)
    || HealthPlistGetFailed(v7) != (const __CFDictionary *)-1LL
    || store_binary_dict(v7, "/var/root/.mkb_seshat_health"))
  {
    goto LABEL_56;
  }

  CFRelease(v7);
  v65 = HealthPlistCopyOrCreateNew();
  if (!v65) {
    goto LABEL_93;
  }
  uint64_t v7 = v65;
  if (HealthPlistGetFailed(v65) != (const __CFDictionary *)-1LL) {
    goto LABEL_56;
  }
  CFRelease(v7);
  uint64_t v76 = 0LL;
  v66 = _create_plist_with_version(7);
  uint64_t v7 = v66;
  if (!v66) {
    goto LABEL_112;
  }
  if (CFDictionaryGetValue(v66, @"_DTTR")) {
    goto LABEL_101;
  }
  CFDictionaryRemoveValue(v7, @"_DTTR");
  if (CFDictionaryGetValue(v7, @"_DTTR")) {
    goto LABEL_101;
  }
  time_t v67 = time(0LL);
  if (!CFDictionaryGetValue(v7, @"_DTTR")) {
    goto LABEL_101;
  }
  if (HealthPlistConsumeTTR(v7, &v76))
  {
LABEL_113:
    v71 = @"failed to consume TTR entry";
    goto LABEL_85;
  }

  if (v76 < 1)
  {
LABEL_114:
    v71 = @"empty time";
    goto LABEL_85;
  }

  if (CFDictionaryGetValue(v7, @"_DTTR"))
  {
LABEL_101:
    v71 = @"unexpected TTR entry";
    goto LABEL_85;
  }

  time_t v68 = time(0LL);
  if (HealthPlistSetTTR(v7, v68))
  {
LABEL_111:
    v71 = @"addition of TTR failed";
    goto LABEL_85;
  }

  CFRelease(v7);
  v69 = HealthPlistCopyOrCreateNew();
  uint64_t v7 = v69;
  if (!v69)
  {
LABEL_112:
    v71 = @"cant create dict";
    goto LABEL_85;
  }

  if (!CFDictionaryGetValue(v69, @"_DTTR"))
  {
    v71 = @"no TTR entry";
    goto LABEL_85;
  }

  if (v76 < 1) {
    goto LABEL_114;
  }
  if (CFDictionaryGetValue(v7, @"_DTTR")) {
    goto LABEL_101;
  }
  CFRelease(v7);
  uint64_t v63 = 0LL;
  if (!v28) {
    return v63;
  }
LABEL_82:
  CFRelease(v28);
  return v63;
}

__CFDictionary *_create_plist_with_version(int a1)
{
  New = HealthPlistCopyOrCreateNew();
  uint64_t v9 = New;
  if (New)
  {
    if (HealthPlistSetVersion(New, a1))
    {
      CFRelease(v9);
      return 0LL;
    }
  }

  else
  {
    debuglog("_create_plist_with_version", @"failed to copy health plist", v3, v4, v5, v6, v7, v8, v11);
  }

  return v9;
}

CFDictionaryRef KBLoadSystemKeyBag()
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  uint64_t v6 = 0LL;
  if (!KBLoadLoadKeyBagFile(__str, "systembag", (CFPropertyListRef *)&v15))
  {
    uint64_t v6 = v15;
    if (v15)
    {
      if (!_getData(v15, @"KeyBagKeys"))
      {
        debuglog( "KBLoadSystemKeyBag",  @"Keybag %s doesn't actually contain keys",  v8,  v9,  v10,  v11,  v12,  v13,  (char)__str);
        CFRelease(v6);
        return 0LL;
      }
    }

    else
    {
      debuglog( "KBLoadSystemKeyBag",  @" Empty Keybag returned from KBLoadLoadKeyBagFile",  v0,  v1,  v2,  v3,  v4,  v5,  v14);
    }
  }

  return v6;
}

uint64_t KBLoadLoadKeyBagFile(const char *a1, const char *a2, CFPropertyListRef *a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x401uLL, "%s/%s.kb", a1, a2);
  binary_dict = (const __CFDictionary *)load_binary_dict(__str);
  uint64_t v5 = binary_dict;
  if (binary_dict) {
    BOOL v6 = CFDictionaryGetValue(binary_dict, @"KeybagxART") != 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = MKBDeviceTreeContainsKey(":/defaults", @"no-effaceable-storage");
  if (v6 || v7)
  {
    *a3 = 0LL;
    CFTypeID v16 = load_binary_dict(__str);
    *a3 = v16;
    if (!v16)
    {
      snprintf(v26, 0x401uLL, "%s.writing", __str);
      uint64_t v17 = load_binary_dict(v26);
      *a3 = v17;
      if (!v17)
      {
        uint64_t v15 = 4294967289LL;
        debuglog( "KBLoadLoadKeyBagFile",  @"Unable to load keybag with No Crypto: %d",  v18,  v19,  v20,  v21,  v22,  v23,  -7);
        if (!v5) {
          return v15;
        }
        goto LABEL_13;
      }
    }

    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t ObjectWithCrypto = KBSecureLoadObjectWithCrypto(__str, a3);
    uint64_t v15 = ObjectWithCrypto;
    if ((_DWORD)ObjectWithCrypto)
    {
      debuglog( "KBLoadLoadKeyBagFile",  @"Unable to load keybag with Crypto: %d",  v9,  v10,  v11,  v12,  v13,  v14,  ObjectWithCrypto);
      if (!v5) {
        return v15;
      }
      goto LABEL_13;
    }
  }

  if (v5) {
LABEL_13:
  }
    CFRelease(v5);
  return v15;
}

void KBCleanupSystemKeyBag( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x401uLL, "%s%s/%s.kb", "/private/var/", "keybags", "systembag");
  if (unlink(__str))
  {
    if (*__error() != 2)
    {
      uint64_t v15 = __error();
      char v16 = strerror(*v15);
      debuglog( "KBCleanupSystemKeyBag",  @"Failed to delete System KeyBag plist: %s",  v17,  v18,  v19,  v20,  v21,  v22,  v16);
    }
  }

  else
  {
    debuglog("KBCleanupSystemKeyBag", @"Deleted System KeyBag plist", v9, v10, v11, v12, v13, v14, a9);
  }

CFMutableDictionaryRef KBLoadUserKeybag(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v17 = 0LL;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  int KeyBagFile = KBLoadLoadKeyBagFile(__str, "userbag", (CFPropertyListRef *)&v17);
  uint64_t v3 = v17;
  if (!KeyBagFile && v17)
  {
    uint64_t v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%d", a1);
    if (!v5)
    {
      CFMutableDictionaryRef MutableCopy = 0LL;
      goto LABEL_10;
    }

    BOOL v6 = (const __CFDictionary *)v5;
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, v5);
    if (Value)
    {
      uint64_t v8 = Value;
      if (_getData(Value, @"KeyBagKeys"))
      {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v4, 0LL, v8);
LABEL_9:
        CFRelease(v3);
        uint64_t v3 = v6;
LABEL_10:
        CFRelease(v3);
        return MutableCopy;
      }

      debuglog( "KBLoadUserKeybag",  @"Keybag %s doesn't actually contain keys",  v9,  v10,  v11,  v12,  v13,  v14,  (char)__str);
    }

    CFMutableDictionaryRef MutableCopy = 0LL;
    goto LABEL_9;
  }

  CFMutableDictionaryRef MutableCopy = 0LL;
  CFMutableDictionaryRef result = 0LL;
  if (v17) {
    goto LABEL_10;
  }
  return result;
}

uint64_t KBSavePublicBackupBag(const void *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x401uLL, "%s/%s", "/private/var/", "keybags");
  uint64_t v2 = KBLoadSystemKeyBag();
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  if (a1) {
    CFDictionarySetValue(v2, @"BackupKeyBagKeys", a1);
  }
  else {
    CFDictionaryRemoveValue(v2, @"BackupKeyBagKeys");
  }
  else {
    uint64_t v7 = 0LL;
  }
  CFRelease(v3);
  return v7;
}

uint64_t KBSaveKeyBag( const __CFDictionary *a1, const char *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  unsigned int v10 = a3;
  uint64_t v193 = *MEMORY[0x1895F89C0];
  unsigned int v13 = KBisxARTBasedKeyBag(-1, a1, a3, (uint64_t)a4, a5, a6, a7, a8);
  CFDictionarySetValue(a1, @"KeyBagVersion", @"1");
  if (v13) {
    CFDictionarySetValue(a1, @"KeybagxART", @"1");
  }
  if (mkdir(a2, 0x1C0u) && *__error() != 17)
  {
    v38 = __error();
    strerror(*v38);
    debuglog("KBSaveKeyBag", @"Can't create %s: %s", v39, v40, v41, v42, v43, v44, (char)a2);
    return 0xFFFFFFFFLL;
  }

  snprintf(__str, 0x401uLL, "%s/%s.kb", a2, a4);
  else {
    char v14 = v13;
  }
  if ((v14 & 1) != 0)
  {
    bzero(__old, 0x401uLL);
    uint64_t v15 = 0xFFFFFFFFLL;
    int v189 = -1;
    snprintf(__old, 0x401uLL, "%s.writing", __str);
    if (!store_binary_dict_fd(a1, __old, &v189))
    {
      if (renamex_np(__old, __str, 2u) && (__error(), rename(__old, __str)))
      {
        v168 = __error();
        strerror(*v168);
        debuglog( "KBSecureSaveObjectNoCrypto",  @"could not rename %s to %s: %s (%d)",  v169,  v170,  v171,  v172,  v173,  v174,  (char)__old);
      }

      else if (fcntl(v189, 51))
      {
        v151 = __error();
        strerror(*v151);
        debuglog( "KBSecureSaveObjectNoCrypto",  @"Unable to fsync %s: %s",  v152,  v153,  v154,  v155,  v156,  v157,  (char)__old);
      }

      else
      {
        if (unlink(__old))
        {
          char v16 = __error();
          char v17 = strerror(*v16);
          debuglog("KBSecureSaveObjectNoCrypto", @"unlink failed: %s", v18, v19, v20, v21, v22, v23, v17);
        }

        uint64_t v15 = 0LL;
      }
    }

    if (v189 != -1 && close(v189))
    {
      char v24 = v189;
      uint64_t v25 = __error();
      strerror(*v25);
      debuglog("KBSecureSaveObjectNoCrypto", @"failed to close(%d): %s", v26, v27, v28, v29, v30, v31, v24);
    }

    return v15;
  }

  CCCryptorRef cryptorRef = 0LL;
  size_t v180 = 52LL;
  memset(v187, 0, sizeof(v187));
  int v188 = 0;
  if (!v8)
  {
    uint64_t v45 = (const __SecRandom *)*MEMORY[0x18960BE08];
    if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], 0x20uLL, (char *)&v187[1] + 4))
    {
      v176 = @"Can't create key";
    }

    else
    {
      if (!SecRandomCopyBytes(v45, 0x10uLL, (char *)v187 + 4))
      {
LABEL_28:
        CFDataRef v52 = CFDataCreate(0LL, (const UInt8 *)&v187[1] + 4, 32LL);
        if (v52)
        {
          CFDataRef v59 = v52;
          CFDataRef v60 = CFDataCreate(0LL, (const UInt8 *)v187 + 4, 16LL);
          if (v60)
          {
            CFDataRef v67 = v60;
            time_t v68 = (const __CFData *)convertObjectToBinary(a1);
            if (!v68)
            {
              debuglog( "KBSecureSaveObjectWithCrypto",  @"Can't serialize object",  v69,  v70,  v71,  v72,  v73,  v74,  v177);
              v92 = 0LL;
              uint64_t v15 = 4294967291LL;
LABEL_59:
              CFRelease(v59);
              CFRelease(v67);
              if (v92) {
                CFRelease(v92);
              }
              goto LABEL_61;
            }

            v75 = v68;
            CCCryptorStatus v76 = CCCryptorCreate(0, 0, 1u, (char *)&v187[1] + 4, 0x20uLL, (char *)v187 + 4, &cryptorRef);
            if (v76)
            {
              debuglog( "KBSecureSaveObjectWithCrypto",  @"Can't create cryptor: %d",  v77,  v78,  v79,  v80,  v81,  v82,  v76);
              v92 = 0LL;
            }

            else
            {
              size_t Length = CFDataGetLength(v75);
              Outputsize_t Length = CCCryptorGetOutputLength(cryptorRef, Length, 1);
              Mutable = CFDataCreateMutable(0LL, OutputLength);
              v92 = Mutable;
              if (!Mutable)
              {
                v158 = "KBSecureSaveObjectWithCrypto";
                v159 = @"Can't create crypt buffer";
LABEL_74:
                debuglog(v158, v159, v86, v87, v88, v89, v90, v91, v177);
                uint64_t v15 = 4294967291LL;
                goto LABEL_58;
              }

              CFDataSetLength(Mutable, OutputLength);
              v93 = cryptorRef;
              BytePtr = CFDataGetBytePtr(v75);
              MutableBytePtr = CFDataGetMutableBytePtr(v92);
              CCCryptorStatus v96 = CCCryptorUpdate(v93, BytePtr, Length, MutableBytePtr, OutputLength, &dataOutMoved);
              if (!v96)
              {
                v103 = cryptorRef;
                v104 = CFDataGetMutableBytePtr(v92);
                CCCryptorFinal(v103, &v104[dataOutMoved], OutputLength - dataOutMoved, &dataOutMoved);
                unsigned int valuePtr = v10;
                CFTypeRef cf = 0LL;
                int v183 = -1;
                CFMutableDictionaryRef v105 = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
                if (v105)
                {
                  v106 = v105;
                  CFNumberRef v107 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
                  if (!v107) {
                    goto LABEL_81;
                  }
                  CFDictionaryAddValue(v106, @"_MKBIV", v67);
                  CFDictionaryAddValue(v106, @"_MKBWIPEID", v107);
                  CFDictionaryAddValue(v106, @"_MKBPAYLOAD", v92);
                  snprintf(__old, 0x401uLL, "%s.writing", __str);
                  if (renamex_np(__old, __str, 2u))
                  {
                    __error();
                    if (rename(__old, __str))
                    {
                      v175 = __error();
                      strerror(*v175);
                      v178 = __old;
                      v167 = @"could not rename %s to %s: %s (%d)";
LABEL_80:
                      debuglog("KBSecureSaveObject", v167, v128, v129, v130, v131, v132, v133, (char)v178);
                      goto LABEL_81;
                    }
                  }

                  if (fcntl(v183, 51))
                  {
                    v160 = __error();
                    strerror(*v160);
                    debuglog( "KBSecureSaveObject",  @"Unable to fsync %s: %s",  v161,  v162,  v163,  v164,  v165,  v166,  (char)__old);
LABEL_81:
                    uint64_t v15 = 0xFFFFFFFFLL;
LABEL_51:
                    if (v183 != -1 && close(v183))
                    {
                      char v142 = v183;
                      v143 = __error();
                      strerror(*v143);
                      debuglog( "KBSecureSaveObject",  @"failed to close(%d): %s",  v144,  v145,  v146,  v147,  v148,  v149,  v142);
                    }

                    CFRelease(v106);
                    if (cf) {
                      CFRelease(cf);
                    }
                    if (v107) {
                      CFRelease(v107);
                    }
                    goto LABEL_58;
                  }

                  if ((v8 & 1) == 0)
                  {
                    unsigned int v108 = valuePtr;
                    if (CFDataGetLength(v67) != 16 || CFDataGetLength(v59) != 32)
                    {
                      debuglog( "storeWipeIDInfo",  @"trying to store invalid iv or secret",  v109,  v110,  v111,  v112,  v113,  v114,  (char)v178);
                      goto LABEL_46;
                    }

                    int v189 = v108;
                    v194.location = 0LL;
                    v194.length = 16LL;
                    CFDataGetBytes(v67, v194, v190);
                    v195.location = 0LL;
                    v195.length = 32LL;
                    CFDataGetBytes(v59, v195, v191);
                    int v115 = storeBlastableBytes(v108, &v189, 0x34uLL);
                    if (v115)
                    {
                      debuglog( "storeWipeIDInfo",  @"Unable to save wipe info: %08x",  v116,  v117,  v118,  v119,  v120,  v121,  v115);
LABEL_46:
                      debuglog( "KBSecureSaveObject",  @"Oh no! Can't save wipe ID",  v122,  v123,  v124,  v125,  v126,  v127,  v179);
                    }
                  }

                  if (!KBSecureLoadObjectWithCrypto(__str, &cf))
                  {
                    if (unlink(__old))
                    {
                      v134 = __error();
                      char v135 = strerror(*v134);
                      debuglog( "KBSecureSaveObject",  @"unlink failed: %s",  v136,  v137,  v138,  v139,  v140,  v141,  v135);
                    }

                    uint64_t v15 = 0LL;
                    goto LABEL_51;
                  }

                  v167 = @"failed to validate newly created bag -- should never happen";
                  goto LABEL_80;
                }

                v158 = "KBSecureSaveObject";
                v159 = @"Can't create dict";
                goto LABEL_74;
              }

              debuglog("KBSecureSaveObjectWithCrypto", @"Can't encrypt: %d", v97, v98, v99, v100, v101, v102, v96);
            }

            uint64_t v15 = 4294967289LL;
LABEL_58:
            CFRelease(v75);
            goto LABEL_59;
          }

          debuglog("KBSecureSaveObjectWithCrypto", @"Can't create iv data", v61, v62, v63, v64, v65, v66, v177);
          CFRelease(v59);
        }

        else
        {
          debuglog("KBSecureSaveObjectWithCrypto", @"Can't create key data", v53, v54, v55, v56, v57, v58, v177);
        }

        uint64_t v15 = 4294967291LL;
        goto LABEL_61;
      }

      v176 = @"Can't create IV";
    }

    debuglog("KBSecureSaveObjectWithCrypto", v176, v46, v47, v48, v49, v50, v51, v177);
    goto LABEL_85;
  }

  debuglog("KBSecureSaveObjectWithCrypto", @"Unable to load wipe info:%08x", v32, v33, v34, v35, v36, v37, v10);
LABEL_85:
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_61:
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  return v15;
}

uint64_t KBSaveSystemBagHandle(int a1, const char *a2, const void *a3, int a4, uint64_t a5)
{
  v41[129] = *(UInt8 **)MEMORY[0x1895F89C0];
  if ((_DWORD)a5) {
    char v16 = @"Saving SystemBag with NO EFFACEABLE ROLL";
  }
  else {
    char v16 = @"Saving SystemBag with EFFACEABLE ROLL";
  }
  debuglog("KBSaveSystemBagHandle", v16, v10, v11, v12, v13, v14, v15, v38);
  int v17 = MKBDeviceSupportsEnhancedAPFS();
  if (a1 || !v17)
  {
    v41[0] = 0LL;
    *(_DWORD *)bytes = 0;
    if (!aks_save_bag())
    {
      CFDataRef v26 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v41[0],  *(int *)bytes,  (CFAllocatorRef)*MEMORY[0x189604DB0]);
      if (v26)
      {
        CFDataRef v25 = v26;
        goto LABEL_14;
      }
    }

    return 0xFFFFFFFFLL;
  }

  *(_DWORD *)bytes = 1752065072;
  LODWORD(v41[0]) = -1;
  aks_unload_bag();
  CFDataRef v18 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 4LL);
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  CFDataRef v25 = v18;
  debuglog("KBSaveSystemBagHandle", @"Saving handle 0 with the magic handle", v19, v20, v21, v22, v23, v24, v39);
LABEL_14:
  dict = create_dict();
  if (dict)
  {
    uint64_t v28 = dict;
    CFDictionaryAddValue(dict, @"KeyBagKeys", v25);
    if (a3) {
      CFDictionaryAddValue(v28, @"OpaqueStuff", a3);
    }
    if (a4)
    {
      uint64_t v29 = KBLoadSystemKeyBag();
      if (v29)
      {
        uint64_t v30 = v29;
        Value = CFDictionaryGetValue(v29, @"BackupKeyBagKeys");
        if (Value)
        {
          uint64_t v32 = Value;
          CFRetain(Value);
          CFRelease(v30);
          CFDictionarySetValue(v28, @"BackupKeyBagKeys", v32);
          uint64_t v30 = (const __CFDictionary *)v32;
        }

        CFRelease(v30);
      }
    }

    snprintf((char *)v41, 0x401uLL, "%s/%s", a2, "keybags");
    else {
      uint64_t v36 = 0LL;
    }
    CFRelease(v28);
  }

  else
  {
    uint64_t v36 = 0xFFFFFFFFLL;
  }

  CFRelease(v25);
  return v36;
}

uint64_t MKBDeviceSupportsEnhancedAPFS()
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if ((MKBDeviceSupportsEnhancedAPFS_once & 1) == 0)
  {
    int v0 = MKBDeviceTreeContainsKey(":/filesystems", @"e-apfs");
    size_t __len = 1023LL;
    bzero(__big, 0x400uLL);
    if ((check_apfs_shared_datavolume_bootarg_init & 1) == 0)
    {
      if (!sysctlbyname("kern.bootargs", __big, &__len, 0LL, 0LL) && strnstr(__big, "-apfs_shared_datavolume", __len)) {
        check_apfs_shared_datavolume_bootarg_value = 1;
      }
      check_apfs_shared_datavolume_bootarg_init = 1;
    }

    if (v0 == 1) {
      char v7 = 1;
    }
    else {
      char v7 = check_apfs_shared_datavolume_bootarg_value;
    }
    MKBDeviceSupportsEnhancedAPFS_answer = v7;
    debuglog("MKBDeviceSupportsEnhancedAPFS", @"dt = %d, bootarg = %d", v1, v2, v3, v4, v5, v6, v0);
    MKBDeviceSupportsEnhancedAPFS_once = 1;
  }

  return MKBDeviceSupportsEnhancedAPFS_answer;
}

uint64_t KBSaveUserBagHandle(int a1, uint64_t a2, const void *a3, int a4)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  memset((char *)&theDict[1] + 4, 0, 12);
  theDict[0] = 0LL;
  if ((MKBDeviceSupportsEnhancedAPFS() & 1) != 0) {
    return 0LL;
  }
  if (a4) {
    uint64_t v14 = @"Saving UserBag for uid %d with NO EFFACEABLE ROLL";
  }
  else {
    uint64_t v14 = @"Saving UserBag for uid %d with EFFACEABLE ROLL";
  }
  debuglog("KBSaveUserBagHandle", v14, v8, v9, v10, v11, v12, v13, a2);
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  uint64_t KeyBagFile = KBLoadLoadKeyBagFile(__str, "userbag", (CFPropertyListRef *)theDict);
  char v16 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (!(_DWORD)KeyBagFile
    || (theDict[0] = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250])) != 0LL)
  {
    CFStringRef v17 = CFStringCreateWithFormat(v16, 0LL, @"%d", a2);
    if (v17)
    {
      if (a1 == -1)
      {
        uint64_t v22 = theDict[0];
        CFDictionaryRemoveValue(theDict[0], v17);
        CFDataRef v19 = 0LL;
        uint64_t v21 = 0LL;
        goto LABEL_16;
      }

      if (!aks_save_bag())
      {
        CFDataRef v18 = CFDataCreateWithBytesNoCopy(v16, (const UInt8 *)theDict[2], SHIDWORD(theDict[1]), v16);
        if (v18)
        {
          CFDataRef v19 = v18;
          Mutable = CFDictionaryCreateMutable(v16, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
          if (!Mutable)
          {
            CFDateRef v24 = 0LL;
            CFDateRef v26 = 0LL;
LABEL_32:
            CFRelease(v19);
LABEL_33:
            if (theDict[0])
            {
              CFRelease(theDict[0]);
              theDict[0] = 0LL;
            }

            if (v17) {
              CFRelease(v17);
            }
            if (v24) {
              CFRelease(v24);
            }
            if (v26) {
              CFRelease(v26);
            }
            return KeyBagFile;
          }

          uint64_t v21 = Mutable;
          CFDictionarySetValue(Mutable, @"KeyBagKeys", v19);
          if (a3) {
            CFDictionarySetValue(v21, @"OpaqueStuff", a3);
          }
          uint64_t v22 = theDict[0];
          CFDictionarySetValue(theDict[0], v17, v21);
LABEL_16:
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFDateRef v24 = CFDateCreate(v16, Current);
          if (CFDictionaryGetValue(v22, @"LastWipeKeyUpdateTimeStamp"))
          {
            double v25 = MEMORY[0x186E280BC]();
            CFDateRef v26 = CFDateCreate(v16, v25 + 86400.0);
            if (CFDateCompare(v26, v24, 0LL) != kCFCompareLessThan)
            {
              if ((a4 & 1) == 0) {
                CFDictionarySetValue(v22, @"WipeKeyUpdatePending", (const void *)*MEMORY[0x189604DE8]);
              }
              goto LABEL_23;
            }

            Value = CFDictionaryGetValue(v22, @"WipeKeyUpdatePending");
            if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x189604DE8]) && (a4 & 1) != 0)
            {
LABEL_23:
              uint64_t v31 = 1LL;
              goto LABEL_26;
            }

            CFDictionarySetValue(v22, @"LastWipeKeyUpdateTimeStamp", v24);
            CFDictionarySetValue(v22, @"WipeKeyUpdatePending", (const void *)*MEMORY[0x189604DE0]);
          }

          else
          {
            CFDictionarySetValue(v22, @"WipeKeyUpdatePending", (const void *)*MEMORY[0x189604DE0]);
            CFDictionarySetValue(v22, @"LastWipeKeyUpdateTimeStamp", v24);
            CFDateRef v26 = 0LL;
          }

          uint64_t v31 = 0LL;
LABEL_26:
          else {
            uint64_t KeyBagFile = 0LL;
          }
          if (v21) {
            CFRelease(v21);
          }
          if (!v19) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
      }
    }

    CFDateRef v24 = 0LL;
    CFDateRef v26 = 0LL;
    goto LABEL_33;
  }

  return KeyBagFile;
}

uint64_t seshat_supports_upgraded_jcop_kud_policy()
{
  return 0LL;
}

const void *KBSystemKeyBagCopyOpaqueStuff()
{
  int v0 = KBLoadSystemKeyBag();
  if (!v0) {
    return 0LL;
  }
  uint64_t v1 = v0;
  Value = CFDictionaryGetValue(v0, @"OpaqueStuff");
  uint64_t v3 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v1);
  return v3;
}

uint64_t getNVRam(char *cStr, _DWORD *a2, char **a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v5 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  io_registry_entry_t v6 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/options");
  if (v6)
  {
    io_object_t v13 = v6;
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, v5, 0LL, 0);
    if (CFProperty)
    {
      uint64_t v21 = CFProperty;
      if (a2) {
        *a2 = 1;
      }
      if (a3)
      {
        CFTypeID v22 = CFGetTypeID(CFProperty);
        if (v22 == CFStringGetTypeID())
        {
          if (CFStringGetCString(v21, buffer, 1024LL, 0x8000100u)) {
            *a3 = strdup(buffer);
          }
        }

        else
        {
          CFTypeID v24 = CFGetTypeID(v21);
          if (v24 == CFDataGetTypeID())
          {
            size_t Length = CFDataGetLength((CFDataRef)v21);
            CFDateRef v26 = (char *)calloc(1uLL, Length + 1);
            *a3 = v26;
            if (v26)
            {
              uint64_t v27 = v26;
              BytePtr = CFDataGetBytePtr((CFDataRef)v21);
              memcpy(v27, BytePtr, Length);
            }
          }

          else
          {
            *a3 = 0LL;
          }
        }
      }

      CFRelease(v21);
    }

    else
    {
      debuglog("getNVRam", @"Could not create string for value", v15, v16, v17, v18, v19, v20, v30);
      if (a2) {
        *a2 = 0;
      }
    }

    IOObjectRelease(v13);
    uint64_t v23 = 0LL;
  }

  else
  {
    debuglog("getNVRam", @"Could not get options entry from the device tree", v7, v8, v9, v10, v11, v12, v30);
    uint64_t v23 = 0xFFFFFFFFLL;
  }

  CFRelease(v5);
  return v23;
}

uint64_t setNVRam(char *cStr, const char *a2)
{
  kern_return_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v3 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  io_registry_entry_t v4 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/options");
  if (v4)
  {
    io_registry_entry_t v11 = v4;
    CFStringRef v12 = CFStringCreateWithCString(0LL, a2, 0x8000100u);
    if (v12)
    {
      CFStringRef v19 = v12;
      uint64_t v20 = IORegistryEntrySetCFProperty(v11, v3, v12);
      if (v20)
      {
        debuglog("setNVRam", @"Could not save value:%08x", v21, v22, v23, v24, v25, v26, v20);
        uint64_t v27 = 0xFFFFFFFFLL;
      }

      else
      {
        uint64_t v27 = 0LL;
      }

      CFRelease(v19);
    }

    else
    {
      debuglog("setNVRam", @"Could not create string for value", v13, v14, v15, v16, v17, v18, v29);
      uint64_t v27 = 0xFFFFFFFFLL;
    }

    IOObjectRelease(v11);
  }

  else
  {
    debuglog("setNVRam", @"Could not get options entry from the device tree", v5, v6, v7, v8, v9, v10, v29);
    uint64_t v27 = 0xFFFFFFFFLL;
  }

  CFRelease(v3);
  return v27;
}

uint64_t removeNVRam(const char *a1)
{
  return setNVRam("IONVRAM-DELETE-PROPERTY", a1);
}

uint64_t is_user_primary(int a1, BOOL *a2)
{
  if (!MKBDeviceSupportsEnhancedAPFS())
  {
    CFUUIDRef v13 = 0LL;
    CFUUIDRef v23 = 0LL;
    BOOL v24 = a1 == 0;
LABEL_14:
    uint64_t v25 = 0LL;
    *a2 = v24;
    goto LABEL_15;
  }

  Value = (const __CFData *)CFDictionaryGetValue(0LL, (const void *)*MEMORY[0x18960D468]);
  if (!Value || (io_registry_entry_t v11 = Value, v12 = CFGetTypeID(Value), v12 != CFDataGetTypeID()) || CFDataGetLength(v11) != 16)
  {
    debuglog("is_user_primary", @"no user uuid in the bag %d", v5, v6, v7, v8, v9, v10, a1);
LABEL_21:
    CFUUIDRef v13 = 0LL;
    goto LABEL_23;
  }

  CFUUIDBytes v27 = *(CFUUIDBytes *)CFDataGetBytePtr(v11);
  CFUUIDRef v13 = CFUUIDCreateFromUUIDBytes(0LL, v27);
  uint64_t v14 = (const __CFData *)CFDictionaryGetValue(0LL, (const void *)*MEMORY[0x18960D460]);
  if (v14)
  {
    uint64_t v21 = v14;
    CFTypeID v22 = CFGetTypeID(v14);
    if (v22 == CFDataGetTypeID() && CFDataGetLength(v21) == 16)
    {
      CFUUIDBytes v28 = *(CFUUIDBytes *)CFDataGetBytePtr(v21);
      CFUUIDRef v23 = CFUUIDCreateFromUUIDBytes(0LL, v28);
      if (CFEqual(v23, 0LL)) {
        BOOL v24 = CFEqual(v13, 0LL) != 0;
      }
      else {
        BOOL v24 = 0;
      }
      goto LABEL_14;
    }
  }

  debuglog("is_user_primary", @"no group uuid in the bag %d", v15, v16, v17, v18, v19, v20, a1);
LABEL_23:
  CFUUIDRef v23 = 0LL;
  uint64_t v25 = 0xFFFFFFFFLL;
LABEL_15:
  if (v13) {
    CFRelease(v13);
  }
  if (v23) {
    CFRelease(v23);
  }
  return v25;
}

uint64_t KBChangeSystemSecret( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  uint64_t v10 = 0xFFFFFFFFLL;
  if (!aks_get_system())
  {
    int v58 = -1;
    unsigned int v17 = KBisxARTBasedKeyBag(a1, 0LL, v11, v12, v13, v14, v15, v16);
    char v24 = v17;
    uint64_t v25 = "two";
    if (v17) {
      uint64_t v25 = "single";
    }
    debuglog( "KBChangeSystemNonSeSecret",  @"changing non-SE passcode %s phase, (params:%d)",  v18,  v19,  v20,  v21,  v22,  v23,  (char)v25);
    char v57 = 0;
    int v26 = aks_change_secret_opts();
    if (v26)
    {
      debuglog("KBChangeSystemNonSeSecret", @"change-secret failed %x", v27, v28, v29, v30, v31, v32, v26);
      goto LABEL_33;
    }

    if ((v24 & 1) == 0)
    {
      debuglog("KBChangeSystemNonSeSecret", @"temp handle is invalid: %d", v27, v28, v29, v30, v31, v32, -1);
      goto LABEL_33;
    }

    int v58 = a1;
    if (a1)
    {
    }

    else if (!KBSaveSystemBagHandle(0, "/private/var/", a7, 1, 0LL))
    {
LABEL_10:
      if ((v24 & 1) == 0)
      {
        int v39 = aks_set_system_with_passcode();
        if (v39)
        {
          debuglog("KBChangeSystemNonSeSecret", @"set-system failed %d", v40, v41, v42, v43, v44, v45, v39);
          char v48 = 0;
          int v47 = 1;
LABEL_14:
          if (v58 == -1) {
            char v49 = 1;
          }
          else {
            char v49 = v24;
          }
          if ((v49 & 1) == 0) {
            aks_unload_bag();
          }
          if (!v47) {
            goto LABEL_23;
          }
          if (a1)
          {
          }

          else if (!KBSaveSystemBagHandle(0, "/private/var/", a7, 1, 1LL))
          {
LABEL_23:
            if ((v48 & 1) != 0) {
              return 0LL;
            }
            debuglog("KBChangeSystemSecret", @"Failed to change non-se pw", v51, v52, v53, v54, v55, v56, v57);
            return 0xFFFFFFFFLL;
          }

          debuglog( "KBChangeSystemNonSeSecret",  @"welp, unable to persist old bag",  v51,  v52,  v53,  v54,  v55,  v56,  v57);
          goto LABEL_23;
        }
      }

      int v46 = aks_change_secret_epilogue();
      if (!v46)
      {
        int v47 = 0;
        char v48 = 1;
        goto LABEL_14;
      }

      debuglog( "KBChangeSystemNonSeSecret",  @"aks_change_secret_epilogue() failed %x",  v51,  v52,  v53,  v54,  v55,  v56,  v46);
LABEL_33:
      char v48 = 0;
      int v47 = 0;
      goto LABEL_14;
    }

    debuglog("KBChangeSystemNonSeSecret", @"unable to save bag %d", v33, v34, v35, v36, v37, v38, a1);
    goto LABEL_33;
  }

  return v10;
}

uint64_t KBChangeSystemSecretWithEscrow( const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }

  if ((MKBDeviceSupportsEnhancedAPFS() & 1) != 0) {
    return 0LL;
  }
  return KBSaveSystemBagHandle(0, "/private/var/", a7, 1, 0LL);
}

uint64_t MKBDeviceTreeContainsKey(const char *a1, const __CFString *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  size_t v4 = strlen(a1) + 13;
  uint64_t v5 = (char *)malloc(v4);
  if (!v5) {
    return 4294967291LL;
  }
  uint64_t v6 = v5;
  snprintf(v5, v4, "%s%s", "IODeviceTree", a1);
  io_registry_entry_t v7 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], v6);
  if (v7)
  {
    io_object_t v8 = v7;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v7, a2, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      uint64_t v10 = 1LL;
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    IOObjectRelease(v8);
  }

  else
  {
    uint64_t v10 = 4294967288LL;
  }

  free(v6);
  return v10;
}

uint64_t MKBDeviceSupportsContentProtection()
{
  return MKBDeviceTreeContainsKey(":/defaults", @"content-protect");
}

BOOL MKBDeviceSupportsEffaceableStorage()
{
  return MKBDeviceTreeContainsKey(":/defaults", @"no-effaceable-storage") == 0;
}

uint64_t KBUpdateKeyBag(int a1, uint64_t a2)
{
  if (a1) {
    size_t v4 = KBLoadUserKeybag(-a1);
  }
  else {
    size_t v4 = KBLoadSystemKeyBag();
  }
  uint64_t v11 = v4;
  if (v4)
  {
    Value = CFDictionaryGetValue(v4, @"OpaqueStuff");
    uint64_t v13 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v11);
    debuglog("KBUpdateKeyBag", @"Got opaqueStuff from ondisk keybag", v14, v15, v16, v17, v18, v19, v29);
    if (aks_get_system())
    {
      uint64_t v27 = 0xFFFFFFFFLL;
      if (!v13) {
        return v27;
      }
      goto LABEL_13;
    }

    if (a1) {
      uint64_t v20 = KBSaveUserBagHandle(v30, -a1, v13, a2);
    }
    else {
      uint64_t v20 = KBSaveSystemBagHandle(v30, "/private/var/", v13, 1, a2);
    }
    uint64_t v27 = v20;
    debuglog("KBUpdateKeyBag", @"Saved new keybag for handle %d with result %d", v21, v22, v23, v24, v25, v26, a1);
    if (v13) {
LABEL_13:
    }
      CFRelease(v13);
  }

  else
  {
    debuglog( "KBUpdateKeyBag",  @"failed to open ondisk keybag, failing UpdateKeyBag",  v5,  v6,  v7,  v8,  v9,  v10,  v29);
    return 0xFFFFFFFFLL;
  }

  return v27;
}

void KBSetCookie(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5)
{
  uint64_t v9 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v9)
  {
    uint64_t v24 = @"Failed to open APFS framework";
    goto LABEL_8;
  }

  uint64_t v16 = dlsym(v9, "APFSVolumePayloadSet");
  if (!v16)
  {
    uint64_t v24 = @"Failed to resolve gAPFSVolumePayloadSet";
LABEL_8:
    debuglog("KBSetCookie", v24, v10, v11, v12, v13, v14, v15, v34);
    uint64_t v16 = 0LL;
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }

  if (a5)
  {
LABEL_4:
    int v17 = aks_copy_volume_cookie_persona();
    if (v17)
    {
      debuglog( "KBSetCookie",  @"Failed to get keybag persona Cookiefrom AKS:0x%x",  v18,  v19,  v20,  v21,  v22,  v23,  v17);
      goto LABEL_17;
    }

    uint64_t v26 = @"Retrieved keybag persona Cookie from AKS, setting in APFS volume";
    goto LABEL_13;
  }

LABEL_9:
  int v25 = aks_copy_volume_cookie();
  if (v25)
  {
    debuglog("KBSetCookie", @"Failed to get keybag Cookie from AKS:0x%x", v18, v19, v20, v21, v22, v23, v25);
    goto LABEL_17;
  }

  uint64_t v26 = @"Retrieved keybag Cookie from AKS, setting in APFS volume";
LABEL_13:
  debuglog("KBSetCookie", v26, v18, v19, v20, v21, v22, v23, v34);
  if (v16)
  {
    int v27 = ((uint64_t (*)(uint64_t, void, void, void))v16)(a2, 0LL, 0LL, 0LL);
    if (v27) {
      debuglog("KBSetCookie", @"APFSVolumePayloadSet failed with %d", v28, v29, v30, v31, v32, v33, v27);
    }
    else {
      debuglog("KBSetCookie", @"APFSVolumePayloadSet succeeded", v28, v29, v30, v31, v32, v33, v35);
    }
  }

  uint64_t v5 = aks_prederived_change_secret();
  return convertAKSErrorToMKB(v5);
}

  uint64_t v15 = fcntl(v14, 63);
  *((_DWORD *)v5 + 308) = v15;
  if (v15 == -1) {
    goto LABEL_16;
  }
  if ((v15 - 8) < 0xFFFFFFF9)
  {
    uint64_t v6 = 0xFFFFFFFFLL;
    goto LABEL_17;
  }

  if ((v15 - 1) >= 2 && v5[1080])
  {
    close(*((_DWORD *)v5 + 257));
    return 4294967294LL;
  }

  else
  {
    uint64_t v6 = 0LL;
    *a2 = v5;
  }

  return v6;
}

  return v5;
}

LABEL_17:
  if (a3)
  {
    if (a4)
    {
      *a3 = 0LL;
      *a4 = 0LL;
    }
  }

    uint64_t v22 = 0xFFFFFFFFLL;
    goto LABEL_18;
  }

  CC_SHA1_Init((CC_SHA1_CTX *)(v9 + 1236));
  v9[1080] = 1;
  *((_DWORD *)v9 + 271) = bswap32(*((_DWORD *)BytePtr + 5));
  uint64_t v11 = bswap32(*((_DWORD *)BytePtr + 6));
  CFDataGetLength(theData);
LABEL_8:
  if (v11 == 1) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = v11;
  }
  if (v19 == 17) {
    uint64_t v20 = 7;
  }
  else {
    uint64_t v20 = v19;
  }
  uint64_t v21 = open_dprotected_np(buffer, 2817, v20, 0, 420LL);
  *((_DWORD *)v9 + 257) = v21;
  if (v21 != -1)
  {
    uint64_t v22 = 0LL;
    *a4 = v9;
    return v22;
  }

  uint64_t v24 = __error();
  strerror(*v24);
  debuglog( "MKBFileCreateForRestore",  @"Can't create file to restore to (class: %d): %s",  v25,  v26,  v27,  v28,  v29,  v30,  v19);
  uint64_t v22 = 4294967290LL;
LABEL_18:
  if (*((_DWORD *)v9 + 257) != -1) {
    unlink(buffer);
  }
  MKBFileClose(v9, v12, v13, v14, v15, v16, v17, v18);
  return v22;
}

    CFRelease(v29);
    return v15;
  }

  debuglog("MKBUserSessionLoadKeybagForUser", @"no user bag found for UID %d", v23, v24, v25, v26, v27, v28, a2);
  return 4294967288LL;
}

uint64_t KBMapVolume(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  size_t __size = 0LL;
  uint64_t v65 = 0LL;
  uint64_t v8 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v8)
  {
    uint64_t v43 = @"Failed to open APFS framework";
    goto LABEL_11;
  }

  uint64_t v15 = v8;
  uint64_t v22 = dlsym(v8, "APFSVolumePayloadGet");
  if (!v22) {
    debuglog("KBMapVolume", @"Failed to resolve gAPFSVolumePayloadGet", v16, v17, v18, v19, v20, v21, v63);
  }
  if (!dlsym(v15, "APFSVolumePayloadSet")) {
    debuglog("KBMapVolume", @"Failed to resolve gAPFSVolumePayloadSet", v23, v24, v25, v26, v27, v28, v63);
  }
  if (v22)
  {
    int v29 = ((uint64_t (*)(uint64_t, void, void, size_t *))v22)(a3, 0LL, 0LL, &__size);
    if (v29)
    {
      int v36 = v29;
      debuglog("KBMapVolume", @"APFSVolumePayloadGet failed with %d", v30, v31, v32, v33, v34, v35, v29);
      if (v36 == 49154)
      {
        debuglog( "KBMapVolume",  @"Not cookie in this volume, attempting to write it",  v37,  v38,  v39,  v40,  v41,  v42,  v63);
        KBSetCookie(a1, a3, &v65, &__size, a5);
      }

      goto LABEL_12;
    }

    debuglog("KBMapVolume", @"APFSVolumePayloadGet len reveived to be %zd", v30, v31, v32, v33, v34, v35, __size);
    uint64_t v55 = malloc(__size);
    uint64_t v65 = v55;
    if (v55)
    {
      int v56 = ((uint64_t (*)(uint64_t, void, void *, size_t *))v22)(a3, 0LL, v55, &__size);
      if (v56) {
        debuglog( "KBMapVolume",  @"Failed to  obtain cookie from the volume with error %d",  v57,  v58,  v59,  v60,  v61,  v62,  v56);
      }
      else {
        debuglog( "KBMapVolume",  @"Successfully obtained the cookie for the volume with length:%zd",  v57,  v58,  v59,  v60,  v61,  v62,  __size);
      }
      goto LABEL_12;
    }

    uint64_t v43 = @"Failed to allocate Cookie malloc space";
LABEL_11:
    debuglog("KBMapVolume", v43, v9, v10, v11, v12, v13, v14, v63);
  }

LABEL_12:
  if (a5)
  {
    uint64_t v44 = aks_set_keybag_for_volume_with_cookie_persona();
    uint64_t v51 = v44;
    if ((_DWORD)v44)
    {
      debuglog( "KBMapVolume",  @"aks_set_keybag_for_volume_with_cookie_persona FAIL with 0x%x",  v45,  v46,  v47,  v48,  v49,  v50,  v44);
      goto LABEL_20;
    }

    uint64_t v53 = @"aks_set_keybag_for_volume_with_cookie_persona SUCCESS";
  }

  else
  {
    uint64_t v52 = aks_set_keybag_for_volume_with_cookie();
    uint64_t v51 = v52;
    if ((_DWORD)v52)
    {
      debuglog( "KBMapVolume",  @"aks_set_keybag_for_volume_with_cookie FAIL with 0x%x",  v45,  v46,  v47,  v48,  v49,  v50,  v52);
      goto LABEL_20;
    }

    uint64_t v53 = @"aks_set_keybag_for_volume_with_cookie SUCCESS";
  }

  debuglog("KBMapVolume", v53, v45, v46, v47, v48, v49, v50, v63);
LABEL_20:
  if (v65) {
    free(v65);
  }
  return v51;
}

uint64_t KBMapDeviceBag(const char *a1, int a2)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  uint64_t v45 = 0LL;
  uint64_t v46 = 0LL;
  uint64_t v47 = 0LL;
  if (statfs(a1, &v48))
  {
    uint64_t v10 = __error();
    char v44 = strerror(*v10);
    debuglog("has_data_protection", @"Statfs failed due to:%s on  (%s)", v11, v12, v13, v14, v15, v16, v44);
LABEL_5:
    debuglog( "has_data_protection",  @"mount point (%s) does not support Data Protection",  v17,  v18,  v19,  v20,  v21,  v22,  (char)a1);
    return 0LL;
  }

  if ((v48.f_flags & 0x80) == 0)
  {
    debuglog( "has_data_protection",  @"mount is with NO CPROTECT:0x%x on  (%s)",  v4,  v5,  v6,  v7,  v8,  v9,  v48.f_flags);
    goto LABEL_5;
  }

  LOWORD(v45) = 5;
  LODWORD(v46) = -2147188736;
  if (getattrlist(a1, &v45, &v48, 0x41CuLL, 0))
  {
    __error();
    debuglog( "KBMapDeviceBag",  @"Could not get %s volume attributes (errno=%d)",  v30,  v31,  v32,  v33,  v34,  v35,  (char)a1);
    return 4294967290LL;
  }

  int v36 = (char *)&v48.f_iosize + v48.f_iosize;
  if (v36 >= &v48.f_mntonname[964] || &v36[LODWORD(v48.f_blocks)] >= &v48.f_mntonname[964])
  {
    debuglog( "KBMapDeviceBag",  @"Attribute buffer too small. offset=%d, lenght=%u",  (uint64_t)v36,  v25,  v26,  v27,  v28,  v29,  v48.f_iosize);
    return 4294967290LL;
  }

  uint64_t v37 = KBMapVolume(0LL, 0LL, (uint64_t)v36, (uint64_t)&v48.f_blocks + 4, a2);
  uint64_t v23 = convertAKSErrorToMKB(v37);
  if ((_DWORD)v23) {
    debuglog("KBMapDeviceBag", @"Could not map %s volume (ret=%d)", v38, v39, v40, v41, v42, v43, (char)a1);
  }
  return v23;
}

uint64_t KBSecureLoadObjectWithCrypto(const char *a1, CFPropertyListRef *a2)
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  CFDataRef theData = 0LL;
  CFDataRef v77 = 0LL;
  CCCryptorRef cryptorRef = 0LL;
  *a2 = 0LL;
  bzero(__str, 0x401uLL);
  size_t dataOutMoved = 0LL;
  int v4 = validateSecureFile(a1, &dataOutMoved, (CFTypeRef *)&v77, (CFTypeRef *)&theData);
  if (v4)
  {
    debuglog("KBSecureLoadObject", @"Failed to validate keybag file: %d, %d", v5, v6, v7, v8, v9, v10, v4);
    snprintf((char *)__str, 0x401uLL, "%s.writing", a1);
    int v11 = validateSecureFile((const char *)__str, &dataOutMoved, (CFTypeRef *)&v77, (CFTypeRef *)&theData);
    if (v11 || !dataOutMoved)
    {
      debuglog("KBSecureLoadObject", @"Failed to validate keybag file: %d", v12, v13, v14, v15, v16, v17, v11);
    }

    else
    {
      CFDataRef v67 = __error();
      strerror(*v67);
      debuglog("KBSecureLoadObject", @"could not rename %s to %s: %s", v68, v69, v70, v71, v72, v73, (char)__str);
    }

    uint64_t v59 = 4294967288LL;
    debuglog( "KBSecureLoadObjectWithCrypto",  @"Can't load secure keybag Object: %d",  v61,  v62,  v63,  v64,  v65,  v66,  -8);
    uint64_t v18 = 0LL;
    goto LABEL_12;
  }

LABEL_5:
  uint64_t v18 = (const __CFData *)dataOutMoved;
  BytePtr = CFDataGetBytePtr(theData);
  size_t Length = CFDataGetLength(theData);
  uint64_t v21 = CFDataGetBytePtr(v77);
  CCCryptorStatus v22 = CCCryptorCreate(1u, 0, 1u, BytePtr, Length, v21, &cryptorRef);
  if (v22)
  {
    debuglog("KBSecureLoadObjectWithCrypto", @"Can't create decryptor: %d", v23, v24, v25, v26, v27, v28, v22);
    uint64_t v59 = 4294967289LL;
    goto LABEL_12;
  }

  uint64_t v29 = CFDataGetBytePtr(v18);
  size_t v30 = CFDataGetLength(v18);
  uint64_t v31 = (UInt8 *)malloc(v30);
  if (!v31)
  {
    debuglog( "KBSecureLoadObjectWithCrypto",  @"Can't allocate decryption buffer",  v32,  v33,  v34,  v35,  v36,  v37,  v74);
    uint64_t v59 = 4294967291LL;
    goto LABEL_12;
  }

  uint64_t v38 = v31;
  uint64_t v39 = cryptorRef;
  size_t v40 = CFDataGetLength(v18);
  size_t v41 = CFDataGetLength(v18);
  CCCryptorStatus v42 = CCCryptorUpdate(v39, v29, v40, v38, v41, &dataOutMoved);
  if (v42)
  {
    debuglog("KBSecureLoadObjectWithCrypto", @"Unable to decrypt: %d", v43, v44, v45, v46, v47, v48, v42);
  }

  else
  {
    uint64_t v49 = cryptorRef;
    uint64_t v50 = &v38[dataOutMoved];
    CFIndex v51 = CFDataGetLength(v18);
    CCCryptorStatus v52 = CCCryptorFinal(v49, v50, v51 - dataOutMoved, __str);
    if (!v52)
    {
      uint64_t v59 = 0LL;
      *a2 = convertBinaryToObject(v38, (LODWORD(__str[0]) + dataOutMoved));
      goto LABEL_10;
    }

    debuglog("KBSecureLoadObjectWithCrypto", @"Unable to finalize: %d", v53, v54, v55, v56, v57, v58, v52);
  }

  uint64_t v59 = 4294967289LL;
LABEL_10:
  if (v38 != v29) {
    free(v38);
  }
LABEL_12:
  if (v77)
  {
    CFRelease(v77);
    CFDataRef v77 = 0LL;
  }

  if (theData)
  {
    CFRelease(theData);
    CFDataRef theData = 0LL;
  }

  if (v18) {
    CFRelease(v18);
  }
  CCCryptorRelease(cryptorRef);
  return v59;
}

  debuglog("_MKBKeyBagKeyStashSetManifest", @"CFMutableDictionaryRef result = %d", a3, a4, a5, a6, a7, a8, v12);
  return v12;
}

  escrow_bag_with_auth = aks_create_escrow_bag_with_auth();
  if ((_DWORD)escrow_bag_with_auth) {
    return convertAKSErrorToMKB(escrow_bag_with_auth);
  }
  uint64_t v8 = __kbHandleWithKernelHandle(v9, 0);
  *a3 = v8;
  if (v8) {
    return 0LL;
  }
  else {
    return 4294967291LL;
  }
}

uint64_t validateSecureFile(const char *a1, void *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  char v7 = (char)a1;
  uint64_t v88 = *MEMORY[0x1895F89C0];
  binary_dict = (const __CFDictionary *)load_binary_dict(a1);
  if (!binary_dict)
  {
    debuglog("validateSecureFile", @"Unable to load %s", v9, v10, v11, v12, v13, v14, v7);
    return 0xFFFFFFFFLL;
  }

  uint64_t v15 = binary_dict;
  Value = (const __CFNumber *)CFDictionaryGetValue(binary_dict, @"_MKBWIPEID");
  if (!Value || (uint64_t v23 = Value, v24 = CFGetTypeID(Value), v24 != CFNumberGetTypeID()))
  {
    debuglog("validateSecureFile", @"%s missing wipeID", v17, v18, v19, v20, v21, v22, v7);
LABEL_35:
    CFRelease(v15);
    return 0xFFFFFFFFLL;
  }

  uint64_t v25 = CFDictionaryGetValue(v15, @"_MKBIV");
  if (!v25 || (v32 = v25, CFTypeID v33 = CFGetTypeID(v25), v33 != CFDataGetTypeID()))
  {
    debuglog("validateSecureFile", @"%s missing IV", v26, v27, v28, v29, v30, v31, v7);
    goto LABEL_35;
  }

  uint64_t v34 = CFDictionaryGetValue(v15, @"_MKBPAYLOAD");
  if (!v34 || (size_t v41 = v34, v42 = CFGetTypeID(v34), v42 != CFDataGetTypeID()))
  {
    debuglog("validateSecureFile", @"%s missing payload", v35, v36, v37, v38, v39, v40, v7);
    goto LABEL_35;
  }

  CFNumberGetValue(v23, kCFNumberIntType, &valuePtr);
  unsigned int v43 = valuePtr;
  size_t v84 = 52LL;
  int v44 = loadBlastableBytes(valuePtr, &v85, &v84);
  if (v44)
  {
    debuglog("loadWipeIDInfo", @"Unable to load wipe info: %08x", v45, v46, v47, v48, v49, v50, v44);
LABEL_34:
    debuglog("validateSecureFile", @"Can't load wipe info for ID:%08x", v76, v77, v78, v79, v80, v81, valuePtr);
    goto LABEL_35;
  }

  if (v85 != v43)
  {
    debuglog("loadWipeIDInfo", @"Wipe Info ID is wrong: %d", v45, v46, v47, v48, v49, v50, v85);
    goto LABEL_34;
  }

  CFDataRef v51 = CFDataCreate(0LL, v86, 16LL);
  if (!v51)
  {
    debuglog("loadWipeIDInfo", @"Can't create iv data", v52, v53, v54, v55, v56, v57, v82);
    goto LABEL_34;
  }

  CFDataRef v58 = v51;
  CFDataRef v59 = CFDataCreate(0LL, v87, 32LL);
  if (!v59)
  {
    debuglog("loadWipeIDInfo", @"Can't create key data", v60, v61, v62, v63, v64, v65, v82);
    CFRelease(v58);
    goto LABEL_34;
  }

  CFDataRef v66 = v59;
  if (CFEqual(v32, v58))
  {
    if (a3) {
      *a3 = CFRetain(v58);
    }
    if (a4) {
      *a4 = CFRetain(v66);
    }
    if (!a2)
    {
      uint64_t v74 = 0LL;
      goto LABEL_23;
    }

    CFTypeRef v73 = CFRetain(v41);
    uint64_t v74 = 0LL;
    goto LABEL_21;
  }

  debuglog( "validateSecureFile",  @"fileIV to wipeIV mismatch, no payload returned",  v67,  v68,  v69,  v70,  v71,  v72,  v82);
  CFShow(v32);
  CFShow(v58);
  uint64_t v74 = 4294967287LL;
  if (a2)
  {
    CFTypeRef v73 = 0LL;
LABEL_21:
    *a2 = v73;
  }

LABEL_23:
  CFRelease(v15);
  CFRelease(v58);
  CFRelease(v66);
  return v74;
}

  debuglog( "MKBKeyBagKeyStashCreateWithOpts",  @"CFMutableDictionaryRef result = %d (stash_mode:%d, uid:%d, flags:0x%x)",  v34,  v35,  v36,  v37,  v38,  v39,  v48);
  return v48;
}

CFDataRef KBisxARTBasedKeyBag( int a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 != -1)
  {
    int lock_state = aks_get_lock_state();
    if (!lock_state)
    {
      uint64_t v9 = 0LL;
      goto LABEL_7;
    }

    debuglog("KBisxARTBasedKeyBag", @"get_lock_state() -> 0x%x", a3, a4, a5, a6, a7, a8, lock_state);
LABEL_9:
    uint64_t v9 = 0LL;
    goto LABEL_7;
  }

  if (!a2) {
    goto LABEL_9;
  }
  Data = (const __CFData *)_getData(a2, @"KeyBagKeys");
  uint64_t v9 = Data;
  if (Data)
  {
    CFDataGetBytePtr(Data);
    CFDataGetLength(v9);
    uint64_t v9 = (const __CFData *)aks_bag_in_xart();
  }

LABEL_7:
  debuglog("KBisxARTBasedKeyBag", @"Result = %d", a3, a4, a5, a6, a7, a8, (char)v9);
  return v9;
}

uint64_t (*MKBSetLogFunction(uint64_t (*a1)(void)))(void, void)
{
  _log_func = a1;
  return KBSetLogger((uint64_t (*)(void, void))debuglog);
}

void debuglog( const char *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  if (!a1) {
    a1 = "";
  }
  uint64_t v11 = CFStringCreateWithFormatAndArguments(0LL, 0LL, a2, &a9);
  if (v11)
  {
    uint64_t v12 = v11;
    CFStringGetCString(v11, __dst, 1024LL, 0x8000100u);
    CFRelease(v12);
  }

  snprintf(__str, 0x400uLL, "%s: %s", a1, __dst);
  if (_log_func)
  {
    _log_func(__str);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = __str;
    _os_log_impl(&dword_183E36000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
  }

uint64_t MKBLockDevice(CFDictionaryRef theDict)
{
  if (theDict)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"LockDeviceNow");
    if (Value)
    {
      uint64_t v3 = Value;
      CFTypeID v4 = CFGetTypeID(Value);
      if (v4 == CFBooleanGetTypeID()) {
        CFBooleanGetValue(v3);
      }
    }
  }

  handleToUse(theDict);
  uint64_t v5 = aks_lock_device();
  return convertAKSErrorToMKB(v5);
}

uint64_t handleToUse(const __CFDictionary *a1)
{
  if (handleToUse_handleOnce != -1) {
    dispatch_once(&handleToUse_handleOnce, &__block_literal_global_175);
  }
  return handleToUse_handle;
}

uint64_t MKBLockDeviceNow(const __CFDictionary *a1)
{
  uint64_t v1 = aks_lock_device();
  return convertAKSErrorToMKB(v1);
}

uint64_t MKBSeshatDebug()
{
  return 0LL;
}

uint64_t MKBUnlockDevice(const __CFData *a1, const __CFDictionary *a2)
{
  return MKBUnlockDeviceForACMRef(a1, a2, 0LL);
}

uint64_t MKBUnlockDeviceForACMRef(const __CFData *a1, const __CFDictionary *a2, const __CFData *a3)
{
  int v6 = handleToUse(a2);
  unsigned int v7 = should_use_memento(a2);
  if (a2)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a2, @"VerifyOnly");
    if (Value)
    {
      uint64_t v9 = Value;
      CFTypeID v10 = CFGetTypeID(Value);
      if (v10 == CFBooleanGetTypeID())
      {
        BOOL v17 = CFBooleanGetValue(v9) != 0;
        goto LABEL_5;
      }

      debuglog("verify_only_opt", @"key is of wrong type", v11, v12, v13, v14, v15, v16, v24);
    }
  }

  BOOL v17 = 0;
LABEL_5:
  if (v6)
  {
    +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 passcodeUnlockStart];
  }

  if (v7)
  {
    if (a1)
    {
      CFDataGetBytePtr(a1);
      CFDataGetLength(a1);
      if (!a3)
      {
LABEL_18:
        uint64_t v19 = aks_verify_password_memento();
        goto LABEL_22;
      }
    }

    else if (!a3)
    {
      goto LABEL_18;
    }

    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_18;
  }

  if (v17)
  {
    if (a1)
    {
      CFDataGetBytePtr(a1);
      CFDataGetLength(a1);
      if (!a3)
      {
LABEL_20:
        uint64_t v19 = aks_verify_password();
        goto LABEL_22;
      }
    }

    else if (!a3)
    {
      goto LABEL_20;
    }

    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_20;
  }

  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }

  uint64_t v19 = aks_unlock_device();
LABEL_22:
  uint64_t v20 = v19;
  if (v6)
  {
    if (!(_DWORD)v19 || (_DWORD)v19 == -536362988)
    {
      +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 passcodeUnlockSuccess];

      return convertAKSErrorToMKB(v20);
    }

    +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 passcodeUnlockFailed];
  }

  if ((_DWORD)v20 == -536870184)
  {
    MKBKeyBagChangeSystemGeneration((uint64_t)a1, 3LL);
    uint64_t v20 = 0LL;
  }

  return convertAKSErrorToMKB(v20);
}

uint64_t MKBVerifyPasswordWithContext(const __CFDictionary *a1, const __CFData *a2, const __CFData *a3)
{
  unsigned int v6 = should_use_memento(a1);
  unsigned int v13 = v6;
  if (a3 && v6)
  {
    debuglog( "MKBVerifyPasswordWithContext",  @"memento verifiers and acm context are unsupported",  v7,  v8,  v9,  v10,  v11,  v12,  v18);
    return 4294967279LL;
  }

  handleToUse(a1);
  if (v13)
  {
    if (a2)
    {
      CFDataGetBytePtr(a2);
      CFDataGetLength(a2);
      if (!a3)
      {
LABEL_12:
        uint64_t v15 = aks_verify_password_memento();
        goto LABEL_15;
      }
    }

    else if (!a3)
    {
      goto LABEL_12;
    }

    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_12;
  }

  if (!a2)
  {
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }

  CFDataGetBytePtr(a2);
  CFDataGetLength(a2);
  if (a3)
  {
LABEL_10:
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
  }

LABEL_14:
  uint64_t v15 = aks_verify_password();
LABEL_15:
  if ((_DWORD)v15 != -536362987) {
    return convertAKSErrorToMKB(v15);
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, a1);
  CFDictionaryAddValue(MutableCopy, @"VerifyOnly", (const void *)*MEMORY[0x189604DE8]);
  uint64_t v17 = MKBUnlockDeviceForACMRef(a2, MutableCopy, a3);
  CFRelease(MutableCopy);
  return v17;
}

CFDictionaryRef should_use_memento(const __CFDictionary *result)
{
  if (result)
  {
    CFMutableDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"UseMementoBlob");
    if (result)
    {
      uint64_t v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      if (v2 == CFBooleanGetTypeID())
      {
        return CFBooleanGetValue(v1 != 0);
      }

      else
      {
        debuglog("should_use_memento", @"key is of wrong type", v3, v4, v5, v6, v7, v8, v9);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t _get_device_lock_state(const __CFDictionary *a1, uint64_t a2)
{
  int valuePtr = handleToUse(a1);
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a1)
  {
LABEL_13:
    uint64_t device_state = aks_get_device_state();
    return convertAKSErrorToMKB(device_state);
  }

  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, @"ExtendedDeviceLockState");
  v7 = Value && (uint64_t v5 = Value, v6 = CFGetTypeID(Value), v6 == CFBooleanGetTypeID()) && CFBooleanGetValue(v5) != 0;
  uint64_t v8 = (const __CFNumber *)CFDictionaryGetValue(a1, kMKBUserSessionIDKey);
  if (v8)
  {
    char v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue(v9, kCFNumberIntType, &valuePtr))
      {
        int valuePtr = -valuePtr;
        goto LABEL_11;
      }

      return 0xFFFFFFFFLL;
    }
  }

LABEL_11:
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t device_state = aks_get_extended_device_state();
  return convertAKSErrorToMKB(device_state);
}

uint64_t MKBGetDeviceLockStateIndirect(const __CFDictionary *a1)
{
  uint64_t Int = 0xFFFFFFFFLL;
  unsigned int v7 = -1;
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, @"ExtendedDeviceLockState")) {
      BOOL v3 = _getBool(a1, @"ExtendedDeviceLockState") != 0;
    }
    else {
      BOOL v3 = 0LL;
    }
    if (CFDictionaryContainsKey(a1, @"DeviceHandle")) {
      uint64_t Int = _getInt(a1, @"DeviceHandle");
    }
    if (CFDictionaryContainsKey(a1, kMKBUserSessionIDKey)) {
      uint64_t Int = _getInt(a1, kMKBUserSessionIDKey);
    }
  }

  else
  {
    BOOL v3 = 0LL;
  }

  +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 getDeviceLockStateForUser:Int extendedState:v3 withLockStateInfo:&v7];

  if (v5) {
    return v7;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t MKBGetDeviceLockState(const __CFDictionary *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  __int16 v3 = 0;
  memset(v2, 0, sizeof(v2));
  LODWORD(result) = _get_device_lock_state(a1, (uint64_t)v2);
  if ((_DWORD)result) {
    return result;
  }
  else {
    return DWORD1(v2[0]);
  }
}

__CFDictionary *MKBGetDeviceLockStateInfo(const __CFDictionary *a1)
{
  uint64_t Int = a1;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int16 v14 = 0;
  memset(v13, 0, sizeof(v13));
  dict = create_dict();
  __int16 v3 = dict;
  if (dict)
  {
    set_longlongvalue_for_key(dict, @"ls", DWORD1(v13[0]));
    set_longlongvalue_for_key(v3, @"state", LODWORD(v13[0]));
    if (handleToUse(Int))
    {
      if (Int)
      {
        if (CFDictionaryContainsKey(Int, kMKBUserSessionIDKey)) {
          uint64_t Int = (const __CFDictionary *)_getInt(Int, kMKBUserSessionIDKey);
        }
        else {
          uint64_t Int = 0LL;
        }
      }

      +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 getLockStateForUser:Int];
      int v5 = (const void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        CFTypeID v6 = CFGetTypeID(v5);
        if (v6 == CFDictionaryGetTypeID())
        {
          uint64_t v7 = 0LL;
          v12[0] = @"IsWipePending";
          v12[1] = @"sw";
          v12[2] = @"IsPermanentlyBlocked";
          v12[3] = @"pb";
          v12[4] = @"FailedPasscodeAttempts";
          v12[5] = @"fa";
          v12[6] = @"TimeUntilUnblockedSinceReferenceDate";
          v12[7] = @"boff";
          do
          {
            uint64_t v8 = (const void *)v12[v7];
            if (CFDictionaryContainsKey((CFDictionaryRef)v5, v8))
            {
              char v9 = (const void *)v12[v7 + 1];
              Value = CFDictionaryGetValue((CFDictionaryRef)v5, v8);
              CFDictionarySetValue(v3, v9, Value);
            }

            v7 += 2LL;
          }

          while (v7 != 8);
          CFRelease(v5);
        }
      }
    }

    else
    {
      set_longlongvalue_for_key(v3, @"boff", *((uint64_t *)&v13[0] + 1));
      set_longlongvalue_for_key(v3, @"fa", LODWORD(v13[1]));
      set_longlongvalue_for_key(v3, @"countdown", *(uint64_t *)((char *)&v13[1] + 10));
    }
  }

  return v3;
}

void set_longlongvalue_for_key(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (a1 && a2)
  {
    CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberLongLongType, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionarySetValue(a1, a2, v5);
      CFRelease(v6);
    }
  }

uint64_t MKBDeviceSetGracePeriod(const __CFData *a1, const __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable) {
    return 4294967291LL;
  }
  CFNumberRef v5 = Mutable;
  Value = CFDictionaryGetValue(a2, @"GracePeriod");
  if (Value)
  {
    uint64_t v7 = Value;
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 == CFNumberGetTypeID()) {
      CFDictionarySetValue(v5, @"GracePeriod", v7);
    }
  }

  uint64_t v9 = MKBSetDeviceConfigurations(a1, v5);
  CFRelease(v5);
  LongLonguint64_t Int = _getLongLongInt(a2, @"GracePeriod");
  debuglog( "MKBDeviceSetGracePeriod",  @"MKBDeviceSetGracePeriod: To (%lld)AKS return Value is %d\n",  v11,  v12,  v13,  v14,  v15,  v16,  LongLongInt);
  return v9;
}

uint64_t MKBSetDeviceConfigurations(const __CFData *a1, const __CFDictionary *a2)
{
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }

  uint64_t v3 = aks_set_configuration();
  return convertAKSErrorToMKB(v3);
}

__CFDictionary *MKBDeviceGetGracePeriod(const __CFDictionary *a1)
{
  uint64_t v1 = MKBGetDeviceConfigurations(a1);
  if (v1)
  {
    CFTypeID v8 = (const __CFDictionary *)v1;
    dict = create_dict();
    Value = CFDictionaryGetValue(v8, @"GracePeriod");
    if (Value)
    {
      uint64_t v11 = Value;
      CFTypeID v12 = CFGetTypeID(Value);
      if (v12 == CFNumberGetTypeID()) {
        CFDictionarySetValue(dict, @"GracePeriod", v11);
      }
    }

    CFRelease(v8);
  }

  else
  {
    debuglog( "MKBDeviceGetGracePeriod",  @"MKBGetDeviceConfigurations failed to return a dictionary",  v2,  v3,  v4,  v5,  v6,  v7,  v14);
    return 0LL;
  }

  return dict;
}

uint64_t MKBGetDeviceConfigurations(const __CFDictionary *a1)
{
  uint64_t configuration = aks_get_configuration();
  char v2 = convertAKSErrorToMKB(configuration);
  debuglog("MKBGetDeviceConfigurations", @"aks_get_configuration result: %d\n", v3, v4, v5, v6, v7, v8, v2);
  return 0LL;
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  if (gUserUnlockedSinceBoot) {
    return 1LL;
  }
  handleToUse(0LL);
  uint64_t lock_state = aks_get_lock_state();
  uint64_t v2 = convertAKSErrorToMKB(lock_state);
  if ((_DWORD)v2)
  {
    uint64_t v0 = v2;
    debuglog( "MKBDeviceUnlockedSinceBoot",  @"MKBDeviceUnlockedSinceBoot fails with error(%d) for handle(%d) with AKS error(%d)",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
  }

  else
  {
    uint64_t v0 = (v10 >> 2) & 1;
    gUserUnlockedSinceBoot = (v10 & 4) != 0;
  }

  return v0;
}

uint64_t MKBKeyBagKeyStashSupport( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  debuglog("MKBKeyBagKeyStashSupport", @"uint64_t result = %d", a3, a4, a5, a6, a7, a8, 0);
  return 0LL;
}

uint64_t MKBKeyBagKeyStashCreateWithOpts( const __CFDictionary *a1, uint64_t a2, const __CFData *a3, const __CFData *a4)
{
  BOOL v17 = a1
     && (Value = (const __CFBoolean *)CFDictionaryGetValue(a1, @"SkipSE")) != 0LL
     && (uint64_t v15 = Value, v16 = CFGetTypeID(Value), v16 == CFBooleanGetTypeID())
     && CFBooleanGetValue(v15) != 0;
  unsigned int v58 = 0;
  if ((_DWORD)a2 && (a3 != 0LL) == (a4 != 0LL))
  {
    debuglog( "MKBKeyBagKeyStashCreateWithOpts",  @"passcode and acm are mutually exclusive",  v8,  v9,  v10,  v11,  v12,  v13,  v57);
    uint64_t v48 = 4294967279LL;
  }

  else
  {
    else {
      int v18 = 0;
    }
    BOOL v19 = a3 != 0LL;
    unsigned int v20 = v18 | v19;
    if (!a3) {
      a3 = a4;
    }
    if (v17) {
      uint64_t v21 = v20 | 4;
    }
    else {
      uint64_t v21 = v20;
    }
    if (a1)
    {
      uint64_t v22 = CFDictionaryGetValue(a1, @"Manifest");
      if (v22)
      {
        uint64_t v23 = v22;
        CFTypeID v24 = CFGetTypeID(v22);
        if (v24 != CFDataGetTypeID())
        {
          char v50 = CFGetTypeID(v23);
          debuglog( "MKBKeyBagKeyStashCreateWithOpts",  @"manifest is of wrong type %lu",  v51,  v52,  v53,  v54,  v55,  v56,  v50);
          uint64_t v48 = 0xFFFFFFFFLL;
          goto LABEL_23;
        }

        BytePtr = (unsigned __int8 *)CFDataGetBytePtr((CFDataRef)v23);
        CFIndex Length = CFDataGetLength((CFDataRef)v23);
        log_blob((char)"first manifest", BytePtr, Length, v27, v28, v29, v30, v31);
        CFIndex v32 = CFDataGetLength((CFDataRef)v23);
        CFTypeID v33 = CFDataGetBytePtr((CFDataRef)v23);
        if (!quick_der_check((uint64_t)v33, v32))
        {
          uint64_t v48 = 4294967277LL;
          goto LABEL_23;
        }

        if (a3)
        {
          CFDataGetBytePtr(a3);
          CFDataGetLength(a3);
        }

        CFDataGetBytePtr((CFDataRef)v23);
        CFDataGetLength((CFDataRef)v23);
        uint64_t v40 = aks_migrate_s_key();
        if ((_DWORD)v40)
        {
          uint64_t v48 = v40;
          debuglog( "MKBKeyBagKeyStashCreateWithOpts",  @"failed to migrate skey, opts: %u",  v41,  v42,  v43,  v44,  v45,  v46,  v19);
          goto LABEL_23;
        }
      }
    }

    +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = [v47 stashCreateWithSecret:a3 withMode:a2 withUID:v58 WithFlags:v21];
  }

uint64_t _get_userid_from_options(CFDictionaryRef theDict, _DWORD *a2)
{
  uint64_t result = 0LL;
  if (theDict)
  {
    if (a2)
    {
      uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"DeviceHandle");
      if (result)
      {
        uint64_t v5 = (const __CFNumber *)result;
        CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
        if (v6 == CFNumberGetTypeID())
        {
          uint64_t result = CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
          if ((_DWORD)result)
          {
            *a2 = valuePtr;
            return 1LL;
          }
        }

        else
        {
          debuglog("_get_userid_from_options", @"handle is of wrong type", v7, v8, v9, v10, v11, v12, v13);
          return 0LL;
        }
      }
    }
  }

  return result;
}

void log_blob( char a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  debuglog("log_blob", @"%s (%d):\n", a3, a4, a5, a6, a7, a8, a1);
  if (v8 >= 1)
  {
    do
    {
      if (v8 >= 64) {
        uint64_t v10 = 64LL;
      }
      else {
        uint64_t v10 = v8;
      }
      uint64_t v11 = v10;
      uint64_t v12 = a2;
      char v13 = (char *)&log_blob_buf;
      do
      {
        int v14 = *v12++;
        snprintf(v13, 3uLL, "%02x", v14);
        v13 += 2;
        --v11;
      }

      while (v11);
      debuglog("log_blob", @"%d: %s\n", v15, v16, v17, v18, v19, v20, v10);
      a2 += v10;
      BOOL v21 = __OFSUB__(v8, (_DWORD)v10);
      v8 -= v10;
    }

    while (!((v8 < 0) ^ v21 | (v8 == 0)));
  }

BOOL quick_der_check(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a1 + a2;
  ccder_decode_tag();
  unint64_t v3 = ccder_decode_len();
  if (v3) {
    BOOL v4 = v2 > v3;
  }
  else {
    BOOL v4 = 0;
  }
  return v4 && v2 == v3;
}

uint64_t MKBKeyBagKeyStashCreateWithMode(uint64_t a1, const __CFData *a2)
{
  return MKBKeyBagKeyStashCreateWithOpts(0LL, a1, 0LL, a2);
}

uint64_t MKBKeyBagKeyStashCreate(const __CFData *a1)
{
  return MKBKeyBagKeyStashCreateWithOpts(0LL, 1LL, 0LL, a1);
}

uint64_t MKBKeyBagKeyStashCreateWithManifest(uint64_t a1, const __CFData *a2, const void *a3)
{
  if (!a3) {
    return 4294966296LL;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable) {
    return 4294966296LL;
  }
  uint64_t v7 = Mutable;
  CFDictionaryAddValue(Mutable, @"Manifest", a3);
  uint64_t v8 = MKBKeyBagKeyStashCreateWithOpts(v7, a1, 0LL, a2);
  CFRelease(v7);
  return v8;
}

uint64_t _MKBKeyBagKeyStashSetManifest( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    goto LABEL_7;
  }
  CFTypeID v9 = CFGetTypeID(a1);
  if (v9 != CFDataGetTypeID())
  {
    char v14 = CFGetTypeID(a1);
    debuglog("_MKBKeyBagKeyStashSetManifest", @"manifest is of wrong type %lu", v15, v16, v17, v18, v19, v20, v14);
LABEL_7:
    uint64_t v12 = 4294966296LL;
    goto LABEL_5;
  }

  CFIndex Length = CFDataGetLength((CFDataRef)a1);
  BytePtr = CFDataGetBytePtr((CFDataRef)a1);
  if (quick_der_check((uint64_t)BytePtr, Length))
  {
    CFDataGetBytePtr((CFDataRef)a1);
    CFDataGetLength((CFDataRef)a1);
    uint64_t v12 = aks_migrate_s_key();
  }

  else
  {
    uint64_t v12 = 4294967277LL;
  }

uint64_t MKBKeyBagKeyStashSetManifest(const void *a1)
{
  uint64_t v2 = handleToUse(0LL);
  return _MKBKeyBagKeyStashSetManifest(a1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t MKBKeyBagKeyStashEnableWithManifest(const void *a1)
{
  if (!a1) {
    return 4294966296LL;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable) {
    return 4294966296LL;
  }
  uint64_t v3 = Mutable;
  CFDictionaryAddValue(Mutable, @"Manifest", a1);
  uint64_t v4 = MKBKeyBagKeyStashEnableWithOpts(v3);
  CFRelease(v3);
  return v4;
}

uint64_t MKBKeyBagKeyStashEnableWithOpts(const __CFDictionary *a1)
{
  uint64_t v2 = handleToUse(a1);
  if (!a1
    || (Value = CFDictionaryGetValue(a1, @"Manifest")) == 0LL
    || (uint64_t v10 = _MKBKeyBagKeyStashSetManifest(Value, v2, v4, v5, v6, v7, v8, v9), !(_DWORD)v10))
  {
    uint64_t v17 = aks_stash_enable();
    uint64_t v10 = convertAKSErrorToMKB(v17);
  }

  uint64_t v18 = v10;
  debuglog("MKBKeyBagKeyStashEnableWithOpts", @"uint64_t result = %d, (handle:%d)", v11, v12, v13, v14, v15, v16, v10);
  return v18;
}

uint64_t MKBKeyBagKeyStashEnable()
{
  return MKBKeyBagKeyStashEnableWithOpts(0LL);
}

uint64_t MKBKeyBagKeyStashCommitWithOpts(const __CFDictionary *a1)
{
  unsigned int v13 = 0;
  int userid_from_options = _get_userid_from_options(a1, &v13);
  +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (userid_from_options) {
    uint64_t v4 = 2LL;
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t v5 = [v2 stashCommit:v13 WithFlags:v4];

  debuglog("MKBKeyBagKeyStashCommitWithOpts", @"uint64_t result = %d, (uid:%u, flags:0x%x)", v6, v7, v8, v9, v10, v11, v5);
  return v5;
}

uint64_t MKBKeyBagKeyStashCommit()
{
  return MKBKeyBagKeyStashCommitWithOpts(0LL);
}

uint64_t MKBKeyBagKeyStashDestroy()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stashDestroy];

  debuglog("MKBKeyBagKeyStashDestroy", @"uint64_t result = %d", v2, v3, v4, v5, v6, v7, v1);
  return v1;
}

uint64_t MKBKeyBagKeyStashPersistWithOpts(const __CFDictionary *a1)
{
  uint64_t v1 = aks_stash_persist();
  uint64_t v2 = convertAKSErrorToMKB(v1);
  debuglog("MKBKeyBagKeyStashPersistWithOpts", @"uint64_t result = %d, (handle:%d)", v3, v4, v5, v6, v7, v8, v2);
  return v2;
}

uint64_t MKBKeyBagKeyStashPersist()
{
  return MKBKeyBagKeyStashPersistWithOpts(0LL);
}

__CFDictionary *MKBKeyBagKeyStashVerifyWithOpts(const __CFDictionary *a1)
{
  int valuePtr = 2;
  uint64_t v1 = (const void **)MEMORY[0x189604DE0];
  unsigned int v10 = 0;
  else {
    uint64_t v2 = 0LL;
  }
  dict = create_dict();
  if (dict) {
    int valuePtr = 2;
  }
  uint64_t v4 = *v1;
  +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 stashVerifywithValidity:&valuePtr WithUID:v10 WithFlags:v2];

  if (v6) {
    int valuePtr = 2;
  }
  CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(dict, @"StashBagValidOnDisk", v7);
  CFRelease(v7);
  uint64_t lock_state = aks_get_lock_state();
  CFDictionarySetValue(dict, @"StashStagedManifest", v4);
  CFRelease(v4);
  return dict;
}

__CFDictionary *MKBKeyBagKeyStashVerify()
{
  return MKBKeyBagKeyStashVerifyWithOpts(0LL);
}

uint64_t MKBKeyBagKeyStashLoadWithOpts(const __CFDictionary *a1)
{
  if (aks_get_current_sep_measurement())
  {
    debuglog("MKBKeyBagKeyStashLoadWithOpts", @"failed to fetch measurement\n", v1, v2, v3, v4, v5, v6, v17);
  }

  else
  {
    log_blob((char)"sep measurement", 0LL, 0LL, v2, v3, v4, v5, v6);
    free(0LL);
  }

  int v7 = aks_stash_load();
  if (v7) {
    uint64_t v14 = 4294967287LL;
  }
  else {
    uint64_t v14 = 0LL;
  }
  char v15 = -9;
  if (!v7) {
    char v15 = 0;
  }
  debuglog("MKBKeyBagKeyStashLoadWithOpts", @"uint64_t result = %d, (handle: %d)", v8, v9, v10, v11, v12, v13, v15);
  return v14;
}

uint64_t MKBKeyBagKeyStashLoad()
{
  return MKBKeyBagKeyStashLoadWithOpts(0LL);
}

uint64_t MKBKeyBagChangeSystemSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 changeSystemSecretFromOldPasscode:a1 ToNew:a2 withOpaqueData:a3 withParams:0];

  return v7;
}

uint64_t MKBKeyBagChangeSystemSecretOpts( uint64_t a1, uint64_t a2, uint64_t a3, CFDictionaryRef theDict, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!theDict) {
    goto LABEL_10;
  }
  Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"OverrideMemento");
  uint64_t v13 = Value;
  if (!Value) {
    goto LABEL_5;
  }
  CFTypeID v14 = CFGetTypeID(Value);
  if (v14 != CFBooleanGetTypeID())
  {
    debuglog("__options_to_change_secret_params", @"key is of wrong type", v15, v16, v17, v18, v19, v20, v33);
LABEL_10:
    uint64_t v13 = 0LL;
    goto LABEL_8;
  }

  uint64_t v13 = (const __CFBoolean *)(2 * (CFBooleanGetValue(v13) != 0));
LABEL_5:
  BOOL v21 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"UseMementoBlob");
  if (v21)
  {
    uint64_t v22 = v21;
    CFTypeID v23 = CFGetTypeID(v21);
    if (v23 == CFBooleanGetTypeID()) {
      uint64_t v13 = (const __CFBoolean *)(v13 | (CFBooleanGetValue(v22) != 0));
    }
    else {
      debuglog("__options_to_change_secret_params", @"key is of wrong type", v24, v25, v26, v27, v28, v29, v33);
    }
  }

LABEL_8:
  debuglog("MKBKeyBagChangeSystemSecretOpts", @"params = %d", a3, (uint64_t)theDict, a5, a6, a7, a8, (char)v13);
  +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [v30 changeSystemSecretFromOldPasscode:a1 ToNew:a2 withOpaqueData:a3 withParams:v13];

  return v31;
}

    uint64_t v5 = 0LL;
  }

  uint64_t v19 = 0LL;
  uint64_t v18 = 0LL;
LABEL_9:
  [v16 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_181];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v21 = a7 == 0;
  uint64_t v22 = v15;
  CFTypeID v23 = v12;
  uint64_t v24 = !v21;
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v32[2] = __101__MKBKeyStoreDevice_ChangeSystemSecretWithEscrow_FromOldPasscode_ToNew_withOpaqueDats_withKeepState___block_invoke_2;
  v32[3] = &unk_189D6A9C0;
  uint64_t v34 = &v35;
  uint64_t v25 = v16;
  char v33 = v25;
  LOBYTE(v30) = v24;
  uint64_t v26 = v23;
  uint64_t v27 = v22;
  [v20 changeSystemSecretWithEscrow:v26 fromOldSecret:v17 oldSize:v31 toNewSecret:v18 newSize:v19 opaqueData:v22 keepstate:v30 reply:v32];
  uint64_t v28 = *((_DWORD *)v36 + 6);

  _Block_object_dispose(&v35, 8);
  return v28;
}

uint64_t MKBKeyBagEffaceMementoBlob(const __CFDictionary *a1)
{
  uint64_t v1 = aks_memento_efface_blob();
  return convertAKSErrorToMKB(v1);
}

unint64_t MKBKeyBagMementoIsSupported(const __CFDictionary *a1)
{
  uint64_t v1 = (const __CFDictionary *)MKBGetDeviceConfigurations(a1);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  Value = CFDictionaryGetValue(v1, @"MementoSupported");
  unint64_t v4 = (unint64_t)Value;
  if (Value)
  {
    CFTypeID v5 = CFGetTypeID(Value);
    unint64_t v4 = v5 == CFBooleanGetTypeID() && v4 == *MEMORY[0x189604DE8];
  }

  CFRelease(v2);
  return v4;
}

uint64_t MKBKeyBagMementoGetBlobState(const __CFDictionary *a1, CFMutableDictionaryRef *a2)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  unint64_t v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable) {
    return 0xFFFFFFFFLL;
  }
  CFMutableDictionaryRef v6 = Mutable;
  handleToUse(a1);
  uint64_t state = aks_memento_get_state();
  if ((_DWORD)state)
  {
    uint64_t v12 = convertAKSErrorToMKB(state);
LABEL_15:
    CFRelease(v6);
    return v12;
  }

  CFNumberRef v8 = CFNumberCreate(v4, kCFNumberSInt8Type, &v14);
  CFDictionarySetValue(v6, @"MementoBlobSeSlot", v8);
  if (v8) {
    CFRelease(v8);
  }
  CFNumberRef v9 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v14 + 4);
  CFDictionarySetValue(v6, @"MementoBlobFailedAttempts", v9);
  if (v9) {
    CFRelease(v9);
  }
  CFNumberRef v10 = CFNumberCreate(v4, kCFNumberSInt32Type, &v15);
  CFDictionarySetValue(v6, @"MementoBlobMaxUnlockAttempts", v10);
  if (v10) {
    CFRelease(v10);
  }
  CFNumberRef v11 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v15 + 4);
  CFDictionarySetValue(v6, @"MementoBlobState", v11);
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v12 = 0LL;
  if (!a2) {
    goto LABEL_15;
  }
  *a2 = v6;
  return v12;
}

uint64_t MKBKeyBagCopySytemSecretBlob(uint64_t *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 copySytemSecretBlob];

  if (a1) {
    *a1 = v3;
  }
  return 0LL;
}

uint64_t MKBKeyBagCopySystemOpaqueBlob(void *a1)
{
  uint64_t v2 = KBSystemKeyBagCopyOpaqueStuff();
  if (a1) {
    *a1 = v2;
  }
  return 0LL;
}

uint64_t MKBKeyBagCleanupAfterMigration()
{
  Value = KBLoadSystemKeyBag();
  if (Value && (Value = (const __CFDictionary *)CFDictionaryGetValue(Value, @"KeybagxART")) == 0LL)
  {
    debuglog( "MKBKeyBagCleanupAfterMigration",  @"System KeyBag plist still contains keys! Not xART based! Do not delete!",  v2,  v3,  v4,  v5,  v6,  v7,  vars0);
    return 0xFFFFFFFFLL;
  }

  else
  {
    KBCleanupSystemKeyBag((uint64_t)Value, v1, v2, v3, v4, v5, v6, v7, vars0);
    return 0LL;
  }

uint64_t MKBKeyBagSetSystemSecretBlob(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 SetSystemSecretBlob:a1];

  return v3;
}

uint64_t MKBAssertionGetTypeID()
{
  return __gMKBAssertionTypeID;
}

uint64_t __MKBAssertionnRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __gMKBAssertionTypeID = result;
  return result;
}

_DWORD *MKBDeviceLockAssertion(const __CFDictionary *a1, CFErrorRef *a2)
{
  uint64_t valuePtr = 0LL;
  pthread_once(&MKBAssertionGetTypeID_typeIDInit, (void (*)(void))__MKBAssertionnRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  CFNumberRef v11 = (_DWORD *)Instance;
  if (!Instance
    || (*(void *)(Instance + 16) = 0LL,
        *(void *)(Instance + 24) = 0LL,
        uint64_t v12 = (int *)(Instance + 16),
        *(_DWORD *)(Instance + 16) = 0,
        *(_DWORD *)(Instance + 24) = handleToUse(a1),
        Value = CFDictionaryGetValue(a1, @"MKBAssertionKey"),
        (uint64_t v14 = Value) == 0LL))
  {
    unsigned int v32 = 12;
    if (!a2) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  if (CFEqual(Value, @"Other"))
  {
    int v15 = 0;
    int v16 = 0;
  }

  else if (CFEqual(v14, @"RemoteProfile"))
  {
    int v15 = 1;
    int v16 = 1;
  }

  else if (CFEqual(v14, @"SBTransient"))
  {
    int v15 = 0;
    int v16 = 2;
  }

  else if (CFEqual(v14, @"RestoreFromBackup"))
  {
    int v15 = 0;
    int v16 = 3;
  }

  else
  {
    if (!CFEqual(v14, @"TimeMachine"))
    {
      debuglog("MKBDeviceLockAssertion", @"Invalid assertion type", v17, v18, v19, v20, v21, v22, v36);
      goto LABEL_18;
    }

    int v15 = 0;
    v11[6] = -1;
    int v16 = 4;
  }

  *uint64_t v12 = v16;
  CFTypeID v23 = (const __CFNumber *)CFDictionaryGetValue(a1, @"MKBAssertionTimeout");
  if (v23 && (uint64_t v30 = v23, v31 = CFGetTypeID(v23), v31 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v30, kCFNumberLongLongType, &valuePtr);
  }

  else if (v15)
  {
    debuglog("MKBDeviceLockAssertion", @"Status missing from response", v24, v25, v26, v27, v28, v29, v36);
    goto LABEL_18;
  }

  int v33 = aks_assert_hold();
  unsigned int v32 = 1;
  if (v33 <= -536870175)
  {
    if (v33 == -536870207) {
      goto LABEL_33;
    }
    if (v33 != -536870187) {
      goto LABEL_18;
    }
    goto LABEL_32;
  }

  if (v33 > -536362995)
  {
    if (v33 != -536362994)
    {
      if (!v33)
      {
        v11[5] = 1;
        int v34 = v11[6];
        goto LABEL_38;
      }

      goto LABEL_18;
    }

LABEL_32:
    unsigned int v32 = 16;
    goto LABEL_33;
  }

  if (v33 != -536870174)
  {
    if (v33 == -536363000)
    {
      unsigned int v32 = 103;
      if (!a2) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }

LABEL_18:
    unsigned int v32 = 22;
    if (!a2) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

LABEL_33:
  if (a2) {
LABEL_34:
  }
    *a2 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F58], v32, 0LL);
LABEL_35:
  if (v11)
  {
    CFRelease(v11);
    CFNumberRef v11 = 0LL;
  }

  LOBYTE(v34) = -1;
LABEL_38:
  debuglog( "MKBDeviceLockAssertion",  @"handle:%d, asserttype:%d, timeout:%llu, result:%d, ioret: 0x%x, ret:%d",  v5,  v6,  v7,  v8,  v9,  v10,  v34);
  return v11;
}

uint64_t MKBDeviceLockAssertionPromote(uint64_t a1)
{
  if (!a1) {
    return 4294967279LL;
  }
  uint64_t result = aks_assert_promote();
  if ((int)result > -536870188)
  {
    switch((_DWORD)result)
    {
      case 0xE00002D5:
        return 4294967278LL;
      case 0:
        return result;
      case 0xE00002E2:
        return 4294967284LL;
    }

    return 0xFFFFFFFFLL;
  }

  if ((_DWORD)result == -536870207) {
    return 4294967280LL;
  }
  if ((_DWORD)result == -536870206) {
    return 4294967279LL;
  }
  return 0xFFFFFFFFLL;
}

const void *MKBDeviceLockAssertionConsume(const __CFDictionary *a1, CFErrorRef *a2)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    uint64_t v5 = (const void *)Instance;
    *(void *)(Instance + 16) = 0LL;
    *(void *)(Instance + 24) = 0LL;
    uint64_t v6 = (void *)(Instance + 16);
    *(_DWORD *)(Instance + 24) = handleToUse(a1);
    int v7 = aks_assert_consume();
    CFIndex v8 = 1LL;
    if (v7 <= -536870188)
    {
      if (v7 == -536870207) {
        goto LABEL_11;
      }
    }

    else
    {
      switch(v7)
      {
        case 0:
          void *v6 = 0x100000000LL;
          return v5;
        case -536870174:
LABEL_11:
          CFRelease(v5);
          if (a2) {
            goto LABEL_12;
          }
          return 0LL;
        case -536870187:
          CFIndex v8 = 16LL;
          goto LABEL_11;
      }
    }

    CFIndex v8 = 22LL;
    goto LABEL_11;
  }

  CFIndex v8 = 12LL;
  if (a2)
  {
LABEL_12:
    uint64_t v5 = 0LL;
    *a2 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F58], v8, 0LL);
    return v5;
  }

  return 0LL;
}

uint64_t MKBKeyBagUnload()
{
  return 4294967290LL;
}

uint64_t MKBKeyBagGetAKSHandle(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(_DWORD *)(a1 + 16);
    }
  }

  return result;
}

uint64_t MKBKeyBagHandleGetTypeID()
{
  if (MKBKeyBagHandleGetTypeID_onlyOnce != -1) {
    dispatch_once(&MKBKeyBagHandleGetTypeID_onlyOnce, &__block_literal_global);
  }
  return MKBKeyBagHandleGetTypeID___MKBKeyBagHandleTypeID;
}

uint64_t __MKBKeyBagHandleGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  MKBKeyBagHandleGetTypeID___MKBKeyBagHandleTypeID = result;
  return result;
}

uint64_t MKBKeyBagCreateEscrow(const __CFData *a1, uint64_t *a2)
{
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }

  uint64_t escrow_bag = aks_create_escrow_bag();
  if ((_DWORD)escrow_bag) {
    return convertAKSErrorToMKB(escrow_bag);
  }
  uint64_t v6 = __kbHandleWithKernelHandle(v7, 0);
  *a2 = v6;
  if (v6) {
    return 0LL;
  }
  else {
    return 4294967291LL;
  }
}

uint64_t __kbHandleWithKernelHandle(int a1, char a2)
{
  if (MKBKeyBagHandleGetTypeID_onlyOnce != -1) {
    dispatch_once(&MKBKeyBagHandleGetTypeID_onlyOnce, &__block_literal_global);
  }
  uint64_t result = _CFRuntimeCreateInstance();
  if (result)
  {
    *(_DWORD *)(result + 16) = a1;
    *(_BYTE *)(result + 20) = a2;
    *(void *)(result + 24) = 0LL;
  }

  return result;
}

uint64_t MKBKeyBagCreateEscrowWithAuth(const __CFData *a1, CFDataRef theData, uint64_t *a3)
{
  if (theData)
  {
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    if (!a1) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }

  if (a1)
  {
LABEL_3:
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }

uint64_t MKBKeyBagCreateBackup(CFDataRef theData, uint64_t *a2)
{
  if (theData)
  {
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
  }

  uint64_t result = aks_create_bag();
  if ((_DWORD)result) {
    return convertAKSErrorToMKB(result);
  }
  uint64_t v5 = __kbHandleWithKernelHandle(v6, 0);
  *a2 = v5;
  uint64_t result = v5 ? 0LL : 4294967291LL;
  if (theData && v5)
  {
    if (CFDataGetLength(theData) < 1) {
      return 0LL;
    }
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    uint64_t result = aks_prederived_create();
    if ((_DWORD)result) {
      return convertAKSErrorToMKB(result);
    }
  }

  return result;
}

uint64_t MKBKeyBagCreateOTABackup(const __CFData *a1, uint64_t *a2)
{
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }

  uint64_t bag = aks_create_bag();
  if ((_DWORD)bag) {
    return convertAKSErrorToMKB(bag);
  }
  uint64_t v6 = __kbHandleWithKernelHandle(v7, 1);
  *a2 = v6;
  if (v6) {
    return 0LL;
  }
  else {
    return 4294967291LL;
  }
}

uint64_t MKBKeyBagRegisterOTABackup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 registerOTABackup:a1 withSecret:a2];

  return v5;
}

uint64_t MKBBackupEnableForVolume(uint64_t a1, uint64_t a2, void *a3, CFDataRef *a4)
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  uint64_t v9 = [v8 enableBackupForVolume:a1 withSecret:a2 bagData:&v12];
  uint64_t v10 = (const __CFData *)v12;

  if (a4 && v10) {
    uint64_t v9 = MKBBackupCopyBackupBagUUIDForBag(v10, a4);
  }
  if (!(_DWORD)v9) {
    *a3 = v10;
  }

  return v9;
}

uint64_t MKBBackupCopyBackupBagUUIDForBag(const __CFData *a1, CFDataRef *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  *(void *)bytes = 0LL;
  uint64_t v14 = 0LL;
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  uint64_t v4 = aks_backup_copy_bag_uuid();
  uint64_t v11 = v4;
  if ((_DWORD)v4) {
    debuglog( "MKBBackupCopyBackupBagUUIDForBag",  @"Failed to get backup bag uuid from data: %x",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }
  else {
    *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 16LL);
  }
  return convertAKSErrorToMKB(v11);
}

uint64_t MKBBackupDisableForVolume(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 disableBackupForVolume:a1];

  return v3;
}

uint64_t MKBBackupCopyBackupBagUUIDForVolume(const __CFData *a1, CFDataRef *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  memset(dst, 0, sizeof(dst));
  *(void *)bytes = 0LL;
  uint64_t v14 = 0LL;
  BytePtr = CFDataGetBytePtr(a1);
  uuid_copy(dst, BytePtr);
  uint64_t v4 = aks_backup_copy_current_bag_uuid();
  uint64_t v11 = v4;
  if ((_DWORD)v4) {
    debuglog( "MKBBackupCopyBackupBagUUIDForVolume",  @"Failed to get backup bag uuid for volume: %x",  v5,  v6,  v7,  v8,  v9,  v10,  v4);
  }
  else {
    *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 16LL);
  }
  return convertAKSErrorToMKB(v11);
}

uint64_t MKBKeyBagLock()
{
  return aks_lock_bag();
}

uint64_t MKBKeyBagUnlock(uint64_t a1, CFDataRef theData)
{
  if (*(void *)(a1 + 24))
  {
    if (theData)
    {
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
    }

    uint64_t v4 = aks_prederived_unlock_keybag();
    if ((_DWORD)v4)
    {
      uint64_t v11 = v4;
      debuglog("MKBKeyBagUnlock", @"aks_prederived_unlock_keybag() returned %d", v5, v6, v7, v8, v9, v10, v4);
      return convertAKSErrorToMKB(v11);
    }
  }

  else
  {
    if (theData)
    {
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
    }

    uint64_t v13 = aks_unlock_bag();
    if ((_DWORD)v13)
    {
      uint64_t v14 = v13;
      debuglog("MKBKeyBagUnlock", @"aks_unlock_bag() returned %d", v5, v6, v7, v8, v9, v10, v13);
      return convertAKSErrorToMKB(v14);
    }
  }

  debuglog("MKBKeyBagUnlock", @"unlocked bag %d", v5, v6, v7, v8, v9, v10, *(_DWORD *)(a1 + 16));
  return convertAKSErrorToMKB(0LL);
}

uint64_t MKBKeyBagCopyData(uint64_t a1, CFDataRef *a2)
{
  if (a2)
  {
    CFDataRef v4 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  0LL,  (CFAllocatorRef)*MEMORY[0x189604DB0]);
    *a2 = v4;
    if (!v4) {
      return 4294967291LL;
    }
  }

  return 0LL;
}

uint64_t MKBKeyBagCreateWithData(const __CFData *a1, uint64_t *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  uint64_t v5 = __kbHandleWithKernelHandle(v6, 0);
  *a2 = v5;
  if (!v5) {
    return 4294967291LL;
  }
  aks_prederived_is_enabled();
  return 0LL;
}

uint64_t MKBOTABackupKeyBag()
{
  return __kbHandleWithKernelHandle(-2, 1);
}

uint64_t MKBKeyBagChangeSecret(uint64_t a1, CFDataRef theData, const __CFData *a3)
{
  if (!*(void *)(a1 + 24))
  {
    if (theData)
    {
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
      if (!a3)
      {
LABEL_11:
        uint64_t v5 = aks_change_secret();
        return convertAKSErrorToMKB(v5);
      }
    }

    else if (!a3)
    {
      goto LABEL_11;
    }

    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_11;
  }

  if (!theData)
  {
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_4;
  }

  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  if (a3)
  {
LABEL_4:
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
  }

uint64_t MKBKeyBagRelease(const void *a1)
{
  return 0LL;
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  if (statfs("/var", &v1) >= 0) {
    return (v1.f_flags >> 7) & 1;
  }
  else {
    return 4294967290LL;
  }
}

uint64_t MKBDeviceObliterateClassDKey()
{
  uint64_t v0 = aks_obliterate_class_d();
  return convertAKSErrorToMKB(v0);
}

uint64_t MKBUserUnlockedSinceBoot(int a1)
{
  if (!a1 && gSystemUnlockedSinceBoot) {
    return 1LL;
  }
  uint64_t lock_state = aks_get_lock_state();
  if (convertAKSErrorToMKB(lock_state))
  {
    debuglog( "MKBUserUnlockedSinceBoot",  @"MKBUserUnlockedSinceBoot for user(%d) fails with error(%d), returning 0",  v4,  v5,  v6,  v7,  v8,  v9,  a1);
    return 0LL;
  }

  else
  {
    uint64_t result = (v10 >> 2) & 1;
    if (!a1) {
      gSystemUnlockedSinceBoot = (v10 & 4) >> 2;
    }
  }

  return result;
}

uint64_t MKBKeyBagCreateSystemUnwrapped(const __CFData *a1, const char *a2)
{
  return _MKBKeyBagCreateSystem(a1, a2);
}

uint64_t _MKBKeyBagCreateSystem(const __CFData *a1, const char *a2)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!MKBDeviceSupportsEnhancedAPFS())
  {
    snprintf(__str, 0x401uLL, "%s/%s/%s.kb", a2, "keybags", "systembag");
    if (!stat(__str, &v42))
    {
      debuglog("_MKBKeyBagCreateSystem", @"%s already exists", v11, v12, v13, v14, v15, v16, (char)__str);
      return 4294967292LL;
    }

    if (a1)
    {
      CFDataGetBytePtr(a1);
      CFDataGetLength(a1);
    }

    uint64_t bag = aks_create_bag();
    if ((_DWORD)bag)
    {
      uint64_t v40 = bag;
      debuglog("_MKBKeyBagCreateSystem", @"AKS can't create bag: %08x", v18, v19, v20, v21, v22, v23, bag);
    }

    else
    {
      uint64_t v24 = aks_set_system();
      if (!(_DWORD)v24)
      {
        uint64_t v31 = KBSaveSystemBagHandle(0, a2, 0LL, 0, 0LL);
        if ((_DWORD)v31)
        {
          uint64_t v10 = v31;
          debuglog("_MKBKeyBagCreateSystem", @"Can't save the bag: %d", v32, v33, v34, v35, v36, v37, v31);
          goto LABEL_14;
        }

        if ((MKBDeviceSupportsEnhancedAPFS() & 1) != 0)
        {
          uint64_t v10 = 0LL;
LABEL_14:
          aks_unload_bag();
          return v10;
        }

        uint64_t v38 = KBMapDeviceBag(a2, 0);
LABEL_13:
        uint64_t v10 = v38;
        goto LABEL_14;
      }

      uint64_t v40 = v24;
      debuglog("_MKBKeyBagCreateSystem", @"Can't set the system bag: %08x", v25, v26, v27, v28, v29, v30, v24);
    }

    uint64_t v38 = convertAKSErrorToMKB(v40);
    goto LABEL_13;
  }

  debuglog( "_MKBKeyBagCreateSystem",  @"_MKBKeyBagCreateSystem does nothing, returning success",  v4,  v5,  v6,  v7,  v8,  v9,  v41);
  return 0LL;
}

uint64_t MKBKeyBagCreateSystem(const __CFData *a1, const char *a2)
{
  return _MKBKeyBagCreateSystem(a1, a2);
}

uint64_t _MKBKeyBagChangeSystemSecretDirect(const __CFData *a1, const __CFData *a2, const void *a3)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v8 = CFDataGetBytePtr(a2);
  CFIndex v9 = CFDataGetLength(a2);
  return KBChangeSystemSecret(0, 0LL, (uint64_t)BytePtr, Length, (uint64_t)v8, v9, a3);
}

uint64_t MKBKeyBagPerformRecovery(const __CFData *a1, const __CFDictionary *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 Event:4];

  handleToUse(a2);
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }

  uint64_t v5 = aks_change_secret();
  return convertAKSErrorToMKB(v5);
}

uint64_t make_random_key(uint64_t a1)
{
  if (*(void *)(a1 + 1072)) {
    return 0LL;
  }
  return 0LL;
}

uint64_t MKBFileOpenForBackup(const __CFString *a1, void *a2)
{
  uint64_t v4 = (char *)malloc(0x558uLL);
  if (!v4) {
    return 4294967291LL;
  }
  uint64_t v5 = v4;
  bzero(v4, 0x558uLL);
  uint64_t v6 = 0xFFFFFFFFLL;
  *((_DWORD *)v5 + 257) = -1;
  if (!CFStringGetCString(a1, v5, 1025LL, 0x8000100u)) {
    goto LABEL_17;
  }
  if (stat(v5, (stat *)(v5 + 1088))) {
    goto LABEL_16;
  }
  int v14 = open(v5, 256);
  *((_DWORD *)v5 + 257) = v14;
  if (v14 == -1)
  {
    if (*__error() == 1)
    {
      int v14 = open_dprotected_np(v5, 256, 0, 1);
      *((_DWORD *)v5 + 257) = v14;
      if (v14 != -1)
      {
        v5[1080] = 1;
        goto LABEL_9;
      }

uint64_t MKBFileClose( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a1[257];
  if (v9 != -1) {
    close(v9);
  }
  uint64_t v10 = (_CCCryptor *)*((void *)a1 + 134);
  if (v10) {
    CCCryptorRelease(v10);
  }
  uint64_t v11 = *((void *)a1 + 170);
  if (v11) {
    deallocate_page_aligned_buffer(v11, 4096LL, a3, a4, a5, a6, a7, a8, v13);
  }
  bzero(a1, 0x558uLL);
  free(a1);
  return 0LL;
}

uint64_t MKBFileCreateForRestore(const __CFString *a1, int a2, CFDataRef theData, void *a4)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (!theData) {
    return 0xFFFFFFFFLL;
  }
  BytePtr = CFDataGetBytePtr(theData);
  if (!CFStringGetCString(a1, buffer, 1025LL, 0x8000100u)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = (char *)malloc(0x558uLL);
  if (!v8) {
    return 4294967291LL;
  }
  int v9 = v8;
  bzero(v8, 0x558uLL);
  *((_DWORD *)v9 + 257) = -1;
  CFIndex Length = CFDataGetLength(theData);
  if (Length == 76 || Length == 44)
  {
    unsigned int v11 = *(_DWORD *)BytePtr;
    CFDataGetLength(theData);
    if (!aks_unwrap_key())
    {
      if (CCCryptorCreate(1u, 0, 1u, v9 + 1036, 0x20uLL, 0LL, (CCCryptorRef *)v9 + 134))
      {
        uint64_t v22 = 4294967289LL;
        goto LABEL_18;
      }

      goto LABEL_8;
    }

uint64_t init_ota(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  int v4 = open_dprotected_np((const char *)a1, 256, 0, 1);
  if (v4 != -1)
  {
    int v5 = v4;
    close(*(_DWORD *)(a1 + 1028));
    *(_DWORD *)(a1 + 1028) = v5;
    *(_BYTE *)(a1 + 1080) = 1;
LABEL_6:
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 1084) = 4096;
    return result;
  }

  return 4294967290LL;
}

uint64_t MKBFileEncryptedBlockSize(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 1080)) {
    return *(unsigned int *)(a1 + 1084);
  }
  else {
    return 4096LL;
  }
}

size_t MKBFileWrite( uint64_t a1, char *data, size_t __size, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = __size;
  uint64_t v75 = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(a1 + 1080))
  {
    size_t v21 = 0LL;
    size_t dataOutMoved = 0LL;
    size_t dataIn = 0LL;
    if (*(_DWORD *)(a1 + 1032)) {
      return v21;
    }
    if ((__size & 0xF) != 0)
    {
      debuglog( "MKBFileWriteTranscrypt",  @"buffer size %zu not a multiple of %d\n",  __size,  a4,  a5,  a6,  a7,  a8,  __size);
    }

    else if (__size)
    {
      uint64_t v22 = (char *)malloc(__size);
      if (v22)
      {
        uint64_t v29 = v22;
        CCCryptorStatus v30 = CCCryptorUpdate(*(CCCryptorRef *)(a1 + 1072), data, v8, v22, v8, &dataOutMoved);
        if (v30)
        {
          debuglog("MKBFileWriteTranscrypt", @"CCCryptorUpdate() failed: %d\n", v31, v32, v33, v34, v35, v36, v30);
        }

        else
        {
          size_t v21 = writen(*(_DWORD *)(a1 + 1028), v29, dataOutMoved);
          if (v21 == dataOutMoved)
          {
LABEL_36:
            free(v29);
            return v21;
          }

          uint64_t v51 = __error();
          char dataOuta = strerror(*v51);
          debuglog("MKBFileWriteTranscrypt", @"write failed: %s\n", v52, v53, v54, v55, v56, v57, dataOuta);
        }

        size_t v21 = -1LL;
        goto LABEL_36;
      }

      debuglog( "MKBFileWriteTranscrypt",  @"Couldn't allocate work buffer of %zu bytes\n",  v23,  v24,  v25,  v26,  v27,  v28,  v8);
    }

    else
    {
      *(_DWORD *)(a1 + 1032) = 1;
      CCCryptorStatus v41 = CCCryptorFinal(*(CCCryptorRef *)(a1 + 1072), md, 0x10uLL, &dataIn);
      if (v41)
      {
        debuglog("MKBFileWriteTranscrypt", @"CCCryptorFinal() failed: %d\n", v42, v43, v44, v45, v46, v47, v41);
      }

      else
      {
        size_t v48 = writen(*(_DWORD *)(a1 + 1028), (char *)md, dataIn);
        if (v48 == dataIn) {
          return v48;
        }
        unsigned int v58 = __error();
        char dataOutb = strerror(*v58);
        debuglog("MKBFileWriteTranscrypt", @"write failed: %s\n", v59, v60, v61, v62, v63, v64, dataOutb);
      }
    }

    return -1LL;
  }

  if (!*(void *)(a1 + 1360)) {
    *(void *)(a1 + 1360) = allocate_page_aligned_buffer(0x1000uLL);
  }
  if (!v8) {
    return v8;
  }
  unint64_t v11 = v8;
  while (v11 >= 0x1000)
  {
    uint64_t v12 = *(void *)(a1 + 1336);
    if (v12 <= 0) {
      uint64_t v13 = -(-v12 & 0xFFF);
    }
    else {
      uint64_t v13 = *(void *)(a1 + 1336) & 0xFFFLL;
    }
    size_t v14 = 4096 - v13;
    if (v11 >= v14) {
      size_t dataOutAvailable = v14;
    }
    else {
      size_t dataOutAvailable = v11;
    }
    if (!(v12 % *(unsigned int *)(a1 + 1084)))
    {
      CC_SHA1((const void *)(a1 + 1036), 0x20u, md);
      unsigned int v16 = *(_DWORD *)(a1 + 1336);
      if ((v16 & 1) != 0) {
        unsigned int v17 = (v16 >> 1) ^ 0x80000061;
      }
      else {
        unsigned int v17 = v16 >> 1;
      }
      unsigned int v18 = v17 >> 1;
      if ((v17 & 1) != 0) {
        unsigned int v18 = (v17 >> 1) ^ 0x80000061;
      }
      size_t dataIn = __PAIR64__(v18, v17);
      unsigned int v19 = v18 >> 1;
      if ((v18 & 1) != 0) {
        unsigned int v19 = (v18 >> 1) ^ 0x80000061;
      }
      unsigned int v20 = v19 >> 1;
      if ((v19 & 1) != 0) {
        unsigned int v20 = (v19 >> 1) ^ 0x80000061;
      }
      unsigned int v70 = v19;
      unsigned int v71 = v20;
    }

    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 1236), data, dataOutAvailable);
    if (CCCrypt( 1u,  0,  0,  (const void *)(a1 + 1036),  0x20uLL,  (const void *)(a1 + 1344),  data,  dataOutAvailable,  *(void **)(a1 + 1360),  dataOutAvailable,  0LL))
    {
      return -1LL;
    }

    if (writen(*(_DWORD *)(a1 + 1028), *(char **)(a1 + 1360), dataOutAvailable) != dataOutAvailable)
    {
      char v50 = __error();
      char dataOut = strerror(*v50);
      uint64_t v40 = @"write failed: %s\n";
      goto LABEL_58;
    }

    data += dataOutAvailable;
    *(void *)(a1 + 1336) += dataOutAvailable;
    v11 -= dataOutAvailable;
    if (!v11) {
      return v8;
    }
  }

  if (v11 != 28)
  {
    uint64_t v40 = @"Unknown trailer blob";
LABEL_58:
    debuglog("MKBFileWriteEncrypted", v40, __size, a4, a5, a6, a7, a8, dataOut);
    return -1LL;
  }

  CC_SHA1_Final(md, (CC_SHA1_CTX *)(a1 + 1236));
  if (*((void *)data + 1) != *(void *)md
    || *((void *)data + 2) != v73
    || *((_DWORD *)data + 6) != (unint64_t)v74)
  {
    ftruncate(*(_DWORD *)(a1 + 1028), 0LL);
    return -1LL;
  }

  off_t v39 = bswap64(*(void *)data);
  if (v39 > *(void *)(a1 + 1336))
  {
    uint64_t v40 = @"file cannot be larger than backup";
    goto LABEL_58;
  }

  if (ftruncate(*(_DWORD *)(a1 + 1028), v39))
  {
    uint64_t v40 = @"ftruncate() failed";
    goto LABEL_58;
  }

  return v8;
}

uint64_t MKBFileReadEncrypted( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 1032)) {
    return 0LL;
  }
  if (!*(_BYTE *)(a1 + 1080)) {
    return -1LL;
  }
  uint64_t v10 = a3;
  if (!*(void *)(a1 + 1360)) {
    *(void *)(a1 + 1360) = allocate_page_aligned_buffer(0x1000uLL);
  }
  if ((v10 & 0xFFF) != 0)
  {
    debuglog("MKBFileReadEncrypted", @"Buffer size %zu not multiple of %zu\n", a3, a4, a5, a6, a7, a8, v10);
    return -1LL;
  }

  if (fstat(*(_DWORD *)(a1 + 1028), &v32) < 0)
  {
    unsigned int v16 = __error();
    char v30 = strerror(*v16);
    debuglog("MKBFileReadEncrypted", @"fstat() failed:%s\n", v17, v18, v19, v20, v21, v22, v30);
    return -1LL;
  }

  if (v10 < 1) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  while (!*(_DWORD *)(a1 + 1032))
  {
    size_t v13 = readn(*(_DWORD *)(a1 + 1028), *(char **)(a1 + 1360), 0x1000uLL);
    if ((v13 & 0x8000000000000000LL) != 0)
    {
      uint64_t v23 = __error();
      char v31 = strerror(*v23);
      debuglog("MKBFileReadEncrypted", @"read() failed:%s\n", v24, v25, v26, v27, v28, v29, v31);
      return -1LL;
    }

    if (!v13
      || (unint64_t v14 = (v13 + 4095) & 0xFFFFFFFFFFFFF000LL,
          memcpy(a2, *(const void **)(a1 + 1360), v14),
          CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 1236), *(const void **)(a1 + 1360), v14),
          (*(void *)(a1 + 1336) += v14) == 0LL))
    {
      *(_DWORD *)(a1 + 1032) = 1;
      *(void *)a2 = bswap64(*(void *)(a1 + 1184));
      CC_SHA1_Final(a2 + 8, (CC_SHA1_CTX *)(a1 + 1236));
      unint64_t v14 = 28LL;
    }

    a2 += v14;
    v8 += v14;
    BOOL v15 = v10 > v14;
    if (v10 >= v14) {
      v10 -= v14;
    }
    else {
      uint64_t v10 = 0LL;
    }
    if (!v15) {
      return v8;
    }
  }

  return v8;
}

vm_address_t allocate_page_aligned_buffer(vm_size_t size)
{
  vm_address_t address = 0LL;
  if (vm_allocate(*MEMORY[0x1895FBBE0], &address, size, -268435455)) {
    debuglog( "allocate_page_aligned_buffer",  @"Failed to allocate page aligned buffer",  v1,  v2,  v3,  v4,  v5,  v6,  v8);
  }
  return address;
}

size_t readn(int a1, char *a2, size_t a3)
{
  if (a3)
  {
    size_t v6 = a3;
    while (1)
    {
      ssize_t v7 = read(a1, a2, v6);
      if (v7 == -1)
      {
        if (*__error() != 4) {
          return -1LL;
        }
        ssize_t v7 = 0LL;
      }

      else if (!v7)
      {
        return a3 - v6;
      }

      a2 += v7;
      v6 -= v7;
      if (!v6) {
        return a3 - v6;
      }
    }
  }

  size_t v6 = 0LL;
  return a3 - v6;
}

uint64_t MKBFileRead( uint64_t a1, unsigned __int8 *a2, int64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 1080)) {
    return MKBFileReadEncrypted(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  size_t v44 = 0LL;
  size_t dataOutMoved = 0LL;
  if ((a3 & 0xF) == 0)
  {
    if (*(_DWORD *)(a1 + 1032)) {
      return 0LL;
    }
    size_t v18 = readn(*(_DWORD *)(a1 + 1028), (char *)a2, a3);
    if ((v18 & 0x8000000000000000LL) != 0)
    {
      uint64_t v27 = __error();
      char v43 = strerror(*v27);
      debuglog("MKBFileReadTranscrypt", @"read() failed:%s\n", v28, v29, v30, v31, v32, v33, v43);
      return -1LL;
    }

    int64_t v19 = v18;
    if (v18)
    {
      CCCryptorStatus v20 = CCCryptorUpdate(*(CCCryptorRef *)(a1 + 1072), a2, v18, a2, a3, &dataOutMoved);
      if (v20)
      {
        debuglog("MKBFileReadTranscrypt", @"CCCryptorUpdate() failed:%d\n", v21, v22, v23, v24, v25, v26, v20);
        return -1LL;
      }

      size_t v34 = dataOutMoved;
    }

    else
    {
      size_t v34 = 0LL;
    }

    if (v19 >= a3)
    {
      size_t v42 = 0LL;
    }

    else
    {
      *(_DWORD *)(a1 + 1032) = 1;
      CCCryptorStatus v35 = CCCryptorFinal(*(CCCryptorRef *)(a1 + 1072), &a2[v34], a3 - v34, &v44);
      if (v35)
      {
        debuglog("MKBFileReadTranscrypt", @"CCCCryptorFinal() failed:%d\n", v36, v37, v38, v39, v40, v41, v35);
        return -1LL;
      }

      size_t v42 = v44;
      size_t v34 = dataOutMoved;
    }

    return v34 + v42;
  }

  debuglog("MKBFileReadTranscrypt", @"Buffer size %zu not multiple of %d\n", v12, v13, v14, v15, v16, v17, a3);
  return -1LL;
}

uint64_t MKBFileValidateWrappedKey(uint64_t a1, uint64_t a2, CFDataRef theData)
{
  if (!theData || !*(_BYTE *)(a2 + 20)) {
    return 0xFFFFFFFFLL;
  }
  CFIndex Length = CFDataGetLength(theData);
  if (Length == 76 || Length == 44)
  {
    unsigned int v6 = *(_DWORD *)CFDataGetBytePtr(theData);
  }

  else
  {
    BytePtr = CFDataGetBytePtr(theData);
    if (*((_DWORD *)BytePtr + 3) != *(_DWORD *)(a1 + 1096)
      || *(_DWORD *)BytePtr != *(_DWORD *)(a1 + 1168)
      || *((_DWORD *)BytePtr + 1) != *(_DWORD *)(a1 + 1176))
    {
      return 0xFFFFFFFFLL;
    }

    unsigned int v6 = bswap32(*((_DWORD *)CFDataGetBytePtr(theData) + 6));
  }

  return 0xFFFFFFFFLL;
}

uint64_t MKBFileCopyWrappedKey_OTA(int64x2_t *a1, __CFData **a2)
{
  CFMutableDictionaryRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  *(int32x2_t *)bytes = vmovn_s64(a1[73]);
  __int32 v23 = a1[68].i32[0];
  uint64_t v24 = a1[68].i64[1];
  CFDataAppendBytes(Mutable, bytes, 20LL);
  *(_DWORD *)uint64_t v21 = bswap32(a1[67].u32[3]);
  CFDataAppendBytes(Mutable, v21, 4LL);
  if (!a1[67].i8[8] || (int v5 = open(a1->i8, 256), v5 < 0))
  {
    int v7 = a1[64].i32[1];
    int v6 = v7;
  }

  else
  {
    int v6 = v5;
    int v7 = a1[64].i32[1];
  }

  char v8 = MKBCopyCryptoIDKeysForFileDescriptor(v7, 0LL, 0LL);
  if (v8)
  {
    int v9 = v8;
    if ((unint64_t)CFDataGetLength(v8) >= 8)
    {
      BytePtr = CFDataGetBytePtr(v9);
      unsigned int v17 = bswap32(*((_DWORD *)BytePtr + 6));
      if (v17 == a1[77].i32[0])
      {
        size_t v18 = BytePtr;
        CFDataAppendBytes(Mutable, BytePtr + 24, 4LL);
        CFIndex Length = CFDataGetLength(v9);
        CFDataAppendBytes(Mutable, v18 + 36, Length - 36);
        *a2 = Mutable;
        CFRelease(v9);
        return 0LL;
      }

      debuglog( "MKBFileCopyWrappedKey_OTA",  @"Protection class changed from %d to %d",  v11,  v12,  v13,  v14,  v15,  v16,  v17);
      CFRelease(v9);
    }
  }

  if (v6 != -1) {
    close(v6);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  *a2 = 0LL;
  return 0xFFFFFFFFLL;
}

CFMutableDataRef MKBCopyCryptoIDKeysForFileDescriptor(int a1, const __CFData *a2, void *a3)
{
  int v5 = a1;
  v159[2] = *MEMORY[0x1895F89C0];
  v159[0] = 0LL;
  v159[1] = 0LL;
  *(void *)uu2 = 0LL;
  uint64_t v158 = 0LL;
  if (ffsctl(a1, 0x40104A60uLL, v159, 0))
  {
    int v6 = __error();
    strerror(*v6);
    debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"Can't get volume uuid for fd %d: %s",  v7,  v8,  v9,  v10,  v11,  v12,  v5);
    return 0LL;
  }

  int v13 = aks_backup_copy_current_bag_uuid();
  if (v13)
  {
    debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"Error from aks_backup_copy_current_bag_uuid: %d",  v14,  v15,  v16,  v17,  v18,  v19,  v13);
    return 0LL;
  }

  all_crypto_ids = _apfs_get_all_crypto_ids(v5);
  if (!all_crypto_ids)
  {
    if (!fstat(v5, &dst)) {
      debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"file size %lld bytes",  v130,  v131,  v132,  v133,  v134,  v135,  dst.st_size);
    }
    return 0LL;
  }

  uint64_t v29 = all_crypto_ids;
  debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"found %d extent%s",  v23,  v24,  v25,  v26,  v27,  v28,  all_crypto_ids[4]);
  KBPostAggdDistribution((uint64_t)@"com.apple.mobile.keybagd.db.file.extents.number", 0, 0xAu);
  CFMutableDataRef Mutable = CFDataCreateMutable(0LL, 0LL);
  CFMutableDataRef v20 = Mutable;
  if (v29[4])
  {
    uint64_t v138 = a3;
    uint64_t v37 = 0LL;
    uint64_t v144 = 0LL;
    uint64_t v146 = v29 + 8;
    uint64_t v137 = *MEMORY[0x189607670];
    uint64_t v139 = a2;
    int v140 = v5;
    CFMutableDataRef cf = Mutable;
    char v142 = v29;
    while (1)
    {
      memset(&dst.st_atimespec, 0, 76);
      *(_OWORD *)&dst.st_dev = 0u;
      *(_OWORD *)&dst.st_uid = 0xFFFFFFFFFFFFFFFFLL;
      uint64_t v38 = &v146[12 * v37];
      unint64_t v39 = *((void *)v38 + 2);
      unint64_t v41 = *((void *)v38 + 1);
      uint64_t v40 = v38 + 4;
      *(void *)bytes = bswap64(v41);
      if (v39 == -1LL) {
        break;
      }
      if ((v39 & 0x8000000000000000LL) == 0)
      {
        debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"looking for backup key for crypto_id 0x%016qx (%d of %u)",  v31,  v32,  v33,  v34,  v35,  v36,  v39);
        if (a2)
        {
          BytePtr = CFDataGetBytePtr(a2);
          unint64_t Length = CFDataGetLength(a2);
          if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v44, v45, v46, v47, v48, v49))
          {
            uint64_t v66 = -19LL;
          }

          else
          {
            if (Length)
            {
              unint64_t v56 = 0LL;
              uint64_t v57 = BytePtr;
              while (1)
              {
                uint64_t v58 = bswap32(*((_DWORD *)v57 + 8));
                unint64_t v59 = bswap64(*((void *)v57 + 2));
                debuglog( "copy_rewrapped_key_from_existing_key",  @"crypto_id = 0x%016llx, extent_size = %llu, key class = %u",  v50,  v51,  v52,  v53,  v54,  v55,  v59);
                if (v59 == v39)
                {
                  debuglog( "copy_rewrapped_key_from_existing_key",  @"Found target crypto_id",  v50,  v51,  v52,  v53,  v54,  v55,  (char)v136);
                  if (!uuid_compare(v57, uu2))
                  {
                    __memcpy_chk();
                    id v145 = 0LL;
                    id v90 = 0LL;
                    a2 = v139;
                    int v5 = v140;
                    CFMutableDataRef v20 = cf;
                    uint64_t v29 = v142;
                    goto LABEL_49;
                  }

                  debuglog( "copy_rewrapped_key_from_existing_key",  @"Bag uuid mismatch, ignore",  v60,  v61,  v62,  v63,  v64,  v65,  (char)v136);
                }

                v56 += v58 + 44;
                uint64_t v57 = &BytePtr[v56];
                if (v56 >= Length)
                {
                  uint64_t v66 = -8LL;
                  a2 = v139;
                  int v5 = v140;
                  goto LABEL_25;
                }
              }
            }

            uint64_t v66 = -8LL;
          }

LABEL_25:
          [MEMORY[0x189607870] errorWithDomain:@"MobileKeyBagError" code:v66 userInfo:0];
          id v145 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v29 = v142;
        }

        else
        {
          id v145 = 0LL;
        }

        id v147 = 0LL;
        [MEMORY[0x189603F48] dataWithBytesNoCopy:v159 length:16 freeWhenDone:0];
        unsigned int v74 = (void *)objc_claimAutoreleasedReturnValue();
        +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
        uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
        [v75 getBackupkeyForVolume:v74 andCryptoID:v39 withError:&v147];
        uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          debuglog( "copy_rewrapped_key_from_db",  @"found rewrapped key in MKB backup db",  v77,  v78,  v79,  v80,  v81,  v82,  (char)v136);
          objc_msgSend(v76, "getBytes:length:", &dst, objc_msgSend(v76, "length"));
          if (uuid_compare((const unsigned __int8 *)&dst, uu2))
          {
            debuglog( "copy_rewrapped_key_from_db",  @"key found in db doesn't match current backup bag!!",  v83,  v84,  v85,  v86,  v87,  v88,  (char)v136);
            goto LABEL_29;
          }

          char v89 = 1;
        }

        else
        {
LABEL_29:
          char v89 = 0;
        }

        id v90 = v147;
        if ((v89 & 1) != 0)
        {
          CFMutableDataRef v20 = cf;
          goto LABEL_49;
        }

        v143 = v90;
        id v149 = 0LL;
        p_stat dst = &dst;
        debuglog( "copy_rewrapped_key_from_file",  @"getting wrapped key from aks",  v91,  v92,  v93,  v94,  v95,  v96,  (char)v136);
        uint64_t v97 = _apfs_copy_wrapped_key_from_file(v5, v39, (CFTypeRef *)&v149);
        if (!v97)
        {
          id v100 = v149;
          goto LABEL_43;
        }

        uint64_t v98 = v97;
        if (v144)
        {
          uint64_t v136 = &dst;
          int v99 = aks_backup_rewrap_ek();
        }

        else
        {
          int v99 = aks_backup_rewrap_key();
        }

        int v101 = v99;
        free(v98);
        if (v101)
        {
          [MEMORY[0x189607870] errorWithDomain:v137 code:v101 userInfo:0];
          id v100 = (id)objc_claimAutoreleasedReturnValue();
          debuglog( "copy_rewrapped_key_from_file",  @"aks_backup_rewrap_key() failed: %d",  v102,  v103,  v104,  v105,  v106,  v107,  v101);
          goto LABEL_43;
        }

        if (uuid_compare((const unsigned __int8 *)&dst, uu2))
        {
          debuglog( "copy_rewrapped_key_from_file",  @"backup key doesn't match current bag uuid!!",  v91,  v92,  v93,  v94,  v95,  v96,  (char)v136);
          id v100 = 0LL;
LABEL_43:
          id v108 = v100;
          debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"Could not get the backup key for crypto ID 0x%016qx (%d of %u, existing keys: %s, found1:%d, found2:%d, found3:%d)",  v109,  v110,  v111,  v112,  v113,  v114,  v39);
          int v115 = (void *)MEMORY[0x189607870];
          v151 = @"cryptoId";
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v39];
          uint64_t v116 = (void *)objc_claimAutoreleasedReturnValue();
          v155[0] = v116;
          uint64_t v152 = @"existingKeyError";
          ObjectOrNull(v145);
          uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue();
          v155[1] = v117;
          uint64_t v153 = @"dbError";
          ObjectOrNull(v143);
          uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue();
          v155[2] = v118;
          uint64_t v154 = @"fileError";
          ObjectOrNull(v108);
          uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue();
          v155[3] = v119;
          [MEMORY[0x189603F68] dictionaryWithObjects:v155 forKeys:&v151 count:4];
          uint64_t v120 = (void *)objc_claimAutoreleasedReturnValue();
          [v115 errorWithDomain:@"MobileKeyBagError" code:-8 userInfo:v120];
          uint64_t v121 = (void *)objc_claimAutoreleasedReturnValue();

          debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"Error: %@",  v122,  v123,  v124,  v125,  v126,  v127,  (char)v121);
          if (v138) {
            *uint64_t v138 = v121;
          }
          free(v144);
          uint64_t v29 = v142;
          free(v142);
          CFMutableDataRef v20 = cf;
          CFRelease(cf);

          char v128 = 0;
          unsigned int v73 = 0;
          a2 = v139;
          int v5 = v140;
          id v90 = v143;
        }

        else
        {
          if (bswap64(*(unint64_t *)&dst.st_uid) != v39)
          {
            debuglog( "copy_rewrapped_key_from_file",  @"whoa, cryptoID does not match backup_key.inode: %llu vs %llu",  v91,  v92,  v93,  v94,  v95,  v96,  bswap64((unint64_t)v152));
            *(void *)&p_dst->st_uid = bswap64(v39);
          }

          int v5 = v140;
          CFMutableDataRef v20 = cf;
          id v90 = v143;
LABEL_49:
          if (LODWORD(dst.st_atimespec.tv_sec))
          {
            uint64_t v121 = 0LL;
            unsigned int v73 = bswap32(dst.st_atimespec.tv_sec);
            char v128 = 1;
          }

          else
          {
            id v129 = v90;
            debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"got zero-length key for non-sparse crypto id",  v91,  v92,  v93,  v94,  v95,  v96,  (char)v136);
            free(v29);
            CFRelease(v20);
            id v90 = v129;
            char v128 = 0;
            unsigned int v73 = 0;
            uint64_t v121 = 0LL;
          }
        }

        if ((v128 & 1) == 0) {
          return 0LL;
        }
LABEL_53:
        debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"got extent size %llu, keysize %d",  v67,  v68,  v69,  v70,  v71,  v72,  *v40);
        CFDataAppendBytes(v20, (const UInt8 *)&dst, v73 + 36LL);
        CFDataAppendBytes(v20, bytes, 8LL);
        goto LABEL_54;
      }

      debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"looking for ekwk, crypto_id 0x%016qx (%d of %u)",  v31,  v32,  v33,  v34,  v35,  v36,  v39);
      uint64_t v144 = _apfs_copy_wrapped_key_from_file(v5, v39, 0LL);
LABEL_54:
    }

    debuglog( "MKBCopyCryptoIDKeysForFileDescriptor",  @"found sparse extent (%d of %u)",  v31,  v32,  v33,  v34,  v35,  v36,  v37);
    uuid_copy((unsigned __int8 *)&dst, uu2);
    unsigned int v73 = 0;
    goto LABEL_53;
  }

  uint64_t v144 = 0LL;
LABEL_60:
  free(v144);
  free(v29);
  return v20;
}

uint64_t MKBFileCopyWrappedKey()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v3 = (int64x2_t *)v0;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  int length = 0x8000;
  if (v3[67].i8[8]) {
    return MKBFileCopyWrappedKey_OTA(v3, v2);
  }
  if (v3[77].i32[0] == 7) {
    int v7 = 17;
  }
  else {
    int v7 = v3[77].i32[0];
  }
  *(_DWORD *)bytes = v7;
  uint64_t v8 = aks_wrap_key();
  uint64_t v9 = convertAKSErrorToMKB(v8);
  if ((_DWORD)v9)
  {
    uint64_t v6 = v9;
    debuglog( "MKBFileCopyWrappedKey",  @"aks_wrap_key error class: %d (%d) result: %d",  v10,  v11,  v12,  v13,  v14,  v15,  v7);
  }

  else
  {
    CFMutableDataRef Mutable = CFDataCreateMutable(0LL, 76LL);
    if (Mutable)
    {
      uint64_t v17 = Mutable;
      CFDataAppendBytes(Mutable, bytes, 4LL);
      CFDataAppendBytes(v17, &length_4, length);
      uint64_t v6 = 0LL;
      *uint64_t v2 = v17;
    }

    else
    {
      return 4294967291LL;
    }
  }

  return v6;
}

uint64_t MKBFileGetFD(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1028);
}

void deallocate_page_aligned_buffer( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x186E28B30](*MEMORY[0x1895FBBE0], a1, a2)) {
    debuglog( "deallocate_page_aligned_buffer",  @"Failed to deallocate page aligned buffer",  v9,  v10,  v11,  v12,  v13,  v14,  a9);
  }
}

uint64_t MKBBackupOpen(const char *a1, void *a2)
{
  int v4 = open_dprotected_np(a1, 256, 0, 1);
  int v5 = __error();
  if (v4 == -1)
  {
    int v8 = *v5;
    strerror(*v5);
    debuglog("MKBBackupOpen", @"failed to open_dprotected_np(%s): %s", v19, v20, v21, v22, v23, v24, (char)a1);
LABEL_10:
    *__error() = v8;
    return 0xFFFFFFFFLL;
  }

  int v6 = fstat(v4, &v32);
  int v7 = __error();
  int v8 = *v7;
  if (v6 == -1)
  {
    strerror(*v7);
    debuglog("MKBBackupOpen", @"failed to stat(%s): %s", v25, v26, v27, v28, v29, v30, (char)a1);
LABEL_9:
    close(v4);
    goto LABEL_10;
  }

  uint64_t v9 = calloc(1uLL, 0x28uLL);
  if (!v9)
  {
    debuglog("MKBBackupOpen", @"failed to allocate handle", v10, v11, v12, v13, v14, v15, v31);
    goto LABEL_9;
  }

  uint64_t v16 = v9;
  *uint64_t v9 = v4;
  int v17 = open(a1, 256);
  uint64_t result = 0LL;
  v16[1] = v17;
  *((void *)v16 + 1) = 0LL;
  *((void *)v16 + 2) = 0LL;
  *((void *)v16 + 3) = v32.st_ino;
  *((void *)v16 + 4) = v32.st_size;
  *a2 = v16;
  return result;
}

uint64_t MKBBackupGetFileDescriptors(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a2 = a1[1];
      *a3 = *a1;
    }
  }

  return result;
}

uint64_t MKBBackupCreateFromFileDescriptors(int a1, int a2, int **a3)
{
  if (fstat(a2, &v23) == -1)
  {
    uint64_t v15 = __error();
    strerror(*v15);
    debuglog( "MKBBackupCreateFromFileDescriptors",  @"failed to fstat encryptedfd(%d): %s",  v16,  v17,  v18,  v19,  v20,  v21,  a2);
    return 0xFFFFFFFFLL;
  }

  int v6 = (int *)calloc(1uLL, 0x28uLL);
  if (!v6)
  {
    debuglog("MKBBackupCreateFromFileDescriptors", @"failed to allocate handle", v7, v8, v9, v10, v11, v12, v22);
    return 0xFFFFFFFFLL;
  }

  uint64_t v13 = v6;
  uint64_t result = 0LL;
  *uint64_t v13 = a2;
  v13[1] = a1;
  *((void *)v13 + 1) = 0LL;
  *((void *)v13 + 2) = 0LL;
  *((void *)v13 + 3) = v23.st_ino;
  *((void *)v13 + 4) = v23.st_size;
  *a3 = v13;
  return result;
}

uint64_t MKBBackupActualFileSize(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

unint64_t MKBBackupSize(uint64_t a1)
{
  return (*(void *)(a1 + 32) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
}

uint64_t MKBBackupPread( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = 0LL;
  if (a3 && (uint64_t)((*(void *)(a1 + 32) + 15LL) & 0xFFFFFFFFFFFFFFF0LL) >= a4)
  {
    int64_t v12 = a4 + a3;
    int64_t v13 = (a4 + a3 + 4095) & 0xFFFFFFFFFFFFF000LL;
    unint64_t v14 = v13 - (a4 & 0xFFFFFFFFFFFFF000LL);
    page_aligned_buffer = *(void **)(a1 + 8);
    unint64_t v17 = *(void *)(a1 + 16);
    if (v14 > v17)
    {
      if (v17 && page_aligned_buffer) {
        deallocate_page_aligned_buffer(*(void *)(a1 + 8), *(void *)(a1 + 16), a3, a4, a5, a6, a7, a8, v35);
      }
      *(void *)(a1 + 16) = v14;
      page_aligned_buffer = (void *)allocate_page_aligned_buffer(v13 - (a4 & 0xFFFFFFFFFFFFF000LL));
      *(void *)(a1 + 8) = page_aligned_buffer;
    }

    unint64_t v18 = pread(*(_DWORD *)a1, page_aligned_buffer, v13 - (a4 & 0xFFFFFFFFFFFFF000LL), a4 & 0xFFFFFFFFFFFFF000LL);
    if ((v18 & 0x8000000000000000LL) != 0)
    {
      uint64_t v26 = __error();
      char v36 = strerror(*v26);
      debuglog("MKBBackupPread", @"pread() failed: %s\n", v27, v28, v29, v30, v31, v32, v36);
      return -1LL;
    }

    int64_t v25 = *(void *)(a1 + 32);
    if (v18 < v14 && v13 <= v25)
    {
      debuglog( "MKBBackupPread",  @"bytes_read(%ld) < read_size(%ld), but effective_start(%lld) + read_size(%ld) <= file_size(%lld)\n",  v19,  v20,  v21,  v22,  v23,  v24,  v18);
      return -1LL;
    }

    int64_t v34 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    if (v12 <= v34) {
      size_t v8 = a3;
    }
    else {
      size_t v8 = v34 - a4;
    }
    memcpy(a2, (const void *)(*(void *)(a1 + 8) + (a4 & 0xFFF)), v8);
  }

  return v8;
}

uint64_t MKBBackupClose( void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *a1;
  uint64_t v10 = *((void *)*a1 + 2);
  if (v10)
  {
    uint64_t v11 = *((void *)v9 + 1);
    if (v11) {
      deallocate_page_aligned_buffer(v11, v10, a3, a4, a5, a6, a7, a8, v14);
    }
  }

  if (*(_DWORD *)v9 != -1) {
    close(*(_DWORD *)v9);
  }
  int v12 = *((_DWORD *)v9 + 1);
  if (v12 != -1) {
    close(v12);
  }
  free(*a1);
  *a1 = 0LL;
  return 0LL;
}

uint64_t MKBBackupValidateKeyUUID(uint64_t a1, CFDataRef theData)
{
  CFDataRef theDataa = 0LL;
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  if (MKBKeyBagCopyUUID(a1, &theDataa))
  {
    debuglog("MKBBackupValidateKeyUUID", @"Failed to get bag uuid", v12, v13, v14, v15, v16, v17, v28);
    CFDataRef v18 = theDataa;
LABEL_11:
    if (v18) {
      CFRelease(v18);
    }
    return 0xFFFFFFFFLL;
  }

  CFDataRef v18 = theDataa;
  uint64_t v19 = CFDataGetBytePtr(theDataa);
  if (*(void *)BytePtr != *(void *)v19 || *((void *)BytePtr + 1) != *((void *)v19 + 1))
  {
    debuglog("MKBBackupValidateKeyUUID", @"Bag uuid mismatch", v20, v21, v22, v23, v24, v25, v28);
    goto LABEL_11;
  }

  CFRelease(v18);
  return 0LL;
}

uint64_t _MKBBackupCheckKey( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 <= 0x23)
  {
    debuglog("_MKBBackupCheckKey", @"corrupt blob size %zu, expected at least %zu", a3, a4, a5, a6, a7, a8, a2);
    return 0xFFFFFFFFLL;
  }

  uint64_t v10 = bswap32(*(_DWORD *)(a1 + 32));
  if (v10 + 36 != a2)
  {
    if (v10 + 44 <= a2)
    {
      debuglog("_MKBBackupCheckKey", @"found extent-based key_blob, size %zu", a3, a4, a5, a6, a7, a8, a2);
      unint64_t v18 = 0LL;
      uint64_t v19 = a1;
      do
      {
        if (a2 - v18 <= 0x23)
        {
          debuglog( "_MKBBackupCheckKey",  @"remaining blob size too short offset=%zu blob_size=%zu",  v12,  v13,  v14,  v15,  v16,  v17,  v18);
          return 0xFFFFFFFFLL;
        }

        unsigned int v20 = bswap32(*(_DWORD *)(v19 + 32));
        if (v20 >= 0x49)
        {
          debuglog("_MKBBackupCheckKey", @"wrapped key size too big (%lu>%u)", v12, v13, v14, v15, v16, v17, a2);
          return 0xFFFFFFFFLL;
        }

        debuglog( "_MKBBackupCheckKey",  @"offset = %zu, keysize = %u, extent size = %llu",  v12,  v13,  v14,  v15,  v16,  v17,  v18);
        v18 += v20 + 44LL;
        uint64_t v19 = v18 + a1;
      }

      while (v18 < a2);
      if (v18 == a2) {
        return 0LL;
      }
      debuglog("_MKBBackupCheckKey", @"odd blob size %zu, offset = %zu", v12, v13, v14, v15, v16, v17, a2);
    }

    else
    {
      debuglog("_MKBBackupCheckKey", @"odd blob size %zu", a3, a4, a5, a6, a7, a8, a2);
    }

    return 0xFFFFFFFFLL;
  }

  debuglog("_MKBBackupCheckKey", @"found single-extent key_blob, size %zu", a3, a4, a5, a6, a7, a8, a2);
  return 0LL;
}

uint64_t MKBKeyBagCopyUUID(uint64_t a1, CFDataRef *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t bag_uuid = aks_get_bag_uuid();
  uint64_t v11 = convertAKSErrorToMKB(bag_uuid);
  if ((_DWORD)v11) {
    debuglog( "MKBKeyBagCopyUUID",  @"failed to get uuid for handle %d",  v5,  v6,  v7,  v8,  v9,  v10,  *(_DWORD *)(a1 + 16));
  }
  else {
    *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 16LL);
  }
  return v11;
}

uint64_t MKBBackupValidateBackupKeyWithUUID(const __CFData *a1, const __CFData *a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  if (!_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11))
  {
    uint64_t v12 = CFDataGetBytePtr(a2);
    if (*(void *)BytePtr == *(void *)v12 && *((void *)BytePtr + 1) == *((void *)v12 + 1)) {
      return 0LL;
    }
    debuglog("MKBBackupValidateBackupKeyWithUUID", @"BackupKey uuid mismatch", v13, v14, v15, v16, v17, v18, v21);
  }

  return 0xFFFFFFFFLL;
}

uint64_t MKBBackupValidateKey(uint64_t a1, CFDataRef theData)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  BytePtr = CFDataGetBytePtr(theData);
  unint64_t Length = CFDataGetLength(theData);
  if (Length < (unint64_t)bswap32(*((_DWORD *)BytePtr + 8)) + 44)
  {
    debuglog("MKBBackupValidateKey", @"truncated key size: %zd", v12, v13, v14, v15, v16, v17, Length);
    return 0xFFFFFFFFLL;
  }

  memset(out, 0, 37);
  uuid_unparse(BytePtr, out);
  all_crypto_ids = _apfs_get_all_crypto_ids(*(_DWORD *)a1);
  if (!all_crypto_ids)
  {
    uint64_t v37 = *(void *)(a1 + 24);
    uint64_t v38 = __error();
    strerror(*v38);
    debuglog( "MKBBackupValidateKey",  @"Can't get crypto keys for inode %llu (fd %d): %s",  v39,  v40,  v41,  v42,  v43,  v44,  v37);
    return 0xFFFFFFFFLL;
  }

  if (Length)
  {
    unint64_t v24 = 0LL;
    unint64_t v25 = 0LL;
    uint64_t v26 = (uint64_t *)(all_crypto_ids + 16);
    uint64_t v27 = BytePtr;
    while (v24 < all_crypto_ids[4])
    {
      uint64_t v28 = bswap32(*((_DWORD *)v27 + 8));
      unint64_t v29 = bswap64(*((void *)v27 + 2));
      unint64_t v30 = bswap64(*(void *)&v27[v28 + 36]);
      memset(v47, 0, 37);
      uuid_unparse(v27, v47);
      debuglog( "MKBBackupValidateKey",  @"[%d] crypto_id = 0x%016llx, extent_size = %llu, key class = %u, bag uuid = %s",  v31,  v32,  v33,  v34,  v35,  v36,  v24);
      if (*v26 >= -1)
      {
        if (v29 != *v26)
        {
          debuglog( "MKBBackupValidateKey",  @"crypto_id mismatch (0x%016llx != 0x%016llx)",  v18,  v19,  v20,  v21,  v22,  v23,  v29);
          goto LABEL_25;
        }

        if (v30 != *(v26 - 1))
        {
          debuglog( "MKBBackupValidateKey",  @"extent_size mismatch (%llu != %llu)",  v18,  v19,  v20,  v21,  v22,  v23,  v30);
          goto LABEL_25;
        }

        if (uuid_compare(v27, BytePtr))
        {
          debuglog( "MKBBackupValidateKey",  @"bag uuid mismatch (%s != %s)",  v18,  v19,  v20,  v21,  v22,  v23,  (char)v47);
          goto LABEL_25;
        }

        v25 += v28 + 44;
        uint64_t v27 = &BytePtr[v25];
      }

      ++v24;
      v26 += 3;
      if (v25 >= Length) {
        break;
      }
    }
  }

  else
  {
    LODWORD(v24) = 0;
    unint64_t v25 = 0LL;
  }

  if (v25 != Length || (_DWORD)v24 != all_crypto_ids[4])
  {
    debuglog( "MKBBackupValidateKey",  @"extent count mismatch i=%d, count=%d, offset=%zu, key_blob_size=%zu",  v18,  v19,  v20,  v21,  v22,  v23,  v24);
LABEL_25:
    free(all_crypto_ids);
    return 0xFFFFFFFFLL;
  }

  free(all_crypto_ids);
  return 0LL;
}

uint64_t MKBBackupUpdateKeyWithError(int *a1, const __CFData *a2, CFTypeRef *a3, void *a4)
{
  if (!a3) {
    return 4294967279LL;
  }
  CFMutableDataRef v6 = MKBCopyCryptoIDKeysForFileDescriptor(*a1, a2, a4);
  *a3 = v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t result = CFEqual(v6, a2);
  if ((_DWORD)result)
  {
    CFRelease(*a3);
    uint64_t result = 0LL;
    *a3 = 0LL;
  }

  return result;
}

uint64_t MKBBackupUpdateKey(int *a1, const __CFData *a2, CFTypeRef *a3)
{
  return MKBBackupUpdateKeyWithError(a1, a2, a3, 0LL);
}

uint64_t MKBBackupCopyKeyWithError(int *a1, CFMutableDataRef *a2, void *a3)
{
  CFMutableDataRef v4 = MKBCopyCryptoIDKeysForFileDescriptor(*a1, 0LL, a3);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  CFMutableDataRef v5 = v4;
  uint64_t result = 0LL;
  *a2 = v5;
  return result;
}

uint64_t MKBBackupCopyKey(int *a1, CFMutableDataRef *a2)
{
  CFMutableDataRef v3 = MKBCopyCryptoIDKeysForFileDescriptor(*a1, 0LL, 0LL);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  CFMutableDataRef v4 = v3;
  uint64_t result = 0LL;
  *a2 = v4;
  return result;
}

uint64_t MKBBackupCopyBackupKeyUUID(const __CFData *a1, CFDataRef *a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11))
  {
    debuglog( "MKBBackupCopyBackupKeyUUID",  @"Bad key passed in, does not validate",  v12,  v13,  v14,  v15,  v16,  v17,  v21);
    CFDataRef v18 = 0LL;
    uint64_t v19 = 0xFFFFFFFFLL;
  }

  else
  {
    CFDataRef v18 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], BytePtr, 16LL);
    uint64_t v19 = 0LL;
  }

  *a2 = v18;
  return v19;
}

uint64_t MKBBackupSetKeyEncryptionModeToXTS(const __CFData *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t result = _MKBBackupCheckKey((uint64_t)BytePtr, Length, v4, v5, v6, v7, v8, v9);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  *((_BYTE *)BytePtr + 29) = 1;
  return result;
}

uint64_t ANS_AKDF2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  ccaes_cbc_encrypt_mode();
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  uint64_t v14 = &v22 - 2 * v13;
  MEMORY[0x1895F8858](v12);
  uint64_t v17 = &v22 - 2 * v16;
  uint64_t v18 = 0xFFFFFFFFLL;
  if (a5)
  {
    if (a6)
    {
      if ((a6 & 0xF) == 0)
      {
        if (a4)
        {
          if (a1)
          {
            if (a2)
            {
              if (a3)
              {
                uint64_t v23 = v15;
                if (!cccmac_init())
                {
                  unint64_t v24 = 1LL;
                  if (a6 < 0x10)
                  {
LABEL_15:
                    uint64_t v18 = 0LL;
                  }

                  else
                  {
                    unint64_t v19 = a6 >> 4;
                    size_t v20 = 80 * v23;
                    while (1)
                    {
                      memcpy(v17, v14, v20);
                      if (cccmac_update()
                        || cccmac_update()
                        || cccmac_final_generate())
                      {
                        break;
                      }

                      ++v24;
                      a5 += 16LL;
                      if (v24 > v19) {
                        goto LABEL_15;
                      }
                    }

                    uint64_t v18 = 0xFFFFFFFFLL;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  cc_clear();
  cc_clear();
  return v18;
}

uint64_t ANS_AKDF2_construct_fixed_data(void *a1, uint64_t a2, char *__s, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 == 8 && __s && a1 && a4 == 15)
  {
    memset_s(__s, 0xFuLL, 0, 0xFuLL);
    uint64_t v7 = 0LL;
    strcpy(__s, "ANS2");
    *(void *)(__s + 5) = *a1;
    *(_WORD *)(__s + 13) = 1;
    for (uint64_t i = 14LL; i != 7; --i)
    {
      char v9 = __s[v7];
      __s[v7] = __s[i];
      __s[i] = v9;
      ++v7;
    }

    return 0LL;
  }

  return result;
}

uint64_t MKBBackupDecryptInPlace(uint64_t a1, const char *a2, off_t a3, CFDataRef theData)
{
  return __MKBBackupDecryptInPlace(0LL, *(unsigned int *)(a1 + 16), a2, a3, theData);
}

uint64_t __MKBBackupDecryptInPlace(uint64_t a1, uint64_t a2, const char *a3, off_t a4, CFDataRef theData)
{
  uint64_t v178 = *MEMORY[0x1895F89C0];
  BytePtr = CFDataGetBytePtr(theData);
  unint64_t Length = CFDataGetLength(theData);
  __int128 data = 0u;
  __int128 v177 = 0u;
  size_t v163 = 32LL;
  __int128 v175 = 0u;
  __int128 v173 = 0u;
  __int128 v174 = 0u;
  __int128 v172 = 0u;
  uint64_t v162 = ccaes_xts_decrypt_mode();
  uint64_t v12 = MEMORY[0x1895F8858](v162);
  uint64_t v14 = (char *)&v143 - v13;
  MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v143 - v15;
  uint64_t v170 = 0LL;
  uint64_t v171 = 0LL;
  int v23 = _MKBBackupCheckKey((uint64_t)BytePtr, Length, v17, v18, v19, v20, v21, v22);
  uint64_t v30 = bswap32(*((_DWORD *)BytePtr + 8));
  if (v23)
  {
    debuglog( "__MKBBackupDecryptInPlace",  @"corrupt key; blob size %lu, key size %u",
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      Length);
    return 0xFFFFFFFFLL;
  }

  uint64_t v157 = BytePtr;
  uint64_t v152 = a1;
  uint64_t v150 = a2;
  unint64_t v32 = v30 + 36;
  uint64_t v33 = "false";
  unint64_t v153 = v32;
  if (Length > v32) {
    uint64_t v33 = "true";
  }
  debuglog("__MKBBackupDecryptInPlace", @"extents = %s", v24, v25, v26, v27, v28, v29, (char)v33);
  int v34 = open(a3, 2);
  if (v34 == -1)
  {
    uint64_t v114 = __error();
    strerror(*v114);
    debuglog("__MKBBackupDecryptInPlace", @"open(%s) failed: %s", v115, v116, v117, v118, v119, v120, (char)a3);
    uint64_t v42 = 0LL;
LABEL_95:
    uint64_t v31 = 0xFFFFFFFFLL;
    goto LABEL_81;
  }

  off_t v154 = a4;
  vm_address_t page_aligned_buffer = allocate_page_aligned_buffer(0x8000uLL);
  uint64_t v42 = page_aligned_buffer;
  if (!page_aligned_buffer)
  {
    debuglog( "__MKBBackupDecryptInPlace",  @"Failed to initialize crypto_buffer",  v36,  v37,  v38,  v39,  v40,  v41,  (char)v143);
    goto LABEL_95;
  }

  uint64_t v161 = v16;
  uint64_t v148 = &v157[Length];
  if (&v157[Length] <= v157) {
    goto LABEL_77;
  }
  off_t v43 = 0LL;
  int v44 = 0;
  v143 = &v177;
  int v149 = 1;
  v160 = v14;
  id v147 = &v143;
  int v156 = v34;
  vm_address_t v146 = page_aligned_buffer;
  uint64_t v144 = a3;
  unint64_t v155 = Length;
  while (2)
  {
    uint64_t v45 = v157;
    unsigned int v46 = *((_DWORD *)v157 + 8);
    uint64_t v151 = bswap32(v46);
    unsigned int v159 = v46;
    if (v46)
    {
      uint64_t v47 = v42;
      unsigned int v48 = *((_DWORD *)v157 + 6);
      unsigned int v49 = bswap32(v48);
      debuglog("__MKBBackupDecryptInPlace", @"key class %d", v36, v37, v38, v39, v40, v41, v49);
      char v50 = (char)v45;
      if (*((_DWORD *)v45 + 7) == 0x1000000)
      {
        int v51 = 0;
      }

      else if (v45[28] == 1)
      {
        int v51 = v45[29];
      }

      else
      {
        int v51 = v45[28];
      }

      if ((v149 & 1) != 0)
      {
        unsigned int v53 = v48 == 285212672 ? 7 : v49;
        uint64_t v54 = v53 == 1 ? 2LL : v53;
        if (fcntl(v34, 64, v54))
        {
          uint64_t v121 = __error();
          strerror(*v121);
          debuglog( "__MKBBackupDecryptInPlace",  @"Can't set key class to %d: %s",  v122,  v123,  v124,  v125,  v126,  v127,  v54);
          uint64_t v31 = 0xFFFFFFFFLL;
          uint64_t v42 = v47;
          goto LABEL_81;
        }
      }

      char v55 = v50 + 36;
      if ((_DWORD)v150 == -1)
      {
        uint64_t v42 = v47;
        if (aks_backup_unwrap_key())
        {
          debuglog( "__MKBBackupDecryptInPlace",  @"Failed to unwrap key (%p,%d) in class %d with keypair: 0x%08x",  v57,  v58,  v59,  v60,  v61,  v62,  v55);
          goto LABEL_99;
        }
      }

      else
      {
        LODWORD(md) = v163;
        int v56 = aks_unwrap_key();
        size_t v163 = (int)md;
        uint64_t v42 = v47;
        if (v56)
        {
          debuglog( "__MKBBackupDecryptInPlace",  @"Failed to unwrap key (%p,%d) in class %d with handle %d: 0x%08x",  v57,  v58,  v59,  v60,  v61,  v62,  v55);
LABEL_99:
          uint64_t v31 = 0xFFFFFFFFLL;
          goto LABEL_81;
        }
      }

      if (v51 != 2)
      {
        uint64_t v63 = v160;
        if (v51 == 1)
        {
          debuglog("__MKBBackupDecryptInPlace", @"xts mode", v57, v58, v59, v60, v61, v62, (char)v143);
          (*(void (**)(uint64_t, char *, uint64_t, __int128 *, __int128 *))(v162 + 24))( v162,  v63,  16LL,  &data,  v143);
          int v149 = 0;
          int v44 = 1;
        }

        else
        {
          if (v51)
          {
            debuglog( "__MKBBackupDecryptInPlace",  @"error: unexpected encryption mode : %d",  v57,  v58,  v59,  v60,  v61,  v62,  v51);
            goto LABEL_87;
          }

          debuglog("__MKBBackupDecryptInPlace", @"cbc mode", v57, v58, v59, v60, v61, v62, (char)v143);
          int v44 = 0;
          int v149 = 0;
        }

        goto LABEL_38;
      }

      unint64_t dataIn = 0LL;
      iv[0] = 0x100000000000000LL;
      *(void *)((char *)&md + 7) = 0LL;
      *(void *)&__int128 md = 0LL;
      debuglog("__MKBBackupDecryptInPlace", @"xts ans kdf2 mode", v57, v58, v59, v60, v61, v62, (char)v143);
      int v64 = ANS_AKDF2_construct_fixed_data(&dataIn, 8LL, (char *)&md, 15LL);
      uint64_t v71 = v160;
      if (v64)
      {
        char v128 = @"Failed to construct tweak key fixed data";
      }

      else if (ANS_AKDF2((uint64_t)&data, v163, (uint64_t)&md, 15LL, (uint64_t)&v172, 0x20uLL))
      {
        char v128 = @"Failed to construct tweak key";
      }

      else if (ANS_AKDF2_construct_fixed_data(iv, 8LL, (char *)&md, 15LL))
      {
        char v128 = @"Failed to construct data key fixed data";
      }

      else
      {
        if (!ANS_AKDF2((uint64_t)&data, v163, (uint64_t)&md, 15LL, (uint64_t)&v174, 0x20uLL))
        {
          (*(void (**)(uint64_t, char *, uint64_t, __int128 *, __int128 *))(v162 + 24))( v162,  v71,  32LL,  &v174,  &v172);
          int v149 = 0;
          int v44 = 2;
LABEL_38:
          uint64_t v52 = (char *)v42;
          goto LABEL_39;
        }

        char v128 = @"Failed to construct data key";
      }

      debuglog("__MKBBackupDecryptInPlace", v128, v65, v66, v67, v68, v69, v70, (char)v143);
      goto LABEL_87;
    }

    uint64_t v52 = 0LL;
LABEL_39:
    if (Length <= v153)
    {
      unint64_t v72 = -1LL;
    }

    else
    {
      unint64_t v72 = bswap64(*(void *)&v157[v151 + 36]);
      debuglog("__MKBBackupDecryptInPlace", @"extent = %llu bytes", v36, v37, v38, v39, v40, v41, v72);
    }

    if (!v159)
    {
      if ((uint64_t)(v72 + v43) <= v154)
      {
        *(void *)&__int128 md = 0LL;
        *((void *)&md + 1) = v43;
        unint64_t v169 = v72;
        if (fcntl(v34, 99, &md))
        {
          uint64_t v136 = __error();
          strerror(*v136);
          debuglog( "__MKBBackupDecryptInPlace",  @"F_PUNCHHOLE failed on %s for range (%lld:%llu): %s",  v137,  v138,  v139,  v140,  v141,  v142,  (char)v144);
LABEL_106:
          uint64_t v31 = 0xFFFFFFFFLL;
LABEL_80:
          uint64_t v42 = v146;
          goto LABEL_81;
        }
      }

      else if (ftruncate(v34, v43))
      {
        id v129 = __error();
        strerror(*v129);
        debuglog( "__MKBBackupDecryptInPlace",  @"Failed to shrink %s to %lld: %s",  v130,  v131,  v132,  v133,  v134,  v135,  (char)v144);
        goto LABEL_106;
      }
    }

    int v145 = v44;
    unsigned int v73 = v44 - 1;
    do
    {
      if (v72 >= 0x8000) {
        ssize_t v74 = 0x8000LL;
      }
      else {
        ssize_t v74 = v72;
      }
      if (v159)
      {
        ssize_t v75 = pread(v34, v52, v74, v43);
        debuglog( "__MKBBackupDecryptInPlace",  @"nbytes = %zd, bytes_read = %zd",  v76,  v77,  v78,  v79,  v80,  v81,  v74);
        if (!v75) {
          break;
        }
        if (v75 <= 0)
        {
          uint64_t v107 = __error();
          strerror(*v107);
          debuglog( "__MKBBackupDecryptInPlace",  @"Failed to pread(%zu, %llu) from %s (%s)",  v108,  v109,  v110,  v111,  v112,  v113,  v74);
          goto LABEL_92;
        }

        if ((v75 & 0xF) != 0)
        {
          debuglog( "__MKBBackupDecryptInPlace",  @"bytes_read(%zd) not multiple of encryption block size",  v36,  v37,  v38,  v39,  v40,  v41,  v75);
          goto LABEL_92;
        }

        unint64_t v158 = v72;
        if (((v75 + 4095) & 0xFFFFFFFF000LL) != 0)
        {
          int v82 = 0;
          uint64_t v83 = v43 >> 12;
          for (uint64_t i = ((unint64_t)(v75 + 4095) >> 12); i; --i)
          {
            if (v73 > 1)
            {
              CC_SHA1(&data, v163, (unsigned __int8 *)&md);
              unsigned int v90 = ((v43 + v82) >> 1) ^ 0x80000061;
              if ((v43 & 1) == 0) {
                unsigned int v90 = (v43 + v82) >> 1;
              }
              unsigned int v91 = v90 >> 1;
              if ((v90 & 1) != 0) {
                unsigned int v91 = (v90 >> 1) ^ 0x80000061;
              }
              unint64_t dataIn = __PAIR64__(v91, v90);
              unsigned int v92 = v91 >> 1;
              if ((v91 & 1) != 0) {
                unsigned int v92 = (v91 >> 1) ^ 0x80000061;
              }
              unsigned int v93 = v92 >> 1;
              if ((v92 & 1) != 0) {
                unsigned int v93 = (v92 >> 1) ^ 0x80000061;
              }
              unsigned int v166 = v92;
              unsigned int v167 = v93;
              if (CCCrypt(0, 0, 0, &md, 0x10uLL, 0LL, &dataIn, 0x10uLL, iv, 0x10uLL, 0LL)
                || CCCrypt(1u, 0, 0, &data, v163, iv, &v52[v82], 0x1000uLL, &v52[v82], 0x1000uLL, 0LL))
              {
                uint64_t v31 = 0xFFFFFFFFLL;
                int v34 = v156;
                goto LABEL_80;
              }
            }

            else
            {
              uint64_t v170 = v83;
              uint64_t v171 = v83;
              uint64_t v85 = v162;
              uint64_t v86 = v160;
              off_t v87 = v43;
              uint64_t v88 = v161;
              (*(void (**)(char *, char *, uint64_t *))(v162 + 40))(v160, v161, &v170);
              char v89 = v88;
              off_t v43 = v87;
              (*(void (**)(char *, char *, uint64_t, char *, char *))(v85 + 48))( v86,  v89,  256LL,  &v52[v82 & 0xFFFFF000],  &v52[v82 & 0xFFFFF000]);
            }

            v82 += 4096;
            ++v83;
          }
        }

        int v34 = v156;
        ssize_t v74 = pwrite(v156, v52, v75, v43);
        unint64_t Length = v155;
        unint64_t v72 = v158;
      }

      else
      {
        ssize_t v75 = v74;
      }

      if (v74 <= 0)
      {
        debuglog( "__MKBBackupDecryptInPlace",  @"Failed to pwrite(%lu, %llu) from %s",  v36,  v37,  v38,  v39,  v40,  v41,  0);
LABEL_92:
        uint64_t v31 = 0xFFFFFFFFLL;
        goto LABEL_80;
      }

      if (v75 != v74)
      {
        debuglog( "__MKBBackupDecryptInPlace",  @"bytes_read(%lu) != bytes_written(%lu)",  v36,  v37,  v38,  v39,  v40,  v41,  v75);
        goto LABEL_92;
      }

      v43 += v75;
      if (v75 < 1) {
        break;
      }
      v72 -= v75;
    }

    while (v72);
    v157 += v151 + 44;
    uint64_t v42 = v146;
    LOBYTE(a3) = (_BYTE)v144;
    int v44 = v145;
    if (v148 > v157) {
      continue;
    }
    break;
  }

LABEL_77:
  if (!ftruncate(v34, v154))
  {
    uint64_t v31 = 0LL;
    goto LABEL_81;
  }

  debuglog("__MKBBackupDecryptInPlace", @"Failed to truncate %s to %lld", v94, v95, v96, v97, v98, v99, (char)a3);
LABEL_87:
  uint64_t v31 = 0xFFFFFFFFLL;
LABEL_81:
  __memset_chk();
  __int128 v173 = 0u;
  __int128 v174 = 0u;
  __int128 v175 = 0u;
  __int128 v172 = 0u;
  cc_clear();
  cc_clear();
  cc_clear();
  if (v42) {
    deallocate_page_aligned_buffer(v42, 0x8000LL, v100, v101, v102, v103, v104, v105, (char)v143);
  }
  if (v34 != -1) {
    close(v34);
  }
  return v31;
}

uint64_t MKBOTABackupBagOpen(const __CFData *a1, const __CFData *a2, void *a3)
{
  uint64_t v6 = calloc(1uLL, 0x44uLL);
  if (v6)
  {
    uint64_t v13 = v6;
    _DWORD *v6 = -1;
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    if (a2)
    {
      CFDataGetBytePtr(a2);
      CFDataGetLength(a2);
    }

    if (!aks_backup_unwrap_bag())
    {
      debuglog("MKBOTABackupBagOpen", @"Unwrapped userland backup bag", v14, v15, v16, v17, v18, v19, v35);
LABEL_10:
      uint64_t result = 0LL;
      *a3 = v13;
      return result;
    }

    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    int bag = aks_load_bag();
    if (bag)
    {
      debuglog( "MKBOTABackupBagOpen",  @"Failed to load in-kernel backup bag: 0x%08x",  v21,  v22,  v23,  v24,  v25,  v26,  bag);
    }

    else
    {
      if (a2)
      {
        CFDataGetBytePtr(a2);
        CFDataGetLength(a2);
      }

      int v27 = aks_unlock_bag();
      if (!v27) {
        goto LABEL_10;
      }
      debuglog( "MKBOTABackupBagOpen",  @"Failed to unlock in-kernel backup bag: 0x%08x",  v28,  v29,  v30,  v31,  v32,  v33,  v27);
    }

    if (*v13 != -1) {
      aks_unload_bag();
    }
    free(v13);
  }

  else
  {
    debuglog("MKBOTABackupBagOpen", @"failed to allocate backup bag handle", v7, v8, v9, v10, v11, v12, v35);
  }

  return 0xFFFFFFFFLL;
}

uint64_t MKBOTABackupBagClose(char *a1)
{
  if (*(_DWORD *)a1 != -1) {
    aks_unload_bag();
  }
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 4) = 0u;
  free(a1);
  return 0LL;
}

uint64_t MKBOTABackupBagCopyUUID(uint64_t a1, CFDataRef *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (*(_DWORD *)a1 == -1)
  {
    CFDataRef v12 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)(a1 + 36), 16LL);
    uint64_t v11 = 0LL;
LABEL_6:
    *a2 = v12;
    return v11;
  }

  uint64_t bag_uuid = aks_get_bag_uuid();
  uint64_t v11 = convertAKSErrorToMKB(bag_uuid);
  if (!(_DWORD)v11)
  {
    CFDataRef v12 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 16LL);
    goto LABEL_6;
  }

  debuglog("MKBOTABackupBagCopyUUID", @"failed to get uuid for handle %d", v5, v6, v7, v8, v9, v10, *(_DWORD *)a1);
  return v11;
}

uint64_t MKBOTABackupBagIsKernel(_DWORD *a1, BOOL *a2)
{
  *a2 = *a1 != -1;
  return 0LL;
}

uint64_t MKBOTABackupDecryptInPlace(unsigned int *a1, const char *a2, off_t a3, CFDataRef theData)
{
  return __MKBBackupDecryptInPlace((uint64_t)(a1 + 1), *a1, a2, a3, theData);
}

uint64_t MKBKeyBagChangeSystemSecretWithEscrow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 ChangeSystemSecretWithEscrow:a1 FromOldPasscode:a2 ToNew:a3 withOpaqueDats:a5 withKeepState:a4];

  return v11;
}

uint64_t MKBOTABackupStart()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 startBackupSessionForVolume:0];

  return v1;
}

uint64_t MKBOTABackupStop()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stopBackupSessionForVolume:0];

  return v1;
}

uint64_t MKBOTABackupStartForVolume(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 startBackupSessionForVolume:a1];

  return v3;
}

uint64_t MKBOTABackupStopForVolume(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 stopBackupSessionForVolume:a1];

  return v3;
}

uint64_t MKBKeyBagChangeSystemGeneration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 changeClassKeysGenerationWithSecret:a1 withGenerationOption:a2];

  return v5;
}

uint64_t MKBKeyBagGetSystemGeneration()
{
  else {
    return 0LL;
  }
}

uint64_t MKBKeyBagIsKeyRolling(_DWORD *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 isKeyRollingWithKeyStatus:&v5];

  if (a1 && !(_DWORD)v3) {
    *a1 = v5;
  }
  return v3;
}

uint64_t MKBKeyBagMigrateFS()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 migrateFS];

  return v1;
}

uint64_t MKBPrewarmSPS( char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = aks_prewarm_sps();
  if ((_DWORD)result)
  {
    debuglog("MKBPrewarmSPS", @"Error prewarming SPSs: %d", v9, v10, v11, v12, v13, v14, result);
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t MKBForgottenPasscodeEvent()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 forgottenPasscodeEvent];

  return v1;
}

void __handleToUse_block_invoke()
{
  int hostmultiuserconfig = get_hostmultiuserconfig(&v8);
  if (hostmultiuserconfig)
  {
    debuglog( "handleToUse_block_invoke",  @"failed to determine whether we are multi-user: 0x%x",  v1,  v2,  v3,  v4,  v5,  v6,  hostmultiuserconfig);
  }

  else if ((v8 & 0x80000000) != 0)
  {
    handleToUse_handle = -3;
    uint32_t v7 = v8 & 0x3FFFFFFF;
  }

  else
  {
    handleToUse_handle = 0;
  }

void __MKBAssertionFinalize( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    int v9 = *(_DWORD *)(a1 + 24);
  }
  else {
    LOBYTE(v9) = -1;
  }
  debuglog( "__MKBAssertionFinalize",  @"dropping lock assertion for: handle:%d, type:%d, status:%d",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
  if (*(_DWORD *)(a1 + 20))
  {
  }

__CFString *__MKBAssertionCopyDescription(unsigned int *a1)
{
  uint64_t v2 = CFGetAllocator(a1);
  uint64_t v3 = v2;
  uint64_t v4 = a1[4];
  else {
    uint64_t v5 = @"Other";
  }
  CFMutableDataRef Mutable = CFStringCreateMutable(v2, 0LL);
  uint64_t v7 = a1[4];
  CFIndex v8 = CFGetRetainCount(a1);
  CFStringAppendFormat( Mutable,  0LL,  @"<MKBAssertion %p [%p]> { AssertionType '%@' (%d), Assertion Retain: (%d)",  a1,  v3,  v5,  v7,  v8);
  CFStringAppendFormat(Mutable, 0LL, @"}");
  return Mutable;
}

uint64_t __MKBKeyBagHandleFinalize(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    aks_prederived_free();
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = aks_unload_bag();
    *(_DWORD *)(a1 + 16) = -1;
  }

  return result;
}

id ObjectOrNull(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }

  else
  {
    [MEMORY[0x189603FE8] null];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v4 = v3;

  return v4;
}

uint64_t KBPostAggdScalar(uint64_t a1, int a2, unsigned int a3)
{
  if (MEMORY[0x18960CE28]) {
    BOOL v3 = MEMORY[0x18960CE60] == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || a1 == 0) {
    return 0xFFFFFFFFLL;
  }
  if (a3 && arc4random() % a3) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    ADClientSetValueForScalarKey();
  }
  else {
    ADClientAddValueForScalarKey();
  }
  return 0LL;
}

uint64_t KBPostAggdDistribution(uint64_t a1, int a2, unsigned int a3)
{
  if (MEMORY[0x18960CE48]) {
    BOOL v3 = MEMORY[0x18960CE50] == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || a1 == 0) {
    return 0xFFFFFFFFLL;
  }
  if (a3 && arc4random() % a3) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    ADClientSetValueForDistributionKey();
  }
  else {
    ADClientPushValueForDistributionKey();
  }
  return 0LL;
}

uint64_t analytics_persist_event(CFStringRef theString1, unsigned int a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (!theString1 || a2 && arc4random() % a2) {
    return 0xFFFFFFFFLL;
  }
  int id = analytics_persistance_report_get_id(theString1);
  uint64_t v79 = id;
  if (id == -1)
  {
    unsigned int v73 = @"unsupported key";
LABEL_32:
    debuglog("analytics_persist_event", v73, v5, v6, v7, v8, v9, v10, v77);
    return 0xFFFFFFFFLL;
  }

  CFMutableDataRef Mutable = CopyPersistedReports();
  if (!Mutable)
  {
    CFMutableDataRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    if (!Mutable)
    {
      unsigned int v73 = @"Can't create dict";
      goto LABEL_32;
    }
  }

  Value = (const __CFArray *)CFDictionaryGetValue(Mutable, @"DATA");
  if (Value)
  {
    uint64_t v13 = Value;
    CFTypeID v14 = CFGetTypeID(Value);
    if (v14 != CFArrayGetTypeID())
    {
      ssize_t v74 = @"wrong type";
      goto LABEL_45;
    }

    uint64_t v21 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v13);
  }

  else
  {
    uint64_t v21 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableArrayRef MutableCopy = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  }

  uint64_t v23 = MutableCopy;
  if (!MutableCopy)
  {
    ssize_t v74 = @"unable to allocate array";
LABEL_45:
    debuglog("analytics_persist_event", v74, v15, v16, v17, v18, v19, v20, v77);
    ssize_t v75 = Mutable;
    goto LABEL_46;
  }

  CFNumberRef v24 = CFNumberCreate(v21, kCFNumberSInt64Type, &valuePtr);
  if (!v24)
  {
    debuglog("analytics_persist_event", @"unable to allocate", v25, v26, v27, v28, v29, v30, v77);
    CFRelease(Mutable);
    ssize_t v75 = v23;
LABEL_46:
    CFRelease(v75);
    return 0xFFFFFFFFLL;
  }

  CFNumberRef v31 = v24;
  CFNumberRef v38 = CFNumberCreate(v21, kCFNumberSInt64Type, &v79);
  if (v38)
  {
    uint64_t v39 = CFArrayCreateMutable(v21, 0LL, MEMORY[0x189605228]);
    uint64_t v40 = v39;
    if (v39)
    {
      CFArrayAppendValue(v39, v38);
      CFArrayAppendValue(v40, v31);
      CFArrayAppendValue(v23, v40);
      if (CFArrayGetCount(v23) >= 6)
      {
        debuglog( "analytics_persist_event",  @"at capacity, discarding oldest data entry",  v41,  v42,  v43,  v44,  v45,  v46,  v77);
        CFArrayRemoveValueAtIndex(v23, 0LL);
      }

      CFDictionarySetValue(Mutable, @"DATA", v23);
      int v78 = 0;
      CFNumberRef v47 = CFNumberCreate(v21, kCFNumberSInt32Type, &v78);
      if (v47)
      {
        CFNumberRef v48 = v47;
        CFDictionarySetValue(Mutable, @"VERS", v47);
        io_registry_entry_t v49 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/options");
        CFTypeRef v50 = convertObjectToBinary(Mutable);
        if (v50)
        {
          uint64_t v57 = v50;
          if (IORegistryEntrySetCFProperty(v49, @"mkb-reports", v50))
          {
            debuglog("SetPersistedReports", @"cant set", v58, v59, v60, v61, v62, v63, v77);
            int v64 = -1;
          }

          else
          {
            int v64 = 0;
          }

          CFRelease(v57);
          if (!v49) {
            goto LABEL_23;
          }
        }

        else
        {
          debuglog("SetPersistedReports", @"Can't serialize dictionary", v51, v52, v53, v54, v55, v56, v77);
          int v64 = -1;
          if (!v49) {
            goto LABEL_23;
          }
        }

        IOObjectRelease(v49);
LABEL_23:
        if (v64)
        {
          debuglog("analytics_persist_event", @"failed to persist dict", v65, v66, v67, v68, v69, v70, v77);
          uint64_t v71 = 0xFFFFFFFFLL;
        }

        else
        {
          uint64_t v71 = 0LL;
        }

        CFRelease(v48);
        CFRelease(Mutable);
        CFRelease(v31);
        goto LABEL_26;
      }

      uint64_t v76 = @"cant allocate mem";
    }

    else
    {
      uint64_t v76 = @"cant allocate";
    }
  }

  else
  {
    uint64_t v40 = 0LL;
    uint64_t v76 = @"unable to allocate";
  }

  debuglog("analytics_persist_event", v76, v32, v33, v34, v35, v36, v37, v77);
  CFRelease(Mutable);
  CFRelease(v31);
  uint64_t v71 = 0xFFFFFFFFLL;
  if (v38) {
LABEL_26:
  }
    CFRelease(v38);
  CFRelease(v23);
  if (v40) {
    CFRelease(v40);
  }
  return v71;
}

uint64_t analytics_persistance_report_get_id(CFStringRef theString1)
{
  if (!theString1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = 0LL;
  for (uint64_t i = (CFStringRef *)persisted_keys_table; !*i || CFStringCompare(theString1, *i, 1uLL); i += 2)
  {
    if (++v2 == 4) {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

CFDictionaryRef CopyPersistedReports()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/options");
  if (!v0) {
    return 0LL;
  }
  io_object_t v1 = v0;
  CFTypeRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( v0,  @"mkb-reports",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (!CFProperty)
  {
    IOObjectRelease(v1);
    return 0LL;
  }

  BOOL v3 = CFProperty;
  BytePtr = (UInt8 *)CFDataGetBytePtr(CFProperty);
  CFIndex Length = CFDataGetLength(v3);
  binary_dict_from_buffer = (const __CFDictionary *)load_binary_dict_from_buffer(BytePtr, Length);
  uint64_t v7 = binary_dict_from_buffer;
  if (!binary_dict_from_buffer) {
    goto LABEL_24;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue(binary_dict_from_buffer, @"VERS");
  if (!Value)
  {
    uint64_t v28 = @"no version";
LABEL_22:
    debuglog("analytics_persistance_validate_dict", v28, v9, v10, v11, v12, v13, v14, v36);
LABEL_23:
    CFRelease(v7);
    debuglog("CopyPersistedReports", @"invalid dict", v29, v30, v31, v32, v33, v34, v37);
    uint64_t v7 = 0LL;
    goto LABEL_24;
  }

  uint64_t v15 = Value;
  CFTypeID v16 = CFGetTypeID(Value);
  if (v16 != CFNumberGetTypeID())
  {
    uint64_t v28 = @"version is of wrong type";
    goto LABEL_22;
  }

  if (!CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
  {
    uint64_t v28 = @"invalid version format";
    goto LABEL_22;
  }

  if (valuePtr)
  {
    debuglog( "analytics_persistance_validate_dict",  @"non-current version %d",  v9,  v10,  v11,  v12,  v13,  v14,  valuePtr);
    goto LABEL_23;
  }

  uint64_t v17 = (const __CFArray *)CFDictionaryGetValue(v7, @"DATA");
  if (!v17)
  {
    uint64_t v28 = @"no data";
    goto LABEL_22;
  }

  uint64_t v18 = v17;
  CFTypeID v19 = CFGetTypeID(v17);
  if (v19 != CFArrayGetTypeID())
  {
    uint64_t v28 = @"data is of wrong type";
    goto LABEL_22;
  }

  if (CFArrayGetCount(v18) > 5)
  {
    uint64_t v28 = @"too many entries";
    goto LABEL_22;
  }

  if (CFArrayGetCount(v18) >= 1)
  {
    CFIndex v20 = 0LL;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v18, v20);
      CFTypeID v22 = CFGetTypeID(ValueAtIndex);
      if (v22 == CFArrayGetTypeID())
      {
        if (CFArrayGetCount((CFArrayRef)ValueAtIndex) == 2)
        {
          CFIndex v23 = 0LL;
          char v24 = 1;
          do
          {
            char v25 = v24;
            uint64_t v26 = CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v23);
            if (!v26 || (CFTypeID v27 = CFGetTypeID(v26), v27 != CFNumberGetTypeID()))
            {
              char v36 = v23;
              uint64_t v28 = @"sub%d is of wrong type";
              goto LABEL_22;
            }

            char v24 = 0;
            CFIndex v23 = 1LL;
          }

          while ((v25 & 1) != 0);
          if (CFArrayGetCount(v18) > ++v20) {
            continue;
          }
          break;
        }

        uint64_t v28 = @"sub has unexpected number of data";
      }

      else
      {
        uint64_t v28 = @"sub is of wrong type";
      }

      goto LABEL_22;
    }
  }

LABEL_24:
  IOObjectRelease(v1);
  CFRelease(v3);
  return v7;
}

uint64_t analytics_iterate_persisted_eventsWithBlock(uint64_t a1)
{
  unint64_t v20 = 0LL;
  uint64_t valuePtr = 0LL;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = CopyPersistedReports();
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  BOOL v3 = v2;
  Value = (const __CFArray *)CFDictionaryGetValue(v2, @"DATA");
  if (Value)
  {
    uint64_t v11 = Value;
    if (CFArrayGetCount(Value) >= 1)
    {
      CFIndex v12 = 0LL;
      do
      {
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v11, v12);
        uint64_t v14 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0LL);
        CFNumberGetValue(v14, kCFNumberSInt64Type, &v20);
        uint64_t v15 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 1LL);
        CFNumberGetValue(v15, kCFNumberSInt64Type, &valuePtr);
        if (v20 <= 0xFFFFFFFE && (v20 & 0xFFFFFFFC) == 0)
        {
          uint64_t v17 = persisted_keys_table[2 * v20];
          if (v17) {
            (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t))(a1 + 16))(a1, v17, 1LL, 0LL, valuePtr);
          }
        }

        ++v12;
      }

      while (CFArrayGetCount(v11) > v12);
    }

    uint64_t v18 = 0LL;
  }

  else
  {
    debuglog("analytics_iterate_persisted_eventsWithBlock", @"no data", v5, v6, v7, v8, v9, v10, v20);
    uint64_t v18 = 0xFFFFFFFFLL;
  }

  CFRelease(v3);
  return v18;
}

uint64_t analytics_submit_persisted_eventsWithBlock(uint64_t a1)
{
  kern_return_t v8;
  char v10;
  io_registry_entry_t v1 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/options");
  uint64_t v8 = IORegistryEntrySetCFProperty(v1, @"IONVRAM-DELETE-PROPERTY", @"mkb-reports");
  if (v8)
  {
    debuglog("DeletePersistedReports", @"cant delete", v2, v3, v4, v5, v6, v7, v10);
    if (!v1) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  if (v1) {
LABEL_4:
  }
    IOObjectRelease(v1);
LABEL_5:
  if (!v8) {
    return 0LL;
  }
  debuglog("analytics_submit_persisted_eventsWithBlock", @"cant delete", v2, v3, v4, v5, v6, v7, v10);
  return 0xFFFFFFFFLL;
}

uint64_t analytics_is_event_persisted( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a1;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  char v15 = 0;
  if (a1)
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 0x40000000LL;
    v11[2] = __analytics_is_event_persisted_block_invoke;
    v11[3] = &unk_189D6A7B0;
    v11[4] = &v12;
    v11[5] = a1;
    analytics_iterate_persisted_eventsWithBlock((uint64_t)v11);
  }

  debuglog("analytics_is_event_persisted", @"event %@ is already persisted: %d", a3, a4, a5, a6, a7, a8, v8);
  uint64_t v9 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __analytics_is_event_persisted_block_invoke(uint64_t a1, const void *a2)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), a2)) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
  return 0LL;
}

uint64_t analytics_submit_persisted_events()
{
  return analytics_submit_persisted_eventsWithBlock((uint64_t)&__block_literal_global_0);
}

uint64_t __analytics_submit_persisted_events_block_invoke( int a1, CFStringRef theString, int a3, uint64_t a4, uint64_t a5)
{
  char CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  debuglog( "analytics_submit_persisted_events_block_invoke",  @"persisted-report-submit %s:%llx",  v9,  v10,  v11,  v12,  v13,  v14,  CStringPtr);
  unsigned int id = analytics_persistance_report_get_id(theString);
  if (id <= 3) {
    ((void (*)(uint64_t))persisted_keys_table[2 * id + 1])(a5);
  }
  return KBPostAggdScalar((uint64_t)theString, a3, 0);
}

uint64_t analytics_persistance_test()
{
  uint64_t v15 = 0LL;
  CFTypeID v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  int v18 = 0;
  if (geteuid())
  {
    uint64_t v10 = @"must be privileged";
    goto LABEL_18;
  }

  if (analytics_persist_event(@"com.apple.mobile.keybagd.seshat.report", 0, 0LL)
    || analytics_persist_event(@"com.apple.mobile.keybagd.seshat.recovery_required", 0, 0LL))
  {
    uint64_t v10 = @"post failed";
LABEL_18:
    debuglog("analytics_persistance_test", v10, v0, v1, v2, v3, v4, v5, v11);
LABEL_19:
    uint64_t v8 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }

  if (!analytics_persist_event(@"example.that.doesnt.exist", 0, 0LL))
  {
    uint64_t v10 = @"post succeeded unexpectedly";
    goto LABEL_18;
  }

  uint64_t v6 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 0x40000000LL;
  v14[2] = __analytics_persistance_test_block_invoke;
  v14[3] = &unk_189D6A818;
  v14[4] = &v15;
  if (analytics_submit_persisted_eventsWithBlock((uint64_t)v14))
  {
    uint64_t v10 = @"submission failed";
    goto LABEL_18;
  }

  if (*((_DWORD *)v16 + 6) != 2) {
    goto LABEL_19;
  }
  *((_DWORD *)v16 + 6) = 0;
  v13[0] = v6;
  v13[1] = 0x40000000LL;
  v13[2] = __analytics_persistance_test_block_invoke_2;
  v13[3] = &unk_189D6A840;
  _OWORD v13[4] = &v15;
  analytics_submit_persisted_eventsWithBlock((uint64_t)v13);
  if (*((_DWORD *)v16 + 6)) {
    goto LABEL_19;
  }
  uint64_t v7 = 0LL;
  *((_DWORD *)v16 + 6) = 0;
  do
    analytics_persist_event(@"com.apple.mobile.keybagd.seshat.report", 0, v7++);
  while (v7 != 10);
  analytics_iterate_persisted_eventsWithBlock((uint64_t)&__block_literal_global_48);
  v12[0] = v6;
  v12[1] = 0x40000000LL;
  v12[2] = __analytics_persistance_test_block_invoke_4;
  v12[3] = &unk_189D6A8A8;
  v12[4] = &v15;
  analytics_submit_persisted_eventsWithBlock((uint64_t)v12);
  if (*((_DWORD *)v16 + 6) == 35) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
LABEL_13:
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __analytics_persistance_test_block_invoke(uint64_t a1)
{
  return 0LL;
}

uint64_t __analytics_persistance_test_block_invoke_2(uint64_t a1)
{
  return 0LL;
}

uint64_t __analytics_persistance_test_block_invoke_3()
{
  return 0LL;
}

uint64_t __analytics_persistance_test_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += a5;
  return 0LL;
}

uint64_t MKBUserSessionLoadWithPasscode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v6)
  {
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))dlsym(v6, "UMUserSessionLoadWithPasscode");
    if (v13) {
      return v13(a1, a2, a3);
    }
    uint64_t v15 = @"Failed to find UMUserSessionLoadWithPasscode in UM";
  }

  else
  {
    uint64_t v15 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBUserSessionLoadWithPasscode", v15, v7, v8, v9, v10, v11, v12, v16);
  return 0LL;
}

__CFDictionary *MKBUserTypeDeviceMode(uint64_t a1, CFErrorRef *a2)
{
  uint32_t v22 = 0;
  dict = create_dict();
  int hostmultiuserconfig = get_hostmultiuserconfig(&v22);
  int v11 = hostmultiuserconfig;
  if (hostmultiuserconfig)
  {
    debuglog( "MKBUserTypeDeviceMode",  @"Failed to get multiuser_config flags from kernel with error:%d",  v5,  v6,  v7,  v8,  v9,  v10,  hostmultiuserconfig);
    if (v11 == 2) {
      int v18 = @"FAILED to MKBUserTypeDeviceMode, EPERM";
    }
    else {
      int v18 = @"FAILED to MKBUserTypeDeviceMode, EINVAL";
    }
    if (v11 == 2) {
      CFIndex v19 = 1LL;
    }
    else {
      CFIndex v19 = 22LL;
    }
    debuglog("MKBUserTypeDeviceMode", v18, v12, v13, v14, v15, v16, v17, v21);
  }

  else
  {
    if ((v22 & 0x80000000) != 0)
    {
      CFDictionarySetValue(dict, kMKBDeviceModeKey, kMKBDeviceModeSharedIPad);
      CFDictionarySetValue(dict, kMKBUserTypeKey, kMKBUserTypeEphemeral);
      return dict;
    }

    CFIndex v19 = 0LL;
  }

  CFDictionarySetValue(dict, kMKBDeviceModeKey, kMKBDeviceModeSingleUser);
  CFDictionarySetValue(dict, kMKBUserTypeKey, kMKBUserTypePermanent);
  if (a2 && v11) {
    *a2 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F58], v19, 0LL);
  }
  return dict;
}

uint64_t MKBUserSessionSetSecureBackupBlob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v6)
  {
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))dlsym(v6, "UMUserSessionSetSecureBackupBlob");
    if (v13) {
      return v13(a1, a2, a3);
    }
    uint64_t v15 = @"Failed to find UMUserSessionSetSecureBackupBlob in UM";
  }

  else
  {
    uint64_t v15 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBUserSessionSetSecureBackupBlob", v15, v7, v8, v9, v10, v11, v12, v16);
  return 0LL;
}

uint64_t MKBUserSessionRetrieveSecureBackupBlob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v6)
  {
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))dlsym(v6, "UMUserSessionRetrieveSecureBackupBlob");
    if (v13) {
      return v13(a1, a2, a3);
    }
    uint64_t v15 = @"Failed to find UMUserSessionRetrieveSecureBackupBlob in UM";
  }

  else
  {
    uint64_t v15 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBUserSessionRetrieveSecureBackupBlob", v15, v7, v8, v9, v10, v11, v12, v16);
  return 0LL;
}

uint64_t MKBUserSessionDeleteSecureBackupBlob(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionDeleteSecureBackupBlob");
    if (v11) {
      return v11(a1, a2);
    }
    uint64_t v13 = @"Failed to find UMUserSessionDeleteSecureBackupBlob in UM";
  }

  else
  {
    uint64_t v13 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBUserSessionDeleteSecureBackupBlob", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0LL;
}

BOOL MKBUserSessionIsLoginWindow(uint64_t a1, CFErrorRef *a2)
{
  return MKBForegroundUserSessionID(a2) == 502;
}

uint64_t MKBForegroundUserSessionID(CFErrorRef *a1)
{
  uint32_t v20 = 0;
  int hostmultiuserconfig = get_hostmultiuserconfig(&v20);
  if (hostmultiuserconfig)
  {
    int v9 = hostmultiuserconfig;
    debuglog( "MKBForegroundUserSessionID",  @"Failed to get multiuser_config flags from kernel with error:%d",  v3,  v4,  v5,  v6,  v7,  v8,  hostmultiuserconfig);
    if (v9 == 2) {
      char v16 = @"FAILED to MKBUserTypeDeviceMode, EPERM";
    }
    else {
      char v16 = @"FAILED to MKBUserTypeDeviceMode, EINVAL";
    }
    if (v9 == 2) {
      CFIndex v17 = 1LL;
    }
    else {
      CFIndex v17 = 22LL;
    }
    debuglog("MKBForegroundUserSessionID", v16, v10, v11, v12, v13, v14, v15, v19);
    if (!a1) {
      return 0xFFFFFFFFLL;
    }
LABEL_9:
    *a1 = CFErrorCreate(0LL, (CFErrorDomain)*MEMORY[0x189604F58], v17, 0LL);
    return 0xFFFFFFFFLL;
  }

  if ((v20 & 0x80000000) == 0)
  {
    CFIndex v17 = 2LL;
    if (!a1) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_9;
  }

  return v20 & 0x3FFFFFFF;
}

uint64_t MKBUserSessionIsLoginSession(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionIsLoginSession");
    if (v11) {
      return v11(a1, a2);
    }
    uint64_t v13 = @"Failed to find UMUserSessionIsLoginSession in UM";
  }

  else
  {
    uint64_t v13 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBUserSessionIsLoginSession", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0LL;
}

uint64_t MKBUserSessionConfigureLoginWindow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionConfigureLoginWindow");
    if (v11) {
      return v11(a1, a2);
    }
    uint64_t v13 = @"Failed to find UMUserSessionConfigureLoginWindow in UM";
  }

  else
  {
    uint64_t v13 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBUserSessionConfigureLoginWindow", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0LL;
}

uint64_t MKBUserSessionSwitchToLoginWindow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionSwitchToLoginWindow");
    if (v11) {
      return v11(a1, a2);
    }
    uint64_t v13 = @"Failed to find UMUserSessionSwitchToLoginWindow in UM";
  }

  else
  {
    uint64_t v13 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBUserSessionSwitchToLoginWindow", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0LL;
}

uint64_t MKBForegroundUserSession(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionForegroundSession");
    if (v11) {
      return v11(a1, a2);
    }
    uint64_t v13 = @"Failed to find UMUserSessionForegroundSession in UM";
  }

  else
  {
    uint64_t v13 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBForegroundUserSession", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0LL;
}

uint64_t MKBUserSessionListSyncMachServices(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionListSyncMachServices");
    if (v11) {
      return v11(a1, a2);
    }
    uint64_t v13 = @"Failed to find UMUserSessionListSyncMachServices in UM";
  }

  else
  {
    uint64_t v13 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBUserSessionListSyncMachServices", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0LL;
}

uint64_t MKBCurrentSyncBubbleSessionID(uint64_t a1)
{
  uint64_t v2 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v2)
  {
    uint64_t v9 = (uint64_t (*)(uint64_t))dlsym(v2, "UMCurrentSyncBubbleSessionID");
    if (v9) {
      return v9(a1);
    }
    uint64_t v11 = @"Failed to find UMCurrentSyncBubbleSessionID in UM";
  }

  else
  {
    uint64_t v11 = @"Failed to dlopen UserManagement.framework";
  }

  debuglog("MKBCurrentSyncBubbleSessionID", v11, v3, v4, v5, v6, v7, v8, v12);
  return 0xFFFFFFFFLL;
}

__CFDictionary *MKBUserSessionGetUserLockStateInfo(CFDictionaryRef theDict)
{
  uint64_t Int = theDict;
  v11[8] = *MEMORY[0x1895F89C0];
  if (theDict)
  {
    if (CFDictionaryContainsKey(theDict, kMKBUserSessionIDKey)) {
      uint64_t Int = (const __CFDictionary *)_getInt(Int, kMKBUserSessionIDKey);
    }
    else {
      uint64_t Int = 0LL;
    }
  }

  +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 getLockStateForUser:Int];
  uint64_t v3 = (const void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    return 0LL;
  }
  CFTypeID v4 = CFGetTypeID(v3);
  if (v4 == CFDictionaryGetTypeID())
  {
    dict = create_dict();
    if (dict)
    {
      uint64_t v6 = 0LL;
      v11[0] = @"IsWipePending";
      v11[1] = @"sw";
      v11[2] = @"IsPermanentlyBlocked";
      v11[3] = @"pb";
      v11[4] = @"FailedPasscodeAttempts";
      v11[5] = @"fa";
      void v11[6] = @"TimeUntilUnblockedSinceReferenceDate";
      v11[7] = @"boff";
      do
      {
        uint64_t v7 = (const void *)v11[v6];
        if (CFDictionaryContainsKey((CFDictionaryRef)v3, v7))
        {
          uint64_t v8 = (const void *)v11[v6 + 1];
          Value = CFDictionaryGetValue((CFDictionaryRef)v3, v7);
          CFDictionarySetValue(dict, v8, Value);
        }

        v6 += 2LL;
      }

      while (v6 != 8);
    }
  }

  else
  {
    dict = 0LL;
  }

  CFRelease(v3);
  return dict;
}

uint64_t MKBUserSessionLoadKeybagForUser( const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (!a6)
  {
    +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 loadKeybagForUserSession:a1 withSessionID:a2 withSecret:a3 shouldSetGracePeriod:a4 withGracePeriod:a5 isInEarlyStar:0];

    return v20;
  }

  uint64_t system = aks_get_system();
  if ((_DWORD)system != -536870160)
  {
    uint64_t v15 = system;
    if ((_DWORD)system) {
      return convertAKSErrorToMKB(system);
    }
    return v15;
  }

  debuglog( "MKBUserSessionLoadKeybagForUser",  @"From EARLYSTART skip check switch between users",  v9,  v10,  v11,  v12,  v13,  v14,  v60);
  uint32_t v22 = KBLoadUserKeybag(a2);
  if (v22)
  {
    uint64_t v29 = v22;
    Value = (const __CFData *)CFDictionaryGetValue(v22, @"KeyBagKeys");
    if (Value)
    {
      char v37 = Value;
      CFDataGetBytePtr(Value);
      CFDataGetLength(v37);
      uint64_t bag = aks_load_bag();
      if ((_DWORD)bag)
      {
        uint64_t v45 = bag;
        debuglog( "MKBUserSessionLoadKeybagForUser",  @"failed to load bag for user %d: 0x%x",  v39,  v40,  v41,  v42,  v43,  v44,  a2);
      }

      else
      {
        uint64_t v46 = aks_set_system();
        if ((_DWORD)v46)
        {
          uint64_t v45 = v46;
          debuglog( "MKBUserSessionLoadKeybagForUser",  @"failed to set bag handle %d as session bag for UID %d: 0x%x",  v47,  v48,  v49,  v50,  v51,  v52,  -1);
        }

        else
        {
          uint64_t v53 = aks_get_system();
          if (!(_DWORD)v53)
          {
            if ((_DWORD)a2 != 502)
            {
              debuglog( "MKBUserSessionLoadKeybagForUser",  @"seting APFSVolumeID For KeyBag ",  v54,  v55,  v56,  v57,  v58,  v59,  v61);
              setAPFSVolumeIDForKeyBag(0xFFFFFFFFLL, a2, a1);
            }

            uint64_t v15 = 0LL;
            goto LABEL_17;
          }

          uint64_t v45 = v53;
          debuglog( "MKBUserSessionLoadKeybagForUser",  @"loaded bag handle %ld as session bag for %d, but got no session handle back: 0x%x",  v54,  v55,  v56,  v57,  v58,  v59,  -1);
        }
      }

      uint64_t v15 = convertAKSErrorToMKB(v45);
    }

    else
    {
      debuglog( "MKBUserSessionLoadKeybagForUser",  @"no keybag in user bag plist",  v31,  v32,  v33,  v34,  v35,  v36,  v61);
      uint64_t v15 = 4294966296LL;
    }

void setAPFSVolumeIDForKeyBag(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  bzero(v23, 0x3FBuLL);
  qmemcpy(v22, "/dev/", sizeof(v22));
  memset(v24, 0, sizeof(v24));
  _getCString(a3, kMKBUserSessionVolumeDeviceNodeKey, (char *)v24, 256);
  if (LODWORD(v24[0]) == 1802725732) {
    __strlcat_chk();
  }
  if (a3)
  {
    if (CFDictionaryContainsKey(a3, kMKBUserSessionVolumeUUIDKey))
    {
      String = _getString(a3, kMKBUserSessionVolumeUUIDKey);
      if (String)
      {
        debuglog("setAPFSVolumeIDForKeyBag", @"Updating VolumeUUID %@", v7, v8, v9, v10, v11, v12, (char)String);
        bzero(in, 0x400uLL);
        _getCString(a3, kMKBUserSessionVolumeUUIDKey, in, 1024);
        if (uuid_parse(in, uu))
        {
          debuglog("setAPFSVolumeIDForKeyBag", @"uuid_parse failed", v13, v14, v15, v16, v17, v18, v19);
        }

        else
        {
          debuglog("setAPFSVolumeIDForKeyBag", @"uuid_parse SUCCESS", v13, v14, v15, v16, v17, v18, v19);
          KBMapVolume(a1, a2, (uint64_t)v22, (uint64_t)uu, 0);
        }
      }
    }
  }

uint64_t MKBUserSessionCreateKeybagForUser(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 createKeybagForUserSession:a1 withSessionUID:a2 WithSecret:a3 withGracePeriod:a4 withOpaqeStuff:a5];

  return v11;
}

uint64_t MKBUserSessionUnloadKeybagForUser(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 unloadKeybagForUserSession:a1];

  return v3;
}

uint64_t MKBUserSessionDeleteKeybagForUser()
{
  return 0LL;
}

uint64_t MKBUserSessionSetVolumeToPersona(const __CFString *a1, const __CFString *a2)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  bzero(buffer, 0x400uLL);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  *(_OWORD *)in = 0u;
  __int128 v23 = 0u;
  if (!CFStringGetCString(a1, buffer, 1024LL, 0x8000100u))
  {
    uint64_t v10 = @"Failed to get cstring from volumePath";
    goto LABEL_7;
  }

  if (!CFStringGetCString(a2, in, 256LL, 0x8000100u))
  {
    uint64_t v10 = @"Failed to get cstring from uuidString";
    goto LABEL_7;
  }

  if (uuid_parse(in, uu))
  {
    uint64_t v10 = @"Failed to parse to uuid_t";
LABEL_7:
    debuglog("MKBUserSessionSetVolumeToPersona", v10, v4, v5, v6, v7, v8, v9, v20);
    return 0xFFFFFFFFLL;
  }

  uint64_t v13 = KBMapDeviceBag(buffer, 1);
  uint64_t v11 = v13;
  if ((_DWORD)v13) {
    debuglog( "MKBUserSessionSetVolumeToPersona",  @"KBMapDeviceBag failed with error %d",  v14,  v15,  v16,  v17,  v18,  v19,  v13);
  }
  else {
    debuglog("MKBUserSessionSetVolumeToPersona", @"KBMapDeviceBag Success", v14, v15, v16, v17, v18, v19, v20);
  }
  return v11;
}

uint64_t MKBUserSessionCreateSyncBagForUser()
{
  return 0LL;
}

uint64_t MKBUserSessionLoadSyncBagForUser()
{
  return 0LL;
}

uint64_t MKBUserSessionVerifySyncBagForUser()
{
  return 0LL;
}

uint64_t MKBUserSessionUnLoadSyncBagForUser()
{
  return 0LL;
}

uint64_t MKBUserSessionRemoveSyncBagForUser()
{
  return 0LL;
}

uint64_t MKBUserSessionUnloadSessionBags()
{
  uint64_t result = aks_unload_session_bags();
  if ((_DWORD)result)
  {
    debuglog( "MKBUserSessionUnloadSessionBags",  @"Failed to unload session keybags: 0x%x",  v1,  v2,  v3,  v4,  v5,  v6,  result);
    return 0xFFFFFFFFLL;
  }

  return result;
}

CFDataRef MKBUserSessionWrapSession( int a1, CFDataRef theData, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)&length[19] = *MEMORY[0x1895F89C0];
  if (!theData)
  {
    debuglog("MKBUserSessionWrapSession", @"Data to Wrap is NULL", a3, a4, a5, a6, a7, a8, v30);
    goto LABEL_6;
  }

  char v9 = CFDataGetLength(theData);
  debuglog("MKBUserSessionWrapSession", @"Data to Wrap with length:%d", v10, v11, v12, v13, v14, v15, v9);
  if (CFDataGetLength(theData) < 1)
  {
LABEL_6:
    debuglog("MKBUserSessionWrapSession", @"Invalid Blob entry for wrap", v16, v17, v18, v19, v20, v21, v31);
    return 0LL;
  }

  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  int v22 = aks_wrap_key();
  if (!v22)
  {
    debuglog( "MKBUserSessionWrapSession",  @"key_class_f wrap Completed with size %d",  v23,  v24,  v25,  v26,  v27,  v28,  72);
    return CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)&length[1], 72LL);
  }

  debuglog( "MKBUserSessionWrapSession",  @"failed to key_class_f wrap by aks_wrap_key: 0x%x",  v23,  v24,  v25,  v26,  v27,  v28,  v22);
  return 0LL;
}

CFDataRef MKBUserSessionUnWrapSession( int a1, CFDataRef theData, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)&length[44] = *MEMORY[0x1895F89C0];
  memset(&length[4], 0, 32);
  if (theData && CFDataGetLength(theData) >= 1)
  {
    char v9 = CFDataGetLength(theData);
    debuglog("MKBUserSessionUnWrapSession", @"sessionblob length:%ld", v10, v11, v12, v13, v14, v15, v9);
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    if (!aks_unwrap_key())
    {
      debuglog( "MKBUserSessionUnWrapSession",  @"deCryptnextsession: session decrypt length:%d(expected: 32)",  a3,  a4,  a5,  a6,  a7,  a8,  32);
      return CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], &length[4], 32LL);
    }

    uint64_t v16 = @"Failed to unwrap dict blob with classF";
  }

  else
  {
    uint64_t v16 = @"Invalid Blob entry for unwrap";
  }

  debuglog("MKBUserSessionUnWrapSession", v16, a3, a4, a5, a6, a7, a8, v18);
  return 0LL;
}

uint64_t MKBUserSessionCreatePersonaKeyForUser(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 addPersonaKeyForUserSession:a2 withSecret:a3 withPersonaUUIDString:a4 forPath:a5];

  return v10;
}

uint64_t MKBUserSessionRemovePersonaKeyForUser(CFDictionaryRef theDict, uint64_t a2, uint64_t a3)
{
  String = theDict;
  if (!theDict
    || CFDictionaryContainsKey(theDict, kMKBUserSessionVolumeUUIDKey)
    && (String = (const __CFDictionary *)_getString(String, kMKBUserSessionVolumeUUIDKey)) != 0LL)
  {
    +[MKBKeyStoreDevice sharedService](&OBJC_CLASS___MKBKeyStoreDevice, "sharedService");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 removePersonaKeyForUserSession:a2 withPersonaUUIDString:a3 withVolumeUUIDString:String];

    return v13;
  }

  else
  {
    debuglog( "MKBUserSessionRemovePersonaKeyForUser",  @"Cannot find proper VolumeUUID String to remove personakey with volume unmap",  v6,  v7,  v8,  v9,  v10,  v11,  v15);
    return 22LL;
  }

const void *_getData(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID()) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

const void *_getArray(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFArrayGetTypeID()) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t _getInt(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFTypeID v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

uint64_t _getLongLongInt(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = -1LL;
  uint64_t valuePtr = -1LL;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFTypeID v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
      return valuePtr;
    }

    else
    {
      return -1LL;
    }
  }

  return v2;
}

uint64_t _getSInt64(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = -1LL;
  uint64_t valuePtr = -1LL;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFTypeID v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
      return valuePtr;
    }

    else
    {
      return -1LL;
    }
  }

  return v2;
}

CFBooleanRef _getBool(const __CFDictionary *a1, const void *a2)
{
  uint64_t result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)(CFBooleanGetValue(v3) != 0);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

const void *_getString(const __CFDictionary *a1, const void *a2)
{
  Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0LL;
  }
  uint64_t v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 0LL;
  }
  return v3;
}

BOOL _getCString(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  String = (const __CFString *)_getString(a1, a2);
  return String && CFStringGetCString(String, a3, a4, 0x8000100u);
}

CFTypeRef _getRetainedDict(const __CFDictionary *a1, const void *a2)
{
  Value = CFDictionaryGetValue(a1, a2);
  if (Value && (uint64_t v3 = Value, v4 = CFGetTypeID(Value), v4 == CFDictionaryGetTypeID())) {
    return CFRetain(v3);
  }
  else {
    return 0LL;
  }
}

CFTypeRef convertObjectToBinary(const void *a1)
{
  uint64_t v2 = CFWriteStreamCreateWithAllocatedBuffers( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFAllocatorRef)*MEMORY[0x189604DB0]);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL) < 1) {
      CFTypeRef v4 = 0LL;
    }
    else {
      CFTypeRef v4 = CFWriteStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1896051D0]);
    }
    CFWriteStreamClose(v3);
  }

  else
  {
    CFTypeRef v4 = 0LL;
  }

  CFRelease(v3);
  return v4;
}

CFPropertyListRef convertBinaryToObject(UInt8 *bytes, CFIndex length)
{
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v3 = CFReadStreamCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  bytes,  length,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  if (v3)
  {
    uint64_t v10 = v3;
    if (CFReadStreamOpen(v3))
    {
      CFPropertyListRef v23 = CFPropertyListCreateWithStream(v2, v10, 0LL, 2uLL, &format, 0LL);
      if (!v23) {
        debuglog( "convertBinaryToObject",  @"Could not create object from stream",  v17,  v18,  v19,  v20,  v21,  v22,  v25);
      }
      CFReadStreamClose(v10);
    }

    else
    {
      debuglog("convertBinaryToObject", @"Could not open the stream", v11, v12, v13, v14, v15, v16, v25);
      CFPropertyListRef v23 = 0LL;
    }

    CFRelease(v10);
  }

  else
  {
    debuglog("convertBinaryToObject", @"Could not create stream for serialized data", v4, v5, v6, v7, v8, v9, v25);
    return 0LL;
  }

  return v23;
}

size_t writen(int __fd, char *__buf, size_t __nbyte)
{
  size_t v3 = __nbyte;
  if (__nbyte)
  {
    size_t v6 = __nbyte;
    do
    {
      ssize_t v7 = write(__fd, __buf, v6);
      if (v7 == -1)
      {
        if (*__error() != 4) {
          return -1LL;
        }
        ssize_t v7 = 0LL;
      }

      __buf += v7;
      v6 -= v7;
    }

    while (v6);
  }

  return v3;
}

uint64_t store_binary_dict_fd(const void *a1, const char *a2, int *a3)
{
  uint64_t v5 = (const __CFData *)convertObjectToBinary(a1);
  if (!v5)
  {
    debuglog("store_binary_dict_fd", @"Can't serialize dictionary", v6, v7, v8, v9, v10, v11, v34);
    return 0xFFFFFFFFLL;
  }

  uint64_t v12 = v5;
  int v13 = open_dprotected_np(a2, 1537, 4, 0, 420LL);
  if (v13 == -1)
  {
    uint64_t v18 = __error();
    strerror(*v18);
    debuglog("store_binary_dict_fd", @"Could not create %s: %s", v19, v20, v21, v22, v23, v24, (char)a2);
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }

  int v14 = v13;
  BytePtr = (char *)CFDataGetBytePtr(v12);
  size_t Length = CFDataGetLength(v12);
  if (writen(v14, BytePtr, Length) == -1LL)
  {
    char v25 = @"Could not write to %s: %s";
LABEL_12:
    uint64_t v26 = __error();
    strerror(*v26);
    debuglog("store_binary_dict_fd", v25, v27, v28, v29, v30, v31, v32, (char)a2);
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }

  if (fcntl(v14, 51))
  {
    char v25 = @"Unable to fsync %s: %s";
    goto LABEL_12;
  }

  uint64_t v17 = 0LL;
  if (!a3)
  {
LABEL_13:
    CFRelease(v12);
    close(v14);
    return v17;
  }

  *a3 = v14;
LABEL_7:
  CFRelease(v12);
  return v17;
}

uint64_t store_binary_dict(const void *a1, const char *a2)
{
  return store_binary_dict_fd(a1, a2, 0LL);
}

const void *load_binary_dict_from_buffer(UInt8 *bytes, CFIndex length)
{
  uint64_t v2 = 0LL;
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    uint64_t v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v5 = CFReadStreamCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  bytes,  length,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
    if (!v5)
    {
      debuglog( "load_binary_dict_from_buffer",  @"Could not create stream from serialized data",  v6,  v7,  v8,  v9,  v10,  v11,  v28);
      return 0LL;
    }

    uint64_t v12 = v5;
    if (CFReadStreamOpen(v5))
    {
      CFPropertyListRef v19 = CFPropertyListCreateWithStream(v4, v12, length, 2uLL, &format, 0LL);
      uint64_t v2 = v19;
      if (!v19)
      {
        debuglog( "load_binary_dict_from_buffer",  @"Could not create dictionary from stream",  v20,  v21,  v22,  v23,  v24,  v25,  v28);
        goto LABEL_9;
      }

      CFTypeID v26 = CFGetTypeID(v19);
      if (v26 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v12);
        CFRelease(v12);
        return v2;
      }

      CFRelease(v2);
    }

    else
    {
      debuglog("load_binary_dict_from_buffer", @"Could not open the stream", v13, v14, v15, v16, v17, v18, v28);
    }

    uint64_t v2 = 0LL;
    goto LABEL_9;
  }

  return v2;
}

const void *load_binary_dict(const char *a1)
{
  char v1 = (char)a1;
  int v2 = open(a1, 0);
  if (v2 == -1)
  {
    uint64_t v15 = __error();
    strerror(*v15);
    debuglog("load_binary_dict", @"Could not open %s: %s", v16, v17, v18, v19, v20, v21, v1);
    uint64_t v11 = 0LL;
    binary_dict_from_buffer = 0LL;
    goto LABEL_7;
  }

  int v3 = v2;
  if (fstat(v2, &v32))
  {
    uint64_t v22 = __error();
    strerror(*v22);
    debuglog("load_binary_dict", @"Could not fstat %s: %s", v23, v24, v25, v26, v27, v28, v1);
    binary_dict_from_buffer = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_6;
  }

  off_t st_size = v32.st_size;
  uint64_t v11 = malloc(LODWORD(v32.st_size));
  if (!v11)
  {
    uint64_t v29 = @"Could not allocate buffer";
LABEL_12:
    debuglog("load_binary_dict", v29, v5, v6, v7, v8, v9, v10, v31);
    binary_dict_from_buffer = 0LL;
    goto LABEL_6;
  }

  ssize_t v12 = read(v3, v11, st_size);
  if (v12 != v32.st_size)
  {
    uint64_t v30 = __error();
    char v31 = v1;
    strerror(*v30);
    uint64_t v29 = @"Could not read %s: %s";
    goto LABEL_12;
  }

  binary_dict_from_buffer = load_binary_dict_from_buffer((UInt8 *)v11, v12);
LABEL_6:
  close(v3);
LABEL_7:
  free(v11);
  return binary_dict_from_buffer;
}

CFMutableDictionaryRef create_dict()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!result)
  {
    debuglog("create_dict", @"Out of Memory!!! Dying!...so...cold....", v1, v2, v3, v4, v5, v6, vars0);
    exit(-1);
  }

  return result;
}

CFMutableDictionaryRef create_mutable_dict(CFDictionaryRef theDict)
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theDict);
  if (!result)
  {
    debuglog("create_mutable_dict", @"Out of Memory!!! Dying!...so...cold....", v2, v3, v4, v5, v6, v7, vars0);
    exit(-1);
  }

  return result;
}

CFMutableArrayRef create_array()
{
  CFMutableArrayRef result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (!result)
  {
    debuglog("create_array", @"Out of Memory!!! Dying!...so...cold....", v1, v2, v3, v4, v5, v6, vars0);
    exit(-1);
  }

  return result;
}

CFStringRef create_string(char *cStr)
{
  CFStringRef result = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x8000100u);
  if (!result)
  {
    debuglog("create_string", @"Out of Memory!!! Dying!...so...cold....", v2, v3, v4, v5, v6, v7, vars0);
    exit(-1);
  }

  return result;
}

uint64_t get_hostmultiuserconfig(uint32_t *a1)
{
  uint32_t multiuser_flags = 0;
  host_t v2 = MEMORY[0x186E287F4]();
  uint64_t result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!(_DWORD)result) {
      *a1 = multiuser_flags;
    }
  }

  return result;
}

uint64_t set_hostmultiuserconfig(uint32_t a1)
{
  host_priv_t v2 = MEMORY[0x186E287F4]();
  return host_set_multiuser_config_flags(v2, a1);
}

uint64_t GetConfiguredForegroundUserID()
{
  int v3 = 0;
  int hostmultiuserconfig = get_hostmultiuserconfig((uint32_t *)&v3);
  if (v3 >= 0) {
    uint32_t v1 = -1;
  }
  else {
    uint32_t v1 = v3 & 0x3FFFFFFF;
  }
  if (hostmultiuserconfig) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v1;
  }
}

BOOL IsConfiguredMultiUser()
{
  int v2 = 0;
  return !get_hostmultiuserconfig((uint32_t *)&v2) && v2 < 0;
}

uint64_t convertAKSErrorToMKB(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if ((int)a1 > -536363001)
  {
    switch(a1)
    {
      case 0xE007C00E:
        return 4294967283LL;
      case 0xE007C00F:
      case 0xE007C010:
      case 0xE007C011:
      case 0xE007C012:
      case 0xE007C016:
      case 0xE007C017:
        goto LABEL_20;
      case 0xE007C013:
        return 4294967276LL;
      case 0xE007C014:
        return 0LL;
      case 0xE007C015:
        return 4294967282LL;
      case 0xE007C018:
        return 4294967277LL;
      default:
        if ((_DWORD)a1 == -536363000) {
          return 4294967282LL;
        }
        if (!(_DWORD)a1) {
          return v1;
        }
        break;
    }

    goto LABEL_20;
  }

  uint64_t v2 = 4294967294LL;
  if ((int)a1 <= -536870195)
  {
    switch((_DWORD)a1)
    {
      case 0xE00002C1:
        return v2;
      case 0xE00002C2:
        return 4294967279LL;
      case 0xE00002C9:
        return 4294967287LL;
    }

LABEL_20:
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl( &dword_183E36000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Unexpected AppleKeyStore error: %d\n",  (uint8_t *)v4,  8u);
    }

    return 0xFFFFFFFFLL;
  }

  if ((int)a1 > -536870175)
  {
    if ((_DWORD)a1 == -536870174) {
      return v2;
    }
    if ((_DWORD)a1 == -536870160) {
      return 4294967288LL;
    }
    goto LABEL_20;
  }

  if ((_DWORD)a1 == -536870194) {
    return 4294967293LL;
  }
  if ((_DWORD)a1 != -536870184) {
    goto LABEL_20;
  }
  return 4294967283LL;
}

uint64_t get_port_type(mach_port_name_t name)
{
  mach_port_type_t ptype = 0;
  if (mach_port_type(*MEMORY[0x1895FBBE0], name, &ptype)) {
    return 0LL;
  }
  else {
    return ptype;
  }
}

void log_port_type(mach_port_name_t name)
{
  kern_return_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_type_t v9;
  BOOL v10;
  CFStringRef v11;
  mach_port_type_t ptype;
  char v1 = name;
  mach_port_type_t ptype = 0;
  uint64_t v2 = mach_port_type(*MEMORY[0x1895FBBE0], name, &ptype);
  uint64_t v9 = ptype;
  if (v2) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = ptype == 0;
  }
  if (v10)
  {
    uint64_t v11 = @"Port:%d has NORIGHTS";
LABEL_16:
    debuglog("log_port_type", v11, v3, v4, v5, v6, v7, v8, v1);
    return;
  }

  if ((ptype & 0x10000) != 0)
  {
    debuglog("log_port_type", @"Port:%d has SENDRIGHT", v3, v4, v5, v6, v7, v8, v1);
    if ((v9 & 0x20000) == 0)
    {
LABEL_9:
      if ((v9 & 0x40000) == 0) {
        goto LABEL_10;
      }
LABEL_14:
      debuglog("log_port_type", @"Port:%d has SENDONCERIGHT", v3, v4, v5, v6, v7, v8, v1);
      if ((v9 & 0x100000) == 0) {
        return;
      }
      goto LABEL_15;
    }
  }

  else if ((ptype & 0x20000) == 0)
  {
    goto LABEL_9;
  }

  debuglog("log_port_type", @"Port:%d has RECEIVERIGHT", v3, v4, v5, v6, v7, v8, v1);
  if ((v9 & 0x40000) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((v9 & 0x100000) != 0)
  {
LABEL_15:
    uint64_t v11 = @"Port:%d has DEADNAME";
    goto LABEL_16;
  }

unsigned __int16 *_apfs_get_all_crypto_ids(int a1)
{
  v23[96] = *MEMORY[0x1895F89C0];
  __int128 v19 = xmmword_183E54FB0;
  uint64_t v20 = &v21;
  uint64_t v8 = 0LL;
  if (ffsctl(a1, 0x80184A07uLL, &v19, 0))
  {
LABEL_12:
    debuglog("_apfs_get_all_crypto_ids", @"APFSIOC_GET_CRYPTO_IDS fail", v2, v3, v4, v5, v6, v7, v19);
    free(v8);
    return 0LL;
  }

  else
  {
    while (1)
    {
      uint64_t v9 = v22;
      if (!v22) {
        break;
      }
      if (v8) {
        int v10 = v8[4];
      }
      else {
        int v10 = 0;
      }
      uint64_t v11 = (unsigned __int16 *)reallocf(v8, 24LL * (v10 + v22) + 16);
      uint64_t v8 = v11;
      if (!v11)
      {
        debuglog("_apfs_get_all_crypto_ids", @"realloc failed", v12, v13, v14, v15, v16, v17, v19);
        return v8;
      }

      if ((void)v19 == -1LL)
      {
        memset_s(v11, 0x10uLL, 0, 0x10uLL);
        uint64_t v9 = v22;
      }

      memcpy(&v8[12 * v8[4] + 8], v23, 24 * v9);
      v8[4] += v9;
      if ((_DWORD)v9) {
        *(void *)&__int128 v19 = v23[3 * (unsigned __int16)(v9 - 1) + 1] + v23[3 * (unsigned __int16)(v9 - 1)];
      }
      if (ffsctl(a1, 0x80184A07uLL, &v19, 0)) {
        goto LABEL_12;
      }
    }
  }

  return v8;
}

void *_apfs_copy_wrapped_key_from_file(int a1, uint64_t a2, CFTypeRef *a3)
{
  uint64_t v6 = malloc(0x400uLL);
  v18[0] = a2;
  v18[1] = 1024LL;
  v18[2] = v6;
  if (ffsctl(a1, 0x80184A08uLL, v18, 0) < 0)
  {
    uint64_t v7 = __error();
    strerror(*v7);
    debuglog( "_apfs_copy_wrapped_key_from_file",  @"Could not get wrapped crypto key for inode %llu right now: %s",  v8,  v9,  v10,  v11,  v12,  v13,  a2);
    if (a3)
    {
      if (*a3)
      {
        CFRelease(*a3);
        *a3 = 0LL;
      }

      uint64_t v14 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      uint64_t v15 = (const __CFString *)*MEMORY[0x189604F58];
      uint64_t v16 = __error();
      *a3 = CFErrorCreate(v14, v15, *v16, 0LL);
    }

    free(v6);
    return 0LL;
  }

  return v6;
}

uint64_t mkb_time_start(uint64_t result)
{
  if (result)
  {
    char v1 = (void *)result;
    uint64_t result = mach_absolute_time();
    void *v1 = result;
  }

  return result;
}

double mkb_time_stop(uint64_t a1, void *a2)
{
  uint64_t v4 = mach_absolute_time();
  if (mkb_time_stop_time_overhead_measured)
  {
    if (!a2) {
      return result;
    }
  }

  else
  {
    uint64_t v6 = mach_absolute_time();
    mkb_time_stop_time_overhead_measured = mach_absolute_time() - v6;
    mach_timebase_info info = 0LL;
    mach_timebase_info(&info);
    LODWORD(v8) = info.denom;
    LODWORD(v7) = info.numer;
    double result = (double)v7 / (double)v8;
    mkb_time_stop_timebase_factor = *(void *)&result;
    if (!a2) {
      return result;
    }
  }

  double result = *(double *)&mkb_time_stop_timebase_factor * (double)(v4 - a1 - mkb_time_stop_time_overhead_measured) / 1000.0;
  *a2 = (unint64_t)result;
  return result;
}

void sub_183E462C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183E46490( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E46614( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_183E46868( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183E46B64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183E46CE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E46F0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E470D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E4729C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E47528( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183E47728( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E478F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E47AA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E47C50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E47E00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E47FD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E481A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183E483C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E48580( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E48730( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E4892C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183E48B28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183E48CF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E48EA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E491C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183E49410( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183E49584( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E496F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E49898( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E49A24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E49BB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E49D3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E49EC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E4A054( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E4A260( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E4A408( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *MKBEventsRegister( dispatch_queue_s *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  io_object_t notification = 0;
  if (!a1 || !a2)
  {
    uint64_t v44 = @"bad arguments";
LABEL_13:
    debuglog("MKBEventsRegister", v44, a3, a4, a5, a6, a7, a8, v48);
    return 0LL;
  }

  mach_port_t v10 = *MEMORY[0x1896086A8];
  uint64_t v11 = IOServiceMatching("AppleKeyStore");
  io_service_t MatchingService = IOServiceGetMatchingService(v10, v11);
  if (!MatchingService)
  {
    debuglog( "MKBEventsRegister",  @"failed to find %s service",  v13,  v14,  v15,  v16,  v17,  v18,  (char)"AppleKeyStore");
    return 0LL;
  }

  io_service_t v19 = MatchingService;
  IONotificationPortRef v20 = IONotificationPortCreate(v10);
  if (!v20)
  {
    uint64_t v44 = @"failed to create notification port for AKS";
    goto LABEL_13;
  }

  char v21 = v20;
  unsigned __int16 v22 = calloc(1uLL, 0x20uLL);
  uint64_t v29 = v22;
  if (!v22)
  {
    debuglog( "MKBEventsRegister",  @"failed to allocate memory for event callback",  v23,  v24,  v25,  v26,  v27,  v28,  v48);
    IONotificationPortDestroy(v21);
    return v29;
  }

  *unsigned __int16 v22 = v21;
  uint64_t v30 = _Block_copy(a2);
  v29[1] = v30;
  if (v30)
  {
    __int128 v37 = dispatch_queue_create_with_target_V2("mkb events", 0LL, a1);
    v29[3] = v37;
    IONotificationPortSetDispatchQueue(v21, v37);
    if (!IOServiceAddInterestNotification( v21,  v19,  "IOGeneralInterest",  (IOServiceInterestCallback)aksNotificationCB,  v29,  &notification))
    {
      *((_DWORD *)v29 + 4) = notification;
      *((_DWORD *)v29 + 5) = 1918985081;
      return v29;
    }

    debuglog("MKBEventsRegister", @"failed to add interest notification", v38, v39, v40, v41, v42, v43, v48);
    if (notification) {
      IOObjectRelease(notification);
    }
  }

  else
  {
    debuglog("MKBEventsRegister", @"failed to copy block", v31, v32, v33, v34, v35, v36, v48);
  }

  IONotificationPortDestroy(v21);
  uint64_t v46 = (dispatch_object_s *)v29[3];
  if (v46) {
    dispatch_release(v46);
  }
  uint64_t v47 = (const void *)v29[1];
  if (v47) {
    _Block_release(v47);
  }
  free(v29);
  return 0LL;
}

void aksNotificationCB( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    char v9 = 0;
LABEL_8:
    debuglog("aksNotificationCB", @"invalid context %d %d", a3, a4, a5, a6, a7, a8, v9);
    return;
  }

  if (*(_DWORD *)(a1 + 20) != 1918985081)
  {
    char v9 = 1;
    goto LABEL_8;
  }

  if ((_DWORD)a3 == -469774321)
  {
    unint64_t v8 = *(void (**)(void))(*(void *)(a1 + 8) + 16LL);
    goto LABEL_11;
  }

  if ((_DWORD)a3 == -469774323)
  {
    unint64_t v8 = *(void (**)(void))(*(void *)(a1 + 8) + 16LL);
LABEL_11:
    v8();
  }

void MKBEventsUnregister(uint64_t a1)
{
  if (a1)
  {
    IOObjectRelease(*(_DWORD *)(a1 + 16));
    IONotificationPortDestroy(*(IONotificationPortRef *)a1);
    uint64_t v2 = *(dispatch_queue_s **)(a1 + 24);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __MKBEventsUnregister_block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    block[4] = a1;
    dispatch_barrier_async(v2, block);
  }

void __MKBEventsUnregister_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(v2 + 20) = 0;
  _Block_release(*(const void **)(v2 + 8));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24LL));
  free(*(void **)(a1 + 32));
}

void analytics_send_persisted_sidp_recovery( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  analytics_send_sidp_recovery(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_persisted_forgotten_passcode_event( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  analytics_send_forgotten_passcode_event(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_nfc_hardware_state( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog( "analytics_send_nfc_hardware_state",  @"CA fwk missing, not sending event",  a3,  a4,  a5,  a6,  a7,  a8,  a9);
  }
}

xpc_object_t __analytics_send_nfc_hardware_state_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, "timedout", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "duration", *(unsigned int *)(*(void *)(a1 + 32) + 4LL));
  xpc_dictionary_set_uint64(v2, "state", *(unsigned int *)(*(void *)(a1 + 32) + 8LL));
  return v2;
}

void analytics_send_passcode_status( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog( "analytics_send_passcode_status",  @"CA fwk missing, not sending event",  v9,  v10,  v11,  v12,  v13,  v14,  a9);
  }
}

xpc_object_t __analytics_send_passcode_status_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, "is_set", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "type", *(unsigned int *)(*(void *)(a1 + 32) + 4LL));
  xpc_dictionary_set_uint64(v2, "activation_status", *(unsigned int *)(*(void *)(a1 + 32) + 8LL));
  xpc_dictionary_set_BOOL(v2, "inactivity_reboot", *(_BYTE *)(*(void *)(a1 + 32) + 12LL));
  xpc_dictionary_set_uint64(v2, "hours_since_locked", *(unsigned int *)(*(void *)(a1 + 32) + 16LL));
  xpc_dictionary_set_uint64(v2, "version", *(unsigned __int8 *)(*(void *)(a1 + 32) + 20LL));
  return v2;
}

void analytics_send_kek_stats( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog("analytics_send_kek_stats", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_kek_stats_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, "xart_policy", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_BOOL(v2, "xart_policy_enforced", *(_BYTE *)(*(void *)(a1 + 32) + 1LL));
  xpc_dictionary_set_BOOL(v2, "xart_policy_missing", *(_BYTE *)(*(void *)(a1 + 32) + 2LL));
  return v2;
}

void analytics_send_seshat_debug( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog("analytics_send_seshat_debug", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_seshat_debug_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "debug", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_sidp_recovery( _WORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = *a1 & 0xFFF0 | 1;
  debuglog( "analytics_send_sidp_recovery",  @"AnalyticsEvent: version: %llu, type: %llu, event: %llu, recoverable: %llu, recovery_required: %llu, se_entangled: %llu, se_recovery_required: %llu, smdk_entalgned: %llu",  a3,  a4,  a5,  a6,  a7,  a8,  1);
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog( "analytics_send_sidp_recovery",  @"CA fwk missing, not sending event",  v9,  v10,  v11,  v12,  v13,  v14,  a9);
  }
}

xpc_object_t __analytics_send_sidp_recovery_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "version", **(_WORD **)(a1 + 32) & 0xFLL);
  xpc_dictionary_set_uint64(v2, "type", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 4) & 3);
  xpc_dictionary_set_uint64(v2, "event", **(_WORD **)(a1 + 32) >> 6);
  xpc_dictionary_set_uint64(v2, "recoverable", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 8) & 1);
  xpc_dictionary_set_uint64(v2, "recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 9) & 1);
  xpc_dictionary_set_uint64(v2, "se_entangled", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "se_recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "smdk_entalgned", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  return v2;
}

void analytics_send_db_filekey_found( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog( "analytics_send_db_filekey_found",  @"CA fwk missing, not sending event",  v9,  v10,  v11,  v12,  v13,  v14,  a9);
  }
}

xpc_object_t __analytics_send_db_filekey_found_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_db_filekey_not_found( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog( "analytics_send_db_filekey_not_found",  @"CA fwk missing, not sending event",  v9,  v10,  v11,  v12,  v13,  v14,  a9);
  }
}

xpc_object_t __analytics_send_db_filekey_not_found_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_db_add( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog("analytics_send_db_add", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t __analytics_send_db_add_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "status", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_db_get( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog("analytics_send_db_get", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t __analytics_send_db_get_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "status", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_passphrase_change( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog( "analytics_send_passphrase_change",  @"CA fwk missing, not sending event",  v9,  v10,  v11,  v12,  v13,  v14,  a9);
  }
}

xpc_object_t __analytics_send_passphrase_change_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "change_count", **(void **)(a1 + 32));
  return v2;
}

void analytics_send_backup_key_drain( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog("analytics_send_backup_key_drain", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t __analytics_send_backup_key_drain_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "fault", *(unsigned int *)(*(void *)(a1 + 32) + 8LL));
  xpc_dictionary_set_BOOL(v2, "first_unlocked", *(_BYTE *)(*(void *)(a1 + 32) + 12LL));
  xpc_dictionary_set_uint64(v2, "add_error", *(unsigned int *)(*(void *)(a1 + 32) + 16LL));
  xpc_dictionary_set_uint64(v2, "open_error", *(unsigned int *)(*(void *)(a1 + 32) + 20LL));
  xpc_dictionary_set_uint64(v2, "sqlite_error", *(unsigned int *)(*(void *)(a1 + 32) + 24LL));
  xpc_dictionary_set_BOOL(v2, "truncated", *(_BYTE *)(*(void *)(a1 + 32) + 28LL));
  xpc_dictionary_set_BOOL(v2, "unlinked", *(_BYTE *)(*(void *)(a1 + 32) + 29LL));
  return v2;
}

void analytics_send_fv_status( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog("analytics_send_fv_status", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_fv_status_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, "fv_enabled", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "fv_users_count", *(void *)(*(void *)(a1 + 32) + 8LL));
  xpc_dictionary_set_BOOL(v2, "icloud_recovery_key", *(_BYTE *)(*(void *)(a1 + 32) + 16LL));
  xpc_dictionary_set_BOOL(v2, "institutional_recovery_key", *(_BYTE *)(*(void *)(a1 + 32) + 17LL));
  xpc_dictionary_set_BOOL(v2, "personal_recovery_key", *(_BYTE *)(*(void *)(a1 + 32) + 18LL));
  xpc_dictionary_set_BOOL(v2, "mdm_recovery_key", *(_BYTE *)(*(void *)(a1 + 32) + 19LL));
  xpc_dictionary_set_BOOL(v2, "installer_user", *(_BYTE *)(*(void *)(a1 + 32) + 20LL));
  xpc_dictionary_set_BOOL(v2, "icloud_recovery_user", *(_BYTE *)(*(void *)(a1 + 32) + 21LL));
  xpc_dictionary_set_BOOL(v2, "institutional_recovery_user", *(_BYTE *)(*(void *)(a1 + 32) + 22LL));
  xpc_dictionary_set_BOOL(v2, "vek_device_protected", *(_BYTE *)(*(void *)(a1 + 32) + 23LL));
  xpc_dictionary_set_BOOL(v2, "vek_ephemeral", *(_BYTE *)(*(void *)(a1 + 32) + 24LL));
  xpc_dictionary_set_BOOL(v2, "vek_is_owner", *(_BYTE *)(*(void *)(a1 + 32) + 25LL));
  xpc_dictionary_set_BOOL(v2, "vek_boot_policy", *(_BYTE *)(*(void *)(a1 + 32) + 26LL));
  xpc_dictionary_set_BOOL(v2, "vek_imported", *(_BYTE *)(*(void *)(a1 + 32) + 27LL));
  xpc_dictionary_set_uint64(v2, "kek_sidp_count", *(void *)(*(void *)(a1 + 32) + 32LL));
  xpc_dictionary_set_uint64(v2, "kek_ps_count", *(void *)(*(void *)(a1 + 32) + 40LL));
  xpc_dictionary_set_uint64(v2, "kek_last_count", *(void *)(*(void *)(a1 + 32) + 48LL));
  xpc_dictionary_set_uint64(v2, "kek_imported_count", *(void *)(*(void *)(a1 + 32) + 56LL));
  xpc_dictionary_set_uint64(v2, "kek_bad_sig_count", *(void *)(*(void *)(a1 + 32) + 64LL));
  xpc_dictionary_set_uint64(v2, "kek_xart_policy_missing_count", *(void *)(*(void *)(a1 + 32) + 72LL));
  xpc_dictionary_set_uint64(v2, "kek_ps_missing_count", *(void *)(*(void *)(a1 + 32) + 80LL));
  return v2;
}

void analytics_send_forgotten_passcode_event( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog( "analytics_send_forgotten_passcode_event",  @"CA fwk missing, not sending event",  v9,  v10,  v11,  v12,  v13,  v14,  a9);
  }
}

xpc_object_t __analytics_send_forgotten_passcode_event_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "days_since_passcode_change", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "passcode_reset_expired", *(_BYTE *)(*(void *)(a1 + 32) + 4LL) & 1);
  xpc_dictionary_set_uint64( v2,  "passcode_reset_exists",  ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 4LL) >> 1) & 1);
  return v2;
}

void analytics_send_user_keybag( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x18960DAC8]) {
    analytics_send_event_lazy();
  }
  else {
    debuglog("analytics_send_user_keybag", @"CA fwk missing, not sending event", v9, v10, v11, v12, v13, v14, a9);
  }
}

xpc_object_t __analytics_send_user_keybag_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "report_version", **(void **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "grace_period", *(void *)(*(void *)(a1 + 32) + 8LL));
  xpc_dictionary_set_uint64(v2, "failed_unlock_attempts", *(void *)(*(void *)(a1 + 32) + 16LL));
  xpc_dictionary_set_uint64(v2, "max_unlock_attempts", *(void *)(*(void *)(a1 + 32) + 24LL));
  xpc_dictionary_set_uint64(v2, "recovery_iterations", *(void *)(*(void *)(a1 + 32) + 32LL));
  xpc_dictionary_set_uint64(v2, "recovery_target_iterations", *(void *)(*(void *)(a1 + 32) + 40LL));
  xpc_dictionary_set_BOOL(v2, "recovery_wc_protected", *(_BYTE *)(*(void *)(a1 + 32) + 48LL));
  xpc_dictionary_set_BOOL(v2, "recovery_restricted", *(_BYTE *)(*(void *)(a1 + 32) + 49LL));
  xpc_dictionary_set_BOOL(v2, "recovery_ps_protected", *(_BYTE *)(*(void *)(a1 + 32) + 50LL));
  xpc_dictionary_set_BOOL(v2, "recovery_akpu_protected", *(_BYTE *)(*(void *)(a1 + 32) + 51LL));
  xpc_dictionary_set_BOOL(v2, "recovery_auto", *(_BYTE *)(*(void *)(a1 + 32) + 52LL));
  xpc_dictionary_set_BOOL(v2, "memento_supported", *(_BYTE *)(*(void *)(a1 + 32) + 53LL));
  xpc_dictionary_set_BOOL(v2, "memento_exists", *(_BYTE *)(*(void *)(a1 + 32) + 54LL));
  xpc_dictionary_set_uint64(v2, "memento_passcode_generation", *(void *)(*(void *)(a1 + 32) + 56LL));
  xpc_dictionary_set_uint64(v2, "passcode_generation", *(void *)(*(void *)(a1 + 32) + 64LL));
  xpc_dictionary_set_BOOL(v2, "inactivity_reboot_enabled", *(_BYTE *)(*(void *)(a1 + 32) + 72LL));
  xpc_dictionary_set_BOOL(v2, "oneness_automatic_mode", *(_BYTE *)(*(void *)(a1 + 32) + 73LL));
  xpc_dictionary_set_BOOL(v2, "user_uuid_mismatch", *(_BYTE *)(*(void *)(a1 + 32) + 74LL));
  xpc_dictionary_set_BOOL(v2, "zero_user_uuid", *(_BYTE *)(*(void *)(a1 + 32) + 75LL));
  xpc_dictionary_set_BOOL(v2, "group_uuid_mismatch", *(_BYTE *)(*(void *)(a1 + 32) + 76LL));
  xpc_dictionary_set_BOOL(v2, "zero_group_uuid", *(_BYTE *)(*(void *)(a1 + 32) + 77LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_no_pin", *(_BYTE *)(*(void *)(a1 + 32) + 78LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_been_unlocked", *(_BYTE *)(*(void *)(a1 + 32) + 79LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_passcode_threshold", *(_BYTE *)(*(void *)(a1 + 32) + 80LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_mesa_token", *(_BYTE *)(*(void *)(a1 + 32) + 81LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_recovery_required", *(_BYTE *)(*(void *)(a1 + 32) + 82LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_not_recoverable", *(_BYTE *)(*(void *)(a1 + 32) + 83LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_stash_unlocked", *(_BYTE *)(*(void *)(a1 + 32) + 84LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_escrow_unwrap_required", *(_BYTE *)(*(void *)(a1 + 32) + 85LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_smdk_entangled", *(_BYTE *)(*(void *)(a1 + 32) + 86LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_staged_manifest", *(_BYTE *)(*(void *)(a1 + 32) + 87LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_unrecoverable", *(_BYTE *)(*(void *)(a1 + 32) + 88LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_recovery_required", *(_BYTE *)(*(void *)(a1 + 32) + 89LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_entangled", *(_BYTE *)(*(void *)(a1 + 32) + 90LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_healthy", *(_BYTE *)(*(void *)(a1 + 32) + 91LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_se_been_unlocked", *(_BYTE *)(*(void *)(a1 + 32) + 92LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_art_loaded", *(_BYTE *)(*(void *)(a1 + 32) + 93LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_unlock_policy", *(_BYTE *)(*(void *)(a1 + 32) + 94LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_policy_cached", *(_BYTE *)(*(void *)(a1 + 32) + 95LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_policy_dirty", *(_BYTE *)(*(void *)(a1 + 32) + 96LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_xart_policy_enforced", *(_BYTE *)(*(void *)(a1 + 32) + 97LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_ps_entangled", *(_BYTE *)(*(void *)(a1 + 32) + 98LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_from_xart", *(_BYTE *)(*(void *)(a1 + 32) + 99LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_allow_test_keys", *(_BYTE *)(*(void *)(a1 + 32) + 100LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_remote_session_unlocked", *(_BYTE *)(*(void *)(a1 + 32) + 101LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_group_seed", *(_BYTE *)(*(void *)(a1 + 32) + 102LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_been_passcode_unlocked", *(_BYTE *)(*(void *)(a1 + 32) + 103LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_auto_recovery", *(_BYTE *)(*(void *)(a1 + 32) + 104LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_lkgp_recovery", *(_BYTE *)(*(void *)(a1 + 32) + 105LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_fv_recovery", *(_BYTE *)(*(void *)(a1 + 32) + 106LL));
  xpc_dictionary_set_BOOL(v2, "keybag_state_has_memento_blob", *(_BYTE *)(*(void *)(a1 + 32) + 107LL));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_cx_expiring", *(_BYTE *)(*(void *)(a1 + 32) + 108LL));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_cx_expired", *(_BYTE *)(*(void *)(a1 + 32) + 109LL));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_recovery_ps_fua_cached", *(_BYTE *)(*(void *)(a1 + 32) + 110LL));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_unlocked_with_escrow", *(_BYTE *)(*(void *)(a1 + 32) + 111LL));
  xpc_dictionary_set_BOOL(v2, "keybag_more_state_oneness_assert", *(_BYTE *)(*(void *)(a1 + 32) + 112LL));
  xpc_dictionary_set_uint64(v2, "hours_since_locked", *(unsigned int *)(*(void *)(a1 + 32) + 116LL));
  xpc_dictionary_set_uint64(v2, "cx_hours_remaining", *(unsigned int *)(*(void *)(a1 + 32) + 120LL));
  xpc_dictionary_set_uint64(v2, "days_since_passcode_change", *(unsigned int *)(*(void *)(a1 + 32) + 124LL));
  xpc_dictionary_set_BOOL(v2, "memento_flags_blob_exists", *(_BYTE *)(*(void *)(a1 + 32) + 128LL));
  xpc_dictionary_set_BOOL(v2, "memento_flags_se", *(_BYTE *)(*(void *)(a1 + 32) + 129LL));
  xpc_dictionary_set_BOOL(v2, "memento_flags_ps", *(_BYTE *)(*(void *)(a1 + 32) + 130LL));
  xpc_dictionary_set_BOOL(v2, "memento_flags_se_reset_token", *(_BYTE *)(*(void *)(a1 + 32) + 131LL));
  xpc_dictionary_set_BOOL(v2, "memento_flags_tombstone", *(_BYTE *)(*(void *)(a1 + 32) + 132LL));
  xpc_dictionary_set_uint64(v2, "memento_failed_unlock_attempts", *(unsigned int *)(*(void *)(a1 + 32) + 136LL));
  xpc_dictionary_set_uint64(v2, "memento_se_slot", *(unsigned int *)(*(void *)(a1 + 32) + 140LL));
  xpc_dictionary_set_BOOL(v2, "aks_get_extended_device_state_failure", *(_BYTE *)(*(void *)(a1 + 32) + 144LL));
  xpc_dictionary_set_BOOL(v2, "AKSIdentityGetSessionTimeWindowsFailure", *(_BYTE *)(*(void *)(a1 + 32) + 145LL));
  xpc_dictionary_set_BOOL(v2, "aks_get_seconds_since_passcode_change_failure", *(_BYTE *)(*(void *)(a1 + 32) + 146LL));
  xpc_dictionary_set_BOOL(v2, "aks_memento_get_state_failure", *(_BYTE *)(*(void *)(a1 + 32) + 147LL));
  return v2;
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x18960CE28]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x18960CE48]();
}

uint64_t ADClientSetValueForDistributionKey()
{
  return MEMORY[0x18960CE50]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x18960CE60]();
}

uint64_t AKSIdentityGetPrimary()
{
  return MEMORY[0x18960D150]();
}

CCCryptorStatus CCCrypt( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8090]( *(void *)&op,  *(void *)&alg,  *(void *)&options,  key,  keyLength,  iv,  dataIn,  dataInLength);
}

CCCryptorStatus CCCryptorCreate( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal( CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F80C0](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1895F8118](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1895F8120](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate( CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8130](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8290](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x189602AE8](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x189602D20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
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

CFPropertyListRef CFPropertyListCreateWithStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189603000](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite( CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x189603018](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x189603050](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x189603498](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x189603920](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x189603930](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x189603960](stream);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
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

kern_return_t IORegistryEntrySetCFProperty( io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x189608528](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification( IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x189608540](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
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

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x18960B5F8](rnd, count, bytes);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1895F8940]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t aks_assert_consume()
{
  return MEMORY[0x18960D188]();
}

uint64_t aks_assert_drop()
{
  return MEMORY[0x18960D190]();
}

uint64_t aks_assert_hold()
{
  return MEMORY[0x18960D198]();
}

uint64_t aks_assert_promote()
{
  return MEMORY[0x18960D1A0]();
}

uint64_t aks_backup_copy_bag_uuid()
{
  return MEMORY[0x18960D1A8]();
}

uint64_t aks_backup_copy_current_bag_uuid()
{
  return MEMORY[0x18960D1B0]();
}

uint64_t aks_backup_rewrap_ek()
{
  return MEMORY[0x18960D1B8]();
}

uint64_t aks_backup_rewrap_key()
{
  return MEMORY[0x18960D1C0]();
}

uint64_t aks_backup_unwrap_bag()
{
  return MEMORY[0x18960D1C8]();
}

uint64_t aks_backup_unwrap_key()
{
  return MEMORY[0x18960D1D0]();
}

uint64_t aks_bag_in_xart()
{
  return MEMORY[0x18960D1D8]();
}

uint64_t aks_change_secret()
{
  return MEMORY[0x18960D1E0]();
}

uint64_t aks_change_secret_epilogue()
{
  return MEMORY[0x18960D1E8]();
}

uint64_t aks_change_secret_opts()
{
  return MEMORY[0x18960D1F0]();
}

uint64_t aks_copy_volume_cookie()
{
  return MEMORY[0x18960D1F8]();
}

uint64_t aks_copy_volume_cookie_persona()
{
  return MEMORY[0x18960D200]();
}

uint64_t aks_create_bag()
{
  return MEMORY[0x18960D208]();
}

uint64_t aks_create_escrow_bag()
{
  return MEMORY[0x18960D210]();
}

uint64_t aks_create_escrow_bag_with_auth()
{
  return MEMORY[0x18960D218]();
}

uint64_t aks_generation()
{
  return MEMORY[0x18960D220]();
}

uint64_t aks_get_bag_uuid()
{
  return MEMORY[0x18960D228]();
}

uint64_t aks_get_configuration()
{
  return MEMORY[0x18960D230]();
}

uint64_t aks_get_current_sep_measurement()
{
  return MEMORY[0x18960D238]();
}

uint64_t aks_get_device_state()
{
  return MEMORY[0x18960D240]();
}

uint64_t aks_get_extended_device_state()
{
  return MEMORY[0x18960D248]();
}

uint64_t aks_get_lock_state()
{
  return MEMORY[0x18960D250]();
}

uint64_t aks_get_system()
{
  return MEMORY[0x18960D258]();
}

uint64_t aks_load_bag()
{
  return MEMORY[0x18960D270]();
}

uint64_t aks_lock_bag()
{
  return MEMORY[0x18960D278]();
}

uint64_t aks_lock_device()
{
  return MEMORY[0x18960D280]();
}

uint64_t aks_memento_efface_blob()
{
  return MEMORY[0x18960D290]();
}

uint64_t aks_memento_get_state()
{
  return MEMORY[0x18960D298]();
}

uint64_t aks_migrate_s_key()
{
  return MEMORY[0x18960D2A0]();
}

uint64_t aks_obliterate_class_d()
{
  return MEMORY[0x18960D2A8]();
}

uint64_t aks_prederived_change_secret()
{
  return MEMORY[0x18960D2D8]();
}

uint64_t aks_prederived_create()
{
  return MEMORY[0x18960D2E0]();
}

uint64_t aks_prederived_free()
{
  return MEMORY[0x18960D2E8]();
}

uint64_t aks_prederived_is_enabled()
{
  return MEMORY[0x18960D2F0]();
}

uint64_t aks_prederived_unlock_keybag()
{
  return MEMORY[0x18960D2F8]();
}

uint64_t aks_prewarm_sps()
{
  return MEMORY[0x18960D300]();
}

uint64_t aks_recover_with_escrow_bag()
{
  return MEMORY[0x18960D308]();
}

uint64_t aks_save_bag()
{
  return MEMORY[0x18960D398]();
}

uint64_t aks_set_configuration()
{
  return MEMORY[0x18960D3B0]();
}

uint64_t aks_set_keybag_for_volume_with_cookie()
{
  return MEMORY[0x18960D3B8]();
}

uint64_t aks_set_keybag_for_volume_with_cookie_persona()
{
  return MEMORY[0x18960D3C0]();
}

uint64_t aks_set_system()
{
  return MEMORY[0x18960D3C8]();
}

uint64_t aks_set_system_with_passcode()
{
  return MEMORY[0x18960D3D0]();
}

uint64_t aks_stash_enable()
{
  return MEMORY[0x18960D3E0]();
}

uint64_t aks_stash_load()
{
  return MEMORY[0x18960D3E8]();
}

uint64_t aks_stash_persist()
{
  return MEMORY[0x18960D3F0]();
}

uint64_t aks_unload_bag()
{
  return MEMORY[0x18960D420]();
}

uint64_t aks_unload_session_bags()
{
  return MEMORY[0x18960D428]();
}

uint64_t aks_unlock_bag()
{
  return MEMORY[0x18960D430]();
}

uint64_t aks_unlock_device()
{
  return MEMORY[0x18960D438]();
}

uint64_t aks_unwrap_key()
{
  return MEMORY[0x18960D440]();
}

uint64_t aks_verify_password()
{
  return MEMORY[0x18960D448]();
}

uint64_t aks_verify_password_memento()
{
  return MEMORY[0x18960D450]();
}

uint64_t aks_wrap_key()
{
  return MEMORY[0x18960D458]();
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x18960DAC8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1895F9760]();
}

uint64_t ccaes_xts_decrypt_mode()
{
  return MEMORY[0x1895F97A0]();
}

uint64_t cccmac_final_generate()
{
  return MEMORY[0x1895F9850]();
}

uint64_t cccmac_init()
{
  return MEMORY[0x1895F9858]();
}

uint64_t cccmac_update()
{
  return MEMORY[0x1895F9860]();
}

uint64_t ccder_decode_len()
{
  return MEMORY[0x1895F9940]();
}

uint64_t ccder_decode_tag()
{
  return MEMORY[0x1895F9968]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB270](*(void *)&a1, a2, a3, *(void *)&a4);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1895FB778](*(void *)&host, multiuser_flags);
}

kern_return_t host_set_multiuser_config_flags(host_priv_t host_priv, uint32_t multiuser_flags)
{
  return MEMORY[0x1895FB798](*(void *)&host_priv, *(void *)&multiuser_flags);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1895FBBA8](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FC7B0](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FCBA0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1895FCD68](a1, a2, *(void *)&a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FD108](__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FD4B8](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1895FD548](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1895FD5D0]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1895FDA60]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1895FE0E8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1895FE0F0]();
}

uint64_t objc_msgSend_ChangeSystemSecretWithEscrow_FromOldPasscode_ToNew_withOpaqueDats_withKeepState_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_ChangeSystemSecretWithEscrow_FromOldPasscode_ToNew_withOpaqueDats_withKeepState_);
}

uint64_t objc_msgSend_addPersonaKeyForUserSession_withSecret_withPersonaUUIDString_forPath_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_addPersonaKeyForUserSession_withSecret_withPersonaUUIDString_forPath_);
}

uint64_t objc_msgSend_changeClassKeysGenerationWithSecret_secretSize_generationOption_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_changeClassKeysGenerationWithSecret_secretSize_generationOption_reply_);
}

uint64_t objc_msgSend_changeSystemSecretWithEscrow_fromOldSecret_oldSize_toNewSecret_newSize_opaqueData_keepstate_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_changeSystemSecretWithEscrow_fromOldSecret_oldSize_toNewSecret_newSize_opaqueData_keepstate_reply_);
}

uint64_t objc_msgSend_changeSystemSecretfromOldSecret_oldSize_toNewSecret_newSize_opaqueData_withParams_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_changeSystemSecretfromOldSecret_oldSize_toNewSecret_newSize_opaqueData_withParams_reply_);
}

uint64_t objc_msgSend_createKeybagForUserSession_withSessionUID_WithSecret_secretSize_withGracePeriod_withOpaqeStuff_withReply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createKeybagForUserSession_withSessionUID_WithSecret_secretSize_withGracePeriod_withOpaqeStuff_withReply_);
}

uint64_t objc_msgSend_createKeybagForUserSession_withSessionUID_WithSecret_withGracePeriod_withOpaqeStuff_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createKeybagForUserSession_withSessionUID_WithSecret_withGracePeriod_withOpaqeStuff_);
}

uint64_t objc_msgSend_createPersonaKeyForUserSession_forPath_withUID_WithSecret_secretSize_withReply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_createPersonaKeyForUserSession_forPath_withUID_WithSecret_secretSize_withReply_);
}

uint64_t objc_msgSend_loadKeybagForUserSession_withSessionID_withSecret_secretSize_shouldSetGracePeriod_withGracePeriod_isInEarlyStar_withReply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_loadKeybagForUserSession_withSessionID_withSecret_secretSize_shouldSetGracePeriod_withGracePeriod_isInEarlyStar_withReply_);
}

uint64_t objc_msgSend_loadKeybagForUserSession_withSessionID_withSecret_shouldSetGracePeriod_withGracePeriod_isInEarlyStar_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_loadKeybagForUserSession_withSessionID_withSecret_shouldSetGracePeriod_withGracePeriod_isInEarlyStar_);
}

uint64_t objc_msgSend_removePersonaKeyForUserSession_withPersonaUUIDString_withVolumeUUIDString_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_removePersonaKeyForUserSession_withPersonaUUIDString_withVolumeUUIDString_);
}

uint64_t objc_msgSend_removePersonaKeyForUserSession_withUID_withVolumeUUIDString_withReply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_removePersonaKeyForUserSession_withUID_withVolumeUUIDString_withReply_);
}